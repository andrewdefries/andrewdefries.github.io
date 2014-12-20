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
-3.714431, -0.3182085, -2.536957, 1, 0, 0, 1,
-3.222615, -0.6794875, -1.815511, 1, 0.007843138, 0, 1,
-2.945153, 1.585649, 0.4099922, 1, 0.01176471, 0, 1,
-2.841015, -0.2991959, -2.918293, 1, 0.01960784, 0, 1,
-2.839438, 1.081388, -1.282513, 1, 0.02352941, 0, 1,
-2.57718, 1.451321, -2.083273, 1, 0.03137255, 0, 1,
-2.524381, 1.657706, -0.7274678, 1, 0.03529412, 0, 1,
-2.516933, 0.05255643, -1.517958, 1, 0.04313726, 0, 1,
-2.465781, -2.031916, -3.575431, 1, 0.04705882, 0, 1,
-2.440486, 1.305147, -1.226945, 1, 0.05490196, 0, 1,
-2.413806, -0.9564458, -3.122715, 1, 0.05882353, 0, 1,
-2.389272, 0.6530381, -0.954269, 1, 0.06666667, 0, 1,
-2.38614, -1.616019, -1.344937, 1, 0.07058824, 0, 1,
-2.207438, 0.4399541, -1.387129, 1, 0.07843138, 0, 1,
-2.193671, -0.4305996, -0.6457857, 1, 0.08235294, 0, 1,
-2.175823, -0.257385, -3.514769, 1, 0.09019608, 0, 1,
-2.153306, -0.3824387, -0.01038572, 1, 0.09411765, 0, 1,
-2.148783, -0.04034832, -0.1455672, 1, 0.1019608, 0, 1,
-2.13357, -1.543315, -2.495116, 1, 0.1098039, 0, 1,
-2.125983, -0.4413106, -0.3565775, 1, 0.1137255, 0, 1,
-2.117757, -1.071781, -1.96467, 1, 0.1215686, 0, 1,
-2.046677, 1.628154, -1.4812, 1, 0.1254902, 0, 1,
-2.039726, -0.242268, -3.438309, 1, 0.1333333, 0, 1,
-2.037222, -0.6581036, -1.565685, 1, 0.1372549, 0, 1,
-2.015331, -1.529064, -2.018349, 1, 0.145098, 0, 1,
-2.010863, 0.5312657, -1.239401, 1, 0.1490196, 0, 1,
-1.976863, -0.4919995, -3.711013, 1, 0.1568628, 0, 1,
-1.976376, 1.283596, -1.295372, 1, 0.1607843, 0, 1,
-1.950161, 0.5269861, -0.1820922, 1, 0.1686275, 0, 1,
-1.928361, 0.4073915, -1.227293, 1, 0.172549, 0, 1,
-1.912841, 0.5300975, -2.541107, 1, 0.1803922, 0, 1,
-1.908159, 0.6375192, -2.536242, 1, 0.1843137, 0, 1,
-1.899021, -1.242161, -3.025865, 1, 0.1921569, 0, 1,
-1.889086, -2.046603, -2.540243, 1, 0.1960784, 0, 1,
-1.886289, -0.7044111, -2.376651, 1, 0.2039216, 0, 1,
-1.853048, -0.7144032, -1.626101, 1, 0.2117647, 0, 1,
-1.83457, 1.807871, -1.570545, 1, 0.2156863, 0, 1,
-1.8159, -0.9009163, -1.314451, 1, 0.2235294, 0, 1,
-1.81352, 0.2140024, -2.259482, 1, 0.227451, 0, 1,
-1.796195, 0.0291208, -2.754305, 1, 0.2352941, 0, 1,
-1.786988, 0.1610283, -2.519983, 1, 0.2392157, 0, 1,
-1.783926, -0.2132271, -1.22457, 1, 0.2470588, 0, 1,
-1.781459, -0.8664693, -0.2151486, 1, 0.2509804, 0, 1,
-1.778222, 0.2774158, -1.093112, 1, 0.2588235, 0, 1,
-1.762208, 0.2276225, -2.230671, 1, 0.2627451, 0, 1,
-1.760366, 0.9320675, -1.453897, 1, 0.2705882, 0, 1,
-1.738059, 1.334721, -1.35665, 1, 0.2745098, 0, 1,
-1.687205, 2.301651, 0.8899989, 1, 0.282353, 0, 1,
-1.658485, -2.242205, -2.472136, 1, 0.2862745, 0, 1,
-1.651179, -1.137925, -2.53139, 1, 0.2941177, 0, 1,
-1.644711, -0.3660309, -1.619529, 1, 0.3019608, 0, 1,
-1.642783, -2.367496, -1.460094, 1, 0.3058824, 0, 1,
-1.632377, -1.183733, -0.998392, 1, 0.3137255, 0, 1,
-1.622131, -0.9581033, -1.748285, 1, 0.3176471, 0, 1,
-1.599439, 0.2235664, -0.9809713, 1, 0.3254902, 0, 1,
-1.597659, 0.05386771, -1.478012, 1, 0.3294118, 0, 1,
-1.584996, 0.848711, 0.7947955, 1, 0.3372549, 0, 1,
-1.576007, -0.07356057, -2.80475, 1, 0.3411765, 0, 1,
-1.574898, -1.176702, -2.452183, 1, 0.3490196, 0, 1,
-1.569691, 0.4688771, 0.4916939, 1, 0.3529412, 0, 1,
-1.559481, 0.8385463, -0.648034, 1, 0.3607843, 0, 1,
-1.557383, -1.128476, -3.331383, 1, 0.3647059, 0, 1,
-1.553077, 0.1300907, -2.973989, 1, 0.372549, 0, 1,
-1.536684, 0.7740472, -1.274948, 1, 0.3764706, 0, 1,
-1.512524, -1.601611, -3.45825, 1, 0.3843137, 0, 1,
-1.508404, 0.9208331, 0.1856076, 1, 0.3882353, 0, 1,
-1.498068, 0.901383, -1.389182, 1, 0.3960784, 0, 1,
-1.495822, 1.1359, -1.032095, 1, 0.4039216, 0, 1,
-1.486725, -1.412257, -2.282076, 1, 0.4078431, 0, 1,
-1.47598, 1.201354, -1.001141, 1, 0.4156863, 0, 1,
-1.469313, -0.6722236, -1.222088, 1, 0.4196078, 0, 1,
-1.466158, -0.3731219, -3.631512, 1, 0.427451, 0, 1,
-1.464204, -0.6385323, -2.285536, 1, 0.4313726, 0, 1,
-1.442559, -0.6938632, -1.905086, 1, 0.4392157, 0, 1,
-1.437897, 0.04184511, -2.827135, 1, 0.4431373, 0, 1,
-1.425986, -0.2488024, -0.1851832, 1, 0.4509804, 0, 1,
-1.424774, -0.1817761, -1.333282, 1, 0.454902, 0, 1,
-1.421428, 0.1518193, -1.75619, 1, 0.4627451, 0, 1,
-1.410596, -1.466679, -1.329322, 1, 0.4666667, 0, 1,
-1.40127, 0.05787261, 0.8983249, 1, 0.4745098, 0, 1,
-1.399807, 3.385961, -0.5426049, 1, 0.4784314, 0, 1,
-1.3901, 0.7651735, -2.307632, 1, 0.4862745, 0, 1,
-1.389674, -0.02813032, -0.07815243, 1, 0.4901961, 0, 1,
-1.387657, 0.5795568, -1.398836, 1, 0.4980392, 0, 1,
-1.366106, -0.8313548, -3.522674, 1, 0.5058824, 0, 1,
-1.364642, -1.375095, -2.519677, 1, 0.509804, 0, 1,
-1.360668, -1.989543, -4.220677, 1, 0.5176471, 0, 1,
-1.360149, -1.86597, -3.353305, 1, 0.5215687, 0, 1,
-1.35755, -0.0815883, -1.244859, 1, 0.5294118, 0, 1,
-1.355437, 1.446005, -1.017893, 1, 0.5333334, 0, 1,
-1.348572, 1.015229, 0.2539748, 1, 0.5411765, 0, 1,
-1.348299, -1.6624, -3.040977, 1, 0.5450981, 0, 1,
-1.338232, -2.12936, -2.626113, 1, 0.5529412, 0, 1,
-1.329833, 0.2742161, 1.444853, 1, 0.5568628, 0, 1,
-1.32926, 1.006054, -1.136016, 1, 0.5647059, 0, 1,
-1.328033, -1.184274, -2.438098, 1, 0.5686275, 0, 1,
-1.324166, -0.1444427, -1.657442, 1, 0.5764706, 0, 1,
-1.319766, -0.7814163, -2.881785, 1, 0.5803922, 0, 1,
-1.317568, 0.9689263, 1.098701, 1, 0.5882353, 0, 1,
-1.299667, -0.761128, -1.957802, 1, 0.5921569, 0, 1,
-1.299579, -0.4583297, -1.243226, 1, 0.6, 0, 1,
-1.29143, 0.00704353, -0.2013839, 1, 0.6078432, 0, 1,
-1.290433, 0.3954954, -1.09778, 1, 0.6117647, 0, 1,
-1.287267, -0.5876113, -0.6947718, 1, 0.6196079, 0, 1,
-1.284087, -0.1039606, -0.2650553, 1, 0.6235294, 0, 1,
-1.281581, -0.3578443, -2.892179, 1, 0.6313726, 0, 1,
-1.280885, 0.3559888, -0.8039599, 1, 0.6352941, 0, 1,
-1.272781, -0.269663, -2.552925, 1, 0.6431373, 0, 1,
-1.257775, -0.694079, -2.067895, 1, 0.6470588, 0, 1,
-1.255921, 0.1277779, -0.3421924, 1, 0.654902, 0, 1,
-1.253324, -0.6368687, -2.115497, 1, 0.6588235, 0, 1,
-1.24909, 0.2255379, -1.857976, 1, 0.6666667, 0, 1,
-1.244587, 0.6018202, -0.2561064, 1, 0.6705883, 0, 1,
-1.241461, 0.5935959, -0.9352489, 1, 0.6784314, 0, 1,
-1.235107, 0.2050677, -3.15139, 1, 0.682353, 0, 1,
-1.224693, 0.5861512, -0.9918761, 1, 0.6901961, 0, 1,
-1.220846, -0.5795087, -1.638214, 1, 0.6941177, 0, 1,
-1.220239, -0.7736097, -2.040102, 1, 0.7019608, 0, 1,
-1.207934, 0.3744549, 0.1782315, 1, 0.7098039, 0, 1,
-1.19753, -0.9164678, -2.319102, 1, 0.7137255, 0, 1,
-1.193838, 1.192088, -1.355159, 1, 0.7215686, 0, 1,
-1.191884, -0.3377034, -3.266806, 1, 0.7254902, 0, 1,
-1.184944, 0.3399149, -1.16054, 1, 0.7333333, 0, 1,
-1.184629, 2.015841, -0.371354, 1, 0.7372549, 0, 1,
-1.179514, -0.4897036, -2.856958, 1, 0.7450981, 0, 1,
-1.176469, -0.7935225, -2.401384, 1, 0.7490196, 0, 1,
-1.172123, -0.907136, -2.520724, 1, 0.7568628, 0, 1,
-1.171026, -0.2219257, -1.920914, 1, 0.7607843, 0, 1,
-1.165032, -1.752045, -0.886165, 1, 0.7686275, 0, 1,
-1.158439, 0.7976843, -1.30634, 1, 0.772549, 0, 1,
-1.152642, 0.43957, -2.498373, 1, 0.7803922, 0, 1,
-1.144918, -1.28127, -3.232047, 1, 0.7843137, 0, 1,
-1.139149, -0.5914094, -1.944673, 1, 0.7921569, 0, 1,
-1.137894, -1.045904, -0.6799816, 1, 0.7960784, 0, 1,
-1.129395, 0.7792205, -0.2523874, 1, 0.8039216, 0, 1,
-1.12739, 0.9937675, -1.306179, 1, 0.8117647, 0, 1,
-1.110505, -0.603119, -1.61924, 1, 0.8156863, 0, 1,
-1.098733, 2.24447, -0.6001499, 1, 0.8235294, 0, 1,
-1.09349, -2.295891, -1.528051, 1, 0.827451, 0, 1,
-1.089409, -1.525723, -1.968313, 1, 0.8352941, 0, 1,
-1.086028, -2.403818, -3.446689, 1, 0.8392157, 0, 1,
-1.084544, 1.460582, -1.562705, 1, 0.8470588, 0, 1,
-1.08383, 1.489391, -0.9906358, 1, 0.8509804, 0, 1,
-1.081667, -0.9390625, -2.429294, 1, 0.8588235, 0, 1,
-1.074981, -0.5525966, -2.525204, 1, 0.8627451, 0, 1,
-1.069399, 0.02912842, -2.13207, 1, 0.8705882, 0, 1,
-1.0684, 0.2662202, -1.915273, 1, 0.8745098, 0, 1,
-1.058515, 1.191332, -1.770762, 1, 0.8823529, 0, 1,
-1.05735, 1.169856, -0.2615382, 1, 0.8862745, 0, 1,
-1.050603, 0.2076901, -1.892405, 1, 0.8941177, 0, 1,
-1.047276, 1.778671, -0.76943, 1, 0.8980392, 0, 1,
-1.044869, -0.8677416, -1.795644, 1, 0.9058824, 0, 1,
-1.04351, 0.2108731, -0.5854846, 1, 0.9137255, 0, 1,
-1.030355, 0.3182421, -0.4119484, 1, 0.9176471, 0, 1,
-1.027146, -0.2546717, -1.832228, 1, 0.9254902, 0, 1,
-1.024465, 1.063065, 0.6778494, 1, 0.9294118, 0, 1,
-1.020812, -0.3417262, -1.600504, 1, 0.9372549, 0, 1,
-1.016382, 0.4498011, -0.001652365, 1, 0.9411765, 0, 1,
-0.9935874, -1.562726, -2.6802, 1, 0.9490196, 0, 1,
-0.9929348, -0.2920913, -2.178821, 1, 0.9529412, 0, 1,
-0.992471, -1.359979, -1.045451, 1, 0.9607843, 0, 1,
-0.9899232, 0.6872123, -1.048232, 1, 0.9647059, 0, 1,
-0.9894806, 0.188314, -1.362962, 1, 0.972549, 0, 1,
-0.9886982, 0.4113205, -0.6942803, 1, 0.9764706, 0, 1,
-0.9871927, -0.9972625, -3.530337, 1, 0.9843137, 0, 1,
-0.9843298, -0.4614383, -1.198855, 1, 0.9882353, 0, 1,
-0.9838808, 1.199947, -0.5250473, 1, 0.9960784, 0, 1,
-0.9784522, 0.09254079, -0.9937739, 0.9960784, 1, 0, 1,
-0.9715573, 0.8431646, 0.35749, 0.9921569, 1, 0, 1,
-0.9708787, -0.2555997, -1.094425, 0.9843137, 1, 0, 1,
-0.9699855, -0.622511, -3.143886, 0.9803922, 1, 0, 1,
-0.9694601, 1.761811, -1.644737, 0.972549, 1, 0, 1,
-0.9679949, -0.9588362, -3.22459, 0.9686275, 1, 0, 1,
-0.9674211, 0.4909146, -0.4470695, 0.9607843, 1, 0, 1,
-0.9665471, 0.6694336, -0.544571, 0.9568627, 1, 0, 1,
-0.9593953, -0.4133877, -2.868158, 0.9490196, 1, 0, 1,
-0.9568107, -0.2694703, -2.022704, 0.945098, 1, 0, 1,
-0.955365, -0.6904252, -1.338834, 0.9372549, 1, 0, 1,
-0.9487799, 0.3997257, -2.234267, 0.9333333, 1, 0, 1,
-0.9456784, 1.957741, -0.2830114, 0.9254902, 1, 0, 1,
-0.9455541, 0.2318937, -1.173272, 0.9215686, 1, 0, 1,
-0.943623, -1.526156, -2.392331, 0.9137255, 1, 0, 1,
-0.940289, 0.5411731, -0.3397625, 0.9098039, 1, 0, 1,
-0.9338014, 0.8076302, -0.4352169, 0.9019608, 1, 0, 1,
-0.9325162, 0.02745127, -2.133255, 0.8941177, 1, 0, 1,
-0.9283737, -1.269892, -3.347528, 0.8901961, 1, 0, 1,
-0.9279276, -0.1346657, -2.220216, 0.8823529, 1, 0, 1,
-0.9213861, -0.8942863, -1.590526, 0.8784314, 1, 0, 1,
-0.9198785, -0.902052, -4.771516, 0.8705882, 1, 0, 1,
-0.9179106, -1.299111, -2.339829, 0.8666667, 1, 0, 1,
-0.9176989, -0.421956, -2.421704, 0.8588235, 1, 0, 1,
-0.904003, 0.338896, -1.419242, 0.854902, 1, 0, 1,
-0.903439, 1.484521, -1.192944, 0.8470588, 1, 0, 1,
-0.9024358, -1.30492, -2.942154, 0.8431373, 1, 0, 1,
-0.9016843, -0.2180233, -0.4233337, 0.8352941, 1, 0, 1,
-0.900098, 0.302611, -1.735939, 0.8313726, 1, 0, 1,
-0.8985287, -1.267707, -2.664483, 0.8235294, 1, 0, 1,
-0.8897579, 1.007424, -1.777607, 0.8196079, 1, 0, 1,
-0.8882192, 2.089727, -0.1097793, 0.8117647, 1, 0, 1,
-0.8859349, 0.9882703, 0.5545362, 0.8078431, 1, 0, 1,
-0.8838277, 0.815758, -1.071732, 0.8, 1, 0, 1,
-0.8828865, -0.5684326, -2.03405, 0.7921569, 1, 0, 1,
-0.8717569, -1.625028, -1.328725, 0.7882353, 1, 0, 1,
-0.868977, 0.6798257, -1.989479, 0.7803922, 1, 0, 1,
-0.8652412, -0.2389482, -2.416044, 0.7764706, 1, 0, 1,
-0.86312, -0.3464529, -1.920773, 0.7686275, 1, 0, 1,
-0.8618662, 0.2444895, 0.6863658, 0.7647059, 1, 0, 1,
-0.8529454, 0.4996403, -1.209707, 0.7568628, 1, 0, 1,
-0.8519431, 0.2943136, -2.209298, 0.7529412, 1, 0, 1,
-0.8438431, -1.747818, -4.433584, 0.7450981, 1, 0, 1,
-0.8320426, 0.311263, -2.214004, 0.7411765, 1, 0, 1,
-0.8310544, -0.06278921, -4.670843, 0.7333333, 1, 0, 1,
-0.8288993, 0.01671935, -1.533424, 0.7294118, 1, 0, 1,
-0.8266178, 1.895061, -1.990351, 0.7215686, 1, 0, 1,
-0.8264908, -0.3115088, -1.964843, 0.7176471, 1, 0, 1,
-0.8246423, 0.2807619, -1.418555, 0.7098039, 1, 0, 1,
-0.8219244, 0.306492, -1.853276, 0.7058824, 1, 0, 1,
-0.8218257, 0.8520002, 0.3533439, 0.6980392, 1, 0, 1,
-0.8101994, -0.3724682, -2.82601, 0.6901961, 1, 0, 1,
-0.8068892, -0.1126561, -1.005647, 0.6862745, 1, 0, 1,
-0.8050119, 1.264364, -0.5020453, 0.6784314, 1, 0, 1,
-0.7986423, -0.4013371, -2.358917, 0.6745098, 1, 0, 1,
-0.7974198, 2.133367, -1.057846, 0.6666667, 1, 0, 1,
-0.7960621, -2.699342, -2.853368, 0.6627451, 1, 0, 1,
-0.7912049, -0.06288979, -1.238383, 0.654902, 1, 0, 1,
-0.7891814, 0.1601616, 0.3391332, 0.6509804, 1, 0, 1,
-0.7739608, 0.2395786, -2.033239, 0.6431373, 1, 0, 1,
-0.7723461, -0.2800278, -1.319869, 0.6392157, 1, 0, 1,
-0.7495893, 0.9653094, -0.1452622, 0.6313726, 1, 0, 1,
-0.7409259, 0.04826979, -1.586904, 0.627451, 1, 0, 1,
-0.7370963, -0.5231528, -2.8638, 0.6196079, 1, 0, 1,
-0.736531, 0.7411503, -0.6130128, 0.6156863, 1, 0, 1,
-0.7331635, -0.6376011, -3.325272, 0.6078432, 1, 0, 1,
-0.7327013, 0.03269134, -1.38356, 0.6039216, 1, 0, 1,
-0.731904, 0.6849153, -0.2211002, 0.5960785, 1, 0, 1,
-0.7317304, -0.1659733, -0.5520961, 0.5882353, 1, 0, 1,
-0.7279899, 0.6051561, -0.09603645, 0.5843138, 1, 0, 1,
-0.7227273, 0.2880805, -2.264244, 0.5764706, 1, 0, 1,
-0.7189121, -1.130592, -4.050974, 0.572549, 1, 0, 1,
-0.7188415, 0.7810609, -2.845035, 0.5647059, 1, 0, 1,
-0.7142417, -0.07941785, -1.807749, 0.5607843, 1, 0, 1,
-0.7099671, 0.7169208, -1.117846, 0.5529412, 1, 0, 1,
-0.7085576, 0.06261667, -1.257791, 0.5490196, 1, 0, 1,
-0.7048098, -0.9726372, -4.480212, 0.5411765, 1, 0, 1,
-0.6976643, 0.162687, -1.250375, 0.5372549, 1, 0, 1,
-0.6940925, -1.130816, -4.399445, 0.5294118, 1, 0, 1,
-0.6926102, 0.006763765, -1.842774, 0.5254902, 1, 0, 1,
-0.6886936, 0.6901147, 0.8938508, 0.5176471, 1, 0, 1,
-0.6832156, -0.1172319, -4.436584, 0.5137255, 1, 0, 1,
-0.682479, 0.9653518, 0.1521782, 0.5058824, 1, 0, 1,
-0.6773076, 1.240188, -2.067199, 0.5019608, 1, 0, 1,
-0.6765035, 0.7357154, -0.2339567, 0.4941176, 1, 0, 1,
-0.6763008, 0.2724128, -0.9524004, 0.4862745, 1, 0, 1,
-0.672186, -0.4277728, -1.246797, 0.4823529, 1, 0, 1,
-0.6704145, 0.3263962, -0.1702565, 0.4745098, 1, 0, 1,
-0.6679335, -0.7377645, -1.089891, 0.4705882, 1, 0, 1,
-0.6666218, 1.210176, -0.317235, 0.4627451, 1, 0, 1,
-0.6662499, 0.5630203, -2.005097, 0.4588235, 1, 0, 1,
-0.664929, -0.9680014, -3.67198, 0.4509804, 1, 0, 1,
-0.660894, 0.3344989, -0.7831435, 0.4470588, 1, 0, 1,
-0.6535803, -1.395414, 0.8156032, 0.4392157, 1, 0, 1,
-0.653187, 1.188231, 0.2600039, 0.4352941, 1, 0, 1,
-0.6496387, 0.4896078, -0.1864717, 0.427451, 1, 0, 1,
-0.6486914, 0.6030664, -0.8152283, 0.4235294, 1, 0, 1,
-0.6436141, -1.028265, -1.554862, 0.4156863, 1, 0, 1,
-0.6422087, 0.3212113, -1.073421, 0.4117647, 1, 0, 1,
-0.6407386, 1.836281, 0.1442972, 0.4039216, 1, 0, 1,
-0.6319287, 0.3402173, -0.5376286, 0.3960784, 1, 0, 1,
-0.6313493, -0.2466801, -0.5694863, 0.3921569, 1, 0, 1,
-0.6303377, -1.946102, -1.594185, 0.3843137, 1, 0, 1,
-0.6230527, 0.06111205, -2.466275, 0.3803922, 1, 0, 1,
-0.6209584, 0.02899481, -1.193907, 0.372549, 1, 0, 1,
-0.6190609, -0.4681551, -1.358724, 0.3686275, 1, 0, 1,
-0.6109148, 1.529295, -1.067579, 0.3607843, 1, 0, 1,
-0.607325, -0.5579133, -3.591691, 0.3568628, 1, 0, 1,
-0.6062571, -0.9378441, -0.9749186, 0.3490196, 1, 0, 1,
-0.6022952, 0.08515547, -0.2426985, 0.345098, 1, 0, 1,
-0.6020176, -0.5339149, -3.628223, 0.3372549, 1, 0, 1,
-0.5977964, -2.359147, -2.16481, 0.3333333, 1, 0, 1,
-0.596074, 0.100719, 0.2174874, 0.3254902, 1, 0, 1,
-0.5884646, -0.7645053, -4.71237, 0.3215686, 1, 0, 1,
-0.5877516, 0.9059318, -0.04271502, 0.3137255, 1, 0, 1,
-0.583754, 0.7896127, -0.6742945, 0.3098039, 1, 0, 1,
-0.5783366, 1.017984, -1.169726, 0.3019608, 1, 0, 1,
-0.5763791, -0.5649843, -2.132978, 0.2941177, 1, 0, 1,
-0.5740587, 0.3430614, -0.9211665, 0.2901961, 1, 0, 1,
-0.5723373, 0.4373438, -1.823316, 0.282353, 1, 0, 1,
-0.5641617, 1.17089, 0.6351763, 0.2784314, 1, 0, 1,
-0.5586691, -0.9960399, -2.689596, 0.2705882, 1, 0, 1,
-0.5526749, -0.01418147, -3.094636, 0.2666667, 1, 0, 1,
-0.5525124, -1.524843, -3.301727, 0.2588235, 1, 0, 1,
-0.5496734, 0.02110557, -3.44336, 0.254902, 1, 0, 1,
-0.5395818, 0.3661426, -0.6414907, 0.2470588, 1, 0, 1,
-0.5382758, -1.545233, -1.580343, 0.2431373, 1, 0, 1,
-0.5353362, -0.8204466, -3.315336, 0.2352941, 1, 0, 1,
-0.5287386, -1.431955, -2.322091, 0.2313726, 1, 0, 1,
-0.5280275, -0.8534717, -1.660907, 0.2235294, 1, 0, 1,
-0.5273385, -1.1761, -2.510104, 0.2196078, 1, 0, 1,
-0.5268082, -0.8788108, -0.710968, 0.2117647, 1, 0, 1,
-0.5175875, -0.03432899, -1.996138, 0.2078431, 1, 0, 1,
-0.5145917, 1.409212, -1.947174, 0.2, 1, 0, 1,
-0.5141244, -0.7614413, -3.251303, 0.1921569, 1, 0, 1,
-0.5130757, 1.121707, 0.3413837, 0.1882353, 1, 0, 1,
-0.5091781, -0.6250577, -2.082549, 0.1803922, 1, 0, 1,
-0.5081692, -0.3341088, 0.1620952, 0.1764706, 1, 0, 1,
-0.5080823, 0.7487735, 0.8831936, 0.1686275, 1, 0, 1,
-0.5048346, 0.9284416, -0.2175635, 0.1647059, 1, 0, 1,
-0.5017191, 1.463483, 0.2056912, 0.1568628, 1, 0, 1,
-0.5008098, 0.6023812, -2.564902, 0.1529412, 1, 0, 1,
-0.5001736, 0.2067764, 0.2266543, 0.145098, 1, 0, 1,
-0.4915531, -1.081581, -3.484442, 0.1411765, 1, 0, 1,
-0.4897303, -1.706903, -2.008375, 0.1333333, 1, 0, 1,
-0.4860546, 0.2851261, -1.405235, 0.1294118, 1, 0, 1,
-0.4855604, -1.299341, -2.815565, 0.1215686, 1, 0, 1,
-0.4824145, 0.8557135, -1.919548, 0.1176471, 1, 0, 1,
-0.4800713, 0.4541261, -1.805841, 0.1098039, 1, 0, 1,
-0.4758978, 0.7360836, -0.2975547, 0.1058824, 1, 0, 1,
-0.4706678, 1.749388, -0.7291986, 0.09803922, 1, 0, 1,
-0.4604837, 1.013878, -0.4802998, 0.09019608, 1, 0, 1,
-0.4598556, -0.4552033, -2.853795, 0.08627451, 1, 0, 1,
-0.4576397, 0.07885897, 0.1433152, 0.07843138, 1, 0, 1,
-0.454031, 1.768542, -0.2837205, 0.07450981, 1, 0, 1,
-0.450853, -1.080359, -1.80889, 0.06666667, 1, 0, 1,
-0.4503665, -0.06482074, -2.824792, 0.0627451, 1, 0, 1,
-0.4488119, -0.3536884, -1.884146, 0.05490196, 1, 0, 1,
-0.4438928, -0.3446115, -2.506797, 0.05098039, 1, 0, 1,
-0.4347247, 0.6325927, -0.1533234, 0.04313726, 1, 0, 1,
-0.4347172, 0.3114105, -1.615241, 0.03921569, 1, 0, 1,
-0.429014, 0.5922523, -1.434723, 0.03137255, 1, 0, 1,
-0.4265703, 0.5385714, -1.188619, 0.02745098, 1, 0, 1,
-0.4250655, 0.748744, -0.9045735, 0.01960784, 1, 0, 1,
-0.4203787, -0.181624, -1.951052, 0.01568628, 1, 0, 1,
-0.414718, 0.08531457, -0.6512397, 0.007843138, 1, 0, 1,
-0.4110169, 0.9533747, 0.5588189, 0.003921569, 1, 0, 1,
-0.3983281, 0.8122398, 1.023407, 0, 1, 0.003921569, 1,
-0.3944459, 1.04165, 2.965211, 0, 1, 0.01176471, 1,
-0.3851815, -0.01974403, -2.038007, 0, 1, 0.01568628, 1,
-0.3843868, -1.735002, -3.357672, 0, 1, 0.02352941, 1,
-0.3814998, 0.2605537, -1.128362, 0, 1, 0.02745098, 1,
-0.3809232, -0.4508813, -2.254202, 0, 1, 0.03529412, 1,
-0.3782373, 1.396413, -0.4176622, 0, 1, 0.03921569, 1,
-0.3778688, -0.9282542, -1.592645, 0, 1, 0.04705882, 1,
-0.3733983, -2.385061, -4.274383, 0, 1, 0.05098039, 1,
-0.3705828, 1.703692, -0.4189557, 0, 1, 0.05882353, 1,
-0.3705285, 0.2124739, 1.118605, 0, 1, 0.0627451, 1,
-0.3704883, 0.5853111, 0.08907587, 0, 1, 0.07058824, 1,
-0.3632901, -0.9841939, -1.746743, 0, 1, 0.07450981, 1,
-0.3615982, 0.1117643, -0.2501526, 0, 1, 0.08235294, 1,
-0.359369, -0.7320416, -2.299937, 0, 1, 0.08627451, 1,
-0.3567119, -0.5724388, -4.117283, 0, 1, 0.09411765, 1,
-0.3553593, -0.9361678, -2.176224, 0, 1, 0.1019608, 1,
-0.35451, -2.959394, -2.553271, 0, 1, 0.1058824, 1,
-0.3525812, -0.02040918, -1.568398, 0, 1, 0.1137255, 1,
-0.3458035, 1.049562, -0.2887291, 0, 1, 0.1176471, 1,
-0.3441889, 1.291291, -2.047628, 0, 1, 0.1254902, 1,
-0.3438578, -0.7582468, -3.237706, 0, 1, 0.1294118, 1,
-0.3422453, -0.3055542, -3.121783, 0, 1, 0.1372549, 1,
-0.3414796, 0.6576226, -0.7974555, 0, 1, 0.1411765, 1,
-0.341383, -0.6967217, -3.468034, 0, 1, 0.1490196, 1,
-0.3297834, -1.911102, -3.23258, 0, 1, 0.1529412, 1,
-0.3294139, 1.424801, 1.543622, 0, 1, 0.1607843, 1,
-0.32548, 0.5118183, -0.1829316, 0, 1, 0.1647059, 1,
-0.3135734, -0.008520423, -1.629086, 0, 1, 0.172549, 1,
-0.3131129, 1.482362, -1.683623, 0, 1, 0.1764706, 1,
-0.3127201, -0.2979923, -1.581945, 0, 1, 0.1843137, 1,
-0.3071528, -1.439506, -2.939918, 0, 1, 0.1882353, 1,
-0.306605, -0.7520336, -3.930121, 0, 1, 0.1960784, 1,
-0.2961856, -0.3735503, -2.047153, 0, 1, 0.2039216, 1,
-0.294472, -0.415656, -2.282243, 0, 1, 0.2078431, 1,
-0.2934628, -0.1009306, -2.02399, 0, 1, 0.2156863, 1,
-0.2826461, -0.9391546, -2.680407, 0, 1, 0.2196078, 1,
-0.278823, -0.7072144, -3.397168, 0, 1, 0.227451, 1,
-0.2755601, 1.980814, 0.6643597, 0, 1, 0.2313726, 1,
-0.2734021, -0.9592431, -2.796605, 0, 1, 0.2392157, 1,
-0.2713293, 0.3691667, -1.819581, 0, 1, 0.2431373, 1,
-0.2713248, -0.04188975, -1.241441, 0, 1, 0.2509804, 1,
-0.2707029, -0.4945376, -1.795952, 0, 1, 0.254902, 1,
-0.2577547, 1.784932, 0.002742997, 0, 1, 0.2627451, 1,
-0.2550466, -2.404552, -4.54496, 0, 1, 0.2666667, 1,
-0.252476, -0.6674928, -3.756828, 0, 1, 0.2745098, 1,
-0.2519557, 1.274171, -0.7689083, 0, 1, 0.2784314, 1,
-0.2512231, 0.6935767, 0.7576504, 0, 1, 0.2862745, 1,
-0.2500302, -1.028085, -3.270231, 0, 1, 0.2901961, 1,
-0.2410306, 0.1273908, -2.518303, 0, 1, 0.2980392, 1,
-0.2374051, 0.4003453, 0.4275833, 0, 1, 0.3058824, 1,
-0.2366957, -0.5535193, -1.661374, 0, 1, 0.3098039, 1,
-0.2354069, -0.05020401, -2.987853, 0, 1, 0.3176471, 1,
-0.2317623, 0.8634872, 0.04574402, 0, 1, 0.3215686, 1,
-0.2314802, -0.4751511, -3.172905, 0, 1, 0.3294118, 1,
-0.2290968, 0.7817035, -0.05063705, 0, 1, 0.3333333, 1,
-0.2244155, 0.6804169, -0.1624834, 0, 1, 0.3411765, 1,
-0.2216118, -0.2785702, -3.179809, 0, 1, 0.345098, 1,
-0.2193632, -0.07754139, -2.209368, 0, 1, 0.3529412, 1,
-0.21928, -1.31666, -2.639937, 0, 1, 0.3568628, 1,
-0.2173487, 0.478366, -0.4464626, 0, 1, 0.3647059, 1,
-0.216513, 1.293544, 0.9807268, 0, 1, 0.3686275, 1,
-0.2163074, -1.0355, -3.68016, 0, 1, 0.3764706, 1,
-0.215142, 0.3485758, -0.4498303, 0, 1, 0.3803922, 1,
-0.2135236, 1.264018, 1.397459, 0, 1, 0.3882353, 1,
-0.2128407, 0.4958542, -0.5231957, 0, 1, 0.3921569, 1,
-0.2124678, -0.01404162, -3.081097, 0, 1, 0.4, 1,
-0.2108585, -0.8411225, -2.857667, 0, 1, 0.4078431, 1,
-0.2046632, -1.518044, -1.093533, 0, 1, 0.4117647, 1,
-0.2026443, -0.03195268, -2.263683, 0, 1, 0.4196078, 1,
-0.2022565, 0.03941353, -2.047393, 0, 1, 0.4235294, 1,
-0.1985194, -3.025236, -2.498605, 0, 1, 0.4313726, 1,
-0.1984143, 1.657588, 0.004652959, 0, 1, 0.4352941, 1,
-0.1980935, 1.290209, 0.2688194, 0, 1, 0.4431373, 1,
-0.1979219, -1.169765, -4.316588, 0, 1, 0.4470588, 1,
-0.1960509, 0.7921542, 0.3838243, 0, 1, 0.454902, 1,
-0.1957155, 0.123367, -1.400462, 0, 1, 0.4588235, 1,
-0.1937037, -0.1108601, -3.646046, 0, 1, 0.4666667, 1,
-0.1929678, -0.2398604, -2.173184, 0, 1, 0.4705882, 1,
-0.1915349, 0.03994079, -2.455552, 0, 1, 0.4784314, 1,
-0.1903755, 1.931257, -1.127504, 0, 1, 0.4823529, 1,
-0.1880603, -0.540449, -3.781344, 0, 1, 0.4901961, 1,
-0.1834627, -0.5676821, -4.252084, 0, 1, 0.4941176, 1,
-0.1829149, -0.1134977, -1.089987, 0, 1, 0.5019608, 1,
-0.1821308, -0.3339576, -1.404224, 0, 1, 0.509804, 1,
-0.1783532, 0.8755872, -1.084237, 0, 1, 0.5137255, 1,
-0.177816, -0.6351206, -3.088553, 0, 1, 0.5215687, 1,
-0.1775219, -0.07360396, -1.042132, 0, 1, 0.5254902, 1,
-0.1758872, 0.9212024, 0.1657552, 0, 1, 0.5333334, 1,
-0.1733098, -1.434524, -2.696684, 0, 1, 0.5372549, 1,
-0.1665658, 0.08197508, -3.033993, 0, 1, 0.5450981, 1,
-0.1652104, 0.9662786, 0.5822138, 0, 1, 0.5490196, 1,
-0.1600474, -0.775539, -1.916756, 0, 1, 0.5568628, 1,
-0.1599777, 1.524619, 0.2946216, 0, 1, 0.5607843, 1,
-0.1590838, -0.4460456, -2.93912, 0, 1, 0.5686275, 1,
-0.1566862, 0.2327052, 1.054168, 0, 1, 0.572549, 1,
-0.1563548, -0.1177061, -3.541379, 0, 1, 0.5803922, 1,
-0.1556177, -0.08921029, -1.607536, 0, 1, 0.5843138, 1,
-0.151046, 1.746825, -0.3029162, 0, 1, 0.5921569, 1,
-0.148982, -0.6292445, -3.520733, 0, 1, 0.5960785, 1,
-0.1422148, 1.992601, 1.017345, 0, 1, 0.6039216, 1,
-0.1395695, -0.4026358, -2.490444, 0, 1, 0.6117647, 1,
-0.1392217, 0.3391683, 0.3298193, 0, 1, 0.6156863, 1,
-0.1379792, 0.1643311, -0.5475879, 0, 1, 0.6235294, 1,
-0.1372616, 0.2621375, 0.6694202, 0, 1, 0.627451, 1,
-0.136787, 0.6806312, 0.03900613, 0, 1, 0.6352941, 1,
-0.1358511, 0.3046483, -1.267802, 0, 1, 0.6392157, 1,
-0.1342547, -0.1665784, -2.798032, 0, 1, 0.6470588, 1,
-0.1298873, 1.975342, 1.381407, 0, 1, 0.6509804, 1,
-0.1269551, 0.7188979, -0.9534271, 0, 1, 0.6588235, 1,
-0.1258372, -1.219422, -2.70428, 0, 1, 0.6627451, 1,
-0.1243741, 1.005097, -0.6969792, 0, 1, 0.6705883, 1,
-0.1215151, 1.965386, -0.4608897, 0, 1, 0.6745098, 1,
-0.1199312, -1.448318, -2.773912, 0, 1, 0.682353, 1,
-0.1183, -0.5075279, -3.155604, 0, 1, 0.6862745, 1,
-0.1178561, 0.02049772, -0.5409898, 0, 1, 0.6941177, 1,
-0.1154469, 1.80187, -2.350723, 0, 1, 0.7019608, 1,
-0.1112349, -1.091276, -3.481821, 0, 1, 0.7058824, 1,
-0.1107427, 0.1057503, 0.7784935, 0, 1, 0.7137255, 1,
-0.1088147, -1.815667, -4.743196, 0, 1, 0.7176471, 1,
-0.1073985, 1.095192, -0.3336806, 0, 1, 0.7254902, 1,
-0.1055715, -0.9329345, -1.205352, 0, 1, 0.7294118, 1,
-0.09814474, -0.9058179, -2.631189, 0, 1, 0.7372549, 1,
-0.09580638, -1.103717, -3.196043, 0, 1, 0.7411765, 1,
-0.08863994, 2.649191, 0.4275163, 0, 1, 0.7490196, 1,
-0.08861072, -1.42758, -2.697048, 0, 1, 0.7529412, 1,
-0.08829276, 0.5359263, -0.1896341, 0, 1, 0.7607843, 1,
-0.08511922, 1.29285, 1.572573, 0, 1, 0.7647059, 1,
-0.08065551, 0.07754681, -0.03065513, 0, 1, 0.772549, 1,
-0.08050395, 0.9634977, -0.8227203, 0, 1, 0.7764706, 1,
-0.0790847, -0.4508878, -2.630877, 0, 1, 0.7843137, 1,
-0.07820535, 0.3260617, -0.2200615, 0, 1, 0.7882353, 1,
-0.07744981, -0.4581267, -2.623409, 0, 1, 0.7960784, 1,
-0.07644837, 1.453969, 0.6602004, 0, 1, 0.8039216, 1,
-0.07521462, -1.095197, -2.415937, 0, 1, 0.8078431, 1,
-0.06809694, -2.177254, -2.918429, 0, 1, 0.8156863, 1,
-0.0668226, 0.1216984, -1.11309, 0, 1, 0.8196079, 1,
-0.06239653, 2.107495, -0.9359407, 0, 1, 0.827451, 1,
-0.06235436, 1.989606, 1.037782, 0, 1, 0.8313726, 1,
-0.0528082, 0.0931685, -0.06810559, 0, 1, 0.8392157, 1,
-0.05061872, -1.631336, -3.147577, 0, 1, 0.8431373, 1,
-0.04868945, 1.574958, -0.4963085, 0, 1, 0.8509804, 1,
-0.04658007, -1.012274, -2.839897, 0, 1, 0.854902, 1,
-0.04518845, -0.2875659, -4.067953, 0, 1, 0.8627451, 1,
-0.04269022, -0.3303655, -1.456925, 0, 1, 0.8666667, 1,
-0.04188876, -0.5931043, -1.415311, 0, 1, 0.8745098, 1,
-0.04184214, -0.3853621, -2.988399, 0, 1, 0.8784314, 1,
-0.0408557, 1.453247, -0.443837, 0, 1, 0.8862745, 1,
-0.0403266, -0.6347774, -3.120864, 0, 1, 0.8901961, 1,
-0.03636948, -0.4253732, -2.653065, 0, 1, 0.8980392, 1,
-0.03552429, -0.5283633, -2.340354, 0, 1, 0.9058824, 1,
-0.03493904, -1.120471, -1.449602, 0, 1, 0.9098039, 1,
-0.03399573, 0.2682104, 0.6191316, 0, 1, 0.9176471, 1,
-0.03188527, 1.235567, -0.2832017, 0, 1, 0.9215686, 1,
-0.03068583, -0.8780096, -2.606258, 0, 1, 0.9294118, 1,
-0.02966825, 0.5847003, -1.959023, 0, 1, 0.9333333, 1,
-0.0286971, -0.8613715, -2.0332, 0, 1, 0.9411765, 1,
-0.02327986, 1.506946, -0.6404147, 0, 1, 0.945098, 1,
-0.01955152, 0.4404754, -1.072997, 0, 1, 0.9529412, 1,
-0.01905669, 0.4864434, -0.7498924, 0, 1, 0.9568627, 1,
-0.01654504, -0.03367602, -4.091568, 0, 1, 0.9647059, 1,
-0.0152472, -0.7729197, -3.77128, 0, 1, 0.9686275, 1,
-0.0137174, -0.9861651, -3.490809, 0, 1, 0.9764706, 1,
-0.009701609, -0.5075905, -2.656376, 0, 1, 0.9803922, 1,
-0.005163053, -0.8819856, -3.196677, 0, 1, 0.9882353, 1,
-0.002054484, 0.6970854, -1.51351, 0, 1, 0.9921569, 1,
-0.001275022, -1.233419, -1.575394, 0, 1, 1, 1,
0.001250739, 0.4113272, -0.3761179, 0, 0.9921569, 1, 1,
0.002984113, 0.3958666, 1.078644, 0, 0.9882353, 1, 1,
0.004774974, 0.08267315, 0.5754491, 0, 0.9803922, 1, 1,
0.005253813, 0.6305439, 0.2908895, 0, 0.9764706, 1, 1,
0.006895454, 0.3741335, 1.533177, 0, 0.9686275, 1, 1,
0.007813023, 0.3744926, -0.2464808, 0, 0.9647059, 1, 1,
0.009370873, 1.006056, -0.06801058, 0, 0.9568627, 1, 1,
0.009755668, 1.248964, 0.1475775, 0, 0.9529412, 1, 1,
0.01896483, -0.9462394, 4.590316, 0, 0.945098, 1, 1,
0.01910836, -0.1425387, 1.771643, 0, 0.9411765, 1, 1,
0.02459126, -0.2995014, 3.033376, 0, 0.9333333, 1, 1,
0.02467971, 2.177192, 0.5160503, 0, 0.9294118, 1, 1,
0.02763156, -1.017271, 1.889253, 0, 0.9215686, 1, 1,
0.02832671, -0.1125753, 3.158816, 0, 0.9176471, 1, 1,
0.03013666, -0.1242089, 2.028691, 0, 0.9098039, 1, 1,
0.03527563, 0.7635847, -0.4667026, 0, 0.9058824, 1, 1,
0.03528009, 1.131045, 0.3549215, 0, 0.8980392, 1, 1,
0.035972, 0.7381148, 1.96341, 0, 0.8901961, 1, 1,
0.0361348, 1.171433, 0.6993555, 0, 0.8862745, 1, 1,
0.03759803, 0.6916478, -1.410363, 0, 0.8784314, 1, 1,
0.03922524, 0.3497039, -0.8765203, 0, 0.8745098, 1, 1,
0.04120667, 0.1904599, 0.7190127, 0, 0.8666667, 1, 1,
0.04393144, -1.045538, 1.300442, 0, 0.8627451, 1, 1,
0.04481723, 0.7794898, -0.759543, 0, 0.854902, 1, 1,
0.0453851, -0.1457631, 3.002781, 0, 0.8509804, 1, 1,
0.04653369, -0.3823394, 2.980844, 0, 0.8431373, 1, 1,
0.04817084, 1.781838, 0.9577731, 0, 0.8392157, 1, 1,
0.05707391, -0.02340632, 1.084724, 0, 0.8313726, 1, 1,
0.05957311, 1.138844, 1.874182, 0, 0.827451, 1, 1,
0.06039462, 1.427021, -0.7395396, 0, 0.8196079, 1, 1,
0.063393, -0.1460804, 2.167038, 0, 0.8156863, 1, 1,
0.06646127, -0.9174362, 4.373196, 0, 0.8078431, 1, 1,
0.06930194, -0.5369835, 4.128217, 0, 0.8039216, 1, 1,
0.06963323, 0.1200242, 0.9389957, 0, 0.7960784, 1, 1,
0.0723291, 2.534263, -0.1222327, 0, 0.7882353, 1, 1,
0.07234374, 1.146726, -1.49181, 0, 0.7843137, 1, 1,
0.07642124, 0.9592817, -0.3388024, 0, 0.7764706, 1, 1,
0.07717765, -1.141499, 2.539771, 0, 0.772549, 1, 1,
0.07843443, 0.6245952, -0.8213358, 0, 0.7647059, 1, 1,
0.07906013, 2.73682, -1.735967, 0, 0.7607843, 1, 1,
0.08122699, 0.07463314, 1.575117, 0, 0.7529412, 1, 1,
0.08996036, -0.9407414, 3.306324, 0, 0.7490196, 1, 1,
0.09311582, -0.2014656, 3.370163, 0, 0.7411765, 1, 1,
0.09854954, -0.2752725, 2.840884, 0, 0.7372549, 1, 1,
0.09993744, -0.07288991, 2.994541, 0, 0.7294118, 1, 1,
0.1108061, -0.7189855, 1.598825, 0, 0.7254902, 1, 1,
0.1138146, -0.3313185, 2.46054, 0, 0.7176471, 1, 1,
0.1145051, 0.1026122, 0.846108, 0, 0.7137255, 1, 1,
0.1157889, 0.3643174, -0.2457673, 0, 0.7058824, 1, 1,
0.1164163, 0.1023792, -0.1429397, 0, 0.6980392, 1, 1,
0.1177796, 0.1250176, 0.2388485, 0, 0.6941177, 1, 1,
0.1198389, 0.1455675, -0.9248299, 0, 0.6862745, 1, 1,
0.1296624, -0.9759815, 2.868734, 0, 0.682353, 1, 1,
0.1298476, 0.7060188, 1.286824, 0, 0.6745098, 1, 1,
0.133893, -0.526557, 2.435836, 0, 0.6705883, 1, 1,
0.1351449, 1.019789, -0.6718872, 0, 0.6627451, 1, 1,
0.13673, -0.7573779, 3.715781, 0, 0.6588235, 1, 1,
0.1391309, -0.01648989, 1.847093, 0, 0.6509804, 1, 1,
0.139905, -0.5436639, 4.000229, 0, 0.6470588, 1, 1,
0.1430233, -0.6578426, 1.188253, 0, 0.6392157, 1, 1,
0.1470844, 0.06778857, 0.1130153, 0, 0.6352941, 1, 1,
0.1505242, -0.774519, 3.499411, 0, 0.627451, 1, 1,
0.1520179, -0.9389535, 2.112408, 0, 0.6235294, 1, 1,
0.152024, -0.2856129, 2.011721, 0, 0.6156863, 1, 1,
0.1527416, -0.9027489, 3.199231, 0, 0.6117647, 1, 1,
0.1532395, -0.4648782, 2.358729, 0, 0.6039216, 1, 1,
0.1569079, -1.389208, 2.100639, 0, 0.5960785, 1, 1,
0.1571193, 0.1604152, 0.1537069, 0, 0.5921569, 1, 1,
0.1702001, 0.6430094, 0.5376924, 0, 0.5843138, 1, 1,
0.1738371, -0.699115, 2.706164, 0, 0.5803922, 1, 1,
0.1766929, -0.02557827, 2.485913, 0, 0.572549, 1, 1,
0.177373, 0.3514279, 1.555349, 0, 0.5686275, 1, 1,
0.182921, 1.242133, 0.2730345, 0, 0.5607843, 1, 1,
0.185831, 0.260653, 1.621475, 0, 0.5568628, 1, 1,
0.1866612, -1.409099, 3.542669, 0, 0.5490196, 1, 1,
0.187153, 1.191019, -1.001129, 0, 0.5450981, 1, 1,
0.1918734, -0.439116, 0.4014294, 0, 0.5372549, 1, 1,
0.1935115, 0.2091826, 1.588619, 0, 0.5333334, 1, 1,
0.1990657, -1.500943, 2.951429, 0, 0.5254902, 1, 1,
0.2029517, -0.3116102, 2.019183, 0, 0.5215687, 1, 1,
0.2054961, 1.099338, 2.67587, 0, 0.5137255, 1, 1,
0.216756, -1.684599, 4.277434, 0, 0.509804, 1, 1,
0.2188824, 0.2783795, 0.2954351, 0, 0.5019608, 1, 1,
0.2233166, -0.1806931, 1.834551, 0, 0.4941176, 1, 1,
0.2280737, 0.02859143, 1.196012, 0, 0.4901961, 1, 1,
0.2312035, -1.843317, 3.582014, 0, 0.4823529, 1, 1,
0.2347558, 0.751299, 0.04498915, 0, 0.4784314, 1, 1,
0.2355684, -1.713091, 2.569797, 0, 0.4705882, 1, 1,
0.2383348, 0.672891, -0.04077914, 0, 0.4666667, 1, 1,
0.243363, -0.3470247, 2.212418, 0, 0.4588235, 1, 1,
0.2439965, 1.925184, 0.05597018, 0, 0.454902, 1, 1,
0.2451929, 0.3812129, 0.3942559, 0, 0.4470588, 1, 1,
0.245453, -0.5980817, 3.15582, 0, 0.4431373, 1, 1,
0.2476143, 0.9113792, 1.180086, 0, 0.4352941, 1, 1,
0.2480747, 0.8983237, -0.02103261, 0, 0.4313726, 1, 1,
0.2496022, 0.7593004, 1.098145, 0, 0.4235294, 1, 1,
0.2496896, 0.2493095, 0.4309793, 0, 0.4196078, 1, 1,
0.2504185, 0.7232152, 0.4391357, 0, 0.4117647, 1, 1,
0.2535228, 1.175339, -0.5013243, 0, 0.4078431, 1, 1,
0.2667694, -0.436123, 2.690515, 0, 0.4, 1, 1,
0.2676822, 0.6735545, -0.5342818, 0, 0.3921569, 1, 1,
0.2678835, 0.7665864, -1.252416, 0, 0.3882353, 1, 1,
0.2687828, -1.76384, 3.001693, 0, 0.3803922, 1, 1,
0.2697337, -1.620341, 3.258777, 0, 0.3764706, 1, 1,
0.2712685, 1.594062, 0.5233268, 0, 0.3686275, 1, 1,
0.2757889, 2.503874, -0.8336225, 0, 0.3647059, 1, 1,
0.2816526, -1.916506, 2.014722, 0, 0.3568628, 1, 1,
0.2895387, 0.1556985, 1.207837, 0, 0.3529412, 1, 1,
0.2914583, 1.281764, 2.570355, 0, 0.345098, 1, 1,
0.2915965, -1.058726, 2.621963, 0, 0.3411765, 1, 1,
0.2958106, -1.20026, 3.501832, 0, 0.3333333, 1, 1,
0.297796, -0.1866023, 4.199251, 0, 0.3294118, 1, 1,
0.2989108, 0.96167, -0.4751842, 0, 0.3215686, 1, 1,
0.3002763, 0.2141824, -2.097207, 0, 0.3176471, 1, 1,
0.3042024, -0.4813858, 3.825663, 0, 0.3098039, 1, 1,
0.3098702, -1.974108, 2.633498, 0, 0.3058824, 1, 1,
0.3099992, -1.032122, 3.739198, 0, 0.2980392, 1, 1,
0.3130805, 0.3719894, -0.5397331, 0, 0.2901961, 1, 1,
0.3133458, -0.7144712, 2.268366, 0, 0.2862745, 1, 1,
0.3197252, -0.2691243, 2.01788, 0, 0.2784314, 1, 1,
0.3199149, 0.2093375, 0.2330539, 0, 0.2745098, 1, 1,
0.3219435, 2.603915, 1.397729, 0, 0.2666667, 1, 1,
0.3234955, -2.457758, 1.76343, 0, 0.2627451, 1, 1,
0.3262038, 1.250664, -0.3016203, 0, 0.254902, 1, 1,
0.3264563, 1.362343, -0.06888677, 0, 0.2509804, 1, 1,
0.327435, 0.01676636, 1.878774, 0, 0.2431373, 1, 1,
0.3287165, -0.1950616, 0.5901301, 0, 0.2392157, 1, 1,
0.329189, 0.1334788, 1.256112, 0, 0.2313726, 1, 1,
0.3305084, 0.1350943, 1.235109, 0, 0.227451, 1, 1,
0.3310222, 0.6242317, -0.6157247, 0, 0.2196078, 1, 1,
0.3333982, -1.775065, 2.748014, 0, 0.2156863, 1, 1,
0.3358022, 0.6095454, 0.4484229, 0, 0.2078431, 1, 1,
0.3412081, -0.9106267, 0.7999725, 0, 0.2039216, 1, 1,
0.3467279, -0.5231251, 2.484921, 0, 0.1960784, 1, 1,
0.3508036, 0.4921223, 0.9216096, 0, 0.1882353, 1, 1,
0.3515746, -1.683104, 4.55128, 0, 0.1843137, 1, 1,
0.3539656, -0.7010438, 3.120443, 0, 0.1764706, 1, 1,
0.3554476, 0.7476597, 0.6040478, 0, 0.172549, 1, 1,
0.357267, 0.8605255, -1.186531, 0, 0.1647059, 1, 1,
0.3661614, 0.1727797, 1.170176, 0, 0.1607843, 1, 1,
0.3665138, -0.2486875, 2.123545, 0, 0.1529412, 1, 1,
0.3676828, -0.6130763, 3.037483, 0, 0.1490196, 1, 1,
0.3706837, -0.5560627, 4.262305, 0, 0.1411765, 1, 1,
0.3708078, 0.4117918, 1.039598, 0, 0.1372549, 1, 1,
0.3718396, -0.07961868, 1.666921, 0, 0.1294118, 1, 1,
0.3751816, -0.4127057, 2.149272, 0, 0.1254902, 1, 1,
0.3754374, 0.6057186, 0.8524733, 0, 0.1176471, 1, 1,
0.3786855, 0.8253861, 3.247066, 0, 0.1137255, 1, 1,
0.3844203, -0.7379898, 3.287482, 0, 0.1058824, 1, 1,
0.3879463, -0.3703118, 1.789297, 0, 0.09803922, 1, 1,
0.3881896, -1.497217, 3.233737, 0, 0.09411765, 1, 1,
0.3927327, -0.8557904, 2.767565, 0, 0.08627451, 1, 1,
0.3939031, 3.131476, -0.4829538, 0, 0.08235294, 1, 1,
0.3955681, 1.056122, 1.022642, 0, 0.07450981, 1, 1,
0.395682, -0.2201389, 2.525951, 0, 0.07058824, 1, 1,
0.3962522, 0.1772012, -0.8780283, 0, 0.0627451, 1, 1,
0.3982157, 1.146381, 1.16002, 0, 0.05882353, 1, 1,
0.403728, 0.1367723, -0.0007639489, 0, 0.05098039, 1, 1,
0.4054434, 0.594241, -0.1163527, 0, 0.04705882, 1, 1,
0.4059271, -0.6348416, 0.3622881, 0, 0.03921569, 1, 1,
0.4208617, -0.8543903, 5.256594, 0, 0.03529412, 1, 1,
0.426138, 0.3792884, 0.6019145, 0, 0.02745098, 1, 1,
0.4261517, -0.5821779, 2.635844, 0, 0.02352941, 1, 1,
0.4298757, 0.162459, 1.194043, 0, 0.01568628, 1, 1,
0.4311008, -1.908877, 2.671003, 0, 0.01176471, 1, 1,
0.4313731, 0.2935326, 0.9694233, 0, 0.003921569, 1, 1,
0.4362809, -1.743428, 2.179157, 0.003921569, 0, 1, 1,
0.4389211, -0.07646563, 2.039326, 0.007843138, 0, 1, 1,
0.4406226, -0.04373404, 1.340462, 0.01568628, 0, 1, 1,
0.4542165, -1.176543, 2.963139, 0.01960784, 0, 1, 1,
0.4547864, 1.760995, 0.6704652, 0.02745098, 0, 1, 1,
0.4581651, -0.4449951, 3.564846, 0.03137255, 0, 1, 1,
0.4614667, -0.4249256, 2.960715, 0.03921569, 0, 1, 1,
0.462946, -1.404208, 3.391325, 0.04313726, 0, 1, 1,
0.4672537, 0.7085229, 0.3291, 0.05098039, 0, 1, 1,
0.4686444, 1.461456, 1.329189, 0.05490196, 0, 1, 1,
0.4701147, -0.6653509, 4.06993, 0.0627451, 0, 1, 1,
0.4705679, -0.4303185, 2.47554, 0.06666667, 0, 1, 1,
0.4725373, -0.769433, 1.853536, 0.07450981, 0, 1, 1,
0.4734091, 0.3486112, 0.2665204, 0.07843138, 0, 1, 1,
0.4734834, -0.9817631, 5.179938, 0.08627451, 0, 1, 1,
0.4795026, -1.298678, 1.182987, 0.09019608, 0, 1, 1,
0.4842479, 0.151923, 1.086768, 0.09803922, 0, 1, 1,
0.4920203, 0.3546401, -0.7127259, 0.1058824, 0, 1, 1,
0.4936872, -1.757937, 5.044055, 0.1098039, 0, 1, 1,
0.4955021, -0.2902437, 1.971246, 0.1176471, 0, 1, 1,
0.4962654, 0.4724694, 0.4977696, 0.1215686, 0, 1, 1,
0.5025225, -2.149571, 4.306739, 0.1294118, 0, 1, 1,
0.5027717, 1.048702, 0.7742254, 0.1333333, 0, 1, 1,
0.5048971, 0.8591458, -1.413964, 0.1411765, 0, 1, 1,
0.5060178, -0.1425698, 1.307415, 0.145098, 0, 1, 1,
0.5080203, 1.18933, 1.226562, 0.1529412, 0, 1, 1,
0.5084211, -1.390601, 1.865913, 0.1568628, 0, 1, 1,
0.5084322, 1.045057, 0.845162, 0.1647059, 0, 1, 1,
0.5160642, -1.132454, 2.578515, 0.1686275, 0, 1, 1,
0.5220425, -1.565583, 4.845792, 0.1764706, 0, 1, 1,
0.5270835, 0.7095943, 0.9930885, 0.1803922, 0, 1, 1,
0.5291519, -0.2383837, 2.531344, 0.1882353, 0, 1, 1,
0.5369026, 2.813091, 1.957581, 0.1921569, 0, 1, 1,
0.541424, -1.288471, 2.353877, 0.2, 0, 1, 1,
0.5420077, 0.5698522, 1.481834, 0.2078431, 0, 1, 1,
0.5424301, -0.9269814, 3.00997, 0.2117647, 0, 1, 1,
0.5443886, 1.468615, 1.017706, 0.2196078, 0, 1, 1,
0.5468513, -0.7538881, 1.908417, 0.2235294, 0, 1, 1,
0.5530921, -0.1820626, 2.752903, 0.2313726, 0, 1, 1,
0.5536096, 0.06713479, 0.1234005, 0.2352941, 0, 1, 1,
0.5537019, 0.8996958, 1.60412, 0.2431373, 0, 1, 1,
0.5626922, 0.06359555, 0.2008596, 0.2470588, 0, 1, 1,
0.5667091, 0.9739614, -0.3369171, 0.254902, 0, 1, 1,
0.5701148, 0.5971336, -0.2057911, 0.2588235, 0, 1, 1,
0.5712988, 0.779951, -0.2303179, 0.2666667, 0, 1, 1,
0.5724452, -1.246576, 3.998144, 0.2705882, 0, 1, 1,
0.5804019, -1.312689, 3.782378, 0.2784314, 0, 1, 1,
0.5818299, -1.028439, 4.036198, 0.282353, 0, 1, 1,
0.5830479, -0.1827514, 1.533967, 0.2901961, 0, 1, 1,
0.584725, 0.6092415, 1.314384, 0.2941177, 0, 1, 1,
0.5853765, -0.2273737, 2.880058, 0.3019608, 0, 1, 1,
0.5887784, -1.42917, 4.016512, 0.3098039, 0, 1, 1,
0.5922569, 1.840143, -1.357407, 0.3137255, 0, 1, 1,
0.5922844, -0.03720413, 0.5873466, 0.3215686, 0, 1, 1,
0.5935929, -1.257832, 2.568872, 0.3254902, 0, 1, 1,
0.5967827, 1.259531, -0.764959, 0.3333333, 0, 1, 1,
0.5997596, 0.5720117, 1.257093, 0.3372549, 0, 1, 1,
0.6016865, -1.684987, 3.806752, 0.345098, 0, 1, 1,
0.6028184, -1.407008, 3.385907, 0.3490196, 0, 1, 1,
0.6044034, 1.060945, -1.2205, 0.3568628, 0, 1, 1,
0.6047926, -0.9580082, 3.616637, 0.3607843, 0, 1, 1,
0.610876, 0.7105083, -0.04714908, 0.3686275, 0, 1, 1,
0.6145967, -0.1680548, 1.406717, 0.372549, 0, 1, 1,
0.6152841, -0.365441, 2.135337, 0.3803922, 0, 1, 1,
0.622121, -2.194559, 2.861248, 0.3843137, 0, 1, 1,
0.6257345, -0.370259, 1.811972, 0.3921569, 0, 1, 1,
0.6289306, 1.37886, 0.9247553, 0.3960784, 0, 1, 1,
0.6375194, -0.1925322, 1.686701, 0.4039216, 0, 1, 1,
0.6424268, -0.7207853, 0.8335466, 0.4117647, 0, 1, 1,
0.6459186, -0.4501237, 1.073628, 0.4156863, 0, 1, 1,
0.6602572, -0.9893323, 2.571211, 0.4235294, 0, 1, 1,
0.6602584, -0.5829588, 2.585696, 0.427451, 0, 1, 1,
0.660408, 0.5059173, 1.205632, 0.4352941, 0, 1, 1,
0.6607372, -0.5810962, 2.879933, 0.4392157, 0, 1, 1,
0.6624209, -0.101082, 2.62064, 0.4470588, 0, 1, 1,
0.6639104, -0.6003062, 2.957481, 0.4509804, 0, 1, 1,
0.6647322, -2.533374, 3.567907, 0.4588235, 0, 1, 1,
0.6682241, -0.7394918, 3.046654, 0.4627451, 0, 1, 1,
0.6697297, 1.433465, -0.893146, 0.4705882, 0, 1, 1,
0.6724353, 0.4421817, 1.093376, 0.4745098, 0, 1, 1,
0.6800803, 0.08929505, 0.3492443, 0.4823529, 0, 1, 1,
0.6811285, 0.8083063, -0.7391138, 0.4862745, 0, 1, 1,
0.6820299, 1.173126, 1.034212, 0.4941176, 0, 1, 1,
0.6916629, -0.05296413, 2.288953, 0.5019608, 0, 1, 1,
0.6931093, -0.1578402, 1.378114, 0.5058824, 0, 1, 1,
0.6948134, -0.9804918, 3.308646, 0.5137255, 0, 1, 1,
0.708124, -1.099476, 4.457011, 0.5176471, 0, 1, 1,
0.7092359, 1.555227, -2.213918, 0.5254902, 0, 1, 1,
0.7140819, -0.03695794, 1.795339, 0.5294118, 0, 1, 1,
0.7149689, 0.06392787, 2.105747, 0.5372549, 0, 1, 1,
0.7214019, 1.986781, 1.086939, 0.5411765, 0, 1, 1,
0.7225233, 1.28767, 2.342891, 0.5490196, 0, 1, 1,
0.722857, -2.329044, 3.102306, 0.5529412, 0, 1, 1,
0.7231209, -0.3184574, 3.789205, 0.5607843, 0, 1, 1,
0.7287477, 0.4763371, 1.110605, 0.5647059, 0, 1, 1,
0.7332222, 1.645841, -0.489628, 0.572549, 0, 1, 1,
0.7360708, 0.5868801, 0.1176239, 0.5764706, 0, 1, 1,
0.7401199, 0.6976025, 0.4962118, 0.5843138, 0, 1, 1,
0.7545096, -0.12591, 1.846915, 0.5882353, 0, 1, 1,
0.7591352, 1.632408, 0.3152882, 0.5960785, 0, 1, 1,
0.7603294, 0.1422135, 3.333757, 0.6039216, 0, 1, 1,
0.7615812, 1.07104, 2.09368, 0.6078432, 0, 1, 1,
0.7623029, 1.515375, 1.046899, 0.6156863, 0, 1, 1,
0.763447, -1.421417, 3.012547, 0.6196079, 0, 1, 1,
0.7670028, -2.43826, 2.817549, 0.627451, 0, 1, 1,
0.7677498, 0.1503566, 2.523441, 0.6313726, 0, 1, 1,
0.7790337, -0.7140214, 2.942808, 0.6392157, 0, 1, 1,
0.7797862, -0.1176711, 1.904931, 0.6431373, 0, 1, 1,
0.7820752, -0.5381312, 3.027433, 0.6509804, 0, 1, 1,
0.787178, -1.147044, 2.424015, 0.654902, 0, 1, 1,
0.7890757, -1.581808, 4.727104, 0.6627451, 0, 1, 1,
0.7929799, 0.6937343, 2.558556, 0.6666667, 0, 1, 1,
0.7968426, -1.231157, 1.190334, 0.6745098, 0, 1, 1,
0.7969848, 0.1757571, 1.841812, 0.6784314, 0, 1, 1,
0.8002074, 0.6464167, 1.777695, 0.6862745, 0, 1, 1,
0.8023914, 0.3375509, 0.7019616, 0.6901961, 0, 1, 1,
0.8050086, -0.1486152, 1.264711, 0.6980392, 0, 1, 1,
0.8054958, 0.4457846, -0.8314632, 0.7058824, 0, 1, 1,
0.8156686, 1.057431, 1.748656, 0.7098039, 0, 1, 1,
0.8213184, 0.4657227, 2.600002, 0.7176471, 0, 1, 1,
0.8350544, -0.9098974, 1.075983, 0.7215686, 0, 1, 1,
0.8361823, 1.051048, 1.296415, 0.7294118, 0, 1, 1,
0.8383213, -0.2561271, 2.299277, 0.7333333, 0, 1, 1,
0.839664, -0.02202367, 0.4897181, 0.7411765, 0, 1, 1,
0.849467, -0.9911895, 2.371059, 0.7450981, 0, 1, 1,
0.8509777, 1.32064, 2.027535, 0.7529412, 0, 1, 1,
0.853846, 0.4907635, 1.457836, 0.7568628, 0, 1, 1,
0.8566779, -0.249401, 2.224502, 0.7647059, 0, 1, 1,
0.8569745, -1.246351, 2.789398, 0.7686275, 0, 1, 1,
0.8611317, 0.4545598, 0.9398435, 0.7764706, 0, 1, 1,
0.8731343, 0.9779581, 0.5965346, 0.7803922, 0, 1, 1,
0.875026, -1.010946, 0.8806749, 0.7882353, 0, 1, 1,
0.8752337, 1.039288, 1.170083, 0.7921569, 0, 1, 1,
0.8834304, -0.872567, 2.314636, 0.8, 0, 1, 1,
0.8849919, 1.316998, 1.245342, 0.8078431, 0, 1, 1,
0.8894933, -1.71865, 2.30003, 0.8117647, 0, 1, 1,
0.8900648, -0.001208696, 3.108467, 0.8196079, 0, 1, 1,
0.8933587, -0.5069327, 1.934966, 0.8235294, 0, 1, 1,
0.8933642, -0.2555865, 2.881315, 0.8313726, 0, 1, 1,
0.8958011, 0.7697427, 2.538873, 0.8352941, 0, 1, 1,
0.8962927, 0.05536284, -0.2903775, 0.8431373, 0, 1, 1,
0.9020845, 0.05670064, 1.626148, 0.8470588, 0, 1, 1,
0.9055424, 0.1677675, 3.352234, 0.854902, 0, 1, 1,
0.9063465, 0.2245075, 0.327435, 0.8588235, 0, 1, 1,
0.9089436, -0.9118978, 2.973332, 0.8666667, 0, 1, 1,
0.9135408, 0.1949574, 2.071756, 0.8705882, 0, 1, 1,
0.9243332, -0.103902, 1.55027, 0.8784314, 0, 1, 1,
0.9320794, -0.7507716, 2.468836, 0.8823529, 0, 1, 1,
0.9386367, 0.06964038, 2.659889, 0.8901961, 0, 1, 1,
0.9403273, -0.317041, 2.255226, 0.8941177, 0, 1, 1,
0.9495426, 0.8160235, -1.222382, 0.9019608, 0, 1, 1,
0.9526339, 2.007018, 0.3086773, 0.9098039, 0, 1, 1,
0.9561689, -0.1789695, 1.117731, 0.9137255, 0, 1, 1,
0.9648911, -1.113221, 1.636215, 0.9215686, 0, 1, 1,
0.9679812, 1.475174, 0.8629651, 0.9254902, 0, 1, 1,
0.9700513, -0.8718424, 2.101673, 0.9333333, 0, 1, 1,
0.977876, 0.2892624, 1.914874, 0.9372549, 0, 1, 1,
0.9825164, -1.775057, 1.601864, 0.945098, 0, 1, 1,
0.9853757, 0.5320877, 2.55591, 0.9490196, 0, 1, 1,
0.9897996, -0.05522791, 0.7708616, 0.9568627, 0, 1, 1,
1.002492, -0.6915613, 3.317554, 0.9607843, 0, 1, 1,
1.006773, -0.1684047, 1.58787, 0.9686275, 0, 1, 1,
1.007914, 0.7137049, -1.178728, 0.972549, 0, 1, 1,
1.008311, -1.148122, 3.665353, 0.9803922, 0, 1, 1,
1.009946, 0.9862418, 1.887988, 0.9843137, 0, 1, 1,
1.01648, -1.077155, 2.178254, 0.9921569, 0, 1, 1,
1.017409, 0.8625515, 0.6422131, 0.9960784, 0, 1, 1,
1.019845, 0.3500643, 0.7029586, 1, 0, 0.9960784, 1,
1.021203, -1.121324, 3.160963, 1, 0, 0.9882353, 1,
1.021884, -0.3940484, 2.394312, 1, 0, 0.9843137, 1,
1.025397, -0.5336222, 2.476954, 1, 0, 0.9764706, 1,
1.026309, 0.315989, 2.445651, 1, 0, 0.972549, 1,
1.02987, 0.8747278, 1.973667, 1, 0, 0.9647059, 1,
1.030455, -0.4175245, 2.440699, 1, 0, 0.9607843, 1,
1.03142, -1.931769, 2.464458, 1, 0, 0.9529412, 1,
1.032583, 1.72235, -0.3876058, 1, 0, 0.9490196, 1,
1.033528, -0.9804593, 2.183797, 1, 0, 0.9411765, 1,
1.039844, 0.3303557, 1.862251, 1, 0, 0.9372549, 1,
1.041123, 0.8538356, -0.5929117, 1, 0, 0.9294118, 1,
1.045518, 0.3335131, 1.409243, 1, 0, 0.9254902, 1,
1.046286, -0.1321342, -0.3255286, 1, 0, 0.9176471, 1,
1.047449, -2.053851, 1.101958, 1, 0, 0.9137255, 1,
1.050177, 0.9862238, 0.8280632, 1, 0, 0.9058824, 1,
1.051062, 0.5262547, 0.5844151, 1, 0, 0.9019608, 1,
1.055471, -1.235025, 3.576392, 1, 0, 0.8941177, 1,
1.060357, -1.184645, 2.935052, 1, 0, 0.8862745, 1,
1.063863, -0.1132087, 2.634224, 1, 0, 0.8823529, 1,
1.068575, 1.252318, 0.581095, 1, 0, 0.8745098, 1,
1.069637, -0.03074953, 1.123413, 1, 0, 0.8705882, 1,
1.071981, -0.4467948, 3.754371, 1, 0, 0.8627451, 1,
1.076303, 0.244458, 3.346967, 1, 0, 0.8588235, 1,
1.078394, 0.488023, 1.248716, 1, 0, 0.8509804, 1,
1.082008, -0.286829, 1.042625, 1, 0, 0.8470588, 1,
1.085659, 0.1562821, 3.083014, 1, 0, 0.8392157, 1,
1.092957, -1.256913, 3.573821, 1, 0, 0.8352941, 1,
1.096581, 0.193941, 1.924513, 1, 0, 0.827451, 1,
1.09673, 0.5632077, 0.9048221, 1, 0, 0.8235294, 1,
1.101682, 1.969532, 0.937026, 1, 0, 0.8156863, 1,
1.105309, 1.490532, 1.394855, 1, 0, 0.8117647, 1,
1.105533, -0.4827811, 2.584316, 1, 0, 0.8039216, 1,
1.113404, -0.6347907, 0.5017843, 1, 0, 0.7960784, 1,
1.124919, -1.165816, 3.966898, 1, 0, 0.7921569, 1,
1.125399, -0.2475728, 2.658169, 1, 0, 0.7843137, 1,
1.12988, 0.02045055, 1.257014, 1, 0, 0.7803922, 1,
1.130123, -0.5236618, 3.001399, 1, 0, 0.772549, 1,
1.134851, -0.2063085, 0.2121863, 1, 0, 0.7686275, 1,
1.139075, -0.6958159, 0.07074091, 1, 0, 0.7607843, 1,
1.144826, 0.08372431, 0.5201376, 1, 0, 0.7568628, 1,
1.149948, -0.3692045, 0.5955754, 1, 0, 0.7490196, 1,
1.155502, -2.944674, 2.467764, 1, 0, 0.7450981, 1,
1.156834, 1.241198, 1.356962, 1, 0, 0.7372549, 1,
1.16316, -1.420145, 3.656959, 1, 0, 0.7333333, 1,
1.169853, -0.7778838, 1.587242, 1, 0, 0.7254902, 1,
1.170345, 1.462415, 1.433105, 1, 0, 0.7215686, 1,
1.177808, 0.7361106, -0.07328184, 1, 0, 0.7137255, 1,
1.182634, -0.3846409, 1.448054, 1, 0, 0.7098039, 1,
1.18512, 1.044425, -0.2693066, 1, 0, 0.7019608, 1,
1.186232, 0.5550407, 2.610538, 1, 0, 0.6941177, 1,
1.191816, -0.8872231, 2.297743, 1, 0, 0.6901961, 1,
1.205396, -0.7617212, 1.309878, 1, 0, 0.682353, 1,
1.20812, -0.01819224, 2.281642, 1, 0, 0.6784314, 1,
1.208795, -0.1030664, 2.654509, 1, 0, 0.6705883, 1,
1.210167, 0.9380121, 0.6951408, 1, 0, 0.6666667, 1,
1.222299, 0.6390804, -0.1750256, 1, 0, 0.6588235, 1,
1.227051, 0.07057803, -0.8209503, 1, 0, 0.654902, 1,
1.23009, 0.4005163, 1.059125, 1, 0, 0.6470588, 1,
1.235266, 0.2539985, 2.03029, 1, 0, 0.6431373, 1,
1.240344, 0.756628, 0.8890343, 1, 0, 0.6352941, 1,
1.250785, 0.588914, 0.3098256, 1, 0, 0.6313726, 1,
1.2571, 2.296105, 0.905893, 1, 0, 0.6235294, 1,
1.277839, -0.3071311, 1.148165, 1, 0, 0.6196079, 1,
1.281909, -1.319603, 3.613312, 1, 0, 0.6117647, 1,
1.291454, 0.5936646, 0.9428627, 1, 0, 0.6078432, 1,
1.295543, 0.1031475, 1.405182, 1, 0, 0.6, 1,
1.30474, -0.8355795, 3.502994, 1, 0, 0.5921569, 1,
1.305083, 1.599804, 0.3198161, 1, 0, 0.5882353, 1,
1.325058, -0.4534289, 2.072627, 1, 0, 0.5803922, 1,
1.327659, 1.415023, 0.1211682, 1, 0, 0.5764706, 1,
1.338181, 0.9792784, 2.085085, 1, 0, 0.5686275, 1,
1.339863, -0.01588331, 2.219137, 1, 0, 0.5647059, 1,
1.343873, 0.1101179, 0.5661176, 1, 0, 0.5568628, 1,
1.348814, 0.1972591, 0.8991586, 1, 0, 0.5529412, 1,
1.353871, -0.4022361, 0.8714667, 1, 0, 0.5450981, 1,
1.373284, -0.7020088, 1.454452, 1, 0, 0.5411765, 1,
1.37356, 1.04479, 2.17704, 1, 0, 0.5333334, 1,
1.377079, -0.8859786, 3.252387, 1, 0, 0.5294118, 1,
1.397404, -1.024346, 0.2476631, 1, 0, 0.5215687, 1,
1.406169, 0.1269432, 1.222481, 1, 0, 0.5176471, 1,
1.409762, -0.5062733, 1.30004, 1, 0, 0.509804, 1,
1.423738, -2.487968, 3.909597, 1, 0, 0.5058824, 1,
1.430512, 1.136172, 1.407031, 1, 0, 0.4980392, 1,
1.44208, 0.7867131, 1.011859, 1, 0, 0.4901961, 1,
1.44853, -1.069629, 2.019399, 1, 0, 0.4862745, 1,
1.459295, -1.977292, 2.308798, 1, 0, 0.4784314, 1,
1.462237, 0.3020998, 1.080669, 1, 0, 0.4745098, 1,
1.463896, 0.5032619, 2.830936, 1, 0, 0.4666667, 1,
1.481036, -0.2684647, 1.370596, 1, 0, 0.4627451, 1,
1.485544, -0.5762786, 1.403529, 1, 0, 0.454902, 1,
1.498638, -0.3043375, -0.4664746, 1, 0, 0.4509804, 1,
1.508668, 0.1521578, 1.756109, 1, 0, 0.4431373, 1,
1.510982, -0.9199448, 1.939172, 1, 0, 0.4392157, 1,
1.512898, 1.145655, -0.04459707, 1, 0, 0.4313726, 1,
1.516437, -0.8170566, 2.531063, 1, 0, 0.427451, 1,
1.520013, 0.8463497, 1.726373, 1, 0, 0.4196078, 1,
1.520254, 0.1492095, 2.671779, 1, 0, 0.4156863, 1,
1.532639, -1.673496, 1.885826, 1, 0, 0.4078431, 1,
1.542418, 0.2699809, -0.189674, 1, 0, 0.4039216, 1,
1.543504, 1.732291, 0.6961348, 1, 0, 0.3960784, 1,
1.545381, -1.395262, 2.759375, 1, 0, 0.3882353, 1,
1.551169, 0.6781696, -0.3134423, 1, 0, 0.3843137, 1,
1.551173, 0.6486909, 0.8927307, 1, 0, 0.3764706, 1,
1.564331, 0.8827027, 2.844099, 1, 0, 0.372549, 1,
1.580927, -0.651259, 1.959027, 1, 0, 0.3647059, 1,
1.609688, 0.3561122, 0.967597, 1, 0, 0.3607843, 1,
1.612074, 0.2223493, 0.03662339, 1, 0, 0.3529412, 1,
1.612123, 0.8165808, 1.23331, 1, 0, 0.3490196, 1,
1.624079, -0.8706799, 3.640491, 1, 0, 0.3411765, 1,
1.64017, -1.425022, 2.417124, 1, 0, 0.3372549, 1,
1.643324, 0.1421767, 0.3118893, 1, 0, 0.3294118, 1,
1.675472, -0.1559407, 3.16887, 1, 0, 0.3254902, 1,
1.698313, 0.4840142, 2.142658, 1, 0, 0.3176471, 1,
1.712522, -0.5038297, 2.664738, 1, 0, 0.3137255, 1,
1.716869, 1.536171, 1.857348, 1, 0, 0.3058824, 1,
1.71841, -1.472479, 2.908663, 1, 0, 0.2980392, 1,
1.726471, -0.7879023, 2.147791, 1, 0, 0.2941177, 1,
1.733297, 0.55146, 1.892394, 1, 0, 0.2862745, 1,
1.73562, -0.7560998, 2.476752, 1, 0, 0.282353, 1,
1.746308, 0.5251349, 3.05474, 1, 0, 0.2745098, 1,
1.748538, 0.7671772, 0.8992066, 1, 0, 0.2705882, 1,
1.750615, 0.4429766, 0.7806976, 1, 0, 0.2627451, 1,
1.753876, -2.163518, 0.5139492, 1, 0, 0.2588235, 1,
1.766914, -1.612907, 3.194309, 1, 0, 0.2509804, 1,
1.784345, -0.4831637, 2.960395, 1, 0, 0.2470588, 1,
1.798938, -0.7351406, 1.721374, 1, 0, 0.2392157, 1,
1.810377, 0.2581812, 3.496027, 1, 0, 0.2352941, 1,
1.831024, -1.684288, 1.281915, 1, 0, 0.227451, 1,
1.839972, -1.439254, 3.726466, 1, 0, 0.2235294, 1,
1.841621, 0.784175, 0.09770853, 1, 0, 0.2156863, 1,
1.850523, -0.6828805, 1.180152, 1, 0, 0.2117647, 1,
1.863505, -1.19088, 1.103925, 1, 0, 0.2039216, 1,
1.903066, -0.827522, 2.101394, 1, 0, 0.1960784, 1,
1.920582, -0.7605717, 2.208359, 1, 0, 0.1921569, 1,
1.931249, 0.5201693, 1.999664, 1, 0, 0.1843137, 1,
1.947912, 0.3140958, 0.6926271, 1, 0, 0.1803922, 1,
1.957364, -0.01096096, 0.730865, 1, 0, 0.172549, 1,
1.961391, 0.4554147, 4.060694, 1, 0, 0.1686275, 1,
1.969373, -1.630927, 2.272386, 1, 0, 0.1607843, 1,
1.973179, 0.140789, 2.819362, 1, 0, 0.1568628, 1,
1.973529, -0.3342436, 2.472345, 1, 0, 0.1490196, 1,
1.982904, -2.152386, 5.078509, 1, 0, 0.145098, 1,
1.99093, -0.8465202, 2.383461, 1, 0, 0.1372549, 1,
1.995533, 0.9197432, 2.105474, 1, 0, 0.1333333, 1,
2.064454, -1.093465, 1.758976, 1, 0, 0.1254902, 1,
2.10015, -0.701883, 1.090062, 1, 0, 0.1215686, 1,
2.107617, 0.3276528, 2.295094, 1, 0, 0.1137255, 1,
2.122464, 1.741149, 0.7189205, 1, 0, 0.1098039, 1,
2.168382, -0.5672172, 2.304872, 1, 0, 0.1019608, 1,
2.179701, 0.5557828, 1.596113, 1, 0, 0.09411765, 1,
2.220815, 1.1465, -0.003895115, 1, 0, 0.09019608, 1,
2.322042, 1.054779, 0.6354812, 1, 0, 0.08235294, 1,
2.344125, 0.1009367, 3.37541, 1, 0, 0.07843138, 1,
2.383237, 0.7555747, 1.971969, 1, 0, 0.07058824, 1,
2.40976, -0.3230627, 1.528702, 1, 0, 0.06666667, 1,
2.412312, 0.4710878, 0.5005866, 1, 0, 0.05882353, 1,
2.451784, -0.3558377, 1.144099, 1, 0, 0.05490196, 1,
2.457024, -0.5401213, 1.947084, 1, 0, 0.04705882, 1,
2.587778, -0.2725979, -0.1544544, 1, 0, 0.04313726, 1,
2.680231, 1.907698, 2.132984, 1, 0, 0.03529412, 1,
2.68675, -1.643793, 3.133568, 1, 0, 0.03137255, 1,
2.721704, -1.902493, 3.606882, 1, 0, 0.02352941, 1,
2.830899, 0.2349915, 1.473498, 1, 0, 0.01960784, 1,
2.955912, 1.161163, 1.496835, 1, 0, 0.01176471, 1,
3.143311, 0.1525283, 3.226645, 1, 0, 0.007843138, 1
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
-0.2855599, -4.111934, -6.471281, 0, -0.5, 0.5, 0.5,
-0.2855599, -4.111934, -6.471281, 1, -0.5, 0.5, 0.5,
-0.2855599, -4.111934, -6.471281, 1, 1.5, 0.5, 0.5,
-0.2855599, -4.111934, -6.471281, 0, 1.5, 0.5, 0.5
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
-4.876818, 0.1803622, -6.471281, 0, -0.5, 0.5, 0.5,
-4.876818, 0.1803622, -6.471281, 1, -0.5, 0.5, 0.5,
-4.876818, 0.1803622, -6.471281, 1, 1.5, 0.5, 0.5,
-4.876818, 0.1803622, -6.471281, 0, 1.5, 0.5, 0.5
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
-4.876818, -4.111934, 0.2425389, 0, -0.5, 0.5, 0.5,
-4.876818, -4.111934, 0.2425389, 1, -0.5, 0.5, 0.5,
-4.876818, -4.111934, 0.2425389, 1, 1.5, 0.5, 0.5,
-4.876818, -4.111934, 0.2425389, 0, 1.5, 0.5, 0.5
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
-3, -3.121404, -4.921937,
3, -3.121404, -4.921937,
-3, -3.121404, -4.921937,
-3, -3.286493, -5.180161,
-2, -3.121404, -4.921937,
-2, -3.286493, -5.180161,
-1, -3.121404, -4.921937,
-1, -3.286493, -5.180161,
0, -3.121404, -4.921937,
0, -3.286493, -5.180161,
1, -3.121404, -4.921937,
1, -3.286493, -5.180161,
2, -3.121404, -4.921937,
2, -3.286493, -5.180161,
3, -3.121404, -4.921937,
3, -3.286493, -5.180161
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
-3, -3.616669, -5.696609, 0, -0.5, 0.5, 0.5,
-3, -3.616669, -5.696609, 1, -0.5, 0.5, 0.5,
-3, -3.616669, -5.696609, 1, 1.5, 0.5, 0.5,
-3, -3.616669, -5.696609, 0, 1.5, 0.5, 0.5,
-2, -3.616669, -5.696609, 0, -0.5, 0.5, 0.5,
-2, -3.616669, -5.696609, 1, -0.5, 0.5, 0.5,
-2, -3.616669, -5.696609, 1, 1.5, 0.5, 0.5,
-2, -3.616669, -5.696609, 0, 1.5, 0.5, 0.5,
-1, -3.616669, -5.696609, 0, -0.5, 0.5, 0.5,
-1, -3.616669, -5.696609, 1, -0.5, 0.5, 0.5,
-1, -3.616669, -5.696609, 1, 1.5, 0.5, 0.5,
-1, -3.616669, -5.696609, 0, 1.5, 0.5, 0.5,
0, -3.616669, -5.696609, 0, -0.5, 0.5, 0.5,
0, -3.616669, -5.696609, 1, -0.5, 0.5, 0.5,
0, -3.616669, -5.696609, 1, 1.5, 0.5, 0.5,
0, -3.616669, -5.696609, 0, 1.5, 0.5, 0.5,
1, -3.616669, -5.696609, 0, -0.5, 0.5, 0.5,
1, -3.616669, -5.696609, 1, -0.5, 0.5, 0.5,
1, -3.616669, -5.696609, 1, 1.5, 0.5, 0.5,
1, -3.616669, -5.696609, 0, 1.5, 0.5, 0.5,
2, -3.616669, -5.696609, 0, -0.5, 0.5, 0.5,
2, -3.616669, -5.696609, 1, -0.5, 0.5, 0.5,
2, -3.616669, -5.696609, 1, 1.5, 0.5, 0.5,
2, -3.616669, -5.696609, 0, 1.5, 0.5, 0.5,
3, -3.616669, -5.696609, 0, -0.5, 0.5, 0.5,
3, -3.616669, -5.696609, 1, -0.5, 0.5, 0.5,
3, -3.616669, -5.696609, 1, 1.5, 0.5, 0.5,
3, -3.616669, -5.696609, 0, 1.5, 0.5, 0.5
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
-3.817297, -3, -4.921937,
-3.817297, 3, -4.921937,
-3.817297, -3, -4.921937,
-3.993884, -3, -5.180161,
-3.817297, -2, -4.921937,
-3.993884, -2, -5.180161,
-3.817297, -1, -4.921937,
-3.993884, -1, -5.180161,
-3.817297, 0, -4.921937,
-3.993884, 0, -5.180161,
-3.817297, 1, -4.921937,
-3.993884, 1, -5.180161,
-3.817297, 2, -4.921937,
-3.993884, 2, -5.180161,
-3.817297, 3, -4.921937,
-3.993884, 3, -5.180161
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
-4.347057, -3, -5.696609, 0, -0.5, 0.5, 0.5,
-4.347057, -3, -5.696609, 1, -0.5, 0.5, 0.5,
-4.347057, -3, -5.696609, 1, 1.5, 0.5, 0.5,
-4.347057, -3, -5.696609, 0, 1.5, 0.5, 0.5,
-4.347057, -2, -5.696609, 0, -0.5, 0.5, 0.5,
-4.347057, -2, -5.696609, 1, -0.5, 0.5, 0.5,
-4.347057, -2, -5.696609, 1, 1.5, 0.5, 0.5,
-4.347057, -2, -5.696609, 0, 1.5, 0.5, 0.5,
-4.347057, -1, -5.696609, 0, -0.5, 0.5, 0.5,
-4.347057, -1, -5.696609, 1, -0.5, 0.5, 0.5,
-4.347057, -1, -5.696609, 1, 1.5, 0.5, 0.5,
-4.347057, -1, -5.696609, 0, 1.5, 0.5, 0.5,
-4.347057, 0, -5.696609, 0, -0.5, 0.5, 0.5,
-4.347057, 0, -5.696609, 1, -0.5, 0.5, 0.5,
-4.347057, 0, -5.696609, 1, 1.5, 0.5, 0.5,
-4.347057, 0, -5.696609, 0, 1.5, 0.5, 0.5,
-4.347057, 1, -5.696609, 0, -0.5, 0.5, 0.5,
-4.347057, 1, -5.696609, 1, -0.5, 0.5, 0.5,
-4.347057, 1, -5.696609, 1, 1.5, 0.5, 0.5,
-4.347057, 1, -5.696609, 0, 1.5, 0.5, 0.5,
-4.347057, 2, -5.696609, 0, -0.5, 0.5, 0.5,
-4.347057, 2, -5.696609, 1, -0.5, 0.5, 0.5,
-4.347057, 2, -5.696609, 1, 1.5, 0.5, 0.5,
-4.347057, 2, -5.696609, 0, 1.5, 0.5, 0.5,
-4.347057, 3, -5.696609, 0, -0.5, 0.5, 0.5,
-4.347057, 3, -5.696609, 1, -0.5, 0.5, 0.5,
-4.347057, 3, -5.696609, 1, 1.5, 0.5, 0.5,
-4.347057, 3, -5.696609, 0, 1.5, 0.5, 0.5
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
-3.817297, -3.121404, -4,
-3.817297, -3.121404, 4,
-3.817297, -3.121404, -4,
-3.993884, -3.286493, -4,
-3.817297, -3.121404, -2,
-3.993884, -3.286493, -2,
-3.817297, -3.121404, 0,
-3.993884, -3.286493, 0,
-3.817297, -3.121404, 2,
-3.993884, -3.286493, 2,
-3.817297, -3.121404, 4,
-3.993884, -3.286493, 4
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
-4.347057, -3.616669, -4, 0, -0.5, 0.5, 0.5,
-4.347057, -3.616669, -4, 1, -0.5, 0.5, 0.5,
-4.347057, -3.616669, -4, 1, 1.5, 0.5, 0.5,
-4.347057, -3.616669, -4, 0, 1.5, 0.5, 0.5,
-4.347057, -3.616669, -2, 0, -0.5, 0.5, 0.5,
-4.347057, -3.616669, -2, 1, -0.5, 0.5, 0.5,
-4.347057, -3.616669, -2, 1, 1.5, 0.5, 0.5,
-4.347057, -3.616669, -2, 0, 1.5, 0.5, 0.5,
-4.347057, -3.616669, 0, 0, -0.5, 0.5, 0.5,
-4.347057, -3.616669, 0, 1, -0.5, 0.5, 0.5,
-4.347057, -3.616669, 0, 1, 1.5, 0.5, 0.5,
-4.347057, -3.616669, 0, 0, 1.5, 0.5, 0.5,
-4.347057, -3.616669, 2, 0, -0.5, 0.5, 0.5,
-4.347057, -3.616669, 2, 1, -0.5, 0.5, 0.5,
-4.347057, -3.616669, 2, 1, 1.5, 0.5, 0.5,
-4.347057, -3.616669, 2, 0, 1.5, 0.5, 0.5,
-4.347057, -3.616669, 4, 0, -0.5, 0.5, 0.5,
-4.347057, -3.616669, 4, 1, -0.5, 0.5, 0.5,
-4.347057, -3.616669, 4, 1, 1.5, 0.5, 0.5,
-4.347057, -3.616669, 4, 0, 1.5, 0.5, 0.5
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
-3.817297, -3.121404, -4.921937,
-3.817297, 3.482129, -4.921937,
-3.817297, -3.121404, 5.407015,
-3.817297, 3.482129, 5.407015,
-3.817297, -3.121404, -4.921937,
-3.817297, -3.121404, 5.407015,
-3.817297, 3.482129, -4.921937,
-3.817297, 3.482129, 5.407015,
-3.817297, -3.121404, -4.921937,
3.246177, -3.121404, -4.921937,
-3.817297, -3.121404, 5.407015,
3.246177, -3.121404, 5.407015,
-3.817297, 3.482129, -4.921937,
3.246177, 3.482129, -4.921937,
-3.817297, 3.482129, 5.407015,
3.246177, 3.482129, 5.407015,
3.246177, -3.121404, -4.921937,
3.246177, 3.482129, -4.921937,
3.246177, -3.121404, 5.407015,
3.246177, 3.482129, 5.407015,
3.246177, -3.121404, -4.921937,
3.246177, -3.121404, 5.407015,
3.246177, 3.482129, -4.921937,
3.246177, 3.482129, 5.407015
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
var radius = 7.555147;
var distance = 33.6137;
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
mvMatrix.translate( 0.2855599, -0.1803622, -0.2425389 );
mvMatrix.scale( 1.156481, 1.237031, 0.7908617 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.6137);
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
Triphenyltin_hydroxi<-read.table("Triphenyltin_hydroxi.xyz")
```

```
## Error in read.table("Triphenyltin_hydroxi.xyz"): no lines available in input
```

```r
x<-Triphenyltin_hydroxi$V2
```

```
## Error in eval(expr, envir, enclos): object 'Triphenyltin_hydroxi' not found
```

```r
y<-Triphenyltin_hydroxi$V3
```

```
## Error in eval(expr, envir, enclos): object 'Triphenyltin_hydroxi' not found
```

```r
z<-Triphenyltin_hydroxi$V4
```

```
## Error in eval(expr, envir, enclos): object 'Triphenyltin_hydroxi' not found
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
-3.714431, -0.3182085, -2.536957, 0, 0, 1, 1, 1,
-3.222615, -0.6794875, -1.815511, 1, 0, 0, 1, 1,
-2.945153, 1.585649, 0.4099922, 1, 0, 0, 1, 1,
-2.841015, -0.2991959, -2.918293, 1, 0, 0, 1, 1,
-2.839438, 1.081388, -1.282513, 1, 0, 0, 1, 1,
-2.57718, 1.451321, -2.083273, 1, 0, 0, 1, 1,
-2.524381, 1.657706, -0.7274678, 0, 0, 0, 1, 1,
-2.516933, 0.05255643, -1.517958, 0, 0, 0, 1, 1,
-2.465781, -2.031916, -3.575431, 0, 0, 0, 1, 1,
-2.440486, 1.305147, -1.226945, 0, 0, 0, 1, 1,
-2.413806, -0.9564458, -3.122715, 0, 0, 0, 1, 1,
-2.389272, 0.6530381, -0.954269, 0, 0, 0, 1, 1,
-2.38614, -1.616019, -1.344937, 0, 0, 0, 1, 1,
-2.207438, 0.4399541, -1.387129, 1, 1, 1, 1, 1,
-2.193671, -0.4305996, -0.6457857, 1, 1, 1, 1, 1,
-2.175823, -0.257385, -3.514769, 1, 1, 1, 1, 1,
-2.153306, -0.3824387, -0.01038572, 1, 1, 1, 1, 1,
-2.148783, -0.04034832, -0.1455672, 1, 1, 1, 1, 1,
-2.13357, -1.543315, -2.495116, 1, 1, 1, 1, 1,
-2.125983, -0.4413106, -0.3565775, 1, 1, 1, 1, 1,
-2.117757, -1.071781, -1.96467, 1, 1, 1, 1, 1,
-2.046677, 1.628154, -1.4812, 1, 1, 1, 1, 1,
-2.039726, -0.242268, -3.438309, 1, 1, 1, 1, 1,
-2.037222, -0.6581036, -1.565685, 1, 1, 1, 1, 1,
-2.015331, -1.529064, -2.018349, 1, 1, 1, 1, 1,
-2.010863, 0.5312657, -1.239401, 1, 1, 1, 1, 1,
-1.976863, -0.4919995, -3.711013, 1, 1, 1, 1, 1,
-1.976376, 1.283596, -1.295372, 1, 1, 1, 1, 1,
-1.950161, 0.5269861, -0.1820922, 0, 0, 1, 1, 1,
-1.928361, 0.4073915, -1.227293, 1, 0, 0, 1, 1,
-1.912841, 0.5300975, -2.541107, 1, 0, 0, 1, 1,
-1.908159, 0.6375192, -2.536242, 1, 0, 0, 1, 1,
-1.899021, -1.242161, -3.025865, 1, 0, 0, 1, 1,
-1.889086, -2.046603, -2.540243, 1, 0, 0, 1, 1,
-1.886289, -0.7044111, -2.376651, 0, 0, 0, 1, 1,
-1.853048, -0.7144032, -1.626101, 0, 0, 0, 1, 1,
-1.83457, 1.807871, -1.570545, 0, 0, 0, 1, 1,
-1.8159, -0.9009163, -1.314451, 0, 0, 0, 1, 1,
-1.81352, 0.2140024, -2.259482, 0, 0, 0, 1, 1,
-1.796195, 0.0291208, -2.754305, 0, 0, 0, 1, 1,
-1.786988, 0.1610283, -2.519983, 0, 0, 0, 1, 1,
-1.783926, -0.2132271, -1.22457, 1, 1, 1, 1, 1,
-1.781459, -0.8664693, -0.2151486, 1, 1, 1, 1, 1,
-1.778222, 0.2774158, -1.093112, 1, 1, 1, 1, 1,
-1.762208, 0.2276225, -2.230671, 1, 1, 1, 1, 1,
-1.760366, 0.9320675, -1.453897, 1, 1, 1, 1, 1,
-1.738059, 1.334721, -1.35665, 1, 1, 1, 1, 1,
-1.687205, 2.301651, 0.8899989, 1, 1, 1, 1, 1,
-1.658485, -2.242205, -2.472136, 1, 1, 1, 1, 1,
-1.651179, -1.137925, -2.53139, 1, 1, 1, 1, 1,
-1.644711, -0.3660309, -1.619529, 1, 1, 1, 1, 1,
-1.642783, -2.367496, -1.460094, 1, 1, 1, 1, 1,
-1.632377, -1.183733, -0.998392, 1, 1, 1, 1, 1,
-1.622131, -0.9581033, -1.748285, 1, 1, 1, 1, 1,
-1.599439, 0.2235664, -0.9809713, 1, 1, 1, 1, 1,
-1.597659, 0.05386771, -1.478012, 1, 1, 1, 1, 1,
-1.584996, 0.848711, 0.7947955, 0, 0, 1, 1, 1,
-1.576007, -0.07356057, -2.80475, 1, 0, 0, 1, 1,
-1.574898, -1.176702, -2.452183, 1, 0, 0, 1, 1,
-1.569691, 0.4688771, 0.4916939, 1, 0, 0, 1, 1,
-1.559481, 0.8385463, -0.648034, 1, 0, 0, 1, 1,
-1.557383, -1.128476, -3.331383, 1, 0, 0, 1, 1,
-1.553077, 0.1300907, -2.973989, 0, 0, 0, 1, 1,
-1.536684, 0.7740472, -1.274948, 0, 0, 0, 1, 1,
-1.512524, -1.601611, -3.45825, 0, 0, 0, 1, 1,
-1.508404, 0.9208331, 0.1856076, 0, 0, 0, 1, 1,
-1.498068, 0.901383, -1.389182, 0, 0, 0, 1, 1,
-1.495822, 1.1359, -1.032095, 0, 0, 0, 1, 1,
-1.486725, -1.412257, -2.282076, 0, 0, 0, 1, 1,
-1.47598, 1.201354, -1.001141, 1, 1, 1, 1, 1,
-1.469313, -0.6722236, -1.222088, 1, 1, 1, 1, 1,
-1.466158, -0.3731219, -3.631512, 1, 1, 1, 1, 1,
-1.464204, -0.6385323, -2.285536, 1, 1, 1, 1, 1,
-1.442559, -0.6938632, -1.905086, 1, 1, 1, 1, 1,
-1.437897, 0.04184511, -2.827135, 1, 1, 1, 1, 1,
-1.425986, -0.2488024, -0.1851832, 1, 1, 1, 1, 1,
-1.424774, -0.1817761, -1.333282, 1, 1, 1, 1, 1,
-1.421428, 0.1518193, -1.75619, 1, 1, 1, 1, 1,
-1.410596, -1.466679, -1.329322, 1, 1, 1, 1, 1,
-1.40127, 0.05787261, 0.8983249, 1, 1, 1, 1, 1,
-1.399807, 3.385961, -0.5426049, 1, 1, 1, 1, 1,
-1.3901, 0.7651735, -2.307632, 1, 1, 1, 1, 1,
-1.389674, -0.02813032, -0.07815243, 1, 1, 1, 1, 1,
-1.387657, 0.5795568, -1.398836, 1, 1, 1, 1, 1,
-1.366106, -0.8313548, -3.522674, 0, 0, 1, 1, 1,
-1.364642, -1.375095, -2.519677, 1, 0, 0, 1, 1,
-1.360668, -1.989543, -4.220677, 1, 0, 0, 1, 1,
-1.360149, -1.86597, -3.353305, 1, 0, 0, 1, 1,
-1.35755, -0.0815883, -1.244859, 1, 0, 0, 1, 1,
-1.355437, 1.446005, -1.017893, 1, 0, 0, 1, 1,
-1.348572, 1.015229, 0.2539748, 0, 0, 0, 1, 1,
-1.348299, -1.6624, -3.040977, 0, 0, 0, 1, 1,
-1.338232, -2.12936, -2.626113, 0, 0, 0, 1, 1,
-1.329833, 0.2742161, 1.444853, 0, 0, 0, 1, 1,
-1.32926, 1.006054, -1.136016, 0, 0, 0, 1, 1,
-1.328033, -1.184274, -2.438098, 0, 0, 0, 1, 1,
-1.324166, -0.1444427, -1.657442, 0, 0, 0, 1, 1,
-1.319766, -0.7814163, -2.881785, 1, 1, 1, 1, 1,
-1.317568, 0.9689263, 1.098701, 1, 1, 1, 1, 1,
-1.299667, -0.761128, -1.957802, 1, 1, 1, 1, 1,
-1.299579, -0.4583297, -1.243226, 1, 1, 1, 1, 1,
-1.29143, 0.00704353, -0.2013839, 1, 1, 1, 1, 1,
-1.290433, 0.3954954, -1.09778, 1, 1, 1, 1, 1,
-1.287267, -0.5876113, -0.6947718, 1, 1, 1, 1, 1,
-1.284087, -0.1039606, -0.2650553, 1, 1, 1, 1, 1,
-1.281581, -0.3578443, -2.892179, 1, 1, 1, 1, 1,
-1.280885, 0.3559888, -0.8039599, 1, 1, 1, 1, 1,
-1.272781, -0.269663, -2.552925, 1, 1, 1, 1, 1,
-1.257775, -0.694079, -2.067895, 1, 1, 1, 1, 1,
-1.255921, 0.1277779, -0.3421924, 1, 1, 1, 1, 1,
-1.253324, -0.6368687, -2.115497, 1, 1, 1, 1, 1,
-1.24909, 0.2255379, -1.857976, 1, 1, 1, 1, 1,
-1.244587, 0.6018202, -0.2561064, 0, 0, 1, 1, 1,
-1.241461, 0.5935959, -0.9352489, 1, 0, 0, 1, 1,
-1.235107, 0.2050677, -3.15139, 1, 0, 0, 1, 1,
-1.224693, 0.5861512, -0.9918761, 1, 0, 0, 1, 1,
-1.220846, -0.5795087, -1.638214, 1, 0, 0, 1, 1,
-1.220239, -0.7736097, -2.040102, 1, 0, 0, 1, 1,
-1.207934, 0.3744549, 0.1782315, 0, 0, 0, 1, 1,
-1.19753, -0.9164678, -2.319102, 0, 0, 0, 1, 1,
-1.193838, 1.192088, -1.355159, 0, 0, 0, 1, 1,
-1.191884, -0.3377034, -3.266806, 0, 0, 0, 1, 1,
-1.184944, 0.3399149, -1.16054, 0, 0, 0, 1, 1,
-1.184629, 2.015841, -0.371354, 0, 0, 0, 1, 1,
-1.179514, -0.4897036, -2.856958, 0, 0, 0, 1, 1,
-1.176469, -0.7935225, -2.401384, 1, 1, 1, 1, 1,
-1.172123, -0.907136, -2.520724, 1, 1, 1, 1, 1,
-1.171026, -0.2219257, -1.920914, 1, 1, 1, 1, 1,
-1.165032, -1.752045, -0.886165, 1, 1, 1, 1, 1,
-1.158439, 0.7976843, -1.30634, 1, 1, 1, 1, 1,
-1.152642, 0.43957, -2.498373, 1, 1, 1, 1, 1,
-1.144918, -1.28127, -3.232047, 1, 1, 1, 1, 1,
-1.139149, -0.5914094, -1.944673, 1, 1, 1, 1, 1,
-1.137894, -1.045904, -0.6799816, 1, 1, 1, 1, 1,
-1.129395, 0.7792205, -0.2523874, 1, 1, 1, 1, 1,
-1.12739, 0.9937675, -1.306179, 1, 1, 1, 1, 1,
-1.110505, -0.603119, -1.61924, 1, 1, 1, 1, 1,
-1.098733, 2.24447, -0.6001499, 1, 1, 1, 1, 1,
-1.09349, -2.295891, -1.528051, 1, 1, 1, 1, 1,
-1.089409, -1.525723, -1.968313, 1, 1, 1, 1, 1,
-1.086028, -2.403818, -3.446689, 0, 0, 1, 1, 1,
-1.084544, 1.460582, -1.562705, 1, 0, 0, 1, 1,
-1.08383, 1.489391, -0.9906358, 1, 0, 0, 1, 1,
-1.081667, -0.9390625, -2.429294, 1, 0, 0, 1, 1,
-1.074981, -0.5525966, -2.525204, 1, 0, 0, 1, 1,
-1.069399, 0.02912842, -2.13207, 1, 0, 0, 1, 1,
-1.0684, 0.2662202, -1.915273, 0, 0, 0, 1, 1,
-1.058515, 1.191332, -1.770762, 0, 0, 0, 1, 1,
-1.05735, 1.169856, -0.2615382, 0, 0, 0, 1, 1,
-1.050603, 0.2076901, -1.892405, 0, 0, 0, 1, 1,
-1.047276, 1.778671, -0.76943, 0, 0, 0, 1, 1,
-1.044869, -0.8677416, -1.795644, 0, 0, 0, 1, 1,
-1.04351, 0.2108731, -0.5854846, 0, 0, 0, 1, 1,
-1.030355, 0.3182421, -0.4119484, 1, 1, 1, 1, 1,
-1.027146, -0.2546717, -1.832228, 1, 1, 1, 1, 1,
-1.024465, 1.063065, 0.6778494, 1, 1, 1, 1, 1,
-1.020812, -0.3417262, -1.600504, 1, 1, 1, 1, 1,
-1.016382, 0.4498011, -0.001652365, 1, 1, 1, 1, 1,
-0.9935874, -1.562726, -2.6802, 1, 1, 1, 1, 1,
-0.9929348, -0.2920913, -2.178821, 1, 1, 1, 1, 1,
-0.992471, -1.359979, -1.045451, 1, 1, 1, 1, 1,
-0.9899232, 0.6872123, -1.048232, 1, 1, 1, 1, 1,
-0.9894806, 0.188314, -1.362962, 1, 1, 1, 1, 1,
-0.9886982, 0.4113205, -0.6942803, 1, 1, 1, 1, 1,
-0.9871927, -0.9972625, -3.530337, 1, 1, 1, 1, 1,
-0.9843298, -0.4614383, -1.198855, 1, 1, 1, 1, 1,
-0.9838808, 1.199947, -0.5250473, 1, 1, 1, 1, 1,
-0.9784522, 0.09254079, -0.9937739, 1, 1, 1, 1, 1,
-0.9715573, 0.8431646, 0.35749, 0, 0, 1, 1, 1,
-0.9708787, -0.2555997, -1.094425, 1, 0, 0, 1, 1,
-0.9699855, -0.622511, -3.143886, 1, 0, 0, 1, 1,
-0.9694601, 1.761811, -1.644737, 1, 0, 0, 1, 1,
-0.9679949, -0.9588362, -3.22459, 1, 0, 0, 1, 1,
-0.9674211, 0.4909146, -0.4470695, 1, 0, 0, 1, 1,
-0.9665471, 0.6694336, -0.544571, 0, 0, 0, 1, 1,
-0.9593953, -0.4133877, -2.868158, 0, 0, 0, 1, 1,
-0.9568107, -0.2694703, -2.022704, 0, 0, 0, 1, 1,
-0.955365, -0.6904252, -1.338834, 0, 0, 0, 1, 1,
-0.9487799, 0.3997257, -2.234267, 0, 0, 0, 1, 1,
-0.9456784, 1.957741, -0.2830114, 0, 0, 0, 1, 1,
-0.9455541, 0.2318937, -1.173272, 0, 0, 0, 1, 1,
-0.943623, -1.526156, -2.392331, 1, 1, 1, 1, 1,
-0.940289, 0.5411731, -0.3397625, 1, 1, 1, 1, 1,
-0.9338014, 0.8076302, -0.4352169, 1, 1, 1, 1, 1,
-0.9325162, 0.02745127, -2.133255, 1, 1, 1, 1, 1,
-0.9283737, -1.269892, -3.347528, 1, 1, 1, 1, 1,
-0.9279276, -0.1346657, -2.220216, 1, 1, 1, 1, 1,
-0.9213861, -0.8942863, -1.590526, 1, 1, 1, 1, 1,
-0.9198785, -0.902052, -4.771516, 1, 1, 1, 1, 1,
-0.9179106, -1.299111, -2.339829, 1, 1, 1, 1, 1,
-0.9176989, -0.421956, -2.421704, 1, 1, 1, 1, 1,
-0.904003, 0.338896, -1.419242, 1, 1, 1, 1, 1,
-0.903439, 1.484521, -1.192944, 1, 1, 1, 1, 1,
-0.9024358, -1.30492, -2.942154, 1, 1, 1, 1, 1,
-0.9016843, -0.2180233, -0.4233337, 1, 1, 1, 1, 1,
-0.900098, 0.302611, -1.735939, 1, 1, 1, 1, 1,
-0.8985287, -1.267707, -2.664483, 0, 0, 1, 1, 1,
-0.8897579, 1.007424, -1.777607, 1, 0, 0, 1, 1,
-0.8882192, 2.089727, -0.1097793, 1, 0, 0, 1, 1,
-0.8859349, 0.9882703, 0.5545362, 1, 0, 0, 1, 1,
-0.8838277, 0.815758, -1.071732, 1, 0, 0, 1, 1,
-0.8828865, -0.5684326, -2.03405, 1, 0, 0, 1, 1,
-0.8717569, -1.625028, -1.328725, 0, 0, 0, 1, 1,
-0.868977, 0.6798257, -1.989479, 0, 0, 0, 1, 1,
-0.8652412, -0.2389482, -2.416044, 0, 0, 0, 1, 1,
-0.86312, -0.3464529, -1.920773, 0, 0, 0, 1, 1,
-0.8618662, 0.2444895, 0.6863658, 0, 0, 0, 1, 1,
-0.8529454, 0.4996403, -1.209707, 0, 0, 0, 1, 1,
-0.8519431, 0.2943136, -2.209298, 0, 0, 0, 1, 1,
-0.8438431, -1.747818, -4.433584, 1, 1, 1, 1, 1,
-0.8320426, 0.311263, -2.214004, 1, 1, 1, 1, 1,
-0.8310544, -0.06278921, -4.670843, 1, 1, 1, 1, 1,
-0.8288993, 0.01671935, -1.533424, 1, 1, 1, 1, 1,
-0.8266178, 1.895061, -1.990351, 1, 1, 1, 1, 1,
-0.8264908, -0.3115088, -1.964843, 1, 1, 1, 1, 1,
-0.8246423, 0.2807619, -1.418555, 1, 1, 1, 1, 1,
-0.8219244, 0.306492, -1.853276, 1, 1, 1, 1, 1,
-0.8218257, 0.8520002, 0.3533439, 1, 1, 1, 1, 1,
-0.8101994, -0.3724682, -2.82601, 1, 1, 1, 1, 1,
-0.8068892, -0.1126561, -1.005647, 1, 1, 1, 1, 1,
-0.8050119, 1.264364, -0.5020453, 1, 1, 1, 1, 1,
-0.7986423, -0.4013371, -2.358917, 1, 1, 1, 1, 1,
-0.7974198, 2.133367, -1.057846, 1, 1, 1, 1, 1,
-0.7960621, -2.699342, -2.853368, 1, 1, 1, 1, 1,
-0.7912049, -0.06288979, -1.238383, 0, 0, 1, 1, 1,
-0.7891814, 0.1601616, 0.3391332, 1, 0, 0, 1, 1,
-0.7739608, 0.2395786, -2.033239, 1, 0, 0, 1, 1,
-0.7723461, -0.2800278, -1.319869, 1, 0, 0, 1, 1,
-0.7495893, 0.9653094, -0.1452622, 1, 0, 0, 1, 1,
-0.7409259, 0.04826979, -1.586904, 1, 0, 0, 1, 1,
-0.7370963, -0.5231528, -2.8638, 0, 0, 0, 1, 1,
-0.736531, 0.7411503, -0.6130128, 0, 0, 0, 1, 1,
-0.7331635, -0.6376011, -3.325272, 0, 0, 0, 1, 1,
-0.7327013, 0.03269134, -1.38356, 0, 0, 0, 1, 1,
-0.731904, 0.6849153, -0.2211002, 0, 0, 0, 1, 1,
-0.7317304, -0.1659733, -0.5520961, 0, 0, 0, 1, 1,
-0.7279899, 0.6051561, -0.09603645, 0, 0, 0, 1, 1,
-0.7227273, 0.2880805, -2.264244, 1, 1, 1, 1, 1,
-0.7189121, -1.130592, -4.050974, 1, 1, 1, 1, 1,
-0.7188415, 0.7810609, -2.845035, 1, 1, 1, 1, 1,
-0.7142417, -0.07941785, -1.807749, 1, 1, 1, 1, 1,
-0.7099671, 0.7169208, -1.117846, 1, 1, 1, 1, 1,
-0.7085576, 0.06261667, -1.257791, 1, 1, 1, 1, 1,
-0.7048098, -0.9726372, -4.480212, 1, 1, 1, 1, 1,
-0.6976643, 0.162687, -1.250375, 1, 1, 1, 1, 1,
-0.6940925, -1.130816, -4.399445, 1, 1, 1, 1, 1,
-0.6926102, 0.006763765, -1.842774, 1, 1, 1, 1, 1,
-0.6886936, 0.6901147, 0.8938508, 1, 1, 1, 1, 1,
-0.6832156, -0.1172319, -4.436584, 1, 1, 1, 1, 1,
-0.682479, 0.9653518, 0.1521782, 1, 1, 1, 1, 1,
-0.6773076, 1.240188, -2.067199, 1, 1, 1, 1, 1,
-0.6765035, 0.7357154, -0.2339567, 1, 1, 1, 1, 1,
-0.6763008, 0.2724128, -0.9524004, 0, 0, 1, 1, 1,
-0.672186, -0.4277728, -1.246797, 1, 0, 0, 1, 1,
-0.6704145, 0.3263962, -0.1702565, 1, 0, 0, 1, 1,
-0.6679335, -0.7377645, -1.089891, 1, 0, 0, 1, 1,
-0.6666218, 1.210176, -0.317235, 1, 0, 0, 1, 1,
-0.6662499, 0.5630203, -2.005097, 1, 0, 0, 1, 1,
-0.664929, -0.9680014, -3.67198, 0, 0, 0, 1, 1,
-0.660894, 0.3344989, -0.7831435, 0, 0, 0, 1, 1,
-0.6535803, -1.395414, 0.8156032, 0, 0, 0, 1, 1,
-0.653187, 1.188231, 0.2600039, 0, 0, 0, 1, 1,
-0.6496387, 0.4896078, -0.1864717, 0, 0, 0, 1, 1,
-0.6486914, 0.6030664, -0.8152283, 0, 0, 0, 1, 1,
-0.6436141, -1.028265, -1.554862, 0, 0, 0, 1, 1,
-0.6422087, 0.3212113, -1.073421, 1, 1, 1, 1, 1,
-0.6407386, 1.836281, 0.1442972, 1, 1, 1, 1, 1,
-0.6319287, 0.3402173, -0.5376286, 1, 1, 1, 1, 1,
-0.6313493, -0.2466801, -0.5694863, 1, 1, 1, 1, 1,
-0.6303377, -1.946102, -1.594185, 1, 1, 1, 1, 1,
-0.6230527, 0.06111205, -2.466275, 1, 1, 1, 1, 1,
-0.6209584, 0.02899481, -1.193907, 1, 1, 1, 1, 1,
-0.6190609, -0.4681551, -1.358724, 1, 1, 1, 1, 1,
-0.6109148, 1.529295, -1.067579, 1, 1, 1, 1, 1,
-0.607325, -0.5579133, -3.591691, 1, 1, 1, 1, 1,
-0.6062571, -0.9378441, -0.9749186, 1, 1, 1, 1, 1,
-0.6022952, 0.08515547, -0.2426985, 1, 1, 1, 1, 1,
-0.6020176, -0.5339149, -3.628223, 1, 1, 1, 1, 1,
-0.5977964, -2.359147, -2.16481, 1, 1, 1, 1, 1,
-0.596074, 0.100719, 0.2174874, 1, 1, 1, 1, 1,
-0.5884646, -0.7645053, -4.71237, 0, 0, 1, 1, 1,
-0.5877516, 0.9059318, -0.04271502, 1, 0, 0, 1, 1,
-0.583754, 0.7896127, -0.6742945, 1, 0, 0, 1, 1,
-0.5783366, 1.017984, -1.169726, 1, 0, 0, 1, 1,
-0.5763791, -0.5649843, -2.132978, 1, 0, 0, 1, 1,
-0.5740587, 0.3430614, -0.9211665, 1, 0, 0, 1, 1,
-0.5723373, 0.4373438, -1.823316, 0, 0, 0, 1, 1,
-0.5641617, 1.17089, 0.6351763, 0, 0, 0, 1, 1,
-0.5586691, -0.9960399, -2.689596, 0, 0, 0, 1, 1,
-0.5526749, -0.01418147, -3.094636, 0, 0, 0, 1, 1,
-0.5525124, -1.524843, -3.301727, 0, 0, 0, 1, 1,
-0.5496734, 0.02110557, -3.44336, 0, 0, 0, 1, 1,
-0.5395818, 0.3661426, -0.6414907, 0, 0, 0, 1, 1,
-0.5382758, -1.545233, -1.580343, 1, 1, 1, 1, 1,
-0.5353362, -0.8204466, -3.315336, 1, 1, 1, 1, 1,
-0.5287386, -1.431955, -2.322091, 1, 1, 1, 1, 1,
-0.5280275, -0.8534717, -1.660907, 1, 1, 1, 1, 1,
-0.5273385, -1.1761, -2.510104, 1, 1, 1, 1, 1,
-0.5268082, -0.8788108, -0.710968, 1, 1, 1, 1, 1,
-0.5175875, -0.03432899, -1.996138, 1, 1, 1, 1, 1,
-0.5145917, 1.409212, -1.947174, 1, 1, 1, 1, 1,
-0.5141244, -0.7614413, -3.251303, 1, 1, 1, 1, 1,
-0.5130757, 1.121707, 0.3413837, 1, 1, 1, 1, 1,
-0.5091781, -0.6250577, -2.082549, 1, 1, 1, 1, 1,
-0.5081692, -0.3341088, 0.1620952, 1, 1, 1, 1, 1,
-0.5080823, 0.7487735, 0.8831936, 1, 1, 1, 1, 1,
-0.5048346, 0.9284416, -0.2175635, 1, 1, 1, 1, 1,
-0.5017191, 1.463483, 0.2056912, 1, 1, 1, 1, 1,
-0.5008098, 0.6023812, -2.564902, 0, 0, 1, 1, 1,
-0.5001736, 0.2067764, 0.2266543, 1, 0, 0, 1, 1,
-0.4915531, -1.081581, -3.484442, 1, 0, 0, 1, 1,
-0.4897303, -1.706903, -2.008375, 1, 0, 0, 1, 1,
-0.4860546, 0.2851261, -1.405235, 1, 0, 0, 1, 1,
-0.4855604, -1.299341, -2.815565, 1, 0, 0, 1, 1,
-0.4824145, 0.8557135, -1.919548, 0, 0, 0, 1, 1,
-0.4800713, 0.4541261, -1.805841, 0, 0, 0, 1, 1,
-0.4758978, 0.7360836, -0.2975547, 0, 0, 0, 1, 1,
-0.4706678, 1.749388, -0.7291986, 0, 0, 0, 1, 1,
-0.4604837, 1.013878, -0.4802998, 0, 0, 0, 1, 1,
-0.4598556, -0.4552033, -2.853795, 0, 0, 0, 1, 1,
-0.4576397, 0.07885897, 0.1433152, 0, 0, 0, 1, 1,
-0.454031, 1.768542, -0.2837205, 1, 1, 1, 1, 1,
-0.450853, -1.080359, -1.80889, 1, 1, 1, 1, 1,
-0.4503665, -0.06482074, -2.824792, 1, 1, 1, 1, 1,
-0.4488119, -0.3536884, -1.884146, 1, 1, 1, 1, 1,
-0.4438928, -0.3446115, -2.506797, 1, 1, 1, 1, 1,
-0.4347247, 0.6325927, -0.1533234, 1, 1, 1, 1, 1,
-0.4347172, 0.3114105, -1.615241, 1, 1, 1, 1, 1,
-0.429014, 0.5922523, -1.434723, 1, 1, 1, 1, 1,
-0.4265703, 0.5385714, -1.188619, 1, 1, 1, 1, 1,
-0.4250655, 0.748744, -0.9045735, 1, 1, 1, 1, 1,
-0.4203787, -0.181624, -1.951052, 1, 1, 1, 1, 1,
-0.414718, 0.08531457, -0.6512397, 1, 1, 1, 1, 1,
-0.4110169, 0.9533747, 0.5588189, 1, 1, 1, 1, 1,
-0.3983281, 0.8122398, 1.023407, 1, 1, 1, 1, 1,
-0.3944459, 1.04165, 2.965211, 1, 1, 1, 1, 1,
-0.3851815, -0.01974403, -2.038007, 0, 0, 1, 1, 1,
-0.3843868, -1.735002, -3.357672, 1, 0, 0, 1, 1,
-0.3814998, 0.2605537, -1.128362, 1, 0, 0, 1, 1,
-0.3809232, -0.4508813, -2.254202, 1, 0, 0, 1, 1,
-0.3782373, 1.396413, -0.4176622, 1, 0, 0, 1, 1,
-0.3778688, -0.9282542, -1.592645, 1, 0, 0, 1, 1,
-0.3733983, -2.385061, -4.274383, 0, 0, 0, 1, 1,
-0.3705828, 1.703692, -0.4189557, 0, 0, 0, 1, 1,
-0.3705285, 0.2124739, 1.118605, 0, 0, 0, 1, 1,
-0.3704883, 0.5853111, 0.08907587, 0, 0, 0, 1, 1,
-0.3632901, -0.9841939, -1.746743, 0, 0, 0, 1, 1,
-0.3615982, 0.1117643, -0.2501526, 0, 0, 0, 1, 1,
-0.359369, -0.7320416, -2.299937, 0, 0, 0, 1, 1,
-0.3567119, -0.5724388, -4.117283, 1, 1, 1, 1, 1,
-0.3553593, -0.9361678, -2.176224, 1, 1, 1, 1, 1,
-0.35451, -2.959394, -2.553271, 1, 1, 1, 1, 1,
-0.3525812, -0.02040918, -1.568398, 1, 1, 1, 1, 1,
-0.3458035, 1.049562, -0.2887291, 1, 1, 1, 1, 1,
-0.3441889, 1.291291, -2.047628, 1, 1, 1, 1, 1,
-0.3438578, -0.7582468, -3.237706, 1, 1, 1, 1, 1,
-0.3422453, -0.3055542, -3.121783, 1, 1, 1, 1, 1,
-0.3414796, 0.6576226, -0.7974555, 1, 1, 1, 1, 1,
-0.341383, -0.6967217, -3.468034, 1, 1, 1, 1, 1,
-0.3297834, -1.911102, -3.23258, 1, 1, 1, 1, 1,
-0.3294139, 1.424801, 1.543622, 1, 1, 1, 1, 1,
-0.32548, 0.5118183, -0.1829316, 1, 1, 1, 1, 1,
-0.3135734, -0.008520423, -1.629086, 1, 1, 1, 1, 1,
-0.3131129, 1.482362, -1.683623, 1, 1, 1, 1, 1,
-0.3127201, -0.2979923, -1.581945, 0, 0, 1, 1, 1,
-0.3071528, -1.439506, -2.939918, 1, 0, 0, 1, 1,
-0.306605, -0.7520336, -3.930121, 1, 0, 0, 1, 1,
-0.2961856, -0.3735503, -2.047153, 1, 0, 0, 1, 1,
-0.294472, -0.415656, -2.282243, 1, 0, 0, 1, 1,
-0.2934628, -0.1009306, -2.02399, 1, 0, 0, 1, 1,
-0.2826461, -0.9391546, -2.680407, 0, 0, 0, 1, 1,
-0.278823, -0.7072144, -3.397168, 0, 0, 0, 1, 1,
-0.2755601, 1.980814, 0.6643597, 0, 0, 0, 1, 1,
-0.2734021, -0.9592431, -2.796605, 0, 0, 0, 1, 1,
-0.2713293, 0.3691667, -1.819581, 0, 0, 0, 1, 1,
-0.2713248, -0.04188975, -1.241441, 0, 0, 0, 1, 1,
-0.2707029, -0.4945376, -1.795952, 0, 0, 0, 1, 1,
-0.2577547, 1.784932, 0.002742997, 1, 1, 1, 1, 1,
-0.2550466, -2.404552, -4.54496, 1, 1, 1, 1, 1,
-0.252476, -0.6674928, -3.756828, 1, 1, 1, 1, 1,
-0.2519557, 1.274171, -0.7689083, 1, 1, 1, 1, 1,
-0.2512231, 0.6935767, 0.7576504, 1, 1, 1, 1, 1,
-0.2500302, -1.028085, -3.270231, 1, 1, 1, 1, 1,
-0.2410306, 0.1273908, -2.518303, 1, 1, 1, 1, 1,
-0.2374051, 0.4003453, 0.4275833, 1, 1, 1, 1, 1,
-0.2366957, -0.5535193, -1.661374, 1, 1, 1, 1, 1,
-0.2354069, -0.05020401, -2.987853, 1, 1, 1, 1, 1,
-0.2317623, 0.8634872, 0.04574402, 1, 1, 1, 1, 1,
-0.2314802, -0.4751511, -3.172905, 1, 1, 1, 1, 1,
-0.2290968, 0.7817035, -0.05063705, 1, 1, 1, 1, 1,
-0.2244155, 0.6804169, -0.1624834, 1, 1, 1, 1, 1,
-0.2216118, -0.2785702, -3.179809, 1, 1, 1, 1, 1,
-0.2193632, -0.07754139, -2.209368, 0, 0, 1, 1, 1,
-0.21928, -1.31666, -2.639937, 1, 0, 0, 1, 1,
-0.2173487, 0.478366, -0.4464626, 1, 0, 0, 1, 1,
-0.216513, 1.293544, 0.9807268, 1, 0, 0, 1, 1,
-0.2163074, -1.0355, -3.68016, 1, 0, 0, 1, 1,
-0.215142, 0.3485758, -0.4498303, 1, 0, 0, 1, 1,
-0.2135236, 1.264018, 1.397459, 0, 0, 0, 1, 1,
-0.2128407, 0.4958542, -0.5231957, 0, 0, 0, 1, 1,
-0.2124678, -0.01404162, -3.081097, 0, 0, 0, 1, 1,
-0.2108585, -0.8411225, -2.857667, 0, 0, 0, 1, 1,
-0.2046632, -1.518044, -1.093533, 0, 0, 0, 1, 1,
-0.2026443, -0.03195268, -2.263683, 0, 0, 0, 1, 1,
-0.2022565, 0.03941353, -2.047393, 0, 0, 0, 1, 1,
-0.1985194, -3.025236, -2.498605, 1, 1, 1, 1, 1,
-0.1984143, 1.657588, 0.004652959, 1, 1, 1, 1, 1,
-0.1980935, 1.290209, 0.2688194, 1, 1, 1, 1, 1,
-0.1979219, -1.169765, -4.316588, 1, 1, 1, 1, 1,
-0.1960509, 0.7921542, 0.3838243, 1, 1, 1, 1, 1,
-0.1957155, 0.123367, -1.400462, 1, 1, 1, 1, 1,
-0.1937037, -0.1108601, -3.646046, 1, 1, 1, 1, 1,
-0.1929678, -0.2398604, -2.173184, 1, 1, 1, 1, 1,
-0.1915349, 0.03994079, -2.455552, 1, 1, 1, 1, 1,
-0.1903755, 1.931257, -1.127504, 1, 1, 1, 1, 1,
-0.1880603, -0.540449, -3.781344, 1, 1, 1, 1, 1,
-0.1834627, -0.5676821, -4.252084, 1, 1, 1, 1, 1,
-0.1829149, -0.1134977, -1.089987, 1, 1, 1, 1, 1,
-0.1821308, -0.3339576, -1.404224, 1, 1, 1, 1, 1,
-0.1783532, 0.8755872, -1.084237, 1, 1, 1, 1, 1,
-0.177816, -0.6351206, -3.088553, 0, 0, 1, 1, 1,
-0.1775219, -0.07360396, -1.042132, 1, 0, 0, 1, 1,
-0.1758872, 0.9212024, 0.1657552, 1, 0, 0, 1, 1,
-0.1733098, -1.434524, -2.696684, 1, 0, 0, 1, 1,
-0.1665658, 0.08197508, -3.033993, 1, 0, 0, 1, 1,
-0.1652104, 0.9662786, 0.5822138, 1, 0, 0, 1, 1,
-0.1600474, -0.775539, -1.916756, 0, 0, 0, 1, 1,
-0.1599777, 1.524619, 0.2946216, 0, 0, 0, 1, 1,
-0.1590838, -0.4460456, -2.93912, 0, 0, 0, 1, 1,
-0.1566862, 0.2327052, 1.054168, 0, 0, 0, 1, 1,
-0.1563548, -0.1177061, -3.541379, 0, 0, 0, 1, 1,
-0.1556177, -0.08921029, -1.607536, 0, 0, 0, 1, 1,
-0.151046, 1.746825, -0.3029162, 0, 0, 0, 1, 1,
-0.148982, -0.6292445, -3.520733, 1, 1, 1, 1, 1,
-0.1422148, 1.992601, 1.017345, 1, 1, 1, 1, 1,
-0.1395695, -0.4026358, -2.490444, 1, 1, 1, 1, 1,
-0.1392217, 0.3391683, 0.3298193, 1, 1, 1, 1, 1,
-0.1379792, 0.1643311, -0.5475879, 1, 1, 1, 1, 1,
-0.1372616, 0.2621375, 0.6694202, 1, 1, 1, 1, 1,
-0.136787, 0.6806312, 0.03900613, 1, 1, 1, 1, 1,
-0.1358511, 0.3046483, -1.267802, 1, 1, 1, 1, 1,
-0.1342547, -0.1665784, -2.798032, 1, 1, 1, 1, 1,
-0.1298873, 1.975342, 1.381407, 1, 1, 1, 1, 1,
-0.1269551, 0.7188979, -0.9534271, 1, 1, 1, 1, 1,
-0.1258372, -1.219422, -2.70428, 1, 1, 1, 1, 1,
-0.1243741, 1.005097, -0.6969792, 1, 1, 1, 1, 1,
-0.1215151, 1.965386, -0.4608897, 1, 1, 1, 1, 1,
-0.1199312, -1.448318, -2.773912, 1, 1, 1, 1, 1,
-0.1183, -0.5075279, -3.155604, 0, 0, 1, 1, 1,
-0.1178561, 0.02049772, -0.5409898, 1, 0, 0, 1, 1,
-0.1154469, 1.80187, -2.350723, 1, 0, 0, 1, 1,
-0.1112349, -1.091276, -3.481821, 1, 0, 0, 1, 1,
-0.1107427, 0.1057503, 0.7784935, 1, 0, 0, 1, 1,
-0.1088147, -1.815667, -4.743196, 1, 0, 0, 1, 1,
-0.1073985, 1.095192, -0.3336806, 0, 0, 0, 1, 1,
-0.1055715, -0.9329345, -1.205352, 0, 0, 0, 1, 1,
-0.09814474, -0.9058179, -2.631189, 0, 0, 0, 1, 1,
-0.09580638, -1.103717, -3.196043, 0, 0, 0, 1, 1,
-0.08863994, 2.649191, 0.4275163, 0, 0, 0, 1, 1,
-0.08861072, -1.42758, -2.697048, 0, 0, 0, 1, 1,
-0.08829276, 0.5359263, -0.1896341, 0, 0, 0, 1, 1,
-0.08511922, 1.29285, 1.572573, 1, 1, 1, 1, 1,
-0.08065551, 0.07754681, -0.03065513, 1, 1, 1, 1, 1,
-0.08050395, 0.9634977, -0.8227203, 1, 1, 1, 1, 1,
-0.0790847, -0.4508878, -2.630877, 1, 1, 1, 1, 1,
-0.07820535, 0.3260617, -0.2200615, 1, 1, 1, 1, 1,
-0.07744981, -0.4581267, -2.623409, 1, 1, 1, 1, 1,
-0.07644837, 1.453969, 0.6602004, 1, 1, 1, 1, 1,
-0.07521462, -1.095197, -2.415937, 1, 1, 1, 1, 1,
-0.06809694, -2.177254, -2.918429, 1, 1, 1, 1, 1,
-0.0668226, 0.1216984, -1.11309, 1, 1, 1, 1, 1,
-0.06239653, 2.107495, -0.9359407, 1, 1, 1, 1, 1,
-0.06235436, 1.989606, 1.037782, 1, 1, 1, 1, 1,
-0.0528082, 0.0931685, -0.06810559, 1, 1, 1, 1, 1,
-0.05061872, -1.631336, -3.147577, 1, 1, 1, 1, 1,
-0.04868945, 1.574958, -0.4963085, 1, 1, 1, 1, 1,
-0.04658007, -1.012274, -2.839897, 0, 0, 1, 1, 1,
-0.04518845, -0.2875659, -4.067953, 1, 0, 0, 1, 1,
-0.04269022, -0.3303655, -1.456925, 1, 0, 0, 1, 1,
-0.04188876, -0.5931043, -1.415311, 1, 0, 0, 1, 1,
-0.04184214, -0.3853621, -2.988399, 1, 0, 0, 1, 1,
-0.0408557, 1.453247, -0.443837, 1, 0, 0, 1, 1,
-0.0403266, -0.6347774, -3.120864, 0, 0, 0, 1, 1,
-0.03636948, -0.4253732, -2.653065, 0, 0, 0, 1, 1,
-0.03552429, -0.5283633, -2.340354, 0, 0, 0, 1, 1,
-0.03493904, -1.120471, -1.449602, 0, 0, 0, 1, 1,
-0.03399573, 0.2682104, 0.6191316, 0, 0, 0, 1, 1,
-0.03188527, 1.235567, -0.2832017, 0, 0, 0, 1, 1,
-0.03068583, -0.8780096, -2.606258, 0, 0, 0, 1, 1,
-0.02966825, 0.5847003, -1.959023, 1, 1, 1, 1, 1,
-0.0286971, -0.8613715, -2.0332, 1, 1, 1, 1, 1,
-0.02327986, 1.506946, -0.6404147, 1, 1, 1, 1, 1,
-0.01955152, 0.4404754, -1.072997, 1, 1, 1, 1, 1,
-0.01905669, 0.4864434, -0.7498924, 1, 1, 1, 1, 1,
-0.01654504, -0.03367602, -4.091568, 1, 1, 1, 1, 1,
-0.0152472, -0.7729197, -3.77128, 1, 1, 1, 1, 1,
-0.0137174, -0.9861651, -3.490809, 1, 1, 1, 1, 1,
-0.009701609, -0.5075905, -2.656376, 1, 1, 1, 1, 1,
-0.005163053, -0.8819856, -3.196677, 1, 1, 1, 1, 1,
-0.002054484, 0.6970854, -1.51351, 1, 1, 1, 1, 1,
-0.001275022, -1.233419, -1.575394, 1, 1, 1, 1, 1,
0.001250739, 0.4113272, -0.3761179, 1, 1, 1, 1, 1,
0.002984113, 0.3958666, 1.078644, 1, 1, 1, 1, 1,
0.004774974, 0.08267315, 0.5754491, 1, 1, 1, 1, 1,
0.005253813, 0.6305439, 0.2908895, 0, 0, 1, 1, 1,
0.006895454, 0.3741335, 1.533177, 1, 0, 0, 1, 1,
0.007813023, 0.3744926, -0.2464808, 1, 0, 0, 1, 1,
0.009370873, 1.006056, -0.06801058, 1, 0, 0, 1, 1,
0.009755668, 1.248964, 0.1475775, 1, 0, 0, 1, 1,
0.01896483, -0.9462394, 4.590316, 1, 0, 0, 1, 1,
0.01910836, -0.1425387, 1.771643, 0, 0, 0, 1, 1,
0.02459126, -0.2995014, 3.033376, 0, 0, 0, 1, 1,
0.02467971, 2.177192, 0.5160503, 0, 0, 0, 1, 1,
0.02763156, -1.017271, 1.889253, 0, 0, 0, 1, 1,
0.02832671, -0.1125753, 3.158816, 0, 0, 0, 1, 1,
0.03013666, -0.1242089, 2.028691, 0, 0, 0, 1, 1,
0.03527563, 0.7635847, -0.4667026, 0, 0, 0, 1, 1,
0.03528009, 1.131045, 0.3549215, 1, 1, 1, 1, 1,
0.035972, 0.7381148, 1.96341, 1, 1, 1, 1, 1,
0.0361348, 1.171433, 0.6993555, 1, 1, 1, 1, 1,
0.03759803, 0.6916478, -1.410363, 1, 1, 1, 1, 1,
0.03922524, 0.3497039, -0.8765203, 1, 1, 1, 1, 1,
0.04120667, 0.1904599, 0.7190127, 1, 1, 1, 1, 1,
0.04393144, -1.045538, 1.300442, 1, 1, 1, 1, 1,
0.04481723, 0.7794898, -0.759543, 1, 1, 1, 1, 1,
0.0453851, -0.1457631, 3.002781, 1, 1, 1, 1, 1,
0.04653369, -0.3823394, 2.980844, 1, 1, 1, 1, 1,
0.04817084, 1.781838, 0.9577731, 1, 1, 1, 1, 1,
0.05707391, -0.02340632, 1.084724, 1, 1, 1, 1, 1,
0.05957311, 1.138844, 1.874182, 1, 1, 1, 1, 1,
0.06039462, 1.427021, -0.7395396, 1, 1, 1, 1, 1,
0.063393, -0.1460804, 2.167038, 1, 1, 1, 1, 1,
0.06646127, -0.9174362, 4.373196, 0, 0, 1, 1, 1,
0.06930194, -0.5369835, 4.128217, 1, 0, 0, 1, 1,
0.06963323, 0.1200242, 0.9389957, 1, 0, 0, 1, 1,
0.0723291, 2.534263, -0.1222327, 1, 0, 0, 1, 1,
0.07234374, 1.146726, -1.49181, 1, 0, 0, 1, 1,
0.07642124, 0.9592817, -0.3388024, 1, 0, 0, 1, 1,
0.07717765, -1.141499, 2.539771, 0, 0, 0, 1, 1,
0.07843443, 0.6245952, -0.8213358, 0, 0, 0, 1, 1,
0.07906013, 2.73682, -1.735967, 0, 0, 0, 1, 1,
0.08122699, 0.07463314, 1.575117, 0, 0, 0, 1, 1,
0.08996036, -0.9407414, 3.306324, 0, 0, 0, 1, 1,
0.09311582, -0.2014656, 3.370163, 0, 0, 0, 1, 1,
0.09854954, -0.2752725, 2.840884, 0, 0, 0, 1, 1,
0.09993744, -0.07288991, 2.994541, 1, 1, 1, 1, 1,
0.1108061, -0.7189855, 1.598825, 1, 1, 1, 1, 1,
0.1138146, -0.3313185, 2.46054, 1, 1, 1, 1, 1,
0.1145051, 0.1026122, 0.846108, 1, 1, 1, 1, 1,
0.1157889, 0.3643174, -0.2457673, 1, 1, 1, 1, 1,
0.1164163, 0.1023792, -0.1429397, 1, 1, 1, 1, 1,
0.1177796, 0.1250176, 0.2388485, 1, 1, 1, 1, 1,
0.1198389, 0.1455675, -0.9248299, 1, 1, 1, 1, 1,
0.1296624, -0.9759815, 2.868734, 1, 1, 1, 1, 1,
0.1298476, 0.7060188, 1.286824, 1, 1, 1, 1, 1,
0.133893, -0.526557, 2.435836, 1, 1, 1, 1, 1,
0.1351449, 1.019789, -0.6718872, 1, 1, 1, 1, 1,
0.13673, -0.7573779, 3.715781, 1, 1, 1, 1, 1,
0.1391309, -0.01648989, 1.847093, 1, 1, 1, 1, 1,
0.139905, -0.5436639, 4.000229, 1, 1, 1, 1, 1,
0.1430233, -0.6578426, 1.188253, 0, 0, 1, 1, 1,
0.1470844, 0.06778857, 0.1130153, 1, 0, 0, 1, 1,
0.1505242, -0.774519, 3.499411, 1, 0, 0, 1, 1,
0.1520179, -0.9389535, 2.112408, 1, 0, 0, 1, 1,
0.152024, -0.2856129, 2.011721, 1, 0, 0, 1, 1,
0.1527416, -0.9027489, 3.199231, 1, 0, 0, 1, 1,
0.1532395, -0.4648782, 2.358729, 0, 0, 0, 1, 1,
0.1569079, -1.389208, 2.100639, 0, 0, 0, 1, 1,
0.1571193, 0.1604152, 0.1537069, 0, 0, 0, 1, 1,
0.1702001, 0.6430094, 0.5376924, 0, 0, 0, 1, 1,
0.1738371, -0.699115, 2.706164, 0, 0, 0, 1, 1,
0.1766929, -0.02557827, 2.485913, 0, 0, 0, 1, 1,
0.177373, 0.3514279, 1.555349, 0, 0, 0, 1, 1,
0.182921, 1.242133, 0.2730345, 1, 1, 1, 1, 1,
0.185831, 0.260653, 1.621475, 1, 1, 1, 1, 1,
0.1866612, -1.409099, 3.542669, 1, 1, 1, 1, 1,
0.187153, 1.191019, -1.001129, 1, 1, 1, 1, 1,
0.1918734, -0.439116, 0.4014294, 1, 1, 1, 1, 1,
0.1935115, 0.2091826, 1.588619, 1, 1, 1, 1, 1,
0.1990657, -1.500943, 2.951429, 1, 1, 1, 1, 1,
0.2029517, -0.3116102, 2.019183, 1, 1, 1, 1, 1,
0.2054961, 1.099338, 2.67587, 1, 1, 1, 1, 1,
0.216756, -1.684599, 4.277434, 1, 1, 1, 1, 1,
0.2188824, 0.2783795, 0.2954351, 1, 1, 1, 1, 1,
0.2233166, -0.1806931, 1.834551, 1, 1, 1, 1, 1,
0.2280737, 0.02859143, 1.196012, 1, 1, 1, 1, 1,
0.2312035, -1.843317, 3.582014, 1, 1, 1, 1, 1,
0.2347558, 0.751299, 0.04498915, 1, 1, 1, 1, 1,
0.2355684, -1.713091, 2.569797, 0, 0, 1, 1, 1,
0.2383348, 0.672891, -0.04077914, 1, 0, 0, 1, 1,
0.243363, -0.3470247, 2.212418, 1, 0, 0, 1, 1,
0.2439965, 1.925184, 0.05597018, 1, 0, 0, 1, 1,
0.2451929, 0.3812129, 0.3942559, 1, 0, 0, 1, 1,
0.245453, -0.5980817, 3.15582, 1, 0, 0, 1, 1,
0.2476143, 0.9113792, 1.180086, 0, 0, 0, 1, 1,
0.2480747, 0.8983237, -0.02103261, 0, 0, 0, 1, 1,
0.2496022, 0.7593004, 1.098145, 0, 0, 0, 1, 1,
0.2496896, 0.2493095, 0.4309793, 0, 0, 0, 1, 1,
0.2504185, 0.7232152, 0.4391357, 0, 0, 0, 1, 1,
0.2535228, 1.175339, -0.5013243, 0, 0, 0, 1, 1,
0.2667694, -0.436123, 2.690515, 0, 0, 0, 1, 1,
0.2676822, 0.6735545, -0.5342818, 1, 1, 1, 1, 1,
0.2678835, 0.7665864, -1.252416, 1, 1, 1, 1, 1,
0.2687828, -1.76384, 3.001693, 1, 1, 1, 1, 1,
0.2697337, -1.620341, 3.258777, 1, 1, 1, 1, 1,
0.2712685, 1.594062, 0.5233268, 1, 1, 1, 1, 1,
0.2757889, 2.503874, -0.8336225, 1, 1, 1, 1, 1,
0.2816526, -1.916506, 2.014722, 1, 1, 1, 1, 1,
0.2895387, 0.1556985, 1.207837, 1, 1, 1, 1, 1,
0.2914583, 1.281764, 2.570355, 1, 1, 1, 1, 1,
0.2915965, -1.058726, 2.621963, 1, 1, 1, 1, 1,
0.2958106, -1.20026, 3.501832, 1, 1, 1, 1, 1,
0.297796, -0.1866023, 4.199251, 1, 1, 1, 1, 1,
0.2989108, 0.96167, -0.4751842, 1, 1, 1, 1, 1,
0.3002763, 0.2141824, -2.097207, 1, 1, 1, 1, 1,
0.3042024, -0.4813858, 3.825663, 1, 1, 1, 1, 1,
0.3098702, -1.974108, 2.633498, 0, 0, 1, 1, 1,
0.3099992, -1.032122, 3.739198, 1, 0, 0, 1, 1,
0.3130805, 0.3719894, -0.5397331, 1, 0, 0, 1, 1,
0.3133458, -0.7144712, 2.268366, 1, 0, 0, 1, 1,
0.3197252, -0.2691243, 2.01788, 1, 0, 0, 1, 1,
0.3199149, 0.2093375, 0.2330539, 1, 0, 0, 1, 1,
0.3219435, 2.603915, 1.397729, 0, 0, 0, 1, 1,
0.3234955, -2.457758, 1.76343, 0, 0, 0, 1, 1,
0.3262038, 1.250664, -0.3016203, 0, 0, 0, 1, 1,
0.3264563, 1.362343, -0.06888677, 0, 0, 0, 1, 1,
0.327435, 0.01676636, 1.878774, 0, 0, 0, 1, 1,
0.3287165, -0.1950616, 0.5901301, 0, 0, 0, 1, 1,
0.329189, 0.1334788, 1.256112, 0, 0, 0, 1, 1,
0.3305084, 0.1350943, 1.235109, 1, 1, 1, 1, 1,
0.3310222, 0.6242317, -0.6157247, 1, 1, 1, 1, 1,
0.3333982, -1.775065, 2.748014, 1, 1, 1, 1, 1,
0.3358022, 0.6095454, 0.4484229, 1, 1, 1, 1, 1,
0.3412081, -0.9106267, 0.7999725, 1, 1, 1, 1, 1,
0.3467279, -0.5231251, 2.484921, 1, 1, 1, 1, 1,
0.3508036, 0.4921223, 0.9216096, 1, 1, 1, 1, 1,
0.3515746, -1.683104, 4.55128, 1, 1, 1, 1, 1,
0.3539656, -0.7010438, 3.120443, 1, 1, 1, 1, 1,
0.3554476, 0.7476597, 0.6040478, 1, 1, 1, 1, 1,
0.357267, 0.8605255, -1.186531, 1, 1, 1, 1, 1,
0.3661614, 0.1727797, 1.170176, 1, 1, 1, 1, 1,
0.3665138, -0.2486875, 2.123545, 1, 1, 1, 1, 1,
0.3676828, -0.6130763, 3.037483, 1, 1, 1, 1, 1,
0.3706837, -0.5560627, 4.262305, 1, 1, 1, 1, 1,
0.3708078, 0.4117918, 1.039598, 0, 0, 1, 1, 1,
0.3718396, -0.07961868, 1.666921, 1, 0, 0, 1, 1,
0.3751816, -0.4127057, 2.149272, 1, 0, 0, 1, 1,
0.3754374, 0.6057186, 0.8524733, 1, 0, 0, 1, 1,
0.3786855, 0.8253861, 3.247066, 1, 0, 0, 1, 1,
0.3844203, -0.7379898, 3.287482, 1, 0, 0, 1, 1,
0.3879463, -0.3703118, 1.789297, 0, 0, 0, 1, 1,
0.3881896, -1.497217, 3.233737, 0, 0, 0, 1, 1,
0.3927327, -0.8557904, 2.767565, 0, 0, 0, 1, 1,
0.3939031, 3.131476, -0.4829538, 0, 0, 0, 1, 1,
0.3955681, 1.056122, 1.022642, 0, 0, 0, 1, 1,
0.395682, -0.2201389, 2.525951, 0, 0, 0, 1, 1,
0.3962522, 0.1772012, -0.8780283, 0, 0, 0, 1, 1,
0.3982157, 1.146381, 1.16002, 1, 1, 1, 1, 1,
0.403728, 0.1367723, -0.0007639489, 1, 1, 1, 1, 1,
0.4054434, 0.594241, -0.1163527, 1, 1, 1, 1, 1,
0.4059271, -0.6348416, 0.3622881, 1, 1, 1, 1, 1,
0.4208617, -0.8543903, 5.256594, 1, 1, 1, 1, 1,
0.426138, 0.3792884, 0.6019145, 1, 1, 1, 1, 1,
0.4261517, -0.5821779, 2.635844, 1, 1, 1, 1, 1,
0.4298757, 0.162459, 1.194043, 1, 1, 1, 1, 1,
0.4311008, -1.908877, 2.671003, 1, 1, 1, 1, 1,
0.4313731, 0.2935326, 0.9694233, 1, 1, 1, 1, 1,
0.4362809, -1.743428, 2.179157, 1, 1, 1, 1, 1,
0.4389211, -0.07646563, 2.039326, 1, 1, 1, 1, 1,
0.4406226, -0.04373404, 1.340462, 1, 1, 1, 1, 1,
0.4542165, -1.176543, 2.963139, 1, 1, 1, 1, 1,
0.4547864, 1.760995, 0.6704652, 1, 1, 1, 1, 1,
0.4581651, -0.4449951, 3.564846, 0, 0, 1, 1, 1,
0.4614667, -0.4249256, 2.960715, 1, 0, 0, 1, 1,
0.462946, -1.404208, 3.391325, 1, 0, 0, 1, 1,
0.4672537, 0.7085229, 0.3291, 1, 0, 0, 1, 1,
0.4686444, 1.461456, 1.329189, 1, 0, 0, 1, 1,
0.4701147, -0.6653509, 4.06993, 1, 0, 0, 1, 1,
0.4705679, -0.4303185, 2.47554, 0, 0, 0, 1, 1,
0.4725373, -0.769433, 1.853536, 0, 0, 0, 1, 1,
0.4734091, 0.3486112, 0.2665204, 0, 0, 0, 1, 1,
0.4734834, -0.9817631, 5.179938, 0, 0, 0, 1, 1,
0.4795026, -1.298678, 1.182987, 0, 0, 0, 1, 1,
0.4842479, 0.151923, 1.086768, 0, 0, 0, 1, 1,
0.4920203, 0.3546401, -0.7127259, 0, 0, 0, 1, 1,
0.4936872, -1.757937, 5.044055, 1, 1, 1, 1, 1,
0.4955021, -0.2902437, 1.971246, 1, 1, 1, 1, 1,
0.4962654, 0.4724694, 0.4977696, 1, 1, 1, 1, 1,
0.5025225, -2.149571, 4.306739, 1, 1, 1, 1, 1,
0.5027717, 1.048702, 0.7742254, 1, 1, 1, 1, 1,
0.5048971, 0.8591458, -1.413964, 1, 1, 1, 1, 1,
0.5060178, -0.1425698, 1.307415, 1, 1, 1, 1, 1,
0.5080203, 1.18933, 1.226562, 1, 1, 1, 1, 1,
0.5084211, -1.390601, 1.865913, 1, 1, 1, 1, 1,
0.5084322, 1.045057, 0.845162, 1, 1, 1, 1, 1,
0.5160642, -1.132454, 2.578515, 1, 1, 1, 1, 1,
0.5220425, -1.565583, 4.845792, 1, 1, 1, 1, 1,
0.5270835, 0.7095943, 0.9930885, 1, 1, 1, 1, 1,
0.5291519, -0.2383837, 2.531344, 1, 1, 1, 1, 1,
0.5369026, 2.813091, 1.957581, 1, 1, 1, 1, 1,
0.541424, -1.288471, 2.353877, 0, 0, 1, 1, 1,
0.5420077, 0.5698522, 1.481834, 1, 0, 0, 1, 1,
0.5424301, -0.9269814, 3.00997, 1, 0, 0, 1, 1,
0.5443886, 1.468615, 1.017706, 1, 0, 0, 1, 1,
0.5468513, -0.7538881, 1.908417, 1, 0, 0, 1, 1,
0.5530921, -0.1820626, 2.752903, 1, 0, 0, 1, 1,
0.5536096, 0.06713479, 0.1234005, 0, 0, 0, 1, 1,
0.5537019, 0.8996958, 1.60412, 0, 0, 0, 1, 1,
0.5626922, 0.06359555, 0.2008596, 0, 0, 0, 1, 1,
0.5667091, 0.9739614, -0.3369171, 0, 0, 0, 1, 1,
0.5701148, 0.5971336, -0.2057911, 0, 0, 0, 1, 1,
0.5712988, 0.779951, -0.2303179, 0, 0, 0, 1, 1,
0.5724452, -1.246576, 3.998144, 0, 0, 0, 1, 1,
0.5804019, -1.312689, 3.782378, 1, 1, 1, 1, 1,
0.5818299, -1.028439, 4.036198, 1, 1, 1, 1, 1,
0.5830479, -0.1827514, 1.533967, 1, 1, 1, 1, 1,
0.584725, 0.6092415, 1.314384, 1, 1, 1, 1, 1,
0.5853765, -0.2273737, 2.880058, 1, 1, 1, 1, 1,
0.5887784, -1.42917, 4.016512, 1, 1, 1, 1, 1,
0.5922569, 1.840143, -1.357407, 1, 1, 1, 1, 1,
0.5922844, -0.03720413, 0.5873466, 1, 1, 1, 1, 1,
0.5935929, -1.257832, 2.568872, 1, 1, 1, 1, 1,
0.5967827, 1.259531, -0.764959, 1, 1, 1, 1, 1,
0.5997596, 0.5720117, 1.257093, 1, 1, 1, 1, 1,
0.6016865, -1.684987, 3.806752, 1, 1, 1, 1, 1,
0.6028184, -1.407008, 3.385907, 1, 1, 1, 1, 1,
0.6044034, 1.060945, -1.2205, 1, 1, 1, 1, 1,
0.6047926, -0.9580082, 3.616637, 1, 1, 1, 1, 1,
0.610876, 0.7105083, -0.04714908, 0, 0, 1, 1, 1,
0.6145967, -0.1680548, 1.406717, 1, 0, 0, 1, 1,
0.6152841, -0.365441, 2.135337, 1, 0, 0, 1, 1,
0.622121, -2.194559, 2.861248, 1, 0, 0, 1, 1,
0.6257345, -0.370259, 1.811972, 1, 0, 0, 1, 1,
0.6289306, 1.37886, 0.9247553, 1, 0, 0, 1, 1,
0.6375194, -0.1925322, 1.686701, 0, 0, 0, 1, 1,
0.6424268, -0.7207853, 0.8335466, 0, 0, 0, 1, 1,
0.6459186, -0.4501237, 1.073628, 0, 0, 0, 1, 1,
0.6602572, -0.9893323, 2.571211, 0, 0, 0, 1, 1,
0.6602584, -0.5829588, 2.585696, 0, 0, 0, 1, 1,
0.660408, 0.5059173, 1.205632, 0, 0, 0, 1, 1,
0.6607372, -0.5810962, 2.879933, 0, 0, 0, 1, 1,
0.6624209, -0.101082, 2.62064, 1, 1, 1, 1, 1,
0.6639104, -0.6003062, 2.957481, 1, 1, 1, 1, 1,
0.6647322, -2.533374, 3.567907, 1, 1, 1, 1, 1,
0.6682241, -0.7394918, 3.046654, 1, 1, 1, 1, 1,
0.6697297, 1.433465, -0.893146, 1, 1, 1, 1, 1,
0.6724353, 0.4421817, 1.093376, 1, 1, 1, 1, 1,
0.6800803, 0.08929505, 0.3492443, 1, 1, 1, 1, 1,
0.6811285, 0.8083063, -0.7391138, 1, 1, 1, 1, 1,
0.6820299, 1.173126, 1.034212, 1, 1, 1, 1, 1,
0.6916629, -0.05296413, 2.288953, 1, 1, 1, 1, 1,
0.6931093, -0.1578402, 1.378114, 1, 1, 1, 1, 1,
0.6948134, -0.9804918, 3.308646, 1, 1, 1, 1, 1,
0.708124, -1.099476, 4.457011, 1, 1, 1, 1, 1,
0.7092359, 1.555227, -2.213918, 1, 1, 1, 1, 1,
0.7140819, -0.03695794, 1.795339, 1, 1, 1, 1, 1,
0.7149689, 0.06392787, 2.105747, 0, 0, 1, 1, 1,
0.7214019, 1.986781, 1.086939, 1, 0, 0, 1, 1,
0.7225233, 1.28767, 2.342891, 1, 0, 0, 1, 1,
0.722857, -2.329044, 3.102306, 1, 0, 0, 1, 1,
0.7231209, -0.3184574, 3.789205, 1, 0, 0, 1, 1,
0.7287477, 0.4763371, 1.110605, 1, 0, 0, 1, 1,
0.7332222, 1.645841, -0.489628, 0, 0, 0, 1, 1,
0.7360708, 0.5868801, 0.1176239, 0, 0, 0, 1, 1,
0.7401199, 0.6976025, 0.4962118, 0, 0, 0, 1, 1,
0.7545096, -0.12591, 1.846915, 0, 0, 0, 1, 1,
0.7591352, 1.632408, 0.3152882, 0, 0, 0, 1, 1,
0.7603294, 0.1422135, 3.333757, 0, 0, 0, 1, 1,
0.7615812, 1.07104, 2.09368, 0, 0, 0, 1, 1,
0.7623029, 1.515375, 1.046899, 1, 1, 1, 1, 1,
0.763447, -1.421417, 3.012547, 1, 1, 1, 1, 1,
0.7670028, -2.43826, 2.817549, 1, 1, 1, 1, 1,
0.7677498, 0.1503566, 2.523441, 1, 1, 1, 1, 1,
0.7790337, -0.7140214, 2.942808, 1, 1, 1, 1, 1,
0.7797862, -0.1176711, 1.904931, 1, 1, 1, 1, 1,
0.7820752, -0.5381312, 3.027433, 1, 1, 1, 1, 1,
0.787178, -1.147044, 2.424015, 1, 1, 1, 1, 1,
0.7890757, -1.581808, 4.727104, 1, 1, 1, 1, 1,
0.7929799, 0.6937343, 2.558556, 1, 1, 1, 1, 1,
0.7968426, -1.231157, 1.190334, 1, 1, 1, 1, 1,
0.7969848, 0.1757571, 1.841812, 1, 1, 1, 1, 1,
0.8002074, 0.6464167, 1.777695, 1, 1, 1, 1, 1,
0.8023914, 0.3375509, 0.7019616, 1, 1, 1, 1, 1,
0.8050086, -0.1486152, 1.264711, 1, 1, 1, 1, 1,
0.8054958, 0.4457846, -0.8314632, 0, 0, 1, 1, 1,
0.8156686, 1.057431, 1.748656, 1, 0, 0, 1, 1,
0.8213184, 0.4657227, 2.600002, 1, 0, 0, 1, 1,
0.8350544, -0.9098974, 1.075983, 1, 0, 0, 1, 1,
0.8361823, 1.051048, 1.296415, 1, 0, 0, 1, 1,
0.8383213, -0.2561271, 2.299277, 1, 0, 0, 1, 1,
0.839664, -0.02202367, 0.4897181, 0, 0, 0, 1, 1,
0.849467, -0.9911895, 2.371059, 0, 0, 0, 1, 1,
0.8509777, 1.32064, 2.027535, 0, 0, 0, 1, 1,
0.853846, 0.4907635, 1.457836, 0, 0, 0, 1, 1,
0.8566779, -0.249401, 2.224502, 0, 0, 0, 1, 1,
0.8569745, -1.246351, 2.789398, 0, 0, 0, 1, 1,
0.8611317, 0.4545598, 0.9398435, 0, 0, 0, 1, 1,
0.8731343, 0.9779581, 0.5965346, 1, 1, 1, 1, 1,
0.875026, -1.010946, 0.8806749, 1, 1, 1, 1, 1,
0.8752337, 1.039288, 1.170083, 1, 1, 1, 1, 1,
0.8834304, -0.872567, 2.314636, 1, 1, 1, 1, 1,
0.8849919, 1.316998, 1.245342, 1, 1, 1, 1, 1,
0.8894933, -1.71865, 2.30003, 1, 1, 1, 1, 1,
0.8900648, -0.001208696, 3.108467, 1, 1, 1, 1, 1,
0.8933587, -0.5069327, 1.934966, 1, 1, 1, 1, 1,
0.8933642, -0.2555865, 2.881315, 1, 1, 1, 1, 1,
0.8958011, 0.7697427, 2.538873, 1, 1, 1, 1, 1,
0.8962927, 0.05536284, -0.2903775, 1, 1, 1, 1, 1,
0.9020845, 0.05670064, 1.626148, 1, 1, 1, 1, 1,
0.9055424, 0.1677675, 3.352234, 1, 1, 1, 1, 1,
0.9063465, 0.2245075, 0.327435, 1, 1, 1, 1, 1,
0.9089436, -0.9118978, 2.973332, 1, 1, 1, 1, 1,
0.9135408, 0.1949574, 2.071756, 0, 0, 1, 1, 1,
0.9243332, -0.103902, 1.55027, 1, 0, 0, 1, 1,
0.9320794, -0.7507716, 2.468836, 1, 0, 0, 1, 1,
0.9386367, 0.06964038, 2.659889, 1, 0, 0, 1, 1,
0.9403273, -0.317041, 2.255226, 1, 0, 0, 1, 1,
0.9495426, 0.8160235, -1.222382, 1, 0, 0, 1, 1,
0.9526339, 2.007018, 0.3086773, 0, 0, 0, 1, 1,
0.9561689, -0.1789695, 1.117731, 0, 0, 0, 1, 1,
0.9648911, -1.113221, 1.636215, 0, 0, 0, 1, 1,
0.9679812, 1.475174, 0.8629651, 0, 0, 0, 1, 1,
0.9700513, -0.8718424, 2.101673, 0, 0, 0, 1, 1,
0.977876, 0.2892624, 1.914874, 0, 0, 0, 1, 1,
0.9825164, -1.775057, 1.601864, 0, 0, 0, 1, 1,
0.9853757, 0.5320877, 2.55591, 1, 1, 1, 1, 1,
0.9897996, -0.05522791, 0.7708616, 1, 1, 1, 1, 1,
1.002492, -0.6915613, 3.317554, 1, 1, 1, 1, 1,
1.006773, -0.1684047, 1.58787, 1, 1, 1, 1, 1,
1.007914, 0.7137049, -1.178728, 1, 1, 1, 1, 1,
1.008311, -1.148122, 3.665353, 1, 1, 1, 1, 1,
1.009946, 0.9862418, 1.887988, 1, 1, 1, 1, 1,
1.01648, -1.077155, 2.178254, 1, 1, 1, 1, 1,
1.017409, 0.8625515, 0.6422131, 1, 1, 1, 1, 1,
1.019845, 0.3500643, 0.7029586, 1, 1, 1, 1, 1,
1.021203, -1.121324, 3.160963, 1, 1, 1, 1, 1,
1.021884, -0.3940484, 2.394312, 1, 1, 1, 1, 1,
1.025397, -0.5336222, 2.476954, 1, 1, 1, 1, 1,
1.026309, 0.315989, 2.445651, 1, 1, 1, 1, 1,
1.02987, 0.8747278, 1.973667, 1, 1, 1, 1, 1,
1.030455, -0.4175245, 2.440699, 0, 0, 1, 1, 1,
1.03142, -1.931769, 2.464458, 1, 0, 0, 1, 1,
1.032583, 1.72235, -0.3876058, 1, 0, 0, 1, 1,
1.033528, -0.9804593, 2.183797, 1, 0, 0, 1, 1,
1.039844, 0.3303557, 1.862251, 1, 0, 0, 1, 1,
1.041123, 0.8538356, -0.5929117, 1, 0, 0, 1, 1,
1.045518, 0.3335131, 1.409243, 0, 0, 0, 1, 1,
1.046286, -0.1321342, -0.3255286, 0, 0, 0, 1, 1,
1.047449, -2.053851, 1.101958, 0, 0, 0, 1, 1,
1.050177, 0.9862238, 0.8280632, 0, 0, 0, 1, 1,
1.051062, 0.5262547, 0.5844151, 0, 0, 0, 1, 1,
1.055471, -1.235025, 3.576392, 0, 0, 0, 1, 1,
1.060357, -1.184645, 2.935052, 0, 0, 0, 1, 1,
1.063863, -0.1132087, 2.634224, 1, 1, 1, 1, 1,
1.068575, 1.252318, 0.581095, 1, 1, 1, 1, 1,
1.069637, -0.03074953, 1.123413, 1, 1, 1, 1, 1,
1.071981, -0.4467948, 3.754371, 1, 1, 1, 1, 1,
1.076303, 0.244458, 3.346967, 1, 1, 1, 1, 1,
1.078394, 0.488023, 1.248716, 1, 1, 1, 1, 1,
1.082008, -0.286829, 1.042625, 1, 1, 1, 1, 1,
1.085659, 0.1562821, 3.083014, 1, 1, 1, 1, 1,
1.092957, -1.256913, 3.573821, 1, 1, 1, 1, 1,
1.096581, 0.193941, 1.924513, 1, 1, 1, 1, 1,
1.09673, 0.5632077, 0.9048221, 1, 1, 1, 1, 1,
1.101682, 1.969532, 0.937026, 1, 1, 1, 1, 1,
1.105309, 1.490532, 1.394855, 1, 1, 1, 1, 1,
1.105533, -0.4827811, 2.584316, 1, 1, 1, 1, 1,
1.113404, -0.6347907, 0.5017843, 1, 1, 1, 1, 1,
1.124919, -1.165816, 3.966898, 0, 0, 1, 1, 1,
1.125399, -0.2475728, 2.658169, 1, 0, 0, 1, 1,
1.12988, 0.02045055, 1.257014, 1, 0, 0, 1, 1,
1.130123, -0.5236618, 3.001399, 1, 0, 0, 1, 1,
1.134851, -0.2063085, 0.2121863, 1, 0, 0, 1, 1,
1.139075, -0.6958159, 0.07074091, 1, 0, 0, 1, 1,
1.144826, 0.08372431, 0.5201376, 0, 0, 0, 1, 1,
1.149948, -0.3692045, 0.5955754, 0, 0, 0, 1, 1,
1.155502, -2.944674, 2.467764, 0, 0, 0, 1, 1,
1.156834, 1.241198, 1.356962, 0, 0, 0, 1, 1,
1.16316, -1.420145, 3.656959, 0, 0, 0, 1, 1,
1.169853, -0.7778838, 1.587242, 0, 0, 0, 1, 1,
1.170345, 1.462415, 1.433105, 0, 0, 0, 1, 1,
1.177808, 0.7361106, -0.07328184, 1, 1, 1, 1, 1,
1.182634, -0.3846409, 1.448054, 1, 1, 1, 1, 1,
1.18512, 1.044425, -0.2693066, 1, 1, 1, 1, 1,
1.186232, 0.5550407, 2.610538, 1, 1, 1, 1, 1,
1.191816, -0.8872231, 2.297743, 1, 1, 1, 1, 1,
1.205396, -0.7617212, 1.309878, 1, 1, 1, 1, 1,
1.20812, -0.01819224, 2.281642, 1, 1, 1, 1, 1,
1.208795, -0.1030664, 2.654509, 1, 1, 1, 1, 1,
1.210167, 0.9380121, 0.6951408, 1, 1, 1, 1, 1,
1.222299, 0.6390804, -0.1750256, 1, 1, 1, 1, 1,
1.227051, 0.07057803, -0.8209503, 1, 1, 1, 1, 1,
1.23009, 0.4005163, 1.059125, 1, 1, 1, 1, 1,
1.235266, 0.2539985, 2.03029, 1, 1, 1, 1, 1,
1.240344, 0.756628, 0.8890343, 1, 1, 1, 1, 1,
1.250785, 0.588914, 0.3098256, 1, 1, 1, 1, 1,
1.2571, 2.296105, 0.905893, 0, 0, 1, 1, 1,
1.277839, -0.3071311, 1.148165, 1, 0, 0, 1, 1,
1.281909, -1.319603, 3.613312, 1, 0, 0, 1, 1,
1.291454, 0.5936646, 0.9428627, 1, 0, 0, 1, 1,
1.295543, 0.1031475, 1.405182, 1, 0, 0, 1, 1,
1.30474, -0.8355795, 3.502994, 1, 0, 0, 1, 1,
1.305083, 1.599804, 0.3198161, 0, 0, 0, 1, 1,
1.325058, -0.4534289, 2.072627, 0, 0, 0, 1, 1,
1.327659, 1.415023, 0.1211682, 0, 0, 0, 1, 1,
1.338181, 0.9792784, 2.085085, 0, 0, 0, 1, 1,
1.339863, -0.01588331, 2.219137, 0, 0, 0, 1, 1,
1.343873, 0.1101179, 0.5661176, 0, 0, 0, 1, 1,
1.348814, 0.1972591, 0.8991586, 0, 0, 0, 1, 1,
1.353871, -0.4022361, 0.8714667, 1, 1, 1, 1, 1,
1.373284, -0.7020088, 1.454452, 1, 1, 1, 1, 1,
1.37356, 1.04479, 2.17704, 1, 1, 1, 1, 1,
1.377079, -0.8859786, 3.252387, 1, 1, 1, 1, 1,
1.397404, -1.024346, 0.2476631, 1, 1, 1, 1, 1,
1.406169, 0.1269432, 1.222481, 1, 1, 1, 1, 1,
1.409762, -0.5062733, 1.30004, 1, 1, 1, 1, 1,
1.423738, -2.487968, 3.909597, 1, 1, 1, 1, 1,
1.430512, 1.136172, 1.407031, 1, 1, 1, 1, 1,
1.44208, 0.7867131, 1.011859, 1, 1, 1, 1, 1,
1.44853, -1.069629, 2.019399, 1, 1, 1, 1, 1,
1.459295, -1.977292, 2.308798, 1, 1, 1, 1, 1,
1.462237, 0.3020998, 1.080669, 1, 1, 1, 1, 1,
1.463896, 0.5032619, 2.830936, 1, 1, 1, 1, 1,
1.481036, -0.2684647, 1.370596, 1, 1, 1, 1, 1,
1.485544, -0.5762786, 1.403529, 0, 0, 1, 1, 1,
1.498638, -0.3043375, -0.4664746, 1, 0, 0, 1, 1,
1.508668, 0.1521578, 1.756109, 1, 0, 0, 1, 1,
1.510982, -0.9199448, 1.939172, 1, 0, 0, 1, 1,
1.512898, 1.145655, -0.04459707, 1, 0, 0, 1, 1,
1.516437, -0.8170566, 2.531063, 1, 0, 0, 1, 1,
1.520013, 0.8463497, 1.726373, 0, 0, 0, 1, 1,
1.520254, 0.1492095, 2.671779, 0, 0, 0, 1, 1,
1.532639, -1.673496, 1.885826, 0, 0, 0, 1, 1,
1.542418, 0.2699809, -0.189674, 0, 0, 0, 1, 1,
1.543504, 1.732291, 0.6961348, 0, 0, 0, 1, 1,
1.545381, -1.395262, 2.759375, 0, 0, 0, 1, 1,
1.551169, 0.6781696, -0.3134423, 0, 0, 0, 1, 1,
1.551173, 0.6486909, 0.8927307, 1, 1, 1, 1, 1,
1.564331, 0.8827027, 2.844099, 1, 1, 1, 1, 1,
1.580927, -0.651259, 1.959027, 1, 1, 1, 1, 1,
1.609688, 0.3561122, 0.967597, 1, 1, 1, 1, 1,
1.612074, 0.2223493, 0.03662339, 1, 1, 1, 1, 1,
1.612123, 0.8165808, 1.23331, 1, 1, 1, 1, 1,
1.624079, -0.8706799, 3.640491, 1, 1, 1, 1, 1,
1.64017, -1.425022, 2.417124, 1, 1, 1, 1, 1,
1.643324, 0.1421767, 0.3118893, 1, 1, 1, 1, 1,
1.675472, -0.1559407, 3.16887, 1, 1, 1, 1, 1,
1.698313, 0.4840142, 2.142658, 1, 1, 1, 1, 1,
1.712522, -0.5038297, 2.664738, 1, 1, 1, 1, 1,
1.716869, 1.536171, 1.857348, 1, 1, 1, 1, 1,
1.71841, -1.472479, 2.908663, 1, 1, 1, 1, 1,
1.726471, -0.7879023, 2.147791, 1, 1, 1, 1, 1,
1.733297, 0.55146, 1.892394, 0, 0, 1, 1, 1,
1.73562, -0.7560998, 2.476752, 1, 0, 0, 1, 1,
1.746308, 0.5251349, 3.05474, 1, 0, 0, 1, 1,
1.748538, 0.7671772, 0.8992066, 1, 0, 0, 1, 1,
1.750615, 0.4429766, 0.7806976, 1, 0, 0, 1, 1,
1.753876, -2.163518, 0.5139492, 1, 0, 0, 1, 1,
1.766914, -1.612907, 3.194309, 0, 0, 0, 1, 1,
1.784345, -0.4831637, 2.960395, 0, 0, 0, 1, 1,
1.798938, -0.7351406, 1.721374, 0, 0, 0, 1, 1,
1.810377, 0.2581812, 3.496027, 0, 0, 0, 1, 1,
1.831024, -1.684288, 1.281915, 0, 0, 0, 1, 1,
1.839972, -1.439254, 3.726466, 0, 0, 0, 1, 1,
1.841621, 0.784175, 0.09770853, 0, 0, 0, 1, 1,
1.850523, -0.6828805, 1.180152, 1, 1, 1, 1, 1,
1.863505, -1.19088, 1.103925, 1, 1, 1, 1, 1,
1.903066, -0.827522, 2.101394, 1, 1, 1, 1, 1,
1.920582, -0.7605717, 2.208359, 1, 1, 1, 1, 1,
1.931249, 0.5201693, 1.999664, 1, 1, 1, 1, 1,
1.947912, 0.3140958, 0.6926271, 1, 1, 1, 1, 1,
1.957364, -0.01096096, 0.730865, 1, 1, 1, 1, 1,
1.961391, 0.4554147, 4.060694, 1, 1, 1, 1, 1,
1.969373, -1.630927, 2.272386, 1, 1, 1, 1, 1,
1.973179, 0.140789, 2.819362, 1, 1, 1, 1, 1,
1.973529, -0.3342436, 2.472345, 1, 1, 1, 1, 1,
1.982904, -2.152386, 5.078509, 1, 1, 1, 1, 1,
1.99093, -0.8465202, 2.383461, 1, 1, 1, 1, 1,
1.995533, 0.9197432, 2.105474, 1, 1, 1, 1, 1,
2.064454, -1.093465, 1.758976, 1, 1, 1, 1, 1,
2.10015, -0.701883, 1.090062, 0, 0, 1, 1, 1,
2.107617, 0.3276528, 2.295094, 1, 0, 0, 1, 1,
2.122464, 1.741149, 0.7189205, 1, 0, 0, 1, 1,
2.168382, -0.5672172, 2.304872, 1, 0, 0, 1, 1,
2.179701, 0.5557828, 1.596113, 1, 0, 0, 1, 1,
2.220815, 1.1465, -0.003895115, 1, 0, 0, 1, 1,
2.322042, 1.054779, 0.6354812, 0, 0, 0, 1, 1,
2.344125, 0.1009367, 3.37541, 0, 0, 0, 1, 1,
2.383237, 0.7555747, 1.971969, 0, 0, 0, 1, 1,
2.40976, -0.3230627, 1.528702, 0, 0, 0, 1, 1,
2.412312, 0.4710878, 0.5005866, 0, 0, 0, 1, 1,
2.451784, -0.3558377, 1.144099, 0, 0, 0, 1, 1,
2.457024, -0.5401213, 1.947084, 0, 0, 0, 1, 1,
2.587778, -0.2725979, -0.1544544, 1, 1, 1, 1, 1,
2.680231, 1.907698, 2.132984, 1, 1, 1, 1, 1,
2.68675, -1.643793, 3.133568, 1, 1, 1, 1, 1,
2.721704, -1.902493, 3.606882, 1, 1, 1, 1, 1,
2.830899, 0.2349915, 1.473498, 1, 1, 1, 1, 1,
2.955912, 1.161163, 1.496835, 1, 1, 1, 1, 1,
3.143311, 0.1525283, 3.226645, 1, 1, 1, 1, 1
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
var radius = 9.428663;
var distance = 33.11777;
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
mvMatrix.translate( 0.2855601, -0.1803622, -0.2425389 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.11777);
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
