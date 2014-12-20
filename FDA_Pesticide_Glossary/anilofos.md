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
-2.992943, -0.66148, -1.472975, 1, 0, 0, 1,
-2.823804, 0.3593663, -2.37554, 1, 0.007843138, 0, 1,
-2.655803, -0.1149358, -1.106244, 1, 0.01176471, 0, 1,
-2.567014, -0.2564113, -2.091684, 1, 0.01960784, 0, 1,
-2.543221, 0.4224297, -1.422411, 1, 0.02352941, 0, 1,
-2.427914, 0.4860871, -2.0825, 1, 0.03137255, 0, 1,
-2.305563, 0.4335903, -1.83914, 1, 0.03529412, 0, 1,
-2.305122, 1.991036, -1.128697, 1, 0.04313726, 0, 1,
-2.263786, -0.9740039, -3.015241, 1, 0.04705882, 0, 1,
-2.251194, -1.314956, -1.338483, 1, 0.05490196, 0, 1,
-2.248328, -0.4838924, -1.9288, 1, 0.05882353, 0, 1,
-2.247204, -0.807088, -1.136866, 1, 0.06666667, 0, 1,
-2.197629, -0.001974083, -2.093185, 1, 0.07058824, 0, 1,
-2.182554, -0.3933107, -3.451581, 1, 0.07843138, 0, 1,
-2.160129, 3.378998, -0.5370559, 1, 0.08235294, 0, 1,
-2.102561, -1.478908, -1.176717, 1, 0.09019608, 0, 1,
-2.072482, 1.625868, -2.384676, 1, 0.09411765, 0, 1,
-2.051181, 0.8970841, -1.258598, 1, 0.1019608, 0, 1,
-2.046193, 1.380813, -0.5754206, 1, 0.1098039, 0, 1,
-2.036962, 0.3108732, -2.182216, 1, 0.1137255, 0, 1,
-2.028292, 0.5732104, -0.4476373, 1, 0.1215686, 0, 1,
-2.008967, 1.058333, -1.872455, 1, 0.1254902, 0, 1,
-1.990571, 0.3057708, -2.579967, 1, 0.1333333, 0, 1,
-1.987726, -0.6488002, -0.02885506, 1, 0.1372549, 0, 1,
-1.97415, 0.72784, -0.02478495, 1, 0.145098, 0, 1,
-1.939495, -0.73459, -2.61846, 1, 0.1490196, 0, 1,
-1.856961, 0.09737936, -3.390935, 1, 0.1568628, 0, 1,
-1.848817, 1.170507, -1.753445, 1, 0.1607843, 0, 1,
-1.82013, -1.065762, -1.990269, 1, 0.1686275, 0, 1,
-1.810929, -0.365756, -1.927032, 1, 0.172549, 0, 1,
-1.810374, -0.7874761, -2.287575, 1, 0.1803922, 0, 1,
-1.792949, -0.1929894, -2.785514, 1, 0.1843137, 0, 1,
-1.787644, -0.842618, -2.96754, 1, 0.1921569, 0, 1,
-1.775374, 0.4546995, -3.742063, 1, 0.1960784, 0, 1,
-1.773929, 0.5759236, -0.3626055, 1, 0.2039216, 0, 1,
-1.769665, -0.8361523, -2.179023, 1, 0.2117647, 0, 1,
-1.766257, -0.545136, -0.7404727, 1, 0.2156863, 0, 1,
-1.751416, -2.235887, -3.277454, 1, 0.2235294, 0, 1,
-1.740192, -0.5656972, -1.713493, 1, 0.227451, 0, 1,
-1.735054, -1.703604, -2.249247, 1, 0.2352941, 0, 1,
-1.69964, -0.4711945, -2.746778, 1, 0.2392157, 0, 1,
-1.694282, 0.8645374, -0.3146373, 1, 0.2470588, 0, 1,
-1.689985, -0.006138976, -2.339334, 1, 0.2509804, 0, 1,
-1.669007, -0.03518001, -2.68994, 1, 0.2588235, 0, 1,
-1.657178, 1.448347, -2.177982, 1, 0.2627451, 0, 1,
-1.648568, 0.5778331, -0.3219045, 1, 0.2705882, 0, 1,
-1.619455, -2.042902, -3.445449, 1, 0.2745098, 0, 1,
-1.545465, -0.1351594, -1.062523, 1, 0.282353, 0, 1,
-1.536708, 1.074372, -1.81569, 1, 0.2862745, 0, 1,
-1.534265, -0.8457008, -1.540837, 1, 0.2941177, 0, 1,
-1.513303, 0.9393428, -2.623578, 1, 0.3019608, 0, 1,
-1.512231, 0.5753135, -2.534997, 1, 0.3058824, 0, 1,
-1.496007, -0.0732791, -1.32057, 1, 0.3137255, 0, 1,
-1.470371, -0.520255, -1.477473, 1, 0.3176471, 0, 1,
-1.467886, 1.781868, -0.8940538, 1, 0.3254902, 0, 1,
-1.464131, 0.08472231, -1.47802, 1, 0.3294118, 0, 1,
-1.46328, 1.530384, -1.449643, 1, 0.3372549, 0, 1,
-1.460514, 2.596717, -0.6061359, 1, 0.3411765, 0, 1,
-1.447722, 0.2689438, -3.050904, 1, 0.3490196, 0, 1,
-1.441793, -1.079639, -3.628215, 1, 0.3529412, 0, 1,
-1.418986, 0.6303282, -1.54845, 1, 0.3607843, 0, 1,
-1.418396, -0.695906, -1.778772, 1, 0.3647059, 0, 1,
-1.416514, -0.9512966, -0.2742002, 1, 0.372549, 0, 1,
-1.403182, 1.416954, -2.257078, 1, 0.3764706, 0, 1,
-1.398933, -0.135675, -3.548096, 1, 0.3843137, 0, 1,
-1.396362, 0.9575367, -0.5558056, 1, 0.3882353, 0, 1,
-1.395945, 0.8541989, -0.1181823, 1, 0.3960784, 0, 1,
-1.393639, -0.7684772, -0.4761108, 1, 0.4039216, 0, 1,
-1.38439, 0.07656738, -1.128515, 1, 0.4078431, 0, 1,
-1.372893, -1.621297, -3.948828, 1, 0.4156863, 0, 1,
-1.360936, 0.1360476, -2.384135, 1, 0.4196078, 0, 1,
-1.359981, 0.8077803, -0.4416324, 1, 0.427451, 0, 1,
-1.354262, -0.4584296, -1.303131, 1, 0.4313726, 0, 1,
-1.35107, -0.1873869, -1.638309, 1, 0.4392157, 0, 1,
-1.349898, 0.5193879, -0.6063109, 1, 0.4431373, 0, 1,
-1.333599, -0.8040789, -2.802733, 1, 0.4509804, 0, 1,
-1.332367, -0.5249264, -1.850057, 1, 0.454902, 0, 1,
-1.328115, 0.2147671, -1.864229, 1, 0.4627451, 0, 1,
-1.326803, -0.3186226, -2.32185, 1, 0.4666667, 0, 1,
-1.322789, -1.296681, -4.996787, 1, 0.4745098, 0, 1,
-1.321038, -0.1583571, 0.04810217, 1, 0.4784314, 0, 1,
-1.303561, -2.33019, -3.753064, 1, 0.4862745, 0, 1,
-1.286745, -1.075363, -1.971398, 1, 0.4901961, 0, 1,
-1.284476, 0.2813544, -1.403697, 1, 0.4980392, 0, 1,
-1.283703, -0.1163115, 0.2853487, 1, 0.5058824, 0, 1,
-1.279211, -0.3339821, -2.68308, 1, 0.509804, 0, 1,
-1.266516, -0.2324787, -1.987312, 1, 0.5176471, 0, 1,
-1.264921, 0.7032272, -1.374439, 1, 0.5215687, 0, 1,
-1.250418, 0.3889593, 0.05698938, 1, 0.5294118, 0, 1,
-1.249571, -0.8268533, -1.408124, 1, 0.5333334, 0, 1,
-1.244326, 1.408174, 0.01545835, 1, 0.5411765, 0, 1,
-1.231936, -0.4081914, -0.5476342, 1, 0.5450981, 0, 1,
-1.23057, -0.7187703, -1.803015, 1, 0.5529412, 0, 1,
-1.228908, -0.3909207, -2.656726, 1, 0.5568628, 0, 1,
-1.226772, 0.1468662, -1.619662, 1, 0.5647059, 0, 1,
-1.226508, 0.2408552, -3.057993, 1, 0.5686275, 0, 1,
-1.216462, 1.522085, -1.373907, 1, 0.5764706, 0, 1,
-1.21614, -0.5776729, -1.640577, 1, 0.5803922, 0, 1,
-1.215849, 1.128591, 0.02760823, 1, 0.5882353, 0, 1,
-1.215521, 2.444394, -1.739625, 1, 0.5921569, 0, 1,
-1.214147, 0.6014375, -0.5827786, 1, 0.6, 0, 1,
-1.211883, -1.264275, -1.822876, 1, 0.6078432, 0, 1,
-1.206501, -0.8535956, -4.846334, 1, 0.6117647, 0, 1,
-1.203156, 2.161448, -1.267699, 1, 0.6196079, 0, 1,
-1.193909, 0.6329001, -0.5145097, 1, 0.6235294, 0, 1,
-1.190504, 0.5130226, -0.7831016, 1, 0.6313726, 0, 1,
-1.189324, 0.06979378, -0.9733495, 1, 0.6352941, 0, 1,
-1.188941, 0.05419219, -1.176391, 1, 0.6431373, 0, 1,
-1.186433, 1.620468, 0.9377551, 1, 0.6470588, 0, 1,
-1.183256, -0.5379637, -1.577063, 1, 0.654902, 0, 1,
-1.167085, 0.7486485, -0.9175758, 1, 0.6588235, 0, 1,
-1.165869, 0.9369612, -0.0429831, 1, 0.6666667, 0, 1,
-1.164997, 0.4588647, 0.7596391, 1, 0.6705883, 0, 1,
-1.158683, 0.9910117, 0.1619361, 1, 0.6784314, 0, 1,
-1.144219, 0.4973658, -1.102657, 1, 0.682353, 0, 1,
-1.142895, 1.436551, 0.2021629, 1, 0.6901961, 0, 1,
-1.14004, -1.781305, -3.004023, 1, 0.6941177, 0, 1,
-1.13552, 0.5566019, -0.2765293, 1, 0.7019608, 0, 1,
-1.132204, -0.03257536, -2.098118, 1, 0.7098039, 0, 1,
-1.11173, -0.7803124, -1.656632, 1, 0.7137255, 0, 1,
-1.111436, -2.444652, -3.32724, 1, 0.7215686, 0, 1,
-1.107594, 0.8686035, -1.331098, 1, 0.7254902, 0, 1,
-1.101776, -1.466058, -3.638948, 1, 0.7333333, 0, 1,
-1.081334, 1.535615, -0.6758394, 1, 0.7372549, 0, 1,
-1.080299, 0.001758528, -1.988393, 1, 0.7450981, 0, 1,
-1.077421, -0.02813711, -1.373674, 1, 0.7490196, 0, 1,
-1.07338, 0.06240398, -1.903035, 1, 0.7568628, 0, 1,
-1.07139, -0.684023, -2.926513, 1, 0.7607843, 0, 1,
-1.070874, 0.06871437, -2.699359, 1, 0.7686275, 0, 1,
-1.069901, 0.4666264, -0.9261706, 1, 0.772549, 0, 1,
-1.067357, -1.084449, -3.213337, 1, 0.7803922, 0, 1,
-1.066581, -0.2072721, -0.9489114, 1, 0.7843137, 0, 1,
-1.063688, -0.4971532, -1.556449, 1, 0.7921569, 0, 1,
-1.060117, -1.689928, -2.341724, 1, 0.7960784, 0, 1,
-1.058572, -2.360291, -2.761572, 1, 0.8039216, 0, 1,
-1.05414, -1.253981, -1.931021, 1, 0.8117647, 0, 1,
-1.050706, 0.2912755, -2.826338, 1, 0.8156863, 0, 1,
-1.04338, -0.6841416, -1.241498, 1, 0.8235294, 0, 1,
-1.04019, -0.08642191, -1.363253, 1, 0.827451, 0, 1,
-1.026433, -0.06623749, -0.4794537, 1, 0.8352941, 0, 1,
-1.023405, -0.64302, -1.341867, 1, 0.8392157, 0, 1,
-1.023394, -0.48494, -0.9707615, 1, 0.8470588, 0, 1,
-1.021116, -1.591005, -2.789536, 1, 0.8509804, 0, 1,
-1.01869, 0.6500213, -2.646153, 1, 0.8588235, 0, 1,
-1.014901, -0.5208654, -1.240064, 1, 0.8627451, 0, 1,
-1.012079, -0.06896689, -0.6224359, 1, 0.8705882, 0, 1,
-1.010192, 0.1549251, -1.781301, 1, 0.8745098, 0, 1,
-1.007809, -1.283914, -2.684528, 1, 0.8823529, 0, 1,
-1.006234, -0.07810761, -2.472966, 1, 0.8862745, 0, 1,
-0.9964828, -0.9497075, -2.529403, 1, 0.8941177, 0, 1,
-0.988281, -0.8980828, -3.297426, 1, 0.8980392, 0, 1,
-0.9810793, -0.5096886, -2.664688, 1, 0.9058824, 0, 1,
-0.9743676, -0.9852904, -2.097916, 1, 0.9137255, 0, 1,
-0.970115, -2.202266, -0.9333195, 1, 0.9176471, 0, 1,
-0.9622837, -0.6912669, -2.654151, 1, 0.9254902, 0, 1,
-0.959104, 1.012127, -2.085284, 1, 0.9294118, 0, 1,
-0.95667, 0.3136001, -0.7218221, 1, 0.9372549, 0, 1,
-0.9559093, -0.380793, -1.47753, 1, 0.9411765, 0, 1,
-0.9544414, -0.8632628, -3.717431, 1, 0.9490196, 0, 1,
-0.9528596, 1.071276, -1.034652, 1, 0.9529412, 0, 1,
-0.9477289, -0.008623159, -1.812479, 1, 0.9607843, 0, 1,
-0.9450527, -0.719872, -2.132043, 1, 0.9647059, 0, 1,
-0.9443721, 0.8493329, -2.970112, 1, 0.972549, 0, 1,
-0.9403958, -1.016157, -1.241923, 1, 0.9764706, 0, 1,
-0.9327475, 0.1471792, -0.2120378, 1, 0.9843137, 0, 1,
-0.921095, -0.4028055, -1.09135, 1, 0.9882353, 0, 1,
-0.9190711, -1.053266, -1.117105, 1, 0.9960784, 0, 1,
-0.918984, 1.179519, -1.971855, 0.9960784, 1, 0, 1,
-0.9153126, 1.161809, -0.4354309, 0.9921569, 1, 0, 1,
-0.9150881, -0.3598413, -3.344643, 0.9843137, 1, 0, 1,
-0.9135286, 0.3957192, -0.7151383, 0.9803922, 1, 0, 1,
-0.911858, -0.3363434, -1.233707, 0.972549, 1, 0, 1,
-0.9113638, 0.1222124, -0.9831545, 0.9686275, 1, 0, 1,
-0.9098396, 0.5563408, -1.86087, 0.9607843, 1, 0, 1,
-0.9073726, -2.405656, -2.367655, 0.9568627, 1, 0, 1,
-0.8976631, -1.528313, -1.643548, 0.9490196, 1, 0, 1,
-0.8971564, -0.591594, -1.004904, 0.945098, 1, 0, 1,
-0.8898707, -0.645348, -3.462894, 0.9372549, 1, 0, 1,
-0.8807389, -0.2614517, -0.6320116, 0.9333333, 1, 0, 1,
-0.876514, 0.4874973, -1.871278, 0.9254902, 1, 0, 1,
-0.8732602, -0.7310882, -3.821981, 0.9215686, 1, 0, 1,
-0.8721592, -0.5851754, -1.105046, 0.9137255, 1, 0, 1,
-0.8721567, 0.6683838, -0.1551665, 0.9098039, 1, 0, 1,
-0.8607526, -1.05118, -2.85499, 0.9019608, 1, 0, 1,
-0.8586972, -1.518712, -4.607311, 0.8941177, 1, 0, 1,
-0.8570977, 0.09478869, -2.927008, 0.8901961, 1, 0, 1,
-0.8526665, -1.924507, -2.994215, 0.8823529, 1, 0, 1,
-0.8465186, -0.266969, -2.750399, 0.8784314, 1, 0, 1,
-0.8446798, -0.536039, -0.2498131, 0.8705882, 1, 0, 1,
-0.8446704, 0.6014407, -0.8167257, 0.8666667, 1, 0, 1,
-0.8446687, -1.619872, -2.251811, 0.8588235, 1, 0, 1,
-0.8317021, -0.03807407, -0.723372, 0.854902, 1, 0, 1,
-0.8267344, -0.4917699, -2.902138, 0.8470588, 1, 0, 1,
-0.8247386, -2.050851, -1.984622, 0.8431373, 1, 0, 1,
-0.8238342, 0.2012268, -1.440259, 0.8352941, 1, 0, 1,
-0.8204131, 0.991334, -1.660452, 0.8313726, 1, 0, 1,
-0.8137857, -1.209499, -2.535364, 0.8235294, 1, 0, 1,
-0.8087432, -2.015095, -3.150812, 0.8196079, 1, 0, 1,
-0.8049826, -0.7796181, -1.473589, 0.8117647, 1, 0, 1,
-0.8034041, 1.314253, 0.1618365, 0.8078431, 1, 0, 1,
-0.8023921, -0.1231154, -1.544587, 0.8, 1, 0, 1,
-0.7995084, -1.150304, -2.482786, 0.7921569, 1, 0, 1,
-0.7963568, 0.1796699, -0.4637968, 0.7882353, 1, 0, 1,
-0.7911004, 0.4220755, -0.5895619, 0.7803922, 1, 0, 1,
-0.7879593, -0.4405862, -2.249783, 0.7764706, 1, 0, 1,
-0.7629562, 0.5358198, -2.27859, 0.7686275, 1, 0, 1,
-0.758543, -0.6186165, -1.95415, 0.7647059, 1, 0, 1,
-0.7564346, -0.8793799, -1.685048, 0.7568628, 1, 0, 1,
-0.7541244, -0.2608887, -1.798009, 0.7529412, 1, 0, 1,
-0.7510228, 0.7962246, -0.4195785, 0.7450981, 1, 0, 1,
-0.7467389, -1.0174, -1.477646, 0.7411765, 1, 0, 1,
-0.7456887, -0.04732342, -2.196425, 0.7333333, 1, 0, 1,
-0.7450632, -0.002372907, -2.222147, 0.7294118, 1, 0, 1,
-0.7431964, 0.5271218, -1.508439, 0.7215686, 1, 0, 1,
-0.7397112, 0.4031306, 0.2439439, 0.7176471, 1, 0, 1,
-0.7379228, -0.1178256, -0.8017466, 0.7098039, 1, 0, 1,
-0.7289398, -0.117513, -0.7850135, 0.7058824, 1, 0, 1,
-0.7254938, -0.4967373, -2.49712, 0.6980392, 1, 0, 1,
-0.7235477, 0.4751199, 1.064598, 0.6901961, 1, 0, 1,
-0.7232643, -1.364368, -3.615849, 0.6862745, 1, 0, 1,
-0.7226978, -1.88952, -4.093285, 0.6784314, 1, 0, 1,
-0.7224026, 0.6088397, 0.4458855, 0.6745098, 1, 0, 1,
-0.7178568, 0.2441042, -1.618501, 0.6666667, 1, 0, 1,
-0.7169831, -0.07240391, -2.264914, 0.6627451, 1, 0, 1,
-0.7155926, -0.3956599, -2.68355, 0.654902, 1, 0, 1,
-0.7116909, 0.0955606, -3.510879, 0.6509804, 1, 0, 1,
-0.710897, -0.567268, -2.271673, 0.6431373, 1, 0, 1,
-0.7103517, -0.613803, -1.940956, 0.6392157, 1, 0, 1,
-0.7078438, 0.5426974, -1.680318, 0.6313726, 1, 0, 1,
-0.7065115, 0.1510495, -1.629948, 0.627451, 1, 0, 1,
-0.7044908, -0.7033499, -3.427207, 0.6196079, 1, 0, 1,
-0.7031484, 0.7535437, -2.538428, 0.6156863, 1, 0, 1,
-0.6949661, -1.262128, -4.852281, 0.6078432, 1, 0, 1,
-0.6901066, -0.9992809, -4.212454, 0.6039216, 1, 0, 1,
-0.6870866, -0.7703843, -2.078326, 0.5960785, 1, 0, 1,
-0.6815391, 1.640043, 0.02059433, 0.5882353, 1, 0, 1,
-0.6749082, 1.211261, 0.6001335, 0.5843138, 1, 0, 1,
-0.671804, 1.166186, -1.258147, 0.5764706, 1, 0, 1,
-0.6700821, 1.021806, -1.759594, 0.572549, 1, 0, 1,
-0.6651638, -0.6983296, -0.8971208, 0.5647059, 1, 0, 1,
-0.661953, -0.3346574, -3.773008, 0.5607843, 1, 0, 1,
-0.6573831, 0.3486208, -1.243427, 0.5529412, 1, 0, 1,
-0.6561872, 1.63063, 0.4691586, 0.5490196, 1, 0, 1,
-0.655391, 1.040057, -2.003979, 0.5411765, 1, 0, 1,
-0.6551835, 0.2730649, -1.177259, 0.5372549, 1, 0, 1,
-0.65445, -0.8392484, -0.9567504, 0.5294118, 1, 0, 1,
-0.6525634, 0.2401067, -2.186435, 0.5254902, 1, 0, 1,
-0.6499047, -1.244778, -2.309188, 0.5176471, 1, 0, 1,
-0.648968, -0.2741997, -1.368605, 0.5137255, 1, 0, 1,
-0.6487842, -0.5691725, -2.142102, 0.5058824, 1, 0, 1,
-0.6464736, 1.437091, -1.437582, 0.5019608, 1, 0, 1,
-0.6454241, 0.9533544, 0.3552386, 0.4941176, 1, 0, 1,
-0.6407083, 0.3284906, -0.896585, 0.4862745, 1, 0, 1,
-0.6395405, -1.127762, -2.448267, 0.4823529, 1, 0, 1,
-0.6370077, 0.6970358, -0.697813, 0.4745098, 1, 0, 1,
-0.6347499, 1.351517, -0.01231431, 0.4705882, 1, 0, 1,
-0.6334598, 0.2391684, -1.431008, 0.4627451, 1, 0, 1,
-0.6312296, 0.7913208, -0.1663976, 0.4588235, 1, 0, 1,
-0.630691, 2.150766, -0.1406985, 0.4509804, 1, 0, 1,
-0.6186917, -0.7167747, -1.303689, 0.4470588, 1, 0, 1,
-0.6181927, 0.5044699, -1.896754, 0.4392157, 1, 0, 1,
-0.6058549, 0.5361533, 0.5435298, 0.4352941, 1, 0, 1,
-0.6045315, 1.653313, 0.343423, 0.427451, 1, 0, 1,
-0.6010777, 0.3518341, -1.145535, 0.4235294, 1, 0, 1,
-0.5998378, 1.092406, -1.531857, 0.4156863, 1, 0, 1,
-0.5995566, 0.2213383, 0.02786447, 0.4117647, 1, 0, 1,
-0.598535, 0.556608, 0.3372168, 0.4039216, 1, 0, 1,
-0.5973754, 0.08157709, -2.274844, 0.3960784, 1, 0, 1,
-0.5931359, -1.253524, -2.567775, 0.3921569, 1, 0, 1,
-0.5860376, 0.4404355, -1.890525, 0.3843137, 1, 0, 1,
-0.5842334, -1.151435, -4.169624, 0.3803922, 1, 0, 1,
-0.5820574, -0.2196632, -2.140447, 0.372549, 1, 0, 1,
-0.5818508, -0.001568122, -2.165547, 0.3686275, 1, 0, 1,
-0.5815669, -0.07170368, -2.061771, 0.3607843, 1, 0, 1,
-0.5748978, -0.9831412, -2.915753, 0.3568628, 1, 0, 1,
-0.5709405, -0.5498682, -2.915478, 0.3490196, 1, 0, 1,
-0.5696902, 0.9268558, -0.7010692, 0.345098, 1, 0, 1,
-0.5684983, 1.527818, 0.1664645, 0.3372549, 1, 0, 1,
-0.567681, 1.703754, -0.4775707, 0.3333333, 1, 0, 1,
-0.5626914, -2.047638, -4.467683, 0.3254902, 1, 0, 1,
-0.5619634, 0.3675615, 0.7312295, 0.3215686, 1, 0, 1,
-0.5602762, -0.8981035, -1.84448, 0.3137255, 1, 0, 1,
-0.5553198, -0.1011636, -4.835959, 0.3098039, 1, 0, 1,
-0.5520344, -1.809044, -0.6273555, 0.3019608, 1, 0, 1,
-0.5465983, -0.7919319, -3.004996, 0.2941177, 1, 0, 1,
-0.5424906, -0.6837689, -3.349586, 0.2901961, 1, 0, 1,
-0.5359136, -1.108892, -1.391, 0.282353, 1, 0, 1,
-0.5350411, 0.6467033, -0.5778019, 0.2784314, 1, 0, 1,
-0.5300331, 0.3403707, -0.959964, 0.2705882, 1, 0, 1,
-0.5240343, -1.903011, -2.653716, 0.2666667, 1, 0, 1,
-0.5209859, -1.650539, -2.788606, 0.2588235, 1, 0, 1,
-0.5206372, 0.1029853, -1.916465, 0.254902, 1, 0, 1,
-0.5168362, -2.539637, -2.675835, 0.2470588, 1, 0, 1,
-0.5109112, -0.7451641, -2.528319, 0.2431373, 1, 0, 1,
-0.4987803, 0.06558353, -1.185659, 0.2352941, 1, 0, 1,
-0.4932184, -2.127774, -0.2174912, 0.2313726, 1, 0, 1,
-0.4930681, -1.468544, -1.79286, 0.2235294, 1, 0, 1,
-0.489227, 0.9955622, -1.298585, 0.2196078, 1, 0, 1,
-0.4882392, 0.1034862, -2.335012, 0.2117647, 1, 0, 1,
-0.4871688, 0.06820284, -3.243399, 0.2078431, 1, 0, 1,
-0.4861625, -0.04000744, -0.481512, 0.2, 1, 0, 1,
-0.4813395, -1.595054, -2.307331, 0.1921569, 1, 0, 1,
-0.4811215, -0.9403477, -3.949349, 0.1882353, 1, 0, 1,
-0.4809588, -0.8703607, -2.3028, 0.1803922, 1, 0, 1,
-0.4780632, -0.8343311, -2.298352, 0.1764706, 1, 0, 1,
-0.4759447, -1.3918, -2.341322, 0.1686275, 1, 0, 1,
-0.4744608, -0.6887026, -2.3598, 0.1647059, 1, 0, 1,
-0.4737847, -0.5598384, -1.290214, 0.1568628, 1, 0, 1,
-0.4718271, -0.7052705, -1.345788, 0.1529412, 1, 0, 1,
-0.4698689, -1.096478, -2.311759, 0.145098, 1, 0, 1,
-0.4689797, 0.7511689, -2.702996, 0.1411765, 1, 0, 1,
-0.4687513, 1.310519, -1.76918, 0.1333333, 1, 0, 1,
-0.4639814, -1.061427, -3.525708, 0.1294118, 1, 0, 1,
-0.4581407, 0.9038004, -1.7796, 0.1215686, 1, 0, 1,
-0.4558854, -1.541964, -2.905971, 0.1176471, 1, 0, 1,
-0.4506471, -0.6678374, -2.380852, 0.1098039, 1, 0, 1,
-0.4479442, -1.578193, -2.623478, 0.1058824, 1, 0, 1,
-0.4474399, -1.631496, -2.54433, 0.09803922, 1, 0, 1,
-0.446647, 1.383323, -0.9738892, 0.09019608, 1, 0, 1,
-0.443578, -0.6840699, -5.014097, 0.08627451, 1, 0, 1,
-0.4372663, 1.116307, 0.121782, 0.07843138, 1, 0, 1,
-0.4341883, 0.4628684, -0.7514037, 0.07450981, 1, 0, 1,
-0.4283609, 0.2159758, -0.3722316, 0.06666667, 1, 0, 1,
-0.4280501, 1.036253, -0.002969154, 0.0627451, 1, 0, 1,
-0.4209348, -0.1731112, -2.094771, 0.05490196, 1, 0, 1,
-0.4177088, 0.7352268, 0.5834858, 0.05098039, 1, 0, 1,
-0.4153576, 1.444542, 0.4717959, 0.04313726, 1, 0, 1,
-0.413026, 0.7194615, -0.8035302, 0.03921569, 1, 0, 1,
-0.4117205, 0.4583996, 0.1634213, 0.03137255, 1, 0, 1,
-0.4070258, -0.4813659, -2.248935, 0.02745098, 1, 0, 1,
-0.4009238, -0.9330159, -2.321148, 0.01960784, 1, 0, 1,
-0.3989191, 1.043377, -1.111124, 0.01568628, 1, 0, 1,
-0.3928781, 0.3971567, -0.8461291, 0.007843138, 1, 0, 1,
-0.3911287, 0.5895736, -0.9155457, 0.003921569, 1, 0, 1,
-0.3802191, -1.12019, -2.738242, 0, 1, 0.003921569, 1,
-0.3781419, -0.6399307, -2.535384, 0, 1, 0.01176471, 1,
-0.3776623, -0.6133525, -1.393175, 0, 1, 0.01568628, 1,
-0.3658098, 0.260774, -0.01841044, 0, 1, 0.02352941, 1,
-0.3653939, 1.901531, 0.1763401, 0, 1, 0.02745098, 1,
-0.3621113, -1.443519, -2.801603, 0, 1, 0.03529412, 1,
-0.3612391, -0.9661798, -4.03901, 0, 1, 0.03921569, 1,
-0.3599419, -1.412881, -4.10283, 0, 1, 0.04705882, 1,
-0.3583296, -0.6988958, -1.759141, 0, 1, 0.05098039, 1,
-0.3571567, 0.2310751, -1.623318, 0, 1, 0.05882353, 1,
-0.3563887, 0.7984138, 1.892353, 0, 1, 0.0627451, 1,
-0.3539045, -2.139719, -4.318718, 0, 1, 0.07058824, 1,
-0.353838, 1.213809, 1.545599, 0, 1, 0.07450981, 1,
-0.3538109, -0.4527652, -0.4086609, 0, 1, 0.08235294, 1,
-0.3465055, 0.1480775, -0.8323774, 0, 1, 0.08627451, 1,
-0.3444444, 0.7140628, -2.194066, 0, 1, 0.09411765, 1,
-0.3436835, 0.1073696, -2.006267, 0, 1, 0.1019608, 1,
-0.3420676, 0.09972285, -0.518345, 0, 1, 0.1058824, 1,
-0.3412167, 0.4588737, -1.208446, 0, 1, 0.1137255, 1,
-0.3320944, 0.574765, 1.26751, 0, 1, 0.1176471, 1,
-0.3320609, 0.2841547, -0.3472977, 0, 1, 0.1254902, 1,
-0.3304053, -1.697627, -3.518845, 0, 1, 0.1294118, 1,
-0.3282731, -1.024768, -4.897511, 0, 1, 0.1372549, 1,
-0.32745, 0.1582588, -0.1561138, 0, 1, 0.1411765, 1,
-0.3267379, 1.91517, 0.4750297, 0, 1, 0.1490196, 1,
-0.3263791, 0.903641, -0.1857333, 0, 1, 0.1529412, 1,
-0.3246476, 0.153764, -0.9134462, 0, 1, 0.1607843, 1,
-0.322343, -0.1866764, -3.639696, 0, 1, 0.1647059, 1,
-0.3192716, -0.3763797, -4.785224, 0, 1, 0.172549, 1,
-0.3139193, -0.4354953, -3.235008, 0, 1, 0.1764706, 1,
-0.3133782, -0.7169794, -2.568816, 0, 1, 0.1843137, 1,
-0.3123356, 0.9006429, -1.011642, 0, 1, 0.1882353, 1,
-0.3104292, 1.531899, 2.087687, 0, 1, 0.1960784, 1,
-0.3103634, 0.5512817, -1.279817, 0, 1, 0.2039216, 1,
-0.3087783, 0.08240037, -1.004699, 0, 1, 0.2078431, 1,
-0.3066053, -1.271396, -3.715519, 0, 1, 0.2156863, 1,
-0.2999546, 0.2533605, -0.9663401, 0, 1, 0.2196078, 1,
-0.2927175, -0.1494425, -2.111212, 0, 1, 0.227451, 1,
-0.2899584, -1.047722, -1.658818, 0, 1, 0.2313726, 1,
-0.2880372, 0.9053004, -0.01262924, 0, 1, 0.2392157, 1,
-0.2874175, 0.6498007, -1.066482, 0, 1, 0.2431373, 1,
-0.2864199, 1.230894, 0.892148, 0, 1, 0.2509804, 1,
-0.2857863, 0.7952539, 0.6036661, 0, 1, 0.254902, 1,
-0.283957, -1.370997, -2.878658, 0, 1, 0.2627451, 1,
-0.2818901, -0.7864202, -3.415996, 0, 1, 0.2666667, 1,
-0.2784825, 1.443058, 0.4912197, 0, 1, 0.2745098, 1,
-0.2755077, 0.574358, -0.7526242, 0, 1, 0.2784314, 1,
-0.2736495, 1.576656, -1.137204, 0, 1, 0.2862745, 1,
-0.2734161, -0.4742403, -3.073894, 0, 1, 0.2901961, 1,
-0.2679803, 0.9636874, -1.145596, 0, 1, 0.2980392, 1,
-0.2674545, 0.2681793, -1.876361, 0, 1, 0.3058824, 1,
-0.2669907, -0.7888889, -4.428436, 0, 1, 0.3098039, 1,
-0.2663423, -0.4708817, -3.064576, 0, 1, 0.3176471, 1,
-0.2631541, 0.0578852, -2.512969, 0, 1, 0.3215686, 1,
-0.2595431, -0.3337209, -2.318967, 0, 1, 0.3294118, 1,
-0.2560666, 0.9286932, 1.011053, 0, 1, 0.3333333, 1,
-0.255447, 1.734141, -1.172079, 0, 1, 0.3411765, 1,
-0.252769, 0.09737174, -3.083866, 0, 1, 0.345098, 1,
-0.2517247, 0.07745275, -0.6181537, 0, 1, 0.3529412, 1,
-0.2513504, -2.048146, -2.666718, 0, 1, 0.3568628, 1,
-0.2487703, 0.1449132, 0.04917754, 0, 1, 0.3647059, 1,
-0.2473511, -0.5267764, -1.361677, 0, 1, 0.3686275, 1,
-0.2471463, -2.424607, -3.655653, 0, 1, 0.3764706, 1,
-0.2456525, -0.04099385, -1.418476, 0, 1, 0.3803922, 1,
-0.2453528, -0.4733853, -2.775041, 0, 1, 0.3882353, 1,
-0.243679, 1.060892, -0.6753529, 0, 1, 0.3921569, 1,
-0.2393097, -0.1319644, -3.136613, 0, 1, 0.4, 1,
-0.2355667, -1.655811, -2.089373, 0, 1, 0.4078431, 1,
-0.2312219, -0.1317393, -1.91825, 0, 1, 0.4117647, 1,
-0.228189, 0.06873205, 0.293394, 0, 1, 0.4196078, 1,
-0.2255563, -1.227854, -1.229952, 0, 1, 0.4235294, 1,
-0.2138949, 0.1251184, -1.6283, 0, 1, 0.4313726, 1,
-0.2129345, 0.1050832, -1.203138, 0, 1, 0.4352941, 1,
-0.2098487, 0.5354814, -1.20557, 0, 1, 0.4431373, 1,
-0.2095, 1.702145, 0.4267865, 0, 1, 0.4470588, 1,
-0.20596, -0.009253901, -1.718599, 0, 1, 0.454902, 1,
-0.2004534, -0.7043985, -2.06282, 0, 1, 0.4588235, 1,
-0.198119, 2.190566, 0.1886416, 0, 1, 0.4666667, 1,
-0.1960437, -0.5999605, -1.481386, 0, 1, 0.4705882, 1,
-0.1958452, -0.801037, -1.894002, 0, 1, 0.4784314, 1,
-0.1917454, 0.6575601, -0.5731624, 0, 1, 0.4823529, 1,
-0.1907938, 0.08006092, 0.13974, 0, 1, 0.4901961, 1,
-0.1890538, 0.1764028, -0.7269353, 0, 1, 0.4941176, 1,
-0.1888755, 0.3563129, 0.272697, 0, 1, 0.5019608, 1,
-0.1881813, 0.8942643, 0.752137, 0, 1, 0.509804, 1,
-0.1872741, 1.967518, 1.395551, 0, 1, 0.5137255, 1,
-0.1866177, 0.042654, 0.4545757, 0, 1, 0.5215687, 1,
-0.1854581, -1.094115, -2.202239, 0, 1, 0.5254902, 1,
-0.1809515, -0.2713734, -3.83307, 0, 1, 0.5333334, 1,
-0.1743452, -1.878734, -3.402803, 0, 1, 0.5372549, 1,
-0.1740074, -0.04266661, -1.75328, 0, 1, 0.5450981, 1,
-0.1699846, 2.659041, -0.6453727, 0, 1, 0.5490196, 1,
-0.1625226, -0.681116, -2.666816, 0, 1, 0.5568628, 1,
-0.1609439, -0.9132603, -3.863084, 0, 1, 0.5607843, 1,
-0.1582658, -1.041271, -0.9196714, 0, 1, 0.5686275, 1,
-0.1559834, 0.8905417, -0.04282999, 0, 1, 0.572549, 1,
-0.1536936, 0.3550966, -0.1532867, 0, 1, 0.5803922, 1,
-0.1511839, 0.05003775, -2.407686, 0, 1, 0.5843138, 1,
-0.1508985, -0.05111045, -2.356276, 0, 1, 0.5921569, 1,
-0.1502378, -1.05797, -4.200393, 0, 1, 0.5960785, 1,
-0.1401993, -1.33752, -4.570202, 0, 1, 0.6039216, 1,
-0.1361209, -0.415118, -3.553229, 0, 1, 0.6117647, 1,
-0.1358095, -0.4067582, -2.484617, 0, 1, 0.6156863, 1,
-0.1354015, -0.04455917, -3.650202, 0, 1, 0.6235294, 1,
-0.1276796, 1.029026, -0.7334307, 0, 1, 0.627451, 1,
-0.1272999, 0.5815452, -0.1670075, 0, 1, 0.6352941, 1,
-0.1250806, -0.4579505, -1.803723, 0, 1, 0.6392157, 1,
-0.1248732, 0.1384088, 1.847215, 0, 1, 0.6470588, 1,
-0.1238925, 0.9153386, 0.02946672, 0, 1, 0.6509804, 1,
-0.1227337, -0.08750305, -0.2211466, 0, 1, 0.6588235, 1,
-0.1219772, -0.4909641, -5.567687, 0, 1, 0.6627451, 1,
-0.1180109, 0.3159024, 0.1320831, 0, 1, 0.6705883, 1,
-0.1174676, -1.759621, -2.824549, 0, 1, 0.6745098, 1,
-0.1168418, 0.9807379, -0.8554411, 0, 1, 0.682353, 1,
-0.1167836, 0.09899868, -0.7711379, 0, 1, 0.6862745, 1,
-0.1113764, -0.1306331, -4.210523, 0, 1, 0.6941177, 1,
-0.1107174, 1.150553, 0.3074152, 0, 1, 0.7019608, 1,
-0.1053165, -1.542315, -3.627744, 0, 1, 0.7058824, 1,
-0.1022378, -0.02666101, -1.752247, 0, 1, 0.7137255, 1,
-0.1020426, -0.08944657, -2.086205, 0, 1, 0.7176471, 1,
-0.0997123, 0.109765, 0.5807414, 0, 1, 0.7254902, 1,
-0.09950062, -0.5894441, -2.03163, 0, 1, 0.7294118, 1,
-0.09732471, -0.7156304, -2.921574, 0, 1, 0.7372549, 1,
-0.09663698, -1.598497, -2.388647, 0, 1, 0.7411765, 1,
-0.09607745, 0.3432415, 0.2613286, 0, 1, 0.7490196, 1,
-0.09546486, -1.06076, -2.601849, 0, 1, 0.7529412, 1,
-0.09139124, -1.700299, -1.481733, 0, 1, 0.7607843, 1,
-0.08793736, 0.4501754, 0.4300087, 0, 1, 0.7647059, 1,
-0.08741438, 0.4180909, 0.9119828, 0, 1, 0.772549, 1,
-0.08490323, 1.506637, -0.7828683, 0, 1, 0.7764706, 1,
-0.08338965, -2.165575, -3.467606, 0, 1, 0.7843137, 1,
-0.08322133, 0.5319495, 1.816047, 0, 1, 0.7882353, 1,
-0.07928091, 0.2969574, 0.08583457, 0, 1, 0.7960784, 1,
-0.07866912, 2.210418, -0.1538424, 0, 1, 0.8039216, 1,
-0.07763883, 1.365022, -1.053473, 0, 1, 0.8078431, 1,
-0.07684839, -0.2348347, -3.053371, 0, 1, 0.8156863, 1,
-0.07488653, -1.658675, -2.174478, 0, 1, 0.8196079, 1,
-0.07321835, -0.05446048, -4.082543, 0, 1, 0.827451, 1,
-0.07217165, -0.3554018, -2.116678, 0, 1, 0.8313726, 1,
-0.07045951, -0.3115082, -2.70748, 0, 1, 0.8392157, 1,
-0.06989368, 0.3880441, 0.06799331, 0, 1, 0.8431373, 1,
-0.06585627, -1.229271, -3.467384, 0, 1, 0.8509804, 1,
-0.06261916, -2.177585, -3.39186, 0, 1, 0.854902, 1,
-0.06095629, 2.432282, -0.8499925, 0, 1, 0.8627451, 1,
-0.06001044, 0.2317132, -1.129471, 0, 1, 0.8666667, 1,
-0.05336715, 1.120659, 0.1627044, 0, 1, 0.8745098, 1,
-0.05326992, 0.3664609, -0.1226303, 0, 1, 0.8784314, 1,
-0.0513977, 0.4086286, -0.8990764, 0, 1, 0.8862745, 1,
-0.04897719, -0.3986802, -2.420229, 0, 1, 0.8901961, 1,
-0.04665802, 0.6024974, 0.2273906, 0, 1, 0.8980392, 1,
-0.04371441, -1.043008, -3.792964, 0, 1, 0.9058824, 1,
-0.04330914, -0.04232826, -3.754917, 0, 1, 0.9098039, 1,
-0.03918815, 0.3858623, 2.957851, 0, 1, 0.9176471, 1,
-0.03800439, 0.348907, 0.642194, 0, 1, 0.9215686, 1,
-0.03574712, -0.6408586, -4.764102, 0, 1, 0.9294118, 1,
-0.03560425, -0.6340764, -1.184781, 0, 1, 0.9333333, 1,
-0.03407476, 1.188547, 1.347152, 0, 1, 0.9411765, 1,
-0.03323542, 0.1246781, -0.9979645, 0, 1, 0.945098, 1,
-0.03252637, 0.01272539, -1.86413, 0, 1, 0.9529412, 1,
-0.03245918, -0.3974602, -1.742934, 0, 1, 0.9568627, 1,
-0.03079928, 0.6377005, 0.8129575, 0, 1, 0.9647059, 1,
-0.0261808, 0.982299, 0.1327575, 0, 1, 0.9686275, 1,
-0.02479967, -0.4346976, -3.698061, 0, 1, 0.9764706, 1,
-0.02297923, 0.634126, 2.4287, 0, 1, 0.9803922, 1,
-0.01794129, 1.085081, 0.2799899, 0, 1, 0.9882353, 1,
-0.01428049, -0.227156, -1.615396, 0, 1, 0.9921569, 1,
-0.01218287, 0.1812638, -1.777596, 0, 1, 1, 1,
-0.01169726, -0.265059, -2.683158, 0, 0.9921569, 1, 1,
-0.01034534, 0.9621262, 1.074581, 0, 0.9882353, 1, 1,
-0.00839114, -1.222842, -3.919441, 0, 0.9803922, 1, 1,
-0.008176432, 0.9567007, -0.79516, 0, 0.9764706, 1, 1,
-0.005672315, -0.4923446, -4.241134, 0, 0.9686275, 1, 1,
-0.004792781, -1.446461, -2.829581, 0, 0.9647059, 1, 1,
-0.004511006, 1.017837, -0.9381419, 0, 0.9568627, 1, 1,
-0.002224355, -0.6777802, -3.792451, 0, 0.9529412, 1, 1,
0.002261414, 2.100862, -0.2992716, 0, 0.945098, 1, 1,
0.0028735, -0.3925453, 3.19994, 0, 0.9411765, 1, 1,
0.011711, -1.060935, 4.900865, 0, 0.9333333, 1, 1,
0.01172973, -0.02700551, 1.161497, 0, 0.9294118, 1, 1,
0.01945157, -0.8733999, 2.108216, 0, 0.9215686, 1, 1,
0.02447791, -1.971866, 2.541074, 0, 0.9176471, 1, 1,
0.02841739, 0.4403602, -0.196601, 0, 0.9098039, 1, 1,
0.02881149, 1.753609, 0.204506, 0, 0.9058824, 1, 1,
0.02970213, 1.397337, -0.8629785, 0, 0.8980392, 1, 1,
0.0300665, -2.109213, 3.929895, 0, 0.8901961, 1, 1,
0.03155177, -1.409461, 3.091164, 0, 0.8862745, 1, 1,
0.031865, 0.3897312, -0.613176, 0, 0.8784314, 1, 1,
0.03475295, -0.3488498, 3.611148, 0, 0.8745098, 1, 1,
0.03607245, -1.096481, 4.627347, 0, 0.8666667, 1, 1,
0.04000487, 0.8317004, -0.6892912, 0, 0.8627451, 1, 1,
0.04031185, -0.787288, 2.64956, 0, 0.854902, 1, 1,
0.05474729, 1.299463, 0.7406845, 0, 0.8509804, 1, 1,
0.05862817, -0.6477934, 3.178776, 0, 0.8431373, 1, 1,
0.05943883, 1.898493, 0.341337, 0, 0.8392157, 1, 1,
0.06656682, -1.166845, 2.882318, 0, 0.8313726, 1, 1,
0.06978084, -0.05815516, 4.406826, 0, 0.827451, 1, 1,
0.0700198, -1.000676, 5.014157, 0, 0.8196079, 1, 1,
0.0705105, 0.4353945, -0.1870875, 0, 0.8156863, 1, 1,
0.07165022, 0.4668936, -0.0210352, 0, 0.8078431, 1, 1,
0.07198304, -1.757676, 3.211749, 0, 0.8039216, 1, 1,
0.07603106, 0.1314168, -0.3362556, 0, 0.7960784, 1, 1,
0.08410805, 0.1197743, 0.7310221, 0, 0.7882353, 1, 1,
0.08487019, -1.990483, 1.908359, 0, 0.7843137, 1, 1,
0.08747976, -0.7829084, 3.886173, 0, 0.7764706, 1, 1,
0.1018375, -0.6625232, 2.893286, 0, 0.772549, 1, 1,
0.1058886, -2.631332, 3.316981, 0, 0.7647059, 1, 1,
0.106021, 0.5319912, 2.090572, 0, 0.7607843, 1, 1,
0.1067306, -0.06391162, 2.728534, 0, 0.7529412, 1, 1,
0.1114299, 0.873912, -0.4928499, 0, 0.7490196, 1, 1,
0.112383, 0.8413197, 0.2206451, 0, 0.7411765, 1, 1,
0.1124071, -1.319514, 2.666744, 0, 0.7372549, 1, 1,
0.1133863, -1.625936, 3.364417, 0, 0.7294118, 1, 1,
0.1140766, 0.5959963, -0.0194426, 0, 0.7254902, 1, 1,
0.1166791, -0.3255541, 0.9069435, 0, 0.7176471, 1, 1,
0.1197942, 0.0826005, 0.9633957, 0, 0.7137255, 1, 1,
0.1221701, 0.05891579, 1.193676, 0, 0.7058824, 1, 1,
0.12253, -0.2547385, 1.782261, 0, 0.6980392, 1, 1,
0.123293, -0.6590242, 3.25162, 0, 0.6941177, 1, 1,
0.1234986, 0.7456408, -0.07016166, 0, 0.6862745, 1, 1,
0.1249396, -0.8677329, 3.211418, 0, 0.682353, 1, 1,
0.129429, 0.1578039, -0.04388166, 0, 0.6745098, 1, 1,
0.1304508, -1.382303, 3.939668, 0, 0.6705883, 1, 1,
0.1313626, 0.0862544, 2.329428, 0, 0.6627451, 1, 1,
0.1330184, 0.4070081, 0.9391598, 0, 0.6588235, 1, 1,
0.1378404, -1.392945, 4.162499, 0, 0.6509804, 1, 1,
0.1440344, -1.085946, 2.213946, 0, 0.6470588, 1, 1,
0.1480478, -0.2030236, 2.160166, 0, 0.6392157, 1, 1,
0.1526274, 0.2475609, -0.5767559, 0, 0.6352941, 1, 1,
0.1531121, -0.5516081, 3.519258, 0, 0.627451, 1, 1,
0.1538808, -0.2256597, 1.96837, 0, 0.6235294, 1, 1,
0.1550665, -0.04946214, 2.021831, 0, 0.6156863, 1, 1,
0.1618576, -0.3858252, 2.665639, 0, 0.6117647, 1, 1,
0.163457, 1.034257, 0.1595883, 0, 0.6039216, 1, 1,
0.1654897, -0.2307197, 3.493734, 0, 0.5960785, 1, 1,
0.1656261, -1.317908, 4.191029, 0, 0.5921569, 1, 1,
0.1687669, -0.208692, 3.652415, 0, 0.5843138, 1, 1,
0.1726003, -1.00258, 4.066376, 0, 0.5803922, 1, 1,
0.1794531, 0.9272969, 0.2180358, 0, 0.572549, 1, 1,
0.1820044, -0.8660141, 2.379476, 0, 0.5686275, 1, 1,
0.1847816, 0.3564349, 0.2935607, 0, 0.5607843, 1, 1,
0.1851424, -1.109676, 2.527563, 0, 0.5568628, 1, 1,
0.1887507, -0.3596338, 1.53368, 0, 0.5490196, 1, 1,
0.1939799, 0.5667564, 1.540356, 0, 0.5450981, 1, 1,
0.1941014, -1.719003, 4.324035, 0, 0.5372549, 1, 1,
0.1960449, -1.809449, 2.769707, 0, 0.5333334, 1, 1,
0.1968049, 0.2930683, -0.4592286, 0, 0.5254902, 1, 1,
0.1975061, -1.204724, 3.374794, 0, 0.5215687, 1, 1,
0.1996475, -2.847594, 3.310405, 0, 0.5137255, 1, 1,
0.2016689, -0.5425668, 2.660107, 0, 0.509804, 1, 1,
0.204976, -1.199031, 4.143567, 0, 0.5019608, 1, 1,
0.2077892, 0.153596, 0.06511611, 0, 0.4941176, 1, 1,
0.2100962, 2.914534, 1.991586, 0, 0.4901961, 1, 1,
0.2104899, -0.3439342, 2.333476, 0, 0.4823529, 1, 1,
0.2145519, 1.511708, 0.3542969, 0, 0.4784314, 1, 1,
0.2166222, 1.802685, -0.2818502, 0, 0.4705882, 1, 1,
0.2171035, -1.526745, 3.355598, 0, 0.4666667, 1, 1,
0.2190127, -0.4674535, 3.383365, 0, 0.4588235, 1, 1,
0.2192124, 0.7678434, 0.7236642, 0, 0.454902, 1, 1,
0.2204671, 1.36199, -0.5250172, 0, 0.4470588, 1, 1,
0.2229006, 0.1048853, 0.6189612, 0, 0.4431373, 1, 1,
0.2276656, 1.640386, 0.4668078, 0, 0.4352941, 1, 1,
0.228458, 0.4044894, 1.382259, 0, 0.4313726, 1, 1,
0.2292953, 0.2028338, 1.864746, 0, 0.4235294, 1, 1,
0.2329642, 0.3910006, 0.6382031, 0, 0.4196078, 1, 1,
0.2331036, -0.577747, 3.871558, 0, 0.4117647, 1, 1,
0.235313, -0.1734288, 2.03796, 0, 0.4078431, 1, 1,
0.2363566, 0.7962904, 1.678894, 0, 0.4, 1, 1,
0.2383412, 0.7566956, -0.4510116, 0, 0.3921569, 1, 1,
0.2394432, -1.293562, 2.103249, 0, 0.3882353, 1, 1,
0.2400842, -1.693704, 2.423806, 0, 0.3803922, 1, 1,
0.2410896, -0.142051, 4.161772, 0, 0.3764706, 1, 1,
0.2419683, -0.2045049, 1.692169, 0, 0.3686275, 1, 1,
0.2423483, -0.2201391, 1.626415, 0, 0.3647059, 1, 1,
0.2426143, 1.00959, 0.2677213, 0, 0.3568628, 1, 1,
0.2460476, 0.003925405, 0.5189761, 0, 0.3529412, 1, 1,
0.2530985, 0.7255067, 1.903063, 0, 0.345098, 1, 1,
0.253112, -1.134064, 1.186936, 0, 0.3411765, 1, 1,
0.2545484, -0.5546857, 3.310802, 0, 0.3333333, 1, 1,
0.2573588, 2.146335, -0.8612639, 0, 0.3294118, 1, 1,
0.2575547, -0.2447596, 2.561851, 0, 0.3215686, 1, 1,
0.263868, 1.49345, 0.6230367, 0, 0.3176471, 1, 1,
0.2651807, -1.206753, 3.02962, 0, 0.3098039, 1, 1,
0.2667878, -0.1859758, 2.061985, 0, 0.3058824, 1, 1,
0.2673308, -1.726293, 3.127643, 0, 0.2980392, 1, 1,
0.2736045, -0.06420127, 1.364532, 0, 0.2901961, 1, 1,
0.2741348, -0.470529, 3.071977, 0, 0.2862745, 1, 1,
0.2817803, -0.8121057, 3.852648, 0, 0.2784314, 1, 1,
0.2827495, -1.436744, 1.987211, 0, 0.2745098, 1, 1,
0.2853152, 0.3132482, 0.3087409, 0, 0.2666667, 1, 1,
0.2853209, -0.07426113, 3.09353, 0, 0.2627451, 1, 1,
0.2897156, 0.7869461, -1.49079, 0, 0.254902, 1, 1,
0.2914323, 0.5273734, -0.2477931, 0, 0.2509804, 1, 1,
0.2918877, -0.4151908, 3.022832, 0, 0.2431373, 1, 1,
0.2923512, 0.456024, 0.4225559, 0, 0.2392157, 1, 1,
0.2934803, -0.9800097, 4.068448, 0, 0.2313726, 1, 1,
0.2976504, -0.9097871, 3.102356, 0, 0.227451, 1, 1,
0.2983861, 2.478626, -0.5836112, 0, 0.2196078, 1, 1,
0.2996475, 1.564778, -0.05559215, 0, 0.2156863, 1, 1,
0.3043907, 1.16808, 1.036384, 0, 0.2078431, 1, 1,
0.3081275, -1.804167, 1.154443, 0, 0.2039216, 1, 1,
0.3105997, -1.924997, 1.930317, 0, 0.1960784, 1, 1,
0.3146818, 1.991389, -0.1372973, 0, 0.1882353, 1, 1,
0.3213826, -0.2083077, 2.164818, 0, 0.1843137, 1, 1,
0.3221333, 0.1181287, 1.460607, 0, 0.1764706, 1, 1,
0.3222559, -2.115583, 4.69872, 0, 0.172549, 1, 1,
0.3253531, 0.3129719, 0.6554207, 0, 0.1647059, 1, 1,
0.3277933, 1.072892, -0.6900629, 0, 0.1607843, 1, 1,
0.3286534, -1.132055, 2.272711, 0, 0.1529412, 1, 1,
0.3299439, -0.3250657, 1.893659, 0, 0.1490196, 1, 1,
0.3336867, -0.2192972, 1.945077, 0, 0.1411765, 1, 1,
0.3339837, 2.855925, -0.2444664, 0, 0.1372549, 1, 1,
0.3340816, -0.3138763, 2.687654, 0, 0.1294118, 1, 1,
0.3400099, 0.1447057, 1.441461, 0, 0.1254902, 1, 1,
0.3416118, -0.3009718, 1.13254, 0, 0.1176471, 1, 1,
0.3441084, -0.3780923, 1.123672, 0, 0.1137255, 1, 1,
0.3454644, 0.3033692, -0.4202024, 0, 0.1058824, 1, 1,
0.345779, -1.167437, 3.536728, 0, 0.09803922, 1, 1,
0.3487712, 1.121486, 0.2874838, 0, 0.09411765, 1, 1,
0.3525494, -0.9302321, 2.717208, 0, 0.08627451, 1, 1,
0.3561485, 1.971746, 1.940194, 0, 0.08235294, 1, 1,
0.3568992, -0.9854561, 3.143146, 0, 0.07450981, 1, 1,
0.3586786, -0.6994783, 2.018951, 0, 0.07058824, 1, 1,
0.3603221, -0.4502707, 4.588337, 0, 0.0627451, 1, 1,
0.366474, -0.2997996, 3.354867, 0, 0.05882353, 1, 1,
0.366752, -2.100986, 2.128202, 0, 0.05098039, 1, 1,
0.3735622, -1.003534, 4.381815, 0, 0.04705882, 1, 1,
0.3779039, -1.05078, 2.091532, 0, 0.03921569, 1, 1,
0.3801249, 0.2076912, -0.9700825, 0, 0.03529412, 1, 1,
0.3809775, -1.240577, 2.112514, 0, 0.02745098, 1, 1,
0.3828767, -0.4862012, 4.049332, 0, 0.02352941, 1, 1,
0.3839432, -0.941677, 2.474057, 0, 0.01568628, 1, 1,
0.3883761, -1.128876, 3.42423, 0, 0.01176471, 1, 1,
0.3954787, 1.979588, 0.07973339, 0, 0.003921569, 1, 1,
0.4008554, 0.4890091, -0.8553348, 0.003921569, 0, 1, 1,
0.40331, 0.8287966, -1.073255, 0.007843138, 0, 1, 1,
0.4043273, 0.8059683, -0.1135763, 0.01568628, 0, 1, 1,
0.4043311, 1.64845, -0.8443025, 0.01960784, 0, 1, 1,
0.4064202, 0.7758824, 0.3589611, 0.02745098, 0, 1, 1,
0.4092585, 0.2400247, 1.369626, 0.03137255, 0, 1, 1,
0.4102466, 1.777483, -1.109179, 0.03921569, 0, 1, 1,
0.4137781, 1.089051, 1.548618, 0.04313726, 0, 1, 1,
0.4192945, 0.6057621, 1.8593, 0.05098039, 0, 1, 1,
0.4214062, 2.720612, 1.059084, 0.05490196, 0, 1, 1,
0.4220472, 1.412578, 0.3575245, 0.0627451, 0, 1, 1,
0.4231809, -0.2049987, 1.171543, 0.06666667, 0, 1, 1,
0.4251058, -0.3733353, 3.46057, 0.07450981, 0, 1, 1,
0.4307478, 0.1669532, 2.648828, 0.07843138, 0, 1, 1,
0.4321415, -0.1714862, 1.429418, 0.08627451, 0, 1, 1,
0.434161, -1.501467, 4.753497, 0.09019608, 0, 1, 1,
0.4362308, 0.7349293, -0.5208246, 0.09803922, 0, 1, 1,
0.4396548, -1.727494, 3.395732, 0.1058824, 0, 1, 1,
0.4410718, 0.3521232, 1.998812, 0.1098039, 0, 1, 1,
0.441671, -2.010703, 3.631308, 0.1176471, 0, 1, 1,
0.4463378, -1.394652, 1.907762, 0.1215686, 0, 1, 1,
0.448611, 0.2238311, 0.7492915, 0.1294118, 0, 1, 1,
0.4545284, -0.9572647, 5.146243, 0.1333333, 0, 1, 1,
0.4548576, -1.710801, 2.543917, 0.1411765, 0, 1, 1,
0.4564984, -0.1976101, 1.358545, 0.145098, 0, 1, 1,
0.4566994, 1.152187, -1.546483, 0.1529412, 0, 1, 1,
0.4575666, -0.8239555, 3.981694, 0.1568628, 0, 1, 1,
0.4589983, 1.130386, -0.02435828, 0.1647059, 0, 1, 1,
0.4605721, 0.3957481, 2.031969, 0.1686275, 0, 1, 1,
0.4609077, -0.7534277, 3.819118, 0.1764706, 0, 1, 1,
0.4614573, -0.08707294, 0.461808, 0.1803922, 0, 1, 1,
0.4616751, 0.7335579, 0.01082771, 0.1882353, 0, 1, 1,
0.4619372, -1.296252, 2.390952, 0.1921569, 0, 1, 1,
0.4631155, -0.832675, 3.056895, 0.2, 0, 1, 1,
0.4672571, 0.838241, -0.7767464, 0.2078431, 0, 1, 1,
0.4717942, -0.4797718, 2.119433, 0.2117647, 0, 1, 1,
0.4722595, 0.3136685, 2.4155, 0.2196078, 0, 1, 1,
0.4729778, 0.1497332, 1.862501, 0.2235294, 0, 1, 1,
0.4826646, -0.08157932, 0.8210728, 0.2313726, 0, 1, 1,
0.48502, 0.366331, 0.98158, 0.2352941, 0, 1, 1,
0.4855171, 0.1406358, 1.006145, 0.2431373, 0, 1, 1,
0.4902459, 0.6169432, 0.07490113, 0.2470588, 0, 1, 1,
0.4922881, -0.272785, 0.4306309, 0.254902, 0, 1, 1,
0.493666, 0.8730979, 0.409646, 0.2588235, 0, 1, 1,
0.4948344, -1.242137, 2.870651, 0.2666667, 0, 1, 1,
0.4981689, -0.2623645, 3.951235, 0.2705882, 0, 1, 1,
0.5044856, 1.787768, -0.400126, 0.2784314, 0, 1, 1,
0.5050572, -0.2021245, 1.14932, 0.282353, 0, 1, 1,
0.5052684, -0.7162147, 4.629515, 0.2901961, 0, 1, 1,
0.5080162, -1.053778, 2.878476, 0.2941177, 0, 1, 1,
0.5147237, -1.971571, 2.634444, 0.3019608, 0, 1, 1,
0.5150611, 0.4459093, 0.4875154, 0.3098039, 0, 1, 1,
0.5174238, -0.141626, 3.395383, 0.3137255, 0, 1, 1,
0.5227275, 0.0676263, 2.679925, 0.3215686, 0, 1, 1,
0.5296789, -0.6006856, 3.486768, 0.3254902, 0, 1, 1,
0.5305444, -1.669477, 2.753999, 0.3333333, 0, 1, 1,
0.5316692, -0.2433669, 1.651394, 0.3372549, 0, 1, 1,
0.5352932, 0.9816335, 2.023207, 0.345098, 0, 1, 1,
0.540734, 0.6214766, 0.3722749, 0.3490196, 0, 1, 1,
0.5447606, 1.459463, 3.858925, 0.3568628, 0, 1, 1,
0.5461742, -0.3915295, 4.069382, 0.3607843, 0, 1, 1,
0.5571725, 0.1762356, -0.009598685, 0.3686275, 0, 1, 1,
0.5582533, -0.2854777, 1.836418, 0.372549, 0, 1, 1,
0.563965, -0.7109947, -0.2889093, 0.3803922, 0, 1, 1,
0.5642723, 0.2741618, 1.416363, 0.3843137, 0, 1, 1,
0.5647931, 0.0338956, 2.716007, 0.3921569, 0, 1, 1,
0.5673924, -1.938295, 2.578792, 0.3960784, 0, 1, 1,
0.5711971, -0.5677934, 2.560603, 0.4039216, 0, 1, 1,
0.5762841, 1.382305, 0.5746127, 0.4117647, 0, 1, 1,
0.5791363, -0.909029, 1.519276, 0.4156863, 0, 1, 1,
0.5801433, -1.638918, 1.683323, 0.4235294, 0, 1, 1,
0.5813892, -0.928716, 1.667265, 0.427451, 0, 1, 1,
0.5830297, -1.413369, 2.522576, 0.4352941, 0, 1, 1,
0.585025, 1.232889, 0.8929954, 0.4392157, 0, 1, 1,
0.5869558, 0.4128473, 2.042314, 0.4470588, 0, 1, 1,
0.5909468, 1.838534, 1.830673, 0.4509804, 0, 1, 1,
0.5955866, -0.2027279, 3.198318, 0.4588235, 0, 1, 1,
0.6026723, 0.6242316, 1.213109, 0.4627451, 0, 1, 1,
0.6039314, 0.2400406, -0.3682834, 0.4705882, 0, 1, 1,
0.6064849, -0.2787651, 3.010598, 0.4745098, 0, 1, 1,
0.6171861, 1.617237, 0.3866405, 0.4823529, 0, 1, 1,
0.6231164, 1.018746, 0.5520191, 0.4862745, 0, 1, 1,
0.6273701, 0.5154926, 2.761722, 0.4941176, 0, 1, 1,
0.6297544, -0.009362511, 1.004634, 0.5019608, 0, 1, 1,
0.6310924, -2.127636, 4.811594, 0.5058824, 0, 1, 1,
0.6324534, -0.2133808, 2.3325, 0.5137255, 0, 1, 1,
0.6334305, 0.3656117, 1.699149, 0.5176471, 0, 1, 1,
0.6364789, -0.4683505, 3.590354, 0.5254902, 0, 1, 1,
0.6391074, 0.5117722, 0.2435821, 0.5294118, 0, 1, 1,
0.6410694, 1.096331, 1.183396, 0.5372549, 0, 1, 1,
0.6425754, -1.270902, 1.551021, 0.5411765, 0, 1, 1,
0.6454597, 0.03187976, 1.146101, 0.5490196, 0, 1, 1,
0.6457298, 0.135517, 0.2342701, 0.5529412, 0, 1, 1,
0.6553189, -0.508046, 3.05174, 0.5607843, 0, 1, 1,
0.6566305, -0.2506123, 0.308405, 0.5647059, 0, 1, 1,
0.6594273, 0.7453007, 0.981912, 0.572549, 0, 1, 1,
0.6622338, -0.2765898, 2.885972, 0.5764706, 0, 1, 1,
0.6645591, -0.4378193, 1.084972, 0.5843138, 0, 1, 1,
0.6648338, -0.1046984, 0.4427347, 0.5882353, 0, 1, 1,
0.6652864, 0.7649852, 2.751413, 0.5960785, 0, 1, 1,
0.6748472, -0.3573266, 2.201774, 0.6039216, 0, 1, 1,
0.6766883, -1.685842, 3.528533, 0.6078432, 0, 1, 1,
0.677211, 1.661661, 0.4131515, 0.6156863, 0, 1, 1,
0.6783452, 0.231826, 1.22718, 0.6196079, 0, 1, 1,
0.6790155, -0.656595, 3.318101, 0.627451, 0, 1, 1,
0.6828889, -0.09303991, 0.5517166, 0.6313726, 0, 1, 1,
0.6942306, 1.549865, -0.04362189, 0.6392157, 0, 1, 1,
0.7090047, 0.7411609, 1.831119, 0.6431373, 0, 1, 1,
0.7098274, 0.3737645, 0.5094024, 0.6509804, 0, 1, 1,
0.7109286, 0.4323798, 0.3988256, 0.654902, 0, 1, 1,
0.7159547, 0.07322433, 1.502133, 0.6627451, 0, 1, 1,
0.7203381, -0.6007336, 3.029565, 0.6666667, 0, 1, 1,
0.7207856, -0.2137849, 3.130373, 0.6745098, 0, 1, 1,
0.725113, 1.848602, -0.1797044, 0.6784314, 0, 1, 1,
0.7255426, 0.923509, -0.4728126, 0.6862745, 0, 1, 1,
0.7287388, -0.2618042, 2.892485, 0.6901961, 0, 1, 1,
0.7295974, -0.1640903, 1.711502, 0.6980392, 0, 1, 1,
0.7304333, -0.1156782, 3.393739, 0.7058824, 0, 1, 1,
0.736566, -0.1854447, 1.07666, 0.7098039, 0, 1, 1,
0.7405104, 0.2153561, 1.121055, 0.7176471, 0, 1, 1,
0.7423001, -1.609348, 4.37504, 0.7215686, 0, 1, 1,
0.7481281, -0.07053358, 1.273908, 0.7294118, 0, 1, 1,
0.7518541, 0.4152606, -1.404312, 0.7333333, 0, 1, 1,
0.7684645, -0.1859818, 1.830964, 0.7411765, 0, 1, 1,
0.7690905, -0.274308, 1.611973, 0.7450981, 0, 1, 1,
0.7702128, -0.1293103, 3.274057, 0.7529412, 0, 1, 1,
0.7764381, -0.6755756, 2.330822, 0.7568628, 0, 1, 1,
0.7798226, 1.947127, 0.4179898, 0.7647059, 0, 1, 1,
0.7808986, -0.1204309, 2.308752, 0.7686275, 0, 1, 1,
0.7834228, 0.965346, 2.279317, 0.7764706, 0, 1, 1,
0.7841572, 0.0760271, 1.616388, 0.7803922, 0, 1, 1,
0.7854459, -0.9353033, 4.313778, 0.7882353, 0, 1, 1,
0.7879173, -0.7369497, 2.59256, 0.7921569, 0, 1, 1,
0.7904404, -0.5694129, 2.021599, 0.8, 0, 1, 1,
0.7970365, 0.8281465, 0.2869453, 0.8078431, 0, 1, 1,
0.7981395, 0.08428704, 2.152136, 0.8117647, 0, 1, 1,
0.8005868, -0.6516586, 3.074422, 0.8196079, 0, 1, 1,
0.8062407, 0.3879697, 0.8087363, 0.8235294, 0, 1, 1,
0.8066472, -0.7699896, 2.408835, 0.8313726, 0, 1, 1,
0.8094771, -0.7202439, 0.7298175, 0.8352941, 0, 1, 1,
0.8149652, -1.194229, 3.886285, 0.8431373, 0, 1, 1,
0.8177151, 0.7937341, 0.5987602, 0.8470588, 0, 1, 1,
0.8178716, -0.8545337, 3.302577, 0.854902, 0, 1, 1,
0.8181449, 1.437098, 0.5205568, 0.8588235, 0, 1, 1,
0.8336974, -1.630831, 1.371834, 0.8666667, 0, 1, 1,
0.8340775, 0.415094, -0.2782778, 0.8705882, 0, 1, 1,
0.8376505, -0.01323635, 0.8978428, 0.8784314, 0, 1, 1,
0.8380411, 0.183966, 0.1827646, 0.8823529, 0, 1, 1,
0.8391564, 1.598958, 0.4036392, 0.8901961, 0, 1, 1,
0.8462906, -0.004437683, 2.007351, 0.8941177, 0, 1, 1,
0.8463048, -1.392931, 3.885023, 0.9019608, 0, 1, 1,
0.8501286, -2.12983, 3.595603, 0.9098039, 0, 1, 1,
0.8560351, -0.2925893, 2.06645, 0.9137255, 0, 1, 1,
0.8566285, -1.264699, 2.624458, 0.9215686, 0, 1, 1,
0.8644367, 0.170975, 0.6470118, 0.9254902, 0, 1, 1,
0.8687525, -1.680521, 3.33773, 0.9333333, 0, 1, 1,
0.878179, -0.4885668, -0.4212304, 0.9372549, 0, 1, 1,
0.883534, -0.3524593, 1.742522, 0.945098, 0, 1, 1,
0.8851464, 0.247139, 1.058742, 0.9490196, 0, 1, 1,
0.9007314, -0.8284813, 2.534256, 0.9568627, 0, 1, 1,
0.9030932, 0.1152064, 2.98187, 0.9607843, 0, 1, 1,
0.9037283, -0.2392079, 0.9414157, 0.9686275, 0, 1, 1,
0.914416, 0.8866338, 1.379697, 0.972549, 0, 1, 1,
0.9287456, -0.7540128, 3.97419, 0.9803922, 0, 1, 1,
0.9294306, 0.4159685, 2.429147, 0.9843137, 0, 1, 1,
0.9329374, -0.7692212, 1.436387, 0.9921569, 0, 1, 1,
0.93343, 1.227106, 0.9998485, 0.9960784, 0, 1, 1,
0.9465014, -1.292561, 3.087448, 1, 0, 0.9960784, 1,
0.9507129, 0.420201, 1.473477, 1, 0, 0.9882353, 1,
0.9559259, -0.4858324, 2.263371, 1, 0, 0.9843137, 1,
0.961399, -0.04198883, 0.1995204, 1, 0, 0.9764706, 1,
0.9628505, 2.48251, 1.356762, 1, 0, 0.972549, 1,
0.9637486, -1.443447, 1.834022, 1, 0, 0.9647059, 1,
0.9667746, 0.1430974, 2.354239, 1, 0, 0.9607843, 1,
0.9763771, -0.2530575, 2.457356, 1, 0, 0.9529412, 1,
0.987104, 1.028249, 1.967903, 1, 0, 0.9490196, 1,
0.9895836, -1.092777, 4.735543, 1, 0, 0.9411765, 1,
0.9901806, -0.2649367, 2.223325, 1, 0, 0.9372549, 1,
1.008889, -0.5580419, 1.708727, 1, 0, 0.9294118, 1,
1.014945, 0.170917, 1.625925, 1, 0, 0.9254902, 1,
1.020593, 1.020416, 0.7993652, 1, 0, 0.9176471, 1,
1.022498, -0.9418542, 1.555671, 1, 0, 0.9137255, 1,
1.023147, 0.5596554, 1.863686, 1, 0, 0.9058824, 1,
1.023234, 1.987596, 1.193122, 1, 0, 0.9019608, 1,
1.02824, -0.1973029, -0.0732463, 1, 0, 0.8941177, 1,
1.035921, -1.136645, 1.115991, 1, 0, 0.8862745, 1,
1.046493, 0.1376791, 2.495842, 1, 0, 0.8823529, 1,
1.051372, -0.7477964, 3.129809, 1, 0, 0.8745098, 1,
1.054158, -0.06002054, 2.141515, 1, 0, 0.8705882, 1,
1.055011, 0.221496, 1.297957, 1, 0, 0.8627451, 1,
1.056154, -1.01101, 2.034297, 1, 0, 0.8588235, 1,
1.059661, -1.286984, 2.563005, 1, 0, 0.8509804, 1,
1.064228, 0.6462353, 0.831789, 1, 0, 0.8470588, 1,
1.068151, 2.662879, -0.6056275, 1, 0, 0.8392157, 1,
1.069741, 0.9180292, 0.7759854, 1, 0, 0.8352941, 1,
1.072638, 0.2264638, 2.963676, 1, 0, 0.827451, 1,
1.073904, -0.3888465, 2.121614, 1, 0, 0.8235294, 1,
1.075007, -0.7714716, 2.600308, 1, 0, 0.8156863, 1,
1.085575, -1.073987, 2.670028, 1, 0, 0.8117647, 1,
1.08636, 0.08280144, 2.99627, 1, 0, 0.8039216, 1,
1.087824, -0.5959885, 1.441017, 1, 0, 0.7960784, 1,
1.094118, 0.8197163, -0.5363947, 1, 0, 0.7921569, 1,
1.100851, 0.5214854, 1.521739, 1, 0, 0.7843137, 1,
1.10269, -0.5276121, 1.941217, 1, 0, 0.7803922, 1,
1.107435, 0.3288376, 1.926126, 1, 0, 0.772549, 1,
1.107984, -0.4068149, 0.5747092, 1, 0, 0.7686275, 1,
1.126673, -0.03768967, 1.098203, 1, 0, 0.7607843, 1,
1.130338, 0.7112738, -1.131945, 1, 0, 0.7568628, 1,
1.142804, 0.7332808, 0.4370148, 1, 0, 0.7490196, 1,
1.143622, -0.2813948, 0.8394675, 1, 0, 0.7450981, 1,
1.144164, -0.8895271, 2.379606, 1, 0, 0.7372549, 1,
1.14597, 0.1741841, 2.608571, 1, 0, 0.7333333, 1,
1.150316, -1.513276, 2.090166, 1, 0, 0.7254902, 1,
1.159233, 0.3533325, -0.3964278, 1, 0, 0.7215686, 1,
1.162846, -0.3043933, 2.869439, 1, 0, 0.7137255, 1,
1.165377, 1.621761, 0.7910532, 1, 0, 0.7098039, 1,
1.171161, -0.05873834, 2.442692, 1, 0, 0.7019608, 1,
1.1812, -0.5707031, 0.2797033, 1, 0, 0.6941177, 1,
1.183127, -1.915679, 2.286782, 1, 0, 0.6901961, 1,
1.184322, 0.1053227, 1.205889, 1, 0, 0.682353, 1,
1.186618, -0.1786833, 3.117971, 1, 0, 0.6784314, 1,
1.190352, 0.05511948, 0.8038107, 1, 0, 0.6705883, 1,
1.19189, 0.2410143, 1.765047, 1, 0, 0.6666667, 1,
1.193892, 3.180879, 0.8606167, 1, 0, 0.6588235, 1,
1.201123, 0.6761314, 0.3544798, 1, 0, 0.654902, 1,
1.207329, 1.286055, -0.7613435, 1, 0, 0.6470588, 1,
1.211405, 0.1256122, 2.375119, 1, 0, 0.6431373, 1,
1.217744, -0.4927784, 1.813279, 1, 0, 0.6352941, 1,
1.218992, -1.323543, 0.487123, 1, 0, 0.6313726, 1,
1.219261, 1.68966, -1.260298, 1, 0, 0.6235294, 1,
1.225695, -1.60954, 2.124072, 1, 0, 0.6196079, 1,
1.231411, -0.7565568, 1.164508, 1, 0, 0.6117647, 1,
1.234453, -1.075548, 2.747963, 1, 0, 0.6078432, 1,
1.249244, -0.04077462, 0.7100899, 1, 0, 0.6, 1,
1.258439, 0.2174766, 1.113486, 1, 0, 0.5921569, 1,
1.260707, 0.1118177, 2.783935, 1, 0, 0.5882353, 1,
1.26137, 0.8719633, 1.907164, 1, 0, 0.5803922, 1,
1.272648, -1.830948, 3.544357, 1, 0, 0.5764706, 1,
1.275398, -1.582258, 3.735277, 1, 0, 0.5686275, 1,
1.276949, -0.2404097, 1.853293, 1, 0, 0.5647059, 1,
1.27743, 0.3308511, 2.985003, 1, 0, 0.5568628, 1,
1.278069, 0.7404904, -1.028232, 1, 0, 0.5529412, 1,
1.280079, 2.067278, 0.8989596, 1, 0, 0.5450981, 1,
1.284678, 0.2707729, 0.5394003, 1, 0, 0.5411765, 1,
1.293619, 1.137763, 0.7051798, 1, 0, 0.5333334, 1,
1.300001, -1.144428, 2.839274, 1, 0, 0.5294118, 1,
1.301597, 0.9666373, 1.167973, 1, 0, 0.5215687, 1,
1.306583, 2.126092, -0.008564687, 1, 0, 0.5176471, 1,
1.309683, -1.589563, 2.956399, 1, 0, 0.509804, 1,
1.312233, 1.38662, 0.3638665, 1, 0, 0.5058824, 1,
1.316318, -0.885352, 0.4470301, 1, 0, 0.4980392, 1,
1.342566, 0.306821, 0.6463012, 1, 0, 0.4901961, 1,
1.345587, 0.3376196, 1.710698, 1, 0, 0.4862745, 1,
1.354058, 2.319677, 0.662481, 1, 0, 0.4784314, 1,
1.363625, 0.6538167, 2.182418, 1, 0, 0.4745098, 1,
1.364671, 0.849135, 1.40827, 1, 0, 0.4666667, 1,
1.379469, 0.5086494, 1.011597, 1, 0, 0.4627451, 1,
1.384639, -0.8922883, 1.382299, 1, 0, 0.454902, 1,
1.394999, 2.348103, 0.5148285, 1, 0, 0.4509804, 1,
1.399316, 1.590956, -0.5811647, 1, 0, 0.4431373, 1,
1.400291, 1.959232, 1.520916, 1, 0, 0.4392157, 1,
1.404735, -0.3781433, 1.051305, 1, 0, 0.4313726, 1,
1.405616, 0.3167333, 2.169551, 1, 0, 0.427451, 1,
1.413098, 0.9836972, 1.917981, 1, 0, 0.4196078, 1,
1.429837, -0.7629485, 1.81553, 1, 0, 0.4156863, 1,
1.43023, -0.8659636, 1.619624, 1, 0, 0.4078431, 1,
1.450736, 0.9309229, 1.660379, 1, 0, 0.4039216, 1,
1.452179, 0.7835285, 1.070672, 1, 0, 0.3960784, 1,
1.453997, -1.388991, 2.609923, 1, 0, 0.3882353, 1,
1.458636, -1.154408, 3.748573, 1, 0, 0.3843137, 1,
1.482281, -0.1756627, 3.185774, 1, 0, 0.3764706, 1,
1.487604, 0.2706005, 2.082197, 1, 0, 0.372549, 1,
1.488705, -1.416688, 1.9173, 1, 0, 0.3647059, 1,
1.490043, 0.792905, 0.9400828, 1, 0, 0.3607843, 1,
1.493759, -0.7905309, 2.020022, 1, 0, 0.3529412, 1,
1.500189, 0.9492278, -0.3320563, 1, 0, 0.3490196, 1,
1.509681, 0.7837091, -0.2504838, 1, 0, 0.3411765, 1,
1.521596, 0.4002018, 0.2776173, 1, 0, 0.3372549, 1,
1.523882, -0.8420129, 2.480036, 1, 0, 0.3294118, 1,
1.535245, -0.6397727, 1.708379, 1, 0, 0.3254902, 1,
1.54784, 1.026962, 1.296331, 1, 0, 0.3176471, 1,
1.556044, -0.2048432, 3.021586, 1, 0, 0.3137255, 1,
1.575716, 0.1103427, 3.546592, 1, 0, 0.3058824, 1,
1.60029, -0.4341332, 3.316985, 1, 0, 0.2980392, 1,
1.605593, -0.5736428, 2.351456, 1, 0, 0.2941177, 1,
1.617922, 0.9964408, 1.363552, 1, 0, 0.2862745, 1,
1.627165, 0.4434762, 2.824019, 1, 0, 0.282353, 1,
1.628084, 0.7613947, 1.677991, 1, 0, 0.2745098, 1,
1.643123, -0.8071108, 2.272288, 1, 0, 0.2705882, 1,
1.64692, -1.315435, 2.313019, 1, 0, 0.2627451, 1,
1.657364, -1.839025, 3.102393, 1, 0, 0.2588235, 1,
1.657785, 0.5137423, -0.113631, 1, 0, 0.2509804, 1,
1.66292, 0.6715305, 2.391128, 1, 0, 0.2470588, 1,
1.665187, -1.162085, 0.8912886, 1, 0, 0.2392157, 1,
1.666248, 0.06854085, -0.3566036, 1, 0, 0.2352941, 1,
1.669234, -1.241963, 3.254341, 1, 0, 0.227451, 1,
1.672187, -0.4096795, 1.887494, 1, 0, 0.2235294, 1,
1.679265, -0.09656344, 1.842572, 1, 0, 0.2156863, 1,
1.685364, 0.3046277, 0.7395388, 1, 0, 0.2117647, 1,
1.699183, 0.6869528, 0.2010972, 1, 0, 0.2039216, 1,
1.700298, -0.4084604, 1.266589, 1, 0, 0.1960784, 1,
1.714462, 0.9545506, 2.521986, 1, 0, 0.1921569, 1,
1.716731, 0.03055849, 3.293258, 1, 0, 0.1843137, 1,
1.720094, -0.3505637, 2.532233, 1, 0, 0.1803922, 1,
1.736571, -0.118763, -0.2641835, 1, 0, 0.172549, 1,
1.744964, 0.4998293, 1.283328, 1, 0, 0.1686275, 1,
1.749954, -0.5647395, 2.148078, 1, 0, 0.1607843, 1,
1.756575, 0.2220429, -0.1302209, 1, 0, 0.1568628, 1,
1.762016, 0.2349045, 0.856008, 1, 0, 0.1490196, 1,
1.830109, 0.5248836, 2.760439, 1, 0, 0.145098, 1,
1.840551, 0.1020843, 2.488314, 1, 0, 0.1372549, 1,
1.84949, 3.215059, 0.4134032, 1, 0, 0.1333333, 1,
1.861502, 1.024747, 2.313221, 1, 0, 0.1254902, 1,
2.015787, -1.602477, 3.248016, 1, 0, 0.1215686, 1,
2.044651, 2.174256, 1.138931, 1, 0, 0.1137255, 1,
2.055752, 0.2703857, 2.855001, 1, 0, 0.1098039, 1,
2.062889, 0.7011572, 3.094038, 1, 0, 0.1019608, 1,
2.094784, 0.03424808, 3.07014, 1, 0, 0.09411765, 1,
2.102973, 0.5993049, 1.309918, 1, 0, 0.09019608, 1,
2.13346, -0.5065355, 1.413313, 1, 0, 0.08235294, 1,
2.148758, 0.0817048, 1.860853, 1, 0, 0.07843138, 1,
2.167414, -0.4502332, 1.743179, 1, 0, 0.07058824, 1,
2.19492, 2.439536, -0.1252943, 1, 0, 0.06666667, 1,
2.201358, -0.3513928, 1.970783, 1, 0, 0.05882353, 1,
2.322005, -0.1947913, 1.013673, 1, 0, 0.05490196, 1,
2.352244, -1.005528, 3.990944, 1, 0, 0.04705882, 1,
2.389859, -0.07011737, 0.9443311, 1, 0, 0.04313726, 1,
2.410508, -0.4859798, 2.956455, 1, 0, 0.03529412, 1,
2.463231, 0.8354561, 1.563111, 1, 0, 0.03137255, 1,
2.52706, 0.5947306, 0.8964151, 1, 0, 0.02352941, 1,
2.571097, -1.24128, 3.172212, 1, 0, 0.01960784, 1,
2.826114, 2.537265, -0.580279, 1, 0, 0.01176471, 1,
3.004575, 1.057112, 0.9758981, 1, 0, 0.007843138, 1
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
0.005815864, -3.903001, -7.383698, 0, -0.5, 0.5, 0.5,
0.005815864, -3.903001, -7.383698, 1, -0.5, 0.5, 0.5,
0.005815864, -3.903001, -7.383698, 1, 1.5, 0.5, 0.5,
0.005815864, -3.903001, -7.383698, 0, 1.5, 0.5, 0.5
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
-4.009522, 0.265702, -7.383698, 0, -0.5, 0.5, 0.5,
-4.009522, 0.265702, -7.383698, 1, -0.5, 0.5, 0.5,
-4.009522, 0.265702, -7.383698, 1, 1.5, 0.5, 0.5,
-4.009522, 0.265702, -7.383698, 0, 1.5, 0.5, 0.5
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
-4.009522, -3.903001, -0.2107222, 0, -0.5, 0.5, 0.5,
-4.009522, -3.903001, -0.2107222, 1, -0.5, 0.5, 0.5,
-4.009522, -3.903001, -0.2107222, 1, 1.5, 0.5, 0.5,
-4.009522, -3.903001, -0.2107222, 0, 1.5, 0.5, 0.5
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
-2, -2.940992, -5.728396,
3, -2.940992, -5.728396,
-2, -2.940992, -5.728396,
-2, -3.101327, -6.00428,
-1, -2.940992, -5.728396,
-1, -3.101327, -6.00428,
0, -2.940992, -5.728396,
0, -3.101327, -6.00428,
1, -2.940992, -5.728396,
1, -3.101327, -6.00428,
2, -2.940992, -5.728396,
2, -3.101327, -6.00428,
3, -2.940992, -5.728396,
3, -3.101327, -6.00428
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
-2, -3.421997, -6.556047, 0, -0.5, 0.5, 0.5,
-2, -3.421997, -6.556047, 1, -0.5, 0.5, 0.5,
-2, -3.421997, -6.556047, 1, 1.5, 0.5, 0.5,
-2, -3.421997, -6.556047, 0, 1.5, 0.5, 0.5,
-1, -3.421997, -6.556047, 0, -0.5, 0.5, 0.5,
-1, -3.421997, -6.556047, 1, -0.5, 0.5, 0.5,
-1, -3.421997, -6.556047, 1, 1.5, 0.5, 0.5,
-1, -3.421997, -6.556047, 0, 1.5, 0.5, 0.5,
0, -3.421997, -6.556047, 0, -0.5, 0.5, 0.5,
0, -3.421997, -6.556047, 1, -0.5, 0.5, 0.5,
0, -3.421997, -6.556047, 1, 1.5, 0.5, 0.5,
0, -3.421997, -6.556047, 0, 1.5, 0.5, 0.5,
1, -3.421997, -6.556047, 0, -0.5, 0.5, 0.5,
1, -3.421997, -6.556047, 1, -0.5, 0.5, 0.5,
1, -3.421997, -6.556047, 1, 1.5, 0.5, 0.5,
1, -3.421997, -6.556047, 0, 1.5, 0.5, 0.5,
2, -3.421997, -6.556047, 0, -0.5, 0.5, 0.5,
2, -3.421997, -6.556047, 1, -0.5, 0.5, 0.5,
2, -3.421997, -6.556047, 1, 1.5, 0.5, 0.5,
2, -3.421997, -6.556047, 0, 1.5, 0.5, 0.5,
3, -3.421997, -6.556047, 0, -0.5, 0.5, 0.5,
3, -3.421997, -6.556047, 1, -0.5, 0.5, 0.5,
3, -3.421997, -6.556047, 1, 1.5, 0.5, 0.5,
3, -3.421997, -6.556047, 0, 1.5, 0.5, 0.5
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
-3.082906, -2, -5.728396,
-3.082906, 3, -5.728396,
-3.082906, -2, -5.728396,
-3.237342, -2, -6.00428,
-3.082906, -1, -5.728396,
-3.237342, -1, -6.00428,
-3.082906, 0, -5.728396,
-3.237342, 0, -6.00428,
-3.082906, 1, -5.728396,
-3.237342, 1, -6.00428,
-3.082906, 2, -5.728396,
-3.237342, 2, -6.00428,
-3.082906, 3, -5.728396,
-3.237342, 3, -6.00428
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
-3.546214, -2, -6.556047, 0, -0.5, 0.5, 0.5,
-3.546214, -2, -6.556047, 1, -0.5, 0.5, 0.5,
-3.546214, -2, -6.556047, 1, 1.5, 0.5, 0.5,
-3.546214, -2, -6.556047, 0, 1.5, 0.5, 0.5,
-3.546214, -1, -6.556047, 0, -0.5, 0.5, 0.5,
-3.546214, -1, -6.556047, 1, -0.5, 0.5, 0.5,
-3.546214, -1, -6.556047, 1, 1.5, 0.5, 0.5,
-3.546214, -1, -6.556047, 0, 1.5, 0.5, 0.5,
-3.546214, 0, -6.556047, 0, -0.5, 0.5, 0.5,
-3.546214, 0, -6.556047, 1, -0.5, 0.5, 0.5,
-3.546214, 0, -6.556047, 1, 1.5, 0.5, 0.5,
-3.546214, 0, -6.556047, 0, 1.5, 0.5, 0.5,
-3.546214, 1, -6.556047, 0, -0.5, 0.5, 0.5,
-3.546214, 1, -6.556047, 1, -0.5, 0.5, 0.5,
-3.546214, 1, -6.556047, 1, 1.5, 0.5, 0.5,
-3.546214, 1, -6.556047, 0, 1.5, 0.5, 0.5,
-3.546214, 2, -6.556047, 0, -0.5, 0.5, 0.5,
-3.546214, 2, -6.556047, 1, -0.5, 0.5, 0.5,
-3.546214, 2, -6.556047, 1, 1.5, 0.5, 0.5,
-3.546214, 2, -6.556047, 0, 1.5, 0.5, 0.5,
-3.546214, 3, -6.556047, 0, -0.5, 0.5, 0.5,
-3.546214, 3, -6.556047, 1, -0.5, 0.5, 0.5,
-3.546214, 3, -6.556047, 1, 1.5, 0.5, 0.5,
-3.546214, 3, -6.556047, 0, 1.5, 0.5, 0.5
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
-3.082906, -2.940992, -4,
-3.082906, -2.940992, 4,
-3.082906, -2.940992, -4,
-3.237342, -3.101327, -4,
-3.082906, -2.940992, -2,
-3.237342, -3.101327, -2,
-3.082906, -2.940992, 0,
-3.237342, -3.101327, 0,
-3.082906, -2.940992, 2,
-3.237342, -3.101327, 2,
-3.082906, -2.940992, 4,
-3.237342, -3.101327, 4
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
-3.546214, -3.421997, -4, 0, -0.5, 0.5, 0.5,
-3.546214, -3.421997, -4, 1, -0.5, 0.5, 0.5,
-3.546214, -3.421997, -4, 1, 1.5, 0.5, 0.5,
-3.546214, -3.421997, -4, 0, 1.5, 0.5, 0.5,
-3.546214, -3.421997, -2, 0, -0.5, 0.5, 0.5,
-3.546214, -3.421997, -2, 1, -0.5, 0.5, 0.5,
-3.546214, -3.421997, -2, 1, 1.5, 0.5, 0.5,
-3.546214, -3.421997, -2, 0, 1.5, 0.5, 0.5,
-3.546214, -3.421997, 0, 0, -0.5, 0.5, 0.5,
-3.546214, -3.421997, 0, 1, -0.5, 0.5, 0.5,
-3.546214, -3.421997, 0, 1, 1.5, 0.5, 0.5,
-3.546214, -3.421997, 0, 0, 1.5, 0.5, 0.5,
-3.546214, -3.421997, 2, 0, -0.5, 0.5, 0.5,
-3.546214, -3.421997, 2, 1, -0.5, 0.5, 0.5,
-3.546214, -3.421997, 2, 1, 1.5, 0.5, 0.5,
-3.546214, -3.421997, 2, 0, 1.5, 0.5, 0.5,
-3.546214, -3.421997, 4, 0, -0.5, 0.5, 0.5,
-3.546214, -3.421997, 4, 1, -0.5, 0.5, 0.5,
-3.546214, -3.421997, 4, 1, 1.5, 0.5, 0.5,
-3.546214, -3.421997, 4, 0, 1.5, 0.5, 0.5
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
-3.082906, -2.940992, -5.728396,
-3.082906, 3.472396, -5.728396,
-3.082906, -2.940992, 5.306952,
-3.082906, 3.472396, 5.306952,
-3.082906, -2.940992, -5.728396,
-3.082906, -2.940992, 5.306952,
-3.082906, 3.472396, -5.728396,
-3.082906, 3.472396, 5.306952,
-3.082906, -2.940992, -5.728396,
3.094537, -2.940992, -5.728396,
-3.082906, -2.940992, 5.306952,
3.094537, -2.940992, 5.306952,
-3.082906, 3.472396, -5.728396,
3.094537, 3.472396, -5.728396,
-3.082906, 3.472396, 5.306952,
3.094537, 3.472396, 5.306952,
3.094537, -2.940992, -5.728396,
3.094537, 3.472396, -5.728396,
3.094537, -2.940992, 5.306952,
3.094537, 3.472396, 5.306952,
3.094537, -2.940992, -5.728396,
3.094537, -2.940992, 5.306952,
3.094537, 3.472396, -5.728396,
3.094537, 3.472396, 5.306952
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
var radius = 7.571823;
var distance = 33.6879;
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
mvMatrix.translate( -0.005815864, -0.265702, 0.2107222 );
mvMatrix.scale( 1.325274, 1.276518, 0.7418709 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.6879);
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
anilofos<-read.table("anilofos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-anilofos$V2
```

```
## Error in eval(expr, envir, enclos): object 'anilofos' not found
```

```r
y<-anilofos$V3
```

```
## Error in eval(expr, envir, enclos): object 'anilofos' not found
```

```r
z<-anilofos$V4
```

```
## Error in eval(expr, envir, enclos): object 'anilofos' not found
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
-2.992943, -0.66148, -1.472975, 0, 0, 1, 1, 1,
-2.823804, 0.3593663, -2.37554, 1, 0, 0, 1, 1,
-2.655803, -0.1149358, -1.106244, 1, 0, 0, 1, 1,
-2.567014, -0.2564113, -2.091684, 1, 0, 0, 1, 1,
-2.543221, 0.4224297, -1.422411, 1, 0, 0, 1, 1,
-2.427914, 0.4860871, -2.0825, 1, 0, 0, 1, 1,
-2.305563, 0.4335903, -1.83914, 0, 0, 0, 1, 1,
-2.305122, 1.991036, -1.128697, 0, 0, 0, 1, 1,
-2.263786, -0.9740039, -3.015241, 0, 0, 0, 1, 1,
-2.251194, -1.314956, -1.338483, 0, 0, 0, 1, 1,
-2.248328, -0.4838924, -1.9288, 0, 0, 0, 1, 1,
-2.247204, -0.807088, -1.136866, 0, 0, 0, 1, 1,
-2.197629, -0.001974083, -2.093185, 0, 0, 0, 1, 1,
-2.182554, -0.3933107, -3.451581, 1, 1, 1, 1, 1,
-2.160129, 3.378998, -0.5370559, 1, 1, 1, 1, 1,
-2.102561, -1.478908, -1.176717, 1, 1, 1, 1, 1,
-2.072482, 1.625868, -2.384676, 1, 1, 1, 1, 1,
-2.051181, 0.8970841, -1.258598, 1, 1, 1, 1, 1,
-2.046193, 1.380813, -0.5754206, 1, 1, 1, 1, 1,
-2.036962, 0.3108732, -2.182216, 1, 1, 1, 1, 1,
-2.028292, 0.5732104, -0.4476373, 1, 1, 1, 1, 1,
-2.008967, 1.058333, -1.872455, 1, 1, 1, 1, 1,
-1.990571, 0.3057708, -2.579967, 1, 1, 1, 1, 1,
-1.987726, -0.6488002, -0.02885506, 1, 1, 1, 1, 1,
-1.97415, 0.72784, -0.02478495, 1, 1, 1, 1, 1,
-1.939495, -0.73459, -2.61846, 1, 1, 1, 1, 1,
-1.856961, 0.09737936, -3.390935, 1, 1, 1, 1, 1,
-1.848817, 1.170507, -1.753445, 1, 1, 1, 1, 1,
-1.82013, -1.065762, -1.990269, 0, 0, 1, 1, 1,
-1.810929, -0.365756, -1.927032, 1, 0, 0, 1, 1,
-1.810374, -0.7874761, -2.287575, 1, 0, 0, 1, 1,
-1.792949, -0.1929894, -2.785514, 1, 0, 0, 1, 1,
-1.787644, -0.842618, -2.96754, 1, 0, 0, 1, 1,
-1.775374, 0.4546995, -3.742063, 1, 0, 0, 1, 1,
-1.773929, 0.5759236, -0.3626055, 0, 0, 0, 1, 1,
-1.769665, -0.8361523, -2.179023, 0, 0, 0, 1, 1,
-1.766257, -0.545136, -0.7404727, 0, 0, 0, 1, 1,
-1.751416, -2.235887, -3.277454, 0, 0, 0, 1, 1,
-1.740192, -0.5656972, -1.713493, 0, 0, 0, 1, 1,
-1.735054, -1.703604, -2.249247, 0, 0, 0, 1, 1,
-1.69964, -0.4711945, -2.746778, 0, 0, 0, 1, 1,
-1.694282, 0.8645374, -0.3146373, 1, 1, 1, 1, 1,
-1.689985, -0.006138976, -2.339334, 1, 1, 1, 1, 1,
-1.669007, -0.03518001, -2.68994, 1, 1, 1, 1, 1,
-1.657178, 1.448347, -2.177982, 1, 1, 1, 1, 1,
-1.648568, 0.5778331, -0.3219045, 1, 1, 1, 1, 1,
-1.619455, -2.042902, -3.445449, 1, 1, 1, 1, 1,
-1.545465, -0.1351594, -1.062523, 1, 1, 1, 1, 1,
-1.536708, 1.074372, -1.81569, 1, 1, 1, 1, 1,
-1.534265, -0.8457008, -1.540837, 1, 1, 1, 1, 1,
-1.513303, 0.9393428, -2.623578, 1, 1, 1, 1, 1,
-1.512231, 0.5753135, -2.534997, 1, 1, 1, 1, 1,
-1.496007, -0.0732791, -1.32057, 1, 1, 1, 1, 1,
-1.470371, -0.520255, -1.477473, 1, 1, 1, 1, 1,
-1.467886, 1.781868, -0.8940538, 1, 1, 1, 1, 1,
-1.464131, 0.08472231, -1.47802, 1, 1, 1, 1, 1,
-1.46328, 1.530384, -1.449643, 0, 0, 1, 1, 1,
-1.460514, 2.596717, -0.6061359, 1, 0, 0, 1, 1,
-1.447722, 0.2689438, -3.050904, 1, 0, 0, 1, 1,
-1.441793, -1.079639, -3.628215, 1, 0, 0, 1, 1,
-1.418986, 0.6303282, -1.54845, 1, 0, 0, 1, 1,
-1.418396, -0.695906, -1.778772, 1, 0, 0, 1, 1,
-1.416514, -0.9512966, -0.2742002, 0, 0, 0, 1, 1,
-1.403182, 1.416954, -2.257078, 0, 0, 0, 1, 1,
-1.398933, -0.135675, -3.548096, 0, 0, 0, 1, 1,
-1.396362, 0.9575367, -0.5558056, 0, 0, 0, 1, 1,
-1.395945, 0.8541989, -0.1181823, 0, 0, 0, 1, 1,
-1.393639, -0.7684772, -0.4761108, 0, 0, 0, 1, 1,
-1.38439, 0.07656738, -1.128515, 0, 0, 0, 1, 1,
-1.372893, -1.621297, -3.948828, 1, 1, 1, 1, 1,
-1.360936, 0.1360476, -2.384135, 1, 1, 1, 1, 1,
-1.359981, 0.8077803, -0.4416324, 1, 1, 1, 1, 1,
-1.354262, -0.4584296, -1.303131, 1, 1, 1, 1, 1,
-1.35107, -0.1873869, -1.638309, 1, 1, 1, 1, 1,
-1.349898, 0.5193879, -0.6063109, 1, 1, 1, 1, 1,
-1.333599, -0.8040789, -2.802733, 1, 1, 1, 1, 1,
-1.332367, -0.5249264, -1.850057, 1, 1, 1, 1, 1,
-1.328115, 0.2147671, -1.864229, 1, 1, 1, 1, 1,
-1.326803, -0.3186226, -2.32185, 1, 1, 1, 1, 1,
-1.322789, -1.296681, -4.996787, 1, 1, 1, 1, 1,
-1.321038, -0.1583571, 0.04810217, 1, 1, 1, 1, 1,
-1.303561, -2.33019, -3.753064, 1, 1, 1, 1, 1,
-1.286745, -1.075363, -1.971398, 1, 1, 1, 1, 1,
-1.284476, 0.2813544, -1.403697, 1, 1, 1, 1, 1,
-1.283703, -0.1163115, 0.2853487, 0, 0, 1, 1, 1,
-1.279211, -0.3339821, -2.68308, 1, 0, 0, 1, 1,
-1.266516, -0.2324787, -1.987312, 1, 0, 0, 1, 1,
-1.264921, 0.7032272, -1.374439, 1, 0, 0, 1, 1,
-1.250418, 0.3889593, 0.05698938, 1, 0, 0, 1, 1,
-1.249571, -0.8268533, -1.408124, 1, 0, 0, 1, 1,
-1.244326, 1.408174, 0.01545835, 0, 0, 0, 1, 1,
-1.231936, -0.4081914, -0.5476342, 0, 0, 0, 1, 1,
-1.23057, -0.7187703, -1.803015, 0, 0, 0, 1, 1,
-1.228908, -0.3909207, -2.656726, 0, 0, 0, 1, 1,
-1.226772, 0.1468662, -1.619662, 0, 0, 0, 1, 1,
-1.226508, 0.2408552, -3.057993, 0, 0, 0, 1, 1,
-1.216462, 1.522085, -1.373907, 0, 0, 0, 1, 1,
-1.21614, -0.5776729, -1.640577, 1, 1, 1, 1, 1,
-1.215849, 1.128591, 0.02760823, 1, 1, 1, 1, 1,
-1.215521, 2.444394, -1.739625, 1, 1, 1, 1, 1,
-1.214147, 0.6014375, -0.5827786, 1, 1, 1, 1, 1,
-1.211883, -1.264275, -1.822876, 1, 1, 1, 1, 1,
-1.206501, -0.8535956, -4.846334, 1, 1, 1, 1, 1,
-1.203156, 2.161448, -1.267699, 1, 1, 1, 1, 1,
-1.193909, 0.6329001, -0.5145097, 1, 1, 1, 1, 1,
-1.190504, 0.5130226, -0.7831016, 1, 1, 1, 1, 1,
-1.189324, 0.06979378, -0.9733495, 1, 1, 1, 1, 1,
-1.188941, 0.05419219, -1.176391, 1, 1, 1, 1, 1,
-1.186433, 1.620468, 0.9377551, 1, 1, 1, 1, 1,
-1.183256, -0.5379637, -1.577063, 1, 1, 1, 1, 1,
-1.167085, 0.7486485, -0.9175758, 1, 1, 1, 1, 1,
-1.165869, 0.9369612, -0.0429831, 1, 1, 1, 1, 1,
-1.164997, 0.4588647, 0.7596391, 0, 0, 1, 1, 1,
-1.158683, 0.9910117, 0.1619361, 1, 0, 0, 1, 1,
-1.144219, 0.4973658, -1.102657, 1, 0, 0, 1, 1,
-1.142895, 1.436551, 0.2021629, 1, 0, 0, 1, 1,
-1.14004, -1.781305, -3.004023, 1, 0, 0, 1, 1,
-1.13552, 0.5566019, -0.2765293, 1, 0, 0, 1, 1,
-1.132204, -0.03257536, -2.098118, 0, 0, 0, 1, 1,
-1.11173, -0.7803124, -1.656632, 0, 0, 0, 1, 1,
-1.111436, -2.444652, -3.32724, 0, 0, 0, 1, 1,
-1.107594, 0.8686035, -1.331098, 0, 0, 0, 1, 1,
-1.101776, -1.466058, -3.638948, 0, 0, 0, 1, 1,
-1.081334, 1.535615, -0.6758394, 0, 0, 0, 1, 1,
-1.080299, 0.001758528, -1.988393, 0, 0, 0, 1, 1,
-1.077421, -0.02813711, -1.373674, 1, 1, 1, 1, 1,
-1.07338, 0.06240398, -1.903035, 1, 1, 1, 1, 1,
-1.07139, -0.684023, -2.926513, 1, 1, 1, 1, 1,
-1.070874, 0.06871437, -2.699359, 1, 1, 1, 1, 1,
-1.069901, 0.4666264, -0.9261706, 1, 1, 1, 1, 1,
-1.067357, -1.084449, -3.213337, 1, 1, 1, 1, 1,
-1.066581, -0.2072721, -0.9489114, 1, 1, 1, 1, 1,
-1.063688, -0.4971532, -1.556449, 1, 1, 1, 1, 1,
-1.060117, -1.689928, -2.341724, 1, 1, 1, 1, 1,
-1.058572, -2.360291, -2.761572, 1, 1, 1, 1, 1,
-1.05414, -1.253981, -1.931021, 1, 1, 1, 1, 1,
-1.050706, 0.2912755, -2.826338, 1, 1, 1, 1, 1,
-1.04338, -0.6841416, -1.241498, 1, 1, 1, 1, 1,
-1.04019, -0.08642191, -1.363253, 1, 1, 1, 1, 1,
-1.026433, -0.06623749, -0.4794537, 1, 1, 1, 1, 1,
-1.023405, -0.64302, -1.341867, 0, 0, 1, 1, 1,
-1.023394, -0.48494, -0.9707615, 1, 0, 0, 1, 1,
-1.021116, -1.591005, -2.789536, 1, 0, 0, 1, 1,
-1.01869, 0.6500213, -2.646153, 1, 0, 0, 1, 1,
-1.014901, -0.5208654, -1.240064, 1, 0, 0, 1, 1,
-1.012079, -0.06896689, -0.6224359, 1, 0, 0, 1, 1,
-1.010192, 0.1549251, -1.781301, 0, 0, 0, 1, 1,
-1.007809, -1.283914, -2.684528, 0, 0, 0, 1, 1,
-1.006234, -0.07810761, -2.472966, 0, 0, 0, 1, 1,
-0.9964828, -0.9497075, -2.529403, 0, 0, 0, 1, 1,
-0.988281, -0.8980828, -3.297426, 0, 0, 0, 1, 1,
-0.9810793, -0.5096886, -2.664688, 0, 0, 0, 1, 1,
-0.9743676, -0.9852904, -2.097916, 0, 0, 0, 1, 1,
-0.970115, -2.202266, -0.9333195, 1, 1, 1, 1, 1,
-0.9622837, -0.6912669, -2.654151, 1, 1, 1, 1, 1,
-0.959104, 1.012127, -2.085284, 1, 1, 1, 1, 1,
-0.95667, 0.3136001, -0.7218221, 1, 1, 1, 1, 1,
-0.9559093, -0.380793, -1.47753, 1, 1, 1, 1, 1,
-0.9544414, -0.8632628, -3.717431, 1, 1, 1, 1, 1,
-0.9528596, 1.071276, -1.034652, 1, 1, 1, 1, 1,
-0.9477289, -0.008623159, -1.812479, 1, 1, 1, 1, 1,
-0.9450527, -0.719872, -2.132043, 1, 1, 1, 1, 1,
-0.9443721, 0.8493329, -2.970112, 1, 1, 1, 1, 1,
-0.9403958, -1.016157, -1.241923, 1, 1, 1, 1, 1,
-0.9327475, 0.1471792, -0.2120378, 1, 1, 1, 1, 1,
-0.921095, -0.4028055, -1.09135, 1, 1, 1, 1, 1,
-0.9190711, -1.053266, -1.117105, 1, 1, 1, 1, 1,
-0.918984, 1.179519, -1.971855, 1, 1, 1, 1, 1,
-0.9153126, 1.161809, -0.4354309, 0, 0, 1, 1, 1,
-0.9150881, -0.3598413, -3.344643, 1, 0, 0, 1, 1,
-0.9135286, 0.3957192, -0.7151383, 1, 0, 0, 1, 1,
-0.911858, -0.3363434, -1.233707, 1, 0, 0, 1, 1,
-0.9113638, 0.1222124, -0.9831545, 1, 0, 0, 1, 1,
-0.9098396, 0.5563408, -1.86087, 1, 0, 0, 1, 1,
-0.9073726, -2.405656, -2.367655, 0, 0, 0, 1, 1,
-0.8976631, -1.528313, -1.643548, 0, 0, 0, 1, 1,
-0.8971564, -0.591594, -1.004904, 0, 0, 0, 1, 1,
-0.8898707, -0.645348, -3.462894, 0, 0, 0, 1, 1,
-0.8807389, -0.2614517, -0.6320116, 0, 0, 0, 1, 1,
-0.876514, 0.4874973, -1.871278, 0, 0, 0, 1, 1,
-0.8732602, -0.7310882, -3.821981, 0, 0, 0, 1, 1,
-0.8721592, -0.5851754, -1.105046, 1, 1, 1, 1, 1,
-0.8721567, 0.6683838, -0.1551665, 1, 1, 1, 1, 1,
-0.8607526, -1.05118, -2.85499, 1, 1, 1, 1, 1,
-0.8586972, -1.518712, -4.607311, 1, 1, 1, 1, 1,
-0.8570977, 0.09478869, -2.927008, 1, 1, 1, 1, 1,
-0.8526665, -1.924507, -2.994215, 1, 1, 1, 1, 1,
-0.8465186, -0.266969, -2.750399, 1, 1, 1, 1, 1,
-0.8446798, -0.536039, -0.2498131, 1, 1, 1, 1, 1,
-0.8446704, 0.6014407, -0.8167257, 1, 1, 1, 1, 1,
-0.8446687, -1.619872, -2.251811, 1, 1, 1, 1, 1,
-0.8317021, -0.03807407, -0.723372, 1, 1, 1, 1, 1,
-0.8267344, -0.4917699, -2.902138, 1, 1, 1, 1, 1,
-0.8247386, -2.050851, -1.984622, 1, 1, 1, 1, 1,
-0.8238342, 0.2012268, -1.440259, 1, 1, 1, 1, 1,
-0.8204131, 0.991334, -1.660452, 1, 1, 1, 1, 1,
-0.8137857, -1.209499, -2.535364, 0, 0, 1, 1, 1,
-0.8087432, -2.015095, -3.150812, 1, 0, 0, 1, 1,
-0.8049826, -0.7796181, -1.473589, 1, 0, 0, 1, 1,
-0.8034041, 1.314253, 0.1618365, 1, 0, 0, 1, 1,
-0.8023921, -0.1231154, -1.544587, 1, 0, 0, 1, 1,
-0.7995084, -1.150304, -2.482786, 1, 0, 0, 1, 1,
-0.7963568, 0.1796699, -0.4637968, 0, 0, 0, 1, 1,
-0.7911004, 0.4220755, -0.5895619, 0, 0, 0, 1, 1,
-0.7879593, -0.4405862, -2.249783, 0, 0, 0, 1, 1,
-0.7629562, 0.5358198, -2.27859, 0, 0, 0, 1, 1,
-0.758543, -0.6186165, -1.95415, 0, 0, 0, 1, 1,
-0.7564346, -0.8793799, -1.685048, 0, 0, 0, 1, 1,
-0.7541244, -0.2608887, -1.798009, 0, 0, 0, 1, 1,
-0.7510228, 0.7962246, -0.4195785, 1, 1, 1, 1, 1,
-0.7467389, -1.0174, -1.477646, 1, 1, 1, 1, 1,
-0.7456887, -0.04732342, -2.196425, 1, 1, 1, 1, 1,
-0.7450632, -0.002372907, -2.222147, 1, 1, 1, 1, 1,
-0.7431964, 0.5271218, -1.508439, 1, 1, 1, 1, 1,
-0.7397112, 0.4031306, 0.2439439, 1, 1, 1, 1, 1,
-0.7379228, -0.1178256, -0.8017466, 1, 1, 1, 1, 1,
-0.7289398, -0.117513, -0.7850135, 1, 1, 1, 1, 1,
-0.7254938, -0.4967373, -2.49712, 1, 1, 1, 1, 1,
-0.7235477, 0.4751199, 1.064598, 1, 1, 1, 1, 1,
-0.7232643, -1.364368, -3.615849, 1, 1, 1, 1, 1,
-0.7226978, -1.88952, -4.093285, 1, 1, 1, 1, 1,
-0.7224026, 0.6088397, 0.4458855, 1, 1, 1, 1, 1,
-0.7178568, 0.2441042, -1.618501, 1, 1, 1, 1, 1,
-0.7169831, -0.07240391, -2.264914, 1, 1, 1, 1, 1,
-0.7155926, -0.3956599, -2.68355, 0, 0, 1, 1, 1,
-0.7116909, 0.0955606, -3.510879, 1, 0, 0, 1, 1,
-0.710897, -0.567268, -2.271673, 1, 0, 0, 1, 1,
-0.7103517, -0.613803, -1.940956, 1, 0, 0, 1, 1,
-0.7078438, 0.5426974, -1.680318, 1, 0, 0, 1, 1,
-0.7065115, 0.1510495, -1.629948, 1, 0, 0, 1, 1,
-0.7044908, -0.7033499, -3.427207, 0, 0, 0, 1, 1,
-0.7031484, 0.7535437, -2.538428, 0, 0, 0, 1, 1,
-0.6949661, -1.262128, -4.852281, 0, 0, 0, 1, 1,
-0.6901066, -0.9992809, -4.212454, 0, 0, 0, 1, 1,
-0.6870866, -0.7703843, -2.078326, 0, 0, 0, 1, 1,
-0.6815391, 1.640043, 0.02059433, 0, 0, 0, 1, 1,
-0.6749082, 1.211261, 0.6001335, 0, 0, 0, 1, 1,
-0.671804, 1.166186, -1.258147, 1, 1, 1, 1, 1,
-0.6700821, 1.021806, -1.759594, 1, 1, 1, 1, 1,
-0.6651638, -0.6983296, -0.8971208, 1, 1, 1, 1, 1,
-0.661953, -0.3346574, -3.773008, 1, 1, 1, 1, 1,
-0.6573831, 0.3486208, -1.243427, 1, 1, 1, 1, 1,
-0.6561872, 1.63063, 0.4691586, 1, 1, 1, 1, 1,
-0.655391, 1.040057, -2.003979, 1, 1, 1, 1, 1,
-0.6551835, 0.2730649, -1.177259, 1, 1, 1, 1, 1,
-0.65445, -0.8392484, -0.9567504, 1, 1, 1, 1, 1,
-0.6525634, 0.2401067, -2.186435, 1, 1, 1, 1, 1,
-0.6499047, -1.244778, -2.309188, 1, 1, 1, 1, 1,
-0.648968, -0.2741997, -1.368605, 1, 1, 1, 1, 1,
-0.6487842, -0.5691725, -2.142102, 1, 1, 1, 1, 1,
-0.6464736, 1.437091, -1.437582, 1, 1, 1, 1, 1,
-0.6454241, 0.9533544, 0.3552386, 1, 1, 1, 1, 1,
-0.6407083, 0.3284906, -0.896585, 0, 0, 1, 1, 1,
-0.6395405, -1.127762, -2.448267, 1, 0, 0, 1, 1,
-0.6370077, 0.6970358, -0.697813, 1, 0, 0, 1, 1,
-0.6347499, 1.351517, -0.01231431, 1, 0, 0, 1, 1,
-0.6334598, 0.2391684, -1.431008, 1, 0, 0, 1, 1,
-0.6312296, 0.7913208, -0.1663976, 1, 0, 0, 1, 1,
-0.630691, 2.150766, -0.1406985, 0, 0, 0, 1, 1,
-0.6186917, -0.7167747, -1.303689, 0, 0, 0, 1, 1,
-0.6181927, 0.5044699, -1.896754, 0, 0, 0, 1, 1,
-0.6058549, 0.5361533, 0.5435298, 0, 0, 0, 1, 1,
-0.6045315, 1.653313, 0.343423, 0, 0, 0, 1, 1,
-0.6010777, 0.3518341, -1.145535, 0, 0, 0, 1, 1,
-0.5998378, 1.092406, -1.531857, 0, 0, 0, 1, 1,
-0.5995566, 0.2213383, 0.02786447, 1, 1, 1, 1, 1,
-0.598535, 0.556608, 0.3372168, 1, 1, 1, 1, 1,
-0.5973754, 0.08157709, -2.274844, 1, 1, 1, 1, 1,
-0.5931359, -1.253524, -2.567775, 1, 1, 1, 1, 1,
-0.5860376, 0.4404355, -1.890525, 1, 1, 1, 1, 1,
-0.5842334, -1.151435, -4.169624, 1, 1, 1, 1, 1,
-0.5820574, -0.2196632, -2.140447, 1, 1, 1, 1, 1,
-0.5818508, -0.001568122, -2.165547, 1, 1, 1, 1, 1,
-0.5815669, -0.07170368, -2.061771, 1, 1, 1, 1, 1,
-0.5748978, -0.9831412, -2.915753, 1, 1, 1, 1, 1,
-0.5709405, -0.5498682, -2.915478, 1, 1, 1, 1, 1,
-0.5696902, 0.9268558, -0.7010692, 1, 1, 1, 1, 1,
-0.5684983, 1.527818, 0.1664645, 1, 1, 1, 1, 1,
-0.567681, 1.703754, -0.4775707, 1, 1, 1, 1, 1,
-0.5626914, -2.047638, -4.467683, 1, 1, 1, 1, 1,
-0.5619634, 0.3675615, 0.7312295, 0, 0, 1, 1, 1,
-0.5602762, -0.8981035, -1.84448, 1, 0, 0, 1, 1,
-0.5553198, -0.1011636, -4.835959, 1, 0, 0, 1, 1,
-0.5520344, -1.809044, -0.6273555, 1, 0, 0, 1, 1,
-0.5465983, -0.7919319, -3.004996, 1, 0, 0, 1, 1,
-0.5424906, -0.6837689, -3.349586, 1, 0, 0, 1, 1,
-0.5359136, -1.108892, -1.391, 0, 0, 0, 1, 1,
-0.5350411, 0.6467033, -0.5778019, 0, 0, 0, 1, 1,
-0.5300331, 0.3403707, -0.959964, 0, 0, 0, 1, 1,
-0.5240343, -1.903011, -2.653716, 0, 0, 0, 1, 1,
-0.5209859, -1.650539, -2.788606, 0, 0, 0, 1, 1,
-0.5206372, 0.1029853, -1.916465, 0, 0, 0, 1, 1,
-0.5168362, -2.539637, -2.675835, 0, 0, 0, 1, 1,
-0.5109112, -0.7451641, -2.528319, 1, 1, 1, 1, 1,
-0.4987803, 0.06558353, -1.185659, 1, 1, 1, 1, 1,
-0.4932184, -2.127774, -0.2174912, 1, 1, 1, 1, 1,
-0.4930681, -1.468544, -1.79286, 1, 1, 1, 1, 1,
-0.489227, 0.9955622, -1.298585, 1, 1, 1, 1, 1,
-0.4882392, 0.1034862, -2.335012, 1, 1, 1, 1, 1,
-0.4871688, 0.06820284, -3.243399, 1, 1, 1, 1, 1,
-0.4861625, -0.04000744, -0.481512, 1, 1, 1, 1, 1,
-0.4813395, -1.595054, -2.307331, 1, 1, 1, 1, 1,
-0.4811215, -0.9403477, -3.949349, 1, 1, 1, 1, 1,
-0.4809588, -0.8703607, -2.3028, 1, 1, 1, 1, 1,
-0.4780632, -0.8343311, -2.298352, 1, 1, 1, 1, 1,
-0.4759447, -1.3918, -2.341322, 1, 1, 1, 1, 1,
-0.4744608, -0.6887026, -2.3598, 1, 1, 1, 1, 1,
-0.4737847, -0.5598384, -1.290214, 1, 1, 1, 1, 1,
-0.4718271, -0.7052705, -1.345788, 0, 0, 1, 1, 1,
-0.4698689, -1.096478, -2.311759, 1, 0, 0, 1, 1,
-0.4689797, 0.7511689, -2.702996, 1, 0, 0, 1, 1,
-0.4687513, 1.310519, -1.76918, 1, 0, 0, 1, 1,
-0.4639814, -1.061427, -3.525708, 1, 0, 0, 1, 1,
-0.4581407, 0.9038004, -1.7796, 1, 0, 0, 1, 1,
-0.4558854, -1.541964, -2.905971, 0, 0, 0, 1, 1,
-0.4506471, -0.6678374, -2.380852, 0, 0, 0, 1, 1,
-0.4479442, -1.578193, -2.623478, 0, 0, 0, 1, 1,
-0.4474399, -1.631496, -2.54433, 0, 0, 0, 1, 1,
-0.446647, 1.383323, -0.9738892, 0, 0, 0, 1, 1,
-0.443578, -0.6840699, -5.014097, 0, 0, 0, 1, 1,
-0.4372663, 1.116307, 0.121782, 0, 0, 0, 1, 1,
-0.4341883, 0.4628684, -0.7514037, 1, 1, 1, 1, 1,
-0.4283609, 0.2159758, -0.3722316, 1, 1, 1, 1, 1,
-0.4280501, 1.036253, -0.002969154, 1, 1, 1, 1, 1,
-0.4209348, -0.1731112, -2.094771, 1, 1, 1, 1, 1,
-0.4177088, 0.7352268, 0.5834858, 1, 1, 1, 1, 1,
-0.4153576, 1.444542, 0.4717959, 1, 1, 1, 1, 1,
-0.413026, 0.7194615, -0.8035302, 1, 1, 1, 1, 1,
-0.4117205, 0.4583996, 0.1634213, 1, 1, 1, 1, 1,
-0.4070258, -0.4813659, -2.248935, 1, 1, 1, 1, 1,
-0.4009238, -0.9330159, -2.321148, 1, 1, 1, 1, 1,
-0.3989191, 1.043377, -1.111124, 1, 1, 1, 1, 1,
-0.3928781, 0.3971567, -0.8461291, 1, 1, 1, 1, 1,
-0.3911287, 0.5895736, -0.9155457, 1, 1, 1, 1, 1,
-0.3802191, -1.12019, -2.738242, 1, 1, 1, 1, 1,
-0.3781419, -0.6399307, -2.535384, 1, 1, 1, 1, 1,
-0.3776623, -0.6133525, -1.393175, 0, 0, 1, 1, 1,
-0.3658098, 0.260774, -0.01841044, 1, 0, 0, 1, 1,
-0.3653939, 1.901531, 0.1763401, 1, 0, 0, 1, 1,
-0.3621113, -1.443519, -2.801603, 1, 0, 0, 1, 1,
-0.3612391, -0.9661798, -4.03901, 1, 0, 0, 1, 1,
-0.3599419, -1.412881, -4.10283, 1, 0, 0, 1, 1,
-0.3583296, -0.6988958, -1.759141, 0, 0, 0, 1, 1,
-0.3571567, 0.2310751, -1.623318, 0, 0, 0, 1, 1,
-0.3563887, 0.7984138, 1.892353, 0, 0, 0, 1, 1,
-0.3539045, -2.139719, -4.318718, 0, 0, 0, 1, 1,
-0.353838, 1.213809, 1.545599, 0, 0, 0, 1, 1,
-0.3538109, -0.4527652, -0.4086609, 0, 0, 0, 1, 1,
-0.3465055, 0.1480775, -0.8323774, 0, 0, 0, 1, 1,
-0.3444444, 0.7140628, -2.194066, 1, 1, 1, 1, 1,
-0.3436835, 0.1073696, -2.006267, 1, 1, 1, 1, 1,
-0.3420676, 0.09972285, -0.518345, 1, 1, 1, 1, 1,
-0.3412167, 0.4588737, -1.208446, 1, 1, 1, 1, 1,
-0.3320944, 0.574765, 1.26751, 1, 1, 1, 1, 1,
-0.3320609, 0.2841547, -0.3472977, 1, 1, 1, 1, 1,
-0.3304053, -1.697627, -3.518845, 1, 1, 1, 1, 1,
-0.3282731, -1.024768, -4.897511, 1, 1, 1, 1, 1,
-0.32745, 0.1582588, -0.1561138, 1, 1, 1, 1, 1,
-0.3267379, 1.91517, 0.4750297, 1, 1, 1, 1, 1,
-0.3263791, 0.903641, -0.1857333, 1, 1, 1, 1, 1,
-0.3246476, 0.153764, -0.9134462, 1, 1, 1, 1, 1,
-0.322343, -0.1866764, -3.639696, 1, 1, 1, 1, 1,
-0.3192716, -0.3763797, -4.785224, 1, 1, 1, 1, 1,
-0.3139193, -0.4354953, -3.235008, 1, 1, 1, 1, 1,
-0.3133782, -0.7169794, -2.568816, 0, 0, 1, 1, 1,
-0.3123356, 0.9006429, -1.011642, 1, 0, 0, 1, 1,
-0.3104292, 1.531899, 2.087687, 1, 0, 0, 1, 1,
-0.3103634, 0.5512817, -1.279817, 1, 0, 0, 1, 1,
-0.3087783, 0.08240037, -1.004699, 1, 0, 0, 1, 1,
-0.3066053, -1.271396, -3.715519, 1, 0, 0, 1, 1,
-0.2999546, 0.2533605, -0.9663401, 0, 0, 0, 1, 1,
-0.2927175, -0.1494425, -2.111212, 0, 0, 0, 1, 1,
-0.2899584, -1.047722, -1.658818, 0, 0, 0, 1, 1,
-0.2880372, 0.9053004, -0.01262924, 0, 0, 0, 1, 1,
-0.2874175, 0.6498007, -1.066482, 0, 0, 0, 1, 1,
-0.2864199, 1.230894, 0.892148, 0, 0, 0, 1, 1,
-0.2857863, 0.7952539, 0.6036661, 0, 0, 0, 1, 1,
-0.283957, -1.370997, -2.878658, 1, 1, 1, 1, 1,
-0.2818901, -0.7864202, -3.415996, 1, 1, 1, 1, 1,
-0.2784825, 1.443058, 0.4912197, 1, 1, 1, 1, 1,
-0.2755077, 0.574358, -0.7526242, 1, 1, 1, 1, 1,
-0.2736495, 1.576656, -1.137204, 1, 1, 1, 1, 1,
-0.2734161, -0.4742403, -3.073894, 1, 1, 1, 1, 1,
-0.2679803, 0.9636874, -1.145596, 1, 1, 1, 1, 1,
-0.2674545, 0.2681793, -1.876361, 1, 1, 1, 1, 1,
-0.2669907, -0.7888889, -4.428436, 1, 1, 1, 1, 1,
-0.2663423, -0.4708817, -3.064576, 1, 1, 1, 1, 1,
-0.2631541, 0.0578852, -2.512969, 1, 1, 1, 1, 1,
-0.2595431, -0.3337209, -2.318967, 1, 1, 1, 1, 1,
-0.2560666, 0.9286932, 1.011053, 1, 1, 1, 1, 1,
-0.255447, 1.734141, -1.172079, 1, 1, 1, 1, 1,
-0.252769, 0.09737174, -3.083866, 1, 1, 1, 1, 1,
-0.2517247, 0.07745275, -0.6181537, 0, 0, 1, 1, 1,
-0.2513504, -2.048146, -2.666718, 1, 0, 0, 1, 1,
-0.2487703, 0.1449132, 0.04917754, 1, 0, 0, 1, 1,
-0.2473511, -0.5267764, -1.361677, 1, 0, 0, 1, 1,
-0.2471463, -2.424607, -3.655653, 1, 0, 0, 1, 1,
-0.2456525, -0.04099385, -1.418476, 1, 0, 0, 1, 1,
-0.2453528, -0.4733853, -2.775041, 0, 0, 0, 1, 1,
-0.243679, 1.060892, -0.6753529, 0, 0, 0, 1, 1,
-0.2393097, -0.1319644, -3.136613, 0, 0, 0, 1, 1,
-0.2355667, -1.655811, -2.089373, 0, 0, 0, 1, 1,
-0.2312219, -0.1317393, -1.91825, 0, 0, 0, 1, 1,
-0.228189, 0.06873205, 0.293394, 0, 0, 0, 1, 1,
-0.2255563, -1.227854, -1.229952, 0, 0, 0, 1, 1,
-0.2138949, 0.1251184, -1.6283, 1, 1, 1, 1, 1,
-0.2129345, 0.1050832, -1.203138, 1, 1, 1, 1, 1,
-0.2098487, 0.5354814, -1.20557, 1, 1, 1, 1, 1,
-0.2095, 1.702145, 0.4267865, 1, 1, 1, 1, 1,
-0.20596, -0.009253901, -1.718599, 1, 1, 1, 1, 1,
-0.2004534, -0.7043985, -2.06282, 1, 1, 1, 1, 1,
-0.198119, 2.190566, 0.1886416, 1, 1, 1, 1, 1,
-0.1960437, -0.5999605, -1.481386, 1, 1, 1, 1, 1,
-0.1958452, -0.801037, -1.894002, 1, 1, 1, 1, 1,
-0.1917454, 0.6575601, -0.5731624, 1, 1, 1, 1, 1,
-0.1907938, 0.08006092, 0.13974, 1, 1, 1, 1, 1,
-0.1890538, 0.1764028, -0.7269353, 1, 1, 1, 1, 1,
-0.1888755, 0.3563129, 0.272697, 1, 1, 1, 1, 1,
-0.1881813, 0.8942643, 0.752137, 1, 1, 1, 1, 1,
-0.1872741, 1.967518, 1.395551, 1, 1, 1, 1, 1,
-0.1866177, 0.042654, 0.4545757, 0, 0, 1, 1, 1,
-0.1854581, -1.094115, -2.202239, 1, 0, 0, 1, 1,
-0.1809515, -0.2713734, -3.83307, 1, 0, 0, 1, 1,
-0.1743452, -1.878734, -3.402803, 1, 0, 0, 1, 1,
-0.1740074, -0.04266661, -1.75328, 1, 0, 0, 1, 1,
-0.1699846, 2.659041, -0.6453727, 1, 0, 0, 1, 1,
-0.1625226, -0.681116, -2.666816, 0, 0, 0, 1, 1,
-0.1609439, -0.9132603, -3.863084, 0, 0, 0, 1, 1,
-0.1582658, -1.041271, -0.9196714, 0, 0, 0, 1, 1,
-0.1559834, 0.8905417, -0.04282999, 0, 0, 0, 1, 1,
-0.1536936, 0.3550966, -0.1532867, 0, 0, 0, 1, 1,
-0.1511839, 0.05003775, -2.407686, 0, 0, 0, 1, 1,
-0.1508985, -0.05111045, -2.356276, 0, 0, 0, 1, 1,
-0.1502378, -1.05797, -4.200393, 1, 1, 1, 1, 1,
-0.1401993, -1.33752, -4.570202, 1, 1, 1, 1, 1,
-0.1361209, -0.415118, -3.553229, 1, 1, 1, 1, 1,
-0.1358095, -0.4067582, -2.484617, 1, 1, 1, 1, 1,
-0.1354015, -0.04455917, -3.650202, 1, 1, 1, 1, 1,
-0.1276796, 1.029026, -0.7334307, 1, 1, 1, 1, 1,
-0.1272999, 0.5815452, -0.1670075, 1, 1, 1, 1, 1,
-0.1250806, -0.4579505, -1.803723, 1, 1, 1, 1, 1,
-0.1248732, 0.1384088, 1.847215, 1, 1, 1, 1, 1,
-0.1238925, 0.9153386, 0.02946672, 1, 1, 1, 1, 1,
-0.1227337, -0.08750305, -0.2211466, 1, 1, 1, 1, 1,
-0.1219772, -0.4909641, -5.567687, 1, 1, 1, 1, 1,
-0.1180109, 0.3159024, 0.1320831, 1, 1, 1, 1, 1,
-0.1174676, -1.759621, -2.824549, 1, 1, 1, 1, 1,
-0.1168418, 0.9807379, -0.8554411, 1, 1, 1, 1, 1,
-0.1167836, 0.09899868, -0.7711379, 0, 0, 1, 1, 1,
-0.1113764, -0.1306331, -4.210523, 1, 0, 0, 1, 1,
-0.1107174, 1.150553, 0.3074152, 1, 0, 0, 1, 1,
-0.1053165, -1.542315, -3.627744, 1, 0, 0, 1, 1,
-0.1022378, -0.02666101, -1.752247, 1, 0, 0, 1, 1,
-0.1020426, -0.08944657, -2.086205, 1, 0, 0, 1, 1,
-0.0997123, 0.109765, 0.5807414, 0, 0, 0, 1, 1,
-0.09950062, -0.5894441, -2.03163, 0, 0, 0, 1, 1,
-0.09732471, -0.7156304, -2.921574, 0, 0, 0, 1, 1,
-0.09663698, -1.598497, -2.388647, 0, 0, 0, 1, 1,
-0.09607745, 0.3432415, 0.2613286, 0, 0, 0, 1, 1,
-0.09546486, -1.06076, -2.601849, 0, 0, 0, 1, 1,
-0.09139124, -1.700299, -1.481733, 0, 0, 0, 1, 1,
-0.08793736, 0.4501754, 0.4300087, 1, 1, 1, 1, 1,
-0.08741438, 0.4180909, 0.9119828, 1, 1, 1, 1, 1,
-0.08490323, 1.506637, -0.7828683, 1, 1, 1, 1, 1,
-0.08338965, -2.165575, -3.467606, 1, 1, 1, 1, 1,
-0.08322133, 0.5319495, 1.816047, 1, 1, 1, 1, 1,
-0.07928091, 0.2969574, 0.08583457, 1, 1, 1, 1, 1,
-0.07866912, 2.210418, -0.1538424, 1, 1, 1, 1, 1,
-0.07763883, 1.365022, -1.053473, 1, 1, 1, 1, 1,
-0.07684839, -0.2348347, -3.053371, 1, 1, 1, 1, 1,
-0.07488653, -1.658675, -2.174478, 1, 1, 1, 1, 1,
-0.07321835, -0.05446048, -4.082543, 1, 1, 1, 1, 1,
-0.07217165, -0.3554018, -2.116678, 1, 1, 1, 1, 1,
-0.07045951, -0.3115082, -2.70748, 1, 1, 1, 1, 1,
-0.06989368, 0.3880441, 0.06799331, 1, 1, 1, 1, 1,
-0.06585627, -1.229271, -3.467384, 1, 1, 1, 1, 1,
-0.06261916, -2.177585, -3.39186, 0, 0, 1, 1, 1,
-0.06095629, 2.432282, -0.8499925, 1, 0, 0, 1, 1,
-0.06001044, 0.2317132, -1.129471, 1, 0, 0, 1, 1,
-0.05336715, 1.120659, 0.1627044, 1, 0, 0, 1, 1,
-0.05326992, 0.3664609, -0.1226303, 1, 0, 0, 1, 1,
-0.0513977, 0.4086286, -0.8990764, 1, 0, 0, 1, 1,
-0.04897719, -0.3986802, -2.420229, 0, 0, 0, 1, 1,
-0.04665802, 0.6024974, 0.2273906, 0, 0, 0, 1, 1,
-0.04371441, -1.043008, -3.792964, 0, 0, 0, 1, 1,
-0.04330914, -0.04232826, -3.754917, 0, 0, 0, 1, 1,
-0.03918815, 0.3858623, 2.957851, 0, 0, 0, 1, 1,
-0.03800439, 0.348907, 0.642194, 0, 0, 0, 1, 1,
-0.03574712, -0.6408586, -4.764102, 0, 0, 0, 1, 1,
-0.03560425, -0.6340764, -1.184781, 1, 1, 1, 1, 1,
-0.03407476, 1.188547, 1.347152, 1, 1, 1, 1, 1,
-0.03323542, 0.1246781, -0.9979645, 1, 1, 1, 1, 1,
-0.03252637, 0.01272539, -1.86413, 1, 1, 1, 1, 1,
-0.03245918, -0.3974602, -1.742934, 1, 1, 1, 1, 1,
-0.03079928, 0.6377005, 0.8129575, 1, 1, 1, 1, 1,
-0.0261808, 0.982299, 0.1327575, 1, 1, 1, 1, 1,
-0.02479967, -0.4346976, -3.698061, 1, 1, 1, 1, 1,
-0.02297923, 0.634126, 2.4287, 1, 1, 1, 1, 1,
-0.01794129, 1.085081, 0.2799899, 1, 1, 1, 1, 1,
-0.01428049, -0.227156, -1.615396, 1, 1, 1, 1, 1,
-0.01218287, 0.1812638, -1.777596, 1, 1, 1, 1, 1,
-0.01169726, -0.265059, -2.683158, 1, 1, 1, 1, 1,
-0.01034534, 0.9621262, 1.074581, 1, 1, 1, 1, 1,
-0.00839114, -1.222842, -3.919441, 1, 1, 1, 1, 1,
-0.008176432, 0.9567007, -0.79516, 0, 0, 1, 1, 1,
-0.005672315, -0.4923446, -4.241134, 1, 0, 0, 1, 1,
-0.004792781, -1.446461, -2.829581, 1, 0, 0, 1, 1,
-0.004511006, 1.017837, -0.9381419, 1, 0, 0, 1, 1,
-0.002224355, -0.6777802, -3.792451, 1, 0, 0, 1, 1,
0.002261414, 2.100862, -0.2992716, 1, 0, 0, 1, 1,
0.0028735, -0.3925453, 3.19994, 0, 0, 0, 1, 1,
0.011711, -1.060935, 4.900865, 0, 0, 0, 1, 1,
0.01172973, -0.02700551, 1.161497, 0, 0, 0, 1, 1,
0.01945157, -0.8733999, 2.108216, 0, 0, 0, 1, 1,
0.02447791, -1.971866, 2.541074, 0, 0, 0, 1, 1,
0.02841739, 0.4403602, -0.196601, 0, 0, 0, 1, 1,
0.02881149, 1.753609, 0.204506, 0, 0, 0, 1, 1,
0.02970213, 1.397337, -0.8629785, 1, 1, 1, 1, 1,
0.0300665, -2.109213, 3.929895, 1, 1, 1, 1, 1,
0.03155177, -1.409461, 3.091164, 1, 1, 1, 1, 1,
0.031865, 0.3897312, -0.613176, 1, 1, 1, 1, 1,
0.03475295, -0.3488498, 3.611148, 1, 1, 1, 1, 1,
0.03607245, -1.096481, 4.627347, 1, 1, 1, 1, 1,
0.04000487, 0.8317004, -0.6892912, 1, 1, 1, 1, 1,
0.04031185, -0.787288, 2.64956, 1, 1, 1, 1, 1,
0.05474729, 1.299463, 0.7406845, 1, 1, 1, 1, 1,
0.05862817, -0.6477934, 3.178776, 1, 1, 1, 1, 1,
0.05943883, 1.898493, 0.341337, 1, 1, 1, 1, 1,
0.06656682, -1.166845, 2.882318, 1, 1, 1, 1, 1,
0.06978084, -0.05815516, 4.406826, 1, 1, 1, 1, 1,
0.0700198, -1.000676, 5.014157, 1, 1, 1, 1, 1,
0.0705105, 0.4353945, -0.1870875, 1, 1, 1, 1, 1,
0.07165022, 0.4668936, -0.0210352, 0, 0, 1, 1, 1,
0.07198304, -1.757676, 3.211749, 1, 0, 0, 1, 1,
0.07603106, 0.1314168, -0.3362556, 1, 0, 0, 1, 1,
0.08410805, 0.1197743, 0.7310221, 1, 0, 0, 1, 1,
0.08487019, -1.990483, 1.908359, 1, 0, 0, 1, 1,
0.08747976, -0.7829084, 3.886173, 1, 0, 0, 1, 1,
0.1018375, -0.6625232, 2.893286, 0, 0, 0, 1, 1,
0.1058886, -2.631332, 3.316981, 0, 0, 0, 1, 1,
0.106021, 0.5319912, 2.090572, 0, 0, 0, 1, 1,
0.1067306, -0.06391162, 2.728534, 0, 0, 0, 1, 1,
0.1114299, 0.873912, -0.4928499, 0, 0, 0, 1, 1,
0.112383, 0.8413197, 0.2206451, 0, 0, 0, 1, 1,
0.1124071, -1.319514, 2.666744, 0, 0, 0, 1, 1,
0.1133863, -1.625936, 3.364417, 1, 1, 1, 1, 1,
0.1140766, 0.5959963, -0.0194426, 1, 1, 1, 1, 1,
0.1166791, -0.3255541, 0.9069435, 1, 1, 1, 1, 1,
0.1197942, 0.0826005, 0.9633957, 1, 1, 1, 1, 1,
0.1221701, 0.05891579, 1.193676, 1, 1, 1, 1, 1,
0.12253, -0.2547385, 1.782261, 1, 1, 1, 1, 1,
0.123293, -0.6590242, 3.25162, 1, 1, 1, 1, 1,
0.1234986, 0.7456408, -0.07016166, 1, 1, 1, 1, 1,
0.1249396, -0.8677329, 3.211418, 1, 1, 1, 1, 1,
0.129429, 0.1578039, -0.04388166, 1, 1, 1, 1, 1,
0.1304508, -1.382303, 3.939668, 1, 1, 1, 1, 1,
0.1313626, 0.0862544, 2.329428, 1, 1, 1, 1, 1,
0.1330184, 0.4070081, 0.9391598, 1, 1, 1, 1, 1,
0.1378404, -1.392945, 4.162499, 1, 1, 1, 1, 1,
0.1440344, -1.085946, 2.213946, 1, 1, 1, 1, 1,
0.1480478, -0.2030236, 2.160166, 0, 0, 1, 1, 1,
0.1526274, 0.2475609, -0.5767559, 1, 0, 0, 1, 1,
0.1531121, -0.5516081, 3.519258, 1, 0, 0, 1, 1,
0.1538808, -0.2256597, 1.96837, 1, 0, 0, 1, 1,
0.1550665, -0.04946214, 2.021831, 1, 0, 0, 1, 1,
0.1618576, -0.3858252, 2.665639, 1, 0, 0, 1, 1,
0.163457, 1.034257, 0.1595883, 0, 0, 0, 1, 1,
0.1654897, -0.2307197, 3.493734, 0, 0, 0, 1, 1,
0.1656261, -1.317908, 4.191029, 0, 0, 0, 1, 1,
0.1687669, -0.208692, 3.652415, 0, 0, 0, 1, 1,
0.1726003, -1.00258, 4.066376, 0, 0, 0, 1, 1,
0.1794531, 0.9272969, 0.2180358, 0, 0, 0, 1, 1,
0.1820044, -0.8660141, 2.379476, 0, 0, 0, 1, 1,
0.1847816, 0.3564349, 0.2935607, 1, 1, 1, 1, 1,
0.1851424, -1.109676, 2.527563, 1, 1, 1, 1, 1,
0.1887507, -0.3596338, 1.53368, 1, 1, 1, 1, 1,
0.1939799, 0.5667564, 1.540356, 1, 1, 1, 1, 1,
0.1941014, -1.719003, 4.324035, 1, 1, 1, 1, 1,
0.1960449, -1.809449, 2.769707, 1, 1, 1, 1, 1,
0.1968049, 0.2930683, -0.4592286, 1, 1, 1, 1, 1,
0.1975061, -1.204724, 3.374794, 1, 1, 1, 1, 1,
0.1996475, -2.847594, 3.310405, 1, 1, 1, 1, 1,
0.2016689, -0.5425668, 2.660107, 1, 1, 1, 1, 1,
0.204976, -1.199031, 4.143567, 1, 1, 1, 1, 1,
0.2077892, 0.153596, 0.06511611, 1, 1, 1, 1, 1,
0.2100962, 2.914534, 1.991586, 1, 1, 1, 1, 1,
0.2104899, -0.3439342, 2.333476, 1, 1, 1, 1, 1,
0.2145519, 1.511708, 0.3542969, 1, 1, 1, 1, 1,
0.2166222, 1.802685, -0.2818502, 0, 0, 1, 1, 1,
0.2171035, -1.526745, 3.355598, 1, 0, 0, 1, 1,
0.2190127, -0.4674535, 3.383365, 1, 0, 0, 1, 1,
0.2192124, 0.7678434, 0.7236642, 1, 0, 0, 1, 1,
0.2204671, 1.36199, -0.5250172, 1, 0, 0, 1, 1,
0.2229006, 0.1048853, 0.6189612, 1, 0, 0, 1, 1,
0.2276656, 1.640386, 0.4668078, 0, 0, 0, 1, 1,
0.228458, 0.4044894, 1.382259, 0, 0, 0, 1, 1,
0.2292953, 0.2028338, 1.864746, 0, 0, 0, 1, 1,
0.2329642, 0.3910006, 0.6382031, 0, 0, 0, 1, 1,
0.2331036, -0.577747, 3.871558, 0, 0, 0, 1, 1,
0.235313, -0.1734288, 2.03796, 0, 0, 0, 1, 1,
0.2363566, 0.7962904, 1.678894, 0, 0, 0, 1, 1,
0.2383412, 0.7566956, -0.4510116, 1, 1, 1, 1, 1,
0.2394432, -1.293562, 2.103249, 1, 1, 1, 1, 1,
0.2400842, -1.693704, 2.423806, 1, 1, 1, 1, 1,
0.2410896, -0.142051, 4.161772, 1, 1, 1, 1, 1,
0.2419683, -0.2045049, 1.692169, 1, 1, 1, 1, 1,
0.2423483, -0.2201391, 1.626415, 1, 1, 1, 1, 1,
0.2426143, 1.00959, 0.2677213, 1, 1, 1, 1, 1,
0.2460476, 0.003925405, 0.5189761, 1, 1, 1, 1, 1,
0.2530985, 0.7255067, 1.903063, 1, 1, 1, 1, 1,
0.253112, -1.134064, 1.186936, 1, 1, 1, 1, 1,
0.2545484, -0.5546857, 3.310802, 1, 1, 1, 1, 1,
0.2573588, 2.146335, -0.8612639, 1, 1, 1, 1, 1,
0.2575547, -0.2447596, 2.561851, 1, 1, 1, 1, 1,
0.263868, 1.49345, 0.6230367, 1, 1, 1, 1, 1,
0.2651807, -1.206753, 3.02962, 1, 1, 1, 1, 1,
0.2667878, -0.1859758, 2.061985, 0, 0, 1, 1, 1,
0.2673308, -1.726293, 3.127643, 1, 0, 0, 1, 1,
0.2736045, -0.06420127, 1.364532, 1, 0, 0, 1, 1,
0.2741348, -0.470529, 3.071977, 1, 0, 0, 1, 1,
0.2817803, -0.8121057, 3.852648, 1, 0, 0, 1, 1,
0.2827495, -1.436744, 1.987211, 1, 0, 0, 1, 1,
0.2853152, 0.3132482, 0.3087409, 0, 0, 0, 1, 1,
0.2853209, -0.07426113, 3.09353, 0, 0, 0, 1, 1,
0.2897156, 0.7869461, -1.49079, 0, 0, 0, 1, 1,
0.2914323, 0.5273734, -0.2477931, 0, 0, 0, 1, 1,
0.2918877, -0.4151908, 3.022832, 0, 0, 0, 1, 1,
0.2923512, 0.456024, 0.4225559, 0, 0, 0, 1, 1,
0.2934803, -0.9800097, 4.068448, 0, 0, 0, 1, 1,
0.2976504, -0.9097871, 3.102356, 1, 1, 1, 1, 1,
0.2983861, 2.478626, -0.5836112, 1, 1, 1, 1, 1,
0.2996475, 1.564778, -0.05559215, 1, 1, 1, 1, 1,
0.3043907, 1.16808, 1.036384, 1, 1, 1, 1, 1,
0.3081275, -1.804167, 1.154443, 1, 1, 1, 1, 1,
0.3105997, -1.924997, 1.930317, 1, 1, 1, 1, 1,
0.3146818, 1.991389, -0.1372973, 1, 1, 1, 1, 1,
0.3213826, -0.2083077, 2.164818, 1, 1, 1, 1, 1,
0.3221333, 0.1181287, 1.460607, 1, 1, 1, 1, 1,
0.3222559, -2.115583, 4.69872, 1, 1, 1, 1, 1,
0.3253531, 0.3129719, 0.6554207, 1, 1, 1, 1, 1,
0.3277933, 1.072892, -0.6900629, 1, 1, 1, 1, 1,
0.3286534, -1.132055, 2.272711, 1, 1, 1, 1, 1,
0.3299439, -0.3250657, 1.893659, 1, 1, 1, 1, 1,
0.3336867, -0.2192972, 1.945077, 1, 1, 1, 1, 1,
0.3339837, 2.855925, -0.2444664, 0, 0, 1, 1, 1,
0.3340816, -0.3138763, 2.687654, 1, 0, 0, 1, 1,
0.3400099, 0.1447057, 1.441461, 1, 0, 0, 1, 1,
0.3416118, -0.3009718, 1.13254, 1, 0, 0, 1, 1,
0.3441084, -0.3780923, 1.123672, 1, 0, 0, 1, 1,
0.3454644, 0.3033692, -0.4202024, 1, 0, 0, 1, 1,
0.345779, -1.167437, 3.536728, 0, 0, 0, 1, 1,
0.3487712, 1.121486, 0.2874838, 0, 0, 0, 1, 1,
0.3525494, -0.9302321, 2.717208, 0, 0, 0, 1, 1,
0.3561485, 1.971746, 1.940194, 0, 0, 0, 1, 1,
0.3568992, -0.9854561, 3.143146, 0, 0, 0, 1, 1,
0.3586786, -0.6994783, 2.018951, 0, 0, 0, 1, 1,
0.3603221, -0.4502707, 4.588337, 0, 0, 0, 1, 1,
0.366474, -0.2997996, 3.354867, 1, 1, 1, 1, 1,
0.366752, -2.100986, 2.128202, 1, 1, 1, 1, 1,
0.3735622, -1.003534, 4.381815, 1, 1, 1, 1, 1,
0.3779039, -1.05078, 2.091532, 1, 1, 1, 1, 1,
0.3801249, 0.2076912, -0.9700825, 1, 1, 1, 1, 1,
0.3809775, -1.240577, 2.112514, 1, 1, 1, 1, 1,
0.3828767, -0.4862012, 4.049332, 1, 1, 1, 1, 1,
0.3839432, -0.941677, 2.474057, 1, 1, 1, 1, 1,
0.3883761, -1.128876, 3.42423, 1, 1, 1, 1, 1,
0.3954787, 1.979588, 0.07973339, 1, 1, 1, 1, 1,
0.4008554, 0.4890091, -0.8553348, 1, 1, 1, 1, 1,
0.40331, 0.8287966, -1.073255, 1, 1, 1, 1, 1,
0.4043273, 0.8059683, -0.1135763, 1, 1, 1, 1, 1,
0.4043311, 1.64845, -0.8443025, 1, 1, 1, 1, 1,
0.4064202, 0.7758824, 0.3589611, 1, 1, 1, 1, 1,
0.4092585, 0.2400247, 1.369626, 0, 0, 1, 1, 1,
0.4102466, 1.777483, -1.109179, 1, 0, 0, 1, 1,
0.4137781, 1.089051, 1.548618, 1, 0, 0, 1, 1,
0.4192945, 0.6057621, 1.8593, 1, 0, 0, 1, 1,
0.4214062, 2.720612, 1.059084, 1, 0, 0, 1, 1,
0.4220472, 1.412578, 0.3575245, 1, 0, 0, 1, 1,
0.4231809, -0.2049987, 1.171543, 0, 0, 0, 1, 1,
0.4251058, -0.3733353, 3.46057, 0, 0, 0, 1, 1,
0.4307478, 0.1669532, 2.648828, 0, 0, 0, 1, 1,
0.4321415, -0.1714862, 1.429418, 0, 0, 0, 1, 1,
0.434161, -1.501467, 4.753497, 0, 0, 0, 1, 1,
0.4362308, 0.7349293, -0.5208246, 0, 0, 0, 1, 1,
0.4396548, -1.727494, 3.395732, 0, 0, 0, 1, 1,
0.4410718, 0.3521232, 1.998812, 1, 1, 1, 1, 1,
0.441671, -2.010703, 3.631308, 1, 1, 1, 1, 1,
0.4463378, -1.394652, 1.907762, 1, 1, 1, 1, 1,
0.448611, 0.2238311, 0.7492915, 1, 1, 1, 1, 1,
0.4545284, -0.9572647, 5.146243, 1, 1, 1, 1, 1,
0.4548576, -1.710801, 2.543917, 1, 1, 1, 1, 1,
0.4564984, -0.1976101, 1.358545, 1, 1, 1, 1, 1,
0.4566994, 1.152187, -1.546483, 1, 1, 1, 1, 1,
0.4575666, -0.8239555, 3.981694, 1, 1, 1, 1, 1,
0.4589983, 1.130386, -0.02435828, 1, 1, 1, 1, 1,
0.4605721, 0.3957481, 2.031969, 1, 1, 1, 1, 1,
0.4609077, -0.7534277, 3.819118, 1, 1, 1, 1, 1,
0.4614573, -0.08707294, 0.461808, 1, 1, 1, 1, 1,
0.4616751, 0.7335579, 0.01082771, 1, 1, 1, 1, 1,
0.4619372, -1.296252, 2.390952, 1, 1, 1, 1, 1,
0.4631155, -0.832675, 3.056895, 0, 0, 1, 1, 1,
0.4672571, 0.838241, -0.7767464, 1, 0, 0, 1, 1,
0.4717942, -0.4797718, 2.119433, 1, 0, 0, 1, 1,
0.4722595, 0.3136685, 2.4155, 1, 0, 0, 1, 1,
0.4729778, 0.1497332, 1.862501, 1, 0, 0, 1, 1,
0.4826646, -0.08157932, 0.8210728, 1, 0, 0, 1, 1,
0.48502, 0.366331, 0.98158, 0, 0, 0, 1, 1,
0.4855171, 0.1406358, 1.006145, 0, 0, 0, 1, 1,
0.4902459, 0.6169432, 0.07490113, 0, 0, 0, 1, 1,
0.4922881, -0.272785, 0.4306309, 0, 0, 0, 1, 1,
0.493666, 0.8730979, 0.409646, 0, 0, 0, 1, 1,
0.4948344, -1.242137, 2.870651, 0, 0, 0, 1, 1,
0.4981689, -0.2623645, 3.951235, 0, 0, 0, 1, 1,
0.5044856, 1.787768, -0.400126, 1, 1, 1, 1, 1,
0.5050572, -0.2021245, 1.14932, 1, 1, 1, 1, 1,
0.5052684, -0.7162147, 4.629515, 1, 1, 1, 1, 1,
0.5080162, -1.053778, 2.878476, 1, 1, 1, 1, 1,
0.5147237, -1.971571, 2.634444, 1, 1, 1, 1, 1,
0.5150611, 0.4459093, 0.4875154, 1, 1, 1, 1, 1,
0.5174238, -0.141626, 3.395383, 1, 1, 1, 1, 1,
0.5227275, 0.0676263, 2.679925, 1, 1, 1, 1, 1,
0.5296789, -0.6006856, 3.486768, 1, 1, 1, 1, 1,
0.5305444, -1.669477, 2.753999, 1, 1, 1, 1, 1,
0.5316692, -0.2433669, 1.651394, 1, 1, 1, 1, 1,
0.5352932, 0.9816335, 2.023207, 1, 1, 1, 1, 1,
0.540734, 0.6214766, 0.3722749, 1, 1, 1, 1, 1,
0.5447606, 1.459463, 3.858925, 1, 1, 1, 1, 1,
0.5461742, -0.3915295, 4.069382, 1, 1, 1, 1, 1,
0.5571725, 0.1762356, -0.009598685, 0, 0, 1, 1, 1,
0.5582533, -0.2854777, 1.836418, 1, 0, 0, 1, 1,
0.563965, -0.7109947, -0.2889093, 1, 0, 0, 1, 1,
0.5642723, 0.2741618, 1.416363, 1, 0, 0, 1, 1,
0.5647931, 0.0338956, 2.716007, 1, 0, 0, 1, 1,
0.5673924, -1.938295, 2.578792, 1, 0, 0, 1, 1,
0.5711971, -0.5677934, 2.560603, 0, 0, 0, 1, 1,
0.5762841, 1.382305, 0.5746127, 0, 0, 0, 1, 1,
0.5791363, -0.909029, 1.519276, 0, 0, 0, 1, 1,
0.5801433, -1.638918, 1.683323, 0, 0, 0, 1, 1,
0.5813892, -0.928716, 1.667265, 0, 0, 0, 1, 1,
0.5830297, -1.413369, 2.522576, 0, 0, 0, 1, 1,
0.585025, 1.232889, 0.8929954, 0, 0, 0, 1, 1,
0.5869558, 0.4128473, 2.042314, 1, 1, 1, 1, 1,
0.5909468, 1.838534, 1.830673, 1, 1, 1, 1, 1,
0.5955866, -0.2027279, 3.198318, 1, 1, 1, 1, 1,
0.6026723, 0.6242316, 1.213109, 1, 1, 1, 1, 1,
0.6039314, 0.2400406, -0.3682834, 1, 1, 1, 1, 1,
0.6064849, -0.2787651, 3.010598, 1, 1, 1, 1, 1,
0.6171861, 1.617237, 0.3866405, 1, 1, 1, 1, 1,
0.6231164, 1.018746, 0.5520191, 1, 1, 1, 1, 1,
0.6273701, 0.5154926, 2.761722, 1, 1, 1, 1, 1,
0.6297544, -0.009362511, 1.004634, 1, 1, 1, 1, 1,
0.6310924, -2.127636, 4.811594, 1, 1, 1, 1, 1,
0.6324534, -0.2133808, 2.3325, 1, 1, 1, 1, 1,
0.6334305, 0.3656117, 1.699149, 1, 1, 1, 1, 1,
0.6364789, -0.4683505, 3.590354, 1, 1, 1, 1, 1,
0.6391074, 0.5117722, 0.2435821, 1, 1, 1, 1, 1,
0.6410694, 1.096331, 1.183396, 0, 0, 1, 1, 1,
0.6425754, -1.270902, 1.551021, 1, 0, 0, 1, 1,
0.6454597, 0.03187976, 1.146101, 1, 0, 0, 1, 1,
0.6457298, 0.135517, 0.2342701, 1, 0, 0, 1, 1,
0.6553189, -0.508046, 3.05174, 1, 0, 0, 1, 1,
0.6566305, -0.2506123, 0.308405, 1, 0, 0, 1, 1,
0.6594273, 0.7453007, 0.981912, 0, 0, 0, 1, 1,
0.6622338, -0.2765898, 2.885972, 0, 0, 0, 1, 1,
0.6645591, -0.4378193, 1.084972, 0, 0, 0, 1, 1,
0.6648338, -0.1046984, 0.4427347, 0, 0, 0, 1, 1,
0.6652864, 0.7649852, 2.751413, 0, 0, 0, 1, 1,
0.6748472, -0.3573266, 2.201774, 0, 0, 0, 1, 1,
0.6766883, -1.685842, 3.528533, 0, 0, 0, 1, 1,
0.677211, 1.661661, 0.4131515, 1, 1, 1, 1, 1,
0.6783452, 0.231826, 1.22718, 1, 1, 1, 1, 1,
0.6790155, -0.656595, 3.318101, 1, 1, 1, 1, 1,
0.6828889, -0.09303991, 0.5517166, 1, 1, 1, 1, 1,
0.6942306, 1.549865, -0.04362189, 1, 1, 1, 1, 1,
0.7090047, 0.7411609, 1.831119, 1, 1, 1, 1, 1,
0.7098274, 0.3737645, 0.5094024, 1, 1, 1, 1, 1,
0.7109286, 0.4323798, 0.3988256, 1, 1, 1, 1, 1,
0.7159547, 0.07322433, 1.502133, 1, 1, 1, 1, 1,
0.7203381, -0.6007336, 3.029565, 1, 1, 1, 1, 1,
0.7207856, -0.2137849, 3.130373, 1, 1, 1, 1, 1,
0.725113, 1.848602, -0.1797044, 1, 1, 1, 1, 1,
0.7255426, 0.923509, -0.4728126, 1, 1, 1, 1, 1,
0.7287388, -0.2618042, 2.892485, 1, 1, 1, 1, 1,
0.7295974, -0.1640903, 1.711502, 1, 1, 1, 1, 1,
0.7304333, -0.1156782, 3.393739, 0, 0, 1, 1, 1,
0.736566, -0.1854447, 1.07666, 1, 0, 0, 1, 1,
0.7405104, 0.2153561, 1.121055, 1, 0, 0, 1, 1,
0.7423001, -1.609348, 4.37504, 1, 0, 0, 1, 1,
0.7481281, -0.07053358, 1.273908, 1, 0, 0, 1, 1,
0.7518541, 0.4152606, -1.404312, 1, 0, 0, 1, 1,
0.7684645, -0.1859818, 1.830964, 0, 0, 0, 1, 1,
0.7690905, -0.274308, 1.611973, 0, 0, 0, 1, 1,
0.7702128, -0.1293103, 3.274057, 0, 0, 0, 1, 1,
0.7764381, -0.6755756, 2.330822, 0, 0, 0, 1, 1,
0.7798226, 1.947127, 0.4179898, 0, 0, 0, 1, 1,
0.7808986, -0.1204309, 2.308752, 0, 0, 0, 1, 1,
0.7834228, 0.965346, 2.279317, 0, 0, 0, 1, 1,
0.7841572, 0.0760271, 1.616388, 1, 1, 1, 1, 1,
0.7854459, -0.9353033, 4.313778, 1, 1, 1, 1, 1,
0.7879173, -0.7369497, 2.59256, 1, 1, 1, 1, 1,
0.7904404, -0.5694129, 2.021599, 1, 1, 1, 1, 1,
0.7970365, 0.8281465, 0.2869453, 1, 1, 1, 1, 1,
0.7981395, 0.08428704, 2.152136, 1, 1, 1, 1, 1,
0.8005868, -0.6516586, 3.074422, 1, 1, 1, 1, 1,
0.8062407, 0.3879697, 0.8087363, 1, 1, 1, 1, 1,
0.8066472, -0.7699896, 2.408835, 1, 1, 1, 1, 1,
0.8094771, -0.7202439, 0.7298175, 1, 1, 1, 1, 1,
0.8149652, -1.194229, 3.886285, 1, 1, 1, 1, 1,
0.8177151, 0.7937341, 0.5987602, 1, 1, 1, 1, 1,
0.8178716, -0.8545337, 3.302577, 1, 1, 1, 1, 1,
0.8181449, 1.437098, 0.5205568, 1, 1, 1, 1, 1,
0.8336974, -1.630831, 1.371834, 1, 1, 1, 1, 1,
0.8340775, 0.415094, -0.2782778, 0, 0, 1, 1, 1,
0.8376505, -0.01323635, 0.8978428, 1, 0, 0, 1, 1,
0.8380411, 0.183966, 0.1827646, 1, 0, 0, 1, 1,
0.8391564, 1.598958, 0.4036392, 1, 0, 0, 1, 1,
0.8462906, -0.004437683, 2.007351, 1, 0, 0, 1, 1,
0.8463048, -1.392931, 3.885023, 1, 0, 0, 1, 1,
0.8501286, -2.12983, 3.595603, 0, 0, 0, 1, 1,
0.8560351, -0.2925893, 2.06645, 0, 0, 0, 1, 1,
0.8566285, -1.264699, 2.624458, 0, 0, 0, 1, 1,
0.8644367, 0.170975, 0.6470118, 0, 0, 0, 1, 1,
0.8687525, -1.680521, 3.33773, 0, 0, 0, 1, 1,
0.878179, -0.4885668, -0.4212304, 0, 0, 0, 1, 1,
0.883534, -0.3524593, 1.742522, 0, 0, 0, 1, 1,
0.8851464, 0.247139, 1.058742, 1, 1, 1, 1, 1,
0.9007314, -0.8284813, 2.534256, 1, 1, 1, 1, 1,
0.9030932, 0.1152064, 2.98187, 1, 1, 1, 1, 1,
0.9037283, -0.2392079, 0.9414157, 1, 1, 1, 1, 1,
0.914416, 0.8866338, 1.379697, 1, 1, 1, 1, 1,
0.9287456, -0.7540128, 3.97419, 1, 1, 1, 1, 1,
0.9294306, 0.4159685, 2.429147, 1, 1, 1, 1, 1,
0.9329374, -0.7692212, 1.436387, 1, 1, 1, 1, 1,
0.93343, 1.227106, 0.9998485, 1, 1, 1, 1, 1,
0.9465014, -1.292561, 3.087448, 1, 1, 1, 1, 1,
0.9507129, 0.420201, 1.473477, 1, 1, 1, 1, 1,
0.9559259, -0.4858324, 2.263371, 1, 1, 1, 1, 1,
0.961399, -0.04198883, 0.1995204, 1, 1, 1, 1, 1,
0.9628505, 2.48251, 1.356762, 1, 1, 1, 1, 1,
0.9637486, -1.443447, 1.834022, 1, 1, 1, 1, 1,
0.9667746, 0.1430974, 2.354239, 0, 0, 1, 1, 1,
0.9763771, -0.2530575, 2.457356, 1, 0, 0, 1, 1,
0.987104, 1.028249, 1.967903, 1, 0, 0, 1, 1,
0.9895836, -1.092777, 4.735543, 1, 0, 0, 1, 1,
0.9901806, -0.2649367, 2.223325, 1, 0, 0, 1, 1,
1.008889, -0.5580419, 1.708727, 1, 0, 0, 1, 1,
1.014945, 0.170917, 1.625925, 0, 0, 0, 1, 1,
1.020593, 1.020416, 0.7993652, 0, 0, 0, 1, 1,
1.022498, -0.9418542, 1.555671, 0, 0, 0, 1, 1,
1.023147, 0.5596554, 1.863686, 0, 0, 0, 1, 1,
1.023234, 1.987596, 1.193122, 0, 0, 0, 1, 1,
1.02824, -0.1973029, -0.0732463, 0, 0, 0, 1, 1,
1.035921, -1.136645, 1.115991, 0, 0, 0, 1, 1,
1.046493, 0.1376791, 2.495842, 1, 1, 1, 1, 1,
1.051372, -0.7477964, 3.129809, 1, 1, 1, 1, 1,
1.054158, -0.06002054, 2.141515, 1, 1, 1, 1, 1,
1.055011, 0.221496, 1.297957, 1, 1, 1, 1, 1,
1.056154, -1.01101, 2.034297, 1, 1, 1, 1, 1,
1.059661, -1.286984, 2.563005, 1, 1, 1, 1, 1,
1.064228, 0.6462353, 0.831789, 1, 1, 1, 1, 1,
1.068151, 2.662879, -0.6056275, 1, 1, 1, 1, 1,
1.069741, 0.9180292, 0.7759854, 1, 1, 1, 1, 1,
1.072638, 0.2264638, 2.963676, 1, 1, 1, 1, 1,
1.073904, -0.3888465, 2.121614, 1, 1, 1, 1, 1,
1.075007, -0.7714716, 2.600308, 1, 1, 1, 1, 1,
1.085575, -1.073987, 2.670028, 1, 1, 1, 1, 1,
1.08636, 0.08280144, 2.99627, 1, 1, 1, 1, 1,
1.087824, -0.5959885, 1.441017, 1, 1, 1, 1, 1,
1.094118, 0.8197163, -0.5363947, 0, 0, 1, 1, 1,
1.100851, 0.5214854, 1.521739, 1, 0, 0, 1, 1,
1.10269, -0.5276121, 1.941217, 1, 0, 0, 1, 1,
1.107435, 0.3288376, 1.926126, 1, 0, 0, 1, 1,
1.107984, -0.4068149, 0.5747092, 1, 0, 0, 1, 1,
1.126673, -0.03768967, 1.098203, 1, 0, 0, 1, 1,
1.130338, 0.7112738, -1.131945, 0, 0, 0, 1, 1,
1.142804, 0.7332808, 0.4370148, 0, 0, 0, 1, 1,
1.143622, -0.2813948, 0.8394675, 0, 0, 0, 1, 1,
1.144164, -0.8895271, 2.379606, 0, 0, 0, 1, 1,
1.14597, 0.1741841, 2.608571, 0, 0, 0, 1, 1,
1.150316, -1.513276, 2.090166, 0, 0, 0, 1, 1,
1.159233, 0.3533325, -0.3964278, 0, 0, 0, 1, 1,
1.162846, -0.3043933, 2.869439, 1, 1, 1, 1, 1,
1.165377, 1.621761, 0.7910532, 1, 1, 1, 1, 1,
1.171161, -0.05873834, 2.442692, 1, 1, 1, 1, 1,
1.1812, -0.5707031, 0.2797033, 1, 1, 1, 1, 1,
1.183127, -1.915679, 2.286782, 1, 1, 1, 1, 1,
1.184322, 0.1053227, 1.205889, 1, 1, 1, 1, 1,
1.186618, -0.1786833, 3.117971, 1, 1, 1, 1, 1,
1.190352, 0.05511948, 0.8038107, 1, 1, 1, 1, 1,
1.19189, 0.2410143, 1.765047, 1, 1, 1, 1, 1,
1.193892, 3.180879, 0.8606167, 1, 1, 1, 1, 1,
1.201123, 0.6761314, 0.3544798, 1, 1, 1, 1, 1,
1.207329, 1.286055, -0.7613435, 1, 1, 1, 1, 1,
1.211405, 0.1256122, 2.375119, 1, 1, 1, 1, 1,
1.217744, -0.4927784, 1.813279, 1, 1, 1, 1, 1,
1.218992, -1.323543, 0.487123, 1, 1, 1, 1, 1,
1.219261, 1.68966, -1.260298, 0, 0, 1, 1, 1,
1.225695, -1.60954, 2.124072, 1, 0, 0, 1, 1,
1.231411, -0.7565568, 1.164508, 1, 0, 0, 1, 1,
1.234453, -1.075548, 2.747963, 1, 0, 0, 1, 1,
1.249244, -0.04077462, 0.7100899, 1, 0, 0, 1, 1,
1.258439, 0.2174766, 1.113486, 1, 0, 0, 1, 1,
1.260707, 0.1118177, 2.783935, 0, 0, 0, 1, 1,
1.26137, 0.8719633, 1.907164, 0, 0, 0, 1, 1,
1.272648, -1.830948, 3.544357, 0, 0, 0, 1, 1,
1.275398, -1.582258, 3.735277, 0, 0, 0, 1, 1,
1.276949, -0.2404097, 1.853293, 0, 0, 0, 1, 1,
1.27743, 0.3308511, 2.985003, 0, 0, 0, 1, 1,
1.278069, 0.7404904, -1.028232, 0, 0, 0, 1, 1,
1.280079, 2.067278, 0.8989596, 1, 1, 1, 1, 1,
1.284678, 0.2707729, 0.5394003, 1, 1, 1, 1, 1,
1.293619, 1.137763, 0.7051798, 1, 1, 1, 1, 1,
1.300001, -1.144428, 2.839274, 1, 1, 1, 1, 1,
1.301597, 0.9666373, 1.167973, 1, 1, 1, 1, 1,
1.306583, 2.126092, -0.008564687, 1, 1, 1, 1, 1,
1.309683, -1.589563, 2.956399, 1, 1, 1, 1, 1,
1.312233, 1.38662, 0.3638665, 1, 1, 1, 1, 1,
1.316318, -0.885352, 0.4470301, 1, 1, 1, 1, 1,
1.342566, 0.306821, 0.6463012, 1, 1, 1, 1, 1,
1.345587, 0.3376196, 1.710698, 1, 1, 1, 1, 1,
1.354058, 2.319677, 0.662481, 1, 1, 1, 1, 1,
1.363625, 0.6538167, 2.182418, 1, 1, 1, 1, 1,
1.364671, 0.849135, 1.40827, 1, 1, 1, 1, 1,
1.379469, 0.5086494, 1.011597, 1, 1, 1, 1, 1,
1.384639, -0.8922883, 1.382299, 0, 0, 1, 1, 1,
1.394999, 2.348103, 0.5148285, 1, 0, 0, 1, 1,
1.399316, 1.590956, -0.5811647, 1, 0, 0, 1, 1,
1.400291, 1.959232, 1.520916, 1, 0, 0, 1, 1,
1.404735, -0.3781433, 1.051305, 1, 0, 0, 1, 1,
1.405616, 0.3167333, 2.169551, 1, 0, 0, 1, 1,
1.413098, 0.9836972, 1.917981, 0, 0, 0, 1, 1,
1.429837, -0.7629485, 1.81553, 0, 0, 0, 1, 1,
1.43023, -0.8659636, 1.619624, 0, 0, 0, 1, 1,
1.450736, 0.9309229, 1.660379, 0, 0, 0, 1, 1,
1.452179, 0.7835285, 1.070672, 0, 0, 0, 1, 1,
1.453997, -1.388991, 2.609923, 0, 0, 0, 1, 1,
1.458636, -1.154408, 3.748573, 0, 0, 0, 1, 1,
1.482281, -0.1756627, 3.185774, 1, 1, 1, 1, 1,
1.487604, 0.2706005, 2.082197, 1, 1, 1, 1, 1,
1.488705, -1.416688, 1.9173, 1, 1, 1, 1, 1,
1.490043, 0.792905, 0.9400828, 1, 1, 1, 1, 1,
1.493759, -0.7905309, 2.020022, 1, 1, 1, 1, 1,
1.500189, 0.9492278, -0.3320563, 1, 1, 1, 1, 1,
1.509681, 0.7837091, -0.2504838, 1, 1, 1, 1, 1,
1.521596, 0.4002018, 0.2776173, 1, 1, 1, 1, 1,
1.523882, -0.8420129, 2.480036, 1, 1, 1, 1, 1,
1.535245, -0.6397727, 1.708379, 1, 1, 1, 1, 1,
1.54784, 1.026962, 1.296331, 1, 1, 1, 1, 1,
1.556044, -0.2048432, 3.021586, 1, 1, 1, 1, 1,
1.575716, 0.1103427, 3.546592, 1, 1, 1, 1, 1,
1.60029, -0.4341332, 3.316985, 1, 1, 1, 1, 1,
1.605593, -0.5736428, 2.351456, 1, 1, 1, 1, 1,
1.617922, 0.9964408, 1.363552, 0, 0, 1, 1, 1,
1.627165, 0.4434762, 2.824019, 1, 0, 0, 1, 1,
1.628084, 0.7613947, 1.677991, 1, 0, 0, 1, 1,
1.643123, -0.8071108, 2.272288, 1, 0, 0, 1, 1,
1.64692, -1.315435, 2.313019, 1, 0, 0, 1, 1,
1.657364, -1.839025, 3.102393, 1, 0, 0, 1, 1,
1.657785, 0.5137423, -0.113631, 0, 0, 0, 1, 1,
1.66292, 0.6715305, 2.391128, 0, 0, 0, 1, 1,
1.665187, -1.162085, 0.8912886, 0, 0, 0, 1, 1,
1.666248, 0.06854085, -0.3566036, 0, 0, 0, 1, 1,
1.669234, -1.241963, 3.254341, 0, 0, 0, 1, 1,
1.672187, -0.4096795, 1.887494, 0, 0, 0, 1, 1,
1.679265, -0.09656344, 1.842572, 0, 0, 0, 1, 1,
1.685364, 0.3046277, 0.7395388, 1, 1, 1, 1, 1,
1.699183, 0.6869528, 0.2010972, 1, 1, 1, 1, 1,
1.700298, -0.4084604, 1.266589, 1, 1, 1, 1, 1,
1.714462, 0.9545506, 2.521986, 1, 1, 1, 1, 1,
1.716731, 0.03055849, 3.293258, 1, 1, 1, 1, 1,
1.720094, -0.3505637, 2.532233, 1, 1, 1, 1, 1,
1.736571, -0.118763, -0.2641835, 1, 1, 1, 1, 1,
1.744964, 0.4998293, 1.283328, 1, 1, 1, 1, 1,
1.749954, -0.5647395, 2.148078, 1, 1, 1, 1, 1,
1.756575, 0.2220429, -0.1302209, 1, 1, 1, 1, 1,
1.762016, 0.2349045, 0.856008, 1, 1, 1, 1, 1,
1.830109, 0.5248836, 2.760439, 1, 1, 1, 1, 1,
1.840551, 0.1020843, 2.488314, 1, 1, 1, 1, 1,
1.84949, 3.215059, 0.4134032, 1, 1, 1, 1, 1,
1.861502, 1.024747, 2.313221, 1, 1, 1, 1, 1,
2.015787, -1.602477, 3.248016, 0, 0, 1, 1, 1,
2.044651, 2.174256, 1.138931, 1, 0, 0, 1, 1,
2.055752, 0.2703857, 2.855001, 1, 0, 0, 1, 1,
2.062889, 0.7011572, 3.094038, 1, 0, 0, 1, 1,
2.094784, 0.03424808, 3.07014, 1, 0, 0, 1, 1,
2.102973, 0.5993049, 1.309918, 1, 0, 0, 1, 1,
2.13346, -0.5065355, 1.413313, 0, 0, 0, 1, 1,
2.148758, 0.0817048, 1.860853, 0, 0, 0, 1, 1,
2.167414, -0.4502332, 1.743179, 0, 0, 0, 1, 1,
2.19492, 2.439536, -0.1252943, 0, 0, 0, 1, 1,
2.201358, -0.3513928, 1.970783, 0, 0, 0, 1, 1,
2.322005, -0.1947913, 1.013673, 0, 0, 0, 1, 1,
2.352244, -1.005528, 3.990944, 0, 0, 0, 1, 1,
2.389859, -0.07011737, 0.9443311, 1, 1, 1, 1, 1,
2.410508, -0.4859798, 2.956455, 1, 1, 1, 1, 1,
2.463231, 0.8354561, 1.563111, 1, 1, 1, 1, 1,
2.52706, 0.5947306, 0.8964151, 1, 1, 1, 1, 1,
2.571097, -1.24128, 3.172212, 1, 1, 1, 1, 1,
2.826114, 2.537265, -0.580279, 1, 1, 1, 1, 1,
3.004575, 1.057112, 0.9758981, 1, 1, 1, 1, 1
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
var radius = 9.418999;
var distance = 33.08383;
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
mvMatrix.translate( -0.005815864, -0.2657021, 0.2107222 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.08383);
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
