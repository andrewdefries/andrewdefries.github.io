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
-3.105903, -1.247222, -2.310585, 1, 0, 0, 1,
-3.105024, 0.4733523, -1.928451, 1, 0.007843138, 0, 1,
-3.098665, 1.159412, -1.212927, 1, 0.01176471, 0, 1,
-2.906173, -0.1021378, -0.4685768, 1, 0.01960784, 0, 1,
-2.853544, 0.1049829, -1.974682, 1, 0.02352941, 0, 1,
-2.457791, 1.271771, -2.161312, 1, 0.03137255, 0, 1,
-2.327422, -3.126697, -0.21354, 1, 0.03529412, 0, 1,
-2.223011, 0.5145809, -0.2915569, 1, 0.04313726, 0, 1,
-2.124546, -0.8518065, -0.1728823, 1, 0.04705882, 0, 1,
-2.081974, -0.8225303, -1.77454, 1, 0.05490196, 0, 1,
-2.06844, -0.3500258, -0.2751272, 1, 0.05882353, 0, 1,
-2.059798, -1.361212, -1.943352, 1, 0.06666667, 0, 1,
-2.02301, 0.08965276, -0.5654536, 1, 0.07058824, 0, 1,
-2.012018, 0.7497625, -1.92606, 1, 0.07843138, 0, 1,
-2.011187, -1.599738, -1.216514, 1, 0.08235294, 0, 1,
-1.910713, -0.8485153, -1.318687, 1, 0.09019608, 0, 1,
-1.904891, 1.835934, -0.152179, 1, 0.09411765, 0, 1,
-1.903381, 1.252168, -1.655118, 1, 0.1019608, 0, 1,
-1.828908, -0.01316052, -1.125961, 1, 0.1098039, 0, 1,
-1.82046, 1.865462, -1.377753, 1, 0.1137255, 0, 1,
-1.808484, 0.861052, -1.787892, 1, 0.1215686, 0, 1,
-1.801426, -0.462744, -2.799951, 1, 0.1254902, 0, 1,
-1.793338, 0.2487607, -2.619678, 1, 0.1333333, 0, 1,
-1.793258, -0.8903092, -2.277361, 1, 0.1372549, 0, 1,
-1.773772, 1.443493, -0.2457039, 1, 0.145098, 0, 1,
-1.771021, 0.4156509, -0.2015679, 1, 0.1490196, 0, 1,
-1.753585, -0.4121234, -1.58295, 1, 0.1568628, 0, 1,
-1.743305, -1.308196, -2.059331, 1, 0.1607843, 0, 1,
-1.729862, -0.0486665, -0.5502231, 1, 0.1686275, 0, 1,
-1.710428, 0.5886606, -2.673326, 1, 0.172549, 0, 1,
-1.704283, 2.171817, -0.7799764, 1, 0.1803922, 0, 1,
-1.703137, -0.8454869, -1.007581, 1, 0.1843137, 0, 1,
-1.700196, 3.05866, -1.891191, 1, 0.1921569, 0, 1,
-1.699691, -2.890774, -2.868557, 1, 0.1960784, 0, 1,
-1.693539, -1.136524, -3.172062, 1, 0.2039216, 0, 1,
-1.68092, 1.153979, -0.9287993, 1, 0.2117647, 0, 1,
-1.660772, 1.039445, -0.8844676, 1, 0.2156863, 0, 1,
-1.656748, 0.6941866, -0.3444063, 1, 0.2235294, 0, 1,
-1.655125, -1.657473, -2.509795, 1, 0.227451, 0, 1,
-1.655065, -1.259737, -3.072625, 1, 0.2352941, 0, 1,
-1.624883, -0.7624677, -2.482637, 1, 0.2392157, 0, 1,
-1.624672, 0.6099062, -1.138993, 1, 0.2470588, 0, 1,
-1.62345, -0.2786086, -1.355377, 1, 0.2509804, 0, 1,
-1.622632, 1.450132, -2.559768, 1, 0.2588235, 0, 1,
-1.615277, -1.950915, -3.340054, 1, 0.2627451, 0, 1,
-1.607949, -0.1863772, -1.786619, 1, 0.2705882, 0, 1,
-1.606669, 0.3915998, -2.19675, 1, 0.2745098, 0, 1,
-1.605224, 1.753966, -1.434002, 1, 0.282353, 0, 1,
-1.603955, 1.349982, -2.38526, 1, 0.2862745, 0, 1,
-1.600176, -0.1794202, -3.683064, 1, 0.2941177, 0, 1,
-1.593747, 0.7616668, -1.574406, 1, 0.3019608, 0, 1,
-1.585284, -1.916056, -3.032558, 1, 0.3058824, 0, 1,
-1.576863, -0.3179452, -1.429477, 1, 0.3137255, 0, 1,
-1.576204, -0.2904978, -0.7004479, 1, 0.3176471, 0, 1,
-1.570241, 1.40952, -1.640036, 1, 0.3254902, 0, 1,
-1.562739, -0.1486948, -0.7047802, 1, 0.3294118, 0, 1,
-1.552011, 0.0158978, -0.8569491, 1, 0.3372549, 0, 1,
-1.548863, 1.578537, -0.3021364, 1, 0.3411765, 0, 1,
-1.543882, -1.325674, -1.22188, 1, 0.3490196, 0, 1,
-1.542425, -0.4865223, -0.4318397, 1, 0.3529412, 0, 1,
-1.540997, -1.969789, -1.60061, 1, 0.3607843, 0, 1,
-1.525368, 0.7359337, -0.3731165, 1, 0.3647059, 0, 1,
-1.514759, -0.0101971, -1.608471, 1, 0.372549, 0, 1,
-1.510995, 0.9164152, 0.1167569, 1, 0.3764706, 0, 1,
-1.507378, -0.6259238, -3.642255, 1, 0.3843137, 0, 1,
-1.499383, -1.311352, -2.795348, 1, 0.3882353, 0, 1,
-1.495682, -0.9960276, -2.09315, 1, 0.3960784, 0, 1,
-1.495478, 1.812978, -0.1754006, 1, 0.4039216, 0, 1,
-1.486528, 1.332187, -1.574442, 1, 0.4078431, 0, 1,
-1.479232, -0.7216979, -2.785817, 1, 0.4156863, 0, 1,
-1.462968, 1.188044, 0.2726453, 1, 0.4196078, 0, 1,
-1.462731, -0.2350964, -3.063739, 1, 0.427451, 0, 1,
-1.460086, 0.4249444, -1.954865, 1, 0.4313726, 0, 1,
-1.458473, 0.8930249, -1.374319, 1, 0.4392157, 0, 1,
-1.451945, -1.800771, -3.207907, 1, 0.4431373, 0, 1,
-1.442572, 3.588563, -0.1493805, 1, 0.4509804, 0, 1,
-1.439718, -1.122398, -0.3691753, 1, 0.454902, 0, 1,
-1.433592, 0.03294768, -1.595974, 1, 0.4627451, 0, 1,
-1.432962, -0.3497593, -2.597781, 1, 0.4666667, 0, 1,
-1.429847, -0.9666763, -2.484171, 1, 0.4745098, 0, 1,
-1.426085, 0.03930189, -1.46014, 1, 0.4784314, 0, 1,
-1.421564, -0.2798579, -2.250836, 1, 0.4862745, 0, 1,
-1.412334, 1.199254, -1.257327, 1, 0.4901961, 0, 1,
-1.410876, -0.002596207, -1.517964, 1, 0.4980392, 0, 1,
-1.404279, -1.620449, -1.914788, 1, 0.5058824, 0, 1,
-1.39983, -0.4699213, -1.503772, 1, 0.509804, 0, 1,
-1.380984, -0.02162326, -2.239701, 1, 0.5176471, 0, 1,
-1.377809, 1.198456, -1.834753, 1, 0.5215687, 0, 1,
-1.366617, 0.6091202, -0.812618, 1, 0.5294118, 0, 1,
-1.361294, -1.791589, -1.972096, 1, 0.5333334, 0, 1,
-1.358847, -1.163678, -1.806302, 1, 0.5411765, 0, 1,
-1.347233, 0.7713472, 0.2149688, 1, 0.5450981, 0, 1,
-1.346271, 1.196978, -1.207217, 1, 0.5529412, 0, 1,
-1.344375, -1.051149, -2.182051, 1, 0.5568628, 0, 1,
-1.341949, 2.007651, -2.195851, 1, 0.5647059, 0, 1,
-1.334803, 0.1831155, -2.436031, 1, 0.5686275, 0, 1,
-1.330861, 0.3871492, -1.017958, 1, 0.5764706, 0, 1,
-1.328403, 0.1535704, -1.281536, 1, 0.5803922, 0, 1,
-1.328263, -1.375746, -4.55074, 1, 0.5882353, 0, 1,
-1.320665, -0.017183, -2.05786, 1, 0.5921569, 0, 1,
-1.320264, -0.6104214, -0.11987, 1, 0.6, 0, 1,
-1.313272, 0.7348285, -0.6101462, 1, 0.6078432, 0, 1,
-1.313204, 0.03136573, 0.3514801, 1, 0.6117647, 0, 1,
-1.306956, -1.403146, -2.123986, 1, 0.6196079, 0, 1,
-1.301433, 0.4158795, -1.114749, 1, 0.6235294, 0, 1,
-1.297357, 0.09763584, -0.8806355, 1, 0.6313726, 0, 1,
-1.293463, -0.2040896, -1.103529, 1, 0.6352941, 0, 1,
-1.292318, -1.791804, -3.8483, 1, 0.6431373, 0, 1,
-1.289418, 1.789508, -0.9042141, 1, 0.6470588, 0, 1,
-1.267697, 1.540738, -0.3297523, 1, 0.654902, 0, 1,
-1.259319, 1.260352, -0.6126032, 1, 0.6588235, 0, 1,
-1.257634, -0.5709565, -0.6035585, 1, 0.6666667, 0, 1,
-1.249003, 1.116489, -0.566745, 1, 0.6705883, 0, 1,
-1.248351, 0.08767441, -3.84855, 1, 0.6784314, 0, 1,
-1.246967, -0.1124516, -2.474187, 1, 0.682353, 0, 1,
-1.241762, 0.8316682, -2.085487, 1, 0.6901961, 0, 1,
-1.239923, 0.148248, -0.621804, 1, 0.6941177, 0, 1,
-1.239378, 0.9167051, -0.3222762, 1, 0.7019608, 0, 1,
-1.237515, -0.7803428, -1.29154, 1, 0.7098039, 0, 1,
-1.235331, -0.1731188, -1.909325, 1, 0.7137255, 0, 1,
-1.233162, -0.5977814, -3.280077, 1, 0.7215686, 0, 1,
-1.232823, -0.8687655, -2.643117, 1, 0.7254902, 0, 1,
-1.209656, -0.5630955, -3.147691, 1, 0.7333333, 0, 1,
-1.197814, 0.2125528, -1.771724, 1, 0.7372549, 0, 1,
-1.197506, -0.366093, -2.613234, 1, 0.7450981, 0, 1,
-1.196941, 0.5487175, 0.3624272, 1, 0.7490196, 0, 1,
-1.195947, 0.4236669, -2.918149, 1, 0.7568628, 0, 1,
-1.19523, 0.2610163, -2.232948, 1, 0.7607843, 0, 1,
-1.194836, 2.425987, -0.1459662, 1, 0.7686275, 0, 1,
-1.190739, -2.079273, -2.289917, 1, 0.772549, 0, 1,
-1.187322, -0.7494497, -3.257904, 1, 0.7803922, 0, 1,
-1.184836, -0.9920269, -1.454682, 1, 0.7843137, 0, 1,
-1.183983, 2.247862, 0.8993351, 1, 0.7921569, 0, 1,
-1.177568, 0.7456379, -2.063534, 1, 0.7960784, 0, 1,
-1.165321, -0.3124831, -2.583316, 1, 0.8039216, 0, 1,
-1.161166, 0.604587, -1.053278, 1, 0.8117647, 0, 1,
-1.154933, 1.155012, -0.3396559, 1, 0.8156863, 0, 1,
-1.146928, -1.56599, -1.517281, 1, 0.8235294, 0, 1,
-1.135976, -0.4392426, -0.6814126, 1, 0.827451, 0, 1,
-1.134217, -1.863159, -2.527586, 1, 0.8352941, 0, 1,
-1.13239, -0.1505071, -1.826309, 1, 0.8392157, 0, 1,
-1.129947, 0.6132625, -1.162195, 1, 0.8470588, 0, 1,
-1.121903, 0.4938573, -2.369895, 1, 0.8509804, 0, 1,
-1.119675, 0.1959766, -1.216633, 1, 0.8588235, 0, 1,
-1.115611, -1.790222, -4.396518, 1, 0.8627451, 0, 1,
-1.113693, -0.187219, -1.689184, 1, 0.8705882, 0, 1,
-1.107044, 0.9075077, -1.532897, 1, 0.8745098, 0, 1,
-1.104358, -0.973106, -1.342337, 1, 0.8823529, 0, 1,
-1.099377, 0.1526128, -2.667698, 1, 0.8862745, 0, 1,
-1.09753, -1.095609, -2.195591, 1, 0.8941177, 0, 1,
-1.093309, -0.3579679, -0.8693604, 1, 0.8980392, 0, 1,
-1.0919, 0.1663229, -0.1400385, 1, 0.9058824, 0, 1,
-1.083731, -0.2375626, -2.053599, 1, 0.9137255, 0, 1,
-1.080361, -0.7846727, -2.648096, 1, 0.9176471, 0, 1,
-1.075385, 1.48169, 0.1213465, 1, 0.9254902, 0, 1,
-1.059527, 0.5120265, 0.3881343, 1, 0.9294118, 0, 1,
-1.057513, -1.943118, -2.900181, 1, 0.9372549, 0, 1,
-1.04566, 0.2034146, -0.1498069, 1, 0.9411765, 0, 1,
-1.036573, 0.2856632, -1.22173, 1, 0.9490196, 0, 1,
-1.027821, 1.456043, 0.1237093, 1, 0.9529412, 0, 1,
-1.025194, -0.1569441, -2.295404, 1, 0.9607843, 0, 1,
-1.00872, -0.868607, -4.271744, 1, 0.9647059, 0, 1,
-1.008213, -1.32015, -2.667105, 1, 0.972549, 0, 1,
-0.9934924, -1.065528, -3.613188, 1, 0.9764706, 0, 1,
-0.9913517, 0.1447723, -2.783087, 1, 0.9843137, 0, 1,
-0.9823132, -0.7588381, -2.051755, 1, 0.9882353, 0, 1,
-0.9812025, 1.305498, -2.565537, 1, 0.9960784, 0, 1,
-0.9756532, 0.4201219, -2.218227, 0.9960784, 1, 0, 1,
-0.964054, -0.3265256, -3.370173, 0.9921569, 1, 0, 1,
-0.9619536, 0.751163, -1.874783, 0.9843137, 1, 0, 1,
-0.956687, 2.349008, 0.01374728, 0.9803922, 1, 0, 1,
-0.945339, 0.5433097, -1.686421, 0.972549, 1, 0, 1,
-0.945304, -0.3464563, -2.422523, 0.9686275, 1, 0, 1,
-0.9281541, 0.2102721, -0.4992318, 0.9607843, 1, 0, 1,
-0.9256834, 0.02437024, -1.539958, 0.9568627, 1, 0, 1,
-0.9228298, -0.3731067, -0.6577587, 0.9490196, 1, 0, 1,
-0.9211257, -0.3120985, -1.655035, 0.945098, 1, 0, 1,
-0.9187136, -0.08216675, -1.241059, 0.9372549, 1, 0, 1,
-0.9185433, 1.0152, -1.778987, 0.9333333, 1, 0, 1,
-0.9151826, 0.7270722, -0.2826846, 0.9254902, 1, 0, 1,
-0.9129426, 0.4589964, -1.390541, 0.9215686, 1, 0, 1,
-0.9124186, -0.751044, -2.345323, 0.9137255, 1, 0, 1,
-0.9119581, 0.2226693, -1.804076, 0.9098039, 1, 0, 1,
-0.9116556, -0.7297508, -2.516021, 0.9019608, 1, 0, 1,
-0.9116281, 1.772382, 0.4570071, 0.8941177, 1, 0, 1,
-0.9093509, 1.744174, -0.7654141, 0.8901961, 1, 0, 1,
-0.9046378, -1.312105, -0.6773943, 0.8823529, 1, 0, 1,
-0.9044385, 0.3765563, -3.081496, 0.8784314, 1, 0, 1,
-0.9017332, -0.19, -1.074573, 0.8705882, 1, 0, 1,
-0.9000162, -0.5688509, -3.314332, 0.8666667, 1, 0, 1,
-0.8971547, 1.324658, -0.6242267, 0.8588235, 1, 0, 1,
-0.8939957, 0.6325935, -0.747435, 0.854902, 1, 0, 1,
-0.8909028, 0.198439, -0.8411822, 0.8470588, 1, 0, 1,
-0.8904933, 1.188071, 0.02208499, 0.8431373, 1, 0, 1,
-0.8856041, 0.4080988, -0.4479814, 0.8352941, 1, 0, 1,
-0.8837987, -0.2102344, -2.04909, 0.8313726, 1, 0, 1,
-0.8830845, 0.6502449, -0.5748354, 0.8235294, 1, 0, 1,
-0.8808203, 0.8025704, -0.5128599, 0.8196079, 1, 0, 1,
-0.8657769, -1.249563, -1.059034, 0.8117647, 1, 0, 1,
-0.8652607, -0.5704863, -2.210448, 0.8078431, 1, 0, 1,
-0.8641766, -1.399244, -1.793296, 0.8, 1, 0, 1,
-0.8590856, 0.6057256, -2.559841, 0.7921569, 1, 0, 1,
-0.8536071, -0.1931014, -0.8258719, 0.7882353, 1, 0, 1,
-0.8505275, -2.562061, -3.172532, 0.7803922, 1, 0, 1,
-0.8451869, 0.5240417, 0.112097, 0.7764706, 1, 0, 1,
-0.8400943, -1.20275, -3.364319, 0.7686275, 1, 0, 1,
-0.8371703, 1.300833, -1.071782, 0.7647059, 1, 0, 1,
-0.8359926, 1.610267, -1.028259, 0.7568628, 1, 0, 1,
-0.8353108, -0.366367, -1.94516, 0.7529412, 1, 0, 1,
-0.8312643, 0.09022437, -0.4804473, 0.7450981, 1, 0, 1,
-0.8116958, -0.6390298, -3.839403, 0.7411765, 1, 0, 1,
-0.8106402, -0.7164052, -1.789957, 0.7333333, 1, 0, 1,
-0.8088887, -0.1513799, -0.7547224, 0.7294118, 1, 0, 1,
-0.804938, 0.9093528, -1.270613, 0.7215686, 1, 0, 1,
-0.8024901, -0.5389014, -1.074063, 0.7176471, 1, 0, 1,
-0.7981835, -1.052024, -3.323139, 0.7098039, 1, 0, 1,
-0.7980722, 0.4369106, 0.008308824, 0.7058824, 1, 0, 1,
-0.7889809, -1.137647, -3.051871, 0.6980392, 1, 0, 1,
-0.7791322, 0.4001859, -2.692554, 0.6901961, 1, 0, 1,
-0.7732217, 1.474994, 0.6943635, 0.6862745, 1, 0, 1,
-0.7726004, 0.02433405, 0.2537423, 0.6784314, 1, 0, 1,
-0.7686833, -0.002038826, -2.52301, 0.6745098, 1, 0, 1,
-0.7654191, -0.829299, -1.169057, 0.6666667, 1, 0, 1,
-0.7607599, -0.02046364, -1.824542, 0.6627451, 1, 0, 1,
-0.7596769, 0.1815112, -1.177834, 0.654902, 1, 0, 1,
-0.7490519, -1.319906, -3.167756, 0.6509804, 1, 0, 1,
-0.7451596, 0.5968086, -0.5771624, 0.6431373, 1, 0, 1,
-0.740089, -0.2321635, -1.940233, 0.6392157, 1, 0, 1,
-0.7353809, 0.9733821, -0.5560727, 0.6313726, 1, 0, 1,
-0.7326393, 0.4924424, -1.434743, 0.627451, 1, 0, 1,
-0.7281355, -0.9820567, -3.192116, 0.6196079, 1, 0, 1,
-0.7188044, 0.113281, -0.5153725, 0.6156863, 1, 0, 1,
-0.7180376, 0.3204122, -3.056793, 0.6078432, 1, 0, 1,
-0.7148191, -1.348967, -1.343328, 0.6039216, 1, 0, 1,
-0.7140425, 0.552101, 0.4208582, 0.5960785, 1, 0, 1,
-0.7133223, 0.951641, 0.3131083, 0.5882353, 1, 0, 1,
-0.7096822, 0.1150587, -0.4742636, 0.5843138, 1, 0, 1,
-0.7068044, -0.391569, -1.116315, 0.5764706, 1, 0, 1,
-0.7060655, -0.1866363, -2.110975, 0.572549, 1, 0, 1,
-0.7040358, -0.7614799, -2.530406, 0.5647059, 1, 0, 1,
-0.702792, -0.0884777, -2.049178, 0.5607843, 1, 0, 1,
-0.6984019, 0.519514, -2.281792, 0.5529412, 1, 0, 1,
-0.6937048, -0.09301008, -1.893208, 0.5490196, 1, 0, 1,
-0.6841739, -0.1710036, -3.302249, 0.5411765, 1, 0, 1,
-0.6840284, 0.8574939, 0.5528374, 0.5372549, 1, 0, 1,
-0.6817357, -1.024381, -2.55659, 0.5294118, 1, 0, 1,
-0.6807554, 0.1154572, -0.9926963, 0.5254902, 1, 0, 1,
-0.6778459, 1.194403, -0.02924157, 0.5176471, 1, 0, 1,
-0.6774911, 0.6540962, -1.603907, 0.5137255, 1, 0, 1,
-0.6751494, -0.1956502, -2.223247, 0.5058824, 1, 0, 1,
-0.6736347, 0.6164548, -0.7235076, 0.5019608, 1, 0, 1,
-0.6662539, -0.1280786, -3.205922, 0.4941176, 1, 0, 1,
-0.6656292, -1.456916, -2.884249, 0.4862745, 1, 0, 1,
-0.6603857, 0.0105886, -1.910612, 0.4823529, 1, 0, 1,
-0.6585712, 0.9554594, 0.4204074, 0.4745098, 1, 0, 1,
-0.6487492, 0.9761652, -2.320762, 0.4705882, 1, 0, 1,
-0.6419874, 0.8871437, 0.1248757, 0.4627451, 1, 0, 1,
-0.6381109, 0.4794794, -0.2838772, 0.4588235, 1, 0, 1,
-0.6342022, -0.9102255, -2.873303, 0.4509804, 1, 0, 1,
-0.6298124, 1.326284, -1.217815, 0.4470588, 1, 0, 1,
-0.6250437, -1.37003, -1.990727, 0.4392157, 1, 0, 1,
-0.6156866, -0.2441109, -2.364485, 0.4352941, 1, 0, 1,
-0.6141323, -0.1191507, -1.12467, 0.427451, 1, 0, 1,
-0.6119869, 0.6199846, -2.366597, 0.4235294, 1, 0, 1,
-0.6095963, 0.3380068, -0.09117428, 0.4156863, 1, 0, 1,
-0.6066676, -0.2259136, -1.318045, 0.4117647, 1, 0, 1,
-0.6011533, -1.263906, -2.946486, 0.4039216, 1, 0, 1,
-0.6007732, -0.1273198, -1.804395, 0.3960784, 1, 0, 1,
-0.5970811, -0.851568, -2.289319, 0.3921569, 1, 0, 1,
-0.5968071, 1.752241, 0.3044465, 0.3843137, 1, 0, 1,
-0.5958524, 1.431366, -0.7266661, 0.3803922, 1, 0, 1,
-0.582576, 0.09044573, -1.733326, 0.372549, 1, 0, 1,
-0.581915, 0.3502464, -1.403818, 0.3686275, 1, 0, 1,
-0.5814493, 0.2153287, -1.685677, 0.3607843, 1, 0, 1,
-0.5776568, 1.720731, -0.1942689, 0.3568628, 1, 0, 1,
-0.5767122, -0.9112002, -2.049841, 0.3490196, 1, 0, 1,
-0.5637197, 0.4989363, -2.012244, 0.345098, 1, 0, 1,
-0.561447, -0.9481779, -2.424735, 0.3372549, 1, 0, 1,
-0.5516751, 0.770784, -0.3826124, 0.3333333, 1, 0, 1,
-0.5437935, 0.934655, -0.7379121, 0.3254902, 1, 0, 1,
-0.5421768, -1.086402, -2.233628, 0.3215686, 1, 0, 1,
-0.5329146, -0.8742067, -2.687548, 0.3137255, 1, 0, 1,
-0.532809, -0.383371, -0.2761641, 0.3098039, 1, 0, 1,
-0.5285413, -0.2086538, -3.407671, 0.3019608, 1, 0, 1,
-0.5261272, 1.636195, -1.945902, 0.2941177, 1, 0, 1,
-0.5256344, 0.01922875, -2.564351, 0.2901961, 1, 0, 1,
-0.5254305, 0.9161447, 1.224022, 0.282353, 1, 0, 1,
-0.5232453, 0.536303, -1.451176, 0.2784314, 1, 0, 1,
-0.5166014, 0.1523669, 1.475063, 0.2705882, 1, 0, 1,
-0.5075938, -1.315322, -1.666311, 0.2666667, 1, 0, 1,
-0.5058274, 1.346583, 0.403892, 0.2588235, 1, 0, 1,
-0.5026754, -0.8344834, -2.043615, 0.254902, 1, 0, 1,
-0.5012259, -1.212103, -4.149016, 0.2470588, 1, 0, 1,
-0.5007091, -1.145252, -1.236428, 0.2431373, 1, 0, 1,
-0.5006485, -0.6866964, -1.78419, 0.2352941, 1, 0, 1,
-0.4993383, 1.357136, 0.3354981, 0.2313726, 1, 0, 1,
-0.4976994, 1.277514, 0.6896403, 0.2235294, 1, 0, 1,
-0.4964758, 1.080793, -0.2180098, 0.2196078, 1, 0, 1,
-0.4963362, 0.1848107, 0.5819198, 0.2117647, 1, 0, 1,
-0.4960009, 0.3858849, -0.6832385, 0.2078431, 1, 0, 1,
-0.4885486, -0.8884374, -2.70579, 0.2, 1, 0, 1,
-0.4875847, 1.515488, 1.120711, 0.1921569, 1, 0, 1,
-0.4845269, -1.017178, -4.357558, 0.1882353, 1, 0, 1,
-0.4823684, 1.609292, 0.001179947, 0.1803922, 1, 0, 1,
-0.481431, 0.4314506, -1.090729, 0.1764706, 1, 0, 1,
-0.4703276, -0.9748549, -1.319397, 0.1686275, 1, 0, 1,
-0.4623813, 1.004631, -0.6681705, 0.1647059, 1, 0, 1,
-0.4608867, -1.303217, -3.517818, 0.1568628, 1, 0, 1,
-0.4598248, 1.068002, -1.084894, 0.1529412, 1, 0, 1,
-0.4559702, 0.8497203, -1.432156, 0.145098, 1, 0, 1,
-0.4558767, 0.2757399, 0.1948602, 0.1411765, 1, 0, 1,
-0.4432777, 0.2919289, -2.677737, 0.1333333, 1, 0, 1,
-0.4418458, 0.9336595, -0.6559607, 0.1294118, 1, 0, 1,
-0.4366837, -0.1336948, -3.513384, 0.1215686, 1, 0, 1,
-0.4334713, 0.5614488, 0.01409772, 0.1176471, 1, 0, 1,
-0.4217602, 0.2712391, -3.08935, 0.1098039, 1, 0, 1,
-0.4201799, -0.5416292, -1.922243, 0.1058824, 1, 0, 1,
-0.4165467, -0.3712533, -3.005305, 0.09803922, 1, 0, 1,
-0.4164346, -1.086502, -2.956726, 0.09019608, 1, 0, 1,
-0.4155698, 0.2025475, -1.455728, 0.08627451, 1, 0, 1,
-0.4140037, -0.6267231, -2.273784, 0.07843138, 1, 0, 1,
-0.4127706, 0.7087067, -0.4880701, 0.07450981, 1, 0, 1,
-0.4124688, -1.076858, -1.917418, 0.06666667, 1, 0, 1,
-0.4122998, 0.7184846, -0.7707424, 0.0627451, 1, 0, 1,
-0.4120295, -0.02286135, -1.47557, 0.05490196, 1, 0, 1,
-0.4111937, 1.607895, -1.737408, 0.05098039, 1, 0, 1,
-0.4109007, -1.877976, -2.609576, 0.04313726, 1, 0, 1,
-0.4094523, -1.322334, -2.198657, 0.03921569, 1, 0, 1,
-0.4068555, 0.2220363, -1.656753, 0.03137255, 1, 0, 1,
-0.4027679, -0.5377603, -1.407938, 0.02745098, 1, 0, 1,
-0.4026514, 0.949249, -0.5256792, 0.01960784, 1, 0, 1,
-0.3991451, -0.7173408, -2.942552, 0.01568628, 1, 0, 1,
-0.398739, -1.124725, -3.871205, 0.007843138, 1, 0, 1,
-0.388657, 1.489383, 0.6415305, 0.003921569, 1, 0, 1,
-0.387156, 0.5147775, 1.639297, 0, 1, 0.003921569, 1,
-0.3834897, -0.7049657, -3.587149, 0, 1, 0.01176471, 1,
-0.3821271, -0.3912927, -2.405242, 0, 1, 0.01568628, 1,
-0.3766434, 0.4333243, 0.1897885, 0, 1, 0.02352941, 1,
-0.3757744, 0.1344055, -2.307077, 0, 1, 0.02745098, 1,
-0.372724, -0.6794648, -2.273736, 0, 1, 0.03529412, 1,
-0.3715697, 0.2417336, -1.352666, 0, 1, 0.03921569, 1,
-0.3599673, 0.5522904, 0.2012608, 0, 1, 0.04705882, 1,
-0.3589082, -1.265038, -4.544019, 0, 1, 0.05098039, 1,
-0.3542342, -0.5177165, -2.535208, 0, 1, 0.05882353, 1,
-0.3489664, -1.515029, -2.037966, 0, 1, 0.0627451, 1,
-0.3468049, 0.870662, -0.4876471, 0, 1, 0.07058824, 1,
-0.3466729, -0.2421645, -1.220955, 0, 1, 0.07450981, 1,
-0.3466706, 0.7298239, -0.3620942, 0, 1, 0.08235294, 1,
-0.3462021, -0.01587102, -0.5262101, 0, 1, 0.08627451, 1,
-0.3461387, -0.76245, -1.758129, 0, 1, 0.09411765, 1,
-0.3447678, -0.6322242, -1.293688, 0, 1, 0.1019608, 1,
-0.343245, 1.26203, 0.2944179, 0, 1, 0.1058824, 1,
-0.3414411, 0.3012415, -0.9754544, 0, 1, 0.1137255, 1,
-0.3397848, -0.4928727, -2.872396, 0, 1, 0.1176471, 1,
-0.3386505, 0.8119895, -1.301334, 0, 1, 0.1254902, 1,
-0.3379149, -0.2742375, -2.84396, 0, 1, 0.1294118, 1,
-0.3363485, -0.4820273, -2.657447, 0, 1, 0.1372549, 1,
-0.3354379, 1.192629, 1.487359, 0, 1, 0.1411765, 1,
-0.3344522, -0.9596424, -2.673257, 0, 1, 0.1490196, 1,
-0.3309633, 0.8886547, -1.589749, 0, 1, 0.1529412, 1,
-0.3300462, -0.5331385, -1.110945, 0, 1, 0.1607843, 1,
-0.327635, -0.2379701, -2.392503, 0, 1, 0.1647059, 1,
-0.3262163, -1.066112, -2.80789, 0, 1, 0.172549, 1,
-0.3226638, -0.3594229, -1.857855, 0, 1, 0.1764706, 1,
-0.3163222, -0.4853142, -2.652922, 0, 1, 0.1843137, 1,
-0.3131036, 0.03952, -1.006843, 0, 1, 0.1882353, 1,
-0.311555, 0.3234151, -2.435085, 0, 1, 0.1960784, 1,
-0.3079588, -1.188674, -2.774294, 0, 1, 0.2039216, 1,
-0.3051012, -0.6349776, -0.9349695, 0, 1, 0.2078431, 1,
-0.3038798, 0.7163143, -1.878099, 0, 1, 0.2156863, 1,
-0.2967059, 0.8065234, -0.107854, 0, 1, 0.2196078, 1,
-0.2937983, 1.661801, -0.02363961, 0, 1, 0.227451, 1,
-0.2894122, -0.09657919, -1.186494, 0, 1, 0.2313726, 1,
-0.2844392, -0.1480071, -2.339181, 0, 1, 0.2392157, 1,
-0.283998, -0.5502749, -2.466776, 0, 1, 0.2431373, 1,
-0.2790829, 0.1165382, -1.453612, 0, 1, 0.2509804, 1,
-0.2758683, 3.04582, 0.2140243, 0, 1, 0.254902, 1,
-0.2752275, 2.000163, 0.8457887, 0, 1, 0.2627451, 1,
-0.2697725, 0.1921708, 0.0809023, 0, 1, 0.2666667, 1,
-0.2687719, -0.5654536, -1.59811, 0, 1, 0.2745098, 1,
-0.2617076, -0.2197615, -2.387172, 0, 1, 0.2784314, 1,
-0.2565713, -0.03099124, -1.729991, 0, 1, 0.2862745, 1,
-0.2564875, 0.03303103, -2.327574, 0, 1, 0.2901961, 1,
-0.2536458, 0.2337905, 1.332573, 0, 1, 0.2980392, 1,
-0.2517473, -0.2979745, -2.079782, 0, 1, 0.3058824, 1,
-0.2499066, 0.4072132, 1.140011, 0, 1, 0.3098039, 1,
-0.2496658, 1.147377, 0.9535905, 0, 1, 0.3176471, 1,
-0.2462314, -1.927287, -2.496045, 0, 1, 0.3215686, 1,
-0.2451345, 1.382458, 0.6077784, 0, 1, 0.3294118, 1,
-0.2432805, -0.9349835, -2.180132, 0, 1, 0.3333333, 1,
-0.2413433, -0.07360463, -1.531285, 0, 1, 0.3411765, 1,
-0.2397396, -0.3634652, -3.603058, 0, 1, 0.345098, 1,
-0.2369238, -0.8104802, -2.230731, 0, 1, 0.3529412, 1,
-0.23625, -1.291053, -1.470563, 0, 1, 0.3568628, 1,
-0.2358778, 1.369831, -0.3620207, 0, 1, 0.3647059, 1,
-0.2348936, -0.1319323, -1.820502, 0, 1, 0.3686275, 1,
-0.2339635, 1.515834, 0.6240037, 0, 1, 0.3764706, 1,
-0.2250794, -0.569154, -1.015066, 0, 1, 0.3803922, 1,
-0.2243084, 1.333763, -0.1372332, 0, 1, 0.3882353, 1,
-0.2184269, -1.643221, -1.663672, 0, 1, 0.3921569, 1,
-0.2162386, 1.073259, -1.115916, 0, 1, 0.4, 1,
-0.2160104, -0.8654372, -2.165143, 0, 1, 0.4078431, 1,
-0.2130928, 0.4624538, 1.631069, 0, 1, 0.4117647, 1,
-0.2101564, -1.490526, -2.770315, 0, 1, 0.4196078, 1,
-0.2074078, 1.042701, -1.906779, 0, 1, 0.4235294, 1,
-0.2031275, -0.04722978, -1.929428, 0, 1, 0.4313726, 1,
-0.1994069, -0.5356368, -2.226576, 0, 1, 0.4352941, 1,
-0.1961219, -0.2700352, -3.966514, 0, 1, 0.4431373, 1,
-0.1931356, -2.050934, -3.765297, 0, 1, 0.4470588, 1,
-0.1930416, 0.08781586, -0.7933071, 0, 1, 0.454902, 1,
-0.1923943, 0.5137984, 0.008264429, 0, 1, 0.4588235, 1,
-0.1916053, -0.09744677, -3.058609, 0, 1, 0.4666667, 1,
-0.1871564, 1.041434, -0.7776206, 0, 1, 0.4705882, 1,
-0.1813104, -1.205698, -4.299144, 0, 1, 0.4784314, 1,
-0.1811897, 0.2182092, 0.1625423, 0, 1, 0.4823529, 1,
-0.1809839, 0.3892986, -0.7806399, 0, 1, 0.4901961, 1,
-0.1743068, -0.6030222, -3.316885, 0, 1, 0.4941176, 1,
-0.1730359, 0.1248636, 0.05284709, 0, 1, 0.5019608, 1,
-0.1697182, 0.1157559, -1.057077, 0, 1, 0.509804, 1,
-0.1667834, -1.009833, -1.902722, 0, 1, 0.5137255, 1,
-0.1652871, 0.2375221, -1.79249, 0, 1, 0.5215687, 1,
-0.1644015, 2.353205, -1.538029, 0, 1, 0.5254902, 1,
-0.1618245, 0.4258539, -0.05892014, 0, 1, 0.5333334, 1,
-0.1600581, -0.7057002, -2.244073, 0, 1, 0.5372549, 1,
-0.1583778, -0.6915223, -2.639466, 0, 1, 0.5450981, 1,
-0.1555293, 0.923554, 0.1945893, 0, 1, 0.5490196, 1,
-0.1530568, 0.3509231, -0.3048147, 0, 1, 0.5568628, 1,
-0.1451683, -0.4402867, -2.895371, 0, 1, 0.5607843, 1,
-0.1449157, 0.8880312, 0.3451646, 0, 1, 0.5686275, 1,
-0.1431863, 0.6650712, -1.916789, 0, 1, 0.572549, 1,
-0.1429211, 0.2423371, -1.942015, 0, 1, 0.5803922, 1,
-0.1424967, 0.5143622, 1.494114, 0, 1, 0.5843138, 1,
-0.1418792, 0.5504209, 1.229273, 0, 1, 0.5921569, 1,
-0.1308214, -1.609662, -3.360763, 0, 1, 0.5960785, 1,
-0.129642, -1.582991, -3.754895, 0, 1, 0.6039216, 1,
-0.1281055, -1.177661, -2.851306, 0, 1, 0.6117647, 1,
-0.1273643, 0.6461275, 2.391831, 0, 1, 0.6156863, 1,
-0.123804, -1.936579, -3.035862, 0, 1, 0.6235294, 1,
-0.121795, -1.746034, -1.685671, 0, 1, 0.627451, 1,
-0.1201021, 1.35614, 0.3568654, 0, 1, 0.6352941, 1,
-0.119262, -1.17094, -2.647533, 0, 1, 0.6392157, 1,
-0.1184194, -0.07105907, -2.509423, 0, 1, 0.6470588, 1,
-0.1159739, -0.2875606, -3.711135, 0, 1, 0.6509804, 1,
-0.1145109, -1.477912, -3.572088, 0, 1, 0.6588235, 1,
-0.1121863, 0.3820448, 0.6629288, 0, 1, 0.6627451, 1,
-0.1117623, 0.05413086, -1.444522, 0, 1, 0.6705883, 1,
-0.108914, 0.119942, -1.752885, 0, 1, 0.6745098, 1,
-0.1077966, 0.2021773, -0.3772987, 0, 1, 0.682353, 1,
-0.1027849, 0.06564064, -2.11999, 0, 1, 0.6862745, 1,
-0.1025187, 2.039703, 0.04906523, 0, 1, 0.6941177, 1,
-0.1001109, -1.280418, -4.076571, 0, 1, 0.7019608, 1,
-0.09818027, -0.8049172, -2.962057, 0, 1, 0.7058824, 1,
-0.09251408, 0.01497413, -0.504475, 0, 1, 0.7137255, 1,
-0.09150115, -0.3210843, -3.660922, 0, 1, 0.7176471, 1,
-0.08632477, -1.696634, -4.366978, 0, 1, 0.7254902, 1,
-0.08439526, 0.6001428, 0.9871684, 0, 1, 0.7294118, 1,
-0.0832284, -0.7912753, -2.859019, 0, 1, 0.7372549, 1,
-0.08322731, 0.8373843, 0.8753516, 0, 1, 0.7411765, 1,
-0.08299968, -0.1089379, -1.932699, 0, 1, 0.7490196, 1,
-0.08136242, 0.9072148, -0.004244894, 0, 1, 0.7529412, 1,
-0.08079571, 0.4926057, -0.9475388, 0, 1, 0.7607843, 1,
-0.08008172, -1.311343, -5.124053, 0, 1, 0.7647059, 1,
-0.07733596, 3.361526, 1.000833, 0, 1, 0.772549, 1,
-0.07608861, -0.8984638, -0.8167815, 0, 1, 0.7764706, 1,
-0.07225798, 0.007483237, -1.254252, 0, 1, 0.7843137, 1,
-0.06602954, 0.3007058, 0.8033559, 0, 1, 0.7882353, 1,
-0.06288525, -1.101529, -4.780213, 0, 1, 0.7960784, 1,
-0.05879665, 0.9992875, 0.9142967, 0, 1, 0.8039216, 1,
-0.05805239, -0.01026947, -1.860235, 0, 1, 0.8078431, 1,
-0.05646241, -0.920553, -4.282779, 0, 1, 0.8156863, 1,
-0.05625878, 0.2617546, -0.8255372, 0, 1, 0.8196079, 1,
-0.05478495, -0.324087, -5.322004, 0, 1, 0.827451, 1,
-0.04985785, 1.098818, 0.4950339, 0, 1, 0.8313726, 1,
-0.03928934, -0.141879, -2.217529, 0, 1, 0.8392157, 1,
-0.03478796, 1.651427, 0.1858708, 0, 1, 0.8431373, 1,
-0.03420635, 1.303572, 0.5336642, 0, 1, 0.8509804, 1,
-0.0326287, 1.18941, 1.679063, 0, 1, 0.854902, 1,
-0.02982971, 0.2131096, 0.7147922, 0, 1, 0.8627451, 1,
-0.02805907, -0.3350952, -1.703587, 0, 1, 0.8666667, 1,
-0.02751333, -0.2189627, -0.8754147, 0, 1, 0.8745098, 1,
-0.0259124, 0.3334292, 1.308191, 0, 1, 0.8784314, 1,
-0.01706291, 0.4057069, 0.358713, 0, 1, 0.8862745, 1,
-0.01703946, 1.748336, 0.08724424, 0, 1, 0.8901961, 1,
-0.01398757, 1.900656, 1.275351, 0, 1, 0.8980392, 1,
-0.007759888, 0.4742309, -1.432921, 0, 1, 0.9058824, 1,
-0.005822888, -0.1659871, -2.92321, 0, 1, 0.9098039, 1,
-0.002958816, -0.7690052, -1.453944, 0, 1, 0.9176471, 1,
-0.001034801, -1.558397, -4.239044, 0, 1, 0.9215686, 1,
0.002454383, -0.7057281, 3.212165, 0, 1, 0.9294118, 1,
0.0044979, -1.187627, 3.463404, 0, 1, 0.9333333, 1,
0.007389229, -0.8587827, 4.696074, 0, 1, 0.9411765, 1,
0.00978091, -0.8640078, 2.025963, 0, 1, 0.945098, 1,
0.01008988, -0.695883, 2.070412, 0, 1, 0.9529412, 1,
0.01165735, -1.54962, 2.550726, 0, 1, 0.9568627, 1,
0.01222501, -1.456215, 4.062209, 0, 1, 0.9647059, 1,
0.01276032, -1.519807, 1.961421, 0, 1, 0.9686275, 1,
0.01374249, -0.7682078, 2.525124, 0, 1, 0.9764706, 1,
0.01428772, 1.646239, 0.1465168, 0, 1, 0.9803922, 1,
0.01943237, -0.2979748, 1.757083, 0, 1, 0.9882353, 1,
0.02284492, -0.8633927, 2.792676, 0, 1, 0.9921569, 1,
0.024691, -2.464842, 2.363621, 0, 1, 1, 1,
0.02516248, -0.703566, 3.965581, 0, 0.9921569, 1, 1,
0.02616917, -1.8571, 2.500305, 0, 0.9882353, 1, 1,
0.02791597, -1.155482, 3.803545, 0, 0.9803922, 1, 1,
0.0323748, -0.6670817, 1.943101, 0, 0.9764706, 1, 1,
0.03603213, -0.3378943, 1.911253, 0, 0.9686275, 1, 1,
0.04249004, -3.048375, 3.334203, 0, 0.9647059, 1, 1,
0.04270804, -1.726144, 2.280373, 0, 0.9568627, 1, 1,
0.0429203, -0.2868071, 4.018396, 0, 0.9529412, 1, 1,
0.04364619, 0.02870698, 1.62578, 0, 0.945098, 1, 1,
0.04794487, 1.875816, 0.7018818, 0, 0.9411765, 1, 1,
0.0501888, 0.5146965, 0.8124023, 0, 0.9333333, 1, 1,
0.05725964, -0.1435208, -0.1408927, 0, 0.9294118, 1, 1,
0.06011634, 0.1936107, 0.6229018, 0, 0.9215686, 1, 1,
0.06218091, 2.007251, -1.483477, 0, 0.9176471, 1, 1,
0.06364704, 1.558245, 0.4701475, 0, 0.9098039, 1, 1,
0.06817246, -1.304641, 3.132794, 0, 0.9058824, 1, 1,
0.07258837, -0.3394943, 4.630144, 0, 0.8980392, 1, 1,
0.07579727, -0.76881, 2.745025, 0, 0.8901961, 1, 1,
0.07617675, 0.1840963, -2.145096, 0, 0.8862745, 1, 1,
0.07662883, -0.6073343, 2.807491, 0, 0.8784314, 1, 1,
0.07794549, 0.02201092, -0.3600795, 0, 0.8745098, 1, 1,
0.08000977, 1.052721, 0.3262231, 0, 0.8666667, 1, 1,
0.08169893, 0.2632532, 0.1018124, 0, 0.8627451, 1, 1,
0.08710524, 0.425221, 1.596908, 0, 0.854902, 1, 1,
0.0874302, -0.06825449, 2.497205, 0, 0.8509804, 1, 1,
0.08837697, 0.5548609, -0.7269022, 0, 0.8431373, 1, 1,
0.09018886, 1.611824, 3.040966, 0, 0.8392157, 1, 1,
0.09587429, 0.05173261, 0.676661, 0, 0.8313726, 1, 1,
0.09715449, -2.264601, 2.69246, 0, 0.827451, 1, 1,
0.1000645, 0.04215857, 2.124923, 0, 0.8196079, 1, 1,
0.1023802, 0.6305622, -0.6526141, 0, 0.8156863, 1, 1,
0.1023853, -0.1427725, 1.116858, 0, 0.8078431, 1, 1,
0.1028258, 1.654299, -0.2984448, 0, 0.8039216, 1, 1,
0.1034869, -0.8402748, 3.326771, 0, 0.7960784, 1, 1,
0.1086704, 1.658046, -0.7588018, 0, 0.7882353, 1, 1,
0.1175478, -0.05240261, 0.7515078, 0, 0.7843137, 1, 1,
0.1188781, 1.140478, -0.9356338, 0, 0.7764706, 1, 1,
0.1200636, -0.1301759, 0.7390236, 0, 0.772549, 1, 1,
0.120967, 1.01959, -1.361999, 0, 0.7647059, 1, 1,
0.1215624, -1.225628, 1.888397, 0, 0.7607843, 1, 1,
0.1275349, 0.7182499, 0.07086942, 0, 0.7529412, 1, 1,
0.1308924, -0.8987051, 2.481421, 0, 0.7490196, 1, 1,
0.1348521, -0.06641936, 3.015451, 0, 0.7411765, 1, 1,
0.1353013, -1.976975, 4.563764, 0, 0.7372549, 1, 1,
0.1381471, -1.054547, 2.293513, 0, 0.7294118, 1, 1,
0.1416141, -0.1440126, 0.4372088, 0, 0.7254902, 1, 1,
0.1475284, 0.1292819, 0.925402, 0, 0.7176471, 1, 1,
0.1485593, 0.6705664, -0.5468704, 0, 0.7137255, 1, 1,
0.1491395, -0.4225927, 2.974162, 0, 0.7058824, 1, 1,
0.1512621, 0.4869842, -1.295421, 0, 0.6980392, 1, 1,
0.1532746, -1.084547, 0.9512245, 0, 0.6941177, 1, 1,
0.1559923, 1.33017, 0.2602674, 0, 0.6862745, 1, 1,
0.1585736, -0.9018401, 4.301523, 0, 0.682353, 1, 1,
0.1587678, 0.06757434, 1.649752, 0, 0.6745098, 1, 1,
0.1590701, 0.274227, 2.018109, 0, 0.6705883, 1, 1,
0.1592514, 0.7293676, 0.7255467, 0, 0.6627451, 1, 1,
0.1646869, 0.507261, 1.422976, 0, 0.6588235, 1, 1,
0.1696322, -0.9328862, 5.054821, 0, 0.6509804, 1, 1,
0.1723686, 1.692633, -0.6032694, 0, 0.6470588, 1, 1,
0.1742577, 0.5109984, -0.2076168, 0, 0.6392157, 1, 1,
0.1778621, 2.097588, -1.561554, 0, 0.6352941, 1, 1,
0.1794288, 1.413573, -0.3997596, 0, 0.627451, 1, 1,
0.1812258, 0.5534397, -0.1690951, 0, 0.6235294, 1, 1,
0.1823851, 0.2383676, -0.4125734, 0, 0.6156863, 1, 1,
0.185416, 0.8126764, -0.1760816, 0, 0.6117647, 1, 1,
0.1937951, -1.851918, 4.412365, 0, 0.6039216, 1, 1,
0.1943957, 1.931936, -1.902332, 0, 0.5960785, 1, 1,
0.1951151, 0.09671641, -0.7543546, 0, 0.5921569, 1, 1,
0.200051, -0.3372844, 2.77207, 0, 0.5843138, 1, 1,
0.2032196, 0.7165447, 0.01000484, 0, 0.5803922, 1, 1,
0.2032235, 1.289461, -0.4578803, 0, 0.572549, 1, 1,
0.209513, -1.738231, 2.001447, 0, 0.5686275, 1, 1,
0.2150721, -1.517022, 2.891485, 0, 0.5607843, 1, 1,
0.2168992, -1.679744, 3.666754, 0, 0.5568628, 1, 1,
0.2182457, -0.6136665, 3.492169, 0, 0.5490196, 1, 1,
0.224628, -1.078254, 2.60289, 0, 0.5450981, 1, 1,
0.2254811, -0.4143769, 2.890536, 0, 0.5372549, 1, 1,
0.226802, -0.3214355, 2.867626, 0, 0.5333334, 1, 1,
0.2277113, 1.714485, 1.7059, 0, 0.5254902, 1, 1,
0.2290583, -0.164329, 2.050897, 0, 0.5215687, 1, 1,
0.230283, -0.8335766, 3.015169, 0, 0.5137255, 1, 1,
0.2323594, -0.5199078, 1.735778, 0, 0.509804, 1, 1,
0.2324923, 0.5027066, -0.5785025, 0, 0.5019608, 1, 1,
0.2351601, -1.36442, 2.500827, 0, 0.4941176, 1, 1,
0.2380548, -0.9263188, 1.049673, 0, 0.4901961, 1, 1,
0.2450339, 0.5175404, 1.179446, 0, 0.4823529, 1, 1,
0.2450441, 0.132582, 0.4639176, 0, 0.4784314, 1, 1,
0.2474884, 0.7143959, 0.5298648, 0, 0.4705882, 1, 1,
0.2508232, -0.7645553, 1.497868, 0, 0.4666667, 1, 1,
0.2521278, -0.8572263, 2.101574, 0, 0.4588235, 1, 1,
0.2553751, 0.3358961, 0.8007654, 0, 0.454902, 1, 1,
0.2600634, -0.2991889, 3.534741, 0, 0.4470588, 1, 1,
0.2602098, 0.2432225, 0.04329167, 0, 0.4431373, 1, 1,
0.2618611, -1.192872, 2.823537, 0, 0.4352941, 1, 1,
0.2665139, -1.458028, 3.988923, 0, 0.4313726, 1, 1,
0.2712153, -2.239757, 3.529414, 0, 0.4235294, 1, 1,
0.2721734, -1.904219, 1.959012, 0, 0.4196078, 1, 1,
0.2743366, 1.747821, -0.4265516, 0, 0.4117647, 1, 1,
0.2746863, 0.6311368, 1.351094, 0, 0.4078431, 1, 1,
0.2772099, 0.3180315, 0.05122997, 0, 0.4, 1, 1,
0.2892026, -0.5820949, 1.393605, 0, 0.3921569, 1, 1,
0.2901236, -0.5804615, 1.873232, 0, 0.3882353, 1, 1,
0.2906456, 1.935341, 1.192278, 0, 0.3803922, 1, 1,
0.2920299, 0.1007127, 0.02665572, 0, 0.3764706, 1, 1,
0.2957577, 0.7528539, 1.48887, 0, 0.3686275, 1, 1,
0.2971688, -1.453607, 3.111237, 0, 0.3647059, 1, 1,
0.2979486, -0.1333322, 1.534677, 0, 0.3568628, 1, 1,
0.3013235, 1.825825, -0.4224551, 0, 0.3529412, 1, 1,
0.3015352, 0.2623476, 0.3608622, 0, 0.345098, 1, 1,
0.3032708, -1.720829, 3.540865, 0, 0.3411765, 1, 1,
0.3045714, 0.1612722, 0.4883687, 0, 0.3333333, 1, 1,
0.3057807, -1.999408, 2.687078, 0, 0.3294118, 1, 1,
0.3074279, -0.6246057, 2.567309, 0, 0.3215686, 1, 1,
0.3094774, -1.041086, 2.361699, 0, 0.3176471, 1, 1,
0.3180607, 1.838525, -0.5129815, 0, 0.3098039, 1, 1,
0.3197182, 1.073494, 0.2802405, 0, 0.3058824, 1, 1,
0.321942, 0.4182203, 1.915427, 0, 0.2980392, 1, 1,
0.32246, 0.2756846, 0.5501805, 0, 0.2901961, 1, 1,
0.3242355, -0.5486045, 2.678549, 0, 0.2862745, 1, 1,
0.3252619, 1.968245, 0.1848049, 0, 0.2784314, 1, 1,
0.3270966, -0.0007791872, 1.992996, 0, 0.2745098, 1, 1,
0.3335883, -0.478581, 3.202177, 0, 0.2666667, 1, 1,
0.3357482, 0.3900301, 0.8741704, 0, 0.2627451, 1, 1,
0.3358085, -0.9216557, 4.131126, 0, 0.254902, 1, 1,
0.3361663, 1.750859, -1.346987, 0, 0.2509804, 1, 1,
0.3374236, -0.9440855, 3.057474, 0, 0.2431373, 1, 1,
0.3378739, 0.03759321, 0.8070412, 0, 0.2392157, 1, 1,
0.3382334, -1.039924, 2.687613, 0, 0.2313726, 1, 1,
0.3399197, -0.2520135, 1.391315, 0, 0.227451, 1, 1,
0.3418002, 2.465972, -0.3463514, 0, 0.2196078, 1, 1,
0.341934, -0.9851153, 2.818974, 0, 0.2156863, 1, 1,
0.3430241, 0.13107, 2.419126, 0, 0.2078431, 1, 1,
0.3439515, -0.9014091, 3.878411, 0, 0.2039216, 1, 1,
0.3504128, -0.6751649, 4.105777, 0, 0.1960784, 1, 1,
0.3517187, -0.1577823, 2.855371, 0, 0.1882353, 1, 1,
0.3541444, 1.472377, -0.2833748, 0, 0.1843137, 1, 1,
0.3624105, 0.3747333, 1.279505, 0, 0.1764706, 1, 1,
0.362624, 0.7555718, -0.1464264, 0, 0.172549, 1, 1,
0.3627294, 0.3825976, 2.632356, 0, 0.1647059, 1, 1,
0.3645002, -0.1557041, 2.775926, 0, 0.1607843, 1, 1,
0.3681086, -1.263111, 3.913482, 0, 0.1529412, 1, 1,
0.3730634, 1.300599, 2.346234, 0, 0.1490196, 1, 1,
0.3733398, 0.3597097, 0.6915435, 0, 0.1411765, 1, 1,
0.3741764, -0.6123134, 1.665422, 0, 0.1372549, 1, 1,
0.374344, -1.256044, 1.687328, 0, 0.1294118, 1, 1,
0.3756541, -0.296746, 1.448866, 0, 0.1254902, 1, 1,
0.3770026, 1.217657, 0.08354486, 0, 0.1176471, 1, 1,
0.3836766, -0.6173217, 2.639696, 0, 0.1137255, 1, 1,
0.3858484, 0.02849563, 2.037991, 0, 0.1058824, 1, 1,
0.3870966, -0.6110736, 2.777817, 0, 0.09803922, 1, 1,
0.3876392, -0.04283975, 1.486756, 0, 0.09411765, 1, 1,
0.3897103, -0.08784723, 0.8711277, 0, 0.08627451, 1, 1,
0.3902074, -0.3201614, 1.527425, 0, 0.08235294, 1, 1,
0.3931549, -0.8296554, 2.134913, 0, 0.07450981, 1, 1,
0.3932485, 0.03390501, 2.774666, 0, 0.07058824, 1, 1,
0.3951427, 0.4544292, 0.9575987, 0, 0.0627451, 1, 1,
0.3967755, 1.325843, 0.342531, 0, 0.05882353, 1, 1,
0.3995019, 0.3702134, 1.088271, 0, 0.05098039, 1, 1,
0.4075505, 0.9003042, 1.556981, 0, 0.04705882, 1, 1,
0.4084682, 0.2131148, 1.956465, 0, 0.03921569, 1, 1,
0.4144617, 1.350959, -0.8863909, 0, 0.03529412, 1, 1,
0.4158222, 0.6667184, -0.7026497, 0, 0.02745098, 1, 1,
0.4167068, -1.543366, 3.398484, 0, 0.02352941, 1, 1,
0.4169357, -0.8660282, 2.459247, 0, 0.01568628, 1, 1,
0.4219236, 1.082282, 0.9070621, 0, 0.01176471, 1, 1,
0.4290387, -0.1955119, 2.462687, 0, 0.003921569, 1, 1,
0.4294389, -0.1389133, 1.41142, 0.003921569, 0, 1, 1,
0.4307007, 1.321209, 1.535842, 0.007843138, 0, 1, 1,
0.4341064, -0.2052216, 2.841463, 0.01568628, 0, 1, 1,
0.4347785, 2.734939, 1.29549, 0.01960784, 0, 1, 1,
0.4349328, 0.3279931, 0.7278442, 0.02745098, 0, 1, 1,
0.436507, 1.37696, 1.559371, 0.03137255, 0, 1, 1,
0.4386541, -1.984503, 2.538508, 0.03921569, 0, 1, 1,
0.444858, -0.1323554, 2.084891, 0.04313726, 0, 1, 1,
0.4461167, 1.036439, -0.1422844, 0.05098039, 0, 1, 1,
0.4468083, 0.4089507, 1.304229, 0.05490196, 0, 1, 1,
0.4517309, 0.5281631, 0.06220448, 0.0627451, 0, 1, 1,
0.4534092, -1.304203, 3.265508, 0.06666667, 0, 1, 1,
0.4541383, 0.7278882, 1.088896, 0.07450981, 0, 1, 1,
0.4556624, 0.4463232, -0.3870127, 0.07843138, 0, 1, 1,
0.4598161, -0.5004597, 3.776103, 0.08627451, 0, 1, 1,
0.4675853, 0.5656441, 1.929995, 0.09019608, 0, 1, 1,
0.4678785, 1.498794, 0.4815336, 0.09803922, 0, 1, 1,
0.4681118, -0.03462204, 3.21974, 0.1058824, 0, 1, 1,
0.4691614, 1.06976, 0.7245549, 0.1098039, 0, 1, 1,
0.4727709, 0.1805591, 2.442213, 0.1176471, 0, 1, 1,
0.4743608, 1.062372, 0.1611353, 0.1215686, 0, 1, 1,
0.4797068, -0.8836145, 1.868163, 0.1294118, 0, 1, 1,
0.4836379, 0.7574889, -0.6244423, 0.1333333, 0, 1, 1,
0.4870587, 0.02935158, 0.7552298, 0.1411765, 0, 1, 1,
0.4890201, -1.530865, 2.418435, 0.145098, 0, 1, 1,
0.4925676, -0.8354992, 2.286598, 0.1529412, 0, 1, 1,
0.4959823, -0.5839659, 2.746803, 0.1568628, 0, 1, 1,
0.4961184, 0.9824846, 1.013449, 0.1647059, 0, 1, 1,
0.5005961, 0.1819234, 2.36552, 0.1686275, 0, 1, 1,
0.5023322, -1.662273, 2.363497, 0.1764706, 0, 1, 1,
0.5046399, 0.5094778, 1.937066, 0.1803922, 0, 1, 1,
0.5051399, -1.482428, 2.790761, 0.1882353, 0, 1, 1,
0.5099725, -0.862903, 3.032604, 0.1921569, 0, 1, 1,
0.5123128, 0.8724228, 1.27936, 0.2, 0, 1, 1,
0.5146637, 2.196469, -0.6353928, 0.2078431, 0, 1, 1,
0.5160572, 0.05592475, 1.803431, 0.2117647, 0, 1, 1,
0.5173906, -1.293564, 1.631368, 0.2196078, 0, 1, 1,
0.518823, 0.1946119, 0.5972338, 0.2235294, 0, 1, 1,
0.5206265, 0.9879953, -0.03843478, 0.2313726, 0, 1, 1,
0.5213228, 1.422383, 2.132588, 0.2352941, 0, 1, 1,
0.5355476, 0.8387994, 2.443275, 0.2431373, 0, 1, 1,
0.5373511, -0.4621098, 3.085235, 0.2470588, 0, 1, 1,
0.5392877, -0.5479019, 3.776104, 0.254902, 0, 1, 1,
0.5403021, 1.514096, -0.8318466, 0.2588235, 0, 1, 1,
0.5444019, 1.309342, -0.1418123, 0.2666667, 0, 1, 1,
0.5474885, -0.369956, 3.167389, 0.2705882, 0, 1, 1,
0.5508015, 0.5970278, 0.3875325, 0.2784314, 0, 1, 1,
0.5522402, 1.265442, -0.3745264, 0.282353, 0, 1, 1,
0.5636289, 1.425907, 0.1474297, 0.2901961, 0, 1, 1,
0.564129, 2.008795, -0.3031496, 0.2941177, 0, 1, 1,
0.5678506, 2.366, 1.495521, 0.3019608, 0, 1, 1,
0.5694708, 0.991531, 0.08435637, 0.3098039, 0, 1, 1,
0.5697567, -2.697595, 2.471846, 0.3137255, 0, 1, 1,
0.57574, 0.2536265, 0.3954747, 0.3215686, 0, 1, 1,
0.5757563, 0.538899, 1.291159, 0.3254902, 0, 1, 1,
0.5774045, 0.2150286, 0.9861203, 0.3333333, 0, 1, 1,
0.5776634, -1.61507, 3.612705, 0.3372549, 0, 1, 1,
0.5778905, 0.1157849, 2.112138, 0.345098, 0, 1, 1,
0.5780764, 0.1677611, 0.9015817, 0.3490196, 0, 1, 1,
0.5801405, 1.26544, -0.5796904, 0.3568628, 0, 1, 1,
0.5833675, -0.3819244, 3.606209, 0.3607843, 0, 1, 1,
0.597772, -0.1856939, 2.662017, 0.3686275, 0, 1, 1,
0.6081643, 0.6176693, -0.03117516, 0.372549, 0, 1, 1,
0.6088234, -0.3855531, 1.954735, 0.3803922, 0, 1, 1,
0.6099705, -0.7620171, 2.19748, 0.3843137, 0, 1, 1,
0.6190466, -0.8437333, 3.68508, 0.3921569, 0, 1, 1,
0.6202796, -0.5006859, 3.944194, 0.3960784, 0, 1, 1,
0.627744, 0.5729098, 0.6608695, 0.4039216, 0, 1, 1,
0.6293702, 1.999805, -0.3816483, 0.4117647, 0, 1, 1,
0.6299666, 0.000129305, 2.139446, 0.4156863, 0, 1, 1,
0.6352438, 0.8358209, 0.7739874, 0.4235294, 0, 1, 1,
0.6381857, -0.5374632, 2.201454, 0.427451, 0, 1, 1,
0.6384001, 2.148527, 0.5263137, 0.4352941, 0, 1, 1,
0.6397592, 0.5279821, -0.5284797, 0.4392157, 0, 1, 1,
0.6432288, -1.556077, 2.819909, 0.4470588, 0, 1, 1,
0.6456044, 0.1123924, 0.1054445, 0.4509804, 0, 1, 1,
0.6525062, -0.02960505, 2.54469, 0.4588235, 0, 1, 1,
0.6568742, -0.4712531, 3.102181, 0.4627451, 0, 1, 1,
0.6595089, -0.1347754, 4.020008, 0.4705882, 0, 1, 1,
0.6601796, -0.2701401, -0.121657, 0.4745098, 0, 1, 1,
0.6711449, -1.060687, 1.695461, 0.4823529, 0, 1, 1,
0.6806873, 1.287133, 0.6850083, 0.4862745, 0, 1, 1,
0.6835489, 0.521856, 0.7518026, 0.4941176, 0, 1, 1,
0.689169, 1.307638, -0.4319451, 0.5019608, 0, 1, 1,
0.6893849, -0.5071191, 1.444016, 0.5058824, 0, 1, 1,
0.6938087, -0.1931453, 1.748636, 0.5137255, 0, 1, 1,
0.7003776, -0.7180894, 1.173108, 0.5176471, 0, 1, 1,
0.7048373, -0.4146383, 1.937909, 0.5254902, 0, 1, 1,
0.7050367, -0.108156, 0.8485519, 0.5294118, 0, 1, 1,
0.7065655, -0.1963141, 2.001821, 0.5372549, 0, 1, 1,
0.7102255, -0.05230513, 0.3909211, 0.5411765, 0, 1, 1,
0.7136999, -0.2415681, 2.936803, 0.5490196, 0, 1, 1,
0.7141895, 0.5591896, 3.221645, 0.5529412, 0, 1, 1,
0.7225829, -0.07825997, 1.372172, 0.5607843, 0, 1, 1,
0.7232122, 0.419299, 2.031107, 0.5647059, 0, 1, 1,
0.7332746, 0.2001901, 2.832145, 0.572549, 0, 1, 1,
0.7341378, -0.9248033, 2.721991, 0.5764706, 0, 1, 1,
0.7350281, -0.8328927, 1.114782, 0.5843138, 0, 1, 1,
0.73836, 0.9204333, 0.03700979, 0.5882353, 0, 1, 1,
0.7425132, 0.3618127, 1.079219, 0.5960785, 0, 1, 1,
0.7430905, -0.8890644, 3.150672, 0.6039216, 0, 1, 1,
0.7448139, -0.9289442, 1.502859, 0.6078432, 0, 1, 1,
0.7456653, -0.6212289, 2.293674, 0.6156863, 0, 1, 1,
0.7463032, -0.3518334, 3.042236, 0.6196079, 0, 1, 1,
0.7602677, -0.6066866, 2.2401, 0.627451, 0, 1, 1,
0.7627841, 0.8280419, 0.02369364, 0.6313726, 0, 1, 1,
0.763247, -0.8692918, 3.789864, 0.6392157, 0, 1, 1,
0.7648386, -0.4184926, 3.161434, 0.6431373, 0, 1, 1,
0.7707751, -0.9021028, 1.143546, 0.6509804, 0, 1, 1,
0.7730569, -0.9493208, 2.562532, 0.654902, 0, 1, 1,
0.7741364, 1.411544, -0.2144847, 0.6627451, 0, 1, 1,
0.7741763, 0.8474235, 0.5733179, 0.6666667, 0, 1, 1,
0.7774062, 1.655493, 0.361162, 0.6745098, 0, 1, 1,
0.7789832, 0.6362793, 1.791823, 0.6784314, 0, 1, 1,
0.7873922, -0.2519674, 0.2609087, 0.6862745, 0, 1, 1,
0.8069911, 0.7790236, 0.9975564, 0.6901961, 0, 1, 1,
0.8135947, -0.05877988, 0.8641884, 0.6980392, 0, 1, 1,
0.8163239, 0.08250196, 1.560134, 0.7058824, 0, 1, 1,
0.8165404, -0.4519606, 1.70587, 0.7098039, 0, 1, 1,
0.8193001, -0.5117762, 2.178417, 0.7176471, 0, 1, 1,
0.8207921, 1.074944, 0.0175848, 0.7215686, 0, 1, 1,
0.8211381, -2.177057, 3.1264, 0.7294118, 0, 1, 1,
0.8255652, -0.01446938, 2.919485, 0.7333333, 0, 1, 1,
0.8306935, -0.2859403, 1.106794, 0.7411765, 0, 1, 1,
0.830869, 0.3458347, -0.5533971, 0.7450981, 0, 1, 1,
0.8322845, 0.7410085, 1.610179, 0.7529412, 0, 1, 1,
0.8326741, 0.01211542, 1.817485, 0.7568628, 0, 1, 1,
0.8389611, -0.2789011, 2.739511, 0.7647059, 0, 1, 1,
0.8460471, 1.513756, 0.2508894, 0.7686275, 0, 1, 1,
0.8534678, 2.001453, 0.3068736, 0.7764706, 0, 1, 1,
0.8544611, -0.5390076, 3.634362, 0.7803922, 0, 1, 1,
0.8595284, 0.4884031, -0.2950071, 0.7882353, 0, 1, 1,
0.8700101, 0.7407644, -0.2701905, 0.7921569, 0, 1, 1,
0.8746782, 0.5459227, -0.0451717, 0.8, 0, 1, 1,
0.8763903, 0.6582256, -0.3802837, 0.8078431, 0, 1, 1,
0.8856735, -0.03934313, 1.686514, 0.8117647, 0, 1, 1,
0.8918943, -1.791526, 3.089135, 0.8196079, 0, 1, 1,
0.8927264, -1.238791, 1.785056, 0.8235294, 0, 1, 1,
0.8941126, 0.7733288, 0.5343352, 0.8313726, 0, 1, 1,
0.9006135, 0.8588809, 1.914746, 0.8352941, 0, 1, 1,
0.9048112, -0.06762651, 0.9740025, 0.8431373, 0, 1, 1,
0.9137127, 0.4695587, 0.005040384, 0.8470588, 0, 1, 1,
0.9145184, 0.2721587, 2.303309, 0.854902, 0, 1, 1,
0.9202195, 0.04521747, 0.9135883, 0.8588235, 0, 1, 1,
0.9220341, 0.2634149, 0.568301, 0.8666667, 0, 1, 1,
0.927123, -1.465561, 1.959869, 0.8705882, 0, 1, 1,
0.9289225, 0.3603308, 0.796052, 0.8784314, 0, 1, 1,
0.9324589, 0.2557505, 0.1351143, 0.8823529, 0, 1, 1,
0.9344159, -0.2357667, 0.1625733, 0.8901961, 0, 1, 1,
0.9376088, 0.2011798, 1.798159, 0.8941177, 0, 1, 1,
0.9455474, 0.1185243, 1.60358, 0.9019608, 0, 1, 1,
0.9523357, 2.000799, -1.397118, 0.9098039, 0, 1, 1,
0.9561222, 1.480814, 0.2520856, 0.9137255, 0, 1, 1,
0.9596018, -2.126684, 3.905096, 0.9215686, 0, 1, 1,
0.9605884, 1.768707, 0.5816917, 0.9254902, 0, 1, 1,
0.9621596, -0.3607394, 1.265438, 0.9333333, 0, 1, 1,
0.962754, 0.6992453, 2.535185, 0.9372549, 0, 1, 1,
0.9633839, -0.531772, 2.449706, 0.945098, 0, 1, 1,
0.9673791, -2.391329, 3.355899, 0.9490196, 0, 1, 1,
0.9749325, -0.2880978, 2.785529, 0.9568627, 0, 1, 1,
0.9754995, -1.229594, 3.747987, 0.9607843, 0, 1, 1,
0.9814161, -0.9123954, -0.3172968, 0.9686275, 0, 1, 1,
0.991414, -1.452086, 2.684398, 0.972549, 0, 1, 1,
0.9985167, 1.229516, 0.5800201, 0.9803922, 0, 1, 1,
1.014154, 0.990914, 0.1147449, 0.9843137, 0, 1, 1,
1.015214, -0.184485, 2.575448, 0.9921569, 0, 1, 1,
1.017814, -0.4089698, 2.113212, 0.9960784, 0, 1, 1,
1.023929, 0.04004915, 1.655741, 1, 0, 0.9960784, 1,
1.027042, -0.001207217, 1.910293, 1, 0, 0.9882353, 1,
1.037629, -0.4581122, 1.361554, 1, 0, 0.9843137, 1,
1.038962, -1.562238, 1.637999, 1, 0, 0.9764706, 1,
1.044219, -2.035899, 2.008545, 1, 0, 0.972549, 1,
1.046227, 1.464813, 2.033459, 1, 0, 0.9647059, 1,
1.050186, 1.168538, -0.1303548, 1, 0, 0.9607843, 1,
1.055536, -0.2467752, 2.255709, 1, 0, 0.9529412, 1,
1.058395, 0.5444705, 2.662253, 1, 0, 0.9490196, 1,
1.066779, -0.1819899, 2.356956, 1, 0, 0.9411765, 1,
1.070547, -0.6644962, -0.09738687, 1, 0, 0.9372549, 1,
1.073832, 2.614625, 0.7024884, 1, 0, 0.9294118, 1,
1.080152, -1.114364, 3.618022, 1, 0, 0.9254902, 1,
1.090415, -0.5734033, 2.336362, 1, 0, 0.9176471, 1,
1.097378, -0.7082523, 1.885908, 1, 0, 0.9137255, 1,
1.098358, 0.9680246, -1.614246, 1, 0, 0.9058824, 1,
1.100848, -0.4651207, 0.9108657, 1, 0, 0.9019608, 1,
1.10578, 0.4995497, 0.03088228, 1, 0, 0.8941177, 1,
1.110884, -0.8172853, 4.281041, 1, 0, 0.8862745, 1,
1.116709, -1.476252, 2.382783, 1, 0, 0.8823529, 1,
1.117261, 1.795231, 0.2311565, 1, 0, 0.8745098, 1,
1.123359, -2.612056, 4.162431, 1, 0, 0.8705882, 1,
1.12813, 0.300045, 0.4470739, 1, 0, 0.8627451, 1,
1.129288, -0.3932521, 2.312454, 1, 0, 0.8588235, 1,
1.141697, 0.4277905, 1.508858, 1, 0, 0.8509804, 1,
1.144667, 0.655565, 2.367408, 1, 0, 0.8470588, 1,
1.151741, -0.629169, 3.156198, 1, 0, 0.8392157, 1,
1.164517, -2.159826, 1.96457, 1, 0, 0.8352941, 1,
1.180925, 0.0205811, 1.207022, 1, 0, 0.827451, 1,
1.184964, -0.5958357, 1.983539, 1, 0, 0.8235294, 1,
1.187479, 0.8361735, 0.8389837, 1, 0, 0.8156863, 1,
1.188132, 1.58698, 0.831357, 1, 0, 0.8117647, 1,
1.212611, 0.0279873, -0.2629612, 1, 0, 0.8039216, 1,
1.214515, 0.514107, 0.6475018, 1, 0, 0.7960784, 1,
1.219583, -1.460112, 3.93028, 1, 0, 0.7921569, 1,
1.226792, -0.03142126, 2.759789, 1, 0, 0.7843137, 1,
1.232113, -0.09790514, 2.393635, 1, 0, 0.7803922, 1,
1.247356, 0.6278212, 0.3221053, 1, 0, 0.772549, 1,
1.261121, 0.5368496, 1.441562, 1, 0, 0.7686275, 1,
1.261232, -0.376556, 2.564624, 1, 0, 0.7607843, 1,
1.268857, -2.147444, 3.823573, 1, 0, 0.7568628, 1,
1.269858, -0.5880944, 2.394763, 1, 0, 0.7490196, 1,
1.276058, -0.1223453, 1.352902, 1, 0, 0.7450981, 1,
1.279949, -0.9204562, -0.6586989, 1, 0, 0.7372549, 1,
1.280523, 0.9326164, 0.2787684, 1, 0, 0.7333333, 1,
1.281726, -0.7373514, 1.656726, 1, 0, 0.7254902, 1,
1.290179, 0.09564054, 1.455132, 1, 0, 0.7215686, 1,
1.292852, 0.8620499, 0.6704304, 1, 0, 0.7137255, 1,
1.301869, -0.8436546, 1.706074, 1, 0, 0.7098039, 1,
1.315248, -0.8880489, 2.935053, 1, 0, 0.7019608, 1,
1.319155, 0.5257338, 2.162469, 1, 0, 0.6941177, 1,
1.320646, -1.296124, 1.602116, 1, 0, 0.6901961, 1,
1.329954, 0.4265459, 2.178384, 1, 0, 0.682353, 1,
1.333363, -1.105686, 2.116959, 1, 0, 0.6784314, 1,
1.333466, -0.5533861, 3.451924, 1, 0, 0.6705883, 1,
1.349825, -0.1410087, 1.739796, 1, 0, 0.6666667, 1,
1.363535, 0.03672465, 0.9703166, 1, 0, 0.6588235, 1,
1.364683, 0.1282964, 0.2917259, 1, 0, 0.654902, 1,
1.366702, 0.2351487, 1.537288, 1, 0, 0.6470588, 1,
1.367794, 0.3659914, 0.9942629, 1, 0, 0.6431373, 1,
1.375459, -0.4532546, 3.303891, 1, 0, 0.6352941, 1,
1.376789, 0.00981202, 1.550059, 1, 0, 0.6313726, 1,
1.377268, -0.7372261, 2.386891, 1, 0, 0.6235294, 1,
1.3813, 0.5560773, 1.010731, 1, 0, 0.6196079, 1,
1.383241, 0.08457602, 1.644311, 1, 0, 0.6117647, 1,
1.385685, 0.8512272, -0.6018136, 1, 0, 0.6078432, 1,
1.388357, 0.6891829, 1.728341, 1, 0, 0.6, 1,
1.391621, 0.5974676, 0.8297083, 1, 0, 0.5921569, 1,
1.393655, -0.3090732, 1.479716, 1, 0, 0.5882353, 1,
1.397192, -0.3243483, 1.122012, 1, 0, 0.5803922, 1,
1.406631, -0.5132949, 2.559229, 1, 0, 0.5764706, 1,
1.412497, 0.2036783, 1.333129, 1, 0, 0.5686275, 1,
1.416571, 0.8552612, 0.7195057, 1, 0, 0.5647059, 1,
1.416927, -1.336525, 0.9159505, 1, 0, 0.5568628, 1,
1.41853, 0.5169996, -0.3911849, 1, 0, 0.5529412, 1,
1.421857, 0.8664246, 3.076247, 1, 0, 0.5450981, 1,
1.437865, -0.9158639, 2.783898, 1, 0, 0.5411765, 1,
1.44322, 2.070287, 2.984738, 1, 0, 0.5333334, 1,
1.453997, 0.3739343, 2.318624, 1, 0, 0.5294118, 1,
1.468879, -0.4610988, 0.6317823, 1, 0, 0.5215687, 1,
1.473544, 0.6885793, 0.8045331, 1, 0, 0.5176471, 1,
1.477574, -0.8532913, 1.883852, 1, 0, 0.509804, 1,
1.488719, -0.6720452, 1.873062, 1, 0, 0.5058824, 1,
1.501519, 0.02859136, 2.005837, 1, 0, 0.4980392, 1,
1.501901, 0.3761508, 0.4264979, 1, 0, 0.4901961, 1,
1.507921, 0.7781593, 1.177751, 1, 0, 0.4862745, 1,
1.508495, -0.03863103, 2.192291, 1, 0, 0.4784314, 1,
1.510951, 0.5622873, 0.01443857, 1, 0, 0.4745098, 1,
1.529073, -0.2137025, 0.6091939, 1, 0, 0.4666667, 1,
1.536484, 0.2818175, 0.547713, 1, 0, 0.4627451, 1,
1.556186, 0.3630271, 0.7515129, 1, 0, 0.454902, 1,
1.562426, 0.9036501, 1.012855, 1, 0, 0.4509804, 1,
1.563092, 2.329126, 0.5468774, 1, 0, 0.4431373, 1,
1.567774, 0.5515314, 1.771867, 1, 0, 0.4392157, 1,
1.576422, -0.4074115, 1.070521, 1, 0, 0.4313726, 1,
1.577561, -1.166423, 2.911652, 1, 0, 0.427451, 1,
1.579966, 0.9320214, 2.875375, 1, 0, 0.4196078, 1,
1.590982, 0.4315561, 1.838126, 1, 0, 0.4156863, 1,
1.595809, 0.1335171, 3.094704, 1, 0, 0.4078431, 1,
1.60117, -1.894285, 2.485875, 1, 0, 0.4039216, 1,
1.604892, -0.4841129, -0.4511659, 1, 0, 0.3960784, 1,
1.608293, -0.8796062, 2.062716, 1, 0, 0.3882353, 1,
1.60883, -0.3469113, 1.290609, 1, 0, 0.3843137, 1,
1.61273, -0.3962959, 1.418909, 1, 0, 0.3764706, 1,
1.615783, 0.1963271, 1.265846, 1, 0, 0.372549, 1,
1.635885, -0.2143204, 2.946601, 1, 0, 0.3647059, 1,
1.650358, -1.250856, 1.919895, 1, 0, 0.3607843, 1,
1.651053, 1.981047, 1.008573, 1, 0, 0.3529412, 1,
1.660628, -2.185929, 1.240193, 1, 0, 0.3490196, 1,
1.665025, 1.282609, 0.8007281, 1, 0, 0.3411765, 1,
1.673261, 1.554609, -0.2185307, 1, 0, 0.3372549, 1,
1.682389, -0.4445257, 1.140241, 1, 0, 0.3294118, 1,
1.705266, -1.825542, 2.793231, 1, 0, 0.3254902, 1,
1.709342, -0.1188628, 1.475095, 1, 0, 0.3176471, 1,
1.725264, -1.880923, 1.912777, 1, 0, 0.3137255, 1,
1.725433, 0.1922988, 1.270497, 1, 0, 0.3058824, 1,
1.732996, -0.3711103, 2.300805, 1, 0, 0.2980392, 1,
1.744564, -1.206037, 2.733887, 1, 0, 0.2941177, 1,
1.746026, -0.002951745, 1.252122, 1, 0, 0.2862745, 1,
1.758024, -0.6742448, 1.0221, 1, 0, 0.282353, 1,
1.772114, 0.6726443, 1.605366, 1, 0, 0.2745098, 1,
1.77297, 0.06986269, 2.220217, 1, 0, 0.2705882, 1,
1.776353, -1.142359, 2.940541, 1, 0, 0.2627451, 1,
1.776996, -0.4227501, 2.053975, 1, 0, 0.2588235, 1,
1.779082, -0.3701964, 3.266568, 1, 0, 0.2509804, 1,
1.782171, -1.606252, 1.746386, 1, 0, 0.2470588, 1,
1.789932, -0.6389697, 1.211338, 1, 0, 0.2392157, 1,
1.791044, -0.5288063, 2.45455, 1, 0, 0.2352941, 1,
1.809772, -1.975242, 3.197879, 1, 0, 0.227451, 1,
1.811612, 0.4530572, 3.032221, 1, 0, 0.2235294, 1,
1.834371, 0.96279, 0.8796555, 1, 0, 0.2156863, 1,
1.847201, 0.2731012, 2.059554, 1, 0, 0.2117647, 1,
1.864501, 1.101327, 0.9472697, 1, 0, 0.2039216, 1,
1.884478, 0.7234029, 0.7168113, 1, 0, 0.1960784, 1,
1.903956, -1.231106, 1.7383, 1, 0, 0.1921569, 1,
1.91159, 0.9104413, -0.4766517, 1, 0, 0.1843137, 1,
1.932697, -0.7862973, 3.203736, 1, 0, 0.1803922, 1,
1.971238, 0.5931956, 1.361107, 1, 0, 0.172549, 1,
1.996339, -1.489743, 6.012759, 1, 0, 0.1686275, 1,
2.00562, 0.1437703, 1.182953, 1, 0, 0.1607843, 1,
2.013644, 0.01988101, 1.192804, 1, 0, 0.1568628, 1,
2.015535, 0.9840284, 0.6495084, 1, 0, 0.1490196, 1,
2.017323, -1.438281, 1.271861, 1, 0, 0.145098, 1,
2.031912, -0.956705, 2.836983, 1, 0, 0.1372549, 1,
2.045433, 1.058157, 1.788866, 1, 0, 0.1333333, 1,
2.112658, 0.3126581, 2.382433, 1, 0, 0.1254902, 1,
2.139544, -0.9171144, 1.918932, 1, 0, 0.1215686, 1,
2.139749, -3.878576, 2.860296, 1, 0, 0.1137255, 1,
2.147494, -0.2018036, 2.04462, 1, 0, 0.1098039, 1,
2.149507, -0.7718174, 0.91811, 1, 0, 0.1019608, 1,
2.157235, -0.2364025, 1.21452, 1, 0, 0.09411765, 1,
2.194883, 2.962803, 0.3940224, 1, 0, 0.09019608, 1,
2.201152, -0.8232065, 3.583308, 1, 0, 0.08235294, 1,
2.306136, 1.321949, 0.4211922, 1, 0, 0.07843138, 1,
2.393587, 1.423414, 1.279038, 1, 0, 0.07058824, 1,
2.435942, 0.5632164, 0.5826932, 1, 0, 0.06666667, 1,
2.7749, 0.3933116, 2.457229, 1, 0, 0.05882353, 1,
2.780097, -0.07705595, 2.89277, 1, 0, 0.05490196, 1,
3.056324, -0.8582133, 1.022936, 1, 0, 0.04705882, 1,
3.083559, -1.533369, 4.065253, 1, 0, 0.04313726, 1,
3.092906, 0.6864591, 0.828074, 1, 0, 0.03529412, 1,
3.135878, 0.09382281, 1.063387, 1, 0, 0.03137255, 1,
3.172704, 0.9677212, 0.1810447, 1, 0, 0.02352941, 1,
3.227698, -0.3456657, 1.240073, 1, 0, 0.01960784, 1,
3.230628, -0.6514991, 2.506663, 1, 0, 0.01176471, 1,
3.271681, -1.553005, 4.678836, 1, 0, 0.007843138, 1
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
0.08288932, -5.144256, -7.243246, 0, -0.5, 0.5, 0.5,
0.08288932, -5.144256, -7.243246, 1, -0.5, 0.5, 0.5,
0.08288932, -5.144256, -7.243246, 1, 1.5, 0.5, 0.5,
0.08288932, -5.144256, -7.243246, 0, 1.5, 0.5, 0.5
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
-4.186903, -0.1450064, -7.243246, 0, -0.5, 0.5, 0.5,
-4.186903, -0.1450064, -7.243246, 1, -0.5, 0.5, 0.5,
-4.186903, -0.1450064, -7.243246, 1, 1.5, 0.5, 0.5,
-4.186903, -0.1450064, -7.243246, 0, 1.5, 0.5, 0.5
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
-4.186903, -5.144256, 0.3453777, 0, -0.5, 0.5, 0.5,
-4.186903, -5.144256, 0.3453777, 1, -0.5, 0.5, 0.5,
-4.186903, -5.144256, 0.3453777, 1, 1.5, 0.5, 0.5,
-4.186903, -5.144256, 0.3453777, 0, 1.5, 0.5, 0.5
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
-3, -3.990583, -5.492025,
3, -3.990583, -5.492025,
-3, -3.990583, -5.492025,
-3, -4.182861, -5.783895,
-2, -3.990583, -5.492025,
-2, -4.182861, -5.783895,
-1, -3.990583, -5.492025,
-1, -4.182861, -5.783895,
0, -3.990583, -5.492025,
0, -4.182861, -5.783895,
1, -3.990583, -5.492025,
1, -4.182861, -5.783895,
2, -3.990583, -5.492025,
2, -4.182861, -5.783895,
3, -3.990583, -5.492025,
3, -4.182861, -5.783895
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
-3, -4.567419, -6.367636, 0, -0.5, 0.5, 0.5,
-3, -4.567419, -6.367636, 1, -0.5, 0.5, 0.5,
-3, -4.567419, -6.367636, 1, 1.5, 0.5, 0.5,
-3, -4.567419, -6.367636, 0, 1.5, 0.5, 0.5,
-2, -4.567419, -6.367636, 0, -0.5, 0.5, 0.5,
-2, -4.567419, -6.367636, 1, -0.5, 0.5, 0.5,
-2, -4.567419, -6.367636, 1, 1.5, 0.5, 0.5,
-2, -4.567419, -6.367636, 0, 1.5, 0.5, 0.5,
-1, -4.567419, -6.367636, 0, -0.5, 0.5, 0.5,
-1, -4.567419, -6.367636, 1, -0.5, 0.5, 0.5,
-1, -4.567419, -6.367636, 1, 1.5, 0.5, 0.5,
-1, -4.567419, -6.367636, 0, 1.5, 0.5, 0.5,
0, -4.567419, -6.367636, 0, -0.5, 0.5, 0.5,
0, -4.567419, -6.367636, 1, -0.5, 0.5, 0.5,
0, -4.567419, -6.367636, 1, 1.5, 0.5, 0.5,
0, -4.567419, -6.367636, 0, 1.5, 0.5, 0.5,
1, -4.567419, -6.367636, 0, -0.5, 0.5, 0.5,
1, -4.567419, -6.367636, 1, -0.5, 0.5, 0.5,
1, -4.567419, -6.367636, 1, 1.5, 0.5, 0.5,
1, -4.567419, -6.367636, 0, 1.5, 0.5, 0.5,
2, -4.567419, -6.367636, 0, -0.5, 0.5, 0.5,
2, -4.567419, -6.367636, 1, -0.5, 0.5, 0.5,
2, -4.567419, -6.367636, 1, 1.5, 0.5, 0.5,
2, -4.567419, -6.367636, 0, 1.5, 0.5, 0.5,
3, -4.567419, -6.367636, 0, -0.5, 0.5, 0.5,
3, -4.567419, -6.367636, 1, -0.5, 0.5, 0.5,
3, -4.567419, -6.367636, 1, 1.5, 0.5, 0.5,
3, -4.567419, -6.367636, 0, 1.5, 0.5, 0.5
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
-3.201566, -2, -5.492025,
-3.201566, 2, -5.492025,
-3.201566, -2, -5.492025,
-3.365789, -2, -5.783895,
-3.201566, 0, -5.492025,
-3.365789, 0, -5.783895,
-3.201566, 2, -5.492025,
-3.365789, 2, -5.783895
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
"0",
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
-3.694235, -2, -6.367636, 0, -0.5, 0.5, 0.5,
-3.694235, -2, -6.367636, 1, -0.5, 0.5, 0.5,
-3.694235, -2, -6.367636, 1, 1.5, 0.5, 0.5,
-3.694235, -2, -6.367636, 0, 1.5, 0.5, 0.5,
-3.694235, 0, -6.367636, 0, -0.5, 0.5, 0.5,
-3.694235, 0, -6.367636, 1, -0.5, 0.5, 0.5,
-3.694235, 0, -6.367636, 1, 1.5, 0.5, 0.5,
-3.694235, 0, -6.367636, 0, 1.5, 0.5, 0.5,
-3.694235, 2, -6.367636, 0, -0.5, 0.5, 0.5,
-3.694235, 2, -6.367636, 1, -0.5, 0.5, 0.5,
-3.694235, 2, -6.367636, 1, 1.5, 0.5, 0.5,
-3.694235, 2, -6.367636, 0, 1.5, 0.5, 0.5
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
-3.201566, -3.990583, -4,
-3.201566, -3.990583, 6,
-3.201566, -3.990583, -4,
-3.365789, -4.182861, -4,
-3.201566, -3.990583, -2,
-3.365789, -4.182861, -2,
-3.201566, -3.990583, 0,
-3.365789, -4.182861, 0,
-3.201566, -3.990583, 2,
-3.365789, -4.182861, 2,
-3.201566, -3.990583, 4,
-3.365789, -4.182861, 4,
-3.201566, -3.990583, 6,
-3.365789, -4.182861, 6
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
"4",
"6"
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
-3.694235, -4.567419, -4, 0, -0.5, 0.5, 0.5,
-3.694235, -4.567419, -4, 1, -0.5, 0.5, 0.5,
-3.694235, -4.567419, -4, 1, 1.5, 0.5, 0.5,
-3.694235, -4.567419, -4, 0, 1.5, 0.5, 0.5,
-3.694235, -4.567419, -2, 0, -0.5, 0.5, 0.5,
-3.694235, -4.567419, -2, 1, -0.5, 0.5, 0.5,
-3.694235, -4.567419, -2, 1, 1.5, 0.5, 0.5,
-3.694235, -4.567419, -2, 0, 1.5, 0.5, 0.5,
-3.694235, -4.567419, 0, 0, -0.5, 0.5, 0.5,
-3.694235, -4.567419, 0, 1, -0.5, 0.5, 0.5,
-3.694235, -4.567419, 0, 1, 1.5, 0.5, 0.5,
-3.694235, -4.567419, 0, 0, 1.5, 0.5, 0.5,
-3.694235, -4.567419, 2, 0, -0.5, 0.5, 0.5,
-3.694235, -4.567419, 2, 1, -0.5, 0.5, 0.5,
-3.694235, -4.567419, 2, 1, 1.5, 0.5, 0.5,
-3.694235, -4.567419, 2, 0, 1.5, 0.5, 0.5,
-3.694235, -4.567419, 4, 0, -0.5, 0.5, 0.5,
-3.694235, -4.567419, 4, 1, -0.5, 0.5, 0.5,
-3.694235, -4.567419, 4, 1, 1.5, 0.5, 0.5,
-3.694235, -4.567419, 4, 0, 1.5, 0.5, 0.5,
-3.694235, -4.567419, 6, 0, -0.5, 0.5, 0.5,
-3.694235, -4.567419, 6, 1, -0.5, 0.5, 0.5,
-3.694235, -4.567419, 6, 1, 1.5, 0.5, 0.5,
-3.694235, -4.567419, 6, 0, 1.5, 0.5, 0.5
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
-3.201566, -3.990583, -5.492025,
-3.201566, 3.70057, -5.492025,
-3.201566, -3.990583, 6.182781,
-3.201566, 3.70057, 6.182781,
-3.201566, -3.990583, -5.492025,
-3.201566, -3.990583, 6.182781,
-3.201566, 3.70057, -5.492025,
-3.201566, 3.70057, 6.182781,
-3.201566, -3.990583, -5.492025,
3.367345, -3.990583, -5.492025,
-3.201566, -3.990583, 6.182781,
3.367345, -3.990583, 6.182781,
-3.201566, 3.70057, -5.492025,
3.367345, 3.70057, -5.492025,
-3.201566, 3.70057, 6.182781,
3.367345, 3.70057, 6.182781,
3.367345, -3.990583, -5.492025,
3.367345, 3.70057, -5.492025,
3.367345, -3.990583, 6.182781,
3.367345, 3.70057, 6.182781,
3.367345, -3.990583, -5.492025,
3.367345, -3.990583, 6.182781,
3.367345, 3.70057, -5.492025,
3.367345, 3.70057, 6.182781
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
var radius = 8.248324;
var distance = 36.69773;
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
mvMatrix.translate( -0.08288932, 0.1450064, -0.3453777 );
mvMatrix.scale( 1.357645, 1.159547, 0.7638885 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.69773);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
benzylaminopurine<-read.table("benzylaminopurine.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benzylaminopurine$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzylaminopurine' not found
```

```r
y<-benzylaminopurine$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzylaminopurine' not found
```

```r
z<-benzylaminopurine$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzylaminopurine' not found
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
-3.105903, -1.247222, -2.310585, 0, 0, 1, 1, 1,
-3.105024, 0.4733523, -1.928451, 1, 0, 0, 1, 1,
-3.098665, 1.159412, -1.212927, 1, 0, 0, 1, 1,
-2.906173, -0.1021378, -0.4685768, 1, 0, 0, 1, 1,
-2.853544, 0.1049829, -1.974682, 1, 0, 0, 1, 1,
-2.457791, 1.271771, -2.161312, 1, 0, 0, 1, 1,
-2.327422, -3.126697, -0.21354, 0, 0, 0, 1, 1,
-2.223011, 0.5145809, -0.2915569, 0, 0, 0, 1, 1,
-2.124546, -0.8518065, -0.1728823, 0, 0, 0, 1, 1,
-2.081974, -0.8225303, -1.77454, 0, 0, 0, 1, 1,
-2.06844, -0.3500258, -0.2751272, 0, 0, 0, 1, 1,
-2.059798, -1.361212, -1.943352, 0, 0, 0, 1, 1,
-2.02301, 0.08965276, -0.5654536, 0, 0, 0, 1, 1,
-2.012018, 0.7497625, -1.92606, 1, 1, 1, 1, 1,
-2.011187, -1.599738, -1.216514, 1, 1, 1, 1, 1,
-1.910713, -0.8485153, -1.318687, 1, 1, 1, 1, 1,
-1.904891, 1.835934, -0.152179, 1, 1, 1, 1, 1,
-1.903381, 1.252168, -1.655118, 1, 1, 1, 1, 1,
-1.828908, -0.01316052, -1.125961, 1, 1, 1, 1, 1,
-1.82046, 1.865462, -1.377753, 1, 1, 1, 1, 1,
-1.808484, 0.861052, -1.787892, 1, 1, 1, 1, 1,
-1.801426, -0.462744, -2.799951, 1, 1, 1, 1, 1,
-1.793338, 0.2487607, -2.619678, 1, 1, 1, 1, 1,
-1.793258, -0.8903092, -2.277361, 1, 1, 1, 1, 1,
-1.773772, 1.443493, -0.2457039, 1, 1, 1, 1, 1,
-1.771021, 0.4156509, -0.2015679, 1, 1, 1, 1, 1,
-1.753585, -0.4121234, -1.58295, 1, 1, 1, 1, 1,
-1.743305, -1.308196, -2.059331, 1, 1, 1, 1, 1,
-1.729862, -0.0486665, -0.5502231, 0, 0, 1, 1, 1,
-1.710428, 0.5886606, -2.673326, 1, 0, 0, 1, 1,
-1.704283, 2.171817, -0.7799764, 1, 0, 0, 1, 1,
-1.703137, -0.8454869, -1.007581, 1, 0, 0, 1, 1,
-1.700196, 3.05866, -1.891191, 1, 0, 0, 1, 1,
-1.699691, -2.890774, -2.868557, 1, 0, 0, 1, 1,
-1.693539, -1.136524, -3.172062, 0, 0, 0, 1, 1,
-1.68092, 1.153979, -0.9287993, 0, 0, 0, 1, 1,
-1.660772, 1.039445, -0.8844676, 0, 0, 0, 1, 1,
-1.656748, 0.6941866, -0.3444063, 0, 0, 0, 1, 1,
-1.655125, -1.657473, -2.509795, 0, 0, 0, 1, 1,
-1.655065, -1.259737, -3.072625, 0, 0, 0, 1, 1,
-1.624883, -0.7624677, -2.482637, 0, 0, 0, 1, 1,
-1.624672, 0.6099062, -1.138993, 1, 1, 1, 1, 1,
-1.62345, -0.2786086, -1.355377, 1, 1, 1, 1, 1,
-1.622632, 1.450132, -2.559768, 1, 1, 1, 1, 1,
-1.615277, -1.950915, -3.340054, 1, 1, 1, 1, 1,
-1.607949, -0.1863772, -1.786619, 1, 1, 1, 1, 1,
-1.606669, 0.3915998, -2.19675, 1, 1, 1, 1, 1,
-1.605224, 1.753966, -1.434002, 1, 1, 1, 1, 1,
-1.603955, 1.349982, -2.38526, 1, 1, 1, 1, 1,
-1.600176, -0.1794202, -3.683064, 1, 1, 1, 1, 1,
-1.593747, 0.7616668, -1.574406, 1, 1, 1, 1, 1,
-1.585284, -1.916056, -3.032558, 1, 1, 1, 1, 1,
-1.576863, -0.3179452, -1.429477, 1, 1, 1, 1, 1,
-1.576204, -0.2904978, -0.7004479, 1, 1, 1, 1, 1,
-1.570241, 1.40952, -1.640036, 1, 1, 1, 1, 1,
-1.562739, -0.1486948, -0.7047802, 1, 1, 1, 1, 1,
-1.552011, 0.0158978, -0.8569491, 0, 0, 1, 1, 1,
-1.548863, 1.578537, -0.3021364, 1, 0, 0, 1, 1,
-1.543882, -1.325674, -1.22188, 1, 0, 0, 1, 1,
-1.542425, -0.4865223, -0.4318397, 1, 0, 0, 1, 1,
-1.540997, -1.969789, -1.60061, 1, 0, 0, 1, 1,
-1.525368, 0.7359337, -0.3731165, 1, 0, 0, 1, 1,
-1.514759, -0.0101971, -1.608471, 0, 0, 0, 1, 1,
-1.510995, 0.9164152, 0.1167569, 0, 0, 0, 1, 1,
-1.507378, -0.6259238, -3.642255, 0, 0, 0, 1, 1,
-1.499383, -1.311352, -2.795348, 0, 0, 0, 1, 1,
-1.495682, -0.9960276, -2.09315, 0, 0, 0, 1, 1,
-1.495478, 1.812978, -0.1754006, 0, 0, 0, 1, 1,
-1.486528, 1.332187, -1.574442, 0, 0, 0, 1, 1,
-1.479232, -0.7216979, -2.785817, 1, 1, 1, 1, 1,
-1.462968, 1.188044, 0.2726453, 1, 1, 1, 1, 1,
-1.462731, -0.2350964, -3.063739, 1, 1, 1, 1, 1,
-1.460086, 0.4249444, -1.954865, 1, 1, 1, 1, 1,
-1.458473, 0.8930249, -1.374319, 1, 1, 1, 1, 1,
-1.451945, -1.800771, -3.207907, 1, 1, 1, 1, 1,
-1.442572, 3.588563, -0.1493805, 1, 1, 1, 1, 1,
-1.439718, -1.122398, -0.3691753, 1, 1, 1, 1, 1,
-1.433592, 0.03294768, -1.595974, 1, 1, 1, 1, 1,
-1.432962, -0.3497593, -2.597781, 1, 1, 1, 1, 1,
-1.429847, -0.9666763, -2.484171, 1, 1, 1, 1, 1,
-1.426085, 0.03930189, -1.46014, 1, 1, 1, 1, 1,
-1.421564, -0.2798579, -2.250836, 1, 1, 1, 1, 1,
-1.412334, 1.199254, -1.257327, 1, 1, 1, 1, 1,
-1.410876, -0.002596207, -1.517964, 1, 1, 1, 1, 1,
-1.404279, -1.620449, -1.914788, 0, 0, 1, 1, 1,
-1.39983, -0.4699213, -1.503772, 1, 0, 0, 1, 1,
-1.380984, -0.02162326, -2.239701, 1, 0, 0, 1, 1,
-1.377809, 1.198456, -1.834753, 1, 0, 0, 1, 1,
-1.366617, 0.6091202, -0.812618, 1, 0, 0, 1, 1,
-1.361294, -1.791589, -1.972096, 1, 0, 0, 1, 1,
-1.358847, -1.163678, -1.806302, 0, 0, 0, 1, 1,
-1.347233, 0.7713472, 0.2149688, 0, 0, 0, 1, 1,
-1.346271, 1.196978, -1.207217, 0, 0, 0, 1, 1,
-1.344375, -1.051149, -2.182051, 0, 0, 0, 1, 1,
-1.341949, 2.007651, -2.195851, 0, 0, 0, 1, 1,
-1.334803, 0.1831155, -2.436031, 0, 0, 0, 1, 1,
-1.330861, 0.3871492, -1.017958, 0, 0, 0, 1, 1,
-1.328403, 0.1535704, -1.281536, 1, 1, 1, 1, 1,
-1.328263, -1.375746, -4.55074, 1, 1, 1, 1, 1,
-1.320665, -0.017183, -2.05786, 1, 1, 1, 1, 1,
-1.320264, -0.6104214, -0.11987, 1, 1, 1, 1, 1,
-1.313272, 0.7348285, -0.6101462, 1, 1, 1, 1, 1,
-1.313204, 0.03136573, 0.3514801, 1, 1, 1, 1, 1,
-1.306956, -1.403146, -2.123986, 1, 1, 1, 1, 1,
-1.301433, 0.4158795, -1.114749, 1, 1, 1, 1, 1,
-1.297357, 0.09763584, -0.8806355, 1, 1, 1, 1, 1,
-1.293463, -0.2040896, -1.103529, 1, 1, 1, 1, 1,
-1.292318, -1.791804, -3.8483, 1, 1, 1, 1, 1,
-1.289418, 1.789508, -0.9042141, 1, 1, 1, 1, 1,
-1.267697, 1.540738, -0.3297523, 1, 1, 1, 1, 1,
-1.259319, 1.260352, -0.6126032, 1, 1, 1, 1, 1,
-1.257634, -0.5709565, -0.6035585, 1, 1, 1, 1, 1,
-1.249003, 1.116489, -0.566745, 0, 0, 1, 1, 1,
-1.248351, 0.08767441, -3.84855, 1, 0, 0, 1, 1,
-1.246967, -0.1124516, -2.474187, 1, 0, 0, 1, 1,
-1.241762, 0.8316682, -2.085487, 1, 0, 0, 1, 1,
-1.239923, 0.148248, -0.621804, 1, 0, 0, 1, 1,
-1.239378, 0.9167051, -0.3222762, 1, 0, 0, 1, 1,
-1.237515, -0.7803428, -1.29154, 0, 0, 0, 1, 1,
-1.235331, -0.1731188, -1.909325, 0, 0, 0, 1, 1,
-1.233162, -0.5977814, -3.280077, 0, 0, 0, 1, 1,
-1.232823, -0.8687655, -2.643117, 0, 0, 0, 1, 1,
-1.209656, -0.5630955, -3.147691, 0, 0, 0, 1, 1,
-1.197814, 0.2125528, -1.771724, 0, 0, 0, 1, 1,
-1.197506, -0.366093, -2.613234, 0, 0, 0, 1, 1,
-1.196941, 0.5487175, 0.3624272, 1, 1, 1, 1, 1,
-1.195947, 0.4236669, -2.918149, 1, 1, 1, 1, 1,
-1.19523, 0.2610163, -2.232948, 1, 1, 1, 1, 1,
-1.194836, 2.425987, -0.1459662, 1, 1, 1, 1, 1,
-1.190739, -2.079273, -2.289917, 1, 1, 1, 1, 1,
-1.187322, -0.7494497, -3.257904, 1, 1, 1, 1, 1,
-1.184836, -0.9920269, -1.454682, 1, 1, 1, 1, 1,
-1.183983, 2.247862, 0.8993351, 1, 1, 1, 1, 1,
-1.177568, 0.7456379, -2.063534, 1, 1, 1, 1, 1,
-1.165321, -0.3124831, -2.583316, 1, 1, 1, 1, 1,
-1.161166, 0.604587, -1.053278, 1, 1, 1, 1, 1,
-1.154933, 1.155012, -0.3396559, 1, 1, 1, 1, 1,
-1.146928, -1.56599, -1.517281, 1, 1, 1, 1, 1,
-1.135976, -0.4392426, -0.6814126, 1, 1, 1, 1, 1,
-1.134217, -1.863159, -2.527586, 1, 1, 1, 1, 1,
-1.13239, -0.1505071, -1.826309, 0, 0, 1, 1, 1,
-1.129947, 0.6132625, -1.162195, 1, 0, 0, 1, 1,
-1.121903, 0.4938573, -2.369895, 1, 0, 0, 1, 1,
-1.119675, 0.1959766, -1.216633, 1, 0, 0, 1, 1,
-1.115611, -1.790222, -4.396518, 1, 0, 0, 1, 1,
-1.113693, -0.187219, -1.689184, 1, 0, 0, 1, 1,
-1.107044, 0.9075077, -1.532897, 0, 0, 0, 1, 1,
-1.104358, -0.973106, -1.342337, 0, 0, 0, 1, 1,
-1.099377, 0.1526128, -2.667698, 0, 0, 0, 1, 1,
-1.09753, -1.095609, -2.195591, 0, 0, 0, 1, 1,
-1.093309, -0.3579679, -0.8693604, 0, 0, 0, 1, 1,
-1.0919, 0.1663229, -0.1400385, 0, 0, 0, 1, 1,
-1.083731, -0.2375626, -2.053599, 0, 0, 0, 1, 1,
-1.080361, -0.7846727, -2.648096, 1, 1, 1, 1, 1,
-1.075385, 1.48169, 0.1213465, 1, 1, 1, 1, 1,
-1.059527, 0.5120265, 0.3881343, 1, 1, 1, 1, 1,
-1.057513, -1.943118, -2.900181, 1, 1, 1, 1, 1,
-1.04566, 0.2034146, -0.1498069, 1, 1, 1, 1, 1,
-1.036573, 0.2856632, -1.22173, 1, 1, 1, 1, 1,
-1.027821, 1.456043, 0.1237093, 1, 1, 1, 1, 1,
-1.025194, -0.1569441, -2.295404, 1, 1, 1, 1, 1,
-1.00872, -0.868607, -4.271744, 1, 1, 1, 1, 1,
-1.008213, -1.32015, -2.667105, 1, 1, 1, 1, 1,
-0.9934924, -1.065528, -3.613188, 1, 1, 1, 1, 1,
-0.9913517, 0.1447723, -2.783087, 1, 1, 1, 1, 1,
-0.9823132, -0.7588381, -2.051755, 1, 1, 1, 1, 1,
-0.9812025, 1.305498, -2.565537, 1, 1, 1, 1, 1,
-0.9756532, 0.4201219, -2.218227, 1, 1, 1, 1, 1,
-0.964054, -0.3265256, -3.370173, 0, 0, 1, 1, 1,
-0.9619536, 0.751163, -1.874783, 1, 0, 0, 1, 1,
-0.956687, 2.349008, 0.01374728, 1, 0, 0, 1, 1,
-0.945339, 0.5433097, -1.686421, 1, 0, 0, 1, 1,
-0.945304, -0.3464563, -2.422523, 1, 0, 0, 1, 1,
-0.9281541, 0.2102721, -0.4992318, 1, 0, 0, 1, 1,
-0.9256834, 0.02437024, -1.539958, 0, 0, 0, 1, 1,
-0.9228298, -0.3731067, -0.6577587, 0, 0, 0, 1, 1,
-0.9211257, -0.3120985, -1.655035, 0, 0, 0, 1, 1,
-0.9187136, -0.08216675, -1.241059, 0, 0, 0, 1, 1,
-0.9185433, 1.0152, -1.778987, 0, 0, 0, 1, 1,
-0.9151826, 0.7270722, -0.2826846, 0, 0, 0, 1, 1,
-0.9129426, 0.4589964, -1.390541, 0, 0, 0, 1, 1,
-0.9124186, -0.751044, -2.345323, 1, 1, 1, 1, 1,
-0.9119581, 0.2226693, -1.804076, 1, 1, 1, 1, 1,
-0.9116556, -0.7297508, -2.516021, 1, 1, 1, 1, 1,
-0.9116281, 1.772382, 0.4570071, 1, 1, 1, 1, 1,
-0.9093509, 1.744174, -0.7654141, 1, 1, 1, 1, 1,
-0.9046378, -1.312105, -0.6773943, 1, 1, 1, 1, 1,
-0.9044385, 0.3765563, -3.081496, 1, 1, 1, 1, 1,
-0.9017332, -0.19, -1.074573, 1, 1, 1, 1, 1,
-0.9000162, -0.5688509, -3.314332, 1, 1, 1, 1, 1,
-0.8971547, 1.324658, -0.6242267, 1, 1, 1, 1, 1,
-0.8939957, 0.6325935, -0.747435, 1, 1, 1, 1, 1,
-0.8909028, 0.198439, -0.8411822, 1, 1, 1, 1, 1,
-0.8904933, 1.188071, 0.02208499, 1, 1, 1, 1, 1,
-0.8856041, 0.4080988, -0.4479814, 1, 1, 1, 1, 1,
-0.8837987, -0.2102344, -2.04909, 1, 1, 1, 1, 1,
-0.8830845, 0.6502449, -0.5748354, 0, 0, 1, 1, 1,
-0.8808203, 0.8025704, -0.5128599, 1, 0, 0, 1, 1,
-0.8657769, -1.249563, -1.059034, 1, 0, 0, 1, 1,
-0.8652607, -0.5704863, -2.210448, 1, 0, 0, 1, 1,
-0.8641766, -1.399244, -1.793296, 1, 0, 0, 1, 1,
-0.8590856, 0.6057256, -2.559841, 1, 0, 0, 1, 1,
-0.8536071, -0.1931014, -0.8258719, 0, 0, 0, 1, 1,
-0.8505275, -2.562061, -3.172532, 0, 0, 0, 1, 1,
-0.8451869, 0.5240417, 0.112097, 0, 0, 0, 1, 1,
-0.8400943, -1.20275, -3.364319, 0, 0, 0, 1, 1,
-0.8371703, 1.300833, -1.071782, 0, 0, 0, 1, 1,
-0.8359926, 1.610267, -1.028259, 0, 0, 0, 1, 1,
-0.8353108, -0.366367, -1.94516, 0, 0, 0, 1, 1,
-0.8312643, 0.09022437, -0.4804473, 1, 1, 1, 1, 1,
-0.8116958, -0.6390298, -3.839403, 1, 1, 1, 1, 1,
-0.8106402, -0.7164052, -1.789957, 1, 1, 1, 1, 1,
-0.8088887, -0.1513799, -0.7547224, 1, 1, 1, 1, 1,
-0.804938, 0.9093528, -1.270613, 1, 1, 1, 1, 1,
-0.8024901, -0.5389014, -1.074063, 1, 1, 1, 1, 1,
-0.7981835, -1.052024, -3.323139, 1, 1, 1, 1, 1,
-0.7980722, 0.4369106, 0.008308824, 1, 1, 1, 1, 1,
-0.7889809, -1.137647, -3.051871, 1, 1, 1, 1, 1,
-0.7791322, 0.4001859, -2.692554, 1, 1, 1, 1, 1,
-0.7732217, 1.474994, 0.6943635, 1, 1, 1, 1, 1,
-0.7726004, 0.02433405, 0.2537423, 1, 1, 1, 1, 1,
-0.7686833, -0.002038826, -2.52301, 1, 1, 1, 1, 1,
-0.7654191, -0.829299, -1.169057, 1, 1, 1, 1, 1,
-0.7607599, -0.02046364, -1.824542, 1, 1, 1, 1, 1,
-0.7596769, 0.1815112, -1.177834, 0, 0, 1, 1, 1,
-0.7490519, -1.319906, -3.167756, 1, 0, 0, 1, 1,
-0.7451596, 0.5968086, -0.5771624, 1, 0, 0, 1, 1,
-0.740089, -0.2321635, -1.940233, 1, 0, 0, 1, 1,
-0.7353809, 0.9733821, -0.5560727, 1, 0, 0, 1, 1,
-0.7326393, 0.4924424, -1.434743, 1, 0, 0, 1, 1,
-0.7281355, -0.9820567, -3.192116, 0, 0, 0, 1, 1,
-0.7188044, 0.113281, -0.5153725, 0, 0, 0, 1, 1,
-0.7180376, 0.3204122, -3.056793, 0, 0, 0, 1, 1,
-0.7148191, -1.348967, -1.343328, 0, 0, 0, 1, 1,
-0.7140425, 0.552101, 0.4208582, 0, 0, 0, 1, 1,
-0.7133223, 0.951641, 0.3131083, 0, 0, 0, 1, 1,
-0.7096822, 0.1150587, -0.4742636, 0, 0, 0, 1, 1,
-0.7068044, -0.391569, -1.116315, 1, 1, 1, 1, 1,
-0.7060655, -0.1866363, -2.110975, 1, 1, 1, 1, 1,
-0.7040358, -0.7614799, -2.530406, 1, 1, 1, 1, 1,
-0.702792, -0.0884777, -2.049178, 1, 1, 1, 1, 1,
-0.6984019, 0.519514, -2.281792, 1, 1, 1, 1, 1,
-0.6937048, -0.09301008, -1.893208, 1, 1, 1, 1, 1,
-0.6841739, -0.1710036, -3.302249, 1, 1, 1, 1, 1,
-0.6840284, 0.8574939, 0.5528374, 1, 1, 1, 1, 1,
-0.6817357, -1.024381, -2.55659, 1, 1, 1, 1, 1,
-0.6807554, 0.1154572, -0.9926963, 1, 1, 1, 1, 1,
-0.6778459, 1.194403, -0.02924157, 1, 1, 1, 1, 1,
-0.6774911, 0.6540962, -1.603907, 1, 1, 1, 1, 1,
-0.6751494, -0.1956502, -2.223247, 1, 1, 1, 1, 1,
-0.6736347, 0.6164548, -0.7235076, 1, 1, 1, 1, 1,
-0.6662539, -0.1280786, -3.205922, 1, 1, 1, 1, 1,
-0.6656292, -1.456916, -2.884249, 0, 0, 1, 1, 1,
-0.6603857, 0.0105886, -1.910612, 1, 0, 0, 1, 1,
-0.6585712, 0.9554594, 0.4204074, 1, 0, 0, 1, 1,
-0.6487492, 0.9761652, -2.320762, 1, 0, 0, 1, 1,
-0.6419874, 0.8871437, 0.1248757, 1, 0, 0, 1, 1,
-0.6381109, 0.4794794, -0.2838772, 1, 0, 0, 1, 1,
-0.6342022, -0.9102255, -2.873303, 0, 0, 0, 1, 1,
-0.6298124, 1.326284, -1.217815, 0, 0, 0, 1, 1,
-0.6250437, -1.37003, -1.990727, 0, 0, 0, 1, 1,
-0.6156866, -0.2441109, -2.364485, 0, 0, 0, 1, 1,
-0.6141323, -0.1191507, -1.12467, 0, 0, 0, 1, 1,
-0.6119869, 0.6199846, -2.366597, 0, 0, 0, 1, 1,
-0.6095963, 0.3380068, -0.09117428, 0, 0, 0, 1, 1,
-0.6066676, -0.2259136, -1.318045, 1, 1, 1, 1, 1,
-0.6011533, -1.263906, -2.946486, 1, 1, 1, 1, 1,
-0.6007732, -0.1273198, -1.804395, 1, 1, 1, 1, 1,
-0.5970811, -0.851568, -2.289319, 1, 1, 1, 1, 1,
-0.5968071, 1.752241, 0.3044465, 1, 1, 1, 1, 1,
-0.5958524, 1.431366, -0.7266661, 1, 1, 1, 1, 1,
-0.582576, 0.09044573, -1.733326, 1, 1, 1, 1, 1,
-0.581915, 0.3502464, -1.403818, 1, 1, 1, 1, 1,
-0.5814493, 0.2153287, -1.685677, 1, 1, 1, 1, 1,
-0.5776568, 1.720731, -0.1942689, 1, 1, 1, 1, 1,
-0.5767122, -0.9112002, -2.049841, 1, 1, 1, 1, 1,
-0.5637197, 0.4989363, -2.012244, 1, 1, 1, 1, 1,
-0.561447, -0.9481779, -2.424735, 1, 1, 1, 1, 1,
-0.5516751, 0.770784, -0.3826124, 1, 1, 1, 1, 1,
-0.5437935, 0.934655, -0.7379121, 1, 1, 1, 1, 1,
-0.5421768, -1.086402, -2.233628, 0, 0, 1, 1, 1,
-0.5329146, -0.8742067, -2.687548, 1, 0, 0, 1, 1,
-0.532809, -0.383371, -0.2761641, 1, 0, 0, 1, 1,
-0.5285413, -0.2086538, -3.407671, 1, 0, 0, 1, 1,
-0.5261272, 1.636195, -1.945902, 1, 0, 0, 1, 1,
-0.5256344, 0.01922875, -2.564351, 1, 0, 0, 1, 1,
-0.5254305, 0.9161447, 1.224022, 0, 0, 0, 1, 1,
-0.5232453, 0.536303, -1.451176, 0, 0, 0, 1, 1,
-0.5166014, 0.1523669, 1.475063, 0, 0, 0, 1, 1,
-0.5075938, -1.315322, -1.666311, 0, 0, 0, 1, 1,
-0.5058274, 1.346583, 0.403892, 0, 0, 0, 1, 1,
-0.5026754, -0.8344834, -2.043615, 0, 0, 0, 1, 1,
-0.5012259, -1.212103, -4.149016, 0, 0, 0, 1, 1,
-0.5007091, -1.145252, -1.236428, 1, 1, 1, 1, 1,
-0.5006485, -0.6866964, -1.78419, 1, 1, 1, 1, 1,
-0.4993383, 1.357136, 0.3354981, 1, 1, 1, 1, 1,
-0.4976994, 1.277514, 0.6896403, 1, 1, 1, 1, 1,
-0.4964758, 1.080793, -0.2180098, 1, 1, 1, 1, 1,
-0.4963362, 0.1848107, 0.5819198, 1, 1, 1, 1, 1,
-0.4960009, 0.3858849, -0.6832385, 1, 1, 1, 1, 1,
-0.4885486, -0.8884374, -2.70579, 1, 1, 1, 1, 1,
-0.4875847, 1.515488, 1.120711, 1, 1, 1, 1, 1,
-0.4845269, -1.017178, -4.357558, 1, 1, 1, 1, 1,
-0.4823684, 1.609292, 0.001179947, 1, 1, 1, 1, 1,
-0.481431, 0.4314506, -1.090729, 1, 1, 1, 1, 1,
-0.4703276, -0.9748549, -1.319397, 1, 1, 1, 1, 1,
-0.4623813, 1.004631, -0.6681705, 1, 1, 1, 1, 1,
-0.4608867, -1.303217, -3.517818, 1, 1, 1, 1, 1,
-0.4598248, 1.068002, -1.084894, 0, 0, 1, 1, 1,
-0.4559702, 0.8497203, -1.432156, 1, 0, 0, 1, 1,
-0.4558767, 0.2757399, 0.1948602, 1, 0, 0, 1, 1,
-0.4432777, 0.2919289, -2.677737, 1, 0, 0, 1, 1,
-0.4418458, 0.9336595, -0.6559607, 1, 0, 0, 1, 1,
-0.4366837, -0.1336948, -3.513384, 1, 0, 0, 1, 1,
-0.4334713, 0.5614488, 0.01409772, 0, 0, 0, 1, 1,
-0.4217602, 0.2712391, -3.08935, 0, 0, 0, 1, 1,
-0.4201799, -0.5416292, -1.922243, 0, 0, 0, 1, 1,
-0.4165467, -0.3712533, -3.005305, 0, 0, 0, 1, 1,
-0.4164346, -1.086502, -2.956726, 0, 0, 0, 1, 1,
-0.4155698, 0.2025475, -1.455728, 0, 0, 0, 1, 1,
-0.4140037, -0.6267231, -2.273784, 0, 0, 0, 1, 1,
-0.4127706, 0.7087067, -0.4880701, 1, 1, 1, 1, 1,
-0.4124688, -1.076858, -1.917418, 1, 1, 1, 1, 1,
-0.4122998, 0.7184846, -0.7707424, 1, 1, 1, 1, 1,
-0.4120295, -0.02286135, -1.47557, 1, 1, 1, 1, 1,
-0.4111937, 1.607895, -1.737408, 1, 1, 1, 1, 1,
-0.4109007, -1.877976, -2.609576, 1, 1, 1, 1, 1,
-0.4094523, -1.322334, -2.198657, 1, 1, 1, 1, 1,
-0.4068555, 0.2220363, -1.656753, 1, 1, 1, 1, 1,
-0.4027679, -0.5377603, -1.407938, 1, 1, 1, 1, 1,
-0.4026514, 0.949249, -0.5256792, 1, 1, 1, 1, 1,
-0.3991451, -0.7173408, -2.942552, 1, 1, 1, 1, 1,
-0.398739, -1.124725, -3.871205, 1, 1, 1, 1, 1,
-0.388657, 1.489383, 0.6415305, 1, 1, 1, 1, 1,
-0.387156, 0.5147775, 1.639297, 1, 1, 1, 1, 1,
-0.3834897, -0.7049657, -3.587149, 1, 1, 1, 1, 1,
-0.3821271, -0.3912927, -2.405242, 0, 0, 1, 1, 1,
-0.3766434, 0.4333243, 0.1897885, 1, 0, 0, 1, 1,
-0.3757744, 0.1344055, -2.307077, 1, 0, 0, 1, 1,
-0.372724, -0.6794648, -2.273736, 1, 0, 0, 1, 1,
-0.3715697, 0.2417336, -1.352666, 1, 0, 0, 1, 1,
-0.3599673, 0.5522904, 0.2012608, 1, 0, 0, 1, 1,
-0.3589082, -1.265038, -4.544019, 0, 0, 0, 1, 1,
-0.3542342, -0.5177165, -2.535208, 0, 0, 0, 1, 1,
-0.3489664, -1.515029, -2.037966, 0, 0, 0, 1, 1,
-0.3468049, 0.870662, -0.4876471, 0, 0, 0, 1, 1,
-0.3466729, -0.2421645, -1.220955, 0, 0, 0, 1, 1,
-0.3466706, 0.7298239, -0.3620942, 0, 0, 0, 1, 1,
-0.3462021, -0.01587102, -0.5262101, 0, 0, 0, 1, 1,
-0.3461387, -0.76245, -1.758129, 1, 1, 1, 1, 1,
-0.3447678, -0.6322242, -1.293688, 1, 1, 1, 1, 1,
-0.343245, 1.26203, 0.2944179, 1, 1, 1, 1, 1,
-0.3414411, 0.3012415, -0.9754544, 1, 1, 1, 1, 1,
-0.3397848, -0.4928727, -2.872396, 1, 1, 1, 1, 1,
-0.3386505, 0.8119895, -1.301334, 1, 1, 1, 1, 1,
-0.3379149, -0.2742375, -2.84396, 1, 1, 1, 1, 1,
-0.3363485, -0.4820273, -2.657447, 1, 1, 1, 1, 1,
-0.3354379, 1.192629, 1.487359, 1, 1, 1, 1, 1,
-0.3344522, -0.9596424, -2.673257, 1, 1, 1, 1, 1,
-0.3309633, 0.8886547, -1.589749, 1, 1, 1, 1, 1,
-0.3300462, -0.5331385, -1.110945, 1, 1, 1, 1, 1,
-0.327635, -0.2379701, -2.392503, 1, 1, 1, 1, 1,
-0.3262163, -1.066112, -2.80789, 1, 1, 1, 1, 1,
-0.3226638, -0.3594229, -1.857855, 1, 1, 1, 1, 1,
-0.3163222, -0.4853142, -2.652922, 0, 0, 1, 1, 1,
-0.3131036, 0.03952, -1.006843, 1, 0, 0, 1, 1,
-0.311555, 0.3234151, -2.435085, 1, 0, 0, 1, 1,
-0.3079588, -1.188674, -2.774294, 1, 0, 0, 1, 1,
-0.3051012, -0.6349776, -0.9349695, 1, 0, 0, 1, 1,
-0.3038798, 0.7163143, -1.878099, 1, 0, 0, 1, 1,
-0.2967059, 0.8065234, -0.107854, 0, 0, 0, 1, 1,
-0.2937983, 1.661801, -0.02363961, 0, 0, 0, 1, 1,
-0.2894122, -0.09657919, -1.186494, 0, 0, 0, 1, 1,
-0.2844392, -0.1480071, -2.339181, 0, 0, 0, 1, 1,
-0.283998, -0.5502749, -2.466776, 0, 0, 0, 1, 1,
-0.2790829, 0.1165382, -1.453612, 0, 0, 0, 1, 1,
-0.2758683, 3.04582, 0.2140243, 0, 0, 0, 1, 1,
-0.2752275, 2.000163, 0.8457887, 1, 1, 1, 1, 1,
-0.2697725, 0.1921708, 0.0809023, 1, 1, 1, 1, 1,
-0.2687719, -0.5654536, -1.59811, 1, 1, 1, 1, 1,
-0.2617076, -0.2197615, -2.387172, 1, 1, 1, 1, 1,
-0.2565713, -0.03099124, -1.729991, 1, 1, 1, 1, 1,
-0.2564875, 0.03303103, -2.327574, 1, 1, 1, 1, 1,
-0.2536458, 0.2337905, 1.332573, 1, 1, 1, 1, 1,
-0.2517473, -0.2979745, -2.079782, 1, 1, 1, 1, 1,
-0.2499066, 0.4072132, 1.140011, 1, 1, 1, 1, 1,
-0.2496658, 1.147377, 0.9535905, 1, 1, 1, 1, 1,
-0.2462314, -1.927287, -2.496045, 1, 1, 1, 1, 1,
-0.2451345, 1.382458, 0.6077784, 1, 1, 1, 1, 1,
-0.2432805, -0.9349835, -2.180132, 1, 1, 1, 1, 1,
-0.2413433, -0.07360463, -1.531285, 1, 1, 1, 1, 1,
-0.2397396, -0.3634652, -3.603058, 1, 1, 1, 1, 1,
-0.2369238, -0.8104802, -2.230731, 0, 0, 1, 1, 1,
-0.23625, -1.291053, -1.470563, 1, 0, 0, 1, 1,
-0.2358778, 1.369831, -0.3620207, 1, 0, 0, 1, 1,
-0.2348936, -0.1319323, -1.820502, 1, 0, 0, 1, 1,
-0.2339635, 1.515834, 0.6240037, 1, 0, 0, 1, 1,
-0.2250794, -0.569154, -1.015066, 1, 0, 0, 1, 1,
-0.2243084, 1.333763, -0.1372332, 0, 0, 0, 1, 1,
-0.2184269, -1.643221, -1.663672, 0, 0, 0, 1, 1,
-0.2162386, 1.073259, -1.115916, 0, 0, 0, 1, 1,
-0.2160104, -0.8654372, -2.165143, 0, 0, 0, 1, 1,
-0.2130928, 0.4624538, 1.631069, 0, 0, 0, 1, 1,
-0.2101564, -1.490526, -2.770315, 0, 0, 0, 1, 1,
-0.2074078, 1.042701, -1.906779, 0, 0, 0, 1, 1,
-0.2031275, -0.04722978, -1.929428, 1, 1, 1, 1, 1,
-0.1994069, -0.5356368, -2.226576, 1, 1, 1, 1, 1,
-0.1961219, -0.2700352, -3.966514, 1, 1, 1, 1, 1,
-0.1931356, -2.050934, -3.765297, 1, 1, 1, 1, 1,
-0.1930416, 0.08781586, -0.7933071, 1, 1, 1, 1, 1,
-0.1923943, 0.5137984, 0.008264429, 1, 1, 1, 1, 1,
-0.1916053, -0.09744677, -3.058609, 1, 1, 1, 1, 1,
-0.1871564, 1.041434, -0.7776206, 1, 1, 1, 1, 1,
-0.1813104, -1.205698, -4.299144, 1, 1, 1, 1, 1,
-0.1811897, 0.2182092, 0.1625423, 1, 1, 1, 1, 1,
-0.1809839, 0.3892986, -0.7806399, 1, 1, 1, 1, 1,
-0.1743068, -0.6030222, -3.316885, 1, 1, 1, 1, 1,
-0.1730359, 0.1248636, 0.05284709, 1, 1, 1, 1, 1,
-0.1697182, 0.1157559, -1.057077, 1, 1, 1, 1, 1,
-0.1667834, -1.009833, -1.902722, 1, 1, 1, 1, 1,
-0.1652871, 0.2375221, -1.79249, 0, 0, 1, 1, 1,
-0.1644015, 2.353205, -1.538029, 1, 0, 0, 1, 1,
-0.1618245, 0.4258539, -0.05892014, 1, 0, 0, 1, 1,
-0.1600581, -0.7057002, -2.244073, 1, 0, 0, 1, 1,
-0.1583778, -0.6915223, -2.639466, 1, 0, 0, 1, 1,
-0.1555293, 0.923554, 0.1945893, 1, 0, 0, 1, 1,
-0.1530568, 0.3509231, -0.3048147, 0, 0, 0, 1, 1,
-0.1451683, -0.4402867, -2.895371, 0, 0, 0, 1, 1,
-0.1449157, 0.8880312, 0.3451646, 0, 0, 0, 1, 1,
-0.1431863, 0.6650712, -1.916789, 0, 0, 0, 1, 1,
-0.1429211, 0.2423371, -1.942015, 0, 0, 0, 1, 1,
-0.1424967, 0.5143622, 1.494114, 0, 0, 0, 1, 1,
-0.1418792, 0.5504209, 1.229273, 0, 0, 0, 1, 1,
-0.1308214, -1.609662, -3.360763, 1, 1, 1, 1, 1,
-0.129642, -1.582991, -3.754895, 1, 1, 1, 1, 1,
-0.1281055, -1.177661, -2.851306, 1, 1, 1, 1, 1,
-0.1273643, 0.6461275, 2.391831, 1, 1, 1, 1, 1,
-0.123804, -1.936579, -3.035862, 1, 1, 1, 1, 1,
-0.121795, -1.746034, -1.685671, 1, 1, 1, 1, 1,
-0.1201021, 1.35614, 0.3568654, 1, 1, 1, 1, 1,
-0.119262, -1.17094, -2.647533, 1, 1, 1, 1, 1,
-0.1184194, -0.07105907, -2.509423, 1, 1, 1, 1, 1,
-0.1159739, -0.2875606, -3.711135, 1, 1, 1, 1, 1,
-0.1145109, -1.477912, -3.572088, 1, 1, 1, 1, 1,
-0.1121863, 0.3820448, 0.6629288, 1, 1, 1, 1, 1,
-0.1117623, 0.05413086, -1.444522, 1, 1, 1, 1, 1,
-0.108914, 0.119942, -1.752885, 1, 1, 1, 1, 1,
-0.1077966, 0.2021773, -0.3772987, 1, 1, 1, 1, 1,
-0.1027849, 0.06564064, -2.11999, 0, 0, 1, 1, 1,
-0.1025187, 2.039703, 0.04906523, 1, 0, 0, 1, 1,
-0.1001109, -1.280418, -4.076571, 1, 0, 0, 1, 1,
-0.09818027, -0.8049172, -2.962057, 1, 0, 0, 1, 1,
-0.09251408, 0.01497413, -0.504475, 1, 0, 0, 1, 1,
-0.09150115, -0.3210843, -3.660922, 1, 0, 0, 1, 1,
-0.08632477, -1.696634, -4.366978, 0, 0, 0, 1, 1,
-0.08439526, 0.6001428, 0.9871684, 0, 0, 0, 1, 1,
-0.0832284, -0.7912753, -2.859019, 0, 0, 0, 1, 1,
-0.08322731, 0.8373843, 0.8753516, 0, 0, 0, 1, 1,
-0.08299968, -0.1089379, -1.932699, 0, 0, 0, 1, 1,
-0.08136242, 0.9072148, -0.004244894, 0, 0, 0, 1, 1,
-0.08079571, 0.4926057, -0.9475388, 0, 0, 0, 1, 1,
-0.08008172, -1.311343, -5.124053, 1, 1, 1, 1, 1,
-0.07733596, 3.361526, 1.000833, 1, 1, 1, 1, 1,
-0.07608861, -0.8984638, -0.8167815, 1, 1, 1, 1, 1,
-0.07225798, 0.007483237, -1.254252, 1, 1, 1, 1, 1,
-0.06602954, 0.3007058, 0.8033559, 1, 1, 1, 1, 1,
-0.06288525, -1.101529, -4.780213, 1, 1, 1, 1, 1,
-0.05879665, 0.9992875, 0.9142967, 1, 1, 1, 1, 1,
-0.05805239, -0.01026947, -1.860235, 1, 1, 1, 1, 1,
-0.05646241, -0.920553, -4.282779, 1, 1, 1, 1, 1,
-0.05625878, 0.2617546, -0.8255372, 1, 1, 1, 1, 1,
-0.05478495, -0.324087, -5.322004, 1, 1, 1, 1, 1,
-0.04985785, 1.098818, 0.4950339, 1, 1, 1, 1, 1,
-0.03928934, -0.141879, -2.217529, 1, 1, 1, 1, 1,
-0.03478796, 1.651427, 0.1858708, 1, 1, 1, 1, 1,
-0.03420635, 1.303572, 0.5336642, 1, 1, 1, 1, 1,
-0.0326287, 1.18941, 1.679063, 0, 0, 1, 1, 1,
-0.02982971, 0.2131096, 0.7147922, 1, 0, 0, 1, 1,
-0.02805907, -0.3350952, -1.703587, 1, 0, 0, 1, 1,
-0.02751333, -0.2189627, -0.8754147, 1, 0, 0, 1, 1,
-0.0259124, 0.3334292, 1.308191, 1, 0, 0, 1, 1,
-0.01706291, 0.4057069, 0.358713, 1, 0, 0, 1, 1,
-0.01703946, 1.748336, 0.08724424, 0, 0, 0, 1, 1,
-0.01398757, 1.900656, 1.275351, 0, 0, 0, 1, 1,
-0.007759888, 0.4742309, -1.432921, 0, 0, 0, 1, 1,
-0.005822888, -0.1659871, -2.92321, 0, 0, 0, 1, 1,
-0.002958816, -0.7690052, -1.453944, 0, 0, 0, 1, 1,
-0.001034801, -1.558397, -4.239044, 0, 0, 0, 1, 1,
0.002454383, -0.7057281, 3.212165, 0, 0, 0, 1, 1,
0.0044979, -1.187627, 3.463404, 1, 1, 1, 1, 1,
0.007389229, -0.8587827, 4.696074, 1, 1, 1, 1, 1,
0.00978091, -0.8640078, 2.025963, 1, 1, 1, 1, 1,
0.01008988, -0.695883, 2.070412, 1, 1, 1, 1, 1,
0.01165735, -1.54962, 2.550726, 1, 1, 1, 1, 1,
0.01222501, -1.456215, 4.062209, 1, 1, 1, 1, 1,
0.01276032, -1.519807, 1.961421, 1, 1, 1, 1, 1,
0.01374249, -0.7682078, 2.525124, 1, 1, 1, 1, 1,
0.01428772, 1.646239, 0.1465168, 1, 1, 1, 1, 1,
0.01943237, -0.2979748, 1.757083, 1, 1, 1, 1, 1,
0.02284492, -0.8633927, 2.792676, 1, 1, 1, 1, 1,
0.024691, -2.464842, 2.363621, 1, 1, 1, 1, 1,
0.02516248, -0.703566, 3.965581, 1, 1, 1, 1, 1,
0.02616917, -1.8571, 2.500305, 1, 1, 1, 1, 1,
0.02791597, -1.155482, 3.803545, 1, 1, 1, 1, 1,
0.0323748, -0.6670817, 1.943101, 0, 0, 1, 1, 1,
0.03603213, -0.3378943, 1.911253, 1, 0, 0, 1, 1,
0.04249004, -3.048375, 3.334203, 1, 0, 0, 1, 1,
0.04270804, -1.726144, 2.280373, 1, 0, 0, 1, 1,
0.0429203, -0.2868071, 4.018396, 1, 0, 0, 1, 1,
0.04364619, 0.02870698, 1.62578, 1, 0, 0, 1, 1,
0.04794487, 1.875816, 0.7018818, 0, 0, 0, 1, 1,
0.0501888, 0.5146965, 0.8124023, 0, 0, 0, 1, 1,
0.05725964, -0.1435208, -0.1408927, 0, 0, 0, 1, 1,
0.06011634, 0.1936107, 0.6229018, 0, 0, 0, 1, 1,
0.06218091, 2.007251, -1.483477, 0, 0, 0, 1, 1,
0.06364704, 1.558245, 0.4701475, 0, 0, 0, 1, 1,
0.06817246, -1.304641, 3.132794, 0, 0, 0, 1, 1,
0.07258837, -0.3394943, 4.630144, 1, 1, 1, 1, 1,
0.07579727, -0.76881, 2.745025, 1, 1, 1, 1, 1,
0.07617675, 0.1840963, -2.145096, 1, 1, 1, 1, 1,
0.07662883, -0.6073343, 2.807491, 1, 1, 1, 1, 1,
0.07794549, 0.02201092, -0.3600795, 1, 1, 1, 1, 1,
0.08000977, 1.052721, 0.3262231, 1, 1, 1, 1, 1,
0.08169893, 0.2632532, 0.1018124, 1, 1, 1, 1, 1,
0.08710524, 0.425221, 1.596908, 1, 1, 1, 1, 1,
0.0874302, -0.06825449, 2.497205, 1, 1, 1, 1, 1,
0.08837697, 0.5548609, -0.7269022, 1, 1, 1, 1, 1,
0.09018886, 1.611824, 3.040966, 1, 1, 1, 1, 1,
0.09587429, 0.05173261, 0.676661, 1, 1, 1, 1, 1,
0.09715449, -2.264601, 2.69246, 1, 1, 1, 1, 1,
0.1000645, 0.04215857, 2.124923, 1, 1, 1, 1, 1,
0.1023802, 0.6305622, -0.6526141, 1, 1, 1, 1, 1,
0.1023853, -0.1427725, 1.116858, 0, 0, 1, 1, 1,
0.1028258, 1.654299, -0.2984448, 1, 0, 0, 1, 1,
0.1034869, -0.8402748, 3.326771, 1, 0, 0, 1, 1,
0.1086704, 1.658046, -0.7588018, 1, 0, 0, 1, 1,
0.1175478, -0.05240261, 0.7515078, 1, 0, 0, 1, 1,
0.1188781, 1.140478, -0.9356338, 1, 0, 0, 1, 1,
0.1200636, -0.1301759, 0.7390236, 0, 0, 0, 1, 1,
0.120967, 1.01959, -1.361999, 0, 0, 0, 1, 1,
0.1215624, -1.225628, 1.888397, 0, 0, 0, 1, 1,
0.1275349, 0.7182499, 0.07086942, 0, 0, 0, 1, 1,
0.1308924, -0.8987051, 2.481421, 0, 0, 0, 1, 1,
0.1348521, -0.06641936, 3.015451, 0, 0, 0, 1, 1,
0.1353013, -1.976975, 4.563764, 0, 0, 0, 1, 1,
0.1381471, -1.054547, 2.293513, 1, 1, 1, 1, 1,
0.1416141, -0.1440126, 0.4372088, 1, 1, 1, 1, 1,
0.1475284, 0.1292819, 0.925402, 1, 1, 1, 1, 1,
0.1485593, 0.6705664, -0.5468704, 1, 1, 1, 1, 1,
0.1491395, -0.4225927, 2.974162, 1, 1, 1, 1, 1,
0.1512621, 0.4869842, -1.295421, 1, 1, 1, 1, 1,
0.1532746, -1.084547, 0.9512245, 1, 1, 1, 1, 1,
0.1559923, 1.33017, 0.2602674, 1, 1, 1, 1, 1,
0.1585736, -0.9018401, 4.301523, 1, 1, 1, 1, 1,
0.1587678, 0.06757434, 1.649752, 1, 1, 1, 1, 1,
0.1590701, 0.274227, 2.018109, 1, 1, 1, 1, 1,
0.1592514, 0.7293676, 0.7255467, 1, 1, 1, 1, 1,
0.1646869, 0.507261, 1.422976, 1, 1, 1, 1, 1,
0.1696322, -0.9328862, 5.054821, 1, 1, 1, 1, 1,
0.1723686, 1.692633, -0.6032694, 1, 1, 1, 1, 1,
0.1742577, 0.5109984, -0.2076168, 0, 0, 1, 1, 1,
0.1778621, 2.097588, -1.561554, 1, 0, 0, 1, 1,
0.1794288, 1.413573, -0.3997596, 1, 0, 0, 1, 1,
0.1812258, 0.5534397, -0.1690951, 1, 0, 0, 1, 1,
0.1823851, 0.2383676, -0.4125734, 1, 0, 0, 1, 1,
0.185416, 0.8126764, -0.1760816, 1, 0, 0, 1, 1,
0.1937951, -1.851918, 4.412365, 0, 0, 0, 1, 1,
0.1943957, 1.931936, -1.902332, 0, 0, 0, 1, 1,
0.1951151, 0.09671641, -0.7543546, 0, 0, 0, 1, 1,
0.200051, -0.3372844, 2.77207, 0, 0, 0, 1, 1,
0.2032196, 0.7165447, 0.01000484, 0, 0, 0, 1, 1,
0.2032235, 1.289461, -0.4578803, 0, 0, 0, 1, 1,
0.209513, -1.738231, 2.001447, 0, 0, 0, 1, 1,
0.2150721, -1.517022, 2.891485, 1, 1, 1, 1, 1,
0.2168992, -1.679744, 3.666754, 1, 1, 1, 1, 1,
0.2182457, -0.6136665, 3.492169, 1, 1, 1, 1, 1,
0.224628, -1.078254, 2.60289, 1, 1, 1, 1, 1,
0.2254811, -0.4143769, 2.890536, 1, 1, 1, 1, 1,
0.226802, -0.3214355, 2.867626, 1, 1, 1, 1, 1,
0.2277113, 1.714485, 1.7059, 1, 1, 1, 1, 1,
0.2290583, -0.164329, 2.050897, 1, 1, 1, 1, 1,
0.230283, -0.8335766, 3.015169, 1, 1, 1, 1, 1,
0.2323594, -0.5199078, 1.735778, 1, 1, 1, 1, 1,
0.2324923, 0.5027066, -0.5785025, 1, 1, 1, 1, 1,
0.2351601, -1.36442, 2.500827, 1, 1, 1, 1, 1,
0.2380548, -0.9263188, 1.049673, 1, 1, 1, 1, 1,
0.2450339, 0.5175404, 1.179446, 1, 1, 1, 1, 1,
0.2450441, 0.132582, 0.4639176, 1, 1, 1, 1, 1,
0.2474884, 0.7143959, 0.5298648, 0, 0, 1, 1, 1,
0.2508232, -0.7645553, 1.497868, 1, 0, 0, 1, 1,
0.2521278, -0.8572263, 2.101574, 1, 0, 0, 1, 1,
0.2553751, 0.3358961, 0.8007654, 1, 0, 0, 1, 1,
0.2600634, -0.2991889, 3.534741, 1, 0, 0, 1, 1,
0.2602098, 0.2432225, 0.04329167, 1, 0, 0, 1, 1,
0.2618611, -1.192872, 2.823537, 0, 0, 0, 1, 1,
0.2665139, -1.458028, 3.988923, 0, 0, 0, 1, 1,
0.2712153, -2.239757, 3.529414, 0, 0, 0, 1, 1,
0.2721734, -1.904219, 1.959012, 0, 0, 0, 1, 1,
0.2743366, 1.747821, -0.4265516, 0, 0, 0, 1, 1,
0.2746863, 0.6311368, 1.351094, 0, 0, 0, 1, 1,
0.2772099, 0.3180315, 0.05122997, 0, 0, 0, 1, 1,
0.2892026, -0.5820949, 1.393605, 1, 1, 1, 1, 1,
0.2901236, -0.5804615, 1.873232, 1, 1, 1, 1, 1,
0.2906456, 1.935341, 1.192278, 1, 1, 1, 1, 1,
0.2920299, 0.1007127, 0.02665572, 1, 1, 1, 1, 1,
0.2957577, 0.7528539, 1.48887, 1, 1, 1, 1, 1,
0.2971688, -1.453607, 3.111237, 1, 1, 1, 1, 1,
0.2979486, -0.1333322, 1.534677, 1, 1, 1, 1, 1,
0.3013235, 1.825825, -0.4224551, 1, 1, 1, 1, 1,
0.3015352, 0.2623476, 0.3608622, 1, 1, 1, 1, 1,
0.3032708, -1.720829, 3.540865, 1, 1, 1, 1, 1,
0.3045714, 0.1612722, 0.4883687, 1, 1, 1, 1, 1,
0.3057807, -1.999408, 2.687078, 1, 1, 1, 1, 1,
0.3074279, -0.6246057, 2.567309, 1, 1, 1, 1, 1,
0.3094774, -1.041086, 2.361699, 1, 1, 1, 1, 1,
0.3180607, 1.838525, -0.5129815, 1, 1, 1, 1, 1,
0.3197182, 1.073494, 0.2802405, 0, 0, 1, 1, 1,
0.321942, 0.4182203, 1.915427, 1, 0, 0, 1, 1,
0.32246, 0.2756846, 0.5501805, 1, 0, 0, 1, 1,
0.3242355, -0.5486045, 2.678549, 1, 0, 0, 1, 1,
0.3252619, 1.968245, 0.1848049, 1, 0, 0, 1, 1,
0.3270966, -0.0007791872, 1.992996, 1, 0, 0, 1, 1,
0.3335883, -0.478581, 3.202177, 0, 0, 0, 1, 1,
0.3357482, 0.3900301, 0.8741704, 0, 0, 0, 1, 1,
0.3358085, -0.9216557, 4.131126, 0, 0, 0, 1, 1,
0.3361663, 1.750859, -1.346987, 0, 0, 0, 1, 1,
0.3374236, -0.9440855, 3.057474, 0, 0, 0, 1, 1,
0.3378739, 0.03759321, 0.8070412, 0, 0, 0, 1, 1,
0.3382334, -1.039924, 2.687613, 0, 0, 0, 1, 1,
0.3399197, -0.2520135, 1.391315, 1, 1, 1, 1, 1,
0.3418002, 2.465972, -0.3463514, 1, 1, 1, 1, 1,
0.341934, -0.9851153, 2.818974, 1, 1, 1, 1, 1,
0.3430241, 0.13107, 2.419126, 1, 1, 1, 1, 1,
0.3439515, -0.9014091, 3.878411, 1, 1, 1, 1, 1,
0.3504128, -0.6751649, 4.105777, 1, 1, 1, 1, 1,
0.3517187, -0.1577823, 2.855371, 1, 1, 1, 1, 1,
0.3541444, 1.472377, -0.2833748, 1, 1, 1, 1, 1,
0.3624105, 0.3747333, 1.279505, 1, 1, 1, 1, 1,
0.362624, 0.7555718, -0.1464264, 1, 1, 1, 1, 1,
0.3627294, 0.3825976, 2.632356, 1, 1, 1, 1, 1,
0.3645002, -0.1557041, 2.775926, 1, 1, 1, 1, 1,
0.3681086, -1.263111, 3.913482, 1, 1, 1, 1, 1,
0.3730634, 1.300599, 2.346234, 1, 1, 1, 1, 1,
0.3733398, 0.3597097, 0.6915435, 1, 1, 1, 1, 1,
0.3741764, -0.6123134, 1.665422, 0, 0, 1, 1, 1,
0.374344, -1.256044, 1.687328, 1, 0, 0, 1, 1,
0.3756541, -0.296746, 1.448866, 1, 0, 0, 1, 1,
0.3770026, 1.217657, 0.08354486, 1, 0, 0, 1, 1,
0.3836766, -0.6173217, 2.639696, 1, 0, 0, 1, 1,
0.3858484, 0.02849563, 2.037991, 1, 0, 0, 1, 1,
0.3870966, -0.6110736, 2.777817, 0, 0, 0, 1, 1,
0.3876392, -0.04283975, 1.486756, 0, 0, 0, 1, 1,
0.3897103, -0.08784723, 0.8711277, 0, 0, 0, 1, 1,
0.3902074, -0.3201614, 1.527425, 0, 0, 0, 1, 1,
0.3931549, -0.8296554, 2.134913, 0, 0, 0, 1, 1,
0.3932485, 0.03390501, 2.774666, 0, 0, 0, 1, 1,
0.3951427, 0.4544292, 0.9575987, 0, 0, 0, 1, 1,
0.3967755, 1.325843, 0.342531, 1, 1, 1, 1, 1,
0.3995019, 0.3702134, 1.088271, 1, 1, 1, 1, 1,
0.4075505, 0.9003042, 1.556981, 1, 1, 1, 1, 1,
0.4084682, 0.2131148, 1.956465, 1, 1, 1, 1, 1,
0.4144617, 1.350959, -0.8863909, 1, 1, 1, 1, 1,
0.4158222, 0.6667184, -0.7026497, 1, 1, 1, 1, 1,
0.4167068, -1.543366, 3.398484, 1, 1, 1, 1, 1,
0.4169357, -0.8660282, 2.459247, 1, 1, 1, 1, 1,
0.4219236, 1.082282, 0.9070621, 1, 1, 1, 1, 1,
0.4290387, -0.1955119, 2.462687, 1, 1, 1, 1, 1,
0.4294389, -0.1389133, 1.41142, 1, 1, 1, 1, 1,
0.4307007, 1.321209, 1.535842, 1, 1, 1, 1, 1,
0.4341064, -0.2052216, 2.841463, 1, 1, 1, 1, 1,
0.4347785, 2.734939, 1.29549, 1, 1, 1, 1, 1,
0.4349328, 0.3279931, 0.7278442, 1, 1, 1, 1, 1,
0.436507, 1.37696, 1.559371, 0, 0, 1, 1, 1,
0.4386541, -1.984503, 2.538508, 1, 0, 0, 1, 1,
0.444858, -0.1323554, 2.084891, 1, 0, 0, 1, 1,
0.4461167, 1.036439, -0.1422844, 1, 0, 0, 1, 1,
0.4468083, 0.4089507, 1.304229, 1, 0, 0, 1, 1,
0.4517309, 0.5281631, 0.06220448, 1, 0, 0, 1, 1,
0.4534092, -1.304203, 3.265508, 0, 0, 0, 1, 1,
0.4541383, 0.7278882, 1.088896, 0, 0, 0, 1, 1,
0.4556624, 0.4463232, -0.3870127, 0, 0, 0, 1, 1,
0.4598161, -0.5004597, 3.776103, 0, 0, 0, 1, 1,
0.4675853, 0.5656441, 1.929995, 0, 0, 0, 1, 1,
0.4678785, 1.498794, 0.4815336, 0, 0, 0, 1, 1,
0.4681118, -0.03462204, 3.21974, 0, 0, 0, 1, 1,
0.4691614, 1.06976, 0.7245549, 1, 1, 1, 1, 1,
0.4727709, 0.1805591, 2.442213, 1, 1, 1, 1, 1,
0.4743608, 1.062372, 0.1611353, 1, 1, 1, 1, 1,
0.4797068, -0.8836145, 1.868163, 1, 1, 1, 1, 1,
0.4836379, 0.7574889, -0.6244423, 1, 1, 1, 1, 1,
0.4870587, 0.02935158, 0.7552298, 1, 1, 1, 1, 1,
0.4890201, -1.530865, 2.418435, 1, 1, 1, 1, 1,
0.4925676, -0.8354992, 2.286598, 1, 1, 1, 1, 1,
0.4959823, -0.5839659, 2.746803, 1, 1, 1, 1, 1,
0.4961184, 0.9824846, 1.013449, 1, 1, 1, 1, 1,
0.5005961, 0.1819234, 2.36552, 1, 1, 1, 1, 1,
0.5023322, -1.662273, 2.363497, 1, 1, 1, 1, 1,
0.5046399, 0.5094778, 1.937066, 1, 1, 1, 1, 1,
0.5051399, -1.482428, 2.790761, 1, 1, 1, 1, 1,
0.5099725, -0.862903, 3.032604, 1, 1, 1, 1, 1,
0.5123128, 0.8724228, 1.27936, 0, 0, 1, 1, 1,
0.5146637, 2.196469, -0.6353928, 1, 0, 0, 1, 1,
0.5160572, 0.05592475, 1.803431, 1, 0, 0, 1, 1,
0.5173906, -1.293564, 1.631368, 1, 0, 0, 1, 1,
0.518823, 0.1946119, 0.5972338, 1, 0, 0, 1, 1,
0.5206265, 0.9879953, -0.03843478, 1, 0, 0, 1, 1,
0.5213228, 1.422383, 2.132588, 0, 0, 0, 1, 1,
0.5355476, 0.8387994, 2.443275, 0, 0, 0, 1, 1,
0.5373511, -0.4621098, 3.085235, 0, 0, 0, 1, 1,
0.5392877, -0.5479019, 3.776104, 0, 0, 0, 1, 1,
0.5403021, 1.514096, -0.8318466, 0, 0, 0, 1, 1,
0.5444019, 1.309342, -0.1418123, 0, 0, 0, 1, 1,
0.5474885, -0.369956, 3.167389, 0, 0, 0, 1, 1,
0.5508015, 0.5970278, 0.3875325, 1, 1, 1, 1, 1,
0.5522402, 1.265442, -0.3745264, 1, 1, 1, 1, 1,
0.5636289, 1.425907, 0.1474297, 1, 1, 1, 1, 1,
0.564129, 2.008795, -0.3031496, 1, 1, 1, 1, 1,
0.5678506, 2.366, 1.495521, 1, 1, 1, 1, 1,
0.5694708, 0.991531, 0.08435637, 1, 1, 1, 1, 1,
0.5697567, -2.697595, 2.471846, 1, 1, 1, 1, 1,
0.57574, 0.2536265, 0.3954747, 1, 1, 1, 1, 1,
0.5757563, 0.538899, 1.291159, 1, 1, 1, 1, 1,
0.5774045, 0.2150286, 0.9861203, 1, 1, 1, 1, 1,
0.5776634, -1.61507, 3.612705, 1, 1, 1, 1, 1,
0.5778905, 0.1157849, 2.112138, 1, 1, 1, 1, 1,
0.5780764, 0.1677611, 0.9015817, 1, 1, 1, 1, 1,
0.5801405, 1.26544, -0.5796904, 1, 1, 1, 1, 1,
0.5833675, -0.3819244, 3.606209, 1, 1, 1, 1, 1,
0.597772, -0.1856939, 2.662017, 0, 0, 1, 1, 1,
0.6081643, 0.6176693, -0.03117516, 1, 0, 0, 1, 1,
0.6088234, -0.3855531, 1.954735, 1, 0, 0, 1, 1,
0.6099705, -0.7620171, 2.19748, 1, 0, 0, 1, 1,
0.6190466, -0.8437333, 3.68508, 1, 0, 0, 1, 1,
0.6202796, -0.5006859, 3.944194, 1, 0, 0, 1, 1,
0.627744, 0.5729098, 0.6608695, 0, 0, 0, 1, 1,
0.6293702, 1.999805, -0.3816483, 0, 0, 0, 1, 1,
0.6299666, 0.000129305, 2.139446, 0, 0, 0, 1, 1,
0.6352438, 0.8358209, 0.7739874, 0, 0, 0, 1, 1,
0.6381857, -0.5374632, 2.201454, 0, 0, 0, 1, 1,
0.6384001, 2.148527, 0.5263137, 0, 0, 0, 1, 1,
0.6397592, 0.5279821, -0.5284797, 0, 0, 0, 1, 1,
0.6432288, -1.556077, 2.819909, 1, 1, 1, 1, 1,
0.6456044, 0.1123924, 0.1054445, 1, 1, 1, 1, 1,
0.6525062, -0.02960505, 2.54469, 1, 1, 1, 1, 1,
0.6568742, -0.4712531, 3.102181, 1, 1, 1, 1, 1,
0.6595089, -0.1347754, 4.020008, 1, 1, 1, 1, 1,
0.6601796, -0.2701401, -0.121657, 1, 1, 1, 1, 1,
0.6711449, -1.060687, 1.695461, 1, 1, 1, 1, 1,
0.6806873, 1.287133, 0.6850083, 1, 1, 1, 1, 1,
0.6835489, 0.521856, 0.7518026, 1, 1, 1, 1, 1,
0.689169, 1.307638, -0.4319451, 1, 1, 1, 1, 1,
0.6893849, -0.5071191, 1.444016, 1, 1, 1, 1, 1,
0.6938087, -0.1931453, 1.748636, 1, 1, 1, 1, 1,
0.7003776, -0.7180894, 1.173108, 1, 1, 1, 1, 1,
0.7048373, -0.4146383, 1.937909, 1, 1, 1, 1, 1,
0.7050367, -0.108156, 0.8485519, 1, 1, 1, 1, 1,
0.7065655, -0.1963141, 2.001821, 0, 0, 1, 1, 1,
0.7102255, -0.05230513, 0.3909211, 1, 0, 0, 1, 1,
0.7136999, -0.2415681, 2.936803, 1, 0, 0, 1, 1,
0.7141895, 0.5591896, 3.221645, 1, 0, 0, 1, 1,
0.7225829, -0.07825997, 1.372172, 1, 0, 0, 1, 1,
0.7232122, 0.419299, 2.031107, 1, 0, 0, 1, 1,
0.7332746, 0.2001901, 2.832145, 0, 0, 0, 1, 1,
0.7341378, -0.9248033, 2.721991, 0, 0, 0, 1, 1,
0.7350281, -0.8328927, 1.114782, 0, 0, 0, 1, 1,
0.73836, 0.9204333, 0.03700979, 0, 0, 0, 1, 1,
0.7425132, 0.3618127, 1.079219, 0, 0, 0, 1, 1,
0.7430905, -0.8890644, 3.150672, 0, 0, 0, 1, 1,
0.7448139, -0.9289442, 1.502859, 0, 0, 0, 1, 1,
0.7456653, -0.6212289, 2.293674, 1, 1, 1, 1, 1,
0.7463032, -0.3518334, 3.042236, 1, 1, 1, 1, 1,
0.7602677, -0.6066866, 2.2401, 1, 1, 1, 1, 1,
0.7627841, 0.8280419, 0.02369364, 1, 1, 1, 1, 1,
0.763247, -0.8692918, 3.789864, 1, 1, 1, 1, 1,
0.7648386, -0.4184926, 3.161434, 1, 1, 1, 1, 1,
0.7707751, -0.9021028, 1.143546, 1, 1, 1, 1, 1,
0.7730569, -0.9493208, 2.562532, 1, 1, 1, 1, 1,
0.7741364, 1.411544, -0.2144847, 1, 1, 1, 1, 1,
0.7741763, 0.8474235, 0.5733179, 1, 1, 1, 1, 1,
0.7774062, 1.655493, 0.361162, 1, 1, 1, 1, 1,
0.7789832, 0.6362793, 1.791823, 1, 1, 1, 1, 1,
0.7873922, -0.2519674, 0.2609087, 1, 1, 1, 1, 1,
0.8069911, 0.7790236, 0.9975564, 1, 1, 1, 1, 1,
0.8135947, -0.05877988, 0.8641884, 1, 1, 1, 1, 1,
0.8163239, 0.08250196, 1.560134, 0, 0, 1, 1, 1,
0.8165404, -0.4519606, 1.70587, 1, 0, 0, 1, 1,
0.8193001, -0.5117762, 2.178417, 1, 0, 0, 1, 1,
0.8207921, 1.074944, 0.0175848, 1, 0, 0, 1, 1,
0.8211381, -2.177057, 3.1264, 1, 0, 0, 1, 1,
0.8255652, -0.01446938, 2.919485, 1, 0, 0, 1, 1,
0.8306935, -0.2859403, 1.106794, 0, 0, 0, 1, 1,
0.830869, 0.3458347, -0.5533971, 0, 0, 0, 1, 1,
0.8322845, 0.7410085, 1.610179, 0, 0, 0, 1, 1,
0.8326741, 0.01211542, 1.817485, 0, 0, 0, 1, 1,
0.8389611, -0.2789011, 2.739511, 0, 0, 0, 1, 1,
0.8460471, 1.513756, 0.2508894, 0, 0, 0, 1, 1,
0.8534678, 2.001453, 0.3068736, 0, 0, 0, 1, 1,
0.8544611, -0.5390076, 3.634362, 1, 1, 1, 1, 1,
0.8595284, 0.4884031, -0.2950071, 1, 1, 1, 1, 1,
0.8700101, 0.7407644, -0.2701905, 1, 1, 1, 1, 1,
0.8746782, 0.5459227, -0.0451717, 1, 1, 1, 1, 1,
0.8763903, 0.6582256, -0.3802837, 1, 1, 1, 1, 1,
0.8856735, -0.03934313, 1.686514, 1, 1, 1, 1, 1,
0.8918943, -1.791526, 3.089135, 1, 1, 1, 1, 1,
0.8927264, -1.238791, 1.785056, 1, 1, 1, 1, 1,
0.8941126, 0.7733288, 0.5343352, 1, 1, 1, 1, 1,
0.9006135, 0.8588809, 1.914746, 1, 1, 1, 1, 1,
0.9048112, -0.06762651, 0.9740025, 1, 1, 1, 1, 1,
0.9137127, 0.4695587, 0.005040384, 1, 1, 1, 1, 1,
0.9145184, 0.2721587, 2.303309, 1, 1, 1, 1, 1,
0.9202195, 0.04521747, 0.9135883, 1, 1, 1, 1, 1,
0.9220341, 0.2634149, 0.568301, 1, 1, 1, 1, 1,
0.927123, -1.465561, 1.959869, 0, 0, 1, 1, 1,
0.9289225, 0.3603308, 0.796052, 1, 0, 0, 1, 1,
0.9324589, 0.2557505, 0.1351143, 1, 0, 0, 1, 1,
0.9344159, -0.2357667, 0.1625733, 1, 0, 0, 1, 1,
0.9376088, 0.2011798, 1.798159, 1, 0, 0, 1, 1,
0.9455474, 0.1185243, 1.60358, 1, 0, 0, 1, 1,
0.9523357, 2.000799, -1.397118, 0, 0, 0, 1, 1,
0.9561222, 1.480814, 0.2520856, 0, 0, 0, 1, 1,
0.9596018, -2.126684, 3.905096, 0, 0, 0, 1, 1,
0.9605884, 1.768707, 0.5816917, 0, 0, 0, 1, 1,
0.9621596, -0.3607394, 1.265438, 0, 0, 0, 1, 1,
0.962754, 0.6992453, 2.535185, 0, 0, 0, 1, 1,
0.9633839, -0.531772, 2.449706, 0, 0, 0, 1, 1,
0.9673791, -2.391329, 3.355899, 1, 1, 1, 1, 1,
0.9749325, -0.2880978, 2.785529, 1, 1, 1, 1, 1,
0.9754995, -1.229594, 3.747987, 1, 1, 1, 1, 1,
0.9814161, -0.9123954, -0.3172968, 1, 1, 1, 1, 1,
0.991414, -1.452086, 2.684398, 1, 1, 1, 1, 1,
0.9985167, 1.229516, 0.5800201, 1, 1, 1, 1, 1,
1.014154, 0.990914, 0.1147449, 1, 1, 1, 1, 1,
1.015214, -0.184485, 2.575448, 1, 1, 1, 1, 1,
1.017814, -0.4089698, 2.113212, 1, 1, 1, 1, 1,
1.023929, 0.04004915, 1.655741, 1, 1, 1, 1, 1,
1.027042, -0.001207217, 1.910293, 1, 1, 1, 1, 1,
1.037629, -0.4581122, 1.361554, 1, 1, 1, 1, 1,
1.038962, -1.562238, 1.637999, 1, 1, 1, 1, 1,
1.044219, -2.035899, 2.008545, 1, 1, 1, 1, 1,
1.046227, 1.464813, 2.033459, 1, 1, 1, 1, 1,
1.050186, 1.168538, -0.1303548, 0, 0, 1, 1, 1,
1.055536, -0.2467752, 2.255709, 1, 0, 0, 1, 1,
1.058395, 0.5444705, 2.662253, 1, 0, 0, 1, 1,
1.066779, -0.1819899, 2.356956, 1, 0, 0, 1, 1,
1.070547, -0.6644962, -0.09738687, 1, 0, 0, 1, 1,
1.073832, 2.614625, 0.7024884, 1, 0, 0, 1, 1,
1.080152, -1.114364, 3.618022, 0, 0, 0, 1, 1,
1.090415, -0.5734033, 2.336362, 0, 0, 0, 1, 1,
1.097378, -0.7082523, 1.885908, 0, 0, 0, 1, 1,
1.098358, 0.9680246, -1.614246, 0, 0, 0, 1, 1,
1.100848, -0.4651207, 0.9108657, 0, 0, 0, 1, 1,
1.10578, 0.4995497, 0.03088228, 0, 0, 0, 1, 1,
1.110884, -0.8172853, 4.281041, 0, 0, 0, 1, 1,
1.116709, -1.476252, 2.382783, 1, 1, 1, 1, 1,
1.117261, 1.795231, 0.2311565, 1, 1, 1, 1, 1,
1.123359, -2.612056, 4.162431, 1, 1, 1, 1, 1,
1.12813, 0.300045, 0.4470739, 1, 1, 1, 1, 1,
1.129288, -0.3932521, 2.312454, 1, 1, 1, 1, 1,
1.141697, 0.4277905, 1.508858, 1, 1, 1, 1, 1,
1.144667, 0.655565, 2.367408, 1, 1, 1, 1, 1,
1.151741, -0.629169, 3.156198, 1, 1, 1, 1, 1,
1.164517, -2.159826, 1.96457, 1, 1, 1, 1, 1,
1.180925, 0.0205811, 1.207022, 1, 1, 1, 1, 1,
1.184964, -0.5958357, 1.983539, 1, 1, 1, 1, 1,
1.187479, 0.8361735, 0.8389837, 1, 1, 1, 1, 1,
1.188132, 1.58698, 0.831357, 1, 1, 1, 1, 1,
1.212611, 0.0279873, -0.2629612, 1, 1, 1, 1, 1,
1.214515, 0.514107, 0.6475018, 1, 1, 1, 1, 1,
1.219583, -1.460112, 3.93028, 0, 0, 1, 1, 1,
1.226792, -0.03142126, 2.759789, 1, 0, 0, 1, 1,
1.232113, -0.09790514, 2.393635, 1, 0, 0, 1, 1,
1.247356, 0.6278212, 0.3221053, 1, 0, 0, 1, 1,
1.261121, 0.5368496, 1.441562, 1, 0, 0, 1, 1,
1.261232, -0.376556, 2.564624, 1, 0, 0, 1, 1,
1.268857, -2.147444, 3.823573, 0, 0, 0, 1, 1,
1.269858, -0.5880944, 2.394763, 0, 0, 0, 1, 1,
1.276058, -0.1223453, 1.352902, 0, 0, 0, 1, 1,
1.279949, -0.9204562, -0.6586989, 0, 0, 0, 1, 1,
1.280523, 0.9326164, 0.2787684, 0, 0, 0, 1, 1,
1.281726, -0.7373514, 1.656726, 0, 0, 0, 1, 1,
1.290179, 0.09564054, 1.455132, 0, 0, 0, 1, 1,
1.292852, 0.8620499, 0.6704304, 1, 1, 1, 1, 1,
1.301869, -0.8436546, 1.706074, 1, 1, 1, 1, 1,
1.315248, -0.8880489, 2.935053, 1, 1, 1, 1, 1,
1.319155, 0.5257338, 2.162469, 1, 1, 1, 1, 1,
1.320646, -1.296124, 1.602116, 1, 1, 1, 1, 1,
1.329954, 0.4265459, 2.178384, 1, 1, 1, 1, 1,
1.333363, -1.105686, 2.116959, 1, 1, 1, 1, 1,
1.333466, -0.5533861, 3.451924, 1, 1, 1, 1, 1,
1.349825, -0.1410087, 1.739796, 1, 1, 1, 1, 1,
1.363535, 0.03672465, 0.9703166, 1, 1, 1, 1, 1,
1.364683, 0.1282964, 0.2917259, 1, 1, 1, 1, 1,
1.366702, 0.2351487, 1.537288, 1, 1, 1, 1, 1,
1.367794, 0.3659914, 0.9942629, 1, 1, 1, 1, 1,
1.375459, -0.4532546, 3.303891, 1, 1, 1, 1, 1,
1.376789, 0.00981202, 1.550059, 1, 1, 1, 1, 1,
1.377268, -0.7372261, 2.386891, 0, 0, 1, 1, 1,
1.3813, 0.5560773, 1.010731, 1, 0, 0, 1, 1,
1.383241, 0.08457602, 1.644311, 1, 0, 0, 1, 1,
1.385685, 0.8512272, -0.6018136, 1, 0, 0, 1, 1,
1.388357, 0.6891829, 1.728341, 1, 0, 0, 1, 1,
1.391621, 0.5974676, 0.8297083, 1, 0, 0, 1, 1,
1.393655, -0.3090732, 1.479716, 0, 0, 0, 1, 1,
1.397192, -0.3243483, 1.122012, 0, 0, 0, 1, 1,
1.406631, -0.5132949, 2.559229, 0, 0, 0, 1, 1,
1.412497, 0.2036783, 1.333129, 0, 0, 0, 1, 1,
1.416571, 0.8552612, 0.7195057, 0, 0, 0, 1, 1,
1.416927, -1.336525, 0.9159505, 0, 0, 0, 1, 1,
1.41853, 0.5169996, -0.3911849, 0, 0, 0, 1, 1,
1.421857, 0.8664246, 3.076247, 1, 1, 1, 1, 1,
1.437865, -0.9158639, 2.783898, 1, 1, 1, 1, 1,
1.44322, 2.070287, 2.984738, 1, 1, 1, 1, 1,
1.453997, 0.3739343, 2.318624, 1, 1, 1, 1, 1,
1.468879, -0.4610988, 0.6317823, 1, 1, 1, 1, 1,
1.473544, 0.6885793, 0.8045331, 1, 1, 1, 1, 1,
1.477574, -0.8532913, 1.883852, 1, 1, 1, 1, 1,
1.488719, -0.6720452, 1.873062, 1, 1, 1, 1, 1,
1.501519, 0.02859136, 2.005837, 1, 1, 1, 1, 1,
1.501901, 0.3761508, 0.4264979, 1, 1, 1, 1, 1,
1.507921, 0.7781593, 1.177751, 1, 1, 1, 1, 1,
1.508495, -0.03863103, 2.192291, 1, 1, 1, 1, 1,
1.510951, 0.5622873, 0.01443857, 1, 1, 1, 1, 1,
1.529073, -0.2137025, 0.6091939, 1, 1, 1, 1, 1,
1.536484, 0.2818175, 0.547713, 1, 1, 1, 1, 1,
1.556186, 0.3630271, 0.7515129, 0, 0, 1, 1, 1,
1.562426, 0.9036501, 1.012855, 1, 0, 0, 1, 1,
1.563092, 2.329126, 0.5468774, 1, 0, 0, 1, 1,
1.567774, 0.5515314, 1.771867, 1, 0, 0, 1, 1,
1.576422, -0.4074115, 1.070521, 1, 0, 0, 1, 1,
1.577561, -1.166423, 2.911652, 1, 0, 0, 1, 1,
1.579966, 0.9320214, 2.875375, 0, 0, 0, 1, 1,
1.590982, 0.4315561, 1.838126, 0, 0, 0, 1, 1,
1.595809, 0.1335171, 3.094704, 0, 0, 0, 1, 1,
1.60117, -1.894285, 2.485875, 0, 0, 0, 1, 1,
1.604892, -0.4841129, -0.4511659, 0, 0, 0, 1, 1,
1.608293, -0.8796062, 2.062716, 0, 0, 0, 1, 1,
1.60883, -0.3469113, 1.290609, 0, 0, 0, 1, 1,
1.61273, -0.3962959, 1.418909, 1, 1, 1, 1, 1,
1.615783, 0.1963271, 1.265846, 1, 1, 1, 1, 1,
1.635885, -0.2143204, 2.946601, 1, 1, 1, 1, 1,
1.650358, -1.250856, 1.919895, 1, 1, 1, 1, 1,
1.651053, 1.981047, 1.008573, 1, 1, 1, 1, 1,
1.660628, -2.185929, 1.240193, 1, 1, 1, 1, 1,
1.665025, 1.282609, 0.8007281, 1, 1, 1, 1, 1,
1.673261, 1.554609, -0.2185307, 1, 1, 1, 1, 1,
1.682389, -0.4445257, 1.140241, 1, 1, 1, 1, 1,
1.705266, -1.825542, 2.793231, 1, 1, 1, 1, 1,
1.709342, -0.1188628, 1.475095, 1, 1, 1, 1, 1,
1.725264, -1.880923, 1.912777, 1, 1, 1, 1, 1,
1.725433, 0.1922988, 1.270497, 1, 1, 1, 1, 1,
1.732996, -0.3711103, 2.300805, 1, 1, 1, 1, 1,
1.744564, -1.206037, 2.733887, 1, 1, 1, 1, 1,
1.746026, -0.002951745, 1.252122, 0, 0, 1, 1, 1,
1.758024, -0.6742448, 1.0221, 1, 0, 0, 1, 1,
1.772114, 0.6726443, 1.605366, 1, 0, 0, 1, 1,
1.77297, 0.06986269, 2.220217, 1, 0, 0, 1, 1,
1.776353, -1.142359, 2.940541, 1, 0, 0, 1, 1,
1.776996, -0.4227501, 2.053975, 1, 0, 0, 1, 1,
1.779082, -0.3701964, 3.266568, 0, 0, 0, 1, 1,
1.782171, -1.606252, 1.746386, 0, 0, 0, 1, 1,
1.789932, -0.6389697, 1.211338, 0, 0, 0, 1, 1,
1.791044, -0.5288063, 2.45455, 0, 0, 0, 1, 1,
1.809772, -1.975242, 3.197879, 0, 0, 0, 1, 1,
1.811612, 0.4530572, 3.032221, 0, 0, 0, 1, 1,
1.834371, 0.96279, 0.8796555, 0, 0, 0, 1, 1,
1.847201, 0.2731012, 2.059554, 1, 1, 1, 1, 1,
1.864501, 1.101327, 0.9472697, 1, 1, 1, 1, 1,
1.884478, 0.7234029, 0.7168113, 1, 1, 1, 1, 1,
1.903956, -1.231106, 1.7383, 1, 1, 1, 1, 1,
1.91159, 0.9104413, -0.4766517, 1, 1, 1, 1, 1,
1.932697, -0.7862973, 3.203736, 1, 1, 1, 1, 1,
1.971238, 0.5931956, 1.361107, 1, 1, 1, 1, 1,
1.996339, -1.489743, 6.012759, 1, 1, 1, 1, 1,
2.00562, 0.1437703, 1.182953, 1, 1, 1, 1, 1,
2.013644, 0.01988101, 1.192804, 1, 1, 1, 1, 1,
2.015535, 0.9840284, 0.6495084, 1, 1, 1, 1, 1,
2.017323, -1.438281, 1.271861, 1, 1, 1, 1, 1,
2.031912, -0.956705, 2.836983, 1, 1, 1, 1, 1,
2.045433, 1.058157, 1.788866, 1, 1, 1, 1, 1,
2.112658, 0.3126581, 2.382433, 1, 1, 1, 1, 1,
2.139544, -0.9171144, 1.918932, 0, 0, 1, 1, 1,
2.139749, -3.878576, 2.860296, 1, 0, 0, 1, 1,
2.147494, -0.2018036, 2.04462, 1, 0, 0, 1, 1,
2.149507, -0.7718174, 0.91811, 1, 0, 0, 1, 1,
2.157235, -0.2364025, 1.21452, 1, 0, 0, 1, 1,
2.194883, 2.962803, 0.3940224, 1, 0, 0, 1, 1,
2.201152, -0.8232065, 3.583308, 0, 0, 0, 1, 1,
2.306136, 1.321949, 0.4211922, 0, 0, 0, 1, 1,
2.393587, 1.423414, 1.279038, 0, 0, 0, 1, 1,
2.435942, 0.5632164, 0.5826932, 0, 0, 0, 1, 1,
2.7749, 0.3933116, 2.457229, 0, 0, 0, 1, 1,
2.780097, -0.07705595, 2.89277, 0, 0, 0, 1, 1,
3.056324, -0.8582133, 1.022936, 0, 0, 0, 1, 1,
3.083559, -1.533369, 4.065253, 1, 1, 1, 1, 1,
3.092906, 0.6864591, 0.828074, 1, 1, 1, 1, 1,
3.135878, 0.09382281, 1.063387, 1, 1, 1, 1, 1,
3.172704, 0.9677212, 0.1810447, 1, 1, 1, 1, 1,
3.227698, -0.3456657, 1.240073, 1, 1, 1, 1, 1,
3.230628, -0.6514991, 2.506663, 1, 1, 1, 1, 1,
3.271681, -1.553005, 4.678836, 1, 1, 1, 1, 1
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
var radius = 10.10604;
var distance = 35.49703;
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
mvMatrix.translate( -0.08288932, 0.1450062, -0.3453777 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.49703);
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
