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
-3.888887, -1.251831, -2.306084, 1, 0, 0, 1,
-2.852426, -1.078756, -1.334412, 1, 0.007843138, 0, 1,
-2.779008, 1.417847, -0.4642731, 1, 0.01176471, 0, 1,
-2.624559, 0.9280424, -1.70241, 1, 0.01960784, 0, 1,
-2.563691, -0.04048913, -2.642031, 1, 0.02352941, 0, 1,
-2.529245, 0.5965747, -1.967916, 1, 0.03137255, 0, 1,
-2.46968, 0.4164888, -0.3387652, 1, 0.03529412, 0, 1,
-2.415163, -1.135285, -1.316724, 1, 0.04313726, 0, 1,
-2.398716, -1.02905, -3.507866, 1, 0.04705882, 0, 1,
-2.391065, -0.9600562, -1.997155, 1, 0.05490196, 0, 1,
-2.306037, -0.503388, -2.844342, 1, 0.05882353, 0, 1,
-2.294343, 1.237245, -2.593162, 1, 0.06666667, 0, 1,
-2.257118, 0.6549293, -0.6824304, 1, 0.07058824, 0, 1,
-2.230777, 0.527615, -1.200629, 1, 0.07843138, 0, 1,
-2.202092, 0.003938479, -3.801514, 1, 0.08235294, 0, 1,
-2.054868, 0.907169, -0.6866437, 1, 0.09019608, 0, 1,
-2.018019, 0.3812778, -1.341851, 1, 0.09411765, 0, 1,
-1.995298, 0.4536208, -1.669693, 1, 0.1019608, 0, 1,
-1.990821, 0.1903398, -2.43496, 1, 0.1098039, 0, 1,
-1.981172, 1.100244, -0.1420424, 1, 0.1137255, 0, 1,
-1.97617, 0.2054221, -1.930344, 1, 0.1215686, 0, 1,
-1.954135, -0.9389061, -3.903055, 1, 0.1254902, 0, 1,
-1.938784, 1.551568, -0.9937212, 1, 0.1333333, 0, 1,
-1.925009, -2.048231, -0.8264638, 1, 0.1372549, 0, 1,
-1.924797, -1.327358, -1.889895, 1, 0.145098, 0, 1,
-1.900237, -0.8091155, -2.750625, 1, 0.1490196, 0, 1,
-1.867848, -0.5691544, -0.5639918, 1, 0.1568628, 0, 1,
-1.867579, -1.174308, -2.607008, 1, 0.1607843, 0, 1,
-1.849884, 0.722788, -0.2666043, 1, 0.1686275, 0, 1,
-1.846316, -0.07953455, -0.9306015, 1, 0.172549, 0, 1,
-1.838446, 1.244051, -0.5471086, 1, 0.1803922, 0, 1,
-1.82666, -0.5137327, -2.728006, 1, 0.1843137, 0, 1,
-1.788449, 0.0083214, 0.4566016, 1, 0.1921569, 0, 1,
-1.788299, 1.108756, -1.819821, 1, 0.1960784, 0, 1,
-1.784229, 0.002504725, -1.658586, 1, 0.2039216, 0, 1,
-1.782091, 0.5186381, -0.1455373, 1, 0.2117647, 0, 1,
-1.774056, -0.01217253, -1.970478, 1, 0.2156863, 0, 1,
-1.77068, -0.1733831, -1.56597, 1, 0.2235294, 0, 1,
-1.766819, 0.3641649, -2.676495, 1, 0.227451, 0, 1,
-1.765045, -1.53619, -1.369498, 1, 0.2352941, 0, 1,
-1.764311, -0.09473174, -1.469839, 1, 0.2392157, 0, 1,
-1.752263, -0.2353616, -2.321868, 1, 0.2470588, 0, 1,
-1.749906, -0.9068104, -2.056039, 1, 0.2509804, 0, 1,
-1.745093, 1.028591, -0.1668947, 1, 0.2588235, 0, 1,
-1.731875, -1.672677, -2.437544, 1, 0.2627451, 0, 1,
-1.726771, -0.8481939, -3.650102, 1, 0.2705882, 0, 1,
-1.687468, 1.384251, -0.08217023, 1, 0.2745098, 0, 1,
-1.666474, -0.8051593, -1.905273, 1, 0.282353, 0, 1,
-1.641832, -2.244551, -2.38847, 1, 0.2862745, 0, 1,
-1.630712, -1.965966, -1.630892, 1, 0.2941177, 0, 1,
-1.615516, 0.7730569, -1.103073, 1, 0.3019608, 0, 1,
-1.61444, -1.031937, -2.351016, 1, 0.3058824, 0, 1,
-1.613866, -1.25495, -1.559476, 1, 0.3137255, 0, 1,
-1.608087, -0.8075765, -2.135128, 1, 0.3176471, 0, 1,
-1.602921, 0.9847246, -3.612, 1, 0.3254902, 0, 1,
-1.60176, 0.001700274, -1.55063, 1, 0.3294118, 0, 1,
-1.59603, -1.260273, -1.592403, 1, 0.3372549, 0, 1,
-1.581228, 0.7629052, -1.407427, 1, 0.3411765, 0, 1,
-1.570064, -0.03102664, -2.654704, 1, 0.3490196, 0, 1,
-1.569372, 0.02055779, -1.957449, 1, 0.3529412, 0, 1,
-1.56168, -0.7738288, -2.113674, 1, 0.3607843, 0, 1,
-1.541921, -0.01753777, -1.94568, 1, 0.3647059, 0, 1,
-1.535777, 0.4866863, -2.18535, 1, 0.372549, 0, 1,
-1.532345, 0.7644582, -2.759836, 1, 0.3764706, 0, 1,
-1.529188, -0.1297012, -1.512426, 1, 0.3843137, 0, 1,
-1.516346, 0.220479, -0.7508514, 1, 0.3882353, 0, 1,
-1.50354, -0.7782652, -1.886095, 1, 0.3960784, 0, 1,
-1.50344, 1.045642, -1.552168, 1, 0.4039216, 0, 1,
-1.501112, 1.363885, -1.800852, 1, 0.4078431, 0, 1,
-1.498412, 0.2739501, -0.9616715, 1, 0.4156863, 0, 1,
-1.446475, 1.433346, -1.524566, 1, 0.4196078, 0, 1,
-1.429087, 0.2429224, -1.34414, 1, 0.427451, 0, 1,
-1.423083, -0.03422234, -1.349567, 1, 0.4313726, 0, 1,
-1.421955, 1.127397, -1.30203, 1, 0.4392157, 0, 1,
-1.414853, -0.4553065, -1.168398, 1, 0.4431373, 0, 1,
-1.409635, -0.1802893, -2.798887, 1, 0.4509804, 0, 1,
-1.409337, 0.502458, -1.66697, 1, 0.454902, 0, 1,
-1.396662, -0.3601499, -0.4059856, 1, 0.4627451, 0, 1,
-1.396005, -0.9399025, -2.165654, 1, 0.4666667, 0, 1,
-1.392505, -0.7426783, -3.112151, 1, 0.4745098, 0, 1,
-1.385021, 0.8421828, -1.100596, 1, 0.4784314, 0, 1,
-1.375997, 1.391117, -0.5975925, 1, 0.4862745, 0, 1,
-1.375645, -0.4667974, -1.786218, 1, 0.4901961, 0, 1,
-1.374429, -0.5293887, -2.99822, 1, 0.4980392, 0, 1,
-1.373802, -0.3916631, -1.110149, 1, 0.5058824, 0, 1,
-1.365663, 1.442647, 0.477986, 1, 0.509804, 0, 1,
-1.360913, 2.008494, -1.540633, 1, 0.5176471, 0, 1,
-1.359558, -0.1821744, 0.02472329, 1, 0.5215687, 0, 1,
-1.356789, -0.1956518, -1.52034, 1, 0.5294118, 0, 1,
-1.354238, -0.1199182, -1.518706, 1, 0.5333334, 0, 1,
-1.352587, -0.8948976, -1.493131, 1, 0.5411765, 0, 1,
-1.340518, 0.492602, -0.7747099, 1, 0.5450981, 0, 1,
-1.339169, 0.4741551, -0.3393986, 1, 0.5529412, 0, 1,
-1.338331, 1.363313, -2.997477, 1, 0.5568628, 0, 1,
-1.335859, -2.180343, -1.668176, 1, 0.5647059, 0, 1,
-1.328185, 0.2659428, -1.418597, 1, 0.5686275, 0, 1,
-1.327354, -0.8490108, -3.262335, 1, 0.5764706, 0, 1,
-1.324996, 2.651585, 0.844237, 1, 0.5803922, 0, 1,
-1.314795, 0.4822491, 0.7714061, 1, 0.5882353, 0, 1,
-1.309265, -0.1854411, -2.345541, 1, 0.5921569, 0, 1,
-1.307095, -0.09604429, -2.672638, 1, 0.6, 0, 1,
-1.301258, 0.009447833, -2.210509, 1, 0.6078432, 0, 1,
-1.300853, 0.728357, 0.5088295, 1, 0.6117647, 0, 1,
-1.294364, -0.2018688, -0.3350138, 1, 0.6196079, 0, 1,
-1.267478, -2.841724, -3.226535, 1, 0.6235294, 0, 1,
-1.265752, -0.152097, -2.26655, 1, 0.6313726, 0, 1,
-1.257537, 1.062114, -1.153956, 1, 0.6352941, 0, 1,
-1.254365, -0.3278754, -1.851722, 1, 0.6431373, 0, 1,
-1.248804, -0.1788669, -2.46868, 1, 0.6470588, 0, 1,
-1.243144, 3.139436, 0.6182712, 1, 0.654902, 0, 1,
-1.242275, 0.4454012, -1.106648, 1, 0.6588235, 0, 1,
-1.239993, -0.7747725, -2.360632, 1, 0.6666667, 0, 1,
-1.226418, 0.3695905, -0.4299901, 1, 0.6705883, 0, 1,
-1.213435, 1.156987, 0.4727651, 1, 0.6784314, 0, 1,
-1.212953, 0.1971418, -1.559013, 1, 0.682353, 0, 1,
-1.210202, -0.4365508, 0.4601692, 1, 0.6901961, 0, 1,
-1.201102, 0.3869526, 0.06185248, 1, 0.6941177, 0, 1,
-1.194276, -1.262181, -2.954598, 1, 0.7019608, 0, 1,
-1.183345, 0.4739087, -1.287956, 1, 0.7098039, 0, 1,
-1.17585, -0.3923076, -3.402008, 1, 0.7137255, 0, 1,
-1.175103, 0.5939113, -1.025085, 1, 0.7215686, 0, 1,
-1.168291, 0.9702736, -2.308721, 1, 0.7254902, 0, 1,
-1.15914, 0.1760267, -1.17571, 1, 0.7333333, 0, 1,
-1.157041, 0.3153563, -0.3504245, 1, 0.7372549, 0, 1,
-1.153121, -0.0124507, -2.770833, 1, 0.7450981, 0, 1,
-1.149218, -1.890764, -2.910856, 1, 0.7490196, 0, 1,
-1.14796, -0.1309481, -0.5471485, 1, 0.7568628, 0, 1,
-1.124799, 0.4955353, -2.609501, 1, 0.7607843, 0, 1,
-1.116956, -0.7479091, -0.963457, 1, 0.7686275, 0, 1,
-1.113176, -0.4391646, -1.7611, 1, 0.772549, 0, 1,
-1.099714, -1.060731, -2.136314, 1, 0.7803922, 0, 1,
-1.096383, 0.9054019, -1.871315, 1, 0.7843137, 0, 1,
-1.094885, 0.2610532, -0.646575, 1, 0.7921569, 0, 1,
-1.08912, 1.017571, -0.2634299, 1, 0.7960784, 0, 1,
-1.088315, -1.541903, -2.963293, 1, 0.8039216, 0, 1,
-1.085605, -1.067356, -3.230741, 1, 0.8117647, 0, 1,
-1.085604, 0.1955982, -2.020461, 1, 0.8156863, 0, 1,
-1.076311, -0.497135, -0.3485254, 1, 0.8235294, 0, 1,
-1.073944, -0.7188585, -0.8446206, 1, 0.827451, 0, 1,
-1.06708, 0.0343295, -1.558856, 1, 0.8352941, 0, 1,
-1.066154, -1.164536, -1.699441, 1, 0.8392157, 0, 1,
-1.059305, 0.9745016, -2.019886, 1, 0.8470588, 0, 1,
-1.059084, 1.244325, 0.03894771, 1, 0.8509804, 0, 1,
-1.046751, -0.6661836, -0.8151825, 1, 0.8588235, 0, 1,
-1.044763, 1.091403, -0.8151699, 1, 0.8627451, 0, 1,
-1.04242, 0.8973248, -1.356026, 1, 0.8705882, 0, 1,
-1.04022, -0.8765852, -3.273685, 1, 0.8745098, 0, 1,
-1.032544, -1.328945, -2.267529, 1, 0.8823529, 0, 1,
-1.029548, 1.668901, 0.6069119, 1, 0.8862745, 0, 1,
-1.024484, -0.2592825, -1.030703, 1, 0.8941177, 0, 1,
-1.021052, -0.2121704, -1.037023, 1, 0.8980392, 0, 1,
-1.008442, 0.02725147, -0.2507484, 1, 0.9058824, 0, 1,
-1.003381, 0.2040369, 0.5361715, 1, 0.9137255, 0, 1,
-1.000226, -0.5399662, -1.353823, 1, 0.9176471, 0, 1,
-0.9944668, 0.5403315, -0.3702563, 1, 0.9254902, 0, 1,
-0.9923815, -0.5359156, -2.039262, 1, 0.9294118, 0, 1,
-0.9905888, -0.09937407, -1.862329, 1, 0.9372549, 0, 1,
-0.9830247, -0.5174555, -3.468193, 1, 0.9411765, 0, 1,
-0.9787675, -0.1562865, -3.018527, 1, 0.9490196, 0, 1,
-0.9770393, -1.256921, -1.894072, 1, 0.9529412, 0, 1,
-0.9738106, 2.077845, -1.245354, 1, 0.9607843, 0, 1,
-0.9707592, -0.9935898, -0.47054, 1, 0.9647059, 0, 1,
-0.9689705, 0.7698185, -3.055399, 1, 0.972549, 0, 1,
-0.949038, -1.400865, -2.540788, 1, 0.9764706, 0, 1,
-0.9459847, -1.237444, -3.316845, 1, 0.9843137, 0, 1,
-0.9437828, 0.7021444, -1.759162, 1, 0.9882353, 0, 1,
-0.9435493, 0.4324225, -1.867287, 1, 0.9960784, 0, 1,
-0.9372792, 0.1834462, -1.722266, 0.9960784, 1, 0, 1,
-0.9370434, 0.4022307, -0.7891209, 0.9921569, 1, 0, 1,
-0.9207053, 0.9705098, 2.296875, 0.9843137, 1, 0, 1,
-0.9167337, -0.5662243, -2.471672, 0.9803922, 1, 0, 1,
-0.9049839, -0.2099685, -1.427125, 0.972549, 1, 0, 1,
-0.9030851, 0.9204068, -0.9038783, 0.9686275, 1, 0, 1,
-0.8983397, -0.3835886, -1.038287, 0.9607843, 1, 0, 1,
-0.8971937, 0.8975315, -1.777022, 0.9568627, 1, 0, 1,
-0.893734, 1.334079, -1.487837, 0.9490196, 1, 0, 1,
-0.8920327, 0.4125786, -2.179221, 0.945098, 1, 0, 1,
-0.8877726, -1.077287, -2.70873, 0.9372549, 1, 0, 1,
-0.8842378, -0.05486559, -1.767789, 0.9333333, 1, 0, 1,
-0.8832908, -0.3911723, -1.961816, 0.9254902, 1, 0, 1,
-0.8779981, 1.236172, -1.110829, 0.9215686, 1, 0, 1,
-0.8765891, -2.09228, -3.579006, 0.9137255, 1, 0, 1,
-0.8747346, 0.0762644, -1.123391, 0.9098039, 1, 0, 1,
-0.8661163, 2.445311, 0.9100442, 0.9019608, 1, 0, 1,
-0.8505287, -0.8443139, -4.099114, 0.8941177, 1, 0, 1,
-0.8480489, -1.228, -4.011378, 0.8901961, 1, 0, 1,
-0.8457733, 0.2804565, -0.43702, 0.8823529, 1, 0, 1,
-0.8450316, -0.139999, -3.841941, 0.8784314, 1, 0, 1,
-0.8424829, 1.098055, -0.3840889, 0.8705882, 1, 0, 1,
-0.8424119, -0.4837663, -3.450475, 0.8666667, 1, 0, 1,
-0.838744, -1.191225, -2.281424, 0.8588235, 1, 0, 1,
-0.8381739, 0.4044686, -2.021083, 0.854902, 1, 0, 1,
-0.8380389, 0.3634084, -3.653452, 0.8470588, 1, 0, 1,
-0.8337621, 0.1992909, -0.09065483, 0.8431373, 1, 0, 1,
-0.8289589, 0.7177396, -1.802723, 0.8352941, 1, 0, 1,
-0.8240739, 1.474803, -1.258293, 0.8313726, 1, 0, 1,
-0.813337, -0.2872412, -2.078653, 0.8235294, 1, 0, 1,
-0.8129598, -0.7254976, -2.527668, 0.8196079, 1, 0, 1,
-0.8123943, -1.465502, -2.59264, 0.8117647, 1, 0, 1,
-0.8030012, 0.9307331, -1.1713, 0.8078431, 1, 0, 1,
-0.8002432, 1.886783, 0.3628127, 0.8, 1, 0, 1,
-0.7990593, -1.610436, -2.517593, 0.7921569, 1, 0, 1,
-0.7989293, 2.050626, -0.4601938, 0.7882353, 1, 0, 1,
-0.7988895, 1.095298, 0.6278375, 0.7803922, 1, 0, 1,
-0.7954305, -0.4757162, -0.664064, 0.7764706, 1, 0, 1,
-0.7900857, 0.9162754, -1.447352, 0.7686275, 1, 0, 1,
-0.7900376, 0.1827079, -1.322867, 0.7647059, 1, 0, 1,
-0.7879692, -0.200417, -2.19589, 0.7568628, 1, 0, 1,
-0.7878277, -0.6331291, -2.001053, 0.7529412, 1, 0, 1,
-0.7753072, -0.5026302, -2.356973, 0.7450981, 1, 0, 1,
-0.7632118, 0.1126287, -1.806753, 0.7411765, 1, 0, 1,
-0.7628845, -1.892553, -3.948256, 0.7333333, 1, 0, 1,
-0.762465, -1.841721, -3.853436, 0.7294118, 1, 0, 1,
-0.7610601, 0.2849782, -2.569224, 0.7215686, 1, 0, 1,
-0.7548325, -0.4232785, -1.798514, 0.7176471, 1, 0, 1,
-0.7533892, -0.2499016, -3.1227, 0.7098039, 1, 0, 1,
-0.7459348, 2.200411, 0.5254631, 0.7058824, 1, 0, 1,
-0.7454447, 0.2967069, -1.055616, 0.6980392, 1, 0, 1,
-0.7418831, -0.1894101, -1.162498, 0.6901961, 1, 0, 1,
-0.7396155, 0.008696803, -0.6171693, 0.6862745, 1, 0, 1,
-0.7392803, 2.345819, 0.3721773, 0.6784314, 1, 0, 1,
-0.7355249, -0.1009284, -1.76223, 0.6745098, 1, 0, 1,
-0.7279292, 1.537597, -0.81664, 0.6666667, 1, 0, 1,
-0.7236145, 0.5390839, -2.444285, 0.6627451, 1, 0, 1,
-0.7203185, -0.2987103, -2.582762, 0.654902, 1, 0, 1,
-0.7125781, 1.504981, -1.764752, 0.6509804, 1, 0, 1,
-0.7125171, 1.80186, -1.350476, 0.6431373, 1, 0, 1,
-0.7106044, -0.3786977, -1.778144, 0.6392157, 1, 0, 1,
-0.7066192, -0.8250288, -0.496451, 0.6313726, 1, 0, 1,
-0.7049395, -0.3156961, -0.8946972, 0.627451, 1, 0, 1,
-0.7035725, -0.7676862, -2.167338, 0.6196079, 1, 0, 1,
-0.7035344, -0.3212427, -3.10614, 0.6156863, 1, 0, 1,
-0.7022702, 0.2963824, -0.7710901, 0.6078432, 1, 0, 1,
-0.7005734, -1.215388, -1.22071, 0.6039216, 1, 0, 1,
-0.7004358, -0.4356828, -3.385154, 0.5960785, 1, 0, 1,
-0.6964075, -2.11264, -3.117474, 0.5882353, 1, 0, 1,
-0.6844432, 0.886821, -1.193935, 0.5843138, 1, 0, 1,
-0.6833814, 0.6293321, -1.380874, 0.5764706, 1, 0, 1,
-0.6708157, 0.5732834, -0.8204126, 0.572549, 1, 0, 1,
-0.6697455, -0.1146212, -1.876963, 0.5647059, 1, 0, 1,
-0.6676006, -0.556268, -1.859171, 0.5607843, 1, 0, 1,
-0.666688, 0.3148934, -3.809722, 0.5529412, 1, 0, 1,
-0.663016, 0.741376, -0.2405451, 0.5490196, 1, 0, 1,
-0.6610147, -0.3824684, -1.296615, 0.5411765, 1, 0, 1,
-0.6589084, -0.1234551, -3.326862, 0.5372549, 1, 0, 1,
-0.6529885, -0.1057979, -1.970421, 0.5294118, 1, 0, 1,
-0.6482602, -0.3170484, -2.04673, 0.5254902, 1, 0, 1,
-0.6481179, 0.1324615, -3.167315, 0.5176471, 1, 0, 1,
-0.6400188, 0.00679084, -2.018419, 0.5137255, 1, 0, 1,
-0.6389896, -0.5828897, -3.196843, 0.5058824, 1, 0, 1,
-0.6323805, 0.1153833, -0.4804263, 0.5019608, 1, 0, 1,
-0.6281399, 0.5729998, 0.1331906, 0.4941176, 1, 0, 1,
-0.6268038, -0.5431396, -1.986962, 0.4862745, 1, 0, 1,
-0.6236737, 1.121875, -1.114092, 0.4823529, 1, 0, 1,
-0.621968, 0.7573138, -1.601498, 0.4745098, 1, 0, 1,
-0.6188526, 0.2851316, -1.136091, 0.4705882, 1, 0, 1,
-0.6150886, 0.9681402, -0.5004106, 0.4627451, 1, 0, 1,
-0.6140229, -1.304842, -2.503627, 0.4588235, 1, 0, 1,
-0.6123938, 0.1461777, -0.6586476, 0.4509804, 1, 0, 1,
-0.6108438, -0.005811683, -2.179187, 0.4470588, 1, 0, 1,
-0.5988362, -0.4009574, -2.458377, 0.4392157, 1, 0, 1,
-0.5956194, -1.071657, -3.511724, 0.4352941, 1, 0, 1,
-0.5949515, -1.594098, -3.578384, 0.427451, 1, 0, 1,
-0.5893338, -0.06699146, -3.163254, 0.4235294, 1, 0, 1,
-0.5829996, 0.4705195, -2.271016, 0.4156863, 1, 0, 1,
-0.5802751, 0.5205741, -0.3727283, 0.4117647, 1, 0, 1,
-0.575765, 0.8935082, -0.4311081, 0.4039216, 1, 0, 1,
-0.5703065, -1.993182, -2.379122, 0.3960784, 1, 0, 1,
-0.5621339, 1.278033, 0.4152316, 0.3921569, 1, 0, 1,
-0.5620801, -1.67033, -3.018835, 0.3843137, 1, 0, 1,
-0.5597712, -0.0511609, -2.320715, 0.3803922, 1, 0, 1,
-0.5591572, 0.564403, -0.7114252, 0.372549, 1, 0, 1,
-0.5556914, -1.079918, -3.261067, 0.3686275, 1, 0, 1,
-0.5536288, 0.4461024, -0.739764, 0.3607843, 1, 0, 1,
-0.5501879, -0.3209523, -3.000813, 0.3568628, 1, 0, 1,
-0.5418485, -1.693547, -2.052831, 0.3490196, 1, 0, 1,
-0.5263392, 0.8247632, -0.8219534, 0.345098, 1, 0, 1,
-0.5212724, 0.03084579, -1.524675, 0.3372549, 1, 0, 1,
-0.5198476, -0.3839032, -1.740683, 0.3333333, 1, 0, 1,
-0.5193228, -1.114004, -3.610129, 0.3254902, 1, 0, 1,
-0.5181416, 0.3321775, 0.3559754, 0.3215686, 1, 0, 1,
-0.5136185, 1.238992, -0.5741662, 0.3137255, 1, 0, 1,
-0.5104063, 1.907323, -0.1448669, 0.3098039, 1, 0, 1,
-0.5066825, 0.4369033, -1.07479, 0.3019608, 1, 0, 1,
-0.5035971, 0.1608045, -1.902527, 0.2941177, 1, 0, 1,
-0.5033607, -0.3269986, -2.910373, 0.2901961, 1, 0, 1,
-0.5015534, -0.04079389, -2.694529, 0.282353, 1, 0, 1,
-0.5012931, -1.39187, -2.247288, 0.2784314, 1, 0, 1,
-0.4978707, -0.07390454, 0.1042174, 0.2705882, 1, 0, 1,
-0.4913418, 0.7360649, -2.261456, 0.2666667, 1, 0, 1,
-0.4912625, -0.4557875, -3.833499, 0.2588235, 1, 0, 1,
-0.4885407, -0.05898648, -0.1233716, 0.254902, 1, 0, 1,
-0.4849776, -0.4647738, -3.047604, 0.2470588, 1, 0, 1,
-0.4834137, -2.419489, -1.954348, 0.2431373, 1, 0, 1,
-0.4784603, 0.352922, -0.5973505, 0.2352941, 1, 0, 1,
-0.4761935, -1.237577, -2.529803, 0.2313726, 1, 0, 1,
-0.4748366, 0.8444983, 0.1640163, 0.2235294, 1, 0, 1,
-0.4748137, 0.8212697, 0.512682, 0.2196078, 1, 0, 1,
-0.4714544, -1.069481, -2.122184, 0.2117647, 1, 0, 1,
-0.4681829, -0.05712179, -0.186678, 0.2078431, 1, 0, 1,
-0.4642832, -0.4403814, -2.239454, 0.2, 1, 0, 1,
-0.4604316, 0.7692869, -1.050246, 0.1921569, 1, 0, 1,
-0.4572046, -0.9599947, -3.272283, 0.1882353, 1, 0, 1,
-0.4536642, -0.7110763, -2.405431, 0.1803922, 1, 0, 1,
-0.4516776, -1.107448, -2.114195, 0.1764706, 1, 0, 1,
-0.4509322, -0.2985538, -1.119659, 0.1686275, 1, 0, 1,
-0.4490363, -0.1188736, -3.301167, 0.1647059, 1, 0, 1,
-0.4454846, -2.664495, -3.020677, 0.1568628, 1, 0, 1,
-0.4454322, 0.4506074, 0.3903078, 0.1529412, 1, 0, 1,
-0.440579, -1.851263, -3.376915, 0.145098, 1, 0, 1,
-0.440487, -0.2846742, -2.812382, 0.1411765, 1, 0, 1,
-0.4376103, 0.4609275, -2.894324, 0.1333333, 1, 0, 1,
-0.4353129, -0.9442685, -1.714348, 0.1294118, 1, 0, 1,
-0.435237, -0.0617221, -2.680733, 0.1215686, 1, 0, 1,
-0.434364, 0.8331918, -1.713274, 0.1176471, 1, 0, 1,
-0.4329596, -1.162737, -1.999079, 0.1098039, 1, 0, 1,
-0.4230939, -0.32534, -3.562041, 0.1058824, 1, 0, 1,
-0.4213274, -0.8377287, -3.373845, 0.09803922, 1, 0, 1,
-0.4186046, -2.977828, -1.551546, 0.09019608, 1, 0, 1,
-0.4179188, 0.1752533, -1.578346, 0.08627451, 1, 0, 1,
-0.4168803, -0.2882346, -2.438459, 0.07843138, 1, 0, 1,
-0.4123418, -2.152845, -2.914863, 0.07450981, 1, 0, 1,
-0.4114583, -0.764223, -5.149869, 0.06666667, 1, 0, 1,
-0.4113027, 0.09580786, -0.8744873, 0.0627451, 1, 0, 1,
-0.4069832, -0.8781063, -2.5007, 0.05490196, 1, 0, 1,
-0.4003214, 0.9471362, 1.279633, 0.05098039, 1, 0, 1,
-0.3988896, -0.8403829, -2.115448, 0.04313726, 1, 0, 1,
-0.3987326, -0.2632794, -2.444188, 0.03921569, 1, 0, 1,
-0.3917573, 0.4349325, -0.3481909, 0.03137255, 1, 0, 1,
-0.3912347, 0.01453825, 0.1846383, 0.02745098, 1, 0, 1,
-0.3882428, 0.7215076, 0.1215633, 0.01960784, 1, 0, 1,
-0.3880811, -0.1425172, -4.183738, 0.01568628, 1, 0, 1,
-0.3809032, 1.30096, -1.768246, 0.007843138, 1, 0, 1,
-0.3787954, 0.3940555, -0.6592525, 0.003921569, 1, 0, 1,
-0.3764916, 1.188871, -0.7113648, 0, 1, 0.003921569, 1,
-0.3757417, 0.8202326, 0.08043353, 0, 1, 0.01176471, 1,
-0.3746754, -0.1145722, -2.806941, 0, 1, 0.01568628, 1,
-0.3742613, -2.235332, -1.031166, 0, 1, 0.02352941, 1,
-0.3740255, 1.206034, 0.4011368, 0, 1, 0.02745098, 1,
-0.3568214, -0.2270919, -0.9821672, 0, 1, 0.03529412, 1,
-0.3549596, -0.05557974, -2.626154, 0, 1, 0.03921569, 1,
-0.354931, -0.1252299, -2.017743, 0, 1, 0.04705882, 1,
-0.3537515, -0.4395898, -0.2058802, 0, 1, 0.05098039, 1,
-0.3523531, 0.9186487, -0.6373343, 0, 1, 0.05882353, 1,
-0.3513964, 1.192822, 0.8561975, 0, 1, 0.0627451, 1,
-0.3513286, 1.897727, 2.433036, 0, 1, 0.07058824, 1,
-0.3509262, -0.6585899, -3.489583, 0, 1, 0.07450981, 1,
-0.3489973, 0.4622828, -1.731685, 0, 1, 0.08235294, 1,
-0.3448425, -0.6552148, -2.076664, 0, 1, 0.08627451, 1,
-0.3430481, -0.3161398, -4.517751, 0, 1, 0.09411765, 1,
-0.3393494, -1.103144, -1.730367, 0, 1, 0.1019608, 1,
-0.3366975, -0.06929199, -0.1440329, 0, 1, 0.1058824, 1,
-0.3353279, 0.5316321, 1.892047, 0, 1, 0.1137255, 1,
-0.3345023, 0.2980092, -2.463343, 0, 1, 0.1176471, 1,
-0.3295252, -0.7734972, -0.6607255, 0, 1, 0.1254902, 1,
-0.3229097, -0.4624223, -3.581972, 0, 1, 0.1294118, 1,
-0.3220172, 0.3748963, -0.1255857, 0, 1, 0.1372549, 1,
-0.3212063, -0.7295135, -4.256413, 0, 1, 0.1411765, 1,
-0.3208566, 0.6406914, -0.0602987, 0, 1, 0.1490196, 1,
-0.3186636, -0.8319609, -0.8249813, 0, 1, 0.1529412, 1,
-0.3163384, -0.3561638, -0.6756845, 0, 1, 0.1607843, 1,
-0.3154531, 1.113231, -1.715973, 0, 1, 0.1647059, 1,
-0.3142771, -1.101024, -1.991313, 0, 1, 0.172549, 1,
-0.312306, -1.901617, -2.386826, 0, 1, 0.1764706, 1,
-0.3119601, -0.9480668, -2.544288, 0, 1, 0.1843137, 1,
-0.3106913, 0.4668998, 1.128285, 0, 1, 0.1882353, 1,
-0.3097509, -0.5917754, -1.174934, 0, 1, 0.1960784, 1,
-0.307095, -0.2194333, -2.910715, 0, 1, 0.2039216, 1,
-0.3067035, -0.748467, -2.395169, 0, 1, 0.2078431, 1,
-0.3056688, -0.4406147, -3.522011, 0, 1, 0.2156863, 1,
-0.3055324, -0.9976636, -1.533891, 0, 1, 0.2196078, 1,
-0.3053472, 1.937887, 1.490375, 0, 1, 0.227451, 1,
-0.3051111, -1.765738, -3.834022, 0, 1, 0.2313726, 1,
-0.304062, -0.3771778, -0.9505203, 0, 1, 0.2392157, 1,
-0.2989055, 0.7044109, -0.3706399, 0, 1, 0.2431373, 1,
-0.2987891, 1.246859, -0.08618874, 0, 1, 0.2509804, 1,
-0.2956258, 0.1503315, 0.6286255, 0, 1, 0.254902, 1,
-0.291727, -0.5415813, -2.506634, 0, 1, 0.2627451, 1,
-0.2889331, 0.1288845, -1.260344, 0, 1, 0.2666667, 1,
-0.2877044, -0.3535963, -2.159442, 0, 1, 0.2745098, 1,
-0.2873832, 1.784504, -0.6687528, 0, 1, 0.2784314, 1,
-0.2783203, -0.6199782, -2.616575, 0, 1, 0.2862745, 1,
-0.2740349, 0.4586298, 0.425464, 0, 1, 0.2901961, 1,
-0.273489, 0.4968468, -2.427706, 0, 1, 0.2980392, 1,
-0.2729475, 0.4726459, -1.931538, 0, 1, 0.3058824, 1,
-0.270011, -0.9578785, -2.09678, 0, 1, 0.3098039, 1,
-0.2660773, -0.491354, -2.999394, 0, 1, 0.3176471, 1,
-0.2654641, 1.231877, -0.6452489, 0, 1, 0.3215686, 1,
-0.2596471, 0.7459444, -1.76891, 0, 1, 0.3294118, 1,
-0.2593535, -0.2009604, -1.351407, 0, 1, 0.3333333, 1,
-0.2564789, -0.3280187, -3.409954, 0, 1, 0.3411765, 1,
-0.2518296, -2.318877, -4.274279, 0, 1, 0.345098, 1,
-0.2484855, 0.3024996, -1.316415, 0, 1, 0.3529412, 1,
-0.2452425, -1.282002, -4.470673, 0, 1, 0.3568628, 1,
-0.2446431, -0.300493, -3.43715, 0, 1, 0.3647059, 1,
-0.2433113, -1.250871, -1.279349, 0, 1, 0.3686275, 1,
-0.2339069, 0.6064196, -0.774155, 0, 1, 0.3764706, 1,
-0.2329893, 0.9063963, -1.391629, 0, 1, 0.3803922, 1,
-0.2319221, 0.8424984, -0.3890957, 0, 1, 0.3882353, 1,
-0.2314569, 0.9998617, -2.695908, 0, 1, 0.3921569, 1,
-0.2296547, -1.786629, -4.202494, 0, 1, 0.4, 1,
-0.2244257, 0.5759309, 0.4391398, 0, 1, 0.4078431, 1,
-0.2204537, -0.7019988, -2.362247, 0, 1, 0.4117647, 1,
-0.2153625, -1.060468, -0.8877, 0, 1, 0.4196078, 1,
-0.2103644, 0.4152118, 0.2726267, 0, 1, 0.4235294, 1,
-0.202961, -0.005131426, -2.480582, 0, 1, 0.4313726, 1,
-0.2011285, 0.1170499, -1.292549, 0, 1, 0.4352941, 1,
-0.1989042, -1.872816, -5.150414, 0, 1, 0.4431373, 1,
-0.1926802, -1.43469, -3.120702, 0, 1, 0.4470588, 1,
-0.191212, -2.036742, -3.462383, 0, 1, 0.454902, 1,
-0.1874416, 0.2834977, -1.6845, 0, 1, 0.4588235, 1,
-0.1851057, -0.6934226, -3.273544, 0, 1, 0.4666667, 1,
-0.1825924, -0.4201289, -2.045043, 0, 1, 0.4705882, 1,
-0.1820066, -0.4561947, -1.69178, 0, 1, 0.4784314, 1,
-0.1818163, -0.7590678, -2.730317, 0, 1, 0.4823529, 1,
-0.1798947, 1.434149, -0.6157621, 0, 1, 0.4901961, 1,
-0.1794216, -0.8822007, -2.945935, 0, 1, 0.4941176, 1,
-0.1727606, -0.3222267, -2.6554, 0, 1, 0.5019608, 1,
-0.1702296, 0.5192336, -0.3644623, 0, 1, 0.509804, 1,
-0.1699282, -2.554944, -3.143071, 0, 1, 0.5137255, 1,
-0.1696801, -0.4538648, -2.429766, 0, 1, 0.5215687, 1,
-0.1687218, 0.6357593, -0.5499162, 0, 1, 0.5254902, 1,
-0.1685287, -1.050646, -3.844362, 0, 1, 0.5333334, 1,
-0.1681631, 0.7371312, 0.6685841, 0, 1, 0.5372549, 1,
-0.1676732, -1.038271, -2.666785, 0, 1, 0.5450981, 1,
-0.1615768, 1.617608, 0.1784211, 0, 1, 0.5490196, 1,
-0.1581324, 0.6192538, 0.5989029, 0, 1, 0.5568628, 1,
-0.1523093, -1.226359, -3.783742, 0, 1, 0.5607843, 1,
-0.1455209, -0.9526554, -2.794126, 0, 1, 0.5686275, 1,
-0.1405298, 1.118044, -2.451283, 0, 1, 0.572549, 1,
-0.1389484, 0.6502562, -0.2831626, 0, 1, 0.5803922, 1,
-0.1385273, 1.038546, -2.093713, 0, 1, 0.5843138, 1,
-0.1362991, 0.09903541, -2.664458, 0, 1, 0.5921569, 1,
-0.1349738, 0.4281701, 0.2185152, 0, 1, 0.5960785, 1,
-0.1344435, 1.375833, 2.396555, 0, 1, 0.6039216, 1,
-0.1343855, 2.043944, -0.921151, 0, 1, 0.6117647, 1,
-0.1330055, 1.025684, 0.07839911, 0, 1, 0.6156863, 1,
-0.1285046, -0.3530668, -1.590448, 0, 1, 0.6235294, 1,
-0.1198032, 1.221018, 0.4109429, 0, 1, 0.627451, 1,
-0.1172072, 0.4631067, 1.131609, 0, 1, 0.6352941, 1,
-0.1168815, 1.577169, 0.5546134, 0, 1, 0.6392157, 1,
-0.1078813, 1.772997, 0.963825, 0, 1, 0.6470588, 1,
-0.1054677, 1.186453, -0.3857806, 0, 1, 0.6509804, 1,
-0.1032165, 1.721051, -0.1549732, 0, 1, 0.6588235, 1,
-0.1007129, -0.413339, -2.541286, 0, 1, 0.6627451, 1,
-0.1005601, 0.1586514, -0.4580259, 0, 1, 0.6705883, 1,
-0.0999609, -0.4861041, -2.872112, 0, 1, 0.6745098, 1,
-0.09776931, 1.411308, 1.972906, 0, 1, 0.682353, 1,
-0.09590089, 0.6947681, -0.6913145, 0, 1, 0.6862745, 1,
-0.09161114, 1.329223, 0.2081429, 0, 1, 0.6941177, 1,
-0.08766294, 0.4788237, -0.8241639, 0, 1, 0.7019608, 1,
-0.08685916, -0.4882878, -1.994012, 0, 1, 0.7058824, 1,
-0.08351722, 0.4849815, -0.5478793, 0, 1, 0.7137255, 1,
-0.08141275, -0.5442162, -2.729292, 0, 1, 0.7176471, 1,
-0.08076281, -0.3231578, -2.962117, 0, 1, 0.7254902, 1,
-0.08052945, 0.8643602, -0.8256791, 0, 1, 0.7294118, 1,
-0.07241873, -1.254672, -3.422737, 0, 1, 0.7372549, 1,
-0.06518421, -0.874139, -3.138629, 0, 1, 0.7411765, 1,
-0.06107971, 0.6434421, 1.882648, 0, 1, 0.7490196, 1,
-0.05722543, 0.3781396, 0.5639158, 0, 1, 0.7529412, 1,
-0.05590528, 0.1776144, -0.108091, 0, 1, 0.7607843, 1,
-0.05373403, -0.1085118, -1.80005, 0, 1, 0.7647059, 1,
-0.05352649, 0.670159, -0.2816626, 0, 1, 0.772549, 1,
-0.05061311, -0.3069259, -5.016642, 0, 1, 0.7764706, 1,
-0.04748978, -0.4676753, -2.951661, 0, 1, 0.7843137, 1,
-0.04710569, -0.9241964, -2.973174, 0, 1, 0.7882353, 1,
-0.04644186, -0.190905, -3.859555, 0, 1, 0.7960784, 1,
-0.04186598, -1.281195, -1.427712, 0, 1, 0.8039216, 1,
-0.03994489, 0.5752935, -1.341403, 0, 1, 0.8078431, 1,
-0.03909695, -0.3999464, -3.728171, 0, 1, 0.8156863, 1,
-0.03890505, -0.02273906, -1.802323, 0, 1, 0.8196079, 1,
-0.03847922, -1.604868, -1.513742, 0, 1, 0.827451, 1,
-0.03825174, -0.7195547, -2.979237, 0, 1, 0.8313726, 1,
-0.03281944, -0.3963158, -1.968363, 0, 1, 0.8392157, 1,
-0.03024736, 0.591543, -0.233256, 0, 1, 0.8431373, 1,
-0.02770987, 1.813096, -1.203127, 0, 1, 0.8509804, 1,
-0.02564238, -0.2259695, -3.257973, 0, 1, 0.854902, 1,
-0.02441937, 0.5736222, -1.193461, 0, 1, 0.8627451, 1,
-0.02169493, -0.4713776, -3.994414, 0, 1, 0.8666667, 1,
-0.01974352, 1.791283, -2.138296, 0, 1, 0.8745098, 1,
-0.01303993, -0.4378979, -4.014836, 0, 1, 0.8784314, 1,
-0.009754696, 0.3261668, -1.610395, 0, 1, 0.8862745, 1,
-0.008218142, -0.847419, -2.247608, 0, 1, 0.8901961, 1,
-0.005717021, -0.090138, -2.974488, 0, 1, 0.8980392, 1,
0.001404419, -0.6796672, 3.46336, 0, 1, 0.9058824, 1,
0.001527298, 0.3490319, 1.481231, 0, 1, 0.9098039, 1,
0.00486414, 1.065367, 1.03421, 0, 1, 0.9176471, 1,
0.006237908, 0.4019227, 0.4849382, 0, 1, 0.9215686, 1,
0.01564002, -0.4597845, 3.278588, 0, 1, 0.9294118, 1,
0.02270192, 0.7965537, 1.717904, 0, 1, 0.9333333, 1,
0.02425759, -0.4498051, 3.930957, 0, 1, 0.9411765, 1,
0.02509882, -0.7397024, 2.462416, 0, 1, 0.945098, 1,
0.02812433, 0.2848213, 0.3909822, 0, 1, 0.9529412, 1,
0.03032687, -1.163955, 1.780168, 0, 1, 0.9568627, 1,
0.03260297, -0.9268329, 2.587799, 0, 1, 0.9647059, 1,
0.0340524, -1.313175, 2.533632, 0, 1, 0.9686275, 1,
0.03424513, -1.510433, 5.242553, 0, 1, 0.9764706, 1,
0.03729298, -0.5803477, 4.544972, 0, 1, 0.9803922, 1,
0.04459312, -0.2787123, 3.983218, 0, 1, 0.9882353, 1,
0.04537106, -0.138013, 3.672702, 0, 1, 0.9921569, 1,
0.04646245, 0.7360653, -1.094624, 0, 1, 1, 1,
0.05104014, 0.1537159, 3.030594, 0, 0.9921569, 1, 1,
0.05233712, -0.574419, 2.094838, 0, 0.9882353, 1, 1,
0.05468602, -0.7982568, 2.374066, 0, 0.9803922, 1, 1,
0.05525063, -0.5519946, 3.246761, 0, 0.9764706, 1, 1,
0.05619537, 0.2479057, 0.9390909, 0, 0.9686275, 1, 1,
0.0569041, 0.08846132, 2.960238, 0, 0.9647059, 1, 1,
0.06083349, -0.1867162, 4.207971, 0, 0.9568627, 1, 1,
0.06098841, -0.1796543, 3.570148, 0, 0.9529412, 1, 1,
0.06735788, 1.796127, -0.6522967, 0, 0.945098, 1, 1,
0.06987637, 1.625471, -1.05675, 0, 0.9411765, 1, 1,
0.07903895, 0.7302881, 0.5884118, 0, 0.9333333, 1, 1,
0.07964971, 0.7441812, -1.027243, 0, 0.9294118, 1, 1,
0.08670312, 0.5044389, -2.277138, 0, 0.9215686, 1, 1,
0.08852072, -1.653816, 4.291761, 0, 0.9176471, 1, 1,
0.09009703, 0.1316074, 1.266964, 0, 0.9098039, 1, 1,
0.09031198, 1.101386, -0.8538094, 0, 0.9058824, 1, 1,
0.09075481, -0.5221315, 2.185292, 0, 0.8980392, 1, 1,
0.09452207, -0.6590316, 3.810047, 0, 0.8901961, 1, 1,
0.09458286, -0.694702, 2.563695, 0, 0.8862745, 1, 1,
0.09494447, 1.510174, 0.1306419, 0, 0.8784314, 1, 1,
0.09613775, -1.117777, 4.231954, 0, 0.8745098, 1, 1,
0.09688983, -1.075853, 2.146101, 0, 0.8666667, 1, 1,
0.09746287, -1.314112, 1.612387, 0, 0.8627451, 1, 1,
0.1052524, 1.678612, -0.5618102, 0, 0.854902, 1, 1,
0.1060838, 1.063623, 0.5555438, 0, 0.8509804, 1, 1,
0.106484, -0.3647551, 0.9814835, 0, 0.8431373, 1, 1,
0.1075775, 1.57621, 0.7044353, 0, 0.8392157, 1, 1,
0.1156173, 1.26982, -0.4397531, 0, 0.8313726, 1, 1,
0.1186243, -1.482553, 2.053447, 0, 0.827451, 1, 1,
0.1186858, 1.956221, -0.5634101, 0, 0.8196079, 1, 1,
0.1216437, 1.117178, -0.7182386, 0, 0.8156863, 1, 1,
0.1229107, 1.240924, 0.1846241, 0, 0.8078431, 1, 1,
0.1336878, 0.1386304, 0.2269827, 0, 0.8039216, 1, 1,
0.1352865, -0.5373861, 1.467888, 0, 0.7960784, 1, 1,
0.1363744, -0.5842012, 2.032743, 0, 0.7882353, 1, 1,
0.1372573, -0.5431588, 2.601164, 0, 0.7843137, 1, 1,
0.1381028, 0.4817404, -0.6125776, 0, 0.7764706, 1, 1,
0.1385732, -0.3012563, 1.314678, 0, 0.772549, 1, 1,
0.1406534, -2.565508, 1.812723, 0, 0.7647059, 1, 1,
0.1414162, -1.699804, 4.861842, 0, 0.7607843, 1, 1,
0.1425022, -1.100296, 2.496807, 0, 0.7529412, 1, 1,
0.1514598, -0.1110715, 2.468005, 0, 0.7490196, 1, 1,
0.1564075, 1.992631, 0.7943217, 0, 0.7411765, 1, 1,
0.1641562, 0.6017675, -0.2777022, 0, 0.7372549, 1, 1,
0.1687635, -0.4188214, 1.132234, 0, 0.7294118, 1, 1,
0.1704584, -0.1360665, 3.514508, 0, 0.7254902, 1, 1,
0.1708663, -0.2259729, 1.413071, 0, 0.7176471, 1, 1,
0.173906, -0.4275794, 2.88628, 0, 0.7137255, 1, 1,
0.175119, -0.3646679, 2.22114, 0, 0.7058824, 1, 1,
0.1782273, 0.5702208, -0.5510926, 0, 0.6980392, 1, 1,
0.1795464, 1.180771, 0.9385759, 0, 0.6941177, 1, 1,
0.1817295, 0.1294864, 1.377369, 0, 0.6862745, 1, 1,
0.1836166, -0.02063856, 1.763062, 0, 0.682353, 1, 1,
0.1850177, 0.4007288, -1.318622, 0, 0.6745098, 1, 1,
0.1866321, -0.7252344, 3.793337, 0, 0.6705883, 1, 1,
0.1876437, 0.7242908, 0.2423465, 0, 0.6627451, 1, 1,
0.18821, 0.2845564, -0.0187311, 0, 0.6588235, 1, 1,
0.188317, 0.2839993, 1.956596, 0, 0.6509804, 1, 1,
0.1919242, 1.626433, 0.0723152, 0, 0.6470588, 1, 1,
0.1925396, 1.601708, -1.040026, 0, 0.6392157, 1, 1,
0.1964563, 0.2511701, -0.1676149, 0, 0.6352941, 1, 1,
0.1972025, 0.2319435, 0.2340433, 0, 0.627451, 1, 1,
0.201006, 0.786368, -0.176452, 0, 0.6235294, 1, 1,
0.2014808, 0.5522771, -0.3835182, 0, 0.6156863, 1, 1,
0.2023916, -0.5507868, 1.451298, 0, 0.6117647, 1, 1,
0.2031022, -0.6567944, 3.123705, 0, 0.6039216, 1, 1,
0.2069331, -0.06505717, 2.922462, 0, 0.5960785, 1, 1,
0.211826, 0.273582, -0.1297012, 0, 0.5921569, 1, 1,
0.2165755, 2.773254, -0.5828446, 0, 0.5843138, 1, 1,
0.2166812, -1.340656, 3.811355, 0, 0.5803922, 1, 1,
0.2185029, 1.346974, 0.06230492, 0, 0.572549, 1, 1,
0.2274077, 0.9853991, 1.533158, 0, 0.5686275, 1, 1,
0.2315782, -0.3566009, 4.161031, 0, 0.5607843, 1, 1,
0.2332596, -0.793058, 4.402296, 0, 0.5568628, 1, 1,
0.2362606, -0.461381, 1.98276, 0, 0.5490196, 1, 1,
0.2408463, -0.8751434, 3.817498, 0, 0.5450981, 1, 1,
0.2440585, 1.413035, 0.7587357, 0, 0.5372549, 1, 1,
0.2502808, -0.7552809, 2.069331, 0, 0.5333334, 1, 1,
0.2524052, 0.3779713, 1.409818, 0, 0.5254902, 1, 1,
0.2531432, 1.397215, 1.167678, 0, 0.5215687, 1, 1,
0.2555026, -1.327264, 3.62731, 0, 0.5137255, 1, 1,
0.2578314, -2.267696, 2.522732, 0, 0.509804, 1, 1,
0.2593673, 0.7489575, -0.2155205, 0, 0.5019608, 1, 1,
0.2605852, -0.9282959, 3.710993, 0, 0.4941176, 1, 1,
0.2639404, 0.6055352, 1.816883, 0, 0.4901961, 1, 1,
0.2642134, -1.325551, 1.527219, 0, 0.4823529, 1, 1,
0.2655964, -1.007273, 2.980537, 0, 0.4784314, 1, 1,
0.2656544, 1.367982, 0.9473764, 0, 0.4705882, 1, 1,
0.2708507, -0.7613661, 4.070292, 0, 0.4666667, 1, 1,
0.2734921, 0.7353061, -1.609872, 0, 0.4588235, 1, 1,
0.2761739, -3.13327, 2.385427, 0, 0.454902, 1, 1,
0.2818961, -0.6589013, 3.780899, 0, 0.4470588, 1, 1,
0.2821156, -1.853369, 3.632068, 0, 0.4431373, 1, 1,
0.2858362, -0.6798329, 2.062843, 0, 0.4352941, 1, 1,
0.2918284, -1.226637, 3.196719, 0, 0.4313726, 1, 1,
0.2931315, 1.039124, 0.06688063, 0, 0.4235294, 1, 1,
0.2986136, -0.7621136, 2.837275, 0, 0.4196078, 1, 1,
0.2986618, -0.1181609, 2.847831, 0, 0.4117647, 1, 1,
0.299327, -1.714883, 1.16662, 0, 0.4078431, 1, 1,
0.2998933, 2.447975, 1.048829, 0, 0.4, 1, 1,
0.3041353, 0.4590116, 1.309999, 0, 0.3921569, 1, 1,
0.3056019, -0.6446633, 2.338515, 0, 0.3882353, 1, 1,
0.3076072, -0.8849733, 2.795193, 0, 0.3803922, 1, 1,
0.3099999, -0.7191246, 2.778142, 0, 0.3764706, 1, 1,
0.3123425, -0.4718465, 0.8863822, 0, 0.3686275, 1, 1,
0.3206631, 0.8400537, 0.6859977, 0, 0.3647059, 1, 1,
0.3243014, 0.4301746, -1.170046, 0, 0.3568628, 1, 1,
0.326992, -0.03203507, 0.9775887, 0, 0.3529412, 1, 1,
0.3291579, -0.289602, 2.178798, 0, 0.345098, 1, 1,
0.3294023, 2.014028, -0.08608832, 0, 0.3411765, 1, 1,
0.3317813, 1.221948, -0.5232644, 0, 0.3333333, 1, 1,
0.3348463, 1.113132, -1.132799, 0, 0.3294118, 1, 1,
0.336058, -0.6665298, 2.06086, 0, 0.3215686, 1, 1,
0.3411643, 0.1559071, -0.1827672, 0, 0.3176471, 1, 1,
0.343215, -2.072759, 2.747205, 0, 0.3098039, 1, 1,
0.3453784, 0.3026449, 1.051862, 0, 0.3058824, 1, 1,
0.3477123, 0.7939147, 0.2585964, 0, 0.2980392, 1, 1,
0.3521767, 0.6506366, 0.2312926, 0, 0.2901961, 1, 1,
0.3522477, -0.9601884, 5.078677, 0, 0.2862745, 1, 1,
0.35239, 0.5318057, -0.2359634, 0, 0.2784314, 1, 1,
0.3536688, 0.9549282, 1.741953, 0, 0.2745098, 1, 1,
0.354682, 1.062302, 1.247354, 0, 0.2666667, 1, 1,
0.3569303, -0.6798345, 1.492254, 0, 0.2627451, 1, 1,
0.3682276, -0.2380009, 2.323985, 0, 0.254902, 1, 1,
0.3704048, 0.3715698, 0.1011721, 0, 0.2509804, 1, 1,
0.3722908, -2.090968, 4.02639, 0, 0.2431373, 1, 1,
0.373033, -0.7193968, 3.223841, 0, 0.2392157, 1, 1,
0.3734255, 0.5752822, -0.6804992, 0, 0.2313726, 1, 1,
0.3743434, -0.4840015, 1.144293, 0, 0.227451, 1, 1,
0.3744563, 1.316387, -0.2918628, 0, 0.2196078, 1, 1,
0.3772416, -0.711326, 3.172627, 0, 0.2156863, 1, 1,
0.3930372, 1.120446, 0.1515822, 0, 0.2078431, 1, 1,
0.3931915, 0.08864202, 2.0848, 0, 0.2039216, 1, 1,
0.3938656, 0.4886486, 1.424401, 0, 0.1960784, 1, 1,
0.3952267, -1.640779, 3.575717, 0, 0.1882353, 1, 1,
0.3976916, -1.756113, 3.928333, 0, 0.1843137, 1, 1,
0.3995658, 0.227314, 0.448997, 0, 0.1764706, 1, 1,
0.399942, -2.366662, 2.695568, 0, 0.172549, 1, 1,
0.4005438, 0.5082994, -0.04588724, 0, 0.1647059, 1, 1,
0.4007602, 0.6359337, -0.09383912, 0, 0.1607843, 1, 1,
0.4018674, 0.4205758, 0.5409396, 0, 0.1529412, 1, 1,
0.4060653, 0.08411894, 0.3330721, 0, 0.1490196, 1, 1,
0.4076261, -0.7351139, 3.03859, 0, 0.1411765, 1, 1,
0.4105734, 0.3306443, -0.08861984, 0, 0.1372549, 1, 1,
0.4110285, -0.5242113, 3.313262, 0, 0.1294118, 1, 1,
0.4122162, -1.860007, 3.270281, 0, 0.1254902, 1, 1,
0.4131912, -0.2018003, 3.702071, 0, 0.1176471, 1, 1,
0.4142851, -0.6983922, 4.540081, 0, 0.1137255, 1, 1,
0.4144448, 0.4487945, -1.15474, 0, 0.1058824, 1, 1,
0.4150367, 1.027053, 0.2693281, 0, 0.09803922, 1, 1,
0.4153709, 0.5180358, 0.01095304, 0, 0.09411765, 1, 1,
0.4190635, -0.1913599, 0.9615106, 0, 0.08627451, 1, 1,
0.4204205, 0.445941, -0.9350641, 0, 0.08235294, 1, 1,
0.4218819, -1.010023, 2.113984, 0, 0.07450981, 1, 1,
0.4220874, 0.5887356, 0.9177206, 0, 0.07058824, 1, 1,
0.4227972, 0.6564391, 0.6231887, 0, 0.0627451, 1, 1,
0.4229336, 1.001158, -0.2165697, 0, 0.05882353, 1, 1,
0.4234132, -0.1010475, 2.444204, 0, 0.05098039, 1, 1,
0.4248855, 1.02886, 0.0242114, 0, 0.04705882, 1, 1,
0.4269759, -0.2322936, 2.247878, 0, 0.03921569, 1, 1,
0.4295928, -1.911156, 2.47368, 0, 0.03529412, 1, 1,
0.4327508, 0.3102147, 2.405331, 0, 0.02745098, 1, 1,
0.4346849, 0.07217088, 1.491587, 0, 0.02352941, 1, 1,
0.4355403, -0.1650828, 2.935256, 0, 0.01568628, 1, 1,
0.437932, -1.619424, 3.736248, 0, 0.01176471, 1, 1,
0.4403343, -1.102167, 2.606478, 0, 0.003921569, 1, 1,
0.4404875, -0.05547412, 1.635047, 0.003921569, 0, 1, 1,
0.4428195, 2.700202, 0.3453533, 0.007843138, 0, 1, 1,
0.4434624, -2.232466, 2.76101, 0.01568628, 0, 1, 1,
0.4465793, 0.08278765, 1.533097, 0.01960784, 0, 1, 1,
0.4536296, -0.2192888, 1.468102, 0.02745098, 0, 1, 1,
0.454318, 0.6169809, 0.08719698, 0.03137255, 0, 1, 1,
0.4552496, 0.9598873, 2.384518, 0.03921569, 0, 1, 1,
0.4600042, 0.3890768, 0.4083589, 0.04313726, 0, 1, 1,
0.4620028, -1.602154, 4.106658, 0.05098039, 0, 1, 1,
0.462282, 1.683487, 0.9285086, 0.05490196, 0, 1, 1,
0.4657205, -0.005222153, 1.102722, 0.0627451, 0, 1, 1,
0.4666986, -0.1571444, 1.222149, 0.06666667, 0, 1, 1,
0.4684248, -0.6413618, 2.347798, 0.07450981, 0, 1, 1,
0.47629, 0.07043567, 1.26975, 0.07843138, 0, 1, 1,
0.4782223, -1.110787, 3.806503, 0.08627451, 0, 1, 1,
0.4815145, 1.171043, 0.3509067, 0.09019608, 0, 1, 1,
0.4844961, 0.4980185, 0.8048769, 0.09803922, 0, 1, 1,
0.4860346, 1.181628, 0.4564685, 0.1058824, 0, 1, 1,
0.4901723, 1.093626, 0.565659, 0.1098039, 0, 1, 1,
0.4932226, -0.8225037, 1.333169, 0.1176471, 0, 1, 1,
0.494265, 0.1046539, 2.43364, 0.1215686, 0, 1, 1,
0.4953312, 1.127162, -0.1077715, 0.1294118, 0, 1, 1,
0.5012623, 1.301095, -0.2905587, 0.1333333, 0, 1, 1,
0.5016439, -0.2800755, 0.8340421, 0.1411765, 0, 1, 1,
0.5028588, -1.574191, 0.3258033, 0.145098, 0, 1, 1,
0.5036485, -0.3358456, 0.5810357, 0.1529412, 0, 1, 1,
0.5062561, -1.438882, 3.525464, 0.1568628, 0, 1, 1,
0.5069884, -1.199846, 2.390287, 0.1647059, 0, 1, 1,
0.5175615, -0.9655403, 0.9791936, 0.1686275, 0, 1, 1,
0.5185795, -1.616026, 2.431115, 0.1764706, 0, 1, 1,
0.5198045, -0.6131606, 1.449269, 0.1803922, 0, 1, 1,
0.5211337, 0.04688361, -0.277182, 0.1882353, 0, 1, 1,
0.5212464, -0.3014944, 1.218245, 0.1921569, 0, 1, 1,
0.5220304, -0.6607894, 2.243408, 0.2, 0, 1, 1,
0.5237919, -0.06451112, 2.209701, 0.2078431, 0, 1, 1,
0.5322398, -0.5891451, 4.006468, 0.2117647, 0, 1, 1,
0.5352141, -0.7779229, -0.2114223, 0.2196078, 0, 1, 1,
0.540306, 0.07181678, 2.123149, 0.2235294, 0, 1, 1,
0.5409144, 0.5995614, 1.990577, 0.2313726, 0, 1, 1,
0.5459531, 0.5011021, 0.6201901, 0.2352941, 0, 1, 1,
0.5474213, -0.6495205, 1.721718, 0.2431373, 0, 1, 1,
0.5515472, 0.6844099, -0.03032195, 0.2470588, 0, 1, 1,
0.5568841, 0.5201616, 0.9958666, 0.254902, 0, 1, 1,
0.5641738, -0.9858214, 2.150768, 0.2588235, 0, 1, 1,
0.5669603, -0.9068441, 3.387019, 0.2666667, 0, 1, 1,
0.5700898, 0.8397402, 0.2124267, 0.2705882, 0, 1, 1,
0.5704445, -1.14977, 2.508021, 0.2784314, 0, 1, 1,
0.5712485, 0.247057, 0.88449, 0.282353, 0, 1, 1,
0.5743625, -0.2451698, 2.227756, 0.2901961, 0, 1, 1,
0.578881, -1.103091, 2.50195, 0.2941177, 0, 1, 1,
0.5813327, -1.916072, 3.165004, 0.3019608, 0, 1, 1,
0.5822383, 0.9550177, 0.07628248, 0.3098039, 0, 1, 1,
0.585456, 0.006098608, 1.663922, 0.3137255, 0, 1, 1,
0.5990543, -0.1406128, 1.350259, 0.3215686, 0, 1, 1,
0.6000475, -1.317757, 3.945881, 0.3254902, 0, 1, 1,
0.6018209, -0.8822398, 2.085108, 0.3333333, 0, 1, 1,
0.6077981, -0.1766703, 1.378756, 0.3372549, 0, 1, 1,
0.6116388, -0.8946751, 3.180702, 0.345098, 0, 1, 1,
0.6123966, 0.7087034, 1.45113, 0.3490196, 0, 1, 1,
0.6150264, 0.2457201, -0.08519533, 0.3568628, 0, 1, 1,
0.6167689, 1.532308, 0.1791006, 0.3607843, 0, 1, 1,
0.6207845, 0.2987536, 3.121469, 0.3686275, 0, 1, 1,
0.6213161, -0.2217995, 2.317116, 0.372549, 0, 1, 1,
0.621678, 0.6429508, 0.1737729, 0.3803922, 0, 1, 1,
0.6262898, -2.336181, 1.777162, 0.3843137, 0, 1, 1,
0.6269011, -0.1923277, 2.488773, 0.3921569, 0, 1, 1,
0.6272343, -0.6068387, 2.626933, 0.3960784, 0, 1, 1,
0.6311562, -0.05040696, 1.796989, 0.4039216, 0, 1, 1,
0.6390192, 2.313799, 1.015534, 0.4117647, 0, 1, 1,
0.641838, -0.3269477, 1.913233, 0.4156863, 0, 1, 1,
0.6504599, -0.7152098, 2.376632, 0.4235294, 0, 1, 1,
0.651442, -0.4951613, 1.277031, 0.427451, 0, 1, 1,
0.6580006, 0.2713743, 0.9002713, 0.4352941, 0, 1, 1,
0.6602936, 2.073159, 1.831599, 0.4392157, 0, 1, 1,
0.6603521, -0.3767074, 2.273916, 0.4470588, 0, 1, 1,
0.6608108, -1.1374, 3.556829, 0.4509804, 0, 1, 1,
0.6644709, -0.4835702, 2.269814, 0.4588235, 0, 1, 1,
0.6712291, 0.09986007, 0.1820168, 0.4627451, 0, 1, 1,
0.6738531, -0.2597606, 0.6982809, 0.4705882, 0, 1, 1,
0.6762912, -0.06756943, 2.255413, 0.4745098, 0, 1, 1,
0.6785216, -0.2402991, 2.372066, 0.4823529, 0, 1, 1,
0.6788794, 0.3532016, -0.3698954, 0.4862745, 0, 1, 1,
0.6823317, -1.619778, 3.881039, 0.4941176, 0, 1, 1,
0.6935745, -0.8437868, 4.276544, 0.5019608, 0, 1, 1,
0.6959319, -2.021472, 3.12235, 0.5058824, 0, 1, 1,
0.6980576, -0.672443, 1.584377, 0.5137255, 0, 1, 1,
0.698918, -1.341677, 3.147322, 0.5176471, 0, 1, 1,
0.7002855, -0.3160229, 3.645632, 0.5254902, 0, 1, 1,
0.7008941, -1.263472, 2.952906, 0.5294118, 0, 1, 1,
0.7056084, -0.2082091, 0.9189906, 0.5372549, 0, 1, 1,
0.7132391, 0.3610733, 2.652623, 0.5411765, 0, 1, 1,
0.7152363, 1.833547, -0.6721105, 0.5490196, 0, 1, 1,
0.7153294, 1.019451, 0.05160512, 0.5529412, 0, 1, 1,
0.7153568, 0.3157901, 1.071955, 0.5607843, 0, 1, 1,
0.729085, -1.560098, 2.857049, 0.5647059, 0, 1, 1,
0.7372252, -1.590717, 1.563568, 0.572549, 0, 1, 1,
0.7376452, -0.6945049, 1.612081, 0.5764706, 0, 1, 1,
0.7440255, 0.3108145, 1.459532, 0.5843138, 0, 1, 1,
0.7443559, 0.03919077, 2.358073, 0.5882353, 0, 1, 1,
0.744658, -0.4265336, 2.589908, 0.5960785, 0, 1, 1,
0.7447302, 0.9220491, -1.043997, 0.6039216, 0, 1, 1,
0.7464671, -1.885949, 3.491885, 0.6078432, 0, 1, 1,
0.7538297, 0.04387598, 1.389712, 0.6156863, 0, 1, 1,
0.7620854, -1.52862, 1.920865, 0.6196079, 0, 1, 1,
0.7628739, 0.1793175, 1.365467, 0.627451, 0, 1, 1,
0.7742404, -0.7639674, 0.5211418, 0.6313726, 0, 1, 1,
0.7759815, -1.540863, 2.026618, 0.6392157, 0, 1, 1,
0.7772499, -1.81715, 4.84649, 0.6431373, 0, 1, 1,
0.7860274, 0.1739415, 2.839039, 0.6509804, 0, 1, 1,
0.7874555, 0.9155036, 1.411074, 0.654902, 0, 1, 1,
0.7878255, -0.7297603, 1.129657, 0.6627451, 0, 1, 1,
0.788938, 0.6175727, 1.160181, 0.6666667, 0, 1, 1,
0.7899439, -2.072526, 0.6303862, 0.6745098, 0, 1, 1,
0.7992424, -1.163503, 2.453253, 0.6784314, 0, 1, 1,
0.8066137, 0.9940052, 0.398929, 0.6862745, 0, 1, 1,
0.8074366, 0.9376422, 1.211933, 0.6901961, 0, 1, 1,
0.8094057, -0.1309484, 0.2160275, 0.6980392, 0, 1, 1,
0.8100349, -2.790215, 3.422694, 0.7058824, 0, 1, 1,
0.8142639, 0.6664418, 0.8218718, 0.7098039, 0, 1, 1,
0.8175374, 0.5938022, 2.05694, 0.7176471, 0, 1, 1,
0.819547, 0.8629449, 0.4162418, 0.7215686, 0, 1, 1,
0.8197339, -1.034927, 4.182181, 0.7294118, 0, 1, 1,
0.8251303, -0.435128, 1.312347, 0.7333333, 0, 1, 1,
0.8254391, -0.04955804, 1.46623, 0.7411765, 0, 1, 1,
0.8271598, -0.06208285, 1.732697, 0.7450981, 0, 1, 1,
0.8304778, 0.7488758, -0.2278055, 0.7529412, 0, 1, 1,
0.8326203, -0.004391346, 1.697928, 0.7568628, 0, 1, 1,
0.8327987, -0.1931221, 4.361191, 0.7647059, 0, 1, 1,
0.8345879, 0.02971788, 1.087673, 0.7686275, 0, 1, 1,
0.8368095, -1.366209, 3.604454, 0.7764706, 0, 1, 1,
0.838348, -0.09407547, 2.303332, 0.7803922, 0, 1, 1,
0.8405261, 2.323677, -1.021394, 0.7882353, 0, 1, 1,
0.8415565, -0.3671004, 1.174667, 0.7921569, 0, 1, 1,
0.8436375, -0.7949817, 3.024756, 0.8, 0, 1, 1,
0.8506218, -0.7226001, 2.606103, 0.8078431, 0, 1, 1,
0.8528261, 0.8430099, 2.29777, 0.8117647, 0, 1, 1,
0.8545825, 0.7076932, 0.8682435, 0.8196079, 0, 1, 1,
0.8546321, 0.4336535, 1.470356, 0.8235294, 0, 1, 1,
0.856169, -1.147763, 1.391115, 0.8313726, 0, 1, 1,
0.8562295, 0.5636742, 0.377405, 0.8352941, 0, 1, 1,
0.8660054, -1.122648, 0.117033, 0.8431373, 0, 1, 1,
0.8666286, -0.2027207, 1.20771, 0.8470588, 0, 1, 1,
0.8675967, 2.774508, 1.649673, 0.854902, 0, 1, 1,
0.8718986, 0.4955786, 0.4494685, 0.8588235, 0, 1, 1,
0.874557, -0.1223647, 1.574434, 0.8666667, 0, 1, 1,
0.8777053, -1.124908, 4.049091, 0.8705882, 0, 1, 1,
0.8797351, -1.528413, 2.602941, 0.8784314, 0, 1, 1,
0.8815405, -1.335186, 3.481287, 0.8823529, 0, 1, 1,
0.8831392, 0.2739476, 0.3398556, 0.8901961, 0, 1, 1,
0.8848356, -1.906848, 2.511643, 0.8941177, 0, 1, 1,
0.8864651, 0.07687542, 0.486543, 0.9019608, 0, 1, 1,
0.8867421, -1.262525, 2.157599, 0.9098039, 0, 1, 1,
0.8868048, 0.9032328, 2.248532, 0.9137255, 0, 1, 1,
0.8929648, 0.4179546, 1.312845, 0.9215686, 0, 1, 1,
0.8968541, -1.676978, 2.64744, 0.9254902, 0, 1, 1,
0.9011607, 0.1549614, 2.861659, 0.9333333, 0, 1, 1,
0.9074302, -1.78562, 2.356131, 0.9372549, 0, 1, 1,
0.9108058, -0.9130523, 3.459186, 0.945098, 0, 1, 1,
0.9163366, -1.602935, 1.460399, 0.9490196, 0, 1, 1,
0.9212623, -1.223575, 2.207498, 0.9568627, 0, 1, 1,
0.9252108, -0.9714279, 0.633978, 0.9607843, 0, 1, 1,
0.9259715, 0.9956645, 1.467245, 0.9686275, 0, 1, 1,
0.926313, -0.3848767, 1.484731, 0.972549, 0, 1, 1,
0.9311338, 0.237165, 1.876852, 0.9803922, 0, 1, 1,
0.936898, 1.076142, 1.27373, 0.9843137, 0, 1, 1,
0.9375517, -1.824035, 2.900692, 0.9921569, 0, 1, 1,
0.939635, 1.874464, 1.344438, 0.9960784, 0, 1, 1,
0.940111, -1.290008, 1.718179, 1, 0, 0.9960784, 1,
0.9538794, -0.9988124, -1.324776, 1, 0, 0.9882353, 1,
0.9605449, -0.1832309, 1.548109, 1, 0, 0.9843137, 1,
0.9607176, 2.882327, 0.2400952, 1, 0, 0.9764706, 1,
0.9670355, -0.4396056, 1.185308, 1, 0, 0.972549, 1,
0.9703206, -2.34237, 3.1215, 1, 0, 0.9647059, 1,
0.9731998, 0.1735017, 1.825331, 1, 0, 0.9607843, 1,
0.986168, -0.3673438, 0.3459357, 1, 0, 0.9529412, 1,
0.9867943, 0.7634064, 0.961079, 1, 0, 0.9490196, 1,
1.002843, 0.4292583, 1.480229, 1, 0, 0.9411765, 1,
1.002901, 0.5582763, 0.08480354, 1, 0, 0.9372549, 1,
1.005022, 0.8916174, 0.7759339, 1, 0, 0.9294118, 1,
1.006566, -0.3510538, -0.2376233, 1, 0, 0.9254902, 1,
1.008571, -1.347216, 1.816196, 1, 0, 0.9176471, 1,
1.013028, 0.0571793, 2.431163, 1, 0, 0.9137255, 1,
1.024511, -1.54189, 3.559906, 1, 0, 0.9058824, 1,
1.024673, 0.7218012, 1.485472, 1, 0, 0.9019608, 1,
1.03377, -1.40598, 3.38124, 1, 0, 0.8941177, 1,
1.042568, 1.125819, -0.03703882, 1, 0, 0.8862745, 1,
1.044468, 0.380532, 0.8221375, 1, 0, 0.8823529, 1,
1.064715, 0.1514835, 2.512292, 1, 0, 0.8745098, 1,
1.066363, 1.119016, -1.267535, 1, 0, 0.8705882, 1,
1.07036, 0.7701718, 2.172815, 1, 0, 0.8627451, 1,
1.071862, -1.034297, 2.204352, 1, 0, 0.8588235, 1,
1.074306, -0.7510495, 1.418801, 1, 0, 0.8509804, 1,
1.080961, 1.783397, 0.899771, 1, 0, 0.8470588, 1,
1.081709, -1.042243, 1.948432, 1, 0, 0.8392157, 1,
1.08502, 2.986794, 0.4114738, 1, 0, 0.8352941, 1,
1.086811, -0.570869, 1.494867, 1, 0, 0.827451, 1,
1.092047, -1.976423, 3.169189, 1, 0, 0.8235294, 1,
1.096835, 0.1874442, 1.059693, 1, 0, 0.8156863, 1,
1.097238, -1.230251, 2.770484, 1, 0, 0.8117647, 1,
1.09788, -0.7030587, 2.898151, 1, 0, 0.8039216, 1,
1.099634, 0.6009904, 0.4566847, 1, 0, 0.7960784, 1,
1.100367, 0.5503606, 1.21715, 1, 0, 0.7921569, 1,
1.10676, -1.145712, 2.119163, 1, 0, 0.7843137, 1,
1.111878, -0.01823878, 1.181546, 1, 0, 0.7803922, 1,
1.114027, -1.06792, 1.196356, 1, 0, 0.772549, 1,
1.114754, -0.503156, 1.811561, 1, 0, 0.7686275, 1,
1.122494, -2.123246, 0.9389688, 1, 0, 0.7607843, 1,
1.122731, 2.604142, 0.3715369, 1, 0, 0.7568628, 1,
1.127907, 2.125756, -0.07433271, 1, 0, 0.7490196, 1,
1.133081, -0.03944628, 0.3610798, 1, 0, 0.7450981, 1,
1.133798, -0.1220342, 0.686904, 1, 0, 0.7372549, 1,
1.135772, 0.4620661, 1.11575, 1, 0, 0.7333333, 1,
1.142738, -0.854086, 2.275759, 1, 0, 0.7254902, 1,
1.156879, 0.8506221, 2.917278, 1, 0, 0.7215686, 1,
1.15839, -0.9214203, -0.2711503, 1, 0, 0.7137255, 1,
1.158833, 0.4331509, 1.165888, 1, 0, 0.7098039, 1,
1.16768, 0.4510729, 0.5256933, 1, 0, 0.7019608, 1,
1.184194, -0.5848916, 2.492018, 1, 0, 0.6941177, 1,
1.198582, -0.3347958, 2.154637, 1, 0, 0.6901961, 1,
1.199186, 0.97622, 0.7880373, 1, 0, 0.682353, 1,
1.203853, -1.435096, 2.534142, 1, 0, 0.6784314, 1,
1.204529, -0.8502095, 1.79622, 1, 0, 0.6705883, 1,
1.208361, -1.646734, 2.146053, 1, 0, 0.6666667, 1,
1.215579, -0.9524777, 3.159172, 1, 0, 0.6588235, 1,
1.221674, 0.8769575, -0.4465016, 1, 0, 0.654902, 1,
1.223131, 1.18937, 0.8973119, 1, 0, 0.6470588, 1,
1.224497, 0.07139408, 1.147748, 1, 0, 0.6431373, 1,
1.226094, 1.998934, 1.779809, 1, 0, 0.6352941, 1,
1.236362, 0.7239329, 1.615774, 1, 0, 0.6313726, 1,
1.237224, 0.1501132, 1.02352, 1, 0, 0.6235294, 1,
1.246677, 0.298878, 0.12983, 1, 0, 0.6196079, 1,
1.248834, -1.957349, 1.451027, 1, 0, 0.6117647, 1,
1.270812, -0.6139385, 1.18207, 1, 0, 0.6078432, 1,
1.271081, 1.109743, -0.4437598, 1, 0, 0.6, 1,
1.277998, -0.841905, 3.355103, 1, 0, 0.5921569, 1,
1.278015, -1.789513, 3.681261, 1, 0, 0.5882353, 1,
1.278697, -0.4946146, 2.00107, 1, 0, 0.5803922, 1,
1.292111, 0.2842183, -0.05530038, 1, 0, 0.5764706, 1,
1.306569, 0.961277, 0.5088044, 1, 0, 0.5686275, 1,
1.311323, 0.6903778, -0.4608846, 1, 0, 0.5647059, 1,
1.333306, 0.3308982, -0.1741039, 1, 0, 0.5568628, 1,
1.346628, 0.5420899, 1.498445, 1, 0, 0.5529412, 1,
1.358136, 2.29905, 1.821719, 1, 0, 0.5450981, 1,
1.361424, 0.1820516, 1.366981, 1, 0, 0.5411765, 1,
1.363108, 1.175609, 0.7497287, 1, 0, 0.5333334, 1,
1.375344, 0.2007269, 1.786921, 1, 0, 0.5294118, 1,
1.384673, 0.7662724, 0.8532351, 1, 0, 0.5215687, 1,
1.390602, 0.3772572, -0.4296554, 1, 0, 0.5176471, 1,
1.394401, 1.114166, 0.7042934, 1, 0, 0.509804, 1,
1.405119, 0.7169868, 0.6453838, 1, 0, 0.5058824, 1,
1.405769, 0.6881285, 0.9065202, 1, 0, 0.4980392, 1,
1.410885, -0.9978074, 1.569201, 1, 0, 0.4901961, 1,
1.411599, 0.08763735, 3.349529, 1, 0, 0.4862745, 1,
1.41248, 1.001054, 1.995676, 1, 0, 0.4784314, 1,
1.413883, 0.09478154, 1.367002, 1, 0, 0.4745098, 1,
1.414958, 2.577702, 0.8367889, 1, 0, 0.4666667, 1,
1.415774, -0.3969903, 2.641586, 1, 0, 0.4627451, 1,
1.415879, -0.7365624, 2.632808, 1, 0, 0.454902, 1,
1.416464, 0.5658259, 0.6709232, 1, 0, 0.4509804, 1,
1.422508, -1.814535, 1.520353, 1, 0, 0.4431373, 1,
1.423561, 0.07012186, 1.391687, 1, 0, 0.4392157, 1,
1.426547, -0.8776935, 1.769084, 1, 0, 0.4313726, 1,
1.429012, -0.9752757, -0.08704888, 1, 0, 0.427451, 1,
1.430378, 1.13125, 0.6009277, 1, 0, 0.4196078, 1,
1.432456, 0.9590893, -1.544907, 1, 0, 0.4156863, 1,
1.471223, -0.2413515, 2.519234, 1, 0, 0.4078431, 1,
1.484159, -0.5453802, -0.4198061, 1, 0, 0.4039216, 1,
1.495771, -0.8067613, 0.9360809, 1, 0, 0.3960784, 1,
1.49619, -0.6580133, 1.07601, 1, 0, 0.3882353, 1,
1.503584, -0.1573735, 2.530542, 1, 0, 0.3843137, 1,
1.508484, -0.3025763, 2.266519, 1, 0, 0.3764706, 1,
1.513644, -0.4308247, 1.997413, 1, 0, 0.372549, 1,
1.514135, -0.37005, 4.357673, 1, 0, 0.3647059, 1,
1.530088, 1.272098, -0.051133, 1, 0, 0.3607843, 1,
1.531989, 0.5651311, 1.598755, 1, 0, 0.3529412, 1,
1.565698, 1.726649, 0.7045786, 1, 0, 0.3490196, 1,
1.588289, -0.8000894, 2.644068, 1, 0, 0.3411765, 1,
1.612129, 0.06236448, 2.539234, 1, 0, 0.3372549, 1,
1.635058, 0.3834521, 2.361282, 1, 0, 0.3294118, 1,
1.636939, 0.7518237, 0.06756177, 1, 0, 0.3254902, 1,
1.637847, 0.2439645, 1.608608, 1, 0, 0.3176471, 1,
1.642152, -0.2743475, 2.554239, 1, 0, 0.3137255, 1,
1.648813, 2.73466, 0.6303764, 1, 0, 0.3058824, 1,
1.654804, -1.469396, 2.521536, 1, 0, 0.2980392, 1,
1.670615, 3.020834, -0.4264903, 1, 0, 0.2941177, 1,
1.681955, 0.03488598, 1.736065, 1, 0, 0.2862745, 1,
1.697386, 0.586309, -1.765169, 1, 0, 0.282353, 1,
1.699479, -1.85495, 2.559781, 1, 0, 0.2745098, 1,
1.701941, 0.8256954, 0.3934609, 1, 0, 0.2705882, 1,
1.713982, -0.05771354, 1.242511, 1, 0, 0.2627451, 1,
1.728706, -0.4206083, 3.900796, 1, 0, 0.2588235, 1,
1.744828, 0.2145778, 2.187446, 1, 0, 0.2509804, 1,
1.750089, 0.4414601, -0.3106104, 1, 0, 0.2470588, 1,
1.762339, 0.8982145, 2.201783, 1, 0, 0.2392157, 1,
1.795965, 0.5686603, 3.622434, 1, 0, 0.2352941, 1,
1.796765, 1.116336, 2.636134, 1, 0, 0.227451, 1,
1.815706, -1.338831, 1.522641, 1, 0, 0.2235294, 1,
1.826641, -0.5051169, 1.260928, 1, 0, 0.2156863, 1,
1.841423, 0.4696152, 2.138102, 1, 0, 0.2117647, 1,
1.894659, -1.224245, 3.186681, 1, 0, 0.2039216, 1,
1.899899, 0.8397478, 1.417373, 1, 0, 0.1960784, 1,
1.900653, 1.235152, 0.9778697, 1, 0, 0.1921569, 1,
1.908697, 0.0350812, 2.591744, 1, 0, 0.1843137, 1,
1.926511, -0.4044933, 1.15995, 1, 0, 0.1803922, 1,
1.936286, 0.6582764, 1.0075, 1, 0, 0.172549, 1,
1.953336, 0.6149526, 1.698351, 1, 0, 0.1686275, 1,
1.968481, 0.678494, -0.6387739, 1, 0, 0.1607843, 1,
1.983599, -0.4045578, 3.062893, 1, 0, 0.1568628, 1,
2.004552, -0.2596246, 1.605067, 1, 0, 0.1490196, 1,
2.018808, -0.07034128, 3.020034, 1, 0, 0.145098, 1,
2.080556, 0.01565539, 1.431484, 1, 0, 0.1372549, 1,
2.08632, 0.0002923511, 1.491387, 1, 0, 0.1333333, 1,
2.096773, 1.608037, 0.3785605, 1, 0, 0.1254902, 1,
2.106714, 0.3858156, 1.178707, 1, 0, 0.1215686, 1,
2.142166, -0.1381104, -0.175697, 1, 0, 0.1137255, 1,
2.174027, -1.119454, 2.388753, 1, 0, 0.1098039, 1,
2.17552, -0.420107, -0.02542439, 1, 0, 0.1019608, 1,
2.176023, -0.4009026, 2.018628, 1, 0, 0.09411765, 1,
2.179623, 0.1638054, 3.132528, 1, 0, 0.09019608, 1,
2.208081, 0.6421568, 1.336996, 1, 0, 0.08235294, 1,
2.241451, 2.917459, -0.3387164, 1, 0, 0.07843138, 1,
2.241518, -0.2344297, 1.577315, 1, 0, 0.07058824, 1,
2.289719, 2.017619, 2.15234, 1, 0, 0.06666667, 1,
2.298303, -0.5538017, 2.323601, 1, 0, 0.05882353, 1,
2.302025, 0.8748531, 0.6450641, 1, 0, 0.05490196, 1,
2.406268, 0.5962241, 0.7627836, 1, 0, 0.04705882, 1,
2.418963, 0.8112806, 2.113046, 1, 0, 0.04313726, 1,
2.434268, -0.879553, 0.132524, 1, 0, 0.03529412, 1,
2.474407, -0.4053912, 1.340011, 1, 0, 0.03137255, 1,
2.555889, 0.4319222, 0.6172011, 1, 0, 0.02352941, 1,
2.625054, 0.6766319, 3.675406, 1, 0, 0.01960784, 1,
2.732799, 0.2160992, 1.496431, 1, 0, 0.01176471, 1,
3.286989, -0.5691094, 0.3736703, 1, 0, 0.007843138, 1
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
-0.3009492, -4.196493, -6.912023, 0, -0.5, 0.5, 0.5,
-0.3009492, -4.196493, -6.912023, 1, -0.5, 0.5, 0.5,
-0.3009492, -4.196493, -6.912023, 1, 1.5, 0.5, 0.5,
-0.3009492, -4.196493, -6.912023, 0, 1.5, 0.5, 0.5
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
-5.105198, 0.00308311, -6.912023, 0, -0.5, 0.5, 0.5,
-5.105198, 0.00308311, -6.912023, 1, -0.5, 0.5, 0.5,
-5.105198, 0.00308311, -6.912023, 1, 1.5, 0.5, 0.5,
-5.105198, 0.00308311, -6.912023, 0, 1.5, 0.5, 0.5
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
-5.105198, -4.196493, 0.04606915, 0, -0.5, 0.5, 0.5,
-5.105198, -4.196493, 0.04606915, 1, -0.5, 0.5, 0.5,
-5.105198, -4.196493, 0.04606915, 1, 1.5, 0.5, 0.5,
-5.105198, -4.196493, 0.04606915, 0, 1.5, 0.5, 0.5
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
-2, -3.22736, -5.306309,
2, -3.22736, -5.306309,
-2, -3.22736, -5.306309,
-2, -3.388882, -5.573928,
0, -3.22736, -5.306309,
0, -3.388882, -5.573928,
2, -3.22736, -5.306309,
2, -3.388882, -5.573928
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
"0",
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
-2, -3.711927, -6.109166, 0, -0.5, 0.5, 0.5,
-2, -3.711927, -6.109166, 1, -0.5, 0.5, 0.5,
-2, -3.711927, -6.109166, 1, 1.5, 0.5, 0.5,
-2, -3.711927, -6.109166, 0, 1.5, 0.5, 0.5,
0, -3.711927, -6.109166, 0, -0.5, 0.5, 0.5,
0, -3.711927, -6.109166, 1, -0.5, 0.5, 0.5,
0, -3.711927, -6.109166, 1, 1.5, 0.5, 0.5,
0, -3.711927, -6.109166, 0, 1.5, 0.5, 0.5,
2, -3.711927, -6.109166, 0, -0.5, 0.5, 0.5,
2, -3.711927, -6.109166, 1, -0.5, 0.5, 0.5,
2, -3.711927, -6.109166, 1, 1.5, 0.5, 0.5,
2, -3.711927, -6.109166, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.996525, -3, -5.306309,
-3.996525, 3, -5.306309,
-3.996525, -3, -5.306309,
-4.181304, -3, -5.573928,
-3.996525, -2, -5.306309,
-4.181304, -2, -5.573928,
-3.996525, -1, -5.306309,
-4.181304, -1, -5.573928,
-3.996525, 0, -5.306309,
-4.181304, 0, -5.573928,
-3.996525, 1, -5.306309,
-4.181304, 1, -5.573928,
-3.996525, 2, -5.306309,
-4.181304, 2, -5.573928,
-3.996525, 3, -5.306309,
-4.181304, 3, -5.573928
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
-4.550862, -3, -6.109166, 0, -0.5, 0.5, 0.5,
-4.550862, -3, -6.109166, 1, -0.5, 0.5, 0.5,
-4.550862, -3, -6.109166, 1, 1.5, 0.5, 0.5,
-4.550862, -3, -6.109166, 0, 1.5, 0.5, 0.5,
-4.550862, -2, -6.109166, 0, -0.5, 0.5, 0.5,
-4.550862, -2, -6.109166, 1, -0.5, 0.5, 0.5,
-4.550862, -2, -6.109166, 1, 1.5, 0.5, 0.5,
-4.550862, -2, -6.109166, 0, 1.5, 0.5, 0.5,
-4.550862, -1, -6.109166, 0, -0.5, 0.5, 0.5,
-4.550862, -1, -6.109166, 1, -0.5, 0.5, 0.5,
-4.550862, -1, -6.109166, 1, 1.5, 0.5, 0.5,
-4.550862, -1, -6.109166, 0, 1.5, 0.5, 0.5,
-4.550862, 0, -6.109166, 0, -0.5, 0.5, 0.5,
-4.550862, 0, -6.109166, 1, -0.5, 0.5, 0.5,
-4.550862, 0, -6.109166, 1, 1.5, 0.5, 0.5,
-4.550862, 0, -6.109166, 0, 1.5, 0.5, 0.5,
-4.550862, 1, -6.109166, 0, -0.5, 0.5, 0.5,
-4.550862, 1, -6.109166, 1, -0.5, 0.5, 0.5,
-4.550862, 1, -6.109166, 1, 1.5, 0.5, 0.5,
-4.550862, 1, -6.109166, 0, 1.5, 0.5, 0.5,
-4.550862, 2, -6.109166, 0, -0.5, 0.5, 0.5,
-4.550862, 2, -6.109166, 1, -0.5, 0.5, 0.5,
-4.550862, 2, -6.109166, 1, 1.5, 0.5, 0.5,
-4.550862, 2, -6.109166, 0, 1.5, 0.5, 0.5,
-4.550862, 3, -6.109166, 0, -0.5, 0.5, 0.5,
-4.550862, 3, -6.109166, 1, -0.5, 0.5, 0.5,
-4.550862, 3, -6.109166, 1, 1.5, 0.5, 0.5,
-4.550862, 3, -6.109166, 0, 1.5, 0.5, 0.5
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
-3.996525, -3.22736, -4,
-3.996525, -3.22736, 4,
-3.996525, -3.22736, -4,
-4.181304, -3.388882, -4,
-3.996525, -3.22736, -2,
-4.181304, -3.388882, -2,
-3.996525, -3.22736, 0,
-4.181304, -3.388882, 0,
-3.996525, -3.22736, 2,
-4.181304, -3.388882, 2,
-3.996525, -3.22736, 4,
-4.181304, -3.388882, 4
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
-4.550862, -3.711927, -4, 0, -0.5, 0.5, 0.5,
-4.550862, -3.711927, -4, 1, -0.5, 0.5, 0.5,
-4.550862, -3.711927, -4, 1, 1.5, 0.5, 0.5,
-4.550862, -3.711927, -4, 0, 1.5, 0.5, 0.5,
-4.550862, -3.711927, -2, 0, -0.5, 0.5, 0.5,
-4.550862, -3.711927, -2, 1, -0.5, 0.5, 0.5,
-4.550862, -3.711927, -2, 1, 1.5, 0.5, 0.5,
-4.550862, -3.711927, -2, 0, 1.5, 0.5, 0.5,
-4.550862, -3.711927, 0, 0, -0.5, 0.5, 0.5,
-4.550862, -3.711927, 0, 1, -0.5, 0.5, 0.5,
-4.550862, -3.711927, 0, 1, 1.5, 0.5, 0.5,
-4.550862, -3.711927, 0, 0, 1.5, 0.5, 0.5,
-4.550862, -3.711927, 2, 0, -0.5, 0.5, 0.5,
-4.550862, -3.711927, 2, 1, -0.5, 0.5, 0.5,
-4.550862, -3.711927, 2, 1, 1.5, 0.5, 0.5,
-4.550862, -3.711927, 2, 0, 1.5, 0.5, 0.5,
-4.550862, -3.711927, 4, 0, -0.5, 0.5, 0.5,
-4.550862, -3.711927, 4, 1, -0.5, 0.5, 0.5,
-4.550862, -3.711927, 4, 1, 1.5, 0.5, 0.5,
-4.550862, -3.711927, 4, 0, 1.5, 0.5, 0.5
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
-3.996525, -3.22736, -5.306309,
-3.996525, 3.233526, -5.306309,
-3.996525, -3.22736, 5.398447,
-3.996525, 3.233526, 5.398447,
-3.996525, -3.22736, -5.306309,
-3.996525, -3.22736, 5.398447,
-3.996525, 3.233526, -5.306309,
-3.996525, 3.233526, 5.398447,
-3.996525, -3.22736, -5.306309,
3.394627, -3.22736, -5.306309,
-3.996525, -3.22736, 5.398447,
3.394627, -3.22736, 5.398447,
-3.996525, 3.233526, -5.306309,
3.394627, 3.233526, -5.306309,
-3.996525, 3.233526, 5.398447,
3.394627, 3.233526, 5.398447,
3.394627, -3.22736, -5.306309,
3.394627, 3.233526, -5.306309,
3.394627, -3.22736, 5.398447,
3.394627, 3.233526, 5.398447,
3.394627, -3.22736, -5.306309,
3.394627, -3.22736, 5.398447,
3.394627, 3.233526, -5.306309,
3.394627, 3.233526, 5.398447
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
var radius = 7.755854;
var distance = 34.50667;
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
mvMatrix.translate( 0.3009492, -0.00308311, -0.04606915 );
mvMatrix.scale( 1.13457, 1.29793, 0.7833697 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.50667);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Piperonyl_butoxide<-read.table("Piperonyl_butoxide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Piperonyl_butoxide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Piperonyl_butoxide' not found
```

```r
y<-Piperonyl_butoxide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Piperonyl_butoxide' not found
```

```r
z<-Piperonyl_butoxide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Piperonyl_butoxide' not found
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
-3.888887, -1.251831, -2.306084, 0, 0, 1, 1, 1,
-2.852426, -1.078756, -1.334412, 1, 0, 0, 1, 1,
-2.779008, 1.417847, -0.4642731, 1, 0, 0, 1, 1,
-2.624559, 0.9280424, -1.70241, 1, 0, 0, 1, 1,
-2.563691, -0.04048913, -2.642031, 1, 0, 0, 1, 1,
-2.529245, 0.5965747, -1.967916, 1, 0, 0, 1, 1,
-2.46968, 0.4164888, -0.3387652, 0, 0, 0, 1, 1,
-2.415163, -1.135285, -1.316724, 0, 0, 0, 1, 1,
-2.398716, -1.02905, -3.507866, 0, 0, 0, 1, 1,
-2.391065, -0.9600562, -1.997155, 0, 0, 0, 1, 1,
-2.306037, -0.503388, -2.844342, 0, 0, 0, 1, 1,
-2.294343, 1.237245, -2.593162, 0, 0, 0, 1, 1,
-2.257118, 0.6549293, -0.6824304, 0, 0, 0, 1, 1,
-2.230777, 0.527615, -1.200629, 1, 1, 1, 1, 1,
-2.202092, 0.003938479, -3.801514, 1, 1, 1, 1, 1,
-2.054868, 0.907169, -0.6866437, 1, 1, 1, 1, 1,
-2.018019, 0.3812778, -1.341851, 1, 1, 1, 1, 1,
-1.995298, 0.4536208, -1.669693, 1, 1, 1, 1, 1,
-1.990821, 0.1903398, -2.43496, 1, 1, 1, 1, 1,
-1.981172, 1.100244, -0.1420424, 1, 1, 1, 1, 1,
-1.97617, 0.2054221, -1.930344, 1, 1, 1, 1, 1,
-1.954135, -0.9389061, -3.903055, 1, 1, 1, 1, 1,
-1.938784, 1.551568, -0.9937212, 1, 1, 1, 1, 1,
-1.925009, -2.048231, -0.8264638, 1, 1, 1, 1, 1,
-1.924797, -1.327358, -1.889895, 1, 1, 1, 1, 1,
-1.900237, -0.8091155, -2.750625, 1, 1, 1, 1, 1,
-1.867848, -0.5691544, -0.5639918, 1, 1, 1, 1, 1,
-1.867579, -1.174308, -2.607008, 1, 1, 1, 1, 1,
-1.849884, 0.722788, -0.2666043, 0, 0, 1, 1, 1,
-1.846316, -0.07953455, -0.9306015, 1, 0, 0, 1, 1,
-1.838446, 1.244051, -0.5471086, 1, 0, 0, 1, 1,
-1.82666, -0.5137327, -2.728006, 1, 0, 0, 1, 1,
-1.788449, 0.0083214, 0.4566016, 1, 0, 0, 1, 1,
-1.788299, 1.108756, -1.819821, 1, 0, 0, 1, 1,
-1.784229, 0.002504725, -1.658586, 0, 0, 0, 1, 1,
-1.782091, 0.5186381, -0.1455373, 0, 0, 0, 1, 1,
-1.774056, -0.01217253, -1.970478, 0, 0, 0, 1, 1,
-1.77068, -0.1733831, -1.56597, 0, 0, 0, 1, 1,
-1.766819, 0.3641649, -2.676495, 0, 0, 0, 1, 1,
-1.765045, -1.53619, -1.369498, 0, 0, 0, 1, 1,
-1.764311, -0.09473174, -1.469839, 0, 0, 0, 1, 1,
-1.752263, -0.2353616, -2.321868, 1, 1, 1, 1, 1,
-1.749906, -0.9068104, -2.056039, 1, 1, 1, 1, 1,
-1.745093, 1.028591, -0.1668947, 1, 1, 1, 1, 1,
-1.731875, -1.672677, -2.437544, 1, 1, 1, 1, 1,
-1.726771, -0.8481939, -3.650102, 1, 1, 1, 1, 1,
-1.687468, 1.384251, -0.08217023, 1, 1, 1, 1, 1,
-1.666474, -0.8051593, -1.905273, 1, 1, 1, 1, 1,
-1.641832, -2.244551, -2.38847, 1, 1, 1, 1, 1,
-1.630712, -1.965966, -1.630892, 1, 1, 1, 1, 1,
-1.615516, 0.7730569, -1.103073, 1, 1, 1, 1, 1,
-1.61444, -1.031937, -2.351016, 1, 1, 1, 1, 1,
-1.613866, -1.25495, -1.559476, 1, 1, 1, 1, 1,
-1.608087, -0.8075765, -2.135128, 1, 1, 1, 1, 1,
-1.602921, 0.9847246, -3.612, 1, 1, 1, 1, 1,
-1.60176, 0.001700274, -1.55063, 1, 1, 1, 1, 1,
-1.59603, -1.260273, -1.592403, 0, 0, 1, 1, 1,
-1.581228, 0.7629052, -1.407427, 1, 0, 0, 1, 1,
-1.570064, -0.03102664, -2.654704, 1, 0, 0, 1, 1,
-1.569372, 0.02055779, -1.957449, 1, 0, 0, 1, 1,
-1.56168, -0.7738288, -2.113674, 1, 0, 0, 1, 1,
-1.541921, -0.01753777, -1.94568, 1, 0, 0, 1, 1,
-1.535777, 0.4866863, -2.18535, 0, 0, 0, 1, 1,
-1.532345, 0.7644582, -2.759836, 0, 0, 0, 1, 1,
-1.529188, -0.1297012, -1.512426, 0, 0, 0, 1, 1,
-1.516346, 0.220479, -0.7508514, 0, 0, 0, 1, 1,
-1.50354, -0.7782652, -1.886095, 0, 0, 0, 1, 1,
-1.50344, 1.045642, -1.552168, 0, 0, 0, 1, 1,
-1.501112, 1.363885, -1.800852, 0, 0, 0, 1, 1,
-1.498412, 0.2739501, -0.9616715, 1, 1, 1, 1, 1,
-1.446475, 1.433346, -1.524566, 1, 1, 1, 1, 1,
-1.429087, 0.2429224, -1.34414, 1, 1, 1, 1, 1,
-1.423083, -0.03422234, -1.349567, 1, 1, 1, 1, 1,
-1.421955, 1.127397, -1.30203, 1, 1, 1, 1, 1,
-1.414853, -0.4553065, -1.168398, 1, 1, 1, 1, 1,
-1.409635, -0.1802893, -2.798887, 1, 1, 1, 1, 1,
-1.409337, 0.502458, -1.66697, 1, 1, 1, 1, 1,
-1.396662, -0.3601499, -0.4059856, 1, 1, 1, 1, 1,
-1.396005, -0.9399025, -2.165654, 1, 1, 1, 1, 1,
-1.392505, -0.7426783, -3.112151, 1, 1, 1, 1, 1,
-1.385021, 0.8421828, -1.100596, 1, 1, 1, 1, 1,
-1.375997, 1.391117, -0.5975925, 1, 1, 1, 1, 1,
-1.375645, -0.4667974, -1.786218, 1, 1, 1, 1, 1,
-1.374429, -0.5293887, -2.99822, 1, 1, 1, 1, 1,
-1.373802, -0.3916631, -1.110149, 0, 0, 1, 1, 1,
-1.365663, 1.442647, 0.477986, 1, 0, 0, 1, 1,
-1.360913, 2.008494, -1.540633, 1, 0, 0, 1, 1,
-1.359558, -0.1821744, 0.02472329, 1, 0, 0, 1, 1,
-1.356789, -0.1956518, -1.52034, 1, 0, 0, 1, 1,
-1.354238, -0.1199182, -1.518706, 1, 0, 0, 1, 1,
-1.352587, -0.8948976, -1.493131, 0, 0, 0, 1, 1,
-1.340518, 0.492602, -0.7747099, 0, 0, 0, 1, 1,
-1.339169, 0.4741551, -0.3393986, 0, 0, 0, 1, 1,
-1.338331, 1.363313, -2.997477, 0, 0, 0, 1, 1,
-1.335859, -2.180343, -1.668176, 0, 0, 0, 1, 1,
-1.328185, 0.2659428, -1.418597, 0, 0, 0, 1, 1,
-1.327354, -0.8490108, -3.262335, 0, 0, 0, 1, 1,
-1.324996, 2.651585, 0.844237, 1, 1, 1, 1, 1,
-1.314795, 0.4822491, 0.7714061, 1, 1, 1, 1, 1,
-1.309265, -0.1854411, -2.345541, 1, 1, 1, 1, 1,
-1.307095, -0.09604429, -2.672638, 1, 1, 1, 1, 1,
-1.301258, 0.009447833, -2.210509, 1, 1, 1, 1, 1,
-1.300853, 0.728357, 0.5088295, 1, 1, 1, 1, 1,
-1.294364, -0.2018688, -0.3350138, 1, 1, 1, 1, 1,
-1.267478, -2.841724, -3.226535, 1, 1, 1, 1, 1,
-1.265752, -0.152097, -2.26655, 1, 1, 1, 1, 1,
-1.257537, 1.062114, -1.153956, 1, 1, 1, 1, 1,
-1.254365, -0.3278754, -1.851722, 1, 1, 1, 1, 1,
-1.248804, -0.1788669, -2.46868, 1, 1, 1, 1, 1,
-1.243144, 3.139436, 0.6182712, 1, 1, 1, 1, 1,
-1.242275, 0.4454012, -1.106648, 1, 1, 1, 1, 1,
-1.239993, -0.7747725, -2.360632, 1, 1, 1, 1, 1,
-1.226418, 0.3695905, -0.4299901, 0, 0, 1, 1, 1,
-1.213435, 1.156987, 0.4727651, 1, 0, 0, 1, 1,
-1.212953, 0.1971418, -1.559013, 1, 0, 0, 1, 1,
-1.210202, -0.4365508, 0.4601692, 1, 0, 0, 1, 1,
-1.201102, 0.3869526, 0.06185248, 1, 0, 0, 1, 1,
-1.194276, -1.262181, -2.954598, 1, 0, 0, 1, 1,
-1.183345, 0.4739087, -1.287956, 0, 0, 0, 1, 1,
-1.17585, -0.3923076, -3.402008, 0, 0, 0, 1, 1,
-1.175103, 0.5939113, -1.025085, 0, 0, 0, 1, 1,
-1.168291, 0.9702736, -2.308721, 0, 0, 0, 1, 1,
-1.15914, 0.1760267, -1.17571, 0, 0, 0, 1, 1,
-1.157041, 0.3153563, -0.3504245, 0, 0, 0, 1, 1,
-1.153121, -0.0124507, -2.770833, 0, 0, 0, 1, 1,
-1.149218, -1.890764, -2.910856, 1, 1, 1, 1, 1,
-1.14796, -0.1309481, -0.5471485, 1, 1, 1, 1, 1,
-1.124799, 0.4955353, -2.609501, 1, 1, 1, 1, 1,
-1.116956, -0.7479091, -0.963457, 1, 1, 1, 1, 1,
-1.113176, -0.4391646, -1.7611, 1, 1, 1, 1, 1,
-1.099714, -1.060731, -2.136314, 1, 1, 1, 1, 1,
-1.096383, 0.9054019, -1.871315, 1, 1, 1, 1, 1,
-1.094885, 0.2610532, -0.646575, 1, 1, 1, 1, 1,
-1.08912, 1.017571, -0.2634299, 1, 1, 1, 1, 1,
-1.088315, -1.541903, -2.963293, 1, 1, 1, 1, 1,
-1.085605, -1.067356, -3.230741, 1, 1, 1, 1, 1,
-1.085604, 0.1955982, -2.020461, 1, 1, 1, 1, 1,
-1.076311, -0.497135, -0.3485254, 1, 1, 1, 1, 1,
-1.073944, -0.7188585, -0.8446206, 1, 1, 1, 1, 1,
-1.06708, 0.0343295, -1.558856, 1, 1, 1, 1, 1,
-1.066154, -1.164536, -1.699441, 0, 0, 1, 1, 1,
-1.059305, 0.9745016, -2.019886, 1, 0, 0, 1, 1,
-1.059084, 1.244325, 0.03894771, 1, 0, 0, 1, 1,
-1.046751, -0.6661836, -0.8151825, 1, 0, 0, 1, 1,
-1.044763, 1.091403, -0.8151699, 1, 0, 0, 1, 1,
-1.04242, 0.8973248, -1.356026, 1, 0, 0, 1, 1,
-1.04022, -0.8765852, -3.273685, 0, 0, 0, 1, 1,
-1.032544, -1.328945, -2.267529, 0, 0, 0, 1, 1,
-1.029548, 1.668901, 0.6069119, 0, 0, 0, 1, 1,
-1.024484, -0.2592825, -1.030703, 0, 0, 0, 1, 1,
-1.021052, -0.2121704, -1.037023, 0, 0, 0, 1, 1,
-1.008442, 0.02725147, -0.2507484, 0, 0, 0, 1, 1,
-1.003381, 0.2040369, 0.5361715, 0, 0, 0, 1, 1,
-1.000226, -0.5399662, -1.353823, 1, 1, 1, 1, 1,
-0.9944668, 0.5403315, -0.3702563, 1, 1, 1, 1, 1,
-0.9923815, -0.5359156, -2.039262, 1, 1, 1, 1, 1,
-0.9905888, -0.09937407, -1.862329, 1, 1, 1, 1, 1,
-0.9830247, -0.5174555, -3.468193, 1, 1, 1, 1, 1,
-0.9787675, -0.1562865, -3.018527, 1, 1, 1, 1, 1,
-0.9770393, -1.256921, -1.894072, 1, 1, 1, 1, 1,
-0.9738106, 2.077845, -1.245354, 1, 1, 1, 1, 1,
-0.9707592, -0.9935898, -0.47054, 1, 1, 1, 1, 1,
-0.9689705, 0.7698185, -3.055399, 1, 1, 1, 1, 1,
-0.949038, -1.400865, -2.540788, 1, 1, 1, 1, 1,
-0.9459847, -1.237444, -3.316845, 1, 1, 1, 1, 1,
-0.9437828, 0.7021444, -1.759162, 1, 1, 1, 1, 1,
-0.9435493, 0.4324225, -1.867287, 1, 1, 1, 1, 1,
-0.9372792, 0.1834462, -1.722266, 1, 1, 1, 1, 1,
-0.9370434, 0.4022307, -0.7891209, 0, 0, 1, 1, 1,
-0.9207053, 0.9705098, 2.296875, 1, 0, 0, 1, 1,
-0.9167337, -0.5662243, -2.471672, 1, 0, 0, 1, 1,
-0.9049839, -0.2099685, -1.427125, 1, 0, 0, 1, 1,
-0.9030851, 0.9204068, -0.9038783, 1, 0, 0, 1, 1,
-0.8983397, -0.3835886, -1.038287, 1, 0, 0, 1, 1,
-0.8971937, 0.8975315, -1.777022, 0, 0, 0, 1, 1,
-0.893734, 1.334079, -1.487837, 0, 0, 0, 1, 1,
-0.8920327, 0.4125786, -2.179221, 0, 0, 0, 1, 1,
-0.8877726, -1.077287, -2.70873, 0, 0, 0, 1, 1,
-0.8842378, -0.05486559, -1.767789, 0, 0, 0, 1, 1,
-0.8832908, -0.3911723, -1.961816, 0, 0, 0, 1, 1,
-0.8779981, 1.236172, -1.110829, 0, 0, 0, 1, 1,
-0.8765891, -2.09228, -3.579006, 1, 1, 1, 1, 1,
-0.8747346, 0.0762644, -1.123391, 1, 1, 1, 1, 1,
-0.8661163, 2.445311, 0.9100442, 1, 1, 1, 1, 1,
-0.8505287, -0.8443139, -4.099114, 1, 1, 1, 1, 1,
-0.8480489, -1.228, -4.011378, 1, 1, 1, 1, 1,
-0.8457733, 0.2804565, -0.43702, 1, 1, 1, 1, 1,
-0.8450316, -0.139999, -3.841941, 1, 1, 1, 1, 1,
-0.8424829, 1.098055, -0.3840889, 1, 1, 1, 1, 1,
-0.8424119, -0.4837663, -3.450475, 1, 1, 1, 1, 1,
-0.838744, -1.191225, -2.281424, 1, 1, 1, 1, 1,
-0.8381739, 0.4044686, -2.021083, 1, 1, 1, 1, 1,
-0.8380389, 0.3634084, -3.653452, 1, 1, 1, 1, 1,
-0.8337621, 0.1992909, -0.09065483, 1, 1, 1, 1, 1,
-0.8289589, 0.7177396, -1.802723, 1, 1, 1, 1, 1,
-0.8240739, 1.474803, -1.258293, 1, 1, 1, 1, 1,
-0.813337, -0.2872412, -2.078653, 0, 0, 1, 1, 1,
-0.8129598, -0.7254976, -2.527668, 1, 0, 0, 1, 1,
-0.8123943, -1.465502, -2.59264, 1, 0, 0, 1, 1,
-0.8030012, 0.9307331, -1.1713, 1, 0, 0, 1, 1,
-0.8002432, 1.886783, 0.3628127, 1, 0, 0, 1, 1,
-0.7990593, -1.610436, -2.517593, 1, 0, 0, 1, 1,
-0.7989293, 2.050626, -0.4601938, 0, 0, 0, 1, 1,
-0.7988895, 1.095298, 0.6278375, 0, 0, 0, 1, 1,
-0.7954305, -0.4757162, -0.664064, 0, 0, 0, 1, 1,
-0.7900857, 0.9162754, -1.447352, 0, 0, 0, 1, 1,
-0.7900376, 0.1827079, -1.322867, 0, 0, 0, 1, 1,
-0.7879692, -0.200417, -2.19589, 0, 0, 0, 1, 1,
-0.7878277, -0.6331291, -2.001053, 0, 0, 0, 1, 1,
-0.7753072, -0.5026302, -2.356973, 1, 1, 1, 1, 1,
-0.7632118, 0.1126287, -1.806753, 1, 1, 1, 1, 1,
-0.7628845, -1.892553, -3.948256, 1, 1, 1, 1, 1,
-0.762465, -1.841721, -3.853436, 1, 1, 1, 1, 1,
-0.7610601, 0.2849782, -2.569224, 1, 1, 1, 1, 1,
-0.7548325, -0.4232785, -1.798514, 1, 1, 1, 1, 1,
-0.7533892, -0.2499016, -3.1227, 1, 1, 1, 1, 1,
-0.7459348, 2.200411, 0.5254631, 1, 1, 1, 1, 1,
-0.7454447, 0.2967069, -1.055616, 1, 1, 1, 1, 1,
-0.7418831, -0.1894101, -1.162498, 1, 1, 1, 1, 1,
-0.7396155, 0.008696803, -0.6171693, 1, 1, 1, 1, 1,
-0.7392803, 2.345819, 0.3721773, 1, 1, 1, 1, 1,
-0.7355249, -0.1009284, -1.76223, 1, 1, 1, 1, 1,
-0.7279292, 1.537597, -0.81664, 1, 1, 1, 1, 1,
-0.7236145, 0.5390839, -2.444285, 1, 1, 1, 1, 1,
-0.7203185, -0.2987103, -2.582762, 0, 0, 1, 1, 1,
-0.7125781, 1.504981, -1.764752, 1, 0, 0, 1, 1,
-0.7125171, 1.80186, -1.350476, 1, 0, 0, 1, 1,
-0.7106044, -0.3786977, -1.778144, 1, 0, 0, 1, 1,
-0.7066192, -0.8250288, -0.496451, 1, 0, 0, 1, 1,
-0.7049395, -0.3156961, -0.8946972, 1, 0, 0, 1, 1,
-0.7035725, -0.7676862, -2.167338, 0, 0, 0, 1, 1,
-0.7035344, -0.3212427, -3.10614, 0, 0, 0, 1, 1,
-0.7022702, 0.2963824, -0.7710901, 0, 0, 0, 1, 1,
-0.7005734, -1.215388, -1.22071, 0, 0, 0, 1, 1,
-0.7004358, -0.4356828, -3.385154, 0, 0, 0, 1, 1,
-0.6964075, -2.11264, -3.117474, 0, 0, 0, 1, 1,
-0.6844432, 0.886821, -1.193935, 0, 0, 0, 1, 1,
-0.6833814, 0.6293321, -1.380874, 1, 1, 1, 1, 1,
-0.6708157, 0.5732834, -0.8204126, 1, 1, 1, 1, 1,
-0.6697455, -0.1146212, -1.876963, 1, 1, 1, 1, 1,
-0.6676006, -0.556268, -1.859171, 1, 1, 1, 1, 1,
-0.666688, 0.3148934, -3.809722, 1, 1, 1, 1, 1,
-0.663016, 0.741376, -0.2405451, 1, 1, 1, 1, 1,
-0.6610147, -0.3824684, -1.296615, 1, 1, 1, 1, 1,
-0.6589084, -0.1234551, -3.326862, 1, 1, 1, 1, 1,
-0.6529885, -0.1057979, -1.970421, 1, 1, 1, 1, 1,
-0.6482602, -0.3170484, -2.04673, 1, 1, 1, 1, 1,
-0.6481179, 0.1324615, -3.167315, 1, 1, 1, 1, 1,
-0.6400188, 0.00679084, -2.018419, 1, 1, 1, 1, 1,
-0.6389896, -0.5828897, -3.196843, 1, 1, 1, 1, 1,
-0.6323805, 0.1153833, -0.4804263, 1, 1, 1, 1, 1,
-0.6281399, 0.5729998, 0.1331906, 1, 1, 1, 1, 1,
-0.6268038, -0.5431396, -1.986962, 0, 0, 1, 1, 1,
-0.6236737, 1.121875, -1.114092, 1, 0, 0, 1, 1,
-0.621968, 0.7573138, -1.601498, 1, 0, 0, 1, 1,
-0.6188526, 0.2851316, -1.136091, 1, 0, 0, 1, 1,
-0.6150886, 0.9681402, -0.5004106, 1, 0, 0, 1, 1,
-0.6140229, -1.304842, -2.503627, 1, 0, 0, 1, 1,
-0.6123938, 0.1461777, -0.6586476, 0, 0, 0, 1, 1,
-0.6108438, -0.005811683, -2.179187, 0, 0, 0, 1, 1,
-0.5988362, -0.4009574, -2.458377, 0, 0, 0, 1, 1,
-0.5956194, -1.071657, -3.511724, 0, 0, 0, 1, 1,
-0.5949515, -1.594098, -3.578384, 0, 0, 0, 1, 1,
-0.5893338, -0.06699146, -3.163254, 0, 0, 0, 1, 1,
-0.5829996, 0.4705195, -2.271016, 0, 0, 0, 1, 1,
-0.5802751, 0.5205741, -0.3727283, 1, 1, 1, 1, 1,
-0.575765, 0.8935082, -0.4311081, 1, 1, 1, 1, 1,
-0.5703065, -1.993182, -2.379122, 1, 1, 1, 1, 1,
-0.5621339, 1.278033, 0.4152316, 1, 1, 1, 1, 1,
-0.5620801, -1.67033, -3.018835, 1, 1, 1, 1, 1,
-0.5597712, -0.0511609, -2.320715, 1, 1, 1, 1, 1,
-0.5591572, 0.564403, -0.7114252, 1, 1, 1, 1, 1,
-0.5556914, -1.079918, -3.261067, 1, 1, 1, 1, 1,
-0.5536288, 0.4461024, -0.739764, 1, 1, 1, 1, 1,
-0.5501879, -0.3209523, -3.000813, 1, 1, 1, 1, 1,
-0.5418485, -1.693547, -2.052831, 1, 1, 1, 1, 1,
-0.5263392, 0.8247632, -0.8219534, 1, 1, 1, 1, 1,
-0.5212724, 0.03084579, -1.524675, 1, 1, 1, 1, 1,
-0.5198476, -0.3839032, -1.740683, 1, 1, 1, 1, 1,
-0.5193228, -1.114004, -3.610129, 1, 1, 1, 1, 1,
-0.5181416, 0.3321775, 0.3559754, 0, 0, 1, 1, 1,
-0.5136185, 1.238992, -0.5741662, 1, 0, 0, 1, 1,
-0.5104063, 1.907323, -0.1448669, 1, 0, 0, 1, 1,
-0.5066825, 0.4369033, -1.07479, 1, 0, 0, 1, 1,
-0.5035971, 0.1608045, -1.902527, 1, 0, 0, 1, 1,
-0.5033607, -0.3269986, -2.910373, 1, 0, 0, 1, 1,
-0.5015534, -0.04079389, -2.694529, 0, 0, 0, 1, 1,
-0.5012931, -1.39187, -2.247288, 0, 0, 0, 1, 1,
-0.4978707, -0.07390454, 0.1042174, 0, 0, 0, 1, 1,
-0.4913418, 0.7360649, -2.261456, 0, 0, 0, 1, 1,
-0.4912625, -0.4557875, -3.833499, 0, 0, 0, 1, 1,
-0.4885407, -0.05898648, -0.1233716, 0, 0, 0, 1, 1,
-0.4849776, -0.4647738, -3.047604, 0, 0, 0, 1, 1,
-0.4834137, -2.419489, -1.954348, 1, 1, 1, 1, 1,
-0.4784603, 0.352922, -0.5973505, 1, 1, 1, 1, 1,
-0.4761935, -1.237577, -2.529803, 1, 1, 1, 1, 1,
-0.4748366, 0.8444983, 0.1640163, 1, 1, 1, 1, 1,
-0.4748137, 0.8212697, 0.512682, 1, 1, 1, 1, 1,
-0.4714544, -1.069481, -2.122184, 1, 1, 1, 1, 1,
-0.4681829, -0.05712179, -0.186678, 1, 1, 1, 1, 1,
-0.4642832, -0.4403814, -2.239454, 1, 1, 1, 1, 1,
-0.4604316, 0.7692869, -1.050246, 1, 1, 1, 1, 1,
-0.4572046, -0.9599947, -3.272283, 1, 1, 1, 1, 1,
-0.4536642, -0.7110763, -2.405431, 1, 1, 1, 1, 1,
-0.4516776, -1.107448, -2.114195, 1, 1, 1, 1, 1,
-0.4509322, -0.2985538, -1.119659, 1, 1, 1, 1, 1,
-0.4490363, -0.1188736, -3.301167, 1, 1, 1, 1, 1,
-0.4454846, -2.664495, -3.020677, 1, 1, 1, 1, 1,
-0.4454322, 0.4506074, 0.3903078, 0, 0, 1, 1, 1,
-0.440579, -1.851263, -3.376915, 1, 0, 0, 1, 1,
-0.440487, -0.2846742, -2.812382, 1, 0, 0, 1, 1,
-0.4376103, 0.4609275, -2.894324, 1, 0, 0, 1, 1,
-0.4353129, -0.9442685, -1.714348, 1, 0, 0, 1, 1,
-0.435237, -0.0617221, -2.680733, 1, 0, 0, 1, 1,
-0.434364, 0.8331918, -1.713274, 0, 0, 0, 1, 1,
-0.4329596, -1.162737, -1.999079, 0, 0, 0, 1, 1,
-0.4230939, -0.32534, -3.562041, 0, 0, 0, 1, 1,
-0.4213274, -0.8377287, -3.373845, 0, 0, 0, 1, 1,
-0.4186046, -2.977828, -1.551546, 0, 0, 0, 1, 1,
-0.4179188, 0.1752533, -1.578346, 0, 0, 0, 1, 1,
-0.4168803, -0.2882346, -2.438459, 0, 0, 0, 1, 1,
-0.4123418, -2.152845, -2.914863, 1, 1, 1, 1, 1,
-0.4114583, -0.764223, -5.149869, 1, 1, 1, 1, 1,
-0.4113027, 0.09580786, -0.8744873, 1, 1, 1, 1, 1,
-0.4069832, -0.8781063, -2.5007, 1, 1, 1, 1, 1,
-0.4003214, 0.9471362, 1.279633, 1, 1, 1, 1, 1,
-0.3988896, -0.8403829, -2.115448, 1, 1, 1, 1, 1,
-0.3987326, -0.2632794, -2.444188, 1, 1, 1, 1, 1,
-0.3917573, 0.4349325, -0.3481909, 1, 1, 1, 1, 1,
-0.3912347, 0.01453825, 0.1846383, 1, 1, 1, 1, 1,
-0.3882428, 0.7215076, 0.1215633, 1, 1, 1, 1, 1,
-0.3880811, -0.1425172, -4.183738, 1, 1, 1, 1, 1,
-0.3809032, 1.30096, -1.768246, 1, 1, 1, 1, 1,
-0.3787954, 0.3940555, -0.6592525, 1, 1, 1, 1, 1,
-0.3764916, 1.188871, -0.7113648, 1, 1, 1, 1, 1,
-0.3757417, 0.8202326, 0.08043353, 1, 1, 1, 1, 1,
-0.3746754, -0.1145722, -2.806941, 0, 0, 1, 1, 1,
-0.3742613, -2.235332, -1.031166, 1, 0, 0, 1, 1,
-0.3740255, 1.206034, 0.4011368, 1, 0, 0, 1, 1,
-0.3568214, -0.2270919, -0.9821672, 1, 0, 0, 1, 1,
-0.3549596, -0.05557974, -2.626154, 1, 0, 0, 1, 1,
-0.354931, -0.1252299, -2.017743, 1, 0, 0, 1, 1,
-0.3537515, -0.4395898, -0.2058802, 0, 0, 0, 1, 1,
-0.3523531, 0.9186487, -0.6373343, 0, 0, 0, 1, 1,
-0.3513964, 1.192822, 0.8561975, 0, 0, 0, 1, 1,
-0.3513286, 1.897727, 2.433036, 0, 0, 0, 1, 1,
-0.3509262, -0.6585899, -3.489583, 0, 0, 0, 1, 1,
-0.3489973, 0.4622828, -1.731685, 0, 0, 0, 1, 1,
-0.3448425, -0.6552148, -2.076664, 0, 0, 0, 1, 1,
-0.3430481, -0.3161398, -4.517751, 1, 1, 1, 1, 1,
-0.3393494, -1.103144, -1.730367, 1, 1, 1, 1, 1,
-0.3366975, -0.06929199, -0.1440329, 1, 1, 1, 1, 1,
-0.3353279, 0.5316321, 1.892047, 1, 1, 1, 1, 1,
-0.3345023, 0.2980092, -2.463343, 1, 1, 1, 1, 1,
-0.3295252, -0.7734972, -0.6607255, 1, 1, 1, 1, 1,
-0.3229097, -0.4624223, -3.581972, 1, 1, 1, 1, 1,
-0.3220172, 0.3748963, -0.1255857, 1, 1, 1, 1, 1,
-0.3212063, -0.7295135, -4.256413, 1, 1, 1, 1, 1,
-0.3208566, 0.6406914, -0.0602987, 1, 1, 1, 1, 1,
-0.3186636, -0.8319609, -0.8249813, 1, 1, 1, 1, 1,
-0.3163384, -0.3561638, -0.6756845, 1, 1, 1, 1, 1,
-0.3154531, 1.113231, -1.715973, 1, 1, 1, 1, 1,
-0.3142771, -1.101024, -1.991313, 1, 1, 1, 1, 1,
-0.312306, -1.901617, -2.386826, 1, 1, 1, 1, 1,
-0.3119601, -0.9480668, -2.544288, 0, 0, 1, 1, 1,
-0.3106913, 0.4668998, 1.128285, 1, 0, 0, 1, 1,
-0.3097509, -0.5917754, -1.174934, 1, 0, 0, 1, 1,
-0.307095, -0.2194333, -2.910715, 1, 0, 0, 1, 1,
-0.3067035, -0.748467, -2.395169, 1, 0, 0, 1, 1,
-0.3056688, -0.4406147, -3.522011, 1, 0, 0, 1, 1,
-0.3055324, -0.9976636, -1.533891, 0, 0, 0, 1, 1,
-0.3053472, 1.937887, 1.490375, 0, 0, 0, 1, 1,
-0.3051111, -1.765738, -3.834022, 0, 0, 0, 1, 1,
-0.304062, -0.3771778, -0.9505203, 0, 0, 0, 1, 1,
-0.2989055, 0.7044109, -0.3706399, 0, 0, 0, 1, 1,
-0.2987891, 1.246859, -0.08618874, 0, 0, 0, 1, 1,
-0.2956258, 0.1503315, 0.6286255, 0, 0, 0, 1, 1,
-0.291727, -0.5415813, -2.506634, 1, 1, 1, 1, 1,
-0.2889331, 0.1288845, -1.260344, 1, 1, 1, 1, 1,
-0.2877044, -0.3535963, -2.159442, 1, 1, 1, 1, 1,
-0.2873832, 1.784504, -0.6687528, 1, 1, 1, 1, 1,
-0.2783203, -0.6199782, -2.616575, 1, 1, 1, 1, 1,
-0.2740349, 0.4586298, 0.425464, 1, 1, 1, 1, 1,
-0.273489, 0.4968468, -2.427706, 1, 1, 1, 1, 1,
-0.2729475, 0.4726459, -1.931538, 1, 1, 1, 1, 1,
-0.270011, -0.9578785, -2.09678, 1, 1, 1, 1, 1,
-0.2660773, -0.491354, -2.999394, 1, 1, 1, 1, 1,
-0.2654641, 1.231877, -0.6452489, 1, 1, 1, 1, 1,
-0.2596471, 0.7459444, -1.76891, 1, 1, 1, 1, 1,
-0.2593535, -0.2009604, -1.351407, 1, 1, 1, 1, 1,
-0.2564789, -0.3280187, -3.409954, 1, 1, 1, 1, 1,
-0.2518296, -2.318877, -4.274279, 1, 1, 1, 1, 1,
-0.2484855, 0.3024996, -1.316415, 0, 0, 1, 1, 1,
-0.2452425, -1.282002, -4.470673, 1, 0, 0, 1, 1,
-0.2446431, -0.300493, -3.43715, 1, 0, 0, 1, 1,
-0.2433113, -1.250871, -1.279349, 1, 0, 0, 1, 1,
-0.2339069, 0.6064196, -0.774155, 1, 0, 0, 1, 1,
-0.2329893, 0.9063963, -1.391629, 1, 0, 0, 1, 1,
-0.2319221, 0.8424984, -0.3890957, 0, 0, 0, 1, 1,
-0.2314569, 0.9998617, -2.695908, 0, 0, 0, 1, 1,
-0.2296547, -1.786629, -4.202494, 0, 0, 0, 1, 1,
-0.2244257, 0.5759309, 0.4391398, 0, 0, 0, 1, 1,
-0.2204537, -0.7019988, -2.362247, 0, 0, 0, 1, 1,
-0.2153625, -1.060468, -0.8877, 0, 0, 0, 1, 1,
-0.2103644, 0.4152118, 0.2726267, 0, 0, 0, 1, 1,
-0.202961, -0.005131426, -2.480582, 1, 1, 1, 1, 1,
-0.2011285, 0.1170499, -1.292549, 1, 1, 1, 1, 1,
-0.1989042, -1.872816, -5.150414, 1, 1, 1, 1, 1,
-0.1926802, -1.43469, -3.120702, 1, 1, 1, 1, 1,
-0.191212, -2.036742, -3.462383, 1, 1, 1, 1, 1,
-0.1874416, 0.2834977, -1.6845, 1, 1, 1, 1, 1,
-0.1851057, -0.6934226, -3.273544, 1, 1, 1, 1, 1,
-0.1825924, -0.4201289, -2.045043, 1, 1, 1, 1, 1,
-0.1820066, -0.4561947, -1.69178, 1, 1, 1, 1, 1,
-0.1818163, -0.7590678, -2.730317, 1, 1, 1, 1, 1,
-0.1798947, 1.434149, -0.6157621, 1, 1, 1, 1, 1,
-0.1794216, -0.8822007, -2.945935, 1, 1, 1, 1, 1,
-0.1727606, -0.3222267, -2.6554, 1, 1, 1, 1, 1,
-0.1702296, 0.5192336, -0.3644623, 1, 1, 1, 1, 1,
-0.1699282, -2.554944, -3.143071, 1, 1, 1, 1, 1,
-0.1696801, -0.4538648, -2.429766, 0, 0, 1, 1, 1,
-0.1687218, 0.6357593, -0.5499162, 1, 0, 0, 1, 1,
-0.1685287, -1.050646, -3.844362, 1, 0, 0, 1, 1,
-0.1681631, 0.7371312, 0.6685841, 1, 0, 0, 1, 1,
-0.1676732, -1.038271, -2.666785, 1, 0, 0, 1, 1,
-0.1615768, 1.617608, 0.1784211, 1, 0, 0, 1, 1,
-0.1581324, 0.6192538, 0.5989029, 0, 0, 0, 1, 1,
-0.1523093, -1.226359, -3.783742, 0, 0, 0, 1, 1,
-0.1455209, -0.9526554, -2.794126, 0, 0, 0, 1, 1,
-0.1405298, 1.118044, -2.451283, 0, 0, 0, 1, 1,
-0.1389484, 0.6502562, -0.2831626, 0, 0, 0, 1, 1,
-0.1385273, 1.038546, -2.093713, 0, 0, 0, 1, 1,
-0.1362991, 0.09903541, -2.664458, 0, 0, 0, 1, 1,
-0.1349738, 0.4281701, 0.2185152, 1, 1, 1, 1, 1,
-0.1344435, 1.375833, 2.396555, 1, 1, 1, 1, 1,
-0.1343855, 2.043944, -0.921151, 1, 1, 1, 1, 1,
-0.1330055, 1.025684, 0.07839911, 1, 1, 1, 1, 1,
-0.1285046, -0.3530668, -1.590448, 1, 1, 1, 1, 1,
-0.1198032, 1.221018, 0.4109429, 1, 1, 1, 1, 1,
-0.1172072, 0.4631067, 1.131609, 1, 1, 1, 1, 1,
-0.1168815, 1.577169, 0.5546134, 1, 1, 1, 1, 1,
-0.1078813, 1.772997, 0.963825, 1, 1, 1, 1, 1,
-0.1054677, 1.186453, -0.3857806, 1, 1, 1, 1, 1,
-0.1032165, 1.721051, -0.1549732, 1, 1, 1, 1, 1,
-0.1007129, -0.413339, -2.541286, 1, 1, 1, 1, 1,
-0.1005601, 0.1586514, -0.4580259, 1, 1, 1, 1, 1,
-0.0999609, -0.4861041, -2.872112, 1, 1, 1, 1, 1,
-0.09776931, 1.411308, 1.972906, 1, 1, 1, 1, 1,
-0.09590089, 0.6947681, -0.6913145, 0, 0, 1, 1, 1,
-0.09161114, 1.329223, 0.2081429, 1, 0, 0, 1, 1,
-0.08766294, 0.4788237, -0.8241639, 1, 0, 0, 1, 1,
-0.08685916, -0.4882878, -1.994012, 1, 0, 0, 1, 1,
-0.08351722, 0.4849815, -0.5478793, 1, 0, 0, 1, 1,
-0.08141275, -0.5442162, -2.729292, 1, 0, 0, 1, 1,
-0.08076281, -0.3231578, -2.962117, 0, 0, 0, 1, 1,
-0.08052945, 0.8643602, -0.8256791, 0, 0, 0, 1, 1,
-0.07241873, -1.254672, -3.422737, 0, 0, 0, 1, 1,
-0.06518421, -0.874139, -3.138629, 0, 0, 0, 1, 1,
-0.06107971, 0.6434421, 1.882648, 0, 0, 0, 1, 1,
-0.05722543, 0.3781396, 0.5639158, 0, 0, 0, 1, 1,
-0.05590528, 0.1776144, -0.108091, 0, 0, 0, 1, 1,
-0.05373403, -0.1085118, -1.80005, 1, 1, 1, 1, 1,
-0.05352649, 0.670159, -0.2816626, 1, 1, 1, 1, 1,
-0.05061311, -0.3069259, -5.016642, 1, 1, 1, 1, 1,
-0.04748978, -0.4676753, -2.951661, 1, 1, 1, 1, 1,
-0.04710569, -0.9241964, -2.973174, 1, 1, 1, 1, 1,
-0.04644186, -0.190905, -3.859555, 1, 1, 1, 1, 1,
-0.04186598, -1.281195, -1.427712, 1, 1, 1, 1, 1,
-0.03994489, 0.5752935, -1.341403, 1, 1, 1, 1, 1,
-0.03909695, -0.3999464, -3.728171, 1, 1, 1, 1, 1,
-0.03890505, -0.02273906, -1.802323, 1, 1, 1, 1, 1,
-0.03847922, -1.604868, -1.513742, 1, 1, 1, 1, 1,
-0.03825174, -0.7195547, -2.979237, 1, 1, 1, 1, 1,
-0.03281944, -0.3963158, -1.968363, 1, 1, 1, 1, 1,
-0.03024736, 0.591543, -0.233256, 1, 1, 1, 1, 1,
-0.02770987, 1.813096, -1.203127, 1, 1, 1, 1, 1,
-0.02564238, -0.2259695, -3.257973, 0, 0, 1, 1, 1,
-0.02441937, 0.5736222, -1.193461, 1, 0, 0, 1, 1,
-0.02169493, -0.4713776, -3.994414, 1, 0, 0, 1, 1,
-0.01974352, 1.791283, -2.138296, 1, 0, 0, 1, 1,
-0.01303993, -0.4378979, -4.014836, 1, 0, 0, 1, 1,
-0.009754696, 0.3261668, -1.610395, 1, 0, 0, 1, 1,
-0.008218142, -0.847419, -2.247608, 0, 0, 0, 1, 1,
-0.005717021, -0.090138, -2.974488, 0, 0, 0, 1, 1,
0.001404419, -0.6796672, 3.46336, 0, 0, 0, 1, 1,
0.001527298, 0.3490319, 1.481231, 0, 0, 0, 1, 1,
0.00486414, 1.065367, 1.03421, 0, 0, 0, 1, 1,
0.006237908, 0.4019227, 0.4849382, 0, 0, 0, 1, 1,
0.01564002, -0.4597845, 3.278588, 0, 0, 0, 1, 1,
0.02270192, 0.7965537, 1.717904, 1, 1, 1, 1, 1,
0.02425759, -0.4498051, 3.930957, 1, 1, 1, 1, 1,
0.02509882, -0.7397024, 2.462416, 1, 1, 1, 1, 1,
0.02812433, 0.2848213, 0.3909822, 1, 1, 1, 1, 1,
0.03032687, -1.163955, 1.780168, 1, 1, 1, 1, 1,
0.03260297, -0.9268329, 2.587799, 1, 1, 1, 1, 1,
0.0340524, -1.313175, 2.533632, 1, 1, 1, 1, 1,
0.03424513, -1.510433, 5.242553, 1, 1, 1, 1, 1,
0.03729298, -0.5803477, 4.544972, 1, 1, 1, 1, 1,
0.04459312, -0.2787123, 3.983218, 1, 1, 1, 1, 1,
0.04537106, -0.138013, 3.672702, 1, 1, 1, 1, 1,
0.04646245, 0.7360653, -1.094624, 1, 1, 1, 1, 1,
0.05104014, 0.1537159, 3.030594, 1, 1, 1, 1, 1,
0.05233712, -0.574419, 2.094838, 1, 1, 1, 1, 1,
0.05468602, -0.7982568, 2.374066, 1, 1, 1, 1, 1,
0.05525063, -0.5519946, 3.246761, 0, 0, 1, 1, 1,
0.05619537, 0.2479057, 0.9390909, 1, 0, 0, 1, 1,
0.0569041, 0.08846132, 2.960238, 1, 0, 0, 1, 1,
0.06083349, -0.1867162, 4.207971, 1, 0, 0, 1, 1,
0.06098841, -0.1796543, 3.570148, 1, 0, 0, 1, 1,
0.06735788, 1.796127, -0.6522967, 1, 0, 0, 1, 1,
0.06987637, 1.625471, -1.05675, 0, 0, 0, 1, 1,
0.07903895, 0.7302881, 0.5884118, 0, 0, 0, 1, 1,
0.07964971, 0.7441812, -1.027243, 0, 0, 0, 1, 1,
0.08670312, 0.5044389, -2.277138, 0, 0, 0, 1, 1,
0.08852072, -1.653816, 4.291761, 0, 0, 0, 1, 1,
0.09009703, 0.1316074, 1.266964, 0, 0, 0, 1, 1,
0.09031198, 1.101386, -0.8538094, 0, 0, 0, 1, 1,
0.09075481, -0.5221315, 2.185292, 1, 1, 1, 1, 1,
0.09452207, -0.6590316, 3.810047, 1, 1, 1, 1, 1,
0.09458286, -0.694702, 2.563695, 1, 1, 1, 1, 1,
0.09494447, 1.510174, 0.1306419, 1, 1, 1, 1, 1,
0.09613775, -1.117777, 4.231954, 1, 1, 1, 1, 1,
0.09688983, -1.075853, 2.146101, 1, 1, 1, 1, 1,
0.09746287, -1.314112, 1.612387, 1, 1, 1, 1, 1,
0.1052524, 1.678612, -0.5618102, 1, 1, 1, 1, 1,
0.1060838, 1.063623, 0.5555438, 1, 1, 1, 1, 1,
0.106484, -0.3647551, 0.9814835, 1, 1, 1, 1, 1,
0.1075775, 1.57621, 0.7044353, 1, 1, 1, 1, 1,
0.1156173, 1.26982, -0.4397531, 1, 1, 1, 1, 1,
0.1186243, -1.482553, 2.053447, 1, 1, 1, 1, 1,
0.1186858, 1.956221, -0.5634101, 1, 1, 1, 1, 1,
0.1216437, 1.117178, -0.7182386, 1, 1, 1, 1, 1,
0.1229107, 1.240924, 0.1846241, 0, 0, 1, 1, 1,
0.1336878, 0.1386304, 0.2269827, 1, 0, 0, 1, 1,
0.1352865, -0.5373861, 1.467888, 1, 0, 0, 1, 1,
0.1363744, -0.5842012, 2.032743, 1, 0, 0, 1, 1,
0.1372573, -0.5431588, 2.601164, 1, 0, 0, 1, 1,
0.1381028, 0.4817404, -0.6125776, 1, 0, 0, 1, 1,
0.1385732, -0.3012563, 1.314678, 0, 0, 0, 1, 1,
0.1406534, -2.565508, 1.812723, 0, 0, 0, 1, 1,
0.1414162, -1.699804, 4.861842, 0, 0, 0, 1, 1,
0.1425022, -1.100296, 2.496807, 0, 0, 0, 1, 1,
0.1514598, -0.1110715, 2.468005, 0, 0, 0, 1, 1,
0.1564075, 1.992631, 0.7943217, 0, 0, 0, 1, 1,
0.1641562, 0.6017675, -0.2777022, 0, 0, 0, 1, 1,
0.1687635, -0.4188214, 1.132234, 1, 1, 1, 1, 1,
0.1704584, -0.1360665, 3.514508, 1, 1, 1, 1, 1,
0.1708663, -0.2259729, 1.413071, 1, 1, 1, 1, 1,
0.173906, -0.4275794, 2.88628, 1, 1, 1, 1, 1,
0.175119, -0.3646679, 2.22114, 1, 1, 1, 1, 1,
0.1782273, 0.5702208, -0.5510926, 1, 1, 1, 1, 1,
0.1795464, 1.180771, 0.9385759, 1, 1, 1, 1, 1,
0.1817295, 0.1294864, 1.377369, 1, 1, 1, 1, 1,
0.1836166, -0.02063856, 1.763062, 1, 1, 1, 1, 1,
0.1850177, 0.4007288, -1.318622, 1, 1, 1, 1, 1,
0.1866321, -0.7252344, 3.793337, 1, 1, 1, 1, 1,
0.1876437, 0.7242908, 0.2423465, 1, 1, 1, 1, 1,
0.18821, 0.2845564, -0.0187311, 1, 1, 1, 1, 1,
0.188317, 0.2839993, 1.956596, 1, 1, 1, 1, 1,
0.1919242, 1.626433, 0.0723152, 1, 1, 1, 1, 1,
0.1925396, 1.601708, -1.040026, 0, 0, 1, 1, 1,
0.1964563, 0.2511701, -0.1676149, 1, 0, 0, 1, 1,
0.1972025, 0.2319435, 0.2340433, 1, 0, 0, 1, 1,
0.201006, 0.786368, -0.176452, 1, 0, 0, 1, 1,
0.2014808, 0.5522771, -0.3835182, 1, 0, 0, 1, 1,
0.2023916, -0.5507868, 1.451298, 1, 0, 0, 1, 1,
0.2031022, -0.6567944, 3.123705, 0, 0, 0, 1, 1,
0.2069331, -0.06505717, 2.922462, 0, 0, 0, 1, 1,
0.211826, 0.273582, -0.1297012, 0, 0, 0, 1, 1,
0.2165755, 2.773254, -0.5828446, 0, 0, 0, 1, 1,
0.2166812, -1.340656, 3.811355, 0, 0, 0, 1, 1,
0.2185029, 1.346974, 0.06230492, 0, 0, 0, 1, 1,
0.2274077, 0.9853991, 1.533158, 0, 0, 0, 1, 1,
0.2315782, -0.3566009, 4.161031, 1, 1, 1, 1, 1,
0.2332596, -0.793058, 4.402296, 1, 1, 1, 1, 1,
0.2362606, -0.461381, 1.98276, 1, 1, 1, 1, 1,
0.2408463, -0.8751434, 3.817498, 1, 1, 1, 1, 1,
0.2440585, 1.413035, 0.7587357, 1, 1, 1, 1, 1,
0.2502808, -0.7552809, 2.069331, 1, 1, 1, 1, 1,
0.2524052, 0.3779713, 1.409818, 1, 1, 1, 1, 1,
0.2531432, 1.397215, 1.167678, 1, 1, 1, 1, 1,
0.2555026, -1.327264, 3.62731, 1, 1, 1, 1, 1,
0.2578314, -2.267696, 2.522732, 1, 1, 1, 1, 1,
0.2593673, 0.7489575, -0.2155205, 1, 1, 1, 1, 1,
0.2605852, -0.9282959, 3.710993, 1, 1, 1, 1, 1,
0.2639404, 0.6055352, 1.816883, 1, 1, 1, 1, 1,
0.2642134, -1.325551, 1.527219, 1, 1, 1, 1, 1,
0.2655964, -1.007273, 2.980537, 1, 1, 1, 1, 1,
0.2656544, 1.367982, 0.9473764, 0, 0, 1, 1, 1,
0.2708507, -0.7613661, 4.070292, 1, 0, 0, 1, 1,
0.2734921, 0.7353061, -1.609872, 1, 0, 0, 1, 1,
0.2761739, -3.13327, 2.385427, 1, 0, 0, 1, 1,
0.2818961, -0.6589013, 3.780899, 1, 0, 0, 1, 1,
0.2821156, -1.853369, 3.632068, 1, 0, 0, 1, 1,
0.2858362, -0.6798329, 2.062843, 0, 0, 0, 1, 1,
0.2918284, -1.226637, 3.196719, 0, 0, 0, 1, 1,
0.2931315, 1.039124, 0.06688063, 0, 0, 0, 1, 1,
0.2986136, -0.7621136, 2.837275, 0, 0, 0, 1, 1,
0.2986618, -0.1181609, 2.847831, 0, 0, 0, 1, 1,
0.299327, -1.714883, 1.16662, 0, 0, 0, 1, 1,
0.2998933, 2.447975, 1.048829, 0, 0, 0, 1, 1,
0.3041353, 0.4590116, 1.309999, 1, 1, 1, 1, 1,
0.3056019, -0.6446633, 2.338515, 1, 1, 1, 1, 1,
0.3076072, -0.8849733, 2.795193, 1, 1, 1, 1, 1,
0.3099999, -0.7191246, 2.778142, 1, 1, 1, 1, 1,
0.3123425, -0.4718465, 0.8863822, 1, 1, 1, 1, 1,
0.3206631, 0.8400537, 0.6859977, 1, 1, 1, 1, 1,
0.3243014, 0.4301746, -1.170046, 1, 1, 1, 1, 1,
0.326992, -0.03203507, 0.9775887, 1, 1, 1, 1, 1,
0.3291579, -0.289602, 2.178798, 1, 1, 1, 1, 1,
0.3294023, 2.014028, -0.08608832, 1, 1, 1, 1, 1,
0.3317813, 1.221948, -0.5232644, 1, 1, 1, 1, 1,
0.3348463, 1.113132, -1.132799, 1, 1, 1, 1, 1,
0.336058, -0.6665298, 2.06086, 1, 1, 1, 1, 1,
0.3411643, 0.1559071, -0.1827672, 1, 1, 1, 1, 1,
0.343215, -2.072759, 2.747205, 1, 1, 1, 1, 1,
0.3453784, 0.3026449, 1.051862, 0, 0, 1, 1, 1,
0.3477123, 0.7939147, 0.2585964, 1, 0, 0, 1, 1,
0.3521767, 0.6506366, 0.2312926, 1, 0, 0, 1, 1,
0.3522477, -0.9601884, 5.078677, 1, 0, 0, 1, 1,
0.35239, 0.5318057, -0.2359634, 1, 0, 0, 1, 1,
0.3536688, 0.9549282, 1.741953, 1, 0, 0, 1, 1,
0.354682, 1.062302, 1.247354, 0, 0, 0, 1, 1,
0.3569303, -0.6798345, 1.492254, 0, 0, 0, 1, 1,
0.3682276, -0.2380009, 2.323985, 0, 0, 0, 1, 1,
0.3704048, 0.3715698, 0.1011721, 0, 0, 0, 1, 1,
0.3722908, -2.090968, 4.02639, 0, 0, 0, 1, 1,
0.373033, -0.7193968, 3.223841, 0, 0, 0, 1, 1,
0.3734255, 0.5752822, -0.6804992, 0, 0, 0, 1, 1,
0.3743434, -0.4840015, 1.144293, 1, 1, 1, 1, 1,
0.3744563, 1.316387, -0.2918628, 1, 1, 1, 1, 1,
0.3772416, -0.711326, 3.172627, 1, 1, 1, 1, 1,
0.3930372, 1.120446, 0.1515822, 1, 1, 1, 1, 1,
0.3931915, 0.08864202, 2.0848, 1, 1, 1, 1, 1,
0.3938656, 0.4886486, 1.424401, 1, 1, 1, 1, 1,
0.3952267, -1.640779, 3.575717, 1, 1, 1, 1, 1,
0.3976916, -1.756113, 3.928333, 1, 1, 1, 1, 1,
0.3995658, 0.227314, 0.448997, 1, 1, 1, 1, 1,
0.399942, -2.366662, 2.695568, 1, 1, 1, 1, 1,
0.4005438, 0.5082994, -0.04588724, 1, 1, 1, 1, 1,
0.4007602, 0.6359337, -0.09383912, 1, 1, 1, 1, 1,
0.4018674, 0.4205758, 0.5409396, 1, 1, 1, 1, 1,
0.4060653, 0.08411894, 0.3330721, 1, 1, 1, 1, 1,
0.4076261, -0.7351139, 3.03859, 1, 1, 1, 1, 1,
0.4105734, 0.3306443, -0.08861984, 0, 0, 1, 1, 1,
0.4110285, -0.5242113, 3.313262, 1, 0, 0, 1, 1,
0.4122162, -1.860007, 3.270281, 1, 0, 0, 1, 1,
0.4131912, -0.2018003, 3.702071, 1, 0, 0, 1, 1,
0.4142851, -0.6983922, 4.540081, 1, 0, 0, 1, 1,
0.4144448, 0.4487945, -1.15474, 1, 0, 0, 1, 1,
0.4150367, 1.027053, 0.2693281, 0, 0, 0, 1, 1,
0.4153709, 0.5180358, 0.01095304, 0, 0, 0, 1, 1,
0.4190635, -0.1913599, 0.9615106, 0, 0, 0, 1, 1,
0.4204205, 0.445941, -0.9350641, 0, 0, 0, 1, 1,
0.4218819, -1.010023, 2.113984, 0, 0, 0, 1, 1,
0.4220874, 0.5887356, 0.9177206, 0, 0, 0, 1, 1,
0.4227972, 0.6564391, 0.6231887, 0, 0, 0, 1, 1,
0.4229336, 1.001158, -0.2165697, 1, 1, 1, 1, 1,
0.4234132, -0.1010475, 2.444204, 1, 1, 1, 1, 1,
0.4248855, 1.02886, 0.0242114, 1, 1, 1, 1, 1,
0.4269759, -0.2322936, 2.247878, 1, 1, 1, 1, 1,
0.4295928, -1.911156, 2.47368, 1, 1, 1, 1, 1,
0.4327508, 0.3102147, 2.405331, 1, 1, 1, 1, 1,
0.4346849, 0.07217088, 1.491587, 1, 1, 1, 1, 1,
0.4355403, -0.1650828, 2.935256, 1, 1, 1, 1, 1,
0.437932, -1.619424, 3.736248, 1, 1, 1, 1, 1,
0.4403343, -1.102167, 2.606478, 1, 1, 1, 1, 1,
0.4404875, -0.05547412, 1.635047, 1, 1, 1, 1, 1,
0.4428195, 2.700202, 0.3453533, 1, 1, 1, 1, 1,
0.4434624, -2.232466, 2.76101, 1, 1, 1, 1, 1,
0.4465793, 0.08278765, 1.533097, 1, 1, 1, 1, 1,
0.4536296, -0.2192888, 1.468102, 1, 1, 1, 1, 1,
0.454318, 0.6169809, 0.08719698, 0, 0, 1, 1, 1,
0.4552496, 0.9598873, 2.384518, 1, 0, 0, 1, 1,
0.4600042, 0.3890768, 0.4083589, 1, 0, 0, 1, 1,
0.4620028, -1.602154, 4.106658, 1, 0, 0, 1, 1,
0.462282, 1.683487, 0.9285086, 1, 0, 0, 1, 1,
0.4657205, -0.005222153, 1.102722, 1, 0, 0, 1, 1,
0.4666986, -0.1571444, 1.222149, 0, 0, 0, 1, 1,
0.4684248, -0.6413618, 2.347798, 0, 0, 0, 1, 1,
0.47629, 0.07043567, 1.26975, 0, 0, 0, 1, 1,
0.4782223, -1.110787, 3.806503, 0, 0, 0, 1, 1,
0.4815145, 1.171043, 0.3509067, 0, 0, 0, 1, 1,
0.4844961, 0.4980185, 0.8048769, 0, 0, 0, 1, 1,
0.4860346, 1.181628, 0.4564685, 0, 0, 0, 1, 1,
0.4901723, 1.093626, 0.565659, 1, 1, 1, 1, 1,
0.4932226, -0.8225037, 1.333169, 1, 1, 1, 1, 1,
0.494265, 0.1046539, 2.43364, 1, 1, 1, 1, 1,
0.4953312, 1.127162, -0.1077715, 1, 1, 1, 1, 1,
0.5012623, 1.301095, -0.2905587, 1, 1, 1, 1, 1,
0.5016439, -0.2800755, 0.8340421, 1, 1, 1, 1, 1,
0.5028588, -1.574191, 0.3258033, 1, 1, 1, 1, 1,
0.5036485, -0.3358456, 0.5810357, 1, 1, 1, 1, 1,
0.5062561, -1.438882, 3.525464, 1, 1, 1, 1, 1,
0.5069884, -1.199846, 2.390287, 1, 1, 1, 1, 1,
0.5175615, -0.9655403, 0.9791936, 1, 1, 1, 1, 1,
0.5185795, -1.616026, 2.431115, 1, 1, 1, 1, 1,
0.5198045, -0.6131606, 1.449269, 1, 1, 1, 1, 1,
0.5211337, 0.04688361, -0.277182, 1, 1, 1, 1, 1,
0.5212464, -0.3014944, 1.218245, 1, 1, 1, 1, 1,
0.5220304, -0.6607894, 2.243408, 0, 0, 1, 1, 1,
0.5237919, -0.06451112, 2.209701, 1, 0, 0, 1, 1,
0.5322398, -0.5891451, 4.006468, 1, 0, 0, 1, 1,
0.5352141, -0.7779229, -0.2114223, 1, 0, 0, 1, 1,
0.540306, 0.07181678, 2.123149, 1, 0, 0, 1, 1,
0.5409144, 0.5995614, 1.990577, 1, 0, 0, 1, 1,
0.5459531, 0.5011021, 0.6201901, 0, 0, 0, 1, 1,
0.5474213, -0.6495205, 1.721718, 0, 0, 0, 1, 1,
0.5515472, 0.6844099, -0.03032195, 0, 0, 0, 1, 1,
0.5568841, 0.5201616, 0.9958666, 0, 0, 0, 1, 1,
0.5641738, -0.9858214, 2.150768, 0, 0, 0, 1, 1,
0.5669603, -0.9068441, 3.387019, 0, 0, 0, 1, 1,
0.5700898, 0.8397402, 0.2124267, 0, 0, 0, 1, 1,
0.5704445, -1.14977, 2.508021, 1, 1, 1, 1, 1,
0.5712485, 0.247057, 0.88449, 1, 1, 1, 1, 1,
0.5743625, -0.2451698, 2.227756, 1, 1, 1, 1, 1,
0.578881, -1.103091, 2.50195, 1, 1, 1, 1, 1,
0.5813327, -1.916072, 3.165004, 1, 1, 1, 1, 1,
0.5822383, 0.9550177, 0.07628248, 1, 1, 1, 1, 1,
0.585456, 0.006098608, 1.663922, 1, 1, 1, 1, 1,
0.5990543, -0.1406128, 1.350259, 1, 1, 1, 1, 1,
0.6000475, -1.317757, 3.945881, 1, 1, 1, 1, 1,
0.6018209, -0.8822398, 2.085108, 1, 1, 1, 1, 1,
0.6077981, -0.1766703, 1.378756, 1, 1, 1, 1, 1,
0.6116388, -0.8946751, 3.180702, 1, 1, 1, 1, 1,
0.6123966, 0.7087034, 1.45113, 1, 1, 1, 1, 1,
0.6150264, 0.2457201, -0.08519533, 1, 1, 1, 1, 1,
0.6167689, 1.532308, 0.1791006, 1, 1, 1, 1, 1,
0.6207845, 0.2987536, 3.121469, 0, 0, 1, 1, 1,
0.6213161, -0.2217995, 2.317116, 1, 0, 0, 1, 1,
0.621678, 0.6429508, 0.1737729, 1, 0, 0, 1, 1,
0.6262898, -2.336181, 1.777162, 1, 0, 0, 1, 1,
0.6269011, -0.1923277, 2.488773, 1, 0, 0, 1, 1,
0.6272343, -0.6068387, 2.626933, 1, 0, 0, 1, 1,
0.6311562, -0.05040696, 1.796989, 0, 0, 0, 1, 1,
0.6390192, 2.313799, 1.015534, 0, 0, 0, 1, 1,
0.641838, -0.3269477, 1.913233, 0, 0, 0, 1, 1,
0.6504599, -0.7152098, 2.376632, 0, 0, 0, 1, 1,
0.651442, -0.4951613, 1.277031, 0, 0, 0, 1, 1,
0.6580006, 0.2713743, 0.9002713, 0, 0, 0, 1, 1,
0.6602936, 2.073159, 1.831599, 0, 0, 0, 1, 1,
0.6603521, -0.3767074, 2.273916, 1, 1, 1, 1, 1,
0.6608108, -1.1374, 3.556829, 1, 1, 1, 1, 1,
0.6644709, -0.4835702, 2.269814, 1, 1, 1, 1, 1,
0.6712291, 0.09986007, 0.1820168, 1, 1, 1, 1, 1,
0.6738531, -0.2597606, 0.6982809, 1, 1, 1, 1, 1,
0.6762912, -0.06756943, 2.255413, 1, 1, 1, 1, 1,
0.6785216, -0.2402991, 2.372066, 1, 1, 1, 1, 1,
0.6788794, 0.3532016, -0.3698954, 1, 1, 1, 1, 1,
0.6823317, -1.619778, 3.881039, 1, 1, 1, 1, 1,
0.6935745, -0.8437868, 4.276544, 1, 1, 1, 1, 1,
0.6959319, -2.021472, 3.12235, 1, 1, 1, 1, 1,
0.6980576, -0.672443, 1.584377, 1, 1, 1, 1, 1,
0.698918, -1.341677, 3.147322, 1, 1, 1, 1, 1,
0.7002855, -0.3160229, 3.645632, 1, 1, 1, 1, 1,
0.7008941, -1.263472, 2.952906, 1, 1, 1, 1, 1,
0.7056084, -0.2082091, 0.9189906, 0, 0, 1, 1, 1,
0.7132391, 0.3610733, 2.652623, 1, 0, 0, 1, 1,
0.7152363, 1.833547, -0.6721105, 1, 0, 0, 1, 1,
0.7153294, 1.019451, 0.05160512, 1, 0, 0, 1, 1,
0.7153568, 0.3157901, 1.071955, 1, 0, 0, 1, 1,
0.729085, -1.560098, 2.857049, 1, 0, 0, 1, 1,
0.7372252, -1.590717, 1.563568, 0, 0, 0, 1, 1,
0.7376452, -0.6945049, 1.612081, 0, 0, 0, 1, 1,
0.7440255, 0.3108145, 1.459532, 0, 0, 0, 1, 1,
0.7443559, 0.03919077, 2.358073, 0, 0, 0, 1, 1,
0.744658, -0.4265336, 2.589908, 0, 0, 0, 1, 1,
0.7447302, 0.9220491, -1.043997, 0, 0, 0, 1, 1,
0.7464671, -1.885949, 3.491885, 0, 0, 0, 1, 1,
0.7538297, 0.04387598, 1.389712, 1, 1, 1, 1, 1,
0.7620854, -1.52862, 1.920865, 1, 1, 1, 1, 1,
0.7628739, 0.1793175, 1.365467, 1, 1, 1, 1, 1,
0.7742404, -0.7639674, 0.5211418, 1, 1, 1, 1, 1,
0.7759815, -1.540863, 2.026618, 1, 1, 1, 1, 1,
0.7772499, -1.81715, 4.84649, 1, 1, 1, 1, 1,
0.7860274, 0.1739415, 2.839039, 1, 1, 1, 1, 1,
0.7874555, 0.9155036, 1.411074, 1, 1, 1, 1, 1,
0.7878255, -0.7297603, 1.129657, 1, 1, 1, 1, 1,
0.788938, 0.6175727, 1.160181, 1, 1, 1, 1, 1,
0.7899439, -2.072526, 0.6303862, 1, 1, 1, 1, 1,
0.7992424, -1.163503, 2.453253, 1, 1, 1, 1, 1,
0.8066137, 0.9940052, 0.398929, 1, 1, 1, 1, 1,
0.8074366, 0.9376422, 1.211933, 1, 1, 1, 1, 1,
0.8094057, -0.1309484, 0.2160275, 1, 1, 1, 1, 1,
0.8100349, -2.790215, 3.422694, 0, 0, 1, 1, 1,
0.8142639, 0.6664418, 0.8218718, 1, 0, 0, 1, 1,
0.8175374, 0.5938022, 2.05694, 1, 0, 0, 1, 1,
0.819547, 0.8629449, 0.4162418, 1, 0, 0, 1, 1,
0.8197339, -1.034927, 4.182181, 1, 0, 0, 1, 1,
0.8251303, -0.435128, 1.312347, 1, 0, 0, 1, 1,
0.8254391, -0.04955804, 1.46623, 0, 0, 0, 1, 1,
0.8271598, -0.06208285, 1.732697, 0, 0, 0, 1, 1,
0.8304778, 0.7488758, -0.2278055, 0, 0, 0, 1, 1,
0.8326203, -0.004391346, 1.697928, 0, 0, 0, 1, 1,
0.8327987, -0.1931221, 4.361191, 0, 0, 0, 1, 1,
0.8345879, 0.02971788, 1.087673, 0, 0, 0, 1, 1,
0.8368095, -1.366209, 3.604454, 0, 0, 0, 1, 1,
0.838348, -0.09407547, 2.303332, 1, 1, 1, 1, 1,
0.8405261, 2.323677, -1.021394, 1, 1, 1, 1, 1,
0.8415565, -0.3671004, 1.174667, 1, 1, 1, 1, 1,
0.8436375, -0.7949817, 3.024756, 1, 1, 1, 1, 1,
0.8506218, -0.7226001, 2.606103, 1, 1, 1, 1, 1,
0.8528261, 0.8430099, 2.29777, 1, 1, 1, 1, 1,
0.8545825, 0.7076932, 0.8682435, 1, 1, 1, 1, 1,
0.8546321, 0.4336535, 1.470356, 1, 1, 1, 1, 1,
0.856169, -1.147763, 1.391115, 1, 1, 1, 1, 1,
0.8562295, 0.5636742, 0.377405, 1, 1, 1, 1, 1,
0.8660054, -1.122648, 0.117033, 1, 1, 1, 1, 1,
0.8666286, -0.2027207, 1.20771, 1, 1, 1, 1, 1,
0.8675967, 2.774508, 1.649673, 1, 1, 1, 1, 1,
0.8718986, 0.4955786, 0.4494685, 1, 1, 1, 1, 1,
0.874557, -0.1223647, 1.574434, 1, 1, 1, 1, 1,
0.8777053, -1.124908, 4.049091, 0, 0, 1, 1, 1,
0.8797351, -1.528413, 2.602941, 1, 0, 0, 1, 1,
0.8815405, -1.335186, 3.481287, 1, 0, 0, 1, 1,
0.8831392, 0.2739476, 0.3398556, 1, 0, 0, 1, 1,
0.8848356, -1.906848, 2.511643, 1, 0, 0, 1, 1,
0.8864651, 0.07687542, 0.486543, 1, 0, 0, 1, 1,
0.8867421, -1.262525, 2.157599, 0, 0, 0, 1, 1,
0.8868048, 0.9032328, 2.248532, 0, 0, 0, 1, 1,
0.8929648, 0.4179546, 1.312845, 0, 0, 0, 1, 1,
0.8968541, -1.676978, 2.64744, 0, 0, 0, 1, 1,
0.9011607, 0.1549614, 2.861659, 0, 0, 0, 1, 1,
0.9074302, -1.78562, 2.356131, 0, 0, 0, 1, 1,
0.9108058, -0.9130523, 3.459186, 0, 0, 0, 1, 1,
0.9163366, -1.602935, 1.460399, 1, 1, 1, 1, 1,
0.9212623, -1.223575, 2.207498, 1, 1, 1, 1, 1,
0.9252108, -0.9714279, 0.633978, 1, 1, 1, 1, 1,
0.9259715, 0.9956645, 1.467245, 1, 1, 1, 1, 1,
0.926313, -0.3848767, 1.484731, 1, 1, 1, 1, 1,
0.9311338, 0.237165, 1.876852, 1, 1, 1, 1, 1,
0.936898, 1.076142, 1.27373, 1, 1, 1, 1, 1,
0.9375517, -1.824035, 2.900692, 1, 1, 1, 1, 1,
0.939635, 1.874464, 1.344438, 1, 1, 1, 1, 1,
0.940111, -1.290008, 1.718179, 1, 1, 1, 1, 1,
0.9538794, -0.9988124, -1.324776, 1, 1, 1, 1, 1,
0.9605449, -0.1832309, 1.548109, 1, 1, 1, 1, 1,
0.9607176, 2.882327, 0.2400952, 1, 1, 1, 1, 1,
0.9670355, -0.4396056, 1.185308, 1, 1, 1, 1, 1,
0.9703206, -2.34237, 3.1215, 1, 1, 1, 1, 1,
0.9731998, 0.1735017, 1.825331, 0, 0, 1, 1, 1,
0.986168, -0.3673438, 0.3459357, 1, 0, 0, 1, 1,
0.9867943, 0.7634064, 0.961079, 1, 0, 0, 1, 1,
1.002843, 0.4292583, 1.480229, 1, 0, 0, 1, 1,
1.002901, 0.5582763, 0.08480354, 1, 0, 0, 1, 1,
1.005022, 0.8916174, 0.7759339, 1, 0, 0, 1, 1,
1.006566, -0.3510538, -0.2376233, 0, 0, 0, 1, 1,
1.008571, -1.347216, 1.816196, 0, 0, 0, 1, 1,
1.013028, 0.0571793, 2.431163, 0, 0, 0, 1, 1,
1.024511, -1.54189, 3.559906, 0, 0, 0, 1, 1,
1.024673, 0.7218012, 1.485472, 0, 0, 0, 1, 1,
1.03377, -1.40598, 3.38124, 0, 0, 0, 1, 1,
1.042568, 1.125819, -0.03703882, 0, 0, 0, 1, 1,
1.044468, 0.380532, 0.8221375, 1, 1, 1, 1, 1,
1.064715, 0.1514835, 2.512292, 1, 1, 1, 1, 1,
1.066363, 1.119016, -1.267535, 1, 1, 1, 1, 1,
1.07036, 0.7701718, 2.172815, 1, 1, 1, 1, 1,
1.071862, -1.034297, 2.204352, 1, 1, 1, 1, 1,
1.074306, -0.7510495, 1.418801, 1, 1, 1, 1, 1,
1.080961, 1.783397, 0.899771, 1, 1, 1, 1, 1,
1.081709, -1.042243, 1.948432, 1, 1, 1, 1, 1,
1.08502, 2.986794, 0.4114738, 1, 1, 1, 1, 1,
1.086811, -0.570869, 1.494867, 1, 1, 1, 1, 1,
1.092047, -1.976423, 3.169189, 1, 1, 1, 1, 1,
1.096835, 0.1874442, 1.059693, 1, 1, 1, 1, 1,
1.097238, -1.230251, 2.770484, 1, 1, 1, 1, 1,
1.09788, -0.7030587, 2.898151, 1, 1, 1, 1, 1,
1.099634, 0.6009904, 0.4566847, 1, 1, 1, 1, 1,
1.100367, 0.5503606, 1.21715, 0, 0, 1, 1, 1,
1.10676, -1.145712, 2.119163, 1, 0, 0, 1, 1,
1.111878, -0.01823878, 1.181546, 1, 0, 0, 1, 1,
1.114027, -1.06792, 1.196356, 1, 0, 0, 1, 1,
1.114754, -0.503156, 1.811561, 1, 0, 0, 1, 1,
1.122494, -2.123246, 0.9389688, 1, 0, 0, 1, 1,
1.122731, 2.604142, 0.3715369, 0, 0, 0, 1, 1,
1.127907, 2.125756, -0.07433271, 0, 0, 0, 1, 1,
1.133081, -0.03944628, 0.3610798, 0, 0, 0, 1, 1,
1.133798, -0.1220342, 0.686904, 0, 0, 0, 1, 1,
1.135772, 0.4620661, 1.11575, 0, 0, 0, 1, 1,
1.142738, -0.854086, 2.275759, 0, 0, 0, 1, 1,
1.156879, 0.8506221, 2.917278, 0, 0, 0, 1, 1,
1.15839, -0.9214203, -0.2711503, 1, 1, 1, 1, 1,
1.158833, 0.4331509, 1.165888, 1, 1, 1, 1, 1,
1.16768, 0.4510729, 0.5256933, 1, 1, 1, 1, 1,
1.184194, -0.5848916, 2.492018, 1, 1, 1, 1, 1,
1.198582, -0.3347958, 2.154637, 1, 1, 1, 1, 1,
1.199186, 0.97622, 0.7880373, 1, 1, 1, 1, 1,
1.203853, -1.435096, 2.534142, 1, 1, 1, 1, 1,
1.204529, -0.8502095, 1.79622, 1, 1, 1, 1, 1,
1.208361, -1.646734, 2.146053, 1, 1, 1, 1, 1,
1.215579, -0.9524777, 3.159172, 1, 1, 1, 1, 1,
1.221674, 0.8769575, -0.4465016, 1, 1, 1, 1, 1,
1.223131, 1.18937, 0.8973119, 1, 1, 1, 1, 1,
1.224497, 0.07139408, 1.147748, 1, 1, 1, 1, 1,
1.226094, 1.998934, 1.779809, 1, 1, 1, 1, 1,
1.236362, 0.7239329, 1.615774, 1, 1, 1, 1, 1,
1.237224, 0.1501132, 1.02352, 0, 0, 1, 1, 1,
1.246677, 0.298878, 0.12983, 1, 0, 0, 1, 1,
1.248834, -1.957349, 1.451027, 1, 0, 0, 1, 1,
1.270812, -0.6139385, 1.18207, 1, 0, 0, 1, 1,
1.271081, 1.109743, -0.4437598, 1, 0, 0, 1, 1,
1.277998, -0.841905, 3.355103, 1, 0, 0, 1, 1,
1.278015, -1.789513, 3.681261, 0, 0, 0, 1, 1,
1.278697, -0.4946146, 2.00107, 0, 0, 0, 1, 1,
1.292111, 0.2842183, -0.05530038, 0, 0, 0, 1, 1,
1.306569, 0.961277, 0.5088044, 0, 0, 0, 1, 1,
1.311323, 0.6903778, -0.4608846, 0, 0, 0, 1, 1,
1.333306, 0.3308982, -0.1741039, 0, 0, 0, 1, 1,
1.346628, 0.5420899, 1.498445, 0, 0, 0, 1, 1,
1.358136, 2.29905, 1.821719, 1, 1, 1, 1, 1,
1.361424, 0.1820516, 1.366981, 1, 1, 1, 1, 1,
1.363108, 1.175609, 0.7497287, 1, 1, 1, 1, 1,
1.375344, 0.2007269, 1.786921, 1, 1, 1, 1, 1,
1.384673, 0.7662724, 0.8532351, 1, 1, 1, 1, 1,
1.390602, 0.3772572, -0.4296554, 1, 1, 1, 1, 1,
1.394401, 1.114166, 0.7042934, 1, 1, 1, 1, 1,
1.405119, 0.7169868, 0.6453838, 1, 1, 1, 1, 1,
1.405769, 0.6881285, 0.9065202, 1, 1, 1, 1, 1,
1.410885, -0.9978074, 1.569201, 1, 1, 1, 1, 1,
1.411599, 0.08763735, 3.349529, 1, 1, 1, 1, 1,
1.41248, 1.001054, 1.995676, 1, 1, 1, 1, 1,
1.413883, 0.09478154, 1.367002, 1, 1, 1, 1, 1,
1.414958, 2.577702, 0.8367889, 1, 1, 1, 1, 1,
1.415774, -0.3969903, 2.641586, 1, 1, 1, 1, 1,
1.415879, -0.7365624, 2.632808, 0, 0, 1, 1, 1,
1.416464, 0.5658259, 0.6709232, 1, 0, 0, 1, 1,
1.422508, -1.814535, 1.520353, 1, 0, 0, 1, 1,
1.423561, 0.07012186, 1.391687, 1, 0, 0, 1, 1,
1.426547, -0.8776935, 1.769084, 1, 0, 0, 1, 1,
1.429012, -0.9752757, -0.08704888, 1, 0, 0, 1, 1,
1.430378, 1.13125, 0.6009277, 0, 0, 0, 1, 1,
1.432456, 0.9590893, -1.544907, 0, 0, 0, 1, 1,
1.471223, -0.2413515, 2.519234, 0, 0, 0, 1, 1,
1.484159, -0.5453802, -0.4198061, 0, 0, 0, 1, 1,
1.495771, -0.8067613, 0.9360809, 0, 0, 0, 1, 1,
1.49619, -0.6580133, 1.07601, 0, 0, 0, 1, 1,
1.503584, -0.1573735, 2.530542, 0, 0, 0, 1, 1,
1.508484, -0.3025763, 2.266519, 1, 1, 1, 1, 1,
1.513644, -0.4308247, 1.997413, 1, 1, 1, 1, 1,
1.514135, -0.37005, 4.357673, 1, 1, 1, 1, 1,
1.530088, 1.272098, -0.051133, 1, 1, 1, 1, 1,
1.531989, 0.5651311, 1.598755, 1, 1, 1, 1, 1,
1.565698, 1.726649, 0.7045786, 1, 1, 1, 1, 1,
1.588289, -0.8000894, 2.644068, 1, 1, 1, 1, 1,
1.612129, 0.06236448, 2.539234, 1, 1, 1, 1, 1,
1.635058, 0.3834521, 2.361282, 1, 1, 1, 1, 1,
1.636939, 0.7518237, 0.06756177, 1, 1, 1, 1, 1,
1.637847, 0.2439645, 1.608608, 1, 1, 1, 1, 1,
1.642152, -0.2743475, 2.554239, 1, 1, 1, 1, 1,
1.648813, 2.73466, 0.6303764, 1, 1, 1, 1, 1,
1.654804, -1.469396, 2.521536, 1, 1, 1, 1, 1,
1.670615, 3.020834, -0.4264903, 1, 1, 1, 1, 1,
1.681955, 0.03488598, 1.736065, 0, 0, 1, 1, 1,
1.697386, 0.586309, -1.765169, 1, 0, 0, 1, 1,
1.699479, -1.85495, 2.559781, 1, 0, 0, 1, 1,
1.701941, 0.8256954, 0.3934609, 1, 0, 0, 1, 1,
1.713982, -0.05771354, 1.242511, 1, 0, 0, 1, 1,
1.728706, -0.4206083, 3.900796, 1, 0, 0, 1, 1,
1.744828, 0.2145778, 2.187446, 0, 0, 0, 1, 1,
1.750089, 0.4414601, -0.3106104, 0, 0, 0, 1, 1,
1.762339, 0.8982145, 2.201783, 0, 0, 0, 1, 1,
1.795965, 0.5686603, 3.622434, 0, 0, 0, 1, 1,
1.796765, 1.116336, 2.636134, 0, 0, 0, 1, 1,
1.815706, -1.338831, 1.522641, 0, 0, 0, 1, 1,
1.826641, -0.5051169, 1.260928, 0, 0, 0, 1, 1,
1.841423, 0.4696152, 2.138102, 1, 1, 1, 1, 1,
1.894659, -1.224245, 3.186681, 1, 1, 1, 1, 1,
1.899899, 0.8397478, 1.417373, 1, 1, 1, 1, 1,
1.900653, 1.235152, 0.9778697, 1, 1, 1, 1, 1,
1.908697, 0.0350812, 2.591744, 1, 1, 1, 1, 1,
1.926511, -0.4044933, 1.15995, 1, 1, 1, 1, 1,
1.936286, 0.6582764, 1.0075, 1, 1, 1, 1, 1,
1.953336, 0.6149526, 1.698351, 1, 1, 1, 1, 1,
1.968481, 0.678494, -0.6387739, 1, 1, 1, 1, 1,
1.983599, -0.4045578, 3.062893, 1, 1, 1, 1, 1,
2.004552, -0.2596246, 1.605067, 1, 1, 1, 1, 1,
2.018808, -0.07034128, 3.020034, 1, 1, 1, 1, 1,
2.080556, 0.01565539, 1.431484, 1, 1, 1, 1, 1,
2.08632, 0.0002923511, 1.491387, 1, 1, 1, 1, 1,
2.096773, 1.608037, 0.3785605, 1, 1, 1, 1, 1,
2.106714, 0.3858156, 1.178707, 0, 0, 1, 1, 1,
2.142166, -0.1381104, -0.175697, 1, 0, 0, 1, 1,
2.174027, -1.119454, 2.388753, 1, 0, 0, 1, 1,
2.17552, -0.420107, -0.02542439, 1, 0, 0, 1, 1,
2.176023, -0.4009026, 2.018628, 1, 0, 0, 1, 1,
2.179623, 0.1638054, 3.132528, 1, 0, 0, 1, 1,
2.208081, 0.6421568, 1.336996, 0, 0, 0, 1, 1,
2.241451, 2.917459, -0.3387164, 0, 0, 0, 1, 1,
2.241518, -0.2344297, 1.577315, 0, 0, 0, 1, 1,
2.289719, 2.017619, 2.15234, 0, 0, 0, 1, 1,
2.298303, -0.5538017, 2.323601, 0, 0, 0, 1, 1,
2.302025, 0.8748531, 0.6450641, 0, 0, 0, 1, 1,
2.406268, 0.5962241, 0.7627836, 0, 0, 0, 1, 1,
2.418963, 0.8112806, 2.113046, 1, 1, 1, 1, 1,
2.434268, -0.879553, 0.132524, 1, 1, 1, 1, 1,
2.474407, -0.4053912, 1.340011, 1, 1, 1, 1, 1,
2.555889, 0.4319222, 0.6172011, 1, 1, 1, 1, 1,
2.625054, 0.6766319, 3.675406, 1, 1, 1, 1, 1,
2.732799, 0.2160992, 1.496431, 1, 1, 1, 1, 1,
3.286989, -0.5691094, 0.3736703, 1, 1, 1, 1, 1
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
var radius = 9.624528;
var distance = 33.80575;
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
mvMatrix.translate( 0.3009493, -0.003083229, -0.04606915 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.80575);
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
