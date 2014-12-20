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
-3.471615, 0.265951, -0.8487522, 1, 0, 0, 1,
-3.039494, 0.8703692, -1.9206, 1, 0.007843138, 0, 1,
-2.645579, 0.1807196, -3.084812, 1, 0.01176471, 0, 1,
-2.541932, 0.9435446, -3.419957, 1, 0.01960784, 0, 1,
-2.507209, -0.4078254, -1.327697, 1, 0.02352941, 0, 1,
-2.460338, -0.1117767, -1.794431, 1, 0.03137255, 0, 1,
-2.452925, -0.3084605, -2.315445, 1, 0.03529412, 0, 1,
-2.366461, -2.758212, -2.30835, 1, 0.04313726, 0, 1,
-2.224901, 1.21032, -1.141309, 1, 0.04705882, 0, 1,
-2.206547, -0.3285953, -3.365852, 1, 0.05490196, 0, 1,
-2.1481, 3.240138, -1.535784, 1, 0.05882353, 0, 1,
-2.138224, -0.1836613, 0.7135454, 1, 0.06666667, 0, 1,
-2.099628, -0.3512167, -2.247295, 1, 0.07058824, 0, 1,
-2.057214, 0.473136, -1.00714, 1, 0.07843138, 0, 1,
-2.003762, -0.5416366, -0.7864089, 1, 0.08235294, 0, 1,
-1.950314, -1.200648, -4.039338, 1, 0.09019608, 0, 1,
-1.93281, 0.6100412, 0.08777592, 1, 0.09411765, 0, 1,
-1.932142, 0.6402824, -3.215131, 1, 0.1019608, 0, 1,
-1.910207, -0.04964297, -1.140995, 1, 0.1098039, 0, 1,
-1.88555, 0.08965392, -0.2890934, 1, 0.1137255, 0, 1,
-1.866842, 1.748766, -1.564282, 1, 0.1215686, 0, 1,
-1.859191, -0.2791539, -2.128334, 1, 0.1254902, 0, 1,
-1.855712, -0.1560389, -0.6844108, 1, 0.1333333, 0, 1,
-1.851204, -2.198995, -1.474063, 1, 0.1372549, 0, 1,
-1.846283, 0.1114061, -1.269321, 1, 0.145098, 0, 1,
-1.845278, 1.589779, -3.01377, 1, 0.1490196, 0, 1,
-1.835041, 1.062564, -0.854646, 1, 0.1568628, 0, 1,
-1.806745, -0.6992511, -2.107025, 1, 0.1607843, 0, 1,
-1.790981, -0.4498885, -0.8493242, 1, 0.1686275, 0, 1,
-1.775367, 1.205375, -0.7971385, 1, 0.172549, 0, 1,
-1.768873, -1.780919, -2.393762, 1, 0.1803922, 0, 1,
-1.765787, 0.2259299, -3.757736, 1, 0.1843137, 0, 1,
-1.750166, -0.7943189, -2.491048, 1, 0.1921569, 0, 1,
-1.748993, 0.5078952, -2.31234, 1, 0.1960784, 0, 1,
-1.734575, -1.407694, -2.118197, 1, 0.2039216, 0, 1,
-1.733336, -0.8714627, -2.805113, 1, 0.2117647, 0, 1,
-1.721364, -1.682636, -3.315279, 1, 0.2156863, 0, 1,
-1.699282, -0.240722, 0.3243049, 1, 0.2235294, 0, 1,
-1.697196, -0.3433021, -2.173793, 1, 0.227451, 0, 1,
-1.695149, 0.1535557, -0.6148686, 1, 0.2352941, 0, 1,
-1.679063, -0.6743684, -1.549122, 1, 0.2392157, 0, 1,
-1.660149, -0.008035368, -2.061893, 1, 0.2470588, 0, 1,
-1.659056, 0.0915652, -1.281331, 1, 0.2509804, 0, 1,
-1.651496, -1.210923, -1.964553, 1, 0.2588235, 0, 1,
-1.644307, 0.4111874, -1.036932, 1, 0.2627451, 0, 1,
-1.640471, -0.7991462, -3.294691, 1, 0.2705882, 0, 1,
-1.620631, 0.4364267, -1.899922, 1, 0.2745098, 0, 1,
-1.609336, 0.4611145, -0.8073277, 1, 0.282353, 0, 1,
-1.609192, 1.360017, 0.6452574, 1, 0.2862745, 0, 1,
-1.608546, 0.04150838, -1.399031, 1, 0.2941177, 0, 1,
-1.607375, -0.0598564, -2.056375, 1, 0.3019608, 0, 1,
-1.60224, 1.679363, 0.2299769, 1, 0.3058824, 0, 1,
-1.600421, -0.9554262, -1.531837, 1, 0.3137255, 0, 1,
-1.574013, 2.331067, 1.317511, 1, 0.3176471, 0, 1,
-1.56521, -0.8664326, -1.538738, 1, 0.3254902, 0, 1,
-1.551565, 1.275449, -1.911453, 1, 0.3294118, 0, 1,
-1.548646, -1.278381, -3.941862, 1, 0.3372549, 0, 1,
-1.548224, 1.687801, 1.03111, 1, 0.3411765, 0, 1,
-1.53338, 0.4966944, -1.640378, 1, 0.3490196, 0, 1,
-1.525728, 0.6276006, -2.420432, 1, 0.3529412, 0, 1,
-1.519047, -0.2608449, -1.267172, 1, 0.3607843, 0, 1,
-1.50421, -0.1110838, -1.044592, 1, 0.3647059, 0, 1,
-1.503289, -1.081897, -2.125302, 1, 0.372549, 0, 1,
-1.48712, -0.4167882, -3.272078, 1, 0.3764706, 0, 1,
-1.481491, 1.076549, -0.451143, 1, 0.3843137, 0, 1,
-1.475743, -0.197221, -0.6211196, 1, 0.3882353, 0, 1,
-1.46662, -1.197742, -2.253071, 1, 0.3960784, 0, 1,
-1.447036, -1.182055, -2.098376, 1, 0.4039216, 0, 1,
-1.442963, 0.2797852, -1.158231, 1, 0.4078431, 0, 1,
-1.442758, -0.1513354, -0.7090763, 1, 0.4156863, 0, 1,
-1.442568, -1.199847, -3.615393, 1, 0.4196078, 0, 1,
-1.428425, -0.3750363, -1.075022, 1, 0.427451, 0, 1,
-1.421866, -0.489305, -2.897258, 1, 0.4313726, 0, 1,
-1.421846, 0.5308968, -0.2203267, 1, 0.4392157, 0, 1,
-1.417627, 0.06473219, -2.769602, 1, 0.4431373, 0, 1,
-1.412896, -0.950693, -2.172827, 1, 0.4509804, 0, 1,
-1.398327, 2.004306, -1.340574, 1, 0.454902, 0, 1,
-1.389889, 1.344201, -1.870896, 1, 0.4627451, 0, 1,
-1.389498, -1.448862, -2.820016, 1, 0.4666667, 0, 1,
-1.389085, 0.3203414, -1.69143, 1, 0.4745098, 0, 1,
-1.375173, -0.889468, -1.40778, 1, 0.4784314, 0, 1,
-1.362285, 0.3525141, -3.166335, 1, 0.4862745, 0, 1,
-1.360737, -0.4115083, -1.557771, 1, 0.4901961, 0, 1,
-1.34372, 0.4580748, -0.7245341, 1, 0.4980392, 0, 1,
-1.337204, 0.3866037, 0.2990177, 1, 0.5058824, 0, 1,
-1.319875, 0.4853117, -1.943741, 1, 0.509804, 0, 1,
-1.305565, -0.8112274, -1.641994, 1, 0.5176471, 0, 1,
-1.302955, -1.494419, -1.984898, 1, 0.5215687, 0, 1,
-1.301137, 0.6963908, -0.9099892, 1, 0.5294118, 0, 1,
-1.300908, -0.8937621, -3.843693, 1, 0.5333334, 0, 1,
-1.297971, -1.060713, -1.900252, 1, 0.5411765, 0, 1,
-1.277745, 0.1542019, -1.031834, 1, 0.5450981, 0, 1,
-1.274731, -2.117436, -1.71263, 1, 0.5529412, 0, 1,
-1.266269, -1.079989, -3.066544, 1, 0.5568628, 0, 1,
-1.257609, -0.6095416, -2.483511, 1, 0.5647059, 0, 1,
-1.252566, 0.4269558, 0.3397713, 1, 0.5686275, 0, 1,
-1.250022, 0.4197547, -1.148116, 1, 0.5764706, 0, 1,
-1.247876, -1.660313, -2.057399, 1, 0.5803922, 0, 1,
-1.228087, 0.002444301, -1.711069, 1, 0.5882353, 0, 1,
-1.227895, 1.337663, -1.513729, 1, 0.5921569, 0, 1,
-1.225598, 0.8739754, 0.4255996, 1, 0.6, 0, 1,
-1.215197, 0.05383141, -1.72969, 1, 0.6078432, 0, 1,
-1.202265, -0.8487966, -1.564197, 1, 0.6117647, 0, 1,
-1.194285, -1.126456, -3.072101, 1, 0.6196079, 0, 1,
-1.191782, -1.327507, -1.516273, 1, 0.6235294, 0, 1,
-1.186087, 1.008245, -1.390054, 1, 0.6313726, 0, 1,
-1.175892, -0.9840978, -2.103486, 1, 0.6352941, 0, 1,
-1.174626, -0.8863106, -1.700371, 1, 0.6431373, 0, 1,
-1.171253, 0.8377022, -1.442167, 1, 0.6470588, 0, 1,
-1.170913, 0.6371952, -0.1703981, 1, 0.654902, 0, 1,
-1.15333, 0.07111155, -3.139029, 1, 0.6588235, 0, 1,
-1.149492, 0.2431612, -0.1544179, 1, 0.6666667, 0, 1,
-1.143886, 0.4496839, 0.883176, 1, 0.6705883, 0, 1,
-1.141156, -0.3410819, -0.6812637, 1, 0.6784314, 0, 1,
-1.136648, -0.0629575, -1.846569, 1, 0.682353, 0, 1,
-1.134216, 0.358707, -0.5472621, 1, 0.6901961, 0, 1,
-1.121477, -1.062312, -2.018625, 1, 0.6941177, 0, 1,
-1.117232, -0.5560516, -2.697428, 1, 0.7019608, 0, 1,
-1.112771, 0.4713021, -1.913201, 1, 0.7098039, 0, 1,
-1.112579, 0.7240294, -0.3534798, 1, 0.7137255, 0, 1,
-1.108606, 0.2462364, -1.658894, 1, 0.7215686, 0, 1,
-1.099541, 0.3549407, -0.07247304, 1, 0.7254902, 0, 1,
-1.095342, -0.5037583, -2.472933, 1, 0.7333333, 0, 1,
-1.062369, 0.4679883, -1.166571, 1, 0.7372549, 0, 1,
-1.055947, -0.2282523, 0.3237833, 1, 0.7450981, 0, 1,
-1.05222, -2.37984, -4.799758, 1, 0.7490196, 0, 1,
-1.041345, -0.8174797, -2.645718, 1, 0.7568628, 0, 1,
-1.041198, 0.6872378, -0.521484, 1, 0.7607843, 0, 1,
-1.041125, -0.3670323, -2.522903, 1, 0.7686275, 0, 1,
-1.03371, 0.8342729, -0.8897748, 1, 0.772549, 0, 1,
-1.032296, 0.2263256, -0.1305951, 1, 0.7803922, 0, 1,
-1.031387, 0.8713771, -1.235946, 1, 0.7843137, 0, 1,
-1.029113, 0.1006866, -1.130033, 1, 0.7921569, 0, 1,
-1.019363, 1.238543, -0.0507145, 1, 0.7960784, 0, 1,
-1.018387, 0.1862898, -1.303264, 1, 0.8039216, 0, 1,
-1.010163, -0.4839359, -0.5394119, 1, 0.8117647, 0, 1,
-1.007295, 1.166165, -0.956505, 1, 0.8156863, 0, 1,
-1.00154, -0.08153947, -0.8627456, 1, 0.8235294, 0, 1,
-0.9964882, 1.329851, -0.0632601, 1, 0.827451, 0, 1,
-0.9906398, -2.502555, -1.17021, 1, 0.8352941, 0, 1,
-0.9842424, 0.138762, -0.83188, 1, 0.8392157, 0, 1,
-0.9745715, -1.058573, -2.12167, 1, 0.8470588, 0, 1,
-0.9737673, 0.2703534, -1.384262, 1, 0.8509804, 0, 1,
-0.9698543, -0.3849721, -3.958486, 1, 0.8588235, 0, 1,
-0.9691099, 0.439868, -0.2681693, 1, 0.8627451, 0, 1,
-0.968361, -0.491622, -1.20191, 1, 0.8705882, 0, 1,
-0.9633569, -0.7472129, -1.639569, 1, 0.8745098, 0, 1,
-0.9624707, -0.4395256, -1.847766, 1, 0.8823529, 0, 1,
-0.9608921, -0.7107171, -3.007142, 1, 0.8862745, 0, 1,
-0.9605191, 0.009964951, 0.6276206, 1, 0.8941177, 0, 1,
-0.9523914, -0.1928065, -2.670046, 1, 0.8980392, 0, 1,
-0.9494746, 0.2127924, -2.408942, 1, 0.9058824, 0, 1,
-0.9486734, 0.6279218, -1.462388, 1, 0.9137255, 0, 1,
-0.939273, -1.267292, -2.392815, 1, 0.9176471, 0, 1,
-0.938791, -0.05719212, -1.911738, 1, 0.9254902, 0, 1,
-0.9319507, 0.2550658, -0.2711093, 1, 0.9294118, 0, 1,
-0.9290988, -0.2157129, -2.062441, 1, 0.9372549, 0, 1,
-0.9286994, -0.02462767, -2.074401, 1, 0.9411765, 0, 1,
-0.9285298, 0.9220044, 0.3482044, 1, 0.9490196, 0, 1,
-0.9272665, -0.2092073, -1.742754, 1, 0.9529412, 0, 1,
-0.926402, 0.2374697, -1.75692, 1, 0.9607843, 0, 1,
-0.9238148, -0.2796733, -1.450273, 1, 0.9647059, 0, 1,
-0.9207098, 2.580953, 1.453042, 1, 0.972549, 0, 1,
-0.9131631, -0.4198555, -1.681662, 1, 0.9764706, 0, 1,
-0.9084238, 2.00257, -1.043522, 1, 0.9843137, 0, 1,
-0.9029819, 1.226726, -0.4708953, 1, 0.9882353, 0, 1,
-0.9013337, -2.223744, -2.43768, 1, 0.9960784, 0, 1,
-0.8969064, -0.4811928, -1.738421, 0.9960784, 1, 0, 1,
-0.8961913, 0.7278623, -0.8771145, 0.9921569, 1, 0, 1,
-0.8949409, -1.320709, -1.640717, 0.9843137, 1, 0, 1,
-0.891762, 0.9059954, -1.433855, 0.9803922, 1, 0, 1,
-0.8871908, -0.7379217, -2.586445, 0.972549, 1, 0, 1,
-0.8867907, -0.4266857, -1.560113, 0.9686275, 1, 0, 1,
-0.8853909, -1.2119, -3.2695, 0.9607843, 1, 0, 1,
-0.8850899, 0.3215114, -1.28969, 0.9568627, 1, 0, 1,
-0.8835169, 1.899798, -0.1957349, 0.9490196, 1, 0, 1,
-0.8828428, -0.3939424, -1.995432, 0.945098, 1, 0, 1,
-0.8800653, -0.6702591, -2.483953, 0.9372549, 1, 0, 1,
-0.8790945, 0.2879594, -1.83913, 0.9333333, 1, 0, 1,
-0.8782594, -0.1842807, -1.818835, 0.9254902, 1, 0, 1,
-0.8710507, -0.9855624, -3.677146, 0.9215686, 1, 0, 1,
-0.8664714, 0.3441355, -1.944589, 0.9137255, 1, 0, 1,
-0.8312103, -0.960884, -2.138798, 0.9098039, 1, 0, 1,
-0.819153, -0.0783089, -2.404591, 0.9019608, 1, 0, 1,
-0.813427, -0.4136328, -1.906913, 0.8941177, 1, 0, 1,
-0.8110748, 0.1880856, -1.590683, 0.8901961, 1, 0, 1,
-0.8102146, -0.9382697, -1.539133, 0.8823529, 1, 0, 1,
-0.8054354, -0.9195154, -1.94301, 0.8784314, 1, 0, 1,
-0.8043384, 0.6991066, -0.8201555, 0.8705882, 1, 0, 1,
-0.8016207, 0.9817517, -0.6414782, 0.8666667, 1, 0, 1,
-0.8003213, -0.6624269, -2.760415, 0.8588235, 1, 0, 1,
-0.7998049, -1.005381, -3.132164, 0.854902, 1, 0, 1,
-0.7997516, -0.3089114, -1.972917, 0.8470588, 1, 0, 1,
-0.7928236, 0.7279925, -0.934397, 0.8431373, 1, 0, 1,
-0.78975, 0.4349167, -1.908553, 0.8352941, 1, 0, 1,
-0.7886229, -1.091632, -2.640329, 0.8313726, 1, 0, 1,
-0.7886132, 0.7884641, -1.003777, 0.8235294, 1, 0, 1,
-0.7825795, -0.1679804, -1.804456, 0.8196079, 1, 0, 1,
-0.7807584, -0.09842686, -2.333478, 0.8117647, 1, 0, 1,
-0.7797878, -0.698583, -2.483638, 0.8078431, 1, 0, 1,
-0.7762567, 0.5977576, -1.236217, 0.8, 1, 0, 1,
-0.7704405, 1.360805, -0.7860371, 0.7921569, 1, 0, 1,
-0.7669111, -0.1053543, -3.554878, 0.7882353, 1, 0, 1,
-0.7610952, 0.2683965, -1.854711, 0.7803922, 1, 0, 1,
-0.7567133, -0.181396, -2.82851, 0.7764706, 1, 0, 1,
-0.7517506, 0.6405572, -1.882239, 0.7686275, 1, 0, 1,
-0.7487829, 1.116256, -2.250431, 0.7647059, 1, 0, 1,
-0.7459106, -0.3857117, -2.43805, 0.7568628, 1, 0, 1,
-0.7455556, 0.634178, -0.5116648, 0.7529412, 1, 0, 1,
-0.7449595, -1.472232, -2.046153, 0.7450981, 1, 0, 1,
-0.7407694, -1.888416, -1.802717, 0.7411765, 1, 0, 1,
-0.7396967, -1.930698, -2.966407, 0.7333333, 1, 0, 1,
-0.7387027, -0.304628, -1.599363, 0.7294118, 1, 0, 1,
-0.7337251, -0.6307491, -2.532203, 0.7215686, 1, 0, 1,
-0.7263323, 0.5882542, -0.936035, 0.7176471, 1, 0, 1,
-0.7231478, 0.9928226, 0.2919581, 0.7098039, 1, 0, 1,
-0.7203115, -0.9981518, -0.9807833, 0.7058824, 1, 0, 1,
-0.7184093, 0.6037291, -1.42295, 0.6980392, 1, 0, 1,
-0.7177798, 0.7433683, -0.3866479, 0.6901961, 1, 0, 1,
-0.7150313, 0.3119545, -0.3375493, 0.6862745, 1, 0, 1,
-0.7131113, -0.1143297, -2.856671, 0.6784314, 1, 0, 1,
-0.7072383, 0.02875102, -1.798665, 0.6745098, 1, 0, 1,
-0.6972957, 0.4809057, 0.7512456, 0.6666667, 1, 0, 1,
-0.6968397, -1.785604, -3.014615, 0.6627451, 1, 0, 1,
-0.6949108, -1.126848, -1.818346, 0.654902, 1, 0, 1,
-0.6908771, 0.6716993, -1.1725, 0.6509804, 1, 0, 1,
-0.6898232, -0.3060635, -2.900452, 0.6431373, 1, 0, 1,
-0.6815111, -1.206104, -2.479676, 0.6392157, 1, 0, 1,
-0.6739238, 1.171853, -0.3280315, 0.6313726, 1, 0, 1,
-0.6738983, -1.685231, -3.767187, 0.627451, 1, 0, 1,
-0.6737083, 1.497365, -0.3417948, 0.6196079, 1, 0, 1,
-0.6687509, 1.114866, -0.1529862, 0.6156863, 1, 0, 1,
-0.6681732, -0.4771876, -4.114997, 0.6078432, 1, 0, 1,
-0.6675084, 0.1368744, -3.076314, 0.6039216, 1, 0, 1,
-0.665423, -0.4171442, -1.849111, 0.5960785, 1, 0, 1,
-0.6641223, 0.2550324, -0.2321741, 0.5882353, 1, 0, 1,
-0.6588956, 0.8011901, -1.357728, 0.5843138, 1, 0, 1,
-0.6573535, 1.780167, -0.3581572, 0.5764706, 1, 0, 1,
-0.6527498, -1.06416, -2.607706, 0.572549, 1, 0, 1,
-0.6508588, -0.3524606, -2.478735, 0.5647059, 1, 0, 1,
-0.6488854, 1.213235, 0.5338065, 0.5607843, 1, 0, 1,
-0.6483009, 0.9814007, -0.8198967, 0.5529412, 1, 0, 1,
-0.6471573, -1.798094, -1.68408, 0.5490196, 1, 0, 1,
-0.647132, 0.8800749, 1.186258, 0.5411765, 1, 0, 1,
-0.6437813, 1.921123, 1.150709, 0.5372549, 1, 0, 1,
-0.6435494, -1.200392, -0.9161417, 0.5294118, 1, 0, 1,
-0.6389138, -1.139179, -2.732963, 0.5254902, 1, 0, 1,
-0.6385909, 0.5436948, -0.398258, 0.5176471, 1, 0, 1,
-0.6363818, -0.3220161, -2.354022, 0.5137255, 1, 0, 1,
-0.6357983, 1.278899, -1.39297, 0.5058824, 1, 0, 1,
-0.632987, 0.2760151, -1.554154, 0.5019608, 1, 0, 1,
-0.6308779, 0.8037236, -2.057447, 0.4941176, 1, 0, 1,
-0.6282782, -1.14919, -1.295257, 0.4862745, 1, 0, 1,
-0.6234743, -1.421979, -0.8414469, 0.4823529, 1, 0, 1,
-0.622315, -0.5268986, -3.305475, 0.4745098, 1, 0, 1,
-0.6158955, -0.5024368, -1.179817, 0.4705882, 1, 0, 1,
-0.6137533, -0.3814038, -2.472444, 0.4627451, 1, 0, 1,
-0.6137148, -0.3403108, -1.485266, 0.4588235, 1, 0, 1,
-0.611644, -0.6945133, -3.876876, 0.4509804, 1, 0, 1,
-0.6033183, -0.3033781, -3.337831, 0.4470588, 1, 0, 1,
-0.6005424, 0.2963965, 1.534094, 0.4392157, 1, 0, 1,
-0.5983755, -0.9107792, -1.907448, 0.4352941, 1, 0, 1,
-0.5979882, 0.7313168, 0.6371484, 0.427451, 1, 0, 1,
-0.5933787, -1.127536, -3.597856, 0.4235294, 1, 0, 1,
-0.5890944, 1.133279, -0.4251622, 0.4156863, 1, 0, 1,
-0.5880764, 0.3862821, -1.328877, 0.4117647, 1, 0, 1,
-0.5836211, -0.08845194, -0.4280657, 0.4039216, 1, 0, 1,
-0.579266, -0.1628022, -0.1532376, 0.3960784, 1, 0, 1,
-0.5779063, -0.6592824, -3.437417, 0.3921569, 1, 0, 1,
-0.5761173, 1.281708, -1.100537, 0.3843137, 1, 0, 1,
-0.5745299, -0.8174871, -1.58728, 0.3803922, 1, 0, 1,
-0.5742093, 0.1580641, -0.7598656, 0.372549, 1, 0, 1,
-0.5737898, 1.504192, -0.5825974, 0.3686275, 1, 0, 1,
-0.5725728, -0.5034986, -1.395618, 0.3607843, 1, 0, 1,
-0.5698041, 0.5456085, -0.2773803, 0.3568628, 1, 0, 1,
-0.5689785, -0.6045894, -2.720552, 0.3490196, 1, 0, 1,
-0.5661003, -0.3209935, -2.671251, 0.345098, 1, 0, 1,
-0.5629452, -0.3414546, -2.676665, 0.3372549, 1, 0, 1,
-0.5616224, 0.3580246, -0.4471897, 0.3333333, 1, 0, 1,
-0.5610904, -1.537135, -3.587666, 0.3254902, 1, 0, 1,
-0.5594441, 0.9603708, -1.170817, 0.3215686, 1, 0, 1,
-0.5588176, -1.724825, -1.911361, 0.3137255, 1, 0, 1,
-0.5561227, -1.225543, -3.201803, 0.3098039, 1, 0, 1,
-0.5545014, -0.3094345, -2.327744, 0.3019608, 1, 0, 1,
-0.5455301, -0.795659, -1.017738, 0.2941177, 1, 0, 1,
-0.5437683, 0.951784, -1.049271, 0.2901961, 1, 0, 1,
-0.5427922, 0.9933811, -0.1605465, 0.282353, 1, 0, 1,
-0.542034, 0.8223649, 0.3540063, 0.2784314, 1, 0, 1,
-0.5375608, 0.5510578, -2.16293, 0.2705882, 1, 0, 1,
-0.5232459, -1.515958, -1.684498, 0.2666667, 1, 0, 1,
-0.5208601, -0.6331042, -3.452097, 0.2588235, 1, 0, 1,
-0.5178736, 1.450193, -0.340694, 0.254902, 1, 0, 1,
-0.5159218, 1.143643, 0.1628534, 0.2470588, 1, 0, 1,
-0.5142236, 0.1564242, -2.375497, 0.2431373, 1, 0, 1,
-0.5113781, 1.017941, 0.4708734, 0.2352941, 1, 0, 1,
-0.5017197, 0.4116583, -1.217064, 0.2313726, 1, 0, 1,
-0.5007582, -0.9303098, -0.2342868, 0.2235294, 1, 0, 1,
-0.5000976, 0.362252, -1.881456, 0.2196078, 1, 0, 1,
-0.4911169, 0.5710754, 0.4561654, 0.2117647, 1, 0, 1,
-0.4877027, -0.3914719, -0.7485688, 0.2078431, 1, 0, 1,
-0.4837467, 0.03413792, -1.357707, 0.2, 1, 0, 1,
-0.4762264, -0.6850271, -2.899927, 0.1921569, 1, 0, 1,
-0.4752573, 1.287239, -2.111196, 0.1882353, 1, 0, 1,
-0.4688699, 0.8769997, 0.227804, 0.1803922, 1, 0, 1,
-0.4604354, 1.205599, 0.7853248, 0.1764706, 1, 0, 1,
-0.4597926, -0.2077271, -1.375073, 0.1686275, 1, 0, 1,
-0.4590885, -0.3819527, -4.0353, 0.1647059, 1, 0, 1,
-0.4590284, 0.7629061, -1.751002, 0.1568628, 1, 0, 1,
-0.451647, -0.6304207, -3.445014, 0.1529412, 1, 0, 1,
-0.4512263, -0.4116015, -1.9266, 0.145098, 1, 0, 1,
-0.4499585, -1.462778, -3.586689, 0.1411765, 1, 0, 1,
-0.441523, -0.6020926, -2.025973, 0.1333333, 1, 0, 1,
-0.436166, -1.472121, -2.533237, 0.1294118, 1, 0, 1,
-0.4360847, 0.2662944, -1.490626, 0.1215686, 1, 0, 1,
-0.4332945, -1.253005, -3.071137, 0.1176471, 1, 0, 1,
-0.4312494, 0.9213116, -0.7802853, 0.1098039, 1, 0, 1,
-0.4277939, 0.6108178, -1.568616, 0.1058824, 1, 0, 1,
-0.4234422, 0.4935451, 0.2261687, 0.09803922, 1, 0, 1,
-0.4231344, 0.5776749, -1.00708, 0.09019608, 1, 0, 1,
-0.4229834, 1.326846, 0.9950892, 0.08627451, 1, 0, 1,
-0.4220299, 1.581403, -0.9803702, 0.07843138, 1, 0, 1,
-0.4215299, -2.148652, -4.716581, 0.07450981, 1, 0, 1,
-0.4210329, 0.6577426, -1.370368, 0.06666667, 1, 0, 1,
-0.418059, 1.708428, -0.8208928, 0.0627451, 1, 0, 1,
-0.4128253, -0.1462767, -2.588561, 0.05490196, 1, 0, 1,
-0.4046296, -1.290008, -3.581161, 0.05098039, 1, 0, 1,
-0.3986892, -0.4796132, -3.088414, 0.04313726, 1, 0, 1,
-0.3981618, -1.493122, -0.8427484, 0.03921569, 1, 0, 1,
-0.3972579, -0.297261, -2.491674, 0.03137255, 1, 0, 1,
-0.3967305, 0.5756133, -0.35028, 0.02745098, 1, 0, 1,
-0.3956411, -0.3644074, -3.487885, 0.01960784, 1, 0, 1,
-0.3955748, -0.3206306, -2.287918, 0.01568628, 1, 0, 1,
-0.3919502, 0.8765901, -1.997605, 0.007843138, 1, 0, 1,
-0.391865, -0.1890911, -3.076421, 0.003921569, 1, 0, 1,
-0.3898214, 0.5423365, -1.162454, 0, 1, 0.003921569, 1,
-0.3875223, 0.5521453, -1.050302, 0, 1, 0.01176471, 1,
-0.3869475, -1.232328, -1.955545, 0, 1, 0.01568628, 1,
-0.3863104, 0.4356448, -0.9376506, 0, 1, 0.02352941, 1,
-0.382897, 0.362889, -0.7034165, 0, 1, 0.02745098, 1,
-0.3806864, -0.5406091, -0.102431, 0, 1, 0.03529412, 1,
-0.3721392, 0.9097839, 0.7416994, 0, 1, 0.03921569, 1,
-0.368914, 0.8367389, 1.762785, 0, 1, 0.04705882, 1,
-0.361748, -0.3212349, -0.7489569, 0, 1, 0.05098039, 1,
-0.3538201, -0.7621275, -3.48784, 0, 1, 0.05882353, 1,
-0.350237, 0.08635905, -1.6038, 0, 1, 0.0627451, 1,
-0.3497394, 0.2624222, -1.43525, 0, 1, 0.07058824, 1,
-0.3453923, 0.1490141, 0.09419475, 0, 1, 0.07450981, 1,
-0.3402015, -1.262027, -0.9598966, 0, 1, 0.08235294, 1,
-0.3389433, -1.634743, -1.748295, 0, 1, 0.08627451, 1,
-0.3296211, 0.19518, -0.1538094, 0, 1, 0.09411765, 1,
-0.3259584, 0.3113578, -0.5930748, 0, 1, 0.1019608, 1,
-0.3186496, 0.2267559, -0.9565263, 0, 1, 0.1058824, 1,
-0.3163438, 0.9345998, -0.6621578, 0, 1, 0.1137255, 1,
-0.3148987, -1.201039, -3.77784, 0, 1, 0.1176471, 1,
-0.3147465, 0.550347, -0.7531592, 0, 1, 0.1254902, 1,
-0.3096193, 0.692948, -2.352617, 0, 1, 0.1294118, 1,
-0.2959915, 1.130604, 0.913572, 0, 1, 0.1372549, 1,
-0.2947585, 2.586074, -0.2021258, 0, 1, 0.1411765, 1,
-0.2937622, -0.3639565, -3.464708, 0, 1, 0.1490196, 1,
-0.2916171, 0.9084243, 0.4849209, 0, 1, 0.1529412, 1,
-0.2891678, 0.2422068, -1.7016, 0, 1, 0.1607843, 1,
-0.2881968, 0.9349149, -0.6136475, 0, 1, 0.1647059, 1,
-0.2861938, 0.2370275, -2.579701, 0, 1, 0.172549, 1,
-0.2849621, 0.6068038, -0.6895859, 0, 1, 0.1764706, 1,
-0.2819103, 1.383154, -0.6778949, 0, 1, 0.1843137, 1,
-0.2740606, 0.383375, 1.165465, 0, 1, 0.1882353, 1,
-0.2729921, -0.2540349, -3.352676, 0, 1, 0.1960784, 1,
-0.26714, 0.8832363, -0.7016835, 0, 1, 0.2039216, 1,
-0.2618006, 2.341872, -0.5850296, 0, 1, 0.2078431, 1,
-0.2605864, -0.744793, -3.453795, 0, 1, 0.2156863, 1,
-0.2551598, 0.08590121, -1.265428, 0, 1, 0.2196078, 1,
-0.2551164, -1.006999, -2.548114, 0, 1, 0.227451, 1,
-0.2516893, -0.9879836, -4.39602, 0, 1, 0.2313726, 1,
-0.2508276, 0.006194196, -0.7279457, 0, 1, 0.2392157, 1,
-0.2502423, 0.7652407, -0.9874253, 0, 1, 0.2431373, 1,
-0.2471917, 1.751746, -2.219575, 0, 1, 0.2509804, 1,
-0.2466286, 0.01697362, -0.7167009, 0, 1, 0.254902, 1,
-0.2410896, 0.5173196, -0.7637036, 0, 1, 0.2627451, 1,
-0.2392931, -1.771085, -1.472035, 0, 1, 0.2666667, 1,
-0.2389591, -0.7656443, -1.494037, 0, 1, 0.2745098, 1,
-0.2368938, -0.1418131, -2.618943, 0, 1, 0.2784314, 1,
-0.2327614, -0.9207946, -3.297775, 0, 1, 0.2862745, 1,
-0.2319971, -0.3277222, -2.393382, 0, 1, 0.2901961, 1,
-0.2291571, 1.787465, -0.7343053, 0, 1, 0.2980392, 1,
-0.2250151, -1.500268, -4.940331, 0, 1, 0.3058824, 1,
-0.2205401, 0.9894838, -0.6847679, 0, 1, 0.3098039, 1,
-0.2195234, -0.9275701, -2.753074, 0, 1, 0.3176471, 1,
-0.2175317, -1.405516, -5.723635, 0, 1, 0.3215686, 1,
-0.217483, 0.6789631, -1.261032, 0, 1, 0.3294118, 1,
-0.2166713, -2.029879, -2.380642, 0, 1, 0.3333333, 1,
-0.2146039, 0.6236811, -0.3991796, 0, 1, 0.3411765, 1,
-0.2104428, 0.07926769, -1.000306, 0, 1, 0.345098, 1,
-0.2077766, 1.337308, 0.9749058, 0, 1, 0.3529412, 1,
-0.2073161, -0.1145136, -1.388208, 0, 1, 0.3568628, 1,
-0.2060186, 0.4494687, -0.8153545, 0, 1, 0.3647059, 1,
-0.2049648, -0.2624143, -4.075822, 0, 1, 0.3686275, 1,
-0.1995999, -0.9116924, -2.997318, 0, 1, 0.3764706, 1,
-0.1989184, -0.3922976, -2.081027, 0, 1, 0.3803922, 1,
-0.1967554, -0.6037508, -1.967121, 0, 1, 0.3882353, 1,
-0.1898099, 0.0611666, -1.220601, 0, 1, 0.3921569, 1,
-0.1881149, 0.5155518, 0.8082848, 0, 1, 0.4, 1,
-0.1871927, -0.1737998, -2.112974, 0, 1, 0.4078431, 1,
-0.1853531, -0.8686938, -3.070604, 0, 1, 0.4117647, 1,
-0.1843722, -1.295558, -3.465773, 0, 1, 0.4196078, 1,
-0.1829054, -0.6934078, -2.99462, 0, 1, 0.4235294, 1,
-0.1828793, -0.9547641, -2.771863, 0, 1, 0.4313726, 1,
-0.1825196, -0.7162228, -2.448339, 0, 1, 0.4352941, 1,
-0.1813419, 0.4912007, 0.114471, 0, 1, 0.4431373, 1,
-0.178348, 1.575579, -0.961354, 0, 1, 0.4470588, 1,
-0.1673049, 0.3187607, 0.8026584, 0, 1, 0.454902, 1,
-0.1642084, -0.180627, -0.9614031, 0, 1, 0.4588235, 1,
-0.1637334, 0.06268927, -0.4141628, 0, 1, 0.4666667, 1,
-0.1587919, -1.004557, -1.776939, 0, 1, 0.4705882, 1,
-0.1560546, 0.9526203, -0.06197254, 0, 1, 0.4784314, 1,
-0.1539076, 0.1611278, -0.7074783, 0, 1, 0.4823529, 1,
-0.1489334, -0.194129, -0.1255748, 0, 1, 0.4901961, 1,
-0.1482169, 0.6830254, 0.3106925, 0, 1, 0.4941176, 1,
-0.1474371, -0.09646011, 0.2950162, 0, 1, 0.5019608, 1,
-0.1444981, -0.7953125, -2.847331, 0, 1, 0.509804, 1,
-0.1433787, -1.367374, -1.984496, 0, 1, 0.5137255, 1,
-0.1399984, -0.467674, -4.335042, 0, 1, 0.5215687, 1,
-0.1397429, -0.625617, -2.251757, 0, 1, 0.5254902, 1,
-0.1380867, -1.32315, -2.448795, 0, 1, 0.5333334, 1,
-0.1347651, -0.04445982, -2.893301, 0, 1, 0.5372549, 1,
-0.1331125, 0.6435112, -1.027463, 0, 1, 0.5450981, 1,
-0.1312901, 0.2706653, -0.1927279, 0, 1, 0.5490196, 1,
-0.1276068, 0.495109, 1.476388, 0, 1, 0.5568628, 1,
-0.1245432, -0.5618968, -2.055497, 0, 1, 0.5607843, 1,
-0.1231892, -0.6158081, -4.541511, 0, 1, 0.5686275, 1,
-0.1228592, 1.164149, 0.1623437, 0, 1, 0.572549, 1,
-0.1172698, 0.9706404, -1.186563, 0, 1, 0.5803922, 1,
-0.1154687, -0.2431234, -2.615955, 0, 1, 0.5843138, 1,
-0.1098994, -0.1747025, -0.969641, 0, 1, 0.5921569, 1,
-0.1084893, 0.3335274, -1.829757, 0, 1, 0.5960785, 1,
-0.107955, -0.2513382, -4.564225, 0, 1, 0.6039216, 1,
-0.1061382, 0.03468205, 0.6365834, 0, 1, 0.6117647, 1,
-0.1009977, 0.4834589, 0.3383467, 0, 1, 0.6156863, 1,
-0.09817111, -0.4252035, -2.317129, 0, 1, 0.6235294, 1,
-0.08987626, 1.196214, 1.079753, 0, 1, 0.627451, 1,
-0.08232652, -0.3148341, -2.219074, 0, 1, 0.6352941, 1,
-0.08203464, -1.393029, -3.741005, 0, 1, 0.6392157, 1,
-0.07768912, -1.748177, -4.128349, 0, 1, 0.6470588, 1,
-0.07300805, -1.206563, -4.349516, 0, 1, 0.6509804, 1,
-0.06951902, 0.4506253, 0.09214813, 0, 1, 0.6588235, 1,
-0.06532331, -0.8893302, -1.583241, 0, 1, 0.6627451, 1,
-0.06304604, 0.303975, 0.243974, 0, 1, 0.6705883, 1,
-0.06176643, -0.7522339, -2.107646, 0, 1, 0.6745098, 1,
-0.06104517, -1.196988, -2.762131, 0, 1, 0.682353, 1,
-0.0608982, 0.08524339, -0.4976192, 0, 1, 0.6862745, 1,
-0.05921567, -1.660467, -3.778405, 0, 1, 0.6941177, 1,
-0.05865753, 0.5177014, 0.8487942, 0, 1, 0.7019608, 1,
-0.05743118, -0.5879067, -2.654328, 0, 1, 0.7058824, 1,
-0.05260421, -0.8765848, -1.48751, 0, 1, 0.7137255, 1,
-0.05057661, 1.370207, -0.4213289, 0, 1, 0.7176471, 1,
-0.05033226, 0.1633569, -0.9232668, 0, 1, 0.7254902, 1,
-0.04848544, -1.267934, -2.386058, 0, 1, 0.7294118, 1,
-0.04831377, 0.2054829, -0.9704465, 0, 1, 0.7372549, 1,
-0.04657889, -0.1146044, -4.238818, 0, 1, 0.7411765, 1,
-0.0447829, 0.6483492, 0.6743414, 0, 1, 0.7490196, 1,
-0.04357498, 0.5303316, -0.9637855, 0, 1, 0.7529412, 1,
-0.04199024, 0.7240944, 1.397304, 0, 1, 0.7607843, 1,
-0.04143795, 0.7315955, -0.419924, 0, 1, 0.7647059, 1,
-0.03792464, -0.1369269, -5.666691, 0, 1, 0.772549, 1,
-0.0379038, -0.1030959, -3.985525, 0, 1, 0.7764706, 1,
-0.0373127, -0.09675129, -3.724658, 0, 1, 0.7843137, 1,
-0.03593461, 0.182056, 2.444538, 0, 1, 0.7882353, 1,
-0.03547335, 0.4385093, -0.634519, 0, 1, 0.7960784, 1,
-0.03147037, 1.227898, 1.86941, 0, 1, 0.8039216, 1,
-0.02826621, 1.000805, 0.1089933, 0, 1, 0.8078431, 1,
-0.02603987, -1.470469, -1.482289, 0, 1, 0.8156863, 1,
-0.02550028, -0.0550369, -4.218425, 0, 1, 0.8196079, 1,
-0.02463622, -0.1477703, -3.038041, 0, 1, 0.827451, 1,
-0.0211617, -1.415214, -3.653399, 0, 1, 0.8313726, 1,
-0.02074341, 0.3164654, 0.1245541, 0, 1, 0.8392157, 1,
-0.02005747, 1.559692, -2.003198, 0, 1, 0.8431373, 1,
-0.01982452, 0.5053399, -1.099973, 0, 1, 0.8509804, 1,
-0.01749947, -1.877362, -3.15353, 0, 1, 0.854902, 1,
-0.01720256, -0.5804489, -0.6996617, 0, 1, 0.8627451, 1,
-0.01378965, 1.883497, 1.318987, 0, 1, 0.8666667, 1,
-0.01322691, 1.02448, 0.03059767, 0, 1, 0.8745098, 1,
-0.01306718, 1.390081, -0.3491449, 0, 1, 0.8784314, 1,
-0.0120115, 0.930998, -1.080162, 0, 1, 0.8862745, 1,
-0.01134502, -1.577617, -2.879532, 0, 1, 0.8901961, 1,
-0.009526227, 2.11425, 0.1948822, 0, 1, 0.8980392, 1,
-0.009226593, 0.4217187, -0.3900321, 0, 1, 0.9058824, 1,
-0.00206132, 0.1505942, 0.5516888, 0, 1, 0.9098039, 1,
-0.0002908274, -0.924792, -3.613841, 0, 1, 0.9176471, 1,
0.0005646974, -1.25902, 3.384541, 0, 1, 0.9215686, 1,
0.002638204, -0.2398687, 2.719495, 0, 1, 0.9294118, 1,
0.003210447, 1.533414, 0.9421583, 0, 1, 0.9333333, 1,
0.007727794, -1.106371, 3.083777, 0, 1, 0.9411765, 1,
0.009794863, 0.56902, 1.685147, 0, 1, 0.945098, 1,
0.009835948, 0.1147122, 0.7326626, 0, 1, 0.9529412, 1,
0.01008983, -0.2607524, 3.224602, 0, 1, 0.9568627, 1,
0.01062462, 0.9862022, 1.132973, 0, 1, 0.9647059, 1,
0.01130427, -0.8343126, 3.687712, 0, 1, 0.9686275, 1,
0.01579207, 0.9108063, 0.3681878, 0, 1, 0.9764706, 1,
0.01673693, 0.2209272, -0.4549755, 0, 1, 0.9803922, 1,
0.01707042, -0.04564405, 2.176302, 0, 1, 0.9882353, 1,
0.01842013, -1.385934, 1.948982, 0, 1, 0.9921569, 1,
0.01996136, 1.474607, -0.7720929, 0, 1, 1, 1,
0.0232233, -2.335088, 3.258883, 0, 0.9921569, 1, 1,
0.02588261, -0.6089136, 3.43448, 0, 0.9882353, 1, 1,
0.02607723, 0.3235601, 1.206859, 0, 0.9803922, 1, 1,
0.0290127, 0.732915, -0.06697059, 0, 0.9764706, 1, 1,
0.03195804, -1.098819, 3.417022, 0, 0.9686275, 1, 1,
0.03231389, 0.943305, 0.7691283, 0, 0.9647059, 1, 1,
0.03237716, -0.2559455, 2.781341, 0, 0.9568627, 1, 1,
0.03317474, -0.09579238, 1.309815, 0, 0.9529412, 1, 1,
0.04489743, 0.7730315, -0.3079902, 0, 0.945098, 1, 1,
0.04533972, -0.4425298, 3.688204, 0, 0.9411765, 1, 1,
0.04655962, -0.8835887, 1.699931, 0, 0.9333333, 1, 1,
0.04761133, 0.4194599, 0.1708146, 0, 0.9294118, 1, 1,
0.04928938, 0.09905557, 0.7383924, 0, 0.9215686, 1, 1,
0.04962388, 0.6864151, 2.237219, 0, 0.9176471, 1, 1,
0.04973246, 0.07877608, 0.8399132, 0, 0.9098039, 1, 1,
0.05163206, -0.4538994, 4.858376, 0, 0.9058824, 1, 1,
0.05242135, 1.407673, -1.013417, 0, 0.8980392, 1, 1,
0.05264544, -0.3533123, 1.97895, 0, 0.8901961, 1, 1,
0.05880954, 0.5416743, 0.8050388, 0, 0.8862745, 1, 1,
0.06044186, -0.6761528, 4.14677, 0, 0.8784314, 1, 1,
0.06251138, 0.003474647, 2.573505, 0, 0.8745098, 1, 1,
0.0651224, -0.2522283, 3.636014, 0, 0.8666667, 1, 1,
0.07297632, 0.2577321, 2.348565, 0, 0.8627451, 1, 1,
0.07675769, -0.08265028, 1.835314, 0, 0.854902, 1, 1,
0.08028021, 0.6580085, -0.3782057, 0, 0.8509804, 1, 1,
0.08123782, -0.3654928, 2.413194, 0, 0.8431373, 1, 1,
0.082265, -0.2886591, 1.364138, 0, 0.8392157, 1, 1,
0.09338655, 0.3992757, 0.2973183, 0, 0.8313726, 1, 1,
0.09820204, -0.1373373, 4.648891, 0, 0.827451, 1, 1,
0.09895297, 0.3200978, 0.2525744, 0, 0.8196079, 1, 1,
0.1024159, -0.02426372, 0.6477205, 0, 0.8156863, 1, 1,
0.1055918, -0.1168368, 1.629432, 0, 0.8078431, 1, 1,
0.1113775, 0.7198616, 2.170627, 0, 0.8039216, 1, 1,
0.1124953, 1.11118, 0.09555335, 0, 0.7960784, 1, 1,
0.1134676, -0.367999, 0.9141424, 0, 0.7882353, 1, 1,
0.1139794, -1.084012, 3.575418, 0, 0.7843137, 1, 1,
0.1224926, -0.7494895, 3.244181, 0, 0.7764706, 1, 1,
0.1232378, -2.121304, 4.700252, 0, 0.772549, 1, 1,
0.1241444, -0.762531, 2.841665, 0, 0.7647059, 1, 1,
0.1244153, 0.1824195, 1.60178, 0, 0.7607843, 1, 1,
0.129802, -1.030996, 1.617386, 0, 0.7529412, 1, 1,
0.1307675, 0.7464482, -0.3319277, 0, 0.7490196, 1, 1,
0.1310197, -0.3461451, 3.67314, 0, 0.7411765, 1, 1,
0.1321006, 0.3224313, 0.8319651, 0, 0.7372549, 1, 1,
0.1325862, 0.9804787, -0.2266917, 0, 0.7294118, 1, 1,
0.1340982, 2.764683, 0.4412161, 0, 0.7254902, 1, 1,
0.1423711, -0.1983803, 3.959991, 0, 0.7176471, 1, 1,
0.1432161, 0.7677791, -0.07799795, 0, 0.7137255, 1, 1,
0.1506611, 0.680195, 1.408648, 0, 0.7058824, 1, 1,
0.1516927, 0.02120714, 3.485917, 0, 0.6980392, 1, 1,
0.1518737, 0.837746, -0.5491363, 0, 0.6941177, 1, 1,
0.15225, -0.6051689, -0.1305317, 0, 0.6862745, 1, 1,
0.1560321, 0.2151511, 0.8537878, 0, 0.682353, 1, 1,
0.158842, 0.3720865, 0.9455309, 0, 0.6745098, 1, 1,
0.1598693, -0.3066702, 2.372749, 0, 0.6705883, 1, 1,
0.1633256, -0.7914749, 2.879936, 0, 0.6627451, 1, 1,
0.1647153, -2.898532, 2.432302, 0, 0.6588235, 1, 1,
0.1655131, -0.1251366, 2.045099, 0, 0.6509804, 1, 1,
0.1677127, 0.4232579, -1.012342, 0, 0.6470588, 1, 1,
0.1682158, -0.6374072, 3.614693, 0, 0.6392157, 1, 1,
0.1687119, -1.859577, 1.992224, 0, 0.6352941, 1, 1,
0.1715095, -0.3915286, 3.399812, 0, 0.627451, 1, 1,
0.17161, 0.992801, 0.3593864, 0, 0.6235294, 1, 1,
0.1766529, -0.4135512, 3.669492, 0, 0.6156863, 1, 1,
0.1802169, 0.7150814, -0.2885741, 0, 0.6117647, 1, 1,
0.1803924, -1.226241, 3.719138, 0, 0.6039216, 1, 1,
0.1811059, 0.6755404, 0.5640555, 0, 0.5960785, 1, 1,
0.181478, -0.7331833, 3.104988, 0, 0.5921569, 1, 1,
0.1895627, -0.4060097, 2.591316, 0, 0.5843138, 1, 1,
0.1910983, 0.7887851, -1.885548, 0, 0.5803922, 1, 1,
0.1911883, 1.164412, 0.7907348, 0, 0.572549, 1, 1,
0.1915628, -1.076479, 2.696791, 0, 0.5686275, 1, 1,
0.1954815, -1.960229, 2.298263, 0, 0.5607843, 1, 1,
0.1963859, 0.2084989, 0.8149356, 0, 0.5568628, 1, 1,
0.1983361, -0.4258173, 4.233437, 0, 0.5490196, 1, 1,
0.1991213, 1.573427, 0.02400277, 0, 0.5450981, 1, 1,
0.2002529, -1.637809, 3.267412, 0, 0.5372549, 1, 1,
0.2069788, -0.277043, 2.33485, 0, 0.5333334, 1, 1,
0.2084745, -2.189996, 4.141657, 0, 0.5254902, 1, 1,
0.2097054, 2.472075, 0.7955698, 0, 0.5215687, 1, 1,
0.2113226, 0.5386011, 1.839063, 0, 0.5137255, 1, 1,
0.2190342, -1.679528, 2.518405, 0, 0.509804, 1, 1,
0.220812, 0.2763371, -0.8101645, 0, 0.5019608, 1, 1,
0.221178, -0.5498005, 1.31784, 0, 0.4941176, 1, 1,
0.2223412, -0.02762915, -0.5471436, 0, 0.4901961, 1, 1,
0.22689, -1.135993, 2.378499, 0, 0.4823529, 1, 1,
0.2288411, 0.4862879, -0.3319041, 0, 0.4784314, 1, 1,
0.233256, -0.7670605, 1.45268, 0, 0.4705882, 1, 1,
0.2368925, 0.04500451, 0.5594584, 0, 0.4666667, 1, 1,
0.23899, 0.8801555, -0.3501151, 0, 0.4588235, 1, 1,
0.2391116, -0.9371994, 2.038402, 0, 0.454902, 1, 1,
0.239232, -2.015293, 5.864459, 0, 0.4470588, 1, 1,
0.2393827, -0.68126, 3.073872, 0, 0.4431373, 1, 1,
0.2394198, -1.258837, 3.870643, 0, 0.4352941, 1, 1,
0.2412417, -1.110404, 3.045893, 0, 0.4313726, 1, 1,
0.2426412, 1.040637, 1.213113, 0, 0.4235294, 1, 1,
0.244345, 0.5136345, 0.09083251, 0, 0.4196078, 1, 1,
0.2464838, -0.4725497, 3.892081, 0, 0.4117647, 1, 1,
0.2470309, -1.832304, 1.409639, 0, 0.4078431, 1, 1,
0.2491615, -1.091371, 2.730296, 0, 0.4, 1, 1,
0.2491917, -0.8677376, 1.237977, 0, 0.3921569, 1, 1,
0.2517085, 0.1769259, 0.2844363, 0, 0.3882353, 1, 1,
0.2523035, 0.5893207, 0.8472803, 0, 0.3803922, 1, 1,
0.2554585, -0.3400172, 2.413987, 0, 0.3764706, 1, 1,
0.2564565, 0.2904124, 2.012189, 0, 0.3686275, 1, 1,
0.2676587, -0.7001917, 1.08148, 0, 0.3647059, 1, 1,
0.270615, -0.6752039, 2.915964, 0, 0.3568628, 1, 1,
0.273863, 1.778092, -0.2612431, 0, 0.3529412, 1, 1,
0.2739242, 0.9312673, -0.2270501, 0, 0.345098, 1, 1,
0.276337, -0.4230769, 1.980529, 0, 0.3411765, 1, 1,
0.2782973, 1.04794, -0.07033947, 0, 0.3333333, 1, 1,
0.2798616, 1.469548, 0.08671183, 0, 0.3294118, 1, 1,
0.2880607, 0.2547161, -0.8204952, 0, 0.3215686, 1, 1,
0.2881842, -0.6152379, 3.697898, 0, 0.3176471, 1, 1,
0.2921507, 0.7658122, 1.553521, 0, 0.3098039, 1, 1,
0.2931945, 0.9480875, 0.5756032, 0, 0.3058824, 1, 1,
0.2949918, -1.187632, 3.085805, 0, 0.2980392, 1, 1,
0.2959663, 0.372021, 0.7095795, 0, 0.2901961, 1, 1,
0.3002471, 0.0331578, 2.946585, 0, 0.2862745, 1, 1,
0.3042418, 0.4463819, 0.9422451, 0, 0.2784314, 1, 1,
0.3055487, -1.326854, 3.018058, 0, 0.2745098, 1, 1,
0.3058727, -0.2890501, 2.658112, 0, 0.2666667, 1, 1,
0.3083623, 1.180331, -0.49782, 0, 0.2627451, 1, 1,
0.3111271, -1.378377, 3.538362, 0, 0.254902, 1, 1,
0.3143303, -0.2732657, 2.15419, 0, 0.2509804, 1, 1,
0.3176641, -0.6562155, 2.128339, 0, 0.2431373, 1, 1,
0.3178137, -1.061534, 3.468139, 0, 0.2392157, 1, 1,
0.3200998, -1.285818, 4.759952, 0, 0.2313726, 1, 1,
0.3203143, 0.2230857, 0.681684, 0, 0.227451, 1, 1,
0.3233309, -1.140551, 2.974805, 0, 0.2196078, 1, 1,
0.3255029, 0.3794904, 0.1370497, 0, 0.2156863, 1, 1,
0.3256395, 1.628684, 0.3255676, 0, 0.2078431, 1, 1,
0.3329353, -0.9265424, 4.63757, 0, 0.2039216, 1, 1,
0.3337783, -1.106273, 1.574075, 0, 0.1960784, 1, 1,
0.3426233, -0.890956, 1.663417, 0, 0.1882353, 1, 1,
0.342636, -0.2515614, 2.786869, 0, 0.1843137, 1, 1,
0.3480724, 1.129499, -0.4768485, 0, 0.1764706, 1, 1,
0.3546352, -0.1357183, 1.742723, 0, 0.172549, 1, 1,
0.3551034, -0.4618193, 2.915428, 0, 0.1647059, 1, 1,
0.3566811, 0.583532, 0.5943587, 0, 0.1607843, 1, 1,
0.3602289, 2.097048, 1.168595, 0, 0.1529412, 1, 1,
0.3608529, 1.395395, -1.184617, 0, 0.1490196, 1, 1,
0.3612094, 0.3814562, 0.3830937, 0, 0.1411765, 1, 1,
0.3661135, 0.6659249, 0.1665121, 0, 0.1372549, 1, 1,
0.3707047, -0.9906301, 3.118755, 0, 0.1294118, 1, 1,
0.3707896, -0.7112009, 4.660685, 0, 0.1254902, 1, 1,
0.3727634, -0.9378691, 3.395117, 0, 0.1176471, 1, 1,
0.3738975, 1.137312, 1.008616, 0, 0.1137255, 1, 1,
0.3760606, 1.273422, -0.185913, 0, 0.1058824, 1, 1,
0.3769265, 0.9637119, -1.021859, 0, 0.09803922, 1, 1,
0.3836496, -0.6230788, 1.796838, 0, 0.09411765, 1, 1,
0.3839193, -0.8759317, 3.499628, 0, 0.08627451, 1, 1,
0.3847395, -2.403858, 3.685164, 0, 0.08235294, 1, 1,
0.3921082, -0.197396, 1.162583, 0, 0.07450981, 1, 1,
0.3942159, 0.5916768, 1.117524, 0, 0.07058824, 1, 1,
0.3960797, 0.5576974, -1.215252, 0, 0.0627451, 1, 1,
0.3982501, -0.5636287, 1.952854, 0, 0.05882353, 1, 1,
0.4011787, 0.3493293, 0.8914179, 0, 0.05098039, 1, 1,
0.4024962, -2.022679, 2.974234, 0, 0.04705882, 1, 1,
0.4029353, -0.343688, 0.7601241, 0, 0.03921569, 1, 1,
0.4033059, -0.294526, 2.489721, 0, 0.03529412, 1, 1,
0.4039985, -1.147115, 2.442016, 0, 0.02745098, 1, 1,
0.404833, -1.025045, 3.485678, 0, 0.02352941, 1, 1,
0.4078852, -1.483508, 3.094375, 0, 0.01568628, 1, 1,
0.4113929, 1.481383, 0.8336535, 0, 0.01176471, 1, 1,
0.4139302, 0.2179452, 2.029578, 0, 0.003921569, 1, 1,
0.4142886, -1.214771, 4.155051, 0.003921569, 0, 1, 1,
0.4168594, 0.3070135, -1.623764, 0.007843138, 0, 1, 1,
0.4187776, 0.1859172, 1.672521, 0.01568628, 0, 1, 1,
0.4205051, 0.5605607, -2.315926, 0.01960784, 0, 1, 1,
0.4254156, -0.02303689, 0.869273, 0.02745098, 0, 1, 1,
0.4260491, -0.6603497, 2.542683, 0.03137255, 0, 1, 1,
0.4261403, 0.7871418, 0.6666961, 0.03921569, 0, 1, 1,
0.4267685, 0.7226434, 0.9510074, 0.04313726, 0, 1, 1,
0.4286025, 1.655945, -0.1069795, 0.05098039, 0, 1, 1,
0.4296863, -1.015731, 2.042689, 0.05490196, 0, 1, 1,
0.4300902, 0.9418951, -1.033429, 0.0627451, 0, 1, 1,
0.4318569, 1.387879, -1.748069, 0.06666667, 0, 1, 1,
0.4320357, -1.078014, 3.830472, 0.07450981, 0, 1, 1,
0.4431589, -1.780396, 3.640004, 0.07843138, 0, 1, 1,
0.4432689, -0.4854832, 2.484807, 0.08627451, 0, 1, 1,
0.4434557, 0.4343274, 1.01335, 0.09019608, 0, 1, 1,
0.4545675, -0.2609198, 2.682728, 0.09803922, 0, 1, 1,
0.4561495, -0.1087582, 1.40203, 0.1058824, 0, 1, 1,
0.4579564, -0.4290965, 2.284911, 0.1098039, 0, 1, 1,
0.4595318, -0.266751, 1.048682, 0.1176471, 0, 1, 1,
0.4607534, -1.195604, 1.982289, 0.1215686, 0, 1, 1,
0.4634962, 0.7922174, -0.9997707, 0.1294118, 0, 1, 1,
0.4640139, 0.05175947, 0.3917506, 0.1333333, 0, 1, 1,
0.4670178, -0.8956353, 2.472674, 0.1411765, 0, 1, 1,
0.4728825, 0.3775612, 2.443579, 0.145098, 0, 1, 1,
0.4814141, -0.3094538, 1.51824, 0.1529412, 0, 1, 1,
0.4864927, 0.6985905, 0.2270493, 0.1568628, 0, 1, 1,
0.4880049, -1.246946, 2.596145, 0.1647059, 0, 1, 1,
0.4929878, 2.069112, 2.158107, 0.1686275, 0, 1, 1,
0.4993235, -1.538107, 1.244202, 0.1764706, 0, 1, 1,
0.502095, 2.443769, -1.255985, 0.1803922, 0, 1, 1,
0.5034834, -0.7569624, 1.921845, 0.1882353, 0, 1, 1,
0.5038819, -1.092321, 2.559035, 0.1921569, 0, 1, 1,
0.5101786, -0.1859436, 1.50016, 0.2, 0, 1, 1,
0.5112661, -0.1075143, 2.929917, 0.2078431, 0, 1, 1,
0.5179533, -0.1298328, 1.76779, 0.2117647, 0, 1, 1,
0.5187285, -0.8722671, 2.247246, 0.2196078, 0, 1, 1,
0.5203393, 0.09841163, 0.7098475, 0.2235294, 0, 1, 1,
0.5208894, 1.95922, 0.8349161, 0.2313726, 0, 1, 1,
0.5265858, 0.9823985, 0.8393107, 0.2352941, 0, 1, 1,
0.5287909, -0.2219813, 1.85378, 0.2431373, 0, 1, 1,
0.5328795, 0.384031, 1.148551, 0.2470588, 0, 1, 1,
0.5355556, 0.7873323, -0.1514056, 0.254902, 0, 1, 1,
0.5411505, -1.329563, 2.977443, 0.2588235, 0, 1, 1,
0.5434832, 0.9941444, 0.1096831, 0.2666667, 0, 1, 1,
0.5481741, -0.2664919, 1.554244, 0.2705882, 0, 1, 1,
0.5566546, -0.9601239, 3.453271, 0.2784314, 0, 1, 1,
0.5575034, -0.5544454, 2.476467, 0.282353, 0, 1, 1,
0.5589884, 0.2985124, 1.174443, 0.2901961, 0, 1, 1,
0.5667963, 0.5793215, 0.3725711, 0.2941177, 0, 1, 1,
0.5690781, 1.151161, 0.4141374, 0.3019608, 0, 1, 1,
0.5818785, -0.7393594, 1.703446, 0.3098039, 0, 1, 1,
0.5819733, -1.161907, 2.978429, 0.3137255, 0, 1, 1,
0.5833297, 0.8248031, -0.2761089, 0.3215686, 0, 1, 1,
0.5871874, -0.377352, 1.194179, 0.3254902, 0, 1, 1,
0.5881643, 0.7405695, 0.1168672, 0.3333333, 0, 1, 1,
0.5937079, 0.2342118, -0.3229679, 0.3372549, 0, 1, 1,
0.5951098, -1.451097, 1.752342, 0.345098, 0, 1, 1,
0.5955431, -1.783855, 4.943987, 0.3490196, 0, 1, 1,
0.5958347, 0.2733907, 1.999915, 0.3568628, 0, 1, 1,
0.5964074, -0.4304311, 2.597288, 0.3607843, 0, 1, 1,
0.6019035, 2.483086, 0.4104139, 0.3686275, 0, 1, 1,
0.6022081, -0.7015931, 2.397337, 0.372549, 0, 1, 1,
0.6037437, 2.233357, -0.4905578, 0.3803922, 0, 1, 1,
0.6044691, -0.821058, 1.889987, 0.3843137, 0, 1, 1,
0.6069956, 0.9730502, 0.3404467, 0.3921569, 0, 1, 1,
0.6072121, -0.3079915, 2.062686, 0.3960784, 0, 1, 1,
0.6115909, 0.3014667, 0.3300267, 0.4039216, 0, 1, 1,
0.6117253, 0.4286544, 1.3649, 0.4117647, 0, 1, 1,
0.6143673, -0.02775643, 2.814528, 0.4156863, 0, 1, 1,
0.6145526, 0.8282119, 0.6397594, 0.4235294, 0, 1, 1,
0.6158627, -1.506155, 2.727007, 0.427451, 0, 1, 1,
0.6171405, 0.2316131, 0.6348004, 0.4352941, 0, 1, 1,
0.6193845, -0.2583324, 1.245148, 0.4392157, 0, 1, 1,
0.6199313, 0.3758544, 3.146687, 0.4470588, 0, 1, 1,
0.6213105, -0.7101549, 1.27348, 0.4509804, 0, 1, 1,
0.6351694, 2.698852, 0.1688018, 0.4588235, 0, 1, 1,
0.6354525, -1.102341, 2.973392, 0.4627451, 0, 1, 1,
0.6389092, 1.931085, 0.5238773, 0.4705882, 0, 1, 1,
0.6461124, -0.283882, 3.071595, 0.4745098, 0, 1, 1,
0.6484314, 0.1617322, 0.9823105, 0.4823529, 0, 1, 1,
0.6486816, 1.045479, 0.7385232, 0.4862745, 0, 1, 1,
0.6486835, -0.951865, 4.09903, 0.4941176, 0, 1, 1,
0.6558601, 0.4480689, 0.2769763, 0.5019608, 0, 1, 1,
0.662708, 0.3465007, 0.07109299, 0.5058824, 0, 1, 1,
0.6630915, 0.1679194, 2.662194, 0.5137255, 0, 1, 1,
0.6653146, 0.4798326, 1.836743, 0.5176471, 0, 1, 1,
0.6784329, -0.6286693, 0.4340365, 0.5254902, 0, 1, 1,
0.678849, 1.649901, 1.261484, 0.5294118, 0, 1, 1,
0.6822494, 1.327731, -0.4658084, 0.5372549, 0, 1, 1,
0.6843973, 0.47774, 1.086668, 0.5411765, 0, 1, 1,
0.6853629, 1.48923, 0.8253144, 0.5490196, 0, 1, 1,
0.6862231, -1.867591, 3.405342, 0.5529412, 0, 1, 1,
0.6879323, -0.4821802, 2.750463, 0.5607843, 0, 1, 1,
0.6959779, -0.1698965, 1.999806, 0.5647059, 0, 1, 1,
0.6994031, -1.512893, 2.689282, 0.572549, 0, 1, 1,
0.7043651, -0.4648698, 0.01836966, 0.5764706, 0, 1, 1,
0.7127958, -1.140403, 3.211626, 0.5843138, 0, 1, 1,
0.7158157, -0.2995023, 1.360481, 0.5882353, 0, 1, 1,
0.7169148, -0.7286676, 1.923701, 0.5960785, 0, 1, 1,
0.7251934, -0.3665599, 0.1657056, 0.6039216, 0, 1, 1,
0.7253915, -0.3713396, 0.7905854, 0.6078432, 0, 1, 1,
0.7273536, 0.7607383, 0.4076384, 0.6156863, 0, 1, 1,
0.7333849, 0.8547982, 0.5130986, 0.6196079, 0, 1, 1,
0.7352755, 1.199907, 0.008236001, 0.627451, 0, 1, 1,
0.7405974, -0.3707672, 2.905631, 0.6313726, 0, 1, 1,
0.7418191, 0.3593052, 2.061638, 0.6392157, 0, 1, 1,
0.7424799, 0.2338962, 0.1450642, 0.6431373, 0, 1, 1,
0.7522238, 0.1775629, 1.966563, 0.6509804, 0, 1, 1,
0.7523132, 1.860153, -0.9464672, 0.654902, 0, 1, 1,
0.7663237, -0.385752, 2.785954, 0.6627451, 0, 1, 1,
0.7671486, -0.06833649, 2.447107, 0.6666667, 0, 1, 1,
0.7693914, -0.1033666, 0.4361744, 0.6745098, 0, 1, 1,
0.7729433, 1.537108, -0.9879584, 0.6784314, 0, 1, 1,
0.7842057, 2.031214, -0.3755434, 0.6862745, 0, 1, 1,
0.7871837, 1.376047, 1.026133, 0.6901961, 0, 1, 1,
0.7904851, -0.1430118, 2.346303, 0.6980392, 0, 1, 1,
0.8014721, -0.4154386, 1.12687, 0.7058824, 0, 1, 1,
0.8033376, 1.516002, 0.1113617, 0.7098039, 0, 1, 1,
0.8034161, 0.7538367, 1.071813, 0.7176471, 0, 1, 1,
0.8036575, 0.1179035, 1.262248, 0.7215686, 0, 1, 1,
0.8050283, 0.5466812, -0.5529325, 0.7294118, 0, 1, 1,
0.8117695, 0.58233, 0.87174, 0.7333333, 0, 1, 1,
0.8128046, -0.9743919, 3.188937, 0.7411765, 0, 1, 1,
0.8142067, 1.069479, -0.07581692, 0.7450981, 0, 1, 1,
0.8149621, 0.7858212, 1.570781, 0.7529412, 0, 1, 1,
0.8159213, 0.5271865, 2.369162, 0.7568628, 0, 1, 1,
0.8208476, 0.7778677, -0.1973052, 0.7647059, 0, 1, 1,
0.8221444, 0.1222736, 0.6195203, 0.7686275, 0, 1, 1,
0.8244451, 0.444659, 0.285659, 0.7764706, 0, 1, 1,
0.8252626, 0.2939926, 1.448288, 0.7803922, 0, 1, 1,
0.8264806, -0.4934752, 1.658452, 0.7882353, 0, 1, 1,
0.8308342, -0.2636346, 1.965534, 0.7921569, 0, 1, 1,
0.8406667, -0.5769337, 1.681401, 0.8, 0, 1, 1,
0.8406681, -0.5296453, 2.226197, 0.8078431, 0, 1, 1,
0.8418087, -0.6252782, 1.370538, 0.8117647, 0, 1, 1,
0.8543212, 0.3052088, 3.728415, 0.8196079, 0, 1, 1,
0.8599052, -0.1007691, 1.848692, 0.8235294, 0, 1, 1,
0.8602797, -0.6302296, 3.230539, 0.8313726, 0, 1, 1,
0.865957, -0.7365839, 3.547953, 0.8352941, 0, 1, 1,
0.8699764, -1.21645, 4.403226, 0.8431373, 0, 1, 1,
0.8738046, -1.367123, 1.481249, 0.8470588, 0, 1, 1,
0.8805499, 1.337437, 0.6263377, 0.854902, 0, 1, 1,
0.881591, 1.102556, 0.9103467, 0.8588235, 0, 1, 1,
0.8864235, -1.190661, 2.287955, 0.8666667, 0, 1, 1,
0.8894628, -0.4853034, 1.807361, 0.8705882, 0, 1, 1,
0.8913627, 0.481643, -0.009053841, 0.8784314, 0, 1, 1,
0.8925501, 0.2810046, 2.264291, 0.8823529, 0, 1, 1,
0.8931467, 0.1945173, 3.007084, 0.8901961, 0, 1, 1,
0.8933754, 0.4094786, 1.646304, 0.8941177, 0, 1, 1,
0.8944973, 0.203647, 1.797685, 0.9019608, 0, 1, 1,
0.8995951, 0.01505716, 2.714251, 0.9098039, 0, 1, 1,
0.899816, -0.8120857, 1.799031, 0.9137255, 0, 1, 1,
0.9042064, 0.3927428, -0.2966309, 0.9215686, 0, 1, 1,
0.9044193, 0.5593041, 0.4091388, 0.9254902, 0, 1, 1,
0.9078213, -2.017141, 3.641168, 0.9333333, 0, 1, 1,
0.9092268, -0.3110048, 1.73432, 0.9372549, 0, 1, 1,
0.9147105, -0.9043635, 3.204889, 0.945098, 0, 1, 1,
0.91478, -0.1712927, 2.277575, 0.9490196, 0, 1, 1,
0.9153277, -1.528705, 0.9356769, 0.9568627, 0, 1, 1,
0.9168019, 1.052988, 2.234353, 0.9607843, 0, 1, 1,
0.9305982, 0.2748674, -0.940932, 0.9686275, 0, 1, 1,
0.9307948, -0.2473419, 0.3109773, 0.972549, 0, 1, 1,
0.9335232, -1.488336, 1.247334, 0.9803922, 0, 1, 1,
0.9344416, 1.25434, -0.480113, 0.9843137, 0, 1, 1,
0.9507018, -1.177694, 3.605585, 0.9921569, 0, 1, 1,
0.9519879, -1.231553, 2.757491, 0.9960784, 0, 1, 1,
0.9528655, -0.240653, 3.041866, 1, 0, 0.9960784, 1,
0.9534919, -0.4903752, 3.378648, 1, 0, 0.9882353, 1,
0.9590896, -1.6267, 2.049865, 1, 0, 0.9843137, 1,
0.9591727, 0.02761207, 1.856763, 1, 0, 0.9764706, 1,
0.9634355, 0.3726418, 1.138335, 1, 0, 0.972549, 1,
0.9664354, 0.5075141, 1.013826, 1, 0, 0.9647059, 1,
0.9672489, -1.055945, 4.709574, 1, 0, 0.9607843, 1,
0.9694069, 0.3815261, 0.5932879, 1, 0, 0.9529412, 1,
0.9701352, -0.8191621, 2.064934, 1, 0, 0.9490196, 1,
0.9733919, -1.075303, 2.10152, 1, 0, 0.9411765, 1,
0.9806105, 0.6678948, 0.2579335, 1, 0, 0.9372549, 1,
0.9824515, 0.2662986, 1.626395, 1, 0, 0.9294118, 1,
0.9828724, 0.1346189, 1.066541, 1, 0, 0.9254902, 1,
0.9894806, 1.449971, 1.255648, 1, 0, 0.9176471, 1,
0.9902637, 0.6482403, -0.3154559, 1, 0, 0.9137255, 1,
0.9916291, -1.027104, 2.336756, 1, 0, 0.9058824, 1,
0.9955438, 0.03729724, 0.1936425, 1, 0, 0.9019608, 1,
0.9980347, 0.7352639, 1.001777, 1, 0, 0.8941177, 1,
1.008113, -1.48296, 3.531486, 1, 0, 0.8862745, 1,
1.011852, -1.983998, 1.85003, 1, 0, 0.8823529, 1,
1.01485, 0.07128271, 0.2862802, 1, 0, 0.8745098, 1,
1.017495, 2.285548, 0.6623758, 1, 0, 0.8705882, 1,
1.023328, 0.9088178, 0.2919005, 1, 0, 0.8627451, 1,
1.032066, -0.04947127, 3.122761, 1, 0, 0.8588235, 1,
1.045514, 0.5039483, 0.952937, 1, 0, 0.8509804, 1,
1.047211, -0.2441906, 1.011814, 1, 0, 0.8470588, 1,
1.049423, -1.865149, 2.328842, 1, 0, 0.8392157, 1,
1.051968, 0.8100591, 0.9046347, 1, 0, 0.8352941, 1,
1.052599, -0.09052595, 2.859835, 1, 0, 0.827451, 1,
1.053265, -0.8228949, 2.817124, 1, 0, 0.8235294, 1,
1.05365, -0.5220304, 0.904124, 1, 0, 0.8156863, 1,
1.058095, 0.1308246, 2.818872, 1, 0, 0.8117647, 1,
1.059766, 0.03003935, -0.2031614, 1, 0, 0.8039216, 1,
1.060562, -0.3200976, 1.031146, 1, 0, 0.7960784, 1,
1.062334, -0.3570907, 1.819326, 1, 0, 0.7921569, 1,
1.062497, 0.1136437, 2.831849, 1, 0, 0.7843137, 1,
1.067988, 0.514987, 1.005656, 1, 0, 0.7803922, 1,
1.074758, 0.7681245, 1.530557, 1, 0, 0.772549, 1,
1.077181, -1.415655, 3.948793, 1, 0, 0.7686275, 1,
1.079132, -1.03784, 2.45462, 1, 0, 0.7607843, 1,
1.086723, -0.01026463, 0.4054986, 1, 0, 0.7568628, 1,
1.089327, 1.941957, 0.6585441, 1, 0, 0.7490196, 1,
1.093734, -0.08273448, 0.6042731, 1, 0, 0.7450981, 1,
1.097261, 0.1708718, 2.606767, 1, 0, 0.7372549, 1,
1.111177, 1.117328, 1.557697, 1, 0, 0.7333333, 1,
1.115422, -2.205159, 2.414015, 1, 0, 0.7254902, 1,
1.120874, -0.4451361, 1.994409, 1, 0, 0.7215686, 1,
1.123621, -0.4950108, 1.031722, 1, 0, 0.7137255, 1,
1.129003, 1.288905, 0.91294, 1, 0, 0.7098039, 1,
1.134108, -1.589256, 3.256054, 1, 0, 0.7019608, 1,
1.138487, -1.037347, 1.940675, 1, 0, 0.6941177, 1,
1.139802, 1.027068, 1.680081, 1, 0, 0.6901961, 1,
1.143465, 1.431383, 0.4792953, 1, 0, 0.682353, 1,
1.144726, -0.03187342, 1.545468, 1, 0, 0.6784314, 1,
1.147049, 0.7217692, 0.7464344, 1, 0, 0.6705883, 1,
1.147072, -0.2883823, 0.7042753, 1, 0, 0.6666667, 1,
1.172119, -0.1699202, 1.759467, 1, 0, 0.6588235, 1,
1.179896, -0.9006364, 1.697828, 1, 0, 0.654902, 1,
1.181963, 0.5696579, 1.875351, 1, 0, 0.6470588, 1,
1.186527, 0.5901436, 0.1543086, 1, 0, 0.6431373, 1,
1.192465, -0.6812567, 0.6592661, 1, 0, 0.6352941, 1,
1.192639, 0.2082477, 1.341226, 1, 0, 0.6313726, 1,
1.193651, 0.5813629, 1.331403, 1, 0, 0.6235294, 1,
1.197442, 0.6654439, 3.305764, 1, 0, 0.6196079, 1,
1.197711, -0.3648677, 2.338463, 1, 0, 0.6117647, 1,
1.198987, -0.4948362, -0.4260562, 1, 0, 0.6078432, 1,
1.206688, -1.370755, 2.450349, 1, 0, 0.6, 1,
1.216081, -1.338104, 2.546197, 1, 0, 0.5921569, 1,
1.219614, 0.2843775, 1.226192, 1, 0, 0.5882353, 1,
1.224882, 0.868663, -1.523636, 1, 0, 0.5803922, 1,
1.228818, -1.419924, 4.380242, 1, 0, 0.5764706, 1,
1.233842, -0.3734096, 2.160928, 1, 0, 0.5686275, 1,
1.23811, -1.325857, 2.636707, 1, 0, 0.5647059, 1,
1.238479, -0.06556488, 1.450287, 1, 0, 0.5568628, 1,
1.248441, 0.739666, 1.770448, 1, 0, 0.5529412, 1,
1.253561, -1.269542, 1.225542, 1, 0, 0.5450981, 1,
1.264704, -1.747279, 2.482592, 1, 0, 0.5411765, 1,
1.273334, 0.7951558, -0.247975, 1, 0, 0.5333334, 1,
1.281317, 2.251779, 0.4967763, 1, 0, 0.5294118, 1,
1.290328, -0.4290641, 1.953215, 1, 0, 0.5215687, 1,
1.306733, 1.761781, -0.7505047, 1, 0, 0.5176471, 1,
1.3119, 0.5532678, 1.563303, 1, 0, 0.509804, 1,
1.323818, 0.08080678, -1.078296, 1, 0, 0.5058824, 1,
1.327294, 1.577402, 0.6361628, 1, 0, 0.4980392, 1,
1.338712, -1.179162, 1.732299, 1, 0, 0.4901961, 1,
1.340271, -0.008257035, -0.05172503, 1, 0, 0.4862745, 1,
1.351672, -0.775554, 3.167377, 1, 0, 0.4784314, 1,
1.355651, -0.2453251, 3.133236, 1, 0, 0.4745098, 1,
1.356941, 2.105356, 1.53747, 1, 0, 0.4666667, 1,
1.375932, 0.4353747, 1.886498, 1, 0, 0.4627451, 1,
1.384124, 0.5805119, 1.702938, 1, 0, 0.454902, 1,
1.389812, -0.4171821, 1.347267, 1, 0, 0.4509804, 1,
1.397406, 1.968144, 2.383024, 1, 0, 0.4431373, 1,
1.398411, -1.981092, 2.055352, 1, 0, 0.4392157, 1,
1.414431, 1.67574, 1.297004, 1, 0, 0.4313726, 1,
1.435179, -2.052707, 2.513675, 1, 0, 0.427451, 1,
1.459178, 0.2010121, 0.07823623, 1, 0, 0.4196078, 1,
1.466605, -0.2077181, 1.847896, 1, 0, 0.4156863, 1,
1.467124, 1.413201, 0.8840888, 1, 0, 0.4078431, 1,
1.491926, -1.374474, 3.30276, 1, 0, 0.4039216, 1,
1.494493, 0.9601744, 1.123278, 1, 0, 0.3960784, 1,
1.497608, -0.9682229, 3.170024, 1, 0, 0.3882353, 1,
1.518798, 2.57186, 1.209861, 1, 0, 0.3843137, 1,
1.520158, 0.6510327, 0.6305505, 1, 0, 0.3764706, 1,
1.538928, -1.029603, 1.243828, 1, 0, 0.372549, 1,
1.541451, 0.3120074, 2.937117, 1, 0, 0.3647059, 1,
1.546087, -0.4636615, 1.554246, 1, 0, 0.3607843, 1,
1.556526, -0.3989094, 0.8113846, 1, 0, 0.3529412, 1,
1.565068, 0.1624733, 1.354389, 1, 0, 0.3490196, 1,
1.576378, 0.3698388, 0.6023919, 1, 0, 0.3411765, 1,
1.596848, -0.4581608, 3.019477, 1, 0, 0.3372549, 1,
1.599798, 1.10205, 0.9156497, 1, 0, 0.3294118, 1,
1.608148, -0.5239662, 1.249061, 1, 0, 0.3254902, 1,
1.614287, -0.1719116, 3.157847, 1, 0, 0.3176471, 1,
1.617367, 1.26584, 0.02173146, 1, 0, 0.3137255, 1,
1.620683, -0.9747339, 3.777611, 1, 0, 0.3058824, 1,
1.621355, 0.05712895, 1.842717, 1, 0, 0.2980392, 1,
1.624028, -0.0365798, 0.5300372, 1, 0, 0.2941177, 1,
1.65683, 0.1949955, 2.43755, 1, 0, 0.2862745, 1,
1.65834, 0.05197442, 3.529822, 1, 0, 0.282353, 1,
1.662992, -1.848767, 1.975412, 1, 0, 0.2745098, 1,
1.677359, 0.3069641, 2.620319, 1, 0, 0.2705882, 1,
1.679743, 0.6802367, 0.4170734, 1, 0, 0.2627451, 1,
1.690188, -0.3952602, 1.14423, 1, 0, 0.2588235, 1,
1.726569, -1.972798, 0.7969223, 1, 0, 0.2509804, 1,
1.729284, 0.4839464, 0.5933057, 1, 0, 0.2470588, 1,
1.739732, -0.5953937, 1.196936, 1, 0, 0.2392157, 1,
1.74202, 1.512544, 1.659981, 1, 0, 0.2352941, 1,
1.747474, 1.233357, 1.236185, 1, 0, 0.227451, 1,
1.750373, -0.5914507, -0.2494315, 1, 0, 0.2235294, 1,
1.753216, 0.2708353, 2.522173, 1, 0, 0.2156863, 1,
1.763014, -0.5863289, 0.8127003, 1, 0, 0.2117647, 1,
1.787297, 1.254103, 0.863188, 1, 0, 0.2039216, 1,
1.790321, -0.5833503, 2.014159, 1, 0, 0.1960784, 1,
1.812796, -0.3842595, 2.818869, 1, 0, 0.1921569, 1,
1.831674, 1.586744, -0.3022191, 1, 0, 0.1843137, 1,
1.838953, -0.1897414, 1.422836, 1, 0, 0.1803922, 1,
1.851462, -0.7834448, 1.297219, 1, 0, 0.172549, 1,
1.856826, -2.500564, 0.2136468, 1, 0, 0.1686275, 1,
1.868361, -0.7877674, 2.392341, 1, 0, 0.1607843, 1,
1.870739, 0.1267082, 2.739081, 1, 0, 0.1568628, 1,
1.874767, 0.8435084, 0.6440775, 1, 0, 0.1490196, 1,
1.892974, 0.5628845, 1.13623, 1, 0, 0.145098, 1,
1.96015, -0.1408757, 1.780997, 1, 0, 0.1372549, 1,
1.965265, 0.1218207, 1.441466, 1, 0, 0.1333333, 1,
1.998495, 1.948786, 0.889389, 1, 0, 0.1254902, 1,
2.012935, -1.438706, 2.169082, 1, 0, 0.1215686, 1,
2.039037, 1.156107, 3.145854, 1, 0, 0.1137255, 1,
2.058077, 0.3478842, 1.240365, 1, 0, 0.1098039, 1,
2.060852, 0.7413621, 2.538348, 1, 0, 0.1019608, 1,
2.061403, -1.572969, 2.498499, 1, 0, 0.09411765, 1,
2.061753, 1.247318, 1.122472, 1, 0, 0.09019608, 1,
2.08289, -0.03287549, 2.347085, 1, 0, 0.08235294, 1,
2.088754, -0.7293919, 1.187132, 1, 0, 0.07843138, 1,
2.098027, -0.6400691, 1.353859, 1, 0, 0.07058824, 1,
2.129297, -1.016136, 1.715849, 1, 0, 0.06666667, 1,
2.150988, 0.3855845, 1.041925, 1, 0, 0.05882353, 1,
2.151567, 0.8100211, -0.01483317, 1, 0, 0.05490196, 1,
2.161785, 0.6374963, 0.2559801, 1, 0, 0.04705882, 1,
2.287496, 1.459452, -0.5841559, 1, 0, 0.04313726, 1,
2.30032, 0.9136209, 0.8031867, 1, 0, 0.03529412, 1,
2.482008, 0.314448, 1.451708, 1, 0, 0.03137255, 1,
2.518169, 0.6468335, 1.294775, 1, 0, 0.02352941, 1,
2.665123, -0.8195329, 1.403814, 1, 0, 0.01960784, 1,
2.803839, 1.039289, 0.8453358, 1, 0, 0.01176471, 1,
2.92419, -0.227164, 0.8523859, 1, 0, 0.007843138, 1
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
-0.2737124, -3.939037, -7.687817, 0, -0.5, 0.5, 0.5,
-0.2737124, -3.939037, -7.687817, 1, -0.5, 0.5, 0.5,
-0.2737124, -3.939037, -7.687817, 1, 1.5, 0.5, 0.5,
-0.2737124, -3.939037, -7.687817, 0, 1.5, 0.5, 0.5
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
-4.555704, 0.1708028, -7.687817, 0, -0.5, 0.5, 0.5,
-4.555704, 0.1708028, -7.687817, 1, -0.5, 0.5, 0.5,
-4.555704, 0.1708028, -7.687817, 1, 1.5, 0.5, 0.5,
-4.555704, 0.1708028, -7.687817, 0, 1.5, 0.5, 0.5
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
-4.555704, -3.939037, 0.07041216, 0, -0.5, 0.5, 0.5,
-4.555704, -3.939037, 0.07041216, 1, -0.5, 0.5, 0.5,
-4.555704, -3.939037, 0.07041216, 1, 1.5, 0.5, 0.5,
-4.555704, -3.939037, 0.07041216, 0, 1.5, 0.5, 0.5
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
-3, -2.990612, -5.897456,
2, -2.990612, -5.897456,
-3, -2.990612, -5.897456,
-3, -3.148683, -6.195849,
-2, -2.990612, -5.897456,
-2, -3.148683, -6.195849,
-1, -2.990612, -5.897456,
-1, -3.148683, -6.195849,
0, -2.990612, -5.897456,
0, -3.148683, -6.195849,
1, -2.990612, -5.897456,
1, -3.148683, -6.195849,
2, -2.990612, -5.897456,
2, -3.148683, -6.195849
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
-3, -3.464824, -6.792636, 0, -0.5, 0.5, 0.5,
-3, -3.464824, -6.792636, 1, -0.5, 0.5, 0.5,
-3, -3.464824, -6.792636, 1, 1.5, 0.5, 0.5,
-3, -3.464824, -6.792636, 0, 1.5, 0.5, 0.5,
-2, -3.464824, -6.792636, 0, -0.5, 0.5, 0.5,
-2, -3.464824, -6.792636, 1, -0.5, 0.5, 0.5,
-2, -3.464824, -6.792636, 1, 1.5, 0.5, 0.5,
-2, -3.464824, -6.792636, 0, 1.5, 0.5, 0.5,
-1, -3.464824, -6.792636, 0, -0.5, 0.5, 0.5,
-1, -3.464824, -6.792636, 1, -0.5, 0.5, 0.5,
-1, -3.464824, -6.792636, 1, 1.5, 0.5, 0.5,
-1, -3.464824, -6.792636, 0, 1.5, 0.5, 0.5,
0, -3.464824, -6.792636, 0, -0.5, 0.5, 0.5,
0, -3.464824, -6.792636, 1, -0.5, 0.5, 0.5,
0, -3.464824, -6.792636, 1, 1.5, 0.5, 0.5,
0, -3.464824, -6.792636, 0, 1.5, 0.5, 0.5,
1, -3.464824, -6.792636, 0, -0.5, 0.5, 0.5,
1, -3.464824, -6.792636, 1, -0.5, 0.5, 0.5,
1, -3.464824, -6.792636, 1, 1.5, 0.5, 0.5,
1, -3.464824, -6.792636, 0, 1.5, 0.5, 0.5,
2, -3.464824, -6.792636, 0, -0.5, 0.5, 0.5,
2, -3.464824, -6.792636, 1, -0.5, 0.5, 0.5,
2, -3.464824, -6.792636, 1, 1.5, 0.5, 0.5,
2, -3.464824, -6.792636, 0, 1.5, 0.5, 0.5
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
-3.567552, -2, -5.897456,
-3.567552, 3, -5.897456,
-3.567552, -2, -5.897456,
-3.732244, -2, -6.195849,
-3.567552, -1, -5.897456,
-3.732244, -1, -6.195849,
-3.567552, 0, -5.897456,
-3.732244, 0, -6.195849,
-3.567552, 1, -5.897456,
-3.732244, 1, -6.195849,
-3.567552, 2, -5.897456,
-3.732244, 2, -6.195849,
-3.567552, 3, -5.897456,
-3.732244, 3, -6.195849
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
-4.061627, -2, -6.792636, 0, -0.5, 0.5, 0.5,
-4.061627, -2, -6.792636, 1, -0.5, 0.5, 0.5,
-4.061627, -2, -6.792636, 1, 1.5, 0.5, 0.5,
-4.061627, -2, -6.792636, 0, 1.5, 0.5, 0.5,
-4.061627, -1, -6.792636, 0, -0.5, 0.5, 0.5,
-4.061627, -1, -6.792636, 1, -0.5, 0.5, 0.5,
-4.061627, -1, -6.792636, 1, 1.5, 0.5, 0.5,
-4.061627, -1, -6.792636, 0, 1.5, 0.5, 0.5,
-4.061627, 0, -6.792636, 0, -0.5, 0.5, 0.5,
-4.061627, 0, -6.792636, 1, -0.5, 0.5, 0.5,
-4.061627, 0, -6.792636, 1, 1.5, 0.5, 0.5,
-4.061627, 0, -6.792636, 0, 1.5, 0.5, 0.5,
-4.061627, 1, -6.792636, 0, -0.5, 0.5, 0.5,
-4.061627, 1, -6.792636, 1, -0.5, 0.5, 0.5,
-4.061627, 1, -6.792636, 1, 1.5, 0.5, 0.5,
-4.061627, 1, -6.792636, 0, 1.5, 0.5, 0.5,
-4.061627, 2, -6.792636, 0, -0.5, 0.5, 0.5,
-4.061627, 2, -6.792636, 1, -0.5, 0.5, 0.5,
-4.061627, 2, -6.792636, 1, 1.5, 0.5, 0.5,
-4.061627, 2, -6.792636, 0, 1.5, 0.5, 0.5,
-4.061627, 3, -6.792636, 0, -0.5, 0.5, 0.5,
-4.061627, 3, -6.792636, 1, -0.5, 0.5, 0.5,
-4.061627, 3, -6.792636, 1, 1.5, 0.5, 0.5,
-4.061627, 3, -6.792636, 0, 1.5, 0.5, 0.5
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
-3.567552, -2.990612, -4,
-3.567552, -2.990612, 4,
-3.567552, -2.990612, -4,
-3.732244, -3.148683, -4,
-3.567552, -2.990612, -2,
-3.732244, -3.148683, -2,
-3.567552, -2.990612, 0,
-3.732244, -3.148683, 0,
-3.567552, -2.990612, 2,
-3.732244, -3.148683, 2,
-3.567552, -2.990612, 4,
-3.732244, -3.148683, 4
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
-4.061627, -3.464824, -4, 0, -0.5, 0.5, 0.5,
-4.061627, -3.464824, -4, 1, -0.5, 0.5, 0.5,
-4.061627, -3.464824, -4, 1, 1.5, 0.5, 0.5,
-4.061627, -3.464824, -4, 0, 1.5, 0.5, 0.5,
-4.061627, -3.464824, -2, 0, -0.5, 0.5, 0.5,
-4.061627, -3.464824, -2, 1, -0.5, 0.5, 0.5,
-4.061627, -3.464824, -2, 1, 1.5, 0.5, 0.5,
-4.061627, -3.464824, -2, 0, 1.5, 0.5, 0.5,
-4.061627, -3.464824, 0, 0, -0.5, 0.5, 0.5,
-4.061627, -3.464824, 0, 1, -0.5, 0.5, 0.5,
-4.061627, -3.464824, 0, 1, 1.5, 0.5, 0.5,
-4.061627, -3.464824, 0, 0, 1.5, 0.5, 0.5,
-4.061627, -3.464824, 2, 0, -0.5, 0.5, 0.5,
-4.061627, -3.464824, 2, 1, -0.5, 0.5, 0.5,
-4.061627, -3.464824, 2, 1, 1.5, 0.5, 0.5,
-4.061627, -3.464824, 2, 0, 1.5, 0.5, 0.5,
-4.061627, -3.464824, 4, 0, -0.5, 0.5, 0.5,
-4.061627, -3.464824, 4, 1, -0.5, 0.5, 0.5,
-4.061627, -3.464824, 4, 1, 1.5, 0.5, 0.5,
-4.061627, -3.464824, 4, 0, 1.5, 0.5, 0.5
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
-3.567552, -2.990612, -5.897456,
-3.567552, 3.332218, -5.897456,
-3.567552, -2.990612, 6.03828,
-3.567552, 3.332218, 6.03828,
-3.567552, -2.990612, -5.897456,
-3.567552, -2.990612, 6.03828,
-3.567552, 3.332218, -5.897456,
-3.567552, 3.332218, 6.03828,
-3.567552, -2.990612, -5.897456,
3.020127, -2.990612, -5.897456,
-3.567552, -2.990612, 6.03828,
3.020127, -2.990612, 6.03828,
-3.567552, 3.332218, -5.897456,
3.020127, 3.332218, -5.897456,
-3.567552, 3.332218, 6.03828,
3.020127, 3.332218, 6.03828,
3.020127, -2.990612, -5.897456,
3.020127, 3.332218, -5.897456,
3.020127, -2.990612, 6.03828,
3.020127, 3.332218, 6.03828,
3.020127, -2.990612, -5.897456,
3.020127, -2.990612, 6.03828,
3.020127, 3.332218, -5.897456,
3.020127, 3.332218, 6.03828
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
var radius = 8.024602;
var distance = 35.70236;
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
mvMatrix.translate( 0.2737124, -0.1708028, -0.07041216 );
mvMatrix.scale( 1.317058, 1.372227, 0.7269226 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.70236);
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
Monoethylamine_Hydro<-read.table("Monoethylamine_Hydro.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Monoethylamine_Hydro$V2
```

```
## Error in eval(expr, envir, enclos): object 'Monoethylamine_Hydro' not found
```

```r
y<-Monoethylamine_Hydro$V3
```

```
## Error in eval(expr, envir, enclos): object 'Monoethylamine_Hydro' not found
```

```r
z<-Monoethylamine_Hydro$V4
```

```
## Error in eval(expr, envir, enclos): object 'Monoethylamine_Hydro' not found
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
-3.471615, 0.265951, -0.8487522, 0, 0, 1, 1, 1,
-3.039494, 0.8703692, -1.9206, 1, 0, 0, 1, 1,
-2.645579, 0.1807196, -3.084812, 1, 0, 0, 1, 1,
-2.541932, 0.9435446, -3.419957, 1, 0, 0, 1, 1,
-2.507209, -0.4078254, -1.327697, 1, 0, 0, 1, 1,
-2.460338, -0.1117767, -1.794431, 1, 0, 0, 1, 1,
-2.452925, -0.3084605, -2.315445, 0, 0, 0, 1, 1,
-2.366461, -2.758212, -2.30835, 0, 0, 0, 1, 1,
-2.224901, 1.21032, -1.141309, 0, 0, 0, 1, 1,
-2.206547, -0.3285953, -3.365852, 0, 0, 0, 1, 1,
-2.1481, 3.240138, -1.535784, 0, 0, 0, 1, 1,
-2.138224, -0.1836613, 0.7135454, 0, 0, 0, 1, 1,
-2.099628, -0.3512167, -2.247295, 0, 0, 0, 1, 1,
-2.057214, 0.473136, -1.00714, 1, 1, 1, 1, 1,
-2.003762, -0.5416366, -0.7864089, 1, 1, 1, 1, 1,
-1.950314, -1.200648, -4.039338, 1, 1, 1, 1, 1,
-1.93281, 0.6100412, 0.08777592, 1, 1, 1, 1, 1,
-1.932142, 0.6402824, -3.215131, 1, 1, 1, 1, 1,
-1.910207, -0.04964297, -1.140995, 1, 1, 1, 1, 1,
-1.88555, 0.08965392, -0.2890934, 1, 1, 1, 1, 1,
-1.866842, 1.748766, -1.564282, 1, 1, 1, 1, 1,
-1.859191, -0.2791539, -2.128334, 1, 1, 1, 1, 1,
-1.855712, -0.1560389, -0.6844108, 1, 1, 1, 1, 1,
-1.851204, -2.198995, -1.474063, 1, 1, 1, 1, 1,
-1.846283, 0.1114061, -1.269321, 1, 1, 1, 1, 1,
-1.845278, 1.589779, -3.01377, 1, 1, 1, 1, 1,
-1.835041, 1.062564, -0.854646, 1, 1, 1, 1, 1,
-1.806745, -0.6992511, -2.107025, 1, 1, 1, 1, 1,
-1.790981, -0.4498885, -0.8493242, 0, 0, 1, 1, 1,
-1.775367, 1.205375, -0.7971385, 1, 0, 0, 1, 1,
-1.768873, -1.780919, -2.393762, 1, 0, 0, 1, 1,
-1.765787, 0.2259299, -3.757736, 1, 0, 0, 1, 1,
-1.750166, -0.7943189, -2.491048, 1, 0, 0, 1, 1,
-1.748993, 0.5078952, -2.31234, 1, 0, 0, 1, 1,
-1.734575, -1.407694, -2.118197, 0, 0, 0, 1, 1,
-1.733336, -0.8714627, -2.805113, 0, 0, 0, 1, 1,
-1.721364, -1.682636, -3.315279, 0, 0, 0, 1, 1,
-1.699282, -0.240722, 0.3243049, 0, 0, 0, 1, 1,
-1.697196, -0.3433021, -2.173793, 0, 0, 0, 1, 1,
-1.695149, 0.1535557, -0.6148686, 0, 0, 0, 1, 1,
-1.679063, -0.6743684, -1.549122, 0, 0, 0, 1, 1,
-1.660149, -0.008035368, -2.061893, 1, 1, 1, 1, 1,
-1.659056, 0.0915652, -1.281331, 1, 1, 1, 1, 1,
-1.651496, -1.210923, -1.964553, 1, 1, 1, 1, 1,
-1.644307, 0.4111874, -1.036932, 1, 1, 1, 1, 1,
-1.640471, -0.7991462, -3.294691, 1, 1, 1, 1, 1,
-1.620631, 0.4364267, -1.899922, 1, 1, 1, 1, 1,
-1.609336, 0.4611145, -0.8073277, 1, 1, 1, 1, 1,
-1.609192, 1.360017, 0.6452574, 1, 1, 1, 1, 1,
-1.608546, 0.04150838, -1.399031, 1, 1, 1, 1, 1,
-1.607375, -0.0598564, -2.056375, 1, 1, 1, 1, 1,
-1.60224, 1.679363, 0.2299769, 1, 1, 1, 1, 1,
-1.600421, -0.9554262, -1.531837, 1, 1, 1, 1, 1,
-1.574013, 2.331067, 1.317511, 1, 1, 1, 1, 1,
-1.56521, -0.8664326, -1.538738, 1, 1, 1, 1, 1,
-1.551565, 1.275449, -1.911453, 1, 1, 1, 1, 1,
-1.548646, -1.278381, -3.941862, 0, 0, 1, 1, 1,
-1.548224, 1.687801, 1.03111, 1, 0, 0, 1, 1,
-1.53338, 0.4966944, -1.640378, 1, 0, 0, 1, 1,
-1.525728, 0.6276006, -2.420432, 1, 0, 0, 1, 1,
-1.519047, -0.2608449, -1.267172, 1, 0, 0, 1, 1,
-1.50421, -0.1110838, -1.044592, 1, 0, 0, 1, 1,
-1.503289, -1.081897, -2.125302, 0, 0, 0, 1, 1,
-1.48712, -0.4167882, -3.272078, 0, 0, 0, 1, 1,
-1.481491, 1.076549, -0.451143, 0, 0, 0, 1, 1,
-1.475743, -0.197221, -0.6211196, 0, 0, 0, 1, 1,
-1.46662, -1.197742, -2.253071, 0, 0, 0, 1, 1,
-1.447036, -1.182055, -2.098376, 0, 0, 0, 1, 1,
-1.442963, 0.2797852, -1.158231, 0, 0, 0, 1, 1,
-1.442758, -0.1513354, -0.7090763, 1, 1, 1, 1, 1,
-1.442568, -1.199847, -3.615393, 1, 1, 1, 1, 1,
-1.428425, -0.3750363, -1.075022, 1, 1, 1, 1, 1,
-1.421866, -0.489305, -2.897258, 1, 1, 1, 1, 1,
-1.421846, 0.5308968, -0.2203267, 1, 1, 1, 1, 1,
-1.417627, 0.06473219, -2.769602, 1, 1, 1, 1, 1,
-1.412896, -0.950693, -2.172827, 1, 1, 1, 1, 1,
-1.398327, 2.004306, -1.340574, 1, 1, 1, 1, 1,
-1.389889, 1.344201, -1.870896, 1, 1, 1, 1, 1,
-1.389498, -1.448862, -2.820016, 1, 1, 1, 1, 1,
-1.389085, 0.3203414, -1.69143, 1, 1, 1, 1, 1,
-1.375173, -0.889468, -1.40778, 1, 1, 1, 1, 1,
-1.362285, 0.3525141, -3.166335, 1, 1, 1, 1, 1,
-1.360737, -0.4115083, -1.557771, 1, 1, 1, 1, 1,
-1.34372, 0.4580748, -0.7245341, 1, 1, 1, 1, 1,
-1.337204, 0.3866037, 0.2990177, 0, 0, 1, 1, 1,
-1.319875, 0.4853117, -1.943741, 1, 0, 0, 1, 1,
-1.305565, -0.8112274, -1.641994, 1, 0, 0, 1, 1,
-1.302955, -1.494419, -1.984898, 1, 0, 0, 1, 1,
-1.301137, 0.6963908, -0.9099892, 1, 0, 0, 1, 1,
-1.300908, -0.8937621, -3.843693, 1, 0, 0, 1, 1,
-1.297971, -1.060713, -1.900252, 0, 0, 0, 1, 1,
-1.277745, 0.1542019, -1.031834, 0, 0, 0, 1, 1,
-1.274731, -2.117436, -1.71263, 0, 0, 0, 1, 1,
-1.266269, -1.079989, -3.066544, 0, 0, 0, 1, 1,
-1.257609, -0.6095416, -2.483511, 0, 0, 0, 1, 1,
-1.252566, 0.4269558, 0.3397713, 0, 0, 0, 1, 1,
-1.250022, 0.4197547, -1.148116, 0, 0, 0, 1, 1,
-1.247876, -1.660313, -2.057399, 1, 1, 1, 1, 1,
-1.228087, 0.002444301, -1.711069, 1, 1, 1, 1, 1,
-1.227895, 1.337663, -1.513729, 1, 1, 1, 1, 1,
-1.225598, 0.8739754, 0.4255996, 1, 1, 1, 1, 1,
-1.215197, 0.05383141, -1.72969, 1, 1, 1, 1, 1,
-1.202265, -0.8487966, -1.564197, 1, 1, 1, 1, 1,
-1.194285, -1.126456, -3.072101, 1, 1, 1, 1, 1,
-1.191782, -1.327507, -1.516273, 1, 1, 1, 1, 1,
-1.186087, 1.008245, -1.390054, 1, 1, 1, 1, 1,
-1.175892, -0.9840978, -2.103486, 1, 1, 1, 1, 1,
-1.174626, -0.8863106, -1.700371, 1, 1, 1, 1, 1,
-1.171253, 0.8377022, -1.442167, 1, 1, 1, 1, 1,
-1.170913, 0.6371952, -0.1703981, 1, 1, 1, 1, 1,
-1.15333, 0.07111155, -3.139029, 1, 1, 1, 1, 1,
-1.149492, 0.2431612, -0.1544179, 1, 1, 1, 1, 1,
-1.143886, 0.4496839, 0.883176, 0, 0, 1, 1, 1,
-1.141156, -0.3410819, -0.6812637, 1, 0, 0, 1, 1,
-1.136648, -0.0629575, -1.846569, 1, 0, 0, 1, 1,
-1.134216, 0.358707, -0.5472621, 1, 0, 0, 1, 1,
-1.121477, -1.062312, -2.018625, 1, 0, 0, 1, 1,
-1.117232, -0.5560516, -2.697428, 1, 0, 0, 1, 1,
-1.112771, 0.4713021, -1.913201, 0, 0, 0, 1, 1,
-1.112579, 0.7240294, -0.3534798, 0, 0, 0, 1, 1,
-1.108606, 0.2462364, -1.658894, 0, 0, 0, 1, 1,
-1.099541, 0.3549407, -0.07247304, 0, 0, 0, 1, 1,
-1.095342, -0.5037583, -2.472933, 0, 0, 0, 1, 1,
-1.062369, 0.4679883, -1.166571, 0, 0, 0, 1, 1,
-1.055947, -0.2282523, 0.3237833, 0, 0, 0, 1, 1,
-1.05222, -2.37984, -4.799758, 1, 1, 1, 1, 1,
-1.041345, -0.8174797, -2.645718, 1, 1, 1, 1, 1,
-1.041198, 0.6872378, -0.521484, 1, 1, 1, 1, 1,
-1.041125, -0.3670323, -2.522903, 1, 1, 1, 1, 1,
-1.03371, 0.8342729, -0.8897748, 1, 1, 1, 1, 1,
-1.032296, 0.2263256, -0.1305951, 1, 1, 1, 1, 1,
-1.031387, 0.8713771, -1.235946, 1, 1, 1, 1, 1,
-1.029113, 0.1006866, -1.130033, 1, 1, 1, 1, 1,
-1.019363, 1.238543, -0.0507145, 1, 1, 1, 1, 1,
-1.018387, 0.1862898, -1.303264, 1, 1, 1, 1, 1,
-1.010163, -0.4839359, -0.5394119, 1, 1, 1, 1, 1,
-1.007295, 1.166165, -0.956505, 1, 1, 1, 1, 1,
-1.00154, -0.08153947, -0.8627456, 1, 1, 1, 1, 1,
-0.9964882, 1.329851, -0.0632601, 1, 1, 1, 1, 1,
-0.9906398, -2.502555, -1.17021, 1, 1, 1, 1, 1,
-0.9842424, 0.138762, -0.83188, 0, 0, 1, 1, 1,
-0.9745715, -1.058573, -2.12167, 1, 0, 0, 1, 1,
-0.9737673, 0.2703534, -1.384262, 1, 0, 0, 1, 1,
-0.9698543, -0.3849721, -3.958486, 1, 0, 0, 1, 1,
-0.9691099, 0.439868, -0.2681693, 1, 0, 0, 1, 1,
-0.968361, -0.491622, -1.20191, 1, 0, 0, 1, 1,
-0.9633569, -0.7472129, -1.639569, 0, 0, 0, 1, 1,
-0.9624707, -0.4395256, -1.847766, 0, 0, 0, 1, 1,
-0.9608921, -0.7107171, -3.007142, 0, 0, 0, 1, 1,
-0.9605191, 0.009964951, 0.6276206, 0, 0, 0, 1, 1,
-0.9523914, -0.1928065, -2.670046, 0, 0, 0, 1, 1,
-0.9494746, 0.2127924, -2.408942, 0, 0, 0, 1, 1,
-0.9486734, 0.6279218, -1.462388, 0, 0, 0, 1, 1,
-0.939273, -1.267292, -2.392815, 1, 1, 1, 1, 1,
-0.938791, -0.05719212, -1.911738, 1, 1, 1, 1, 1,
-0.9319507, 0.2550658, -0.2711093, 1, 1, 1, 1, 1,
-0.9290988, -0.2157129, -2.062441, 1, 1, 1, 1, 1,
-0.9286994, -0.02462767, -2.074401, 1, 1, 1, 1, 1,
-0.9285298, 0.9220044, 0.3482044, 1, 1, 1, 1, 1,
-0.9272665, -0.2092073, -1.742754, 1, 1, 1, 1, 1,
-0.926402, 0.2374697, -1.75692, 1, 1, 1, 1, 1,
-0.9238148, -0.2796733, -1.450273, 1, 1, 1, 1, 1,
-0.9207098, 2.580953, 1.453042, 1, 1, 1, 1, 1,
-0.9131631, -0.4198555, -1.681662, 1, 1, 1, 1, 1,
-0.9084238, 2.00257, -1.043522, 1, 1, 1, 1, 1,
-0.9029819, 1.226726, -0.4708953, 1, 1, 1, 1, 1,
-0.9013337, -2.223744, -2.43768, 1, 1, 1, 1, 1,
-0.8969064, -0.4811928, -1.738421, 1, 1, 1, 1, 1,
-0.8961913, 0.7278623, -0.8771145, 0, 0, 1, 1, 1,
-0.8949409, -1.320709, -1.640717, 1, 0, 0, 1, 1,
-0.891762, 0.9059954, -1.433855, 1, 0, 0, 1, 1,
-0.8871908, -0.7379217, -2.586445, 1, 0, 0, 1, 1,
-0.8867907, -0.4266857, -1.560113, 1, 0, 0, 1, 1,
-0.8853909, -1.2119, -3.2695, 1, 0, 0, 1, 1,
-0.8850899, 0.3215114, -1.28969, 0, 0, 0, 1, 1,
-0.8835169, 1.899798, -0.1957349, 0, 0, 0, 1, 1,
-0.8828428, -0.3939424, -1.995432, 0, 0, 0, 1, 1,
-0.8800653, -0.6702591, -2.483953, 0, 0, 0, 1, 1,
-0.8790945, 0.2879594, -1.83913, 0, 0, 0, 1, 1,
-0.8782594, -0.1842807, -1.818835, 0, 0, 0, 1, 1,
-0.8710507, -0.9855624, -3.677146, 0, 0, 0, 1, 1,
-0.8664714, 0.3441355, -1.944589, 1, 1, 1, 1, 1,
-0.8312103, -0.960884, -2.138798, 1, 1, 1, 1, 1,
-0.819153, -0.0783089, -2.404591, 1, 1, 1, 1, 1,
-0.813427, -0.4136328, -1.906913, 1, 1, 1, 1, 1,
-0.8110748, 0.1880856, -1.590683, 1, 1, 1, 1, 1,
-0.8102146, -0.9382697, -1.539133, 1, 1, 1, 1, 1,
-0.8054354, -0.9195154, -1.94301, 1, 1, 1, 1, 1,
-0.8043384, 0.6991066, -0.8201555, 1, 1, 1, 1, 1,
-0.8016207, 0.9817517, -0.6414782, 1, 1, 1, 1, 1,
-0.8003213, -0.6624269, -2.760415, 1, 1, 1, 1, 1,
-0.7998049, -1.005381, -3.132164, 1, 1, 1, 1, 1,
-0.7997516, -0.3089114, -1.972917, 1, 1, 1, 1, 1,
-0.7928236, 0.7279925, -0.934397, 1, 1, 1, 1, 1,
-0.78975, 0.4349167, -1.908553, 1, 1, 1, 1, 1,
-0.7886229, -1.091632, -2.640329, 1, 1, 1, 1, 1,
-0.7886132, 0.7884641, -1.003777, 0, 0, 1, 1, 1,
-0.7825795, -0.1679804, -1.804456, 1, 0, 0, 1, 1,
-0.7807584, -0.09842686, -2.333478, 1, 0, 0, 1, 1,
-0.7797878, -0.698583, -2.483638, 1, 0, 0, 1, 1,
-0.7762567, 0.5977576, -1.236217, 1, 0, 0, 1, 1,
-0.7704405, 1.360805, -0.7860371, 1, 0, 0, 1, 1,
-0.7669111, -0.1053543, -3.554878, 0, 0, 0, 1, 1,
-0.7610952, 0.2683965, -1.854711, 0, 0, 0, 1, 1,
-0.7567133, -0.181396, -2.82851, 0, 0, 0, 1, 1,
-0.7517506, 0.6405572, -1.882239, 0, 0, 0, 1, 1,
-0.7487829, 1.116256, -2.250431, 0, 0, 0, 1, 1,
-0.7459106, -0.3857117, -2.43805, 0, 0, 0, 1, 1,
-0.7455556, 0.634178, -0.5116648, 0, 0, 0, 1, 1,
-0.7449595, -1.472232, -2.046153, 1, 1, 1, 1, 1,
-0.7407694, -1.888416, -1.802717, 1, 1, 1, 1, 1,
-0.7396967, -1.930698, -2.966407, 1, 1, 1, 1, 1,
-0.7387027, -0.304628, -1.599363, 1, 1, 1, 1, 1,
-0.7337251, -0.6307491, -2.532203, 1, 1, 1, 1, 1,
-0.7263323, 0.5882542, -0.936035, 1, 1, 1, 1, 1,
-0.7231478, 0.9928226, 0.2919581, 1, 1, 1, 1, 1,
-0.7203115, -0.9981518, -0.9807833, 1, 1, 1, 1, 1,
-0.7184093, 0.6037291, -1.42295, 1, 1, 1, 1, 1,
-0.7177798, 0.7433683, -0.3866479, 1, 1, 1, 1, 1,
-0.7150313, 0.3119545, -0.3375493, 1, 1, 1, 1, 1,
-0.7131113, -0.1143297, -2.856671, 1, 1, 1, 1, 1,
-0.7072383, 0.02875102, -1.798665, 1, 1, 1, 1, 1,
-0.6972957, 0.4809057, 0.7512456, 1, 1, 1, 1, 1,
-0.6968397, -1.785604, -3.014615, 1, 1, 1, 1, 1,
-0.6949108, -1.126848, -1.818346, 0, 0, 1, 1, 1,
-0.6908771, 0.6716993, -1.1725, 1, 0, 0, 1, 1,
-0.6898232, -0.3060635, -2.900452, 1, 0, 0, 1, 1,
-0.6815111, -1.206104, -2.479676, 1, 0, 0, 1, 1,
-0.6739238, 1.171853, -0.3280315, 1, 0, 0, 1, 1,
-0.6738983, -1.685231, -3.767187, 1, 0, 0, 1, 1,
-0.6737083, 1.497365, -0.3417948, 0, 0, 0, 1, 1,
-0.6687509, 1.114866, -0.1529862, 0, 0, 0, 1, 1,
-0.6681732, -0.4771876, -4.114997, 0, 0, 0, 1, 1,
-0.6675084, 0.1368744, -3.076314, 0, 0, 0, 1, 1,
-0.665423, -0.4171442, -1.849111, 0, 0, 0, 1, 1,
-0.6641223, 0.2550324, -0.2321741, 0, 0, 0, 1, 1,
-0.6588956, 0.8011901, -1.357728, 0, 0, 0, 1, 1,
-0.6573535, 1.780167, -0.3581572, 1, 1, 1, 1, 1,
-0.6527498, -1.06416, -2.607706, 1, 1, 1, 1, 1,
-0.6508588, -0.3524606, -2.478735, 1, 1, 1, 1, 1,
-0.6488854, 1.213235, 0.5338065, 1, 1, 1, 1, 1,
-0.6483009, 0.9814007, -0.8198967, 1, 1, 1, 1, 1,
-0.6471573, -1.798094, -1.68408, 1, 1, 1, 1, 1,
-0.647132, 0.8800749, 1.186258, 1, 1, 1, 1, 1,
-0.6437813, 1.921123, 1.150709, 1, 1, 1, 1, 1,
-0.6435494, -1.200392, -0.9161417, 1, 1, 1, 1, 1,
-0.6389138, -1.139179, -2.732963, 1, 1, 1, 1, 1,
-0.6385909, 0.5436948, -0.398258, 1, 1, 1, 1, 1,
-0.6363818, -0.3220161, -2.354022, 1, 1, 1, 1, 1,
-0.6357983, 1.278899, -1.39297, 1, 1, 1, 1, 1,
-0.632987, 0.2760151, -1.554154, 1, 1, 1, 1, 1,
-0.6308779, 0.8037236, -2.057447, 1, 1, 1, 1, 1,
-0.6282782, -1.14919, -1.295257, 0, 0, 1, 1, 1,
-0.6234743, -1.421979, -0.8414469, 1, 0, 0, 1, 1,
-0.622315, -0.5268986, -3.305475, 1, 0, 0, 1, 1,
-0.6158955, -0.5024368, -1.179817, 1, 0, 0, 1, 1,
-0.6137533, -0.3814038, -2.472444, 1, 0, 0, 1, 1,
-0.6137148, -0.3403108, -1.485266, 1, 0, 0, 1, 1,
-0.611644, -0.6945133, -3.876876, 0, 0, 0, 1, 1,
-0.6033183, -0.3033781, -3.337831, 0, 0, 0, 1, 1,
-0.6005424, 0.2963965, 1.534094, 0, 0, 0, 1, 1,
-0.5983755, -0.9107792, -1.907448, 0, 0, 0, 1, 1,
-0.5979882, 0.7313168, 0.6371484, 0, 0, 0, 1, 1,
-0.5933787, -1.127536, -3.597856, 0, 0, 0, 1, 1,
-0.5890944, 1.133279, -0.4251622, 0, 0, 0, 1, 1,
-0.5880764, 0.3862821, -1.328877, 1, 1, 1, 1, 1,
-0.5836211, -0.08845194, -0.4280657, 1, 1, 1, 1, 1,
-0.579266, -0.1628022, -0.1532376, 1, 1, 1, 1, 1,
-0.5779063, -0.6592824, -3.437417, 1, 1, 1, 1, 1,
-0.5761173, 1.281708, -1.100537, 1, 1, 1, 1, 1,
-0.5745299, -0.8174871, -1.58728, 1, 1, 1, 1, 1,
-0.5742093, 0.1580641, -0.7598656, 1, 1, 1, 1, 1,
-0.5737898, 1.504192, -0.5825974, 1, 1, 1, 1, 1,
-0.5725728, -0.5034986, -1.395618, 1, 1, 1, 1, 1,
-0.5698041, 0.5456085, -0.2773803, 1, 1, 1, 1, 1,
-0.5689785, -0.6045894, -2.720552, 1, 1, 1, 1, 1,
-0.5661003, -0.3209935, -2.671251, 1, 1, 1, 1, 1,
-0.5629452, -0.3414546, -2.676665, 1, 1, 1, 1, 1,
-0.5616224, 0.3580246, -0.4471897, 1, 1, 1, 1, 1,
-0.5610904, -1.537135, -3.587666, 1, 1, 1, 1, 1,
-0.5594441, 0.9603708, -1.170817, 0, 0, 1, 1, 1,
-0.5588176, -1.724825, -1.911361, 1, 0, 0, 1, 1,
-0.5561227, -1.225543, -3.201803, 1, 0, 0, 1, 1,
-0.5545014, -0.3094345, -2.327744, 1, 0, 0, 1, 1,
-0.5455301, -0.795659, -1.017738, 1, 0, 0, 1, 1,
-0.5437683, 0.951784, -1.049271, 1, 0, 0, 1, 1,
-0.5427922, 0.9933811, -0.1605465, 0, 0, 0, 1, 1,
-0.542034, 0.8223649, 0.3540063, 0, 0, 0, 1, 1,
-0.5375608, 0.5510578, -2.16293, 0, 0, 0, 1, 1,
-0.5232459, -1.515958, -1.684498, 0, 0, 0, 1, 1,
-0.5208601, -0.6331042, -3.452097, 0, 0, 0, 1, 1,
-0.5178736, 1.450193, -0.340694, 0, 0, 0, 1, 1,
-0.5159218, 1.143643, 0.1628534, 0, 0, 0, 1, 1,
-0.5142236, 0.1564242, -2.375497, 1, 1, 1, 1, 1,
-0.5113781, 1.017941, 0.4708734, 1, 1, 1, 1, 1,
-0.5017197, 0.4116583, -1.217064, 1, 1, 1, 1, 1,
-0.5007582, -0.9303098, -0.2342868, 1, 1, 1, 1, 1,
-0.5000976, 0.362252, -1.881456, 1, 1, 1, 1, 1,
-0.4911169, 0.5710754, 0.4561654, 1, 1, 1, 1, 1,
-0.4877027, -0.3914719, -0.7485688, 1, 1, 1, 1, 1,
-0.4837467, 0.03413792, -1.357707, 1, 1, 1, 1, 1,
-0.4762264, -0.6850271, -2.899927, 1, 1, 1, 1, 1,
-0.4752573, 1.287239, -2.111196, 1, 1, 1, 1, 1,
-0.4688699, 0.8769997, 0.227804, 1, 1, 1, 1, 1,
-0.4604354, 1.205599, 0.7853248, 1, 1, 1, 1, 1,
-0.4597926, -0.2077271, -1.375073, 1, 1, 1, 1, 1,
-0.4590885, -0.3819527, -4.0353, 1, 1, 1, 1, 1,
-0.4590284, 0.7629061, -1.751002, 1, 1, 1, 1, 1,
-0.451647, -0.6304207, -3.445014, 0, 0, 1, 1, 1,
-0.4512263, -0.4116015, -1.9266, 1, 0, 0, 1, 1,
-0.4499585, -1.462778, -3.586689, 1, 0, 0, 1, 1,
-0.441523, -0.6020926, -2.025973, 1, 0, 0, 1, 1,
-0.436166, -1.472121, -2.533237, 1, 0, 0, 1, 1,
-0.4360847, 0.2662944, -1.490626, 1, 0, 0, 1, 1,
-0.4332945, -1.253005, -3.071137, 0, 0, 0, 1, 1,
-0.4312494, 0.9213116, -0.7802853, 0, 0, 0, 1, 1,
-0.4277939, 0.6108178, -1.568616, 0, 0, 0, 1, 1,
-0.4234422, 0.4935451, 0.2261687, 0, 0, 0, 1, 1,
-0.4231344, 0.5776749, -1.00708, 0, 0, 0, 1, 1,
-0.4229834, 1.326846, 0.9950892, 0, 0, 0, 1, 1,
-0.4220299, 1.581403, -0.9803702, 0, 0, 0, 1, 1,
-0.4215299, -2.148652, -4.716581, 1, 1, 1, 1, 1,
-0.4210329, 0.6577426, -1.370368, 1, 1, 1, 1, 1,
-0.418059, 1.708428, -0.8208928, 1, 1, 1, 1, 1,
-0.4128253, -0.1462767, -2.588561, 1, 1, 1, 1, 1,
-0.4046296, -1.290008, -3.581161, 1, 1, 1, 1, 1,
-0.3986892, -0.4796132, -3.088414, 1, 1, 1, 1, 1,
-0.3981618, -1.493122, -0.8427484, 1, 1, 1, 1, 1,
-0.3972579, -0.297261, -2.491674, 1, 1, 1, 1, 1,
-0.3967305, 0.5756133, -0.35028, 1, 1, 1, 1, 1,
-0.3956411, -0.3644074, -3.487885, 1, 1, 1, 1, 1,
-0.3955748, -0.3206306, -2.287918, 1, 1, 1, 1, 1,
-0.3919502, 0.8765901, -1.997605, 1, 1, 1, 1, 1,
-0.391865, -0.1890911, -3.076421, 1, 1, 1, 1, 1,
-0.3898214, 0.5423365, -1.162454, 1, 1, 1, 1, 1,
-0.3875223, 0.5521453, -1.050302, 1, 1, 1, 1, 1,
-0.3869475, -1.232328, -1.955545, 0, 0, 1, 1, 1,
-0.3863104, 0.4356448, -0.9376506, 1, 0, 0, 1, 1,
-0.382897, 0.362889, -0.7034165, 1, 0, 0, 1, 1,
-0.3806864, -0.5406091, -0.102431, 1, 0, 0, 1, 1,
-0.3721392, 0.9097839, 0.7416994, 1, 0, 0, 1, 1,
-0.368914, 0.8367389, 1.762785, 1, 0, 0, 1, 1,
-0.361748, -0.3212349, -0.7489569, 0, 0, 0, 1, 1,
-0.3538201, -0.7621275, -3.48784, 0, 0, 0, 1, 1,
-0.350237, 0.08635905, -1.6038, 0, 0, 0, 1, 1,
-0.3497394, 0.2624222, -1.43525, 0, 0, 0, 1, 1,
-0.3453923, 0.1490141, 0.09419475, 0, 0, 0, 1, 1,
-0.3402015, -1.262027, -0.9598966, 0, 0, 0, 1, 1,
-0.3389433, -1.634743, -1.748295, 0, 0, 0, 1, 1,
-0.3296211, 0.19518, -0.1538094, 1, 1, 1, 1, 1,
-0.3259584, 0.3113578, -0.5930748, 1, 1, 1, 1, 1,
-0.3186496, 0.2267559, -0.9565263, 1, 1, 1, 1, 1,
-0.3163438, 0.9345998, -0.6621578, 1, 1, 1, 1, 1,
-0.3148987, -1.201039, -3.77784, 1, 1, 1, 1, 1,
-0.3147465, 0.550347, -0.7531592, 1, 1, 1, 1, 1,
-0.3096193, 0.692948, -2.352617, 1, 1, 1, 1, 1,
-0.2959915, 1.130604, 0.913572, 1, 1, 1, 1, 1,
-0.2947585, 2.586074, -0.2021258, 1, 1, 1, 1, 1,
-0.2937622, -0.3639565, -3.464708, 1, 1, 1, 1, 1,
-0.2916171, 0.9084243, 0.4849209, 1, 1, 1, 1, 1,
-0.2891678, 0.2422068, -1.7016, 1, 1, 1, 1, 1,
-0.2881968, 0.9349149, -0.6136475, 1, 1, 1, 1, 1,
-0.2861938, 0.2370275, -2.579701, 1, 1, 1, 1, 1,
-0.2849621, 0.6068038, -0.6895859, 1, 1, 1, 1, 1,
-0.2819103, 1.383154, -0.6778949, 0, 0, 1, 1, 1,
-0.2740606, 0.383375, 1.165465, 1, 0, 0, 1, 1,
-0.2729921, -0.2540349, -3.352676, 1, 0, 0, 1, 1,
-0.26714, 0.8832363, -0.7016835, 1, 0, 0, 1, 1,
-0.2618006, 2.341872, -0.5850296, 1, 0, 0, 1, 1,
-0.2605864, -0.744793, -3.453795, 1, 0, 0, 1, 1,
-0.2551598, 0.08590121, -1.265428, 0, 0, 0, 1, 1,
-0.2551164, -1.006999, -2.548114, 0, 0, 0, 1, 1,
-0.2516893, -0.9879836, -4.39602, 0, 0, 0, 1, 1,
-0.2508276, 0.006194196, -0.7279457, 0, 0, 0, 1, 1,
-0.2502423, 0.7652407, -0.9874253, 0, 0, 0, 1, 1,
-0.2471917, 1.751746, -2.219575, 0, 0, 0, 1, 1,
-0.2466286, 0.01697362, -0.7167009, 0, 0, 0, 1, 1,
-0.2410896, 0.5173196, -0.7637036, 1, 1, 1, 1, 1,
-0.2392931, -1.771085, -1.472035, 1, 1, 1, 1, 1,
-0.2389591, -0.7656443, -1.494037, 1, 1, 1, 1, 1,
-0.2368938, -0.1418131, -2.618943, 1, 1, 1, 1, 1,
-0.2327614, -0.9207946, -3.297775, 1, 1, 1, 1, 1,
-0.2319971, -0.3277222, -2.393382, 1, 1, 1, 1, 1,
-0.2291571, 1.787465, -0.7343053, 1, 1, 1, 1, 1,
-0.2250151, -1.500268, -4.940331, 1, 1, 1, 1, 1,
-0.2205401, 0.9894838, -0.6847679, 1, 1, 1, 1, 1,
-0.2195234, -0.9275701, -2.753074, 1, 1, 1, 1, 1,
-0.2175317, -1.405516, -5.723635, 1, 1, 1, 1, 1,
-0.217483, 0.6789631, -1.261032, 1, 1, 1, 1, 1,
-0.2166713, -2.029879, -2.380642, 1, 1, 1, 1, 1,
-0.2146039, 0.6236811, -0.3991796, 1, 1, 1, 1, 1,
-0.2104428, 0.07926769, -1.000306, 1, 1, 1, 1, 1,
-0.2077766, 1.337308, 0.9749058, 0, 0, 1, 1, 1,
-0.2073161, -0.1145136, -1.388208, 1, 0, 0, 1, 1,
-0.2060186, 0.4494687, -0.8153545, 1, 0, 0, 1, 1,
-0.2049648, -0.2624143, -4.075822, 1, 0, 0, 1, 1,
-0.1995999, -0.9116924, -2.997318, 1, 0, 0, 1, 1,
-0.1989184, -0.3922976, -2.081027, 1, 0, 0, 1, 1,
-0.1967554, -0.6037508, -1.967121, 0, 0, 0, 1, 1,
-0.1898099, 0.0611666, -1.220601, 0, 0, 0, 1, 1,
-0.1881149, 0.5155518, 0.8082848, 0, 0, 0, 1, 1,
-0.1871927, -0.1737998, -2.112974, 0, 0, 0, 1, 1,
-0.1853531, -0.8686938, -3.070604, 0, 0, 0, 1, 1,
-0.1843722, -1.295558, -3.465773, 0, 0, 0, 1, 1,
-0.1829054, -0.6934078, -2.99462, 0, 0, 0, 1, 1,
-0.1828793, -0.9547641, -2.771863, 1, 1, 1, 1, 1,
-0.1825196, -0.7162228, -2.448339, 1, 1, 1, 1, 1,
-0.1813419, 0.4912007, 0.114471, 1, 1, 1, 1, 1,
-0.178348, 1.575579, -0.961354, 1, 1, 1, 1, 1,
-0.1673049, 0.3187607, 0.8026584, 1, 1, 1, 1, 1,
-0.1642084, -0.180627, -0.9614031, 1, 1, 1, 1, 1,
-0.1637334, 0.06268927, -0.4141628, 1, 1, 1, 1, 1,
-0.1587919, -1.004557, -1.776939, 1, 1, 1, 1, 1,
-0.1560546, 0.9526203, -0.06197254, 1, 1, 1, 1, 1,
-0.1539076, 0.1611278, -0.7074783, 1, 1, 1, 1, 1,
-0.1489334, -0.194129, -0.1255748, 1, 1, 1, 1, 1,
-0.1482169, 0.6830254, 0.3106925, 1, 1, 1, 1, 1,
-0.1474371, -0.09646011, 0.2950162, 1, 1, 1, 1, 1,
-0.1444981, -0.7953125, -2.847331, 1, 1, 1, 1, 1,
-0.1433787, -1.367374, -1.984496, 1, 1, 1, 1, 1,
-0.1399984, -0.467674, -4.335042, 0, 0, 1, 1, 1,
-0.1397429, -0.625617, -2.251757, 1, 0, 0, 1, 1,
-0.1380867, -1.32315, -2.448795, 1, 0, 0, 1, 1,
-0.1347651, -0.04445982, -2.893301, 1, 0, 0, 1, 1,
-0.1331125, 0.6435112, -1.027463, 1, 0, 0, 1, 1,
-0.1312901, 0.2706653, -0.1927279, 1, 0, 0, 1, 1,
-0.1276068, 0.495109, 1.476388, 0, 0, 0, 1, 1,
-0.1245432, -0.5618968, -2.055497, 0, 0, 0, 1, 1,
-0.1231892, -0.6158081, -4.541511, 0, 0, 0, 1, 1,
-0.1228592, 1.164149, 0.1623437, 0, 0, 0, 1, 1,
-0.1172698, 0.9706404, -1.186563, 0, 0, 0, 1, 1,
-0.1154687, -0.2431234, -2.615955, 0, 0, 0, 1, 1,
-0.1098994, -0.1747025, -0.969641, 0, 0, 0, 1, 1,
-0.1084893, 0.3335274, -1.829757, 1, 1, 1, 1, 1,
-0.107955, -0.2513382, -4.564225, 1, 1, 1, 1, 1,
-0.1061382, 0.03468205, 0.6365834, 1, 1, 1, 1, 1,
-0.1009977, 0.4834589, 0.3383467, 1, 1, 1, 1, 1,
-0.09817111, -0.4252035, -2.317129, 1, 1, 1, 1, 1,
-0.08987626, 1.196214, 1.079753, 1, 1, 1, 1, 1,
-0.08232652, -0.3148341, -2.219074, 1, 1, 1, 1, 1,
-0.08203464, -1.393029, -3.741005, 1, 1, 1, 1, 1,
-0.07768912, -1.748177, -4.128349, 1, 1, 1, 1, 1,
-0.07300805, -1.206563, -4.349516, 1, 1, 1, 1, 1,
-0.06951902, 0.4506253, 0.09214813, 1, 1, 1, 1, 1,
-0.06532331, -0.8893302, -1.583241, 1, 1, 1, 1, 1,
-0.06304604, 0.303975, 0.243974, 1, 1, 1, 1, 1,
-0.06176643, -0.7522339, -2.107646, 1, 1, 1, 1, 1,
-0.06104517, -1.196988, -2.762131, 1, 1, 1, 1, 1,
-0.0608982, 0.08524339, -0.4976192, 0, 0, 1, 1, 1,
-0.05921567, -1.660467, -3.778405, 1, 0, 0, 1, 1,
-0.05865753, 0.5177014, 0.8487942, 1, 0, 0, 1, 1,
-0.05743118, -0.5879067, -2.654328, 1, 0, 0, 1, 1,
-0.05260421, -0.8765848, -1.48751, 1, 0, 0, 1, 1,
-0.05057661, 1.370207, -0.4213289, 1, 0, 0, 1, 1,
-0.05033226, 0.1633569, -0.9232668, 0, 0, 0, 1, 1,
-0.04848544, -1.267934, -2.386058, 0, 0, 0, 1, 1,
-0.04831377, 0.2054829, -0.9704465, 0, 0, 0, 1, 1,
-0.04657889, -0.1146044, -4.238818, 0, 0, 0, 1, 1,
-0.0447829, 0.6483492, 0.6743414, 0, 0, 0, 1, 1,
-0.04357498, 0.5303316, -0.9637855, 0, 0, 0, 1, 1,
-0.04199024, 0.7240944, 1.397304, 0, 0, 0, 1, 1,
-0.04143795, 0.7315955, -0.419924, 1, 1, 1, 1, 1,
-0.03792464, -0.1369269, -5.666691, 1, 1, 1, 1, 1,
-0.0379038, -0.1030959, -3.985525, 1, 1, 1, 1, 1,
-0.0373127, -0.09675129, -3.724658, 1, 1, 1, 1, 1,
-0.03593461, 0.182056, 2.444538, 1, 1, 1, 1, 1,
-0.03547335, 0.4385093, -0.634519, 1, 1, 1, 1, 1,
-0.03147037, 1.227898, 1.86941, 1, 1, 1, 1, 1,
-0.02826621, 1.000805, 0.1089933, 1, 1, 1, 1, 1,
-0.02603987, -1.470469, -1.482289, 1, 1, 1, 1, 1,
-0.02550028, -0.0550369, -4.218425, 1, 1, 1, 1, 1,
-0.02463622, -0.1477703, -3.038041, 1, 1, 1, 1, 1,
-0.0211617, -1.415214, -3.653399, 1, 1, 1, 1, 1,
-0.02074341, 0.3164654, 0.1245541, 1, 1, 1, 1, 1,
-0.02005747, 1.559692, -2.003198, 1, 1, 1, 1, 1,
-0.01982452, 0.5053399, -1.099973, 1, 1, 1, 1, 1,
-0.01749947, -1.877362, -3.15353, 0, 0, 1, 1, 1,
-0.01720256, -0.5804489, -0.6996617, 1, 0, 0, 1, 1,
-0.01378965, 1.883497, 1.318987, 1, 0, 0, 1, 1,
-0.01322691, 1.02448, 0.03059767, 1, 0, 0, 1, 1,
-0.01306718, 1.390081, -0.3491449, 1, 0, 0, 1, 1,
-0.0120115, 0.930998, -1.080162, 1, 0, 0, 1, 1,
-0.01134502, -1.577617, -2.879532, 0, 0, 0, 1, 1,
-0.009526227, 2.11425, 0.1948822, 0, 0, 0, 1, 1,
-0.009226593, 0.4217187, -0.3900321, 0, 0, 0, 1, 1,
-0.00206132, 0.1505942, 0.5516888, 0, 0, 0, 1, 1,
-0.0002908274, -0.924792, -3.613841, 0, 0, 0, 1, 1,
0.0005646974, -1.25902, 3.384541, 0, 0, 0, 1, 1,
0.002638204, -0.2398687, 2.719495, 0, 0, 0, 1, 1,
0.003210447, 1.533414, 0.9421583, 1, 1, 1, 1, 1,
0.007727794, -1.106371, 3.083777, 1, 1, 1, 1, 1,
0.009794863, 0.56902, 1.685147, 1, 1, 1, 1, 1,
0.009835948, 0.1147122, 0.7326626, 1, 1, 1, 1, 1,
0.01008983, -0.2607524, 3.224602, 1, 1, 1, 1, 1,
0.01062462, 0.9862022, 1.132973, 1, 1, 1, 1, 1,
0.01130427, -0.8343126, 3.687712, 1, 1, 1, 1, 1,
0.01579207, 0.9108063, 0.3681878, 1, 1, 1, 1, 1,
0.01673693, 0.2209272, -0.4549755, 1, 1, 1, 1, 1,
0.01707042, -0.04564405, 2.176302, 1, 1, 1, 1, 1,
0.01842013, -1.385934, 1.948982, 1, 1, 1, 1, 1,
0.01996136, 1.474607, -0.7720929, 1, 1, 1, 1, 1,
0.0232233, -2.335088, 3.258883, 1, 1, 1, 1, 1,
0.02588261, -0.6089136, 3.43448, 1, 1, 1, 1, 1,
0.02607723, 0.3235601, 1.206859, 1, 1, 1, 1, 1,
0.0290127, 0.732915, -0.06697059, 0, 0, 1, 1, 1,
0.03195804, -1.098819, 3.417022, 1, 0, 0, 1, 1,
0.03231389, 0.943305, 0.7691283, 1, 0, 0, 1, 1,
0.03237716, -0.2559455, 2.781341, 1, 0, 0, 1, 1,
0.03317474, -0.09579238, 1.309815, 1, 0, 0, 1, 1,
0.04489743, 0.7730315, -0.3079902, 1, 0, 0, 1, 1,
0.04533972, -0.4425298, 3.688204, 0, 0, 0, 1, 1,
0.04655962, -0.8835887, 1.699931, 0, 0, 0, 1, 1,
0.04761133, 0.4194599, 0.1708146, 0, 0, 0, 1, 1,
0.04928938, 0.09905557, 0.7383924, 0, 0, 0, 1, 1,
0.04962388, 0.6864151, 2.237219, 0, 0, 0, 1, 1,
0.04973246, 0.07877608, 0.8399132, 0, 0, 0, 1, 1,
0.05163206, -0.4538994, 4.858376, 0, 0, 0, 1, 1,
0.05242135, 1.407673, -1.013417, 1, 1, 1, 1, 1,
0.05264544, -0.3533123, 1.97895, 1, 1, 1, 1, 1,
0.05880954, 0.5416743, 0.8050388, 1, 1, 1, 1, 1,
0.06044186, -0.6761528, 4.14677, 1, 1, 1, 1, 1,
0.06251138, 0.003474647, 2.573505, 1, 1, 1, 1, 1,
0.0651224, -0.2522283, 3.636014, 1, 1, 1, 1, 1,
0.07297632, 0.2577321, 2.348565, 1, 1, 1, 1, 1,
0.07675769, -0.08265028, 1.835314, 1, 1, 1, 1, 1,
0.08028021, 0.6580085, -0.3782057, 1, 1, 1, 1, 1,
0.08123782, -0.3654928, 2.413194, 1, 1, 1, 1, 1,
0.082265, -0.2886591, 1.364138, 1, 1, 1, 1, 1,
0.09338655, 0.3992757, 0.2973183, 1, 1, 1, 1, 1,
0.09820204, -0.1373373, 4.648891, 1, 1, 1, 1, 1,
0.09895297, 0.3200978, 0.2525744, 1, 1, 1, 1, 1,
0.1024159, -0.02426372, 0.6477205, 1, 1, 1, 1, 1,
0.1055918, -0.1168368, 1.629432, 0, 0, 1, 1, 1,
0.1113775, 0.7198616, 2.170627, 1, 0, 0, 1, 1,
0.1124953, 1.11118, 0.09555335, 1, 0, 0, 1, 1,
0.1134676, -0.367999, 0.9141424, 1, 0, 0, 1, 1,
0.1139794, -1.084012, 3.575418, 1, 0, 0, 1, 1,
0.1224926, -0.7494895, 3.244181, 1, 0, 0, 1, 1,
0.1232378, -2.121304, 4.700252, 0, 0, 0, 1, 1,
0.1241444, -0.762531, 2.841665, 0, 0, 0, 1, 1,
0.1244153, 0.1824195, 1.60178, 0, 0, 0, 1, 1,
0.129802, -1.030996, 1.617386, 0, 0, 0, 1, 1,
0.1307675, 0.7464482, -0.3319277, 0, 0, 0, 1, 1,
0.1310197, -0.3461451, 3.67314, 0, 0, 0, 1, 1,
0.1321006, 0.3224313, 0.8319651, 0, 0, 0, 1, 1,
0.1325862, 0.9804787, -0.2266917, 1, 1, 1, 1, 1,
0.1340982, 2.764683, 0.4412161, 1, 1, 1, 1, 1,
0.1423711, -0.1983803, 3.959991, 1, 1, 1, 1, 1,
0.1432161, 0.7677791, -0.07799795, 1, 1, 1, 1, 1,
0.1506611, 0.680195, 1.408648, 1, 1, 1, 1, 1,
0.1516927, 0.02120714, 3.485917, 1, 1, 1, 1, 1,
0.1518737, 0.837746, -0.5491363, 1, 1, 1, 1, 1,
0.15225, -0.6051689, -0.1305317, 1, 1, 1, 1, 1,
0.1560321, 0.2151511, 0.8537878, 1, 1, 1, 1, 1,
0.158842, 0.3720865, 0.9455309, 1, 1, 1, 1, 1,
0.1598693, -0.3066702, 2.372749, 1, 1, 1, 1, 1,
0.1633256, -0.7914749, 2.879936, 1, 1, 1, 1, 1,
0.1647153, -2.898532, 2.432302, 1, 1, 1, 1, 1,
0.1655131, -0.1251366, 2.045099, 1, 1, 1, 1, 1,
0.1677127, 0.4232579, -1.012342, 1, 1, 1, 1, 1,
0.1682158, -0.6374072, 3.614693, 0, 0, 1, 1, 1,
0.1687119, -1.859577, 1.992224, 1, 0, 0, 1, 1,
0.1715095, -0.3915286, 3.399812, 1, 0, 0, 1, 1,
0.17161, 0.992801, 0.3593864, 1, 0, 0, 1, 1,
0.1766529, -0.4135512, 3.669492, 1, 0, 0, 1, 1,
0.1802169, 0.7150814, -0.2885741, 1, 0, 0, 1, 1,
0.1803924, -1.226241, 3.719138, 0, 0, 0, 1, 1,
0.1811059, 0.6755404, 0.5640555, 0, 0, 0, 1, 1,
0.181478, -0.7331833, 3.104988, 0, 0, 0, 1, 1,
0.1895627, -0.4060097, 2.591316, 0, 0, 0, 1, 1,
0.1910983, 0.7887851, -1.885548, 0, 0, 0, 1, 1,
0.1911883, 1.164412, 0.7907348, 0, 0, 0, 1, 1,
0.1915628, -1.076479, 2.696791, 0, 0, 0, 1, 1,
0.1954815, -1.960229, 2.298263, 1, 1, 1, 1, 1,
0.1963859, 0.2084989, 0.8149356, 1, 1, 1, 1, 1,
0.1983361, -0.4258173, 4.233437, 1, 1, 1, 1, 1,
0.1991213, 1.573427, 0.02400277, 1, 1, 1, 1, 1,
0.2002529, -1.637809, 3.267412, 1, 1, 1, 1, 1,
0.2069788, -0.277043, 2.33485, 1, 1, 1, 1, 1,
0.2084745, -2.189996, 4.141657, 1, 1, 1, 1, 1,
0.2097054, 2.472075, 0.7955698, 1, 1, 1, 1, 1,
0.2113226, 0.5386011, 1.839063, 1, 1, 1, 1, 1,
0.2190342, -1.679528, 2.518405, 1, 1, 1, 1, 1,
0.220812, 0.2763371, -0.8101645, 1, 1, 1, 1, 1,
0.221178, -0.5498005, 1.31784, 1, 1, 1, 1, 1,
0.2223412, -0.02762915, -0.5471436, 1, 1, 1, 1, 1,
0.22689, -1.135993, 2.378499, 1, 1, 1, 1, 1,
0.2288411, 0.4862879, -0.3319041, 1, 1, 1, 1, 1,
0.233256, -0.7670605, 1.45268, 0, 0, 1, 1, 1,
0.2368925, 0.04500451, 0.5594584, 1, 0, 0, 1, 1,
0.23899, 0.8801555, -0.3501151, 1, 0, 0, 1, 1,
0.2391116, -0.9371994, 2.038402, 1, 0, 0, 1, 1,
0.239232, -2.015293, 5.864459, 1, 0, 0, 1, 1,
0.2393827, -0.68126, 3.073872, 1, 0, 0, 1, 1,
0.2394198, -1.258837, 3.870643, 0, 0, 0, 1, 1,
0.2412417, -1.110404, 3.045893, 0, 0, 0, 1, 1,
0.2426412, 1.040637, 1.213113, 0, 0, 0, 1, 1,
0.244345, 0.5136345, 0.09083251, 0, 0, 0, 1, 1,
0.2464838, -0.4725497, 3.892081, 0, 0, 0, 1, 1,
0.2470309, -1.832304, 1.409639, 0, 0, 0, 1, 1,
0.2491615, -1.091371, 2.730296, 0, 0, 0, 1, 1,
0.2491917, -0.8677376, 1.237977, 1, 1, 1, 1, 1,
0.2517085, 0.1769259, 0.2844363, 1, 1, 1, 1, 1,
0.2523035, 0.5893207, 0.8472803, 1, 1, 1, 1, 1,
0.2554585, -0.3400172, 2.413987, 1, 1, 1, 1, 1,
0.2564565, 0.2904124, 2.012189, 1, 1, 1, 1, 1,
0.2676587, -0.7001917, 1.08148, 1, 1, 1, 1, 1,
0.270615, -0.6752039, 2.915964, 1, 1, 1, 1, 1,
0.273863, 1.778092, -0.2612431, 1, 1, 1, 1, 1,
0.2739242, 0.9312673, -0.2270501, 1, 1, 1, 1, 1,
0.276337, -0.4230769, 1.980529, 1, 1, 1, 1, 1,
0.2782973, 1.04794, -0.07033947, 1, 1, 1, 1, 1,
0.2798616, 1.469548, 0.08671183, 1, 1, 1, 1, 1,
0.2880607, 0.2547161, -0.8204952, 1, 1, 1, 1, 1,
0.2881842, -0.6152379, 3.697898, 1, 1, 1, 1, 1,
0.2921507, 0.7658122, 1.553521, 1, 1, 1, 1, 1,
0.2931945, 0.9480875, 0.5756032, 0, 0, 1, 1, 1,
0.2949918, -1.187632, 3.085805, 1, 0, 0, 1, 1,
0.2959663, 0.372021, 0.7095795, 1, 0, 0, 1, 1,
0.3002471, 0.0331578, 2.946585, 1, 0, 0, 1, 1,
0.3042418, 0.4463819, 0.9422451, 1, 0, 0, 1, 1,
0.3055487, -1.326854, 3.018058, 1, 0, 0, 1, 1,
0.3058727, -0.2890501, 2.658112, 0, 0, 0, 1, 1,
0.3083623, 1.180331, -0.49782, 0, 0, 0, 1, 1,
0.3111271, -1.378377, 3.538362, 0, 0, 0, 1, 1,
0.3143303, -0.2732657, 2.15419, 0, 0, 0, 1, 1,
0.3176641, -0.6562155, 2.128339, 0, 0, 0, 1, 1,
0.3178137, -1.061534, 3.468139, 0, 0, 0, 1, 1,
0.3200998, -1.285818, 4.759952, 0, 0, 0, 1, 1,
0.3203143, 0.2230857, 0.681684, 1, 1, 1, 1, 1,
0.3233309, -1.140551, 2.974805, 1, 1, 1, 1, 1,
0.3255029, 0.3794904, 0.1370497, 1, 1, 1, 1, 1,
0.3256395, 1.628684, 0.3255676, 1, 1, 1, 1, 1,
0.3329353, -0.9265424, 4.63757, 1, 1, 1, 1, 1,
0.3337783, -1.106273, 1.574075, 1, 1, 1, 1, 1,
0.3426233, -0.890956, 1.663417, 1, 1, 1, 1, 1,
0.342636, -0.2515614, 2.786869, 1, 1, 1, 1, 1,
0.3480724, 1.129499, -0.4768485, 1, 1, 1, 1, 1,
0.3546352, -0.1357183, 1.742723, 1, 1, 1, 1, 1,
0.3551034, -0.4618193, 2.915428, 1, 1, 1, 1, 1,
0.3566811, 0.583532, 0.5943587, 1, 1, 1, 1, 1,
0.3602289, 2.097048, 1.168595, 1, 1, 1, 1, 1,
0.3608529, 1.395395, -1.184617, 1, 1, 1, 1, 1,
0.3612094, 0.3814562, 0.3830937, 1, 1, 1, 1, 1,
0.3661135, 0.6659249, 0.1665121, 0, 0, 1, 1, 1,
0.3707047, -0.9906301, 3.118755, 1, 0, 0, 1, 1,
0.3707896, -0.7112009, 4.660685, 1, 0, 0, 1, 1,
0.3727634, -0.9378691, 3.395117, 1, 0, 0, 1, 1,
0.3738975, 1.137312, 1.008616, 1, 0, 0, 1, 1,
0.3760606, 1.273422, -0.185913, 1, 0, 0, 1, 1,
0.3769265, 0.9637119, -1.021859, 0, 0, 0, 1, 1,
0.3836496, -0.6230788, 1.796838, 0, 0, 0, 1, 1,
0.3839193, -0.8759317, 3.499628, 0, 0, 0, 1, 1,
0.3847395, -2.403858, 3.685164, 0, 0, 0, 1, 1,
0.3921082, -0.197396, 1.162583, 0, 0, 0, 1, 1,
0.3942159, 0.5916768, 1.117524, 0, 0, 0, 1, 1,
0.3960797, 0.5576974, -1.215252, 0, 0, 0, 1, 1,
0.3982501, -0.5636287, 1.952854, 1, 1, 1, 1, 1,
0.4011787, 0.3493293, 0.8914179, 1, 1, 1, 1, 1,
0.4024962, -2.022679, 2.974234, 1, 1, 1, 1, 1,
0.4029353, -0.343688, 0.7601241, 1, 1, 1, 1, 1,
0.4033059, -0.294526, 2.489721, 1, 1, 1, 1, 1,
0.4039985, -1.147115, 2.442016, 1, 1, 1, 1, 1,
0.404833, -1.025045, 3.485678, 1, 1, 1, 1, 1,
0.4078852, -1.483508, 3.094375, 1, 1, 1, 1, 1,
0.4113929, 1.481383, 0.8336535, 1, 1, 1, 1, 1,
0.4139302, 0.2179452, 2.029578, 1, 1, 1, 1, 1,
0.4142886, -1.214771, 4.155051, 1, 1, 1, 1, 1,
0.4168594, 0.3070135, -1.623764, 1, 1, 1, 1, 1,
0.4187776, 0.1859172, 1.672521, 1, 1, 1, 1, 1,
0.4205051, 0.5605607, -2.315926, 1, 1, 1, 1, 1,
0.4254156, -0.02303689, 0.869273, 1, 1, 1, 1, 1,
0.4260491, -0.6603497, 2.542683, 0, 0, 1, 1, 1,
0.4261403, 0.7871418, 0.6666961, 1, 0, 0, 1, 1,
0.4267685, 0.7226434, 0.9510074, 1, 0, 0, 1, 1,
0.4286025, 1.655945, -0.1069795, 1, 0, 0, 1, 1,
0.4296863, -1.015731, 2.042689, 1, 0, 0, 1, 1,
0.4300902, 0.9418951, -1.033429, 1, 0, 0, 1, 1,
0.4318569, 1.387879, -1.748069, 0, 0, 0, 1, 1,
0.4320357, -1.078014, 3.830472, 0, 0, 0, 1, 1,
0.4431589, -1.780396, 3.640004, 0, 0, 0, 1, 1,
0.4432689, -0.4854832, 2.484807, 0, 0, 0, 1, 1,
0.4434557, 0.4343274, 1.01335, 0, 0, 0, 1, 1,
0.4545675, -0.2609198, 2.682728, 0, 0, 0, 1, 1,
0.4561495, -0.1087582, 1.40203, 0, 0, 0, 1, 1,
0.4579564, -0.4290965, 2.284911, 1, 1, 1, 1, 1,
0.4595318, -0.266751, 1.048682, 1, 1, 1, 1, 1,
0.4607534, -1.195604, 1.982289, 1, 1, 1, 1, 1,
0.4634962, 0.7922174, -0.9997707, 1, 1, 1, 1, 1,
0.4640139, 0.05175947, 0.3917506, 1, 1, 1, 1, 1,
0.4670178, -0.8956353, 2.472674, 1, 1, 1, 1, 1,
0.4728825, 0.3775612, 2.443579, 1, 1, 1, 1, 1,
0.4814141, -0.3094538, 1.51824, 1, 1, 1, 1, 1,
0.4864927, 0.6985905, 0.2270493, 1, 1, 1, 1, 1,
0.4880049, -1.246946, 2.596145, 1, 1, 1, 1, 1,
0.4929878, 2.069112, 2.158107, 1, 1, 1, 1, 1,
0.4993235, -1.538107, 1.244202, 1, 1, 1, 1, 1,
0.502095, 2.443769, -1.255985, 1, 1, 1, 1, 1,
0.5034834, -0.7569624, 1.921845, 1, 1, 1, 1, 1,
0.5038819, -1.092321, 2.559035, 1, 1, 1, 1, 1,
0.5101786, -0.1859436, 1.50016, 0, 0, 1, 1, 1,
0.5112661, -0.1075143, 2.929917, 1, 0, 0, 1, 1,
0.5179533, -0.1298328, 1.76779, 1, 0, 0, 1, 1,
0.5187285, -0.8722671, 2.247246, 1, 0, 0, 1, 1,
0.5203393, 0.09841163, 0.7098475, 1, 0, 0, 1, 1,
0.5208894, 1.95922, 0.8349161, 1, 0, 0, 1, 1,
0.5265858, 0.9823985, 0.8393107, 0, 0, 0, 1, 1,
0.5287909, -0.2219813, 1.85378, 0, 0, 0, 1, 1,
0.5328795, 0.384031, 1.148551, 0, 0, 0, 1, 1,
0.5355556, 0.7873323, -0.1514056, 0, 0, 0, 1, 1,
0.5411505, -1.329563, 2.977443, 0, 0, 0, 1, 1,
0.5434832, 0.9941444, 0.1096831, 0, 0, 0, 1, 1,
0.5481741, -0.2664919, 1.554244, 0, 0, 0, 1, 1,
0.5566546, -0.9601239, 3.453271, 1, 1, 1, 1, 1,
0.5575034, -0.5544454, 2.476467, 1, 1, 1, 1, 1,
0.5589884, 0.2985124, 1.174443, 1, 1, 1, 1, 1,
0.5667963, 0.5793215, 0.3725711, 1, 1, 1, 1, 1,
0.5690781, 1.151161, 0.4141374, 1, 1, 1, 1, 1,
0.5818785, -0.7393594, 1.703446, 1, 1, 1, 1, 1,
0.5819733, -1.161907, 2.978429, 1, 1, 1, 1, 1,
0.5833297, 0.8248031, -0.2761089, 1, 1, 1, 1, 1,
0.5871874, -0.377352, 1.194179, 1, 1, 1, 1, 1,
0.5881643, 0.7405695, 0.1168672, 1, 1, 1, 1, 1,
0.5937079, 0.2342118, -0.3229679, 1, 1, 1, 1, 1,
0.5951098, -1.451097, 1.752342, 1, 1, 1, 1, 1,
0.5955431, -1.783855, 4.943987, 1, 1, 1, 1, 1,
0.5958347, 0.2733907, 1.999915, 1, 1, 1, 1, 1,
0.5964074, -0.4304311, 2.597288, 1, 1, 1, 1, 1,
0.6019035, 2.483086, 0.4104139, 0, 0, 1, 1, 1,
0.6022081, -0.7015931, 2.397337, 1, 0, 0, 1, 1,
0.6037437, 2.233357, -0.4905578, 1, 0, 0, 1, 1,
0.6044691, -0.821058, 1.889987, 1, 0, 0, 1, 1,
0.6069956, 0.9730502, 0.3404467, 1, 0, 0, 1, 1,
0.6072121, -0.3079915, 2.062686, 1, 0, 0, 1, 1,
0.6115909, 0.3014667, 0.3300267, 0, 0, 0, 1, 1,
0.6117253, 0.4286544, 1.3649, 0, 0, 0, 1, 1,
0.6143673, -0.02775643, 2.814528, 0, 0, 0, 1, 1,
0.6145526, 0.8282119, 0.6397594, 0, 0, 0, 1, 1,
0.6158627, -1.506155, 2.727007, 0, 0, 0, 1, 1,
0.6171405, 0.2316131, 0.6348004, 0, 0, 0, 1, 1,
0.6193845, -0.2583324, 1.245148, 0, 0, 0, 1, 1,
0.6199313, 0.3758544, 3.146687, 1, 1, 1, 1, 1,
0.6213105, -0.7101549, 1.27348, 1, 1, 1, 1, 1,
0.6351694, 2.698852, 0.1688018, 1, 1, 1, 1, 1,
0.6354525, -1.102341, 2.973392, 1, 1, 1, 1, 1,
0.6389092, 1.931085, 0.5238773, 1, 1, 1, 1, 1,
0.6461124, -0.283882, 3.071595, 1, 1, 1, 1, 1,
0.6484314, 0.1617322, 0.9823105, 1, 1, 1, 1, 1,
0.6486816, 1.045479, 0.7385232, 1, 1, 1, 1, 1,
0.6486835, -0.951865, 4.09903, 1, 1, 1, 1, 1,
0.6558601, 0.4480689, 0.2769763, 1, 1, 1, 1, 1,
0.662708, 0.3465007, 0.07109299, 1, 1, 1, 1, 1,
0.6630915, 0.1679194, 2.662194, 1, 1, 1, 1, 1,
0.6653146, 0.4798326, 1.836743, 1, 1, 1, 1, 1,
0.6784329, -0.6286693, 0.4340365, 1, 1, 1, 1, 1,
0.678849, 1.649901, 1.261484, 1, 1, 1, 1, 1,
0.6822494, 1.327731, -0.4658084, 0, 0, 1, 1, 1,
0.6843973, 0.47774, 1.086668, 1, 0, 0, 1, 1,
0.6853629, 1.48923, 0.8253144, 1, 0, 0, 1, 1,
0.6862231, -1.867591, 3.405342, 1, 0, 0, 1, 1,
0.6879323, -0.4821802, 2.750463, 1, 0, 0, 1, 1,
0.6959779, -0.1698965, 1.999806, 1, 0, 0, 1, 1,
0.6994031, -1.512893, 2.689282, 0, 0, 0, 1, 1,
0.7043651, -0.4648698, 0.01836966, 0, 0, 0, 1, 1,
0.7127958, -1.140403, 3.211626, 0, 0, 0, 1, 1,
0.7158157, -0.2995023, 1.360481, 0, 0, 0, 1, 1,
0.7169148, -0.7286676, 1.923701, 0, 0, 0, 1, 1,
0.7251934, -0.3665599, 0.1657056, 0, 0, 0, 1, 1,
0.7253915, -0.3713396, 0.7905854, 0, 0, 0, 1, 1,
0.7273536, 0.7607383, 0.4076384, 1, 1, 1, 1, 1,
0.7333849, 0.8547982, 0.5130986, 1, 1, 1, 1, 1,
0.7352755, 1.199907, 0.008236001, 1, 1, 1, 1, 1,
0.7405974, -0.3707672, 2.905631, 1, 1, 1, 1, 1,
0.7418191, 0.3593052, 2.061638, 1, 1, 1, 1, 1,
0.7424799, 0.2338962, 0.1450642, 1, 1, 1, 1, 1,
0.7522238, 0.1775629, 1.966563, 1, 1, 1, 1, 1,
0.7523132, 1.860153, -0.9464672, 1, 1, 1, 1, 1,
0.7663237, -0.385752, 2.785954, 1, 1, 1, 1, 1,
0.7671486, -0.06833649, 2.447107, 1, 1, 1, 1, 1,
0.7693914, -0.1033666, 0.4361744, 1, 1, 1, 1, 1,
0.7729433, 1.537108, -0.9879584, 1, 1, 1, 1, 1,
0.7842057, 2.031214, -0.3755434, 1, 1, 1, 1, 1,
0.7871837, 1.376047, 1.026133, 1, 1, 1, 1, 1,
0.7904851, -0.1430118, 2.346303, 1, 1, 1, 1, 1,
0.8014721, -0.4154386, 1.12687, 0, 0, 1, 1, 1,
0.8033376, 1.516002, 0.1113617, 1, 0, 0, 1, 1,
0.8034161, 0.7538367, 1.071813, 1, 0, 0, 1, 1,
0.8036575, 0.1179035, 1.262248, 1, 0, 0, 1, 1,
0.8050283, 0.5466812, -0.5529325, 1, 0, 0, 1, 1,
0.8117695, 0.58233, 0.87174, 1, 0, 0, 1, 1,
0.8128046, -0.9743919, 3.188937, 0, 0, 0, 1, 1,
0.8142067, 1.069479, -0.07581692, 0, 0, 0, 1, 1,
0.8149621, 0.7858212, 1.570781, 0, 0, 0, 1, 1,
0.8159213, 0.5271865, 2.369162, 0, 0, 0, 1, 1,
0.8208476, 0.7778677, -0.1973052, 0, 0, 0, 1, 1,
0.8221444, 0.1222736, 0.6195203, 0, 0, 0, 1, 1,
0.8244451, 0.444659, 0.285659, 0, 0, 0, 1, 1,
0.8252626, 0.2939926, 1.448288, 1, 1, 1, 1, 1,
0.8264806, -0.4934752, 1.658452, 1, 1, 1, 1, 1,
0.8308342, -0.2636346, 1.965534, 1, 1, 1, 1, 1,
0.8406667, -0.5769337, 1.681401, 1, 1, 1, 1, 1,
0.8406681, -0.5296453, 2.226197, 1, 1, 1, 1, 1,
0.8418087, -0.6252782, 1.370538, 1, 1, 1, 1, 1,
0.8543212, 0.3052088, 3.728415, 1, 1, 1, 1, 1,
0.8599052, -0.1007691, 1.848692, 1, 1, 1, 1, 1,
0.8602797, -0.6302296, 3.230539, 1, 1, 1, 1, 1,
0.865957, -0.7365839, 3.547953, 1, 1, 1, 1, 1,
0.8699764, -1.21645, 4.403226, 1, 1, 1, 1, 1,
0.8738046, -1.367123, 1.481249, 1, 1, 1, 1, 1,
0.8805499, 1.337437, 0.6263377, 1, 1, 1, 1, 1,
0.881591, 1.102556, 0.9103467, 1, 1, 1, 1, 1,
0.8864235, -1.190661, 2.287955, 1, 1, 1, 1, 1,
0.8894628, -0.4853034, 1.807361, 0, 0, 1, 1, 1,
0.8913627, 0.481643, -0.009053841, 1, 0, 0, 1, 1,
0.8925501, 0.2810046, 2.264291, 1, 0, 0, 1, 1,
0.8931467, 0.1945173, 3.007084, 1, 0, 0, 1, 1,
0.8933754, 0.4094786, 1.646304, 1, 0, 0, 1, 1,
0.8944973, 0.203647, 1.797685, 1, 0, 0, 1, 1,
0.8995951, 0.01505716, 2.714251, 0, 0, 0, 1, 1,
0.899816, -0.8120857, 1.799031, 0, 0, 0, 1, 1,
0.9042064, 0.3927428, -0.2966309, 0, 0, 0, 1, 1,
0.9044193, 0.5593041, 0.4091388, 0, 0, 0, 1, 1,
0.9078213, -2.017141, 3.641168, 0, 0, 0, 1, 1,
0.9092268, -0.3110048, 1.73432, 0, 0, 0, 1, 1,
0.9147105, -0.9043635, 3.204889, 0, 0, 0, 1, 1,
0.91478, -0.1712927, 2.277575, 1, 1, 1, 1, 1,
0.9153277, -1.528705, 0.9356769, 1, 1, 1, 1, 1,
0.9168019, 1.052988, 2.234353, 1, 1, 1, 1, 1,
0.9305982, 0.2748674, -0.940932, 1, 1, 1, 1, 1,
0.9307948, -0.2473419, 0.3109773, 1, 1, 1, 1, 1,
0.9335232, -1.488336, 1.247334, 1, 1, 1, 1, 1,
0.9344416, 1.25434, -0.480113, 1, 1, 1, 1, 1,
0.9507018, -1.177694, 3.605585, 1, 1, 1, 1, 1,
0.9519879, -1.231553, 2.757491, 1, 1, 1, 1, 1,
0.9528655, -0.240653, 3.041866, 1, 1, 1, 1, 1,
0.9534919, -0.4903752, 3.378648, 1, 1, 1, 1, 1,
0.9590896, -1.6267, 2.049865, 1, 1, 1, 1, 1,
0.9591727, 0.02761207, 1.856763, 1, 1, 1, 1, 1,
0.9634355, 0.3726418, 1.138335, 1, 1, 1, 1, 1,
0.9664354, 0.5075141, 1.013826, 1, 1, 1, 1, 1,
0.9672489, -1.055945, 4.709574, 0, 0, 1, 1, 1,
0.9694069, 0.3815261, 0.5932879, 1, 0, 0, 1, 1,
0.9701352, -0.8191621, 2.064934, 1, 0, 0, 1, 1,
0.9733919, -1.075303, 2.10152, 1, 0, 0, 1, 1,
0.9806105, 0.6678948, 0.2579335, 1, 0, 0, 1, 1,
0.9824515, 0.2662986, 1.626395, 1, 0, 0, 1, 1,
0.9828724, 0.1346189, 1.066541, 0, 0, 0, 1, 1,
0.9894806, 1.449971, 1.255648, 0, 0, 0, 1, 1,
0.9902637, 0.6482403, -0.3154559, 0, 0, 0, 1, 1,
0.9916291, -1.027104, 2.336756, 0, 0, 0, 1, 1,
0.9955438, 0.03729724, 0.1936425, 0, 0, 0, 1, 1,
0.9980347, 0.7352639, 1.001777, 0, 0, 0, 1, 1,
1.008113, -1.48296, 3.531486, 0, 0, 0, 1, 1,
1.011852, -1.983998, 1.85003, 1, 1, 1, 1, 1,
1.01485, 0.07128271, 0.2862802, 1, 1, 1, 1, 1,
1.017495, 2.285548, 0.6623758, 1, 1, 1, 1, 1,
1.023328, 0.9088178, 0.2919005, 1, 1, 1, 1, 1,
1.032066, -0.04947127, 3.122761, 1, 1, 1, 1, 1,
1.045514, 0.5039483, 0.952937, 1, 1, 1, 1, 1,
1.047211, -0.2441906, 1.011814, 1, 1, 1, 1, 1,
1.049423, -1.865149, 2.328842, 1, 1, 1, 1, 1,
1.051968, 0.8100591, 0.9046347, 1, 1, 1, 1, 1,
1.052599, -0.09052595, 2.859835, 1, 1, 1, 1, 1,
1.053265, -0.8228949, 2.817124, 1, 1, 1, 1, 1,
1.05365, -0.5220304, 0.904124, 1, 1, 1, 1, 1,
1.058095, 0.1308246, 2.818872, 1, 1, 1, 1, 1,
1.059766, 0.03003935, -0.2031614, 1, 1, 1, 1, 1,
1.060562, -0.3200976, 1.031146, 1, 1, 1, 1, 1,
1.062334, -0.3570907, 1.819326, 0, 0, 1, 1, 1,
1.062497, 0.1136437, 2.831849, 1, 0, 0, 1, 1,
1.067988, 0.514987, 1.005656, 1, 0, 0, 1, 1,
1.074758, 0.7681245, 1.530557, 1, 0, 0, 1, 1,
1.077181, -1.415655, 3.948793, 1, 0, 0, 1, 1,
1.079132, -1.03784, 2.45462, 1, 0, 0, 1, 1,
1.086723, -0.01026463, 0.4054986, 0, 0, 0, 1, 1,
1.089327, 1.941957, 0.6585441, 0, 0, 0, 1, 1,
1.093734, -0.08273448, 0.6042731, 0, 0, 0, 1, 1,
1.097261, 0.1708718, 2.606767, 0, 0, 0, 1, 1,
1.111177, 1.117328, 1.557697, 0, 0, 0, 1, 1,
1.115422, -2.205159, 2.414015, 0, 0, 0, 1, 1,
1.120874, -0.4451361, 1.994409, 0, 0, 0, 1, 1,
1.123621, -0.4950108, 1.031722, 1, 1, 1, 1, 1,
1.129003, 1.288905, 0.91294, 1, 1, 1, 1, 1,
1.134108, -1.589256, 3.256054, 1, 1, 1, 1, 1,
1.138487, -1.037347, 1.940675, 1, 1, 1, 1, 1,
1.139802, 1.027068, 1.680081, 1, 1, 1, 1, 1,
1.143465, 1.431383, 0.4792953, 1, 1, 1, 1, 1,
1.144726, -0.03187342, 1.545468, 1, 1, 1, 1, 1,
1.147049, 0.7217692, 0.7464344, 1, 1, 1, 1, 1,
1.147072, -0.2883823, 0.7042753, 1, 1, 1, 1, 1,
1.172119, -0.1699202, 1.759467, 1, 1, 1, 1, 1,
1.179896, -0.9006364, 1.697828, 1, 1, 1, 1, 1,
1.181963, 0.5696579, 1.875351, 1, 1, 1, 1, 1,
1.186527, 0.5901436, 0.1543086, 1, 1, 1, 1, 1,
1.192465, -0.6812567, 0.6592661, 1, 1, 1, 1, 1,
1.192639, 0.2082477, 1.341226, 1, 1, 1, 1, 1,
1.193651, 0.5813629, 1.331403, 0, 0, 1, 1, 1,
1.197442, 0.6654439, 3.305764, 1, 0, 0, 1, 1,
1.197711, -0.3648677, 2.338463, 1, 0, 0, 1, 1,
1.198987, -0.4948362, -0.4260562, 1, 0, 0, 1, 1,
1.206688, -1.370755, 2.450349, 1, 0, 0, 1, 1,
1.216081, -1.338104, 2.546197, 1, 0, 0, 1, 1,
1.219614, 0.2843775, 1.226192, 0, 0, 0, 1, 1,
1.224882, 0.868663, -1.523636, 0, 0, 0, 1, 1,
1.228818, -1.419924, 4.380242, 0, 0, 0, 1, 1,
1.233842, -0.3734096, 2.160928, 0, 0, 0, 1, 1,
1.23811, -1.325857, 2.636707, 0, 0, 0, 1, 1,
1.238479, -0.06556488, 1.450287, 0, 0, 0, 1, 1,
1.248441, 0.739666, 1.770448, 0, 0, 0, 1, 1,
1.253561, -1.269542, 1.225542, 1, 1, 1, 1, 1,
1.264704, -1.747279, 2.482592, 1, 1, 1, 1, 1,
1.273334, 0.7951558, -0.247975, 1, 1, 1, 1, 1,
1.281317, 2.251779, 0.4967763, 1, 1, 1, 1, 1,
1.290328, -0.4290641, 1.953215, 1, 1, 1, 1, 1,
1.306733, 1.761781, -0.7505047, 1, 1, 1, 1, 1,
1.3119, 0.5532678, 1.563303, 1, 1, 1, 1, 1,
1.323818, 0.08080678, -1.078296, 1, 1, 1, 1, 1,
1.327294, 1.577402, 0.6361628, 1, 1, 1, 1, 1,
1.338712, -1.179162, 1.732299, 1, 1, 1, 1, 1,
1.340271, -0.008257035, -0.05172503, 1, 1, 1, 1, 1,
1.351672, -0.775554, 3.167377, 1, 1, 1, 1, 1,
1.355651, -0.2453251, 3.133236, 1, 1, 1, 1, 1,
1.356941, 2.105356, 1.53747, 1, 1, 1, 1, 1,
1.375932, 0.4353747, 1.886498, 1, 1, 1, 1, 1,
1.384124, 0.5805119, 1.702938, 0, 0, 1, 1, 1,
1.389812, -0.4171821, 1.347267, 1, 0, 0, 1, 1,
1.397406, 1.968144, 2.383024, 1, 0, 0, 1, 1,
1.398411, -1.981092, 2.055352, 1, 0, 0, 1, 1,
1.414431, 1.67574, 1.297004, 1, 0, 0, 1, 1,
1.435179, -2.052707, 2.513675, 1, 0, 0, 1, 1,
1.459178, 0.2010121, 0.07823623, 0, 0, 0, 1, 1,
1.466605, -0.2077181, 1.847896, 0, 0, 0, 1, 1,
1.467124, 1.413201, 0.8840888, 0, 0, 0, 1, 1,
1.491926, -1.374474, 3.30276, 0, 0, 0, 1, 1,
1.494493, 0.9601744, 1.123278, 0, 0, 0, 1, 1,
1.497608, -0.9682229, 3.170024, 0, 0, 0, 1, 1,
1.518798, 2.57186, 1.209861, 0, 0, 0, 1, 1,
1.520158, 0.6510327, 0.6305505, 1, 1, 1, 1, 1,
1.538928, -1.029603, 1.243828, 1, 1, 1, 1, 1,
1.541451, 0.3120074, 2.937117, 1, 1, 1, 1, 1,
1.546087, -0.4636615, 1.554246, 1, 1, 1, 1, 1,
1.556526, -0.3989094, 0.8113846, 1, 1, 1, 1, 1,
1.565068, 0.1624733, 1.354389, 1, 1, 1, 1, 1,
1.576378, 0.3698388, 0.6023919, 1, 1, 1, 1, 1,
1.596848, -0.4581608, 3.019477, 1, 1, 1, 1, 1,
1.599798, 1.10205, 0.9156497, 1, 1, 1, 1, 1,
1.608148, -0.5239662, 1.249061, 1, 1, 1, 1, 1,
1.614287, -0.1719116, 3.157847, 1, 1, 1, 1, 1,
1.617367, 1.26584, 0.02173146, 1, 1, 1, 1, 1,
1.620683, -0.9747339, 3.777611, 1, 1, 1, 1, 1,
1.621355, 0.05712895, 1.842717, 1, 1, 1, 1, 1,
1.624028, -0.0365798, 0.5300372, 1, 1, 1, 1, 1,
1.65683, 0.1949955, 2.43755, 0, 0, 1, 1, 1,
1.65834, 0.05197442, 3.529822, 1, 0, 0, 1, 1,
1.662992, -1.848767, 1.975412, 1, 0, 0, 1, 1,
1.677359, 0.3069641, 2.620319, 1, 0, 0, 1, 1,
1.679743, 0.6802367, 0.4170734, 1, 0, 0, 1, 1,
1.690188, -0.3952602, 1.14423, 1, 0, 0, 1, 1,
1.726569, -1.972798, 0.7969223, 0, 0, 0, 1, 1,
1.729284, 0.4839464, 0.5933057, 0, 0, 0, 1, 1,
1.739732, -0.5953937, 1.196936, 0, 0, 0, 1, 1,
1.74202, 1.512544, 1.659981, 0, 0, 0, 1, 1,
1.747474, 1.233357, 1.236185, 0, 0, 0, 1, 1,
1.750373, -0.5914507, -0.2494315, 0, 0, 0, 1, 1,
1.753216, 0.2708353, 2.522173, 0, 0, 0, 1, 1,
1.763014, -0.5863289, 0.8127003, 1, 1, 1, 1, 1,
1.787297, 1.254103, 0.863188, 1, 1, 1, 1, 1,
1.790321, -0.5833503, 2.014159, 1, 1, 1, 1, 1,
1.812796, -0.3842595, 2.818869, 1, 1, 1, 1, 1,
1.831674, 1.586744, -0.3022191, 1, 1, 1, 1, 1,
1.838953, -0.1897414, 1.422836, 1, 1, 1, 1, 1,
1.851462, -0.7834448, 1.297219, 1, 1, 1, 1, 1,
1.856826, -2.500564, 0.2136468, 1, 1, 1, 1, 1,
1.868361, -0.7877674, 2.392341, 1, 1, 1, 1, 1,
1.870739, 0.1267082, 2.739081, 1, 1, 1, 1, 1,
1.874767, 0.8435084, 0.6440775, 1, 1, 1, 1, 1,
1.892974, 0.5628845, 1.13623, 1, 1, 1, 1, 1,
1.96015, -0.1408757, 1.780997, 1, 1, 1, 1, 1,
1.965265, 0.1218207, 1.441466, 1, 1, 1, 1, 1,
1.998495, 1.948786, 0.889389, 1, 1, 1, 1, 1,
2.012935, -1.438706, 2.169082, 0, 0, 1, 1, 1,
2.039037, 1.156107, 3.145854, 1, 0, 0, 1, 1,
2.058077, 0.3478842, 1.240365, 1, 0, 0, 1, 1,
2.060852, 0.7413621, 2.538348, 1, 0, 0, 1, 1,
2.061403, -1.572969, 2.498499, 1, 0, 0, 1, 1,
2.061753, 1.247318, 1.122472, 1, 0, 0, 1, 1,
2.08289, -0.03287549, 2.347085, 0, 0, 0, 1, 1,
2.088754, -0.7293919, 1.187132, 0, 0, 0, 1, 1,
2.098027, -0.6400691, 1.353859, 0, 0, 0, 1, 1,
2.129297, -1.016136, 1.715849, 0, 0, 0, 1, 1,
2.150988, 0.3855845, 1.041925, 0, 0, 0, 1, 1,
2.151567, 0.8100211, -0.01483317, 0, 0, 0, 1, 1,
2.161785, 0.6374963, 0.2559801, 0, 0, 0, 1, 1,
2.287496, 1.459452, -0.5841559, 1, 1, 1, 1, 1,
2.30032, 0.9136209, 0.8031867, 1, 1, 1, 1, 1,
2.482008, 0.314448, 1.451708, 1, 1, 1, 1, 1,
2.518169, 0.6468335, 1.294775, 1, 1, 1, 1, 1,
2.665123, -0.8195329, 1.403814, 1, 1, 1, 1, 1,
2.803839, 1.039289, 0.8453358, 1, 1, 1, 1, 1,
2.92419, -0.227164, 0.8523859, 1, 1, 1, 1, 1
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
var radius = 9.859642;
var distance = 34.63158;
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
mvMatrix.translate( 0.2737125, -0.170803, -0.07041216 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.63158);
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
