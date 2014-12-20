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
-2.907906, -0.6576124, -3.767456, 1, 0, 0, 1,
-2.785041, 2.408537, -1.164714, 1, 0.007843138, 0, 1,
-2.782907, -0.2141375, 0.2289654, 1, 0.01176471, 0, 1,
-2.707441, 2.079744, -3.137855, 1, 0.01960784, 0, 1,
-2.6479, 0.6816536, -2.907391, 1, 0.02352941, 0, 1,
-2.557075, -0.3642829, -2.324249, 1, 0.03137255, 0, 1,
-2.505263, -0.6504075, -2.381357, 1, 0.03529412, 0, 1,
-2.455477, 1.530567, -0.5514359, 1, 0.04313726, 0, 1,
-2.433787, -0.04127274, -0.9871079, 1, 0.04705882, 0, 1,
-2.413711, 1.394063, -0.71224, 1, 0.05490196, 0, 1,
-2.400102, -0.8302161, -2.052242, 1, 0.05882353, 0, 1,
-2.38524, -0.5591518, 0.09682761, 1, 0.06666667, 0, 1,
-2.367679, 0.9472858, -0.3408445, 1, 0.07058824, 0, 1,
-2.324056, -0.5706288, -2.392841, 1, 0.07843138, 0, 1,
-2.317853, -0.8678606, -2.298167, 1, 0.08235294, 0, 1,
-2.274801, 0.1118537, -2.412634, 1, 0.09019608, 0, 1,
-2.259493, 0.03473494, -1.817845, 1, 0.09411765, 0, 1,
-2.256346, -0.02181033, -1.18854, 1, 0.1019608, 0, 1,
-2.223824, -0.9227009, -1.7376, 1, 0.1098039, 0, 1,
-2.187526, -1.357566, -2.772082, 1, 0.1137255, 0, 1,
-2.164172, 0.1108724, -1.503049, 1, 0.1215686, 0, 1,
-2.149408, -0.5322065, -1.514453, 1, 0.1254902, 0, 1,
-2.147885, -0.8588535, -2.447182, 1, 0.1333333, 0, 1,
-2.13076, -1.19309, -1.687619, 1, 0.1372549, 0, 1,
-2.098893, -1.145864, -1.038981, 1, 0.145098, 0, 1,
-2.024323, -0.4268923, -1.598137, 1, 0.1490196, 0, 1,
-2.014159, -0.1030548, -1.950305, 1, 0.1568628, 0, 1,
-1.995745, 0.7949846, -2.865537, 1, 0.1607843, 0, 1,
-1.967425, 0.7757778, -1.442388, 1, 0.1686275, 0, 1,
-1.958559, 0.332743, -1.219695, 1, 0.172549, 0, 1,
-1.947464, 0.9502925, -1.05436, 1, 0.1803922, 0, 1,
-1.947321, 0.07581249, -3.259394, 1, 0.1843137, 0, 1,
-1.909904, -1.36463, -3.136527, 1, 0.1921569, 0, 1,
-1.908059, -1.778351, -2.989843, 1, 0.1960784, 0, 1,
-1.90745, -1.533906, -3.071405, 1, 0.2039216, 0, 1,
-1.895604, 1.180287, -0.8621691, 1, 0.2117647, 0, 1,
-1.874063, 0.2564813, -1.376335, 1, 0.2156863, 0, 1,
-1.868732, -0.1269798, -0.5133427, 1, 0.2235294, 0, 1,
-1.844652, 1.295653, -0.7289196, 1, 0.227451, 0, 1,
-1.830608, 0.8068445, -2.116995, 1, 0.2352941, 0, 1,
-1.815693, -0.5139509, -2.715894, 1, 0.2392157, 0, 1,
-1.803634, 0.610842, -1.79321, 1, 0.2470588, 0, 1,
-1.802448, 0.1828234, -0.4086787, 1, 0.2509804, 0, 1,
-1.801214, 0.4952961, -1.058871, 1, 0.2588235, 0, 1,
-1.754717, -0.005963897, -0.8295242, 1, 0.2627451, 0, 1,
-1.752867, 0.456439, -0.2227579, 1, 0.2705882, 0, 1,
-1.747477, 1.135697, -1.235947, 1, 0.2745098, 0, 1,
-1.741673, 0.1579368, -1.277593, 1, 0.282353, 0, 1,
-1.73762, -1.130548, -2.935791, 1, 0.2862745, 0, 1,
-1.719719, 1.034995, -1.511974, 1, 0.2941177, 0, 1,
-1.711952, -1.363077, -3.146531, 1, 0.3019608, 0, 1,
-1.674032, 1.593864, 1.400126, 1, 0.3058824, 0, 1,
-1.669877, -0.8877351, -3.30496, 1, 0.3137255, 0, 1,
-1.666234, 0.0730537, -2.347126, 1, 0.3176471, 0, 1,
-1.648777, -1.53442, -3.930116, 1, 0.3254902, 0, 1,
-1.646861, -0.3452244, 0.1157011, 1, 0.3294118, 0, 1,
-1.644682, 0.6988993, -1.840844, 1, 0.3372549, 0, 1,
-1.618413, -0.1311975, -0.5730125, 1, 0.3411765, 0, 1,
-1.612854, 0.312442, -2.4154, 1, 0.3490196, 0, 1,
-1.611647, -2.523385, -3.146032, 1, 0.3529412, 0, 1,
-1.566943, 0.4555751, -0.7260611, 1, 0.3607843, 0, 1,
-1.551218, -1.282119, -3.271327, 1, 0.3647059, 0, 1,
-1.549822, 0.1781479, -1.413552, 1, 0.372549, 0, 1,
-1.537809, -0.7011886, -2.334203, 1, 0.3764706, 0, 1,
-1.537352, 0.5942897, -1.19715, 1, 0.3843137, 0, 1,
-1.529456, -0.06626301, -1.751815, 1, 0.3882353, 0, 1,
-1.523721, -0.5818409, -0.4945585, 1, 0.3960784, 0, 1,
-1.512527, -1.241943, -2.443073, 1, 0.4039216, 0, 1,
-1.509531, -1.235043, -1.160309, 1, 0.4078431, 0, 1,
-1.502083, -0.4526626, -1.894441, 1, 0.4156863, 0, 1,
-1.498015, -0.636988, -2.246387, 1, 0.4196078, 0, 1,
-1.487364, -0.3444971, -1.545067, 1, 0.427451, 0, 1,
-1.484264, 1.213508, 1.320611, 1, 0.4313726, 0, 1,
-1.480105, 1.128672, -0.6040369, 1, 0.4392157, 0, 1,
-1.474763, -1.77674, -4.456858, 1, 0.4431373, 0, 1,
-1.468078, -0.6723642, -2.184245, 1, 0.4509804, 0, 1,
-1.467019, -0.006792329, -2.267974, 1, 0.454902, 0, 1,
-1.462519, 0.431886, -0.5162997, 1, 0.4627451, 0, 1,
-1.460922, -0.3751406, -1.60239, 1, 0.4666667, 0, 1,
-1.44276, 1.653305, 0.08235402, 1, 0.4745098, 0, 1,
-1.441013, 0.04957072, -1.30187, 1, 0.4784314, 0, 1,
-1.439469, -1.375025, -3.13524, 1, 0.4862745, 0, 1,
-1.430612, -0.8097083, -2.226799, 1, 0.4901961, 0, 1,
-1.430017, -0.6924647, -2.528091, 1, 0.4980392, 0, 1,
-1.421908, -0.3584804, -1.682732, 1, 0.5058824, 0, 1,
-1.417445, -1.523911, -1.143764, 1, 0.509804, 0, 1,
-1.41423, 1.792706, 0.4675045, 1, 0.5176471, 0, 1,
-1.412255, 0.3517352, -2.728088, 1, 0.5215687, 0, 1,
-1.409462, -0.6512796, -1.390388, 1, 0.5294118, 0, 1,
-1.380265, 0.1784121, -2.177003, 1, 0.5333334, 0, 1,
-1.373764, -2.031068, -4.745563, 1, 0.5411765, 0, 1,
-1.365893, -0.5576119, -2.489425, 1, 0.5450981, 0, 1,
-1.363922, -1.217303, -1.943349, 1, 0.5529412, 0, 1,
-1.362728, -0.01160774, -2.780143, 1, 0.5568628, 0, 1,
-1.359733, 0.2091587, -1.714064, 1, 0.5647059, 0, 1,
-1.359483, -0.1212779, -0.7059368, 1, 0.5686275, 0, 1,
-1.35252, -1.095132, -1.911167, 1, 0.5764706, 0, 1,
-1.350262, 1.458841, 1.208055, 1, 0.5803922, 0, 1,
-1.346727, 0.721225, -1.603875, 1, 0.5882353, 0, 1,
-1.339472, -0.06658377, -2.294518, 1, 0.5921569, 0, 1,
-1.326793, -0.08704303, 1.10727, 1, 0.6, 0, 1,
-1.318575, 0.4190021, 0.1579323, 1, 0.6078432, 0, 1,
-1.312595, 2.175931, -0.1824084, 1, 0.6117647, 0, 1,
-1.312092, 0.7756783, -1.995181, 1, 0.6196079, 0, 1,
-1.311923, -0.4579226, -1.657666, 1, 0.6235294, 0, 1,
-1.302859, 0.3249733, -0.6293712, 1, 0.6313726, 0, 1,
-1.299221, -0.341711, -0.9595111, 1, 0.6352941, 0, 1,
-1.29363, 0.7453207, -1.423851, 1, 0.6431373, 0, 1,
-1.285257, -0.5302429, -3.097725, 1, 0.6470588, 0, 1,
-1.285152, -0.1437872, -1.85638, 1, 0.654902, 0, 1,
-1.283814, 0.8098044, -3.089568, 1, 0.6588235, 0, 1,
-1.282217, -0.4397088, -1.181476, 1, 0.6666667, 0, 1,
-1.279191, -1.062457, -2.226434, 1, 0.6705883, 0, 1,
-1.271342, 0.3295335, -1.762376, 1, 0.6784314, 0, 1,
-1.257813, 0.9580641, -2.102539, 1, 0.682353, 0, 1,
-1.254889, -0.1905633, -3.923076, 1, 0.6901961, 0, 1,
-1.253816, -0.4623596, -0.2909476, 1, 0.6941177, 0, 1,
-1.247091, 0.4601316, -2.325432, 1, 0.7019608, 0, 1,
-1.227698, 0.6705986, -1.374853, 1, 0.7098039, 0, 1,
-1.226464, 1.41528, -1.112327, 1, 0.7137255, 0, 1,
-1.217197, 0.7208915, 1.063329, 1, 0.7215686, 0, 1,
-1.216081, -0.4375066, -1.264442, 1, 0.7254902, 0, 1,
-1.212684, 0.578097, -0.9726886, 1, 0.7333333, 0, 1,
-1.208269, -0.3111439, -2.019362, 1, 0.7372549, 0, 1,
-1.205378, -0.2258216, -2.743413, 1, 0.7450981, 0, 1,
-1.193052, -0.3669408, -2.148467, 1, 0.7490196, 0, 1,
-1.187542, 1.121112, -1.727422, 1, 0.7568628, 0, 1,
-1.187344, 0.8730941, -1.514027, 1, 0.7607843, 0, 1,
-1.185283, 1.31614, -1.280241, 1, 0.7686275, 0, 1,
-1.183318, 0.2755423, -0.841453, 1, 0.772549, 0, 1,
-1.179525, 1.45185, -0.7674043, 1, 0.7803922, 0, 1,
-1.174058, -1.759567, -2.62935, 1, 0.7843137, 0, 1,
-1.173778, -0.3962498, -2.812119, 1, 0.7921569, 0, 1,
-1.172537, -0.6085297, -1.025937, 1, 0.7960784, 0, 1,
-1.166348, 0.6111263, -0.03019517, 1, 0.8039216, 0, 1,
-1.158862, 0.5110715, 0.292345, 1, 0.8117647, 0, 1,
-1.151415, -1.638479, -2.680114, 1, 0.8156863, 0, 1,
-1.146699, 0.7016096, 0.1556377, 1, 0.8235294, 0, 1,
-1.141421, 1.75499, 1.672812, 1, 0.827451, 0, 1,
-1.138689, 0.2297432, -0.2736676, 1, 0.8352941, 0, 1,
-1.131013, 1.289642, -0.747444, 1, 0.8392157, 0, 1,
-1.128917, 0.6694614, -2.257853, 1, 0.8470588, 0, 1,
-1.122524, 1.413068, -0.7838027, 1, 0.8509804, 0, 1,
-1.116794, -1.571905, -3.060807, 1, 0.8588235, 0, 1,
-1.109696, 0.3828545, -1.126614, 1, 0.8627451, 0, 1,
-1.097115, 1.121802, -0.8740981, 1, 0.8705882, 0, 1,
-1.074081, 0.4350419, -0.5854609, 1, 0.8745098, 0, 1,
-1.069148, 0.1384019, -0.777184, 1, 0.8823529, 0, 1,
-1.067804, 0.1095314, -0.2782159, 1, 0.8862745, 0, 1,
-1.066978, 0.3897343, -1.500989, 1, 0.8941177, 0, 1,
-1.066144, -0.7612851, -2.55908, 1, 0.8980392, 0, 1,
-1.065281, 0.1861037, 0.2118539, 1, 0.9058824, 0, 1,
-1.06148, -0.08960395, -2.691103, 1, 0.9137255, 0, 1,
-1.053635, 1.256098, 0.8696976, 1, 0.9176471, 0, 1,
-1.050887, 0.2069956, -2.168355, 1, 0.9254902, 0, 1,
-1.035984, -0.1577617, -2.085009, 1, 0.9294118, 0, 1,
-1.025499, 0.7411737, -0.9227704, 1, 0.9372549, 0, 1,
-1.024381, -0.3185936, -2.066822, 1, 0.9411765, 0, 1,
-1.0222, -0.08369238, -1.269311, 1, 0.9490196, 0, 1,
-1.017121, 0.7724007, -2.350082, 1, 0.9529412, 0, 1,
-1.015393, -0.4998009, -2.241214, 1, 0.9607843, 0, 1,
-1.011299, 0.3968228, -1.329487, 1, 0.9647059, 0, 1,
-1.008274, -0.7024172, -0.6978982, 1, 0.972549, 0, 1,
-1.008056, -0.3061646, -1.473799, 1, 0.9764706, 0, 1,
-1.003892, -0.5033892, -3.251902, 1, 0.9843137, 0, 1,
-0.9996396, -0.1557645, -2.172122, 1, 0.9882353, 0, 1,
-0.9779734, 0.08275823, -0.9220587, 1, 0.9960784, 0, 1,
-0.9776084, 0.09546652, 1.781271, 0.9960784, 1, 0, 1,
-0.9671534, -0.9442843, -3.75055, 0.9921569, 1, 0, 1,
-0.9669819, -1.085125, -1.181737, 0.9843137, 1, 0, 1,
-0.9622411, -0.6966895, -3.799035, 0.9803922, 1, 0, 1,
-0.9595009, -0.7730213, -1.345986, 0.972549, 1, 0, 1,
-0.959245, -0.1506578, -1.58524, 0.9686275, 1, 0, 1,
-0.9579473, 3.025219, -0.06489491, 0.9607843, 1, 0, 1,
-0.9502346, -0.02387281, -0.03025107, 0.9568627, 1, 0, 1,
-0.948962, 1.440973, -0.8162794, 0.9490196, 1, 0, 1,
-0.9476797, 1.398446, -0.1367563, 0.945098, 1, 0, 1,
-0.9474565, -1.43319, -2.734359, 0.9372549, 1, 0, 1,
-0.9439561, -0.2554484, -2.513402, 0.9333333, 1, 0, 1,
-0.9353692, 0.238441, -1.877606, 0.9254902, 1, 0, 1,
-0.9331869, -1.86307, -3.213425, 0.9215686, 1, 0, 1,
-0.9313269, -0.2840899, -1.017007, 0.9137255, 1, 0, 1,
-0.9277062, -0.002979649, -3.078068, 0.9098039, 1, 0, 1,
-0.9267511, 0.57069, 0.1487417, 0.9019608, 1, 0, 1,
-0.9165267, 1.63605, 0.4858393, 0.8941177, 1, 0, 1,
-0.9153984, 0.8577383, -0.6342294, 0.8901961, 1, 0, 1,
-0.9012431, -1.717542, -1.993612, 0.8823529, 1, 0, 1,
-0.8922777, 1.651083, -1.160996, 0.8784314, 1, 0, 1,
-0.8906992, 1.474752, -0.08208207, 0.8705882, 1, 0, 1,
-0.8891957, 1.947973, -0.06499809, 0.8666667, 1, 0, 1,
-0.8839607, -1.6868, -2.118961, 0.8588235, 1, 0, 1,
-0.882112, 1.450842, -1.129275, 0.854902, 1, 0, 1,
-0.8793984, -1.364131, -1.627654, 0.8470588, 1, 0, 1,
-0.877716, -0.9837434, -3.749502, 0.8431373, 1, 0, 1,
-0.8652807, 1.14855, 0.1779242, 0.8352941, 1, 0, 1,
-0.8490665, 0.5704973, -0.4628605, 0.8313726, 1, 0, 1,
-0.8402812, -1.45505, -3.133467, 0.8235294, 1, 0, 1,
-0.8387972, 1.794905, -1.488365, 0.8196079, 1, 0, 1,
-0.8374796, -1.034726, -3.599436, 0.8117647, 1, 0, 1,
-0.830504, -0.7961522, -3.314878, 0.8078431, 1, 0, 1,
-0.8280284, -0.0225756, -2.125157, 0.8, 1, 0, 1,
-0.8267437, 1.39369, -0.7847722, 0.7921569, 1, 0, 1,
-0.8260932, -0.9402502, -1.581848, 0.7882353, 1, 0, 1,
-0.823147, -1.04581, -3.844244, 0.7803922, 1, 0, 1,
-0.8189625, 0.262048, -2.668878, 0.7764706, 1, 0, 1,
-0.8127985, -0.6908659, -1.902797, 0.7686275, 1, 0, 1,
-0.8107654, 1.299813, -2.671206, 0.7647059, 1, 0, 1,
-0.8083996, 1.024201, -1.805375, 0.7568628, 1, 0, 1,
-0.8072038, 0.2896978, 0.7082645, 0.7529412, 1, 0, 1,
-0.8071266, -1.066562, -3.302331, 0.7450981, 1, 0, 1,
-0.8070121, -0.4254515, -1.332526, 0.7411765, 1, 0, 1,
-0.8063807, 1.907758, -0.08649278, 0.7333333, 1, 0, 1,
-0.8054901, 0.9303627, 0.7262611, 0.7294118, 1, 0, 1,
-0.8032909, 0.5103604, -2.016791, 0.7215686, 1, 0, 1,
-0.8024167, -0.4974654, -1.383469, 0.7176471, 1, 0, 1,
-0.7975957, 1.486932, -0.8387788, 0.7098039, 1, 0, 1,
-0.7910309, 1.102181, -1.115646, 0.7058824, 1, 0, 1,
-0.7907146, -0.9347336, -4.138171, 0.6980392, 1, 0, 1,
-0.7905273, -1.333063, -3.337022, 0.6901961, 1, 0, 1,
-0.7887506, 1.726207, -1.057185, 0.6862745, 1, 0, 1,
-0.787666, 1.102202, -1.965139, 0.6784314, 1, 0, 1,
-0.7870584, -1.831785, -2.831897, 0.6745098, 1, 0, 1,
-0.7866005, 0.4043354, -1.8, 0.6666667, 1, 0, 1,
-0.7821165, 0.9280616, -0.8755854, 0.6627451, 1, 0, 1,
-0.779475, 2.21361, -0.9564391, 0.654902, 1, 0, 1,
-0.7674532, -0.641475, -2.920789, 0.6509804, 1, 0, 1,
-0.7659438, 1.09857, 0.3959011, 0.6431373, 1, 0, 1,
-0.7612816, 2.315751, -0.1358212, 0.6392157, 1, 0, 1,
-0.7604369, 0.8739864, -2.037628, 0.6313726, 1, 0, 1,
-0.7582945, -0.3784736, -1.489004, 0.627451, 1, 0, 1,
-0.7582345, -0.6120971, -1.34853, 0.6196079, 1, 0, 1,
-0.7579422, -0.6605984, -2.878006, 0.6156863, 1, 0, 1,
-0.7526979, 0.323567, -0.902095, 0.6078432, 1, 0, 1,
-0.7487191, 0.5968757, -0.2419578, 0.6039216, 1, 0, 1,
-0.7482334, 1.607981, -0.7769542, 0.5960785, 1, 0, 1,
-0.7313684, 0.254045, -2.28408, 0.5882353, 1, 0, 1,
-0.7313311, -0.1045781, -1.278822, 0.5843138, 1, 0, 1,
-0.7281293, -0.7187481, -1.001758, 0.5764706, 1, 0, 1,
-0.726346, 1.188258, 0.06448527, 0.572549, 1, 0, 1,
-0.7191675, -0.4327364, -1.220394, 0.5647059, 1, 0, 1,
-0.7153876, 0.2736735, -1.539157, 0.5607843, 1, 0, 1,
-0.7139332, 0.8205414, 0.3658153, 0.5529412, 1, 0, 1,
-0.7132047, -0.8824184, -2.977446, 0.5490196, 1, 0, 1,
-0.7123491, -0.304621, -2.202724, 0.5411765, 1, 0, 1,
-0.7120245, -0.8215896, -1.842815, 0.5372549, 1, 0, 1,
-0.7041026, 1.985822, -1.89353, 0.5294118, 1, 0, 1,
-0.7037434, 1.97589, 0.2048061, 0.5254902, 1, 0, 1,
-0.6983001, -0.3672136, -2.621789, 0.5176471, 1, 0, 1,
-0.6950707, 0.8529206, -0.6892687, 0.5137255, 1, 0, 1,
-0.6836951, -0.9686453, -2.789477, 0.5058824, 1, 0, 1,
-0.6830014, -0.6367254, -1.062951, 0.5019608, 1, 0, 1,
-0.6730701, -0.2492249, -1.205153, 0.4941176, 1, 0, 1,
-0.6690015, 0.683762, 1.228301, 0.4862745, 1, 0, 1,
-0.6664627, 0.6250401, -0.003867288, 0.4823529, 1, 0, 1,
-0.6636929, -0.5665914, -3.255913, 0.4745098, 1, 0, 1,
-0.6566572, 0.6309663, -0.1519542, 0.4705882, 1, 0, 1,
-0.6549644, -0.6630498, -2.599442, 0.4627451, 1, 0, 1,
-0.6519045, -1.036499, -2.718363, 0.4588235, 1, 0, 1,
-0.6488272, -2.142639, -2.824449, 0.4509804, 1, 0, 1,
-0.6465189, -1.447616, -2.657155, 0.4470588, 1, 0, 1,
-0.6451088, 0.5252982, 0.7127396, 0.4392157, 1, 0, 1,
-0.642751, 0.3305426, -1.594637, 0.4352941, 1, 0, 1,
-0.6394721, 0.539993, -1.586824, 0.427451, 1, 0, 1,
-0.6391146, 0.4180204, -2.394862, 0.4235294, 1, 0, 1,
-0.6377746, 0.6987585, -0.5812334, 0.4156863, 1, 0, 1,
-0.6335152, 0.4993652, -1.845109, 0.4117647, 1, 0, 1,
-0.6330991, 0.1447243, -0.2491977, 0.4039216, 1, 0, 1,
-0.6319721, -0.0312079, -1.500659, 0.3960784, 1, 0, 1,
-0.6285219, -1.460596, -3.031945, 0.3921569, 1, 0, 1,
-0.6171582, 0.4042426, -1.388402, 0.3843137, 1, 0, 1,
-0.6168731, -2.569109, -5.590622, 0.3803922, 1, 0, 1,
-0.6162366, 1.479857, 0.9392676, 0.372549, 1, 0, 1,
-0.6074439, -0.1087498, -1.067826, 0.3686275, 1, 0, 1,
-0.6062981, 0.9305317, -1.266343, 0.3607843, 1, 0, 1,
-0.6015509, -1.266487, -1.995636, 0.3568628, 1, 0, 1,
-0.6011543, -0.8860387, -4.119094, 0.3490196, 1, 0, 1,
-0.5987054, -0.09536329, -0.7371979, 0.345098, 1, 0, 1,
-0.5912374, 0.1829914, -0.9044558, 0.3372549, 1, 0, 1,
-0.5769782, 0.1469867, -1.628712, 0.3333333, 1, 0, 1,
-0.574653, -0.2026118, -1.55832, 0.3254902, 1, 0, 1,
-0.5691407, 2.231852, -1.94832, 0.3215686, 1, 0, 1,
-0.5688922, 0.2447769, -0.3472656, 0.3137255, 1, 0, 1,
-0.568619, -2.84047, -3.382505, 0.3098039, 1, 0, 1,
-0.558975, -0.3406842, -0.2739301, 0.3019608, 1, 0, 1,
-0.5588226, 0.8452214, 1.081793, 0.2941177, 1, 0, 1,
-0.5584782, -1.418864, -1.568887, 0.2901961, 1, 0, 1,
-0.5568282, -1.541361, -1.522219, 0.282353, 1, 0, 1,
-0.5543052, 0.3847874, -1.480382, 0.2784314, 1, 0, 1,
-0.553714, 1.631573, -3.159698, 0.2705882, 1, 0, 1,
-0.5502074, -1.075914, -2.486473, 0.2666667, 1, 0, 1,
-0.5390542, 0.852925, -1.272114, 0.2588235, 1, 0, 1,
-0.5361446, 0.8897295, 0.02363625, 0.254902, 1, 0, 1,
-0.5355411, -0.4396563, -0.7359866, 0.2470588, 1, 0, 1,
-0.5323939, -0.3098496, -2.299428, 0.2431373, 1, 0, 1,
-0.5323141, 0.09118268, -0.4345652, 0.2352941, 1, 0, 1,
-0.5229898, 0.1992334, -1.044435, 0.2313726, 1, 0, 1,
-0.5215588, -0.3459582, -3.068142, 0.2235294, 1, 0, 1,
-0.5178124, -1.225906, -1.317831, 0.2196078, 1, 0, 1,
-0.5100716, -0.6846647, -2.689484, 0.2117647, 1, 0, 1,
-0.5045916, -0.9409627, -0.6470242, 0.2078431, 1, 0, 1,
-0.5012357, 0.6526681, -1.81322, 0.2, 1, 0, 1,
-0.494405, 0.5238845, 0.6611072, 0.1921569, 1, 0, 1,
-0.4932549, 0.2713644, -1.343841, 0.1882353, 1, 0, 1,
-0.4924573, 1.938743, 1.487006, 0.1803922, 1, 0, 1,
-0.4921152, -1.137285, -2.587035, 0.1764706, 1, 0, 1,
-0.4860902, 1.98594, 2.086157, 0.1686275, 1, 0, 1,
-0.4847912, -0.8972555, -2.63669, 0.1647059, 1, 0, 1,
-0.4813899, 1.082307, 0.01352277, 0.1568628, 1, 0, 1,
-0.4703996, 0.05293687, -1.502112, 0.1529412, 1, 0, 1,
-0.4703867, -1.214723, -1.538602, 0.145098, 1, 0, 1,
-0.469824, -0.8767179, -2.877059, 0.1411765, 1, 0, 1,
-0.4679552, -0.664396, -2.236341, 0.1333333, 1, 0, 1,
-0.4668736, 0.2489665, -0.5881582, 0.1294118, 1, 0, 1,
-0.4661897, -0.1094355, -2.28696, 0.1215686, 1, 0, 1,
-0.4653877, 0.7959272, 0.02418356, 0.1176471, 1, 0, 1,
-0.4634348, -0.2444402, -3.238532, 0.1098039, 1, 0, 1,
-0.4631949, -0.7957101, -3.498667, 0.1058824, 1, 0, 1,
-0.4621586, 0.1376932, -1.379434, 0.09803922, 1, 0, 1,
-0.460891, 1.248393, 0.7698909, 0.09019608, 1, 0, 1,
-0.457987, 1.356225, 1.694348, 0.08627451, 1, 0, 1,
-0.4535645, -1.061458, -1.164037, 0.07843138, 1, 0, 1,
-0.452703, -1.373617, -2.084533, 0.07450981, 1, 0, 1,
-0.4463139, -0.1244237, -1.99253, 0.06666667, 1, 0, 1,
-0.4446212, 0.2706575, -2.039098, 0.0627451, 1, 0, 1,
-0.4433844, 1.240663, 0.4821869, 0.05490196, 1, 0, 1,
-0.4421783, -0.5628812, -2.706224, 0.05098039, 1, 0, 1,
-0.4353874, 0.3647348, -0.6890063, 0.04313726, 1, 0, 1,
-0.4331161, 0.06344145, -0.8856358, 0.03921569, 1, 0, 1,
-0.4318698, 0.558745, 0.08085667, 0.03137255, 1, 0, 1,
-0.4274963, -2.186068, -1.723271, 0.02745098, 1, 0, 1,
-0.4255762, -1.340699, -2.994939, 0.01960784, 1, 0, 1,
-0.4242704, 2.701462, 0.8026953, 0.01568628, 1, 0, 1,
-0.4201406, 0.0108038, -0.5121871, 0.007843138, 1, 0, 1,
-0.4201104, -0.6530566, -2.759706, 0.003921569, 1, 0, 1,
-0.4182569, 0.8014444, -0.6781306, 0, 1, 0.003921569, 1,
-0.4179364, 0.9832848, 2.308595, 0, 1, 0.01176471, 1,
-0.4146084, 0.2390692, -1.090285, 0, 1, 0.01568628, 1,
-0.4109841, -1.819982, -2.203499, 0, 1, 0.02352941, 1,
-0.4076512, -0.6392756, -1.051737, 0, 1, 0.02745098, 1,
-0.4069759, 1.197352, 0.05962386, 0, 1, 0.03529412, 1,
-0.4055564, 0.3028676, -0.9134051, 0, 1, 0.03921569, 1,
-0.4030887, 1.921722, -0.5474757, 0, 1, 0.04705882, 1,
-0.4029625, -0.07779285, -1.771455, 0, 1, 0.05098039, 1,
-0.3973893, -0.5861409, -3.17728, 0, 1, 0.05882353, 1,
-0.3943521, -1.081479, -3.451664, 0, 1, 0.0627451, 1,
-0.3867868, -2.036497, -2.617356, 0, 1, 0.07058824, 1,
-0.3859983, 1.327511, -0.06275719, 0, 1, 0.07450981, 1,
-0.3857763, 0.5568002, 0.7954954, 0, 1, 0.08235294, 1,
-0.3831878, 1.366515, -0.7795818, 0, 1, 0.08627451, 1,
-0.38002, -0.4860578, -3.807869, 0, 1, 0.09411765, 1,
-0.3791988, 0.240963, -0.6911995, 0, 1, 0.1019608, 1,
-0.3780276, 0.2436212, -1.078369, 0, 1, 0.1058824, 1,
-0.3743168, 0.3914048, 1.839699, 0, 1, 0.1137255, 1,
-0.3740536, -0.0212645, -1.449478, 0, 1, 0.1176471, 1,
-0.373326, 0.2035401, -0.8458308, 0, 1, 0.1254902, 1,
-0.3722131, -0.5676507, -2.240939, 0, 1, 0.1294118, 1,
-0.3720284, -1.193591, -0.8078922, 0, 1, 0.1372549, 1,
-0.3709872, 0.467726, 0.6281887, 0, 1, 0.1411765, 1,
-0.3648549, -0.08621422, -2.531554, 0, 1, 0.1490196, 1,
-0.364246, 0.2129946, -0.8871329, 0, 1, 0.1529412, 1,
-0.3627804, -0.7469697, -1.934242, 0, 1, 0.1607843, 1,
-0.359195, -0.6903863, -1.179422, 0, 1, 0.1647059, 1,
-0.3584132, -0.3808939, -1.166846, 0, 1, 0.172549, 1,
-0.3559507, -1.30652, -3.429859, 0, 1, 0.1764706, 1,
-0.3548271, -1.046997, -2.278165, 0, 1, 0.1843137, 1,
-0.3544113, 0.5087521, -1.759967, 0, 1, 0.1882353, 1,
-0.3540765, 0.08983792, -2.296468, 0, 1, 0.1960784, 1,
-0.3536836, -0.5572435, -3.325657, 0, 1, 0.2039216, 1,
-0.3521606, 1.235916, -1.063202, 0, 1, 0.2078431, 1,
-0.3514538, -1.075088, -2.420635, 0, 1, 0.2156863, 1,
-0.350525, 2.01206, 0.5390951, 0, 1, 0.2196078, 1,
-0.3447685, -1.366993, -2.269446, 0, 1, 0.227451, 1,
-0.340666, -2.085021, -1.645356, 0, 1, 0.2313726, 1,
-0.3372681, -0.6949392, -2.761713, 0, 1, 0.2392157, 1,
-0.3297159, 2.38675, -0.6879305, 0, 1, 0.2431373, 1,
-0.3297121, 0.1685989, -1.534813, 0, 1, 0.2509804, 1,
-0.3216373, 0.2260741, -0.6918099, 0, 1, 0.254902, 1,
-0.3175659, -1.806924, -2.960896, 0, 1, 0.2627451, 1,
-0.3174367, -1.175416, -2.316291, 0, 1, 0.2666667, 1,
-0.3172364, -0.4041189, -1.484347, 0, 1, 0.2745098, 1,
-0.3162071, 0.6318955, -2.465672, 0, 1, 0.2784314, 1,
-0.3105217, 0.6604612, -1.902326, 0, 1, 0.2862745, 1,
-0.3089057, 0.8102286, -1.563428, 0, 1, 0.2901961, 1,
-0.3053761, -2.078223, -3.974208, 0, 1, 0.2980392, 1,
-0.3021606, 0.1277158, 0.3424226, 0, 1, 0.3058824, 1,
-0.3020807, -0.1501733, -3.063452, 0, 1, 0.3098039, 1,
-0.3010874, -1.76958, -4.04989, 0, 1, 0.3176471, 1,
-0.3002645, -2.03014, -2.724245, 0, 1, 0.3215686, 1,
-0.2905185, -1.061373, -1.881825, 0, 1, 0.3294118, 1,
-0.2900302, -1.414488, -2.906817, 0, 1, 0.3333333, 1,
-0.2897221, 1.62976, -0.7532222, 0, 1, 0.3411765, 1,
-0.2888968, 0.5079008, -0.7370283, 0, 1, 0.345098, 1,
-0.2865519, 1.695402, -2.780342, 0, 1, 0.3529412, 1,
-0.2806737, 0.4138674, -1.871531, 0, 1, 0.3568628, 1,
-0.2784863, -0.3553595, -0.8285166, 0, 1, 0.3647059, 1,
-0.2781089, 1.437992, 1.317242, 0, 1, 0.3686275, 1,
-0.2775659, -0.7925207, -3.343667, 0, 1, 0.3764706, 1,
-0.2765974, 0.3772061, 0.4993811, 0, 1, 0.3803922, 1,
-0.2763764, 0.9834186, 0.1237481, 0, 1, 0.3882353, 1,
-0.2757331, -0.4882607, -3.499579, 0, 1, 0.3921569, 1,
-0.2749533, 0.09544744, -1.796374, 0, 1, 0.4, 1,
-0.2716084, -1.823833, -3.302511, 0, 1, 0.4078431, 1,
-0.268297, 0.3606939, 1.004214, 0, 1, 0.4117647, 1,
-0.2657433, 0.5933774, -0.3144874, 0, 1, 0.4196078, 1,
-0.2623104, -0.25733, -2.896455, 0, 1, 0.4235294, 1,
-0.2566377, -0.7414796, -2.672132, 0, 1, 0.4313726, 1,
-0.2566248, 0.4290832, -0.4768589, 0, 1, 0.4352941, 1,
-0.2517189, 0.04302065, -1.568252, 0, 1, 0.4431373, 1,
-0.2497679, -1.267737, -2.523127, 0, 1, 0.4470588, 1,
-0.2480695, -1.415765, -2.839665, 0, 1, 0.454902, 1,
-0.2456266, 0.6760467, -1.448754, 0, 1, 0.4588235, 1,
-0.2435973, 0.7299425, -0.6957682, 0, 1, 0.4666667, 1,
-0.2418655, -0.3745831, -1.642769, 0, 1, 0.4705882, 1,
-0.2384137, -0.1602073, -3.306439, 0, 1, 0.4784314, 1,
-0.2373027, -1.484757, -3.395094, 0, 1, 0.4823529, 1,
-0.2334235, 0.3993093, -1.157568, 0, 1, 0.4901961, 1,
-0.2333038, -0.8524212, -2.253436, 0, 1, 0.4941176, 1,
-0.2298575, 0.6638974, -0.1291051, 0, 1, 0.5019608, 1,
-0.2261218, 0.5388143, -2.085066, 0, 1, 0.509804, 1,
-0.2251365, 0.4014719, 0.6666079, 0, 1, 0.5137255, 1,
-0.2215782, 0.5346161, -1.097298, 0, 1, 0.5215687, 1,
-0.2209686, -0.9888862, -4.648299, 0, 1, 0.5254902, 1,
-0.2159079, 0.01561641, -0.4573045, 0, 1, 0.5333334, 1,
-0.2141592, 2.218338, -1.213985, 0, 1, 0.5372549, 1,
-0.2124288, -0.1441957, -2.54847, 0, 1, 0.5450981, 1,
-0.2076992, 0.2311047, -0.6042244, 0, 1, 0.5490196, 1,
-0.2047081, 1.298318, -0.7804954, 0, 1, 0.5568628, 1,
-0.1975791, -0.0286717, -2.369695, 0, 1, 0.5607843, 1,
-0.1965139, 0.6828723, -0.138562, 0, 1, 0.5686275, 1,
-0.1944962, 0.1576667, -2.085043, 0, 1, 0.572549, 1,
-0.1918469, 1.385853, -0.07126024, 0, 1, 0.5803922, 1,
-0.1886441, -1.497359, -5.094146, 0, 1, 0.5843138, 1,
-0.1878415, 0.01949721, -1.926631, 0, 1, 0.5921569, 1,
-0.185987, 1.578539, -0.5743526, 0, 1, 0.5960785, 1,
-0.1841545, -0.4016587, -4.877937, 0, 1, 0.6039216, 1,
-0.1805767, 0.2894196, -1.533225, 0, 1, 0.6117647, 1,
-0.1800627, -0.3849153, -1.194781, 0, 1, 0.6156863, 1,
-0.1757813, 0.8899708, -0.274704, 0, 1, 0.6235294, 1,
-0.1750189, 1.063886, -0.5237612, 0, 1, 0.627451, 1,
-0.1738192, -0.1691053, -2.582938, 0, 1, 0.6352941, 1,
-0.1726663, -0.3164748, -0.4551021, 0, 1, 0.6392157, 1,
-0.1686633, -1.118444, -4.572714, 0, 1, 0.6470588, 1,
-0.1655835, 1.14541, -2.172812, 0, 1, 0.6509804, 1,
-0.1649482, -0.5096921, -4.558595, 0, 1, 0.6588235, 1,
-0.1617887, 0.1074603, -1.028814, 0, 1, 0.6627451, 1,
-0.1613861, -0.7740134, -3.230071, 0, 1, 0.6705883, 1,
-0.1610893, 0.7649696, -0.7359417, 0, 1, 0.6745098, 1,
-0.1604291, -1.354969, -1.88137, 0, 1, 0.682353, 1,
-0.1602085, 0.03990717, -0.07749496, 0, 1, 0.6862745, 1,
-0.1538045, -0.2102505, -3.900504, 0, 1, 0.6941177, 1,
-0.1524166, -0.4673111, -3.576598, 0, 1, 0.7019608, 1,
-0.151136, -1.152849, -3.247965, 0, 1, 0.7058824, 1,
-0.1455975, 1.17872, -0.02094249, 0, 1, 0.7137255, 1,
-0.1451337, 1.44436, 0.4551092, 0, 1, 0.7176471, 1,
-0.1443186, 1.047676, -0.1074276, 0, 1, 0.7254902, 1,
-0.1412961, 0.6267269, -1.090121, 0, 1, 0.7294118, 1,
-0.1362966, 1.370516, 0.527909, 0, 1, 0.7372549, 1,
-0.1349148, 0.2584502, -0.4518132, 0, 1, 0.7411765, 1,
-0.1340485, 0.3731487, -1.312864, 0, 1, 0.7490196, 1,
-0.1276789, 1.657867, 0.01581237, 0, 1, 0.7529412, 1,
-0.1201095, 0.7394661, 0.7668752, 0, 1, 0.7607843, 1,
-0.1188868, 1.126981, -0.2105819, 0, 1, 0.7647059, 1,
-0.1132165, -0.3053043, -3.907798, 0, 1, 0.772549, 1,
-0.1075486, 0.3946033, -0.3854152, 0, 1, 0.7764706, 1,
-0.1032682, -0.4569608, -4.246425, 0, 1, 0.7843137, 1,
-0.09876514, 1.056102, -1.721916, 0, 1, 0.7882353, 1,
-0.09742331, -0.3809118, -3.907364, 0, 1, 0.7960784, 1,
-0.09371188, 0.8789145, 0.4472251, 0, 1, 0.8039216, 1,
-0.09223173, -0.7485676, -2.964583, 0, 1, 0.8078431, 1,
-0.08731591, 0.2165677, -0.7710816, 0, 1, 0.8156863, 1,
-0.08654157, 0.08264916, -1.647799, 0, 1, 0.8196079, 1,
-0.0836954, 0.563835, 0.3830291, 0, 1, 0.827451, 1,
-0.07810669, 0.2995226, 0.006602271, 0, 1, 0.8313726, 1,
-0.0777278, -0.1180073, -0.4525461, 0, 1, 0.8392157, 1,
-0.07616937, 1.306984, 0.439819, 0, 1, 0.8431373, 1,
-0.07453797, 0.04115942, -1.838792, 0, 1, 0.8509804, 1,
-0.07428912, 0.5677115, -1.082156, 0, 1, 0.854902, 1,
-0.07258973, -1.347178, -2.671268, 0, 1, 0.8627451, 1,
-0.06812775, -1.11191, -2.199143, 0, 1, 0.8666667, 1,
-0.06626111, -0.2557204, -2.140231, 0, 1, 0.8745098, 1,
-0.06603065, 0.1724674, -0.832262, 0, 1, 0.8784314, 1,
-0.06505687, -0.7737286, -2.053842, 0, 1, 0.8862745, 1,
-0.06354004, -0.01237957, -1.554582, 0, 1, 0.8901961, 1,
-0.05483937, 1.220505, -0.5280566, 0, 1, 0.8980392, 1,
-0.05368048, -1.56347, -2.878571, 0, 1, 0.9058824, 1,
-0.05040914, -0.5884015, -3.160005, 0, 1, 0.9098039, 1,
-0.04602455, 1.416417, -1.579822, 0, 1, 0.9176471, 1,
-0.04327344, -0.1307898, -2.358657, 0, 1, 0.9215686, 1,
-0.03999913, -0.8384609, -1.199023, 0, 1, 0.9294118, 1,
-0.03557514, -1.263221, -3.060329, 0, 1, 0.9333333, 1,
-0.03467154, -0.1362179, -3.157234, 0, 1, 0.9411765, 1,
-0.0339564, -0.3450561, -2.088903, 0, 1, 0.945098, 1,
-0.03383049, 1.15303, -1.278326, 0, 1, 0.9529412, 1,
-0.03352479, 0.3485166, 2.094327, 0, 1, 0.9568627, 1,
-0.03297408, 0.7857794, 0.3986823, 0, 1, 0.9647059, 1,
-0.02108444, -2.276233, -3.37579, 0, 1, 0.9686275, 1,
-0.01920835, 1.803755, -0.0484396, 0, 1, 0.9764706, 1,
-0.01874299, 1.164714, 2.01213, 0, 1, 0.9803922, 1,
-0.01790005, -2.218666, -2.692152, 0, 1, 0.9882353, 1,
-0.007332501, -0.8232773, -2.5976, 0, 1, 0.9921569, 1,
-0.003784981, 0.6338008, 0.8643706, 0, 1, 1, 1,
-0.001884772, 0.6417531, 0.3400382, 0, 0.9921569, 1, 1,
-0.001464794, -0.1985425, -3.231254, 0, 0.9882353, 1, 1,
-0.0006122824, -0.5580153, -2.010915, 0, 0.9803922, 1, 1,
-0.0005717099, 0.4676595, -0.1421628, 0, 0.9764706, 1, 1,
1.653096e-05, 0.3259946, -0.7389046, 0, 0.9686275, 1, 1,
0.002420543, -1.459135, 2.918617, 0, 0.9647059, 1, 1,
0.01110329, 0.3585093, -1.454441, 0, 0.9568627, 1, 1,
0.01187507, -0.8331572, 1.816863, 0, 0.9529412, 1, 1,
0.01286175, -0.9968596, 3.320578, 0, 0.945098, 1, 1,
0.01374629, 0.5883309, -1.055825, 0, 0.9411765, 1, 1,
0.01548248, -0.1463924, 3.68214, 0, 0.9333333, 1, 1,
0.01683547, 0.4024591, -0.3636272, 0, 0.9294118, 1, 1,
0.02120739, -1.090553, 0.6737213, 0, 0.9215686, 1, 1,
0.02464066, 0.5925007, -1.457333, 0, 0.9176471, 1, 1,
0.02868175, 0.4771484, -0.1353144, 0, 0.9098039, 1, 1,
0.0309957, 0.3899878, -0.6080446, 0, 0.9058824, 1, 1,
0.03417258, -0.6947412, 3.650632, 0, 0.8980392, 1, 1,
0.03631195, 0.3460214, 0.5038164, 0, 0.8901961, 1, 1,
0.03677923, -0.5922933, 4.40735, 0, 0.8862745, 1, 1,
0.03890108, -0.7632971, 4.478346, 0, 0.8784314, 1, 1,
0.04031393, 1.160706, 0.2715129, 0, 0.8745098, 1, 1,
0.04237703, 2.006189, 0.1145713, 0, 0.8666667, 1, 1,
0.04611138, 0.3651991, 0.03651491, 0, 0.8627451, 1, 1,
0.0469069, 1.369595, -0.9103194, 0, 0.854902, 1, 1,
0.04814933, 0.001844852, -0.711235, 0, 0.8509804, 1, 1,
0.0503327, 0.07883177, 0.9529893, 0, 0.8431373, 1, 1,
0.05201406, 1.069994, 0.09779105, 0, 0.8392157, 1, 1,
0.05322383, 1.18571, -0.7478389, 0, 0.8313726, 1, 1,
0.05545501, -1.169669, 4.278953, 0, 0.827451, 1, 1,
0.05677187, 1.787157, 1.19121, 0, 0.8196079, 1, 1,
0.05834863, 0.3082424, 0.2338325, 0, 0.8156863, 1, 1,
0.0620961, 0.6709024, 1.164184, 0, 0.8078431, 1, 1,
0.06520444, 0.3842716, 1.596901, 0, 0.8039216, 1, 1,
0.06646125, -0.9520273, 3.740563, 0, 0.7960784, 1, 1,
0.06721984, 0.4790923, -0.9154755, 0, 0.7882353, 1, 1,
0.06767413, -1.012754, 3.425369, 0, 0.7843137, 1, 1,
0.07563986, 1.669091, 0.3463246, 0, 0.7764706, 1, 1,
0.07568744, -0.2985182, 3.734862, 0, 0.772549, 1, 1,
0.0779511, 0.635282, 0.4387477, 0, 0.7647059, 1, 1,
0.07892773, 0.2307414, -1.047665, 0, 0.7607843, 1, 1,
0.08069873, 0.01050124, 0.7576964, 0, 0.7529412, 1, 1,
0.08445188, -1.21362, 3.585027, 0, 0.7490196, 1, 1,
0.08835126, -0.004522154, 2.142826, 0, 0.7411765, 1, 1,
0.0893674, 0.7503095, 0.4460967, 0, 0.7372549, 1, 1,
0.09206828, -0.2968078, 1.869738, 0, 0.7294118, 1, 1,
0.0933844, 0.1039677, 0.9201926, 0, 0.7254902, 1, 1,
0.09549093, 1.346863, -0.3003596, 0, 0.7176471, 1, 1,
0.09792597, 0.3571436, -0.1623615, 0, 0.7137255, 1, 1,
0.09902922, -0.1842583, 3.72074, 0, 0.7058824, 1, 1,
0.1053507, -0.2574247, 2.961158, 0, 0.6980392, 1, 1,
0.1075736, 1.751557, 0.9538053, 0, 0.6941177, 1, 1,
0.1112481, -0.6635145, 4.081717, 0, 0.6862745, 1, 1,
0.1145911, 0.5016454, -1.337999, 0, 0.682353, 1, 1,
0.1167513, 0.2912085, 0.8109744, 0, 0.6745098, 1, 1,
0.1168038, 0.01044596, 2.24188, 0, 0.6705883, 1, 1,
0.1169602, -0.1073937, 2.291656, 0, 0.6627451, 1, 1,
0.1173147, -0.04819504, 3.210126, 0, 0.6588235, 1, 1,
0.1176581, 1.913927, 0.2653385, 0, 0.6509804, 1, 1,
0.1202754, 0.3834606, 1.586466, 0, 0.6470588, 1, 1,
0.1267463, 0.07353052, 0.07186091, 0, 0.6392157, 1, 1,
0.1285956, -0.3215193, 2.938615, 0, 0.6352941, 1, 1,
0.1294553, -1.25873, 2.00692, 0, 0.627451, 1, 1,
0.1324629, -0.5405911, 3.492973, 0, 0.6235294, 1, 1,
0.133401, 1.070172, -0.7308406, 0, 0.6156863, 1, 1,
0.1375813, 0.641642, -1.27389, 0, 0.6117647, 1, 1,
0.1375911, 0.09832815, 1.051775, 0, 0.6039216, 1, 1,
0.1419733, -0.2070068, 2.413295, 0, 0.5960785, 1, 1,
0.1428754, 0.04024007, 1.217182, 0, 0.5921569, 1, 1,
0.1449854, -0.0937656, 4.644975, 0, 0.5843138, 1, 1,
0.1501773, 0.7672229, -0.3657054, 0, 0.5803922, 1, 1,
0.153768, -0.6069238, 1.223522, 0, 0.572549, 1, 1,
0.1545084, 1.504825, 1.538704, 0, 0.5686275, 1, 1,
0.1552524, -0.6032392, 3.237783, 0, 0.5607843, 1, 1,
0.1590656, -1.423841, 3.026634, 0, 0.5568628, 1, 1,
0.1593205, 0.4060613, -0.4445969, 0, 0.5490196, 1, 1,
0.1628189, 0.8669109, 0.5039567, 0, 0.5450981, 1, 1,
0.1697448, 0.3592336, 0.5633229, 0, 0.5372549, 1, 1,
0.1726867, -0.1579509, 2.204118, 0, 0.5333334, 1, 1,
0.1734277, 1.438047, -1.497463, 0, 0.5254902, 1, 1,
0.1734785, 0.6447067, 0.5050023, 0, 0.5215687, 1, 1,
0.174486, -0.7197027, 4.142408, 0, 0.5137255, 1, 1,
0.1766424, -2.244392, 4.498084, 0, 0.509804, 1, 1,
0.1782664, 1.987281, 0.1787822, 0, 0.5019608, 1, 1,
0.1794337, 0.2372115, 1.37899, 0, 0.4941176, 1, 1,
0.184653, -0.1805345, 1.491542, 0, 0.4901961, 1, 1,
0.1873193, -0.6615978, 0.8722638, 0, 0.4823529, 1, 1,
0.1885691, -1.139562, 2.794971, 0, 0.4784314, 1, 1,
0.1896508, -2.052611, 2.913638, 0, 0.4705882, 1, 1,
0.1902889, 0.8889102, -0.2587627, 0, 0.4666667, 1, 1,
0.1915025, -1.215524, 3.527624, 0, 0.4588235, 1, 1,
0.1940108, 0.6418271, 1.063072, 0, 0.454902, 1, 1,
0.1979066, -0.2353039, 3.093705, 0, 0.4470588, 1, 1,
0.2008911, -0.5502839, 1.683047, 0, 0.4431373, 1, 1,
0.2034486, 0.7293622, 1.635113, 0, 0.4352941, 1, 1,
0.2051638, -0.4649816, 3.755366, 0, 0.4313726, 1, 1,
0.2118384, 1.66058, -0.006061912, 0, 0.4235294, 1, 1,
0.2156952, -1.329532, 2.553055, 0, 0.4196078, 1, 1,
0.2186957, -0.7893079, 3.564156, 0, 0.4117647, 1, 1,
0.2333684, 0.4758795, 1.061981, 0, 0.4078431, 1, 1,
0.2391006, -1.716147, 2.33154, 0, 0.4, 1, 1,
0.2430214, 0.3971964, 0.4994893, 0, 0.3921569, 1, 1,
0.2440743, 1.377076, 0.43563, 0, 0.3882353, 1, 1,
0.2462521, -1.066162, 3.112173, 0, 0.3803922, 1, 1,
0.2474139, 1.12673, -1.187247, 0, 0.3764706, 1, 1,
0.2484362, -0.8911609, 1.285826, 0, 0.3686275, 1, 1,
0.2495114, -0.7447513, 3.690646, 0, 0.3647059, 1, 1,
0.2668457, -1.602348, 3.083473, 0, 0.3568628, 1, 1,
0.2675109, -0.3817507, 1.745657, 0, 0.3529412, 1, 1,
0.26848, 1.115105, -0.02615819, 0, 0.345098, 1, 1,
0.2689023, -0.6209272, 1.908934, 0, 0.3411765, 1, 1,
0.269371, 0.8476736, 1.368628, 0, 0.3333333, 1, 1,
0.2697768, -0.833944, 3.963514, 0, 0.3294118, 1, 1,
0.2704448, -0.2599616, 2.11023, 0, 0.3215686, 1, 1,
0.2711289, 0.3815061, 3.002897, 0, 0.3176471, 1, 1,
0.2774711, 0.3804705, 1.014906, 0, 0.3098039, 1, 1,
0.2779677, 0.5738608, 1.823211, 0, 0.3058824, 1, 1,
0.2826231, -0.3471454, 1.996142, 0, 0.2980392, 1, 1,
0.2838628, -0.787305, 1.601819, 0, 0.2901961, 1, 1,
0.2885889, -0.4146904, 2.268442, 0, 0.2862745, 1, 1,
0.2915728, 0.4543718, 1.053283, 0, 0.2784314, 1, 1,
0.2919198, -0.4578265, 2.292253, 0, 0.2745098, 1, 1,
0.3012392, 0.5293463, 0.4233284, 0, 0.2666667, 1, 1,
0.3024801, -0.6572741, 4.999735, 0, 0.2627451, 1, 1,
0.3025256, 0.3478244, 0.6957225, 0, 0.254902, 1, 1,
0.3065265, 0.03238585, 0.8647237, 0, 0.2509804, 1, 1,
0.3124144, -1.001475, 3.447533, 0, 0.2431373, 1, 1,
0.3143856, -0.921213, 4.237896, 0, 0.2392157, 1, 1,
0.3183495, -0.7487971, 1.122816, 0, 0.2313726, 1, 1,
0.3205002, -0.03937264, 0.8403232, 0, 0.227451, 1, 1,
0.3258657, -1.500414, 3.329898, 0, 0.2196078, 1, 1,
0.327965, 1.442, 1.067236, 0, 0.2156863, 1, 1,
0.3292178, 1.464983, -0.126962, 0, 0.2078431, 1, 1,
0.3386286, 0.0904994, 1.179604, 0, 0.2039216, 1, 1,
0.3433161, -1.287318, 3.302566, 0, 0.1960784, 1, 1,
0.3435872, -1.184762, 3.894329, 0, 0.1882353, 1, 1,
0.3459599, -0.9929281, 3.729292, 0, 0.1843137, 1, 1,
0.3495224, -1.982529, 4.833005, 0, 0.1764706, 1, 1,
0.3510895, -0.6363426, 1.514701, 0, 0.172549, 1, 1,
0.3562285, 0.3409448, 0.6388335, 0, 0.1647059, 1, 1,
0.3620606, -0.1528484, 2.574164, 0, 0.1607843, 1, 1,
0.3679086, 0.6635897, 2.912309, 0, 0.1529412, 1, 1,
0.3684017, 1.336892, 0.123003, 0, 0.1490196, 1, 1,
0.3706226, 1.427835, -0.461437, 0, 0.1411765, 1, 1,
0.3730194, -0.4715907, 1.636438, 0, 0.1372549, 1, 1,
0.3731147, 1.155812, -0.3161607, 0, 0.1294118, 1, 1,
0.3740203, -0.2712499, 0.1015824, 0, 0.1254902, 1, 1,
0.3768986, 0.4208845, 1.21875, 0, 0.1176471, 1, 1,
0.3772837, -0.6218253, 3.111006, 0, 0.1137255, 1, 1,
0.38411, -1.475433, 3.321624, 0, 0.1058824, 1, 1,
0.394477, -0.9281632, 2.121694, 0, 0.09803922, 1, 1,
0.395682, 0.6160501, 1.79216, 0, 0.09411765, 1, 1,
0.3971516, 1.139511, 2.235569, 0, 0.08627451, 1, 1,
0.4021778, -1.122255, 3.010167, 0, 0.08235294, 1, 1,
0.4104845, -1.475885, 4.250646, 0, 0.07450981, 1, 1,
0.4124947, -0.5280286, 4.259121, 0, 0.07058824, 1, 1,
0.4155174, -0.9040892, 2.85329, 0, 0.0627451, 1, 1,
0.4170722, 0.01692418, 0.9213555, 0, 0.05882353, 1, 1,
0.4171024, 0.1600589, -0.2839188, 0, 0.05098039, 1, 1,
0.4173037, -0.5484347, 3.032885, 0, 0.04705882, 1, 1,
0.4190723, -0.1175748, 3.574393, 0, 0.03921569, 1, 1,
0.4244955, 0.5620955, 1.272774, 0, 0.03529412, 1, 1,
0.4251778, -2.531691, 2.484837, 0, 0.02745098, 1, 1,
0.427247, -0.8974257, 2.70185, 0, 0.02352941, 1, 1,
0.4291223, 0.6749678, 2.369103, 0, 0.01568628, 1, 1,
0.431259, -2.480847, 2.465345, 0, 0.01176471, 1, 1,
0.4312859, 0.5351883, 1.06616, 0, 0.003921569, 1, 1,
0.4395584, -0.6901738, 1.982967, 0.003921569, 0, 1, 1,
0.4408949, 0.1702114, 2.478902, 0.007843138, 0, 1, 1,
0.4440895, 0.4608519, 1.583988, 0.01568628, 0, 1, 1,
0.4452733, -1.015118, 2.197607, 0.01960784, 0, 1, 1,
0.4513872, -1.398563, 2.273458, 0.02745098, 0, 1, 1,
0.4539599, 1.392682, 1.013373, 0.03137255, 0, 1, 1,
0.4553925, -1.381173, 2.808649, 0.03921569, 0, 1, 1,
0.4568976, -0.4651155, 1.000949, 0.04313726, 0, 1, 1,
0.4579346, -0.1535455, 1.1224, 0.05098039, 0, 1, 1,
0.4659175, 0.240314, 1.412491, 0.05490196, 0, 1, 1,
0.4694401, -0.2806175, 1.644238, 0.0627451, 0, 1, 1,
0.4700412, -0.1568413, 1.452245, 0.06666667, 0, 1, 1,
0.470835, -0.6416366, 0.852756, 0.07450981, 0, 1, 1,
0.4716111, 1.271419, 1.50519, 0.07843138, 0, 1, 1,
0.4735547, 0.1770757, 0.3543224, 0.08627451, 0, 1, 1,
0.4758087, 0.3111275, 1.275492, 0.09019608, 0, 1, 1,
0.4762574, -0.5045943, 2.668044, 0.09803922, 0, 1, 1,
0.4763333, -0.6393772, 2.275196, 0.1058824, 0, 1, 1,
0.4778352, 1.450146, 0.5339584, 0.1098039, 0, 1, 1,
0.4800609, 0.2985311, 0.9495338, 0.1176471, 0, 1, 1,
0.4835601, 0.5430799, -0.5055268, 0.1215686, 0, 1, 1,
0.4908493, 0.2713302, 0.6482183, 0.1294118, 0, 1, 1,
0.4918874, -0.7280567, 3.422645, 0.1333333, 0, 1, 1,
0.492685, 0.100028, 1.933934, 0.1411765, 0, 1, 1,
0.4954416, 0.3445127, 2.607758, 0.145098, 0, 1, 1,
0.4965052, -0.7099357, 4.274112, 0.1529412, 0, 1, 1,
0.4991019, -0.1229954, 2.902423, 0.1568628, 0, 1, 1,
0.5064437, -2.664141, 2.329524, 0.1647059, 0, 1, 1,
0.506694, 1.074886, 1.243867, 0.1686275, 0, 1, 1,
0.5076461, 1.777386, -0.2372415, 0.1764706, 0, 1, 1,
0.5133883, -0.6462042, 3.247397, 0.1803922, 0, 1, 1,
0.5149523, -1.953278, 1.303203, 0.1882353, 0, 1, 1,
0.5205748, -0.1432404, 1.95058, 0.1921569, 0, 1, 1,
0.5306545, 0.3711395, 0.3500375, 0.2, 0, 1, 1,
0.5312989, 0.006346664, 2.218608, 0.2078431, 0, 1, 1,
0.5315022, 0.8634978, 0.9623846, 0.2117647, 0, 1, 1,
0.5346434, 1.440122, 0.4524452, 0.2196078, 0, 1, 1,
0.54275, 0.1103587, 1.850994, 0.2235294, 0, 1, 1,
0.5442122, -0.0930527, 2.124776, 0.2313726, 0, 1, 1,
0.5443196, -0.5761504, 3.577678, 0.2352941, 0, 1, 1,
0.5473613, 0.2209544, 0.682664, 0.2431373, 0, 1, 1,
0.549615, 0.4817899, 1.595277, 0.2470588, 0, 1, 1,
0.5503797, 1.002975, -0.1775516, 0.254902, 0, 1, 1,
0.5506396, -1.369923, 3.844785, 0.2588235, 0, 1, 1,
0.5534499, 1.661517, 1.302983, 0.2666667, 0, 1, 1,
0.5536215, -1.09532, 2.209275, 0.2705882, 0, 1, 1,
0.5682546, 0.7374678, 0.003997032, 0.2784314, 0, 1, 1,
0.5690205, -0.02617293, 0.778815, 0.282353, 0, 1, 1,
0.5698645, 0.5803308, -0.09915905, 0.2901961, 0, 1, 1,
0.5724519, -1.584043, 5.273839, 0.2941177, 0, 1, 1,
0.5738939, -0.1495433, 1.070808, 0.3019608, 0, 1, 1,
0.5749205, 1.107457, -0.5426865, 0.3098039, 0, 1, 1,
0.5773306, -0.3795393, 0.925586, 0.3137255, 0, 1, 1,
0.5813602, -1.193312, 2.617733, 0.3215686, 0, 1, 1,
0.5813651, 0.4747157, 1.466205, 0.3254902, 0, 1, 1,
0.5823605, -0.1329612, -0.04333038, 0.3333333, 0, 1, 1,
0.582844, 0.9405872, -0.1542448, 0.3372549, 0, 1, 1,
0.5898949, 0.2375956, 0.8561198, 0.345098, 0, 1, 1,
0.5906505, -0.3805645, 0.9652458, 0.3490196, 0, 1, 1,
0.5907303, -0.9644006, 3.251437, 0.3568628, 0, 1, 1,
0.5948665, 0.8622807, 0.2945332, 0.3607843, 0, 1, 1,
0.5960706, 0.9471296, 0.4364673, 0.3686275, 0, 1, 1,
0.5994641, -0.8509731, 3.261906, 0.372549, 0, 1, 1,
0.6106654, -0.8594862, 1.59119, 0.3803922, 0, 1, 1,
0.6127182, -2.259275, 2.279673, 0.3843137, 0, 1, 1,
0.6129838, -0.7557756, 1.269118, 0.3921569, 0, 1, 1,
0.6160642, -0.7004322, 1.667547, 0.3960784, 0, 1, 1,
0.6248747, -0.9815854, 2.481492, 0.4039216, 0, 1, 1,
0.6250743, 0.5588728, 2.225698, 0.4117647, 0, 1, 1,
0.6275347, 0.5749505, 0.3995233, 0.4156863, 0, 1, 1,
0.6281441, 0.7323715, -0.1935262, 0.4235294, 0, 1, 1,
0.6307086, -0.6952565, 2.271863, 0.427451, 0, 1, 1,
0.6333199, 0.6939399, 2.245761, 0.4352941, 0, 1, 1,
0.6364601, -0.03006209, -1.079369, 0.4392157, 0, 1, 1,
0.6372104, -0.46078, 2.667932, 0.4470588, 0, 1, 1,
0.6390724, 0.2741069, 2.061786, 0.4509804, 0, 1, 1,
0.639149, 0.6099925, -0.8754761, 0.4588235, 0, 1, 1,
0.6394617, 1.179722, 0.2750403, 0.4627451, 0, 1, 1,
0.645898, -0.5732584, -0.6977414, 0.4705882, 0, 1, 1,
0.6495278, -0.8722982, 2.168261, 0.4745098, 0, 1, 1,
0.6519861, -0.9816612, 1.678892, 0.4823529, 0, 1, 1,
0.6593063, -1.985638, 0.8084151, 0.4862745, 0, 1, 1,
0.6597516, 2.829378, 0.4339625, 0.4941176, 0, 1, 1,
0.6598437, 0.3844357, 1.721106, 0.5019608, 0, 1, 1,
0.6630522, -3.291272, 3.871678, 0.5058824, 0, 1, 1,
0.6645939, 0.07309206, 1.033364, 0.5137255, 0, 1, 1,
0.6654192, 1.133391, 2.354844, 0.5176471, 0, 1, 1,
0.6782203, -1.866252, 0.5263375, 0.5254902, 0, 1, 1,
0.6821321, -0.5772384, 1.800559, 0.5294118, 0, 1, 1,
0.6887374, 0.6663507, -0.9172757, 0.5372549, 0, 1, 1,
0.6909603, 0.1289036, 1.878686, 0.5411765, 0, 1, 1,
0.6957119, -1.790641, 1.446733, 0.5490196, 0, 1, 1,
0.6957918, -0.6601719, 1.807403, 0.5529412, 0, 1, 1,
0.6985167, -0.5814905, 3.767034, 0.5607843, 0, 1, 1,
0.7007883, -0.2062761, 0.2732213, 0.5647059, 0, 1, 1,
0.7017175, -1.78749, 2.066046, 0.572549, 0, 1, 1,
0.7030936, -0.8579164, 3.934942, 0.5764706, 0, 1, 1,
0.7033664, -1.340716, 0.9028075, 0.5843138, 0, 1, 1,
0.7114212, -0.05885294, 2.81894, 0.5882353, 0, 1, 1,
0.7129031, -1.179091, 4.683483, 0.5960785, 0, 1, 1,
0.7194064, 1.313155, -1.30536, 0.6039216, 0, 1, 1,
0.7194108, 1.974208, 0.3061407, 0.6078432, 0, 1, 1,
0.7260355, 0.6257845, 2.719242, 0.6156863, 0, 1, 1,
0.7373682, 1.760521, 0.4194711, 0.6196079, 0, 1, 1,
0.7381362, -1.29868, 2.279691, 0.627451, 0, 1, 1,
0.7387736, -0.1632623, 1.77824, 0.6313726, 0, 1, 1,
0.7390213, 0.9409314, 1.646849, 0.6392157, 0, 1, 1,
0.7426264, -0.2865, 2.064187, 0.6431373, 0, 1, 1,
0.7438846, 1.049099, 0.391078, 0.6509804, 0, 1, 1,
0.7454932, 1.960958, 0.1141934, 0.654902, 0, 1, 1,
0.7537145, 3.316553, 0.1879195, 0.6627451, 0, 1, 1,
0.7609213, -1.319186, 0.1709299, 0.6666667, 0, 1, 1,
0.7632086, 0.2621498, -0.2811127, 0.6745098, 0, 1, 1,
0.7731812, 1.870317, -0.9529324, 0.6784314, 0, 1, 1,
0.7762444, -0.4606766, 3.297687, 0.6862745, 0, 1, 1,
0.7916727, 0.9978111, 1.255023, 0.6901961, 0, 1, 1,
0.7929433, 0.3292732, 1.224161, 0.6980392, 0, 1, 1,
0.7933784, 0.3114333, 1.058926, 0.7058824, 0, 1, 1,
0.7994584, 1.030462, 1.742207, 0.7098039, 0, 1, 1,
0.8070495, 1.251041, 2.389879, 0.7176471, 0, 1, 1,
0.8118067, -0.1697436, 1.869021, 0.7215686, 0, 1, 1,
0.8124633, -1.17426, 1.026979, 0.7294118, 0, 1, 1,
0.8180088, 1.239079, 1.535965, 0.7333333, 0, 1, 1,
0.8185605, -0.7717651, 2.26442, 0.7411765, 0, 1, 1,
0.8304271, 0.8643655, 1.569873, 0.7450981, 0, 1, 1,
0.83979, -1.746089, 2.853639, 0.7529412, 0, 1, 1,
0.8411483, -0.3485086, 1.92795, 0.7568628, 0, 1, 1,
0.842698, -1.381675, 4.144679, 0.7647059, 0, 1, 1,
0.8428872, 0.2720758, -0.1588053, 0.7686275, 0, 1, 1,
0.8479454, -1.383526, 3.096613, 0.7764706, 0, 1, 1,
0.8506495, 1.914339, -0.6927883, 0.7803922, 0, 1, 1,
0.8530275, -0.2033609, 2.410177, 0.7882353, 0, 1, 1,
0.8550706, 0.7524274, 1.286011, 0.7921569, 0, 1, 1,
0.8562428, -0.6092343, 1.802435, 0.8, 0, 1, 1,
0.8593329, -1.438882, 1.826446, 0.8078431, 0, 1, 1,
0.8593802, -1.038592, 2.28736, 0.8117647, 0, 1, 1,
0.8612719, -1.070509, 3.274898, 0.8196079, 0, 1, 1,
0.8624783, -1.94094, 3.995492, 0.8235294, 0, 1, 1,
0.863831, 0.5739882, -1.900963, 0.8313726, 0, 1, 1,
0.8659251, -0.8782888, 3.793305, 0.8352941, 0, 1, 1,
0.8746575, 0.3542199, 2.166212, 0.8431373, 0, 1, 1,
0.8838149, -0.07216191, 1.091722, 0.8470588, 0, 1, 1,
0.8859165, 0.6619653, 1.034101, 0.854902, 0, 1, 1,
0.8887544, 0.8417, 2.144445, 0.8588235, 0, 1, 1,
0.8895788, -0.8228802, 2.184544, 0.8666667, 0, 1, 1,
0.8936731, -0.7363005, 0.9011834, 0.8705882, 0, 1, 1,
0.901804, -0.05679937, 1.493251, 0.8784314, 0, 1, 1,
0.9027458, -0.8508093, 1.986778, 0.8823529, 0, 1, 1,
0.9080735, 0.297669, -0.6355599, 0.8901961, 0, 1, 1,
0.9134685, -0.9249414, 3.043929, 0.8941177, 0, 1, 1,
0.9135646, -1.525638, 2.586118, 0.9019608, 0, 1, 1,
0.9140797, -0.3899607, 1.511977, 0.9098039, 0, 1, 1,
0.9146959, -0.6194481, 2.573132, 0.9137255, 0, 1, 1,
0.915172, -0.6303554, 2.430259, 0.9215686, 0, 1, 1,
0.919054, -2.055947, 2.126951, 0.9254902, 0, 1, 1,
0.9327346, -0.1475806, 0.6846235, 0.9333333, 0, 1, 1,
0.935376, -1.491384, 3.586593, 0.9372549, 0, 1, 1,
0.9367772, 0.02902204, 0.9069882, 0.945098, 0, 1, 1,
0.9381224, 0.4949983, 1.473729, 0.9490196, 0, 1, 1,
0.9431602, -0.3859728, 2.099622, 0.9568627, 0, 1, 1,
0.9536924, 0.3544491, 2.167098, 0.9607843, 0, 1, 1,
0.9570721, -1.891896, 1.481365, 0.9686275, 0, 1, 1,
0.9659497, -0.4405225, 3.18533, 0.972549, 0, 1, 1,
0.9680033, -0.6424335, 3.035054, 0.9803922, 0, 1, 1,
0.9691535, -0.8215887, 3.000962, 0.9843137, 0, 1, 1,
0.969244, 0.5172683, 1.77627, 0.9921569, 0, 1, 1,
0.9701141, -0.919952, 1.74809, 0.9960784, 0, 1, 1,
0.9710471, 0.1153902, 0.2027773, 1, 0, 0.9960784, 1,
0.9739055, -0.09538414, 2.0545, 1, 0, 0.9882353, 1,
0.9827998, 0.3673644, 3.838504, 1, 0, 0.9843137, 1,
0.9843628, -1.346793, 1.880774, 1, 0, 0.9764706, 1,
0.9894606, 0.01690577, 3.367321, 1, 0, 0.972549, 1,
0.9903628, 1.177926, 1.829095, 1, 0, 0.9647059, 1,
0.9939213, -0.1125507, 2.424814, 1, 0, 0.9607843, 1,
0.9981505, 1.149912, -1.088446, 1, 0, 0.9529412, 1,
0.9995462, -0.854872, 1.519067, 1, 0, 0.9490196, 1,
0.9996966, -0.3629003, 3.807852, 1, 0, 0.9411765, 1,
1.010026, 0.3602819, 0.9689791, 1, 0, 0.9372549, 1,
1.014044, -1.36713, 4.181411, 1, 0, 0.9294118, 1,
1.017281, -0.3558292, 2.408667, 1, 0, 0.9254902, 1,
1.017998, 0.1437262, 1.826436, 1, 0, 0.9176471, 1,
1.026439, -0.1466829, 0.5243129, 1, 0, 0.9137255, 1,
1.034276, -0.6741235, 3.043483, 1, 0, 0.9058824, 1,
1.036201, -1.210913, 2.311043, 1, 0, 0.9019608, 1,
1.037066, -0.9634783, 3.557682, 1, 0, 0.8941177, 1,
1.040876, 0.5127881, 0.2611052, 1, 0, 0.8862745, 1,
1.044761, 0.2629492, 0.7280834, 1, 0, 0.8823529, 1,
1.047894, 1.637833, 0.6822679, 1, 0, 0.8745098, 1,
1.061913, -0.6532727, 3.439978, 1, 0, 0.8705882, 1,
1.063986, 1.731692, 0.7037905, 1, 0, 0.8627451, 1,
1.065766, 1.30696, 2.511207, 1, 0, 0.8588235, 1,
1.066051, -0.9274058, 2.392782, 1, 0, 0.8509804, 1,
1.07074, -0.7677242, 2.927603, 1, 0, 0.8470588, 1,
1.071069, 0.4495836, 0.85566, 1, 0, 0.8392157, 1,
1.071448, 0.8904623, 1.795751, 1, 0, 0.8352941, 1,
1.073801, -0.1846742, 2.929336, 1, 0, 0.827451, 1,
1.074733, 0.5712669, 0.6943688, 1, 0, 0.8235294, 1,
1.086185, 0.1389327, 2.886313, 1, 0, 0.8156863, 1,
1.086451, -0.7784541, 0.9522442, 1, 0, 0.8117647, 1,
1.091586, -0.6001483, 2.569989, 1, 0, 0.8039216, 1,
1.094817, -0.3346172, 1.330166, 1, 0, 0.7960784, 1,
1.097021, 0.3099857, 0.988299, 1, 0, 0.7921569, 1,
1.10233, -2.081777, 2.418011, 1, 0, 0.7843137, 1,
1.114455, -0.5031502, 0.3181713, 1, 0, 0.7803922, 1,
1.116663, -0.864639, 1.894123, 1, 0, 0.772549, 1,
1.124226, -2.531283, 1.702944, 1, 0, 0.7686275, 1,
1.137901, -0.8566262, 1.481377, 1, 0, 0.7607843, 1,
1.146018, -0.8261203, 4.105365, 1, 0, 0.7568628, 1,
1.154413, -0.6427627, 1.478434, 1, 0, 0.7490196, 1,
1.161499, 1.660537, 0.6081843, 1, 0, 0.7450981, 1,
1.162743, -0.3828439, 1.369532, 1, 0, 0.7372549, 1,
1.182234, -0.9452015, 3.011785, 1, 0, 0.7333333, 1,
1.182251, -0.5416756, 3.825172, 1, 0, 0.7254902, 1,
1.191303, 1.091343, 0.9035726, 1, 0, 0.7215686, 1,
1.198513, 0.5179539, 1.369785, 1, 0, 0.7137255, 1,
1.199228, 2.386196, 0.2847778, 1, 0, 0.7098039, 1,
1.19925, -0.4225189, 2.227556, 1, 0, 0.7019608, 1,
1.200802, -1.024213, 2.793409, 1, 0, 0.6941177, 1,
1.204363, 2.106641, -0.1456481, 1, 0, 0.6901961, 1,
1.215107, 1.00596, 1.541811, 1, 0, 0.682353, 1,
1.216729, -1.530131, 3.106039, 1, 0, 0.6784314, 1,
1.219239, 0.8624385, 0.4882095, 1, 0, 0.6705883, 1,
1.221487, 1.827737, 2.016862, 1, 0, 0.6666667, 1,
1.224929, -0.1530411, 1.643684, 1, 0, 0.6588235, 1,
1.225975, -0.05193847, 0.2505667, 1, 0, 0.654902, 1,
1.236232, 1.021014, 1.247351, 1, 0, 0.6470588, 1,
1.239985, 0.9493333, 1.996892, 1, 0, 0.6431373, 1,
1.254809, 0.4225499, 1.878302, 1, 0, 0.6352941, 1,
1.262609, 0.04359815, 0.8868955, 1, 0, 0.6313726, 1,
1.271288, -0.310731, 0.8650374, 1, 0, 0.6235294, 1,
1.272498, 1.296277, 1.687942, 1, 0, 0.6196079, 1,
1.272805, -0.007815167, 2.102997, 1, 0, 0.6117647, 1,
1.275159, -0.03067338, 1.352915, 1, 0, 0.6078432, 1,
1.277935, -0.5891409, 1.240963, 1, 0, 0.6, 1,
1.280893, 0.4921054, -0.7538102, 1, 0, 0.5921569, 1,
1.288384, 1.198709, 0.5608982, 1, 0, 0.5882353, 1,
1.295623, -0.2483154, 0.2551711, 1, 0, 0.5803922, 1,
1.295747, 1.052287, 2.99328, 1, 0, 0.5764706, 1,
1.309996, 0.8582824, 1.288756, 1, 0, 0.5686275, 1,
1.310985, 0.8806094, 0.3236167, 1, 0, 0.5647059, 1,
1.314077, 1.314622, -0.7939064, 1, 0, 0.5568628, 1,
1.316603, 0.6460649, 2.039537, 1, 0, 0.5529412, 1,
1.320174, 2.363101, 0.2098942, 1, 0, 0.5450981, 1,
1.330591, 0.2626362, 0.6694091, 1, 0, 0.5411765, 1,
1.344755, 0.1391603, 0.1294578, 1, 0, 0.5333334, 1,
1.347778, 0.1432984, -0.012487, 1, 0, 0.5294118, 1,
1.348102, -0.003161239, 1.080861, 1, 0, 0.5215687, 1,
1.365307, 2.167404, 0.2180655, 1, 0, 0.5176471, 1,
1.371585, 0.331563, 0.3241052, 1, 0, 0.509804, 1,
1.372602, 0.754569, 0.3270576, 1, 0, 0.5058824, 1,
1.372838, -1.84427, 2.089103, 1, 0, 0.4980392, 1,
1.392883, 1.38452, 1.583332, 1, 0, 0.4901961, 1,
1.436154, 0.3023846, 1.827227, 1, 0, 0.4862745, 1,
1.438787, 0.5775509, 1.226697, 1, 0, 0.4784314, 1,
1.446322, -1.207174, 3.239902, 1, 0, 0.4745098, 1,
1.447055, 1.395299, 1.691003, 1, 0, 0.4666667, 1,
1.450641, 0.5438497, 0.4585336, 1, 0, 0.4627451, 1,
1.45585, -0.2089635, 2.512886, 1, 0, 0.454902, 1,
1.4628, -0.7649807, 1.426442, 1, 0, 0.4509804, 1,
1.468667, 0.01303895, 1.537889, 1, 0, 0.4431373, 1,
1.47463, 1.556786, 1.221184, 1, 0, 0.4392157, 1,
1.495601, -1.820421, 1.588715, 1, 0, 0.4313726, 1,
1.503335, -0.6908299, 2.513829, 1, 0, 0.427451, 1,
1.503742, -0.7683663, 3.193247, 1, 0, 0.4196078, 1,
1.509019, 0.0502973, 0.3524345, 1, 0, 0.4156863, 1,
1.509376, 1.838882, 1.165992, 1, 0, 0.4078431, 1,
1.510353, 1.406829, -0.7118112, 1, 0, 0.4039216, 1,
1.510506, 0.6201453, 0.6008273, 1, 0, 0.3960784, 1,
1.513806, 0.6872477, 1.229672, 1, 0, 0.3882353, 1,
1.515772, 0.2076909, 1.272154, 1, 0, 0.3843137, 1,
1.525185, 0.6321943, 0.4898967, 1, 0, 0.3764706, 1,
1.538583, 0.8974606, 0.7709129, 1, 0, 0.372549, 1,
1.539499, -0.2875584, 1.280991, 1, 0, 0.3647059, 1,
1.554035, -0.984548, 3.30695, 1, 0, 0.3607843, 1,
1.571549, -1.033601, 1.616972, 1, 0, 0.3529412, 1,
1.585589, -0.9888682, 3.70757, 1, 0, 0.3490196, 1,
1.590725, -0.1796387, 1.552596, 1, 0, 0.3411765, 1,
1.601446, -1.158045, 2.439137, 1, 0, 0.3372549, 1,
1.604027, -1.530017, 2.503043, 1, 0, 0.3294118, 1,
1.607013, -0.8802431, 2.695971, 1, 0, 0.3254902, 1,
1.609906, 0.936069, -0.1315064, 1, 0, 0.3176471, 1,
1.616189, 0.2036561, 2.259442, 1, 0, 0.3137255, 1,
1.62691, 0.1049531, 1.068151, 1, 0, 0.3058824, 1,
1.638605, 0.5285553, 1.181812, 1, 0, 0.2980392, 1,
1.6462, -0.1260799, 2.348772, 1, 0, 0.2941177, 1,
1.648001, 0.8157803, -0.01870378, 1, 0, 0.2862745, 1,
1.651255, 1.825197, 0.5775399, 1, 0, 0.282353, 1,
1.653826, -1.606325, 3.207066, 1, 0, 0.2745098, 1,
1.665679, -0.9133367, 0.4268964, 1, 0, 0.2705882, 1,
1.675503, 1.358661, 1.814181, 1, 0, 0.2627451, 1,
1.686337, 2.334825, 0.059177, 1, 0, 0.2588235, 1,
1.690614, 1.629113, 0.3403443, 1, 0, 0.2509804, 1,
1.694477, -0.1685022, 1.301785, 1, 0, 0.2470588, 1,
1.694748, 0.6769539, 2.480236, 1, 0, 0.2392157, 1,
1.708462, -0.4984333, 3.956402, 1, 0, 0.2352941, 1,
1.72409, 0.1559068, 2.464037, 1, 0, 0.227451, 1,
1.732117, -1.227998, 2.036119, 1, 0, 0.2235294, 1,
1.733917, 0.7009634, -0.1949245, 1, 0, 0.2156863, 1,
1.770078, 1.206621, 0.2489805, 1, 0, 0.2117647, 1,
1.772434, 0.6203973, 0.9087877, 1, 0, 0.2039216, 1,
1.772637, -0.00140658, 1.804324, 1, 0, 0.1960784, 1,
1.801961, -1.042913, 2.327816, 1, 0, 0.1921569, 1,
1.841562, 0.6947461, 0.75814, 1, 0, 0.1843137, 1,
1.843011, 0.7812576, 1.615773, 1, 0, 0.1803922, 1,
1.858339, -0.2057277, 1.268997, 1, 0, 0.172549, 1,
1.877138, -0.07560965, 1.50016, 1, 0, 0.1686275, 1,
1.96263, 0.7457983, 1.248286, 1, 0, 0.1607843, 1,
1.992961, 0.683165, 1.260305, 1, 0, 0.1568628, 1,
2.007345, 0.7369076, 2.343828, 1, 0, 0.1490196, 1,
2.053555, -0.0990577, 1.144212, 1, 0, 0.145098, 1,
2.096575, 0.104268, 2.271987, 1, 0, 0.1372549, 1,
2.190297, -0.2745909, 0.6756483, 1, 0, 0.1333333, 1,
2.242309, -0.03756036, 1.022678, 1, 0, 0.1254902, 1,
2.261281, -0.1940359, 1.025483, 1, 0, 0.1215686, 1,
2.275946, 0.8052348, 0.4817762, 1, 0, 0.1137255, 1,
2.290581, 0.5259698, 0.4011163, 1, 0, 0.1098039, 1,
2.343748, -0.01082758, 1.985448, 1, 0, 0.1019608, 1,
2.363405, -0.1210251, 1.312556, 1, 0, 0.09411765, 1,
2.372401, 2.475182, 1.978583, 1, 0, 0.09019608, 1,
2.4078, 1.105385, 1.103391, 1, 0, 0.08235294, 1,
2.477237, -1.127424, 1.297051, 1, 0, 0.07843138, 1,
2.518389, -0.1644404, 1.629557, 1, 0, 0.07058824, 1,
2.537249, 0.07722085, 0.8052388, 1, 0, 0.06666667, 1,
2.583171, -0.5197616, 1.938463, 1, 0, 0.05882353, 1,
2.610856, 0.6594449, 1.145688, 1, 0, 0.05490196, 1,
2.661029, 1.789275, 2.565714, 1, 0, 0.04705882, 1,
2.679082, -0.9191216, 2.913804, 1, 0, 0.04313726, 1,
2.789625, 0.6091201, 2.206296, 1, 0, 0.03529412, 1,
2.955994, -0.08103581, 0.3286919, 1, 0, 0.03137255, 1,
3.085704, 2.084695, 0.78653, 1, 0, 0.02352941, 1,
3.186015, -2.030872, 1.227806, 1, 0, 0.01960784, 1,
3.238654, 1.407575, 0.8223142, 1, 0, 0.01176471, 1,
3.638405, 0.6507989, 1.657345, 1, 0, 0.007843138, 1
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
0.3652495, -4.411299, -7.432148, 0, -0.5, 0.5, 0.5,
0.3652495, -4.411299, -7.432148, 1, -0.5, 0.5, 0.5,
0.3652495, -4.411299, -7.432148, 1, 1.5, 0.5, 0.5,
0.3652495, -4.411299, -7.432148, 0, 1.5, 0.5, 0.5
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
-4.017506, 0.01264048, -7.432148, 0, -0.5, 0.5, 0.5,
-4.017506, 0.01264048, -7.432148, 1, -0.5, 0.5, 0.5,
-4.017506, 0.01264048, -7.432148, 1, 1.5, 0.5, 0.5,
-4.017506, 0.01264048, -7.432148, 0, 1.5, 0.5, 0.5
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
-4.017506, -4.411299, -0.1583917, 0, -0.5, 0.5, 0.5,
-4.017506, -4.411299, -0.1583917, 1, -0.5, 0.5, 0.5,
-4.017506, -4.411299, -0.1583917, 1, 1.5, 0.5, 0.5,
-4.017506, -4.411299, -0.1583917, 0, 1.5, 0.5, 0.5
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
-2, -3.39039, -5.753589,
3, -3.39039, -5.753589,
-2, -3.39039, -5.753589,
-2, -3.560541, -6.033349,
-1, -3.39039, -5.753589,
-1, -3.560541, -6.033349,
0, -3.39039, -5.753589,
0, -3.560541, -6.033349,
1, -3.39039, -5.753589,
1, -3.560541, -6.033349,
2, -3.39039, -5.753589,
2, -3.560541, -6.033349,
3, -3.39039, -5.753589,
3, -3.560541, -6.033349
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
-2, -3.900844, -6.592869, 0, -0.5, 0.5, 0.5,
-2, -3.900844, -6.592869, 1, -0.5, 0.5, 0.5,
-2, -3.900844, -6.592869, 1, 1.5, 0.5, 0.5,
-2, -3.900844, -6.592869, 0, 1.5, 0.5, 0.5,
-1, -3.900844, -6.592869, 0, -0.5, 0.5, 0.5,
-1, -3.900844, -6.592869, 1, -0.5, 0.5, 0.5,
-1, -3.900844, -6.592869, 1, 1.5, 0.5, 0.5,
-1, -3.900844, -6.592869, 0, 1.5, 0.5, 0.5,
0, -3.900844, -6.592869, 0, -0.5, 0.5, 0.5,
0, -3.900844, -6.592869, 1, -0.5, 0.5, 0.5,
0, -3.900844, -6.592869, 1, 1.5, 0.5, 0.5,
0, -3.900844, -6.592869, 0, 1.5, 0.5, 0.5,
1, -3.900844, -6.592869, 0, -0.5, 0.5, 0.5,
1, -3.900844, -6.592869, 1, -0.5, 0.5, 0.5,
1, -3.900844, -6.592869, 1, 1.5, 0.5, 0.5,
1, -3.900844, -6.592869, 0, 1.5, 0.5, 0.5,
2, -3.900844, -6.592869, 0, -0.5, 0.5, 0.5,
2, -3.900844, -6.592869, 1, -0.5, 0.5, 0.5,
2, -3.900844, -6.592869, 1, 1.5, 0.5, 0.5,
2, -3.900844, -6.592869, 0, 1.5, 0.5, 0.5,
3, -3.900844, -6.592869, 0, -0.5, 0.5, 0.5,
3, -3.900844, -6.592869, 1, -0.5, 0.5, 0.5,
3, -3.900844, -6.592869, 1, 1.5, 0.5, 0.5,
3, -3.900844, -6.592869, 0, 1.5, 0.5, 0.5
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
-3.0061, -3, -5.753589,
-3.0061, 3, -5.753589,
-3.0061, -3, -5.753589,
-3.174668, -3, -6.033349,
-3.0061, -2, -5.753589,
-3.174668, -2, -6.033349,
-3.0061, -1, -5.753589,
-3.174668, -1, -6.033349,
-3.0061, 0, -5.753589,
-3.174668, 0, -6.033349,
-3.0061, 1, -5.753589,
-3.174668, 1, -6.033349,
-3.0061, 2, -5.753589,
-3.174668, 2, -6.033349,
-3.0061, 3, -5.753589,
-3.174668, 3, -6.033349
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
-3.511803, -3, -6.592869, 0, -0.5, 0.5, 0.5,
-3.511803, -3, -6.592869, 1, -0.5, 0.5, 0.5,
-3.511803, -3, -6.592869, 1, 1.5, 0.5, 0.5,
-3.511803, -3, -6.592869, 0, 1.5, 0.5, 0.5,
-3.511803, -2, -6.592869, 0, -0.5, 0.5, 0.5,
-3.511803, -2, -6.592869, 1, -0.5, 0.5, 0.5,
-3.511803, -2, -6.592869, 1, 1.5, 0.5, 0.5,
-3.511803, -2, -6.592869, 0, 1.5, 0.5, 0.5,
-3.511803, -1, -6.592869, 0, -0.5, 0.5, 0.5,
-3.511803, -1, -6.592869, 1, -0.5, 0.5, 0.5,
-3.511803, -1, -6.592869, 1, 1.5, 0.5, 0.5,
-3.511803, -1, -6.592869, 0, 1.5, 0.5, 0.5,
-3.511803, 0, -6.592869, 0, -0.5, 0.5, 0.5,
-3.511803, 0, -6.592869, 1, -0.5, 0.5, 0.5,
-3.511803, 0, -6.592869, 1, 1.5, 0.5, 0.5,
-3.511803, 0, -6.592869, 0, 1.5, 0.5, 0.5,
-3.511803, 1, -6.592869, 0, -0.5, 0.5, 0.5,
-3.511803, 1, -6.592869, 1, -0.5, 0.5, 0.5,
-3.511803, 1, -6.592869, 1, 1.5, 0.5, 0.5,
-3.511803, 1, -6.592869, 0, 1.5, 0.5, 0.5,
-3.511803, 2, -6.592869, 0, -0.5, 0.5, 0.5,
-3.511803, 2, -6.592869, 1, -0.5, 0.5, 0.5,
-3.511803, 2, -6.592869, 1, 1.5, 0.5, 0.5,
-3.511803, 2, -6.592869, 0, 1.5, 0.5, 0.5,
-3.511803, 3, -6.592869, 0, -0.5, 0.5, 0.5,
-3.511803, 3, -6.592869, 1, -0.5, 0.5, 0.5,
-3.511803, 3, -6.592869, 1, 1.5, 0.5, 0.5,
-3.511803, 3, -6.592869, 0, 1.5, 0.5, 0.5
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
-3.0061, -3.39039, -4,
-3.0061, -3.39039, 4,
-3.0061, -3.39039, -4,
-3.174668, -3.560541, -4,
-3.0061, -3.39039, -2,
-3.174668, -3.560541, -2,
-3.0061, -3.39039, 0,
-3.174668, -3.560541, 0,
-3.0061, -3.39039, 2,
-3.174668, -3.560541, 2,
-3.0061, -3.39039, 4,
-3.174668, -3.560541, 4
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
-3.511803, -3.900844, -4, 0, -0.5, 0.5, 0.5,
-3.511803, -3.900844, -4, 1, -0.5, 0.5, 0.5,
-3.511803, -3.900844, -4, 1, 1.5, 0.5, 0.5,
-3.511803, -3.900844, -4, 0, 1.5, 0.5, 0.5,
-3.511803, -3.900844, -2, 0, -0.5, 0.5, 0.5,
-3.511803, -3.900844, -2, 1, -0.5, 0.5, 0.5,
-3.511803, -3.900844, -2, 1, 1.5, 0.5, 0.5,
-3.511803, -3.900844, -2, 0, 1.5, 0.5, 0.5,
-3.511803, -3.900844, 0, 0, -0.5, 0.5, 0.5,
-3.511803, -3.900844, 0, 1, -0.5, 0.5, 0.5,
-3.511803, -3.900844, 0, 1, 1.5, 0.5, 0.5,
-3.511803, -3.900844, 0, 0, 1.5, 0.5, 0.5,
-3.511803, -3.900844, 2, 0, -0.5, 0.5, 0.5,
-3.511803, -3.900844, 2, 1, -0.5, 0.5, 0.5,
-3.511803, -3.900844, 2, 1, 1.5, 0.5, 0.5,
-3.511803, -3.900844, 2, 0, 1.5, 0.5, 0.5,
-3.511803, -3.900844, 4, 0, -0.5, 0.5, 0.5,
-3.511803, -3.900844, 4, 1, -0.5, 0.5, 0.5,
-3.511803, -3.900844, 4, 1, 1.5, 0.5, 0.5,
-3.511803, -3.900844, 4, 0, 1.5, 0.5, 0.5
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
-3.0061, -3.39039, -5.753589,
-3.0061, 3.415671, -5.753589,
-3.0061, -3.39039, 5.436806,
-3.0061, 3.415671, 5.436806,
-3.0061, -3.39039, -5.753589,
-3.0061, -3.39039, 5.436806,
-3.0061, 3.415671, -5.753589,
-3.0061, 3.415671, 5.436806,
-3.0061, -3.39039, -5.753589,
3.736599, -3.39039, -5.753589,
-3.0061, -3.39039, 5.436806,
3.736599, -3.39039, 5.436806,
-3.0061, 3.415671, -5.753589,
3.736599, 3.415671, -5.753589,
-3.0061, 3.415671, 5.436806,
3.736599, 3.415671, 5.436806,
3.736599, -3.39039, -5.753589,
3.736599, 3.415671, -5.753589,
3.736599, -3.39039, 5.436806,
3.736599, 3.415671, 5.436806,
3.736599, -3.39039, -5.753589,
3.736599, -3.39039, 5.436806,
3.736599, 3.415671, -5.753589,
3.736599, 3.415671, 5.436806
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
var radius = 7.866232;
var distance = 34.99775;
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
mvMatrix.translate( -0.3652495, -0.01264048, 0.1583917 );
mvMatrix.scale( 1.261383, 1.24964, 0.7600378 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.99775);
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
Prothoate<-read.table("Prothoate.xyz")
```

```
## Error in read.table("Prothoate.xyz"): no lines available in input
```

```r
x<-Prothoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Prothoate' not found
```

```r
y<-Prothoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Prothoate' not found
```

```r
z<-Prothoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Prothoate' not found
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
-2.907906, -0.6576124, -3.767456, 0, 0, 1, 1, 1,
-2.785041, 2.408537, -1.164714, 1, 0, 0, 1, 1,
-2.782907, -0.2141375, 0.2289654, 1, 0, 0, 1, 1,
-2.707441, 2.079744, -3.137855, 1, 0, 0, 1, 1,
-2.6479, 0.6816536, -2.907391, 1, 0, 0, 1, 1,
-2.557075, -0.3642829, -2.324249, 1, 0, 0, 1, 1,
-2.505263, -0.6504075, -2.381357, 0, 0, 0, 1, 1,
-2.455477, 1.530567, -0.5514359, 0, 0, 0, 1, 1,
-2.433787, -0.04127274, -0.9871079, 0, 0, 0, 1, 1,
-2.413711, 1.394063, -0.71224, 0, 0, 0, 1, 1,
-2.400102, -0.8302161, -2.052242, 0, 0, 0, 1, 1,
-2.38524, -0.5591518, 0.09682761, 0, 0, 0, 1, 1,
-2.367679, 0.9472858, -0.3408445, 0, 0, 0, 1, 1,
-2.324056, -0.5706288, -2.392841, 1, 1, 1, 1, 1,
-2.317853, -0.8678606, -2.298167, 1, 1, 1, 1, 1,
-2.274801, 0.1118537, -2.412634, 1, 1, 1, 1, 1,
-2.259493, 0.03473494, -1.817845, 1, 1, 1, 1, 1,
-2.256346, -0.02181033, -1.18854, 1, 1, 1, 1, 1,
-2.223824, -0.9227009, -1.7376, 1, 1, 1, 1, 1,
-2.187526, -1.357566, -2.772082, 1, 1, 1, 1, 1,
-2.164172, 0.1108724, -1.503049, 1, 1, 1, 1, 1,
-2.149408, -0.5322065, -1.514453, 1, 1, 1, 1, 1,
-2.147885, -0.8588535, -2.447182, 1, 1, 1, 1, 1,
-2.13076, -1.19309, -1.687619, 1, 1, 1, 1, 1,
-2.098893, -1.145864, -1.038981, 1, 1, 1, 1, 1,
-2.024323, -0.4268923, -1.598137, 1, 1, 1, 1, 1,
-2.014159, -0.1030548, -1.950305, 1, 1, 1, 1, 1,
-1.995745, 0.7949846, -2.865537, 1, 1, 1, 1, 1,
-1.967425, 0.7757778, -1.442388, 0, 0, 1, 1, 1,
-1.958559, 0.332743, -1.219695, 1, 0, 0, 1, 1,
-1.947464, 0.9502925, -1.05436, 1, 0, 0, 1, 1,
-1.947321, 0.07581249, -3.259394, 1, 0, 0, 1, 1,
-1.909904, -1.36463, -3.136527, 1, 0, 0, 1, 1,
-1.908059, -1.778351, -2.989843, 1, 0, 0, 1, 1,
-1.90745, -1.533906, -3.071405, 0, 0, 0, 1, 1,
-1.895604, 1.180287, -0.8621691, 0, 0, 0, 1, 1,
-1.874063, 0.2564813, -1.376335, 0, 0, 0, 1, 1,
-1.868732, -0.1269798, -0.5133427, 0, 0, 0, 1, 1,
-1.844652, 1.295653, -0.7289196, 0, 0, 0, 1, 1,
-1.830608, 0.8068445, -2.116995, 0, 0, 0, 1, 1,
-1.815693, -0.5139509, -2.715894, 0, 0, 0, 1, 1,
-1.803634, 0.610842, -1.79321, 1, 1, 1, 1, 1,
-1.802448, 0.1828234, -0.4086787, 1, 1, 1, 1, 1,
-1.801214, 0.4952961, -1.058871, 1, 1, 1, 1, 1,
-1.754717, -0.005963897, -0.8295242, 1, 1, 1, 1, 1,
-1.752867, 0.456439, -0.2227579, 1, 1, 1, 1, 1,
-1.747477, 1.135697, -1.235947, 1, 1, 1, 1, 1,
-1.741673, 0.1579368, -1.277593, 1, 1, 1, 1, 1,
-1.73762, -1.130548, -2.935791, 1, 1, 1, 1, 1,
-1.719719, 1.034995, -1.511974, 1, 1, 1, 1, 1,
-1.711952, -1.363077, -3.146531, 1, 1, 1, 1, 1,
-1.674032, 1.593864, 1.400126, 1, 1, 1, 1, 1,
-1.669877, -0.8877351, -3.30496, 1, 1, 1, 1, 1,
-1.666234, 0.0730537, -2.347126, 1, 1, 1, 1, 1,
-1.648777, -1.53442, -3.930116, 1, 1, 1, 1, 1,
-1.646861, -0.3452244, 0.1157011, 1, 1, 1, 1, 1,
-1.644682, 0.6988993, -1.840844, 0, 0, 1, 1, 1,
-1.618413, -0.1311975, -0.5730125, 1, 0, 0, 1, 1,
-1.612854, 0.312442, -2.4154, 1, 0, 0, 1, 1,
-1.611647, -2.523385, -3.146032, 1, 0, 0, 1, 1,
-1.566943, 0.4555751, -0.7260611, 1, 0, 0, 1, 1,
-1.551218, -1.282119, -3.271327, 1, 0, 0, 1, 1,
-1.549822, 0.1781479, -1.413552, 0, 0, 0, 1, 1,
-1.537809, -0.7011886, -2.334203, 0, 0, 0, 1, 1,
-1.537352, 0.5942897, -1.19715, 0, 0, 0, 1, 1,
-1.529456, -0.06626301, -1.751815, 0, 0, 0, 1, 1,
-1.523721, -0.5818409, -0.4945585, 0, 0, 0, 1, 1,
-1.512527, -1.241943, -2.443073, 0, 0, 0, 1, 1,
-1.509531, -1.235043, -1.160309, 0, 0, 0, 1, 1,
-1.502083, -0.4526626, -1.894441, 1, 1, 1, 1, 1,
-1.498015, -0.636988, -2.246387, 1, 1, 1, 1, 1,
-1.487364, -0.3444971, -1.545067, 1, 1, 1, 1, 1,
-1.484264, 1.213508, 1.320611, 1, 1, 1, 1, 1,
-1.480105, 1.128672, -0.6040369, 1, 1, 1, 1, 1,
-1.474763, -1.77674, -4.456858, 1, 1, 1, 1, 1,
-1.468078, -0.6723642, -2.184245, 1, 1, 1, 1, 1,
-1.467019, -0.006792329, -2.267974, 1, 1, 1, 1, 1,
-1.462519, 0.431886, -0.5162997, 1, 1, 1, 1, 1,
-1.460922, -0.3751406, -1.60239, 1, 1, 1, 1, 1,
-1.44276, 1.653305, 0.08235402, 1, 1, 1, 1, 1,
-1.441013, 0.04957072, -1.30187, 1, 1, 1, 1, 1,
-1.439469, -1.375025, -3.13524, 1, 1, 1, 1, 1,
-1.430612, -0.8097083, -2.226799, 1, 1, 1, 1, 1,
-1.430017, -0.6924647, -2.528091, 1, 1, 1, 1, 1,
-1.421908, -0.3584804, -1.682732, 0, 0, 1, 1, 1,
-1.417445, -1.523911, -1.143764, 1, 0, 0, 1, 1,
-1.41423, 1.792706, 0.4675045, 1, 0, 0, 1, 1,
-1.412255, 0.3517352, -2.728088, 1, 0, 0, 1, 1,
-1.409462, -0.6512796, -1.390388, 1, 0, 0, 1, 1,
-1.380265, 0.1784121, -2.177003, 1, 0, 0, 1, 1,
-1.373764, -2.031068, -4.745563, 0, 0, 0, 1, 1,
-1.365893, -0.5576119, -2.489425, 0, 0, 0, 1, 1,
-1.363922, -1.217303, -1.943349, 0, 0, 0, 1, 1,
-1.362728, -0.01160774, -2.780143, 0, 0, 0, 1, 1,
-1.359733, 0.2091587, -1.714064, 0, 0, 0, 1, 1,
-1.359483, -0.1212779, -0.7059368, 0, 0, 0, 1, 1,
-1.35252, -1.095132, -1.911167, 0, 0, 0, 1, 1,
-1.350262, 1.458841, 1.208055, 1, 1, 1, 1, 1,
-1.346727, 0.721225, -1.603875, 1, 1, 1, 1, 1,
-1.339472, -0.06658377, -2.294518, 1, 1, 1, 1, 1,
-1.326793, -0.08704303, 1.10727, 1, 1, 1, 1, 1,
-1.318575, 0.4190021, 0.1579323, 1, 1, 1, 1, 1,
-1.312595, 2.175931, -0.1824084, 1, 1, 1, 1, 1,
-1.312092, 0.7756783, -1.995181, 1, 1, 1, 1, 1,
-1.311923, -0.4579226, -1.657666, 1, 1, 1, 1, 1,
-1.302859, 0.3249733, -0.6293712, 1, 1, 1, 1, 1,
-1.299221, -0.341711, -0.9595111, 1, 1, 1, 1, 1,
-1.29363, 0.7453207, -1.423851, 1, 1, 1, 1, 1,
-1.285257, -0.5302429, -3.097725, 1, 1, 1, 1, 1,
-1.285152, -0.1437872, -1.85638, 1, 1, 1, 1, 1,
-1.283814, 0.8098044, -3.089568, 1, 1, 1, 1, 1,
-1.282217, -0.4397088, -1.181476, 1, 1, 1, 1, 1,
-1.279191, -1.062457, -2.226434, 0, 0, 1, 1, 1,
-1.271342, 0.3295335, -1.762376, 1, 0, 0, 1, 1,
-1.257813, 0.9580641, -2.102539, 1, 0, 0, 1, 1,
-1.254889, -0.1905633, -3.923076, 1, 0, 0, 1, 1,
-1.253816, -0.4623596, -0.2909476, 1, 0, 0, 1, 1,
-1.247091, 0.4601316, -2.325432, 1, 0, 0, 1, 1,
-1.227698, 0.6705986, -1.374853, 0, 0, 0, 1, 1,
-1.226464, 1.41528, -1.112327, 0, 0, 0, 1, 1,
-1.217197, 0.7208915, 1.063329, 0, 0, 0, 1, 1,
-1.216081, -0.4375066, -1.264442, 0, 0, 0, 1, 1,
-1.212684, 0.578097, -0.9726886, 0, 0, 0, 1, 1,
-1.208269, -0.3111439, -2.019362, 0, 0, 0, 1, 1,
-1.205378, -0.2258216, -2.743413, 0, 0, 0, 1, 1,
-1.193052, -0.3669408, -2.148467, 1, 1, 1, 1, 1,
-1.187542, 1.121112, -1.727422, 1, 1, 1, 1, 1,
-1.187344, 0.8730941, -1.514027, 1, 1, 1, 1, 1,
-1.185283, 1.31614, -1.280241, 1, 1, 1, 1, 1,
-1.183318, 0.2755423, -0.841453, 1, 1, 1, 1, 1,
-1.179525, 1.45185, -0.7674043, 1, 1, 1, 1, 1,
-1.174058, -1.759567, -2.62935, 1, 1, 1, 1, 1,
-1.173778, -0.3962498, -2.812119, 1, 1, 1, 1, 1,
-1.172537, -0.6085297, -1.025937, 1, 1, 1, 1, 1,
-1.166348, 0.6111263, -0.03019517, 1, 1, 1, 1, 1,
-1.158862, 0.5110715, 0.292345, 1, 1, 1, 1, 1,
-1.151415, -1.638479, -2.680114, 1, 1, 1, 1, 1,
-1.146699, 0.7016096, 0.1556377, 1, 1, 1, 1, 1,
-1.141421, 1.75499, 1.672812, 1, 1, 1, 1, 1,
-1.138689, 0.2297432, -0.2736676, 1, 1, 1, 1, 1,
-1.131013, 1.289642, -0.747444, 0, 0, 1, 1, 1,
-1.128917, 0.6694614, -2.257853, 1, 0, 0, 1, 1,
-1.122524, 1.413068, -0.7838027, 1, 0, 0, 1, 1,
-1.116794, -1.571905, -3.060807, 1, 0, 0, 1, 1,
-1.109696, 0.3828545, -1.126614, 1, 0, 0, 1, 1,
-1.097115, 1.121802, -0.8740981, 1, 0, 0, 1, 1,
-1.074081, 0.4350419, -0.5854609, 0, 0, 0, 1, 1,
-1.069148, 0.1384019, -0.777184, 0, 0, 0, 1, 1,
-1.067804, 0.1095314, -0.2782159, 0, 0, 0, 1, 1,
-1.066978, 0.3897343, -1.500989, 0, 0, 0, 1, 1,
-1.066144, -0.7612851, -2.55908, 0, 0, 0, 1, 1,
-1.065281, 0.1861037, 0.2118539, 0, 0, 0, 1, 1,
-1.06148, -0.08960395, -2.691103, 0, 0, 0, 1, 1,
-1.053635, 1.256098, 0.8696976, 1, 1, 1, 1, 1,
-1.050887, 0.2069956, -2.168355, 1, 1, 1, 1, 1,
-1.035984, -0.1577617, -2.085009, 1, 1, 1, 1, 1,
-1.025499, 0.7411737, -0.9227704, 1, 1, 1, 1, 1,
-1.024381, -0.3185936, -2.066822, 1, 1, 1, 1, 1,
-1.0222, -0.08369238, -1.269311, 1, 1, 1, 1, 1,
-1.017121, 0.7724007, -2.350082, 1, 1, 1, 1, 1,
-1.015393, -0.4998009, -2.241214, 1, 1, 1, 1, 1,
-1.011299, 0.3968228, -1.329487, 1, 1, 1, 1, 1,
-1.008274, -0.7024172, -0.6978982, 1, 1, 1, 1, 1,
-1.008056, -0.3061646, -1.473799, 1, 1, 1, 1, 1,
-1.003892, -0.5033892, -3.251902, 1, 1, 1, 1, 1,
-0.9996396, -0.1557645, -2.172122, 1, 1, 1, 1, 1,
-0.9779734, 0.08275823, -0.9220587, 1, 1, 1, 1, 1,
-0.9776084, 0.09546652, 1.781271, 1, 1, 1, 1, 1,
-0.9671534, -0.9442843, -3.75055, 0, 0, 1, 1, 1,
-0.9669819, -1.085125, -1.181737, 1, 0, 0, 1, 1,
-0.9622411, -0.6966895, -3.799035, 1, 0, 0, 1, 1,
-0.9595009, -0.7730213, -1.345986, 1, 0, 0, 1, 1,
-0.959245, -0.1506578, -1.58524, 1, 0, 0, 1, 1,
-0.9579473, 3.025219, -0.06489491, 1, 0, 0, 1, 1,
-0.9502346, -0.02387281, -0.03025107, 0, 0, 0, 1, 1,
-0.948962, 1.440973, -0.8162794, 0, 0, 0, 1, 1,
-0.9476797, 1.398446, -0.1367563, 0, 0, 0, 1, 1,
-0.9474565, -1.43319, -2.734359, 0, 0, 0, 1, 1,
-0.9439561, -0.2554484, -2.513402, 0, 0, 0, 1, 1,
-0.9353692, 0.238441, -1.877606, 0, 0, 0, 1, 1,
-0.9331869, -1.86307, -3.213425, 0, 0, 0, 1, 1,
-0.9313269, -0.2840899, -1.017007, 1, 1, 1, 1, 1,
-0.9277062, -0.002979649, -3.078068, 1, 1, 1, 1, 1,
-0.9267511, 0.57069, 0.1487417, 1, 1, 1, 1, 1,
-0.9165267, 1.63605, 0.4858393, 1, 1, 1, 1, 1,
-0.9153984, 0.8577383, -0.6342294, 1, 1, 1, 1, 1,
-0.9012431, -1.717542, -1.993612, 1, 1, 1, 1, 1,
-0.8922777, 1.651083, -1.160996, 1, 1, 1, 1, 1,
-0.8906992, 1.474752, -0.08208207, 1, 1, 1, 1, 1,
-0.8891957, 1.947973, -0.06499809, 1, 1, 1, 1, 1,
-0.8839607, -1.6868, -2.118961, 1, 1, 1, 1, 1,
-0.882112, 1.450842, -1.129275, 1, 1, 1, 1, 1,
-0.8793984, -1.364131, -1.627654, 1, 1, 1, 1, 1,
-0.877716, -0.9837434, -3.749502, 1, 1, 1, 1, 1,
-0.8652807, 1.14855, 0.1779242, 1, 1, 1, 1, 1,
-0.8490665, 0.5704973, -0.4628605, 1, 1, 1, 1, 1,
-0.8402812, -1.45505, -3.133467, 0, 0, 1, 1, 1,
-0.8387972, 1.794905, -1.488365, 1, 0, 0, 1, 1,
-0.8374796, -1.034726, -3.599436, 1, 0, 0, 1, 1,
-0.830504, -0.7961522, -3.314878, 1, 0, 0, 1, 1,
-0.8280284, -0.0225756, -2.125157, 1, 0, 0, 1, 1,
-0.8267437, 1.39369, -0.7847722, 1, 0, 0, 1, 1,
-0.8260932, -0.9402502, -1.581848, 0, 0, 0, 1, 1,
-0.823147, -1.04581, -3.844244, 0, 0, 0, 1, 1,
-0.8189625, 0.262048, -2.668878, 0, 0, 0, 1, 1,
-0.8127985, -0.6908659, -1.902797, 0, 0, 0, 1, 1,
-0.8107654, 1.299813, -2.671206, 0, 0, 0, 1, 1,
-0.8083996, 1.024201, -1.805375, 0, 0, 0, 1, 1,
-0.8072038, 0.2896978, 0.7082645, 0, 0, 0, 1, 1,
-0.8071266, -1.066562, -3.302331, 1, 1, 1, 1, 1,
-0.8070121, -0.4254515, -1.332526, 1, 1, 1, 1, 1,
-0.8063807, 1.907758, -0.08649278, 1, 1, 1, 1, 1,
-0.8054901, 0.9303627, 0.7262611, 1, 1, 1, 1, 1,
-0.8032909, 0.5103604, -2.016791, 1, 1, 1, 1, 1,
-0.8024167, -0.4974654, -1.383469, 1, 1, 1, 1, 1,
-0.7975957, 1.486932, -0.8387788, 1, 1, 1, 1, 1,
-0.7910309, 1.102181, -1.115646, 1, 1, 1, 1, 1,
-0.7907146, -0.9347336, -4.138171, 1, 1, 1, 1, 1,
-0.7905273, -1.333063, -3.337022, 1, 1, 1, 1, 1,
-0.7887506, 1.726207, -1.057185, 1, 1, 1, 1, 1,
-0.787666, 1.102202, -1.965139, 1, 1, 1, 1, 1,
-0.7870584, -1.831785, -2.831897, 1, 1, 1, 1, 1,
-0.7866005, 0.4043354, -1.8, 1, 1, 1, 1, 1,
-0.7821165, 0.9280616, -0.8755854, 1, 1, 1, 1, 1,
-0.779475, 2.21361, -0.9564391, 0, 0, 1, 1, 1,
-0.7674532, -0.641475, -2.920789, 1, 0, 0, 1, 1,
-0.7659438, 1.09857, 0.3959011, 1, 0, 0, 1, 1,
-0.7612816, 2.315751, -0.1358212, 1, 0, 0, 1, 1,
-0.7604369, 0.8739864, -2.037628, 1, 0, 0, 1, 1,
-0.7582945, -0.3784736, -1.489004, 1, 0, 0, 1, 1,
-0.7582345, -0.6120971, -1.34853, 0, 0, 0, 1, 1,
-0.7579422, -0.6605984, -2.878006, 0, 0, 0, 1, 1,
-0.7526979, 0.323567, -0.902095, 0, 0, 0, 1, 1,
-0.7487191, 0.5968757, -0.2419578, 0, 0, 0, 1, 1,
-0.7482334, 1.607981, -0.7769542, 0, 0, 0, 1, 1,
-0.7313684, 0.254045, -2.28408, 0, 0, 0, 1, 1,
-0.7313311, -0.1045781, -1.278822, 0, 0, 0, 1, 1,
-0.7281293, -0.7187481, -1.001758, 1, 1, 1, 1, 1,
-0.726346, 1.188258, 0.06448527, 1, 1, 1, 1, 1,
-0.7191675, -0.4327364, -1.220394, 1, 1, 1, 1, 1,
-0.7153876, 0.2736735, -1.539157, 1, 1, 1, 1, 1,
-0.7139332, 0.8205414, 0.3658153, 1, 1, 1, 1, 1,
-0.7132047, -0.8824184, -2.977446, 1, 1, 1, 1, 1,
-0.7123491, -0.304621, -2.202724, 1, 1, 1, 1, 1,
-0.7120245, -0.8215896, -1.842815, 1, 1, 1, 1, 1,
-0.7041026, 1.985822, -1.89353, 1, 1, 1, 1, 1,
-0.7037434, 1.97589, 0.2048061, 1, 1, 1, 1, 1,
-0.6983001, -0.3672136, -2.621789, 1, 1, 1, 1, 1,
-0.6950707, 0.8529206, -0.6892687, 1, 1, 1, 1, 1,
-0.6836951, -0.9686453, -2.789477, 1, 1, 1, 1, 1,
-0.6830014, -0.6367254, -1.062951, 1, 1, 1, 1, 1,
-0.6730701, -0.2492249, -1.205153, 1, 1, 1, 1, 1,
-0.6690015, 0.683762, 1.228301, 0, 0, 1, 1, 1,
-0.6664627, 0.6250401, -0.003867288, 1, 0, 0, 1, 1,
-0.6636929, -0.5665914, -3.255913, 1, 0, 0, 1, 1,
-0.6566572, 0.6309663, -0.1519542, 1, 0, 0, 1, 1,
-0.6549644, -0.6630498, -2.599442, 1, 0, 0, 1, 1,
-0.6519045, -1.036499, -2.718363, 1, 0, 0, 1, 1,
-0.6488272, -2.142639, -2.824449, 0, 0, 0, 1, 1,
-0.6465189, -1.447616, -2.657155, 0, 0, 0, 1, 1,
-0.6451088, 0.5252982, 0.7127396, 0, 0, 0, 1, 1,
-0.642751, 0.3305426, -1.594637, 0, 0, 0, 1, 1,
-0.6394721, 0.539993, -1.586824, 0, 0, 0, 1, 1,
-0.6391146, 0.4180204, -2.394862, 0, 0, 0, 1, 1,
-0.6377746, 0.6987585, -0.5812334, 0, 0, 0, 1, 1,
-0.6335152, 0.4993652, -1.845109, 1, 1, 1, 1, 1,
-0.6330991, 0.1447243, -0.2491977, 1, 1, 1, 1, 1,
-0.6319721, -0.0312079, -1.500659, 1, 1, 1, 1, 1,
-0.6285219, -1.460596, -3.031945, 1, 1, 1, 1, 1,
-0.6171582, 0.4042426, -1.388402, 1, 1, 1, 1, 1,
-0.6168731, -2.569109, -5.590622, 1, 1, 1, 1, 1,
-0.6162366, 1.479857, 0.9392676, 1, 1, 1, 1, 1,
-0.6074439, -0.1087498, -1.067826, 1, 1, 1, 1, 1,
-0.6062981, 0.9305317, -1.266343, 1, 1, 1, 1, 1,
-0.6015509, -1.266487, -1.995636, 1, 1, 1, 1, 1,
-0.6011543, -0.8860387, -4.119094, 1, 1, 1, 1, 1,
-0.5987054, -0.09536329, -0.7371979, 1, 1, 1, 1, 1,
-0.5912374, 0.1829914, -0.9044558, 1, 1, 1, 1, 1,
-0.5769782, 0.1469867, -1.628712, 1, 1, 1, 1, 1,
-0.574653, -0.2026118, -1.55832, 1, 1, 1, 1, 1,
-0.5691407, 2.231852, -1.94832, 0, 0, 1, 1, 1,
-0.5688922, 0.2447769, -0.3472656, 1, 0, 0, 1, 1,
-0.568619, -2.84047, -3.382505, 1, 0, 0, 1, 1,
-0.558975, -0.3406842, -0.2739301, 1, 0, 0, 1, 1,
-0.5588226, 0.8452214, 1.081793, 1, 0, 0, 1, 1,
-0.5584782, -1.418864, -1.568887, 1, 0, 0, 1, 1,
-0.5568282, -1.541361, -1.522219, 0, 0, 0, 1, 1,
-0.5543052, 0.3847874, -1.480382, 0, 0, 0, 1, 1,
-0.553714, 1.631573, -3.159698, 0, 0, 0, 1, 1,
-0.5502074, -1.075914, -2.486473, 0, 0, 0, 1, 1,
-0.5390542, 0.852925, -1.272114, 0, 0, 0, 1, 1,
-0.5361446, 0.8897295, 0.02363625, 0, 0, 0, 1, 1,
-0.5355411, -0.4396563, -0.7359866, 0, 0, 0, 1, 1,
-0.5323939, -0.3098496, -2.299428, 1, 1, 1, 1, 1,
-0.5323141, 0.09118268, -0.4345652, 1, 1, 1, 1, 1,
-0.5229898, 0.1992334, -1.044435, 1, 1, 1, 1, 1,
-0.5215588, -0.3459582, -3.068142, 1, 1, 1, 1, 1,
-0.5178124, -1.225906, -1.317831, 1, 1, 1, 1, 1,
-0.5100716, -0.6846647, -2.689484, 1, 1, 1, 1, 1,
-0.5045916, -0.9409627, -0.6470242, 1, 1, 1, 1, 1,
-0.5012357, 0.6526681, -1.81322, 1, 1, 1, 1, 1,
-0.494405, 0.5238845, 0.6611072, 1, 1, 1, 1, 1,
-0.4932549, 0.2713644, -1.343841, 1, 1, 1, 1, 1,
-0.4924573, 1.938743, 1.487006, 1, 1, 1, 1, 1,
-0.4921152, -1.137285, -2.587035, 1, 1, 1, 1, 1,
-0.4860902, 1.98594, 2.086157, 1, 1, 1, 1, 1,
-0.4847912, -0.8972555, -2.63669, 1, 1, 1, 1, 1,
-0.4813899, 1.082307, 0.01352277, 1, 1, 1, 1, 1,
-0.4703996, 0.05293687, -1.502112, 0, 0, 1, 1, 1,
-0.4703867, -1.214723, -1.538602, 1, 0, 0, 1, 1,
-0.469824, -0.8767179, -2.877059, 1, 0, 0, 1, 1,
-0.4679552, -0.664396, -2.236341, 1, 0, 0, 1, 1,
-0.4668736, 0.2489665, -0.5881582, 1, 0, 0, 1, 1,
-0.4661897, -0.1094355, -2.28696, 1, 0, 0, 1, 1,
-0.4653877, 0.7959272, 0.02418356, 0, 0, 0, 1, 1,
-0.4634348, -0.2444402, -3.238532, 0, 0, 0, 1, 1,
-0.4631949, -0.7957101, -3.498667, 0, 0, 0, 1, 1,
-0.4621586, 0.1376932, -1.379434, 0, 0, 0, 1, 1,
-0.460891, 1.248393, 0.7698909, 0, 0, 0, 1, 1,
-0.457987, 1.356225, 1.694348, 0, 0, 0, 1, 1,
-0.4535645, -1.061458, -1.164037, 0, 0, 0, 1, 1,
-0.452703, -1.373617, -2.084533, 1, 1, 1, 1, 1,
-0.4463139, -0.1244237, -1.99253, 1, 1, 1, 1, 1,
-0.4446212, 0.2706575, -2.039098, 1, 1, 1, 1, 1,
-0.4433844, 1.240663, 0.4821869, 1, 1, 1, 1, 1,
-0.4421783, -0.5628812, -2.706224, 1, 1, 1, 1, 1,
-0.4353874, 0.3647348, -0.6890063, 1, 1, 1, 1, 1,
-0.4331161, 0.06344145, -0.8856358, 1, 1, 1, 1, 1,
-0.4318698, 0.558745, 0.08085667, 1, 1, 1, 1, 1,
-0.4274963, -2.186068, -1.723271, 1, 1, 1, 1, 1,
-0.4255762, -1.340699, -2.994939, 1, 1, 1, 1, 1,
-0.4242704, 2.701462, 0.8026953, 1, 1, 1, 1, 1,
-0.4201406, 0.0108038, -0.5121871, 1, 1, 1, 1, 1,
-0.4201104, -0.6530566, -2.759706, 1, 1, 1, 1, 1,
-0.4182569, 0.8014444, -0.6781306, 1, 1, 1, 1, 1,
-0.4179364, 0.9832848, 2.308595, 1, 1, 1, 1, 1,
-0.4146084, 0.2390692, -1.090285, 0, 0, 1, 1, 1,
-0.4109841, -1.819982, -2.203499, 1, 0, 0, 1, 1,
-0.4076512, -0.6392756, -1.051737, 1, 0, 0, 1, 1,
-0.4069759, 1.197352, 0.05962386, 1, 0, 0, 1, 1,
-0.4055564, 0.3028676, -0.9134051, 1, 0, 0, 1, 1,
-0.4030887, 1.921722, -0.5474757, 1, 0, 0, 1, 1,
-0.4029625, -0.07779285, -1.771455, 0, 0, 0, 1, 1,
-0.3973893, -0.5861409, -3.17728, 0, 0, 0, 1, 1,
-0.3943521, -1.081479, -3.451664, 0, 0, 0, 1, 1,
-0.3867868, -2.036497, -2.617356, 0, 0, 0, 1, 1,
-0.3859983, 1.327511, -0.06275719, 0, 0, 0, 1, 1,
-0.3857763, 0.5568002, 0.7954954, 0, 0, 0, 1, 1,
-0.3831878, 1.366515, -0.7795818, 0, 0, 0, 1, 1,
-0.38002, -0.4860578, -3.807869, 1, 1, 1, 1, 1,
-0.3791988, 0.240963, -0.6911995, 1, 1, 1, 1, 1,
-0.3780276, 0.2436212, -1.078369, 1, 1, 1, 1, 1,
-0.3743168, 0.3914048, 1.839699, 1, 1, 1, 1, 1,
-0.3740536, -0.0212645, -1.449478, 1, 1, 1, 1, 1,
-0.373326, 0.2035401, -0.8458308, 1, 1, 1, 1, 1,
-0.3722131, -0.5676507, -2.240939, 1, 1, 1, 1, 1,
-0.3720284, -1.193591, -0.8078922, 1, 1, 1, 1, 1,
-0.3709872, 0.467726, 0.6281887, 1, 1, 1, 1, 1,
-0.3648549, -0.08621422, -2.531554, 1, 1, 1, 1, 1,
-0.364246, 0.2129946, -0.8871329, 1, 1, 1, 1, 1,
-0.3627804, -0.7469697, -1.934242, 1, 1, 1, 1, 1,
-0.359195, -0.6903863, -1.179422, 1, 1, 1, 1, 1,
-0.3584132, -0.3808939, -1.166846, 1, 1, 1, 1, 1,
-0.3559507, -1.30652, -3.429859, 1, 1, 1, 1, 1,
-0.3548271, -1.046997, -2.278165, 0, 0, 1, 1, 1,
-0.3544113, 0.5087521, -1.759967, 1, 0, 0, 1, 1,
-0.3540765, 0.08983792, -2.296468, 1, 0, 0, 1, 1,
-0.3536836, -0.5572435, -3.325657, 1, 0, 0, 1, 1,
-0.3521606, 1.235916, -1.063202, 1, 0, 0, 1, 1,
-0.3514538, -1.075088, -2.420635, 1, 0, 0, 1, 1,
-0.350525, 2.01206, 0.5390951, 0, 0, 0, 1, 1,
-0.3447685, -1.366993, -2.269446, 0, 0, 0, 1, 1,
-0.340666, -2.085021, -1.645356, 0, 0, 0, 1, 1,
-0.3372681, -0.6949392, -2.761713, 0, 0, 0, 1, 1,
-0.3297159, 2.38675, -0.6879305, 0, 0, 0, 1, 1,
-0.3297121, 0.1685989, -1.534813, 0, 0, 0, 1, 1,
-0.3216373, 0.2260741, -0.6918099, 0, 0, 0, 1, 1,
-0.3175659, -1.806924, -2.960896, 1, 1, 1, 1, 1,
-0.3174367, -1.175416, -2.316291, 1, 1, 1, 1, 1,
-0.3172364, -0.4041189, -1.484347, 1, 1, 1, 1, 1,
-0.3162071, 0.6318955, -2.465672, 1, 1, 1, 1, 1,
-0.3105217, 0.6604612, -1.902326, 1, 1, 1, 1, 1,
-0.3089057, 0.8102286, -1.563428, 1, 1, 1, 1, 1,
-0.3053761, -2.078223, -3.974208, 1, 1, 1, 1, 1,
-0.3021606, 0.1277158, 0.3424226, 1, 1, 1, 1, 1,
-0.3020807, -0.1501733, -3.063452, 1, 1, 1, 1, 1,
-0.3010874, -1.76958, -4.04989, 1, 1, 1, 1, 1,
-0.3002645, -2.03014, -2.724245, 1, 1, 1, 1, 1,
-0.2905185, -1.061373, -1.881825, 1, 1, 1, 1, 1,
-0.2900302, -1.414488, -2.906817, 1, 1, 1, 1, 1,
-0.2897221, 1.62976, -0.7532222, 1, 1, 1, 1, 1,
-0.2888968, 0.5079008, -0.7370283, 1, 1, 1, 1, 1,
-0.2865519, 1.695402, -2.780342, 0, 0, 1, 1, 1,
-0.2806737, 0.4138674, -1.871531, 1, 0, 0, 1, 1,
-0.2784863, -0.3553595, -0.8285166, 1, 0, 0, 1, 1,
-0.2781089, 1.437992, 1.317242, 1, 0, 0, 1, 1,
-0.2775659, -0.7925207, -3.343667, 1, 0, 0, 1, 1,
-0.2765974, 0.3772061, 0.4993811, 1, 0, 0, 1, 1,
-0.2763764, 0.9834186, 0.1237481, 0, 0, 0, 1, 1,
-0.2757331, -0.4882607, -3.499579, 0, 0, 0, 1, 1,
-0.2749533, 0.09544744, -1.796374, 0, 0, 0, 1, 1,
-0.2716084, -1.823833, -3.302511, 0, 0, 0, 1, 1,
-0.268297, 0.3606939, 1.004214, 0, 0, 0, 1, 1,
-0.2657433, 0.5933774, -0.3144874, 0, 0, 0, 1, 1,
-0.2623104, -0.25733, -2.896455, 0, 0, 0, 1, 1,
-0.2566377, -0.7414796, -2.672132, 1, 1, 1, 1, 1,
-0.2566248, 0.4290832, -0.4768589, 1, 1, 1, 1, 1,
-0.2517189, 0.04302065, -1.568252, 1, 1, 1, 1, 1,
-0.2497679, -1.267737, -2.523127, 1, 1, 1, 1, 1,
-0.2480695, -1.415765, -2.839665, 1, 1, 1, 1, 1,
-0.2456266, 0.6760467, -1.448754, 1, 1, 1, 1, 1,
-0.2435973, 0.7299425, -0.6957682, 1, 1, 1, 1, 1,
-0.2418655, -0.3745831, -1.642769, 1, 1, 1, 1, 1,
-0.2384137, -0.1602073, -3.306439, 1, 1, 1, 1, 1,
-0.2373027, -1.484757, -3.395094, 1, 1, 1, 1, 1,
-0.2334235, 0.3993093, -1.157568, 1, 1, 1, 1, 1,
-0.2333038, -0.8524212, -2.253436, 1, 1, 1, 1, 1,
-0.2298575, 0.6638974, -0.1291051, 1, 1, 1, 1, 1,
-0.2261218, 0.5388143, -2.085066, 1, 1, 1, 1, 1,
-0.2251365, 0.4014719, 0.6666079, 1, 1, 1, 1, 1,
-0.2215782, 0.5346161, -1.097298, 0, 0, 1, 1, 1,
-0.2209686, -0.9888862, -4.648299, 1, 0, 0, 1, 1,
-0.2159079, 0.01561641, -0.4573045, 1, 0, 0, 1, 1,
-0.2141592, 2.218338, -1.213985, 1, 0, 0, 1, 1,
-0.2124288, -0.1441957, -2.54847, 1, 0, 0, 1, 1,
-0.2076992, 0.2311047, -0.6042244, 1, 0, 0, 1, 1,
-0.2047081, 1.298318, -0.7804954, 0, 0, 0, 1, 1,
-0.1975791, -0.0286717, -2.369695, 0, 0, 0, 1, 1,
-0.1965139, 0.6828723, -0.138562, 0, 0, 0, 1, 1,
-0.1944962, 0.1576667, -2.085043, 0, 0, 0, 1, 1,
-0.1918469, 1.385853, -0.07126024, 0, 0, 0, 1, 1,
-0.1886441, -1.497359, -5.094146, 0, 0, 0, 1, 1,
-0.1878415, 0.01949721, -1.926631, 0, 0, 0, 1, 1,
-0.185987, 1.578539, -0.5743526, 1, 1, 1, 1, 1,
-0.1841545, -0.4016587, -4.877937, 1, 1, 1, 1, 1,
-0.1805767, 0.2894196, -1.533225, 1, 1, 1, 1, 1,
-0.1800627, -0.3849153, -1.194781, 1, 1, 1, 1, 1,
-0.1757813, 0.8899708, -0.274704, 1, 1, 1, 1, 1,
-0.1750189, 1.063886, -0.5237612, 1, 1, 1, 1, 1,
-0.1738192, -0.1691053, -2.582938, 1, 1, 1, 1, 1,
-0.1726663, -0.3164748, -0.4551021, 1, 1, 1, 1, 1,
-0.1686633, -1.118444, -4.572714, 1, 1, 1, 1, 1,
-0.1655835, 1.14541, -2.172812, 1, 1, 1, 1, 1,
-0.1649482, -0.5096921, -4.558595, 1, 1, 1, 1, 1,
-0.1617887, 0.1074603, -1.028814, 1, 1, 1, 1, 1,
-0.1613861, -0.7740134, -3.230071, 1, 1, 1, 1, 1,
-0.1610893, 0.7649696, -0.7359417, 1, 1, 1, 1, 1,
-0.1604291, -1.354969, -1.88137, 1, 1, 1, 1, 1,
-0.1602085, 0.03990717, -0.07749496, 0, 0, 1, 1, 1,
-0.1538045, -0.2102505, -3.900504, 1, 0, 0, 1, 1,
-0.1524166, -0.4673111, -3.576598, 1, 0, 0, 1, 1,
-0.151136, -1.152849, -3.247965, 1, 0, 0, 1, 1,
-0.1455975, 1.17872, -0.02094249, 1, 0, 0, 1, 1,
-0.1451337, 1.44436, 0.4551092, 1, 0, 0, 1, 1,
-0.1443186, 1.047676, -0.1074276, 0, 0, 0, 1, 1,
-0.1412961, 0.6267269, -1.090121, 0, 0, 0, 1, 1,
-0.1362966, 1.370516, 0.527909, 0, 0, 0, 1, 1,
-0.1349148, 0.2584502, -0.4518132, 0, 0, 0, 1, 1,
-0.1340485, 0.3731487, -1.312864, 0, 0, 0, 1, 1,
-0.1276789, 1.657867, 0.01581237, 0, 0, 0, 1, 1,
-0.1201095, 0.7394661, 0.7668752, 0, 0, 0, 1, 1,
-0.1188868, 1.126981, -0.2105819, 1, 1, 1, 1, 1,
-0.1132165, -0.3053043, -3.907798, 1, 1, 1, 1, 1,
-0.1075486, 0.3946033, -0.3854152, 1, 1, 1, 1, 1,
-0.1032682, -0.4569608, -4.246425, 1, 1, 1, 1, 1,
-0.09876514, 1.056102, -1.721916, 1, 1, 1, 1, 1,
-0.09742331, -0.3809118, -3.907364, 1, 1, 1, 1, 1,
-0.09371188, 0.8789145, 0.4472251, 1, 1, 1, 1, 1,
-0.09223173, -0.7485676, -2.964583, 1, 1, 1, 1, 1,
-0.08731591, 0.2165677, -0.7710816, 1, 1, 1, 1, 1,
-0.08654157, 0.08264916, -1.647799, 1, 1, 1, 1, 1,
-0.0836954, 0.563835, 0.3830291, 1, 1, 1, 1, 1,
-0.07810669, 0.2995226, 0.006602271, 1, 1, 1, 1, 1,
-0.0777278, -0.1180073, -0.4525461, 1, 1, 1, 1, 1,
-0.07616937, 1.306984, 0.439819, 1, 1, 1, 1, 1,
-0.07453797, 0.04115942, -1.838792, 1, 1, 1, 1, 1,
-0.07428912, 0.5677115, -1.082156, 0, 0, 1, 1, 1,
-0.07258973, -1.347178, -2.671268, 1, 0, 0, 1, 1,
-0.06812775, -1.11191, -2.199143, 1, 0, 0, 1, 1,
-0.06626111, -0.2557204, -2.140231, 1, 0, 0, 1, 1,
-0.06603065, 0.1724674, -0.832262, 1, 0, 0, 1, 1,
-0.06505687, -0.7737286, -2.053842, 1, 0, 0, 1, 1,
-0.06354004, -0.01237957, -1.554582, 0, 0, 0, 1, 1,
-0.05483937, 1.220505, -0.5280566, 0, 0, 0, 1, 1,
-0.05368048, -1.56347, -2.878571, 0, 0, 0, 1, 1,
-0.05040914, -0.5884015, -3.160005, 0, 0, 0, 1, 1,
-0.04602455, 1.416417, -1.579822, 0, 0, 0, 1, 1,
-0.04327344, -0.1307898, -2.358657, 0, 0, 0, 1, 1,
-0.03999913, -0.8384609, -1.199023, 0, 0, 0, 1, 1,
-0.03557514, -1.263221, -3.060329, 1, 1, 1, 1, 1,
-0.03467154, -0.1362179, -3.157234, 1, 1, 1, 1, 1,
-0.0339564, -0.3450561, -2.088903, 1, 1, 1, 1, 1,
-0.03383049, 1.15303, -1.278326, 1, 1, 1, 1, 1,
-0.03352479, 0.3485166, 2.094327, 1, 1, 1, 1, 1,
-0.03297408, 0.7857794, 0.3986823, 1, 1, 1, 1, 1,
-0.02108444, -2.276233, -3.37579, 1, 1, 1, 1, 1,
-0.01920835, 1.803755, -0.0484396, 1, 1, 1, 1, 1,
-0.01874299, 1.164714, 2.01213, 1, 1, 1, 1, 1,
-0.01790005, -2.218666, -2.692152, 1, 1, 1, 1, 1,
-0.007332501, -0.8232773, -2.5976, 1, 1, 1, 1, 1,
-0.003784981, 0.6338008, 0.8643706, 1, 1, 1, 1, 1,
-0.001884772, 0.6417531, 0.3400382, 1, 1, 1, 1, 1,
-0.001464794, -0.1985425, -3.231254, 1, 1, 1, 1, 1,
-0.0006122824, -0.5580153, -2.010915, 1, 1, 1, 1, 1,
-0.0005717099, 0.4676595, -0.1421628, 0, 0, 1, 1, 1,
1.653096e-05, 0.3259946, -0.7389046, 1, 0, 0, 1, 1,
0.002420543, -1.459135, 2.918617, 1, 0, 0, 1, 1,
0.01110329, 0.3585093, -1.454441, 1, 0, 0, 1, 1,
0.01187507, -0.8331572, 1.816863, 1, 0, 0, 1, 1,
0.01286175, -0.9968596, 3.320578, 1, 0, 0, 1, 1,
0.01374629, 0.5883309, -1.055825, 0, 0, 0, 1, 1,
0.01548248, -0.1463924, 3.68214, 0, 0, 0, 1, 1,
0.01683547, 0.4024591, -0.3636272, 0, 0, 0, 1, 1,
0.02120739, -1.090553, 0.6737213, 0, 0, 0, 1, 1,
0.02464066, 0.5925007, -1.457333, 0, 0, 0, 1, 1,
0.02868175, 0.4771484, -0.1353144, 0, 0, 0, 1, 1,
0.0309957, 0.3899878, -0.6080446, 0, 0, 0, 1, 1,
0.03417258, -0.6947412, 3.650632, 1, 1, 1, 1, 1,
0.03631195, 0.3460214, 0.5038164, 1, 1, 1, 1, 1,
0.03677923, -0.5922933, 4.40735, 1, 1, 1, 1, 1,
0.03890108, -0.7632971, 4.478346, 1, 1, 1, 1, 1,
0.04031393, 1.160706, 0.2715129, 1, 1, 1, 1, 1,
0.04237703, 2.006189, 0.1145713, 1, 1, 1, 1, 1,
0.04611138, 0.3651991, 0.03651491, 1, 1, 1, 1, 1,
0.0469069, 1.369595, -0.9103194, 1, 1, 1, 1, 1,
0.04814933, 0.001844852, -0.711235, 1, 1, 1, 1, 1,
0.0503327, 0.07883177, 0.9529893, 1, 1, 1, 1, 1,
0.05201406, 1.069994, 0.09779105, 1, 1, 1, 1, 1,
0.05322383, 1.18571, -0.7478389, 1, 1, 1, 1, 1,
0.05545501, -1.169669, 4.278953, 1, 1, 1, 1, 1,
0.05677187, 1.787157, 1.19121, 1, 1, 1, 1, 1,
0.05834863, 0.3082424, 0.2338325, 1, 1, 1, 1, 1,
0.0620961, 0.6709024, 1.164184, 0, 0, 1, 1, 1,
0.06520444, 0.3842716, 1.596901, 1, 0, 0, 1, 1,
0.06646125, -0.9520273, 3.740563, 1, 0, 0, 1, 1,
0.06721984, 0.4790923, -0.9154755, 1, 0, 0, 1, 1,
0.06767413, -1.012754, 3.425369, 1, 0, 0, 1, 1,
0.07563986, 1.669091, 0.3463246, 1, 0, 0, 1, 1,
0.07568744, -0.2985182, 3.734862, 0, 0, 0, 1, 1,
0.0779511, 0.635282, 0.4387477, 0, 0, 0, 1, 1,
0.07892773, 0.2307414, -1.047665, 0, 0, 0, 1, 1,
0.08069873, 0.01050124, 0.7576964, 0, 0, 0, 1, 1,
0.08445188, -1.21362, 3.585027, 0, 0, 0, 1, 1,
0.08835126, -0.004522154, 2.142826, 0, 0, 0, 1, 1,
0.0893674, 0.7503095, 0.4460967, 0, 0, 0, 1, 1,
0.09206828, -0.2968078, 1.869738, 1, 1, 1, 1, 1,
0.0933844, 0.1039677, 0.9201926, 1, 1, 1, 1, 1,
0.09549093, 1.346863, -0.3003596, 1, 1, 1, 1, 1,
0.09792597, 0.3571436, -0.1623615, 1, 1, 1, 1, 1,
0.09902922, -0.1842583, 3.72074, 1, 1, 1, 1, 1,
0.1053507, -0.2574247, 2.961158, 1, 1, 1, 1, 1,
0.1075736, 1.751557, 0.9538053, 1, 1, 1, 1, 1,
0.1112481, -0.6635145, 4.081717, 1, 1, 1, 1, 1,
0.1145911, 0.5016454, -1.337999, 1, 1, 1, 1, 1,
0.1167513, 0.2912085, 0.8109744, 1, 1, 1, 1, 1,
0.1168038, 0.01044596, 2.24188, 1, 1, 1, 1, 1,
0.1169602, -0.1073937, 2.291656, 1, 1, 1, 1, 1,
0.1173147, -0.04819504, 3.210126, 1, 1, 1, 1, 1,
0.1176581, 1.913927, 0.2653385, 1, 1, 1, 1, 1,
0.1202754, 0.3834606, 1.586466, 1, 1, 1, 1, 1,
0.1267463, 0.07353052, 0.07186091, 0, 0, 1, 1, 1,
0.1285956, -0.3215193, 2.938615, 1, 0, 0, 1, 1,
0.1294553, -1.25873, 2.00692, 1, 0, 0, 1, 1,
0.1324629, -0.5405911, 3.492973, 1, 0, 0, 1, 1,
0.133401, 1.070172, -0.7308406, 1, 0, 0, 1, 1,
0.1375813, 0.641642, -1.27389, 1, 0, 0, 1, 1,
0.1375911, 0.09832815, 1.051775, 0, 0, 0, 1, 1,
0.1419733, -0.2070068, 2.413295, 0, 0, 0, 1, 1,
0.1428754, 0.04024007, 1.217182, 0, 0, 0, 1, 1,
0.1449854, -0.0937656, 4.644975, 0, 0, 0, 1, 1,
0.1501773, 0.7672229, -0.3657054, 0, 0, 0, 1, 1,
0.153768, -0.6069238, 1.223522, 0, 0, 0, 1, 1,
0.1545084, 1.504825, 1.538704, 0, 0, 0, 1, 1,
0.1552524, -0.6032392, 3.237783, 1, 1, 1, 1, 1,
0.1590656, -1.423841, 3.026634, 1, 1, 1, 1, 1,
0.1593205, 0.4060613, -0.4445969, 1, 1, 1, 1, 1,
0.1628189, 0.8669109, 0.5039567, 1, 1, 1, 1, 1,
0.1697448, 0.3592336, 0.5633229, 1, 1, 1, 1, 1,
0.1726867, -0.1579509, 2.204118, 1, 1, 1, 1, 1,
0.1734277, 1.438047, -1.497463, 1, 1, 1, 1, 1,
0.1734785, 0.6447067, 0.5050023, 1, 1, 1, 1, 1,
0.174486, -0.7197027, 4.142408, 1, 1, 1, 1, 1,
0.1766424, -2.244392, 4.498084, 1, 1, 1, 1, 1,
0.1782664, 1.987281, 0.1787822, 1, 1, 1, 1, 1,
0.1794337, 0.2372115, 1.37899, 1, 1, 1, 1, 1,
0.184653, -0.1805345, 1.491542, 1, 1, 1, 1, 1,
0.1873193, -0.6615978, 0.8722638, 1, 1, 1, 1, 1,
0.1885691, -1.139562, 2.794971, 1, 1, 1, 1, 1,
0.1896508, -2.052611, 2.913638, 0, 0, 1, 1, 1,
0.1902889, 0.8889102, -0.2587627, 1, 0, 0, 1, 1,
0.1915025, -1.215524, 3.527624, 1, 0, 0, 1, 1,
0.1940108, 0.6418271, 1.063072, 1, 0, 0, 1, 1,
0.1979066, -0.2353039, 3.093705, 1, 0, 0, 1, 1,
0.2008911, -0.5502839, 1.683047, 1, 0, 0, 1, 1,
0.2034486, 0.7293622, 1.635113, 0, 0, 0, 1, 1,
0.2051638, -0.4649816, 3.755366, 0, 0, 0, 1, 1,
0.2118384, 1.66058, -0.006061912, 0, 0, 0, 1, 1,
0.2156952, -1.329532, 2.553055, 0, 0, 0, 1, 1,
0.2186957, -0.7893079, 3.564156, 0, 0, 0, 1, 1,
0.2333684, 0.4758795, 1.061981, 0, 0, 0, 1, 1,
0.2391006, -1.716147, 2.33154, 0, 0, 0, 1, 1,
0.2430214, 0.3971964, 0.4994893, 1, 1, 1, 1, 1,
0.2440743, 1.377076, 0.43563, 1, 1, 1, 1, 1,
0.2462521, -1.066162, 3.112173, 1, 1, 1, 1, 1,
0.2474139, 1.12673, -1.187247, 1, 1, 1, 1, 1,
0.2484362, -0.8911609, 1.285826, 1, 1, 1, 1, 1,
0.2495114, -0.7447513, 3.690646, 1, 1, 1, 1, 1,
0.2668457, -1.602348, 3.083473, 1, 1, 1, 1, 1,
0.2675109, -0.3817507, 1.745657, 1, 1, 1, 1, 1,
0.26848, 1.115105, -0.02615819, 1, 1, 1, 1, 1,
0.2689023, -0.6209272, 1.908934, 1, 1, 1, 1, 1,
0.269371, 0.8476736, 1.368628, 1, 1, 1, 1, 1,
0.2697768, -0.833944, 3.963514, 1, 1, 1, 1, 1,
0.2704448, -0.2599616, 2.11023, 1, 1, 1, 1, 1,
0.2711289, 0.3815061, 3.002897, 1, 1, 1, 1, 1,
0.2774711, 0.3804705, 1.014906, 1, 1, 1, 1, 1,
0.2779677, 0.5738608, 1.823211, 0, 0, 1, 1, 1,
0.2826231, -0.3471454, 1.996142, 1, 0, 0, 1, 1,
0.2838628, -0.787305, 1.601819, 1, 0, 0, 1, 1,
0.2885889, -0.4146904, 2.268442, 1, 0, 0, 1, 1,
0.2915728, 0.4543718, 1.053283, 1, 0, 0, 1, 1,
0.2919198, -0.4578265, 2.292253, 1, 0, 0, 1, 1,
0.3012392, 0.5293463, 0.4233284, 0, 0, 0, 1, 1,
0.3024801, -0.6572741, 4.999735, 0, 0, 0, 1, 1,
0.3025256, 0.3478244, 0.6957225, 0, 0, 0, 1, 1,
0.3065265, 0.03238585, 0.8647237, 0, 0, 0, 1, 1,
0.3124144, -1.001475, 3.447533, 0, 0, 0, 1, 1,
0.3143856, -0.921213, 4.237896, 0, 0, 0, 1, 1,
0.3183495, -0.7487971, 1.122816, 0, 0, 0, 1, 1,
0.3205002, -0.03937264, 0.8403232, 1, 1, 1, 1, 1,
0.3258657, -1.500414, 3.329898, 1, 1, 1, 1, 1,
0.327965, 1.442, 1.067236, 1, 1, 1, 1, 1,
0.3292178, 1.464983, -0.126962, 1, 1, 1, 1, 1,
0.3386286, 0.0904994, 1.179604, 1, 1, 1, 1, 1,
0.3433161, -1.287318, 3.302566, 1, 1, 1, 1, 1,
0.3435872, -1.184762, 3.894329, 1, 1, 1, 1, 1,
0.3459599, -0.9929281, 3.729292, 1, 1, 1, 1, 1,
0.3495224, -1.982529, 4.833005, 1, 1, 1, 1, 1,
0.3510895, -0.6363426, 1.514701, 1, 1, 1, 1, 1,
0.3562285, 0.3409448, 0.6388335, 1, 1, 1, 1, 1,
0.3620606, -0.1528484, 2.574164, 1, 1, 1, 1, 1,
0.3679086, 0.6635897, 2.912309, 1, 1, 1, 1, 1,
0.3684017, 1.336892, 0.123003, 1, 1, 1, 1, 1,
0.3706226, 1.427835, -0.461437, 1, 1, 1, 1, 1,
0.3730194, -0.4715907, 1.636438, 0, 0, 1, 1, 1,
0.3731147, 1.155812, -0.3161607, 1, 0, 0, 1, 1,
0.3740203, -0.2712499, 0.1015824, 1, 0, 0, 1, 1,
0.3768986, 0.4208845, 1.21875, 1, 0, 0, 1, 1,
0.3772837, -0.6218253, 3.111006, 1, 0, 0, 1, 1,
0.38411, -1.475433, 3.321624, 1, 0, 0, 1, 1,
0.394477, -0.9281632, 2.121694, 0, 0, 0, 1, 1,
0.395682, 0.6160501, 1.79216, 0, 0, 0, 1, 1,
0.3971516, 1.139511, 2.235569, 0, 0, 0, 1, 1,
0.4021778, -1.122255, 3.010167, 0, 0, 0, 1, 1,
0.4104845, -1.475885, 4.250646, 0, 0, 0, 1, 1,
0.4124947, -0.5280286, 4.259121, 0, 0, 0, 1, 1,
0.4155174, -0.9040892, 2.85329, 0, 0, 0, 1, 1,
0.4170722, 0.01692418, 0.9213555, 1, 1, 1, 1, 1,
0.4171024, 0.1600589, -0.2839188, 1, 1, 1, 1, 1,
0.4173037, -0.5484347, 3.032885, 1, 1, 1, 1, 1,
0.4190723, -0.1175748, 3.574393, 1, 1, 1, 1, 1,
0.4244955, 0.5620955, 1.272774, 1, 1, 1, 1, 1,
0.4251778, -2.531691, 2.484837, 1, 1, 1, 1, 1,
0.427247, -0.8974257, 2.70185, 1, 1, 1, 1, 1,
0.4291223, 0.6749678, 2.369103, 1, 1, 1, 1, 1,
0.431259, -2.480847, 2.465345, 1, 1, 1, 1, 1,
0.4312859, 0.5351883, 1.06616, 1, 1, 1, 1, 1,
0.4395584, -0.6901738, 1.982967, 1, 1, 1, 1, 1,
0.4408949, 0.1702114, 2.478902, 1, 1, 1, 1, 1,
0.4440895, 0.4608519, 1.583988, 1, 1, 1, 1, 1,
0.4452733, -1.015118, 2.197607, 1, 1, 1, 1, 1,
0.4513872, -1.398563, 2.273458, 1, 1, 1, 1, 1,
0.4539599, 1.392682, 1.013373, 0, 0, 1, 1, 1,
0.4553925, -1.381173, 2.808649, 1, 0, 0, 1, 1,
0.4568976, -0.4651155, 1.000949, 1, 0, 0, 1, 1,
0.4579346, -0.1535455, 1.1224, 1, 0, 0, 1, 1,
0.4659175, 0.240314, 1.412491, 1, 0, 0, 1, 1,
0.4694401, -0.2806175, 1.644238, 1, 0, 0, 1, 1,
0.4700412, -0.1568413, 1.452245, 0, 0, 0, 1, 1,
0.470835, -0.6416366, 0.852756, 0, 0, 0, 1, 1,
0.4716111, 1.271419, 1.50519, 0, 0, 0, 1, 1,
0.4735547, 0.1770757, 0.3543224, 0, 0, 0, 1, 1,
0.4758087, 0.3111275, 1.275492, 0, 0, 0, 1, 1,
0.4762574, -0.5045943, 2.668044, 0, 0, 0, 1, 1,
0.4763333, -0.6393772, 2.275196, 0, 0, 0, 1, 1,
0.4778352, 1.450146, 0.5339584, 1, 1, 1, 1, 1,
0.4800609, 0.2985311, 0.9495338, 1, 1, 1, 1, 1,
0.4835601, 0.5430799, -0.5055268, 1, 1, 1, 1, 1,
0.4908493, 0.2713302, 0.6482183, 1, 1, 1, 1, 1,
0.4918874, -0.7280567, 3.422645, 1, 1, 1, 1, 1,
0.492685, 0.100028, 1.933934, 1, 1, 1, 1, 1,
0.4954416, 0.3445127, 2.607758, 1, 1, 1, 1, 1,
0.4965052, -0.7099357, 4.274112, 1, 1, 1, 1, 1,
0.4991019, -0.1229954, 2.902423, 1, 1, 1, 1, 1,
0.5064437, -2.664141, 2.329524, 1, 1, 1, 1, 1,
0.506694, 1.074886, 1.243867, 1, 1, 1, 1, 1,
0.5076461, 1.777386, -0.2372415, 1, 1, 1, 1, 1,
0.5133883, -0.6462042, 3.247397, 1, 1, 1, 1, 1,
0.5149523, -1.953278, 1.303203, 1, 1, 1, 1, 1,
0.5205748, -0.1432404, 1.95058, 1, 1, 1, 1, 1,
0.5306545, 0.3711395, 0.3500375, 0, 0, 1, 1, 1,
0.5312989, 0.006346664, 2.218608, 1, 0, 0, 1, 1,
0.5315022, 0.8634978, 0.9623846, 1, 0, 0, 1, 1,
0.5346434, 1.440122, 0.4524452, 1, 0, 0, 1, 1,
0.54275, 0.1103587, 1.850994, 1, 0, 0, 1, 1,
0.5442122, -0.0930527, 2.124776, 1, 0, 0, 1, 1,
0.5443196, -0.5761504, 3.577678, 0, 0, 0, 1, 1,
0.5473613, 0.2209544, 0.682664, 0, 0, 0, 1, 1,
0.549615, 0.4817899, 1.595277, 0, 0, 0, 1, 1,
0.5503797, 1.002975, -0.1775516, 0, 0, 0, 1, 1,
0.5506396, -1.369923, 3.844785, 0, 0, 0, 1, 1,
0.5534499, 1.661517, 1.302983, 0, 0, 0, 1, 1,
0.5536215, -1.09532, 2.209275, 0, 0, 0, 1, 1,
0.5682546, 0.7374678, 0.003997032, 1, 1, 1, 1, 1,
0.5690205, -0.02617293, 0.778815, 1, 1, 1, 1, 1,
0.5698645, 0.5803308, -0.09915905, 1, 1, 1, 1, 1,
0.5724519, -1.584043, 5.273839, 1, 1, 1, 1, 1,
0.5738939, -0.1495433, 1.070808, 1, 1, 1, 1, 1,
0.5749205, 1.107457, -0.5426865, 1, 1, 1, 1, 1,
0.5773306, -0.3795393, 0.925586, 1, 1, 1, 1, 1,
0.5813602, -1.193312, 2.617733, 1, 1, 1, 1, 1,
0.5813651, 0.4747157, 1.466205, 1, 1, 1, 1, 1,
0.5823605, -0.1329612, -0.04333038, 1, 1, 1, 1, 1,
0.582844, 0.9405872, -0.1542448, 1, 1, 1, 1, 1,
0.5898949, 0.2375956, 0.8561198, 1, 1, 1, 1, 1,
0.5906505, -0.3805645, 0.9652458, 1, 1, 1, 1, 1,
0.5907303, -0.9644006, 3.251437, 1, 1, 1, 1, 1,
0.5948665, 0.8622807, 0.2945332, 1, 1, 1, 1, 1,
0.5960706, 0.9471296, 0.4364673, 0, 0, 1, 1, 1,
0.5994641, -0.8509731, 3.261906, 1, 0, 0, 1, 1,
0.6106654, -0.8594862, 1.59119, 1, 0, 0, 1, 1,
0.6127182, -2.259275, 2.279673, 1, 0, 0, 1, 1,
0.6129838, -0.7557756, 1.269118, 1, 0, 0, 1, 1,
0.6160642, -0.7004322, 1.667547, 1, 0, 0, 1, 1,
0.6248747, -0.9815854, 2.481492, 0, 0, 0, 1, 1,
0.6250743, 0.5588728, 2.225698, 0, 0, 0, 1, 1,
0.6275347, 0.5749505, 0.3995233, 0, 0, 0, 1, 1,
0.6281441, 0.7323715, -0.1935262, 0, 0, 0, 1, 1,
0.6307086, -0.6952565, 2.271863, 0, 0, 0, 1, 1,
0.6333199, 0.6939399, 2.245761, 0, 0, 0, 1, 1,
0.6364601, -0.03006209, -1.079369, 0, 0, 0, 1, 1,
0.6372104, -0.46078, 2.667932, 1, 1, 1, 1, 1,
0.6390724, 0.2741069, 2.061786, 1, 1, 1, 1, 1,
0.639149, 0.6099925, -0.8754761, 1, 1, 1, 1, 1,
0.6394617, 1.179722, 0.2750403, 1, 1, 1, 1, 1,
0.645898, -0.5732584, -0.6977414, 1, 1, 1, 1, 1,
0.6495278, -0.8722982, 2.168261, 1, 1, 1, 1, 1,
0.6519861, -0.9816612, 1.678892, 1, 1, 1, 1, 1,
0.6593063, -1.985638, 0.8084151, 1, 1, 1, 1, 1,
0.6597516, 2.829378, 0.4339625, 1, 1, 1, 1, 1,
0.6598437, 0.3844357, 1.721106, 1, 1, 1, 1, 1,
0.6630522, -3.291272, 3.871678, 1, 1, 1, 1, 1,
0.6645939, 0.07309206, 1.033364, 1, 1, 1, 1, 1,
0.6654192, 1.133391, 2.354844, 1, 1, 1, 1, 1,
0.6782203, -1.866252, 0.5263375, 1, 1, 1, 1, 1,
0.6821321, -0.5772384, 1.800559, 1, 1, 1, 1, 1,
0.6887374, 0.6663507, -0.9172757, 0, 0, 1, 1, 1,
0.6909603, 0.1289036, 1.878686, 1, 0, 0, 1, 1,
0.6957119, -1.790641, 1.446733, 1, 0, 0, 1, 1,
0.6957918, -0.6601719, 1.807403, 1, 0, 0, 1, 1,
0.6985167, -0.5814905, 3.767034, 1, 0, 0, 1, 1,
0.7007883, -0.2062761, 0.2732213, 1, 0, 0, 1, 1,
0.7017175, -1.78749, 2.066046, 0, 0, 0, 1, 1,
0.7030936, -0.8579164, 3.934942, 0, 0, 0, 1, 1,
0.7033664, -1.340716, 0.9028075, 0, 0, 0, 1, 1,
0.7114212, -0.05885294, 2.81894, 0, 0, 0, 1, 1,
0.7129031, -1.179091, 4.683483, 0, 0, 0, 1, 1,
0.7194064, 1.313155, -1.30536, 0, 0, 0, 1, 1,
0.7194108, 1.974208, 0.3061407, 0, 0, 0, 1, 1,
0.7260355, 0.6257845, 2.719242, 1, 1, 1, 1, 1,
0.7373682, 1.760521, 0.4194711, 1, 1, 1, 1, 1,
0.7381362, -1.29868, 2.279691, 1, 1, 1, 1, 1,
0.7387736, -0.1632623, 1.77824, 1, 1, 1, 1, 1,
0.7390213, 0.9409314, 1.646849, 1, 1, 1, 1, 1,
0.7426264, -0.2865, 2.064187, 1, 1, 1, 1, 1,
0.7438846, 1.049099, 0.391078, 1, 1, 1, 1, 1,
0.7454932, 1.960958, 0.1141934, 1, 1, 1, 1, 1,
0.7537145, 3.316553, 0.1879195, 1, 1, 1, 1, 1,
0.7609213, -1.319186, 0.1709299, 1, 1, 1, 1, 1,
0.7632086, 0.2621498, -0.2811127, 1, 1, 1, 1, 1,
0.7731812, 1.870317, -0.9529324, 1, 1, 1, 1, 1,
0.7762444, -0.4606766, 3.297687, 1, 1, 1, 1, 1,
0.7916727, 0.9978111, 1.255023, 1, 1, 1, 1, 1,
0.7929433, 0.3292732, 1.224161, 1, 1, 1, 1, 1,
0.7933784, 0.3114333, 1.058926, 0, 0, 1, 1, 1,
0.7994584, 1.030462, 1.742207, 1, 0, 0, 1, 1,
0.8070495, 1.251041, 2.389879, 1, 0, 0, 1, 1,
0.8118067, -0.1697436, 1.869021, 1, 0, 0, 1, 1,
0.8124633, -1.17426, 1.026979, 1, 0, 0, 1, 1,
0.8180088, 1.239079, 1.535965, 1, 0, 0, 1, 1,
0.8185605, -0.7717651, 2.26442, 0, 0, 0, 1, 1,
0.8304271, 0.8643655, 1.569873, 0, 0, 0, 1, 1,
0.83979, -1.746089, 2.853639, 0, 0, 0, 1, 1,
0.8411483, -0.3485086, 1.92795, 0, 0, 0, 1, 1,
0.842698, -1.381675, 4.144679, 0, 0, 0, 1, 1,
0.8428872, 0.2720758, -0.1588053, 0, 0, 0, 1, 1,
0.8479454, -1.383526, 3.096613, 0, 0, 0, 1, 1,
0.8506495, 1.914339, -0.6927883, 1, 1, 1, 1, 1,
0.8530275, -0.2033609, 2.410177, 1, 1, 1, 1, 1,
0.8550706, 0.7524274, 1.286011, 1, 1, 1, 1, 1,
0.8562428, -0.6092343, 1.802435, 1, 1, 1, 1, 1,
0.8593329, -1.438882, 1.826446, 1, 1, 1, 1, 1,
0.8593802, -1.038592, 2.28736, 1, 1, 1, 1, 1,
0.8612719, -1.070509, 3.274898, 1, 1, 1, 1, 1,
0.8624783, -1.94094, 3.995492, 1, 1, 1, 1, 1,
0.863831, 0.5739882, -1.900963, 1, 1, 1, 1, 1,
0.8659251, -0.8782888, 3.793305, 1, 1, 1, 1, 1,
0.8746575, 0.3542199, 2.166212, 1, 1, 1, 1, 1,
0.8838149, -0.07216191, 1.091722, 1, 1, 1, 1, 1,
0.8859165, 0.6619653, 1.034101, 1, 1, 1, 1, 1,
0.8887544, 0.8417, 2.144445, 1, 1, 1, 1, 1,
0.8895788, -0.8228802, 2.184544, 1, 1, 1, 1, 1,
0.8936731, -0.7363005, 0.9011834, 0, 0, 1, 1, 1,
0.901804, -0.05679937, 1.493251, 1, 0, 0, 1, 1,
0.9027458, -0.8508093, 1.986778, 1, 0, 0, 1, 1,
0.9080735, 0.297669, -0.6355599, 1, 0, 0, 1, 1,
0.9134685, -0.9249414, 3.043929, 1, 0, 0, 1, 1,
0.9135646, -1.525638, 2.586118, 1, 0, 0, 1, 1,
0.9140797, -0.3899607, 1.511977, 0, 0, 0, 1, 1,
0.9146959, -0.6194481, 2.573132, 0, 0, 0, 1, 1,
0.915172, -0.6303554, 2.430259, 0, 0, 0, 1, 1,
0.919054, -2.055947, 2.126951, 0, 0, 0, 1, 1,
0.9327346, -0.1475806, 0.6846235, 0, 0, 0, 1, 1,
0.935376, -1.491384, 3.586593, 0, 0, 0, 1, 1,
0.9367772, 0.02902204, 0.9069882, 0, 0, 0, 1, 1,
0.9381224, 0.4949983, 1.473729, 1, 1, 1, 1, 1,
0.9431602, -0.3859728, 2.099622, 1, 1, 1, 1, 1,
0.9536924, 0.3544491, 2.167098, 1, 1, 1, 1, 1,
0.9570721, -1.891896, 1.481365, 1, 1, 1, 1, 1,
0.9659497, -0.4405225, 3.18533, 1, 1, 1, 1, 1,
0.9680033, -0.6424335, 3.035054, 1, 1, 1, 1, 1,
0.9691535, -0.8215887, 3.000962, 1, 1, 1, 1, 1,
0.969244, 0.5172683, 1.77627, 1, 1, 1, 1, 1,
0.9701141, -0.919952, 1.74809, 1, 1, 1, 1, 1,
0.9710471, 0.1153902, 0.2027773, 1, 1, 1, 1, 1,
0.9739055, -0.09538414, 2.0545, 1, 1, 1, 1, 1,
0.9827998, 0.3673644, 3.838504, 1, 1, 1, 1, 1,
0.9843628, -1.346793, 1.880774, 1, 1, 1, 1, 1,
0.9894606, 0.01690577, 3.367321, 1, 1, 1, 1, 1,
0.9903628, 1.177926, 1.829095, 1, 1, 1, 1, 1,
0.9939213, -0.1125507, 2.424814, 0, 0, 1, 1, 1,
0.9981505, 1.149912, -1.088446, 1, 0, 0, 1, 1,
0.9995462, -0.854872, 1.519067, 1, 0, 0, 1, 1,
0.9996966, -0.3629003, 3.807852, 1, 0, 0, 1, 1,
1.010026, 0.3602819, 0.9689791, 1, 0, 0, 1, 1,
1.014044, -1.36713, 4.181411, 1, 0, 0, 1, 1,
1.017281, -0.3558292, 2.408667, 0, 0, 0, 1, 1,
1.017998, 0.1437262, 1.826436, 0, 0, 0, 1, 1,
1.026439, -0.1466829, 0.5243129, 0, 0, 0, 1, 1,
1.034276, -0.6741235, 3.043483, 0, 0, 0, 1, 1,
1.036201, -1.210913, 2.311043, 0, 0, 0, 1, 1,
1.037066, -0.9634783, 3.557682, 0, 0, 0, 1, 1,
1.040876, 0.5127881, 0.2611052, 0, 0, 0, 1, 1,
1.044761, 0.2629492, 0.7280834, 1, 1, 1, 1, 1,
1.047894, 1.637833, 0.6822679, 1, 1, 1, 1, 1,
1.061913, -0.6532727, 3.439978, 1, 1, 1, 1, 1,
1.063986, 1.731692, 0.7037905, 1, 1, 1, 1, 1,
1.065766, 1.30696, 2.511207, 1, 1, 1, 1, 1,
1.066051, -0.9274058, 2.392782, 1, 1, 1, 1, 1,
1.07074, -0.7677242, 2.927603, 1, 1, 1, 1, 1,
1.071069, 0.4495836, 0.85566, 1, 1, 1, 1, 1,
1.071448, 0.8904623, 1.795751, 1, 1, 1, 1, 1,
1.073801, -0.1846742, 2.929336, 1, 1, 1, 1, 1,
1.074733, 0.5712669, 0.6943688, 1, 1, 1, 1, 1,
1.086185, 0.1389327, 2.886313, 1, 1, 1, 1, 1,
1.086451, -0.7784541, 0.9522442, 1, 1, 1, 1, 1,
1.091586, -0.6001483, 2.569989, 1, 1, 1, 1, 1,
1.094817, -0.3346172, 1.330166, 1, 1, 1, 1, 1,
1.097021, 0.3099857, 0.988299, 0, 0, 1, 1, 1,
1.10233, -2.081777, 2.418011, 1, 0, 0, 1, 1,
1.114455, -0.5031502, 0.3181713, 1, 0, 0, 1, 1,
1.116663, -0.864639, 1.894123, 1, 0, 0, 1, 1,
1.124226, -2.531283, 1.702944, 1, 0, 0, 1, 1,
1.137901, -0.8566262, 1.481377, 1, 0, 0, 1, 1,
1.146018, -0.8261203, 4.105365, 0, 0, 0, 1, 1,
1.154413, -0.6427627, 1.478434, 0, 0, 0, 1, 1,
1.161499, 1.660537, 0.6081843, 0, 0, 0, 1, 1,
1.162743, -0.3828439, 1.369532, 0, 0, 0, 1, 1,
1.182234, -0.9452015, 3.011785, 0, 0, 0, 1, 1,
1.182251, -0.5416756, 3.825172, 0, 0, 0, 1, 1,
1.191303, 1.091343, 0.9035726, 0, 0, 0, 1, 1,
1.198513, 0.5179539, 1.369785, 1, 1, 1, 1, 1,
1.199228, 2.386196, 0.2847778, 1, 1, 1, 1, 1,
1.19925, -0.4225189, 2.227556, 1, 1, 1, 1, 1,
1.200802, -1.024213, 2.793409, 1, 1, 1, 1, 1,
1.204363, 2.106641, -0.1456481, 1, 1, 1, 1, 1,
1.215107, 1.00596, 1.541811, 1, 1, 1, 1, 1,
1.216729, -1.530131, 3.106039, 1, 1, 1, 1, 1,
1.219239, 0.8624385, 0.4882095, 1, 1, 1, 1, 1,
1.221487, 1.827737, 2.016862, 1, 1, 1, 1, 1,
1.224929, -0.1530411, 1.643684, 1, 1, 1, 1, 1,
1.225975, -0.05193847, 0.2505667, 1, 1, 1, 1, 1,
1.236232, 1.021014, 1.247351, 1, 1, 1, 1, 1,
1.239985, 0.9493333, 1.996892, 1, 1, 1, 1, 1,
1.254809, 0.4225499, 1.878302, 1, 1, 1, 1, 1,
1.262609, 0.04359815, 0.8868955, 1, 1, 1, 1, 1,
1.271288, -0.310731, 0.8650374, 0, 0, 1, 1, 1,
1.272498, 1.296277, 1.687942, 1, 0, 0, 1, 1,
1.272805, -0.007815167, 2.102997, 1, 0, 0, 1, 1,
1.275159, -0.03067338, 1.352915, 1, 0, 0, 1, 1,
1.277935, -0.5891409, 1.240963, 1, 0, 0, 1, 1,
1.280893, 0.4921054, -0.7538102, 1, 0, 0, 1, 1,
1.288384, 1.198709, 0.5608982, 0, 0, 0, 1, 1,
1.295623, -0.2483154, 0.2551711, 0, 0, 0, 1, 1,
1.295747, 1.052287, 2.99328, 0, 0, 0, 1, 1,
1.309996, 0.8582824, 1.288756, 0, 0, 0, 1, 1,
1.310985, 0.8806094, 0.3236167, 0, 0, 0, 1, 1,
1.314077, 1.314622, -0.7939064, 0, 0, 0, 1, 1,
1.316603, 0.6460649, 2.039537, 0, 0, 0, 1, 1,
1.320174, 2.363101, 0.2098942, 1, 1, 1, 1, 1,
1.330591, 0.2626362, 0.6694091, 1, 1, 1, 1, 1,
1.344755, 0.1391603, 0.1294578, 1, 1, 1, 1, 1,
1.347778, 0.1432984, -0.012487, 1, 1, 1, 1, 1,
1.348102, -0.003161239, 1.080861, 1, 1, 1, 1, 1,
1.365307, 2.167404, 0.2180655, 1, 1, 1, 1, 1,
1.371585, 0.331563, 0.3241052, 1, 1, 1, 1, 1,
1.372602, 0.754569, 0.3270576, 1, 1, 1, 1, 1,
1.372838, -1.84427, 2.089103, 1, 1, 1, 1, 1,
1.392883, 1.38452, 1.583332, 1, 1, 1, 1, 1,
1.436154, 0.3023846, 1.827227, 1, 1, 1, 1, 1,
1.438787, 0.5775509, 1.226697, 1, 1, 1, 1, 1,
1.446322, -1.207174, 3.239902, 1, 1, 1, 1, 1,
1.447055, 1.395299, 1.691003, 1, 1, 1, 1, 1,
1.450641, 0.5438497, 0.4585336, 1, 1, 1, 1, 1,
1.45585, -0.2089635, 2.512886, 0, 0, 1, 1, 1,
1.4628, -0.7649807, 1.426442, 1, 0, 0, 1, 1,
1.468667, 0.01303895, 1.537889, 1, 0, 0, 1, 1,
1.47463, 1.556786, 1.221184, 1, 0, 0, 1, 1,
1.495601, -1.820421, 1.588715, 1, 0, 0, 1, 1,
1.503335, -0.6908299, 2.513829, 1, 0, 0, 1, 1,
1.503742, -0.7683663, 3.193247, 0, 0, 0, 1, 1,
1.509019, 0.0502973, 0.3524345, 0, 0, 0, 1, 1,
1.509376, 1.838882, 1.165992, 0, 0, 0, 1, 1,
1.510353, 1.406829, -0.7118112, 0, 0, 0, 1, 1,
1.510506, 0.6201453, 0.6008273, 0, 0, 0, 1, 1,
1.513806, 0.6872477, 1.229672, 0, 0, 0, 1, 1,
1.515772, 0.2076909, 1.272154, 0, 0, 0, 1, 1,
1.525185, 0.6321943, 0.4898967, 1, 1, 1, 1, 1,
1.538583, 0.8974606, 0.7709129, 1, 1, 1, 1, 1,
1.539499, -0.2875584, 1.280991, 1, 1, 1, 1, 1,
1.554035, -0.984548, 3.30695, 1, 1, 1, 1, 1,
1.571549, -1.033601, 1.616972, 1, 1, 1, 1, 1,
1.585589, -0.9888682, 3.70757, 1, 1, 1, 1, 1,
1.590725, -0.1796387, 1.552596, 1, 1, 1, 1, 1,
1.601446, -1.158045, 2.439137, 1, 1, 1, 1, 1,
1.604027, -1.530017, 2.503043, 1, 1, 1, 1, 1,
1.607013, -0.8802431, 2.695971, 1, 1, 1, 1, 1,
1.609906, 0.936069, -0.1315064, 1, 1, 1, 1, 1,
1.616189, 0.2036561, 2.259442, 1, 1, 1, 1, 1,
1.62691, 0.1049531, 1.068151, 1, 1, 1, 1, 1,
1.638605, 0.5285553, 1.181812, 1, 1, 1, 1, 1,
1.6462, -0.1260799, 2.348772, 1, 1, 1, 1, 1,
1.648001, 0.8157803, -0.01870378, 0, 0, 1, 1, 1,
1.651255, 1.825197, 0.5775399, 1, 0, 0, 1, 1,
1.653826, -1.606325, 3.207066, 1, 0, 0, 1, 1,
1.665679, -0.9133367, 0.4268964, 1, 0, 0, 1, 1,
1.675503, 1.358661, 1.814181, 1, 0, 0, 1, 1,
1.686337, 2.334825, 0.059177, 1, 0, 0, 1, 1,
1.690614, 1.629113, 0.3403443, 0, 0, 0, 1, 1,
1.694477, -0.1685022, 1.301785, 0, 0, 0, 1, 1,
1.694748, 0.6769539, 2.480236, 0, 0, 0, 1, 1,
1.708462, -0.4984333, 3.956402, 0, 0, 0, 1, 1,
1.72409, 0.1559068, 2.464037, 0, 0, 0, 1, 1,
1.732117, -1.227998, 2.036119, 0, 0, 0, 1, 1,
1.733917, 0.7009634, -0.1949245, 0, 0, 0, 1, 1,
1.770078, 1.206621, 0.2489805, 1, 1, 1, 1, 1,
1.772434, 0.6203973, 0.9087877, 1, 1, 1, 1, 1,
1.772637, -0.00140658, 1.804324, 1, 1, 1, 1, 1,
1.801961, -1.042913, 2.327816, 1, 1, 1, 1, 1,
1.841562, 0.6947461, 0.75814, 1, 1, 1, 1, 1,
1.843011, 0.7812576, 1.615773, 1, 1, 1, 1, 1,
1.858339, -0.2057277, 1.268997, 1, 1, 1, 1, 1,
1.877138, -0.07560965, 1.50016, 1, 1, 1, 1, 1,
1.96263, 0.7457983, 1.248286, 1, 1, 1, 1, 1,
1.992961, 0.683165, 1.260305, 1, 1, 1, 1, 1,
2.007345, 0.7369076, 2.343828, 1, 1, 1, 1, 1,
2.053555, -0.0990577, 1.144212, 1, 1, 1, 1, 1,
2.096575, 0.104268, 2.271987, 1, 1, 1, 1, 1,
2.190297, -0.2745909, 0.6756483, 1, 1, 1, 1, 1,
2.242309, -0.03756036, 1.022678, 1, 1, 1, 1, 1,
2.261281, -0.1940359, 1.025483, 0, 0, 1, 1, 1,
2.275946, 0.8052348, 0.4817762, 1, 0, 0, 1, 1,
2.290581, 0.5259698, 0.4011163, 1, 0, 0, 1, 1,
2.343748, -0.01082758, 1.985448, 1, 0, 0, 1, 1,
2.363405, -0.1210251, 1.312556, 1, 0, 0, 1, 1,
2.372401, 2.475182, 1.978583, 1, 0, 0, 1, 1,
2.4078, 1.105385, 1.103391, 0, 0, 0, 1, 1,
2.477237, -1.127424, 1.297051, 0, 0, 0, 1, 1,
2.518389, -0.1644404, 1.629557, 0, 0, 0, 1, 1,
2.537249, 0.07722085, 0.8052388, 0, 0, 0, 1, 1,
2.583171, -0.5197616, 1.938463, 0, 0, 0, 1, 1,
2.610856, 0.6594449, 1.145688, 0, 0, 0, 1, 1,
2.661029, 1.789275, 2.565714, 0, 0, 0, 1, 1,
2.679082, -0.9191216, 2.913804, 1, 1, 1, 1, 1,
2.789625, 0.6091201, 2.206296, 1, 1, 1, 1, 1,
2.955994, -0.08103581, 0.3286919, 1, 1, 1, 1, 1,
3.085704, 2.084695, 0.78653, 1, 1, 1, 1, 1,
3.186015, -2.030872, 1.227806, 1, 1, 1, 1, 1,
3.238654, 1.407575, 0.8223142, 1, 1, 1, 1, 1,
3.638405, 0.6507989, 1.657345, 1, 1, 1, 1, 1
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
var radius = 9.724716;
var distance = 34.15765;
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
mvMatrix.translate( -0.3652495, -0.01264048, 0.1583917 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.15765);
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
