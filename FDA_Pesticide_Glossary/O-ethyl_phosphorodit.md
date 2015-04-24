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
-3.024441, 1.215096, -0.7505113, 1, 0, 0, 1,
-2.990851, -0.7700911, -1.695141, 1, 0.007843138, 0, 1,
-2.767776, 0.4006241, -0.4435561, 1, 0.01176471, 0, 1,
-2.714151, 0.4659293, -2.475311, 1, 0.01960784, 0, 1,
-2.692059, 1.487099, -1.719938, 1, 0.02352941, 0, 1,
-2.666967, -1.184963, -2.614259, 1, 0.03137255, 0, 1,
-2.636456, 1.065546, -3.58906, 1, 0.03529412, 0, 1,
-2.634953, 0.6562009, 0.1225205, 1, 0.04313726, 0, 1,
-2.603467, -0.8578932, -2.86606, 1, 0.04705882, 0, 1,
-2.586925, -0.2406878, -0.5114906, 1, 0.05490196, 0, 1,
-2.56089, -0.1332429, 0.1573509, 1, 0.05882353, 0, 1,
-2.539657, 1.087298, -0.5824382, 1, 0.06666667, 0, 1,
-2.458426, -1.499832, -0.2169347, 1, 0.07058824, 0, 1,
-2.430799, 0.2106666, -0.3657029, 1, 0.07843138, 0, 1,
-2.318378, -2.181635, -1.953595, 1, 0.08235294, 0, 1,
-2.192064, 1.303696, -0.6586179, 1, 0.09019608, 0, 1,
-2.151357, -0.6390157, -1.835936, 1, 0.09411765, 0, 1,
-2.115024, 1.273386, -0.3572487, 1, 0.1019608, 0, 1,
-2.062689, 0.1779835, -0.2070627, 1, 0.1098039, 0, 1,
-2.061664, 2.956526, 0.5756545, 1, 0.1137255, 0, 1,
-2.052831, -0.7395759, -3.281051, 1, 0.1215686, 0, 1,
-2.050033, 0.1254051, -2.862378, 1, 0.1254902, 0, 1,
-2.050026, 0.706073, 0.2863538, 1, 0.1333333, 0, 1,
-2.029259, -0.8648598, -3.61293, 1, 0.1372549, 0, 1,
-2.027408, -0.3852138, -2.404637, 1, 0.145098, 0, 1,
-2.010282, -1.067614, -2.999223, 1, 0.1490196, 0, 1,
-2.006656, 0.9966384, 1.258349, 1, 0.1568628, 0, 1,
-1.982688, -0.8410547, -2.309477, 1, 0.1607843, 0, 1,
-1.963038, -1.02198, -1.985888, 1, 0.1686275, 0, 1,
-1.960458, 0.05876253, 0.221368, 1, 0.172549, 0, 1,
-1.956657, -0.9630132, -0.7135319, 1, 0.1803922, 0, 1,
-1.94628, 0.01458098, -3.607497, 1, 0.1843137, 0, 1,
-1.930894, 1.069787, -0.9435397, 1, 0.1921569, 0, 1,
-1.90302, 1.475681, -0.2483899, 1, 0.1960784, 0, 1,
-1.888354, 1.716483, -0.4331547, 1, 0.2039216, 0, 1,
-1.875941, 0.2949567, -1.333368, 1, 0.2117647, 0, 1,
-1.859694, -0.0266272, -3.307573, 1, 0.2156863, 0, 1,
-1.84659, 0.9535488, -1.659466, 1, 0.2235294, 0, 1,
-1.77625, 0.7995107, -3.052382, 1, 0.227451, 0, 1,
-1.775906, 0.4770377, -0.9144013, 1, 0.2352941, 0, 1,
-1.754802, 1.285071, -1.401582, 1, 0.2392157, 0, 1,
-1.737045, 0.7935055, -0.805748, 1, 0.2470588, 0, 1,
-1.735645, -1.089509, -2.471845, 1, 0.2509804, 0, 1,
-1.727683, 0.01716869, -2.046464, 1, 0.2588235, 0, 1,
-1.724691, 0.3506441, -2.565804, 1, 0.2627451, 0, 1,
-1.724213, 0.03756741, -2.100305, 1, 0.2705882, 0, 1,
-1.717716, 0.3573991, -1.488433, 1, 0.2745098, 0, 1,
-1.713568, 0.3072599, -1.404382, 1, 0.282353, 0, 1,
-1.698412, 0.2958764, -2.617638, 1, 0.2862745, 0, 1,
-1.697655, 0.3335966, 0.09789216, 1, 0.2941177, 0, 1,
-1.690681, -0.7543375, -3.606218, 1, 0.3019608, 0, 1,
-1.683225, -0.0005958823, -4.804742, 1, 0.3058824, 0, 1,
-1.662705, -0.8542333, -3.028347, 1, 0.3137255, 0, 1,
-1.633356, -1.54616, -3.298351, 1, 0.3176471, 0, 1,
-1.632831, -0.05154213, -2.287079, 1, 0.3254902, 0, 1,
-1.62255, 1.061087, -0.565915, 1, 0.3294118, 0, 1,
-1.616312, 0.477576, -1.588591, 1, 0.3372549, 0, 1,
-1.612878, -0.3992762, -1.017222, 1, 0.3411765, 0, 1,
-1.611099, -0.59196, -2.759896, 1, 0.3490196, 0, 1,
-1.610267, 0.7200214, 0.2222199, 1, 0.3529412, 0, 1,
-1.592781, 0.6744128, -1.773322, 1, 0.3607843, 0, 1,
-1.592422, 0.100469, -0.4012896, 1, 0.3647059, 0, 1,
-1.585832, -1.743118, -2.242667, 1, 0.372549, 0, 1,
-1.564338, -0.03867429, -1.342419, 1, 0.3764706, 0, 1,
-1.533666, 1.711469, -2.095567, 1, 0.3843137, 0, 1,
-1.522699, 1.500884, 0.1915532, 1, 0.3882353, 0, 1,
-1.510395, 0.4623472, -2.773523, 1, 0.3960784, 0, 1,
-1.497321, -0.8052499, -2.269848, 1, 0.4039216, 0, 1,
-1.496054, -1.668637, -1.033826, 1, 0.4078431, 0, 1,
-1.496009, -0.0938397, -2.742204, 1, 0.4156863, 0, 1,
-1.485861, -0.03683835, -0.1545054, 1, 0.4196078, 0, 1,
-1.46695, -1.737455, -1.367862, 1, 0.427451, 0, 1,
-1.459747, 0.2873104, -1.666109, 1, 0.4313726, 0, 1,
-1.454511, 0.05313502, -1.740501, 1, 0.4392157, 0, 1,
-1.453427, -0.06978332, -1.032635, 1, 0.4431373, 0, 1,
-1.45153, -0.8249629, -2.005465, 1, 0.4509804, 0, 1,
-1.448536, -0.4955612, -2.436176, 1, 0.454902, 0, 1,
-1.444498, -0.5531355, -2.476225, 1, 0.4627451, 0, 1,
-1.437471, 1.275564, -2.056154, 1, 0.4666667, 0, 1,
-1.433538, -0.1472427, -1.048391, 1, 0.4745098, 0, 1,
-1.429953, -1.441493, -2.300266, 1, 0.4784314, 0, 1,
-1.429686, -0.07094624, -1.675248, 1, 0.4862745, 0, 1,
-1.424076, -2.150004, -4.127479, 1, 0.4901961, 0, 1,
-1.412588, -0.4967708, -2.129421, 1, 0.4980392, 0, 1,
-1.410373, 0.06164421, -1.999726, 1, 0.5058824, 0, 1,
-1.407614, -0.1286776, -2.746326, 1, 0.509804, 0, 1,
-1.407103, 0.3533448, -0.7453263, 1, 0.5176471, 0, 1,
-1.403281, 1.400059, -2.203474, 1, 0.5215687, 0, 1,
-1.400729, -0.4269669, -2.824681, 1, 0.5294118, 0, 1,
-1.393716, 0.8824515, -0.5622528, 1, 0.5333334, 0, 1,
-1.386907, 0.3325329, -0.7196797, 1, 0.5411765, 0, 1,
-1.357721, 1.693584, -0.8788159, 1, 0.5450981, 0, 1,
-1.327426, -2.485868, -1.066554, 1, 0.5529412, 0, 1,
-1.326234, 0.4780473, -1.264594, 1, 0.5568628, 0, 1,
-1.315757, -0.3897372, -2.11235, 1, 0.5647059, 0, 1,
-1.310596, 0.2322878, -0.3207781, 1, 0.5686275, 0, 1,
-1.307647, -0.3980042, -2.386645, 1, 0.5764706, 0, 1,
-1.302747, 0.3033027, -0.3084928, 1, 0.5803922, 0, 1,
-1.301389, 1.323001, 0.4136324, 1, 0.5882353, 0, 1,
-1.285245, 0.8112707, -1.42016, 1, 0.5921569, 0, 1,
-1.271095, 0.4524012, -2.1149, 1, 0.6, 0, 1,
-1.270565, 2.643501, -1.092356, 1, 0.6078432, 0, 1,
-1.265842, 0.9570369, -0.1742147, 1, 0.6117647, 0, 1,
-1.24315, -0.8755859, -0.9676523, 1, 0.6196079, 0, 1,
-1.230361, 1.590914, -0.4400339, 1, 0.6235294, 0, 1,
-1.227704, -0.3957327, -1.278149, 1, 0.6313726, 0, 1,
-1.225581, -0.9431385, -1.231226, 1, 0.6352941, 0, 1,
-1.22532, -0.7907282, -2.005454, 1, 0.6431373, 0, 1,
-1.223995, -2.112375, -3.016528, 1, 0.6470588, 0, 1,
-1.222572, 0.707693, -2.24837, 1, 0.654902, 0, 1,
-1.21275, -0.9328432, -1.692449, 1, 0.6588235, 0, 1,
-1.212653, 0.5435372, -0.4774532, 1, 0.6666667, 0, 1,
-1.20419, 0.2217911, -2.90895, 1, 0.6705883, 0, 1,
-1.203385, 0.3496745, -2.14272, 1, 0.6784314, 0, 1,
-1.192854, 0.7513596, 0.9081525, 1, 0.682353, 0, 1,
-1.173535, 1.046071, 0.7639763, 1, 0.6901961, 0, 1,
-1.169859, -1.279692, -2.51082, 1, 0.6941177, 0, 1,
-1.166495, -1.167781, -2.666862, 1, 0.7019608, 0, 1,
-1.162617, -0.5119108, -2.635993, 1, 0.7098039, 0, 1,
-1.161885, -0.1214886, -3.019782, 1, 0.7137255, 0, 1,
-1.161772, 0.4579313, -1.261704, 1, 0.7215686, 0, 1,
-1.160789, 0.2663912, -1.530563, 1, 0.7254902, 0, 1,
-1.15898, 0.07159167, -0.954653, 1, 0.7333333, 0, 1,
-1.150216, 0.6329864, -1.600576, 1, 0.7372549, 0, 1,
-1.143757, -1.070548, -1.742937, 1, 0.7450981, 0, 1,
-1.133539, 0.4548195, -1.191929, 1, 0.7490196, 0, 1,
-1.129241, -0.5697715, -2.136897, 1, 0.7568628, 0, 1,
-1.129036, -0.09966113, -2.537758, 1, 0.7607843, 0, 1,
-1.128212, -1.22947, -3.431214, 1, 0.7686275, 0, 1,
-1.126134, -1.430596, -2.38526, 1, 0.772549, 0, 1,
-1.119686, 1.107609, -1.376876, 1, 0.7803922, 0, 1,
-1.116089, 0.9171696, -0.5359018, 1, 0.7843137, 0, 1,
-1.115641, 0.2365293, -2.65195, 1, 0.7921569, 0, 1,
-1.104439, -2.541454, -4.536593, 1, 0.7960784, 0, 1,
-1.104195, 0.129041, -1.023117, 1, 0.8039216, 0, 1,
-1.085173, 0.9196936, -1.426805, 1, 0.8117647, 0, 1,
-1.084371, 0.4582118, -0.2804512, 1, 0.8156863, 0, 1,
-1.082168, -1.306019, -2.046837, 1, 0.8235294, 0, 1,
-1.076478, -0.408845, -0.8737189, 1, 0.827451, 0, 1,
-1.073049, -1.316755, -1.649574, 1, 0.8352941, 0, 1,
-1.070783, -1.619779, -2.036549, 1, 0.8392157, 0, 1,
-1.069564, 0.5221416, -0.7183549, 1, 0.8470588, 0, 1,
-1.068426, 1.452568, -1.624115, 1, 0.8509804, 0, 1,
-1.066098, -0.2754304, -2.261063, 1, 0.8588235, 0, 1,
-1.064112, 0.7930083, -0.7147149, 1, 0.8627451, 0, 1,
-1.060213, 0.4292026, -2.991526, 1, 0.8705882, 0, 1,
-1.05874, 1.183419, -1.73692, 1, 0.8745098, 0, 1,
-1.058319, -0.3156619, -2.819869, 1, 0.8823529, 0, 1,
-1.055847, 0.7586046, -2.940344, 1, 0.8862745, 0, 1,
-1.052149, -0.1150258, -0.2924328, 1, 0.8941177, 0, 1,
-1.033145, 1.775045, -0.4602184, 1, 0.8980392, 0, 1,
-1.032293, -0.4368149, -2.859604, 1, 0.9058824, 0, 1,
-1.025513, 0.3650803, -1.098642, 1, 0.9137255, 0, 1,
-1.0212, 1.479784, -0.8279017, 1, 0.9176471, 0, 1,
-1.019475, 2.738306, -0.4390694, 1, 0.9254902, 0, 1,
-1.018146, 1.252798, 0.3860026, 1, 0.9294118, 0, 1,
-1.011465, -0.4757254, -2.302825, 1, 0.9372549, 0, 1,
-1.004247, -1.077833, -1.734385, 1, 0.9411765, 0, 1,
-1.003755, -0.118103, -1.478169, 1, 0.9490196, 0, 1,
-0.9999849, -1.19529, -0.1943912, 1, 0.9529412, 0, 1,
-0.9974427, -1.671683, -3.54037, 1, 0.9607843, 0, 1,
-0.9937363, -0.951507, -2.527279, 1, 0.9647059, 0, 1,
-0.9847792, 0.6634157, -1.178633, 1, 0.972549, 0, 1,
-0.9730179, -0.6035251, -3.303172, 1, 0.9764706, 0, 1,
-0.969483, 0.3638041, -2.52082, 1, 0.9843137, 0, 1,
-0.9680647, 0.09275649, -2.773253, 1, 0.9882353, 0, 1,
-0.9612104, 1.905552, -1.890138, 1, 0.9960784, 0, 1,
-0.9604488, 1.983038, -1.740049, 0.9960784, 1, 0, 1,
-0.9593048, -0.2096468, -1.800326, 0.9921569, 1, 0, 1,
-0.9588156, 0.4794931, -1.959637, 0.9843137, 1, 0, 1,
-0.9573515, -0.7835234, -1.352029, 0.9803922, 1, 0, 1,
-0.9560872, 0.4442005, 0.3667581, 0.972549, 1, 0, 1,
-0.9455875, -1.173158, -1.837743, 0.9686275, 1, 0, 1,
-0.9455383, 0.8673199, -0.3367923, 0.9607843, 1, 0, 1,
-0.9422737, 0.1390715, -1.45346, 0.9568627, 1, 0, 1,
-0.9420985, -0.4841928, -1.827921, 0.9490196, 1, 0, 1,
-0.9405909, 1.594469, -0.2882425, 0.945098, 1, 0, 1,
-0.9338289, 1.024546, -1.504695, 0.9372549, 1, 0, 1,
-0.9328904, 0.3636808, -1.126872, 0.9333333, 1, 0, 1,
-0.9316064, -0.585061, -3.123672, 0.9254902, 1, 0, 1,
-0.9303569, 0.7078569, -0.6309866, 0.9215686, 1, 0, 1,
-0.9244036, 0.2151552, -1.178325, 0.9137255, 1, 0, 1,
-0.9237164, -0.1708914, -0.2264096, 0.9098039, 1, 0, 1,
-0.9236141, 0.734035, -0.08466935, 0.9019608, 1, 0, 1,
-0.9224145, -0.6004043, -1.893068, 0.8941177, 1, 0, 1,
-0.919996, -0.62868, -2.041454, 0.8901961, 1, 0, 1,
-0.9161806, -1.30383, -2.527878, 0.8823529, 1, 0, 1,
-0.9025973, 0.19728, -0.9750845, 0.8784314, 1, 0, 1,
-0.9024157, 1.968073, -0.3888602, 0.8705882, 1, 0, 1,
-0.9019767, 0.2469886, -1.038257, 0.8666667, 1, 0, 1,
-0.8975073, -0.06084385, -3.080497, 0.8588235, 1, 0, 1,
-0.8969939, 0.6058696, -1.893424, 0.854902, 1, 0, 1,
-0.8962898, -0.08523738, -2.734128, 0.8470588, 1, 0, 1,
-0.8936912, -0.34437, -1.160136, 0.8431373, 1, 0, 1,
-0.8919193, 0.9071388, -0.1988311, 0.8352941, 1, 0, 1,
-0.8889186, -0.8330566, -0.3821304, 0.8313726, 1, 0, 1,
-0.8636853, -1.088105, -3.469222, 0.8235294, 1, 0, 1,
-0.8585502, -0.863426, -2.296964, 0.8196079, 1, 0, 1,
-0.8544286, -1.578938, -3.143452, 0.8117647, 1, 0, 1,
-0.8540324, 0.1037132, -2.09916, 0.8078431, 1, 0, 1,
-0.8534606, 0.867177, 0.6888151, 0.8, 1, 0, 1,
-0.8485221, -1.167739, -3.546507, 0.7921569, 1, 0, 1,
-0.8415061, -0.1827505, -1.520934, 0.7882353, 1, 0, 1,
-0.8409724, 0.7349915, -2.893552, 0.7803922, 1, 0, 1,
-0.8409389, 0.2728757, -0.9119897, 0.7764706, 1, 0, 1,
-0.8392168, -1.438111, -1.297557, 0.7686275, 1, 0, 1,
-0.8384752, -0.5216372, -2.652, 0.7647059, 1, 0, 1,
-0.8370048, 0.7216343, -0.833372, 0.7568628, 1, 0, 1,
-0.8351202, -0.5492762, -0.09913766, 0.7529412, 1, 0, 1,
-0.8277973, 1.260598, -1.224214, 0.7450981, 1, 0, 1,
-0.824996, -0.5398634, 0.3726612, 0.7411765, 1, 0, 1,
-0.8154877, 0.5402563, -1.193237, 0.7333333, 1, 0, 1,
-0.8141444, -0.8814207, -2.65447, 0.7294118, 1, 0, 1,
-0.8127295, -0.8392968, -2.656749, 0.7215686, 1, 0, 1,
-0.8093848, 0.9915661, -0.2514604, 0.7176471, 1, 0, 1,
-0.8059876, -0.2598238, -1.00686, 0.7098039, 1, 0, 1,
-0.8033929, 1.514343, 2.200841, 0.7058824, 1, 0, 1,
-0.7839385, 0.01266328, -1.080342, 0.6980392, 1, 0, 1,
-0.7811472, -0.1565341, -2.559997, 0.6901961, 1, 0, 1,
-0.7808408, 1.070147, -0.1247788, 0.6862745, 1, 0, 1,
-0.7711952, 0.6169865, -0.4194568, 0.6784314, 1, 0, 1,
-0.7685437, 0.5895362, -0.05323273, 0.6745098, 1, 0, 1,
-0.7668279, 0.2070847, -2.275619, 0.6666667, 1, 0, 1,
-0.7650942, 1.380953, -1.214236, 0.6627451, 1, 0, 1,
-0.7561091, 0.8303869, 0.1578315, 0.654902, 1, 0, 1,
-0.7545019, -0.1705566, -2.247067, 0.6509804, 1, 0, 1,
-0.7519923, 1.842412, -1.655987, 0.6431373, 1, 0, 1,
-0.7476143, 0.8239412, -0.8551706, 0.6392157, 1, 0, 1,
-0.7458985, 0.4989855, -0.7082728, 0.6313726, 1, 0, 1,
-0.7421637, -0.6745927, -2.076939, 0.627451, 1, 0, 1,
-0.7403037, 0.03743096, -2.144224, 0.6196079, 1, 0, 1,
-0.738028, -1.648922, -2.433497, 0.6156863, 1, 0, 1,
-0.7372683, 0.1287531, -1.357298, 0.6078432, 1, 0, 1,
-0.7366171, 0.2043869, -1.336197, 0.6039216, 1, 0, 1,
-0.7339356, 1.203304, -0.7591111, 0.5960785, 1, 0, 1,
-0.7334051, 0.477565, 0.1564577, 0.5882353, 1, 0, 1,
-0.7279311, -0.4970094, -0.7659391, 0.5843138, 1, 0, 1,
-0.723229, 1.189223, -0.03783988, 0.5764706, 1, 0, 1,
-0.7189736, 1.621271, -1.967091, 0.572549, 1, 0, 1,
-0.7186568, 0.3851933, -1.331398, 0.5647059, 1, 0, 1,
-0.7163308, 0.1535637, -2.493901, 0.5607843, 1, 0, 1,
-0.712287, 0.221043, -2.495163, 0.5529412, 1, 0, 1,
-0.706222, 0.9560789, 1.091654, 0.5490196, 1, 0, 1,
-0.7025149, 0.7281902, -0.6908793, 0.5411765, 1, 0, 1,
-0.701291, 0.7378783, 1.200241, 0.5372549, 1, 0, 1,
-0.6974759, -0.5732684, -2.169055, 0.5294118, 1, 0, 1,
-0.6962036, 0.05707909, -1.980511, 0.5254902, 1, 0, 1,
-0.6961232, -0.9733678, -2.627386, 0.5176471, 1, 0, 1,
-0.6874138, 0.7943473, 0.292644, 0.5137255, 1, 0, 1,
-0.6759387, -0.04682033, -1.24588, 0.5058824, 1, 0, 1,
-0.6743589, 2.388394, 1.371957, 0.5019608, 1, 0, 1,
-0.6712438, -0.9792785, -0.5028924, 0.4941176, 1, 0, 1,
-0.6655008, 0.04426728, 1.206602, 0.4862745, 1, 0, 1,
-0.6577327, -0.05265353, -1.678832, 0.4823529, 1, 0, 1,
-0.6549536, -1.22592, -3.007402, 0.4745098, 1, 0, 1,
-0.6545483, 0.0557658, -2.034042, 0.4705882, 1, 0, 1,
-0.6502674, 0.9619699, 0.007448108, 0.4627451, 1, 0, 1,
-0.6499314, -0.5368928, -2.542011, 0.4588235, 1, 0, 1,
-0.6496029, -0.9792256, -1.744783, 0.4509804, 1, 0, 1,
-0.6426839, -0.6582348, -2.613314, 0.4470588, 1, 0, 1,
-0.6378961, -0.8063987, -0.9480854, 0.4392157, 1, 0, 1,
-0.6342233, -0.9639624, -1.909256, 0.4352941, 1, 0, 1,
-0.6303856, 1.005872, -0.6557567, 0.427451, 1, 0, 1,
-0.6290616, -1.969813, -2.862672, 0.4235294, 1, 0, 1,
-0.6264027, 0.1925697, -1.57287, 0.4156863, 1, 0, 1,
-0.6250005, -0.5086678, -1.923722, 0.4117647, 1, 0, 1,
-0.624868, 1.64619, 0.5907995, 0.4039216, 1, 0, 1,
-0.6218399, 2.304535, -0.276403, 0.3960784, 1, 0, 1,
-0.6210276, -0.2031201, -1.336547, 0.3921569, 1, 0, 1,
-0.6186349, -1.79339, -1.993639, 0.3843137, 1, 0, 1,
-0.6127462, -1.008845, -0.1624724, 0.3803922, 1, 0, 1,
-0.6124887, 0.08578969, -2.601329, 0.372549, 1, 0, 1,
-0.6111005, 0.5748585, -1.080909, 0.3686275, 1, 0, 1,
-0.6100839, 0.7822606, -2.238052, 0.3607843, 1, 0, 1,
-0.6079026, 1.332136, -1.118247, 0.3568628, 1, 0, 1,
-0.6058887, -0.8520029, -4.111067, 0.3490196, 1, 0, 1,
-0.6048775, -1.76748, -2.461373, 0.345098, 1, 0, 1,
-0.6007947, 0.009196389, -3.064797, 0.3372549, 1, 0, 1,
-0.6004938, -0.01685769, 0.6127968, 0.3333333, 1, 0, 1,
-0.5995495, 2.787989, -1.523746, 0.3254902, 1, 0, 1,
-0.5969362, 0.5859057, -1.092278, 0.3215686, 1, 0, 1,
-0.5967385, 0.935452, -0.5191937, 0.3137255, 1, 0, 1,
-0.5901356, 0.948446, 0.4003898, 0.3098039, 1, 0, 1,
-0.5893635, -0.190841, -1.46998, 0.3019608, 1, 0, 1,
-0.5802802, -0.6377074, -2.38144, 0.2941177, 1, 0, 1,
-0.5789298, 0.9327466, 0.3898638, 0.2901961, 1, 0, 1,
-0.5704429, 0.5666025, 0.1343762, 0.282353, 1, 0, 1,
-0.5698043, -1.567708, -1.341127, 0.2784314, 1, 0, 1,
-0.5660283, 0.7170442, 0.313636, 0.2705882, 1, 0, 1,
-0.5650383, 0.1741293, -1.075483, 0.2666667, 1, 0, 1,
-0.5604627, 0.3750621, -1.737408, 0.2588235, 1, 0, 1,
-0.5603372, -0.9843773, -2.15316, 0.254902, 1, 0, 1,
-0.5580571, 1.505099, -1.002032, 0.2470588, 1, 0, 1,
-0.5546118, 0.3448126, 0.3039151, 0.2431373, 1, 0, 1,
-0.5463369, 0.8623903, -1.593296, 0.2352941, 1, 0, 1,
-0.5458764, 1.032465, 0.07740414, 0.2313726, 1, 0, 1,
-0.5442293, -0.8124227, -2.524889, 0.2235294, 1, 0, 1,
-0.5413994, -0.9907796, -2.312477, 0.2196078, 1, 0, 1,
-0.5403589, 0.3479879, -1.922735, 0.2117647, 1, 0, 1,
-0.5198677, -1.579104, -3.444469, 0.2078431, 1, 0, 1,
-0.5146855, 1.011029, -0.8035191, 0.2, 1, 0, 1,
-0.5144191, 1.532347, -1.556754, 0.1921569, 1, 0, 1,
-0.5109423, 0.1665769, -2.084528, 0.1882353, 1, 0, 1,
-0.509683, 2.312211, 1.707169, 0.1803922, 1, 0, 1,
-0.5085681, -0.2578328, -2.97517, 0.1764706, 1, 0, 1,
-0.5082473, -3.470527, -2.353983, 0.1686275, 1, 0, 1,
-0.4994563, 0.2147582, -1.699574, 0.1647059, 1, 0, 1,
-0.4991643, 1.53515, 0.3313788, 0.1568628, 1, 0, 1,
-0.4964755, 0.675489, -1.291804, 0.1529412, 1, 0, 1,
-0.4930761, 0.3217315, -1.806658, 0.145098, 1, 0, 1,
-0.4926418, 0.9392381, 0.6300378, 0.1411765, 1, 0, 1,
-0.48838, 0.4314957, -0.7133371, 0.1333333, 1, 0, 1,
-0.4860762, -1.293569, -3.72183, 0.1294118, 1, 0, 1,
-0.4853228, -0.06958182, -0.9254823, 0.1215686, 1, 0, 1,
-0.4778143, 0.1647372, -1.243444, 0.1176471, 1, 0, 1,
-0.4754579, 0.7142889, -0.9017941, 0.1098039, 1, 0, 1,
-0.4745481, -0.2151277, -2.107787, 0.1058824, 1, 0, 1,
-0.4732906, 1.363449, 0.0009317826, 0.09803922, 1, 0, 1,
-0.4700769, 1.216607, 0.3902748, 0.09019608, 1, 0, 1,
-0.4682373, 0.07941399, -1.443798, 0.08627451, 1, 0, 1,
-0.4669585, -0.7841027, -1.577303, 0.07843138, 1, 0, 1,
-0.4610021, 1.379918, 0.8741745, 0.07450981, 1, 0, 1,
-0.454917, 0.1769362, 0.2194178, 0.06666667, 1, 0, 1,
-0.4547772, 0.9527675, 0.207225, 0.0627451, 1, 0, 1,
-0.4542029, 0.8167136, 0.6066571, 0.05490196, 1, 0, 1,
-0.4537398, 1.450108, 0.4642508, 0.05098039, 1, 0, 1,
-0.451584, 0.8878314, -0.0131821, 0.04313726, 1, 0, 1,
-0.4503498, -0.1706988, -2.710852, 0.03921569, 1, 0, 1,
-0.4443684, 1.137962, 0.5884286, 0.03137255, 1, 0, 1,
-0.4432048, -0.8433221, -1.703344, 0.02745098, 1, 0, 1,
-0.4428948, 0.09373236, -1.230543, 0.01960784, 1, 0, 1,
-0.4427642, 1.059505, 0.9096552, 0.01568628, 1, 0, 1,
-0.4427609, 0.3463453, -0.6206138, 0.007843138, 1, 0, 1,
-0.4394306, 1.50689, -0.8722059, 0.003921569, 1, 0, 1,
-0.4334782, 0.3453836, -0.7752088, 0, 1, 0.003921569, 1,
-0.4332002, 0.05435378, 0.1317646, 0, 1, 0.01176471, 1,
-0.4317379, -1.107905, -3.676665, 0, 1, 0.01568628, 1,
-0.430528, -0.02075435, -2.069386, 0, 1, 0.02352941, 1,
-0.428312, 0.6045622, -1.207358, 0, 1, 0.02745098, 1,
-0.4280502, -1.919885, -3.064714, 0, 1, 0.03529412, 1,
-0.4209003, 0.7559332, -1.814392, 0, 1, 0.03921569, 1,
-0.4185699, 0.831899, -0.7034577, 0, 1, 0.04705882, 1,
-0.4088828, 0.4786279, -0.4196635, 0, 1, 0.05098039, 1,
-0.4060134, 1.949567, -1.111908, 0, 1, 0.05882353, 1,
-0.4021572, -2.334044, -2.618126, 0, 1, 0.0627451, 1,
-0.4009877, 0.3441961, -2.360296, 0, 1, 0.07058824, 1,
-0.3977368, 1.33671, -0.6601089, 0, 1, 0.07450981, 1,
-0.3957524, -0.5572013, -3.671794, 0, 1, 0.08235294, 1,
-0.3953363, -2.64943, -2.355839, 0, 1, 0.08627451, 1,
-0.3941137, -0.9797916, -2.167271, 0, 1, 0.09411765, 1,
-0.3933092, -0.004366883, 1.435327, 0, 1, 0.1019608, 1,
-0.3875619, 1.042392, -0.5306142, 0, 1, 0.1058824, 1,
-0.385957, 1.163502, 0.8112617, 0, 1, 0.1137255, 1,
-0.3858738, 0.4975584, -0.7885371, 0, 1, 0.1176471, 1,
-0.3807614, 0.6461788, 0.105186, 0, 1, 0.1254902, 1,
-0.377701, -0.02321007, -2.109272, 0, 1, 0.1294118, 1,
-0.3734649, -0.2285606, -1.914504, 0, 1, 0.1372549, 1,
-0.3725522, -0.3980428, -2.256571, 0, 1, 0.1411765, 1,
-0.3644286, -0.8773611, -4.437502, 0, 1, 0.1490196, 1,
-0.363103, 0.162901, -0.7611024, 0, 1, 0.1529412, 1,
-0.3554846, -0.1966821, -2.385738, 0, 1, 0.1607843, 1,
-0.3546143, -0.2631406, -3.86001, 0, 1, 0.1647059, 1,
-0.3523436, -1.224206, -2.094674, 0, 1, 0.172549, 1,
-0.3515046, 0.4945222, 0.01697427, 0, 1, 0.1764706, 1,
-0.3484916, -0.2312348, -0.8531822, 0, 1, 0.1843137, 1,
-0.3443006, -0.8711886, -2.428346, 0, 1, 0.1882353, 1,
-0.3426372, -1.242049, -1.488473, 0, 1, 0.1960784, 1,
-0.3367686, 0.3981376, -0.9989408, 0, 1, 0.2039216, 1,
-0.3307834, 0.9877695, 0.8534043, 0, 1, 0.2078431, 1,
-0.3299654, -0.6698187, -1.507123, 0, 1, 0.2156863, 1,
-0.3295176, 0.4548671, 0.7874188, 0, 1, 0.2196078, 1,
-0.3263006, 0.5769364, -1.426313, 0, 1, 0.227451, 1,
-0.3229346, -0.9017361, -2.710168, 0, 1, 0.2313726, 1,
-0.3196125, -0.2504233, -0.4210873, 0, 1, 0.2392157, 1,
-0.3170263, -0.3876132, -1.355287, 0, 1, 0.2431373, 1,
-0.3133238, -1.599336, -2.571222, 0, 1, 0.2509804, 1,
-0.3110784, 1.040406, -1.691564, 0, 1, 0.254902, 1,
-0.306729, -1.10284, -1.48148, 0, 1, 0.2627451, 1,
-0.3058413, -0.79275, -3.463926, 0, 1, 0.2666667, 1,
-0.3021891, -0.9800622, -3.304054, 0, 1, 0.2745098, 1,
-0.299482, 1.07856, 0.5119347, 0, 1, 0.2784314, 1,
-0.2940157, 0.9064887, -2.386409, 0, 1, 0.2862745, 1,
-0.2873172, 0.1290202, -0.5624203, 0, 1, 0.2901961, 1,
-0.2870227, 0.5331535, -1.64606, 0, 1, 0.2980392, 1,
-0.2847867, 1.069765, -0.7155501, 0, 1, 0.3058824, 1,
-0.2794043, -1.122474, -1.704092, 0, 1, 0.3098039, 1,
-0.2789837, -0.03804068, -2.211804, 0, 1, 0.3176471, 1,
-0.2789215, 1.443766, -0.5156359, 0, 1, 0.3215686, 1,
-0.2776107, -0.6831218, -1.587163, 0, 1, 0.3294118, 1,
-0.2759897, -0.3564676, -2.522832, 0, 1, 0.3333333, 1,
-0.2736171, 0.4401807, -1.518059, 0, 1, 0.3411765, 1,
-0.2659197, 1.859307, -0.2907399, 0, 1, 0.345098, 1,
-0.2621171, -0.1263822, 0.1979588, 0, 1, 0.3529412, 1,
-0.2607071, 3.324226, -0.4717418, 0, 1, 0.3568628, 1,
-0.2606416, -0.5936975, -2.804599, 0, 1, 0.3647059, 1,
-0.2558831, -0.9308988, -1.525969, 0, 1, 0.3686275, 1,
-0.2497835, 1.461985, 0.8678477, 0, 1, 0.3764706, 1,
-0.2494201, -1.53733, -5.240593, 0, 1, 0.3803922, 1,
-0.2493255, -0.4671841, -1.569957, 0, 1, 0.3882353, 1,
-0.247434, 0.1929911, -1.449583, 0, 1, 0.3921569, 1,
-0.2426122, -0.6771047, -2.83161, 0, 1, 0.4, 1,
-0.2410869, 0.2598943, 0.3791015, 0, 1, 0.4078431, 1,
-0.2390092, -0.3459825, -3.792017, 0, 1, 0.4117647, 1,
-0.2347038, -0.3651696, -1.348622, 0, 1, 0.4196078, 1,
-0.2346857, 2.15183, -1.251365, 0, 1, 0.4235294, 1,
-0.2303415, 2.077054, 1.405058, 0, 1, 0.4313726, 1,
-0.2301192, -1.723951, -2.302731, 0, 1, 0.4352941, 1,
-0.2284272, -0.9128518, -2.435355, 0, 1, 0.4431373, 1,
-0.2283868, 1.520163, 0.0464164, 0, 1, 0.4470588, 1,
-0.2273047, -0.3322605, -2.858264, 0, 1, 0.454902, 1,
-0.2267729, -0.1392723, -0.366147, 0, 1, 0.4588235, 1,
-0.2205455, 1.949205, 0.7564283, 0, 1, 0.4666667, 1,
-0.2193903, -0.3015221, -4.260695, 0, 1, 0.4705882, 1,
-0.2071917, -0.4231031, -3.137972, 0, 1, 0.4784314, 1,
-0.2047896, 1.730383, 0.3971123, 0, 1, 0.4823529, 1,
-0.2041396, -0.5985234, -2.300731, 0, 1, 0.4901961, 1,
-0.2001598, 1.297553, 0.06312943, 0, 1, 0.4941176, 1,
-0.1990146, -2.440619, -3.037872, 0, 1, 0.5019608, 1,
-0.1973257, 1.048567, 1.304369, 0, 1, 0.509804, 1,
-0.1966891, 0.5188193, -1.446724, 0, 1, 0.5137255, 1,
-0.1957625, 0.7113983, 1.072888, 0, 1, 0.5215687, 1,
-0.1915161, -0.6484783, -2.854195, 0, 1, 0.5254902, 1,
-0.1826164, -0.6145865, -2.014271, 0, 1, 0.5333334, 1,
-0.1817845, -0.5634529, -1.893368, 0, 1, 0.5372549, 1,
-0.178083, -0.4710341, -3.945462, 0, 1, 0.5450981, 1,
-0.1778222, 0.7982506, -0.5207051, 0, 1, 0.5490196, 1,
-0.1755917, -0.8884239, -2.979624, 0, 1, 0.5568628, 1,
-0.1731398, 1.903073, -0.5278834, 0, 1, 0.5607843, 1,
-0.1725138, 0.7639055, 0.9035926, 0, 1, 0.5686275, 1,
-0.1718953, -0.7078316, -3.785313, 0, 1, 0.572549, 1,
-0.1702046, -0.6181041, -2.439547, 0, 1, 0.5803922, 1,
-0.1690663, 2.288882, 0.2498765, 0, 1, 0.5843138, 1,
-0.1663404, -0.5616645, -3.657053, 0, 1, 0.5921569, 1,
-0.1661829, -0.2463461, -3.140389, 0, 1, 0.5960785, 1,
-0.1595087, -1.926376, -3.174447, 0, 1, 0.6039216, 1,
-0.156533, -0.354012, -2.674906, 0, 1, 0.6117647, 1,
-0.1475209, 1.131252, -0.8187159, 0, 1, 0.6156863, 1,
-0.147024, 1.284195, 0.406829, 0, 1, 0.6235294, 1,
-0.1453457, -1.0215, -2.863506, 0, 1, 0.627451, 1,
-0.1451202, 0.04762617, -1.102858, 0, 1, 0.6352941, 1,
-0.1448001, 1.250866, 1.240817, 0, 1, 0.6392157, 1,
-0.1445877, -0.7142799, -2.884793, 0, 1, 0.6470588, 1,
-0.1443171, 0.6341422, 1.374213, 0, 1, 0.6509804, 1,
-0.1437329, -2.072008, -2.016593, 0, 1, 0.6588235, 1,
-0.1430685, -0.02917457, -2.085719, 0, 1, 0.6627451, 1,
-0.1389391, -1.462568, -3.367468, 0, 1, 0.6705883, 1,
-0.1381834, -0.6069487, -2.332997, 0, 1, 0.6745098, 1,
-0.137907, -1.258557, -4.106952, 0, 1, 0.682353, 1,
-0.1340082, 1.533592, -0.5722758, 0, 1, 0.6862745, 1,
-0.1332508, -0.4229474, -1.718062, 0, 1, 0.6941177, 1,
-0.1307898, -0.5424401, -2.367002, 0, 1, 0.7019608, 1,
-0.1307052, -1.000896, -2.419007, 0, 1, 0.7058824, 1,
-0.1242449, -1.229332, -1.408866, 0, 1, 0.7137255, 1,
-0.120951, 2.353155, 0.4417063, 0, 1, 0.7176471, 1,
-0.1183163, 1.163539, 0.2629319, 0, 1, 0.7254902, 1,
-0.11662, -1.40542, -3.634838, 0, 1, 0.7294118, 1,
-0.1160102, 0.2792111, -1.11054, 0, 1, 0.7372549, 1,
-0.1111527, -0.02457766, -1.571774, 0, 1, 0.7411765, 1,
-0.1005628, -0.7060062, -2.868614, 0, 1, 0.7490196, 1,
-0.09781241, 0.7183396, -0.5292668, 0, 1, 0.7529412, 1,
-0.0947339, -1.062806, -2.172549, 0, 1, 0.7607843, 1,
-0.09271925, 0.2934072, -1.312204, 0, 1, 0.7647059, 1,
-0.09211976, -0.08889475, -0.262567, 0, 1, 0.772549, 1,
-0.08212176, 2.428062, 0.2804184, 0, 1, 0.7764706, 1,
-0.07805701, -0.3475917, -1.924394, 0, 1, 0.7843137, 1,
-0.07512591, -0.5645355, -1.362938, 0, 1, 0.7882353, 1,
-0.07166856, -0.2345789, -2.971001, 0, 1, 0.7960784, 1,
-0.07045551, -1.700247, -3.677486, 0, 1, 0.8039216, 1,
-0.06569342, -0.5082044, -2.075643, 0, 1, 0.8078431, 1,
-0.06253617, -0.3197557, -2.760582, 0, 1, 0.8156863, 1,
-0.06140335, -1.451936, -3.86252, 0, 1, 0.8196079, 1,
-0.06002881, 1.1699, -1.937882, 0, 1, 0.827451, 1,
-0.05527248, -2.017996, -3.711078, 0, 1, 0.8313726, 1,
-0.05524524, -0.8268864, -2.732478, 0, 1, 0.8392157, 1,
-0.05112482, 0.7636591, 0.492754, 0, 1, 0.8431373, 1,
-0.04971819, 0.5405271, -1.083021, 0, 1, 0.8509804, 1,
-0.04891745, -0.217109, -2.873376, 0, 1, 0.854902, 1,
-0.04575237, 0.0568597, -0.5705394, 0, 1, 0.8627451, 1,
-0.04250221, -0.9565866, -1.702783, 0, 1, 0.8666667, 1,
-0.04142535, -0.1681665, -1.416175, 0, 1, 0.8745098, 1,
-0.03968306, 1.380097, 0.4301579, 0, 1, 0.8784314, 1,
-0.03938521, 0.8060072, -0.2432027, 0, 1, 0.8862745, 1,
-0.03658334, 1.30473, -0.2940105, 0, 1, 0.8901961, 1,
-0.03328818, 0.1113729, 1.487404, 0, 1, 0.8980392, 1,
-0.03290199, 0.160605, -0.1416086, 0, 1, 0.9058824, 1,
-0.0302884, 1.91615, 1.170381, 0, 1, 0.9098039, 1,
-0.02952741, -1.154886, -2.113613, 0, 1, 0.9176471, 1,
-0.02813833, 0.1891794, -0.8882681, 0, 1, 0.9215686, 1,
-0.02542771, -0.1377882, -2.50615, 0, 1, 0.9294118, 1,
-0.02269203, 0.03586813, -0.9921741, 0, 1, 0.9333333, 1,
-0.01711172, 0.203807, 1.070179, 0, 1, 0.9411765, 1,
-0.01512198, -0.4344926, -3.362038, 0, 1, 0.945098, 1,
-0.01492923, -1.849156, -2.754121, 0, 1, 0.9529412, 1,
-0.01360298, 0.165598, 0.9030532, 0, 1, 0.9568627, 1,
-0.01285649, -0.2820041, -3.787857, 0, 1, 0.9647059, 1,
-0.01247728, 1.072714, 0.9128538, 0, 1, 0.9686275, 1,
-0.01179531, 0.2940239, -1.092031, 0, 1, 0.9764706, 1,
-0.009790203, 1.032914, 1.962097, 0, 1, 0.9803922, 1,
-0.008850643, 1.208247, -0.7900906, 0, 1, 0.9882353, 1,
-0.008843275, 0.4086691, -0.7515695, 0, 1, 0.9921569, 1,
-0.0078475, 1.305527, 0.8878966, 0, 1, 1, 1,
0.00391532, 0.3520539, -0.6728815, 0, 0.9921569, 1, 1,
0.004642812, 0.1187789, 1.286378, 0, 0.9882353, 1, 1,
0.01166974, 1.448452, -0.1965142, 0, 0.9803922, 1, 1,
0.01427356, -0.9749215, 3.260766, 0, 0.9764706, 1, 1,
0.01752258, -0.261552, 2.960515, 0, 0.9686275, 1, 1,
0.01978267, 0.6918195, 0.1220556, 0, 0.9647059, 1, 1,
0.03200698, -0.2833251, 2.764232, 0, 0.9568627, 1, 1,
0.03860417, -1.253076, 2.131017, 0, 0.9529412, 1, 1,
0.0417692, 1.505185, -1.042404, 0, 0.945098, 1, 1,
0.04333271, -0.2837841, 3.502414, 0, 0.9411765, 1, 1,
0.04483713, -1.325833, 3.258311, 0, 0.9333333, 1, 1,
0.0542415, -0.9446258, 3.799878, 0, 0.9294118, 1, 1,
0.05469046, -0.1237773, 3.845351, 0, 0.9215686, 1, 1,
0.05707303, 0.4003451, 0.3169298, 0, 0.9176471, 1, 1,
0.05712396, -1.3657, 2.918949, 0, 0.9098039, 1, 1,
0.05904723, 0.8635996, -1.947406, 0, 0.9058824, 1, 1,
0.06349387, -0.5080448, 3.548254, 0, 0.8980392, 1, 1,
0.06562281, -0.04253159, 2.402403, 0, 0.8901961, 1, 1,
0.06637426, -0.8218736, 3.007578, 0, 0.8862745, 1, 1,
0.06681623, 0.4305285, 1.424618, 0, 0.8784314, 1, 1,
0.07234993, -1.044271, 2.48851, 0, 0.8745098, 1, 1,
0.075091, -1.842407, 3.190753, 0, 0.8666667, 1, 1,
0.0792717, 0.8487216, 1.900625, 0, 0.8627451, 1, 1,
0.08532017, -0.902988, 4.11102, 0, 0.854902, 1, 1,
0.08595499, 0.8429127, -0.6679389, 0, 0.8509804, 1, 1,
0.08699171, -1.71815, 2.420951, 0, 0.8431373, 1, 1,
0.08851211, -0.5630913, 4.949421, 0, 0.8392157, 1, 1,
0.08859847, 1.702467, 1.038999, 0, 0.8313726, 1, 1,
0.09817889, 0.1827634, 0.4476883, 0, 0.827451, 1, 1,
0.09902196, -0.5966128, 2.326657, 0, 0.8196079, 1, 1,
0.1002431, 0.3169799, -0.9478038, 0, 0.8156863, 1, 1,
0.100642, 0.4778461, -0.08098349, 0, 0.8078431, 1, 1,
0.1010119, 0.4628884, 0.9210488, 0, 0.8039216, 1, 1,
0.1020762, -0.2463957, 2.66627, 0, 0.7960784, 1, 1,
0.103596, -0.8181213, 2.810713, 0, 0.7882353, 1, 1,
0.1134277, 0.3350219, 0.9318479, 0, 0.7843137, 1, 1,
0.1243871, -0.5224417, 2.404449, 0, 0.7764706, 1, 1,
0.1259689, 1.462384, 0.3116504, 0, 0.772549, 1, 1,
0.1276962, -1.25413, 3.593069, 0, 0.7647059, 1, 1,
0.1296029, 0.8909433, -0.4807701, 0, 0.7607843, 1, 1,
0.13394, 0.7012145, -1.393818, 0, 0.7529412, 1, 1,
0.134376, -0.1319856, 2.346639, 0, 0.7490196, 1, 1,
0.135438, 0.9903686, -0.8766596, 0, 0.7411765, 1, 1,
0.1397277, -1.376329, 3.541503, 0, 0.7372549, 1, 1,
0.1428242, -0.42865, 3.327944, 0, 0.7294118, 1, 1,
0.1432235, -0.2785478, 2.393811, 0, 0.7254902, 1, 1,
0.146498, -1.081774, 4.423671, 0, 0.7176471, 1, 1,
0.1504053, 0.40497, 1.223517, 0, 0.7137255, 1, 1,
0.1528967, 0.3453352, 1.73352, 0, 0.7058824, 1, 1,
0.154154, -0.4163004, 2.335007, 0, 0.6980392, 1, 1,
0.1587043, -1.509189, 3.696646, 0, 0.6941177, 1, 1,
0.1602399, -1.020187, 2.884808, 0, 0.6862745, 1, 1,
0.1621107, 0.2001719, 3.280483, 0, 0.682353, 1, 1,
0.1684947, 0.7678137, 2.489373, 0, 0.6745098, 1, 1,
0.1711054, 1.301149, -0.8216565, 0, 0.6705883, 1, 1,
0.1748622, 0.7180969, -0.4043499, 0, 0.6627451, 1, 1,
0.1755836, -0.6639919, 2.639699, 0, 0.6588235, 1, 1,
0.1761775, -0.3693167, 3.715676, 0, 0.6509804, 1, 1,
0.1805043, -0.1636401, 2.084694, 0, 0.6470588, 1, 1,
0.1854709, -0.3240713, 3.327032, 0, 0.6392157, 1, 1,
0.1867649, 0.2619592, -0.9841245, 0, 0.6352941, 1, 1,
0.1879455, 0.10175, 0.3667243, 0, 0.627451, 1, 1,
0.1896401, 1.301681, -0.3768227, 0, 0.6235294, 1, 1,
0.1914784, -0.7128004, 4.462344, 0, 0.6156863, 1, 1,
0.1933964, -0.5335527, 1.471258, 0, 0.6117647, 1, 1,
0.1990224, -0.472153, 1.864505, 0, 0.6039216, 1, 1,
0.1995334, -0.5063161, 2.640941, 0, 0.5960785, 1, 1,
0.2105772, 0.1461388, 1.159819, 0, 0.5921569, 1, 1,
0.2161364, -0.02803154, 0.9694, 0, 0.5843138, 1, 1,
0.2174186, -0.7190421, 2.368237, 0, 0.5803922, 1, 1,
0.2195495, -0.6456341, 5.051163, 0, 0.572549, 1, 1,
0.2197362, 1.001261, -1.604493, 0, 0.5686275, 1, 1,
0.2199361, -1.534385, 3.428416, 0, 0.5607843, 1, 1,
0.2199743, -1.226784, 4.286869, 0, 0.5568628, 1, 1,
0.2218663, -1.422998, 1.224452, 0, 0.5490196, 1, 1,
0.2222306, 1.391306, 1.428983, 0, 0.5450981, 1, 1,
0.2238105, 0.7542236, 0.1332079, 0, 0.5372549, 1, 1,
0.2313333, 0.5271815, 1.042053, 0, 0.5333334, 1, 1,
0.2326709, 0.7927163, 0.6556107, 0, 0.5254902, 1, 1,
0.2353255, 0.6370825, 0.7830497, 0, 0.5215687, 1, 1,
0.2361559, -0.7246944, 4.379561, 0, 0.5137255, 1, 1,
0.2362093, 0.18681, 0.1761705, 0, 0.509804, 1, 1,
0.2411936, -0.2578196, 1.971481, 0, 0.5019608, 1, 1,
0.2473825, -1.349143, 2.470173, 0, 0.4941176, 1, 1,
0.254751, -0.9512069, 2.137558, 0, 0.4901961, 1, 1,
0.2581348, -1.004039, 1.705305, 0, 0.4823529, 1, 1,
0.2606142, -1.468865, 0.8886239, 0, 0.4784314, 1, 1,
0.2629126, -0.3769359, 2.763658, 0, 0.4705882, 1, 1,
0.2636261, 0.6796072, -1.433969, 0, 0.4666667, 1, 1,
0.2642646, -2.018508, 4.080495, 0, 0.4588235, 1, 1,
0.265207, 1.170577, -0.1915706, 0, 0.454902, 1, 1,
0.2665662, -1.602435, 2.497445, 0, 0.4470588, 1, 1,
0.2688993, -0.6524516, 1.633658, 0, 0.4431373, 1, 1,
0.2690124, -0.2308781, 0.7919714, 0, 0.4352941, 1, 1,
0.273541, -0.428573, 4.239648, 0, 0.4313726, 1, 1,
0.2812515, -0.1857107, 1.208746, 0, 0.4235294, 1, 1,
0.2837467, -0.8130046, 3.21115, 0, 0.4196078, 1, 1,
0.2860575, 2.088657, -0.7569324, 0, 0.4117647, 1, 1,
0.287044, -0.376954, 1.568773, 0, 0.4078431, 1, 1,
0.2872906, -0.2913166, 2.637368, 0, 0.4, 1, 1,
0.2874223, -0.6814004, 2.774489, 0, 0.3921569, 1, 1,
0.2918757, 1.388017, -1.030108, 0, 0.3882353, 1, 1,
0.2953539, 1.943713, 0.07616181, 0, 0.3803922, 1, 1,
0.3007411, 1.403928, -1.36602, 0, 0.3764706, 1, 1,
0.3011822, 0.1801523, -1.018704, 0, 0.3686275, 1, 1,
0.3018094, -1.403486, 4.231021, 0, 0.3647059, 1, 1,
0.3090321, -1.963176, 3.584635, 0, 0.3568628, 1, 1,
0.3094199, 0.4883324, 1.76433, 0, 0.3529412, 1, 1,
0.3132739, -0.3167589, 2.915398, 0, 0.345098, 1, 1,
0.3144142, -0.2766582, -1.207075, 0, 0.3411765, 1, 1,
0.3145163, 0.3373527, 1.816397, 0, 0.3333333, 1, 1,
0.3223547, 0.4800961, 1.248703, 0, 0.3294118, 1, 1,
0.3235636, -0.6859799, 2.575708, 0, 0.3215686, 1, 1,
0.3264717, -1.293248, 1.453023, 0, 0.3176471, 1, 1,
0.3305305, -1.453036, 4.925561, 0, 0.3098039, 1, 1,
0.3306788, 0.06851569, 1.423664, 0, 0.3058824, 1, 1,
0.3428182, 0.921095, 1.338374, 0, 0.2980392, 1, 1,
0.3451987, 0.7070202, 0.8211952, 0, 0.2901961, 1, 1,
0.3486903, 0.01835063, 1.07342, 0, 0.2862745, 1, 1,
0.3504039, -0.134093, 3.502813, 0, 0.2784314, 1, 1,
0.355177, -0.9728518, 3.562044, 0, 0.2745098, 1, 1,
0.3561453, 0.1342535, 0.3021671, 0, 0.2666667, 1, 1,
0.3583642, -1.055942, 2.131535, 0, 0.2627451, 1, 1,
0.359985, 1.61062, 1.099426, 0, 0.254902, 1, 1,
0.3702705, -1.781663, 3.500005, 0, 0.2509804, 1, 1,
0.3712848, 1.302063, 0.7373794, 0, 0.2431373, 1, 1,
0.3733526, -0.3816661, 1.712369, 0, 0.2392157, 1, 1,
0.3763876, 0.2786843, 1.175007, 0, 0.2313726, 1, 1,
0.379696, -0.5862728, 1.459092, 0, 0.227451, 1, 1,
0.3805109, 1.602402, 1.785275, 0, 0.2196078, 1, 1,
0.3840522, 0.5908321, 1.545539, 0, 0.2156863, 1, 1,
0.3855171, -0.1038561, 1.476268, 0, 0.2078431, 1, 1,
0.3908418, -0.4020918, 1.612726, 0, 0.2039216, 1, 1,
0.3945347, -1.59838, 1.933563, 0, 0.1960784, 1, 1,
0.3946551, 1.480974, -0.6435795, 0, 0.1882353, 1, 1,
0.3954846, 0.5675803, 3.028578, 0, 0.1843137, 1, 1,
0.3958999, 0.9795759, 0.03658827, 0, 0.1764706, 1, 1,
0.3960734, -0.1560424, 1.882812, 0, 0.172549, 1, 1,
0.3964998, 0.6998833, -0.07700472, 0, 0.1647059, 1, 1,
0.3991603, -0.4441715, 3.203346, 0, 0.1607843, 1, 1,
0.3994646, -2.187648, 3.143334, 0, 0.1529412, 1, 1,
0.4000841, 0.3735729, 1.154242, 0, 0.1490196, 1, 1,
0.4001259, 0.6999024, 0.6514046, 0, 0.1411765, 1, 1,
0.4017061, -0.7460542, 1.723141, 0, 0.1372549, 1, 1,
0.4065345, -0.5084785, 2.97657, 0, 0.1294118, 1, 1,
0.4067044, -0.4325892, 3.563744, 0, 0.1254902, 1, 1,
0.4086697, 1.102385, 0.6738405, 0, 0.1176471, 1, 1,
0.4101045, -0.9199079, 1.441529, 0, 0.1137255, 1, 1,
0.4106324, 0.5035928, 0.8767979, 0, 0.1058824, 1, 1,
0.4119757, 0.4591677, -0.02569174, 0, 0.09803922, 1, 1,
0.4205874, 1.384663, -1.218731, 0, 0.09411765, 1, 1,
0.4213622, 0.3161254, 1.914413, 0, 0.08627451, 1, 1,
0.422759, 1.023705, 0.6722164, 0, 0.08235294, 1, 1,
0.4243272, 0.02004189, 2.662464, 0, 0.07450981, 1, 1,
0.4268376, 0.6482007, 0.03648471, 0, 0.07058824, 1, 1,
0.4324744, -0.6142818, 3.736096, 0, 0.0627451, 1, 1,
0.435842, -0.2553581, 1.30288, 0, 0.05882353, 1, 1,
0.441498, -1.599467, 2.109544, 0, 0.05098039, 1, 1,
0.4446407, -0.4380363, 2.22476, 0, 0.04705882, 1, 1,
0.4478194, 1.455699, 0.1889038, 0, 0.03921569, 1, 1,
0.4483956, 1.702481, 0.3757713, 0, 0.03529412, 1, 1,
0.4536103, 0.7757404, 1.193039, 0, 0.02745098, 1, 1,
0.4566515, -0.3439421, 3.652975, 0, 0.02352941, 1, 1,
0.463539, 1.99317, -0.972909, 0, 0.01568628, 1, 1,
0.4640463, -0.7023675, 1.80946, 0, 0.01176471, 1, 1,
0.4657071, 1.26618, 0.703468, 0, 0.003921569, 1, 1,
0.4664559, 0.668161, 1.378213, 0.003921569, 0, 1, 1,
0.4664876, -0.7815041, 3.546388, 0.007843138, 0, 1, 1,
0.4673646, -0.4203516, 1.506333, 0.01568628, 0, 1, 1,
0.4694363, 0.1433508, 1.577857, 0.01960784, 0, 1, 1,
0.4705262, -0.5427587, 2.994254, 0.02745098, 0, 1, 1,
0.4787684, -0.2957075, 1.161636, 0.03137255, 0, 1, 1,
0.4800167, 0.01032959, 2.668452, 0.03921569, 0, 1, 1,
0.4802181, 0.2762101, 0.8290736, 0.04313726, 0, 1, 1,
0.48964, -1.80954, 2.226154, 0.05098039, 0, 1, 1,
0.4928543, 0.5696851, -0.6103501, 0.05490196, 0, 1, 1,
0.4952802, 1.435048, -0.5176949, 0.0627451, 0, 1, 1,
0.4958926, 0.7051256, 0.310054, 0.06666667, 0, 1, 1,
0.4984572, 0.7923043, 0.1918982, 0.07450981, 0, 1, 1,
0.5069507, 0.6949752, 1.193544, 0.07843138, 0, 1, 1,
0.5072386, 0.4592049, 1.684778, 0.08627451, 0, 1, 1,
0.5088137, -0.1194549, 2.111953, 0.09019608, 0, 1, 1,
0.5148667, 0.5565359, 0.22011, 0.09803922, 0, 1, 1,
0.5191919, 1.057625, 0.6495857, 0.1058824, 0, 1, 1,
0.5203679, 1.053366, 1.733264, 0.1098039, 0, 1, 1,
0.5213761, -0.9350826, 2.376406, 0.1176471, 0, 1, 1,
0.5229459, -0.6870425, 0.9254, 0.1215686, 0, 1, 1,
0.5233617, -1.400401, 2.784235, 0.1294118, 0, 1, 1,
0.5291768, 0.5928212, 0.8787841, 0.1333333, 0, 1, 1,
0.5320665, -0.2097295, 3.110734, 0.1411765, 0, 1, 1,
0.5400355, 0.508291, 1.810567, 0.145098, 0, 1, 1,
0.5444326, 2.011059, 1.048342, 0.1529412, 0, 1, 1,
0.547935, -0.2495932, 2.158922, 0.1568628, 0, 1, 1,
0.5507917, -0.5555338, 2.893272, 0.1647059, 0, 1, 1,
0.5513196, 4.008062, -0.2763183, 0.1686275, 0, 1, 1,
0.5526606, -0.3700882, 3.716737, 0.1764706, 0, 1, 1,
0.5553134, -0.8818116, 1.524281, 0.1803922, 0, 1, 1,
0.5584493, 1.603697, 2.671725, 0.1882353, 0, 1, 1,
0.5605209, -0.7291673, 2.120907, 0.1921569, 0, 1, 1,
0.5634133, -0.7072203, 2.977122, 0.2, 0, 1, 1,
0.5645126, 0.708528, 0.8912488, 0.2078431, 0, 1, 1,
0.5665612, 0.8823522, 0.7128754, 0.2117647, 0, 1, 1,
0.571301, -0.1250955, 1.758024, 0.2196078, 0, 1, 1,
0.5829037, -0.308553, 2.914304, 0.2235294, 0, 1, 1,
0.5834687, 1.165738, 0.7643226, 0.2313726, 0, 1, 1,
0.5931493, -0.7050827, 1.078326, 0.2352941, 0, 1, 1,
0.5966392, -1.51986, 2.918646, 0.2431373, 0, 1, 1,
0.5982178, -1.195997, 2.959227, 0.2470588, 0, 1, 1,
0.6006318, 0.6441249, 0.710669, 0.254902, 0, 1, 1,
0.606539, -1.906086, 2.439332, 0.2588235, 0, 1, 1,
0.6072665, 0.4387726, 1.742281, 0.2666667, 0, 1, 1,
0.6154911, -0.07081465, 2.357874, 0.2705882, 0, 1, 1,
0.6179386, -0.2481159, 3.988503, 0.2784314, 0, 1, 1,
0.6191905, 0.7585005, 0.6483974, 0.282353, 0, 1, 1,
0.6208037, -0.4320457, 1.645886, 0.2901961, 0, 1, 1,
0.6226174, 0.08258542, 3.329278, 0.2941177, 0, 1, 1,
0.6236159, -0.2784258, 4.301388, 0.3019608, 0, 1, 1,
0.6257204, 1.143727, -1.178674, 0.3098039, 0, 1, 1,
0.6272765, -1.381886, 2.514637, 0.3137255, 0, 1, 1,
0.6297365, 1.324546, -0.3379992, 0.3215686, 0, 1, 1,
0.6302606, -0.6822201, 2.697036, 0.3254902, 0, 1, 1,
0.6378992, -0.1393832, 0.6909723, 0.3333333, 0, 1, 1,
0.6386292, 2.588698, 1.303994, 0.3372549, 0, 1, 1,
0.638877, -0.3797981, 1.21523, 0.345098, 0, 1, 1,
0.6452755, -0.9387239, 1.852375, 0.3490196, 0, 1, 1,
0.6479882, -0.04528036, 1.342438, 0.3568628, 0, 1, 1,
0.6509356, -1.479605, 2.143523, 0.3607843, 0, 1, 1,
0.6519269, 2.397281, -0.8621674, 0.3686275, 0, 1, 1,
0.6526931, -0.4264485, 2.176193, 0.372549, 0, 1, 1,
0.6530216, -0.9796414, 2.024866, 0.3803922, 0, 1, 1,
0.6533657, -1.131378, 1.137069, 0.3843137, 0, 1, 1,
0.6599385, -1.51183, 3.863957, 0.3921569, 0, 1, 1,
0.6640602, -0.7744735, 2.177262, 0.3960784, 0, 1, 1,
0.6650157, -0.2122807, 3.610769, 0.4039216, 0, 1, 1,
0.6709835, -0.374516, 1.569328, 0.4117647, 0, 1, 1,
0.6715202, 0.9751476, 1.897624, 0.4156863, 0, 1, 1,
0.6729682, -0.6052987, 0.701518, 0.4235294, 0, 1, 1,
0.6808332, -0.9149023, 1.763625, 0.427451, 0, 1, 1,
0.6819723, 0.1230261, 1.572797, 0.4352941, 0, 1, 1,
0.6837438, 0.3829643, 1.936885, 0.4392157, 0, 1, 1,
0.6854283, -0.3850477, 1.864473, 0.4470588, 0, 1, 1,
0.6856331, -1.330453, 3.373701, 0.4509804, 0, 1, 1,
0.6891822, -0.3649117, 0.778924, 0.4588235, 0, 1, 1,
0.6908422, 1.930384, -0.1358688, 0.4627451, 0, 1, 1,
0.691484, -0.1104799, 2.478111, 0.4705882, 0, 1, 1,
0.6924776, -0.1620668, 0.90681, 0.4745098, 0, 1, 1,
0.702712, 0.4043331, 0.505776, 0.4823529, 0, 1, 1,
0.7030238, 0.5965977, 2.719319, 0.4862745, 0, 1, 1,
0.7109703, -0.1209608, 2.234206, 0.4941176, 0, 1, 1,
0.7143129, 1.017763, 0.4119612, 0.5019608, 0, 1, 1,
0.7156315, -0.8604954, 1.382935, 0.5058824, 0, 1, 1,
0.7166704, -0.05966467, 1.562911, 0.5137255, 0, 1, 1,
0.7175701, 0.08286674, 0.9764351, 0.5176471, 0, 1, 1,
0.7181216, 0.2255272, 2.523323, 0.5254902, 0, 1, 1,
0.7222862, -0.8268569, 1.365012, 0.5294118, 0, 1, 1,
0.7234685, 0.2261453, 3.08797, 0.5372549, 0, 1, 1,
0.7275072, -0.498069, 3.813893, 0.5411765, 0, 1, 1,
0.7294309, 0.3553086, 0.4696166, 0.5490196, 0, 1, 1,
0.7330139, -1.874361, 4.109473, 0.5529412, 0, 1, 1,
0.7331478, -0.7212467, 2.38922, 0.5607843, 0, 1, 1,
0.7384881, -1.168626, 3.036757, 0.5647059, 0, 1, 1,
0.7443085, -0.8390903, 2.749459, 0.572549, 0, 1, 1,
0.7444829, 0.8343179, 0.2835952, 0.5764706, 0, 1, 1,
0.7458671, -0.3443257, 3.767515, 0.5843138, 0, 1, 1,
0.7462489, 0.1579871, 1.320263, 0.5882353, 0, 1, 1,
0.747767, -1.478356, 2.57106, 0.5960785, 0, 1, 1,
0.7559269, -0.1089428, 2.081612, 0.6039216, 0, 1, 1,
0.7592093, -1.73257, 2.018665, 0.6078432, 0, 1, 1,
0.7604693, -0.4215231, 2.09726, 0.6156863, 0, 1, 1,
0.7655504, 0.2030264, 0.7490798, 0.6196079, 0, 1, 1,
0.7674221, -1.438475, 0.8504618, 0.627451, 0, 1, 1,
0.7709672, -0.2854483, 0.7502004, 0.6313726, 0, 1, 1,
0.7710895, -1.058829, 3.931515, 0.6392157, 0, 1, 1,
0.7827302, 1.623759, 1.119673, 0.6431373, 0, 1, 1,
0.7859595, 0.1014778, 2.29599, 0.6509804, 0, 1, 1,
0.7966942, 0.4860054, -0.8645501, 0.654902, 0, 1, 1,
0.8069344, 0.4913809, 1.157213, 0.6627451, 0, 1, 1,
0.8084975, 0.7079465, -0.9207287, 0.6666667, 0, 1, 1,
0.8096362, -0.5044038, 2.468796, 0.6745098, 0, 1, 1,
0.8106484, 0.6624147, 3.063231, 0.6784314, 0, 1, 1,
0.8145261, 0.1432108, 0.9850085, 0.6862745, 0, 1, 1,
0.8164955, -2.438254, 2.377852, 0.6901961, 0, 1, 1,
0.8206065, -0.5137429, 2.880657, 0.6980392, 0, 1, 1,
0.8213007, 0.6469567, 0.6446931, 0.7058824, 0, 1, 1,
0.8223094, 2.146165, 0.1457339, 0.7098039, 0, 1, 1,
0.8374841, 0.2299355, 1.90033, 0.7176471, 0, 1, 1,
0.8429548, 1.556685, 0.9871637, 0.7215686, 0, 1, 1,
0.8441032, -0.418169, 2.142514, 0.7294118, 0, 1, 1,
0.8499812, 0.5217944, 1.866117, 0.7333333, 0, 1, 1,
0.85171, -1.00789, 1.761383, 0.7411765, 0, 1, 1,
0.8574623, 0.1016952, 2.619883, 0.7450981, 0, 1, 1,
0.8678052, -1.411161, 1.406541, 0.7529412, 0, 1, 1,
0.8716616, -0.7814602, 2.526237, 0.7568628, 0, 1, 1,
0.8719075, -0.809423, 0.6842252, 0.7647059, 0, 1, 1,
0.8764853, 0.6885331, 1.052248, 0.7686275, 0, 1, 1,
0.8802342, -0.2885034, 2.501236, 0.7764706, 0, 1, 1,
0.8844095, -0.9890277, 2.654001, 0.7803922, 0, 1, 1,
0.8875128, 0.9555488, 1.2183, 0.7882353, 0, 1, 1,
0.888047, -0.5409117, 3.331928, 0.7921569, 0, 1, 1,
0.8893664, 0.1319758, 1.064028, 0.8, 0, 1, 1,
0.8926808, 0.6242538, -0.09290914, 0.8078431, 0, 1, 1,
0.9024057, 1.487553, -1.085386, 0.8117647, 0, 1, 1,
0.9094232, 0.5829539, -1.05906, 0.8196079, 0, 1, 1,
0.9098176, 1.588793, 0.6740709, 0.8235294, 0, 1, 1,
0.9127792, 0.0358335, 0.972694, 0.8313726, 0, 1, 1,
0.9155895, -0.3106754, 2.490519, 0.8352941, 0, 1, 1,
0.920654, 0.3415532, 1.088929, 0.8431373, 0, 1, 1,
0.9249194, -0.6890821, 2.531878, 0.8470588, 0, 1, 1,
0.9253263, -0.03857071, 2.790802, 0.854902, 0, 1, 1,
0.9257076, -2.300259, 4.215856, 0.8588235, 0, 1, 1,
0.9270617, -0.07154188, 0.2422133, 0.8666667, 0, 1, 1,
0.9336942, 0.5209243, 2.621361, 0.8705882, 0, 1, 1,
0.9356154, 1.198686, 1.938827, 0.8784314, 0, 1, 1,
0.9400288, -0.3137264, 1.552203, 0.8823529, 0, 1, 1,
0.9444163, 0.4168526, -0.3305194, 0.8901961, 0, 1, 1,
0.9483926, 1.050745, -0.456137, 0.8941177, 0, 1, 1,
0.9534698, -0.1153611, 2.917006, 0.9019608, 0, 1, 1,
0.9545932, 0.1894332, 1.789018, 0.9098039, 0, 1, 1,
0.9566246, 0.9461207, 0.02068713, 0.9137255, 0, 1, 1,
0.9598562, 1.075339, -1.228924, 0.9215686, 0, 1, 1,
0.972455, -0.4147523, 0.6860955, 0.9254902, 0, 1, 1,
0.9743795, -0.5406615, 2.689723, 0.9333333, 0, 1, 1,
0.9760194, 0.2103277, -0.5560462, 0.9372549, 0, 1, 1,
0.9760905, 0.469259, 1.385932, 0.945098, 0, 1, 1,
0.9760908, 1.52125, 1.645703, 0.9490196, 0, 1, 1,
0.9766662, -0.1902792, 2.273593, 0.9568627, 0, 1, 1,
0.9771788, 0.4032936, 0.6543385, 0.9607843, 0, 1, 1,
0.9785967, -0.9721169, -0.2410677, 0.9686275, 0, 1, 1,
0.9807636, 1.153822, -1.098347, 0.972549, 0, 1, 1,
0.9824516, 0.04713116, 0.7602673, 0.9803922, 0, 1, 1,
0.9843193, 1.517767, 2.235402, 0.9843137, 0, 1, 1,
0.9909338, -0.5258036, 3.173428, 0.9921569, 0, 1, 1,
0.992573, 1.959622, 0.7481211, 0.9960784, 0, 1, 1,
0.9926083, -0.0061764, 2.515976, 1, 0, 0.9960784, 1,
1.001749, -0.1681711, 2.121809, 1, 0, 0.9882353, 1,
1.008682, 1.219146, 1.496343, 1, 0, 0.9843137, 1,
1.009835, -0.7784839, 2.862697, 1, 0, 0.9764706, 1,
1.017647, 0.9089055, 0.8994835, 1, 0, 0.972549, 1,
1.019071, 1.72128, 2.645968, 1, 0, 0.9647059, 1,
1.029881, -2.094413, 2.922272, 1, 0, 0.9607843, 1,
1.035875, 0.7132908, 0.416589, 1, 0, 0.9529412, 1,
1.037943, -1.327287, 3.416075, 1, 0, 0.9490196, 1,
1.042361, -0.1508676, 1.264561, 1, 0, 0.9411765, 1,
1.044972, -0.652151, 0.4112896, 1, 0, 0.9372549, 1,
1.047564, -2.674606, 4.276469, 1, 0, 0.9294118, 1,
1.047809, -0.6109238, 1.813154, 1, 0, 0.9254902, 1,
1.051264, 0.03761707, 2.251233, 1, 0, 0.9176471, 1,
1.052267, 0.417331, 0.1752941, 1, 0, 0.9137255, 1,
1.061863, -1.285026, 2.88229, 1, 0, 0.9058824, 1,
1.063654, -0.002292075, 2.889684, 1, 0, 0.9019608, 1,
1.08224, 0.8327472, -0.3232976, 1, 0, 0.8941177, 1,
1.087396, -0.2841038, 1.170876, 1, 0, 0.8862745, 1,
1.091187, -0.8246062, 2.152653, 1, 0, 0.8823529, 1,
1.094543, -0.2384305, 1.686924, 1, 0, 0.8745098, 1,
1.099146, -0.299315, 1.262506, 1, 0, 0.8705882, 1,
1.106188, -1.11943, 1.610486, 1, 0, 0.8627451, 1,
1.115274, -1.294039, 2.123106, 1, 0, 0.8588235, 1,
1.120963, 0.4140065, 0.3702347, 1, 0, 0.8509804, 1,
1.122156, 0.01500969, -0.04244071, 1, 0, 0.8470588, 1,
1.123952, 1.350172, 1.993236, 1, 0, 0.8392157, 1,
1.12736, 0.6105335, 0.6529601, 1, 0, 0.8352941, 1,
1.138486, -0.9527206, 2.411441, 1, 0, 0.827451, 1,
1.141609, -1.022772, 2.667033, 1, 0, 0.8235294, 1,
1.142552, 0.3821956, 1.85926, 1, 0, 0.8156863, 1,
1.146876, -0.1374864, 1.088222, 1, 0, 0.8117647, 1,
1.146907, 0.6857297, 2.559962, 1, 0, 0.8039216, 1,
1.148293, -1.548296, 3.589059, 1, 0, 0.7960784, 1,
1.151506, 0.4593664, 1.218178, 1, 0, 0.7921569, 1,
1.157746, 0.9076672, 0.7931743, 1, 0, 0.7843137, 1,
1.164916, 0.8571073, 0.6236842, 1, 0, 0.7803922, 1,
1.171195, -1.597788, 2.631648, 1, 0, 0.772549, 1,
1.172994, -0.1109056, 3.825227, 1, 0, 0.7686275, 1,
1.175224, 0.01076179, 0.5170192, 1, 0, 0.7607843, 1,
1.177263, -0.7653545, 0.9849794, 1, 0, 0.7568628, 1,
1.178016, 0.7599061, -0.6900231, 1, 0, 0.7490196, 1,
1.17923, 0.2535147, 0.5152475, 1, 0, 0.7450981, 1,
1.19443, -0.3047353, 2.587933, 1, 0, 0.7372549, 1,
1.197217, 0.731426, 0.7447829, 1, 0, 0.7333333, 1,
1.197639, 0.7163895, 0.816757, 1, 0, 0.7254902, 1,
1.204428, -1.254455, 2.830774, 1, 0, 0.7215686, 1,
1.212608, 2.131149, -0.7522258, 1, 0, 0.7137255, 1,
1.213601, -1.413185, 2.154822, 1, 0, 0.7098039, 1,
1.215803, -0.4975334, 0.3903382, 1, 0, 0.7019608, 1,
1.226139, 0.7912582, 3.154212, 1, 0, 0.6941177, 1,
1.226359, -0.548354, 2.761817, 1, 0, 0.6901961, 1,
1.226723, -0.3593872, 1.818916, 1, 0, 0.682353, 1,
1.227396, -0.2719685, 0.8810566, 1, 0, 0.6784314, 1,
1.22865, 1.817249, 0.6128873, 1, 0, 0.6705883, 1,
1.242319, -2.176732, 2.764659, 1, 0, 0.6666667, 1,
1.244457, 1.153364, 1.048696, 1, 0, 0.6588235, 1,
1.249774, -1.134708, 1.6629, 1, 0, 0.654902, 1,
1.251342, -0.2078889, 0.05594919, 1, 0, 0.6470588, 1,
1.253065, 1.200347, 2.12378, 1, 0, 0.6431373, 1,
1.262965, 1.362128, -0.3425083, 1, 0, 0.6352941, 1,
1.265591, 1.008832, -0.07828255, 1, 0, 0.6313726, 1,
1.272836, 0.4518351, 1.766876, 1, 0, 0.6235294, 1,
1.273489, -1.145796, 2.997275, 1, 0, 0.6196079, 1,
1.28128, -1.512889, 2.818376, 1, 0, 0.6117647, 1,
1.283045, 1.345843, -1.574726, 1, 0, 0.6078432, 1,
1.287146, 0.708818, 0.1811592, 1, 0, 0.6, 1,
1.29047, 0.8602858, -0.7891791, 1, 0, 0.5921569, 1,
1.291012, 0.6496667, 0.9819435, 1, 0, 0.5882353, 1,
1.294171, -0.1191001, 3.303336, 1, 0, 0.5803922, 1,
1.301952, -0.6609374, 2.60615, 1, 0, 0.5764706, 1,
1.303218, -0.2029574, 1.104298, 1, 0, 0.5686275, 1,
1.315553, 1.046225, 0.8246149, 1, 0, 0.5647059, 1,
1.319184, -0.610918, 1.026006, 1, 0, 0.5568628, 1,
1.321167, 0.5941246, 0.2825654, 1, 0, 0.5529412, 1,
1.322539, 0.197343, 0.9654261, 1, 0, 0.5450981, 1,
1.325309, 0.8814484, 1.248157, 1, 0, 0.5411765, 1,
1.331558, -0.342181, 3.329866, 1, 0, 0.5333334, 1,
1.33252, 0.5210038, 0.6454414, 1, 0, 0.5294118, 1,
1.341987, -0.5993667, 1.269054, 1, 0, 0.5215687, 1,
1.347778, -0.06800988, 1.070543, 1, 0, 0.5176471, 1,
1.35105, 0.1056887, 2.377764, 1, 0, 0.509804, 1,
1.360141, -0.1710474, 0.6149269, 1, 0, 0.5058824, 1,
1.375972, 1.911276, 1.218732, 1, 0, 0.4980392, 1,
1.377187, -0.4935544, 0.9227681, 1, 0, 0.4901961, 1,
1.386837, 0.2449248, 0.4955211, 1, 0, 0.4862745, 1,
1.388308, -1.000932, 4.196526, 1, 0, 0.4784314, 1,
1.388684, -1.209586, 2.34145, 1, 0, 0.4745098, 1,
1.396784, 0.6512755, -0.1073349, 1, 0, 0.4666667, 1,
1.404772, -0.8680619, 2.999778, 1, 0, 0.4627451, 1,
1.42401, -0.9392833, 0.8893889, 1, 0, 0.454902, 1,
1.425854, -1.474828, 2.450451, 1, 0, 0.4509804, 1,
1.427339, 0.2276169, 3.168977, 1, 0, 0.4431373, 1,
1.431794, -0.7499216, 1.882377, 1, 0, 0.4392157, 1,
1.440609, -0.5062703, 1.859859, 1, 0, 0.4313726, 1,
1.442904, 0.6835461, 0.9237332, 1, 0, 0.427451, 1,
1.457789, -2.620244, 0.3673287, 1, 0, 0.4196078, 1,
1.475161, -1.058959, 1.354871, 1, 0, 0.4156863, 1,
1.483938, -0.1632348, -0.1093524, 1, 0, 0.4078431, 1,
1.484967, 0.0585002, 1.665603, 1, 0, 0.4039216, 1,
1.489795, -0.2597259, 2.184645, 1, 0, 0.3960784, 1,
1.493534, 1.134148, 0.1906171, 1, 0, 0.3882353, 1,
1.499952, -1.434335, 1.907444, 1, 0, 0.3843137, 1,
1.506618, -1.239358, 2.126869, 1, 0, 0.3764706, 1,
1.514313, 1.045332, 0.1854582, 1, 0, 0.372549, 1,
1.516935, 2.021285, 1.80099, 1, 0, 0.3647059, 1,
1.518881, 0.8555133, 0.4762754, 1, 0, 0.3607843, 1,
1.529055, 1.765279, 0.8869374, 1, 0, 0.3529412, 1,
1.532488, -1.106895, 4.98573, 1, 0, 0.3490196, 1,
1.532599, 1.068722, 1.652261, 1, 0, 0.3411765, 1,
1.538541, 0.1032171, 2.49466, 1, 0, 0.3372549, 1,
1.554635, -1.929745, 2.022625, 1, 0, 0.3294118, 1,
1.570081, 1.928152, 1.650153, 1, 0, 0.3254902, 1,
1.575776, -0.5811784, 0.6488246, 1, 0, 0.3176471, 1,
1.577435, 0.5147224, 1.07984, 1, 0, 0.3137255, 1,
1.583469, 1.22727, -0.4250054, 1, 0, 0.3058824, 1,
1.58844, -0.9981158, 2.173167, 1, 0, 0.2980392, 1,
1.591059, 0.1897154, 0.405882, 1, 0, 0.2941177, 1,
1.591512, -0.4190079, 3.178368, 1, 0, 0.2862745, 1,
1.604856, 0.8536111, 0.7143511, 1, 0, 0.282353, 1,
1.618308, 0.996595, -1.500855, 1, 0, 0.2745098, 1,
1.623862, -1.059476, 2.358009, 1, 0, 0.2705882, 1,
1.635341, 2.203596, -0.03497936, 1, 0, 0.2627451, 1,
1.651874, 0.2618864, 1.936854, 1, 0, 0.2588235, 1,
1.670709, 2.082405, 2.347951, 1, 0, 0.2509804, 1,
1.703657, 0.3433641, 2.637158, 1, 0, 0.2470588, 1,
1.712018, -0.1557732, 1.896528, 1, 0, 0.2392157, 1,
1.753322, 0.7798111, 0.5139341, 1, 0, 0.2352941, 1,
1.781023, 0.5615056, -0.1967739, 1, 0, 0.227451, 1,
1.781038, -1.861578, 3.461076, 1, 0, 0.2235294, 1,
1.787028, -0.0012506, 2.057887, 1, 0, 0.2156863, 1,
1.787287, 0.5673729, 0.7852154, 1, 0, 0.2117647, 1,
1.835542, -1.866483, 4.35814, 1, 0, 0.2039216, 1,
1.836988, -1.031739, 3.38909, 1, 0, 0.1960784, 1,
1.883522, 0.799093, 1.680421, 1, 0, 0.1921569, 1,
1.888842, -0.1825809, -1.461933, 1, 0, 0.1843137, 1,
1.913239, -1.198831, 1.24463, 1, 0, 0.1803922, 1,
1.918836, 0.5630897, 1.942513, 1, 0, 0.172549, 1,
1.942, 1.278669, 1.037165, 1, 0, 0.1686275, 1,
1.989185, 0.4903244, -0.2644401, 1, 0, 0.1607843, 1,
1.997359, -0.2991407, 2.568579, 1, 0, 0.1568628, 1,
2.005871, 0.7689793, -0.4103627, 1, 0, 0.1490196, 1,
2.006145, 0.2043914, 1.114697, 1, 0, 0.145098, 1,
2.0136, -0.554616, 2.336519, 1, 0, 0.1372549, 1,
2.024136, -0.7975758, 2.747773, 1, 0, 0.1333333, 1,
2.037499, 0.1599051, 0.8880458, 1, 0, 0.1254902, 1,
2.038493, -0.1850972, 1.288437, 1, 0, 0.1215686, 1,
2.064502, -0.1037546, 1.397451, 1, 0, 0.1137255, 1,
2.065737, 0.06141395, 1.485652, 1, 0, 0.1098039, 1,
2.078038, -0.03129793, 0.9598226, 1, 0, 0.1019608, 1,
2.081267, 0.9450281, 2.396499, 1, 0, 0.09411765, 1,
2.085536, 0.6870759, 1.360065, 1, 0, 0.09019608, 1,
2.111609, -0.3598589, 2.484354, 1, 0, 0.08235294, 1,
2.151177, 1.521771, 2.122296, 1, 0, 0.07843138, 1,
2.200351, -1.472076, 2.055048, 1, 0, 0.07058824, 1,
2.209476, 0.452963, -0.01127205, 1, 0, 0.06666667, 1,
2.218012, -0.5226717, 1.360508, 1, 0, 0.05882353, 1,
2.24027, -0.2871617, 2.378606, 1, 0, 0.05490196, 1,
2.244854, -1.166615, 3.662637, 1, 0, 0.04705882, 1,
2.272245, 0.816121, -0.5658815, 1, 0, 0.04313726, 1,
2.322869, 1.527139, 2.690753, 1, 0, 0.03529412, 1,
2.375763, 1.200338, 1.583577, 1, 0, 0.03137255, 1,
2.432754, -0.4097572, 1.310077, 1, 0, 0.02352941, 1,
2.636196, -0.3034166, 0.5028157, 1, 0, 0.01960784, 1,
2.880696, 0.4387368, 0.8703777, 1, 0, 0.01176471, 1,
3.007132, 1.037387, 2.367821, 1, 0, 0.007843138, 1
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
-0.008654475, -4.738148, -6.985045, 0, -0.5, 0.5, 0.5,
-0.008654475, -4.738148, -6.985045, 1, -0.5, 0.5, 0.5,
-0.008654475, -4.738148, -6.985045, 1, 1.5, 0.5, 0.5,
-0.008654475, -4.738148, -6.985045, 0, 1.5, 0.5, 0.5
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
-4.046793, 0.2687678, -6.985045, 0, -0.5, 0.5, 0.5,
-4.046793, 0.2687678, -6.985045, 1, -0.5, 0.5, 0.5,
-4.046793, 0.2687678, -6.985045, 1, 1.5, 0.5, 0.5,
-4.046793, 0.2687678, -6.985045, 0, 1.5, 0.5, 0.5
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
-4.046793, -4.738148, -0.09471488, 0, -0.5, 0.5, 0.5,
-4.046793, -4.738148, -0.09471488, 1, -0.5, 0.5, 0.5,
-4.046793, -4.738148, -0.09471488, 1, 1.5, 0.5, 0.5,
-4.046793, -4.738148, -0.09471488, 0, 1.5, 0.5, 0.5
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
-3, -3.582705, -5.394969,
3, -3.582705, -5.394969,
-3, -3.582705, -5.394969,
-3, -3.775279, -5.659982,
-2, -3.582705, -5.394969,
-2, -3.775279, -5.659982,
-1, -3.582705, -5.394969,
-1, -3.775279, -5.659982,
0, -3.582705, -5.394969,
0, -3.775279, -5.659982,
1, -3.582705, -5.394969,
1, -3.775279, -5.659982,
2, -3.582705, -5.394969,
2, -3.775279, -5.659982,
3, -3.582705, -5.394969,
3, -3.775279, -5.659982
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
-3, -4.160427, -6.190008, 0, -0.5, 0.5, 0.5,
-3, -4.160427, -6.190008, 1, -0.5, 0.5, 0.5,
-3, -4.160427, -6.190008, 1, 1.5, 0.5, 0.5,
-3, -4.160427, -6.190008, 0, 1.5, 0.5, 0.5,
-2, -4.160427, -6.190008, 0, -0.5, 0.5, 0.5,
-2, -4.160427, -6.190008, 1, -0.5, 0.5, 0.5,
-2, -4.160427, -6.190008, 1, 1.5, 0.5, 0.5,
-2, -4.160427, -6.190008, 0, 1.5, 0.5, 0.5,
-1, -4.160427, -6.190008, 0, -0.5, 0.5, 0.5,
-1, -4.160427, -6.190008, 1, -0.5, 0.5, 0.5,
-1, -4.160427, -6.190008, 1, 1.5, 0.5, 0.5,
-1, -4.160427, -6.190008, 0, 1.5, 0.5, 0.5,
0, -4.160427, -6.190008, 0, -0.5, 0.5, 0.5,
0, -4.160427, -6.190008, 1, -0.5, 0.5, 0.5,
0, -4.160427, -6.190008, 1, 1.5, 0.5, 0.5,
0, -4.160427, -6.190008, 0, 1.5, 0.5, 0.5,
1, -4.160427, -6.190008, 0, -0.5, 0.5, 0.5,
1, -4.160427, -6.190008, 1, -0.5, 0.5, 0.5,
1, -4.160427, -6.190008, 1, 1.5, 0.5, 0.5,
1, -4.160427, -6.190008, 0, 1.5, 0.5, 0.5,
2, -4.160427, -6.190008, 0, -0.5, 0.5, 0.5,
2, -4.160427, -6.190008, 1, -0.5, 0.5, 0.5,
2, -4.160427, -6.190008, 1, 1.5, 0.5, 0.5,
2, -4.160427, -6.190008, 0, 1.5, 0.5, 0.5,
3, -4.160427, -6.190008, 0, -0.5, 0.5, 0.5,
3, -4.160427, -6.190008, 1, -0.5, 0.5, 0.5,
3, -4.160427, -6.190008, 1, 1.5, 0.5, 0.5,
3, -4.160427, -6.190008, 0, 1.5, 0.5, 0.5
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
-3.114915, -2, -5.394969,
-3.114915, 4, -5.394969,
-3.114915, -2, -5.394969,
-3.270228, -2, -5.659982,
-3.114915, 0, -5.394969,
-3.270228, 0, -5.659982,
-3.114915, 2, -5.394969,
-3.270228, 2, -5.659982,
-3.114915, 4, -5.394969,
-3.270228, 4, -5.659982
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
"0",
"2",
"4"
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
-3.580854, -2, -6.190008, 0, -0.5, 0.5, 0.5,
-3.580854, -2, -6.190008, 1, -0.5, 0.5, 0.5,
-3.580854, -2, -6.190008, 1, 1.5, 0.5, 0.5,
-3.580854, -2, -6.190008, 0, 1.5, 0.5, 0.5,
-3.580854, 0, -6.190008, 0, -0.5, 0.5, 0.5,
-3.580854, 0, -6.190008, 1, -0.5, 0.5, 0.5,
-3.580854, 0, -6.190008, 1, 1.5, 0.5, 0.5,
-3.580854, 0, -6.190008, 0, 1.5, 0.5, 0.5,
-3.580854, 2, -6.190008, 0, -0.5, 0.5, 0.5,
-3.580854, 2, -6.190008, 1, -0.5, 0.5, 0.5,
-3.580854, 2, -6.190008, 1, 1.5, 0.5, 0.5,
-3.580854, 2, -6.190008, 0, 1.5, 0.5, 0.5,
-3.580854, 4, -6.190008, 0, -0.5, 0.5, 0.5,
-3.580854, 4, -6.190008, 1, -0.5, 0.5, 0.5,
-3.580854, 4, -6.190008, 1, 1.5, 0.5, 0.5,
-3.580854, 4, -6.190008, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.114915, -3.582705, -4,
-3.114915, -3.582705, 4,
-3.114915, -3.582705, -4,
-3.270228, -3.775279, -4,
-3.114915, -3.582705, -2,
-3.270228, -3.775279, -2,
-3.114915, -3.582705, 0,
-3.270228, -3.775279, 0,
-3.114915, -3.582705, 2,
-3.270228, -3.775279, 2,
-3.114915, -3.582705, 4,
-3.270228, -3.775279, 4
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
-3.580854, -4.160427, -4, 0, -0.5, 0.5, 0.5,
-3.580854, -4.160427, -4, 1, -0.5, 0.5, 0.5,
-3.580854, -4.160427, -4, 1, 1.5, 0.5, 0.5,
-3.580854, -4.160427, -4, 0, 1.5, 0.5, 0.5,
-3.580854, -4.160427, -2, 0, -0.5, 0.5, 0.5,
-3.580854, -4.160427, -2, 1, -0.5, 0.5, 0.5,
-3.580854, -4.160427, -2, 1, 1.5, 0.5, 0.5,
-3.580854, -4.160427, -2, 0, 1.5, 0.5, 0.5,
-3.580854, -4.160427, 0, 0, -0.5, 0.5, 0.5,
-3.580854, -4.160427, 0, 1, -0.5, 0.5, 0.5,
-3.580854, -4.160427, 0, 1, 1.5, 0.5, 0.5,
-3.580854, -4.160427, 0, 0, 1.5, 0.5, 0.5,
-3.580854, -4.160427, 2, 0, -0.5, 0.5, 0.5,
-3.580854, -4.160427, 2, 1, -0.5, 0.5, 0.5,
-3.580854, -4.160427, 2, 1, 1.5, 0.5, 0.5,
-3.580854, -4.160427, 2, 0, 1.5, 0.5, 0.5,
-3.580854, -4.160427, 4, 0, -0.5, 0.5, 0.5,
-3.580854, -4.160427, 4, 1, -0.5, 0.5, 0.5,
-3.580854, -4.160427, 4, 1, 1.5, 0.5, 0.5,
-3.580854, -4.160427, 4, 0, 1.5, 0.5, 0.5
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
-3.114915, -3.582705, -5.394969,
-3.114915, 4.120241, -5.394969,
-3.114915, -3.582705, 5.20554,
-3.114915, 4.120241, 5.20554,
-3.114915, -3.582705, -5.394969,
-3.114915, -3.582705, 5.20554,
-3.114915, 4.120241, -5.394969,
-3.114915, 4.120241, 5.20554,
-3.114915, -3.582705, -5.394969,
3.097606, -3.582705, -5.394969,
-3.114915, -3.582705, 5.20554,
3.097606, -3.582705, 5.20554,
-3.114915, 4.120241, -5.394969,
3.097606, 4.120241, -5.394969,
-3.114915, 4.120241, 5.20554,
3.097606, 4.120241, 5.20554,
3.097606, -3.582705, -5.394969,
3.097606, 4.120241, -5.394969,
3.097606, -3.582705, 5.20554,
3.097606, 4.120241, 5.20554,
3.097606, -3.582705, -5.394969,
3.097606, -3.582705, 5.20554,
3.097606, 4.120241, -5.394969,
3.097606, 4.120241, 5.20554
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
var radius = 7.743668;
var distance = 34.45245;
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
mvMatrix.translate( 0.008654475, -0.2687678, 0.09471488 );
mvMatrix.scale( 1.347699, 1.086935, 0.7898306 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.45245);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
O-ethyl_phosphorodit<-read.table("O-ethyl_phosphorodit.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-O-ethyl_phosphorodit$V2
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
y<-O-ethyl_phosphorodit$V3
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
z<-O-ethyl_phosphorodit$V4
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
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
-3.024441, 1.215096, -0.7505113, 0, 0, 1, 1, 1,
-2.990851, -0.7700911, -1.695141, 1, 0, 0, 1, 1,
-2.767776, 0.4006241, -0.4435561, 1, 0, 0, 1, 1,
-2.714151, 0.4659293, -2.475311, 1, 0, 0, 1, 1,
-2.692059, 1.487099, -1.719938, 1, 0, 0, 1, 1,
-2.666967, -1.184963, -2.614259, 1, 0, 0, 1, 1,
-2.636456, 1.065546, -3.58906, 0, 0, 0, 1, 1,
-2.634953, 0.6562009, 0.1225205, 0, 0, 0, 1, 1,
-2.603467, -0.8578932, -2.86606, 0, 0, 0, 1, 1,
-2.586925, -0.2406878, -0.5114906, 0, 0, 0, 1, 1,
-2.56089, -0.1332429, 0.1573509, 0, 0, 0, 1, 1,
-2.539657, 1.087298, -0.5824382, 0, 0, 0, 1, 1,
-2.458426, -1.499832, -0.2169347, 0, 0, 0, 1, 1,
-2.430799, 0.2106666, -0.3657029, 1, 1, 1, 1, 1,
-2.318378, -2.181635, -1.953595, 1, 1, 1, 1, 1,
-2.192064, 1.303696, -0.6586179, 1, 1, 1, 1, 1,
-2.151357, -0.6390157, -1.835936, 1, 1, 1, 1, 1,
-2.115024, 1.273386, -0.3572487, 1, 1, 1, 1, 1,
-2.062689, 0.1779835, -0.2070627, 1, 1, 1, 1, 1,
-2.061664, 2.956526, 0.5756545, 1, 1, 1, 1, 1,
-2.052831, -0.7395759, -3.281051, 1, 1, 1, 1, 1,
-2.050033, 0.1254051, -2.862378, 1, 1, 1, 1, 1,
-2.050026, 0.706073, 0.2863538, 1, 1, 1, 1, 1,
-2.029259, -0.8648598, -3.61293, 1, 1, 1, 1, 1,
-2.027408, -0.3852138, -2.404637, 1, 1, 1, 1, 1,
-2.010282, -1.067614, -2.999223, 1, 1, 1, 1, 1,
-2.006656, 0.9966384, 1.258349, 1, 1, 1, 1, 1,
-1.982688, -0.8410547, -2.309477, 1, 1, 1, 1, 1,
-1.963038, -1.02198, -1.985888, 0, 0, 1, 1, 1,
-1.960458, 0.05876253, 0.221368, 1, 0, 0, 1, 1,
-1.956657, -0.9630132, -0.7135319, 1, 0, 0, 1, 1,
-1.94628, 0.01458098, -3.607497, 1, 0, 0, 1, 1,
-1.930894, 1.069787, -0.9435397, 1, 0, 0, 1, 1,
-1.90302, 1.475681, -0.2483899, 1, 0, 0, 1, 1,
-1.888354, 1.716483, -0.4331547, 0, 0, 0, 1, 1,
-1.875941, 0.2949567, -1.333368, 0, 0, 0, 1, 1,
-1.859694, -0.0266272, -3.307573, 0, 0, 0, 1, 1,
-1.84659, 0.9535488, -1.659466, 0, 0, 0, 1, 1,
-1.77625, 0.7995107, -3.052382, 0, 0, 0, 1, 1,
-1.775906, 0.4770377, -0.9144013, 0, 0, 0, 1, 1,
-1.754802, 1.285071, -1.401582, 0, 0, 0, 1, 1,
-1.737045, 0.7935055, -0.805748, 1, 1, 1, 1, 1,
-1.735645, -1.089509, -2.471845, 1, 1, 1, 1, 1,
-1.727683, 0.01716869, -2.046464, 1, 1, 1, 1, 1,
-1.724691, 0.3506441, -2.565804, 1, 1, 1, 1, 1,
-1.724213, 0.03756741, -2.100305, 1, 1, 1, 1, 1,
-1.717716, 0.3573991, -1.488433, 1, 1, 1, 1, 1,
-1.713568, 0.3072599, -1.404382, 1, 1, 1, 1, 1,
-1.698412, 0.2958764, -2.617638, 1, 1, 1, 1, 1,
-1.697655, 0.3335966, 0.09789216, 1, 1, 1, 1, 1,
-1.690681, -0.7543375, -3.606218, 1, 1, 1, 1, 1,
-1.683225, -0.0005958823, -4.804742, 1, 1, 1, 1, 1,
-1.662705, -0.8542333, -3.028347, 1, 1, 1, 1, 1,
-1.633356, -1.54616, -3.298351, 1, 1, 1, 1, 1,
-1.632831, -0.05154213, -2.287079, 1, 1, 1, 1, 1,
-1.62255, 1.061087, -0.565915, 1, 1, 1, 1, 1,
-1.616312, 0.477576, -1.588591, 0, 0, 1, 1, 1,
-1.612878, -0.3992762, -1.017222, 1, 0, 0, 1, 1,
-1.611099, -0.59196, -2.759896, 1, 0, 0, 1, 1,
-1.610267, 0.7200214, 0.2222199, 1, 0, 0, 1, 1,
-1.592781, 0.6744128, -1.773322, 1, 0, 0, 1, 1,
-1.592422, 0.100469, -0.4012896, 1, 0, 0, 1, 1,
-1.585832, -1.743118, -2.242667, 0, 0, 0, 1, 1,
-1.564338, -0.03867429, -1.342419, 0, 0, 0, 1, 1,
-1.533666, 1.711469, -2.095567, 0, 0, 0, 1, 1,
-1.522699, 1.500884, 0.1915532, 0, 0, 0, 1, 1,
-1.510395, 0.4623472, -2.773523, 0, 0, 0, 1, 1,
-1.497321, -0.8052499, -2.269848, 0, 0, 0, 1, 1,
-1.496054, -1.668637, -1.033826, 0, 0, 0, 1, 1,
-1.496009, -0.0938397, -2.742204, 1, 1, 1, 1, 1,
-1.485861, -0.03683835, -0.1545054, 1, 1, 1, 1, 1,
-1.46695, -1.737455, -1.367862, 1, 1, 1, 1, 1,
-1.459747, 0.2873104, -1.666109, 1, 1, 1, 1, 1,
-1.454511, 0.05313502, -1.740501, 1, 1, 1, 1, 1,
-1.453427, -0.06978332, -1.032635, 1, 1, 1, 1, 1,
-1.45153, -0.8249629, -2.005465, 1, 1, 1, 1, 1,
-1.448536, -0.4955612, -2.436176, 1, 1, 1, 1, 1,
-1.444498, -0.5531355, -2.476225, 1, 1, 1, 1, 1,
-1.437471, 1.275564, -2.056154, 1, 1, 1, 1, 1,
-1.433538, -0.1472427, -1.048391, 1, 1, 1, 1, 1,
-1.429953, -1.441493, -2.300266, 1, 1, 1, 1, 1,
-1.429686, -0.07094624, -1.675248, 1, 1, 1, 1, 1,
-1.424076, -2.150004, -4.127479, 1, 1, 1, 1, 1,
-1.412588, -0.4967708, -2.129421, 1, 1, 1, 1, 1,
-1.410373, 0.06164421, -1.999726, 0, 0, 1, 1, 1,
-1.407614, -0.1286776, -2.746326, 1, 0, 0, 1, 1,
-1.407103, 0.3533448, -0.7453263, 1, 0, 0, 1, 1,
-1.403281, 1.400059, -2.203474, 1, 0, 0, 1, 1,
-1.400729, -0.4269669, -2.824681, 1, 0, 0, 1, 1,
-1.393716, 0.8824515, -0.5622528, 1, 0, 0, 1, 1,
-1.386907, 0.3325329, -0.7196797, 0, 0, 0, 1, 1,
-1.357721, 1.693584, -0.8788159, 0, 0, 0, 1, 1,
-1.327426, -2.485868, -1.066554, 0, 0, 0, 1, 1,
-1.326234, 0.4780473, -1.264594, 0, 0, 0, 1, 1,
-1.315757, -0.3897372, -2.11235, 0, 0, 0, 1, 1,
-1.310596, 0.2322878, -0.3207781, 0, 0, 0, 1, 1,
-1.307647, -0.3980042, -2.386645, 0, 0, 0, 1, 1,
-1.302747, 0.3033027, -0.3084928, 1, 1, 1, 1, 1,
-1.301389, 1.323001, 0.4136324, 1, 1, 1, 1, 1,
-1.285245, 0.8112707, -1.42016, 1, 1, 1, 1, 1,
-1.271095, 0.4524012, -2.1149, 1, 1, 1, 1, 1,
-1.270565, 2.643501, -1.092356, 1, 1, 1, 1, 1,
-1.265842, 0.9570369, -0.1742147, 1, 1, 1, 1, 1,
-1.24315, -0.8755859, -0.9676523, 1, 1, 1, 1, 1,
-1.230361, 1.590914, -0.4400339, 1, 1, 1, 1, 1,
-1.227704, -0.3957327, -1.278149, 1, 1, 1, 1, 1,
-1.225581, -0.9431385, -1.231226, 1, 1, 1, 1, 1,
-1.22532, -0.7907282, -2.005454, 1, 1, 1, 1, 1,
-1.223995, -2.112375, -3.016528, 1, 1, 1, 1, 1,
-1.222572, 0.707693, -2.24837, 1, 1, 1, 1, 1,
-1.21275, -0.9328432, -1.692449, 1, 1, 1, 1, 1,
-1.212653, 0.5435372, -0.4774532, 1, 1, 1, 1, 1,
-1.20419, 0.2217911, -2.90895, 0, 0, 1, 1, 1,
-1.203385, 0.3496745, -2.14272, 1, 0, 0, 1, 1,
-1.192854, 0.7513596, 0.9081525, 1, 0, 0, 1, 1,
-1.173535, 1.046071, 0.7639763, 1, 0, 0, 1, 1,
-1.169859, -1.279692, -2.51082, 1, 0, 0, 1, 1,
-1.166495, -1.167781, -2.666862, 1, 0, 0, 1, 1,
-1.162617, -0.5119108, -2.635993, 0, 0, 0, 1, 1,
-1.161885, -0.1214886, -3.019782, 0, 0, 0, 1, 1,
-1.161772, 0.4579313, -1.261704, 0, 0, 0, 1, 1,
-1.160789, 0.2663912, -1.530563, 0, 0, 0, 1, 1,
-1.15898, 0.07159167, -0.954653, 0, 0, 0, 1, 1,
-1.150216, 0.6329864, -1.600576, 0, 0, 0, 1, 1,
-1.143757, -1.070548, -1.742937, 0, 0, 0, 1, 1,
-1.133539, 0.4548195, -1.191929, 1, 1, 1, 1, 1,
-1.129241, -0.5697715, -2.136897, 1, 1, 1, 1, 1,
-1.129036, -0.09966113, -2.537758, 1, 1, 1, 1, 1,
-1.128212, -1.22947, -3.431214, 1, 1, 1, 1, 1,
-1.126134, -1.430596, -2.38526, 1, 1, 1, 1, 1,
-1.119686, 1.107609, -1.376876, 1, 1, 1, 1, 1,
-1.116089, 0.9171696, -0.5359018, 1, 1, 1, 1, 1,
-1.115641, 0.2365293, -2.65195, 1, 1, 1, 1, 1,
-1.104439, -2.541454, -4.536593, 1, 1, 1, 1, 1,
-1.104195, 0.129041, -1.023117, 1, 1, 1, 1, 1,
-1.085173, 0.9196936, -1.426805, 1, 1, 1, 1, 1,
-1.084371, 0.4582118, -0.2804512, 1, 1, 1, 1, 1,
-1.082168, -1.306019, -2.046837, 1, 1, 1, 1, 1,
-1.076478, -0.408845, -0.8737189, 1, 1, 1, 1, 1,
-1.073049, -1.316755, -1.649574, 1, 1, 1, 1, 1,
-1.070783, -1.619779, -2.036549, 0, 0, 1, 1, 1,
-1.069564, 0.5221416, -0.7183549, 1, 0, 0, 1, 1,
-1.068426, 1.452568, -1.624115, 1, 0, 0, 1, 1,
-1.066098, -0.2754304, -2.261063, 1, 0, 0, 1, 1,
-1.064112, 0.7930083, -0.7147149, 1, 0, 0, 1, 1,
-1.060213, 0.4292026, -2.991526, 1, 0, 0, 1, 1,
-1.05874, 1.183419, -1.73692, 0, 0, 0, 1, 1,
-1.058319, -0.3156619, -2.819869, 0, 0, 0, 1, 1,
-1.055847, 0.7586046, -2.940344, 0, 0, 0, 1, 1,
-1.052149, -0.1150258, -0.2924328, 0, 0, 0, 1, 1,
-1.033145, 1.775045, -0.4602184, 0, 0, 0, 1, 1,
-1.032293, -0.4368149, -2.859604, 0, 0, 0, 1, 1,
-1.025513, 0.3650803, -1.098642, 0, 0, 0, 1, 1,
-1.0212, 1.479784, -0.8279017, 1, 1, 1, 1, 1,
-1.019475, 2.738306, -0.4390694, 1, 1, 1, 1, 1,
-1.018146, 1.252798, 0.3860026, 1, 1, 1, 1, 1,
-1.011465, -0.4757254, -2.302825, 1, 1, 1, 1, 1,
-1.004247, -1.077833, -1.734385, 1, 1, 1, 1, 1,
-1.003755, -0.118103, -1.478169, 1, 1, 1, 1, 1,
-0.9999849, -1.19529, -0.1943912, 1, 1, 1, 1, 1,
-0.9974427, -1.671683, -3.54037, 1, 1, 1, 1, 1,
-0.9937363, -0.951507, -2.527279, 1, 1, 1, 1, 1,
-0.9847792, 0.6634157, -1.178633, 1, 1, 1, 1, 1,
-0.9730179, -0.6035251, -3.303172, 1, 1, 1, 1, 1,
-0.969483, 0.3638041, -2.52082, 1, 1, 1, 1, 1,
-0.9680647, 0.09275649, -2.773253, 1, 1, 1, 1, 1,
-0.9612104, 1.905552, -1.890138, 1, 1, 1, 1, 1,
-0.9604488, 1.983038, -1.740049, 1, 1, 1, 1, 1,
-0.9593048, -0.2096468, -1.800326, 0, 0, 1, 1, 1,
-0.9588156, 0.4794931, -1.959637, 1, 0, 0, 1, 1,
-0.9573515, -0.7835234, -1.352029, 1, 0, 0, 1, 1,
-0.9560872, 0.4442005, 0.3667581, 1, 0, 0, 1, 1,
-0.9455875, -1.173158, -1.837743, 1, 0, 0, 1, 1,
-0.9455383, 0.8673199, -0.3367923, 1, 0, 0, 1, 1,
-0.9422737, 0.1390715, -1.45346, 0, 0, 0, 1, 1,
-0.9420985, -0.4841928, -1.827921, 0, 0, 0, 1, 1,
-0.9405909, 1.594469, -0.2882425, 0, 0, 0, 1, 1,
-0.9338289, 1.024546, -1.504695, 0, 0, 0, 1, 1,
-0.9328904, 0.3636808, -1.126872, 0, 0, 0, 1, 1,
-0.9316064, -0.585061, -3.123672, 0, 0, 0, 1, 1,
-0.9303569, 0.7078569, -0.6309866, 0, 0, 0, 1, 1,
-0.9244036, 0.2151552, -1.178325, 1, 1, 1, 1, 1,
-0.9237164, -0.1708914, -0.2264096, 1, 1, 1, 1, 1,
-0.9236141, 0.734035, -0.08466935, 1, 1, 1, 1, 1,
-0.9224145, -0.6004043, -1.893068, 1, 1, 1, 1, 1,
-0.919996, -0.62868, -2.041454, 1, 1, 1, 1, 1,
-0.9161806, -1.30383, -2.527878, 1, 1, 1, 1, 1,
-0.9025973, 0.19728, -0.9750845, 1, 1, 1, 1, 1,
-0.9024157, 1.968073, -0.3888602, 1, 1, 1, 1, 1,
-0.9019767, 0.2469886, -1.038257, 1, 1, 1, 1, 1,
-0.8975073, -0.06084385, -3.080497, 1, 1, 1, 1, 1,
-0.8969939, 0.6058696, -1.893424, 1, 1, 1, 1, 1,
-0.8962898, -0.08523738, -2.734128, 1, 1, 1, 1, 1,
-0.8936912, -0.34437, -1.160136, 1, 1, 1, 1, 1,
-0.8919193, 0.9071388, -0.1988311, 1, 1, 1, 1, 1,
-0.8889186, -0.8330566, -0.3821304, 1, 1, 1, 1, 1,
-0.8636853, -1.088105, -3.469222, 0, 0, 1, 1, 1,
-0.8585502, -0.863426, -2.296964, 1, 0, 0, 1, 1,
-0.8544286, -1.578938, -3.143452, 1, 0, 0, 1, 1,
-0.8540324, 0.1037132, -2.09916, 1, 0, 0, 1, 1,
-0.8534606, 0.867177, 0.6888151, 1, 0, 0, 1, 1,
-0.8485221, -1.167739, -3.546507, 1, 0, 0, 1, 1,
-0.8415061, -0.1827505, -1.520934, 0, 0, 0, 1, 1,
-0.8409724, 0.7349915, -2.893552, 0, 0, 0, 1, 1,
-0.8409389, 0.2728757, -0.9119897, 0, 0, 0, 1, 1,
-0.8392168, -1.438111, -1.297557, 0, 0, 0, 1, 1,
-0.8384752, -0.5216372, -2.652, 0, 0, 0, 1, 1,
-0.8370048, 0.7216343, -0.833372, 0, 0, 0, 1, 1,
-0.8351202, -0.5492762, -0.09913766, 0, 0, 0, 1, 1,
-0.8277973, 1.260598, -1.224214, 1, 1, 1, 1, 1,
-0.824996, -0.5398634, 0.3726612, 1, 1, 1, 1, 1,
-0.8154877, 0.5402563, -1.193237, 1, 1, 1, 1, 1,
-0.8141444, -0.8814207, -2.65447, 1, 1, 1, 1, 1,
-0.8127295, -0.8392968, -2.656749, 1, 1, 1, 1, 1,
-0.8093848, 0.9915661, -0.2514604, 1, 1, 1, 1, 1,
-0.8059876, -0.2598238, -1.00686, 1, 1, 1, 1, 1,
-0.8033929, 1.514343, 2.200841, 1, 1, 1, 1, 1,
-0.7839385, 0.01266328, -1.080342, 1, 1, 1, 1, 1,
-0.7811472, -0.1565341, -2.559997, 1, 1, 1, 1, 1,
-0.7808408, 1.070147, -0.1247788, 1, 1, 1, 1, 1,
-0.7711952, 0.6169865, -0.4194568, 1, 1, 1, 1, 1,
-0.7685437, 0.5895362, -0.05323273, 1, 1, 1, 1, 1,
-0.7668279, 0.2070847, -2.275619, 1, 1, 1, 1, 1,
-0.7650942, 1.380953, -1.214236, 1, 1, 1, 1, 1,
-0.7561091, 0.8303869, 0.1578315, 0, 0, 1, 1, 1,
-0.7545019, -0.1705566, -2.247067, 1, 0, 0, 1, 1,
-0.7519923, 1.842412, -1.655987, 1, 0, 0, 1, 1,
-0.7476143, 0.8239412, -0.8551706, 1, 0, 0, 1, 1,
-0.7458985, 0.4989855, -0.7082728, 1, 0, 0, 1, 1,
-0.7421637, -0.6745927, -2.076939, 1, 0, 0, 1, 1,
-0.7403037, 0.03743096, -2.144224, 0, 0, 0, 1, 1,
-0.738028, -1.648922, -2.433497, 0, 0, 0, 1, 1,
-0.7372683, 0.1287531, -1.357298, 0, 0, 0, 1, 1,
-0.7366171, 0.2043869, -1.336197, 0, 0, 0, 1, 1,
-0.7339356, 1.203304, -0.7591111, 0, 0, 0, 1, 1,
-0.7334051, 0.477565, 0.1564577, 0, 0, 0, 1, 1,
-0.7279311, -0.4970094, -0.7659391, 0, 0, 0, 1, 1,
-0.723229, 1.189223, -0.03783988, 1, 1, 1, 1, 1,
-0.7189736, 1.621271, -1.967091, 1, 1, 1, 1, 1,
-0.7186568, 0.3851933, -1.331398, 1, 1, 1, 1, 1,
-0.7163308, 0.1535637, -2.493901, 1, 1, 1, 1, 1,
-0.712287, 0.221043, -2.495163, 1, 1, 1, 1, 1,
-0.706222, 0.9560789, 1.091654, 1, 1, 1, 1, 1,
-0.7025149, 0.7281902, -0.6908793, 1, 1, 1, 1, 1,
-0.701291, 0.7378783, 1.200241, 1, 1, 1, 1, 1,
-0.6974759, -0.5732684, -2.169055, 1, 1, 1, 1, 1,
-0.6962036, 0.05707909, -1.980511, 1, 1, 1, 1, 1,
-0.6961232, -0.9733678, -2.627386, 1, 1, 1, 1, 1,
-0.6874138, 0.7943473, 0.292644, 1, 1, 1, 1, 1,
-0.6759387, -0.04682033, -1.24588, 1, 1, 1, 1, 1,
-0.6743589, 2.388394, 1.371957, 1, 1, 1, 1, 1,
-0.6712438, -0.9792785, -0.5028924, 1, 1, 1, 1, 1,
-0.6655008, 0.04426728, 1.206602, 0, 0, 1, 1, 1,
-0.6577327, -0.05265353, -1.678832, 1, 0, 0, 1, 1,
-0.6549536, -1.22592, -3.007402, 1, 0, 0, 1, 1,
-0.6545483, 0.0557658, -2.034042, 1, 0, 0, 1, 1,
-0.6502674, 0.9619699, 0.007448108, 1, 0, 0, 1, 1,
-0.6499314, -0.5368928, -2.542011, 1, 0, 0, 1, 1,
-0.6496029, -0.9792256, -1.744783, 0, 0, 0, 1, 1,
-0.6426839, -0.6582348, -2.613314, 0, 0, 0, 1, 1,
-0.6378961, -0.8063987, -0.9480854, 0, 0, 0, 1, 1,
-0.6342233, -0.9639624, -1.909256, 0, 0, 0, 1, 1,
-0.6303856, 1.005872, -0.6557567, 0, 0, 0, 1, 1,
-0.6290616, -1.969813, -2.862672, 0, 0, 0, 1, 1,
-0.6264027, 0.1925697, -1.57287, 0, 0, 0, 1, 1,
-0.6250005, -0.5086678, -1.923722, 1, 1, 1, 1, 1,
-0.624868, 1.64619, 0.5907995, 1, 1, 1, 1, 1,
-0.6218399, 2.304535, -0.276403, 1, 1, 1, 1, 1,
-0.6210276, -0.2031201, -1.336547, 1, 1, 1, 1, 1,
-0.6186349, -1.79339, -1.993639, 1, 1, 1, 1, 1,
-0.6127462, -1.008845, -0.1624724, 1, 1, 1, 1, 1,
-0.6124887, 0.08578969, -2.601329, 1, 1, 1, 1, 1,
-0.6111005, 0.5748585, -1.080909, 1, 1, 1, 1, 1,
-0.6100839, 0.7822606, -2.238052, 1, 1, 1, 1, 1,
-0.6079026, 1.332136, -1.118247, 1, 1, 1, 1, 1,
-0.6058887, -0.8520029, -4.111067, 1, 1, 1, 1, 1,
-0.6048775, -1.76748, -2.461373, 1, 1, 1, 1, 1,
-0.6007947, 0.009196389, -3.064797, 1, 1, 1, 1, 1,
-0.6004938, -0.01685769, 0.6127968, 1, 1, 1, 1, 1,
-0.5995495, 2.787989, -1.523746, 1, 1, 1, 1, 1,
-0.5969362, 0.5859057, -1.092278, 0, 0, 1, 1, 1,
-0.5967385, 0.935452, -0.5191937, 1, 0, 0, 1, 1,
-0.5901356, 0.948446, 0.4003898, 1, 0, 0, 1, 1,
-0.5893635, -0.190841, -1.46998, 1, 0, 0, 1, 1,
-0.5802802, -0.6377074, -2.38144, 1, 0, 0, 1, 1,
-0.5789298, 0.9327466, 0.3898638, 1, 0, 0, 1, 1,
-0.5704429, 0.5666025, 0.1343762, 0, 0, 0, 1, 1,
-0.5698043, -1.567708, -1.341127, 0, 0, 0, 1, 1,
-0.5660283, 0.7170442, 0.313636, 0, 0, 0, 1, 1,
-0.5650383, 0.1741293, -1.075483, 0, 0, 0, 1, 1,
-0.5604627, 0.3750621, -1.737408, 0, 0, 0, 1, 1,
-0.5603372, -0.9843773, -2.15316, 0, 0, 0, 1, 1,
-0.5580571, 1.505099, -1.002032, 0, 0, 0, 1, 1,
-0.5546118, 0.3448126, 0.3039151, 1, 1, 1, 1, 1,
-0.5463369, 0.8623903, -1.593296, 1, 1, 1, 1, 1,
-0.5458764, 1.032465, 0.07740414, 1, 1, 1, 1, 1,
-0.5442293, -0.8124227, -2.524889, 1, 1, 1, 1, 1,
-0.5413994, -0.9907796, -2.312477, 1, 1, 1, 1, 1,
-0.5403589, 0.3479879, -1.922735, 1, 1, 1, 1, 1,
-0.5198677, -1.579104, -3.444469, 1, 1, 1, 1, 1,
-0.5146855, 1.011029, -0.8035191, 1, 1, 1, 1, 1,
-0.5144191, 1.532347, -1.556754, 1, 1, 1, 1, 1,
-0.5109423, 0.1665769, -2.084528, 1, 1, 1, 1, 1,
-0.509683, 2.312211, 1.707169, 1, 1, 1, 1, 1,
-0.5085681, -0.2578328, -2.97517, 1, 1, 1, 1, 1,
-0.5082473, -3.470527, -2.353983, 1, 1, 1, 1, 1,
-0.4994563, 0.2147582, -1.699574, 1, 1, 1, 1, 1,
-0.4991643, 1.53515, 0.3313788, 1, 1, 1, 1, 1,
-0.4964755, 0.675489, -1.291804, 0, 0, 1, 1, 1,
-0.4930761, 0.3217315, -1.806658, 1, 0, 0, 1, 1,
-0.4926418, 0.9392381, 0.6300378, 1, 0, 0, 1, 1,
-0.48838, 0.4314957, -0.7133371, 1, 0, 0, 1, 1,
-0.4860762, -1.293569, -3.72183, 1, 0, 0, 1, 1,
-0.4853228, -0.06958182, -0.9254823, 1, 0, 0, 1, 1,
-0.4778143, 0.1647372, -1.243444, 0, 0, 0, 1, 1,
-0.4754579, 0.7142889, -0.9017941, 0, 0, 0, 1, 1,
-0.4745481, -0.2151277, -2.107787, 0, 0, 0, 1, 1,
-0.4732906, 1.363449, 0.0009317826, 0, 0, 0, 1, 1,
-0.4700769, 1.216607, 0.3902748, 0, 0, 0, 1, 1,
-0.4682373, 0.07941399, -1.443798, 0, 0, 0, 1, 1,
-0.4669585, -0.7841027, -1.577303, 0, 0, 0, 1, 1,
-0.4610021, 1.379918, 0.8741745, 1, 1, 1, 1, 1,
-0.454917, 0.1769362, 0.2194178, 1, 1, 1, 1, 1,
-0.4547772, 0.9527675, 0.207225, 1, 1, 1, 1, 1,
-0.4542029, 0.8167136, 0.6066571, 1, 1, 1, 1, 1,
-0.4537398, 1.450108, 0.4642508, 1, 1, 1, 1, 1,
-0.451584, 0.8878314, -0.0131821, 1, 1, 1, 1, 1,
-0.4503498, -0.1706988, -2.710852, 1, 1, 1, 1, 1,
-0.4443684, 1.137962, 0.5884286, 1, 1, 1, 1, 1,
-0.4432048, -0.8433221, -1.703344, 1, 1, 1, 1, 1,
-0.4428948, 0.09373236, -1.230543, 1, 1, 1, 1, 1,
-0.4427642, 1.059505, 0.9096552, 1, 1, 1, 1, 1,
-0.4427609, 0.3463453, -0.6206138, 1, 1, 1, 1, 1,
-0.4394306, 1.50689, -0.8722059, 1, 1, 1, 1, 1,
-0.4334782, 0.3453836, -0.7752088, 1, 1, 1, 1, 1,
-0.4332002, 0.05435378, 0.1317646, 1, 1, 1, 1, 1,
-0.4317379, -1.107905, -3.676665, 0, 0, 1, 1, 1,
-0.430528, -0.02075435, -2.069386, 1, 0, 0, 1, 1,
-0.428312, 0.6045622, -1.207358, 1, 0, 0, 1, 1,
-0.4280502, -1.919885, -3.064714, 1, 0, 0, 1, 1,
-0.4209003, 0.7559332, -1.814392, 1, 0, 0, 1, 1,
-0.4185699, 0.831899, -0.7034577, 1, 0, 0, 1, 1,
-0.4088828, 0.4786279, -0.4196635, 0, 0, 0, 1, 1,
-0.4060134, 1.949567, -1.111908, 0, 0, 0, 1, 1,
-0.4021572, -2.334044, -2.618126, 0, 0, 0, 1, 1,
-0.4009877, 0.3441961, -2.360296, 0, 0, 0, 1, 1,
-0.3977368, 1.33671, -0.6601089, 0, 0, 0, 1, 1,
-0.3957524, -0.5572013, -3.671794, 0, 0, 0, 1, 1,
-0.3953363, -2.64943, -2.355839, 0, 0, 0, 1, 1,
-0.3941137, -0.9797916, -2.167271, 1, 1, 1, 1, 1,
-0.3933092, -0.004366883, 1.435327, 1, 1, 1, 1, 1,
-0.3875619, 1.042392, -0.5306142, 1, 1, 1, 1, 1,
-0.385957, 1.163502, 0.8112617, 1, 1, 1, 1, 1,
-0.3858738, 0.4975584, -0.7885371, 1, 1, 1, 1, 1,
-0.3807614, 0.6461788, 0.105186, 1, 1, 1, 1, 1,
-0.377701, -0.02321007, -2.109272, 1, 1, 1, 1, 1,
-0.3734649, -0.2285606, -1.914504, 1, 1, 1, 1, 1,
-0.3725522, -0.3980428, -2.256571, 1, 1, 1, 1, 1,
-0.3644286, -0.8773611, -4.437502, 1, 1, 1, 1, 1,
-0.363103, 0.162901, -0.7611024, 1, 1, 1, 1, 1,
-0.3554846, -0.1966821, -2.385738, 1, 1, 1, 1, 1,
-0.3546143, -0.2631406, -3.86001, 1, 1, 1, 1, 1,
-0.3523436, -1.224206, -2.094674, 1, 1, 1, 1, 1,
-0.3515046, 0.4945222, 0.01697427, 1, 1, 1, 1, 1,
-0.3484916, -0.2312348, -0.8531822, 0, 0, 1, 1, 1,
-0.3443006, -0.8711886, -2.428346, 1, 0, 0, 1, 1,
-0.3426372, -1.242049, -1.488473, 1, 0, 0, 1, 1,
-0.3367686, 0.3981376, -0.9989408, 1, 0, 0, 1, 1,
-0.3307834, 0.9877695, 0.8534043, 1, 0, 0, 1, 1,
-0.3299654, -0.6698187, -1.507123, 1, 0, 0, 1, 1,
-0.3295176, 0.4548671, 0.7874188, 0, 0, 0, 1, 1,
-0.3263006, 0.5769364, -1.426313, 0, 0, 0, 1, 1,
-0.3229346, -0.9017361, -2.710168, 0, 0, 0, 1, 1,
-0.3196125, -0.2504233, -0.4210873, 0, 0, 0, 1, 1,
-0.3170263, -0.3876132, -1.355287, 0, 0, 0, 1, 1,
-0.3133238, -1.599336, -2.571222, 0, 0, 0, 1, 1,
-0.3110784, 1.040406, -1.691564, 0, 0, 0, 1, 1,
-0.306729, -1.10284, -1.48148, 1, 1, 1, 1, 1,
-0.3058413, -0.79275, -3.463926, 1, 1, 1, 1, 1,
-0.3021891, -0.9800622, -3.304054, 1, 1, 1, 1, 1,
-0.299482, 1.07856, 0.5119347, 1, 1, 1, 1, 1,
-0.2940157, 0.9064887, -2.386409, 1, 1, 1, 1, 1,
-0.2873172, 0.1290202, -0.5624203, 1, 1, 1, 1, 1,
-0.2870227, 0.5331535, -1.64606, 1, 1, 1, 1, 1,
-0.2847867, 1.069765, -0.7155501, 1, 1, 1, 1, 1,
-0.2794043, -1.122474, -1.704092, 1, 1, 1, 1, 1,
-0.2789837, -0.03804068, -2.211804, 1, 1, 1, 1, 1,
-0.2789215, 1.443766, -0.5156359, 1, 1, 1, 1, 1,
-0.2776107, -0.6831218, -1.587163, 1, 1, 1, 1, 1,
-0.2759897, -0.3564676, -2.522832, 1, 1, 1, 1, 1,
-0.2736171, 0.4401807, -1.518059, 1, 1, 1, 1, 1,
-0.2659197, 1.859307, -0.2907399, 1, 1, 1, 1, 1,
-0.2621171, -0.1263822, 0.1979588, 0, 0, 1, 1, 1,
-0.2607071, 3.324226, -0.4717418, 1, 0, 0, 1, 1,
-0.2606416, -0.5936975, -2.804599, 1, 0, 0, 1, 1,
-0.2558831, -0.9308988, -1.525969, 1, 0, 0, 1, 1,
-0.2497835, 1.461985, 0.8678477, 1, 0, 0, 1, 1,
-0.2494201, -1.53733, -5.240593, 1, 0, 0, 1, 1,
-0.2493255, -0.4671841, -1.569957, 0, 0, 0, 1, 1,
-0.247434, 0.1929911, -1.449583, 0, 0, 0, 1, 1,
-0.2426122, -0.6771047, -2.83161, 0, 0, 0, 1, 1,
-0.2410869, 0.2598943, 0.3791015, 0, 0, 0, 1, 1,
-0.2390092, -0.3459825, -3.792017, 0, 0, 0, 1, 1,
-0.2347038, -0.3651696, -1.348622, 0, 0, 0, 1, 1,
-0.2346857, 2.15183, -1.251365, 0, 0, 0, 1, 1,
-0.2303415, 2.077054, 1.405058, 1, 1, 1, 1, 1,
-0.2301192, -1.723951, -2.302731, 1, 1, 1, 1, 1,
-0.2284272, -0.9128518, -2.435355, 1, 1, 1, 1, 1,
-0.2283868, 1.520163, 0.0464164, 1, 1, 1, 1, 1,
-0.2273047, -0.3322605, -2.858264, 1, 1, 1, 1, 1,
-0.2267729, -0.1392723, -0.366147, 1, 1, 1, 1, 1,
-0.2205455, 1.949205, 0.7564283, 1, 1, 1, 1, 1,
-0.2193903, -0.3015221, -4.260695, 1, 1, 1, 1, 1,
-0.2071917, -0.4231031, -3.137972, 1, 1, 1, 1, 1,
-0.2047896, 1.730383, 0.3971123, 1, 1, 1, 1, 1,
-0.2041396, -0.5985234, -2.300731, 1, 1, 1, 1, 1,
-0.2001598, 1.297553, 0.06312943, 1, 1, 1, 1, 1,
-0.1990146, -2.440619, -3.037872, 1, 1, 1, 1, 1,
-0.1973257, 1.048567, 1.304369, 1, 1, 1, 1, 1,
-0.1966891, 0.5188193, -1.446724, 1, 1, 1, 1, 1,
-0.1957625, 0.7113983, 1.072888, 0, 0, 1, 1, 1,
-0.1915161, -0.6484783, -2.854195, 1, 0, 0, 1, 1,
-0.1826164, -0.6145865, -2.014271, 1, 0, 0, 1, 1,
-0.1817845, -0.5634529, -1.893368, 1, 0, 0, 1, 1,
-0.178083, -0.4710341, -3.945462, 1, 0, 0, 1, 1,
-0.1778222, 0.7982506, -0.5207051, 1, 0, 0, 1, 1,
-0.1755917, -0.8884239, -2.979624, 0, 0, 0, 1, 1,
-0.1731398, 1.903073, -0.5278834, 0, 0, 0, 1, 1,
-0.1725138, 0.7639055, 0.9035926, 0, 0, 0, 1, 1,
-0.1718953, -0.7078316, -3.785313, 0, 0, 0, 1, 1,
-0.1702046, -0.6181041, -2.439547, 0, 0, 0, 1, 1,
-0.1690663, 2.288882, 0.2498765, 0, 0, 0, 1, 1,
-0.1663404, -0.5616645, -3.657053, 0, 0, 0, 1, 1,
-0.1661829, -0.2463461, -3.140389, 1, 1, 1, 1, 1,
-0.1595087, -1.926376, -3.174447, 1, 1, 1, 1, 1,
-0.156533, -0.354012, -2.674906, 1, 1, 1, 1, 1,
-0.1475209, 1.131252, -0.8187159, 1, 1, 1, 1, 1,
-0.147024, 1.284195, 0.406829, 1, 1, 1, 1, 1,
-0.1453457, -1.0215, -2.863506, 1, 1, 1, 1, 1,
-0.1451202, 0.04762617, -1.102858, 1, 1, 1, 1, 1,
-0.1448001, 1.250866, 1.240817, 1, 1, 1, 1, 1,
-0.1445877, -0.7142799, -2.884793, 1, 1, 1, 1, 1,
-0.1443171, 0.6341422, 1.374213, 1, 1, 1, 1, 1,
-0.1437329, -2.072008, -2.016593, 1, 1, 1, 1, 1,
-0.1430685, -0.02917457, -2.085719, 1, 1, 1, 1, 1,
-0.1389391, -1.462568, -3.367468, 1, 1, 1, 1, 1,
-0.1381834, -0.6069487, -2.332997, 1, 1, 1, 1, 1,
-0.137907, -1.258557, -4.106952, 1, 1, 1, 1, 1,
-0.1340082, 1.533592, -0.5722758, 0, 0, 1, 1, 1,
-0.1332508, -0.4229474, -1.718062, 1, 0, 0, 1, 1,
-0.1307898, -0.5424401, -2.367002, 1, 0, 0, 1, 1,
-0.1307052, -1.000896, -2.419007, 1, 0, 0, 1, 1,
-0.1242449, -1.229332, -1.408866, 1, 0, 0, 1, 1,
-0.120951, 2.353155, 0.4417063, 1, 0, 0, 1, 1,
-0.1183163, 1.163539, 0.2629319, 0, 0, 0, 1, 1,
-0.11662, -1.40542, -3.634838, 0, 0, 0, 1, 1,
-0.1160102, 0.2792111, -1.11054, 0, 0, 0, 1, 1,
-0.1111527, -0.02457766, -1.571774, 0, 0, 0, 1, 1,
-0.1005628, -0.7060062, -2.868614, 0, 0, 0, 1, 1,
-0.09781241, 0.7183396, -0.5292668, 0, 0, 0, 1, 1,
-0.0947339, -1.062806, -2.172549, 0, 0, 0, 1, 1,
-0.09271925, 0.2934072, -1.312204, 1, 1, 1, 1, 1,
-0.09211976, -0.08889475, -0.262567, 1, 1, 1, 1, 1,
-0.08212176, 2.428062, 0.2804184, 1, 1, 1, 1, 1,
-0.07805701, -0.3475917, -1.924394, 1, 1, 1, 1, 1,
-0.07512591, -0.5645355, -1.362938, 1, 1, 1, 1, 1,
-0.07166856, -0.2345789, -2.971001, 1, 1, 1, 1, 1,
-0.07045551, -1.700247, -3.677486, 1, 1, 1, 1, 1,
-0.06569342, -0.5082044, -2.075643, 1, 1, 1, 1, 1,
-0.06253617, -0.3197557, -2.760582, 1, 1, 1, 1, 1,
-0.06140335, -1.451936, -3.86252, 1, 1, 1, 1, 1,
-0.06002881, 1.1699, -1.937882, 1, 1, 1, 1, 1,
-0.05527248, -2.017996, -3.711078, 1, 1, 1, 1, 1,
-0.05524524, -0.8268864, -2.732478, 1, 1, 1, 1, 1,
-0.05112482, 0.7636591, 0.492754, 1, 1, 1, 1, 1,
-0.04971819, 0.5405271, -1.083021, 1, 1, 1, 1, 1,
-0.04891745, -0.217109, -2.873376, 0, 0, 1, 1, 1,
-0.04575237, 0.0568597, -0.5705394, 1, 0, 0, 1, 1,
-0.04250221, -0.9565866, -1.702783, 1, 0, 0, 1, 1,
-0.04142535, -0.1681665, -1.416175, 1, 0, 0, 1, 1,
-0.03968306, 1.380097, 0.4301579, 1, 0, 0, 1, 1,
-0.03938521, 0.8060072, -0.2432027, 1, 0, 0, 1, 1,
-0.03658334, 1.30473, -0.2940105, 0, 0, 0, 1, 1,
-0.03328818, 0.1113729, 1.487404, 0, 0, 0, 1, 1,
-0.03290199, 0.160605, -0.1416086, 0, 0, 0, 1, 1,
-0.0302884, 1.91615, 1.170381, 0, 0, 0, 1, 1,
-0.02952741, -1.154886, -2.113613, 0, 0, 0, 1, 1,
-0.02813833, 0.1891794, -0.8882681, 0, 0, 0, 1, 1,
-0.02542771, -0.1377882, -2.50615, 0, 0, 0, 1, 1,
-0.02269203, 0.03586813, -0.9921741, 1, 1, 1, 1, 1,
-0.01711172, 0.203807, 1.070179, 1, 1, 1, 1, 1,
-0.01512198, -0.4344926, -3.362038, 1, 1, 1, 1, 1,
-0.01492923, -1.849156, -2.754121, 1, 1, 1, 1, 1,
-0.01360298, 0.165598, 0.9030532, 1, 1, 1, 1, 1,
-0.01285649, -0.2820041, -3.787857, 1, 1, 1, 1, 1,
-0.01247728, 1.072714, 0.9128538, 1, 1, 1, 1, 1,
-0.01179531, 0.2940239, -1.092031, 1, 1, 1, 1, 1,
-0.009790203, 1.032914, 1.962097, 1, 1, 1, 1, 1,
-0.008850643, 1.208247, -0.7900906, 1, 1, 1, 1, 1,
-0.008843275, 0.4086691, -0.7515695, 1, 1, 1, 1, 1,
-0.0078475, 1.305527, 0.8878966, 1, 1, 1, 1, 1,
0.00391532, 0.3520539, -0.6728815, 1, 1, 1, 1, 1,
0.004642812, 0.1187789, 1.286378, 1, 1, 1, 1, 1,
0.01166974, 1.448452, -0.1965142, 1, 1, 1, 1, 1,
0.01427356, -0.9749215, 3.260766, 0, 0, 1, 1, 1,
0.01752258, -0.261552, 2.960515, 1, 0, 0, 1, 1,
0.01978267, 0.6918195, 0.1220556, 1, 0, 0, 1, 1,
0.03200698, -0.2833251, 2.764232, 1, 0, 0, 1, 1,
0.03860417, -1.253076, 2.131017, 1, 0, 0, 1, 1,
0.0417692, 1.505185, -1.042404, 1, 0, 0, 1, 1,
0.04333271, -0.2837841, 3.502414, 0, 0, 0, 1, 1,
0.04483713, -1.325833, 3.258311, 0, 0, 0, 1, 1,
0.0542415, -0.9446258, 3.799878, 0, 0, 0, 1, 1,
0.05469046, -0.1237773, 3.845351, 0, 0, 0, 1, 1,
0.05707303, 0.4003451, 0.3169298, 0, 0, 0, 1, 1,
0.05712396, -1.3657, 2.918949, 0, 0, 0, 1, 1,
0.05904723, 0.8635996, -1.947406, 0, 0, 0, 1, 1,
0.06349387, -0.5080448, 3.548254, 1, 1, 1, 1, 1,
0.06562281, -0.04253159, 2.402403, 1, 1, 1, 1, 1,
0.06637426, -0.8218736, 3.007578, 1, 1, 1, 1, 1,
0.06681623, 0.4305285, 1.424618, 1, 1, 1, 1, 1,
0.07234993, -1.044271, 2.48851, 1, 1, 1, 1, 1,
0.075091, -1.842407, 3.190753, 1, 1, 1, 1, 1,
0.0792717, 0.8487216, 1.900625, 1, 1, 1, 1, 1,
0.08532017, -0.902988, 4.11102, 1, 1, 1, 1, 1,
0.08595499, 0.8429127, -0.6679389, 1, 1, 1, 1, 1,
0.08699171, -1.71815, 2.420951, 1, 1, 1, 1, 1,
0.08851211, -0.5630913, 4.949421, 1, 1, 1, 1, 1,
0.08859847, 1.702467, 1.038999, 1, 1, 1, 1, 1,
0.09817889, 0.1827634, 0.4476883, 1, 1, 1, 1, 1,
0.09902196, -0.5966128, 2.326657, 1, 1, 1, 1, 1,
0.1002431, 0.3169799, -0.9478038, 1, 1, 1, 1, 1,
0.100642, 0.4778461, -0.08098349, 0, 0, 1, 1, 1,
0.1010119, 0.4628884, 0.9210488, 1, 0, 0, 1, 1,
0.1020762, -0.2463957, 2.66627, 1, 0, 0, 1, 1,
0.103596, -0.8181213, 2.810713, 1, 0, 0, 1, 1,
0.1134277, 0.3350219, 0.9318479, 1, 0, 0, 1, 1,
0.1243871, -0.5224417, 2.404449, 1, 0, 0, 1, 1,
0.1259689, 1.462384, 0.3116504, 0, 0, 0, 1, 1,
0.1276962, -1.25413, 3.593069, 0, 0, 0, 1, 1,
0.1296029, 0.8909433, -0.4807701, 0, 0, 0, 1, 1,
0.13394, 0.7012145, -1.393818, 0, 0, 0, 1, 1,
0.134376, -0.1319856, 2.346639, 0, 0, 0, 1, 1,
0.135438, 0.9903686, -0.8766596, 0, 0, 0, 1, 1,
0.1397277, -1.376329, 3.541503, 0, 0, 0, 1, 1,
0.1428242, -0.42865, 3.327944, 1, 1, 1, 1, 1,
0.1432235, -0.2785478, 2.393811, 1, 1, 1, 1, 1,
0.146498, -1.081774, 4.423671, 1, 1, 1, 1, 1,
0.1504053, 0.40497, 1.223517, 1, 1, 1, 1, 1,
0.1528967, 0.3453352, 1.73352, 1, 1, 1, 1, 1,
0.154154, -0.4163004, 2.335007, 1, 1, 1, 1, 1,
0.1587043, -1.509189, 3.696646, 1, 1, 1, 1, 1,
0.1602399, -1.020187, 2.884808, 1, 1, 1, 1, 1,
0.1621107, 0.2001719, 3.280483, 1, 1, 1, 1, 1,
0.1684947, 0.7678137, 2.489373, 1, 1, 1, 1, 1,
0.1711054, 1.301149, -0.8216565, 1, 1, 1, 1, 1,
0.1748622, 0.7180969, -0.4043499, 1, 1, 1, 1, 1,
0.1755836, -0.6639919, 2.639699, 1, 1, 1, 1, 1,
0.1761775, -0.3693167, 3.715676, 1, 1, 1, 1, 1,
0.1805043, -0.1636401, 2.084694, 1, 1, 1, 1, 1,
0.1854709, -0.3240713, 3.327032, 0, 0, 1, 1, 1,
0.1867649, 0.2619592, -0.9841245, 1, 0, 0, 1, 1,
0.1879455, 0.10175, 0.3667243, 1, 0, 0, 1, 1,
0.1896401, 1.301681, -0.3768227, 1, 0, 0, 1, 1,
0.1914784, -0.7128004, 4.462344, 1, 0, 0, 1, 1,
0.1933964, -0.5335527, 1.471258, 1, 0, 0, 1, 1,
0.1990224, -0.472153, 1.864505, 0, 0, 0, 1, 1,
0.1995334, -0.5063161, 2.640941, 0, 0, 0, 1, 1,
0.2105772, 0.1461388, 1.159819, 0, 0, 0, 1, 1,
0.2161364, -0.02803154, 0.9694, 0, 0, 0, 1, 1,
0.2174186, -0.7190421, 2.368237, 0, 0, 0, 1, 1,
0.2195495, -0.6456341, 5.051163, 0, 0, 0, 1, 1,
0.2197362, 1.001261, -1.604493, 0, 0, 0, 1, 1,
0.2199361, -1.534385, 3.428416, 1, 1, 1, 1, 1,
0.2199743, -1.226784, 4.286869, 1, 1, 1, 1, 1,
0.2218663, -1.422998, 1.224452, 1, 1, 1, 1, 1,
0.2222306, 1.391306, 1.428983, 1, 1, 1, 1, 1,
0.2238105, 0.7542236, 0.1332079, 1, 1, 1, 1, 1,
0.2313333, 0.5271815, 1.042053, 1, 1, 1, 1, 1,
0.2326709, 0.7927163, 0.6556107, 1, 1, 1, 1, 1,
0.2353255, 0.6370825, 0.7830497, 1, 1, 1, 1, 1,
0.2361559, -0.7246944, 4.379561, 1, 1, 1, 1, 1,
0.2362093, 0.18681, 0.1761705, 1, 1, 1, 1, 1,
0.2411936, -0.2578196, 1.971481, 1, 1, 1, 1, 1,
0.2473825, -1.349143, 2.470173, 1, 1, 1, 1, 1,
0.254751, -0.9512069, 2.137558, 1, 1, 1, 1, 1,
0.2581348, -1.004039, 1.705305, 1, 1, 1, 1, 1,
0.2606142, -1.468865, 0.8886239, 1, 1, 1, 1, 1,
0.2629126, -0.3769359, 2.763658, 0, 0, 1, 1, 1,
0.2636261, 0.6796072, -1.433969, 1, 0, 0, 1, 1,
0.2642646, -2.018508, 4.080495, 1, 0, 0, 1, 1,
0.265207, 1.170577, -0.1915706, 1, 0, 0, 1, 1,
0.2665662, -1.602435, 2.497445, 1, 0, 0, 1, 1,
0.2688993, -0.6524516, 1.633658, 1, 0, 0, 1, 1,
0.2690124, -0.2308781, 0.7919714, 0, 0, 0, 1, 1,
0.273541, -0.428573, 4.239648, 0, 0, 0, 1, 1,
0.2812515, -0.1857107, 1.208746, 0, 0, 0, 1, 1,
0.2837467, -0.8130046, 3.21115, 0, 0, 0, 1, 1,
0.2860575, 2.088657, -0.7569324, 0, 0, 0, 1, 1,
0.287044, -0.376954, 1.568773, 0, 0, 0, 1, 1,
0.2872906, -0.2913166, 2.637368, 0, 0, 0, 1, 1,
0.2874223, -0.6814004, 2.774489, 1, 1, 1, 1, 1,
0.2918757, 1.388017, -1.030108, 1, 1, 1, 1, 1,
0.2953539, 1.943713, 0.07616181, 1, 1, 1, 1, 1,
0.3007411, 1.403928, -1.36602, 1, 1, 1, 1, 1,
0.3011822, 0.1801523, -1.018704, 1, 1, 1, 1, 1,
0.3018094, -1.403486, 4.231021, 1, 1, 1, 1, 1,
0.3090321, -1.963176, 3.584635, 1, 1, 1, 1, 1,
0.3094199, 0.4883324, 1.76433, 1, 1, 1, 1, 1,
0.3132739, -0.3167589, 2.915398, 1, 1, 1, 1, 1,
0.3144142, -0.2766582, -1.207075, 1, 1, 1, 1, 1,
0.3145163, 0.3373527, 1.816397, 1, 1, 1, 1, 1,
0.3223547, 0.4800961, 1.248703, 1, 1, 1, 1, 1,
0.3235636, -0.6859799, 2.575708, 1, 1, 1, 1, 1,
0.3264717, -1.293248, 1.453023, 1, 1, 1, 1, 1,
0.3305305, -1.453036, 4.925561, 1, 1, 1, 1, 1,
0.3306788, 0.06851569, 1.423664, 0, 0, 1, 1, 1,
0.3428182, 0.921095, 1.338374, 1, 0, 0, 1, 1,
0.3451987, 0.7070202, 0.8211952, 1, 0, 0, 1, 1,
0.3486903, 0.01835063, 1.07342, 1, 0, 0, 1, 1,
0.3504039, -0.134093, 3.502813, 1, 0, 0, 1, 1,
0.355177, -0.9728518, 3.562044, 1, 0, 0, 1, 1,
0.3561453, 0.1342535, 0.3021671, 0, 0, 0, 1, 1,
0.3583642, -1.055942, 2.131535, 0, 0, 0, 1, 1,
0.359985, 1.61062, 1.099426, 0, 0, 0, 1, 1,
0.3702705, -1.781663, 3.500005, 0, 0, 0, 1, 1,
0.3712848, 1.302063, 0.7373794, 0, 0, 0, 1, 1,
0.3733526, -0.3816661, 1.712369, 0, 0, 0, 1, 1,
0.3763876, 0.2786843, 1.175007, 0, 0, 0, 1, 1,
0.379696, -0.5862728, 1.459092, 1, 1, 1, 1, 1,
0.3805109, 1.602402, 1.785275, 1, 1, 1, 1, 1,
0.3840522, 0.5908321, 1.545539, 1, 1, 1, 1, 1,
0.3855171, -0.1038561, 1.476268, 1, 1, 1, 1, 1,
0.3908418, -0.4020918, 1.612726, 1, 1, 1, 1, 1,
0.3945347, -1.59838, 1.933563, 1, 1, 1, 1, 1,
0.3946551, 1.480974, -0.6435795, 1, 1, 1, 1, 1,
0.3954846, 0.5675803, 3.028578, 1, 1, 1, 1, 1,
0.3958999, 0.9795759, 0.03658827, 1, 1, 1, 1, 1,
0.3960734, -0.1560424, 1.882812, 1, 1, 1, 1, 1,
0.3964998, 0.6998833, -0.07700472, 1, 1, 1, 1, 1,
0.3991603, -0.4441715, 3.203346, 1, 1, 1, 1, 1,
0.3994646, -2.187648, 3.143334, 1, 1, 1, 1, 1,
0.4000841, 0.3735729, 1.154242, 1, 1, 1, 1, 1,
0.4001259, 0.6999024, 0.6514046, 1, 1, 1, 1, 1,
0.4017061, -0.7460542, 1.723141, 0, 0, 1, 1, 1,
0.4065345, -0.5084785, 2.97657, 1, 0, 0, 1, 1,
0.4067044, -0.4325892, 3.563744, 1, 0, 0, 1, 1,
0.4086697, 1.102385, 0.6738405, 1, 0, 0, 1, 1,
0.4101045, -0.9199079, 1.441529, 1, 0, 0, 1, 1,
0.4106324, 0.5035928, 0.8767979, 1, 0, 0, 1, 1,
0.4119757, 0.4591677, -0.02569174, 0, 0, 0, 1, 1,
0.4205874, 1.384663, -1.218731, 0, 0, 0, 1, 1,
0.4213622, 0.3161254, 1.914413, 0, 0, 0, 1, 1,
0.422759, 1.023705, 0.6722164, 0, 0, 0, 1, 1,
0.4243272, 0.02004189, 2.662464, 0, 0, 0, 1, 1,
0.4268376, 0.6482007, 0.03648471, 0, 0, 0, 1, 1,
0.4324744, -0.6142818, 3.736096, 0, 0, 0, 1, 1,
0.435842, -0.2553581, 1.30288, 1, 1, 1, 1, 1,
0.441498, -1.599467, 2.109544, 1, 1, 1, 1, 1,
0.4446407, -0.4380363, 2.22476, 1, 1, 1, 1, 1,
0.4478194, 1.455699, 0.1889038, 1, 1, 1, 1, 1,
0.4483956, 1.702481, 0.3757713, 1, 1, 1, 1, 1,
0.4536103, 0.7757404, 1.193039, 1, 1, 1, 1, 1,
0.4566515, -0.3439421, 3.652975, 1, 1, 1, 1, 1,
0.463539, 1.99317, -0.972909, 1, 1, 1, 1, 1,
0.4640463, -0.7023675, 1.80946, 1, 1, 1, 1, 1,
0.4657071, 1.26618, 0.703468, 1, 1, 1, 1, 1,
0.4664559, 0.668161, 1.378213, 1, 1, 1, 1, 1,
0.4664876, -0.7815041, 3.546388, 1, 1, 1, 1, 1,
0.4673646, -0.4203516, 1.506333, 1, 1, 1, 1, 1,
0.4694363, 0.1433508, 1.577857, 1, 1, 1, 1, 1,
0.4705262, -0.5427587, 2.994254, 1, 1, 1, 1, 1,
0.4787684, -0.2957075, 1.161636, 0, 0, 1, 1, 1,
0.4800167, 0.01032959, 2.668452, 1, 0, 0, 1, 1,
0.4802181, 0.2762101, 0.8290736, 1, 0, 0, 1, 1,
0.48964, -1.80954, 2.226154, 1, 0, 0, 1, 1,
0.4928543, 0.5696851, -0.6103501, 1, 0, 0, 1, 1,
0.4952802, 1.435048, -0.5176949, 1, 0, 0, 1, 1,
0.4958926, 0.7051256, 0.310054, 0, 0, 0, 1, 1,
0.4984572, 0.7923043, 0.1918982, 0, 0, 0, 1, 1,
0.5069507, 0.6949752, 1.193544, 0, 0, 0, 1, 1,
0.5072386, 0.4592049, 1.684778, 0, 0, 0, 1, 1,
0.5088137, -0.1194549, 2.111953, 0, 0, 0, 1, 1,
0.5148667, 0.5565359, 0.22011, 0, 0, 0, 1, 1,
0.5191919, 1.057625, 0.6495857, 0, 0, 0, 1, 1,
0.5203679, 1.053366, 1.733264, 1, 1, 1, 1, 1,
0.5213761, -0.9350826, 2.376406, 1, 1, 1, 1, 1,
0.5229459, -0.6870425, 0.9254, 1, 1, 1, 1, 1,
0.5233617, -1.400401, 2.784235, 1, 1, 1, 1, 1,
0.5291768, 0.5928212, 0.8787841, 1, 1, 1, 1, 1,
0.5320665, -0.2097295, 3.110734, 1, 1, 1, 1, 1,
0.5400355, 0.508291, 1.810567, 1, 1, 1, 1, 1,
0.5444326, 2.011059, 1.048342, 1, 1, 1, 1, 1,
0.547935, -0.2495932, 2.158922, 1, 1, 1, 1, 1,
0.5507917, -0.5555338, 2.893272, 1, 1, 1, 1, 1,
0.5513196, 4.008062, -0.2763183, 1, 1, 1, 1, 1,
0.5526606, -0.3700882, 3.716737, 1, 1, 1, 1, 1,
0.5553134, -0.8818116, 1.524281, 1, 1, 1, 1, 1,
0.5584493, 1.603697, 2.671725, 1, 1, 1, 1, 1,
0.5605209, -0.7291673, 2.120907, 1, 1, 1, 1, 1,
0.5634133, -0.7072203, 2.977122, 0, 0, 1, 1, 1,
0.5645126, 0.708528, 0.8912488, 1, 0, 0, 1, 1,
0.5665612, 0.8823522, 0.7128754, 1, 0, 0, 1, 1,
0.571301, -0.1250955, 1.758024, 1, 0, 0, 1, 1,
0.5829037, -0.308553, 2.914304, 1, 0, 0, 1, 1,
0.5834687, 1.165738, 0.7643226, 1, 0, 0, 1, 1,
0.5931493, -0.7050827, 1.078326, 0, 0, 0, 1, 1,
0.5966392, -1.51986, 2.918646, 0, 0, 0, 1, 1,
0.5982178, -1.195997, 2.959227, 0, 0, 0, 1, 1,
0.6006318, 0.6441249, 0.710669, 0, 0, 0, 1, 1,
0.606539, -1.906086, 2.439332, 0, 0, 0, 1, 1,
0.6072665, 0.4387726, 1.742281, 0, 0, 0, 1, 1,
0.6154911, -0.07081465, 2.357874, 0, 0, 0, 1, 1,
0.6179386, -0.2481159, 3.988503, 1, 1, 1, 1, 1,
0.6191905, 0.7585005, 0.6483974, 1, 1, 1, 1, 1,
0.6208037, -0.4320457, 1.645886, 1, 1, 1, 1, 1,
0.6226174, 0.08258542, 3.329278, 1, 1, 1, 1, 1,
0.6236159, -0.2784258, 4.301388, 1, 1, 1, 1, 1,
0.6257204, 1.143727, -1.178674, 1, 1, 1, 1, 1,
0.6272765, -1.381886, 2.514637, 1, 1, 1, 1, 1,
0.6297365, 1.324546, -0.3379992, 1, 1, 1, 1, 1,
0.6302606, -0.6822201, 2.697036, 1, 1, 1, 1, 1,
0.6378992, -0.1393832, 0.6909723, 1, 1, 1, 1, 1,
0.6386292, 2.588698, 1.303994, 1, 1, 1, 1, 1,
0.638877, -0.3797981, 1.21523, 1, 1, 1, 1, 1,
0.6452755, -0.9387239, 1.852375, 1, 1, 1, 1, 1,
0.6479882, -0.04528036, 1.342438, 1, 1, 1, 1, 1,
0.6509356, -1.479605, 2.143523, 1, 1, 1, 1, 1,
0.6519269, 2.397281, -0.8621674, 0, 0, 1, 1, 1,
0.6526931, -0.4264485, 2.176193, 1, 0, 0, 1, 1,
0.6530216, -0.9796414, 2.024866, 1, 0, 0, 1, 1,
0.6533657, -1.131378, 1.137069, 1, 0, 0, 1, 1,
0.6599385, -1.51183, 3.863957, 1, 0, 0, 1, 1,
0.6640602, -0.7744735, 2.177262, 1, 0, 0, 1, 1,
0.6650157, -0.2122807, 3.610769, 0, 0, 0, 1, 1,
0.6709835, -0.374516, 1.569328, 0, 0, 0, 1, 1,
0.6715202, 0.9751476, 1.897624, 0, 0, 0, 1, 1,
0.6729682, -0.6052987, 0.701518, 0, 0, 0, 1, 1,
0.6808332, -0.9149023, 1.763625, 0, 0, 0, 1, 1,
0.6819723, 0.1230261, 1.572797, 0, 0, 0, 1, 1,
0.6837438, 0.3829643, 1.936885, 0, 0, 0, 1, 1,
0.6854283, -0.3850477, 1.864473, 1, 1, 1, 1, 1,
0.6856331, -1.330453, 3.373701, 1, 1, 1, 1, 1,
0.6891822, -0.3649117, 0.778924, 1, 1, 1, 1, 1,
0.6908422, 1.930384, -0.1358688, 1, 1, 1, 1, 1,
0.691484, -0.1104799, 2.478111, 1, 1, 1, 1, 1,
0.6924776, -0.1620668, 0.90681, 1, 1, 1, 1, 1,
0.702712, 0.4043331, 0.505776, 1, 1, 1, 1, 1,
0.7030238, 0.5965977, 2.719319, 1, 1, 1, 1, 1,
0.7109703, -0.1209608, 2.234206, 1, 1, 1, 1, 1,
0.7143129, 1.017763, 0.4119612, 1, 1, 1, 1, 1,
0.7156315, -0.8604954, 1.382935, 1, 1, 1, 1, 1,
0.7166704, -0.05966467, 1.562911, 1, 1, 1, 1, 1,
0.7175701, 0.08286674, 0.9764351, 1, 1, 1, 1, 1,
0.7181216, 0.2255272, 2.523323, 1, 1, 1, 1, 1,
0.7222862, -0.8268569, 1.365012, 1, 1, 1, 1, 1,
0.7234685, 0.2261453, 3.08797, 0, 0, 1, 1, 1,
0.7275072, -0.498069, 3.813893, 1, 0, 0, 1, 1,
0.7294309, 0.3553086, 0.4696166, 1, 0, 0, 1, 1,
0.7330139, -1.874361, 4.109473, 1, 0, 0, 1, 1,
0.7331478, -0.7212467, 2.38922, 1, 0, 0, 1, 1,
0.7384881, -1.168626, 3.036757, 1, 0, 0, 1, 1,
0.7443085, -0.8390903, 2.749459, 0, 0, 0, 1, 1,
0.7444829, 0.8343179, 0.2835952, 0, 0, 0, 1, 1,
0.7458671, -0.3443257, 3.767515, 0, 0, 0, 1, 1,
0.7462489, 0.1579871, 1.320263, 0, 0, 0, 1, 1,
0.747767, -1.478356, 2.57106, 0, 0, 0, 1, 1,
0.7559269, -0.1089428, 2.081612, 0, 0, 0, 1, 1,
0.7592093, -1.73257, 2.018665, 0, 0, 0, 1, 1,
0.7604693, -0.4215231, 2.09726, 1, 1, 1, 1, 1,
0.7655504, 0.2030264, 0.7490798, 1, 1, 1, 1, 1,
0.7674221, -1.438475, 0.8504618, 1, 1, 1, 1, 1,
0.7709672, -0.2854483, 0.7502004, 1, 1, 1, 1, 1,
0.7710895, -1.058829, 3.931515, 1, 1, 1, 1, 1,
0.7827302, 1.623759, 1.119673, 1, 1, 1, 1, 1,
0.7859595, 0.1014778, 2.29599, 1, 1, 1, 1, 1,
0.7966942, 0.4860054, -0.8645501, 1, 1, 1, 1, 1,
0.8069344, 0.4913809, 1.157213, 1, 1, 1, 1, 1,
0.8084975, 0.7079465, -0.9207287, 1, 1, 1, 1, 1,
0.8096362, -0.5044038, 2.468796, 1, 1, 1, 1, 1,
0.8106484, 0.6624147, 3.063231, 1, 1, 1, 1, 1,
0.8145261, 0.1432108, 0.9850085, 1, 1, 1, 1, 1,
0.8164955, -2.438254, 2.377852, 1, 1, 1, 1, 1,
0.8206065, -0.5137429, 2.880657, 1, 1, 1, 1, 1,
0.8213007, 0.6469567, 0.6446931, 0, 0, 1, 1, 1,
0.8223094, 2.146165, 0.1457339, 1, 0, 0, 1, 1,
0.8374841, 0.2299355, 1.90033, 1, 0, 0, 1, 1,
0.8429548, 1.556685, 0.9871637, 1, 0, 0, 1, 1,
0.8441032, -0.418169, 2.142514, 1, 0, 0, 1, 1,
0.8499812, 0.5217944, 1.866117, 1, 0, 0, 1, 1,
0.85171, -1.00789, 1.761383, 0, 0, 0, 1, 1,
0.8574623, 0.1016952, 2.619883, 0, 0, 0, 1, 1,
0.8678052, -1.411161, 1.406541, 0, 0, 0, 1, 1,
0.8716616, -0.7814602, 2.526237, 0, 0, 0, 1, 1,
0.8719075, -0.809423, 0.6842252, 0, 0, 0, 1, 1,
0.8764853, 0.6885331, 1.052248, 0, 0, 0, 1, 1,
0.8802342, -0.2885034, 2.501236, 0, 0, 0, 1, 1,
0.8844095, -0.9890277, 2.654001, 1, 1, 1, 1, 1,
0.8875128, 0.9555488, 1.2183, 1, 1, 1, 1, 1,
0.888047, -0.5409117, 3.331928, 1, 1, 1, 1, 1,
0.8893664, 0.1319758, 1.064028, 1, 1, 1, 1, 1,
0.8926808, 0.6242538, -0.09290914, 1, 1, 1, 1, 1,
0.9024057, 1.487553, -1.085386, 1, 1, 1, 1, 1,
0.9094232, 0.5829539, -1.05906, 1, 1, 1, 1, 1,
0.9098176, 1.588793, 0.6740709, 1, 1, 1, 1, 1,
0.9127792, 0.0358335, 0.972694, 1, 1, 1, 1, 1,
0.9155895, -0.3106754, 2.490519, 1, 1, 1, 1, 1,
0.920654, 0.3415532, 1.088929, 1, 1, 1, 1, 1,
0.9249194, -0.6890821, 2.531878, 1, 1, 1, 1, 1,
0.9253263, -0.03857071, 2.790802, 1, 1, 1, 1, 1,
0.9257076, -2.300259, 4.215856, 1, 1, 1, 1, 1,
0.9270617, -0.07154188, 0.2422133, 1, 1, 1, 1, 1,
0.9336942, 0.5209243, 2.621361, 0, 0, 1, 1, 1,
0.9356154, 1.198686, 1.938827, 1, 0, 0, 1, 1,
0.9400288, -0.3137264, 1.552203, 1, 0, 0, 1, 1,
0.9444163, 0.4168526, -0.3305194, 1, 0, 0, 1, 1,
0.9483926, 1.050745, -0.456137, 1, 0, 0, 1, 1,
0.9534698, -0.1153611, 2.917006, 1, 0, 0, 1, 1,
0.9545932, 0.1894332, 1.789018, 0, 0, 0, 1, 1,
0.9566246, 0.9461207, 0.02068713, 0, 0, 0, 1, 1,
0.9598562, 1.075339, -1.228924, 0, 0, 0, 1, 1,
0.972455, -0.4147523, 0.6860955, 0, 0, 0, 1, 1,
0.9743795, -0.5406615, 2.689723, 0, 0, 0, 1, 1,
0.9760194, 0.2103277, -0.5560462, 0, 0, 0, 1, 1,
0.9760905, 0.469259, 1.385932, 0, 0, 0, 1, 1,
0.9760908, 1.52125, 1.645703, 1, 1, 1, 1, 1,
0.9766662, -0.1902792, 2.273593, 1, 1, 1, 1, 1,
0.9771788, 0.4032936, 0.6543385, 1, 1, 1, 1, 1,
0.9785967, -0.9721169, -0.2410677, 1, 1, 1, 1, 1,
0.9807636, 1.153822, -1.098347, 1, 1, 1, 1, 1,
0.9824516, 0.04713116, 0.7602673, 1, 1, 1, 1, 1,
0.9843193, 1.517767, 2.235402, 1, 1, 1, 1, 1,
0.9909338, -0.5258036, 3.173428, 1, 1, 1, 1, 1,
0.992573, 1.959622, 0.7481211, 1, 1, 1, 1, 1,
0.9926083, -0.0061764, 2.515976, 1, 1, 1, 1, 1,
1.001749, -0.1681711, 2.121809, 1, 1, 1, 1, 1,
1.008682, 1.219146, 1.496343, 1, 1, 1, 1, 1,
1.009835, -0.7784839, 2.862697, 1, 1, 1, 1, 1,
1.017647, 0.9089055, 0.8994835, 1, 1, 1, 1, 1,
1.019071, 1.72128, 2.645968, 1, 1, 1, 1, 1,
1.029881, -2.094413, 2.922272, 0, 0, 1, 1, 1,
1.035875, 0.7132908, 0.416589, 1, 0, 0, 1, 1,
1.037943, -1.327287, 3.416075, 1, 0, 0, 1, 1,
1.042361, -0.1508676, 1.264561, 1, 0, 0, 1, 1,
1.044972, -0.652151, 0.4112896, 1, 0, 0, 1, 1,
1.047564, -2.674606, 4.276469, 1, 0, 0, 1, 1,
1.047809, -0.6109238, 1.813154, 0, 0, 0, 1, 1,
1.051264, 0.03761707, 2.251233, 0, 0, 0, 1, 1,
1.052267, 0.417331, 0.1752941, 0, 0, 0, 1, 1,
1.061863, -1.285026, 2.88229, 0, 0, 0, 1, 1,
1.063654, -0.002292075, 2.889684, 0, 0, 0, 1, 1,
1.08224, 0.8327472, -0.3232976, 0, 0, 0, 1, 1,
1.087396, -0.2841038, 1.170876, 0, 0, 0, 1, 1,
1.091187, -0.8246062, 2.152653, 1, 1, 1, 1, 1,
1.094543, -0.2384305, 1.686924, 1, 1, 1, 1, 1,
1.099146, -0.299315, 1.262506, 1, 1, 1, 1, 1,
1.106188, -1.11943, 1.610486, 1, 1, 1, 1, 1,
1.115274, -1.294039, 2.123106, 1, 1, 1, 1, 1,
1.120963, 0.4140065, 0.3702347, 1, 1, 1, 1, 1,
1.122156, 0.01500969, -0.04244071, 1, 1, 1, 1, 1,
1.123952, 1.350172, 1.993236, 1, 1, 1, 1, 1,
1.12736, 0.6105335, 0.6529601, 1, 1, 1, 1, 1,
1.138486, -0.9527206, 2.411441, 1, 1, 1, 1, 1,
1.141609, -1.022772, 2.667033, 1, 1, 1, 1, 1,
1.142552, 0.3821956, 1.85926, 1, 1, 1, 1, 1,
1.146876, -0.1374864, 1.088222, 1, 1, 1, 1, 1,
1.146907, 0.6857297, 2.559962, 1, 1, 1, 1, 1,
1.148293, -1.548296, 3.589059, 1, 1, 1, 1, 1,
1.151506, 0.4593664, 1.218178, 0, 0, 1, 1, 1,
1.157746, 0.9076672, 0.7931743, 1, 0, 0, 1, 1,
1.164916, 0.8571073, 0.6236842, 1, 0, 0, 1, 1,
1.171195, -1.597788, 2.631648, 1, 0, 0, 1, 1,
1.172994, -0.1109056, 3.825227, 1, 0, 0, 1, 1,
1.175224, 0.01076179, 0.5170192, 1, 0, 0, 1, 1,
1.177263, -0.7653545, 0.9849794, 0, 0, 0, 1, 1,
1.178016, 0.7599061, -0.6900231, 0, 0, 0, 1, 1,
1.17923, 0.2535147, 0.5152475, 0, 0, 0, 1, 1,
1.19443, -0.3047353, 2.587933, 0, 0, 0, 1, 1,
1.197217, 0.731426, 0.7447829, 0, 0, 0, 1, 1,
1.197639, 0.7163895, 0.816757, 0, 0, 0, 1, 1,
1.204428, -1.254455, 2.830774, 0, 0, 0, 1, 1,
1.212608, 2.131149, -0.7522258, 1, 1, 1, 1, 1,
1.213601, -1.413185, 2.154822, 1, 1, 1, 1, 1,
1.215803, -0.4975334, 0.3903382, 1, 1, 1, 1, 1,
1.226139, 0.7912582, 3.154212, 1, 1, 1, 1, 1,
1.226359, -0.548354, 2.761817, 1, 1, 1, 1, 1,
1.226723, -0.3593872, 1.818916, 1, 1, 1, 1, 1,
1.227396, -0.2719685, 0.8810566, 1, 1, 1, 1, 1,
1.22865, 1.817249, 0.6128873, 1, 1, 1, 1, 1,
1.242319, -2.176732, 2.764659, 1, 1, 1, 1, 1,
1.244457, 1.153364, 1.048696, 1, 1, 1, 1, 1,
1.249774, -1.134708, 1.6629, 1, 1, 1, 1, 1,
1.251342, -0.2078889, 0.05594919, 1, 1, 1, 1, 1,
1.253065, 1.200347, 2.12378, 1, 1, 1, 1, 1,
1.262965, 1.362128, -0.3425083, 1, 1, 1, 1, 1,
1.265591, 1.008832, -0.07828255, 1, 1, 1, 1, 1,
1.272836, 0.4518351, 1.766876, 0, 0, 1, 1, 1,
1.273489, -1.145796, 2.997275, 1, 0, 0, 1, 1,
1.28128, -1.512889, 2.818376, 1, 0, 0, 1, 1,
1.283045, 1.345843, -1.574726, 1, 0, 0, 1, 1,
1.287146, 0.708818, 0.1811592, 1, 0, 0, 1, 1,
1.29047, 0.8602858, -0.7891791, 1, 0, 0, 1, 1,
1.291012, 0.6496667, 0.9819435, 0, 0, 0, 1, 1,
1.294171, -0.1191001, 3.303336, 0, 0, 0, 1, 1,
1.301952, -0.6609374, 2.60615, 0, 0, 0, 1, 1,
1.303218, -0.2029574, 1.104298, 0, 0, 0, 1, 1,
1.315553, 1.046225, 0.8246149, 0, 0, 0, 1, 1,
1.319184, -0.610918, 1.026006, 0, 0, 0, 1, 1,
1.321167, 0.5941246, 0.2825654, 0, 0, 0, 1, 1,
1.322539, 0.197343, 0.9654261, 1, 1, 1, 1, 1,
1.325309, 0.8814484, 1.248157, 1, 1, 1, 1, 1,
1.331558, -0.342181, 3.329866, 1, 1, 1, 1, 1,
1.33252, 0.5210038, 0.6454414, 1, 1, 1, 1, 1,
1.341987, -0.5993667, 1.269054, 1, 1, 1, 1, 1,
1.347778, -0.06800988, 1.070543, 1, 1, 1, 1, 1,
1.35105, 0.1056887, 2.377764, 1, 1, 1, 1, 1,
1.360141, -0.1710474, 0.6149269, 1, 1, 1, 1, 1,
1.375972, 1.911276, 1.218732, 1, 1, 1, 1, 1,
1.377187, -0.4935544, 0.9227681, 1, 1, 1, 1, 1,
1.386837, 0.2449248, 0.4955211, 1, 1, 1, 1, 1,
1.388308, -1.000932, 4.196526, 1, 1, 1, 1, 1,
1.388684, -1.209586, 2.34145, 1, 1, 1, 1, 1,
1.396784, 0.6512755, -0.1073349, 1, 1, 1, 1, 1,
1.404772, -0.8680619, 2.999778, 1, 1, 1, 1, 1,
1.42401, -0.9392833, 0.8893889, 0, 0, 1, 1, 1,
1.425854, -1.474828, 2.450451, 1, 0, 0, 1, 1,
1.427339, 0.2276169, 3.168977, 1, 0, 0, 1, 1,
1.431794, -0.7499216, 1.882377, 1, 0, 0, 1, 1,
1.440609, -0.5062703, 1.859859, 1, 0, 0, 1, 1,
1.442904, 0.6835461, 0.9237332, 1, 0, 0, 1, 1,
1.457789, -2.620244, 0.3673287, 0, 0, 0, 1, 1,
1.475161, -1.058959, 1.354871, 0, 0, 0, 1, 1,
1.483938, -0.1632348, -0.1093524, 0, 0, 0, 1, 1,
1.484967, 0.0585002, 1.665603, 0, 0, 0, 1, 1,
1.489795, -0.2597259, 2.184645, 0, 0, 0, 1, 1,
1.493534, 1.134148, 0.1906171, 0, 0, 0, 1, 1,
1.499952, -1.434335, 1.907444, 0, 0, 0, 1, 1,
1.506618, -1.239358, 2.126869, 1, 1, 1, 1, 1,
1.514313, 1.045332, 0.1854582, 1, 1, 1, 1, 1,
1.516935, 2.021285, 1.80099, 1, 1, 1, 1, 1,
1.518881, 0.8555133, 0.4762754, 1, 1, 1, 1, 1,
1.529055, 1.765279, 0.8869374, 1, 1, 1, 1, 1,
1.532488, -1.106895, 4.98573, 1, 1, 1, 1, 1,
1.532599, 1.068722, 1.652261, 1, 1, 1, 1, 1,
1.538541, 0.1032171, 2.49466, 1, 1, 1, 1, 1,
1.554635, -1.929745, 2.022625, 1, 1, 1, 1, 1,
1.570081, 1.928152, 1.650153, 1, 1, 1, 1, 1,
1.575776, -0.5811784, 0.6488246, 1, 1, 1, 1, 1,
1.577435, 0.5147224, 1.07984, 1, 1, 1, 1, 1,
1.583469, 1.22727, -0.4250054, 1, 1, 1, 1, 1,
1.58844, -0.9981158, 2.173167, 1, 1, 1, 1, 1,
1.591059, 0.1897154, 0.405882, 1, 1, 1, 1, 1,
1.591512, -0.4190079, 3.178368, 0, 0, 1, 1, 1,
1.604856, 0.8536111, 0.7143511, 1, 0, 0, 1, 1,
1.618308, 0.996595, -1.500855, 1, 0, 0, 1, 1,
1.623862, -1.059476, 2.358009, 1, 0, 0, 1, 1,
1.635341, 2.203596, -0.03497936, 1, 0, 0, 1, 1,
1.651874, 0.2618864, 1.936854, 1, 0, 0, 1, 1,
1.670709, 2.082405, 2.347951, 0, 0, 0, 1, 1,
1.703657, 0.3433641, 2.637158, 0, 0, 0, 1, 1,
1.712018, -0.1557732, 1.896528, 0, 0, 0, 1, 1,
1.753322, 0.7798111, 0.5139341, 0, 0, 0, 1, 1,
1.781023, 0.5615056, -0.1967739, 0, 0, 0, 1, 1,
1.781038, -1.861578, 3.461076, 0, 0, 0, 1, 1,
1.787028, -0.0012506, 2.057887, 0, 0, 0, 1, 1,
1.787287, 0.5673729, 0.7852154, 1, 1, 1, 1, 1,
1.835542, -1.866483, 4.35814, 1, 1, 1, 1, 1,
1.836988, -1.031739, 3.38909, 1, 1, 1, 1, 1,
1.883522, 0.799093, 1.680421, 1, 1, 1, 1, 1,
1.888842, -0.1825809, -1.461933, 1, 1, 1, 1, 1,
1.913239, -1.198831, 1.24463, 1, 1, 1, 1, 1,
1.918836, 0.5630897, 1.942513, 1, 1, 1, 1, 1,
1.942, 1.278669, 1.037165, 1, 1, 1, 1, 1,
1.989185, 0.4903244, -0.2644401, 1, 1, 1, 1, 1,
1.997359, -0.2991407, 2.568579, 1, 1, 1, 1, 1,
2.005871, 0.7689793, -0.4103627, 1, 1, 1, 1, 1,
2.006145, 0.2043914, 1.114697, 1, 1, 1, 1, 1,
2.0136, -0.554616, 2.336519, 1, 1, 1, 1, 1,
2.024136, -0.7975758, 2.747773, 1, 1, 1, 1, 1,
2.037499, 0.1599051, 0.8880458, 1, 1, 1, 1, 1,
2.038493, -0.1850972, 1.288437, 0, 0, 1, 1, 1,
2.064502, -0.1037546, 1.397451, 1, 0, 0, 1, 1,
2.065737, 0.06141395, 1.485652, 1, 0, 0, 1, 1,
2.078038, -0.03129793, 0.9598226, 1, 0, 0, 1, 1,
2.081267, 0.9450281, 2.396499, 1, 0, 0, 1, 1,
2.085536, 0.6870759, 1.360065, 1, 0, 0, 1, 1,
2.111609, -0.3598589, 2.484354, 0, 0, 0, 1, 1,
2.151177, 1.521771, 2.122296, 0, 0, 0, 1, 1,
2.200351, -1.472076, 2.055048, 0, 0, 0, 1, 1,
2.209476, 0.452963, -0.01127205, 0, 0, 0, 1, 1,
2.218012, -0.5226717, 1.360508, 0, 0, 0, 1, 1,
2.24027, -0.2871617, 2.378606, 0, 0, 0, 1, 1,
2.244854, -1.166615, 3.662637, 0, 0, 0, 1, 1,
2.272245, 0.816121, -0.5658815, 1, 1, 1, 1, 1,
2.322869, 1.527139, 2.690753, 1, 1, 1, 1, 1,
2.375763, 1.200338, 1.583577, 1, 1, 1, 1, 1,
2.432754, -0.4097572, 1.310077, 1, 1, 1, 1, 1,
2.636196, -0.3034166, 0.5028157, 1, 1, 1, 1, 1,
2.880696, 0.4387368, 0.8703777, 1, 1, 1, 1, 1,
3.007132, 1.037387, 2.367821, 1, 1, 1, 1, 1
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
var radius = 9.612217;
var distance = 33.7625;
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
mvMatrix.translate( 0.008654356, -0.2687678, 0.09471488 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.7625);
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