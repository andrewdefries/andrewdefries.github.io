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
-3.4382, -1.427692, -1.862606, 1, 0, 0, 1,
-3.366706, 1.091921, -2.668084, 1, 0.007843138, 0, 1,
-3.351959, 0.4858272, -1.093473, 1, 0.01176471, 0, 1,
-2.930979, -0.3949879, -3.227894, 1, 0.01960784, 0, 1,
-2.828326, 1.513727, -1.962888, 1, 0.02352941, 0, 1,
-2.779376, 0.7997327, -0.1570047, 1, 0.03137255, 0, 1,
-2.544338, -0.683707, -3.045238, 1, 0.03529412, 0, 1,
-2.520254, 0.5484259, -1.424983, 1, 0.04313726, 0, 1,
-2.417815, -0.8939972, -1.910842, 1, 0.04705882, 0, 1,
-2.386389, 1.176996, -0.01525916, 1, 0.05490196, 0, 1,
-2.259, -0.1232108, -2.887395, 1, 0.05882353, 0, 1,
-2.228033, 0.4795447, -2.371262, 1, 0.06666667, 0, 1,
-2.193543, -1.822809, -3.605465, 1, 0.07058824, 0, 1,
-2.189553, 0.9139379, 0.1758109, 1, 0.07843138, 0, 1,
-2.184833, 0.2724445, -0.8424039, 1, 0.08235294, 0, 1,
-2.160647, -1.230932, -2.785953, 1, 0.09019608, 0, 1,
-2.141958, 1.057146, -1.875034, 1, 0.09411765, 0, 1,
-2.110309, -1.045335, -1.644724, 1, 0.1019608, 0, 1,
-2.095556, 0.6644424, -2.169563, 1, 0.1098039, 0, 1,
-2.079401, 0.9213809, -2.195576, 1, 0.1137255, 0, 1,
-2.052026, -0.07768503, -1.777333, 1, 0.1215686, 0, 1,
-1.981703, -0.07103163, -4.040613, 1, 0.1254902, 0, 1,
-1.957059, -1.595644, -3.997413, 1, 0.1333333, 0, 1,
-1.948767, -2.150112, -3.014126, 1, 0.1372549, 0, 1,
-1.944598, 1.020353, -1.726825, 1, 0.145098, 0, 1,
-1.924869, 0.3583197, 1.170071, 1, 0.1490196, 0, 1,
-1.910799, -0.1504247, -3.21331, 1, 0.1568628, 0, 1,
-1.900245, 0.6352698, -1.44156, 1, 0.1607843, 0, 1,
-1.898327, 0.1920587, -1.26786, 1, 0.1686275, 0, 1,
-1.895748, 0.546564, 0.2193759, 1, 0.172549, 0, 1,
-1.885857, 1.672271, -2.161733, 1, 0.1803922, 0, 1,
-1.88499, 1.078743, -1.232291, 1, 0.1843137, 0, 1,
-1.809483, -0.9367931, -1.757093, 1, 0.1921569, 0, 1,
-1.80492, -0.4240333, -2.80902, 1, 0.1960784, 0, 1,
-1.784677, -0.4138492, -3.389811, 1, 0.2039216, 0, 1,
-1.767172, 1.258148, -2.993173, 1, 0.2117647, 0, 1,
-1.745883, -2.540168, -1.703329, 1, 0.2156863, 0, 1,
-1.721421, 1.09066, -0.8157504, 1, 0.2235294, 0, 1,
-1.709048, 0.9900634, -1.465545, 1, 0.227451, 0, 1,
-1.704794, 0.8112342, -3.531152, 1, 0.2352941, 0, 1,
-1.698861, -0.60781, -0.5775742, 1, 0.2392157, 0, 1,
-1.698137, -1.198652, -3.871519, 1, 0.2470588, 0, 1,
-1.695598, -0.6939418, -2.190087, 1, 0.2509804, 0, 1,
-1.67895, 0.08747089, -0.0018208, 1, 0.2588235, 0, 1,
-1.675178, -0.4109716, -1.435159, 1, 0.2627451, 0, 1,
-1.633203, 1.101932, -1.991179, 1, 0.2705882, 0, 1,
-1.601297, 1.683157, -0.5019045, 1, 0.2745098, 0, 1,
-1.588677, 0.485476, -1.147271, 1, 0.282353, 0, 1,
-1.573922, -0.09935746, -0.6319612, 1, 0.2862745, 0, 1,
-1.551027, 0.2635548, -1.011613, 1, 0.2941177, 0, 1,
-1.530526, 0.3271702, -0.5300121, 1, 0.3019608, 0, 1,
-1.52423, 1.201806, -1.503933, 1, 0.3058824, 0, 1,
-1.520012, 1.827765, -0.7267361, 1, 0.3137255, 0, 1,
-1.519196, 0.2207277, -1.139998, 1, 0.3176471, 0, 1,
-1.474054, 1.308425, -1.732841, 1, 0.3254902, 0, 1,
-1.464409, 0.9430594, 0.6124344, 1, 0.3294118, 0, 1,
-1.462052, 1.009953, -2.341717, 1, 0.3372549, 0, 1,
-1.459991, -0.2064978, -2.953861, 1, 0.3411765, 0, 1,
-1.443046, 2.011091, -0.9765203, 1, 0.3490196, 0, 1,
-1.419297, 1.751171, -1.671502, 1, 0.3529412, 0, 1,
-1.418622, 0.8941101, -1.038319, 1, 0.3607843, 0, 1,
-1.412791, 0.05570449, -2.568418, 1, 0.3647059, 0, 1,
-1.407607, 0.7040821, -1.251908, 1, 0.372549, 0, 1,
-1.406642, 2.321519, -0.3602753, 1, 0.3764706, 0, 1,
-1.388691, 0.05419955, 0.2311533, 1, 0.3843137, 0, 1,
-1.384703, -0.4129348, -2.552541, 1, 0.3882353, 0, 1,
-1.376455, -1.716015, -1.885016, 1, 0.3960784, 0, 1,
-1.371925, 0.00912027, -3.331028, 1, 0.4039216, 0, 1,
-1.371528, 1.265422, -0.9815243, 1, 0.4078431, 0, 1,
-1.369858, 1.084381, 0.2081686, 1, 0.4156863, 0, 1,
-1.35913, -1.235409, -3.209513, 1, 0.4196078, 0, 1,
-1.341738, 0.5196649, -1.324381, 1, 0.427451, 0, 1,
-1.332638, 0.3187609, 1.007278, 1, 0.4313726, 0, 1,
-1.330356, 1.364246, -0.4679795, 1, 0.4392157, 0, 1,
-1.323703, -1.245078, -2.820511, 1, 0.4431373, 0, 1,
-1.323426, 1.485007, -0.5233965, 1, 0.4509804, 0, 1,
-1.312914, -0.07456303, -1.334879, 1, 0.454902, 0, 1,
-1.312289, -3.066996, -1.172266, 1, 0.4627451, 0, 1,
-1.30679, 0.2844867, -1.247807, 1, 0.4666667, 0, 1,
-1.296984, 1.070353, 0.4617002, 1, 0.4745098, 0, 1,
-1.271349, -1.321565, -3.501711, 1, 0.4784314, 0, 1,
-1.269025, 1.392971, -0.7808716, 1, 0.4862745, 0, 1,
-1.268472, -0.6215079, -1.347301, 1, 0.4901961, 0, 1,
-1.267038, 0.5194476, -1.27038, 1, 0.4980392, 0, 1,
-1.259164, -0.6941364, -2.982973, 1, 0.5058824, 0, 1,
-1.246067, 0.5089954, -0.2819917, 1, 0.509804, 0, 1,
-1.244517, 0.5377625, -1.276717, 1, 0.5176471, 0, 1,
-1.232085, 0.2464064, -2.751035, 1, 0.5215687, 0, 1,
-1.231084, 0.4441262, -1.185689, 1, 0.5294118, 0, 1,
-1.214672, -0.9911677, -2.275792, 1, 0.5333334, 0, 1,
-1.214135, 0.523175, -1.059386, 1, 0.5411765, 0, 1,
-1.212978, -0.6575253, -2.535376, 1, 0.5450981, 0, 1,
-1.210171, -0.4354607, -3.253635, 1, 0.5529412, 0, 1,
-1.206786, -0.1652607, -0.2976425, 1, 0.5568628, 0, 1,
-1.206737, -0.2164493, -1.341835, 1, 0.5647059, 0, 1,
-1.204235, -0.253038, -3.044653, 1, 0.5686275, 0, 1,
-1.199443, -1.883232, -1.570828, 1, 0.5764706, 0, 1,
-1.195903, -0.6410331, -1.33819, 1, 0.5803922, 0, 1,
-1.195766, 0.4026257, -0.1777723, 1, 0.5882353, 0, 1,
-1.190116, -1.196029, -1.5482, 1, 0.5921569, 0, 1,
-1.178076, -0.2060651, -1.385585, 1, 0.6, 0, 1,
-1.175758, -0.06325915, -1.964681, 1, 0.6078432, 0, 1,
-1.173079, -0.4522707, -3.097208, 1, 0.6117647, 0, 1,
-1.171386, -0.2667761, -4.733867, 1, 0.6196079, 0, 1,
-1.165535, 0.3652225, -0.5610019, 1, 0.6235294, 0, 1,
-1.149402, -1.857013, -2.816176, 1, 0.6313726, 0, 1,
-1.141832, 0.5943998, -0.3399479, 1, 0.6352941, 0, 1,
-1.141729, 0.7835722, -1.148795, 1, 0.6431373, 0, 1,
-1.141511, -0.6058733, -4.632854, 1, 0.6470588, 0, 1,
-1.134359, 0.5272021, -1.460609, 1, 0.654902, 0, 1,
-1.131889, -1.074169, -5.622645, 1, 0.6588235, 0, 1,
-1.131552, -2.470589, -3.944508, 1, 0.6666667, 0, 1,
-1.124308, 0.3363934, -0.9851335, 1, 0.6705883, 0, 1,
-1.117561, 1.390289, -1.048271, 1, 0.6784314, 0, 1,
-1.116999, 1.04645, -0.1125878, 1, 0.682353, 0, 1,
-1.100911, 1.260453, 2.26214, 1, 0.6901961, 0, 1,
-1.100358, -0.2573436, -2.210491, 1, 0.6941177, 0, 1,
-1.094057, -1.186824, -1.790204, 1, 0.7019608, 0, 1,
-1.091776, -0.6609654, -4.308435, 1, 0.7098039, 0, 1,
-1.081219, -1.438621, -3.687808, 1, 0.7137255, 0, 1,
-1.080071, 0.5827994, -0.2406625, 1, 0.7215686, 0, 1,
-1.065725, -1.167784, -0.5262126, 1, 0.7254902, 0, 1,
-1.063807, -0.2313984, -0.8600021, 1, 0.7333333, 0, 1,
-1.063236, -1.2537, -3.671625, 1, 0.7372549, 0, 1,
-1.060637, 0.1741092, -2.77751, 1, 0.7450981, 0, 1,
-1.055207, -1.466029, -1.337945, 1, 0.7490196, 0, 1,
-1.049311, 1.111173, -0.6590549, 1, 0.7568628, 0, 1,
-1.046411, 0.9379004, -0.3609696, 1, 0.7607843, 0, 1,
-1.042521, -0.2124084, -2.934178, 1, 0.7686275, 0, 1,
-1.025152, -1.385499, -2.932263, 1, 0.772549, 0, 1,
-1.020528, -1.275838, -1.162099, 1, 0.7803922, 0, 1,
-1.017412, -0.481855, -1.750144, 1, 0.7843137, 0, 1,
-1.014966, -1.595524, -3.273933, 1, 0.7921569, 0, 1,
-1.011166, -0.5917484, -0.320882, 1, 0.7960784, 0, 1,
-1.008795, 0.8976008, -0.9733737, 1, 0.8039216, 0, 1,
-1.005182, -0.05746002, -1.535296, 1, 0.8117647, 0, 1,
-1.003176, -1.195185, -3.683562, 1, 0.8156863, 0, 1,
-1.002013, 0.1029215, -0.2176768, 1, 0.8235294, 0, 1,
-1.001212, 2.082087, 1.180849, 1, 0.827451, 0, 1,
-0.9913864, 0.1509625, -0.4608709, 1, 0.8352941, 0, 1,
-0.9841906, 0.09634674, -2.019747, 1, 0.8392157, 0, 1,
-0.9772614, 0.8862721, -2.286944, 1, 0.8470588, 0, 1,
-0.9737745, -0.02259368, -0.118385, 1, 0.8509804, 0, 1,
-0.9706383, 1.378168, -1.175015, 1, 0.8588235, 0, 1,
-0.968657, -0.8272764, -0.1765116, 1, 0.8627451, 0, 1,
-0.9645129, 0.8093715, -1.175319, 1, 0.8705882, 0, 1,
-0.9608759, 0.6829077, 1.819259, 1, 0.8745098, 0, 1,
-0.9494146, -0.6643549, -2.75995, 1, 0.8823529, 0, 1,
-0.9473268, 1.50576, -1.662326, 1, 0.8862745, 0, 1,
-0.9449012, -0.3461325, -2.321567, 1, 0.8941177, 0, 1,
-0.9423432, 0.9986551, -0.2944353, 1, 0.8980392, 0, 1,
-0.941474, -0.5290599, -0.7837675, 1, 0.9058824, 0, 1,
-0.940684, -0.4190669, -0.7294912, 1, 0.9137255, 0, 1,
-0.936105, -1.373799, -3.136737, 1, 0.9176471, 0, 1,
-0.9270915, -0.09584634, -0.9706514, 1, 0.9254902, 0, 1,
-0.9269547, -1.497638, -4.386775, 1, 0.9294118, 0, 1,
-0.9245475, 1.573869, -2.645624, 1, 0.9372549, 0, 1,
-0.9198211, 0.7100176, -1.330163, 1, 0.9411765, 0, 1,
-0.9191788, -0.341959, -3.247694, 1, 0.9490196, 0, 1,
-0.9162644, -1.810126, -1.721715, 1, 0.9529412, 0, 1,
-0.915566, -0.6517422, -2.290222, 1, 0.9607843, 0, 1,
-0.9070801, 0.8107561, -1.594545, 1, 0.9647059, 0, 1,
-0.8899093, 1.17862, -2.587271, 1, 0.972549, 0, 1,
-0.8813432, -0.1655682, -1.066893, 1, 0.9764706, 0, 1,
-0.8775721, -1.953521, -2.199735, 1, 0.9843137, 0, 1,
-0.8764697, 0.353224, -3.453749, 1, 0.9882353, 0, 1,
-0.8764443, -0.8728476, -2.297829, 1, 0.9960784, 0, 1,
-0.8726099, -0.2027456, -1.257499, 0.9960784, 1, 0, 1,
-0.8678555, -0.1634919, -2.416155, 0.9921569, 1, 0, 1,
-0.8618234, -0.5883556, -2.620772, 0.9843137, 1, 0, 1,
-0.8584686, -1.077638, -0.3797678, 0.9803922, 1, 0, 1,
-0.8527185, -0.272121, -0.1758448, 0.972549, 1, 0, 1,
-0.8473479, -0.2500417, -2.56431, 0.9686275, 1, 0, 1,
-0.8464192, -0.7681574, -2.462142, 0.9607843, 1, 0, 1,
-0.8459768, 0.7124454, -0.7052121, 0.9568627, 1, 0, 1,
-0.8439117, -1.453646, -1.119073, 0.9490196, 1, 0, 1,
-0.8433306, -0.4636001, -2.022815, 0.945098, 1, 0, 1,
-0.8411273, 0.08815005, -3.115436, 0.9372549, 1, 0, 1,
-0.8373128, -0.1628814, -1.025004, 0.9333333, 1, 0, 1,
-0.8347979, -1.019491, -1.476372, 0.9254902, 1, 0, 1,
-0.8250005, -1.257253, -3.661597, 0.9215686, 1, 0, 1,
-0.8210603, -0.6446002, -0.3114525, 0.9137255, 1, 0, 1,
-0.8207675, -0.3595262, -0.5866556, 0.9098039, 1, 0, 1,
-0.8189845, 1.126226, -1.422535, 0.9019608, 1, 0, 1,
-0.8131158, -0.1240763, -2.496315, 0.8941177, 1, 0, 1,
-0.8127053, -0.3192732, -1.89202, 0.8901961, 1, 0, 1,
-0.8074669, -1.21417, -1.650921, 0.8823529, 1, 0, 1,
-0.8060362, -0.3433502, -1.551416, 0.8784314, 1, 0, 1,
-0.8060048, 1.262511, -0.5087828, 0.8705882, 1, 0, 1,
-0.8007886, 0.4417093, -0.9778525, 0.8666667, 1, 0, 1,
-0.7970774, 1.309749, -1.25183, 0.8588235, 1, 0, 1,
-0.7959552, -0.1335018, -3.119781, 0.854902, 1, 0, 1,
-0.7927697, 0.7782291, -1.184932, 0.8470588, 1, 0, 1,
-0.7892628, 0.3434861, -0.05226392, 0.8431373, 1, 0, 1,
-0.7878228, -1.629345, -3.228998, 0.8352941, 1, 0, 1,
-0.7831846, 0.1906144, -0.1856911, 0.8313726, 1, 0, 1,
-0.7778001, 0.9902636, -1.780646, 0.8235294, 1, 0, 1,
-0.7734011, -3.255559, -3.287648, 0.8196079, 1, 0, 1,
-0.7683113, -0.8701875, -4.042565, 0.8117647, 1, 0, 1,
-0.7680366, -0.3654764, -1.666636, 0.8078431, 1, 0, 1,
-0.7667741, 0.8117464, -0.483784, 0.8, 1, 0, 1,
-0.7622077, -1.115134, -1.445284, 0.7921569, 1, 0, 1,
-0.7560592, -0.586278, -1.629181, 0.7882353, 1, 0, 1,
-0.7456889, 0.6464171, -0.4313652, 0.7803922, 1, 0, 1,
-0.7429149, 0.05279937, -2.256536, 0.7764706, 1, 0, 1,
-0.7418242, 0.1264465, -3.090206, 0.7686275, 1, 0, 1,
-0.7415452, 1.434443, -0.140272, 0.7647059, 1, 0, 1,
-0.7332091, 0.619638, -0.9304283, 0.7568628, 1, 0, 1,
-0.7322222, -0.5861133, -1.235728, 0.7529412, 1, 0, 1,
-0.7291797, -1.756912, -2.28451, 0.7450981, 1, 0, 1,
-0.7228196, -1.079392, -2.604603, 0.7411765, 1, 0, 1,
-0.7205049, -0.4572647, -3.406479, 0.7333333, 1, 0, 1,
-0.7191749, 1.296609, -1.173398, 0.7294118, 1, 0, 1,
-0.7139616, -0.3720555, -1.304484, 0.7215686, 1, 0, 1,
-0.7132909, -0.4718728, -2.050325, 0.7176471, 1, 0, 1,
-0.7128026, -0.6464161, -1.696491, 0.7098039, 1, 0, 1,
-0.7117026, 0.692362, 0.9722468, 0.7058824, 1, 0, 1,
-0.7094181, -1.645333, -3.206505, 0.6980392, 1, 0, 1,
-0.7034433, 0.4860848, -0.1299546, 0.6901961, 1, 0, 1,
-0.7028498, 0.4874752, -0.6942143, 0.6862745, 1, 0, 1,
-0.7023406, -0.05167393, -2.815487, 0.6784314, 1, 0, 1,
-0.7001289, 1.617215, 0.2028044, 0.6745098, 1, 0, 1,
-0.699596, 0.7384132, -0.00871576, 0.6666667, 1, 0, 1,
-0.6960268, -0.9864795, -1.659131, 0.6627451, 1, 0, 1,
-0.6949359, 0.2860294, -2.571677, 0.654902, 1, 0, 1,
-0.6948908, -0.0570526, -0.8318137, 0.6509804, 1, 0, 1,
-0.6912641, 0.695659, 0.04111248, 0.6431373, 1, 0, 1,
-0.6869964, -1.264968, -0.64982, 0.6392157, 1, 0, 1,
-0.6841075, -0.7188223, -3.182489, 0.6313726, 1, 0, 1,
-0.6807879, -0.5637402, -3.481196, 0.627451, 1, 0, 1,
-0.6755398, -0.2861837, -1.998643, 0.6196079, 1, 0, 1,
-0.6714217, -1.406034, -3.136292, 0.6156863, 1, 0, 1,
-0.6698624, 0.3373638, 1.436606, 0.6078432, 1, 0, 1,
-0.6623795, 1.689926, 0.1562486, 0.6039216, 1, 0, 1,
-0.6618627, -0.6914502, -2.560014, 0.5960785, 1, 0, 1,
-0.6584454, 1.389157, 0.5154084, 0.5882353, 1, 0, 1,
-0.6539609, 0.3087365, -1.68038, 0.5843138, 1, 0, 1,
-0.6500772, -0.795278, -2.150806, 0.5764706, 1, 0, 1,
-0.6470402, 0.3352215, -0.1680469, 0.572549, 1, 0, 1,
-0.6405465, 1.356281, -0.1108622, 0.5647059, 1, 0, 1,
-0.6391221, 0.3531848, 0.05868042, 0.5607843, 1, 0, 1,
-0.6370649, -1.171445, -3.058027, 0.5529412, 1, 0, 1,
-0.6363747, 0.4910322, -0.3220231, 0.5490196, 1, 0, 1,
-0.6362552, 0.5942874, -0.3642618, 0.5411765, 1, 0, 1,
-0.6337647, 1.283121, 0.2384289, 0.5372549, 1, 0, 1,
-0.6303031, 1.292224, -0.6674054, 0.5294118, 1, 0, 1,
-0.6286533, 0.8050503, -2.784346, 0.5254902, 1, 0, 1,
-0.6278243, 0.116878, -1.845188, 0.5176471, 1, 0, 1,
-0.6251233, 0.3412203, -2.167682, 0.5137255, 1, 0, 1,
-0.6241366, 2.572246, -1.716695, 0.5058824, 1, 0, 1,
-0.6228502, 0.261733, -1.04282, 0.5019608, 1, 0, 1,
-0.6181834, -0.2880492, -2.992682, 0.4941176, 1, 0, 1,
-0.6166819, -0.2547583, -0.6852255, 0.4862745, 1, 0, 1,
-0.6140401, 1.136566, 0.3279648, 0.4823529, 1, 0, 1,
-0.6065201, 2.714112, -0.5692954, 0.4745098, 1, 0, 1,
-0.6030039, -0.5591245, -2.918943, 0.4705882, 1, 0, 1,
-0.6005633, -0.6454304, -2.896469, 0.4627451, 1, 0, 1,
-0.5986037, -1.032518, -2.64529, 0.4588235, 1, 0, 1,
-0.597401, -0.5619555, -1.823381, 0.4509804, 1, 0, 1,
-0.5966681, 1.496635, 0.6923786, 0.4470588, 1, 0, 1,
-0.591665, -0.776274, -3.207123, 0.4392157, 1, 0, 1,
-0.5889848, -0.6271435, -3.128409, 0.4352941, 1, 0, 1,
-0.5884439, 0.8764026, -2.556353, 0.427451, 1, 0, 1,
-0.5881237, -0.342402, -2.260384, 0.4235294, 1, 0, 1,
-0.5854406, 1.268362, 0.445955, 0.4156863, 1, 0, 1,
-0.5825622, -1.771869, -3.257261, 0.4117647, 1, 0, 1,
-0.5819784, -1.061583, -2.973048, 0.4039216, 1, 0, 1,
-0.5801463, -0.4572068, -1.073424, 0.3960784, 1, 0, 1,
-0.5637472, -1.087011, -2.220981, 0.3921569, 1, 0, 1,
-0.5615252, -0.782477, -3.595581, 0.3843137, 1, 0, 1,
-0.5594785, 0.5702577, -0.8439777, 0.3803922, 1, 0, 1,
-0.5577089, 0.2470298, -0.7468548, 0.372549, 1, 0, 1,
-0.5536377, -0.0440206, -1.036486, 0.3686275, 1, 0, 1,
-0.549157, -0.09752172, 0.9575535, 0.3607843, 1, 0, 1,
-0.5440178, 0.5748307, -2.920413, 0.3568628, 1, 0, 1,
-0.5434477, 0.07646126, -2.2721, 0.3490196, 1, 0, 1,
-0.5428002, -1.678752, -3.765954, 0.345098, 1, 0, 1,
-0.5372633, -1.04914, -3.072984, 0.3372549, 1, 0, 1,
-0.533573, 0.2476635, -0.6339492, 0.3333333, 1, 0, 1,
-0.5309419, 1.877321, -0.8464365, 0.3254902, 1, 0, 1,
-0.5270559, 0.2895719, -1.209496, 0.3215686, 1, 0, 1,
-0.5253651, -0.13875, -2.055401, 0.3137255, 1, 0, 1,
-0.5210729, -1.108593, -3.209721, 0.3098039, 1, 0, 1,
-0.5178277, 1.203026, 0.1705528, 0.3019608, 1, 0, 1,
-0.5165669, 1.399877, -0.4954863, 0.2941177, 1, 0, 1,
-0.5159031, -0.7712969, -3.695514, 0.2901961, 1, 0, 1,
-0.5116814, -1.05781, -2.834253, 0.282353, 1, 0, 1,
-0.5091146, -0.7602786, -3.430199, 0.2784314, 1, 0, 1,
-0.5063292, -0.7412341, -1.575882, 0.2705882, 1, 0, 1,
-0.5009597, -0.1919433, -4.284468, 0.2666667, 1, 0, 1,
-0.4968521, -0.7746584, -1.596341, 0.2588235, 1, 0, 1,
-0.4937049, -2.912899, -5.101989, 0.254902, 1, 0, 1,
-0.4895011, -0.9459243, -2.223249, 0.2470588, 1, 0, 1,
-0.4890598, 1.635824, -2.336603, 0.2431373, 1, 0, 1,
-0.4884156, 0.5040147, 0.122903, 0.2352941, 1, 0, 1,
-0.4880778, 1.056126, 0.03146616, 0.2313726, 1, 0, 1,
-0.4854649, -0.4140452, -2.397118, 0.2235294, 1, 0, 1,
-0.4805088, -1.279293, -4.267205, 0.2196078, 1, 0, 1,
-0.4793369, 0.05187362, 1.543734, 0.2117647, 1, 0, 1,
-0.4784128, -0.6626306, -0.7609939, 0.2078431, 1, 0, 1,
-0.4765549, 0.01652754, -3.52863, 0.2, 1, 0, 1,
-0.4727697, -0.4006029, -2.817772, 0.1921569, 1, 0, 1,
-0.4701118, -0.1377442, -2.185381, 0.1882353, 1, 0, 1,
-0.4650804, -0.4272614, -1.109014, 0.1803922, 1, 0, 1,
-0.4505376, -0.5453791, -5.119165, 0.1764706, 1, 0, 1,
-0.4481071, 1.119132, -1.379045, 0.1686275, 1, 0, 1,
-0.4394442, 0.5392663, 0.1548961, 0.1647059, 1, 0, 1,
-0.436534, 0.1438215, -1.554971, 0.1568628, 1, 0, 1,
-0.4354089, -0.2387349, -0.4325085, 0.1529412, 1, 0, 1,
-0.4329931, -0.4670386, -2.593109, 0.145098, 1, 0, 1,
-0.4328018, -0.3807348, -1.050068, 0.1411765, 1, 0, 1,
-0.4326221, 0.8776261, -1.08536, 0.1333333, 1, 0, 1,
-0.4314278, -1.973988, -2.901919, 0.1294118, 1, 0, 1,
-0.4235539, -1.308243, -2.665415, 0.1215686, 1, 0, 1,
-0.4163901, -1.120875, -2.033463, 0.1176471, 1, 0, 1,
-0.4160589, 0.041452, 0.2648499, 0.1098039, 1, 0, 1,
-0.4115912, 0.4089063, -0.2616949, 0.1058824, 1, 0, 1,
-0.411286, 1.294327, -0.1615598, 0.09803922, 1, 0, 1,
-0.4112589, 1.718397, -0.2259707, 0.09019608, 1, 0, 1,
-0.408984, 1.264434, -0.9690363, 0.08627451, 1, 0, 1,
-0.4047745, 0.1834289, 0.06623651, 0.07843138, 1, 0, 1,
-0.4017273, -2.34519, -5.374659, 0.07450981, 1, 0, 1,
-0.4009673, 0.3617241, -2.144374, 0.06666667, 1, 0, 1,
-0.4001817, 0.399035, -1.474828, 0.0627451, 1, 0, 1,
-0.3954169, -0.03786781, -0.3687665, 0.05490196, 1, 0, 1,
-0.3952367, -1.939636, -3.66133, 0.05098039, 1, 0, 1,
-0.3918186, 0.4440418, -0.4933933, 0.04313726, 1, 0, 1,
-0.3916605, 1.464992, -0.1277582, 0.03921569, 1, 0, 1,
-0.3902127, -1.641667, -3.991593, 0.03137255, 1, 0, 1,
-0.387566, -0.07218044, -0.7235773, 0.02745098, 1, 0, 1,
-0.3868684, 0.7686718, -2.982128, 0.01960784, 1, 0, 1,
-0.3827744, -0.6282958, -2.81676, 0.01568628, 1, 0, 1,
-0.3807009, -1.766458, -2.91751, 0.007843138, 1, 0, 1,
-0.380614, -1.891548, -1.701968, 0.003921569, 1, 0, 1,
-0.3781715, 0.6930336, 1.009203, 0, 1, 0.003921569, 1,
-0.371227, 2.839842, -0.5415912, 0, 1, 0.01176471, 1,
-0.3704971, 1.792113, 1.35162, 0, 1, 0.01568628, 1,
-0.3691898, 1.379761, -2.308172, 0, 1, 0.02352941, 1,
-0.3689689, -0.2914858, -1.76327, 0, 1, 0.02745098, 1,
-0.3624631, -1.333896, -1.121247, 0, 1, 0.03529412, 1,
-0.3620631, -0.9110273, -3.100366, 0, 1, 0.03921569, 1,
-0.3616594, 0.5125647, -1.603509, 0, 1, 0.04705882, 1,
-0.3587822, 0.05530274, -0.8036665, 0, 1, 0.05098039, 1,
-0.353088, -0.6425136, -2.606111, 0, 1, 0.05882353, 1,
-0.3501551, 0.757407, -1.438777, 0, 1, 0.0627451, 1,
-0.3497253, -0.7160921, -2.936431, 0, 1, 0.07058824, 1,
-0.3468706, -0.7362592, -2.311967, 0, 1, 0.07450981, 1,
-0.3459403, -1.494959, -3.093906, 0, 1, 0.08235294, 1,
-0.3448871, -0.716052, -0.8164485, 0, 1, 0.08627451, 1,
-0.3421555, -0.03103706, -2.45168, 0, 1, 0.09411765, 1,
-0.3373446, -1.414424, -2.235563, 0, 1, 0.1019608, 1,
-0.3362488, 0.02694487, -2.360597, 0, 1, 0.1058824, 1,
-0.3324944, 1.654454, -0.1160526, 0, 1, 0.1137255, 1,
-0.32473, -0.6027384, -2.871892, 0, 1, 0.1176471, 1,
-0.3244258, 0.6429937, -1.044533, 0, 1, 0.1254902, 1,
-0.3240417, 2.01433, 0.93374, 0, 1, 0.1294118, 1,
-0.3235559, -0.06621335, -0.3088202, 0, 1, 0.1372549, 1,
-0.3175239, 0.7152066, -1.840842, 0, 1, 0.1411765, 1,
-0.3155628, -0.3777374, -3.763819, 0, 1, 0.1490196, 1,
-0.3153017, 0.2721401, -2.049695, 0, 1, 0.1529412, 1,
-0.3096891, 0.7375584, -0.04873674, 0, 1, 0.1607843, 1,
-0.3075118, -0.01727335, -1.151551, 0, 1, 0.1647059, 1,
-0.3061924, 0.5932085, -0.6211064, 0, 1, 0.172549, 1,
-0.2993177, 0.1906393, -1.1035, 0, 1, 0.1764706, 1,
-0.2969301, -0.2578368, -4.24581, 0, 1, 0.1843137, 1,
-0.2953206, 0.3196098, 0.4855406, 0, 1, 0.1882353, 1,
-0.2949591, -0.546434, -2.247781, 0, 1, 0.1960784, 1,
-0.2912633, -0.06351443, -3.3424, 0, 1, 0.2039216, 1,
-0.2898342, 0.8423218, -1.343648, 0, 1, 0.2078431, 1,
-0.2870364, 1.158337, -0.5670194, 0, 1, 0.2156863, 1,
-0.286748, -0.1181793, -0.4301591, 0, 1, 0.2196078, 1,
-0.2849223, 0.6608676, 0.9094589, 0, 1, 0.227451, 1,
-0.2841477, 1.085807, -0.4154814, 0, 1, 0.2313726, 1,
-0.2723324, -0.9154059, -2.486536, 0, 1, 0.2392157, 1,
-0.269473, 0.2167642, -1.545339, 0, 1, 0.2431373, 1,
-0.2688988, 2.056623, -0.2568432, 0, 1, 0.2509804, 1,
-0.2677995, -1.402404, -2.084017, 0, 1, 0.254902, 1,
-0.265784, 0.464283, 1.895202, 0, 1, 0.2627451, 1,
-0.2613119, 0.6013865, -0.3130095, 0, 1, 0.2666667, 1,
-0.2580479, 0.165415, -0.5852659, 0, 1, 0.2745098, 1,
-0.2536437, -0.5997123, -2.750481, 0, 1, 0.2784314, 1,
-0.2481276, -0.7695481, -5.21058, 0, 1, 0.2862745, 1,
-0.245848, -1.916619, -4.2437, 0, 1, 0.2901961, 1,
-0.2441794, 0.7823995, -1.776963, 0, 1, 0.2980392, 1,
-0.243693, 2.311242, -1.118022, 0, 1, 0.3058824, 1,
-0.2436929, -0.7049451, -1.751346, 0, 1, 0.3098039, 1,
-0.2385287, 0.7241733, -1.251191, 0, 1, 0.3176471, 1,
-0.2383357, -0.7858084, -1.918765, 0, 1, 0.3215686, 1,
-0.2371833, -0.007987138, -1.594409, 0, 1, 0.3294118, 1,
-0.2357053, 0.6479618, -0.3204255, 0, 1, 0.3333333, 1,
-0.2351353, -0.1574675, -0.1694165, 0, 1, 0.3411765, 1,
-0.2324918, -0.4972531, -2.73704, 0, 1, 0.345098, 1,
-0.2275317, 0.8003874, -0.9160164, 0, 1, 0.3529412, 1,
-0.2264284, 0.3621207, -0.5213094, 0, 1, 0.3568628, 1,
-0.2226938, 0.3495924, -0.9047767, 0, 1, 0.3647059, 1,
-0.2152429, -0.07648923, -3.675004, 0, 1, 0.3686275, 1,
-0.2076941, -2.267122, -3.707163, 0, 1, 0.3764706, 1,
-0.2044422, -0.9319224, -3.372923, 0, 1, 0.3803922, 1,
-0.1998971, 0.4162402, -0.5911835, 0, 1, 0.3882353, 1,
-0.1995426, 0.4666601, -0.8153459, 0, 1, 0.3921569, 1,
-0.1966702, -0.6430311, -4.008748, 0, 1, 0.4, 1,
-0.1939863, 1.145068, 0.3747751, 0, 1, 0.4078431, 1,
-0.1939286, -1.27302, -3.76087, 0, 1, 0.4117647, 1,
-0.1937087, -1.378896, -2.538576, 0, 1, 0.4196078, 1,
-0.1870996, 0.1390892, -1.469753, 0, 1, 0.4235294, 1,
-0.1856474, 1.472695, 0.4066108, 0, 1, 0.4313726, 1,
-0.1853615, -1.067558, -3.587905, 0, 1, 0.4352941, 1,
-0.185047, -0.1147816, -0.7880464, 0, 1, 0.4431373, 1,
-0.1827714, -0.5599535, -2.255487, 0, 1, 0.4470588, 1,
-0.1816613, -1.575234, -3.795584, 0, 1, 0.454902, 1,
-0.1814028, 0.5435009, -0.6591733, 0, 1, 0.4588235, 1,
-0.1797047, 0.468394, -0.6766826, 0, 1, 0.4666667, 1,
-0.1772348, 0.8140153, -0.4537799, 0, 1, 0.4705882, 1,
-0.1768716, 0.9829934, -0.04438614, 0, 1, 0.4784314, 1,
-0.1718526, 0.2563653, -0.3910542, 0, 1, 0.4823529, 1,
-0.1687359, 0.2895211, -0.4286653, 0, 1, 0.4901961, 1,
-0.1670562, -0.7261708, -2.723907, 0, 1, 0.4941176, 1,
-0.1644653, 0.2469371, -2.070694, 0, 1, 0.5019608, 1,
-0.1624802, 2.142156, 1.143783, 0, 1, 0.509804, 1,
-0.1607654, 0.6509115, -0.383435, 0, 1, 0.5137255, 1,
-0.1581397, -1.053529, -2.012084, 0, 1, 0.5215687, 1,
-0.1554546, 0.6815783, -0.4666986, 0, 1, 0.5254902, 1,
-0.1550651, -0.5978706, -1.860387, 0, 1, 0.5333334, 1,
-0.1542591, 0.4757164, 0.6575153, 0, 1, 0.5372549, 1,
-0.1536629, -0.7362102, -2.143888, 0, 1, 0.5450981, 1,
-0.1528607, 0.02321308, -1.990763, 0, 1, 0.5490196, 1,
-0.1492418, 0.318701, -0.4509952, 0, 1, 0.5568628, 1,
-0.1473493, -1.369471, -2.883561, 0, 1, 0.5607843, 1,
-0.1382719, 1.010283, -0.02202916, 0, 1, 0.5686275, 1,
-0.1282398, 1.302315, -1.329765, 0, 1, 0.572549, 1,
-0.1194623, 1.095411, 1.203675, 0, 1, 0.5803922, 1,
-0.1178217, 1.028303, -2.890968, 0, 1, 0.5843138, 1,
-0.1174242, -0.1724454, -2.243074, 0, 1, 0.5921569, 1,
-0.1148626, 0.974862, 0.5716867, 0, 1, 0.5960785, 1,
-0.1126024, -0.8562989, -3.891487, 0, 1, 0.6039216, 1,
-0.1077655, 0.6054171, -1.012725, 0, 1, 0.6117647, 1,
-0.10772, 0.839714, -0.2227995, 0, 1, 0.6156863, 1,
-0.1069781, -0.01227675, -1.834482, 0, 1, 0.6235294, 1,
-0.1062263, -0.3516439, -4.325648, 0, 1, 0.627451, 1,
-0.09939564, -0.4706981, -2.453892, 0, 1, 0.6352941, 1,
-0.09382573, 0.01053022, -1.847291, 0, 1, 0.6392157, 1,
-0.0930822, 0.07723569, -0.06298989, 0, 1, 0.6470588, 1,
-0.09232698, 0.5127531, -0.1278743, 0, 1, 0.6509804, 1,
-0.09232255, 0.1636315, 0.8278476, 0, 1, 0.6588235, 1,
-0.09169796, 1.451698, 1.476711, 0, 1, 0.6627451, 1,
-0.08329664, 0.05907991, 0.2915244, 0, 1, 0.6705883, 1,
-0.07872153, 1.829947, -0.6154923, 0, 1, 0.6745098, 1,
-0.07010339, 0.30192, -1.141506, 0, 1, 0.682353, 1,
-0.06913869, 0.476972, 0.2435427, 0, 1, 0.6862745, 1,
-0.06585472, -0.9928423, -4.791338, 0, 1, 0.6941177, 1,
-0.06525625, 0.3158794, -1.583007, 0, 1, 0.7019608, 1,
-0.06406558, -0.3013588, -1.867855, 0, 1, 0.7058824, 1,
-0.06321938, -0.4013203, -4.49272, 0, 1, 0.7137255, 1,
-0.06201365, -0.1925411, -1.758662, 0, 1, 0.7176471, 1,
-0.06191865, 1.111797, 1.077433, 0, 1, 0.7254902, 1,
-0.06035605, 1.199942, -0.2432652, 0, 1, 0.7294118, 1,
-0.04869792, 0.7190171, -3.138692, 0, 1, 0.7372549, 1,
-0.04764062, -1.141706, -3.649919, 0, 1, 0.7411765, 1,
-0.04681709, 1.107056, -0.5347638, 0, 1, 0.7490196, 1,
-0.04319883, 0.02384304, 0.4782286, 0, 1, 0.7529412, 1,
-0.04141481, 0.3765658, 1.500962, 0, 1, 0.7607843, 1,
-0.04044756, 0.8040531, 1.167124, 0, 1, 0.7647059, 1,
-0.03982863, 1.141634, 1.249325, 0, 1, 0.772549, 1,
-0.03765091, 1.184469, -0.479037, 0, 1, 0.7764706, 1,
-0.03728378, -0.7361459, -2.238759, 0, 1, 0.7843137, 1,
-0.03691331, -0.678782, -1.990441, 0, 1, 0.7882353, 1,
-0.03386365, 1.586893, 1.317017, 0, 1, 0.7960784, 1,
-0.03044556, -0.5722171, -3.282124, 0, 1, 0.8039216, 1,
-0.02891172, -0.4068724, -2.474715, 0, 1, 0.8078431, 1,
-0.0268814, -2.154391, -4.445722, 0, 1, 0.8156863, 1,
-0.0260752, 1.311577, 0.3943542, 0, 1, 0.8196079, 1,
-0.02546157, 0.228961, -1.025242, 0, 1, 0.827451, 1,
-0.02305436, -0.4285893, -1.997836, 0, 1, 0.8313726, 1,
-0.02170295, -1.770264, -2.393007, 0, 1, 0.8392157, 1,
-0.02075127, 1.218388, -0.3188127, 0, 1, 0.8431373, 1,
-0.02066992, 1.099207, -1.023788, 0, 1, 0.8509804, 1,
-0.0202226, 0.4239729, 0.9026782, 0, 1, 0.854902, 1,
-0.01908917, 0.5272528, -0.4820567, 0, 1, 0.8627451, 1,
-0.01722427, -1.586638, -4.492988, 0, 1, 0.8666667, 1,
-0.01551227, 1.403447, -0.6755549, 0, 1, 0.8745098, 1,
-0.01499559, 1.437033, -0.5759902, 0, 1, 0.8784314, 1,
-0.0140748, 0.1806832, -0.4648686, 0, 1, 0.8862745, 1,
-0.01228205, -1.250336, -1.917903, 0, 1, 0.8901961, 1,
-0.005734375, -1.183317, -2.354043, 0, 1, 0.8980392, 1,
0.002025555, 1.947689, 2.056005, 0, 1, 0.9058824, 1,
0.002121302, 0.5355638, 1.00015, 0, 1, 0.9098039, 1,
0.003317015, 0.0565385, 0.3157264, 0, 1, 0.9176471, 1,
0.00640456, -0.6666229, 3.44536, 0, 1, 0.9215686, 1,
0.009900713, 1.023466, -0.687381, 0, 1, 0.9294118, 1,
0.01142065, 0.5198756, 0.09660346, 0, 1, 0.9333333, 1,
0.01341881, -1.49381, 3.39429, 0, 1, 0.9411765, 1,
0.01667419, -2.002015, 2.011404, 0, 1, 0.945098, 1,
0.01815763, -0.158375, 2.115735, 0, 1, 0.9529412, 1,
0.01956797, 0.8597264, 1.54124, 0, 1, 0.9568627, 1,
0.02222756, 0.4042552, -0.1903436, 0, 1, 0.9647059, 1,
0.02638331, -1.55052, 3.253984, 0, 1, 0.9686275, 1,
0.02992236, -0.2117648, 2.603329, 0, 1, 0.9764706, 1,
0.04009972, 1.496264, 0.9211305, 0, 1, 0.9803922, 1,
0.04055598, -0.8141674, 2.462695, 0, 1, 0.9882353, 1,
0.04990256, -0.4357467, 1.979971, 0, 1, 0.9921569, 1,
0.05069434, 0.9485402, 1.106563, 0, 1, 1, 1,
0.05142289, -1.087644, 2.899735, 0, 0.9921569, 1, 1,
0.05158006, -0.7722185, 3.970394, 0, 0.9882353, 1, 1,
0.05288498, -0.4927022, 2.950178, 0, 0.9803922, 1, 1,
0.05392721, -0.3831763, 5.557417, 0, 0.9764706, 1, 1,
0.05602106, -0.3097671, 2.786965, 0, 0.9686275, 1, 1,
0.05761168, -1.327956, 3.955637, 0, 0.9647059, 1, 1,
0.05839788, -1.078357, 3.716013, 0, 0.9568627, 1, 1,
0.06331266, 0.6046147, -0.8532668, 0, 0.9529412, 1, 1,
0.06376906, 0.6783255, -1.639339, 0, 0.945098, 1, 1,
0.06436002, -0.7974339, 3.672439, 0, 0.9411765, 1, 1,
0.06754558, -0.5555461, 1.861066, 0, 0.9333333, 1, 1,
0.06759601, -0.1126075, 3.360171, 0, 0.9294118, 1, 1,
0.0706183, -0.7096285, 3.289712, 0, 0.9215686, 1, 1,
0.07502025, -0.1897042, 3.694198, 0, 0.9176471, 1, 1,
0.07664686, 1.055822, -0.5380539, 0, 0.9098039, 1, 1,
0.08017296, -0.3768528, 1.762262, 0, 0.9058824, 1, 1,
0.08136714, -1.395163, 3.097299, 0, 0.8980392, 1, 1,
0.08414557, 0.6784931, -0.5767168, 0, 0.8901961, 1, 1,
0.09702169, -0.08140827, 4.724087, 0, 0.8862745, 1, 1,
0.1012226, 1.486973, 0.5652429, 0, 0.8784314, 1, 1,
0.1021966, -0.08010627, 2.985293, 0, 0.8745098, 1, 1,
0.1069501, -0.044672, 2.323055, 0, 0.8666667, 1, 1,
0.1076428, 0.1553818, -0.4206296, 0, 0.8627451, 1, 1,
0.1132057, 0.7114567, 1.320966, 0, 0.854902, 1, 1,
0.1162877, 0.8984789, 0.02499031, 0, 0.8509804, 1, 1,
0.1164452, 0.7426045, -0.6511539, 0, 0.8431373, 1, 1,
0.1228215, 1.411849, 2.334055, 0, 0.8392157, 1, 1,
0.124055, 1.375588, 1.132063, 0, 0.8313726, 1, 1,
0.1343068, 0.6781952, -0.9004534, 0, 0.827451, 1, 1,
0.13486, -0.1133608, 1.134678, 0, 0.8196079, 1, 1,
0.1376188, -1.163626, 5.122988, 0, 0.8156863, 1, 1,
0.138602, 0.3309984, -1.742109, 0, 0.8078431, 1, 1,
0.1394819, 1.791976, -0.3490869, 0, 0.8039216, 1, 1,
0.1397737, -0.9240319, 2.812061, 0, 0.7960784, 1, 1,
0.1413892, 0.5913232, 0.2067055, 0, 0.7882353, 1, 1,
0.1416058, 0.3885038, 0.8409933, 0, 0.7843137, 1, 1,
0.147685, -1.216329, 3.262809, 0, 0.7764706, 1, 1,
0.1493558, -3.188932, 2.163552, 0, 0.772549, 1, 1,
0.1541519, 2.085957, -0.4636102, 0, 0.7647059, 1, 1,
0.1589622, -0.9634653, 3.482157, 0, 0.7607843, 1, 1,
0.1748095, 0.06486281, 0.727865, 0, 0.7529412, 1, 1,
0.1752695, -0.6617862, 1.958134, 0, 0.7490196, 1, 1,
0.1766873, 0.9587526, 0.5522839, 0, 0.7411765, 1, 1,
0.1811816, -0.6950427, 1.381884, 0, 0.7372549, 1, 1,
0.1822718, 1.500847, -1.423274, 0, 0.7294118, 1, 1,
0.1822889, -0.4110009, 1.882623, 0, 0.7254902, 1, 1,
0.1826068, -1.44611, 4.119859, 0, 0.7176471, 1, 1,
0.1829995, 0.3502823, 0.5007184, 0, 0.7137255, 1, 1,
0.1872768, -0.3135531, 4.073578, 0, 0.7058824, 1, 1,
0.1924523, 0.1588118, 2.164904, 0, 0.6980392, 1, 1,
0.1970378, 1.070814, 1.047072, 0, 0.6941177, 1, 1,
0.1970727, 0.798916, 0.5193141, 0, 0.6862745, 1, 1,
0.1977983, 0.5547022, 1.248218, 0, 0.682353, 1, 1,
0.1980652, 1.581298, -0.103734, 0, 0.6745098, 1, 1,
0.2016603, -0.500114, 1.187291, 0, 0.6705883, 1, 1,
0.2035912, -0.823674, 4.189522, 0, 0.6627451, 1, 1,
0.203789, -0.1578932, 1.962534, 0, 0.6588235, 1, 1,
0.2045151, 0.6358457, -0.1923816, 0, 0.6509804, 1, 1,
0.2056362, 0.1551678, 1.370518, 0, 0.6470588, 1, 1,
0.2165791, 0.08751411, -0.5310733, 0, 0.6392157, 1, 1,
0.217882, 0.1053162, 0.6833978, 0, 0.6352941, 1, 1,
0.2208258, 1.041841, 1.358096, 0, 0.627451, 1, 1,
0.222776, -1.035275, 1.17802, 0, 0.6235294, 1, 1,
0.2237896, 0.5753415, 1.143044, 0, 0.6156863, 1, 1,
0.2278232, 1.656203, -0.499896, 0, 0.6117647, 1, 1,
0.2297025, 0.2393444, -0.4738888, 0, 0.6039216, 1, 1,
0.2320529, -0.2263155, 2.038797, 0, 0.5960785, 1, 1,
0.237224, -1.421942, 2.223008, 0, 0.5921569, 1, 1,
0.2382144, -0.2236246, 1.730778, 0, 0.5843138, 1, 1,
0.2383543, 0.5436714, 0.858579, 0, 0.5803922, 1, 1,
0.2398918, -0.1082411, 1.795719, 0, 0.572549, 1, 1,
0.2474384, -0.3355241, 2.490909, 0, 0.5686275, 1, 1,
0.24985, -0.9847657, 1.631472, 0, 0.5607843, 1, 1,
0.2517775, 1.378669, 2.751722, 0, 0.5568628, 1, 1,
0.2536725, -0.4216591, 1.635246, 0, 0.5490196, 1, 1,
0.2555495, -1.418581, 4.548621, 0, 0.5450981, 1, 1,
0.258984, 0.1138989, 2.513683, 0, 0.5372549, 1, 1,
0.2621809, -1.406976, 1.898893, 0, 0.5333334, 1, 1,
0.2631415, 1.567949, -0.04173249, 0, 0.5254902, 1, 1,
0.2648348, 0.4738749, 1.049485, 0, 0.5215687, 1, 1,
0.2653789, -0.3106659, 2.202632, 0, 0.5137255, 1, 1,
0.2692412, -0.1620579, 2.88044, 0, 0.509804, 1, 1,
0.2707717, -0.7629403, 4.002089, 0, 0.5019608, 1, 1,
0.2726116, 0.1985864, 0.7066905, 0, 0.4941176, 1, 1,
0.2740367, 0.6928174, -1.157827, 0, 0.4901961, 1, 1,
0.2751701, 0.2083671, 1.934568, 0, 0.4823529, 1, 1,
0.276265, -2.801931, 3.199856, 0, 0.4784314, 1, 1,
0.2815361, -0.3948052, 3.463753, 0, 0.4705882, 1, 1,
0.2826651, 0.2325615, 1.224963, 0, 0.4666667, 1, 1,
0.2880881, 1.068294, 0.8774819, 0, 0.4588235, 1, 1,
0.2906144, -0.8847096, 1.974236, 0, 0.454902, 1, 1,
0.2913226, -0.9935611, 3.28172, 0, 0.4470588, 1, 1,
0.2944675, 0.7250208, -0.02759321, 0, 0.4431373, 1, 1,
0.2954328, 0.0948372, 0.1878765, 0, 0.4352941, 1, 1,
0.295485, -1.523457, 2.5799, 0, 0.4313726, 1, 1,
0.2990072, -0.1434884, 0.9271778, 0, 0.4235294, 1, 1,
0.3010481, 0.8807417, 1.253306, 0, 0.4196078, 1, 1,
0.3026508, 0.2673123, 0.8995513, 0, 0.4117647, 1, 1,
0.3069966, -1.485932, 0.870867, 0, 0.4078431, 1, 1,
0.3087469, 0.03344568, 1.929548, 0, 0.4, 1, 1,
0.3097293, 1.109433, -1.693579, 0, 0.3921569, 1, 1,
0.3144902, 0.6060051, 0.2071444, 0, 0.3882353, 1, 1,
0.3165498, 0.4374533, 0.8038825, 0, 0.3803922, 1, 1,
0.3177759, -0.06676321, 2.388606, 0, 0.3764706, 1, 1,
0.3178215, -0.7556423, 3.741447, 0, 0.3686275, 1, 1,
0.3186374, 0.5028194, -0.3373267, 0, 0.3647059, 1, 1,
0.318795, -0.8155795, 2.821581, 0, 0.3568628, 1, 1,
0.3284376, 0.6261954, -0.02594802, 0, 0.3529412, 1, 1,
0.3380126, 1.014531, 1.28733, 0, 0.345098, 1, 1,
0.3415387, -1.331852, 3.852627, 0, 0.3411765, 1, 1,
0.3416498, 0.06961972, 1.583546, 0, 0.3333333, 1, 1,
0.3420863, 0.6797593, -0.09926341, 0, 0.3294118, 1, 1,
0.3432501, -0.446077, 2.535912, 0, 0.3215686, 1, 1,
0.3445629, 0.8290563, 2.302278, 0, 0.3176471, 1, 1,
0.3470711, 0.5670154, 1.686609, 0, 0.3098039, 1, 1,
0.3485068, 0.9264832, -0.4561116, 0, 0.3058824, 1, 1,
0.3495359, 2.321512, 2.567964, 0, 0.2980392, 1, 1,
0.3512021, -2.739805, 3.428928, 0, 0.2901961, 1, 1,
0.3549868, 1.41015, 0.5223038, 0, 0.2862745, 1, 1,
0.360376, -0.4322498, 4.917068, 0, 0.2784314, 1, 1,
0.3606282, -0.5548285, 1.910039, 0, 0.2745098, 1, 1,
0.3638217, -1.250491, 3.441197, 0, 0.2666667, 1, 1,
0.3698135, -1.314228, 2.518563, 0, 0.2627451, 1, 1,
0.3732095, 0.3145998, -0.3317566, 0, 0.254902, 1, 1,
0.3765, -0.4955805, 3.297055, 0, 0.2509804, 1, 1,
0.3795396, -0.4758394, 2.380429, 0, 0.2431373, 1, 1,
0.38016, -1.461532, 2.960781, 0, 0.2392157, 1, 1,
0.3803999, 0.7704118, 0.7119554, 0, 0.2313726, 1, 1,
0.3813516, 0.8520219, -1.271561, 0, 0.227451, 1, 1,
0.381386, 0.05670175, 1.994742, 0, 0.2196078, 1, 1,
0.3861581, -1.083512, 4.035096, 0, 0.2156863, 1, 1,
0.3913097, -0.387171, 1.880114, 0, 0.2078431, 1, 1,
0.3975042, 0.7551467, 0.7916021, 0, 0.2039216, 1, 1,
0.4014294, 0.4317251, 0.2749083, 0, 0.1960784, 1, 1,
0.4033945, 1.33016, -0.6147775, 0, 0.1882353, 1, 1,
0.403875, 0.4623181, 1.368428, 0, 0.1843137, 1, 1,
0.4051848, 1.480273, -1.769821, 0, 0.1764706, 1, 1,
0.4069373, 0.4455076, -1.881676, 0, 0.172549, 1, 1,
0.4072331, -0.9563954, 3.503253, 0, 0.1647059, 1, 1,
0.4075648, 0.3681402, 0.6582216, 0, 0.1607843, 1, 1,
0.4086208, 0.02630509, 2.564212, 0, 0.1529412, 1, 1,
0.4099607, 0.07318225, 1.962568, 0, 0.1490196, 1, 1,
0.4106811, -0.1042977, 2.120928, 0, 0.1411765, 1, 1,
0.4106899, 1.330628, -0.9332923, 0, 0.1372549, 1, 1,
0.4112681, -0.3625441, 3.377684, 0, 0.1294118, 1, 1,
0.4172612, -0.7283858, 2.958965, 0, 0.1254902, 1, 1,
0.4194742, 0.6210231, 0.933998, 0, 0.1176471, 1, 1,
0.419781, 0.0003147588, 2.241362, 0, 0.1137255, 1, 1,
0.4208035, 0.1668809, 1.260485, 0, 0.1058824, 1, 1,
0.4218513, -1.495851, 3.02442, 0, 0.09803922, 1, 1,
0.4221563, -1.138554, 3.163082, 0, 0.09411765, 1, 1,
0.425341, -0.1298628, 1.176022, 0, 0.08627451, 1, 1,
0.4257274, -0.003413808, 0.2085356, 0, 0.08235294, 1, 1,
0.4283417, -1.310837, 1.686292, 0, 0.07450981, 1, 1,
0.4337803, -0.2684471, 1.592517, 0, 0.07058824, 1, 1,
0.4393779, 2.400028, 0.6098939, 0, 0.0627451, 1, 1,
0.4415333, -1.779083, 2.668666, 0, 0.05882353, 1, 1,
0.4447829, 0.1254885, 0.3045816, 0, 0.05098039, 1, 1,
0.4449497, 0.5241539, 0.8058264, 0, 0.04705882, 1, 1,
0.4539392, -0.1063585, 2.035795, 0, 0.03921569, 1, 1,
0.4542135, -0.3104864, 2.793816, 0, 0.03529412, 1, 1,
0.4548289, -1.087212, 2.85083, 0, 0.02745098, 1, 1,
0.4561116, -1.218679, 5.894005, 0, 0.02352941, 1, 1,
0.4567214, 0.4177046, 0.4105414, 0, 0.01568628, 1, 1,
0.4575559, 0.6731954, 0.03304484, 0, 0.01176471, 1, 1,
0.4588544, 1.126526, 0.1806322, 0, 0.003921569, 1, 1,
0.4597517, -1.203152, 3.179471, 0.003921569, 0, 1, 1,
0.4623106, -1.167732, 1.819272, 0.007843138, 0, 1, 1,
0.4625272, -0.4578745, 1.159212, 0.01568628, 0, 1, 1,
0.4657384, -0.1852754, 3.588176, 0.01960784, 0, 1, 1,
0.4682119, -0.6690651, 3.207319, 0.02745098, 0, 1, 1,
0.4731168, 1.525939, -0.7922171, 0.03137255, 0, 1, 1,
0.4733473, -0.7451817, 2.014886, 0.03921569, 0, 1, 1,
0.4759898, -1.846979, 3.631666, 0.04313726, 0, 1, 1,
0.4767618, 0.1576225, 2.823754, 0.05098039, 0, 1, 1,
0.4776659, -0.5120298, 2.852732, 0.05490196, 0, 1, 1,
0.4812811, 0.4909741, 0.3185881, 0.0627451, 0, 1, 1,
0.4846253, 0.2623499, 2.213716, 0.06666667, 0, 1, 1,
0.4848854, -0.07729072, 0.5915707, 0.07450981, 0, 1, 1,
0.4851605, -1.700998, 1.956841, 0.07843138, 0, 1, 1,
0.4935451, -0.4663976, 1.992187, 0.08627451, 0, 1, 1,
0.4936113, 0.6972257, 0.8423306, 0.09019608, 0, 1, 1,
0.4972206, 0.5373255, 2.101981, 0.09803922, 0, 1, 1,
0.4987002, 1.231203, 0.2574912, 0.1058824, 0, 1, 1,
0.5007411, 1.526723, 0.4072984, 0.1098039, 0, 1, 1,
0.5009515, -0.4658034, 1.898378, 0.1176471, 0, 1, 1,
0.5048666, -1.277988, 3.996772, 0.1215686, 0, 1, 1,
0.5170094, 0.4336746, -0.1538702, 0.1294118, 0, 1, 1,
0.518601, -0.8925064, 3.895868, 0.1333333, 0, 1, 1,
0.5192173, -1.103993, 2.065846, 0.1411765, 0, 1, 1,
0.51952, -0.4304183, 1.413189, 0.145098, 0, 1, 1,
0.5222476, 0.03406952, 1.433031, 0.1529412, 0, 1, 1,
0.530491, -0.8381624, 2.232967, 0.1568628, 0, 1, 1,
0.5329937, 0.5850698, 1.782907, 0.1647059, 0, 1, 1,
0.5341901, -1.494557, 2.690212, 0.1686275, 0, 1, 1,
0.5395564, -0.9882932, 3.173671, 0.1764706, 0, 1, 1,
0.540089, 0.6877339, -0.9854978, 0.1803922, 0, 1, 1,
0.5493476, 0.06798351, 2.48755, 0.1882353, 0, 1, 1,
0.5508924, 0.5702059, 0.4288162, 0.1921569, 0, 1, 1,
0.5526823, 0.7989697, -0.674539, 0.2, 0, 1, 1,
0.553999, 0.4345263, 1.202388, 0.2078431, 0, 1, 1,
0.557447, 0.357897, 2.231075, 0.2117647, 0, 1, 1,
0.5625206, 0.2694071, 0.7568977, 0.2196078, 0, 1, 1,
0.5654576, -1.072566, 2.59435, 0.2235294, 0, 1, 1,
0.5685812, -1.010674, 1.309009, 0.2313726, 0, 1, 1,
0.5707151, 0.4684385, 0.3900355, 0.2352941, 0, 1, 1,
0.5750667, -2.055127, 2.908376, 0.2431373, 0, 1, 1,
0.5772383, 0.9376605, 0.6500974, 0.2470588, 0, 1, 1,
0.5822421, -0.8867276, 1.530004, 0.254902, 0, 1, 1,
0.5845613, 0.9776919, 0.3930634, 0.2588235, 0, 1, 1,
0.5857255, 1.002314, 0.5182566, 0.2666667, 0, 1, 1,
0.5865613, -0.8132222, 2.40593, 0.2705882, 0, 1, 1,
0.5892585, 2.405292, -1.402256, 0.2784314, 0, 1, 1,
0.5916361, -0.1799736, 3.29369, 0.282353, 0, 1, 1,
0.5972328, 1.681516, 0.4618653, 0.2901961, 0, 1, 1,
0.6024598, 1.790909, 0.5243276, 0.2941177, 0, 1, 1,
0.604474, -0.6531337, 4.19901, 0.3019608, 0, 1, 1,
0.608924, -0.4187228, 2.939891, 0.3098039, 0, 1, 1,
0.6095491, -0.8998313, 2.954506, 0.3137255, 0, 1, 1,
0.6237733, -0.1972589, 2.712913, 0.3215686, 0, 1, 1,
0.6281519, -0.9017401, 0.8577108, 0.3254902, 0, 1, 1,
0.6284676, 0.05675084, -0.4141282, 0.3333333, 0, 1, 1,
0.63257, 1.187133, 0.7006765, 0.3372549, 0, 1, 1,
0.6367818, -0.3918606, 2.970531, 0.345098, 0, 1, 1,
0.6376888, -1.541138, 3.046634, 0.3490196, 0, 1, 1,
0.6407047, 0.7773696, 0.4469519, 0.3568628, 0, 1, 1,
0.6500331, -0.198431, 1.251613, 0.3607843, 0, 1, 1,
0.6511034, 1.011175, 0.1465487, 0.3686275, 0, 1, 1,
0.6527416, 0.4349664, 1.449919, 0.372549, 0, 1, 1,
0.655366, 0.3401933, 0.2783506, 0.3803922, 0, 1, 1,
0.6588182, 1.548489, 1.992467, 0.3843137, 0, 1, 1,
0.6597366, 1.286718, 0.6153617, 0.3921569, 0, 1, 1,
0.6603788, 0.05061902, 2.041507, 0.3960784, 0, 1, 1,
0.6663052, -1.711539, 2.144523, 0.4039216, 0, 1, 1,
0.6734229, 0.186263, 1.377867, 0.4117647, 0, 1, 1,
0.6734614, 0.7987538, 1.1124, 0.4156863, 0, 1, 1,
0.6749031, 0.6778786, 1.688404, 0.4235294, 0, 1, 1,
0.677597, -0.2023501, 2.158977, 0.427451, 0, 1, 1,
0.6787867, 1.116611, 0.5059915, 0.4352941, 0, 1, 1,
0.6792464, 0.2095479, 0.289194, 0.4392157, 0, 1, 1,
0.6839193, -0.004045816, 0.1835902, 0.4470588, 0, 1, 1,
0.6856946, -0.2783485, 2.50475, 0.4509804, 0, 1, 1,
0.6859196, -1.818058, 3.616484, 0.4588235, 0, 1, 1,
0.6878653, 1.203617, 0.7603129, 0.4627451, 0, 1, 1,
0.6884658, -0.4044271, 2.01475, 0.4705882, 0, 1, 1,
0.6886258, -1.80968, 2.965276, 0.4745098, 0, 1, 1,
0.6898646, 0.7135451, -0.4066629, 0.4823529, 0, 1, 1,
0.6961414, 0.1584313, 0.8969867, 0.4862745, 0, 1, 1,
0.6971107, 0.5504847, 1.672606, 0.4941176, 0, 1, 1,
0.6987521, 0.4455887, 1.679582, 0.5019608, 0, 1, 1,
0.7045814, 0.1558092, -0.01853548, 0.5058824, 0, 1, 1,
0.7050738, 0.7474803, 0.9898894, 0.5137255, 0, 1, 1,
0.7068371, -1.28669, 2.571538, 0.5176471, 0, 1, 1,
0.7077339, -0.2107235, 1.038558, 0.5254902, 0, 1, 1,
0.7175654, -1.057883, 3.271255, 0.5294118, 0, 1, 1,
0.7180727, -0.6256375, 3.528101, 0.5372549, 0, 1, 1,
0.7186996, 1.060199, 3.014893, 0.5411765, 0, 1, 1,
0.7194819, 0.6586848, 0.8670264, 0.5490196, 0, 1, 1,
0.7235666, -0.1083542, 0.631391, 0.5529412, 0, 1, 1,
0.7248894, -0.2184638, 1.494013, 0.5607843, 0, 1, 1,
0.7302378, 2.540279, -0.1483953, 0.5647059, 0, 1, 1,
0.7308269, 0.8033276, -0.08772713, 0.572549, 0, 1, 1,
0.7308442, -0.01546814, 1.432442, 0.5764706, 0, 1, 1,
0.734601, 0.6234481, 1.739686, 0.5843138, 0, 1, 1,
0.7347838, 1.218304, 0.45866, 0.5882353, 0, 1, 1,
0.7374418, -0.9058087, 3.489108, 0.5960785, 0, 1, 1,
0.7395362, 0.1863113, 0.8326606, 0.6039216, 0, 1, 1,
0.7435585, 1.189136, -1.022061, 0.6078432, 0, 1, 1,
0.7441515, 0.08086438, 1.610039, 0.6156863, 0, 1, 1,
0.7451435, 0.04568362, 0.02141123, 0.6196079, 0, 1, 1,
0.7459841, 1.100599, 2.248276, 0.627451, 0, 1, 1,
0.7468972, -1.972566, 2.025125, 0.6313726, 0, 1, 1,
0.7472579, -1.03394, 2.522263, 0.6392157, 0, 1, 1,
0.7489964, 1.428686, 0.2999389, 0.6431373, 0, 1, 1,
0.7494851, -0.6018486, 1.418602, 0.6509804, 0, 1, 1,
0.7534121, 0.3912585, 0.91362, 0.654902, 0, 1, 1,
0.7565392, -0.2702922, 0.5492786, 0.6627451, 0, 1, 1,
0.7639804, -0.7894011, 1.631502, 0.6666667, 0, 1, 1,
0.7640332, -0.2146588, 0.4662457, 0.6745098, 0, 1, 1,
0.7655692, -0.5029824, 1.25882, 0.6784314, 0, 1, 1,
0.7676317, -0.6604052, 3.33549, 0.6862745, 0, 1, 1,
0.7761319, -1.227613, 1.696219, 0.6901961, 0, 1, 1,
0.7769324, 0.4370158, 1.763452, 0.6980392, 0, 1, 1,
0.7822274, 0.6345605, 0.3096742, 0.7058824, 0, 1, 1,
0.7831877, -0.8090757, 1.859054, 0.7098039, 0, 1, 1,
0.7866101, -1.756021, 2.380655, 0.7176471, 0, 1, 1,
0.7880792, 0.4131994, 1.170088, 0.7215686, 0, 1, 1,
0.7912413, -1.093501, 2.920445, 0.7294118, 0, 1, 1,
0.8000352, -0.4832663, 1.513319, 0.7333333, 0, 1, 1,
0.8017516, -0.5496293, 2.821087, 0.7411765, 0, 1, 1,
0.8067767, 0.4979455, 0.04514509, 0.7450981, 0, 1, 1,
0.8082973, -1.028871, 2.754947, 0.7529412, 0, 1, 1,
0.8094273, -0.09089645, 0.9793949, 0.7568628, 0, 1, 1,
0.8102619, -0.7132812, 2.547335, 0.7647059, 0, 1, 1,
0.8187148, -0.3709808, 2.385519, 0.7686275, 0, 1, 1,
0.8201185, 0.7209406, 0.9126085, 0.7764706, 0, 1, 1,
0.8205276, -2.010772, 2.326076, 0.7803922, 0, 1, 1,
0.8206606, -0.1166153, 3.158691, 0.7882353, 0, 1, 1,
0.8211395, 0.2834492, 0.5085776, 0.7921569, 0, 1, 1,
0.8231848, -0.9095211, 3.477231, 0.8, 0, 1, 1,
0.8251371, -1.358081, 2.050533, 0.8078431, 0, 1, 1,
0.8257948, 0.02922003, 1.35033, 0.8117647, 0, 1, 1,
0.8318616, 0.8552393, 1.068744, 0.8196079, 0, 1, 1,
0.8357677, -1.125865, -0.239525, 0.8235294, 0, 1, 1,
0.837564, 1.121199, -0.2110931, 0.8313726, 0, 1, 1,
0.8385375, -0.3683018, 0.1993158, 0.8352941, 0, 1, 1,
0.839267, -0.005443914, 1.276692, 0.8431373, 0, 1, 1,
0.8396349, 0.1623876, 0.6636887, 0.8470588, 0, 1, 1,
0.8416178, 0.4600341, -0.04082648, 0.854902, 0, 1, 1,
0.8418277, -0.6733438, 2.472939, 0.8588235, 0, 1, 1,
0.8463073, -0.1856112, 1.312706, 0.8666667, 0, 1, 1,
0.8481536, 0.1798759, 1.677801, 0.8705882, 0, 1, 1,
0.8509994, -0.4496723, 4.25242, 0.8784314, 0, 1, 1,
0.85164, 0.7464774, 0.6877939, 0.8823529, 0, 1, 1,
0.856725, -1.145034, 1.408717, 0.8901961, 0, 1, 1,
0.8575869, -0.6366508, 0.8852366, 0.8941177, 0, 1, 1,
0.8775986, 0.5172194, 1.39985, 0.9019608, 0, 1, 1,
0.8793342, -0.9545205, 2.796532, 0.9098039, 0, 1, 1,
0.8802912, 0.9597171, 1.332805, 0.9137255, 0, 1, 1,
0.8858245, -0.8647861, 2.421213, 0.9215686, 0, 1, 1,
0.8920199, 1.04729, 0.1403745, 0.9254902, 0, 1, 1,
0.8941708, 0.7354122, 0.05232669, 0.9333333, 0, 1, 1,
0.8969358, 1.624146, 0.6314994, 0.9372549, 0, 1, 1,
0.899713, -0.8703379, 3.892435, 0.945098, 0, 1, 1,
0.9054329, -1.182271, 2.665737, 0.9490196, 0, 1, 1,
0.9172121, 0.7184939, 1.329531, 0.9568627, 0, 1, 1,
0.9191561, -1.838758, 2.481325, 0.9607843, 0, 1, 1,
0.9244019, 0.8346325, 1.813489, 0.9686275, 0, 1, 1,
0.9264724, -0.6033861, 1.504638, 0.972549, 0, 1, 1,
0.9307631, 0.3241616, 2.11951, 0.9803922, 0, 1, 1,
0.9312162, -1.432533, 3.152351, 0.9843137, 0, 1, 1,
0.953224, 0.2670927, 1.650922, 0.9921569, 0, 1, 1,
0.9542363, 0.5132921, 0.7539359, 0.9960784, 0, 1, 1,
0.9566094, 2.026663, -0.1635113, 1, 0, 0.9960784, 1,
0.9629167, 1.117022, 0.08035186, 1, 0, 0.9882353, 1,
0.9708217, -1.012816, 1.379801, 1, 0, 0.9843137, 1,
0.9732143, 0.150577, 1.500884, 1, 0, 0.9764706, 1,
0.9746593, 0.5235032, 1.376531, 1, 0, 0.972549, 1,
0.9828696, -0.02494579, 1.270876, 1, 0, 0.9647059, 1,
0.9839566, 0.7963037, 1.02325, 1, 0, 0.9607843, 1,
0.998474, 2.216024, -0.2270441, 1, 0, 0.9529412, 1,
1.004181, 0.06174601, 1.32991, 1, 0, 0.9490196, 1,
1.008118, 0.8820338, 1.843678, 1, 0, 0.9411765, 1,
1.010342, -1.224801, 3.463252, 1, 0, 0.9372549, 1,
1.017684, 0.4433571, 0.8128768, 1, 0, 0.9294118, 1,
1.022211, 1.574598, 1.348746, 1, 0, 0.9254902, 1,
1.029796, 0.9817663, 2.221284, 1, 0, 0.9176471, 1,
1.031152, -1.255343, 4.143922, 1, 0, 0.9137255, 1,
1.031823, -0.4698533, 1.395283, 1, 0, 0.9058824, 1,
1.03193, 0.4617503, -0.436574, 1, 0, 0.9019608, 1,
1.032022, 1.020653, -0.1712792, 1, 0, 0.8941177, 1,
1.033754, -0.2295344, 1.173427, 1, 0, 0.8862745, 1,
1.037474, 0.1035696, 3.508121, 1, 0, 0.8823529, 1,
1.047068, 1.362813, 0.3235679, 1, 0, 0.8745098, 1,
1.047166, -0.5865012, 3.813818, 1, 0, 0.8705882, 1,
1.050263, -0.5549856, 2.345325, 1, 0, 0.8627451, 1,
1.05558, -0.8327833, 0.0603965, 1, 0, 0.8588235, 1,
1.061248, -1.327156, 2.678144, 1, 0, 0.8509804, 1,
1.063089, 0.39255, -0.2516098, 1, 0, 0.8470588, 1,
1.063197, -1.264001, 2.997556, 1, 0, 0.8392157, 1,
1.081744, 0.2584915, 0.07815845, 1, 0, 0.8352941, 1,
1.089949, 2.326227, 0.3819448, 1, 0, 0.827451, 1,
1.095346, -0.1630659, 0.2189864, 1, 0, 0.8235294, 1,
1.096482, -1.543705, 2.483926, 1, 0, 0.8156863, 1,
1.104504, 0.4393813, 0.6539385, 1, 0, 0.8117647, 1,
1.104741, -1.707201, 4.3923, 1, 0, 0.8039216, 1,
1.109629, 1.418391, 1.379709, 1, 0, 0.7960784, 1,
1.110878, 0.3337533, 2.60581, 1, 0, 0.7921569, 1,
1.120234, 0.563051, 2.216245, 1, 0, 0.7843137, 1,
1.120668, -0.7242206, 3.039535, 1, 0, 0.7803922, 1,
1.126692, 1.240802, 1.237052, 1, 0, 0.772549, 1,
1.128467, 1.824549, 1.527625, 1, 0, 0.7686275, 1,
1.134215, -0.3133244, 1.454126, 1, 0, 0.7607843, 1,
1.135762, 0.7869655, 0.7766207, 1, 0, 0.7568628, 1,
1.141269, 0.5643069, 1.400897, 1, 0, 0.7490196, 1,
1.141667, -1.091726, 2.153105, 1, 0, 0.7450981, 1,
1.14317, 0.6899955, 0.8166591, 1, 0, 0.7372549, 1,
1.144103, -1.530087, 2.012849, 1, 0, 0.7333333, 1,
1.146452, 0.0853701, -0.2873009, 1, 0, 0.7254902, 1,
1.149674, 2.02107, 0.4134493, 1, 0, 0.7215686, 1,
1.150617, 1.200689, 0.8803725, 1, 0, 0.7137255, 1,
1.152725, -0.3660206, 0.4974437, 1, 0, 0.7098039, 1,
1.153319, 2.970201, 2.081909, 1, 0, 0.7019608, 1,
1.15874, -1.63198, 1.407728, 1, 0, 0.6941177, 1,
1.178944, -0.2554172, 3.033991, 1, 0, 0.6901961, 1,
1.184022, -2.514497, 2.036335, 1, 0, 0.682353, 1,
1.201656, -1.421713, 2.314095, 1, 0, 0.6784314, 1,
1.206552, 1.28127, 0.5383369, 1, 0, 0.6705883, 1,
1.210566, -1.543961, 2.711128, 1, 0, 0.6666667, 1,
1.219974, -0.7495571, 3.44174, 1, 0, 0.6588235, 1,
1.222157, -1.271807, 1.4672, 1, 0, 0.654902, 1,
1.225663, -0.9279302, 3.318532, 1, 0, 0.6470588, 1,
1.228013, -1.618106, 3.349429, 1, 0, 0.6431373, 1,
1.23295, 0.5540022, 0.9761257, 1, 0, 0.6352941, 1,
1.233047, 1.337113, 0.4479111, 1, 0, 0.6313726, 1,
1.235142, -1.23008, 1.276582, 1, 0, 0.6235294, 1,
1.23568, 1.904983, 0.4910913, 1, 0, 0.6196079, 1,
1.241605, 1.111688, 1.67482, 1, 0, 0.6117647, 1,
1.248373, -0.7121894, 2.832917, 1, 0, 0.6078432, 1,
1.254579, -0.8508258, 1.419563, 1, 0, 0.6, 1,
1.259874, 1.229406, 1.793355, 1, 0, 0.5921569, 1,
1.268411, 1.730979, -1.131672, 1, 0, 0.5882353, 1,
1.277391, 0.7781895, 0.2407296, 1, 0, 0.5803922, 1,
1.28362, 1.138558, 0.7629867, 1, 0, 0.5764706, 1,
1.293114, -2.197158, 1.285409, 1, 0, 0.5686275, 1,
1.295121, 0.6566998, 0.5215372, 1, 0, 0.5647059, 1,
1.295743, 0.2774422, 1.1613, 1, 0, 0.5568628, 1,
1.306879, 0.08882922, 2.578526, 1, 0, 0.5529412, 1,
1.314859, -1.158001, 2.405864, 1, 0, 0.5450981, 1,
1.321322, -0.1458356, 1.043064, 1, 0, 0.5411765, 1,
1.327961, -0.418971, 2.036504, 1, 0, 0.5333334, 1,
1.328354, -0.4557113, 3.348275, 1, 0, 0.5294118, 1,
1.335834, -1.791996, 2.220148, 1, 0, 0.5215687, 1,
1.337991, -0.3127733, 2.291895, 1, 0, 0.5176471, 1,
1.34062, -0.945871, 0.9730138, 1, 0, 0.509804, 1,
1.341224, -0.04955769, 2.314591, 1, 0, 0.5058824, 1,
1.345964, 0.4753737, 1.490918, 1, 0, 0.4980392, 1,
1.352796, -0.9420522, 4.363539, 1, 0, 0.4901961, 1,
1.355341, 1.206394, 0.7500325, 1, 0, 0.4862745, 1,
1.357554, -0.02177907, 0.9183511, 1, 0, 0.4784314, 1,
1.35767, 1.467758, 2.156004, 1, 0, 0.4745098, 1,
1.372754, 1.388014, 0.2330157, 1, 0, 0.4666667, 1,
1.37521, -0.6227047, 2.808425, 1, 0, 0.4627451, 1,
1.381645, 1.428854, 0.01230044, 1, 0, 0.454902, 1,
1.390144, 0.710627, 1.716985, 1, 0, 0.4509804, 1,
1.39497, -0.1490332, 1.846672, 1, 0, 0.4431373, 1,
1.395086, -0.8178878, 0.03331449, 1, 0, 0.4392157, 1,
1.403404, 1.277531, 0.8215652, 1, 0, 0.4313726, 1,
1.413819, -0.2625429, 0.9536375, 1, 0, 0.427451, 1,
1.427942, -0.05741019, 1.68811, 1, 0, 0.4196078, 1,
1.434083, -0.9502387, 0.671841, 1, 0, 0.4156863, 1,
1.43516, 0.2030436, 2.667591, 1, 0, 0.4078431, 1,
1.451698, 0.3246735, 1.993354, 1, 0, 0.4039216, 1,
1.453004, 1.148644, 0.6374556, 1, 0, 0.3960784, 1,
1.453301, 0.359336, 1.957717, 1, 0, 0.3882353, 1,
1.453403, -0.7633539, 0.4263489, 1, 0, 0.3843137, 1,
1.464919, 0.1164759, -0.01512514, 1, 0, 0.3764706, 1,
1.464983, -0.4168189, 2.376009, 1, 0, 0.372549, 1,
1.466575, -1.073533, 1.736237, 1, 0, 0.3647059, 1,
1.47037, 0.013681, 2.336789, 1, 0, 0.3607843, 1,
1.471313, -0.003567812, 0.9292986, 1, 0, 0.3529412, 1,
1.496348, 1.398317, -0.1638672, 1, 0, 0.3490196, 1,
1.500666, -0.08754992, 0.7926503, 1, 0, 0.3411765, 1,
1.505191, 0.4397943, 2.004821, 1, 0, 0.3372549, 1,
1.507312, -1.23782, 1.2137, 1, 0, 0.3294118, 1,
1.516316, 1.265436, 0.3801722, 1, 0, 0.3254902, 1,
1.530016, 0.03656474, 2.486168, 1, 0, 0.3176471, 1,
1.537624, -0.1552057, 3.74507, 1, 0, 0.3137255, 1,
1.543905, 0.403919, 1.955133, 1, 0, 0.3058824, 1,
1.573968, -0.08359895, 1.095599, 1, 0, 0.2980392, 1,
1.576366, -2.369274, 2.599972, 1, 0, 0.2941177, 1,
1.605919, -0.4446554, 2.316076, 1, 0, 0.2862745, 1,
1.644528, 0.4661614, 2.17719, 1, 0, 0.282353, 1,
1.648927, -0.616999, 0.05678276, 1, 0, 0.2745098, 1,
1.659575, -1.170401, 2.038348, 1, 0, 0.2705882, 1,
1.66649, 1.010017, 2.585618, 1, 0, 0.2627451, 1,
1.674329, 0.1550412, -0.9520535, 1, 0, 0.2588235, 1,
1.6754, 0.9530796, 2.420991, 1, 0, 0.2509804, 1,
1.70142, 1.120498, -1.115675, 1, 0, 0.2470588, 1,
1.707627, -0.5272279, 2.469977, 1, 0, 0.2392157, 1,
1.712817, -0.8460097, 2.403526, 1, 0, 0.2352941, 1,
1.715097, -0.2925864, -1.854366, 1, 0, 0.227451, 1,
1.715149, -1.044296, 2.038945, 1, 0, 0.2235294, 1,
1.725572, 1.442587, 0.9176564, 1, 0, 0.2156863, 1,
1.751808, 1.750254, 1.33197, 1, 0, 0.2117647, 1,
1.764932, 0.4604245, 0.1616788, 1, 0, 0.2039216, 1,
1.77646, 0.6735119, 1.993139, 1, 0, 0.1960784, 1,
1.787307, -0.1905017, 1.244524, 1, 0, 0.1921569, 1,
1.795009, 1.135023, 0.2160072, 1, 0, 0.1843137, 1,
1.795405, -0.1199052, 3.508109, 1, 0, 0.1803922, 1,
1.808635, 0.3917501, 2.664218, 1, 0, 0.172549, 1,
1.823246, -1.595352, 2.049134, 1, 0, 0.1686275, 1,
1.828078, 1.314325, 0.6451727, 1, 0, 0.1607843, 1,
1.862496, -0.5551602, 2.565711, 1, 0, 0.1568628, 1,
1.863167, -0.08049764, 1.22459, 1, 0, 0.1490196, 1,
1.879498, 0.8114123, -0.2363796, 1, 0, 0.145098, 1,
1.884864, -0.5873035, 2.596436, 1, 0, 0.1372549, 1,
1.937531, -0.4724818, 0.1764431, 1, 0, 0.1333333, 1,
1.960224, -0.355674, 1.296577, 1, 0, 0.1254902, 1,
1.978488, 0.1521433, 3.091179, 1, 0, 0.1215686, 1,
1.978548, -0.620654, 2.257377, 1, 0, 0.1137255, 1,
2.021882, -0.1235943, 1.947213, 1, 0, 0.1098039, 1,
2.06345, 0.1097825, 0.7076413, 1, 0, 0.1019608, 1,
2.096061, 0.4640046, 0.9052331, 1, 0, 0.09411765, 1,
2.100097, -0.5541707, 0.6590788, 1, 0, 0.09019608, 1,
2.116349, -0.3712923, 1.497981, 1, 0, 0.08235294, 1,
2.137143, 0.8171401, 0.8082677, 1, 0, 0.07843138, 1,
2.162228, 1.191403, 2.766225, 1, 0, 0.07058824, 1,
2.247454, 0.3691866, 2.518789, 1, 0, 0.06666667, 1,
2.272333, -1.816546, 1.681121, 1, 0, 0.05882353, 1,
2.279685, -0.2255053, 2.765647, 1, 0, 0.05490196, 1,
2.292942, -0.2583477, 1.021403, 1, 0, 0.04705882, 1,
2.321348, -1.132621, 1.544731, 1, 0, 0.04313726, 1,
2.387509, 0.7070764, 0.775624, 1, 0, 0.03529412, 1,
2.395865, -0.3584812, 3.579913, 1, 0, 0.03137255, 1,
2.450628, -0.02315399, 0.02062017, 1, 0, 0.02352941, 1,
2.468013, 0.2326865, 2.047115, 1, 0, 0.01960784, 1,
2.553795, 0.2517163, 1.665397, 1, 0, 0.01176471, 1,
2.732871, -1.105067, 2.434835, 1, 0, 0.007843138, 1
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
-0.3526648, -4.310825, -7.574717, 0, -0.5, 0.5, 0.5,
-0.3526648, -4.310825, -7.574717, 1, -0.5, 0.5, 0.5,
-0.3526648, -4.310825, -7.574717, 1, 1.5, 0.5, 0.5,
-0.3526648, -4.310825, -7.574717, 0, 1.5, 0.5, 0.5
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
-4.484197, -0.1426791, -7.574717, 0, -0.5, 0.5, 0.5,
-4.484197, -0.1426791, -7.574717, 1, -0.5, 0.5, 0.5,
-4.484197, -0.1426791, -7.574717, 1, 1.5, 0.5, 0.5,
-4.484197, -0.1426791, -7.574717, 0, 1.5, 0.5, 0.5
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
-4.484197, -4.310825, 0.1356802, 0, -0.5, 0.5, 0.5,
-4.484197, -4.310825, 0.1356802, 1, -0.5, 0.5, 0.5,
-4.484197, -4.310825, 0.1356802, 1, 1.5, 0.5, 0.5,
-4.484197, -4.310825, 0.1356802, 0, 1.5, 0.5, 0.5
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
-3, -3.348945, -5.795394,
2, -3.348945, -5.795394,
-3, -3.348945, -5.795394,
-3, -3.509259, -6.091949,
-2, -3.348945, -5.795394,
-2, -3.509259, -6.091949,
-1, -3.348945, -5.795394,
-1, -3.509259, -6.091949,
0, -3.348945, -5.795394,
0, -3.509259, -6.091949,
1, -3.348945, -5.795394,
1, -3.509259, -6.091949,
2, -3.348945, -5.795394,
2, -3.509259, -6.091949
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
-3, -3.829885, -6.685056, 0, -0.5, 0.5, 0.5,
-3, -3.829885, -6.685056, 1, -0.5, 0.5, 0.5,
-3, -3.829885, -6.685056, 1, 1.5, 0.5, 0.5,
-3, -3.829885, -6.685056, 0, 1.5, 0.5, 0.5,
-2, -3.829885, -6.685056, 0, -0.5, 0.5, 0.5,
-2, -3.829885, -6.685056, 1, -0.5, 0.5, 0.5,
-2, -3.829885, -6.685056, 1, 1.5, 0.5, 0.5,
-2, -3.829885, -6.685056, 0, 1.5, 0.5, 0.5,
-1, -3.829885, -6.685056, 0, -0.5, 0.5, 0.5,
-1, -3.829885, -6.685056, 1, -0.5, 0.5, 0.5,
-1, -3.829885, -6.685056, 1, 1.5, 0.5, 0.5,
-1, -3.829885, -6.685056, 0, 1.5, 0.5, 0.5,
0, -3.829885, -6.685056, 0, -0.5, 0.5, 0.5,
0, -3.829885, -6.685056, 1, -0.5, 0.5, 0.5,
0, -3.829885, -6.685056, 1, 1.5, 0.5, 0.5,
0, -3.829885, -6.685056, 0, 1.5, 0.5, 0.5,
1, -3.829885, -6.685056, 0, -0.5, 0.5, 0.5,
1, -3.829885, -6.685056, 1, -0.5, 0.5, 0.5,
1, -3.829885, -6.685056, 1, 1.5, 0.5, 0.5,
1, -3.829885, -6.685056, 0, 1.5, 0.5, 0.5,
2, -3.829885, -6.685056, 0, -0.5, 0.5, 0.5,
2, -3.829885, -6.685056, 1, -0.5, 0.5, 0.5,
2, -3.829885, -6.685056, 1, 1.5, 0.5, 0.5,
2, -3.829885, -6.685056, 0, 1.5, 0.5, 0.5
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
-3.530766, -3, -5.795394,
-3.530766, 2, -5.795394,
-3.530766, -3, -5.795394,
-3.689671, -3, -6.091949,
-3.530766, -2, -5.795394,
-3.689671, -2, -6.091949,
-3.530766, -1, -5.795394,
-3.689671, -1, -6.091949,
-3.530766, 0, -5.795394,
-3.689671, 0, -6.091949,
-3.530766, 1, -5.795394,
-3.689671, 1, -6.091949,
-3.530766, 2, -5.795394,
-3.689671, 2, -6.091949
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
-4.007482, -3, -6.685056, 0, -0.5, 0.5, 0.5,
-4.007482, -3, -6.685056, 1, -0.5, 0.5, 0.5,
-4.007482, -3, -6.685056, 1, 1.5, 0.5, 0.5,
-4.007482, -3, -6.685056, 0, 1.5, 0.5, 0.5,
-4.007482, -2, -6.685056, 0, -0.5, 0.5, 0.5,
-4.007482, -2, -6.685056, 1, -0.5, 0.5, 0.5,
-4.007482, -2, -6.685056, 1, 1.5, 0.5, 0.5,
-4.007482, -2, -6.685056, 0, 1.5, 0.5, 0.5,
-4.007482, -1, -6.685056, 0, -0.5, 0.5, 0.5,
-4.007482, -1, -6.685056, 1, -0.5, 0.5, 0.5,
-4.007482, -1, -6.685056, 1, 1.5, 0.5, 0.5,
-4.007482, -1, -6.685056, 0, 1.5, 0.5, 0.5,
-4.007482, 0, -6.685056, 0, -0.5, 0.5, 0.5,
-4.007482, 0, -6.685056, 1, -0.5, 0.5, 0.5,
-4.007482, 0, -6.685056, 1, 1.5, 0.5, 0.5,
-4.007482, 0, -6.685056, 0, 1.5, 0.5, 0.5,
-4.007482, 1, -6.685056, 0, -0.5, 0.5, 0.5,
-4.007482, 1, -6.685056, 1, -0.5, 0.5, 0.5,
-4.007482, 1, -6.685056, 1, 1.5, 0.5, 0.5,
-4.007482, 1, -6.685056, 0, 1.5, 0.5, 0.5,
-4.007482, 2, -6.685056, 0, -0.5, 0.5, 0.5,
-4.007482, 2, -6.685056, 1, -0.5, 0.5, 0.5,
-4.007482, 2, -6.685056, 1, 1.5, 0.5, 0.5,
-4.007482, 2, -6.685056, 0, 1.5, 0.5, 0.5
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
-3.530766, -3.348945, -4,
-3.530766, -3.348945, 4,
-3.530766, -3.348945, -4,
-3.689671, -3.509259, -4,
-3.530766, -3.348945, -2,
-3.689671, -3.509259, -2,
-3.530766, -3.348945, 0,
-3.689671, -3.509259, 0,
-3.530766, -3.348945, 2,
-3.689671, -3.509259, 2,
-3.530766, -3.348945, 4,
-3.689671, -3.509259, 4
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
-4.007482, -3.829885, -4, 0, -0.5, 0.5, 0.5,
-4.007482, -3.829885, -4, 1, -0.5, 0.5, 0.5,
-4.007482, -3.829885, -4, 1, 1.5, 0.5, 0.5,
-4.007482, -3.829885, -4, 0, 1.5, 0.5, 0.5,
-4.007482, -3.829885, -2, 0, -0.5, 0.5, 0.5,
-4.007482, -3.829885, -2, 1, -0.5, 0.5, 0.5,
-4.007482, -3.829885, -2, 1, 1.5, 0.5, 0.5,
-4.007482, -3.829885, -2, 0, 1.5, 0.5, 0.5,
-4.007482, -3.829885, 0, 0, -0.5, 0.5, 0.5,
-4.007482, -3.829885, 0, 1, -0.5, 0.5, 0.5,
-4.007482, -3.829885, 0, 1, 1.5, 0.5, 0.5,
-4.007482, -3.829885, 0, 0, 1.5, 0.5, 0.5,
-4.007482, -3.829885, 2, 0, -0.5, 0.5, 0.5,
-4.007482, -3.829885, 2, 1, -0.5, 0.5, 0.5,
-4.007482, -3.829885, 2, 1, 1.5, 0.5, 0.5,
-4.007482, -3.829885, 2, 0, 1.5, 0.5, 0.5,
-4.007482, -3.829885, 4, 0, -0.5, 0.5, 0.5,
-4.007482, -3.829885, 4, 1, -0.5, 0.5, 0.5,
-4.007482, -3.829885, 4, 1, 1.5, 0.5, 0.5,
-4.007482, -3.829885, 4, 0, 1.5, 0.5, 0.5
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
-3.530766, -3.348945, -5.795394,
-3.530766, 3.063587, -5.795394,
-3.530766, -3.348945, 6.066755,
-3.530766, 3.063587, 6.066755,
-3.530766, -3.348945, -5.795394,
-3.530766, -3.348945, 6.066755,
-3.530766, 3.063587, -5.795394,
-3.530766, 3.063587, 6.066755,
-3.530766, -3.348945, -5.795394,
2.825437, -3.348945, -5.795394,
-3.530766, -3.348945, 6.066755,
2.825437, -3.348945, 6.066755,
-3.530766, 3.063587, -5.795394,
2.825437, 3.063587, -5.795394,
-3.530766, 3.063587, 6.066755,
2.825437, 3.063587, 6.066755,
2.825437, -3.348945, -5.795394,
2.825437, 3.063587, -5.795394,
2.825437, -3.348945, 6.066755,
2.825437, 3.063587, 6.066755,
2.825437, -3.348945, -5.795394,
2.825437, -3.348945, 6.066755,
2.825437, 3.063587, -5.795394,
2.825437, 3.063587, 6.066755
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
var radius = 7.960296;
var distance = 35.41626;
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
mvMatrix.translate( 0.3526648, 0.1426791, -0.1356802 );
mvMatrix.scale( 1.354083, 1.342189, 0.7255707 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.41626);
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
bromuconazole<-read.table("bromuconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bromuconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromuconazole' not found
```

```r
y<-bromuconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromuconazole' not found
```

```r
z<-bromuconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromuconazole' not found
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
-3.4382, -1.427692, -1.862606, 0, 0, 1, 1, 1,
-3.366706, 1.091921, -2.668084, 1, 0, 0, 1, 1,
-3.351959, 0.4858272, -1.093473, 1, 0, 0, 1, 1,
-2.930979, -0.3949879, -3.227894, 1, 0, 0, 1, 1,
-2.828326, 1.513727, -1.962888, 1, 0, 0, 1, 1,
-2.779376, 0.7997327, -0.1570047, 1, 0, 0, 1, 1,
-2.544338, -0.683707, -3.045238, 0, 0, 0, 1, 1,
-2.520254, 0.5484259, -1.424983, 0, 0, 0, 1, 1,
-2.417815, -0.8939972, -1.910842, 0, 0, 0, 1, 1,
-2.386389, 1.176996, -0.01525916, 0, 0, 0, 1, 1,
-2.259, -0.1232108, -2.887395, 0, 0, 0, 1, 1,
-2.228033, 0.4795447, -2.371262, 0, 0, 0, 1, 1,
-2.193543, -1.822809, -3.605465, 0, 0, 0, 1, 1,
-2.189553, 0.9139379, 0.1758109, 1, 1, 1, 1, 1,
-2.184833, 0.2724445, -0.8424039, 1, 1, 1, 1, 1,
-2.160647, -1.230932, -2.785953, 1, 1, 1, 1, 1,
-2.141958, 1.057146, -1.875034, 1, 1, 1, 1, 1,
-2.110309, -1.045335, -1.644724, 1, 1, 1, 1, 1,
-2.095556, 0.6644424, -2.169563, 1, 1, 1, 1, 1,
-2.079401, 0.9213809, -2.195576, 1, 1, 1, 1, 1,
-2.052026, -0.07768503, -1.777333, 1, 1, 1, 1, 1,
-1.981703, -0.07103163, -4.040613, 1, 1, 1, 1, 1,
-1.957059, -1.595644, -3.997413, 1, 1, 1, 1, 1,
-1.948767, -2.150112, -3.014126, 1, 1, 1, 1, 1,
-1.944598, 1.020353, -1.726825, 1, 1, 1, 1, 1,
-1.924869, 0.3583197, 1.170071, 1, 1, 1, 1, 1,
-1.910799, -0.1504247, -3.21331, 1, 1, 1, 1, 1,
-1.900245, 0.6352698, -1.44156, 1, 1, 1, 1, 1,
-1.898327, 0.1920587, -1.26786, 0, 0, 1, 1, 1,
-1.895748, 0.546564, 0.2193759, 1, 0, 0, 1, 1,
-1.885857, 1.672271, -2.161733, 1, 0, 0, 1, 1,
-1.88499, 1.078743, -1.232291, 1, 0, 0, 1, 1,
-1.809483, -0.9367931, -1.757093, 1, 0, 0, 1, 1,
-1.80492, -0.4240333, -2.80902, 1, 0, 0, 1, 1,
-1.784677, -0.4138492, -3.389811, 0, 0, 0, 1, 1,
-1.767172, 1.258148, -2.993173, 0, 0, 0, 1, 1,
-1.745883, -2.540168, -1.703329, 0, 0, 0, 1, 1,
-1.721421, 1.09066, -0.8157504, 0, 0, 0, 1, 1,
-1.709048, 0.9900634, -1.465545, 0, 0, 0, 1, 1,
-1.704794, 0.8112342, -3.531152, 0, 0, 0, 1, 1,
-1.698861, -0.60781, -0.5775742, 0, 0, 0, 1, 1,
-1.698137, -1.198652, -3.871519, 1, 1, 1, 1, 1,
-1.695598, -0.6939418, -2.190087, 1, 1, 1, 1, 1,
-1.67895, 0.08747089, -0.0018208, 1, 1, 1, 1, 1,
-1.675178, -0.4109716, -1.435159, 1, 1, 1, 1, 1,
-1.633203, 1.101932, -1.991179, 1, 1, 1, 1, 1,
-1.601297, 1.683157, -0.5019045, 1, 1, 1, 1, 1,
-1.588677, 0.485476, -1.147271, 1, 1, 1, 1, 1,
-1.573922, -0.09935746, -0.6319612, 1, 1, 1, 1, 1,
-1.551027, 0.2635548, -1.011613, 1, 1, 1, 1, 1,
-1.530526, 0.3271702, -0.5300121, 1, 1, 1, 1, 1,
-1.52423, 1.201806, -1.503933, 1, 1, 1, 1, 1,
-1.520012, 1.827765, -0.7267361, 1, 1, 1, 1, 1,
-1.519196, 0.2207277, -1.139998, 1, 1, 1, 1, 1,
-1.474054, 1.308425, -1.732841, 1, 1, 1, 1, 1,
-1.464409, 0.9430594, 0.6124344, 1, 1, 1, 1, 1,
-1.462052, 1.009953, -2.341717, 0, 0, 1, 1, 1,
-1.459991, -0.2064978, -2.953861, 1, 0, 0, 1, 1,
-1.443046, 2.011091, -0.9765203, 1, 0, 0, 1, 1,
-1.419297, 1.751171, -1.671502, 1, 0, 0, 1, 1,
-1.418622, 0.8941101, -1.038319, 1, 0, 0, 1, 1,
-1.412791, 0.05570449, -2.568418, 1, 0, 0, 1, 1,
-1.407607, 0.7040821, -1.251908, 0, 0, 0, 1, 1,
-1.406642, 2.321519, -0.3602753, 0, 0, 0, 1, 1,
-1.388691, 0.05419955, 0.2311533, 0, 0, 0, 1, 1,
-1.384703, -0.4129348, -2.552541, 0, 0, 0, 1, 1,
-1.376455, -1.716015, -1.885016, 0, 0, 0, 1, 1,
-1.371925, 0.00912027, -3.331028, 0, 0, 0, 1, 1,
-1.371528, 1.265422, -0.9815243, 0, 0, 0, 1, 1,
-1.369858, 1.084381, 0.2081686, 1, 1, 1, 1, 1,
-1.35913, -1.235409, -3.209513, 1, 1, 1, 1, 1,
-1.341738, 0.5196649, -1.324381, 1, 1, 1, 1, 1,
-1.332638, 0.3187609, 1.007278, 1, 1, 1, 1, 1,
-1.330356, 1.364246, -0.4679795, 1, 1, 1, 1, 1,
-1.323703, -1.245078, -2.820511, 1, 1, 1, 1, 1,
-1.323426, 1.485007, -0.5233965, 1, 1, 1, 1, 1,
-1.312914, -0.07456303, -1.334879, 1, 1, 1, 1, 1,
-1.312289, -3.066996, -1.172266, 1, 1, 1, 1, 1,
-1.30679, 0.2844867, -1.247807, 1, 1, 1, 1, 1,
-1.296984, 1.070353, 0.4617002, 1, 1, 1, 1, 1,
-1.271349, -1.321565, -3.501711, 1, 1, 1, 1, 1,
-1.269025, 1.392971, -0.7808716, 1, 1, 1, 1, 1,
-1.268472, -0.6215079, -1.347301, 1, 1, 1, 1, 1,
-1.267038, 0.5194476, -1.27038, 1, 1, 1, 1, 1,
-1.259164, -0.6941364, -2.982973, 0, 0, 1, 1, 1,
-1.246067, 0.5089954, -0.2819917, 1, 0, 0, 1, 1,
-1.244517, 0.5377625, -1.276717, 1, 0, 0, 1, 1,
-1.232085, 0.2464064, -2.751035, 1, 0, 0, 1, 1,
-1.231084, 0.4441262, -1.185689, 1, 0, 0, 1, 1,
-1.214672, -0.9911677, -2.275792, 1, 0, 0, 1, 1,
-1.214135, 0.523175, -1.059386, 0, 0, 0, 1, 1,
-1.212978, -0.6575253, -2.535376, 0, 0, 0, 1, 1,
-1.210171, -0.4354607, -3.253635, 0, 0, 0, 1, 1,
-1.206786, -0.1652607, -0.2976425, 0, 0, 0, 1, 1,
-1.206737, -0.2164493, -1.341835, 0, 0, 0, 1, 1,
-1.204235, -0.253038, -3.044653, 0, 0, 0, 1, 1,
-1.199443, -1.883232, -1.570828, 0, 0, 0, 1, 1,
-1.195903, -0.6410331, -1.33819, 1, 1, 1, 1, 1,
-1.195766, 0.4026257, -0.1777723, 1, 1, 1, 1, 1,
-1.190116, -1.196029, -1.5482, 1, 1, 1, 1, 1,
-1.178076, -0.2060651, -1.385585, 1, 1, 1, 1, 1,
-1.175758, -0.06325915, -1.964681, 1, 1, 1, 1, 1,
-1.173079, -0.4522707, -3.097208, 1, 1, 1, 1, 1,
-1.171386, -0.2667761, -4.733867, 1, 1, 1, 1, 1,
-1.165535, 0.3652225, -0.5610019, 1, 1, 1, 1, 1,
-1.149402, -1.857013, -2.816176, 1, 1, 1, 1, 1,
-1.141832, 0.5943998, -0.3399479, 1, 1, 1, 1, 1,
-1.141729, 0.7835722, -1.148795, 1, 1, 1, 1, 1,
-1.141511, -0.6058733, -4.632854, 1, 1, 1, 1, 1,
-1.134359, 0.5272021, -1.460609, 1, 1, 1, 1, 1,
-1.131889, -1.074169, -5.622645, 1, 1, 1, 1, 1,
-1.131552, -2.470589, -3.944508, 1, 1, 1, 1, 1,
-1.124308, 0.3363934, -0.9851335, 0, 0, 1, 1, 1,
-1.117561, 1.390289, -1.048271, 1, 0, 0, 1, 1,
-1.116999, 1.04645, -0.1125878, 1, 0, 0, 1, 1,
-1.100911, 1.260453, 2.26214, 1, 0, 0, 1, 1,
-1.100358, -0.2573436, -2.210491, 1, 0, 0, 1, 1,
-1.094057, -1.186824, -1.790204, 1, 0, 0, 1, 1,
-1.091776, -0.6609654, -4.308435, 0, 0, 0, 1, 1,
-1.081219, -1.438621, -3.687808, 0, 0, 0, 1, 1,
-1.080071, 0.5827994, -0.2406625, 0, 0, 0, 1, 1,
-1.065725, -1.167784, -0.5262126, 0, 0, 0, 1, 1,
-1.063807, -0.2313984, -0.8600021, 0, 0, 0, 1, 1,
-1.063236, -1.2537, -3.671625, 0, 0, 0, 1, 1,
-1.060637, 0.1741092, -2.77751, 0, 0, 0, 1, 1,
-1.055207, -1.466029, -1.337945, 1, 1, 1, 1, 1,
-1.049311, 1.111173, -0.6590549, 1, 1, 1, 1, 1,
-1.046411, 0.9379004, -0.3609696, 1, 1, 1, 1, 1,
-1.042521, -0.2124084, -2.934178, 1, 1, 1, 1, 1,
-1.025152, -1.385499, -2.932263, 1, 1, 1, 1, 1,
-1.020528, -1.275838, -1.162099, 1, 1, 1, 1, 1,
-1.017412, -0.481855, -1.750144, 1, 1, 1, 1, 1,
-1.014966, -1.595524, -3.273933, 1, 1, 1, 1, 1,
-1.011166, -0.5917484, -0.320882, 1, 1, 1, 1, 1,
-1.008795, 0.8976008, -0.9733737, 1, 1, 1, 1, 1,
-1.005182, -0.05746002, -1.535296, 1, 1, 1, 1, 1,
-1.003176, -1.195185, -3.683562, 1, 1, 1, 1, 1,
-1.002013, 0.1029215, -0.2176768, 1, 1, 1, 1, 1,
-1.001212, 2.082087, 1.180849, 1, 1, 1, 1, 1,
-0.9913864, 0.1509625, -0.4608709, 1, 1, 1, 1, 1,
-0.9841906, 0.09634674, -2.019747, 0, 0, 1, 1, 1,
-0.9772614, 0.8862721, -2.286944, 1, 0, 0, 1, 1,
-0.9737745, -0.02259368, -0.118385, 1, 0, 0, 1, 1,
-0.9706383, 1.378168, -1.175015, 1, 0, 0, 1, 1,
-0.968657, -0.8272764, -0.1765116, 1, 0, 0, 1, 1,
-0.9645129, 0.8093715, -1.175319, 1, 0, 0, 1, 1,
-0.9608759, 0.6829077, 1.819259, 0, 0, 0, 1, 1,
-0.9494146, -0.6643549, -2.75995, 0, 0, 0, 1, 1,
-0.9473268, 1.50576, -1.662326, 0, 0, 0, 1, 1,
-0.9449012, -0.3461325, -2.321567, 0, 0, 0, 1, 1,
-0.9423432, 0.9986551, -0.2944353, 0, 0, 0, 1, 1,
-0.941474, -0.5290599, -0.7837675, 0, 0, 0, 1, 1,
-0.940684, -0.4190669, -0.7294912, 0, 0, 0, 1, 1,
-0.936105, -1.373799, -3.136737, 1, 1, 1, 1, 1,
-0.9270915, -0.09584634, -0.9706514, 1, 1, 1, 1, 1,
-0.9269547, -1.497638, -4.386775, 1, 1, 1, 1, 1,
-0.9245475, 1.573869, -2.645624, 1, 1, 1, 1, 1,
-0.9198211, 0.7100176, -1.330163, 1, 1, 1, 1, 1,
-0.9191788, -0.341959, -3.247694, 1, 1, 1, 1, 1,
-0.9162644, -1.810126, -1.721715, 1, 1, 1, 1, 1,
-0.915566, -0.6517422, -2.290222, 1, 1, 1, 1, 1,
-0.9070801, 0.8107561, -1.594545, 1, 1, 1, 1, 1,
-0.8899093, 1.17862, -2.587271, 1, 1, 1, 1, 1,
-0.8813432, -0.1655682, -1.066893, 1, 1, 1, 1, 1,
-0.8775721, -1.953521, -2.199735, 1, 1, 1, 1, 1,
-0.8764697, 0.353224, -3.453749, 1, 1, 1, 1, 1,
-0.8764443, -0.8728476, -2.297829, 1, 1, 1, 1, 1,
-0.8726099, -0.2027456, -1.257499, 1, 1, 1, 1, 1,
-0.8678555, -0.1634919, -2.416155, 0, 0, 1, 1, 1,
-0.8618234, -0.5883556, -2.620772, 1, 0, 0, 1, 1,
-0.8584686, -1.077638, -0.3797678, 1, 0, 0, 1, 1,
-0.8527185, -0.272121, -0.1758448, 1, 0, 0, 1, 1,
-0.8473479, -0.2500417, -2.56431, 1, 0, 0, 1, 1,
-0.8464192, -0.7681574, -2.462142, 1, 0, 0, 1, 1,
-0.8459768, 0.7124454, -0.7052121, 0, 0, 0, 1, 1,
-0.8439117, -1.453646, -1.119073, 0, 0, 0, 1, 1,
-0.8433306, -0.4636001, -2.022815, 0, 0, 0, 1, 1,
-0.8411273, 0.08815005, -3.115436, 0, 0, 0, 1, 1,
-0.8373128, -0.1628814, -1.025004, 0, 0, 0, 1, 1,
-0.8347979, -1.019491, -1.476372, 0, 0, 0, 1, 1,
-0.8250005, -1.257253, -3.661597, 0, 0, 0, 1, 1,
-0.8210603, -0.6446002, -0.3114525, 1, 1, 1, 1, 1,
-0.8207675, -0.3595262, -0.5866556, 1, 1, 1, 1, 1,
-0.8189845, 1.126226, -1.422535, 1, 1, 1, 1, 1,
-0.8131158, -0.1240763, -2.496315, 1, 1, 1, 1, 1,
-0.8127053, -0.3192732, -1.89202, 1, 1, 1, 1, 1,
-0.8074669, -1.21417, -1.650921, 1, 1, 1, 1, 1,
-0.8060362, -0.3433502, -1.551416, 1, 1, 1, 1, 1,
-0.8060048, 1.262511, -0.5087828, 1, 1, 1, 1, 1,
-0.8007886, 0.4417093, -0.9778525, 1, 1, 1, 1, 1,
-0.7970774, 1.309749, -1.25183, 1, 1, 1, 1, 1,
-0.7959552, -0.1335018, -3.119781, 1, 1, 1, 1, 1,
-0.7927697, 0.7782291, -1.184932, 1, 1, 1, 1, 1,
-0.7892628, 0.3434861, -0.05226392, 1, 1, 1, 1, 1,
-0.7878228, -1.629345, -3.228998, 1, 1, 1, 1, 1,
-0.7831846, 0.1906144, -0.1856911, 1, 1, 1, 1, 1,
-0.7778001, 0.9902636, -1.780646, 0, 0, 1, 1, 1,
-0.7734011, -3.255559, -3.287648, 1, 0, 0, 1, 1,
-0.7683113, -0.8701875, -4.042565, 1, 0, 0, 1, 1,
-0.7680366, -0.3654764, -1.666636, 1, 0, 0, 1, 1,
-0.7667741, 0.8117464, -0.483784, 1, 0, 0, 1, 1,
-0.7622077, -1.115134, -1.445284, 1, 0, 0, 1, 1,
-0.7560592, -0.586278, -1.629181, 0, 0, 0, 1, 1,
-0.7456889, 0.6464171, -0.4313652, 0, 0, 0, 1, 1,
-0.7429149, 0.05279937, -2.256536, 0, 0, 0, 1, 1,
-0.7418242, 0.1264465, -3.090206, 0, 0, 0, 1, 1,
-0.7415452, 1.434443, -0.140272, 0, 0, 0, 1, 1,
-0.7332091, 0.619638, -0.9304283, 0, 0, 0, 1, 1,
-0.7322222, -0.5861133, -1.235728, 0, 0, 0, 1, 1,
-0.7291797, -1.756912, -2.28451, 1, 1, 1, 1, 1,
-0.7228196, -1.079392, -2.604603, 1, 1, 1, 1, 1,
-0.7205049, -0.4572647, -3.406479, 1, 1, 1, 1, 1,
-0.7191749, 1.296609, -1.173398, 1, 1, 1, 1, 1,
-0.7139616, -0.3720555, -1.304484, 1, 1, 1, 1, 1,
-0.7132909, -0.4718728, -2.050325, 1, 1, 1, 1, 1,
-0.7128026, -0.6464161, -1.696491, 1, 1, 1, 1, 1,
-0.7117026, 0.692362, 0.9722468, 1, 1, 1, 1, 1,
-0.7094181, -1.645333, -3.206505, 1, 1, 1, 1, 1,
-0.7034433, 0.4860848, -0.1299546, 1, 1, 1, 1, 1,
-0.7028498, 0.4874752, -0.6942143, 1, 1, 1, 1, 1,
-0.7023406, -0.05167393, -2.815487, 1, 1, 1, 1, 1,
-0.7001289, 1.617215, 0.2028044, 1, 1, 1, 1, 1,
-0.699596, 0.7384132, -0.00871576, 1, 1, 1, 1, 1,
-0.6960268, -0.9864795, -1.659131, 1, 1, 1, 1, 1,
-0.6949359, 0.2860294, -2.571677, 0, 0, 1, 1, 1,
-0.6948908, -0.0570526, -0.8318137, 1, 0, 0, 1, 1,
-0.6912641, 0.695659, 0.04111248, 1, 0, 0, 1, 1,
-0.6869964, -1.264968, -0.64982, 1, 0, 0, 1, 1,
-0.6841075, -0.7188223, -3.182489, 1, 0, 0, 1, 1,
-0.6807879, -0.5637402, -3.481196, 1, 0, 0, 1, 1,
-0.6755398, -0.2861837, -1.998643, 0, 0, 0, 1, 1,
-0.6714217, -1.406034, -3.136292, 0, 0, 0, 1, 1,
-0.6698624, 0.3373638, 1.436606, 0, 0, 0, 1, 1,
-0.6623795, 1.689926, 0.1562486, 0, 0, 0, 1, 1,
-0.6618627, -0.6914502, -2.560014, 0, 0, 0, 1, 1,
-0.6584454, 1.389157, 0.5154084, 0, 0, 0, 1, 1,
-0.6539609, 0.3087365, -1.68038, 0, 0, 0, 1, 1,
-0.6500772, -0.795278, -2.150806, 1, 1, 1, 1, 1,
-0.6470402, 0.3352215, -0.1680469, 1, 1, 1, 1, 1,
-0.6405465, 1.356281, -0.1108622, 1, 1, 1, 1, 1,
-0.6391221, 0.3531848, 0.05868042, 1, 1, 1, 1, 1,
-0.6370649, -1.171445, -3.058027, 1, 1, 1, 1, 1,
-0.6363747, 0.4910322, -0.3220231, 1, 1, 1, 1, 1,
-0.6362552, 0.5942874, -0.3642618, 1, 1, 1, 1, 1,
-0.6337647, 1.283121, 0.2384289, 1, 1, 1, 1, 1,
-0.6303031, 1.292224, -0.6674054, 1, 1, 1, 1, 1,
-0.6286533, 0.8050503, -2.784346, 1, 1, 1, 1, 1,
-0.6278243, 0.116878, -1.845188, 1, 1, 1, 1, 1,
-0.6251233, 0.3412203, -2.167682, 1, 1, 1, 1, 1,
-0.6241366, 2.572246, -1.716695, 1, 1, 1, 1, 1,
-0.6228502, 0.261733, -1.04282, 1, 1, 1, 1, 1,
-0.6181834, -0.2880492, -2.992682, 1, 1, 1, 1, 1,
-0.6166819, -0.2547583, -0.6852255, 0, 0, 1, 1, 1,
-0.6140401, 1.136566, 0.3279648, 1, 0, 0, 1, 1,
-0.6065201, 2.714112, -0.5692954, 1, 0, 0, 1, 1,
-0.6030039, -0.5591245, -2.918943, 1, 0, 0, 1, 1,
-0.6005633, -0.6454304, -2.896469, 1, 0, 0, 1, 1,
-0.5986037, -1.032518, -2.64529, 1, 0, 0, 1, 1,
-0.597401, -0.5619555, -1.823381, 0, 0, 0, 1, 1,
-0.5966681, 1.496635, 0.6923786, 0, 0, 0, 1, 1,
-0.591665, -0.776274, -3.207123, 0, 0, 0, 1, 1,
-0.5889848, -0.6271435, -3.128409, 0, 0, 0, 1, 1,
-0.5884439, 0.8764026, -2.556353, 0, 0, 0, 1, 1,
-0.5881237, -0.342402, -2.260384, 0, 0, 0, 1, 1,
-0.5854406, 1.268362, 0.445955, 0, 0, 0, 1, 1,
-0.5825622, -1.771869, -3.257261, 1, 1, 1, 1, 1,
-0.5819784, -1.061583, -2.973048, 1, 1, 1, 1, 1,
-0.5801463, -0.4572068, -1.073424, 1, 1, 1, 1, 1,
-0.5637472, -1.087011, -2.220981, 1, 1, 1, 1, 1,
-0.5615252, -0.782477, -3.595581, 1, 1, 1, 1, 1,
-0.5594785, 0.5702577, -0.8439777, 1, 1, 1, 1, 1,
-0.5577089, 0.2470298, -0.7468548, 1, 1, 1, 1, 1,
-0.5536377, -0.0440206, -1.036486, 1, 1, 1, 1, 1,
-0.549157, -0.09752172, 0.9575535, 1, 1, 1, 1, 1,
-0.5440178, 0.5748307, -2.920413, 1, 1, 1, 1, 1,
-0.5434477, 0.07646126, -2.2721, 1, 1, 1, 1, 1,
-0.5428002, -1.678752, -3.765954, 1, 1, 1, 1, 1,
-0.5372633, -1.04914, -3.072984, 1, 1, 1, 1, 1,
-0.533573, 0.2476635, -0.6339492, 1, 1, 1, 1, 1,
-0.5309419, 1.877321, -0.8464365, 1, 1, 1, 1, 1,
-0.5270559, 0.2895719, -1.209496, 0, 0, 1, 1, 1,
-0.5253651, -0.13875, -2.055401, 1, 0, 0, 1, 1,
-0.5210729, -1.108593, -3.209721, 1, 0, 0, 1, 1,
-0.5178277, 1.203026, 0.1705528, 1, 0, 0, 1, 1,
-0.5165669, 1.399877, -0.4954863, 1, 0, 0, 1, 1,
-0.5159031, -0.7712969, -3.695514, 1, 0, 0, 1, 1,
-0.5116814, -1.05781, -2.834253, 0, 0, 0, 1, 1,
-0.5091146, -0.7602786, -3.430199, 0, 0, 0, 1, 1,
-0.5063292, -0.7412341, -1.575882, 0, 0, 0, 1, 1,
-0.5009597, -0.1919433, -4.284468, 0, 0, 0, 1, 1,
-0.4968521, -0.7746584, -1.596341, 0, 0, 0, 1, 1,
-0.4937049, -2.912899, -5.101989, 0, 0, 0, 1, 1,
-0.4895011, -0.9459243, -2.223249, 0, 0, 0, 1, 1,
-0.4890598, 1.635824, -2.336603, 1, 1, 1, 1, 1,
-0.4884156, 0.5040147, 0.122903, 1, 1, 1, 1, 1,
-0.4880778, 1.056126, 0.03146616, 1, 1, 1, 1, 1,
-0.4854649, -0.4140452, -2.397118, 1, 1, 1, 1, 1,
-0.4805088, -1.279293, -4.267205, 1, 1, 1, 1, 1,
-0.4793369, 0.05187362, 1.543734, 1, 1, 1, 1, 1,
-0.4784128, -0.6626306, -0.7609939, 1, 1, 1, 1, 1,
-0.4765549, 0.01652754, -3.52863, 1, 1, 1, 1, 1,
-0.4727697, -0.4006029, -2.817772, 1, 1, 1, 1, 1,
-0.4701118, -0.1377442, -2.185381, 1, 1, 1, 1, 1,
-0.4650804, -0.4272614, -1.109014, 1, 1, 1, 1, 1,
-0.4505376, -0.5453791, -5.119165, 1, 1, 1, 1, 1,
-0.4481071, 1.119132, -1.379045, 1, 1, 1, 1, 1,
-0.4394442, 0.5392663, 0.1548961, 1, 1, 1, 1, 1,
-0.436534, 0.1438215, -1.554971, 1, 1, 1, 1, 1,
-0.4354089, -0.2387349, -0.4325085, 0, 0, 1, 1, 1,
-0.4329931, -0.4670386, -2.593109, 1, 0, 0, 1, 1,
-0.4328018, -0.3807348, -1.050068, 1, 0, 0, 1, 1,
-0.4326221, 0.8776261, -1.08536, 1, 0, 0, 1, 1,
-0.4314278, -1.973988, -2.901919, 1, 0, 0, 1, 1,
-0.4235539, -1.308243, -2.665415, 1, 0, 0, 1, 1,
-0.4163901, -1.120875, -2.033463, 0, 0, 0, 1, 1,
-0.4160589, 0.041452, 0.2648499, 0, 0, 0, 1, 1,
-0.4115912, 0.4089063, -0.2616949, 0, 0, 0, 1, 1,
-0.411286, 1.294327, -0.1615598, 0, 0, 0, 1, 1,
-0.4112589, 1.718397, -0.2259707, 0, 0, 0, 1, 1,
-0.408984, 1.264434, -0.9690363, 0, 0, 0, 1, 1,
-0.4047745, 0.1834289, 0.06623651, 0, 0, 0, 1, 1,
-0.4017273, -2.34519, -5.374659, 1, 1, 1, 1, 1,
-0.4009673, 0.3617241, -2.144374, 1, 1, 1, 1, 1,
-0.4001817, 0.399035, -1.474828, 1, 1, 1, 1, 1,
-0.3954169, -0.03786781, -0.3687665, 1, 1, 1, 1, 1,
-0.3952367, -1.939636, -3.66133, 1, 1, 1, 1, 1,
-0.3918186, 0.4440418, -0.4933933, 1, 1, 1, 1, 1,
-0.3916605, 1.464992, -0.1277582, 1, 1, 1, 1, 1,
-0.3902127, -1.641667, -3.991593, 1, 1, 1, 1, 1,
-0.387566, -0.07218044, -0.7235773, 1, 1, 1, 1, 1,
-0.3868684, 0.7686718, -2.982128, 1, 1, 1, 1, 1,
-0.3827744, -0.6282958, -2.81676, 1, 1, 1, 1, 1,
-0.3807009, -1.766458, -2.91751, 1, 1, 1, 1, 1,
-0.380614, -1.891548, -1.701968, 1, 1, 1, 1, 1,
-0.3781715, 0.6930336, 1.009203, 1, 1, 1, 1, 1,
-0.371227, 2.839842, -0.5415912, 1, 1, 1, 1, 1,
-0.3704971, 1.792113, 1.35162, 0, 0, 1, 1, 1,
-0.3691898, 1.379761, -2.308172, 1, 0, 0, 1, 1,
-0.3689689, -0.2914858, -1.76327, 1, 0, 0, 1, 1,
-0.3624631, -1.333896, -1.121247, 1, 0, 0, 1, 1,
-0.3620631, -0.9110273, -3.100366, 1, 0, 0, 1, 1,
-0.3616594, 0.5125647, -1.603509, 1, 0, 0, 1, 1,
-0.3587822, 0.05530274, -0.8036665, 0, 0, 0, 1, 1,
-0.353088, -0.6425136, -2.606111, 0, 0, 0, 1, 1,
-0.3501551, 0.757407, -1.438777, 0, 0, 0, 1, 1,
-0.3497253, -0.7160921, -2.936431, 0, 0, 0, 1, 1,
-0.3468706, -0.7362592, -2.311967, 0, 0, 0, 1, 1,
-0.3459403, -1.494959, -3.093906, 0, 0, 0, 1, 1,
-0.3448871, -0.716052, -0.8164485, 0, 0, 0, 1, 1,
-0.3421555, -0.03103706, -2.45168, 1, 1, 1, 1, 1,
-0.3373446, -1.414424, -2.235563, 1, 1, 1, 1, 1,
-0.3362488, 0.02694487, -2.360597, 1, 1, 1, 1, 1,
-0.3324944, 1.654454, -0.1160526, 1, 1, 1, 1, 1,
-0.32473, -0.6027384, -2.871892, 1, 1, 1, 1, 1,
-0.3244258, 0.6429937, -1.044533, 1, 1, 1, 1, 1,
-0.3240417, 2.01433, 0.93374, 1, 1, 1, 1, 1,
-0.3235559, -0.06621335, -0.3088202, 1, 1, 1, 1, 1,
-0.3175239, 0.7152066, -1.840842, 1, 1, 1, 1, 1,
-0.3155628, -0.3777374, -3.763819, 1, 1, 1, 1, 1,
-0.3153017, 0.2721401, -2.049695, 1, 1, 1, 1, 1,
-0.3096891, 0.7375584, -0.04873674, 1, 1, 1, 1, 1,
-0.3075118, -0.01727335, -1.151551, 1, 1, 1, 1, 1,
-0.3061924, 0.5932085, -0.6211064, 1, 1, 1, 1, 1,
-0.2993177, 0.1906393, -1.1035, 1, 1, 1, 1, 1,
-0.2969301, -0.2578368, -4.24581, 0, 0, 1, 1, 1,
-0.2953206, 0.3196098, 0.4855406, 1, 0, 0, 1, 1,
-0.2949591, -0.546434, -2.247781, 1, 0, 0, 1, 1,
-0.2912633, -0.06351443, -3.3424, 1, 0, 0, 1, 1,
-0.2898342, 0.8423218, -1.343648, 1, 0, 0, 1, 1,
-0.2870364, 1.158337, -0.5670194, 1, 0, 0, 1, 1,
-0.286748, -0.1181793, -0.4301591, 0, 0, 0, 1, 1,
-0.2849223, 0.6608676, 0.9094589, 0, 0, 0, 1, 1,
-0.2841477, 1.085807, -0.4154814, 0, 0, 0, 1, 1,
-0.2723324, -0.9154059, -2.486536, 0, 0, 0, 1, 1,
-0.269473, 0.2167642, -1.545339, 0, 0, 0, 1, 1,
-0.2688988, 2.056623, -0.2568432, 0, 0, 0, 1, 1,
-0.2677995, -1.402404, -2.084017, 0, 0, 0, 1, 1,
-0.265784, 0.464283, 1.895202, 1, 1, 1, 1, 1,
-0.2613119, 0.6013865, -0.3130095, 1, 1, 1, 1, 1,
-0.2580479, 0.165415, -0.5852659, 1, 1, 1, 1, 1,
-0.2536437, -0.5997123, -2.750481, 1, 1, 1, 1, 1,
-0.2481276, -0.7695481, -5.21058, 1, 1, 1, 1, 1,
-0.245848, -1.916619, -4.2437, 1, 1, 1, 1, 1,
-0.2441794, 0.7823995, -1.776963, 1, 1, 1, 1, 1,
-0.243693, 2.311242, -1.118022, 1, 1, 1, 1, 1,
-0.2436929, -0.7049451, -1.751346, 1, 1, 1, 1, 1,
-0.2385287, 0.7241733, -1.251191, 1, 1, 1, 1, 1,
-0.2383357, -0.7858084, -1.918765, 1, 1, 1, 1, 1,
-0.2371833, -0.007987138, -1.594409, 1, 1, 1, 1, 1,
-0.2357053, 0.6479618, -0.3204255, 1, 1, 1, 1, 1,
-0.2351353, -0.1574675, -0.1694165, 1, 1, 1, 1, 1,
-0.2324918, -0.4972531, -2.73704, 1, 1, 1, 1, 1,
-0.2275317, 0.8003874, -0.9160164, 0, 0, 1, 1, 1,
-0.2264284, 0.3621207, -0.5213094, 1, 0, 0, 1, 1,
-0.2226938, 0.3495924, -0.9047767, 1, 0, 0, 1, 1,
-0.2152429, -0.07648923, -3.675004, 1, 0, 0, 1, 1,
-0.2076941, -2.267122, -3.707163, 1, 0, 0, 1, 1,
-0.2044422, -0.9319224, -3.372923, 1, 0, 0, 1, 1,
-0.1998971, 0.4162402, -0.5911835, 0, 0, 0, 1, 1,
-0.1995426, 0.4666601, -0.8153459, 0, 0, 0, 1, 1,
-0.1966702, -0.6430311, -4.008748, 0, 0, 0, 1, 1,
-0.1939863, 1.145068, 0.3747751, 0, 0, 0, 1, 1,
-0.1939286, -1.27302, -3.76087, 0, 0, 0, 1, 1,
-0.1937087, -1.378896, -2.538576, 0, 0, 0, 1, 1,
-0.1870996, 0.1390892, -1.469753, 0, 0, 0, 1, 1,
-0.1856474, 1.472695, 0.4066108, 1, 1, 1, 1, 1,
-0.1853615, -1.067558, -3.587905, 1, 1, 1, 1, 1,
-0.185047, -0.1147816, -0.7880464, 1, 1, 1, 1, 1,
-0.1827714, -0.5599535, -2.255487, 1, 1, 1, 1, 1,
-0.1816613, -1.575234, -3.795584, 1, 1, 1, 1, 1,
-0.1814028, 0.5435009, -0.6591733, 1, 1, 1, 1, 1,
-0.1797047, 0.468394, -0.6766826, 1, 1, 1, 1, 1,
-0.1772348, 0.8140153, -0.4537799, 1, 1, 1, 1, 1,
-0.1768716, 0.9829934, -0.04438614, 1, 1, 1, 1, 1,
-0.1718526, 0.2563653, -0.3910542, 1, 1, 1, 1, 1,
-0.1687359, 0.2895211, -0.4286653, 1, 1, 1, 1, 1,
-0.1670562, -0.7261708, -2.723907, 1, 1, 1, 1, 1,
-0.1644653, 0.2469371, -2.070694, 1, 1, 1, 1, 1,
-0.1624802, 2.142156, 1.143783, 1, 1, 1, 1, 1,
-0.1607654, 0.6509115, -0.383435, 1, 1, 1, 1, 1,
-0.1581397, -1.053529, -2.012084, 0, 0, 1, 1, 1,
-0.1554546, 0.6815783, -0.4666986, 1, 0, 0, 1, 1,
-0.1550651, -0.5978706, -1.860387, 1, 0, 0, 1, 1,
-0.1542591, 0.4757164, 0.6575153, 1, 0, 0, 1, 1,
-0.1536629, -0.7362102, -2.143888, 1, 0, 0, 1, 1,
-0.1528607, 0.02321308, -1.990763, 1, 0, 0, 1, 1,
-0.1492418, 0.318701, -0.4509952, 0, 0, 0, 1, 1,
-0.1473493, -1.369471, -2.883561, 0, 0, 0, 1, 1,
-0.1382719, 1.010283, -0.02202916, 0, 0, 0, 1, 1,
-0.1282398, 1.302315, -1.329765, 0, 0, 0, 1, 1,
-0.1194623, 1.095411, 1.203675, 0, 0, 0, 1, 1,
-0.1178217, 1.028303, -2.890968, 0, 0, 0, 1, 1,
-0.1174242, -0.1724454, -2.243074, 0, 0, 0, 1, 1,
-0.1148626, 0.974862, 0.5716867, 1, 1, 1, 1, 1,
-0.1126024, -0.8562989, -3.891487, 1, 1, 1, 1, 1,
-0.1077655, 0.6054171, -1.012725, 1, 1, 1, 1, 1,
-0.10772, 0.839714, -0.2227995, 1, 1, 1, 1, 1,
-0.1069781, -0.01227675, -1.834482, 1, 1, 1, 1, 1,
-0.1062263, -0.3516439, -4.325648, 1, 1, 1, 1, 1,
-0.09939564, -0.4706981, -2.453892, 1, 1, 1, 1, 1,
-0.09382573, 0.01053022, -1.847291, 1, 1, 1, 1, 1,
-0.0930822, 0.07723569, -0.06298989, 1, 1, 1, 1, 1,
-0.09232698, 0.5127531, -0.1278743, 1, 1, 1, 1, 1,
-0.09232255, 0.1636315, 0.8278476, 1, 1, 1, 1, 1,
-0.09169796, 1.451698, 1.476711, 1, 1, 1, 1, 1,
-0.08329664, 0.05907991, 0.2915244, 1, 1, 1, 1, 1,
-0.07872153, 1.829947, -0.6154923, 1, 1, 1, 1, 1,
-0.07010339, 0.30192, -1.141506, 1, 1, 1, 1, 1,
-0.06913869, 0.476972, 0.2435427, 0, 0, 1, 1, 1,
-0.06585472, -0.9928423, -4.791338, 1, 0, 0, 1, 1,
-0.06525625, 0.3158794, -1.583007, 1, 0, 0, 1, 1,
-0.06406558, -0.3013588, -1.867855, 1, 0, 0, 1, 1,
-0.06321938, -0.4013203, -4.49272, 1, 0, 0, 1, 1,
-0.06201365, -0.1925411, -1.758662, 1, 0, 0, 1, 1,
-0.06191865, 1.111797, 1.077433, 0, 0, 0, 1, 1,
-0.06035605, 1.199942, -0.2432652, 0, 0, 0, 1, 1,
-0.04869792, 0.7190171, -3.138692, 0, 0, 0, 1, 1,
-0.04764062, -1.141706, -3.649919, 0, 0, 0, 1, 1,
-0.04681709, 1.107056, -0.5347638, 0, 0, 0, 1, 1,
-0.04319883, 0.02384304, 0.4782286, 0, 0, 0, 1, 1,
-0.04141481, 0.3765658, 1.500962, 0, 0, 0, 1, 1,
-0.04044756, 0.8040531, 1.167124, 1, 1, 1, 1, 1,
-0.03982863, 1.141634, 1.249325, 1, 1, 1, 1, 1,
-0.03765091, 1.184469, -0.479037, 1, 1, 1, 1, 1,
-0.03728378, -0.7361459, -2.238759, 1, 1, 1, 1, 1,
-0.03691331, -0.678782, -1.990441, 1, 1, 1, 1, 1,
-0.03386365, 1.586893, 1.317017, 1, 1, 1, 1, 1,
-0.03044556, -0.5722171, -3.282124, 1, 1, 1, 1, 1,
-0.02891172, -0.4068724, -2.474715, 1, 1, 1, 1, 1,
-0.0268814, -2.154391, -4.445722, 1, 1, 1, 1, 1,
-0.0260752, 1.311577, 0.3943542, 1, 1, 1, 1, 1,
-0.02546157, 0.228961, -1.025242, 1, 1, 1, 1, 1,
-0.02305436, -0.4285893, -1.997836, 1, 1, 1, 1, 1,
-0.02170295, -1.770264, -2.393007, 1, 1, 1, 1, 1,
-0.02075127, 1.218388, -0.3188127, 1, 1, 1, 1, 1,
-0.02066992, 1.099207, -1.023788, 1, 1, 1, 1, 1,
-0.0202226, 0.4239729, 0.9026782, 0, 0, 1, 1, 1,
-0.01908917, 0.5272528, -0.4820567, 1, 0, 0, 1, 1,
-0.01722427, -1.586638, -4.492988, 1, 0, 0, 1, 1,
-0.01551227, 1.403447, -0.6755549, 1, 0, 0, 1, 1,
-0.01499559, 1.437033, -0.5759902, 1, 0, 0, 1, 1,
-0.0140748, 0.1806832, -0.4648686, 1, 0, 0, 1, 1,
-0.01228205, -1.250336, -1.917903, 0, 0, 0, 1, 1,
-0.005734375, -1.183317, -2.354043, 0, 0, 0, 1, 1,
0.002025555, 1.947689, 2.056005, 0, 0, 0, 1, 1,
0.002121302, 0.5355638, 1.00015, 0, 0, 0, 1, 1,
0.003317015, 0.0565385, 0.3157264, 0, 0, 0, 1, 1,
0.00640456, -0.6666229, 3.44536, 0, 0, 0, 1, 1,
0.009900713, 1.023466, -0.687381, 0, 0, 0, 1, 1,
0.01142065, 0.5198756, 0.09660346, 1, 1, 1, 1, 1,
0.01341881, -1.49381, 3.39429, 1, 1, 1, 1, 1,
0.01667419, -2.002015, 2.011404, 1, 1, 1, 1, 1,
0.01815763, -0.158375, 2.115735, 1, 1, 1, 1, 1,
0.01956797, 0.8597264, 1.54124, 1, 1, 1, 1, 1,
0.02222756, 0.4042552, -0.1903436, 1, 1, 1, 1, 1,
0.02638331, -1.55052, 3.253984, 1, 1, 1, 1, 1,
0.02992236, -0.2117648, 2.603329, 1, 1, 1, 1, 1,
0.04009972, 1.496264, 0.9211305, 1, 1, 1, 1, 1,
0.04055598, -0.8141674, 2.462695, 1, 1, 1, 1, 1,
0.04990256, -0.4357467, 1.979971, 1, 1, 1, 1, 1,
0.05069434, 0.9485402, 1.106563, 1, 1, 1, 1, 1,
0.05142289, -1.087644, 2.899735, 1, 1, 1, 1, 1,
0.05158006, -0.7722185, 3.970394, 1, 1, 1, 1, 1,
0.05288498, -0.4927022, 2.950178, 1, 1, 1, 1, 1,
0.05392721, -0.3831763, 5.557417, 0, 0, 1, 1, 1,
0.05602106, -0.3097671, 2.786965, 1, 0, 0, 1, 1,
0.05761168, -1.327956, 3.955637, 1, 0, 0, 1, 1,
0.05839788, -1.078357, 3.716013, 1, 0, 0, 1, 1,
0.06331266, 0.6046147, -0.8532668, 1, 0, 0, 1, 1,
0.06376906, 0.6783255, -1.639339, 1, 0, 0, 1, 1,
0.06436002, -0.7974339, 3.672439, 0, 0, 0, 1, 1,
0.06754558, -0.5555461, 1.861066, 0, 0, 0, 1, 1,
0.06759601, -0.1126075, 3.360171, 0, 0, 0, 1, 1,
0.0706183, -0.7096285, 3.289712, 0, 0, 0, 1, 1,
0.07502025, -0.1897042, 3.694198, 0, 0, 0, 1, 1,
0.07664686, 1.055822, -0.5380539, 0, 0, 0, 1, 1,
0.08017296, -0.3768528, 1.762262, 0, 0, 0, 1, 1,
0.08136714, -1.395163, 3.097299, 1, 1, 1, 1, 1,
0.08414557, 0.6784931, -0.5767168, 1, 1, 1, 1, 1,
0.09702169, -0.08140827, 4.724087, 1, 1, 1, 1, 1,
0.1012226, 1.486973, 0.5652429, 1, 1, 1, 1, 1,
0.1021966, -0.08010627, 2.985293, 1, 1, 1, 1, 1,
0.1069501, -0.044672, 2.323055, 1, 1, 1, 1, 1,
0.1076428, 0.1553818, -0.4206296, 1, 1, 1, 1, 1,
0.1132057, 0.7114567, 1.320966, 1, 1, 1, 1, 1,
0.1162877, 0.8984789, 0.02499031, 1, 1, 1, 1, 1,
0.1164452, 0.7426045, -0.6511539, 1, 1, 1, 1, 1,
0.1228215, 1.411849, 2.334055, 1, 1, 1, 1, 1,
0.124055, 1.375588, 1.132063, 1, 1, 1, 1, 1,
0.1343068, 0.6781952, -0.9004534, 1, 1, 1, 1, 1,
0.13486, -0.1133608, 1.134678, 1, 1, 1, 1, 1,
0.1376188, -1.163626, 5.122988, 1, 1, 1, 1, 1,
0.138602, 0.3309984, -1.742109, 0, 0, 1, 1, 1,
0.1394819, 1.791976, -0.3490869, 1, 0, 0, 1, 1,
0.1397737, -0.9240319, 2.812061, 1, 0, 0, 1, 1,
0.1413892, 0.5913232, 0.2067055, 1, 0, 0, 1, 1,
0.1416058, 0.3885038, 0.8409933, 1, 0, 0, 1, 1,
0.147685, -1.216329, 3.262809, 1, 0, 0, 1, 1,
0.1493558, -3.188932, 2.163552, 0, 0, 0, 1, 1,
0.1541519, 2.085957, -0.4636102, 0, 0, 0, 1, 1,
0.1589622, -0.9634653, 3.482157, 0, 0, 0, 1, 1,
0.1748095, 0.06486281, 0.727865, 0, 0, 0, 1, 1,
0.1752695, -0.6617862, 1.958134, 0, 0, 0, 1, 1,
0.1766873, 0.9587526, 0.5522839, 0, 0, 0, 1, 1,
0.1811816, -0.6950427, 1.381884, 0, 0, 0, 1, 1,
0.1822718, 1.500847, -1.423274, 1, 1, 1, 1, 1,
0.1822889, -0.4110009, 1.882623, 1, 1, 1, 1, 1,
0.1826068, -1.44611, 4.119859, 1, 1, 1, 1, 1,
0.1829995, 0.3502823, 0.5007184, 1, 1, 1, 1, 1,
0.1872768, -0.3135531, 4.073578, 1, 1, 1, 1, 1,
0.1924523, 0.1588118, 2.164904, 1, 1, 1, 1, 1,
0.1970378, 1.070814, 1.047072, 1, 1, 1, 1, 1,
0.1970727, 0.798916, 0.5193141, 1, 1, 1, 1, 1,
0.1977983, 0.5547022, 1.248218, 1, 1, 1, 1, 1,
0.1980652, 1.581298, -0.103734, 1, 1, 1, 1, 1,
0.2016603, -0.500114, 1.187291, 1, 1, 1, 1, 1,
0.2035912, -0.823674, 4.189522, 1, 1, 1, 1, 1,
0.203789, -0.1578932, 1.962534, 1, 1, 1, 1, 1,
0.2045151, 0.6358457, -0.1923816, 1, 1, 1, 1, 1,
0.2056362, 0.1551678, 1.370518, 1, 1, 1, 1, 1,
0.2165791, 0.08751411, -0.5310733, 0, 0, 1, 1, 1,
0.217882, 0.1053162, 0.6833978, 1, 0, 0, 1, 1,
0.2208258, 1.041841, 1.358096, 1, 0, 0, 1, 1,
0.222776, -1.035275, 1.17802, 1, 0, 0, 1, 1,
0.2237896, 0.5753415, 1.143044, 1, 0, 0, 1, 1,
0.2278232, 1.656203, -0.499896, 1, 0, 0, 1, 1,
0.2297025, 0.2393444, -0.4738888, 0, 0, 0, 1, 1,
0.2320529, -0.2263155, 2.038797, 0, 0, 0, 1, 1,
0.237224, -1.421942, 2.223008, 0, 0, 0, 1, 1,
0.2382144, -0.2236246, 1.730778, 0, 0, 0, 1, 1,
0.2383543, 0.5436714, 0.858579, 0, 0, 0, 1, 1,
0.2398918, -0.1082411, 1.795719, 0, 0, 0, 1, 1,
0.2474384, -0.3355241, 2.490909, 0, 0, 0, 1, 1,
0.24985, -0.9847657, 1.631472, 1, 1, 1, 1, 1,
0.2517775, 1.378669, 2.751722, 1, 1, 1, 1, 1,
0.2536725, -0.4216591, 1.635246, 1, 1, 1, 1, 1,
0.2555495, -1.418581, 4.548621, 1, 1, 1, 1, 1,
0.258984, 0.1138989, 2.513683, 1, 1, 1, 1, 1,
0.2621809, -1.406976, 1.898893, 1, 1, 1, 1, 1,
0.2631415, 1.567949, -0.04173249, 1, 1, 1, 1, 1,
0.2648348, 0.4738749, 1.049485, 1, 1, 1, 1, 1,
0.2653789, -0.3106659, 2.202632, 1, 1, 1, 1, 1,
0.2692412, -0.1620579, 2.88044, 1, 1, 1, 1, 1,
0.2707717, -0.7629403, 4.002089, 1, 1, 1, 1, 1,
0.2726116, 0.1985864, 0.7066905, 1, 1, 1, 1, 1,
0.2740367, 0.6928174, -1.157827, 1, 1, 1, 1, 1,
0.2751701, 0.2083671, 1.934568, 1, 1, 1, 1, 1,
0.276265, -2.801931, 3.199856, 1, 1, 1, 1, 1,
0.2815361, -0.3948052, 3.463753, 0, 0, 1, 1, 1,
0.2826651, 0.2325615, 1.224963, 1, 0, 0, 1, 1,
0.2880881, 1.068294, 0.8774819, 1, 0, 0, 1, 1,
0.2906144, -0.8847096, 1.974236, 1, 0, 0, 1, 1,
0.2913226, -0.9935611, 3.28172, 1, 0, 0, 1, 1,
0.2944675, 0.7250208, -0.02759321, 1, 0, 0, 1, 1,
0.2954328, 0.0948372, 0.1878765, 0, 0, 0, 1, 1,
0.295485, -1.523457, 2.5799, 0, 0, 0, 1, 1,
0.2990072, -0.1434884, 0.9271778, 0, 0, 0, 1, 1,
0.3010481, 0.8807417, 1.253306, 0, 0, 0, 1, 1,
0.3026508, 0.2673123, 0.8995513, 0, 0, 0, 1, 1,
0.3069966, -1.485932, 0.870867, 0, 0, 0, 1, 1,
0.3087469, 0.03344568, 1.929548, 0, 0, 0, 1, 1,
0.3097293, 1.109433, -1.693579, 1, 1, 1, 1, 1,
0.3144902, 0.6060051, 0.2071444, 1, 1, 1, 1, 1,
0.3165498, 0.4374533, 0.8038825, 1, 1, 1, 1, 1,
0.3177759, -0.06676321, 2.388606, 1, 1, 1, 1, 1,
0.3178215, -0.7556423, 3.741447, 1, 1, 1, 1, 1,
0.3186374, 0.5028194, -0.3373267, 1, 1, 1, 1, 1,
0.318795, -0.8155795, 2.821581, 1, 1, 1, 1, 1,
0.3284376, 0.6261954, -0.02594802, 1, 1, 1, 1, 1,
0.3380126, 1.014531, 1.28733, 1, 1, 1, 1, 1,
0.3415387, -1.331852, 3.852627, 1, 1, 1, 1, 1,
0.3416498, 0.06961972, 1.583546, 1, 1, 1, 1, 1,
0.3420863, 0.6797593, -0.09926341, 1, 1, 1, 1, 1,
0.3432501, -0.446077, 2.535912, 1, 1, 1, 1, 1,
0.3445629, 0.8290563, 2.302278, 1, 1, 1, 1, 1,
0.3470711, 0.5670154, 1.686609, 1, 1, 1, 1, 1,
0.3485068, 0.9264832, -0.4561116, 0, 0, 1, 1, 1,
0.3495359, 2.321512, 2.567964, 1, 0, 0, 1, 1,
0.3512021, -2.739805, 3.428928, 1, 0, 0, 1, 1,
0.3549868, 1.41015, 0.5223038, 1, 0, 0, 1, 1,
0.360376, -0.4322498, 4.917068, 1, 0, 0, 1, 1,
0.3606282, -0.5548285, 1.910039, 1, 0, 0, 1, 1,
0.3638217, -1.250491, 3.441197, 0, 0, 0, 1, 1,
0.3698135, -1.314228, 2.518563, 0, 0, 0, 1, 1,
0.3732095, 0.3145998, -0.3317566, 0, 0, 0, 1, 1,
0.3765, -0.4955805, 3.297055, 0, 0, 0, 1, 1,
0.3795396, -0.4758394, 2.380429, 0, 0, 0, 1, 1,
0.38016, -1.461532, 2.960781, 0, 0, 0, 1, 1,
0.3803999, 0.7704118, 0.7119554, 0, 0, 0, 1, 1,
0.3813516, 0.8520219, -1.271561, 1, 1, 1, 1, 1,
0.381386, 0.05670175, 1.994742, 1, 1, 1, 1, 1,
0.3861581, -1.083512, 4.035096, 1, 1, 1, 1, 1,
0.3913097, -0.387171, 1.880114, 1, 1, 1, 1, 1,
0.3975042, 0.7551467, 0.7916021, 1, 1, 1, 1, 1,
0.4014294, 0.4317251, 0.2749083, 1, 1, 1, 1, 1,
0.4033945, 1.33016, -0.6147775, 1, 1, 1, 1, 1,
0.403875, 0.4623181, 1.368428, 1, 1, 1, 1, 1,
0.4051848, 1.480273, -1.769821, 1, 1, 1, 1, 1,
0.4069373, 0.4455076, -1.881676, 1, 1, 1, 1, 1,
0.4072331, -0.9563954, 3.503253, 1, 1, 1, 1, 1,
0.4075648, 0.3681402, 0.6582216, 1, 1, 1, 1, 1,
0.4086208, 0.02630509, 2.564212, 1, 1, 1, 1, 1,
0.4099607, 0.07318225, 1.962568, 1, 1, 1, 1, 1,
0.4106811, -0.1042977, 2.120928, 1, 1, 1, 1, 1,
0.4106899, 1.330628, -0.9332923, 0, 0, 1, 1, 1,
0.4112681, -0.3625441, 3.377684, 1, 0, 0, 1, 1,
0.4172612, -0.7283858, 2.958965, 1, 0, 0, 1, 1,
0.4194742, 0.6210231, 0.933998, 1, 0, 0, 1, 1,
0.419781, 0.0003147588, 2.241362, 1, 0, 0, 1, 1,
0.4208035, 0.1668809, 1.260485, 1, 0, 0, 1, 1,
0.4218513, -1.495851, 3.02442, 0, 0, 0, 1, 1,
0.4221563, -1.138554, 3.163082, 0, 0, 0, 1, 1,
0.425341, -0.1298628, 1.176022, 0, 0, 0, 1, 1,
0.4257274, -0.003413808, 0.2085356, 0, 0, 0, 1, 1,
0.4283417, -1.310837, 1.686292, 0, 0, 0, 1, 1,
0.4337803, -0.2684471, 1.592517, 0, 0, 0, 1, 1,
0.4393779, 2.400028, 0.6098939, 0, 0, 0, 1, 1,
0.4415333, -1.779083, 2.668666, 1, 1, 1, 1, 1,
0.4447829, 0.1254885, 0.3045816, 1, 1, 1, 1, 1,
0.4449497, 0.5241539, 0.8058264, 1, 1, 1, 1, 1,
0.4539392, -0.1063585, 2.035795, 1, 1, 1, 1, 1,
0.4542135, -0.3104864, 2.793816, 1, 1, 1, 1, 1,
0.4548289, -1.087212, 2.85083, 1, 1, 1, 1, 1,
0.4561116, -1.218679, 5.894005, 1, 1, 1, 1, 1,
0.4567214, 0.4177046, 0.4105414, 1, 1, 1, 1, 1,
0.4575559, 0.6731954, 0.03304484, 1, 1, 1, 1, 1,
0.4588544, 1.126526, 0.1806322, 1, 1, 1, 1, 1,
0.4597517, -1.203152, 3.179471, 1, 1, 1, 1, 1,
0.4623106, -1.167732, 1.819272, 1, 1, 1, 1, 1,
0.4625272, -0.4578745, 1.159212, 1, 1, 1, 1, 1,
0.4657384, -0.1852754, 3.588176, 1, 1, 1, 1, 1,
0.4682119, -0.6690651, 3.207319, 1, 1, 1, 1, 1,
0.4731168, 1.525939, -0.7922171, 0, 0, 1, 1, 1,
0.4733473, -0.7451817, 2.014886, 1, 0, 0, 1, 1,
0.4759898, -1.846979, 3.631666, 1, 0, 0, 1, 1,
0.4767618, 0.1576225, 2.823754, 1, 0, 0, 1, 1,
0.4776659, -0.5120298, 2.852732, 1, 0, 0, 1, 1,
0.4812811, 0.4909741, 0.3185881, 1, 0, 0, 1, 1,
0.4846253, 0.2623499, 2.213716, 0, 0, 0, 1, 1,
0.4848854, -0.07729072, 0.5915707, 0, 0, 0, 1, 1,
0.4851605, -1.700998, 1.956841, 0, 0, 0, 1, 1,
0.4935451, -0.4663976, 1.992187, 0, 0, 0, 1, 1,
0.4936113, 0.6972257, 0.8423306, 0, 0, 0, 1, 1,
0.4972206, 0.5373255, 2.101981, 0, 0, 0, 1, 1,
0.4987002, 1.231203, 0.2574912, 0, 0, 0, 1, 1,
0.5007411, 1.526723, 0.4072984, 1, 1, 1, 1, 1,
0.5009515, -0.4658034, 1.898378, 1, 1, 1, 1, 1,
0.5048666, -1.277988, 3.996772, 1, 1, 1, 1, 1,
0.5170094, 0.4336746, -0.1538702, 1, 1, 1, 1, 1,
0.518601, -0.8925064, 3.895868, 1, 1, 1, 1, 1,
0.5192173, -1.103993, 2.065846, 1, 1, 1, 1, 1,
0.51952, -0.4304183, 1.413189, 1, 1, 1, 1, 1,
0.5222476, 0.03406952, 1.433031, 1, 1, 1, 1, 1,
0.530491, -0.8381624, 2.232967, 1, 1, 1, 1, 1,
0.5329937, 0.5850698, 1.782907, 1, 1, 1, 1, 1,
0.5341901, -1.494557, 2.690212, 1, 1, 1, 1, 1,
0.5395564, -0.9882932, 3.173671, 1, 1, 1, 1, 1,
0.540089, 0.6877339, -0.9854978, 1, 1, 1, 1, 1,
0.5493476, 0.06798351, 2.48755, 1, 1, 1, 1, 1,
0.5508924, 0.5702059, 0.4288162, 1, 1, 1, 1, 1,
0.5526823, 0.7989697, -0.674539, 0, 0, 1, 1, 1,
0.553999, 0.4345263, 1.202388, 1, 0, 0, 1, 1,
0.557447, 0.357897, 2.231075, 1, 0, 0, 1, 1,
0.5625206, 0.2694071, 0.7568977, 1, 0, 0, 1, 1,
0.5654576, -1.072566, 2.59435, 1, 0, 0, 1, 1,
0.5685812, -1.010674, 1.309009, 1, 0, 0, 1, 1,
0.5707151, 0.4684385, 0.3900355, 0, 0, 0, 1, 1,
0.5750667, -2.055127, 2.908376, 0, 0, 0, 1, 1,
0.5772383, 0.9376605, 0.6500974, 0, 0, 0, 1, 1,
0.5822421, -0.8867276, 1.530004, 0, 0, 0, 1, 1,
0.5845613, 0.9776919, 0.3930634, 0, 0, 0, 1, 1,
0.5857255, 1.002314, 0.5182566, 0, 0, 0, 1, 1,
0.5865613, -0.8132222, 2.40593, 0, 0, 0, 1, 1,
0.5892585, 2.405292, -1.402256, 1, 1, 1, 1, 1,
0.5916361, -0.1799736, 3.29369, 1, 1, 1, 1, 1,
0.5972328, 1.681516, 0.4618653, 1, 1, 1, 1, 1,
0.6024598, 1.790909, 0.5243276, 1, 1, 1, 1, 1,
0.604474, -0.6531337, 4.19901, 1, 1, 1, 1, 1,
0.608924, -0.4187228, 2.939891, 1, 1, 1, 1, 1,
0.6095491, -0.8998313, 2.954506, 1, 1, 1, 1, 1,
0.6237733, -0.1972589, 2.712913, 1, 1, 1, 1, 1,
0.6281519, -0.9017401, 0.8577108, 1, 1, 1, 1, 1,
0.6284676, 0.05675084, -0.4141282, 1, 1, 1, 1, 1,
0.63257, 1.187133, 0.7006765, 1, 1, 1, 1, 1,
0.6367818, -0.3918606, 2.970531, 1, 1, 1, 1, 1,
0.6376888, -1.541138, 3.046634, 1, 1, 1, 1, 1,
0.6407047, 0.7773696, 0.4469519, 1, 1, 1, 1, 1,
0.6500331, -0.198431, 1.251613, 1, 1, 1, 1, 1,
0.6511034, 1.011175, 0.1465487, 0, 0, 1, 1, 1,
0.6527416, 0.4349664, 1.449919, 1, 0, 0, 1, 1,
0.655366, 0.3401933, 0.2783506, 1, 0, 0, 1, 1,
0.6588182, 1.548489, 1.992467, 1, 0, 0, 1, 1,
0.6597366, 1.286718, 0.6153617, 1, 0, 0, 1, 1,
0.6603788, 0.05061902, 2.041507, 1, 0, 0, 1, 1,
0.6663052, -1.711539, 2.144523, 0, 0, 0, 1, 1,
0.6734229, 0.186263, 1.377867, 0, 0, 0, 1, 1,
0.6734614, 0.7987538, 1.1124, 0, 0, 0, 1, 1,
0.6749031, 0.6778786, 1.688404, 0, 0, 0, 1, 1,
0.677597, -0.2023501, 2.158977, 0, 0, 0, 1, 1,
0.6787867, 1.116611, 0.5059915, 0, 0, 0, 1, 1,
0.6792464, 0.2095479, 0.289194, 0, 0, 0, 1, 1,
0.6839193, -0.004045816, 0.1835902, 1, 1, 1, 1, 1,
0.6856946, -0.2783485, 2.50475, 1, 1, 1, 1, 1,
0.6859196, -1.818058, 3.616484, 1, 1, 1, 1, 1,
0.6878653, 1.203617, 0.7603129, 1, 1, 1, 1, 1,
0.6884658, -0.4044271, 2.01475, 1, 1, 1, 1, 1,
0.6886258, -1.80968, 2.965276, 1, 1, 1, 1, 1,
0.6898646, 0.7135451, -0.4066629, 1, 1, 1, 1, 1,
0.6961414, 0.1584313, 0.8969867, 1, 1, 1, 1, 1,
0.6971107, 0.5504847, 1.672606, 1, 1, 1, 1, 1,
0.6987521, 0.4455887, 1.679582, 1, 1, 1, 1, 1,
0.7045814, 0.1558092, -0.01853548, 1, 1, 1, 1, 1,
0.7050738, 0.7474803, 0.9898894, 1, 1, 1, 1, 1,
0.7068371, -1.28669, 2.571538, 1, 1, 1, 1, 1,
0.7077339, -0.2107235, 1.038558, 1, 1, 1, 1, 1,
0.7175654, -1.057883, 3.271255, 1, 1, 1, 1, 1,
0.7180727, -0.6256375, 3.528101, 0, 0, 1, 1, 1,
0.7186996, 1.060199, 3.014893, 1, 0, 0, 1, 1,
0.7194819, 0.6586848, 0.8670264, 1, 0, 0, 1, 1,
0.7235666, -0.1083542, 0.631391, 1, 0, 0, 1, 1,
0.7248894, -0.2184638, 1.494013, 1, 0, 0, 1, 1,
0.7302378, 2.540279, -0.1483953, 1, 0, 0, 1, 1,
0.7308269, 0.8033276, -0.08772713, 0, 0, 0, 1, 1,
0.7308442, -0.01546814, 1.432442, 0, 0, 0, 1, 1,
0.734601, 0.6234481, 1.739686, 0, 0, 0, 1, 1,
0.7347838, 1.218304, 0.45866, 0, 0, 0, 1, 1,
0.7374418, -0.9058087, 3.489108, 0, 0, 0, 1, 1,
0.7395362, 0.1863113, 0.8326606, 0, 0, 0, 1, 1,
0.7435585, 1.189136, -1.022061, 0, 0, 0, 1, 1,
0.7441515, 0.08086438, 1.610039, 1, 1, 1, 1, 1,
0.7451435, 0.04568362, 0.02141123, 1, 1, 1, 1, 1,
0.7459841, 1.100599, 2.248276, 1, 1, 1, 1, 1,
0.7468972, -1.972566, 2.025125, 1, 1, 1, 1, 1,
0.7472579, -1.03394, 2.522263, 1, 1, 1, 1, 1,
0.7489964, 1.428686, 0.2999389, 1, 1, 1, 1, 1,
0.7494851, -0.6018486, 1.418602, 1, 1, 1, 1, 1,
0.7534121, 0.3912585, 0.91362, 1, 1, 1, 1, 1,
0.7565392, -0.2702922, 0.5492786, 1, 1, 1, 1, 1,
0.7639804, -0.7894011, 1.631502, 1, 1, 1, 1, 1,
0.7640332, -0.2146588, 0.4662457, 1, 1, 1, 1, 1,
0.7655692, -0.5029824, 1.25882, 1, 1, 1, 1, 1,
0.7676317, -0.6604052, 3.33549, 1, 1, 1, 1, 1,
0.7761319, -1.227613, 1.696219, 1, 1, 1, 1, 1,
0.7769324, 0.4370158, 1.763452, 1, 1, 1, 1, 1,
0.7822274, 0.6345605, 0.3096742, 0, 0, 1, 1, 1,
0.7831877, -0.8090757, 1.859054, 1, 0, 0, 1, 1,
0.7866101, -1.756021, 2.380655, 1, 0, 0, 1, 1,
0.7880792, 0.4131994, 1.170088, 1, 0, 0, 1, 1,
0.7912413, -1.093501, 2.920445, 1, 0, 0, 1, 1,
0.8000352, -0.4832663, 1.513319, 1, 0, 0, 1, 1,
0.8017516, -0.5496293, 2.821087, 0, 0, 0, 1, 1,
0.8067767, 0.4979455, 0.04514509, 0, 0, 0, 1, 1,
0.8082973, -1.028871, 2.754947, 0, 0, 0, 1, 1,
0.8094273, -0.09089645, 0.9793949, 0, 0, 0, 1, 1,
0.8102619, -0.7132812, 2.547335, 0, 0, 0, 1, 1,
0.8187148, -0.3709808, 2.385519, 0, 0, 0, 1, 1,
0.8201185, 0.7209406, 0.9126085, 0, 0, 0, 1, 1,
0.8205276, -2.010772, 2.326076, 1, 1, 1, 1, 1,
0.8206606, -0.1166153, 3.158691, 1, 1, 1, 1, 1,
0.8211395, 0.2834492, 0.5085776, 1, 1, 1, 1, 1,
0.8231848, -0.9095211, 3.477231, 1, 1, 1, 1, 1,
0.8251371, -1.358081, 2.050533, 1, 1, 1, 1, 1,
0.8257948, 0.02922003, 1.35033, 1, 1, 1, 1, 1,
0.8318616, 0.8552393, 1.068744, 1, 1, 1, 1, 1,
0.8357677, -1.125865, -0.239525, 1, 1, 1, 1, 1,
0.837564, 1.121199, -0.2110931, 1, 1, 1, 1, 1,
0.8385375, -0.3683018, 0.1993158, 1, 1, 1, 1, 1,
0.839267, -0.005443914, 1.276692, 1, 1, 1, 1, 1,
0.8396349, 0.1623876, 0.6636887, 1, 1, 1, 1, 1,
0.8416178, 0.4600341, -0.04082648, 1, 1, 1, 1, 1,
0.8418277, -0.6733438, 2.472939, 1, 1, 1, 1, 1,
0.8463073, -0.1856112, 1.312706, 1, 1, 1, 1, 1,
0.8481536, 0.1798759, 1.677801, 0, 0, 1, 1, 1,
0.8509994, -0.4496723, 4.25242, 1, 0, 0, 1, 1,
0.85164, 0.7464774, 0.6877939, 1, 0, 0, 1, 1,
0.856725, -1.145034, 1.408717, 1, 0, 0, 1, 1,
0.8575869, -0.6366508, 0.8852366, 1, 0, 0, 1, 1,
0.8775986, 0.5172194, 1.39985, 1, 0, 0, 1, 1,
0.8793342, -0.9545205, 2.796532, 0, 0, 0, 1, 1,
0.8802912, 0.9597171, 1.332805, 0, 0, 0, 1, 1,
0.8858245, -0.8647861, 2.421213, 0, 0, 0, 1, 1,
0.8920199, 1.04729, 0.1403745, 0, 0, 0, 1, 1,
0.8941708, 0.7354122, 0.05232669, 0, 0, 0, 1, 1,
0.8969358, 1.624146, 0.6314994, 0, 0, 0, 1, 1,
0.899713, -0.8703379, 3.892435, 0, 0, 0, 1, 1,
0.9054329, -1.182271, 2.665737, 1, 1, 1, 1, 1,
0.9172121, 0.7184939, 1.329531, 1, 1, 1, 1, 1,
0.9191561, -1.838758, 2.481325, 1, 1, 1, 1, 1,
0.9244019, 0.8346325, 1.813489, 1, 1, 1, 1, 1,
0.9264724, -0.6033861, 1.504638, 1, 1, 1, 1, 1,
0.9307631, 0.3241616, 2.11951, 1, 1, 1, 1, 1,
0.9312162, -1.432533, 3.152351, 1, 1, 1, 1, 1,
0.953224, 0.2670927, 1.650922, 1, 1, 1, 1, 1,
0.9542363, 0.5132921, 0.7539359, 1, 1, 1, 1, 1,
0.9566094, 2.026663, -0.1635113, 1, 1, 1, 1, 1,
0.9629167, 1.117022, 0.08035186, 1, 1, 1, 1, 1,
0.9708217, -1.012816, 1.379801, 1, 1, 1, 1, 1,
0.9732143, 0.150577, 1.500884, 1, 1, 1, 1, 1,
0.9746593, 0.5235032, 1.376531, 1, 1, 1, 1, 1,
0.9828696, -0.02494579, 1.270876, 1, 1, 1, 1, 1,
0.9839566, 0.7963037, 1.02325, 0, 0, 1, 1, 1,
0.998474, 2.216024, -0.2270441, 1, 0, 0, 1, 1,
1.004181, 0.06174601, 1.32991, 1, 0, 0, 1, 1,
1.008118, 0.8820338, 1.843678, 1, 0, 0, 1, 1,
1.010342, -1.224801, 3.463252, 1, 0, 0, 1, 1,
1.017684, 0.4433571, 0.8128768, 1, 0, 0, 1, 1,
1.022211, 1.574598, 1.348746, 0, 0, 0, 1, 1,
1.029796, 0.9817663, 2.221284, 0, 0, 0, 1, 1,
1.031152, -1.255343, 4.143922, 0, 0, 0, 1, 1,
1.031823, -0.4698533, 1.395283, 0, 0, 0, 1, 1,
1.03193, 0.4617503, -0.436574, 0, 0, 0, 1, 1,
1.032022, 1.020653, -0.1712792, 0, 0, 0, 1, 1,
1.033754, -0.2295344, 1.173427, 0, 0, 0, 1, 1,
1.037474, 0.1035696, 3.508121, 1, 1, 1, 1, 1,
1.047068, 1.362813, 0.3235679, 1, 1, 1, 1, 1,
1.047166, -0.5865012, 3.813818, 1, 1, 1, 1, 1,
1.050263, -0.5549856, 2.345325, 1, 1, 1, 1, 1,
1.05558, -0.8327833, 0.0603965, 1, 1, 1, 1, 1,
1.061248, -1.327156, 2.678144, 1, 1, 1, 1, 1,
1.063089, 0.39255, -0.2516098, 1, 1, 1, 1, 1,
1.063197, -1.264001, 2.997556, 1, 1, 1, 1, 1,
1.081744, 0.2584915, 0.07815845, 1, 1, 1, 1, 1,
1.089949, 2.326227, 0.3819448, 1, 1, 1, 1, 1,
1.095346, -0.1630659, 0.2189864, 1, 1, 1, 1, 1,
1.096482, -1.543705, 2.483926, 1, 1, 1, 1, 1,
1.104504, 0.4393813, 0.6539385, 1, 1, 1, 1, 1,
1.104741, -1.707201, 4.3923, 1, 1, 1, 1, 1,
1.109629, 1.418391, 1.379709, 1, 1, 1, 1, 1,
1.110878, 0.3337533, 2.60581, 0, 0, 1, 1, 1,
1.120234, 0.563051, 2.216245, 1, 0, 0, 1, 1,
1.120668, -0.7242206, 3.039535, 1, 0, 0, 1, 1,
1.126692, 1.240802, 1.237052, 1, 0, 0, 1, 1,
1.128467, 1.824549, 1.527625, 1, 0, 0, 1, 1,
1.134215, -0.3133244, 1.454126, 1, 0, 0, 1, 1,
1.135762, 0.7869655, 0.7766207, 0, 0, 0, 1, 1,
1.141269, 0.5643069, 1.400897, 0, 0, 0, 1, 1,
1.141667, -1.091726, 2.153105, 0, 0, 0, 1, 1,
1.14317, 0.6899955, 0.8166591, 0, 0, 0, 1, 1,
1.144103, -1.530087, 2.012849, 0, 0, 0, 1, 1,
1.146452, 0.0853701, -0.2873009, 0, 0, 0, 1, 1,
1.149674, 2.02107, 0.4134493, 0, 0, 0, 1, 1,
1.150617, 1.200689, 0.8803725, 1, 1, 1, 1, 1,
1.152725, -0.3660206, 0.4974437, 1, 1, 1, 1, 1,
1.153319, 2.970201, 2.081909, 1, 1, 1, 1, 1,
1.15874, -1.63198, 1.407728, 1, 1, 1, 1, 1,
1.178944, -0.2554172, 3.033991, 1, 1, 1, 1, 1,
1.184022, -2.514497, 2.036335, 1, 1, 1, 1, 1,
1.201656, -1.421713, 2.314095, 1, 1, 1, 1, 1,
1.206552, 1.28127, 0.5383369, 1, 1, 1, 1, 1,
1.210566, -1.543961, 2.711128, 1, 1, 1, 1, 1,
1.219974, -0.7495571, 3.44174, 1, 1, 1, 1, 1,
1.222157, -1.271807, 1.4672, 1, 1, 1, 1, 1,
1.225663, -0.9279302, 3.318532, 1, 1, 1, 1, 1,
1.228013, -1.618106, 3.349429, 1, 1, 1, 1, 1,
1.23295, 0.5540022, 0.9761257, 1, 1, 1, 1, 1,
1.233047, 1.337113, 0.4479111, 1, 1, 1, 1, 1,
1.235142, -1.23008, 1.276582, 0, 0, 1, 1, 1,
1.23568, 1.904983, 0.4910913, 1, 0, 0, 1, 1,
1.241605, 1.111688, 1.67482, 1, 0, 0, 1, 1,
1.248373, -0.7121894, 2.832917, 1, 0, 0, 1, 1,
1.254579, -0.8508258, 1.419563, 1, 0, 0, 1, 1,
1.259874, 1.229406, 1.793355, 1, 0, 0, 1, 1,
1.268411, 1.730979, -1.131672, 0, 0, 0, 1, 1,
1.277391, 0.7781895, 0.2407296, 0, 0, 0, 1, 1,
1.28362, 1.138558, 0.7629867, 0, 0, 0, 1, 1,
1.293114, -2.197158, 1.285409, 0, 0, 0, 1, 1,
1.295121, 0.6566998, 0.5215372, 0, 0, 0, 1, 1,
1.295743, 0.2774422, 1.1613, 0, 0, 0, 1, 1,
1.306879, 0.08882922, 2.578526, 0, 0, 0, 1, 1,
1.314859, -1.158001, 2.405864, 1, 1, 1, 1, 1,
1.321322, -0.1458356, 1.043064, 1, 1, 1, 1, 1,
1.327961, -0.418971, 2.036504, 1, 1, 1, 1, 1,
1.328354, -0.4557113, 3.348275, 1, 1, 1, 1, 1,
1.335834, -1.791996, 2.220148, 1, 1, 1, 1, 1,
1.337991, -0.3127733, 2.291895, 1, 1, 1, 1, 1,
1.34062, -0.945871, 0.9730138, 1, 1, 1, 1, 1,
1.341224, -0.04955769, 2.314591, 1, 1, 1, 1, 1,
1.345964, 0.4753737, 1.490918, 1, 1, 1, 1, 1,
1.352796, -0.9420522, 4.363539, 1, 1, 1, 1, 1,
1.355341, 1.206394, 0.7500325, 1, 1, 1, 1, 1,
1.357554, -0.02177907, 0.9183511, 1, 1, 1, 1, 1,
1.35767, 1.467758, 2.156004, 1, 1, 1, 1, 1,
1.372754, 1.388014, 0.2330157, 1, 1, 1, 1, 1,
1.37521, -0.6227047, 2.808425, 1, 1, 1, 1, 1,
1.381645, 1.428854, 0.01230044, 0, 0, 1, 1, 1,
1.390144, 0.710627, 1.716985, 1, 0, 0, 1, 1,
1.39497, -0.1490332, 1.846672, 1, 0, 0, 1, 1,
1.395086, -0.8178878, 0.03331449, 1, 0, 0, 1, 1,
1.403404, 1.277531, 0.8215652, 1, 0, 0, 1, 1,
1.413819, -0.2625429, 0.9536375, 1, 0, 0, 1, 1,
1.427942, -0.05741019, 1.68811, 0, 0, 0, 1, 1,
1.434083, -0.9502387, 0.671841, 0, 0, 0, 1, 1,
1.43516, 0.2030436, 2.667591, 0, 0, 0, 1, 1,
1.451698, 0.3246735, 1.993354, 0, 0, 0, 1, 1,
1.453004, 1.148644, 0.6374556, 0, 0, 0, 1, 1,
1.453301, 0.359336, 1.957717, 0, 0, 0, 1, 1,
1.453403, -0.7633539, 0.4263489, 0, 0, 0, 1, 1,
1.464919, 0.1164759, -0.01512514, 1, 1, 1, 1, 1,
1.464983, -0.4168189, 2.376009, 1, 1, 1, 1, 1,
1.466575, -1.073533, 1.736237, 1, 1, 1, 1, 1,
1.47037, 0.013681, 2.336789, 1, 1, 1, 1, 1,
1.471313, -0.003567812, 0.9292986, 1, 1, 1, 1, 1,
1.496348, 1.398317, -0.1638672, 1, 1, 1, 1, 1,
1.500666, -0.08754992, 0.7926503, 1, 1, 1, 1, 1,
1.505191, 0.4397943, 2.004821, 1, 1, 1, 1, 1,
1.507312, -1.23782, 1.2137, 1, 1, 1, 1, 1,
1.516316, 1.265436, 0.3801722, 1, 1, 1, 1, 1,
1.530016, 0.03656474, 2.486168, 1, 1, 1, 1, 1,
1.537624, -0.1552057, 3.74507, 1, 1, 1, 1, 1,
1.543905, 0.403919, 1.955133, 1, 1, 1, 1, 1,
1.573968, -0.08359895, 1.095599, 1, 1, 1, 1, 1,
1.576366, -2.369274, 2.599972, 1, 1, 1, 1, 1,
1.605919, -0.4446554, 2.316076, 0, 0, 1, 1, 1,
1.644528, 0.4661614, 2.17719, 1, 0, 0, 1, 1,
1.648927, -0.616999, 0.05678276, 1, 0, 0, 1, 1,
1.659575, -1.170401, 2.038348, 1, 0, 0, 1, 1,
1.66649, 1.010017, 2.585618, 1, 0, 0, 1, 1,
1.674329, 0.1550412, -0.9520535, 1, 0, 0, 1, 1,
1.6754, 0.9530796, 2.420991, 0, 0, 0, 1, 1,
1.70142, 1.120498, -1.115675, 0, 0, 0, 1, 1,
1.707627, -0.5272279, 2.469977, 0, 0, 0, 1, 1,
1.712817, -0.8460097, 2.403526, 0, 0, 0, 1, 1,
1.715097, -0.2925864, -1.854366, 0, 0, 0, 1, 1,
1.715149, -1.044296, 2.038945, 0, 0, 0, 1, 1,
1.725572, 1.442587, 0.9176564, 0, 0, 0, 1, 1,
1.751808, 1.750254, 1.33197, 1, 1, 1, 1, 1,
1.764932, 0.4604245, 0.1616788, 1, 1, 1, 1, 1,
1.77646, 0.6735119, 1.993139, 1, 1, 1, 1, 1,
1.787307, -0.1905017, 1.244524, 1, 1, 1, 1, 1,
1.795009, 1.135023, 0.2160072, 1, 1, 1, 1, 1,
1.795405, -0.1199052, 3.508109, 1, 1, 1, 1, 1,
1.808635, 0.3917501, 2.664218, 1, 1, 1, 1, 1,
1.823246, -1.595352, 2.049134, 1, 1, 1, 1, 1,
1.828078, 1.314325, 0.6451727, 1, 1, 1, 1, 1,
1.862496, -0.5551602, 2.565711, 1, 1, 1, 1, 1,
1.863167, -0.08049764, 1.22459, 1, 1, 1, 1, 1,
1.879498, 0.8114123, -0.2363796, 1, 1, 1, 1, 1,
1.884864, -0.5873035, 2.596436, 1, 1, 1, 1, 1,
1.937531, -0.4724818, 0.1764431, 1, 1, 1, 1, 1,
1.960224, -0.355674, 1.296577, 1, 1, 1, 1, 1,
1.978488, 0.1521433, 3.091179, 0, 0, 1, 1, 1,
1.978548, -0.620654, 2.257377, 1, 0, 0, 1, 1,
2.021882, -0.1235943, 1.947213, 1, 0, 0, 1, 1,
2.06345, 0.1097825, 0.7076413, 1, 0, 0, 1, 1,
2.096061, 0.4640046, 0.9052331, 1, 0, 0, 1, 1,
2.100097, -0.5541707, 0.6590788, 1, 0, 0, 1, 1,
2.116349, -0.3712923, 1.497981, 0, 0, 0, 1, 1,
2.137143, 0.8171401, 0.8082677, 0, 0, 0, 1, 1,
2.162228, 1.191403, 2.766225, 0, 0, 0, 1, 1,
2.247454, 0.3691866, 2.518789, 0, 0, 0, 1, 1,
2.272333, -1.816546, 1.681121, 0, 0, 0, 1, 1,
2.279685, -0.2255053, 2.765647, 0, 0, 0, 1, 1,
2.292942, -0.2583477, 1.021403, 0, 0, 0, 1, 1,
2.321348, -1.132621, 1.544731, 1, 1, 1, 1, 1,
2.387509, 0.7070764, 0.775624, 1, 1, 1, 1, 1,
2.395865, -0.3584812, 3.579913, 1, 1, 1, 1, 1,
2.450628, -0.02315399, 0.02062017, 1, 1, 1, 1, 1,
2.468013, 0.2326865, 2.047115, 1, 1, 1, 1, 1,
2.553795, 0.2517163, 1.665397, 1, 1, 1, 1, 1,
2.732871, -1.105067, 2.434835, 1, 1, 1, 1, 1
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
var radius = 9.794469;
var distance = 34.40266;
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
mvMatrix.translate( 0.3526647, 0.1426791, -0.1356802 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.40266);
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