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
-2.89888, -0.4578898, -0.7337322, 1, 0, 0, 1,
-2.71226, 1.227322, -1.571723, 1, 0.007843138, 0, 1,
-2.708603, 0.171352, -2.228942, 1, 0.01176471, 0, 1,
-2.571359, -0.2131066, 1.010737, 1, 0.01960784, 0, 1,
-2.558607, 0.8413718, -2.262857, 1, 0.02352941, 0, 1,
-2.549178, -0.4010878, -1.883004, 1, 0.03137255, 0, 1,
-2.507769, 0.1442827, 0.0839745, 1, 0.03529412, 0, 1,
-2.502797, 0.8479199, -2.087556, 1, 0.04313726, 0, 1,
-2.416243, -1.123176, -3.459135, 1, 0.04705882, 0, 1,
-2.396363, 0.3494457, -1.052538, 1, 0.05490196, 0, 1,
-2.375011, -0.02457327, -0.8625792, 1, 0.05882353, 0, 1,
-2.365176, 1.087061, -2.085779, 1, 0.06666667, 0, 1,
-2.338507, -0.3543384, -2.310851, 1, 0.07058824, 0, 1,
-2.298792, -0.1830029, -3.188769, 1, 0.07843138, 0, 1,
-2.267361, -0.6627452, -1.34931, 1, 0.08235294, 0, 1,
-2.224257, 0.1819966, -1.921676, 1, 0.09019608, 0, 1,
-2.215105, 1.108035, -2.437293, 1, 0.09411765, 0, 1,
-2.166108, -0.8778034, -1.664206, 1, 0.1019608, 0, 1,
-2.147365, 0.1881505, -1.087943, 1, 0.1098039, 0, 1,
-2.144459, -0.3626238, -2.809924, 1, 0.1137255, 0, 1,
-2.1349, 0.25466, -2.856346, 1, 0.1215686, 0, 1,
-2.125284, -0.1079263, -1.583721, 1, 0.1254902, 0, 1,
-2.107395, 0.1695752, -2.323148, 1, 0.1333333, 0, 1,
-2.083139, -0.3480957, -1.438173, 1, 0.1372549, 0, 1,
-2.081789, 0.06308731, -1.130447, 1, 0.145098, 0, 1,
-2.057324, 0.3728758, -0.6332405, 1, 0.1490196, 0, 1,
-2.052645, 0.08003335, -3.125419, 1, 0.1568628, 0, 1,
-2.040808, -0.06261086, -1.373948, 1, 0.1607843, 0, 1,
-2.016754, 1.504775, -0.9506924, 1, 0.1686275, 0, 1,
-1.97164, -1.412588, -2.366452, 1, 0.172549, 0, 1,
-1.947995, 0.1755649, -1.421348, 1, 0.1803922, 0, 1,
-1.936263, 0.7559601, -2.821309, 1, 0.1843137, 0, 1,
-1.930176, 0.02657951, -1.687726, 1, 0.1921569, 0, 1,
-1.925347, 0.3853572, -1.826644, 1, 0.1960784, 0, 1,
-1.917954, 1.102462, -0.6046426, 1, 0.2039216, 0, 1,
-1.897887, 0.4658866, -2.928354, 1, 0.2117647, 0, 1,
-1.891799, -1.261037, -2.628251, 1, 0.2156863, 0, 1,
-1.860533, 1.512416, -1.885519, 1, 0.2235294, 0, 1,
-1.831623, 0.01921346, -1.896363, 1, 0.227451, 0, 1,
-1.818871, -0.6946482, -2.459024, 1, 0.2352941, 0, 1,
-1.796572, -2.077742, -1.184417, 1, 0.2392157, 0, 1,
-1.77749, 0.06229701, -2.27694, 1, 0.2470588, 0, 1,
-1.776174, 0.8091335, -2.341221, 1, 0.2509804, 0, 1,
-1.767468, 1.614526, 0.7724513, 1, 0.2588235, 0, 1,
-1.732819, 1.127671, -0.1182043, 1, 0.2627451, 0, 1,
-1.728285, -0.3425217, -1.636943, 1, 0.2705882, 0, 1,
-1.723879, 0.9644983, -0.01282112, 1, 0.2745098, 0, 1,
-1.721907, -1.462091, -1.982642, 1, 0.282353, 0, 1,
-1.72076, -0.070675, -3.297011, 1, 0.2862745, 0, 1,
-1.718205, 0.1120198, -1.34823, 1, 0.2941177, 0, 1,
-1.716692, -1.01251, -2.427124, 1, 0.3019608, 0, 1,
-1.698596, -0.3869512, -1.991982, 1, 0.3058824, 0, 1,
-1.676905, 0.8986693, -1.935499, 1, 0.3137255, 0, 1,
-1.67547, 1.237832, -2.13702, 1, 0.3176471, 0, 1,
-1.673288, -0.3025689, -4.102521, 1, 0.3254902, 0, 1,
-1.665008, 1.293655, -0.4309857, 1, 0.3294118, 0, 1,
-1.66385, 0.9117438, -1.091824, 1, 0.3372549, 0, 1,
-1.660867, -1.902042, -3.385071, 1, 0.3411765, 0, 1,
-1.653815, -0.9992257, -1.131195, 1, 0.3490196, 0, 1,
-1.645501, 0.2042912, -1.887266, 1, 0.3529412, 0, 1,
-1.639342, 2.027341, -0.4395236, 1, 0.3607843, 0, 1,
-1.63463, 1.678282, -1.264131, 1, 0.3647059, 0, 1,
-1.633807, -0.7326248, -1.899374, 1, 0.372549, 0, 1,
-1.607773, -1.829981, -0.6559416, 1, 0.3764706, 0, 1,
-1.604623, 0.04940521, -2.504209, 1, 0.3843137, 0, 1,
-1.596522, -0.9599324, -0.9385903, 1, 0.3882353, 0, 1,
-1.594528, 1.295785, -0.2767013, 1, 0.3960784, 0, 1,
-1.582499, -0.9776719, -2.394248, 1, 0.4039216, 0, 1,
-1.56638, -0.09544642, -1.082735, 1, 0.4078431, 0, 1,
-1.542587, 1.871484, -1.69664, 1, 0.4156863, 0, 1,
-1.529711, 1.211706, 0.2063493, 1, 0.4196078, 0, 1,
-1.528309, -1.169609, -2.422489, 1, 0.427451, 0, 1,
-1.526752, -0.9604228, -2.321211, 1, 0.4313726, 0, 1,
-1.525783, -1.293009, -2.389481, 1, 0.4392157, 0, 1,
-1.522675, 0.5075066, -2.925478, 1, 0.4431373, 0, 1,
-1.514804, -1.536528, 0.0468471, 1, 0.4509804, 0, 1,
-1.50621, 0.7157152, -1.522593, 1, 0.454902, 0, 1,
-1.495247, -1.522529, -3.369776, 1, 0.4627451, 0, 1,
-1.49465, -2.255033, -3.112775, 1, 0.4666667, 0, 1,
-1.434147, -0.7201172, -2.028189, 1, 0.4745098, 0, 1,
-1.42659, 0.06012785, -2.328671, 1, 0.4784314, 0, 1,
-1.421403, 0.6518818, -1.215936, 1, 0.4862745, 0, 1,
-1.405642, -0.7886376, -1.952054, 1, 0.4901961, 0, 1,
-1.346782, -0.6615061, -1.611399, 1, 0.4980392, 0, 1,
-1.338001, 1.680866, 0.6804094, 1, 0.5058824, 0, 1,
-1.329986, 1.234298, -1.01204, 1, 0.509804, 0, 1,
-1.319051, -0.6738137, 0.234819, 1, 0.5176471, 0, 1,
-1.313786, -0.2897008, -0.3706086, 1, 0.5215687, 0, 1,
-1.312488, 1.799467, -1.926582, 1, 0.5294118, 0, 1,
-1.305138, -0.3905624, -3.037205, 1, 0.5333334, 0, 1,
-1.301649, -1.889497, -1.997681, 1, 0.5411765, 0, 1,
-1.300809, -0.4218814, -1.857659, 1, 0.5450981, 0, 1,
-1.293964, 1.023475, -0.4627568, 1, 0.5529412, 0, 1,
-1.287609, 0.5690937, 0.2859859, 1, 0.5568628, 0, 1,
-1.287586, 0.7238815, -0.4943498, 1, 0.5647059, 0, 1,
-1.286444, 0.1012398, -0.06161955, 1, 0.5686275, 0, 1,
-1.242072, 0.3257965, -1.032167, 1, 0.5764706, 0, 1,
-1.23998, 0.1421322, -1.203599, 1, 0.5803922, 0, 1,
-1.239446, -0.3978086, -1.727601, 1, 0.5882353, 0, 1,
-1.23802, -0.5757912, -3.819668, 1, 0.5921569, 0, 1,
-1.228515, -0.03898997, -1.845674, 1, 0.6, 0, 1,
-1.226679, 0.2891435, -1.944185, 1, 0.6078432, 0, 1,
-1.226056, -0.871617, -2.516419, 1, 0.6117647, 0, 1,
-1.223935, 0.1284518, -1.09703, 1, 0.6196079, 0, 1,
-1.20457, 1.810841, 0.8843235, 1, 0.6235294, 0, 1,
-1.199497, -1.703261, -3.654909, 1, 0.6313726, 0, 1,
-1.191877, 0.1827042, -1.637251, 1, 0.6352941, 0, 1,
-1.191417, 1.315712, 0.1124814, 1, 0.6431373, 0, 1,
-1.185471, -0.4381355, -1.160409, 1, 0.6470588, 0, 1,
-1.179824, -0.7103633, -1.547144, 1, 0.654902, 0, 1,
-1.165798, -0.7052082, -1.453434, 1, 0.6588235, 0, 1,
-1.165492, -0.08696843, -1.050262, 1, 0.6666667, 0, 1,
-1.164728, 0.2012773, -2.205423, 1, 0.6705883, 0, 1,
-1.160203, -0.976953, -2.027482, 1, 0.6784314, 0, 1,
-1.147454, -1.505054, -1.826051, 1, 0.682353, 0, 1,
-1.141416, 0.02774405, -3.566394, 1, 0.6901961, 0, 1,
-1.140212, -0.6252959, -0.9836528, 1, 0.6941177, 0, 1,
-1.133448, -1.100048, -2.706277, 1, 0.7019608, 0, 1,
-1.122009, -0.2459348, -1.864512, 1, 0.7098039, 0, 1,
-1.11928, 0.4337947, -2.150582, 1, 0.7137255, 0, 1,
-1.118221, 0.0716374, -1.274586, 1, 0.7215686, 0, 1,
-1.113828, 0.5557646, -2.680204, 1, 0.7254902, 0, 1,
-1.110649, 0.2309342, -1.272334, 1, 0.7333333, 0, 1,
-1.108604, 0.6783323, -2.389084, 1, 0.7372549, 0, 1,
-1.102003, -0.599808, -1.663363, 1, 0.7450981, 0, 1,
-1.09884, -1.199903, -3.049652, 1, 0.7490196, 0, 1,
-1.096164, -0.8503636, -2.15095, 1, 0.7568628, 0, 1,
-1.090795, 0.2409698, -1.833628, 1, 0.7607843, 0, 1,
-1.084979, 0.6649058, -2.115883, 1, 0.7686275, 0, 1,
-1.081477, -0.6645452, -1.594215, 1, 0.772549, 0, 1,
-1.079793, -0.5865237, 0.03982529, 1, 0.7803922, 0, 1,
-1.076774, -0.3480936, -1.465134, 1, 0.7843137, 0, 1,
-1.075884, 0.0875496, 0.7655582, 1, 0.7921569, 0, 1,
-1.075108, -1.657446, -2.400329, 1, 0.7960784, 0, 1,
-1.072162, 1.001343, -1.635908, 1, 0.8039216, 0, 1,
-1.071671, 0.6692005, -0.9058644, 1, 0.8117647, 0, 1,
-1.052473, 0.5840096, -0.5804463, 1, 0.8156863, 0, 1,
-1.051485, -1.730349, -2.655472, 1, 0.8235294, 0, 1,
-1.04774, -1.290343, -3.373343, 1, 0.827451, 0, 1,
-1.045162, 0.2378466, -0.4815731, 1, 0.8352941, 0, 1,
-1.042801, -1.119902, -3.657479, 1, 0.8392157, 0, 1,
-1.037411, 0.3654287, -1.871193, 1, 0.8470588, 0, 1,
-1.033208, -1.361259, -3.407237, 1, 0.8509804, 0, 1,
-1.030031, 0.568459, -1.441374, 1, 0.8588235, 0, 1,
-1.025589, -0.2454813, -0.3458945, 1, 0.8627451, 0, 1,
-1.02425, -0.7891805, -2.162909, 1, 0.8705882, 0, 1,
-1.020573, -1.359631, -3.177911, 1, 0.8745098, 0, 1,
-1.015129, 1.045477, -0.4187073, 1, 0.8823529, 0, 1,
-1.01381, 1.237402, -1.095555, 1, 0.8862745, 0, 1,
-1.013232, 0.2338939, -2.484616, 1, 0.8941177, 0, 1,
-1.004124, 0.4268642, -2.357432, 1, 0.8980392, 0, 1,
-0.9998248, 1.059869, -0.487893, 1, 0.9058824, 0, 1,
-0.9940998, -0.882077, -1.854063, 1, 0.9137255, 0, 1,
-0.9854941, -0.003628459, 0.2582115, 1, 0.9176471, 0, 1,
-0.9826674, -0.5989861, -1.873095, 1, 0.9254902, 0, 1,
-0.9808887, 0.1153306, -2.221441, 1, 0.9294118, 0, 1,
-0.9790829, -0.6388579, -3.903202, 1, 0.9372549, 0, 1,
-0.9760109, -0.06335193, -0.4857326, 1, 0.9411765, 0, 1,
-0.97389, 0.04306906, -2.144011, 1, 0.9490196, 0, 1,
-0.9639775, -0.05150578, -2.37514, 1, 0.9529412, 0, 1,
-0.9595913, -0.5604797, -2.828504, 1, 0.9607843, 0, 1,
-0.9584386, 0.7353292, -1.516579, 1, 0.9647059, 0, 1,
-0.9571466, 0.7930997, -0.1700561, 1, 0.972549, 0, 1,
-0.9554974, -0.5121332, -2.183138, 1, 0.9764706, 0, 1,
-0.947681, -0.7030125, -2.19657, 1, 0.9843137, 0, 1,
-0.9475771, -1.150275, -3.07609, 1, 0.9882353, 0, 1,
-0.9413341, 0.548457, -2.071445, 1, 0.9960784, 0, 1,
-0.9400997, 1.047915, -2.521175, 0.9960784, 1, 0, 1,
-0.9329724, -0.879465, -1.485578, 0.9921569, 1, 0, 1,
-0.9318089, -0.07914017, -0.5078337, 0.9843137, 1, 0, 1,
-0.919777, -1.302671, -3.144927, 0.9803922, 1, 0, 1,
-0.9177962, 1.077259, -0.9023352, 0.972549, 1, 0, 1,
-0.9113346, -1.192138, -3.547879, 0.9686275, 1, 0, 1,
-0.8849609, 1.50146, 1.11287, 0.9607843, 1, 0, 1,
-0.8842002, 0.8882597, 0.5811602, 0.9568627, 1, 0, 1,
-0.884021, 0.6536394, 0.3500033, 0.9490196, 1, 0, 1,
-0.8840188, 0.2288565, -0.5353947, 0.945098, 1, 0, 1,
-0.8836779, 0.4534389, -1.240798, 0.9372549, 1, 0, 1,
-0.8820772, 0.01807323, -1.704185, 0.9333333, 1, 0, 1,
-0.8815848, 0.2083108, -1.631159, 0.9254902, 1, 0, 1,
-0.88121, 0.1834911, -1.642861, 0.9215686, 1, 0, 1,
-0.8685491, -0.3178191, -2.486451, 0.9137255, 1, 0, 1,
-0.865409, 0.0770636, -2.252581, 0.9098039, 1, 0, 1,
-0.860943, 0.1003867, -0.8835968, 0.9019608, 1, 0, 1,
-0.8598877, -0.8816529, -4.756551, 0.8941177, 1, 0, 1,
-0.8544775, -1.454342, -1.167864, 0.8901961, 1, 0, 1,
-0.850725, -1.128655, -3.802606, 0.8823529, 1, 0, 1,
-0.8409327, -0.627396, -1.705371, 0.8784314, 1, 0, 1,
-0.8404773, 1.446431, -0.2641265, 0.8705882, 1, 0, 1,
-0.8388582, -1.665736, -1.765785, 0.8666667, 1, 0, 1,
-0.8355561, 0.8154958, 0.2374299, 0.8588235, 1, 0, 1,
-0.8294582, 0.2810226, -1.734323, 0.854902, 1, 0, 1,
-0.8289874, 0.9975491, -1.408027, 0.8470588, 1, 0, 1,
-0.8231704, 0.04354201, -2.733479, 0.8431373, 1, 0, 1,
-0.8180202, 0.03077838, -0.1343112, 0.8352941, 1, 0, 1,
-0.8106741, -0.08771905, -2.990887, 0.8313726, 1, 0, 1,
-0.809639, -1.881888, -0.9212596, 0.8235294, 1, 0, 1,
-0.8054666, -1.062204, -2.684485, 0.8196079, 1, 0, 1,
-0.8003806, -0.8917517, -1.15011, 0.8117647, 1, 0, 1,
-0.7982646, 1.187083, -0.2525607, 0.8078431, 1, 0, 1,
-0.7970479, 1.07744, 0.3822786, 0.8, 1, 0, 1,
-0.7958014, -2.277926, -3.462071, 0.7921569, 1, 0, 1,
-0.7952742, -0.4488064, -1.228807, 0.7882353, 1, 0, 1,
-0.794618, 0.03275675, -1.272493, 0.7803922, 1, 0, 1,
-0.7938588, -0.04321748, -1.129162, 0.7764706, 1, 0, 1,
-0.7885765, 0.9577876, -1.513127, 0.7686275, 1, 0, 1,
-0.7840582, -0.3875932, -1.722639, 0.7647059, 1, 0, 1,
-0.7792548, 0.1425588, 0.4019941, 0.7568628, 1, 0, 1,
-0.7773719, 1.032196, -1.701707, 0.7529412, 1, 0, 1,
-0.7690288, -1.447497, -2.661952, 0.7450981, 1, 0, 1,
-0.7681147, 1.638242, 0.0310477, 0.7411765, 1, 0, 1,
-0.7678033, 1.129227, -0.7262052, 0.7333333, 1, 0, 1,
-0.7628744, 1.939398, -1.736103, 0.7294118, 1, 0, 1,
-0.7608147, -0.0665253, -3.816531, 0.7215686, 1, 0, 1,
-0.7573775, 1.866572, -0.8352157, 0.7176471, 1, 0, 1,
-0.7553402, -1.151448, -3.984283, 0.7098039, 1, 0, 1,
-0.7550784, -0.2981574, -2.00738, 0.7058824, 1, 0, 1,
-0.7544123, 0.7914745, -0.860339, 0.6980392, 1, 0, 1,
-0.7499536, -0.9442784, -2.166022, 0.6901961, 1, 0, 1,
-0.7495586, -0.3395358, -1.556139, 0.6862745, 1, 0, 1,
-0.74666, -1.548927, -1.806288, 0.6784314, 1, 0, 1,
-0.7458308, 0.3370933, -3.049073, 0.6745098, 1, 0, 1,
-0.7457299, -0.2862119, -2.025542, 0.6666667, 1, 0, 1,
-0.7380503, -1.213774, -2.472449, 0.6627451, 1, 0, 1,
-0.737205, 0.5850374, -0.2925816, 0.654902, 1, 0, 1,
-0.7300467, 0.7957348, -1.611276, 0.6509804, 1, 0, 1,
-0.7286792, -1.986905, -1.520837, 0.6431373, 1, 0, 1,
-0.7281085, 0.3354427, -1.425728, 0.6392157, 1, 0, 1,
-0.7259144, 0.5993629, -0.1712321, 0.6313726, 1, 0, 1,
-0.725197, -1.245059, -2.826309, 0.627451, 1, 0, 1,
-0.7226554, 0.1805061, -0.5156799, 0.6196079, 1, 0, 1,
-0.7176698, -0.8677799, -3.792466, 0.6156863, 1, 0, 1,
-0.7087523, 0.01664483, 0.9499113, 0.6078432, 1, 0, 1,
-0.7024001, -0.6626366, -2.841678, 0.6039216, 1, 0, 1,
-0.7010139, -0.8370264, -2.162353, 0.5960785, 1, 0, 1,
-0.6996343, -0.8699297, -2.287366, 0.5882353, 1, 0, 1,
-0.6957178, 1.47962, -0.616195, 0.5843138, 1, 0, 1,
-0.6921904, 1.086497, -1.011355, 0.5764706, 1, 0, 1,
-0.6883335, 0.05029241, -1.099792, 0.572549, 1, 0, 1,
-0.6847045, 0.5971154, -0.3942922, 0.5647059, 1, 0, 1,
-0.6841566, -0.04471249, -1.819377, 0.5607843, 1, 0, 1,
-0.6807787, -0.587511, -3.034122, 0.5529412, 1, 0, 1,
-0.6720579, -1.09183, -2.059786, 0.5490196, 1, 0, 1,
-0.6704174, -0.3698539, -3.295885, 0.5411765, 1, 0, 1,
-0.6677946, 0.08959264, -3.517467, 0.5372549, 1, 0, 1,
-0.6675073, -0.5552977, -0.7639886, 0.5294118, 1, 0, 1,
-0.6657323, -0.891353, -3.91174, 0.5254902, 1, 0, 1,
-0.6653075, 0.3547615, 0.2099971, 0.5176471, 1, 0, 1,
-0.6649972, -0.8342305, -2.809901, 0.5137255, 1, 0, 1,
-0.6577116, 1.396154, -0.2140474, 0.5058824, 1, 0, 1,
-0.656563, -0.9870674, -2.20488, 0.5019608, 1, 0, 1,
-0.6564673, -2.717188, -1.843246, 0.4941176, 1, 0, 1,
-0.6426644, -0.1157917, -2.198856, 0.4862745, 1, 0, 1,
-0.6424899, -1.076881, -2.323114, 0.4823529, 1, 0, 1,
-0.6412014, 0.7255495, 0.4829028, 0.4745098, 1, 0, 1,
-0.6408409, 1.318642, 0.88455, 0.4705882, 1, 0, 1,
-0.6406993, -0.7226915, -3.57569, 0.4627451, 1, 0, 1,
-0.6393828, 2.262437, -0.3005817, 0.4588235, 1, 0, 1,
-0.6354269, 0.6109887, -1.132388, 0.4509804, 1, 0, 1,
-0.6236376, -0.6674128, -4.048038, 0.4470588, 1, 0, 1,
-0.621497, 0.7893127, -1.620527, 0.4392157, 1, 0, 1,
-0.6211321, -0.0843335, 0.8620146, 0.4352941, 1, 0, 1,
-0.6178842, -1.036332, -2.949877, 0.427451, 1, 0, 1,
-0.6174805, 0.7580168, -0.2401335, 0.4235294, 1, 0, 1,
-0.615573, 0.2858694, -1.76213, 0.4156863, 1, 0, 1,
-0.6139588, 1.678433, -0.07533404, 0.4117647, 1, 0, 1,
-0.6135931, -0.1947964, -1.377882, 0.4039216, 1, 0, 1,
-0.6054779, 0.3137178, 0.9608614, 0.3960784, 1, 0, 1,
-0.6034034, -1.650173, -2.874772, 0.3921569, 1, 0, 1,
-0.5955027, 0.2483392, -0.001647727, 0.3843137, 1, 0, 1,
-0.5926808, -0.3667232, -1.496722, 0.3803922, 1, 0, 1,
-0.5919647, -0.721765, -3.80074, 0.372549, 1, 0, 1,
-0.587567, 1.397345, -1.596606, 0.3686275, 1, 0, 1,
-0.5813844, -0.3044337, -1.487738, 0.3607843, 1, 0, 1,
-0.570503, -1.009193, -3.05453, 0.3568628, 1, 0, 1,
-0.5666267, 0.1800123, -2.007775, 0.3490196, 1, 0, 1,
-0.5588844, -0.5615318, -3.105447, 0.345098, 1, 0, 1,
-0.5530587, 0.7649954, -2.014808, 0.3372549, 1, 0, 1,
-0.5509553, -1.832001, -1.766209, 0.3333333, 1, 0, 1,
-0.5419278, 0.3347335, -1.787693, 0.3254902, 1, 0, 1,
-0.5381764, 0.008432267, -3.237482, 0.3215686, 1, 0, 1,
-0.5347882, 0.2020692, -1.425015, 0.3137255, 1, 0, 1,
-0.5240719, -1.44635, -0.4036197, 0.3098039, 1, 0, 1,
-0.5233607, -0.1978541, -3.315617, 0.3019608, 1, 0, 1,
-0.5200614, 0.6410629, -1.392456, 0.2941177, 1, 0, 1,
-0.5198759, 1.677633, 1.115191, 0.2901961, 1, 0, 1,
-0.515209, -0.4748847, -1.846749, 0.282353, 1, 0, 1,
-0.5133668, -0.6556065, -3.851208, 0.2784314, 1, 0, 1,
-0.5123745, 0.163044, -1.268294, 0.2705882, 1, 0, 1,
-0.508095, 0.1217984, -0.4865086, 0.2666667, 1, 0, 1,
-0.4985921, 0.3875919, -0.001997359, 0.2588235, 1, 0, 1,
-0.4936957, -1.023562, -1.598885, 0.254902, 1, 0, 1,
-0.4935766, -0.0782273, -1.526514, 0.2470588, 1, 0, 1,
-0.4934666, 0.2579862, -0.5021345, 0.2431373, 1, 0, 1,
-0.4931991, -1.845508, -4.663835, 0.2352941, 1, 0, 1,
-0.4920174, 1.232382, -0.2752381, 0.2313726, 1, 0, 1,
-0.4905778, 1.314055, -2.304083, 0.2235294, 1, 0, 1,
-0.490237, -1.614825, -3.292849, 0.2196078, 1, 0, 1,
-0.4856836, 0.9978986, -0.824532, 0.2117647, 1, 0, 1,
-0.4816156, -1.64167, -3.516388, 0.2078431, 1, 0, 1,
-0.481458, -1.156513, -3.068863, 0.2, 1, 0, 1,
-0.4756693, 0.943864, -0.3444076, 0.1921569, 1, 0, 1,
-0.4748706, -1.343332, -1.431321, 0.1882353, 1, 0, 1,
-0.4670391, 0.7304863, -0.8824868, 0.1803922, 1, 0, 1,
-0.4664057, 1.180582, -0.8742623, 0.1764706, 1, 0, 1,
-0.4577843, 0.1483474, -1.660837, 0.1686275, 1, 0, 1,
-0.4575207, -0.3333209, -2.396595, 0.1647059, 1, 0, 1,
-0.4525633, -0.0935308, -1.174974, 0.1568628, 1, 0, 1,
-0.4518917, -1.132401, -2.644394, 0.1529412, 1, 0, 1,
-0.4518088, -0.02624357, 0.05389476, 0.145098, 1, 0, 1,
-0.4493799, 0.1326686, 0.1461538, 0.1411765, 1, 0, 1,
-0.4461977, -1.094343, -3.201546, 0.1333333, 1, 0, 1,
-0.4453267, -1.272703, -3.32524, 0.1294118, 1, 0, 1,
-0.442475, 0.3047545, 0.2930915, 0.1215686, 1, 0, 1,
-0.4389724, -0.1050903, -3.016052, 0.1176471, 1, 0, 1,
-0.4345232, -1.06294, -1.448496, 0.1098039, 1, 0, 1,
-0.4344418, 1.360107, 0.9721935, 0.1058824, 1, 0, 1,
-0.4179023, 0.5662118, 0.2854925, 0.09803922, 1, 0, 1,
-0.4176936, -2.175121, -3.033123, 0.09019608, 1, 0, 1,
-0.414423, -0.3713548, -3.187794, 0.08627451, 1, 0, 1,
-0.4096541, 1.299565, -2.098543, 0.07843138, 1, 0, 1,
-0.4090076, 0.7543824, 1.007119, 0.07450981, 1, 0, 1,
-0.402271, 0.9722679, -0.8777362, 0.06666667, 1, 0, 1,
-0.4014977, -1.15824, -3.860582, 0.0627451, 1, 0, 1,
-0.3942398, -0.6269955, -3.145936, 0.05490196, 1, 0, 1,
-0.3938619, -0.3712537, -0.7749879, 0.05098039, 1, 0, 1,
-0.388411, -0.3004445, -3.311577, 0.04313726, 1, 0, 1,
-0.3883864, -0.8890473, -3.850508, 0.03921569, 1, 0, 1,
-0.3855358, 0.585166, -0.151146, 0.03137255, 1, 0, 1,
-0.3849719, -1.013956, -1.452436, 0.02745098, 1, 0, 1,
-0.3831891, 0.05797983, -0.9098859, 0.01960784, 1, 0, 1,
-0.3829015, -1.43576, -3.584866, 0.01568628, 1, 0, 1,
-0.3792827, -1.66899, -4.385865, 0.007843138, 1, 0, 1,
-0.37505, -0.6882904, -2.531846, 0.003921569, 1, 0, 1,
-0.3737189, 0.5683798, 0.181397, 0, 1, 0.003921569, 1,
-0.3726932, -0.3876041, -3.893531, 0, 1, 0.01176471, 1,
-0.3710563, 0.749972, 0.02181049, 0, 1, 0.01568628, 1,
-0.3687475, -1.929677, -4.337138, 0, 1, 0.02352941, 1,
-0.3643216, 0.6569244, -0.806671, 0, 1, 0.02745098, 1,
-0.3641195, -0.6754899, -2.66847, 0, 1, 0.03529412, 1,
-0.3593274, 0.5968574, -0.6107494, 0, 1, 0.03921569, 1,
-0.3580892, 0.6993773, -0.5749715, 0, 1, 0.04705882, 1,
-0.3528169, 0.3245982, -2.880099, 0, 1, 0.05098039, 1,
-0.3525691, -0.2565927, -2.110135, 0, 1, 0.05882353, 1,
-0.3522017, 1.411685, 1.132374, 0, 1, 0.0627451, 1,
-0.3482511, 0.05615573, -1.488711, 0, 1, 0.07058824, 1,
-0.3433423, 0.8983136, 0.3033009, 0, 1, 0.07450981, 1,
-0.3427868, 0.8637099, 0.4685402, 0, 1, 0.08235294, 1,
-0.3320945, -1.652274, -1.525091, 0, 1, 0.08627451, 1,
-0.3290996, 0.7899978, 0.4526635, 0, 1, 0.09411765, 1,
-0.3248303, -0.286003, -2.051684, 0, 1, 0.1019608, 1,
-0.324209, 2.437161, -0.1783345, 0, 1, 0.1058824, 1,
-0.321427, 0.2932815, 0.7364568, 0, 1, 0.1137255, 1,
-0.320775, 1.115503, -0.8050057, 0, 1, 0.1176471, 1,
-0.3081741, -0.3722632, -1.784168, 0, 1, 0.1254902, 1,
-0.3003241, -0.6128637, -4.12636, 0, 1, 0.1294118, 1,
-0.3000934, -0.9405603, -2.551674, 0, 1, 0.1372549, 1,
-0.2985864, 1.759566, 1.039397, 0, 1, 0.1411765, 1,
-0.2980519, 0.2049562, 0.9057764, 0, 1, 0.1490196, 1,
-0.2975957, 0.6545591, 0.4107229, 0, 1, 0.1529412, 1,
-0.2973435, -0.05446823, -1.566372, 0, 1, 0.1607843, 1,
-0.287894, -0.4169823, -3.025223, 0, 1, 0.1647059, 1,
-0.2842695, -1.056774, -2.65646, 0, 1, 0.172549, 1,
-0.2807766, -0.04661739, -0.6716873, 0, 1, 0.1764706, 1,
-0.2789487, 0.8790998, 0.2504379, 0, 1, 0.1843137, 1,
-0.277658, -1.103827, -2.238971, 0, 1, 0.1882353, 1,
-0.2730859, -0.5977299, -2.03288, 0, 1, 0.1960784, 1,
-0.2675057, -0.5065373, -2.801398, 0, 1, 0.2039216, 1,
-0.2650342, 2.215206, 0.7536719, 0, 1, 0.2078431, 1,
-0.2644955, 0.5950434, -1.79945, 0, 1, 0.2156863, 1,
-0.262366, 0.3711566, -0.5391962, 0, 1, 0.2196078, 1,
-0.2607208, -0.4083063, -1.17367, 0, 1, 0.227451, 1,
-0.2605303, 0.1086941, -1.894716, 0, 1, 0.2313726, 1,
-0.2598751, -0.2654074, -2.131673, 0, 1, 0.2392157, 1,
-0.2595084, 0.08048061, 0.06368378, 0, 1, 0.2431373, 1,
-0.2568991, 1.014652, -0.1473347, 0, 1, 0.2509804, 1,
-0.2515172, 0.4771049, 0.1367675, 0, 1, 0.254902, 1,
-0.2514813, 0.765442, -0.1267023, 0, 1, 0.2627451, 1,
-0.2499592, -1.745296, -4.214128, 0, 1, 0.2666667, 1,
-0.2387702, -2.439336, -2.801905, 0, 1, 0.2745098, 1,
-0.2377602, -1.60577, -2.609597, 0, 1, 0.2784314, 1,
-0.2376901, -0.4687298, -4.67767, 0, 1, 0.2862745, 1,
-0.2365816, -0.2940986, -4.608129, 0, 1, 0.2901961, 1,
-0.2320563, -0.1993157, -2.957285, 0, 1, 0.2980392, 1,
-0.2276446, -1.150033, -3.34984, 0, 1, 0.3058824, 1,
-0.2273757, 0.9720892, 2.237672, 0, 1, 0.3098039, 1,
-0.224857, 1.207799, 0.6594254, 0, 1, 0.3176471, 1,
-0.2225859, -0.2398733, -2.721366, 0, 1, 0.3215686, 1,
-0.220543, 0.2215392, -1.502158, 0, 1, 0.3294118, 1,
-0.2180117, 1.878919, -0.1572828, 0, 1, 0.3333333, 1,
-0.2161048, -0.5551733, -3.80298, 0, 1, 0.3411765, 1,
-0.2157896, 0.003831627, -1.911681, 0, 1, 0.345098, 1,
-0.2150608, -0.0187825, -1.881291, 0, 1, 0.3529412, 1,
-0.2145335, -0.1961444, -3.785203, 0, 1, 0.3568628, 1,
-0.2116416, -1.193797, -0.7802453, 0, 1, 0.3647059, 1,
-0.2035957, 0.2209047, -0.1662947, 0, 1, 0.3686275, 1,
-0.2033964, -2.055264, -2.580226, 0, 1, 0.3764706, 1,
-0.2004521, 1.232032, 0.2751501, 0, 1, 0.3803922, 1,
-0.2002559, 2.013485, -0.395969, 0, 1, 0.3882353, 1,
-0.1989467, -0.08463101, -2.130793, 0, 1, 0.3921569, 1,
-0.1981112, 0.3910485, 0.5651459, 0, 1, 0.4, 1,
-0.1921753, -1.055104, -0.7207608, 0, 1, 0.4078431, 1,
-0.1915981, -0.9218683, -0.8971424, 0, 1, 0.4117647, 1,
-0.1877413, 0.6925495, -1.406119, 0, 1, 0.4196078, 1,
-0.1858093, 0.04714686, 0.3612842, 0, 1, 0.4235294, 1,
-0.184337, -1.235819, -2.443725, 0, 1, 0.4313726, 1,
-0.1840399, -0.8660549, -0.7954637, 0, 1, 0.4352941, 1,
-0.1772209, -1.769118, -3.451832, 0, 1, 0.4431373, 1,
-0.1703996, 0.7305168, -1.115635, 0, 1, 0.4470588, 1,
-0.1692056, -0.7651616, -3.421596, 0, 1, 0.454902, 1,
-0.1685298, -1.676635, -2.76858, 0, 1, 0.4588235, 1,
-0.1664784, -0.7851738, -3.234755, 0, 1, 0.4666667, 1,
-0.1650358, -0.4381363, -2.793712, 0, 1, 0.4705882, 1,
-0.164659, 0.4277064, -0.4634644, 0, 1, 0.4784314, 1,
-0.1644362, -1.427575, -2.909796, 0, 1, 0.4823529, 1,
-0.1624627, 1.802677, 0.07957031, 0, 1, 0.4901961, 1,
-0.1593386, -1.230231, -1.913961, 0, 1, 0.4941176, 1,
-0.1580616, 0.2338394, -1.009157, 0, 1, 0.5019608, 1,
-0.157167, -1.383634, -1.431811, 0, 1, 0.509804, 1,
-0.1568077, 0.7088209, -0.2537632, 0, 1, 0.5137255, 1,
-0.144646, -0.5417637, -3.183762, 0, 1, 0.5215687, 1,
-0.1374412, 0.4246431, -1.545747, 0, 1, 0.5254902, 1,
-0.1357034, 0.9153243, 0.5206626, 0, 1, 0.5333334, 1,
-0.1306962, -0.6751183, -3.133176, 0, 1, 0.5372549, 1,
-0.1289589, 1.389682, -0.3974797, 0, 1, 0.5450981, 1,
-0.1282723, -0.2089908, -3.058192, 0, 1, 0.5490196, 1,
-0.128168, -0.153571, -2.220577, 0, 1, 0.5568628, 1,
-0.1263901, 0.1241353, -0.7598525, 0, 1, 0.5607843, 1,
-0.1262574, -0.5247884, -2.711896, 0, 1, 0.5686275, 1,
-0.1231606, -0.422707, -3.35482, 0, 1, 0.572549, 1,
-0.1216799, -0.07306428, -2.751639, 0, 1, 0.5803922, 1,
-0.1199394, -1.667154, -2.939601, 0, 1, 0.5843138, 1,
-0.1189518, -0.500681, -2.602959, 0, 1, 0.5921569, 1,
-0.1100019, 0.5994576, 0.3633869, 0, 1, 0.5960785, 1,
-0.1021877, -2.043788, -2.929731, 0, 1, 0.6039216, 1,
-0.09981469, -1.065545, -0.7541667, 0, 1, 0.6117647, 1,
-0.09871571, 0.3934953, 1.141855, 0, 1, 0.6156863, 1,
-0.09385414, 0.9060283, 1.074467, 0, 1, 0.6235294, 1,
-0.09227972, 0.8169165, 1.760298, 0, 1, 0.627451, 1,
-0.08976207, 1.191226, -0.5496061, 0, 1, 0.6352941, 1,
-0.08552627, 1.935953, 0.2441692, 0, 1, 0.6392157, 1,
-0.08535884, 1.870955, 0.6146187, 0, 1, 0.6470588, 1,
-0.08024896, -1.225093, -2.841614, 0, 1, 0.6509804, 1,
-0.07903295, 0.5363088, -0.6063587, 0, 1, 0.6588235, 1,
-0.06852598, -0.255309, -2.769108, 0, 1, 0.6627451, 1,
-0.06788248, 0.08875747, -2.62637, 0, 1, 0.6705883, 1,
-0.06742612, 0.4286919, 0.2970581, 0, 1, 0.6745098, 1,
-0.06719173, 1.63775, 1.211355, 0, 1, 0.682353, 1,
-0.06494493, -0.9886981, -4.429451, 0, 1, 0.6862745, 1,
-0.06463937, -1.149989, -4.43599, 0, 1, 0.6941177, 1,
-0.06462058, 1.407532, -0.2744771, 0, 1, 0.7019608, 1,
-0.0643016, -0.4513523, -2.601596, 0, 1, 0.7058824, 1,
-0.06160177, 0.2365462, 0.5103962, 0, 1, 0.7137255, 1,
-0.06067961, 1.006468, 1.871007, 0, 1, 0.7176471, 1,
-0.05803316, 0.0710659, -1.985896, 0, 1, 0.7254902, 1,
-0.0496309, 0.5648456, 0.3671188, 0, 1, 0.7294118, 1,
-0.04734772, -0.3532845, -2.130883, 0, 1, 0.7372549, 1,
-0.04633225, -0.1673885, -4.229385, 0, 1, 0.7411765, 1,
-0.04337364, 0.3026053, 0.2038775, 0, 1, 0.7490196, 1,
-0.04263863, -0.4154068, -3.538803, 0, 1, 0.7529412, 1,
-0.03959257, 0.785317, -0.2507469, 0, 1, 0.7607843, 1,
-0.03359274, 0.9774969, -0.22528, 0, 1, 0.7647059, 1,
-0.03327093, -1.622151, -1.74802, 0, 1, 0.772549, 1,
-0.03099792, 1.116624, -1.696325, 0, 1, 0.7764706, 1,
-0.02384627, -1.284678, -2.748306, 0, 1, 0.7843137, 1,
-0.0177018, -1.622955, -3.221455, 0, 1, 0.7882353, 1,
-0.01682484, -0.8508785, -2.689331, 0, 1, 0.7960784, 1,
-0.01598924, -1.993803, -4.555821, 0, 1, 0.8039216, 1,
-0.01252676, -0.2390184, -2.100322, 0, 1, 0.8078431, 1,
-0.01103758, -0.01591303, -3.491284, 0, 1, 0.8156863, 1,
-0.0101989, 0.04665959, 0.02146234, 0, 1, 0.8196079, 1,
-0.00534822, 3.022808, 0.2691961, 0, 1, 0.827451, 1,
-0.0001893879, 0.9452977, -0.5094512, 0, 1, 0.8313726, 1,
0.000872988, -0.7490423, 3.615029, 0, 1, 0.8392157, 1,
0.001367479, -0.7333637, 2.304216, 0, 1, 0.8431373, 1,
0.002555751, -0.2175471, 4.969355, 0, 1, 0.8509804, 1,
0.003845948, 1.083569, 0.4145442, 0, 1, 0.854902, 1,
0.004158265, -0.1779089, 3.854132, 0, 1, 0.8627451, 1,
0.004969684, -0.3094804, 3.589339, 0, 1, 0.8666667, 1,
0.009242411, -0.7177274, 4.774191, 0, 1, 0.8745098, 1,
0.009554013, 0.9321232, 0.5433124, 0, 1, 0.8784314, 1,
0.0101666, 1.113782, 1.777775, 0, 1, 0.8862745, 1,
0.01206182, -0.1869761, 3.854254, 0, 1, 0.8901961, 1,
0.01493459, -0.5029107, 2.1021, 0, 1, 0.8980392, 1,
0.01542925, 0.7914605, -0.05945096, 0, 1, 0.9058824, 1,
0.0189667, -0.2534938, 5.093449, 0, 1, 0.9098039, 1,
0.02179217, -1.494263, 2.794705, 0, 1, 0.9176471, 1,
0.02448615, 0.5432252, -1.358079, 0, 1, 0.9215686, 1,
0.02622197, 0.277793, -0.1411939, 0, 1, 0.9294118, 1,
0.02971562, -1.185117, 3.172621, 0, 1, 0.9333333, 1,
0.03061682, -0.7852343, 1.807517, 0, 1, 0.9411765, 1,
0.03322794, -0.6504018, 3.007134, 0, 1, 0.945098, 1,
0.03326651, -1.777497, 3.878499, 0, 1, 0.9529412, 1,
0.03431848, 1.025237, 1.995637, 0, 1, 0.9568627, 1,
0.04374221, -0.1893612, 3.46041, 0, 1, 0.9647059, 1,
0.04391815, 1.784459, 0.504909, 0, 1, 0.9686275, 1,
0.04712167, -0.9632314, 1.520551, 0, 1, 0.9764706, 1,
0.04771541, -1.375387, 2.99043, 0, 1, 0.9803922, 1,
0.0485782, -0.7564381, 2.99139, 0, 1, 0.9882353, 1,
0.04909528, 2.118094, 0.02127459, 0, 1, 0.9921569, 1,
0.04929385, -0.4865927, 1.993117, 0, 1, 1, 1,
0.05129381, -0.01080916, 1.990878, 0, 0.9921569, 1, 1,
0.05135203, 0.771163, 0.2439254, 0, 0.9882353, 1, 1,
0.0558399, -0.2302132, 3.864016, 0, 0.9803922, 1, 1,
0.05732498, 1.423024, 1.634419, 0, 0.9764706, 1, 1,
0.06042596, 0.0855139, 1.011182, 0, 0.9686275, 1, 1,
0.06432113, -0.3198457, 1.492707, 0, 0.9647059, 1, 1,
0.06802585, -2.129133, 2.089159, 0, 0.9568627, 1, 1,
0.07490643, -1.218824, 3.054055, 0, 0.9529412, 1, 1,
0.08329217, 0.04339082, 2.184991, 0, 0.945098, 1, 1,
0.0840118, -1.683962, 2.858557, 0, 0.9411765, 1, 1,
0.0876727, 0.4391551, -0.8894605, 0, 0.9333333, 1, 1,
0.09434052, 1.842615, 0.7832249, 0, 0.9294118, 1, 1,
0.09527197, 0.4823029, 0.5664613, 0, 0.9215686, 1, 1,
0.09669409, 0.5700794, 0.8289918, 0, 0.9176471, 1, 1,
0.09900603, -0.3070402, 4.099526, 0, 0.9098039, 1, 1,
0.1011512, 1.860257, 1.185919, 0, 0.9058824, 1, 1,
0.1041416, -0.7275873, 2.499115, 0, 0.8980392, 1, 1,
0.1090621, -1.988217, 3.068105, 0, 0.8901961, 1, 1,
0.1103093, 0.5481197, 1.104158, 0, 0.8862745, 1, 1,
0.1111898, -0.568377, 3.935713, 0, 0.8784314, 1, 1,
0.1114467, -2.102601, 2.411205, 0, 0.8745098, 1, 1,
0.1142027, 0.3613662, 1.110543, 0, 0.8666667, 1, 1,
0.1143862, -1.20763, 3.746851, 0, 0.8627451, 1, 1,
0.1183095, -1.74556, 4.325846, 0, 0.854902, 1, 1,
0.1237268, 1.265616, 0.1306848, 0, 0.8509804, 1, 1,
0.1238623, 0.9644021, -0.555684, 0, 0.8431373, 1, 1,
0.1255917, 0.4723052, -1.385011, 0, 0.8392157, 1, 1,
0.1330403, 0.433146, -0.7553975, 0, 0.8313726, 1, 1,
0.13484, -0.6327709, 1.713674, 0, 0.827451, 1, 1,
0.1350419, -0.9164878, 2.484798, 0, 0.8196079, 1, 1,
0.1427099, 1.057506, -1.888877, 0, 0.8156863, 1, 1,
0.1432474, -0.4073245, 3.258477, 0, 0.8078431, 1, 1,
0.1443197, -0.3557673, 3.244321, 0, 0.8039216, 1, 1,
0.1466444, 0.6440141, -0.8889223, 0, 0.7960784, 1, 1,
0.1514395, 1.081116, 0.4893132, 0, 0.7882353, 1, 1,
0.1531027, -0.6613316, 2.76137, 0, 0.7843137, 1, 1,
0.1532098, 0.8033496, 0.8204523, 0, 0.7764706, 1, 1,
0.1577413, 0.3733512, 0.2558547, 0, 0.772549, 1, 1,
0.1579269, -0.64713, 2.836966, 0, 0.7647059, 1, 1,
0.1601673, 0.789744, 2.028637, 0, 0.7607843, 1, 1,
0.1615271, -2.373819, 3.17946, 0, 0.7529412, 1, 1,
0.1702248, -0.3340394, 4.105378, 0, 0.7490196, 1, 1,
0.1705669, -0.8174868, 4.895327, 0, 0.7411765, 1, 1,
0.1719299, 0.1657161, -0.0851049, 0, 0.7372549, 1, 1,
0.1738596, -2.892542, 2.979186, 0, 0.7294118, 1, 1,
0.1794436, 1.289609, -0.5650014, 0, 0.7254902, 1, 1,
0.1828301, 1.072573, 0.9922686, 0, 0.7176471, 1, 1,
0.1840647, -0.4943199, 2.997048, 0, 0.7137255, 1, 1,
0.1938087, -1.219603, 2.116261, 0, 0.7058824, 1, 1,
0.1950824, 0.6415313, 0.8267947, 0, 0.6980392, 1, 1,
0.1965572, 0.8718471, 1.703578, 0, 0.6941177, 1, 1,
0.1967049, 1.302397, 1.536783, 0, 0.6862745, 1, 1,
0.1967682, -0.9829088, 4.569548, 0, 0.682353, 1, 1,
0.1977245, 0.234458, 0.1625731, 0, 0.6745098, 1, 1,
0.2063331, 0.7298293, 0.4605733, 0, 0.6705883, 1, 1,
0.2139847, 2.766699, -1.536183, 0, 0.6627451, 1, 1,
0.2158419, -0.1443959, 2.79661, 0, 0.6588235, 1, 1,
0.2168336, 0.2954487, 2.071533, 0, 0.6509804, 1, 1,
0.2199322, 0.5872319, 0.06336866, 0, 0.6470588, 1, 1,
0.2213349, 0.2244965, 1.065275, 0, 0.6392157, 1, 1,
0.2250083, -0.6589085, 3.060088, 0, 0.6352941, 1, 1,
0.225479, 1.198231, 0.4036552, 0, 0.627451, 1, 1,
0.225577, 1.959063, 1.787715, 0, 0.6235294, 1, 1,
0.2265653, -1.057593, 3.219755, 0, 0.6156863, 1, 1,
0.2275123, -1.3812, 4.887408, 0, 0.6117647, 1, 1,
0.2299781, -2.924061, 3.269835, 0, 0.6039216, 1, 1,
0.2374422, 0.4464018, 1.853029, 0, 0.5960785, 1, 1,
0.2403784, -0.1407292, 2.997338, 0, 0.5921569, 1, 1,
0.2404714, -0.4360065, 1.620659, 0, 0.5843138, 1, 1,
0.2409609, -0.6938927, 2.515634, 0, 0.5803922, 1, 1,
0.2430984, 0.1010402, 0.3390342, 0, 0.572549, 1, 1,
0.2458124, 0.7119167, 0.8543018, 0, 0.5686275, 1, 1,
0.2459456, -1.19874, 1.347831, 0, 0.5607843, 1, 1,
0.2514104, 0.03354989, 1.142879, 0, 0.5568628, 1, 1,
0.2522576, -0.5908659, 0.9860266, 0, 0.5490196, 1, 1,
0.2545518, -0.05620138, 2.055714, 0, 0.5450981, 1, 1,
0.2597884, 0.03813931, 1.023762, 0, 0.5372549, 1, 1,
0.2613862, -1.097273, 3.501446, 0, 0.5333334, 1, 1,
0.2640277, -0.6943857, 2.159233, 0, 0.5254902, 1, 1,
0.2692925, 1.01131, 0.5804965, 0, 0.5215687, 1, 1,
0.2723969, 0.04453661, 2.767828, 0, 0.5137255, 1, 1,
0.2774446, -1.672541, 3.899779, 0, 0.509804, 1, 1,
0.2816806, -0.4306605, 3.528192, 0, 0.5019608, 1, 1,
0.282854, 0.6740462, 1.567791, 0, 0.4941176, 1, 1,
0.2845208, -1.6464, 2.460903, 0, 0.4901961, 1, 1,
0.2854463, -1.180322, 0.1783299, 0, 0.4823529, 1, 1,
0.2876056, 0.6765321, 0.7450128, 0, 0.4784314, 1, 1,
0.288296, -1.43068, 3.354076, 0, 0.4705882, 1, 1,
0.2893254, 0.5434928, 2.109735, 0, 0.4666667, 1, 1,
0.2925727, -0.9935933, 3.210828, 0, 0.4588235, 1, 1,
0.3049806, 0.8151867, -1.236766, 0, 0.454902, 1, 1,
0.3066832, -1.133858, 1.269054, 0, 0.4470588, 1, 1,
0.3094158, -0.5286344, 1.952525, 0, 0.4431373, 1, 1,
0.3159892, 1.024847, -0.9241939, 0, 0.4352941, 1, 1,
0.3247366, -1.083762, 3.043502, 0, 0.4313726, 1, 1,
0.3266469, -1.833733, 4.371418, 0, 0.4235294, 1, 1,
0.3278813, 0.1909015, 1.112142, 0, 0.4196078, 1, 1,
0.3283964, -1.304524, 3.563329, 0, 0.4117647, 1, 1,
0.3286813, 0.05236755, 2.141647, 0, 0.4078431, 1, 1,
0.3297975, -0.2346811, 4.843795, 0, 0.4, 1, 1,
0.3388679, 0.9523067, -0.8781757, 0, 0.3921569, 1, 1,
0.3390312, -1.821317, 3.134229, 0, 0.3882353, 1, 1,
0.3407333, 1.932704, -1.351363, 0, 0.3803922, 1, 1,
0.3409115, -0.3697973, 2.729963, 0, 0.3764706, 1, 1,
0.3422132, 0.2849812, 0.4856147, 0, 0.3686275, 1, 1,
0.3423432, -0.1584551, 2.320838, 0, 0.3647059, 1, 1,
0.3427381, -2.406914, 2.621266, 0, 0.3568628, 1, 1,
0.3446738, 0.113614, 0.6767337, 0, 0.3529412, 1, 1,
0.353639, 0.02773293, 3.268373, 0, 0.345098, 1, 1,
0.3573388, 1.688185, 0.3041699, 0, 0.3411765, 1, 1,
0.3625069, 0.07290145, 0.3519724, 0, 0.3333333, 1, 1,
0.363359, -0.4659286, 2.739567, 0, 0.3294118, 1, 1,
0.3636048, 1.258563, 0.8406627, 0, 0.3215686, 1, 1,
0.3659489, -0.7344139, 4.405187, 0, 0.3176471, 1, 1,
0.3661065, 0.5264733, 1.068927, 0, 0.3098039, 1, 1,
0.370214, -0.758921, 3.908521, 0, 0.3058824, 1, 1,
0.3732566, -0.1398987, 2.637, 0, 0.2980392, 1, 1,
0.3790878, 2.387087, 0.7589296, 0, 0.2901961, 1, 1,
0.3805314, 0.6630411, 0.715672, 0, 0.2862745, 1, 1,
0.3826936, -1.231971, 3.435228, 0, 0.2784314, 1, 1,
0.3828416, 0.8193849, 0.4159485, 0, 0.2745098, 1, 1,
0.3899522, -1.23244, 3.864036, 0, 0.2666667, 1, 1,
0.392362, 0.6883451, -1.003305, 0, 0.2627451, 1, 1,
0.3937709, -0.3003824, 2.992559, 0, 0.254902, 1, 1,
0.3969035, 0.9552345, 0.1495061, 0, 0.2509804, 1, 1,
0.3973149, 0.3186508, -0.4940424, 0, 0.2431373, 1, 1,
0.400723, 1.649694, 0.5633389, 0, 0.2392157, 1, 1,
0.4043459, 0.1535421, 2.62832, 0, 0.2313726, 1, 1,
0.4067775, -2.286919, 4.313541, 0, 0.227451, 1, 1,
0.4070686, -1.137022, 3.582184, 0, 0.2196078, 1, 1,
0.4071493, 2.245016, 1.340528, 0, 0.2156863, 1, 1,
0.4210247, 1.421818, 0.4643872, 0, 0.2078431, 1, 1,
0.4224808, 1.181871, -0.1557903, 0, 0.2039216, 1, 1,
0.4259928, 0.1623189, 2.422734, 0, 0.1960784, 1, 1,
0.4283673, 0.02547211, 2.101479, 0, 0.1882353, 1, 1,
0.4368984, 1.711887, -0.5833354, 0, 0.1843137, 1, 1,
0.4405692, -0.4776808, 1.726722, 0, 0.1764706, 1, 1,
0.4418471, -0.3348376, 2.338424, 0, 0.172549, 1, 1,
0.4429158, -0.3659364, 2.616785, 0, 0.1647059, 1, 1,
0.4492204, -0.4352232, 5.349944, 0, 0.1607843, 1, 1,
0.4499204, 1.804165, 0.7040517, 0, 0.1529412, 1, 1,
0.4504304, -0.1916778, 2.174533, 0, 0.1490196, 1, 1,
0.4519092, 1.262447, -0.5600711, 0, 0.1411765, 1, 1,
0.4543078, 0.4795127, 0.5867144, 0, 0.1372549, 1, 1,
0.4555193, -0.1962631, 1.855737, 0, 0.1294118, 1, 1,
0.4562439, 1.205111, 0.6138345, 0, 0.1254902, 1, 1,
0.4578007, -0.2390759, 3.027037, 0, 0.1176471, 1, 1,
0.4591662, 0.5189623, 2.045125, 0, 0.1137255, 1, 1,
0.4634053, 1.29857, 2.123352, 0, 0.1058824, 1, 1,
0.4654501, 1.796961, -0.129987, 0, 0.09803922, 1, 1,
0.4674336, 2.063464, 0.3449445, 0, 0.09411765, 1, 1,
0.4703948, 0.6958988, 0.5559236, 0, 0.08627451, 1, 1,
0.4743053, -1.103442, 4.255789, 0, 0.08235294, 1, 1,
0.4867573, 0.2869818, 0.7566144, 0, 0.07450981, 1, 1,
0.4933229, 0.8519782, 0.8386261, 0, 0.07058824, 1, 1,
0.4934, 0.7665575, 0.5364023, 0, 0.0627451, 1, 1,
0.4955634, 0.1032084, 1.746885, 0, 0.05882353, 1, 1,
0.4978253, -0.8256397, 1.209908, 0, 0.05098039, 1, 1,
0.4980353, 1.269511, 0.1390001, 0, 0.04705882, 1, 1,
0.500005, -0.1252311, 3.470529, 0, 0.03921569, 1, 1,
0.5000649, -0.2355929, 1.720604, 0, 0.03529412, 1, 1,
0.5163482, -2.514988, 1.941197, 0, 0.02745098, 1, 1,
0.5165303, -0.6141402, 2.392109, 0, 0.02352941, 1, 1,
0.5191596, -0.7557976, 3.297562, 0, 0.01568628, 1, 1,
0.5196747, -0.03787045, 2.511672, 0, 0.01176471, 1, 1,
0.5216857, 0.2834311, -0.3027707, 0, 0.003921569, 1, 1,
0.5237928, -0.02597077, 1.903533, 0.003921569, 0, 1, 1,
0.5242441, -0.05328061, 1.068318, 0.007843138, 0, 1, 1,
0.5243506, 0.6452929, 0.4982592, 0.01568628, 0, 1, 1,
0.525456, -0.4945473, 0.6859471, 0.01960784, 0, 1, 1,
0.5262684, -0.8563688, 3.149781, 0.02745098, 0, 1, 1,
0.5307705, -1.377026, 3.943033, 0.03137255, 0, 1, 1,
0.536071, 1.01008, 0.5695467, 0.03921569, 0, 1, 1,
0.5419818, -1.135424, 0.9995183, 0.04313726, 0, 1, 1,
0.543918, -0.02733859, 2.178529, 0.05098039, 0, 1, 1,
0.5548072, -0.4493639, 1.96292, 0.05490196, 0, 1, 1,
0.5562671, -0.2030717, 1.952854, 0.0627451, 0, 1, 1,
0.5576709, 0.04490066, 1.530497, 0.06666667, 0, 1, 1,
0.5598782, 1.446979, 0.6243882, 0.07450981, 0, 1, 1,
0.5612395, -1.241623, 2.9827, 0.07843138, 0, 1, 1,
0.5622585, -0.9065064, 2.860217, 0.08627451, 0, 1, 1,
0.5702304, -1.637627, 2.213692, 0.09019608, 0, 1, 1,
0.5726006, 0.3146429, 1.128595, 0.09803922, 0, 1, 1,
0.5728274, 0.742956, 1.409504, 0.1058824, 0, 1, 1,
0.5802496, -1.84779, 2.779391, 0.1098039, 0, 1, 1,
0.5833656, -0.645483, 3.572231, 0.1176471, 0, 1, 1,
0.5858217, -0.7371358, 3.277614, 0.1215686, 0, 1, 1,
0.5879928, -0.8409211, 4.269328, 0.1294118, 0, 1, 1,
0.5881595, 1.023975, 2.45812, 0.1333333, 0, 1, 1,
0.5951095, -0.7804108, 2.756237, 0.1411765, 0, 1, 1,
0.5954698, -1.536459, 3.49145, 0.145098, 0, 1, 1,
0.598586, -0.7345336, 1.475558, 0.1529412, 0, 1, 1,
0.6038512, 1.306417, -0.2005036, 0.1568628, 0, 1, 1,
0.604542, 0.540873, 0.1821991, 0.1647059, 0, 1, 1,
0.604847, 0.1546342, 0.1230841, 0.1686275, 0, 1, 1,
0.6059164, -0.8231732, 2.288261, 0.1764706, 0, 1, 1,
0.6059853, 0.2027803, 1.595711, 0.1803922, 0, 1, 1,
0.6092726, -1.162129, 0.9888704, 0.1882353, 0, 1, 1,
0.6117448, 0.2023665, 1.018129, 0.1921569, 0, 1, 1,
0.6163679, -0.465345, 1.137328, 0.2, 0, 1, 1,
0.6227393, -0.9144989, 2.249553, 0.2078431, 0, 1, 1,
0.6306949, -1.014099, 1.503276, 0.2117647, 0, 1, 1,
0.6314907, -2.407553, 3.747349, 0.2196078, 0, 1, 1,
0.6380318, 0.4971628, 2.834093, 0.2235294, 0, 1, 1,
0.6403205, 0.07304792, 1.037767, 0.2313726, 0, 1, 1,
0.6418071, -0.1853253, 1.681655, 0.2352941, 0, 1, 1,
0.6456781, -2.634619, 2.829815, 0.2431373, 0, 1, 1,
0.6465511, 0.06869107, 2.569463, 0.2470588, 0, 1, 1,
0.6486652, 0.4587466, 2.694802, 0.254902, 0, 1, 1,
0.6497567, 0.3621728, 1.600599, 0.2588235, 0, 1, 1,
0.6534088, -0.5594255, 2.732481, 0.2666667, 0, 1, 1,
0.6579431, 1.698163, 0.7344974, 0.2705882, 0, 1, 1,
0.6614187, -0.1430935, 3.864469, 0.2784314, 0, 1, 1,
0.6616662, 1.239877, 0.9701031, 0.282353, 0, 1, 1,
0.6638076, -1.473789, 2.603729, 0.2901961, 0, 1, 1,
0.6680322, 0.9620395, -1.238619, 0.2941177, 0, 1, 1,
0.6709372, 0.3011169, 0.576144, 0.3019608, 0, 1, 1,
0.6728095, 1.66897, 0.7619311, 0.3098039, 0, 1, 1,
0.6731105, -0.3579206, 3.197622, 0.3137255, 0, 1, 1,
0.6733111, 0.8358529, -0.5429772, 0.3215686, 0, 1, 1,
0.6749318, -0.4806632, 3.960463, 0.3254902, 0, 1, 1,
0.679785, 1.255354, -0.2271215, 0.3333333, 0, 1, 1,
0.6853703, -0.02839129, 0.7884307, 0.3372549, 0, 1, 1,
0.6856554, -0.7720682, 2.067003, 0.345098, 0, 1, 1,
0.6911026, -1.131458, 3.214034, 0.3490196, 0, 1, 1,
0.6913858, -0.1921057, 1.83311, 0.3568628, 0, 1, 1,
0.6941532, 0.8234832, -1.686388, 0.3607843, 0, 1, 1,
0.6943069, -0.7696862, 2.616938, 0.3686275, 0, 1, 1,
0.6996723, 0.2441149, 0.2634086, 0.372549, 0, 1, 1,
0.7018024, 1.12695, 0.7184125, 0.3803922, 0, 1, 1,
0.7026174, -0.2392526, 2.468376, 0.3843137, 0, 1, 1,
0.7029273, 0.7466525, 1.914295, 0.3921569, 0, 1, 1,
0.7040941, -0.699834, 1.011207, 0.3960784, 0, 1, 1,
0.7043295, -0.7898145, 2.31812, 0.4039216, 0, 1, 1,
0.706145, 0.6056811, 0.7364297, 0.4117647, 0, 1, 1,
0.7093096, -0.2190268, 0.8920742, 0.4156863, 0, 1, 1,
0.7127236, 0.03657357, 1.908985, 0.4235294, 0, 1, 1,
0.7132015, -1.006207, 3.560578, 0.427451, 0, 1, 1,
0.7132427, 0.4045812, 2.77479, 0.4352941, 0, 1, 1,
0.7154322, 2.048448, 0.3566223, 0.4392157, 0, 1, 1,
0.7158206, -0.9134912, 1.339065, 0.4470588, 0, 1, 1,
0.7224827, -0.113294, 0.6383613, 0.4509804, 0, 1, 1,
0.7232423, -0.9448574, 2.312806, 0.4588235, 0, 1, 1,
0.7257793, -1.509795, 2.638053, 0.4627451, 0, 1, 1,
0.7299623, -1.065219, 2.429618, 0.4705882, 0, 1, 1,
0.7327176, -0.4623716, 1.394648, 0.4745098, 0, 1, 1,
0.7329407, 0.7369585, 1.292843, 0.4823529, 0, 1, 1,
0.7387555, 1.230259, -0.1878041, 0.4862745, 0, 1, 1,
0.7415537, 0.8727137, 0.7819287, 0.4941176, 0, 1, 1,
0.7415733, 0.4314154, 2.089135, 0.5019608, 0, 1, 1,
0.7430657, 0.7868435, -0.3259321, 0.5058824, 0, 1, 1,
0.7434397, -0.3773884, 0.3992501, 0.5137255, 0, 1, 1,
0.7443745, -0.1251343, 2.812186, 0.5176471, 0, 1, 1,
0.7460417, 1.027142, 0.7184865, 0.5254902, 0, 1, 1,
0.7463382, -1.382714, 2.479753, 0.5294118, 0, 1, 1,
0.7496623, 2.663005, 1.523766, 0.5372549, 0, 1, 1,
0.7517446, -1.885242, 3.292876, 0.5411765, 0, 1, 1,
0.7565321, -0.7147031, 3.193349, 0.5490196, 0, 1, 1,
0.7569553, 1.146618, 0.2808493, 0.5529412, 0, 1, 1,
0.7592304, 0.9836115, 0.4907443, 0.5607843, 0, 1, 1,
0.762198, 0.6035659, 0.9720422, 0.5647059, 0, 1, 1,
0.762542, 0.04088105, 1.440714, 0.572549, 0, 1, 1,
0.7626125, -0.9154897, 2.465217, 0.5764706, 0, 1, 1,
0.7645166, -0.06626122, 0.9510123, 0.5843138, 0, 1, 1,
0.7665538, 0.863274, 2.120485, 0.5882353, 0, 1, 1,
0.7666775, -0.5889163, 2.699421, 0.5960785, 0, 1, 1,
0.7673815, -0.8046373, 2.161001, 0.6039216, 0, 1, 1,
0.7679831, 1.650039, -0.95384, 0.6078432, 0, 1, 1,
0.7721021, -0.0289766, 0.857478, 0.6156863, 0, 1, 1,
0.77271, -0.8151554, 1.817147, 0.6196079, 0, 1, 1,
0.7765728, 0.1236607, 1.521293, 0.627451, 0, 1, 1,
0.7810931, -0.2984775, 2.076922, 0.6313726, 0, 1, 1,
0.7880927, 0.04771125, 0.8399609, 0.6392157, 0, 1, 1,
0.7889533, 1.027515, -0.4903104, 0.6431373, 0, 1, 1,
0.7939847, -1.237171, 2.561921, 0.6509804, 0, 1, 1,
0.7981166, -0.2052709, 0.2938069, 0.654902, 0, 1, 1,
0.7999043, 0.4806313, 0.6749313, 0.6627451, 0, 1, 1,
0.8057275, 0.1823366, 0.5875335, 0.6666667, 0, 1, 1,
0.8078583, 0.9445007, 0.7000735, 0.6745098, 0, 1, 1,
0.8088192, -1.355884, 3.919524, 0.6784314, 0, 1, 1,
0.8148273, -0.3366099, 3.899263, 0.6862745, 0, 1, 1,
0.8164541, 1.020835, -1.362688, 0.6901961, 0, 1, 1,
0.8176234, -1.193021, 1.804359, 0.6980392, 0, 1, 1,
0.8181065, -1.656718, 3.967255, 0.7058824, 0, 1, 1,
0.8208591, 0.1050811, 2.019415, 0.7098039, 0, 1, 1,
0.8236908, -0.4839935, 2.045911, 0.7176471, 0, 1, 1,
0.8363775, 2.105756, 1.028361, 0.7215686, 0, 1, 1,
0.8368598, 0.4765196, 2.960954, 0.7294118, 0, 1, 1,
0.8390453, -0.1523039, 1.382434, 0.7333333, 0, 1, 1,
0.8455921, 0.6574516, 2.401677, 0.7411765, 0, 1, 1,
0.8474817, -1.489024, 1.688843, 0.7450981, 0, 1, 1,
0.8514827, 0.4092406, 1.755057, 0.7529412, 0, 1, 1,
0.853796, -1.17657, 2.703343, 0.7568628, 0, 1, 1,
0.8552573, -1.953103, 3.550611, 0.7647059, 0, 1, 1,
0.8574257, 0.8031531, -0.1402635, 0.7686275, 0, 1, 1,
0.8583539, -0.1029077, 0.9413644, 0.7764706, 0, 1, 1,
0.8677285, 1.010774, 0.06569311, 0.7803922, 0, 1, 1,
0.8709007, 0.4315946, 1.020092, 0.7882353, 0, 1, 1,
0.8711807, 1.00681, 2.539466, 0.7921569, 0, 1, 1,
0.8714055, 1.062016, 2.335527, 0.8, 0, 1, 1,
0.8731479, -0.4034813, 1.268541, 0.8078431, 0, 1, 1,
0.8746346, -1.03072, 3.053719, 0.8117647, 0, 1, 1,
0.8792582, 0.3638038, -0.1060424, 0.8196079, 0, 1, 1,
0.8825008, 0.4147707, 0.3661126, 0.8235294, 0, 1, 1,
0.8844659, 0.613589, 1.794422, 0.8313726, 0, 1, 1,
0.8908554, -1.314174, 1.74983, 0.8352941, 0, 1, 1,
0.8941134, 0.5883158, 1.218759, 0.8431373, 0, 1, 1,
0.8945196, -0.8897904, 2.679733, 0.8470588, 0, 1, 1,
0.9102542, -0.7629267, 2.325031, 0.854902, 0, 1, 1,
0.9138059, 1.164537, 0.3310604, 0.8588235, 0, 1, 1,
0.9197128, 1.737348, 0.8177466, 0.8666667, 0, 1, 1,
0.9197537, 0.4348562, -0.04197802, 0.8705882, 0, 1, 1,
0.923539, 1.133004, 0.405749, 0.8784314, 0, 1, 1,
0.9237717, 0.2620607, 2.405444, 0.8823529, 0, 1, 1,
0.923803, -0.3539303, 0.2252817, 0.8901961, 0, 1, 1,
0.9249317, -0.7574869, 1.614653, 0.8941177, 0, 1, 1,
0.9433345, 0.9789817, 0.3219805, 0.9019608, 0, 1, 1,
0.9454018, -1.063711, 2.02645, 0.9098039, 0, 1, 1,
0.9517087, 1.152928, 0.6275147, 0.9137255, 0, 1, 1,
0.9518711, 0.3922529, 0.7362087, 0.9215686, 0, 1, 1,
0.9524885, -1.292661, 4.09274, 0.9254902, 0, 1, 1,
0.9531111, -0.08989965, 2.201379, 0.9333333, 0, 1, 1,
0.9551725, 0.3954986, 1.577613, 0.9372549, 0, 1, 1,
0.963475, 0.2940869, 2.712679, 0.945098, 0, 1, 1,
0.9648096, 0.0139308, 2.286226, 0.9490196, 0, 1, 1,
0.977657, 0.6298155, 0.4679381, 0.9568627, 0, 1, 1,
0.9778903, -0.7215193, 3.833534, 0.9607843, 0, 1, 1,
0.9794046, -0.0635698, 2.334405, 0.9686275, 0, 1, 1,
0.9898809, -0.6566494, 2.260769, 0.972549, 0, 1, 1,
0.9900045, -0.3626675, 1.592192, 0.9803922, 0, 1, 1,
0.9926094, 1.27853, 0.8384868, 0.9843137, 0, 1, 1,
0.9929234, 0.4932146, 2.548595, 0.9921569, 0, 1, 1,
0.9937945, 0.7518438, -0.008753981, 0.9960784, 0, 1, 1,
0.9979206, -0.4634228, 4.173044, 1, 0, 0.9960784, 1,
1.001176, -0.8953442, 2.76067, 1, 0, 0.9882353, 1,
1.010138, 0.2532562, 0.9450753, 1, 0, 0.9843137, 1,
1.013033, 0.7175918, 1.174426, 1, 0, 0.9764706, 1,
1.019916, 0.5839494, 0.6389076, 1, 0, 0.972549, 1,
1.021902, -1.202912, 0.8138667, 1, 0, 0.9647059, 1,
1.023765, 0.7527047, 1.445993, 1, 0, 0.9607843, 1,
1.025389, -0.08735213, 1.165801, 1, 0, 0.9529412, 1,
1.028291, 0.2210515, 1.599377, 1, 0, 0.9490196, 1,
1.031398, 1.026345, -0.941236, 1, 0, 0.9411765, 1,
1.036127, 1.012371, 0.8645363, 1, 0, 0.9372549, 1,
1.036574, -0.5193368, 4.058316, 1, 0, 0.9294118, 1,
1.039494, 0.05198288, 1.171813, 1, 0, 0.9254902, 1,
1.041477, -1.598769, 4.178204, 1, 0, 0.9176471, 1,
1.043258, -0.5195246, 2.291685, 1, 0, 0.9137255, 1,
1.050644, 0.8450785, 0.3835831, 1, 0, 0.9058824, 1,
1.052132, -0.04428596, 2.286221, 1, 0, 0.9019608, 1,
1.06114, -0.1670267, -0.3437321, 1, 0, 0.8941177, 1,
1.062558, 0.8366296, 1.322567, 1, 0, 0.8862745, 1,
1.0637, -0.5337699, 2.73191, 1, 0, 0.8823529, 1,
1.072353, -1.455322, 3.441628, 1, 0, 0.8745098, 1,
1.085915, 0.833239, -1.676713, 1, 0, 0.8705882, 1,
1.093468, -2.670373, 2.288546, 1, 0, 0.8627451, 1,
1.094359, 0.1802358, 3.502757, 1, 0, 0.8588235, 1,
1.097998, -0.9632206, 4.246653, 1, 0, 0.8509804, 1,
1.101028, 0.1702417, 0.5509998, 1, 0, 0.8470588, 1,
1.110974, 1.013961, -0.4562886, 1, 0, 0.8392157, 1,
1.116245, -2.615462, 2.948107, 1, 0, 0.8352941, 1,
1.126985, 0.05176004, 1.314076, 1, 0, 0.827451, 1,
1.129949, 0.3839528, 2.199261, 1, 0, 0.8235294, 1,
1.134535, -0.06741058, 0.9205424, 1, 0, 0.8156863, 1,
1.134987, 0.9189546, 1.7182, 1, 0, 0.8117647, 1,
1.14892, -0.2543888, 0.1357564, 1, 0, 0.8039216, 1,
1.150574, -0.6157047, 2.272543, 1, 0, 0.7960784, 1,
1.156026, 0.6185703, 1.641308, 1, 0, 0.7921569, 1,
1.16163, -0.2836583, 2.523796, 1, 0, 0.7843137, 1,
1.164881, -0.919699, 1.98761, 1, 0, 0.7803922, 1,
1.167844, 0.8386523, 0.4766274, 1, 0, 0.772549, 1,
1.188071, -0.120831, 2.439707, 1, 0, 0.7686275, 1,
1.189805, 1.269816, -0.05056847, 1, 0, 0.7607843, 1,
1.191942, 1.399425, -1.194675, 1, 0, 0.7568628, 1,
1.194369, -1.214892, -0.6788403, 1, 0, 0.7490196, 1,
1.195562, 0.2588982, -0.4600744, 1, 0, 0.7450981, 1,
1.196819, -0.7999949, 3.136608, 1, 0, 0.7372549, 1,
1.19719, -1.456843, 3.187685, 1, 0, 0.7333333, 1,
1.203348, 2.188891, 1.270934, 1, 0, 0.7254902, 1,
1.212854, -0.8484817, 2.328236, 1, 0, 0.7215686, 1,
1.216904, 0.5961787, -0.3118808, 1, 0, 0.7137255, 1,
1.228435, 0.003205696, 0.7713066, 1, 0, 0.7098039, 1,
1.23234, 0.8613048, 0.08272167, 1, 0, 0.7019608, 1,
1.233321, -0.9298054, 2.885765, 1, 0, 0.6941177, 1,
1.237267, -0.2911419, 1.388921, 1, 0, 0.6901961, 1,
1.244271, -0.4605114, 1.486542, 1, 0, 0.682353, 1,
1.251512, 0.09733483, 2.308596, 1, 0, 0.6784314, 1,
1.255654, 0.3462982, 1.680979, 1, 0, 0.6705883, 1,
1.25807, 0.2540813, 0.9233197, 1, 0, 0.6666667, 1,
1.260533, 0.1066808, 1.664829, 1, 0, 0.6588235, 1,
1.263144, 0.1150122, 2.074732, 1, 0, 0.654902, 1,
1.272583, 0.724445, 0.779422, 1, 0, 0.6470588, 1,
1.272694, -0.8945686, 1.802087, 1, 0, 0.6431373, 1,
1.277984, -1.99707, 3.37731, 1, 0, 0.6352941, 1,
1.280548, 0.5726253, 1.665792, 1, 0, 0.6313726, 1,
1.282681, -2.305166, 3.024493, 1, 0, 0.6235294, 1,
1.292434, 0.1294385, 1.438513, 1, 0, 0.6196079, 1,
1.293685, 0.9747086, -0.1709518, 1, 0, 0.6117647, 1,
1.297045, -0.9913242, 3.12885, 1, 0, 0.6078432, 1,
1.301502, 0.3272309, 1.647204, 1, 0, 0.6, 1,
1.304231, -1.698526, 1.586227, 1, 0, 0.5921569, 1,
1.317271, -0.2355934, 2.679812, 1, 0, 0.5882353, 1,
1.320877, -0.2068671, -0.9674, 1, 0, 0.5803922, 1,
1.323063, 1.807593, 1.34812, 1, 0, 0.5764706, 1,
1.334634, 0.7242694, 0.3164075, 1, 0, 0.5686275, 1,
1.335326, 0.5020492, 2.190339, 1, 0, 0.5647059, 1,
1.336061, 0.07172116, 1.082737, 1, 0, 0.5568628, 1,
1.347606, 0.4165781, 3.42717, 1, 0, 0.5529412, 1,
1.375907, -0.167711, 1.194719, 1, 0, 0.5450981, 1,
1.387455, 0.2272384, 0.4497183, 1, 0, 0.5411765, 1,
1.399943, -0.1994353, -0.3086174, 1, 0, 0.5333334, 1,
1.40517, 0.1564949, -0.8748185, 1, 0, 0.5294118, 1,
1.408206, -1.141444, 0.1614033, 1, 0, 0.5215687, 1,
1.408378, -1.397833, 2.125925, 1, 0, 0.5176471, 1,
1.424065, -1.627697, 3.845354, 1, 0, 0.509804, 1,
1.431829, 0.4180187, 0.01490299, 1, 0, 0.5058824, 1,
1.435312, -0.3494453, 0.5737174, 1, 0, 0.4980392, 1,
1.444246, -0.982423, 1.441206, 1, 0, 0.4901961, 1,
1.444405, 0.7739926, 0.4822991, 1, 0, 0.4862745, 1,
1.446093, -0.6386597, 1.91506, 1, 0, 0.4784314, 1,
1.452235, 1.040371, 0.7445296, 1, 0, 0.4745098, 1,
1.452605, 0.2035707, 1.643889, 1, 0, 0.4666667, 1,
1.456085, -0.03805643, 2.44591, 1, 0, 0.4627451, 1,
1.456163, 0.214406, 0.4839346, 1, 0, 0.454902, 1,
1.457545, -1.289222, 3.439659, 1, 0, 0.4509804, 1,
1.459746, -0.7862586, 2.93885, 1, 0, 0.4431373, 1,
1.459904, -1.632084, 2.919553, 1, 0, 0.4392157, 1,
1.461001, 0.1355755, 0.6923721, 1, 0, 0.4313726, 1,
1.473786, -0.3276271, 1.93435, 1, 0, 0.427451, 1,
1.477093, 0.6163371, 3.450865, 1, 0, 0.4196078, 1,
1.483329, 1.596171, 0.9862188, 1, 0, 0.4156863, 1,
1.486319, -0.5767828, 2.03062, 1, 0, 0.4078431, 1,
1.495513, -1.14358, 0.7238864, 1, 0, 0.4039216, 1,
1.530482, 0.5564597, 0.3571291, 1, 0, 0.3960784, 1,
1.533522, -0.6647248, 1.391323, 1, 0, 0.3882353, 1,
1.546237, -0.02514066, 3.12422, 1, 0, 0.3843137, 1,
1.546851, -0.6245334, 1.904976, 1, 0, 0.3764706, 1,
1.55602, -1.466702, 2.9557, 1, 0, 0.372549, 1,
1.566372, -0.6233372, 3.433197, 1, 0, 0.3647059, 1,
1.572354, 0.1268618, 1.718907, 1, 0, 0.3607843, 1,
1.576065, -0.05970454, 3.589427, 1, 0, 0.3529412, 1,
1.58345, -0.08264951, 1.247867, 1, 0, 0.3490196, 1,
1.585278, 2.457619, -0.614346, 1, 0, 0.3411765, 1,
1.585772, -0.1549913, 2.051017, 1, 0, 0.3372549, 1,
1.597849, 0.01413304, -0.1561175, 1, 0, 0.3294118, 1,
1.602448, 0.373839, 2.297338, 1, 0, 0.3254902, 1,
1.602647, -0.4495685, 2.131024, 1, 0, 0.3176471, 1,
1.609461, -1.582285, 0.7627027, 1, 0, 0.3137255, 1,
1.629879, -0.9905049, 3.190152, 1, 0, 0.3058824, 1,
1.630704, -1.357597, 3.158064, 1, 0, 0.2980392, 1,
1.640157, -0.02417047, 0.9870061, 1, 0, 0.2941177, 1,
1.658151, -0.8680999, 2.65053, 1, 0, 0.2862745, 1,
1.739611, -1.109485, 2.346405, 1, 0, 0.282353, 1,
1.744276, -1.150328, 0.957815, 1, 0, 0.2745098, 1,
1.756415, 0.005509451, 0.6995924, 1, 0, 0.2705882, 1,
1.763043, -0.1814315, 3.348638, 1, 0, 0.2627451, 1,
1.775092, 0.0807216, 1.492283, 1, 0, 0.2588235, 1,
1.806642, -0.8629356, 3.526377, 1, 0, 0.2509804, 1,
1.807336, 0.1857167, 2.137537, 1, 0, 0.2470588, 1,
1.829183, -1.142431, 0.8256566, 1, 0, 0.2392157, 1,
1.853546, 0.114725, 2.239779, 1, 0, 0.2352941, 1,
1.858168, 1.26179, -0.7604176, 1, 0, 0.227451, 1,
1.878127, -0.8076634, 2.087812, 1, 0, 0.2235294, 1,
1.884991, -0.5941188, 2.082625, 1, 0, 0.2156863, 1,
1.896261, 0.4362703, 0.08881366, 1, 0, 0.2117647, 1,
1.914239, -1.486213, 2.477633, 1, 0, 0.2039216, 1,
1.951998, -0.2948174, 1.387376, 1, 0, 0.1960784, 1,
1.952599, 1.174524, 0.8638322, 1, 0, 0.1921569, 1,
1.966748, 0.2765327, -0.1642314, 1, 0, 0.1843137, 1,
1.981232, 0.1930764, 0.2669551, 1, 0, 0.1803922, 1,
1.993724, -1.779824, 3.566612, 1, 0, 0.172549, 1,
2.007432, 0.06676985, -0.5424713, 1, 0, 0.1686275, 1,
2.046262, -0.6880774, 1.833618, 1, 0, 0.1607843, 1,
2.071485, -1.312219, 2.912517, 1, 0, 0.1568628, 1,
2.076123, -1.338519, 1.532764, 1, 0, 0.1490196, 1,
2.080042, -1.290245, 2.116121, 1, 0, 0.145098, 1,
2.08635, 0.3146308, 0.6764975, 1, 0, 0.1372549, 1,
2.089462, 0.4210226, 3.82355, 1, 0, 0.1333333, 1,
2.090856, 0.1118225, 0.2727815, 1, 0, 0.1254902, 1,
2.110251, 0.6582158, 1.050519, 1, 0, 0.1215686, 1,
2.127274, 0.3439631, 1.474012, 1, 0, 0.1137255, 1,
2.13448, 0.07016835, 3.287476, 1, 0, 0.1098039, 1,
2.141087, 0.3695758, 0.2044943, 1, 0, 0.1019608, 1,
2.215004, 0.5790584, 1.197408, 1, 0, 0.09411765, 1,
2.236196, 0.5624002, 0.8864234, 1, 0, 0.09019608, 1,
2.249246, -1.138402, 0.4234232, 1, 0, 0.08235294, 1,
2.272982, 0.5314687, 1.611002, 1, 0, 0.07843138, 1,
2.3273, 1.001778, 1.884751, 1, 0, 0.07058824, 1,
2.355876, -1.882074, 1.918326, 1, 0, 0.06666667, 1,
2.367264, 1.284552, 0.378511, 1, 0, 0.05882353, 1,
2.524008, 1.303364, 1.532185, 1, 0, 0.05490196, 1,
2.537604, -0.2475314, -0.05529891, 1, 0, 0.04705882, 1,
2.573129, -1.25341, 2.179868, 1, 0, 0.04313726, 1,
2.595825, 0.257027, 0.7966418, 1, 0, 0.03529412, 1,
2.681752, -0.524868, 1.670239, 1, 0, 0.03137255, 1,
2.687675, -1.667176, 4.068233, 1, 0, 0.02352941, 1,
2.746702, -0.1412866, 1.932936, 1, 0, 0.01960784, 1,
3.006255, 1.281987, 0.7219672, 1, 0, 0.01176471, 1,
3.315555, -0.09282725, 1.727896, 1, 0, 0.007843138, 1
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
0.2083379, -3.932055, -6.469602, 0, -0.5, 0.5, 0.5,
0.2083379, -3.932055, -6.469602, 1, -0.5, 0.5, 0.5,
0.2083379, -3.932055, -6.469602, 1, 1.5, 0.5, 0.5,
0.2083379, -3.932055, -6.469602, 0, 1.5, 0.5, 0.5
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
-3.952226, 0.04937339, -6.469602, 0, -0.5, 0.5, 0.5,
-3.952226, 0.04937339, -6.469602, 1, -0.5, 0.5, 0.5,
-3.952226, 0.04937339, -6.469602, 1, 1.5, 0.5, 0.5,
-3.952226, 0.04937339, -6.469602, 0, 1.5, 0.5, 0.5
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
-3.952226, -3.932055, 0.2966962, 0, -0.5, 0.5, 0.5,
-3.952226, -3.932055, 0.2966962, 1, -0.5, 0.5, 0.5,
-3.952226, -3.932055, 0.2966962, 1, 1.5, 0.5, 0.5,
-3.952226, -3.932055, 0.2966962, 0, 1.5, 0.5, 0.5
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
-2, -3.013264, -4.908149,
3, -3.013264, -4.908149,
-2, -3.013264, -4.908149,
-2, -3.166396, -5.168391,
-1, -3.013264, -4.908149,
-1, -3.166396, -5.168391,
0, -3.013264, -4.908149,
0, -3.166396, -5.168391,
1, -3.013264, -4.908149,
1, -3.166396, -5.168391,
2, -3.013264, -4.908149,
2, -3.166396, -5.168391,
3, -3.013264, -4.908149,
3, -3.166396, -5.168391
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
-2, -3.472659, -5.688875, 0, -0.5, 0.5, 0.5,
-2, -3.472659, -5.688875, 1, -0.5, 0.5, 0.5,
-2, -3.472659, -5.688875, 1, 1.5, 0.5, 0.5,
-2, -3.472659, -5.688875, 0, 1.5, 0.5, 0.5,
-1, -3.472659, -5.688875, 0, -0.5, 0.5, 0.5,
-1, -3.472659, -5.688875, 1, -0.5, 0.5, 0.5,
-1, -3.472659, -5.688875, 1, 1.5, 0.5, 0.5,
-1, -3.472659, -5.688875, 0, 1.5, 0.5, 0.5,
0, -3.472659, -5.688875, 0, -0.5, 0.5, 0.5,
0, -3.472659, -5.688875, 1, -0.5, 0.5, 0.5,
0, -3.472659, -5.688875, 1, 1.5, 0.5, 0.5,
0, -3.472659, -5.688875, 0, 1.5, 0.5, 0.5,
1, -3.472659, -5.688875, 0, -0.5, 0.5, 0.5,
1, -3.472659, -5.688875, 1, -0.5, 0.5, 0.5,
1, -3.472659, -5.688875, 1, 1.5, 0.5, 0.5,
1, -3.472659, -5.688875, 0, 1.5, 0.5, 0.5,
2, -3.472659, -5.688875, 0, -0.5, 0.5, 0.5,
2, -3.472659, -5.688875, 1, -0.5, 0.5, 0.5,
2, -3.472659, -5.688875, 1, 1.5, 0.5, 0.5,
2, -3.472659, -5.688875, 0, 1.5, 0.5, 0.5,
3, -3.472659, -5.688875, 0, -0.5, 0.5, 0.5,
3, -3.472659, -5.688875, 1, -0.5, 0.5, 0.5,
3, -3.472659, -5.688875, 1, 1.5, 0.5, 0.5,
3, -3.472659, -5.688875, 0, 1.5, 0.5, 0.5
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
-2.992096, -2, -4.908149,
-2.992096, 3, -4.908149,
-2.992096, -2, -4.908149,
-3.152118, -2, -5.168391,
-2.992096, -1, -4.908149,
-3.152118, -1, -5.168391,
-2.992096, 0, -4.908149,
-3.152118, 0, -5.168391,
-2.992096, 1, -4.908149,
-3.152118, 1, -5.168391,
-2.992096, 2, -4.908149,
-3.152118, 2, -5.168391,
-2.992096, 3, -4.908149,
-3.152118, 3, -5.168391
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
-3.472161, -2, -5.688875, 0, -0.5, 0.5, 0.5,
-3.472161, -2, -5.688875, 1, -0.5, 0.5, 0.5,
-3.472161, -2, -5.688875, 1, 1.5, 0.5, 0.5,
-3.472161, -2, -5.688875, 0, 1.5, 0.5, 0.5,
-3.472161, -1, -5.688875, 0, -0.5, 0.5, 0.5,
-3.472161, -1, -5.688875, 1, -0.5, 0.5, 0.5,
-3.472161, -1, -5.688875, 1, 1.5, 0.5, 0.5,
-3.472161, -1, -5.688875, 0, 1.5, 0.5, 0.5,
-3.472161, 0, -5.688875, 0, -0.5, 0.5, 0.5,
-3.472161, 0, -5.688875, 1, -0.5, 0.5, 0.5,
-3.472161, 0, -5.688875, 1, 1.5, 0.5, 0.5,
-3.472161, 0, -5.688875, 0, 1.5, 0.5, 0.5,
-3.472161, 1, -5.688875, 0, -0.5, 0.5, 0.5,
-3.472161, 1, -5.688875, 1, -0.5, 0.5, 0.5,
-3.472161, 1, -5.688875, 1, 1.5, 0.5, 0.5,
-3.472161, 1, -5.688875, 0, 1.5, 0.5, 0.5,
-3.472161, 2, -5.688875, 0, -0.5, 0.5, 0.5,
-3.472161, 2, -5.688875, 1, -0.5, 0.5, 0.5,
-3.472161, 2, -5.688875, 1, 1.5, 0.5, 0.5,
-3.472161, 2, -5.688875, 0, 1.5, 0.5, 0.5,
-3.472161, 3, -5.688875, 0, -0.5, 0.5, 0.5,
-3.472161, 3, -5.688875, 1, -0.5, 0.5, 0.5,
-3.472161, 3, -5.688875, 1, 1.5, 0.5, 0.5,
-3.472161, 3, -5.688875, 0, 1.5, 0.5, 0.5
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
-2.992096, -3.013264, -4,
-2.992096, -3.013264, 4,
-2.992096, -3.013264, -4,
-3.152118, -3.166396, -4,
-2.992096, -3.013264, -2,
-3.152118, -3.166396, -2,
-2.992096, -3.013264, 0,
-3.152118, -3.166396, 0,
-2.992096, -3.013264, 2,
-3.152118, -3.166396, 2,
-2.992096, -3.013264, 4,
-3.152118, -3.166396, 4
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
-3.472161, -3.472659, -4, 0, -0.5, 0.5, 0.5,
-3.472161, -3.472659, -4, 1, -0.5, 0.5, 0.5,
-3.472161, -3.472659, -4, 1, 1.5, 0.5, 0.5,
-3.472161, -3.472659, -4, 0, 1.5, 0.5, 0.5,
-3.472161, -3.472659, -2, 0, -0.5, 0.5, 0.5,
-3.472161, -3.472659, -2, 1, -0.5, 0.5, 0.5,
-3.472161, -3.472659, -2, 1, 1.5, 0.5, 0.5,
-3.472161, -3.472659, -2, 0, 1.5, 0.5, 0.5,
-3.472161, -3.472659, 0, 0, -0.5, 0.5, 0.5,
-3.472161, -3.472659, 0, 1, -0.5, 0.5, 0.5,
-3.472161, -3.472659, 0, 1, 1.5, 0.5, 0.5,
-3.472161, -3.472659, 0, 0, 1.5, 0.5, 0.5,
-3.472161, -3.472659, 2, 0, -0.5, 0.5, 0.5,
-3.472161, -3.472659, 2, 1, -0.5, 0.5, 0.5,
-3.472161, -3.472659, 2, 1, 1.5, 0.5, 0.5,
-3.472161, -3.472659, 2, 0, 1.5, 0.5, 0.5,
-3.472161, -3.472659, 4, 0, -0.5, 0.5, 0.5,
-3.472161, -3.472659, 4, 1, -0.5, 0.5, 0.5,
-3.472161, -3.472659, 4, 1, 1.5, 0.5, 0.5,
-3.472161, -3.472659, 4, 0, 1.5, 0.5, 0.5
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
-2.992096, -3.013264, -4.908149,
-2.992096, 3.112011, -4.908149,
-2.992096, -3.013264, 5.501541,
-2.992096, 3.112011, 5.501541,
-2.992096, -3.013264, -4.908149,
-2.992096, -3.013264, 5.501541,
-2.992096, 3.112011, -4.908149,
-2.992096, 3.112011, 5.501541,
-2.992096, -3.013264, -4.908149,
3.408772, -3.013264, -4.908149,
-2.992096, -3.013264, 5.501541,
3.408772, -3.013264, 5.501541,
-2.992096, 3.112011, -4.908149,
3.408772, 3.112011, -4.908149,
-2.992096, 3.112011, 5.501541,
3.408772, 3.112011, 5.501541,
3.408772, -3.013264, -4.908149,
3.408772, 3.112011, -4.908149,
3.408772, -3.013264, 5.501541,
3.408772, 3.112011, 5.501541,
3.408772, -3.013264, -4.908149,
3.408772, -3.013264, 5.501541,
3.408772, 3.112011, -4.908149,
3.408772, 3.112011, 5.501541
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
var radius = 7.299179;
var distance = 32.47487;
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
mvMatrix.translate( -0.2083379, -0.04937339, -0.2966962 );
mvMatrix.scale( 1.23296, 1.288435, 0.7581413 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.47487);
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
Tebufenpyrad<-read.table("Tebufenpyrad.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Tebufenpyrad$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tebufenpyrad' not found
```

```r
y<-Tebufenpyrad$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tebufenpyrad' not found
```

```r
z<-Tebufenpyrad$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tebufenpyrad' not found
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
-2.89888, -0.4578898, -0.7337322, 0, 0, 1, 1, 1,
-2.71226, 1.227322, -1.571723, 1, 0, 0, 1, 1,
-2.708603, 0.171352, -2.228942, 1, 0, 0, 1, 1,
-2.571359, -0.2131066, 1.010737, 1, 0, 0, 1, 1,
-2.558607, 0.8413718, -2.262857, 1, 0, 0, 1, 1,
-2.549178, -0.4010878, -1.883004, 1, 0, 0, 1, 1,
-2.507769, 0.1442827, 0.0839745, 0, 0, 0, 1, 1,
-2.502797, 0.8479199, -2.087556, 0, 0, 0, 1, 1,
-2.416243, -1.123176, -3.459135, 0, 0, 0, 1, 1,
-2.396363, 0.3494457, -1.052538, 0, 0, 0, 1, 1,
-2.375011, -0.02457327, -0.8625792, 0, 0, 0, 1, 1,
-2.365176, 1.087061, -2.085779, 0, 0, 0, 1, 1,
-2.338507, -0.3543384, -2.310851, 0, 0, 0, 1, 1,
-2.298792, -0.1830029, -3.188769, 1, 1, 1, 1, 1,
-2.267361, -0.6627452, -1.34931, 1, 1, 1, 1, 1,
-2.224257, 0.1819966, -1.921676, 1, 1, 1, 1, 1,
-2.215105, 1.108035, -2.437293, 1, 1, 1, 1, 1,
-2.166108, -0.8778034, -1.664206, 1, 1, 1, 1, 1,
-2.147365, 0.1881505, -1.087943, 1, 1, 1, 1, 1,
-2.144459, -0.3626238, -2.809924, 1, 1, 1, 1, 1,
-2.1349, 0.25466, -2.856346, 1, 1, 1, 1, 1,
-2.125284, -0.1079263, -1.583721, 1, 1, 1, 1, 1,
-2.107395, 0.1695752, -2.323148, 1, 1, 1, 1, 1,
-2.083139, -0.3480957, -1.438173, 1, 1, 1, 1, 1,
-2.081789, 0.06308731, -1.130447, 1, 1, 1, 1, 1,
-2.057324, 0.3728758, -0.6332405, 1, 1, 1, 1, 1,
-2.052645, 0.08003335, -3.125419, 1, 1, 1, 1, 1,
-2.040808, -0.06261086, -1.373948, 1, 1, 1, 1, 1,
-2.016754, 1.504775, -0.9506924, 0, 0, 1, 1, 1,
-1.97164, -1.412588, -2.366452, 1, 0, 0, 1, 1,
-1.947995, 0.1755649, -1.421348, 1, 0, 0, 1, 1,
-1.936263, 0.7559601, -2.821309, 1, 0, 0, 1, 1,
-1.930176, 0.02657951, -1.687726, 1, 0, 0, 1, 1,
-1.925347, 0.3853572, -1.826644, 1, 0, 0, 1, 1,
-1.917954, 1.102462, -0.6046426, 0, 0, 0, 1, 1,
-1.897887, 0.4658866, -2.928354, 0, 0, 0, 1, 1,
-1.891799, -1.261037, -2.628251, 0, 0, 0, 1, 1,
-1.860533, 1.512416, -1.885519, 0, 0, 0, 1, 1,
-1.831623, 0.01921346, -1.896363, 0, 0, 0, 1, 1,
-1.818871, -0.6946482, -2.459024, 0, 0, 0, 1, 1,
-1.796572, -2.077742, -1.184417, 0, 0, 0, 1, 1,
-1.77749, 0.06229701, -2.27694, 1, 1, 1, 1, 1,
-1.776174, 0.8091335, -2.341221, 1, 1, 1, 1, 1,
-1.767468, 1.614526, 0.7724513, 1, 1, 1, 1, 1,
-1.732819, 1.127671, -0.1182043, 1, 1, 1, 1, 1,
-1.728285, -0.3425217, -1.636943, 1, 1, 1, 1, 1,
-1.723879, 0.9644983, -0.01282112, 1, 1, 1, 1, 1,
-1.721907, -1.462091, -1.982642, 1, 1, 1, 1, 1,
-1.72076, -0.070675, -3.297011, 1, 1, 1, 1, 1,
-1.718205, 0.1120198, -1.34823, 1, 1, 1, 1, 1,
-1.716692, -1.01251, -2.427124, 1, 1, 1, 1, 1,
-1.698596, -0.3869512, -1.991982, 1, 1, 1, 1, 1,
-1.676905, 0.8986693, -1.935499, 1, 1, 1, 1, 1,
-1.67547, 1.237832, -2.13702, 1, 1, 1, 1, 1,
-1.673288, -0.3025689, -4.102521, 1, 1, 1, 1, 1,
-1.665008, 1.293655, -0.4309857, 1, 1, 1, 1, 1,
-1.66385, 0.9117438, -1.091824, 0, 0, 1, 1, 1,
-1.660867, -1.902042, -3.385071, 1, 0, 0, 1, 1,
-1.653815, -0.9992257, -1.131195, 1, 0, 0, 1, 1,
-1.645501, 0.2042912, -1.887266, 1, 0, 0, 1, 1,
-1.639342, 2.027341, -0.4395236, 1, 0, 0, 1, 1,
-1.63463, 1.678282, -1.264131, 1, 0, 0, 1, 1,
-1.633807, -0.7326248, -1.899374, 0, 0, 0, 1, 1,
-1.607773, -1.829981, -0.6559416, 0, 0, 0, 1, 1,
-1.604623, 0.04940521, -2.504209, 0, 0, 0, 1, 1,
-1.596522, -0.9599324, -0.9385903, 0, 0, 0, 1, 1,
-1.594528, 1.295785, -0.2767013, 0, 0, 0, 1, 1,
-1.582499, -0.9776719, -2.394248, 0, 0, 0, 1, 1,
-1.56638, -0.09544642, -1.082735, 0, 0, 0, 1, 1,
-1.542587, 1.871484, -1.69664, 1, 1, 1, 1, 1,
-1.529711, 1.211706, 0.2063493, 1, 1, 1, 1, 1,
-1.528309, -1.169609, -2.422489, 1, 1, 1, 1, 1,
-1.526752, -0.9604228, -2.321211, 1, 1, 1, 1, 1,
-1.525783, -1.293009, -2.389481, 1, 1, 1, 1, 1,
-1.522675, 0.5075066, -2.925478, 1, 1, 1, 1, 1,
-1.514804, -1.536528, 0.0468471, 1, 1, 1, 1, 1,
-1.50621, 0.7157152, -1.522593, 1, 1, 1, 1, 1,
-1.495247, -1.522529, -3.369776, 1, 1, 1, 1, 1,
-1.49465, -2.255033, -3.112775, 1, 1, 1, 1, 1,
-1.434147, -0.7201172, -2.028189, 1, 1, 1, 1, 1,
-1.42659, 0.06012785, -2.328671, 1, 1, 1, 1, 1,
-1.421403, 0.6518818, -1.215936, 1, 1, 1, 1, 1,
-1.405642, -0.7886376, -1.952054, 1, 1, 1, 1, 1,
-1.346782, -0.6615061, -1.611399, 1, 1, 1, 1, 1,
-1.338001, 1.680866, 0.6804094, 0, 0, 1, 1, 1,
-1.329986, 1.234298, -1.01204, 1, 0, 0, 1, 1,
-1.319051, -0.6738137, 0.234819, 1, 0, 0, 1, 1,
-1.313786, -0.2897008, -0.3706086, 1, 0, 0, 1, 1,
-1.312488, 1.799467, -1.926582, 1, 0, 0, 1, 1,
-1.305138, -0.3905624, -3.037205, 1, 0, 0, 1, 1,
-1.301649, -1.889497, -1.997681, 0, 0, 0, 1, 1,
-1.300809, -0.4218814, -1.857659, 0, 0, 0, 1, 1,
-1.293964, 1.023475, -0.4627568, 0, 0, 0, 1, 1,
-1.287609, 0.5690937, 0.2859859, 0, 0, 0, 1, 1,
-1.287586, 0.7238815, -0.4943498, 0, 0, 0, 1, 1,
-1.286444, 0.1012398, -0.06161955, 0, 0, 0, 1, 1,
-1.242072, 0.3257965, -1.032167, 0, 0, 0, 1, 1,
-1.23998, 0.1421322, -1.203599, 1, 1, 1, 1, 1,
-1.239446, -0.3978086, -1.727601, 1, 1, 1, 1, 1,
-1.23802, -0.5757912, -3.819668, 1, 1, 1, 1, 1,
-1.228515, -0.03898997, -1.845674, 1, 1, 1, 1, 1,
-1.226679, 0.2891435, -1.944185, 1, 1, 1, 1, 1,
-1.226056, -0.871617, -2.516419, 1, 1, 1, 1, 1,
-1.223935, 0.1284518, -1.09703, 1, 1, 1, 1, 1,
-1.20457, 1.810841, 0.8843235, 1, 1, 1, 1, 1,
-1.199497, -1.703261, -3.654909, 1, 1, 1, 1, 1,
-1.191877, 0.1827042, -1.637251, 1, 1, 1, 1, 1,
-1.191417, 1.315712, 0.1124814, 1, 1, 1, 1, 1,
-1.185471, -0.4381355, -1.160409, 1, 1, 1, 1, 1,
-1.179824, -0.7103633, -1.547144, 1, 1, 1, 1, 1,
-1.165798, -0.7052082, -1.453434, 1, 1, 1, 1, 1,
-1.165492, -0.08696843, -1.050262, 1, 1, 1, 1, 1,
-1.164728, 0.2012773, -2.205423, 0, 0, 1, 1, 1,
-1.160203, -0.976953, -2.027482, 1, 0, 0, 1, 1,
-1.147454, -1.505054, -1.826051, 1, 0, 0, 1, 1,
-1.141416, 0.02774405, -3.566394, 1, 0, 0, 1, 1,
-1.140212, -0.6252959, -0.9836528, 1, 0, 0, 1, 1,
-1.133448, -1.100048, -2.706277, 1, 0, 0, 1, 1,
-1.122009, -0.2459348, -1.864512, 0, 0, 0, 1, 1,
-1.11928, 0.4337947, -2.150582, 0, 0, 0, 1, 1,
-1.118221, 0.0716374, -1.274586, 0, 0, 0, 1, 1,
-1.113828, 0.5557646, -2.680204, 0, 0, 0, 1, 1,
-1.110649, 0.2309342, -1.272334, 0, 0, 0, 1, 1,
-1.108604, 0.6783323, -2.389084, 0, 0, 0, 1, 1,
-1.102003, -0.599808, -1.663363, 0, 0, 0, 1, 1,
-1.09884, -1.199903, -3.049652, 1, 1, 1, 1, 1,
-1.096164, -0.8503636, -2.15095, 1, 1, 1, 1, 1,
-1.090795, 0.2409698, -1.833628, 1, 1, 1, 1, 1,
-1.084979, 0.6649058, -2.115883, 1, 1, 1, 1, 1,
-1.081477, -0.6645452, -1.594215, 1, 1, 1, 1, 1,
-1.079793, -0.5865237, 0.03982529, 1, 1, 1, 1, 1,
-1.076774, -0.3480936, -1.465134, 1, 1, 1, 1, 1,
-1.075884, 0.0875496, 0.7655582, 1, 1, 1, 1, 1,
-1.075108, -1.657446, -2.400329, 1, 1, 1, 1, 1,
-1.072162, 1.001343, -1.635908, 1, 1, 1, 1, 1,
-1.071671, 0.6692005, -0.9058644, 1, 1, 1, 1, 1,
-1.052473, 0.5840096, -0.5804463, 1, 1, 1, 1, 1,
-1.051485, -1.730349, -2.655472, 1, 1, 1, 1, 1,
-1.04774, -1.290343, -3.373343, 1, 1, 1, 1, 1,
-1.045162, 0.2378466, -0.4815731, 1, 1, 1, 1, 1,
-1.042801, -1.119902, -3.657479, 0, 0, 1, 1, 1,
-1.037411, 0.3654287, -1.871193, 1, 0, 0, 1, 1,
-1.033208, -1.361259, -3.407237, 1, 0, 0, 1, 1,
-1.030031, 0.568459, -1.441374, 1, 0, 0, 1, 1,
-1.025589, -0.2454813, -0.3458945, 1, 0, 0, 1, 1,
-1.02425, -0.7891805, -2.162909, 1, 0, 0, 1, 1,
-1.020573, -1.359631, -3.177911, 0, 0, 0, 1, 1,
-1.015129, 1.045477, -0.4187073, 0, 0, 0, 1, 1,
-1.01381, 1.237402, -1.095555, 0, 0, 0, 1, 1,
-1.013232, 0.2338939, -2.484616, 0, 0, 0, 1, 1,
-1.004124, 0.4268642, -2.357432, 0, 0, 0, 1, 1,
-0.9998248, 1.059869, -0.487893, 0, 0, 0, 1, 1,
-0.9940998, -0.882077, -1.854063, 0, 0, 0, 1, 1,
-0.9854941, -0.003628459, 0.2582115, 1, 1, 1, 1, 1,
-0.9826674, -0.5989861, -1.873095, 1, 1, 1, 1, 1,
-0.9808887, 0.1153306, -2.221441, 1, 1, 1, 1, 1,
-0.9790829, -0.6388579, -3.903202, 1, 1, 1, 1, 1,
-0.9760109, -0.06335193, -0.4857326, 1, 1, 1, 1, 1,
-0.97389, 0.04306906, -2.144011, 1, 1, 1, 1, 1,
-0.9639775, -0.05150578, -2.37514, 1, 1, 1, 1, 1,
-0.9595913, -0.5604797, -2.828504, 1, 1, 1, 1, 1,
-0.9584386, 0.7353292, -1.516579, 1, 1, 1, 1, 1,
-0.9571466, 0.7930997, -0.1700561, 1, 1, 1, 1, 1,
-0.9554974, -0.5121332, -2.183138, 1, 1, 1, 1, 1,
-0.947681, -0.7030125, -2.19657, 1, 1, 1, 1, 1,
-0.9475771, -1.150275, -3.07609, 1, 1, 1, 1, 1,
-0.9413341, 0.548457, -2.071445, 1, 1, 1, 1, 1,
-0.9400997, 1.047915, -2.521175, 1, 1, 1, 1, 1,
-0.9329724, -0.879465, -1.485578, 0, 0, 1, 1, 1,
-0.9318089, -0.07914017, -0.5078337, 1, 0, 0, 1, 1,
-0.919777, -1.302671, -3.144927, 1, 0, 0, 1, 1,
-0.9177962, 1.077259, -0.9023352, 1, 0, 0, 1, 1,
-0.9113346, -1.192138, -3.547879, 1, 0, 0, 1, 1,
-0.8849609, 1.50146, 1.11287, 1, 0, 0, 1, 1,
-0.8842002, 0.8882597, 0.5811602, 0, 0, 0, 1, 1,
-0.884021, 0.6536394, 0.3500033, 0, 0, 0, 1, 1,
-0.8840188, 0.2288565, -0.5353947, 0, 0, 0, 1, 1,
-0.8836779, 0.4534389, -1.240798, 0, 0, 0, 1, 1,
-0.8820772, 0.01807323, -1.704185, 0, 0, 0, 1, 1,
-0.8815848, 0.2083108, -1.631159, 0, 0, 0, 1, 1,
-0.88121, 0.1834911, -1.642861, 0, 0, 0, 1, 1,
-0.8685491, -0.3178191, -2.486451, 1, 1, 1, 1, 1,
-0.865409, 0.0770636, -2.252581, 1, 1, 1, 1, 1,
-0.860943, 0.1003867, -0.8835968, 1, 1, 1, 1, 1,
-0.8598877, -0.8816529, -4.756551, 1, 1, 1, 1, 1,
-0.8544775, -1.454342, -1.167864, 1, 1, 1, 1, 1,
-0.850725, -1.128655, -3.802606, 1, 1, 1, 1, 1,
-0.8409327, -0.627396, -1.705371, 1, 1, 1, 1, 1,
-0.8404773, 1.446431, -0.2641265, 1, 1, 1, 1, 1,
-0.8388582, -1.665736, -1.765785, 1, 1, 1, 1, 1,
-0.8355561, 0.8154958, 0.2374299, 1, 1, 1, 1, 1,
-0.8294582, 0.2810226, -1.734323, 1, 1, 1, 1, 1,
-0.8289874, 0.9975491, -1.408027, 1, 1, 1, 1, 1,
-0.8231704, 0.04354201, -2.733479, 1, 1, 1, 1, 1,
-0.8180202, 0.03077838, -0.1343112, 1, 1, 1, 1, 1,
-0.8106741, -0.08771905, -2.990887, 1, 1, 1, 1, 1,
-0.809639, -1.881888, -0.9212596, 0, 0, 1, 1, 1,
-0.8054666, -1.062204, -2.684485, 1, 0, 0, 1, 1,
-0.8003806, -0.8917517, -1.15011, 1, 0, 0, 1, 1,
-0.7982646, 1.187083, -0.2525607, 1, 0, 0, 1, 1,
-0.7970479, 1.07744, 0.3822786, 1, 0, 0, 1, 1,
-0.7958014, -2.277926, -3.462071, 1, 0, 0, 1, 1,
-0.7952742, -0.4488064, -1.228807, 0, 0, 0, 1, 1,
-0.794618, 0.03275675, -1.272493, 0, 0, 0, 1, 1,
-0.7938588, -0.04321748, -1.129162, 0, 0, 0, 1, 1,
-0.7885765, 0.9577876, -1.513127, 0, 0, 0, 1, 1,
-0.7840582, -0.3875932, -1.722639, 0, 0, 0, 1, 1,
-0.7792548, 0.1425588, 0.4019941, 0, 0, 0, 1, 1,
-0.7773719, 1.032196, -1.701707, 0, 0, 0, 1, 1,
-0.7690288, -1.447497, -2.661952, 1, 1, 1, 1, 1,
-0.7681147, 1.638242, 0.0310477, 1, 1, 1, 1, 1,
-0.7678033, 1.129227, -0.7262052, 1, 1, 1, 1, 1,
-0.7628744, 1.939398, -1.736103, 1, 1, 1, 1, 1,
-0.7608147, -0.0665253, -3.816531, 1, 1, 1, 1, 1,
-0.7573775, 1.866572, -0.8352157, 1, 1, 1, 1, 1,
-0.7553402, -1.151448, -3.984283, 1, 1, 1, 1, 1,
-0.7550784, -0.2981574, -2.00738, 1, 1, 1, 1, 1,
-0.7544123, 0.7914745, -0.860339, 1, 1, 1, 1, 1,
-0.7499536, -0.9442784, -2.166022, 1, 1, 1, 1, 1,
-0.7495586, -0.3395358, -1.556139, 1, 1, 1, 1, 1,
-0.74666, -1.548927, -1.806288, 1, 1, 1, 1, 1,
-0.7458308, 0.3370933, -3.049073, 1, 1, 1, 1, 1,
-0.7457299, -0.2862119, -2.025542, 1, 1, 1, 1, 1,
-0.7380503, -1.213774, -2.472449, 1, 1, 1, 1, 1,
-0.737205, 0.5850374, -0.2925816, 0, 0, 1, 1, 1,
-0.7300467, 0.7957348, -1.611276, 1, 0, 0, 1, 1,
-0.7286792, -1.986905, -1.520837, 1, 0, 0, 1, 1,
-0.7281085, 0.3354427, -1.425728, 1, 0, 0, 1, 1,
-0.7259144, 0.5993629, -0.1712321, 1, 0, 0, 1, 1,
-0.725197, -1.245059, -2.826309, 1, 0, 0, 1, 1,
-0.7226554, 0.1805061, -0.5156799, 0, 0, 0, 1, 1,
-0.7176698, -0.8677799, -3.792466, 0, 0, 0, 1, 1,
-0.7087523, 0.01664483, 0.9499113, 0, 0, 0, 1, 1,
-0.7024001, -0.6626366, -2.841678, 0, 0, 0, 1, 1,
-0.7010139, -0.8370264, -2.162353, 0, 0, 0, 1, 1,
-0.6996343, -0.8699297, -2.287366, 0, 0, 0, 1, 1,
-0.6957178, 1.47962, -0.616195, 0, 0, 0, 1, 1,
-0.6921904, 1.086497, -1.011355, 1, 1, 1, 1, 1,
-0.6883335, 0.05029241, -1.099792, 1, 1, 1, 1, 1,
-0.6847045, 0.5971154, -0.3942922, 1, 1, 1, 1, 1,
-0.6841566, -0.04471249, -1.819377, 1, 1, 1, 1, 1,
-0.6807787, -0.587511, -3.034122, 1, 1, 1, 1, 1,
-0.6720579, -1.09183, -2.059786, 1, 1, 1, 1, 1,
-0.6704174, -0.3698539, -3.295885, 1, 1, 1, 1, 1,
-0.6677946, 0.08959264, -3.517467, 1, 1, 1, 1, 1,
-0.6675073, -0.5552977, -0.7639886, 1, 1, 1, 1, 1,
-0.6657323, -0.891353, -3.91174, 1, 1, 1, 1, 1,
-0.6653075, 0.3547615, 0.2099971, 1, 1, 1, 1, 1,
-0.6649972, -0.8342305, -2.809901, 1, 1, 1, 1, 1,
-0.6577116, 1.396154, -0.2140474, 1, 1, 1, 1, 1,
-0.656563, -0.9870674, -2.20488, 1, 1, 1, 1, 1,
-0.6564673, -2.717188, -1.843246, 1, 1, 1, 1, 1,
-0.6426644, -0.1157917, -2.198856, 0, 0, 1, 1, 1,
-0.6424899, -1.076881, -2.323114, 1, 0, 0, 1, 1,
-0.6412014, 0.7255495, 0.4829028, 1, 0, 0, 1, 1,
-0.6408409, 1.318642, 0.88455, 1, 0, 0, 1, 1,
-0.6406993, -0.7226915, -3.57569, 1, 0, 0, 1, 1,
-0.6393828, 2.262437, -0.3005817, 1, 0, 0, 1, 1,
-0.6354269, 0.6109887, -1.132388, 0, 0, 0, 1, 1,
-0.6236376, -0.6674128, -4.048038, 0, 0, 0, 1, 1,
-0.621497, 0.7893127, -1.620527, 0, 0, 0, 1, 1,
-0.6211321, -0.0843335, 0.8620146, 0, 0, 0, 1, 1,
-0.6178842, -1.036332, -2.949877, 0, 0, 0, 1, 1,
-0.6174805, 0.7580168, -0.2401335, 0, 0, 0, 1, 1,
-0.615573, 0.2858694, -1.76213, 0, 0, 0, 1, 1,
-0.6139588, 1.678433, -0.07533404, 1, 1, 1, 1, 1,
-0.6135931, -0.1947964, -1.377882, 1, 1, 1, 1, 1,
-0.6054779, 0.3137178, 0.9608614, 1, 1, 1, 1, 1,
-0.6034034, -1.650173, -2.874772, 1, 1, 1, 1, 1,
-0.5955027, 0.2483392, -0.001647727, 1, 1, 1, 1, 1,
-0.5926808, -0.3667232, -1.496722, 1, 1, 1, 1, 1,
-0.5919647, -0.721765, -3.80074, 1, 1, 1, 1, 1,
-0.587567, 1.397345, -1.596606, 1, 1, 1, 1, 1,
-0.5813844, -0.3044337, -1.487738, 1, 1, 1, 1, 1,
-0.570503, -1.009193, -3.05453, 1, 1, 1, 1, 1,
-0.5666267, 0.1800123, -2.007775, 1, 1, 1, 1, 1,
-0.5588844, -0.5615318, -3.105447, 1, 1, 1, 1, 1,
-0.5530587, 0.7649954, -2.014808, 1, 1, 1, 1, 1,
-0.5509553, -1.832001, -1.766209, 1, 1, 1, 1, 1,
-0.5419278, 0.3347335, -1.787693, 1, 1, 1, 1, 1,
-0.5381764, 0.008432267, -3.237482, 0, 0, 1, 1, 1,
-0.5347882, 0.2020692, -1.425015, 1, 0, 0, 1, 1,
-0.5240719, -1.44635, -0.4036197, 1, 0, 0, 1, 1,
-0.5233607, -0.1978541, -3.315617, 1, 0, 0, 1, 1,
-0.5200614, 0.6410629, -1.392456, 1, 0, 0, 1, 1,
-0.5198759, 1.677633, 1.115191, 1, 0, 0, 1, 1,
-0.515209, -0.4748847, -1.846749, 0, 0, 0, 1, 1,
-0.5133668, -0.6556065, -3.851208, 0, 0, 0, 1, 1,
-0.5123745, 0.163044, -1.268294, 0, 0, 0, 1, 1,
-0.508095, 0.1217984, -0.4865086, 0, 0, 0, 1, 1,
-0.4985921, 0.3875919, -0.001997359, 0, 0, 0, 1, 1,
-0.4936957, -1.023562, -1.598885, 0, 0, 0, 1, 1,
-0.4935766, -0.0782273, -1.526514, 0, 0, 0, 1, 1,
-0.4934666, 0.2579862, -0.5021345, 1, 1, 1, 1, 1,
-0.4931991, -1.845508, -4.663835, 1, 1, 1, 1, 1,
-0.4920174, 1.232382, -0.2752381, 1, 1, 1, 1, 1,
-0.4905778, 1.314055, -2.304083, 1, 1, 1, 1, 1,
-0.490237, -1.614825, -3.292849, 1, 1, 1, 1, 1,
-0.4856836, 0.9978986, -0.824532, 1, 1, 1, 1, 1,
-0.4816156, -1.64167, -3.516388, 1, 1, 1, 1, 1,
-0.481458, -1.156513, -3.068863, 1, 1, 1, 1, 1,
-0.4756693, 0.943864, -0.3444076, 1, 1, 1, 1, 1,
-0.4748706, -1.343332, -1.431321, 1, 1, 1, 1, 1,
-0.4670391, 0.7304863, -0.8824868, 1, 1, 1, 1, 1,
-0.4664057, 1.180582, -0.8742623, 1, 1, 1, 1, 1,
-0.4577843, 0.1483474, -1.660837, 1, 1, 1, 1, 1,
-0.4575207, -0.3333209, -2.396595, 1, 1, 1, 1, 1,
-0.4525633, -0.0935308, -1.174974, 1, 1, 1, 1, 1,
-0.4518917, -1.132401, -2.644394, 0, 0, 1, 1, 1,
-0.4518088, -0.02624357, 0.05389476, 1, 0, 0, 1, 1,
-0.4493799, 0.1326686, 0.1461538, 1, 0, 0, 1, 1,
-0.4461977, -1.094343, -3.201546, 1, 0, 0, 1, 1,
-0.4453267, -1.272703, -3.32524, 1, 0, 0, 1, 1,
-0.442475, 0.3047545, 0.2930915, 1, 0, 0, 1, 1,
-0.4389724, -0.1050903, -3.016052, 0, 0, 0, 1, 1,
-0.4345232, -1.06294, -1.448496, 0, 0, 0, 1, 1,
-0.4344418, 1.360107, 0.9721935, 0, 0, 0, 1, 1,
-0.4179023, 0.5662118, 0.2854925, 0, 0, 0, 1, 1,
-0.4176936, -2.175121, -3.033123, 0, 0, 0, 1, 1,
-0.414423, -0.3713548, -3.187794, 0, 0, 0, 1, 1,
-0.4096541, 1.299565, -2.098543, 0, 0, 0, 1, 1,
-0.4090076, 0.7543824, 1.007119, 1, 1, 1, 1, 1,
-0.402271, 0.9722679, -0.8777362, 1, 1, 1, 1, 1,
-0.4014977, -1.15824, -3.860582, 1, 1, 1, 1, 1,
-0.3942398, -0.6269955, -3.145936, 1, 1, 1, 1, 1,
-0.3938619, -0.3712537, -0.7749879, 1, 1, 1, 1, 1,
-0.388411, -0.3004445, -3.311577, 1, 1, 1, 1, 1,
-0.3883864, -0.8890473, -3.850508, 1, 1, 1, 1, 1,
-0.3855358, 0.585166, -0.151146, 1, 1, 1, 1, 1,
-0.3849719, -1.013956, -1.452436, 1, 1, 1, 1, 1,
-0.3831891, 0.05797983, -0.9098859, 1, 1, 1, 1, 1,
-0.3829015, -1.43576, -3.584866, 1, 1, 1, 1, 1,
-0.3792827, -1.66899, -4.385865, 1, 1, 1, 1, 1,
-0.37505, -0.6882904, -2.531846, 1, 1, 1, 1, 1,
-0.3737189, 0.5683798, 0.181397, 1, 1, 1, 1, 1,
-0.3726932, -0.3876041, -3.893531, 1, 1, 1, 1, 1,
-0.3710563, 0.749972, 0.02181049, 0, 0, 1, 1, 1,
-0.3687475, -1.929677, -4.337138, 1, 0, 0, 1, 1,
-0.3643216, 0.6569244, -0.806671, 1, 0, 0, 1, 1,
-0.3641195, -0.6754899, -2.66847, 1, 0, 0, 1, 1,
-0.3593274, 0.5968574, -0.6107494, 1, 0, 0, 1, 1,
-0.3580892, 0.6993773, -0.5749715, 1, 0, 0, 1, 1,
-0.3528169, 0.3245982, -2.880099, 0, 0, 0, 1, 1,
-0.3525691, -0.2565927, -2.110135, 0, 0, 0, 1, 1,
-0.3522017, 1.411685, 1.132374, 0, 0, 0, 1, 1,
-0.3482511, 0.05615573, -1.488711, 0, 0, 0, 1, 1,
-0.3433423, 0.8983136, 0.3033009, 0, 0, 0, 1, 1,
-0.3427868, 0.8637099, 0.4685402, 0, 0, 0, 1, 1,
-0.3320945, -1.652274, -1.525091, 0, 0, 0, 1, 1,
-0.3290996, 0.7899978, 0.4526635, 1, 1, 1, 1, 1,
-0.3248303, -0.286003, -2.051684, 1, 1, 1, 1, 1,
-0.324209, 2.437161, -0.1783345, 1, 1, 1, 1, 1,
-0.321427, 0.2932815, 0.7364568, 1, 1, 1, 1, 1,
-0.320775, 1.115503, -0.8050057, 1, 1, 1, 1, 1,
-0.3081741, -0.3722632, -1.784168, 1, 1, 1, 1, 1,
-0.3003241, -0.6128637, -4.12636, 1, 1, 1, 1, 1,
-0.3000934, -0.9405603, -2.551674, 1, 1, 1, 1, 1,
-0.2985864, 1.759566, 1.039397, 1, 1, 1, 1, 1,
-0.2980519, 0.2049562, 0.9057764, 1, 1, 1, 1, 1,
-0.2975957, 0.6545591, 0.4107229, 1, 1, 1, 1, 1,
-0.2973435, -0.05446823, -1.566372, 1, 1, 1, 1, 1,
-0.287894, -0.4169823, -3.025223, 1, 1, 1, 1, 1,
-0.2842695, -1.056774, -2.65646, 1, 1, 1, 1, 1,
-0.2807766, -0.04661739, -0.6716873, 1, 1, 1, 1, 1,
-0.2789487, 0.8790998, 0.2504379, 0, 0, 1, 1, 1,
-0.277658, -1.103827, -2.238971, 1, 0, 0, 1, 1,
-0.2730859, -0.5977299, -2.03288, 1, 0, 0, 1, 1,
-0.2675057, -0.5065373, -2.801398, 1, 0, 0, 1, 1,
-0.2650342, 2.215206, 0.7536719, 1, 0, 0, 1, 1,
-0.2644955, 0.5950434, -1.79945, 1, 0, 0, 1, 1,
-0.262366, 0.3711566, -0.5391962, 0, 0, 0, 1, 1,
-0.2607208, -0.4083063, -1.17367, 0, 0, 0, 1, 1,
-0.2605303, 0.1086941, -1.894716, 0, 0, 0, 1, 1,
-0.2598751, -0.2654074, -2.131673, 0, 0, 0, 1, 1,
-0.2595084, 0.08048061, 0.06368378, 0, 0, 0, 1, 1,
-0.2568991, 1.014652, -0.1473347, 0, 0, 0, 1, 1,
-0.2515172, 0.4771049, 0.1367675, 0, 0, 0, 1, 1,
-0.2514813, 0.765442, -0.1267023, 1, 1, 1, 1, 1,
-0.2499592, -1.745296, -4.214128, 1, 1, 1, 1, 1,
-0.2387702, -2.439336, -2.801905, 1, 1, 1, 1, 1,
-0.2377602, -1.60577, -2.609597, 1, 1, 1, 1, 1,
-0.2376901, -0.4687298, -4.67767, 1, 1, 1, 1, 1,
-0.2365816, -0.2940986, -4.608129, 1, 1, 1, 1, 1,
-0.2320563, -0.1993157, -2.957285, 1, 1, 1, 1, 1,
-0.2276446, -1.150033, -3.34984, 1, 1, 1, 1, 1,
-0.2273757, 0.9720892, 2.237672, 1, 1, 1, 1, 1,
-0.224857, 1.207799, 0.6594254, 1, 1, 1, 1, 1,
-0.2225859, -0.2398733, -2.721366, 1, 1, 1, 1, 1,
-0.220543, 0.2215392, -1.502158, 1, 1, 1, 1, 1,
-0.2180117, 1.878919, -0.1572828, 1, 1, 1, 1, 1,
-0.2161048, -0.5551733, -3.80298, 1, 1, 1, 1, 1,
-0.2157896, 0.003831627, -1.911681, 1, 1, 1, 1, 1,
-0.2150608, -0.0187825, -1.881291, 0, 0, 1, 1, 1,
-0.2145335, -0.1961444, -3.785203, 1, 0, 0, 1, 1,
-0.2116416, -1.193797, -0.7802453, 1, 0, 0, 1, 1,
-0.2035957, 0.2209047, -0.1662947, 1, 0, 0, 1, 1,
-0.2033964, -2.055264, -2.580226, 1, 0, 0, 1, 1,
-0.2004521, 1.232032, 0.2751501, 1, 0, 0, 1, 1,
-0.2002559, 2.013485, -0.395969, 0, 0, 0, 1, 1,
-0.1989467, -0.08463101, -2.130793, 0, 0, 0, 1, 1,
-0.1981112, 0.3910485, 0.5651459, 0, 0, 0, 1, 1,
-0.1921753, -1.055104, -0.7207608, 0, 0, 0, 1, 1,
-0.1915981, -0.9218683, -0.8971424, 0, 0, 0, 1, 1,
-0.1877413, 0.6925495, -1.406119, 0, 0, 0, 1, 1,
-0.1858093, 0.04714686, 0.3612842, 0, 0, 0, 1, 1,
-0.184337, -1.235819, -2.443725, 1, 1, 1, 1, 1,
-0.1840399, -0.8660549, -0.7954637, 1, 1, 1, 1, 1,
-0.1772209, -1.769118, -3.451832, 1, 1, 1, 1, 1,
-0.1703996, 0.7305168, -1.115635, 1, 1, 1, 1, 1,
-0.1692056, -0.7651616, -3.421596, 1, 1, 1, 1, 1,
-0.1685298, -1.676635, -2.76858, 1, 1, 1, 1, 1,
-0.1664784, -0.7851738, -3.234755, 1, 1, 1, 1, 1,
-0.1650358, -0.4381363, -2.793712, 1, 1, 1, 1, 1,
-0.164659, 0.4277064, -0.4634644, 1, 1, 1, 1, 1,
-0.1644362, -1.427575, -2.909796, 1, 1, 1, 1, 1,
-0.1624627, 1.802677, 0.07957031, 1, 1, 1, 1, 1,
-0.1593386, -1.230231, -1.913961, 1, 1, 1, 1, 1,
-0.1580616, 0.2338394, -1.009157, 1, 1, 1, 1, 1,
-0.157167, -1.383634, -1.431811, 1, 1, 1, 1, 1,
-0.1568077, 0.7088209, -0.2537632, 1, 1, 1, 1, 1,
-0.144646, -0.5417637, -3.183762, 0, 0, 1, 1, 1,
-0.1374412, 0.4246431, -1.545747, 1, 0, 0, 1, 1,
-0.1357034, 0.9153243, 0.5206626, 1, 0, 0, 1, 1,
-0.1306962, -0.6751183, -3.133176, 1, 0, 0, 1, 1,
-0.1289589, 1.389682, -0.3974797, 1, 0, 0, 1, 1,
-0.1282723, -0.2089908, -3.058192, 1, 0, 0, 1, 1,
-0.128168, -0.153571, -2.220577, 0, 0, 0, 1, 1,
-0.1263901, 0.1241353, -0.7598525, 0, 0, 0, 1, 1,
-0.1262574, -0.5247884, -2.711896, 0, 0, 0, 1, 1,
-0.1231606, -0.422707, -3.35482, 0, 0, 0, 1, 1,
-0.1216799, -0.07306428, -2.751639, 0, 0, 0, 1, 1,
-0.1199394, -1.667154, -2.939601, 0, 0, 0, 1, 1,
-0.1189518, -0.500681, -2.602959, 0, 0, 0, 1, 1,
-0.1100019, 0.5994576, 0.3633869, 1, 1, 1, 1, 1,
-0.1021877, -2.043788, -2.929731, 1, 1, 1, 1, 1,
-0.09981469, -1.065545, -0.7541667, 1, 1, 1, 1, 1,
-0.09871571, 0.3934953, 1.141855, 1, 1, 1, 1, 1,
-0.09385414, 0.9060283, 1.074467, 1, 1, 1, 1, 1,
-0.09227972, 0.8169165, 1.760298, 1, 1, 1, 1, 1,
-0.08976207, 1.191226, -0.5496061, 1, 1, 1, 1, 1,
-0.08552627, 1.935953, 0.2441692, 1, 1, 1, 1, 1,
-0.08535884, 1.870955, 0.6146187, 1, 1, 1, 1, 1,
-0.08024896, -1.225093, -2.841614, 1, 1, 1, 1, 1,
-0.07903295, 0.5363088, -0.6063587, 1, 1, 1, 1, 1,
-0.06852598, -0.255309, -2.769108, 1, 1, 1, 1, 1,
-0.06788248, 0.08875747, -2.62637, 1, 1, 1, 1, 1,
-0.06742612, 0.4286919, 0.2970581, 1, 1, 1, 1, 1,
-0.06719173, 1.63775, 1.211355, 1, 1, 1, 1, 1,
-0.06494493, -0.9886981, -4.429451, 0, 0, 1, 1, 1,
-0.06463937, -1.149989, -4.43599, 1, 0, 0, 1, 1,
-0.06462058, 1.407532, -0.2744771, 1, 0, 0, 1, 1,
-0.0643016, -0.4513523, -2.601596, 1, 0, 0, 1, 1,
-0.06160177, 0.2365462, 0.5103962, 1, 0, 0, 1, 1,
-0.06067961, 1.006468, 1.871007, 1, 0, 0, 1, 1,
-0.05803316, 0.0710659, -1.985896, 0, 0, 0, 1, 1,
-0.0496309, 0.5648456, 0.3671188, 0, 0, 0, 1, 1,
-0.04734772, -0.3532845, -2.130883, 0, 0, 0, 1, 1,
-0.04633225, -0.1673885, -4.229385, 0, 0, 0, 1, 1,
-0.04337364, 0.3026053, 0.2038775, 0, 0, 0, 1, 1,
-0.04263863, -0.4154068, -3.538803, 0, 0, 0, 1, 1,
-0.03959257, 0.785317, -0.2507469, 0, 0, 0, 1, 1,
-0.03359274, 0.9774969, -0.22528, 1, 1, 1, 1, 1,
-0.03327093, -1.622151, -1.74802, 1, 1, 1, 1, 1,
-0.03099792, 1.116624, -1.696325, 1, 1, 1, 1, 1,
-0.02384627, -1.284678, -2.748306, 1, 1, 1, 1, 1,
-0.0177018, -1.622955, -3.221455, 1, 1, 1, 1, 1,
-0.01682484, -0.8508785, -2.689331, 1, 1, 1, 1, 1,
-0.01598924, -1.993803, -4.555821, 1, 1, 1, 1, 1,
-0.01252676, -0.2390184, -2.100322, 1, 1, 1, 1, 1,
-0.01103758, -0.01591303, -3.491284, 1, 1, 1, 1, 1,
-0.0101989, 0.04665959, 0.02146234, 1, 1, 1, 1, 1,
-0.00534822, 3.022808, 0.2691961, 1, 1, 1, 1, 1,
-0.0001893879, 0.9452977, -0.5094512, 1, 1, 1, 1, 1,
0.000872988, -0.7490423, 3.615029, 1, 1, 1, 1, 1,
0.001367479, -0.7333637, 2.304216, 1, 1, 1, 1, 1,
0.002555751, -0.2175471, 4.969355, 1, 1, 1, 1, 1,
0.003845948, 1.083569, 0.4145442, 0, 0, 1, 1, 1,
0.004158265, -0.1779089, 3.854132, 1, 0, 0, 1, 1,
0.004969684, -0.3094804, 3.589339, 1, 0, 0, 1, 1,
0.009242411, -0.7177274, 4.774191, 1, 0, 0, 1, 1,
0.009554013, 0.9321232, 0.5433124, 1, 0, 0, 1, 1,
0.0101666, 1.113782, 1.777775, 1, 0, 0, 1, 1,
0.01206182, -0.1869761, 3.854254, 0, 0, 0, 1, 1,
0.01493459, -0.5029107, 2.1021, 0, 0, 0, 1, 1,
0.01542925, 0.7914605, -0.05945096, 0, 0, 0, 1, 1,
0.0189667, -0.2534938, 5.093449, 0, 0, 0, 1, 1,
0.02179217, -1.494263, 2.794705, 0, 0, 0, 1, 1,
0.02448615, 0.5432252, -1.358079, 0, 0, 0, 1, 1,
0.02622197, 0.277793, -0.1411939, 0, 0, 0, 1, 1,
0.02971562, -1.185117, 3.172621, 1, 1, 1, 1, 1,
0.03061682, -0.7852343, 1.807517, 1, 1, 1, 1, 1,
0.03322794, -0.6504018, 3.007134, 1, 1, 1, 1, 1,
0.03326651, -1.777497, 3.878499, 1, 1, 1, 1, 1,
0.03431848, 1.025237, 1.995637, 1, 1, 1, 1, 1,
0.04374221, -0.1893612, 3.46041, 1, 1, 1, 1, 1,
0.04391815, 1.784459, 0.504909, 1, 1, 1, 1, 1,
0.04712167, -0.9632314, 1.520551, 1, 1, 1, 1, 1,
0.04771541, -1.375387, 2.99043, 1, 1, 1, 1, 1,
0.0485782, -0.7564381, 2.99139, 1, 1, 1, 1, 1,
0.04909528, 2.118094, 0.02127459, 1, 1, 1, 1, 1,
0.04929385, -0.4865927, 1.993117, 1, 1, 1, 1, 1,
0.05129381, -0.01080916, 1.990878, 1, 1, 1, 1, 1,
0.05135203, 0.771163, 0.2439254, 1, 1, 1, 1, 1,
0.0558399, -0.2302132, 3.864016, 1, 1, 1, 1, 1,
0.05732498, 1.423024, 1.634419, 0, 0, 1, 1, 1,
0.06042596, 0.0855139, 1.011182, 1, 0, 0, 1, 1,
0.06432113, -0.3198457, 1.492707, 1, 0, 0, 1, 1,
0.06802585, -2.129133, 2.089159, 1, 0, 0, 1, 1,
0.07490643, -1.218824, 3.054055, 1, 0, 0, 1, 1,
0.08329217, 0.04339082, 2.184991, 1, 0, 0, 1, 1,
0.0840118, -1.683962, 2.858557, 0, 0, 0, 1, 1,
0.0876727, 0.4391551, -0.8894605, 0, 0, 0, 1, 1,
0.09434052, 1.842615, 0.7832249, 0, 0, 0, 1, 1,
0.09527197, 0.4823029, 0.5664613, 0, 0, 0, 1, 1,
0.09669409, 0.5700794, 0.8289918, 0, 0, 0, 1, 1,
0.09900603, -0.3070402, 4.099526, 0, 0, 0, 1, 1,
0.1011512, 1.860257, 1.185919, 0, 0, 0, 1, 1,
0.1041416, -0.7275873, 2.499115, 1, 1, 1, 1, 1,
0.1090621, -1.988217, 3.068105, 1, 1, 1, 1, 1,
0.1103093, 0.5481197, 1.104158, 1, 1, 1, 1, 1,
0.1111898, -0.568377, 3.935713, 1, 1, 1, 1, 1,
0.1114467, -2.102601, 2.411205, 1, 1, 1, 1, 1,
0.1142027, 0.3613662, 1.110543, 1, 1, 1, 1, 1,
0.1143862, -1.20763, 3.746851, 1, 1, 1, 1, 1,
0.1183095, -1.74556, 4.325846, 1, 1, 1, 1, 1,
0.1237268, 1.265616, 0.1306848, 1, 1, 1, 1, 1,
0.1238623, 0.9644021, -0.555684, 1, 1, 1, 1, 1,
0.1255917, 0.4723052, -1.385011, 1, 1, 1, 1, 1,
0.1330403, 0.433146, -0.7553975, 1, 1, 1, 1, 1,
0.13484, -0.6327709, 1.713674, 1, 1, 1, 1, 1,
0.1350419, -0.9164878, 2.484798, 1, 1, 1, 1, 1,
0.1427099, 1.057506, -1.888877, 1, 1, 1, 1, 1,
0.1432474, -0.4073245, 3.258477, 0, 0, 1, 1, 1,
0.1443197, -0.3557673, 3.244321, 1, 0, 0, 1, 1,
0.1466444, 0.6440141, -0.8889223, 1, 0, 0, 1, 1,
0.1514395, 1.081116, 0.4893132, 1, 0, 0, 1, 1,
0.1531027, -0.6613316, 2.76137, 1, 0, 0, 1, 1,
0.1532098, 0.8033496, 0.8204523, 1, 0, 0, 1, 1,
0.1577413, 0.3733512, 0.2558547, 0, 0, 0, 1, 1,
0.1579269, -0.64713, 2.836966, 0, 0, 0, 1, 1,
0.1601673, 0.789744, 2.028637, 0, 0, 0, 1, 1,
0.1615271, -2.373819, 3.17946, 0, 0, 0, 1, 1,
0.1702248, -0.3340394, 4.105378, 0, 0, 0, 1, 1,
0.1705669, -0.8174868, 4.895327, 0, 0, 0, 1, 1,
0.1719299, 0.1657161, -0.0851049, 0, 0, 0, 1, 1,
0.1738596, -2.892542, 2.979186, 1, 1, 1, 1, 1,
0.1794436, 1.289609, -0.5650014, 1, 1, 1, 1, 1,
0.1828301, 1.072573, 0.9922686, 1, 1, 1, 1, 1,
0.1840647, -0.4943199, 2.997048, 1, 1, 1, 1, 1,
0.1938087, -1.219603, 2.116261, 1, 1, 1, 1, 1,
0.1950824, 0.6415313, 0.8267947, 1, 1, 1, 1, 1,
0.1965572, 0.8718471, 1.703578, 1, 1, 1, 1, 1,
0.1967049, 1.302397, 1.536783, 1, 1, 1, 1, 1,
0.1967682, -0.9829088, 4.569548, 1, 1, 1, 1, 1,
0.1977245, 0.234458, 0.1625731, 1, 1, 1, 1, 1,
0.2063331, 0.7298293, 0.4605733, 1, 1, 1, 1, 1,
0.2139847, 2.766699, -1.536183, 1, 1, 1, 1, 1,
0.2158419, -0.1443959, 2.79661, 1, 1, 1, 1, 1,
0.2168336, 0.2954487, 2.071533, 1, 1, 1, 1, 1,
0.2199322, 0.5872319, 0.06336866, 1, 1, 1, 1, 1,
0.2213349, 0.2244965, 1.065275, 0, 0, 1, 1, 1,
0.2250083, -0.6589085, 3.060088, 1, 0, 0, 1, 1,
0.225479, 1.198231, 0.4036552, 1, 0, 0, 1, 1,
0.225577, 1.959063, 1.787715, 1, 0, 0, 1, 1,
0.2265653, -1.057593, 3.219755, 1, 0, 0, 1, 1,
0.2275123, -1.3812, 4.887408, 1, 0, 0, 1, 1,
0.2299781, -2.924061, 3.269835, 0, 0, 0, 1, 1,
0.2374422, 0.4464018, 1.853029, 0, 0, 0, 1, 1,
0.2403784, -0.1407292, 2.997338, 0, 0, 0, 1, 1,
0.2404714, -0.4360065, 1.620659, 0, 0, 0, 1, 1,
0.2409609, -0.6938927, 2.515634, 0, 0, 0, 1, 1,
0.2430984, 0.1010402, 0.3390342, 0, 0, 0, 1, 1,
0.2458124, 0.7119167, 0.8543018, 0, 0, 0, 1, 1,
0.2459456, -1.19874, 1.347831, 1, 1, 1, 1, 1,
0.2514104, 0.03354989, 1.142879, 1, 1, 1, 1, 1,
0.2522576, -0.5908659, 0.9860266, 1, 1, 1, 1, 1,
0.2545518, -0.05620138, 2.055714, 1, 1, 1, 1, 1,
0.2597884, 0.03813931, 1.023762, 1, 1, 1, 1, 1,
0.2613862, -1.097273, 3.501446, 1, 1, 1, 1, 1,
0.2640277, -0.6943857, 2.159233, 1, 1, 1, 1, 1,
0.2692925, 1.01131, 0.5804965, 1, 1, 1, 1, 1,
0.2723969, 0.04453661, 2.767828, 1, 1, 1, 1, 1,
0.2774446, -1.672541, 3.899779, 1, 1, 1, 1, 1,
0.2816806, -0.4306605, 3.528192, 1, 1, 1, 1, 1,
0.282854, 0.6740462, 1.567791, 1, 1, 1, 1, 1,
0.2845208, -1.6464, 2.460903, 1, 1, 1, 1, 1,
0.2854463, -1.180322, 0.1783299, 1, 1, 1, 1, 1,
0.2876056, 0.6765321, 0.7450128, 1, 1, 1, 1, 1,
0.288296, -1.43068, 3.354076, 0, 0, 1, 1, 1,
0.2893254, 0.5434928, 2.109735, 1, 0, 0, 1, 1,
0.2925727, -0.9935933, 3.210828, 1, 0, 0, 1, 1,
0.3049806, 0.8151867, -1.236766, 1, 0, 0, 1, 1,
0.3066832, -1.133858, 1.269054, 1, 0, 0, 1, 1,
0.3094158, -0.5286344, 1.952525, 1, 0, 0, 1, 1,
0.3159892, 1.024847, -0.9241939, 0, 0, 0, 1, 1,
0.3247366, -1.083762, 3.043502, 0, 0, 0, 1, 1,
0.3266469, -1.833733, 4.371418, 0, 0, 0, 1, 1,
0.3278813, 0.1909015, 1.112142, 0, 0, 0, 1, 1,
0.3283964, -1.304524, 3.563329, 0, 0, 0, 1, 1,
0.3286813, 0.05236755, 2.141647, 0, 0, 0, 1, 1,
0.3297975, -0.2346811, 4.843795, 0, 0, 0, 1, 1,
0.3388679, 0.9523067, -0.8781757, 1, 1, 1, 1, 1,
0.3390312, -1.821317, 3.134229, 1, 1, 1, 1, 1,
0.3407333, 1.932704, -1.351363, 1, 1, 1, 1, 1,
0.3409115, -0.3697973, 2.729963, 1, 1, 1, 1, 1,
0.3422132, 0.2849812, 0.4856147, 1, 1, 1, 1, 1,
0.3423432, -0.1584551, 2.320838, 1, 1, 1, 1, 1,
0.3427381, -2.406914, 2.621266, 1, 1, 1, 1, 1,
0.3446738, 0.113614, 0.6767337, 1, 1, 1, 1, 1,
0.353639, 0.02773293, 3.268373, 1, 1, 1, 1, 1,
0.3573388, 1.688185, 0.3041699, 1, 1, 1, 1, 1,
0.3625069, 0.07290145, 0.3519724, 1, 1, 1, 1, 1,
0.363359, -0.4659286, 2.739567, 1, 1, 1, 1, 1,
0.3636048, 1.258563, 0.8406627, 1, 1, 1, 1, 1,
0.3659489, -0.7344139, 4.405187, 1, 1, 1, 1, 1,
0.3661065, 0.5264733, 1.068927, 1, 1, 1, 1, 1,
0.370214, -0.758921, 3.908521, 0, 0, 1, 1, 1,
0.3732566, -0.1398987, 2.637, 1, 0, 0, 1, 1,
0.3790878, 2.387087, 0.7589296, 1, 0, 0, 1, 1,
0.3805314, 0.6630411, 0.715672, 1, 0, 0, 1, 1,
0.3826936, -1.231971, 3.435228, 1, 0, 0, 1, 1,
0.3828416, 0.8193849, 0.4159485, 1, 0, 0, 1, 1,
0.3899522, -1.23244, 3.864036, 0, 0, 0, 1, 1,
0.392362, 0.6883451, -1.003305, 0, 0, 0, 1, 1,
0.3937709, -0.3003824, 2.992559, 0, 0, 0, 1, 1,
0.3969035, 0.9552345, 0.1495061, 0, 0, 0, 1, 1,
0.3973149, 0.3186508, -0.4940424, 0, 0, 0, 1, 1,
0.400723, 1.649694, 0.5633389, 0, 0, 0, 1, 1,
0.4043459, 0.1535421, 2.62832, 0, 0, 0, 1, 1,
0.4067775, -2.286919, 4.313541, 1, 1, 1, 1, 1,
0.4070686, -1.137022, 3.582184, 1, 1, 1, 1, 1,
0.4071493, 2.245016, 1.340528, 1, 1, 1, 1, 1,
0.4210247, 1.421818, 0.4643872, 1, 1, 1, 1, 1,
0.4224808, 1.181871, -0.1557903, 1, 1, 1, 1, 1,
0.4259928, 0.1623189, 2.422734, 1, 1, 1, 1, 1,
0.4283673, 0.02547211, 2.101479, 1, 1, 1, 1, 1,
0.4368984, 1.711887, -0.5833354, 1, 1, 1, 1, 1,
0.4405692, -0.4776808, 1.726722, 1, 1, 1, 1, 1,
0.4418471, -0.3348376, 2.338424, 1, 1, 1, 1, 1,
0.4429158, -0.3659364, 2.616785, 1, 1, 1, 1, 1,
0.4492204, -0.4352232, 5.349944, 1, 1, 1, 1, 1,
0.4499204, 1.804165, 0.7040517, 1, 1, 1, 1, 1,
0.4504304, -0.1916778, 2.174533, 1, 1, 1, 1, 1,
0.4519092, 1.262447, -0.5600711, 1, 1, 1, 1, 1,
0.4543078, 0.4795127, 0.5867144, 0, 0, 1, 1, 1,
0.4555193, -0.1962631, 1.855737, 1, 0, 0, 1, 1,
0.4562439, 1.205111, 0.6138345, 1, 0, 0, 1, 1,
0.4578007, -0.2390759, 3.027037, 1, 0, 0, 1, 1,
0.4591662, 0.5189623, 2.045125, 1, 0, 0, 1, 1,
0.4634053, 1.29857, 2.123352, 1, 0, 0, 1, 1,
0.4654501, 1.796961, -0.129987, 0, 0, 0, 1, 1,
0.4674336, 2.063464, 0.3449445, 0, 0, 0, 1, 1,
0.4703948, 0.6958988, 0.5559236, 0, 0, 0, 1, 1,
0.4743053, -1.103442, 4.255789, 0, 0, 0, 1, 1,
0.4867573, 0.2869818, 0.7566144, 0, 0, 0, 1, 1,
0.4933229, 0.8519782, 0.8386261, 0, 0, 0, 1, 1,
0.4934, 0.7665575, 0.5364023, 0, 0, 0, 1, 1,
0.4955634, 0.1032084, 1.746885, 1, 1, 1, 1, 1,
0.4978253, -0.8256397, 1.209908, 1, 1, 1, 1, 1,
0.4980353, 1.269511, 0.1390001, 1, 1, 1, 1, 1,
0.500005, -0.1252311, 3.470529, 1, 1, 1, 1, 1,
0.5000649, -0.2355929, 1.720604, 1, 1, 1, 1, 1,
0.5163482, -2.514988, 1.941197, 1, 1, 1, 1, 1,
0.5165303, -0.6141402, 2.392109, 1, 1, 1, 1, 1,
0.5191596, -0.7557976, 3.297562, 1, 1, 1, 1, 1,
0.5196747, -0.03787045, 2.511672, 1, 1, 1, 1, 1,
0.5216857, 0.2834311, -0.3027707, 1, 1, 1, 1, 1,
0.5237928, -0.02597077, 1.903533, 1, 1, 1, 1, 1,
0.5242441, -0.05328061, 1.068318, 1, 1, 1, 1, 1,
0.5243506, 0.6452929, 0.4982592, 1, 1, 1, 1, 1,
0.525456, -0.4945473, 0.6859471, 1, 1, 1, 1, 1,
0.5262684, -0.8563688, 3.149781, 1, 1, 1, 1, 1,
0.5307705, -1.377026, 3.943033, 0, 0, 1, 1, 1,
0.536071, 1.01008, 0.5695467, 1, 0, 0, 1, 1,
0.5419818, -1.135424, 0.9995183, 1, 0, 0, 1, 1,
0.543918, -0.02733859, 2.178529, 1, 0, 0, 1, 1,
0.5548072, -0.4493639, 1.96292, 1, 0, 0, 1, 1,
0.5562671, -0.2030717, 1.952854, 1, 0, 0, 1, 1,
0.5576709, 0.04490066, 1.530497, 0, 0, 0, 1, 1,
0.5598782, 1.446979, 0.6243882, 0, 0, 0, 1, 1,
0.5612395, -1.241623, 2.9827, 0, 0, 0, 1, 1,
0.5622585, -0.9065064, 2.860217, 0, 0, 0, 1, 1,
0.5702304, -1.637627, 2.213692, 0, 0, 0, 1, 1,
0.5726006, 0.3146429, 1.128595, 0, 0, 0, 1, 1,
0.5728274, 0.742956, 1.409504, 0, 0, 0, 1, 1,
0.5802496, -1.84779, 2.779391, 1, 1, 1, 1, 1,
0.5833656, -0.645483, 3.572231, 1, 1, 1, 1, 1,
0.5858217, -0.7371358, 3.277614, 1, 1, 1, 1, 1,
0.5879928, -0.8409211, 4.269328, 1, 1, 1, 1, 1,
0.5881595, 1.023975, 2.45812, 1, 1, 1, 1, 1,
0.5951095, -0.7804108, 2.756237, 1, 1, 1, 1, 1,
0.5954698, -1.536459, 3.49145, 1, 1, 1, 1, 1,
0.598586, -0.7345336, 1.475558, 1, 1, 1, 1, 1,
0.6038512, 1.306417, -0.2005036, 1, 1, 1, 1, 1,
0.604542, 0.540873, 0.1821991, 1, 1, 1, 1, 1,
0.604847, 0.1546342, 0.1230841, 1, 1, 1, 1, 1,
0.6059164, -0.8231732, 2.288261, 1, 1, 1, 1, 1,
0.6059853, 0.2027803, 1.595711, 1, 1, 1, 1, 1,
0.6092726, -1.162129, 0.9888704, 1, 1, 1, 1, 1,
0.6117448, 0.2023665, 1.018129, 1, 1, 1, 1, 1,
0.6163679, -0.465345, 1.137328, 0, 0, 1, 1, 1,
0.6227393, -0.9144989, 2.249553, 1, 0, 0, 1, 1,
0.6306949, -1.014099, 1.503276, 1, 0, 0, 1, 1,
0.6314907, -2.407553, 3.747349, 1, 0, 0, 1, 1,
0.6380318, 0.4971628, 2.834093, 1, 0, 0, 1, 1,
0.6403205, 0.07304792, 1.037767, 1, 0, 0, 1, 1,
0.6418071, -0.1853253, 1.681655, 0, 0, 0, 1, 1,
0.6456781, -2.634619, 2.829815, 0, 0, 0, 1, 1,
0.6465511, 0.06869107, 2.569463, 0, 0, 0, 1, 1,
0.6486652, 0.4587466, 2.694802, 0, 0, 0, 1, 1,
0.6497567, 0.3621728, 1.600599, 0, 0, 0, 1, 1,
0.6534088, -0.5594255, 2.732481, 0, 0, 0, 1, 1,
0.6579431, 1.698163, 0.7344974, 0, 0, 0, 1, 1,
0.6614187, -0.1430935, 3.864469, 1, 1, 1, 1, 1,
0.6616662, 1.239877, 0.9701031, 1, 1, 1, 1, 1,
0.6638076, -1.473789, 2.603729, 1, 1, 1, 1, 1,
0.6680322, 0.9620395, -1.238619, 1, 1, 1, 1, 1,
0.6709372, 0.3011169, 0.576144, 1, 1, 1, 1, 1,
0.6728095, 1.66897, 0.7619311, 1, 1, 1, 1, 1,
0.6731105, -0.3579206, 3.197622, 1, 1, 1, 1, 1,
0.6733111, 0.8358529, -0.5429772, 1, 1, 1, 1, 1,
0.6749318, -0.4806632, 3.960463, 1, 1, 1, 1, 1,
0.679785, 1.255354, -0.2271215, 1, 1, 1, 1, 1,
0.6853703, -0.02839129, 0.7884307, 1, 1, 1, 1, 1,
0.6856554, -0.7720682, 2.067003, 1, 1, 1, 1, 1,
0.6911026, -1.131458, 3.214034, 1, 1, 1, 1, 1,
0.6913858, -0.1921057, 1.83311, 1, 1, 1, 1, 1,
0.6941532, 0.8234832, -1.686388, 1, 1, 1, 1, 1,
0.6943069, -0.7696862, 2.616938, 0, 0, 1, 1, 1,
0.6996723, 0.2441149, 0.2634086, 1, 0, 0, 1, 1,
0.7018024, 1.12695, 0.7184125, 1, 0, 0, 1, 1,
0.7026174, -0.2392526, 2.468376, 1, 0, 0, 1, 1,
0.7029273, 0.7466525, 1.914295, 1, 0, 0, 1, 1,
0.7040941, -0.699834, 1.011207, 1, 0, 0, 1, 1,
0.7043295, -0.7898145, 2.31812, 0, 0, 0, 1, 1,
0.706145, 0.6056811, 0.7364297, 0, 0, 0, 1, 1,
0.7093096, -0.2190268, 0.8920742, 0, 0, 0, 1, 1,
0.7127236, 0.03657357, 1.908985, 0, 0, 0, 1, 1,
0.7132015, -1.006207, 3.560578, 0, 0, 0, 1, 1,
0.7132427, 0.4045812, 2.77479, 0, 0, 0, 1, 1,
0.7154322, 2.048448, 0.3566223, 0, 0, 0, 1, 1,
0.7158206, -0.9134912, 1.339065, 1, 1, 1, 1, 1,
0.7224827, -0.113294, 0.6383613, 1, 1, 1, 1, 1,
0.7232423, -0.9448574, 2.312806, 1, 1, 1, 1, 1,
0.7257793, -1.509795, 2.638053, 1, 1, 1, 1, 1,
0.7299623, -1.065219, 2.429618, 1, 1, 1, 1, 1,
0.7327176, -0.4623716, 1.394648, 1, 1, 1, 1, 1,
0.7329407, 0.7369585, 1.292843, 1, 1, 1, 1, 1,
0.7387555, 1.230259, -0.1878041, 1, 1, 1, 1, 1,
0.7415537, 0.8727137, 0.7819287, 1, 1, 1, 1, 1,
0.7415733, 0.4314154, 2.089135, 1, 1, 1, 1, 1,
0.7430657, 0.7868435, -0.3259321, 1, 1, 1, 1, 1,
0.7434397, -0.3773884, 0.3992501, 1, 1, 1, 1, 1,
0.7443745, -0.1251343, 2.812186, 1, 1, 1, 1, 1,
0.7460417, 1.027142, 0.7184865, 1, 1, 1, 1, 1,
0.7463382, -1.382714, 2.479753, 1, 1, 1, 1, 1,
0.7496623, 2.663005, 1.523766, 0, 0, 1, 1, 1,
0.7517446, -1.885242, 3.292876, 1, 0, 0, 1, 1,
0.7565321, -0.7147031, 3.193349, 1, 0, 0, 1, 1,
0.7569553, 1.146618, 0.2808493, 1, 0, 0, 1, 1,
0.7592304, 0.9836115, 0.4907443, 1, 0, 0, 1, 1,
0.762198, 0.6035659, 0.9720422, 1, 0, 0, 1, 1,
0.762542, 0.04088105, 1.440714, 0, 0, 0, 1, 1,
0.7626125, -0.9154897, 2.465217, 0, 0, 0, 1, 1,
0.7645166, -0.06626122, 0.9510123, 0, 0, 0, 1, 1,
0.7665538, 0.863274, 2.120485, 0, 0, 0, 1, 1,
0.7666775, -0.5889163, 2.699421, 0, 0, 0, 1, 1,
0.7673815, -0.8046373, 2.161001, 0, 0, 0, 1, 1,
0.7679831, 1.650039, -0.95384, 0, 0, 0, 1, 1,
0.7721021, -0.0289766, 0.857478, 1, 1, 1, 1, 1,
0.77271, -0.8151554, 1.817147, 1, 1, 1, 1, 1,
0.7765728, 0.1236607, 1.521293, 1, 1, 1, 1, 1,
0.7810931, -0.2984775, 2.076922, 1, 1, 1, 1, 1,
0.7880927, 0.04771125, 0.8399609, 1, 1, 1, 1, 1,
0.7889533, 1.027515, -0.4903104, 1, 1, 1, 1, 1,
0.7939847, -1.237171, 2.561921, 1, 1, 1, 1, 1,
0.7981166, -0.2052709, 0.2938069, 1, 1, 1, 1, 1,
0.7999043, 0.4806313, 0.6749313, 1, 1, 1, 1, 1,
0.8057275, 0.1823366, 0.5875335, 1, 1, 1, 1, 1,
0.8078583, 0.9445007, 0.7000735, 1, 1, 1, 1, 1,
0.8088192, -1.355884, 3.919524, 1, 1, 1, 1, 1,
0.8148273, -0.3366099, 3.899263, 1, 1, 1, 1, 1,
0.8164541, 1.020835, -1.362688, 1, 1, 1, 1, 1,
0.8176234, -1.193021, 1.804359, 1, 1, 1, 1, 1,
0.8181065, -1.656718, 3.967255, 0, 0, 1, 1, 1,
0.8208591, 0.1050811, 2.019415, 1, 0, 0, 1, 1,
0.8236908, -0.4839935, 2.045911, 1, 0, 0, 1, 1,
0.8363775, 2.105756, 1.028361, 1, 0, 0, 1, 1,
0.8368598, 0.4765196, 2.960954, 1, 0, 0, 1, 1,
0.8390453, -0.1523039, 1.382434, 1, 0, 0, 1, 1,
0.8455921, 0.6574516, 2.401677, 0, 0, 0, 1, 1,
0.8474817, -1.489024, 1.688843, 0, 0, 0, 1, 1,
0.8514827, 0.4092406, 1.755057, 0, 0, 0, 1, 1,
0.853796, -1.17657, 2.703343, 0, 0, 0, 1, 1,
0.8552573, -1.953103, 3.550611, 0, 0, 0, 1, 1,
0.8574257, 0.8031531, -0.1402635, 0, 0, 0, 1, 1,
0.8583539, -0.1029077, 0.9413644, 0, 0, 0, 1, 1,
0.8677285, 1.010774, 0.06569311, 1, 1, 1, 1, 1,
0.8709007, 0.4315946, 1.020092, 1, 1, 1, 1, 1,
0.8711807, 1.00681, 2.539466, 1, 1, 1, 1, 1,
0.8714055, 1.062016, 2.335527, 1, 1, 1, 1, 1,
0.8731479, -0.4034813, 1.268541, 1, 1, 1, 1, 1,
0.8746346, -1.03072, 3.053719, 1, 1, 1, 1, 1,
0.8792582, 0.3638038, -0.1060424, 1, 1, 1, 1, 1,
0.8825008, 0.4147707, 0.3661126, 1, 1, 1, 1, 1,
0.8844659, 0.613589, 1.794422, 1, 1, 1, 1, 1,
0.8908554, -1.314174, 1.74983, 1, 1, 1, 1, 1,
0.8941134, 0.5883158, 1.218759, 1, 1, 1, 1, 1,
0.8945196, -0.8897904, 2.679733, 1, 1, 1, 1, 1,
0.9102542, -0.7629267, 2.325031, 1, 1, 1, 1, 1,
0.9138059, 1.164537, 0.3310604, 1, 1, 1, 1, 1,
0.9197128, 1.737348, 0.8177466, 1, 1, 1, 1, 1,
0.9197537, 0.4348562, -0.04197802, 0, 0, 1, 1, 1,
0.923539, 1.133004, 0.405749, 1, 0, 0, 1, 1,
0.9237717, 0.2620607, 2.405444, 1, 0, 0, 1, 1,
0.923803, -0.3539303, 0.2252817, 1, 0, 0, 1, 1,
0.9249317, -0.7574869, 1.614653, 1, 0, 0, 1, 1,
0.9433345, 0.9789817, 0.3219805, 1, 0, 0, 1, 1,
0.9454018, -1.063711, 2.02645, 0, 0, 0, 1, 1,
0.9517087, 1.152928, 0.6275147, 0, 0, 0, 1, 1,
0.9518711, 0.3922529, 0.7362087, 0, 0, 0, 1, 1,
0.9524885, -1.292661, 4.09274, 0, 0, 0, 1, 1,
0.9531111, -0.08989965, 2.201379, 0, 0, 0, 1, 1,
0.9551725, 0.3954986, 1.577613, 0, 0, 0, 1, 1,
0.963475, 0.2940869, 2.712679, 0, 0, 0, 1, 1,
0.9648096, 0.0139308, 2.286226, 1, 1, 1, 1, 1,
0.977657, 0.6298155, 0.4679381, 1, 1, 1, 1, 1,
0.9778903, -0.7215193, 3.833534, 1, 1, 1, 1, 1,
0.9794046, -0.0635698, 2.334405, 1, 1, 1, 1, 1,
0.9898809, -0.6566494, 2.260769, 1, 1, 1, 1, 1,
0.9900045, -0.3626675, 1.592192, 1, 1, 1, 1, 1,
0.9926094, 1.27853, 0.8384868, 1, 1, 1, 1, 1,
0.9929234, 0.4932146, 2.548595, 1, 1, 1, 1, 1,
0.9937945, 0.7518438, -0.008753981, 1, 1, 1, 1, 1,
0.9979206, -0.4634228, 4.173044, 1, 1, 1, 1, 1,
1.001176, -0.8953442, 2.76067, 1, 1, 1, 1, 1,
1.010138, 0.2532562, 0.9450753, 1, 1, 1, 1, 1,
1.013033, 0.7175918, 1.174426, 1, 1, 1, 1, 1,
1.019916, 0.5839494, 0.6389076, 1, 1, 1, 1, 1,
1.021902, -1.202912, 0.8138667, 1, 1, 1, 1, 1,
1.023765, 0.7527047, 1.445993, 0, 0, 1, 1, 1,
1.025389, -0.08735213, 1.165801, 1, 0, 0, 1, 1,
1.028291, 0.2210515, 1.599377, 1, 0, 0, 1, 1,
1.031398, 1.026345, -0.941236, 1, 0, 0, 1, 1,
1.036127, 1.012371, 0.8645363, 1, 0, 0, 1, 1,
1.036574, -0.5193368, 4.058316, 1, 0, 0, 1, 1,
1.039494, 0.05198288, 1.171813, 0, 0, 0, 1, 1,
1.041477, -1.598769, 4.178204, 0, 0, 0, 1, 1,
1.043258, -0.5195246, 2.291685, 0, 0, 0, 1, 1,
1.050644, 0.8450785, 0.3835831, 0, 0, 0, 1, 1,
1.052132, -0.04428596, 2.286221, 0, 0, 0, 1, 1,
1.06114, -0.1670267, -0.3437321, 0, 0, 0, 1, 1,
1.062558, 0.8366296, 1.322567, 0, 0, 0, 1, 1,
1.0637, -0.5337699, 2.73191, 1, 1, 1, 1, 1,
1.072353, -1.455322, 3.441628, 1, 1, 1, 1, 1,
1.085915, 0.833239, -1.676713, 1, 1, 1, 1, 1,
1.093468, -2.670373, 2.288546, 1, 1, 1, 1, 1,
1.094359, 0.1802358, 3.502757, 1, 1, 1, 1, 1,
1.097998, -0.9632206, 4.246653, 1, 1, 1, 1, 1,
1.101028, 0.1702417, 0.5509998, 1, 1, 1, 1, 1,
1.110974, 1.013961, -0.4562886, 1, 1, 1, 1, 1,
1.116245, -2.615462, 2.948107, 1, 1, 1, 1, 1,
1.126985, 0.05176004, 1.314076, 1, 1, 1, 1, 1,
1.129949, 0.3839528, 2.199261, 1, 1, 1, 1, 1,
1.134535, -0.06741058, 0.9205424, 1, 1, 1, 1, 1,
1.134987, 0.9189546, 1.7182, 1, 1, 1, 1, 1,
1.14892, -0.2543888, 0.1357564, 1, 1, 1, 1, 1,
1.150574, -0.6157047, 2.272543, 1, 1, 1, 1, 1,
1.156026, 0.6185703, 1.641308, 0, 0, 1, 1, 1,
1.16163, -0.2836583, 2.523796, 1, 0, 0, 1, 1,
1.164881, -0.919699, 1.98761, 1, 0, 0, 1, 1,
1.167844, 0.8386523, 0.4766274, 1, 0, 0, 1, 1,
1.188071, -0.120831, 2.439707, 1, 0, 0, 1, 1,
1.189805, 1.269816, -0.05056847, 1, 0, 0, 1, 1,
1.191942, 1.399425, -1.194675, 0, 0, 0, 1, 1,
1.194369, -1.214892, -0.6788403, 0, 0, 0, 1, 1,
1.195562, 0.2588982, -0.4600744, 0, 0, 0, 1, 1,
1.196819, -0.7999949, 3.136608, 0, 0, 0, 1, 1,
1.19719, -1.456843, 3.187685, 0, 0, 0, 1, 1,
1.203348, 2.188891, 1.270934, 0, 0, 0, 1, 1,
1.212854, -0.8484817, 2.328236, 0, 0, 0, 1, 1,
1.216904, 0.5961787, -0.3118808, 1, 1, 1, 1, 1,
1.228435, 0.003205696, 0.7713066, 1, 1, 1, 1, 1,
1.23234, 0.8613048, 0.08272167, 1, 1, 1, 1, 1,
1.233321, -0.9298054, 2.885765, 1, 1, 1, 1, 1,
1.237267, -0.2911419, 1.388921, 1, 1, 1, 1, 1,
1.244271, -0.4605114, 1.486542, 1, 1, 1, 1, 1,
1.251512, 0.09733483, 2.308596, 1, 1, 1, 1, 1,
1.255654, 0.3462982, 1.680979, 1, 1, 1, 1, 1,
1.25807, 0.2540813, 0.9233197, 1, 1, 1, 1, 1,
1.260533, 0.1066808, 1.664829, 1, 1, 1, 1, 1,
1.263144, 0.1150122, 2.074732, 1, 1, 1, 1, 1,
1.272583, 0.724445, 0.779422, 1, 1, 1, 1, 1,
1.272694, -0.8945686, 1.802087, 1, 1, 1, 1, 1,
1.277984, -1.99707, 3.37731, 1, 1, 1, 1, 1,
1.280548, 0.5726253, 1.665792, 1, 1, 1, 1, 1,
1.282681, -2.305166, 3.024493, 0, 0, 1, 1, 1,
1.292434, 0.1294385, 1.438513, 1, 0, 0, 1, 1,
1.293685, 0.9747086, -0.1709518, 1, 0, 0, 1, 1,
1.297045, -0.9913242, 3.12885, 1, 0, 0, 1, 1,
1.301502, 0.3272309, 1.647204, 1, 0, 0, 1, 1,
1.304231, -1.698526, 1.586227, 1, 0, 0, 1, 1,
1.317271, -0.2355934, 2.679812, 0, 0, 0, 1, 1,
1.320877, -0.2068671, -0.9674, 0, 0, 0, 1, 1,
1.323063, 1.807593, 1.34812, 0, 0, 0, 1, 1,
1.334634, 0.7242694, 0.3164075, 0, 0, 0, 1, 1,
1.335326, 0.5020492, 2.190339, 0, 0, 0, 1, 1,
1.336061, 0.07172116, 1.082737, 0, 0, 0, 1, 1,
1.347606, 0.4165781, 3.42717, 0, 0, 0, 1, 1,
1.375907, -0.167711, 1.194719, 1, 1, 1, 1, 1,
1.387455, 0.2272384, 0.4497183, 1, 1, 1, 1, 1,
1.399943, -0.1994353, -0.3086174, 1, 1, 1, 1, 1,
1.40517, 0.1564949, -0.8748185, 1, 1, 1, 1, 1,
1.408206, -1.141444, 0.1614033, 1, 1, 1, 1, 1,
1.408378, -1.397833, 2.125925, 1, 1, 1, 1, 1,
1.424065, -1.627697, 3.845354, 1, 1, 1, 1, 1,
1.431829, 0.4180187, 0.01490299, 1, 1, 1, 1, 1,
1.435312, -0.3494453, 0.5737174, 1, 1, 1, 1, 1,
1.444246, -0.982423, 1.441206, 1, 1, 1, 1, 1,
1.444405, 0.7739926, 0.4822991, 1, 1, 1, 1, 1,
1.446093, -0.6386597, 1.91506, 1, 1, 1, 1, 1,
1.452235, 1.040371, 0.7445296, 1, 1, 1, 1, 1,
1.452605, 0.2035707, 1.643889, 1, 1, 1, 1, 1,
1.456085, -0.03805643, 2.44591, 1, 1, 1, 1, 1,
1.456163, 0.214406, 0.4839346, 0, 0, 1, 1, 1,
1.457545, -1.289222, 3.439659, 1, 0, 0, 1, 1,
1.459746, -0.7862586, 2.93885, 1, 0, 0, 1, 1,
1.459904, -1.632084, 2.919553, 1, 0, 0, 1, 1,
1.461001, 0.1355755, 0.6923721, 1, 0, 0, 1, 1,
1.473786, -0.3276271, 1.93435, 1, 0, 0, 1, 1,
1.477093, 0.6163371, 3.450865, 0, 0, 0, 1, 1,
1.483329, 1.596171, 0.9862188, 0, 0, 0, 1, 1,
1.486319, -0.5767828, 2.03062, 0, 0, 0, 1, 1,
1.495513, -1.14358, 0.7238864, 0, 0, 0, 1, 1,
1.530482, 0.5564597, 0.3571291, 0, 0, 0, 1, 1,
1.533522, -0.6647248, 1.391323, 0, 0, 0, 1, 1,
1.546237, -0.02514066, 3.12422, 0, 0, 0, 1, 1,
1.546851, -0.6245334, 1.904976, 1, 1, 1, 1, 1,
1.55602, -1.466702, 2.9557, 1, 1, 1, 1, 1,
1.566372, -0.6233372, 3.433197, 1, 1, 1, 1, 1,
1.572354, 0.1268618, 1.718907, 1, 1, 1, 1, 1,
1.576065, -0.05970454, 3.589427, 1, 1, 1, 1, 1,
1.58345, -0.08264951, 1.247867, 1, 1, 1, 1, 1,
1.585278, 2.457619, -0.614346, 1, 1, 1, 1, 1,
1.585772, -0.1549913, 2.051017, 1, 1, 1, 1, 1,
1.597849, 0.01413304, -0.1561175, 1, 1, 1, 1, 1,
1.602448, 0.373839, 2.297338, 1, 1, 1, 1, 1,
1.602647, -0.4495685, 2.131024, 1, 1, 1, 1, 1,
1.609461, -1.582285, 0.7627027, 1, 1, 1, 1, 1,
1.629879, -0.9905049, 3.190152, 1, 1, 1, 1, 1,
1.630704, -1.357597, 3.158064, 1, 1, 1, 1, 1,
1.640157, -0.02417047, 0.9870061, 1, 1, 1, 1, 1,
1.658151, -0.8680999, 2.65053, 0, 0, 1, 1, 1,
1.739611, -1.109485, 2.346405, 1, 0, 0, 1, 1,
1.744276, -1.150328, 0.957815, 1, 0, 0, 1, 1,
1.756415, 0.005509451, 0.6995924, 1, 0, 0, 1, 1,
1.763043, -0.1814315, 3.348638, 1, 0, 0, 1, 1,
1.775092, 0.0807216, 1.492283, 1, 0, 0, 1, 1,
1.806642, -0.8629356, 3.526377, 0, 0, 0, 1, 1,
1.807336, 0.1857167, 2.137537, 0, 0, 0, 1, 1,
1.829183, -1.142431, 0.8256566, 0, 0, 0, 1, 1,
1.853546, 0.114725, 2.239779, 0, 0, 0, 1, 1,
1.858168, 1.26179, -0.7604176, 0, 0, 0, 1, 1,
1.878127, -0.8076634, 2.087812, 0, 0, 0, 1, 1,
1.884991, -0.5941188, 2.082625, 0, 0, 0, 1, 1,
1.896261, 0.4362703, 0.08881366, 1, 1, 1, 1, 1,
1.914239, -1.486213, 2.477633, 1, 1, 1, 1, 1,
1.951998, -0.2948174, 1.387376, 1, 1, 1, 1, 1,
1.952599, 1.174524, 0.8638322, 1, 1, 1, 1, 1,
1.966748, 0.2765327, -0.1642314, 1, 1, 1, 1, 1,
1.981232, 0.1930764, 0.2669551, 1, 1, 1, 1, 1,
1.993724, -1.779824, 3.566612, 1, 1, 1, 1, 1,
2.007432, 0.06676985, -0.5424713, 1, 1, 1, 1, 1,
2.046262, -0.6880774, 1.833618, 1, 1, 1, 1, 1,
2.071485, -1.312219, 2.912517, 1, 1, 1, 1, 1,
2.076123, -1.338519, 1.532764, 1, 1, 1, 1, 1,
2.080042, -1.290245, 2.116121, 1, 1, 1, 1, 1,
2.08635, 0.3146308, 0.6764975, 1, 1, 1, 1, 1,
2.089462, 0.4210226, 3.82355, 1, 1, 1, 1, 1,
2.090856, 0.1118225, 0.2727815, 1, 1, 1, 1, 1,
2.110251, 0.6582158, 1.050519, 0, 0, 1, 1, 1,
2.127274, 0.3439631, 1.474012, 1, 0, 0, 1, 1,
2.13448, 0.07016835, 3.287476, 1, 0, 0, 1, 1,
2.141087, 0.3695758, 0.2044943, 1, 0, 0, 1, 1,
2.215004, 0.5790584, 1.197408, 1, 0, 0, 1, 1,
2.236196, 0.5624002, 0.8864234, 1, 0, 0, 1, 1,
2.249246, -1.138402, 0.4234232, 0, 0, 0, 1, 1,
2.272982, 0.5314687, 1.611002, 0, 0, 0, 1, 1,
2.3273, 1.001778, 1.884751, 0, 0, 0, 1, 1,
2.355876, -1.882074, 1.918326, 0, 0, 0, 1, 1,
2.367264, 1.284552, 0.378511, 0, 0, 0, 1, 1,
2.524008, 1.303364, 1.532185, 0, 0, 0, 1, 1,
2.537604, -0.2475314, -0.05529891, 0, 0, 0, 1, 1,
2.573129, -1.25341, 2.179868, 1, 1, 1, 1, 1,
2.595825, 0.257027, 0.7966418, 1, 1, 1, 1, 1,
2.681752, -0.524868, 1.670239, 1, 1, 1, 1, 1,
2.687675, -1.667176, 4.068233, 1, 1, 1, 1, 1,
2.746702, -0.1412866, 1.932936, 1, 1, 1, 1, 1,
3.006255, 1.281987, 0.7219672, 1, 1, 1, 1, 1,
3.315555, -0.09282725, 1.727896, 1, 1, 1, 1, 1
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
var radius = 9.157077;
var distance = 32.16385;
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
mvMatrix.translate( -0.208338, -0.04937339, -0.2966962 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.16385);
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
