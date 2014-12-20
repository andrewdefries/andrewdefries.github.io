---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.904155, 0.2370476, -1.898032, 1, 0, 0, 1,
-2.78205, 0.3750079, -2.617135, 1, 0.007843138, 0, 1,
-2.575389, -0.3948949, -1.44132, 1, 0.01176471, 0, 1,
-2.548757, 0.137327, -0.800348, 1, 0.01960784, 0, 1,
-2.487392, -1.130327, -3.100267, 1, 0.02352941, 0, 1,
-2.449269, -0.3069598, -1.350549, 1, 0.03137255, 0, 1,
-2.387773, -1.048986, -2.143331, 1, 0.03529412, 0, 1,
-2.368002, -0.434715, 0.1206107, 1, 0.04313726, 0, 1,
-2.298383, -0.2850966, -2.072498, 1, 0.04705882, 0, 1,
-2.260438, -0.2236618, 0.03514822, 1, 0.05490196, 0, 1,
-2.229939, -0.779686, -3.416637, 1, 0.05882353, 0, 1,
-2.213572, 0.2373217, -2.241468, 1, 0.06666667, 0, 1,
-2.192135, 0.3399539, -1.552433, 1, 0.07058824, 0, 1,
-2.186228, -1.205488, -0.9282609, 1, 0.07843138, 0, 1,
-2.182562, 0.6844647, -1.908172, 1, 0.08235294, 0, 1,
-2.164587, -0.1164293, -1.005288, 1, 0.09019608, 0, 1,
-2.160878, -1.266525, -1.394425, 1, 0.09411765, 0, 1,
-2.160445, -1.41751, -2.840791, 1, 0.1019608, 0, 1,
-2.149538, 0.7510876, -1.331419, 1, 0.1098039, 0, 1,
-2.142277, -0.5456455, -0.3449017, 1, 0.1137255, 0, 1,
-2.117744, 0.7023076, -0.9640716, 1, 0.1215686, 0, 1,
-2.099941, 0.2005044, -0.6920047, 1, 0.1254902, 0, 1,
-2.075688, 0.6339957, -0.2415828, 1, 0.1333333, 0, 1,
-2.044945, -1.477942, -1.851955, 1, 0.1372549, 0, 1,
-2.028077, 0.8976557, -0.4628178, 1, 0.145098, 0, 1,
-2.010355, 2.244533, 0.06369467, 1, 0.1490196, 0, 1,
-1.993845, 0.8436669, -1.574214, 1, 0.1568628, 0, 1,
-1.990247, -0.5455872, -3.555721, 1, 0.1607843, 0, 1,
-1.927302, -0.4473027, -2.12812, 1, 0.1686275, 0, 1,
-1.910343, 0.2032069, -3.369287, 1, 0.172549, 0, 1,
-1.905479, -0.8155719, -3.148331, 1, 0.1803922, 0, 1,
-1.901849, -1.959081, -1.438758, 1, 0.1843137, 0, 1,
-1.891729, 0.6272986, -2.342199, 1, 0.1921569, 0, 1,
-1.891019, 1.320561, -2.553109, 1, 0.1960784, 0, 1,
-1.872173, -1.302425, -2.330059, 1, 0.2039216, 0, 1,
-1.869581, -0.03866302, -1.626008, 1, 0.2117647, 0, 1,
-1.838136, 1.197858, 0.05903681, 1, 0.2156863, 0, 1,
-1.815229, -1.848079, -1.244222, 1, 0.2235294, 0, 1,
-1.798801, -0.1998224, -1.49938, 1, 0.227451, 0, 1,
-1.787219, -0.5970077, -2.194925, 1, 0.2352941, 0, 1,
-1.785834, 0.3084599, -0.9140957, 1, 0.2392157, 0, 1,
-1.73443, 1.495957, -0.9833349, 1, 0.2470588, 0, 1,
-1.726784, 0.5163484, -2.74504, 1, 0.2509804, 0, 1,
-1.722037, -0.3741958, -3.439677, 1, 0.2588235, 0, 1,
-1.721466, 0.4613546, -1.136138, 1, 0.2627451, 0, 1,
-1.719374, 0.3111888, -0.2933934, 1, 0.2705882, 0, 1,
-1.702388, -0.3258511, -2.671891, 1, 0.2745098, 0, 1,
-1.69686, -1.121791, -2.777759, 1, 0.282353, 0, 1,
-1.672397, -0.5559506, -1.385434, 1, 0.2862745, 0, 1,
-1.671908, -0.9786251, -3.665448, 1, 0.2941177, 0, 1,
-1.671421, 0.821592, -0.5937023, 1, 0.3019608, 0, 1,
-1.670706, -0.6342791, -1.778643, 1, 0.3058824, 0, 1,
-1.66552, 1.008788, -1.005072, 1, 0.3137255, 0, 1,
-1.631482, -1.197822, -2.654374, 1, 0.3176471, 0, 1,
-1.629928, -1.531319, -2.878314, 1, 0.3254902, 0, 1,
-1.62585, -0.3770087, -3.450864, 1, 0.3294118, 0, 1,
-1.625823, 0.003557184, -1.463404, 1, 0.3372549, 0, 1,
-1.624657, 0.6095598, -1.135472, 1, 0.3411765, 0, 1,
-1.612721, 0.1192191, -1.702888, 1, 0.3490196, 0, 1,
-1.604348, -0.907968, -0.8272707, 1, 0.3529412, 0, 1,
-1.604115, -0.1480608, -1.31498, 1, 0.3607843, 0, 1,
-1.603098, 1.855182, -0.6088559, 1, 0.3647059, 0, 1,
-1.597003, 0.08447802, -0.9909663, 1, 0.372549, 0, 1,
-1.594216, 0.6179903, 0.1675587, 1, 0.3764706, 0, 1,
-1.593181, 1.255293, -1.288012, 1, 0.3843137, 0, 1,
-1.586591, -1.185506, -2.363243, 1, 0.3882353, 0, 1,
-1.565049, 0.08659502, -0.6977767, 1, 0.3960784, 0, 1,
-1.563163, -0.8113763, -1.565563, 1, 0.4039216, 0, 1,
-1.549883, -0.2171085, -2.62122, 1, 0.4078431, 0, 1,
-1.54676, -0.4709695, -1.530319, 1, 0.4156863, 0, 1,
-1.507463, -0.5600914, -1.528658, 1, 0.4196078, 0, 1,
-1.490812, 2.059267, 0.5949943, 1, 0.427451, 0, 1,
-1.485963, 0.4259052, -0.3742582, 1, 0.4313726, 0, 1,
-1.481335, -0.05555155, -1.119697, 1, 0.4392157, 0, 1,
-1.47702, -0.6397022, -3.032361, 1, 0.4431373, 0, 1,
-1.476802, 1.535194, 0.2752692, 1, 0.4509804, 0, 1,
-1.46833, 0.6907046, -1.208801, 1, 0.454902, 0, 1,
-1.467818, -0.05707036, -0.9187994, 1, 0.4627451, 0, 1,
-1.462923, 0.3582515, -1.865823, 1, 0.4666667, 0, 1,
-1.462012, -1.40097, -1.625966, 1, 0.4745098, 0, 1,
-1.457079, -0.2565013, -1.33756, 1, 0.4784314, 0, 1,
-1.455985, 1.06525, 0.03498263, 1, 0.4862745, 0, 1,
-1.448973, 0.2871895, -3.209297, 1, 0.4901961, 0, 1,
-1.443969, -0.5081742, -1.878931, 1, 0.4980392, 0, 1,
-1.443181, 0.01011025, -1.105004, 1, 0.5058824, 0, 1,
-1.424628, 0.9225831, 0.3058417, 1, 0.509804, 0, 1,
-1.421732, 2.536604, -2.104138, 1, 0.5176471, 0, 1,
-1.419619, 2.705565, 0.6831305, 1, 0.5215687, 0, 1,
-1.418429, -1.968886, -2.839118, 1, 0.5294118, 0, 1,
-1.413179, 0.6010702, 0.1031796, 1, 0.5333334, 0, 1,
-1.401922, -0.7011169, -1.756108, 1, 0.5411765, 0, 1,
-1.381206, -1.266042, -2.823324, 1, 0.5450981, 0, 1,
-1.378212, 1.573303, 0.5799922, 1, 0.5529412, 0, 1,
-1.377749, -2.012812, -2.101323, 1, 0.5568628, 0, 1,
-1.375606, 0.2677809, -2.29123, 1, 0.5647059, 0, 1,
-1.365276, -0.2820708, -3.154979, 1, 0.5686275, 0, 1,
-1.362401, 0.1710284, -3.064903, 1, 0.5764706, 0, 1,
-1.361821, -1.504975, -4.425585, 1, 0.5803922, 0, 1,
-1.360131, -1.065484, -3.11599, 1, 0.5882353, 0, 1,
-1.35814, -0.8084882, -1.184075, 1, 0.5921569, 0, 1,
-1.340462, -1.168645, -1.467139, 1, 0.6, 0, 1,
-1.337653, 0.1180311, -2.288197, 1, 0.6078432, 0, 1,
-1.336191, -1.004377, -1.251245, 1, 0.6117647, 0, 1,
-1.329656, 0.7412972, -0.9190234, 1, 0.6196079, 0, 1,
-1.322947, 1.051371, -0.3719631, 1, 0.6235294, 0, 1,
-1.322621, -0.3243313, -1.913192, 1, 0.6313726, 0, 1,
-1.321908, -1.13785, -1.303171, 1, 0.6352941, 0, 1,
-1.316026, -0.7803455, -2.219379, 1, 0.6431373, 0, 1,
-1.312738, 1.223765, -0.8069282, 1, 0.6470588, 0, 1,
-1.309697, -0.1096422, -3.187327, 1, 0.654902, 0, 1,
-1.302046, -0.742134, -2.730329, 1, 0.6588235, 0, 1,
-1.292806, -0.5208996, -1.534795, 1, 0.6666667, 0, 1,
-1.29001, -0.9124403, -1.001736, 1, 0.6705883, 0, 1,
-1.289192, -0.8592192, -1.160452, 1, 0.6784314, 0, 1,
-1.277674, -0.7683104, -1.702645, 1, 0.682353, 0, 1,
-1.277482, -0.7905405, -1.722308, 1, 0.6901961, 0, 1,
-1.273803, 0.1604394, -1.880631, 1, 0.6941177, 0, 1,
-1.264837, 1.083272, -0.526181, 1, 0.7019608, 0, 1,
-1.264547, -0.9684275, -3.016062, 1, 0.7098039, 0, 1,
-1.251513, -0.9613631, -2.394752, 1, 0.7137255, 0, 1,
-1.249589, 0.5959119, -0.9200231, 1, 0.7215686, 0, 1,
-1.24477, 0.006738949, -2.218576, 1, 0.7254902, 0, 1,
-1.241488, 0.7059148, 0.3587189, 1, 0.7333333, 0, 1,
-1.240785, 0.5452223, -1.436663, 1, 0.7372549, 0, 1,
-1.235875, 0.416942, -1.024118, 1, 0.7450981, 0, 1,
-1.23454, -0.8048052, -2.666662, 1, 0.7490196, 0, 1,
-1.22913, 0.645597, -1.573132, 1, 0.7568628, 0, 1,
-1.227765, 0.4524633, -0.4404621, 1, 0.7607843, 0, 1,
-1.22432, 0.3475401, -2.798558, 1, 0.7686275, 0, 1,
-1.211457, 0.2179578, -1.864237, 1, 0.772549, 0, 1,
-1.210892, -1.079894, -3.150959, 1, 0.7803922, 0, 1,
-1.208904, -0.9071724, -3.212018, 1, 0.7843137, 0, 1,
-1.201406, 1.556778, -1.281303, 1, 0.7921569, 0, 1,
-1.185877, 1.107965, 0.116412, 1, 0.7960784, 0, 1,
-1.181451, 1.088013, -0.9428363, 1, 0.8039216, 0, 1,
-1.176244, -0.1452805, -2.144043, 1, 0.8117647, 0, 1,
-1.172153, 1.529013, -0.7398694, 1, 0.8156863, 0, 1,
-1.16605, -0.3898122, -2.249193, 1, 0.8235294, 0, 1,
-1.165758, 1.468273, -0.0289584, 1, 0.827451, 0, 1,
-1.165387, -0.1120987, -1.689634, 1, 0.8352941, 0, 1,
-1.158417, 0.7354866, 0.5912596, 1, 0.8392157, 0, 1,
-1.157854, -0.7096937, -2.312005, 1, 0.8470588, 0, 1,
-1.157701, 0.6858628, -0.1343908, 1, 0.8509804, 0, 1,
-1.157547, -0.1591353, -1.65996, 1, 0.8588235, 0, 1,
-1.154308, -1.690054, -2.135761, 1, 0.8627451, 0, 1,
-1.142234, -0.6017191, -0.5041445, 1, 0.8705882, 0, 1,
-1.135612, -0.4492662, -1.374237, 1, 0.8745098, 0, 1,
-1.120646, -1.232785, -1.63567, 1, 0.8823529, 0, 1,
-1.120104, -1.190838, -2.300869, 1, 0.8862745, 0, 1,
-1.119794, 0.2020693, -0.5783893, 1, 0.8941177, 0, 1,
-1.117635, -0.3734133, -3.397286, 1, 0.8980392, 0, 1,
-1.114909, -0.9214227, -1.149003, 1, 0.9058824, 0, 1,
-1.113837, -0.04458664, -2.131148, 1, 0.9137255, 0, 1,
-1.111086, -0.3478542, -1.385517, 1, 0.9176471, 0, 1,
-1.094009, -1.539197, -2.655193, 1, 0.9254902, 0, 1,
-1.093213, -1.814859, -3.559769, 1, 0.9294118, 0, 1,
-1.085268, -0.5380806, -1.390431, 1, 0.9372549, 0, 1,
-1.077354, -1.321272, -0.201042, 1, 0.9411765, 0, 1,
-1.076274, 0.01144054, 0.8035784, 1, 0.9490196, 0, 1,
-1.075407, 0.4302354, -2.239965, 1, 0.9529412, 0, 1,
-1.072524, -0.03573892, -0.3957678, 1, 0.9607843, 0, 1,
-1.069474, 1.062724, 1.378212, 1, 0.9647059, 0, 1,
-1.065653, -0.8059242, -1.111117, 1, 0.972549, 0, 1,
-1.059095, -0.6342279, -4.156045, 1, 0.9764706, 0, 1,
-1.053292, -1.181194, -0.9417198, 1, 0.9843137, 0, 1,
-1.052422, 0.296059, -1.990848, 1, 0.9882353, 0, 1,
-1.048529, 1.050859, -0.7458928, 1, 0.9960784, 0, 1,
-1.041331, -0.7430275, -1.527087, 0.9960784, 1, 0, 1,
-1.033771, -0.3522321, -1.393042, 0.9921569, 1, 0, 1,
-1.03127, -0.8622231, -1.303161, 0.9843137, 1, 0, 1,
-1.026479, -1.69527, -2.026039, 0.9803922, 1, 0, 1,
-1.021609, 0.4251288, -3.820171, 0.972549, 1, 0, 1,
-1.017041, 1.183042, -0.9604267, 0.9686275, 1, 0, 1,
-1.016399, 1.209893, -3.110725, 0.9607843, 1, 0, 1,
-1.013276, -1.416923, -2.492056, 0.9568627, 1, 0, 1,
-1.012961, 0.4611862, -2.329374, 0.9490196, 1, 0, 1,
-1.009196, -0.3960307, -1.47446, 0.945098, 1, 0, 1,
-1.007882, -1.716447, -3.660728, 0.9372549, 1, 0, 1,
-1.002805, 0.952362, -2.370018, 0.9333333, 1, 0, 1,
-1.001406, 0.9477317, -0.7207814, 0.9254902, 1, 0, 1,
-0.9980928, 0.1464508, -0.7047173, 0.9215686, 1, 0, 1,
-0.9942107, 0.111817, -1.100575, 0.9137255, 1, 0, 1,
-0.9922873, -0.2238625, -1.557272, 0.9098039, 1, 0, 1,
-0.987218, 0.6746417, -0.644851, 0.9019608, 1, 0, 1,
-0.964743, -2.043346, -2.267957, 0.8941177, 1, 0, 1,
-0.9637569, 1.035167, 0.5411832, 0.8901961, 1, 0, 1,
-0.9600976, -0.6979114, -3.108623, 0.8823529, 1, 0, 1,
-0.9598216, -1.423254, -3.218776, 0.8784314, 1, 0, 1,
-0.9572775, -1.185876, -3.980663, 0.8705882, 1, 0, 1,
-0.9489308, -0.7750667, -2.636313, 0.8666667, 1, 0, 1,
-0.9361987, 0.3295047, -2.328447, 0.8588235, 1, 0, 1,
-0.932888, -0.7439111, -2.409037, 0.854902, 1, 0, 1,
-0.9305466, -2.06671, -2.624482, 0.8470588, 1, 0, 1,
-0.9280495, -0.7638834, -1.709894, 0.8431373, 1, 0, 1,
-0.9230964, 0.7983094, 0.149726, 0.8352941, 1, 0, 1,
-0.9209403, -1.017049, -1.457349, 0.8313726, 1, 0, 1,
-0.9207264, 0.7475895, 0.5569415, 0.8235294, 1, 0, 1,
-0.9149674, -0.06858897, -2.773538, 0.8196079, 1, 0, 1,
-0.9146433, -2.20421, -1.006093, 0.8117647, 1, 0, 1,
-0.9144132, 0.07174372, -1.512094, 0.8078431, 1, 0, 1,
-0.912836, 0.20939, -0.4198449, 0.8, 1, 0, 1,
-0.9114828, 1.239509, -0.806938, 0.7921569, 1, 0, 1,
-0.9103578, -0.4141138, -2.489521, 0.7882353, 1, 0, 1,
-0.901605, 0.8434759, -0.5231136, 0.7803922, 1, 0, 1,
-0.8975121, -0.6525832, -2.303436, 0.7764706, 1, 0, 1,
-0.8923247, 0.7314485, -0.6953388, 0.7686275, 1, 0, 1,
-0.8881631, 0.1689621, -1.400509, 0.7647059, 1, 0, 1,
-0.884866, 0.04603913, -1.410633, 0.7568628, 1, 0, 1,
-0.8822099, -1.817621, -2.736747, 0.7529412, 1, 0, 1,
-0.8821045, 1.696159, -1.32398, 0.7450981, 1, 0, 1,
-0.8733996, 0.9457272, 1.309464, 0.7411765, 1, 0, 1,
-0.8651708, 0.5874235, 0.3498844, 0.7333333, 1, 0, 1,
-0.8440667, 0.8971316, 1.503299, 0.7294118, 1, 0, 1,
-0.8434856, -1.014112, -2.913468, 0.7215686, 1, 0, 1,
-0.8414443, -1.60649, -5.041248, 0.7176471, 1, 0, 1,
-0.8278156, -2.045485, -2.857207, 0.7098039, 1, 0, 1,
-0.8271055, 0.1096724, -0.2378977, 0.7058824, 1, 0, 1,
-0.8246142, -0.08026765, -1.458211, 0.6980392, 1, 0, 1,
-0.8228678, -0.07000712, -2.013974, 0.6901961, 1, 0, 1,
-0.8183833, 0.3296347, -1.660855, 0.6862745, 1, 0, 1,
-0.8171911, -0.1361858, -1.960652, 0.6784314, 1, 0, 1,
-0.8151178, -0.8961784, -1.952904, 0.6745098, 1, 0, 1,
-0.8114671, -0.03549803, -2.262816, 0.6666667, 1, 0, 1,
-0.8060411, -0.2815048, 0.2526906, 0.6627451, 1, 0, 1,
-0.8058291, -0.1751312, -3.712435, 0.654902, 1, 0, 1,
-0.8044143, 0.2756192, -0.1659397, 0.6509804, 1, 0, 1,
-0.797504, -2.400473, -1.687083, 0.6431373, 1, 0, 1,
-0.7960849, 0.2969234, -1.47172, 0.6392157, 1, 0, 1,
-0.7942386, -0.01741659, -0.59115, 0.6313726, 1, 0, 1,
-0.790625, 0.3684, 1.057669, 0.627451, 1, 0, 1,
-0.7882876, 0.5461177, -1.391675, 0.6196079, 1, 0, 1,
-0.7878899, -0.4561443, -0.6278222, 0.6156863, 1, 0, 1,
-0.7799863, -0.5652876, -2.110474, 0.6078432, 1, 0, 1,
-0.7775081, -0.6902094, -1.002729, 0.6039216, 1, 0, 1,
-0.7774239, 0.7431465, -1.055768, 0.5960785, 1, 0, 1,
-0.7751005, -1.016792, -1.797871, 0.5882353, 1, 0, 1,
-0.768485, 0.2863606, -2.125398, 0.5843138, 1, 0, 1,
-0.7680432, 1.092399, -1.960954, 0.5764706, 1, 0, 1,
-0.7662942, 1.268138, 0.963596, 0.572549, 1, 0, 1,
-0.764439, 0.250979, -1.515787, 0.5647059, 1, 0, 1,
-0.7515787, 1.181466, -1.407491, 0.5607843, 1, 0, 1,
-0.7485739, -1.113373, -2.383769, 0.5529412, 1, 0, 1,
-0.7430338, -0.2055623, -1.295892, 0.5490196, 1, 0, 1,
-0.7350665, 0.8317885, 0.887553, 0.5411765, 1, 0, 1,
-0.7340506, 0.04499184, -2.186686, 0.5372549, 1, 0, 1,
-0.7251258, -0.6237602, -0.8596581, 0.5294118, 1, 0, 1,
-0.7217426, -0.4547694, -1.103387, 0.5254902, 1, 0, 1,
-0.7178121, -1.61448, -1.721876, 0.5176471, 1, 0, 1,
-0.7108904, 0.05460963, -1.171474, 0.5137255, 1, 0, 1,
-0.7091554, 1.052064, -1.51191, 0.5058824, 1, 0, 1,
-0.7075687, -1.234133, -4.026368, 0.5019608, 1, 0, 1,
-0.7064757, 0.5484589, -2.213839, 0.4941176, 1, 0, 1,
-0.7046601, -0.8963202, -0.5096213, 0.4862745, 1, 0, 1,
-0.6882496, 0.45924, 0.1348615, 0.4823529, 1, 0, 1,
-0.6821717, -0.3419701, -2.41659, 0.4745098, 1, 0, 1,
-0.6796826, 1.267211, -1.471957, 0.4705882, 1, 0, 1,
-0.6760013, -0.4651004, -2.848488, 0.4627451, 1, 0, 1,
-0.6724796, -0.382887, -3.029466, 0.4588235, 1, 0, 1,
-0.6715044, -0.3156558, -0.4141898, 0.4509804, 1, 0, 1,
-0.6661891, -0.9575539, -2.006758, 0.4470588, 1, 0, 1,
-0.6660349, -0.7117712, -2.588497, 0.4392157, 1, 0, 1,
-0.6635296, -0.3384303, -0.6746682, 0.4352941, 1, 0, 1,
-0.6501242, 0.9810523, -0.4051309, 0.427451, 1, 0, 1,
-0.6491324, 0.3749351, -1.850286, 0.4235294, 1, 0, 1,
-0.6422398, -0.05794131, -1.381194, 0.4156863, 1, 0, 1,
-0.6351588, 1.474177, 1.160626, 0.4117647, 1, 0, 1,
-0.6290326, 0.2249657, -1.248571, 0.4039216, 1, 0, 1,
-0.626402, -1.50991, -3.7334, 0.3960784, 1, 0, 1,
-0.6251912, -0.1034375, -3.201766, 0.3921569, 1, 0, 1,
-0.6236001, -0.1743984, -1.71643, 0.3843137, 1, 0, 1,
-0.6216834, -1.711395, -2.864879, 0.3803922, 1, 0, 1,
-0.6187902, -1.025467, -2.452821, 0.372549, 1, 0, 1,
-0.6156455, 0.1900632, -0.3114598, 0.3686275, 1, 0, 1,
-0.6123115, -1.709047, -3.487544, 0.3607843, 1, 0, 1,
-0.6115783, -0.232591, -1.108213, 0.3568628, 1, 0, 1,
-0.607492, 0.9405991, -0.277526, 0.3490196, 1, 0, 1,
-0.5987156, -1.639966, -2.894166, 0.345098, 1, 0, 1,
-0.5965291, 0.1772557, -0.01383748, 0.3372549, 1, 0, 1,
-0.5929321, 0.7048859, -0.1837227, 0.3333333, 1, 0, 1,
-0.5911933, 0.5294454, -2.259433, 0.3254902, 1, 0, 1,
-0.5909443, -0.3062054, -1.344204, 0.3215686, 1, 0, 1,
-0.5881688, 0.2224214, -2.961415, 0.3137255, 1, 0, 1,
-0.5855473, -0.6042533, -2.764881, 0.3098039, 1, 0, 1,
-0.5852348, -0.3423486, -1.757388, 0.3019608, 1, 0, 1,
-0.5826536, -0.8243814, -3.156532, 0.2941177, 1, 0, 1,
-0.5814657, -0.593969, -2.484613, 0.2901961, 1, 0, 1,
-0.5807863, -1.011775, -2.105361, 0.282353, 1, 0, 1,
-0.5807046, -0.5447978, -3.963524, 0.2784314, 1, 0, 1,
-0.5760674, 0.1496349, -2.003265, 0.2705882, 1, 0, 1,
-0.5747464, -0.4843588, -1.780353, 0.2666667, 1, 0, 1,
-0.5736933, 0.6463518, 1.908183, 0.2588235, 1, 0, 1,
-0.5735276, -0.9952582, -2.672329, 0.254902, 1, 0, 1,
-0.5732464, -1.187003, -3.621636, 0.2470588, 1, 0, 1,
-0.5729234, 2.129132, -1.808644, 0.2431373, 1, 0, 1,
-0.5708026, -0.2260278, -0.7458417, 0.2352941, 1, 0, 1,
-0.5693541, 0.06561341, -0.6009082, 0.2313726, 1, 0, 1,
-0.5666277, 1.377471, -0.1158585, 0.2235294, 1, 0, 1,
-0.5660085, -0.5687411, -1.77789, 0.2196078, 1, 0, 1,
-0.5655804, -0.3156481, -2.573992, 0.2117647, 1, 0, 1,
-0.5629095, -0.7292996, -3.230033, 0.2078431, 1, 0, 1,
-0.5627904, 1.732372, 0.481883, 0.2, 1, 0, 1,
-0.5582354, -1.831453, -2.164939, 0.1921569, 1, 0, 1,
-0.5579025, 1.745622, -1.582242, 0.1882353, 1, 0, 1,
-0.555478, 0.5739294, -1.507609, 0.1803922, 1, 0, 1,
-0.5527262, 0.411509, -0.972412, 0.1764706, 1, 0, 1,
-0.5495794, 1.780511, 0.9125539, 0.1686275, 1, 0, 1,
-0.5376056, 0.2133341, -0.4522244, 0.1647059, 1, 0, 1,
-0.5357497, 0.8553544, -2.024738, 0.1568628, 1, 0, 1,
-0.5330906, 1.809763, -0.8619048, 0.1529412, 1, 0, 1,
-0.5283849, 0.043577, -0.8705727, 0.145098, 1, 0, 1,
-0.5251033, -1.007905, -1.487275, 0.1411765, 1, 0, 1,
-0.5243136, 0.3180302, -0.8635737, 0.1333333, 1, 0, 1,
-0.5210355, -1.372267, -3.462491, 0.1294118, 1, 0, 1,
-0.5187191, -0.1796604, -1.657837, 0.1215686, 1, 0, 1,
-0.5186963, -0.3654433, -2.943677, 0.1176471, 1, 0, 1,
-0.5186059, -1.295709, -4.10264, 0.1098039, 1, 0, 1,
-0.5146214, -0.7397804, -2.294668, 0.1058824, 1, 0, 1,
-0.513577, 0.7131011, -1.341937, 0.09803922, 1, 0, 1,
-0.5125443, 0.924232, -1.650953, 0.09019608, 1, 0, 1,
-0.5104247, 0.8155692, 0.01270815, 0.08627451, 1, 0, 1,
-0.5094445, -0.3740982, -1.940338, 0.07843138, 1, 0, 1,
-0.5089006, 0.9399449, -1.225884, 0.07450981, 1, 0, 1,
-0.5072329, -1.117442, -0.5733206, 0.06666667, 1, 0, 1,
-0.4945023, 0.5743941, -0.6248927, 0.0627451, 1, 0, 1,
-0.4918506, -0.3018159, -2.708025, 0.05490196, 1, 0, 1,
-0.4900831, -1.40586, -1.74294, 0.05098039, 1, 0, 1,
-0.4873241, 0.6447974, 0.4244563, 0.04313726, 1, 0, 1,
-0.4848473, 0.4568076, -2.047294, 0.03921569, 1, 0, 1,
-0.4802423, -0.2997333, -1.240316, 0.03137255, 1, 0, 1,
-0.4759288, 0.8314946, 1.616448, 0.02745098, 1, 0, 1,
-0.4701263, 0.816905, 0.5925898, 0.01960784, 1, 0, 1,
-0.4693898, 1.390785, -0.5864087, 0.01568628, 1, 0, 1,
-0.4670672, 0.5012049, -0.7259389, 0.007843138, 1, 0, 1,
-0.4661948, -0.5152257, -4.257929, 0.003921569, 1, 0, 1,
-0.4629557, -0.7365248, -2.962989, 0, 1, 0.003921569, 1,
-0.4608499, 0.6865777, -0.8190961, 0, 1, 0.01176471, 1,
-0.4596356, 0.1641367, -0.5494993, 0, 1, 0.01568628, 1,
-0.4584321, 0.1100648, -1.408288, 0, 1, 0.02352941, 1,
-0.4574297, 0.4024771, -1.756112, 0, 1, 0.02745098, 1,
-0.4567324, -0.3091671, -1.666183, 0, 1, 0.03529412, 1,
-0.4530231, 1.016354, -0.9438277, 0, 1, 0.03921569, 1,
-0.4517305, -1.865636, -1.688942, 0, 1, 0.04705882, 1,
-0.4515052, 1.040032, -1.005598, 0, 1, 0.05098039, 1,
-0.4502563, 0.760522, 0.3232016, 0, 1, 0.05882353, 1,
-0.4497801, 0.09233174, -1.340111, 0, 1, 0.0627451, 1,
-0.4479988, 0.7937417, 0.166055, 0, 1, 0.07058824, 1,
-0.4441157, -0.4036885, -2.787999, 0, 1, 0.07450981, 1,
-0.4433714, 0.581997, 0.7135772, 0, 1, 0.08235294, 1,
-0.4407192, 0.4730783, -1.689464, 0, 1, 0.08627451, 1,
-0.4406298, -0.2709424, -4.639575, 0, 1, 0.09411765, 1,
-0.4347213, 1.506139, 0.04890254, 0, 1, 0.1019608, 1,
-0.4298378, 2.330422, 0.4610191, 0, 1, 0.1058824, 1,
-0.4287885, 0.8455468, 1.246865, 0, 1, 0.1137255, 1,
-0.4278134, -0.1683251, -1.635809, 0, 1, 0.1176471, 1,
-0.421772, 0.8011697, -0.7575806, 0, 1, 0.1254902, 1,
-0.4207559, 0.9241313, -0.4783684, 0, 1, 0.1294118, 1,
-0.4204309, 0.1852055, -0.3688191, 0, 1, 0.1372549, 1,
-0.4186118, 0.5115625, -0.7345735, 0, 1, 0.1411765, 1,
-0.4146785, -0.6016999, -1.814289, 0, 1, 0.1490196, 1,
-0.4126212, -0.1169645, -1.292049, 0, 1, 0.1529412, 1,
-0.4107167, -0.108426, -2.184015, 0, 1, 0.1607843, 1,
-0.4094428, -0.5867648, -3.555681, 0, 1, 0.1647059, 1,
-0.3973927, -0.4390985, -2.054486, 0, 1, 0.172549, 1,
-0.3965434, -0.517847, -2.495701, 0, 1, 0.1764706, 1,
-0.3949171, 0.1743679, -1.879885, 0, 1, 0.1843137, 1,
-0.3928467, -0.6023713, -1.159585, 0, 1, 0.1882353, 1,
-0.3804531, 1.853583, -0.3400794, 0, 1, 0.1960784, 1,
-0.3768714, -0.8003154, -3.548502, 0, 1, 0.2039216, 1,
-0.3740403, -1.685949, -2.700789, 0, 1, 0.2078431, 1,
-0.3705014, 1.016946, 0.5419174, 0, 1, 0.2156863, 1,
-0.3692845, -0.4263464, -3.238102, 0, 1, 0.2196078, 1,
-0.3547669, -1.934314, -2.130707, 0, 1, 0.227451, 1,
-0.350774, -0.4316945, -0.4318503, 0, 1, 0.2313726, 1,
-0.3481685, 0.284718, -0.8921586, 0, 1, 0.2392157, 1,
-0.3470546, 0.3570125, -2.076578, 0, 1, 0.2431373, 1,
-0.344503, 0.5085658, -1.288021, 0, 1, 0.2509804, 1,
-0.3417322, -0.07706945, -2.094287, 0, 1, 0.254902, 1,
-0.3408057, 0.005456265, -1.266709, 0, 1, 0.2627451, 1,
-0.3384795, 0.005025787, -1.440676, 0, 1, 0.2666667, 1,
-0.335079, -1.382071, -3.495177, 0, 1, 0.2745098, 1,
-0.3316645, -0.8882461, -1.143272, 0, 1, 0.2784314, 1,
-0.3274789, -1.561038, -2.706907, 0, 1, 0.2862745, 1,
-0.3267291, 1.216973, -0.9596347, 0, 1, 0.2901961, 1,
-0.3235181, 1.689788, -0.9330305, 0, 1, 0.2980392, 1,
-0.3177531, 0.07625397, -1.830771, 0, 1, 0.3058824, 1,
-0.3158656, -0.1224841, -1.999964, 0, 1, 0.3098039, 1,
-0.3139697, -0.8598645, -3.078473, 0, 1, 0.3176471, 1,
-0.3128182, -0.08176746, -2.138651, 0, 1, 0.3215686, 1,
-0.3118021, 0.2437554, -0.2207956, 0, 1, 0.3294118, 1,
-0.3109308, -0.9773079, -4.359251, 0, 1, 0.3333333, 1,
-0.3054351, 0.7811906, -0.8481727, 0, 1, 0.3411765, 1,
-0.3048711, 0.8403872, -0.174608, 0, 1, 0.345098, 1,
-0.3014948, 0.6147705, 0.1216318, 0, 1, 0.3529412, 1,
-0.3006328, -0.1403753, -1.920533, 0, 1, 0.3568628, 1,
-0.3005559, -0.323611, -1.841433, 0, 1, 0.3647059, 1,
-0.2996822, -0.09597449, -0.5816026, 0, 1, 0.3686275, 1,
-0.2943681, -0.3093833, -2.864996, 0, 1, 0.3764706, 1,
-0.2916563, -0.420503, -2.709813, 0, 1, 0.3803922, 1,
-0.2823476, 1.712866, -2.570989, 0, 1, 0.3882353, 1,
-0.2801887, -1.154541, -3.7941, 0, 1, 0.3921569, 1,
-0.2789053, 0.5633671, -1.055161, 0, 1, 0.4, 1,
-0.2786652, 0.4244567, -1.569759, 0, 1, 0.4078431, 1,
-0.2767005, 0.8038481, -1.253355, 0, 1, 0.4117647, 1,
-0.2763808, 1.690565, -0.02959221, 0, 1, 0.4196078, 1,
-0.2664905, -0.8636391, -4.939766, 0, 1, 0.4235294, 1,
-0.2649542, -0.9003819, -2.815452, 0, 1, 0.4313726, 1,
-0.2611984, 1.662264, -0.4952839, 0, 1, 0.4352941, 1,
-0.2588699, 1.045852, -0.9423724, 0, 1, 0.4431373, 1,
-0.2506154, 0.5359042, -1.198446, 0, 1, 0.4470588, 1,
-0.2503208, -1.169523, -3.549299, 0, 1, 0.454902, 1,
-0.2486015, -0.3479179, -2.105032, 0, 1, 0.4588235, 1,
-0.2476999, -0.7519154, -3.761497, 0, 1, 0.4666667, 1,
-0.2432642, 1.258911, 0.151852, 0, 1, 0.4705882, 1,
-0.2424894, 1.996548, -0.9216983, 0, 1, 0.4784314, 1,
-0.2339766, 0.01261714, -1.53781, 0, 1, 0.4823529, 1,
-0.2326136, -0.5682697, -3.195391, 0, 1, 0.4901961, 1,
-0.2313096, -1.066415, -3.247756, 0, 1, 0.4941176, 1,
-0.230653, 1.485689, 0.5625294, 0, 1, 0.5019608, 1,
-0.2303814, -2.293206, -3.453486, 0, 1, 0.509804, 1,
-0.229945, 0.391553, -1.245926, 0, 1, 0.5137255, 1,
-0.2277209, -0.2835878, -1.905352, 0, 1, 0.5215687, 1,
-0.2274664, -0.383692, -3.74972, 0, 1, 0.5254902, 1,
-0.2146056, -1.717291, -3.391151, 0, 1, 0.5333334, 1,
-0.2050693, -0.7152835, -4.299386, 0, 1, 0.5372549, 1,
-0.2022915, -1.195274, -3.286516, 0, 1, 0.5450981, 1,
-0.1984331, 1.414889, -1.79016, 0, 1, 0.5490196, 1,
-0.1960206, -0.8870542, -2.564332, 0, 1, 0.5568628, 1,
-0.1943573, 1.553583, -0.7713724, 0, 1, 0.5607843, 1,
-0.191209, -1.533177, -2.813632, 0, 1, 0.5686275, 1,
-0.1897489, 0.196737, -2.263111, 0, 1, 0.572549, 1,
-0.1886616, -1.570636, -2.871604, 0, 1, 0.5803922, 1,
-0.1828258, 0.6766546, -0.2151034, 0, 1, 0.5843138, 1,
-0.179205, 0.9260927, 1.30959, 0, 1, 0.5921569, 1,
-0.1784925, -0.7585394, -3.382835, 0, 1, 0.5960785, 1,
-0.1780952, -0.07530882, -3.137695, 0, 1, 0.6039216, 1,
-0.176109, 0.1769897, -0.01526261, 0, 1, 0.6117647, 1,
-0.1749822, 0.8144232, -0.4152019, 0, 1, 0.6156863, 1,
-0.1739238, -0.3532071, -3.539577, 0, 1, 0.6235294, 1,
-0.1713656, -0.8503832, -3.4017, 0, 1, 0.627451, 1,
-0.1695672, 0.4557672, -1.031674, 0, 1, 0.6352941, 1,
-0.1592424, 0.9988316, -0.987509, 0, 1, 0.6392157, 1,
-0.1565016, -0.3885161, -3.795966, 0, 1, 0.6470588, 1,
-0.1556823, 0.4254526, -0.7539489, 0, 1, 0.6509804, 1,
-0.1552903, 0.3057672, 0.8840646, 0, 1, 0.6588235, 1,
-0.154597, 0.3523077, -0.2781465, 0, 1, 0.6627451, 1,
-0.1535334, -2.243321, -3.527076, 0, 1, 0.6705883, 1,
-0.1532639, -0.5862778, -2.390417, 0, 1, 0.6745098, 1,
-0.1494497, 1.352001, 0.8318845, 0, 1, 0.682353, 1,
-0.1487096, -0.6245952, -3.073461, 0, 1, 0.6862745, 1,
-0.146739, 0.2216758, -1.025032, 0, 1, 0.6941177, 1,
-0.1395344, -1.557123, -4.168522, 0, 1, 0.7019608, 1,
-0.1381709, 1.618141, 0.6403524, 0, 1, 0.7058824, 1,
-0.1379241, 0.370382, 0.8064332, 0, 1, 0.7137255, 1,
-0.1348947, 1.14913, -0.8773896, 0, 1, 0.7176471, 1,
-0.1333721, -1.093619, 0.6839172, 0, 1, 0.7254902, 1,
-0.1305519, -0.3451245, -3.177676, 0, 1, 0.7294118, 1,
-0.1291908, -0.9450784, -1.687823, 0, 1, 0.7372549, 1,
-0.12879, 0.09265597, -0.6045228, 0, 1, 0.7411765, 1,
-0.1270379, -0.8575428, -2.945747, 0, 1, 0.7490196, 1,
-0.1218157, -3.321357, -2.940026, 0, 1, 0.7529412, 1,
-0.1209445, -1.183597, -3.011947, 0, 1, 0.7607843, 1,
-0.1205173, 1.037336, 1.047292, 0, 1, 0.7647059, 1,
-0.1199659, -0.3429171, -4.44846, 0, 1, 0.772549, 1,
-0.1168781, -0.01386912, -1.759907, 0, 1, 0.7764706, 1,
-0.1165569, -0.4787846, -4.906675, 0, 1, 0.7843137, 1,
-0.1105739, 0.6926153, 1.967074, 0, 1, 0.7882353, 1,
-0.1063243, -0.2310296, -0.913632, 0, 1, 0.7960784, 1,
-0.1038355, 0.0530023, 1.545613, 0, 1, 0.8039216, 1,
-0.1029299, 0.4003313, 0.09007968, 0, 1, 0.8078431, 1,
-0.1015797, 0.4757214, -0.910975, 0, 1, 0.8156863, 1,
-0.09202044, 0.01193732, -1.394431, 0, 1, 0.8196079, 1,
-0.08988015, 0.08137643, 0.2595306, 0, 1, 0.827451, 1,
-0.08985872, -0.4596581, -3.656334, 0, 1, 0.8313726, 1,
-0.08974996, 0.8208988, 0.3621019, 0, 1, 0.8392157, 1,
-0.08827372, -0.3960615, -1.743971, 0, 1, 0.8431373, 1,
-0.06156451, 0.2461739, 1.368958, 0, 1, 0.8509804, 1,
-0.05815873, 0.2280579, -0.2563152, 0, 1, 0.854902, 1,
-0.05755113, -1.372023, -3.719622, 0, 1, 0.8627451, 1,
-0.05721316, -0.4351219, -2.481933, 0, 1, 0.8666667, 1,
-0.05391527, -1.418836, -4.11235, 0, 1, 0.8745098, 1,
-0.05132044, -0.721182, -1.627313, 0, 1, 0.8784314, 1,
-0.0509039, 0.4354585, -0.1912918, 0, 1, 0.8862745, 1,
-0.04942945, 1.120283, 0.4407521, 0, 1, 0.8901961, 1,
-0.04926436, -0.07622606, -2.072532, 0, 1, 0.8980392, 1,
-0.04845582, -0.5116864, -4.364057, 0, 1, 0.9058824, 1,
-0.04646917, 0.9414518, -0.3752277, 0, 1, 0.9098039, 1,
-0.04542881, 0.7105757, 0.5324516, 0, 1, 0.9176471, 1,
-0.04335281, -1.483577, -2.541728, 0, 1, 0.9215686, 1,
-0.04313065, -0.81961, -2.46286, 0, 1, 0.9294118, 1,
-0.03865432, -0.06679554, -1.116398, 0, 1, 0.9333333, 1,
-0.03828121, -1.172855, -3.968549, 0, 1, 0.9411765, 1,
-0.03644868, -1.240448, -1.441259, 0, 1, 0.945098, 1,
-0.03625553, -0.1522007, -3.239101, 0, 1, 0.9529412, 1,
-0.03531141, -0.0808861, -3.669555, 0, 1, 0.9568627, 1,
-0.03244869, 1.36644, -1.857582, 0, 1, 0.9647059, 1,
-0.03192942, 1.050859, -4.643482, 0, 1, 0.9686275, 1,
-0.03054036, -0.1918884, -2.456935, 0, 1, 0.9764706, 1,
-0.02691727, 1.962453, -0.1798278, 0, 1, 0.9803922, 1,
-0.02449969, -1.047575, -1.581037, 0, 1, 0.9882353, 1,
-0.02343025, 0.007645653, -1.42998, 0, 1, 0.9921569, 1,
-0.01674081, 0.4057961, 0.7446147, 0, 1, 1, 1,
-0.01071887, -1.174922, -4.815425, 0, 0.9921569, 1, 1,
-0.01054693, -1.492687, -3.117792, 0, 0.9882353, 1, 1,
-0.01022396, 0.4158685, 1.750834, 0, 0.9803922, 1, 1,
-0.008940008, 0.877486, 1.531003, 0, 0.9764706, 1, 1,
-0.008220899, -0.4308286, -4.391164, 0, 0.9686275, 1, 1,
-0.005520689, 0.933505, -0.6800891, 0, 0.9647059, 1, 1,
0.006710142, -0.954996, 3.300741, 0, 0.9568627, 1, 1,
0.00835184, 0.1418648, 0.5233963, 0, 0.9529412, 1, 1,
0.009954606, -0.2387105, 0.6149922, 0, 0.945098, 1, 1,
0.01502545, -0.6773754, 0.8677487, 0, 0.9411765, 1, 1,
0.015798, 0.6344606, -0.2096054, 0, 0.9333333, 1, 1,
0.01773568, 1.513893, -0.1165118, 0, 0.9294118, 1, 1,
0.02097005, 0.4978755, -1.809777, 0, 0.9215686, 1, 1,
0.02138944, -0.3303997, 2.553977, 0, 0.9176471, 1, 1,
0.02384973, 1.302539, -0.6391087, 0, 0.9098039, 1, 1,
0.02784567, 0.09065958, 0.2378782, 0, 0.9058824, 1, 1,
0.03054215, -0.4716736, 4.565045, 0, 0.8980392, 1, 1,
0.03096539, -0.8570772, 2.02136, 0, 0.8901961, 1, 1,
0.0317976, -1.504082, 4.457082, 0, 0.8862745, 1, 1,
0.0318775, 1.793864, -0.2663152, 0, 0.8784314, 1, 1,
0.03447762, -0.1861955, 2.792665, 0, 0.8745098, 1, 1,
0.03979034, 0.4026671, 0.3366942, 0, 0.8666667, 1, 1,
0.04164563, 1.663157, 0.7895454, 0, 0.8627451, 1, 1,
0.04329733, -1.013523, 4.411645, 0, 0.854902, 1, 1,
0.04811669, 2.631387, 0.2652156, 0, 0.8509804, 1, 1,
0.04864674, -1.42084, 2.063334, 0, 0.8431373, 1, 1,
0.05607582, -1.074155, 1.488374, 0, 0.8392157, 1, 1,
0.0560923, -0.6998444, 2.481282, 0, 0.8313726, 1, 1,
0.05676968, -1.590061, 2.734437, 0, 0.827451, 1, 1,
0.05821816, 0.5996763, -0.1448062, 0, 0.8196079, 1, 1,
0.05983429, 0.6822042, -1.983541, 0, 0.8156863, 1, 1,
0.06090852, -0.3794385, 4.002395, 0, 0.8078431, 1, 1,
0.06380875, -0.8675604, 4.737742, 0, 0.8039216, 1, 1,
0.06404437, 0.6089088, 0.4819747, 0, 0.7960784, 1, 1,
0.06646954, -0.605946, 2.63671, 0, 0.7882353, 1, 1,
0.06934606, -1.039808, 3.552743, 0, 0.7843137, 1, 1,
0.07098905, 0.5939215, -0.8132566, 0, 0.7764706, 1, 1,
0.07411785, 0.09687095, -1.196643, 0, 0.772549, 1, 1,
0.08007056, -0.1413644, 2.868162, 0, 0.7647059, 1, 1,
0.08073302, -0.6039503, 2.76431, 0, 0.7607843, 1, 1,
0.08368871, -1.259341, 2.881829, 0, 0.7529412, 1, 1,
0.08695607, 0.2174868, -0.6499302, 0, 0.7490196, 1, 1,
0.09057669, 0.9090243, -0.8478975, 0, 0.7411765, 1, 1,
0.09169628, 0.5743517, -1.482252, 0, 0.7372549, 1, 1,
0.09214558, -0.1811676, 3.641323, 0, 0.7294118, 1, 1,
0.0950701, -0.5408314, 2.696593, 0, 0.7254902, 1, 1,
0.0973224, -0.7398849, 2.908179, 0, 0.7176471, 1, 1,
0.1012793, 0.982347, -0.9133642, 0, 0.7137255, 1, 1,
0.1013638, -0.06091741, 2.43328, 0, 0.7058824, 1, 1,
0.1030984, -0.748399, 2.722042, 0, 0.6980392, 1, 1,
0.1032176, -1.809789, 0.9116656, 0, 0.6941177, 1, 1,
0.1041378, -0.9501693, 3.286, 0, 0.6862745, 1, 1,
0.1044902, -2.592315, 3.518648, 0, 0.682353, 1, 1,
0.1061937, -0.3180367, 2.78647, 0, 0.6745098, 1, 1,
0.1123595, -0.5939804, 2.052085, 0, 0.6705883, 1, 1,
0.1124937, -0.1173443, 2.896303, 0, 0.6627451, 1, 1,
0.115305, -0.5904413, 3.2464, 0, 0.6588235, 1, 1,
0.1155993, 0.8656429, 0.3192568, 0, 0.6509804, 1, 1,
0.1158233, 0.3110603, 1.876088, 0, 0.6470588, 1, 1,
0.1225338, 0.09231625, 2.22413, 0, 0.6392157, 1, 1,
0.1244254, 0.6017893, 0.4258949, 0, 0.6352941, 1, 1,
0.1265227, -0.5185285, 2.450732, 0, 0.627451, 1, 1,
0.1296764, -1.552058, 2.396248, 0, 0.6235294, 1, 1,
0.1322766, -1.58665, 2.634526, 0, 0.6156863, 1, 1,
0.1383097, 0.6465938, 1.235452, 0, 0.6117647, 1, 1,
0.1395305, 0.5208896, 0.07963672, 0, 0.6039216, 1, 1,
0.1408905, 0.555637, 1.264481, 0, 0.5960785, 1, 1,
0.1436803, -0.6287346, 3.563641, 0, 0.5921569, 1, 1,
0.1450264, -0.2272848, 1.482714, 0, 0.5843138, 1, 1,
0.1507943, 0.8283013, -0.3329206, 0, 0.5803922, 1, 1,
0.1516605, 0.04642389, 1.692415, 0, 0.572549, 1, 1,
0.1524017, 1.145145, -0.7439661, 0, 0.5686275, 1, 1,
0.1555488, 1.244704, 0.7743545, 0, 0.5607843, 1, 1,
0.156045, 1.518613, -0.567482, 0, 0.5568628, 1, 1,
0.157218, -3.467506, 2.495236, 0, 0.5490196, 1, 1,
0.1582549, 1.038556, -0.666308, 0, 0.5450981, 1, 1,
0.158596, 0.2641289, 0.908098, 0, 0.5372549, 1, 1,
0.1590742, 1.365046, -0.3188728, 0, 0.5333334, 1, 1,
0.1599598, -0.7662888, 2.067068, 0, 0.5254902, 1, 1,
0.160088, -1.276637, 3.34081, 0, 0.5215687, 1, 1,
0.1754092, -0.2329025, 1.217286, 0, 0.5137255, 1, 1,
0.1757447, 1.947998, -0.7175184, 0, 0.509804, 1, 1,
0.1772353, 0.5557721, 1.200113, 0, 0.5019608, 1, 1,
0.184487, 1.196427, 0.1089269, 0, 0.4941176, 1, 1,
0.1893848, -1.170744, 2.549917, 0, 0.4901961, 1, 1,
0.1934997, 0.07383672, 0.7779576, 0, 0.4823529, 1, 1,
0.1987091, -1.371661, 2.800874, 0, 0.4784314, 1, 1,
0.2002177, 0.1427339, 0.8585585, 0, 0.4705882, 1, 1,
0.2016055, -1.247554, 1.835977, 0, 0.4666667, 1, 1,
0.2075286, 0.4665902, 1.732058, 0, 0.4588235, 1, 1,
0.2086843, 0.1611434, -0.9244651, 0, 0.454902, 1, 1,
0.2153185, 0.7538329, 0.8279501, 0, 0.4470588, 1, 1,
0.2180658, 0.005669124, 3.052063, 0, 0.4431373, 1, 1,
0.2191663, 0.7110146, -0.4391141, 0, 0.4352941, 1, 1,
0.2207973, 2.104653, -0.2089628, 0, 0.4313726, 1, 1,
0.2230243, 0.2863652, 0.04229303, 0, 0.4235294, 1, 1,
0.223405, 1.019964, 0.699474, 0, 0.4196078, 1, 1,
0.2269914, 0.9244567, 1.49184, 0, 0.4117647, 1, 1,
0.2342482, -0.5847179, 1.102673, 0, 0.4078431, 1, 1,
0.2353551, 1.32289, -0.0408835, 0, 0.4, 1, 1,
0.2399758, -0.3577116, 1.868114, 0, 0.3921569, 1, 1,
0.2488429, 0.7562197, 0.8418468, 0, 0.3882353, 1, 1,
0.2510672, -0.2255745, 1.604863, 0, 0.3803922, 1, 1,
0.2511133, -0.229685, 1.63586, 0, 0.3764706, 1, 1,
0.2557201, -0.1237465, 1.705944, 0, 0.3686275, 1, 1,
0.258379, -0.8840416, 2.381637, 0, 0.3647059, 1, 1,
0.2594486, 1.51687, -0.574975, 0, 0.3568628, 1, 1,
0.2618662, -0.4991876, 1.287597, 0, 0.3529412, 1, 1,
0.268508, -0.1109553, 1.697373, 0, 0.345098, 1, 1,
0.2687195, 0.5821206, 1.052896, 0, 0.3411765, 1, 1,
0.2687534, 0.1829831, 1.945764, 0, 0.3333333, 1, 1,
0.2703408, -0.4043754, 2.589832, 0, 0.3294118, 1, 1,
0.2779262, 2.294522, 1.05162, 0, 0.3215686, 1, 1,
0.278714, -0.09567518, 2.337179, 0, 0.3176471, 1, 1,
0.2788192, 0.6012753, -0.1484037, 0, 0.3098039, 1, 1,
0.2794513, -0.7517762, 3.192713, 0, 0.3058824, 1, 1,
0.2804312, -0.6886286, 2.762399, 0, 0.2980392, 1, 1,
0.2806323, -0.405048, 3.309181, 0, 0.2901961, 1, 1,
0.2812076, 1.157188, 0.8358989, 0, 0.2862745, 1, 1,
0.2815963, 1.883332, 1.005757, 0, 0.2784314, 1, 1,
0.2816427, -1.409575, 2.353563, 0, 0.2745098, 1, 1,
0.2825686, -0.2039227, 3.337129, 0, 0.2666667, 1, 1,
0.2838692, 0.1660778, 1.250619, 0, 0.2627451, 1, 1,
0.2846784, -1.107498, 2.545835, 0, 0.254902, 1, 1,
0.2903158, 0.3907656, -1.934893, 0, 0.2509804, 1, 1,
0.2929039, 0.4520405, -1.676414, 0, 0.2431373, 1, 1,
0.297959, 0.3221397, 0.9673579, 0, 0.2392157, 1, 1,
0.2991627, -1.195697, 3.611202, 0, 0.2313726, 1, 1,
0.3005719, 0.3563569, -0.7946106, 0, 0.227451, 1, 1,
0.3041952, 0.4978543, 1.617403, 0, 0.2196078, 1, 1,
0.3059593, -0.628285, 3.602204, 0, 0.2156863, 1, 1,
0.3069888, -0.7864381, 2.460082, 0, 0.2078431, 1, 1,
0.3165292, -1.526672, 2.862177, 0, 0.2039216, 1, 1,
0.3176005, -0.6104871, 2.439952, 0, 0.1960784, 1, 1,
0.3201123, -0.6883959, 3.529364, 0, 0.1882353, 1, 1,
0.3224319, 1.314884, 0.9465979, 0, 0.1843137, 1, 1,
0.3245046, -0.6104865, 2.380054, 0, 0.1764706, 1, 1,
0.3269988, -0.8105302, 3.449272, 0, 0.172549, 1, 1,
0.3283238, 1.131932, 0.4876961, 0, 0.1647059, 1, 1,
0.3284021, 0.9294075, -0.9111779, 0, 0.1607843, 1, 1,
0.3286506, -2.22952, 3.423094, 0, 0.1529412, 1, 1,
0.3329941, -0.7652937, 3.298118, 0, 0.1490196, 1, 1,
0.3330566, -0.5948499, 3.008275, 0, 0.1411765, 1, 1,
0.3350377, 0.4430374, 0.4868118, 0, 0.1372549, 1, 1,
0.3368483, -0.319802, 2.640061, 0, 0.1294118, 1, 1,
0.3479847, -1.870044, 2.868309, 0, 0.1254902, 1, 1,
0.3483684, 1.125976, 0.2123399, 0, 0.1176471, 1, 1,
0.349316, -1.349548, 2.14202, 0, 0.1137255, 1, 1,
0.3523115, -1.219894, 1.987024, 0, 0.1058824, 1, 1,
0.3669198, -0.1287335, -0.9653826, 0, 0.09803922, 1, 1,
0.3722167, 0.6080677, -0.1354615, 0, 0.09411765, 1, 1,
0.3726562, -0.662663, 1.189737, 0, 0.08627451, 1, 1,
0.3778499, -0.7368916, 0.9878007, 0, 0.08235294, 1, 1,
0.3829597, -1.097912, 3.957223, 0, 0.07450981, 1, 1,
0.3830063, 1.323869, -0.9659956, 0, 0.07058824, 1, 1,
0.3875817, -1.144497, 4.025856, 0, 0.0627451, 1, 1,
0.3877599, 0.8677889, -0.1164203, 0, 0.05882353, 1, 1,
0.3889323, -0.3260641, 2.725605, 0, 0.05098039, 1, 1,
0.3904405, 1.766965, 2.457012, 0, 0.04705882, 1, 1,
0.3941048, -0.7246941, 4.698719, 0, 0.03921569, 1, 1,
0.3954566, -1.280651, 2.255006, 0, 0.03529412, 1, 1,
0.4025144, 0.6057196, 1.827212, 0, 0.02745098, 1, 1,
0.4028126, -2.368428, 4.898333, 0, 0.02352941, 1, 1,
0.4084325, -0.1136209, 1.332519, 0, 0.01568628, 1, 1,
0.4091732, 1.17797, 3.093598, 0, 0.01176471, 1, 1,
0.4097755, 0.7250268, 1.922623, 0, 0.003921569, 1, 1,
0.4154712, -0.06192404, 1.807602, 0.003921569, 0, 1, 1,
0.4160605, 0.8997467, 0.8513815, 0.007843138, 0, 1, 1,
0.424371, -2.715461, 0.2200221, 0.01568628, 0, 1, 1,
0.4285523, 0.629339, 1.20628, 0.01960784, 0, 1, 1,
0.4303332, -1.584611, 4.034243, 0.02745098, 0, 1, 1,
0.4340118, -0.8342578, 4.184632, 0.03137255, 0, 1, 1,
0.4360515, 0.6215103, 1.201012, 0.03921569, 0, 1, 1,
0.4379533, 0.1517076, 0.2327806, 0.04313726, 0, 1, 1,
0.4483897, 1.02158, 1.773755, 0.05098039, 0, 1, 1,
0.454372, -0.5985075, 2.665634, 0.05490196, 0, 1, 1,
0.4545251, -0.4795024, 1.302659, 0.0627451, 0, 1, 1,
0.4549233, 0.3174839, 1.462699, 0.06666667, 0, 1, 1,
0.4620242, 1.211182, 2.031563, 0.07450981, 0, 1, 1,
0.4655023, 1.741048, 1.103544, 0.07843138, 0, 1, 1,
0.4682924, 1.111915, -0.07137877, 0.08627451, 0, 1, 1,
0.4703422, -0.6163614, 2.290066, 0.09019608, 0, 1, 1,
0.4720989, -1.292069, 3.719152, 0.09803922, 0, 1, 1,
0.4726289, -1.195975, 2.026423, 0.1058824, 0, 1, 1,
0.4727459, -0.5672526, 3.472363, 0.1098039, 0, 1, 1,
0.4730928, -0.1324446, 2.373748, 0.1176471, 0, 1, 1,
0.4735063, 0.2063854, 0.9728809, 0.1215686, 0, 1, 1,
0.4753708, -1.183559, 2.153813, 0.1294118, 0, 1, 1,
0.478294, 0.8610167, 0.8374506, 0.1333333, 0, 1, 1,
0.4790733, 0.4372177, 1.132681, 0.1411765, 0, 1, 1,
0.4796142, -0.07558052, 1.706685, 0.145098, 0, 1, 1,
0.4813547, -0.2424081, 2.517016, 0.1529412, 0, 1, 1,
0.4839433, -0.1176442, 1.221751, 0.1568628, 0, 1, 1,
0.4856651, -0.9364839, 3.012858, 0.1647059, 0, 1, 1,
0.4866931, 2.091191, -0.1549537, 0.1686275, 0, 1, 1,
0.4868194, 0.3675767, 0.6186514, 0.1764706, 0, 1, 1,
0.4871796, 0.7631488, 0.7419506, 0.1803922, 0, 1, 1,
0.4880571, -0.768706, 1.764653, 0.1882353, 0, 1, 1,
0.4943832, -0.2391992, 2.265308, 0.1921569, 0, 1, 1,
0.4958842, -0.7737043, 1.596527, 0.2, 0, 1, 1,
0.4963384, 0.3862983, -0.4576772, 0.2078431, 0, 1, 1,
0.4981295, -1.24549, 2.558307, 0.2117647, 0, 1, 1,
0.5004491, -2.232569, 3.798284, 0.2196078, 0, 1, 1,
0.5061437, -0.6226969, 3.527397, 0.2235294, 0, 1, 1,
0.5092087, 1.015626, 0.7658525, 0.2313726, 0, 1, 1,
0.5147104, -0.9977078, 3.180537, 0.2352941, 0, 1, 1,
0.5169377, 0.07309675, 0.8220387, 0.2431373, 0, 1, 1,
0.5173786, 0.6693646, -0.6368491, 0.2470588, 0, 1, 1,
0.5198352, 1.133575, 0.7043088, 0.254902, 0, 1, 1,
0.5226704, 0.9365113, -0.1690952, 0.2588235, 0, 1, 1,
0.5250759, 0.4631478, 2.056104, 0.2666667, 0, 1, 1,
0.5268895, -0.3024187, 2.566388, 0.2705882, 0, 1, 1,
0.5277495, -2.01784, 4.836488, 0.2784314, 0, 1, 1,
0.5304947, -1.476947, 1.606525, 0.282353, 0, 1, 1,
0.5314987, 1.401802, -0.7847301, 0.2901961, 0, 1, 1,
0.5315129, 0.4331348, 1.139338, 0.2941177, 0, 1, 1,
0.5327799, -0.9378811, 1.929513, 0.3019608, 0, 1, 1,
0.536402, -0.9699043, 2.367297, 0.3098039, 0, 1, 1,
0.5366455, -0.2456208, 2.650453, 0.3137255, 0, 1, 1,
0.5401375, -1.49644, 1.933358, 0.3215686, 0, 1, 1,
0.5434354, -0.07013743, -0.1574996, 0.3254902, 0, 1, 1,
0.5445832, 0.8066735, 0.3154308, 0.3333333, 0, 1, 1,
0.5448074, 1.226524, 0.382387, 0.3372549, 0, 1, 1,
0.546145, -3.473999, 4.342784, 0.345098, 0, 1, 1,
0.5500277, -0.1017547, -0.6068333, 0.3490196, 0, 1, 1,
0.5503076, 0.4245895, -0.4161731, 0.3568628, 0, 1, 1,
0.5509129, 2.880092, -0.09170956, 0.3607843, 0, 1, 1,
0.5534892, -0.4736236, 2.854831, 0.3686275, 0, 1, 1,
0.5545816, 1.933889, -0.3851936, 0.372549, 0, 1, 1,
0.5549191, 1.362147, 1.403431, 0.3803922, 0, 1, 1,
0.5555249, 1.432756, -1.286414, 0.3843137, 0, 1, 1,
0.5558882, 0.2271858, 1.173224, 0.3921569, 0, 1, 1,
0.5563722, -1.412475, 2.429473, 0.3960784, 0, 1, 1,
0.5592911, 0.1975121, -0.2187835, 0.4039216, 0, 1, 1,
0.5593401, 0.2727467, 1.200017, 0.4117647, 0, 1, 1,
0.5608132, -1.37242, 3.481762, 0.4156863, 0, 1, 1,
0.5614561, -1.757329, 2.760029, 0.4235294, 0, 1, 1,
0.5628025, -1.878499, 2.521047, 0.427451, 0, 1, 1,
0.5638251, 0.7536041, 0.223957, 0.4352941, 0, 1, 1,
0.5653505, -0.8900855, 2.566518, 0.4392157, 0, 1, 1,
0.5686681, -0.1708575, -0.2188894, 0.4470588, 0, 1, 1,
0.5756568, -1.7019, 3.320821, 0.4509804, 0, 1, 1,
0.5762501, 0.1514991, 0.4038387, 0.4588235, 0, 1, 1,
0.5816604, -0.6482418, 3.289601, 0.4627451, 0, 1, 1,
0.5822485, 0.7511793, 1.679492, 0.4705882, 0, 1, 1,
0.5828095, 1.404008, 1.134145, 0.4745098, 0, 1, 1,
0.5894768, -1.564966, 2.669415, 0.4823529, 0, 1, 1,
0.5899687, -0.3677559, 1.343127, 0.4862745, 0, 1, 1,
0.5903708, 1.295069, -0.5883642, 0.4941176, 0, 1, 1,
0.5929669, 0.9350413, 2.52689, 0.5019608, 0, 1, 1,
0.5957522, 0.03427564, 0.2699831, 0.5058824, 0, 1, 1,
0.5976804, -1.329999, 2.267464, 0.5137255, 0, 1, 1,
0.6014319, -0.8657404, 1.274025, 0.5176471, 0, 1, 1,
0.6040415, 0.2635004, 0.3304335, 0.5254902, 0, 1, 1,
0.608609, -1.361541, 2.315322, 0.5294118, 0, 1, 1,
0.6100798, 0.2916032, 0.4400046, 0.5372549, 0, 1, 1,
0.6145685, -0.2757059, 2.59193, 0.5411765, 0, 1, 1,
0.6174794, 0.7227436, 0.7425681, 0.5490196, 0, 1, 1,
0.6181371, 0.5538504, 1.600082, 0.5529412, 0, 1, 1,
0.6206841, 0.006116194, 1.63513, 0.5607843, 0, 1, 1,
0.6267014, -0.3190571, 2.50355, 0.5647059, 0, 1, 1,
0.6285384, -1.04245, 3.165013, 0.572549, 0, 1, 1,
0.6313869, -3.442825, 1.84844, 0.5764706, 0, 1, 1,
0.6315398, 0.4149807, -2.121115, 0.5843138, 0, 1, 1,
0.637889, -0.3952732, 2.629746, 0.5882353, 0, 1, 1,
0.6386692, 0.6185689, -0.2366183, 0.5960785, 0, 1, 1,
0.6405625, -1.376603, 5.549561, 0.6039216, 0, 1, 1,
0.6431714, -0.6542054, 1.246884, 0.6078432, 0, 1, 1,
0.6459558, 0.7861509, 0.0001556239, 0.6156863, 0, 1, 1,
0.6501935, 0.3439406, 0.06620712, 0.6196079, 0, 1, 1,
0.6574742, 1.196171, 1.55864, 0.627451, 0, 1, 1,
0.6673629, -1.059665, 2.522903, 0.6313726, 0, 1, 1,
0.671248, 0.2902009, 1.654943, 0.6392157, 0, 1, 1,
0.6747259, -0.1172866, 2.073278, 0.6431373, 0, 1, 1,
0.6781609, 0.01694492, 0.8806621, 0.6509804, 0, 1, 1,
0.6805713, -1.435947, 3.593347, 0.654902, 0, 1, 1,
0.6806594, 0.5288818, 2.227246, 0.6627451, 0, 1, 1,
0.6905035, 0.2818572, -0.5959333, 0.6666667, 0, 1, 1,
0.6906964, -0.5914193, 2.252503, 0.6745098, 0, 1, 1,
0.692634, -0.4210675, 1.651577, 0.6784314, 0, 1, 1,
0.6972798, -0.481371, 3.352168, 0.6862745, 0, 1, 1,
0.6978308, 0.3681569, 1.293327, 0.6901961, 0, 1, 1,
0.7066904, -0.1500258, 2.234462, 0.6980392, 0, 1, 1,
0.7102342, -0.6165115, 2.879596, 0.7058824, 0, 1, 1,
0.7123106, -1.547582, 2.261118, 0.7098039, 0, 1, 1,
0.7145761, 0.3522894, 4.254208, 0.7176471, 0, 1, 1,
0.7151799, -0.02062478, 1.44841, 0.7215686, 0, 1, 1,
0.7162795, 0.7839999, 0.7554728, 0.7294118, 0, 1, 1,
0.7245518, 0.2300534, 0.3024482, 0.7333333, 0, 1, 1,
0.7275246, 0.965542, 1.36025, 0.7411765, 0, 1, 1,
0.7291871, -1.113688, 2.034033, 0.7450981, 0, 1, 1,
0.734633, 0.1264921, 1.863288, 0.7529412, 0, 1, 1,
0.7351735, -1.842354, 3.144875, 0.7568628, 0, 1, 1,
0.7353553, 0.8629309, 2.033623, 0.7647059, 0, 1, 1,
0.7358035, -0.04116616, 1.263012, 0.7686275, 0, 1, 1,
0.7393637, -0.8379706, 2.625427, 0.7764706, 0, 1, 1,
0.7398141, -1.400032, 2.370352, 0.7803922, 0, 1, 1,
0.7413034, 0.2723946, 1.603605, 0.7882353, 0, 1, 1,
0.7461299, 0.3118979, 1.366741, 0.7921569, 0, 1, 1,
0.7475325, 0.5870985, 2.042048, 0.8, 0, 1, 1,
0.7496225, -0.6026207, 2.266834, 0.8078431, 0, 1, 1,
0.750273, -1.345678, 2.462241, 0.8117647, 0, 1, 1,
0.7561496, -0.9023792, 1.677675, 0.8196079, 0, 1, 1,
0.7662055, 1.221947, 1.129598, 0.8235294, 0, 1, 1,
0.7780331, 0.5475467, -0.5311294, 0.8313726, 0, 1, 1,
0.7794691, -0.1264456, 3.00117, 0.8352941, 0, 1, 1,
0.7803268, 0.2929857, 2.454053, 0.8431373, 0, 1, 1,
0.7864494, -0.09563727, 0.8150388, 0.8470588, 0, 1, 1,
0.7946682, 1.534356, 0.04075507, 0.854902, 0, 1, 1,
0.7978971, -0.2490082, 3.704073, 0.8588235, 0, 1, 1,
0.8007643, -0.558983, 1.502938, 0.8666667, 0, 1, 1,
0.8027381, -1.148769, 3.02033, 0.8705882, 0, 1, 1,
0.8064958, 0.9257388, 0.3526294, 0.8784314, 0, 1, 1,
0.8087788, 0.6976853, 0.1549655, 0.8823529, 0, 1, 1,
0.8123297, -0.4980301, 3.622727, 0.8901961, 0, 1, 1,
0.817772, -0.3777023, 1.33003, 0.8941177, 0, 1, 1,
0.8184652, 0.3002749, 1.946934, 0.9019608, 0, 1, 1,
0.8262167, -0.3770717, 2.647536, 0.9098039, 0, 1, 1,
0.8278306, -0.6137246, 2.986185, 0.9137255, 0, 1, 1,
0.8300754, -1.155271, 3.51062, 0.9215686, 0, 1, 1,
0.8313196, 1.666166, 0.8321336, 0.9254902, 0, 1, 1,
0.8314039, -0.3450094, 0.3776631, 0.9333333, 0, 1, 1,
0.8325284, 0.1286485, 1.52438, 0.9372549, 0, 1, 1,
0.8361508, 0.6759019, 1.480086, 0.945098, 0, 1, 1,
0.8388638, 0.9626393, 1.732537, 0.9490196, 0, 1, 1,
0.839909, 2.406621, -0.3275665, 0.9568627, 0, 1, 1,
0.8400918, 0.1507188, 1.937277, 0.9607843, 0, 1, 1,
0.8496398, 0.6448392, 3.430251, 0.9686275, 0, 1, 1,
0.8576425, -0.6400269, 1.794717, 0.972549, 0, 1, 1,
0.8596413, -1.622608, 3.080501, 0.9803922, 0, 1, 1,
0.8600546, 0.6600761, 0.8546648, 0.9843137, 0, 1, 1,
0.8610269, 0.9794984, -0.2976614, 0.9921569, 0, 1, 1,
0.8614599, -0.728618, 2.910471, 0.9960784, 0, 1, 1,
0.8624964, -0.3520773, 0.9184469, 1, 0, 0.9960784, 1,
0.8659699, -1.470385, 4.354325, 1, 0, 0.9882353, 1,
0.8675954, 1.810477, 1.450747, 1, 0, 0.9843137, 1,
0.8743653, 0.8497139, 0.6015629, 1, 0, 0.9764706, 1,
0.8765148, -0.7985606, 2.495291, 1, 0, 0.972549, 1,
0.8806945, -0.09644932, 1.345204, 1, 0, 0.9647059, 1,
0.8917893, -0.9296069, 1.835426, 1, 0, 0.9607843, 1,
0.892653, 0.6208975, 1.035219, 1, 0, 0.9529412, 1,
0.9000829, 1.498102, 1.31939, 1, 0, 0.9490196, 1,
0.905174, 0.3989055, 1.383486, 1, 0, 0.9411765, 1,
0.9052989, 0.2650163, 2.034067, 1, 0, 0.9372549, 1,
0.905303, 1.019524, 0.6807918, 1, 0, 0.9294118, 1,
0.9072025, -0.2213533, 2.905834, 1, 0, 0.9254902, 1,
0.9091055, 0.5956417, 0.7129208, 1, 0, 0.9176471, 1,
0.9164982, 1.414457, 1.166367, 1, 0, 0.9137255, 1,
0.9169282, -0.176264, 1.37885, 1, 0, 0.9058824, 1,
0.9178032, 1.479529, 0.3068227, 1, 0, 0.9019608, 1,
0.9271752, -0.4596458, 1.043653, 1, 0, 0.8941177, 1,
0.9273357, -0.3010996, 1.88838, 1, 0, 0.8862745, 1,
0.9316332, -0.4812753, 1.841126, 1, 0, 0.8823529, 1,
0.9363659, -0.2143463, 1.077808, 1, 0, 0.8745098, 1,
0.9367147, 0.7597477, 1.079891, 1, 0, 0.8705882, 1,
0.9409416, 1.211122, 1.519875, 1, 0, 0.8627451, 1,
0.9425923, -0.03754475, 0.8696848, 1, 0, 0.8588235, 1,
0.9498143, 0.8873218, 1.951739, 1, 0, 0.8509804, 1,
0.9518598, -0.5671458, 1.357091, 1, 0, 0.8470588, 1,
0.9543727, 1.176598, 1.30882, 1, 0, 0.8392157, 1,
0.9553645, 0.5454197, 0.4022868, 1, 0, 0.8352941, 1,
0.9580281, 1.147488, 2.184592, 1, 0, 0.827451, 1,
0.9606317, -0.6482579, 2.535825, 1, 0, 0.8235294, 1,
0.9619354, -0.03086296, 1.452436, 1, 0, 0.8156863, 1,
0.9622971, 1.653302, -0.6724728, 1, 0, 0.8117647, 1,
0.9639307, -0.9179157, 2.249965, 1, 0, 0.8039216, 1,
0.9651912, -0.8123834, 3.597248, 1, 0, 0.7960784, 1,
0.973081, -0.4048875, 0.9647384, 1, 0, 0.7921569, 1,
0.9857053, 0.4888139, 0.6243988, 1, 0, 0.7843137, 1,
0.9863282, -0.4420219, 1.71689, 1, 0, 0.7803922, 1,
0.9876735, -1.815464, 1.203255, 1, 0, 0.772549, 1,
0.9883966, -0.01041444, 0.8593983, 1, 0, 0.7686275, 1,
0.9932569, 0.06066463, 1.594339, 1, 0, 0.7607843, 1,
0.9984324, 1.415551, 0.1399176, 1, 0, 0.7568628, 1,
1.001556, -0.1821339, 2.084833, 1, 0, 0.7490196, 1,
1.003446, -2.034662, 2.622281, 1, 0, 0.7450981, 1,
1.008035, 0.08297534, 1.933147, 1, 0, 0.7372549, 1,
1.013324, -0.9128345, 1.889931, 1, 0, 0.7333333, 1,
1.016049, 0.06352416, 2.815728, 1, 0, 0.7254902, 1,
1.020632, -0.4186707, 1.919555, 1, 0, 0.7215686, 1,
1.039492, -0.8718384, 2.306047, 1, 0, 0.7137255, 1,
1.04601, 1.248658, 1.655753, 1, 0, 0.7098039, 1,
1.056502, 0.4661124, 1.49865, 1, 0, 0.7019608, 1,
1.060493, 0.8888752, 0.1678091, 1, 0, 0.6941177, 1,
1.060616, -0.8223239, 3.88866, 1, 0, 0.6901961, 1,
1.065328, 0.6558319, 1.71527, 1, 0, 0.682353, 1,
1.069919, 0.2792869, 3.57165, 1, 0, 0.6784314, 1,
1.078118, 1.498156, 1.454208, 1, 0, 0.6705883, 1,
1.09479, -1.701382, 4.416141, 1, 0, 0.6666667, 1,
1.101619, 1.666675, 0.3332177, 1, 0, 0.6588235, 1,
1.102859, -0.3051252, 0.2930089, 1, 0, 0.654902, 1,
1.113245, 1.266845, 0.1720377, 1, 0, 0.6470588, 1,
1.119885, -1.451158, 2.921041, 1, 0, 0.6431373, 1,
1.120447, 0.5397172, 2.424527, 1, 0, 0.6352941, 1,
1.143901, 0.807145, 0.8469827, 1, 0, 0.6313726, 1,
1.154218, 0.3350606, 1.152163, 1, 0, 0.6235294, 1,
1.160104, -1.960726, 0.5823295, 1, 0, 0.6196079, 1,
1.162161, -0.09771448, 2.437063, 1, 0, 0.6117647, 1,
1.165889, -0.1579393, 1.552289, 1, 0, 0.6078432, 1,
1.165981, 0.9665578, 0.264268, 1, 0, 0.6, 1,
1.169225, -0.695389, 3.100982, 1, 0, 0.5921569, 1,
1.17254, -0.3034302, 0.9473873, 1, 0, 0.5882353, 1,
1.173221, 0.5056699, 0.671067, 1, 0, 0.5803922, 1,
1.17705, -0.4764744, 0.09548063, 1, 0, 0.5764706, 1,
1.19049, 0.2353235, 0.9734528, 1, 0, 0.5686275, 1,
1.190531, 1.627882, -0.03420588, 1, 0, 0.5647059, 1,
1.21006, -1.159149, 3.15468, 1, 0, 0.5568628, 1,
1.212468, -0.2291841, 1.669615, 1, 0, 0.5529412, 1,
1.214718, 1.00878, 0.8679958, 1, 0, 0.5450981, 1,
1.224211, -0.05613576, 1.817845, 1, 0, 0.5411765, 1,
1.230281, 0.1514706, 1.78265, 1, 0, 0.5333334, 1,
1.255782, 0.1269417, 3.853612, 1, 0, 0.5294118, 1,
1.260053, -0.5122076, 2.15656, 1, 0, 0.5215687, 1,
1.273843, 0.4659891, 2.148833, 1, 0, 0.5176471, 1,
1.274225, 0.3902856, 1.335019, 1, 0, 0.509804, 1,
1.27905, 1.048834, -0.03165302, 1, 0, 0.5058824, 1,
1.280423, 0.3542093, 1.972336, 1, 0, 0.4980392, 1,
1.283486, -3.107753, 2.175736, 1, 0, 0.4901961, 1,
1.289961, 0.5733735, 1.974823, 1, 0, 0.4862745, 1,
1.293484, -0.5874828, 2.618775, 1, 0, 0.4784314, 1,
1.29476, 0.8791207, 1.360547, 1, 0, 0.4745098, 1,
1.308133, 1.018957, 0.8962839, 1, 0, 0.4666667, 1,
1.31504, 0.3159845, 1.773293, 1, 0, 0.4627451, 1,
1.317455, -0.2058366, 1.944422, 1, 0, 0.454902, 1,
1.318397, 0.1853804, 1.226284, 1, 0, 0.4509804, 1,
1.319353, -1.012442, 3.231654, 1, 0, 0.4431373, 1,
1.324235, 1.306237, 2.885238, 1, 0, 0.4392157, 1,
1.32636, 0.556829, 1.453506, 1, 0, 0.4313726, 1,
1.331232, 0.4090301, -0.1029135, 1, 0, 0.427451, 1,
1.359009, 0.04057233, 1.215052, 1, 0, 0.4196078, 1,
1.365324, -0.3399648, 0.7330502, 1, 0, 0.4156863, 1,
1.38362, 1.168162, 1.619917, 1, 0, 0.4078431, 1,
1.405859, -0.8455541, 2.209296, 1, 0, 0.4039216, 1,
1.416627, -1.351529, 3.858377, 1, 0, 0.3960784, 1,
1.422933, -1.799166, 2.105691, 1, 0, 0.3882353, 1,
1.424624, 0.281524, 0.4986395, 1, 0, 0.3843137, 1,
1.426385, -1.401325, 4.371912, 1, 0, 0.3764706, 1,
1.429982, -0.04886175, 0.55031, 1, 0, 0.372549, 1,
1.434699, -0.3013132, 2.863096, 1, 0, 0.3647059, 1,
1.468997, -0.3347846, 1.868323, 1, 0, 0.3607843, 1,
1.484229, 0.6859685, 2.09963, 1, 0, 0.3529412, 1,
1.494346, 0.9429182, 0.890977, 1, 0, 0.3490196, 1,
1.503908, 0.3008079, 1.379629, 1, 0, 0.3411765, 1,
1.505768, -0.4905981, 2.571168, 1, 0, 0.3372549, 1,
1.526328, 0.2013015, -0.749872, 1, 0, 0.3294118, 1,
1.544637, 0.4225334, -0.1085394, 1, 0, 0.3254902, 1,
1.549706, -0.4732834, 2.060733, 1, 0, 0.3176471, 1,
1.573139, 0.5605393, 1.70738, 1, 0, 0.3137255, 1,
1.573994, -0.3002395, 1.753954, 1, 0, 0.3058824, 1,
1.577716, -0.9845538, 1.410284, 1, 0, 0.2980392, 1,
1.583616, -1.006819, 0.1668075, 1, 0, 0.2941177, 1,
1.588759, 0.512441, 1.531172, 1, 0, 0.2862745, 1,
1.597109, 0.5437171, 0.975772, 1, 0, 0.282353, 1,
1.604985, -1.953338, 3.669057, 1, 0, 0.2745098, 1,
1.606857, 0.3522216, 2.767783, 1, 0, 0.2705882, 1,
1.61345, 3.046483, 1.348154, 1, 0, 0.2627451, 1,
1.622771, -0.1430607, 0.5830098, 1, 0, 0.2588235, 1,
1.650634, 1.41864, 0.9509569, 1, 0, 0.2509804, 1,
1.659274, -0.9747741, 2.532796, 1, 0, 0.2470588, 1,
1.66385, 0.6521029, 0.6935813, 1, 0, 0.2392157, 1,
1.676879, -2.170351, 1.882815, 1, 0, 0.2352941, 1,
1.690142, 2.039072, -0.1117103, 1, 0, 0.227451, 1,
1.705651, 0.03438567, 1.283305, 1, 0, 0.2235294, 1,
1.709983, 2.049807, 0.7975762, 1, 0, 0.2156863, 1,
1.712656, 0.9542774, 1.729162, 1, 0, 0.2117647, 1,
1.737796, 0.2646138, 0.626544, 1, 0, 0.2039216, 1,
1.775923, -1.395187, 1.229036, 1, 0, 0.1960784, 1,
1.780811, 0.8841076, 2.169864, 1, 0, 0.1921569, 1,
1.81343, 1.780496, -0.4852196, 1, 0, 0.1843137, 1,
1.814747, 0.2012364, 1.149082, 1, 0, 0.1803922, 1,
1.839321, -2.526739, 3.093153, 1, 0, 0.172549, 1,
1.848009, 0.2324217, 2.006621, 1, 0, 0.1686275, 1,
1.915074, 1.388442, 1.527512, 1, 0, 0.1607843, 1,
1.921432, -1.352754, 2.035971, 1, 0, 0.1568628, 1,
1.930186, -1.098286, -0.2452894, 1, 0, 0.1490196, 1,
1.935345, -0.09621623, 1.07101, 1, 0, 0.145098, 1,
1.949441, 0.7415919, 0.8071483, 1, 0, 0.1372549, 1,
1.96071, -0.3047709, 0.4902785, 1, 0, 0.1333333, 1,
1.976412, -0.7886751, 1.334941, 1, 0, 0.1254902, 1,
1.993612, -2.810948, 5.196082, 1, 0, 0.1215686, 1,
1.99744, -3.534626, 3.675578, 1, 0, 0.1137255, 1,
2.049256, -2.179295, 2.848514, 1, 0, 0.1098039, 1,
2.054419, -1.333947, 0.9041908, 1, 0, 0.1019608, 1,
2.068023, 0.6159508, -0.7972158, 1, 0, 0.09411765, 1,
2.075585, 0.964055, 0.5617991, 1, 0, 0.09019608, 1,
2.107996, -1.501373, 2.527881, 1, 0, 0.08235294, 1,
2.207902, -0.2960153, 0.2626905, 1, 0, 0.07843138, 1,
2.214225, 1.206948, -0.08446263, 1, 0, 0.07058824, 1,
2.214817, 0.4783719, 0.416737, 1, 0, 0.06666667, 1,
2.226807, -0.6077186, -0.07349295, 1, 0, 0.05882353, 1,
2.317696, 0.5624638, 1.131127, 1, 0, 0.05490196, 1,
2.394557, 0.05979709, 0.2945186, 1, 0, 0.04705882, 1,
2.496725, -0.4302795, 1.23507, 1, 0, 0.04313726, 1,
2.587114, 1.435868, 0.9682785, 1, 0, 0.03529412, 1,
2.653154, 0.3540243, 2.537766, 1, 0, 0.03137255, 1,
2.685096, -0.9006246, 2.533814, 1, 0, 0.02352941, 1,
2.703281, -0.6301195, 2.890287, 1, 0, 0.01960784, 1,
2.78761, 1.059598, 0.4032115, 1, 0, 0.01176471, 1,
3.390952, 1.218882, 0.2227929, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.2433982, -4.650125, -6.83639, 0, -0.5, 0.5, 0.5,
0.2433982, -4.650125, -6.83639, 1, -0.5, 0.5, 0.5,
0.2433982, -4.650125, -6.83639, 1, 1.5, 0.5, 0.5,
0.2433982, -4.650125, -6.83639, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.971176, -0.2440716, -6.83639, 0, -0.5, 0.5, 0.5,
-3.971176, -0.2440716, -6.83639, 1, -0.5, 0.5, 0.5,
-3.971176, -0.2440716, -6.83639, 1, 1.5, 0.5, 0.5,
-3.971176, -0.2440716, -6.83639, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.971176, -4.650125, 0.2541566, 0, -0.5, 0.5, 0.5,
-3.971176, -4.650125, 0.2541566, 1, -0.5, 0.5, 0.5,
-3.971176, -4.650125, 0.2541566, 1, 1.5, 0.5, 0.5,
-3.971176, -4.650125, 0.2541566, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.633343, -5.20011,
3, -3.633343, -5.20011,
-2, -3.633343, -5.20011,
-2, -3.802807, -5.472823,
-1, -3.633343, -5.20011,
-1, -3.802807, -5.472823,
0, -3.633343, -5.20011,
0, -3.802807, -5.472823,
1, -3.633343, -5.20011,
1, -3.802807, -5.472823,
2, -3.633343, -5.20011,
2, -3.802807, -5.472823,
3, -3.633343, -5.20011,
3, -3.802807, -5.472823
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -4.141734, -6.01825, 0, -0.5, 0.5, 0.5,
-2, -4.141734, -6.01825, 1, -0.5, 0.5, 0.5,
-2, -4.141734, -6.01825, 1, 1.5, 0.5, 0.5,
-2, -4.141734, -6.01825, 0, 1.5, 0.5, 0.5,
-1, -4.141734, -6.01825, 0, -0.5, 0.5, 0.5,
-1, -4.141734, -6.01825, 1, -0.5, 0.5, 0.5,
-1, -4.141734, -6.01825, 1, 1.5, 0.5, 0.5,
-1, -4.141734, -6.01825, 0, 1.5, 0.5, 0.5,
0, -4.141734, -6.01825, 0, -0.5, 0.5, 0.5,
0, -4.141734, -6.01825, 1, -0.5, 0.5, 0.5,
0, -4.141734, -6.01825, 1, 1.5, 0.5, 0.5,
0, -4.141734, -6.01825, 0, 1.5, 0.5, 0.5,
1, -4.141734, -6.01825, 0, -0.5, 0.5, 0.5,
1, -4.141734, -6.01825, 1, -0.5, 0.5, 0.5,
1, -4.141734, -6.01825, 1, 1.5, 0.5, 0.5,
1, -4.141734, -6.01825, 0, 1.5, 0.5, 0.5,
2, -4.141734, -6.01825, 0, -0.5, 0.5, 0.5,
2, -4.141734, -6.01825, 1, -0.5, 0.5, 0.5,
2, -4.141734, -6.01825, 1, 1.5, 0.5, 0.5,
2, -4.141734, -6.01825, 0, 1.5, 0.5, 0.5,
3, -4.141734, -6.01825, 0, -0.5, 0.5, 0.5,
3, -4.141734, -6.01825, 1, -0.5, 0.5, 0.5,
3, -4.141734, -6.01825, 1, 1.5, 0.5, 0.5,
3, -4.141734, -6.01825, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-2.998582, -3, -5.20011,
-2.998582, 3, -5.20011,
-2.998582, -3, -5.20011,
-3.160681, -3, -5.472823,
-2.998582, -2, -5.20011,
-3.160681, -2, -5.472823,
-2.998582, -1, -5.20011,
-3.160681, -1, -5.472823,
-2.998582, 0, -5.20011,
-3.160681, 0, -5.472823,
-2.998582, 1, -5.20011,
-3.160681, 1, -5.472823,
-2.998582, 2, -5.20011,
-3.160681, 2, -5.472823,
-2.998582, 3, -5.20011,
-3.160681, 3, -5.472823
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.484879, -3, -6.01825, 0, -0.5, 0.5, 0.5,
-3.484879, -3, -6.01825, 1, -0.5, 0.5, 0.5,
-3.484879, -3, -6.01825, 1, 1.5, 0.5, 0.5,
-3.484879, -3, -6.01825, 0, 1.5, 0.5, 0.5,
-3.484879, -2, -6.01825, 0, -0.5, 0.5, 0.5,
-3.484879, -2, -6.01825, 1, -0.5, 0.5, 0.5,
-3.484879, -2, -6.01825, 1, 1.5, 0.5, 0.5,
-3.484879, -2, -6.01825, 0, 1.5, 0.5, 0.5,
-3.484879, -1, -6.01825, 0, -0.5, 0.5, 0.5,
-3.484879, -1, -6.01825, 1, -0.5, 0.5, 0.5,
-3.484879, -1, -6.01825, 1, 1.5, 0.5, 0.5,
-3.484879, -1, -6.01825, 0, 1.5, 0.5, 0.5,
-3.484879, 0, -6.01825, 0, -0.5, 0.5, 0.5,
-3.484879, 0, -6.01825, 1, -0.5, 0.5, 0.5,
-3.484879, 0, -6.01825, 1, 1.5, 0.5, 0.5,
-3.484879, 0, -6.01825, 0, 1.5, 0.5, 0.5,
-3.484879, 1, -6.01825, 0, -0.5, 0.5, 0.5,
-3.484879, 1, -6.01825, 1, -0.5, 0.5, 0.5,
-3.484879, 1, -6.01825, 1, 1.5, 0.5, 0.5,
-3.484879, 1, -6.01825, 0, 1.5, 0.5, 0.5,
-3.484879, 2, -6.01825, 0, -0.5, 0.5, 0.5,
-3.484879, 2, -6.01825, 1, -0.5, 0.5, 0.5,
-3.484879, 2, -6.01825, 1, 1.5, 0.5, 0.5,
-3.484879, 2, -6.01825, 0, 1.5, 0.5, 0.5,
-3.484879, 3, -6.01825, 0, -0.5, 0.5, 0.5,
-3.484879, 3, -6.01825, 1, -0.5, 0.5, 0.5,
-3.484879, 3, -6.01825, 1, 1.5, 0.5, 0.5,
-3.484879, 3, -6.01825, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-2.998582, -3.633343, -4,
-2.998582, -3.633343, 4,
-2.998582, -3.633343, -4,
-3.160681, -3.802807, -4,
-2.998582, -3.633343, -2,
-3.160681, -3.802807, -2,
-2.998582, -3.633343, 0,
-3.160681, -3.802807, 0,
-2.998582, -3.633343, 2,
-3.160681, -3.802807, 2,
-2.998582, -3.633343, 4,
-3.160681, -3.802807, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.484879, -4.141734, -4, 0, -0.5, 0.5, 0.5,
-3.484879, -4.141734, -4, 1, -0.5, 0.5, 0.5,
-3.484879, -4.141734, -4, 1, 1.5, 0.5, 0.5,
-3.484879, -4.141734, -4, 0, 1.5, 0.5, 0.5,
-3.484879, -4.141734, -2, 0, -0.5, 0.5, 0.5,
-3.484879, -4.141734, -2, 1, -0.5, 0.5, 0.5,
-3.484879, -4.141734, -2, 1, 1.5, 0.5, 0.5,
-3.484879, -4.141734, -2, 0, 1.5, 0.5, 0.5,
-3.484879, -4.141734, 0, 0, -0.5, 0.5, 0.5,
-3.484879, -4.141734, 0, 1, -0.5, 0.5, 0.5,
-3.484879, -4.141734, 0, 1, 1.5, 0.5, 0.5,
-3.484879, -4.141734, 0, 0, 1.5, 0.5, 0.5,
-3.484879, -4.141734, 2, 0, -0.5, 0.5, 0.5,
-3.484879, -4.141734, 2, 1, -0.5, 0.5, 0.5,
-3.484879, -4.141734, 2, 1, 1.5, 0.5, 0.5,
-3.484879, -4.141734, 2, 0, 1.5, 0.5, 0.5,
-3.484879, -4.141734, 4, 0, -0.5, 0.5, 0.5,
-3.484879, -4.141734, 4, 1, -0.5, 0.5, 0.5,
-3.484879, -4.141734, 4, 1, 1.5, 0.5, 0.5,
-3.484879, -4.141734, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-2.998582, -3.633343, -5.20011,
-2.998582, 3.1452, -5.20011,
-2.998582, -3.633343, 5.708423,
-2.998582, 3.1452, 5.708423,
-2.998582, -3.633343, -5.20011,
-2.998582, -3.633343, 5.708423,
-2.998582, 3.1452, -5.20011,
-2.998582, 3.1452, 5.708423,
-2.998582, -3.633343, -5.20011,
3.485378, -3.633343, -5.20011,
-2.998582, -3.633343, 5.708423,
3.485378, -3.633343, 5.708423,
-2.998582, 3.1452, -5.20011,
3.485378, 3.1452, -5.20011,
-2.998582, 3.1452, 5.708423,
3.485378, 3.1452, 5.708423,
3.485378, -3.633343, -5.20011,
3.485378, 3.1452, -5.20011,
3.485378, -3.633343, 5.708423,
3.485378, 3.1452, 5.708423,
3.485378, -3.633343, -5.20011,
3.485378, -3.633343, 5.708423,
3.485378, 3.1452, -5.20011,
3.485378, 3.1452, 5.708423
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.682392;
var distance = 34.17983;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.2433982, 0.2440716, -0.2541566 );
mvMatrix.scale( 1.281062, 1.225389, 0.7614546 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.17983);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
fomesafen<-read.table("fomesafen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fomesafen$V2
```

```
## Error in eval(expr, envir, enclos): object 'fomesafen' not found
```

```r
y<-fomesafen$V3
```

```
## Error in eval(expr, envir, enclos): object 'fomesafen' not found
```

```r
z<-fomesafen$V4
```

```
## Error in eval(expr, envir, enclos): object 'fomesafen' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.904155, 0.2370476, -1.898032, 0, 0, 1, 1, 1,
-2.78205, 0.3750079, -2.617135, 1, 0, 0, 1, 1,
-2.575389, -0.3948949, -1.44132, 1, 0, 0, 1, 1,
-2.548757, 0.137327, -0.800348, 1, 0, 0, 1, 1,
-2.487392, -1.130327, -3.100267, 1, 0, 0, 1, 1,
-2.449269, -0.3069598, -1.350549, 1, 0, 0, 1, 1,
-2.387773, -1.048986, -2.143331, 0, 0, 0, 1, 1,
-2.368002, -0.434715, 0.1206107, 0, 0, 0, 1, 1,
-2.298383, -0.2850966, -2.072498, 0, 0, 0, 1, 1,
-2.260438, -0.2236618, 0.03514822, 0, 0, 0, 1, 1,
-2.229939, -0.779686, -3.416637, 0, 0, 0, 1, 1,
-2.213572, 0.2373217, -2.241468, 0, 0, 0, 1, 1,
-2.192135, 0.3399539, -1.552433, 0, 0, 0, 1, 1,
-2.186228, -1.205488, -0.9282609, 1, 1, 1, 1, 1,
-2.182562, 0.6844647, -1.908172, 1, 1, 1, 1, 1,
-2.164587, -0.1164293, -1.005288, 1, 1, 1, 1, 1,
-2.160878, -1.266525, -1.394425, 1, 1, 1, 1, 1,
-2.160445, -1.41751, -2.840791, 1, 1, 1, 1, 1,
-2.149538, 0.7510876, -1.331419, 1, 1, 1, 1, 1,
-2.142277, -0.5456455, -0.3449017, 1, 1, 1, 1, 1,
-2.117744, 0.7023076, -0.9640716, 1, 1, 1, 1, 1,
-2.099941, 0.2005044, -0.6920047, 1, 1, 1, 1, 1,
-2.075688, 0.6339957, -0.2415828, 1, 1, 1, 1, 1,
-2.044945, -1.477942, -1.851955, 1, 1, 1, 1, 1,
-2.028077, 0.8976557, -0.4628178, 1, 1, 1, 1, 1,
-2.010355, 2.244533, 0.06369467, 1, 1, 1, 1, 1,
-1.993845, 0.8436669, -1.574214, 1, 1, 1, 1, 1,
-1.990247, -0.5455872, -3.555721, 1, 1, 1, 1, 1,
-1.927302, -0.4473027, -2.12812, 0, 0, 1, 1, 1,
-1.910343, 0.2032069, -3.369287, 1, 0, 0, 1, 1,
-1.905479, -0.8155719, -3.148331, 1, 0, 0, 1, 1,
-1.901849, -1.959081, -1.438758, 1, 0, 0, 1, 1,
-1.891729, 0.6272986, -2.342199, 1, 0, 0, 1, 1,
-1.891019, 1.320561, -2.553109, 1, 0, 0, 1, 1,
-1.872173, -1.302425, -2.330059, 0, 0, 0, 1, 1,
-1.869581, -0.03866302, -1.626008, 0, 0, 0, 1, 1,
-1.838136, 1.197858, 0.05903681, 0, 0, 0, 1, 1,
-1.815229, -1.848079, -1.244222, 0, 0, 0, 1, 1,
-1.798801, -0.1998224, -1.49938, 0, 0, 0, 1, 1,
-1.787219, -0.5970077, -2.194925, 0, 0, 0, 1, 1,
-1.785834, 0.3084599, -0.9140957, 0, 0, 0, 1, 1,
-1.73443, 1.495957, -0.9833349, 1, 1, 1, 1, 1,
-1.726784, 0.5163484, -2.74504, 1, 1, 1, 1, 1,
-1.722037, -0.3741958, -3.439677, 1, 1, 1, 1, 1,
-1.721466, 0.4613546, -1.136138, 1, 1, 1, 1, 1,
-1.719374, 0.3111888, -0.2933934, 1, 1, 1, 1, 1,
-1.702388, -0.3258511, -2.671891, 1, 1, 1, 1, 1,
-1.69686, -1.121791, -2.777759, 1, 1, 1, 1, 1,
-1.672397, -0.5559506, -1.385434, 1, 1, 1, 1, 1,
-1.671908, -0.9786251, -3.665448, 1, 1, 1, 1, 1,
-1.671421, 0.821592, -0.5937023, 1, 1, 1, 1, 1,
-1.670706, -0.6342791, -1.778643, 1, 1, 1, 1, 1,
-1.66552, 1.008788, -1.005072, 1, 1, 1, 1, 1,
-1.631482, -1.197822, -2.654374, 1, 1, 1, 1, 1,
-1.629928, -1.531319, -2.878314, 1, 1, 1, 1, 1,
-1.62585, -0.3770087, -3.450864, 1, 1, 1, 1, 1,
-1.625823, 0.003557184, -1.463404, 0, 0, 1, 1, 1,
-1.624657, 0.6095598, -1.135472, 1, 0, 0, 1, 1,
-1.612721, 0.1192191, -1.702888, 1, 0, 0, 1, 1,
-1.604348, -0.907968, -0.8272707, 1, 0, 0, 1, 1,
-1.604115, -0.1480608, -1.31498, 1, 0, 0, 1, 1,
-1.603098, 1.855182, -0.6088559, 1, 0, 0, 1, 1,
-1.597003, 0.08447802, -0.9909663, 0, 0, 0, 1, 1,
-1.594216, 0.6179903, 0.1675587, 0, 0, 0, 1, 1,
-1.593181, 1.255293, -1.288012, 0, 0, 0, 1, 1,
-1.586591, -1.185506, -2.363243, 0, 0, 0, 1, 1,
-1.565049, 0.08659502, -0.6977767, 0, 0, 0, 1, 1,
-1.563163, -0.8113763, -1.565563, 0, 0, 0, 1, 1,
-1.549883, -0.2171085, -2.62122, 0, 0, 0, 1, 1,
-1.54676, -0.4709695, -1.530319, 1, 1, 1, 1, 1,
-1.507463, -0.5600914, -1.528658, 1, 1, 1, 1, 1,
-1.490812, 2.059267, 0.5949943, 1, 1, 1, 1, 1,
-1.485963, 0.4259052, -0.3742582, 1, 1, 1, 1, 1,
-1.481335, -0.05555155, -1.119697, 1, 1, 1, 1, 1,
-1.47702, -0.6397022, -3.032361, 1, 1, 1, 1, 1,
-1.476802, 1.535194, 0.2752692, 1, 1, 1, 1, 1,
-1.46833, 0.6907046, -1.208801, 1, 1, 1, 1, 1,
-1.467818, -0.05707036, -0.9187994, 1, 1, 1, 1, 1,
-1.462923, 0.3582515, -1.865823, 1, 1, 1, 1, 1,
-1.462012, -1.40097, -1.625966, 1, 1, 1, 1, 1,
-1.457079, -0.2565013, -1.33756, 1, 1, 1, 1, 1,
-1.455985, 1.06525, 0.03498263, 1, 1, 1, 1, 1,
-1.448973, 0.2871895, -3.209297, 1, 1, 1, 1, 1,
-1.443969, -0.5081742, -1.878931, 1, 1, 1, 1, 1,
-1.443181, 0.01011025, -1.105004, 0, 0, 1, 1, 1,
-1.424628, 0.9225831, 0.3058417, 1, 0, 0, 1, 1,
-1.421732, 2.536604, -2.104138, 1, 0, 0, 1, 1,
-1.419619, 2.705565, 0.6831305, 1, 0, 0, 1, 1,
-1.418429, -1.968886, -2.839118, 1, 0, 0, 1, 1,
-1.413179, 0.6010702, 0.1031796, 1, 0, 0, 1, 1,
-1.401922, -0.7011169, -1.756108, 0, 0, 0, 1, 1,
-1.381206, -1.266042, -2.823324, 0, 0, 0, 1, 1,
-1.378212, 1.573303, 0.5799922, 0, 0, 0, 1, 1,
-1.377749, -2.012812, -2.101323, 0, 0, 0, 1, 1,
-1.375606, 0.2677809, -2.29123, 0, 0, 0, 1, 1,
-1.365276, -0.2820708, -3.154979, 0, 0, 0, 1, 1,
-1.362401, 0.1710284, -3.064903, 0, 0, 0, 1, 1,
-1.361821, -1.504975, -4.425585, 1, 1, 1, 1, 1,
-1.360131, -1.065484, -3.11599, 1, 1, 1, 1, 1,
-1.35814, -0.8084882, -1.184075, 1, 1, 1, 1, 1,
-1.340462, -1.168645, -1.467139, 1, 1, 1, 1, 1,
-1.337653, 0.1180311, -2.288197, 1, 1, 1, 1, 1,
-1.336191, -1.004377, -1.251245, 1, 1, 1, 1, 1,
-1.329656, 0.7412972, -0.9190234, 1, 1, 1, 1, 1,
-1.322947, 1.051371, -0.3719631, 1, 1, 1, 1, 1,
-1.322621, -0.3243313, -1.913192, 1, 1, 1, 1, 1,
-1.321908, -1.13785, -1.303171, 1, 1, 1, 1, 1,
-1.316026, -0.7803455, -2.219379, 1, 1, 1, 1, 1,
-1.312738, 1.223765, -0.8069282, 1, 1, 1, 1, 1,
-1.309697, -0.1096422, -3.187327, 1, 1, 1, 1, 1,
-1.302046, -0.742134, -2.730329, 1, 1, 1, 1, 1,
-1.292806, -0.5208996, -1.534795, 1, 1, 1, 1, 1,
-1.29001, -0.9124403, -1.001736, 0, 0, 1, 1, 1,
-1.289192, -0.8592192, -1.160452, 1, 0, 0, 1, 1,
-1.277674, -0.7683104, -1.702645, 1, 0, 0, 1, 1,
-1.277482, -0.7905405, -1.722308, 1, 0, 0, 1, 1,
-1.273803, 0.1604394, -1.880631, 1, 0, 0, 1, 1,
-1.264837, 1.083272, -0.526181, 1, 0, 0, 1, 1,
-1.264547, -0.9684275, -3.016062, 0, 0, 0, 1, 1,
-1.251513, -0.9613631, -2.394752, 0, 0, 0, 1, 1,
-1.249589, 0.5959119, -0.9200231, 0, 0, 0, 1, 1,
-1.24477, 0.006738949, -2.218576, 0, 0, 0, 1, 1,
-1.241488, 0.7059148, 0.3587189, 0, 0, 0, 1, 1,
-1.240785, 0.5452223, -1.436663, 0, 0, 0, 1, 1,
-1.235875, 0.416942, -1.024118, 0, 0, 0, 1, 1,
-1.23454, -0.8048052, -2.666662, 1, 1, 1, 1, 1,
-1.22913, 0.645597, -1.573132, 1, 1, 1, 1, 1,
-1.227765, 0.4524633, -0.4404621, 1, 1, 1, 1, 1,
-1.22432, 0.3475401, -2.798558, 1, 1, 1, 1, 1,
-1.211457, 0.2179578, -1.864237, 1, 1, 1, 1, 1,
-1.210892, -1.079894, -3.150959, 1, 1, 1, 1, 1,
-1.208904, -0.9071724, -3.212018, 1, 1, 1, 1, 1,
-1.201406, 1.556778, -1.281303, 1, 1, 1, 1, 1,
-1.185877, 1.107965, 0.116412, 1, 1, 1, 1, 1,
-1.181451, 1.088013, -0.9428363, 1, 1, 1, 1, 1,
-1.176244, -0.1452805, -2.144043, 1, 1, 1, 1, 1,
-1.172153, 1.529013, -0.7398694, 1, 1, 1, 1, 1,
-1.16605, -0.3898122, -2.249193, 1, 1, 1, 1, 1,
-1.165758, 1.468273, -0.0289584, 1, 1, 1, 1, 1,
-1.165387, -0.1120987, -1.689634, 1, 1, 1, 1, 1,
-1.158417, 0.7354866, 0.5912596, 0, 0, 1, 1, 1,
-1.157854, -0.7096937, -2.312005, 1, 0, 0, 1, 1,
-1.157701, 0.6858628, -0.1343908, 1, 0, 0, 1, 1,
-1.157547, -0.1591353, -1.65996, 1, 0, 0, 1, 1,
-1.154308, -1.690054, -2.135761, 1, 0, 0, 1, 1,
-1.142234, -0.6017191, -0.5041445, 1, 0, 0, 1, 1,
-1.135612, -0.4492662, -1.374237, 0, 0, 0, 1, 1,
-1.120646, -1.232785, -1.63567, 0, 0, 0, 1, 1,
-1.120104, -1.190838, -2.300869, 0, 0, 0, 1, 1,
-1.119794, 0.2020693, -0.5783893, 0, 0, 0, 1, 1,
-1.117635, -0.3734133, -3.397286, 0, 0, 0, 1, 1,
-1.114909, -0.9214227, -1.149003, 0, 0, 0, 1, 1,
-1.113837, -0.04458664, -2.131148, 0, 0, 0, 1, 1,
-1.111086, -0.3478542, -1.385517, 1, 1, 1, 1, 1,
-1.094009, -1.539197, -2.655193, 1, 1, 1, 1, 1,
-1.093213, -1.814859, -3.559769, 1, 1, 1, 1, 1,
-1.085268, -0.5380806, -1.390431, 1, 1, 1, 1, 1,
-1.077354, -1.321272, -0.201042, 1, 1, 1, 1, 1,
-1.076274, 0.01144054, 0.8035784, 1, 1, 1, 1, 1,
-1.075407, 0.4302354, -2.239965, 1, 1, 1, 1, 1,
-1.072524, -0.03573892, -0.3957678, 1, 1, 1, 1, 1,
-1.069474, 1.062724, 1.378212, 1, 1, 1, 1, 1,
-1.065653, -0.8059242, -1.111117, 1, 1, 1, 1, 1,
-1.059095, -0.6342279, -4.156045, 1, 1, 1, 1, 1,
-1.053292, -1.181194, -0.9417198, 1, 1, 1, 1, 1,
-1.052422, 0.296059, -1.990848, 1, 1, 1, 1, 1,
-1.048529, 1.050859, -0.7458928, 1, 1, 1, 1, 1,
-1.041331, -0.7430275, -1.527087, 1, 1, 1, 1, 1,
-1.033771, -0.3522321, -1.393042, 0, 0, 1, 1, 1,
-1.03127, -0.8622231, -1.303161, 1, 0, 0, 1, 1,
-1.026479, -1.69527, -2.026039, 1, 0, 0, 1, 1,
-1.021609, 0.4251288, -3.820171, 1, 0, 0, 1, 1,
-1.017041, 1.183042, -0.9604267, 1, 0, 0, 1, 1,
-1.016399, 1.209893, -3.110725, 1, 0, 0, 1, 1,
-1.013276, -1.416923, -2.492056, 0, 0, 0, 1, 1,
-1.012961, 0.4611862, -2.329374, 0, 0, 0, 1, 1,
-1.009196, -0.3960307, -1.47446, 0, 0, 0, 1, 1,
-1.007882, -1.716447, -3.660728, 0, 0, 0, 1, 1,
-1.002805, 0.952362, -2.370018, 0, 0, 0, 1, 1,
-1.001406, 0.9477317, -0.7207814, 0, 0, 0, 1, 1,
-0.9980928, 0.1464508, -0.7047173, 0, 0, 0, 1, 1,
-0.9942107, 0.111817, -1.100575, 1, 1, 1, 1, 1,
-0.9922873, -0.2238625, -1.557272, 1, 1, 1, 1, 1,
-0.987218, 0.6746417, -0.644851, 1, 1, 1, 1, 1,
-0.964743, -2.043346, -2.267957, 1, 1, 1, 1, 1,
-0.9637569, 1.035167, 0.5411832, 1, 1, 1, 1, 1,
-0.9600976, -0.6979114, -3.108623, 1, 1, 1, 1, 1,
-0.9598216, -1.423254, -3.218776, 1, 1, 1, 1, 1,
-0.9572775, -1.185876, -3.980663, 1, 1, 1, 1, 1,
-0.9489308, -0.7750667, -2.636313, 1, 1, 1, 1, 1,
-0.9361987, 0.3295047, -2.328447, 1, 1, 1, 1, 1,
-0.932888, -0.7439111, -2.409037, 1, 1, 1, 1, 1,
-0.9305466, -2.06671, -2.624482, 1, 1, 1, 1, 1,
-0.9280495, -0.7638834, -1.709894, 1, 1, 1, 1, 1,
-0.9230964, 0.7983094, 0.149726, 1, 1, 1, 1, 1,
-0.9209403, -1.017049, -1.457349, 1, 1, 1, 1, 1,
-0.9207264, 0.7475895, 0.5569415, 0, 0, 1, 1, 1,
-0.9149674, -0.06858897, -2.773538, 1, 0, 0, 1, 1,
-0.9146433, -2.20421, -1.006093, 1, 0, 0, 1, 1,
-0.9144132, 0.07174372, -1.512094, 1, 0, 0, 1, 1,
-0.912836, 0.20939, -0.4198449, 1, 0, 0, 1, 1,
-0.9114828, 1.239509, -0.806938, 1, 0, 0, 1, 1,
-0.9103578, -0.4141138, -2.489521, 0, 0, 0, 1, 1,
-0.901605, 0.8434759, -0.5231136, 0, 0, 0, 1, 1,
-0.8975121, -0.6525832, -2.303436, 0, 0, 0, 1, 1,
-0.8923247, 0.7314485, -0.6953388, 0, 0, 0, 1, 1,
-0.8881631, 0.1689621, -1.400509, 0, 0, 0, 1, 1,
-0.884866, 0.04603913, -1.410633, 0, 0, 0, 1, 1,
-0.8822099, -1.817621, -2.736747, 0, 0, 0, 1, 1,
-0.8821045, 1.696159, -1.32398, 1, 1, 1, 1, 1,
-0.8733996, 0.9457272, 1.309464, 1, 1, 1, 1, 1,
-0.8651708, 0.5874235, 0.3498844, 1, 1, 1, 1, 1,
-0.8440667, 0.8971316, 1.503299, 1, 1, 1, 1, 1,
-0.8434856, -1.014112, -2.913468, 1, 1, 1, 1, 1,
-0.8414443, -1.60649, -5.041248, 1, 1, 1, 1, 1,
-0.8278156, -2.045485, -2.857207, 1, 1, 1, 1, 1,
-0.8271055, 0.1096724, -0.2378977, 1, 1, 1, 1, 1,
-0.8246142, -0.08026765, -1.458211, 1, 1, 1, 1, 1,
-0.8228678, -0.07000712, -2.013974, 1, 1, 1, 1, 1,
-0.8183833, 0.3296347, -1.660855, 1, 1, 1, 1, 1,
-0.8171911, -0.1361858, -1.960652, 1, 1, 1, 1, 1,
-0.8151178, -0.8961784, -1.952904, 1, 1, 1, 1, 1,
-0.8114671, -0.03549803, -2.262816, 1, 1, 1, 1, 1,
-0.8060411, -0.2815048, 0.2526906, 1, 1, 1, 1, 1,
-0.8058291, -0.1751312, -3.712435, 0, 0, 1, 1, 1,
-0.8044143, 0.2756192, -0.1659397, 1, 0, 0, 1, 1,
-0.797504, -2.400473, -1.687083, 1, 0, 0, 1, 1,
-0.7960849, 0.2969234, -1.47172, 1, 0, 0, 1, 1,
-0.7942386, -0.01741659, -0.59115, 1, 0, 0, 1, 1,
-0.790625, 0.3684, 1.057669, 1, 0, 0, 1, 1,
-0.7882876, 0.5461177, -1.391675, 0, 0, 0, 1, 1,
-0.7878899, -0.4561443, -0.6278222, 0, 0, 0, 1, 1,
-0.7799863, -0.5652876, -2.110474, 0, 0, 0, 1, 1,
-0.7775081, -0.6902094, -1.002729, 0, 0, 0, 1, 1,
-0.7774239, 0.7431465, -1.055768, 0, 0, 0, 1, 1,
-0.7751005, -1.016792, -1.797871, 0, 0, 0, 1, 1,
-0.768485, 0.2863606, -2.125398, 0, 0, 0, 1, 1,
-0.7680432, 1.092399, -1.960954, 1, 1, 1, 1, 1,
-0.7662942, 1.268138, 0.963596, 1, 1, 1, 1, 1,
-0.764439, 0.250979, -1.515787, 1, 1, 1, 1, 1,
-0.7515787, 1.181466, -1.407491, 1, 1, 1, 1, 1,
-0.7485739, -1.113373, -2.383769, 1, 1, 1, 1, 1,
-0.7430338, -0.2055623, -1.295892, 1, 1, 1, 1, 1,
-0.7350665, 0.8317885, 0.887553, 1, 1, 1, 1, 1,
-0.7340506, 0.04499184, -2.186686, 1, 1, 1, 1, 1,
-0.7251258, -0.6237602, -0.8596581, 1, 1, 1, 1, 1,
-0.7217426, -0.4547694, -1.103387, 1, 1, 1, 1, 1,
-0.7178121, -1.61448, -1.721876, 1, 1, 1, 1, 1,
-0.7108904, 0.05460963, -1.171474, 1, 1, 1, 1, 1,
-0.7091554, 1.052064, -1.51191, 1, 1, 1, 1, 1,
-0.7075687, -1.234133, -4.026368, 1, 1, 1, 1, 1,
-0.7064757, 0.5484589, -2.213839, 1, 1, 1, 1, 1,
-0.7046601, -0.8963202, -0.5096213, 0, 0, 1, 1, 1,
-0.6882496, 0.45924, 0.1348615, 1, 0, 0, 1, 1,
-0.6821717, -0.3419701, -2.41659, 1, 0, 0, 1, 1,
-0.6796826, 1.267211, -1.471957, 1, 0, 0, 1, 1,
-0.6760013, -0.4651004, -2.848488, 1, 0, 0, 1, 1,
-0.6724796, -0.382887, -3.029466, 1, 0, 0, 1, 1,
-0.6715044, -0.3156558, -0.4141898, 0, 0, 0, 1, 1,
-0.6661891, -0.9575539, -2.006758, 0, 0, 0, 1, 1,
-0.6660349, -0.7117712, -2.588497, 0, 0, 0, 1, 1,
-0.6635296, -0.3384303, -0.6746682, 0, 0, 0, 1, 1,
-0.6501242, 0.9810523, -0.4051309, 0, 0, 0, 1, 1,
-0.6491324, 0.3749351, -1.850286, 0, 0, 0, 1, 1,
-0.6422398, -0.05794131, -1.381194, 0, 0, 0, 1, 1,
-0.6351588, 1.474177, 1.160626, 1, 1, 1, 1, 1,
-0.6290326, 0.2249657, -1.248571, 1, 1, 1, 1, 1,
-0.626402, -1.50991, -3.7334, 1, 1, 1, 1, 1,
-0.6251912, -0.1034375, -3.201766, 1, 1, 1, 1, 1,
-0.6236001, -0.1743984, -1.71643, 1, 1, 1, 1, 1,
-0.6216834, -1.711395, -2.864879, 1, 1, 1, 1, 1,
-0.6187902, -1.025467, -2.452821, 1, 1, 1, 1, 1,
-0.6156455, 0.1900632, -0.3114598, 1, 1, 1, 1, 1,
-0.6123115, -1.709047, -3.487544, 1, 1, 1, 1, 1,
-0.6115783, -0.232591, -1.108213, 1, 1, 1, 1, 1,
-0.607492, 0.9405991, -0.277526, 1, 1, 1, 1, 1,
-0.5987156, -1.639966, -2.894166, 1, 1, 1, 1, 1,
-0.5965291, 0.1772557, -0.01383748, 1, 1, 1, 1, 1,
-0.5929321, 0.7048859, -0.1837227, 1, 1, 1, 1, 1,
-0.5911933, 0.5294454, -2.259433, 1, 1, 1, 1, 1,
-0.5909443, -0.3062054, -1.344204, 0, 0, 1, 1, 1,
-0.5881688, 0.2224214, -2.961415, 1, 0, 0, 1, 1,
-0.5855473, -0.6042533, -2.764881, 1, 0, 0, 1, 1,
-0.5852348, -0.3423486, -1.757388, 1, 0, 0, 1, 1,
-0.5826536, -0.8243814, -3.156532, 1, 0, 0, 1, 1,
-0.5814657, -0.593969, -2.484613, 1, 0, 0, 1, 1,
-0.5807863, -1.011775, -2.105361, 0, 0, 0, 1, 1,
-0.5807046, -0.5447978, -3.963524, 0, 0, 0, 1, 1,
-0.5760674, 0.1496349, -2.003265, 0, 0, 0, 1, 1,
-0.5747464, -0.4843588, -1.780353, 0, 0, 0, 1, 1,
-0.5736933, 0.6463518, 1.908183, 0, 0, 0, 1, 1,
-0.5735276, -0.9952582, -2.672329, 0, 0, 0, 1, 1,
-0.5732464, -1.187003, -3.621636, 0, 0, 0, 1, 1,
-0.5729234, 2.129132, -1.808644, 1, 1, 1, 1, 1,
-0.5708026, -0.2260278, -0.7458417, 1, 1, 1, 1, 1,
-0.5693541, 0.06561341, -0.6009082, 1, 1, 1, 1, 1,
-0.5666277, 1.377471, -0.1158585, 1, 1, 1, 1, 1,
-0.5660085, -0.5687411, -1.77789, 1, 1, 1, 1, 1,
-0.5655804, -0.3156481, -2.573992, 1, 1, 1, 1, 1,
-0.5629095, -0.7292996, -3.230033, 1, 1, 1, 1, 1,
-0.5627904, 1.732372, 0.481883, 1, 1, 1, 1, 1,
-0.5582354, -1.831453, -2.164939, 1, 1, 1, 1, 1,
-0.5579025, 1.745622, -1.582242, 1, 1, 1, 1, 1,
-0.555478, 0.5739294, -1.507609, 1, 1, 1, 1, 1,
-0.5527262, 0.411509, -0.972412, 1, 1, 1, 1, 1,
-0.5495794, 1.780511, 0.9125539, 1, 1, 1, 1, 1,
-0.5376056, 0.2133341, -0.4522244, 1, 1, 1, 1, 1,
-0.5357497, 0.8553544, -2.024738, 1, 1, 1, 1, 1,
-0.5330906, 1.809763, -0.8619048, 0, 0, 1, 1, 1,
-0.5283849, 0.043577, -0.8705727, 1, 0, 0, 1, 1,
-0.5251033, -1.007905, -1.487275, 1, 0, 0, 1, 1,
-0.5243136, 0.3180302, -0.8635737, 1, 0, 0, 1, 1,
-0.5210355, -1.372267, -3.462491, 1, 0, 0, 1, 1,
-0.5187191, -0.1796604, -1.657837, 1, 0, 0, 1, 1,
-0.5186963, -0.3654433, -2.943677, 0, 0, 0, 1, 1,
-0.5186059, -1.295709, -4.10264, 0, 0, 0, 1, 1,
-0.5146214, -0.7397804, -2.294668, 0, 0, 0, 1, 1,
-0.513577, 0.7131011, -1.341937, 0, 0, 0, 1, 1,
-0.5125443, 0.924232, -1.650953, 0, 0, 0, 1, 1,
-0.5104247, 0.8155692, 0.01270815, 0, 0, 0, 1, 1,
-0.5094445, -0.3740982, -1.940338, 0, 0, 0, 1, 1,
-0.5089006, 0.9399449, -1.225884, 1, 1, 1, 1, 1,
-0.5072329, -1.117442, -0.5733206, 1, 1, 1, 1, 1,
-0.4945023, 0.5743941, -0.6248927, 1, 1, 1, 1, 1,
-0.4918506, -0.3018159, -2.708025, 1, 1, 1, 1, 1,
-0.4900831, -1.40586, -1.74294, 1, 1, 1, 1, 1,
-0.4873241, 0.6447974, 0.4244563, 1, 1, 1, 1, 1,
-0.4848473, 0.4568076, -2.047294, 1, 1, 1, 1, 1,
-0.4802423, -0.2997333, -1.240316, 1, 1, 1, 1, 1,
-0.4759288, 0.8314946, 1.616448, 1, 1, 1, 1, 1,
-0.4701263, 0.816905, 0.5925898, 1, 1, 1, 1, 1,
-0.4693898, 1.390785, -0.5864087, 1, 1, 1, 1, 1,
-0.4670672, 0.5012049, -0.7259389, 1, 1, 1, 1, 1,
-0.4661948, -0.5152257, -4.257929, 1, 1, 1, 1, 1,
-0.4629557, -0.7365248, -2.962989, 1, 1, 1, 1, 1,
-0.4608499, 0.6865777, -0.8190961, 1, 1, 1, 1, 1,
-0.4596356, 0.1641367, -0.5494993, 0, 0, 1, 1, 1,
-0.4584321, 0.1100648, -1.408288, 1, 0, 0, 1, 1,
-0.4574297, 0.4024771, -1.756112, 1, 0, 0, 1, 1,
-0.4567324, -0.3091671, -1.666183, 1, 0, 0, 1, 1,
-0.4530231, 1.016354, -0.9438277, 1, 0, 0, 1, 1,
-0.4517305, -1.865636, -1.688942, 1, 0, 0, 1, 1,
-0.4515052, 1.040032, -1.005598, 0, 0, 0, 1, 1,
-0.4502563, 0.760522, 0.3232016, 0, 0, 0, 1, 1,
-0.4497801, 0.09233174, -1.340111, 0, 0, 0, 1, 1,
-0.4479988, 0.7937417, 0.166055, 0, 0, 0, 1, 1,
-0.4441157, -0.4036885, -2.787999, 0, 0, 0, 1, 1,
-0.4433714, 0.581997, 0.7135772, 0, 0, 0, 1, 1,
-0.4407192, 0.4730783, -1.689464, 0, 0, 0, 1, 1,
-0.4406298, -0.2709424, -4.639575, 1, 1, 1, 1, 1,
-0.4347213, 1.506139, 0.04890254, 1, 1, 1, 1, 1,
-0.4298378, 2.330422, 0.4610191, 1, 1, 1, 1, 1,
-0.4287885, 0.8455468, 1.246865, 1, 1, 1, 1, 1,
-0.4278134, -0.1683251, -1.635809, 1, 1, 1, 1, 1,
-0.421772, 0.8011697, -0.7575806, 1, 1, 1, 1, 1,
-0.4207559, 0.9241313, -0.4783684, 1, 1, 1, 1, 1,
-0.4204309, 0.1852055, -0.3688191, 1, 1, 1, 1, 1,
-0.4186118, 0.5115625, -0.7345735, 1, 1, 1, 1, 1,
-0.4146785, -0.6016999, -1.814289, 1, 1, 1, 1, 1,
-0.4126212, -0.1169645, -1.292049, 1, 1, 1, 1, 1,
-0.4107167, -0.108426, -2.184015, 1, 1, 1, 1, 1,
-0.4094428, -0.5867648, -3.555681, 1, 1, 1, 1, 1,
-0.3973927, -0.4390985, -2.054486, 1, 1, 1, 1, 1,
-0.3965434, -0.517847, -2.495701, 1, 1, 1, 1, 1,
-0.3949171, 0.1743679, -1.879885, 0, 0, 1, 1, 1,
-0.3928467, -0.6023713, -1.159585, 1, 0, 0, 1, 1,
-0.3804531, 1.853583, -0.3400794, 1, 0, 0, 1, 1,
-0.3768714, -0.8003154, -3.548502, 1, 0, 0, 1, 1,
-0.3740403, -1.685949, -2.700789, 1, 0, 0, 1, 1,
-0.3705014, 1.016946, 0.5419174, 1, 0, 0, 1, 1,
-0.3692845, -0.4263464, -3.238102, 0, 0, 0, 1, 1,
-0.3547669, -1.934314, -2.130707, 0, 0, 0, 1, 1,
-0.350774, -0.4316945, -0.4318503, 0, 0, 0, 1, 1,
-0.3481685, 0.284718, -0.8921586, 0, 0, 0, 1, 1,
-0.3470546, 0.3570125, -2.076578, 0, 0, 0, 1, 1,
-0.344503, 0.5085658, -1.288021, 0, 0, 0, 1, 1,
-0.3417322, -0.07706945, -2.094287, 0, 0, 0, 1, 1,
-0.3408057, 0.005456265, -1.266709, 1, 1, 1, 1, 1,
-0.3384795, 0.005025787, -1.440676, 1, 1, 1, 1, 1,
-0.335079, -1.382071, -3.495177, 1, 1, 1, 1, 1,
-0.3316645, -0.8882461, -1.143272, 1, 1, 1, 1, 1,
-0.3274789, -1.561038, -2.706907, 1, 1, 1, 1, 1,
-0.3267291, 1.216973, -0.9596347, 1, 1, 1, 1, 1,
-0.3235181, 1.689788, -0.9330305, 1, 1, 1, 1, 1,
-0.3177531, 0.07625397, -1.830771, 1, 1, 1, 1, 1,
-0.3158656, -0.1224841, -1.999964, 1, 1, 1, 1, 1,
-0.3139697, -0.8598645, -3.078473, 1, 1, 1, 1, 1,
-0.3128182, -0.08176746, -2.138651, 1, 1, 1, 1, 1,
-0.3118021, 0.2437554, -0.2207956, 1, 1, 1, 1, 1,
-0.3109308, -0.9773079, -4.359251, 1, 1, 1, 1, 1,
-0.3054351, 0.7811906, -0.8481727, 1, 1, 1, 1, 1,
-0.3048711, 0.8403872, -0.174608, 1, 1, 1, 1, 1,
-0.3014948, 0.6147705, 0.1216318, 0, 0, 1, 1, 1,
-0.3006328, -0.1403753, -1.920533, 1, 0, 0, 1, 1,
-0.3005559, -0.323611, -1.841433, 1, 0, 0, 1, 1,
-0.2996822, -0.09597449, -0.5816026, 1, 0, 0, 1, 1,
-0.2943681, -0.3093833, -2.864996, 1, 0, 0, 1, 1,
-0.2916563, -0.420503, -2.709813, 1, 0, 0, 1, 1,
-0.2823476, 1.712866, -2.570989, 0, 0, 0, 1, 1,
-0.2801887, -1.154541, -3.7941, 0, 0, 0, 1, 1,
-0.2789053, 0.5633671, -1.055161, 0, 0, 0, 1, 1,
-0.2786652, 0.4244567, -1.569759, 0, 0, 0, 1, 1,
-0.2767005, 0.8038481, -1.253355, 0, 0, 0, 1, 1,
-0.2763808, 1.690565, -0.02959221, 0, 0, 0, 1, 1,
-0.2664905, -0.8636391, -4.939766, 0, 0, 0, 1, 1,
-0.2649542, -0.9003819, -2.815452, 1, 1, 1, 1, 1,
-0.2611984, 1.662264, -0.4952839, 1, 1, 1, 1, 1,
-0.2588699, 1.045852, -0.9423724, 1, 1, 1, 1, 1,
-0.2506154, 0.5359042, -1.198446, 1, 1, 1, 1, 1,
-0.2503208, -1.169523, -3.549299, 1, 1, 1, 1, 1,
-0.2486015, -0.3479179, -2.105032, 1, 1, 1, 1, 1,
-0.2476999, -0.7519154, -3.761497, 1, 1, 1, 1, 1,
-0.2432642, 1.258911, 0.151852, 1, 1, 1, 1, 1,
-0.2424894, 1.996548, -0.9216983, 1, 1, 1, 1, 1,
-0.2339766, 0.01261714, -1.53781, 1, 1, 1, 1, 1,
-0.2326136, -0.5682697, -3.195391, 1, 1, 1, 1, 1,
-0.2313096, -1.066415, -3.247756, 1, 1, 1, 1, 1,
-0.230653, 1.485689, 0.5625294, 1, 1, 1, 1, 1,
-0.2303814, -2.293206, -3.453486, 1, 1, 1, 1, 1,
-0.229945, 0.391553, -1.245926, 1, 1, 1, 1, 1,
-0.2277209, -0.2835878, -1.905352, 0, 0, 1, 1, 1,
-0.2274664, -0.383692, -3.74972, 1, 0, 0, 1, 1,
-0.2146056, -1.717291, -3.391151, 1, 0, 0, 1, 1,
-0.2050693, -0.7152835, -4.299386, 1, 0, 0, 1, 1,
-0.2022915, -1.195274, -3.286516, 1, 0, 0, 1, 1,
-0.1984331, 1.414889, -1.79016, 1, 0, 0, 1, 1,
-0.1960206, -0.8870542, -2.564332, 0, 0, 0, 1, 1,
-0.1943573, 1.553583, -0.7713724, 0, 0, 0, 1, 1,
-0.191209, -1.533177, -2.813632, 0, 0, 0, 1, 1,
-0.1897489, 0.196737, -2.263111, 0, 0, 0, 1, 1,
-0.1886616, -1.570636, -2.871604, 0, 0, 0, 1, 1,
-0.1828258, 0.6766546, -0.2151034, 0, 0, 0, 1, 1,
-0.179205, 0.9260927, 1.30959, 0, 0, 0, 1, 1,
-0.1784925, -0.7585394, -3.382835, 1, 1, 1, 1, 1,
-0.1780952, -0.07530882, -3.137695, 1, 1, 1, 1, 1,
-0.176109, 0.1769897, -0.01526261, 1, 1, 1, 1, 1,
-0.1749822, 0.8144232, -0.4152019, 1, 1, 1, 1, 1,
-0.1739238, -0.3532071, -3.539577, 1, 1, 1, 1, 1,
-0.1713656, -0.8503832, -3.4017, 1, 1, 1, 1, 1,
-0.1695672, 0.4557672, -1.031674, 1, 1, 1, 1, 1,
-0.1592424, 0.9988316, -0.987509, 1, 1, 1, 1, 1,
-0.1565016, -0.3885161, -3.795966, 1, 1, 1, 1, 1,
-0.1556823, 0.4254526, -0.7539489, 1, 1, 1, 1, 1,
-0.1552903, 0.3057672, 0.8840646, 1, 1, 1, 1, 1,
-0.154597, 0.3523077, -0.2781465, 1, 1, 1, 1, 1,
-0.1535334, -2.243321, -3.527076, 1, 1, 1, 1, 1,
-0.1532639, -0.5862778, -2.390417, 1, 1, 1, 1, 1,
-0.1494497, 1.352001, 0.8318845, 1, 1, 1, 1, 1,
-0.1487096, -0.6245952, -3.073461, 0, 0, 1, 1, 1,
-0.146739, 0.2216758, -1.025032, 1, 0, 0, 1, 1,
-0.1395344, -1.557123, -4.168522, 1, 0, 0, 1, 1,
-0.1381709, 1.618141, 0.6403524, 1, 0, 0, 1, 1,
-0.1379241, 0.370382, 0.8064332, 1, 0, 0, 1, 1,
-0.1348947, 1.14913, -0.8773896, 1, 0, 0, 1, 1,
-0.1333721, -1.093619, 0.6839172, 0, 0, 0, 1, 1,
-0.1305519, -0.3451245, -3.177676, 0, 0, 0, 1, 1,
-0.1291908, -0.9450784, -1.687823, 0, 0, 0, 1, 1,
-0.12879, 0.09265597, -0.6045228, 0, 0, 0, 1, 1,
-0.1270379, -0.8575428, -2.945747, 0, 0, 0, 1, 1,
-0.1218157, -3.321357, -2.940026, 0, 0, 0, 1, 1,
-0.1209445, -1.183597, -3.011947, 0, 0, 0, 1, 1,
-0.1205173, 1.037336, 1.047292, 1, 1, 1, 1, 1,
-0.1199659, -0.3429171, -4.44846, 1, 1, 1, 1, 1,
-0.1168781, -0.01386912, -1.759907, 1, 1, 1, 1, 1,
-0.1165569, -0.4787846, -4.906675, 1, 1, 1, 1, 1,
-0.1105739, 0.6926153, 1.967074, 1, 1, 1, 1, 1,
-0.1063243, -0.2310296, -0.913632, 1, 1, 1, 1, 1,
-0.1038355, 0.0530023, 1.545613, 1, 1, 1, 1, 1,
-0.1029299, 0.4003313, 0.09007968, 1, 1, 1, 1, 1,
-0.1015797, 0.4757214, -0.910975, 1, 1, 1, 1, 1,
-0.09202044, 0.01193732, -1.394431, 1, 1, 1, 1, 1,
-0.08988015, 0.08137643, 0.2595306, 1, 1, 1, 1, 1,
-0.08985872, -0.4596581, -3.656334, 1, 1, 1, 1, 1,
-0.08974996, 0.8208988, 0.3621019, 1, 1, 1, 1, 1,
-0.08827372, -0.3960615, -1.743971, 1, 1, 1, 1, 1,
-0.06156451, 0.2461739, 1.368958, 1, 1, 1, 1, 1,
-0.05815873, 0.2280579, -0.2563152, 0, 0, 1, 1, 1,
-0.05755113, -1.372023, -3.719622, 1, 0, 0, 1, 1,
-0.05721316, -0.4351219, -2.481933, 1, 0, 0, 1, 1,
-0.05391527, -1.418836, -4.11235, 1, 0, 0, 1, 1,
-0.05132044, -0.721182, -1.627313, 1, 0, 0, 1, 1,
-0.0509039, 0.4354585, -0.1912918, 1, 0, 0, 1, 1,
-0.04942945, 1.120283, 0.4407521, 0, 0, 0, 1, 1,
-0.04926436, -0.07622606, -2.072532, 0, 0, 0, 1, 1,
-0.04845582, -0.5116864, -4.364057, 0, 0, 0, 1, 1,
-0.04646917, 0.9414518, -0.3752277, 0, 0, 0, 1, 1,
-0.04542881, 0.7105757, 0.5324516, 0, 0, 0, 1, 1,
-0.04335281, -1.483577, -2.541728, 0, 0, 0, 1, 1,
-0.04313065, -0.81961, -2.46286, 0, 0, 0, 1, 1,
-0.03865432, -0.06679554, -1.116398, 1, 1, 1, 1, 1,
-0.03828121, -1.172855, -3.968549, 1, 1, 1, 1, 1,
-0.03644868, -1.240448, -1.441259, 1, 1, 1, 1, 1,
-0.03625553, -0.1522007, -3.239101, 1, 1, 1, 1, 1,
-0.03531141, -0.0808861, -3.669555, 1, 1, 1, 1, 1,
-0.03244869, 1.36644, -1.857582, 1, 1, 1, 1, 1,
-0.03192942, 1.050859, -4.643482, 1, 1, 1, 1, 1,
-0.03054036, -0.1918884, -2.456935, 1, 1, 1, 1, 1,
-0.02691727, 1.962453, -0.1798278, 1, 1, 1, 1, 1,
-0.02449969, -1.047575, -1.581037, 1, 1, 1, 1, 1,
-0.02343025, 0.007645653, -1.42998, 1, 1, 1, 1, 1,
-0.01674081, 0.4057961, 0.7446147, 1, 1, 1, 1, 1,
-0.01071887, -1.174922, -4.815425, 1, 1, 1, 1, 1,
-0.01054693, -1.492687, -3.117792, 1, 1, 1, 1, 1,
-0.01022396, 0.4158685, 1.750834, 1, 1, 1, 1, 1,
-0.008940008, 0.877486, 1.531003, 0, 0, 1, 1, 1,
-0.008220899, -0.4308286, -4.391164, 1, 0, 0, 1, 1,
-0.005520689, 0.933505, -0.6800891, 1, 0, 0, 1, 1,
0.006710142, -0.954996, 3.300741, 1, 0, 0, 1, 1,
0.00835184, 0.1418648, 0.5233963, 1, 0, 0, 1, 1,
0.009954606, -0.2387105, 0.6149922, 1, 0, 0, 1, 1,
0.01502545, -0.6773754, 0.8677487, 0, 0, 0, 1, 1,
0.015798, 0.6344606, -0.2096054, 0, 0, 0, 1, 1,
0.01773568, 1.513893, -0.1165118, 0, 0, 0, 1, 1,
0.02097005, 0.4978755, -1.809777, 0, 0, 0, 1, 1,
0.02138944, -0.3303997, 2.553977, 0, 0, 0, 1, 1,
0.02384973, 1.302539, -0.6391087, 0, 0, 0, 1, 1,
0.02784567, 0.09065958, 0.2378782, 0, 0, 0, 1, 1,
0.03054215, -0.4716736, 4.565045, 1, 1, 1, 1, 1,
0.03096539, -0.8570772, 2.02136, 1, 1, 1, 1, 1,
0.0317976, -1.504082, 4.457082, 1, 1, 1, 1, 1,
0.0318775, 1.793864, -0.2663152, 1, 1, 1, 1, 1,
0.03447762, -0.1861955, 2.792665, 1, 1, 1, 1, 1,
0.03979034, 0.4026671, 0.3366942, 1, 1, 1, 1, 1,
0.04164563, 1.663157, 0.7895454, 1, 1, 1, 1, 1,
0.04329733, -1.013523, 4.411645, 1, 1, 1, 1, 1,
0.04811669, 2.631387, 0.2652156, 1, 1, 1, 1, 1,
0.04864674, -1.42084, 2.063334, 1, 1, 1, 1, 1,
0.05607582, -1.074155, 1.488374, 1, 1, 1, 1, 1,
0.0560923, -0.6998444, 2.481282, 1, 1, 1, 1, 1,
0.05676968, -1.590061, 2.734437, 1, 1, 1, 1, 1,
0.05821816, 0.5996763, -0.1448062, 1, 1, 1, 1, 1,
0.05983429, 0.6822042, -1.983541, 1, 1, 1, 1, 1,
0.06090852, -0.3794385, 4.002395, 0, 0, 1, 1, 1,
0.06380875, -0.8675604, 4.737742, 1, 0, 0, 1, 1,
0.06404437, 0.6089088, 0.4819747, 1, 0, 0, 1, 1,
0.06646954, -0.605946, 2.63671, 1, 0, 0, 1, 1,
0.06934606, -1.039808, 3.552743, 1, 0, 0, 1, 1,
0.07098905, 0.5939215, -0.8132566, 1, 0, 0, 1, 1,
0.07411785, 0.09687095, -1.196643, 0, 0, 0, 1, 1,
0.08007056, -0.1413644, 2.868162, 0, 0, 0, 1, 1,
0.08073302, -0.6039503, 2.76431, 0, 0, 0, 1, 1,
0.08368871, -1.259341, 2.881829, 0, 0, 0, 1, 1,
0.08695607, 0.2174868, -0.6499302, 0, 0, 0, 1, 1,
0.09057669, 0.9090243, -0.8478975, 0, 0, 0, 1, 1,
0.09169628, 0.5743517, -1.482252, 0, 0, 0, 1, 1,
0.09214558, -0.1811676, 3.641323, 1, 1, 1, 1, 1,
0.0950701, -0.5408314, 2.696593, 1, 1, 1, 1, 1,
0.0973224, -0.7398849, 2.908179, 1, 1, 1, 1, 1,
0.1012793, 0.982347, -0.9133642, 1, 1, 1, 1, 1,
0.1013638, -0.06091741, 2.43328, 1, 1, 1, 1, 1,
0.1030984, -0.748399, 2.722042, 1, 1, 1, 1, 1,
0.1032176, -1.809789, 0.9116656, 1, 1, 1, 1, 1,
0.1041378, -0.9501693, 3.286, 1, 1, 1, 1, 1,
0.1044902, -2.592315, 3.518648, 1, 1, 1, 1, 1,
0.1061937, -0.3180367, 2.78647, 1, 1, 1, 1, 1,
0.1123595, -0.5939804, 2.052085, 1, 1, 1, 1, 1,
0.1124937, -0.1173443, 2.896303, 1, 1, 1, 1, 1,
0.115305, -0.5904413, 3.2464, 1, 1, 1, 1, 1,
0.1155993, 0.8656429, 0.3192568, 1, 1, 1, 1, 1,
0.1158233, 0.3110603, 1.876088, 1, 1, 1, 1, 1,
0.1225338, 0.09231625, 2.22413, 0, 0, 1, 1, 1,
0.1244254, 0.6017893, 0.4258949, 1, 0, 0, 1, 1,
0.1265227, -0.5185285, 2.450732, 1, 0, 0, 1, 1,
0.1296764, -1.552058, 2.396248, 1, 0, 0, 1, 1,
0.1322766, -1.58665, 2.634526, 1, 0, 0, 1, 1,
0.1383097, 0.6465938, 1.235452, 1, 0, 0, 1, 1,
0.1395305, 0.5208896, 0.07963672, 0, 0, 0, 1, 1,
0.1408905, 0.555637, 1.264481, 0, 0, 0, 1, 1,
0.1436803, -0.6287346, 3.563641, 0, 0, 0, 1, 1,
0.1450264, -0.2272848, 1.482714, 0, 0, 0, 1, 1,
0.1507943, 0.8283013, -0.3329206, 0, 0, 0, 1, 1,
0.1516605, 0.04642389, 1.692415, 0, 0, 0, 1, 1,
0.1524017, 1.145145, -0.7439661, 0, 0, 0, 1, 1,
0.1555488, 1.244704, 0.7743545, 1, 1, 1, 1, 1,
0.156045, 1.518613, -0.567482, 1, 1, 1, 1, 1,
0.157218, -3.467506, 2.495236, 1, 1, 1, 1, 1,
0.1582549, 1.038556, -0.666308, 1, 1, 1, 1, 1,
0.158596, 0.2641289, 0.908098, 1, 1, 1, 1, 1,
0.1590742, 1.365046, -0.3188728, 1, 1, 1, 1, 1,
0.1599598, -0.7662888, 2.067068, 1, 1, 1, 1, 1,
0.160088, -1.276637, 3.34081, 1, 1, 1, 1, 1,
0.1754092, -0.2329025, 1.217286, 1, 1, 1, 1, 1,
0.1757447, 1.947998, -0.7175184, 1, 1, 1, 1, 1,
0.1772353, 0.5557721, 1.200113, 1, 1, 1, 1, 1,
0.184487, 1.196427, 0.1089269, 1, 1, 1, 1, 1,
0.1893848, -1.170744, 2.549917, 1, 1, 1, 1, 1,
0.1934997, 0.07383672, 0.7779576, 1, 1, 1, 1, 1,
0.1987091, -1.371661, 2.800874, 1, 1, 1, 1, 1,
0.2002177, 0.1427339, 0.8585585, 0, 0, 1, 1, 1,
0.2016055, -1.247554, 1.835977, 1, 0, 0, 1, 1,
0.2075286, 0.4665902, 1.732058, 1, 0, 0, 1, 1,
0.2086843, 0.1611434, -0.9244651, 1, 0, 0, 1, 1,
0.2153185, 0.7538329, 0.8279501, 1, 0, 0, 1, 1,
0.2180658, 0.005669124, 3.052063, 1, 0, 0, 1, 1,
0.2191663, 0.7110146, -0.4391141, 0, 0, 0, 1, 1,
0.2207973, 2.104653, -0.2089628, 0, 0, 0, 1, 1,
0.2230243, 0.2863652, 0.04229303, 0, 0, 0, 1, 1,
0.223405, 1.019964, 0.699474, 0, 0, 0, 1, 1,
0.2269914, 0.9244567, 1.49184, 0, 0, 0, 1, 1,
0.2342482, -0.5847179, 1.102673, 0, 0, 0, 1, 1,
0.2353551, 1.32289, -0.0408835, 0, 0, 0, 1, 1,
0.2399758, -0.3577116, 1.868114, 1, 1, 1, 1, 1,
0.2488429, 0.7562197, 0.8418468, 1, 1, 1, 1, 1,
0.2510672, -0.2255745, 1.604863, 1, 1, 1, 1, 1,
0.2511133, -0.229685, 1.63586, 1, 1, 1, 1, 1,
0.2557201, -0.1237465, 1.705944, 1, 1, 1, 1, 1,
0.258379, -0.8840416, 2.381637, 1, 1, 1, 1, 1,
0.2594486, 1.51687, -0.574975, 1, 1, 1, 1, 1,
0.2618662, -0.4991876, 1.287597, 1, 1, 1, 1, 1,
0.268508, -0.1109553, 1.697373, 1, 1, 1, 1, 1,
0.2687195, 0.5821206, 1.052896, 1, 1, 1, 1, 1,
0.2687534, 0.1829831, 1.945764, 1, 1, 1, 1, 1,
0.2703408, -0.4043754, 2.589832, 1, 1, 1, 1, 1,
0.2779262, 2.294522, 1.05162, 1, 1, 1, 1, 1,
0.278714, -0.09567518, 2.337179, 1, 1, 1, 1, 1,
0.2788192, 0.6012753, -0.1484037, 1, 1, 1, 1, 1,
0.2794513, -0.7517762, 3.192713, 0, 0, 1, 1, 1,
0.2804312, -0.6886286, 2.762399, 1, 0, 0, 1, 1,
0.2806323, -0.405048, 3.309181, 1, 0, 0, 1, 1,
0.2812076, 1.157188, 0.8358989, 1, 0, 0, 1, 1,
0.2815963, 1.883332, 1.005757, 1, 0, 0, 1, 1,
0.2816427, -1.409575, 2.353563, 1, 0, 0, 1, 1,
0.2825686, -0.2039227, 3.337129, 0, 0, 0, 1, 1,
0.2838692, 0.1660778, 1.250619, 0, 0, 0, 1, 1,
0.2846784, -1.107498, 2.545835, 0, 0, 0, 1, 1,
0.2903158, 0.3907656, -1.934893, 0, 0, 0, 1, 1,
0.2929039, 0.4520405, -1.676414, 0, 0, 0, 1, 1,
0.297959, 0.3221397, 0.9673579, 0, 0, 0, 1, 1,
0.2991627, -1.195697, 3.611202, 0, 0, 0, 1, 1,
0.3005719, 0.3563569, -0.7946106, 1, 1, 1, 1, 1,
0.3041952, 0.4978543, 1.617403, 1, 1, 1, 1, 1,
0.3059593, -0.628285, 3.602204, 1, 1, 1, 1, 1,
0.3069888, -0.7864381, 2.460082, 1, 1, 1, 1, 1,
0.3165292, -1.526672, 2.862177, 1, 1, 1, 1, 1,
0.3176005, -0.6104871, 2.439952, 1, 1, 1, 1, 1,
0.3201123, -0.6883959, 3.529364, 1, 1, 1, 1, 1,
0.3224319, 1.314884, 0.9465979, 1, 1, 1, 1, 1,
0.3245046, -0.6104865, 2.380054, 1, 1, 1, 1, 1,
0.3269988, -0.8105302, 3.449272, 1, 1, 1, 1, 1,
0.3283238, 1.131932, 0.4876961, 1, 1, 1, 1, 1,
0.3284021, 0.9294075, -0.9111779, 1, 1, 1, 1, 1,
0.3286506, -2.22952, 3.423094, 1, 1, 1, 1, 1,
0.3329941, -0.7652937, 3.298118, 1, 1, 1, 1, 1,
0.3330566, -0.5948499, 3.008275, 1, 1, 1, 1, 1,
0.3350377, 0.4430374, 0.4868118, 0, 0, 1, 1, 1,
0.3368483, -0.319802, 2.640061, 1, 0, 0, 1, 1,
0.3479847, -1.870044, 2.868309, 1, 0, 0, 1, 1,
0.3483684, 1.125976, 0.2123399, 1, 0, 0, 1, 1,
0.349316, -1.349548, 2.14202, 1, 0, 0, 1, 1,
0.3523115, -1.219894, 1.987024, 1, 0, 0, 1, 1,
0.3669198, -0.1287335, -0.9653826, 0, 0, 0, 1, 1,
0.3722167, 0.6080677, -0.1354615, 0, 0, 0, 1, 1,
0.3726562, -0.662663, 1.189737, 0, 0, 0, 1, 1,
0.3778499, -0.7368916, 0.9878007, 0, 0, 0, 1, 1,
0.3829597, -1.097912, 3.957223, 0, 0, 0, 1, 1,
0.3830063, 1.323869, -0.9659956, 0, 0, 0, 1, 1,
0.3875817, -1.144497, 4.025856, 0, 0, 0, 1, 1,
0.3877599, 0.8677889, -0.1164203, 1, 1, 1, 1, 1,
0.3889323, -0.3260641, 2.725605, 1, 1, 1, 1, 1,
0.3904405, 1.766965, 2.457012, 1, 1, 1, 1, 1,
0.3941048, -0.7246941, 4.698719, 1, 1, 1, 1, 1,
0.3954566, -1.280651, 2.255006, 1, 1, 1, 1, 1,
0.4025144, 0.6057196, 1.827212, 1, 1, 1, 1, 1,
0.4028126, -2.368428, 4.898333, 1, 1, 1, 1, 1,
0.4084325, -0.1136209, 1.332519, 1, 1, 1, 1, 1,
0.4091732, 1.17797, 3.093598, 1, 1, 1, 1, 1,
0.4097755, 0.7250268, 1.922623, 1, 1, 1, 1, 1,
0.4154712, -0.06192404, 1.807602, 1, 1, 1, 1, 1,
0.4160605, 0.8997467, 0.8513815, 1, 1, 1, 1, 1,
0.424371, -2.715461, 0.2200221, 1, 1, 1, 1, 1,
0.4285523, 0.629339, 1.20628, 1, 1, 1, 1, 1,
0.4303332, -1.584611, 4.034243, 1, 1, 1, 1, 1,
0.4340118, -0.8342578, 4.184632, 0, 0, 1, 1, 1,
0.4360515, 0.6215103, 1.201012, 1, 0, 0, 1, 1,
0.4379533, 0.1517076, 0.2327806, 1, 0, 0, 1, 1,
0.4483897, 1.02158, 1.773755, 1, 0, 0, 1, 1,
0.454372, -0.5985075, 2.665634, 1, 0, 0, 1, 1,
0.4545251, -0.4795024, 1.302659, 1, 0, 0, 1, 1,
0.4549233, 0.3174839, 1.462699, 0, 0, 0, 1, 1,
0.4620242, 1.211182, 2.031563, 0, 0, 0, 1, 1,
0.4655023, 1.741048, 1.103544, 0, 0, 0, 1, 1,
0.4682924, 1.111915, -0.07137877, 0, 0, 0, 1, 1,
0.4703422, -0.6163614, 2.290066, 0, 0, 0, 1, 1,
0.4720989, -1.292069, 3.719152, 0, 0, 0, 1, 1,
0.4726289, -1.195975, 2.026423, 0, 0, 0, 1, 1,
0.4727459, -0.5672526, 3.472363, 1, 1, 1, 1, 1,
0.4730928, -0.1324446, 2.373748, 1, 1, 1, 1, 1,
0.4735063, 0.2063854, 0.9728809, 1, 1, 1, 1, 1,
0.4753708, -1.183559, 2.153813, 1, 1, 1, 1, 1,
0.478294, 0.8610167, 0.8374506, 1, 1, 1, 1, 1,
0.4790733, 0.4372177, 1.132681, 1, 1, 1, 1, 1,
0.4796142, -0.07558052, 1.706685, 1, 1, 1, 1, 1,
0.4813547, -0.2424081, 2.517016, 1, 1, 1, 1, 1,
0.4839433, -0.1176442, 1.221751, 1, 1, 1, 1, 1,
0.4856651, -0.9364839, 3.012858, 1, 1, 1, 1, 1,
0.4866931, 2.091191, -0.1549537, 1, 1, 1, 1, 1,
0.4868194, 0.3675767, 0.6186514, 1, 1, 1, 1, 1,
0.4871796, 0.7631488, 0.7419506, 1, 1, 1, 1, 1,
0.4880571, -0.768706, 1.764653, 1, 1, 1, 1, 1,
0.4943832, -0.2391992, 2.265308, 1, 1, 1, 1, 1,
0.4958842, -0.7737043, 1.596527, 0, 0, 1, 1, 1,
0.4963384, 0.3862983, -0.4576772, 1, 0, 0, 1, 1,
0.4981295, -1.24549, 2.558307, 1, 0, 0, 1, 1,
0.5004491, -2.232569, 3.798284, 1, 0, 0, 1, 1,
0.5061437, -0.6226969, 3.527397, 1, 0, 0, 1, 1,
0.5092087, 1.015626, 0.7658525, 1, 0, 0, 1, 1,
0.5147104, -0.9977078, 3.180537, 0, 0, 0, 1, 1,
0.5169377, 0.07309675, 0.8220387, 0, 0, 0, 1, 1,
0.5173786, 0.6693646, -0.6368491, 0, 0, 0, 1, 1,
0.5198352, 1.133575, 0.7043088, 0, 0, 0, 1, 1,
0.5226704, 0.9365113, -0.1690952, 0, 0, 0, 1, 1,
0.5250759, 0.4631478, 2.056104, 0, 0, 0, 1, 1,
0.5268895, -0.3024187, 2.566388, 0, 0, 0, 1, 1,
0.5277495, -2.01784, 4.836488, 1, 1, 1, 1, 1,
0.5304947, -1.476947, 1.606525, 1, 1, 1, 1, 1,
0.5314987, 1.401802, -0.7847301, 1, 1, 1, 1, 1,
0.5315129, 0.4331348, 1.139338, 1, 1, 1, 1, 1,
0.5327799, -0.9378811, 1.929513, 1, 1, 1, 1, 1,
0.536402, -0.9699043, 2.367297, 1, 1, 1, 1, 1,
0.5366455, -0.2456208, 2.650453, 1, 1, 1, 1, 1,
0.5401375, -1.49644, 1.933358, 1, 1, 1, 1, 1,
0.5434354, -0.07013743, -0.1574996, 1, 1, 1, 1, 1,
0.5445832, 0.8066735, 0.3154308, 1, 1, 1, 1, 1,
0.5448074, 1.226524, 0.382387, 1, 1, 1, 1, 1,
0.546145, -3.473999, 4.342784, 1, 1, 1, 1, 1,
0.5500277, -0.1017547, -0.6068333, 1, 1, 1, 1, 1,
0.5503076, 0.4245895, -0.4161731, 1, 1, 1, 1, 1,
0.5509129, 2.880092, -0.09170956, 1, 1, 1, 1, 1,
0.5534892, -0.4736236, 2.854831, 0, 0, 1, 1, 1,
0.5545816, 1.933889, -0.3851936, 1, 0, 0, 1, 1,
0.5549191, 1.362147, 1.403431, 1, 0, 0, 1, 1,
0.5555249, 1.432756, -1.286414, 1, 0, 0, 1, 1,
0.5558882, 0.2271858, 1.173224, 1, 0, 0, 1, 1,
0.5563722, -1.412475, 2.429473, 1, 0, 0, 1, 1,
0.5592911, 0.1975121, -0.2187835, 0, 0, 0, 1, 1,
0.5593401, 0.2727467, 1.200017, 0, 0, 0, 1, 1,
0.5608132, -1.37242, 3.481762, 0, 0, 0, 1, 1,
0.5614561, -1.757329, 2.760029, 0, 0, 0, 1, 1,
0.5628025, -1.878499, 2.521047, 0, 0, 0, 1, 1,
0.5638251, 0.7536041, 0.223957, 0, 0, 0, 1, 1,
0.5653505, -0.8900855, 2.566518, 0, 0, 0, 1, 1,
0.5686681, -0.1708575, -0.2188894, 1, 1, 1, 1, 1,
0.5756568, -1.7019, 3.320821, 1, 1, 1, 1, 1,
0.5762501, 0.1514991, 0.4038387, 1, 1, 1, 1, 1,
0.5816604, -0.6482418, 3.289601, 1, 1, 1, 1, 1,
0.5822485, 0.7511793, 1.679492, 1, 1, 1, 1, 1,
0.5828095, 1.404008, 1.134145, 1, 1, 1, 1, 1,
0.5894768, -1.564966, 2.669415, 1, 1, 1, 1, 1,
0.5899687, -0.3677559, 1.343127, 1, 1, 1, 1, 1,
0.5903708, 1.295069, -0.5883642, 1, 1, 1, 1, 1,
0.5929669, 0.9350413, 2.52689, 1, 1, 1, 1, 1,
0.5957522, 0.03427564, 0.2699831, 1, 1, 1, 1, 1,
0.5976804, -1.329999, 2.267464, 1, 1, 1, 1, 1,
0.6014319, -0.8657404, 1.274025, 1, 1, 1, 1, 1,
0.6040415, 0.2635004, 0.3304335, 1, 1, 1, 1, 1,
0.608609, -1.361541, 2.315322, 1, 1, 1, 1, 1,
0.6100798, 0.2916032, 0.4400046, 0, 0, 1, 1, 1,
0.6145685, -0.2757059, 2.59193, 1, 0, 0, 1, 1,
0.6174794, 0.7227436, 0.7425681, 1, 0, 0, 1, 1,
0.6181371, 0.5538504, 1.600082, 1, 0, 0, 1, 1,
0.6206841, 0.006116194, 1.63513, 1, 0, 0, 1, 1,
0.6267014, -0.3190571, 2.50355, 1, 0, 0, 1, 1,
0.6285384, -1.04245, 3.165013, 0, 0, 0, 1, 1,
0.6313869, -3.442825, 1.84844, 0, 0, 0, 1, 1,
0.6315398, 0.4149807, -2.121115, 0, 0, 0, 1, 1,
0.637889, -0.3952732, 2.629746, 0, 0, 0, 1, 1,
0.6386692, 0.6185689, -0.2366183, 0, 0, 0, 1, 1,
0.6405625, -1.376603, 5.549561, 0, 0, 0, 1, 1,
0.6431714, -0.6542054, 1.246884, 0, 0, 0, 1, 1,
0.6459558, 0.7861509, 0.0001556239, 1, 1, 1, 1, 1,
0.6501935, 0.3439406, 0.06620712, 1, 1, 1, 1, 1,
0.6574742, 1.196171, 1.55864, 1, 1, 1, 1, 1,
0.6673629, -1.059665, 2.522903, 1, 1, 1, 1, 1,
0.671248, 0.2902009, 1.654943, 1, 1, 1, 1, 1,
0.6747259, -0.1172866, 2.073278, 1, 1, 1, 1, 1,
0.6781609, 0.01694492, 0.8806621, 1, 1, 1, 1, 1,
0.6805713, -1.435947, 3.593347, 1, 1, 1, 1, 1,
0.6806594, 0.5288818, 2.227246, 1, 1, 1, 1, 1,
0.6905035, 0.2818572, -0.5959333, 1, 1, 1, 1, 1,
0.6906964, -0.5914193, 2.252503, 1, 1, 1, 1, 1,
0.692634, -0.4210675, 1.651577, 1, 1, 1, 1, 1,
0.6972798, -0.481371, 3.352168, 1, 1, 1, 1, 1,
0.6978308, 0.3681569, 1.293327, 1, 1, 1, 1, 1,
0.7066904, -0.1500258, 2.234462, 1, 1, 1, 1, 1,
0.7102342, -0.6165115, 2.879596, 0, 0, 1, 1, 1,
0.7123106, -1.547582, 2.261118, 1, 0, 0, 1, 1,
0.7145761, 0.3522894, 4.254208, 1, 0, 0, 1, 1,
0.7151799, -0.02062478, 1.44841, 1, 0, 0, 1, 1,
0.7162795, 0.7839999, 0.7554728, 1, 0, 0, 1, 1,
0.7245518, 0.2300534, 0.3024482, 1, 0, 0, 1, 1,
0.7275246, 0.965542, 1.36025, 0, 0, 0, 1, 1,
0.7291871, -1.113688, 2.034033, 0, 0, 0, 1, 1,
0.734633, 0.1264921, 1.863288, 0, 0, 0, 1, 1,
0.7351735, -1.842354, 3.144875, 0, 0, 0, 1, 1,
0.7353553, 0.8629309, 2.033623, 0, 0, 0, 1, 1,
0.7358035, -0.04116616, 1.263012, 0, 0, 0, 1, 1,
0.7393637, -0.8379706, 2.625427, 0, 0, 0, 1, 1,
0.7398141, -1.400032, 2.370352, 1, 1, 1, 1, 1,
0.7413034, 0.2723946, 1.603605, 1, 1, 1, 1, 1,
0.7461299, 0.3118979, 1.366741, 1, 1, 1, 1, 1,
0.7475325, 0.5870985, 2.042048, 1, 1, 1, 1, 1,
0.7496225, -0.6026207, 2.266834, 1, 1, 1, 1, 1,
0.750273, -1.345678, 2.462241, 1, 1, 1, 1, 1,
0.7561496, -0.9023792, 1.677675, 1, 1, 1, 1, 1,
0.7662055, 1.221947, 1.129598, 1, 1, 1, 1, 1,
0.7780331, 0.5475467, -0.5311294, 1, 1, 1, 1, 1,
0.7794691, -0.1264456, 3.00117, 1, 1, 1, 1, 1,
0.7803268, 0.2929857, 2.454053, 1, 1, 1, 1, 1,
0.7864494, -0.09563727, 0.8150388, 1, 1, 1, 1, 1,
0.7946682, 1.534356, 0.04075507, 1, 1, 1, 1, 1,
0.7978971, -0.2490082, 3.704073, 1, 1, 1, 1, 1,
0.8007643, -0.558983, 1.502938, 1, 1, 1, 1, 1,
0.8027381, -1.148769, 3.02033, 0, 0, 1, 1, 1,
0.8064958, 0.9257388, 0.3526294, 1, 0, 0, 1, 1,
0.8087788, 0.6976853, 0.1549655, 1, 0, 0, 1, 1,
0.8123297, -0.4980301, 3.622727, 1, 0, 0, 1, 1,
0.817772, -0.3777023, 1.33003, 1, 0, 0, 1, 1,
0.8184652, 0.3002749, 1.946934, 1, 0, 0, 1, 1,
0.8262167, -0.3770717, 2.647536, 0, 0, 0, 1, 1,
0.8278306, -0.6137246, 2.986185, 0, 0, 0, 1, 1,
0.8300754, -1.155271, 3.51062, 0, 0, 0, 1, 1,
0.8313196, 1.666166, 0.8321336, 0, 0, 0, 1, 1,
0.8314039, -0.3450094, 0.3776631, 0, 0, 0, 1, 1,
0.8325284, 0.1286485, 1.52438, 0, 0, 0, 1, 1,
0.8361508, 0.6759019, 1.480086, 0, 0, 0, 1, 1,
0.8388638, 0.9626393, 1.732537, 1, 1, 1, 1, 1,
0.839909, 2.406621, -0.3275665, 1, 1, 1, 1, 1,
0.8400918, 0.1507188, 1.937277, 1, 1, 1, 1, 1,
0.8496398, 0.6448392, 3.430251, 1, 1, 1, 1, 1,
0.8576425, -0.6400269, 1.794717, 1, 1, 1, 1, 1,
0.8596413, -1.622608, 3.080501, 1, 1, 1, 1, 1,
0.8600546, 0.6600761, 0.8546648, 1, 1, 1, 1, 1,
0.8610269, 0.9794984, -0.2976614, 1, 1, 1, 1, 1,
0.8614599, -0.728618, 2.910471, 1, 1, 1, 1, 1,
0.8624964, -0.3520773, 0.9184469, 1, 1, 1, 1, 1,
0.8659699, -1.470385, 4.354325, 1, 1, 1, 1, 1,
0.8675954, 1.810477, 1.450747, 1, 1, 1, 1, 1,
0.8743653, 0.8497139, 0.6015629, 1, 1, 1, 1, 1,
0.8765148, -0.7985606, 2.495291, 1, 1, 1, 1, 1,
0.8806945, -0.09644932, 1.345204, 1, 1, 1, 1, 1,
0.8917893, -0.9296069, 1.835426, 0, 0, 1, 1, 1,
0.892653, 0.6208975, 1.035219, 1, 0, 0, 1, 1,
0.9000829, 1.498102, 1.31939, 1, 0, 0, 1, 1,
0.905174, 0.3989055, 1.383486, 1, 0, 0, 1, 1,
0.9052989, 0.2650163, 2.034067, 1, 0, 0, 1, 1,
0.905303, 1.019524, 0.6807918, 1, 0, 0, 1, 1,
0.9072025, -0.2213533, 2.905834, 0, 0, 0, 1, 1,
0.9091055, 0.5956417, 0.7129208, 0, 0, 0, 1, 1,
0.9164982, 1.414457, 1.166367, 0, 0, 0, 1, 1,
0.9169282, -0.176264, 1.37885, 0, 0, 0, 1, 1,
0.9178032, 1.479529, 0.3068227, 0, 0, 0, 1, 1,
0.9271752, -0.4596458, 1.043653, 0, 0, 0, 1, 1,
0.9273357, -0.3010996, 1.88838, 0, 0, 0, 1, 1,
0.9316332, -0.4812753, 1.841126, 1, 1, 1, 1, 1,
0.9363659, -0.2143463, 1.077808, 1, 1, 1, 1, 1,
0.9367147, 0.7597477, 1.079891, 1, 1, 1, 1, 1,
0.9409416, 1.211122, 1.519875, 1, 1, 1, 1, 1,
0.9425923, -0.03754475, 0.8696848, 1, 1, 1, 1, 1,
0.9498143, 0.8873218, 1.951739, 1, 1, 1, 1, 1,
0.9518598, -0.5671458, 1.357091, 1, 1, 1, 1, 1,
0.9543727, 1.176598, 1.30882, 1, 1, 1, 1, 1,
0.9553645, 0.5454197, 0.4022868, 1, 1, 1, 1, 1,
0.9580281, 1.147488, 2.184592, 1, 1, 1, 1, 1,
0.9606317, -0.6482579, 2.535825, 1, 1, 1, 1, 1,
0.9619354, -0.03086296, 1.452436, 1, 1, 1, 1, 1,
0.9622971, 1.653302, -0.6724728, 1, 1, 1, 1, 1,
0.9639307, -0.9179157, 2.249965, 1, 1, 1, 1, 1,
0.9651912, -0.8123834, 3.597248, 1, 1, 1, 1, 1,
0.973081, -0.4048875, 0.9647384, 0, 0, 1, 1, 1,
0.9857053, 0.4888139, 0.6243988, 1, 0, 0, 1, 1,
0.9863282, -0.4420219, 1.71689, 1, 0, 0, 1, 1,
0.9876735, -1.815464, 1.203255, 1, 0, 0, 1, 1,
0.9883966, -0.01041444, 0.8593983, 1, 0, 0, 1, 1,
0.9932569, 0.06066463, 1.594339, 1, 0, 0, 1, 1,
0.9984324, 1.415551, 0.1399176, 0, 0, 0, 1, 1,
1.001556, -0.1821339, 2.084833, 0, 0, 0, 1, 1,
1.003446, -2.034662, 2.622281, 0, 0, 0, 1, 1,
1.008035, 0.08297534, 1.933147, 0, 0, 0, 1, 1,
1.013324, -0.9128345, 1.889931, 0, 0, 0, 1, 1,
1.016049, 0.06352416, 2.815728, 0, 0, 0, 1, 1,
1.020632, -0.4186707, 1.919555, 0, 0, 0, 1, 1,
1.039492, -0.8718384, 2.306047, 1, 1, 1, 1, 1,
1.04601, 1.248658, 1.655753, 1, 1, 1, 1, 1,
1.056502, 0.4661124, 1.49865, 1, 1, 1, 1, 1,
1.060493, 0.8888752, 0.1678091, 1, 1, 1, 1, 1,
1.060616, -0.8223239, 3.88866, 1, 1, 1, 1, 1,
1.065328, 0.6558319, 1.71527, 1, 1, 1, 1, 1,
1.069919, 0.2792869, 3.57165, 1, 1, 1, 1, 1,
1.078118, 1.498156, 1.454208, 1, 1, 1, 1, 1,
1.09479, -1.701382, 4.416141, 1, 1, 1, 1, 1,
1.101619, 1.666675, 0.3332177, 1, 1, 1, 1, 1,
1.102859, -0.3051252, 0.2930089, 1, 1, 1, 1, 1,
1.113245, 1.266845, 0.1720377, 1, 1, 1, 1, 1,
1.119885, -1.451158, 2.921041, 1, 1, 1, 1, 1,
1.120447, 0.5397172, 2.424527, 1, 1, 1, 1, 1,
1.143901, 0.807145, 0.8469827, 1, 1, 1, 1, 1,
1.154218, 0.3350606, 1.152163, 0, 0, 1, 1, 1,
1.160104, -1.960726, 0.5823295, 1, 0, 0, 1, 1,
1.162161, -0.09771448, 2.437063, 1, 0, 0, 1, 1,
1.165889, -0.1579393, 1.552289, 1, 0, 0, 1, 1,
1.165981, 0.9665578, 0.264268, 1, 0, 0, 1, 1,
1.169225, -0.695389, 3.100982, 1, 0, 0, 1, 1,
1.17254, -0.3034302, 0.9473873, 0, 0, 0, 1, 1,
1.173221, 0.5056699, 0.671067, 0, 0, 0, 1, 1,
1.17705, -0.4764744, 0.09548063, 0, 0, 0, 1, 1,
1.19049, 0.2353235, 0.9734528, 0, 0, 0, 1, 1,
1.190531, 1.627882, -0.03420588, 0, 0, 0, 1, 1,
1.21006, -1.159149, 3.15468, 0, 0, 0, 1, 1,
1.212468, -0.2291841, 1.669615, 0, 0, 0, 1, 1,
1.214718, 1.00878, 0.8679958, 1, 1, 1, 1, 1,
1.224211, -0.05613576, 1.817845, 1, 1, 1, 1, 1,
1.230281, 0.1514706, 1.78265, 1, 1, 1, 1, 1,
1.255782, 0.1269417, 3.853612, 1, 1, 1, 1, 1,
1.260053, -0.5122076, 2.15656, 1, 1, 1, 1, 1,
1.273843, 0.4659891, 2.148833, 1, 1, 1, 1, 1,
1.274225, 0.3902856, 1.335019, 1, 1, 1, 1, 1,
1.27905, 1.048834, -0.03165302, 1, 1, 1, 1, 1,
1.280423, 0.3542093, 1.972336, 1, 1, 1, 1, 1,
1.283486, -3.107753, 2.175736, 1, 1, 1, 1, 1,
1.289961, 0.5733735, 1.974823, 1, 1, 1, 1, 1,
1.293484, -0.5874828, 2.618775, 1, 1, 1, 1, 1,
1.29476, 0.8791207, 1.360547, 1, 1, 1, 1, 1,
1.308133, 1.018957, 0.8962839, 1, 1, 1, 1, 1,
1.31504, 0.3159845, 1.773293, 1, 1, 1, 1, 1,
1.317455, -0.2058366, 1.944422, 0, 0, 1, 1, 1,
1.318397, 0.1853804, 1.226284, 1, 0, 0, 1, 1,
1.319353, -1.012442, 3.231654, 1, 0, 0, 1, 1,
1.324235, 1.306237, 2.885238, 1, 0, 0, 1, 1,
1.32636, 0.556829, 1.453506, 1, 0, 0, 1, 1,
1.331232, 0.4090301, -0.1029135, 1, 0, 0, 1, 1,
1.359009, 0.04057233, 1.215052, 0, 0, 0, 1, 1,
1.365324, -0.3399648, 0.7330502, 0, 0, 0, 1, 1,
1.38362, 1.168162, 1.619917, 0, 0, 0, 1, 1,
1.405859, -0.8455541, 2.209296, 0, 0, 0, 1, 1,
1.416627, -1.351529, 3.858377, 0, 0, 0, 1, 1,
1.422933, -1.799166, 2.105691, 0, 0, 0, 1, 1,
1.424624, 0.281524, 0.4986395, 0, 0, 0, 1, 1,
1.426385, -1.401325, 4.371912, 1, 1, 1, 1, 1,
1.429982, -0.04886175, 0.55031, 1, 1, 1, 1, 1,
1.434699, -0.3013132, 2.863096, 1, 1, 1, 1, 1,
1.468997, -0.3347846, 1.868323, 1, 1, 1, 1, 1,
1.484229, 0.6859685, 2.09963, 1, 1, 1, 1, 1,
1.494346, 0.9429182, 0.890977, 1, 1, 1, 1, 1,
1.503908, 0.3008079, 1.379629, 1, 1, 1, 1, 1,
1.505768, -0.4905981, 2.571168, 1, 1, 1, 1, 1,
1.526328, 0.2013015, -0.749872, 1, 1, 1, 1, 1,
1.544637, 0.4225334, -0.1085394, 1, 1, 1, 1, 1,
1.549706, -0.4732834, 2.060733, 1, 1, 1, 1, 1,
1.573139, 0.5605393, 1.70738, 1, 1, 1, 1, 1,
1.573994, -0.3002395, 1.753954, 1, 1, 1, 1, 1,
1.577716, -0.9845538, 1.410284, 1, 1, 1, 1, 1,
1.583616, -1.006819, 0.1668075, 1, 1, 1, 1, 1,
1.588759, 0.512441, 1.531172, 0, 0, 1, 1, 1,
1.597109, 0.5437171, 0.975772, 1, 0, 0, 1, 1,
1.604985, -1.953338, 3.669057, 1, 0, 0, 1, 1,
1.606857, 0.3522216, 2.767783, 1, 0, 0, 1, 1,
1.61345, 3.046483, 1.348154, 1, 0, 0, 1, 1,
1.622771, -0.1430607, 0.5830098, 1, 0, 0, 1, 1,
1.650634, 1.41864, 0.9509569, 0, 0, 0, 1, 1,
1.659274, -0.9747741, 2.532796, 0, 0, 0, 1, 1,
1.66385, 0.6521029, 0.6935813, 0, 0, 0, 1, 1,
1.676879, -2.170351, 1.882815, 0, 0, 0, 1, 1,
1.690142, 2.039072, -0.1117103, 0, 0, 0, 1, 1,
1.705651, 0.03438567, 1.283305, 0, 0, 0, 1, 1,
1.709983, 2.049807, 0.7975762, 0, 0, 0, 1, 1,
1.712656, 0.9542774, 1.729162, 1, 1, 1, 1, 1,
1.737796, 0.2646138, 0.626544, 1, 1, 1, 1, 1,
1.775923, -1.395187, 1.229036, 1, 1, 1, 1, 1,
1.780811, 0.8841076, 2.169864, 1, 1, 1, 1, 1,
1.81343, 1.780496, -0.4852196, 1, 1, 1, 1, 1,
1.814747, 0.2012364, 1.149082, 1, 1, 1, 1, 1,
1.839321, -2.526739, 3.093153, 1, 1, 1, 1, 1,
1.848009, 0.2324217, 2.006621, 1, 1, 1, 1, 1,
1.915074, 1.388442, 1.527512, 1, 1, 1, 1, 1,
1.921432, -1.352754, 2.035971, 1, 1, 1, 1, 1,
1.930186, -1.098286, -0.2452894, 1, 1, 1, 1, 1,
1.935345, -0.09621623, 1.07101, 1, 1, 1, 1, 1,
1.949441, 0.7415919, 0.8071483, 1, 1, 1, 1, 1,
1.96071, -0.3047709, 0.4902785, 1, 1, 1, 1, 1,
1.976412, -0.7886751, 1.334941, 1, 1, 1, 1, 1,
1.993612, -2.810948, 5.196082, 0, 0, 1, 1, 1,
1.99744, -3.534626, 3.675578, 1, 0, 0, 1, 1,
2.049256, -2.179295, 2.848514, 1, 0, 0, 1, 1,
2.054419, -1.333947, 0.9041908, 1, 0, 0, 1, 1,
2.068023, 0.6159508, -0.7972158, 1, 0, 0, 1, 1,
2.075585, 0.964055, 0.5617991, 1, 0, 0, 1, 1,
2.107996, -1.501373, 2.527881, 0, 0, 0, 1, 1,
2.207902, -0.2960153, 0.2626905, 0, 0, 0, 1, 1,
2.214225, 1.206948, -0.08446263, 0, 0, 0, 1, 1,
2.214817, 0.4783719, 0.416737, 0, 0, 0, 1, 1,
2.226807, -0.6077186, -0.07349295, 0, 0, 0, 1, 1,
2.317696, 0.5624638, 1.131127, 0, 0, 0, 1, 1,
2.394557, 0.05979709, 0.2945186, 0, 0, 0, 1, 1,
2.496725, -0.4302795, 1.23507, 1, 1, 1, 1, 1,
2.587114, 1.435868, 0.9682785, 1, 1, 1, 1, 1,
2.653154, 0.3540243, 2.537766, 1, 1, 1, 1, 1,
2.685096, -0.9006246, 2.533814, 1, 1, 1, 1, 1,
2.703281, -0.6301195, 2.890287, 1, 1, 1, 1, 1,
2.78761, 1.059598, 0.4032115, 1, 1, 1, 1, 1,
3.390952, 1.218882, 0.2227929, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.541711;
var distance = 33.51485;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.2433982, 0.2440717, -0.2541566 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.51485);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
