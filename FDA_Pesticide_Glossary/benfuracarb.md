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
-2.967762, -0.6401764, -2.922487, 1, 0, 0, 1,
-2.804083, -0.8537023, -2.18644, 1, 0.007843138, 0, 1,
-2.710671, -0.5058802, -1.315443, 1, 0.01176471, 0, 1,
-2.68912, -0.7040885, -2.159119, 1, 0.01960784, 0, 1,
-2.664185, -0.08306149, -3.266935, 1, 0.02352941, 0, 1,
-2.607744, 0.04831818, -2.044692, 1, 0.03137255, 0, 1,
-2.536509, -0.6665858, -3.753065, 1, 0.03529412, 0, 1,
-2.490187, 1.537614, -1.501097, 1, 0.04313726, 0, 1,
-2.475668, 0.3227884, -0.7266662, 1, 0.04705882, 0, 1,
-2.407992, 1.472763, -3.121092, 1, 0.05490196, 0, 1,
-2.399273, 0.2464548, -0.9179834, 1, 0.05882353, 0, 1,
-2.394767, 0.9921075, -2.342564, 1, 0.06666667, 0, 1,
-2.369095, -0.6225814, -2.254854, 1, 0.07058824, 0, 1,
-2.335067, 1.358297, -3.087396, 1, 0.07843138, 0, 1,
-2.250569, 0.7252945, -1.287479, 1, 0.08235294, 0, 1,
-2.206146, 0.5239717, -0.4870312, 1, 0.09019608, 0, 1,
-2.12812, -0.1635268, -2.997638, 1, 0.09411765, 0, 1,
-2.043914, 1.047373, -2.38105, 1, 0.1019608, 0, 1,
-1.948985, 0.7242556, -0.5519872, 1, 0.1098039, 0, 1,
-1.94009, 1.30696, -1.982366, 1, 0.1137255, 0, 1,
-1.901841, 0.2492467, -0.7511005, 1, 0.1215686, 0, 1,
-1.851639, -1.151495, -2.75806, 1, 0.1254902, 0, 1,
-1.822299, -0.005690775, -1.039739, 1, 0.1333333, 0, 1,
-1.808583, 0.8480702, -1.717374, 1, 0.1372549, 0, 1,
-1.79476, 0.2323773, -0.8248096, 1, 0.145098, 0, 1,
-1.77994, 1.016863, -0.5615336, 1, 0.1490196, 0, 1,
-1.778956, 1.003203, -1.636669, 1, 0.1568628, 0, 1,
-1.766182, 2.382977, -0.7713857, 1, 0.1607843, 0, 1,
-1.758628, -0.8917886, -3.159654, 1, 0.1686275, 0, 1,
-1.753597, -0.269811, -2.518704, 1, 0.172549, 0, 1,
-1.749971, 0.301515, -1.078873, 1, 0.1803922, 0, 1,
-1.749082, 0.9104081, -0.5331644, 1, 0.1843137, 0, 1,
-1.723642, -0.9526622, -1.631866, 1, 0.1921569, 0, 1,
-1.722364, -0.8901277, -2.847008, 1, 0.1960784, 0, 1,
-1.709753, 2.600244, -0.5228465, 1, 0.2039216, 0, 1,
-1.698757, 0.9480122, -1.474008, 1, 0.2117647, 0, 1,
-1.695984, -0.1834986, -1.014656, 1, 0.2156863, 0, 1,
-1.690541, 0.2296582, 0.2236309, 1, 0.2235294, 0, 1,
-1.677598, -0.6370375, -3.09364, 1, 0.227451, 0, 1,
-1.663222, 0.1584149, -2.119634, 1, 0.2352941, 0, 1,
-1.659065, 0.02973579, -2.188548, 1, 0.2392157, 0, 1,
-1.651447, 0.3361458, -1.749747, 1, 0.2470588, 0, 1,
-1.645449, 0.2955117, -1.630563, 1, 0.2509804, 0, 1,
-1.64468, 0.09400222, 1.067368, 1, 0.2588235, 0, 1,
-1.63542, 0.1011823, -2.299243, 1, 0.2627451, 0, 1,
-1.634377, -0.8194948, -0.4253362, 1, 0.2705882, 0, 1,
-1.633577, 0.1514664, -0.989275, 1, 0.2745098, 0, 1,
-1.633278, 0.4385922, -2.447435, 1, 0.282353, 0, 1,
-1.626967, 0.699129, -0.7458132, 1, 0.2862745, 0, 1,
-1.601477, 1.080397, -1.066761, 1, 0.2941177, 0, 1,
-1.600515, -0.5576385, -2.892458, 1, 0.3019608, 0, 1,
-1.591344, 0.08559801, -0.532015, 1, 0.3058824, 0, 1,
-1.590347, -2.562382, -3.288603, 1, 0.3137255, 0, 1,
-1.581072, 0.2725493, -2.429437, 1, 0.3176471, 0, 1,
-1.578761, -2.462042, -2.031507, 1, 0.3254902, 0, 1,
-1.54538, 0.03134093, -1.247399, 1, 0.3294118, 0, 1,
-1.537711, 0.7363915, -1.615822, 1, 0.3372549, 0, 1,
-1.525073, 0.9371363, -0.7896842, 1, 0.3411765, 0, 1,
-1.509003, 0.1976281, -1.753977, 1, 0.3490196, 0, 1,
-1.503722, 0.2125995, -2.129246, 1, 0.3529412, 0, 1,
-1.501028, 0.1839789, -0.09092109, 1, 0.3607843, 0, 1,
-1.496544, 0.6097893, -0.07214353, 1, 0.3647059, 0, 1,
-1.496373, 0.1629125, -1.817038, 1, 0.372549, 0, 1,
-1.487365, 0.1007999, -0.9848396, 1, 0.3764706, 0, 1,
-1.485569, -0.1954836, -1.789546, 1, 0.3843137, 0, 1,
-1.467056, -0.3844084, -2.547364, 1, 0.3882353, 0, 1,
-1.461708, -1.102527, -3.20734, 1, 0.3960784, 0, 1,
-1.45335, -0.695134, -2.856157, 1, 0.4039216, 0, 1,
-1.439881, 0.389015, -2.644744, 1, 0.4078431, 0, 1,
-1.434434, 0.05671738, -1.429419, 1, 0.4156863, 0, 1,
-1.428907, 0.4111924, -1.673221, 1, 0.4196078, 0, 1,
-1.428666, 0.4907291, -1.398968, 1, 0.427451, 0, 1,
-1.428508, -0.8379717, -2.421167, 1, 0.4313726, 0, 1,
-1.428158, 0.4657064, -2.461292, 1, 0.4392157, 0, 1,
-1.426756, -0.9008689, 0.06295983, 1, 0.4431373, 0, 1,
-1.418294, 1.16909, -1.216411, 1, 0.4509804, 0, 1,
-1.409057, 0.976676, -0.8252372, 1, 0.454902, 0, 1,
-1.400912, -0.5923732, -0.5442332, 1, 0.4627451, 0, 1,
-1.399379, 0.02867707, -0.9969282, 1, 0.4666667, 0, 1,
-1.399364, -0.5425407, -2.379658, 1, 0.4745098, 0, 1,
-1.392799, 0.6527855, -0.4953451, 1, 0.4784314, 0, 1,
-1.370587, 0.8667498, -2.320742, 1, 0.4862745, 0, 1,
-1.360567, -1.697847, -1.459579, 1, 0.4901961, 0, 1,
-1.35239, -0.6063954, -1.386976, 1, 0.4980392, 0, 1,
-1.349328, 1.02329, -0.8913131, 1, 0.5058824, 0, 1,
-1.348645, -0.1752591, -0.9504582, 1, 0.509804, 0, 1,
-1.343426, -0.3715962, -1.916393, 1, 0.5176471, 0, 1,
-1.340148, -0.4459988, -1.789603, 1, 0.5215687, 0, 1,
-1.33572, 0.06140219, -3.790103, 1, 0.5294118, 0, 1,
-1.335387, 1.356214, -1.128432, 1, 0.5333334, 0, 1,
-1.328881, 0.6538646, -1.436562, 1, 0.5411765, 0, 1,
-1.322374, 1.910928, 0.5694699, 1, 0.5450981, 0, 1,
-1.321801, 0.3105889, -1.126952, 1, 0.5529412, 0, 1,
-1.313818, 0.7894626, -1.717165, 1, 0.5568628, 0, 1,
-1.31286, -0.5026318, -1.001143, 1, 0.5647059, 0, 1,
-1.306279, 0.3236256, -3.13074, 1, 0.5686275, 0, 1,
-1.303353, -1.291929, -1.408355, 1, 0.5764706, 0, 1,
-1.295728, 0.3353239, -0.5417228, 1, 0.5803922, 0, 1,
-1.293962, 0.790885, -2.08078, 1, 0.5882353, 0, 1,
-1.292915, 2.045759, -0.4454201, 1, 0.5921569, 0, 1,
-1.285737, -0.7379087, -2.356553, 1, 0.6, 0, 1,
-1.285265, -0.6694251, -3.137347, 1, 0.6078432, 0, 1,
-1.284483, -1.107197, -1.8555, 1, 0.6117647, 0, 1,
-1.27861, -0.2691459, 1.26887, 1, 0.6196079, 0, 1,
-1.274181, 0.7528325, -1.009266, 1, 0.6235294, 0, 1,
-1.268994, 0.1622714, -2.068374, 1, 0.6313726, 0, 1,
-1.25494, 0.06871568, -1.866998, 1, 0.6352941, 0, 1,
-1.246774, -0.7501978, -0.03611476, 1, 0.6431373, 0, 1,
-1.246082, -0.07214016, -2.307551, 1, 0.6470588, 0, 1,
-1.244686, -1.066901, -2.923019, 1, 0.654902, 0, 1,
-1.241845, 0.6752456, 0.2307127, 1, 0.6588235, 0, 1,
-1.240836, 1.999632, -0.7321777, 1, 0.6666667, 0, 1,
-1.232927, -1.483986, -2.3361, 1, 0.6705883, 0, 1,
-1.224094, 0.5742609, -0.6958965, 1, 0.6784314, 0, 1,
-1.213268, 0.07397011, -2.473473, 1, 0.682353, 0, 1,
-1.211178, 0.578038, -0.8500043, 1, 0.6901961, 0, 1,
-1.206143, 0.8906621, -2.145115, 1, 0.6941177, 0, 1,
-1.191821, -0.4864612, -1.866358, 1, 0.7019608, 0, 1,
-1.190839, -0.6819965, 1.979748, 1, 0.7098039, 0, 1,
-1.188226, 0.2605014, -1.902332, 1, 0.7137255, 0, 1,
-1.179837, 1.002774, -1.855595, 1, 0.7215686, 0, 1,
-1.178748, 0.9006952, -1.383422, 1, 0.7254902, 0, 1,
-1.165704, 1.345731, 0.320805, 1, 0.7333333, 0, 1,
-1.162339, 0.4115421, -2.558096, 1, 0.7372549, 0, 1,
-1.16226, -0.433536, -1.839404, 1, 0.7450981, 0, 1,
-1.160653, 0.2090236, -1.687423, 1, 0.7490196, 0, 1,
-1.158891, 0.3710778, -0.09178875, 1, 0.7568628, 0, 1,
-1.145407, 0.1101217, -2.05673, 1, 0.7607843, 0, 1,
-1.134311, 0.6693668, -2.322296, 1, 0.7686275, 0, 1,
-1.132045, -1.021704, -1.508068, 1, 0.772549, 0, 1,
-1.121355, 0.03329618, -3.609903, 1, 0.7803922, 0, 1,
-1.115798, -1.932626, -2.78582, 1, 0.7843137, 0, 1,
-1.112646, -1.587231, -1.832435, 1, 0.7921569, 0, 1,
-1.112021, -0.7293882, -3.342069, 1, 0.7960784, 0, 1,
-1.111773, -1.039312, -3.647137, 1, 0.8039216, 0, 1,
-1.1082, -0.819776, -1.77475, 1, 0.8117647, 0, 1,
-1.106006, -1.272388, -1.625884, 1, 0.8156863, 0, 1,
-1.097651, 0.6699566, -1.609276, 1, 0.8235294, 0, 1,
-1.097617, 1.029076, -1.150326, 1, 0.827451, 0, 1,
-1.097532, -1.536419, -2.837282, 1, 0.8352941, 0, 1,
-1.092637, -0.2039646, -2.463576, 1, 0.8392157, 0, 1,
-1.089626, -1.613778, -1.377328, 1, 0.8470588, 0, 1,
-1.086667, 0.5162625, -1.891654, 1, 0.8509804, 0, 1,
-1.085921, 1.102588, -1.507009, 1, 0.8588235, 0, 1,
-1.0852, -1.260381, -1.906479, 1, 0.8627451, 0, 1,
-1.078382, 1.837577, -1.299275, 1, 0.8705882, 0, 1,
-1.077453, 1.540575, -2.6334, 1, 0.8745098, 0, 1,
-1.071427, 0.2283525, -1.881021, 1, 0.8823529, 0, 1,
-1.068554, 0.8926834, -2.419499, 1, 0.8862745, 0, 1,
-1.068068, -0.4215996, -1.033792, 1, 0.8941177, 0, 1,
-1.067702, -1.843782, -1.793847, 1, 0.8980392, 0, 1,
-1.054968, -0.3024188, -1.437078, 1, 0.9058824, 0, 1,
-1.053841, -0.7873096, -3.671652, 1, 0.9137255, 0, 1,
-1.052367, -0.1124679, -0.4939948, 1, 0.9176471, 0, 1,
-1.048809, 0.07576916, -0.2994001, 1, 0.9254902, 0, 1,
-1.042743, 1.272896, -1.230017, 1, 0.9294118, 0, 1,
-1.034965, -0.3644634, -2.487862, 1, 0.9372549, 0, 1,
-1.034062, -0.8127033, -3.023017, 1, 0.9411765, 0, 1,
-1.030573, 0.154618, -1.533313, 1, 0.9490196, 0, 1,
-1.027999, -0.1145649, -3.009174, 1, 0.9529412, 0, 1,
-1.02472, -0.4207709, -1.364552, 1, 0.9607843, 0, 1,
-1.023726, 0.07447234, -1.200236, 1, 0.9647059, 0, 1,
-1.019083, -0.5783834, -2.934922, 1, 0.972549, 0, 1,
-1.015081, 0.5842708, -1.026976, 1, 0.9764706, 0, 1,
-1.008175, -0.6637226, -2.412723, 1, 0.9843137, 0, 1,
-1.001774, 1.777169, -2.886419, 1, 0.9882353, 0, 1,
-1.000225, -0.1934934, -2.674623, 1, 0.9960784, 0, 1,
-0.9964966, -0.249292, -0.8489051, 0.9960784, 1, 0, 1,
-0.9937441, -2.526072, -2.165086, 0.9921569, 1, 0, 1,
-0.9900611, -1.089004, -0.4803653, 0.9843137, 1, 0, 1,
-0.9865867, 1.653971, 0.7926105, 0.9803922, 1, 0, 1,
-0.9831828, 0.5864902, -0.1750684, 0.972549, 1, 0, 1,
-0.9812992, 1.053694, -0.6802158, 0.9686275, 1, 0, 1,
-0.9794568, 0.2524274, -1.254965, 0.9607843, 1, 0, 1,
-0.976338, -1.10858, -3.808441, 0.9568627, 1, 0, 1,
-0.9757257, -1.366228, -2.357566, 0.9490196, 1, 0, 1,
-0.9729659, -1.785665, -1.931441, 0.945098, 1, 0, 1,
-0.9720007, 1.260962, -2.516335, 0.9372549, 1, 0, 1,
-0.9704214, 0.464507, -1.499435, 0.9333333, 1, 0, 1,
-0.9664613, -1.943363, -3.188067, 0.9254902, 1, 0, 1,
-0.9658501, -0.1486195, -2.232499, 0.9215686, 1, 0, 1,
-0.9626933, -0.6396856, 0.03727071, 0.9137255, 1, 0, 1,
-0.9609287, -0.3499232, -3.454901, 0.9098039, 1, 0, 1,
-0.9604453, 0.2436977, -3.180258, 0.9019608, 1, 0, 1,
-0.9597031, -0.3170114, -3.213484, 0.8941177, 1, 0, 1,
-0.9516069, -1.908833, -3.787036, 0.8901961, 1, 0, 1,
-0.9514138, -0.4105216, -2.122438, 0.8823529, 1, 0, 1,
-0.9475763, 1.321936, -1.651764, 0.8784314, 1, 0, 1,
-0.9453334, 0.451876, -3.02034, 0.8705882, 1, 0, 1,
-0.9452811, 1.936785, -0.1037238, 0.8666667, 1, 0, 1,
-0.9408824, 0.2743033, -1.963783, 0.8588235, 1, 0, 1,
-0.9387, 1.200592, -1.069924, 0.854902, 1, 0, 1,
-0.9371393, 0.9794483, 0.8522409, 0.8470588, 1, 0, 1,
-0.935551, -0.9500621, -3.228848, 0.8431373, 1, 0, 1,
-0.9328421, -2.271642, -4.850805, 0.8352941, 1, 0, 1,
-0.9246097, -2.320598, -1.702678, 0.8313726, 1, 0, 1,
-0.9179773, 1.843198, -1.678706, 0.8235294, 1, 0, 1,
-0.9175264, -0.4591823, 0.5767891, 0.8196079, 1, 0, 1,
-0.9031833, -0.2305116, -2.247615, 0.8117647, 1, 0, 1,
-0.8961733, 0.5935476, 0.08835769, 0.8078431, 1, 0, 1,
-0.8947194, 0.6440997, -1.111525, 0.8, 1, 0, 1,
-0.8941779, -1.18962, -1.176507, 0.7921569, 1, 0, 1,
-0.8939394, 0.7872671, 0.5324631, 0.7882353, 1, 0, 1,
-0.8873441, -0.408586, -2.55707, 0.7803922, 1, 0, 1,
-0.8865209, -1.059498, -2.041599, 0.7764706, 1, 0, 1,
-0.8856872, 0.02215638, -2.155563, 0.7686275, 1, 0, 1,
-0.8836104, -0.4067861, -2.94623, 0.7647059, 1, 0, 1,
-0.8832934, 0.6768093, -2.64692, 0.7568628, 1, 0, 1,
-0.8825745, 1.276098, -1.131803, 0.7529412, 1, 0, 1,
-0.877296, -0.2342554, -1.880285, 0.7450981, 1, 0, 1,
-0.8714313, -1.019437, -2.118263, 0.7411765, 1, 0, 1,
-0.8708031, 0.7518224, -0.2506744, 0.7333333, 1, 0, 1,
-0.8696533, 0.4196565, -1.991068, 0.7294118, 1, 0, 1,
-0.8618985, 1.019862, 0.06567384, 0.7215686, 1, 0, 1,
-0.8581294, -0.6669902, -2.830852, 0.7176471, 1, 0, 1,
-0.8504663, -1.338959, -3.132224, 0.7098039, 1, 0, 1,
-0.8458562, 0.2637565, -1.561646, 0.7058824, 1, 0, 1,
-0.8397493, 1.309808, -0.6445031, 0.6980392, 1, 0, 1,
-0.8391027, -0.06241027, -3.992096, 0.6901961, 1, 0, 1,
-0.8390273, -1.002794, -1.588875, 0.6862745, 1, 0, 1,
-0.8351444, -0.36547, -1.826132, 0.6784314, 1, 0, 1,
-0.8332206, 0.8479652, 0.5521841, 0.6745098, 1, 0, 1,
-0.8293484, 0.162282, -0.6916227, 0.6666667, 1, 0, 1,
-0.8264629, -0.9012741, -3.055986, 0.6627451, 1, 0, 1,
-0.8248416, 1.237872, -0.09714848, 0.654902, 1, 0, 1,
-0.8246815, -0.2206004, -2.32856, 0.6509804, 1, 0, 1,
-0.8232133, -0.1649733, 0.5141011, 0.6431373, 1, 0, 1,
-0.8223916, -0.4528889, -2.381602, 0.6392157, 1, 0, 1,
-0.8215017, 0.8928562, -0.7268092, 0.6313726, 1, 0, 1,
-0.8206891, 1.313119, -0.8558287, 0.627451, 1, 0, 1,
-0.819276, -1.081747, -3.585024, 0.6196079, 1, 0, 1,
-0.8185394, -0.4795862, -3.032899, 0.6156863, 1, 0, 1,
-0.8118508, -0.7101991, -2.927177, 0.6078432, 1, 0, 1,
-0.8114073, 0.8573453, 0.733287, 0.6039216, 1, 0, 1,
-0.8093744, -0.3054074, -1.86072, 0.5960785, 1, 0, 1,
-0.8007154, -0.3724938, -3.682803, 0.5882353, 1, 0, 1,
-0.7945586, 1.731187, 1.29062, 0.5843138, 1, 0, 1,
-0.7914224, 1.306566, 1.139842, 0.5764706, 1, 0, 1,
-0.7877216, 2.601105, -0.8481144, 0.572549, 1, 0, 1,
-0.7869173, 0.7119775, 0.04649937, 0.5647059, 1, 0, 1,
-0.7772793, -0.5104936, -3.764157, 0.5607843, 1, 0, 1,
-0.7742075, 0.97083, -1.224117, 0.5529412, 1, 0, 1,
-0.7724814, 0.0287628, -2.199335, 0.5490196, 1, 0, 1,
-0.7677854, -0.9824783, -2.023541, 0.5411765, 1, 0, 1,
-0.7639644, -0.155358, -2.4032, 0.5372549, 1, 0, 1,
-0.7588763, -0.08834796, 0.0501887, 0.5294118, 1, 0, 1,
-0.7581963, -0.1419959, -1.629032, 0.5254902, 1, 0, 1,
-0.757234, -1.266406, -3.686371, 0.5176471, 1, 0, 1,
-0.7550187, -0.3874865, -0.6505121, 0.5137255, 1, 0, 1,
-0.7531062, 1.54006, -1.750532, 0.5058824, 1, 0, 1,
-0.7431785, 0.7428733, -0.1680872, 0.5019608, 1, 0, 1,
-0.7425621, -0.9027253, -2.276192, 0.4941176, 1, 0, 1,
-0.7380321, 0.5130116, -1.347532, 0.4862745, 1, 0, 1,
-0.7326863, 1.085706, -0.19761, 0.4823529, 1, 0, 1,
-0.7322714, -0.9447321, -0.4487318, 0.4745098, 1, 0, 1,
-0.7285041, 0.5694138, -1.131435, 0.4705882, 1, 0, 1,
-0.7256947, 0.7624194, -0.7775204, 0.4627451, 1, 0, 1,
-0.7249923, 1.078929, -0.6978759, 0.4588235, 1, 0, 1,
-0.7178544, 0.3348618, -1.465659, 0.4509804, 1, 0, 1,
-0.714803, -1.331032, -2.069317, 0.4470588, 1, 0, 1,
-0.7090262, 2.012932, -0.6954743, 0.4392157, 1, 0, 1,
-0.7073019, 1.050502, -0.6741765, 0.4352941, 1, 0, 1,
-0.705558, 0.08159193, -0.993138, 0.427451, 1, 0, 1,
-0.7032518, -0.3793063, -1.995635, 0.4235294, 1, 0, 1,
-0.6907111, -0.3686021, -2.112191, 0.4156863, 1, 0, 1,
-0.6872991, -1.400386, -3.092797, 0.4117647, 1, 0, 1,
-0.6854472, 0.1252811, -1.570337, 0.4039216, 1, 0, 1,
-0.6852636, -1.406282, -0.3546113, 0.3960784, 1, 0, 1,
-0.6851221, -0.09182973, -1.17007, 0.3921569, 1, 0, 1,
-0.670071, 1.894347, 0.6198617, 0.3843137, 1, 0, 1,
-0.6675282, -1.430458, -2.11474, 0.3803922, 1, 0, 1,
-0.6669787, 1.534117, -1.840663, 0.372549, 1, 0, 1,
-0.6632342, 0.1898361, -2.360162, 0.3686275, 1, 0, 1,
-0.6612759, 1.644671, -2.786719, 0.3607843, 1, 0, 1,
-0.6602939, 0.240364, -1.079392, 0.3568628, 1, 0, 1,
-0.6552623, -1.115159, -2.934762, 0.3490196, 1, 0, 1,
-0.652272, -0.8009245, -2.438904, 0.345098, 1, 0, 1,
-0.6511757, 0.1211789, -1.200115, 0.3372549, 1, 0, 1,
-0.6468768, 1.384488, -0.1401797, 0.3333333, 1, 0, 1,
-0.6450709, 1.156455, -1.726755, 0.3254902, 1, 0, 1,
-0.644428, 2.147664, -2.183199, 0.3215686, 1, 0, 1,
-0.6433038, 0.8161066, -0.122598, 0.3137255, 1, 0, 1,
-0.6426078, -0.2320694, -2.816215, 0.3098039, 1, 0, 1,
-0.6320788, -0.3991876, -1.356491, 0.3019608, 1, 0, 1,
-0.6290844, 0.4608684, -0.07980391, 0.2941177, 1, 0, 1,
-0.6281775, 0.8326327, -1.509754, 0.2901961, 1, 0, 1,
-0.6280656, 0.528372, 0.01793453, 0.282353, 1, 0, 1,
-0.6234534, 0.1272884, -1.421111, 0.2784314, 1, 0, 1,
-0.6226497, -0.1847615, -0.5763559, 0.2705882, 1, 0, 1,
-0.6205688, 1.383248, 0.186487, 0.2666667, 1, 0, 1,
-0.6169057, 0.7428713, -0.2248913, 0.2588235, 1, 0, 1,
-0.6081699, 0.4839067, -1.238356, 0.254902, 1, 0, 1,
-0.603641, 1.233817, -0.8439607, 0.2470588, 1, 0, 1,
-0.6027079, 0.2026395, -1.115881, 0.2431373, 1, 0, 1,
-0.6022215, 1.558324, 0.005850406, 0.2352941, 1, 0, 1,
-0.6012992, 0.006963998, -4.1877, 0.2313726, 1, 0, 1,
-0.5937665, -2.789604, -2.154582, 0.2235294, 1, 0, 1,
-0.5936403, -1.740847, -3.128566, 0.2196078, 1, 0, 1,
-0.5934995, -1.11846, -2.100303, 0.2117647, 1, 0, 1,
-0.5878883, -0.1890393, -1.48471, 0.2078431, 1, 0, 1,
-0.5867951, -0.1019999, -1.234767, 0.2, 1, 0, 1,
-0.5861764, -0.9844851, -0.5203215, 0.1921569, 1, 0, 1,
-0.5829452, -0.8069522, -3.501342, 0.1882353, 1, 0, 1,
-0.5781985, -1.251275, -2.856386, 0.1803922, 1, 0, 1,
-0.5683037, 1.609507, -0.1408394, 0.1764706, 1, 0, 1,
-0.567969, 0.05386091, 0.4954505, 0.1686275, 1, 0, 1,
-0.5659702, 1.114985, -0.8006104, 0.1647059, 1, 0, 1,
-0.560666, -0.1637515, -0.6572568, 0.1568628, 1, 0, 1,
-0.5605996, 1.160351, -1.135518, 0.1529412, 1, 0, 1,
-0.5595663, -0.218687, -2.280683, 0.145098, 1, 0, 1,
-0.557259, -0.2757187, -0.05088422, 0.1411765, 1, 0, 1,
-0.5559232, -1.546833, -1.99775, 0.1333333, 1, 0, 1,
-0.5557206, -0.6847125, -2.768933, 0.1294118, 1, 0, 1,
-0.5512272, -0.3796757, -2.192093, 0.1215686, 1, 0, 1,
-0.54842, -0.6782601, -3.63758, 0.1176471, 1, 0, 1,
-0.545678, -0.457214, -1.213556, 0.1098039, 1, 0, 1,
-0.541639, 0.08236539, -0.525087, 0.1058824, 1, 0, 1,
-0.5409823, -0.5863409, -1.194003, 0.09803922, 1, 0, 1,
-0.5382301, -0.6735411, -1.905363, 0.09019608, 1, 0, 1,
-0.5317693, 0.01476071, -2.434417, 0.08627451, 1, 0, 1,
-0.5317548, -1.274209, -3.333771, 0.07843138, 1, 0, 1,
-0.5313791, -2.072058, -3.672197, 0.07450981, 1, 0, 1,
-0.5300221, -1.127855, -3.013173, 0.06666667, 1, 0, 1,
-0.5298852, 0.8328951, -0.4353074, 0.0627451, 1, 0, 1,
-0.5262972, -0.6981019, -1.841233, 0.05490196, 1, 0, 1,
-0.5237775, 0.2069842, -1.795506, 0.05098039, 1, 0, 1,
-0.5229163, 0.4500436, -1.323217, 0.04313726, 1, 0, 1,
-0.5208481, -0.5617308, -3.6797, 0.03921569, 1, 0, 1,
-0.5206332, -1.409284, -2.126539, 0.03137255, 1, 0, 1,
-0.5199165, -0.7502467, -4.000159, 0.02745098, 1, 0, 1,
-0.5112929, -0.06365854, -0.743474, 0.01960784, 1, 0, 1,
-0.5110903, -0.3030624, -1.774662, 0.01568628, 1, 0, 1,
-0.5107568, 0.1893673, -0.9197654, 0.007843138, 1, 0, 1,
-0.5011859, 2.130111, 1.32421, 0.003921569, 1, 0, 1,
-0.4988381, 0.0516818, -1.322032, 0, 1, 0.003921569, 1,
-0.4976757, 1.850818, -0.7863947, 0, 1, 0.01176471, 1,
-0.4894821, -0.8151014, -3.603494, 0, 1, 0.01568628, 1,
-0.4846203, -0.05553029, -3.318269, 0, 1, 0.02352941, 1,
-0.4844919, 0.4088703, 0.3685667, 0, 1, 0.02745098, 1,
-0.4838424, 0.1983917, -2.523037, 0, 1, 0.03529412, 1,
-0.4834454, 0.8159242, -0.6103777, 0, 1, 0.03921569, 1,
-0.480008, 0.2750215, -0.4681679, 0, 1, 0.04705882, 1,
-0.4749093, -0.9463587, -1.890614, 0, 1, 0.05098039, 1,
-0.4703301, -0.7698903, -4.153943, 0, 1, 0.05882353, 1,
-0.4684411, -0.08552528, -0.9037168, 0, 1, 0.0627451, 1,
-0.4681586, 0.4315787, -1.771828, 0, 1, 0.07058824, 1,
-0.4669251, -0.6594637, -2.700224, 0, 1, 0.07450981, 1,
-0.4626437, 1.90233, 0.8258711, 0, 1, 0.08235294, 1,
-0.4553444, -0.7985654, -2.499612, 0, 1, 0.08627451, 1,
-0.4473976, 0.4930865, -1.703428, 0, 1, 0.09411765, 1,
-0.4447378, 0.3069889, -1.902181, 0, 1, 0.1019608, 1,
-0.4440108, 2.551369, 0.526292, 0, 1, 0.1058824, 1,
-0.4417002, -2.060374, -2.607596, 0, 1, 0.1137255, 1,
-0.4404847, 0.2271373, -0.4907297, 0, 1, 0.1176471, 1,
-0.4394859, -0.1405096, -3.57554, 0, 1, 0.1254902, 1,
-0.4379633, 1.506869, -0.5451682, 0, 1, 0.1294118, 1,
-0.4361241, 1.196692, -1.388174, 0, 1, 0.1372549, 1,
-0.433424, 0.7779917, -2.173306, 0, 1, 0.1411765, 1,
-0.4305502, 0.5352936, -0.2932435, 0, 1, 0.1490196, 1,
-0.4302499, -1.033857, -3.604433, 0, 1, 0.1529412, 1,
-0.4281466, 1.521387, 1.621378, 0, 1, 0.1607843, 1,
-0.4248698, 0.3544403, -1.547307, 0, 1, 0.1647059, 1,
-0.4182273, 0.5831584, -1.110783, 0, 1, 0.172549, 1,
-0.4159173, 0.1582854, -2.638118, 0, 1, 0.1764706, 1,
-0.4157724, -0.2166515, -3.589609, 0, 1, 0.1843137, 1,
-0.414979, -0.1356241, -4.171205, 0, 1, 0.1882353, 1,
-0.4131427, -2.200787, -3.641661, 0, 1, 0.1960784, 1,
-0.4128703, -0.1602454, -3.374031, 0, 1, 0.2039216, 1,
-0.4122701, -1.714156, -3.174994, 0, 1, 0.2078431, 1,
-0.4100303, 0.08635031, -0.8404803, 0, 1, 0.2156863, 1,
-0.4093972, 0.4760069, 1.311674, 0, 1, 0.2196078, 1,
-0.3976468, 0.8376364, -1.23063, 0, 1, 0.227451, 1,
-0.3905049, 0.7063881, -0.7035978, 0, 1, 0.2313726, 1,
-0.3900766, 1.39381, -1.33033, 0, 1, 0.2392157, 1,
-0.3896738, -0.7933261, -3.206328, 0, 1, 0.2431373, 1,
-0.3871742, -0.3730071, -3.340799, 0, 1, 0.2509804, 1,
-0.3871081, 0.03191398, -0.1396704, 0, 1, 0.254902, 1,
-0.3821524, -2.209353, -2.901422, 0, 1, 0.2627451, 1,
-0.377044, 0.898253, -0.8717058, 0, 1, 0.2666667, 1,
-0.3707185, 0.4101984, -1.24172, 0, 1, 0.2745098, 1,
-0.36957, -0.2514299, -1.055269, 0, 1, 0.2784314, 1,
-0.367477, -0.0058808, -1.964125, 0, 1, 0.2862745, 1,
-0.3666066, -0.1335903, -0.6579611, 0, 1, 0.2901961, 1,
-0.3600635, 0.06120141, -0.3525276, 0, 1, 0.2980392, 1,
-0.3573377, 0.1095793, -2.029444, 0, 1, 0.3058824, 1,
-0.3560152, 0.3846919, -2.339541, 0, 1, 0.3098039, 1,
-0.355918, -0.4105184, -1.872282, 0, 1, 0.3176471, 1,
-0.3501049, 0.9924734, 1.063007, 0, 1, 0.3215686, 1,
-0.3467822, 0.1134141, -1.313624, 0, 1, 0.3294118, 1,
-0.3424983, 0.6314656, 0.01521924, 0, 1, 0.3333333, 1,
-0.3407907, 0.6391487, 0.1133724, 0, 1, 0.3411765, 1,
-0.3404511, 1.233365, -2.466261, 0, 1, 0.345098, 1,
-0.3399378, -0.1850823, -1.535814, 0, 1, 0.3529412, 1,
-0.3393018, 0.9298967, -0.5586741, 0, 1, 0.3568628, 1,
-0.3366873, -0.861939, -1.862676, 0, 1, 0.3647059, 1,
-0.336374, -1.616013, -4.375921, 0, 1, 0.3686275, 1,
-0.3361964, -1.864354, -2.064116, 0, 1, 0.3764706, 1,
-0.3312389, 0.8367463, 0.2140308, 0, 1, 0.3803922, 1,
-0.3311034, -0.05924629, -2.568763, 0, 1, 0.3882353, 1,
-0.3302556, 0.06755959, -3.352369, 0, 1, 0.3921569, 1,
-0.327565, -1.661286, -3.069629, 0, 1, 0.4, 1,
-0.3266528, -1.456899, -3.607913, 0, 1, 0.4078431, 1,
-0.3251426, 0.9894695, 0.4761295, 0, 1, 0.4117647, 1,
-0.3217897, 0.8695664, -0.9371067, 0, 1, 0.4196078, 1,
-0.3210454, 0.2960248, -0.4139958, 0, 1, 0.4235294, 1,
-0.3202986, -0.4251115, -1.371557, 0, 1, 0.4313726, 1,
-0.3171094, -0.701678, -3.91275, 0, 1, 0.4352941, 1,
-0.3166538, -0.9044837, -1.752962, 0, 1, 0.4431373, 1,
-0.3141092, -0.2043607, -2.17604, 0, 1, 0.4470588, 1,
-0.3132903, 0.1131686, -0.716359, 0, 1, 0.454902, 1,
-0.3127442, -2.999292, -4.239053, 0, 1, 0.4588235, 1,
-0.3115123, -1.633394, -3.939211, 0, 1, 0.4666667, 1,
-0.3050957, -0.5961027, -3.254906, 0, 1, 0.4705882, 1,
-0.3007544, -0.4367823, -1.977177, 0, 1, 0.4784314, 1,
-0.2953911, -0.48215, -2.85576, 0, 1, 0.4823529, 1,
-0.292836, -1.388157, -1.447343, 0, 1, 0.4901961, 1,
-0.2915553, 1.430017, 1.465495, 0, 1, 0.4941176, 1,
-0.2915205, -0.1313419, -3.013159, 0, 1, 0.5019608, 1,
-0.2881106, -1.359495, -4.3743, 0, 1, 0.509804, 1,
-0.284096, 0.7062956, 0.6661181, 0, 1, 0.5137255, 1,
-0.2825308, -0.9786582, -3.710275, 0, 1, 0.5215687, 1,
-0.281763, 0.2644474, -1.700959, 0, 1, 0.5254902, 1,
-0.2799926, -2.07492, -2.354031, 0, 1, 0.5333334, 1,
-0.2756804, -0.09903165, -1.0713, 0, 1, 0.5372549, 1,
-0.2680422, -0.5214581, -1.866012, 0, 1, 0.5450981, 1,
-0.2660405, -1.243327, -2.503693, 0, 1, 0.5490196, 1,
-0.2632008, -0.5858796, -2.775882, 0, 1, 0.5568628, 1,
-0.2623315, 0.3068903, -0.658963, 0, 1, 0.5607843, 1,
-0.2611522, 0.8086649, -1.666923, 0, 1, 0.5686275, 1,
-0.2606168, 0.4599048, -0.6448248, 0, 1, 0.572549, 1,
-0.2562066, 0.5561299, 0.2687811, 0, 1, 0.5803922, 1,
-0.2546281, -0.1339528, -2.462945, 0, 1, 0.5843138, 1,
-0.25077, 0.2067771, -1.204003, 0, 1, 0.5921569, 1,
-0.2491871, 0.6204425, -1.70681, 0, 1, 0.5960785, 1,
-0.2488306, 0.5186702, -0.2230136, 0, 1, 0.6039216, 1,
-0.2481331, -0.608382, -4.493217, 0, 1, 0.6117647, 1,
-0.2462699, 2.764487, -1.232254, 0, 1, 0.6156863, 1,
-0.245846, -0.7485486, -2.534167, 0, 1, 0.6235294, 1,
-0.2390848, -0.519786, -3.436687, 0, 1, 0.627451, 1,
-0.2351813, -0.8159367, -1.740787, 0, 1, 0.6352941, 1,
-0.2349526, 2.06128, 0.2168393, 0, 1, 0.6392157, 1,
-0.2282037, -2.618049, -1.151714, 0, 1, 0.6470588, 1,
-0.2268634, 1.565592, -0.7476247, 0, 1, 0.6509804, 1,
-0.2258528, 0.9764291, -0.5714548, 0, 1, 0.6588235, 1,
-0.2247663, -0.317313, -3.998362, 0, 1, 0.6627451, 1,
-0.2235637, 1.087426, -2.220819, 0, 1, 0.6705883, 1,
-0.2214581, -0.5038636, -2.677699, 0, 1, 0.6745098, 1,
-0.2212159, 1.416733, 0.6651433, 0, 1, 0.682353, 1,
-0.2196893, 0.4893669, 1.065257, 0, 1, 0.6862745, 1,
-0.2144516, -0.7434641, -2.245987, 0, 1, 0.6941177, 1,
-0.2141386, -0.5863215, -2.646231, 0, 1, 0.7019608, 1,
-0.2123251, 0.8086339, 0.5253464, 0, 1, 0.7058824, 1,
-0.2113746, 1.800571, -0.9846113, 0, 1, 0.7137255, 1,
-0.2089254, 0.4599952, 0.9736221, 0, 1, 0.7176471, 1,
-0.1988649, 2.069879, -1.753414, 0, 1, 0.7254902, 1,
-0.1970896, -0.251286, -2.320319, 0, 1, 0.7294118, 1,
-0.1911677, -1.803374, -2.786961, 0, 1, 0.7372549, 1,
-0.1886829, -0.8806499, -2.926028, 0, 1, 0.7411765, 1,
-0.1790949, -1.16193, -2.753208, 0, 1, 0.7490196, 1,
-0.1774722, 1.065978, 1.070712, 0, 1, 0.7529412, 1,
-0.1770174, -0.9494882, -3.236318, 0, 1, 0.7607843, 1,
-0.1756808, 0.6739088, -0.9855871, 0, 1, 0.7647059, 1,
-0.1747478, -0.1401647, -1.66542, 0, 1, 0.772549, 1,
-0.1664849, 0.02871497, -1.377973, 0, 1, 0.7764706, 1,
-0.165322, -1.238706, -2.060994, 0, 1, 0.7843137, 1,
-0.1601345, -0.9837871, -1.486536, 0, 1, 0.7882353, 1,
-0.1574527, -0.3567716, -3.256279, 0, 1, 0.7960784, 1,
-0.1565732, -1.498294, -3.510827, 0, 1, 0.8039216, 1,
-0.1561046, 1.792621, 2.046262, 0, 1, 0.8078431, 1,
-0.156013, -0.4201934, -2.487359, 0, 1, 0.8156863, 1,
-0.1536567, -1.588941, -2.405618, 0, 1, 0.8196079, 1,
-0.153284, 0.7527876, -0.4462352, 0, 1, 0.827451, 1,
-0.1531528, -0.02324891, -1.077224, 0, 1, 0.8313726, 1,
-0.1518085, -0.6237181, -2.55249, 0, 1, 0.8392157, 1,
-0.1505098, -0.1041936, -1.986777, 0, 1, 0.8431373, 1,
-0.1503019, -0.5595782, -4.689128, 0, 1, 0.8509804, 1,
-0.1420487, -0.1856073, -2.482999, 0, 1, 0.854902, 1,
-0.141094, -1.179004, -3.256561, 0, 1, 0.8627451, 1,
-0.1408243, -0.3611339, -3.274789, 0, 1, 0.8666667, 1,
-0.1368135, -0.581761, -3.467669, 0, 1, 0.8745098, 1,
-0.1366323, -0.7698057, -2.093845, 0, 1, 0.8784314, 1,
-0.1310808, -0.2472744, -4.135376, 0, 1, 0.8862745, 1,
-0.1310575, -0.3463567, -0.3113723, 0, 1, 0.8901961, 1,
-0.1260599, 0.8158063, -0.9586151, 0, 1, 0.8980392, 1,
-0.1237299, -0.3044356, -1.789474, 0, 1, 0.9058824, 1,
-0.1228329, -1.410398, -3.687838, 0, 1, 0.9098039, 1,
-0.1202688, 1.054559, 1.434558, 0, 1, 0.9176471, 1,
-0.1189831, -0.1652644, -2.732445, 0, 1, 0.9215686, 1,
-0.1187297, -1.599351, -2.415153, 0, 1, 0.9294118, 1,
-0.1184297, 0.5176167, -0.5812289, 0, 1, 0.9333333, 1,
-0.1151822, -0.7092844, -3.960881, 0, 1, 0.9411765, 1,
-0.1136573, 0.1969753, -0.5183573, 0, 1, 0.945098, 1,
-0.1128451, -1.606051, -3.228672, 0, 1, 0.9529412, 1,
-0.1058149, -0.131971, -2.438046, 0, 1, 0.9568627, 1,
-0.1045534, -1.472469, -3.64294, 0, 1, 0.9647059, 1,
-0.1026713, -0.8218443, -2.375642, 0, 1, 0.9686275, 1,
-0.1019683, -1.371075, -3.858434, 0, 1, 0.9764706, 1,
-0.09756505, 2.647977, -0.8546459, 0, 1, 0.9803922, 1,
-0.09124573, -0.1007626, -2.852771, 0, 1, 0.9882353, 1,
-0.0863518, -0.08455189, -1.904404, 0, 1, 0.9921569, 1,
-0.08296303, 0.5211242, 0.2078051, 0, 1, 1, 1,
-0.08119588, 0.999068, 1.474413, 0, 0.9921569, 1, 1,
-0.08093852, 1.094952, 0.3851976, 0, 0.9882353, 1, 1,
-0.07481808, 1.02239, -1.34023, 0, 0.9803922, 1, 1,
-0.07480267, 0.5937381, -0.6526841, 0, 0.9764706, 1, 1,
-0.07440683, 1.398798, -0.5254199, 0, 0.9686275, 1, 1,
-0.06345639, 0.9579543, 0.8878905, 0, 0.9647059, 1, 1,
-0.05731725, -0.4513561, -4.901746, 0, 0.9568627, 1, 1,
-0.05613892, -0.476771, -3.699507, 0, 0.9529412, 1, 1,
-0.05183139, 0.273644, -1.124224, 0, 0.945098, 1, 1,
-0.05134312, -0.4772891, -3.989386, 0, 0.9411765, 1, 1,
-0.05012907, -2.509043, -1.741393, 0, 0.9333333, 1, 1,
-0.04496807, -1.425476, -2.287043, 0, 0.9294118, 1, 1,
-0.0356403, 1.859955, -0.830089, 0, 0.9215686, 1, 1,
-0.03360466, -0.4398418, -3.670873, 0, 0.9176471, 1, 1,
-0.03339056, 0.6923535, 0.8449668, 0, 0.9098039, 1, 1,
-0.02414243, 0.08287119, -0.2620015, 0, 0.9058824, 1, 1,
-0.02333118, -0.2001287, -2.899189, 0, 0.8980392, 1, 1,
-0.02148648, -0.6100261, -3.265848, 0, 0.8901961, 1, 1,
-0.02143981, 1.142652, 1.596461, 0, 0.8862745, 1, 1,
-0.017049, -0.07743244, -3.819235, 0, 0.8784314, 1, 1,
-0.01694253, -0.2308454, -2.734992, 0, 0.8745098, 1, 1,
-0.01656308, -0.2160969, -3.636142, 0, 0.8666667, 1, 1,
-0.01202386, -1.077395, -2.839545, 0, 0.8627451, 1, 1,
-0.01186148, 0.273575, -0.5163898, 0, 0.854902, 1, 1,
-0.01044741, 2.308468, -0.5761035, 0, 0.8509804, 1, 1,
-0.007225784, -1.303859, -2.449207, 0, 0.8431373, 1, 1,
-0.006263034, -0.1855375, -2.411073, 0, 0.8392157, 1, 1,
-0.002217274, 1.227489, 0.3307524, 0, 0.8313726, 1, 1,
0.001944748, 0.2841701, -0.6092667, 0, 0.827451, 1, 1,
0.002332811, -1.447336, 3.514753, 0, 0.8196079, 1, 1,
0.007118836, -1.289021, 3.062748, 0, 0.8156863, 1, 1,
0.007141616, -0.6578422, 3.798954, 0, 0.8078431, 1, 1,
0.007281105, 0.5470455, -0.01101031, 0, 0.8039216, 1, 1,
0.007799726, -0.1143946, 3.887615, 0, 0.7960784, 1, 1,
0.01036769, 0.8594447, -0.9527407, 0, 0.7882353, 1, 1,
0.0106794, -0.2545712, 4.320783, 0, 0.7843137, 1, 1,
0.01406577, 1.164912, 0.1923794, 0, 0.7764706, 1, 1,
0.01532204, -1.04542, 2.462188, 0, 0.772549, 1, 1,
0.016661, 0.6887251, 1.553695, 0, 0.7647059, 1, 1,
0.01797907, -0.3121598, 3.66514, 0, 0.7607843, 1, 1,
0.01801537, 0.1622342, -0.2942945, 0, 0.7529412, 1, 1,
0.01841756, -1.494933, 2.63077, 0, 0.7490196, 1, 1,
0.01964333, 0.0225588, 0.2446127, 0, 0.7411765, 1, 1,
0.01996129, 0.7725842, 0.2300635, 0, 0.7372549, 1, 1,
0.02561113, -1.207478, 1.844028, 0, 0.7294118, 1, 1,
0.02603001, 0.7831542, 1.164645, 0, 0.7254902, 1, 1,
0.03450425, -1.599409, 1.888576, 0, 0.7176471, 1, 1,
0.03469168, 1.013037, 0.2327297, 0, 0.7137255, 1, 1,
0.03715752, 0.2129801, -0.9611689, 0, 0.7058824, 1, 1,
0.04086549, -0.1099915, 1.592498, 0, 0.6980392, 1, 1,
0.04507636, 0.6688918, -0.331432, 0, 0.6941177, 1, 1,
0.05015341, 0.07736862, 1.603174, 0, 0.6862745, 1, 1,
0.05285955, 0.329331, 1.808625, 0, 0.682353, 1, 1,
0.05376855, 1.042663, -0.132455, 0, 0.6745098, 1, 1,
0.0545433, 0.04805818, 1.82525, 0, 0.6705883, 1, 1,
0.05837136, 1.107587, -0.4682607, 0, 0.6627451, 1, 1,
0.06334173, 1.689578, -1.962862, 0, 0.6588235, 1, 1,
0.07087585, 0.6829728, 0.2124832, 0, 0.6509804, 1, 1,
0.07152233, 1.396162, -1.208926, 0, 0.6470588, 1, 1,
0.07499008, -0.07447891, 3.344767, 0, 0.6392157, 1, 1,
0.07763183, 0.1521328, 1.494804, 0, 0.6352941, 1, 1,
0.08082096, 0.4078178, 0.4336394, 0, 0.627451, 1, 1,
0.08181757, 0.2048012, 1.721659, 0, 0.6235294, 1, 1,
0.0863744, 0.7667529, 1.053273, 0, 0.6156863, 1, 1,
0.09000739, -1.183325, 2.997561, 0, 0.6117647, 1, 1,
0.09472503, -0.1126876, 1.635599, 0, 0.6039216, 1, 1,
0.100597, 1.725326, -1.127722, 0, 0.5960785, 1, 1,
0.1011639, 0.367775, 0.5303333, 0, 0.5921569, 1, 1,
0.1014322, 0.677471, 0.9905933, 0, 0.5843138, 1, 1,
0.1048679, -0.447569, 5.923111, 0, 0.5803922, 1, 1,
0.1064168, 1.189968, -0.6260597, 0, 0.572549, 1, 1,
0.1108608, 0.4481291, -0.2807478, 0, 0.5686275, 1, 1,
0.1116916, -0.4277633, 2.205943, 0, 0.5607843, 1, 1,
0.1127685, -0.2344033, 2.236012, 0, 0.5568628, 1, 1,
0.1207046, 2.409497, 0.7546463, 0, 0.5490196, 1, 1,
0.1221226, -1.825499, 1.286516, 0, 0.5450981, 1, 1,
0.1255274, 0.1033558, 0.8613642, 0, 0.5372549, 1, 1,
0.1352267, -0.7713179, 2.38553, 0, 0.5333334, 1, 1,
0.1352414, -0.2952157, 2.750571, 0, 0.5254902, 1, 1,
0.1371815, 0.5081574, -1.148945, 0, 0.5215687, 1, 1,
0.1381593, -0.2337879, 2.07382, 0, 0.5137255, 1, 1,
0.1385773, 0.0847024, 0.2543835, 0, 0.509804, 1, 1,
0.1411863, -0.8280517, 2.143533, 0, 0.5019608, 1, 1,
0.146743, 0.8005715, 0.8592259, 0, 0.4941176, 1, 1,
0.1483742, -1.322962, 2.588224, 0, 0.4901961, 1, 1,
0.1539301, 0.2864917, 1.643614, 0, 0.4823529, 1, 1,
0.1602685, 1.758073, -0.4534564, 0, 0.4784314, 1, 1,
0.1606656, 0.7305157, -2.13512, 0, 0.4705882, 1, 1,
0.16068, -1.276597, 4.341127, 0, 0.4666667, 1, 1,
0.1612296, 1.738677, 0.2993489, 0, 0.4588235, 1, 1,
0.1616139, 0.4554037, 0.2235048, 0, 0.454902, 1, 1,
0.1624041, 0.7892271, 0.8871221, 0, 0.4470588, 1, 1,
0.1633524, 1.240285, -0.9825362, 0, 0.4431373, 1, 1,
0.1640509, 1.183175, 0.2955373, 0, 0.4352941, 1, 1,
0.1661819, -3.028279, 2.336224, 0, 0.4313726, 1, 1,
0.1692035, -0.510506, 2.68006, 0, 0.4235294, 1, 1,
0.1695931, 0.4019703, 1.6027, 0, 0.4196078, 1, 1,
0.1706122, 0.08474973, 0.6943021, 0, 0.4117647, 1, 1,
0.1709553, -0.3699398, 3.093617, 0, 0.4078431, 1, 1,
0.1738346, -0.2486769, 2.429241, 0, 0.4, 1, 1,
0.1745089, -0.286152, 0.9656386, 0, 0.3921569, 1, 1,
0.1756064, 0.1281504, 0.7890863, 0, 0.3882353, 1, 1,
0.1839994, -0.6955423, 2.937415, 0, 0.3803922, 1, 1,
0.1844945, 0.9212368, -0.1779846, 0, 0.3764706, 1, 1,
0.1897251, 0.5786149, 1.675022, 0, 0.3686275, 1, 1,
0.201488, 0.7988744, 0.172117, 0, 0.3647059, 1, 1,
0.2017531, 0.7276962, -1.021563, 0, 0.3568628, 1, 1,
0.2051769, 1.716538, 2.029002, 0, 0.3529412, 1, 1,
0.206482, 1.743913, 0.4577345, 0, 0.345098, 1, 1,
0.2093617, -1.353076, 2.807721, 0, 0.3411765, 1, 1,
0.210956, 0.1252477, 1.028174, 0, 0.3333333, 1, 1,
0.213413, 1.340705, -0.02931272, 0, 0.3294118, 1, 1,
0.2166779, -1.736393, 3.949706, 0, 0.3215686, 1, 1,
0.2174202, 0.5370159, 1.652618, 0, 0.3176471, 1, 1,
0.2181732, -1.874601, 2.280588, 0, 0.3098039, 1, 1,
0.2186692, 0.3915694, -0.2484348, 0, 0.3058824, 1, 1,
0.2187466, -1.842288, 0.2684336, 0, 0.2980392, 1, 1,
0.2229719, 0.9361889, 0.9963013, 0, 0.2901961, 1, 1,
0.2289888, 1.243096, -0.01710366, 0, 0.2862745, 1, 1,
0.234033, -0.6749386, 3.129194, 0, 0.2784314, 1, 1,
0.2365224, -2.133587, 2.708991, 0, 0.2745098, 1, 1,
0.2381702, -0.2825756, 2.390071, 0, 0.2666667, 1, 1,
0.2431489, -0.2702083, 1.154948, 0, 0.2627451, 1, 1,
0.2449447, -0.7596785, 3.189737, 0, 0.254902, 1, 1,
0.2460743, 0.4762881, 1.333047, 0, 0.2509804, 1, 1,
0.24796, -1.00709, 2.923544, 0, 0.2431373, 1, 1,
0.2570109, 0.2357262, 2.532964, 0, 0.2392157, 1, 1,
0.2572426, -0.3508222, 3.304658, 0, 0.2313726, 1, 1,
0.2597843, -1.22374, 2.162888, 0, 0.227451, 1, 1,
0.260161, -0.8928659, 1.733366, 0, 0.2196078, 1, 1,
0.2611189, 0.02753353, 3.307143, 0, 0.2156863, 1, 1,
0.2621079, -0.8455912, 1.234613, 0, 0.2078431, 1, 1,
0.2628555, -0.3311609, 3.580646, 0, 0.2039216, 1, 1,
0.2630892, 0.9396393, 1.804175, 0, 0.1960784, 1, 1,
0.2648056, -0.6802948, 2.629694, 0, 0.1882353, 1, 1,
0.2691962, 0.1371322, 0.5736077, 0, 0.1843137, 1, 1,
0.2706377, 1.010771, 1.345037, 0, 0.1764706, 1, 1,
0.2730117, -0.5911973, 2.848944, 0, 0.172549, 1, 1,
0.2780926, 0.7903396, 2.021658, 0, 0.1647059, 1, 1,
0.2783296, -1.739623, 1.27237, 0, 0.1607843, 1, 1,
0.2798096, 0.3034326, 0.4382873, 0, 0.1529412, 1, 1,
0.2830697, 0.2689805, 0.1966497, 0, 0.1490196, 1, 1,
0.2835875, -0.0001539139, 1.802431, 0, 0.1411765, 1, 1,
0.2840289, 1.481313, -0.6751312, 0, 0.1372549, 1, 1,
0.2842094, 0.4456541, 0.8429681, 0, 0.1294118, 1, 1,
0.2843178, 0.9840558, -1.447573, 0, 0.1254902, 1, 1,
0.284371, -1.332394, 3.930001, 0, 0.1176471, 1, 1,
0.289421, 2.958582, -0.05303348, 0, 0.1137255, 1, 1,
0.2894776, 0.7563679, 2.082551, 0, 0.1058824, 1, 1,
0.2915426, 0.3403707, 0.5603104, 0, 0.09803922, 1, 1,
0.2935337, 1.222903, 1.951333, 0, 0.09411765, 1, 1,
0.2993529, -0.4923779, 3.443873, 0, 0.08627451, 1, 1,
0.3031904, -0.2543877, 0.4787148, 0, 0.08235294, 1, 1,
0.3091911, 1.639077, 1.275245, 0, 0.07450981, 1, 1,
0.3097201, -1.421, 3.797581, 0, 0.07058824, 1, 1,
0.3197996, -3.476929, 2.236809, 0, 0.0627451, 1, 1,
0.3267293, 0.6846923, 1.348321, 0, 0.05882353, 1, 1,
0.3268971, 2.267694, -0.7768489, 0, 0.05098039, 1, 1,
0.3275624, -0.4181746, 1.317961, 0, 0.04705882, 1, 1,
0.3317366, 1.09309, 0.8638128, 0, 0.03921569, 1, 1,
0.3350033, 0.4823451, 0.6334814, 0, 0.03529412, 1, 1,
0.3350602, 1.037565, 1.23389, 0, 0.02745098, 1, 1,
0.3364337, 0.6687976, 0.3638454, 0, 0.02352941, 1, 1,
0.3389517, 0.4503358, 1.031953, 0, 0.01568628, 1, 1,
0.339028, -1.933219, 2.688893, 0, 0.01176471, 1, 1,
0.3471424, -0.2196388, 2.877057, 0, 0.003921569, 1, 1,
0.3535812, -0.5680324, 2.355442, 0.003921569, 0, 1, 1,
0.3538981, 0.1895421, 1.714385, 0.007843138, 0, 1, 1,
0.3553107, 1.54533, -0.3681045, 0.01568628, 0, 1, 1,
0.3665263, -0.243788, 2.476858, 0.01960784, 0, 1, 1,
0.3682423, 1.4719, 1.644099, 0.02745098, 0, 1, 1,
0.3729667, 1.89042, -0.8588588, 0.03137255, 0, 1, 1,
0.3733329, -0.9699951, 1.139288, 0.03921569, 0, 1, 1,
0.3752136, 0.1826915, 1.914095, 0.04313726, 0, 1, 1,
0.382374, -1.159987, 4.297465, 0.05098039, 0, 1, 1,
0.3825359, 0.4620342, 1.228045, 0.05490196, 0, 1, 1,
0.3841286, -0.660065, 3.559596, 0.0627451, 0, 1, 1,
0.3855702, 1.326903, -0.5691376, 0.06666667, 0, 1, 1,
0.3918643, 0.2681134, 1.99556, 0.07450981, 0, 1, 1,
0.3923359, -0.8708155, 3.358958, 0.07843138, 0, 1, 1,
0.3971234, 0.007801722, 1.835647, 0.08627451, 0, 1, 1,
0.3978828, -0.2425205, 1.462122, 0.09019608, 0, 1, 1,
0.4032872, 0.07049764, 3.046828, 0.09803922, 0, 1, 1,
0.4051813, -0.9111412, 2.170349, 0.1058824, 0, 1, 1,
0.4055091, -0.008159326, 3.521859, 0.1098039, 0, 1, 1,
0.4060537, 1.068324, 1.498242, 0.1176471, 0, 1, 1,
0.4070273, 1.670728, 1.266717, 0.1215686, 0, 1, 1,
0.4098815, -0.1270787, 4.475317, 0.1294118, 0, 1, 1,
0.4123777, -0.7616682, 2.996146, 0.1333333, 0, 1, 1,
0.4180998, 0.1732835, 2.299962, 0.1411765, 0, 1, 1,
0.4208218, -0.7271644, 2.767164, 0.145098, 0, 1, 1,
0.4242666, -0.719662, 3.612365, 0.1529412, 0, 1, 1,
0.427096, 1.236998, -1.093683, 0.1568628, 0, 1, 1,
0.427302, -0.5341696, 2.58621, 0.1647059, 0, 1, 1,
0.4351471, -1.439155, 3.170093, 0.1686275, 0, 1, 1,
0.4390912, -0.145829, 1.679793, 0.1764706, 0, 1, 1,
0.4391797, -1.665297, 2.861661, 0.1803922, 0, 1, 1,
0.4476929, 0.7010507, 0.4492782, 0.1882353, 0, 1, 1,
0.4505491, -1.045833, 2.815868, 0.1921569, 0, 1, 1,
0.4514938, -0.3509167, 4.735224, 0.2, 0, 1, 1,
0.4626779, -0.005386841, 1.992541, 0.2078431, 0, 1, 1,
0.4638975, -0.6419667, 3.22016, 0.2117647, 0, 1, 1,
0.4665976, 0.08323904, 0.6317599, 0.2196078, 0, 1, 1,
0.4722707, -0.2065087, 2.902955, 0.2235294, 0, 1, 1,
0.4782313, -2.62071, 3.413075, 0.2313726, 0, 1, 1,
0.4811654, -0.1800289, 2.700613, 0.2352941, 0, 1, 1,
0.4823046, -2.207087, 3.759896, 0.2431373, 0, 1, 1,
0.4828961, 0.7421027, -0.1809034, 0.2470588, 0, 1, 1,
0.4830618, -0.3936124, 2.202717, 0.254902, 0, 1, 1,
0.4844517, 0.6456634, 1.542739, 0.2588235, 0, 1, 1,
0.4885599, -0.6556404, 2.526376, 0.2666667, 0, 1, 1,
0.489045, 1.49253, -0.8124636, 0.2705882, 0, 1, 1,
0.4892665, -0.3267744, 1.817523, 0.2784314, 0, 1, 1,
0.4905146, -0.1427757, 1.75555, 0.282353, 0, 1, 1,
0.4933925, 0.4277365, 1.007777, 0.2901961, 0, 1, 1,
0.4943618, 0.2969912, 1.270049, 0.2941177, 0, 1, 1,
0.4964592, 0.833303, 2.165367, 0.3019608, 0, 1, 1,
0.499005, -0.3657541, 2.38477, 0.3098039, 0, 1, 1,
0.5040415, -0.295422, 1.962397, 0.3137255, 0, 1, 1,
0.5046771, -0.7254488, 2.880336, 0.3215686, 0, 1, 1,
0.5106164, -1.059202, 1.838582, 0.3254902, 0, 1, 1,
0.5123655, 0.8515853, 1.154981, 0.3333333, 0, 1, 1,
0.5133178, -0.1107271, 1.093797, 0.3372549, 0, 1, 1,
0.5135553, -0.1110442, 2.509387, 0.345098, 0, 1, 1,
0.5197548, -1.177747, 2.475013, 0.3490196, 0, 1, 1,
0.5205151, 0.02066406, 0.5152313, 0.3568628, 0, 1, 1,
0.5208734, -0.2456129, 2.646262, 0.3607843, 0, 1, 1,
0.5268949, -1.186205, 3.232068, 0.3686275, 0, 1, 1,
0.5271602, -0.05519807, 0.5361625, 0.372549, 0, 1, 1,
0.5355862, -1.433726, 2.32993, 0.3803922, 0, 1, 1,
0.5378256, 0.6298483, -0.1499166, 0.3843137, 0, 1, 1,
0.5431054, 0.9166543, 1.665593, 0.3921569, 0, 1, 1,
0.5432053, -1.020842, 1.187458, 0.3960784, 0, 1, 1,
0.5436668, 0.6396725, 0.122814, 0.4039216, 0, 1, 1,
0.5450577, -1.649282, 3.114079, 0.4117647, 0, 1, 1,
0.5483965, 0.4753613, 2.399879, 0.4156863, 0, 1, 1,
0.5539325, -0.8494358, 3.433036, 0.4235294, 0, 1, 1,
0.555126, -1.325076, 3.498155, 0.427451, 0, 1, 1,
0.5552408, -0.3863423, 1.956117, 0.4352941, 0, 1, 1,
0.5571052, 0.6058748, 0.4711635, 0.4392157, 0, 1, 1,
0.5589641, -0.8930125, 2.155288, 0.4470588, 0, 1, 1,
0.5606758, -1.409147, 1.694557, 0.4509804, 0, 1, 1,
0.5608959, 0.1101368, 1.37031, 0.4588235, 0, 1, 1,
0.5628884, 0.2284492, 1.830801, 0.4627451, 0, 1, 1,
0.5641884, 0.5323064, 2.242608, 0.4705882, 0, 1, 1,
0.5649834, 1.20921, 0.3208626, 0.4745098, 0, 1, 1,
0.5725042, 0.6661571, 1.144415, 0.4823529, 0, 1, 1,
0.5784259, 1.736261, -0.2737056, 0.4862745, 0, 1, 1,
0.5792657, 0.2858995, 1.520367, 0.4941176, 0, 1, 1,
0.5805044, -1.207985, 2.332394, 0.5019608, 0, 1, 1,
0.5812832, -0.04513613, 2.525587, 0.5058824, 0, 1, 1,
0.5817444, 0.1993545, 0.9857041, 0.5137255, 0, 1, 1,
0.5824782, -0.1661987, 1.308194, 0.5176471, 0, 1, 1,
0.5908166, 0.843259, 0.72162, 0.5254902, 0, 1, 1,
0.5927793, -1.427521, 3.131616, 0.5294118, 0, 1, 1,
0.6014806, 0.3499285, 0.07076425, 0.5372549, 0, 1, 1,
0.6024438, -0.1820406, 1.205066, 0.5411765, 0, 1, 1,
0.6048014, 0.3104116, 2.519517, 0.5490196, 0, 1, 1,
0.6048079, 1.010816, 0.1025547, 0.5529412, 0, 1, 1,
0.6069694, -0.3695851, 2.189915, 0.5607843, 0, 1, 1,
0.6111948, -0.02803738, 1.682549, 0.5647059, 0, 1, 1,
0.611561, 0.2418139, 0.6194651, 0.572549, 0, 1, 1,
0.6124262, 0.40767, 1.053813, 0.5764706, 0, 1, 1,
0.6136689, -0.7589286, 2.766888, 0.5843138, 0, 1, 1,
0.6175293, 0.239233, 1.903339, 0.5882353, 0, 1, 1,
0.6239497, -0.224818, 2.393575, 0.5960785, 0, 1, 1,
0.6265481, -0.1772603, 0.6692038, 0.6039216, 0, 1, 1,
0.6281472, -1.032174, 1.835154, 0.6078432, 0, 1, 1,
0.6339002, 0.06080233, 3.081602, 0.6156863, 0, 1, 1,
0.6376439, 1.57697, 0.1373834, 0.6196079, 0, 1, 1,
0.6395243, -0.1634674, 0.3160779, 0.627451, 0, 1, 1,
0.6416253, -1.202386, 2.350749, 0.6313726, 0, 1, 1,
0.6425546, 0.2390389, 0.5889782, 0.6392157, 0, 1, 1,
0.6452855, -1.539723, 3.780797, 0.6431373, 0, 1, 1,
0.6495699, -0.2246555, 1.345669, 0.6509804, 0, 1, 1,
0.6541947, -0.2542893, 2.550505, 0.654902, 0, 1, 1,
0.654745, 0.1247406, 0.9509784, 0.6627451, 0, 1, 1,
0.6561341, -0.2992198, 2.520985, 0.6666667, 0, 1, 1,
0.6575797, 0.3475166, 0.4721683, 0.6745098, 0, 1, 1,
0.6686698, -0.3691532, 1.609914, 0.6784314, 0, 1, 1,
0.6757905, 0.2673482, 1.301154, 0.6862745, 0, 1, 1,
0.67685, -1.496334, 2.583164, 0.6901961, 0, 1, 1,
0.6816148, -0.489308, 1.355256, 0.6980392, 0, 1, 1,
0.6824734, -0.4752675, 2.361951, 0.7058824, 0, 1, 1,
0.6868931, -1.073409, 3.738483, 0.7098039, 0, 1, 1,
0.6892741, -0.1615739, 0.3938708, 0.7176471, 0, 1, 1,
0.6930667, -0.118232, 1.403538, 0.7215686, 0, 1, 1,
0.6963337, 0.7852835, 1.091804, 0.7294118, 0, 1, 1,
0.6998454, 0.7754441, 0.1531066, 0.7333333, 0, 1, 1,
0.700942, -0.5672445, -0.1346977, 0.7411765, 0, 1, 1,
0.7009613, 1.472098, -0.2847226, 0.7450981, 0, 1, 1,
0.7078827, -0.5466447, 0.9717782, 0.7529412, 0, 1, 1,
0.7080311, -2.423158, 3.082469, 0.7568628, 0, 1, 1,
0.7123998, 0.5236211, 0.5655916, 0.7647059, 0, 1, 1,
0.7198188, 0.4252369, 1.424209, 0.7686275, 0, 1, 1,
0.7229473, 1.014449, 0.7626656, 0.7764706, 0, 1, 1,
0.7243481, 0.3967146, 1.166684, 0.7803922, 0, 1, 1,
0.7265357, 0.7977269, 3.393518, 0.7882353, 0, 1, 1,
0.7272743, -0.168364, 1.679013, 0.7921569, 0, 1, 1,
0.7346119, 0.3824925, 2.294678, 0.8, 0, 1, 1,
0.7367276, 0.7396011, -0.421145, 0.8078431, 0, 1, 1,
0.738483, -0.3393634, 2.457137, 0.8117647, 0, 1, 1,
0.7396998, -0.103255, 1.90827, 0.8196079, 0, 1, 1,
0.74241, 0.540132, 1.246327, 0.8235294, 0, 1, 1,
0.7474675, 1.449803, -2.994232, 0.8313726, 0, 1, 1,
0.7543983, 1.359782, 1.844483, 0.8352941, 0, 1, 1,
0.7574963, -0.1102947, 2.01645, 0.8431373, 0, 1, 1,
0.7596468, 1.407103, 2.015253, 0.8470588, 0, 1, 1,
0.7596954, 0.2144755, 1.019683, 0.854902, 0, 1, 1,
0.7626899, 0.2463295, -0.6084894, 0.8588235, 0, 1, 1,
0.7715904, -0.7169517, 1.952585, 0.8666667, 0, 1, 1,
0.7719841, -0.107928, 0.2369671, 0.8705882, 0, 1, 1,
0.7755942, -2.02144, 3.196524, 0.8784314, 0, 1, 1,
0.7837306, -0.6581751, 1.901635, 0.8823529, 0, 1, 1,
0.7842199, 0.1229766, 0.305692, 0.8901961, 0, 1, 1,
0.7874054, -1.471596, 3.240774, 0.8941177, 0, 1, 1,
0.7878078, -1.383228, 2.27046, 0.9019608, 0, 1, 1,
0.790538, 0.2224862, 1.052033, 0.9098039, 0, 1, 1,
0.7911319, -0.4941013, 0.9265839, 0.9137255, 0, 1, 1,
0.7918163, -1.716436, 2.597122, 0.9215686, 0, 1, 1,
0.7918688, 0.4420477, 0.9740286, 0.9254902, 0, 1, 1,
0.7952835, 0.4774686, 0.9820163, 0.9333333, 0, 1, 1,
0.8040069, 0.4662104, 0.4182455, 0.9372549, 0, 1, 1,
0.8045698, 0.7270813, 0.5078249, 0.945098, 0, 1, 1,
0.808473, -0.3621233, 3.172899, 0.9490196, 0, 1, 1,
0.8093364, 0.3250897, 0.3225223, 0.9568627, 0, 1, 1,
0.8114771, 0.7731215, 0.5547988, 0.9607843, 0, 1, 1,
0.8146798, 0.6067454, 2.367606, 0.9686275, 0, 1, 1,
0.8220432, 0.9439409, 0.6002995, 0.972549, 0, 1, 1,
0.8252658, 1.269918, -0.003599979, 0.9803922, 0, 1, 1,
0.8272316, -0.2408711, 2.238694, 0.9843137, 0, 1, 1,
0.8289899, 0.1029622, 0.3463994, 0.9921569, 0, 1, 1,
0.8303791, -0.5607035, 2.804054, 0.9960784, 0, 1, 1,
0.8363593, 0.8395146, 2.449602, 1, 0, 0.9960784, 1,
0.8373663, 0.3996412, 4.237462, 1, 0, 0.9882353, 1,
0.839935, 0.1291423, 1.922583, 1, 0, 0.9843137, 1,
0.8459203, -1.142904, 2.765724, 1, 0, 0.9764706, 1,
0.8636073, 0.1403175, 2.690275, 1, 0, 0.972549, 1,
0.8686823, -0.6391132, 2.188139, 1, 0, 0.9647059, 1,
0.8702672, -0.3881544, 1.288229, 1, 0, 0.9607843, 1,
0.8716994, -1.245941, 2.044187, 1, 0, 0.9529412, 1,
0.8728732, 0.9855726, 0.7713085, 1, 0, 0.9490196, 1,
0.8759485, -1.998712, 3.077606, 1, 0, 0.9411765, 1,
0.879126, 0.3196386, 2.953686, 1, 0, 0.9372549, 1,
0.8903268, 0.6213464, 1.815516, 1, 0, 0.9294118, 1,
0.8940547, -0.5498629, 1.550567, 1, 0, 0.9254902, 1,
0.8948398, -0.4601704, 2.299628, 1, 0, 0.9176471, 1,
0.9100902, -0.1017542, 4.056984, 1, 0, 0.9137255, 1,
0.9105077, -0.630996, 1.94406, 1, 0, 0.9058824, 1,
0.9110198, 0.5542157, 2.391327, 1, 0, 0.9019608, 1,
0.9249906, 0.3520938, 1.57214, 1, 0, 0.8941177, 1,
0.928721, 1.148933, 2.427409, 1, 0, 0.8862745, 1,
0.9288306, 0.1361875, 1.829147, 1, 0, 0.8823529, 1,
0.9324266, 1.098147, -0.68362, 1, 0, 0.8745098, 1,
0.9368402, -0.5766949, 1.435571, 1, 0, 0.8705882, 1,
0.9382918, -0.9014599, 0.4670819, 1, 0, 0.8627451, 1,
0.9537629, 1.03992, -0.4118132, 1, 0, 0.8588235, 1,
0.9551513, -1.016058, 2.447716, 1, 0, 0.8509804, 1,
0.9569364, -1.511397, 2.50623, 1, 0, 0.8470588, 1,
0.9584501, 0.8493533, -0.170781, 1, 0, 0.8392157, 1,
0.9612278, -0.002099429, 0.5211511, 1, 0, 0.8352941, 1,
0.9619594, -0.2567225, 3.464675, 1, 0, 0.827451, 1,
0.9671013, 0.4355941, 0.3845243, 1, 0, 0.8235294, 1,
0.971487, -0.6460223, 2.5271, 1, 0, 0.8156863, 1,
0.9724165, -0.2057042, 2.098125, 1, 0, 0.8117647, 1,
0.9815233, -0.39581, 2.210609, 1, 0, 0.8039216, 1,
0.9855577, 1.154378, 0.9035034, 1, 0, 0.7960784, 1,
0.9888255, 0.4342478, -0.07480065, 1, 0, 0.7921569, 1,
0.998254, -2.093733, 2.638364, 1, 0, 0.7843137, 1,
1.01039, -1.204634, 3.65458, 1, 0, 0.7803922, 1,
1.0125, 0.271612, 1.217373, 1, 0, 0.772549, 1,
1.020319, 1.593137, 0.577861, 1, 0, 0.7686275, 1,
1.026184, 0.4908125, 1.357989, 1, 0, 0.7607843, 1,
1.026519, 0.1401781, 1.607628, 1, 0, 0.7568628, 1,
1.027469, -1.024379, 3.457894, 1, 0, 0.7490196, 1,
1.032426, -0.1264141, 3.504728, 1, 0, 0.7450981, 1,
1.047327, -0.3054877, 2.516166, 1, 0, 0.7372549, 1,
1.048742, -0.5879924, 1.142369, 1, 0, 0.7333333, 1,
1.052299, -1.108807, 2.30179, 1, 0, 0.7254902, 1,
1.052503, -0.3321232, 2.478267, 1, 0, 0.7215686, 1,
1.057614, 0.1618413, 2.227826, 1, 0, 0.7137255, 1,
1.061344, 1.744653, 2.643762, 1, 0, 0.7098039, 1,
1.064501, 1.23806, 2.036252, 1, 0, 0.7019608, 1,
1.078091, -1.466479, 2.880017, 1, 0, 0.6941177, 1,
1.080665, -1.328279, 3.06643, 1, 0, 0.6901961, 1,
1.082917, -1.090652, 2.150526, 1, 0, 0.682353, 1,
1.086069, 1.08057, -1.066286, 1, 0, 0.6784314, 1,
1.088541, -1.346194, 1.591586, 1, 0, 0.6705883, 1,
1.0908, -2.142231, 1.167761, 1, 0, 0.6666667, 1,
1.091173, 0.8752185, 0.4755187, 1, 0, 0.6588235, 1,
1.111087, 0.5601653, 2.215204, 1, 0, 0.654902, 1,
1.119486, 0.40358, 1.338935, 1, 0, 0.6470588, 1,
1.124467, -0.1383542, 0.8430628, 1, 0, 0.6431373, 1,
1.124762, 0.7190029, -0.1183002, 1, 0, 0.6352941, 1,
1.125011, -0.1956811, -0.3850935, 1, 0, 0.6313726, 1,
1.130497, 0.369886, 1.142567, 1, 0, 0.6235294, 1,
1.130968, 0.9691294, 0.4054015, 1, 0, 0.6196079, 1,
1.154422, 0.8567548, 0.8411895, 1, 0, 0.6117647, 1,
1.16072, -0.7055058, 3.254941, 1, 0, 0.6078432, 1,
1.166117, -1.091783, 2.55448, 1, 0, 0.6, 1,
1.167305, 1.104261, 0.0004215019, 1, 0, 0.5921569, 1,
1.16818, -0.7053433, 3.056185, 1, 0, 0.5882353, 1,
1.168624, 1.112428, 0.7496467, 1, 0, 0.5803922, 1,
1.174544, -0.8297556, 1.995551, 1, 0, 0.5764706, 1,
1.186367, -0.7667387, -0.3728643, 1, 0, 0.5686275, 1,
1.189905, -1.716169, 0.8129138, 1, 0, 0.5647059, 1,
1.191465, -0.1641706, 3.236058, 1, 0, 0.5568628, 1,
1.192959, 2.352487, -0.1867851, 1, 0, 0.5529412, 1,
1.192964, 2.349124, -0.1996962, 1, 0, 0.5450981, 1,
1.198459, -0.438558, 1.711356, 1, 0, 0.5411765, 1,
1.198866, 1.916847, 0.05448424, 1, 0, 0.5333334, 1,
1.20648, 0.2252109, 1.95841, 1, 0, 0.5294118, 1,
1.20695, 1.869583, 0.04081348, 1, 0, 0.5215687, 1,
1.21174, -1.273242, 1.429665, 1, 0, 0.5176471, 1,
1.212419, 2.829142, 0.07708506, 1, 0, 0.509804, 1,
1.213371, -0.5875424, 3.158706, 1, 0, 0.5058824, 1,
1.213949, 0.7363497, 1.695829, 1, 0, 0.4980392, 1,
1.220527, -0.6754932, 0.7003313, 1, 0, 0.4901961, 1,
1.220862, -0.1680703, 1.241947, 1, 0, 0.4862745, 1,
1.22191, 0.1204808, 2.271522, 1, 0, 0.4784314, 1,
1.22591, 0.4552744, 1.853038, 1, 0, 0.4745098, 1,
1.24868, 0.297998, 0.1984477, 1, 0, 0.4666667, 1,
1.253531, -1.256286, 1.553234, 1, 0, 0.4627451, 1,
1.267475, 0.3268341, 2.905977, 1, 0, 0.454902, 1,
1.278309, -0.2017252, 3.136927, 1, 0, 0.4509804, 1,
1.282962, -1.188457, 3.730943, 1, 0, 0.4431373, 1,
1.283392, 0.3536224, 0.6736611, 1, 0, 0.4392157, 1,
1.284045, -1.494109, 0.2078229, 1, 0, 0.4313726, 1,
1.284511, 1.576622, 0.6898177, 1, 0, 0.427451, 1,
1.307965, -1.291176, 0.4077428, 1, 0, 0.4196078, 1,
1.308859, -1.023998, 3.170766, 1, 0, 0.4156863, 1,
1.30891, 0.5551266, 1.53979, 1, 0, 0.4078431, 1,
1.311912, -0.5879581, 1.474669, 1, 0, 0.4039216, 1,
1.319201, 0.3859226, 1.533239, 1, 0, 0.3960784, 1,
1.322153, -0.8808623, 1.43812, 1, 0, 0.3882353, 1,
1.329932, -0.1469086, 2.285371, 1, 0, 0.3843137, 1,
1.338799, 0.9510276, 0.4903969, 1, 0, 0.3764706, 1,
1.340237, 0.1147573, -0.1505747, 1, 0, 0.372549, 1,
1.341377, -0.3363344, 2.850699, 1, 0, 0.3647059, 1,
1.344756, -2.080967, 3.084295, 1, 0, 0.3607843, 1,
1.366615, -1.864324, 3.298163, 1, 0, 0.3529412, 1,
1.374972, -0.8348337, 3.026484, 1, 0, 0.3490196, 1,
1.377815, -1.134117, 0.6175334, 1, 0, 0.3411765, 1,
1.384834, 0.1024771, 1.23423, 1, 0, 0.3372549, 1,
1.397772, -0.1915595, 2.078823, 1, 0, 0.3294118, 1,
1.403807, 1.11051, 2.888077, 1, 0, 0.3254902, 1,
1.405578, 0.7551084, 2.19694, 1, 0, 0.3176471, 1,
1.411374, 0.130911, 0.5619041, 1, 0, 0.3137255, 1,
1.413863, -0.6915805, 1.858596, 1, 0, 0.3058824, 1,
1.421795, 0.5426995, 0.5494384, 1, 0, 0.2980392, 1,
1.434328, 0.9204782, 0.07023392, 1, 0, 0.2941177, 1,
1.456989, 0.7869515, 0.8274601, 1, 0, 0.2862745, 1,
1.481558, -0.3828278, 2.74397, 1, 0, 0.282353, 1,
1.481884, -0.8991213, 1.498755, 1, 0, 0.2745098, 1,
1.484853, 0.8156437, 0.06815136, 1, 0, 0.2705882, 1,
1.521466, 0.02417442, 1.502957, 1, 0, 0.2627451, 1,
1.530571, 0.06538443, 0.5787824, 1, 0, 0.2588235, 1,
1.532035, -0.8052559, 1.690627, 1, 0, 0.2509804, 1,
1.560476, -0.8034967, 4.15527, 1, 0, 0.2470588, 1,
1.562573, -0.2508299, 1.3482, 1, 0, 0.2392157, 1,
1.601892, -1.066235, 2.281336, 1, 0, 0.2352941, 1,
1.606595, -0.6758959, 2.495854, 1, 0, 0.227451, 1,
1.620516, 2.053881, 0.4497379, 1, 0, 0.2235294, 1,
1.63274, -1.024237, 1.646437, 1, 0, 0.2156863, 1,
1.690432, -0.7316176, 1.972464, 1, 0, 0.2117647, 1,
1.717663, 1.57243, 1.316593, 1, 0, 0.2039216, 1,
1.726234, -0.7555286, 3.697443, 1, 0, 0.1960784, 1,
1.728015, 0.9199879, 0.1823855, 1, 0, 0.1921569, 1,
1.742409, -0.936833, 1.325689, 1, 0, 0.1843137, 1,
1.758223, -0.8713664, 2.235769, 1, 0, 0.1803922, 1,
1.804839, 0.4453938, 0.2211939, 1, 0, 0.172549, 1,
1.806827, -0.1820017, 1.422781, 1, 0, 0.1686275, 1,
1.827406, -0.2818343, 0.6029561, 1, 0, 0.1607843, 1,
1.829169, -0.159476, 1.728598, 1, 0, 0.1568628, 1,
1.834781, -2.322822, 2.78611, 1, 0, 0.1490196, 1,
1.864856, 0.4295949, 0.7541256, 1, 0, 0.145098, 1,
1.866025, 0.330106, 1.982454, 1, 0, 0.1372549, 1,
1.873364, -0.6231045, 1.533509, 1, 0, 0.1333333, 1,
1.877909, -2.079506, 3.05949, 1, 0, 0.1254902, 1,
1.88252, 2.127321, 1.971341, 1, 0, 0.1215686, 1,
1.952106, -0.1449107, 3.572845, 1, 0, 0.1137255, 1,
2.035944, 0.2356326, 0.6439877, 1, 0, 0.1098039, 1,
2.087285, -0.3876064, 0.8372731, 1, 0, 0.1019608, 1,
2.106457, 1.82482, 2.375313, 1, 0, 0.09411765, 1,
2.166057, -0.6623287, 1.285593, 1, 0, 0.09019608, 1,
2.176081, -0.4723084, 1.41903, 1, 0, 0.08235294, 1,
2.192575, 0.3123138, 1.845299, 1, 0, 0.07843138, 1,
2.210524, 0.04312321, 0.9586784, 1, 0, 0.07058824, 1,
2.257507, -0.5505973, 2.884692, 1, 0, 0.06666667, 1,
2.326938, 0.2750922, 1.992701, 1, 0, 0.05882353, 1,
2.433372, -0.726519, 1.598053, 1, 0, 0.05490196, 1,
2.51244, 0.5845112, 1.099284, 1, 0, 0.04705882, 1,
2.558245, 0.1883638, 2.362543, 1, 0, 0.04313726, 1,
2.662159, -0.6271428, 3.141273, 1, 0, 0.03529412, 1,
2.662945, 0.2309349, 3.052667, 1, 0, 0.03137255, 1,
2.868268, 0.3268594, 0.9943049, 1, 0, 0.02352941, 1,
2.943344, 0.6914371, 3.586428, 1, 0, 0.01960784, 1,
3.033648, -0.4766762, 1.478117, 1, 0, 0.01176471, 1,
3.057652, -0.5335472, 0.7562587, 1, 0, 0.007843138, 1
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
0.04494464, -4.567748, -6.736559, 0, -0.5, 0.5, 0.5,
0.04494464, -4.567748, -6.736559, 1, -0.5, 0.5, 0.5,
0.04494464, -4.567748, -6.736559, 1, 1.5, 0.5, 0.5,
0.04494464, -4.567748, -6.736559, 0, 1.5, 0.5, 0.5
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
-3.98907, -0.2591734, -6.736559, 0, -0.5, 0.5, 0.5,
-3.98907, -0.2591734, -6.736559, 1, -0.5, 0.5, 0.5,
-3.98907, -0.2591734, -6.736559, 1, 1.5, 0.5, 0.5,
-3.98907, -0.2591734, -6.736559, 0, 1.5, 0.5, 0.5
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
-3.98907, -4.567748, 0.5106828, 0, -0.5, 0.5, 0.5,
-3.98907, -4.567748, 0.5106828, 1, -0.5, 0.5, 0.5,
-3.98907, -4.567748, 0.5106828, 1, 1.5, 0.5, 0.5,
-3.98907, -4.567748, 0.5106828, 0, 1.5, 0.5, 0.5
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
-2, -3.573461, -5.064119,
3, -3.573461, -5.064119,
-2, -3.573461, -5.064119,
-2, -3.739176, -5.342859,
-1, -3.573461, -5.064119,
-1, -3.739176, -5.342859,
0, -3.573461, -5.064119,
0, -3.739176, -5.342859,
1, -3.573461, -5.064119,
1, -3.739176, -5.342859,
2, -3.573461, -5.064119,
2, -3.739176, -5.342859,
3, -3.573461, -5.064119,
3, -3.739176, -5.342859
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
-2, -4.070605, -5.900339, 0, -0.5, 0.5, 0.5,
-2, -4.070605, -5.900339, 1, -0.5, 0.5, 0.5,
-2, -4.070605, -5.900339, 1, 1.5, 0.5, 0.5,
-2, -4.070605, -5.900339, 0, 1.5, 0.5, 0.5,
-1, -4.070605, -5.900339, 0, -0.5, 0.5, 0.5,
-1, -4.070605, -5.900339, 1, -0.5, 0.5, 0.5,
-1, -4.070605, -5.900339, 1, 1.5, 0.5, 0.5,
-1, -4.070605, -5.900339, 0, 1.5, 0.5, 0.5,
0, -4.070605, -5.900339, 0, -0.5, 0.5, 0.5,
0, -4.070605, -5.900339, 1, -0.5, 0.5, 0.5,
0, -4.070605, -5.900339, 1, 1.5, 0.5, 0.5,
0, -4.070605, -5.900339, 0, 1.5, 0.5, 0.5,
1, -4.070605, -5.900339, 0, -0.5, 0.5, 0.5,
1, -4.070605, -5.900339, 1, -0.5, 0.5, 0.5,
1, -4.070605, -5.900339, 1, 1.5, 0.5, 0.5,
1, -4.070605, -5.900339, 0, 1.5, 0.5, 0.5,
2, -4.070605, -5.900339, 0, -0.5, 0.5, 0.5,
2, -4.070605, -5.900339, 1, -0.5, 0.5, 0.5,
2, -4.070605, -5.900339, 1, 1.5, 0.5, 0.5,
2, -4.070605, -5.900339, 0, 1.5, 0.5, 0.5,
3, -4.070605, -5.900339, 0, -0.5, 0.5, 0.5,
3, -4.070605, -5.900339, 1, -0.5, 0.5, 0.5,
3, -4.070605, -5.900339, 1, 1.5, 0.5, 0.5,
3, -4.070605, -5.900339, 0, 1.5, 0.5, 0.5
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
-3.058144, -3, -5.064119,
-3.058144, 2, -5.064119,
-3.058144, -3, -5.064119,
-3.213298, -3, -5.342859,
-3.058144, -2, -5.064119,
-3.213298, -2, -5.342859,
-3.058144, -1, -5.064119,
-3.213298, -1, -5.342859,
-3.058144, 0, -5.064119,
-3.213298, 0, -5.342859,
-3.058144, 1, -5.064119,
-3.213298, 1, -5.342859,
-3.058144, 2, -5.064119,
-3.213298, 2, -5.342859
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
-3.523607, -3, -5.900339, 0, -0.5, 0.5, 0.5,
-3.523607, -3, -5.900339, 1, -0.5, 0.5, 0.5,
-3.523607, -3, -5.900339, 1, 1.5, 0.5, 0.5,
-3.523607, -3, -5.900339, 0, 1.5, 0.5, 0.5,
-3.523607, -2, -5.900339, 0, -0.5, 0.5, 0.5,
-3.523607, -2, -5.900339, 1, -0.5, 0.5, 0.5,
-3.523607, -2, -5.900339, 1, 1.5, 0.5, 0.5,
-3.523607, -2, -5.900339, 0, 1.5, 0.5, 0.5,
-3.523607, -1, -5.900339, 0, -0.5, 0.5, 0.5,
-3.523607, -1, -5.900339, 1, -0.5, 0.5, 0.5,
-3.523607, -1, -5.900339, 1, 1.5, 0.5, 0.5,
-3.523607, -1, -5.900339, 0, 1.5, 0.5, 0.5,
-3.523607, 0, -5.900339, 0, -0.5, 0.5, 0.5,
-3.523607, 0, -5.900339, 1, -0.5, 0.5, 0.5,
-3.523607, 0, -5.900339, 1, 1.5, 0.5, 0.5,
-3.523607, 0, -5.900339, 0, 1.5, 0.5, 0.5,
-3.523607, 1, -5.900339, 0, -0.5, 0.5, 0.5,
-3.523607, 1, -5.900339, 1, -0.5, 0.5, 0.5,
-3.523607, 1, -5.900339, 1, 1.5, 0.5, 0.5,
-3.523607, 1, -5.900339, 0, 1.5, 0.5, 0.5,
-3.523607, 2, -5.900339, 0, -0.5, 0.5, 0.5,
-3.523607, 2, -5.900339, 1, -0.5, 0.5, 0.5,
-3.523607, 2, -5.900339, 1, 1.5, 0.5, 0.5,
-3.523607, 2, -5.900339, 0, 1.5, 0.5, 0.5
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
-3.058144, -3.573461, -4,
-3.058144, -3.573461, 4,
-3.058144, -3.573461, -4,
-3.213298, -3.739176, -4,
-3.058144, -3.573461, -2,
-3.213298, -3.739176, -2,
-3.058144, -3.573461, 0,
-3.213298, -3.739176, 0,
-3.058144, -3.573461, 2,
-3.213298, -3.739176, 2,
-3.058144, -3.573461, 4,
-3.213298, -3.739176, 4
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
-3.523607, -4.070605, -4, 0, -0.5, 0.5, 0.5,
-3.523607, -4.070605, -4, 1, -0.5, 0.5, 0.5,
-3.523607, -4.070605, -4, 1, 1.5, 0.5, 0.5,
-3.523607, -4.070605, -4, 0, 1.5, 0.5, 0.5,
-3.523607, -4.070605, -2, 0, -0.5, 0.5, 0.5,
-3.523607, -4.070605, -2, 1, -0.5, 0.5, 0.5,
-3.523607, -4.070605, -2, 1, 1.5, 0.5, 0.5,
-3.523607, -4.070605, -2, 0, 1.5, 0.5, 0.5,
-3.523607, -4.070605, 0, 0, -0.5, 0.5, 0.5,
-3.523607, -4.070605, 0, 1, -0.5, 0.5, 0.5,
-3.523607, -4.070605, 0, 1, 1.5, 0.5, 0.5,
-3.523607, -4.070605, 0, 0, 1.5, 0.5, 0.5,
-3.523607, -4.070605, 2, 0, -0.5, 0.5, 0.5,
-3.523607, -4.070605, 2, 1, -0.5, 0.5, 0.5,
-3.523607, -4.070605, 2, 1, 1.5, 0.5, 0.5,
-3.523607, -4.070605, 2, 0, 1.5, 0.5, 0.5,
-3.523607, -4.070605, 4, 0, -0.5, 0.5, 0.5,
-3.523607, -4.070605, 4, 1, -0.5, 0.5, 0.5,
-3.523607, -4.070605, 4, 1, 1.5, 0.5, 0.5,
-3.523607, -4.070605, 4, 0, 1.5, 0.5, 0.5
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
-3.058144, -3.573461, -5.064119,
-3.058144, 3.055115, -5.064119,
-3.058144, -3.573461, 6.085485,
-3.058144, 3.055115, 6.085485,
-3.058144, -3.573461, -5.064119,
-3.058144, -3.573461, 6.085485,
-3.058144, 3.055115, -5.064119,
-3.058144, 3.055115, 6.085485,
-3.058144, -3.573461, -5.064119,
3.148033, -3.573461, -5.064119,
-3.058144, -3.573461, 6.085485,
3.148033, -3.573461, 6.085485,
-3.058144, 3.055115, -5.064119,
3.148033, 3.055115, -5.064119,
-3.058144, 3.055115, 6.085485,
3.148033, 3.055115, 6.085485,
3.148033, -3.573461, -5.064119,
3.148033, 3.055115, -5.064119,
3.148033, -3.573461, 6.085485,
3.148033, 3.055115, 6.085485,
3.148033, -3.573461, -5.064119,
3.148033, -3.573461, 6.085485,
3.148033, 3.055115, -5.064119,
3.148033, 3.055115, 6.085485
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
var radius = 7.678342;
var distance = 34.16181;
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
mvMatrix.translate( -0.04494464, 0.2591734, -0.5106828 );
mvMatrix.scale( 1.337695, 1.252452, 0.7445982 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.16181);
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
benfuracarb<-read.table("benfuracarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benfuracarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'benfuracarb' not found
```

```r
y<-benfuracarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'benfuracarb' not found
```

```r
z<-benfuracarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'benfuracarb' not found
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
-2.967762, -0.6401764, -2.922487, 0, 0, 1, 1, 1,
-2.804083, -0.8537023, -2.18644, 1, 0, 0, 1, 1,
-2.710671, -0.5058802, -1.315443, 1, 0, 0, 1, 1,
-2.68912, -0.7040885, -2.159119, 1, 0, 0, 1, 1,
-2.664185, -0.08306149, -3.266935, 1, 0, 0, 1, 1,
-2.607744, 0.04831818, -2.044692, 1, 0, 0, 1, 1,
-2.536509, -0.6665858, -3.753065, 0, 0, 0, 1, 1,
-2.490187, 1.537614, -1.501097, 0, 0, 0, 1, 1,
-2.475668, 0.3227884, -0.7266662, 0, 0, 0, 1, 1,
-2.407992, 1.472763, -3.121092, 0, 0, 0, 1, 1,
-2.399273, 0.2464548, -0.9179834, 0, 0, 0, 1, 1,
-2.394767, 0.9921075, -2.342564, 0, 0, 0, 1, 1,
-2.369095, -0.6225814, -2.254854, 0, 0, 0, 1, 1,
-2.335067, 1.358297, -3.087396, 1, 1, 1, 1, 1,
-2.250569, 0.7252945, -1.287479, 1, 1, 1, 1, 1,
-2.206146, 0.5239717, -0.4870312, 1, 1, 1, 1, 1,
-2.12812, -0.1635268, -2.997638, 1, 1, 1, 1, 1,
-2.043914, 1.047373, -2.38105, 1, 1, 1, 1, 1,
-1.948985, 0.7242556, -0.5519872, 1, 1, 1, 1, 1,
-1.94009, 1.30696, -1.982366, 1, 1, 1, 1, 1,
-1.901841, 0.2492467, -0.7511005, 1, 1, 1, 1, 1,
-1.851639, -1.151495, -2.75806, 1, 1, 1, 1, 1,
-1.822299, -0.005690775, -1.039739, 1, 1, 1, 1, 1,
-1.808583, 0.8480702, -1.717374, 1, 1, 1, 1, 1,
-1.79476, 0.2323773, -0.8248096, 1, 1, 1, 1, 1,
-1.77994, 1.016863, -0.5615336, 1, 1, 1, 1, 1,
-1.778956, 1.003203, -1.636669, 1, 1, 1, 1, 1,
-1.766182, 2.382977, -0.7713857, 1, 1, 1, 1, 1,
-1.758628, -0.8917886, -3.159654, 0, 0, 1, 1, 1,
-1.753597, -0.269811, -2.518704, 1, 0, 0, 1, 1,
-1.749971, 0.301515, -1.078873, 1, 0, 0, 1, 1,
-1.749082, 0.9104081, -0.5331644, 1, 0, 0, 1, 1,
-1.723642, -0.9526622, -1.631866, 1, 0, 0, 1, 1,
-1.722364, -0.8901277, -2.847008, 1, 0, 0, 1, 1,
-1.709753, 2.600244, -0.5228465, 0, 0, 0, 1, 1,
-1.698757, 0.9480122, -1.474008, 0, 0, 0, 1, 1,
-1.695984, -0.1834986, -1.014656, 0, 0, 0, 1, 1,
-1.690541, 0.2296582, 0.2236309, 0, 0, 0, 1, 1,
-1.677598, -0.6370375, -3.09364, 0, 0, 0, 1, 1,
-1.663222, 0.1584149, -2.119634, 0, 0, 0, 1, 1,
-1.659065, 0.02973579, -2.188548, 0, 0, 0, 1, 1,
-1.651447, 0.3361458, -1.749747, 1, 1, 1, 1, 1,
-1.645449, 0.2955117, -1.630563, 1, 1, 1, 1, 1,
-1.64468, 0.09400222, 1.067368, 1, 1, 1, 1, 1,
-1.63542, 0.1011823, -2.299243, 1, 1, 1, 1, 1,
-1.634377, -0.8194948, -0.4253362, 1, 1, 1, 1, 1,
-1.633577, 0.1514664, -0.989275, 1, 1, 1, 1, 1,
-1.633278, 0.4385922, -2.447435, 1, 1, 1, 1, 1,
-1.626967, 0.699129, -0.7458132, 1, 1, 1, 1, 1,
-1.601477, 1.080397, -1.066761, 1, 1, 1, 1, 1,
-1.600515, -0.5576385, -2.892458, 1, 1, 1, 1, 1,
-1.591344, 0.08559801, -0.532015, 1, 1, 1, 1, 1,
-1.590347, -2.562382, -3.288603, 1, 1, 1, 1, 1,
-1.581072, 0.2725493, -2.429437, 1, 1, 1, 1, 1,
-1.578761, -2.462042, -2.031507, 1, 1, 1, 1, 1,
-1.54538, 0.03134093, -1.247399, 1, 1, 1, 1, 1,
-1.537711, 0.7363915, -1.615822, 0, 0, 1, 1, 1,
-1.525073, 0.9371363, -0.7896842, 1, 0, 0, 1, 1,
-1.509003, 0.1976281, -1.753977, 1, 0, 0, 1, 1,
-1.503722, 0.2125995, -2.129246, 1, 0, 0, 1, 1,
-1.501028, 0.1839789, -0.09092109, 1, 0, 0, 1, 1,
-1.496544, 0.6097893, -0.07214353, 1, 0, 0, 1, 1,
-1.496373, 0.1629125, -1.817038, 0, 0, 0, 1, 1,
-1.487365, 0.1007999, -0.9848396, 0, 0, 0, 1, 1,
-1.485569, -0.1954836, -1.789546, 0, 0, 0, 1, 1,
-1.467056, -0.3844084, -2.547364, 0, 0, 0, 1, 1,
-1.461708, -1.102527, -3.20734, 0, 0, 0, 1, 1,
-1.45335, -0.695134, -2.856157, 0, 0, 0, 1, 1,
-1.439881, 0.389015, -2.644744, 0, 0, 0, 1, 1,
-1.434434, 0.05671738, -1.429419, 1, 1, 1, 1, 1,
-1.428907, 0.4111924, -1.673221, 1, 1, 1, 1, 1,
-1.428666, 0.4907291, -1.398968, 1, 1, 1, 1, 1,
-1.428508, -0.8379717, -2.421167, 1, 1, 1, 1, 1,
-1.428158, 0.4657064, -2.461292, 1, 1, 1, 1, 1,
-1.426756, -0.9008689, 0.06295983, 1, 1, 1, 1, 1,
-1.418294, 1.16909, -1.216411, 1, 1, 1, 1, 1,
-1.409057, 0.976676, -0.8252372, 1, 1, 1, 1, 1,
-1.400912, -0.5923732, -0.5442332, 1, 1, 1, 1, 1,
-1.399379, 0.02867707, -0.9969282, 1, 1, 1, 1, 1,
-1.399364, -0.5425407, -2.379658, 1, 1, 1, 1, 1,
-1.392799, 0.6527855, -0.4953451, 1, 1, 1, 1, 1,
-1.370587, 0.8667498, -2.320742, 1, 1, 1, 1, 1,
-1.360567, -1.697847, -1.459579, 1, 1, 1, 1, 1,
-1.35239, -0.6063954, -1.386976, 1, 1, 1, 1, 1,
-1.349328, 1.02329, -0.8913131, 0, 0, 1, 1, 1,
-1.348645, -0.1752591, -0.9504582, 1, 0, 0, 1, 1,
-1.343426, -0.3715962, -1.916393, 1, 0, 0, 1, 1,
-1.340148, -0.4459988, -1.789603, 1, 0, 0, 1, 1,
-1.33572, 0.06140219, -3.790103, 1, 0, 0, 1, 1,
-1.335387, 1.356214, -1.128432, 1, 0, 0, 1, 1,
-1.328881, 0.6538646, -1.436562, 0, 0, 0, 1, 1,
-1.322374, 1.910928, 0.5694699, 0, 0, 0, 1, 1,
-1.321801, 0.3105889, -1.126952, 0, 0, 0, 1, 1,
-1.313818, 0.7894626, -1.717165, 0, 0, 0, 1, 1,
-1.31286, -0.5026318, -1.001143, 0, 0, 0, 1, 1,
-1.306279, 0.3236256, -3.13074, 0, 0, 0, 1, 1,
-1.303353, -1.291929, -1.408355, 0, 0, 0, 1, 1,
-1.295728, 0.3353239, -0.5417228, 1, 1, 1, 1, 1,
-1.293962, 0.790885, -2.08078, 1, 1, 1, 1, 1,
-1.292915, 2.045759, -0.4454201, 1, 1, 1, 1, 1,
-1.285737, -0.7379087, -2.356553, 1, 1, 1, 1, 1,
-1.285265, -0.6694251, -3.137347, 1, 1, 1, 1, 1,
-1.284483, -1.107197, -1.8555, 1, 1, 1, 1, 1,
-1.27861, -0.2691459, 1.26887, 1, 1, 1, 1, 1,
-1.274181, 0.7528325, -1.009266, 1, 1, 1, 1, 1,
-1.268994, 0.1622714, -2.068374, 1, 1, 1, 1, 1,
-1.25494, 0.06871568, -1.866998, 1, 1, 1, 1, 1,
-1.246774, -0.7501978, -0.03611476, 1, 1, 1, 1, 1,
-1.246082, -0.07214016, -2.307551, 1, 1, 1, 1, 1,
-1.244686, -1.066901, -2.923019, 1, 1, 1, 1, 1,
-1.241845, 0.6752456, 0.2307127, 1, 1, 1, 1, 1,
-1.240836, 1.999632, -0.7321777, 1, 1, 1, 1, 1,
-1.232927, -1.483986, -2.3361, 0, 0, 1, 1, 1,
-1.224094, 0.5742609, -0.6958965, 1, 0, 0, 1, 1,
-1.213268, 0.07397011, -2.473473, 1, 0, 0, 1, 1,
-1.211178, 0.578038, -0.8500043, 1, 0, 0, 1, 1,
-1.206143, 0.8906621, -2.145115, 1, 0, 0, 1, 1,
-1.191821, -0.4864612, -1.866358, 1, 0, 0, 1, 1,
-1.190839, -0.6819965, 1.979748, 0, 0, 0, 1, 1,
-1.188226, 0.2605014, -1.902332, 0, 0, 0, 1, 1,
-1.179837, 1.002774, -1.855595, 0, 0, 0, 1, 1,
-1.178748, 0.9006952, -1.383422, 0, 0, 0, 1, 1,
-1.165704, 1.345731, 0.320805, 0, 0, 0, 1, 1,
-1.162339, 0.4115421, -2.558096, 0, 0, 0, 1, 1,
-1.16226, -0.433536, -1.839404, 0, 0, 0, 1, 1,
-1.160653, 0.2090236, -1.687423, 1, 1, 1, 1, 1,
-1.158891, 0.3710778, -0.09178875, 1, 1, 1, 1, 1,
-1.145407, 0.1101217, -2.05673, 1, 1, 1, 1, 1,
-1.134311, 0.6693668, -2.322296, 1, 1, 1, 1, 1,
-1.132045, -1.021704, -1.508068, 1, 1, 1, 1, 1,
-1.121355, 0.03329618, -3.609903, 1, 1, 1, 1, 1,
-1.115798, -1.932626, -2.78582, 1, 1, 1, 1, 1,
-1.112646, -1.587231, -1.832435, 1, 1, 1, 1, 1,
-1.112021, -0.7293882, -3.342069, 1, 1, 1, 1, 1,
-1.111773, -1.039312, -3.647137, 1, 1, 1, 1, 1,
-1.1082, -0.819776, -1.77475, 1, 1, 1, 1, 1,
-1.106006, -1.272388, -1.625884, 1, 1, 1, 1, 1,
-1.097651, 0.6699566, -1.609276, 1, 1, 1, 1, 1,
-1.097617, 1.029076, -1.150326, 1, 1, 1, 1, 1,
-1.097532, -1.536419, -2.837282, 1, 1, 1, 1, 1,
-1.092637, -0.2039646, -2.463576, 0, 0, 1, 1, 1,
-1.089626, -1.613778, -1.377328, 1, 0, 0, 1, 1,
-1.086667, 0.5162625, -1.891654, 1, 0, 0, 1, 1,
-1.085921, 1.102588, -1.507009, 1, 0, 0, 1, 1,
-1.0852, -1.260381, -1.906479, 1, 0, 0, 1, 1,
-1.078382, 1.837577, -1.299275, 1, 0, 0, 1, 1,
-1.077453, 1.540575, -2.6334, 0, 0, 0, 1, 1,
-1.071427, 0.2283525, -1.881021, 0, 0, 0, 1, 1,
-1.068554, 0.8926834, -2.419499, 0, 0, 0, 1, 1,
-1.068068, -0.4215996, -1.033792, 0, 0, 0, 1, 1,
-1.067702, -1.843782, -1.793847, 0, 0, 0, 1, 1,
-1.054968, -0.3024188, -1.437078, 0, 0, 0, 1, 1,
-1.053841, -0.7873096, -3.671652, 0, 0, 0, 1, 1,
-1.052367, -0.1124679, -0.4939948, 1, 1, 1, 1, 1,
-1.048809, 0.07576916, -0.2994001, 1, 1, 1, 1, 1,
-1.042743, 1.272896, -1.230017, 1, 1, 1, 1, 1,
-1.034965, -0.3644634, -2.487862, 1, 1, 1, 1, 1,
-1.034062, -0.8127033, -3.023017, 1, 1, 1, 1, 1,
-1.030573, 0.154618, -1.533313, 1, 1, 1, 1, 1,
-1.027999, -0.1145649, -3.009174, 1, 1, 1, 1, 1,
-1.02472, -0.4207709, -1.364552, 1, 1, 1, 1, 1,
-1.023726, 0.07447234, -1.200236, 1, 1, 1, 1, 1,
-1.019083, -0.5783834, -2.934922, 1, 1, 1, 1, 1,
-1.015081, 0.5842708, -1.026976, 1, 1, 1, 1, 1,
-1.008175, -0.6637226, -2.412723, 1, 1, 1, 1, 1,
-1.001774, 1.777169, -2.886419, 1, 1, 1, 1, 1,
-1.000225, -0.1934934, -2.674623, 1, 1, 1, 1, 1,
-0.9964966, -0.249292, -0.8489051, 1, 1, 1, 1, 1,
-0.9937441, -2.526072, -2.165086, 0, 0, 1, 1, 1,
-0.9900611, -1.089004, -0.4803653, 1, 0, 0, 1, 1,
-0.9865867, 1.653971, 0.7926105, 1, 0, 0, 1, 1,
-0.9831828, 0.5864902, -0.1750684, 1, 0, 0, 1, 1,
-0.9812992, 1.053694, -0.6802158, 1, 0, 0, 1, 1,
-0.9794568, 0.2524274, -1.254965, 1, 0, 0, 1, 1,
-0.976338, -1.10858, -3.808441, 0, 0, 0, 1, 1,
-0.9757257, -1.366228, -2.357566, 0, 0, 0, 1, 1,
-0.9729659, -1.785665, -1.931441, 0, 0, 0, 1, 1,
-0.9720007, 1.260962, -2.516335, 0, 0, 0, 1, 1,
-0.9704214, 0.464507, -1.499435, 0, 0, 0, 1, 1,
-0.9664613, -1.943363, -3.188067, 0, 0, 0, 1, 1,
-0.9658501, -0.1486195, -2.232499, 0, 0, 0, 1, 1,
-0.9626933, -0.6396856, 0.03727071, 1, 1, 1, 1, 1,
-0.9609287, -0.3499232, -3.454901, 1, 1, 1, 1, 1,
-0.9604453, 0.2436977, -3.180258, 1, 1, 1, 1, 1,
-0.9597031, -0.3170114, -3.213484, 1, 1, 1, 1, 1,
-0.9516069, -1.908833, -3.787036, 1, 1, 1, 1, 1,
-0.9514138, -0.4105216, -2.122438, 1, 1, 1, 1, 1,
-0.9475763, 1.321936, -1.651764, 1, 1, 1, 1, 1,
-0.9453334, 0.451876, -3.02034, 1, 1, 1, 1, 1,
-0.9452811, 1.936785, -0.1037238, 1, 1, 1, 1, 1,
-0.9408824, 0.2743033, -1.963783, 1, 1, 1, 1, 1,
-0.9387, 1.200592, -1.069924, 1, 1, 1, 1, 1,
-0.9371393, 0.9794483, 0.8522409, 1, 1, 1, 1, 1,
-0.935551, -0.9500621, -3.228848, 1, 1, 1, 1, 1,
-0.9328421, -2.271642, -4.850805, 1, 1, 1, 1, 1,
-0.9246097, -2.320598, -1.702678, 1, 1, 1, 1, 1,
-0.9179773, 1.843198, -1.678706, 0, 0, 1, 1, 1,
-0.9175264, -0.4591823, 0.5767891, 1, 0, 0, 1, 1,
-0.9031833, -0.2305116, -2.247615, 1, 0, 0, 1, 1,
-0.8961733, 0.5935476, 0.08835769, 1, 0, 0, 1, 1,
-0.8947194, 0.6440997, -1.111525, 1, 0, 0, 1, 1,
-0.8941779, -1.18962, -1.176507, 1, 0, 0, 1, 1,
-0.8939394, 0.7872671, 0.5324631, 0, 0, 0, 1, 1,
-0.8873441, -0.408586, -2.55707, 0, 0, 0, 1, 1,
-0.8865209, -1.059498, -2.041599, 0, 0, 0, 1, 1,
-0.8856872, 0.02215638, -2.155563, 0, 0, 0, 1, 1,
-0.8836104, -0.4067861, -2.94623, 0, 0, 0, 1, 1,
-0.8832934, 0.6768093, -2.64692, 0, 0, 0, 1, 1,
-0.8825745, 1.276098, -1.131803, 0, 0, 0, 1, 1,
-0.877296, -0.2342554, -1.880285, 1, 1, 1, 1, 1,
-0.8714313, -1.019437, -2.118263, 1, 1, 1, 1, 1,
-0.8708031, 0.7518224, -0.2506744, 1, 1, 1, 1, 1,
-0.8696533, 0.4196565, -1.991068, 1, 1, 1, 1, 1,
-0.8618985, 1.019862, 0.06567384, 1, 1, 1, 1, 1,
-0.8581294, -0.6669902, -2.830852, 1, 1, 1, 1, 1,
-0.8504663, -1.338959, -3.132224, 1, 1, 1, 1, 1,
-0.8458562, 0.2637565, -1.561646, 1, 1, 1, 1, 1,
-0.8397493, 1.309808, -0.6445031, 1, 1, 1, 1, 1,
-0.8391027, -0.06241027, -3.992096, 1, 1, 1, 1, 1,
-0.8390273, -1.002794, -1.588875, 1, 1, 1, 1, 1,
-0.8351444, -0.36547, -1.826132, 1, 1, 1, 1, 1,
-0.8332206, 0.8479652, 0.5521841, 1, 1, 1, 1, 1,
-0.8293484, 0.162282, -0.6916227, 1, 1, 1, 1, 1,
-0.8264629, -0.9012741, -3.055986, 1, 1, 1, 1, 1,
-0.8248416, 1.237872, -0.09714848, 0, 0, 1, 1, 1,
-0.8246815, -0.2206004, -2.32856, 1, 0, 0, 1, 1,
-0.8232133, -0.1649733, 0.5141011, 1, 0, 0, 1, 1,
-0.8223916, -0.4528889, -2.381602, 1, 0, 0, 1, 1,
-0.8215017, 0.8928562, -0.7268092, 1, 0, 0, 1, 1,
-0.8206891, 1.313119, -0.8558287, 1, 0, 0, 1, 1,
-0.819276, -1.081747, -3.585024, 0, 0, 0, 1, 1,
-0.8185394, -0.4795862, -3.032899, 0, 0, 0, 1, 1,
-0.8118508, -0.7101991, -2.927177, 0, 0, 0, 1, 1,
-0.8114073, 0.8573453, 0.733287, 0, 0, 0, 1, 1,
-0.8093744, -0.3054074, -1.86072, 0, 0, 0, 1, 1,
-0.8007154, -0.3724938, -3.682803, 0, 0, 0, 1, 1,
-0.7945586, 1.731187, 1.29062, 0, 0, 0, 1, 1,
-0.7914224, 1.306566, 1.139842, 1, 1, 1, 1, 1,
-0.7877216, 2.601105, -0.8481144, 1, 1, 1, 1, 1,
-0.7869173, 0.7119775, 0.04649937, 1, 1, 1, 1, 1,
-0.7772793, -0.5104936, -3.764157, 1, 1, 1, 1, 1,
-0.7742075, 0.97083, -1.224117, 1, 1, 1, 1, 1,
-0.7724814, 0.0287628, -2.199335, 1, 1, 1, 1, 1,
-0.7677854, -0.9824783, -2.023541, 1, 1, 1, 1, 1,
-0.7639644, -0.155358, -2.4032, 1, 1, 1, 1, 1,
-0.7588763, -0.08834796, 0.0501887, 1, 1, 1, 1, 1,
-0.7581963, -0.1419959, -1.629032, 1, 1, 1, 1, 1,
-0.757234, -1.266406, -3.686371, 1, 1, 1, 1, 1,
-0.7550187, -0.3874865, -0.6505121, 1, 1, 1, 1, 1,
-0.7531062, 1.54006, -1.750532, 1, 1, 1, 1, 1,
-0.7431785, 0.7428733, -0.1680872, 1, 1, 1, 1, 1,
-0.7425621, -0.9027253, -2.276192, 1, 1, 1, 1, 1,
-0.7380321, 0.5130116, -1.347532, 0, 0, 1, 1, 1,
-0.7326863, 1.085706, -0.19761, 1, 0, 0, 1, 1,
-0.7322714, -0.9447321, -0.4487318, 1, 0, 0, 1, 1,
-0.7285041, 0.5694138, -1.131435, 1, 0, 0, 1, 1,
-0.7256947, 0.7624194, -0.7775204, 1, 0, 0, 1, 1,
-0.7249923, 1.078929, -0.6978759, 1, 0, 0, 1, 1,
-0.7178544, 0.3348618, -1.465659, 0, 0, 0, 1, 1,
-0.714803, -1.331032, -2.069317, 0, 0, 0, 1, 1,
-0.7090262, 2.012932, -0.6954743, 0, 0, 0, 1, 1,
-0.7073019, 1.050502, -0.6741765, 0, 0, 0, 1, 1,
-0.705558, 0.08159193, -0.993138, 0, 0, 0, 1, 1,
-0.7032518, -0.3793063, -1.995635, 0, 0, 0, 1, 1,
-0.6907111, -0.3686021, -2.112191, 0, 0, 0, 1, 1,
-0.6872991, -1.400386, -3.092797, 1, 1, 1, 1, 1,
-0.6854472, 0.1252811, -1.570337, 1, 1, 1, 1, 1,
-0.6852636, -1.406282, -0.3546113, 1, 1, 1, 1, 1,
-0.6851221, -0.09182973, -1.17007, 1, 1, 1, 1, 1,
-0.670071, 1.894347, 0.6198617, 1, 1, 1, 1, 1,
-0.6675282, -1.430458, -2.11474, 1, 1, 1, 1, 1,
-0.6669787, 1.534117, -1.840663, 1, 1, 1, 1, 1,
-0.6632342, 0.1898361, -2.360162, 1, 1, 1, 1, 1,
-0.6612759, 1.644671, -2.786719, 1, 1, 1, 1, 1,
-0.6602939, 0.240364, -1.079392, 1, 1, 1, 1, 1,
-0.6552623, -1.115159, -2.934762, 1, 1, 1, 1, 1,
-0.652272, -0.8009245, -2.438904, 1, 1, 1, 1, 1,
-0.6511757, 0.1211789, -1.200115, 1, 1, 1, 1, 1,
-0.6468768, 1.384488, -0.1401797, 1, 1, 1, 1, 1,
-0.6450709, 1.156455, -1.726755, 1, 1, 1, 1, 1,
-0.644428, 2.147664, -2.183199, 0, 0, 1, 1, 1,
-0.6433038, 0.8161066, -0.122598, 1, 0, 0, 1, 1,
-0.6426078, -0.2320694, -2.816215, 1, 0, 0, 1, 1,
-0.6320788, -0.3991876, -1.356491, 1, 0, 0, 1, 1,
-0.6290844, 0.4608684, -0.07980391, 1, 0, 0, 1, 1,
-0.6281775, 0.8326327, -1.509754, 1, 0, 0, 1, 1,
-0.6280656, 0.528372, 0.01793453, 0, 0, 0, 1, 1,
-0.6234534, 0.1272884, -1.421111, 0, 0, 0, 1, 1,
-0.6226497, -0.1847615, -0.5763559, 0, 0, 0, 1, 1,
-0.6205688, 1.383248, 0.186487, 0, 0, 0, 1, 1,
-0.6169057, 0.7428713, -0.2248913, 0, 0, 0, 1, 1,
-0.6081699, 0.4839067, -1.238356, 0, 0, 0, 1, 1,
-0.603641, 1.233817, -0.8439607, 0, 0, 0, 1, 1,
-0.6027079, 0.2026395, -1.115881, 1, 1, 1, 1, 1,
-0.6022215, 1.558324, 0.005850406, 1, 1, 1, 1, 1,
-0.6012992, 0.006963998, -4.1877, 1, 1, 1, 1, 1,
-0.5937665, -2.789604, -2.154582, 1, 1, 1, 1, 1,
-0.5936403, -1.740847, -3.128566, 1, 1, 1, 1, 1,
-0.5934995, -1.11846, -2.100303, 1, 1, 1, 1, 1,
-0.5878883, -0.1890393, -1.48471, 1, 1, 1, 1, 1,
-0.5867951, -0.1019999, -1.234767, 1, 1, 1, 1, 1,
-0.5861764, -0.9844851, -0.5203215, 1, 1, 1, 1, 1,
-0.5829452, -0.8069522, -3.501342, 1, 1, 1, 1, 1,
-0.5781985, -1.251275, -2.856386, 1, 1, 1, 1, 1,
-0.5683037, 1.609507, -0.1408394, 1, 1, 1, 1, 1,
-0.567969, 0.05386091, 0.4954505, 1, 1, 1, 1, 1,
-0.5659702, 1.114985, -0.8006104, 1, 1, 1, 1, 1,
-0.560666, -0.1637515, -0.6572568, 1, 1, 1, 1, 1,
-0.5605996, 1.160351, -1.135518, 0, 0, 1, 1, 1,
-0.5595663, -0.218687, -2.280683, 1, 0, 0, 1, 1,
-0.557259, -0.2757187, -0.05088422, 1, 0, 0, 1, 1,
-0.5559232, -1.546833, -1.99775, 1, 0, 0, 1, 1,
-0.5557206, -0.6847125, -2.768933, 1, 0, 0, 1, 1,
-0.5512272, -0.3796757, -2.192093, 1, 0, 0, 1, 1,
-0.54842, -0.6782601, -3.63758, 0, 0, 0, 1, 1,
-0.545678, -0.457214, -1.213556, 0, 0, 0, 1, 1,
-0.541639, 0.08236539, -0.525087, 0, 0, 0, 1, 1,
-0.5409823, -0.5863409, -1.194003, 0, 0, 0, 1, 1,
-0.5382301, -0.6735411, -1.905363, 0, 0, 0, 1, 1,
-0.5317693, 0.01476071, -2.434417, 0, 0, 0, 1, 1,
-0.5317548, -1.274209, -3.333771, 0, 0, 0, 1, 1,
-0.5313791, -2.072058, -3.672197, 1, 1, 1, 1, 1,
-0.5300221, -1.127855, -3.013173, 1, 1, 1, 1, 1,
-0.5298852, 0.8328951, -0.4353074, 1, 1, 1, 1, 1,
-0.5262972, -0.6981019, -1.841233, 1, 1, 1, 1, 1,
-0.5237775, 0.2069842, -1.795506, 1, 1, 1, 1, 1,
-0.5229163, 0.4500436, -1.323217, 1, 1, 1, 1, 1,
-0.5208481, -0.5617308, -3.6797, 1, 1, 1, 1, 1,
-0.5206332, -1.409284, -2.126539, 1, 1, 1, 1, 1,
-0.5199165, -0.7502467, -4.000159, 1, 1, 1, 1, 1,
-0.5112929, -0.06365854, -0.743474, 1, 1, 1, 1, 1,
-0.5110903, -0.3030624, -1.774662, 1, 1, 1, 1, 1,
-0.5107568, 0.1893673, -0.9197654, 1, 1, 1, 1, 1,
-0.5011859, 2.130111, 1.32421, 1, 1, 1, 1, 1,
-0.4988381, 0.0516818, -1.322032, 1, 1, 1, 1, 1,
-0.4976757, 1.850818, -0.7863947, 1, 1, 1, 1, 1,
-0.4894821, -0.8151014, -3.603494, 0, 0, 1, 1, 1,
-0.4846203, -0.05553029, -3.318269, 1, 0, 0, 1, 1,
-0.4844919, 0.4088703, 0.3685667, 1, 0, 0, 1, 1,
-0.4838424, 0.1983917, -2.523037, 1, 0, 0, 1, 1,
-0.4834454, 0.8159242, -0.6103777, 1, 0, 0, 1, 1,
-0.480008, 0.2750215, -0.4681679, 1, 0, 0, 1, 1,
-0.4749093, -0.9463587, -1.890614, 0, 0, 0, 1, 1,
-0.4703301, -0.7698903, -4.153943, 0, 0, 0, 1, 1,
-0.4684411, -0.08552528, -0.9037168, 0, 0, 0, 1, 1,
-0.4681586, 0.4315787, -1.771828, 0, 0, 0, 1, 1,
-0.4669251, -0.6594637, -2.700224, 0, 0, 0, 1, 1,
-0.4626437, 1.90233, 0.8258711, 0, 0, 0, 1, 1,
-0.4553444, -0.7985654, -2.499612, 0, 0, 0, 1, 1,
-0.4473976, 0.4930865, -1.703428, 1, 1, 1, 1, 1,
-0.4447378, 0.3069889, -1.902181, 1, 1, 1, 1, 1,
-0.4440108, 2.551369, 0.526292, 1, 1, 1, 1, 1,
-0.4417002, -2.060374, -2.607596, 1, 1, 1, 1, 1,
-0.4404847, 0.2271373, -0.4907297, 1, 1, 1, 1, 1,
-0.4394859, -0.1405096, -3.57554, 1, 1, 1, 1, 1,
-0.4379633, 1.506869, -0.5451682, 1, 1, 1, 1, 1,
-0.4361241, 1.196692, -1.388174, 1, 1, 1, 1, 1,
-0.433424, 0.7779917, -2.173306, 1, 1, 1, 1, 1,
-0.4305502, 0.5352936, -0.2932435, 1, 1, 1, 1, 1,
-0.4302499, -1.033857, -3.604433, 1, 1, 1, 1, 1,
-0.4281466, 1.521387, 1.621378, 1, 1, 1, 1, 1,
-0.4248698, 0.3544403, -1.547307, 1, 1, 1, 1, 1,
-0.4182273, 0.5831584, -1.110783, 1, 1, 1, 1, 1,
-0.4159173, 0.1582854, -2.638118, 1, 1, 1, 1, 1,
-0.4157724, -0.2166515, -3.589609, 0, 0, 1, 1, 1,
-0.414979, -0.1356241, -4.171205, 1, 0, 0, 1, 1,
-0.4131427, -2.200787, -3.641661, 1, 0, 0, 1, 1,
-0.4128703, -0.1602454, -3.374031, 1, 0, 0, 1, 1,
-0.4122701, -1.714156, -3.174994, 1, 0, 0, 1, 1,
-0.4100303, 0.08635031, -0.8404803, 1, 0, 0, 1, 1,
-0.4093972, 0.4760069, 1.311674, 0, 0, 0, 1, 1,
-0.3976468, 0.8376364, -1.23063, 0, 0, 0, 1, 1,
-0.3905049, 0.7063881, -0.7035978, 0, 0, 0, 1, 1,
-0.3900766, 1.39381, -1.33033, 0, 0, 0, 1, 1,
-0.3896738, -0.7933261, -3.206328, 0, 0, 0, 1, 1,
-0.3871742, -0.3730071, -3.340799, 0, 0, 0, 1, 1,
-0.3871081, 0.03191398, -0.1396704, 0, 0, 0, 1, 1,
-0.3821524, -2.209353, -2.901422, 1, 1, 1, 1, 1,
-0.377044, 0.898253, -0.8717058, 1, 1, 1, 1, 1,
-0.3707185, 0.4101984, -1.24172, 1, 1, 1, 1, 1,
-0.36957, -0.2514299, -1.055269, 1, 1, 1, 1, 1,
-0.367477, -0.0058808, -1.964125, 1, 1, 1, 1, 1,
-0.3666066, -0.1335903, -0.6579611, 1, 1, 1, 1, 1,
-0.3600635, 0.06120141, -0.3525276, 1, 1, 1, 1, 1,
-0.3573377, 0.1095793, -2.029444, 1, 1, 1, 1, 1,
-0.3560152, 0.3846919, -2.339541, 1, 1, 1, 1, 1,
-0.355918, -0.4105184, -1.872282, 1, 1, 1, 1, 1,
-0.3501049, 0.9924734, 1.063007, 1, 1, 1, 1, 1,
-0.3467822, 0.1134141, -1.313624, 1, 1, 1, 1, 1,
-0.3424983, 0.6314656, 0.01521924, 1, 1, 1, 1, 1,
-0.3407907, 0.6391487, 0.1133724, 1, 1, 1, 1, 1,
-0.3404511, 1.233365, -2.466261, 1, 1, 1, 1, 1,
-0.3399378, -0.1850823, -1.535814, 0, 0, 1, 1, 1,
-0.3393018, 0.9298967, -0.5586741, 1, 0, 0, 1, 1,
-0.3366873, -0.861939, -1.862676, 1, 0, 0, 1, 1,
-0.336374, -1.616013, -4.375921, 1, 0, 0, 1, 1,
-0.3361964, -1.864354, -2.064116, 1, 0, 0, 1, 1,
-0.3312389, 0.8367463, 0.2140308, 1, 0, 0, 1, 1,
-0.3311034, -0.05924629, -2.568763, 0, 0, 0, 1, 1,
-0.3302556, 0.06755959, -3.352369, 0, 0, 0, 1, 1,
-0.327565, -1.661286, -3.069629, 0, 0, 0, 1, 1,
-0.3266528, -1.456899, -3.607913, 0, 0, 0, 1, 1,
-0.3251426, 0.9894695, 0.4761295, 0, 0, 0, 1, 1,
-0.3217897, 0.8695664, -0.9371067, 0, 0, 0, 1, 1,
-0.3210454, 0.2960248, -0.4139958, 0, 0, 0, 1, 1,
-0.3202986, -0.4251115, -1.371557, 1, 1, 1, 1, 1,
-0.3171094, -0.701678, -3.91275, 1, 1, 1, 1, 1,
-0.3166538, -0.9044837, -1.752962, 1, 1, 1, 1, 1,
-0.3141092, -0.2043607, -2.17604, 1, 1, 1, 1, 1,
-0.3132903, 0.1131686, -0.716359, 1, 1, 1, 1, 1,
-0.3127442, -2.999292, -4.239053, 1, 1, 1, 1, 1,
-0.3115123, -1.633394, -3.939211, 1, 1, 1, 1, 1,
-0.3050957, -0.5961027, -3.254906, 1, 1, 1, 1, 1,
-0.3007544, -0.4367823, -1.977177, 1, 1, 1, 1, 1,
-0.2953911, -0.48215, -2.85576, 1, 1, 1, 1, 1,
-0.292836, -1.388157, -1.447343, 1, 1, 1, 1, 1,
-0.2915553, 1.430017, 1.465495, 1, 1, 1, 1, 1,
-0.2915205, -0.1313419, -3.013159, 1, 1, 1, 1, 1,
-0.2881106, -1.359495, -4.3743, 1, 1, 1, 1, 1,
-0.284096, 0.7062956, 0.6661181, 1, 1, 1, 1, 1,
-0.2825308, -0.9786582, -3.710275, 0, 0, 1, 1, 1,
-0.281763, 0.2644474, -1.700959, 1, 0, 0, 1, 1,
-0.2799926, -2.07492, -2.354031, 1, 0, 0, 1, 1,
-0.2756804, -0.09903165, -1.0713, 1, 0, 0, 1, 1,
-0.2680422, -0.5214581, -1.866012, 1, 0, 0, 1, 1,
-0.2660405, -1.243327, -2.503693, 1, 0, 0, 1, 1,
-0.2632008, -0.5858796, -2.775882, 0, 0, 0, 1, 1,
-0.2623315, 0.3068903, -0.658963, 0, 0, 0, 1, 1,
-0.2611522, 0.8086649, -1.666923, 0, 0, 0, 1, 1,
-0.2606168, 0.4599048, -0.6448248, 0, 0, 0, 1, 1,
-0.2562066, 0.5561299, 0.2687811, 0, 0, 0, 1, 1,
-0.2546281, -0.1339528, -2.462945, 0, 0, 0, 1, 1,
-0.25077, 0.2067771, -1.204003, 0, 0, 0, 1, 1,
-0.2491871, 0.6204425, -1.70681, 1, 1, 1, 1, 1,
-0.2488306, 0.5186702, -0.2230136, 1, 1, 1, 1, 1,
-0.2481331, -0.608382, -4.493217, 1, 1, 1, 1, 1,
-0.2462699, 2.764487, -1.232254, 1, 1, 1, 1, 1,
-0.245846, -0.7485486, -2.534167, 1, 1, 1, 1, 1,
-0.2390848, -0.519786, -3.436687, 1, 1, 1, 1, 1,
-0.2351813, -0.8159367, -1.740787, 1, 1, 1, 1, 1,
-0.2349526, 2.06128, 0.2168393, 1, 1, 1, 1, 1,
-0.2282037, -2.618049, -1.151714, 1, 1, 1, 1, 1,
-0.2268634, 1.565592, -0.7476247, 1, 1, 1, 1, 1,
-0.2258528, 0.9764291, -0.5714548, 1, 1, 1, 1, 1,
-0.2247663, -0.317313, -3.998362, 1, 1, 1, 1, 1,
-0.2235637, 1.087426, -2.220819, 1, 1, 1, 1, 1,
-0.2214581, -0.5038636, -2.677699, 1, 1, 1, 1, 1,
-0.2212159, 1.416733, 0.6651433, 1, 1, 1, 1, 1,
-0.2196893, 0.4893669, 1.065257, 0, 0, 1, 1, 1,
-0.2144516, -0.7434641, -2.245987, 1, 0, 0, 1, 1,
-0.2141386, -0.5863215, -2.646231, 1, 0, 0, 1, 1,
-0.2123251, 0.8086339, 0.5253464, 1, 0, 0, 1, 1,
-0.2113746, 1.800571, -0.9846113, 1, 0, 0, 1, 1,
-0.2089254, 0.4599952, 0.9736221, 1, 0, 0, 1, 1,
-0.1988649, 2.069879, -1.753414, 0, 0, 0, 1, 1,
-0.1970896, -0.251286, -2.320319, 0, 0, 0, 1, 1,
-0.1911677, -1.803374, -2.786961, 0, 0, 0, 1, 1,
-0.1886829, -0.8806499, -2.926028, 0, 0, 0, 1, 1,
-0.1790949, -1.16193, -2.753208, 0, 0, 0, 1, 1,
-0.1774722, 1.065978, 1.070712, 0, 0, 0, 1, 1,
-0.1770174, -0.9494882, -3.236318, 0, 0, 0, 1, 1,
-0.1756808, 0.6739088, -0.9855871, 1, 1, 1, 1, 1,
-0.1747478, -0.1401647, -1.66542, 1, 1, 1, 1, 1,
-0.1664849, 0.02871497, -1.377973, 1, 1, 1, 1, 1,
-0.165322, -1.238706, -2.060994, 1, 1, 1, 1, 1,
-0.1601345, -0.9837871, -1.486536, 1, 1, 1, 1, 1,
-0.1574527, -0.3567716, -3.256279, 1, 1, 1, 1, 1,
-0.1565732, -1.498294, -3.510827, 1, 1, 1, 1, 1,
-0.1561046, 1.792621, 2.046262, 1, 1, 1, 1, 1,
-0.156013, -0.4201934, -2.487359, 1, 1, 1, 1, 1,
-0.1536567, -1.588941, -2.405618, 1, 1, 1, 1, 1,
-0.153284, 0.7527876, -0.4462352, 1, 1, 1, 1, 1,
-0.1531528, -0.02324891, -1.077224, 1, 1, 1, 1, 1,
-0.1518085, -0.6237181, -2.55249, 1, 1, 1, 1, 1,
-0.1505098, -0.1041936, -1.986777, 1, 1, 1, 1, 1,
-0.1503019, -0.5595782, -4.689128, 1, 1, 1, 1, 1,
-0.1420487, -0.1856073, -2.482999, 0, 0, 1, 1, 1,
-0.141094, -1.179004, -3.256561, 1, 0, 0, 1, 1,
-0.1408243, -0.3611339, -3.274789, 1, 0, 0, 1, 1,
-0.1368135, -0.581761, -3.467669, 1, 0, 0, 1, 1,
-0.1366323, -0.7698057, -2.093845, 1, 0, 0, 1, 1,
-0.1310808, -0.2472744, -4.135376, 1, 0, 0, 1, 1,
-0.1310575, -0.3463567, -0.3113723, 0, 0, 0, 1, 1,
-0.1260599, 0.8158063, -0.9586151, 0, 0, 0, 1, 1,
-0.1237299, -0.3044356, -1.789474, 0, 0, 0, 1, 1,
-0.1228329, -1.410398, -3.687838, 0, 0, 0, 1, 1,
-0.1202688, 1.054559, 1.434558, 0, 0, 0, 1, 1,
-0.1189831, -0.1652644, -2.732445, 0, 0, 0, 1, 1,
-0.1187297, -1.599351, -2.415153, 0, 0, 0, 1, 1,
-0.1184297, 0.5176167, -0.5812289, 1, 1, 1, 1, 1,
-0.1151822, -0.7092844, -3.960881, 1, 1, 1, 1, 1,
-0.1136573, 0.1969753, -0.5183573, 1, 1, 1, 1, 1,
-0.1128451, -1.606051, -3.228672, 1, 1, 1, 1, 1,
-0.1058149, -0.131971, -2.438046, 1, 1, 1, 1, 1,
-0.1045534, -1.472469, -3.64294, 1, 1, 1, 1, 1,
-0.1026713, -0.8218443, -2.375642, 1, 1, 1, 1, 1,
-0.1019683, -1.371075, -3.858434, 1, 1, 1, 1, 1,
-0.09756505, 2.647977, -0.8546459, 1, 1, 1, 1, 1,
-0.09124573, -0.1007626, -2.852771, 1, 1, 1, 1, 1,
-0.0863518, -0.08455189, -1.904404, 1, 1, 1, 1, 1,
-0.08296303, 0.5211242, 0.2078051, 1, 1, 1, 1, 1,
-0.08119588, 0.999068, 1.474413, 1, 1, 1, 1, 1,
-0.08093852, 1.094952, 0.3851976, 1, 1, 1, 1, 1,
-0.07481808, 1.02239, -1.34023, 1, 1, 1, 1, 1,
-0.07480267, 0.5937381, -0.6526841, 0, 0, 1, 1, 1,
-0.07440683, 1.398798, -0.5254199, 1, 0, 0, 1, 1,
-0.06345639, 0.9579543, 0.8878905, 1, 0, 0, 1, 1,
-0.05731725, -0.4513561, -4.901746, 1, 0, 0, 1, 1,
-0.05613892, -0.476771, -3.699507, 1, 0, 0, 1, 1,
-0.05183139, 0.273644, -1.124224, 1, 0, 0, 1, 1,
-0.05134312, -0.4772891, -3.989386, 0, 0, 0, 1, 1,
-0.05012907, -2.509043, -1.741393, 0, 0, 0, 1, 1,
-0.04496807, -1.425476, -2.287043, 0, 0, 0, 1, 1,
-0.0356403, 1.859955, -0.830089, 0, 0, 0, 1, 1,
-0.03360466, -0.4398418, -3.670873, 0, 0, 0, 1, 1,
-0.03339056, 0.6923535, 0.8449668, 0, 0, 0, 1, 1,
-0.02414243, 0.08287119, -0.2620015, 0, 0, 0, 1, 1,
-0.02333118, -0.2001287, -2.899189, 1, 1, 1, 1, 1,
-0.02148648, -0.6100261, -3.265848, 1, 1, 1, 1, 1,
-0.02143981, 1.142652, 1.596461, 1, 1, 1, 1, 1,
-0.017049, -0.07743244, -3.819235, 1, 1, 1, 1, 1,
-0.01694253, -0.2308454, -2.734992, 1, 1, 1, 1, 1,
-0.01656308, -0.2160969, -3.636142, 1, 1, 1, 1, 1,
-0.01202386, -1.077395, -2.839545, 1, 1, 1, 1, 1,
-0.01186148, 0.273575, -0.5163898, 1, 1, 1, 1, 1,
-0.01044741, 2.308468, -0.5761035, 1, 1, 1, 1, 1,
-0.007225784, -1.303859, -2.449207, 1, 1, 1, 1, 1,
-0.006263034, -0.1855375, -2.411073, 1, 1, 1, 1, 1,
-0.002217274, 1.227489, 0.3307524, 1, 1, 1, 1, 1,
0.001944748, 0.2841701, -0.6092667, 1, 1, 1, 1, 1,
0.002332811, -1.447336, 3.514753, 1, 1, 1, 1, 1,
0.007118836, -1.289021, 3.062748, 1, 1, 1, 1, 1,
0.007141616, -0.6578422, 3.798954, 0, 0, 1, 1, 1,
0.007281105, 0.5470455, -0.01101031, 1, 0, 0, 1, 1,
0.007799726, -0.1143946, 3.887615, 1, 0, 0, 1, 1,
0.01036769, 0.8594447, -0.9527407, 1, 0, 0, 1, 1,
0.0106794, -0.2545712, 4.320783, 1, 0, 0, 1, 1,
0.01406577, 1.164912, 0.1923794, 1, 0, 0, 1, 1,
0.01532204, -1.04542, 2.462188, 0, 0, 0, 1, 1,
0.016661, 0.6887251, 1.553695, 0, 0, 0, 1, 1,
0.01797907, -0.3121598, 3.66514, 0, 0, 0, 1, 1,
0.01801537, 0.1622342, -0.2942945, 0, 0, 0, 1, 1,
0.01841756, -1.494933, 2.63077, 0, 0, 0, 1, 1,
0.01964333, 0.0225588, 0.2446127, 0, 0, 0, 1, 1,
0.01996129, 0.7725842, 0.2300635, 0, 0, 0, 1, 1,
0.02561113, -1.207478, 1.844028, 1, 1, 1, 1, 1,
0.02603001, 0.7831542, 1.164645, 1, 1, 1, 1, 1,
0.03450425, -1.599409, 1.888576, 1, 1, 1, 1, 1,
0.03469168, 1.013037, 0.2327297, 1, 1, 1, 1, 1,
0.03715752, 0.2129801, -0.9611689, 1, 1, 1, 1, 1,
0.04086549, -0.1099915, 1.592498, 1, 1, 1, 1, 1,
0.04507636, 0.6688918, -0.331432, 1, 1, 1, 1, 1,
0.05015341, 0.07736862, 1.603174, 1, 1, 1, 1, 1,
0.05285955, 0.329331, 1.808625, 1, 1, 1, 1, 1,
0.05376855, 1.042663, -0.132455, 1, 1, 1, 1, 1,
0.0545433, 0.04805818, 1.82525, 1, 1, 1, 1, 1,
0.05837136, 1.107587, -0.4682607, 1, 1, 1, 1, 1,
0.06334173, 1.689578, -1.962862, 1, 1, 1, 1, 1,
0.07087585, 0.6829728, 0.2124832, 1, 1, 1, 1, 1,
0.07152233, 1.396162, -1.208926, 1, 1, 1, 1, 1,
0.07499008, -0.07447891, 3.344767, 0, 0, 1, 1, 1,
0.07763183, 0.1521328, 1.494804, 1, 0, 0, 1, 1,
0.08082096, 0.4078178, 0.4336394, 1, 0, 0, 1, 1,
0.08181757, 0.2048012, 1.721659, 1, 0, 0, 1, 1,
0.0863744, 0.7667529, 1.053273, 1, 0, 0, 1, 1,
0.09000739, -1.183325, 2.997561, 1, 0, 0, 1, 1,
0.09472503, -0.1126876, 1.635599, 0, 0, 0, 1, 1,
0.100597, 1.725326, -1.127722, 0, 0, 0, 1, 1,
0.1011639, 0.367775, 0.5303333, 0, 0, 0, 1, 1,
0.1014322, 0.677471, 0.9905933, 0, 0, 0, 1, 1,
0.1048679, -0.447569, 5.923111, 0, 0, 0, 1, 1,
0.1064168, 1.189968, -0.6260597, 0, 0, 0, 1, 1,
0.1108608, 0.4481291, -0.2807478, 0, 0, 0, 1, 1,
0.1116916, -0.4277633, 2.205943, 1, 1, 1, 1, 1,
0.1127685, -0.2344033, 2.236012, 1, 1, 1, 1, 1,
0.1207046, 2.409497, 0.7546463, 1, 1, 1, 1, 1,
0.1221226, -1.825499, 1.286516, 1, 1, 1, 1, 1,
0.1255274, 0.1033558, 0.8613642, 1, 1, 1, 1, 1,
0.1352267, -0.7713179, 2.38553, 1, 1, 1, 1, 1,
0.1352414, -0.2952157, 2.750571, 1, 1, 1, 1, 1,
0.1371815, 0.5081574, -1.148945, 1, 1, 1, 1, 1,
0.1381593, -0.2337879, 2.07382, 1, 1, 1, 1, 1,
0.1385773, 0.0847024, 0.2543835, 1, 1, 1, 1, 1,
0.1411863, -0.8280517, 2.143533, 1, 1, 1, 1, 1,
0.146743, 0.8005715, 0.8592259, 1, 1, 1, 1, 1,
0.1483742, -1.322962, 2.588224, 1, 1, 1, 1, 1,
0.1539301, 0.2864917, 1.643614, 1, 1, 1, 1, 1,
0.1602685, 1.758073, -0.4534564, 1, 1, 1, 1, 1,
0.1606656, 0.7305157, -2.13512, 0, 0, 1, 1, 1,
0.16068, -1.276597, 4.341127, 1, 0, 0, 1, 1,
0.1612296, 1.738677, 0.2993489, 1, 0, 0, 1, 1,
0.1616139, 0.4554037, 0.2235048, 1, 0, 0, 1, 1,
0.1624041, 0.7892271, 0.8871221, 1, 0, 0, 1, 1,
0.1633524, 1.240285, -0.9825362, 1, 0, 0, 1, 1,
0.1640509, 1.183175, 0.2955373, 0, 0, 0, 1, 1,
0.1661819, -3.028279, 2.336224, 0, 0, 0, 1, 1,
0.1692035, -0.510506, 2.68006, 0, 0, 0, 1, 1,
0.1695931, 0.4019703, 1.6027, 0, 0, 0, 1, 1,
0.1706122, 0.08474973, 0.6943021, 0, 0, 0, 1, 1,
0.1709553, -0.3699398, 3.093617, 0, 0, 0, 1, 1,
0.1738346, -0.2486769, 2.429241, 0, 0, 0, 1, 1,
0.1745089, -0.286152, 0.9656386, 1, 1, 1, 1, 1,
0.1756064, 0.1281504, 0.7890863, 1, 1, 1, 1, 1,
0.1839994, -0.6955423, 2.937415, 1, 1, 1, 1, 1,
0.1844945, 0.9212368, -0.1779846, 1, 1, 1, 1, 1,
0.1897251, 0.5786149, 1.675022, 1, 1, 1, 1, 1,
0.201488, 0.7988744, 0.172117, 1, 1, 1, 1, 1,
0.2017531, 0.7276962, -1.021563, 1, 1, 1, 1, 1,
0.2051769, 1.716538, 2.029002, 1, 1, 1, 1, 1,
0.206482, 1.743913, 0.4577345, 1, 1, 1, 1, 1,
0.2093617, -1.353076, 2.807721, 1, 1, 1, 1, 1,
0.210956, 0.1252477, 1.028174, 1, 1, 1, 1, 1,
0.213413, 1.340705, -0.02931272, 1, 1, 1, 1, 1,
0.2166779, -1.736393, 3.949706, 1, 1, 1, 1, 1,
0.2174202, 0.5370159, 1.652618, 1, 1, 1, 1, 1,
0.2181732, -1.874601, 2.280588, 1, 1, 1, 1, 1,
0.2186692, 0.3915694, -0.2484348, 0, 0, 1, 1, 1,
0.2187466, -1.842288, 0.2684336, 1, 0, 0, 1, 1,
0.2229719, 0.9361889, 0.9963013, 1, 0, 0, 1, 1,
0.2289888, 1.243096, -0.01710366, 1, 0, 0, 1, 1,
0.234033, -0.6749386, 3.129194, 1, 0, 0, 1, 1,
0.2365224, -2.133587, 2.708991, 1, 0, 0, 1, 1,
0.2381702, -0.2825756, 2.390071, 0, 0, 0, 1, 1,
0.2431489, -0.2702083, 1.154948, 0, 0, 0, 1, 1,
0.2449447, -0.7596785, 3.189737, 0, 0, 0, 1, 1,
0.2460743, 0.4762881, 1.333047, 0, 0, 0, 1, 1,
0.24796, -1.00709, 2.923544, 0, 0, 0, 1, 1,
0.2570109, 0.2357262, 2.532964, 0, 0, 0, 1, 1,
0.2572426, -0.3508222, 3.304658, 0, 0, 0, 1, 1,
0.2597843, -1.22374, 2.162888, 1, 1, 1, 1, 1,
0.260161, -0.8928659, 1.733366, 1, 1, 1, 1, 1,
0.2611189, 0.02753353, 3.307143, 1, 1, 1, 1, 1,
0.2621079, -0.8455912, 1.234613, 1, 1, 1, 1, 1,
0.2628555, -0.3311609, 3.580646, 1, 1, 1, 1, 1,
0.2630892, 0.9396393, 1.804175, 1, 1, 1, 1, 1,
0.2648056, -0.6802948, 2.629694, 1, 1, 1, 1, 1,
0.2691962, 0.1371322, 0.5736077, 1, 1, 1, 1, 1,
0.2706377, 1.010771, 1.345037, 1, 1, 1, 1, 1,
0.2730117, -0.5911973, 2.848944, 1, 1, 1, 1, 1,
0.2780926, 0.7903396, 2.021658, 1, 1, 1, 1, 1,
0.2783296, -1.739623, 1.27237, 1, 1, 1, 1, 1,
0.2798096, 0.3034326, 0.4382873, 1, 1, 1, 1, 1,
0.2830697, 0.2689805, 0.1966497, 1, 1, 1, 1, 1,
0.2835875, -0.0001539139, 1.802431, 1, 1, 1, 1, 1,
0.2840289, 1.481313, -0.6751312, 0, 0, 1, 1, 1,
0.2842094, 0.4456541, 0.8429681, 1, 0, 0, 1, 1,
0.2843178, 0.9840558, -1.447573, 1, 0, 0, 1, 1,
0.284371, -1.332394, 3.930001, 1, 0, 0, 1, 1,
0.289421, 2.958582, -0.05303348, 1, 0, 0, 1, 1,
0.2894776, 0.7563679, 2.082551, 1, 0, 0, 1, 1,
0.2915426, 0.3403707, 0.5603104, 0, 0, 0, 1, 1,
0.2935337, 1.222903, 1.951333, 0, 0, 0, 1, 1,
0.2993529, -0.4923779, 3.443873, 0, 0, 0, 1, 1,
0.3031904, -0.2543877, 0.4787148, 0, 0, 0, 1, 1,
0.3091911, 1.639077, 1.275245, 0, 0, 0, 1, 1,
0.3097201, -1.421, 3.797581, 0, 0, 0, 1, 1,
0.3197996, -3.476929, 2.236809, 0, 0, 0, 1, 1,
0.3267293, 0.6846923, 1.348321, 1, 1, 1, 1, 1,
0.3268971, 2.267694, -0.7768489, 1, 1, 1, 1, 1,
0.3275624, -0.4181746, 1.317961, 1, 1, 1, 1, 1,
0.3317366, 1.09309, 0.8638128, 1, 1, 1, 1, 1,
0.3350033, 0.4823451, 0.6334814, 1, 1, 1, 1, 1,
0.3350602, 1.037565, 1.23389, 1, 1, 1, 1, 1,
0.3364337, 0.6687976, 0.3638454, 1, 1, 1, 1, 1,
0.3389517, 0.4503358, 1.031953, 1, 1, 1, 1, 1,
0.339028, -1.933219, 2.688893, 1, 1, 1, 1, 1,
0.3471424, -0.2196388, 2.877057, 1, 1, 1, 1, 1,
0.3535812, -0.5680324, 2.355442, 1, 1, 1, 1, 1,
0.3538981, 0.1895421, 1.714385, 1, 1, 1, 1, 1,
0.3553107, 1.54533, -0.3681045, 1, 1, 1, 1, 1,
0.3665263, -0.243788, 2.476858, 1, 1, 1, 1, 1,
0.3682423, 1.4719, 1.644099, 1, 1, 1, 1, 1,
0.3729667, 1.89042, -0.8588588, 0, 0, 1, 1, 1,
0.3733329, -0.9699951, 1.139288, 1, 0, 0, 1, 1,
0.3752136, 0.1826915, 1.914095, 1, 0, 0, 1, 1,
0.382374, -1.159987, 4.297465, 1, 0, 0, 1, 1,
0.3825359, 0.4620342, 1.228045, 1, 0, 0, 1, 1,
0.3841286, -0.660065, 3.559596, 1, 0, 0, 1, 1,
0.3855702, 1.326903, -0.5691376, 0, 0, 0, 1, 1,
0.3918643, 0.2681134, 1.99556, 0, 0, 0, 1, 1,
0.3923359, -0.8708155, 3.358958, 0, 0, 0, 1, 1,
0.3971234, 0.007801722, 1.835647, 0, 0, 0, 1, 1,
0.3978828, -0.2425205, 1.462122, 0, 0, 0, 1, 1,
0.4032872, 0.07049764, 3.046828, 0, 0, 0, 1, 1,
0.4051813, -0.9111412, 2.170349, 0, 0, 0, 1, 1,
0.4055091, -0.008159326, 3.521859, 1, 1, 1, 1, 1,
0.4060537, 1.068324, 1.498242, 1, 1, 1, 1, 1,
0.4070273, 1.670728, 1.266717, 1, 1, 1, 1, 1,
0.4098815, -0.1270787, 4.475317, 1, 1, 1, 1, 1,
0.4123777, -0.7616682, 2.996146, 1, 1, 1, 1, 1,
0.4180998, 0.1732835, 2.299962, 1, 1, 1, 1, 1,
0.4208218, -0.7271644, 2.767164, 1, 1, 1, 1, 1,
0.4242666, -0.719662, 3.612365, 1, 1, 1, 1, 1,
0.427096, 1.236998, -1.093683, 1, 1, 1, 1, 1,
0.427302, -0.5341696, 2.58621, 1, 1, 1, 1, 1,
0.4351471, -1.439155, 3.170093, 1, 1, 1, 1, 1,
0.4390912, -0.145829, 1.679793, 1, 1, 1, 1, 1,
0.4391797, -1.665297, 2.861661, 1, 1, 1, 1, 1,
0.4476929, 0.7010507, 0.4492782, 1, 1, 1, 1, 1,
0.4505491, -1.045833, 2.815868, 1, 1, 1, 1, 1,
0.4514938, -0.3509167, 4.735224, 0, 0, 1, 1, 1,
0.4626779, -0.005386841, 1.992541, 1, 0, 0, 1, 1,
0.4638975, -0.6419667, 3.22016, 1, 0, 0, 1, 1,
0.4665976, 0.08323904, 0.6317599, 1, 0, 0, 1, 1,
0.4722707, -0.2065087, 2.902955, 1, 0, 0, 1, 1,
0.4782313, -2.62071, 3.413075, 1, 0, 0, 1, 1,
0.4811654, -0.1800289, 2.700613, 0, 0, 0, 1, 1,
0.4823046, -2.207087, 3.759896, 0, 0, 0, 1, 1,
0.4828961, 0.7421027, -0.1809034, 0, 0, 0, 1, 1,
0.4830618, -0.3936124, 2.202717, 0, 0, 0, 1, 1,
0.4844517, 0.6456634, 1.542739, 0, 0, 0, 1, 1,
0.4885599, -0.6556404, 2.526376, 0, 0, 0, 1, 1,
0.489045, 1.49253, -0.8124636, 0, 0, 0, 1, 1,
0.4892665, -0.3267744, 1.817523, 1, 1, 1, 1, 1,
0.4905146, -0.1427757, 1.75555, 1, 1, 1, 1, 1,
0.4933925, 0.4277365, 1.007777, 1, 1, 1, 1, 1,
0.4943618, 0.2969912, 1.270049, 1, 1, 1, 1, 1,
0.4964592, 0.833303, 2.165367, 1, 1, 1, 1, 1,
0.499005, -0.3657541, 2.38477, 1, 1, 1, 1, 1,
0.5040415, -0.295422, 1.962397, 1, 1, 1, 1, 1,
0.5046771, -0.7254488, 2.880336, 1, 1, 1, 1, 1,
0.5106164, -1.059202, 1.838582, 1, 1, 1, 1, 1,
0.5123655, 0.8515853, 1.154981, 1, 1, 1, 1, 1,
0.5133178, -0.1107271, 1.093797, 1, 1, 1, 1, 1,
0.5135553, -0.1110442, 2.509387, 1, 1, 1, 1, 1,
0.5197548, -1.177747, 2.475013, 1, 1, 1, 1, 1,
0.5205151, 0.02066406, 0.5152313, 1, 1, 1, 1, 1,
0.5208734, -0.2456129, 2.646262, 1, 1, 1, 1, 1,
0.5268949, -1.186205, 3.232068, 0, 0, 1, 1, 1,
0.5271602, -0.05519807, 0.5361625, 1, 0, 0, 1, 1,
0.5355862, -1.433726, 2.32993, 1, 0, 0, 1, 1,
0.5378256, 0.6298483, -0.1499166, 1, 0, 0, 1, 1,
0.5431054, 0.9166543, 1.665593, 1, 0, 0, 1, 1,
0.5432053, -1.020842, 1.187458, 1, 0, 0, 1, 1,
0.5436668, 0.6396725, 0.122814, 0, 0, 0, 1, 1,
0.5450577, -1.649282, 3.114079, 0, 0, 0, 1, 1,
0.5483965, 0.4753613, 2.399879, 0, 0, 0, 1, 1,
0.5539325, -0.8494358, 3.433036, 0, 0, 0, 1, 1,
0.555126, -1.325076, 3.498155, 0, 0, 0, 1, 1,
0.5552408, -0.3863423, 1.956117, 0, 0, 0, 1, 1,
0.5571052, 0.6058748, 0.4711635, 0, 0, 0, 1, 1,
0.5589641, -0.8930125, 2.155288, 1, 1, 1, 1, 1,
0.5606758, -1.409147, 1.694557, 1, 1, 1, 1, 1,
0.5608959, 0.1101368, 1.37031, 1, 1, 1, 1, 1,
0.5628884, 0.2284492, 1.830801, 1, 1, 1, 1, 1,
0.5641884, 0.5323064, 2.242608, 1, 1, 1, 1, 1,
0.5649834, 1.20921, 0.3208626, 1, 1, 1, 1, 1,
0.5725042, 0.6661571, 1.144415, 1, 1, 1, 1, 1,
0.5784259, 1.736261, -0.2737056, 1, 1, 1, 1, 1,
0.5792657, 0.2858995, 1.520367, 1, 1, 1, 1, 1,
0.5805044, -1.207985, 2.332394, 1, 1, 1, 1, 1,
0.5812832, -0.04513613, 2.525587, 1, 1, 1, 1, 1,
0.5817444, 0.1993545, 0.9857041, 1, 1, 1, 1, 1,
0.5824782, -0.1661987, 1.308194, 1, 1, 1, 1, 1,
0.5908166, 0.843259, 0.72162, 1, 1, 1, 1, 1,
0.5927793, -1.427521, 3.131616, 1, 1, 1, 1, 1,
0.6014806, 0.3499285, 0.07076425, 0, 0, 1, 1, 1,
0.6024438, -0.1820406, 1.205066, 1, 0, 0, 1, 1,
0.6048014, 0.3104116, 2.519517, 1, 0, 0, 1, 1,
0.6048079, 1.010816, 0.1025547, 1, 0, 0, 1, 1,
0.6069694, -0.3695851, 2.189915, 1, 0, 0, 1, 1,
0.6111948, -0.02803738, 1.682549, 1, 0, 0, 1, 1,
0.611561, 0.2418139, 0.6194651, 0, 0, 0, 1, 1,
0.6124262, 0.40767, 1.053813, 0, 0, 0, 1, 1,
0.6136689, -0.7589286, 2.766888, 0, 0, 0, 1, 1,
0.6175293, 0.239233, 1.903339, 0, 0, 0, 1, 1,
0.6239497, -0.224818, 2.393575, 0, 0, 0, 1, 1,
0.6265481, -0.1772603, 0.6692038, 0, 0, 0, 1, 1,
0.6281472, -1.032174, 1.835154, 0, 0, 0, 1, 1,
0.6339002, 0.06080233, 3.081602, 1, 1, 1, 1, 1,
0.6376439, 1.57697, 0.1373834, 1, 1, 1, 1, 1,
0.6395243, -0.1634674, 0.3160779, 1, 1, 1, 1, 1,
0.6416253, -1.202386, 2.350749, 1, 1, 1, 1, 1,
0.6425546, 0.2390389, 0.5889782, 1, 1, 1, 1, 1,
0.6452855, -1.539723, 3.780797, 1, 1, 1, 1, 1,
0.6495699, -0.2246555, 1.345669, 1, 1, 1, 1, 1,
0.6541947, -0.2542893, 2.550505, 1, 1, 1, 1, 1,
0.654745, 0.1247406, 0.9509784, 1, 1, 1, 1, 1,
0.6561341, -0.2992198, 2.520985, 1, 1, 1, 1, 1,
0.6575797, 0.3475166, 0.4721683, 1, 1, 1, 1, 1,
0.6686698, -0.3691532, 1.609914, 1, 1, 1, 1, 1,
0.6757905, 0.2673482, 1.301154, 1, 1, 1, 1, 1,
0.67685, -1.496334, 2.583164, 1, 1, 1, 1, 1,
0.6816148, -0.489308, 1.355256, 1, 1, 1, 1, 1,
0.6824734, -0.4752675, 2.361951, 0, 0, 1, 1, 1,
0.6868931, -1.073409, 3.738483, 1, 0, 0, 1, 1,
0.6892741, -0.1615739, 0.3938708, 1, 0, 0, 1, 1,
0.6930667, -0.118232, 1.403538, 1, 0, 0, 1, 1,
0.6963337, 0.7852835, 1.091804, 1, 0, 0, 1, 1,
0.6998454, 0.7754441, 0.1531066, 1, 0, 0, 1, 1,
0.700942, -0.5672445, -0.1346977, 0, 0, 0, 1, 1,
0.7009613, 1.472098, -0.2847226, 0, 0, 0, 1, 1,
0.7078827, -0.5466447, 0.9717782, 0, 0, 0, 1, 1,
0.7080311, -2.423158, 3.082469, 0, 0, 0, 1, 1,
0.7123998, 0.5236211, 0.5655916, 0, 0, 0, 1, 1,
0.7198188, 0.4252369, 1.424209, 0, 0, 0, 1, 1,
0.7229473, 1.014449, 0.7626656, 0, 0, 0, 1, 1,
0.7243481, 0.3967146, 1.166684, 1, 1, 1, 1, 1,
0.7265357, 0.7977269, 3.393518, 1, 1, 1, 1, 1,
0.7272743, -0.168364, 1.679013, 1, 1, 1, 1, 1,
0.7346119, 0.3824925, 2.294678, 1, 1, 1, 1, 1,
0.7367276, 0.7396011, -0.421145, 1, 1, 1, 1, 1,
0.738483, -0.3393634, 2.457137, 1, 1, 1, 1, 1,
0.7396998, -0.103255, 1.90827, 1, 1, 1, 1, 1,
0.74241, 0.540132, 1.246327, 1, 1, 1, 1, 1,
0.7474675, 1.449803, -2.994232, 1, 1, 1, 1, 1,
0.7543983, 1.359782, 1.844483, 1, 1, 1, 1, 1,
0.7574963, -0.1102947, 2.01645, 1, 1, 1, 1, 1,
0.7596468, 1.407103, 2.015253, 1, 1, 1, 1, 1,
0.7596954, 0.2144755, 1.019683, 1, 1, 1, 1, 1,
0.7626899, 0.2463295, -0.6084894, 1, 1, 1, 1, 1,
0.7715904, -0.7169517, 1.952585, 1, 1, 1, 1, 1,
0.7719841, -0.107928, 0.2369671, 0, 0, 1, 1, 1,
0.7755942, -2.02144, 3.196524, 1, 0, 0, 1, 1,
0.7837306, -0.6581751, 1.901635, 1, 0, 0, 1, 1,
0.7842199, 0.1229766, 0.305692, 1, 0, 0, 1, 1,
0.7874054, -1.471596, 3.240774, 1, 0, 0, 1, 1,
0.7878078, -1.383228, 2.27046, 1, 0, 0, 1, 1,
0.790538, 0.2224862, 1.052033, 0, 0, 0, 1, 1,
0.7911319, -0.4941013, 0.9265839, 0, 0, 0, 1, 1,
0.7918163, -1.716436, 2.597122, 0, 0, 0, 1, 1,
0.7918688, 0.4420477, 0.9740286, 0, 0, 0, 1, 1,
0.7952835, 0.4774686, 0.9820163, 0, 0, 0, 1, 1,
0.8040069, 0.4662104, 0.4182455, 0, 0, 0, 1, 1,
0.8045698, 0.7270813, 0.5078249, 0, 0, 0, 1, 1,
0.808473, -0.3621233, 3.172899, 1, 1, 1, 1, 1,
0.8093364, 0.3250897, 0.3225223, 1, 1, 1, 1, 1,
0.8114771, 0.7731215, 0.5547988, 1, 1, 1, 1, 1,
0.8146798, 0.6067454, 2.367606, 1, 1, 1, 1, 1,
0.8220432, 0.9439409, 0.6002995, 1, 1, 1, 1, 1,
0.8252658, 1.269918, -0.003599979, 1, 1, 1, 1, 1,
0.8272316, -0.2408711, 2.238694, 1, 1, 1, 1, 1,
0.8289899, 0.1029622, 0.3463994, 1, 1, 1, 1, 1,
0.8303791, -0.5607035, 2.804054, 1, 1, 1, 1, 1,
0.8363593, 0.8395146, 2.449602, 1, 1, 1, 1, 1,
0.8373663, 0.3996412, 4.237462, 1, 1, 1, 1, 1,
0.839935, 0.1291423, 1.922583, 1, 1, 1, 1, 1,
0.8459203, -1.142904, 2.765724, 1, 1, 1, 1, 1,
0.8636073, 0.1403175, 2.690275, 1, 1, 1, 1, 1,
0.8686823, -0.6391132, 2.188139, 1, 1, 1, 1, 1,
0.8702672, -0.3881544, 1.288229, 0, 0, 1, 1, 1,
0.8716994, -1.245941, 2.044187, 1, 0, 0, 1, 1,
0.8728732, 0.9855726, 0.7713085, 1, 0, 0, 1, 1,
0.8759485, -1.998712, 3.077606, 1, 0, 0, 1, 1,
0.879126, 0.3196386, 2.953686, 1, 0, 0, 1, 1,
0.8903268, 0.6213464, 1.815516, 1, 0, 0, 1, 1,
0.8940547, -0.5498629, 1.550567, 0, 0, 0, 1, 1,
0.8948398, -0.4601704, 2.299628, 0, 0, 0, 1, 1,
0.9100902, -0.1017542, 4.056984, 0, 0, 0, 1, 1,
0.9105077, -0.630996, 1.94406, 0, 0, 0, 1, 1,
0.9110198, 0.5542157, 2.391327, 0, 0, 0, 1, 1,
0.9249906, 0.3520938, 1.57214, 0, 0, 0, 1, 1,
0.928721, 1.148933, 2.427409, 0, 0, 0, 1, 1,
0.9288306, 0.1361875, 1.829147, 1, 1, 1, 1, 1,
0.9324266, 1.098147, -0.68362, 1, 1, 1, 1, 1,
0.9368402, -0.5766949, 1.435571, 1, 1, 1, 1, 1,
0.9382918, -0.9014599, 0.4670819, 1, 1, 1, 1, 1,
0.9537629, 1.03992, -0.4118132, 1, 1, 1, 1, 1,
0.9551513, -1.016058, 2.447716, 1, 1, 1, 1, 1,
0.9569364, -1.511397, 2.50623, 1, 1, 1, 1, 1,
0.9584501, 0.8493533, -0.170781, 1, 1, 1, 1, 1,
0.9612278, -0.002099429, 0.5211511, 1, 1, 1, 1, 1,
0.9619594, -0.2567225, 3.464675, 1, 1, 1, 1, 1,
0.9671013, 0.4355941, 0.3845243, 1, 1, 1, 1, 1,
0.971487, -0.6460223, 2.5271, 1, 1, 1, 1, 1,
0.9724165, -0.2057042, 2.098125, 1, 1, 1, 1, 1,
0.9815233, -0.39581, 2.210609, 1, 1, 1, 1, 1,
0.9855577, 1.154378, 0.9035034, 1, 1, 1, 1, 1,
0.9888255, 0.4342478, -0.07480065, 0, 0, 1, 1, 1,
0.998254, -2.093733, 2.638364, 1, 0, 0, 1, 1,
1.01039, -1.204634, 3.65458, 1, 0, 0, 1, 1,
1.0125, 0.271612, 1.217373, 1, 0, 0, 1, 1,
1.020319, 1.593137, 0.577861, 1, 0, 0, 1, 1,
1.026184, 0.4908125, 1.357989, 1, 0, 0, 1, 1,
1.026519, 0.1401781, 1.607628, 0, 0, 0, 1, 1,
1.027469, -1.024379, 3.457894, 0, 0, 0, 1, 1,
1.032426, -0.1264141, 3.504728, 0, 0, 0, 1, 1,
1.047327, -0.3054877, 2.516166, 0, 0, 0, 1, 1,
1.048742, -0.5879924, 1.142369, 0, 0, 0, 1, 1,
1.052299, -1.108807, 2.30179, 0, 0, 0, 1, 1,
1.052503, -0.3321232, 2.478267, 0, 0, 0, 1, 1,
1.057614, 0.1618413, 2.227826, 1, 1, 1, 1, 1,
1.061344, 1.744653, 2.643762, 1, 1, 1, 1, 1,
1.064501, 1.23806, 2.036252, 1, 1, 1, 1, 1,
1.078091, -1.466479, 2.880017, 1, 1, 1, 1, 1,
1.080665, -1.328279, 3.06643, 1, 1, 1, 1, 1,
1.082917, -1.090652, 2.150526, 1, 1, 1, 1, 1,
1.086069, 1.08057, -1.066286, 1, 1, 1, 1, 1,
1.088541, -1.346194, 1.591586, 1, 1, 1, 1, 1,
1.0908, -2.142231, 1.167761, 1, 1, 1, 1, 1,
1.091173, 0.8752185, 0.4755187, 1, 1, 1, 1, 1,
1.111087, 0.5601653, 2.215204, 1, 1, 1, 1, 1,
1.119486, 0.40358, 1.338935, 1, 1, 1, 1, 1,
1.124467, -0.1383542, 0.8430628, 1, 1, 1, 1, 1,
1.124762, 0.7190029, -0.1183002, 1, 1, 1, 1, 1,
1.125011, -0.1956811, -0.3850935, 1, 1, 1, 1, 1,
1.130497, 0.369886, 1.142567, 0, 0, 1, 1, 1,
1.130968, 0.9691294, 0.4054015, 1, 0, 0, 1, 1,
1.154422, 0.8567548, 0.8411895, 1, 0, 0, 1, 1,
1.16072, -0.7055058, 3.254941, 1, 0, 0, 1, 1,
1.166117, -1.091783, 2.55448, 1, 0, 0, 1, 1,
1.167305, 1.104261, 0.0004215019, 1, 0, 0, 1, 1,
1.16818, -0.7053433, 3.056185, 0, 0, 0, 1, 1,
1.168624, 1.112428, 0.7496467, 0, 0, 0, 1, 1,
1.174544, -0.8297556, 1.995551, 0, 0, 0, 1, 1,
1.186367, -0.7667387, -0.3728643, 0, 0, 0, 1, 1,
1.189905, -1.716169, 0.8129138, 0, 0, 0, 1, 1,
1.191465, -0.1641706, 3.236058, 0, 0, 0, 1, 1,
1.192959, 2.352487, -0.1867851, 0, 0, 0, 1, 1,
1.192964, 2.349124, -0.1996962, 1, 1, 1, 1, 1,
1.198459, -0.438558, 1.711356, 1, 1, 1, 1, 1,
1.198866, 1.916847, 0.05448424, 1, 1, 1, 1, 1,
1.20648, 0.2252109, 1.95841, 1, 1, 1, 1, 1,
1.20695, 1.869583, 0.04081348, 1, 1, 1, 1, 1,
1.21174, -1.273242, 1.429665, 1, 1, 1, 1, 1,
1.212419, 2.829142, 0.07708506, 1, 1, 1, 1, 1,
1.213371, -0.5875424, 3.158706, 1, 1, 1, 1, 1,
1.213949, 0.7363497, 1.695829, 1, 1, 1, 1, 1,
1.220527, -0.6754932, 0.7003313, 1, 1, 1, 1, 1,
1.220862, -0.1680703, 1.241947, 1, 1, 1, 1, 1,
1.22191, 0.1204808, 2.271522, 1, 1, 1, 1, 1,
1.22591, 0.4552744, 1.853038, 1, 1, 1, 1, 1,
1.24868, 0.297998, 0.1984477, 1, 1, 1, 1, 1,
1.253531, -1.256286, 1.553234, 1, 1, 1, 1, 1,
1.267475, 0.3268341, 2.905977, 0, 0, 1, 1, 1,
1.278309, -0.2017252, 3.136927, 1, 0, 0, 1, 1,
1.282962, -1.188457, 3.730943, 1, 0, 0, 1, 1,
1.283392, 0.3536224, 0.6736611, 1, 0, 0, 1, 1,
1.284045, -1.494109, 0.2078229, 1, 0, 0, 1, 1,
1.284511, 1.576622, 0.6898177, 1, 0, 0, 1, 1,
1.307965, -1.291176, 0.4077428, 0, 0, 0, 1, 1,
1.308859, -1.023998, 3.170766, 0, 0, 0, 1, 1,
1.30891, 0.5551266, 1.53979, 0, 0, 0, 1, 1,
1.311912, -0.5879581, 1.474669, 0, 0, 0, 1, 1,
1.319201, 0.3859226, 1.533239, 0, 0, 0, 1, 1,
1.322153, -0.8808623, 1.43812, 0, 0, 0, 1, 1,
1.329932, -0.1469086, 2.285371, 0, 0, 0, 1, 1,
1.338799, 0.9510276, 0.4903969, 1, 1, 1, 1, 1,
1.340237, 0.1147573, -0.1505747, 1, 1, 1, 1, 1,
1.341377, -0.3363344, 2.850699, 1, 1, 1, 1, 1,
1.344756, -2.080967, 3.084295, 1, 1, 1, 1, 1,
1.366615, -1.864324, 3.298163, 1, 1, 1, 1, 1,
1.374972, -0.8348337, 3.026484, 1, 1, 1, 1, 1,
1.377815, -1.134117, 0.6175334, 1, 1, 1, 1, 1,
1.384834, 0.1024771, 1.23423, 1, 1, 1, 1, 1,
1.397772, -0.1915595, 2.078823, 1, 1, 1, 1, 1,
1.403807, 1.11051, 2.888077, 1, 1, 1, 1, 1,
1.405578, 0.7551084, 2.19694, 1, 1, 1, 1, 1,
1.411374, 0.130911, 0.5619041, 1, 1, 1, 1, 1,
1.413863, -0.6915805, 1.858596, 1, 1, 1, 1, 1,
1.421795, 0.5426995, 0.5494384, 1, 1, 1, 1, 1,
1.434328, 0.9204782, 0.07023392, 1, 1, 1, 1, 1,
1.456989, 0.7869515, 0.8274601, 0, 0, 1, 1, 1,
1.481558, -0.3828278, 2.74397, 1, 0, 0, 1, 1,
1.481884, -0.8991213, 1.498755, 1, 0, 0, 1, 1,
1.484853, 0.8156437, 0.06815136, 1, 0, 0, 1, 1,
1.521466, 0.02417442, 1.502957, 1, 0, 0, 1, 1,
1.530571, 0.06538443, 0.5787824, 1, 0, 0, 1, 1,
1.532035, -0.8052559, 1.690627, 0, 0, 0, 1, 1,
1.560476, -0.8034967, 4.15527, 0, 0, 0, 1, 1,
1.562573, -0.2508299, 1.3482, 0, 0, 0, 1, 1,
1.601892, -1.066235, 2.281336, 0, 0, 0, 1, 1,
1.606595, -0.6758959, 2.495854, 0, 0, 0, 1, 1,
1.620516, 2.053881, 0.4497379, 0, 0, 0, 1, 1,
1.63274, -1.024237, 1.646437, 0, 0, 0, 1, 1,
1.690432, -0.7316176, 1.972464, 1, 1, 1, 1, 1,
1.717663, 1.57243, 1.316593, 1, 1, 1, 1, 1,
1.726234, -0.7555286, 3.697443, 1, 1, 1, 1, 1,
1.728015, 0.9199879, 0.1823855, 1, 1, 1, 1, 1,
1.742409, -0.936833, 1.325689, 1, 1, 1, 1, 1,
1.758223, -0.8713664, 2.235769, 1, 1, 1, 1, 1,
1.804839, 0.4453938, 0.2211939, 1, 1, 1, 1, 1,
1.806827, -0.1820017, 1.422781, 1, 1, 1, 1, 1,
1.827406, -0.2818343, 0.6029561, 1, 1, 1, 1, 1,
1.829169, -0.159476, 1.728598, 1, 1, 1, 1, 1,
1.834781, -2.322822, 2.78611, 1, 1, 1, 1, 1,
1.864856, 0.4295949, 0.7541256, 1, 1, 1, 1, 1,
1.866025, 0.330106, 1.982454, 1, 1, 1, 1, 1,
1.873364, -0.6231045, 1.533509, 1, 1, 1, 1, 1,
1.877909, -2.079506, 3.05949, 1, 1, 1, 1, 1,
1.88252, 2.127321, 1.971341, 0, 0, 1, 1, 1,
1.952106, -0.1449107, 3.572845, 1, 0, 0, 1, 1,
2.035944, 0.2356326, 0.6439877, 1, 0, 0, 1, 1,
2.087285, -0.3876064, 0.8372731, 1, 0, 0, 1, 1,
2.106457, 1.82482, 2.375313, 1, 0, 0, 1, 1,
2.166057, -0.6623287, 1.285593, 1, 0, 0, 1, 1,
2.176081, -0.4723084, 1.41903, 0, 0, 0, 1, 1,
2.192575, 0.3123138, 1.845299, 0, 0, 0, 1, 1,
2.210524, 0.04312321, 0.9586784, 0, 0, 0, 1, 1,
2.257507, -0.5505973, 2.884692, 0, 0, 0, 1, 1,
2.326938, 0.2750922, 1.992701, 0, 0, 0, 1, 1,
2.433372, -0.726519, 1.598053, 0, 0, 0, 1, 1,
2.51244, 0.5845112, 1.099284, 0, 0, 0, 1, 1,
2.558245, 0.1883638, 2.362543, 1, 1, 1, 1, 1,
2.662159, -0.6271428, 3.141273, 1, 1, 1, 1, 1,
2.662945, 0.2309349, 3.052667, 1, 1, 1, 1, 1,
2.868268, 0.3268594, 0.9943049, 1, 1, 1, 1, 1,
2.943344, 0.6914371, 3.586428, 1, 1, 1, 1, 1,
3.033648, -0.4766762, 1.478117, 1, 1, 1, 1, 1,
3.057652, -0.5335472, 0.7562587, 1, 1, 1, 1, 1
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
var radius = 9.526947;
var distance = 33.463;
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
mvMatrix.translate( -0.04494452, 0.2591734, -0.5106828 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.463);
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