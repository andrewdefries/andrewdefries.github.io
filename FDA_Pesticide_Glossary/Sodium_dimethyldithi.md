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
-3.134174, 0.8680625, -1.949657, 1, 0, 0, 1,
-2.954422, -0.8733478, -1.647737, 1, 0.007843138, 0, 1,
-2.795178, 1.757182, -1.607662, 1, 0.01176471, 0, 1,
-2.693718, -0.6448911, -0.02932323, 1, 0.01960784, 0, 1,
-2.686207, -0.9976866, -2.522879, 1, 0.02352941, 0, 1,
-2.638144, 1.386208, -0.6213909, 1, 0.03137255, 0, 1,
-2.615301, -0.0739793, -0.2141071, 1, 0.03529412, 0, 1,
-2.605481, -0.3799706, -3.031494, 1, 0.04313726, 0, 1,
-2.5904, -0.7093858, -3.099067, 1, 0.04705882, 0, 1,
-2.568674, -1.011592, -0.3478234, 1, 0.05490196, 0, 1,
-2.534054, -1.560555, -1.078763, 1, 0.05882353, 0, 1,
-2.523853, 0.6933741, -2.383179, 1, 0.06666667, 0, 1,
-2.490031, -1.435221, -1.515019, 1, 0.07058824, 0, 1,
-2.486309, 0.9367655, -1.276153, 1, 0.07843138, 0, 1,
-2.444651, -0.1584872, -2.309783, 1, 0.08235294, 0, 1,
-2.198354, -0.5907533, -2.310557, 1, 0.09019608, 0, 1,
-2.184475, -1.361915, -0.9390903, 1, 0.09411765, 0, 1,
-2.071547, 1.902033, -1.061743, 1, 0.1019608, 0, 1,
-2.036048, 0.9215981, -2.024799, 1, 0.1098039, 0, 1,
-2.020264, 0.02876136, -0.3616287, 1, 0.1137255, 0, 1,
-2.017261, -1.882486, -3.336561, 1, 0.1215686, 0, 1,
-1.999192, 1.162308, -1.559511, 1, 0.1254902, 0, 1,
-1.977479, 0.5081795, -1.089419, 1, 0.1333333, 0, 1,
-1.906153, -0.6195572, -2.399274, 1, 0.1372549, 0, 1,
-1.897402, 1.433174, -0.651643, 1, 0.145098, 0, 1,
-1.89681, -1.352557, -3.064896, 1, 0.1490196, 0, 1,
-1.887447, 0.8316525, -0.6528062, 1, 0.1568628, 0, 1,
-1.839942, -1.12624, -2.307932, 1, 0.1607843, 0, 1,
-1.835196, -0.4887899, -1.873636, 1, 0.1686275, 0, 1,
-1.815351, 1.113671, -0.3266317, 1, 0.172549, 0, 1,
-1.790419, -0.7991515, -0.9507059, 1, 0.1803922, 0, 1,
-1.78616, 2.194891, -0.6411038, 1, 0.1843137, 0, 1,
-1.784119, 0.1680472, -1.978754, 1, 0.1921569, 0, 1,
-1.757723, -0.3665841, -2.535844, 1, 0.1960784, 0, 1,
-1.746985, 0.6793375, -2.301004, 1, 0.2039216, 0, 1,
-1.746328, 0.893922, -1.70852, 1, 0.2117647, 0, 1,
-1.745008, -1.170966, -2.018411, 1, 0.2156863, 0, 1,
-1.734084, -1.13214, -0.1561598, 1, 0.2235294, 0, 1,
-1.733049, -0.8851571, -3.161855, 1, 0.227451, 0, 1,
-1.717535, -0.2234167, -1.477361, 1, 0.2352941, 0, 1,
-1.714407, -1.023207, -2.84287, 1, 0.2392157, 0, 1,
-1.689338, 0.3242875, -1.037205, 1, 0.2470588, 0, 1,
-1.686286, 0.4457217, 0.2924053, 1, 0.2509804, 0, 1,
-1.675609, -0.08937389, -2.986778, 1, 0.2588235, 0, 1,
-1.671627, 0.1567182, -2.800134, 1, 0.2627451, 0, 1,
-1.670664, -1.147292, -2.433727, 1, 0.2705882, 0, 1,
-1.641268, 1.179523, 0.9203733, 1, 0.2745098, 0, 1,
-1.632039, 1.966098, 0.1760429, 1, 0.282353, 0, 1,
-1.627916, -0.08963896, -1.768071, 1, 0.2862745, 0, 1,
-1.615845, -0.2980005, -1.270951, 1, 0.2941177, 0, 1,
-1.595879, 0.2214188, -1.06762, 1, 0.3019608, 0, 1,
-1.593262, -0.08128142, -1.748589, 1, 0.3058824, 0, 1,
-1.584581, 0.2185195, -1.32982, 1, 0.3137255, 0, 1,
-1.577038, -0.7437807, -1.6238, 1, 0.3176471, 0, 1,
-1.570925, 0.01320945, -1.379055, 1, 0.3254902, 0, 1,
-1.565391, -0.6832847, -2.201421, 1, 0.3294118, 0, 1,
-1.551684, -1.040889, -1.445324, 1, 0.3372549, 0, 1,
-1.550864, 0.3477537, -0.3118509, 1, 0.3411765, 0, 1,
-1.536629, 0.8129881, -0.09507148, 1, 0.3490196, 0, 1,
-1.535955, -0.0003208762, -0.854806, 1, 0.3529412, 0, 1,
-1.535389, -0.2616503, 1.190763, 1, 0.3607843, 0, 1,
-1.528151, -0.3033442, -2.525222, 1, 0.3647059, 0, 1,
-1.526363, -0.7371335, -0.7926133, 1, 0.372549, 0, 1,
-1.521351, 1.177078, -1.634439, 1, 0.3764706, 0, 1,
-1.51835, 0.6009441, -1.419313, 1, 0.3843137, 0, 1,
-1.499526, -2.261438, -2.600228, 1, 0.3882353, 0, 1,
-1.490847, 0.1390566, -3.353384, 1, 0.3960784, 0, 1,
-1.488081, -1.125886, -2.132266, 1, 0.4039216, 0, 1,
-1.487649, -0.9227069, -1.325588, 1, 0.4078431, 0, 1,
-1.462957, 2.072022, -0.3615589, 1, 0.4156863, 0, 1,
-1.456668, -0.6130391, -2.141231, 1, 0.4196078, 0, 1,
-1.448701, 0.4847098, -0.9005527, 1, 0.427451, 0, 1,
-1.440982, 0.4817951, -2.479414, 1, 0.4313726, 0, 1,
-1.421235, 0.519356, -3.245554, 1, 0.4392157, 0, 1,
-1.414785, -0.6520009, -1.669541, 1, 0.4431373, 0, 1,
-1.412937, 0.2194708, -0.02817225, 1, 0.4509804, 0, 1,
-1.408615, 1.962336, -2.160159, 1, 0.454902, 0, 1,
-1.396621, 0.8254175, -1.638907, 1, 0.4627451, 0, 1,
-1.395637, 0.7712365, -1.325942, 1, 0.4666667, 0, 1,
-1.391192, 0.06608126, -1.417174, 1, 0.4745098, 0, 1,
-1.384543, -1.504887, -1.869972, 1, 0.4784314, 0, 1,
-1.377953, 0.3915142, -2.134848, 1, 0.4862745, 0, 1,
-1.376079, 0.4322965, -1.471471, 1, 0.4901961, 0, 1,
-1.365054, -0.3604137, -0.4732389, 1, 0.4980392, 0, 1,
-1.354922, 0.2056278, -2.288553, 1, 0.5058824, 0, 1,
-1.337867, -0.3079521, -1.795025, 1, 0.509804, 0, 1,
-1.318739, 0.1055794, -1.344347, 1, 0.5176471, 0, 1,
-1.315872, 0.625057, -0.7848268, 1, 0.5215687, 0, 1,
-1.304316, -0.4999781, -2.30619, 1, 0.5294118, 0, 1,
-1.303806, 0.3502039, -0.5411679, 1, 0.5333334, 0, 1,
-1.271243, -0.9142757, -1.888161, 1, 0.5411765, 0, 1,
-1.254895, -1.045154, -1.461695, 1, 0.5450981, 0, 1,
-1.236091, 1.932864, -0.09422108, 1, 0.5529412, 0, 1,
-1.236077, 0.3252681, -1.15091, 1, 0.5568628, 0, 1,
-1.23398, -0.2391724, -0.6740331, 1, 0.5647059, 0, 1,
-1.232955, 1.377007, -2.3552, 1, 0.5686275, 0, 1,
-1.226767, -0.1543332, -0.5443853, 1, 0.5764706, 0, 1,
-1.211596, -0.5056864, -2.652142, 1, 0.5803922, 0, 1,
-1.209527, -1.391029, -2.860584, 1, 0.5882353, 0, 1,
-1.208252, -2.252212, -1.91135, 1, 0.5921569, 0, 1,
-1.208042, 1.111772, -0.3266524, 1, 0.6, 0, 1,
-1.203193, -0.2961647, -2.037019, 1, 0.6078432, 0, 1,
-1.201133, 0.09044241, -2.201807, 1, 0.6117647, 0, 1,
-1.192824, 0.8395808, -1.915255, 1, 0.6196079, 0, 1,
-1.164309, 0.6308627, -1.299961, 1, 0.6235294, 0, 1,
-1.155428, 1.515265, 0.3985798, 1, 0.6313726, 0, 1,
-1.146855, -0.3826656, -1.809726, 1, 0.6352941, 0, 1,
-1.146307, 0.5157862, -2.931626, 1, 0.6431373, 0, 1,
-1.135218, -0.09118205, -1.169756, 1, 0.6470588, 0, 1,
-1.12927, -0.9562934, -1.990376, 1, 0.654902, 0, 1,
-1.127822, -0.3145583, -1.397755, 1, 0.6588235, 0, 1,
-1.119789, -0.153949, -1.149199, 1, 0.6666667, 0, 1,
-1.11808, 1.717406, -0.03378186, 1, 0.6705883, 0, 1,
-1.106944, -0.5370296, -1.886716, 1, 0.6784314, 0, 1,
-1.10629, 0.5780514, -1.054396, 1, 0.682353, 0, 1,
-1.106251, 1.392468, -1.472382, 1, 0.6901961, 0, 1,
-1.101501, -0.3349026, -2.917351, 1, 0.6941177, 0, 1,
-1.10048, -0.3080238, -3.281729, 1, 0.7019608, 0, 1,
-1.094479, 0.8358768, -1.254711, 1, 0.7098039, 0, 1,
-1.089661, 0.3393396, 0.1064195, 1, 0.7137255, 0, 1,
-1.078737, 0.02813107, -0.7489406, 1, 0.7215686, 0, 1,
-1.073019, -1.090252, -3.526291, 1, 0.7254902, 0, 1,
-1.072224, 0.5162108, 0.06384303, 1, 0.7333333, 0, 1,
-1.06956, -0.2705035, -3.069952, 1, 0.7372549, 0, 1,
-1.065313, 0.1342826, -2.870205, 1, 0.7450981, 0, 1,
-1.063318, -1.708176, -1.722692, 1, 0.7490196, 0, 1,
-1.059907, 0.50087, -0.170355, 1, 0.7568628, 0, 1,
-1.059576, 1.132736, -1.07468, 1, 0.7607843, 0, 1,
-1.05788, -1.504867, -1.526118, 1, 0.7686275, 0, 1,
-1.047822, -0.02658965, -3.241002, 1, 0.772549, 0, 1,
-1.044969, 1.485641, -1.074664, 1, 0.7803922, 0, 1,
-1.043305, 0.708517, -2.809219, 1, 0.7843137, 0, 1,
-1.041685, 0.8383411, -0.05732509, 1, 0.7921569, 0, 1,
-1.031204, -1.637226, -0.9499197, 1, 0.7960784, 0, 1,
-1.026302, 0.7141332, -2.264404, 1, 0.8039216, 0, 1,
-1.025887, 0.05934548, -3.951466, 1, 0.8117647, 0, 1,
-1.024603, -1.400666, -2.635318, 1, 0.8156863, 0, 1,
-1.015713, 1.227808, -1.293869, 1, 0.8235294, 0, 1,
-1.010959, -0.8775496, -3.977752, 1, 0.827451, 0, 1,
-1.010201, -0.7805239, -0.6994306, 1, 0.8352941, 0, 1,
-1.009758, 0.3393734, -0.2665896, 1, 0.8392157, 0, 1,
-1.007876, 0.3238673, -0.867841, 1, 0.8470588, 0, 1,
-1.003849, -0.01499513, -2.145114, 1, 0.8509804, 0, 1,
-1.003305, 0.415204, 0.2002789, 1, 0.8588235, 0, 1,
-1.001318, -1.107435, -1.741501, 1, 0.8627451, 0, 1,
-1.000094, -0.7965837, -3.396302, 1, 0.8705882, 0, 1,
-0.9989747, -1.731224, -2.0146, 1, 0.8745098, 0, 1,
-0.9983357, -0.4640997, -3.60601, 1, 0.8823529, 0, 1,
-0.9963553, 0.7130287, 0.8760133, 1, 0.8862745, 0, 1,
-0.9962655, -1.083771, -2.174013, 1, 0.8941177, 0, 1,
-0.9929689, 0.9957311, -1.8687, 1, 0.8980392, 0, 1,
-0.9884539, -0.5574657, -2.331292, 1, 0.9058824, 0, 1,
-0.9872158, 0.162164, 0.09382223, 1, 0.9137255, 0, 1,
-0.9859866, 0.1352834, -2.735651, 1, 0.9176471, 0, 1,
-0.9825401, 1.489294, -0.3665072, 1, 0.9254902, 0, 1,
-0.9801062, 1.518932, -1.977648, 1, 0.9294118, 0, 1,
-0.9798208, -0.9535428, -2.859979, 1, 0.9372549, 0, 1,
-0.9752349, -0.7983081, -1.946899, 1, 0.9411765, 0, 1,
-0.9703773, -0.7647104, -4.090049, 1, 0.9490196, 0, 1,
-0.9661803, 1.196595, -1.150272, 1, 0.9529412, 0, 1,
-0.9632754, 0.6403568, -0.1636354, 1, 0.9607843, 0, 1,
-0.9575112, 0.6451483, -1.991559, 1, 0.9647059, 0, 1,
-0.9557142, 0.7833701, 0.377296, 1, 0.972549, 0, 1,
-0.9488705, 0.7448189, 0.8534385, 1, 0.9764706, 0, 1,
-0.9443213, 0.5100999, 0.6485805, 1, 0.9843137, 0, 1,
-0.9420598, 0.0190273, -2.157267, 1, 0.9882353, 0, 1,
-0.9376764, -0.6674424, -2.971789, 1, 0.9960784, 0, 1,
-0.9354085, 0.214633, -0.3515291, 0.9960784, 1, 0, 1,
-0.9334897, -0.2899021, -1.71408, 0.9921569, 1, 0, 1,
-0.9311236, -0.9528434, -3.377688, 0.9843137, 1, 0, 1,
-0.9308935, 0.4800433, -2.425265, 0.9803922, 1, 0, 1,
-0.9304315, -0.5813013, -1.928742, 0.972549, 1, 0, 1,
-0.9263416, 0.2340195, -2.751835, 0.9686275, 1, 0, 1,
-0.9261521, 0.4851261, 1.225349, 0.9607843, 1, 0, 1,
-0.9240445, -0.3053929, -1.165162, 0.9568627, 1, 0, 1,
-0.9221979, 1.428267, -2.254149, 0.9490196, 1, 0, 1,
-0.9193017, -0.8548328, -0.744682, 0.945098, 1, 0, 1,
-0.9185393, 0.3211633, -1.954663, 0.9372549, 1, 0, 1,
-0.9183664, -1.255043, -2.918696, 0.9333333, 1, 0, 1,
-0.9088061, 0.06144584, -1.624203, 0.9254902, 1, 0, 1,
-0.9037507, -0.8248861, -0.9215438, 0.9215686, 1, 0, 1,
-0.897226, -0.7436628, -2.18597, 0.9137255, 1, 0, 1,
-0.8961183, -0.6234974, -3.030766, 0.9098039, 1, 0, 1,
-0.8951052, 0.3777791, -0.3682471, 0.9019608, 1, 0, 1,
-0.8937734, -0.2265302, -0.9031914, 0.8941177, 1, 0, 1,
-0.8929566, 0.4978846, -0.7304785, 0.8901961, 1, 0, 1,
-0.890601, -1.716659, 0.1324016, 0.8823529, 1, 0, 1,
-0.890169, 0.6400579, -0.9603388, 0.8784314, 1, 0, 1,
-0.8894504, 0.9206575, -1.730378, 0.8705882, 1, 0, 1,
-0.8875744, 0.1830434, -3.433136, 0.8666667, 1, 0, 1,
-0.8820961, 2.538649, 0.9155397, 0.8588235, 1, 0, 1,
-0.8798968, 0.2900144, 0.2588521, 0.854902, 1, 0, 1,
-0.8752679, -0.1754986, -1.751206, 0.8470588, 1, 0, 1,
-0.8714343, 0.3542126, 0.3846932, 0.8431373, 1, 0, 1,
-0.8687184, -1.396476, -2.816647, 0.8352941, 1, 0, 1,
-0.8666548, -1.245708, -2.304931, 0.8313726, 1, 0, 1,
-0.863462, -1.757365, -3.39437, 0.8235294, 1, 0, 1,
-0.8626626, 1.377633, -1.421816, 0.8196079, 1, 0, 1,
-0.8556764, -0.02149549, -1.294092, 0.8117647, 1, 0, 1,
-0.8550031, 0.8973929, -1.206212, 0.8078431, 1, 0, 1,
-0.85274, 0.8865962, 0.08769095, 0.8, 1, 0, 1,
-0.847591, -2.033293, -4.143857, 0.7921569, 1, 0, 1,
-0.8462269, 0.3576515, -1.237663, 0.7882353, 1, 0, 1,
-0.8459704, -0.4871711, -3.582126, 0.7803922, 1, 0, 1,
-0.8415164, -0.663622, -2.521505, 0.7764706, 1, 0, 1,
-0.8391114, -1.552031, -1.904348, 0.7686275, 1, 0, 1,
-0.8369224, 0.1878287, -2.109103, 0.7647059, 1, 0, 1,
-0.8366619, -0.784411, -1.371184, 0.7568628, 1, 0, 1,
-0.8316532, 0.7668368, -0.5091031, 0.7529412, 1, 0, 1,
-0.8297123, 0.02429899, -3.14192, 0.7450981, 1, 0, 1,
-0.8285614, -0.8191881, -3.610856, 0.7411765, 1, 0, 1,
-0.8244367, 0.8814149, -0.9404382, 0.7333333, 1, 0, 1,
-0.8244357, 0.0798581, -0.2375795, 0.7294118, 1, 0, 1,
-0.8242057, -0.07830004, -2.028521, 0.7215686, 1, 0, 1,
-0.8209267, 1.350957, -0.5177376, 0.7176471, 1, 0, 1,
-0.8208863, 1.048408, -1.974728, 0.7098039, 1, 0, 1,
-0.8207715, 0.3252446, 1.042277, 0.7058824, 1, 0, 1,
-0.8110985, -0.2569188, -1.113885, 0.6980392, 1, 0, 1,
-0.8085289, 1.02504, -0.1925972, 0.6901961, 1, 0, 1,
-0.8036813, 0.7738008, -0.8513211, 0.6862745, 1, 0, 1,
-0.7961263, -0.8916827, -1.80733, 0.6784314, 1, 0, 1,
-0.7884483, 0.3382618, -2.099065, 0.6745098, 1, 0, 1,
-0.7777318, -0.8570541, -2.343636, 0.6666667, 1, 0, 1,
-0.7719893, 1.014801, -0.673165, 0.6627451, 1, 0, 1,
-0.7710411, 0.07973047, -1.218989, 0.654902, 1, 0, 1,
-0.7698859, -0.8477462, -2.028726, 0.6509804, 1, 0, 1,
-0.7662839, -1.075515, -2.520365, 0.6431373, 1, 0, 1,
-0.7646056, -0.7516974, -2.329288, 0.6392157, 1, 0, 1,
-0.7644122, 0.9135389, -0.5032247, 0.6313726, 1, 0, 1,
-0.7640452, -1.423351, -2.294511, 0.627451, 1, 0, 1,
-0.7562784, -0.01816348, -0.8921138, 0.6196079, 1, 0, 1,
-0.7556245, -0.7641042, -2.135804, 0.6156863, 1, 0, 1,
-0.7546834, 1.338709, -1.010992, 0.6078432, 1, 0, 1,
-0.7483686, -0.4583476, -2.846569, 0.6039216, 1, 0, 1,
-0.7462113, -0.04391714, -2.847587, 0.5960785, 1, 0, 1,
-0.7425752, 0.03537558, -1.767929, 0.5882353, 1, 0, 1,
-0.741847, 1.830495, -0.1041173, 0.5843138, 1, 0, 1,
-0.7409656, 0.1054496, -1.046621, 0.5764706, 1, 0, 1,
-0.7381941, 0.7726027, -0.4031734, 0.572549, 1, 0, 1,
-0.7369414, 0.4128711, -3.278991, 0.5647059, 1, 0, 1,
-0.7255324, -1.131113, -3.456307, 0.5607843, 1, 0, 1,
-0.7233424, -0.7224756, -2.169438, 0.5529412, 1, 0, 1,
-0.7211909, 1.349284, -1.270204, 0.5490196, 1, 0, 1,
-0.7189119, 0.7406783, -1.268554, 0.5411765, 1, 0, 1,
-0.7150077, -0.8985527, -2.949467, 0.5372549, 1, 0, 1,
-0.7135702, 0.7814071, -1.860894, 0.5294118, 1, 0, 1,
-0.7105715, 0.7196158, -0.985055, 0.5254902, 1, 0, 1,
-0.7094997, -0.7060086, -2.885554, 0.5176471, 1, 0, 1,
-0.7057801, -1.305393, -3.186022, 0.5137255, 1, 0, 1,
-0.6939803, -0.4145585, -0.9478533, 0.5058824, 1, 0, 1,
-0.6930776, 1.298679, 0.5498011, 0.5019608, 1, 0, 1,
-0.6916896, 0.3346736, -1.33092, 0.4941176, 1, 0, 1,
-0.6899891, -1.108764, -4.052748, 0.4862745, 1, 0, 1,
-0.6879062, -0.4991409, -1.745021, 0.4823529, 1, 0, 1,
-0.6807742, 0.3748703, 0.2699079, 0.4745098, 1, 0, 1,
-0.6800565, 1.08079, -0.3392608, 0.4705882, 1, 0, 1,
-0.6769807, 0.7343757, -0.1660903, 0.4627451, 1, 0, 1,
-0.6748548, -0.6373259, -3.479976, 0.4588235, 1, 0, 1,
-0.6683826, 0.2836077, -0.7820889, 0.4509804, 1, 0, 1,
-0.6662031, 0.6031071, -0.7750756, 0.4470588, 1, 0, 1,
-0.6583067, -0.9138545, -2.203589, 0.4392157, 1, 0, 1,
-0.6522758, 0.4609666, -0.3831298, 0.4352941, 1, 0, 1,
-0.6518241, -0.506837, -2.581013, 0.427451, 1, 0, 1,
-0.6515978, 0.3226287, 0.5345481, 0.4235294, 1, 0, 1,
-0.6454148, 0.3486716, -1.347533, 0.4156863, 1, 0, 1,
-0.6448847, 0.4908979, 0.6957443, 0.4117647, 1, 0, 1,
-0.6386818, -2.523955, -3.295111, 0.4039216, 1, 0, 1,
-0.6384835, -1.693365, -2.281743, 0.3960784, 1, 0, 1,
-0.6338954, 0.8312429, -3.341617, 0.3921569, 1, 0, 1,
-0.6299876, -0.1446188, -2.005113, 0.3843137, 1, 0, 1,
-0.6294544, -1.062228, -3.399513, 0.3803922, 1, 0, 1,
-0.6279035, 0.2601303, -0.2430676, 0.372549, 1, 0, 1,
-0.6275186, -0.5306904, -2.089981, 0.3686275, 1, 0, 1,
-0.6267884, 1.68046, 0.4153565, 0.3607843, 1, 0, 1,
-0.6230841, -1.592537, -3.326258, 0.3568628, 1, 0, 1,
-0.6224328, 1.396124, -0.4111793, 0.3490196, 1, 0, 1,
-0.6214967, 0.3878651, -2.343573, 0.345098, 1, 0, 1,
-0.6169682, -2.433741, -2.602079, 0.3372549, 1, 0, 1,
-0.6156639, 0.09263285, -1.115427, 0.3333333, 1, 0, 1,
-0.6033105, 0.5037069, -2.551743, 0.3254902, 1, 0, 1,
-0.5975326, -0.761151, -2.451103, 0.3215686, 1, 0, 1,
-0.5963056, 2.12468, 0.2093042, 0.3137255, 1, 0, 1,
-0.5936562, -0.6780797, -1.849706, 0.3098039, 1, 0, 1,
-0.5917158, 1.855863, -0.9943846, 0.3019608, 1, 0, 1,
-0.5899562, 1.388942, 0.02534849, 0.2941177, 1, 0, 1,
-0.5892498, 0.3738399, 0.4829142, 0.2901961, 1, 0, 1,
-0.5887892, 2.064003, -0.8587043, 0.282353, 1, 0, 1,
-0.5861773, -0.8778262, -3.816589, 0.2784314, 1, 0, 1,
-0.5776778, 0.03761923, -1.17646, 0.2705882, 1, 0, 1,
-0.5764673, -0.7836691, -1.616695, 0.2666667, 1, 0, 1,
-0.5752652, -0.4254788, -1.546861, 0.2588235, 1, 0, 1,
-0.5727706, 0.8266659, 0.5044439, 0.254902, 1, 0, 1,
-0.5724766, -0.1613174, -0.2349574, 0.2470588, 1, 0, 1,
-0.5651747, 0.4837533, 0.6158148, 0.2431373, 1, 0, 1,
-0.5627776, 0.1836493, -1.777067, 0.2352941, 1, 0, 1,
-0.5616134, 0.2014417, -0.004477599, 0.2313726, 1, 0, 1,
-0.5596703, -1.350691, -2.105574, 0.2235294, 1, 0, 1,
-0.5497084, -0.2689943, -1.944147, 0.2196078, 1, 0, 1,
-0.5473636, -1.162086, -2.348309, 0.2117647, 1, 0, 1,
-0.5400506, -0.1754636, -2.983279, 0.2078431, 1, 0, 1,
-0.5397868, 1.685161, 1.050715, 0.2, 1, 0, 1,
-0.5369115, 1.167101, 0.3448264, 0.1921569, 1, 0, 1,
-0.5336587, -1.020063, -3.325503, 0.1882353, 1, 0, 1,
-0.5328872, -0.9714453, -2.399535, 0.1803922, 1, 0, 1,
-0.5287985, 0.5953957, -0.172254, 0.1764706, 1, 0, 1,
-0.5225348, -1.180826, -4.072127, 0.1686275, 1, 0, 1,
-0.5170657, -0.8990619, -3.006526, 0.1647059, 1, 0, 1,
-0.5169171, 0.6258712, -0.3353576, 0.1568628, 1, 0, 1,
-0.5168364, -1.601124, -3.201464, 0.1529412, 1, 0, 1,
-0.516221, 1.264048, -1.715048, 0.145098, 1, 0, 1,
-0.5138105, 1.281851, 0.6066614, 0.1411765, 1, 0, 1,
-0.5129874, -0.3494487, -1.363838, 0.1333333, 1, 0, 1,
-0.5098811, -1.184317, -4.543828, 0.1294118, 1, 0, 1,
-0.5019386, 0.7793281, -2.04923, 0.1215686, 1, 0, 1,
-0.501717, -1.294675, -2.334845, 0.1176471, 1, 0, 1,
-0.5002931, -0.4424237, -0.494905, 0.1098039, 1, 0, 1,
-0.4948969, 1.581841, -1.046658, 0.1058824, 1, 0, 1,
-0.4907086, -0.2588656, -2.514241, 0.09803922, 1, 0, 1,
-0.4900089, 0.814199, 0.1062422, 0.09019608, 1, 0, 1,
-0.4889166, 0.9395809, -1.482943, 0.08627451, 1, 0, 1,
-0.4832223, 1.80314, -1.986474, 0.07843138, 1, 0, 1,
-0.4799453, -2.074528, -2.8549, 0.07450981, 1, 0, 1,
-0.479832, -1.008024, -2.086089, 0.06666667, 1, 0, 1,
-0.4793521, -0.9419335, -3.436809, 0.0627451, 1, 0, 1,
-0.476673, -1.962439, -2.575648, 0.05490196, 1, 0, 1,
-0.4732361, -0.9109347, -4.051606, 0.05098039, 1, 0, 1,
-0.4709106, -0.6623551, -2.726678, 0.04313726, 1, 0, 1,
-0.4682153, 0.3368741, 0.5154484, 0.03921569, 1, 0, 1,
-0.4674996, -0.09330076, -1.891741, 0.03137255, 1, 0, 1,
-0.4638118, 0.4310497, -1.113179, 0.02745098, 1, 0, 1,
-0.4619244, -1.051772, -2.453071, 0.01960784, 1, 0, 1,
-0.4614223, -0.5486289, -3.276634, 0.01568628, 1, 0, 1,
-0.459612, 0.402498, -1.451631, 0.007843138, 1, 0, 1,
-0.4584765, 1.473128, -0.08129493, 0.003921569, 1, 0, 1,
-0.4576355, -0.1540725, -2.523191, 0, 1, 0.003921569, 1,
-0.4518649, -0.2215112, -2.749326, 0, 1, 0.01176471, 1,
-0.4500747, -0.6539804, -2.135895, 0, 1, 0.01568628, 1,
-0.4491207, -0.235393, -1.483911, 0, 1, 0.02352941, 1,
-0.4473222, -1.325055, -4.302234, 0, 1, 0.02745098, 1,
-0.4452545, 0.8436232, -0.04850693, 0, 1, 0.03529412, 1,
-0.4329261, -0.4787115, -1.286831, 0, 1, 0.03921569, 1,
-0.4323446, 0.7404563, -0.2333383, 0, 1, 0.04705882, 1,
-0.4316056, -1.074754, -3.990469, 0, 1, 0.05098039, 1,
-0.4303509, -0.5498292, -3.034462, 0, 1, 0.05882353, 1,
-0.4288146, 0.0670194, -4.589776, 0, 1, 0.0627451, 1,
-0.4287868, -1.400597, -2.91749, 0, 1, 0.07058824, 1,
-0.4286561, 1.2347, -2.340991, 0, 1, 0.07450981, 1,
-0.4275967, 0.7299618, -0.01759876, 0, 1, 0.08235294, 1,
-0.4231479, -0.2994921, -1.262566, 0, 1, 0.08627451, 1,
-0.4224292, -0.9339186, -3.417343, 0, 1, 0.09411765, 1,
-0.4161745, -0.7754793, -2.481256, 0, 1, 0.1019608, 1,
-0.4159509, -1.873974, -4.255689, 0, 1, 0.1058824, 1,
-0.4102916, -2.020322, -1.856199, 0, 1, 0.1137255, 1,
-0.4092315, -0.02827427, -1.309675, 0, 1, 0.1176471, 1,
-0.4079967, -0.6821076, -2.72111, 0, 1, 0.1254902, 1,
-0.4079849, -0.5191269, -1.812924, 0, 1, 0.1294118, 1,
-0.4060758, 0.8514337, -0.6461866, 0, 1, 0.1372549, 1,
-0.4001329, -1.184181, -2.58621, 0, 1, 0.1411765, 1,
-0.3976904, -1.038338, -2.654827, 0, 1, 0.1490196, 1,
-0.3942581, 0.7561197, -1.14402, 0, 1, 0.1529412, 1,
-0.3921226, -2.306881, -2.461555, 0, 1, 0.1607843, 1,
-0.391031, -0.8118557, -3.203516, 0, 1, 0.1647059, 1,
-0.3905452, 0.03139693, -1.373993, 0, 1, 0.172549, 1,
-0.3892846, 0.2573633, -2.137401, 0, 1, 0.1764706, 1,
-0.3883995, -2.606982, -2.424616, 0, 1, 0.1843137, 1,
-0.3867082, 1.108193, 0.6067488, 0, 1, 0.1882353, 1,
-0.3861476, 0.3250317, -1.257268, 0, 1, 0.1960784, 1,
-0.3837178, -1.347004, -2.731312, 0, 1, 0.2039216, 1,
-0.3813448, -0.5922666, -2.002034, 0, 1, 0.2078431, 1,
-0.3784031, 0.3072049, -1.80586, 0, 1, 0.2156863, 1,
-0.3735664, -0.3774306, -2.969591, 0, 1, 0.2196078, 1,
-0.3708463, 0.4541073, 2.144232, 0, 1, 0.227451, 1,
-0.3688541, -0.7739007, -2.613429, 0, 1, 0.2313726, 1,
-0.3665971, 0.1289711, -1.369223, 0, 1, 0.2392157, 1,
-0.3582507, 0.9047723, -1.696249, 0, 1, 0.2431373, 1,
-0.3513253, -0.637796, -3.172265, 0, 1, 0.2509804, 1,
-0.3454939, -0.7346537, -1.879406, 0, 1, 0.254902, 1,
-0.3435192, 0.5231334, -1.415121, 0, 1, 0.2627451, 1,
-0.3405808, 0.8667663, -0.602863, 0, 1, 0.2666667, 1,
-0.3399884, 1.347279, -1.064972, 0, 1, 0.2745098, 1,
-0.3367664, -0.51264, -2.733341, 0, 1, 0.2784314, 1,
-0.3329205, -1.009209, -1.280504, 0, 1, 0.2862745, 1,
-0.3276898, 0.2072277, -0.3573621, 0, 1, 0.2901961, 1,
-0.3268164, 1.687356, -1.549556, 0, 1, 0.2980392, 1,
-0.3256854, 0.6048434, -1.807691, 0, 1, 0.3058824, 1,
-0.3236705, -0.7820277, -2.351275, 0, 1, 0.3098039, 1,
-0.3203213, 1.53181, -0.2790284, 0, 1, 0.3176471, 1,
-0.3168702, -1.147039, -5.595272, 0, 1, 0.3215686, 1,
-0.3155819, 0.8671905, -0.8446623, 0, 1, 0.3294118, 1,
-0.3149657, 0.7454559, 1.844319, 0, 1, 0.3333333, 1,
-0.3104799, 0.7391853, 0.5873617, 0, 1, 0.3411765, 1,
-0.3073856, 0.2227252, -0.2400507, 0, 1, 0.345098, 1,
-0.3054345, 1.584299, 0.6210423, 0, 1, 0.3529412, 1,
-0.3041847, 0.1438603, -1.101428, 0, 1, 0.3568628, 1,
-0.3035435, 0.01292916, -2.239065, 0, 1, 0.3647059, 1,
-0.2976458, -1.503688, -3.002958, 0, 1, 0.3686275, 1,
-0.2918237, 0.6217163, -0.3462574, 0, 1, 0.3764706, 1,
-0.2890088, 0.1813727, -0.3816888, 0, 1, 0.3803922, 1,
-0.2872589, 0.4926827, -1.869034, 0, 1, 0.3882353, 1,
-0.2866676, -1.131346, -3.778854, 0, 1, 0.3921569, 1,
-0.2858278, -0.3340865, -3.603344, 0, 1, 0.4, 1,
-0.2783661, -0.8580527, -1.85992, 0, 1, 0.4078431, 1,
-0.2782466, -0.5777692, -3.66078, 0, 1, 0.4117647, 1,
-0.2754814, 0.2983511, -1.350573, 0, 1, 0.4196078, 1,
-0.2606073, -0.8798946, -6.400138, 0, 1, 0.4235294, 1,
-0.2579378, -1.370499, -3.738625, 0, 1, 0.4313726, 1,
-0.2554038, 0.6481544, -0.08430598, 0, 1, 0.4352941, 1,
-0.2548941, -0.08626833, -2.300658, 0, 1, 0.4431373, 1,
-0.2511508, -1.091797, -2.007254, 0, 1, 0.4470588, 1,
-0.2460109, -0.132046, -2.594297, 0, 1, 0.454902, 1,
-0.2458123, 0.3534008, -1.381519, 0, 1, 0.4588235, 1,
-0.2430431, -0.2136501, -2.995869, 0, 1, 0.4666667, 1,
-0.2425129, -0.3684707, -2.09361, 0, 1, 0.4705882, 1,
-0.2374484, -1.214406, -3.40349, 0, 1, 0.4784314, 1,
-0.2354457, -2.127863, -2.533287, 0, 1, 0.4823529, 1,
-0.2343245, -0.7647969, -0.326054, 0, 1, 0.4901961, 1,
-0.2303051, -0.4409092, -1.760352, 0, 1, 0.4941176, 1,
-0.2181713, 0.3819291, 0.1228626, 0, 1, 0.5019608, 1,
-0.2164724, 1.208767, -0.8952085, 0, 1, 0.509804, 1,
-0.2146803, -1.186271, -4.694168, 0, 1, 0.5137255, 1,
-0.2087479, 0.2745684, -0.4092811, 0, 1, 0.5215687, 1,
-0.2065316, 0.3958069, -0.9374788, 0, 1, 0.5254902, 1,
-0.2051674, -0.4737481, -2.080191, 0, 1, 0.5333334, 1,
-0.2015603, 0.047059, -1.762544, 0, 1, 0.5372549, 1,
-0.1958617, -1.09638, -2.910253, 0, 1, 0.5450981, 1,
-0.1888946, 1.298238, 2.27074, 0, 1, 0.5490196, 1,
-0.186959, 0.8271064, -2.121593, 0, 1, 0.5568628, 1,
-0.1833045, -0.01858145, -0.2793037, 0, 1, 0.5607843, 1,
-0.1826082, -0.2028799, -3.008459, 0, 1, 0.5686275, 1,
-0.1766777, 0.8019764, 0.06901114, 0, 1, 0.572549, 1,
-0.1757136, 0.3767648, 0.1627455, 0, 1, 0.5803922, 1,
-0.1728999, -1.469642, -2.318205, 0, 1, 0.5843138, 1,
-0.1712811, -0.8097129, -3.498967, 0, 1, 0.5921569, 1,
-0.1710169, -0.6426415, -1.267921, 0, 1, 0.5960785, 1,
-0.1679719, 0.5996227, -0.79666, 0, 1, 0.6039216, 1,
-0.1633932, 1.13632, -0.1051625, 0, 1, 0.6117647, 1,
-0.1611599, 0.7559115, 1.41354, 0, 1, 0.6156863, 1,
-0.1610856, 0.5410054, -1.036694, 0, 1, 0.6235294, 1,
-0.1589331, -1.62313, -2.851147, 0, 1, 0.627451, 1,
-0.1570032, 1.357245, 0.7532426, 0, 1, 0.6352941, 1,
-0.1553014, 0.5189686, 0.1013056, 0, 1, 0.6392157, 1,
-0.1467016, 1.256214, 0.621938, 0, 1, 0.6470588, 1,
-0.1432737, 0.6337458, -0.2595614, 0, 1, 0.6509804, 1,
-0.1419786, -0.2198627, -1.953639, 0, 1, 0.6588235, 1,
-0.1406237, 1.312582, 0.1577486, 0, 1, 0.6627451, 1,
-0.1379353, 0.009217084, -3.40719, 0, 1, 0.6705883, 1,
-0.1376516, 0.3562447, 0.6727332, 0, 1, 0.6745098, 1,
-0.1371044, 2.843787, 0.5009543, 0, 1, 0.682353, 1,
-0.1343237, 0.9610468, -0.4784354, 0, 1, 0.6862745, 1,
-0.1330351, 0.311942, 0.3476307, 0, 1, 0.6941177, 1,
-0.1320642, -0.7614659, -1.261965, 0, 1, 0.7019608, 1,
-0.1285082, 0.9875565, -0.07302193, 0, 1, 0.7058824, 1,
-0.1268591, -1.314769, -3.185289, 0, 1, 0.7137255, 1,
-0.1229575, -0.1008251, -2.916467, 0, 1, 0.7176471, 1,
-0.1229486, 0.1120788, -1.068115, 0, 1, 0.7254902, 1,
-0.1163403, 0.8145362, 2.036668, 0, 1, 0.7294118, 1,
-0.1140273, -0.4755263, -2.322473, 0, 1, 0.7372549, 1,
-0.1137994, 0.6227733, -2.116079, 0, 1, 0.7411765, 1,
-0.1116138, -0.7769556, -2.68023, 0, 1, 0.7490196, 1,
-0.1076564, -1.205301, -2.486558, 0, 1, 0.7529412, 1,
-0.1064162, 0.6655973, 0.2863588, 0, 1, 0.7607843, 1,
-0.1046, -2.583788, -6.213486, 0, 1, 0.7647059, 1,
-0.1003789, -1.321964, -1.515825, 0, 1, 0.772549, 1,
-0.09994676, -1.499895, -2.398127, 0, 1, 0.7764706, 1,
-0.09939226, 0.9721501, -1.553286, 0, 1, 0.7843137, 1,
-0.09401378, 2.059896, 1.050483, 0, 1, 0.7882353, 1,
-0.09088118, 0.07664865, 0.8328294, 0, 1, 0.7960784, 1,
-0.08691943, 0.9227875, -0.5443584, 0, 1, 0.8039216, 1,
-0.08681365, 0.1816499, -1.087713, 0, 1, 0.8078431, 1,
-0.08428927, 0.5225127, 0.2941354, 0, 1, 0.8156863, 1,
-0.08209231, 1.069043, 0.5563513, 0, 1, 0.8196079, 1,
-0.08036561, 0.8379446, -1.280444, 0, 1, 0.827451, 1,
-0.07918258, -1.291324, -2.397124, 0, 1, 0.8313726, 1,
-0.07701232, -2.423214, -3.065449, 0, 1, 0.8392157, 1,
-0.07034993, 0.4477754, -1.687639, 0, 1, 0.8431373, 1,
-0.07000412, -0.2297656, -4.106549, 0, 1, 0.8509804, 1,
-0.0653308, 1.024311, -0.4414724, 0, 1, 0.854902, 1,
-0.06381439, -2.340869, -3.16819, 0, 1, 0.8627451, 1,
-0.06360766, 0.13231, -0.1891101, 0, 1, 0.8666667, 1,
-0.05746556, 1.792312, 1.055695, 0, 1, 0.8745098, 1,
-0.0549176, -0.4501518, -3.447868, 0, 1, 0.8784314, 1,
-0.05287125, 1.761791, 0.7232018, 0, 1, 0.8862745, 1,
-0.05110984, -0.1591666, -3.607018, 0, 1, 0.8901961, 1,
-0.05043414, 0.2371828, -0.6353441, 0, 1, 0.8980392, 1,
-0.04952103, 1.750843, 0.07269702, 0, 1, 0.9058824, 1,
-0.04696801, -0.5006728, -4.356048, 0, 1, 0.9098039, 1,
-0.04538213, 1.153648, -0.8712574, 0, 1, 0.9176471, 1,
-0.04432496, -0.4527426, -3.186614, 0, 1, 0.9215686, 1,
-0.03942634, 1.052549, -2.157671, 0, 1, 0.9294118, 1,
-0.03770068, -0.5720794, -3.505223, 0, 1, 0.9333333, 1,
-0.0288966, -0.04465871, -2.439427, 0, 1, 0.9411765, 1,
-0.02586183, 0.8282224, 0.03973628, 0, 1, 0.945098, 1,
-0.02542275, -0.06829393, -4.347813, 0, 1, 0.9529412, 1,
-0.02501352, 0.1716821, 1.149295, 0, 1, 0.9568627, 1,
-0.02255268, -1.157911, -2.438978, 0, 1, 0.9647059, 1,
-0.0212037, 0.01824329, 0.2521631, 0, 1, 0.9686275, 1,
-0.01963983, 0.4754632, 0.6548833, 0, 1, 0.9764706, 1,
-0.01895952, 1.436649, -1.01232, 0, 1, 0.9803922, 1,
-0.01396762, 1.144638, -0.6992421, 0, 1, 0.9882353, 1,
-0.01327074, -0.09124086, -2.19782, 0, 1, 0.9921569, 1,
-0.01302002, -0.7356067, -3.904778, 0, 1, 1, 1,
-0.00976747, 0.929487, -0.6664537, 0, 0.9921569, 1, 1,
-0.007810877, 1.809598, -0.6395398, 0, 0.9882353, 1, 1,
-0.007683598, -0.6820192, -2.011578, 0, 0.9803922, 1, 1,
-0.006277936, 0.2983654, -0.2021157, 0, 0.9764706, 1, 1,
-0.001806294, 0.06111532, 1.331212, 0, 0.9686275, 1, 1,
-0.001780944, -1.208809, -2.578969, 0, 0.9647059, 1, 1,
-0.001107399, 0.3497276, 0.6054977, 0, 0.9568627, 1, 1,
-0.0002445713, -0.2218838, -2.371776, 0, 0.9529412, 1, 1,
0.0002122124, 0.2620738, -0.6870374, 0, 0.945098, 1, 1,
0.001470563, -0.2719592, 2.898135, 0, 0.9411765, 1, 1,
0.002377629, -1.081849, 2.48043, 0, 0.9333333, 1, 1,
0.003271916, -1.310442, 1.484028, 0, 0.9294118, 1, 1,
0.007210099, -0.777327, 2.675901, 0, 0.9215686, 1, 1,
0.01346137, 0.01190488, 0.8359685, 0, 0.9176471, 1, 1,
0.01423602, 0.4105212, 1.081721, 0, 0.9098039, 1, 1,
0.02461964, -1.133926, 4.24463, 0, 0.9058824, 1, 1,
0.02906165, 0.4371138, 0.5155552, 0, 0.8980392, 1, 1,
0.03546754, -0.4124379, 2.091742, 0, 0.8901961, 1, 1,
0.03818244, 0.4149913, -0.1125394, 0, 0.8862745, 1, 1,
0.03942635, 1.141992, -1.742991, 0, 0.8784314, 1, 1,
0.03994037, 0.2394269, -0.370313, 0, 0.8745098, 1, 1,
0.03997191, -0.7507798, 3.998336, 0, 0.8666667, 1, 1,
0.0401381, -0.2483963, 3.024387, 0, 0.8627451, 1, 1,
0.0406316, -0.9327671, 3.525212, 0, 0.854902, 1, 1,
0.05017641, 0.6103806, 1.08133, 0, 0.8509804, 1, 1,
0.05953987, -0.5442035, 1.468337, 0, 0.8431373, 1, 1,
0.06006849, 1.851015, 0.4434742, 0, 0.8392157, 1, 1,
0.06212392, -1.941519, 3.363138, 0, 0.8313726, 1, 1,
0.06600406, 0.9001711, 0.3857746, 0, 0.827451, 1, 1,
0.06729399, 0.3696872, -0.8720518, 0, 0.8196079, 1, 1,
0.06788705, -0.283159, 2.215446, 0, 0.8156863, 1, 1,
0.06794681, -0.6755539, 1.667415, 0, 0.8078431, 1, 1,
0.07320236, 0.7342327, 0.9267336, 0, 0.8039216, 1, 1,
0.07354847, 0.2927074, 0.3036392, 0, 0.7960784, 1, 1,
0.07448332, 0.2360798, 0.6235685, 0, 0.7882353, 1, 1,
0.07543987, 0.3450781, -1.192315, 0, 0.7843137, 1, 1,
0.0786663, -0.4279961, 4.56937, 0, 0.7764706, 1, 1,
0.0810306, -0.62786, 3.448466, 0, 0.772549, 1, 1,
0.08512097, -1.170392, 2.748306, 0, 0.7647059, 1, 1,
0.08525862, -1.221242, 4.385634, 0, 0.7607843, 1, 1,
0.08980026, -1.334085, 3.09799, 0, 0.7529412, 1, 1,
0.09113584, 1.100174, 2.489992, 0, 0.7490196, 1, 1,
0.09204643, -1.080106, 3.87343, 0, 0.7411765, 1, 1,
0.09204831, -0.1526012, 1.26903, 0, 0.7372549, 1, 1,
0.09335297, -0.708678, 2.694238, 0, 0.7294118, 1, 1,
0.09516095, -0.1788792, 2.887892, 0, 0.7254902, 1, 1,
0.09697604, -0.9717771, 2.935441, 0, 0.7176471, 1, 1,
0.09708712, 1.108305, -0.3466414, 0, 0.7137255, 1, 1,
0.09708767, 1.366395, 0.265605, 0, 0.7058824, 1, 1,
0.1038149, 1.551624, -0.5469754, 0, 0.6980392, 1, 1,
0.1063971, -0.0002938901, 3.800677, 0, 0.6941177, 1, 1,
0.1087136, 1.08584, 0.5735814, 0, 0.6862745, 1, 1,
0.1095635, -0.2177194, 3.6095, 0, 0.682353, 1, 1,
0.1124946, -0.5190896, 4.1476, 0, 0.6745098, 1, 1,
0.1125572, 0.9036174, -1.241504, 0, 0.6705883, 1, 1,
0.1127981, 0.6206693, 1.172274, 0, 0.6627451, 1, 1,
0.1159278, -0.08151293, 2.679053, 0, 0.6588235, 1, 1,
0.1172977, -0.9757477, 4.316147, 0, 0.6509804, 1, 1,
0.1182694, 0.8242999, -0.733426, 0, 0.6470588, 1, 1,
0.119474, 0.6674935, -0.7334724, 0, 0.6392157, 1, 1,
0.1215857, -1.159277, 2.509453, 0, 0.6352941, 1, 1,
0.1288496, -0.1545153, 2.093624, 0, 0.627451, 1, 1,
0.1295074, -1.558986, 2.806672, 0, 0.6235294, 1, 1,
0.1320224, 1.084683, -0.1203713, 0, 0.6156863, 1, 1,
0.1320437, -1.465973, 3.606136, 0, 0.6117647, 1, 1,
0.1443522, -0.7940648, 2.800283, 0, 0.6039216, 1, 1,
0.1444757, -0.7534181, 3.197763, 0, 0.5960785, 1, 1,
0.1445118, 2.123418, 0.547653, 0, 0.5921569, 1, 1,
0.1445188, -1.530546, 2.785395, 0, 0.5843138, 1, 1,
0.1482754, -0.9136146, 1.538866, 0, 0.5803922, 1, 1,
0.1484201, -2.261085, 3.276527, 0, 0.572549, 1, 1,
0.1545073, 1.206541, 0.373947, 0, 0.5686275, 1, 1,
0.1558492, -0.3033061, 0.4271784, 0, 0.5607843, 1, 1,
0.1578737, 0.7578211, -1.089185, 0, 0.5568628, 1, 1,
0.1594607, -0.09927847, 1.574039, 0, 0.5490196, 1, 1,
0.1636937, 0.3075147, 0.3261689, 0, 0.5450981, 1, 1,
0.1644464, 0.4747244, 0.7829367, 0, 0.5372549, 1, 1,
0.1655709, 0.5616952, 0.9783261, 0, 0.5333334, 1, 1,
0.1718145, 0.1451111, 1.530698, 0, 0.5254902, 1, 1,
0.174568, 1.172584, -2.101411, 0, 0.5215687, 1, 1,
0.1747185, -0.6522513, 3.170075, 0, 0.5137255, 1, 1,
0.1764049, 0.7493964, 0.6044193, 0, 0.509804, 1, 1,
0.178171, -0.3848681, 2.173039, 0, 0.5019608, 1, 1,
0.1803462, -1.910194, 2.113954, 0, 0.4941176, 1, 1,
0.1808029, -0.1793351, 2.447666, 0, 0.4901961, 1, 1,
0.1839091, -0.01410114, 0.9212409, 0, 0.4823529, 1, 1,
0.1848307, -1.209278, 2.590621, 0, 0.4784314, 1, 1,
0.1849439, 0.5711346, 1.640464, 0, 0.4705882, 1, 1,
0.1930427, -0.3913758, 2.864098, 0, 0.4666667, 1, 1,
0.1932099, 1.859828, -0.7539095, 0, 0.4588235, 1, 1,
0.1935304, -0.08164824, 1.825588, 0, 0.454902, 1, 1,
0.1953373, 0.4945308, 0.8738483, 0, 0.4470588, 1, 1,
0.1956958, 1.458861, 0.7407433, 0, 0.4431373, 1, 1,
0.1957087, 1.90326, -1.931326, 0, 0.4352941, 1, 1,
0.2094822, 1.249961, -1.900648, 0, 0.4313726, 1, 1,
0.2146691, -2.308914, 1.072473, 0, 0.4235294, 1, 1,
0.2157261, -0.3189939, 1.355216, 0, 0.4196078, 1, 1,
0.2158978, -0.2424415, 2.217819, 0, 0.4117647, 1, 1,
0.2168491, 1.094809, 0.08807191, 0, 0.4078431, 1, 1,
0.2186424, -1.987469, 3.342397, 0, 0.4, 1, 1,
0.2195426, -0.4581616, 1.638405, 0, 0.3921569, 1, 1,
0.2205083, -1.388651, 2.346811, 0, 0.3882353, 1, 1,
0.223768, -0.3358459, 1.335828, 0, 0.3803922, 1, 1,
0.2314693, 1.891759, -1.01705, 0, 0.3764706, 1, 1,
0.2325322, -0.9613307, 1.822804, 0, 0.3686275, 1, 1,
0.2343784, -1.309313, 3.340579, 0, 0.3647059, 1, 1,
0.2408894, 1.993634, 1.875617, 0, 0.3568628, 1, 1,
0.2433182, 0.7381363, 2.656828, 0, 0.3529412, 1, 1,
0.2446899, 0.6014028, 0.7931685, 0, 0.345098, 1, 1,
0.2479442, 0.2068207, 1.75394, 0, 0.3411765, 1, 1,
0.2542742, 0.8940963, -0.4937854, 0, 0.3333333, 1, 1,
0.2569572, 0.3641065, 1.341496, 0, 0.3294118, 1, 1,
0.2573683, -2.00029, 2.723504, 0, 0.3215686, 1, 1,
0.2648562, 0.4104404, -0.1939526, 0, 0.3176471, 1, 1,
0.2716092, -0.7870759, 2.397086, 0, 0.3098039, 1, 1,
0.274525, -0.9929684, 1.868845, 0, 0.3058824, 1, 1,
0.2830918, 1.47493, -0.06689788, 0, 0.2980392, 1, 1,
0.2852185, 1.047256, 0.3748038, 0, 0.2901961, 1, 1,
0.2888369, -1.421123, 2.337323, 0, 0.2862745, 1, 1,
0.2900304, -0.3006208, -0.3122495, 0, 0.2784314, 1, 1,
0.3000149, -0.5934162, 2.609515, 0, 0.2745098, 1, 1,
0.3027632, -0.2120955, 1.280324, 0, 0.2666667, 1, 1,
0.3029823, -1.947331, 3.973069, 0, 0.2627451, 1, 1,
0.3044183, -1.595734, 2.753132, 0, 0.254902, 1, 1,
0.3051291, 0.4421444, 0.12116, 0, 0.2509804, 1, 1,
0.3058382, 0.4650631, 0.4116265, 0, 0.2431373, 1, 1,
0.312762, -0.4744945, 1.352855, 0, 0.2392157, 1, 1,
0.3135858, -0.8768264, 2.738781, 0, 0.2313726, 1, 1,
0.314115, 1.014692, 0.9052435, 0, 0.227451, 1, 1,
0.3153171, -0.06087296, 3.500692, 0, 0.2196078, 1, 1,
0.3204067, 0.3479789, 1.39276, 0, 0.2156863, 1, 1,
0.3209769, 1.230323, 0.02155678, 0, 0.2078431, 1, 1,
0.3224807, -1.393366, 3.428998, 0, 0.2039216, 1, 1,
0.3328415, -0.3782227, 2.669797, 0, 0.1960784, 1, 1,
0.3343829, 0.62018, 2.643453, 0, 0.1882353, 1, 1,
0.3388135, -1.074301, 4.313845, 0, 0.1843137, 1, 1,
0.3388353, -1.876188, 3.23666, 0, 0.1764706, 1, 1,
0.341041, 1.094136, -0.2395967, 0, 0.172549, 1, 1,
0.3436823, 1.566997, 0.04851468, 0, 0.1647059, 1, 1,
0.3473165, -0.3178006, 3.864067, 0, 0.1607843, 1, 1,
0.3652297, -0.6037667, 2.239408, 0, 0.1529412, 1, 1,
0.366073, -0.9937446, 2.06801, 0, 0.1490196, 1, 1,
0.3694009, -0.2952236, 1.50283, 0, 0.1411765, 1, 1,
0.3701732, 0.1485681, 0.08091388, 0, 0.1372549, 1, 1,
0.3702004, 0.4799113, 1.224409, 0, 0.1294118, 1, 1,
0.3746088, 1.974182, 0.7605088, 0, 0.1254902, 1, 1,
0.3790277, -0.4480055, 4.214363, 0, 0.1176471, 1, 1,
0.3833845, 1.194948, -0.9736732, 0, 0.1137255, 1, 1,
0.3838416, -0.1329522, 3.619589, 0, 0.1058824, 1, 1,
0.3911297, 1.44248, -0.717198, 0, 0.09803922, 1, 1,
0.3924413, 0.2839913, 1.841012, 0, 0.09411765, 1, 1,
0.3933827, -1.034661, 3.665604, 0, 0.08627451, 1, 1,
0.3949219, 0.2989126, 2.453559, 0, 0.08235294, 1, 1,
0.4004748, 1.201329, 0.1084758, 0, 0.07450981, 1, 1,
0.4035214, -0.4806091, 3.973645, 0, 0.07058824, 1, 1,
0.4054046, 0.7865499, 0.5460936, 0, 0.0627451, 1, 1,
0.4117085, -0.7625684, 4.64573, 0, 0.05882353, 1, 1,
0.4125497, 1.830271, 1.271004, 0, 0.05098039, 1, 1,
0.4142534, 0.1160315, 1.432768, 0, 0.04705882, 1, 1,
0.4144142, -0.1288648, 2.474576, 0, 0.03921569, 1, 1,
0.4146382, -1.454654, 2.195712, 0, 0.03529412, 1, 1,
0.4151535, -0.330496, 1.495115, 0, 0.02745098, 1, 1,
0.4159709, 1.14985, 2.412145, 0, 0.02352941, 1, 1,
0.4163889, -0.2257477, 0.7902692, 0, 0.01568628, 1, 1,
0.4179513, 0.9391939, 0.1415941, 0, 0.01176471, 1, 1,
0.4208417, -1.077003, 3.558496, 0, 0.003921569, 1, 1,
0.4243881, 0.1169388, 1.705392, 0.003921569, 0, 1, 1,
0.4255054, 0.4099817, 0.04031018, 0.007843138, 0, 1, 1,
0.4281806, 0.1357202, 0.406478, 0.01568628, 0, 1, 1,
0.4286269, 1.835549, 1.201003, 0.01960784, 0, 1, 1,
0.4297963, -1.827707, 3.631326, 0.02745098, 0, 1, 1,
0.4314767, -1.844215, 2.140887, 0.03137255, 0, 1, 1,
0.4323507, -0.08682231, 0.626348, 0.03921569, 0, 1, 1,
0.4359175, 1.793306, -0.3257784, 0.04313726, 0, 1, 1,
0.4400576, -7.470396e-05, 1.65047, 0.05098039, 0, 1, 1,
0.4433708, -0.3638254, 3.046252, 0.05490196, 0, 1, 1,
0.4446764, 0.08838534, 1.949397, 0.0627451, 0, 1, 1,
0.4498261, 0.5394732, 1.947673, 0.06666667, 0, 1, 1,
0.4499837, -1.652121, 2.830194, 0.07450981, 0, 1, 1,
0.4544925, 0.9768057, -0.840084, 0.07843138, 0, 1, 1,
0.4553324, 0.143025, 2.565449, 0.08627451, 0, 1, 1,
0.4565167, -0.2462934, 0.3738238, 0.09019608, 0, 1, 1,
0.4594789, 0.1761428, 0.3322823, 0.09803922, 0, 1, 1,
0.4596518, 1.145671, 0.07028884, 0.1058824, 0, 1, 1,
0.4623023, 1.000409, -0.1285773, 0.1098039, 0, 1, 1,
0.4649697, -0.01543722, 2.253477, 0.1176471, 0, 1, 1,
0.4663391, 0.2963479, 2.192753, 0.1215686, 0, 1, 1,
0.4666068, -0.3181154, 4.679809, 0.1294118, 0, 1, 1,
0.4747387, -0.6338786, 3.835031, 0.1333333, 0, 1, 1,
0.4821786, -0.05519962, 2.069351, 0.1411765, 0, 1, 1,
0.484429, -0.1180778, 2.007113, 0.145098, 0, 1, 1,
0.484773, -0.4452923, 2.223984, 0.1529412, 0, 1, 1,
0.4929144, 0.4851892, -1.260553, 0.1568628, 0, 1, 1,
0.496792, -0.0513161, 0.9239494, 0.1647059, 0, 1, 1,
0.4988937, -1.094969, 3.498631, 0.1686275, 0, 1, 1,
0.4990982, 1.436084, 0.5621902, 0.1764706, 0, 1, 1,
0.5046912, -0.4253238, 3.314319, 0.1803922, 0, 1, 1,
0.5139181, -1.210824, 1.609879, 0.1882353, 0, 1, 1,
0.5154187, 0.7108046, 1.133528, 0.1921569, 0, 1, 1,
0.5155818, 0.859211, 0.7168635, 0.2, 0, 1, 1,
0.5196074, -1.026115, 1.519882, 0.2078431, 0, 1, 1,
0.5219431, 0.01377228, 1.038201, 0.2117647, 0, 1, 1,
0.5224288, 1.185434, 1.126853, 0.2196078, 0, 1, 1,
0.5237574, 0.7266011, 0.9502888, 0.2235294, 0, 1, 1,
0.5262351, 1.625916, -0.1548957, 0.2313726, 0, 1, 1,
0.5304202, -1.518022, 3.387989, 0.2352941, 0, 1, 1,
0.5320081, -0.1323955, 1.527192, 0.2431373, 0, 1, 1,
0.5322257, -2.209845, 2.979446, 0.2470588, 0, 1, 1,
0.5351201, 0.08407979, 1.977994, 0.254902, 0, 1, 1,
0.539957, 0.4634573, 0.1376998, 0.2588235, 0, 1, 1,
0.5424756, -0.4407003, 1.693154, 0.2666667, 0, 1, 1,
0.5428982, -1.175575, 3.028587, 0.2705882, 0, 1, 1,
0.5450554, -1.021213, -0.09589871, 0.2784314, 0, 1, 1,
0.5493742, 0.262789, 0.3036843, 0.282353, 0, 1, 1,
0.5516023, -1.103321, 0.4491142, 0.2901961, 0, 1, 1,
0.5554727, 1.255395, 1.509616, 0.2941177, 0, 1, 1,
0.5576648, 0.2922139, 0.7243378, 0.3019608, 0, 1, 1,
0.5599873, 1.481108, 1.050636, 0.3098039, 0, 1, 1,
0.5693808, 1.092607, 1.560373, 0.3137255, 0, 1, 1,
0.5753192, 1.317776, 1.207294, 0.3215686, 0, 1, 1,
0.5753422, -0.9377091, 3.199676, 0.3254902, 0, 1, 1,
0.5816856, -0.4427245, 1.912065, 0.3333333, 0, 1, 1,
0.5849097, -0.03391896, 0.6575469, 0.3372549, 0, 1, 1,
0.5880111, -0.1597127, 1.074149, 0.345098, 0, 1, 1,
0.5897929, 1.211902, 0.1788757, 0.3490196, 0, 1, 1,
0.5898916, 1.009796, 1.529754, 0.3568628, 0, 1, 1,
0.5909657, 0.1494993, 1.840475, 0.3607843, 0, 1, 1,
0.5910318, -0.02743244, 2.847311, 0.3686275, 0, 1, 1,
0.5974031, -0.6306322, 5.231564, 0.372549, 0, 1, 1,
0.6045073, -0.0955535, 3.816369, 0.3803922, 0, 1, 1,
0.6049371, 0.9883793, 2.403451, 0.3843137, 0, 1, 1,
0.6077066, 1.525339, 0.4133651, 0.3921569, 0, 1, 1,
0.6093926, 1.420158, 1.623538, 0.3960784, 0, 1, 1,
0.610409, 0.8049751, 0.4373676, 0.4039216, 0, 1, 1,
0.612133, -0.3146975, 1.23206, 0.4117647, 0, 1, 1,
0.6268642, 0.5212091, -0.3682676, 0.4156863, 0, 1, 1,
0.62982, -1.032329, 3.024, 0.4235294, 0, 1, 1,
0.6358711, -0.7852118, 2.047373, 0.427451, 0, 1, 1,
0.6509159, 0.525463, 1.006907, 0.4352941, 0, 1, 1,
0.6539961, -0.1953178, 3.160353, 0.4392157, 0, 1, 1,
0.6581113, -0.9105296, 2.117497, 0.4470588, 0, 1, 1,
0.6592632, 1.40714, 1.105619, 0.4509804, 0, 1, 1,
0.6609482, -0.8023024, 4.313939, 0.4588235, 0, 1, 1,
0.6655518, 2.127257, -1.49165, 0.4627451, 0, 1, 1,
0.6687285, 2.027657, -0.4591621, 0.4705882, 0, 1, 1,
0.6765772, 0.3101649, 2.272692, 0.4745098, 0, 1, 1,
0.6789429, -2.397068, 2.57102, 0.4823529, 0, 1, 1,
0.6797128, 2.316762, 1.658385, 0.4862745, 0, 1, 1,
0.6827728, -0.9521405, 2.580982, 0.4941176, 0, 1, 1,
0.6829866, 0.3475414, 1.463411, 0.5019608, 0, 1, 1,
0.688062, -0.3964167, 1.782962, 0.5058824, 0, 1, 1,
0.695242, -0.3066566, 2.282165, 0.5137255, 0, 1, 1,
0.6975335, -1.60737, 1.221628, 0.5176471, 0, 1, 1,
0.6995959, 0.07392883, 2.501985, 0.5254902, 0, 1, 1,
0.7004784, 0.8009105, 1.413234, 0.5294118, 0, 1, 1,
0.7047301, 0.1274463, 1.3783, 0.5372549, 0, 1, 1,
0.7060172, 1.960553, 1.041151, 0.5411765, 0, 1, 1,
0.7101116, 0.6291396, 1.598678, 0.5490196, 0, 1, 1,
0.7117723, -1.118472, 2.799864, 0.5529412, 0, 1, 1,
0.7169185, -2.360679, 5.844965, 0.5607843, 0, 1, 1,
0.723682, -1.519692, 2.167163, 0.5647059, 0, 1, 1,
0.7329833, -0.2094995, 1.649237, 0.572549, 0, 1, 1,
0.7374834, 0.514784, 1.8423, 0.5764706, 0, 1, 1,
0.7418395, -1.366026, 3.056911, 0.5843138, 0, 1, 1,
0.7424526, 1.400293, 1.891139, 0.5882353, 0, 1, 1,
0.7435347, 0.5923095, 1.664708, 0.5960785, 0, 1, 1,
0.7450797, -0.7776598, 3.11399, 0.6039216, 0, 1, 1,
0.7483186, 1.440598, 0.1370848, 0.6078432, 0, 1, 1,
0.7504495, 0.9502741, 0.641757, 0.6156863, 0, 1, 1,
0.7523007, 0.3285639, 0.1386423, 0.6196079, 0, 1, 1,
0.753145, 0.4642466, 1.767022, 0.627451, 0, 1, 1,
0.7544744, 1.110469, 0.7517632, 0.6313726, 0, 1, 1,
0.7572464, -0.9662169, 2.751036, 0.6392157, 0, 1, 1,
0.7578508, 0.3925092, 1.853209, 0.6431373, 0, 1, 1,
0.7645013, -1.008927, 2.926441, 0.6509804, 0, 1, 1,
0.7664826, -3.470356, 1.999656, 0.654902, 0, 1, 1,
0.768065, -0.04145312, 2.857579, 0.6627451, 0, 1, 1,
0.7750629, 1.685112, 0.2190931, 0.6666667, 0, 1, 1,
0.7869619, -1.385646, 3.971044, 0.6745098, 0, 1, 1,
0.7874492, 0.2603773, 1.7724, 0.6784314, 0, 1, 1,
0.7878363, 0.1039985, 1.124521, 0.6862745, 0, 1, 1,
0.7949855, -1.020826, 2.970582, 0.6901961, 0, 1, 1,
0.8005022, -0.06751303, 3.8989, 0.6980392, 0, 1, 1,
0.8026557, -0.01818335, 1.070654, 0.7058824, 0, 1, 1,
0.8027709, 1.051782, 2.816357, 0.7098039, 0, 1, 1,
0.8054341, -0.9014364, 2.556232, 0.7176471, 0, 1, 1,
0.8215349, -1.092847, 2.421664, 0.7215686, 0, 1, 1,
0.8263127, 0.7886869, -0.9472155, 0.7294118, 0, 1, 1,
0.8394908, 0.4770871, -0.06881167, 0.7333333, 0, 1, 1,
0.8434954, -0.7618207, 2.013814, 0.7411765, 0, 1, 1,
0.8435459, 0.8580545, 1.130019, 0.7450981, 0, 1, 1,
0.8484924, 0.3569887, 0.9566246, 0.7529412, 0, 1, 1,
0.8510328, -2.475131, 3.562728, 0.7568628, 0, 1, 1,
0.8517542, -1.036957, 0.8738775, 0.7647059, 0, 1, 1,
0.8534598, 1.014624, 1.470121, 0.7686275, 0, 1, 1,
0.8541692, 1.199631, 0.2734959, 0.7764706, 0, 1, 1,
0.8553837, 2.523284, 0.2489808, 0.7803922, 0, 1, 1,
0.8563724, 0.8225136, 0.08915009, 0.7882353, 0, 1, 1,
0.865591, -0.4747612, 1.662515, 0.7921569, 0, 1, 1,
0.8676509, -0.01246621, 1.043, 0.8, 0, 1, 1,
0.8679661, -0.5530974, 2.894687, 0.8078431, 0, 1, 1,
0.8696941, -1.629436, 0.7711769, 0.8117647, 0, 1, 1,
0.8761827, -0.1122552, 1.871853, 0.8196079, 0, 1, 1,
0.8814083, -0.3925909, 2.099096, 0.8235294, 0, 1, 1,
0.8815122, 0.4682756, 0.8621648, 0.8313726, 0, 1, 1,
0.8872553, 1.41367, 2.10898, 0.8352941, 0, 1, 1,
0.8893473, -0.9328238, 1.151594, 0.8431373, 0, 1, 1,
0.8897182, 1.812064, -0.07097291, 0.8470588, 0, 1, 1,
0.8915828, 1.013182, -0.2533179, 0.854902, 0, 1, 1,
0.8925955, -0.2737387, 2.133463, 0.8588235, 0, 1, 1,
0.898493, -0.1041559, 1.340486, 0.8666667, 0, 1, 1,
0.9110115, 0.5574983, -0.398165, 0.8705882, 0, 1, 1,
0.914921, -0.1077715, 2.703378, 0.8784314, 0, 1, 1,
0.916786, -0.6635321, 0.6581577, 0.8823529, 0, 1, 1,
0.9198719, 0.6720454, 2.730754, 0.8901961, 0, 1, 1,
0.9230196, 2.084096, -0.6453081, 0.8941177, 0, 1, 1,
0.9238489, 1.043954, 0.199213, 0.9019608, 0, 1, 1,
0.9242756, 0.3825873, 1.370505, 0.9098039, 0, 1, 1,
0.9252713, -1.177032, 2.621657, 0.9137255, 0, 1, 1,
0.9298304, -0.6642024, 2.292411, 0.9215686, 0, 1, 1,
0.9330834, -1.309249, 1.550575, 0.9254902, 0, 1, 1,
0.9335116, -0.1541681, 3.561712, 0.9333333, 0, 1, 1,
0.9343557, 1.434212, 1.831734, 0.9372549, 0, 1, 1,
0.9417658, -0.7075911, 0.7245452, 0.945098, 0, 1, 1,
0.9439993, -2.117338, 1.996539, 0.9490196, 0, 1, 1,
0.9468398, -0.09657892, 0.9776868, 0.9568627, 0, 1, 1,
0.9477524, 1.34242, 2.066854, 0.9607843, 0, 1, 1,
0.9499851, -0.7942445, 0.7472389, 0.9686275, 0, 1, 1,
0.9606772, 0.4912581, 1.564572, 0.972549, 0, 1, 1,
0.9619372, -0.239803, 2.821183, 0.9803922, 0, 1, 1,
0.9644001, -2.781113, 3.538274, 0.9843137, 0, 1, 1,
0.9702969, -0.3725686, 1.469696, 0.9921569, 0, 1, 1,
0.9736267, 0.6754335, 1.293352, 0.9960784, 0, 1, 1,
0.9746922, 0.8742702, 1.314285, 1, 0, 0.9960784, 1,
0.9755125, -1.485199, 3.00632, 1, 0, 0.9882353, 1,
0.9902901, -0.1590483, 0.4631504, 1, 0, 0.9843137, 1,
1.00859, 0.8314635, 0.4794637, 1, 0, 0.9764706, 1,
1.009811, -1.056678, 1.036308, 1, 0, 0.972549, 1,
1.011249, 1.176166, 2.591351, 1, 0, 0.9647059, 1,
1.012363, -1.072745, 3.05887, 1, 0, 0.9607843, 1,
1.013287, -0.6445735, 2.619596, 1, 0, 0.9529412, 1,
1.019085, -0.2255506, -0.1721409, 1, 0, 0.9490196, 1,
1.019775, -2.247759, 1.86624, 1, 0, 0.9411765, 1,
1.022287, 0.2434866, 1.958288, 1, 0, 0.9372549, 1,
1.027142, 0.7003942, 1.398335, 1, 0, 0.9294118, 1,
1.035383, -0.4192405, 3.027441, 1, 0, 0.9254902, 1,
1.037314, 1.301548, 1.069039, 1, 0, 0.9176471, 1,
1.03781, 0.9290065, 0.5841478, 1, 0, 0.9137255, 1,
1.038838, 0.6932108, 1.477922, 1, 0, 0.9058824, 1,
1.046703, -0.6484489, 1.474181, 1, 0, 0.9019608, 1,
1.05067, 0.8293409, -0.6534961, 1, 0, 0.8941177, 1,
1.054177, 0.2810146, 1.051478, 1, 0, 0.8862745, 1,
1.058897, -0.1279508, 1.114612, 1, 0, 0.8823529, 1,
1.058978, -0.7742231, 1.564844, 1, 0, 0.8745098, 1,
1.060347, -0.5625074, 1.087788, 1, 0, 0.8705882, 1,
1.061119, -0.6771646, 1.934415, 1, 0, 0.8627451, 1,
1.062592, -1.447397, 2.899986, 1, 0, 0.8588235, 1,
1.069596, -0.117785, 3.811021, 1, 0, 0.8509804, 1,
1.090494, -0.1253644, 1.677856, 1, 0, 0.8470588, 1,
1.090653, 1.341675, -0.09979606, 1, 0, 0.8392157, 1,
1.091092, 0.04273021, 2.46909, 1, 0, 0.8352941, 1,
1.091544, -1.164787, 0.9810618, 1, 0, 0.827451, 1,
1.096697, 1.283256, 1.711983, 1, 0, 0.8235294, 1,
1.104578, -0.6148827, 4.394428, 1, 0, 0.8156863, 1,
1.105425, 1.357119, -1.227645, 1, 0, 0.8117647, 1,
1.110059, 0.6775806, 2.990162, 1, 0, 0.8039216, 1,
1.119512, 1.089919, 0.7787195, 1, 0, 0.7960784, 1,
1.1229, -0.224668, 1.617864, 1, 0, 0.7921569, 1,
1.124061, -0.568728, 0.6542769, 1, 0, 0.7843137, 1,
1.129179, 0.4213615, 1.321223, 1, 0, 0.7803922, 1,
1.131371, 0.08432999, 2.411963, 1, 0, 0.772549, 1,
1.133249, -0.4084853, 2.214837, 1, 0, 0.7686275, 1,
1.134103, -1.400437, 2.586286, 1, 0, 0.7607843, 1,
1.141916, 0.5382593, 3.493494, 1, 0, 0.7568628, 1,
1.14694, 1.239535, 2.069986, 1, 0, 0.7490196, 1,
1.150489, -0.6833656, 3.820917, 1, 0, 0.7450981, 1,
1.153052, 1.987015, -1.560162, 1, 0, 0.7372549, 1,
1.158946, 0.1492794, 1.808494, 1, 0, 0.7333333, 1,
1.163949, 0.2631611, 1.561375, 1, 0, 0.7254902, 1,
1.167434, -1.304696, 2.470173, 1, 0, 0.7215686, 1,
1.178687, -0.48486, 1.590448, 1, 0, 0.7137255, 1,
1.183151, 0.6746416, 1.04915, 1, 0, 0.7098039, 1,
1.190162, 1.750914, 1.170912, 1, 0, 0.7019608, 1,
1.193467, -0.2263592, 2.432638, 1, 0, 0.6941177, 1,
1.194732, -1.273867, 3.184163, 1, 0, 0.6901961, 1,
1.197077, 0.6989441, 0.7650369, 1, 0, 0.682353, 1,
1.207565, 0.09446242, 1.267449, 1, 0, 0.6784314, 1,
1.217677, -0.6477935, 0.7239748, 1, 0, 0.6705883, 1,
1.222153, -0.4047428, 1.707259, 1, 0, 0.6666667, 1,
1.223488, 0.1835601, -1.193791, 1, 0, 0.6588235, 1,
1.232964, 0.1083621, -0.3392802, 1, 0, 0.654902, 1,
1.233115, -0.3209069, 3.429616, 1, 0, 0.6470588, 1,
1.237557, 0.2792985, 1.039069, 1, 0, 0.6431373, 1,
1.251719, -1.247546, 4.39323, 1, 0, 0.6352941, 1,
1.255067, -0.0347082, 2.099885, 1, 0, 0.6313726, 1,
1.259569, -0.9953042, 1.154892, 1, 0, 0.6235294, 1,
1.264718, 0.9814725, 0.5899132, 1, 0, 0.6196079, 1,
1.265451, 0.8946286, -0.2506618, 1, 0, 0.6117647, 1,
1.267589, -0.9561955, 2.63962, 1, 0, 0.6078432, 1,
1.272402, -0.9925675, 2.011879, 1, 0, 0.6, 1,
1.277848, 0.1446106, 3.223075, 1, 0, 0.5921569, 1,
1.278726, 0.2566684, -0.7549869, 1, 0, 0.5882353, 1,
1.279667, -1.096482, 2.113503, 1, 0, 0.5803922, 1,
1.28149, -0.8810071, 3.803786, 1, 0, 0.5764706, 1,
1.28258, -0.2728661, 1.005005, 1, 0, 0.5686275, 1,
1.282885, 0.26775, 2.184176, 1, 0, 0.5647059, 1,
1.288978, -0.5911874, 2.545236, 1, 0, 0.5568628, 1,
1.291075, -0.9867992, 2.113835, 1, 0, 0.5529412, 1,
1.294928, -0.1431356, 0.9855503, 1, 0, 0.5450981, 1,
1.32023, -0.9916575, 0.3972947, 1, 0, 0.5411765, 1,
1.324705, 0.6401192, 0.8151788, 1, 0, 0.5333334, 1,
1.332219, 2.423312, -0.8119487, 1, 0, 0.5294118, 1,
1.340506, 0.4981465, 0.7046808, 1, 0, 0.5215687, 1,
1.340899, -0.9805814, 1.839503, 1, 0, 0.5176471, 1,
1.355665, 2.097427, 0.4299112, 1, 0, 0.509804, 1,
1.357201, -0.3601922, 1.623979, 1, 0, 0.5058824, 1,
1.358692, -0.09543247, 0.7191706, 1, 0, 0.4980392, 1,
1.359379, 0.4756385, 1.439891, 1, 0, 0.4901961, 1,
1.362216, -0.5316862, 0.7093006, 1, 0, 0.4862745, 1,
1.362593, 0.2469452, 0.5998527, 1, 0, 0.4784314, 1,
1.372238, 0.3427159, 1.672243, 1, 0, 0.4745098, 1,
1.380744, -0.08385364, 0.6109886, 1, 0, 0.4666667, 1,
1.39681, 1.502201, 0.05046533, 1, 0, 0.4627451, 1,
1.398227, 0.5863124, 2.265299, 1, 0, 0.454902, 1,
1.414111, 0.9359434, 0.824093, 1, 0, 0.4509804, 1,
1.415983, 0.1017746, 1.748949, 1, 0, 0.4431373, 1,
1.420734, 1.199415, 2.144599, 1, 0, 0.4392157, 1,
1.429687, -0.6406952, 1.114533, 1, 0, 0.4313726, 1,
1.444091, 0.2513148, 2.159832, 1, 0, 0.427451, 1,
1.445919, -0.1043329, 3.257576, 1, 0, 0.4196078, 1,
1.457993, -0.05937526, 2.749383, 1, 0, 0.4156863, 1,
1.460495, 1.443807, 1.498544, 1, 0, 0.4078431, 1,
1.465038, -0.6353083, 2.35933, 1, 0, 0.4039216, 1,
1.468723, -0.9411964, 3.102926, 1, 0, 0.3960784, 1,
1.474928, 0.081292, 2.319497, 1, 0, 0.3882353, 1,
1.503905, -0.03237098, 1.211509, 1, 0, 0.3843137, 1,
1.507963, 0.1623377, 1.267339, 1, 0, 0.3764706, 1,
1.509397, -1.780675, 2.842891, 1, 0, 0.372549, 1,
1.524157, -0.25387, 0.412558, 1, 0, 0.3647059, 1,
1.525995, 1.011632, 2.53327, 1, 0, 0.3607843, 1,
1.539164, -0.8174727, 2.13852, 1, 0, 0.3529412, 1,
1.539375, -1.403144, 1.101527, 1, 0, 0.3490196, 1,
1.54077, 1.799352, 0.2657334, 1, 0, 0.3411765, 1,
1.552331, -0.4413743, 2.139862, 1, 0, 0.3372549, 1,
1.55573, 1.230447, 0.7730744, 1, 0, 0.3294118, 1,
1.581356, 0.9713061, 1.097264, 1, 0, 0.3254902, 1,
1.585359, 0.1635032, 1.086136, 1, 0, 0.3176471, 1,
1.595007, 0.9776627, 2.207431, 1, 0, 0.3137255, 1,
1.621844, -1.477412, 2.422973, 1, 0, 0.3058824, 1,
1.645485, 1.135949, 2.803298, 1, 0, 0.2980392, 1,
1.657289, 0.2404604, 1.948571, 1, 0, 0.2941177, 1,
1.66865, -1.201502, 1.150281, 1, 0, 0.2862745, 1,
1.681162, 1.137682, 1.644417, 1, 0, 0.282353, 1,
1.698983, 0.5748403, 0.9900123, 1, 0, 0.2745098, 1,
1.729986, 0.7225406, 0.2128153, 1, 0, 0.2705882, 1,
1.732437, 0.3155144, 2.232435, 1, 0, 0.2627451, 1,
1.762642, -0.2818296, 2.100789, 1, 0, 0.2588235, 1,
1.772468, 0.7982128, 3.186526, 1, 0, 0.2509804, 1,
1.784702, 0.4584705, 1.158137, 1, 0, 0.2470588, 1,
1.78717, -1.796702, 3.24936, 1, 0, 0.2392157, 1,
1.790318, 1.163761, 0.06049062, 1, 0, 0.2352941, 1,
1.795449, 0.1802308, 1.938454, 1, 0, 0.227451, 1,
1.797079, -0.153534, 1.166373, 1, 0, 0.2235294, 1,
1.800197, 0.2013939, 2.894063, 1, 0, 0.2156863, 1,
1.813236, -1.580526, 2.699487, 1, 0, 0.2117647, 1,
1.825574, -0.3698081, 2.657843, 1, 0, 0.2039216, 1,
1.843223, -0.08233548, 2.704887, 1, 0, 0.1960784, 1,
1.847692, -2.338811, 1.930943, 1, 0, 0.1921569, 1,
1.852603, 0.3273405, 1.872466, 1, 0, 0.1843137, 1,
1.863478, 0.05733137, 2.722071, 1, 0, 0.1803922, 1,
1.872385, 0.173257, 1.368849, 1, 0, 0.172549, 1,
1.884832, 0.2696085, 2.834092, 1, 0, 0.1686275, 1,
1.900397, 0.233823, 2.274281, 1, 0, 0.1607843, 1,
1.967085, 0.2802478, 1.005227, 1, 0, 0.1568628, 1,
1.969487, -0.03098414, 1.352345, 1, 0, 0.1490196, 1,
1.973405, -0.2134856, 3.697786, 1, 0, 0.145098, 1,
2.007004, -0.3124245, 1.801929, 1, 0, 0.1372549, 1,
2.028186, -0.482168, 1.427268, 1, 0, 0.1333333, 1,
2.04759, 0.2406942, 2.312248, 1, 0, 0.1254902, 1,
2.069108, 1.217681, 3.577676, 1, 0, 0.1215686, 1,
2.166799, 0.8888813, 2.448965, 1, 0, 0.1137255, 1,
2.174422, -0.3881906, 1.982255, 1, 0, 0.1098039, 1,
2.308501, 0.9412196, 1.948057, 1, 0, 0.1019608, 1,
2.33497, -0.43853, 1.743257, 1, 0, 0.09411765, 1,
2.37261, 0.6705301, 2.441011, 1, 0, 0.09019608, 1,
2.441364, -0.209158, 1.848403, 1, 0, 0.08235294, 1,
2.488018, -0.4505445, 1.877338, 1, 0, 0.07843138, 1,
2.559756, -1.266229, 3.745579, 1, 0, 0.07058824, 1,
2.630275, -1.868701, 1.111069, 1, 0, 0.06666667, 1,
2.633889, -1.827504, 2.310805, 1, 0, 0.05882353, 1,
2.672426, -0.8128107, 4.365208, 1, 0, 0.05490196, 1,
2.682336, -1.355408, 2.712216, 1, 0, 0.04705882, 1,
2.691298, -0.250213, 0.6832574, 1, 0, 0.04313726, 1,
2.699066, -0.5050095, 1.637982, 1, 0, 0.03529412, 1,
2.770751, 1.887097, -1.219151, 1, 0, 0.03137255, 1,
2.806558, 0.2178327, 2.792407, 1, 0, 0.02352941, 1,
2.82261, -0.1930728, 2.07387, 1, 0, 0.01960784, 1,
3.219127, -1.415523, 2.192496, 1, 0, 0.01176471, 1,
3.857784, 0.5756631, 1.003927, 1, 0, 0.007843138, 1
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
0.3618053, -4.540603, -8.475683, 0, -0.5, 0.5, 0.5,
0.3618053, -4.540603, -8.475683, 1, -0.5, 0.5, 0.5,
0.3618053, -4.540603, -8.475683, 1, 1.5, 0.5, 0.5,
0.3618053, -4.540603, -8.475683, 0, 1.5, 0.5, 0.5
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
-4.319311, -0.3132846, -8.475683, 0, -0.5, 0.5, 0.5,
-4.319311, -0.3132846, -8.475683, 1, -0.5, 0.5, 0.5,
-4.319311, -0.3132846, -8.475683, 1, 1.5, 0.5, 0.5,
-4.319311, -0.3132846, -8.475683, 0, 1.5, 0.5, 0.5
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
-4.319311, -4.540603, -0.2775867, 0, -0.5, 0.5, 0.5,
-4.319311, -4.540603, -0.2775867, 1, -0.5, 0.5, 0.5,
-4.319311, -4.540603, -0.2775867, 1, 1.5, 0.5, 0.5,
-4.319311, -4.540603, -0.2775867, 0, 1.5, 0.5, 0.5
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
-3, -3.565068, -6.583815,
3, -3.565068, -6.583815,
-3, -3.565068, -6.583815,
-3, -3.727657, -6.899126,
-2, -3.565068, -6.583815,
-2, -3.727657, -6.899126,
-1, -3.565068, -6.583815,
-1, -3.727657, -6.899126,
0, -3.565068, -6.583815,
0, -3.727657, -6.899126,
1, -3.565068, -6.583815,
1, -3.727657, -6.899126,
2, -3.565068, -6.583815,
2, -3.727657, -6.899126,
3, -3.565068, -6.583815,
3, -3.727657, -6.899126
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
-3, -4.052835, -7.529748, 0, -0.5, 0.5, 0.5,
-3, -4.052835, -7.529748, 1, -0.5, 0.5, 0.5,
-3, -4.052835, -7.529748, 1, 1.5, 0.5, 0.5,
-3, -4.052835, -7.529748, 0, 1.5, 0.5, 0.5,
-2, -4.052835, -7.529748, 0, -0.5, 0.5, 0.5,
-2, -4.052835, -7.529748, 1, -0.5, 0.5, 0.5,
-2, -4.052835, -7.529748, 1, 1.5, 0.5, 0.5,
-2, -4.052835, -7.529748, 0, 1.5, 0.5, 0.5,
-1, -4.052835, -7.529748, 0, -0.5, 0.5, 0.5,
-1, -4.052835, -7.529748, 1, -0.5, 0.5, 0.5,
-1, -4.052835, -7.529748, 1, 1.5, 0.5, 0.5,
-1, -4.052835, -7.529748, 0, 1.5, 0.5, 0.5,
0, -4.052835, -7.529748, 0, -0.5, 0.5, 0.5,
0, -4.052835, -7.529748, 1, -0.5, 0.5, 0.5,
0, -4.052835, -7.529748, 1, 1.5, 0.5, 0.5,
0, -4.052835, -7.529748, 0, 1.5, 0.5, 0.5,
1, -4.052835, -7.529748, 0, -0.5, 0.5, 0.5,
1, -4.052835, -7.529748, 1, -0.5, 0.5, 0.5,
1, -4.052835, -7.529748, 1, 1.5, 0.5, 0.5,
1, -4.052835, -7.529748, 0, 1.5, 0.5, 0.5,
2, -4.052835, -7.529748, 0, -0.5, 0.5, 0.5,
2, -4.052835, -7.529748, 1, -0.5, 0.5, 0.5,
2, -4.052835, -7.529748, 1, 1.5, 0.5, 0.5,
2, -4.052835, -7.529748, 0, 1.5, 0.5, 0.5,
3, -4.052835, -7.529748, 0, -0.5, 0.5, 0.5,
3, -4.052835, -7.529748, 1, -0.5, 0.5, 0.5,
3, -4.052835, -7.529748, 1, 1.5, 0.5, 0.5,
3, -4.052835, -7.529748, 0, 1.5, 0.5, 0.5
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
-3.239053, -3, -6.583815,
-3.239053, 2, -6.583815,
-3.239053, -3, -6.583815,
-3.419096, -3, -6.899126,
-3.239053, -2, -6.583815,
-3.419096, -2, -6.899126,
-3.239053, -1, -6.583815,
-3.419096, -1, -6.899126,
-3.239053, 0, -6.583815,
-3.419096, 0, -6.899126,
-3.239053, 1, -6.583815,
-3.419096, 1, -6.899126,
-3.239053, 2, -6.583815,
-3.419096, 2, -6.899126
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
-3.779182, -3, -7.529748, 0, -0.5, 0.5, 0.5,
-3.779182, -3, -7.529748, 1, -0.5, 0.5, 0.5,
-3.779182, -3, -7.529748, 1, 1.5, 0.5, 0.5,
-3.779182, -3, -7.529748, 0, 1.5, 0.5, 0.5,
-3.779182, -2, -7.529748, 0, -0.5, 0.5, 0.5,
-3.779182, -2, -7.529748, 1, -0.5, 0.5, 0.5,
-3.779182, -2, -7.529748, 1, 1.5, 0.5, 0.5,
-3.779182, -2, -7.529748, 0, 1.5, 0.5, 0.5,
-3.779182, -1, -7.529748, 0, -0.5, 0.5, 0.5,
-3.779182, -1, -7.529748, 1, -0.5, 0.5, 0.5,
-3.779182, -1, -7.529748, 1, 1.5, 0.5, 0.5,
-3.779182, -1, -7.529748, 0, 1.5, 0.5, 0.5,
-3.779182, 0, -7.529748, 0, -0.5, 0.5, 0.5,
-3.779182, 0, -7.529748, 1, -0.5, 0.5, 0.5,
-3.779182, 0, -7.529748, 1, 1.5, 0.5, 0.5,
-3.779182, 0, -7.529748, 0, 1.5, 0.5, 0.5,
-3.779182, 1, -7.529748, 0, -0.5, 0.5, 0.5,
-3.779182, 1, -7.529748, 1, -0.5, 0.5, 0.5,
-3.779182, 1, -7.529748, 1, 1.5, 0.5, 0.5,
-3.779182, 1, -7.529748, 0, 1.5, 0.5, 0.5,
-3.779182, 2, -7.529748, 0, -0.5, 0.5, 0.5,
-3.779182, 2, -7.529748, 1, -0.5, 0.5, 0.5,
-3.779182, 2, -7.529748, 1, 1.5, 0.5, 0.5,
-3.779182, 2, -7.529748, 0, 1.5, 0.5, 0.5
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
-3.239053, -3.565068, -6,
-3.239053, -3.565068, 4,
-3.239053, -3.565068, -6,
-3.419096, -3.727657, -6,
-3.239053, -3.565068, -4,
-3.419096, -3.727657, -4,
-3.239053, -3.565068, -2,
-3.419096, -3.727657, -2,
-3.239053, -3.565068, 0,
-3.419096, -3.727657, 0,
-3.239053, -3.565068, 2,
-3.419096, -3.727657, 2,
-3.239053, -3.565068, 4,
-3.419096, -3.727657, 4
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
"-6",
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
-3.779182, -4.052835, -6, 0, -0.5, 0.5, 0.5,
-3.779182, -4.052835, -6, 1, -0.5, 0.5, 0.5,
-3.779182, -4.052835, -6, 1, 1.5, 0.5, 0.5,
-3.779182, -4.052835, -6, 0, 1.5, 0.5, 0.5,
-3.779182, -4.052835, -4, 0, -0.5, 0.5, 0.5,
-3.779182, -4.052835, -4, 1, -0.5, 0.5, 0.5,
-3.779182, -4.052835, -4, 1, 1.5, 0.5, 0.5,
-3.779182, -4.052835, -4, 0, 1.5, 0.5, 0.5,
-3.779182, -4.052835, -2, 0, -0.5, 0.5, 0.5,
-3.779182, -4.052835, -2, 1, -0.5, 0.5, 0.5,
-3.779182, -4.052835, -2, 1, 1.5, 0.5, 0.5,
-3.779182, -4.052835, -2, 0, 1.5, 0.5, 0.5,
-3.779182, -4.052835, 0, 0, -0.5, 0.5, 0.5,
-3.779182, -4.052835, 0, 1, -0.5, 0.5, 0.5,
-3.779182, -4.052835, 0, 1, 1.5, 0.5, 0.5,
-3.779182, -4.052835, 0, 0, 1.5, 0.5, 0.5,
-3.779182, -4.052835, 2, 0, -0.5, 0.5, 0.5,
-3.779182, -4.052835, 2, 1, -0.5, 0.5, 0.5,
-3.779182, -4.052835, 2, 1, 1.5, 0.5, 0.5,
-3.779182, -4.052835, 2, 0, 1.5, 0.5, 0.5,
-3.779182, -4.052835, 4, 0, -0.5, 0.5, 0.5,
-3.779182, -4.052835, 4, 1, -0.5, 0.5, 0.5,
-3.779182, -4.052835, 4, 1, 1.5, 0.5, 0.5,
-3.779182, -4.052835, 4, 0, 1.5, 0.5, 0.5
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
-3.239053, -3.565068, -6.583815,
-3.239053, 2.938499, -6.583815,
-3.239053, -3.565068, 6.028641,
-3.239053, 2.938499, 6.028641,
-3.239053, -3.565068, -6.583815,
-3.239053, -3.565068, 6.028641,
-3.239053, 2.938499, -6.583815,
-3.239053, 2.938499, 6.028641,
-3.239053, -3.565068, -6.583815,
3.962664, -3.565068, -6.583815,
-3.239053, -3.565068, 6.028641,
3.962664, -3.565068, 6.028641,
-3.239053, 2.938499, -6.583815,
3.962664, 2.938499, -6.583815,
-3.239053, 2.938499, 6.028641,
3.962664, 2.938499, 6.028641,
3.962664, -3.565068, -6.583815,
3.962664, 2.938499, -6.583815,
3.962664, -3.565068, 6.028641,
3.962664, 2.938499, 6.028641,
3.962664, -3.565068, -6.583815,
3.962664, -3.565068, 6.028641,
3.962664, 2.938499, -6.583815,
3.962664, 2.938499, 6.028641
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
var radius = 8.497427;
var distance = 37.80601;
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
mvMatrix.translate( -0.3618053, 0.3132846, 0.2775867 );
mvMatrix.scale( 1.275749, 1.412699, 0.7284533 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.80601);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Sodium_dimethyldithi<-read.table("Sodium_dimethyldithi.xyz")
```

```
## Error in read.table("Sodium_dimethyldithi.xyz"): no lines available in input
```

```r
x<-Sodium_dimethyldithi$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_dimethyldithi' not found
```

```r
y<-Sodium_dimethyldithi$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_dimethyldithi' not found
```

```r
z<-Sodium_dimethyldithi$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_dimethyldithi' not found
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
-3.134174, 0.8680625, -1.949657, 0, 0, 1, 1, 1,
-2.954422, -0.8733478, -1.647737, 1, 0, 0, 1, 1,
-2.795178, 1.757182, -1.607662, 1, 0, 0, 1, 1,
-2.693718, -0.6448911, -0.02932323, 1, 0, 0, 1, 1,
-2.686207, -0.9976866, -2.522879, 1, 0, 0, 1, 1,
-2.638144, 1.386208, -0.6213909, 1, 0, 0, 1, 1,
-2.615301, -0.0739793, -0.2141071, 0, 0, 0, 1, 1,
-2.605481, -0.3799706, -3.031494, 0, 0, 0, 1, 1,
-2.5904, -0.7093858, -3.099067, 0, 0, 0, 1, 1,
-2.568674, -1.011592, -0.3478234, 0, 0, 0, 1, 1,
-2.534054, -1.560555, -1.078763, 0, 0, 0, 1, 1,
-2.523853, 0.6933741, -2.383179, 0, 0, 0, 1, 1,
-2.490031, -1.435221, -1.515019, 0, 0, 0, 1, 1,
-2.486309, 0.9367655, -1.276153, 1, 1, 1, 1, 1,
-2.444651, -0.1584872, -2.309783, 1, 1, 1, 1, 1,
-2.198354, -0.5907533, -2.310557, 1, 1, 1, 1, 1,
-2.184475, -1.361915, -0.9390903, 1, 1, 1, 1, 1,
-2.071547, 1.902033, -1.061743, 1, 1, 1, 1, 1,
-2.036048, 0.9215981, -2.024799, 1, 1, 1, 1, 1,
-2.020264, 0.02876136, -0.3616287, 1, 1, 1, 1, 1,
-2.017261, -1.882486, -3.336561, 1, 1, 1, 1, 1,
-1.999192, 1.162308, -1.559511, 1, 1, 1, 1, 1,
-1.977479, 0.5081795, -1.089419, 1, 1, 1, 1, 1,
-1.906153, -0.6195572, -2.399274, 1, 1, 1, 1, 1,
-1.897402, 1.433174, -0.651643, 1, 1, 1, 1, 1,
-1.89681, -1.352557, -3.064896, 1, 1, 1, 1, 1,
-1.887447, 0.8316525, -0.6528062, 1, 1, 1, 1, 1,
-1.839942, -1.12624, -2.307932, 1, 1, 1, 1, 1,
-1.835196, -0.4887899, -1.873636, 0, 0, 1, 1, 1,
-1.815351, 1.113671, -0.3266317, 1, 0, 0, 1, 1,
-1.790419, -0.7991515, -0.9507059, 1, 0, 0, 1, 1,
-1.78616, 2.194891, -0.6411038, 1, 0, 0, 1, 1,
-1.784119, 0.1680472, -1.978754, 1, 0, 0, 1, 1,
-1.757723, -0.3665841, -2.535844, 1, 0, 0, 1, 1,
-1.746985, 0.6793375, -2.301004, 0, 0, 0, 1, 1,
-1.746328, 0.893922, -1.70852, 0, 0, 0, 1, 1,
-1.745008, -1.170966, -2.018411, 0, 0, 0, 1, 1,
-1.734084, -1.13214, -0.1561598, 0, 0, 0, 1, 1,
-1.733049, -0.8851571, -3.161855, 0, 0, 0, 1, 1,
-1.717535, -0.2234167, -1.477361, 0, 0, 0, 1, 1,
-1.714407, -1.023207, -2.84287, 0, 0, 0, 1, 1,
-1.689338, 0.3242875, -1.037205, 1, 1, 1, 1, 1,
-1.686286, 0.4457217, 0.2924053, 1, 1, 1, 1, 1,
-1.675609, -0.08937389, -2.986778, 1, 1, 1, 1, 1,
-1.671627, 0.1567182, -2.800134, 1, 1, 1, 1, 1,
-1.670664, -1.147292, -2.433727, 1, 1, 1, 1, 1,
-1.641268, 1.179523, 0.9203733, 1, 1, 1, 1, 1,
-1.632039, 1.966098, 0.1760429, 1, 1, 1, 1, 1,
-1.627916, -0.08963896, -1.768071, 1, 1, 1, 1, 1,
-1.615845, -0.2980005, -1.270951, 1, 1, 1, 1, 1,
-1.595879, 0.2214188, -1.06762, 1, 1, 1, 1, 1,
-1.593262, -0.08128142, -1.748589, 1, 1, 1, 1, 1,
-1.584581, 0.2185195, -1.32982, 1, 1, 1, 1, 1,
-1.577038, -0.7437807, -1.6238, 1, 1, 1, 1, 1,
-1.570925, 0.01320945, -1.379055, 1, 1, 1, 1, 1,
-1.565391, -0.6832847, -2.201421, 1, 1, 1, 1, 1,
-1.551684, -1.040889, -1.445324, 0, 0, 1, 1, 1,
-1.550864, 0.3477537, -0.3118509, 1, 0, 0, 1, 1,
-1.536629, 0.8129881, -0.09507148, 1, 0, 0, 1, 1,
-1.535955, -0.0003208762, -0.854806, 1, 0, 0, 1, 1,
-1.535389, -0.2616503, 1.190763, 1, 0, 0, 1, 1,
-1.528151, -0.3033442, -2.525222, 1, 0, 0, 1, 1,
-1.526363, -0.7371335, -0.7926133, 0, 0, 0, 1, 1,
-1.521351, 1.177078, -1.634439, 0, 0, 0, 1, 1,
-1.51835, 0.6009441, -1.419313, 0, 0, 0, 1, 1,
-1.499526, -2.261438, -2.600228, 0, 0, 0, 1, 1,
-1.490847, 0.1390566, -3.353384, 0, 0, 0, 1, 1,
-1.488081, -1.125886, -2.132266, 0, 0, 0, 1, 1,
-1.487649, -0.9227069, -1.325588, 0, 0, 0, 1, 1,
-1.462957, 2.072022, -0.3615589, 1, 1, 1, 1, 1,
-1.456668, -0.6130391, -2.141231, 1, 1, 1, 1, 1,
-1.448701, 0.4847098, -0.9005527, 1, 1, 1, 1, 1,
-1.440982, 0.4817951, -2.479414, 1, 1, 1, 1, 1,
-1.421235, 0.519356, -3.245554, 1, 1, 1, 1, 1,
-1.414785, -0.6520009, -1.669541, 1, 1, 1, 1, 1,
-1.412937, 0.2194708, -0.02817225, 1, 1, 1, 1, 1,
-1.408615, 1.962336, -2.160159, 1, 1, 1, 1, 1,
-1.396621, 0.8254175, -1.638907, 1, 1, 1, 1, 1,
-1.395637, 0.7712365, -1.325942, 1, 1, 1, 1, 1,
-1.391192, 0.06608126, -1.417174, 1, 1, 1, 1, 1,
-1.384543, -1.504887, -1.869972, 1, 1, 1, 1, 1,
-1.377953, 0.3915142, -2.134848, 1, 1, 1, 1, 1,
-1.376079, 0.4322965, -1.471471, 1, 1, 1, 1, 1,
-1.365054, -0.3604137, -0.4732389, 1, 1, 1, 1, 1,
-1.354922, 0.2056278, -2.288553, 0, 0, 1, 1, 1,
-1.337867, -0.3079521, -1.795025, 1, 0, 0, 1, 1,
-1.318739, 0.1055794, -1.344347, 1, 0, 0, 1, 1,
-1.315872, 0.625057, -0.7848268, 1, 0, 0, 1, 1,
-1.304316, -0.4999781, -2.30619, 1, 0, 0, 1, 1,
-1.303806, 0.3502039, -0.5411679, 1, 0, 0, 1, 1,
-1.271243, -0.9142757, -1.888161, 0, 0, 0, 1, 1,
-1.254895, -1.045154, -1.461695, 0, 0, 0, 1, 1,
-1.236091, 1.932864, -0.09422108, 0, 0, 0, 1, 1,
-1.236077, 0.3252681, -1.15091, 0, 0, 0, 1, 1,
-1.23398, -0.2391724, -0.6740331, 0, 0, 0, 1, 1,
-1.232955, 1.377007, -2.3552, 0, 0, 0, 1, 1,
-1.226767, -0.1543332, -0.5443853, 0, 0, 0, 1, 1,
-1.211596, -0.5056864, -2.652142, 1, 1, 1, 1, 1,
-1.209527, -1.391029, -2.860584, 1, 1, 1, 1, 1,
-1.208252, -2.252212, -1.91135, 1, 1, 1, 1, 1,
-1.208042, 1.111772, -0.3266524, 1, 1, 1, 1, 1,
-1.203193, -0.2961647, -2.037019, 1, 1, 1, 1, 1,
-1.201133, 0.09044241, -2.201807, 1, 1, 1, 1, 1,
-1.192824, 0.8395808, -1.915255, 1, 1, 1, 1, 1,
-1.164309, 0.6308627, -1.299961, 1, 1, 1, 1, 1,
-1.155428, 1.515265, 0.3985798, 1, 1, 1, 1, 1,
-1.146855, -0.3826656, -1.809726, 1, 1, 1, 1, 1,
-1.146307, 0.5157862, -2.931626, 1, 1, 1, 1, 1,
-1.135218, -0.09118205, -1.169756, 1, 1, 1, 1, 1,
-1.12927, -0.9562934, -1.990376, 1, 1, 1, 1, 1,
-1.127822, -0.3145583, -1.397755, 1, 1, 1, 1, 1,
-1.119789, -0.153949, -1.149199, 1, 1, 1, 1, 1,
-1.11808, 1.717406, -0.03378186, 0, 0, 1, 1, 1,
-1.106944, -0.5370296, -1.886716, 1, 0, 0, 1, 1,
-1.10629, 0.5780514, -1.054396, 1, 0, 0, 1, 1,
-1.106251, 1.392468, -1.472382, 1, 0, 0, 1, 1,
-1.101501, -0.3349026, -2.917351, 1, 0, 0, 1, 1,
-1.10048, -0.3080238, -3.281729, 1, 0, 0, 1, 1,
-1.094479, 0.8358768, -1.254711, 0, 0, 0, 1, 1,
-1.089661, 0.3393396, 0.1064195, 0, 0, 0, 1, 1,
-1.078737, 0.02813107, -0.7489406, 0, 0, 0, 1, 1,
-1.073019, -1.090252, -3.526291, 0, 0, 0, 1, 1,
-1.072224, 0.5162108, 0.06384303, 0, 0, 0, 1, 1,
-1.06956, -0.2705035, -3.069952, 0, 0, 0, 1, 1,
-1.065313, 0.1342826, -2.870205, 0, 0, 0, 1, 1,
-1.063318, -1.708176, -1.722692, 1, 1, 1, 1, 1,
-1.059907, 0.50087, -0.170355, 1, 1, 1, 1, 1,
-1.059576, 1.132736, -1.07468, 1, 1, 1, 1, 1,
-1.05788, -1.504867, -1.526118, 1, 1, 1, 1, 1,
-1.047822, -0.02658965, -3.241002, 1, 1, 1, 1, 1,
-1.044969, 1.485641, -1.074664, 1, 1, 1, 1, 1,
-1.043305, 0.708517, -2.809219, 1, 1, 1, 1, 1,
-1.041685, 0.8383411, -0.05732509, 1, 1, 1, 1, 1,
-1.031204, -1.637226, -0.9499197, 1, 1, 1, 1, 1,
-1.026302, 0.7141332, -2.264404, 1, 1, 1, 1, 1,
-1.025887, 0.05934548, -3.951466, 1, 1, 1, 1, 1,
-1.024603, -1.400666, -2.635318, 1, 1, 1, 1, 1,
-1.015713, 1.227808, -1.293869, 1, 1, 1, 1, 1,
-1.010959, -0.8775496, -3.977752, 1, 1, 1, 1, 1,
-1.010201, -0.7805239, -0.6994306, 1, 1, 1, 1, 1,
-1.009758, 0.3393734, -0.2665896, 0, 0, 1, 1, 1,
-1.007876, 0.3238673, -0.867841, 1, 0, 0, 1, 1,
-1.003849, -0.01499513, -2.145114, 1, 0, 0, 1, 1,
-1.003305, 0.415204, 0.2002789, 1, 0, 0, 1, 1,
-1.001318, -1.107435, -1.741501, 1, 0, 0, 1, 1,
-1.000094, -0.7965837, -3.396302, 1, 0, 0, 1, 1,
-0.9989747, -1.731224, -2.0146, 0, 0, 0, 1, 1,
-0.9983357, -0.4640997, -3.60601, 0, 0, 0, 1, 1,
-0.9963553, 0.7130287, 0.8760133, 0, 0, 0, 1, 1,
-0.9962655, -1.083771, -2.174013, 0, 0, 0, 1, 1,
-0.9929689, 0.9957311, -1.8687, 0, 0, 0, 1, 1,
-0.9884539, -0.5574657, -2.331292, 0, 0, 0, 1, 1,
-0.9872158, 0.162164, 0.09382223, 0, 0, 0, 1, 1,
-0.9859866, 0.1352834, -2.735651, 1, 1, 1, 1, 1,
-0.9825401, 1.489294, -0.3665072, 1, 1, 1, 1, 1,
-0.9801062, 1.518932, -1.977648, 1, 1, 1, 1, 1,
-0.9798208, -0.9535428, -2.859979, 1, 1, 1, 1, 1,
-0.9752349, -0.7983081, -1.946899, 1, 1, 1, 1, 1,
-0.9703773, -0.7647104, -4.090049, 1, 1, 1, 1, 1,
-0.9661803, 1.196595, -1.150272, 1, 1, 1, 1, 1,
-0.9632754, 0.6403568, -0.1636354, 1, 1, 1, 1, 1,
-0.9575112, 0.6451483, -1.991559, 1, 1, 1, 1, 1,
-0.9557142, 0.7833701, 0.377296, 1, 1, 1, 1, 1,
-0.9488705, 0.7448189, 0.8534385, 1, 1, 1, 1, 1,
-0.9443213, 0.5100999, 0.6485805, 1, 1, 1, 1, 1,
-0.9420598, 0.0190273, -2.157267, 1, 1, 1, 1, 1,
-0.9376764, -0.6674424, -2.971789, 1, 1, 1, 1, 1,
-0.9354085, 0.214633, -0.3515291, 1, 1, 1, 1, 1,
-0.9334897, -0.2899021, -1.71408, 0, 0, 1, 1, 1,
-0.9311236, -0.9528434, -3.377688, 1, 0, 0, 1, 1,
-0.9308935, 0.4800433, -2.425265, 1, 0, 0, 1, 1,
-0.9304315, -0.5813013, -1.928742, 1, 0, 0, 1, 1,
-0.9263416, 0.2340195, -2.751835, 1, 0, 0, 1, 1,
-0.9261521, 0.4851261, 1.225349, 1, 0, 0, 1, 1,
-0.9240445, -0.3053929, -1.165162, 0, 0, 0, 1, 1,
-0.9221979, 1.428267, -2.254149, 0, 0, 0, 1, 1,
-0.9193017, -0.8548328, -0.744682, 0, 0, 0, 1, 1,
-0.9185393, 0.3211633, -1.954663, 0, 0, 0, 1, 1,
-0.9183664, -1.255043, -2.918696, 0, 0, 0, 1, 1,
-0.9088061, 0.06144584, -1.624203, 0, 0, 0, 1, 1,
-0.9037507, -0.8248861, -0.9215438, 0, 0, 0, 1, 1,
-0.897226, -0.7436628, -2.18597, 1, 1, 1, 1, 1,
-0.8961183, -0.6234974, -3.030766, 1, 1, 1, 1, 1,
-0.8951052, 0.3777791, -0.3682471, 1, 1, 1, 1, 1,
-0.8937734, -0.2265302, -0.9031914, 1, 1, 1, 1, 1,
-0.8929566, 0.4978846, -0.7304785, 1, 1, 1, 1, 1,
-0.890601, -1.716659, 0.1324016, 1, 1, 1, 1, 1,
-0.890169, 0.6400579, -0.9603388, 1, 1, 1, 1, 1,
-0.8894504, 0.9206575, -1.730378, 1, 1, 1, 1, 1,
-0.8875744, 0.1830434, -3.433136, 1, 1, 1, 1, 1,
-0.8820961, 2.538649, 0.9155397, 1, 1, 1, 1, 1,
-0.8798968, 0.2900144, 0.2588521, 1, 1, 1, 1, 1,
-0.8752679, -0.1754986, -1.751206, 1, 1, 1, 1, 1,
-0.8714343, 0.3542126, 0.3846932, 1, 1, 1, 1, 1,
-0.8687184, -1.396476, -2.816647, 1, 1, 1, 1, 1,
-0.8666548, -1.245708, -2.304931, 1, 1, 1, 1, 1,
-0.863462, -1.757365, -3.39437, 0, 0, 1, 1, 1,
-0.8626626, 1.377633, -1.421816, 1, 0, 0, 1, 1,
-0.8556764, -0.02149549, -1.294092, 1, 0, 0, 1, 1,
-0.8550031, 0.8973929, -1.206212, 1, 0, 0, 1, 1,
-0.85274, 0.8865962, 0.08769095, 1, 0, 0, 1, 1,
-0.847591, -2.033293, -4.143857, 1, 0, 0, 1, 1,
-0.8462269, 0.3576515, -1.237663, 0, 0, 0, 1, 1,
-0.8459704, -0.4871711, -3.582126, 0, 0, 0, 1, 1,
-0.8415164, -0.663622, -2.521505, 0, 0, 0, 1, 1,
-0.8391114, -1.552031, -1.904348, 0, 0, 0, 1, 1,
-0.8369224, 0.1878287, -2.109103, 0, 0, 0, 1, 1,
-0.8366619, -0.784411, -1.371184, 0, 0, 0, 1, 1,
-0.8316532, 0.7668368, -0.5091031, 0, 0, 0, 1, 1,
-0.8297123, 0.02429899, -3.14192, 1, 1, 1, 1, 1,
-0.8285614, -0.8191881, -3.610856, 1, 1, 1, 1, 1,
-0.8244367, 0.8814149, -0.9404382, 1, 1, 1, 1, 1,
-0.8244357, 0.0798581, -0.2375795, 1, 1, 1, 1, 1,
-0.8242057, -0.07830004, -2.028521, 1, 1, 1, 1, 1,
-0.8209267, 1.350957, -0.5177376, 1, 1, 1, 1, 1,
-0.8208863, 1.048408, -1.974728, 1, 1, 1, 1, 1,
-0.8207715, 0.3252446, 1.042277, 1, 1, 1, 1, 1,
-0.8110985, -0.2569188, -1.113885, 1, 1, 1, 1, 1,
-0.8085289, 1.02504, -0.1925972, 1, 1, 1, 1, 1,
-0.8036813, 0.7738008, -0.8513211, 1, 1, 1, 1, 1,
-0.7961263, -0.8916827, -1.80733, 1, 1, 1, 1, 1,
-0.7884483, 0.3382618, -2.099065, 1, 1, 1, 1, 1,
-0.7777318, -0.8570541, -2.343636, 1, 1, 1, 1, 1,
-0.7719893, 1.014801, -0.673165, 1, 1, 1, 1, 1,
-0.7710411, 0.07973047, -1.218989, 0, 0, 1, 1, 1,
-0.7698859, -0.8477462, -2.028726, 1, 0, 0, 1, 1,
-0.7662839, -1.075515, -2.520365, 1, 0, 0, 1, 1,
-0.7646056, -0.7516974, -2.329288, 1, 0, 0, 1, 1,
-0.7644122, 0.9135389, -0.5032247, 1, 0, 0, 1, 1,
-0.7640452, -1.423351, -2.294511, 1, 0, 0, 1, 1,
-0.7562784, -0.01816348, -0.8921138, 0, 0, 0, 1, 1,
-0.7556245, -0.7641042, -2.135804, 0, 0, 0, 1, 1,
-0.7546834, 1.338709, -1.010992, 0, 0, 0, 1, 1,
-0.7483686, -0.4583476, -2.846569, 0, 0, 0, 1, 1,
-0.7462113, -0.04391714, -2.847587, 0, 0, 0, 1, 1,
-0.7425752, 0.03537558, -1.767929, 0, 0, 0, 1, 1,
-0.741847, 1.830495, -0.1041173, 0, 0, 0, 1, 1,
-0.7409656, 0.1054496, -1.046621, 1, 1, 1, 1, 1,
-0.7381941, 0.7726027, -0.4031734, 1, 1, 1, 1, 1,
-0.7369414, 0.4128711, -3.278991, 1, 1, 1, 1, 1,
-0.7255324, -1.131113, -3.456307, 1, 1, 1, 1, 1,
-0.7233424, -0.7224756, -2.169438, 1, 1, 1, 1, 1,
-0.7211909, 1.349284, -1.270204, 1, 1, 1, 1, 1,
-0.7189119, 0.7406783, -1.268554, 1, 1, 1, 1, 1,
-0.7150077, -0.8985527, -2.949467, 1, 1, 1, 1, 1,
-0.7135702, 0.7814071, -1.860894, 1, 1, 1, 1, 1,
-0.7105715, 0.7196158, -0.985055, 1, 1, 1, 1, 1,
-0.7094997, -0.7060086, -2.885554, 1, 1, 1, 1, 1,
-0.7057801, -1.305393, -3.186022, 1, 1, 1, 1, 1,
-0.6939803, -0.4145585, -0.9478533, 1, 1, 1, 1, 1,
-0.6930776, 1.298679, 0.5498011, 1, 1, 1, 1, 1,
-0.6916896, 0.3346736, -1.33092, 1, 1, 1, 1, 1,
-0.6899891, -1.108764, -4.052748, 0, 0, 1, 1, 1,
-0.6879062, -0.4991409, -1.745021, 1, 0, 0, 1, 1,
-0.6807742, 0.3748703, 0.2699079, 1, 0, 0, 1, 1,
-0.6800565, 1.08079, -0.3392608, 1, 0, 0, 1, 1,
-0.6769807, 0.7343757, -0.1660903, 1, 0, 0, 1, 1,
-0.6748548, -0.6373259, -3.479976, 1, 0, 0, 1, 1,
-0.6683826, 0.2836077, -0.7820889, 0, 0, 0, 1, 1,
-0.6662031, 0.6031071, -0.7750756, 0, 0, 0, 1, 1,
-0.6583067, -0.9138545, -2.203589, 0, 0, 0, 1, 1,
-0.6522758, 0.4609666, -0.3831298, 0, 0, 0, 1, 1,
-0.6518241, -0.506837, -2.581013, 0, 0, 0, 1, 1,
-0.6515978, 0.3226287, 0.5345481, 0, 0, 0, 1, 1,
-0.6454148, 0.3486716, -1.347533, 0, 0, 0, 1, 1,
-0.6448847, 0.4908979, 0.6957443, 1, 1, 1, 1, 1,
-0.6386818, -2.523955, -3.295111, 1, 1, 1, 1, 1,
-0.6384835, -1.693365, -2.281743, 1, 1, 1, 1, 1,
-0.6338954, 0.8312429, -3.341617, 1, 1, 1, 1, 1,
-0.6299876, -0.1446188, -2.005113, 1, 1, 1, 1, 1,
-0.6294544, -1.062228, -3.399513, 1, 1, 1, 1, 1,
-0.6279035, 0.2601303, -0.2430676, 1, 1, 1, 1, 1,
-0.6275186, -0.5306904, -2.089981, 1, 1, 1, 1, 1,
-0.6267884, 1.68046, 0.4153565, 1, 1, 1, 1, 1,
-0.6230841, -1.592537, -3.326258, 1, 1, 1, 1, 1,
-0.6224328, 1.396124, -0.4111793, 1, 1, 1, 1, 1,
-0.6214967, 0.3878651, -2.343573, 1, 1, 1, 1, 1,
-0.6169682, -2.433741, -2.602079, 1, 1, 1, 1, 1,
-0.6156639, 0.09263285, -1.115427, 1, 1, 1, 1, 1,
-0.6033105, 0.5037069, -2.551743, 1, 1, 1, 1, 1,
-0.5975326, -0.761151, -2.451103, 0, 0, 1, 1, 1,
-0.5963056, 2.12468, 0.2093042, 1, 0, 0, 1, 1,
-0.5936562, -0.6780797, -1.849706, 1, 0, 0, 1, 1,
-0.5917158, 1.855863, -0.9943846, 1, 0, 0, 1, 1,
-0.5899562, 1.388942, 0.02534849, 1, 0, 0, 1, 1,
-0.5892498, 0.3738399, 0.4829142, 1, 0, 0, 1, 1,
-0.5887892, 2.064003, -0.8587043, 0, 0, 0, 1, 1,
-0.5861773, -0.8778262, -3.816589, 0, 0, 0, 1, 1,
-0.5776778, 0.03761923, -1.17646, 0, 0, 0, 1, 1,
-0.5764673, -0.7836691, -1.616695, 0, 0, 0, 1, 1,
-0.5752652, -0.4254788, -1.546861, 0, 0, 0, 1, 1,
-0.5727706, 0.8266659, 0.5044439, 0, 0, 0, 1, 1,
-0.5724766, -0.1613174, -0.2349574, 0, 0, 0, 1, 1,
-0.5651747, 0.4837533, 0.6158148, 1, 1, 1, 1, 1,
-0.5627776, 0.1836493, -1.777067, 1, 1, 1, 1, 1,
-0.5616134, 0.2014417, -0.004477599, 1, 1, 1, 1, 1,
-0.5596703, -1.350691, -2.105574, 1, 1, 1, 1, 1,
-0.5497084, -0.2689943, -1.944147, 1, 1, 1, 1, 1,
-0.5473636, -1.162086, -2.348309, 1, 1, 1, 1, 1,
-0.5400506, -0.1754636, -2.983279, 1, 1, 1, 1, 1,
-0.5397868, 1.685161, 1.050715, 1, 1, 1, 1, 1,
-0.5369115, 1.167101, 0.3448264, 1, 1, 1, 1, 1,
-0.5336587, -1.020063, -3.325503, 1, 1, 1, 1, 1,
-0.5328872, -0.9714453, -2.399535, 1, 1, 1, 1, 1,
-0.5287985, 0.5953957, -0.172254, 1, 1, 1, 1, 1,
-0.5225348, -1.180826, -4.072127, 1, 1, 1, 1, 1,
-0.5170657, -0.8990619, -3.006526, 1, 1, 1, 1, 1,
-0.5169171, 0.6258712, -0.3353576, 1, 1, 1, 1, 1,
-0.5168364, -1.601124, -3.201464, 0, 0, 1, 1, 1,
-0.516221, 1.264048, -1.715048, 1, 0, 0, 1, 1,
-0.5138105, 1.281851, 0.6066614, 1, 0, 0, 1, 1,
-0.5129874, -0.3494487, -1.363838, 1, 0, 0, 1, 1,
-0.5098811, -1.184317, -4.543828, 1, 0, 0, 1, 1,
-0.5019386, 0.7793281, -2.04923, 1, 0, 0, 1, 1,
-0.501717, -1.294675, -2.334845, 0, 0, 0, 1, 1,
-0.5002931, -0.4424237, -0.494905, 0, 0, 0, 1, 1,
-0.4948969, 1.581841, -1.046658, 0, 0, 0, 1, 1,
-0.4907086, -0.2588656, -2.514241, 0, 0, 0, 1, 1,
-0.4900089, 0.814199, 0.1062422, 0, 0, 0, 1, 1,
-0.4889166, 0.9395809, -1.482943, 0, 0, 0, 1, 1,
-0.4832223, 1.80314, -1.986474, 0, 0, 0, 1, 1,
-0.4799453, -2.074528, -2.8549, 1, 1, 1, 1, 1,
-0.479832, -1.008024, -2.086089, 1, 1, 1, 1, 1,
-0.4793521, -0.9419335, -3.436809, 1, 1, 1, 1, 1,
-0.476673, -1.962439, -2.575648, 1, 1, 1, 1, 1,
-0.4732361, -0.9109347, -4.051606, 1, 1, 1, 1, 1,
-0.4709106, -0.6623551, -2.726678, 1, 1, 1, 1, 1,
-0.4682153, 0.3368741, 0.5154484, 1, 1, 1, 1, 1,
-0.4674996, -0.09330076, -1.891741, 1, 1, 1, 1, 1,
-0.4638118, 0.4310497, -1.113179, 1, 1, 1, 1, 1,
-0.4619244, -1.051772, -2.453071, 1, 1, 1, 1, 1,
-0.4614223, -0.5486289, -3.276634, 1, 1, 1, 1, 1,
-0.459612, 0.402498, -1.451631, 1, 1, 1, 1, 1,
-0.4584765, 1.473128, -0.08129493, 1, 1, 1, 1, 1,
-0.4576355, -0.1540725, -2.523191, 1, 1, 1, 1, 1,
-0.4518649, -0.2215112, -2.749326, 1, 1, 1, 1, 1,
-0.4500747, -0.6539804, -2.135895, 0, 0, 1, 1, 1,
-0.4491207, -0.235393, -1.483911, 1, 0, 0, 1, 1,
-0.4473222, -1.325055, -4.302234, 1, 0, 0, 1, 1,
-0.4452545, 0.8436232, -0.04850693, 1, 0, 0, 1, 1,
-0.4329261, -0.4787115, -1.286831, 1, 0, 0, 1, 1,
-0.4323446, 0.7404563, -0.2333383, 1, 0, 0, 1, 1,
-0.4316056, -1.074754, -3.990469, 0, 0, 0, 1, 1,
-0.4303509, -0.5498292, -3.034462, 0, 0, 0, 1, 1,
-0.4288146, 0.0670194, -4.589776, 0, 0, 0, 1, 1,
-0.4287868, -1.400597, -2.91749, 0, 0, 0, 1, 1,
-0.4286561, 1.2347, -2.340991, 0, 0, 0, 1, 1,
-0.4275967, 0.7299618, -0.01759876, 0, 0, 0, 1, 1,
-0.4231479, -0.2994921, -1.262566, 0, 0, 0, 1, 1,
-0.4224292, -0.9339186, -3.417343, 1, 1, 1, 1, 1,
-0.4161745, -0.7754793, -2.481256, 1, 1, 1, 1, 1,
-0.4159509, -1.873974, -4.255689, 1, 1, 1, 1, 1,
-0.4102916, -2.020322, -1.856199, 1, 1, 1, 1, 1,
-0.4092315, -0.02827427, -1.309675, 1, 1, 1, 1, 1,
-0.4079967, -0.6821076, -2.72111, 1, 1, 1, 1, 1,
-0.4079849, -0.5191269, -1.812924, 1, 1, 1, 1, 1,
-0.4060758, 0.8514337, -0.6461866, 1, 1, 1, 1, 1,
-0.4001329, -1.184181, -2.58621, 1, 1, 1, 1, 1,
-0.3976904, -1.038338, -2.654827, 1, 1, 1, 1, 1,
-0.3942581, 0.7561197, -1.14402, 1, 1, 1, 1, 1,
-0.3921226, -2.306881, -2.461555, 1, 1, 1, 1, 1,
-0.391031, -0.8118557, -3.203516, 1, 1, 1, 1, 1,
-0.3905452, 0.03139693, -1.373993, 1, 1, 1, 1, 1,
-0.3892846, 0.2573633, -2.137401, 1, 1, 1, 1, 1,
-0.3883995, -2.606982, -2.424616, 0, 0, 1, 1, 1,
-0.3867082, 1.108193, 0.6067488, 1, 0, 0, 1, 1,
-0.3861476, 0.3250317, -1.257268, 1, 0, 0, 1, 1,
-0.3837178, -1.347004, -2.731312, 1, 0, 0, 1, 1,
-0.3813448, -0.5922666, -2.002034, 1, 0, 0, 1, 1,
-0.3784031, 0.3072049, -1.80586, 1, 0, 0, 1, 1,
-0.3735664, -0.3774306, -2.969591, 0, 0, 0, 1, 1,
-0.3708463, 0.4541073, 2.144232, 0, 0, 0, 1, 1,
-0.3688541, -0.7739007, -2.613429, 0, 0, 0, 1, 1,
-0.3665971, 0.1289711, -1.369223, 0, 0, 0, 1, 1,
-0.3582507, 0.9047723, -1.696249, 0, 0, 0, 1, 1,
-0.3513253, -0.637796, -3.172265, 0, 0, 0, 1, 1,
-0.3454939, -0.7346537, -1.879406, 0, 0, 0, 1, 1,
-0.3435192, 0.5231334, -1.415121, 1, 1, 1, 1, 1,
-0.3405808, 0.8667663, -0.602863, 1, 1, 1, 1, 1,
-0.3399884, 1.347279, -1.064972, 1, 1, 1, 1, 1,
-0.3367664, -0.51264, -2.733341, 1, 1, 1, 1, 1,
-0.3329205, -1.009209, -1.280504, 1, 1, 1, 1, 1,
-0.3276898, 0.2072277, -0.3573621, 1, 1, 1, 1, 1,
-0.3268164, 1.687356, -1.549556, 1, 1, 1, 1, 1,
-0.3256854, 0.6048434, -1.807691, 1, 1, 1, 1, 1,
-0.3236705, -0.7820277, -2.351275, 1, 1, 1, 1, 1,
-0.3203213, 1.53181, -0.2790284, 1, 1, 1, 1, 1,
-0.3168702, -1.147039, -5.595272, 1, 1, 1, 1, 1,
-0.3155819, 0.8671905, -0.8446623, 1, 1, 1, 1, 1,
-0.3149657, 0.7454559, 1.844319, 1, 1, 1, 1, 1,
-0.3104799, 0.7391853, 0.5873617, 1, 1, 1, 1, 1,
-0.3073856, 0.2227252, -0.2400507, 1, 1, 1, 1, 1,
-0.3054345, 1.584299, 0.6210423, 0, 0, 1, 1, 1,
-0.3041847, 0.1438603, -1.101428, 1, 0, 0, 1, 1,
-0.3035435, 0.01292916, -2.239065, 1, 0, 0, 1, 1,
-0.2976458, -1.503688, -3.002958, 1, 0, 0, 1, 1,
-0.2918237, 0.6217163, -0.3462574, 1, 0, 0, 1, 1,
-0.2890088, 0.1813727, -0.3816888, 1, 0, 0, 1, 1,
-0.2872589, 0.4926827, -1.869034, 0, 0, 0, 1, 1,
-0.2866676, -1.131346, -3.778854, 0, 0, 0, 1, 1,
-0.2858278, -0.3340865, -3.603344, 0, 0, 0, 1, 1,
-0.2783661, -0.8580527, -1.85992, 0, 0, 0, 1, 1,
-0.2782466, -0.5777692, -3.66078, 0, 0, 0, 1, 1,
-0.2754814, 0.2983511, -1.350573, 0, 0, 0, 1, 1,
-0.2606073, -0.8798946, -6.400138, 0, 0, 0, 1, 1,
-0.2579378, -1.370499, -3.738625, 1, 1, 1, 1, 1,
-0.2554038, 0.6481544, -0.08430598, 1, 1, 1, 1, 1,
-0.2548941, -0.08626833, -2.300658, 1, 1, 1, 1, 1,
-0.2511508, -1.091797, -2.007254, 1, 1, 1, 1, 1,
-0.2460109, -0.132046, -2.594297, 1, 1, 1, 1, 1,
-0.2458123, 0.3534008, -1.381519, 1, 1, 1, 1, 1,
-0.2430431, -0.2136501, -2.995869, 1, 1, 1, 1, 1,
-0.2425129, -0.3684707, -2.09361, 1, 1, 1, 1, 1,
-0.2374484, -1.214406, -3.40349, 1, 1, 1, 1, 1,
-0.2354457, -2.127863, -2.533287, 1, 1, 1, 1, 1,
-0.2343245, -0.7647969, -0.326054, 1, 1, 1, 1, 1,
-0.2303051, -0.4409092, -1.760352, 1, 1, 1, 1, 1,
-0.2181713, 0.3819291, 0.1228626, 1, 1, 1, 1, 1,
-0.2164724, 1.208767, -0.8952085, 1, 1, 1, 1, 1,
-0.2146803, -1.186271, -4.694168, 1, 1, 1, 1, 1,
-0.2087479, 0.2745684, -0.4092811, 0, 0, 1, 1, 1,
-0.2065316, 0.3958069, -0.9374788, 1, 0, 0, 1, 1,
-0.2051674, -0.4737481, -2.080191, 1, 0, 0, 1, 1,
-0.2015603, 0.047059, -1.762544, 1, 0, 0, 1, 1,
-0.1958617, -1.09638, -2.910253, 1, 0, 0, 1, 1,
-0.1888946, 1.298238, 2.27074, 1, 0, 0, 1, 1,
-0.186959, 0.8271064, -2.121593, 0, 0, 0, 1, 1,
-0.1833045, -0.01858145, -0.2793037, 0, 0, 0, 1, 1,
-0.1826082, -0.2028799, -3.008459, 0, 0, 0, 1, 1,
-0.1766777, 0.8019764, 0.06901114, 0, 0, 0, 1, 1,
-0.1757136, 0.3767648, 0.1627455, 0, 0, 0, 1, 1,
-0.1728999, -1.469642, -2.318205, 0, 0, 0, 1, 1,
-0.1712811, -0.8097129, -3.498967, 0, 0, 0, 1, 1,
-0.1710169, -0.6426415, -1.267921, 1, 1, 1, 1, 1,
-0.1679719, 0.5996227, -0.79666, 1, 1, 1, 1, 1,
-0.1633932, 1.13632, -0.1051625, 1, 1, 1, 1, 1,
-0.1611599, 0.7559115, 1.41354, 1, 1, 1, 1, 1,
-0.1610856, 0.5410054, -1.036694, 1, 1, 1, 1, 1,
-0.1589331, -1.62313, -2.851147, 1, 1, 1, 1, 1,
-0.1570032, 1.357245, 0.7532426, 1, 1, 1, 1, 1,
-0.1553014, 0.5189686, 0.1013056, 1, 1, 1, 1, 1,
-0.1467016, 1.256214, 0.621938, 1, 1, 1, 1, 1,
-0.1432737, 0.6337458, -0.2595614, 1, 1, 1, 1, 1,
-0.1419786, -0.2198627, -1.953639, 1, 1, 1, 1, 1,
-0.1406237, 1.312582, 0.1577486, 1, 1, 1, 1, 1,
-0.1379353, 0.009217084, -3.40719, 1, 1, 1, 1, 1,
-0.1376516, 0.3562447, 0.6727332, 1, 1, 1, 1, 1,
-0.1371044, 2.843787, 0.5009543, 1, 1, 1, 1, 1,
-0.1343237, 0.9610468, -0.4784354, 0, 0, 1, 1, 1,
-0.1330351, 0.311942, 0.3476307, 1, 0, 0, 1, 1,
-0.1320642, -0.7614659, -1.261965, 1, 0, 0, 1, 1,
-0.1285082, 0.9875565, -0.07302193, 1, 0, 0, 1, 1,
-0.1268591, -1.314769, -3.185289, 1, 0, 0, 1, 1,
-0.1229575, -0.1008251, -2.916467, 1, 0, 0, 1, 1,
-0.1229486, 0.1120788, -1.068115, 0, 0, 0, 1, 1,
-0.1163403, 0.8145362, 2.036668, 0, 0, 0, 1, 1,
-0.1140273, -0.4755263, -2.322473, 0, 0, 0, 1, 1,
-0.1137994, 0.6227733, -2.116079, 0, 0, 0, 1, 1,
-0.1116138, -0.7769556, -2.68023, 0, 0, 0, 1, 1,
-0.1076564, -1.205301, -2.486558, 0, 0, 0, 1, 1,
-0.1064162, 0.6655973, 0.2863588, 0, 0, 0, 1, 1,
-0.1046, -2.583788, -6.213486, 1, 1, 1, 1, 1,
-0.1003789, -1.321964, -1.515825, 1, 1, 1, 1, 1,
-0.09994676, -1.499895, -2.398127, 1, 1, 1, 1, 1,
-0.09939226, 0.9721501, -1.553286, 1, 1, 1, 1, 1,
-0.09401378, 2.059896, 1.050483, 1, 1, 1, 1, 1,
-0.09088118, 0.07664865, 0.8328294, 1, 1, 1, 1, 1,
-0.08691943, 0.9227875, -0.5443584, 1, 1, 1, 1, 1,
-0.08681365, 0.1816499, -1.087713, 1, 1, 1, 1, 1,
-0.08428927, 0.5225127, 0.2941354, 1, 1, 1, 1, 1,
-0.08209231, 1.069043, 0.5563513, 1, 1, 1, 1, 1,
-0.08036561, 0.8379446, -1.280444, 1, 1, 1, 1, 1,
-0.07918258, -1.291324, -2.397124, 1, 1, 1, 1, 1,
-0.07701232, -2.423214, -3.065449, 1, 1, 1, 1, 1,
-0.07034993, 0.4477754, -1.687639, 1, 1, 1, 1, 1,
-0.07000412, -0.2297656, -4.106549, 1, 1, 1, 1, 1,
-0.0653308, 1.024311, -0.4414724, 0, 0, 1, 1, 1,
-0.06381439, -2.340869, -3.16819, 1, 0, 0, 1, 1,
-0.06360766, 0.13231, -0.1891101, 1, 0, 0, 1, 1,
-0.05746556, 1.792312, 1.055695, 1, 0, 0, 1, 1,
-0.0549176, -0.4501518, -3.447868, 1, 0, 0, 1, 1,
-0.05287125, 1.761791, 0.7232018, 1, 0, 0, 1, 1,
-0.05110984, -0.1591666, -3.607018, 0, 0, 0, 1, 1,
-0.05043414, 0.2371828, -0.6353441, 0, 0, 0, 1, 1,
-0.04952103, 1.750843, 0.07269702, 0, 0, 0, 1, 1,
-0.04696801, -0.5006728, -4.356048, 0, 0, 0, 1, 1,
-0.04538213, 1.153648, -0.8712574, 0, 0, 0, 1, 1,
-0.04432496, -0.4527426, -3.186614, 0, 0, 0, 1, 1,
-0.03942634, 1.052549, -2.157671, 0, 0, 0, 1, 1,
-0.03770068, -0.5720794, -3.505223, 1, 1, 1, 1, 1,
-0.0288966, -0.04465871, -2.439427, 1, 1, 1, 1, 1,
-0.02586183, 0.8282224, 0.03973628, 1, 1, 1, 1, 1,
-0.02542275, -0.06829393, -4.347813, 1, 1, 1, 1, 1,
-0.02501352, 0.1716821, 1.149295, 1, 1, 1, 1, 1,
-0.02255268, -1.157911, -2.438978, 1, 1, 1, 1, 1,
-0.0212037, 0.01824329, 0.2521631, 1, 1, 1, 1, 1,
-0.01963983, 0.4754632, 0.6548833, 1, 1, 1, 1, 1,
-0.01895952, 1.436649, -1.01232, 1, 1, 1, 1, 1,
-0.01396762, 1.144638, -0.6992421, 1, 1, 1, 1, 1,
-0.01327074, -0.09124086, -2.19782, 1, 1, 1, 1, 1,
-0.01302002, -0.7356067, -3.904778, 1, 1, 1, 1, 1,
-0.00976747, 0.929487, -0.6664537, 1, 1, 1, 1, 1,
-0.007810877, 1.809598, -0.6395398, 1, 1, 1, 1, 1,
-0.007683598, -0.6820192, -2.011578, 1, 1, 1, 1, 1,
-0.006277936, 0.2983654, -0.2021157, 0, 0, 1, 1, 1,
-0.001806294, 0.06111532, 1.331212, 1, 0, 0, 1, 1,
-0.001780944, -1.208809, -2.578969, 1, 0, 0, 1, 1,
-0.001107399, 0.3497276, 0.6054977, 1, 0, 0, 1, 1,
-0.0002445713, -0.2218838, -2.371776, 1, 0, 0, 1, 1,
0.0002122124, 0.2620738, -0.6870374, 1, 0, 0, 1, 1,
0.001470563, -0.2719592, 2.898135, 0, 0, 0, 1, 1,
0.002377629, -1.081849, 2.48043, 0, 0, 0, 1, 1,
0.003271916, -1.310442, 1.484028, 0, 0, 0, 1, 1,
0.007210099, -0.777327, 2.675901, 0, 0, 0, 1, 1,
0.01346137, 0.01190488, 0.8359685, 0, 0, 0, 1, 1,
0.01423602, 0.4105212, 1.081721, 0, 0, 0, 1, 1,
0.02461964, -1.133926, 4.24463, 0, 0, 0, 1, 1,
0.02906165, 0.4371138, 0.5155552, 1, 1, 1, 1, 1,
0.03546754, -0.4124379, 2.091742, 1, 1, 1, 1, 1,
0.03818244, 0.4149913, -0.1125394, 1, 1, 1, 1, 1,
0.03942635, 1.141992, -1.742991, 1, 1, 1, 1, 1,
0.03994037, 0.2394269, -0.370313, 1, 1, 1, 1, 1,
0.03997191, -0.7507798, 3.998336, 1, 1, 1, 1, 1,
0.0401381, -0.2483963, 3.024387, 1, 1, 1, 1, 1,
0.0406316, -0.9327671, 3.525212, 1, 1, 1, 1, 1,
0.05017641, 0.6103806, 1.08133, 1, 1, 1, 1, 1,
0.05953987, -0.5442035, 1.468337, 1, 1, 1, 1, 1,
0.06006849, 1.851015, 0.4434742, 1, 1, 1, 1, 1,
0.06212392, -1.941519, 3.363138, 1, 1, 1, 1, 1,
0.06600406, 0.9001711, 0.3857746, 1, 1, 1, 1, 1,
0.06729399, 0.3696872, -0.8720518, 1, 1, 1, 1, 1,
0.06788705, -0.283159, 2.215446, 1, 1, 1, 1, 1,
0.06794681, -0.6755539, 1.667415, 0, 0, 1, 1, 1,
0.07320236, 0.7342327, 0.9267336, 1, 0, 0, 1, 1,
0.07354847, 0.2927074, 0.3036392, 1, 0, 0, 1, 1,
0.07448332, 0.2360798, 0.6235685, 1, 0, 0, 1, 1,
0.07543987, 0.3450781, -1.192315, 1, 0, 0, 1, 1,
0.0786663, -0.4279961, 4.56937, 1, 0, 0, 1, 1,
0.0810306, -0.62786, 3.448466, 0, 0, 0, 1, 1,
0.08512097, -1.170392, 2.748306, 0, 0, 0, 1, 1,
0.08525862, -1.221242, 4.385634, 0, 0, 0, 1, 1,
0.08980026, -1.334085, 3.09799, 0, 0, 0, 1, 1,
0.09113584, 1.100174, 2.489992, 0, 0, 0, 1, 1,
0.09204643, -1.080106, 3.87343, 0, 0, 0, 1, 1,
0.09204831, -0.1526012, 1.26903, 0, 0, 0, 1, 1,
0.09335297, -0.708678, 2.694238, 1, 1, 1, 1, 1,
0.09516095, -0.1788792, 2.887892, 1, 1, 1, 1, 1,
0.09697604, -0.9717771, 2.935441, 1, 1, 1, 1, 1,
0.09708712, 1.108305, -0.3466414, 1, 1, 1, 1, 1,
0.09708767, 1.366395, 0.265605, 1, 1, 1, 1, 1,
0.1038149, 1.551624, -0.5469754, 1, 1, 1, 1, 1,
0.1063971, -0.0002938901, 3.800677, 1, 1, 1, 1, 1,
0.1087136, 1.08584, 0.5735814, 1, 1, 1, 1, 1,
0.1095635, -0.2177194, 3.6095, 1, 1, 1, 1, 1,
0.1124946, -0.5190896, 4.1476, 1, 1, 1, 1, 1,
0.1125572, 0.9036174, -1.241504, 1, 1, 1, 1, 1,
0.1127981, 0.6206693, 1.172274, 1, 1, 1, 1, 1,
0.1159278, -0.08151293, 2.679053, 1, 1, 1, 1, 1,
0.1172977, -0.9757477, 4.316147, 1, 1, 1, 1, 1,
0.1182694, 0.8242999, -0.733426, 1, 1, 1, 1, 1,
0.119474, 0.6674935, -0.7334724, 0, 0, 1, 1, 1,
0.1215857, -1.159277, 2.509453, 1, 0, 0, 1, 1,
0.1288496, -0.1545153, 2.093624, 1, 0, 0, 1, 1,
0.1295074, -1.558986, 2.806672, 1, 0, 0, 1, 1,
0.1320224, 1.084683, -0.1203713, 1, 0, 0, 1, 1,
0.1320437, -1.465973, 3.606136, 1, 0, 0, 1, 1,
0.1443522, -0.7940648, 2.800283, 0, 0, 0, 1, 1,
0.1444757, -0.7534181, 3.197763, 0, 0, 0, 1, 1,
0.1445118, 2.123418, 0.547653, 0, 0, 0, 1, 1,
0.1445188, -1.530546, 2.785395, 0, 0, 0, 1, 1,
0.1482754, -0.9136146, 1.538866, 0, 0, 0, 1, 1,
0.1484201, -2.261085, 3.276527, 0, 0, 0, 1, 1,
0.1545073, 1.206541, 0.373947, 0, 0, 0, 1, 1,
0.1558492, -0.3033061, 0.4271784, 1, 1, 1, 1, 1,
0.1578737, 0.7578211, -1.089185, 1, 1, 1, 1, 1,
0.1594607, -0.09927847, 1.574039, 1, 1, 1, 1, 1,
0.1636937, 0.3075147, 0.3261689, 1, 1, 1, 1, 1,
0.1644464, 0.4747244, 0.7829367, 1, 1, 1, 1, 1,
0.1655709, 0.5616952, 0.9783261, 1, 1, 1, 1, 1,
0.1718145, 0.1451111, 1.530698, 1, 1, 1, 1, 1,
0.174568, 1.172584, -2.101411, 1, 1, 1, 1, 1,
0.1747185, -0.6522513, 3.170075, 1, 1, 1, 1, 1,
0.1764049, 0.7493964, 0.6044193, 1, 1, 1, 1, 1,
0.178171, -0.3848681, 2.173039, 1, 1, 1, 1, 1,
0.1803462, -1.910194, 2.113954, 1, 1, 1, 1, 1,
0.1808029, -0.1793351, 2.447666, 1, 1, 1, 1, 1,
0.1839091, -0.01410114, 0.9212409, 1, 1, 1, 1, 1,
0.1848307, -1.209278, 2.590621, 1, 1, 1, 1, 1,
0.1849439, 0.5711346, 1.640464, 0, 0, 1, 1, 1,
0.1930427, -0.3913758, 2.864098, 1, 0, 0, 1, 1,
0.1932099, 1.859828, -0.7539095, 1, 0, 0, 1, 1,
0.1935304, -0.08164824, 1.825588, 1, 0, 0, 1, 1,
0.1953373, 0.4945308, 0.8738483, 1, 0, 0, 1, 1,
0.1956958, 1.458861, 0.7407433, 1, 0, 0, 1, 1,
0.1957087, 1.90326, -1.931326, 0, 0, 0, 1, 1,
0.2094822, 1.249961, -1.900648, 0, 0, 0, 1, 1,
0.2146691, -2.308914, 1.072473, 0, 0, 0, 1, 1,
0.2157261, -0.3189939, 1.355216, 0, 0, 0, 1, 1,
0.2158978, -0.2424415, 2.217819, 0, 0, 0, 1, 1,
0.2168491, 1.094809, 0.08807191, 0, 0, 0, 1, 1,
0.2186424, -1.987469, 3.342397, 0, 0, 0, 1, 1,
0.2195426, -0.4581616, 1.638405, 1, 1, 1, 1, 1,
0.2205083, -1.388651, 2.346811, 1, 1, 1, 1, 1,
0.223768, -0.3358459, 1.335828, 1, 1, 1, 1, 1,
0.2314693, 1.891759, -1.01705, 1, 1, 1, 1, 1,
0.2325322, -0.9613307, 1.822804, 1, 1, 1, 1, 1,
0.2343784, -1.309313, 3.340579, 1, 1, 1, 1, 1,
0.2408894, 1.993634, 1.875617, 1, 1, 1, 1, 1,
0.2433182, 0.7381363, 2.656828, 1, 1, 1, 1, 1,
0.2446899, 0.6014028, 0.7931685, 1, 1, 1, 1, 1,
0.2479442, 0.2068207, 1.75394, 1, 1, 1, 1, 1,
0.2542742, 0.8940963, -0.4937854, 1, 1, 1, 1, 1,
0.2569572, 0.3641065, 1.341496, 1, 1, 1, 1, 1,
0.2573683, -2.00029, 2.723504, 1, 1, 1, 1, 1,
0.2648562, 0.4104404, -0.1939526, 1, 1, 1, 1, 1,
0.2716092, -0.7870759, 2.397086, 1, 1, 1, 1, 1,
0.274525, -0.9929684, 1.868845, 0, 0, 1, 1, 1,
0.2830918, 1.47493, -0.06689788, 1, 0, 0, 1, 1,
0.2852185, 1.047256, 0.3748038, 1, 0, 0, 1, 1,
0.2888369, -1.421123, 2.337323, 1, 0, 0, 1, 1,
0.2900304, -0.3006208, -0.3122495, 1, 0, 0, 1, 1,
0.3000149, -0.5934162, 2.609515, 1, 0, 0, 1, 1,
0.3027632, -0.2120955, 1.280324, 0, 0, 0, 1, 1,
0.3029823, -1.947331, 3.973069, 0, 0, 0, 1, 1,
0.3044183, -1.595734, 2.753132, 0, 0, 0, 1, 1,
0.3051291, 0.4421444, 0.12116, 0, 0, 0, 1, 1,
0.3058382, 0.4650631, 0.4116265, 0, 0, 0, 1, 1,
0.312762, -0.4744945, 1.352855, 0, 0, 0, 1, 1,
0.3135858, -0.8768264, 2.738781, 0, 0, 0, 1, 1,
0.314115, 1.014692, 0.9052435, 1, 1, 1, 1, 1,
0.3153171, -0.06087296, 3.500692, 1, 1, 1, 1, 1,
0.3204067, 0.3479789, 1.39276, 1, 1, 1, 1, 1,
0.3209769, 1.230323, 0.02155678, 1, 1, 1, 1, 1,
0.3224807, -1.393366, 3.428998, 1, 1, 1, 1, 1,
0.3328415, -0.3782227, 2.669797, 1, 1, 1, 1, 1,
0.3343829, 0.62018, 2.643453, 1, 1, 1, 1, 1,
0.3388135, -1.074301, 4.313845, 1, 1, 1, 1, 1,
0.3388353, -1.876188, 3.23666, 1, 1, 1, 1, 1,
0.341041, 1.094136, -0.2395967, 1, 1, 1, 1, 1,
0.3436823, 1.566997, 0.04851468, 1, 1, 1, 1, 1,
0.3473165, -0.3178006, 3.864067, 1, 1, 1, 1, 1,
0.3652297, -0.6037667, 2.239408, 1, 1, 1, 1, 1,
0.366073, -0.9937446, 2.06801, 1, 1, 1, 1, 1,
0.3694009, -0.2952236, 1.50283, 1, 1, 1, 1, 1,
0.3701732, 0.1485681, 0.08091388, 0, 0, 1, 1, 1,
0.3702004, 0.4799113, 1.224409, 1, 0, 0, 1, 1,
0.3746088, 1.974182, 0.7605088, 1, 0, 0, 1, 1,
0.3790277, -0.4480055, 4.214363, 1, 0, 0, 1, 1,
0.3833845, 1.194948, -0.9736732, 1, 0, 0, 1, 1,
0.3838416, -0.1329522, 3.619589, 1, 0, 0, 1, 1,
0.3911297, 1.44248, -0.717198, 0, 0, 0, 1, 1,
0.3924413, 0.2839913, 1.841012, 0, 0, 0, 1, 1,
0.3933827, -1.034661, 3.665604, 0, 0, 0, 1, 1,
0.3949219, 0.2989126, 2.453559, 0, 0, 0, 1, 1,
0.4004748, 1.201329, 0.1084758, 0, 0, 0, 1, 1,
0.4035214, -0.4806091, 3.973645, 0, 0, 0, 1, 1,
0.4054046, 0.7865499, 0.5460936, 0, 0, 0, 1, 1,
0.4117085, -0.7625684, 4.64573, 1, 1, 1, 1, 1,
0.4125497, 1.830271, 1.271004, 1, 1, 1, 1, 1,
0.4142534, 0.1160315, 1.432768, 1, 1, 1, 1, 1,
0.4144142, -0.1288648, 2.474576, 1, 1, 1, 1, 1,
0.4146382, -1.454654, 2.195712, 1, 1, 1, 1, 1,
0.4151535, -0.330496, 1.495115, 1, 1, 1, 1, 1,
0.4159709, 1.14985, 2.412145, 1, 1, 1, 1, 1,
0.4163889, -0.2257477, 0.7902692, 1, 1, 1, 1, 1,
0.4179513, 0.9391939, 0.1415941, 1, 1, 1, 1, 1,
0.4208417, -1.077003, 3.558496, 1, 1, 1, 1, 1,
0.4243881, 0.1169388, 1.705392, 1, 1, 1, 1, 1,
0.4255054, 0.4099817, 0.04031018, 1, 1, 1, 1, 1,
0.4281806, 0.1357202, 0.406478, 1, 1, 1, 1, 1,
0.4286269, 1.835549, 1.201003, 1, 1, 1, 1, 1,
0.4297963, -1.827707, 3.631326, 1, 1, 1, 1, 1,
0.4314767, -1.844215, 2.140887, 0, 0, 1, 1, 1,
0.4323507, -0.08682231, 0.626348, 1, 0, 0, 1, 1,
0.4359175, 1.793306, -0.3257784, 1, 0, 0, 1, 1,
0.4400576, -7.470396e-05, 1.65047, 1, 0, 0, 1, 1,
0.4433708, -0.3638254, 3.046252, 1, 0, 0, 1, 1,
0.4446764, 0.08838534, 1.949397, 1, 0, 0, 1, 1,
0.4498261, 0.5394732, 1.947673, 0, 0, 0, 1, 1,
0.4499837, -1.652121, 2.830194, 0, 0, 0, 1, 1,
0.4544925, 0.9768057, -0.840084, 0, 0, 0, 1, 1,
0.4553324, 0.143025, 2.565449, 0, 0, 0, 1, 1,
0.4565167, -0.2462934, 0.3738238, 0, 0, 0, 1, 1,
0.4594789, 0.1761428, 0.3322823, 0, 0, 0, 1, 1,
0.4596518, 1.145671, 0.07028884, 0, 0, 0, 1, 1,
0.4623023, 1.000409, -0.1285773, 1, 1, 1, 1, 1,
0.4649697, -0.01543722, 2.253477, 1, 1, 1, 1, 1,
0.4663391, 0.2963479, 2.192753, 1, 1, 1, 1, 1,
0.4666068, -0.3181154, 4.679809, 1, 1, 1, 1, 1,
0.4747387, -0.6338786, 3.835031, 1, 1, 1, 1, 1,
0.4821786, -0.05519962, 2.069351, 1, 1, 1, 1, 1,
0.484429, -0.1180778, 2.007113, 1, 1, 1, 1, 1,
0.484773, -0.4452923, 2.223984, 1, 1, 1, 1, 1,
0.4929144, 0.4851892, -1.260553, 1, 1, 1, 1, 1,
0.496792, -0.0513161, 0.9239494, 1, 1, 1, 1, 1,
0.4988937, -1.094969, 3.498631, 1, 1, 1, 1, 1,
0.4990982, 1.436084, 0.5621902, 1, 1, 1, 1, 1,
0.5046912, -0.4253238, 3.314319, 1, 1, 1, 1, 1,
0.5139181, -1.210824, 1.609879, 1, 1, 1, 1, 1,
0.5154187, 0.7108046, 1.133528, 1, 1, 1, 1, 1,
0.5155818, 0.859211, 0.7168635, 0, 0, 1, 1, 1,
0.5196074, -1.026115, 1.519882, 1, 0, 0, 1, 1,
0.5219431, 0.01377228, 1.038201, 1, 0, 0, 1, 1,
0.5224288, 1.185434, 1.126853, 1, 0, 0, 1, 1,
0.5237574, 0.7266011, 0.9502888, 1, 0, 0, 1, 1,
0.5262351, 1.625916, -0.1548957, 1, 0, 0, 1, 1,
0.5304202, -1.518022, 3.387989, 0, 0, 0, 1, 1,
0.5320081, -0.1323955, 1.527192, 0, 0, 0, 1, 1,
0.5322257, -2.209845, 2.979446, 0, 0, 0, 1, 1,
0.5351201, 0.08407979, 1.977994, 0, 0, 0, 1, 1,
0.539957, 0.4634573, 0.1376998, 0, 0, 0, 1, 1,
0.5424756, -0.4407003, 1.693154, 0, 0, 0, 1, 1,
0.5428982, -1.175575, 3.028587, 0, 0, 0, 1, 1,
0.5450554, -1.021213, -0.09589871, 1, 1, 1, 1, 1,
0.5493742, 0.262789, 0.3036843, 1, 1, 1, 1, 1,
0.5516023, -1.103321, 0.4491142, 1, 1, 1, 1, 1,
0.5554727, 1.255395, 1.509616, 1, 1, 1, 1, 1,
0.5576648, 0.2922139, 0.7243378, 1, 1, 1, 1, 1,
0.5599873, 1.481108, 1.050636, 1, 1, 1, 1, 1,
0.5693808, 1.092607, 1.560373, 1, 1, 1, 1, 1,
0.5753192, 1.317776, 1.207294, 1, 1, 1, 1, 1,
0.5753422, -0.9377091, 3.199676, 1, 1, 1, 1, 1,
0.5816856, -0.4427245, 1.912065, 1, 1, 1, 1, 1,
0.5849097, -0.03391896, 0.6575469, 1, 1, 1, 1, 1,
0.5880111, -0.1597127, 1.074149, 1, 1, 1, 1, 1,
0.5897929, 1.211902, 0.1788757, 1, 1, 1, 1, 1,
0.5898916, 1.009796, 1.529754, 1, 1, 1, 1, 1,
0.5909657, 0.1494993, 1.840475, 1, 1, 1, 1, 1,
0.5910318, -0.02743244, 2.847311, 0, 0, 1, 1, 1,
0.5974031, -0.6306322, 5.231564, 1, 0, 0, 1, 1,
0.6045073, -0.0955535, 3.816369, 1, 0, 0, 1, 1,
0.6049371, 0.9883793, 2.403451, 1, 0, 0, 1, 1,
0.6077066, 1.525339, 0.4133651, 1, 0, 0, 1, 1,
0.6093926, 1.420158, 1.623538, 1, 0, 0, 1, 1,
0.610409, 0.8049751, 0.4373676, 0, 0, 0, 1, 1,
0.612133, -0.3146975, 1.23206, 0, 0, 0, 1, 1,
0.6268642, 0.5212091, -0.3682676, 0, 0, 0, 1, 1,
0.62982, -1.032329, 3.024, 0, 0, 0, 1, 1,
0.6358711, -0.7852118, 2.047373, 0, 0, 0, 1, 1,
0.6509159, 0.525463, 1.006907, 0, 0, 0, 1, 1,
0.6539961, -0.1953178, 3.160353, 0, 0, 0, 1, 1,
0.6581113, -0.9105296, 2.117497, 1, 1, 1, 1, 1,
0.6592632, 1.40714, 1.105619, 1, 1, 1, 1, 1,
0.6609482, -0.8023024, 4.313939, 1, 1, 1, 1, 1,
0.6655518, 2.127257, -1.49165, 1, 1, 1, 1, 1,
0.6687285, 2.027657, -0.4591621, 1, 1, 1, 1, 1,
0.6765772, 0.3101649, 2.272692, 1, 1, 1, 1, 1,
0.6789429, -2.397068, 2.57102, 1, 1, 1, 1, 1,
0.6797128, 2.316762, 1.658385, 1, 1, 1, 1, 1,
0.6827728, -0.9521405, 2.580982, 1, 1, 1, 1, 1,
0.6829866, 0.3475414, 1.463411, 1, 1, 1, 1, 1,
0.688062, -0.3964167, 1.782962, 1, 1, 1, 1, 1,
0.695242, -0.3066566, 2.282165, 1, 1, 1, 1, 1,
0.6975335, -1.60737, 1.221628, 1, 1, 1, 1, 1,
0.6995959, 0.07392883, 2.501985, 1, 1, 1, 1, 1,
0.7004784, 0.8009105, 1.413234, 1, 1, 1, 1, 1,
0.7047301, 0.1274463, 1.3783, 0, 0, 1, 1, 1,
0.7060172, 1.960553, 1.041151, 1, 0, 0, 1, 1,
0.7101116, 0.6291396, 1.598678, 1, 0, 0, 1, 1,
0.7117723, -1.118472, 2.799864, 1, 0, 0, 1, 1,
0.7169185, -2.360679, 5.844965, 1, 0, 0, 1, 1,
0.723682, -1.519692, 2.167163, 1, 0, 0, 1, 1,
0.7329833, -0.2094995, 1.649237, 0, 0, 0, 1, 1,
0.7374834, 0.514784, 1.8423, 0, 0, 0, 1, 1,
0.7418395, -1.366026, 3.056911, 0, 0, 0, 1, 1,
0.7424526, 1.400293, 1.891139, 0, 0, 0, 1, 1,
0.7435347, 0.5923095, 1.664708, 0, 0, 0, 1, 1,
0.7450797, -0.7776598, 3.11399, 0, 0, 0, 1, 1,
0.7483186, 1.440598, 0.1370848, 0, 0, 0, 1, 1,
0.7504495, 0.9502741, 0.641757, 1, 1, 1, 1, 1,
0.7523007, 0.3285639, 0.1386423, 1, 1, 1, 1, 1,
0.753145, 0.4642466, 1.767022, 1, 1, 1, 1, 1,
0.7544744, 1.110469, 0.7517632, 1, 1, 1, 1, 1,
0.7572464, -0.9662169, 2.751036, 1, 1, 1, 1, 1,
0.7578508, 0.3925092, 1.853209, 1, 1, 1, 1, 1,
0.7645013, -1.008927, 2.926441, 1, 1, 1, 1, 1,
0.7664826, -3.470356, 1.999656, 1, 1, 1, 1, 1,
0.768065, -0.04145312, 2.857579, 1, 1, 1, 1, 1,
0.7750629, 1.685112, 0.2190931, 1, 1, 1, 1, 1,
0.7869619, -1.385646, 3.971044, 1, 1, 1, 1, 1,
0.7874492, 0.2603773, 1.7724, 1, 1, 1, 1, 1,
0.7878363, 0.1039985, 1.124521, 1, 1, 1, 1, 1,
0.7949855, -1.020826, 2.970582, 1, 1, 1, 1, 1,
0.8005022, -0.06751303, 3.8989, 1, 1, 1, 1, 1,
0.8026557, -0.01818335, 1.070654, 0, 0, 1, 1, 1,
0.8027709, 1.051782, 2.816357, 1, 0, 0, 1, 1,
0.8054341, -0.9014364, 2.556232, 1, 0, 0, 1, 1,
0.8215349, -1.092847, 2.421664, 1, 0, 0, 1, 1,
0.8263127, 0.7886869, -0.9472155, 1, 0, 0, 1, 1,
0.8394908, 0.4770871, -0.06881167, 1, 0, 0, 1, 1,
0.8434954, -0.7618207, 2.013814, 0, 0, 0, 1, 1,
0.8435459, 0.8580545, 1.130019, 0, 0, 0, 1, 1,
0.8484924, 0.3569887, 0.9566246, 0, 0, 0, 1, 1,
0.8510328, -2.475131, 3.562728, 0, 0, 0, 1, 1,
0.8517542, -1.036957, 0.8738775, 0, 0, 0, 1, 1,
0.8534598, 1.014624, 1.470121, 0, 0, 0, 1, 1,
0.8541692, 1.199631, 0.2734959, 0, 0, 0, 1, 1,
0.8553837, 2.523284, 0.2489808, 1, 1, 1, 1, 1,
0.8563724, 0.8225136, 0.08915009, 1, 1, 1, 1, 1,
0.865591, -0.4747612, 1.662515, 1, 1, 1, 1, 1,
0.8676509, -0.01246621, 1.043, 1, 1, 1, 1, 1,
0.8679661, -0.5530974, 2.894687, 1, 1, 1, 1, 1,
0.8696941, -1.629436, 0.7711769, 1, 1, 1, 1, 1,
0.8761827, -0.1122552, 1.871853, 1, 1, 1, 1, 1,
0.8814083, -0.3925909, 2.099096, 1, 1, 1, 1, 1,
0.8815122, 0.4682756, 0.8621648, 1, 1, 1, 1, 1,
0.8872553, 1.41367, 2.10898, 1, 1, 1, 1, 1,
0.8893473, -0.9328238, 1.151594, 1, 1, 1, 1, 1,
0.8897182, 1.812064, -0.07097291, 1, 1, 1, 1, 1,
0.8915828, 1.013182, -0.2533179, 1, 1, 1, 1, 1,
0.8925955, -0.2737387, 2.133463, 1, 1, 1, 1, 1,
0.898493, -0.1041559, 1.340486, 1, 1, 1, 1, 1,
0.9110115, 0.5574983, -0.398165, 0, 0, 1, 1, 1,
0.914921, -0.1077715, 2.703378, 1, 0, 0, 1, 1,
0.916786, -0.6635321, 0.6581577, 1, 0, 0, 1, 1,
0.9198719, 0.6720454, 2.730754, 1, 0, 0, 1, 1,
0.9230196, 2.084096, -0.6453081, 1, 0, 0, 1, 1,
0.9238489, 1.043954, 0.199213, 1, 0, 0, 1, 1,
0.9242756, 0.3825873, 1.370505, 0, 0, 0, 1, 1,
0.9252713, -1.177032, 2.621657, 0, 0, 0, 1, 1,
0.9298304, -0.6642024, 2.292411, 0, 0, 0, 1, 1,
0.9330834, -1.309249, 1.550575, 0, 0, 0, 1, 1,
0.9335116, -0.1541681, 3.561712, 0, 0, 0, 1, 1,
0.9343557, 1.434212, 1.831734, 0, 0, 0, 1, 1,
0.9417658, -0.7075911, 0.7245452, 0, 0, 0, 1, 1,
0.9439993, -2.117338, 1.996539, 1, 1, 1, 1, 1,
0.9468398, -0.09657892, 0.9776868, 1, 1, 1, 1, 1,
0.9477524, 1.34242, 2.066854, 1, 1, 1, 1, 1,
0.9499851, -0.7942445, 0.7472389, 1, 1, 1, 1, 1,
0.9606772, 0.4912581, 1.564572, 1, 1, 1, 1, 1,
0.9619372, -0.239803, 2.821183, 1, 1, 1, 1, 1,
0.9644001, -2.781113, 3.538274, 1, 1, 1, 1, 1,
0.9702969, -0.3725686, 1.469696, 1, 1, 1, 1, 1,
0.9736267, 0.6754335, 1.293352, 1, 1, 1, 1, 1,
0.9746922, 0.8742702, 1.314285, 1, 1, 1, 1, 1,
0.9755125, -1.485199, 3.00632, 1, 1, 1, 1, 1,
0.9902901, -0.1590483, 0.4631504, 1, 1, 1, 1, 1,
1.00859, 0.8314635, 0.4794637, 1, 1, 1, 1, 1,
1.009811, -1.056678, 1.036308, 1, 1, 1, 1, 1,
1.011249, 1.176166, 2.591351, 1, 1, 1, 1, 1,
1.012363, -1.072745, 3.05887, 0, 0, 1, 1, 1,
1.013287, -0.6445735, 2.619596, 1, 0, 0, 1, 1,
1.019085, -0.2255506, -0.1721409, 1, 0, 0, 1, 1,
1.019775, -2.247759, 1.86624, 1, 0, 0, 1, 1,
1.022287, 0.2434866, 1.958288, 1, 0, 0, 1, 1,
1.027142, 0.7003942, 1.398335, 1, 0, 0, 1, 1,
1.035383, -0.4192405, 3.027441, 0, 0, 0, 1, 1,
1.037314, 1.301548, 1.069039, 0, 0, 0, 1, 1,
1.03781, 0.9290065, 0.5841478, 0, 0, 0, 1, 1,
1.038838, 0.6932108, 1.477922, 0, 0, 0, 1, 1,
1.046703, -0.6484489, 1.474181, 0, 0, 0, 1, 1,
1.05067, 0.8293409, -0.6534961, 0, 0, 0, 1, 1,
1.054177, 0.2810146, 1.051478, 0, 0, 0, 1, 1,
1.058897, -0.1279508, 1.114612, 1, 1, 1, 1, 1,
1.058978, -0.7742231, 1.564844, 1, 1, 1, 1, 1,
1.060347, -0.5625074, 1.087788, 1, 1, 1, 1, 1,
1.061119, -0.6771646, 1.934415, 1, 1, 1, 1, 1,
1.062592, -1.447397, 2.899986, 1, 1, 1, 1, 1,
1.069596, -0.117785, 3.811021, 1, 1, 1, 1, 1,
1.090494, -0.1253644, 1.677856, 1, 1, 1, 1, 1,
1.090653, 1.341675, -0.09979606, 1, 1, 1, 1, 1,
1.091092, 0.04273021, 2.46909, 1, 1, 1, 1, 1,
1.091544, -1.164787, 0.9810618, 1, 1, 1, 1, 1,
1.096697, 1.283256, 1.711983, 1, 1, 1, 1, 1,
1.104578, -0.6148827, 4.394428, 1, 1, 1, 1, 1,
1.105425, 1.357119, -1.227645, 1, 1, 1, 1, 1,
1.110059, 0.6775806, 2.990162, 1, 1, 1, 1, 1,
1.119512, 1.089919, 0.7787195, 1, 1, 1, 1, 1,
1.1229, -0.224668, 1.617864, 0, 0, 1, 1, 1,
1.124061, -0.568728, 0.6542769, 1, 0, 0, 1, 1,
1.129179, 0.4213615, 1.321223, 1, 0, 0, 1, 1,
1.131371, 0.08432999, 2.411963, 1, 0, 0, 1, 1,
1.133249, -0.4084853, 2.214837, 1, 0, 0, 1, 1,
1.134103, -1.400437, 2.586286, 1, 0, 0, 1, 1,
1.141916, 0.5382593, 3.493494, 0, 0, 0, 1, 1,
1.14694, 1.239535, 2.069986, 0, 0, 0, 1, 1,
1.150489, -0.6833656, 3.820917, 0, 0, 0, 1, 1,
1.153052, 1.987015, -1.560162, 0, 0, 0, 1, 1,
1.158946, 0.1492794, 1.808494, 0, 0, 0, 1, 1,
1.163949, 0.2631611, 1.561375, 0, 0, 0, 1, 1,
1.167434, -1.304696, 2.470173, 0, 0, 0, 1, 1,
1.178687, -0.48486, 1.590448, 1, 1, 1, 1, 1,
1.183151, 0.6746416, 1.04915, 1, 1, 1, 1, 1,
1.190162, 1.750914, 1.170912, 1, 1, 1, 1, 1,
1.193467, -0.2263592, 2.432638, 1, 1, 1, 1, 1,
1.194732, -1.273867, 3.184163, 1, 1, 1, 1, 1,
1.197077, 0.6989441, 0.7650369, 1, 1, 1, 1, 1,
1.207565, 0.09446242, 1.267449, 1, 1, 1, 1, 1,
1.217677, -0.6477935, 0.7239748, 1, 1, 1, 1, 1,
1.222153, -0.4047428, 1.707259, 1, 1, 1, 1, 1,
1.223488, 0.1835601, -1.193791, 1, 1, 1, 1, 1,
1.232964, 0.1083621, -0.3392802, 1, 1, 1, 1, 1,
1.233115, -0.3209069, 3.429616, 1, 1, 1, 1, 1,
1.237557, 0.2792985, 1.039069, 1, 1, 1, 1, 1,
1.251719, -1.247546, 4.39323, 1, 1, 1, 1, 1,
1.255067, -0.0347082, 2.099885, 1, 1, 1, 1, 1,
1.259569, -0.9953042, 1.154892, 0, 0, 1, 1, 1,
1.264718, 0.9814725, 0.5899132, 1, 0, 0, 1, 1,
1.265451, 0.8946286, -0.2506618, 1, 0, 0, 1, 1,
1.267589, -0.9561955, 2.63962, 1, 0, 0, 1, 1,
1.272402, -0.9925675, 2.011879, 1, 0, 0, 1, 1,
1.277848, 0.1446106, 3.223075, 1, 0, 0, 1, 1,
1.278726, 0.2566684, -0.7549869, 0, 0, 0, 1, 1,
1.279667, -1.096482, 2.113503, 0, 0, 0, 1, 1,
1.28149, -0.8810071, 3.803786, 0, 0, 0, 1, 1,
1.28258, -0.2728661, 1.005005, 0, 0, 0, 1, 1,
1.282885, 0.26775, 2.184176, 0, 0, 0, 1, 1,
1.288978, -0.5911874, 2.545236, 0, 0, 0, 1, 1,
1.291075, -0.9867992, 2.113835, 0, 0, 0, 1, 1,
1.294928, -0.1431356, 0.9855503, 1, 1, 1, 1, 1,
1.32023, -0.9916575, 0.3972947, 1, 1, 1, 1, 1,
1.324705, 0.6401192, 0.8151788, 1, 1, 1, 1, 1,
1.332219, 2.423312, -0.8119487, 1, 1, 1, 1, 1,
1.340506, 0.4981465, 0.7046808, 1, 1, 1, 1, 1,
1.340899, -0.9805814, 1.839503, 1, 1, 1, 1, 1,
1.355665, 2.097427, 0.4299112, 1, 1, 1, 1, 1,
1.357201, -0.3601922, 1.623979, 1, 1, 1, 1, 1,
1.358692, -0.09543247, 0.7191706, 1, 1, 1, 1, 1,
1.359379, 0.4756385, 1.439891, 1, 1, 1, 1, 1,
1.362216, -0.5316862, 0.7093006, 1, 1, 1, 1, 1,
1.362593, 0.2469452, 0.5998527, 1, 1, 1, 1, 1,
1.372238, 0.3427159, 1.672243, 1, 1, 1, 1, 1,
1.380744, -0.08385364, 0.6109886, 1, 1, 1, 1, 1,
1.39681, 1.502201, 0.05046533, 1, 1, 1, 1, 1,
1.398227, 0.5863124, 2.265299, 0, 0, 1, 1, 1,
1.414111, 0.9359434, 0.824093, 1, 0, 0, 1, 1,
1.415983, 0.1017746, 1.748949, 1, 0, 0, 1, 1,
1.420734, 1.199415, 2.144599, 1, 0, 0, 1, 1,
1.429687, -0.6406952, 1.114533, 1, 0, 0, 1, 1,
1.444091, 0.2513148, 2.159832, 1, 0, 0, 1, 1,
1.445919, -0.1043329, 3.257576, 0, 0, 0, 1, 1,
1.457993, -0.05937526, 2.749383, 0, 0, 0, 1, 1,
1.460495, 1.443807, 1.498544, 0, 0, 0, 1, 1,
1.465038, -0.6353083, 2.35933, 0, 0, 0, 1, 1,
1.468723, -0.9411964, 3.102926, 0, 0, 0, 1, 1,
1.474928, 0.081292, 2.319497, 0, 0, 0, 1, 1,
1.503905, -0.03237098, 1.211509, 0, 0, 0, 1, 1,
1.507963, 0.1623377, 1.267339, 1, 1, 1, 1, 1,
1.509397, -1.780675, 2.842891, 1, 1, 1, 1, 1,
1.524157, -0.25387, 0.412558, 1, 1, 1, 1, 1,
1.525995, 1.011632, 2.53327, 1, 1, 1, 1, 1,
1.539164, -0.8174727, 2.13852, 1, 1, 1, 1, 1,
1.539375, -1.403144, 1.101527, 1, 1, 1, 1, 1,
1.54077, 1.799352, 0.2657334, 1, 1, 1, 1, 1,
1.552331, -0.4413743, 2.139862, 1, 1, 1, 1, 1,
1.55573, 1.230447, 0.7730744, 1, 1, 1, 1, 1,
1.581356, 0.9713061, 1.097264, 1, 1, 1, 1, 1,
1.585359, 0.1635032, 1.086136, 1, 1, 1, 1, 1,
1.595007, 0.9776627, 2.207431, 1, 1, 1, 1, 1,
1.621844, -1.477412, 2.422973, 1, 1, 1, 1, 1,
1.645485, 1.135949, 2.803298, 1, 1, 1, 1, 1,
1.657289, 0.2404604, 1.948571, 1, 1, 1, 1, 1,
1.66865, -1.201502, 1.150281, 0, 0, 1, 1, 1,
1.681162, 1.137682, 1.644417, 1, 0, 0, 1, 1,
1.698983, 0.5748403, 0.9900123, 1, 0, 0, 1, 1,
1.729986, 0.7225406, 0.2128153, 1, 0, 0, 1, 1,
1.732437, 0.3155144, 2.232435, 1, 0, 0, 1, 1,
1.762642, -0.2818296, 2.100789, 1, 0, 0, 1, 1,
1.772468, 0.7982128, 3.186526, 0, 0, 0, 1, 1,
1.784702, 0.4584705, 1.158137, 0, 0, 0, 1, 1,
1.78717, -1.796702, 3.24936, 0, 0, 0, 1, 1,
1.790318, 1.163761, 0.06049062, 0, 0, 0, 1, 1,
1.795449, 0.1802308, 1.938454, 0, 0, 0, 1, 1,
1.797079, -0.153534, 1.166373, 0, 0, 0, 1, 1,
1.800197, 0.2013939, 2.894063, 0, 0, 0, 1, 1,
1.813236, -1.580526, 2.699487, 1, 1, 1, 1, 1,
1.825574, -0.3698081, 2.657843, 1, 1, 1, 1, 1,
1.843223, -0.08233548, 2.704887, 1, 1, 1, 1, 1,
1.847692, -2.338811, 1.930943, 1, 1, 1, 1, 1,
1.852603, 0.3273405, 1.872466, 1, 1, 1, 1, 1,
1.863478, 0.05733137, 2.722071, 1, 1, 1, 1, 1,
1.872385, 0.173257, 1.368849, 1, 1, 1, 1, 1,
1.884832, 0.2696085, 2.834092, 1, 1, 1, 1, 1,
1.900397, 0.233823, 2.274281, 1, 1, 1, 1, 1,
1.967085, 0.2802478, 1.005227, 1, 1, 1, 1, 1,
1.969487, -0.03098414, 1.352345, 1, 1, 1, 1, 1,
1.973405, -0.2134856, 3.697786, 1, 1, 1, 1, 1,
2.007004, -0.3124245, 1.801929, 1, 1, 1, 1, 1,
2.028186, -0.482168, 1.427268, 1, 1, 1, 1, 1,
2.04759, 0.2406942, 2.312248, 1, 1, 1, 1, 1,
2.069108, 1.217681, 3.577676, 0, 0, 1, 1, 1,
2.166799, 0.8888813, 2.448965, 1, 0, 0, 1, 1,
2.174422, -0.3881906, 1.982255, 1, 0, 0, 1, 1,
2.308501, 0.9412196, 1.948057, 1, 0, 0, 1, 1,
2.33497, -0.43853, 1.743257, 1, 0, 0, 1, 1,
2.37261, 0.6705301, 2.441011, 1, 0, 0, 1, 1,
2.441364, -0.209158, 1.848403, 0, 0, 0, 1, 1,
2.488018, -0.4505445, 1.877338, 0, 0, 0, 1, 1,
2.559756, -1.266229, 3.745579, 0, 0, 0, 1, 1,
2.630275, -1.868701, 1.111069, 0, 0, 0, 1, 1,
2.633889, -1.827504, 2.310805, 0, 0, 0, 1, 1,
2.672426, -0.8128107, 4.365208, 0, 0, 0, 1, 1,
2.682336, -1.355408, 2.712216, 0, 0, 0, 1, 1,
2.691298, -0.250213, 0.6832574, 1, 1, 1, 1, 1,
2.699066, -0.5050095, 1.637982, 1, 1, 1, 1, 1,
2.770751, 1.887097, -1.219151, 1, 1, 1, 1, 1,
2.806558, 0.2178327, 2.792407, 1, 1, 1, 1, 1,
2.82261, -0.1930728, 2.07387, 1, 1, 1, 1, 1,
3.219127, -1.415523, 2.192496, 1, 1, 1, 1, 1,
3.857784, 0.5756631, 1.003927, 1, 1, 1, 1, 1
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
var radius = 10.33215;
var distance = 36.29122;
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
mvMatrix.translate( -0.3618054, 0.3132846, 0.2775867 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.29122);
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
