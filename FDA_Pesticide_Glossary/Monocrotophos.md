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
-3.322915, 1.411111, -0.2218705, 1, 0, 0, 1,
-2.96351, -0.404256, -1.67235, 1, 0.007843138, 0, 1,
-2.733186, -1.24493, -2.209645, 1, 0.01176471, 0, 1,
-2.621348, -0.3112369, -2.446844, 1, 0.01960784, 0, 1,
-2.485411, -1.204437, -2.352514, 1, 0.02352941, 0, 1,
-2.32109, -1.106821, -1.356022, 1, 0.03137255, 0, 1,
-2.309045, -1.572362, -1.285167, 1, 0.03529412, 0, 1,
-2.301756, 0.04503065, -0.976142, 1, 0.04313726, 0, 1,
-2.279633, 0.5273135, -0.05851708, 1, 0.04705882, 0, 1,
-2.10511, -3.165632, -1.456904, 1, 0.05490196, 0, 1,
-2.07979, 0.85301, 0.6456975, 1, 0.05882353, 0, 1,
-2.078928, -0.2964023, -0.697913, 1, 0.06666667, 0, 1,
-2.067635, -1.598838, -2.807004, 1, 0.07058824, 0, 1,
-2.067229, 1.112952, -2.272398, 1, 0.07843138, 0, 1,
-2.043136, 1.669284, -2.386267, 1, 0.08235294, 0, 1,
-2.024252, 0.8044228, -0.2462722, 1, 0.09019608, 0, 1,
-2.015063, -0.008935026, -2.079214, 1, 0.09411765, 0, 1,
-1.989601, 1.371038, -1.948692, 1, 0.1019608, 0, 1,
-1.967029, 0.007610314, -2.16195, 1, 0.1098039, 0, 1,
-1.930265, 0.04311492, -2.92423, 1, 0.1137255, 0, 1,
-1.898236, 0.5816262, -0.7531978, 1, 0.1215686, 0, 1,
-1.875459, -0.2438271, -1.520176, 1, 0.1254902, 0, 1,
-1.856015, 2.558465, -1.112342, 1, 0.1333333, 0, 1,
-1.844546, -1.616958, -2.447988, 1, 0.1372549, 0, 1,
-1.844539, 0.5693187, -1.562717, 1, 0.145098, 0, 1,
-1.843308, -1.363986, -2.848327, 1, 0.1490196, 0, 1,
-1.824241, 0.2321325, -2.184937, 1, 0.1568628, 0, 1,
-1.760459, 0.2289753, -0.7543781, 1, 0.1607843, 0, 1,
-1.752046, 0.303314, 0.4948595, 1, 0.1686275, 0, 1,
-1.739184, 0.04273366, -1.039833, 1, 0.172549, 0, 1,
-1.734378, -0.2669875, -1.240152, 1, 0.1803922, 0, 1,
-1.732193, -0.3523892, -1.05348, 1, 0.1843137, 0, 1,
-1.726745, 0.6134124, -1.078545, 1, 0.1921569, 0, 1,
-1.716685, 0.02761785, -1.508227, 1, 0.1960784, 0, 1,
-1.715684, 1.492845, -2.016584, 1, 0.2039216, 0, 1,
-1.704035, 0.1513017, -1.528586, 1, 0.2117647, 0, 1,
-1.700658, 0.8608558, -2.100241, 1, 0.2156863, 0, 1,
-1.692004, 1.505323, 0.5057917, 1, 0.2235294, 0, 1,
-1.671443, -1.391831, -3.911935, 1, 0.227451, 0, 1,
-1.669961, -0.8646615, -2.156823, 1, 0.2352941, 0, 1,
-1.665521, 0.06212662, -0.9596813, 1, 0.2392157, 0, 1,
-1.662524, -0.06277541, -2.200904, 1, 0.2470588, 0, 1,
-1.624087, -0.7194863, -3.29415, 1, 0.2509804, 0, 1,
-1.618756, -2.930466, -2.683719, 1, 0.2588235, 0, 1,
-1.616008, 1.36296, -1.7599, 1, 0.2627451, 0, 1,
-1.611867, -0.5112393, -1.889019, 1, 0.2705882, 0, 1,
-1.608946, 0.9805128, -0.9913149, 1, 0.2745098, 0, 1,
-1.60806, 1.62976, -0.8525437, 1, 0.282353, 0, 1,
-1.592203, -0.6859173, -1.664067, 1, 0.2862745, 0, 1,
-1.590085, 0.02965822, -2.022151, 1, 0.2941177, 0, 1,
-1.556137, 0.4935471, -0.4175189, 1, 0.3019608, 0, 1,
-1.550885, 1.239876, -0.9547949, 1, 0.3058824, 0, 1,
-1.533197, -0.8528197, -3.014382, 1, 0.3137255, 0, 1,
-1.523114, -1.030207, -1.49233, 1, 0.3176471, 0, 1,
-1.522576, 0.9390005, 0.02087143, 1, 0.3254902, 0, 1,
-1.513462, -0.1049755, -0.7829751, 1, 0.3294118, 0, 1,
-1.508533, 0.543323, -1.476048, 1, 0.3372549, 0, 1,
-1.497369, 1.55136, -1.325401, 1, 0.3411765, 0, 1,
-1.464416, 0.6149935, -0.7052967, 1, 0.3490196, 0, 1,
-1.445183, 0.07315083, -1.664594, 1, 0.3529412, 0, 1,
-1.44234, -0.3938518, -2.203409, 1, 0.3607843, 0, 1,
-1.43956, -1.113799, -4.037031, 1, 0.3647059, 0, 1,
-1.437479, 0.2581742, -0.2679914, 1, 0.372549, 0, 1,
-1.433533, 0.6501762, -1.853355, 1, 0.3764706, 0, 1,
-1.426872, 0.5535122, -1.172714, 1, 0.3843137, 0, 1,
-1.426099, -0.1807369, -0.07866526, 1, 0.3882353, 0, 1,
-1.426022, -1.063301, -3.114793, 1, 0.3960784, 0, 1,
-1.417915, 1.702361, -1.550364, 1, 0.4039216, 0, 1,
-1.407335, 0.438895, -1.453006, 1, 0.4078431, 0, 1,
-1.394024, -1.742581, -1.289031, 1, 0.4156863, 0, 1,
-1.392837, -0.4384971, -0.8602285, 1, 0.4196078, 0, 1,
-1.37432, -0.5756817, -3.12962, 1, 0.427451, 0, 1,
-1.36688, 1.126777, -0.6412252, 1, 0.4313726, 0, 1,
-1.364132, 1.489578, -2.185671, 1, 0.4392157, 0, 1,
-1.360035, -0.1753686, -1.074217, 1, 0.4431373, 0, 1,
-1.355841, 0.2045398, -1.686454, 1, 0.4509804, 0, 1,
-1.343302, 1.481402, -1.132886, 1, 0.454902, 0, 1,
-1.342595, 0.8322968, -0.2405853, 1, 0.4627451, 0, 1,
-1.341636, -0.8159626, -2.261542, 1, 0.4666667, 0, 1,
-1.332747, -0.5833038, -2.946694, 1, 0.4745098, 0, 1,
-1.317516, 0.1319275, -1.19226, 1, 0.4784314, 0, 1,
-1.311711, -0.4911284, -3.875669, 1, 0.4862745, 0, 1,
-1.307335, -1.008131, -3.207175, 1, 0.4901961, 0, 1,
-1.304667, 0.4684383, -0.9276526, 1, 0.4980392, 0, 1,
-1.298278, 1.390473, -0.2680368, 1, 0.5058824, 0, 1,
-1.2962, -0.165306, -0.7664388, 1, 0.509804, 0, 1,
-1.289238, -0.08464275, -0.5289694, 1, 0.5176471, 0, 1,
-1.282319, 0.3955509, 0.5514313, 1, 0.5215687, 0, 1,
-1.282116, 0.9972554, -1.564252, 1, 0.5294118, 0, 1,
-1.279932, 0.6117865, -0.9026805, 1, 0.5333334, 0, 1,
-1.266224, -1.710264, -2.228493, 1, 0.5411765, 0, 1,
-1.262448, -0.2197569, 0.5423408, 1, 0.5450981, 0, 1,
-1.256815, -1.090323, -0.8084955, 1, 0.5529412, 0, 1,
-1.254697, -1.081254, -2.771422, 1, 0.5568628, 0, 1,
-1.247182, 0.6924678, -2.253467, 1, 0.5647059, 0, 1,
-1.244692, 0.7314119, -1.919532, 1, 0.5686275, 0, 1,
-1.24285, -0.7352676, -3.023921, 1, 0.5764706, 0, 1,
-1.239323, -0.1354851, 0.3271716, 1, 0.5803922, 0, 1,
-1.232537, -1.392331, -0.6856554, 1, 0.5882353, 0, 1,
-1.231265, 1.853985, -0.8356682, 1, 0.5921569, 0, 1,
-1.218895, 2.322367, -1.44758, 1, 0.6, 0, 1,
-1.214824, -0.2257558, -1.442241, 1, 0.6078432, 0, 1,
-1.213652, -0.2078658, -2.206555, 1, 0.6117647, 0, 1,
-1.212928, 0.3694561, -1.228979, 1, 0.6196079, 0, 1,
-1.204299, -0.657112, -0.7009949, 1, 0.6235294, 0, 1,
-1.20041, 0.7197002, -0.5694515, 1, 0.6313726, 0, 1,
-1.199671, 1.565751, 0.7161961, 1, 0.6352941, 0, 1,
-1.195794, 1.791354, -1.813437, 1, 0.6431373, 0, 1,
-1.192779, 0.2813808, -1.756063, 1, 0.6470588, 0, 1,
-1.191705, 0.1058668, -0.2571559, 1, 0.654902, 0, 1,
-1.190126, -1.346689, -0.1012655, 1, 0.6588235, 0, 1,
-1.187358, -0.846761, -4.907259, 1, 0.6666667, 0, 1,
-1.185862, 0.9836561, 0.2771745, 1, 0.6705883, 0, 1,
-1.180472, -0.03027437, -2.172576, 1, 0.6784314, 0, 1,
-1.167185, -1.300839, -1.518981, 1, 0.682353, 0, 1,
-1.165956, 0.9674845, -1.314102, 1, 0.6901961, 0, 1,
-1.165272, 0.3353198, -0.9227027, 1, 0.6941177, 0, 1,
-1.156865, -0.6857107, -2.977, 1, 0.7019608, 0, 1,
-1.156758, 0.5839936, -0.3695592, 1, 0.7098039, 0, 1,
-1.15076, 1.167121, -0.676182, 1, 0.7137255, 0, 1,
-1.149048, 2.047129, -1.846679, 1, 0.7215686, 0, 1,
-1.146056, 0.3834936, -0.3710839, 1, 0.7254902, 0, 1,
-1.144747, -1.276204, -0.8335829, 1, 0.7333333, 0, 1,
-1.143763, 0.7107303, -3.075629, 1, 0.7372549, 0, 1,
-1.138311, -0.9506177, -1.883014, 1, 0.7450981, 0, 1,
-1.136771, 0.6351482, -2.57538, 1, 0.7490196, 0, 1,
-1.132544, 1.285341, 0.6027269, 1, 0.7568628, 0, 1,
-1.132182, -0.5489427, -0.7999697, 1, 0.7607843, 0, 1,
-1.131386, -1.265726, -2.238829, 1, 0.7686275, 0, 1,
-1.128126, 2.067469, -0.8049254, 1, 0.772549, 0, 1,
-1.120824, 0.573382, -0.7199464, 1, 0.7803922, 0, 1,
-1.120654, -0.5607803, -1.776241, 1, 0.7843137, 0, 1,
-1.120315, 1.697463, -1.235834, 1, 0.7921569, 0, 1,
-1.108741, 1.6516, 0.5149391, 1, 0.7960784, 0, 1,
-1.105879, 1.170613, 0.3537212, 1, 0.8039216, 0, 1,
-1.104209, 0.3944876, 0.007576344, 1, 0.8117647, 0, 1,
-1.104077, -0.8869226, -2.259806, 1, 0.8156863, 0, 1,
-1.09872, -0.2472462, -1.366316, 1, 0.8235294, 0, 1,
-1.095865, 2.081339, 0.786837, 1, 0.827451, 0, 1,
-1.094568, -0.6414292, -0.6126526, 1, 0.8352941, 0, 1,
-1.093899, 0.285313, 0.0588194, 1, 0.8392157, 0, 1,
-1.080705, 0.296466, -1.334952, 1, 0.8470588, 0, 1,
-1.079167, 0.5712935, -0.01698562, 1, 0.8509804, 0, 1,
-1.078345, 0.4054288, -1.533174, 1, 0.8588235, 0, 1,
-1.076236, 0.2359456, -1.42102, 1, 0.8627451, 0, 1,
-1.07477, 1.366219, -0.456835, 1, 0.8705882, 0, 1,
-1.074699, 0.2093607, -0.5860656, 1, 0.8745098, 0, 1,
-1.065683, -0.5509459, -2.288017, 1, 0.8823529, 0, 1,
-1.06484, 1.589178, -1.346039, 1, 0.8862745, 0, 1,
-1.064394, -0.7543619, -0.4356779, 1, 0.8941177, 0, 1,
-1.064377, -1.133734, -1.144502, 1, 0.8980392, 0, 1,
-1.05705, 0.6465899, 0.1802361, 1, 0.9058824, 0, 1,
-1.05573, 0.282758, -2.764125, 1, 0.9137255, 0, 1,
-1.053456, -2.056014, -1.529765, 1, 0.9176471, 0, 1,
-1.049901, 1.642813, 0.353915, 1, 0.9254902, 0, 1,
-1.01243, 0.8554173, -1.26148, 1, 0.9294118, 0, 1,
-1.012377, 1.3045, 0.5987435, 1, 0.9372549, 0, 1,
-1.011738, -0.4679031, -1.410207, 1, 0.9411765, 0, 1,
-1.006831, -0.2843725, -1.717849, 1, 0.9490196, 0, 1,
-0.9891854, -0.07513199, -1.176483, 1, 0.9529412, 0, 1,
-0.9851562, 0.9098693, -0.7069523, 1, 0.9607843, 0, 1,
-0.9792622, 1.913741, -0.5071322, 1, 0.9647059, 0, 1,
-0.9791116, -0.5175341, -2.896615, 1, 0.972549, 0, 1,
-0.9567521, 2.720268, -0.009062508, 1, 0.9764706, 0, 1,
-0.9531508, -0.2046154, -1.270212, 1, 0.9843137, 0, 1,
-0.952984, -0.5906339, -2.142367, 1, 0.9882353, 0, 1,
-0.9436672, 0.1598488, -2.575472, 1, 0.9960784, 0, 1,
-0.9432084, 0.2263201, -0.4098677, 0.9960784, 1, 0, 1,
-0.942423, 0.6960971, -2.069303, 0.9921569, 1, 0, 1,
-0.9386684, -0.9690726, -1.111114, 0.9843137, 1, 0, 1,
-0.9373951, 0.2733821, -2.468543, 0.9803922, 1, 0, 1,
-0.9363318, -1.803864, -1.450167, 0.972549, 1, 0, 1,
-0.9354324, 0.8187376, 0.6069074, 0.9686275, 1, 0, 1,
-0.915704, -0.8244112, -2.279519, 0.9607843, 1, 0, 1,
-0.9117525, 1.020279, 0.829759, 0.9568627, 1, 0, 1,
-0.9078526, -0.7432252, -2.002667, 0.9490196, 1, 0, 1,
-0.9073279, -0.4841958, -1.670193, 0.945098, 1, 0, 1,
-0.9062456, 1.061023, 0.4135164, 0.9372549, 1, 0, 1,
-0.9039822, -1.148598, -0.9428038, 0.9333333, 1, 0, 1,
-0.9004723, -1.309963, -2.532751, 0.9254902, 1, 0, 1,
-0.8987616, -0.8638681, -2.839058, 0.9215686, 1, 0, 1,
-0.8980523, -0.4452823, -1.925055, 0.9137255, 1, 0, 1,
-0.8964345, -1.373963, -4.593903, 0.9098039, 1, 0, 1,
-0.8940607, 0.2403826, -1.940002, 0.9019608, 1, 0, 1,
-0.8802804, -0.02286628, -1.301517, 0.8941177, 1, 0, 1,
-0.8783203, -0.9293846, -0.6189665, 0.8901961, 1, 0, 1,
-0.8743128, 0.8143293, -0.3924952, 0.8823529, 1, 0, 1,
-0.8686641, 0.5827044, -1.658758, 0.8784314, 1, 0, 1,
-0.8669666, -0.2074406, -2.829591, 0.8705882, 1, 0, 1,
-0.8655201, -0.4920986, -2.995949, 0.8666667, 1, 0, 1,
-0.8640742, -0.6453021, -2.018447, 0.8588235, 1, 0, 1,
-0.8635504, 1.072485, -1.674371, 0.854902, 1, 0, 1,
-0.8592333, -1.512872, -5.026066, 0.8470588, 1, 0, 1,
-0.8530477, -1.093284, -2.697326, 0.8431373, 1, 0, 1,
-0.8526574, 0.8325731, -0.9011723, 0.8352941, 1, 0, 1,
-0.8494855, 0.8983294, -1.596915, 0.8313726, 1, 0, 1,
-0.8406272, 1.079791, 0.6758931, 0.8235294, 1, 0, 1,
-0.8382154, 0.8149643, -1.38749, 0.8196079, 1, 0, 1,
-0.8362315, -0.3750774, -1.313988, 0.8117647, 1, 0, 1,
-0.8321706, -2.568851, -2.596433, 0.8078431, 1, 0, 1,
-0.8319904, 0.1937048, -0.1562149, 0.8, 1, 0, 1,
-0.8294564, 0.7110656, -1.253353, 0.7921569, 1, 0, 1,
-0.824281, 0.3099674, 0.2918821, 0.7882353, 1, 0, 1,
-0.8219334, -0.9650988, -1.462408, 0.7803922, 1, 0, 1,
-0.8167968, 0.9934554, -1.228642, 0.7764706, 1, 0, 1,
-0.8163362, -1.34343, -3.502326, 0.7686275, 1, 0, 1,
-0.8130937, -1.954428, -4.334823, 0.7647059, 1, 0, 1,
-0.7998207, -0.0299238, -1.758013, 0.7568628, 1, 0, 1,
-0.798333, -1.500826, -4.491421, 0.7529412, 1, 0, 1,
-0.7970052, -0.8550863, -3.281462, 0.7450981, 1, 0, 1,
-0.7885742, 0.04917445, -1.257112, 0.7411765, 1, 0, 1,
-0.7869172, 0.5160666, -1.757194, 0.7333333, 1, 0, 1,
-0.7864091, 1.609204, -2.134093, 0.7294118, 1, 0, 1,
-0.7850355, -0.9309463, -1.209805, 0.7215686, 1, 0, 1,
-0.782102, 0.9952789, 0.7182841, 0.7176471, 1, 0, 1,
-0.7675112, 0.3190407, 0.849887, 0.7098039, 1, 0, 1,
-0.7672999, 0.3863405, -1.79484, 0.7058824, 1, 0, 1,
-0.7616195, -1.206743, -2.882705, 0.6980392, 1, 0, 1,
-0.7544279, 0.9882143, 0.07317453, 0.6901961, 1, 0, 1,
-0.7528515, -0.822667, -2.363814, 0.6862745, 1, 0, 1,
-0.7403508, 0.1243355, -0.1890427, 0.6784314, 1, 0, 1,
-0.7387844, -0.3842155, -2.538985, 0.6745098, 1, 0, 1,
-0.7346358, -0.3852848, -2.055464, 0.6666667, 1, 0, 1,
-0.7330049, 1.163502, -0.4994622, 0.6627451, 1, 0, 1,
-0.7323474, 1.81156, -0.7219835, 0.654902, 1, 0, 1,
-0.7254859, 0.08515929, -1.906523, 0.6509804, 1, 0, 1,
-0.7251327, 0.7524422, -1.981664, 0.6431373, 1, 0, 1,
-0.7245155, -0.7006804, -2.822783, 0.6392157, 1, 0, 1,
-0.7212628, 0.3556079, -1.1514, 0.6313726, 1, 0, 1,
-0.7162729, -0.02265156, -2.306778, 0.627451, 1, 0, 1,
-0.7154261, -0.2155505, -1.440255, 0.6196079, 1, 0, 1,
-0.7138905, 0.6488065, -1.008404, 0.6156863, 1, 0, 1,
-0.7137527, 0.3389274, 0.9691473, 0.6078432, 1, 0, 1,
-0.7122579, 0.2178378, -0.9072008, 0.6039216, 1, 0, 1,
-0.7086553, -0.5100219, -1.268846, 0.5960785, 1, 0, 1,
-0.7077777, 0.8186478, -1.685403, 0.5882353, 1, 0, 1,
-0.706532, 1.617403, -0.6534167, 0.5843138, 1, 0, 1,
-0.7044783, -0.4918733, -2.593869, 0.5764706, 1, 0, 1,
-0.7023627, -0.6944692, -2.079883, 0.572549, 1, 0, 1,
-0.6917483, -0.270456, -2.11317, 0.5647059, 1, 0, 1,
-0.6892342, -0.3242468, -1.816045, 0.5607843, 1, 0, 1,
-0.6734914, -0.3562118, -2.256105, 0.5529412, 1, 0, 1,
-0.6722005, -1.540318, -1.214064, 0.5490196, 1, 0, 1,
-0.671092, 0.9497008, -1.887839, 0.5411765, 1, 0, 1,
-0.6622635, 0.648183, -2.1826, 0.5372549, 1, 0, 1,
-0.6581437, 0.08865538, -0.6004466, 0.5294118, 1, 0, 1,
-0.6544064, 0.09598372, -0.6625082, 0.5254902, 1, 0, 1,
-0.6469644, 0.006010677, -1.896203, 0.5176471, 1, 0, 1,
-0.6445169, 0.9016299, 0.8540579, 0.5137255, 1, 0, 1,
-0.643609, 0.8375897, -0.634419, 0.5058824, 1, 0, 1,
-0.643586, -1.608135, -2.430904, 0.5019608, 1, 0, 1,
-0.6342229, 0.5569662, -1.238635, 0.4941176, 1, 0, 1,
-0.6319415, 0.1962972, 0.09279406, 0.4862745, 1, 0, 1,
-0.6292713, -0.5101491, -3.513942, 0.4823529, 1, 0, 1,
-0.6221809, 0.6890879, -0.2121245, 0.4745098, 1, 0, 1,
-0.6143873, 2.103155, -0.3738899, 0.4705882, 1, 0, 1,
-0.6132148, 0.3926358, -3.063647, 0.4627451, 1, 0, 1,
-0.6120064, -0.845805, -1.386774, 0.4588235, 1, 0, 1,
-0.6112002, 1.986428, -1.314618, 0.4509804, 1, 0, 1,
-0.6088951, -0.009027038, -2.314649, 0.4470588, 1, 0, 1,
-0.6066168, -0.7275251, -1.061279, 0.4392157, 1, 0, 1,
-0.5998874, -2.090238, -5.002526, 0.4352941, 1, 0, 1,
-0.5989257, -0.2850383, -1.535799, 0.427451, 1, 0, 1,
-0.5950882, -1.619583, -1.607026, 0.4235294, 1, 0, 1,
-0.5930008, 0.8558058, -1.556672, 0.4156863, 1, 0, 1,
-0.5846303, -0.7270309, -2.875094, 0.4117647, 1, 0, 1,
-0.5844302, -0.7940987, -2.846819, 0.4039216, 1, 0, 1,
-0.5806534, -0.1376267, -2.106752, 0.3960784, 1, 0, 1,
-0.5800954, -1.252849, -2.793241, 0.3921569, 1, 0, 1,
-0.5753224, 1.733014, -1.190511, 0.3843137, 1, 0, 1,
-0.5697765, -1.534183, -2.769463, 0.3803922, 1, 0, 1,
-0.5691796, 0.7282045, 1.256544, 0.372549, 1, 0, 1,
-0.5648101, 1.726323, -1.137422, 0.3686275, 1, 0, 1,
-0.5627056, -0.792611, -1.512657, 0.3607843, 1, 0, 1,
-0.5512623, 0.9512105, 1.214368, 0.3568628, 1, 0, 1,
-0.5448636, -1.510348, -4.362351, 0.3490196, 1, 0, 1,
-0.5384851, -0.3722341, -2.686655, 0.345098, 1, 0, 1,
-0.5367798, 0.0827558, -1.65065, 0.3372549, 1, 0, 1,
-0.5362693, 0.492932, -2.906129, 0.3333333, 1, 0, 1,
-0.5314196, -1.032311, -4.202621, 0.3254902, 1, 0, 1,
-0.5284716, 1.28808, 0.5434691, 0.3215686, 1, 0, 1,
-0.5280319, -0.3784479, -1.080528, 0.3137255, 1, 0, 1,
-0.5264722, 0.2175276, 0.9490719, 0.3098039, 1, 0, 1,
-0.5255156, 0.7807149, 0.6445301, 0.3019608, 1, 0, 1,
-0.5238891, 0.2257838, 0.2011661, 0.2941177, 1, 0, 1,
-0.5219531, 0.02436854, -1.762778, 0.2901961, 1, 0, 1,
-0.5217201, 0.8610197, -0.7857349, 0.282353, 1, 0, 1,
-0.5194377, 0.8785793, -1.229769, 0.2784314, 1, 0, 1,
-0.5129926, 0.01370055, -1.402736, 0.2705882, 1, 0, 1,
-0.5105302, 0.4762236, -1.691438, 0.2666667, 1, 0, 1,
-0.5104617, 0.9515514, 0.3442875, 0.2588235, 1, 0, 1,
-0.5063382, -0.3205348, -1.663131, 0.254902, 1, 0, 1,
-0.5062027, -0.7750729, -2.854198, 0.2470588, 1, 0, 1,
-0.5030997, 1.747381, -1.359464, 0.2431373, 1, 0, 1,
-0.502759, 0.6427433, -0.1136001, 0.2352941, 1, 0, 1,
-0.5022873, -0.8016158, -2.504709, 0.2313726, 1, 0, 1,
-0.5006217, 0.09078151, -2.400475, 0.2235294, 1, 0, 1,
-0.5003924, -0.5936026, -1.638864, 0.2196078, 1, 0, 1,
-0.498279, 0.146375, -2.529974, 0.2117647, 1, 0, 1,
-0.4981531, 1.880026, -1.647162, 0.2078431, 1, 0, 1,
-0.4927762, 0.1928699, -0.7188242, 0.2, 1, 0, 1,
-0.4925384, -0.5135127, -1.969878, 0.1921569, 1, 0, 1,
-0.4879169, -0.4992983, -1.272858, 0.1882353, 1, 0, 1,
-0.4864685, -2.089807, -4.216646, 0.1803922, 1, 0, 1,
-0.4774511, -0.6437486, -2.994828, 0.1764706, 1, 0, 1,
-0.4761267, 1.314872, -0.8929598, 0.1686275, 1, 0, 1,
-0.4749404, -0.8459927, -3.946607, 0.1647059, 1, 0, 1,
-0.463071, 0.01602786, -1.352811, 0.1568628, 1, 0, 1,
-0.462905, -0.9062417, -2.461158, 0.1529412, 1, 0, 1,
-0.4607309, -0.6440221, -2.495098, 0.145098, 1, 0, 1,
-0.4595446, 0.04307222, -0.8306992, 0.1411765, 1, 0, 1,
-0.4595135, -0.4707997, -1.48393, 0.1333333, 1, 0, 1,
-0.4564741, -0.6425784, -2.223155, 0.1294118, 1, 0, 1,
-0.4546099, 0.80438, 1.378859, 0.1215686, 1, 0, 1,
-0.4494135, -0.3132365, -2.828974, 0.1176471, 1, 0, 1,
-0.4474648, 1.209861, -0.4290198, 0.1098039, 1, 0, 1,
-0.4439619, -0.255112, -2.448675, 0.1058824, 1, 0, 1,
-0.4415359, -0.5202083, -2.465918, 0.09803922, 1, 0, 1,
-0.440785, -0.3450031, -0.4704224, 0.09019608, 1, 0, 1,
-0.4378542, -0.1174673, -3.429931, 0.08627451, 1, 0, 1,
-0.4343638, -0.2083354, -3.002956, 0.07843138, 1, 0, 1,
-0.4335823, -1.954467, -2.689254, 0.07450981, 1, 0, 1,
-0.4265014, 1.005955, 0.3450496, 0.06666667, 1, 0, 1,
-0.4262545, -0.2950436, -0.4805935, 0.0627451, 1, 0, 1,
-0.4237207, -0.1936141, -3.167845, 0.05490196, 1, 0, 1,
-0.4187077, -2.762195, -1.802188, 0.05098039, 1, 0, 1,
-0.4180404, 0.3254433, -0.5286478, 0.04313726, 1, 0, 1,
-0.4162476, 0.5991601, -1.760105, 0.03921569, 1, 0, 1,
-0.4122243, 0.0196091, -2.736501, 0.03137255, 1, 0, 1,
-0.4056577, -0.3529878, -2.259678, 0.02745098, 1, 0, 1,
-0.4008914, 0.8153201, -0.4847823, 0.01960784, 1, 0, 1,
-0.3983056, -1.348457, -3.668352, 0.01568628, 1, 0, 1,
-0.3924231, -0.8891303, -3.496029, 0.007843138, 1, 0, 1,
-0.3880677, -0.4607386, -3.038049, 0.003921569, 1, 0, 1,
-0.3856439, -0.4615759, -2.606722, 0, 1, 0.003921569, 1,
-0.3813162, -1.721587, -3.167158, 0, 1, 0.01176471, 1,
-0.3782328, 0.7587042, -0.8840417, 0, 1, 0.01568628, 1,
-0.3673657, 0.5674635, 0.1087408, 0, 1, 0.02352941, 1,
-0.3643458, 0.03033458, -2.883494, 0, 1, 0.02745098, 1,
-0.3643081, -1.214006, -3.359645, 0, 1, 0.03529412, 1,
-0.3631264, -1.463768, -3.761679, 0, 1, 0.03921569, 1,
-0.3582168, -0.05885345, -1.039716, 0, 1, 0.04705882, 1,
-0.3576403, -1.084002, -0.657163, 0, 1, 0.05098039, 1,
-0.3532782, 0.7446308, -0.4977714, 0, 1, 0.05882353, 1,
-0.3472469, 0.02888859, -1.579324, 0, 1, 0.0627451, 1,
-0.3456586, 0.1233231, -1.139641, 0, 1, 0.07058824, 1,
-0.34416, -0.655149, -4.464131, 0, 1, 0.07450981, 1,
-0.344142, -0.9023465, -2.356819, 0, 1, 0.08235294, 1,
-0.3407466, 0.4141959, -1.815397, 0, 1, 0.08627451, 1,
-0.3372426, -0.4835049, -1.248774, 0, 1, 0.09411765, 1,
-0.3358803, -2.723092, -1.197605, 0, 1, 0.1019608, 1,
-0.3337467, 1.139525, 0.3565424, 0, 1, 0.1058824, 1,
-0.3322409, 1.299218, -0.9753537, 0, 1, 0.1137255, 1,
-0.3301167, -1.234935, -2.308367, 0, 1, 0.1176471, 1,
-0.329229, -1.275427, -2.900016, 0, 1, 0.1254902, 1,
-0.3288742, -0.8878829, -4.191911, 0, 1, 0.1294118, 1,
-0.3259177, -0.839677, -2.747626, 0, 1, 0.1372549, 1,
-0.3245364, 0.02362486, -2.557102, 0, 1, 0.1411765, 1,
-0.3244907, -0.3510124, -2.262549, 0, 1, 0.1490196, 1,
-0.3242523, -1.153752, -1.923607, 0, 1, 0.1529412, 1,
-0.3226707, 0.6815732, -0.161525, 0, 1, 0.1607843, 1,
-0.3210287, -0.9632649, -3.745219, 0, 1, 0.1647059, 1,
-0.3184127, -0.6843038, -3.896499, 0, 1, 0.172549, 1,
-0.3148701, 2.407748, 0.0178723, 0, 1, 0.1764706, 1,
-0.311264, 0.4566011, -0.5372792, 0, 1, 0.1843137, 1,
-0.3076557, -0.3140011, -3.266731, 0, 1, 0.1882353, 1,
-0.3058189, 0.429826, -0.2124491, 0, 1, 0.1960784, 1,
-0.3023325, -0.2447188, -1.337038, 0, 1, 0.2039216, 1,
-0.2998565, 0.1676348, -0.8156251, 0, 1, 0.2078431, 1,
-0.2988492, -0.5906872, -3.824889, 0, 1, 0.2156863, 1,
-0.2970445, 0.7447318, 0.2969073, 0, 1, 0.2196078, 1,
-0.2940095, -0.5660089, -1.218679, 0, 1, 0.227451, 1,
-0.2939742, -0.1192783, -3.03276, 0, 1, 0.2313726, 1,
-0.2856704, 0.1122317, -1.672157, 0, 1, 0.2392157, 1,
-0.2852534, 0.6647279, 2.387741, 0, 1, 0.2431373, 1,
-0.2848445, -0.7432994, -2.585515, 0, 1, 0.2509804, 1,
-0.2846912, 0.2648792, -1.47057, 0, 1, 0.254902, 1,
-0.2817764, -1.15535, -2.032455, 0, 1, 0.2627451, 1,
-0.2816661, 1.916983, -1.060482, 0, 1, 0.2666667, 1,
-0.2752226, -1.443408, -3.567544, 0, 1, 0.2745098, 1,
-0.2741211, 0.4062098, -1.291326, 0, 1, 0.2784314, 1,
-0.2729299, 1.248744, -0.8177946, 0, 1, 0.2862745, 1,
-0.2716126, -0.5912967, -1.962249, 0, 1, 0.2901961, 1,
-0.2707369, -0.419634, -1.106443, 0, 1, 0.2980392, 1,
-0.2698698, -0.3868722, -2.390273, 0, 1, 0.3058824, 1,
-0.2554353, 0.7757594, -1.613073, 0, 1, 0.3098039, 1,
-0.2543925, 0.3830616, 0.1079444, 0, 1, 0.3176471, 1,
-0.2491723, -0.06012803, -0.7232097, 0, 1, 0.3215686, 1,
-0.2491292, -0.4652295, -2.595254, 0, 1, 0.3294118, 1,
-0.2466438, -0.7943536, -1.649978, 0, 1, 0.3333333, 1,
-0.2413546, -1.19786, -3.504811, 0, 1, 0.3411765, 1,
-0.2387985, 0.1043604, -0.9329645, 0, 1, 0.345098, 1,
-0.2345267, -0.3940451, -3.009074, 0, 1, 0.3529412, 1,
-0.2340018, -0.8493845, -2.348839, 0, 1, 0.3568628, 1,
-0.2321071, -0.829245, -0.5670161, 0, 1, 0.3647059, 1,
-0.2304431, -0.3597283, -3.156235, 0, 1, 0.3686275, 1,
-0.2290501, 0.5472571, -1.739576, 0, 1, 0.3764706, 1,
-0.228176, -0.8420151, -1.649731, 0, 1, 0.3803922, 1,
-0.2272366, 0.1491931, -0.5281994, 0, 1, 0.3882353, 1,
-0.2246599, -1.497317, -2.909608, 0, 1, 0.3921569, 1,
-0.2235486, 0.2581445, -1.907464, 0, 1, 0.4, 1,
-0.2168618, -0.2994142, -4.047023, 0, 1, 0.4078431, 1,
-0.214592, -0.594037, -2.372417, 0, 1, 0.4117647, 1,
-0.2124208, -0.1650687, -3.784112, 0, 1, 0.4196078, 1,
-0.2122728, -0.04957948, -1.629779, 0, 1, 0.4235294, 1,
-0.2090459, -0.6456397, -1.512373, 0, 1, 0.4313726, 1,
-0.2077623, 0.2151774, -1.55428, 0, 1, 0.4352941, 1,
-0.2048147, -0.6521656, -1.848554, 0, 1, 0.4431373, 1,
-0.2030979, -0.2258436, -4.347147, 0, 1, 0.4470588, 1,
-0.2015323, 1.135168, -1.54319, 0, 1, 0.454902, 1,
-0.1997464, 0.4671646, -1.391421, 0, 1, 0.4588235, 1,
-0.1941433, 1.055939, -1.683856, 0, 1, 0.4666667, 1,
-0.193894, -0.08552664, -1.542983, 0, 1, 0.4705882, 1,
-0.1900234, -1.133985, -1.211557, 0, 1, 0.4784314, 1,
-0.1864534, 0.0980842, -1.799063, 0, 1, 0.4823529, 1,
-0.1862903, 0.2593805, -1.030338, 0, 1, 0.4901961, 1,
-0.1847439, 0.6369843, -1.676358, 0, 1, 0.4941176, 1,
-0.1778936, -0.9372966, -2.859477, 0, 1, 0.5019608, 1,
-0.177239, 1.032784, -0.5250725, 0, 1, 0.509804, 1,
-0.1771596, 1.785364, 0.5622934, 0, 1, 0.5137255, 1,
-0.1703659, -0.07051199, -2.192023, 0, 1, 0.5215687, 1,
-0.1685522, -0.2333382, -1.922318, 0, 1, 0.5254902, 1,
-0.1670623, 0.9088117, 0.5852823, 0, 1, 0.5333334, 1,
-0.1659427, 0.05821173, -1.756818, 0, 1, 0.5372549, 1,
-0.1541408, -0.9440373, -1.724597, 0, 1, 0.5450981, 1,
-0.1527473, -0.1925484, -2.431292, 0, 1, 0.5490196, 1,
-0.1494602, -1.959922, -4.495081, 0, 1, 0.5568628, 1,
-0.1493233, 0.8206782, 0.6495342, 0, 1, 0.5607843, 1,
-0.1456345, 0.5709517, 0.7717928, 0, 1, 0.5686275, 1,
-0.1308839, 1.055158, -0.1413487, 0, 1, 0.572549, 1,
-0.1296293, -0.08543308, -1.331006, 0, 1, 0.5803922, 1,
-0.1249643, 0.638926, -0.7065862, 0, 1, 0.5843138, 1,
-0.1241298, -1.136123, -2.351833, 0, 1, 0.5921569, 1,
-0.1237782, -1.152454, -4.279363, 0, 1, 0.5960785, 1,
-0.1226816, -0.8380926, -3.706731, 0, 1, 0.6039216, 1,
-0.1225639, -0.6396273, -3.321959, 0, 1, 0.6117647, 1,
-0.1179648, 0.5767444, 0.1528892, 0, 1, 0.6156863, 1,
-0.1154092, -0.1698955, -2.547338, 0, 1, 0.6235294, 1,
-0.1134049, -0.1815807, -1.126115, 0, 1, 0.627451, 1,
-0.1061354, 0.7521253, -0.4243877, 0, 1, 0.6352941, 1,
-0.0953442, -1.948899, -3.295011, 0, 1, 0.6392157, 1,
-0.09440617, 1.704957, 1.32388, 0, 1, 0.6470588, 1,
-0.09300256, -1.111215, -4.326958, 0, 1, 0.6509804, 1,
-0.08672226, 0.425046, 2.028428, 0, 1, 0.6588235, 1,
-0.08656634, 1.450005, -1.108661, 0, 1, 0.6627451, 1,
-0.08496176, -1.139302, -2.97627, 0, 1, 0.6705883, 1,
-0.08004784, 0.5063504, 0.002897204, 0, 1, 0.6745098, 1,
-0.06908167, 1.022719, -0.01853653, 0, 1, 0.682353, 1,
-0.06883238, 1.325821, 0.714254, 0, 1, 0.6862745, 1,
-0.06873257, -0.5841644, -2.529606, 0, 1, 0.6941177, 1,
-0.06791369, 1.419602, -0.3220402, 0, 1, 0.7019608, 1,
-0.06776845, -0.9487529, -2.761077, 0, 1, 0.7058824, 1,
-0.06650381, -1.145735, -3.97481, 0, 1, 0.7137255, 1,
-0.06437178, -0.167213, -1.931929, 0, 1, 0.7176471, 1,
-0.06210583, -0.73821, -1.259212, 0, 1, 0.7254902, 1,
-0.05924333, 0.4066087, -0.3238407, 0, 1, 0.7294118, 1,
-0.05674144, 1.467655, 1.960922, 0, 1, 0.7372549, 1,
-0.05008524, 2.231358, -0.3434635, 0, 1, 0.7411765, 1,
-0.04832895, 1.065413, -1.205551, 0, 1, 0.7490196, 1,
-0.04404578, -1.35449, -4.026635, 0, 1, 0.7529412, 1,
-0.04081221, -0.615436, -5.178514, 0, 1, 0.7607843, 1,
-0.03647391, 0.7089791, -0.2968432, 0, 1, 0.7647059, 1,
-0.03138012, 0.9834558, 0.9577504, 0, 1, 0.772549, 1,
-0.03093332, -0.8168197, -2.518401, 0, 1, 0.7764706, 1,
-0.0238834, -2.051273, -4.510358, 0, 1, 0.7843137, 1,
-0.02040999, -0.2082292, -3.505153, 0, 1, 0.7882353, 1,
-0.01699919, 1.013685, 0.6177533, 0, 1, 0.7960784, 1,
-0.01054318, 0.9962309, -1.317893, 0, 1, 0.8039216, 1,
-0.003200377, 0.4976185, -1.604203, 0, 1, 0.8078431, 1,
-0.002361164, -0.05782089, -1.481808, 0, 1, 0.8156863, 1,
0.00142175, 2.320426, -0.1513719, 0, 1, 0.8196079, 1,
0.004666382, 2.2719, 0.0467913, 0, 1, 0.827451, 1,
0.006382518, -1.350543, 4.097572, 0, 1, 0.8313726, 1,
0.006629714, 1.0432, 0.7667198, 0, 1, 0.8392157, 1,
0.007382749, 1.848705, -0.05904746, 0, 1, 0.8431373, 1,
0.008086217, -0.481453, 3.546572, 0, 1, 0.8509804, 1,
0.01014774, 1.110479, 1.103194, 0, 1, 0.854902, 1,
0.01078427, 1.006693, -0.8565991, 0, 1, 0.8627451, 1,
0.01485826, 0.2077253, 0.3833289, 0, 1, 0.8666667, 1,
0.01676381, -0.3762298, 2.540172, 0, 1, 0.8745098, 1,
0.02036351, 0.2725662, 2.187035, 0, 1, 0.8784314, 1,
0.02560076, 0.3357373, -0.1478028, 0, 1, 0.8862745, 1,
0.02621412, 0.8708283, 1.583274, 0, 1, 0.8901961, 1,
0.0264379, 0.2829803, -0.1093506, 0, 1, 0.8980392, 1,
0.03205183, -1.493949, 4.226618, 0, 1, 0.9058824, 1,
0.03772127, -1.129108, 3.579374, 0, 1, 0.9098039, 1,
0.04041409, -0.6728235, 3.828786, 0, 1, 0.9176471, 1,
0.04578125, 0.3212427, 0.1151743, 0, 1, 0.9215686, 1,
0.04667334, 0.1619775, 0.07152959, 0, 1, 0.9294118, 1,
0.05013959, 1.98418, -0.1444072, 0, 1, 0.9333333, 1,
0.05214528, 0.5698692, 1.063607, 0, 1, 0.9411765, 1,
0.05216337, 1.073025, 0.7517752, 0, 1, 0.945098, 1,
0.05244646, 1.299615, -0.2429192, 0, 1, 0.9529412, 1,
0.05413881, 0.0196649, 1.140963, 0, 1, 0.9568627, 1,
0.05435499, 0.7963097, 0.1638484, 0, 1, 0.9647059, 1,
0.05917305, -0.321649, 2.504919, 0, 1, 0.9686275, 1,
0.05940417, -0.571017, 2.151266, 0, 1, 0.9764706, 1,
0.06197636, 0.7952571, -0.5644115, 0, 1, 0.9803922, 1,
0.06241042, 0.3802599, -0.3815923, 0, 1, 0.9882353, 1,
0.06756689, 0.2781944, 0.3282771, 0, 1, 0.9921569, 1,
0.06790523, -0.3308705, 3.23308, 0, 1, 1, 1,
0.06911436, -1.013902, 2.423132, 0, 0.9921569, 1, 1,
0.07030956, 0.9839363, 0.5144149, 0, 0.9882353, 1, 1,
0.07591476, -0.4111115, 5.345433, 0, 0.9803922, 1, 1,
0.07812457, -0.6599975, 2.874985, 0, 0.9764706, 1, 1,
0.07947469, -0.5240463, 3.125285, 0, 0.9686275, 1, 1,
0.09013325, -2.024463, 3.578202, 0, 0.9647059, 1, 1,
0.09219738, 0.8709409, 2.282192, 0, 0.9568627, 1, 1,
0.09641516, -0.4148256, 3.526133, 0, 0.9529412, 1, 1,
0.0974213, 1.357114, -0.550606, 0, 0.945098, 1, 1,
0.1013206, -2.618303, 2.222204, 0, 0.9411765, 1, 1,
0.106844, -0.33326, 2.516115, 0, 0.9333333, 1, 1,
0.1076627, -1.160873, 2.724356, 0, 0.9294118, 1, 1,
0.1078917, 0.3301327, -1.113485, 0, 0.9215686, 1, 1,
0.1158022, 2.243666, 1.106162, 0, 0.9176471, 1, 1,
0.1162468, 1.034624, -0.8836479, 0, 0.9098039, 1, 1,
0.1199343, 1.37643, -0.7859343, 0, 0.9058824, 1, 1,
0.1265931, 0.07580145, 1.894246, 0, 0.8980392, 1, 1,
0.1278665, 1.405861, 0.7475973, 0, 0.8901961, 1, 1,
0.1297438, 0.5948203, 0.5259316, 0, 0.8862745, 1, 1,
0.1334322, 0.7709203, 0.4579432, 0, 0.8784314, 1, 1,
0.1336699, 0.9954292, 0.3613777, 0, 0.8745098, 1, 1,
0.138612, 0.2732698, 1.406161, 0, 0.8666667, 1, 1,
0.1424945, -1.14622, 2.14884, 0, 0.8627451, 1, 1,
0.1471388, 0.4265976, 1.723743, 0, 0.854902, 1, 1,
0.1476993, -2.205463, 2.458172, 0, 0.8509804, 1, 1,
0.1512178, 0.3458268, 0.9829047, 0, 0.8431373, 1, 1,
0.1539818, -1.067478, 3.20836, 0, 0.8392157, 1, 1,
0.1577278, -0.3334598, 2.756905, 0, 0.8313726, 1, 1,
0.159643, -0.2427841, 2.270545, 0, 0.827451, 1, 1,
0.1619489, -0.8388027, 1.003245, 0, 0.8196079, 1, 1,
0.1629874, 1.73965, -0.4191213, 0, 0.8156863, 1, 1,
0.1631554, -0.7280664, 3.562541, 0, 0.8078431, 1, 1,
0.1636725, 0.05561366, 1.366835, 0, 0.8039216, 1, 1,
0.168262, -0.8993791, 2.399061, 0, 0.7960784, 1, 1,
0.1683634, 0.7026784, -0.4592085, 0, 0.7882353, 1, 1,
0.1687788, 1.20274, 1.010788, 0, 0.7843137, 1, 1,
0.1758033, -1.192352, 2.588355, 0, 0.7764706, 1, 1,
0.1785271, 0.1814065, 2.107006, 0, 0.772549, 1, 1,
0.1788841, -1.872484, 3.298664, 0, 0.7647059, 1, 1,
0.181338, -0.2816476, 1.800807, 0, 0.7607843, 1, 1,
0.1848883, 0.2616617, -0.1368673, 0, 0.7529412, 1, 1,
0.1889378, 1.140661, 0.1220092, 0, 0.7490196, 1, 1,
0.1947224, 0.7934392, 0.7962314, 0, 0.7411765, 1, 1,
0.1996598, 2.804641, 0.7828518, 0, 0.7372549, 1, 1,
0.203012, -2.30515, 3.316712, 0, 0.7294118, 1, 1,
0.2037459, -0.4145733, 3.231104, 0, 0.7254902, 1, 1,
0.2044543, 1.152004, -0.6695962, 0, 0.7176471, 1, 1,
0.207511, -0.8780078, 2.461691, 0, 0.7137255, 1, 1,
0.2076088, 0.9628267, 0.4017513, 0, 0.7058824, 1, 1,
0.2077207, -1.643212, 2.580013, 0, 0.6980392, 1, 1,
0.2097285, 0.0403487, 0.6476724, 0, 0.6941177, 1, 1,
0.2119437, -0.152682, 0.754436, 0, 0.6862745, 1, 1,
0.2158834, -1.20457, 2.970552, 0, 0.682353, 1, 1,
0.2160842, 0.6031309, 0.08514988, 0, 0.6745098, 1, 1,
0.2193394, 0.430936, 0.7691762, 0, 0.6705883, 1, 1,
0.2201165, 1.312281, 2.025045, 0, 0.6627451, 1, 1,
0.2207888, 0.7437817, -0.537622, 0, 0.6588235, 1, 1,
0.2226879, -0.963735, 3.54959, 0, 0.6509804, 1, 1,
0.2268739, 0.4744108, 0.2073308, 0, 0.6470588, 1, 1,
0.2269818, -0.1274005, 1.242167, 0, 0.6392157, 1, 1,
0.2275937, 1.47107, 1.192107, 0, 0.6352941, 1, 1,
0.2284737, 0.3358581, 2.568047, 0, 0.627451, 1, 1,
0.228867, 0.879764, 1.519812, 0, 0.6235294, 1, 1,
0.2296265, 2.178701, 0.0464991, 0, 0.6156863, 1, 1,
0.2313132, 0.05963298, 0.2445968, 0, 0.6117647, 1, 1,
0.2314348, -0.814351, 2.420156, 0, 0.6039216, 1, 1,
0.2321423, 1.103248, 1.077626, 0, 0.5960785, 1, 1,
0.2325239, 0.3323845, 0.4060747, 0, 0.5921569, 1, 1,
0.2344044, 0.1783915, 0.06183241, 0, 0.5843138, 1, 1,
0.2346795, 1.11618, -2.243695, 0, 0.5803922, 1, 1,
0.2377875, -1.690174, 3.031903, 0, 0.572549, 1, 1,
0.2432945, -1.372815, 2.282681, 0, 0.5686275, 1, 1,
0.2435292, -0.3071399, 1.518572, 0, 0.5607843, 1, 1,
0.2503782, -2.456501, 2.655516, 0, 0.5568628, 1, 1,
0.2583977, -0.4602599, 4.108168, 0, 0.5490196, 1, 1,
0.259765, -1.276261, 2.388713, 0, 0.5450981, 1, 1,
0.2621281, -1.079452, 3.959205, 0, 0.5372549, 1, 1,
0.2667622, -1.097106, 3.765598, 0, 0.5333334, 1, 1,
0.2675896, 0.5139439, -0.03089194, 0, 0.5254902, 1, 1,
0.2703114, 0.110134, 0.04599415, 0, 0.5215687, 1, 1,
0.2714002, 1.489932, 1.315865, 0, 0.5137255, 1, 1,
0.2804506, -0.005766012, 1.048195, 0, 0.509804, 1, 1,
0.2837243, 2.362112, 0.3908089, 0, 0.5019608, 1, 1,
0.2840738, 1.157216, 0.5126336, 0, 0.4941176, 1, 1,
0.2843457, -0.1651574, 4.134676, 0, 0.4901961, 1, 1,
0.2860776, -1.277805, 1.349659, 0, 0.4823529, 1, 1,
0.2884252, 1.153941, 0.2179345, 0, 0.4784314, 1, 1,
0.2899715, -0.6226349, 3.677028, 0, 0.4705882, 1, 1,
0.2908765, -0.1247963, 0.7963883, 0, 0.4666667, 1, 1,
0.2961833, -0.008559903, 0.3190348, 0, 0.4588235, 1, 1,
0.2986762, -1.155879, 2.19102, 0, 0.454902, 1, 1,
0.3062657, 0.8685189, 0.6892098, 0, 0.4470588, 1, 1,
0.3081367, 1.164648, -0.6521657, 0, 0.4431373, 1, 1,
0.3091546, -0.08684383, 1.416478, 0, 0.4352941, 1, 1,
0.3098136, 0.05834183, 1.097024, 0, 0.4313726, 1, 1,
0.3108196, 0.08194058, 1.180082, 0, 0.4235294, 1, 1,
0.3123234, -0.3945439, 3.004338, 0, 0.4196078, 1, 1,
0.3124364, 1.233188, -1.639785, 0, 0.4117647, 1, 1,
0.3130979, 0.49253, -0.6794558, 0, 0.4078431, 1, 1,
0.316727, -0.4746684, -0.03632388, 0, 0.4, 1, 1,
0.3231127, -0.8213133, 1.455386, 0, 0.3921569, 1, 1,
0.324038, 0.2098402, 1.637351, 0, 0.3882353, 1, 1,
0.3242677, 0.7426651, 0.9533807, 0, 0.3803922, 1, 1,
0.3281163, 0.6559895, -0.1494862, 0, 0.3764706, 1, 1,
0.328266, 0.9260429, 2.130833, 0, 0.3686275, 1, 1,
0.3285818, 0.2189508, 1.667028, 0, 0.3647059, 1, 1,
0.3291584, 1.489683, 1.84826, 0, 0.3568628, 1, 1,
0.330451, 0.8230941, 1.079637, 0, 0.3529412, 1, 1,
0.3314201, 0.7277721, 0.1736215, 0, 0.345098, 1, 1,
0.3319841, -0.6082809, 1.860617, 0, 0.3411765, 1, 1,
0.3354134, 1.354295, -1.823807, 0, 0.3333333, 1, 1,
0.3367278, 0.2401116, 2.81171, 0, 0.3294118, 1, 1,
0.3380817, 0.1631752, 3.295084, 0, 0.3215686, 1, 1,
0.3382952, 0.7956892, -0.6782078, 0, 0.3176471, 1, 1,
0.3387478, 0.8739268, 1.827408, 0, 0.3098039, 1, 1,
0.3423262, 1.24322, -0.5493486, 0, 0.3058824, 1, 1,
0.345616, 1.070001, 0.7711707, 0, 0.2980392, 1, 1,
0.3503555, 2.208465, 2.342152, 0, 0.2901961, 1, 1,
0.3513335, 0.2442186, 0.8090535, 0, 0.2862745, 1, 1,
0.3519687, 0.2971821, 2.256785, 0, 0.2784314, 1, 1,
0.3552033, 0.2582567, -1.980026, 0, 0.2745098, 1, 1,
0.3612207, 0.3972049, 0.4479369, 0, 0.2666667, 1, 1,
0.3637743, 0.8672929, -0.4368383, 0, 0.2627451, 1, 1,
0.3676403, 1.82377, 1.898972, 0, 0.254902, 1, 1,
0.368164, -0.7838523, 4.389478, 0, 0.2509804, 1, 1,
0.3701421, -0.5225818, 2.831569, 0, 0.2431373, 1, 1,
0.3706624, 0.6242664, 2.378082, 0, 0.2392157, 1, 1,
0.3712733, -0.823616, 1.667663, 0, 0.2313726, 1, 1,
0.3730281, 0.2140318, 0.1717012, 0, 0.227451, 1, 1,
0.3770075, 0.1726595, 1.397106, 0, 0.2196078, 1, 1,
0.3788121, 0.08258697, 0.3262596, 0, 0.2156863, 1, 1,
0.3791333, 0.6771898, 1.174989, 0, 0.2078431, 1, 1,
0.3821698, -0.03956263, 0.6480983, 0, 0.2039216, 1, 1,
0.3851016, -0.138351, 2.216216, 0, 0.1960784, 1, 1,
0.3935282, -0.1033581, 2.197952, 0, 0.1882353, 1, 1,
0.3949175, 1.707545, -0.363674, 0, 0.1843137, 1, 1,
0.3968646, -0.398526, 2.205662, 0, 0.1764706, 1, 1,
0.4010091, 1.421213, -0.4856801, 0, 0.172549, 1, 1,
0.4056537, -0.6277606, 2.210297, 0, 0.1647059, 1, 1,
0.4056998, 1.040644, 0.4153835, 0, 0.1607843, 1, 1,
0.4110194, -1.282774, 1.541353, 0, 0.1529412, 1, 1,
0.411067, 0.364666, 0.6591637, 0, 0.1490196, 1, 1,
0.4127007, 1.844492, 0.2613247, 0, 0.1411765, 1, 1,
0.4156348, -0.8375425, 3.249872, 0, 0.1372549, 1, 1,
0.4167097, -0.859695, 1.976692, 0, 0.1294118, 1, 1,
0.4202269, -1.756494, 1.355835, 0, 0.1254902, 1, 1,
0.42117, 0.3642282, -0.2092564, 0, 0.1176471, 1, 1,
0.421332, -2.155744, 3.709495, 0, 0.1137255, 1, 1,
0.4219872, -1.979944, 2.364315, 0, 0.1058824, 1, 1,
0.4240567, 1.134623, -1.146736, 0, 0.09803922, 1, 1,
0.4263321, -1.271352, 1.725985, 0, 0.09411765, 1, 1,
0.42788, 1.602726, 0.8962358, 0, 0.08627451, 1, 1,
0.4279328, -1.129808, 2.772933, 0, 0.08235294, 1, 1,
0.4286025, -0.1807378, 1.033438, 0, 0.07450981, 1, 1,
0.4297722, -1.556964, 1.68264, 0, 0.07058824, 1, 1,
0.4355351, -0.8162464, 1.792333, 0, 0.0627451, 1, 1,
0.445965, -0.6717719, 1.179839, 0, 0.05882353, 1, 1,
0.4478235, -0.1774386, 2.73554, 0, 0.05098039, 1, 1,
0.4497065, -0.7300026, 3.47564, 0, 0.04705882, 1, 1,
0.4539273, 0.4448623, -0.1211343, 0, 0.03921569, 1, 1,
0.4572375, -1.963779, 1.938434, 0, 0.03529412, 1, 1,
0.4588877, 1.475839, -0.8171945, 0, 0.02745098, 1, 1,
0.4661389, -1.810086, 4.004185, 0, 0.02352941, 1, 1,
0.4694356, -0.392857, 2.008379, 0, 0.01568628, 1, 1,
0.4714276, -1.157978, 2.783879, 0, 0.01176471, 1, 1,
0.4783976, 0.2800779, 2.118366, 0, 0.003921569, 1, 1,
0.4787079, 0.6528816, -1.194194, 0.003921569, 0, 1, 1,
0.4897128, 0.3351995, 0.2453271, 0.007843138, 0, 1, 1,
0.4897422, -0.08094651, 3.594229, 0.01568628, 0, 1, 1,
0.4929582, -0.8525943, 1.963933, 0.01960784, 0, 1, 1,
0.4962869, -1.114961, 1.424407, 0.02745098, 0, 1, 1,
0.502534, -1.367499, 2.602861, 0.03137255, 0, 1, 1,
0.512704, -0.1348898, 2.378323, 0.03921569, 0, 1, 1,
0.5127193, -0.2796536, 1.637344, 0.04313726, 0, 1, 1,
0.5163111, 0.8134361, 0.2600601, 0.05098039, 0, 1, 1,
0.5205446, 1.204859, 1.344662, 0.05490196, 0, 1, 1,
0.5253547, 0.2658718, 1.405995, 0.0627451, 0, 1, 1,
0.5364228, 1.373504, 1.414455, 0.06666667, 0, 1, 1,
0.5364411, 0.6406518, 0.4202133, 0.07450981, 0, 1, 1,
0.5411469, 0.4716446, 0.9267737, 0.07843138, 0, 1, 1,
0.5426807, 0.4933313, 2.4683, 0.08627451, 0, 1, 1,
0.546928, -0.2166645, 1.16366, 0.09019608, 0, 1, 1,
0.5494297, -1.500925, 2.946958, 0.09803922, 0, 1, 1,
0.5511611, -0.8343533, 2.316757, 0.1058824, 0, 1, 1,
0.5575373, 0.706653, 2.159812, 0.1098039, 0, 1, 1,
0.5607002, 0.7218679, 1.55886, 0.1176471, 0, 1, 1,
0.5617571, -0.2016843, 1.153374, 0.1215686, 0, 1, 1,
0.5640396, -0.2892122, 0.454068, 0.1294118, 0, 1, 1,
0.5665454, 0.04451413, 1.692279, 0.1333333, 0, 1, 1,
0.5671438, 0.8511925, 1.097802, 0.1411765, 0, 1, 1,
0.573097, -1.696154, 2.83504, 0.145098, 0, 1, 1,
0.5737364, 0.3023989, 0.6243528, 0.1529412, 0, 1, 1,
0.5777858, -0.4034105, 3.936417, 0.1568628, 0, 1, 1,
0.5780184, -0.1288283, 2.18447, 0.1647059, 0, 1, 1,
0.5799308, 0.401297, 2.557928, 0.1686275, 0, 1, 1,
0.5843062, 0.06186252, 2.7691, 0.1764706, 0, 1, 1,
0.5848214, 1.270628, 1.334312, 0.1803922, 0, 1, 1,
0.5879116, -2.016985, 2.972718, 0.1882353, 0, 1, 1,
0.5883165, 0.6627244, 0.9482952, 0.1921569, 0, 1, 1,
0.5946159, -0.9615383, 4.514761, 0.2, 0, 1, 1,
0.5974756, 0.7633886, 1.097095, 0.2078431, 0, 1, 1,
0.6033707, 0.3056758, 0.8342804, 0.2117647, 0, 1, 1,
0.6042652, 1.692028, -1.088352, 0.2196078, 0, 1, 1,
0.6054434, 0.1345568, 2.337953, 0.2235294, 0, 1, 1,
0.6062933, 0.1734503, 2.018157, 0.2313726, 0, 1, 1,
0.6099259, -0.1879997, 2.078874, 0.2352941, 0, 1, 1,
0.6119143, -1.15909, 2.675337, 0.2431373, 0, 1, 1,
0.6121384, -0.9250935, 0.1839328, 0.2470588, 0, 1, 1,
0.6214826, 0.9314108, 0.2157744, 0.254902, 0, 1, 1,
0.6344107, -0.9168849, 1.094179, 0.2588235, 0, 1, 1,
0.6349033, 0.6782639, 0.515451, 0.2666667, 0, 1, 1,
0.6359652, 0.7238048, 0.3555909, 0.2705882, 0, 1, 1,
0.6384172, 0.9760138, 1.61522, 0.2784314, 0, 1, 1,
0.6466927, 1.198027, 1.630512, 0.282353, 0, 1, 1,
0.6545187, 1.149709, -0.6273161, 0.2901961, 0, 1, 1,
0.6617088, 0.005859392, 2.329323, 0.2941177, 0, 1, 1,
0.6627713, 0.572968, 1.834481, 0.3019608, 0, 1, 1,
0.6637485, -0.1976611, 3.976859, 0.3098039, 0, 1, 1,
0.6647472, -0.9264638, 2.613208, 0.3137255, 0, 1, 1,
0.6660633, 0.6957325, 1.107213, 0.3215686, 0, 1, 1,
0.6671734, -0.7839009, 2.895069, 0.3254902, 0, 1, 1,
0.6682743, 0.2244008, 1.797874, 0.3333333, 0, 1, 1,
0.6713169, 0.3875414, 2.785734, 0.3372549, 0, 1, 1,
0.6751856, -1.421136, 3.549248, 0.345098, 0, 1, 1,
0.6758562, 0.3037426, 1.360357, 0.3490196, 0, 1, 1,
0.6805722, -0.01488844, 2.518354, 0.3568628, 0, 1, 1,
0.6809376, 1.985716, 0.918815, 0.3607843, 0, 1, 1,
0.6817411, 0.297956, -0.5493305, 0.3686275, 0, 1, 1,
0.6822238, -1.459862, 3.298783, 0.372549, 0, 1, 1,
0.684135, -0.09441311, -0.6415547, 0.3803922, 0, 1, 1,
0.68573, 0.1601622, 2.400074, 0.3843137, 0, 1, 1,
0.6859481, 0.9530902, 1.388841, 0.3921569, 0, 1, 1,
0.6876306, 0.756708, 0.5905952, 0.3960784, 0, 1, 1,
0.6895628, -0.4234344, -0.5757301, 0.4039216, 0, 1, 1,
0.6925331, -0.2423191, 3.200751, 0.4117647, 0, 1, 1,
0.7017588, -0.1125625, 1.023062, 0.4156863, 0, 1, 1,
0.7038466, -0.233533, 0.8621365, 0.4235294, 0, 1, 1,
0.7041635, -0.2444324, 2.5036, 0.427451, 0, 1, 1,
0.7092406, -0.02175876, 1.959051, 0.4352941, 0, 1, 1,
0.7097716, 1.638241, 0.7525566, 0.4392157, 0, 1, 1,
0.7098744, 1.291893, 1.556875, 0.4470588, 0, 1, 1,
0.7160231, -0.1414893, 2.2777, 0.4509804, 0, 1, 1,
0.7172936, -0.1577425, 2.361433, 0.4588235, 0, 1, 1,
0.7223182, 1.648819, 0.7861899, 0.4627451, 0, 1, 1,
0.7234636, 0.7063488, 2.88781, 0.4705882, 0, 1, 1,
0.7276028, -0.4208315, 3.112199, 0.4745098, 0, 1, 1,
0.7322266, 1.825817, -0.09841266, 0.4823529, 0, 1, 1,
0.7329496, -0.249309, 1.453338, 0.4862745, 0, 1, 1,
0.7353761, -0.3490657, 0.4121053, 0.4941176, 0, 1, 1,
0.7413041, -0.9717266, 2.437615, 0.5019608, 0, 1, 1,
0.742905, -1.047775, 3.879486, 0.5058824, 0, 1, 1,
0.7429392, 0.285487, 1.484659, 0.5137255, 0, 1, 1,
0.7466788, -1.019142, 2.367582, 0.5176471, 0, 1, 1,
0.746845, -0.1857128, 3.211054, 0.5254902, 0, 1, 1,
0.7470579, -1.07851, -0.3591713, 0.5294118, 0, 1, 1,
0.7531152, -0.1175549, 1.817721, 0.5372549, 0, 1, 1,
0.7602583, 1.679419, 2.065304, 0.5411765, 0, 1, 1,
0.7633418, 1.277233, 0.4122746, 0.5490196, 0, 1, 1,
0.765741, -1.452515, 3.708067, 0.5529412, 0, 1, 1,
0.7674519, -0.2629614, 2.684158, 0.5607843, 0, 1, 1,
0.7691082, -0.7505205, 2.063222, 0.5647059, 0, 1, 1,
0.7728468, -0.3761802, 3.847478, 0.572549, 0, 1, 1,
0.7767892, -1.265336, 0.7247172, 0.5764706, 0, 1, 1,
0.7826712, 0.8245347, 2.010817, 0.5843138, 0, 1, 1,
0.7835751, 0.1203454, -1.039186, 0.5882353, 0, 1, 1,
0.7943051, -1.329189, 1.873006, 0.5960785, 0, 1, 1,
0.7998083, -1.161571, 2.744278, 0.6039216, 0, 1, 1,
0.8011268, -2.27924, 4.286707, 0.6078432, 0, 1, 1,
0.8063837, -0.7492804, 2.887606, 0.6156863, 0, 1, 1,
0.808661, 0.6753247, 2.362587, 0.6196079, 0, 1, 1,
0.810673, 0.8330737, -0.8760942, 0.627451, 0, 1, 1,
0.8154112, 0.4889465, -1.36475, 0.6313726, 0, 1, 1,
0.8169591, 0.8579004, 1.129912, 0.6392157, 0, 1, 1,
0.8299622, -0.321537, 2.385189, 0.6431373, 0, 1, 1,
0.8353952, 1.371812, 0.6178426, 0.6509804, 0, 1, 1,
0.8371786, -0.6051922, 2.090681, 0.654902, 0, 1, 1,
0.8401739, -0.4116718, 1.123112, 0.6627451, 0, 1, 1,
0.8445693, 0.2968783, 1.858772, 0.6666667, 0, 1, 1,
0.8445914, -2.220504, 3.001428, 0.6745098, 0, 1, 1,
0.8566845, 1.284866, 0.141341, 0.6784314, 0, 1, 1,
0.8681702, 1.11962, 2.1838, 0.6862745, 0, 1, 1,
0.8700866, -0.8475069, 2.056645, 0.6901961, 0, 1, 1,
0.8709977, -0.1752788, 0.6333193, 0.6980392, 0, 1, 1,
0.8745248, 0.7885213, 1.60408, 0.7058824, 0, 1, 1,
0.8755443, -0.5050117, 2.11855, 0.7098039, 0, 1, 1,
0.8761964, -0.1978227, 0.1898446, 0.7176471, 0, 1, 1,
0.8783014, -0.09854796, 4.460663, 0.7215686, 0, 1, 1,
0.8786553, -1.22094, 2.532086, 0.7294118, 0, 1, 1,
0.8839038, 1.240425, 1.800307, 0.7333333, 0, 1, 1,
0.884326, 0.6763168, 0.934355, 0.7411765, 0, 1, 1,
0.8863761, 0.3656901, 1.311673, 0.7450981, 0, 1, 1,
0.8867516, -1.750242, 1.566981, 0.7529412, 0, 1, 1,
0.8985093, 0.04683291, 1.092652, 0.7568628, 0, 1, 1,
0.8992473, 0.4486339, 0.4903229, 0.7647059, 0, 1, 1,
0.9070545, -0.427667, 3.312431, 0.7686275, 0, 1, 1,
0.9082333, -1.332641, 3.13702, 0.7764706, 0, 1, 1,
0.9097282, 1.527065, -0.2456374, 0.7803922, 0, 1, 1,
0.9122143, -0.8233547, 3.096943, 0.7882353, 0, 1, 1,
0.9193592, 0.6396264, 2.050615, 0.7921569, 0, 1, 1,
0.923342, -0.7563922, 0.02489365, 0.8, 0, 1, 1,
0.9245604, -2.766327, 1.967809, 0.8078431, 0, 1, 1,
0.9310497, 1.508472, 0.3213415, 0.8117647, 0, 1, 1,
0.9335468, 0.2884556, 0.2627629, 0.8196079, 0, 1, 1,
0.9369053, -0.5293443, 1.211336, 0.8235294, 0, 1, 1,
0.9447729, -0.8648009, 2.365823, 0.8313726, 0, 1, 1,
0.9453548, 1.267526, 2.783828, 0.8352941, 0, 1, 1,
0.9474127, -1.388892, 2.195395, 0.8431373, 0, 1, 1,
0.9476288, 0.5115206, 0.07872638, 0.8470588, 0, 1, 1,
0.9498718, 1.218872, -0.589168, 0.854902, 0, 1, 1,
0.9515787, -1.920438, 4.453369, 0.8588235, 0, 1, 1,
0.9519811, -0.6239268, 1.78369, 0.8666667, 0, 1, 1,
0.9548681, 0.7267731, 2.266535, 0.8705882, 0, 1, 1,
0.957029, -0.5061669, -0.03391276, 0.8784314, 0, 1, 1,
0.9708493, 0.8955574, 2.379371, 0.8823529, 0, 1, 1,
0.9713447, 1.309759, 0.06919773, 0.8901961, 0, 1, 1,
0.9734604, 1.001859, 0.3550554, 0.8941177, 0, 1, 1,
0.9790962, -0.3035567, 2.457191, 0.9019608, 0, 1, 1,
0.9792482, -0.2250169, 2.407387, 0.9098039, 0, 1, 1,
0.9807413, -0.5872588, 1.710858, 0.9137255, 0, 1, 1,
0.9830245, -2.270992, 1.283738, 0.9215686, 0, 1, 1,
0.9858796, 0.8406983, 1.651373, 0.9254902, 0, 1, 1,
0.9884319, -0.986852, 2.682016, 0.9333333, 0, 1, 1,
0.9987417, -1.702752, 4.187383, 0.9372549, 0, 1, 1,
1.001782, 0.3602911, 1.550657, 0.945098, 0, 1, 1,
1.002529, -0.934391, 2.637586, 0.9490196, 0, 1, 1,
1.00593, -0.5830709, 0.5024207, 0.9568627, 0, 1, 1,
1.010074, -0.838398, 3.782214, 0.9607843, 0, 1, 1,
1.010865, -0.7184951, 1.544669, 0.9686275, 0, 1, 1,
1.014649, -0.4207188, 2.667244, 0.972549, 0, 1, 1,
1.014725, -0.6396499, 2.609512, 0.9803922, 0, 1, 1,
1.020424, 1.326151, -0.5866157, 0.9843137, 0, 1, 1,
1.023122, -0.4672202, 1.428221, 0.9921569, 0, 1, 1,
1.026594, -0.8268063, 2.137398, 0.9960784, 0, 1, 1,
1.033093, -0.2810846, 3.109207, 1, 0, 0.9960784, 1,
1.035206, -1.590815, 1.465966, 1, 0, 0.9882353, 1,
1.037017, 1.00986, 3.047791, 1, 0, 0.9843137, 1,
1.0375, -0.6152657, 2.83643, 1, 0, 0.9764706, 1,
1.03955, 2.485355, 0.9212912, 1, 0, 0.972549, 1,
1.043877, -0.7218547, 1.24398, 1, 0, 0.9647059, 1,
1.044665, -0.3402395, 2.108517, 1, 0, 0.9607843, 1,
1.04561, -0.003672156, 1.575376, 1, 0, 0.9529412, 1,
1.046912, -0.6954077, 2.340789, 1, 0, 0.9490196, 1,
1.058192, 2.704673, 1.681759, 1, 0, 0.9411765, 1,
1.058707, -0.1023781, -1.101057, 1, 0, 0.9372549, 1,
1.065441, 0.1954139, 0.9325638, 1, 0, 0.9294118, 1,
1.066023, 0.3237739, -0.2448491, 1, 0, 0.9254902, 1,
1.066601, 0.6373161, 1.969639, 1, 0, 0.9176471, 1,
1.069376, -1.374755, 3.612512, 1, 0, 0.9137255, 1,
1.072498, -1.090389, 0.535322, 1, 0, 0.9058824, 1,
1.077347, -1.07403, 3.757016, 1, 0, 0.9019608, 1,
1.079185, -0.4546466, 2.405043, 1, 0, 0.8941177, 1,
1.085751, -0.8792655, 2.311106, 1, 0, 0.8862745, 1,
1.088813, -0.3402944, 1.584666, 1, 0, 0.8823529, 1,
1.103739, -0.6942217, 3.650486, 1, 0, 0.8745098, 1,
1.116858, 1.467701, 1.89734, 1, 0, 0.8705882, 1,
1.118557, 0.4398352, -0.4058152, 1, 0, 0.8627451, 1,
1.124661, 0.8439918, 0.97904, 1, 0, 0.8588235, 1,
1.137496, 0.05351634, 3.047982, 1, 0, 0.8509804, 1,
1.144527, 0.229928, 3.822185, 1, 0, 0.8470588, 1,
1.157795, -1.249157, 2.969483, 1, 0, 0.8392157, 1,
1.162089, 1.421599, 1.02881, 1, 0, 0.8352941, 1,
1.16797, 1.378076, -0.2007358, 1, 0, 0.827451, 1,
1.168858, -0.01474254, 1.092145, 1, 0, 0.8235294, 1,
1.172882, 1.01965, 0.8974037, 1, 0, 0.8156863, 1,
1.184207, 0.3678467, 2.1896, 1, 0, 0.8117647, 1,
1.187594, 1.020866, 0.3900053, 1, 0, 0.8039216, 1,
1.189071, 0.8698111, 0.2432303, 1, 0, 0.7960784, 1,
1.201669, -0.07050221, 2.116138, 1, 0, 0.7921569, 1,
1.202744, -1.167473, 2.747478, 1, 0, 0.7843137, 1,
1.206876, -0.6888171, 3.116168, 1, 0, 0.7803922, 1,
1.206986, 1.120329, 0.204032, 1, 0, 0.772549, 1,
1.214988, 0.3368242, 0.5449291, 1, 0, 0.7686275, 1,
1.215408, -0.03459556, 1.849254, 1, 0, 0.7607843, 1,
1.215777, -0.9270402, 1.775226, 1, 0, 0.7568628, 1,
1.217457, -0.1043603, 0.6118512, 1, 0, 0.7490196, 1,
1.221755, 1.422607, 2.389845, 1, 0, 0.7450981, 1,
1.227541, -0.3322953, 2.010268, 1, 0, 0.7372549, 1,
1.232371, -0.1569332, 1.862117, 1, 0, 0.7333333, 1,
1.241432, 0.685237, 1.220492, 1, 0, 0.7254902, 1,
1.242089, -0.6722181, 3.071479, 1, 0, 0.7215686, 1,
1.243407, 0.1851702, 2.10717, 1, 0, 0.7137255, 1,
1.245315, 0.02707651, 1.157672, 1, 0, 0.7098039, 1,
1.253625, 0.06553558, 0.4502863, 1, 0, 0.7019608, 1,
1.25977, 1.478394, 0.4886798, 1, 0, 0.6941177, 1,
1.266482, -0.1392989, 1.273869, 1, 0, 0.6901961, 1,
1.273413, 1.838665, -0.3905414, 1, 0, 0.682353, 1,
1.282993, 1.143186, 0.2856813, 1, 0, 0.6784314, 1,
1.286014, 0.5464522, -0.9669234, 1, 0, 0.6705883, 1,
1.286691, 0.06343779, 0.05112005, 1, 0, 0.6666667, 1,
1.293264, 0.6399662, 0.7578182, 1, 0, 0.6588235, 1,
1.29391, -0.4877073, 1.762354, 1, 0, 0.654902, 1,
1.294621, 1.091285, 2.130703, 1, 0, 0.6470588, 1,
1.299269, 1.006337, 2.51446, 1, 0, 0.6431373, 1,
1.302784, 0.8097078, 1.848632, 1, 0, 0.6352941, 1,
1.306147, 0.5904182, 2.209531, 1, 0, 0.6313726, 1,
1.311682, -0.8454928, 0.9094938, 1, 0, 0.6235294, 1,
1.318878, 0.008579887, 1.98383, 1, 0, 0.6196079, 1,
1.322732, 0.9354374, 1.782081, 1, 0, 0.6117647, 1,
1.338368, 0.03780889, 2.267009, 1, 0, 0.6078432, 1,
1.340738, -0.08680993, 4.440516, 1, 0, 0.6, 1,
1.348006, 0.1892376, 0.8889121, 1, 0, 0.5921569, 1,
1.348523, -1.063669, 1.846832, 1, 0, 0.5882353, 1,
1.350536, 0.1132805, 1.846758, 1, 0, 0.5803922, 1,
1.351262, -2.100993, 1.580924, 1, 0, 0.5764706, 1,
1.352618, 1.154698, 0.9932406, 1, 0, 0.5686275, 1,
1.353633, -1.060095, 1.21766, 1, 0, 0.5647059, 1,
1.355029, -0.3105738, 1.076659, 1, 0, 0.5568628, 1,
1.357819, -0.1972575, 2.825971, 1, 0, 0.5529412, 1,
1.363103, 0.05822866, 2.781567, 1, 0, 0.5450981, 1,
1.380072, -0.8621694, 1.061059, 1, 0, 0.5411765, 1,
1.381541, 0.5146646, 1.611866, 1, 0, 0.5333334, 1,
1.397708, -0.4473784, 1.524964, 1, 0, 0.5294118, 1,
1.400552, -0.4957799, 2.776103, 1, 0, 0.5215687, 1,
1.41171, -1.092965, 1.306409, 1, 0, 0.5176471, 1,
1.418144, 1.72923, 0.5756053, 1, 0, 0.509804, 1,
1.422436, -0.009467671, -0.6796743, 1, 0, 0.5058824, 1,
1.425045, -0.7631381, 3.543502, 1, 0, 0.4980392, 1,
1.427847, 0.6902199, 0.2979009, 1, 0, 0.4901961, 1,
1.438542, -0.5603592, 1.634152, 1, 0, 0.4862745, 1,
1.443015, 1.177581, 0.5257934, 1, 0, 0.4784314, 1,
1.44339, -1.243366, 2.724244, 1, 0, 0.4745098, 1,
1.446275, 1.531222, 0.6171574, 1, 0, 0.4666667, 1,
1.456338, -0.3652426, -0.6560209, 1, 0, 0.4627451, 1,
1.463062, -0.348473, 1.253871, 1, 0, 0.454902, 1,
1.466012, 0.5179207, 2.191816, 1, 0, 0.4509804, 1,
1.469553, -0.6882308, 4.028171, 1, 0, 0.4431373, 1,
1.481275, -1.784518, 1.559447, 1, 0, 0.4392157, 1,
1.487331, 1.855717, -0.4586037, 1, 0, 0.4313726, 1,
1.494332, 1.151736, 1.045866, 1, 0, 0.427451, 1,
1.503142, -1.066247, 0.8961439, 1, 0, 0.4196078, 1,
1.511303, -1.125459, 4.179258, 1, 0, 0.4156863, 1,
1.517837, -0.4098347, 1.057953, 1, 0, 0.4078431, 1,
1.522804, -0.535597, 1.879304, 1, 0, 0.4039216, 1,
1.529129, -0.5106553, 0.8216813, 1, 0, 0.3960784, 1,
1.534007, 1.01016, 2.26188, 1, 0, 0.3882353, 1,
1.534702, -0.8001169, 2.607732, 1, 0, 0.3843137, 1,
1.555968, 1.082408, 0.739673, 1, 0, 0.3764706, 1,
1.569694, -2.477433, 3.011961, 1, 0, 0.372549, 1,
1.573797, -1.420056, 1.156159, 1, 0, 0.3647059, 1,
1.594015, -0.4719705, 2.649141, 1, 0, 0.3607843, 1,
1.602247, -1.312051, 1.91907, 1, 0, 0.3529412, 1,
1.609722, -0.4632853, 2.640034, 1, 0, 0.3490196, 1,
1.616381, -0.576939, 0.3854329, 1, 0, 0.3411765, 1,
1.631744, 0.006953142, 2.097651, 1, 0, 0.3372549, 1,
1.642412, 0.7280878, 1.238007, 1, 0, 0.3294118, 1,
1.654473, 0.05831376, 1.681785, 1, 0, 0.3254902, 1,
1.664237, -1.455055, 2.869481, 1, 0, 0.3176471, 1,
1.679386, 0.3266847, 1.118696, 1, 0, 0.3137255, 1,
1.687069, -0.5783841, 3.492372, 1, 0, 0.3058824, 1,
1.688244, 0.7755461, 0.7673391, 1, 0, 0.2980392, 1,
1.713934, -0.2163637, 1.107177, 1, 0, 0.2941177, 1,
1.71709, -2.343762, 2.528797, 1, 0, 0.2862745, 1,
1.725843, -0.9729012, 2.568435, 1, 0, 0.282353, 1,
1.732224, -0.05564947, -0.2643303, 1, 0, 0.2745098, 1,
1.741846, 0.998908, 1.728702, 1, 0, 0.2705882, 1,
1.753706, -0.8085063, 0.4250599, 1, 0, 0.2627451, 1,
1.769557, -1.560793, 2.170843, 1, 0, 0.2588235, 1,
1.771062, 0.1750845, 1.699739, 1, 0, 0.2509804, 1,
1.778802, -1.228327, 1.067582, 1, 0, 0.2470588, 1,
1.78554, 0.9550361, -0.04390256, 1, 0, 0.2392157, 1,
1.804954, 1.138561, 1.949488, 1, 0, 0.2352941, 1,
1.813433, 0.8364367, -0.3240097, 1, 0, 0.227451, 1,
1.81683, -0.09008373, 0.4135183, 1, 0, 0.2235294, 1,
1.826715, -1.132334, 2.169381, 1, 0, 0.2156863, 1,
1.829602, 0.008354286, 1.022754, 1, 0, 0.2117647, 1,
1.835073, 0.4053403, 2.181121, 1, 0, 0.2039216, 1,
1.835092, 0.7843199, 1.684689, 1, 0, 0.1960784, 1,
1.84627, -1.631852, 3.088192, 1, 0, 0.1921569, 1,
1.85596, 0.9272406, 0.1878741, 1, 0, 0.1843137, 1,
1.885664, 1.651043, 0.5515342, 1, 0, 0.1803922, 1,
1.900719, -0.4510115, 1.436332, 1, 0, 0.172549, 1,
1.922783, 0.8188948, 1.921241, 1, 0, 0.1686275, 1,
1.930206, 0.02508265, 0.426703, 1, 0, 0.1607843, 1,
1.931796, 0.7961307, 1.574307, 1, 0, 0.1568628, 1,
1.964005, -2.443432, 4.835885, 1, 0, 0.1490196, 1,
1.978514, 0.7431626, 1.268778, 1, 0, 0.145098, 1,
1.996079, -1.411962, 0.1914888, 1, 0, 0.1372549, 1,
2.024631, -0.8648878, 1.851733, 1, 0, 0.1333333, 1,
2.025469, 1.735132, 0.7855652, 1, 0, 0.1254902, 1,
2.040757, -1.372499, 2.553809, 1, 0, 0.1215686, 1,
2.068648, -0.3688779, 1.216387, 1, 0, 0.1137255, 1,
2.071462, -1.250976, 1.369063, 1, 0, 0.1098039, 1,
2.080358, 0.4191121, 2.409721, 1, 0, 0.1019608, 1,
2.112934, -0.354033, 1.566894, 1, 0, 0.09411765, 1,
2.114916, 2.942482, 0.808472, 1, 0, 0.09019608, 1,
2.128964, -1.034023, 0.1181711, 1, 0, 0.08235294, 1,
2.137382, 0.1674095, 1.464639, 1, 0, 0.07843138, 1,
2.138602, 1.342713, -0.3025502, 1, 0, 0.07058824, 1,
2.138616, 0.05331042, 3.114957, 1, 0, 0.06666667, 1,
2.290239, 2.223762, -0.929692, 1, 0, 0.05882353, 1,
2.332595, 0.7731749, 1.574868, 1, 0, 0.05490196, 1,
2.333367, -0.7904122, 0.5709004, 1, 0, 0.04705882, 1,
2.352863, -0.781374, 1.902521, 1, 0, 0.04313726, 1,
2.368751, -0.9031612, 2.812596, 1, 0, 0.03529412, 1,
2.379655, -1.288504, 2.407113, 1, 0, 0.03137255, 1,
2.421766, -2.954252, 1.740918, 1, 0, 0.02352941, 1,
2.486187, 0.7526116, 0.5038927, 1, 0, 0.01960784, 1,
2.558491, 0.1531415, 2.815706, 1, 0, 0.01176471, 1,
2.789335, 0.00872662, 0.9058986, 1, 0, 0.007843138, 1
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
-0.26679, -4.200957, -6.962322, 0, -0.5, 0.5, 0.5,
-0.26679, -4.200957, -6.962322, 1, -0.5, 0.5, 0.5,
-0.26679, -4.200957, -6.962322, 1, 1.5, 0.5, 0.5,
-0.26679, -4.200957, -6.962322, 0, 1.5, 0.5, 0.5
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
-4.358942, -0.1115749, -6.962322, 0, -0.5, 0.5, 0.5,
-4.358942, -0.1115749, -6.962322, 1, -0.5, 0.5, 0.5,
-4.358942, -0.1115749, -6.962322, 1, 1.5, 0.5, 0.5,
-4.358942, -0.1115749, -6.962322, 0, 1.5, 0.5, 0.5
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
-4.358942, -4.200957, 0.08345962, 0, -0.5, 0.5, 0.5,
-4.358942, -4.200957, 0.08345962, 1, -0.5, 0.5, 0.5,
-4.358942, -4.200957, 0.08345962, 1, 1.5, 0.5, 0.5,
-4.358942, -4.200957, 0.08345962, 0, 1.5, 0.5, 0.5
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
-3, -3.257254, -5.336373,
2, -3.257254, -5.336373,
-3, -3.257254, -5.336373,
-3, -3.414538, -5.607364,
-2, -3.257254, -5.336373,
-2, -3.414538, -5.607364,
-1, -3.257254, -5.336373,
-1, -3.414538, -5.607364,
0, -3.257254, -5.336373,
0, -3.414538, -5.607364,
1, -3.257254, -5.336373,
1, -3.414538, -5.607364,
2, -3.257254, -5.336373,
2, -3.414538, -5.607364
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
"-3",
"-2",
"-1",
"0",
"1",
"2"
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
-3, -3.729105, -6.149348, 0, -0.5, 0.5, 0.5,
-3, -3.729105, -6.149348, 1, -0.5, 0.5, 0.5,
-3, -3.729105, -6.149348, 1, 1.5, 0.5, 0.5,
-3, -3.729105, -6.149348, 0, 1.5, 0.5, 0.5,
-2, -3.729105, -6.149348, 0, -0.5, 0.5, 0.5,
-2, -3.729105, -6.149348, 1, -0.5, 0.5, 0.5,
-2, -3.729105, -6.149348, 1, 1.5, 0.5, 0.5,
-2, -3.729105, -6.149348, 0, 1.5, 0.5, 0.5,
-1, -3.729105, -6.149348, 0, -0.5, 0.5, 0.5,
-1, -3.729105, -6.149348, 1, -0.5, 0.5, 0.5,
-1, -3.729105, -6.149348, 1, 1.5, 0.5, 0.5,
-1, -3.729105, -6.149348, 0, 1.5, 0.5, 0.5,
0, -3.729105, -6.149348, 0, -0.5, 0.5, 0.5,
0, -3.729105, -6.149348, 1, -0.5, 0.5, 0.5,
0, -3.729105, -6.149348, 1, 1.5, 0.5, 0.5,
0, -3.729105, -6.149348, 0, 1.5, 0.5, 0.5,
1, -3.729105, -6.149348, 0, -0.5, 0.5, 0.5,
1, -3.729105, -6.149348, 1, -0.5, 0.5, 0.5,
1, -3.729105, -6.149348, 1, 1.5, 0.5, 0.5,
1, -3.729105, -6.149348, 0, 1.5, 0.5, 0.5,
2, -3.729105, -6.149348, 0, -0.5, 0.5, 0.5,
2, -3.729105, -6.149348, 1, -0.5, 0.5, 0.5,
2, -3.729105, -6.149348, 1, 1.5, 0.5, 0.5,
2, -3.729105, -6.149348, 0, 1.5, 0.5, 0.5
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
-3.414599, -3, -5.336373,
-3.414599, 2, -5.336373,
-3.414599, -3, -5.336373,
-3.571989, -3, -5.607364,
-3.414599, -2, -5.336373,
-3.571989, -2, -5.607364,
-3.414599, -1, -5.336373,
-3.571989, -1, -5.607364,
-3.414599, 0, -5.336373,
-3.571989, 0, -5.607364,
-3.414599, 1, -5.336373,
-3.571989, 1, -5.607364,
-3.414599, 2, -5.336373,
-3.571989, 2, -5.607364
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
"2"
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
-3.88677, -3, -6.149348, 0, -0.5, 0.5, 0.5,
-3.88677, -3, -6.149348, 1, -0.5, 0.5, 0.5,
-3.88677, -3, -6.149348, 1, 1.5, 0.5, 0.5,
-3.88677, -3, -6.149348, 0, 1.5, 0.5, 0.5,
-3.88677, -2, -6.149348, 0, -0.5, 0.5, 0.5,
-3.88677, -2, -6.149348, 1, -0.5, 0.5, 0.5,
-3.88677, -2, -6.149348, 1, 1.5, 0.5, 0.5,
-3.88677, -2, -6.149348, 0, 1.5, 0.5, 0.5,
-3.88677, -1, -6.149348, 0, -0.5, 0.5, 0.5,
-3.88677, -1, -6.149348, 1, -0.5, 0.5, 0.5,
-3.88677, -1, -6.149348, 1, 1.5, 0.5, 0.5,
-3.88677, -1, -6.149348, 0, 1.5, 0.5, 0.5,
-3.88677, 0, -6.149348, 0, -0.5, 0.5, 0.5,
-3.88677, 0, -6.149348, 1, -0.5, 0.5, 0.5,
-3.88677, 0, -6.149348, 1, 1.5, 0.5, 0.5,
-3.88677, 0, -6.149348, 0, 1.5, 0.5, 0.5,
-3.88677, 1, -6.149348, 0, -0.5, 0.5, 0.5,
-3.88677, 1, -6.149348, 1, -0.5, 0.5, 0.5,
-3.88677, 1, -6.149348, 1, 1.5, 0.5, 0.5,
-3.88677, 1, -6.149348, 0, 1.5, 0.5, 0.5,
-3.88677, 2, -6.149348, 0, -0.5, 0.5, 0.5,
-3.88677, 2, -6.149348, 1, -0.5, 0.5, 0.5,
-3.88677, 2, -6.149348, 1, 1.5, 0.5, 0.5,
-3.88677, 2, -6.149348, 0, 1.5, 0.5, 0.5
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
-3.414599, -3.257254, -4,
-3.414599, -3.257254, 4,
-3.414599, -3.257254, -4,
-3.571989, -3.414538, -4,
-3.414599, -3.257254, -2,
-3.571989, -3.414538, -2,
-3.414599, -3.257254, 0,
-3.571989, -3.414538, 0,
-3.414599, -3.257254, 2,
-3.571989, -3.414538, 2,
-3.414599, -3.257254, 4,
-3.571989, -3.414538, 4
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
-3.88677, -3.729105, -4, 0, -0.5, 0.5, 0.5,
-3.88677, -3.729105, -4, 1, -0.5, 0.5, 0.5,
-3.88677, -3.729105, -4, 1, 1.5, 0.5, 0.5,
-3.88677, -3.729105, -4, 0, 1.5, 0.5, 0.5,
-3.88677, -3.729105, -2, 0, -0.5, 0.5, 0.5,
-3.88677, -3.729105, -2, 1, -0.5, 0.5, 0.5,
-3.88677, -3.729105, -2, 1, 1.5, 0.5, 0.5,
-3.88677, -3.729105, -2, 0, 1.5, 0.5, 0.5,
-3.88677, -3.729105, 0, 0, -0.5, 0.5, 0.5,
-3.88677, -3.729105, 0, 1, -0.5, 0.5, 0.5,
-3.88677, -3.729105, 0, 1, 1.5, 0.5, 0.5,
-3.88677, -3.729105, 0, 0, 1.5, 0.5, 0.5,
-3.88677, -3.729105, 2, 0, -0.5, 0.5, 0.5,
-3.88677, -3.729105, 2, 1, -0.5, 0.5, 0.5,
-3.88677, -3.729105, 2, 1, 1.5, 0.5, 0.5,
-3.88677, -3.729105, 2, 0, 1.5, 0.5, 0.5,
-3.88677, -3.729105, 4, 0, -0.5, 0.5, 0.5,
-3.88677, -3.729105, 4, 1, -0.5, 0.5, 0.5,
-3.88677, -3.729105, 4, 1, 1.5, 0.5, 0.5,
-3.88677, -3.729105, 4, 0, 1.5, 0.5, 0.5
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
-3.414599, -3.257254, -5.336373,
-3.414599, 3.034104, -5.336373,
-3.414599, -3.257254, 5.503292,
-3.414599, 3.034104, 5.503292,
-3.414599, -3.257254, -5.336373,
-3.414599, -3.257254, 5.503292,
-3.414599, 3.034104, -5.336373,
-3.414599, 3.034104, 5.503292,
-3.414599, -3.257254, -5.336373,
2.881019, -3.257254, -5.336373,
-3.414599, -3.257254, 5.503292,
2.881019, -3.257254, 5.503292,
-3.414599, 3.034104, -5.336373,
2.881019, 3.034104, -5.336373,
-3.414599, 3.034104, 5.503292,
2.881019, 3.034104, 5.503292,
2.881019, -3.257254, -5.336373,
2.881019, 3.034104, -5.336373,
2.881019, -3.257254, 5.503292,
2.881019, 3.034104, 5.503292,
2.881019, -3.257254, -5.336373,
2.881019, -3.257254, 5.503292,
2.881019, 3.034104, -5.336373,
2.881019, 3.034104, 5.503292
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
var radius = 7.489338;
var distance = 33.32091;
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
mvMatrix.translate( 0.26679, 0.1115749, -0.08345962 );
mvMatrix.scale( 1.286231, 1.287102, 0.747036 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.32091);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Monocrotophos<-read.table("Monocrotophos.xyz")
```

```
## Error in read.table("Monocrotophos.xyz"): no lines available in input
```

```r
x<-Monocrotophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Monocrotophos' not found
```

```r
y<-Monocrotophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Monocrotophos' not found
```

```r
z<-Monocrotophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Monocrotophos' not found
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
-3.322915, 1.411111, -0.2218705, 0, 0, 1, 1, 1,
-2.96351, -0.404256, -1.67235, 1, 0, 0, 1, 1,
-2.733186, -1.24493, -2.209645, 1, 0, 0, 1, 1,
-2.621348, -0.3112369, -2.446844, 1, 0, 0, 1, 1,
-2.485411, -1.204437, -2.352514, 1, 0, 0, 1, 1,
-2.32109, -1.106821, -1.356022, 1, 0, 0, 1, 1,
-2.309045, -1.572362, -1.285167, 0, 0, 0, 1, 1,
-2.301756, 0.04503065, -0.976142, 0, 0, 0, 1, 1,
-2.279633, 0.5273135, -0.05851708, 0, 0, 0, 1, 1,
-2.10511, -3.165632, -1.456904, 0, 0, 0, 1, 1,
-2.07979, 0.85301, 0.6456975, 0, 0, 0, 1, 1,
-2.078928, -0.2964023, -0.697913, 0, 0, 0, 1, 1,
-2.067635, -1.598838, -2.807004, 0, 0, 0, 1, 1,
-2.067229, 1.112952, -2.272398, 1, 1, 1, 1, 1,
-2.043136, 1.669284, -2.386267, 1, 1, 1, 1, 1,
-2.024252, 0.8044228, -0.2462722, 1, 1, 1, 1, 1,
-2.015063, -0.008935026, -2.079214, 1, 1, 1, 1, 1,
-1.989601, 1.371038, -1.948692, 1, 1, 1, 1, 1,
-1.967029, 0.007610314, -2.16195, 1, 1, 1, 1, 1,
-1.930265, 0.04311492, -2.92423, 1, 1, 1, 1, 1,
-1.898236, 0.5816262, -0.7531978, 1, 1, 1, 1, 1,
-1.875459, -0.2438271, -1.520176, 1, 1, 1, 1, 1,
-1.856015, 2.558465, -1.112342, 1, 1, 1, 1, 1,
-1.844546, -1.616958, -2.447988, 1, 1, 1, 1, 1,
-1.844539, 0.5693187, -1.562717, 1, 1, 1, 1, 1,
-1.843308, -1.363986, -2.848327, 1, 1, 1, 1, 1,
-1.824241, 0.2321325, -2.184937, 1, 1, 1, 1, 1,
-1.760459, 0.2289753, -0.7543781, 1, 1, 1, 1, 1,
-1.752046, 0.303314, 0.4948595, 0, 0, 1, 1, 1,
-1.739184, 0.04273366, -1.039833, 1, 0, 0, 1, 1,
-1.734378, -0.2669875, -1.240152, 1, 0, 0, 1, 1,
-1.732193, -0.3523892, -1.05348, 1, 0, 0, 1, 1,
-1.726745, 0.6134124, -1.078545, 1, 0, 0, 1, 1,
-1.716685, 0.02761785, -1.508227, 1, 0, 0, 1, 1,
-1.715684, 1.492845, -2.016584, 0, 0, 0, 1, 1,
-1.704035, 0.1513017, -1.528586, 0, 0, 0, 1, 1,
-1.700658, 0.8608558, -2.100241, 0, 0, 0, 1, 1,
-1.692004, 1.505323, 0.5057917, 0, 0, 0, 1, 1,
-1.671443, -1.391831, -3.911935, 0, 0, 0, 1, 1,
-1.669961, -0.8646615, -2.156823, 0, 0, 0, 1, 1,
-1.665521, 0.06212662, -0.9596813, 0, 0, 0, 1, 1,
-1.662524, -0.06277541, -2.200904, 1, 1, 1, 1, 1,
-1.624087, -0.7194863, -3.29415, 1, 1, 1, 1, 1,
-1.618756, -2.930466, -2.683719, 1, 1, 1, 1, 1,
-1.616008, 1.36296, -1.7599, 1, 1, 1, 1, 1,
-1.611867, -0.5112393, -1.889019, 1, 1, 1, 1, 1,
-1.608946, 0.9805128, -0.9913149, 1, 1, 1, 1, 1,
-1.60806, 1.62976, -0.8525437, 1, 1, 1, 1, 1,
-1.592203, -0.6859173, -1.664067, 1, 1, 1, 1, 1,
-1.590085, 0.02965822, -2.022151, 1, 1, 1, 1, 1,
-1.556137, 0.4935471, -0.4175189, 1, 1, 1, 1, 1,
-1.550885, 1.239876, -0.9547949, 1, 1, 1, 1, 1,
-1.533197, -0.8528197, -3.014382, 1, 1, 1, 1, 1,
-1.523114, -1.030207, -1.49233, 1, 1, 1, 1, 1,
-1.522576, 0.9390005, 0.02087143, 1, 1, 1, 1, 1,
-1.513462, -0.1049755, -0.7829751, 1, 1, 1, 1, 1,
-1.508533, 0.543323, -1.476048, 0, 0, 1, 1, 1,
-1.497369, 1.55136, -1.325401, 1, 0, 0, 1, 1,
-1.464416, 0.6149935, -0.7052967, 1, 0, 0, 1, 1,
-1.445183, 0.07315083, -1.664594, 1, 0, 0, 1, 1,
-1.44234, -0.3938518, -2.203409, 1, 0, 0, 1, 1,
-1.43956, -1.113799, -4.037031, 1, 0, 0, 1, 1,
-1.437479, 0.2581742, -0.2679914, 0, 0, 0, 1, 1,
-1.433533, 0.6501762, -1.853355, 0, 0, 0, 1, 1,
-1.426872, 0.5535122, -1.172714, 0, 0, 0, 1, 1,
-1.426099, -0.1807369, -0.07866526, 0, 0, 0, 1, 1,
-1.426022, -1.063301, -3.114793, 0, 0, 0, 1, 1,
-1.417915, 1.702361, -1.550364, 0, 0, 0, 1, 1,
-1.407335, 0.438895, -1.453006, 0, 0, 0, 1, 1,
-1.394024, -1.742581, -1.289031, 1, 1, 1, 1, 1,
-1.392837, -0.4384971, -0.8602285, 1, 1, 1, 1, 1,
-1.37432, -0.5756817, -3.12962, 1, 1, 1, 1, 1,
-1.36688, 1.126777, -0.6412252, 1, 1, 1, 1, 1,
-1.364132, 1.489578, -2.185671, 1, 1, 1, 1, 1,
-1.360035, -0.1753686, -1.074217, 1, 1, 1, 1, 1,
-1.355841, 0.2045398, -1.686454, 1, 1, 1, 1, 1,
-1.343302, 1.481402, -1.132886, 1, 1, 1, 1, 1,
-1.342595, 0.8322968, -0.2405853, 1, 1, 1, 1, 1,
-1.341636, -0.8159626, -2.261542, 1, 1, 1, 1, 1,
-1.332747, -0.5833038, -2.946694, 1, 1, 1, 1, 1,
-1.317516, 0.1319275, -1.19226, 1, 1, 1, 1, 1,
-1.311711, -0.4911284, -3.875669, 1, 1, 1, 1, 1,
-1.307335, -1.008131, -3.207175, 1, 1, 1, 1, 1,
-1.304667, 0.4684383, -0.9276526, 1, 1, 1, 1, 1,
-1.298278, 1.390473, -0.2680368, 0, 0, 1, 1, 1,
-1.2962, -0.165306, -0.7664388, 1, 0, 0, 1, 1,
-1.289238, -0.08464275, -0.5289694, 1, 0, 0, 1, 1,
-1.282319, 0.3955509, 0.5514313, 1, 0, 0, 1, 1,
-1.282116, 0.9972554, -1.564252, 1, 0, 0, 1, 1,
-1.279932, 0.6117865, -0.9026805, 1, 0, 0, 1, 1,
-1.266224, -1.710264, -2.228493, 0, 0, 0, 1, 1,
-1.262448, -0.2197569, 0.5423408, 0, 0, 0, 1, 1,
-1.256815, -1.090323, -0.8084955, 0, 0, 0, 1, 1,
-1.254697, -1.081254, -2.771422, 0, 0, 0, 1, 1,
-1.247182, 0.6924678, -2.253467, 0, 0, 0, 1, 1,
-1.244692, 0.7314119, -1.919532, 0, 0, 0, 1, 1,
-1.24285, -0.7352676, -3.023921, 0, 0, 0, 1, 1,
-1.239323, -0.1354851, 0.3271716, 1, 1, 1, 1, 1,
-1.232537, -1.392331, -0.6856554, 1, 1, 1, 1, 1,
-1.231265, 1.853985, -0.8356682, 1, 1, 1, 1, 1,
-1.218895, 2.322367, -1.44758, 1, 1, 1, 1, 1,
-1.214824, -0.2257558, -1.442241, 1, 1, 1, 1, 1,
-1.213652, -0.2078658, -2.206555, 1, 1, 1, 1, 1,
-1.212928, 0.3694561, -1.228979, 1, 1, 1, 1, 1,
-1.204299, -0.657112, -0.7009949, 1, 1, 1, 1, 1,
-1.20041, 0.7197002, -0.5694515, 1, 1, 1, 1, 1,
-1.199671, 1.565751, 0.7161961, 1, 1, 1, 1, 1,
-1.195794, 1.791354, -1.813437, 1, 1, 1, 1, 1,
-1.192779, 0.2813808, -1.756063, 1, 1, 1, 1, 1,
-1.191705, 0.1058668, -0.2571559, 1, 1, 1, 1, 1,
-1.190126, -1.346689, -0.1012655, 1, 1, 1, 1, 1,
-1.187358, -0.846761, -4.907259, 1, 1, 1, 1, 1,
-1.185862, 0.9836561, 0.2771745, 0, 0, 1, 1, 1,
-1.180472, -0.03027437, -2.172576, 1, 0, 0, 1, 1,
-1.167185, -1.300839, -1.518981, 1, 0, 0, 1, 1,
-1.165956, 0.9674845, -1.314102, 1, 0, 0, 1, 1,
-1.165272, 0.3353198, -0.9227027, 1, 0, 0, 1, 1,
-1.156865, -0.6857107, -2.977, 1, 0, 0, 1, 1,
-1.156758, 0.5839936, -0.3695592, 0, 0, 0, 1, 1,
-1.15076, 1.167121, -0.676182, 0, 0, 0, 1, 1,
-1.149048, 2.047129, -1.846679, 0, 0, 0, 1, 1,
-1.146056, 0.3834936, -0.3710839, 0, 0, 0, 1, 1,
-1.144747, -1.276204, -0.8335829, 0, 0, 0, 1, 1,
-1.143763, 0.7107303, -3.075629, 0, 0, 0, 1, 1,
-1.138311, -0.9506177, -1.883014, 0, 0, 0, 1, 1,
-1.136771, 0.6351482, -2.57538, 1, 1, 1, 1, 1,
-1.132544, 1.285341, 0.6027269, 1, 1, 1, 1, 1,
-1.132182, -0.5489427, -0.7999697, 1, 1, 1, 1, 1,
-1.131386, -1.265726, -2.238829, 1, 1, 1, 1, 1,
-1.128126, 2.067469, -0.8049254, 1, 1, 1, 1, 1,
-1.120824, 0.573382, -0.7199464, 1, 1, 1, 1, 1,
-1.120654, -0.5607803, -1.776241, 1, 1, 1, 1, 1,
-1.120315, 1.697463, -1.235834, 1, 1, 1, 1, 1,
-1.108741, 1.6516, 0.5149391, 1, 1, 1, 1, 1,
-1.105879, 1.170613, 0.3537212, 1, 1, 1, 1, 1,
-1.104209, 0.3944876, 0.007576344, 1, 1, 1, 1, 1,
-1.104077, -0.8869226, -2.259806, 1, 1, 1, 1, 1,
-1.09872, -0.2472462, -1.366316, 1, 1, 1, 1, 1,
-1.095865, 2.081339, 0.786837, 1, 1, 1, 1, 1,
-1.094568, -0.6414292, -0.6126526, 1, 1, 1, 1, 1,
-1.093899, 0.285313, 0.0588194, 0, 0, 1, 1, 1,
-1.080705, 0.296466, -1.334952, 1, 0, 0, 1, 1,
-1.079167, 0.5712935, -0.01698562, 1, 0, 0, 1, 1,
-1.078345, 0.4054288, -1.533174, 1, 0, 0, 1, 1,
-1.076236, 0.2359456, -1.42102, 1, 0, 0, 1, 1,
-1.07477, 1.366219, -0.456835, 1, 0, 0, 1, 1,
-1.074699, 0.2093607, -0.5860656, 0, 0, 0, 1, 1,
-1.065683, -0.5509459, -2.288017, 0, 0, 0, 1, 1,
-1.06484, 1.589178, -1.346039, 0, 0, 0, 1, 1,
-1.064394, -0.7543619, -0.4356779, 0, 0, 0, 1, 1,
-1.064377, -1.133734, -1.144502, 0, 0, 0, 1, 1,
-1.05705, 0.6465899, 0.1802361, 0, 0, 0, 1, 1,
-1.05573, 0.282758, -2.764125, 0, 0, 0, 1, 1,
-1.053456, -2.056014, -1.529765, 1, 1, 1, 1, 1,
-1.049901, 1.642813, 0.353915, 1, 1, 1, 1, 1,
-1.01243, 0.8554173, -1.26148, 1, 1, 1, 1, 1,
-1.012377, 1.3045, 0.5987435, 1, 1, 1, 1, 1,
-1.011738, -0.4679031, -1.410207, 1, 1, 1, 1, 1,
-1.006831, -0.2843725, -1.717849, 1, 1, 1, 1, 1,
-0.9891854, -0.07513199, -1.176483, 1, 1, 1, 1, 1,
-0.9851562, 0.9098693, -0.7069523, 1, 1, 1, 1, 1,
-0.9792622, 1.913741, -0.5071322, 1, 1, 1, 1, 1,
-0.9791116, -0.5175341, -2.896615, 1, 1, 1, 1, 1,
-0.9567521, 2.720268, -0.009062508, 1, 1, 1, 1, 1,
-0.9531508, -0.2046154, -1.270212, 1, 1, 1, 1, 1,
-0.952984, -0.5906339, -2.142367, 1, 1, 1, 1, 1,
-0.9436672, 0.1598488, -2.575472, 1, 1, 1, 1, 1,
-0.9432084, 0.2263201, -0.4098677, 1, 1, 1, 1, 1,
-0.942423, 0.6960971, -2.069303, 0, 0, 1, 1, 1,
-0.9386684, -0.9690726, -1.111114, 1, 0, 0, 1, 1,
-0.9373951, 0.2733821, -2.468543, 1, 0, 0, 1, 1,
-0.9363318, -1.803864, -1.450167, 1, 0, 0, 1, 1,
-0.9354324, 0.8187376, 0.6069074, 1, 0, 0, 1, 1,
-0.915704, -0.8244112, -2.279519, 1, 0, 0, 1, 1,
-0.9117525, 1.020279, 0.829759, 0, 0, 0, 1, 1,
-0.9078526, -0.7432252, -2.002667, 0, 0, 0, 1, 1,
-0.9073279, -0.4841958, -1.670193, 0, 0, 0, 1, 1,
-0.9062456, 1.061023, 0.4135164, 0, 0, 0, 1, 1,
-0.9039822, -1.148598, -0.9428038, 0, 0, 0, 1, 1,
-0.9004723, -1.309963, -2.532751, 0, 0, 0, 1, 1,
-0.8987616, -0.8638681, -2.839058, 0, 0, 0, 1, 1,
-0.8980523, -0.4452823, -1.925055, 1, 1, 1, 1, 1,
-0.8964345, -1.373963, -4.593903, 1, 1, 1, 1, 1,
-0.8940607, 0.2403826, -1.940002, 1, 1, 1, 1, 1,
-0.8802804, -0.02286628, -1.301517, 1, 1, 1, 1, 1,
-0.8783203, -0.9293846, -0.6189665, 1, 1, 1, 1, 1,
-0.8743128, 0.8143293, -0.3924952, 1, 1, 1, 1, 1,
-0.8686641, 0.5827044, -1.658758, 1, 1, 1, 1, 1,
-0.8669666, -0.2074406, -2.829591, 1, 1, 1, 1, 1,
-0.8655201, -0.4920986, -2.995949, 1, 1, 1, 1, 1,
-0.8640742, -0.6453021, -2.018447, 1, 1, 1, 1, 1,
-0.8635504, 1.072485, -1.674371, 1, 1, 1, 1, 1,
-0.8592333, -1.512872, -5.026066, 1, 1, 1, 1, 1,
-0.8530477, -1.093284, -2.697326, 1, 1, 1, 1, 1,
-0.8526574, 0.8325731, -0.9011723, 1, 1, 1, 1, 1,
-0.8494855, 0.8983294, -1.596915, 1, 1, 1, 1, 1,
-0.8406272, 1.079791, 0.6758931, 0, 0, 1, 1, 1,
-0.8382154, 0.8149643, -1.38749, 1, 0, 0, 1, 1,
-0.8362315, -0.3750774, -1.313988, 1, 0, 0, 1, 1,
-0.8321706, -2.568851, -2.596433, 1, 0, 0, 1, 1,
-0.8319904, 0.1937048, -0.1562149, 1, 0, 0, 1, 1,
-0.8294564, 0.7110656, -1.253353, 1, 0, 0, 1, 1,
-0.824281, 0.3099674, 0.2918821, 0, 0, 0, 1, 1,
-0.8219334, -0.9650988, -1.462408, 0, 0, 0, 1, 1,
-0.8167968, 0.9934554, -1.228642, 0, 0, 0, 1, 1,
-0.8163362, -1.34343, -3.502326, 0, 0, 0, 1, 1,
-0.8130937, -1.954428, -4.334823, 0, 0, 0, 1, 1,
-0.7998207, -0.0299238, -1.758013, 0, 0, 0, 1, 1,
-0.798333, -1.500826, -4.491421, 0, 0, 0, 1, 1,
-0.7970052, -0.8550863, -3.281462, 1, 1, 1, 1, 1,
-0.7885742, 0.04917445, -1.257112, 1, 1, 1, 1, 1,
-0.7869172, 0.5160666, -1.757194, 1, 1, 1, 1, 1,
-0.7864091, 1.609204, -2.134093, 1, 1, 1, 1, 1,
-0.7850355, -0.9309463, -1.209805, 1, 1, 1, 1, 1,
-0.782102, 0.9952789, 0.7182841, 1, 1, 1, 1, 1,
-0.7675112, 0.3190407, 0.849887, 1, 1, 1, 1, 1,
-0.7672999, 0.3863405, -1.79484, 1, 1, 1, 1, 1,
-0.7616195, -1.206743, -2.882705, 1, 1, 1, 1, 1,
-0.7544279, 0.9882143, 0.07317453, 1, 1, 1, 1, 1,
-0.7528515, -0.822667, -2.363814, 1, 1, 1, 1, 1,
-0.7403508, 0.1243355, -0.1890427, 1, 1, 1, 1, 1,
-0.7387844, -0.3842155, -2.538985, 1, 1, 1, 1, 1,
-0.7346358, -0.3852848, -2.055464, 1, 1, 1, 1, 1,
-0.7330049, 1.163502, -0.4994622, 1, 1, 1, 1, 1,
-0.7323474, 1.81156, -0.7219835, 0, 0, 1, 1, 1,
-0.7254859, 0.08515929, -1.906523, 1, 0, 0, 1, 1,
-0.7251327, 0.7524422, -1.981664, 1, 0, 0, 1, 1,
-0.7245155, -0.7006804, -2.822783, 1, 0, 0, 1, 1,
-0.7212628, 0.3556079, -1.1514, 1, 0, 0, 1, 1,
-0.7162729, -0.02265156, -2.306778, 1, 0, 0, 1, 1,
-0.7154261, -0.2155505, -1.440255, 0, 0, 0, 1, 1,
-0.7138905, 0.6488065, -1.008404, 0, 0, 0, 1, 1,
-0.7137527, 0.3389274, 0.9691473, 0, 0, 0, 1, 1,
-0.7122579, 0.2178378, -0.9072008, 0, 0, 0, 1, 1,
-0.7086553, -0.5100219, -1.268846, 0, 0, 0, 1, 1,
-0.7077777, 0.8186478, -1.685403, 0, 0, 0, 1, 1,
-0.706532, 1.617403, -0.6534167, 0, 0, 0, 1, 1,
-0.7044783, -0.4918733, -2.593869, 1, 1, 1, 1, 1,
-0.7023627, -0.6944692, -2.079883, 1, 1, 1, 1, 1,
-0.6917483, -0.270456, -2.11317, 1, 1, 1, 1, 1,
-0.6892342, -0.3242468, -1.816045, 1, 1, 1, 1, 1,
-0.6734914, -0.3562118, -2.256105, 1, 1, 1, 1, 1,
-0.6722005, -1.540318, -1.214064, 1, 1, 1, 1, 1,
-0.671092, 0.9497008, -1.887839, 1, 1, 1, 1, 1,
-0.6622635, 0.648183, -2.1826, 1, 1, 1, 1, 1,
-0.6581437, 0.08865538, -0.6004466, 1, 1, 1, 1, 1,
-0.6544064, 0.09598372, -0.6625082, 1, 1, 1, 1, 1,
-0.6469644, 0.006010677, -1.896203, 1, 1, 1, 1, 1,
-0.6445169, 0.9016299, 0.8540579, 1, 1, 1, 1, 1,
-0.643609, 0.8375897, -0.634419, 1, 1, 1, 1, 1,
-0.643586, -1.608135, -2.430904, 1, 1, 1, 1, 1,
-0.6342229, 0.5569662, -1.238635, 1, 1, 1, 1, 1,
-0.6319415, 0.1962972, 0.09279406, 0, 0, 1, 1, 1,
-0.6292713, -0.5101491, -3.513942, 1, 0, 0, 1, 1,
-0.6221809, 0.6890879, -0.2121245, 1, 0, 0, 1, 1,
-0.6143873, 2.103155, -0.3738899, 1, 0, 0, 1, 1,
-0.6132148, 0.3926358, -3.063647, 1, 0, 0, 1, 1,
-0.6120064, -0.845805, -1.386774, 1, 0, 0, 1, 1,
-0.6112002, 1.986428, -1.314618, 0, 0, 0, 1, 1,
-0.6088951, -0.009027038, -2.314649, 0, 0, 0, 1, 1,
-0.6066168, -0.7275251, -1.061279, 0, 0, 0, 1, 1,
-0.5998874, -2.090238, -5.002526, 0, 0, 0, 1, 1,
-0.5989257, -0.2850383, -1.535799, 0, 0, 0, 1, 1,
-0.5950882, -1.619583, -1.607026, 0, 0, 0, 1, 1,
-0.5930008, 0.8558058, -1.556672, 0, 0, 0, 1, 1,
-0.5846303, -0.7270309, -2.875094, 1, 1, 1, 1, 1,
-0.5844302, -0.7940987, -2.846819, 1, 1, 1, 1, 1,
-0.5806534, -0.1376267, -2.106752, 1, 1, 1, 1, 1,
-0.5800954, -1.252849, -2.793241, 1, 1, 1, 1, 1,
-0.5753224, 1.733014, -1.190511, 1, 1, 1, 1, 1,
-0.5697765, -1.534183, -2.769463, 1, 1, 1, 1, 1,
-0.5691796, 0.7282045, 1.256544, 1, 1, 1, 1, 1,
-0.5648101, 1.726323, -1.137422, 1, 1, 1, 1, 1,
-0.5627056, -0.792611, -1.512657, 1, 1, 1, 1, 1,
-0.5512623, 0.9512105, 1.214368, 1, 1, 1, 1, 1,
-0.5448636, -1.510348, -4.362351, 1, 1, 1, 1, 1,
-0.5384851, -0.3722341, -2.686655, 1, 1, 1, 1, 1,
-0.5367798, 0.0827558, -1.65065, 1, 1, 1, 1, 1,
-0.5362693, 0.492932, -2.906129, 1, 1, 1, 1, 1,
-0.5314196, -1.032311, -4.202621, 1, 1, 1, 1, 1,
-0.5284716, 1.28808, 0.5434691, 0, 0, 1, 1, 1,
-0.5280319, -0.3784479, -1.080528, 1, 0, 0, 1, 1,
-0.5264722, 0.2175276, 0.9490719, 1, 0, 0, 1, 1,
-0.5255156, 0.7807149, 0.6445301, 1, 0, 0, 1, 1,
-0.5238891, 0.2257838, 0.2011661, 1, 0, 0, 1, 1,
-0.5219531, 0.02436854, -1.762778, 1, 0, 0, 1, 1,
-0.5217201, 0.8610197, -0.7857349, 0, 0, 0, 1, 1,
-0.5194377, 0.8785793, -1.229769, 0, 0, 0, 1, 1,
-0.5129926, 0.01370055, -1.402736, 0, 0, 0, 1, 1,
-0.5105302, 0.4762236, -1.691438, 0, 0, 0, 1, 1,
-0.5104617, 0.9515514, 0.3442875, 0, 0, 0, 1, 1,
-0.5063382, -0.3205348, -1.663131, 0, 0, 0, 1, 1,
-0.5062027, -0.7750729, -2.854198, 0, 0, 0, 1, 1,
-0.5030997, 1.747381, -1.359464, 1, 1, 1, 1, 1,
-0.502759, 0.6427433, -0.1136001, 1, 1, 1, 1, 1,
-0.5022873, -0.8016158, -2.504709, 1, 1, 1, 1, 1,
-0.5006217, 0.09078151, -2.400475, 1, 1, 1, 1, 1,
-0.5003924, -0.5936026, -1.638864, 1, 1, 1, 1, 1,
-0.498279, 0.146375, -2.529974, 1, 1, 1, 1, 1,
-0.4981531, 1.880026, -1.647162, 1, 1, 1, 1, 1,
-0.4927762, 0.1928699, -0.7188242, 1, 1, 1, 1, 1,
-0.4925384, -0.5135127, -1.969878, 1, 1, 1, 1, 1,
-0.4879169, -0.4992983, -1.272858, 1, 1, 1, 1, 1,
-0.4864685, -2.089807, -4.216646, 1, 1, 1, 1, 1,
-0.4774511, -0.6437486, -2.994828, 1, 1, 1, 1, 1,
-0.4761267, 1.314872, -0.8929598, 1, 1, 1, 1, 1,
-0.4749404, -0.8459927, -3.946607, 1, 1, 1, 1, 1,
-0.463071, 0.01602786, -1.352811, 1, 1, 1, 1, 1,
-0.462905, -0.9062417, -2.461158, 0, 0, 1, 1, 1,
-0.4607309, -0.6440221, -2.495098, 1, 0, 0, 1, 1,
-0.4595446, 0.04307222, -0.8306992, 1, 0, 0, 1, 1,
-0.4595135, -0.4707997, -1.48393, 1, 0, 0, 1, 1,
-0.4564741, -0.6425784, -2.223155, 1, 0, 0, 1, 1,
-0.4546099, 0.80438, 1.378859, 1, 0, 0, 1, 1,
-0.4494135, -0.3132365, -2.828974, 0, 0, 0, 1, 1,
-0.4474648, 1.209861, -0.4290198, 0, 0, 0, 1, 1,
-0.4439619, -0.255112, -2.448675, 0, 0, 0, 1, 1,
-0.4415359, -0.5202083, -2.465918, 0, 0, 0, 1, 1,
-0.440785, -0.3450031, -0.4704224, 0, 0, 0, 1, 1,
-0.4378542, -0.1174673, -3.429931, 0, 0, 0, 1, 1,
-0.4343638, -0.2083354, -3.002956, 0, 0, 0, 1, 1,
-0.4335823, -1.954467, -2.689254, 1, 1, 1, 1, 1,
-0.4265014, 1.005955, 0.3450496, 1, 1, 1, 1, 1,
-0.4262545, -0.2950436, -0.4805935, 1, 1, 1, 1, 1,
-0.4237207, -0.1936141, -3.167845, 1, 1, 1, 1, 1,
-0.4187077, -2.762195, -1.802188, 1, 1, 1, 1, 1,
-0.4180404, 0.3254433, -0.5286478, 1, 1, 1, 1, 1,
-0.4162476, 0.5991601, -1.760105, 1, 1, 1, 1, 1,
-0.4122243, 0.0196091, -2.736501, 1, 1, 1, 1, 1,
-0.4056577, -0.3529878, -2.259678, 1, 1, 1, 1, 1,
-0.4008914, 0.8153201, -0.4847823, 1, 1, 1, 1, 1,
-0.3983056, -1.348457, -3.668352, 1, 1, 1, 1, 1,
-0.3924231, -0.8891303, -3.496029, 1, 1, 1, 1, 1,
-0.3880677, -0.4607386, -3.038049, 1, 1, 1, 1, 1,
-0.3856439, -0.4615759, -2.606722, 1, 1, 1, 1, 1,
-0.3813162, -1.721587, -3.167158, 1, 1, 1, 1, 1,
-0.3782328, 0.7587042, -0.8840417, 0, 0, 1, 1, 1,
-0.3673657, 0.5674635, 0.1087408, 1, 0, 0, 1, 1,
-0.3643458, 0.03033458, -2.883494, 1, 0, 0, 1, 1,
-0.3643081, -1.214006, -3.359645, 1, 0, 0, 1, 1,
-0.3631264, -1.463768, -3.761679, 1, 0, 0, 1, 1,
-0.3582168, -0.05885345, -1.039716, 1, 0, 0, 1, 1,
-0.3576403, -1.084002, -0.657163, 0, 0, 0, 1, 1,
-0.3532782, 0.7446308, -0.4977714, 0, 0, 0, 1, 1,
-0.3472469, 0.02888859, -1.579324, 0, 0, 0, 1, 1,
-0.3456586, 0.1233231, -1.139641, 0, 0, 0, 1, 1,
-0.34416, -0.655149, -4.464131, 0, 0, 0, 1, 1,
-0.344142, -0.9023465, -2.356819, 0, 0, 0, 1, 1,
-0.3407466, 0.4141959, -1.815397, 0, 0, 0, 1, 1,
-0.3372426, -0.4835049, -1.248774, 1, 1, 1, 1, 1,
-0.3358803, -2.723092, -1.197605, 1, 1, 1, 1, 1,
-0.3337467, 1.139525, 0.3565424, 1, 1, 1, 1, 1,
-0.3322409, 1.299218, -0.9753537, 1, 1, 1, 1, 1,
-0.3301167, -1.234935, -2.308367, 1, 1, 1, 1, 1,
-0.329229, -1.275427, -2.900016, 1, 1, 1, 1, 1,
-0.3288742, -0.8878829, -4.191911, 1, 1, 1, 1, 1,
-0.3259177, -0.839677, -2.747626, 1, 1, 1, 1, 1,
-0.3245364, 0.02362486, -2.557102, 1, 1, 1, 1, 1,
-0.3244907, -0.3510124, -2.262549, 1, 1, 1, 1, 1,
-0.3242523, -1.153752, -1.923607, 1, 1, 1, 1, 1,
-0.3226707, 0.6815732, -0.161525, 1, 1, 1, 1, 1,
-0.3210287, -0.9632649, -3.745219, 1, 1, 1, 1, 1,
-0.3184127, -0.6843038, -3.896499, 1, 1, 1, 1, 1,
-0.3148701, 2.407748, 0.0178723, 1, 1, 1, 1, 1,
-0.311264, 0.4566011, -0.5372792, 0, 0, 1, 1, 1,
-0.3076557, -0.3140011, -3.266731, 1, 0, 0, 1, 1,
-0.3058189, 0.429826, -0.2124491, 1, 0, 0, 1, 1,
-0.3023325, -0.2447188, -1.337038, 1, 0, 0, 1, 1,
-0.2998565, 0.1676348, -0.8156251, 1, 0, 0, 1, 1,
-0.2988492, -0.5906872, -3.824889, 1, 0, 0, 1, 1,
-0.2970445, 0.7447318, 0.2969073, 0, 0, 0, 1, 1,
-0.2940095, -0.5660089, -1.218679, 0, 0, 0, 1, 1,
-0.2939742, -0.1192783, -3.03276, 0, 0, 0, 1, 1,
-0.2856704, 0.1122317, -1.672157, 0, 0, 0, 1, 1,
-0.2852534, 0.6647279, 2.387741, 0, 0, 0, 1, 1,
-0.2848445, -0.7432994, -2.585515, 0, 0, 0, 1, 1,
-0.2846912, 0.2648792, -1.47057, 0, 0, 0, 1, 1,
-0.2817764, -1.15535, -2.032455, 1, 1, 1, 1, 1,
-0.2816661, 1.916983, -1.060482, 1, 1, 1, 1, 1,
-0.2752226, -1.443408, -3.567544, 1, 1, 1, 1, 1,
-0.2741211, 0.4062098, -1.291326, 1, 1, 1, 1, 1,
-0.2729299, 1.248744, -0.8177946, 1, 1, 1, 1, 1,
-0.2716126, -0.5912967, -1.962249, 1, 1, 1, 1, 1,
-0.2707369, -0.419634, -1.106443, 1, 1, 1, 1, 1,
-0.2698698, -0.3868722, -2.390273, 1, 1, 1, 1, 1,
-0.2554353, 0.7757594, -1.613073, 1, 1, 1, 1, 1,
-0.2543925, 0.3830616, 0.1079444, 1, 1, 1, 1, 1,
-0.2491723, -0.06012803, -0.7232097, 1, 1, 1, 1, 1,
-0.2491292, -0.4652295, -2.595254, 1, 1, 1, 1, 1,
-0.2466438, -0.7943536, -1.649978, 1, 1, 1, 1, 1,
-0.2413546, -1.19786, -3.504811, 1, 1, 1, 1, 1,
-0.2387985, 0.1043604, -0.9329645, 1, 1, 1, 1, 1,
-0.2345267, -0.3940451, -3.009074, 0, 0, 1, 1, 1,
-0.2340018, -0.8493845, -2.348839, 1, 0, 0, 1, 1,
-0.2321071, -0.829245, -0.5670161, 1, 0, 0, 1, 1,
-0.2304431, -0.3597283, -3.156235, 1, 0, 0, 1, 1,
-0.2290501, 0.5472571, -1.739576, 1, 0, 0, 1, 1,
-0.228176, -0.8420151, -1.649731, 1, 0, 0, 1, 1,
-0.2272366, 0.1491931, -0.5281994, 0, 0, 0, 1, 1,
-0.2246599, -1.497317, -2.909608, 0, 0, 0, 1, 1,
-0.2235486, 0.2581445, -1.907464, 0, 0, 0, 1, 1,
-0.2168618, -0.2994142, -4.047023, 0, 0, 0, 1, 1,
-0.214592, -0.594037, -2.372417, 0, 0, 0, 1, 1,
-0.2124208, -0.1650687, -3.784112, 0, 0, 0, 1, 1,
-0.2122728, -0.04957948, -1.629779, 0, 0, 0, 1, 1,
-0.2090459, -0.6456397, -1.512373, 1, 1, 1, 1, 1,
-0.2077623, 0.2151774, -1.55428, 1, 1, 1, 1, 1,
-0.2048147, -0.6521656, -1.848554, 1, 1, 1, 1, 1,
-0.2030979, -0.2258436, -4.347147, 1, 1, 1, 1, 1,
-0.2015323, 1.135168, -1.54319, 1, 1, 1, 1, 1,
-0.1997464, 0.4671646, -1.391421, 1, 1, 1, 1, 1,
-0.1941433, 1.055939, -1.683856, 1, 1, 1, 1, 1,
-0.193894, -0.08552664, -1.542983, 1, 1, 1, 1, 1,
-0.1900234, -1.133985, -1.211557, 1, 1, 1, 1, 1,
-0.1864534, 0.0980842, -1.799063, 1, 1, 1, 1, 1,
-0.1862903, 0.2593805, -1.030338, 1, 1, 1, 1, 1,
-0.1847439, 0.6369843, -1.676358, 1, 1, 1, 1, 1,
-0.1778936, -0.9372966, -2.859477, 1, 1, 1, 1, 1,
-0.177239, 1.032784, -0.5250725, 1, 1, 1, 1, 1,
-0.1771596, 1.785364, 0.5622934, 1, 1, 1, 1, 1,
-0.1703659, -0.07051199, -2.192023, 0, 0, 1, 1, 1,
-0.1685522, -0.2333382, -1.922318, 1, 0, 0, 1, 1,
-0.1670623, 0.9088117, 0.5852823, 1, 0, 0, 1, 1,
-0.1659427, 0.05821173, -1.756818, 1, 0, 0, 1, 1,
-0.1541408, -0.9440373, -1.724597, 1, 0, 0, 1, 1,
-0.1527473, -0.1925484, -2.431292, 1, 0, 0, 1, 1,
-0.1494602, -1.959922, -4.495081, 0, 0, 0, 1, 1,
-0.1493233, 0.8206782, 0.6495342, 0, 0, 0, 1, 1,
-0.1456345, 0.5709517, 0.7717928, 0, 0, 0, 1, 1,
-0.1308839, 1.055158, -0.1413487, 0, 0, 0, 1, 1,
-0.1296293, -0.08543308, -1.331006, 0, 0, 0, 1, 1,
-0.1249643, 0.638926, -0.7065862, 0, 0, 0, 1, 1,
-0.1241298, -1.136123, -2.351833, 0, 0, 0, 1, 1,
-0.1237782, -1.152454, -4.279363, 1, 1, 1, 1, 1,
-0.1226816, -0.8380926, -3.706731, 1, 1, 1, 1, 1,
-0.1225639, -0.6396273, -3.321959, 1, 1, 1, 1, 1,
-0.1179648, 0.5767444, 0.1528892, 1, 1, 1, 1, 1,
-0.1154092, -0.1698955, -2.547338, 1, 1, 1, 1, 1,
-0.1134049, -0.1815807, -1.126115, 1, 1, 1, 1, 1,
-0.1061354, 0.7521253, -0.4243877, 1, 1, 1, 1, 1,
-0.0953442, -1.948899, -3.295011, 1, 1, 1, 1, 1,
-0.09440617, 1.704957, 1.32388, 1, 1, 1, 1, 1,
-0.09300256, -1.111215, -4.326958, 1, 1, 1, 1, 1,
-0.08672226, 0.425046, 2.028428, 1, 1, 1, 1, 1,
-0.08656634, 1.450005, -1.108661, 1, 1, 1, 1, 1,
-0.08496176, -1.139302, -2.97627, 1, 1, 1, 1, 1,
-0.08004784, 0.5063504, 0.002897204, 1, 1, 1, 1, 1,
-0.06908167, 1.022719, -0.01853653, 1, 1, 1, 1, 1,
-0.06883238, 1.325821, 0.714254, 0, 0, 1, 1, 1,
-0.06873257, -0.5841644, -2.529606, 1, 0, 0, 1, 1,
-0.06791369, 1.419602, -0.3220402, 1, 0, 0, 1, 1,
-0.06776845, -0.9487529, -2.761077, 1, 0, 0, 1, 1,
-0.06650381, -1.145735, -3.97481, 1, 0, 0, 1, 1,
-0.06437178, -0.167213, -1.931929, 1, 0, 0, 1, 1,
-0.06210583, -0.73821, -1.259212, 0, 0, 0, 1, 1,
-0.05924333, 0.4066087, -0.3238407, 0, 0, 0, 1, 1,
-0.05674144, 1.467655, 1.960922, 0, 0, 0, 1, 1,
-0.05008524, 2.231358, -0.3434635, 0, 0, 0, 1, 1,
-0.04832895, 1.065413, -1.205551, 0, 0, 0, 1, 1,
-0.04404578, -1.35449, -4.026635, 0, 0, 0, 1, 1,
-0.04081221, -0.615436, -5.178514, 0, 0, 0, 1, 1,
-0.03647391, 0.7089791, -0.2968432, 1, 1, 1, 1, 1,
-0.03138012, 0.9834558, 0.9577504, 1, 1, 1, 1, 1,
-0.03093332, -0.8168197, -2.518401, 1, 1, 1, 1, 1,
-0.0238834, -2.051273, -4.510358, 1, 1, 1, 1, 1,
-0.02040999, -0.2082292, -3.505153, 1, 1, 1, 1, 1,
-0.01699919, 1.013685, 0.6177533, 1, 1, 1, 1, 1,
-0.01054318, 0.9962309, -1.317893, 1, 1, 1, 1, 1,
-0.003200377, 0.4976185, -1.604203, 1, 1, 1, 1, 1,
-0.002361164, -0.05782089, -1.481808, 1, 1, 1, 1, 1,
0.00142175, 2.320426, -0.1513719, 1, 1, 1, 1, 1,
0.004666382, 2.2719, 0.0467913, 1, 1, 1, 1, 1,
0.006382518, -1.350543, 4.097572, 1, 1, 1, 1, 1,
0.006629714, 1.0432, 0.7667198, 1, 1, 1, 1, 1,
0.007382749, 1.848705, -0.05904746, 1, 1, 1, 1, 1,
0.008086217, -0.481453, 3.546572, 1, 1, 1, 1, 1,
0.01014774, 1.110479, 1.103194, 0, 0, 1, 1, 1,
0.01078427, 1.006693, -0.8565991, 1, 0, 0, 1, 1,
0.01485826, 0.2077253, 0.3833289, 1, 0, 0, 1, 1,
0.01676381, -0.3762298, 2.540172, 1, 0, 0, 1, 1,
0.02036351, 0.2725662, 2.187035, 1, 0, 0, 1, 1,
0.02560076, 0.3357373, -0.1478028, 1, 0, 0, 1, 1,
0.02621412, 0.8708283, 1.583274, 0, 0, 0, 1, 1,
0.0264379, 0.2829803, -0.1093506, 0, 0, 0, 1, 1,
0.03205183, -1.493949, 4.226618, 0, 0, 0, 1, 1,
0.03772127, -1.129108, 3.579374, 0, 0, 0, 1, 1,
0.04041409, -0.6728235, 3.828786, 0, 0, 0, 1, 1,
0.04578125, 0.3212427, 0.1151743, 0, 0, 0, 1, 1,
0.04667334, 0.1619775, 0.07152959, 0, 0, 0, 1, 1,
0.05013959, 1.98418, -0.1444072, 1, 1, 1, 1, 1,
0.05214528, 0.5698692, 1.063607, 1, 1, 1, 1, 1,
0.05216337, 1.073025, 0.7517752, 1, 1, 1, 1, 1,
0.05244646, 1.299615, -0.2429192, 1, 1, 1, 1, 1,
0.05413881, 0.0196649, 1.140963, 1, 1, 1, 1, 1,
0.05435499, 0.7963097, 0.1638484, 1, 1, 1, 1, 1,
0.05917305, -0.321649, 2.504919, 1, 1, 1, 1, 1,
0.05940417, -0.571017, 2.151266, 1, 1, 1, 1, 1,
0.06197636, 0.7952571, -0.5644115, 1, 1, 1, 1, 1,
0.06241042, 0.3802599, -0.3815923, 1, 1, 1, 1, 1,
0.06756689, 0.2781944, 0.3282771, 1, 1, 1, 1, 1,
0.06790523, -0.3308705, 3.23308, 1, 1, 1, 1, 1,
0.06911436, -1.013902, 2.423132, 1, 1, 1, 1, 1,
0.07030956, 0.9839363, 0.5144149, 1, 1, 1, 1, 1,
0.07591476, -0.4111115, 5.345433, 1, 1, 1, 1, 1,
0.07812457, -0.6599975, 2.874985, 0, 0, 1, 1, 1,
0.07947469, -0.5240463, 3.125285, 1, 0, 0, 1, 1,
0.09013325, -2.024463, 3.578202, 1, 0, 0, 1, 1,
0.09219738, 0.8709409, 2.282192, 1, 0, 0, 1, 1,
0.09641516, -0.4148256, 3.526133, 1, 0, 0, 1, 1,
0.0974213, 1.357114, -0.550606, 1, 0, 0, 1, 1,
0.1013206, -2.618303, 2.222204, 0, 0, 0, 1, 1,
0.106844, -0.33326, 2.516115, 0, 0, 0, 1, 1,
0.1076627, -1.160873, 2.724356, 0, 0, 0, 1, 1,
0.1078917, 0.3301327, -1.113485, 0, 0, 0, 1, 1,
0.1158022, 2.243666, 1.106162, 0, 0, 0, 1, 1,
0.1162468, 1.034624, -0.8836479, 0, 0, 0, 1, 1,
0.1199343, 1.37643, -0.7859343, 0, 0, 0, 1, 1,
0.1265931, 0.07580145, 1.894246, 1, 1, 1, 1, 1,
0.1278665, 1.405861, 0.7475973, 1, 1, 1, 1, 1,
0.1297438, 0.5948203, 0.5259316, 1, 1, 1, 1, 1,
0.1334322, 0.7709203, 0.4579432, 1, 1, 1, 1, 1,
0.1336699, 0.9954292, 0.3613777, 1, 1, 1, 1, 1,
0.138612, 0.2732698, 1.406161, 1, 1, 1, 1, 1,
0.1424945, -1.14622, 2.14884, 1, 1, 1, 1, 1,
0.1471388, 0.4265976, 1.723743, 1, 1, 1, 1, 1,
0.1476993, -2.205463, 2.458172, 1, 1, 1, 1, 1,
0.1512178, 0.3458268, 0.9829047, 1, 1, 1, 1, 1,
0.1539818, -1.067478, 3.20836, 1, 1, 1, 1, 1,
0.1577278, -0.3334598, 2.756905, 1, 1, 1, 1, 1,
0.159643, -0.2427841, 2.270545, 1, 1, 1, 1, 1,
0.1619489, -0.8388027, 1.003245, 1, 1, 1, 1, 1,
0.1629874, 1.73965, -0.4191213, 1, 1, 1, 1, 1,
0.1631554, -0.7280664, 3.562541, 0, 0, 1, 1, 1,
0.1636725, 0.05561366, 1.366835, 1, 0, 0, 1, 1,
0.168262, -0.8993791, 2.399061, 1, 0, 0, 1, 1,
0.1683634, 0.7026784, -0.4592085, 1, 0, 0, 1, 1,
0.1687788, 1.20274, 1.010788, 1, 0, 0, 1, 1,
0.1758033, -1.192352, 2.588355, 1, 0, 0, 1, 1,
0.1785271, 0.1814065, 2.107006, 0, 0, 0, 1, 1,
0.1788841, -1.872484, 3.298664, 0, 0, 0, 1, 1,
0.181338, -0.2816476, 1.800807, 0, 0, 0, 1, 1,
0.1848883, 0.2616617, -0.1368673, 0, 0, 0, 1, 1,
0.1889378, 1.140661, 0.1220092, 0, 0, 0, 1, 1,
0.1947224, 0.7934392, 0.7962314, 0, 0, 0, 1, 1,
0.1996598, 2.804641, 0.7828518, 0, 0, 0, 1, 1,
0.203012, -2.30515, 3.316712, 1, 1, 1, 1, 1,
0.2037459, -0.4145733, 3.231104, 1, 1, 1, 1, 1,
0.2044543, 1.152004, -0.6695962, 1, 1, 1, 1, 1,
0.207511, -0.8780078, 2.461691, 1, 1, 1, 1, 1,
0.2076088, 0.9628267, 0.4017513, 1, 1, 1, 1, 1,
0.2077207, -1.643212, 2.580013, 1, 1, 1, 1, 1,
0.2097285, 0.0403487, 0.6476724, 1, 1, 1, 1, 1,
0.2119437, -0.152682, 0.754436, 1, 1, 1, 1, 1,
0.2158834, -1.20457, 2.970552, 1, 1, 1, 1, 1,
0.2160842, 0.6031309, 0.08514988, 1, 1, 1, 1, 1,
0.2193394, 0.430936, 0.7691762, 1, 1, 1, 1, 1,
0.2201165, 1.312281, 2.025045, 1, 1, 1, 1, 1,
0.2207888, 0.7437817, -0.537622, 1, 1, 1, 1, 1,
0.2226879, -0.963735, 3.54959, 1, 1, 1, 1, 1,
0.2268739, 0.4744108, 0.2073308, 1, 1, 1, 1, 1,
0.2269818, -0.1274005, 1.242167, 0, 0, 1, 1, 1,
0.2275937, 1.47107, 1.192107, 1, 0, 0, 1, 1,
0.2284737, 0.3358581, 2.568047, 1, 0, 0, 1, 1,
0.228867, 0.879764, 1.519812, 1, 0, 0, 1, 1,
0.2296265, 2.178701, 0.0464991, 1, 0, 0, 1, 1,
0.2313132, 0.05963298, 0.2445968, 1, 0, 0, 1, 1,
0.2314348, -0.814351, 2.420156, 0, 0, 0, 1, 1,
0.2321423, 1.103248, 1.077626, 0, 0, 0, 1, 1,
0.2325239, 0.3323845, 0.4060747, 0, 0, 0, 1, 1,
0.2344044, 0.1783915, 0.06183241, 0, 0, 0, 1, 1,
0.2346795, 1.11618, -2.243695, 0, 0, 0, 1, 1,
0.2377875, -1.690174, 3.031903, 0, 0, 0, 1, 1,
0.2432945, -1.372815, 2.282681, 0, 0, 0, 1, 1,
0.2435292, -0.3071399, 1.518572, 1, 1, 1, 1, 1,
0.2503782, -2.456501, 2.655516, 1, 1, 1, 1, 1,
0.2583977, -0.4602599, 4.108168, 1, 1, 1, 1, 1,
0.259765, -1.276261, 2.388713, 1, 1, 1, 1, 1,
0.2621281, -1.079452, 3.959205, 1, 1, 1, 1, 1,
0.2667622, -1.097106, 3.765598, 1, 1, 1, 1, 1,
0.2675896, 0.5139439, -0.03089194, 1, 1, 1, 1, 1,
0.2703114, 0.110134, 0.04599415, 1, 1, 1, 1, 1,
0.2714002, 1.489932, 1.315865, 1, 1, 1, 1, 1,
0.2804506, -0.005766012, 1.048195, 1, 1, 1, 1, 1,
0.2837243, 2.362112, 0.3908089, 1, 1, 1, 1, 1,
0.2840738, 1.157216, 0.5126336, 1, 1, 1, 1, 1,
0.2843457, -0.1651574, 4.134676, 1, 1, 1, 1, 1,
0.2860776, -1.277805, 1.349659, 1, 1, 1, 1, 1,
0.2884252, 1.153941, 0.2179345, 1, 1, 1, 1, 1,
0.2899715, -0.6226349, 3.677028, 0, 0, 1, 1, 1,
0.2908765, -0.1247963, 0.7963883, 1, 0, 0, 1, 1,
0.2961833, -0.008559903, 0.3190348, 1, 0, 0, 1, 1,
0.2986762, -1.155879, 2.19102, 1, 0, 0, 1, 1,
0.3062657, 0.8685189, 0.6892098, 1, 0, 0, 1, 1,
0.3081367, 1.164648, -0.6521657, 1, 0, 0, 1, 1,
0.3091546, -0.08684383, 1.416478, 0, 0, 0, 1, 1,
0.3098136, 0.05834183, 1.097024, 0, 0, 0, 1, 1,
0.3108196, 0.08194058, 1.180082, 0, 0, 0, 1, 1,
0.3123234, -0.3945439, 3.004338, 0, 0, 0, 1, 1,
0.3124364, 1.233188, -1.639785, 0, 0, 0, 1, 1,
0.3130979, 0.49253, -0.6794558, 0, 0, 0, 1, 1,
0.316727, -0.4746684, -0.03632388, 0, 0, 0, 1, 1,
0.3231127, -0.8213133, 1.455386, 1, 1, 1, 1, 1,
0.324038, 0.2098402, 1.637351, 1, 1, 1, 1, 1,
0.3242677, 0.7426651, 0.9533807, 1, 1, 1, 1, 1,
0.3281163, 0.6559895, -0.1494862, 1, 1, 1, 1, 1,
0.328266, 0.9260429, 2.130833, 1, 1, 1, 1, 1,
0.3285818, 0.2189508, 1.667028, 1, 1, 1, 1, 1,
0.3291584, 1.489683, 1.84826, 1, 1, 1, 1, 1,
0.330451, 0.8230941, 1.079637, 1, 1, 1, 1, 1,
0.3314201, 0.7277721, 0.1736215, 1, 1, 1, 1, 1,
0.3319841, -0.6082809, 1.860617, 1, 1, 1, 1, 1,
0.3354134, 1.354295, -1.823807, 1, 1, 1, 1, 1,
0.3367278, 0.2401116, 2.81171, 1, 1, 1, 1, 1,
0.3380817, 0.1631752, 3.295084, 1, 1, 1, 1, 1,
0.3382952, 0.7956892, -0.6782078, 1, 1, 1, 1, 1,
0.3387478, 0.8739268, 1.827408, 1, 1, 1, 1, 1,
0.3423262, 1.24322, -0.5493486, 0, 0, 1, 1, 1,
0.345616, 1.070001, 0.7711707, 1, 0, 0, 1, 1,
0.3503555, 2.208465, 2.342152, 1, 0, 0, 1, 1,
0.3513335, 0.2442186, 0.8090535, 1, 0, 0, 1, 1,
0.3519687, 0.2971821, 2.256785, 1, 0, 0, 1, 1,
0.3552033, 0.2582567, -1.980026, 1, 0, 0, 1, 1,
0.3612207, 0.3972049, 0.4479369, 0, 0, 0, 1, 1,
0.3637743, 0.8672929, -0.4368383, 0, 0, 0, 1, 1,
0.3676403, 1.82377, 1.898972, 0, 0, 0, 1, 1,
0.368164, -0.7838523, 4.389478, 0, 0, 0, 1, 1,
0.3701421, -0.5225818, 2.831569, 0, 0, 0, 1, 1,
0.3706624, 0.6242664, 2.378082, 0, 0, 0, 1, 1,
0.3712733, -0.823616, 1.667663, 0, 0, 0, 1, 1,
0.3730281, 0.2140318, 0.1717012, 1, 1, 1, 1, 1,
0.3770075, 0.1726595, 1.397106, 1, 1, 1, 1, 1,
0.3788121, 0.08258697, 0.3262596, 1, 1, 1, 1, 1,
0.3791333, 0.6771898, 1.174989, 1, 1, 1, 1, 1,
0.3821698, -0.03956263, 0.6480983, 1, 1, 1, 1, 1,
0.3851016, -0.138351, 2.216216, 1, 1, 1, 1, 1,
0.3935282, -0.1033581, 2.197952, 1, 1, 1, 1, 1,
0.3949175, 1.707545, -0.363674, 1, 1, 1, 1, 1,
0.3968646, -0.398526, 2.205662, 1, 1, 1, 1, 1,
0.4010091, 1.421213, -0.4856801, 1, 1, 1, 1, 1,
0.4056537, -0.6277606, 2.210297, 1, 1, 1, 1, 1,
0.4056998, 1.040644, 0.4153835, 1, 1, 1, 1, 1,
0.4110194, -1.282774, 1.541353, 1, 1, 1, 1, 1,
0.411067, 0.364666, 0.6591637, 1, 1, 1, 1, 1,
0.4127007, 1.844492, 0.2613247, 1, 1, 1, 1, 1,
0.4156348, -0.8375425, 3.249872, 0, 0, 1, 1, 1,
0.4167097, -0.859695, 1.976692, 1, 0, 0, 1, 1,
0.4202269, -1.756494, 1.355835, 1, 0, 0, 1, 1,
0.42117, 0.3642282, -0.2092564, 1, 0, 0, 1, 1,
0.421332, -2.155744, 3.709495, 1, 0, 0, 1, 1,
0.4219872, -1.979944, 2.364315, 1, 0, 0, 1, 1,
0.4240567, 1.134623, -1.146736, 0, 0, 0, 1, 1,
0.4263321, -1.271352, 1.725985, 0, 0, 0, 1, 1,
0.42788, 1.602726, 0.8962358, 0, 0, 0, 1, 1,
0.4279328, -1.129808, 2.772933, 0, 0, 0, 1, 1,
0.4286025, -0.1807378, 1.033438, 0, 0, 0, 1, 1,
0.4297722, -1.556964, 1.68264, 0, 0, 0, 1, 1,
0.4355351, -0.8162464, 1.792333, 0, 0, 0, 1, 1,
0.445965, -0.6717719, 1.179839, 1, 1, 1, 1, 1,
0.4478235, -0.1774386, 2.73554, 1, 1, 1, 1, 1,
0.4497065, -0.7300026, 3.47564, 1, 1, 1, 1, 1,
0.4539273, 0.4448623, -0.1211343, 1, 1, 1, 1, 1,
0.4572375, -1.963779, 1.938434, 1, 1, 1, 1, 1,
0.4588877, 1.475839, -0.8171945, 1, 1, 1, 1, 1,
0.4661389, -1.810086, 4.004185, 1, 1, 1, 1, 1,
0.4694356, -0.392857, 2.008379, 1, 1, 1, 1, 1,
0.4714276, -1.157978, 2.783879, 1, 1, 1, 1, 1,
0.4783976, 0.2800779, 2.118366, 1, 1, 1, 1, 1,
0.4787079, 0.6528816, -1.194194, 1, 1, 1, 1, 1,
0.4897128, 0.3351995, 0.2453271, 1, 1, 1, 1, 1,
0.4897422, -0.08094651, 3.594229, 1, 1, 1, 1, 1,
0.4929582, -0.8525943, 1.963933, 1, 1, 1, 1, 1,
0.4962869, -1.114961, 1.424407, 1, 1, 1, 1, 1,
0.502534, -1.367499, 2.602861, 0, 0, 1, 1, 1,
0.512704, -0.1348898, 2.378323, 1, 0, 0, 1, 1,
0.5127193, -0.2796536, 1.637344, 1, 0, 0, 1, 1,
0.5163111, 0.8134361, 0.2600601, 1, 0, 0, 1, 1,
0.5205446, 1.204859, 1.344662, 1, 0, 0, 1, 1,
0.5253547, 0.2658718, 1.405995, 1, 0, 0, 1, 1,
0.5364228, 1.373504, 1.414455, 0, 0, 0, 1, 1,
0.5364411, 0.6406518, 0.4202133, 0, 0, 0, 1, 1,
0.5411469, 0.4716446, 0.9267737, 0, 0, 0, 1, 1,
0.5426807, 0.4933313, 2.4683, 0, 0, 0, 1, 1,
0.546928, -0.2166645, 1.16366, 0, 0, 0, 1, 1,
0.5494297, -1.500925, 2.946958, 0, 0, 0, 1, 1,
0.5511611, -0.8343533, 2.316757, 0, 0, 0, 1, 1,
0.5575373, 0.706653, 2.159812, 1, 1, 1, 1, 1,
0.5607002, 0.7218679, 1.55886, 1, 1, 1, 1, 1,
0.5617571, -0.2016843, 1.153374, 1, 1, 1, 1, 1,
0.5640396, -0.2892122, 0.454068, 1, 1, 1, 1, 1,
0.5665454, 0.04451413, 1.692279, 1, 1, 1, 1, 1,
0.5671438, 0.8511925, 1.097802, 1, 1, 1, 1, 1,
0.573097, -1.696154, 2.83504, 1, 1, 1, 1, 1,
0.5737364, 0.3023989, 0.6243528, 1, 1, 1, 1, 1,
0.5777858, -0.4034105, 3.936417, 1, 1, 1, 1, 1,
0.5780184, -0.1288283, 2.18447, 1, 1, 1, 1, 1,
0.5799308, 0.401297, 2.557928, 1, 1, 1, 1, 1,
0.5843062, 0.06186252, 2.7691, 1, 1, 1, 1, 1,
0.5848214, 1.270628, 1.334312, 1, 1, 1, 1, 1,
0.5879116, -2.016985, 2.972718, 1, 1, 1, 1, 1,
0.5883165, 0.6627244, 0.9482952, 1, 1, 1, 1, 1,
0.5946159, -0.9615383, 4.514761, 0, 0, 1, 1, 1,
0.5974756, 0.7633886, 1.097095, 1, 0, 0, 1, 1,
0.6033707, 0.3056758, 0.8342804, 1, 0, 0, 1, 1,
0.6042652, 1.692028, -1.088352, 1, 0, 0, 1, 1,
0.6054434, 0.1345568, 2.337953, 1, 0, 0, 1, 1,
0.6062933, 0.1734503, 2.018157, 1, 0, 0, 1, 1,
0.6099259, -0.1879997, 2.078874, 0, 0, 0, 1, 1,
0.6119143, -1.15909, 2.675337, 0, 0, 0, 1, 1,
0.6121384, -0.9250935, 0.1839328, 0, 0, 0, 1, 1,
0.6214826, 0.9314108, 0.2157744, 0, 0, 0, 1, 1,
0.6344107, -0.9168849, 1.094179, 0, 0, 0, 1, 1,
0.6349033, 0.6782639, 0.515451, 0, 0, 0, 1, 1,
0.6359652, 0.7238048, 0.3555909, 0, 0, 0, 1, 1,
0.6384172, 0.9760138, 1.61522, 1, 1, 1, 1, 1,
0.6466927, 1.198027, 1.630512, 1, 1, 1, 1, 1,
0.6545187, 1.149709, -0.6273161, 1, 1, 1, 1, 1,
0.6617088, 0.005859392, 2.329323, 1, 1, 1, 1, 1,
0.6627713, 0.572968, 1.834481, 1, 1, 1, 1, 1,
0.6637485, -0.1976611, 3.976859, 1, 1, 1, 1, 1,
0.6647472, -0.9264638, 2.613208, 1, 1, 1, 1, 1,
0.6660633, 0.6957325, 1.107213, 1, 1, 1, 1, 1,
0.6671734, -0.7839009, 2.895069, 1, 1, 1, 1, 1,
0.6682743, 0.2244008, 1.797874, 1, 1, 1, 1, 1,
0.6713169, 0.3875414, 2.785734, 1, 1, 1, 1, 1,
0.6751856, -1.421136, 3.549248, 1, 1, 1, 1, 1,
0.6758562, 0.3037426, 1.360357, 1, 1, 1, 1, 1,
0.6805722, -0.01488844, 2.518354, 1, 1, 1, 1, 1,
0.6809376, 1.985716, 0.918815, 1, 1, 1, 1, 1,
0.6817411, 0.297956, -0.5493305, 0, 0, 1, 1, 1,
0.6822238, -1.459862, 3.298783, 1, 0, 0, 1, 1,
0.684135, -0.09441311, -0.6415547, 1, 0, 0, 1, 1,
0.68573, 0.1601622, 2.400074, 1, 0, 0, 1, 1,
0.6859481, 0.9530902, 1.388841, 1, 0, 0, 1, 1,
0.6876306, 0.756708, 0.5905952, 1, 0, 0, 1, 1,
0.6895628, -0.4234344, -0.5757301, 0, 0, 0, 1, 1,
0.6925331, -0.2423191, 3.200751, 0, 0, 0, 1, 1,
0.7017588, -0.1125625, 1.023062, 0, 0, 0, 1, 1,
0.7038466, -0.233533, 0.8621365, 0, 0, 0, 1, 1,
0.7041635, -0.2444324, 2.5036, 0, 0, 0, 1, 1,
0.7092406, -0.02175876, 1.959051, 0, 0, 0, 1, 1,
0.7097716, 1.638241, 0.7525566, 0, 0, 0, 1, 1,
0.7098744, 1.291893, 1.556875, 1, 1, 1, 1, 1,
0.7160231, -0.1414893, 2.2777, 1, 1, 1, 1, 1,
0.7172936, -0.1577425, 2.361433, 1, 1, 1, 1, 1,
0.7223182, 1.648819, 0.7861899, 1, 1, 1, 1, 1,
0.7234636, 0.7063488, 2.88781, 1, 1, 1, 1, 1,
0.7276028, -0.4208315, 3.112199, 1, 1, 1, 1, 1,
0.7322266, 1.825817, -0.09841266, 1, 1, 1, 1, 1,
0.7329496, -0.249309, 1.453338, 1, 1, 1, 1, 1,
0.7353761, -0.3490657, 0.4121053, 1, 1, 1, 1, 1,
0.7413041, -0.9717266, 2.437615, 1, 1, 1, 1, 1,
0.742905, -1.047775, 3.879486, 1, 1, 1, 1, 1,
0.7429392, 0.285487, 1.484659, 1, 1, 1, 1, 1,
0.7466788, -1.019142, 2.367582, 1, 1, 1, 1, 1,
0.746845, -0.1857128, 3.211054, 1, 1, 1, 1, 1,
0.7470579, -1.07851, -0.3591713, 1, 1, 1, 1, 1,
0.7531152, -0.1175549, 1.817721, 0, 0, 1, 1, 1,
0.7602583, 1.679419, 2.065304, 1, 0, 0, 1, 1,
0.7633418, 1.277233, 0.4122746, 1, 0, 0, 1, 1,
0.765741, -1.452515, 3.708067, 1, 0, 0, 1, 1,
0.7674519, -0.2629614, 2.684158, 1, 0, 0, 1, 1,
0.7691082, -0.7505205, 2.063222, 1, 0, 0, 1, 1,
0.7728468, -0.3761802, 3.847478, 0, 0, 0, 1, 1,
0.7767892, -1.265336, 0.7247172, 0, 0, 0, 1, 1,
0.7826712, 0.8245347, 2.010817, 0, 0, 0, 1, 1,
0.7835751, 0.1203454, -1.039186, 0, 0, 0, 1, 1,
0.7943051, -1.329189, 1.873006, 0, 0, 0, 1, 1,
0.7998083, -1.161571, 2.744278, 0, 0, 0, 1, 1,
0.8011268, -2.27924, 4.286707, 0, 0, 0, 1, 1,
0.8063837, -0.7492804, 2.887606, 1, 1, 1, 1, 1,
0.808661, 0.6753247, 2.362587, 1, 1, 1, 1, 1,
0.810673, 0.8330737, -0.8760942, 1, 1, 1, 1, 1,
0.8154112, 0.4889465, -1.36475, 1, 1, 1, 1, 1,
0.8169591, 0.8579004, 1.129912, 1, 1, 1, 1, 1,
0.8299622, -0.321537, 2.385189, 1, 1, 1, 1, 1,
0.8353952, 1.371812, 0.6178426, 1, 1, 1, 1, 1,
0.8371786, -0.6051922, 2.090681, 1, 1, 1, 1, 1,
0.8401739, -0.4116718, 1.123112, 1, 1, 1, 1, 1,
0.8445693, 0.2968783, 1.858772, 1, 1, 1, 1, 1,
0.8445914, -2.220504, 3.001428, 1, 1, 1, 1, 1,
0.8566845, 1.284866, 0.141341, 1, 1, 1, 1, 1,
0.8681702, 1.11962, 2.1838, 1, 1, 1, 1, 1,
0.8700866, -0.8475069, 2.056645, 1, 1, 1, 1, 1,
0.8709977, -0.1752788, 0.6333193, 1, 1, 1, 1, 1,
0.8745248, 0.7885213, 1.60408, 0, 0, 1, 1, 1,
0.8755443, -0.5050117, 2.11855, 1, 0, 0, 1, 1,
0.8761964, -0.1978227, 0.1898446, 1, 0, 0, 1, 1,
0.8783014, -0.09854796, 4.460663, 1, 0, 0, 1, 1,
0.8786553, -1.22094, 2.532086, 1, 0, 0, 1, 1,
0.8839038, 1.240425, 1.800307, 1, 0, 0, 1, 1,
0.884326, 0.6763168, 0.934355, 0, 0, 0, 1, 1,
0.8863761, 0.3656901, 1.311673, 0, 0, 0, 1, 1,
0.8867516, -1.750242, 1.566981, 0, 0, 0, 1, 1,
0.8985093, 0.04683291, 1.092652, 0, 0, 0, 1, 1,
0.8992473, 0.4486339, 0.4903229, 0, 0, 0, 1, 1,
0.9070545, -0.427667, 3.312431, 0, 0, 0, 1, 1,
0.9082333, -1.332641, 3.13702, 0, 0, 0, 1, 1,
0.9097282, 1.527065, -0.2456374, 1, 1, 1, 1, 1,
0.9122143, -0.8233547, 3.096943, 1, 1, 1, 1, 1,
0.9193592, 0.6396264, 2.050615, 1, 1, 1, 1, 1,
0.923342, -0.7563922, 0.02489365, 1, 1, 1, 1, 1,
0.9245604, -2.766327, 1.967809, 1, 1, 1, 1, 1,
0.9310497, 1.508472, 0.3213415, 1, 1, 1, 1, 1,
0.9335468, 0.2884556, 0.2627629, 1, 1, 1, 1, 1,
0.9369053, -0.5293443, 1.211336, 1, 1, 1, 1, 1,
0.9447729, -0.8648009, 2.365823, 1, 1, 1, 1, 1,
0.9453548, 1.267526, 2.783828, 1, 1, 1, 1, 1,
0.9474127, -1.388892, 2.195395, 1, 1, 1, 1, 1,
0.9476288, 0.5115206, 0.07872638, 1, 1, 1, 1, 1,
0.9498718, 1.218872, -0.589168, 1, 1, 1, 1, 1,
0.9515787, -1.920438, 4.453369, 1, 1, 1, 1, 1,
0.9519811, -0.6239268, 1.78369, 1, 1, 1, 1, 1,
0.9548681, 0.7267731, 2.266535, 0, 0, 1, 1, 1,
0.957029, -0.5061669, -0.03391276, 1, 0, 0, 1, 1,
0.9708493, 0.8955574, 2.379371, 1, 0, 0, 1, 1,
0.9713447, 1.309759, 0.06919773, 1, 0, 0, 1, 1,
0.9734604, 1.001859, 0.3550554, 1, 0, 0, 1, 1,
0.9790962, -0.3035567, 2.457191, 1, 0, 0, 1, 1,
0.9792482, -0.2250169, 2.407387, 0, 0, 0, 1, 1,
0.9807413, -0.5872588, 1.710858, 0, 0, 0, 1, 1,
0.9830245, -2.270992, 1.283738, 0, 0, 0, 1, 1,
0.9858796, 0.8406983, 1.651373, 0, 0, 0, 1, 1,
0.9884319, -0.986852, 2.682016, 0, 0, 0, 1, 1,
0.9987417, -1.702752, 4.187383, 0, 0, 0, 1, 1,
1.001782, 0.3602911, 1.550657, 0, 0, 0, 1, 1,
1.002529, -0.934391, 2.637586, 1, 1, 1, 1, 1,
1.00593, -0.5830709, 0.5024207, 1, 1, 1, 1, 1,
1.010074, -0.838398, 3.782214, 1, 1, 1, 1, 1,
1.010865, -0.7184951, 1.544669, 1, 1, 1, 1, 1,
1.014649, -0.4207188, 2.667244, 1, 1, 1, 1, 1,
1.014725, -0.6396499, 2.609512, 1, 1, 1, 1, 1,
1.020424, 1.326151, -0.5866157, 1, 1, 1, 1, 1,
1.023122, -0.4672202, 1.428221, 1, 1, 1, 1, 1,
1.026594, -0.8268063, 2.137398, 1, 1, 1, 1, 1,
1.033093, -0.2810846, 3.109207, 1, 1, 1, 1, 1,
1.035206, -1.590815, 1.465966, 1, 1, 1, 1, 1,
1.037017, 1.00986, 3.047791, 1, 1, 1, 1, 1,
1.0375, -0.6152657, 2.83643, 1, 1, 1, 1, 1,
1.03955, 2.485355, 0.9212912, 1, 1, 1, 1, 1,
1.043877, -0.7218547, 1.24398, 1, 1, 1, 1, 1,
1.044665, -0.3402395, 2.108517, 0, 0, 1, 1, 1,
1.04561, -0.003672156, 1.575376, 1, 0, 0, 1, 1,
1.046912, -0.6954077, 2.340789, 1, 0, 0, 1, 1,
1.058192, 2.704673, 1.681759, 1, 0, 0, 1, 1,
1.058707, -0.1023781, -1.101057, 1, 0, 0, 1, 1,
1.065441, 0.1954139, 0.9325638, 1, 0, 0, 1, 1,
1.066023, 0.3237739, -0.2448491, 0, 0, 0, 1, 1,
1.066601, 0.6373161, 1.969639, 0, 0, 0, 1, 1,
1.069376, -1.374755, 3.612512, 0, 0, 0, 1, 1,
1.072498, -1.090389, 0.535322, 0, 0, 0, 1, 1,
1.077347, -1.07403, 3.757016, 0, 0, 0, 1, 1,
1.079185, -0.4546466, 2.405043, 0, 0, 0, 1, 1,
1.085751, -0.8792655, 2.311106, 0, 0, 0, 1, 1,
1.088813, -0.3402944, 1.584666, 1, 1, 1, 1, 1,
1.103739, -0.6942217, 3.650486, 1, 1, 1, 1, 1,
1.116858, 1.467701, 1.89734, 1, 1, 1, 1, 1,
1.118557, 0.4398352, -0.4058152, 1, 1, 1, 1, 1,
1.124661, 0.8439918, 0.97904, 1, 1, 1, 1, 1,
1.137496, 0.05351634, 3.047982, 1, 1, 1, 1, 1,
1.144527, 0.229928, 3.822185, 1, 1, 1, 1, 1,
1.157795, -1.249157, 2.969483, 1, 1, 1, 1, 1,
1.162089, 1.421599, 1.02881, 1, 1, 1, 1, 1,
1.16797, 1.378076, -0.2007358, 1, 1, 1, 1, 1,
1.168858, -0.01474254, 1.092145, 1, 1, 1, 1, 1,
1.172882, 1.01965, 0.8974037, 1, 1, 1, 1, 1,
1.184207, 0.3678467, 2.1896, 1, 1, 1, 1, 1,
1.187594, 1.020866, 0.3900053, 1, 1, 1, 1, 1,
1.189071, 0.8698111, 0.2432303, 1, 1, 1, 1, 1,
1.201669, -0.07050221, 2.116138, 0, 0, 1, 1, 1,
1.202744, -1.167473, 2.747478, 1, 0, 0, 1, 1,
1.206876, -0.6888171, 3.116168, 1, 0, 0, 1, 1,
1.206986, 1.120329, 0.204032, 1, 0, 0, 1, 1,
1.214988, 0.3368242, 0.5449291, 1, 0, 0, 1, 1,
1.215408, -0.03459556, 1.849254, 1, 0, 0, 1, 1,
1.215777, -0.9270402, 1.775226, 0, 0, 0, 1, 1,
1.217457, -0.1043603, 0.6118512, 0, 0, 0, 1, 1,
1.221755, 1.422607, 2.389845, 0, 0, 0, 1, 1,
1.227541, -0.3322953, 2.010268, 0, 0, 0, 1, 1,
1.232371, -0.1569332, 1.862117, 0, 0, 0, 1, 1,
1.241432, 0.685237, 1.220492, 0, 0, 0, 1, 1,
1.242089, -0.6722181, 3.071479, 0, 0, 0, 1, 1,
1.243407, 0.1851702, 2.10717, 1, 1, 1, 1, 1,
1.245315, 0.02707651, 1.157672, 1, 1, 1, 1, 1,
1.253625, 0.06553558, 0.4502863, 1, 1, 1, 1, 1,
1.25977, 1.478394, 0.4886798, 1, 1, 1, 1, 1,
1.266482, -0.1392989, 1.273869, 1, 1, 1, 1, 1,
1.273413, 1.838665, -0.3905414, 1, 1, 1, 1, 1,
1.282993, 1.143186, 0.2856813, 1, 1, 1, 1, 1,
1.286014, 0.5464522, -0.9669234, 1, 1, 1, 1, 1,
1.286691, 0.06343779, 0.05112005, 1, 1, 1, 1, 1,
1.293264, 0.6399662, 0.7578182, 1, 1, 1, 1, 1,
1.29391, -0.4877073, 1.762354, 1, 1, 1, 1, 1,
1.294621, 1.091285, 2.130703, 1, 1, 1, 1, 1,
1.299269, 1.006337, 2.51446, 1, 1, 1, 1, 1,
1.302784, 0.8097078, 1.848632, 1, 1, 1, 1, 1,
1.306147, 0.5904182, 2.209531, 1, 1, 1, 1, 1,
1.311682, -0.8454928, 0.9094938, 0, 0, 1, 1, 1,
1.318878, 0.008579887, 1.98383, 1, 0, 0, 1, 1,
1.322732, 0.9354374, 1.782081, 1, 0, 0, 1, 1,
1.338368, 0.03780889, 2.267009, 1, 0, 0, 1, 1,
1.340738, -0.08680993, 4.440516, 1, 0, 0, 1, 1,
1.348006, 0.1892376, 0.8889121, 1, 0, 0, 1, 1,
1.348523, -1.063669, 1.846832, 0, 0, 0, 1, 1,
1.350536, 0.1132805, 1.846758, 0, 0, 0, 1, 1,
1.351262, -2.100993, 1.580924, 0, 0, 0, 1, 1,
1.352618, 1.154698, 0.9932406, 0, 0, 0, 1, 1,
1.353633, -1.060095, 1.21766, 0, 0, 0, 1, 1,
1.355029, -0.3105738, 1.076659, 0, 0, 0, 1, 1,
1.357819, -0.1972575, 2.825971, 0, 0, 0, 1, 1,
1.363103, 0.05822866, 2.781567, 1, 1, 1, 1, 1,
1.380072, -0.8621694, 1.061059, 1, 1, 1, 1, 1,
1.381541, 0.5146646, 1.611866, 1, 1, 1, 1, 1,
1.397708, -0.4473784, 1.524964, 1, 1, 1, 1, 1,
1.400552, -0.4957799, 2.776103, 1, 1, 1, 1, 1,
1.41171, -1.092965, 1.306409, 1, 1, 1, 1, 1,
1.418144, 1.72923, 0.5756053, 1, 1, 1, 1, 1,
1.422436, -0.009467671, -0.6796743, 1, 1, 1, 1, 1,
1.425045, -0.7631381, 3.543502, 1, 1, 1, 1, 1,
1.427847, 0.6902199, 0.2979009, 1, 1, 1, 1, 1,
1.438542, -0.5603592, 1.634152, 1, 1, 1, 1, 1,
1.443015, 1.177581, 0.5257934, 1, 1, 1, 1, 1,
1.44339, -1.243366, 2.724244, 1, 1, 1, 1, 1,
1.446275, 1.531222, 0.6171574, 1, 1, 1, 1, 1,
1.456338, -0.3652426, -0.6560209, 1, 1, 1, 1, 1,
1.463062, -0.348473, 1.253871, 0, 0, 1, 1, 1,
1.466012, 0.5179207, 2.191816, 1, 0, 0, 1, 1,
1.469553, -0.6882308, 4.028171, 1, 0, 0, 1, 1,
1.481275, -1.784518, 1.559447, 1, 0, 0, 1, 1,
1.487331, 1.855717, -0.4586037, 1, 0, 0, 1, 1,
1.494332, 1.151736, 1.045866, 1, 0, 0, 1, 1,
1.503142, -1.066247, 0.8961439, 0, 0, 0, 1, 1,
1.511303, -1.125459, 4.179258, 0, 0, 0, 1, 1,
1.517837, -0.4098347, 1.057953, 0, 0, 0, 1, 1,
1.522804, -0.535597, 1.879304, 0, 0, 0, 1, 1,
1.529129, -0.5106553, 0.8216813, 0, 0, 0, 1, 1,
1.534007, 1.01016, 2.26188, 0, 0, 0, 1, 1,
1.534702, -0.8001169, 2.607732, 0, 0, 0, 1, 1,
1.555968, 1.082408, 0.739673, 1, 1, 1, 1, 1,
1.569694, -2.477433, 3.011961, 1, 1, 1, 1, 1,
1.573797, -1.420056, 1.156159, 1, 1, 1, 1, 1,
1.594015, -0.4719705, 2.649141, 1, 1, 1, 1, 1,
1.602247, -1.312051, 1.91907, 1, 1, 1, 1, 1,
1.609722, -0.4632853, 2.640034, 1, 1, 1, 1, 1,
1.616381, -0.576939, 0.3854329, 1, 1, 1, 1, 1,
1.631744, 0.006953142, 2.097651, 1, 1, 1, 1, 1,
1.642412, 0.7280878, 1.238007, 1, 1, 1, 1, 1,
1.654473, 0.05831376, 1.681785, 1, 1, 1, 1, 1,
1.664237, -1.455055, 2.869481, 1, 1, 1, 1, 1,
1.679386, 0.3266847, 1.118696, 1, 1, 1, 1, 1,
1.687069, -0.5783841, 3.492372, 1, 1, 1, 1, 1,
1.688244, 0.7755461, 0.7673391, 1, 1, 1, 1, 1,
1.713934, -0.2163637, 1.107177, 1, 1, 1, 1, 1,
1.71709, -2.343762, 2.528797, 0, 0, 1, 1, 1,
1.725843, -0.9729012, 2.568435, 1, 0, 0, 1, 1,
1.732224, -0.05564947, -0.2643303, 1, 0, 0, 1, 1,
1.741846, 0.998908, 1.728702, 1, 0, 0, 1, 1,
1.753706, -0.8085063, 0.4250599, 1, 0, 0, 1, 1,
1.769557, -1.560793, 2.170843, 1, 0, 0, 1, 1,
1.771062, 0.1750845, 1.699739, 0, 0, 0, 1, 1,
1.778802, -1.228327, 1.067582, 0, 0, 0, 1, 1,
1.78554, 0.9550361, -0.04390256, 0, 0, 0, 1, 1,
1.804954, 1.138561, 1.949488, 0, 0, 0, 1, 1,
1.813433, 0.8364367, -0.3240097, 0, 0, 0, 1, 1,
1.81683, -0.09008373, 0.4135183, 0, 0, 0, 1, 1,
1.826715, -1.132334, 2.169381, 0, 0, 0, 1, 1,
1.829602, 0.008354286, 1.022754, 1, 1, 1, 1, 1,
1.835073, 0.4053403, 2.181121, 1, 1, 1, 1, 1,
1.835092, 0.7843199, 1.684689, 1, 1, 1, 1, 1,
1.84627, -1.631852, 3.088192, 1, 1, 1, 1, 1,
1.85596, 0.9272406, 0.1878741, 1, 1, 1, 1, 1,
1.885664, 1.651043, 0.5515342, 1, 1, 1, 1, 1,
1.900719, -0.4510115, 1.436332, 1, 1, 1, 1, 1,
1.922783, 0.8188948, 1.921241, 1, 1, 1, 1, 1,
1.930206, 0.02508265, 0.426703, 1, 1, 1, 1, 1,
1.931796, 0.7961307, 1.574307, 1, 1, 1, 1, 1,
1.964005, -2.443432, 4.835885, 1, 1, 1, 1, 1,
1.978514, 0.7431626, 1.268778, 1, 1, 1, 1, 1,
1.996079, -1.411962, 0.1914888, 1, 1, 1, 1, 1,
2.024631, -0.8648878, 1.851733, 1, 1, 1, 1, 1,
2.025469, 1.735132, 0.7855652, 1, 1, 1, 1, 1,
2.040757, -1.372499, 2.553809, 0, 0, 1, 1, 1,
2.068648, -0.3688779, 1.216387, 1, 0, 0, 1, 1,
2.071462, -1.250976, 1.369063, 1, 0, 0, 1, 1,
2.080358, 0.4191121, 2.409721, 1, 0, 0, 1, 1,
2.112934, -0.354033, 1.566894, 1, 0, 0, 1, 1,
2.114916, 2.942482, 0.808472, 1, 0, 0, 1, 1,
2.128964, -1.034023, 0.1181711, 0, 0, 0, 1, 1,
2.137382, 0.1674095, 1.464639, 0, 0, 0, 1, 1,
2.138602, 1.342713, -0.3025502, 0, 0, 0, 1, 1,
2.138616, 0.05331042, 3.114957, 0, 0, 0, 1, 1,
2.290239, 2.223762, -0.929692, 0, 0, 0, 1, 1,
2.332595, 0.7731749, 1.574868, 0, 0, 0, 1, 1,
2.333367, -0.7904122, 0.5709004, 0, 0, 0, 1, 1,
2.352863, -0.781374, 1.902521, 1, 1, 1, 1, 1,
2.368751, -0.9031612, 2.812596, 1, 1, 1, 1, 1,
2.379655, -1.288504, 2.407113, 1, 1, 1, 1, 1,
2.421766, -2.954252, 1.740918, 1, 1, 1, 1, 1,
2.486187, 0.7526116, 0.5038927, 1, 1, 1, 1, 1,
2.558491, 0.1531415, 2.815706, 1, 1, 1, 1, 1,
2.789335, 0.00872662, 0.9058986, 1, 1, 1, 1, 1
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
var radius = 9.340279;
var distance = 32.80733;
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
mvMatrix.translate( 0.26679, 0.111575, -0.08345962 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.80733);
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
