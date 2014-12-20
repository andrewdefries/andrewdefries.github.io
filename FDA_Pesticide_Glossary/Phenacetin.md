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
-3.289356, 1.426827, -1.66453, 1, 0, 0, 1,
-2.585397, -0.3148925, -1.086398, 1, 0.007843138, 0, 1,
-2.570095, -0.3669561, -1.472157, 1, 0.01176471, 0, 1,
-2.483672, 0.8795705, -2.247793, 1, 0.01960784, 0, 1,
-2.469284, 0.6485065, -0.1844849, 1, 0.02352941, 0, 1,
-2.451823, 0.3479425, -1.465868, 1, 0.03137255, 0, 1,
-2.426374, -0.09062735, -1.477122, 1, 0.03529412, 0, 1,
-2.33118, -0.8496146, -1.347385, 1, 0.04313726, 0, 1,
-2.320507, -0.2927184, -2.39177, 1, 0.04705882, 0, 1,
-2.292513, 0.2296534, -1.540888, 1, 0.05490196, 0, 1,
-2.172972, 0.121149, -1.894415, 1, 0.05882353, 0, 1,
-2.112763, -0.7759631, -3.462449, 1, 0.06666667, 0, 1,
-2.106531, -0.2675547, -2.224175, 1, 0.07058824, 0, 1,
-2.082913, 1.288912, -0.8926518, 1, 0.07843138, 0, 1,
-2.054928, 0.4903614, -0.3148542, 1, 0.08235294, 0, 1,
-2.051507, 0.2605999, -1.738199, 1, 0.09019608, 0, 1,
-2.049003, 0.1576149, -0.9115307, 1, 0.09411765, 0, 1,
-1.989891, -1.503295, -0.9673406, 1, 0.1019608, 0, 1,
-1.985926, -0.2691775, -1.86583, 1, 0.1098039, 0, 1,
-1.949229, 1.15096, -1.084095, 1, 0.1137255, 0, 1,
-1.929711, 0.5977727, -1.349937, 1, 0.1215686, 0, 1,
-1.885566, -0.3598354, -0.8280649, 1, 0.1254902, 0, 1,
-1.864905, -0.01183874, -2.059061, 1, 0.1333333, 0, 1,
-1.860941, -0.2932441, -1.573113, 1, 0.1372549, 0, 1,
-1.852868, -0.8318415, -2.891304, 1, 0.145098, 0, 1,
-1.852328, 1.618888, -1.709687, 1, 0.1490196, 0, 1,
-1.829531, -2.29069, -2.365063, 1, 0.1568628, 0, 1,
-1.822904, -0.9169239, -1.612049, 1, 0.1607843, 0, 1,
-1.820401, 1.238797, -2.092546, 1, 0.1686275, 0, 1,
-1.816363, -1.419156, -1.355567, 1, 0.172549, 0, 1,
-1.809842, -0.4893253, -0.5685825, 1, 0.1803922, 0, 1,
-1.794276, -0.4553547, -2.014502, 1, 0.1843137, 0, 1,
-1.759225, 0.2812653, -1.518175, 1, 0.1921569, 0, 1,
-1.749676, 1.81633, -0.2906217, 1, 0.1960784, 0, 1,
-1.718522, -0.07783592, -0.7339814, 1, 0.2039216, 0, 1,
-1.709486, 0.2353014, -0.8428389, 1, 0.2117647, 0, 1,
-1.692524, 0.3820482, -1.794825, 1, 0.2156863, 0, 1,
-1.681451, 1.449029, -1.389693, 1, 0.2235294, 0, 1,
-1.643209, -0.5586159, -1.634722, 1, 0.227451, 0, 1,
-1.641115, -1.984961, -1.702538, 1, 0.2352941, 0, 1,
-1.637011, -0.1010736, -2.967664, 1, 0.2392157, 0, 1,
-1.602419, -0.5606318, -0.9743794, 1, 0.2470588, 0, 1,
-1.60095, -0.7691106, -2.410399, 1, 0.2509804, 0, 1,
-1.593926, -0.09067102, -2.270846, 1, 0.2588235, 0, 1,
-1.557339, 0.501328, -2.095387, 1, 0.2627451, 0, 1,
-1.553091, 1.025119, -1.816698, 1, 0.2705882, 0, 1,
-1.552298, -1.493038, -2.326724, 1, 0.2745098, 0, 1,
-1.549473, -0.7755284, -2.505513, 1, 0.282353, 0, 1,
-1.548799, 1.933088, -2.560725, 1, 0.2862745, 0, 1,
-1.534147, 0.6869279, -1.450011, 1, 0.2941177, 0, 1,
-1.529381, -0.641154, -0.3095324, 1, 0.3019608, 0, 1,
-1.527393, 1.809514, -1.842241, 1, 0.3058824, 0, 1,
-1.525115, 0.4182852, -1.622935, 1, 0.3137255, 0, 1,
-1.524985, -0.1739811, -1.986596, 1, 0.3176471, 0, 1,
-1.522285, -0.7860627, -2.923199, 1, 0.3254902, 0, 1,
-1.522097, -0.823653, -2.890459, 1, 0.3294118, 0, 1,
-1.519288, -0.6913797, -3.555627, 1, 0.3372549, 0, 1,
-1.516904, 0.4190502, -2.200688, 1, 0.3411765, 0, 1,
-1.516769, -0.4008861, -2.030725, 1, 0.3490196, 0, 1,
-1.511902, 1.895161, -0.7595778, 1, 0.3529412, 0, 1,
-1.493692, -0.3781649, -2.101647, 1, 0.3607843, 0, 1,
-1.484316, 0.793036, -0.4522739, 1, 0.3647059, 0, 1,
-1.454921, -0.08422038, -0.6962177, 1, 0.372549, 0, 1,
-1.444229, 1.024099, -2.61485, 1, 0.3764706, 0, 1,
-1.443057, -1.774297, -0.5621703, 1, 0.3843137, 0, 1,
-1.442103, -0.476815, -1.535821, 1, 0.3882353, 0, 1,
-1.424901, -0.2270684, -2.737459, 1, 0.3960784, 0, 1,
-1.424406, 2.574557, 1.869917, 1, 0.4039216, 0, 1,
-1.417332, -0.7506564, -2.709198, 1, 0.4078431, 0, 1,
-1.414814, 1.120368, -0.404902, 1, 0.4156863, 0, 1,
-1.41363, -0.7910753, -2.427968, 1, 0.4196078, 0, 1,
-1.405084, -0.3570419, -1.490046, 1, 0.427451, 0, 1,
-1.400758, -0.9113578, -2.141878, 1, 0.4313726, 0, 1,
-1.399727, -0.5829294, -3.424988, 1, 0.4392157, 0, 1,
-1.398365, -0.3694908, -2.447479, 1, 0.4431373, 0, 1,
-1.392782, -0.01234128, -1.522936, 1, 0.4509804, 0, 1,
-1.392127, -0.3846617, -2.553333, 1, 0.454902, 0, 1,
-1.392099, -1.064924, -2.838453, 1, 0.4627451, 0, 1,
-1.391777, -0.3969055, -4.006821, 1, 0.4666667, 0, 1,
-1.377822, 0.09295033, -3.141484, 1, 0.4745098, 0, 1,
-1.373667, 1.204, -0.06718995, 1, 0.4784314, 0, 1,
-1.3644, -0.3130332, 0.7340479, 1, 0.4862745, 0, 1,
-1.363023, -0.3478144, -2.903823, 1, 0.4901961, 0, 1,
-1.362607, -0.6558892, -2.12563, 1, 0.4980392, 0, 1,
-1.354881, 0.3436974, -1.353301, 1, 0.5058824, 0, 1,
-1.33583, 1.29723, -0.793218, 1, 0.509804, 0, 1,
-1.333086, 0.3936553, -1.347056, 1, 0.5176471, 0, 1,
-1.318511, -0.3534545, -1.950508, 1, 0.5215687, 0, 1,
-1.311248, -0.009866987, 0.5560205, 1, 0.5294118, 0, 1,
-1.298551, 0.6913372, -0.5226217, 1, 0.5333334, 0, 1,
-1.296064, -0.9187924, -2.85781, 1, 0.5411765, 0, 1,
-1.291223, -1.147496, -2.376352, 1, 0.5450981, 0, 1,
-1.259516, -0.2235773, -1.768316, 1, 0.5529412, 0, 1,
-1.250072, -0.009005514, -1.29154, 1, 0.5568628, 0, 1,
-1.243426, -0.3149446, -1.58519, 1, 0.5647059, 0, 1,
-1.243053, 0.2311698, -1.434405, 1, 0.5686275, 0, 1,
-1.236027, 1.67413, -0.2841406, 1, 0.5764706, 0, 1,
-1.22794, -0.7091898, -2.084142, 1, 0.5803922, 0, 1,
-1.22777, -0.8012497, -1.125767, 1, 0.5882353, 0, 1,
-1.227699, -0.3495996, -2.094284, 1, 0.5921569, 0, 1,
-1.213558, 0.8043057, -0.8574819, 1, 0.6, 0, 1,
-1.210607, -0.9305279, -3.643507, 1, 0.6078432, 0, 1,
-1.207459, 0.3382425, -1.389607, 1, 0.6117647, 0, 1,
-1.206396, -1.86248, -2.411114, 1, 0.6196079, 0, 1,
-1.195047, -0.03030102, -3.189515, 1, 0.6235294, 0, 1,
-1.190684, -0.1329637, -1.05839, 1, 0.6313726, 0, 1,
-1.187597, 0.2388381, -0.7240348, 1, 0.6352941, 0, 1,
-1.173541, 0.3273121, -1.231941, 1, 0.6431373, 0, 1,
-1.170523, 0.9993252, 0.8182732, 1, 0.6470588, 0, 1,
-1.168766, -0.8606517, -0.8614891, 1, 0.654902, 0, 1,
-1.167518, -0.01992257, -2.189849, 1, 0.6588235, 0, 1,
-1.16327, 0.3822566, -0.3252034, 1, 0.6666667, 0, 1,
-1.158555, -0.3024351, -0.8229335, 1, 0.6705883, 0, 1,
-1.157791, -1.59147, -3.294911, 1, 0.6784314, 0, 1,
-1.152828, -0.9061594, -3.22203, 1, 0.682353, 0, 1,
-1.151657, -0.4840923, -3.734635, 1, 0.6901961, 0, 1,
-1.149224, 0.1195417, -2.3197, 1, 0.6941177, 0, 1,
-1.14171, 1.055639, -0.5583168, 1, 0.7019608, 0, 1,
-1.138275, 0.3673804, -1.470664, 1, 0.7098039, 0, 1,
-1.136898, 0.3791299, -0.5748882, 1, 0.7137255, 0, 1,
-1.136815, -0.182973, -1.503246, 1, 0.7215686, 0, 1,
-1.130754, 1.406298, -0.01084411, 1, 0.7254902, 0, 1,
-1.126694, -1.899666, -3.03674, 1, 0.7333333, 0, 1,
-1.121462, 1.188708, -0.2733621, 1, 0.7372549, 0, 1,
-1.121379, -1.625519, -1.933987, 1, 0.7450981, 0, 1,
-1.114874, -0.302222, -2.548704, 1, 0.7490196, 0, 1,
-1.112925, -0.6961793, -1.983035, 1, 0.7568628, 0, 1,
-1.107903, 0.3759881, -1.164803, 1, 0.7607843, 0, 1,
-1.073629, 1.483937, 1.251755, 1, 0.7686275, 0, 1,
-1.072821, -0.7742424, -2.636023, 1, 0.772549, 0, 1,
-1.0724, -0.4107764, -2.726436, 1, 0.7803922, 0, 1,
-1.072269, -0.4716101, -2.373168, 1, 0.7843137, 0, 1,
-1.068337, -0.2995029, -1.635532, 1, 0.7921569, 0, 1,
-1.068207, -2.398225, -3.522921, 1, 0.7960784, 0, 1,
-1.063771, 1.164155, -1.136099, 1, 0.8039216, 0, 1,
-1.050157, 0.1104918, -2.872475, 1, 0.8117647, 0, 1,
-1.047311, 1.132164, -1.424676, 1, 0.8156863, 0, 1,
-1.046716, -1.698951, -3.220988, 1, 0.8235294, 0, 1,
-1.044617, -0.9677372, -2.243213, 1, 0.827451, 0, 1,
-1.035563, -0.842931, -1.095735, 1, 0.8352941, 0, 1,
-1.03293, 0.4202391, -0.9938858, 1, 0.8392157, 0, 1,
-1.032177, 1.6343, 0.5724841, 1, 0.8470588, 0, 1,
-1.031766, -0.7676623, -1.771908, 1, 0.8509804, 0, 1,
-1.029175, 2.072873, -0.006425228, 1, 0.8588235, 0, 1,
-1.028298, 2.398632, -1.455372, 1, 0.8627451, 0, 1,
-1.014512, -0.09471825, -0.5379835, 1, 0.8705882, 0, 1,
-1.013634, 0.3127007, -1.60851, 1, 0.8745098, 0, 1,
-1.011498, -0.6388289, -0.9479251, 1, 0.8823529, 0, 1,
-1.010278, -0.8399872, -2.904229, 1, 0.8862745, 0, 1,
-1.008822, 1.383342, -0.1526338, 1, 0.8941177, 0, 1,
-1.007409, 0.9893885, -1.761926, 1, 0.8980392, 0, 1,
-0.9991776, 1.260722, 0.3318301, 1, 0.9058824, 0, 1,
-0.997886, 1.141559, 0.6453753, 1, 0.9137255, 0, 1,
-0.9978002, 0.7819097, 0.6951766, 1, 0.9176471, 0, 1,
-0.9954213, -0.414454, -2.69899, 1, 0.9254902, 0, 1,
-0.9924026, 1.703934, -0.5382903, 1, 0.9294118, 0, 1,
-0.987783, 0.366134, -0.5668347, 1, 0.9372549, 0, 1,
-0.9857839, 0.6048299, 0.2890459, 1, 0.9411765, 0, 1,
-0.9818695, -0.4898377, -2.144739, 1, 0.9490196, 0, 1,
-0.9734067, -1.096755, -1.356405, 1, 0.9529412, 0, 1,
-0.9645016, 1.79122, -0.3274879, 1, 0.9607843, 0, 1,
-0.9612476, 2.003599, -0.7336385, 1, 0.9647059, 0, 1,
-0.9604462, -0.9584519, -2.327506, 1, 0.972549, 0, 1,
-0.9590389, -0.8705717, -2.521381, 1, 0.9764706, 0, 1,
-0.9568046, 0.4614325, -1.590253, 1, 0.9843137, 0, 1,
-0.9541736, 0.7088354, 0.8940738, 1, 0.9882353, 0, 1,
-0.9540431, -1.908392, -1.979854, 1, 0.9960784, 0, 1,
-0.9537699, 0.6756552, -1.648433, 0.9960784, 1, 0, 1,
-0.9470584, 0.9701353, -1.442748, 0.9921569, 1, 0, 1,
-0.9435184, -1.501658, -2.766102, 0.9843137, 1, 0, 1,
-0.9399402, -2.004401, -1.795438, 0.9803922, 1, 0, 1,
-0.9384192, -0.1286743, -1.350136, 0.972549, 1, 0, 1,
-0.9382068, 0.550922, -0.9561917, 0.9686275, 1, 0, 1,
-0.9326807, 0.493383, -1.921736, 0.9607843, 1, 0, 1,
-0.9315019, -0.6930909, -1.216365, 0.9568627, 1, 0, 1,
-0.930288, -0.3162192, -3.303152, 0.9490196, 1, 0, 1,
-0.9059583, 0.7711058, -1.296716, 0.945098, 1, 0, 1,
-0.9041374, 0.7199403, -0.8857651, 0.9372549, 1, 0, 1,
-0.8991835, 1.194708, -0.2547325, 0.9333333, 1, 0, 1,
-0.8851, -0.6655916, -1.36541, 0.9254902, 1, 0, 1,
-0.8783935, 2.072671, -0.5714086, 0.9215686, 1, 0, 1,
-0.8779342, 0.5981476, 0.1931914, 0.9137255, 1, 0, 1,
-0.8748378, -0.9409994, -3.838038, 0.9098039, 1, 0, 1,
-0.8729747, -0.4832454, -2.70081, 0.9019608, 1, 0, 1,
-0.8706419, 0.7449014, 0.6921806, 0.8941177, 1, 0, 1,
-0.8705218, 0.6831676, -2.170937, 0.8901961, 1, 0, 1,
-0.8669623, 0.2037648, -2.360939, 0.8823529, 1, 0, 1,
-0.8668886, 1.640487, -1.780825, 0.8784314, 1, 0, 1,
-0.8563178, -0.5417445, -1.766969, 0.8705882, 1, 0, 1,
-0.8558008, -0.8668653, -2.489662, 0.8666667, 1, 0, 1,
-0.8555012, -0.9079332, -2.997215, 0.8588235, 1, 0, 1,
-0.8462415, 0.2652211, -2.320103, 0.854902, 1, 0, 1,
-0.8439777, 1.079706, -1.824026, 0.8470588, 1, 0, 1,
-0.8416829, -0.1088842, -0.388711, 0.8431373, 1, 0, 1,
-0.8393095, -0.2899268, -1.755292, 0.8352941, 1, 0, 1,
-0.8391091, -1.819858, -3.198826, 0.8313726, 1, 0, 1,
-0.836704, -1.021931, -3.633539, 0.8235294, 1, 0, 1,
-0.8334644, 0.04753649, -0.9449499, 0.8196079, 1, 0, 1,
-0.8313956, 0.5570761, -2.746867, 0.8117647, 1, 0, 1,
-0.8307076, 0.8344368, 0.4710797, 0.8078431, 1, 0, 1,
-0.8299538, 1.257441, -0.9727618, 0.8, 1, 0, 1,
-0.8298101, -0.1379065, -2.396385, 0.7921569, 1, 0, 1,
-0.8228328, -0.3653943, -1.13123, 0.7882353, 1, 0, 1,
-0.8212515, 0.6404451, -0.8438605, 0.7803922, 1, 0, 1,
-0.8135256, 0.6056315, -1.508452, 0.7764706, 1, 0, 1,
-0.8109586, 1.032889, 0.4805917, 0.7686275, 1, 0, 1,
-0.8066427, 0.6318034, -0.7806982, 0.7647059, 1, 0, 1,
-0.8030627, -1.678988, -0.3545065, 0.7568628, 1, 0, 1,
-0.8000612, -0.7352321, -3.035426, 0.7529412, 1, 0, 1,
-0.7991773, -0.186291, -1.7709, 0.7450981, 1, 0, 1,
-0.7986844, 0.5855032, -2.792816, 0.7411765, 1, 0, 1,
-0.7973798, 0.573836, -1.498088, 0.7333333, 1, 0, 1,
-0.7931171, -0.5197936, -2.260397, 0.7294118, 1, 0, 1,
-0.7809992, 0.8806555, -1.755083, 0.7215686, 1, 0, 1,
-0.7754846, -0.2683473, -1.986503, 0.7176471, 1, 0, 1,
-0.7684235, -0.6644642, -2.359124, 0.7098039, 1, 0, 1,
-0.7589737, 0.6797845, -1.184396, 0.7058824, 1, 0, 1,
-0.7585348, -0.6463196, -1.401888, 0.6980392, 1, 0, 1,
-0.7574941, -0.2733807, -4.342323, 0.6901961, 1, 0, 1,
-0.7523504, 1.356257, -0.8177362, 0.6862745, 1, 0, 1,
-0.7522751, -0.0003736357, -1.683195, 0.6784314, 1, 0, 1,
-0.7515047, -2.185655, -4.23784, 0.6745098, 1, 0, 1,
-0.748987, -0.4851384, -1.758912, 0.6666667, 1, 0, 1,
-0.7467154, -0.03019919, -1.694981, 0.6627451, 1, 0, 1,
-0.7436274, -0.3697212, -2.030045, 0.654902, 1, 0, 1,
-0.740931, -0.1142537, -0.8623469, 0.6509804, 1, 0, 1,
-0.7401881, 0.02910733, -2.4764, 0.6431373, 1, 0, 1,
-0.7396483, 0.2147742, 0.4965707, 0.6392157, 1, 0, 1,
-0.7376577, -0.03309303, 0.423054, 0.6313726, 1, 0, 1,
-0.7301861, -0.9897711, -3.606167, 0.627451, 1, 0, 1,
-0.7236173, -1.576812, -1.141575, 0.6196079, 1, 0, 1,
-0.7218681, 0.9592664, -0.4989289, 0.6156863, 1, 0, 1,
-0.7052006, -0.5326433, -1.629586, 0.6078432, 1, 0, 1,
-0.702934, -0.2561784, -2.044291, 0.6039216, 1, 0, 1,
-0.6999187, 1.41809, -1.344252, 0.5960785, 1, 0, 1,
-0.6979985, 0.2480395, -4.033523, 0.5882353, 1, 0, 1,
-0.6961701, -0.1060808, -1.142703, 0.5843138, 1, 0, 1,
-0.6924071, 1.024973, -1.641877, 0.5764706, 1, 0, 1,
-0.6914485, 0.6242854, 0.3205697, 0.572549, 1, 0, 1,
-0.6905556, -1.37512, -3.513704, 0.5647059, 1, 0, 1,
-0.6873662, 0.2968393, -0.4156386, 0.5607843, 1, 0, 1,
-0.6860114, -0.4324937, -3.097665, 0.5529412, 1, 0, 1,
-0.6777141, 0.2894676, -0.9397122, 0.5490196, 1, 0, 1,
-0.6679671, -0.8354685, -4.200192, 0.5411765, 1, 0, 1,
-0.6667817, 2.67498, -2.073146, 0.5372549, 1, 0, 1,
-0.6667049, -0.5648736, -2.658362, 0.5294118, 1, 0, 1,
-0.6661578, -0.8608944, -3.51959, 0.5254902, 1, 0, 1,
-0.6578336, 0.2307888, -0.9263664, 0.5176471, 1, 0, 1,
-0.6573977, 0.7373326, -1.080525, 0.5137255, 1, 0, 1,
-0.65382, 0.6201344, -0.07423308, 0.5058824, 1, 0, 1,
-0.6479741, 0.2025912, -1.434627, 0.5019608, 1, 0, 1,
-0.6471262, 0.2094344, -0.8189555, 0.4941176, 1, 0, 1,
-0.6393216, -1.954959, -0.7164587, 0.4862745, 1, 0, 1,
-0.6379962, 0.2612018, -1.51339, 0.4823529, 1, 0, 1,
-0.6364719, 0.06455463, -0.8463184, 0.4745098, 1, 0, 1,
-0.6315048, 0.4546391, -1.912524, 0.4705882, 1, 0, 1,
-0.6279534, -0.5061753, -0.4101111, 0.4627451, 1, 0, 1,
-0.6188509, -0.5816166, -2.464109, 0.4588235, 1, 0, 1,
-0.6182499, -2.086088, -1.416512, 0.4509804, 1, 0, 1,
-0.6130568, -0.8859494, -2.641094, 0.4470588, 1, 0, 1,
-0.6029004, 0.1517401, -2.03666, 0.4392157, 1, 0, 1,
-0.60256, -0.3817203, -1.817958, 0.4352941, 1, 0, 1,
-0.5957898, 0.3351135, -0.5792146, 0.427451, 1, 0, 1,
-0.5934905, -2.116767, -3.365282, 0.4235294, 1, 0, 1,
-0.5919117, 0.2958795, -0.534296, 0.4156863, 1, 0, 1,
-0.5803012, -0.5529305, -1.368979, 0.4117647, 1, 0, 1,
-0.5797255, 1.204456, 0.4136966, 0.4039216, 1, 0, 1,
-0.5797032, 1.950497, 0.6038305, 0.3960784, 1, 0, 1,
-0.5775417, -1.371969, -2.341396, 0.3921569, 1, 0, 1,
-0.5686569, -0.8332361, -3.5409, 0.3843137, 1, 0, 1,
-0.5660751, -0.5016786, -2.199468, 0.3803922, 1, 0, 1,
-0.5645902, -0.914063, -2.650288, 0.372549, 1, 0, 1,
-0.564537, -0.4596501, -2.122754, 0.3686275, 1, 0, 1,
-0.5599217, -0.1739483, -2.385931, 0.3607843, 1, 0, 1,
-0.5597221, -0.4235091, -2.426139, 0.3568628, 1, 0, 1,
-0.5582869, 1.019681, 0.007773443, 0.3490196, 1, 0, 1,
-0.5542963, 0.3774606, -1.535538, 0.345098, 1, 0, 1,
-0.5501963, 0.2809049, -0.8290351, 0.3372549, 1, 0, 1,
-0.5493508, -0.4603997, -2.971737, 0.3333333, 1, 0, 1,
-0.5443277, 0.4443004, 0.2284792, 0.3254902, 1, 0, 1,
-0.5441303, -0.4529577, -2.014608, 0.3215686, 1, 0, 1,
-0.5430809, -0.7878164, -2.079661, 0.3137255, 1, 0, 1,
-0.535709, -0.3211599, -2.909872, 0.3098039, 1, 0, 1,
-0.5351632, -0.5853354, -4.364735, 0.3019608, 1, 0, 1,
-0.5294397, 0.04932582, -3.046862, 0.2941177, 1, 0, 1,
-0.52483, 0.4093552, -0.7762776, 0.2901961, 1, 0, 1,
-0.5202559, 0.3782637, 0.3138242, 0.282353, 1, 0, 1,
-0.5117666, -0.6976836, -1.528521, 0.2784314, 1, 0, 1,
-0.510765, -1.694252, -2.700834, 0.2705882, 1, 0, 1,
-0.5098047, 0.01228456, -0.3070984, 0.2666667, 1, 0, 1,
-0.5095785, 1.927903, -1.70311, 0.2588235, 1, 0, 1,
-0.5088831, 0.1943759, -0.8574108, 0.254902, 1, 0, 1,
-0.5083979, 0.2600991, -0.5087953, 0.2470588, 1, 0, 1,
-0.5017343, -1.067035, -3.363775, 0.2431373, 1, 0, 1,
-0.4991332, 0.2726549, -1.532378, 0.2352941, 1, 0, 1,
-0.4982569, 0.09223714, -0.9149172, 0.2313726, 1, 0, 1,
-0.4980175, 0.3156686, -0.8765137, 0.2235294, 1, 0, 1,
-0.4936268, 0.01162673, -0.5715012, 0.2196078, 1, 0, 1,
-0.4927441, 1.232295, -0.8911269, 0.2117647, 1, 0, 1,
-0.4879073, 0.3125223, -1.353695, 0.2078431, 1, 0, 1,
-0.4816151, -0.5094759, -2.693771, 0.2, 1, 0, 1,
-0.4760529, 1.367401, -0.6248643, 0.1921569, 1, 0, 1,
-0.4756152, -1.946867, -2.729182, 0.1882353, 1, 0, 1,
-0.4711739, 2.005587, 0.1269329, 0.1803922, 1, 0, 1,
-0.465377, 0.252937, -1.422341, 0.1764706, 1, 0, 1,
-0.4615494, 0.6698815, -1.137952, 0.1686275, 1, 0, 1,
-0.4606334, 1.146421, -1.812571, 0.1647059, 1, 0, 1,
-0.4587445, -1.512796, -3.030038, 0.1568628, 1, 0, 1,
-0.4564674, 1.021253, -0.9130786, 0.1529412, 1, 0, 1,
-0.4552425, 2.206956, -3.047346, 0.145098, 1, 0, 1,
-0.4534822, 0.01920315, -1.269961, 0.1411765, 1, 0, 1,
-0.4533356, 0.52197, 0.7851058, 0.1333333, 1, 0, 1,
-0.4506346, 1.261373, -0.5714601, 0.1294118, 1, 0, 1,
-0.4503429, -1.591093, -4.589079, 0.1215686, 1, 0, 1,
-0.4499884, -0.2223275, -2.759412, 0.1176471, 1, 0, 1,
-0.4431545, 0.3246262, -0.8390036, 0.1098039, 1, 0, 1,
-0.4402711, -1.503468, -2.784889, 0.1058824, 1, 0, 1,
-0.4368975, -0.4592424, -0.6128723, 0.09803922, 1, 0, 1,
-0.435151, -0.05929862, -1.168668, 0.09019608, 1, 0, 1,
-0.4349895, -0.06384467, -0.09768916, 0.08627451, 1, 0, 1,
-0.4340573, -0.04946709, -1.770392, 0.07843138, 1, 0, 1,
-0.4320479, -0.4952058, -3.318972, 0.07450981, 1, 0, 1,
-0.4310005, -0.1179494, -1.617116, 0.06666667, 1, 0, 1,
-0.4278726, -0.1367002, -2.880646, 0.0627451, 1, 0, 1,
-0.425728, -0.6712208, -2.514608, 0.05490196, 1, 0, 1,
-0.4237505, -0.3471991, -1.86801, 0.05098039, 1, 0, 1,
-0.4213404, -1.929954, -3.202998, 0.04313726, 1, 0, 1,
-0.4194729, 0.3205295, -2.108582, 0.03921569, 1, 0, 1,
-0.4191954, -0.642814, -2.875134, 0.03137255, 1, 0, 1,
-0.417818, -1.557114, -3.5121, 0.02745098, 1, 0, 1,
-0.4110347, -0.4820762, -2.589364, 0.01960784, 1, 0, 1,
-0.4094064, 1.651063, 1.146776, 0.01568628, 1, 0, 1,
-0.4058587, -0.6516196, -2.132966, 0.007843138, 1, 0, 1,
-0.4049517, 0.2730039, 0.0341971, 0.003921569, 1, 0, 1,
-0.390536, -1.093091, -3.588237, 0, 1, 0.003921569, 1,
-0.3894884, 0.03065254, -1.204451, 0, 1, 0.01176471, 1,
-0.3878617, 1.195094, -0.6196868, 0, 1, 0.01568628, 1,
-0.370647, 0.6992809, -1.318611, 0, 1, 0.02352941, 1,
-0.3699733, 2.16994, 0.04565194, 0, 1, 0.02745098, 1,
-0.3687362, -0.1583761, -2.632324, 0, 1, 0.03529412, 1,
-0.3686672, 1.175419, 0.4325264, 0, 1, 0.03921569, 1,
-0.367453, 0.2471917, -0.7632219, 0, 1, 0.04705882, 1,
-0.3660849, -0.6463028, -2.137399, 0, 1, 0.05098039, 1,
-0.3651672, -0.1129165, -1.337726, 0, 1, 0.05882353, 1,
-0.3578952, 2.118717, -0.02844246, 0, 1, 0.0627451, 1,
-0.351172, 0.4558049, -0.2566394, 0, 1, 0.07058824, 1,
-0.3505724, 0.4636934, -0.09089969, 0, 1, 0.07450981, 1,
-0.3499202, -0.4185316, -2.244299, 0, 1, 0.08235294, 1,
-0.3479709, 0.6101934, -1.395105, 0, 1, 0.08627451, 1,
-0.3450119, 1.423934, -0.6745214, 0, 1, 0.09411765, 1,
-0.3377343, 0.2043179, -0.8007432, 0, 1, 0.1019608, 1,
-0.3349258, 0.3991889, 0.8731945, 0, 1, 0.1058824, 1,
-0.3323649, 2.099682, -1.074978, 0, 1, 0.1137255, 1,
-0.3258874, -1.148742, -2.271225, 0, 1, 0.1176471, 1,
-0.3248369, -0.7711225, -3.54177, 0, 1, 0.1254902, 1,
-0.3241701, 0.648016, 2.304478, 0, 1, 0.1294118, 1,
-0.3233832, 0.5877101, 0.5839313, 0, 1, 0.1372549, 1,
-0.3224358, 0.09167945, -0.3709531, 0, 1, 0.1411765, 1,
-0.3135442, 1.219402, 1.267422, 0, 1, 0.1490196, 1,
-0.3125751, 1.633844, 0.1017316, 0, 1, 0.1529412, 1,
-0.3117065, -2.071397, -2.703183, 0, 1, 0.1607843, 1,
-0.3100054, 1.171252, -0.3339325, 0, 1, 0.1647059, 1,
-0.3062547, 0.2599203, -0.1244749, 0, 1, 0.172549, 1,
-0.3048251, 1.232481, -0.09727998, 0, 1, 0.1764706, 1,
-0.3043763, 0.008077458, -1.984342, 0, 1, 0.1843137, 1,
-0.3004486, -1.132345, -3.138437, 0, 1, 0.1882353, 1,
-0.2992203, 1.084388, -0.196743, 0, 1, 0.1960784, 1,
-0.298463, 0.4735442, 0.1500905, 0, 1, 0.2039216, 1,
-0.2906682, 0.2733129, -1.955325, 0, 1, 0.2078431, 1,
-0.2850442, -0.420114, -3.557444, 0, 1, 0.2156863, 1,
-0.2848536, -0.5672516, -3.486105, 0, 1, 0.2196078, 1,
-0.2777523, 0.2826672, 0.2098921, 0, 1, 0.227451, 1,
-0.2737726, 1.904267, 0.2201654, 0, 1, 0.2313726, 1,
-0.2694755, -1.285903, -2.252237, 0, 1, 0.2392157, 1,
-0.2671746, -0.8313982, -2.780143, 0, 1, 0.2431373, 1,
-0.2659113, 0.7687778, -1.371133, 0, 1, 0.2509804, 1,
-0.2648004, 1.077331, 0.9605684, 0, 1, 0.254902, 1,
-0.2644755, 2.091133, -0.2841282, 0, 1, 0.2627451, 1,
-0.2641611, -1.092603, -4.568638, 0, 1, 0.2666667, 1,
-0.2563094, 0.8091326, -0.08331746, 0, 1, 0.2745098, 1,
-0.2554321, 0.1527223, -1.480786, 0, 1, 0.2784314, 1,
-0.2522624, 0.4554363, -1.146272, 0, 1, 0.2862745, 1,
-0.2470186, -1.358163, -3.625603, 0, 1, 0.2901961, 1,
-0.2432284, -0.6576437, -3.773254, 0, 1, 0.2980392, 1,
-0.2425791, 0.6254997, 0.5406992, 0, 1, 0.3058824, 1,
-0.2410131, -0.2440295, -2.350081, 0, 1, 0.3098039, 1,
-0.2373962, -2.147205, -2.189174, 0, 1, 0.3176471, 1,
-0.2315665, -0.5770341, -4.094265, 0, 1, 0.3215686, 1,
-0.2314974, 1.54842, 0.2908886, 0, 1, 0.3294118, 1,
-0.2297725, -0.4195621, -3.94644, 0, 1, 0.3333333, 1,
-0.2285303, -1.864567, -1.506859, 0, 1, 0.3411765, 1,
-0.2284837, 0.6652619, 0.9570231, 0, 1, 0.345098, 1,
-0.2262523, -0.8608282, -3.035482, 0, 1, 0.3529412, 1,
-0.226123, -2.041631, -4.473868, 0, 1, 0.3568628, 1,
-0.2218264, 0.05478767, -2.711022, 0, 1, 0.3647059, 1,
-0.2210488, -0.1545813, -2.296039, 0, 1, 0.3686275, 1,
-0.2106101, 1.105977, 0.9630327, 0, 1, 0.3764706, 1,
-0.210568, -0.7547462, -3.708305, 0, 1, 0.3803922, 1,
-0.2101453, 1.303465, 0.700322, 0, 1, 0.3882353, 1,
-0.1946875, -0.1347514, -1.500019, 0, 1, 0.3921569, 1,
-0.1944181, -0.4764606, -3.132076, 0, 1, 0.4, 1,
-0.1944105, -0.3943356, -0.939361, 0, 1, 0.4078431, 1,
-0.1922886, -0.9369053, -2.41811, 0, 1, 0.4117647, 1,
-0.1869836, -0.8956456, -3.088035, 0, 1, 0.4196078, 1,
-0.183621, 0.08565982, -0.3949206, 0, 1, 0.4235294, 1,
-0.182473, 0.1526693, -2.997702, 0, 1, 0.4313726, 1,
-0.1730181, 0.6937421, -0.3276123, 0, 1, 0.4352941, 1,
-0.172119, 1.423122, 1.128693, 0, 1, 0.4431373, 1,
-0.1712061, -0.4578842, -2.776388, 0, 1, 0.4470588, 1,
-0.1660401, -0.1437512, -2.273352, 0, 1, 0.454902, 1,
-0.1635998, -0.7780481, -1.779261, 0, 1, 0.4588235, 1,
-0.1633856, -0.5992107, -3.679119, 0, 1, 0.4666667, 1,
-0.1596237, 0.8808187, -1.091234, 0, 1, 0.4705882, 1,
-0.1585951, -1.239308, -4.059132, 0, 1, 0.4784314, 1,
-0.1538291, -1.012635, -3.100672, 0, 1, 0.4823529, 1,
-0.1533146, 0.06968822, -3.568933, 0, 1, 0.4901961, 1,
-0.1504194, -0.4994007, -0.5553624, 0, 1, 0.4941176, 1,
-0.1498525, 1.157172, 0.3167675, 0, 1, 0.5019608, 1,
-0.1461537, -0.1516745, -0.9295593, 0, 1, 0.509804, 1,
-0.1438198, 0.8468202, 0.6004497, 0, 1, 0.5137255, 1,
-0.1360904, 2.620345, -0.4919068, 0, 1, 0.5215687, 1,
-0.1348034, -1.805727, -1.40693, 0, 1, 0.5254902, 1,
-0.1294141, -0.1952734, -3.469634, 0, 1, 0.5333334, 1,
-0.128399, -0.3829453, -2.684046, 0, 1, 0.5372549, 1,
-0.1283114, -0.4088822, -2.403147, 0, 1, 0.5450981, 1,
-0.1246203, -0.8726668, -3.223351, 0, 1, 0.5490196, 1,
-0.1231938, -0.5059589, -0.8673236, 0, 1, 0.5568628, 1,
-0.1231283, -1.457469, -1.231747, 0, 1, 0.5607843, 1,
-0.1199954, 0.5396177, -0.08880166, 0, 1, 0.5686275, 1,
-0.1184623, -2.872258, -2.479682, 0, 1, 0.572549, 1,
-0.1177789, 0.842061, -1.130685, 0, 1, 0.5803922, 1,
-0.1159775, 1.011489, 0.1174054, 0, 1, 0.5843138, 1,
-0.1156772, -0.08718958, -3.704137, 0, 1, 0.5921569, 1,
-0.1152073, -0.04403835, -2.579491, 0, 1, 0.5960785, 1,
-0.1133917, 0.3314502, 0.9393072, 0, 1, 0.6039216, 1,
-0.1121975, 1.013329, 0.6180586, 0, 1, 0.6117647, 1,
-0.1100449, 0.4345739, 0.424415, 0, 1, 0.6156863, 1,
-0.1054859, 1.503809, 0.073471, 0, 1, 0.6235294, 1,
-0.09305199, 1.594158, -0.3688302, 0, 1, 0.627451, 1,
-0.09124666, 0.4821053, 0.01960992, 0, 1, 0.6352941, 1,
-0.08382235, -0.5337483, -3.685704, 0, 1, 0.6392157, 1,
-0.08342423, 0.6373557, 0.3672815, 0, 1, 0.6470588, 1,
-0.08271269, 0.2951818, -0.5602562, 0, 1, 0.6509804, 1,
-0.07972181, -0.1898039, -2.138962, 0, 1, 0.6588235, 1,
-0.07439389, -0.4070068, -3.871605, 0, 1, 0.6627451, 1,
-0.07013354, 0.2587637, 0.08547491, 0, 1, 0.6705883, 1,
-0.06921114, 0.4784877, 0.6135077, 0, 1, 0.6745098, 1,
-0.0639543, 0.5241071, 0.0714668, 0, 1, 0.682353, 1,
-0.06280243, -0.9899039, -3.835968, 0, 1, 0.6862745, 1,
-0.05868967, 0.5439829, -1.06416, 0, 1, 0.6941177, 1,
-0.05782275, -1.182044, -3.95992, 0, 1, 0.7019608, 1,
-0.05769647, -0.2794262, -2.486755, 0, 1, 0.7058824, 1,
-0.05429871, 0.226958, -0.964325, 0, 1, 0.7137255, 1,
-0.05353607, -0.1664791, -1.907697, 0, 1, 0.7176471, 1,
-0.04760268, -1.957522, -3.143782, 0, 1, 0.7254902, 1,
-0.04408207, -0.5848004, -4.731687, 0, 1, 0.7294118, 1,
-0.04333593, -1.266323, -3.312759, 0, 1, 0.7372549, 1,
-0.04192206, -0.6250815, -3.859283, 0, 1, 0.7411765, 1,
-0.03449857, -0.02152907, -1.953758, 0, 1, 0.7490196, 1,
-0.03347775, 2.002327, 0.8407213, 0, 1, 0.7529412, 1,
-0.0313454, -0.8920852, -4.472473, 0, 1, 0.7607843, 1,
-0.02919519, -0.1446899, -2.533959, 0, 1, 0.7647059, 1,
-0.0273703, 1.030037, 0.3824305, 0, 1, 0.772549, 1,
-0.02722158, -1.023644, -3.335072, 0, 1, 0.7764706, 1,
-0.02630855, 0.6171651, -1.178622, 0, 1, 0.7843137, 1,
-0.02452048, -0.9214442, -2.850353, 0, 1, 0.7882353, 1,
-0.02261241, -0.7043818, -2.833152, 0, 1, 0.7960784, 1,
-0.020411, 1.93571, 0.3931307, 0, 1, 0.8039216, 1,
-0.02014096, 0.01300054, -1.981726, 0, 1, 0.8078431, 1,
-0.02011452, 1.504692, 1.672672, 0, 1, 0.8156863, 1,
-0.01980469, 0.6276658, 0.2929949, 0, 1, 0.8196079, 1,
-0.01798107, 1.117631, 1.387803, 0, 1, 0.827451, 1,
-0.01679136, 0.5957265, 0.1234906, 0, 1, 0.8313726, 1,
-0.01384274, -1.781718, -0.5452127, 0, 1, 0.8392157, 1,
-0.01284603, 0.1252144, 1.333167, 0, 1, 0.8431373, 1,
-0.01221526, -0.6497252, -2.650583, 0, 1, 0.8509804, 1,
-0.01108969, 0.8070826, -0.6870867, 0, 1, 0.854902, 1,
-0.01028643, 0.4648728, 1.519328, 0, 1, 0.8627451, 1,
-0.009626744, -1.32191, -3.473789, 0, 1, 0.8666667, 1,
-0.008905738, 0.2485833, 0.2398009, 0, 1, 0.8745098, 1,
-0.005467725, 1.337211, -0.2170628, 0, 1, 0.8784314, 1,
-0.003904554, 0.626074, -1.095956, 0, 1, 0.8862745, 1,
0.001492003, 1.61564, -0.2981584, 0, 1, 0.8901961, 1,
0.003500724, 0.7101017, 0.6099535, 0, 1, 0.8980392, 1,
0.005782296, -0.007785295, -0.7268158, 0, 1, 0.9058824, 1,
0.006994251, 0.7212774, -0.9443929, 0, 1, 0.9098039, 1,
0.01254634, -1.039229, 3.416308, 0, 1, 0.9176471, 1,
0.01398714, -1.04352, 4.069951, 0, 1, 0.9215686, 1,
0.01422666, 2.189031, -0.2738036, 0, 1, 0.9294118, 1,
0.01653641, -0.3685402, 2.840158, 0, 1, 0.9333333, 1,
0.01838028, -1.316569, 2.444093, 0, 1, 0.9411765, 1,
0.03050116, 0.5942177, 0.05310166, 0, 1, 0.945098, 1,
0.03339222, 0.01796541, 1.662274, 0, 1, 0.9529412, 1,
0.03464825, 1.359838, 0.1287881, 0, 1, 0.9568627, 1,
0.03610301, 0.3363715, -0.7633879, 0, 1, 0.9647059, 1,
0.04110955, -0.5297161, 2.466094, 0, 1, 0.9686275, 1,
0.04170168, -0.3230312, 2.676631, 0, 1, 0.9764706, 1,
0.04259523, -0.9624351, 2.756662, 0, 1, 0.9803922, 1,
0.04336482, -2.450942, 2.918825, 0, 1, 0.9882353, 1,
0.04360167, 0.4457548, 1.04508, 0, 1, 0.9921569, 1,
0.04730417, 0.6326702, 0.9335604, 0, 1, 1, 1,
0.05119282, 1.164809, -0.7366902, 0, 0.9921569, 1, 1,
0.05439592, -0.3726547, 3.525425, 0, 0.9882353, 1, 1,
0.05921865, -0.01759269, 2.983831, 0, 0.9803922, 1, 1,
0.06346634, -0.8902596, 2.619886, 0, 0.9764706, 1, 1,
0.06365649, 0.7142368, 0.2605972, 0, 0.9686275, 1, 1,
0.06475446, 1.338999, 0.3882661, 0, 0.9647059, 1, 1,
0.0659371, 0.1866267, 0.3410973, 0, 0.9568627, 1, 1,
0.06616449, 0.2095988, -0.2315527, 0, 0.9529412, 1, 1,
0.07273668, -2.258761, 5.697192, 0, 0.945098, 1, 1,
0.0737792, 0.3640722, 1.741665, 0, 0.9411765, 1, 1,
0.07659703, 1.352597, 0.2971789, 0, 0.9333333, 1, 1,
0.0782724, -0.7074921, 3.739193, 0, 0.9294118, 1, 1,
0.07884566, 0.2017944, 0.4279057, 0, 0.9215686, 1, 1,
0.07961331, -1.765946, 3.340587, 0, 0.9176471, 1, 1,
0.08018571, 0.4564615, 1.159159, 0, 0.9098039, 1, 1,
0.08285204, -2.139926, 2.33828, 0, 0.9058824, 1, 1,
0.08393977, 0.6991211, 0.378016, 0, 0.8980392, 1, 1,
0.08415259, -0.07682209, 2.40482, 0, 0.8901961, 1, 1,
0.08858063, -0.06516228, 5.146939, 0, 0.8862745, 1, 1,
0.09031627, 0.6890202, 0.2506055, 0, 0.8784314, 1, 1,
0.09129812, 0.9186879, 0.2964409, 0, 0.8745098, 1, 1,
0.09281255, 1.463985, 1.004794, 0, 0.8666667, 1, 1,
0.0935911, 1.579985, 0.7574376, 0, 0.8627451, 1, 1,
0.09470555, -1.511562, 1.761277, 0, 0.854902, 1, 1,
0.0953569, 0.1518157, 0.4227571, 0, 0.8509804, 1, 1,
0.09551537, 0.08627895, -0.9837934, 0, 0.8431373, 1, 1,
0.09814765, -1.301498, 1.50691, 0, 0.8392157, 1, 1,
0.1061563, 0.9822937, 0.9219673, 0, 0.8313726, 1, 1,
0.1127717, 0.2938958, 0.7952194, 0, 0.827451, 1, 1,
0.1138336, 0.2084228, 0.1352143, 0, 0.8196079, 1, 1,
0.1186068, 0.899781, 0.5448114, 0, 0.8156863, 1, 1,
0.1215046, -0.8552834, 3.16786, 0, 0.8078431, 1, 1,
0.1227929, -0.6790313, 2.406367, 0, 0.8039216, 1, 1,
0.1248923, 0.2098212, 0.4352545, 0, 0.7960784, 1, 1,
0.1254334, 0.3998114, -0.1378374, 0, 0.7882353, 1, 1,
0.1255605, 0.9806567, 0.5834069, 0, 0.7843137, 1, 1,
0.1260879, 2.339127, -0.5035957, 0, 0.7764706, 1, 1,
0.1300887, 2.772728, -0.1379924, 0, 0.772549, 1, 1,
0.1331844, -0.1474333, 2.201512, 0, 0.7647059, 1, 1,
0.1368784, -0.7566323, 1.890819, 0, 0.7607843, 1, 1,
0.143095, -0.7200865, 2.863225, 0, 0.7529412, 1, 1,
0.1501129, -0.07118335, 3.351377, 0, 0.7490196, 1, 1,
0.15118, 0.6312675, -0.6032893, 0, 0.7411765, 1, 1,
0.1520262, -0.05210905, 1.090808, 0, 0.7372549, 1, 1,
0.152423, -1.113153, 3.490047, 0, 0.7294118, 1, 1,
0.1597196, -0.7728784, 3.802147, 0, 0.7254902, 1, 1,
0.1631118, -0.5835779, 2.393018, 0, 0.7176471, 1, 1,
0.1669226, -0.9727027, 4.463569, 0, 0.7137255, 1, 1,
0.169664, -0.8797036, 2.227368, 0, 0.7058824, 1, 1,
0.169842, -0.4396564, 2.217999, 0, 0.6980392, 1, 1,
0.1759963, 0.3441189, 1.264615, 0, 0.6941177, 1, 1,
0.1761463, -0.1693334, 3.567137, 0, 0.6862745, 1, 1,
0.179078, 0.1869505, 0.9033952, 0, 0.682353, 1, 1,
0.1803398, 0.634531, 0.06164514, 0, 0.6745098, 1, 1,
0.181681, -1.078058, 2.479801, 0, 0.6705883, 1, 1,
0.1826215, -0.6837565, 3.808805, 0, 0.6627451, 1, 1,
0.1859423, -1.260378, 2.681795, 0, 0.6588235, 1, 1,
0.1883468, 0.3038516, 0.338579, 0, 0.6509804, 1, 1,
0.1892853, 0.6967974, -1.131799, 0, 0.6470588, 1, 1,
0.1915603, 1.261981, -0.4639243, 0, 0.6392157, 1, 1,
0.1933498, -1.721655, 1.886509, 0, 0.6352941, 1, 1,
0.1960049, 1.358005, 0.2645041, 0, 0.627451, 1, 1,
0.1993212, 0.2128803, 1.149127, 0, 0.6235294, 1, 1,
0.200892, -0.8503753, 4.160101, 0, 0.6156863, 1, 1,
0.2015634, 1.019277, -0.4314806, 0, 0.6117647, 1, 1,
0.2017389, 0.7463264, -0.8894497, 0, 0.6039216, 1, 1,
0.2029828, 0.2307939, 0.2360296, 0, 0.5960785, 1, 1,
0.2043283, -0.9161426, 2.298557, 0, 0.5921569, 1, 1,
0.2052232, -0.3445143, 2.07264, 0, 0.5843138, 1, 1,
0.2060761, 1.41924, 0.7798022, 0, 0.5803922, 1, 1,
0.2066488, 0.07310962, 1.667329, 0, 0.572549, 1, 1,
0.2097972, -0.7482185, 3.771555, 0, 0.5686275, 1, 1,
0.2159584, -0.2146032, 3.089343, 0, 0.5607843, 1, 1,
0.2163233, 0.9795679, 0.7070274, 0, 0.5568628, 1, 1,
0.2192902, 0.05098153, 2.348405, 0, 0.5490196, 1, 1,
0.2214928, -1.815839, 3.915967, 0, 0.5450981, 1, 1,
0.2231829, -0.826026, 2.651022, 0, 0.5372549, 1, 1,
0.226197, -1.453389, 2.679427, 0, 0.5333334, 1, 1,
0.2270908, -0.8973863, 2.668677, 0, 0.5254902, 1, 1,
0.2274747, -1.955973, 1.946575, 0, 0.5215687, 1, 1,
0.2340481, -0.7481039, 2.352286, 0, 0.5137255, 1, 1,
0.2341349, -0.3855196, 3.536278, 0, 0.509804, 1, 1,
0.2355376, 0.4104386, 1.211147, 0, 0.5019608, 1, 1,
0.2375887, 0.2904753, 1.397594, 0, 0.4941176, 1, 1,
0.2376921, 1.447579, 2.221391, 0, 0.4901961, 1, 1,
0.2422129, -0.141095, 2.629072, 0, 0.4823529, 1, 1,
0.2433743, -1.020226, 1.312451, 0, 0.4784314, 1, 1,
0.2448907, 0.9098795, -1.291881, 0, 0.4705882, 1, 1,
0.2469687, -1.255141, 1.796932, 0, 0.4666667, 1, 1,
0.2487616, 0.831444, 1.450547, 0, 0.4588235, 1, 1,
0.2487679, 1.027874, -0.1159669, 0, 0.454902, 1, 1,
0.2494538, -0.009778451, 0.8338836, 0, 0.4470588, 1, 1,
0.2521853, 0.05033045, 1.430505, 0, 0.4431373, 1, 1,
0.255334, 0.5761695, 1.420425, 0, 0.4352941, 1, 1,
0.2556649, -0.2382621, 2.771924, 0, 0.4313726, 1, 1,
0.257825, 0.6338758, 0.6167858, 0, 0.4235294, 1, 1,
0.261151, -0.3024687, 3.598966, 0, 0.4196078, 1, 1,
0.2614027, 0.2255891, -1.157009, 0, 0.4117647, 1, 1,
0.2677166, 1.059765, -0.8793748, 0, 0.4078431, 1, 1,
0.268586, 1.318668, 0.0186531, 0, 0.4, 1, 1,
0.2694035, 0.6409049, 0.1188139, 0, 0.3921569, 1, 1,
0.271227, -0.4456084, 2.292994, 0, 0.3882353, 1, 1,
0.2789006, 0.3890196, 1.923469, 0, 0.3803922, 1, 1,
0.2794819, -0.7963248, 3.751417, 0, 0.3764706, 1, 1,
0.2830848, -0.1350922, 1.870826, 0, 0.3686275, 1, 1,
0.2892202, -1.143963, 3.988851, 0, 0.3647059, 1, 1,
0.291333, -0.7143143, 2.869662, 0, 0.3568628, 1, 1,
0.2961732, 0.698648, -0.08293287, 0, 0.3529412, 1, 1,
0.3003217, 1.726352, 1.755413, 0, 0.345098, 1, 1,
0.3006003, -0.2912416, 2.027676, 0, 0.3411765, 1, 1,
0.3079299, 0.1316199, 2.829538, 0, 0.3333333, 1, 1,
0.3098638, 0.340445, -0.06613458, 0, 0.3294118, 1, 1,
0.3111468, -1.014257, 2.709921, 0, 0.3215686, 1, 1,
0.3129978, 0.9069586, -0.6645648, 0, 0.3176471, 1, 1,
0.3144963, 1.431262, -0.4258988, 0, 0.3098039, 1, 1,
0.3151547, -1.024764, 3.527828, 0, 0.3058824, 1, 1,
0.3159977, -0.7764093, 2.674925, 0, 0.2980392, 1, 1,
0.3167826, -1.347558, 2.162356, 0, 0.2901961, 1, 1,
0.317026, -0.5410929, 1.860184, 0, 0.2862745, 1, 1,
0.3206851, 1.087026, -0.4153434, 0, 0.2784314, 1, 1,
0.3214994, 0.8881075, -0.08251969, 0, 0.2745098, 1, 1,
0.3217083, -0.6745287, 2.280135, 0, 0.2666667, 1, 1,
0.3299218, -0.3757013, 3.208901, 0, 0.2627451, 1, 1,
0.3321154, -0.674387, 1.439384, 0, 0.254902, 1, 1,
0.3346963, 1.70501, -0.1101301, 0, 0.2509804, 1, 1,
0.3372136, 0.6632871, -0.6942728, 0, 0.2431373, 1, 1,
0.3436168, 1.121705, 0.2731708, 0, 0.2392157, 1, 1,
0.3443242, 1.574005, 0.5586843, 0, 0.2313726, 1, 1,
0.3466584, 1.023403, 3.026788, 0, 0.227451, 1, 1,
0.3472158, -0.09501108, 3.144052, 0, 0.2196078, 1, 1,
0.3475284, 0.4134307, -0.2036663, 0, 0.2156863, 1, 1,
0.3478054, -0.9556916, 3.559395, 0, 0.2078431, 1, 1,
0.3496359, 0.9925933, 1.131403, 0, 0.2039216, 1, 1,
0.3501109, 0.02882243, 3.146079, 0, 0.1960784, 1, 1,
0.3583739, -0.4462438, 3.083444, 0, 0.1882353, 1, 1,
0.3614096, -2.115988, 0.5185974, 0, 0.1843137, 1, 1,
0.3654684, 0.1503291, 2.446819, 0, 0.1764706, 1, 1,
0.3685449, -0.5420952, 1.618585, 0, 0.172549, 1, 1,
0.3761601, -1.533183, 4.12692, 0, 0.1647059, 1, 1,
0.3781994, -0.06489799, 1.182124, 0, 0.1607843, 1, 1,
0.3829026, 0.84934, 0.7651122, 0, 0.1529412, 1, 1,
0.38337, -0.07602696, 0.49534, 0, 0.1490196, 1, 1,
0.3870055, -2.104792, 2.733928, 0, 0.1411765, 1, 1,
0.3881508, 1.141, -1.620891, 0, 0.1372549, 1, 1,
0.3907051, 1.129001, -0.5865551, 0, 0.1294118, 1, 1,
0.4006532, -0.6330291, 4.694618, 0, 0.1254902, 1, 1,
0.4036976, 0.4069468, -1.394704, 0, 0.1176471, 1, 1,
0.4063783, -0.4308071, 1.906378, 0, 0.1137255, 1, 1,
0.4077205, -1.344818, 3.879168, 0, 0.1058824, 1, 1,
0.4115288, 1.089494, 0.7554814, 0, 0.09803922, 1, 1,
0.4164046, -0.4424244, 2.63611, 0, 0.09411765, 1, 1,
0.424228, -0.9340726, 3.533167, 0, 0.08627451, 1, 1,
0.4255767, 2.101275, 0.9701379, 0, 0.08235294, 1, 1,
0.4267939, 0.2173999, -0.4312408, 0, 0.07450981, 1, 1,
0.4272518, -1.752473, 2.897766, 0, 0.07058824, 1, 1,
0.4302831, 2.836073, -1.022299, 0, 0.0627451, 1, 1,
0.4344422, -0.6075609, 1.746726, 0, 0.05882353, 1, 1,
0.4356839, 0.04049468, 2.500203, 0, 0.05098039, 1, 1,
0.4368633, -0.03188576, 2.311262, 0, 0.04705882, 1, 1,
0.4423305, 0.1802132, 0.9078305, 0, 0.03921569, 1, 1,
0.4474864, -0.4879338, 3.644675, 0, 0.03529412, 1, 1,
0.4494467, -1.119089, 2.040763, 0, 0.02745098, 1, 1,
0.4602495, 0.6891043, 0.66638, 0, 0.02352941, 1, 1,
0.4603437, -0.2500457, 1.928631, 0, 0.01568628, 1, 1,
0.464904, 0.8644983, -0.2490984, 0, 0.01176471, 1, 1,
0.4682968, -0.161359, 1.839432, 0, 0.003921569, 1, 1,
0.468328, -0.06811319, 1.268118, 0.003921569, 0, 1, 1,
0.4702158, 0.9021215, -0.1583154, 0.007843138, 0, 1, 1,
0.4723801, 0.5802113, 1.162469, 0.01568628, 0, 1, 1,
0.4775977, 0.9326766, 0.7570038, 0.01960784, 0, 1, 1,
0.4813867, 0.05725648, 2.237758, 0.02745098, 0, 1, 1,
0.4846794, -0.7118083, 2.05151, 0.03137255, 0, 1, 1,
0.4865349, -0.9766957, 4.907334, 0.03921569, 0, 1, 1,
0.4870915, -1.395336, 2.557232, 0.04313726, 0, 1, 1,
0.4899697, 1.962917, 1.015774, 0.05098039, 0, 1, 1,
0.4975872, 0.374206, 1.038033, 0.05490196, 0, 1, 1,
0.4996745, 0.5051395, 2.160172, 0.0627451, 0, 1, 1,
0.4999771, -0.5477943, 2.515131, 0.06666667, 0, 1, 1,
0.5033026, -1.400076, 3.341295, 0.07450981, 0, 1, 1,
0.5088845, -0.7221624, 2.686145, 0.07843138, 0, 1, 1,
0.5097772, -2.798508, 3.985659, 0.08627451, 0, 1, 1,
0.5143871, 0.2141069, -0.2410673, 0.09019608, 0, 1, 1,
0.5159526, 0.2366807, 2.584646, 0.09803922, 0, 1, 1,
0.5190463, 2.08598, -1.981459, 0.1058824, 0, 1, 1,
0.5190997, 0.7826756, 0.9969164, 0.1098039, 0, 1, 1,
0.5226393, 0.5240074, 1.945184, 0.1176471, 0, 1, 1,
0.5306088, -0.4372776, 1.038561, 0.1215686, 0, 1, 1,
0.5327008, -0.6934353, 3.235025, 0.1294118, 0, 1, 1,
0.5420871, 0.7020308, 0.6547713, 0.1333333, 0, 1, 1,
0.5428885, -0.002428222, 3.170898, 0.1411765, 0, 1, 1,
0.5467071, 0.5021907, 1.752618, 0.145098, 0, 1, 1,
0.55269, -1.654887, 3.342633, 0.1529412, 0, 1, 1,
0.5558357, 0.9621248, -0.4955156, 0.1568628, 0, 1, 1,
0.556188, 1.359194, -0.2283879, 0.1647059, 0, 1, 1,
0.5578273, -1.232945, 3.267347, 0.1686275, 0, 1, 1,
0.5582715, -0.5642872, 1.806355, 0.1764706, 0, 1, 1,
0.5583925, 1.92139, 1.182379, 0.1803922, 0, 1, 1,
0.5595396, -0.4254432, 4.187071, 0.1882353, 0, 1, 1,
0.5616229, 0.1807336, -0.01409221, 0.1921569, 0, 1, 1,
0.5671623, -1.113711, 2.863386, 0.2, 0, 1, 1,
0.5694517, 0.2879766, 0.2975583, 0.2078431, 0, 1, 1,
0.5706686, -0.1813873, 1.670025, 0.2117647, 0, 1, 1,
0.5725266, 0.3334376, 0.5720978, 0.2196078, 0, 1, 1,
0.5748331, 0.5895289, 1.710403, 0.2235294, 0, 1, 1,
0.5776406, 0.5699576, 1.865489, 0.2313726, 0, 1, 1,
0.5829726, 0.8487155, 1.373852, 0.2352941, 0, 1, 1,
0.5847565, -0.2559502, 2.305043, 0.2431373, 0, 1, 1,
0.5862179, 0.6217684, -0.2994023, 0.2470588, 0, 1, 1,
0.5933968, -1.095336, 3.263783, 0.254902, 0, 1, 1,
0.5962666, -0.6146472, 4.930468, 0.2588235, 0, 1, 1,
0.5972264, -0.6027957, 2.185225, 0.2666667, 0, 1, 1,
0.5978395, -1.84067, 3.835911, 0.2705882, 0, 1, 1,
0.6020171, -0.8384999, 1.928001, 0.2784314, 0, 1, 1,
0.6034804, -0.2124727, 1.598243, 0.282353, 0, 1, 1,
0.6084331, -0.3076324, 1.879856, 0.2901961, 0, 1, 1,
0.6098462, -0.2207396, 2.077357, 0.2941177, 0, 1, 1,
0.6187705, 0.8930495, 1.180549, 0.3019608, 0, 1, 1,
0.6212329, 0.8396247, 0.5336183, 0.3098039, 0, 1, 1,
0.6234117, -0.1495891, 2.469632, 0.3137255, 0, 1, 1,
0.6294379, 0.5303466, 2.316268, 0.3215686, 0, 1, 1,
0.6379566, -0.2954097, 2.248773, 0.3254902, 0, 1, 1,
0.6384073, -0.2977943, 1.794146, 0.3333333, 0, 1, 1,
0.6405025, 0.9627742, 2.170017, 0.3372549, 0, 1, 1,
0.6409938, -0.8841347, 2.625827, 0.345098, 0, 1, 1,
0.6412138, 0.5465475, 0.5184553, 0.3490196, 0, 1, 1,
0.6463096, 0.6089562, 0.04179898, 0.3568628, 0, 1, 1,
0.6492881, 0.6933498, 1.592246, 0.3607843, 0, 1, 1,
0.6497977, 1.102358, -1.531062, 0.3686275, 0, 1, 1,
0.6539775, -0.4617038, 3.871562, 0.372549, 0, 1, 1,
0.6573308, 0.03006318, 2.945699, 0.3803922, 0, 1, 1,
0.6684548, -1.201365, 1.674986, 0.3843137, 0, 1, 1,
0.6703993, -1.413936, 2.609921, 0.3921569, 0, 1, 1,
0.673938, -0.5989916, 2.566137, 0.3960784, 0, 1, 1,
0.6752266, 1.257488, 0.1205848, 0.4039216, 0, 1, 1,
0.6798729, 1.195992, -0.2169973, 0.4117647, 0, 1, 1,
0.6833086, -0.8700898, 1.270928, 0.4156863, 0, 1, 1,
0.6880655, 2.03589, 0.6848595, 0.4235294, 0, 1, 1,
0.6928104, 0.8199051, 0.9829922, 0.427451, 0, 1, 1,
0.6938292, -1.219917, 3.111872, 0.4352941, 0, 1, 1,
0.6944853, 1.201145, 1.330496, 0.4392157, 0, 1, 1,
0.6977993, 2.515982, 0.1519805, 0.4470588, 0, 1, 1,
0.7023605, -0.863583, 2.561604, 0.4509804, 0, 1, 1,
0.7024684, 0.9119199, 0.4721532, 0.4588235, 0, 1, 1,
0.7051758, 0.3202083, 1.700247, 0.4627451, 0, 1, 1,
0.7071748, -0.9292954, 1.857541, 0.4705882, 0, 1, 1,
0.7087305, -0.1816676, 2.531795, 0.4745098, 0, 1, 1,
0.7176634, -0.5198833, 1.793078, 0.4823529, 0, 1, 1,
0.7202161, 1.847253, 2.031111, 0.4862745, 0, 1, 1,
0.720893, -0.6621059, 1.618697, 0.4941176, 0, 1, 1,
0.7241704, -0.57305, 2.727081, 0.5019608, 0, 1, 1,
0.7243054, 0.4608707, 0.3767322, 0.5058824, 0, 1, 1,
0.7278557, -1.043278, 1.673611, 0.5137255, 0, 1, 1,
0.7301884, -0.2103008, 2.490037, 0.5176471, 0, 1, 1,
0.7314159, 0.8719347, 1.024543, 0.5254902, 0, 1, 1,
0.7388097, 1.382916, 1.063153, 0.5294118, 0, 1, 1,
0.7425088, 1.95905, 1.625561, 0.5372549, 0, 1, 1,
0.7468312, 0.09980829, 0.8270252, 0.5411765, 0, 1, 1,
0.7532859, 1.552774, 1.469425, 0.5490196, 0, 1, 1,
0.7561495, -1.159219, 2.849283, 0.5529412, 0, 1, 1,
0.7566963, 0.4861984, 2.025155, 0.5607843, 0, 1, 1,
0.7573417, 0.3624793, -0.2791004, 0.5647059, 0, 1, 1,
0.7578483, -0.517794, 3.215484, 0.572549, 0, 1, 1,
0.7586225, 0.0551031, 1.163486, 0.5764706, 0, 1, 1,
0.7606474, 0.2620985, 1.41941, 0.5843138, 0, 1, 1,
0.7627897, -1.204901, 3.117412, 0.5882353, 0, 1, 1,
0.7652277, -0.3398803, 1.685764, 0.5960785, 0, 1, 1,
0.7689497, -0.4407037, 3.150749, 0.6039216, 0, 1, 1,
0.7788837, -0.8022234, 3.831819, 0.6078432, 0, 1, 1,
0.782303, 0.516849, 0.7363696, 0.6156863, 0, 1, 1,
0.7828985, 1.361531, 1.330331, 0.6196079, 0, 1, 1,
0.7873853, -2.507253, 4.341777, 0.627451, 0, 1, 1,
0.7972585, -0.6519322, 3.063185, 0.6313726, 0, 1, 1,
0.8001943, 1.421974, 1.1592, 0.6392157, 0, 1, 1,
0.8026878, 0.7504455, 0.8634472, 0.6431373, 0, 1, 1,
0.8041169, -0.05909846, 0.4114816, 0.6509804, 0, 1, 1,
0.804534, -0.9907422, 3.099245, 0.654902, 0, 1, 1,
0.8083903, 0.02623376, 0.4604872, 0.6627451, 0, 1, 1,
0.8097778, -0.06178693, 1.802574, 0.6666667, 0, 1, 1,
0.8128772, 1.571846, 0.005862145, 0.6745098, 0, 1, 1,
0.8147467, -0.4702931, 1.01645, 0.6784314, 0, 1, 1,
0.8149701, 0.1974788, 1.902771, 0.6862745, 0, 1, 1,
0.8192506, -0.9662521, 2.975255, 0.6901961, 0, 1, 1,
0.8249964, -0.1119744, 1.286606, 0.6980392, 0, 1, 1,
0.8302516, 2.504927, -0.7172171, 0.7058824, 0, 1, 1,
0.8303109, 1.624475, 0.9729745, 0.7098039, 0, 1, 1,
0.8316767, -0.09216253, 1.919657, 0.7176471, 0, 1, 1,
0.83198, 1.409349, 0.08529709, 0.7215686, 0, 1, 1,
0.8388646, 1.321744, 1.498633, 0.7294118, 0, 1, 1,
0.8392422, 0.6502884, -0.5787637, 0.7333333, 0, 1, 1,
0.839848, -0.9183987, 3.548773, 0.7411765, 0, 1, 1,
0.8424558, -0.8961354, 3.860793, 0.7450981, 0, 1, 1,
0.8443995, 0.9554287, 1.854902, 0.7529412, 0, 1, 1,
0.8452536, 0.3073874, 1.30894, 0.7568628, 0, 1, 1,
0.8461882, -0.4356104, 2.569488, 0.7647059, 0, 1, 1,
0.8477462, 1.207948, 0.3488778, 0.7686275, 0, 1, 1,
0.8485528, 1.045319, 1.578846, 0.7764706, 0, 1, 1,
0.850153, 0.5961913, 2.858732, 0.7803922, 0, 1, 1,
0.8539922, 2.24471, 1.181588, 0.7882353, 0, 1, 1,
0.8677533, 0.1389576, 0.754318, 0.7921569, 0, 1, 1,
0.87089, -0.7523428, 2.582637, 0.8, 0, 1, 1,
0.8731068, -0.3276994, 0.6909995, 0.8078431, 0, 1, 1,
0.8748187, 1.558225, 0.1641634, 0.8117647, 0, 1, 1,
0.8765336, 0.4283835, 1.017294, 0.8196079, 0, 1, 1,
0.8837488, -0.5380345, 2.27352, 0.8235294, 0, 1, 1,
0.8884357, -0.8443552, 2.952392, 0.8313726, 0, 1, 1,
0.8888687, -0.4456801, 3.279833, 0.8352941, 0, 1, 1,
0.8965691, 0.1154111, 3.069717, 0.8431373, 0, 1, 1,
0.9058923, 0.2317202, -0.3683818, 0.8470588, 0, 1, 1,
0.9074151, 0.3881514, 0.6633357, 0.854902, 0, 1, 1,
0.9078408, -0.2234917, 2.080846, 0.8588235, 0, 1, 1,
0.9132904, -0.4525035, 1.258331, 0.8666667, 0, 1, 1,
0.9144941, 1.060732, 2.008018, 0.8705882, 0, 1, 1,
0.9151334, 0.3414123, 1.168017, 0.8784314, 0, 1, 1,
0.9190478, 1.610958, 0.8425375, 0.8823529, 0, 1, 1,
0.9291757, 0.7058913, 1.088906, 0.8901961, 0, 1, 1,
0.9303126, 0.7315357, 1.163336, 0.8941177, 0, 1, 1,
0.9417516, 0.1905682, 0.5985644, 0.9019608, 0, 1, 1,
0.9476657, -0.7504615, 2.229851, 0.9098039, 0, 1, 1,
0.948847, 0.1223448, 3.996471, 0.9137255, 0, 1, 1,
0.9518121, 1.210157, -0.2575512, 0.9215686, 0, 1, 1,
0.9518127, 0.968909, -0.1966052, 0.9254902, 0, 1, 1,
0.9528804, -1.070403, 1.969144, 0.9333333, 0, 1, 1,
0.9544151, -0.2160598, 1.138457, 0.9372549, 0, 1, 1,
0.9570329, 0.9316362, 0.1673032, 0.945098, 0, 1, 1,
0.9583868, -0.03613846, 2.284406, 0.9490196, 0, 1, 1,
0.9661185, -0.4277923, 3.019428, 0.9568627, 0, 1, 1,
0.9704354, 2.327414, -0.7357425, 0.9607843, 0, 1, 1,
0.9753844, -0.1809167, 2.457991, 0.9686275, 0, 1, 1,
0.9794282, 0.03797477, 1.52438, 0.972549, 0, 1, 1,
0.9814177, 0.1836911, 1.956021, 0.9803922, 0, 1, 1,
0.9842892, 0.008547836, 2.126441, 0.9843137, 0, 1, 1,
0.9938135, 1.335614, 1.198434, 0.9921569, 0, 1, 1,
0.9990658, 0.7979808, 1.67196, 0.9960784, 0, 1, 1,
1.007185, -0.3051845, 3.170496, 1, 0, 0.9960784, 1,
1.007256, 0.389915, 1.554253, 1, 0, 0.9882353, 1,
1.011062, 0.08703339, 2.329173, 1, 0, 0.9843137, 1,
1.012643, 0.3341275, 0.7744412, 1, 0, 0.9764706, 1,
1.013153, 1.317765, -0.2927862, 1, 0, 0.972549, 1,
1.015059, -0.7049063, 2.618429, 1, 0, 0.9647059, 1,
1.01821, -0.9698539, 1.683006, 1, 0, 0.9607843, 1,
1.019641, 1.151532, -1.417809, 1, 0, 0.9529412, 1,
1.022021, -0.04384519, 2.246051, 1, 0, 0.9490196, 1,
1.022421, 1.724227, 1.732502, 1, 0, 0.9411765, 1,
1.024521, 0.3428831, 0.3538455, 1, 0, 0.9372549, 1,
1.026053, -0.3422856, 1.178815, 1, 0, 0.9294118, 1,
1.029013, -1.229129, 3.767163, 1, 0, 0.9254902, 1,
1.03028, -1.195502, 2.104113, 1, 0, 0.9176471, 1,
1.033213, -0.7777532, 2.213282, 1, 0, 0.9137255, 1,
1.046084, -2.512482, 2.102565, 1, 0, 0.9058824, 1,
1.050174, 2.02736, 1.406745, 1, 0, 0.9019608, 1,
1.053928, 0.4468909, 0.700455, 1, 0, 0.8941177, 1,
1.057833, 0.08084421, 2.797017, 1, 0, 0.8862745, 1,
1.068074, 1.290284, -1.145733, 1, 0, 0.8823529, 1,
1.070809, 0.1285771, 2.639235, 1, 0, 0.8745098, 1,
1.074491, 1.198521, 1.48413, 1, 0, 0.8705882, 1,
1.07542, -2.156422, 2.839529, 1, 0, 0.8627451, 1,
1.090292, -0.5164533, 2.019652, 1, 0, 0.8588235, 1,
1.090643, -0.8140293, 1.021346, 1, 0, 0.8509804, 1,
1.101887, -0.7602265, 1.77517, 1, 0, 0.8470588, 1,
1.105014, -0.8707228, 3.888104, 1, 0, 0.8392157, 1,
1.105187, 2.74611, 0.08687193, 1, 0, 0.8352941, 1,
1.105876, -0.1522236, 2.785957, 1, 0, 0.827451, 1,
1.109392, 0.1925099, 2.826226, 1, 0, 0.8235294, 1,
1.109443, 0.86795, 0.2323137, 1, 0, 0.8156863, 1,
1.109728, -1.875567, 3.008602, 1, 0, 0.8117647, 1,
1.112043, 0.9597741, 1.241841, 1, 0, 0.8039216, 1,
1.112919, -1.328624, 0.2368991, 1, 0, 0.7960784, 1,
1.113754, 1.547168, 0.08239902, 1, 0, 0.7921569, 1,
1.120693, -0.7413315, 3.754159, 1, 0, 0.7843137, 1,
1.121877, 0.6855038, 2.0215, 1, 0, 0.7803922, 1,
1.126075, 0.2004845, 1.921866, 1, 0, 0.772549, 1,
1.145882, -0.05987885, 3.213338, 1, 0, 0.7686275, 1,
1.150237, 2.43271, -0.02258795, 1, 0, 0.7607843, 1,
1.156557, 0.916792, 2.1862, 1, 0, 0.7568628, 1,
1.157538, 1.389342, 0.7675622, 1, 0, 0.7490196, 1,
1.164611, -0.2511494, 1.418952, 1, 0, 0.7450981, 1,
1.179454, -0.9973722, 2.176798, 1, 0, 0.7372549, 1,
1.180492, -0.3760303, 1.09533, 1, 0, 0.7333333, 1,
1.181509, -0.1610958, 1.517987, 1, 0, 0.7254902, 1,
1.181818, 0.347405, 0.8746011, 1, 0, 0.7215686, 1,
1.191058, -0.207706, 2.908314, 1, 0, 0.7137255, 1,
1.193727, -0.446698, 1.440075, 1, 0, 0.7098039, 1,
1.19574, 0.2244751, 1.66569, 1, 0, 0.7019608, 1,
1.199869, -0.254916, 2.43228, 1, 0, 0.6941177, 1,
1.201492, -0.7800661, 1.688751, 1, 0, 0.6901961, 1,
1.204494, 2.103433, 0.8869836, 1, 0, 0.682353, 1,
1.207714, -1.651647, 0.638831, 1, 0, 0.6784314, 1,
1.208359, -0.1707737, 2.018855, 1, 0, 0.6705883, 1,
1.209577, 0.7131183, 0.3613856, 1, 0, 0.6666667, 1,
1.210881, -0.8100196, 3.749748, 1, 0, 0.6588235, 1,
1.218611, -0.2203513, 1.574351, 1, 0, 0.654902, 1,
1.222714, 0.1661595, -0.04266593, 1, 0, 0.6470588, 1,
1.226483, 0.970934, 0.3409328, 1, 0, 0.6431373, 1,
1.229033, 0.7444173, 0.8917506, 1, 0, 0.6352941, 1,
1.233439, 0.2532176, 0.9146953, 1, 0, 0.6313726, 1,
1.234441, -0.6043642, 1.767167, 1, 0, 0.6235294, 1,
1.243705, 1.363256, 0.004422211, 1, 0, 0.6196079, 1,
1.253784, 1.541939, 0.6552245, 1, 0, 0.6117647, 1,
1.258512, -0.9782712, 3.065947, 1, 0, 0.6078432, 1,
1.263571, -0.2990574, 2.315376, 1, 0, 0.6, 1,
1.276924, -1.537093, 0.5548811, 1, 0, 0.5921569, 1,
1.283015, -0.5046421, 3.438773, 1, 0, 0.5882353, 1,
1.284353, -0.8678145, 2.070137, 1, 0, 0.5803922, 1,
1.285692, -1.309348, -0.7133309, 1, 0, 0.5764706, 1,
1.286057, -1.33462, 0.960286, 1, 0, 0.5686275, 1,
1.297107, 0.2362131, 1.465689, 1, 0, 0.5647059, 1,
1.305737, -0.6147268, 2.540868, 1, 0, 0.5568628, 1,
1.307348, -0.2256237, 1.468407, 1, 0, 0.5529412, 1,
1.312814, -0.2097654, 2.390445, 1, 0, 0.5450981, 1,
1.313252, -2.429884, 1.824804, 1, 0, 0.5411765, 1,
1.322615, -1.020663, 1.755299, 1, 0, 0.5333334, 1,
1.333013, 1.179976, 2.204199, 1, 0, 0.5294118, 1,
1.364538, 0.2153388, 2.826533, 1, 0, 0.5215687, 1,
1.365472, 0.3351018, 2.002412, 1, 0, 0.5176471, 1,
1.365487, -0.2148885, 0.5839849, 1, 0, 0.509804, 1,
1.37934, 1.081429, 1.590059, 1, 0, 0.5058824, 1,
1.381107, -0.05226908, 2.011442, 1, 0, 0.4980392, 1,
1.395852, 0.388681, 0.4403349, 1, 0, 0.4901961, 1,
1.401494, 0.4266923, 0.9206014, 1, 0, 0.4862745, 1,
1.401528, -0.02308493, 1.834142, 1, 0, 0.4784314, 1,
1.428473, -0.8714224, 2.165431, 1, 0, 0.4745098, 1,
1.443806, -0.9508279, 2.846233, 1, 0, 0.4666667, 1,
1.457944, -1.636036, 2.656305, 1, 0, 0.4627451, 1,
1.459072, 0.5366067, 1.05858, 1, 0, 0.454902, 1,
1.459314, 1.61313, 1.038149, 1, 0, 0.4509804, 1,
1.467519, -0.9743441, 1.621357, 1, 0, 0.4431373, 1,
1.480395, 0.2893215, 2.858875, 1, 0, 0.4392157, 1,
1.484079, 1.281648, 0.08252537, 1, 0, 0.4313726, 1,
1.489323, 0.06661823, 2.547782, 1, 0, 0.427451, 1,
1.49651, 0.924677, 2.613983, 1, 0, 0.4196078, 1,
1.501653, 1.321578, 1.679234, 1, 0, 0.4156863, 1,
1.510915, -0.09032161, 2.661407, 1, 0, 0.4078431, 1,
1.527283, 1.221415, 1.032147, 1, 0, 0.4039216, 1,
1.535677, -0.8715547, 0.9660415, 1, 0, 0.3960784, 1,
1.543189, -0.1012863, 3.028728, 1, 0, 0.3882353, 1,
1.543214, 0.8034278, 0.8787259, 1, 0, 0.3843137, 1,
1.550402, 2.351705, 0.6669324, 1, 0, 0.3764706, 1,
1.552477, -0.7715785, 2.041257, 1, 0, 0.372549, 1,
1.552692, 0.03280448, 1.287226, 1, 0, 0.3647059, 1,
1.556366, 0.8299431, 1.883762, 1, 0, 0.3607843, 1,
1.556837, 0.3127957, -0.363325, 1, 0, 0.3529412, 1,
1.556911, 0.9451975, 0.8886153, 1, 0, 0.3490196, 1,
1.560388, -0.5128137, 1.704674, 1, 0, 0.3411765, 1,
1.586542, 0.1963695, 1.228003, 1, 0, 0.3372549, 1,
1.599467, 0.8599179, 0.7891749, 1, 0, 0.3294118, 1,
1.602946, 1.27993, 1.476797, 1, 0, 0.3254902, 1,
1.611135, 0.2613751, 0.06086602, 1, 0, 0.3176471, 1,
1.633046, -0.1914215, 1.499363, 1, 0, 0.3137255, 1,
1.642858, -0.2861561, 0.6917096, 1, 0, 0.3058824, 1,
1.651686, 0.7110766, 1.0361, 1, 0, 0.2980392, 1,
1.661506, -0.2539344, 3.677206, 1, 0, 0.2941177, 1,
1.677644, -0.209703, 1.095001, 1, 0, 0.2862745, 1,
1.680634, 2.096437, 1.981767, 1, 0, 0.282353, 1,
1.689702, 1.171221, 1.842651, 1, 0, 0.2745098, 1,
1.696718, 0.1381279, 0.5709829, 1, 0, 0.2705882, 1,
1.707044, 1.250222, -0.3660051, 1, 0, 0.2627451, 1,
1.708351, 2.797812, 0.217042, 1, 0, 0.2588235, 1,
1.710788, 0.9893389, 0.6163574, 1, 0, 0.2509804, 1,
1.738003, -0.5787127, 2.00141, 1, 0, 0.2470588, 1,
1.739613, -0.2724727, 2.921964, 1, 0, 0.2392157, 1,
1.741151, 0.04997847, 0.937284, 1, 0, 0.2352941, 1,
1.747433, -0.6766741, 1.541194, 1, 0, 0.227451, 1,
1.760189, 0.5289744, 0.8217193, 1, 0, 0.2235294, 1,
1.767302, -1.063351, 3.761234, 1, 0, 0.2156863, 1,
1.768062, 0.198613, 3.110021, 1, 0, 0.2117647, 1,
1.771926, -0.4184858, 1.300102, 1, 0, 0.2039216, 1,
1.773822, 0.06905725, 1.440548, 1, 0, 0.1960784, 1,
1.795078, 0.2228531, 2.85852, 1, 0, 0.1921569, 1,
1.797775, -2.841226, 1.780596, 1, 0, 0.1843137, 1,
1.851202, -1.445539, 2.91716, 1, 0, 0.1803922, 1,
1.885985, -0.1367565, 1.592405, 1, 0, 0.172549, 1,
1.90826, 0.974925, 0.842879, 1, 0, 0.1686275, 1,
1.91388, 1.46685, 0.7023823, 1, 0, 0.1607843, 1,
1.939344, -1.846058, 1.610281, 1, 0, 0.1568628, 1,
1.987746, -0.9450375, 2.35286, 1, 0, 0.1490196, 1,
2.012674, 0.9505157, 0.9957486, 1, 0, 0.145098, 1,
2.020386, -1.647043, 4.340846, 1, 0, 0.1372549, 1,
2.021109, -0.1451086, 1.72966, 1, 0, 0.1333333, 1,
2.028396, 0.7063024, 1.106487, 1, 0, 0.1254902, 1,
2.028962, -1.076301, 1.292895, 1, 0, 0.1215686, 1,
2.042242, -1.122455, 3.90004, 1, 0, 0.1137255, 1,
2.12294, 1.129131, 2.076488, 1, 0, 0.1098039, 1,
2.137808, 0.04200668, 0.6904975, 1, 0, 0.1019608, 1,
2.142795, -0.11238, 3.126966, 1, 0, 0.09411765, 1,
2.205606, 0.5445794, 1.323502, 1, 0, 0.09019608, 1,
2.206894, -1.298756, 3.923782, 1, 0, 0.08235294, 1,
2.212087, 1.205585, 0.7334016, 1, 0, 0.07843138, 1,
2.212331, 2.021061, 0.1304562, 1, 0, 0.07058824, 1,
2.218861, 0.6909773, 0.807294, 1, 0, 0.06666667, 1,
2.235807, -0.8182951, 1.497741, 1, 0, 0.05882353, 1,
2.261465, -0.8062571, 1.910643, 1, 0, 0.05490196, 1,
2.319394, 0.2631818, 2.044159, 1, 0, 0.04705882, 1,
2.320209, -0.5519202, 0.7669529, 1, 0, 0.04313726, 1,
2.338788, 1.572836, 0.5529597, 1, 0, 0.03529412, 1,
2.35042, 1.992846, 1.632661, 1, 0, 0.03137255, 1,
2.369271, -0.7332802, 0.4271104, 1, 0, 0.02352941, 1,
2.370599, -1.663404, 2.115391, 1, 0, 0.01960784, 1,
2.454002, -0.98077, 1.607201, 1, 0, 0.01176471, 1,
2.902046, 0.1525478, 0.5337425, 1, 0, 0.007843138, 1
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
-0.1936547, -3.839821, -6.499382, 0, -0.5, 0.5, 0.5,
-0.1936547, -3.839821, -6.499382, 1, -0.5, 0.5, 0.5,
-0.1936547, -3.839821, -6.499382, 1, 1.5, 0.5, 0.5,
-0.1936547, -3.839821, -6.499382, 0, 1.5, 0.5, 0.5
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
-4.338799, -0.01809287, -6.499382, 0, -0.5, 0.5, 0.5,
-4.338799, -0.01809287, -6.499382, 1, -0.5, 0.5, 0.5,
-4.338799, -0.01809287, -6.499382, 1, 1.5, 0.5, 0.5,
-4.338799, -0.01809287, -6.499382, 0, 1.5, 0.5, 0.5
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
-4.338799, -3.839821, 0.4827526, 0, -0.5, 0.5, 0.5,
-4.338799, -3.839821, 0.4827526, 1, -0.5, 0.5, 0.5,
-4.338799, -3.839821, 0.4827526, 1, 1.5, 0.5, 0.5,
-4.338799, -3.839821, 0.4827526, 0, 1.5, 0.5, 0.5
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
-3, -2.957883, -4.88812,
2, -2.957883, -4.88812,
-3, -2.957883, -4.88812,
-3, -3.104873, -5.156664,
-2, -2.957883, -4.88812,
-2, -3.104873, -5.156664,
-1, -2.957883, -4.88812,
-1, -3.104873, -5.156664,
0, -2.957883, -4.88812,
0, -3.104873, -5.156664,
1, -2.957883, -4.88812,
1, -3.104873, -5.156664,
2, -2.957883, -4.88812,
2, -3.104873, -5.156664
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
-3, -3.398852, -5.693751, 0, -0.5, 0.5, 0.5,
-3, -3.398852, -5.693751, 1, -0.5, 0.5, 0.5,
-3, -3.398852, -5.693751, 1, 1.5, 0.5, 0.5,
-3, -3.398852, -5.693751, 0, 1.5, 0.5, 0.5,
-2, -3.398852, -5.693751, 0, -0.5, 0.5, 0.5,
-2, -3.398852, -5.693751, 1, -0.5, 0.5, 0.5,
-2, -3.398852, -5.693751, 1, 1.5, 0.5, 0.5,
-2, -3.398852, -5.693751, 0, 1.5, 0.5, 0.5,
-1, -3.398852, -5.693751, 0, -0.5, 0.5, 0.5,
-1, -3.398852, -5.693751, 1, -0.5, 0.5, 0.5,
-1, -3.398852, -5.693751, 1, 1.5, 0.5, 0.5,
-1, -3.398852, -5.693751, 0, 1.5, 0.5, 0.5,
0, -3.398852, -5.693751, 0, -0.5, 0.5, 0.5,
0, -3.398852, -5.693751, 1, -0.5, 0.5, 0.5,
0, -3.398852, -5.693751, 1, 1.5, 0.5, 0.5,
0, -3.398852, -5.693751, 0, 1.5, 0.5, 0.5,
1, -3.398852, -5.693751, 0, -0.5, 0.5, 0.5,
1, -3.398852, -5.693751, 1, -0.5, 0.5, 0.5,
1, -3.398852, -5.693751, 1, 1.5, 0.5, 0.5,
1, -3.398852, -5.693751, 0, 1.5, 0.5, 0.5,
2, -3.398852, -5.693751, 0, -0.5, 0.5, 0.5,
2, -3.398852, -5.693751, 1, -0.5, 0.5, 0.5,
2, -3.398852, -5.693751, 1, 1.5, 0.5, 0.5,
2, -3.398852, -5.693751, 0, 1.5, 0.5, 0.5
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
-3.382227, -2, -4.88812,
-3.382227, 2, -4.88812,
-3.382227, -2, -4.88812,
-3.541655, -2, -5.156664,
-3.382227, -1, -4.88812,
-3.541655, -1, -5.156664,
-3.382227, 0, -4.88812,
-3.541655, 0, -5.156664,
-3.382227, 1, -4.88812,
-3.541655, 1, -5.156664,
-3.382227, 2, -4.88812,
-3.541655, 2, -5.156664
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
-3.860512, -2, -5.693751, 0, -0.5, 0.5, 0.5,
-3.860512, -2, -5.693751, 1, -0.5, 0.5, 0.5,
-3.860512, -2, -5.693751, 1, 1.5, 0.5, 0.5,
-3.860512, -2, -5.693751, 0, 1.5, 0.5, 0.5,
-3.860512, -1, -5.693751, 0, -0.5, 0.5, 0.5,
-3.860512, -1, -5.693751, 1, -0.5, 0.5, 0.5,
-3.860512, -1, -5.693751, 1, 1.5, 0.5, 0.5,
-3.860512, -1, -5.693751, 0, 1.5, 0.5, 0.5,
-3.860512, 0, -5.693751, 0, -0.5, 0.5, 0.5,
-3.860512, 0, -5.693751, 1, -0.5, 0.5, 0.5,
-3.860512, 0, -5.693751, 1, 1.5, 0.5, 0.5,
-3.860512, 0, -5.693751, 0, 1.5, 0.5, 0.5,
-3.860512, 1, -5.693751, 0, -0.5, 0.5, 0.5,
-3.860512, 1, -5.693751, 1, -0.5, 0.5, 0.5,
-3.860512, 1, -5.693751, 1, 1.5, 0.5, 0.5,
-3.860512, 1, -5.693751, 0, 1.5, 0.5, 0.5,
-3.860512, 2, -5.693751, 0, -0.5, 0.5, 0.5,
-3.860512, 2, -5.693751, 1, -0.5, 0.5, 0.5,
-3.860512, 2, -5.693751, 1, 1.5, 0.5, 0.5,
-3.860512, 2, -5.693751, 0, 1.5, 0.5, 0.5
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
-3.382227, -2.957883, -4,
-3.382227, -2.957883, 4,
-3.382227, -2.957883, -4,
-3.541655, -3.104873, -4,
-3.382227, -2.957883, -2,
-3.541655, -3.104873, -2,
-3.382227, -2.957883, 0,
-3.541655, -3.104873, 0,
-3.382227, -2.957883, 2,
-3.541655, -3.104873, 2,
-3.382227, -2.957883, 4,
-3.541655, -3.104873, 4
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
-3.860512, -3.398852, -4, 0, -0.5, 0.5, 0.5,
-3.860512, -3.398852, -4, 1, -0.5, 0.5, 0.5,
-3.860512, -3.398852, -4, 1, 1.5, 0.5, 0.5,
-3.860512, -3.398852, -4, 0, 1.5, 0.5, 0.5,
-3.860512, -3.398852, -2, 0, -0.5, 0.5, 0.5,
-3.860512, -3.398852, -2, 1, -0.5, 0.5, 0.5,
-3.860512, -3.398852, -2, 1, 1.5, 0.5, 0.5,
-3.860512, -3.398852, -2, 0, 1.5, 0.5, 0.5,
-3.860512, -3.398852, 0, 0, -0.5, 0.5, 0.5,
-3.860512, -3.398852, 0, 1, -0.5, 0.5, 0.5,
-3.860512, -3.398852, 0, 1, 1.5, 0.5, 0.5,
-3.860512, -3.398852, 0, 0, 1.5, 0.5, 0.5,
-3.860512, -3.398852, 2, 0, -0.5, 0.5, 0.5,
-3.860512, -3.398852, 2, 1, -0.5, 0.5, 0.5,
-3.860512, -3.398852, 2, 1, 1.5, 0.5, 0.5,
-3.860512, -3.398852, 2, 0, 1.5, 0.5, 0.5,
-3.860512, -3.398852, 4, 0, -0.5, 0.5, 0.5,
-3.860512, -3.398852, 4, 1, -0.5, 0.5, 0.5,
-3.860512, -3.398852, 4, 1, 1.5, 0.5, 0.5,
-3.860512, -3.398852, 4, 0, 1.5, 0.5, 0.5
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
-3.382227, -2.957883, -4.88812,
-3.382227, 2.921698, -4.88812,
-3.382227, -2.957883, 5.853625,
-3.382227, 2.921698, 5.853625,
-3.382227, -2.957883, -4.88812,
-3.382227, -2.957883, 5.853625,
-3.382227, 2.921698, -4.88812,
-3.382227, 2.921698, 5.853625,
-3.382227, -2.957883, -4.88812,
2.994917, -2.957883, -4.88812,
-3.382227, -2.957883, 5.853625,
2.994917, -2.957883, 5.853625,
-3.382227, 2.921698, -4.88812,
2.994917, 2.921698, -4.88812,
-3.382227, 2.921698, 5.853625,
2.994917, 2.921698, 5.853625,
2.994917, -2.957883, -4.88812,
2.994917, 2.921698, -4.88812,
2.994917, -2.957883, 5.853625,
2.994917, 2.921698, 5.853625,
2.994917, -2.957883, -4.88812,
2.994917, -2.957883, 5.853625,
2.994917, 2.921698, -4.88812,
2.994917, 2.921698, 5.853625
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
var radius = 7.372463;
var distance = 32.80092;
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
mvMatrix.translate( 0.1936547, 0.01809287, -0.4827526 );
mvMatrix.scale( 1.249972, 1.355752, 0.7420816 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.80092);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Phenacetin<-read.table("Phenacetin.xyz")
```

```
## Error in read.table("Phenacetin.xyz"): no lines available in input
```

```r
x<-Phenacetin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenacetin' not found
```

```r
y<-Phenacetin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenacetin' not found
```

```r
z<-Phenacetin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenacetin' not found
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
-3.289356, 1.426827, -1.66453, 0, 0, 1, 1, 1,
-2.585397, -0.3148925, -1.086398, 1, 0, 0, 1, 1,
-2.570095, -0.3669561, -1.472157, 1, 0, 0, 1, 1,
-2.483672, 0.8795705, -2.247793, 1, 0, 0, 1, 1,
-2.469284, 0.6485065, -0.1844849, 1, 0, 0, 1, 1,
-2.451823, 0.3479425, -1.465868, 1, 0, 0, 1, 1,
-2.426374, -0.09062735, -1.477122, 0, 0, 0, 1, 1,
-2.33118, -0.8496146, -1.347385, 0, 0, 0, 1, 1,
-2.320507, -0.2927184, -2.39177, 0, 0, 0, 1, 1,
-2.292513, 0.2296534, -1.540888, 0, 0, 0, 1, 1,
-2.172972, 0.121149, -1.894415, 0, 0, 0, 1, 1,
-2.112763, -0.7759631, -3.462449, 0, 0, 0, 1, 1,
-2.106531, -0.2675547, -2.224175, 0, 0, 0, 1, 1,
-2.082913, 1.288912, -0.8926518, 1, 1, 1, 1, 1,
-2.054928, 0.4903614, -0.3148542, 1, 1, 1, 1, 1,
-2.051507, 0.2605999, -1.738199, 1, 1, 1, 1, 1,
-2.049003, 0.1576149, -0.9115307, 1, 1, 1, 1, 1,
-1.989891, -1.503295, -0.9673406, 1, 1, 1, 1, 1,
-1.985926, -0.2691775, -1.86583, 1, 1, 1, 1, 1,
-1.949229, 1.15096, -1.084095, 1, 1, 1, 1, 1,
-1.929711, 0.5977727, -1.349937, 1, 1, 1, 1, 1,
-1.885566, -0.3598354, -0.8280649, 1, 1, 1, 1, 1,
-1.864905, -0.01183874, -2.059061, 1, 1, 1, 1, 1,
-1.860941, -0.2932441, -1.573113, 1, 1, 1, 1, 1,
-1.852868, -0.8318415, -2.891304, 1, 1, 1, 1, 1,
-1.852328, 1.618888, -1.709687, 1, 1, 1, 1, 1,
-1.829531, -2.29069, -2.365063, 1, 1, 1, 1, 1,
-1.822904, -0.9169239, -1.612049, 1, 1, 1, 1, 1,
-1.820401, 1.238797, -2.092546, 0, 0, 1, 1, 1,
-1.816363, -1.419156, -1.355567, 1, 0, 0, 1, 1,
-1.809842, -0.4893253, -0.5685825, 1, 0, 0, 1, 1,
-1.794276, -0.4553547, -2.014502, 1, 0, 0, 1, 1,
-1.759225, 0.2812653, -1.518175, 1, 0, 0, 1, 1,
-1.749676, 1.81633, -0.2906217, 1, 0, 0, 1, 1,
-1.718522, -0.07783592, -0.7339814, 0, 0, 0, 1, 1,
-1.709486, 0.2353014, -0.8428389, 0, 0, 0, 1, 1,
-1.692524, 0.3820482, -1.794825, 0, 0, 0, 1, 1,
-1.681451, 1.449029, -1.389693, 0, 0, 0, 1, 1,
-1.643209, -0.5586159, -1.634722, 0, 0, 0, 1, 1,
-1.641115, -1.984961, -1.702538, 0, 0, 0, 1, 1,
-1.637011, -0.1010736, -2.967664, 0, 0, 0, 1, 1,
-1.602419, -0.5606318, -0.9743794, 1, 1, 1, 1, 1,
-1.60095, -0.7691106, -2.410399, 1, 1, 1, 1, 1,
-1.593926, -0.09067102, -2.270846, 1, 1, 1, 1, 1,
-1.557339, 0.501328, -2.095387, 1, 1, 1, 1, 1,
-1.553091, 1.025119, -1.816698, 1, 1, 1, 1, 1,
-1.552298, -1.493038, -2.326724, 1, 1, 1, 1, 1,
-1.549473, -0.7755284, -2.505513, 1, 1, 1, 1, 1,
-1.548799, 1.933088, -2.560725, 1, 1, 1, 1, 1,
-1.534147, 0.6869279, -1.450011, 1, 1, 1, 1, 1,
-1.529381, -0.641154, -0.3095324, 1, 1, 1, 1, 1,
-1.527393, 1.809514, -1.842241, 1, 1, 1, 1, 1,
-1.525115, 0.4182852, -1.622935, 1, 1, 1, 1, 1,
-1.524985, -0.1739811, -1.986596, 1, 1, 1, 1, 1,
-1.522285, -0.7860627, -2.923199, 1, 1, 1, 1, 1,
-1.522097, -0.823653, -2.890459, 1, 1, 1, 1, 1,
-1.519288, -0.6913797, -3.555627, 0, 0, 1, 1, 1,
-1.516904, 0.4190502, -2.200688, 1, 0, 0, 1, 1,
-1.516769, -0.4008861, -2.030725, 1, 0, 0, 1, 1,
-1.511902, 1.895161, -0.7595778, 1, 0, 0, 1, 1,
-1.493692, -0.3781649, -2.101647, 1, 0, 0, 1, 1,
-1.484316, 0.793036, -0.4522739, 1, 0, 0, 1, 1,
-1.454921, -0.08422038, -0.6962177, 0, 0, 0, 1, 1,
-1.444229, 1.024099, -2.61485, 0, 0, 0, 1, 1,
-1.443057, -1.774297, -0.5621703, 0, 0, 0, 1, 1,
-1.442103, -0.476815, -1.535821, 0, 0, 0, 1, 1,
-1.424901, -0.2270684, -2.737459, 0, 0, 0, 1, 1,
-1.424406, 2.574557, 1.869917, 0, 0, 0, 1, 1,
-1.417332, -0.7506564, -2.709198, 0, 0, 0, 1, 1,
-1.414814, 1.120368, -0.404902, 1, 1, 1, 1, 1,
-1.41363, -0.7910753, -2.427968, 1, 1, 1, 1, 1,
-1.405084, -0.3570419, -1.490046, 1, 1, 1, 1, 1,
-1.400758, -0.9113578, -2.141878, 1, 1, 1, 1, 1,
-1.399727, -0.5829294, -3.424988, 1, 1, 1, 1, 1,
-1.398365, -0.3694908, -2.447479, 1, 1, 1, 1, 1,
-1.392782, -0.01234128, -1.522936, 1, 1, 1, 1, 1,
-1.392127, -0.3846617, -2.553333, 1, 1, 1, 1, 1,
-1.392099, -1.064924, -2.838453, 1, 1, 1, 1, 1,
-1.391777, -0.3969055, -4.006821, 1, 1, 1, 1, 1,
-1.377822, 0.09295033, -3.141484, 1, 1, 1, 1, 1,
-1.373667, 1.204, -0.06718995, 1, 1, 1, 1, 1,
-1.3644, -0.3130332, 0.7340479, 1, 1, 1, 1, 1,
-1.363023, -0.3478144, -2.903823, 1, 1, 1, 1, 1,
-1.362607, -0.6558892, -2.12563, 1, 1, 1, 1, 1,
-1.354881, 0.3436974, -1.353301, 0, 0, 1, 1, 1,
-1.33583, 1.29723, -0.793218, 1, 0, 0, 1, 1,
-1.333086, 0.3936553, -1.347056, 1, 0, 0, 1, 1,
-1.318511, -0.3534545, -1.950508, 1, 0, 0, 1, 1,
-1.311248, -0.009866987, 0.5560205, 1, 0, 0, 1, 1,
-1.298551, 0.6913372, -0.5226217, 1, 0, 0, 1, 1,
-1.296064, -0.9187924, -2.85781, 0, 0, 0, 1, 1,
-1.291223, -1.147496, -2.376352, 0, 0, 0, 1, 1,
-1.259516, -0.2235773, -1.768316, 0, 0, 0, 1, 1,
-1.250072, -0.009005514, -1.29154, 0, 0, 0, 1, 1,
-1.243426, -0.3149446, -1.58519, 0, 0, 0, 1, 1,
-1.243053, 0.2311698, -1.434405, 0, 0, 0, 1, 1,
-1.236027, 1.67413, -0.2841406, 0, 0, 0, 1, 1,
-1.22794, -0.7091898, -2.084142, 1, 1, 1, 1, 1,
-1.22777, -0.8012497, -1.125767, 1, 1, 1, 1, 1,
-1.227699, -0.3495996, -2.094284, 1, 1, 1, 1, 1,
-1.213558, 0.8043057, -0.8574819, 1, 1, 1, 1, 1,
-1.210607, -0.9305279, -3.643507, 1, 1, 1, 1, 1,
-1.207459, 0.3382425, -1.389607, 1, 1, 1, 1, 1,
-1.206396, -1.86248, -2.411114, 1, 1, 1, 1, 1,
-1.195047, -0.03030102, -3.189515, 1, 1, 1, 1, 1,
-1.190684, -0.1329637, -1.05839, 1, 1, 1, 1, 1,
-1.187597, 0.2388381, -0.7240348, 1, 1, 1, 1, 1,
-1.173541, 0.3273121, -1.231941, 1, 1, 1, 1, 1,
-1.170523, 0.9993252, 0.8182732, 1, 1, 1, 1, 1,
-1.168766, -0.8606517, -0.8614891, 1, 1, 1, 1, 1,
-1.167518, -0.01992257, -2.189849, 1, 1, 1, 1, 1,
-1.16327, 0.3822566, -0.3252034, 1, 1, 1, 1, 1,
-1.158555, -0.3024351, -0.8229335, 0, 0, 1, 1, 1,
-1.157791, -1.59147, -3.294911, 1, 0, 0, 1, 1,
-1.152828, -0.9061594, -3.22203, 1, 0, 0, 1, 1,
-1.151657, -0.4840923, -3.734635, 1, 0, 0, 1, 1,
-1.149224, 0.1195417, -2.3197, 1, 0, 0, 1, 1,
-1.14171, 1.055639, -0.5583168, 1, 0, 0, 1, 1,
-1.138275, 0.3673804, -1.470664, 0, 0, 0, 1, 1,
-1.136898, 0.3791299, -0.5748882, 0, 0, 0, 1, 1,
-1.136815, -0.182973, -1.503246, 0, 0, 0, 1, 1,
-1.130754, 1.406298, -0.01084411, 0, 0, 0, 1, 1,
-1.126694, -1.899666, -3.03674, 0, 0, 0, 1, 1,
-1.121462, 1.188708, -0.2733621, 0, 0, 0, 1, 1,
-1.121379, -1.625519, -1.933987, 0, 0, 0, 1, 1,
-1.114874, -0.302222, -2.548704, 1, 1, 1, 1, 1,
-1.112925, -0.6961793, -1.983035, 1, 1, 1, 1, 1,
-1.107903, 0.3759881, -1.164803, 1, 1, 1, 1, 1,
-1.073629, 1.483937, 1.251755, 1, 1, 1, 1, 1,
-1.072821, -0.7742424, -2.636023, 1, 1, 1, 1, 1,
-1.0724, -0.4107764, -2.726436, 1, 1, 1, 1, 1,
-1.072269, -0.4716101, -2.373168, 1, 1, 1, 1, 1,
-1.068337, -0.2995029, -1.635532, 1, 1, 1, 1, 1,
-1.068207, -2.398225, -3.522921, 1, 1, 1, 1, 1,
-1.063771, 1.164155, -1.136099, 1, 1, 1, 1, 1,
-1.050157, 0.1104918, -2.872475, 1, 1, 1, 1, 1,
-1.047311, 1.132164, -1.424676, 1, 1, 1, 1, 1,
-1.046716, -1.698951, -3.220988, 1, 1, 1, 1, 1,
-1.044617, -0.9677372, -2.243213, 1, 1, 1, 1, 1,
-1.035563, -0.842931, -1.095735, 1, 1, 1, 1, 1,
-1.03293, 0.4202391, -0.9938858, 0, 0, 1, 1, 1,
-1.032177, 1.6343, 0.5724841, 1, 0, 0, 1, 1,
-1.031766, -0.7676623, -1.771908, 1, 0, 0, 1, 1,
-1.029175, 2.072873, -0.006425228, 1, 0, 0, 1, 1,
-1.028298, 2.398632, -1.455372, 1, 0, 0, 1, 1,
-1.014512, -0.09471825, -0.5379835, 1, 0, 0, 1, 1,
-1.013634, 0.3127007, -1.60851, 0, 0, 0, 1, 1,
-1.011498, -0.6388289, -0.9479251, 0, 0, 0, 1, 1,
-1.010278, -0.8399872, -2.904229, 0, 0, 0, 1, 1,
-1.008822, 1.383342, -0.1526338, 0, 0, 0, 1, 1,
-1.007409, 0.9893885, -1.761926, 0, 0, 0, 1, 1,
-0.9991776, 1.260722, 0.3318301, 0, 0, 0, 1, 1,
-0.997886, 1.141559, 0.6453753, 0, 0, 0, 1, 1,
-0.9978002, 0.7819097, 0.6951766, 1, 1, 1, 1, 1,
-0.9954213, -0.414454, -2.69899, 1, 1, 1, 1, 1,
-0.9924026, 1.703934, -0.5382903, 1, 1, 1, 1, 1,
-0.987783, 0.366134, -0.5668347, 1, 1, 1, 1, 1,
-0.9857839, 0.6048299, 0.2890459, 1, 1, 1, 1, 1,
-0.9818695, -0.4898377, -2.144739, 1, 1, 1, 1, 1,
-0.9734067, -1.096755, -1.356405, 1, 1, 1, 1, 1,
-0.9645016, 1.79122, -0.3274879, 1, 1, 1, 1, 1,
-0.9612476, 2.003599, -0.7336385, 1, 1, 1, 1, 1,
-0.9604462, -0.9584519, -2.327506, 1, 1, 1, 1, 1,
-0.9590389, -0.8705717, -2.521381, 1, 1, 1, 1, 1,
-0.9568046, 0.4614325, -1.590253, 1, 1, 1, 1, 1,
-0.9541736, 0.7088354, 0.8940738, 1, 1, 1, 1, 1,
-0.9540431, -1.908392, -1.979854, 1, 1, 1, 1, 1,
-0.9537699, 0.6756552, -1.648433, 1, 1, 1, 1, 1,
-0.9470584, 0.9701353, -1.442748, 0, 0, 1, 1, 1,
-0.9435184, -1.501658, -2.766102, 1, 0, 0, 1, 1,
-0.9399402, -2.004401, -1.795438, 1, 0, 0, 1, 1,
-0.9384192, -0.1286743, -1.350136, 1, 0, 0, 1, 1,
-0.9382068, 0.550922, -0.9561917, 1, 0, 0, 1, 1,
-0.9326807, 0.493383, -1.921736, 1, 0, 0, 1, 1,
-0.9315019, -0.6930909, -1.216365, 0, 0, 0, 1, 1,
-0.930288, -0.3162192, -3.303152, 0, 0, 0, 1, 1,
-0.9059583, 0.7711058, -1.296716, 0, 0, 0, 1, 1,
-0.9041374, 0.7199403, -0.8857651, 0, 0, 0, 1, 1,
-0.8991835, 1.194708, -0.2547325, 0, 0, 0, 1, 1,
-0.8851, -0.6655916, -1.36541, 0, 0, 0, 1, 1,
-0.8783935, 2.072671, -0.5714086, 0, 0, 0, 1, 1,
-0.8779342, 0.5981476, 0.1931914, 1, 1, 1, 1, 1,
-0.8748378, -0.9409994, -3.838038, 1, 1, 1, 1, 1,
-0.8729747, -0.4832454, -2.70081, 1, 1, 1, 1, 1,
-0.8706419, 0.7449014, 0.6921806, 1, 1, 1, 1, 1,
-0.8705218, 0.6831676, -2.170937, 1, 1, 1, 1, 1,
-0.8669623, 0.2037648, -2.360939, 1, 1, 1, 1, 1,
-0.8668886, 1.640487, -1.780825, 1, 1, 1, 1, 1,
-0.8563178, -0.5417445, -1.766969, 1, 1, 1, 1, 1,
-0.8558008, -0.8668653, -2.489662, 1, 1, 1, 1, 1,
-0.8555012, -0.9079332, -2.997215, 1, 1, 1, 1, 1,
-0.8462415, 0.2652211, -2.320103, 1, 1, 1, 1, 1,
-0.8439777, 1.079706, -1.824026, 1, 1, 1, 1, 1,
-0.8416829, -0.1088842, -0.388711, 1, 1, 1, 1, 1,
-0.8393095, -0.2899268, -1.755292, 1, 1, 1, 1, 1,
-0.8391091, -1.819858, -3.198826, 1, 1, 1, 1, 1,
-0.836704, -1.021931, -3.633539, 0, 0, 1, 1, 1,
-0.8334644, 0.04753649, -0.9449499, 1, 0, 0, 1, 1,
-0.8313956, 0.5570761, -2.746867, 1, 0, 0, 1, 1,
-0.8307076, 0.8344368, 0.4710797, 1, 0, 0, 1, 1,
-0.8299538, 1.257441, -0.9727618, 1, 0, 0, 1, 1,
-0.8298101, -0.1379065, -2.396385, 1, 0, 0, 1, 1,
-0.8228328, -0.3653943, -1.13123, 0, 0, 0, 1, 1,
-0.8212515, 0.6404451, -0.8438605, 0, 0, 0, 1, 1,
-0.8135256, 0.6056315, -1.508452, 0, 0, 0, 1, 1,
-0.8109586, 1.032889, 0.4805917, 0, 0, 0, 1, 1,
-0.8066427, 0.6318034, -0.7806982, 0, 0, 0, 1, 1,
-0.8030627, -1.678988, -0.3545065, 0, 0, 0, 1, 1,
-0.8000612, -0.7352321, -3.035426, 0, 0, 0, 1, 1,
-0.7991773, -0.186291, -1.7709, 1, 1, 1, 1, 1,
-0.7986844, 0.5855032, -2.792816, 1, 1, 1, 1, 1,
-0.7973798, 0.573836, -1.498088, 1, 1, 1, 1, 1,
-0.7931171, -0.5197936, -2.260397, 1, 1, 1, 1, 1,
-0.7809992, 0.8806555, -1.755083, 1, 1, 1, 1, 1,
-0.7754846, -0.2683473, -1.986503, 1, 1, 1, 1, 1,
-0.7684235, -0.6644642, -2.359124, 1, 1, 1, 1, 1,
-0.7589737, 0.6797845, -1.184396, 1, 1, 1, 1, 1,
-0.7585348, -0.6463196, -1.401888, 1, 1, 1, 1, 1,
-0.7574941, -0.2733807, -4.342323, 1, 1, 1, 1, 1,
-0.7523504, 1.356257, -0.8177362, 1, 1, 1, 1, 1,
-0.7522751, -0.0003736357, -1.683195, 1, 1, 1, 1, 1,
-0.7515047, -2.185655, -4.23784, 1, 1, 1, 1, 1,
-0.748987, -0.4851384, -1.758912, 1, 1, 1, 1, 1,
-0.7467154, -0.03019919, -1.694981, 1, 1, 1, 1, 1,
-0.7436274, -0.3697212, -2.030045, 0, 0, 1, 1, 1,
-0.740931, -0.1142537, -0.8623469, 1, 0, 0, 1, 1,
-0.7401881, 0.02910733, -2.4764, 1, 0, 0, 1, 1,
-0.7396483, 0.2147742, 0.4965707, 1, 0, 0, 1, 1,
-0.7376577, -0.03309303, 0.423054, 1, 0, 0, 1, 1,
-0.7301861, -0.9897711, -3.606167, 1, 0, 0, 1, 1,
-0.7236173, -1.576812, -1.141575, 0, 0, 0, 1, 1,
-0.7218681, 0.9592664, -0.4989289, 0, 0, 0, 1, 1,
-0.7052006, -0.5326433, -1.629586, 0, 0, 0, 1, 1,
-0.702934, -0.2561784, -2.044291, 0, 0, 0, 1, 1,
-0.6999187, 1.41809, -1.344252, 0, 0, 0, 1, 1,
-0.6979985, 0.2480395, -4.033523, 0, 0, 0, 1, 1,
-0.6961701, -0.1060808, -1.142703, 0, 0, 0, 1, 1,
-0.6924071, 1.024973, -1.641877, 1, 1, 1, 1, 1,
-0.6914485, 0.6242854, 0.3205697, 1, 1, 1, 1, 1,
-0.6905556, -1.37512, -3.513704, 1, 1, 1, 1, 1,
-0.6873662, 0.2968393, -0.4156386, 1, 1, 1, 1, 1,
-0.6860114, -0.4324937, -3.097665, 1, 1, 1, 1, 1,
-0.6777141, 0.2894676, -0.9397122, 1, 1, 1, 1, 1,
-0.6679671, -0.8354685, -4.200192, 1, 1, 1, 1, 1,
-0.6667817, 2.67498, -2.073146, 1, 1, 1, 1, 1,
-0.6667049, -0.5648736, -2.658362, 1, 1, 1, 1, 1,
-0.6661578, -0.8608944, -3.51959, 1, 1, 1, 1, 1,
-0.6578336, 0.2307888, -0.9263664, 1, 1, 1, 1, 1,
-0.6573977, 0.7373326, -1.080525, 1, 1, 1, 1, 1,
-0.65382, 0.6201344, -0.07423308, 1, 1, 1, 1, 1,
-0.6479741, 0.2025912, -1.434627, 1, 1, 1, 1, 1,
-0.6471262, 0.2094344, -0.8189555, 1, 1, 1, 1, 1,
-0.6393216, -1.954959, -0.7164587, 0, 0, 1, 1, 1,
-0.6379962, 0.2612018, -1.51339, 1, 0, 0, 1, 1,
-0.6364719, 0.06455463, -0.8463184, 1, 0, 0, 1, 1,
-0.6315048, 0.4546391, -1.912524, 1, 0, 0, 1, 1,
-0.6279534, -0.5061753, -0.4101111, 1, 0, 0, 1, 1,
-0.6188509, -0.5816166, -2.464109, 1, 0, 0, 1, 1,
-0.6182499, -2.086088, -1.416512, 0, 0, 0, 1, 1,
-0.6130568, -0.8859494, -2.641094, 0, 0, 0, 1, 1,
-0.6029004, 0.1517401, -2.03666, 0, 0, 0, 1, 1,
-0.60256, -0.3817203, -1.817958, 0, 0, 0, 1, 1,
-0.5957898, 0.3351135, -0.5792146, 0, 0, 0, 1, 1,
-0.5934905, -2.116767, -3.365282, 0, 0, 0, 1, 1,
-0.5919117, 0.2958795, -0.534296, 0, 0, 0, 1, 1,
-0.5803012, -0.5529305, -1.368979, 1, 1, 1, 1, 1,
-0.5797255, 1.204456, 0.4136966, 1, 1, 1, 1, 1,
-0.5797032, 1.950497, 0.6038305, 1, 1, 1, 1, 1,
-0.5775417, -1.371969, -2.341396, 1, 1, 1, 1, 1,
-0.5686569, -0.8332361, -3.5409, 1, 1, 1, 1, 1,
-0.5660751, -0.5016786, -2.199468, 1, 1, 1, 1, 1,
-0.5645902, -0.914063, -2.650288, 1, 1, 1, 1, 1,
-0.564537, -0.4596501, -2.122754, 1, 1, 1, 1, 1,
-0.5599217, -0.1739483, -2.385931, 1, 1, 1, 1, 1,
-0.5597221, -0.4235091, -2.426139, 1, 1, 1, 1, 1,
-0.5582869, 1.019681, 0.007773443, 1, 1, 1, 1, 1,
-0.5542963, 0.3774606, -1.535538, 1, 1, 1, 1, 1,
-0.5501963, 0.2809049, -0.8290351, 1, 1, 1, 1, 1,
-0.5493508, -0.4603997, -2.971737, 1, 1, 1, 1, 1,
-0.5443277, 0.4443004, 0.2284792, 1, 1, 1, 1, 1,
-0.5441303, -0.4529577, -2.014608, 0, 0, 1, 1, 1,
-0.5430809, -0.7878164, -2.079661, 1, 0, 0, 1, 1,
-0.535709, -0.3211599, -2.909872, 1, 0, 0, 1, 1,
-0.5351632, -0.5853354, -4.364735, 1, 0, 0, 1, 1,
-0.5294397, 0.04932582, -3.046862, 1, 0, 0, 1, 1,
-0.52483, 0.4093552, -0.7762776, 1, 0, 0, 1, 1,
-0.5202559, 0.3782637, 0.3138242, 0, 0, 0, 1, 1,
-0.5117666, -0.6976836, -1.528521, 0, 0, 0, 1, 1,
-0.510765, -1.694252, -2.700834, 0, 0, 0, 1, 1,
-0.5098047, 0.01228456, -0.3070984, 0, 0, 0, 1, 1,
-0.5095785, 1.927903, -1.70311, 0, 0, 0, 1, 1,
-0.5088831, 0.1943759, -0.8574108, 0, 0, 0, 1, 1,
-0.5083979, 0.2600991, -0.5087953, 0, 0, 0, 1, 1,
-0.5017343, -1.067035, -3.363775, 1, 1, 1, 1, 1,
-0.4991332, 0.2726549, -1.532378, 1, 1, 1, 1, 1,
-0.4982569, 0.09223714, -0.9149172, 1, 1, 1, 1, 1,
-0.4980175, 0.3156686, -0.8765137, 1, 1, 1, 1, 1,
-0.4936268, 0.01162673, -0.5715012, 1, 1, 1, 1, 1,
-0.4927441, 1.232295, -0.8911269, 1, 1, 1, 1, 1,
-0.4879073, 0.3125223, -1.353695, 1, 1, 1, 1, 1,
-0.4816151, -0.5094759, -2.693771, 1, 1, 1, 1, 1,
-0.4760529, 1.367401, -0.6248643, 1, 1, 1, 1, 1,
-0.4756152, -1.946867, -2.729182, 1, 1, 1, 1, 1,
-0.4711739, 2.005587, 0.1269329, 1, 1, 1, 1, 1,
-0.465377, 0.252937, -1.422341, 1, 1, 1, 1, 1,
-0.4615494, 0.6698815, -1.137952, 1, 1, 1, 1, 1,
-0.4606334, 1.146421, -1.812571, 1, 1, 1, 1, 1,
-0.4587445, -1.512796, -3.030038, 1, 1, 1, 1, 1,
-0.4564674, 1.021253, -0.9130786, 0, 0, 1, 1, 1,
-0.4552425, 2.206956, -3.047346, 1, 0, 0, 1, 1,
-0.4534822, 0.01920315, -1.269961, 1, 0, 0, 1, 1,
-0.4533356, 0.52197, 0.7851058, 1, 0, 0, 1, 1,
-0.4506346, 1.261373, -0.5714601, 1, 0, 0, 1, 1,
-0.4503429, -1.591093, -4.589079, 1, 0, 0, 1, 1,
-0.4499884, -0.2223275, -2.759412, 0, 0, 0, 1, 1,
-0.4431545, 0.3246262, -0.8390036, 0, 0, 0, 1, 1,
-0.4402711, -1.503468, -2.784889, 0, 0, 0, 1, 1,
-0.4368975, -0.4592424, -0.6128723, 0, 0, 0, 1, 1,
-0.435151, -0.05929862, -1.168668, 0, 0, 0, 1, 1,
-0.4349895, -0.06384467, -0.09768916, 0, 0, 0, 1, 1,
-0.4340573, -0.04946709, -1.770392, 0, 0, 0, 1, 1,
-0.4320479, -0.4952058, -3.318972, 1, 1, 1, 1, 1,
-0.4310005, -0.1179494, -1.617116, 1, 1, 1, 1, 1,
-0.4278726, -0.1367002, -2.880646, 1, 1, 1, 1, 1,
-0.425728, -0.6712208, -2.514608, 1, 1, 1, 1, 1,
-0.4237505, -0.3471991, -1.86801, 1, 1, 1, 1, 1,
-0.4213404, -1.929954, -3.202998, 1, 1, 1, 1, 1,
-0.4194729, 0.3205295, -2.108582, 1, 1, 1, 1, 1,
-0.4191954, -0.642814, -2.875134, 1, 1, 1, 1, 1,
-0.417818, -1.557114, -3.5121, 1, 1, 1, 1, 1,
-0.4110347, -0.4820762, -2.589364, 1, 1, 1, 1, 1,
-0.4094064, 1.651063, 1.146776, 1, 1, 1, 1, 1,
-0.4058587, -0.6516196, -2.132966, 1, 1, 1, 1, 1,
-0.4049517, 0.2730039, 0.0341971, 1, 1, 1, 1, 1,
-0.390536, -1.093091, -3.588237, 1, 1, 1, 1, 1,
-0.3894884, 0.03065254, -1.204451, 1, 1, 1, 1, 1,
-0.3878617, 1.195094, -0.6196868, 0, 0, 1, 1, 1,
-0.370647, 0.6992809, -1.318611, 1, 0, 0, 1, 1,
-0.3699733, 2.16994, 0.04565194, 1, 0, 0, 1, 1,
-0.3687362, -0.1583761, -2.632324, 1, 0, 0, 1, 1,
-0.3686672, 1.175419, 0.4325264, 1, 0, 0, 1, 1,
-0.367453, 0.2471917, -0.7632219, 1, 0, 0, 1, 1,
-0.3660849, -0.6463028, -2.137399, 0, 0, 0, 1, 1,
-0.3651672, -0.1129165, -1.337726, 0, 0, 0, 1, 1,
-0.3578952, 2.118717, -0.02844246, 0, 0, 0, 1, 1,
-0.351172, 0.4558049, -0.2566394, 0, 0, 0, 1, 1,
-0.3505724, 0.4636934, -0.09089969, 0, 0, 0, 1, 1,
-0.3499202, -0.4185316, -2.244299, 0, 0, 0, 1, 1,
-0.3479709, 0.6101934, -1.395105, 0, 0, 0, 1, 1,
-0.3450119, 1.423934, -0.6745214, 1, 1, 1, 1, 1,
-0.3377343, 0.2043179, -0.8007432, 1, 1, 1, 1, 1,
-0.3349258, 0.3991889, 0.8731945, 1, 1, 1, 1, 1,
-0.3323649, 2.099682, -1.074978, 1, 1, 1, 1, 1,
-0.3258874, -1.148742, -2.271225, 1, 1, 1, 1, 1,
-0.3248369, -0.7711225, -3.54177, 1, 1, 1, 1, 1,
-0.3241701, 0.648016, 2.304478, 1, 1, 1, 1, 1,
-0.3233832, 0.5877101, 0.5839313, 1, 1, 1, 1, 1,
-0.3224358, 0.09167945, -0.3709531, 1, 1, 1, 1, 1,
-0.3135442, 1.219402, 1.267422, 1, 1, 1, 1, 1,
-0.3125751, 1.633844, 0.1017316, 1, 1, 1, 1, 1,
-0.3117065, -2.071397, -2.703183, 1, 1, 1, 1, 1,
-0.3100054, 1.171252, -0.3339325, 1, 1, 1, 1, 1,
-0.3062547, 0.2599203, -0.1244749, 1, 1, 1, 1, 1,
-0.3048251, 1.232481, -0.09727998, 1, 1, 1, 1, 1,
-0.3043763, 0.008077458, -1.984342, 0, 0, 1, 1, 1,
-0.3004486, -1.132345, -3.138437, 1, 0, 0, 1, 1,
-0.2992203, 1.084388, -0.196743, 1, 0, 0, 1, 1,
-0.298463, 0.4735442, 0.1500905, 1, 0, 0, 1, 1,
-0.2906682, 0.2733129, -1.955325, 1, 0, 0, 1, 1,
-0.2850442, -0.420114, -3.557444, 1, 0, 0, 1, 1,
-0.2848536, -0.5672516, -3.486105, 0, 0, 0, 1, 1,
-0.2777523, 0.2826672, 0.2098921, 0, 0, 0, 1, 1,
-0.2737726, 1.904267, 0.2201654, 0, 0, 0, 1, 1,
-0.2694755, -1.285903, -2.252237, 0, 0, 0, 1, 1,
-0.2671746, -0.8313982, -2.780143, 0, 0, 0, 1, 1,
-0.2659113, 0.7687778, -1.371133, 0, 0, 0, 1, 1,
-0.2648004, 1.077331, 0.9605684, 0, 0, 0, 1, 1,
-0.2644755, 2.091133, -0.2841282, 1, 1, 1, 1, 1,
-0.2641611, -1.092603, -4.568638, 1, 1, 1, 1, 1,
-0.2563094, 0.8091326, -0.08331746, 1, 1, 1, 1, 1,
-0.2554321, 0.1527223, -1.480786, 1, 1, 1, 1, 1,
-0.2522624, 0.4554363, -1.146272, 1, 1, 1, 1, 1,
-0.2470186, -1.358163, -3.625603, 1, 1, 1, 1, 1,
-0.2432284, -0.6576437, -3.773254, 1, 1, 1, 1, 1,
-0.2425791, 0.6254997, 0.5406992, 1, 1, 1, 1, 1,
-0.2410131, -0.2440295, -2.350081, 1, 1, 1, 1, 1,
-0.2373962, -2.147205, -2.189174, 1, 1, 1, 1, 1,
-0.2315665, -0.5770341, -4.094265, 1, 1, 1, 1, 1,
-0.2314974, 1.54842, 0.2908886, 1, 1, 1, 1, 1,
-0.2297725, -0.4195621, -3.94644, 1, 1, 1, 1, 1,
-0.2285303, -1.864567, -1.506859, 1, 1, 1, 1, 1,
-0.2284837, 0.6652619, 0.9570231, 1, 1, 1, 1, 1,
-0.2262523, -0.8608282, -3.035482, 0, 0, 1, 1, 1,
-0.226123, -2.041631, -4.473868, 1, 0, 0, 1, 1,
-0.2218264, 0.05478767, -2.711022, 1, 0, 0, 1, 1,
-0.2210488, -0.1545813, -2.296039, 1, 0, 0, 1, 1,
-0.2106101, 1.105977, 0.9630327, 1, 0, 0, 1, 1,
-0.210568, -0.7547462, -3.708305, 1, 0, 0, 1, 1,
-0.2101453, 1.303465, 0.700322, 0, 0, 0, 1, 1,
-0.1946875, -0.1347514, -1.500019, 0, 0, 0, 1, 1,
-0.1944181, -0.4764606, -3.132076, 0, 0, 0, 1, 1,
-0.1944105, -0.3943356, -0.939361, 0, 0, 0, 1, 1,
-0.1922886, -0.9369053, -2.41811, 0, 0, 0, 1, 1,
-0.1869836, -0.8956456, -3.088035, 0, 0, 0, 1, 1,
-0.183621, 0.08565982, -0.3949206, 0, 0, 0, 1, 1,
-0.182473, 0.1526693, -2.997702, 1, 1, 1, 1, 1,
-0.1730181, 0.6937421, -0.3276123, 1, 1, 1, 1, 1,
-0.172119, 1.423122, 1.128693, 1, 1, 1, 1, 1,
-0.1712061, -0.4578842, -2.776388, 1, 1, 1, 1, 1,
-0.1660401, -0.1437512, -2.273352, 1, 1, 1, 1, 1,
-0.1635998, -0.7780481, -1.779261, 1, 1, 1, 1, 1,
-0.1633856, -0.5992107, -3.679119, 1, 1, 1, 1, 1,
-0.1596237, 0.8808187, -1.091234, 1, 1, 1, 1, 1,
-0.1585951, -1.239308, -4.059132, 1, 1, 1, 1, 1,
-0.1538291, -1.012635, -3.100672, 1, 1, 1, 1, 1,
-0.1533146, 0.06968822, -3.568933, 1, 1, 1, 1, 1,
-0.1504194, -0.4994007, -0.5553624, 1, 1, 1, 1, 1,
-0.1498525, 1.157172, 0.3167675, 1, 1, 1, 1, 1,
-0.1461537, -0.1516745, -0.9295593, 1, 1, 1, 1, 1,
-0.1438198, 0.8468202, 0.6004497, 1, 1, 1, 1, 1,
-0.1360904, 2.620345, -0.4919068, 0, 0, 1, 1, 1,
-0.1348034, -1.805727, -1.40693, 1, 0, 0, 1, 1,
-0.1294141, -0.1952734, -3.469634, 1, 0, 0, 1, 1,
-0.128399, -0.3829453, -2.684046, 1, 0, 0, 1, 1,
-0.1283114, -0.4088822, -2.403147, 1, 0, 0, 1, 1,
-0.1246203, -0.8726668, -3.223351, 1, 0, 0, 1, 1,
-0.1231938, -0.5059589, -0.8673236, 0, 0, 0, 1, 1,
-0.1231283, -1.457469, -1.231747, 0, 0, 0, 1, 1,
-0.1199954, 0.5396177, -0.08880166, 0, 0, 0, 1, 1,
-0.1184623, -2.872258, -2.479682, 0, 0, 0, 1, 1,
-0.1177789, 0.842061, -1.130685, 0, 0, 0, 1, 1,
-0.1159775, 1.011489, 0.1174054, 0, 0, 0, 1, 1,
-0.1156772, -0.08718958, -3.704137, 0, 0, 0, 1, 1,
-0.1152073, -0.04403835, -2.579491, 1, 1, 1, 1, 1,
-0.1133917, 0.3314502, 0.9393072, 1, 1, 1, 1, 1,
-0.1121975, 1.013329, 0.6180586, 1, 1, 1, 1, 1,
-0.1100449, 0.4345739, 0.424415, 1, 1, 1, 1, 1,
-0.1054859, 1.503809, 0.073471, 1, 1, 1, 1, 1,
-0.09305199, 1.594158, -0.3688302, 1, 1, 1, 1, 1,
-0.09124666, 0.4821053, 0.01960992, 1, 1, 1, 1, 1,
-0.08382235, -0.5337483, -3.685704, 1, 1, 1, 1, 1,
-0.08342423, 0.6373557, 0.3672815, 1, 1, 1, 1, 1,
-0.08271269, 0.2951818, -0.5602562, 1, 1, 1, 1, 1,
-0.07972181, -0.1898039, -2.138962, 1, 1, 1, 1, 1,
-0.07439389, -0.4070068, -3.871605, 1, 1, 1, 1, 1,
-0.07013354, 0.2587637, 0.08547491, 1, 1, 1, 1, 1,
-0.06921114, 0.4784877, 0.6135077, 1, 1, 1, 1, 1,
-0.0639543, 0.5241071, 0.0714668, 1, 1, 1, 1, 1,
-0.06280243, -0.9899039, -3.835968, 0, 0, 1, 1, 1,
-0.05868967, 0.5439829, -1.06416, 1, 0, 0, 1, 1,
-0.05782275, -1.182044, -3.95992, 1, 0, 0, 1, 1,
-0.05769647, -0.2794262, -2.486755, 1, 0, 0, 1, 1,
-0.05429871, 0.226958, -0.964325, 1, 0, 0, 1, 1,
-0.05353607, -0.1664791, -1.907697, 1, 0, 0, 1, 1,
-0.04760268, -1.957522, -3.143782, 0, 0, 0, 1, 1,
-0.04408207, -0.5848004, -4.731687, 0, 0, 0, 1, 1,
-0.04333593, -1.266323, -3.312759, 0, 0, 0, 1, 1,
-0.04192206, -0.6250815, -3.859283, 0, 0, 0, 1, 1,
-0.03449857, -0.02152907, -1.953758, 0, 0, 0, 1, 1,
-0.03347775, 2.002327, 0.8407213, 0, 0, 0, 1, 1,
-0.0313454, -0.8920852, -4.472473, 0, 0, 0, 1, 1,
-0.02919519, -0.1446899, -2.533959, 1, 1, 1, 1, 1,
-0.0273703, 1.030037, 0.3824305, 1, 1, 1, 1, 1,
-0.02722158, -1.023644, -3.335072, 1, 1, 1, 1, 1,
-0.02630855, 0.6171651, -1.178622, 1, 1, 1, 1, 1,
-0.02452048, -0.9214442, -2.850353, 1, 1, 1, 1, 1,
-0.02261241, -0.7043818, -2.833152, 1, 1, 1, 1, 1,
-0.020411, 1.93571, 0.3931307, 1, 1, 1, 1, 1,
-0.02014096, 0.01300054, -1.981726, 1, 1, 1, 1, 1,
-0.02011452, 1.504692, 1.672672, 1, 1, 1, 1, 1,
-0.01980469, 0.6276658, 0.2929949, 1, 1, 1, 1, 1,
-0.01798107, 1.117631, 1.387803, 1, 1, 1, 1, 1,
-0.01679136, 0.5957265, 0.1234906, 1, 1, 1, 1, 1,
-0.01384274, -1.781718, -0.5452127, 1, 1, 1, 1, 1,
-0.01284603, 0.1252144, 1.333167, 1, 1, 1, 1, 1,
-0.01221526, -0.6497252, -2.650583, 1, 1, 1, 1, 1,
-0.01108969, 0.8070826, -0.6870867, 0, 0, 1, 1, 1,
-0.01028643, 0.4648728, 1.519328, 1, 0, 0, 1, 1,
-0.009626744, -1.32191, -3.473789, 1, 0, 0, 1, 1,
-0.008905738, 0.2485833, 0.2398009, 1, 0, 0, 1, 1,
-0.005467725, 1.337211, -0.2170628, 1, 0, 0, 1, 1,
-0.003904554, 0.626074, -1.095956, 1, 0, 0, 1, 1,
0.001492003, 1.61564, -0.2981584, 0, 0, 0, 1, 1,
0.003500724, 0.7101017, 0.6099535, 0, 0, 0, 1, 1,
0.005782296, -0.007785295, -0.7268158, 0, 0, 0, 1, 1,
0.006994251, 0.7212774, -0.9443929, 0, 0, 0, 1, 1,
0.01254634, -1.039229, 3.416308, 0, 0, 0, 1, 1,
0.01398714, -1.04352, 4.069951, 0, 0, 0, 1, 1,
0.01422666, 2.189031, -0.2738036, 0, 0, 0, 1, 1,
0.01653641, -0.3685402, 2.840158, 1, 1, 1, 1, 1,
0.01838028, -1.316569, 2.444093, 1, 1, 1, 1, 1,
0.03050116, 0.5942177, 0.05310166, 1, 1, 1, 1, 1,
0.03339222, 0.01796541, 1.662274, 1, 1, 1, 1, 1,
0.03464825, 1.359838, 0.1287881, 1, 1, 1, 1, 1,
0.03610301, 0.3363715, -0.7633879, 1, 1, 1, 1, 1,
0.04110955, -0.5297161, 2.466094, 1, 1, 1, 1, 1,
0.04170168, -0.3230312, 2.676631, 1, 1, 1, 1, 1,
0.04259523, -0.9624351, 2.756662, 1, 1, 1, 1, 1,
0.04336482, -2.450942, 2.918825, 1, 1, 1, 1, 1,
0.04360167, 0.4457548, 1.04508, 1, 1, 1, 1, 1,
0.04730417, 0.6326702, 0.9335604, 1, 1, 1, 1, 1,
0.05119282, 1.164809, -0.7366902, 1, 1, 1, 1, 1,
0.05439592, -0.3726547, 3.525425, 1, 1, 1, 1, 1,
0.05921865, -0.01759269, 2.983831, 1, 1, 1, 1, 1,
0.06346634, -0.8902596, 2.619886, 0, 0, 1, 1, 1,
0.06365649, 0.7142368, 0.2605972, 1, 0, 0, 1, 1,
0.06475446, 1.338999, 0.3882661, 1, 0, 0, 1, 1,
0.0659371, 0.1866267, 0.3410973, 1, 0, 0, 1, 1,
0.06616449, 0.2095988, -0.2315527, 1, 0, 0, 1, 1,
0.07273668, -2.258761, 5.697192, 1, 0, 0, 1, 1,
0.0737792, 0.3640722, 1.741665, 0, 0, 0, 1, 1,
0.07659703, 1.352597, 0.2971789, 0, 0, 0, 1, 1,
0.0782724, -0.7074921, 3.739193, 0, 0, 0, 1, 1,
0.07884566, 0.2017944, 0.4279057, 0, 0, 0, 1, 1,
0.07961331, -1.765946, 3.340587, 0, 0, 0, 1, 1,
0.08018571, 0.4564615, 1.159159, 0, 0, 0, 1, 1,
0.08285204, -2.139926, 2.33828, 0, 0, 0, 1, 1,
0.08393977, 0.6991211, 0.378016, 1, 1, 1, 1, 1,
0.08415259, -0.07682209, 2.40482, 1, 1, 1, 1, 1,
0.08858063, -0.06516228, 5.146939, 1, 1, 1, 1, 1,
0.09031627, 0.6890202, 0.2506055, 1, 1, 1, 1, 1,
0.09129812, 0.9186879, 0.2964409, 1, 1, 1, 1, 1,
0.09281255, 1.463985, 1.004794, 1, 1, 1, 1, 1,
0.0935911, 1.579985, 0.7574376, 1, 1, 1, 1, 1,
0.09470555, -1.511562, 1.761277, 1, 1, 1, 1, 1,
0.0953569, 0.1518157, 0.4227571, 1, 1, 1, 1, 1,
0.09551537, 0.08627895, -0.9837934, 1, 1, 1, 1, 1,
0.09814765, -1.301498, 1.50691, 1, 1, 1, 1, 1,
0.1061563, 0.9822937, 0.9219673, 1, 1, 1, 1, 1,
0.1127717, 0.2938958, 0.7952194, 1, 1, 1, 1, 1,
0.1138336, 0.2084228, 0.1352143, 1, 1, 1, 1, 1,
0.1186068, 0.899781, 0.5448114, 1, 1, 1, 1, 1,
0.1215046, -0.8552834, 3.16786, 0, 0, 1, 1, 1,
0.1227929, -0.6790313, 2.406367, 1, 0, 0, 1, 1,
0.1248923, 0.2098212, 0.4352545, 1, 0, 0, 1, 1,
0.1254334, 0.3998114, -0.1378374, 1, 0, 0, 1, 1,
0.1255605, 0.9806567, 0.5834069, 1, 0, 0, 1, 1,
0.1260879, 2.339127, -0.5035957, 1, 0, 0, 1, 1,
0.1300887, 2.772728, -0.1379924, 0, 0, 0, 1, 1,
0.1331844, -0.1474333, 2.201512, 0, 0, 0, 1, 1,
0.1368784, -0.7566323, 1.890819, 0, 0, 0, 1, 1,
0.143095, -0.7200865, 2.863225, 0, 0, 0, 1, 1,
0.1501129, -0.07118335, 3.351377, 0, 0, 0, 1, 1,
0.15118, 0.6312675, -0.6032893, 0, 0, 0, 1, 1,
0.1520262, -0.05210905, 1.090808, 0, 0, 0, 1, 1,
0.152423, -1.113153, 3.490047, 1, 1, 1, 1, 1,
0.1597196, -0.7728784, 3.802147, 1, 1, 1, 1, 1,
0.1631118, -0.5835779, 2.393018, 1, 1, 1, 1, 1,
0.1669226, -0.9727027, 4.463569, 1, 1, 1, 1, 1,
0.169664, -0.8797036, 2.227368, 1, 1, 1, 1, 1,
0.169842, -0.4396564, 2.217999, 1, 1, 1, 1, 1,
0.1759963, 0.3441189, 1.264615, 1, 1, 1, 1, 1,
0.1761463, -0.1693334, 3.567137, 1, 1, 1, 1, 1,
0.179078, 0.1869505, 0.9033952, 1, 1, 1, 1, 1,
0.1803398, 0.634531, 0.06164514, 1, 1, 1, 1, 1,
0.181681, -1.078058, 2.479801, 1, 1, 1, 1, 1,
0.1826215, -0.6837565, 3.808805, 1, 1, 1, 1, 1,
0.1859423, -1.260378, 2.681795, 1, 1, 1, 1, 1,
0.1883468, 0.3038516, 0.338579, 1, 1, 1, 1, 1,
0.1892853, 0.6967974, -1.131799, 1, 1, 1, 1, 1,
0.1915603, 1.261981, -0.4639243, 0, 0, 1, 1, 1,
0.1933498, -1.721655, 1.886509, 1, 0, 0, 1, 1,
0.1960049, 1.358005, 0.2645041, 1, 0, 0, 1, 1,
0.1993212, 0.2128803, 1.149127, 1, 0, 0, 1, 1,
0.200892, -0.8503753, 4.160101, 1, 0, 0, 1, 1,
0.2015634, 1.019277, -0.4314806, 1, 0, 0, 1, 1,
0.2017389, 0.7463264, -0.8894497, 0, 0, 0, 1, 1,
0.2029828, 0.2307939, 0.2360296, 0, 0, 0, 1, 1,
0.2043283, -0.9161426, 2.298557, 0, 0, 0, 1, 1,
0.2052232, -0.3445143, 2.07264, 0, 0, 0, 1, 1,
0.2060761, 1.41924, 0.7798022, 0, 0, 0, 1, 1,
0.2066488, 0.07310962, 1.667329, 0, 0, 0, 1, 1,
0.2097972, -0.7482185, 3.771555, 0, 0, 0, 1, 1,
0.2159584, -0.2146032, 3.089343, 1, 1, 1, 1, 1,
0.2163233, 0.9795679, 0.7070274, 1, 1, 1, 1, 1,
0.2192902, 0.05098153, 2.348405, 1, 1, 1, 1, 1,
0.2214928, -1.815839, 3.915967, 1, 1, 1, 1, 1,
0.2231829, -0.826026, 2.651022, 1, 1, 1, 1, 1,
0.226197, -1.453389, 2.679427, 1, 1, 1, 1, 1,
0.2270908, -0.8973863, 2.668677, 1, 1, 1, 1, 1,
0.2274747, -1.955973, 1.946575, 1, 1, 1, 1, 1,
0.2340481, -0.7481039, 2.352286, 1, 1, 1, 1, 1,
0.2341349, -0.3855196, 3.536278, 1, 1, 1, 1, 1,
0.2355376, 0.4104386, 1.211147, 1, 1, 1, 1, 1,
0.2375887, 0.2904753, 1.397594, 1, 1, 1, 1, 1,
0.2376921, 1.447579, 2.221391, 1, 1, 1, 1, 1,
0.2422129, -0.141095, 2.629072, 1, 1, 1, 1, 1,
0.2433743, -1.020226, 1.312451, 1, 1, 1, 1, 1,
0.2448907, 0.9098795, -1.291881, 0, 0, 1, 1, 1,
0.2469687, -1.255141, 1.796932, 1, 0, 0, 1, 1,
0.2487616, 0.831444, 1.450547, 1, 0, 0, 1, 1,
0.2487679, 1.027874, -0.1159669, 1, 0, 0, 1, 1,
0.2494538, -0.009778451, 0.8338836, 1, 0, 0, 1, 1,
0.2521853, 0.05033045, 1.430505, 1, 0, 0, 1, 1,
0.255334, 0.5761695, 1.420425, 0, 0, 0, 1, 1,
0.2556649, -0.2382621, 2.771924, 0, 0, 0, 1, 1,
0.257825, 0.6338758, 0.6167858, 0, 0, 0, 1, 1,
0.261151, -0.3024687, 3.598966, 0, 0, 0, 1, 1,
0.2614027, 0.2255891, -1.157009, 0, 0, 0, 1, 1,
0.2677166, 1.059765, -0.8793748, 0, 0, 0, 1, 1,
0.268586, 1.318668, 0.0186531, 0, 0, 0, 1, 1,
0.2694035, 0.6409049, 0.1188139, 1, 1, 1, 1, 1,
0.271227, -0.4456084, 2.292994, 1, 1, 1, 1, 1,
0.2789006, 0.3890196, 1.923469, 1, 1, 1, 1, 1,
0.2794819, -0.7963248, 3.751417, 1, 1, 1, 1, 1,
0.2830848, -0.1350922, 1.870826, 1, 1, 1, 1, 1,
0.2892202, -1.143963, 3.988851, 1, 1, 1, 1, 1,
0.291333, -0.7143143, 2.869662, 1, 1, 1, 1, 1,
0.2961732, 0.698648, -0.08293287, 1, 1, 1, 1, 1,
0.3003217, 1.726352, 1.755413, 1, 1, 1, 1, 1,
0.3006003, -0.2912416, 2.027676, 1, 1, 1, 1, 1,
0.3079299, 0.1316199, 2.829538, 1, 1, 1, 1, 1,
0.3098638, 0.340445, -0.06613458, 1, 1, 1, 1, 1,
0.3111468, -1.014257, 2.709921, 1, 1, 1, 1, 1,
0.3129978, 0.9069586, -0.6645648, 1, 1, 1, 1, 1,
0.3144963, 1.431262, -0.4258988, 1, 1, 1, 1, 1,
0.3151547, -1.024764, 3.527828, 0, 0, 1, 1, 1,
0.3159977, -0.7764093, 2.674925, 1, 0, 0, 1, 1,
0.3167826, -1.347558, 2.162356, 1, 0, 0, 1, 1,
0.317026, -0.5410929, 1.860184, 1, 0, 0, 1, 1,
0.3206851, 1.087026, -0.4153434, 1, 0, 0, 1, 1,
0.3214994, 0.8881075, -0.08251969, 1, 0, 0, 1, 1,
0.3217083, -0.6745287, 2.280135, 0, 0, 0, 1, 1,
0.3299218, -0.3757013, 3.208901, 0, 0, 0, 1, 1,
0.3321154, -0.674387, 1.439384, 0, 0, 0, 1, 1,
0.3346963, 1.70501, -0.1101301, 0, 0, 0, 1, 1,
0.3372136, 0.6632871, -0.6942728, 0, 0, 0, 1, 1,
0.3436168, 1.121705, 0.2731708, 0, 0, 0, 1, 1,
0.3443242, 1.574005, 0.5586843, 0, 0, 0, 1, 1,
0.3466584, 1.023403, 3.026788, 1, 1, 1, 1, 1,
0.3472158, -0.09501108, 3.144052, 1, 1, 1, 1, 1,
0.3475284, 0.4134307, -0.2036663, 1, 1, 1, 1, 1,
0.3478054, -0.9556916, 3.559395, 1, 1, 1, 1, 1,
0.3496359, 0.9925933, 1.131403, 1, 1, 1, 1, 1,
0.3501109, 0.02882243, 3.146079, 1, 1, 1, 1, 1,
0.3583739, -0.4462438, 3.083444, 1, 1, 1, 1, 1,
0.3614096, -2.115988, 0.5185974, 1, 1, 1, 1, 1,
0.3654684, 0.1503291, 2.446819, 1, 1, 1, 1, 1,
0.3685449, -0.5420952, 1.618585, 1, 1, 1, 1, 1,
0.3761601, -1.533183, 4.12692, 1, 1, 1, 1, 1,
0.3781994, -0.06489799, 1.182124, 1, 1, 1, 1, 1,
0.3829026, 0.84934, 0.7651122, 1, 1, 1, 1, 1,
0.38337, -0.07602696, 0.49534, 1, 1, 1, 1, 1,
0.3870055, -2.104792, 2.733928, 1, 1, 1, 1, 1,
0.3881508, 1.141, -1.620891, 0, 0, 1, 1, 1,
0.3907051, 1.129001, -0.5865551, 1, 0, 0, 1, 1,
0.4006532, -0.6330291, 4.694618, 1, 0, 0, 1, 1,
0.4036976, 0.4069468, -1.394704, 1, 0, 0, 1, 1,
0.4063783, -0.4308071, 1.906378, 1, 0, 0, 1, 1,
0.4077205, -1.344818, 3.879168, 1, 0, 0, 1, 1,
0.4115288, 1.089494, 0.7554814, 0, 0, 0, 1, 1,
0.4164046, -0.4424244, 2.63611, 0, 0, 0, 1, 1,
0.424228, -0.9340726, 3.533167, 0, 0, 0, 1, 1,
0.4255767, 2.101275, 0.9701379, 0, 0, 0, 1, 1,
0.4267939, 0.2173999, -0.4312408, 0, 0, 0, 1, 1,
0.4272518, -1.752473, 2.897766, 0, 0, 0, 1, 1,
0.4302831, 2.836073, -1.022299, 0, 0, 0, 1, 1,
0.4344422, -0.6075609, 1.746726, 1, 1, 1, 1, 1,
0.4356839, 0.04049468, 2.500203, 1, 1, 1, 1, 1,
0.4368633, -0.03188576, 2.311262, 1, 1, 1, 1, 1,
0.4423305, 0.1802132, 0.9078305, 1, 1, 1, 1, 1,
0.4474864, -0.4879338, 3.644675, 1, 1, 1, 1, 1,
0.4494467, -1.119089, 2.040763, 1, 1, 1, 1, 1,
0.4602495, 0.6891043, 0.66638, 1, 1, 1, 1, 1,
0.4603437, -0.2500457, 1.928631, 1, 1, 1, 1, 1,
0.464904, 0.8644983, -0.2490984, 1, 1, 1, 1, 1,
0.4682968, -0.161359, 1.839432, 1, 1, 1, 1, 1,
0.468328, -0.06811319, 1.268118, 1, 1, 1, 1, 1,
0.4702158, 0.9021215, -0.1583154, 1, 1, 1, 1, 1,
0.4723801, 0.5802113, 1.162469, 1, 1, 1, 1, 1,
0.4775977, 0.9326766, 0.7570038, 1, 1, 1, 1, 1,
0.4813867, 0.05725648, 2.237758, 1, 1, 1, 1, 1,
0.4846794, -0.7118083, 2.05151, 0, 0, 1, 1, 1,
0.4865349, -0.9766957, 4.907334, 1, 0, 0, 1, 1,
0.4870915, -1.395336, 2.557232, 1, 0, 0, 1, 1,
0.4899697, 1.962917, 1.015774, 1, 0, 0, 1, 1,
0.4975872, 0.374206, 1.038033, 1, 0, 0, 1, 1,
0.4996745, 0.5051395, 2.160172, 1, 0, 0, 1, 1,
0.4999771, -0.5477943, 2.515131, 0, 0, 0, 1, 1,
0.5033026, -1.400076, 3.341295, 0, 0, 0, 1, 1,
0.5088845, -0.7221624, 2.686145, 0, 0, 0, 1, 1,
0.5097772, -2.798508, 3.985659, 0, 0, 0, 1, 1,
0.5143871, 0.2141069, -0.2410673, 0, 0, 0, 1, 1,
0.5159526, 0.2366807, 2.584646, 0, 0, 0, 1, 1,
0.5190463, 2.08598, -1.981459, 0, 0, 0, 1, 1,
0.5190997, 0.7826756, 0.9969164, 1, 1, 1, 1, 1,
0.5226393, 0.5240074, 1.945184, 1, 1, 1, 1, 1,
0.5306088, -0.4372776, 1.038561, 1, 1, 1, 1, 1,
0.5327008, -0.6934353, 3.235025, 1, 1, 1, 1, 1,
0.5420871, 0.7020308, 0.6547713, 1, 1, 1, 1, 1,
0.5428885, -0.002428222, 3.170898, 1, 1, 1, 1, 1,
0.5467071, 0.5021907, 1.752618, 1, 1, 1, 1, 1,
0.55269, -1.654887, 3.342633, 1, 1, 1, 1, 1,
0.5558357, 0.9621248, -0.4955156, 1, 1, 1, 1, 1,
0.556188, 1.359194, -0.2283879, 1, 1, 1, 1, 1,
0.5578273, -1.232945, 3.267347, 1, 1, 1, 1, 1,
0.5582715, -0.5642872, 1.806355, 1, 1, 1, 1, 1,
0.5583925, 1.92139, 1.182379, 1, 1, 1, 1, 1,
0.5595396, -0.4254432, 4.187071, 1, 1, 1, 1, 1,
0.5616229, 0.1807336, -0.01409221, 1, 1, 1, 1, 1,
0.5671623, -1.113711, 2.863386, 0, 0, 1, 1, 1,
0.5694517, 0.2879766, 0.2975583, 1, 0, 0, 1, 1,
0.5706686, -0.1813873, 1.670025, 1, 0, 0, 1, 1,
0.5725266, 0.3334376, 0.5720978, 1, 0, 0, 1, 1,
0.5748331, 0.5895289, 1.710403, 1, 0, 0, 1, 1,
0.5776406, 0.5699576, 1.865489, 1, 0, 0, 1, 1,
0.5829726, 0.8487155, 1.373852, 0, 0, 0, 1, 1,
0.5847565, -0.2559502, 2.305043, 0, 0, 0, 1, 1,
0.5862179, 0.6217684, -0.2994023, 0, 0, 0, 1, 1,
0.5933968, -1.095336, 3.263783, 0, 0, 0, 1, 1,
0.5962666, -0.6146472, 4.930468, 0, 0, 0, 1, 1,
0.5972264, -0.6027957, 2.185225, 0, 0, 0, 1, 1,
0.5978395, -1.84067, 3.835911, 0, 0, 0, 1, 1,
0.6020171, -0.8384999, 1.928001, 1, 1, 1, 1, 1,
0.6034804, -0.2124727, 1.598243, 1, 1, 1, 1, 1,
0.6084331, -0.3076324, 1.879856, 1, 1, 1, 1, 1,
0.6098462, -0.2207396, 2.077357, 1, 1, 1, 1, 1,
0.6187705, 0.8930495, 1.180549, 1, 1, 1, 1, 1,
0.6212329, 0.8396247, 0.5336183, 1, 1, 1, 1, 1,
0.6234117, -0.1495891, 2.469632, 1, 1, 1, 1, 1,
0.6294379, 0.5303466, 2.316268, 1, 1, 1, 1, 1,
0.6379566, -0.2954097, 2.248773, 1, 1, 1, 1, 1,
0.6384073, -0.2977943, 1.794146, 1, 1, 1, 1, 1,
0.6405025, 0.9627742, 2.170017, 1, 1, 1, 1, 1,
0.6409938, -0.8841347, 2.625827, 1, 1, 1, 1, 1,
0.6412138, 0.5465475, 0.5184553, 1, 1, 1, 1, 1,
0.6463096, 0.6089562, 0.04179898, 1, 1, 1, 1, 1,
0.6492881, 0.6933498, 1.592246, 1, 1, 1, 1, 1,
0.6497977, 1.102358, -1.531062, 0, 0, 1, 1, 1,
0.6539775, -0.4617038, 3.871562, 1, 0, 0, 1, 1,
0.6573308, 0.03006318, 2.945699, 1, 0, 0, 1, 1,
0.6684548, -1.201365, 1.674986, 1, 0, 0, 1, 1,
0.6703993, -1.413936, 2.609921, 1, 0, 0, 1, 1,
0.673938, -0.5989916, 2.566137, 1, 0, 0, 1, 1,
0.6752266, 1.257488, 0.1205848, 0, 0, 0, 1, 1,
0.6798729, 1.195992, -0.2169973, 0, 0, 0, 1, 1,
0.6833086, -0.8700898, 1.270928, 0, 0, 0, 1, 1,
0.6880655, 2.03589, 0.6848595, 0, 0, 0, 1, 1,
0.6928104, 0.8199051, 0.9829922, 0, 0, 0, 1, 1,
0.6938292, -1.219917, 3.111872, 0, 0, 0, 1, 1,
0.6944853, 1.201145, 1.330496, 0, 0, 0, 1, 1,
0.6977993, 2.515982, 0.1519805, 1, 1, 1, 1, 1,
0.7023605, -0.863583, 2.561604, 1, 1, 1, 1, 1,
0.7024684, 0.9119199, 0.4721532, 1, 1, 1, 1, 1,
0.7051758, 0.3202083, 1.700247, 1, 1, 1, 1, 1,
0.7071748, -0.9292954, 1.857541, 1, 1, 1, 1, 1,
0.7087305, -0.1816676, 2.531795, 1, 1, 1, 1, 1,
0.7176634, -0.5198833, 1.793078, 1, 1, 1, 1, 1,
0.7202161, 1.847253, 2.031111, 1, 1, 1, 1, 1,
0.720893, -0.6621059, 1.618697, 1, 1, 1, 1, 1,
0.7241704, -0.57305, 2.727081, 1, 1, 1, 1, 1,
0.7243054, 0.4608707, 0.3767322, 1, 1, 1, 1, 1,
0.7278557, -1.043278, 1.673611, 1, 1, 1, 1, 1,
0.7301884, -0.2103008, 2.490037, 1, 1, 1, 1, 1,
0.7314159, 0.8719347, 1.024543, 1, 1, 1, 1, 1,
0.7388097, 1.382916, 1.063153, 1, 1, 1, 1, 1,
0.7425088, 1.95905, 1.625561, 0, 0, 1, 1, 1,
0.7468312, 0.09980829, 0.8270252, 1, 0, 0, 1, 1,
0.7532859, 1.552774, 1.469425, 1, 0, 0, 1, 1,
0.7561495, -1.159219, 2.849283, 1, 0, 0, 1, 1,
0.7566963, 0.4861984, 2.025155, 1, 0, 0, 1, 1,
0.7573417, 0.3624793, -0.2791004, 1, 0, 0, 1, 1,
0.7578483, -0.517794, 3.215484, 0, 0, 0, 1, 1,
0.7586225, 0.0551031, 1.163486, 0, 0, 0, 1, 1,
0.7606474, 0.2620985, 1.41941, 0, 0, 0, 1, 1,
0.7627897, -1.204901, 3.117412, 0, 0, 0, 1, 1,
0.7652277, -0.3398803, 1.685764, 0, 0, 0, 1, 1,
0.7689497, -0.4407037, 3.150749, 0, 0, 0, 1, 1,
0.7788837, -0.8022234, 3.831819, 0, 0, 0, 1, 1,
0.782303, 0.516849, 0.7363696, 1, 1, 1, 1, 1,
0.7828985, 1.361531, 1.330331, 1, 1, 1, 1, 1,
0.7873853, -2.507253, 4.341777, 1, 1, 1, 1, 1,
0.7972585, -0.6519322, 3.063185, 1, 1, 1, 1, 1,
0.8001943, 1.421974, 1.1592, 1, 1, 1, 1, 1,
0.8026878, 0.7504455, 0.8634472, 1, 1, 1, 1, 1,
0.8041169, -0.05909846, 0.4114816, 1, 1, 1, 1, 1,
0.804534, -0.9907422, 3.099245, 1, 1, 1, 1, 1,
0.8083903, 0.02623376, 0.4604872, 1, 1, 1, 1, 1,
0.8097778, -0.06178693, 1.802574, 1, 1, 1, 1, 1,
0.8128772, 1.571846, 0.005862145, 1, 1, 1, 1, 1,
0.8147467, -0.4702931, 1.01645, 1, 1, 1, 1, 1,
0.8149701, 0.1974788, 1.902771, 1, 1, 1, 1, 1,
0.8192506, -0.9662521, 2.975255, 1, 1, 1, 1, 1,
0.8249964, -0.1119744, 1.286606, 1, 1, 1, 1, 1,
0.8302516, 2.504927, -0.7172171, 0, 0, 1, 1, 1,
0.8303109, 1.624475, 0.9729745, 1, 0, 0, 1, 1,
0.8316767, -0.09216253, 1.919657, 1, 0, 0, 1, 1,
0.83198, 1.409349, 0.08529709, 1, 0, 0, 1, 1,
0.8388646, 1.321744, 1.498633, 1, 0, 0, 1, 1,
0.8392422, 0.6502884, -0.5787637, 1, 0, 0, 1, 1,
0.839848, -0.9183987, 3.548773, 0, 0, 0, 1, 1,
0.8424558, -0.8961354, 3.860793, 0, 0, 0, 1, 1,
0.8443995, 0.9554287, 1.854902, 0, 0, 0, 1, 1,
0.8452536, 0.3073874, 1.30894, 0, 0, 0, 1, 1,
0.8461882, -0.4356104, 2.569488, 0, 0, 0, 1, 1,
0.8477462, 1.207948, 0.3488778, 0, 0, 0, 1, 1,
0.8485528, 1.045319, 1.578846, 0, 0, 0, 1, 1,
0.850153, 0.5961913, 2.858732, 1, 1, 1, 1, 1,
0.8539922, 2.24471, 1.181588, 1, 1, 1, 1, 1,
0.8677533, 0.1389576, 0.754318, 1, 1, 1, 1, 1,
0.87089, -0.7523428, 2.582637, 1, 1, 1, 1, 1,
0.8731068, -0.3276994, 0.6909995, 1, 1, 1, 1, 1,
0.8748187, 1.558225, 0.1641634, 1, 1, 1, 1, 1,
0.8765336, 0.4283835, 1.017294, 1, 1, 1, 1, 1,
0.8837488, -0.5380345, 2.27352, 1, 1, 1, 1, 1,
0.8884357, -0.8443552, 2.952392, 1, 1, 1, 1, 1,
0.8888687, -0.4456801, 3.279833, 1, 1, 1, 1, 1,
0.8965691, 0.1154111, 3.069717, 1, 1, 1, 1, 1,
0.9058923, 0.2317202, -0.3683818, 1, 1, 1, 1, 1,
0.9074151, 0.3881514, 0.6633357, 1, 1, 1, 1, 1,
0.9078408, -0.2234917, 2.080846, 1, 1, 1, 1, 1,
0.9132904, -0.4525035, 1.258331, 1, 1, 1, 1, 1,
0.9144941, 1.060732, 2.008018, 0, 0, 1, 1, 1,
0.9151334, 0.3414123, 1.168017, 1, 0, 0, 1, 1,
0.9190478, 1.610958, 0.8425375, 1, 0, 0, 1, 1,
0.9291757, 0.7058913, 1.088906, 1, 0, 0, 1, 1,
0.9303126, 0.7315357, 1.163336, 1, 0, 0, 1, 1,
0.9417516, 0.1905682, 0.5985644, 1, 0, 0, 1, 1,
0.9476657, -0.7504615, 2.229851, 0, 0, 0, 1, 1,
0.948847, 0.1223448, 3.996471, 0, 0, 0, 1, 1,
0.9518121, 1.210157, -0.2575512, 0, 0, 0, 1, 1,
0.9518127, 0.968909, -0.1966052, 0, 0, 0, 1, 1,
0.9528804, -1.070403, 1.969144, 0, 0, 0, 1, 1,
0.9544151, -0.2160598, 1.138457, 0, 0, 0, 1, 1,
0.9570329, 0.9316362, 0.1673032, 0, 0, 0, 1, 1,
0.9583868, -0.03613846, 2.284406, 1, 1, 1, 1, 1,
0.9661185, -0.4277923, 3.019428, 1, 1, 1, 1, 1,
0.9704354, 2.327414, -0.7357425, 1, 1, 1, 1, 1,
0.9753844, -0.1809167, 2.457991, 1, 1, 1, 1, 1,
0.9794282, 0.03797477, 1.52438, 1, 1, 1, 1, 1,
0.9814177, 0.1836911, 1.956021, 1, 1, 1, 1, 1,
0.9842892, 0.008547836, 2.126441, 1, 1, 1, 1, 1,
0.9938135, 1.335614, 1.198434, 1, 1, 1, 1, 1,
0.9990658, 0.7979808, 1.67196, 1, 1, 1, 1, 1,
1.007185, -0.3051845, 3.170496, 1, 1, 1, 1, 1,
1.007256, 0.389915, 1.554253, 1, 1, 1, 1, 1,
1.011062, 0.08703339, 2.329173, 1, 1, 1, 1, 1,
1.012643, 0.3341275, 0.7744412, 1, 1, 1, 1, 1,
1.013153, 1.317765, -0.2927862, 1, 1, 1, 1, 1,
1.015059, -0.7049063, 2.618429, 1, 1, 1, 1, 1,
1.01821, -0.9698539, 1.683006, 0, 0, 1, 1, 1,
1.019641, 1.151532, -1.417809, 1, 0, 0, 1, 1,
1.022021, -0.04384519, 2.246051, 1, 0, 0, 1, 1,
1.022421, 1.724227, 1.732502, 1, 0, 0, 1, 1,
1.024521, 0.3428831, 0.3538455, 1, 0, 0, 1, 1,
1.026053, -0.3422856, 1.178815, 1, 0, 0, 1, 1,
1.029013, -1.229129, 3.767163, 0, 0, 0, 1, 1,
1.03028, -1.195502, 2.104113, 0, 0, 0, 1, 1,
1.033213, -0.7777532, 2.213282, 0, 0, 0, 1, 1,
1.046084, -2.512482, 2.102565, 0, 0, 0, 1, 1,
1.050174, 2.02736, 1.406745, 0, 0, 0, 1, 1,
1.053928, 0.4468909, 0.700455, 0, 0, 0, 1, 1,
1.057833, 0.08084421, 2.797017, 0, 0, 0, 1, 1,
1.068074, 1.290284, -1.145733, 1, 1, 1, 1, 1,
1.070809, 0.1285771, 2.639235, 1, 1, 1, 1, 1,
1.074491, 1.198521, 1.48413, 1, 1, 1, 1, 1,
1.07542, -2.156422, 2.839529, 1, 1, 1, 1, 1,
1.090292, -0.5164533, 2.019652, 1, 1, 1, 1, 1,
1.090643, -0.8140293, 1.021346, 1, 1, 1, 1, 1,
1.101887, -0.7602265, 1.77517, 1, 1, 1, 1, 1,
1.105014, -0.8707228, 3.888104, 1, 1, 1, 1, 1,
1.105187, 2.74611, 0.08687193, 1, 1, 1, 1, 1,
1.105876, -0.1522236, 2.785957, 1, 1, 1, 1, 1,
1.109392, 0.1925099, 2.826226, 1, 1, 1, 1, 1,
1.109443, 0.86795, 0.2323137, 1, 1, 1, 1, 1,
1.109728, -1.875567, 3.008602, 1, 1, 1, 1, 1,
1.112043, 0.9597741, 1.241841, 1, 1, 1, 1, 1,
1.112919, -1.328624, 0.2368991, 1, 1, 1, 1, 1,
1.113754, 1.547168, 0.08239902, 0, 0, 1, 1, 1,
1.120693, -0.7413315, 3.754159, 1, 0, 0, 1, 1,
1.121877, 0.6855038, 2.0215, 1, 0, 0, 1, 1,
1.126075, 0.2004845, 1.921866, 1, 0, 0, 1, 1,
1.145882, -0.05987885, 3.213338, 1, 0, 0, 1, 1,
1.150237, 2.43271, -0.02258795, 1, 0, 0, 1, 1,
1.156557, 0.916792, 2.1862, 0, 0, 0, 1, 1,
1.157538, 1.389342, 0.7675622, 0, 0, 0, 1, 1,
1.164611, -0.2511494, 1.418952, 0, 0, 0, 1, 1,
1.179454, -0.9973722, 2.176798, 0, 0, 0, 1, 1,
1.180492, -0.3760303, 1.09533, 0, 0, 0, 1, 1,
1.181509, -0.1610958, 1.517987, 0, 0, 0, 1, 1,
1.181818, 0.347405, 0.8746011, 0, 0, 0, 1, 1,
1.191058, -0.207706, 2.908314, 1, 1, 1, 1, 1,
1.193727, -0.446698, 1.440075, 1, 1, 1, 1, 1,
1.19574, 0.2244751, 1.66569, 1, 1, 1, 1, 1,
1.199869, -0.254916, 2.43228, 1, 1, 1, 1, 1,
1.201492, -0.7800661, 1.688751, 1, 1, 1, 1, 1,
1.204494, 2.103433, 0.8869836, 1, 1, 1, 1, 1,
1.207714, -1.651647, 0.638831, 1, 1, 1, 1, 1,
1.208359, -0.1707737, 2.018855, 1, 1, 1, 1, 1,
1.209577, 0.7131183, 0.3613856, 1, 1, 1, 1, 1,
1.210881, -0.8100196, 3.749748, 1, 1, 1, 1, 1,
1.218611, -0.2203513, 1.574351, 1, 1, 1, 1, 1,
1.222714, 0.1661595, -0.04266593, 1, 1, 1, 1, 1,
1.226483, 0.970934, 0.3409328, 1, 1, 1, 1, 1,
1.229033, 0.7444173, 0.8917506, 1, 1, 1, 1, 1,
1.233439, 0.2532176, 0.9146953, 1, 1, 1, 1, 1,
1.234441, -0.6043642, 1.767167, 0, 0, 1, 1, 1,
1.243705, 1.363256, 0.004422211, 1, 0, 0, 1, 1,
1.253784, 1.541939, 0.6552245, 1, 0, 0, 1, 1,
1.258512, -0.9782712, 3.065947, 1, 0, 0, 1, 1,
1.263571, -0.2990574, 2.315376, 1, 0, 0, 1, 1,
1.276924, -1.537093, 0.5548811, 1, 0, 0, 1, 1,
1.283015, -0.5046421, 3.438773, 0, 0, 0, 1, 1,
1.284353, -0.8678145, 2.070137, 0, 0, 0, 1, 1,
1.285692, -1.309348, -0.7133309, 0, 0, 0, 1, 1,
1.286057, -1.33462, 0.960286, 0, 0, 0, 1, 1,
1.297107, 0.2362131, 1.465689, 0, 0, 0, 1, 1,
1.305737, -0.6147268, 2.540868, 0, 0, 0, 1, 1,
1.307348, -0.2256237, 1.468407, 0, 0, 0, 1, 1,
1.312814, -0.2097654, 2.390445, 1, 1, 1, 1, 1,
1.313252, -2.429884, 1.824804, 1, 1, 1, 1, 1,
1.322615, -1.020663, 1.755299, 1, 1, 1, 1, 1,
1.333013, 1.179976, 2.204199, 1, 1, 1, 1, 1,
1.364538, 0.2153388, 2.826533, 1, 1, 1, 1, 1,
1.365472, 0.3351018, 2.002412, 1, 1, 1, 1, 1,
1.365487, -0.2148885, 0.5839849, 1, 1, 1, 1, 1,
1.37934, 1.081429, 1.590059, 1, 1, 1, 1, 1,
1.381107, -0.05226908, 2.011442, 1, 1, 1, 1, 1,
1.395852, 0.388681, 0.4403349, 1, 1, 1, 1, 1,
1.401494, 0.4266923, 0.9206014, 1, 1, 1, 1, 1,
1.401528, -0.02308493, 1.834142, 1, 1, 1, 1, 1,
1.428473, -0.8714224, 2.165431, 1, 1, 1, 1, 1,
1.443806, -0.9508279, 2.846233, 1, 1, 1, 1, 1,
1.457944, -1.636036, 2.656305, 1, 1, 1, 1, 1,
1.459072, 0.5366067, 1.05858, 0, 0, 1, 1, 1,
1.459314, 1.61313, 1.038149, 1, 0, 0, 1, 1,
1.467519, -0.9743441, 1.621357, 1, 0, 0, 1, 1,
1.480395, 0.2893215, 2.858875, 1, 0, 0, 1, 1,
1.484079, 1.281648, 0.08252537, 1, 0, 0, 1, 1,
1.489323, 0.06661823, 2.547782, 1, 0, 0, 1, 1,
1.49651, 0.924677, 2.613983, 0, 0, 0, 1, 1,
1.501653, 1.321578, 1.679234, 0, 0, 0, 1, 1,
1.510915, -0.09032161, 2.661407, 0, 0, 0, 1, 1,
1.527283, 1.221415, 1.032147, 0, 0, 0, 1, 1,
1.535677, -0.8715547, 0.9660415, 0, 0, 0, 1, 1,
1.543189, -0.1012863, 3.028728, 0, 0, 0, 1, 1,
1.543214, 0.8034278, 0.8787259, 0, 0, 0, 1, 1,
1.550402, 2.351705, 0.6669324, 1, 1, 1, 1, 1,
1.552477, -0.7715785, 2.041257, 1, 1, 1, 1, 1,
1.552692, 0.03280448, 1.287226, 1, 1, 1, 1, 1,
1.556366, 0.8299431, 1.883762, 1, 1, 1, 1, 1,
1.556837, 0.3127957, -0.363325, 1, 1, 1, 1, 1,
1.556911, 0.9451975, 0.8886153, 1, 1, 1, 1, 1,
1.560388, -0.5128137, 1.704674, 1, 1, 1, 1, 1,
1.586542, 0.1963695, 1.228003, 1, 1, 1, 1, 1,
1.599467, 0.8599179, 0.7891749, 1, 1, 1, 1, 1,
1.602946, 1.27993, 1.476797, 1, 1, 1, 1, 1,
1.611135, 0.2613751, 0.06086602, 1, 1, 1, 1, 1,
1.633046, -0.1914215, 1.499363, 1, 1, 1, 1, 1,
1.642858, -0.2861561, 0.6917096, 1, 1, 1, 1, 1,
1.651686, 0.7110766, 1.0361, 1, 1, 1, 1, 1,
1.661506, -0.2539344, 3.677206, 1, 1, 1, 1, 1,
1.677644, -0.209703, 1.095001, 0, 0, 1, 1, 1,
1.680634, 2.096437, 1.981767, 1, 0, 0, 1, 1,
1.689702, 1.171221, 1.842651, 1, 0, 0, 1, 1,
1.696718, 0.1381279, 0.5709829, 1, 0, 0, 1, 1,
1.707044, 1.250222, -0.3660051, 1, 0, 0, 1, 1,
1.708351, 2.797812, 0.217042, 1, 0, 0, 1, 1,
1.710788, 0.9893389, 0.6163574, 0, 0, 0, 1, 1,
1.738003, -0.5787127, 2.00141, 0, 0, 0, 1, 1,
1.739613, -0.2724727, 2.921964, 0, 0, 0, 1, 1,
1.741151, 0.04997847, 0.937284, 0, 0, 0, 1, 1,
1.747433, -0.6766741, 1.541194, 0, 0, 0, 1, 1,
1.760189, 0.5289744, 0.8217193, 0, 0, 0, 1, 1,
1.767302, -1.063351, 3.761234, 0, 0, 0, 1, 1,
1.768062, 0.198613, 3.110021, 1, 1, 1, 1, 1,
1.771926, -0.4184858, 1.300102, 1, 1, 1, 1, 1,
1.773822, 0.06905725, 1.440548, 1, 1, 1, 1, 1,
1.795078, 0.2228531, 2.85852, 1, 1, 1, 1, 1,
1.797775, -2.841226, 1.780596, 1, 1, 1, 1, 1,
1.851202, -1.445539, 2.91716, 1, 1, 1, 1, 1,
1.885985, -0.1367565, 1.592405, 1, 1, 1, 1, 1,
1.90826, 0.974925, 0.842879, 1, 1, 1, 1, 1,
1.91388, 1.46685, 0.7023823, 1, 1, 1, 1, 1,
1.939344, -1.846058, 1.610281, 1, 1, 1, 1, 1,
1.987746, -0.9450375, 2.35286, 1, 1, 1, 1, 1,
2.012674, 0.9505157, 0.9957486, 1, 1, 1, 1, 1,
2.020386, -1.647043, 4.340846, 1, 1, 1, 1, 1,
2.021109, -0.1451086, 1.72966, 1, 1, 1, 1, 1,
2.028396, 0.7063024, 1.106487, 1, 1, 1, 1, 1,
2.028962, -1.076301, 1.292895, 0, 0, 1, 1, 1,
2.042242, -1.122455, 3.90004, 1, 0, 0, 1, 1,
2.12294, 1.129131, 2.076488, 1, 0, 0, 1, 1,
2.137808, 0.04200668, 0.6904975, 1, 0, 0, 1, 1,
2.142795, -0.11238, 3.126966, 1, 0, 0, 1, 1,
2.205606, 0.5445794, 1.323502, 1, 0, 0, 1, 1,
2.206894, -1.298756, 3.923782, 0, 0, 0, 1, 1,
2.212087, 1.205585, 0.7334016, 0, 0, 0, 1, 1,
2.212331, 2.021061, 0.1304562, 0, 0, 0, 1, 1,
2.218861, 0.6909773, 0.807294, 0, 0, 0, 1, 1,
2.235807, -0.8182951, 1.497741, 0, 0, 0, 1, 1,
2.261465, -0.8062571, 1.910643, 0, 0, 0, 1, 1,
2.319394, 0.2631818, 2.044159, 0, 0, 0, 1, 1,
2.320209, -0.5519202, 0.7669529, 1, 1, 1, 1, 1,
2.338788, 1.572836, 0.5529597, 1, 1, 1, 1, 1,
2.35042, 1.992846, 1.632661, 1, 1, 1, 1, 1,
2.369271, -0.7332802, 0.4271104, 1, 1, 1, 1, 1,
2.370599, -1.663404, 2.115391, 1, 1, 1, 1, 1,
2.454002, -0.98077, 1.607201, 1, 1, 1, 1, 1,
2.902046, 0.1525478, 0.5337425, 1, 1, 1, 1, 1
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
var radius = 9.219589;
var distance = 32.38342;
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
mvMatrix.translate( 0.1936547, 0.01809287, -0.4827526 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.38342);
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
