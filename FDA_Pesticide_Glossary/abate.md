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
-2.823802, 0.6488955, -1.611113, 1, 0, 0, 1,
-2.77304, -0.0925949, -1.731193, 1, 0.007843138, 0, 1,
-2.576482, -2.088583, -3.070052, 1, 0.01176471, 0, 1,
-2.522135, -1.357398, -3.016492, 1, 0.01960784, 0, 1,
-2.409739, -1.792716, -3.839102, 1, 0.02352941, 0, 1,
-2.371685, -0.6046277, -3.75548, 1, 0.03137255, 0, 1,
-2.352213, 0.942879, -1.503764, 1, 0.03529412, 0, 1,
-2.349072, -0.8724328, -2.062134, 1, 0.04313726, 0, 1,
-2.230958, 2.034636, -0.05978889, 1, 0.04705882, 0, 1,
-2.22897, 1.915332, -0.3306397, 1, 0.05490196, 0, 1,
-2.158426, -0.8722219, -1.772014, 1, 0.05882353, 0, 1,
-2.150097, -1.054492, -2.454757, 1, 0.06666667, 0, 1,
-2.072138, 0.4121364, -1.609845, 1, 0.07058824, 0, 1,
-2.056068, 0.5410589, -3.749039, 1, 0.07843138, 0, 1,
-2.041759, 0.1018432, -2.22298, 1, 0.08235294, 0, 1,
-2.03578, 2.391904, -1.009297, 1, 0.09019608, 0, 1,
-1.890444, -0.6599922, -1.852173, 1, 0.09411765, 0, 1,
-1.884858, -0.9406939, -2.61768, 1, 0.1019608, 0, 1,
-1.84553, 0.2261406, -1.839773, 1, 0.1098039, 0, 1,
-1.839172, 0.8628086, -2.470911, 1, 0.1137255, 0, 1,
-1.834086, 0.4258461, -2.505578, 1, 0.1215686, 0, 1,
-1.797004, -0.02672726, -3.186725, 1, 0.1254902, 0, 1,
-1.781575, 1.718549, -0.9567274, 1, 0.1333333, 0, 1,
-1.770636, -0.7170473, -0.5424207, 1, 0.1372549, 0, 1,
-1.768501, -0.1914523, -1.041521, 1, 0.145098, 0, 1,
-1.763017, 0.1145408, -0.8271324, 1, 0.1490196, 0, 1,
-1.752715, -0.3708961, -1.592505, 1, 0.1568628, 0, 1,
-1.723431, -0.4545647, -0.4832007, 1, 0.1607843, 0, 1,
-1.708022, -0.0610649, -1.95551, 1, 0.1686275, 0, 1,
-1.706153, -1.38644, -3.461573, 1, 0.172549, 0, 1,
-1.701804, 0.8628641, -0.8872803, 1, 0.1803922, 0, 1,
-1.696292, 0.3959748, -0.7700121, 1, 0.1843137, 0, 1,
-1.692569, 0.3945107, -1.387491, 1, 0.1921569, 0, 1,
-1.683064, 0.3572047, -1.695366, 1, 0.1960784, 0, 1,
-1.677769, 0.1906695, -2.441063, 1, 0.2039216, 0, 1,
-1.672536, -0.01735786, -0.8307743, 1, 0.2117647, 0, 1,
-1.671122, 0.03154425, -1.65843, 1, 0.2156863, 0, 1,
-1.658732, 0.03217985, -2.081665, 1, 0.2235294, 0, 1,
-1.645831, 0.2132843, -1.584666, 1, 0.227451, 0, 1,
-1.639708, 1.111664, 0.115551, 1, 0.2352941, 0, 1,
-1.63421, 0.7736101, -1.458834, 1, 0.2392157, 0, 1,
-1.631326, 0.1986544, -0.9891526, 1, 0.2470588, 0, 1,
-1.630837, 1.139403, 0.9520468, 1, 0.2509804, 0, 1,
-1.630523, 1.308599, 0.05565669, 1, 0.2588235, 0, 1,
-1.614962, -0.8804684, -2.610508, 1, 0.2627451, 0, 1,
-1.607279, -0.322158, -2.192997, 1, 0.2705882, 0, 1,
-1.591662, -0.06870021, -2.601276, 1, 0.2745098, 0, 1,
-1.591139, 0.4622068, -0.8144079, 1, 0.282353, 0, 1,
-1.589898, -0.6106195, -1.610856, 1, 0.2862745, 0, 1,
-1.577825, 2.305033, -0.3341743, 1, 0.2941177, 0, 1,
-1.576604, 1.378716, -2.227535, 1, 0.3019608, 0, 1,
-1.567734, -0.2074471, -3.072519, 1, 0.3058824, 0, 1,
-1.557206, 1.215426, -1.249967, 1, 0.3137255, 0, 1,
-1.554941, -1.688507, -2.533331, 1, 0.3176471, 0, 1,
-1.554448, 1.471164, -0.2278865, 1, 0.3254902, 0, 1,
-1.553416, -1.208929, -0.821182, 1, 0.3294118, 0, 1,
-1.547512, -0.3653638, -0.9115855, 1, 0.3372549, 0, 1,
-1.51677, 0.1533981, -1.831746, 1, 0.3411765, 0, 1,
-1.50475, 0.8336938, -1.167618, 1, 0.3490196, 0, 1,
-1.496883, 1.283325, -1.718395, 1, 0.3529412, 0, 1,
-1.489957, 0.5230339, -1.970263, 1, 0.3607843, 0, 1,
-1.482912, -0.147341, -2.339808, 1, 0.3647059, 0, 1,
-1.468691, 0.2916279, -2.507907, 1, 0.372549, 0, 1,
-1.465612, -0.3933669, -0.6541982, 1, 0.3764706, 0, 1,
-1.460401, -0.5078633, -0.6078652, 1, 0.3843137, 0, 1,
-1.431464, -0.03009615, -0.3075645, 1, 0.3882353, 0, 1,
-1.430093, -0.6749888, -3.179331, 1, 0.3960784, 0, 1,
-1.4271, -0.5219212, -0.4723515, 1, 0.4039216, 0, 1,
-1.425918, -0.1198362, -2.493932, 1, 0.4078431, 0, 1,
-1.411672, -1.559547, -1.390611, 1, 0.4156863, 0, 1,
-1.406464, -0.2837607, -1.862549, 1, 0.4196078, 0, 1,
-1.386541, 1.661139, -0.2008708, 1, 0.427451, 0, 1,
-1.385297, 1.24556, -0.4534742, 1, 0.4313726, 0, 1,
-1.381668, 1.166441, -0.9244625, 1, 0.4392157, 0, 1,
-1.379261, 0.7459782, -1.271484, 1, 0.4431373, 0, 1,
-1.373599, 1.484836, -1.051247, 1, 0.4509804, 0, 1,
-1.369881, -0.5042877, -0.541854, 1, 0.454902, 0, 1,
-1.357427, 0.1558783, -1.369965, 1, 0.4627451, 0, 1,
-1.355401, -1.197977, -0.7733987, 1, 0.4666667, 0, 1,
-1.351171, -0.0196513, -1.7932, 1, 0.4745098, 0, 1,
-1.343281, 1.167275, -1.005887, 1, 0.4784314, 0, 1,
-1.332351, 0.7728208, -1.583092, 1, 0.4862745, 0, 1,
-1.322607, 0.8218048, -2.307851, 1, 0.4901961, 0, 1,
-1.317312, -0.4083791, -0.4246138, 1, 0.4980392, 0, 1,
-1.315239, -0.2499742, -1.360744, 1, 0.5058824, 0, 1,
-1.308246, 1.390438, 1.01373, 1, 0.509804, 0, 1,
-1.30631, -0.7555147, -0.6786228, 1, 0.5176471, 0, 1,
-1.304467, 0.1351803, 0.1120893, 1, 0.5215687, 0, 1,
-1.304425, -0.4049262, -2.124372, 1, 0.5294118, 0, 1,
-1.303378, -0.8917038, -1.811193, 1, 0.5333334, 0, 1,
-1.287911, 0.787653, -1.517093, 1, 0.5411765, 0, 1,
-1.284071, 1.272421, -1.028403, 1, 0.5450981, 0, 1,
-1.279659, 0.5349267, -1.159477, 1, 0.5529412, 0, 1,
-1.268884, 1.146215, -1.789586, 1, 0.5568628, 0, 1,
-1.264099, -0.6287884, -3.24256, 1, 0.5647059, 0, 1,
-1.257923, -0.6086261, -2.262874, 1, 0.5686275, 0, 1,
-1.253496, -0.9611452, -2.508263, 1, 0.5764706, 0, 1,
-1.252515, -0.9593229, -1.311664, 1, 0.5803922, 0, 1,
-1.252323, -1.587588, -1.829224, 1, 0.5882353, 0, 1,
-1.248641, 0.3586412, -1.53166, 1, 0.5921569, 0, 1,
-1.247946, 0.4099554, 1.089705, 1, 0.6, 0, 1,
-1.247139, 0.3846877, -1.755225, 1, 0.6078432, 0, 1,
-1.243694, 0.9961511, -1.134801, 1, 0.6117647, 0, 1,
-1.23623, -0.3679777, -2.504331, 1, 0.6196079, 0, 1,
-1.233511, -0.5938719, -1.723611, 1, 0.6235294, 0, 1,
-1.230832, -0.5501919, 0.7177825, 1, 0.6313726, 0, 1,
-1.224687, 1.729518, -0.1867317, 1, 0.6352941, 0, 1,
-1.22272, -0.3369557, -0.6571099, 1, 0.6431373, 0, 1,
-1.218784, 1.219234, -2.183373, 1, 0.6470588, 0, 1,
-1.218478, -0.6012381, 0.3671527, 1, 0.654902, 0, 1,
-1.216524, -1.709744, -2.490292, 1, 0.6588235, 0, 1,
-1.21459, -2.448826, -2.537305, 1, 0.6666667, 0, 1,
-1.20486, -0.4819537, -2.68113, 1, 0.6705883, 0, 1,
-1.200845, -1.579304, -3.741155, 1, 0.6784314, 0, 1,
-1.199903, -0.1742433, -2.919121, 1, 0.682353, 0, 1,
-1.196106, -0.1907796, -2.99342, 1, 0.6901961, 0, 1,
-1.170604, 2.306877, -0.343098, 1, 0.6941177, 0, 1,
-1.162664, -0.4892614, -1.689008, 1, 0.7019608, 0, 1,
-1.161193, -0.5078545, -2.215075, 1, 0.7098039, 0, 1,
-1.156219, 0.07514744, -0.7428914, 1, 0.7137255, 0, 1,
-1.149131, -0.5388163, -2.566562, 1, 0.7215686, 0, 1,
-1.143928, 0.6696534, -0.793676, 1, 0.7254902, 0, 1,
-1.140236, -0.4402117, -1.092541, 1, 0.7333333, 0, 1,
-1.136429, -0.1353208, -1.777608, 1, 0.7372549, 0, 1,
-1.134057, 0.5011016, -1.006961, 1, 0.7450981, 0, 1,
-1.11506, 0.2369568, -1.599756, 1, 0.7490196, 0, 1,
-1.111172, -0.5419174, -1.801684, 1, 0.7568628, 0, 1,
-1.110743, -0.493136, -0.804731, 1, 0.7607843, 0, 1,
-1.107731, 1.175655, -2.0746, 1, 0.7686275, 0, 1,
-1.095955, -0.03986076, -2.984553, 1, 0.772549, 0, 1,
-1.09432, -0.9780131, -2.130016, 1, 0.7803922, 0, 1,
-1.094031, -2.522996, -2.932512, 1, 0.7843137, 0, 1,
-1.089643, -0.2545358, -1.91229, 1, 0.7921569, 0, 1,
-1.077476, -1.297002, -3.493266, 1, 0.7960784, 0, 1,
-1.074706, 0.6353152, 0.5894578, 1, 0.8039216, 0, 1,
-1.068861, -2.268615, -2.558685, 1, 0.8117647, 0, 1,
-1.06838, 1.901522, -0.7443354, 1, 0.8156863, 0, 1,
-1.061615, 1.804776, 1.065077, 1, 0.8235294, 0, 1,
-1.05792, 0.7893607, -2.032421, 1, 0.827451, 0, 1,
-1.05166, 1.164751, -1.09131, 1, 0.8352941, 0, 1,
-1.050374, 0.2363306, -1.420642, 1, 0.8392157, 0, 1,
-1.048395, 0.5424281, -2.410369, 1, 0.8470588, 0, 1,
-1.047942, 0.1561143, 0.9238064, 1, 0.8509804, 0, 1,
-1.045743, 1.045446, -0.1317762, 1, 0.8588235, 0, 1,
-1.044909, -0.03648032, -1.907138, 1, 0.8627451, 0, 1,
-1.042723, -1.654611, -3.723631, 1, 0.8705882, 0, 1,
-1.042676, 0.7629898, 0.2511633, 1, 0.8745098, 0, 1,
-1.039728, -1.260711, -1.276088, 1, 0.8823529, 0, 1,
-1.038735, 0.3940248, -1.447211, 1, 0.8862745, 0, 1,
-1.037988, 0.9885052, -0.4847779, 1, 0.8941177, 0, 1,
-1.031933, 0.2443832, -0.9401233, 1, 0.8980392, 0, 1,
-1.030851, 0.5865341, -0.03067469, 1, 0.9058824, 0, 1,
-1.026684, 0.7973832, -1.246706, 1, 0.9137255, 0, 1,
-1.022939, -1.312133, -1.609045, 1, 0.9176471, 0, 1,
-1.020576, -0.1603853, -2.060076, 1, 0.9254902, 0, 1,
-1.01718, 0.03309509, -2.3672, 1, 0.9294118, 0, 1,
-1.015209, -0.1641738, -2.488751, 1, 0.9372549, 0, 1,
-1.012089, 0.284404, -0.3481572, 1, 0.9411765, 0, 1,
-1.011613, -1.700515, -2.925305, 1, 0.9490196, 0, 1,
-1.009771, -2.326995, -1.778078, 1, 0.9529412, 0, 1,
-1.008439, -0.6857759, -2.153417, 1, 0.9607843, 0, 1,
-1.007872, 2.103966, 1.024511, 1, 0.9647059, 0, 1,
-1.007264, -0.369936, -1.758898, 1, 0.972549, 0, 1,
-0.991795, 0.4398097, -0.793657, 1, 0.9764706, 0, 1,
-0.9900555, -1.339437, -3.401818, 1, 0.9843137, 0, 1,
-0.9888903, -1.029218, -1.319309, 1, 0.9882353, 0, 1,
-0.9828894, 0.7208223, -0.353361, 1, 0.9960784, 0, 1,
-0.9820766, 0.1352519, -0.7043799, 0.9960784, 1, 0, 1,
-0.9819961, 0.3573644, -1.989248, 0.9921569, 1, 0, 1,
-0.9811864, 1.334296, -0.8285542, 0.9843137, 1, 0, 1,
-0.9791773, 0.2736924, -0.7110276, 0.9803922, 1, 0, 1,
-0.9579248, -1.753506, -2.932462, 0.972549, 1, 0, 1,
-0.9510887, -0.7947679, -1.577597, 0.9686275, 1, 0, 1,
-0.9503254, -0.8686805, -1.11053, 0.9607843, 1, 0, 1,
-0.9462284, 1.836659, 0.2692336, 0.9568627, 1, 0, 1,
-0.9450694, -0.5157675, -2.177807, 0.9490196, 1, 0, 1,
-0.9424239, 0.3067235, -3.780465, 0.945098, 1, 0, 1,
-0.9373381, -0.02090592, -0.02556917, 0.9372549, 1, 0, 1,
-0.9332196, 1.25419, -0.4322699, 0.9333333, 1, 0, 1,
-0.9327865, 1.1962, -1.40936, 0.9254902, 1, 0, 1,
-0.9305752, -0.152173, -2.513762, 0.9215686, 1, 0, 1,
-0.9279461, 0.7930048, -1.496236, 0.9137255, 1, 0, 1,
-0.9275014, -1.467616, -2.533001, 0.9098039, 1, 0, 1,
-0.9217397, 0.6854289, -1.143734, 0.9019608, 1, 0, 1,
-0.915637, 1.836797, -0.8925635, 0.8941177, 1, 0, 1,
-0.9124013, 0.255697, -2.856358, 0.8901961, 1, 0, 1,
-0.9102654, -0.9223979, -2.445587, 0.8823529, 1, 0, 1,
-0.9068076, 1.10129, -0.8111183, 0.8784314, 1, 0, 1,
-0.9049738, -0.7880222, -2.503437, 0.8705882, 1, 0, 1,
-0.903426, 0.06645539, -0.5057536, 0.8666667, 1, 0, 1,
-0.9018494, 2.346768, -0.4616641, 0.8588235, 1, 0, 1,
-0.9003429, 0.6922781, -1.774812, 0.854902, 1, 0, 1,
-0.8987786, -0.8800947, -3.326504, 0.8470588, 1, 0, 1,
-0.8953387, -0.3542645, -2.340077, 0.8431373, 1, 0, 1,
-0.8892847, -0.1991672, -3.25058, 0.8352941, 1, 0, 1,
-0.8891333, 0.5912185, -0.8842866, 0.8313726, 1, 0, 1,
-0.8864949, -1.532646, -2.723025, 0.8235294, 1, 0, 1,
-0.8780892, 0.6132984, -0.3235635, 0.8196079, 1, 0, 1,
-0.8747547, -1.765134, -4.114635, 0.8117647, 1, 0, 1,
-0.8731844, -0.3330845, -1.669988, 0.8078431, 1, 0, 1,
-0.8719965, -2.05227, -4.383686, 0.8, 1, 0, 1,
-0.8710471, -0.829054, -3.471148, 0.7921569, 1, 0, 1,
-0.8643036, -0.1947651, -2.621255, 0.7882353, 1, 0, 1,
-0.8611485, 1.858843, -0.09379306, 0.7803922, 1, 0, 1,
-0.8602264, -0.2813236, -1.856016, 0.7764706, 1, 0, 1,
-0.8581905, 0.02468804, -2.087288, 0.7686275, 1, 0, 1,
-0.8562788, -0.7561452, -2.80734, 0.7647059, 1, 0, 1,
-0.8555236, -1.732767, -1.764588, 0.7568628, 1, 0, 1,
-0.8529563, 1.250353, -1.039046, 0.7529412, 1, 0, 1,
-0.8481281, 1.538847, -1.132768, 0.7450981, 1, 0, 1,
-0.8478234, 0.0636343, -1.084908, 0.7411765, 1, 0, 1,
-0.847427, 0.4095773, 0.716342, 0.7333333, 1, 0, 1,
-0.8467928, -0.1018967, -0.8651863, 0.7294118, 1, 0, 1,
-0.8385841, 0.1224623, -2.674721, 0.7215686, 1, 0, 1,
-0.8370176, 0.705879, -0.1936379, 0.7176471, 1, 0, 1,
-0.8365104, -0.4685431, -2.416627, 0.7098039, 1, 0, 1,
-0.8303822, 0.2036646, 0.1333506, 0.7058824, 1, 0, 1,
-0.8277041, 1.992674, 0.8520082, 0.6980392, 1, 0, 1,
-0.8272269, 1.39062, -0.5011157, 0.6901961, 1, 0, 1,
-0.824539, -1.790252, -0.8769899, 0.6862745, 1, 0, 1,
-0.8144042, -0.005160577, -1.427642, 0.6784314, 1, 0, 1,
-0.8098981, -0.06967471, -2.040584, 0.6745098, 1, 0, 1,
-0.8085256, -0.3886591, -1.907367, 0.6666667, 1, 0, 1,
-0.7997105, -0.791038, -2.256953, 0.6627451, 1, 0, 1,
-0.7993227, -1.596658, -4.11655, 0.654902, 1, 0, 1,
-0.7938868, 0.6516692, -0.9252928, 0.6509804, 1, 0, 1,
-0.7905112, 0.3237637, -1.071709, 0.6431373, 1, 0, 1,
-0.7875807, 0.354986, -0.5660186, 0.6392157, 1, 0, 1,
-0.7844879, -2.02123, -3.182838, 0.6313726, 1, 0, 1,
-0.7838982, -2.071566, -2.784925, 0.627451, 1, 0, 1,
-0.7820852, 0.1184045, -2.099951, 0.6196079, 1, 0, 1,
-0.7792396, 1.738003, -0.1029561, 0.6156863, 1, 0, 1,
-0.7780379, 0.4134842, -1.072715, 0.6078432, 1, 0, 1,
-0.7760661, 2.176075, -0.9138739, 0.6039216, 1, 0, 1,
-0.7662305, -1.459581, -3.158708, 0.5960785, 1, 0, 1,
-0.766206, -0.1587957, -2.074112, 0.5882353, 1, 0, 1,
-0.7646927, 1.051801, -1.488386, 0.5843138, 1, 0, 1,
-0.7603865, 1.190218, -1.536019, 0.5764706, 1, 0, 1,
-0.756881, 0.624565, 0.2221555, 0.572549, 1, 0, 1,
-0.7534749, 0.9139848, -0.6346229, 0.5647059, 1, 0, 1,
-0.7512196, -0.4322026, -4.514346, 0.5607843, 1, 0, 1,
-0.7460859, 0.05024201, -1.715163, 0.5529412, 1, 0, 1,
-0.7455502, 1.817171, -1.834744, 0.5490196, 1, 0, 1,
-0.7298014, -1.158995, -2.048963, 0.5411765, 1, 0, 1,
-0.7289243, 0.3833763, -1.115539, 0.5372549, 1, 0, 1,
-0.7265381, -0.1414941, -0.7090969, 0.5294118, 1, 0, 1,
-0.7262221, 1.199581, -0.2839378, 0.5254902, 1, 0, 1,
-0.7245113, 0.7323676, 0.6231928, 0.5176471, 1, 0, 1,
-0.7180222, 0.6474416, -0.05939471, 0.5137255, 1, 0, 1,
-0.7122835, 2.028464, 0.2759725, 0.5058824, 1, 0, 1,
-0.7122525, 1.65122, -1.119982, 0.5019608, 1, 0, 1,
-0.7094664, -0.03112401, -0.706341, 0.4941176, 1, 0, 1,
-0.7082466, 0.09113891, -1.789197, 0.4862745, 1, 0, 1,
-0.7042096, -1.808451, -1.771155, 0.4823529, 1, 0, 1,
-0.7031771, -0.7030344, -3.875853, 0.4745098, 1, 0, 1,
-0.7031428, 0.001841046, -3.658745, 0.4705882, 1, 0, 1,
-0.701892, 0.2566159, -1.726922, 0.4627451, 1, 0, 1,
-0.7017869, 0.8886843, 2.21602, 0.4588235, 1, 0, 1,
-0.6999472, 2.029621, -0.7919903, 0.4509804, 1, 0, 1,
-0.6972634, 0.1409926, -0.6430126, 0.4470588, 1, 0, 1,
-0.6949773, -1.849903, -4.469399, 0.4392157, 1, 0, 1,
-0.6943316, 0.3242502, -2.940445, 0.4352941, 1, 0, 1,
-0.6927708, 0.3916773, 1.536278, 0.427451, 1, 0, 1,
-0.6917613, 1.088042, -0.6807066, 0.4235294, 1, 0, 1,
-0.6903462, 0.2321282, -1.15556, 0.4156863, 1, 0, 1,
-0.68894, 0.6971508, 0.1256459, 0.4117647, 1, 0, 1,
-0.6865436, 0.2166047, 0.26322, 0.4039216, 1, 0, 1,
-0.6863632, 0.2173419, -1.303189, 0.3960784, 1, 0, 1,
-0.6858137, -0.07886653, -0.6115978, 0.3921569, 1, 0, 1,
-0.6842473, -0.245601, -1.75802, 0.3843137, 1, 0, 1,
-0.6802897, 0.8397328, -0.7296298, 0.3803922, 1, 0, 1,
-0.6791604, -0.8999199, -1.926934, 0.372549, 1, 0, 1,
-0.675976, -0.104518, -0.2831755, 0.3686275, 1, 0, 1,
-0.6723197, -0.933862, -0.990934, 0.3607843, 1, 0, 1,
-0.6620617, 0.8406567, 0.1247045, 0.3568628, 1, 0, 1,
-0.6556413, -1.324109, -3.841847, 0.3490196, 1, 0, 1,
-0.6538572, 0.586774, -1.003386, 0.345098, 1, 0, 1,
-0.6524945, -0.1322573, -0.7599682, 0.3372549, 1, 0, 1,
-0.6523164, -0.4078632, -2.046654, 0.3333333, 1, 0, 1,
-0.6474465, 0.1835589, 0.2660933, 0.3254902, 1, 0, 1,
-0.6419826, -0.2830879, -3.749389, 0.3215686, 1, 0, 1,
-0.630174, -0.2686753, -1.227315, 0.3137255, 1, 0, 1,
-0.6289941, 1.067725, 0.9037999, 0.3098039, 1, 0, 1,
-0.6202821, -1.151074, -4.249462, 0.3019608, 1, 0, 1,
-0.6139892, -0.04214226, 0.09720594, 0.2941177, 1, 0, 1,
-0.6087611, 0.8086315, -0.5957486, 0.2901961, 1, 0, 1,
-0.6037595, -0.725062, -2.598382, 0.282353, 1, 0, 1,
-0.6027579, -0.2725861, -2.168758, 0.2784314, 1, 0, 1,
-0.600373, -0.3587151, -0.3645418, 0.2705882, 1, 0, 1,
-0.5990536, 0.1272588, -1.360396, 0.2666667, 1, 0, 1,
-0.5970572, -1.193715, -3.133412, 0.2588235, 1, 0, 1,
-0.5932791, -0.1667685, -1.29803, 0.254902, 1, 0, 1,
-0.5861976, 0.5406304, -0.9659482, 0.2470588, 1, 0, 1,
-0.5802813, -0.7132375, -3.96116, 0.2431373, 1, 0, 1,
-0.5747718, -0.05983388, -1.879233, 0.2352941, 1, 0, 1,
-0.56865, 0.5639063, 0.1069525, 0.2313726, 1, 0, 1,
-0.5659947, 1.490343, 0.6407938, 0.2235294, 1, 0, 1,
-0.5633563, -0.6000461, -1.540082, 0.2196078, 1, 0, 1,
-0.5583254, -0.2141333, 0.1303729, 0.2117647, 1, 0, 1,
-0.557641, -0.1137677, -1.579627, 0.2078431, 1, 0, 1,
-0.5558916, 1.23723, -0.1598592, 0.2, 1, 0, 1,
-0.5556212, 0.4315252, -1.036265, 0.1921569, 1, 0, 1,
-0.5554652, 0.2945639, -0.2484628, 0.1882353, 1, 0, 1,
-0.5549901, -0.546864, -2.958285, 0.1803922, 1, 0, 1,
-0.5486131, -0.6975247, -2.740377, 0.1764706, 1, 0, 1,
-0.5449883, -0.1473849, -0.7762251, 0.1686275, 1, 0, 1,
-0.544102, -0.6241653, -1.401221, 0.1647059, 1, 0, 1,
-0.5418313, 0.9062794, 1.099683, 0.1568628, 1, 0, 1,
-0.5390458, 0.5067466, -1.62472, 0.1529412, 1, 0, 1,
-0.5376304, -1.603255, -0.8541735, 0.145098, 1, 0, 1,
-0.5349451, -0.8188605, -2.708501, 0.1411765, 1, 0, 1,
-0.534297, -0.8401802, -3.593229, 0.1333333, 1, 0, 1,
-0.5305976, -1.168309, -2.712481, 0.1294118, 1, 0, 1,
-0.519528, -0.1409141, -2.313287, 0.1215686, 1, 0, 1,
-0.519282, 0.7622282, 0.07535362, 0.1176471, 1, 0, 1,
-0.5168091, 0.7319621, 1.487394, 0.1098039, 1, 0, 1,
-0.514811, -0.7810058, -0.8760403, 0.1058824, 1, 0, 1,
-0.511591, -0.203773, -1.161039, 0.09803922, 1, 0, 1,
-0.5063831, -0.2220111, -3.183211, 0.09019608, 1, 0, 1,
-0.506269, 0.8260236, -1.988623, 0.08627451, 1, 0, 1,
-0.5032463, -1.048242, -1.943151, 0.07843138, 1, 0, 1,
-0.4996907, -0.6661257, -2.751675, 0.07450981, 1, 0, 1,
-0.4996673, 0.3618708, -0.1475879, 0.06666667, 1, 0, 1,
-0.4917835, -1.253665, -2.189058, 0.0627451, 1, 0, 1,
-0.4914936, 0.02379585, -1.25445, 0.05490196, 1, 0, 1,
-0.4879443, 1.708058, 1.310607, 0.05098039, 1, 0, 1,
-0.4877717, 0.7572287, -0.14575, 0.04313726, 1, 0, 1,
-0.4734362, -0.1217483, -2.32134, 0.03921569, 1, 0, 1,
-0.4673394, 0.6461111, 0.9065711, 0.03137255, 1, 0, 1,
-0.4654012, -0.9626113, -2.869641, 0.02745098, 1, 0, 1,
-0.4639271, 1.532625, -1.585925, 0.01960784, 1, 0, 1,
-0.4618923, -0.859579, -2.304734, 0.01568628, 1, 0, 1,
-0.4592423, 0.2564058, -0.6362348, 0.007843138, 1, 0, 1,
-0.4507119, -0.1114703, -2.174466, 0.003921569, 1, 0, 1,
-0.4506875, 1.167702, 0.498457, 0, 1, 0.003921569, 1,
-0.4463132, -0.4177303, -2.187717, 0, 1, 0.01176471, 1,
-0.4462628, 0.1263932, -0.2405818, 0, 1, 0.01568628, 1,
-0.4436445, 0.06422221, -1.495161, 0, 1, 0.02352941, 1,
-0.4417845, -0.9671905, -3.059784, 0, 1, 0.02745098, 1,
-0.4400912, 0.2674052, -1.282477, 0, 1, 0.03529412, 1,
-0.4388926, -1.080438, -2.840325, 0, 1, 0.03921569, 1,
-0.4308442, -0.06762426, -0.8519315, 0, 1, 0.04705882, 1,
-0.4297359, -1.069927, -1.105598, 0, 1, 0.05098039, 1,
-0.4279944, -2.199164, -3.382908, 0, 1, 0.05882353, 1,
-0.4278812, 0.7497391, -2.42415, 0, 1, 0.0627451, 1,
-0.4269544, 1.47311, 0.1890298, 0, 1, 0.07058824, 1,
-0.41256, -2.312274, -1.654348, 0, 1, 0.07450981, 1,
-0.4111377, 0.7117401, -0.887125, 0, 1, 0.08235294, 1,
-0.4110123, 0.8399795, -0.832078, 0, 1, 0.08627451, 1,
-0.3988456, 0.4427099, -1.490458, 0, 1, 0.09411765, 1,
-0.3968899, 1.150487, -1.52289, 0, 1, 0.1019608, 1,
-0.3902476, 1.511332, -0.3575173, 0, 1, 0.1058824, 1,
-0.3893403, -0.5286362, -1.687809, 0, 1, 0.1137255, 1,
-0.3871379, 0.2172239, -0.3112717, 0, 1, 0.1176471, 1,
-0.3868294, 0.7507162, -2.49906, 0, 1, 0.1254902, 1,
-0.3849692, -1.468078, -3.700631, 0, 1, 0.1294118, 1,
-0.3828129, 0.4387582, -0.119893, 0, 1, 0.1372549, 1,
-0.3825551, -1.404438, -3.47796, 0, 1, 0.1411765, 1,
-0.3776489, -0.1151969, -2.577278, 0, 1, 0.1490196, 1,
-0.3770773, -0.1642073, -1.253932, 0, 1, 0.1529412, 1,
-0.3766593, 1.177761, -1.068323, 0, 1, 0.1607843, 1,
-0.3745579, -2.224763, -0.8842982, 0, 1, 0.1647059, 1,
-0.3726428, 0.02533249, -2.026471, 0, 1, 0.172549, 1,
-0.3723888, 0.2003744, -1.695085, 0, 1, 0.1764706, 1,
-0.3651144, -1.18463, -2.909699, 0, 1, 0.1843137, 1,
-0.3647094, -0.3075694, -0.7783101, 0, 1, 0.1882353, 1,
-0.3640289, -0.09102449, -0.599805, 0, 1, 0.1960784, 1,
-0.3634443, 0.9483881, 0.5924032, 0, 1, 0.2039216, 1,
-0.3617135, -1.223084, -0.7463909, 0, 1, 0.2078431, 1,
-0.3608864, -0.5144857, -0.739723, 0, 1, 0.2156863, 1,
-0.3584891, 0.2371332, -0.6878526, 0, 1, 0.2196078, 1,
-0.3574608, 0.7470107, 0.5464491, 0, 1, 0.227451, 1,
-0.3563859, 0.3071832, -2.093263, 0, 1, 0.2313726, 1,
-0.3536757, 0.5898925, 1.830623, 0, 1, 0.2392157, 1,
-0.3500921, -1.604748, -2.737064, 0, 1, 0.2431373, 1,
-0.3480358, 0.8503971, -0.02453038, 0, 1, 0.2509804, 1,
-0.3478676, 0.2900854, 1.387483, 0, 1, 0.254902, 1,
-0.3475902, -1.152014, -3.099149, 0, 1, 0.2627451, 1,
-0.3348278, -0.5143757, -2.209609, 0, 1, 0.2666667, 1,
-0.3326256, -0.1990426, -2.047434, 0, 1, 0.2745098, 1,
-0.3255707, 1.894521, -0.7398332, 0, 1, 0.2784314, 1,
-0.3246239, 0.2726578, -0.3460856, 0, 1, 0.2862745, 1,
-0.3234068, 0.9450607, -0.4224201, 0, 1, 0.2901961, 1,
-0.3217081, 1.432439, -0.0809652, 0, 1, 0.2980392, 1,
-0.3212669, 1.820194, -1.648013, 0, 1, 0.3058824, 1,
-0.3151374, 0.5299879, -1.711533, 0, 1, 0.3098039, 1,
-0.3093275, 0.03110338, -0.7329814, 0, 1, 0.3176471, 1,
-0.3090678, 1.5587, 2.514002, 0, 1, 0.3215686, 1,
-0.3071262, -0.2662069, -0.4110748, 0, 1, 0.3294118, 1,
-0.3054104, 1.075926, 0.3645949, 0, 1, 0.3333333, 1,
-0.3038303, -0.1744482, -2.284491, 0, 1, 0.3411765, 1,
-0.2976133, -0.7474437, -2.441508, 0, 1, 0.345098, 1,
-0.2934415, -0.4261627, -1.351621, 0, 1, 0.3529412, 1,
-0.2901719, 0.04164946, -1.14837, 0, 1, 0.3568628, 1,
-0.2864718, 0.258368, -1.708795, 0, 1, 0.3647059, 1,
-0.2810473, -0.4182334, -1.858076, 0, 1, 0.3686275, 1,
-0.2808217, 1.293111, -0.122344, 0, 1, 0.3764706, 1,
-0.2801231, -0.04078521, -2.982166, 0, 1, 0.3803922, 1,
-0.2800841, -0.8814709, -2.251102, 0, 1, 0.3882353, 1,
-0.2792172, 0.3467474, -0.5953549, 0, 1, 0.3921569, 1,
-0.2671932, -0.9571988, -1.31128, 0, 1, 0.4, 1,
-0.2664191, -0.6589615, -2.907495, 0, 1, 0.4078431, 1,
-0.261077, -0.5414176, -2.628971, 0, 1, 0.4117647, 1,
-0.2609878, 0.191036, -1.613994, 0, 1, 0.4196078, 1,
-0.2575616, -0.7666094, -2.553229, 0, 1, 0.4235294, 1,
-0.2513945, -1.048923, -1.581086, 0, 1, 0.4313726, 1,
-0.2458819, -0.5791066, -2.4587, 0, 1, 0.4352941, 1,
-0.2421447, 0.3382229, -2.511023, 0, 1, 0.4431373, 1,
-0.2414566, 1.227401, 0.9932511, 0, 1, 0.4470588, 1,
-0.2400152, 0.2369285, -2.051226, 0, 1, 0.454902, 1,
-0.235771, -0.02415283, -1.461414, 0, 1, 0.4588235, 1,
-0.2285779, -0.7513434, -4.027846, 0, 1, 0.4666667, 1,
-0.2280836, -0.9054994, -0.6367139, 0, 1, 0.4705882, 1,
-0.2221814, -1.124228, -3.990462, 0, 1, 0.4784314, 1,
-0.2158211, 0.1201063, -3.362676, 0, 1, 0.4823529, 1,
-0.2127561, -0.3010709, -4.023254, 0, 1, 0.4901961, 1,
-0.2093246, -2.005106, -2.625074, 0, 1, 0.4941176, 1,
-0.203967, 1.11628, -0.2593455, 0, 1, 0.5019608, 1,
-0.2027568, 0.7572061, 0.5688547, 0, 1, 0.509804, 1,
-0.2015664, -0.6369258, -1.609291, 0, 1, 0.5137255, 1,
-0.1952058, -0.5010601, -5.370537, 0, 1, 0.5215687, 1,
-0.1905723, -0.09836734, -3.093668, 0, 1, 0.5254902, 1,
-0.1888, -0.9751196, -2.502158, 0, 1, 0.5333334, 1,
-0.184077, -0.6773896, -1.680793, 0, 1, 0.5372549, 1,
-0.1818306, -0.9737868, -3.340124, 0, 1, 0.5450981, 1,
-0.1751804, -2.373351, -1.059537, 0, 1, 0.5490196, 1,
-0.1735562, 0.3943301, -0.9388888, 0, 1, 0.5568628, 1,
-0.1730742, 0.6162504, 1.116778, 0, 1, 0.5607843, 1,
-0.1730625, -1.746798, -4.735024, 0, 1, 0.5686275, 1,
-0.1725552, 1.879063, -0.2248123, 0, 1, 0.572549, 1,
-0.1723955, -1.153205, -1.645746, 0, 1, 0.5803922, 1,
-0.1718097, -0.7929764, -2.575845, 0, 1, 0.5843138, 1,
-0.1717819, -1.57757, -2.971715, 0, 1, 0.5921569, 1,
-0.1700479, 1.344861, -0.4952536, 0, 1, 0.5960785, 1,
-0.1692165, -0.8602023, -3.138712, 0, 1, 0.6039216, 1,
-0.1683459, -1.463525, -5.028592, 0, 1, 0.6117647, 1,
-0.1664686, 1.191774, -1.828988, 0, 1, 0.6156863, 1,
-0.1663348, 0.3501872, -0.9162554, 0, 1, 0.6235294, 1,
-0.1637698, -1.368417, -4.134034, 0, 1, 0.627451, 1,
-0.1625611, -0.3704522, -1.688694, 0, 1, 0.6352941, 1,
-0.1606568, 0.4946702, -0.9361785, 0, 1, 0.6392157, 1,
-0.1604056, 0.1252485, -0.6253121, 0, 1, 0.6470588, 1,
-0.1551182, 0.7046874, 1.501712, 0, 1, 0.6509804, 1,
-0.152371, 0.8706236, -1.70144, 0, 1, 0.6588235, 1,
-0.1522283, 0.6163048, -0.4591079, 0, 1, 0.6627451, 1,
-0.146251, 0.671929, -1.094964, 0, 1, 0.6705883, 1,
-0.1431007, -1.176805, -2.848253, 0, 1, 0.6745098, 1,
-0.1386017, -0.1304594, -3.519158, 0, 1, 0.682353, 1,
-0.1367724, 0.7426419, -1.03821, 0, 1, 0.6862745, 1,
-0.1263594, 0.2389307, -1.642926, 0, 1, 0.6941177, 1,
-0.1208632, 0.3638789, -0.8315203, 0, 1, 0.7019608, 1,
-0.1191191, -0.1404036, -4.169231, 0, 1, 0.7058824, 1,
-0.1150798, -0.258569, -2.795058, 0, 1, 0.7137255, 1,
-0.114217, -0.3004819, -1.781234, 0, 1, 0.7176471, 1,
-0.1138462, -0.3993843, -2.362859, 0, 1, 0.7254902, 1,
-0.1124887, 1.289742, 1.104771, 0, 1, 0.7294118, 1,
-0.1098948, -0.06609253, -1.631176, 0, 1, 0.7372549, 1,
-0.1082308, 0.6824197, -0.3196492, 0, 1, 0.7411765, 1,
-0.106268, 0.6666547, -0.9497064, 0, 1, 0.7490196, 1,
-0.1022161, -0.1735588, -0.141054, 0, 1, 0.7529412, 1,
-0.1000229, 2.084747, -0.8291618, 0, 1, 0.7607843, 1,
-0.09963335, -1.466346, -3.572138, 0, 1, 0.7647059, 1,
-0.09928308, 0.2338997, -1.037687, 0, 1, 0.772549, 1,
-0.09913089, -0.7869011, -4.297393, 0, 1, 0.7764706, 1,
-0.09910025, 1.936811, -1.384001, 0, 1, 0.7843137, 1,
-0.09853199, 0.3798234, -0.0890587, 0, 1, 0.7882353, 1,
-0.09290055, -2.692979, -3.418396, 0, 1, 0.7960784, 1,
-0.09231555, -1.059195, -3.148324, 0, 1, 0.8039216, 1,
-0.0853864, -1.081873, -2.260723, 0, 1, 0.8078431, 1,
-0.0834725, 1.09074, 1.225321, 0, 1, 0.8156863, 1,
-0.08216016, -1.893355, -2.792271, 0, 1, 0.8196079, 1,
-0.07586364, 0.03586609, -0.3378662, 0, 1, 0.827451, 1,
-0.07453825, -0.3566623, -2.648012, 0, 1, 0.8313726, 1,
-0.07007407, 1.740617, 1.19473, 0, 1, 0.8392157, 1,
-0.06644657, -1.317453, -3.914631, 0, 1, 0.8431373, 1,
-0.0588943, 0.2130251, -0.452608, 0, 1, 0.8509804, 1,
-0.05888268, -0.3722356, -1.89375, 0, 1, 0.854902, 1,
-0.05867769, -1.351082, -0.8963705, 0, 1, 0.8627451, 1,
-0.05787683, 0.2480437, -1.214408, 0, 1, 0.8666667, 1,
-0.05600401, -0.7753751, -2.503315, 0, 1, 0.8745098, 1,
-0.05532449, 0.2921646, -1.135123, 0, 1, 0.8784314, 1,
-0.05477387, 0.5514867, -1.618146, 0, 1, 0.8862745, 1,
-0.05268051, -0.2996728, -2.400162, 0, 1, 0.8901961, 1,
-0.05242723, 0.4056411, -0.6080515, 0, 1, 0.8980392, 1,
-0.03300179, 0.6778263, -0.5611869, 0, 1, 0.9058824, 1,
-0.03256524, -1.180012, -1.923092, 0, 1, 0.9098039, 1,
-0.03228343, -0.6116921, -3.165833, 0, 1, 0.9176471, 1,
-0.01934727, 0.4401641, 1.513757, 0, 1, 0.9215686, 1,
-0.01653629, 0.6745899, 1.225618, 0, 1, 0.9294118, 1,
-0.01302153, -0.5815544, -1.803276, 0, 1, 0.9333333, 1,
-0.01015522, -1.401744, -1.966989, 0, 1, 0.9411765, 1,
-0.009963049, 1.130382, -0.2922643, 0, 1, 0.945098, 1,
-0.009552334, -0.8808559, -3.133327, 0, 1, 0.9529412, 1,
-0.008122425, 0.2084931, 1.366006, 0, 1, 0.9568627, 1,
-0.006174583, -0.6199738, -3.584049, 0, 1, 0.9647059, 1,
-0.003331339, -0.6320388, -4.562367, 0, 1, 0.9686275, 1,
-0.002184462, 0.9611542, 0.2923142, 0, 1, 0.9764706, 1,
0.0006045171, -1.088964, 3.72928, 0, 1, 0.9803922, 1,
0.0006261318, -0.06798692, 2.688574, 0, 1, 0.9882353, 1,
0.002014979, -0.2843553, 2.624475, 0, 1, 0.9921569, 1,
0.002553991, -0.2469283, 3.930586, 0, 1, 1, 1,
0.002718837, -0.4281656, 2.540316, 0, 0.9921569, 1, 1,
0.006045624, 0.3939266, -0.4094435, 0, 0.9882353, 1, 1,
0.01042674, -1.676908, 3.688285, 0, 0.9803922, 1, 1,
0.01762551, -0.5996909, 2.554988, 0, 0.9764706, 1, 1,
0.02006866, 0.6311461, -0.1210886, 0, 0.9686275, 1, 1,
0.02079812, 2.035343, -0.9382766, 0, 0.9647059, 1, 1,
0.02292526, 0.7750572, -1.001866, 0, 0.9568627, 1, 1,
0.02361674, -0.8089412, 3.923387, 0, 0.9529412, 1, 1,
0.02978421, -1.232768, 2.852872, 0, 0.945098, 1, 1,
0.03481594, 0.05200331, 1.6965, 0, 0.9411765, 1, 1,
0.0371899, -1.266713, 3.018896, 0, 0.9333333, 1, 1,
0.0388787, -0.5960601, 2.869484, 0, 0.9294118, 1, 1,
0.04309072, 0.8513868, -2.599195, 0, 0.9215686, 1, 1,
0.04495047, -0.1172415, 2.341731, 0, 0.9176471, 1, 1,
0.04567265, -0.465292, 4.128619, 0, 0.9098039, 1, 1,
0.04711733, 0.4539519, -0.2863445, 0, 0.9058824, 1, 1,
0.05078474, 0.7273859, -0.4154178, 0, 0.8980392, 1, 1,
0.05399428, 0.4221092, -0.4368315, 0, 0.8901961, 1, 1,
0.05968263, -0.7993951, 1.760314, 0, 0.8862745, 1, 1,
0.05975946, -1.075782, 2.311478, 0, 0.8784314, 1, 1,
0.06148132, 0.7270909, 0.2482174, 0, 0.8745098, 1, 1,
0.06719989, -0.9604304, 2.838189, 0, 0.8666667, 1, 1,
0.06927564, 1.571041, -0.9848447, 0, 0.8627451, 1, 1,
0.06929293, -1.304397, 3.271454, 0, 0.854902, 1, 1,
0.07111806, 1.505183, -0.5333104, 0, 0.8509804, 1, 1,
0.07755373, -0.7202945, 1.313716, 0, 0.8431373, 1, 1,
0.08052567, -1.452945, 1.045827, 0, 0.8392157, 1, 1,
0.08069306, -0.1598217, 2.528743, 0, 0.8313726, 1, 1,
0.08243326, 0.2058358, 0.9539783, 0, 0.827451, 1, 1,
0.08518998, 0.7203363, 0.4668802, 0, 0.8196079, 1, 1,
0.08544238, 0.3487493, 0.5509717, 0, 0.8156863, 1, 1,
0.09124775, -0.1575741, 2.778676, 0, 0.8078431, 1, 1,
0.09660787, -0.105281, 1.906631, 0, 0.8039216, 1, 1,
0.09980205, 0.1754162, -1.09264, 0, 0.7960784, 1, 1,
0.1010779, -2.665378, 2.606844, 0, 0.7882353, 1, 1,
0.1015386, 2.007772, -0.4612658, 0, 0.7843137, 1, 1,
0.1075919, 0.7039583, -0.1680037, 0, 0.7764706, 1, 1,
0.1079641, -0.4419236, 2.258295, 0, 0.772549, 1, 1,
0.1151979, -0.3634319, 2.44633, 0, 0.7647059, 1, 1,
0.1177602, 0.04848896, 1.60084, 0, 0.7607843, 1, 1,
0.1265531, -2.01745, 3.247035, 0, 0.7529412, 1, 1,
0.1268947, -0.2838957, 3.138237, 0, 0.7490196, 1, 1,
0.1272985, -0.4146976, 1.703462, 0, 0.7411765, 1, 1,
0.1283355, 0.8074425, 0.1945723, 0, 0.7372549, 1, 1,
0.1287455, 1.019488, -1.312783, 0, 0.7294118, 1, 1,
0.1323275, -0.4192857, 2.641329, 0, 0.7254902, 1, 1,
0.1371358, -1.147779, 4.067946, 0, 0.7176471, 1, 1,
0.1405795, 1.032875, -1.752342, 0, 0.7137255, 1, 1,
0.1412132, 0.5606065, 0.1549014, 0, 0.7058824, 1, 1,
0.1413893, -0.4026989, 2.534149, 0, 0.6980392, 1, 1,
0.1422593, -1.368835, 2.447008, 0, 0.6941177, 1, 1,
0.1427216, 1.238106, 1.313573, 0, 0.6862745, 1, 1,
0.1501491, 0.9752806, -0.7122275, 0, 0.682353, 1, 1,
0.1528757, 0.888921, -1.178362, 0, 0.6745098, 1, 1,
0.1602188, 0.4520442, 1.140388, 0, 0.6705883, 1, 1,
0.1607408, 0.1607931, 0.2431756, 0, 0.6627451, 1, 1,
0.161963, 0.7333222, -0.9879773, 0, 0.6588235, 1, 1,
0.1673647, -1.283719, 2.439064, 0, 0.6509804, 1, 1,
0.1683975, -0.3920027, 2.072807, 0, 0.6470588, 1, 1,
0.1761007, -0.8245038, 1.918184, 0, 0.6392157, 1, 1,
0.1792825, -1.144368, 2.663257, 0, 0.6352941, 1, 1,
0.1793804, 0.2616895, 0.3501296, 0, 0.627451, 1, 1,
0.1824657, 0.4710087, -0.1004468, 0, 0.6235294, 1, 1,
0.1836872, 1.873217, -0.8673559, 0, 0.6156863, 1, 1,
0.1864086, 1.188169, 0.5619369, 0, 0.6117647, 1, 1,
0.1870647, 0.01058546, 1.295282, 0, 0.6039216, 1, 1,
0.1871274, -0.5616889, 3.522141, 0, 0.5960785, 1, 1,
0.1895729, 0.01375834, -0.5880848, 0, 0.5921569, 1, 1,
0.1929937, 1.68846, -0.7789171, 0, 0.5843138, 1, 1,
0.198643, -1.160994, 1.959661, 0, 0.5803922, 1, 1,
0.1991059, 0.498401, -1.077182, 0, 0.572549, 1, 1,
0.1994185, 0.25617, -0.2797924, 0, 0.5686275, 1, 1,
0.2021106, 1.382798, -0.1259821, 0, 0.5607843, 1, 1,
0.2077441, 0.1688146, 0.7266703, 0, 0.5568628, 1, 1,
0.2098458, -0.5099067, 2.351851, 0, 0.5490196, 1, 1,
0.2119305, -1.937837, 3.365337, 0, 0.5450981, 1, 1,
0.2167938, 1.100943, -1.409273, 0, 0.5372549, 1, 1,
0.2238488, -0.3788494, 3.267908, 0, 0.5333334, 1, 1,
0.2278561, -1.468552, 2.786387, 0, 0.5254902, 1, 1,
0.2283203, -0.8342643, 3.830955, 0, 0.5215687, 1, 1,
0.2329174, -1.247558, 1.963354, 0, 0.5137255, 1, 1,
0.2386619, 0.5553883, -0.5092745, 0, 0.509804, 1, 1,
0.2392809, -0.921781, 3.010537, 0, 0.5019608, 1, 1,
0.2404515, 0.1355851, 1.974148, 0, 0.4941176, 1, 1,
0.2405633, -0.3971618, 2.601748, 0, 0.4901961, 1, 1,
0.2413755, -1.466229, 2.960371, 0, 0.4823529, 1, 1,
0.2504347, 0.0362598, 0.8714888, 0, 0.4784314, 1, 1,
0.2510105, 2.087059, -0.2966743, 0, 0.4705882, 1, 1,
0.2545528, 2.49406, -0.1127372, 0, 0.4666667, 1, 1,
0.254789, 0.5668295, -0.8848681, 0, 0.4588235, 1, 1,
0.2588523, 0.5595893, 1.149244, 0, 0.454902, 1, 1,
0.2598085, 1.633704, 0.930385, 0, 0.4470588, 1, 1,
0.2640034, 0.9269205, 0.5749567, 0, 0.4431373, 1, 1,
0.2640178, 1.447854, 1.103056, 0, 0.4352941, 1, 1,
0.2653202, -0.6297032, 3.530189, 0, 0.4313726, 1, 1,
0.2667651, 0.6444832, -0.1909554, 0, 0.4235294, 1, 1,
0.2702955, -0.1556826, 1.935342, 0, 0.4196078, 1, 1,
0.2722962, 0.9394214, -0.177295, 0, 0.4117647, 1, 1,
0.2782142, 0.3284276, 1.549929, 0, 0.4078431, 1, 1,
0.2786974, -0.1945639, 1.781697, 0, 0.4, 1, 1,
0.2825786, 0.7142023, 0.1269447, 0, 0.3921569, 1, 1,
0.2839199, 0.5491255, 0.3345684, 0, 0.3882353, 1, 1,
0.2869429, -1.210661, 3.570109, 0, 0.3803922, 1, 1,
0.2905161, -1.267133, 2.673557, 0, 0.3764706, 1, 1,
0.2908901, -0.9113036, 3.334734, 0, 0.3686275, 1, 1,
0.294953, -1.487489, 3.657646, 0, 0.3647059, 1, 1,
0.2955793, 1.388033, -0.9048347, 0, 0.3568628, 1, 1,
0.2977124, 0.8715096, -0.07685049, 0, 0.3529412, 1, 1,
0.2987126, 0.4692393, 1.012493, 0, 0.345098, 1, 1,
0.3061671, -0.07859907, 3.320044, 0, 0.3411765, 1, 1,
0.3076378, 0.584444, 0.6067063, 0, 0.3333333, 1, 1,
0.3078038, 0.7105955, -0.2824403, 0, 0.3294118, 1, 1,
0.3093758, -0.06106427, 2.332833, 0, 0.3215686, 1, 1,
0.3133202, -0.5631311, 2.084599, 0, 0.3176471, 1, 1,
0.3181276, -0.2506906, 0.4236009, 0, 0.3098039, 1, 1,
0.3191072, -1.184915, 4.156854, 0, 0.3058824, 1, 1,
0.3191905, -1.028781, 1.784734, 0, 0.2980392, 1, 1,
0.3212566, 1.034861, 0.4025233, 0, 0.2901961, 1, 1,
0.3215036, -0.6970253, 3.387393, 0, 0.2862745, 1, 1,
0.3217174, 0.6091293, 0.6797214, 0, 0.2784314, 1, 1,
0.3291333, -0.3466922, 2.014499, 0, 0.2745098, 1, 1,
0.33314, -0.02337725, 0.8420158, 0, 0.2666667, 1, 1,
0.336242, -1.415248, 3.580204, 0, 0.2627451, 1, 1,
0.3411992, -0.3849105, 2.481733, 0, 0.254902, 1, 1,
0.344281, -0.637609, 3.757688, 0, 0.2509804, 1, 1,
0.351404, 0.8645278, -0.6818337, 0, 0.2431373, 1, 1,
0.3620853, 1.372428, 0.5877278, 0, 0.2392157, 1, 1,
0.3634237, -0.4422207, 1.351485, 0, 0.2313726, 1, 1,
0.3650714, 1.157346, -0.127307, 0, 0.227451, 1, 1,
0.36554, 0.9439682, 0.6757757, 0, 0.2196078, 1, 1,
0.3673707, -0.3700714, 2.701613, 0, 0.2156863, 1, 1,
0.3714279, 1.054755, -0.8040575, 0, 0.2078431, 1, 1,
0.3734671, -1.387984, 2.410989, 0, 0.2039216, 1, 1,
0.3752759, 0.5131943, 2.275605, 0, 0.1960784, 1, 1,
0.3757336, 0.6367768, 1.071602, 0, 0.1882353, 1, 1,
0.3762135, 0.1261928, 0.9711699, 0, 0.1843137, 1, 1,
0.3839721, 3.381621, -1.151325, 0, 0.1764706, 1, 1,
0.3876119, -0.8945449, 1.649661, 0, 0.172549, 1, 1,
0.3886054, 0.5306721, 0.1453735, 0, 0.1647059, 1, 1,
0.3905868, 1.766611, -0.7005244, 0, 0.1607843, 1, 1,
0.3926906, -0.5680856, 3.422223, 0, 0.1529412, 1, 1,
0.3930134, 0.2373659, 0.3859195, 0, 0.1490196, 1, 1,
0.3931829, -1.378787, 4.083477, 0, 0.1411765, 1, 1,
0.3941884, 0.6779522, 0.6456769, 0, 0.1372549, 1, 1,
0.395172, -1.75986, 2.902933, 0, 0.1294118, 1, 1,
0.3985877, -0.4985237, 1.045942, 0, 0.1254902, 1, 1,
0.405461, -0.3813336, 0.8957725, 0, 0.1176471, 1, 1,
0.4094658, -0.5842003, 1.403597, 0, 0.1137255, 1, 1,
0.4119608, 0.09359577, 1.052973, 0, 0.1058824, 1, 1,
0.4125068, -1.512582, 3.341921, 0, 0.09803922, 1, 1,
0.4127725, 0.1407825, 2.088899, 0, 0.09411765, 1, 1,
0.4144039, 1.140239, 0.6264152, 0, 0.08627451, 1, 1,
0.4146034, -0.3242677, 1.58224, 0, 0.08235294, 1, 1,
0.4154408, 2.327403, 2.709978, 0, 0.07450981, 1, 1,
0.421, -0.2957667, 4.190444, 0, 0.07058824, 1, 1,
0.4211034, 0.3396925, 1.476338, 0, 0.0627451, 1, 1,
0.4259234, 0.1950311, 3.381126, 0, 0.05882353, 1, 1,
0.429852, 0.296871, 1.740221, 0, 0.05098039, 1, 1,
0.4327506, 0.3663742, 1.005043, 0, 0.04705882, 1, 1,
0.4350061, -1.865833, 1.126636, 0, 0.03921569, 1, 1,
0.4364573, 0.5017592, -0.5165504, 0, 0.03529412, 1, 1,
0.4394632, 0.1442953, 0.9442605, 0, 0.02745098, 1, 1,
0.4399194, 1.780715, -0.4491345, 0, 0.02352941, 1, 1,
0.4400241, -0.3393243, 1.433303, 0, 0.01568628, 1, 1,
0.4441614, -0.08650886, 0.06951787, 0, 0.01176471, 1, 1,
0.4453288, 1.691832, -0.1908628, 0, 0.003921569, 1, 1,
0.4461858, -0.08090953, 3.002581, 0.003921569, 0, 1, 1,
0.4521166, 1.618321, 0.2945529, 0.007843138, 0, 1, 1,
0.4536586, 0.5189527, 1.00639, 0.01568628, 0, 1, 1,
0.459469, 0.9331641, 0.1467012, 0.01960784, 0, 1, 1,
0.4614585, -0.9953753, 1.889526, 0.02745098, 0, 1, 1,
0.4668452, -0.7989697, 1.804341, 0.03137255, 0, 1, 1,
0.469831, -1.055097, 3.354696, 0.03921569, 0, 1, 1,
0.4750006, -1.539052, 3.125269, 0.04313726, 0, 1, 1,
0.480834, -0.05250892, 1.65453, 0.05098039, 0, 1, 1,
0.4809584, 1.195957, -0.3142906, 0.05490196, 0, 1, 1,
0.4838023, 0.4570584, 1.438201, 0.0627451, 0, 1, 1,
0.4857228, -0.04528655, 1.472716, 0.06666667, 0, 1, 1,
0.4905873, -0.5012622, 4.215219, 0.07450981, 0, 1, 1,
0.4908031, 1.013406, 1.197536, 0.07843138, 0, 1, 1,
0.4930352, -0.8750219, 2.158111, 0.08627451, 0, 1, 1,
0.5000421, 0.4095046, 1.453089, 0.09019608, 0, 1, 1,
0.5031691, -0.724974, 3.962212, 0.09803922, 0, 1, 1,
0.5098509, 0.6546484, 0.6814508, 0.1058824, 0, 1, 1,
0.5135957, -0.3044188, 5.920862, 0.1098039, 0, 1, 1,
0.5146375, 1.17724, -0.1854554, 0.1176471, 0, 1, 1,
0.515593, -0.2908753, 2.72565, 0.1215686, 0, 1, 1,
0.5164531, -0.9860924, 3.943172, 0.1294118, 0, 1, 1,
0.5178709, -1.446786, 0.09863866, 0.1333333, 0, 1, 1,
0.526498, 0.06847171, 1.872311, 0.1411765, 0, 1, 1,
0.5291994, 1.161122, 0.05430422, 0.145098, 0, 1, 1,
0.5346183, -0.1272328, 2.303077, 0.1529412, 0, 1, 1,
0.5354387, -0.8277456, 2.972289, 0.1568628, 0, 1, 1,
0.5358273, 0.6991602, 0.01192071, 0.1647059, 0, 1, 1,
0.5372816, 0.1832786, 1.439212, 0.1686275, 0, 1, 1,
0.5418919, 1.124555, -0.5802121, 0.1764706, 0, 1, 1,
0.5490347, 0.2216911, 1.926125, 0.1803922, 0, 1, 1,
0.5587657, 1.803365, 0.4597175, 0.1882353, 0, 1, 1,
0.5607377, 0.6215532, 0.5032939, 0.1921569, 0, 1, 1,
0.5691352, 0.8333184, 0.06774478, 0.2, 0, 1, 1,
0.5786834, -2.344547, 3.328682, 0.2078431, 0, 1, 1,
0.5828051, 0.598978, 0.05663596, 0.2117647, 0, 1, 1,
0.5828947, -0.03620732, 1.251309, 0.2196078, 0, 1, 1,
0.5880714, -0.2528274, 0.9551274, 0.2235294, 0, 1, 1,
0.5951612, -0.05164649, -0.27562, 0.2313726, 0, 1, 1,
0.6051204, 1.936261, 1.602236, 0.2352941, 0, 1, 1,
0.6077656, -1.189272, 3.308354, 0.2431373, 0, 1, 1,
0.6085792, -1.130723, 4.102798, 0.2470588, 0, 1, 1,
0.61041, 0.2135316, 0.8477036, 0.254902, 0, 1, 1,
0.6105591, 0.7412022, 0.3608027, 0.2588235, 0, 1, 1,
0.6115434, -1.246892, 2.572707, 0.2666667, 0, 1, 1,
0.6137982, -0.5119197, 3.578383, 0.2705882, 0, 1, 1,
0.6144866, -1.72056, 2.681782, 0.2784314, 0, 1, 1,
0.6146579, -0.4071788, 2.777362, 0.282353, 0, 1, 1,
0.6159478, 0.2217051, 1.685965, 0.2901961, 0, 1, 1,
0.6166037, 0.6228271, 1.119057, 0.2941177, 0, 1, 1,
0.6178364, -1.436248, 2.813068, 0.3019608, 0, 1, 1,
0.6178941, 1.033664, 2.509609, 0.3098039, 0, 1, 1,
0.6291068, -0.390079, 2.916305, 0.3137255, 0, 1, 1,
0.6315051, -0.406305, 1.939417, 0.3215686, 0, 1, 1,
0.6355495, 0.2274406, 2.33074, 0.3254902, 0, 1, 1,
0.6365077, 1.037382, -0.7070018, 0.3333333, 0, 1, 1,
0.6371453, 1.196531, 2.538909, 0.3372549, 0, 1, 1,
0.6378709, 0.6096601, -1.362145, 0.345098, 0, 1, 1,
0.6396286, -2.145633, 3.513916, 0.3490196, 0, 1, 1,
0.6425785, 0.6505386, 1.851712, 0.3568628, 0, 1, 1,
0.6436024, 0.7879439, 1.53451, 0.3607843, 0, 1, 1,
0.6459894, 0.09616123, 1.637418, 0.3686275, 0, 1, 1,
0.6536279, 0.6305262, 2.13345, 0.372549, 0, 1, 1,
0.6543714, -0.5990208, 0.7763457, 0.3803922, 0, 1, 1,
0.657541, -0.9728135, 1.317849, 0.3843137, 0, 1, 1,
0.6628639, -1.159441, 3.028083, 0.3921569, 0, 1, 1,
0.6650057, -1.76042, 4.020018, 0.3960784, 0, 1, 1,
0.6671906, -1.525582, 1.75634, 0.4039216, 0, 1, 1,
0.6696837, 0.8825698, 0.8135892, 0.4117647, 0, 1, 1,
0.6716112, -1.495449, 3.664789, 0.4156863, 0, 1, 1,
0.6752688, -1.641301, 5.336647, 0.4235294, 0, 1, 1,
0.6754103, 1.437432, 0.5870547, 0.427451, 0, 1, 1,
0.6808157, 0.1857282, 0.6119044, 0.4352941, 0, 1, 1,
0.6817387, -0.4872937, 2.189711, 0.4392157, 0, 1, 1,
0.6823404, -1.133539, 2.895328, 0.4470588, 0, 1, 1,
0.6903371, 1.135393, -0.2728872, 0.4509804, 0, 1, 1,
0.7034031, 0.2611382, 1.598646, 0.4588235, 0, 1, 1,
0.7051415, -0.4707088, 2.220515, 0.4627451, 0, 1, 1,
0.706419, 0.8097653, 0.4905609, 0.4705882, 0, 1, 1,
0.7071161, -0.733877, 3.071779, 0.4745098, 0, 1, 1,
0.709622, -1.752556, 2.050388, 0.4823529, 0, 1, 1,
0.7131702, -1.477413, 2.689481, 0.4862745, 0, 1, 1,
0.7138201, 0.07519141, 2.16868, 0.4941176, 0, 1, 1,
0.723315, -2.691072, 2.103832, 0.5019608, 0, 1, 1,
0.7258319, -0.2907839, 2.668356, 0.5058824, 0, 1, 1,
0.7335551, -1.330014, 2.83145, 0.5137255, 0, 1, 1,
0.7362824, 0.3647072, 1.983932, 0.5176471, 0, 1, 1,
0.7414278, 0.3276592, 1.50791, 0.5254902, 0, 1, 1,
0.7432728, 1.549828, -0.2524078, 0.5294118, 0, 1, 1,
0.7459822, -0.6881024, 1.984161, 0.5372549, 0, 1, 1,
0.7539354, 1.041071, -1.216619, 0.5411765, 0, 1, 1,
0.7561803, 0.5767052, -0.07065204, 0.5490196, 0, 1, 1,
0.7570723, 1.171577, -0.2038687, 0.5529412, 0, 1, 1,
0.7574557, -0.06578393, 2.591376, 0.5607843, 0, 1, 1,
0.7579166, -0.02560824, 1.661965, 0.5647059, 0, 1, 1,
0.7594578, -0.4248383, 1.949071, 0.572549, 0, 1, 1,
0.7664442, -0.8277705, 1.139911, 0.5764706, 0, 1, 1,
0.7678092, 0.1458133, 1.512251, 0.5843138, 0, 1, 1,
0.7690908, -0.8826664, 1.929695, 0.5882353, 0, 1, 1,
0.771307, -0.8432935, 5.1295, 0.5960785, 0, 1, 1,
0.7715139, 0.636311, 0.0827842, 0.6039216, 0, 1, 1,
0.7751541, -0.1378192, 1.094055, 0.6078432, 0, 1, 1,
0.7771446, -0.986688, 3.135048, 0.6156863, 0, 1, 1,
0.7777524, 0.135536, 0.3879198, 0.6196079, 0, 1, 1,
0.779608, -0.3544425, 1.714633, 0.627451, 0, 1, 1,
0.7819069, 1.237875, -0.2810434, 0.6313726, 0, 1, 1,
0.7847927, -1.094403, 1.825738, 0.6392157, 0, 1, 1,
0.7939779, -0.1067469, 0.5753899, 0.6431373, 0, 1, 1,
0.7984527, 0.5660309, 1.77399, 0.6509804, 0, 1, 1,
0.8030272, -0.5578026, 2.266927, 0.654902, 0, 1, 1,
0.8037021, 0.06656168, 0.8143842, 0.6627451, 0, 1, 1,
0.8050428, 0.8386852, 0.1807159, 0.6666667, 0, 1, 1,
0.8074237, -1.120821, 1.427397, 0.6745098, 0, 1, 1,
0.8129549, 1.503983, -0.01158075, 0.6784314, 0, 1, 1,
0.8220187, 1.573955, -1.122474, 0.6862745, 0, 1, 1,
0.8234477, -0.7079711, 1.881279, 0.6901961, 0, 1, 1,
0.8262125, 0.03342949, 0.5620459, 0.6980392, 0, 1, 1,
0.8262559, 0.2940044, 1.916848, 0.7058824, 0, 1, 1,
0.8314565, 0.437354, 2.292209, 0.7098039, 0, 1, 1,
0.8323751, -0.2523576, 1.343395, 0.7176471, 0, 1, 1,
0.8336619, 1.033887, 0.2590561, 0.7215686, 0, 1, 1,
0.8345952, 1.160776, 1.165327, 0.7294118, 0, 1, 1,
0.8347105, 0.5923423, 0.4020404, 0.7333333, 0, 1, 1,
0.8360714, 1.730946, -1.149194, 0.7411765, 0, 1, 1,
0.842222, 0.5608963, 0.6257765, 0.7450981, 0, 1, 1,
0.844256, 1.491297, -0.5131524, 0.7529412, 0, 1, 1,
0.8442932, 2.242803, -0.04092037, 0.7568628, 0, 1, 1,
0.8474944, -0.5174317, 1.733274, 0.7647059, 0, 1, 1,
0.8521003, 0.123995, 1.070195, 0.7686275, 0, 1, 1,
0.8593107, -1.424575, 0.7910581, 0.7764706, 0, 1, 1,
0.8612241, -1.401815, 4.173307, 0.7803922, 0, 1, 1,
0.8627242, -0.2256688, 1.492425, 0.7882353, 0, 1, 1,
0.8669712, -1.704847, 0.759221, 0.7921569, 0, 1, 1,
0.8715529, -1.279541, 3.282416, 0.8, 0, 1, 1,
0.8717104, -0.7381858, 3.252716, 0.8078431, 0, 1, 1,
0.8729376, 1.988175, -1.066291, 0.8117647, 0, 1, 1,
0.8809023, -0.3554342, 0.1925881, 0.8196079, 0, 1, 1,
0.88756, -0.4918933, 0.8428835, 0.8235294, 0, 1, 1,
0.8997554, 0.5267048, -2.567375, 0.8313726, 0, 1, 1,
0.903734, 0.6665543, -0.802931, 0.8352941, 0, 1, 1,
0.9038429, 0.5819679, 1.243387, 0.8431373, 0, 1, 1,
0.9049394, 0.2562019, 1.728193, 0.8470588, 0, 1, 1,
0.905574, -1.514631, 2.14486, 0.854902, 0, 1, 1,
0.9081193, -0.108103, 3.154199, 0.8588235, 0, 1, 1,
0.9121444, -0.2583872, 2.008818, 0.8666667, 0, 1, 1,
0.9162357, -0.3970366, 2.1501, 0.8705882, 0, 1, 1,
0.9187765, 0.3494578, 1.657217, 0.8784314, 0, 1, 1,
0.9260051, -0.04768505, 0.6176799, 0.8823529, 0, 1, 1,
0.937484, 0.5155364, 1.872899, 0.8901961, 0, 1, 1,
0.9391968, -1.25012, 2.030219, 0.8941177, 0, 1, 1,
0.9420754, -1.120306, 0.9778464, 0.9019608, 0, 1, 1,
0.9425102, 1.007179, 1.856537, 0.9098039, 0, 1, 1,
0.9475732, -0.002448282, 0.8342606, 0.9137255, 0, 1, 1,
0.9484561, -1.254833, 3.188885, 0.9215686, 0, 1, 1,
0.9519213, -0.8077955, 2.208301, 0.9254902, 0, 1, 1,
0.952027, -0.07458339, 1.726652, 0.9333333, 0, 1, 1,
0.9594313, -1.106953, 2.19259, 0.9372549, 0, 1, 1,
0.9669774, 1.859605, 1.583498, 0.945098, 0, 1, 1,
0.9672566, 0.2498816, 2.006202, 0.9490196, 0, 1, 1,
0.968705, -0.1050979, 1.80159, 0.9568627, 0, 1, 1,
0.9697487, -0.03592412, -1.085927, 0.9607843, 0, 1, 1,
0.9832873, 1.094938, 0.6311229, 0.9686275, 0, 1, 1,
0.9862286, 1.478655, 0.7739137, 0.972549, 0, 1, 1,
0.986455, -1.024434, 2.745676, 0.9803922, 0, 1, 1,
0.9903539, 1.262731, 1.092827, 0.9843137, 0, 1, 1,
0.996489, 0.9535648, 1.241789, 0.9921569, 0, 1, 1,
0.9973375, -0.9882478, 4.646755, 0.9960784, 0, 1, 1,
0.9977405, -0.3587253, 2.703072, 1, 0, 0.9960784, 1,
0.9995588, -0.7091343, 3.81594, 1, 0, 0.9882353, 1,
1.001005, -0.5508066, 3.113147, 1, 0, 0.9843137, 1,
1.015069, 1.931484, -1.465387, 1, 0, 0.9764706, 1,
1.02038, 0.07759349, 1.98964, 1, 0, 0.972549, 1,
1.02548, 0.03694651, 1.112745, 1, 0, 0.9647059, 1,
1.03063, -1.400709, 2.466629, 1, 0, 0.9607843, 1,
1.033621, -0.5510162, 1.485478, 1, 0, 0.9529412, 1,
1.034992, 0.0284314, 1.986909, 1, 0, 0.9490196, 1,
1.036253, -0.4399418, 1.725363, 1, 0, 0.9411765, 1,
1.038839, -1.547801, 3.13009, 1, 0, 0.9372549, 1,
1.047115, 0.03767883, 2.177285, 1, 0, 0.9294118, 1,
1.052341, -0.2263978, 2.197889, 1, 0, 0.9254902, 1,
1.052652, 1.346878, 0.6104425, 1, 0, 0.9176471, 1,
1.057599, -0.978605, 1.696354, 1, 0, 0.9137255, 1,
1.06131, 1.87833, 0.7271876, 1, 0, 0.9058824, 1,
1.061549, 0.2671207, 2.587275, 1, 0, 0.9019608, 1,
1.066156, -1.25617, 3.151609, 1, 0, 0.8941177, 1,
1.068173, -0.9336, 2.048299, 1, 0, 0.8862745, 1,
1.074046, -1.1159, 0.5105432, 1, 0, 0.8823529, 1,
1.07718, 0.5414153, 1.862905, 1, 0, 0.8745098, 1,
1.078115, 0.7429416, 0.7121758, 1, 0, 0.8705882, 1,
1.093832, -1.25438, 2.063833, 1, 0, 0.8627451, 1,
1.096, -1.684348, 4.049709, 1, 0, 0.8588235, 1,
1.098083, -0.4354371, 1.4185, 1, 0, 0.8509804, 1,
1.098832, 2.300092, 0.7703285, 1, 0, 0.8470588, 1,
1.098946, -2.320354, 2.4723, 1, 0, 0.8392157, 1,
1.099689, 0.1160377, 1.638287, 1, 0, 0.8352941, 1,
1.11982, 1.716986, 1.3243, 1, 0, 0.827451, 1,
1.120315, 0.5394325, 0.5741363, 1, 0, 0.8235294, 1,
1.134947, -0.01545971, 1.134504, 1, 0, 0.8156863, 1,
1.138213, -1.012153, 2.951674, 1, 0, 0.8117647, 1,
1.138639, -0.04538275, 1.560235, 1, 0, 0.8039216, 1,
1.138788, 1.264777, 1.494951, 1, 0, 0.7960784, 1,
1.138944, -1.076375, 2.166274, 1, 0, 0.7921569, 1,
1.139488, 1.505675, 0.2067479, 1, 0, 0.7843137, 1,
1.143837, 0.6086219, 1.429699, 1, 0, 0.7803922, 1,
1.151618, 0.870989, 1.277814, 1, 0, 0.772549, 1,
1.16861, -0.6607141, 3.533886, 1, 0, 0.7686275, 1,
1.170706, -0.6850368, 1.292405, 1, 0, 0.7607843, 1,
1.175946, -1.453004, 3.11833, 1, 0, 0.7568628, 1,
1.182797, 2.344392, -0.0117377, 1, 0, 0.7490196, 1,
1.183782, -1.748125, 0.8145663, 1, 0, 0.7450981, 1,
1.199268, 1.353007, 1.183382, 1, 0, 0.7372549, 1,
1.207583, 0.560524, 1.031812, 1, 0, 0.7333333, 1,
1.215803, 0.9942718, -0.3619007, 1, 0, 0.7254902, 1,
1.218365, 1.56822, 0.3866759, 1, 0, 0.7215686, 1,
1.222155, -0.4091553, 2.274749, 1, 0, 0.7137255, 1,
1.225417, -0.1231734, 0.8193326, 1, 0, 0.7098039, 1,
1.228581, 0.3105746, 0.260957, 1, 0, 0.7019608, 1,
1.231682, -1.026767, 2.84661, 1, 0, 0.6941177, 1,
1.24649, 1.740932, -0.4949566, 1, 0, 0.6901961, 1,
1.246942, 0.6488804, 0.8762242, 1, 0, 0.682353, 1,
1.255063, -0.009323031, 0.4841292, 1, 0, 0.6784314, 1,
1.25609, 1.057436, 1.724361, 1, 0, 0.6705883, 1,
1.261402, -0.01214775, 3.333941, 1, 0, 0.6666667, 1,
1.265822, -0.0224954, 2.448044, 1, 0, 0.6588235, 1,
1.270589, 1.156793, 0.89125, 1, 0, 0.654902, 1,
1.277765, 0.3647765, 0.5740554, 1, 0, 0.6470588, 1,
1.282165, 0.7673011, 1.059784, 1, 0, 0.6431373, 1,
1.30513, 1.761748, 1.223266, 1, 0, 0.6352941, 1,
1.307615, -0.7929952, 0.9476111, 1, 0, 0.6313726, 1,
1.312314, -0.6999879, 1.761708, 1, 0, 0.6235294, 1,
1.312356, 1.518552, 0.5516285, 1, 0, 0.6196079, 1,
1.312809, 0.2730447, 2.859565, 1, 0, 0.6117647, 1,
1.318841, -0.4212024, 3.608144, 1, 0, 0.6078432, 1,
1.324441, 0.164413, 2.147038, 1, 0, 0.6, 1,
1.329568, 1.167338, 0.490357, 1, 0, 0.5921569, 1,
1.329883, 0.5685661, 1.943533, 1, 0, 0.5882353, 1,
1.33385, 1.692041, 1.852639, 1, 0, 0.5803922, 1,
1.335381, -1.363726, 3.594862, 1, 0, 0.5764706, 1,
1.336616, 2.340198, 0.8435771, 1, 0, 0.5686275, 1,
1.339399, -1.367942, 2.1913, 1, 0, 0.5647059, 1,
1.343157, -0.7049475, 2.283967, 1, 0, 0.5568628, 1,
1.348876, 0.6279708, 1.071094, 1, 0, 0.5529412, 1,
1.354162, -0.5490569, 3.013678, 1, 0, 0.5450981, 1,
1.369578, 1.335765, -0.6008556, 1, 0, 0.5411765, 1,
1.37162, 1.141071, 0.428892, 1, 0, 0.5333334, 1,
1.372901, -1.304125, 1.865428, 1, 0, 0.5294118, 1,
1.399958, 0.6767812, 0.6841223, 1, 0, 0.5215687, 1,
1.411436, -1.142555, 1.911894, 1, 0, 0.5176471, 1,
1.412138, -1.527066, 1.306294, 1, 0, 0.509804, 1,
1.419768, 0.8708155, -0.2314814, 1, 0, 0.5058824, 1,
1.434327, 0.8754972, -0.9124933, 1, 0, 0.4980392, 1,
1.437308, -0.3372466, 1.142074, 1, 0, 0.4901961, 1,
1.438942, 0.3832862, 1.141479, 1, 0, 0.4862745, 1,
1.441888, 0.04745116, 1.326768, 1, 0, 0.4784314, 1,
1.443908, 1.23812, 0.6349415, 1, 0, 0.4745098, 1,
1.44499, 1.217455, -0.3418759, 1, 0, 0.4666667, 1,
1.450345, -1.158954, 2.392474, 1, 0, 0.4627451, 1,
1.453962, -0.398364, 2.333874, 1, 0, 0.454902, 1,
1.459469, -0.7820661, 1.511175, 1, 0, 0.4509804, 1,
1.489093, -1.447554, 1.980723, 1, 0, 0.4431373, 1,
1.506072, 0.4156767, 2.605196, 1, 0, 0.4392157, 1,
1.510137, 0.2174004, 0.4754336, 1, 0, 0.4313726, 1,
1.512159, 1.739764, -0.4989685, 1, 0, 0.427451, 1,
1.512303, -0.7512549, 0.6227008, 1, 0, 0.4196078, 1,
1.516681, -0.7907277, 4.220802, 1, 0, 0.4156863, 1,
1.52367, 0.1860682, 0.9027213, 1, 0, 0.4078431, 1,
1.543729, -0.6893939, 2.805778, 1, 0, 0.4039216, 1,
1.55736, -0.7599748, 2.647092, 1, 0, 0.3960784, 1,
1.562675, 0.4747718, 1.705657, 1, 0, 0.3882353, 1,
1.569359, -0.925207, 2.718971, 1, 0, 0.3843137, 1,
1.595236, -1.975308, 2.20732, 1, 0, 0.3764706, 1,
1.601393, 0.1295357, 0.7525812, 1, 0, 0.372549, 1,
1.608025, 0.3628137, 0.4042361, 1, 0, 0.3647059, 1,
1.629863, -1.768901, 3.129186, 1, 0, 0.3607843, 1,
1.642969, -0.7714052, 1.382764, 1, 0, 0.3529412, 1,
1.644138, -1.940206, 2.781613, 1, 0, 0.3490196, 1,
1.649732, -1.327829, 3.212101, 1, 0, 0.3411765, 1,
1.651967, 0.006076793, 1.290503, 1, 0, 0.3372549, 1,
1.655034, 0.7584031, 1.970527, 1, 0, 0.3294118, 1,
1.658636, 0.5788067, 0.6284195, 1, 0, 0.3254902, 1,
1.677911, -1.594555, 2.96945, 1, 0, 0.3176471, 1,
1.685462, -0.1181135, 0.7284067, 1, 0, 0.3137255, 1,
1.685974, -0.2997971, 1.18352, 1, 0, 0.3058824, 1,
1.698278, -0.5494297, 2.245159, 1, 0, 0.2980392, 1,
1.701485, 0.560255, 0.5356378, 1, 0, 0.2941177, 1,
1.704463, -2.175698, 1.361469, 1, 0, 0.2862745, 1,
1.729123, 0.43552, 2.718078, 1, 0, 0.282353, 1,
1.730865, 0.1524735, 0.483082, 1, 0, 0.2745098, 1,
1.738179, 1.974133, 3.330624, 1, 0, 0.2705882, 1,
1.745791, -0.9382824, 1.207218, 1, 0, 0.2627451, 1,
1.747474, -0.7781956, 1.685355, 1, 0, 0.2588235, 1,
1.750645, 0.5321245, 2.931319, 1, 0, 0.2509804, 1,
1.780352, -0.02929874, 3.045714, 1, 0, 0.2470588, 1,
1.786442, -0.7418502, 0.9031308, 1, 0, 0.2392157, 1,
1.796231, -0.4210434, 2.821467, 1, 0, 0.2352941, 1,
1.799267, -1.005027, 2.417306, 1, 0, 0.227451, 1,
1.804012, -0.3232171, 1.968805, 1, 0, 0.2235294, 1,
1.808005, 0.4367113, 1.929417, 1, 0, 0.2156863, 1,
1.814631, -1.186249, 2.524484, 1, 0, 0.2117647, 1,
1.814737, -0.3663654, 1.638162, 1, 0, 0.2039216, 1,
1.897553, -1.306555, 3.86616, 1, 0, 0.1960784, 1,
1.899619, -0.6368818, 1.744821, 1, 0, 0.1921569, 1,
1.909951, 0.2300832, 3.643042, 1, 0, 0.1843137, 1,
1.928748, 0.4855369, -0.03671654, 1, 0, 0.1803922, 1,
1.932673, -1.672099, 1.610924, 1, 0, 0.172549, 1,
1.937317, -1.030963, 3.440496, 1, 0, 0.1686275, 1,
1.997834, -0.1484984, 1.107958, 1, 0, 0.1607843, 1,
2.015511, -0.4211956, 2.46411, 1, 0, 0.1568628, 1,
2.027114, -0.3610254, 1.549227, 1, 0, 0.1490196, 1,
2.037271, -0.7689714, 3.800905, 1, 0, 0.145098, 1,
2.043493, 0.1899243, 1.931136, 1, 0, 0.1372549, 1,
2.043823, -1.05269, 1.872926, 1, 0, 0.1333333, 1,
2.082163, -0.4717652, 1.45598, 1, 0, 0.1254902, 1,
2.085018, -0.187885, -0.3184095, 1, 0, 0.1215686, 1,
2.112963, -0.2992707, 1.859547, 1, 0, 0.1137255, 1,
2.115793, -0.9225141, 3.126697, 1, 0, 0.1098039, 1,
2.138097, 0.4444674, 0.4119571, 1, 0, 0.1019608, 1,
2.204595, 0.7880708, 3.677614, 1, 0, 0.09411765, 1,
2.212264, 0.5537736, 2.33661, 1, 0, 0.09019608, 1,
2.222355, -1.069827, 2.861464, 1, 0, 0.08235294, 1,
2.281389, -1.351522, 1.731179, 1, 0, 0.07843138, 1,
2.286234, 0.1824784, 1.528048, 1, 0, 0.07058824, 1,
2.290842, -0.9064569, 3.527909, 1, 0, 0.06666667, 1,
2.323257, 0.5403027, 0.1448831, 1, 0, 0.05882353, 1,
2.32792, 1.378025, -0.1285337, 1, 0, 0.05490196, 1,
2.362532, -0.07353183, -0.000592319, 1, 0, 0.04705882, 1,
2.405874, -0.9272143, 2.638716, 1, 0, 0.04313726, 1,
2.418159, -0.1471791, 0.04465131, 1, 0, 0.03529412, 1,
2.503792, 1.208173, 2.749338, 1, 0, 0.03137255, 1,
2.588423, 0.9796739, 0.1918711, 1, 0, 0.02352941, 1,
2.674619, -1.80827, 1.75223, 1, 0, 0.01960784, 1,
2.675995, -0.6866227, 2.086628, 1, 0, 0.01176471, 1,
3.129823, 0.5014298, 0.981078, 1, 0, 0.007843138, 1
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
0.1530104, -3.722624, -7.28443, 0, -0.5, 0.5, 0.5,
0.1530104, -3.722624, -7.28443, 1, -0.5, 0.5, 0.5,
0.1530104, -3.722624, -7.28443, 1, 1.5, 0.5, 0.5,
0.1530104, -3.722624, -7.28443, 0, 1.5, 0.5, 0.5
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
-3.832941, 0.344321, -7.28443, 0, -0.5, 0.5, 0.5,
-3.832941, 0.344321, -7.28443, 1, -0.5, 0.5, 0.5,
-3.832941, 0.344321, -7.28443, 1, 1.5, 0.5, 0.5,
-3.832941, 0.344321, -7.28443, 0, 1.5, 0.5, 0.5
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
-3.832941, -3.722624, 0.2751625, 0, -0.5, 0.5, 0.5,
-3.832941, -3.722624, 0.2751625, 1, -0.5, 0.5, 0.5,
-3.832941, -3.722624, 0.2751625, 1, 1.5, 0.5, 0.5,
-3.832941, -3.722624, 0.2751625, 0, 1.5, 0.5, 0.5
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
-2, -2.784098, -5.539908,
3, -2.784098, -5.539908,
-2, -2.784098, -5.539908,
-2, -2.940519, -5.830662,
-1, -2.784098, -5.539908,
-1, -2.940519, -5.830662,
0, -2.784098, -5.539908,
0, -2.940519, -5.830662,
1, -2.784098, -5.539908,
1, -2.940519, -5.830662,
2, -2.784098, -5.539908,
2, -2.940519, -5.830662,
3, -2.784098, -5.539908,
3, -2.940519, -5.830662
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
-2, -3.253361, -6.412169, 0, -0.5, 0.5, 0.5,
-2, -3.253361, -6.412169, 1, -0.5, 0.5, 0.5,
-2, -3.253361, -6.412169, 1, 1.5, 0.5, 0.5,
-2, -3.253361, -6.412169, 0, 1.5, 0.5, 0.5,
-1, -3.253361, -6.412169, 0, -0.5, 0.5, 0.5,
-1, -3.253361, -6.412169, 1, -0.5, 0.5, 0.5,
-1, -3.253361, -6.412169, 1, 1.5, 0.5, 0.5,
-1, -3.253361, -6.412169, 0, 1.5, 0.5, 0.5,
0, -3.253361, -6.412169, 0, -0.5, 0.5, 0.5,
0, -3.253361, -6.412169, 1, -0.5, 0.5, 0.5,
0, -3.253361, -6.412169, 1, 1.5, 0.5, 0.5,
0, -3.253361, -6.412169, 0, 1.5, 0.5, 0.5,
1, -3.253361, -6.412169, 0, -0.5, 0.5, 0.5,
1, -3.253361, -6.412169, 1, -0.5, 0.5, 0.5,
1, -3.253361, -6.412169, 1, 1.5, 0.5, 0.5,
1, -3.253361, -6.412169, 0, 1.5, 0.5, 0.5,
2, -3.253361, -6.412169, 0, -0.5, 0.5, 0.5,
2, -3.253361, -6.412169, 1, -0.5, 0.5, 0.5,
2, -3.253361, -6.412169, 1, 1.5, 0.5, 0.5,
2, -3.253361, -6.412169, 0, 1.5, 0.5, 0.5,
3, -3.253361, -6.412169, 0, -0.5, 0.5, 0.5,
3, -3.253361, -6.412169, 1, -0.5, 0.5, 0.5,
3, -3.253361, -6.412169, 1, 1.5, 0.5, 0.5,
3, -3.253361, -6.412169, 0, 1.5, 0.5, 0.5
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
-2.913106, -2, -5.539908,
-2.913106, 3, -5.539908,
-2.913106, -2, -5.539908,
-3.066412, -2, -5.830662,
-2.913106, -1, -5.539908,
-3.066412, -1, -5.830662,
-2.913106, 0, -5.539908,
-3.066412, 0, -5.830662,
-2.913106, 1, -5.539908,
-3.066412, 1, -5.830662,
-2.913106, 2, -5.539908,
-3.066412, 2, -5.830662,
-2.913106, 3, -5.539908,
-3.066412, 3, -5.830662
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
-3.373024, -2, -6.412169, 0, -0.5, 0.5, 0.5,
-3.373024, -2, -6.412169, 1, -0.5, 0.5, 0.5,
-3.373024, -2, -6.412169, 1, 1.5, 0.5, 0.5,
-3.373024, -2, -6.412169, 0, 1.5, 0.5, 0.5,
-3.373024, -1, -6.412169, 0, -0.5, 0.5, 0.5,
-3.373024, -1, -6.412169, 1, -0.5, 0.5, 0.5,
-3.373024, -1, -6.412169, 1, 1.5, 0.5, 0.5,
-3.373024, -1, -6.412169, 0, 1.5, 0.5, 0.5,
-3.373024, 0, -6.412169, 0, -0.5, 0.5, 0.5,
-3.373024, 0, -6.412169, 1, -0.5, 0.5, 0.5,
-3.373024, 0, -6.412169, 1, 1.5, 0.5, 0.5,
-3.373024, 0, -6.412169, 0, 1.5, 0.5, 0.5,
-3.373024, 1, -6.412169, 0, -0.5, 0.5, 0.5,
-3.373024, 1, -6.412169, 1, -0.5, 0.5, 0.5,
-3.373024, 1, -6.412169, 1, 1.5, 0.5, 0.5,
-3.373024, 1, -6.412169, 0, 1.5, 0.5, 0.5,
-3.373024, 2, -6.412169, 0, -0.5, 0.5, 0.5,
-3.373024, 2, -6.412169, 1, -0.5, 0.5, 0.5,
-3.373024, 2, -6.412169, 1, 1.5, 0.5, 0.5,
-3.373024, 2, -6.412169, 0, 1.5, 0.5, 0.5,
-3.373024, 3, -6.412169, 0, -0.5, 0.5, 0.5,
-3.373024, 3, -6.412169, 1, -0.5, 0.5, 0.5,
-3.373024, 3, -6.412169, 1, 1.5, 0.5, 0.5,
-3.373024, 3, -6.412169, 0, 1.5, 0.5, 0.5
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
-2.913106, -2.784098, -4,
-2.913106, -2.784098, 4,
-2.913106, -2.784098, -4,
-3.066412, -2.940519, -4,
-2.913106, -2.784098, -2,
-3.066412, -2.940519, -2,
-2.913106, -2.784098, 0,
-3.066412, -2.940519, 0,
-2.913106, -2.784098, 2,
-3.066412, -2.940519, 2,
-2.913106, -2.784098, 4,
-3.066412, -2.940519, 4
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
-3.373024, -3.253361, -4, 0, -0.5, 0.5, 0.5,
-3.373024, -3.253361, -4, 1, -0.5, 0.5, 0.5,
-3.373024, -3.253361, -4, 1, 1.5, 0.5, 0.5,
-3.373024, -3.253361, -4, 0, 1.5, 0.5, 0.5,
-3.373024, -3.253361, -2, 0, -0.5, 0.5, 0.5,
-3.373024, -3.253361, -2, 1, -0.5, 0.5, 0.5,
-3.373024, -3.253361, -2, 1, 1.5, 0.5, 0.5,
-3.373024, -3.253361, -2, 0, 1.5, 0.5, 0.5,
-3.373024, -3.253361, 0, 0, -0.5, 0.5, 0.5,
-3.373024, -3.253361, 0, 1, -0.5, 0.5, 0.5,
-3.373024, -3.253361, 0, 1, 1.5, 0.5, 0.5,
-3.373024, -3.253361, 0, 0, 1.5, 0.5, 0.5,
-3.373024, -3.253361, 2, 0, -0.5, 0.5, 0.5,
-3.373024, -3.253361, 2, 1, -0.5, 0.5, 0.5,
-3.373024, -3.253361, 2, 1, 1.5, 0.5, 0.5,
-3.373024, -3.253361, 2, 0, 1.5, 0.5, 0.5,
-3.373024, -3.253361, 4, 0, -0.5, 0.5, 0.5,
-3.373024, -3.253361, 4, 1, -0.5, 0.5, 0.5,
-3.373024, -3.253361, 4, 1, 1.5, 0.5, 0.5,
-3.373024, -3.253361, 4, 0, 1.5, 0.5, 0.5
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
-2.913106, -2.784098, -5.539908,
-2.913106, 3.47274, -5.539908,
-2.913106, -2.784098, 6.090233,
-2.913106, 3.47274, 6.090233,
-2.913106, -2.784098, -5.539908,
-2.913106, -2.784098, 6.090233,
-2.913106, 3.47274, -5.539908,
-2.913106, 3.47274, 6.090233,
-2.913106, -2.784098, -5.539908,
3.219127, -2.784098, -5.539908,
-2.913106, -2.784098, 6.090233,
3.219127, -2.784098, 6.090233,
-2.913106, 3.47274, -5.539908,
3.219127, 3.47274, -5.539908,
-2.913106, 3.47274, 6.090233,
3.219127, 3.47274, 6.090233,
3.219127, -2.784098, -5.539908,
3.219127, 3.47274, -5.539908,
3.219127, -2.784098, 6.090233,
3.219127, 3.47274, 6.090233,
3.219127, -2.784098, -5.539908,
3.219127, -2.784098, 6.090233,
3.219127, 3.47274, -5.539908,
3.219127, 3.47274, 6.090233
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
var radius = 7.775104;
var distance = 34.59232;
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
mvMatrix.translate( -0.1530104, -0.344321, -0.2751625 );
mvMatrix.scale( 1.370886, 1.343585, 0.7228283 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.59232);
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
abate<-read.table("abate.xyz")
```

```
## Error in read.table("abate.xyz"): no lines available in input
```

```r
x<-abate$V2
```

```
## Error in eval(expr, envir, enclos): object 'abate' not found
```

```r
y<-abate$V3
```

```
## Error in eval(expr, envir, enclos): object 'abate' not found
```

```r
z<-abate$V4
```

```
## Error in eval(expr, envir, enclos): object 'abate' not found
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
-2.823802, 0.6488955, -1.611113, 0, 0, 1, 1, 1,
-2.77304, -0.0925949, -1.731193, 1, 0, 0, 1, 1,
-2.576482, -2.088583, -3.070052, 1, 0, 0, 1, 1,
-2.522135, -1.357398, -3.016492, 1, 0, 0, 1, 1,
-2.409739, -1.792716, -3.839102, 1, 0, 0, 1, 1,
-2.371685, -0.6046277, -3.75548, 1, 0, 0, 1, 1,
-2.352213, 0.942879, -1.503764, 0, 0, 0, 1, 1,
-2.349072, -0.8724328, -2.062134, 0, 0, 0, 1, 1,
-2.230958, 2.034636, -0.05978889, 0, 0, 0, 1, 1,
-2.22897, 1.915332, -0.3306397, 0, 0, 0, 1, 1,
-2.158426, -0.8722219, -1.772014, 0, 0, 0, 1, 1,
-2.150097, -1.054492, -2.454757, 0, 0, 0, 1, 1,
-2.072138, 0.4121364, -1.609845, 0, 0, 0, 1, 1,
-2.056068, 0.5410589, -3.749039, 1, 1, 1, 1, 1,
-2.041759, 0.1018432, -2.22298, 1, 1, 1, 1, 1,
-2.03578, 2.391904, -1.009297, 1, 1, 1, 1, 1,
-1.890444, -0.6599922, -1.852173, 1, 1, 1, 1, 1,
-1.884858, -0.9406939, -2.61768, 1, 1, 1, 1, 1,
-1.84553, 0.2261406, -1.839773, 1, 1, 1, 1, 1,
-1.839172, 0.8628086, -2.470911, 1, 1, 1, 1, 1,
-1.834086, 0.4258461, -2.505578, 1, 1, 1, 1, 1,
-1.797004, -0.02672726, -3.186725, 1, 1, 1, 1, 1,
-1.781575, 1.718549, -0.9567274, 1, 1, 1, 1, 1,
-1.770636, -0.7170473, -0.5424207, 1, 1, 1, 1, 1,
-1.768501, -0.1914523, -1.041521, 1, 1, 1, 1, 1,
-1.763017, 0.1145408, -0.8271324, 1, 1, 1, 1, 1,
-1.752715, -0.3708961, -1.592505, 1, 1, 1, 1, 1,
-1.723431, -0.4545647, -0.4832007, 1, 1, 1, 1, 1,
-1.708022, -0.0610649, -1.95551, 0, 0, 1, 1, 1,
-1.706153, -1.38644, -3.461573, 1, 0, 0, 1, 1,
-1.701804, 0.8628641, -0.8872803, 1, 0, 0, 1, 1,
-1.696292, 0.3959748, -0.7700121, 1, 0, 0, 1, 1,
-1.692569, 0.3945107, -1.387491, 1, 0, 0, 1, 1,
-1.683064, 0.3572047, -1.695366, 1, 0, 0, 1, 1,
-1.677769, 0.1906695, -2.441063, 0, 0, 0, 1, 1,
-1.672536, -0.01735786, -0.8307743, 0, 0, 0, 1, 1,
-1.671122, 0.03154425, -1.65843, 0, 0, 0, 1, 1,
-1.658732, 0.03217985, -2.081665, 0, 0, 0, 1, 1,
-1.645831, 0.2132843, -1.584666, 0, 0, 0, 1, 1,
-1.639708, 1.111664, 0.115551, 0, 0, 0, 1, 1,
-1.63421, 0.7736101, -1.458834, 0, 0, 0, 1, 1,
-1.631326, 0.1986544, -0.9891526, 1, 1, 1, 1, 1,
-1.630837, 1.139403, 0.9520468, 1, 1, 1, 1, 1,
-1.630523, 1.308599, 0.05565669, 1, 1, 1, 1, 1,
-1.614962, -0.8804684, -2.610508, 1, 1, 1, 1, 1,
-1.607279, -0.322158, -2.192997, 1, 1, 1, 1, 1,
-1.591662, -0.06870021, -2.601276, 1, 1, 1, 1, 1,
-1.591139, 0.4622068, -0.8144079, 1, 1, 1, 1, 1,
-1.589898, -0.6106195, -1.610856, 1, 1, 1, 1, 1,
-1.577825, 2.305033, -0.3341743, 1, 1, 1, 1, 1,
-1.576604, 1.378716, -2.227535, 1, 1, 1, 1, 1,
-1.567734, -0.2074471, -3.072519, 1, 1, 1, 1, 1,
-1.557206, 1.215426, -1.249967, 1, 1, 1, 1, 1,
-1.554941, -1.688507, -2.533331, 1, 1, 1, 1, 1,
-1.554448, 1.471164, -0.2278865, 1, 1, 1, 1, 1,
-1.553416, -1.208929, -0.821182, 1, 1, 1, 1, 1,
-1.547512, -0.3653638, -0.9115855, 0, 0, 1, 1, 1,
-1.51677, 0.1533981, -1.831746, 1, 0, 0, 1, 1,
-1.50475, 0.8336938, -1.167618, 1, 0, 0, 1, 1,
-1.496883, 1.283325, -1.718395, 1, 0, 0, 1, 1,
-1.489957, 0.5230339, -1.970263, 1, 0, 0, 1, 1,
-1.482912, -0.147341, -2.339808, 1, 0, 0, 1, 1,
-1.468691, 0.2916279, -2.507907, 0, 0, 0, 1, 1,
-1.465612, -0.3933669, -0.6541982, 0, 0, 0, 1, 1,
-1.460401, -0.5078633, -0.6078652, 0, 0, 0, 1, 1,
-1.431464, -0.03009615, -0.3075645, 0, 0, 0, 1, 1,
-1.430093, -0.6749888, -3.179331, 0, 0, 0, 1, 1,
-1.4271, -0.5219212, -0.4723515, 0, 0, 0, 1, 1,
-1.425918, -0.1198362, -2.493932, 0, 0, 0, 1, 1,
-1.411672, -1.559547, -1.390611, 1, 1, 1, 1, 1,
-1.406464, -0.2837607, -1.862549, 1, 1, 1, 1, 1,
-1.386541, 1.661139, -0.2008708, 1, 1, 1, 1, 1,
-1.385297, 1.24556, -0.4534742, 1, 1, 1, 1, 1,
-1.381668, 1.166441, -0.9244625, 1, 1, 1, 1, 1,
-1.379261, 0.7459782, -1.271484, 1, 1, 1, 1, 1,
-1.373599, 1.484836, -1.051247, 1, 1, 1, 1, 1,
-1.369881, -0.5042877, -0.541854, 1, 1, 1, 1, 1,
-1.357427, 0.1558783, -1.369965, 1, 1, 1, 1, 1,
-1.355401, -1.197977, -0.7733987, 1, 1, 1, 1, 1,
-1.351171, -0.0196513, -1.7932, 1, 1, 1, 1, 1,
-1.343281, 1.167275, -1.005887, 1, 1, 1, 1, 1,
-1.332351, 0.7728208, -1.583092, 1, 1, 1, 1, 1,
-1.322607, 0.8218048, -2.307851, 1, 1, 1, 1, 1,
-1.317312, -0.4083791, -0.4246138, 1, 1, 1, 1, 1,
-1.315239, -0.2499742, -1.360744, 0, 0, 1, 1, 1,
-1.308246, 1.390438, 1.01373, 1, 0, 0, 1, 1,
-1.30631, -0.7555147, -0.6786228, 1, 0, 0, 1, 1,
-1.304467, 0.1351803, 0.1120893, 1, 0, 0, 1, 1,
-1.304425, -0.4049262, -2.124372, 1, 0, 0, 1, 1,
-1.303378, -0.8917038, -1.811193, 1, 0, 0, 1, 1,
-1.287911, 0.787653, -1.517093, 0, 0, 0, 1, 1,
-1.284071, 1.272421, -1.028403, 0, 0, 0, 1, 1,
-1.279659, 0.5349267, -1.159477, 0, 0, 0, 1, 1,
-1.268884, 1.146215, -1.789586, 0, 0, 0, 1, 1,
-1.264099, -0.6287884, -3.24256, 0, 0, 0, 1, 1,
-1.257923, -0.6086261, -2.262874, 0, 0, 0, 1, 1,
-1.253496, -0.9611452, -2.508263, 0, 0, 0, 1, 1,
-1.252515, -0.9593229, -1.311664, 1, 1, 1, 1, 1,
-1.252323, -1.587588, -1.829224, 1, 1, 1, 1, 1,
-1.248641, 0.3586412, -1.53166, 1, 1, 1, 1, 1,
-1.247946, 0.4099554, 1.089705, 1, 1, 1, 1, 1,
-1.247139, 0.3846877, -1.755225, 1, 1, 1, 1, 1,
-1.243694, 0.9961511, -1.134801, 1, 1, 1, 1, 1,
-1.23623, -0.3679777, -2.504331, 1, 1, 1, 1, 1,
-1.233511, -0.5938719, -1.723611, 1, 1, 1, 1, 1,
-1.230832, -0.5501919, 0.7177825, 1, 1, 1, 1, 1,
-1.224687, 1.729518, -0.1867317, 1, 1, 1, 1, 1,
-1.22272, -0.3369557, -0.6571099, 1, 1, 1, 1, 1,
-1.218784, 1.219234, -2.183373, 1, 1, 1, 1, 1,
-1.218478, -0.6012381, 0.3671527, 1, 1, 1, 1, 1,
-1.216524, -1.709744, -2.490292, 1, 1, 1, 1, 1,
-1.21459, -2.448826, -2.537305, 1, 1, 1, 1, 1,
-1.20486, -0.4819537, -2.68113, 0, 0, 1, 1, 1,
-1.200845, -1.579304, -3.741155, 1, 0, 0, 1, 1,
-1.199903, -0.1742433, -2.919121, 1, 0, 0, 1, 1,
-1.196106, -0.1907796, -2.99342, 1, 0, 0, 1, 1,
-1.170604, 2.306877, -0.343098, 1, 0, 0, 1, 1,
-1.162664, -0.4892614, -1.689008, 1, 0, 0, 1, 1,
-1.161193, -0.5078545, -2.215075, 0, 0, 0, 1, 1,
-1.156219, 0.07514744, -0.7428914, 0, 0, 0, 1, 1,
-1.149131, -0.5388163, -2.566562, 0, 0, 0, 1, 1,
-1.143928, 0.6696534, -0.793676, 0, 0, 0, 1, 1,
-1.140236, -0.4402117, -1.092541, 0, 0, 0, 1, 1,
-1.136429, -0.1353208, -1.777608, 0, 0, 0, 1, 1,
-1.134057, 0.5011016, -1.006961, 0, 0, 0, 1, 1,
-1.11506, 0.2369568, -1.599756, 1, 1, 1, 1, 1,
-1.111172, -0.5419174, -1.801684, 1, 1, 1, 1, 1,
-1.110743, -0.493136, -0.804731, 1, 1, 1, 1, 1,
-1.107731, 1.175655, -2.0746, 1, 1, 1, 1, 1,
-1.095955, -0.03986076, -2.984553, 1, 1, 1, 1, 1,
-1.09432, -0.9780131, -2.130016, 1, 1, 1, 1, 1,
-1.094031, -2.522996, -2.932512, 1, 1, 1, 1, 1,
-1.089643, -0.2545358, -1.91229, 1, 1, 1, 1, 1,
-1.077476, -1.297002, -3.493266, 1, 1, 1, 1, 1,
-1.074706, 0.6353152, 0.5894578, 1, 1, 1, 1, 1,
-1.068861, -2.268615, -2.558685, 1, 1, 1, 1, 1,
-1.06838, 1.901522, -0.7443354, 1, 1, 1, 1, 1,
-1.061615, 1.804776, 1.065077, 1, 1, 1, 1, 1,
-1.05792, 0.7893607, -2.032421, 1, 1, 1, 1, 1,
-1.05166, 1.164751, -1.09131, 1, 1, 1, 1, 1,
-1.050374, 0.2363306, -1.420642, 0, 0, 1, 1, 1,
-1.048395, 0.5424281, -2.410369, 1, 0, 0, 1, 1,
-1.047942, 0.1561143, 0.9238064, 1, 0, 0, 1, 1,
-1.045743, 1.045446, -0.1317762, 1, 0, 0, 1, 1,
-1.044909, -0.03648032, -1.907138, 1, 0, 0, 1, 1,
-1.042723, -1.654611, -3.723631, 1, 0, 0, 1, 1,
-1.042676, 0.7629898, 0.2511633, 0, 0, 0, 1, 1,
-1.039728, -1.260711, -1.276088, 0, 0, 0, 1, 1,
-1.038735, 0.3940248, -1.447211, 0, 0, 0, 1, 1,
-1.037988, 0.9885052, -0.4847779, 0, 0, 0, 1, 1,
-1.031933, 0.2443832, -0.9401233, 0, 0, 0, 1, 1,
-1.030851, 0.5865341, -0.03067469, 0, 0, 0, 1, 1,
-1.026684, 0.7973832, -1.246706, 0, 0, 0, 1, 1,
-1.022939, -1.312133, -1.609045, 1, 1, 1, 1, 1,
-1.020576, -0.1603853, -2.060076, 1, 1, 1, 1, 1,
-1.01718, 0.03309509, -2.3672, 1, 1, 1, 1, 1,
-1.015209, -0.1641738, -2.488751, 1, 1, 1, 1, 1,
-1.012089, 0.284404, -0.3481572, 1, 1, 1, 1, 1,
-1.011613, -1.700515, -2.925305, 1, 1, 1, 1, 1,
-1.009771, -2.326995, -1.778078, 1, 1, 1, 1, 1,
-1.008439, -0.6857759, -2.153417, 1, 1, 1, 1, 1,
-1.007872, 2.103966, 1.024511, 1, 1, 1, 1, 1,
-1.007264, -0.369936, -1.758898, 1, 1, 1, 1, 1,
-0.991795, 0.4398097, -0.793657, 1, 1, 1, 1, 1,
-0.9900555, -1.339437, -3.401818, 1, 1, 1, 1, 1,
-0.9888903, -1.029218, -1.319309, 1, 1, 1, 1, 1,
-0.9828894, 0.7208223, -0.353361, 1, 1, 1, 1, 1,
-0.9820766, 0.1352519, -0.7043799, 1, 1, 1, 1, 1,
-0.9819961, 0.3573644, -1.989248, 0, 0, 1, 1, 1,
-0.9811864, 1.334296, -0.8285542, 1, 0, 0, 1, 1,
-0.9791773, 0.2736924, -0.7110276, 1, 0, 0, 1, 1,
-0.9579248, -1.753506, -2.932462, 1, 0, 0, 1, 1,
-0.9510887, -0.7947679, -1.577597, 1, 0, 0, 1, 1,
-0.9503254, -0.8686805, -1.11053, 1, 0, 0, 1, 1,
-0.9462284, 1.836659, 0.2692336, 0, 0, 0, 1, 1,
-0.9450694, -0.5157675, -2.177807, 0, 0, 0, 1, 1,
-0.9424239, 0.3067235, -3.780465, 0, 0, 0, 1, 1,
-0.9373381, -0.02090592, -0.02556917, 0, 0, 0, 1, 1,
-0.9332196, 1.25419, -0.4322699, 0, 0, 0, 1, 1,
-0.9327865, 1.1962, -1.40936, 0, 0, 0, 1, 1,
-0.9305752, -0.152173, -2.513762, 0, 0, 0, 1, 1,
-0.9279461, 0.7930048, -1.496236, 1, 1, 1, 1, 1,
-0.9275014, -1.467616, -2.533001, 1, 1, 1, 1, 1,
-0.9217397, 0.6854289, -1.143734, 1, 1, 1, 1, 1,
-0.915637, 1.836797, -0.8925635, 1, 1, 1, 1, 1,
-0.9124013, 0.255697, -2.856358, 1, 1, 1, 1, 1,
-0.9102654, -0.9223979, -2.445587, 1, 1, 1, 1, 1,
-0.9068076, 1.10129, -0.8111183, 1, 1, 1, 1, 1,
-0.9049738, -0.7880222, -2.503437, 1, 1, 1, 1, 1,
-0.903426, 0.06645539, -0.5057536, 1, 1, 1, 1, 1,
-0.9018494, 2.346768, -0.4616641, 1, 1, 1, 1, 1,
-0.9003429, 0.6922781, -1.774812, 1, 1, 1, 1, 1,
-0.8987786, -0.8800947, -3.326504, 1, 1, 1, 1, 1,
-0.8953387, -0.3542645, -2.340077, 1, 1, 1, 1, 1,
-0.8892847, -0.1991672, -3.25058, 1, 1, 1, 1, 1,
-0.8891333, 0.5912185, -0.8842866, 1, 1, 1, 1, 1,
-0.8864949, -1.532646, -2.723025, 0, 0, 1, 1, 1,
-0.8780892, 0.6132984, -0.3235635, 1, 0, 0, 1, 1,
-0.8747547, -1.765134, -4.114635, 1, 0, 0, 1, 1,
-0.8731844, -0.3330845, -1.669988, 1, 0, 0, 1, 1,
-0.8719965, -2.05227, -4.383686, 1, 0, 0, 1, 1,
-0.8710471, -0.829054, -3.471148, 1, 0, 0, 1, 1,
-0.8643036, -0.1947651, -2.621255, 0, 0, 0, 1, 1,
-0.8611485, 1.858843, -0.09379306, 0, 0, 0, 1, 1,
-0.8602264, -0.2813236, -1.856016, 0, 0, 0, 1, 1,
-0.8581905, 0.02468804, -2.087288, 0, 0, 0, 1, 1,
-0.8562788, -0.7561452, -2.80734, 0, 0, 0, 1, 1,
-0.8555236, -1.732767, -1.764588, 0, 0, 0, 1, 1,
-0.8529563, 1.250353, -1.039046, 0, 0, 0, 1, 1,
-0.8481281, 1.538847, -1.132768, 1, 1, 1, 1, 1,
-0.8478234, 0.0636343, -1.084908, 1, 1, 1, 1, 1,
-0.847427, 0.4095773, 0.716342, 1, 1, 1, 1, 1,
-0.8467928, -0.1018967, -0.8651863, 1, 1, 1, 1, 1,
-0.8385841, 0.1224623, -2.674721, 1, 1, 1, 1, 1,
-0.8370176, 0.705879, -0.1936379, 1, 1, 1, 1, 1,
-0.8365104, -0.4685431, -2.416627, 1, 1, 1, 1, 1,
-0.8303822, 0.2036646, 0.1333506, 1, 1, 1, 1, 1,
-0.8277041, 1.992674, 0.8520082, 1, 1, 1, 1, 1,
-0.8272269, 1.39062, -0.5011157, 1, 1, 1, 1, 1,
-0.824539, -1.790252, -0.8769899, 1, 1, 1, 1, 1,
-0.8144042, -0.005160577, -1.427642, 1, 1, 1, 1, 1,
-0.8098981, -0.06967471, -2.040584, 1, 1, 1, 1, 1,
-0.8085256, -0.3886591, -1.907367, 1, 1, 1, 1, 1,
-0.7997105, -0.791038, -2.256953, 1, 1, 1, 1, 1,
-0.7993227, -1.596658, -4.11655, 0, 0, 1, 1, 1,
-0.7938868, 0.6516692, -0.9252928, 1, 0, 0, 1, 1,
-0.7905112, 0.3237637, -1.071709, 1, 0, 0, 1, 1,
-0.7875807, 0.354986, -0.5660186, 1, 0, 0, 1, 1,
-0.7844879, -2.02123, -3.182838, 1, 0, 0, 1, 1,
-0.7838982, -2.071566, -2.784925, 1, 0, 0, 1, 1,
-0.7820852, 0.1184045, -2.099951, 0, 0, 0, 1, 1,
-0.7792396, 1.738003, -0.1029561, 0, 0, 0, 1, 1,
-0.7780379, 0.4134842, -1.072715, 0, 0, 0, 1, 1,
-0.7760661, 2.176075, -0.9138739, 0, 0, 0, 1, 1,
-0.7662305, -1.459581, -3.158708, 0, 0, 0, 1, 1,
-0.766206, -0.1587957, -2.074112, 0, 0, 0, 1, 1,
-0.7646927, 1.051801, -1.488386, 0, 0, 0, 1, 1,
-0.7603865, 1.190218, -1.536019, 1, 1, 1, 1, 1,
-0.756881, 0.624565, 0.2221555, 1, 1, 1, 1, 1,
-0.7534749, 0.9139848, -0.6346229, 1, 1, 1, 1, 1,
-0.7512196, -0.4322026, -4.514346, 1, 1, 1, 1, 1,
-0.7460859, 0.05024201, -1.715163, 1, 1, 1, 1, 1,
-0.7455502, 1.817171, -1.834744, 1, 1, 1, 1, 1,
-0.7298014, -1.158995, -2.048963, 1, 1, 1, 1, 1,
-0.7289243, 0.3833763, -1.115539, 1, 1, 1, 1, 1,
-0.7265381, -0.1414941, -0.7090969, 1, 1, 1, 1, 1,
-0.7262221, 1.199581, -0.2839378, 1, 1, 1, 1, 1,
-0.7245113, 0.7323676, 0.6231928, 1, 1, 1, 1, 1,
-0.7180222, 0.6474416, -0.05939471, 1, 1, 1, 1, 1,
-0.7122835, 2.028464, 0.2759725, 1, 1, 1, 1, 1,
-0.7122525, 1.65122, -1.119982, 1, 1, 1, 1, 1,
-0.7094664, -0.03112401, -0.706341, 1, 1, 1, 1, 1,
-0.7082466, 0.09113891, -1.789197, 0, 0, 1, 1, 1,
-0.7042096, -1.808451, -1.771155, 1, 0, 0, 1, 1,
-0.7031771, -0.7030344, -3.875853, 1, 0, 0, 1, 1,
-0.7031428, 0.001841046, -3.658745, 1, 0, 0, 1, 1,
-0.701892, 0.2566159, -1.726922, 1, 0, 0, 1, 1,
-0.7017869, 0.8886843, 2.21602, 1, 0, 0, 1, 1,
-0.6999472, 2.029621, -0.7919903, 0, 0, 0, 1, 1,
-0.6972634, 0.1409926, -0.6430126, 0, 0, 0, 1, 1,
-0.6949773, -1.849903, -4.469399, 0, 0, 0, 1, 1,
-0.6943316, 0.3242502, -2.940445, 0, 0, 0, 1, 1,
-0.6927708, 0.3916773, 1.536278, 0, 0, 0, 1, 1,
-0.6917613, 1.088042, -0.6807066, 0, 0, 0, 1, 1,
-0.6903462, 0.2321282, -1.15556, 0, 0, 0, 1, 1,
-0.68894, 0.6971508, 0.1256459, 1, 1, 1, 1, 1,
-0.6865436, 0.2166047, 0.26322, 1, 1, 1, 1, 1,
-0.6863632, 0.2173419, -1.303189, 1, 1, 1, 1, 1,
-0.6858137, -0.07886653, -0.6115978, 1, 1, 1, 1, 1,
-0.6842473, -0.245601, -1.75802, 1, 1, 1, 1, 1,
-0.6802897, 0.8397328, -0.7296298, 1, 1, 1, 1, 1,
-0.6791604, -0.8999199, -1.926934, 1, 1, 1, 1, 1,
-0.675976, -0.104518, -0.2831755, 1, 1, 1, 1, 1,
-0.6723197, -0.933862, -0.990934, 1, 1, 1, 1, 1,
-0.6620617, 0.8406567, 0.1247045, 1, 1, 1, 1, 1,
-0.6556413, -1.324109, -3.841847, 1, 1, 1, 1, 1,
-0.6538572, 0.586774, -1.003386, 1, 1, 1, 1, 1,
-0.6524945, -0.1322573, -0.7599682, 1, 1, 1, 1, 1,
-0.6523164, -0.4078632, -2.046654, 1, 1, 1, 1, 1,
-0.6474465, 0.1835589, 0.2660933, 1, 1, 1, 1, 1,
-0.6419826, -0.2830879, -3.749389, 0, 0, 1, 1, 1,
-0.630174, -0.2686753, -1.227315, 1, 0, 0, 1, 1,
-0.6289941, 1.067725, 0.9037999, 1, 0, 0, 1, 1,
-0.6202821, -1.151074, -4.249462, 1, 0, 0, 1, 1,
-0.6139892, -0.04214226, 0.09720594, 1, 0, 0, 1, 1,
-0.6087611, 0.8086315, -0.5957486, 1, 0, 0, 1, 1,
-0.6037595, -0.725062, -2.598382, 0, 0, 0, 1, 1,
-0.6027579, -0.2725861, -2.168758, 0, 0, 0, 1, 1,
-0.600373, -0.3587151, -0.3645418, 0, 0, 0, 1, 1,
-0.5990536, 0.1272588, -1.360396, 0, 0, 0, 1, 1,
-0.5970572, -1.193715, -3.133412, 0, 0, 0, 1, 1,
-0.5932791, -0.1667685, -1.29803, 0, 0, 0, 1, 1,
-0.5861976, 0.5406304, -0.9659482, 0, 0, 0, 1, 1,
-0.5802813, -0.7132375, -3.96116, 1, 1, 1, 1, 1,
-0.5747718, -0.05983388, -1.879233, 1, 1, 1, 1, 1,
-0.56865, 0.5639063, 0.1069525, 1, 1, 1, 1, 1,
-0.5659947, 1.490343, 0.6407938, 1, 1, 1, 1, 1,
-0.5633563, -0.6000461, -1.540082, 1, 1, 1, 1, 1,
-0.5583254, -0.2141333, 0.1303729, 1, 1, 1, 1, 1,
-0.557641, -0.1137677, -1.579627, 1, 1, 1, 1, 1,
-0.5558916, 1.23723, -0.1598592, 1, 1, 1, 1, 1,
-0.5556212, 0.4315252, -1.036265, 1, 1, 1, 1, 1,
-0.5554652, 0.2945639, -0.2484628, 1, 1, 1, 1, 1,
-0.5549901, -0.546864, -2.958285, 1, 1, 1, 1, 1,
-0.5486131, -0.6975247, -2.740377, 1, 1, 1, 1, 1,
-0.5449883, -0.1473849, -0.7762251, 1, 1, 1, 1, 1,
-0.544102, -0.6241653, -1.401221, 1, 1, 1, 1, 1,
-0.5418313, 0.9062794, 1.099683, 1, 1, 1, 1, 1,
-0.5390458, 0.5067466, -1.62472, 0, 0, 1, 1, 1,
-0.5376304, -1.603255, -0.8541735, 1, 0, 0, 1, 1,
-0.5349451, -0.8188605, -2.708501, 1, 0, 0, 1, 1,
-0.534297, -0.8401802, -3.593229, 1, 0, 0, 1, 1,
-0.5305976, -1.168309, -2.712481, 1, 0, 0, 1, 1,
-0.519528, -0.1409141, -2.313287, 1, 0, 0, 1, 1,
-0.519282, 0.7622282, 0.07535362, 0, 0, 0, 1, 1,
-0.5168091, 0.7319621, 1.487394, 0, 0, 0, 1, 1,
-0.514811, -0.7810058, -0.8760403, 0, 0, 0, 1, 1,
-0.511591, -0.203773, -1.161039, 0, 0, 0, 1, 1,
-0.5063831, -0.2220111, -3.183211, 0, 0, 0, 1, 1,
-0.506269, 0.8260236, -1.988623, 0, 0, 0, 1, 1,
-0.5032463, -1.048242, -1.943151, 0, 0, 0, 1, 1,
-0.4996907, -0.6661257, -2.751675, 1, 1, 1, 1, 1,
-0.4996673, 0.3618708, -0.1475879, 1, 1, 1, 1, 1,
-0.4917835, -1.253665, -2.189058, 1, 1, 1, 1, 1,
-0.4914936, 0.02379585, -1.25445, 1, 1, 1, 1, 1,
-0.4879443, 1.708058, 1.310607, 1, 1, 1, 1, 1,
-0.4877717, 0.7572287, -0.14575, 1, 1, 1, 1, 1,
-0.4734362, -0.1217483, -2.32134, 1, 1, 1, 1, 1,
-0.4673394, 0.6461111, 0.9065711, 1, 1, 1, 1, 1,
-0.4654012, -0.9626113, -2.869641, 1, 1, 1, 1, 1,
-0.4639271, 1.532625, -1.585925, 1, 1, 1, 1, 1,
-0.4618923, -0.859579, -2.304734, 1, 1, 1, 1, 1,
-0.4592423, 0.2564058, -0.6362348, 1, 1, 1, 1, 1,
-0.4507119, -0.1114703, -2.174466, 1, 1, 1, 1, 1,
-0.4506875, 1.167702, 0.498457, 1, 1, 1, 1, 1,
-0.4463132, -0.4177303, -2.187717, 1, 1, 1, 1, 1,
-0.4462628, 0.1263932, -0.2405818, 0, 0, 1, 1, 1,
-0.4436445, 0.06422221, -1.495161, 1, 0, 0, 1, 1,
-0.4417845, -0.9671905, -3.059784, 1, 0, 0, 1, 1,
-0.4400912, 0.2674052, -1.282477, 1, 0, 0, 1, 1,
-0.4388926, -1.080438, -2.840325, 1, 0, 0, 1, 1,
-0.4308442, -0.06762426, -0.8519315, 1, 0, 0, 1, 1,
-0.4297359, -1.069927, -1.105598, 0, 0, 0, 1, 1,
-0.4279944, -2.199164, -3.382908, 0, 0, 0, 1, 1,
-0.4278812, 0.7497391, -2.42415, 0, 0, 0, 1, 1,
-0.4269544, 1.47311, 0.1890298, 0, 0, 0, 1, 1,
-0.41256, -2.312274, -1.654348, 0, 0, 0, 1, 1,
-0.4111377, 0.7117401, -0.887125, 0, 0, 0, 1, 1,
-0.4110123, 0.8399795, -0.832078, 0, 0, 0, 1, 1,
-0.3988456, 0.4427099, -1.490458, 1, 1, 1, 1, 1,
-0.3968899, 1.150487, -1.52289, 1, 1, 1, 1, 1,
-0.3902476, 1.511332, -0.3575173, 1, 1, 1, 1, 1,
-0.3893403, -0.5286362, -1.687809, 1, 1, 1, 1, 1,
-0.3871379, 0.2172239, -0.3112717, 1, 1, 1, 1, 1,
-0.3868294, 0.7507162, -2.49906, 1, 1, 1, 1, 1,
-0.3849692, -1.468078, -3.700631, 1, 1, 1, 1, 1,
-0.3828129, 0.4387582, -0.119893, 1, 1, 1, 1, 1,
-0.3825551, -1.404438, -3.47796, 1, 1, 1, 1, 1,
-0.3776489, -0.1151969, -2.577278, 1, 1, 1, 1, 1,
-0.3770773, -0.1642073, -1.253932, 1, 1, 1, 1, 1,
-0.3766593, 1.177761, -1.068323, 1, 1, 1, 1, 1,
-0.3745579, -2.224763, -0.8842982, 1, 1, 1, 1, 1,
-0.3726428, 0.02533249, -2.026471, 1, 1, 1, 1, 1,
-0.3723888, 0.2003744, -1.695085, 1, 1, 1, 1, 1,
-0.3651144, -1.18463, -2.909699, 0, 0, 1, 1, 1,
-0.3647094, -0.3075694, -0.7783101, 1, 0, 0, 1, 1,
-0.3640289, -0.09102449, -0.599805, 1, 0, 0, 1, 1,
-0.3634443, 0.9483881, 0.5924032, 1, 0, 0, 1, 1,
-0.3617135, -1.223084, -0.7463909, 1, 0, 0, 1, 1,
-0.3608864, -0.5144857, -0.739723, 1, 0, 0, 1, 1,
-0.3584891, 0.2371332, -0.6878526, 0, 0, 0, 1, 1,
-0.3574608, 0.7470107, 0.5464491, 0, 0, 0, 1, 1,
-0.3563859, 0.3071832, -2.093263, 0, 0, 0, 1, 1,
-0.3536757, 0.5898925, 1.830623, 0, 0, 0, 1, 1,
-0.3500921, -1.604748, -2.737064, 0, 0, 0, 1, 1,
-0.3480358, 0.8503971, -0.02453038, 0, 0, 0, 1, 1,
-0.3478676, 0.2900854, 1.387483, 0, 0, 0, 1, 1,
-0.3475902, -1.152014, -3.099149, 1, 1, 1, 1, 1,
-0.3348278, -0.5143757, -2.209609, 1, 1, 1, 1, 1,
-0.3326256, -0.1990426, -2.047434, 1, 1, 1, 1, 1,
-0.3255707, 1.894521, -0.7398332, 1, 1, 1, 1, 1,
-0.3246239, 0.2726578, -0.3460856, 1, 1, 1, 1, 1,
-0.3234068, 0.9450607, -0.4224201, 1, 1, 1, 1, 1,
-0.3217081, 1.432439, -0.0809652, 1, 1, 1, 1, 1,
-0.3212669, 1.820194, -1.648013, 1, 1, 1, 1, 1,
-0.3151374, 0.5299879, -1.711533, 1, 1, 1, 1, 1,
-0.3093275, 0.03110338, -0.7329814, 1, 1, 1, 1, 1,
-0.3090678, 1.5587, 2.514002, 1, 1, 1, 1, 1,
-0.3071262, -0.2662069, -0.4110748, 1, 1, 1, 1, 1,
-0.3054104, 1.075926, 0.3645949, 1, 1, 1, 1, 1,
-0.3038303, -0.1744482, -2.284491, 1, 1, 1, 1, 1,
-0.2976133, -0.7474437, -2.441508, 1, 1, 1, 1, 1,
-0.2934415, -0.4261627, -1.351621, 0, 0, 1, 1, 1,
-0.2901719, 0.04164946, -1.14837, 1, 0, 0, 1, 1,
-0.2864718, 0.258368, -1.708795, 1, 0, 0, 1, 1,
-0.2810473, -0.4182334, -1.858076, 1, 0, 0, 1, 1,
-0.2808217, 1.293111, -0.122344, 1, 0, 0, 1, 1,
-0.2801231, -0.04078521, -2.982166, 1, 0, 0, 1, 1,
-0.2800841, -0.8814709, -2.251102, 0, 0, 0, 1, 1,
-0.2792172, 0.3467474, -0.5953549, 0, 0, 0, 1, 1,
-0.2671932, -0.9571988, -1.31128, 0, 0, 0, 1, 1,
-0.2664191, -0.6589615, -2.907495, 0, 0, 0, 1, 1,
-0.261077, -0.5414176, -2.628971, 0, 0, 0, 1, 1,
-0.2609878, 0.191036, -1.613994, 0, 0, 0, 1, 1,
-0.2575616, -0.7666094, -2.553229, 0, 0, 0, 1, 1,
-0.2513945, -1.048923, -1.581086, 1, 1, 1, 1, 1,
-0.2458819, -0.5791066, -2.4587, 1, 1, 1, 1, 1,
-0.2421447, 0.3382229, -2.511023, 1, 1, 1, 1, 1,
-0.2414566, 1.227401, 0.9932511, 1, 1, 1, 1, 1,
-0.2400152, 0.2369285, -2.051226, 1, 1, 1, 1, 1,
-0.235771, -0.02415283, -1.461414, 1, 1, 1, 1, 1,
-0.2285779, -0.7513434, -4.027846, 1, 1, 1, 1, 1,
-0.2280836, -0.9054994, -0.6367139, 1, 1, 1, 1, 1,
-0.2221814, -1.124228, -3.990462, 1, 1, 1, 1, 1,
-0.2158211, 0.1201063, -3.362676, 1, 1, 1, 1, 1,
-0.2127561, -0.3010709, -4.023254, 1, 1, 1, 1, 1,
-0.2093246, -2.005106, -2.625074, 1, 1, 1, 1, 1,
-0.203967, 1.11628, -0.2593455, 1, 1, 1, 1, 1,
-0.2027568, 0.7572061, 0.5688547, 1, 1, 1, 1, 1,
-0.2015664, -0.6369258, -1.609291, 1, 1, 1, 1, 1,
-0.1952058, -0.5010601, -5.370537, 0, 0, 1, 1, 1,
-0.1905723, -0.09836734, -3.093668, 1, 0, 0, 1, 1,
-0.1888, -0.9751196, -2.502158, 1, 0, 0, 1, 1,
-0.184077, -0.6773896, -1.680793, 1, 0, 0, 1, 1,
-0.1818306, -0.9737868, -3.340124, 1, 0, 0, 1, 1,
-0.1751804, -2.373351, -1.059537, 1, 0, 0, 1, 1,
-0.1735562, 0.3943301, -0.9388888, 0, 0, 0, 1, 1,
-0.1730742, 0.6162504, 1.116778, 0, 0, 0, 1, 1,
-0.1730625, -1.746798, -4.735024, 0, 0, 0, 1, 1,
-0.1725552, 1.879063, -0.2248123, 0, 0, 0, 1, 1,
-0.1723955, -1.153205, -1.645746, 0, 0, 0, 1, 1,
-0.1718097, -0.7929764, -2.575845, 0, 0, 0, 1, 1,
-0.1717819, -1.57757, -2.971715, 0, 0, 0, 1, 1,
-0.1700479, 1.344861, -0.4952536, 1, 1, 1, 1, 1,
-0.1692165, -0.8602023, -3.138712, 1, 1, 1, 1, 1,
-0.1683459, -1.463525, -5.028592, 1, 1, 1, 1, 1,
-0.1664686, 1.191774, -1.828988, 1, 1, 1, 1, 1,
-0.1663348, 0.3501872, -0.9162554, 1, 1, 1, 1, 1,
-0.1637698, -1.368417, -4.134034, 1, 1, 1, 1, 1,
-0.1625611, -0.3704522, -1.688694, 1, 1, 1, 1, 1,
-0.1606568, 0.4946702, -0.9361785, 1, 1, 1, 1, 1,
-0.1604056, 0.1252485, -0.6253121, 1, 1, 1, 1, 1,
-0.1551182, 0.7046874, 1.501712, 1, 1, 1, 1, 1,
-0.152371, 0.8706236, -1.70144, 1, 1, 1, 1, 1,
-0.1522283, 0.6163048, -0.4591079, 1, 1, 1, 1, 1,
-0.146251, 0.671929, -1.094964, 1, 1, 1, 1, 1,
-0.1431007, -1.176805, -2.848253, 1, 1, 1, 1, 1,
-0.1386017, -0.1304594, -3.519158, 1, 1, 1, 1, 1,
-0.1367724, 0.7426419, -1.03821, 0, 0, 1, 1, 1,
-0.1263594, 0.2389307, -1.642926, 1, 0, 0, 1, 1,
-0.1208632, 0.3638789, -0.8315203, 1, 0, 0, 1, 1,
-0.1191191, -0.1404036, -4.169231, 1, 0, 0, 1, 1,
-0.1150798, -0.258569, -2.795058, 1, 0, 0, 1, 1,
-0.114217, -0.3004819, -1.781234, 1, 0, 0, 1, 1,
-0.1138462, -0.3993843, -2.362859, 0, 0, 0, 1, 1,
-0.1124887, 1.289742, 1.104771, 0, 0, 0, 1, 1,
-0.1098948, -0.06609253, -1.631176, 0, 0, 0, 1, 1,
-0.1082308, 0.6824197, -0.3196492, 0, 0, 0, 1, 1,
-0.106268, 0.6666547, -0.9497064, 0, 0, 0, 1, 1,
-0.1022161, -0.1735588, -0.141054, 0, 0, 0, 1, 1,
-0.1000229, 2.084747, -0.8291618, 0, 0, 0, 1, 1,
-0.09963335, -1.466346, -3.572138, 1, 1, 1, 1, 1,
-0.09928308, 0.2338997, -1.037687, 1, 1, 1, 1, 1,
-0.09913089, -0.7869011, -4.297393, 1, 1, 1, 1, 1,
-0.09910025, 1.936811, -1.384001, 1, 1, 1, 1, 1,
-0.09853199, 0.3798234, -0.0890587, 1, 1, 1, 1, 1,
-0.09290055, -2.692979, -3.418396, 1, 1, 1, 1, 1,
-0.09231555, -1.059195, -3.148324, 1, 1, 1, 1, 1,
-0.0853864, -1.081873, -2.260723, 1, 1, 1, 1, 1,
-0.0834725, 1.09074, 1.225321, 1, 1, 1, 1, 1,
-0.08216016, -1.893355, -2.792271, 1, 1, 1, 1, 1,
-0.07586364, 0.03586609, -0.3378662, 1, 1, 1, 1, 1,
-0.07453825, -0.3566623, -2.648012, 1, 1, 1, 1, 1,
-0.07007407, 1.740617, 1.19473, 1, 1, 1, 1, 1,
-0.06644657, -1.317453, -3.914631, 1, 1, 1, 1, 1,
-0.0588943, 0.2130251, -0.452608, 1, 1, 1, 1, 1,
-0.05888268, -0.3722356, -1.89375, 0, 0, 1, 1, 1,
-0.05867769, -1.351082, -0.8963705, 1, 0, 0, 1, 1,
-0.05787683, 0.2480437, -1.214408, 1, 0, 0, 1, 1,
-0.05600401, -0.7753751, -2.503315, 1, 0, 0, 1, 1,
-0.05532449, 0.2921646, -1.135123, 1, 0, 0, 1, 1,
-0.05477387, 0.5514867, -1.618146, 1, 0, 0, 1, 1,
-0.05268051, -0.2996728, -2.400162, 0, 0, 0, 1, 1,
-0.05242723, 0.4056411, -0.6080515, 0, 0, 0, 1, 1,
-0.03300179, 0.6778263, -0.5611869, 0, 0, 0, 1, 1,
-0.03256524, -1.180012, -1.923092, 0, 0, 0, 1, 1,
-0.03228343, -0.6116921, -3.165833, 0, 0, 0, 1, 1,
-0.01934727, 0.4401641, 1.513757, 0, 0, 0, 1, 1,
-0.01653629, 0.6745899, 1.225618, 0, 0, 0, 1, 1,
-0.01302153, -0.5815544, -1.803276, 1, 1, 1, 1, 1,
-0.01015522, -1.401744, -1.966989, 1, 1, 1, 1, 1,
-0.009963049, 1.130382, -0.2922643, 1, 1, 1, 1, 1,
-0.009552334, -0.8808559, -3.133327, 1, 1, 1, 1, 1,
-0.008122425, 0.2084931, 1.366006, 1, 1, 1, 1, 1,
-0.006174583, -0.6199738, -3.584049, 1, 1, 1, 1, 1,
-0.003331339, -0.6320388, -4.562367, 1, 1, 1, 1, 1,
-0.002184462, 0.9611542, 0.2923142, 1, 1, 1, 1, 1,
0.0006045171, -1.088964, 3.72928, 1, 1, 1, 1, 1,
0.0006261318, -0.06798692, 2.688574, 1, 1, 1, 1, 1,
0.002014979, -0.2843553, 2.624475, 1, 1, 1, 1, 1,
0.002553991, -0.2469283, 3.930586, 1, 1, 1, 1, 1,
0.002718837, -0.4281656, 2.540316, 1, 1, 1, 1, 1,
0.006045624, 0.3939266, -0.4094435, 1, 1, 1, 1, 1,
0.01042674, -1.676908, 3.688285, 1, 1, 1, 1, 1,
0.01762551, -0.5996909, 2.554988, 0, 0, 1, 1, 1,
0.02006866, 0.6311461, -0.1210886, 1, 0, 0, 1, 1,
0.02079812, 2.035343, -0.9382766, 1, 0, 0, 1, 1,
0.02292526, 0.7750572, -1.001866, 1, 0, 0, 1, 1,
0.02361674, -0.8089412, 3.923387, 1, 0, 0, 1, 1,
0.02978421, -1.232768, 2.852872, 1, 0, 0, 1, 1,
0.03481594, 0.05200331, 1.6965, 0, 0, 0, 1, 1,
0.0371899, -1.266713, 3.018896, 0, 0, 0, 1, 1,
0.0388787, -0.5960601, 2.869484, 0, 0, 0, 1, 1,
0.04309072, 0.8513868, -2.599195, 0, 0, 0, 1, 1,
0.04495047, -0.1172415, 2.341731, 0, 0, 0, 1, 1,
0.04567265, -0.465292, 4.128619, 0, 0, 0, 1, 1,
0.04711733, 0.4539519, -0.2863445, 0, 0, 0, 1, 1,
0.05078474, 0.7273859, -0.4154178, 1, 1, 1, 1, 1,
0.05399428, 0.4221092, -0.4368315, 1, 1, 1, 1, 1,
0.05968263, -0.7993951, 1.760314, 1, 1, 1, 1, 1,
0.05975946, -1.075782, 2.311478, 1, 1, 1, 1, 1,
0.06148132, 0.7270909, 0.2482174, 1, 1, 1, 1, 1,
0.06719989, -0.9604304, 2.838189, 1, 1, 1, 1, 1,
0.06927564, 1.571041, -0.9848447, 1, 1, 1, 1, 1,
0.06929293, -1.304397, 3.271454, 1, 1, 1, 1, 1,
0.07111806, 1.505183, -0.5333104, 1, 1, 1, 1, 1,
0.07755373, -0.7202945, 1.313716, 1, 1, 1, 1, 1,
0.08052567, -1.452945, 1.045827, 1, 1, 1, 1, 1,
0.08069306, -0.1598217, 2.528743, 1, 1, 1, 1, 1,
0.08243326, 0.2058358, 0.9539783, 1, 1, 1, 1, 1,
0.08518998, 0.7203363, 0.4668802, 1, 1, 1, 1, 1,
0.08544238, 0.3487493, 0.5509717, 1, 1, 1, 1, 1,
0.09124775, -0.1575741, 2.778676, 0, 0, 1, 1, 1,
0.09660787, -0.105281, 1.906631, 1, 0, 0, 1, 1,
0.09980205, 0.1754162, -1.09264, 1, 0, 0, 1, 1,
0.1010779, -2.665378, 2.606844, 1, 0, 0, 1, 1,
0.1015386, 2.007772, -0.4612658, 1, 0, 0, 1, 1,
0.1075919, 0.7039583, -0.1680037, 1, 0, 0, 1, 1,
0.1079641, -0.4419236, 2.258295, 0, 0, 0, 1, 1,
0.1151979, -0.3634319, 2.44633, 0, 0, 0, 1, 1,
0.1177602, 0.04848896, 1.60084, 0, 0, 0, 1, 1,
0.1265531, -2.01745, 3.247035, 0, 0, 0, 1, 1,
0.1268947, -0.2838957, 3.138237, 0, 0, 0, 1, 1,
0.1272985, -0.4146976, 1.703462, 0, 0, 0, 1, 1,
0.1283355, 0.8074425, 0.1945723, 0, 0, 0, 1, 1,
0.1287455, 1.019488, -1.312783, 1, 1, 1, 1, 1,
0.1323275, -0.4192857, 2.641329, 1, 1, 1, 1, 1,
0.1371358, -1.147779, 4.067946, 1, 1, 1, 1, 1,
0.1405795, 1.032875, -1.752342, 1, 1, 1, 1, 1,
0.1412132, 0.5606065, 0.1549014, 1, 1, 1, 1, 1,
0.1413893, -0.4026989, 2.534149, 1, 1, 1, 1, 1,
0.1422593, -1.368835, 2.447008, 1, 1, 1, 1, 1,
0.1427216, 1.238106, 1.313573, 1, 1, 1, 1, 1,
0.1501491, 0.9752806, -0.7122275, 1, 1, 1, 1, 1,
0.1528757, 0.888921, -1.178362, 1, 1, 1, 1, 1,
0.1602188, 0.4520442, 1.140388, 1, 1, 1, 1, 1,
0.1607408, 0.1607931, 0.2431756, 1, 1, 1, 1, 1,
0.161963, 0.7333222, -0.9879773, 1, 1, 1, 1, 1,
0.1673647, -1.283719, 2.439064, 1, 1, 1, 1, 1,
0.1683975, -0.3920027, 2.072807, 1, 1, 1, 1, 1,
0.1761007, -0.8245038, 1.918184, 0, 0, 1, 1, 1,
0.1792825, -1.144368, 2.663257, 1, 0, 0, 1, 1,
0.1793804, 0.2616895, 0.3501296, 1, 0, 0, 1, 1,
0.1824657, 0.4710087, -0.1004468, 1, 0, 0, 1, 1,
0.1836872, 1.873217, -0.8673559, 1, 0, 0, 1, 1,
0.1864086, 1.188169, 0.5619369, 1, 0, 0, 1, 1,
0.1870647, 0.01058546, 1.295282, 0, 0, 0, 1, 1,
0.1871274, -0.5616889, 3.522141, 0, 0, 0, 1, 1,
0.1895729, 0.01375834, -0.5880848, 0, 0, 0, 1, 1,
0.1929937, 1.68846, -0.7789171, 0, 0, 0, 1, 1,
0.198643, -1.160994, 1.959661, 0, 0, 0, 1, 1,
0.1991059, 0.498401, -1.077182, 0, 0, 0, 1, 1,
0.1994185, 0.25617, -0.2797924, 0, 0, 0, 1, 1,
0.2021106, 1.382798, -0.1259821, 1, 1, 1, 1, 1,
0.2077441, 0.1688146, 0.7266703, 1, 1, 1, 1, 1,
0.2098458, -0.5099067, 2.351851, 1, 1, 1, 1, 1,
0.2119305, -1.937837, 3.365337, 1, 1, 1, 1, 1,
0.2167938, 1.100943, -1.409273, 1, 1, 1, 1, 1,
0.2238488, -0.3788494, 3.267908, 1, 1, 1, 1, 1,
0.2278561, -1.468552, 2.786387, 1, 1, 1, 1, 1,
0.2283203, -0.8342643, 3.830955, 1, 1, 1, 1, 1,
0.2329174, -1.247558, 1.963354, 1, 1, 1, 1, 1,
0.2386619, 0.5553883, -0.5092745, 1, 1, 1, 1, 1,
0.2392809, -0.921781, 3.010537, 1, 1, 1, 1, 1,
0.2404515, 0.1355851, 1.974148, 1, 1, 1, 1, 1,
0.2405633, -0.3971618, 2.601748, 1, 1, 1, 1, 1,
0.2413755, -1.466229, 2.960371, 1, 1, 1, 1, 1,
0.2504347, 0.0362598, 0.8714888, 1, 1, 1, 1, 1,
0.2510105, 2.087059, -0.2966743, 0, 0, 1, 1, 1,
0.2545528, 2.49406, -0.1127372, 1, 0, 0, 1, 1,
0.254789, 0.5668295, -0.8848681, 1, 0, 0, 1, 1,
0.2588523, 0.5595893, 1.149244, 1, 0, 0, 1, 1,
0.2598085, 1.633704, 0.930385, 1, 0, 0, 1, 1,
0.2640034, 0.9269205, 0.5749567, 1, 0, 0, 1, 1,
0.2640178, 1.447854, 1.103056, 0, 0, 0, 1, 1,
0.2653202, -0.6297032, 3.530189, 0, 0, 0, 1, 1,
0.2667651, 0.6444832, -0.1909554, 0, 0, 0, 1, 1,
0.2702955, -0.1556826, 1.935342, 0, 0, 0, 1, 1,
0.2722962, 0.9394214, -0.177295, 0, 0, 0, 1, 1,
0.2782142, 0.3284276, 1.549929, 0, 0, 0, 1, 1,
0.2786974, -0.1945639, 1.781697, 0, 0, 0, 1, 1,
0.2825786, 0.7142023, 0.1269447, 1, 1, 1, 1, 1,
0.2839199, 0.5491255, 0.3345684, 1, 1, 1, 1, 1,
0.2869429, -1.210661, 3.570109, 1, 1, 1, 1, 1,
0.2905161, -1.267133, 2.673557, 1, 1, 1, 1, 1,
0.2908901, -0.9113036, 3.334734, 1, 1, 1, 1, 1,
0.294953, -1.487489, 3.657646, 1, 1, 1, 1, 1,
0.2955793, 1.388033, -0.9048347, 1, 1, 1, 1, 1,
0.2977124, 0.8715096, -0.07685049, 1, 1, 1, 1, 1,
0.2987126, 0.4692393, 1.012493, 1, 1, 1, 1, 1,
0.3061671, -0.07859907, 3.320044, 1, 1, 1, 1, 1,
0.3076378, 0.584444, 0.6067063, 1, 1, 1, 1, 1,
0.3078038, 0.7105955, -0.2824403, 1, 1, 1, 1, 1,
0.3093758, -0.06106427, 2.332833, 1, 1, 1, 1, 1,
0.3133202, -0.5631311, 2.084599, 1, 1, 1, 1, 1,
0.3181276, -0.2506906, 0.4236009, 1, 1, 1, 1, 1,
0.3191072, -1.184915, 4.156854, 0, 0, 1, 1, 1,
0.3191905, -1.028781, 1.784734, 1, 0, 0, 1, 1,
0.3212566, 1.034861, 0.4025233, 1, 0, 0, 1, 1,
0.3215036, -0.6970253, 3.387393, 1, 0, 0, 1, 1,
0.3217174, 0.6091293, 0.6797214, 1, 0, 0, 1, 1,
0.3291333, -0.3466922, 2.014499, 1, 0, 0, 1, 1,
0.33314, -0.02337725, 0.8420158, 0, 0, 0, 1, 1,
0.336242, -1.415248, 3.580204, 0, 0, 0, 1, 1,
0.3411992, -0.3849105, 2.481733, 0, 0, 0, 1, 1,
0.344281, -0.637609, 3.757688, 0, 0, 0, 1, 1,
0.351404, 0.8645278, -0.6818337, 0, 0, 0, 1, 1,
0.3620853, 1.372428, 0.5877278, 0, 0, 0, 1, 1,
0.3634237, -0.4422207, 1.351485, 0, 0, 0, 1, 1,
0.3650714, 1.157346, -0.127307, 1, 1, 1, 1, 1,
0.36554, 0.9439682, 0.6757757, 1, 1, 1, 1, 1,
0.3673707, -0.3700714, 2.701613, 1, 1, 1, 1, 1,
0.3714279, 1.054755, -0.8040575, 1, 1, 1, 1, 1,
0.3734671, -1.387984, 2.410989, 1, 1, 1, 1, 1,
0.3752759, 0.5131943, 2.275605, 1, 1, 1, 1, 1,
0.3757336, 0.6367768, 1.071602, 1, 1, 1, 1, 1,
0.3762135, 0.1261928, 0.9711699, 1, 1, 1, 1, 1,
0.3839721, 3.381621, -1.151325, 1, 1, 1, 1, 1,
0.3876119, -0.8945449, 1.649661, 1, 1, 1, 1, 1,
0.3886054, 0.5306721, 0.1453735, 1, 1, 1, 1, 1,
0.3905868, 1.766611, -0.7005244, 1, 1, 1, 1, 1,
0.3926906, -0.5680856, 3.422223, 1, 1, 1, 1, 1,
0.3930134, 0.2373659, 0.3859195, 1, 1, 1, 1, 1,
0.3931829, -1.378787, 4.083477, 1, 1, 1, 1, 1,
0.3941884, 0.6779522, 0.6456769, 0, 0, 1, 1, 1,
0.395172, -1.75986, 2.902933, 1, 0, 0, 1, 1,
0.3985877, -0.4985237, 1.045942, 1, 0, 0, 1, 1,
0.405461, -0.3813336, 0.8957725, 1, 0, 0, 1, 1,
0.4094658, -0.5842003, 1.403597, 1, 0, 0, 1, 1,
0.4119608, 0.09359577, 1.052973, 1, 0, 0, 1, 1,
0.4125068, -1.512582, 3.341921, 0, 0, 0, 1, 1,
0.4127725, 0.1407825, 2.088899, 0, 0, 0, 1, 1,
0.4144039, 1.140239, 0.6264152, 0, 0, 0, 1, 1,
0.4146034, -0.3242677, 1.58224, 0, 0, 0, 1, 1,
0.4154408, 2.327403, 2.709978, 0, 0, 0, 1, 1,
0.421, -0.2957667, 4.190444, 0, 0, 0, 1, 1,
0.4211034, 0.3396925, 1.476338, 0, 0, 0, 1, 1,
0.4259234, 0.1950311, 3.381126, 1, 1, 1, 1, 1,
0.429852, 0.296871, 1.740221, 1, 1, 1, 1, 1,
0.4327506, 0.3663742, 1.005043, 1, 1, 1, 1, 1,
0.4350061, -1.865833, 1.126636, 1, 1, 1, 1, 1,
0.4364573, 0.5017592, -0.5165504, 1, 1, 1, 1, 1,
0.4394632, 0.1442953, 0.9442605, 1, 1, 1, 1, 1,
0.4399194, 1.780715, -0.4491345, 1, 1, 1, 1, 1,
0.4400241, -0.3393243, 1.433303, 1, 1, 1, 1, 1,
0.4441614, -0.08650886, 0.06951787, 1, 1, 1, 1, 1,
0.4453288, 1.691832, -0.1908628, 1, 1, 1, 1, 1,
0.4461858, -0.08090953, 3.002581, 1, 1, 1, 1, 1,
0.4521166, 1.618321, 0.2945529, 1, 1, 1, 1, 1,
0.4536586, 0.5189527, 1.00639, 1, 1, 1, 1, 1,
0.459469, 0.9331641, 0.1467012, 1, 1, 1, 1, 1,
0.4614585, -0.9953753, 1.889526, 1, 1, 1, 1, 1,
0.4668452, -0.7989697, 1.804341, 0, 0, 1, 1, 1,
0.469831, -1.055097, 3.354696, 1, 0, 0, 1, 1,
0.4750006, -1.539052, 3.125269, 1, 0, 0, 1, 1,
0.480834, -0.05250892, 1.65453, 1, 0, 0, 1, 1,
0.4809584, 1.195957, -0.3142906, 1, 0, 0, 1, 1,
0.4838023, 0.4570584, 1.438201, 1, 0, 0, 1, 1,
0.4857228, -0.04528655, 1.472716, 0, 0, 0, 1, 1,
0.4905873, -0.5012622, 4.215219, 0, 0, 0, 1, 1,
0.4908031, 1.013406, 1.197536, 0, 0, 0, 1, 1,
0.4930352, -0.8750219, 2.158111, 0, 0, 0, 1, 1,
0.5000421, 0.4095046, 1.453089, 0, 0, 0, 1, 1,
0.5031691, -0.724974, 3.962212, 0, 0, 0, 1, 1,
0.5098509, 0.6546484, 0.6814508, 0, 0, 0, 1, 1,
0.5135957, -0.3044188, 5.920862, 1, 1, 1, 1, 1,
0.5146375, 1.17724, -0.1854554, 1, 1, 1, 1, 1,
0.515593, -0.2908753, 2.72565, 1, 1, 1, 1, 1,
0.5164531, -0.9860924, 3.943172, 1, 1, 1, 1, 1,
0.5178709, -1.446786, 0.09863866, 1, 1, 1, 1, 1,
0.526498, 0.06847171, 1.872311, 1, 1, 1, 1, 1,
0.5291994, 1.161122, 0.05430422, 1, 1, 1, 1, 1,
0.5346183, -0.1272328, 2.303077, 1, 1, 1, 1, 1,
0.5354387, -0.8277456, 2.972289, 1, 1, 1, 1, 1,
0.5358273, 0.6991602, 0.01192071, 1, 1, 1, 1, 1,
0.5372816, 0.1832786, 1.439212, 1, 1, 1, 1, 1,
0.5418919, 1.124555, -0.5802121, 1, 1, 1, 1, 1,
0.5490347, 0.2216911, 1.926125, 1, 1, 1, 1, 1,
0.5587657, 1.803365, 0.4597175, 1, 1, 1, 1, 1,
0.5607377, 0.6215532, 0.5032939, 1, 1, 1, 1, 1,
0.5691352, 0.8333184, 0.06774478, 0, 0, 1, 1, 1,
0.5786834, -2.344547, 3.328682, 1, 0, 0, 1, 1,
0.5828051, 0.598978, 0.05663596, 1, 0, 0, 1, 1,
0.5828947, -0.03620732, 1.251309, 1, 0, 0, 1, 1,
0.5880714, -0.2528274, 0.9551274, 1, 0, 0, 1, 1,
0.5951612, -0.05164649, -0.27562, 1, 0, 0, 1, 1,
0.6051204, 1.936261, 1.602236, 0, 0, 0, 1, 1,
0.6077656, -1.189272, 3.308354, 0, 0, 0, 1, 1,
0.6085792, -1.130723, 4.102798, 0, 0, 0, 1, 1,
0.61041, 0.2135316, 0.8477036, 0, 0, 0, 1, 1,
0.6105591, 0.7412022, 0.3608027, 0, 0, 0, 1, 1,
0.6115434, -1.246892, 2.572707, 0, 0, 0, 1, 1,
0.6137982, -0.5119197, 3.578383, 0, 0, 0, 1, 1,
0.6144866, -1.72056, 2.681782, 1, 1, 1, 1, 1,
0.6146579, -0.4071788, 2.777362, 1, 1, 1, 1, 1,
0.6159478, 0.2217051, 1.685965, 1, 1, 1, 1, 1,
0.6166037, 0.6228271, 1.119057, 1, 1, 1, 1, 1,
0.6178364, -1.436248, 2.813068, 1, 1, 1, 1, 1,
0.6178941, 1.033664, 2.509609, 1, 1, 1, 1, 1,
0.6291068, -0.390079, 2.916305, 1, 1, 1, 1, 1,
0.6315051, -0.406305, 1.939417, 1, 1, 1, 1, 1,
0.6355495, 0.2274406, 2.33074, 1, 1, 1, 1, 1,
0.6365077, 1.037382, -0.7070018, 1, 1, 1, 1, 1,
0.6371453, 1.196531, 2.538909, 1, 1, 1, 1, 1,
0.6378709, 0.6096601, -1.362145, 1, 1, 1, 1, 1,
0.6396286, -2.145633, 3.513916, 1, 1, 1, 1, 1,
0.6425785, 0.6505386, 1.851712, 1, 1, 1, 1, 1,
0.6436024, 0.7879439, 1.53451, 1, 1, 1, 1, 1,
0.6459894, 0.09616123, 1.637418, 0, 0, 1, 1, 1,
0.6536279, 0.6305262, 2.13345, 1, 0, 0, 1, 1,
0.6543714, -0.5990208, 0.7763457, 1, 0, 0, 1, 1,
0.657541, -0.9728135, 1.317849, 1, 0, 0, 1, 1,
0.6628639, -1.159441, 3.028083, 1, 0, 0, 1, 1,
0.6650057, -1.76042, 4.020018, 1, 0, 0, 1, 1,
0.6671906, -1.525582, 1.75634, 0, 0, 0, 1, 1,
0.6696837, 0.8825698, 0.8135892, 0, 0, 0, 1, 1,
0.6716112, -1.495449, 3.664789, 0, 0, 0, 1, 1,
0.6752688, -1.641301, 5.336647, 0, 0, 0, 1, 1,
0.6754103, 1.437432, 0.5870547, 0, 0, 0, 1, 1,
0.6808157, 0.1857282, 0.6119044, 0, 0, 0, 1, 1,
0.6817387, -0.4872937, 2.189711, 0, 0, 0, 1, 1,
0.6823404, -1.133539, 2.895328, 1, 1, 1, 1, 1,
0.6903371, 1.135393, -0.2728872, 1, 1, 1, 1, 1,
0.7034031, 0.2611382, 1.598646, 1, 1, 1, 1, 1,
0.7051415, -0.4707088, 2.220515, 1, 1, 1, 1, 1,
0.706419, 0.8097653, 0.4905609, 1, 1, 1, 1, 1,
0.7071161, -0.733877, 3.071779, 1, 1, 1, 1, 1,
0.709622, -1.752556, 2.050388, 1, 1, 1, 1, 1,
0.7131702, -1.477413, 2.689481, 1, 1, 1, 1, 1,
0.7138201, 0.07519141, 2.16868, 1, 1, 1, 1, 1,
0.723315, -2.691072, 2.103832, 1, 1, 1, 1, 1,
0.7258319, -0.2907839, 2.668356, 1, 1, 1, 1, 1,
0.7335551, -1.330014, 2.83145, 1, 1, 1, 1, 1,
0.7362824, 0.3647072, 1.983932, 1, 1, 1, 1, 1,
0.7414278, 0.3276592, 1.50791, 1, 1, 1, 1, 1,
0.7432728, 1.549828, -0.2524078, 1, 1, 1, 1, 1,
0.7459822, -0.6881024, 1.984161, 0, 0, 1, 1, 1,
0.7539354, 1.041071, -1.216619, 1, 0, 0, 1, 1,
0.7561803, 0.5767052, -0.07065204, 1, 0, 0, 1, 1,
0.7570723, 1.171577, -0.2038687, 1, 0, 0, 1, 1,
0.7574557, -0.06578393, 2.591376, 1, 0, 0, 1, 1,
0.7579166, -0.02560824, 1.661965, 1, 0, 0, 1, 1,
0.7594578, -0.4248383, 1.949071, 0, 0, 0, 1, 1,
0.7664442, -0.8277705, 1.139911, 0, 0, 0, 1, 1,
0.7678092, 0.1458133, 1.512251, 0, 0, 0, 1, 1,
0.7690908, -0.8826664, 1.929695, 0, 0, 0, 1, 1,
0.771307, -0.8432935, 5.1295, 0, 0, 0, 1, 1,
0.7715139, 0.636311, 0.0827842, 0, 0, 0, 1, 1,
0.7751541, -0.1378192, 1.094055, 0, 0, 0, 1, 1,
0.7771446, -0.986688, 3.135048, 1, 1, 1, 1, 1,
0.7777524, 0.135536, 0.3879198, 1, 1, 1, 1, 1,
0.779608, -0.3544425, 1.714633, 1, 1, 1, 1, 1,
0.7819069, 1.237875, -0.2810434, 1, 1, 1, 1, 1,
0.7847927, -1.094403, 1.825738, 1, 1, 1, 1, 1,
0.7939779, -0.1067469, 0.5753899, 1, 1, 1, 1, 1,
0.7984527, 0.5660309, 1.77399, 1, 1, 1, 1, 1,
0.8030272, -0.5578026, 2.266927, 1, 1, 1, 1, 1,
0.8037021, 0.06656168, 0.8143842, 1, 1, 1, 1, 1,
0.8050428, 0.8386852, 0.1807159, 1, 1, 1, 1, 1,
0.8074237, -1.120821, 1.427397, 1, 1, 1, 1, 1,
0.8129549, 1.503983, -0.01158075, 1, 1, 1, 1, 1,
0.8220187, 1.573955, -1.122474, 1, 1, 1, 1, 1,
0.8234477, -0.7079711, 1.881279, 1, 1, 1, 1, 1,
0.8262125, 0.03342949, 0.5620459, 1, 1, 1, 1, 1,
0.8262559, 0.2940044, 1.916848, 0, 0, 1, 1, 1,
0.8314565, 0.437354, 2.292209, 1, 0, 0, 1, 1,
0.8323751, -0.2523576, 1.343395, 1, 0, 0, 1, 1,
0.8336619, 1.033887, 0.2590561, 1, 0, 0, 1, 1,
0.8345952, 1.160776, 1.165327, 1, 0, 0, 1, 1,
0.8347105, 0.5923423, 0.4020404, 1, 0, 0, 1, 1,
0.8360714, 1.730946, -1.149194, 0, 0, 0, 1, 1,
0.842222, 0.5608963, 0.6257765, 0, 0, 0, 1, 1,
0.844256, 1.491297, -0.5131524, 0, 0, 0, 1, 1,
0.8442932, 2.242803, -0.04092037, 0, 0, 0, 1, 1,
0.8474944, -0.5174317, 1.733274, 0, 0, 0, 1, 1,
0.8521003, 0.123995, 1.070195, 0, 0, 0, 1, 1,
0.8593107, -1.424575, 0.7910581, 0, 0, 0, 1, 1,
0.8612241, -1.401815, 4.173307, 1, 1, 1, 1, 1,
0.8627242, -0.2256688, 1.492425, 1, 1, 1, 1, 1,
0.8669712, -1.704847, 0.759221, 1, 1, 1, 1, 1,
0.8715529, -1.279541, 3.282416, 1, 1, 1, 1, 1,
0.8717104, -0.7381858, 3.252716, 1, 1, 1, 1, 1,
0.8729376, 1.988175, -1.066291, 1, 1, 1, 1, 1,
0.8809023, -0.3554342, 0.1925881, 1, 1, 1, 1, 1,
0.88756, -0.4918933, 0.8428835, 1, 1, 1, 1, 1,
0.8997554, 0.5267048, -2.567375, 1, 1, 1, 1, 1,
0.903734, 0.6665543, -0.802931, 1, 1, 1, 1, 1,
0.9038429, 0.5819679, 1.243387, 1, 1, 1, 1, 1,
0.9049394, 0.2562019, 1.728193, 1, 1, 1, 1, 1,
0.905574, -1.514631, 2.14486, 1, 1, 1, 1, 1,
0.9081193, -0.108103, 3.154199, 1, 1, 1, 1, 1,
0.9121444, -0.2583872, 2.008818, 1, 1, 1, 1, 1,
0.9162357, -0.3970366, 2.1501, 0, 0, 1, 1, 1,
0.9187765, 0.3494578, 1.657217, 1, 0, 0, 1, 1,
0.9260051, -0.04768505, 0.6176799, 1, 0, 0, 1, 1,
0.937484, 0.5155364, 1.872899, 1, 0, 0, 1, 1,
0.9391968, -1.25012, 2.030219, 1, 0, 0, 1, 1,
0.9420754, -1.120306, 0.9778464, 1, 0, 0, 1, 1,
0.9425102, 1.007179, 1.856537, 0, 0, 0, 1, 1,
0.9475732, -0.002448282, 0.8342606, 0, 0, 0, 1, 1,
0.9484561, -1.254833, 3.188885, 0, 0, 0, 1, 1,
0.9519213, -0.8077955, 2.208301, 0, 0, 0, 1, 1,
0.952027, -0.07458339, 1.726652, 0, 0, 0, 1, 1,
0.9594313, -1.106953, 2.19259, 0, 0, 0, 1, 1,
0.9669774, 1.859605, 1.583498, 0, 0, 0, 1, 1,
0.9672566, 0.2498816, 2.006202, 1, 1, 1, 1, 1,
0.968705, -0.1050979, 1.80159, 1, 1, 1, 1, 1,
0.9697487, -0.03592412, -1.085927, 1, 1, 1, 1, 1,
0.9832873, 1.094938, 0.6311229, 1, 1, 1, 1, 1,
0.9862286, 1.478655, 0.7739137, 1, 1, 1, 1, 1,
0.986455, -1.024434, 2.745676, 1, 1, 1, 1, 1,
0.9903539, 1.262731, 1.092827, 1, 1, 1, 1, 1,
0.996489, 0.9535648, 1.241789, 1, 1, 1, 1, 1,
0.9973375, -0.9882478, 4.646755, 1, 1, 1, 1, 1,
0.9977405, -0.3587253, 2.703072, 1, 1, 1, 1, 1,
0.9995588, -0.7091343, 3.81594, 1, 1, 1, 1, 1,
1.001005, -0.5508066, 3.113147, 1, 1, 1, 1, 1,
1.015069, 1.931484, -1.465387, 1, 1, 1, 1, 1,
1.02038, 0.07759349, 1.98964, 1, 1, 1, 1, 1,
1.02548, 0.03694651, 1.112745, 1, 1, 1, 1, 1,
1.03063, -1.400709, 2.466629, 0, 0, 1, 1, 1,
1.033621, -0.5510162, 1.485478, 1, 0, 0, 1, 1,
1.034992, 0.0284314, 1.986909, 1, 0, 0, 1, 1,
1.036253, -0.4399418, 1.725363, 1, 0, 0, 1, 1,
1.038839, -1.547801, 3.13009, 1, 0, 0, 1, 1,
1.047115, 0.03767883, 2.177285, 1, 0, 0, 1, 1,
1.052341, -0.2263978, 2.197889, 0, 0, 0, 1, 1,
1.052652, 1.346878, 0.6104425, 0, 0, 0, 1, 1,
1.057599, -0.978605, 1.696354, 0, 0, 0, 1, 1,
1.06131, 1.87833, 0.7271876, 0, 0, 0, 1, 1,
1.061549, 0.2671207, 2.587275, 0, 0, 0, 1, 1,
1.066156, -1.25617, 3.151609, 0, 0, 0, 1, 1,
1.068173, -0.9336, 2.048299, 0, 0, 0, 1, 1,
1.074046, -1.1159, 0.5105432, 1, 1, 1, 1, 1,
1.07718, 0.5414153, 1.862905, 1, 1, 1, 1, 1,
1.078115, 0.7429416, 0.7121758, 1, 1, 1, 1, 1,
1.093832, -1.25438, 2.063833, 1, 1, 1, 1, 1,
1.096, -1.684348, 4.049709, 1, 1, 1, 1, 1,
1.098083, -0.4354371, 1.4185, 1, 1, 1, 1, 1,
1.098832, 2.300092, 0.7703285, 1, 1, 1, 1, 1,
1.098946, -2.320354, 2.4723, 1, 1, 1, 1, 1,
1.099689, 0.1160377, 1.638287, 1, 1, 1, 1, 1,
1.11982, 1.716986, 1.3243, 1, 1, 1, 1, 1,
1.120315, 0.5394325, 0.5741363, 1, 1, 1, 1, 1,
1.134947, -0.01545971, 1.134504, 1, 1, 1, 1, 1,
1.138213, -1.012153, 2.951674, 1, 1, 1, 1, 1,
1.138639, -0.04538275, 1.560235, 1, 1, 1, 1, 1,
1.138788, 1.264777, 1.494951, 1, 1, 1, 1, 1,
1.138944, -1.076375, 2.166274, 0, 0, 1, 1, 1,
1.139488, 1.505675, 0.2067479, 1, 0, 0, 1, 1,
1.143837, 0.6086219, 1.429699, 1, 0, 0, 1, 1,
1.151618, 0.870989, 1.277814, 1, 0, 0, 1, 1,
1.16861, -0.6607141, 3.533886, 1, 0, 0, 1, 1,
1.170706, -0.6850368, 1.292405, 1, 0, 0, 1, 1,
1.175946, -1.453004, 3.11833, 0, 0, 0, 1, 1,
1.182797, 2.344392, -0.0117377, 0, 0, 0, 1, 1,
1.183782, -1.748125, 0.8145663, 0, 0, 0, 1, 1,
1.199268, 1.353007, 1.183382, 0, 0, 0, 1, 1,
1.207583, 0.560524, 1.031812, 0, 0, 0, 1, 1,
1.215803, 0.9942718, -0.3619007, 0, 0, 0, 1, 1,
1.218365, 1.56822, 0.3866759, 0, 0, 0, 1, 1,
1.222155, -0.4091553, 2.274749, 1, 1, 1, 1, 1,
1.225417, -0.1231734, 0.8193326, 1, 1, 1, 1, 1,
1.228581, 0.3105746, 0.260957, 1, 1, 1, 1, 1,
1.231682, -1.026767, 2.84661, 1, 1, 1, 1, 1,
1.24649, 1.740932, -0.4949566, 1, 1, 1, 1, 1,
1.246942, 0.6488804, 0.8762242, 1, 1, 1, 1, 1,
1.255063, -0.009323031, 0.4841292, 1, 1, 1, 1, 1,
1.25609, 1.057436, 1.724361, 1, 1, 1, 1, 1,
1.261402, -0.01214775, 3.333941, 1, 1, 1, 1, 1,
1.265822, -0.0224954, 2.448044, 1, 1, 1, 1, 1,
1.270589, 1.156793, 0.89125, 1, 1, 1, 1, 1,
1.277765, 0.3647765, 0.5740554, 1, 1, 1, 1, 1,
1.282165, 0.7673011, 1.059784, 1, 1, 1, 1, 1,
1.30513, 1.761748, 1.223266, 1, 1, 1, 1, 1,
1.307615, -0.7929952, 0.9476111, 1, 1, 1, 1, 1,
1.312314, -0.6999879, 1.761708, 0, 0, 1, 1, 1,
1.312356, 1.518552, 0.5516285, 1, 0, 0, 1, 1,
1.312809, 0.2730447, 2.859565, 1, 0, 0, 1, 1,
1.318841, -0.4212024, 3.608144, 1, 0, 0, 1, 1,
1.324441, 0.164413, 2.147038, 1, 0, 0, 1, 1,
1.329568, 1.167338, 0.490357, 1, 0, 0, 1, 1,
1.329883, 0.5685661, 1.943533, 0, 0, 0, 1, 1,
1.33385, 1.692041, 1.852639, 0, 0, 0, 1, 1,
1.335381, -1.363726, 3.594862, 0, 0, 0, 1, 1,
1.336616, 2.340198, 0.8435771, 0, 0, 0, 1, 1,
1.339399, -1.367942, 2.1913, 0, 0, 0, 1, 1,
1.343157, -0.7049475, 2.283967, 0, 0, 0, 1, 1,
1.348876, 0.6279708, 1.071094, 0, 0, 0, 1, 1,
1.354162, -0.5490569, 3.013678, 1, 1, 1, 1, 1,
1.369578, 1.335765, -0.6008556, 1, 1, 1, 1, 1,
1.37162, 1.141071, 0.428892, 1, 1, 1, 1, 1,
1.372901, -1.304125, 1.865428, 1, 1, 1, 1, 1,
1.399958, 0.6767812, 0.6841223, 1, 1, 1, 1, 1,
1.411436, -1.142555, 1.911894, 1, 1, 1, 1, 1,
1.412138, -1.527066, 1.306294, 1, 1, 1, 1, 1,
1.419768, 0.8708155, -0.2314814, 1, 1, 1, 1, 1,
1.434327, 0.8754972, -0.9124933, 1, 1, 1, 1, 1,
1.437308, -0.3372466, 1.142074, 1, 1, 1, 1, 1,
1.438942, 0.3832862, 1.141479, 1, 1, 1, 1, 1,
1.441888, 0.04745116, 1.326768, 1, 1, 1, 1, 1,
1.443908, 1.23812, 0.6349415, 1, 1, 1, 1, 1,
1.44499, 1.217455, -0.3418759, 1, 1, 1, 1, 1,
1.450345, -1.158954, 2.392474, 1, 1, 1, 1, 1,
1.453962, -0.398364, 2.333874, 0, 0, 1, 1, 1,
1.459469, -0.7820661, 1.511175, 1, 0, 0, 1, 1,
1.489093, -1.447554, 1.980723, 1, 0, 0, 1, 1,
1.506072, 0.4156767, 2.605196, 1, 0, 0, 1, 1,
1.510137, 0.2174004, 0.4754336, 1, 0, 0, 1, 1,
1.512159, 1.739764, -0.4989685, 1, 0, 0, 1, 1,
1.512303, -0.7512549, 0.6227008, 0, 0, 0, 1, 1,
1.516681, -0.7907277, 4.220802, 0, 0, 0, 1, 1,
1.52367, 0.1860682, 0.9027213, 0, 0, 0, 1, 1,
1.543729, -0.6893939, 2.805778, 0, 0, 0, 1, 1,
1.55736, -0.7599748, 2.647092, 0, 0, 0, 1, 1,
1.562675, 0.4747718, 1.705657, 0, 0, 0, 1, 1,
1.569359, -0.925207, 2.718971, 0, 0, 0, 1, 1,
1.595236, -1.975308, 2.20732, 1, 1, 1, 1, 1,
1.601393, 0.1295357, 0.7525812, 1, 1, 1, 1, 1,
1.608025, 0.3628137, 0.4042361, 1, 1, 1, 1, 1,
1.629863, -1.768901, 3.129186, 1, 1, 1, 1, 1,
1.642969, -0.7714052, 1.382764, 1, 1, 1, 1, 1,
1.644138, -1.940206, 2.781613, 1, 1, 1, 1, 1,
1.649732, -1.327829, 3.212101, 1, 1, 1, 1, 1,
1.651967, 0.006076793, 1.290503, 1, 1, 1, 1, 1,
1.655034, 0.7584031, 1.970527, 1, 1, 1, 1, 1,
1.658636, 0.5788067, 0.6284195, 1, 1, 1, 1, 1,
1.677911, -1.594555, 2.96945, 1, 1, 1, 1, 1,
1.685462, -0.1181135, 0.7284067, 1, 1, 1, 1, 1,
1.685974, -0.2997971, 1.18352, 1, 1, 1, 1, 1,
1.698278, -0.5494297, 2.245159, 1, 1, 1, 1, 1,
1.701485, 0.560255, 0.5356378, 1, 1, 1, 1, 1,
1.704463, -2.175698, 1.361469, 0, 0, 1, 1, 1,
1.729123, 0.43552, 2.718078, 1, 0, 0, 1, 1,
1.730865, 0.1524735, 0.483082, 1, 0, 0, 1, 1,
1.738179, 1.974133, 3.330624, 1, 0, 0, 1, 1,
1.745791, -0.9382824, 1.207218, 1, 0, 0, 1, 1,
1.747474, -0.7781956, 1.685355, 1, 0, 0, 1, 1,
1.750645, 0.5321245, 2.931319, 0, 0, 0, 1, 1,
1.780352, -0.02929874, 3.045714, 0, 0, 0, 1, 1,
1.786442, -0.7418502, 0.9031308, 0, 0, 0, 1, 1,
1.796231, -0.4210434, 2.821467, 0, 0, 0, 1, 1,
1.799267, -1.005027, 2.417306, 0, 0, 0, 1, 1,
1.804012, -0.3232171, 1.968805, 0, 0, 0, 1, 1,
1.808005, 0.4367113, 1.929417, 0, 0, 0, 1, 1,
1.814631, -1.186249, 2.524484, 1, 1, 1, 1, 1,
1.814737, -0.3663654, 1.638162, 1, 1, 1, 1, 1,
1.897553, -1.306555, 3.86616, 1, 1, 1, 1, 1,
1.899619, -0.6368818, 1.744821, 1, 1, 1, 1, 1,
1.909951, 0.2300832, 3.643042, 1, 1, 1, 1, 1,
1.928748, 0.4855369, -0.03671654, 1, 1, 1, 1, 1,
1.932673, -1.672099, 1.610924, 1, 1, 1, 1, 1,
1.937317, -1.030963, 3.440496, 1, 1, 1, 1, 1,
1.997834, -0.1484984, 1.107958, 1, 1, 1, 1, 1,
2.015511, -0.4211956, 2.46411, 1, 1, 1, 1, 1,
2.027114, -0.3610254, 1.549227, 1, 1, 1, 1, 1,
2.037271, -0.7689714, 3.800905, 1, 1, 1, 1, 1,
2.043493, 0.1899243, 1.931136, 1, 1, 1, 1, 1,
2.043823, -1.05269, 1.872926, 1, 1, 1, 1, 1,
2.082163, -0.4717652, 1.45598, 1, 1, 1, 1, 1,
2.085018, -0.187885, -0.3184095, 0, 0, 1, 1, 1,
2.112963, -0.2992707, 1.859547, 1, 0, 0, 1, 1,
2.115793, -0.9225141, 3.126697, 1, 0, 0, 1, 1,
2.138097, 0.4444674, 0.4119571, 1, 0, 0, 1, 1,
2.204595, 0.7880708, 3.677614, 1, 0, 0, 1, 1,
2.212264, 0.5537736, 2.33661, 1, 0, 0, 1, 1,
2.222355, -1.069827, 2.861464, 0, 0, 0, 1, 1,
2.281389, -1.351522, 1.731179, 0, 0, 0, 1, 1,
2.286234, 0.1824784, 1.528048, 0, 0, 0, 1, 1,
2.290842, -0.9064569, 3.527909, 0, 0, 0, 1, 1,
2.323257, 0.5403027, 0.1448831, 0, 0, 0, 1, 1,
2.32792, 1.378025, -0.1285337, 0, 0, 0, 1, 1,
2.362532, -0.07353183, -0.000592319, 0, 0, 0, 1, 1,
2.405874, -0.9272143, 2.638716, 1, 1, 1, 1, 1,
2.418159, -0.1471791, 0.04465131, 1, 1, 1, 1, 1,
2.503792, 1.208173, 2.749338, 1, 1, 1, 1, 1,
2.588423, 0.9796739, 0.1918711, 1, 1, 1, 1, 1,
2.674619, -1.80827, 1.75223, 1, 1, 1, 1, 1,
2.675995, -0.6866227, 2.086628, 1, 1, 1, 1, 1,
3.129823, 0.5014298, 0.981078, 1, 1, 1, 1, 1
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
var radius = 9.607236;
var distance = 33.74501;
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
mvMatrix.translate( -0.1530104, -0.344321, -0.2751625 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.74501);
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
