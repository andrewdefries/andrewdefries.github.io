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
-2.861546, -0.5290262, -2.406021, 1, 0, 0, 1,
-2.719867, -0.9619999, -0.05983578, 1, 0.007843138, 0, 1,
-2.617168, -0.9302978, -1.638875, 1, 0.01176471, 0, 1,
-2.616693, -0.9752234, -1.731936, 1, 0.01960784, 0, 1,
-2.615279, 0.4953263, -2.929479, 1, 0.02352941, 0, 1,
-2.55595, -0.8885248, -1.035586, 1, 0.03137255, 0, 1,
-2.466236, -0.5237234, -1.64905, 1, 0.03529412, 0, 1,
-2.392106, 0.6163676, -1.826622, 1, 0.04313726, 0, 1,
-2.21688, 0.6980059, -1.763463, 1, 0.04705882, 0, 1,
-2.103187, 1.051715, -2.792719, 1, 0.05490196, 0, 1,
-2.098147, -0.2358821, -1.62072, 1, 0.05882353, 0, 1,
-2.079719, -0.04758487, -0.7065748, 1, 0.06666667, 0, 1,
-2.030579, 1.680803, -0.8729893, 1, 0.07058824, 0, 1,
-1.986974, -2.336402, -0.6335551, 1, 0.07843138, 0, 1,
-1.986522, -0.1176309, -1.642878, 1, 0.08235294, 0, 1,
-1.97131, -1.429356, -2.863988, 1, 0.09019608, 0, 1,
-1.956838, -1.021921, -2.911035, 1, 0.09411765, 0, 1,
-1.956449, 0.08393323, -0.2264209, 1, 0.1019608, 0, 1,
-1.943789, -0.9673029, -3.217551, 1, 0.1098039, 0, 1,
-1.939582, 0.9547746, -1.411621, 1, 0.1137255, 0, 1,
-1.903711, 0.385715, -0.7915542, 1, 0.1215686, 0, 1,
-1.895146, -0.3520493, -0.8143867, 1, 0.1254902, 0, 1,
-1.863541, -2.113722, -2.964018, 1, 0.1333333, 0, 1,
-1.82127, 2.464485, -0.5542598, 1, 0.1372549, 0, 1,
-1.805586, -0.9411022, -1.025267, 1, 0.145098, 0, 1,
-1.802212, -0.155413, -0.7998881, 1, 0.1490196, 0, 1,
-1.788976, 1.376575, -0.4691848, 1, 0.1568628, 0, 1,
-1.776374, 0.7469957, -1.681063, 1, 0.1607843, 0, 1,
-1.760899, 0.2103908, -0.8930556, 1, 0.1686275, 0, 1,
-1.76085, -0.04535823, -1.822548, 1, 0.172549, 0, 1,
-1.76016, 0.3349292, -1.44601, 1, 0.1803922, 0, 1,
-1.75047, -0.5488837, -1.77545, 1, 0.1843137, 0, 1,
-1.731762, 0.4155596, -4.255186, 1, 0.1921569, 0, 1,
-1.731232, 1.041967, -1.036867, 1, 0.1960784, 0, 1,
-1.727901, 0.7540544, -1.221693, 1, 0.2039216, 0, 1,
-1.71489, 0.04105729, -2.275766, 1, 0.2117647, 0, 1,
-1.713472, -0.4180271, -1.753959, 1, 0.2156863, 0, 1,
-1.705854, -0.4531095, -1.32008, 1, 0.2235294, 0, 1,
-1.694933, 0.5563583, 0.9463175, 1, 0.227451, 0, 1,
-1.690833, 0.4842666, -1.170199, 1, 0.2352941, 0, 1,
-1.685202, -0.7751493, -2.394307, 1, 0.2392157, 0, 1,
-1.644266, -0.6468735, -1.776916, 1, 0.2470588, 0, 1,
-1.63776, 1.287403, -1.640593, 1, 0.2509804, 0, 1,
-1.635477, -0.417642, -1.970317, 1, 0.2588235, 0, 1,
-1.62509, 0.74496, -0.37268, 1, 0.2627451, 0, 1,
-1.621251, 1.657534, -1.69605, 1, 0.2705882, 0, 1,
-1.614213, -0.6807372, -2.429236, 1, 0.2745098, 0, 1,
-1.601241, 0.07403828, -2.341466, 1, 0.282353, 0, 1,
-1.594501, 0.1725735, -0.4936915, 1, 0.2862745, 0, 1,
-1.591099, 0.3965669, -1.070122, 1, 0.2941177, 0, 1,
-1.569137, 0.5852976, -3.260686, 1, 0.3019608, 0, 1,
-1.561065, 0.4138117, -0.1234407, 1, 0.3058824, 0, 1,
-1.560945, 0.4809447, -0.6976736, 1, 0.3137255, 0, 1,
-1.528413, -0.08309389, -1.40945, 1, 0.3176471, 0, 1,
-1.51126, 0.00132077, -1.003377, 1, 0.3254902, 0, 1,
-1.505711, -1.196952, -2.882423, 1, 0.3294118, 0, 1,
-1.504965, 0.2729563, -1.113424, 1, 0.3372549, 0, 1,
-1.502837, -0.3319493, -2.431063, 1, 0.3411765, 0, 1,
-1.497352, 0.25262, -1.563156, 1, 0.3490196, 0, 1,
-1.492751, 0.2999294, -2.451746, 1, 0.3529412, 0, 1,
-1.492212, -2.539828, -2.02021, 1, 0.3607843, 0, 1,
-1.485105, 1.115528, -1.101604, 1, 0.3647059, 0, 1,
-1.479327, 0.9059448, -0.6897277, 1, 0.372549, 0, 1,
-1.471285, 1.51849, -0.9812252, 1, 0.3764706, 0, 1,
-1.467228, 1.003494, -1.695559, 1, 0.3843137, 0, 1,
-1.465823, -0.2244113, -2.848114, 1, 0.3882353, 0, 1,
-1.46274, -1.355078, -2.462001, 1, 0.3960784, 0, 1,
-1.458237, 0.7122147, 1.165865, 1, 0.4039216, 0, 1,
-1.451579, 0.01791144, -2.611812, 1, 0.4078431, 0, 1,
-1.443573, 0.2096434, 0.5278721, 1, 0.4156863, 0, 1,
-1.441529, 0.1224078, -2.539233, 1, 0.4196078, 0, 1,
-1.440121, 0.269272, -0.2975162, 1, 0.427451, 0, 1,
-1.422309, 2.326468, 0.8732243, 1, 0.4313726, 0, 1,
-1.411389, 1.807085, -0.3759286, 1, 0.4392157, 0, 1,
-1.410419, 1.656883, 0.8244419, 1, 0.4431373, 0, 1,
-1.41008, 0.3464965, 0.1914772, 1, 0.4509804, 0, 1,
-1.408422, 1.700857, -2.774765, 1, 0.454902, 0, 1,
-1.405395, 0.55439, -1.404134, 1, 0.4627451, 0, 1,
-1.396897, -0.1096077, 0.334984, 1, 0.4666667, 0, 1,
-1.383972, -0.00108728, -0.4833091, 1, 0.4745098, 0, 1,
-1.379633, -1.690367, -2.751187, 1, 0.4784314, 0, 1,
-1.376197, -0.3230624, 0.5880461, 1, 0.4862745, 0, 1,
-1.370474, 0.5918689, -1.653705, 1, 0.4901961, 0, 1,
-1.365007, -1.267245, -2.360622, 1, 0.4980392, 0, 1,
-1.363024, 0.879931, -0.6733935, 1, 0.5058824, 0, 1,
-1.35947, -1.572779, -3.326545, 1, 0.509804, 0, 1,
-1.333063, -0.395476, -2.840708, 1, 0.5176471, 0, 1,
-1.328069, -0.01941445, 0.05854188, 1, 0.5215687, 0, 1,
-1.324706, -0.8722948, -2.590846, 1, 0.5294118, 0, 1,
-1.322876, -0.2958243, -1.380918, 1, 0.5333334, 0, 1,
-1.32055, 0.727757, -1.090679, 1, 0.5411765, 0, 1,
-1.31927, 0.5874787, -0.1885347, 1, 0.5450981, 0, 1,
-1.316648, -1.153841, -1.618315, 1, 0.5529412, 0, 1,
-1.314258, -0.9761066, -1.295622, 1, 0.5568628, 0, 1,
-1.31077, 0.7193775, 0.2772941, 1, 0.5647059, 0, 1,
-1.269367, 0.1042872, -1.814251, 1, 0.5686275, 0, 1,
-1.260454, -0.3000203, -2.465466, 1, 0.5764706, 0, 1,
-1.259816, 0.641999, -1.461949, 1, 0.5803922, 0, 1,
-1.238742, -0.2409149, -0.8181265, 1, 0.5882353, 0, 1,
-1.234365, -0.5267578, -1.028801, 1, 0.5921569, 0, 1,
-1.231966, -0.870941, -0.9790742, 1, 0.6, 0, 1,
-1.215211, -0.437832, -2.109958, 1, 0.6078432, 0, 1,
-1.21086, 1.325436, 0.2165255, 1, 0.6117647, 0, 1,
-1.190239, 0.1946306, -1.245703, 1, 0.6196079, 0, 1,
-1.188525, 0.5411547, -1.968736, 1, 0.6235294, 0, 1,
-1.181136, -0.2268947, -1.468704, 1, 0.6313726, 0, 1,
-1.180189, 1.437503, -0.5058345, 1, 0.6352941, 0, 1,
-1.177443, -0.4220005, -2.397597, 1, 0.6431373, 0, 1,
-1.176247, 1.542024, -1.086934, 1, 0.6470588, 0, 1,
-1.173259, -2.309211, -2.199316, 1, 0.654902, 0, 1,
-1.172041, 0.6402109, -1.338678, 1, 0.6588235, 0, 1,
-1.170464, -1.201539, -2.683135, 1, 0.6666667, 0, 1,
-1.169647, -0.9760161, -2.573129, 1, 0.6705883, 0, 1,
-1.168432, -1.187552, -0.700244, 1, 0.6784314, 0, 1,
-1.168109, -1.163433, -1.393475, 1, 0.682353, 0, 1,
-1.165637, 0.5021032, -2.073281, 1, 0.6901961, 0, 1,
-1.154786, -1.078096, -2.166911, 1, 0.6941177, 0, 1,
-1.152031, -0.6067023, -2.129365, 1, 0.7019608, 0, 1,
-1.147962, 0.7181454, 0.4062479, 1, 0.7098039, 0, 1,
-1.140645, -0.3733881, 0.1043939, 1, 0.7137255, 0, 1,
-1.140532, 1.04597, -1.055005, 1, 0.7215686, 0, 1,
-1.137438, -0.5829064, -2.348537, 1, 0.7254902, 0, 1,
-1.136955, 1.358142, -0.8687042, 1, 0.7333333, 0, 1,
-1.133497, -0.5831128, -2.065768, 1, 0.7372549, 0, 1,
-1.128643, -1.391129, -3.534157, 1, 0.7450981, 0, 1,
-1.119704, 0.4005093, -1.111362, 1, 0.7490196, 0, 1,
-1.119643, 0.06897874, -1.008277, 1, 0.7568628, 0, 1,
-1.116214, -1.169322, -3.723265, 1, 0.7607843, 0, 1,
-1.113705, 0.3901474, -1.253997, 1, 0.7686275, 0, 1,
-1.111602, -0.06566475, -2.383219, 1, 0.772549, 0, 1,
-1.109738, -0.4531932, -0.8105232, 1, 0.7803922, 0, 1,
-1.105729, 0.5051587, -0.5565052, 1, 0.7843137, 0, 1,
-1.105558, 0.6479501, -0.7825491, 1, 0.7921569, 0, 1,
-1.100295, -0.2293147, -1.53422, 1, 0.7960784, 0, 1,
-1.093785, -0.4146547, -0.7497405, 1, 0.8039216, 0, 1,
-1.081263, -1.28439, -1.075376, 1, 0.8117647, 0, 1,
-1.08104, 1.541482, 0.8106669, 1, 0.8156863, 0, 1,
-1.059248, 2.05667, 0.284776, 1, 0.8235294, 0, 1,
-1.057099, -0.03148979, -1.04323, 1, 0.827451, 0, 1,
-1.047517, 0.1111664, -3.393899, 1, 0.8352941, 0, 1,
-1.045996, -0.5923987, -2.595674, 1, 0.8392157, 0, 1,
-1.040579, -0.7988679, -1.735719, 1, 0.8470588, 0, 1,
-1.035799, 0.3997769, -1.19683, 1, 0.8509804, 0, 1,
-1.025941, 0.9683757, -2.385371, 1, 0.8588235, 0, 1,
-1.023288, 0.4057904, -1.07818, 1, 0.8627451, 0, 1,
-1.022713, 0.442562, -0.4441316, 1, 0.8705882, 0, 1,
-1.0221, -0.7993037, -1.553461, 1, 0.8745098, 0, 1,
-1.021198, -0.08654943, -1.597843, 1, 0.8823529, 0, 1,
-1.012549, -0.6103263, -2.397411, 1, 0.8862745, 0, 1,
-1.009898, 0.8086681, -1.077832, 1, 0.8941177, 0, 1,
-1.008486, 0.3550337, -2.479916, 1, 0.8980392, 0, 1,
-1.007106, -0.1927354, -2.413691, 1, 0.9058824, 0, 1,
-1.006915, 1.012946, 0.01498011, 1, 0.9137255, 0, 1,
-1.001984, -0.5044587, -1.712734, 1, 0.9176471, 0, 1,
-0.9996383, -0.8436877, -4.281049, 1, 0.9254902, 0, 1,
-0.9944131, -1.232574, -3.676356, 1, 0.9294118, 0, 1,
-0.9894494, -0.1171698, -0.1951089, 1, 0.9372549, 0, 1,
-0.9843414, 1.653499, -1.398434, 1, 0.9411765, 0, 1,
-0.975566, -0.3954683, -2.46013, 1, 0.9490196, 0, 1,
-0.9711064, 0.1036623, -2.839307, 1, 0.9529412, 0, 1,
-0.9684355, 0.8432522, -0.1038829, 1, 0.9607843, 0, 1,
-0.9667805, 0.6037062, -2.542841, 1, 0.9647059, 0, 1,
-0.9656045, -1.229602, -2.197541, 1, 0.972549, 0, 1,
-0.9648777, 0.6284264, -0.912111, 1, 0.9764706, 0, 1,
-0.9626531, 1.149228, -0.8790897, 1, 0.9843137, 0, 1,
-0.9622471, -2.189673, -3.223928, 1, 0.9882353, 0, 1,
-0.9550006, -0.3716675, -1.931618, 1, 0.9960784, 0, 1,
-0.9503679, 1.144906, -1.581139, 0.9960784, 1, 0, 1,
-0.9460186, 0.9074102, 0.0639504, 0.9921569, 1, 0, 1,
-0.9456475, -0.1648506, -1.266577, 0.9843137, 1, 0, 1,
-0.9428799, 0.5795086, -0.4649518, 0.9803922, 1, 0, 1,
-0.9422305, -0.5481388, 0.1709562, 0.972549, 1, 0, 1,
-0.940333, 1.704184, -0.165164, 0.9686275, 1, 0, 1,
-0.9394935, 0.4733494, -1.293391, 0.9607843, 1, 0, 1,
-0.9384309, 1.283793, -3.269863, 0.9568627, 1, 0, 1,
-0.9360461, -1.708999, -4.674269, 0.9490196, 1, 0, 1,
-0.9326201, -0.7715041, -3.498549, 0.945098, 1, 0, 1,
-0.9266204, -0.08200701, -1.957698, 0.9372549, 1, 0, 1,
-0.9250308, -0.03738788, -2.773929, 0.9333333, 1, 0, 1,
-0.9209164, -1.001502, -0.7576638, 0.9254902, 1, 0, 1,
-0.9186994, -0.3792644, -0.6037555, 0.9215686, 1, 0, 1,
-0.9043391, 0.3370324, -1.189452, 0.9137255, 1, 0, 1,
-0.9039382, -0.790604, -1.349018, 0.9098039, 1, 0, 1,
-0.9020185, -0.3553162, -1.303166, 0.9019608, 1, 0, 1,
-0.9003439, 1.490055, -1.773794, 0.8941177, 1, 0, 1,
-0.8997099, 0.6537812, -1.326333, 0.8901961, 1, 0, 1,
-0.8955405, -1.142887, -1.85019, 0.8823529, 1, 0, 1,
-0.8919463, -1.891406, -3.078888, 0.8784314, 1, 0, 1,
-0.8686028, 2.073469, -0.01318552, 0.8705882, 1, 0, 1,
-0.8604311, -0.08175051, -0.3716424, 0.8666667, 1, 0, 1,
-0.856584, -1.698235, -2.949617, 0.8588235, 1, 0, 1,
-0.8469409, 0.1086861, -1.166492, 0.854902, 1, 0, 1,
-0.8403517, 0.706448, -3.103297, 0.8470588, 1, 0, 1,
-0.8362089, 0.3674555, -0.3588184, 0.8431373, 1, 0, 1,
-0.8349589, 0.7745895, -1.039119, 0.8352941, 1, 0, 1,
-0.8325233, -1.154904, -2.923339, 0.8313726, 1, 0, 1,
-0.8321307, 1.304961, -1.628253, 0.8235294, 1, 0, 1,
-0.827858, -1.705648, -3.316008, 0.8196079, 1, 0, 1,
-0.826944, 0.2055589, -0.8227019, 0.8117647, 1, 0, 1,
-0.8245262, 0.5171023, -1.507887, 0.8078431, 1, 0, 1,
-0.816976, 0.01969481, 0.5870086, 0.8, 1, 0, 1,
-0.8151194, 0.8515456, -2.182731, 0.7921569, 1, 0, 1,
-0.8141656, -0.04776138, -2.403219, 0.7882353, 1, 0, 1,
-0.8124071, 1.303088, -0.3306456, 0.7803922, 1, 0, 1,
-0.810851, 0.6890123, -2.13274, 0.7764706, 1, 0, 1,
-0.8106442, -1.783026, -3.898713, 0.7686275, 1, 0, 1,
-0.8080983, -0.8057209, -2.079699, 0.7647059, 1, 0, 1,
-0.8074183, -0.9571053, -0.7208584, 0.7568628, 1, 0, 1,
-0.8030168, 0.09026703, -1.053151, 0.7529412, 1, 0, 1,
-0.7979341, 0.406693, -0.7070246, 0.7450981, 1, 0, 1,
-0.78918, -0.02723952, -1.852853, 0.7411765, 1, 0, 1,
-0.7844602, 1.016566, 0.1426313, 0.7333333, 1, 0, 1,
-0.7817836, 0.4868069, -1.088433, 0.7294118, 1, 0, 1,
-0.7787505, 0.1218226, -0.8035512, 0.7215686, 1, 0, 1,
-0.7756059, -0.3647854, -0.6510962, 0.7176471, 1, 0, 1,
-0.7715824, 0.3380433, -1.748527, 0.7098039, 1, 0, 1,
-0.7689719, -0.04942746, -1.421159, 0.7058824, 1, 0, 1,
-0.7672394, 1.457847, -1.108497, 0.6980392, 1, 0, 1,
-0.7668766, -0.3426564, -1.854243, 0.6901961, 1, 0, 1,
-0.7568911, 0.04224512, -0.7861308, 0.6862745, 1, 0, 1,
-0.7546693, 0.1022833, -0.6691542, 0.6784314, 1, 0, 1,
-0.7526735, 1.196691, -1.50664, 0.6745098, 1, 0, 1,
-0.7490082, 0.1951452, -0.02803966, 0.6666667, 1, 0, 1,
-0.746354, 0.5896469, -1.520919, 0.6627451, 1, 0, 1,
-0.7444778, -1.389764, -2.02432, 0.654902, 1, 0, 1,
-0.7440727, 0.027011, -2.008898, 0.6509804, 1, 0, 1,
-0.7375455, -1.002795, -2.811911, 0.6431373, 1, 0, 1,
-0.733753, 0.5281885, -0.02840351, 0.6392157, 1, 0, 1,
-0.7292951, -0.2866105, -3.056974, 0.6313726, 1, 0, 1,
-0.7271535, 1.192531, -0.3918679, 0.627451, 1, 0, 1,
-0.7260774, -0.6107216, -2.557523, 0.6196079, 1, 0, 1,
-0.7259648, 0.2553142, -1.293879, 0.6156863, 1, 0, 1,
-0.7246183, 0.4164852, -1.37062, 0.6078432, 1, 0, 1,
-0.7231771, 0.3912961, -1.002978, 0.6039216, 1, 0, 1,
-0.7230811, -0.7403384, -4.51831, 0.5960785, 1, 0, 1,
-0.71912, 0.602464, -0.3096482, 0.5882353, 1, 0, 1,
-0.7190992, -0.151737, -1.582564, 0.5843138, 1, 0, 1,
-0.7177962, -1.348221, -0.6310865, 0.5764706, 1, 0, 1,
-0.7140496, 1.951599, -1.197991, 0.572549, 1, 0, 1,
-0.7083292, 0.3715602, -0.5442274, 0.5647059, 1, 0, 1,
-0.7077672, -0.06831796, -2.595971, 0.5607843, 1, 0, 1,
-0.7064341, -0.4156137, -3.204693, 0.5529412, 1, 0, 1,
-0.7057714, -0.5226046, -2.421201, 0.5490196, 1, 0, 1,
-0.7052916, 0.2768147, -3.518426, 0.5411765, 1, 0, 1,
-0.7014743, 0.4223297, 0.0515336, 0.5372549, 1, 0, 1,
-0.6965234, 1.694991, 0.4505922, 0.5294118, 1, 0, 1,
-0.6848335, 0.5102157, -0.3114368, 0.5254902, 1, 0, 1,
-0.6829682, -2.363946, -2.852359, 0.5176471, 1, 0, 1,
-0.6792056, -0.9272251, -4.102655, 0.5137255, 1, 0, 1,
-0.6745114, 2.55096, -0.3278229, 0.5058824, 1, 0, 1,
-0.6725909, 0.224604, -0.9042538, 0.5019608, 1, 0, 1,
-0.6694601, 0.4226516, -0.4999399, 0.4941176, 1, 0, 1,
-0.6678446, -0.3432532, -3.264731, 0.4862745, 1, 0, 1,
-0.6618341, -0.5890419, -1.614181, 0.4823529, 1, 0, 1,
-0.6615165, 0.3760407, -3.428272, 0.4745098, 1, 0, 1,
-0.6577855, 1.541592, -0.4270148, 0.4705882, 1, 0, 1,
-0.6568294, -1.146532, -2.348662, 0.4627451, 1, 0, 1,
-0.6557398, 0.05234436, -1.08531, 0.4588235, 1, 0, 1,
-0.6555396, -2.041145, -3.506123, 0.4509804, 1, 0, 1,
-0.6479475, -0.09548694, -2.094564, 0.4470588, 1, 0, 1,
-0.6478775, 0.8915188, -0.340151, 0.4392157, 1, 0, 1,
-0.6393364, 0.4772653, -1.684753, 0.4352941, 1, 0, 1,
-0.6375624, 1.592612, -1.37186, 0.427451, 1, 0, 1,
-0.6244131, 0.7909074, -0.9504429, 0.4235294, 1, 0, 1,
-0.6221406, -0.4948204, -2.257146, 0.4156863, 1, 0, 1,
-0.6178098, 0.3118727, -0.777711, 0.4117647, 1, 0, 1,
-0.6090657, 0.9604757, -1.03807, 0.4039216, 1, 0, 1,
-0.6075037, 1.19485, 0.7674811, 0.3960784, 1, 0, 1,
-0.6064966, -1.202682, -1.69414, 0.3921569, 1, 0, 1,
-0.6043752, -1.070768, -1.290447, 0.3843137, 1, 0, 1,
-0.6036032, 0.4762447, -0.2193485, 0.3803922, 1, 0, 1,
-0.6030914, 0.1739875, 0.2267345, 0.372549, 1, 0, 1,
-0.5996408, -0.3070301, -2.06747, 0.3686275, 1, 0, 1,
-0.5981299, -0.8420101, -2.592609, 0.3607843, 1, 0, 1,
-0.59166, 0.1181419, -1.292906, 0.3568628, 1, 0, 1,
-0.5906959, 0.4467561, -0.4445064, 0.3490196, 1, 0, 1,
-0.5898515, -1.772239, -3.524417, 0.345098, 1, 0, 1,
-0.5897716, 1.627287, -2.749677, 0.3372549, 1, 0, 1,
-0.588115, 0.002351762, -2.444391, 0.3333333, 1, 0, 1,
-0.5806199, -0.5841845, -1.702014, 0.3254902, 1, 0, 1,
-0.5786763, -0.1313646, -3.074976, 0.3215686, 1, 0, 1,
-0.5775058, 0.1472243, -2.534597, 0.3137255, 1, 0, 1,
-0.5769423, -0.1407382, 0.5735644, 0.3098039, 1, 0, 1,
-0.5768685, 0.2521723, -0.4812794, 0.3019608, 1, 0, 1,
-0.5737144, 0.5110338, -0.8274395, 0.2941177, 1, 0, 1,
-0.5735487, -0.5706866, -2.81, 0.2901961, 1, 0, 1,
-0.5709425, -0.1799617, -2.034035, 0.282353, 1, 0, 1,
-0.5687056, 0.3709616, 0.2146963, 0.2784314, 1, 0, 1,
-0.5681255, 1.051029, 2.018655, 0.2705882, 1, 0, 1,
-0.564775, 1.520798, -0.5953658, 0.2666667, 1, 0, 1,
-0.5629402, 1.182968, -0.2966329, 0.2588235, 1, 0, 1,
-0.558624, -0.717879, -2.432011, 0.254902, 1, 0, 1,
-0.5560462, 1.805804, -0.4232883, 0.2470588, 1, 0, 1,
-0.5525694, 2.350157, -2.57112, 0.2431373, 1, 0, 1,
-0.5483791, 0.6362427, -2.044266, 0.2352941, 1, 0, 1,
-0.5481617, -1.07796, -3.649754, 0.2313726, 1, 0, 1,
-0.5464445, 0.8744277, -1.64692, 0.2235294, 1, 0, 1,
-0.5346252, 0.0310254, -0.3195154, 0.2196078, 1, 0, 1,
-0.5323309, 0.4756243, -0.402375, 0.2117647, 1, 0, 1,
-0.5272161, 0.5301477, 0.1288778, 0.2078431, 1, 0, 1,
-0.5261338, 1.601386, -1.446908, 0.2, 1, 0, 1,
-0.524824, -1.059168, -2.696273, 0.1921569, 1, 0, 1,
-0.5164751, 1.159462, -1.215262, 0.1882353, 1, 0, 1,
-0.5154557, -0.01558199, -1.796534, 0.1803922, 1, 0, 1,
-0.5150543, 0.8432053, -1.904714, 0.1764706, 1, 0, 1,
-0.5113507, -1.095662, -2.07584, 0.1686275, 1, 0, 1,
-0.5076942, -1.273178, -3.12423, 0.1647059, 1, 0, 1,
-0.50643, 0.9672086, 0.9318658, 0.1568628, 1, 0, 1,
-0.504865, -1.023462, -1.657442, 0.1529412, 1, 0, 1,
-0.5038189, -1.010978, -2.412606, 0.145098, 1, 0, 1,
-0.4963347, -1.576437, -1.766652, 0.1411765, 1, 0, 1,
-0.4963086, 0.5181897, -2.224137, 0.1333333, 1, 0, 1,
-0.4932838, -0.8358415, -3.395585, 0.1294118, 1, 0, 1,
-0.4916744, 0.5746272, -1.326867, 0.1215686, 1, 0, 1,
-0.4907965, 1.14436, 1.306248, 0.1176471, 1, 0, 1,
-0.4870438, -0.07286927, -1.263212, 0.1098039, 1, 0, 1,
-0.484513, 0.1087105, -2.682022, 0.1058824, 1, 0, 1,
-0.4772815, 0.5197442, -0.6367726, 0.09803922, 1, 0, 1,
-0.4765915, -0.02042034, -2.6232, 0.09019608, 1, 0, 1,
-0.4693317, -1.229062, -4.506044, 0.08627451, 1, 0, 1,
-0.4647347, 0.2890285, 0.3803162, 0.07843138, 1, 0, 1,
-0.4644613, 0.03270563, -3.019566, 0.07450981, 1, 0, 1,
-0.4641721, -0.5238923, -4.261157, 0.06666667, 1, 0, 1,
-0.4624645, -0.6886825, -3.719641, 0.0627451, 1, 0, 1,
-0.4621098, 1.80794, -0.007350239, 0.05490196, 1, 0, 1,
-0.4603246, -1.228002, -3.818749, 0.05098039, 1, 0, 1,
-0.4571838, 2.013439, -0.5011451, 0.04313726, 1, 0, 1,
-0.4562588, 0.1897582, 0.9095975, 0.03921569, 1, 0, 1,
-0.4538312, -0.1584105, -2.312112, 0.03137255, 1, 0, 1,
-0.4528995, -0.7508196, -3.090269, 0.02745098, 1, 0, 1,
-0.4515707, 0.3359313, -1.070447, 0.01960784, 1, 0, 1,
-0.4486151, -0.6049036, -1.640764, 0.01568628, 1, 0, 1,
-0.4465446, 1.413093, -1.375345, 0.007843138, 1, 0, 1,
-0.4447691, -0.8708748, -2.691039, 0.003921569, 1, 0, 1,
-0.4442055, 0.3866572, -1.222436, 0, 1, 0.003921569, 1,
-0.4439456, -0.7457252, -2.691814, 0, 1, 0.01176471, 1,
-0.4429878, -1.233207, -3.123765, 0, 1, 0.01568628, 1,
-0.4364901, -0.2861185, -2.696292, 0, 1, 0.02352941, 1,
-0.435062, 1.44985, -0.2997788, 0, 1, 0.02745098, 1,
-0.4344086, -1.812431, -2.251597, 0, 1, 0.03529412, 1,
-0.4334009, -1.140022, -2.112943, 0, 1, 0.03921569, 1,
-0.4302949, 0.5406815, -0.2309335, 0, 1, 0.04705882, 1,
-0.4268733, 0.4009719, 0.8999336, 0, 1, 0.05098039, 1,
-0.4267074, -0.7048965, -1.432588, 0, 1, 0.05882353, 1,
-0.4261441, -1.028305, -4.495586, 0, 1, 0.0627451, 1,
-0.4253935, -0.7066636, -2.59324, 0, 1, 0.07058824, 1,
-0.4251221, -1.65404, -3.194565, 0, 1, 0.07450981, 1,
-0.4190974, -1.73896, -2.796976, 0, 1, 0.08235294, 1,
-0.4170819, 0.2828958, 1.116446, 0, 1, 0.08627451, 1,
-0.4166472, -1.179845, -2.925121, 0, 1, 0.09411765, 1,
-0.4163865, -0.922249, -1.807234, 0, 1, 0.1019608, 1,
-0.41508, -0.2066659, -2.45366, 0, 1, 0.1058824, 1,
-0.4137204, 1.888026, 1.554894, 0, 1, 0.1137255, 1,
-0.4102819, -0.535834, -3.237624, 0, 1, 0.1176471, 1,
-0.4098985, 0.8316061, 0.4328613, 0, 1, 0.1254902, 1,
-0.4095514, -0.9190485, -3.50309, 0, 1, 0.1294118, 1,
-0.4090928, -1.334411, -4.108772, 0, 1, 0.1372549, 1,
-0.4011527, 1.018418, -1.243089, 0, 1, 0.1411765, 1,
-0.4010242, -0.6340364, -3.799707, 0, 1, 0.1490196, 1,
-0.4006471, 0.8019111, -0.1146787, 0, 1, 0.1529412, 1,
-0.3983892, -1.21053, -0.9602277, 0, 1, 0.1607843, 1,
-0.3962578, -0.4705241, -0.07663599, 0, 1, 0.1647059, 1,
-0.3935371, -0.472811, -3.170527, 0, 1, 0.172549, 1,
-0.3916414, -1.182271, -2.415306, 0, 1, 0.1764706, 1,
-0.3871864, -0.4301914, -3.328421, 0, 1, 0.1843137, 1,
-0.3821396, -1.41101, -3.44327, 0, 1, 0.1882353, 1,
-0.3794628, -0.1932823, -2.012594, 0, 1, 0.1960784, 1,
-0.3794446, 0.3581593, -0.3889824, 0, 1, 0.2039216, 1,
-0.3712367, -0.02171949, -1.677209, 0, 1, 0.2078431, 1,
-0.3687853, -0.02403064, -1.512717, 0, 1, 0.2156863, 1,
-0.3641798, 0.4368443, -0.703402, 0, 1, 0.2196078, 1,
-0.3582816, -0.2994795, -3.540938, 0, 1, 0.227451, 1,
-0.3565452, 0.5981407, -1.373714, 0, 1, 0.2313726, 1,
-0.3562308, 0.3905689, -1.945916, 0, 1, 0.2392157, 1,
-0.3559977, 0.3749679, -0.414964, 0, 1, 0.2431373, 1,
-0.3522913, -0.881851, -1.852641, 0, 1, 0.2509804, 1,
-0.3515795, 0.2321636, 0.06152058, 0, 1, 0.254902, 1,
-0.3502111, 0.1921154, -1.449568, 0, 1, 0.2627451, 1,
-0.3501014, -0.7845225, -1.761367, 0, 1, 0.2666667, 1,
-0.3488319, -1.592898, -3.974661, 0, 1, 0.2745098, 1,
-0.3462195, -0.4942697, -3.383957, 0, 1, 0.2784314, 1,
-0.3442005, 0.9459864, -1.14816, 0, 1, 0.2862745, 1,
-0.3441358, 0.3788555, -0.1439905, 0, 1, 0.2901961, 1,
-0.343768, 0.6239375, -1.375824, 0, 1, 0.2980392, 1,
-0.3353508, 2.053489, 1.43174, 0, 1, 0.3058824, 1,
-0.3269397, 1.569853, 1.558355, 0, 1, 0.3098039, 1,
-0.3257327, -0.3298995, -1.187195, 0, 1, 0.3176471, 1,
-0.3254492, -1.522702, -2.967359, 0, 1, 0.3215686, 1,
-0.3250567, -0.9364236, -0.6118604, 0, 1, 0.3294118, 1,
-0.3239973, 0.06285151, -1.009288, 0, 1, 0.3333333, 1,
-0.3234952, -1.963748, -3.392037, 0, 1, 0.3411765, 1,
-0.3173091, 0.7281086, -0.2605987, 0, 1, 0.345098, 1,
-0.3150164, 0.9741293, 0.3094271, 0, 1, 0.3529412, 1,
-0.3143877, -1.415877, -1.400385, 0, 1, 0.3568628, 1,
-0.3059431, -0.3853227, -3.354435, 0, 1, 0.3647059, 1,
-0.3052079, -1.345992, -2.374554, 0, 1, 0.3686275, 1,
-0.3001345, -0.8339063, -3.418761, 0, 1, 0.3764706, 1,
-0.2977396, 0.157804, -2.371078, 0, 1, 0.3803922, 1,
-0.2942257, -1.141223, -3.016804, 0, 1, 0.3882353, 1,
-0.2922416, 0.05576017, -1.088777, 0, 1, 0.3921569, 1,
-0.2860216, 1.361549, 0.7317806, 0, 1, 0.4, 1,
-0.2838647, 0.3476237, 0.6524141, 0, 1, 0.4078431, 1,
-0.2830422, -1.061543, -3.099261, 0, 1, 0.4117647, 1,
-0.2786644, 0.7067418, 0.2050558, 0, 1, 0.4196078, 1,
-0.275793, 0.7180321, -0.0699283, 0, 1, 0.4235294, 1,
-0.2756434, -0.2568348, -0.651231, 0, 1, 0.4313726, 1,
-0.2740526, -0.8850163, -1.876827, 0, 1, 0.4352941, 1,
-0.272943, 0.1450498, -0.2612436, 0, 1, 0.4431373, 1,
-0.2650995, -0.1153481, -1.168432, 0, 1, 0.4470588, 1,
-0.2628821, -0.2936021, -1.189966, 0, 1, 0.454902, 1,
-0.262293, 0.2311382, -3.069479, 0, 1, 0.4588235, 1,
-0.2562844, -0.647181, -2.268458, 0, 1, 0.4666667, 1,
-0.252976, -0.579243, -0.5383216, 0, 1, 0.4705882, 1,
-0.2500807, 1.743832, -1.916001, 0, 1, 0.4784314, 1,
-0.2485569, 0.05777619, -2.680058, 0, 1, 0.4823529, 1,
-0.248062, -0.4845402, -2.523197, 0, 1, 0.4901961, 1,
-0.2480063, -0.06313308, -2.362738, 0, 1, 0.4941176, 1,
-0.2421296, -0.2288604, -1.223793, 0, 1, 0.5019608, 1,
-0.2376168, -0.02670741, -1.9594, 0, 1, 0.509804, 1,
-0.2347996, 2.204058, -0.6958396, 0, 1, 0.5137255, 1,
-0.2254786, 0.7295702, 0.7315053, 0, 1, 0.5215687, 1,
-0.2174292, 0.03052785, -0.3620919, 0, 1, 0.5254902, 1,
-0.2173354, 0.2455798, 0.1812519, 0, 1, 0.5333334, 1,
-0.2170218, -0.3403234, -1.299354, 0, 1, 0.5372549, 1,
-0.2103577, -0.4443364, -3.497435, 0, 1, 0.5450981, 1,
-0.2090476, 0.2836407, -0.08936348, 0, 1, 0.5490196, 1,
-0.1984938, 0.03300738, -2.409906, 0, 1, 0.5568628, 1,
-0.1981218, -1.44185, -2.319108, 0, 1, 0.5607843, 1,
-0.1944717, -0.06092405, -3.541177, 0, 1, 0.5686275, 1,
-0.1931642, -0.09525809, -0.7272025, 0, 1, 0.572549, 1,
-0.191018, 1.618666, -0.1174508, 0, 1, 0.5803922, 1,
-0.1903575, 0.489319, 2.846235, 0, 1, 0.5843138, 1,
-0.1885367, 1.082129, 0.6642905, 0, 1, 0.5921569, 1,
-0.1883749, -0.3447963, -3.054915, 0, 1, 0.5960785, 1,
-0.1879478, 0.3239177, -2.938206, 0, 1, 0.6039216, 1,
-0.1813438, -0.1149676, -1.387773, 0, 1, 0.6117647, 1,
-0.1782992, 0.5353824, -0.4045678, 0, 1, 0.6156863, 1,
-0.1764266, -1.567638, -0.9561499, 0, 1, 0.6235294, 1,
-0.1688322, -0.6072435, -4.856873, 0, 1, 0.627451, 1,
-0.1680522, 1.034316, -1.911633, 0, 1, 0.6352941, 1,
-0.1620549, 1.416146, -0.2116707, 0, 1, 0.6392157, 1,
-0.1600738, 0.1045819, -0.7225984, 0, 1, 0.6470588, 1,
-0.1551594, -0.1181598, -2.829135, 0, 1, 0.6509804, 1,
-0.1542304, 3.263887, 2.433808, 0, 1, 0.6588235, 1,
-0.1486119, 0.1566244, 0.6282392, 0, 1, 0.6627451, 1,
-0.1484877, -1.434808, -2.797851, 0, 1, 0.6705883, 1,
-0.1476655, 2.320899, -0.5136011, 0, 1, 0.6745098, 1,
-0.1415842, -0.8142384, -2.385813, 0, 1, 0.682353, 1,
-0.1366594, 0.1644771, -1.849758, 0, 1, 0.6862745, 1,
-0.1352652, 0.8056458, -0.5849539, 0, 1, 0.6941177, 1,
-0.1317807, 0.07716887, -0.5861343, 0, 1, 0.7019608, 1,
-0.1317087, -1.55359, -4.104001, 0, 1, 0.7058824, 1,
-0.1297795, -0.3743722, -3.459469, 0, 1, 0.7137255, 1,
-0.1288117, 0.8027896, 0.6178442, 0, 1, 0.7176471, 1,
-0.1269822, -0.3343801, -2.890308, 0, 1, 0.7254902, 1,
-0.126968, 0.001182337, -0.7145146, 0, 1, 0.7294118, 1,
-0.1266838, -0.2549717, -1.342277, 0, 1, 0.7372549, 1,
-0.124231, 1.14474, -0.3485255, 0, 1, 0.7411765, 1,
-0.1209982, -0.536006, -3.137513, 0, 1, 0.7490196, 1,
-0.1205332, -1.396671, -2.653924, 0, 1, 0.7529412, 1,
-0.1163316, 0.1362787, -0.2689696, 0, 1, 0.7607843, 1,
-0.1100642, -0.2382854, -1.341521, 0, 1, 0.7647059, 1,
-0.1064276, -0.06691542, -2.102406, 0, 1, 0.772549, 1,
-0.100917, 0.03185338, 0.9955593, 0, 1, 0.7764706, 1,
-0.09432318, 1.487722, 0.6494405, 0, 1, 0.7843137, 1,
-0.09411988, -0.06860197, -3.202608, 0, 1, 0.7882353, 1,
-0.09299397, 0.3221482, -0.09282641, 0, 1, 0.7960784, 1,
-0.09199522, -1.720506, -1.976205, 0, 1, 0.8039216, 1,
-0.09146739, -1.161258, -3.163747, 0, 1, 0.8078431, 1,
-0.09128273, 0.2299401, -0.3295286, 0, 1, 0.8156863, 1,
-0.09091283, -0.1642464, -3.153209, 0, 1, 0.8196079, 1,
-0.08144021, 2.343808, -0.0425358, 0, 1, 0.827451, 1,
-0.08044688, 0.007210433, -1.080932, 0, 1, 0.8313726, 1,
-0.07998607, -1.244411, -4.009982, 0, 1, 0.8392157, 1,
-0.07917674, 0.573844, -2.922344, 0, 1, 0.8431373, 1,
-0.07816958, -1.462616, -1.923822, 0, 1, 0.8509804, 1,
-0.0776365, 0.7052773, 0.9776222, 0, 1, 0.854902, 1,
-0.07274292, -0.9349714, -2.944162, 0, 1, 0.8627451, 1,
-0.06861723, 1.402053, -0.6359501, 0, 1, 0.8666667, 1,
-0.06780178, -0.4058547, -1.499348, 0, 1, 0.8745098, 1,
-0.06512865, -1.366706, -2.897757, 0, 1, 0.8784314, 1,
-0.06235258, -0.4377573, -3.837689, 0, 1, 0.8862745, 1,
-0.06030595, 0.3817472, 0.03808996, 0, 1, 0.8901961, 1,
-0.06027186, -0.2370527, -2.027498, 0, 1, 0.8980392, 1,
-0.05428406, 0.3034332, -0.6817356, 0, 1, 0.9058824, 1,
-0.04860422, -1.120736, -3.527789, 0, 1, 0.9098039, 1,
-0.04750165, 0.6094175, 0.6797186, 0, 1, 0.9176471, 1,
-0.04397883, 1.271294, -1.208178, 0, 1, 0.9215686, 1,
-0.04380136, -0.156336, -3.24601, 0, 1, 0.9294118, 1,
-0.0425142, 1.536726, 1.456865, 0, 1, 0.9333333, 1,
-0.03435164, 0.1630908, -0.02944676, 0, 1, 0.9411765, 1,
-0.03243913, 0.1712747, 0.07947307, 0, 1, 0.945098, 1,
-0.03200907, 1.62761, -0.2364675, 0, 1, 0.9529412, 1,
-0.03039682, 0.7407609, -0.1052194, 0, 1, 0.9568627, 1,
-0.03029301, -1.319087, -2.483896, 0, 1, 0.9647059, 1,
-0.02882392, -0.0296237, -1.976672, 0, 1, 0.9686275, 1,
-0.02641043, 0.9112766, -0.9458663, 0, 1, 0.9764706, 1,
-0.01651439, 1.772079, 0.4818258, 0, 1, 0.9803922, 1,
-0.01643397, -0.4133013, -3.684998, 0, 1, 0.9882353, 1,
-0.01423863, 0.1552605, -1.395247, 0, 1, 0.9921569, 1,
-0.00983477, -0.1933642, -4.537881, 0, 1, 1, 1,
-0.009293269, -0.8805171, -2.605225, 0, 0.9921569, 1, 1,
-0.004597256, -0.3699886, -2.986861, 0, 0.9882353, 1, 1,
0.0004455145, 1.38358, -0.3630301, 0, 0.9803922, 1, 1,
0.006169514, 1.687267, 0.2127695, 0, 0.9764706, 1, 1,
0.01184994, -0.2153177, 2.786204, 0, 0.9686275, 1, 1,
0.01449514, 0.4856578, -0.6672535, 0, 0.9647059, 1, 1,
0.01564942, 0.172986, -1.890936, 0, 0.9568627, 1, 1,
0.01613974, 1.379517, -0.1086729, 0, 0.9529412, 1, 1,
0.02215087, -0.6233255, 0.7541021, 0, 0.945098, 1, 1,
0.02255261, 2.430588, 0.8505678, 0, 0.9411765, 1, 1,
0.02655926, -1.223826, 1.545943, 0, 0.9333333, 1, 1,
0.0284058, 1.469026, 0.8102614, 0, 0.9294118, 1, 1,
0.02919796, -0.2098613, 3.078159, 0, 0.9215686, 1, 1,
0.03133062, -1.942926, 2.586289, 0, 0.9176471, 1, 1,
0.03203665, -0.7076094, 3.088365, 0, 0.9098039, 1, 1,
0.03428866, 0.8650736, -0.7128803, 0, 0.9058824, 1, 1,
0.03646633, -0.2431115, 2.963559, 0, 0.8980392, 1, 1,
0.03865073, -0.7609021, 2.157731, 0, 0.8901961, 1, 1,
0.04227587, 0.6280134, -0.6166757, 0, 0.8862745, 1, 1,
0.04246939, 0.002163531, 2.415278, 0, 0.8784314, 1, 1,
0.04378552, -0.08060246, 3.078506, 0, 0.8745098, 1, 1,
0.04871795, -0.08272507, 2.609992, 0, 0.8666667, 1, 1,
0.04880562, 0.882758, 0.2030612, 0, 0.8627451, 1, 1,
0.04933425, 1.011454, 1.151858, 0, 0.854902, 1, 1,
0.05129144, -0.1766862, 2.569129, 0, 0.8509804, 1, 1,
0.05304616, -0.1257149, 3.621221, 0, 0.8431373, 1, 1,
0.05319925, 0.5062206, -0.5955593, 0, 0.8392157, 1, 1,
0.0562108, 0.1511934, 0.5190673, 0, 0.8313726, 1, 1,
0.05685944, -0.04579053, 1.54241, 0, 0.827451, 1, 1,
0.06004056, -0.3260112, 1.705093, 0, 0.8196079, 1, 1,
0.0601765, -0.7502058, 3.965642, 0, 0.8156863, 1, 1,
0.06273994, 1.489187, -0.2078811, 0, 0.8078431, 1, 1,
0.0644555, 0.01778989, 1.143844, 0, 0.8039216, 1, 1,
0.07034911, 1.237, 0.234167, 0, 0.7960784, 1, 1,
0.07093528, 0.1614727, 1.064702, 0, 0.7882353, 1, 1,
0.07616922, -0.2766511, 4.604473, 0, 0.7843137, 1, 1,
0.07659534, -1.615699, 3.545622, 0, 0.7764706, 1, 1,
0.07882122, -0.1320664, 1.110969, 0, 0.772549, 1, 1,
0.08025621, 0.3765437, 0.9966584, 0, 0.7647059, 1, 1,
0.08543893, -1.160186, 3.127479, 0, 0.7607843, 1, 1,
0.08581049, 0.3271154, 2.46143, 0, 0.7529412, 1, 1,
0.08587691, -1.511355, 4.686509, 0, 0.7490196, 1, 1,
0.08614072, -0.5651608, 1.908624, 0, 0.7411765, 1, 1,
0.08783579, 0.308898, -1.293555, 0, 0.7372549, 1, 1,
0.0931632, -1.580112, 2.857105, 0, 0.7294118, 1, 1,
0.09329744, 0.7869132, 0.2039545, 0, 0.7254902, 1, 1,
0.09477697, -1.201903, 3.00184, 0, 0.7176471, 1, 1,
0.09560583, 0.3093911, -0.01845498, 0, 0.7137255, 1, 1,
0.09808645, 1.55642, 0.3769025, 0, 0.7058824, 1, 1,
0.09813792, 1.072946, -0.8467205, 0, 0.6980392, 1, 1,
0.1013988, 0.4407733, 0.8243786, 0, 0.6941177, 1, 1,
0.103038, -0.1910111, 2.579697, 0, 0.6862745, 1, 1,
0.1048512, -0.3990493, 3.890553, 0, 0.682353, 1, 1,
0.1108479, -1.93764, 4.407133, 0, 0.6745098, 1, 1,
0.1138118, 0.6836739, -0.9823406, 0, 0.6705883, 1, 1,
0.1139182, -0.5175539, 2.489293, 0, 0.6627451, 1, 1,
0.1161481, -1.323145, 3.585563, 0, 0.6588235, 1, 1,
0.1180184, 0.4083593, 0.3037208, 0, 0.6509804, 1, 1,
0.1192319, 0.1496146, 0.261596, 0, 0.6470588, 1, 1,
0.1195055, 0.6817463, 0.78775, 0, 0.6392157, 1, 1,
0.1202652, 0.5006455, -0.6275898, 0, 0.6352941, 1, 1,
0.1228287, 0.1541861, -0.02450857, 0, 0.627451, 1, 1,
0.1257255, 0.8474541, 0.3969537, 0, 0.6235294, 1, 1,
0.1297896, 0.432467, -0.8157784, 0, 0.6156863, 1, 1,
0.1315652, -0.8398615, 3.434735, 0, 0.6117647, 1, 1,
0.1357925, -0.2495612, 2.75183, 0, 0.6039216, 1, 1,
0.1366712, 0.4940012, 2.29808, 0, 0.5960785, 1, 1,
0.1432777, -0.3285652, 0.7987908, 0, 0.5921569, 1, 1,
0.1517824, -0.8709731, 2.043333, 0, 0.5843138, 1, 1,
0.1545289, 1.072837, 1.590575, 0, 0.5803922, 1, 1,
0.1578786, 0.3725461, -0.6655678, 0, 0.572549, 1, 1,
0.1639127, -0.3737249, 2.556908, 0, 0.5686275, 1, 1,
0.1656304, -0.7288004, 2.744967, 0, 0.5607843, 1, 1,
0.166261, -0.1902985, 1.408488, 0, 0.5568628, 1, 1,
0.1700209, -1.313563, 2.493534, 0, 0.5490196, 1, 1,
0.1742062, -1.435467, 3.278286, 0, 0.5450981, 1, 1,
0.1744007, 2.032781, -1.206742, 0, 0.5372549, 1, 1,
0.1760083, -0.7163053, 2.447093, 0, 0.5333334, 1, 1,
0.1773353, 0.03365909, 0.1852953, 0, 0.5254902, 1, 1,
0.1800959, -0.2417564, 2.457699, 0, 0.5215687, 1, 1,
0.1821917, -0.9745043, 2.095621, 0, 0.5137255, 1, 1,
0.1835595, -0.6821481, 3.655398, 0, 0.509804, 1, 1,
0.1880391, 1.003269, -0.05769506, 0, 0.5019608, 1, 1,
0.1935638, 0.8539339, 0.2309011, 0, 0.4941176, 1, 1,
0.1976354, 0.0501251, 1.435702, 0, 0.4901961, 1, 1,
0.2021594, 1.179458, 2.072036, 0, 0.4823529, 1, 1,
0.2044872, 0.6851296, -0.3872703, 0, 0.4784314, 1, 1,
0.2137787, 0.6848889, 1.063633, 0, 0.4705882, 1, 1,
0.2145905, 0.04123185, 0.7766618, 0, 0.4666667, 1, 1,
0.2173866, 1.094676, -0.04772184, 0, 0.4588235, 1, 1,
0.2175995, -1.324391, 2.836523, 0, 0.454902, 1, 1,
0.2184584, 1.019092, -0.6842113, 0, 0.4470588, 1, 1,
0.2214005, 1.33339, 0.1919423, 0, 0.4431373, 1, 1,
0.2221875, 0.8807809, 0.01963714, 0, 0.4352941, 1, 1,
0.2238291, -0.1834873, 1.901126, 0, 0.4313726, 1, 1,
0.2246509, 1.206245, -1.14527, 0, 0.4235294, 1, 1,
0.2252642, 0.2470378, 1.828461, 0, 0.4196078, 1, 1,
0.2303889, 0.1930457, 1.763766, 0, 0.4117647, 1, 1,
0.2319693, 0.327654, -0.2285673, 0, 0.4078431, 1, 1,
0.2325771, 0.6831325, -0.5012998, 0, 0.4, 1, 1,
0.2344234, 0.6785905, 0.5988677, 0, 0.3921569, 1, 1,
0.2427553, -0.5994393, 3.43987, 0, 0.3882353, 1, 1,
0.2511956, -1.537716, 1.698838, 0, 0.3803922, 1, 1,
0.2575897, -0.5155319, 2.342076, 0, 0.3764706, 1, 1,
0.2596037, -0.2823528, 3.780785, 0, 0.3686275, 1, 1,
0.2598594, 0.1657727, 1.384416, 0, 0.3647059, 1, 1,
0.2646483, 0.6227608, -0.7715448, 0, 0.3568628, 1, 1,
0.2691328, 1.191001, 1.036133, 0, 0.3529412, 1, 1,
0.2734978, -0.9918894, 2.221344, 0, 0.345098, 1, 1,
0.2741643, -0.7125014, 1.627132, 0, 0.3411765, 1, 1,
0.2758432, -0.7451972, 0.7284973, 0, 0.3333333, 1, 1,
0.2762153, -1.900224, 1.428515, 0, 0.3294118, 1, 1,
0.2831689, -0.2739226, 4.354331, 0, 0.3215686, 1, 1,
0.2838323, 1.340792, -0.2675985, 0, 0.3176471, 1, 1,
0.2866509, -1.21004, 1.903701, 0, 0.3098039, 1, 1,
0.2883162, -1.366276, 4.249035, 0, 0.3058824, 1, 1,
0.2901284, -0.6120054, 0.1600261, 0, 0.2980392, 1, 1,
0.2918767, -1.232347, 2.534734, 0, 0.2901961, 1, 1,
0.2956995, 0.2738703, -0.3030216, 0, 0.2862745, 1, 1,
0.3014723, -1.289933, 2.954588, 0, 0.2784314, 1, 1,
0.3025084, -0.9554085, 3.808285, 0, 0.2745098, 1, 1,
0.3055634, -1.399098, 4.615736, 0, 0.2666667, 1, 1,
0.3070727, 0.01894948, 0.6702605, 0, 0.2627451, 1, 1,
0.3079775, 0.1405852, 1.120655, 0, 0.254902, 1, 1,
0.3092783, -1.243188, 3.669954, 0, 0.2509804, 1, 1,
0.3105525, -0.242192, 3.893492, 0, 0.2431373, 1, 1,
0.3112048, 0.8195079, 0.01483095, 0, 0.2392157, 1, 1,
0.312328, -1.032859, 2.737329, 0, 0.2313726, 1, 1,
0.3188714, 0.9167067, 0.7142107, 0, 0.227451, 1, 1,
0.3230762, -0.9939311, 2.087536, 0, 0.2196078, 1, 1,
0.3303715, -0.4383554, 2.299668, 0, 0.2156863, 1, 1,
0.3309208, 0.499887, 0.9044202, 0, 0.2078431, 1, 1,
0.3319628, 1.385954, -0.1135751, 0, 0.2039216, 1, 1,
0.332346, 0.3295367, 0.1054628, 0, 0.1960784, 1, 1,
0.3329252, 0.3344969, 0.2594534, 0, 0.1882353, 1, 1,
0.337696, -0.7917511, 3.826217, 0, 0.1843137, 1, 1,
0.3379159, -0.1896088, 0.6848402, 0, 0.1764706, 1, 1,
0.339368, 1.332957, 0.827386, 0, 0.172549, 1, 1,
0.3404806, 0.7232268, 1.415227, 0, 0.1647059, 1, 1,
0.3464935, 0.1969872, 2.448874, 0, 0.1607843, 1, 1,
0.3702939, 0.006036464, 2.44579, 0, 0.1529412, 1, 1,
0.3742502, -2.061355, 2.078493, 0, 0.1490196, 1, 1,
0.3744148, 0.9981599, 0.8022369, 0, 0.1411765, 1, 1,
0.3746973, 0.4165556, -0.2530442, 0, 0.1372549, 1, 1,
0.379912, -0.4901502, 1.589687, 0, 0.1294118, 1, 1,
0.3920352, -0.6690593, 3.097829, 0, 0.1254902, 1, 1,
0.4004933, 0.4630747, 0.8572327, 0, 0.1176471, 1, 1,
0.4012078, -1.466123, 2.345826, 0, 0.1137255, 1, 1,
0.4014258, -0.686774, 2.570213, 0, 0.1058824, 1, 1,
0.4014327, -1.627956, 2.726633, 0, 0.09803922, 1, 1,
0.404446, -0.7254537, 3.511615, 0, 0.09411765, 1, 1,
0.4051959, 0.6251786, 2.373671, 0, 0.08627451, 1, 1,
0.4082988, -0.1209924, -0.5551269, 0, 0.08235294, 1, 1,
0.4083572, -0.4926582, 3.551195, 0, 0.07450981, 1, 1,
0.4121732, 1.196856, 0.207899, 0, 0.07058824, 1, 1,
0.4143503, -0.3183563, 3.380532, 0, 0.0627451, 1, 1,
0.4165486, 0.1412742, 1.651941, 0, 0.05882353, 1, 1,
0.4168181, 1.461712, -0.8296354, 0, 0.05098039, 1, 1,
0.4197396, 1.080457, 0.8016811, 0, 0.04705882, 1, 1,
0.4261056, 0.2023194, 1.933381, 0, 0.03921569, 1, 1,
0.4271621, -0.3912753, 2.950472, 0, 0.03529412, 1, 1,
0.4275596, -1.399383, 1.481268, 0, 0.02745098, 1, 1,
0.4279002, 0.7663279, 0.04558967, 0, 0.02352941, 1, 1,
0.4283388, 0.2940489, 3.60903, 0, 0.01568628, 1, 1,
0.4287801, 0.9210336, 0.007890017, 0, 0.01176471, 1, 1,
0.4306489, -0.2382027, 1.421238, 0, 0.003921569, 1, 1,
0.4308978, 0.06665637, 1.608804, 0.003921569, 0, 1, 1,
0.4311074, 0.6822578, 0.1879345, 0.007843138, 0, 1, 1,
0.4320808, 0.6003206, -0.6261349, 0.01568628, 0, 1, 1,
0.4334621, 0.7587832, 1.039644, 0.01960784, 0, 1, 1,
0.4361089, -1.071021, 2.636401, 0.02745098, 0, 1, 1,
0.4365864, 0.6888321, 0.04962775, 0.03137255, 0, 1, 1,
0.4380246, 1.528349, -1.114033, 0.03921569, 0, 1, 1,
0.4425699, 0.6474767, -1.727524, 0.04313726, 0, 1, 1,
0.4429911, 0.6806898, -0.587876, 0.05098039, 0, 1, 1,
0.4453705, 1.248846, -0.2840175, 0.05490196, 0, 1, 1,
0.4475542, 0.1228137, 1.886443, 0.0627451, 0, 1, 1,
0.4568583, -1.211689, 2.8437, 0.06666667, 0, 1, 1,
0.457279, 0.1832599, 2.466159, 0.07450981, 0, 1, 1,
0.4595675, 1.888843, 2.193959, 0.07843138, 0, 1, 1,
0.4636633, -0.8390405, 2.640745, 0.08627451, 0, 1, 1,
0.4649744, -0.8462474, 3.311464, 0.09019608, 0, 1, 1,
0.4666793, -0.4455581, 1.805828, 0.09803922, 0, 1, 1,
0.4678324, -0.5949066, 2.326188, 0.1058824, 0, 1, 1,
0.4681493, 0.2195508, 0.9484193, 0.1098039, 0, 1, 1,
0.4699568, -0.004847409, -0.005804929, 0.1176471, 0, 1, 1,
0.471599, -0.8882489, 3.148344, 0.1215686, 0, 1, 1,
0.4729894, 0.6060981, 0.9299351, 0.1294118, 0, 1, 1,
0.4825605, 0.9483688, 0.1307242, 0.1333333, 0, 1, 1,
0.4850471, 0.7000433, 0.7435622, 0.1411765, 0, 1, 1,
0.4863089, -1.123531, 1.799204, 0.145098, 0, 1, 1,
0.4878492, -0.07229112, 1.284676, 0.1529412, 0, 1, 1,
0.4923213, 0.2345462, 0.2702579, 0.1568628, 0, 1, 1,
0.4949772, 1.22116, 0.3742004, 0.1647059, 0, 1, 1,
0.4959616, 0.1248679, 1.563277, 0.1686275, 0, 1, 1,
0.4967747, -0.07788514, 1.603193, 0.1764706, 0, 1, 1,
0.4968457, 0.5635381, 2.632196, 0.1803922, 0, 1, 1,
0.5009649, 0.1849086, 2.891701, 0.1882353, 0, 1, 1,
0.5055569, 0.8634388, 0.3289161, 0.1921569, 0, 1, 1,
0.5080231, -0.4163313, 1.498426, 0.2, 0, 1, 1,
0.5097339, 0.3636181, 2.842533, 0.2078431, 0, 1, 1,
0.5104293, 0.1524826, 0.8023562, 0.2117647, 0, 1, 1,
0.5116758, -0.2427071, 1.396889, 0.2196078, 0, 1, 1,
0.5164852, -0.2729422, 2.630118, 0.2235294, 0, 1, 1,
0.5165415, -0.5779828, 1.555236, 0.2313726, 0, 1, 1,
0.5183447, -0.1848842, 1.896516, 0.2352941, 0, 1, 1,
0.5205257, -0.5095457, 2.511121, 0.2431373, 0, 1, 1,
0.5207646, -0.805779, 3.256524, 0.2470588, 0, 1, 1,
0.5265107, 0.06268152, 2.182594, 0.254902, 0, 1, 1,
0.5303237, -0.5917816, 4.410196, 0.2588235, 0, 1, 1,
0.5312724, 1.167552, 0.2589246, 0.2666667, 0, 1, 1,
0.5347666, 0.6196231, 2.535945, 0.2705882, 0, 1, 1,
0.5417876, -0.8630785, 1.399691, 0.2784314, 0, 1, 1,
0.5444441, 0.4836504, 2.038091, 0.282353, 0, 1, 1,
0.5541778, 0.9653714, 0.3772089, 0.2901961, 0, 1, 1,
0.5555718, 0.5211759, 0.4301845, 0.2941177, 0, 1, 1,
0.5564864, -0.662693, 2.763485, 0.3019608, 0, 1, 1,
0.5578831, -0.2531869, 3.007337, 0.3098039, 0, 1, 1,
0.5654137, -1.011121, 1.841334, 0.3137255, 0, 1, 1,
0.5719322, 0.782023, 0.4201185, 0.3215686, 0, 1, 1,
0.5727407, -0.5336062, 2.767128, 0.3254902, 0, 1, 1,
0.5760017, -0.9375236, 1.539735, 0.3333333, 0, 1, 1,
0.5783337, -0.6518762, 4.089779, 0.3372549, 0, 1, 1,
0.5846117, -0.7450628, 2.257566, 0.345098, 0, 1, 1,
0.586616, 0.2746263, 3.090844, 0.3490196, 0, 1, 1,
0.5873078, -0.5108237, 3.811543, 0.3568628, 0, 1, 1,
0.5915761, 0.5514168, 0.01142055, 0.3607843, 0, 1, 1,
0.5920824, -0.4382407, 3.301825, 0.3686275, 0, 1, 1,
0.5927613, 0.6021102, 0.6185099, 0.372549, 0, 1, 1,
0.5973571, 0.1699732, 0.2031861, 0.3803922, 0, 1, 1,
0.5980257, 1.044137, 0.3969232, 0.3843137, 0, 1, 1,
0.6048741, 0.2304889, 0.3125973, 0.3921569, 0, 1, 1,
0.6057481, -0.8330494, 2.237741, 0.3960784, 0, 1, 1,
0.6081497, 0.8710604, -0.1281219, 0.4039216, 0, 1, 1,
0.6150828, 0.2408167, -0.383459, 0.4117647, 0, 1, 1,
0.625043, 0.2986816, -0.613966, 0.4156863, 0, 1, 1,
0.6303357, 1.593702, -1.578213, 0.4235294, 0, 1, 1,
0.6321145, -0.2454301, 1.231865, 0.427451, 0, 1, 1,
0.6338689, 2.527769, 1.506043, 0.4352941, 0, 1, 1,
0.6343578, 0.102687, 0.3342981, 0.4392157, 0, 1, 1,
0.6346546, 2.958831, 0.1612385, 0.4470588, 0, 1, 1,
0.6396495, 2.220681, -0.9248136, 0.4509804, 0, 1, 1,
0.6428141, 1.780418, -0.2649219, 0.4588235, 0, 1, 1,
0.6536277, 0.1434979, 1.525694, 0.4627451, 0, 1, 1,
0.6575243, 0.3771878, 1.968642, 0.4705882, 0, 1, 1,
0.6606479, 1.143855, 0.8665112, 0.4745098, 0, 1, 1,
0.6650291, 1.188509, 1.396747, 0.4823529, 0, 1, 1,
0.6662117, 0.1059845, 1.419787, 0.4862745, 0, 1, 1,
0.673709, 0.3554907, 1.657465, 0.4941176, 0, 1, 1,
0.6756038, 0.4868613, 1.671917, 0.5019608, 0, 1, 1,
0.6786464, -1.363217, 4.075227, 0.5058824, 0, 1, 1,
0.6790473, 0.2469025, 2.060303, 0.5137255, 0, 1, 1,
0.6814576, 0.1388663, 2.7555, 0.5176471, 0, 1, 1,
0.6848178, 0.7618499, 0.7888963, 0.5254902, 0, 1, 1,
0.686592, -0.3141932, 3.045551, 0.5294118, 0, 1, 1,
0.686737, 0.6775648, 1.17151, 0.5372549, 0, 1, 1,
0.686955, -1.674075, 4.049739, 0.5411765, 0, 1, 1,
0.6897292, 0.4478368, 2.171215, 0.5490196, 0, 1, 1,
0.6985658, -0.7944518, 2.64273, 0.5529412, 0, 1, 1,
0.6990182, 0.6469643, 1.816072, 0.5607843, 0, 1, 1,
0.7010402, 0.9805539, 0.2767458, 0.5647059, 0, 1, 1,
0.7060597, -1.966359, 2.024024, 0.572549, 0, 1, 1,
0.7110385, 1.086493, -0.5010693, 0.5764706, 0, 1, 1,
0.7166862, -0.07346368, 1.257311, 0.5843138, 0, 1, 1,
0.7167685, 0.149261, 0.1498305, 0.5882353, 0, 1, 1,
0.7192538, 0.932657, 1.202436, 0.5960785, 0, 1, 1,
0.7240695, -0.08008891, 2.769248, 0.6039216, 0, 1, 1,
0.7243347, 1.142833, 0.2876962, 0.6078432, 0, 1, 1,
0.724463, 0.01970376, 1.838677, 0.6156863, 0, 1, 1,
0.7262452, -0.1427149, 3.204732, 0.6196079, 0, 1, 1,
0.7311355, -0.4252673, 2.988616, 0.627451, 0, 1, 1,
0.7338459, -0.6950251, 2.31164, 0.6313726, 0, 1, 1,
0.737434, -0.9414071, 2.846277, 0.6392157, 0, 1, 1,
0.7405409, 0.736632, 2.262716, 0.6431373, 0, 1, 1,
0.74489, 2.068701, -0.3402944, 0.6509804, 0, 1, 1,
0.7455224, 0.1606444, 1.344834, 0.654902, 0, 1, 1,
0.7533527, 0.7145258, 1.664489, 0.6627451, 0, 1, 1,
0.7550805, -1.341221, 2.758218, 0.6666667, 0, 1, 1,
0.7568262, 1.09979, -0.1962395, 0.6745098, 0, 1, 1,
0.7581619, 0.8028879, 0.1927697, 0.6784314, 0, 1, 1,
0.7643743, 1.884023, 0.6435996, 0.6862745, 0, 1, 1,
0.7653283, 1.640166, 0.517328, 0.6901961, 0, 1, 1,
0.7689924, 0.625172, 1.446209, 0.6980392, 0, 1, 1,
0.7697397, -0.3469197, 0.9026936, 0.7058824, 0, 1, 1,
0.776934, 0.2644469, 1.199679, 0.7098039, 0, 1, 1,
0.7775899, -0.6518795, 4.158879, 0.7176471, 0, 1, 1,
0.7790564, -0.5837138, 2.561965, 0.7215686, 0, 1, 1,
0.7908804, 0.2475263, 1.404444, 0.7294118, 0, 1, 1,
0.8000188, 0.1915737, 1.244999, 0.7333333, 0, 1, 1,
0.80582, 1.966996, 1.48211, 0.7411765, 0, 1, 1,
0.8088603, -0.9073321, 3.731045, 0.7450981, 0, 1, 1,
0.8140721, 0.7488438, 2.628485, 0.7529412, 0, 1, 1,
0.8262631, -2.666605, 2.854214, 0.7568628, 0, 1, 1,
0.832309, -0.5602091, 1.482307, 0.7647059, 0, 1, 1,
0.8352256, -0.386481, -0.5441303, 0.7686275, 0, 1, 1,
0.8395321, -0.2890199, 3.059906, 0.7764706, 0, 1, 1,
0.8468679, -0.7255104, 2.781992, 0.7803922, 0, 1, 1,
0.8546481, -0.7773342, 3.101823, 0.7882353, 0, 1, 1,
0.8563674, -1.081986, 3.007258, 0.7921569, 0, 1, 1,
0.8573762, -1.396449, 4.942889, 0.8, 0, 1, 1,
0.8581893, 0.4703147, 0.5079952, 0.8078431, 0, 1, 1,
0.8588169, -0.06557405, 2.260864, 0.8117647, 0, 1, 1,
0.8650644, 1.649356, 0.3320787, 0.8196079, 0, 1, 1,
0.8671038, -0.1967336, 2.652179, 0.8235294, 0, 1, 1,
0.8694241, 0.5676453, 0.3673354, 0.8313726, 0, 1, 1,
0.8695851, 0.1736289, 2.717962, 0.8352941, 0, 1, 1,
0.8704945, 0.3807368, 2.143559, 0.8431373, 0, 1, 1,
0.8762993, 0.4370565, 0.7565103, 0.8470588, 0, 1, 1,
0.886367, -0.1015064, 2.351087, 0.854902, 0, 1, 1,
0.8887301, -0.2513318, 1.077904, 0.8588235, 0, 1, 1,
0.8925623, -0.8146302, 2.773289, 0.8666667, 0, 1, 1,
0.8980535, -0.3120421, 2.361939, 0.8705882, 0, 1, 1,
0.9079269, -0.2074464, 1.277022, 0.8784314, 0, 1, 1,
0.9125181, 1.545016, 1.364387, 0.8823529, 0, 1, 1,
0.9151431, -1.041744, 2.115775, 0.8901961, 0, 1, 1,
0.9178915, 0.3238512, 0.5717743, 0.8941177, 0, 1, 1,
0.9195384, -1.214896, 3.887573, 0.9019608, 0, 1, 1,
0.9207484, -1.496657, 1.698756, 0.9098039, 0, 1, 1,
0.9207827, -0.9493663, 2.625022, 0.9137255, 0, 1, 1,
0.9215252, 0.2189878, 2.581179, 0.9215686, 0, 1, 1,
0.9221633, -1.299373, 2.596195, 0.9254902, 0, 1, 1,
0.9264685, 1.862886, 0.7290293, 0.9333333, 0, 1, 1,
0.9324343, -0.7129195, 2.051908, 0.9372549, 0, 1, 1,
0.9328611, 0.42487, 0.5892211, 0.945098, 0, 1, 1,
0.9336736, -0.9624451, 0.157333, 0.9490196, 0, 1, 1,
0.9337107, -0.03927541, 0.3885294, 0.9568627, 0, 1, 1,
0.9354877, -1.536236, 2.124524, 0.9607843, 0, 1, 1,
0.9377359, 0.7241991, 1.943709, 0.9686275, 0, 1, 1,
0.9442763, -2.98602, 3.115857, 0.972549, 0, 1, 1,
0.9449441, 1.913048, 2.327142, 0.9803922, 0, 1, 1,
0.951223, -1.037923, 3.150069, 0.9843137, 0, 1, 1,
0.9524747, -1.96333, 3.172769, 0.9921569, 0, 1, 1,
0.9567031, -0.3281196, 0.3137523, 0.9960784, 0, 1, 1,
0.9570631, 0.1909551, 2.309017, 1, 0, 0.9960784, 1,
0.9593953, -0.1509695, 2.332142, 1, 0, 0.9882353, 1,
0.9713083, -1.571001, 3.366153, 1, 0, 0.9843137, 1,
0.9743342, 0.02572623, -0.3715645, 1, 0, 0.9764706, 1,
0.977275, 0.3240314, -0.7414333, 1, 0, 0.972549, 1,
0.9810693, 0.09386438, 1.300115, 1, 0, 0.9647059, 1,
0.9899343, -0.4123472, 3.519143, 1, 0, 0.9607843, 1,
0.995669, -0.1639936, 1.30024, 1, 0, 0.9529412, 1,
0.9961922, -0.5848452, 1.789053, 1, 0, 0.9490196, 1,
0.996661, -0.829568, 3.574442, 1, 0, 0.9411765, 1,
0.9996226, -1.725291, 4.235161, 1, 0, 0.9372549, 1,
1.000828, -0.6306821, 1.100462, 1, 0, 0.9294118, 1,
1.00176, -1.6454, 1.471208, 1, 0, 0.9254902, 1,
1.001943, -0.2010783, 1.230656, 1, 0, 0.9176471, 1,
1.003113, 0.3686101, 1.057721, 1, 0, 0.9137255, 1,
1.003341, -0.8334843, 2.080215, 1, 0, 0.9058824, 1,
1.007714, 0.7915818, 1.474224, 1, 0, 0.9019608, 1,
1.013374, -0.09752356, 3.611306, 1, 0, 0.8941177, 1,
1.014639, 1.670304, 1.874718, 1, 0, 0.8862745, 1,
1.015009, -0.6559674, 1.854658, 1, 0, 0.8823529, 1,
1.027385, -0.2443002, -0.322864, 1, 0, 0.8745098, 1,
1.027489, -0.4404208, 2.688566, 1, 0, 0.8705882, 1,
1.028525, -0.7549905, 0.9292381, 1, 0, 0.8627451, 1,
1.035415, 0.9796697, -0.1126121, 1, 0, 0.8588235, 1,
1.040937, -0.2506955, 1.621529, 1, 0, 0.8509804, 1,
1.042919, -1.777947, 4.074063, 1, 0, 0.8470588, 1,
1.053399, 0.6206305, 1.382847, 1, 0, 0.8392157, 1,
1.055485, 0.4282086, 1.570256, 1, 0, 0.8352941, 1,
1.056001, -1.536446, 3.27322, 1, 0, 0.827451, 1,
1.057327, 0.1444545, 2.203145, 1, 0, 0.8235294, 1,
1.058646, -0.4909297, 2.149077, 1, 0, 0.8156863, 1,
1.075556, -1.283771, 1.905673, 1, 0, 0.8117647, 1,
1.07936, -1.22251, 3.833236, 1, 0, 0.8039216, 1,
1.08243, 0.2431168, 1.787057, 1, 0, 0.7960784, 1,
1.085202, 0.7525792, 2.041555, 1, 0, 0.7921569, 1,
1.086914, 1.385951, 0.2958273, 1, 0, 0.7843137, 1,
1.091265, -0.2085559, 2.075258, 1, 0, 0.7803922, 1,
1.1055, 0.07556556, 0.6364679, 1, 0, 0.772549, 1,
1.116683, -0.5561805, 2.212959, 1, 0, 0.7686275, 1,
1.124412, 0.8398015, 0.6953097, 1, 0, 0.7607843, 1,
1.134559, -1.497715, 3.51294, 1, 0, 0.7568628, 1,
1.135396, -2.577249, 3.858503, 1, 0, 0.7490196, 1,
1.143183, 0.8662443, -1.548601, 1, 0, 0.7450981, 1,
1.147823, -0.3684073, 1.955754, 1, 0, 0.7372549, 1,
1.155371, -0.3120591, 1.459761, 1, 0, 0.7333333, 1,
1.155953, -0.5992476, 2.473327, 1, 0, 0.7254902, 1,
1.157507, -0.6290373, 2.810591, 1, 0, 0.7215686, 1,
1.159312, -0.5207039, 4.092706, 1, 0, 0.7137255, 1,
1.160675, -1.748376, 2.218713, 1, 0, 0.7098039, 1,
1.166517, 1.891197, 1.689756, 1, 0, 0.7019608, 1,
1.174872, -1.169812, 1.049459, 1, 0, 0.6941177, 1,
1.176388, 0.1629256, 1.848588, 1, 0, 0.6901961, 1,
1.193843, 0.3315059, 0.5726998, 1, 0, 0.682353, 1,
1.194835, -1.434038, 2.00563, 1, 0, 0.6784314, 1,
1.202087, 1.007444, 0.4001331, 1, 0, 0.6705883, 1,
1.209842, -0.1281825, 3.540488, 1, 0, 0.6666667, 1,
1.210162, -1.299062, 1.522181, 1, 0, 0.6588235, 1,
1.211394, -0.5800611, 3.43835, 1, 0, 0.654902, 1,
1.211615, -0.7915772, 2.083119, 1, 0, 0.6470588, 1,
1.216214, -1.012125, 2.557206, 1, 0, 0.6431373, 1,
1.229268, -0.5167553, 2.851122, 1, 0, 0.6352941, 1,
1.238994, 1.612392, 0.7900758, 1, 0, 0.6313726, 1,
1.243742, -0.4493134, 2.568602, 1, 0, 0.6235294, 1,
1.247529, -1.638007, 3.015646, 1, 0, 0.6196079, 1,
1.248854, -2.73912, 1.927, 1, 0, 0.6117647, 1,
1.256536, -1.106152, 1.150999, 1, 0, 0.6078432, 1,
1.280393, -0.1956322, 0.8351402, 1, 0, 0.6, 1,
1.291631, 0.4646308, 2.09868, 1, 0, 0.5921569, 1,
1.293219, -3.077507, 2.811762, 1, 0, 0.5882353, 1,
1.294344, -0.7197174, 4.196304, 1, 0, 0.5803922, 1,
1.302669, -1.161651, 1.690884, 1, 0, 0.5764706, 1,
1.304193, -0.1884242, 0.8672537, 1, 0, 0.5686275, 1,
1.309903, 1.64443, 1.592952, 1, 0, 0.5647059, 1,
1.314871, 0.3561325, 1.390064, 1, 0, 0.5568628, 1,
1.323487, -0.3382854, 0.004661113, 1, 0, 0.5529412, 1,
1.327004, -0.5860344, 1.202812, 1, 0, 0.5450981, 1,
1.331461, 0.7279533, -0.1322848, 1, 0, 0.5411765, 1,
1.331932, -0.5434153, -0.168718, 1, 0, 0.5333334, 1,
1.341606, -0.08438282, 3.298501, 1, 0, 0.5294118, 1,
1.346391, -0.4433872, 1.88205, 1, 0, 0.5215687, 1,
1.348681, -2.433009, 3.902795, 1, 0, 0.5176471, 1,
1.355134, -2.081037, 2.40493, 1, 0, 0.509804, 1,
1.370123, -1.50662, 0.6129122, 1, 0, 0.5058824, 1,
1.372073, -1.075657, 1.278186, 1, 0, 0.4980392, 1,
1.375789, -0.7159894, 1.017571, 1, 0, 0.4901961, 1,
1.383557, -0.0396715, 0.6806659, 1, 0, 0.4862745, 1,
1.393704, 0.01946778, 1.754557, 1, 0, 0.4784314, 1,
1.406911, 0.2271559, 1.553129, 1, 0, 0.4745098, 1,
1.409107, -1.418923, 2.963387, 1, 0, 0.4666667, 1,
1.410371, 0.3501999, 1.27093, 1, 0, 0.4627451, 1,
1.418392, 0.4361381, 1.11382, 1, 0, 0.454902, 1,
1.420942, -0.0696228, 3.822911, 1, 0, 0.4509804, 1,
1.425364, 0.565773, 0.7101726, 1, 0, 0.4431373, 1,
1.432781, -0.2912783, 2.330651, 1, 0, 0.4392157, 1,
1.435838, 1.491096, 2.404068, 1, 0, 0.4313726, 1,
1.454748, -0.4457546, 1.597627, 1, 0, 0.427451, 1,
1.470133, 0.8135771, 2.161508, 1, 0, 0.4196078, 1,
1.470686, 0.3217121, 1.309469, 1, 0, 0.4156863, 1,
1.474293, 0.3688216, 0.4788632, 1, 0, 0.4078431, 1,
1.479763, 1.633475, 2.855271, 1, 0, 0.4039216, 1,
1.48177, -0.5110269, 2.076206, 1, 0, 0.3960784, 1,
1.503481, 0.6162027, 1.498186, 1, 0, 0.3882353, 1,
1.506587, 1.203338, 1.523674, 1, 0, 0.3843137, 1,
1.510596, 1.410578, 0.7753508, 1, 0, 0.3764706, 1,
1.511428, 1.855068, 1.251658, 1, 0, 0.372549, 1,
1.519774, 0.01034402, 1.777725, 1, 0, 0.3647059, 1,
1.529291, -1.016832, 2.667997, 1, 0, 0.3607843, 1,
1.538594, -0.1338066, 2.572641, 1, 0, 0.3529412, 1,
1.548368, 1.512433, 1.881612, 1, 0, 0.3490196, 1,
1.551252, -0.1332102, 1.138015, 1, 0, 0.3411765, 1,
1.576045, -0.5655693, 1.232913, 1, 0, 0.3372549, 1,
1.58039, 0.03465262, 1.333321, 1, 0, 0.3294118, 1,
1.582039, 0.2755983, 1.671509, 1, 0, 0.3254902, 1,
1.582181, -0.06024167, 0.8585507, 1, 0, 0.3176471, 1,
1.585571, -2.541695, 1.407254, 1, 0, 0.3137255, 1,
1.618184, 0.8750112, 0.7610438, 1, 0, 0.3058824, 1,
1.624979, 0.3110241, 1.345923, 1, 0, 0.2980392, 1,
1.633075, -0.5750557, 2.732152, 1, 0, 0.2941177, 1,
1.633205, -0.8954644, 2.690837, 1, 0, 0.2862745, 1,
1.63704, 0.8926934, 1.590576, 1, 0, 0.282353, 1,
1.654327, 1.940431, -1.57923, 1, 0, 0.2745098, 1,
1.656452, -0.574448, 2.930931, 1, 0, 0.2705882, 1,
1.659629, -1.274556, 0.7023323, 1, 0, 0.2627451, 1,
1.661088, -0.5049204, 1.329232, 1, 0, 0.2588235, 1,
1.668843, -1.264546, 0.9682379, 1, 0, 0.2509804, 1,
1.675226, -0.2205687, 1.816251, 1, 0, 0.2470588, 1,
1.698363, -0.5707604, 3.314968, 1, 0, 0.2392157, 1,
1.737557, 0.8950613, 1.87662, 1, 0, 0.2352941, 1,
1.739084, -0.07275704, 1.834529, 1, 0, 0.227451, 1,
1.757428, -0.8634824, 1.673375, 1, 0, 0.2235294, 1,
1.769773, -0.3876148, 0.5136762, 1, 0, 0.2156863, 1,
1.788522, -0.2268978, 2.025853, 1, 0, 0.2117647, 1,
1.803277, -0.2798226, 0.6042798, 1, 0, 0.2039216, 1,
1.804313, -0.6030604, 3.630136, 1, 0, 0.1960784, 1,
1.80614, -0.7287664, 2.17596, 1, 0, 0.1921569, 1,
1.824989, -0.006650227, 0.3398663, 1, 0, 0.1843137, 1,
1.830193, -0.3129472, 2.916153, 1, 0, 0.1803922, 1,
1.853665, -0.2634012, 1.465592, 1, 0, 0.172549, 1,
1.854704, -0.5618831, 2.31841, 1, 0, 0.1686275, 1,
1.860237, -0.7689398, 0.4142782, 1, 0, 0.1607843, 1,
1.966553, 0.9453689, 0.6167684, 1, 0, 0.1568628, 1,
1.991167, 1.424298, 1.584193, 1, 0, 0.1490196, 1,
2.007377, 0.7994287, 1.397144, 1, 0, 0.145098, 1,
2.049625, 0.8195072, 2.134478, 1, 0, 0.1372549, 1,
2.088801, -0.9965747, 3.144901, 1, 0, 0.1333333, 1,
2.115107, -0.4490712, 1.46389, 1, 0, 0.1254902, 1,
2.130298, -0.706591, 1.450382, 1, 0, 0.1215686, 1,
2.184198, 0.1922805, 1.062521, 1, 0, 0.1137255, 1,
2.191413, 1.165055, 0.1445795, 1, 0, 0.1098039, 1,
2.193861, 0.7804812, 0.5972061, 1, 0, 0.1019608, 1,
2.223128, 0.254936, -0.09788064, 1, 0, 0.09411765, 1,
2.252715, 2.977075, 1.850431, 1, 0, 0.09019608, 1,
2.25478, -1.787393, 1.521559, 1, 0, 0.08235294, 1,
2.255063, 1.103807, 1.140011, 1, 0, 0.07843138, 1,
2.264327, 0.7990286, 0.8011358, 1, 0, 0.07058824, 1,
2.325246, 0.9599786, 3.362373, 1, 0, 0.06666667, 1,
2.328056, -0.8829073, 1.648317, 1, 0, 0.05882353, 1,
2.335355, 1.819204, -0.5053139, 1, 0, 0.05490196, 1,
2.403214, 0.1496043, -0.3686227, 1, 0, 0.04705882, 1,
2.431318, -1.657459, 4.071857, 1, 0, 0.04313726, 1,
2.441511, 0.8759681, 0.3804522, 1, 0, 0.03529412, 1,
2.475089, -0.4053031, 3.155142, 1, 0, 0.03137255, 1,
2.475707, -0.1803346, 2.352357, 1, 0, 0.02352941, 1,
2.475985, 0.258325, 1.700261, 1, 0, 0.01960784, 1,
2.694074, 0.8513374, 0.207557, 1, 0, 0.01176471, 1,
2.788604, -0.5002245, -0.301392, 1, 0, 0.007843138, 1
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
-0.03647101, -4.152373, -6.517933, 0, -0.5, 0.5, 0.5,
-0.03647101, -4.152373, -6.517933, 1, -0.5, 0.5, 0.5,
-0.03647101, -4.152373, -6.517933, 1, 1.5, 0.5, 0.5,
-0.03647101, -4.152373, -6.517933, 0, 1.5, 0.5, 0.5
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
-3.819246, 0.09319043, -6.517933, 0, -0.5, 0.5, 0.5,
-3.819246, 0.09319043, -6.517933, 1, -0.5, 0.5, 0.5,
-3.819246, 0.09319043, -6.517933, 1, 1.5, 0.5, 0.5,
-3.819246, 0.09319043, -6.517933, 0, 1.5, 0.5, 0.5
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
-3.819246, -4.152373, 0.04300809, 0, -0.5, 0.5, 0.5,
-3.819246, -4.152373, 0.04300809, 1, -0.5, 0.5, 0.5,
-3.819246, -4.152373, 0.04300809, 1, 1.5, 0.5, 0.5,
-3.819246, -4.152373, 0.04300809, 0, 1.5, 0.5, 0.5
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
-2, -3.172627, -5.00387,
2, -3.172627, -5.00387,
-2, -3.172627, -5.00387,
-2, -3.335918, -5.256213,
-1, -3.172627, -5.00387,
-1, -3.335918, -5.256213,
0, -3.172627, -5.00387,
0, -3.335918, -5.256213,
1, -3.172627, -5.00387,
1, -3.335918, -5.256213,
2, -3.172627, -5.00387,
2, -3.335918, -5.256213
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
-2, -3.6625, -5.760901, 0, -0.5, 0.5, 0.5,
-2, -3.6625, -5.760901, 1, -0.5, 0.5, 0.5,
-2, -3.6625, -5.760901, 1, 1.5, 0.5, 0.5,
-2, -3.6625, -5.760901, 0, 1.5, 0.5, 0.5,
-1, -3.6625, -5.760901, 0, -0.5, 0.5, 0.5,
-1, -3.6625, -5.760901, 1, -0.5, 0.5, 0.5,
-1, -3.6625, -5.760901, 1, 1.5, 0.5, 0.5,
-1, -3.6625, -5.760901, 0, 1.5, 0.5, 0.5,
0, -3.6625, -5.760901, 0, -0.5, 0.5, 0.5,
0, -3.6625, -5.760901, 1, -0.5, 0.5, 0.5,
0, -3.6625, -5.760901, 1, 1.5, 0.5, 0.5,
0, -3.6625, -5.760901, 0, 1.5, 0.5, 0.5,
1, -3.6625, -5.760901, 0, -0.5, 0.5, 0.5,
1, -3.6625, -5.760901, 1, -0.5, 0.5, 0.5,
1, -3.6625, -5.760901, 1, 1.5, 0.5, 0.5,
1, -3.6625, -5.760901, 0, 1.5, 0.5, 0.5,
2, -3.6625, -5.760901, 0, -0.5, 0.5, 0.5,
2, -3.6625, -5.760901, 1, -0.5, 0.5, 0.5,
2, -3.6625, -5.760901, 1, 1.5, 0.5, 0.5,
2, -3.6625, -5.760901, 0, 1.5, 0.5, 0.5
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
-2.946298, -3, -5.00387,
-2.946298, 3, -5.00387,
-2.946298, -3, -5.00387,
-3.091789, -3, -5.256213,
-2.946298, -2, -5.00387,
-3.091789, -2, -5.256213,
-2.946298, -1, -5.00387,
-3.091789, -1, -5.256213,
-2.946298, 0, -5.00387,
-3.091789, 0, -5.256213,
-2.946298, 1, -5.00387,
-3.091789, 1, -5.256213,
-2.946298, 2, -5.00387,
-3.091789, 2, -5.256213,
-2.946298, 3, -5.00387,
-3.091789, 3, -5.256213
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
-3.382772, -3, -5.760901, 0, -0.5, 0.5, 0.5,
-3.382772, -3, -5.760901, 1, -0.5, 0.5, 0.5,
-3.382772, -3, -5.760901, 1, 1.5, 0.5, 0.5,
-3.382772, -3, -5.760901, 0, 1.5, 0.5, 0.5,
-3.382772, -2, -5.760901, 0, -0.5, 0.5, 0.5,
-3.382772, -2, -5.760901, 1, -0.5, 0.5, 0.5,
-3.382772, -2, -5.760901, 1, 1.5, 0.5, 0.5,
-3.382772, -2, -5.760901, 0, 1.5, 0.5, 0.5,
-3.382772, -1, -5.760901, 0, -0.5, 0.5, 0.5,
-3.382772, -1, -5.760901, 1, -0.5, 0.5, 0.5,
-3.382772, -1, -5.760901, 1, 1.5, 0.5, 0.5,
-3.382772, -1, -5.760901, 0, 1.5, 0.5, 0.5,
-3.382772, 0, -5.760901, 0, -0.5, 0.5, 0.5,
-3.382772, 0, -5.760901, 1, -0.5, 0.5, 0.5,
-3.382772, 0, -5.760901, 1, 1.5, 0.5, 0.5,
-3.382772, 0, -5.760901, 0, 1.5, 0.5, 0.5,
-3.382772, 1, -5.760901, 0, -0.5, 0.5, 0.5,
-3.382772, 1, -5.760901, 1, -0.5, 0.5, 0.5,
-3.382772, 1, -5.760901, 1, 1.5, 0.5, 0.5,
-3.382772, 1, -5.760901, 0, 1.5, 0.5, 0.5,
-3.382772, 2, -5.760901, 0, -0.5, 0.5, 0.5,
-3.382772, 2, -5.760901, 1, -0.5, 0.5, 0.5,
-3.382772, 2, -5.760901, 1, 1.5, 0.5, 0.5,
-3.382772, 2, -5.760901, 0, 1.5, 0.5, 0.5,
-3.382772, 3, -5.760901, 0, -0.5, 0.5, 0.5,
-3.382772, 3, -5.760901, 1, -0.5, 0.5, 0.5,
-3.382772, 3, -5.760901, 1, 1.5, 0.5, 0.5,
-3.382772, 3, -5.760901, 0, 1.5, 0.5, 0.5
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
-2.946298, -3.172627, -4,
-2.946298, -3.172627, 4,
-2.946298, -3.172627, -4,
-3.091789, -3.335918, -4,
-2.946298, -3.172627, -2,
-3.091789, -3.335918, -2,
-2.946298, -3.172627, 0,
-3.091789, -3.335918, 0,
-2.946298, -3.172627, 2,
-3.091789, -3.335918, 2,
-2.946298, -3.172627, 4,
-3.091789, -3.335918, 4
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
-3.382772, -3.6625, -4, 0, -0.5, 0.5, 0.5,
-3.382772, -3.6625, -4, 1, -0.5, 0.5, 0.5,
-3.382772, -3.6625, -4, 1, 1.5, 0.5, 0.5,
-3.382772, -3.6625, -4, 0, 1.5, 0.5, 0.5,
-3.382772, -3.6625, -2, 0, -0.5, 0.5, 0.5,
-3.382772, -3.6625, -2, 1, -0.5, 0.5, 0.5,
-3.382772, -3.6625, -2, 1, 1.5, 0.5, 0.5,
-3.382772, -3.6625, -2, 0, 1.5, 0.5, 0.5,
-3.382772, -3.6625, 0, 0, -0.5, 0.5, 0.5,
-3.382772, -3.6625, 0, 1, -0.5, 0.5, 0.5,
-3.382772, -3.6625, 0, 1, 1.5, 0.5, 0.5,
-3.382772, -3.6625, 0, 0, 1.5, 0.5, 0.5,
-3.382772, -3.6625, 2, 0, -0.5, 0.5, 0.5,
-3.382772, -3.6625, 2, 1, -0.5, 0.5, 0.5,
-3.382772, -3.6625, 2, 1, 1.5, 0.5, 0.5,
-3.382772, -3.6625, 2, 0, 1.5, 0.5, 0.5,
-3.382772, -3.6625, 4, 0, -0.5, 0.5, 0.5,
-3.382772, -3.6625, 4, 1, -0.5, 0.5, 0.5,
-3.382772, -3.6625, 4, 1, 1.5, 0.5, 0.5,
-3.382772, -3.6625, 4, 0, 1.5, 0.5, 0.5
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
-2.946298, -3.172627, -5.00387,
-2.946298, 3.359008, -5.00387,
-2.946298, -3.172627, 5.089886,
-2.946298, 3.359008, 5.089886,
-2.946298, -3.172627, -5.00387,
-2.946298, -3.172627, 5.089886,
-2.946298, 3.359008, -5.00387,
-2.946298, 3.359008, 5.089886,
-2.946298, -3.172627, -5.00387,
2.873356, -3.172627, -5.00387,
-2.946298, -3.172627, 5.089886,
2.873356, -3.172627, 5.089886,
-2.946298, 3.359008, -5.00387,
2.873356, 3.359008, -5.00387,
-2.946298, 3.359008, 5.089886,
2.873356, 3.359008, 5.089886,
2.873356, -3.172627, -5.00387,
2.873356, 3.359008, -5.00387,
2.873356, -3.172627, 5.089886,
2.873356, 3.359008, 5.089886,
2.873356, -3.172627, -5.00387,
2.873356, -3.172627, 5.089886,
2.873356, 3.359008, -5.00387,
2.873356, 3.359008, 5.089886
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
var radius = 7.13248;
var distance = 31.73321;
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
mvMatrix.translate( 0.03647101, -0.09319043, -0.04300809 );
mvMatrix.scale( 1.325126, 1.180681, 0.7640147 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.73321);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
alanycarb<-read.table("alanycarb.xyz")
```

```
## Error in read.table("alanycarb.xyz"): no lines available in input
```

```r
x<-alanycarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'alanycarb' not found
```

```r
y<-alanycarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'alanycarb' not found
```

```r
z<-alanycarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'alanycarb' not found
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
-2.861546, -0.5290262, -2.406021, 0, 0, 1, 1, 1,
-2.719867, -0.9619999, -0.05983578, 1, 0, 0, 1, 1,
-2.617168, -0.9302978, -1.638875, 1, 0, 0, 1, 1,
-2.616693, -0.9752234, -1.731936, 1, 0, 0, 1, 1,
-2.615279, 0.4953263, -2.929479, 1, 0, 0, 1, 1,
-2.55595, -0.8885248, -1.035586, 1, 0, 0, 1, 1,
-2.466236, -0.5237234, -1.64905, 0, 0, 0, 1, 1,
-2.392106, 0.6163676, -1.826622, 0, 0, 0, 1, 1,
-2.21688, 0.6980059, -1.763463, 0, 0, 0, 1, 1,
-2.103187, 1.051715, -2.792719, 0, 0, 0, 1, 1,
-2.098147, -0.2358821, -1.62072, 0, 0, 0, 1, 1,
-2.079719, -0.04758487, -0.7065748, 0, 0, 0, 1, 1,
-2.030579, 1.680803, -0.8729893, 0, 0, 0, 1, 1,
-1.986974, -2.336402, -0.6335551, 1, 1, 1, 1, 1,
-1.986522, -0.1176309, -1.642878, 1, 1, 1, 1, 1,
-1.97131, -1.429356, -2.863988, 1, 1, 1, 1, 1,
-1.956838, -1.021921, -2.911035, 1, 1, 1, 1, 1,
-1.956449, 0.08393323, -0.2264209, 1, 1, 1, 1, 1,
-1.943789, -0.9673029, -3.217551, 1, 1, 1, 1, 1,
-1.939582, 0.9547746, -1.411621, 1, 1, 1, 1, 1,
-1.903711, 0.385715, -0.7915542, 1, 1, 1, 1, 1,
-1.895146, -0.3520493, -0.8143867, 1, 1, 1, 1, 1,
-1.863541, -2.113722, -2.964018, 1, 1, 1, 1, 1,
-1.82127, 2.464485, -0.5542598, 1, 1, 1, 1, 1,
-1.805586, -0.9411022, -1.025267, 1, 1, 1, 1, 1,
-1.802212, -0.155413, -0.7998881, 1, 1, 1, 1, 1,
-1.788976, 1.376575, -0.4691848, 1, 1, 1, 1, 1,
-1.776374, 0.7469957, -1.681063, 1, 1, 1, 1, 1,
-1.760899, 0.2103908, -0.8930556, 0, 0, 1, 1, 1,
-1.76085, -0.04535823, -1.822548, 1, 0, 0, 1, 1,
-1.76016, 0.3349292, -1.44601, 1, 0, 0, 1, 1,
-1.75047, -0.5488837, -1.77545, 1, 0, 0, 1, 1,
-1.731762, 0.4155596, -4.255186, 1, 0, 0, 1, 1,
-1.731232, 1.041967, -1.036867, 1, 0, 0, 1, 1,
-1.727901, 0.7540544, -1.221693, 0, 0, 0, 1, 1,
-1.71489, 0.04105729, -2.275766, 0, 0, 0, 1, 1,
-1.713472, -0.4180271, -1.753959, 0, 0, 0, 1, 1,
-1.705854, -0.4531095, -1.32008, 0, 0, 0, 1, 1,
-1.694933, 0.5563583, 0.9463175, 0, 0, 0, 1, 1,
-1.690833, 0.4842666, -1.170199, 0, 0, 0, 1, 1,
-1.685202, -0.7751493, -2.394307, 0, 0, 0, 1, 1,
-1.644266, -0.6468735, -1.776916, 1, 1, 1, 1, 1,
-1.63776, 1.287403, -1.640593, 1, 1, 1, 1, 1,
-1.635477, -0.417642, -1.970317, 1, 1, 1, 1, 1,
-1.62509, 0.74496, -0.37268, 1, 1, 1, 1, 1,
-1.621251, 1.657534, -1.69605, 1, 1, 1, 1, 1,
-1.614213, -0.6807372, -2.429236, 1, 1, 1, 1, 1,
-1.601241, 0.07403828, -2.341466, 1, 1, 1, 1, 1,
-1.594501, 0.1725735, -0.4936915, 1, 1, 1, 1, 1,
-1.591099, 0.3965669, -1.070122, 1, 1, 1, 1, 1,
-1.569137, 0.5852976, -3.260686, 1, 1, 1, 1, 1,
-1.561065, 0.4138117, -0.1234407, 1, 1, 1, 1, 1,
-1.560945, 0.4809447, -0.6976736, 1, 1, 1, 1, 1,
-1.528413, -0.08309389, -1.40945, 1, 1, 1, 1, 1,
-1.51126, 0.00132077, -1.003377, 1, 1, 1, 1, 1,
-1.505711, -1.196952, -2.882423, 1, 1, 1, 1, 1,
-1.504965, 0.2729563, -1.113424, 0, 0, 1, 1, 1,
-1.502837, -0.3319493, -2.431063, 1, 0, 0, 1, 1,
-1.497352, 0.25262, -1.563156, 1, 0, 0, 1, 1,
-1.492751, 0.2999294, -2.451746, 1, 0, 0, 1, 1,
-1.492212, -2.539828, -2.02021, 1, 0, 0, 1, 1,
-1.485105, 1.115528, -1.101604, 1, 0, 0, 1, 1,
-1.479327, 0.9059448, -0.6897277, 0, 0, 0, 1, 1,
-1.471285, 1.51849, -0.9812252, 0, 0, 0, 1, 1,
-1.467228, 1.003494, -1.695559, 0, 0, 0, 1, 1,
-1.465823, -0.2244113, -2.848114, 0, 0, 0, 1, 1,
-1.46274, -1.355078, -2.462001, 0, 0, 0, 1, 1,
-1.458237, 0.7122147, 1.165865, 0, 0, 0, 1, 1,
-1.451579, 0.01791144, -2.611812, 0, 0, 0, 1, 1,
-1.443573, 0.2096434, 0.5278721, 1, 1, 1, 1, 1,
-1.441529, 0.1224078, -2.539233, 1, 1, 1, 1, 1,
-1.440121, 0.269272, -0.2975162, 1, 1, 1, 1, 1,
-1.422309, 2.326468, 0.8732243, 1, 1, 1, 1, 1,
-1.411389, 1.807085, -0.3759286, 1, 1, 1, 1, 1,
-1.410419, 1.656883, 0.8244419, 1, 1, 1, 1, 1,
-1.41008, 0.3464965, 0.1914772, 1, 1, 1, 1, 1,
-1.408422, 1.700857, -2.774765, 1, 1, 1, 1, 1,
-1.405395, 0.55439, -1.404134, 1, 1, 1, 1, 1,
-1.396897, -0.1096077, 0.334984, 1, 1, 1, 1, 1,
-1.383972, -0.00108728, -0.4833091, 1, 1, 1, 1, 1,
-1.379633, -1.690367, -2.751187, 1, 1, 1, 1, 1,
-1.376197, -0.3230624, 0.5880461, 1, 1, 1, 1, 1,
-1.370474, 0.5918689, -1.653705, 1, 1, 1, 1, 1,
-1.365007, -1.267245, -2.360622, 1, 1, 1, 1, 1,
-1.363024, 0.879931, -0.6733935, 0, 0, 1, 1, 1,
-1.35947, -1.572779, -3.326545, 1, 0, 0, 1, 1,
-1.333063, -0.395476, -2.840708, 1, 0, 0, 1, 1,
-1.328069, -0.01941445, 0.05854188, 1, 0, 0, 1, 1,
-1.324706, -0.8722948, -2.590846, 1, 0, 0, 1, 1,
-1.322876, -0.2958243, -1.380918, 1, 0, 0, 1, 1,
-1.32055, 0.727757, -1.090679, 0, 0, 0, 1, 1,
-1.31927, 0.5874787, -0.1885347, 0, 0, 0, 1, 1,
-1.316648, -1.153841, -1.618315, 0, 0, 0, 1, 1,
-1.314258, -0.9761066, -1.295622, 0, 0, 0, 1, 1,
-1.31077, 0.7193775, 0.2772941, 0, 0, 0, 1, 1,
-1.269367, 0.1042872, -1.814251, 0, 0, 0, 1, 1,
-1.260454, -0.3000203, -2.465466, 0, 0, 0, 1, 1,
-1.259816, 0.641999, -1.461949, 1, 1, 1, 1, 1,
-1.238742, -0.2409149, -0.8181265, 1, 1, 1, 1, 1,
-1.234365, -0.5267578, -1.028801, 1, 1, 1, 1, 1,
-1.231966, -0.870941, -0.9790742, 1, 1, 1, 1, 1,
-1.215211, -0.437832, -2.109958, 1, 1, 1, 1, 1,
-1.21086, 1.325436, 0.2165255, 1, 1, 1, 1, 1,
-1.190239, 0.1946306, -1.245703, 1, 1, 1, 1, 1,
-1.188525, 0.5411547, -1.968736, 1, 1, 1, 1, 1,
-1.181136, -0.2268947, -1.468704, 1, 1, 1, 1, 1,
-1.180189, 1.437503, -0.5058345, 1, 1, 1, 1, 1,
-1.177443, -0.4220005, -2.397597, 1, 1, 1, 1, 1,
-1.176247, 1.542024, -1.086934, 1, 1, 1, 1, 1,
-1.173259, -2.309211, -2.199316, 1, 1, 1, 1, 1,
-1.172041, 0.6402109, -1.338678, 1, 1, 1, 1, 1,
-1.170464, -1.201539, -2.683135, 1, 1, 1, 1, 1,
-1.169647, -0.9760161, -2.573129, 0, 0, 1, 1, 1,
-1.168432, -1.187552, -0.700244, 1, 0, 0, 1, 1,
-1.168109, -1.163433, -1.393475, 1, 0, 0, 1, 1,
-1.165637, 0.5021032, -2.073281, 1, 0, 0, 1, 1,
-1.154786, -1.078096, -2.166911, 1, 0, 0, 1, 1,
-1.152031, -0.6067023, -2.129365, 1, 0, 0, 1, 1,
-1.147962, 0.7181454, 0.4062479, 0, 0, 0, 1, 1,
-1.140645, -0.3733881, 0.1043939, 0, 0, 0, 1, 1,
-1.140532, 1.04597, -1.055005, 0, 0, 0, 1, 1,
-1.137438, -0.5829064, -2.348537, 0, 0, 0, 1, 1,
-1.136955, 1.358142, -0.8687042, 0, 0, 0, 1, 1,
-1.133497, -0.5831128, -2.065768, 0, 0, 0, 1, 1,
-1.128643, -1.391129, -3.534157, 0, 0, 0, 1, 1,
-1.119704, 0.4005093, -1.111362, 1, 1, 1, 1, 1,
-1.119643, 0.06897874, -1.008277, 1, 1, 1, 1, 1,
-1.116214, -1.169322, -3.723265, 1, 1, 1, 1, 1,
-1.113705, 0.3901474, -1.253997, 1, 1, 1, 1, 1,
-1.111602, -0.06566475, -2.383219, 1, 1, 1, 1, 1,
-1.109738, -0.4531932, -0.8105232, 1, 1, 1, 1, 1,
-1.105729, 0.5051587, -0.5565052, 1, 1, 1, 1, 1,
-1.105558, 0.6479501, -0.7825491, 1, 1, 1, 1, 1,
-1.100295, -0.2293147, -1.53422, 1, 1, 1, 1, 1,
-1.093785, -0.4146547, -0.7497405, 1, 1, 1, 1, 1,
-1.081263, -1.28439, -1.075376, 1, 1, 1, 1, 1,
-1.08104, 1.541482, 0.8106669, 1, 1, 1, 1, 1,
-1.059248, 2.05667, 0.284776, 1, 1, 1, 1, 1,
-1.057099, -0.03148979, -1.04323, 1, 1, 1, 1, 1,
-1.047517, 0.1111664, -3.393899, 1, 1, 1, 1, 1,
-1.045996, -0.5923987, -2.595674, 0, 0, 1, 1, 1,
-1.040579, -0.7988679, -1.735719, 1, 0, 0, 1, 1,
-1.035799, 0.3997769, -1.19683, 1, 0, 0, 1, 1,
-1.025941, 0.9683757, -2.385371, 1, 0, 0, 1, 1,
-1.023288, 0.4057904, -1.07818, 1, 0, 0, 1, 1,
-1.022713, 0.442562, -0.4441316, 1, 0, 0, 1, 1,
-1.0221, -0.7993037, -1.553461, 0, 0, 0, 1, 1,
-1.021198, -0.08654943, -1.597843, 0, 0, 0, 1, 1,
-1.012549, -0.6103263, -2.397411, 0, 0, 0, 1, 1,
-1.009898, 0.8086681, -1.077832, 0, 0, 0, 1, 1,
-1.008486, 0.3550337, -2.479916, 0, 0, 0, 1, 1,
-1.007106, -0.1927354, -2.413691, 0, 0, 0, 1, 1,
-1.006915, 1.012946, 0.01498011, 0, 0, 0, 1, 1,
-1.001984, -0.5044587, -1.712734, 1, 1, 1, 1, 1,
-0.9996383, -0.8436877, -4.281049, 1, 1, 1, 1, 1,
-0.9944131, -1.232574, -3.676356, 1, 1, 1, 1, 1,
-0.9894494, -0.1171698, -0.1951089, 1, 1, 1, 1, 1,
-0.9843414, 1.653499, -1.398434, 1, 1, 1, 1, 1,
-0.975566, -0.3954683, -2.46013, 1, 1, 1, 1, 1,
-0.9711064, 0.1036623, -2.839307, 1, 1, 1, 1, 1,
-0.9684355, 0.8432522, -0.1038829, 1, 1, 1, 1, 1,
-0.9667805, 0.6037062, -2.542841, 1, 1, 1, 1, 1,
-0.9656045, -1.229602, -2.197541, 1, 1, 1, 1, 1,
-0.9648777, 0.6284264, -0.912111, 1, 1, 1, 1, 1,
-0.9626531, 1.149228, -0.8790897, 1, 1, 1, 1, 1,
-0.9622471, -2.189673, -3.223928, 1, 1, 1, 1, 1,
-0.9550006, -0.3716675, -1.931618, 1, 1, 1, 1, 1,
-0.9503679, 1.144906, -1.581139, 1, 1, 1, 1, 1,
-0.9460186, 0.9074102, 0.0639504, 0, 0, 1, 1, 1,
-0.9456475, -0.1648506, -1.266577, 1, 0, 0, 1, 1,
-0.9428799, 0.5795086, -0.4649518, 1, 0, 0, 1, 1,
-0.9422305, -0.5481388, 0.1709562, 1, 0, 0, 1, 1,
-0.940333, 1.704184, -0.165164, 1, 0, 0, 1, 1,
-0.9394935, 0.4733494, -1.293391, 1, 0, 0, 1, 1,
-0.9384309, 1.283793, -3.269863, 0, 0, 0, 1, 1,
-0.9360461, -1.708999, -4.674269, 0, 0, 0, 1, 1,
-0.9326201, -0.7715041, -3.498549, 0, 0, 0, 1, 1,
-0.9266204, -0.08200701, -1.957698, 0, 0, 0, 1, 1,
-0.9250308, -0.03738788, -2.773929, 0, 0, 0, 1, 1,
-0.9209164, -1.001502, -0.7576638, 0, 0, 0, 1, 1,
-0.9186994, -0.3792644, -0.6037555, 0, 0, 0, 1, 1,
-0.9043391, 0.3370324, -1.189452, 1, 1, 1, 1, 1,
-0.9039382, -0.790604, -1.349018, 1, 1, 1, 1, 1,
-0.9020185, -0.3553162, -1.303166, 1, 1, 1, 1, 1,
-0.9003439, 1.490055, -1.773794, 1, 1, 1, 1, 1,
-0.8997099, 0.6537812, -1.326333, 1, 1, 1, 1, 1,
-0.8955405, -1.142887, -1.85019, 1, 1, 1, 1, 1,
-0.8919463, -1.891406, -3.078888, 1, 1, 1, 1, 1,
-0.8686028, 2.073469, -0.01318552, 1, 1, 1, 1, 1,
-0.8604311, -0.08175051, -0.3716424, 1, 1, 1, 1, 1,
-0.856584, -1.698235, -2.949617, 1, 1, 1, 1, 1,
-0.8469409, 0.1086861, -1.166492, 1, 1, 1, 1, 1,
-0.8403517, 0.706448, -3.103297, 1, 1, 1, 1, 1,
-0.8362089, 0.3674555, -0.3588184, 1, 1, 1, 1, 1,
-0.8349589, 0.7745895, -1.039119, 1, 1, 1, 1, 1,
-0.8325233, -1.154904, -2.923339, 1, 1, 1, 1, 1,
-0.8321307, 1.304961, -1.628253, 0, 0, 1, 1, 1,
-0.827858, -1.705648, -3.316008, 1, 0, 0, 1, 1,
-0.826944, 0.2055589, -0.8227019, 1, 0, 0, 1, 1,
-0.8245262, 0.5171023, -1.507887, 1, 0, 0, 1, 1,
-0.816976, 0.01969481, 0.5870086, 1, 0, 0, 1, 1,
-0.8151194, 0.8515456, -2.182731, 1, 0, 0, 1, 1,
-0.8141656, -0.04776138, -2.403219, 0, 0, 0, 1, 1,
-0.8124071, 1.303088, -0.3306456, 0, 0, 0, 1, 1,
-0.810851, 0.6890123, -2.13274, 0, 0, 0, 1, 1,
-0.8106442, -1.783026, -3.898713, 0, 0, 0, 1, 1,
-0.8080983, -0.8057209, -2.079699, 0, 0, 0, 1, 1,
-0.8074183, -0.9571053, -0.7208584, 0, 0, 0, 1, 1,
-0.8030168, 0.09026703, -1.053151, 0, 0, 0, 1, 1,
-0.7979341, 0.406693, -0.7070246, 1, 1, 1, 1, 1,
-0.78918, -0.02723952, -1.852853, 1, 1, 1, 1, 1,
-0.7844602, 1.016566, 0.1426313, 1, 1, 1, 1, 1,
-0.7817836, 0.4868069, -1.088433, 1, 1, 1, 1, 1,
-0.7787505, 0.1218226, -0.8035512, 1, 1, 1, 1, 1,
-0.7756059, -0.3647854, -0.6510962, 1, 1, 1, 1, 1,
-0.7715824, 0.3380433, -1.748527, 1, 1, 1, 1, 1,
-0.7689719, -0.04942746, -1.421159, 1, 1, 1, 1, 1,
-0.7672394, 1.457847, -1.108497, 1, 1, 1, 1, 1,
-0.7668766, -0.3426564, -1.854243, 1, 1, 1, 1, 1,
-0.7568911, 0.04224512, -0.7861308, 1, 1, 1, 1, 1,
-0.7546693, 0.1022833, -0.6691542, 1, 1, 1, 1, 1,
-0.7526735, 1.196691, -1.50664, 1, 1, 1, 1, 1,
-0.7490082, 0.1951452, -0.02803966, 1, 1, 1, 1, 1,
-0.746354, 0.5896469, -1.520919, 1, 1, 1, 1, 1,
-0.7444778, -1.389764, -2.02432, 0, 0, 1, 1, 1,
-0.7440727, 0.027011, -2.008898, 1, 0, 0, 1, 1,
-0.7375455, -1.002795, -2.811911, 1, 0, 0, 1, 1,
-0.733753, 0.5281885, -0.02840351, 1, 0, 0, 1, 1,
-0.7292951, -0.2866105, -3.056974, 1, 0, 0, 1, 1,
-0.7271535, 1.192531, -0.3918679, 1, 0, 0, 1, 1,
-0.7260774, -0.6107216, -2.557523, 0, 0, 0, 1, 1,
-0.7259648, 0.2553142, -1.293879, 0, 0, 0, 1, 1,
-0.7246183, 0.4164852, -1.37062, 0, 0, 0, 1, 1,
-0.7231771, 0.3912961, -1.002978, 0, 0, 0, 1, 1,
-0.7230811, -0.7403384, -4.51831, 0, 0, 0, 1, 1,
-0.71912, 0.602464, -0.3096482, 0, 0, 0, 1, 1,
-0.7190992, -0.151737, -1.582564, 0, 0, 0, 1, 1,
-0.7177962, -1.348221, -0.6310865, 1, 1, 1, 1, 1,
-0.7140496, 1.951599, -1.197991, 1, 1, 1, 1, 1,
-0.7083292, 0.3715602, -0.5442274, 1, 1, 1, 1, 1,
-0.7077672, -0.06831796, -2.595971, 1, 1, 1, 1, 1,
-0.7064341, -0.4156137, -3.204693, 1, 1, 1, 1, 1,
-0.7057714, -0.5226046, -2.421201, 1, 1, 1, 1, 1,
-0.7052916, 0.2768147, -3.518426, 1, 1, 1, 1, 1,
-0.7014743, 0.4223297, 0.0515336, 1, 1, 1, 1, 1,
-0.6965234, 1.694991, 0.4505922, 1, 1, 1, 1, 1,
-0.6848335, 0.5102157, -0.3114368, 1, 1, 1, 1, 1,
-0.6829682, -2.363946, -2.852359, 1, 1, 1, 1, 1,
-0.6792056, -0.9272251, -4.102655, 1, 1, 1, 1, 1,
-0.6745114, 2.55096, -0.3278229, 1, 1, 1, 1, 1,
-0.6725909, 0.224604, -0.9042538, 1, 1, 1, 1, 1,
-0.6694601, 0.4226516, -0.4999399, 1, 1, 1, 1, 1,
-0.6678446, -0.3432532, -3.264731, 0, 0, 1, 1, 1,
-0.6618341, -0.5890419, -1.614181, 1, 0, 0, 1, 1,
-0.6615165, 0.3760407, -3.428272, 1, 0, 0, 1, 1,
-0.6577855, 1.541592, -0.4270148, 1, 0, 0, 1, 1,
-0.6568294, -1.146532, -2.348662, 1, 0, 0, 1, 1,
-0.6557398, 0.05234436, -1.08531, 1, 0, 0, 1, 1,
-0.6555396, -2.041145, -3.506123, 0, 0, 0, 1, 1,
-0.6479475, -0.09548694, -2.094564, 0, 0, 0, 1, 1,
-0.6478775, 0.8915188, -0.340151, 0, 0, 0, 1, 1,
-0.6393364, 0.4772653, -1.684753, 0, 0, 0, 1, 1,
-0.6375624, 1.592612, -1.37186, 0, 0, 0, 1, 1,
-0.6244131, 0.7909074, -0.9504429, 0, 0, 0, 1, 1,
-0.6221406, -0.4948204, -2.257146, 0, 0, 0, 1, 1,
-0.6178098, 0.3118727, -0.777711, 1, 1, 1, 1, 1,
-0.6090657, 0.9604757, -1.03807, 1, 1, 1, 1, 1,
-0.6075037, 1.19485, 0.7674811, 1, 1, 1, 1, 1,
-0.6064966, -1.202682, -1.69414, 1, 1, 1, 1, 1,
-0.6043752, -1.070768, -1.290447, 1, 1, 1, 1, 1,
-0.6036032, 0.4762447, -0.2193485, 1, 1, 1, 1, 1,
-0.6030914, 0.1739875, 0.2267345, 1, 1, 1, 1, 1,
-0.5996408, -0.3070301, -2.06747, 1, 1, 1, 1, 1,
-0.5981299, -0.8420101, -2.592609, 1, 1, 1, 1, 1,
-0.59166, 0.1181419, -1.292906, 1, 1, 1, 1, 1,
-0.5906959, 0.4467561, -0.4445064, 1, 1, 1, 1, 1,
-0.5898515, -1.772239, -3.524417, 1, 1, 1, 1, 1,
-0.5897716, 1.627287, -2.749677, 1, 1, 1, 1, 1,
-0.588115, 0.002351762, -2.444391, 1, 1, 1, 1, 1,
-0.5806199, -0.5841845, -1.702014, 1, 1, 1, 1, 1,
-0.5786763, -0.1313646, -3.074976, 0, 0, 1, 1, 1,
-0.5775058, 0.1472243, -2.534597, 1, 0, 0, 1, 1,
-0.5769423, -0.1407382, 0.5735644, 1, 0, 0, 1, 1,
-0.5768685, 0.2521723, -0.4812794, 1, 0, 0, 1, 1,
-0.5737144, 0.5110338, -0.8274395, 1, 0, 0, 1, 1,
-0.5735487, -0.5706866, -2.81, 1, 0, 0, 1, 1,
-0.5709425, -0.1799617, -2.034035, 0, 0, 0, 1, 1,
-0.5687056, 0.3709616, 0.2146963, 0, 0, 0, 1, 1,
-0.5681255, 1.051029, 2.018655, 0, 0, 0, 1, 1,
-0.564775, 1.520798, -0.5953658, 0, 0, 0, 1, 1,
-0.5629402, 1.182968, -0.2966329, 0, 0, 0, 1, 1,
-0.558624, -0.717879, -2.432011, 0, 0, 0, 1, 1,
-0.5560462, 1.805804, -0.4232883, 0, 0, 0, 1, 1,
-0.5525694, 2.350157, -2.57112, 1, 1, 1, 1, 1,
-0.5483791, 0.6362427, -2.044266, 1, 1, 1, 1, 1,
-0.5481617, -1.07796, -3.649754, 1, 1, 1, 1, 1,
-0.5464445, 0.8744277, -1.64692, 1, 1, 1, 1, 1,
-0.5346252, 0.0310254, -0.3195154, 1, 1, 1, 1, 1,
-0.5323309, 0.4756243, -0.402375, 1, 1, 1, 1, 1,
-0.5272161, 0.5301477, 0.1288778, 1, 1, 1, 1, 1,
-0.5261338, 1.601386, -1.446908, 1, 1, 1, 1, 1,
-0.524824, -1.059168, -2.696273, 1, 1, 1, 1, 1,
-0.5164751, 1.159462, -1.215262, 1, 1, 1, 1, 1,
-0.5154557, -0.01558199, -1.796534, 1, 1, 1, 1, 1,
-0.5150543, 0.8432053, -1.904714, 1, 1, 1, 1, 1,
-0.5113507, -1.095662, -2.07584, 1, 1, 1, 1, 1,
-0.5076942, -1.273178, -3.12423, 1, 1, 1, 1, 1,
-0.50643, 0.9672086, 0.9318658, 1, 1, 1, 1, 1,
-0.504865, -1.023462, -1.657442, 0, 0, 1, 1, 1,
-0.5038189, -1.010978, -2.412606, 1, 0, 0, 1, 1,
-0.4963347, -1.576437, -1.766652, 1, 0, 0, 1, 1,
-0.4963086, 0.5181897, -2.224137, 1, 0, 0, 1, 1,
-0.4932838, -0.8358415, -3.395585, 1, 0, 0, 1, 1,
-0.4916744, 0.5746272, -1.326867, 1, 0, 0, 1, 1,
-0.4907965, 1.14436, 1.306248, 0, 0, 0, 1, 1,
-0.4870438, -0.07286927, -1.263212, 0, 0, 0, 1, 1,
-0.484513, 0.1087105, -2.682022, 0, 0, 0, 1, 1,
-0.4772815, 0.5197442, -0.6367726, 0, 0, 0, 1, 1,
-0.4765915, -0.02042034, -2.6232, 0, 0, 0, 1, 1,
-0.4693317, -1.229062, -4.506044, 0, 0, 0, 1, 1,
-0.4647347, 0.2890285, 0.3803162, 0, 0, 0, 1, 1,
-0.4644613, 0.03270563, -3.019566, 1, 1, 1, 1, 1,
-0.4641721, -0.5238923, -4.261157, 1, 1, 1, 1, 1,
-0.4624645, -0.6886825, -3.719641, 1, 1, 1, 1, 1,
-0.4621098, 1.80794, -0.007350239, 1, 1, 1, 1, 1,
-0.4603246, -1.228002, -3.818749, 1, 1, 1, 1, 1,
-0.4571838, 2.013439, -0.5011451, 1, 1, 1, 1, 1,
-0.4562588, 0.1897582, 0.9095975, 1, 1, 1, 1, 1,
-0.4538312, -0.1584105, -2.312112, 1, 1, 1, 1, 1,
-0.4528995, -0.7508196, -3.090269, 1, 1, 1, 1, 1,
-0.4515707, 0.3359313, -1.070447, 1, 1, 1, 1, 1,
-0.4486151, -0.6049036, -1.640764, 1, 1, 1, 1, 1,
-0.4465446, 1.413093, -1.375345, 1, 1, 1, 1, 1,
-0.4447691, -0.8708748, -2.691039, 1, 1, 1, 1, 1,
-0.4442055, 0.3866572, -1.222436, 1, 1, 1, 1, 1,
-0.4439456, -0.7457252, -2.691814, 1, 1, 1, 1, 1,
-0.4429878, -1.233207, -3.123765, 0, 0, 1, 1, 1,
-0.4364901, -0.2861185, -2.696292, 1, 0, 0, 1, 1,
-0.435062, 1.44985, -0.2997788, 1, 0, 0, 1, 1,
-0.4344086, -1.812431, -2.251597, 1, 0, 0, 1, 1,
-0.4334009, -1.140022, -2.112943, 1, 0, 0, 1, 1,
-0.4302949, 0.5406815, -0.2309335, 1, 0, 0, 1, 1,
-0.4268733, 0.4009719, 0.8999336, 0, 0, 0, 1, 1,
-0.4267074, -0.7048965, -1.432588, 0, 0, 0, 1, 1,
-0.4261441, -1.028305, -4.495586, 0, 0, 0, 1, 1,
-0.4253935, -0.7066636, -2.59324, 0, 0, 0, 1, 1,
-0.4251221, -1.65404, -3.194565, 0, 0, 0, 1, 1,
-0.4190974, -1.73896, -2.796976, 0, 0, 0, 1, 1,
-0.4170819, 0.2828958, 1.116446, 0, 0, 0, 1, 1,
-0.4166472, -1.179845, -2.925121, 1, 1, 1, 1, 1,
-0.4163865, -0.922249, -1.807234, 1, 1, 1, 1, 1,
-0.41508, -0.2066659, -2.45366, 1, 1, 1, 1, 1,
-0.4137204, 1.888026, 1.554894, 1, 1, 1, 1, 1,
-0.4102819, -0.535834, -3.237624, 1, 1, 1, 1, 1,
-0.4098985, 0.8316061, 0.4328613, 1, 1, 1, 1, 1,
-0.4095514, -0.9190485, -3.50309, 1, 1, 1, 1, 1,
-0.4090928, -1.334411, -4.108772, 1, 1, 1, 1, 1,
-0.4011527, 1.018418, -1.243089, 1, 1, 1, 1, 1,
-0.4010242, -0.6340364, -3.799707, 1, 1, 1, 1, 1,
-0.4006471, 0.8019111, -0.1146787, 1, 1, 1, 1, 1,
-0.3983892, -1.21053, -0.9602277, 1, 1, 1, 1, 1,
-0.3962578, -0.4705241, -0.07663599, 1, 1, 1, 1, 1,
-0.3935371, -0.472811, -3.170527, 1, 1, 1, 1, 1,
-0.3916414, -1.182271, -2.415306, 1, 1, 1, 1, 1,
-0.3871864, -0.4301914, -3.328421, 0, 0, 1, 1, 1,
-0.3821396, -1.41101, -3.44327, 1, 0, 0, 1, 1,
-0.3794628, -0.1932823, -2.012594, 1, 0, 0, 1, 1,
-0.3794446, 0.3581593, -0.3889824, 1, 0, 0, 1, 1,
-0.3712367, -0.02171949, -1.677209, 1, 0, 0, 1, 1,
-0.3687853, -0.02403064, -1.512717, 1, 0, 0, 1, 1,
-0.3641798, 0.4368443, -0.703402, 0, 0, 0, 1, 1,
-0.3582816, -0.2994795, -3.540938, 0, 0, 0, 1, 1,
-0.3565452, 0.5981407, -1.373714, 0, 0, 0, 1, 1,
-0.3562308, 0.3905689, -1.945916, 0, 0, 0, 1, 1,
-0.3559977, 0.3749679, -0.414964, 0, 0, 0, 1, 1,
-0.3522913, -0.881851, -1.852641, 0, 0, 0, 1, 1,
-0.3515795, 0.2321636, 0.06152058, 0, 0, 0, 1, 1,
-0.3502111, 0.1921154, -1.449568, 1, 1, 1, 1, 1,
-0.3501014, -0.7845225, -1.761367, 1, 1, 1, 1, 1,
-0.3488319, -1.592898, -3.974661, 1, 1, 1, 1, 1,
-0.3462195, -0.4942697, -3.383957, 1, 1, 1, 1, 1,
-0.3442005, 0.9459864, -1.14816, 1, 1, 1, 1, 1,
-0.3441358, 0.3788555, -0.1439905, 1, 1, 1, 1, 1,
-0.343768, 0.6239375, -1.375824, 1, 1, 1, 1, 1,
-0.3353508, 2.053489, 1.43174, 1, 1, 1, 1, 1,
-0.3269397, 1.569853, 1.558355, 1, 1, 1, 1, 1,
-0.3257327, -0.3298995, -1.187195, 1, 1, 1, 1, 1,
-0.3254492, -1.522702, -2.967359, 1, 1, 1, 1, 1,
-0.3250567, -0.9364236, -0.6118604, 1, 1, 1, 1, 1,
-0.3239973, 0.06285151, -1.009288, 1, 1, 1, 1, 1,
-0.3234952, -1.963748, -3.392037, 1, 1, 1, 1, 1,
-0.3173091, 0.7281086, -0.2605987, 1, 1, 1, 1, 1,
-0.3150164, 0.9741293, 0.3094271, 0, 0, 1, 1, 1,
-0.3143877, -1.415877, -1.400385, 1, 0, 0, 1, 1,
-0.3059431, -0.3853227, -3.354435, 1, 0, 0, 1, 1,
-0.3052079, -1.345992, -2.374554, 1, 0, 0, 1, 1,
-0.3001345, -0.8339063, -3.418761, 1, 0, 0, 1, 1,
-0.2977396, 0.157804, -2.371078, 1, 0, 0, 1, 1,
-0.2942257, -1.141223, -3.016804, 0, 0, 0, 1, 1,
-0.2922416, 0.05576017, -1.088777, 0, 0, 0, 1, 1,
-0.2860216, 1.361549, 0.7317806, 0, 0, 0, 1, 1,
-0.2838647, 0.3476237, 0.6524141, 0, 0, 0, 1, 1,
-0.2830422, -1.061543, -3.099261, 0, 0, 0, 1, 1,
-0.2786644, 0.7067418, 0.2050558, 0, 0, 0, 1, 1,
-0.275793, 0.7180321, -0.0699283, 0, 0, 0, 1, 1,
-0.2756434, -0.2568348, -0.651231, 1, 1, 1, 1, 1,
-0.2740526, -0.8850163, -1.876827, 1, 1, 1, 1, 1,
-0.272943, 0.1450498, -0.2612436, 1, 1, 1, 1, 1,
-0.2650995, -0.1153481, -1.168432, 1, 1, 1, 1, 1,
-0.2628821, -0.2936021, -1.189966, 1, 1, 1, 1, 1,
-0.262293, 0.2311382, -3.069479, 1, 1, 1, 1, 1,
-0.2562844, -0.647181, -2.268458, 1, 1, 1, 1, 1,
-0.252976, -0.579243, -0.5383216, 1, 1, 1, 1, 1,
-0.2500807, 1.743832, -1.916001, 1, 1, 1, 1, 1,
-0.2485569, 0.05777619, -2.680058, 1, 1, 1, 1, 1,
-0.248062, -0.4845402, -2.523197, 1, 1, 1, 1, 1,
-0.2480063, -0.06313308, -2.362738, 1, 1, 1, 1, 1,
-0.2421296, -0.2288604, -1.223793, 1, 1, 1, 1, 1,
-0.2376168, -0.02670741, -1.9594, 1, 1, 1, 1, 1,
-0.2347996, 2.204058, -0.6958396, 1, 1, 1, 1, 1,
-0.2254786, 0.7295702, 0.7315053, 0, 0, 1, 1, 1,
-0.2174292, 0.03052785, -0.3620919, 1, 0, 0, 1, 1,
-0.2173354, 0.2455798, 0.1812519, 1, 0, 0, 1, 1,
-0.2170218, -0.3403234, -1.299354, 1, 0, 0, 1, 1,
-0.2103577, -0.4443364, -3.497435, 1, 0, 0, 1, 1,
-0.2090476, 0.2836407, -0.08936348, 1, 0, 0, 1, 1,
-0.1984938, 0.03300738, -2.409906, 0, 0, 0, 1, 1,
-0.1981218, -1.44185, -2.319108, 0, 0, 0, 1, 1,
-0.1944717, -0.06092405, -3.541177, 0, 0, 0, 1, 1,
-0.1931642, -0.09525809, -0.7272025, 0, 0, 0, 1, 1,
-0.191018, 1.618666, -0.1174508, 0, 0, 0, 1, 1,
-0.1903575, 0.489319, 2.846235, 0, 0, 0, 1, 1,
-0.1885367, 1.082129, 0.6642905, 0, 0, 0, 1, 1,
-0.1883749, -0.3447963, -3.054915, 1, 1, 1, 1, 1,
-0.1879478, 0.3239177, -2.938206, 1, 1, 1, 1, 1,
-0.1813438, -0.1149676, -1.387773, 1, 1, 1, 1, 1,
-0.1782992, 0.5353824, -0.4045678, 1, 1, 1, 1, 1,
-0.1764266, -1.567638, -0.9561499, 1, 1, 1, 1, 1,
-0.1688322, -0.6072435, -4.856873, 1, 1, 1, 1, 1,
-0.1680522, 1.034316, -1.911633, 1, 1, 1, 1, 1,
-0.1620549, 1.416146, -0.2116707, 1, 1, 1, 1, 1,
-0.1600738, 0.1045819, -0.7225984, 1, 1, 1, 1, 1,
-0.1551594, -0.1181598, -2.829135, 1, 1, 1, 1, 1,
-0.1542304, 3.263887, 2.433808, 1, 1, 1, 1, 1,
-0.1486119, 0.1566244, 0.6282392, 1, 1, 1, 1, 1,
-0.1484877, -1.434808, -2.797851, 1, 1, 1, 1, 1,
-0.1476655, 2.320899, -0.5136011, 1, 1, 1, 1, 1,
-0.1415842, -0.8142384, -2.385813, 1, 1, 1, 1, 1,
-0.1366594, 0.1644771, -1.849758, 0, 0, 1, 1, 1,
-0.1352652, 0.8056458, -0.5849539, 1, 0, 0, 1, 1,
-0.1317807, 0.07716887, -0.5861343, 1, 0, 0, 1, 1,
-0.1317087, -1.55359, -4.104001, 1, 0, 0, 1, 1,
-0.1297795, -0.3743722, -3.459469, 1, 0, 0, 1, 1,
-0.1288117, 0.8027896, 0.6178442, 1, 0, 0, 1, 1,
-0.1269822, -0.3343801, -2.890308, 0, 0, 0, 1, 1,
-0.126968, 0.001182337, -0.7145146, 0, 0, 0, 1, 1,
-0.1266838, -0.2549717, -1.342277, 0, 0, 0, 1, 1,
-0.124231, 1.14474, -0.3485255, 0, 0, 0, 1, 1,
-0.1209982, -0.536006, -3.137513, 0, 0, 0, 1, 1,
-0.1205332, -1.396671, -2.653924, 0, 0, 0, 1, 1,
-0.1163316, 0.1362787, -0.2689696, 0, 0, 0, 1, 1,
-0.1100642, -0.2382854, -1.341521, 1, 1, 1, 1, 1,
-0.1064276, -0.06691542, -2.102406, 1, 1, 1, 1, 1,
-0.100917, 0.03185338, 0.9955593, 1, 1, 1, 1, 1,
-0.09432318, 1.487722, 0.6494405, 1, 1, 1, 1, 1,
-0.09411988, -0.06860197, -3.202608, 1, 1, 1, 1, 1,
-0.09299397, 0.3221482, -0.09282641, 1, 1, 1, 1, 1,
-0.09199522, -1.720506, -1.976205, 1, 1, 1, 1, 1,
-0.09146739, -1.161258, -3.163747, 1, 1, 1, 1, 1,
-0.09128273, 0.2299401, -0.3295286, 1, 1, 1, 1, 1,
-0.09091283, -0.1642464, -3.153209, 1, 1, 1, 1, 1,
-0.08144021, 2.343808, -0.0425358, 1, 1, 1, 1, 1,
-0.08044688, 0.007210433, -1.080932, 1, 1, 1, 1, 1,
-0.07998607, -1.244411, -4.009982, 1, 1, 1, 1, 1,
-0.07917674, 0.573844, -2.922344, 1, 1, 1, 1, 1,
-0.07816958, -1.462616, -1.923822, 1, 1, 1, 1, 1,
-0.0776365, 0.7052773, 0.9776222, 0, 0, 1, 1, 1,
-0.07274292, -0.9349714, -2.944162, 1, 0, 0, 1, 1,
-0.06861723, 1.402053, -0.6359501, 1, 0, 0, 1, 1,
-0.06780178, -0.4058547, -1.499348, 1, 0, 0, 1, 1,
-0.06512865, -1.366706, -2.897757, 1, 0, 0, 1, 1,
-0.06235258, -0.4377573, -3.837689, 1, 0, 0, 1, 1,
-0.06030595, 0.3817472, 0.03808996, 0, 0, 0, 1, 1,
-0.06027186, -0.2370527, -2.027498, 0, 0, 0, 1, 1,
-0.05428406, 0.3034332, -0.6817356, 0, 0, 0, 1, 1,
-0.04860422, -1.120736, -3.527789, 0, 0, 0, 1, 1,
-0.04750165, 0.6094175, 0.6797186, 0, 0, 0, 1, 1,
-0.04397883, 1.271294, -1.208178, 0, 0, 0, 1, 1,
-0.04380136, -0.156336, -3.24601, 0, 0, 0, 1, 1,
-0.0425142, 1.536726, 1.456865, 1, 1, 1, 1, 1,
-0.03435164, 0.1630908, -0.02944676, 1, 1, 1, 1, 1,
-0.03243913, 0.1712747, 0.07947307, 1, 1, 1, 1, 1,
-0.03200907, 1.62761, -0.2364675, 1, 1, 1, 1, 1,
-0.03039682, 0.7407609, -0.1052194, 1, 1, 1, 1, 1,
-0.03029301, -1.319087, -2.483896, 1, 1, 1, 1, 1,
-0.02882392, -0.0296237, -1.976672, 1, 1, 1, 1, 1,
-0.02641043, 0.9112766, -0.9458663, 1, 1, 1, 1, 1,
-0.01651439, 1.772079, 0.4818258, 1, 1, 1, 1, 1,
-0.01643397, -0.4133013, -3.684998, 1, 1, 1, 1, 1,
-0.01423863, 0.1552605, -1.395247, 1, 1, 1, 1, 1,
-0.00983477, -0.1933642, -4.537881, 1, 1, 1, 1, 1,
-0.009293269, -0.8805171, -2.605225, 1, 1, 1, 1, 1,
-0.004597256, -0.3699886, -2.986861, 1, 1, 1, 1, 1,
0.0004455145, 1.38358, -0.3630301, 1, 1, 1, 1, 1,
0.006169514, 1.687267, 0.2127695, 0, 0, 1, 1, 1,
0.01184994, -0.2153177, 2.786204, 1, 0, 0, 1, 1,
0.01449514, 0.4856578, -0.6672535, 1, 0, 0, 1, 1,
0.01564942, 0.172986, -1.890936, 1, 0, 0, 1, 1,
0.01613974, 1.379517, -0.1086729, 1, 0, 0, 1, 1,
0.02215087, -0.6233255, 0.7541021, 1, 0, 0, 1, 1,
0.02255261, 2.430588, 0.8505678, 0, 0, 0, 1, 1,
0.02655926, -1.223826, 1.545943, 0, 0, 0, 1, 1,
0.0284058, 1.469026, 0.8102614, 0, 0, 0, 1, 1,
0.02919796, -0.2098613, 3.078159, 0, 0, 0, 1, 1,
0.03133062, -1.942926, 2.586289, 0, 0, 0, 1, 1,
0.03203665, -0.7076094, 3.088365, 0, 0, 0, 1, 1,
0.03428866, 0.8650736, -0.7128803, 0, 0, 0, 1, 1,
0.03646633, -0.2431115, 2.963559, 1, 1, 1, 1, 1,
0.03865073, -0.7609021, 2.157731, 1, 1, 1, 1, 1,
0.04227587, 0.6280134, -0.6166757, 1, 1, 1, 1, 1,
0.04246939, 0.002163531, 2.415278, 1, 1, 1, 1, 1,
0.04378552, -0.08060246, 3.078506, 1, 1, 1, 1, 1,
0.04871795, -0.08272507, 2.609992, 1, 1, 1, 1, 1,
0.04880562, 0.882758, 0.2030612, 1, 1, 1, 1, 1,
0.04933425, 1.011454, 1.151858, 1, 1, 1, 1, 1,
0.05129144, -0.1766862, 2.569129, 1, 1, 1, 1, 1,
0.05304616, -0.1257149, 3.621221, 1, 1, 1, 1, 1,
0.05319925, 0.5062206, -0.5955593, 1, 1, 1, 1, 1,
0.0562108, 0.1511934, 0.5190673, 1, 1, 1, 1, 1,
0.05685944, -0.04579053, 1.54241, 1, 1, 1, 1, 1,
0.06004056, -0.3260112, 1.705093, 1, 1, 1, 1, 1,
0.0601765, -0.7502058, 3.965642, 1, 1, 1, 1, 1,
0.06273994, 1.489187, -0.2078811, 0, 0, 1, 1, 1,
0.0644555, 0.01778989, 1.143844, 1, 0, 0, 1, 1,
0.07034911, 1.237, 0.234167, 1, 0, 0, 1, 1,
0.07093528, 0.1614727, 1.064702, 1, 0, 0, 1, 1,
0.07616922, -0.2766511, 4.604473, 1, 0, 0, 1, 1,
0.07659534, -1.615699, 3.545622, 1, 0, 0, 1, 1,
0.07882122, -0.1320664, 1.110969, 0, 0, 0, 1, 1,
0.08025621, 0.3765437, 0.9966584, 0, 0, 0, 1, 1,
0.08543893, -1.160186, 3.127479, 0, 0, 0, 1, 1,
0.08581049, 0.3271154, 2.46143, 0, 0, 0, 1, 1,
0.08587691, -1.511355, 4.686509, 0, 0, 0, 1, 1,
0.08614072, -0.5651608, 1.908624, 0, 0, 0, 1, 1,
0.08783579, 0.308898, -1.293555, 0, 0, 0, 1, 1,
0.0931632, -1.580112, 2.857105, 1, 1, 1, 1, 1,
0.09329744, 0.7869132, 0.2039545, 1, 1, 1, 1, 1,
0.09477697, -1.201903, 3.00184, 1, 1, 1, 1, 1,
0.09560583, 0.3093911, -0.01845498, 1, 1, 1, 1, 1,
0.09808645, 1.55642, 0.3769025, 1, 1, 1, 1, 1,
0.09813792, 1.072946, -0.8467205, 1, 1, 1, 1, 1,
0.1013988, 0.4407733, 0.8243786, 1, 1, 1, 1, 1,
0.103038, -0.1910111, 2.579697, 1, 1, 1, 1, 1,
0.1048512, -0.3990493, 3.890553, 1, 1, 1, 1, 1,
0.1108479, -1.93764, 4.407133, 1, 1, 1, 1, 1,
0.1138118, 0.6836739, -0.9823406, 1, 1, 1, 1, 1,
0.1139182, -0.5175539, 2.489293, 1, 1, 1, 1, 1,
0.1161481, -1.323145, 3.585563, 1, 1, 1, 1, 1,
0.1180184, 0.4083593, 0.3037208, 1, 1, 1, 1, 1,
0.1192319, 0.1496146, 0.261596, 1, 1, 1, 1, 1,
0.1195055, 0.6817463, 0.78775, 0, 0, 1, 1, 1,
0.1202652, 0.5006455, -0.6275898, 1, 0, 0, 1, 1,
0.1228287, 0.1541861, -0.02450857, 1, 0, 0, 1, 1,
0.1257255, 0.8474541, 0.3969537, 1, 0, 0, 1, 1,
0.1297896, 0.432467, -0.8157784, 1, 0, 0, 1, 1,
0.1315652, -0.8398615, 3.434735, 1, 0, 0, 1, 1,
0.1357925, -0.2495612, 2.75183, 0, 0, 0, 1, 1,
0.1366712, 0.4940012, 2.29808, 0, 0, 0, 1, 1,
0.1432777, -0.3285652, 0.7987908, 0, 0, 0, 1, 1,
0.1517824, -0.8709731, 2.043333, 0, 0, 0, 1, 1,
0.1545289, 1.072837, 1.590575, 0, 0, 0, 1, 1,
0.1578786, 0.3725461, -0.6655678, 0, 0, 0, 1, 1,
0.1639127, -0.3737249, 2.556908, 0, 0, 0, 1, 1,
0.1656304, -0.7288004, 2.744967, 1, 1, 1, 1, 1,
0.166261, -0.1902985, 1.408488, 1, 1, 1, 1, 1,
0.1700209, -1.313563, 2.493534, 1, 1, 1, 1, 1,
0.1742062, -1.435467, 3.278286, 1, 1, 1, 1, 1,
0.1744007, 2.032781, -1.206742, 1, 1, 1, 1, 1,
0.1760083, -0.7163053, 2.447093, 1, 1, 1, 1, 1,
0.1773353, 0.03365909, 0.1852953, 1, 1, 1, 1, 1,
0.1800959, -0.2417564, 2.457699, 1, 1, 1, 1, 1,
0.1821917, -0.9745043, 2.095621, 1, 1, 1, 1, 1,
0.1835595, -0.6821481, 3.655398, 1, 1, 1, 1, 1,
0.1880391, 1.003269, -0.05769506, 1, 1, 1, 1, 1,
0.1935638, 0.8539339, 0.2309011, 1, 1, 1, 1, 1,
0.1976354, 0.0501251, 1.435702, 1, 1, 1, 1, 1,
0.2021594, 1.179458, 2.072036, 1, 1, 1, 1, 1,
0.2044872, 0.6851296, -0.3872703, 1, 1, 1, 1, 1,
0.2137787, 0.6848889, 1.063633, 0, 0, 1, 1, 1,
0.2145905, 0.04123185, 0.7766618, 1, 0, 0, 1, 1,
0.2173866, 1.094676, -0.04772184, 1, 0, 0, 1, 1,
0.2175995, -1.324391, 2.836523, 1, 0, 0, 1, 1,
0.2184584, 1.019092, -0.6842113, 1, 0, 0, 1, 1,
0.2214005, 1.33339, 0.1919423, 1, 0, 0, 1, 1,
0.2221875, 0.8807809, 0.01963714, 0, 0, 0, 1, 1,
0.2238291, -0.1834873, 1.901126, 0, 0, 0, 1, 1,
0.2246509, 1.206245, -1.14527, 0, 0, 0, 1, 1,
0.2252642, 0.2470378, 1.828461, 0, 0, 0, 1, 1,
0.2303889, 0.1930457, 1.763766, 0, 0, 0, 1, 1,
0.2319693, 0.327654, -0.2285673, 0, 0, 0, 1, 1,
0.2325771, 0.6831325, -0.5012998, 0, 0, 0, 1, 1,
0.2344234, 0.6785905, 0.5988677, 1, 1, 1, 1, 1,
0.2427553, -0.5994393, 3.43987, 1, 1, 1, 1, 1,
0.2511956, -1.537716, 1.698838, 1, 1, 1, 1, 1,
0.2575897, -0.5155319, 2.342076, 1, 1, 1, 1, 1,
0.2596037, -0.2823528, 3.780785, 1, 1, 1, 1, 1,
0.2598594, 0.1657727, 1.384416, 1, 1, 1, 1, 1,
0.2646483, 0.6227608, -0.7715448, 1, 1, 1, 1, 1,
0.2691328, 1.191001, 1.036133, 1, 1, 1, 1, 1,
0.2734978, -0.9918894, 2.221344, 1, 1, 1, 1, 1,
0.2741643, -0.7125014, 1.627132, 1, 1, 1, 1, 1,
0.2758432, -0.7451972, 0.7284973, 1, 1, 1, 1, 1,
0.2762153, -1.900224, 1.428515, 1, 1, 1, 1, 1,
0.2831689, -0.2739226, 4.354331, 1, 1, 1, 1, 1,
0.2838323, 1.340792, -0.2675985, 1, 1, 1, 1, 1,
0.2866509, -1.21004, 1.903701, 1, 1, 1, 1, 1,
0.2883162, -1.366276, 4.249035, 0, 0, 1, 1, 1,
0.2901284, -0.6120054, 0.1600261, 1, 0, 0, 1, 1,
0.2918767, -1.232347, 2.534734, 1, 0, 0, 1, 1,
0.2956995, 0.2738703, -0.3030216, 1, 0, 0, 1, 1,
0.3014723, -1.289933, 2.954588, 1, 0, 0, 1, 1,
0.3025084, -0.9554085, 3.808285, 1, 0, 0, 1, 1,
0.3055634, -1.399098, 4.615736, 0, 0, 0, 1, 1,
0.3070727, 0.01894948, 0.6702605, 0, 0, 0, 1, 1,
0.3079775, 0.1405852, 1.120655, 0, 0, 0, 1, 1,
0.3092783, -1.243188, 3.669954, 0, 0, 0, 1, 1,
0.3105525, -0.242192, 3.893492, 0, 0, 0, 1, 1,
0.3112048, 0.8195079, 0.01483095, 0, 0, 0, 1, 1,
0.312328, -1.032859, 2.737329, 0, 0, 0, 1, 1,
0.3188714, 0.9167067, 0.7142107, 1, 1, 1, 1, 1,
0.3230762, -0.9939311, 2.087536, 1, 1, 1, 1, 1,
0.3303715, -0.4383554, 2.299668, 1, 1, 1, 1, 1,
0.3309208, 0.499887, 0.9044202, 1, 1, 1, 1, 1,
0.3319628, 1.385954, -0.1135751, 1, 1, 1, 1, 1,
0.332346, 0.3295367, 0.1054628, 1, 1, 1, 1, 1,
0.3329252, 0.3344969, 0.2594534, 1, 1, 1, 1, 1,
0.337696, -0.7917511, 3.826217, 1, 1, 1, 1, 1,
0.3379159, -0.1896088, 0.6848402, 1, 1, 1, 1, 1,
0.339368, 1.332957, 0.827386, 1, 1, 1, 1, 1,
0.3404806, 0.7232268, 1.415227, 1, 1, 1, 1, 1,
0.3464935, 0.1969872, 2.448874, 1, 1, 1, 1, 1,
0.3702939, 0.006036464, 2.44579, 1, 1, 1, 1, 1,
0.3742502, -2.061355, 2.078493, 1, 1, 1, 1, 1,
0.3744148, 0.9981599, 0.8022369, 1, 1, 1, 1, 1,
0.3746973, 0.4165556, -0.2530442, 0, 0, 1, 1, 1,
0.379912, -0.4901502, 1.589687, 1, 0, 0, 1, 1,
0.3920352, -0.6690593, 3.097829, 1, 0, 0, 1, 1,
0.4004933, 0.4630747, 0.8572327, 1, 0, 0, 1, 1,
0.4012078, -1.466123, 2.345826, 1, 0, 0, 1, 1,
0.4014258, -0.686774, 2.570213, 1, 0, 0, 1, 1,
0.4014327, -1.627956, 2.726633, 0, 0, 0, 1, 1,
0.404446, -0.7254537, 3.511615, 0, 0, 0, 1, 1,
0.4051959, 0.6251786, 2.373671, 0, 0, 0, 1, 1,
0.4082988, -0.1209924, -0.5551269, 0, 0, 0, 1, 1,
0.4083572, -0.4926582, 3.551195, 0, 0, 0, 1, 1,
0.4121732, 1.196856, 0.207899, 0, 0, 0, 1, 1,
0.4143503, -0.3183563, 3.380532, 0, 0, 0, 1, 1,
0.4165486, 0.1412742, 1.651941, 1, 1, 1, 1, 1,
0.4168181, 1.461712, -0.8296354, 1, 1, 1, 1, 1,
0.4197396, 1.080457, 0.8016811, 1, 1, 1, 1, 1,
0.4261056, 0.2023194, 1.933381, 1, 1, 1, 1, 1,
0.4271621, -0.3912753, 2.950472, 1, 1, 1, 1, 1,
0.4275596, -1.399383, 1.481268, 1, 1, 1, 1, 1,
0.4279002, 0.7663279, 0.04558967, 1, 1, 1, 1, 1,
0.4283388, 0.2940489, 3.60903, 1, 1, 1, 1, 1,
0.4287801, 0.9210336, 0.007890017, 1, 1, 1, 1, 1,
0.4306489, -0.2382027, 1.421238, 1, 1, 1, 1, 1,
0.4308978, 0.06665637, 1.608804, 1, 1, 1, 1, 1,
0.4311074, 0.6822578, 0.1879345, 1, 1, 1, 1, 1,
0.4320808, 0.6003206, -0.6261349, 1, 1, 1, 1, 1,
0.4334621, 0.7587832, 1.039644, 1, 1, 1, 1, 1,
0.4361089, -1.071021, 2.636401, 1, 1, 1, 1, 1,
0.4365864, 0.6888321, 0.04962775, 0, 0, 1, 1, 1,
0.4380246, 1.528349, -1.114033, 1, 0, 0, 1, 1,
0.4425699, 0.6474767, -1.727524, 1, 0, 0, 1, 1,
0.4429911, 0.6806898, -0.587876, 1, 0, 0, 1, 1,
0.4453705, 1.248846, -0.2840175, 1, 0, 0, 1, 1,
0.4475542, 0.1228137, 1.886443, 1, 0, 0, 1, 1,
0.4568583, -1.211689, 2.8437, 0, 0, 0, 1, 1,
0.457279, 0.1832599, 2.466159, 0, 0, 0, 1, 1,
0.4595675, 1.888843, 2.193959, 0, 0, 0, 1, 1,
0.4636633, -0.8390405, 2.640745, 0, 0, 0, 1, 1,
0.4649744, -0.8462474, 3.311464, 0, 0, 0, 1, 1,
0.4666793, -0.4455581, 1.805828, 0, 0, 0, 1, 1,
0.4678324, -0.5949066, 2.326188, 0, 0, 0, 1, 1,
0.4681493, 0.2195508, 0.9484193, 1, 1, 1, 1, 1,
0.4699568, -0.004847409, -0.005804929, 1, 1, 1, 1, 1,
0.471599, -0.8882489, 3.148344, 1, 1, 1, 1, 1,
0.4729894, 0.6060981, 0.9299351, 1, 1, 1, 1, 1,
0.4825605, 0.9483688, 0.1307242, 1, 1, 1, 1, 1,
0.4850471, 0.7000433, 0.7435622, 1, 1, 1, 1, 1,
0.4863089, -1.123531, 1.799204, 1, 1, 1, 1, 1,
0.4878492, -0.07229112, 1.284676, 1, 1, 1, 1, 1,
0.4923213, 0.2345462, 0.2702579, 1, 1, 1, 1, 1,
0.4949772, 1.22116, 0.3742004, 1, 1, 1, 1, 1,
0.4959616, 0.1248679, 1.563277, 1, 1, 1, 1, 1,
0.4967747, -0.07788514, 1.603193, 1, 1, 1, 1, 1,
0.4968457, 0.5635381, 2.632196, 1, 1, 1, 1, 1,
0.5009649, 0.1849086, 2.891701, 1, 1, 1, 1, 1,
0.5055569, 0.8634388, 0.3289161, 1, 1, 1, 1, 1,
0.5080231, -0.4163313, 1.498426, 0, 0, 1, 1, 1,
0.5097339, 0.3636181, 2.842533, 1, 0, 0, 1, 1,
0.5104293, 0.1524826, 0.8023562, 1, 0, 0, 1, 1,
0.5116758, -0.2427071, 1.396889, 1, 0, 0, 1, 1,
0.5164852, -0.2729422, 2.630118, 1, 0, 0, 1, 1,
0.5165415, -0.5779828, 1.555236, 1, 0, 0, 1, 1,
0.5183447, -0.1848842, 1.896516, 0, 0, 0, 1, 1,
0.5205257, -0.5095457, 2.511121, 0, 0, 0, 1, 1,
0.5207646, -0.805779, 3.256524, 0, 0, 0, 1, 1,
0.5265107, 0.06268152, 2.182594, 0, 0, 0, 1, 1,
0.5303237, -0.5917816, 4.410196, 0, 0, 0, 1, 1,
0.5312724, 1.167552, 0.2589246, 0, 0, 0, 1, 1,
0.5347666, 0.6196231, 2.535945, 0, 0, 0, 1, 1,
0.5417876, -0.8630785, 1.399691, 1, 1, 1, 1, 1,
0.5444441, 0.4836504, 2.038091, 1, 1, 1, 1, 1,
0.5541778, 0.9653714, 0.3772089, 1, 1, 1, 1, 1,
0.5555718, 0.5211759, 0.4301845, 1, 1, 1, 1, 1,
0.5564864, -0.662693, 2.763485, 1, 1, 1, 1, 1,
0.5578831, -0.2531869, 3.007337, 1, 1, 1, 1, 1,
0.5654137, -1.011121, 1.841334, 1, 1, 1, 1, 1,
0.5719322, 0.782023, 0.4201185, 1, 1, 1, 1, 1,
0.5727407, -0.5336062, 2.767128, 1, 1, 1, 1, 1,
0.5760017, -0.9375236, 1.539735, 1, 1, 1, 1, 1,
0.5783337, -0.6518762, 4.089779, 1, 1, 1, 1, 1,
0.5846117, -0.7450628, 2.257566, 1, 1, 1, 1, 1,
0.586616, 0.2746263, 3.090844, 1, 1, 1, 1, 1,
0.5873078, -0.5108237, 3.811543, 1, 1, 1, 1, 1,
0.5915761, 0.5514168, 0.01142055, 1, 1, 1, 1, 1,
0.5920824, -0.4382407, 3.301825, 0, 0, 1, 1, 1,
0.5927613, 0.6021102, 0.6185099, 1, 0, 0, 1, 1,
0.5973571, 0.1699732, 0.2031861, 1, 0, 0, 1, 1,
0.5980257, 1.044137, 0.3969232, 1, 0, 0, 1, 1,
0.6048741, 0.2304889, 0.3125973, 1, 0, 0, 1, 1,
0.6057481, -0.8330494, 2.237741, 1, 0, 0, 1, 1,
0.6081497, 0.8710604, -0.1281219, 0, 0, 0, 1, 1,
0.6150828, 0.2408167, -0.383459, 0, 0, 0, 1, 1,
0.625043, 0.2986816, -0.613966, 0, 0, 0, 1, 1,
0.6303357, 1.593702, -1.578213, 0, 0, 0, 1, 1,
0.6321145, -0.2454301, 1.231865, 0, 0, 0, 1, 1,
0.6338689, 2.527769, 1.506043, 0, 0, 0, 1, 1,
0.6343578, 0.102687, 0.3342981, 0, 0, 0, 1, 1,
0.6346546, 2.958831, 0.1612385, 1, 1, 1, 1, 1,
0.6396495, 2.220681, -0.9248136, 1, 1, 1, 1, 1,
0.6428141, 1.780418, -0.2649219, 1, 1, 1, 1, 1,
0.6536277, 0.1434979, 1.525694, 1, 1, 1, 1, 1,
0.6575243, 0.3771878, 1.968642, 1, 1, 1, 1, 1,
0.6606479, 1.143855, 0.8665112, 1, 1, 1, 1, 1,
0.6650291, 1.188509, 1.396747, 1, 1, 1, 1, 1,
0.6662117, 0.1059845, 1.419787, 1, 1, 1, 1, 1,
0.673709, 0.3554907, 1.657465, 1, 1, 1, 1, 1,
0.6756038, 0.4868613, 1.671917, 1, 1, 1, 1, 1,
0.6786464, -1.363217, 4.075227, 1, 1, 1, 1, 1,
0.6790473, 0.2469025, 2.060303, 1, 1, 1, 1, 1,
0.6814576, 0.1388663, 2.7555, 1, 1, 1, 1, 1,
0.6848178, 0.7618499, 0.7888963, 1, 1, 1, 1, 1,
0.686592, -0.3141932, 3.045551, 1, 1, 1, 1, 1,
0.686737, 0.6775648, 1.17151, 0, 0, 1, 1, 1,
0.686955, -1.674075, 4.049739, 1, 0, 0, 1, 1,
0.6897292, 0.4478368, 2.171215, 1, 0, 0, 1, 1,
0.6985658, -0.7944518, 2.64273, 1, 0, 0, 1, 1,
0.6990182, 0.6469643, 1.816072, 1, 0, 0, 1, 1,
0.7010402, 0.9805539, 0.2767458, 1, 0, 0, 1, 1,
0.7060597, -1.966359, 2.024024, 0, 0, 0, 1, 1,
0.7110385, 1.086493, -0.5010693, 0, 0, 0, 1, 1,
0.7166862, -0.07346368, 1.257311, 0, 0, 0, 1, 1,
0.7167685, 0.149261, 0.1498305, 0, 0, 0, 1, 1,
0.7192538, 0.932657, 1.202436, 0, 0, 0, 1, 1,
0.7240695, -0.08008891, 2.769248, 0, 0, 0, 1, 1,
0.7243347, 1.142833, 0.2876962, 0, 0, 0, 1, 1,
0.724463, 0.01970376, 1.838677, 1, 1, 1, 1, 1,
0.7262452, -0.1427149, 3.204732, 1, 1, 1, 1, 1,
0.7311355, -0.4252673, 2.988616, 1, 1, 1, 1, 1,
0.7338459, -0.6950251, 2.31164, 1, 1, 1, 1, 1,
0.737434, -0.9414071, 2.846277, 1, 1, 1, 1, 1,
0.7405409, 0.736632, 2.262716, 1, 1, 1, 1, 1,
0.74489, 2.068701, -0.3402944, 1, 1, 1, 1, 1,
0.7455224, 0.1606444, 1.344834, 1, 1, 1, 1, 1,
0.7533527, 0.7145258, 1.664489, 1, 1, 1, 1, 1,
0.7550805, -1.341221, 2.758218, 1, 1, 1, 1, 1,
0.7568262, 1.09979, -0.1962395, 1, 1, 1, 1, 1,
0.7581619, 0.8028879, 0.1927697, 1, 1, 1, 1, 1,
0.7643743, 1.884023, 0.6435996, 1, 1, 1, 1, 1,
0.7653283, 1.640166, 0.517328, 1, 1, 1, 1, 1,
0.7689924, 0.625172, 1.446209, 1, 1, 1, 1, 1,
0.7697397, -0.3469197, 0.9026936, 0, 0, 1, 1, 1,
0.776934, 0.2644469, 1.199679, 1, 0, 0, 1, 1,
0.7775899, -0.6518795, 4.158879, 1, 0, 0, 1, 1,
0.7790564, -0.5837138, 2.561965, 1, 0, 0, 1, 1,
0.7908804, 0.2475263, 1.404444, 1, 0, 0, 1, 1,
0.8000188, 0.1915737, 1.244999, 1, 0, 0, 1, 1,
0.80582, 1.966996, 1.48211, 0, 0, 0, 1, 1,
0.8088603, -0.9073321, 3.731045, 0, 0, 0, 1, 1,
0.8140721, 0.7488438, 2.628485, 0, 0, 0, 1, 1,
0.8262631, -2.666605, 2.854214, 0, 0, 0, 1, 1,
0.832309, -0.5602091, 1.482307, 0, 0, 0, 1, 1,
0.8352256, -0.386481, -0.5441303, 0, 0, 0, 1, 1,
0.8395321, -0.2890199, 3.059906, 0, 0, 0, 1, 1,
0.8468679, -0.7255104, 2.781992, 1, 1, 1, 1, 1,
0.8546481, -0.7773342, 3.101823, 1, 1, 1, 1, 1,
0.8563674, -1.081986, 3.007258, 1, 1, 1, 1, 1,
0.8573762, -1.396449, 4.942889, 1, 1, 1, 1, 1,
0.8581893, 0.4703147, 0.5079952, 1, 1, 1, 1, 1,
0.8588169, -0.06557405, 2.260864, 1, 1, 1, 1, 1,
0.8650644, 1.649356, 0.3320787, 1, 1, 1, 1, 1,
0.8671038, -0.1967336, 2.652179, 1, 1, 1, 1, 1,
0.8694241, 0.5676453, 0.3673354, 1, 1, 1, 1, 1,
0.8695851, 0.1736289, 2.717962, 1, 1, 1, 1, 1,
0.8704945, 0.3807368, 2.143559, 1, 1, 1, 1, 1,
0.8762993, 0.4370565, 0.7565103, 1, 1, 1, 1, 1,
0.886367, -0.1015064, 2.351087, 1, 1, 1, 1, 1,
0.8887301, -0.2513318, 1.077904, 1, 1, 1, 1, 1,
0.8925623, -0.8146302, 2.773289, 1, 1, 1, 1, 1,
0.8980535, -0.3120421, 2.361939, 0, 0, 1, 1, 1,
0.9079269, -0.2074464, 1.277022, 1, 0, 0, 1, 1,
0.9125181, 1.545016, 1.364387, 1, 0, 0, 1, 1,
0.9151431, -1.041744, 2.115775, 1, 0, 0, 1, 1,
0.9178915, 0.3238512, 0.5717743, 1, 0, 0, 1, 1,
0.9195384, -1.214896, 3.887573, 1, 0, 0, 1, 1,
0.9207484, -1.496657, 1.698756, 0, 0, 0, 1, 1,
0.9207827, -0.9493663, 2.625022, 0, 0, 0, 1, 1,
0.9215252, 0.2189878, 2.581179, 0, 0, 0, 1, 1,
0.9221633, -1.299373, 2.596195, 0, 0, 0, 1, 1,
0.9264685, 1.862886, 0.7290293, 0, 0, 0, 1, 1,
0.9324343, -0.7129195, 2.051908, 0, 0, 0, 1, 1,
0.9328611, 0.42487, 0.5892211, 0, 0, 0, 1, 1,
0.9336736, -0.9624451, 0.157333, 1, 1, 1, 1, 1,
0.9337107, -0.03927541, 0.3885294, 1, 1, 1, 1, 1,
0.9354877, -1.536236, 2.124524, 1, 1, 1, 1, 1,
0.9377359, 0.7241991, 1.943709, 1, 1, 1, 1, 1,
0.9442763, -2.98602, 3.115857, 1, 1, 1, 1, 1,
0.9449441, 1.913048, 2.327142, 1, 1, 1, 1, 1,
0.951223, -1.037923, 3.150069, 1, 1, 1, 1, 1,
0.9524747, -1.96333, 3.172769, 1, 1, 1, 1, 1,
0.9567031, -0.3281196, 0.3137523, 1, 1, 1, 1, 1,
0.9570631, 0.1909551, 2.309017, 1, 1, 1, 1, 1,
0.9593953, -0.1509695, 2.332142, 1, 1, 1, 1, 1,
0.9713083, -1.571001, 3.366153, 1, 1, 1, 1, 1,
0.9743342, 0.02572623, -0.3715645, 1, 1, 1, 1, 1,
0.977275, 0.3240314, -0.7414333, 1, 1, 1, 1, 1,
0.9810693, 0.09386438, 1.300115, 1, 1, 1, 1, 1,
0.9899343, -0.4123472, 3.519143, 0, 0, 1, 1, 1,
0.995669, -0.1639936, 1.30024, 1, 0, 0, 1, 1,
0.9961922, -0.5848452, 1.789053, 1, 0, 0, 1, 1,
0.996661, -0.829568, 3.574442, 1, 0, 0, 1, 1,
0.9996226, -1.725291, 4.235161, 1, 0, 0, 1, 1,
1.000828, -0.6306821, 1.100462, 1, 0, 0, 1, 1,
1.00176, -1.6454, 1.471208, 0, 0, 0, 1, 1,
1.001943, -0.2010783, 1.230656, 0, 0, 0, 1, 1,
1.003113, 0.3686101, 1.057721, 0, 0, 0, 1, 1,
1.003341, -0.8334843, 2.080215, 0, 0, 0, 1, 1,
1.007714, 0.7915818, 1.474224, 0, 0, 0, 1, 1,
1.013374, -0.09752356, 3.611306, 0, 0, 0, 1, 1,
1.014639, 1.670304, 1.874718, 0, 0, 0, 1, 1,
1.015009, -0.6559674, 1.854658, 1, 1, 1, 1, 1,
1.027385, -0.2443002, -0.322864, 1, 1, 1, 1, 1,
1.027489, -0.4404208, 2.688566, 1, 1, 1, 1, 1,
1.028525, -0.7549905, 0.9292381, 1, 1, 1, 1, 1,
1.035415, 0.9796697, -0.1126121, 1, 1, 1, 1, 1,
1.040937, -0.2506955, 1.621529, 1, 1, 1, 1, 1,
1.042919, -1.777947, 4.074063, 1, 1, 1, 1, 1,
1.053399, 0.6206305, 1.382847, 1, 1, 1, 1, 1,
1.055485, 0.4282086, 1.570256, 1, 1, 1, 1, 1,
1.056001, -1.536446, 3.27322, 1, 1, 1, 1, 1,
1.057327, 0.1444545, 2.203145, 1, 1, 1, 1, 1,
1.058646, -0.4909297, 2.149077, 1, 1, 1, 1, 1,
1.075556, -1.283771, 1.905673, 1, 1, 1, 1, 1,
1.07936, -1.22251, 3.833236, 1, 1, 1, 1, 1,
1.08243, 0.2431168, 1.787057, 1, 1, 1, 1, 1,
1.085202, 0.7525792, 2.041555, 0, 0, 1, 1, 1,
1.086914, 1.385951, 0.2958273, 1, 0, 0, 1, 1,
1.091265, -0.2085559, 2.075258, 1, 0, 0, 1, 1,
1.1055, 0.07556556, 0.6364679, 1, 0, 0, 1, 1,
1.116683, -0.5561805, 2.212959, 1, 0, 0, 1, 1,
1.124412, 0.8398015, 0.6953097, 1, 0, 0, 1, 1,
1.134559, -1.497715, 3.51294, 0, 0, 0, 1, 1,
1.135396, -2.577249, 3.858503, 0, 0, 0, 1, 1,
1.143183, 0.8662443, -1.548601, 0, 0, 0, 1, 1,
1.147823, -0.3684073, 1.955754, 0, 0, 0, 1, 1,
1.155371, -0.3120591, 1.459761, 0, 0, 0, 1, 1,
1.155953, -0.5992476, 2.473327, 0, 0, 0, 1, 1,
1.157507, -0.6290373, 2.810591, 0, 0, 0, 1, 1,
1.159312, -0.5207039, 4.092706, 1, 1, 1, 1, 1,
1.160675, -1.748376, 2.218713, 1, 1, 1, 1, 1,
1.166517, 1.891197, 1.689756, 1, 1, 1, 1, 1,
1.174872, -1.169812, 1.049459, 1, 1, 1, 1, 1,
1.176388, 0.1629256, 1.848588, 1, 1, 1, 1, 1,
1.193843, 0.3315059, 0.5726998, 1, 1, 1, 1, 1,
1.194835, -1.434038, 2.00563, 1, 1, 1, 1, 1,
1.202087, 1.007444, 0.4001331, 1, 1, 1, 1, 1,
1.209842, -0.1281825, 3.540488, 1, 1, 1, 1, 1,
1.210162, -1.299062, 1.522181, 1, 1, 1, 1, 1,
1.211394, -0.5800611, 3.43835, 1, 1, 1, 1, 1,
1.211615, -0.7915772, 2.083119, 1, 1, 1, 1, 1,
1.216214, -1.012125, 2.557206, 1, 1, 1, 1, 1,
1.229268, -0.5167553, 2.851122, 1, 1, 1, 1, 1,
1.238994, 1.612392, 0.7900758, 1, 1, 1, 1, 1,
1.243742, -0.4493134, 2.568602, 0, 0, 1, 1, 1,
1.247529, -1.638007, 3.015646, 1, 0, 0, 1, 1,
1.248854, -2.73912, 1.927, 1, 0, 0, 1, 1,
1.256536, -1.106152, 1.150999, 1, 0, 0, 1, 1,
1.280393, -0.1956322, 0.8351402, 1, 0, 0, 1, 1,
1.291631, 0.4646308, 2.09868, 1, 0, 0, 1, 1,
1.293219, -3.077507, 2.811762, 0, 0, 0, 1, 1,
1.294344, -0.7197174, 4.196304, 0, 0, 0, 1, 1,
1.302669, -1.161651, 1.690884, 0, 0, 0, 1, 1,
1.304193, -0.1884242, 0.8672537, 0, 0, 0, 1, 1,
1.309903, 1.64443, 1.592952, 0, 0, 0, 1, 1,
1.314871, 0.3561325, 1.390064, 0, 0, 0, 1, 1,
1.323487, -0.3382854, 0.004661113, 0, 0, 0, 1, 1,
1.327004, -0.5860344, 1.202812, 1, 1, 1, 1, 1,
1.331461, 0.7279533, -0.1322848, 1, 1, 1, 1, 1,
1.331932, -0.5434153, -0.168718, 1, 1, 1, 1, 1,
1.341606, -0.08438282, 3.298501, 1, 1, 1, 1, 1,
1.346391, -0.4433872, 1.88205, 1, 1, 1, 1, 1,
1.348681, -2.433009, 3.902795, 1, 1, 1, 1, 1,
1.355134, -2.081037, 2.40493, 1, 1, 1, 1, 1,
1.370123, -1.50662, 0.6129122, 1, 1, 1, 1, 1,
1.372073, -1.075657, 1.278186, 1, 1, 1, 1, 1,
1.375789, -0.7159894, 1.017571, 1, 1, 1, 1, 1,
1.383557, -0.0396715, 0.6806659, 1, 1, 1, 1, 1,
1.393704, 0.01946778, 1.754557, 1, 1, 1, 1, 1,
1.406911, 0.2271559, 1.553129, 1, 1, 1, 1, 1,
1.409107, -1.418923, 2.963387, 1, 1, 1, 1, 1,
1.410371, 0.3501999, 1.27093, 1, 1, 1, 1, 1,
1.418392, 0.4361381, 1.11382, 0, 0, 1, 1, 1,
1.420942, -0.0696228, 3.822911, 1, 0, 0, 1, 1,
1.425364, 0.565773, 0.7101726, 1, 0, 0, 1, 1,
1.432781, -0.2912783, 2.330651, 1, 0, 0, 1, 1,
1.435838, 1.491096, 2.404068, 1, 0, 0, 1, 1,
1.454748, -0.4457546, 1.597627, 1, 0, 0, 1, 1,
1.470133, 0.8135771, 2.161508, 0, 0, 0, 1, 1,
1.470686, 0.3217121, 1.309469, 0, 0, 0, 1, 1,
1.474293, 0.3688216, 0.4788632, 0, 0, 0, 1, 1,
1.479763, 1.633475, 2.855271, 0, 0, 0, 1, 1,
1.48177, -0.5110269, 2.076206, 0, 0, 0, 1, 1,
1.503481, 0.6162027, 1.498186, 0, 0, 0, 1, 1,
1.506587, 1.203338, 1.523674, 0, 0, 0, 1, 1,
1.510596, 1.410578, 0.7753508, 1, 1, 1, 1, 1,
1.511428, 1.855068, 1.251658, 1, 1, 1, 1, 1,
1.519774, 0.01034402, 1.777725, 1, 1, 1, 1, 1,
1.529291, -1.016832, 2.667997, 1, 1, 1, 1, 1,
1.538594, -0.1338066, 2.572641, 1, 1, 1, 1, 1,
1.548368, 1.512433, 1.881612, 1, 1, 1, 1, 1,
1.551252, -0.1332102, 1.138015, 1, 1, 1, 1, 1,
1.576045, -0.5655693, 1.232913, 1, 1, 1, 1, 1,
1.58039, 0.03465262, 1.333321, 1, 1, 1, 1, 1,
1.582039, 0.2755983, 1.671509, 1, 1, 1, 1, 1,
1.582181, -0.06024167, 0.8585507, 1, 1, 1, 1, 1,
1.585571, -2.541695, 1.407254, 1, 1, 1, 1, 1,
1.618184, 0.8750112, 0.7610438, 1, 1, 1, 1, 1,
1.624979, 0.3110241, 1.345923, 1, 1, 1, 1, 1,
1.633075, -0.5750557, 2.732152, 1, 1, 1, 1, 1,
1.633205, -0.8954644, 2.690837, 0, 0, 1, 1, 1,
1.63704, 0.8926934, 1.590576, 1, 0, 0, 1, 1,
1.654327, 1.940431, -1.57923, 1, 0, 0, 1, 1,
1.656452, -0.574448, 2.930931, 1, 0, 0, 1, 1,
1.659629, -1.274556, 0.7023323, 1, 0, 0, 1, 1,
1.661088, -0.5049204, 1.329232, 1, 0, 0, 1, 1,
1.668843, -1.264546, 0.9682379, 0, 0, 0, 1, 1,
1.675226, -0.2205687, 1.816251, 0, 0, 0, 1, 1,
1.698363, -0.5707604, 3.314968, 0, 0, 0, 1, 1,
1.737557, 0.8950613, 1.87662, 0, 0, 0, 1, 1,
1.739084, -0.07275704, 1.834529, 0, 0, 0, 1, 1,
1.757428, -0.8634824, 1.673375, 0, 0, 0, 1, 1,
1.769773, -0.3876148, 0.5136762, 0, 0, 0, 1, 1,
1.788522, -0.2268978, 2.025853, 1, 1, 1, 1, 1,
1.803277, -0.2798226, 0.6042798, 1, 1, 1, 1, 1,
1.804313, -0.6030604, 3.630136, 1, 1, 1, 1, 1,
1.80614, -0.7287664, 2.17596, 1, 1, 1, 1, 1,
1.824989, -0.006650227, 0.3398663, 1, 1, 1, 1, 1,
1.830193, -0.3129472, 2.916153, 1, 1, 1, 1, 1,
1.853665, -0.2634012, 1.465592, 1, 1, 1, 1, 1,
1.854704, -0.5618831, 2.31841, 1, 1, 1, 1, 1,
1.860237, -0.7689398, 0.4142782, 1, 1, 1, 1, 1,
1.966553, 0.9453689, 0.6167684, 1, 1, 1, 1, 1,
1.991167, 1.424298, 1.584193, 1, 1, 1, 1, 1,
2.007377, 0.7994287, 1.397144, 1, 1, 1, 1, 1,
2.049625, 0.8195072, 2.134478, 1, 1, 1, 1, 1,
2.088801, -0.9965747, 3.144901, 1, 1, 1, 1, 1,
2.115107, -0.4490712, 1.46389, 1, 1, 1, 1, 1,
2.130298, -0.706591, 1.450382, 0, 0, 1, 1, 1,
2.184198, 0.1922805, 1.062521, 1, 0, 0, 1, 1,
2.191413, 1.165055, 0.1445795, 1, 0, 0, 1, 1,
2.193861, 0.7804812, 0.5972061, 1, 0, 0, 1, 1,
2.223128, 0.254936, -0.09788064, 1, 0, 0, 1, 1,
2.252715, 2.977075, 1.850431, 1, 0, 0, 1, 1,
2.25478, -1.787393, 1.521559, 0, 0, 0, 1, 1,
2.255063, 1.103807, 1.140011, 0, 0, 0, 1, 1,
2.264327, 0.7990286, 0.8011358, 0, 0, 0, 1, 1,
2.325246, 0.9599786, 3.362373, 0, 0, 0, 1, 1,
2.328056, -0.8829073, 1.648317, 0, 0, 0, 1, 1,
2.335355, 1.819204, -0.5053139, 0, 0, 0, 1, 1,
2.403214, 0.1496043, -0.3686227, 0, 0, 0, 1, 1,
2.431318, -1.657459, 4.071857, 1, 1, 1, 1, 1,
2.441511, 0.8759681, 0.3804522, 1, 1, 1, 1, 1,
2.475089, -0.4053031, 3.155142, 1, 1, 1, 1, 1,
2.475707, -0.1803346, 2.352357, 1, 1, 1, 1, 1,
2.475985, 0.258325, 1.700261, 1, 1, 1, 1, 1,
2.694074, 0.8513374, 0.207557, 1, 1, 1, 1, 1,
2.788604, -0.5002245, -0.301392, 1, 1, 1, 1, 1
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
var radius = 8.992761;
var distance = 31.58669;
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
mvMatrix.translate( 0.03647101, -0.09319043, -0.04300809 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.58669);
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
