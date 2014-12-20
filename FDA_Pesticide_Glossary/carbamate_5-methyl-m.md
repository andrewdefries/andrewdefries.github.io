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
-3.699126, -0.227948, -2.927349, 1, 0, 0, 1,
-2.795002, -0.6285686, -2.034692, 1, 0.007843138, 0, 1,
-2.677566, 0.4939825, -0.007830156, 1, 0.01176471, 0, 1,
-2.623139, 0.6481346, -1.197179, 1, 0.01960784, 0, 1,
-2.569021, -1.360444, -2.497003, 1, 0.02352941, 0, 1,
-2.474211, -0.4516928, -0.440825, 1, 0.03137255, 0, 1,
-2.452421, 0.7078552, -2.164365, 1, 0.03529412, 0, 1,
-2.427326, 0.6566799, -3.214685, 1, 0.04313726, 0, 1,
-2.383085, -1.313094, -2.287793, 1, 0.04705882, 0, 1,
-2.349022, -0.6825921, -1.394657, 1, 0.05490196, 0, 1,
-2.217308, -1.126009, -2.904377, 1, 0.05882353, 0, 1,
-2.216139, 1.319549, -1.903747, 1, 0.06666667, 0, 1,
-2.173307, 0.105507, -1.929981, 1, 0.07058824, 0, 1,
-2.170843, -0.0833823, -2.893464, 1, 0.07843138, 0, 1,
-2.167054, -0.002130014, -2.816885, 1, 0.08235294, 0, 1,
-2.144054, 1.709106, -1.142405, 1, 0.09019608, 0, 1,
-2.115333, 2.345347, 0.2113365, 1, 0.09411765, 0, 1,
-2.115203, 0.2022007, -2.25323, 1, 0.1019608, 0, 1,
-2.103067, -1.922061, -1.653647, 1, 0.1098039, 0, 1,
-2.088206, -0.1306666, -2.224454, 1, 0.1137255, 0, 1,
-2.087664, 0.341888, -2.530157, 1, 0.1215686, 0, 1,
-2.077186, 0.1966407, -1.001905, 1, 0.1254902, 0, 1,
-2.06698, -0.04905508, -1.070124, 1, 0.1333333, 0, 1,
-2.049873, -0.01310202, -2.784101, 1, 0.1372549, 0, 1,
-2.042808, -1.118724, -1.296015, 1, 0.145098, 0, 1,
-2.010412, 0.6932803, -2.527953, 1, 0.1490196, 0, 1,
-2.006221, 0.6982486, -0.4462545, 1, 0.1568628, 0, 1,
-1.9858, 0.2925088, -1.188169, 1, 0.1607843, 0, 1,
-1.984261, 0.09609642, -0.6246224, 1, 0.1686275, 0, 1,
-1.970814, -0.6651077, -1.542309, 1, 0.172549, 0, 1,
-1.966894, -0.2401845, -2.123076, 1, 0.1803922, 0, 1,
-1.950766, 1.48949, -0.6766921, 1, 0.1843137, 0, 1,
-1.935562, 0.9525899, -1.041481, 1, 0.1921569, 0, 1,
-1.930297, -0.4737524, -1.634263, 1, 0.1960784, 0, 1,
-1.917579, 0.4251023, -2.150054, 1, 0.2039216, 0, 1,
-1.901854, -0.6475423, -1.544764, 1, 0.2117647, 0, 1,
-1.888085, 0.0515543, -0.09686596, 1, 0.2156863, 0, 1,
-1.855922, -1.495029, -2.37646, 1, 0.2235294, 0, 1,
-1.841608, -0.1681118, -1.091499, 1, 0.227451, 0, 1,
-1.835017, -0.3128184, -2.507546, 1, 0.2352941, 0, 1,
-1.828369, -0.531454, -1.037212, 1, 0.2392157, 0, 1,
-1.814489, 0.8293252, 0.6272615, 1, 0.2470588, 0, 1,
-1.784732, -1.253986, -3.040182, 1, 0.2509804, 0, 1,
-1.776881, -1.813228, -2.929071, 1, 0.2588235, 0, 1,
-1.773097, 0.6179765, -0.7297232, 1, 0.2627451, 0, 1,
-1.76761, 0.4238639, -1.043134, 1, 0.2705882, 0, 1,
-1.73581, -0.2800778, -1.883851, 1, 0.2745098, 0, 1,
-1.71726, -0.2251949, -1.860047, 1, 0.282353, 0, 1,
-1.714325, 0.518756, 0.263444, 1, 0.2862745, 0, 1,
-1.706455, 0.1778961, -2.104669, 1, 0.2941177, 0, 1,
-1.701097, 0.4264506, -2.347606, 1, 0.3019608, 0, 1,
-1.692958, 0.7682331, 0.4430459, 1, 0.3058824, 0, 1,
-1.686619, -0.292893, -0.7775102, 1, 0.3137255, 0, 1,
-1.681895, -0.4325165, -1.754467, 1, 0.3176471, 0, 1,
-1.66929, -0.2772967, -1.552493, 1, 0.3254902, 0, 1,
-1.652332, -1.294342, -2.810526, 1, 0.3294118, 0, 1,
-1.637563, -0.3921323, 0.04136711, 1, 0.3372549, 0, 1,
-1.633604, 0.2172422, -2.90895, 1, 0.3411765, 0, 1,
-1.629788, -0.9264825, -2.845091, 1, 0.3490196, 0, 1,
-1.62675, -0.1295882, -1.301956, 1, 0.3529412, 0, 1,
-1.620742, -0.03265833, -1.753595, 1, 0.3607843, 0, 1,
-1.591539, -0.9794424, -0.5096599, 1, 0.3647059, 0, 1,
-1.567357, -1.47751, -2.117215, 1, 0.372549, 0, 1,
-1.55919, -1.422463, -4.349744, 1, 0.3764706, 0, 1,
-1.557233, 0.8853942, -0.448227, 1, 0.3843137, 0, 1,
-1.555506, 0.09282571, -0.9206107, 1, 0.3882353, 0, 1,
-1.540205, 0.2655734, -0.5096537, 1, 0.3960784, 0, 1,
-1.534286, -0.6093074, -0.7711037, 1, 0.4039216, 0, 1,
-1.526316, -0.9335609, -1.41907, 1, 0.4078431, 0, 1,
-1.519237, 1.09041, -0.3981089, 1, 0.4156863, 0, 1,
-1.519115, -0.3904174, -0.1234392, 1, 0.4196078, 0, 1,
-1.518947, -0.5421155, -1.778659, 1, 0.427451, 0, 1,
-1.496186, 1.552577, -0.2464084, 1, 0.4313726, 0, 1,
-1.493445, -0.3578263, -0.5832529, 1, 0.4392157, 0, 1,
-1.491276, -0.4571138, -3.329154, 1, 0.4431373, 0, 1,
-1.490918, -0.04596146, -2.065747, 1, 0.4509804, 0, 1,
-1.485732, 0.6567196, -1.213019, 1, 0.454902, 0, 1,
-1.479612, -0.781598, -1.434125, 1, 0.4627451, 0, 1,
-1.460178, -0.3007533, -0.5774654, 1, 0.4666667, 0, 1,
-1.458437, -2.357483, -1.181908, 1, 0.4745098, 0, 1,
-1.457754, 0.1265485, -1.65601, 1, 0.4784314, 0, 1,
-1.454891, 1.74262, 0.8094831, 1, 0.4862745, 0, 1,
-1.452642, 0.06960726, -2.94635, 1, 0.4901961, 0, 1,
-1.444721, -1.209522, -3.882852, 1, 0.4980392, 0, 1,
-1.433275, -1.162328, -0.9315529, 1, 0.5058824, 0, 1,
-1.430663, 0.2026691, -2.002042, 1, 0.509804, 0, 1,
-1.425536, 0.7385556, -1.448033, 1, 0.5176471, 0, 1,
-1.425327, -0.5256987, -2.134085, 1, 0.5215687, 0, 1,
-1.423224, 0.8163182, -0.5269848, 1, 0.5294118, 0, 1,
-1.421844, 0.149562, -1.113512, 1, 0.5333334, 0, 1,
-1.414441, -0.5011589, -2.135077, 1, 0.5411765, 0, 1,
-1.411339, 0.6749526, -2.458459, 1, 0.5450981, 0, 1,
-1.410429, -0.07827162, -1.224295, 1, 0.5529412, 0, 1,
-1.383538, 0.1170375, -1.91775, 1, 0.5568628, 0, 1,
-1.382197, 1.456958, 0.8144405, 1, 0.5647059, 0, 1,
-1.375913, -1.292925, -1.323927, 1, 0.5686275, 0, 1,
-1.37348, -1.160647, -3.094847, 1, 0.5764706, 0, 1,
-1.36379, 1.062528, -2.456514, 1, 0.5803922, 0, 1,
-1.363479, 0.5437047, -1.610314, 1, 0.5882353, 0, 1,
-1.349389, 0.5188873, -1.40256, 1, 0.5921569, 0, 1,
-1.343092, -1.22754, -2.678481, 1, 0.6, 0, 1,
-1.336412, 0.4189492, -1.516791, 1, 0.6078432, 0, 1,
-1.332004, 1.165908, 0.6626252, 1, 0.6117647, 0, 1,
-1.326184, -0.6095682, -2.691714, 1, 0.6196079, 0, 1,
-1.324807, 0.4590873, -2.317881, 1, 0.6235294, 0, 1,
-1.323173, -2.033208, -3.589907, 1, 0.6313726, 0, 1,
-1.319322, -0.9506695, -1.94899, 1, 0.6352941, 0, 1,
-1.317491, 0.5942445, -1.086836, 1, 0.6431373, 0, 1,
-1.314508, -0.8937094, -1.656723, 1, 0.6470588, 0, 1,
-1.312086, -1.291685, -2.280881, 1, 0.654902, 0, 1,
-1.304488, 0.08784185, -2.365979, 1, 0.6588235, 0, 1,
-1.304005, 0.04557328, 0.0009575895, 1, 0.6666667, 0, 1,
-1.303305, -1.806447, -4.117481, 1, 0.6705883, 0, 1,
-1.30102, 0.6480929, -0.3060072, 1, 0.6784314, 0, 1,
-1.293933, 0.1156567, -3.345229, 1, 0.682353, 0, 1,
-1.281948, 1.171092, -0.5869077, 1, 0.6901961, 0, 1,
-1.276967, -0.3805393, -1.277919, 1, 0.6941177, 0, 1,
-1.273454, -1.940204, -2.596864, 1, 0.7019608, 0, 1,
-1.27092, -1.439082, -4.370979, 1, 0.7098039, 0, 1,
-1.270281, -1.639549, -2.529841, 1, 0.7137255, 0, 1,
-1.257039, -0.448063, -2.855607, 1, 0.7215686, 0, 1,
-1.256591, -2.402217, -3.395934, 1, 0.7254902, 0, 1,
-1.255844, -0.82816, -3.250191, 1, 0.7333333, 0, 1,
-1.25215, -1.392274, -1.873594, 1, 0.7372549, 0, 1,
-1.251796, -0.2442814, -2.107726, 1, 0.7450981, 0, 1,
-1.245285, 1.965908, 0.8375226, 1, 0.7490196, 0, 1,
-1.244157, 0.5027762, -2.431026, 1, 0.7568628, 0, 1,
-1.234025, 0.8600395, -1.186644, 1, 0.7607843, 0, 1,
-1.227923, 1.297362, 1.020216, 1, 0.7686275, 0, 1,
-1.226745, 0.5479125, -1.838502, 1, 0.772549, 0, 1,
-1.224133, -1.323264, -2.400735, 1, 0.7803922, 0, 1,
-1.222542, -0.6848491, -1.162045, 1, 0.7843137, 0, 1,
-1.220855, -1.160737, -1.702238, 1, 0.7921569, 0, 1,
-1.218847, 1.16362, 2.114514, 1, 0.7960784, 0, 1,
-1.218581, 0.951829, -1.86309, 1, 0.8039216, 0, 1,
-1.204511, 0.8603688, -0.4344986, 1, 0.8117647, 0, 1,
-1.200782, 0.7217285, -0.6423873, 1, 0.8156863, 0, 1,
-1.200326, -1.131893, -2.003325, 1, 0.8235294, 0, 1,
-1.199661, 1.385564, 1.75485, 1, 0.827451, 0, 1,
-1.186547, 0.07408415, 1.157881, 1, 0.8352941, 0, 1,
-1.185647, -0.7225357, -3.121039, 1, 0.8392157, 0, 1,
-1.182873, -0.8268083, -1.082415, 1, 0.8470588, 0, 1,
-1.177176, -0.01203755, -1.776593, 1, 0.8509804, 0, 1,
-1.16422, 1.694716, -1.031397, 1, 0.8588235, 0, 1,
-1.161234, -1.236591, -2.337729, 1, 0.8627451, 0, 1,
-1.147099, 1.628221, -0.5806483, 1, 0.8705882, 0, 1,
-1.137703, -0.9093274, -1.660675, 1, 0.8745098, 0, 1,
-1.133575, -0.4867538, -1.205831, 1, 0.8823529, 0, 1,
-1.125058, -1.917681, -2.768237, 1, 0.8862745, 0, 1,
-1.11521, 1.312189, -1.994545, 1, 0.8941177, 0, 1,
-1.103433, 0.1662017, -0.3122392, 1, 0.8980392, 0, 1,
-1.092419, 0.6562303, -1.073967, 1, 0.9058824, 0, 1,
-1.090891, 2.046962, -1.62152, 1, 0.9137255, 0, 1,
-1.085839, -0.2623551, -1.505812, 1, 0.9176471, 0, 1,
-1.084448, -1.047431, -2.411836, 1, 0.9254902, 0, 1,
-1.077466, 1.589007, -0.7456737, 1, 0.9294118, 0, 1,
-1.076873, -1.170573, -1.870499, 1, 0.9372549, 0, 1,
-1.073475, -0.5388427, -3.459556, 1, 0.9411765, 0, 1,
-1.068173, 0.2829661, -1.017037, 1, 0.9490196, 0, 1,
-1.059959, -0.3340697, 0.03311452, 1, 0.9529412, 0, 1,
-1.043751, 0.05737879, -1.599415, 1, 0.9607843, 0, 1,
-1.042894, 0.009196362, -1.520859, 1, 0.9647059, 0, 1,
-1.036807, -1.845584, -1.895222, 1, 0.972549, 0, 1,
-1.035995, -1.339303, -4.299969, 1, 0.9764706, 0, 1,
-1.033834, 0.1133274, -1.439143, 1, 0.9843137, 0, 1,
-1.030921, -0.8607649, -1.819956, 1, 0.9882353, 0, 1,
-1.029882, -0.7223397, 0.07136997, 1, 0.9960784, 0, 1,
-1.027372, -0.5478371, -2.284764, 0.9960784, 1, 0, 1,
-1.022457, 0.4245832, 0.1622248, 0.9921569, 1, 0, 1,
-1.018312, 0.3278799, -1.096371, 0.9843137, 1, 0, 1,
-1.009525, -1.63287, -2.006705, 0.9803922, 1, 0, 1,
-1.006704, -0.1616063, -2.620403, 0.972549, 1, 0, 1,
-0.999907, -1.220881, 0.03341204, 0.9686275, 1, 0, 1,
-0.9997694, 0.8846471, -0.9934273, 0.9607843, 1, 0, 1,
-0.9985071, 1.059745, -0.5540661, 0.9568627, 1, 0, 1,
-0.9968426, -1.211825, -2.163009, 0.9490196, 1, 0, 1,
-0.9952881, -1.083982, -4.992053, 0.945098, 1, 0, 1,
-0.9938618, -0.3698117, -1.6002, 0.9372549, 1, 0, 1,
-0.9931008, 0.5485128, -1.631065, 0.9333333, 1, 0, 1,
-0.9913219, 0.7020559, -1.737754, 0.9254902, 1, 0, 1,
-0.990468, -0.0486045, -2.711837, 0.9215686, 1, 0, 1,
-0.9827753, 1.51205, -1.210168, 0.9137255, 1, 0, 1,
-0.9741647, 0.2141525, -2.104814, 0.9098039, 1, 0, 1,
-0.9697772, 1.320033, -0.1179572, 0.9019608, 1, 0, 1,
-0.9644796, -0.09599133, -2.172181, 0.8941177, 1, 0, 1,
-0.9575471, 1.57473, -1.144588, 0.8901961, 1, 0, 1,
-0.9541526, 3.12441, -0.9496813, 0.8823529, 1, 0, 1,
-0.9531474, -0.4516641, -2.117409, 0.8784314, 1, 0, 1,
-0.9529455, 0.7178125, -1.615139, 0.8705882, 1, 0, 1,
-0.9507954, 0.08234915, -1.098877, 0.8666667, 1, 0, 1,
-0.9361574, -0.2808062, -2.944922, 0.8588235, 1, 0, 1,
-0.9332085, 1.134483, -1.19552, 0.854902, 1, 0, 1,
-0.932887, -0.3879406, -2.651115, 0.8470588, 1, 0, 1,
-0.9320211, 0.1750844, -2.230234, 0.8431373, 1, 0, 1,
-0.928856, -0.3053293, -1.556732, 0.8352941, 1, 0, 1,
-0.9242282, 1.859832, -0.1269545, 0.8313726, 1, 0, 1,
-0.9225774, -0.1869558, 0.1389948, 0.8235294, 1, 0, 1,
-0.9188056, -0.2781661, -1.326157, 0.8196079, 1, 0, 1,
-0.9187511, 0.1024197, -1.662827, 0.8117647, 1, 0, 1,
-0.9162782, 2.193747, -0.1290754, 0.8078431, 1, 0, 1,
-0.9146173, -1.314862, -2.707109, 0.8, 1, 0, 1,
-0.9087626, -0.7332913, -1.327498, 0.7921569, 1, 0, 1,
-0.9043932, 0.4442311, -3.100518, 0.7882353, 1, 0, 1,
-0.901408, 0.7091214, -1.375511, 0.7803922, 1, 0, 1,
-0.9006656, -0.7491599, -2.099017, 0.7764706, 1, 0, 1,
-0.898902, 0.7323979, 0.009844605, 0.7686275, 1, 0, 1,
-0.8975964, -0.7064373, -3.503897, 0.7647059, 1, 0, 1,
-0.8966744, 1.561195, 0.4077362, 0.7568628, 1, 0, 1,
-0.8956051, 0.2677621, -0.6777132, 0.7529412, 1, 0, 1,
-0.8926314, 1.634645, -0.5757588, 0.7450981, 1, 0, 1,
-0.8844955, -1.0952, -4.022368, 0.7411765, 1, 0, 1,
-0.8766144, -0.9558178, -1.457497, 0.7333333, 1, 0, 1,
-0.8724732, 0.6170354, -0.813, 0.7294118, 1, 0, 1,
-0.869742, 0.9078567, -1.173478, 0.7215686, 1, 0, 1,
-0.8610331, -2.479409, -2.182723, 0.7176471, 1, 0, 1,
-0.8510184, -0.3800949, -1.598446, 0.7098039, 1, 0, 1,
-0.8501205, 0.1148497, -0.6403872, 0.7058824, 1, 0, 1,
-0.8458437, -0.7492254, -1.055952, 0.6980392, 1, 0, 1,
-0.8453512, -0.715491, -2.204431, 0.6901961, 1, 0, 1,
-0.8440042, -1.489849, -3.250413, 0.6862745, 1, 0, 1,
-0.8428798, 0.4520695, -2.47194, 0.6784314, 1, 0, 1,
-0.8408465, 0.6495199, -1.719414, 0.6745098, 1, 0, 1,
-0.8407683, -0.6809673, -2.148359, 0.6666667, 1, 0, 1,
-0.8367239, 0.348363, -0.1664795, 0.6627451, 1, 0, 1,
-0.8316069, -0.4845749, -2.08666, 0.654902, 1, 0, 1,
-0.8315853, 0.1751448, -1.77395, 0.6509804, 1, 0, 1,
-0.828468, -0.7518475, -1.90221, 0.6431373, 1, 0, 1,
-0.8267515, -0.7521791, -1.834558, 0.6392157, 1, 0, 1,
-0.8262156, 1.105553, -1.404855, 0.6313726, 1, 0, 1,
-0.8133355, -1.192189, -2.36622, 0.627451, 1, 0, 1,
-0.8017476, 1.25306, -1.494988, 0.6196079, 1, 0, 1,
-0.7994164, -2.268975, -2.069521, 0.6156863, 1, 0, 1,
-0.7980806, -0.8491009, -4.789197, 0.6078432, 1, 0, 1,
-0.794484, 0.7501811, -4.039094, 0.6039216, 1, 0, 1,
-0.7887708, 1.355738, -0.9455889, 0.5960785, 1, 0, 1,
-0.7851329, -0.7688012, -0.8707646, 0.5882353, 1, 0, 1,
-0.7835444, 1.431579, -0.3850754, 0.5843138, 1, 0, 1,
-0.7709912, -0.6344377, -2.713266, 0.5764706, 1, 0, 1,
-0.7689602, 1.18745, 1.011281, 0.572549, 1, 0, 1,
-0.763501, 0.2811087, -1.82305, 0.5647059, 1, 0, 1,
-0.7612414, 0.3785553, -1.475653, 0.5607843, 1, 0, 1,
-0.7574268, -0.4143799, -2.228341, 0.5529412, 1, 0, 1,
-0.7561426, -0.8140893, -3.881077, 0.5490196, 1, 0, 1,
-0.7555419, 2.283353, -0.130488, 0.5411765, 1, 0, 1,
-0.7549617, -0.03984229, -1.743547, 0.5372549, 1, 0, 1,
-0.7541839, 0.7738418, -0.4939291, 0.5294118, 1, 0, 1,
-0.7468542, -0.9046876, -3.445948, 0.5254902, 1, 0, 1,
-0.7344005, -0.9024132, -2.50872, 0.5176471, 1, 0, 1,
-0.7312673, 0.9295205, -0.7899445, 0.5137255, 1, 0, 1,
-0.7291521, 1.145174, -0.1675597, 0.5058824, 1, 0, 1,
-0.727228, -0.2716922, -3.17429, 0.5019608, 1, 0, 1,
-0.7259448, 0.9541362, 1.088461, 0.4941176, 1, 0, 1,
-0.7173429, -0.236704, -4.574225, 0.4862745, 1, 0, 1,
-0.7134838, -2.547014, -3.278329, 0.4823529, 1, 0, 1,
-0.7125694, -0.04010681, -2.821936, 0.4745098, 1, 0, 1,
-0.7077873, 1.402247, 2.431179, 0.4705882, 1, 0, 1,
-0.6921175, 0.4004369, -1.448107, 0.4627451, 1, 0, 1,
-0.6905492, 0.1343142, -1.376872, 0.4588235, 1, 0, 1,
-0.6895303, -0.6387356, -1.891016, 0.4509804, 1, 0, 1,
-0.6879385, -0.789257, -1.892163, 0.4470588, 1, 0, 1,
-0.678512, -0.3998359, -1.495806, 0.4392157, 1, 0, 1,
-0.6768126, 0.3128857, -0.4016871, 0.4352941, 1, 0, 1,
-0.6757756, -1.075796, -1.553335, 0.427451, 1, 0, 1,
-0.6745122, -0.5880793, -2.030494, 0.4235294, 1, 0, 1,
-0.6702826, 0.1190586, -1.069068, 0.4156863, 1, 0, 1,
-0.6655202, -0.4484839, -1.138991, 0.4117647, 1, 0, 1,
-0.6643288, 0.1836592, -1.264813, 0.4039216, 1, 0, 1,
-0.6593186, 0.0654439, -1.214433, 0.3960784, 1, 0, 1,
-0.6591936, -0.4772704, -0.7999154, 0.3921569, 1, 0, 1,
-0.650898, -0.3547073, -2.284882, 0.3843137, 1, 0, 1,
-0.6493327, 0.1174209, -0.06757829, 0.3803922, 1, 0, 1,
-0.648093, 0.5646998, -2.483955, 0.372549, 1, 0, 1,
-0.6474733, 0.7055109, -0.1652738, 0.3686275, 1, 0, 1,
-0.6454959, 0.8589876, -1.695729, 0.3607843, 1, 0, 1,
-0.6412011, 0.7313031, 0.709173, 0.3568628, 1, 0, 1,
-0.6400441, 1.012701, -1.556478, 0.3490196, 1, 0, 1,
-0.6372217, 0.2021958, -1.501391, 0.345098, 1, 0, 1,
-0.6251311, -0.5042143, -2.047673, 0.3372549, 1, 0, 1,
-0.6240149, -0.9920121, -2.565595, 0.3333333, 1, 0, 1,
-0.6199495, 1.216765, -0.275833, 0.3254902, 1, 0, 1,
-0.6181327, 0.8790725, -0.2600338, 0.3215686, 1, 0, 1,
-0.6138157, -0.06733304, -2.136775, 0.3137255, 1, 0, 1,
-0.6122697, 0.7318861, -0.3835484, 0.3098039, 1, 0, 1,
-0.6104507, 0.7984188, -0.2100682, 0.3019608, 1, 0, 1,
-0.6089237, 0.03949556, -1.027684, 0.2941177, 1, 0, 1,
-0.6088715, 1.174146, -2.117688, 0.2901961, 1, 0, 1,
-0.6088401, 0.5721403, -1.423392, 0.282353, 1, 0, 1,
-0.6068406, 0.04304846, -1.186688, 0.2784314, 1, 0, 1,
-0.606425, -0.8170563, -1.324128, 0.2705882, 1, 0, 1,
-0.6020777, 1.080153, -1.221386, 0.2666667, 1, 0, 1,
-0.600216, -1.287796, -2.230571, 0.2588235, 1, 0, 1,
-0.5963126, -0.2464822, -1.496395, 0.254902, 1, 0, 1,
-0.5962865, -0.5511122, -3.214256, 0.2470588, 1, 0, 1,
-0.5947866, -0.8319746, -1.146383, 0.2431373, 1, 0, 1,
-0.5839708, 0.2499889, -0.4917538, 0.2352941, 1, 0, 1,
-0.5822502, 0.2198734, -0.6836901, 0.2313726, 1, 0, 1,
-0.579375, -1.132807, -3.529647, 0.2235294, 1, 0, 1,
-0.5701063, -0.4333764, -2.468347, 0.2196078, 1, 0, 1,
-0.5647025, 0.3971531, -2.02861, 0.2117647, 1, 0, 1,
-0.5631203, -1.001563, -3.629648, 0.2078431, 1, 0, 1,
-0.5630193, 1.250319, -1.522174, 0.2, 1, 0, 1,
-0.5611696, 0.005157439, -2.177746, 0.1921569, 1, 0, 1,
-0.5571258, -0.1016095, -1.76035, 0.1882353, 1, 0, 1,
-0.5566837, -0.1495278, -0.987985, 0.1803922, 1, 0, 1,
-0.5539846, 0.6564768, -2.009273, 0.1764706, 1, 0, 1,
-0.5519869, 0.9313397, 0.3442575, 0.1686275, 1, 0, 1,
-0.5484657, -0.7685248, -3.056869, 0.1647059, 1, 0, 1,
-0.5464254, 0.07136163, -0.6281898, 0.1568628, 1, 0, 1,
-0.5434864, -0.09825464, -1.369784, 0.1529412, 1, 0, 1,
-0.5416428, -0.1432917, -2.173028, 0.145098, 1, 0, 1,
-0.5406373, 0.5292944, -0.748195, 0.1411765, 1, 0, 1,
-0.5403728, 0.6109455, 0.3127339, 0.1333333, 1, 0, 1,
-0.5394427, -1.375469, -2.502104, 0.1294118, 1, 0, 1,
-0.5359517, 1.862853, -0.3940942, 0.1215686, 1, 0, 1,
-0.5349635, 0.1963592, -1.923097, 0.1176471, 1, 0, 1,
-0.527296, -0.618549, -4.248624, 0.1098039, 1, 0, 1,
-0.5257295, 0.7301089, -0.6623495, 0.1058824, 1, 0, 1,
-0.5208179, -0.4472899, -2.058936, 0.09803922, 1, 0, 1,
-0.5177802, 0.8987371, -0.8817265, 0.09019608, 1, 0, 1,
-0.5157845, 0.1614044, 0.1391148, 0.08627451, 1, 0, 1,
-0.5154283, 2.021465, -1.559459, 0.07843138, 1, 0, 1,
-0.5136695, -0.9646798, -3.27475, 0.07450981, 1, 0, 1,
-0.5103356, 0.9755929, -0.9817973, 0.06666667, 1, 0, 1,
-0.5098261, 0.3165886, -1.199153, 0.0627451, 1, 0, 1,
-0.509468, 0.5626045, 0.4784782, 0.05490196, 1, 0, 1,
-0.5090082, -2.814517, -2.661677, 0.05098039, 1, 0, 1,
-0.503179, -0.3687753, -1.931127, 0.04313726, 1, 0, 1,
-0.4978887, -0.46881, -1.198304, 0.03921569, 1, 0, 1,
-0.497413, -0.3378501, -3.261529, 0.03137255, 1, 0, 1,
-0.4934641, -1.197161, -3.520347, 0.02745098, 1, 0, 1,
-0.4925353, 0.7551885, -0.7254688, 0.01960784, 1, 0, 1,
-0.4924933, 1.066772, -1.774252, 0.01568628, 1, 0, 1,
-0.4899, 0.2345967, -2.21118, 0.007843138, 1, 0, 1,
-0.4866732, 0.2987577, -0.4523075, 0.003921569, 1, 0, 1,
-0.4849202, 0.4011951, -1.279386, 0, 1, 0.003921569, 1,
-0.4848164, -0.7697602, -3.116778, 0, 1, 0.01176471, 1,
-0.4832789, -0.1363284, -3.064888, 0, 1, 0.01568628, 1,
-0.4828903, -0.3263294, -1.440488, 0, 1, 0.02352941, 1,
-0.4812223, -0.8406885, -3.121112, 0, 1, 0.02745098, 1,
-0.4788936, 1.342621, -0.5059416, 0, 1, 0.03529412, 1,
-0.4756557, -1.58408, -3.143247, 0, 1, 0.03921569, 1,
-0.4748697, -1.592573, -3.031581, 0, 1, 0.04705882, 1,
-0.474385, 0.04127832, -1.271953, 0, 1, 0.05098039, 1,
-0.4729569, -0.1696109, -2.526754, 0, 1, 0.05882353, 1,
-0.4728421, -0.1507183, -2.010815, 0, 1, 0.0627451, 1,
-0.4720749, -0.4776493, -1.468064, 0, 1, 0.07058824, 1,
-0.4700199, 0.4506942, -0.9555001, 0, 1, 0.07450981, 1,
-0.4619574, -1.513592, -2.351182, 0, 1, 0.08235294, 1,
-0.4618402, 1.004715, -0.8164171, 0, 1, 0.08627451, 1,
-0.4584981, -1.028053, -2.974943, 0, 1, 0.09411765, 1,
-0.4576662, -0.2686297, -2.138386, 0, 1, 0.1019608, 1,
-0.4559605, -2.339616, -2.064718, 0, 1, 0.1058824, 1,
-0.4518445, -0.9415539, -4.447459, 0, 1, 0.1137255, 1,
-0.4504956, 0.3020608, -0.06021856, 0, 1, 0.1176471, 1,
-0.4470751, -1.765042, -2.815904, 0, 1, 0.1254902, 1,
-0.4464655, 1.226097, 0.1452329, 0, 1, 0.1294118, 1,
-0.4453836, -0.6534542, -3.902662, 0, 1, 0.1372549, 1,
-0.4403274, -0.06991558, -0.2135224, 0, 1, 0.1411765, 1,
-0.4343082, 0.7049586, -1.357318, 0, 1, 0.1490196, 1,
-0.4321893, -1.148946, -2.006305, 0, 1, 0.1529412, 1,
-0.4305981, 0.3309764, -2.173585, 0, 1, 0.1607843, 1,
-0.4239043, 0.2160919, -1.736345, 0, 1, 0.1647059, 1,
-0.4235133, -1.086235, -1.506486, 0, 1, 0.172549, 1,
-0.4227076, -2.021424, -3.441026, 0, 1, 0.1764706, 1,
-0.4213102, -0.6099542, -2.738361, 0, 1, 0.1843137, 1,
-0.4200219, 0.5593126, 0.06933547, 0, 1, 0.1882353, 1,
-0.4183306, -0.4670519, -2.41279, 0, 1, 0.1960784, 1,
-0.4172117, 0.2804738, -0.8188596, 0, 1, 0.2039216, 1,
-0.4164705, -0.1576332, -2.555638, 0, 1, 0.2078431, 1,
-0.4153214, 0.1982539, -2.746025, 0, 1, 0.2156863, 1,
-0.4119755, 1.232703, 0.8146363, 0, 1, 0.2196078, 1,
-0.4117007, 0.6450105, -0.4178339, 0, 1, 0.227451, 1,
-0.4078746, -0.9071311, -0.917333, 0, 1, 0.2313726, 1,
-0.407372, -0.274549, -1.985297, 0, 1, 0.2392157, 1,
-0.405947, -0.005633917, -1.355047, 0, 1, 0.2431373, 1,
-0.403154, 1.978882, -0.583813, 0, 1, 0.2509804, 1,
-0.4012831, -0.122497, -1.828128, 0, 1, 0.254902, 1,
-0.4008918, 1.35917, -0.5411521, 0, 1, 0.2627451, 1,
-0.3995683, 1.329822, 0.761066, 0, 1, 0.2666667, 1,
-0.3976628, 0.4784406, 0.5331694, 0, 1, 0.2745098, 1,
-0.39032, 0.5324617, -0.5486924, 0, 1, 0.2784314, 1,
-0.370917, -0.3949493, -2.004727, 0, 1, 0.2862745, 1,
-0.3679515, -0.8607462, -2.009653, 0, 1, 0.2901961, 1,
-0.3671003, 1.190128, 0.6505678, 0, 1, 0.2980392, 1,
-0.3662966, 0.4492959, 0.09837009, 0, 1, 0.3058824, 1,
-0.3617253, 0.8496232, -1.18283, 0, 1, 0.3098039, 1,
-0.3599232, -0.2048953, -3.232863, 0, 1, 0.3176471, 1,
-0.349805, 0.04709899, -1.627875, 0, 1, 0.3215686, 1,
-0.3477993, -1.603867, -4.212524, 0, 1, 0.3294118, 1,
-0.3458743, 0.2004176, -0.6634235, 0, 1, 0.3333333, 1,
-0.3401773, -0.7874136, -1.09913, 0, 1, 0.3411765, 1,
-0.3378478, -0.9526598, -3.198117, 0, 1, 0.345098, 1,
-0.3353583, -1.093928, -2.913852, 0, 1, 0.3529412, 1,
-0.3336899, 0.9240991, -0.6279008, 0, 1, 0.3568628, 1,
-0.3322661, 0.7358435, -1.21772, 0, 1, 0.3647059, 1,
-0.3304541, 0.165041, -2.800542, 0, 1, 0.3686275, 1,
-0.3292136, 0.1100251, -1.813245, 0, 1, 0.3764706, 1,
-0.3283024, 0.9204886, -1.806927, 0, 1, 0.3803922, 1,
-0.3244908, 0.6248071, -0.5105225, 0, 1, 0.3882353, 1,
-0.3232371, -1.193736, -2.234035, 0, 1, 0.3921569, 1,
-0.3216442, 2.116657, 0.9404308, 0, 1, 0.4, 1,
-0.3044208, -0.9449648, -2.922409, 0, 1, 0.4078431, 1,
-0.2908999, 1.698348, 0.4949345, 0, 1, 0.4117647, 1,
-0.2897281, -0.04746993, -3.173415, 0, 1, 0.4196078, 1,
-0.2821462, 0.6445063, -0.7452022, 0, 1, 0.4235294, 1,
-0.2807259, -1.401226, -3.612057, 0, 1, 0.4313726, 1,
-0.2788433, 0.9901401, -0.9877496, 0, 1, 0.4352941, 1,
-0.2779205, 0.4113793, -1.905099, 0, 1, 0.4431373, 1,
-0.2758111, 0.835985, 1.070708, 0, 1, 0.4470588, 1,
-0.2736598, 1.302737, 0.1097107, 0, 1, 0.454902, 1,
-0.2717705, 1.273508, 0.3371406, 0, 1, 0.4588235, 1,
-0.2707259, -0.543258, -2.000082, 0, 1, 0.4666667, 1,
-0.2676455, 0.6864225, 2.216635, 0, 1, 0.4705882, 1,
-0.2657949, -1.255451, -2.054366, 0, 1, 0.4784314, 1,
-0.2640723, -1.375227, -1.532146, 0, 1, 0.4823529, 1,
-0.2624272, 0.2061315, -2.754574, 0, 1, 0.4901961, 1,
-0.258333, -0.9077329, -2.001159, 0, 1, 0.4941176, 1,
-0.2579701, -0.3046469, -2.413062, 0, 1, 0.5019608, 1,
-0.2543595, 1.328885, 1.443628, 0, 1, 0.509804, 1,
-0.2542047, 0.322332, -1.556626, 0, 1, 0.5137255, 1,
-0.2527372, 0.9365306, -0.7994868, 0, 1, 0.5215687, 1,
-0.2520021, -0.1407122, -1.883328, 0, 1, 0.5254902, 1,
-0.249492, 1.316788, -0.09131125, 0, 1, 0.5333334, 1,
-0.2492894, -0.6178734, -2.408765, 0, 1, 0.5372549, 1,
-0.2491314, -1.452797, -3.617795, 0, 1, 0.5450981, 1,
-0.2482011, -0.402844, -3.423923, 0, 1, 0.5490196, 1,
-0.2460337, -0.4812056, -2.217122, 0, 1, 0.5568628, 1,
-0.2421561, 0.7542633, -1.139234, 0, 1, 0.5607843, 1,
-0.2418434, -1.351712, -2.520951, 0, 1, 0.5686275, 1,
-0.2398439, 1.865533, -3.032414, 0, 1, 0.572549, 1,
-0.2371778, -0.1580269, -1.616407, 0, 1, 0.5803922, 1,
-0.2364504, 0.2670423, 0.3048111, 0, 1, 0.5843138, 1,
-0.2363973, -0.7231801, -2.896636, 0, 1, 0.5921569, 1,
-0.2338402, -0.8312159, -2.0439, 0, 1, 0.5960785, 1,
-0.2283654, -0.3999573, -3.796544, 0, 1, 0.6039216, 1,
-0.222322, 1.623212, -0.09436604, 0, 1, 0.6117647, 1,
-0.2222427, -0.4131102, -3.681173, 0, 1, 0.6156863, 1,
-0.2218576, -0.3043832, -2.381838, 0, 1, 0.6235294, 1,
-0.2217693, -1.105312, -2.940749, 0, 1, 0.627451, 1,
-0.2191617, -1.392886, -2.17112, 0, 1, 0.6352941, 1,
-0.2146802, 0.09770151, -2.130657, 0, 1, 0.6392157, 1,
-0.2142814, -0.05125351, -2.311525, 0, 1, 0.6470588, 1,
-0.2117508, 1.340449, -1.13228, 0, 1, 0.6509804, 1,
-0.2106941, -0.2957946, -2.067882, 0, 1, 0.6588235, 1,
-0.2102363, 0.9268436, -0.4695939, 0, 1, 0.6627451, 1,
-0.2080858, 1.103173, 0.8892278, 0, 1, 0.6705883, 1,
-0.2002903, 0.1692728, -3.208742, 0, 1, 0.6745098, 1,
-0.196698, 0.8480884, -2.009825, 0, 1, 0.682353, 1,
-0.1884218, -0.1375852, -2.358412, 0, 1, 0.6862745, 1,
-0.1761533, 2.679768, 1.168624, 0, 1, 0.6941177, 1,
-0.173045, 1.299345, -0.5236799, 0, 1, 0.7019608, 1,
-0.1716533, -1.572478, -2.456106, 0, 1, 0.7058824, 1,
-0.1704982, -0.6424921, -2.501256, 0, 1, 0.7137255, 1,
-0.1643969, 0.3700921, 0.2096255, 0, 1, 0.7176471, 1,
-0.1595783, -0.4654393, -3.502256, 0, 1, 0.7254902, 1,
-0.1595444, 0.6291117, -1.371872, 0, 1, 0.7294118, 1,
-0.1582945, 1.38747, -0.4207848, 0, 1, 0.7372549, 1,
-0.1557382, 0.1871721, -1.622802, 0, 1, 0.7411765, 1,
-0.1519034, 0.7145995, 0.2191744, 0, 1, 0.7490196, 1,
-0.1501103, -0.7078027, -1.839692, 0, 1, 0.7529412, 1,
-0.1485867, -0.5178711, -2.737593, 0, 1, 0.7607843, 1,
-0.1443851, 0.4705399, 0.6827154, 0, 1, 0.7647059, 1,
-0.1436905, 0.2846082, -0.355509, 0, 1, 0.772549, 1,
-0.1383988, 1.1321, -1.676825, 0, 1, 0.7764706, 1,
-0.1372257, 1.224922, -0.7077696, 0, 1, 0.7843137, 1,
-0.1287837, -0.05666677, 0.4721283, 0, 1, 0.7882353, 1,
-0.1264995, -0.8106171, -2.867026, 0, 1, 0.7960784, 1,
-0.1190781, -0.8748931, -2.077255, 0, 1, 0.8039216, 1,
-0.1146983, 0.01807616, -1.187775, 0, 1, 0.8078431, 1,
-0.113919, 0.8551891, -2.298612, 0, 1, 0.8156863, 1,
-0.1134415, 1.517253, -1.798346, 0, 1, 0.8196079, 1,
-0.112345, -0.2319495, -3.003872, 0, 1, 0.827451, 1,
-0.1090776, 1.209161, 2.16953, 0, 1, 0.8313726, 1,
-0.1051227, -0.8153068, -1.317793, 0, 1, 0.8392157, 1,
-0.1039735, 1.109124, -1.395243, 0, 1, 0.8431373, 1,
-0.1031637, 0.4408654, -0.1209038, 0, 1, 0.8509804, 1,
-0.1017438, -0.8386083, -2.412238, 0, 1, 0.854902, 1,
-0.09639645, 1.598676, 0.3523428, 0, 1, 0.8627451, 1,
-0.09326122, -2.021521, -2.828675, 0, 1, 0.8666667, 1,
-0.09267078, 1.404079, 1.058126, 0, 1, 0.8745098, 1,
-0.09035259, 0.4046704, 0.1219796, 0, 1, 0.8784314, 1,
-0.08922934, 0.3376918, 1.493018, 0, 1, 0.8862745, 1,
-0.08890152, 0.4035162, 0.7709966, 0, 1, 0.8901961, 1,
-0.08841698, -0.855506, -3.001182, 0, 1, 0.8980392, 1,
-0.08109011, 0.6729667, 0.5083324, 0, 1, 0.9058824, 1,
-0.08105333, -0.8734478, -3.275138, 0, 1, 0.9098039, 1,
-0.08088902, 0.1006302, -3.496016, 0, 1, 0.9176471, 1,
-0.07826181, -0.35661, -1.663843, 0, 1, 0.9215686, 1,
-0.07067826, 0.5958442, 0.4377089, 0, 1, 0.9294118, 1,
-0.06960514, -1.426663, -3.744286, 0, 1, 0.9333333, 1,
-0.06226183, -2.213343, -0.7006603, 0, 1, 0.9411765, 1,
-0.06147, -0.6174167, -3.187723, 0, 1, 0.945098, 1,
-0.06007303, -0.666864, -2.675818, 0, 1, 0.9529412, 1,
-0.05952286, 0.6291221, 0.3915598, 0, 1, 0.9568627, 1,
-0.05669226, 0.3689826, 0.3587084, 0, 1, 0.9647059, 1,
-0.05527773, 0.6853083, 0.9065333, 0, 1, 0.9686275, 1,
-0.05372919, 2.467598, -2.444292, 0, 1, 0.9764706, 1,
-0.04862103, 0.01725556, -0.6304991, 0, 1, 0.9803922, 1,
-0.04503777, -0.4534751, -3.266189, 0, 1, 0.9882353, 1,
-0.04489319, 1.032418, -0.1232997, 0, 1, 0.9921569, 1,
-0.04383639, -1.282769, -3.023452, 0, 1, 1, 1,
-0.04370976, -0.9641399, -4.552469, 0, 0.9921569, 1, 1,
-0.03818492, -1.153336, -2.484278, 0, 0.9882353, 1, 1,
-0.03467149, 1.056406, 0.2971503, 0, 0.9803922, 1, 1,
-0.03444636, 0.5730262, -0.1859813, 0, 0.9764706, 1, 1,
-0.03040984, 1.4312, -1.473472, 0, 0.9686275, 1, 1,
-0.02812563, -0.4234266, -3.59789, 0, 0.9647059, 1, 1,
-0.02633937, 0.9920483, 1.991412, 0, 0.9568627, 1, 1,
-0.02600664, 0.9662421, -0.1478991, 0, 0.9529412, 1, 1,
-0.02070735, -0.4830261, -4.559873, 0, 0.945098, 1, 1,
-0.01916565, -0.08975379, -3.527247, 0, 0.9411765, 1, 1,
-0.01577407, -1.033457, -3.180065, 0, 0.9333333, 1, 1,
-0.009279209, -0.7968003, -1.832847, 0, 0.9294118, 1, 1,
-0.008127758, 0.1236304, -1.663389, 0, 0.9215686, 1, 1,
-0.006895871, -1.294133, -2.035999, 0, 0.9176471, 1, 1,
-0.005521697, -0.02560911, -1.870307, 0, 0.9098039, 1, 1,
-0.005144549, 0.3076675, -0.424656, 0, 0.9058824, 1, 1,
-0.003571655, -0.9588146, -3.348192, 0, 0.8980392, 1, 1,
0.006087608, 2.003108, 2.206046, 0, 0.8901961, 1, 1,
0.008211647, -0.2729501, 2.171185, 0, 0.8862745, 1, 1,
0.008585482, -0.9960237, 2.536921, 0, 0.8784314, 1, 1,
0.01503407, 0.1990157, -0.6708649, 0, 0.8745098, 1, 1,
0.01562854, -0.7832351, 1.764646, 0, 0.8666667, 1, 1,
0.0161129, -0.3002036, 2.739587, 0, 0.8627451, 1, 1,
0.02070635, -0.2945522, 1.774169, 0, 0.854902, 1, 1,
0.02097188, -0.4093269, 2.758563, 0, 0.8509804, 1, 1,
0.0216677, -1.100711, 3.043538, 0, 0.8431373, 1, 1,
0.02257326, 1.322507, -1.139607, 0, 0.8392157, 1, 1,
0.0245249, 1.060746, 1.116223, 0, 0.8313726, 1, 1,
0.03468154, -0.5916287, 1.981306, 0, 0.827451, 1, 1,
0.03601355, 0.1378027, -1.892872, 0, 0.8196079, 1, 1,
0.03800284, -0.3446325, 4.955785, 0, 0.8156863, 1, 1,
0.05312474, -0.3617683, 3.653601, 0, 0.8078431, 1, 1,
0.05986107, -1.455396, 3.331235, 0, 0.8039216, 1, 1,
0.06071221, 0.8998749, -1.735585, 0, 0.7960784, 1, 1,
0.06269351, 2.309313, 0.3986498, 0, 0.7882353, 1, 1,
0.06431805, -0.393544, 2.734223, 0, 0.7843137, 1, 1,
0.06531289, 0.8530147, -0.3243831, 0, 0.7764706, 1, 1,
0.06533279, -1.291918, 3.979212, 0, 0.772549, 1, 1,
0.06692865, 1.615106, -0.2960916, 0, 0.7647059, 1, 1,
0.06843065, -0.01052298, 1.086178, 0, 0.7607843, 1, 1,
0.07202744, 1.854893, 0.3153022, 0, 0.7529412, 1, 1,
0.07245327, 0.7599581, 0.7792195, 0, 0.7490196, 1, 1,
0.07252972, 0.8523178, 0.08543081, 0, 0.7411765, 1, 1,
0.07308665, 0.2106515, -0.345477, 0, 0.7372549, 1, 1,
0.07361764, 1.784232, 0.7997472, 0, 0.7294118, 1, 1,
0.07438055, -0.05769574, 1.82221, 0, 0.7254902, 1, 1,
0.07744396, -0.5243903, 4.298714, 0, 0.7176471, 1, 1,
0.07846709, -0.4961631, 1.816774, 0, 0.7137255, 1, 1,
0.08048993, -0.09859453, 4.349059, 0, 0.7058824, 1, 1,
0.0831919, 1.705615, -0.06655092, 0, 0.6980392, 1, 1,
0.08354389, -1.029966, 4.807909, 0, 0.6941177, 1, 1,
0.08469687, 1.065668, -0.04298914, 0, 0.6862745, 1, 1,
0.08477819, -0.3490409, 2.578725, 0, 0.682353, 1, 1,
0.08495496, 0.6053833, 0.7059455, 0, 0.6745098, 1, 1,
0.08535717, 1.465638, -0.9779924, 0, 0.6705883, 1, 1,
0.08648331, 0.5989808, 1.357751, 0, 0.6627451, 1, 1,
0.087112, -1.421859, 3.584281, 0, 0.6588235, 1, 1,
0.0876067, -0.8274639, 2.025161, 0, 0.6509804, 1, 1,
0.08811881, -0.2183349, 1.4151, 0, 0.6470588, 1, 1,
0.09008922, -0.9434296, 1.953347, 0, 0.6392157, 1, 1,
0.09591564, -1.770065, 4.217967, 0, 0.6352941, 1, 1,
0.09636493, 0.04144982, 1.231926, 0, 0.627451, 1, 1,
0.114402, 0.8009207, 0.8381814, 0, 0.6235294, 1, 1,
0.1189069, -1.260649, 4.3748, 0, 0.6156863, 1, 1,
0.123253, 0.08536814, 1.371921, 0, 0.6117647, 1, 1,
0.1261889, 0.6095754, 1.061093, 0, 0.6039216, 1, 1,
0.1282526, 0.1933611, 1.560883, 0, 0.5960785, 1, 1,
0.1346989, 1.635298, -0.7067159, 0, 0.5921569, 1, 1,
0.1385013, -0.2918624, 4.051771, 0, 0.5843138, 1, 1,
0.1385159, 1.323785, 0.2851904, 0, 0.5803922, 1, 1,
0.1425851, -0.9490979, 1.4674, 0, 0.572549, 1, 1,
0.1435902, -0.3093559, 2.366635, 0, 0.5686275, 1, 1,
0.1444129, -0.1057278, 3.754874, 0, 0.5607843, 1, 1,
0.1466369, -0.4973257, 1.016942, 0, 0.5568628, 1, 1,
0.1477908, 2.548726, -0.6562826, 0, 0.5490196, 1, 1,
0.1516959, 1.507068, -0.6833032, 0, 0.5450981, 1, 1,
0.1544525, -0.9312775, 3.585577, 0, 0.5372549, 1, 1,
0.1572907, 0.5619015, 1.27455, 0, 0.5333334, 1, 1,
0.1607556, -0.1748451, 3.140822, 0, 0.5254902, 1, 1,
0.1631435, 1.581527, 1.74945, 0, 0.5215687, 1, 1,
0.1632573, -0.8697048, 3.863334, 0, 0.5137255, 1, 1,
0.1705394, 0.5492243, 0.2966592, 0, 0.509804, 1, 1,
0.1756803, -0.04407842, 0.8511234, 0, 0.5019608, 1, 1,
0.1811041, -0.06194817, 1.556627, 0, 0.4941176, 1, 1,
0.1814054, 0.2737309, 0.6835641, 0, 0.4901961, 1, 1,
0.184245, -1.019446, 3.953543, 0, 0.4823529, 1, 1,
0.1850541, -1.393037, 4.005545, 0, 0.4784314, 1, 1,
0.1877315, 1.244004, 0.8339106, 0, 0.4705882, 1, 1,
0.1886343, 0.5527158, 1.384746, 0, 0.4666667, 1, 1,
0.1902263, 0.4638058, 0.007018202, 0, 0.4588235, 1, 1,
0.1923518, -1.311164, 2.867669, 0, 0.454902, 1, 1,
0.1949479, 0.2255906, 0.4592372, 0, 0.4470588, 1, 1,
0.1988953, 0.9182693, 0.5907469, 0, 0.4431373, 1, 1,
0.2019469, 0.2410065, 1.373546, 0, 0.4352941, 1, 1,
0.2092248, -0.6193364, 3.121356, 0, 0.4313726, 1, 1,
0.2190693, -1.507215, 2.730742, 0, 0.4235294, 1, 1,
0.2191125, 0.08205483, -0.4678123, 0, 0.4196078, 1, 1,
0.2199388, -0.46035, 2.026301, 0, 0.4117647, 1, 1,
0.2247005, 0.1395209, -0.3460416, 0, 0.4078431, 1, 1,
0.2316127, 0.750409, -1.23368, 0, 0.4, 1, 1,
0.2319276, -0.3337045, 0.2423553, 0, 0.3921569, 1, 1,
0.2322118, -1.054267, 1.902112, 0, 0.3882353, 1, 1,
0.2343358, -0.5139632, 2.902182, 0, 0.3803922, 1, 1,
0.2398849, -0.6923977, 2.605103, 0, 0.3764706, 1, 1,
0.2431269, 0.004068134, 0.5835159, 0, 0.3686275, 1, 1,
0.2432214, -0.7328779, 3.984393, 0, 0.3647059, 1, 1,
0.2444744, 0.7782173, 1.251352, 0, 0.3568628, 1, 1,
0.2537231, 1.793899, -0.6835268, 0, 0.3529412, 1, 1,
0.2608004, -0.8876756, 3.493324, 0, 0.345098, 1, 1,
0.2612417, -0.008694363, 2.709947, 0, 0.3411765, 1, 1,
0.2636448, 0.1524345, 1.72292, 0, 0.3333333, 1, 1,
0.2695496, 1.875291, -0.5474278, 0, 0.3294118, 1, 1,
0.2726882, -1.308132, 2.085537, 0, 0.3215686, 1, 1,
0.2730482, -1.555425, 3.94689, 0, 0.3176471, 1, 1,
0.2788577, -1.351563, 5.153715, 0, 0.3098039, 1, 1,
0.281032, -0.2839616, 1.653774, 0, 0.3058824, 1, 1,
0.2917044, 0.3515719, 1.234532, 0, 0.2980392, 1, 1,
0.2981976, -0.2270394, 3.116128, 0, 0.2901961, 1, 1,
0.2983715, 0.9526934, 0.2518938, 0, 0.2862745, 1, 1,
0.2990387, 0.6499827, 0.8056495, 0, 0.2784314, 1, 1,
0.3011419, 1.123263, 0.816125, 0, 0.2745098, 1, 1,
0.3023872, 0.08757222, 0.02515458, 0, 0.2666667, 1, 1,
0.3076943, -0.9813904, 2.275229, 0, 0.2627451, 1, 1,
0.3084853, -1.468702, 3.163233, 0, 0.254902, 1, 1,
0.3173157, 1.132743, -0.4936088, 0, 0.2509804, 1, 1,
0.3181591, -1.286783, 2.830843, 0, 0.2431373, 1, 1,
0.3196467, 1.046919, 0.8070092, 0, 0.2392157, 1, 1,
0.3202266, 0.2089657, 0.2548154, 0, 0.2313726, 1, 1,
0.3222812, -0.7734681, 3.135525, 0, 0.227451, 1, 1,
0.3236402, 0.2483631, 2.042737, 0, 0.2196078, 1, 1,
0.3279218, -1.152486, 3.009193, 0, 0.2156863, 1, 1,
0.3299429, -1.609597, 2.606966, 0, 0.2078431, 1, 1,
0.3340466, -0.7404881, 1.417094, 0, 0.2039216, 1, 1,
0.3357848, -0.7002777, 2.959018, 0, 0.1960784, 1, 1,
0.3359085, -1.720015, 2.981537, 0, 0.1882353, 1, 1,
0.3372984, 0.3645528, 0.8776318, 0, 0.1843137, 1, 1,
0.3383155, 2.054504, -0.03487771, 0, 0.1764706, 1, 1,
0.3411348, -0.5707508, 1.994377, 0, 0.172549, 1, 1,
0.3429156, -0.7375234, 2.42183, 0, 0.1647059, 1, 1,
0.3430562, -0.8153942, 0.3141212, 0, 0.1607843, 1, 1,
0.3453536, 0.3986708, 1.136363, 0, 0.1529412, 1, 1,
0.346599, -1.627242, 3.900726, 0, 0.1490196, 1, 1,
0.3471715, -1.190421, 3.221859, 0, 0.1411765, 1, 1,
0.3486011, 0.3810281, -0.1525837, 0, 0.1372549, 1, 1,
0.3489619, -0.36246, 2.544409, 0, 0.1294118, 1, 1,
0.349794, -0.05326631, 0.5829287, 0, 0.1254902, 1, 1,
0.3510765, -2.390009, 4.477722, 0, 0.1176471, 1, 1,
0.3513503, 1.053522, 0.9634163, 0, 0.1137255, 1, 1,
0.3594575, 0.8435362, 1.968638, 0, 0.1058824, 1, 1,
0.3617557, -0.3337152, 3.033944, 0, 0.09803922, 1, 1,
0.362815, 0.3966061, -0.7521486, 0, 0.09411765, 1, 1,
0.3688023, -1.49286, 2.124453, 0, 0.08627451, 1, 1,
0.3696096, 0.7964584, -0.8165675, 0, 0.08235294, 1, 1,
0.3708456, -1.405513, 2.004424, 0, 0.07450981, 1, 1,
0.3724691, -1.56988, 2.880098, 0, 0.07058824, 1, 1,
0.3729054, 0.3099713, 3.165013, 0, 0.0627451, 1, 1,
0.3730311, 0.5404885, -1.097018, 0, 0.05882353, 1, 1,
0.3756631, 0.3434538, 0.8744646, 0, 0.05098039, 1, 1,
0.3901544, 0.9044843, -0.4365806, 0, 0.04705882, 1, 1,
0.3916926, 0.9232411, -1.077209, 0, 0.03921569, 1, 1,
0.3995191, -0.5189541, 2.766932, 0, 0.03529412, 1, 1,
0.4046438, 0.217721, 0.6636654, 0, 0.02745098, 1, 1,
0.4051391, 1.001701, -0.4640723, 0, 0.02352941, 1, 1,
0.4073674, -1.896374, 1.483783, 0, 0.01568628, 1, 1,
0.4085105, -2.481711, 3.258872, 0, 0.01176471, 1, 1,
0.4098713, 0.7662858, -0.2198556, 0, 0.003921569, 1, 1,
0.4126743, 0.7904712, 0.6192836, 0.003921569, 0, 1, 1,
0.4174673, 1.942809, -0.7999581, 0.007843138, 0, 1, 1,
0.4222794, 0.3519491, 1.510325, 0.01568628, 0, 1, 1,
0.4241463, -0.8527193, 4.232075, 0.01960784, 0, 1, 1,
0.4269195, 1.06466, 0.2317682, 0.02745098, 0, 1, 1,
0.428115, -0.5141836, 2.820017, 0.03137255, 0, 1, 1,
0.4301574, 0.8013772, 1.544054, 0.03921569, 0, 1, 1,
0.4322649, 0.8253781, 1.614269, 0.04313726, 0, 1, 1,
0.4330239, -1.818973, 2.326188, 0.05098039, 0, 1, 1,
0.4344743, -0.74461, 1.816616, 0.05490196, 0, 1, 1,
0.4360757, 0.2421553, 1.574377, 0.0627451, 0, 1, 1,
0.4384282, 1.313517, 0.607185, 0.06666667, 0, 1, 1,
0.4435996, 0.3581059, -0.1261409, 0.07450981, 0, 1, 1,
0.4473918, -1.188871, 3.125989, 0.07843138, 0, 1, 1,
0.4498009, 0.336547, 0.5013306, 0.08627451, 0, 1, 1,
0.4519932, 1.80387, 1.993978, 0.09019608, 0, 1, 1,
0.4528784, 0.5105239, 0.2753411, 0.09803922, 0, 1, 1,
0.4529607, 0.3247428, 0.3498912, 0.1058824, 0, 1, 1,
0.4555775, -0.6703888, 2.442091, 0.1098039, 0, 1, 1,
0.4565382, 0.9591541, -1.744096, 0.1176471, 0, 1, 1,
0.4576911, -0.4642459, 2.246421, 0.1215686, 0, 1, 1,
0.4651304, -0.7702128, 2.400309, 0.1294118, 0, 1, 1,
0.4787312, -0.4520741, 2.474082, 0.1333333, 0, 1, 1,
0.4788085, -1.176182, 3.652179, 0.1411765, 0, 1, 1,
0.4791285, 1.102592, -1.119964, 0.145098, 0, 1, 1,
0.48702, 0.4329484, -0.8244309, 0.1529412, 0, 1, 1,
0.4875103, -0.6532212, 2.137717, 0.1568628, 0, 1, 1,
0.4952128, 0.9736005, 0.0127373, 0.1647059, 0, 1, 1,
0.4983211, -0.9690442, 0.7538032, 0.1686275, 0, 1, 1,
0.4986567, 0.5756534, 0.4318893, 0.1764706, 0, 1, 1,
0.5012742, 0.8879604, -1.344464, 0.1803922, 0, 1, 1,
0.5074112, 0.6125119, 0.180702, 0.1882353, 0, 1, 1,
0.508027, -1.276435, 1.623681, 0.1921569, 0, 1, 1,
0.51157, -1.437067, 0.6616493, 0.2, 0, 1, 1,
0.514798, 0.4517423, -0.4292377, 0.2078431, 0, 1, 1,
0.5176196, -0.02099116, 0.8708447, 0.2117647, 0, 1, 1,
0.5209048, -1.292271, 3.006497, 0.2196078, 0, 1, 1,
0.5273001, -0.1169379, 2.004477, 0.2235294, 0, 1, 1,
0.5357208, -0.4287492, 3.466781, 0.2313726, 0, 1, 1,
0.5382586, 1.165799, 0.925599, 0.2352941, 0, 1, 1,
0.546066, -0.1483581, 0.4393842, 0.2431373, 0, 1, 1,
0.5472251, -2.592948, 2.129269, 0.2470588, 0, 1, 1,
0.5553633, 1.070856, -1.038175, 0.254902, 0, 1, 1,
0.556493, 1.626932, 0.2381002, 0.2588235, 0, 1, 1,
0.5572689, -0.3452117, 0.7843338, 0.2666667, 0, 1, 1,
0.5576189, -0.3114276, 3.434341, 0.2705882, 0, 1, 1,
0.5644994, -0.827755, 4.804104, 0.2784314, 0, 1, 1,
0.5691926, -0.8477164, 3.630176, 0.282353, 0, 1, 1,
0.5752287, -1.194397, 3.991457, 0.2901961, 0, 1, 1,
0.5778642, 0.2284649, 2.504455, 0.2941177, 0, 1, 1,
0.5845901, 2.136175, -0.8878397, 0.3019608, 0, 1, 1,
0.5883598, -0.2003295, 1.962119, 0.3098039, 0, 1, 1,
0.595304, -0.5256825, 2.111184, 0.3137255, 0, 1, 1,
0.5956956, -1.73093, 2.075533, 0.3215686, 0, 1, 1,
0.6020624, 1.329307, 1.757445, 0.3254902, 0, 1, 1,
0.6047445, 1.171542, 0.8780338, 0.3333333, 0, 1, 1,
0.6104089, -1.167041, 1.642639, 0.3372549, 0, 1, 1,
0.6125738, 0.7970328, -0.7373033, 0.345098, 0, 1, 1,
0.6129792, -1.199742, 3.055145, 0.3490196, 0, 1, 1,
0.6137165, -0.9548104, 1.247804, 0.3568628, 0, 1, 1,
0.6137311, -0.2456547, 4.928903, 0.3607843, 0, 1, 1,
0.6148108, -1.834042, 3.421875, 0.3686275, 0, 1, 1,
0.6155547, -1.924245, 2.318189, 0.372549, 0, 1, 1,
0.6202259, -0.8889654, 3.457581, 0.3803922, 0, 1, 1,
0.6212202, -0.2733565, 2.9353, 0.3843137, 0, 1, 1,
0.6259003, -0.8984827, 1.461353, 0.3921569, 0, 1, 1,
0.6287746, 0.419233, 0.8656604, 0.3960784, 0, 1, 1,
0.629878, -1.180453, 2.332189, 0.4039216, 0, 1, 1,
0.6377735, -1.516846, 2.80632, 0.4117647, 0, 1, 1,
0.6474006, -1.324274, 2.359081, 0.4156863, 0, 1, 1,
0.6489128, 0.3174303, 1.125002, 0.4235294, 0, 1, 1,
0.6526853, -0.2660434, 1.74213, 0.427451, 0, 1, 1,
0.6540368, 0.1659098, 1.513715, 0.4352941, 0, 1, 1,
0.6543003, -0.2681988, 1.917528, 0.4392157, 0, 1, 1,
0.6581342, -0.7304555, 3.201876, 0.4470588, 0, 1, 1,
0.6615381, 1.40875, 1.782922, 0.4509804, 0, 1, 1,
0.6701959, -0.8254853, 2.908725, 0.4588235, 0, 1, 1,
0.6724656, 1.24954, 0.1539809, 0.4627451, 0, 1, 1,
0.6731087, 1.503503, 0.1414734, 0.4705882, 0, 1, 1,
0.6742837, 0.5644738, -0.02295335, 0.4745098, 0, 1, 1,
0.6757374, 0.1958502, 1.171204, 0.4823529, 0, 1, 1,
0.6791247, -1.174547, 4.943629, 0.4862745, 0, 1, 1,
0.6809075, -0.7408872, 1.525471, 0.4941176, 0, 1, 1,
0.6825405, 0.7602116, -0.5696221, 0.5019608, 0, 1, 1,
0.6856289, -0.136227, 1.003388, 0.5058824, 0, 1, 1,
0.6882246, 0.2101725, 1.810364, 0.5137255, 0, 1, 1,
0.6988454, -0.2942692, 2.499166, 0.5176471, 0, 1, 1,
0.7008926, -0.7592895, 3.302603, 0.5254902, 0, 1, 1,
0.7085504, -1.239889, 3.291705, 0.5294118, 0, 1, 1,
0.7102963, -0.5809276, 1.908089, 0.5372549, 0, 1, 1,
0.712267, -0.5502503, 2.792596, 0.5411765, 0, 1, 1,
0.7160574, 1.744946, -0.4525654, 0.5490196, 0, 1, 1,
0.717798, -0.4488727, 1.023293, 0.5529412, 0, 1, 1,
0.7294456, -1.908126, 3.269397, 0.5607843, 0, 1, 1,
0.7310209, 1.001904, 1.506352, 0.5647059, 0, 1, 1,
0.7322546, -1.517411, 2.01795, 0.572549, 0, 1, 1,
0.7332358, -0.2119145, 3.158613, 0.5764706, 0, 1, 1,
0.733426, -0.7969131, 2.411044, 0.5843138, 0, 1, 1,
0.7372757, -0.8296533, 1.641707, 0.5882353, 0, 1, 1,
0.7388371, -0.3062716, 2.650099, 0.5960785, 0, 1, 1,
0.7394524, -2.199598, 3.796562, 0.6039216, 0, 1, 1,
0.7424524, -1.584732, 3.909868, 0.6078432, 0, 1, 1,
0.7429049, 0.8984271, -0.03767719, 0.6156863, 0, 1, 1,
0.7444445, -1.011824, 3.944741, 0.6196079, 0, 1, 1,
0.7530655, 0.9633822, -0.2326349, 0.627451, 0, 1, 1,
0.757141, 1.739489, -0.9054545, 0.6313726, 0, 1, 1,
0.7578006, 1.843423, 0.5602605, 0.6392157, 0, 1, 1,
0.7639288, -0.6529629, 2.229412, 0.6431373, 0, 1, 1,
0.7665199, -1.415989, 1.803815, 0.6509804, 0, 1, 1,
0.7734268, 1.298989, -1.075894, 0.654902, 0, 1, 1,
0.7780489, 1.260169, 1.880919, 0.6627451, 0, 1, 1,
0.7800477, -0.5499971, 1.670135, 0.6666667, 0, 1, 1,
0.781242, 0.7487497, -1.281463, 0.6745098, 0, 1, 1,
0.786057, -0.283849, 1.059976, 0.6784314, 0, 1, 1,
0.8087767, 1.419633, 0.8747004, 0.6862745, 0, 1, 1,
0.809018, -1.584171, 1.398054, 0.6901961, 0, 1, 1,
0.8136535, -1.535179, 1.503147, 0.6980392, 0, 1, 1,
0.8146554, 0.5035396, 0.2676465, 0.7058824, 0, 1, 1,
0.8185508, -0.3351214, 1.302469, 0.7098039, 0, 1, 1,
0.8209574, -1.518821, 1.537351, 0.7176471, 0, 1, 1,
0.82777, 1.31074, 2.02709, 0.7215686, 0, 1, 1,
0.8295043, 0.4522132, 2.31937, 0.7294118, 0, 1, 1,
0.836983, 0.1558996, 1.010419, 0.7333333, 0, 1, 1,
0.8396016, -0.4854407, 3.012558, 0.7411765, 0, 1, 1,
0.8400365, -0.5283821, 2.050333, 0.7450981, 0, 1, 1,
0.8415136, 1.645818, -0.3912171, 0.7529412, 0, 1, 1,
0.8426628, 0.1300343, -0.1507233, 0.7568628, 0, 1, 1,
0.8467727, -0.3072245, 0.7651792, 0.7647059, 0, 1, 1,
0.8509497, -0.3791696, 2.179532, 0.7686275, 0, 1, 1,
0.8521844, 0.9614151, 0.6483932, 0.7764706, 0, 1, 1,
0.8610339, -0.4404315, 2.854446, 0.7803922, 0, 1, 1,
0.8614249, -0.7189238, 1.531809, 0.7882353, 0, 1, 1,
0.8688315, 0.6148139, 0.3164262, 0.7921569, 0, 1, 1,
0.8691955, 0.8345546, 2.831501, 0.8, 0, 1, 1,
0.8807039, -0.3862677, 1.920156, 0.8078431, 0, 1, 1,
0.8860115, -0.5339068, 3.06677, 0.8117647, 0, 1, 1,
0.8881059, 1.301463, 0.5504946, 0.8196079, 0, 1, 1,
0.8883411, 2.070065, 0.1774423, 0.8235294, 0, 1, 1,
0.8926142, -0.3267597, 1.369739, 0.8313726, 0, 1, 1,
0.8927479, 0.4755517, 0.6691551, 0.8352941, 0, 1, 1,
0.8945629, -0.1123697, 2.38675, 0.8431373, 0, 1, 1,
0.8955189, -2.073004, 0.9983898, 0.8470588, 0, 1, 1,
0.8973961, -0.9310005, 3.516045, 0.854902, 0, 1, 1,
0.9046744, -0.2827477, 3.1998, 0.8588235, 0, 1, 1,
0.9082127, 0.1216215, -0.08969456, 0.8666667, 0, 1, 1,
0.9091986, -0.7252049, 1.218269, 0.8705882, 0, 1, 1,
0.9153326, -0.4067477, 1.647487, 0.8784314, 0, 1, 1,
0.9203772, 0.7452857, 0.7013857, 0.8823529, 0, 1, 1,
0.9203841, 1.050689, 0.7817913, 0.8901961, 0, 1, 1,
0.9299915, -0.3768975, 2.745773, 0.8941177, 0, 1, 1,
0.9344521, 0.2893131, 2.024217, 0.9019608, 0, 1, 1,
0.9355627, -0.3143353, 3.716918, 0.9098039, 0, 1, 1,
0.9359751, 0.2840226, 1.422376, 0.9137255, 0, 1, 1,
0.9367708, 1.725248, 2.203428, 0.9215686, 0, 1, 1,
0.9391462, -0.5401192, 0.1688272, 0.9254902, 0, 1, 1,
0.9393149, 1.427781, -0.007160393, 0.9333333, 0, 1, 1,
0.9401716, -0.04122506, 2.483081, 0.9372549, 0, 1, 1,
0.9433274, -0.3862718, 1.386192, 0.945098, 0, 1, 1,
0.9460179, -1.390763, 4.558762, 0.9490196, 0, 1, 1,
0.9588107, -1.543274, 2.375173, 0.9568627, 0, 1, 1,
0.9588185, -0.4254261, 3.729223, 0.9607843, 0, 1, 1,
0.9605959, 0.366338, 2.084484, 0.9686275, 0, 1, 1,
0.9619348, -0.4763682, 1.045432, 0.972549, 0, 1, 1,
0.9625536, 1.120599, 3.520613, 0.9803922, 0, 1, 1,
0.9637352, -0.1316663, 1.647537, 0.9843137, 0, 1, 1,
0.9654933, -0.01095728, 2.371027, 0.9921569, 0, 1, 1,
0.9737849, -1.344855, 0.3488478, 0.9960784, 0, 1, 1,
0.9849508, -0.324041, 0.9044169, 1, 0, 0.9960784, 1,
0.9984237, 1.2157, 1.181196, 1, 0, 0.9882353, 1,
1.002156, -0.09313138, 0.3508195, 1, 0, 0.9843137, 1,
1.003333, -0.4746819, 1.848087, 1, 0, 0.9764706, 1,
1.003604, 1.459538, -1.564317, 1, 0, 0.972549, 1,
1.019905, 1.004339, -0.5779636, 1, 0, 0.9647059, 1,
1.034346, -0.277097, 2.717392, 1, 0, 0.9607843, 1,
1.037636, -1.916329, 4.56838, 1, 0, 0.9529412, 1,
1.041272, 1.801622, -1.119031, 1, 0, 0.9490196, 1,
1.04478, -2.131148, 0.7582924, 1, 0, 0.9411765, 1,
1.049764, -1.455671, 1.66144, 1, 0, 0.9372549, 1,
1.049915, -0.2724018, 1.117322, 1, 0, 0.9294118, 1,
1.050711, 0.949746, -0.8257972, 1, 0, 0.9254902, 1,
1.051958, -0.2110341, 2.466461, 1, 0, 0.9176471, 1,
1.056115, -0.6608878, 2.605213, 1, 0, 0.9137255, 1,
1.060185, -0.6603472, 1.189928, 1, 0, 0.9058824, 1,
1.061728, 0.3385336, -0.3919161, 1, 0, 0.9019608, 1,
1.064157, -1.217528, 2.677238, 1, 0, 0.8941177, 1,
1.066346, 0.9864206, 0.5749351, 1, 0, 0.8862745, 1,
1.070034, -0.4440782, 1.261147, 1, 0, 0.8823529, 1,
1.082198, 0.7282514, -0.07175922, 1, 0, 0.8745098, 1,
1.083127, 0.06113544, 1.062866, 1, 0, 0.8705882, 1,
1.083508, -1.858378, 2.784308, 1, 0, 0.8627451, 1,
1.096008, -0.04978925, -0.2801506, 1, 0, 0.8588235, 1,
1.102856, 0.2085555, 1.775385, 1, 0, 0.8509804, 1,
1.103928, -0.2584617, 2.072715, 1, 0, 0.8470588, 1,
1.106227, -1.695758, 4.40205, 1, 0, 0.8392157, 1,
1.109026, 1.228548, -0.7249036, 1, 0, 0.8352941, 1,
1.110473, 0.1790967, 1.33406, 1, 0, 0.827451, 1,
1.113513, 1.259058, 1.521816, 1, 0, 0.8235294, 1,
1.118652, -0.3673522, 4.394858, 1, 0, 0.8156863, 1,
1.123127, 1.197965, 0.3334528, 1, 0, 0.8117647, 1,
1.125412, -0.8451902, 2.860733, 1, 0, 0.8039216, 1,
1.128803, -0.4717451, 1.916545, 1, 0, 0.7960784, 1,
1.129554, -0.6048199, 1.555657, 1, 0, 0.7921569, 1,
1.133871, -0.2309662, 2.147275, 1, 0, 0.7843137, 1,
1.140164, -0.8719906, 1.848714, 1, 0, 0.7803922, 1,
1.146659, 1.917433, -0.0002586961, 1, 0, 0.772549, 1,
1.148473, -1.01043, 1.405864, 1, 0, 0.7686275, 1,
1.164475, 1.321587, 0.05635748, 1, 0, 0.7607843, 1,
1.171013, 1.487245, -0.4276987, 1, 0, 0.7568628, 1,
1.1904, -0.4453839, 1.373269, 1, 0, 0.7490196, 1,
1.191544, -1.302622, 2.035581, 1, 0, 0.7450981, 1,
1.192761, 0.1063324, 3.218229, 1, 0, 0.7372549, 1,
1.194474, -0.3579854, 2.364831, 1, 0, 0.7333333, 1,
1.194512, 0.5083978, 1.574545, 1, 0, 0.7254902, 1,
1.199618, -0.9773959, 2.058309, 1, 0, 0.7215686, 1,
1.20185, -0.8753411, 1.272687, 1, 0, 0.7137255, 1,
1.201954, 0.02254065, 2.53154, 1, 0, 0.7098039, 1,
1.203864, 0.6519514, 0.4338678, 1, 0, 0.7019608, 1,
1.204017, -1.040238, 3.105329, 1, 0, 0.6941177, 1,
1.210297, 0.2627437, 0.2332919, 1, 0, 0.6901961, 1,
1.211781, -0.390824, 3.040749, 1, 0, 0.682353, 1,
1.219892, -0.1488249, 0.30529, 1, 0, 0.6784314, 1,
1.224556, 0.2994929, 1.489659, 1, 0, 0.6705883, 1,
1.230178, -0.1813896, 1.663384, 1, 0, 0.6666667, 1,
1.234189, 0.3518846, 1.111472, 1, 0, 0.6588235, 1,
1.236235, -0.04691243, 2.521852, 1, 0, 0.654902, 1,
1.241642, 0.9928043, -0.4055464, 1, 0, 0.6470588, 1,
1.256783, 0.9775626, 1.549759, 1, 0, 0.6431373, 1,
1.259158, 2.039414, -1.018221, 1, 0, 0.6352941, 1,
1.272637, -0.4747244, 2.026314, 1, 0, 0.6313726, 1,
1.275577, 1.062867, 2.215833, 1, 0, 0.6235294, 1,
1.292967, 0.1015974, 1.952775, 1, 0, 0.6196079, 1,
1.298899, -0.2549892, 1.84942, 1, 0, 0.6117647, 1,
1.300974, 0.3017114, 0.4520761, 1, 0, 0.6078432, 1,
1.304793, -1.509813, 1.895383, 1, 0, 0.6, 1,
1.309389, -0.6588163, 2.905073, 1, 0, 0.5921569, 1,
1.309868, 0.1667382, 0.9677994, 1, 0, 0.5882353, 1,
1.321202, 1.695198, 0.8221937, 1, 0, 0.5803922, 1,
1.327459, 0.6217254, 1.918066, 1, 0, 0.5764706, 1,
1.327569, -1.427517, 1.851292, 1, 0, 0.5686275, 1,
1.336385, -0.6320221, 0.7150885, 1, 0, 0.5647059, 1,
1.339252, 1.218703, 1.023765, 1, 0, 0.5568628, 1,
1.353315, -1.697884, 2.516525, 1, 0, 0.5529412, 1,
1.361963, 1.388893, 1.815371, 1, 0, 0.5450981, 1,
1.368216, 1.77853, -0.203802, 1, 0, 0.5411765, 1,
1.372353, -1.01537, 2.27223, 1, 0, 0.5333334, 1,
1.391698, -0.1229461, 0.1425747, 1, 0, 0.5294118, 1,
1.393304, -1.10623, 3.872513, 1, 0, 0.5215687, 1,
1.402296, -0.05077387, 1.148584, 1, 0, 0.5176471, 1,
1.407025, 0.204683, 0.8926519, 1, 0, 0.509804, 1,
1.409057, -0.1468664, 2.177378, 1, 0, 0.5058824, 1,
1.415197, 0.5909858, 1.402285, 1, 0, 0.4980392, 1,
1.415262, 1.471638, 1.762799, 1, 0, 0.4901961, 1,
1.418509, 0.6772547, 1.892136, 1, 0, 0.4862745, 1,
1.430569, -1.294924, 2.572637, 1, 0, 0.4784314, 1,
1.431786, 0.124892, 1.591373, 1, 0, 0.4745098, 1,
1.432035, -1.452288, 1.642223, 1, 0, 0.4666667, 1,
1.43572, 0.784056, 0.3376642, 1, 0, 0.4627451, 1,
1.437775, -2.112293, 0.9291177, 1, 0, 0.454902, 1,
1.439172, -0.3833756, 1.776536, 1, 0, 0.4509804, 1,
1.452687, -0.3271061, 1.721596, 1, 0, 0.4431373, 1,
1.459778, -0.8745524, 1.78624, 1, 0, 0.4392157, 1,
1.462251, -0.1163926, 1.787931, 1, 0, 0.4313726, 1,
1.470245, 0.4524821, 1.341658, 1, 0, 0.427451, 1,
1.470703, -0.7958862, 3.170805, 1, 0, 0.4196078, 1,
1.471984, 2.176486, -0.6953638, 1, 0, 0.4156863, 1,
1.485233, 0.7914844, 1.114007, 1, 0, 0.4078431, 1,
1.491936, -1.178982, 1.383625, 1, 0, 0.4039216, 1,
1.493627, -0.4322127, 3.343688, 1, 0, 0.3960784, 1,
1.499392, -0.3276051, 0.8096375, 1, 0, 0.3882353, 1,
1.526507, -2.661476, 2.234964, 1, 0, 0.3843137, 1,
1.530331, 0.4239009, 0.7591104, 1, 0, 0.3764706, 1,
1.541831, 0.2057452, 2.115929, 1, 0, 0.372549, 1,
1.549824, -0.5516387, 2.376581, 1, 0, 0.3647059, 1,
1.551357, -0.8941822, 3.770617, 1, 0, 0.3607843, 1,
1.552011, 0.3736309, 0.2430018, 1, 0, 0.3529412, 1,
1.566172, -1.170308, 3.168639, 1, 0, 0.3490196, 1,
1.579398, 0.1035212, 1.222968, 1, 0, 0.3411765, 1,
1.580105, -0.6253205, 3.190466, 1, 0, 0.3372549, 1,
1.580117, -2.037437, 2.939479, 1, 0, 0.3294118, 1,
1.587554, -0.02570314, 0.5299264, 1, 0, 0.3254902, 1,
1.595144, 0.4363382, 2.873878, 1, 0, 0.3176471, 1,
1.622414, 0.4261251, 0.4887162, 1, 0, 0.3137255, 1,
1.631649, -1.396132, 3.571168, 1, 0, 0.3058824, 1,
1.63888, -0.8363032, 3.524489, 1, 0, 0.2980392, 1,
1.639029, 1.749158, 0.1655499, 1, 0, 0.2941177, 1,
1.641636, 0.2954292, 1.09105, 1, 0, 0.2862745, 1,
1.650653, -0.5663767, 3.892505, 1, 0, 0.282353, 1,
1.65433, 2.062091, 0.3121145, 1, 0, 0.2745098, 1,
1.655631, 0.1907437, 1.89203, 1, 0, 0.2705882, 1,
1.660257, -0.899069, 3.983441, 1, 0, 0.2627451, 1,
1.66069, -0.5260469, 2.770119, 1, 0, 0.2588235, 1,
1.670352, 0.8698303, 1.298648, 1, 0, 0.2509804, 1,
1.703756, -1.086707, 2.50595, 1, 0, 0.2470588, 1,
1.705788, 0.4125463, -0.3617123, 1, 0, 0.2392157, 1,
1.70836, 1.814998, 0.8982249, 1, 0, 0.2352941, 1,
1.708376, 0.1141312, 1.948177, 1, 0, 0.227451, 1,
1.715325, -0.5384111, 0.132569, 1, 0, 0.2235294, 1,
1.752151, -0.1645702, 2.459278, 1, 0, 0.2156863, 1,
1.754447, 0.4142216, 0.2631706, 1, 0, 0.2117647, 1,
1.777329, -0.2725015, 1.38744, 1, 0, 0.2039216, 1,
1.80448, 0.355908, 1.998969, 1, 0, 0.1960784, 1,
1.805434, -1.641251, 2.386759, 1, 0, 0.1921569, 1,
1.814233, -0.4136831, -1.381483, 1, 0, 0.1843137, 1,
1.831036, 0.3099385, 0.5124494, 1, 0, 0.1803922, 1,
1.881934, -0.3511461, 2.469134, 1, 0, 0.172549, 1,
1.884639, 0.09884606, 2.039803, 1, 0, 0.1686275, 1,
1.898797, -0.7668688, 0.9713048, 1, 0, 0.1607843, 1,
1.956674, -0.3354186, 2.712946, 1, 0, 0.1568628, 1,
1.965453, 1.358356, 1.768462, 1, 0, 0.1490196, 1,
1.966891, 0.7843375, 2.842453, 1, 0, 0.145098, 1,
1.973031, -1.785938, 2.453749, 1, 0, 0.1372549, 1,
2.04674, -0.1288696, 1.873953, 1, 0, 0.1333333, 1,
2.062303, 0.5292178, 1.869462, 1, 0, 0.1254902, 1,
2.088601, -0.9782017, 1.297619, 1, 0, 0.1215686, 1,
2.09697, -0.09979331, 1.49364, 1, 0, 0.1137255, 1,
2.101581, 1.000854, 1.122582, 1, 0, 0.1098039, 1,
2.104679, 0.5992582, 2.460068, 1, 0, 0.1019608, 1,
2.114855, -0.785262, 1.460807, 1, 0, 0.09411765, 1,
2.164258, 0.392925, 2.480777, 1, 0, 0.09019608, 1,
2.20352, 0.1307776, 0.973782, 1, 0, 0.08235294, 1,
2.203878, -0.8997375, 3.967093, 1, 0, 0.07843138, 1,
2.252384, 0.2538879, 1.252532, 1, 0, 0.07058824, 1,
2.260142, 1.282079, -0.7671745, 1, 0, 0.06666667, 1,
2.269583, -0.03910866, 0.7510775, 1, 0, 0.05882353, 1,
2.271401, -0.07516549, -0.37588, 1, 0, 0.05490196, 1,
2.304389, 0.1333624, 1.465093, 1, 0, 0.04705882, 1,
2.379973, -0.2619202, 1.220002, 1, 0, 0.04313726, 1,
2.450468, 0.9743689, 1.400201, 1, 0, 0.03529412, 1,
2.530003, 0.2858869, 0.4047447, 1, 0, 0.03137255, 1,
2.600728, -0.2182587, 1.524288, 1, 0, 0.02352941, 1,
2.639404, -0.3024892, 2.01654, 1, 0, 0.01960784, 1,
2.658561, -1.602032, 2.440175, 1, 0, 0.01176471, 1,
2.928761, -0.9855745, -0.1874988, 1, 0, 0.007843138, 1
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
-0.3851823, -3.821166, -6.711761, 0, -0.5, 0.5, 0.5,
-0.3851823, -3.821166, -6.711761, 1, -0.5, 0.5, 0.5,
-0.3851823, -3.821166, -6.711761, 1, 1.5, 0.5, 0.5,
-0.3851823, -3.821166, -6.711761, 0, 1.5, 0.5, 0.5
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
-4.822553, 0.1549464, -6.711761, 0, -0.5, 0.5, 0.5,
-4.822553, 0.1549464, -6.711761, 1, -0.5, 0.5, 0.5,
-4.822553, 0.1549464, -6.711761, 1, 1.5, 0.5, 0.5,
-4.822553, 0.1549464, -6.711761, 0, 1.5, 0.5, 0.5
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
-4.822553, -3.821166, 0.08083081, 0, -0.5, 0.5, 0.5,
-4.822553, -3.821166, 0.08083081, 1, -0.5, 0.5, 0.5,
-4.822553, -3.821166, 0.08083081, 1, 1.5, 0.5, 0.5,
-4.822553, -3.821166, 0.08083081, 0, 1.5, 0.5, 0.5
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
-3, -2.903601, -5.144239,
2, -2.903601, -5.144239,
-3, -2.903601, -5.144239,
-3, -3.056529, -5.405493,
-2, -2.903601, -5.144239,
-2, -3.056529, -5.405493,
-1, -2.903601, -5.144239,
-1, -3.056529, -5.405493,
0, -2.903601, -5.144239,
0, -3.056529, -5.405493,
1, -2.903601, -5.144239,
1, -3.056529, -5.405493,
2, -2.903601, -5.144239,
2, -3.056529, -5.405493
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
-3, -3.362384, -5.928, 0, -0.5, 0.5, 0.5,
-3, -3.362384, -5.928, 1, -0.5, 0.5, 0.5,
-3, -3.362384, -5.928, 1, 1.5, 0.5, 0.5,
-3, -3.362384, -5.928, 0, 1.5, 0.5, 0.5,
-2, -3.362384, -5.928, 0, -0.5, 0.5, 0.5,
-2, -3.362384, -5.928, 1, -0.5, 0.5, 0.5,
-2, -3.362384, -5.928, 1, 1.5, 0.5, 0.5,
-2, -3.362384, -5.928, 0, 1.5, 0.5, 0.5,
-1, -3.362384, -5.928, 0, -0.5, 0.5, 0.5,
-1, -3.362384, -5.928, 1, -0.5, 0.5, 0.5,
-1, -3.362384, -5.928, 1, 1.5, 0.5, 0.5,
-1, -3.362384, -5.928, 0, 1.5, 0.5, 0.5,
0, -3.362384, -5.928, 0, -0.5, 0.5, 0.5,
0, -3.362384, -5.928, 1, -0.5, 0.5, 0.5,
0, -3.362384, -5.928, 1, 1.5, 0.5, 0.5,
0, -3.362384, -5.928, 0, 1.5, 0.5, 0.5,
1, -3.362384, -5.928, 0, -0.5, 0.5, 0.5,
1, -3.362384, -5.928, 1, -0.5, 0.5, 0.5,
1, -3.362384, -5.928, 1, 1.5, 0.5, 0.5,
1, -3.362384, -5.928, 0, 1.5, 0.5, 0.5,
2, -3.362384, -5.928, 0, -0.5, 0.5, 0.5,
2, -3.362384, -5.928, 1, -0.5, 0.5, 0.5,
2, -3.362384, -5.928, 1, 1.5, 0.5, 0.5,
2, -3.362384, -5.928, 0, 1.5, 0.5, 0.5
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
-3.798544, -2, -5.144239,
-3.798544, 3, -5.144239,
-3.798544, -2, -5.144239,
-3.969212, -2, -5.405493,
-3.798544, -1, -5.144239,
-3.969212, -1, -5.405493,
-3.798544, 0, -5.144239,
-3.969212, 0, -5.405493,
-3.798544, 1, -5.144239,
-3.969212, 1, -5.405493,
-3.798544, 2, -5.144239,
-3.969212, 2, -5.405493,
-3.798544, 3, -5.144239,
-3.969212, 3, -5.405493
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
-4.310548, -2, -5.928, 0, -0.5, 0.5, 0.5,
-4.310548, -2, -5.928, 1, -0.5, 0.5, 0.5,
-4.310548, -2, -5.928, 1, 1.5, 0.5, 0.5,
-4.310548, -2, -5.928, 0, 1.5, 0.5, 0.5,
-4.310548, -1, -5.928, 0, -0.5, 0.5, 0.5,
-4.310548, -1, -5.928, 1, -0.5, 0.5, 0.5,
-4.310548, -1, -5.928, 1, 1.5, 0.5, 0.5,
-4.310548, -1, -5.928, 0, 1.5, 0.5, 0.5,
-4.310548, 0, -5.928, 0, -0.5, 0.5, 0.5,
-4.310548, 0, -5.928, 1, -0.5, 0.5, 0.5,
-4.310548, 0, -5.928, 1, 1.5, 0.5, 0.5,
-4.310548, 0, -5.928, 0, 1.5, 0.5, 0.5,
-4.310548, 1, -5.928, 0, -0.5, 0.5, 0.5,
-4.310548, 1, -5.928, 1, -0.5, 0.5, 0.5,
-4.310548, 1, -5.928, 1, 1.5, 0.5, 0.5,
-4.310548, 1, -5.928, 0, 1.5, 0.5, 0.5,
-4.310548, 2, -5.928, 0, -0.5, 0.5, 0.5,
-4.310548, 2, -5.928, 1, -0.5, 0.5, 0.5,
-4.310548, 2, -5.928, 1, 1.5, 0.5, 0.5,
-4.310548, 2, -5.928, 0, 1.5, 0.5, 0.5,
-4.310548, 3, -5.928, 0, -0.5, 0.5, 0.5,
-4.310548, 3, -5.928, 1, -0.5, 0.5, 0.5,
-4.310548, 3, -5.928, 1, 1.5, 0.5, 0.5,
-4.310548, 3, -5.928, 0, 1.5, 0.5, 0.5
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
-3.798544, -2.903601, -4,
-3.798544, -2.903601, 4,
-3.798544, -2.903601, -4,
-3.969212, -3.056529, -4,
-3.798544, -2.903601, -2,
-3.969212, -3.056529, -2,
-3.798544, -2.903601, 0,
-3.969212, -3.056529, 0,
-3.798544, -2.903601, 2,
-3.969212, -3.056529, 2,
-3.798544, -2.903601, 4,
-3.969212, -3.056529, 4
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
-4.310548, -3.362384, -4, 0, -0.5, 0.5, 0.5,
-4.310548, -3.362384, -4, 1, -0.5, 0.5, 0.5,
-4.310548, -3.362384, -4, 1, 1.5, 0.5, 0.5,
-4.310548, -3.362384, -4, 0, 1.5, 0.5, 0.5,
-4.310548, -3.362384, -2, 0, -0.5, 0.5, 0.5,
-4.310548, -3.362384, -2, 1, -0.5, 0.5, 0.5,
-4.310548, -3.362384, -2, 1, 1.5, 0.5, 0.5,
-4.310548, -3.362384, -2, 0, 1.5, 0.5, 0.5,
-4.310548, -3.362384, 0, 0, -0.5, 0.5, 0.5,
-4.310548, -3.362384, 0, 1, -0.5, 0.5, 0.5,
-4.310548, -3.362384, 0, 1, 1.5, 0.5, 0.5,
-4.310548, -3.362384, 0, 0, 1.5, 0.5, 0.5,
-4.310548, -3.362384, 2, 0, -0.5, 0.5, 0.5,
-4.310548, -3.362384, 2, 1, -0.5, 0.5, 0.5,
-4.310548, -3.362384, 2, 1, 1.5, 0.5, 0.5,
-4.310548, -3.362384, 2, 0, 1.5, 0.5, 0.5,
-4.310548, -3.362384, 4, 0, -0.5, 0.5, 0.5,
-4.310548, -3.362384, 4, 1, -0.5, 0.5, 0.5,
-4.310548, -3.362384, 4, 1, 1.5, 0.5, 0.5,
-4.310548, -3.362384, 4, 0, 1.5, 0.5, 0.5
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
-3.798544, -2.903601, -5.144239,
-3.798544, 3.213494, -5.144239,
-3.798544, -2.903601, 5.305901,
-3.798544, 3.213494, 5.305901,
-3.798544, -2.903601, -5.144239,
-3.798544, -2.903601, 5.305901,
-3.798544, 3.213494, -5.144239,
-3.798544, 3.213494, 5.305901,
-3.798544, -2.903601, -5.144239,
3.02818, -2.903601, -5.144239,
-3.798544, -2.903601, 5.305901,
3.02818, -2.903601, 5.305901,
-3.798544, 3.213494, -5.144239,
3.02818, 3.213494, -5.144239,
-3.798544, 3.213494, 5.305901,
3.02818, 3.213494, 5.305901,
3.02818, -2.903601, -5.144239,
3.02818, 3.213494, -5.144239,
3.02818, -2.903601, 5.305901,
3.02818, 3.213494, 5.305901,
3.02818, -2.903601, -5.144239,
3.02818, -2.903601, 5.305901,
3.02818, 3.213494, -5.144239,
3.02818, 3.213494, 5.305901
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
var radius = 7.422684;
var distance = 33.02436;
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
mvMatrix.translate( 0.3851823, -0.1549464, -0.08083081 );
mvMatrix.scale( 1.175608, 1.311987, 0.767985 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.02436);
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
carbamate_5-methyl-m<-read.table("carbamate_5-methyl-m.xyz", skip=1)
```

```
## Error in read.table("carbamate_5-methyl-m.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-carbamate_5-methyl-m$V2
```

```
## Error in eval(expr, envir, enclos): object 'carbamate_5' not found
```

```r
y<-carbamate_5-methyl-m$V3
```

```
## Error in eval(expr, envir, enclos): object 'carbamate_5' not found
```

```r
z<-carbamate_5-methyl-m$V4
```

```
## Error in eval(expr, envir, enclos): object 'carbamate_5' not found
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
-3.699126, -0.227948, -2.927349, 0, 0, 1, 1, 1,
-2.795002, -0.6285686, -2.034692, 1, 0, 0, 1, 1,
-2.677566, 0.4939825, -0.007830156, 1, 0, 0, 1, 1,
-2.623139, 0.6481346, -1.197179, 1, 0, 0, 1, 1,
-2.569021, -1.360444, -2.497003, 1, 0, 0, 1, 1,
-2.474211, -0.4516928, -0.440825, 1, 0, 0, 1, 1,
-2.452421, 0.7078552, -2.164365, 0, 0, 0, 1, 1,
-2.427326, 0.6566799, -3.214685, 0, 0, 0, 1, 1,
-2.383085, -1.313094, -2.287793, 0, 0, 0, 1, 1,
-2.349022, -0.6825921, -1.394657, 0, 0, 0, 1, 1,
-2.217308, -1.126009, -2.904377, 0, 0, 0, 1, 1,
-2.216139, 1.319549, -1.903747, 0, 0, 0, 1, 1,
-2.173307, 0.105507, -1.929981, 0, 0, 0, 1, 1,
-2.170843, -0.0833823, -2.893464, 1, 1, 1, 1, 1,
-2.167054, -0.002130014, -2.816885, 1, 1, 1, 1, 1,
-2.144054, 1.709106, -1.142405, 1, 1, 1, 1, 1,
-2.115333, 2.345347, 0.2113365, 1, 1, 1, 1, 1,
-2.115203, 0.2022007, -2.25323, 1, 1, 1, 1, 1,
-2.103067, -1.922061, -1.653647, 1, 1, 1, 1, 1,
-2.088206, -0.1306666, -2.224454, 1, 1, 1, 1, 1,
-2.087664, 0.341888, -2.530157, 1, 1, 1, 1, 1,
-2.077186, 0.1966407, -1.001905, 1, 1, 1, 1, 1,
-2.06698, -0.04905508, -1.070124, 1, 1, 1, 1, 1,
-2.049873, -0.01310202, -2.784101, 1, 1, 1, 1, 1,
-2.042808, -1.118724, -1.296015, 1, 1, 1, 1, 1,
-2.010412, 0.6932803, -2.527953, 1, 1, 1, 1, 1,
-2.006221, 0.6982486, -0.4462545, 1, 1, 1, 1, 1,
-1.9858, 0.2925088, -1.188169, 1, 1, 1, 1, 1,
-1.984261, 0.09609642, -0.6246224, 0, 0, 1, 1, 1,
-1.970814, -0.6651077, -1.542309, 1, 0, 0, 1, 1,
-1.966894, -0.2401845, -2.123076, 1, 0, 0, 1, 1,
-1.950766, 1.48949, -0.6766921, 1, 0, 0, 1, 1,
-1.935562, 0.9525899, -1.041481, 1, 0, 0, 1, 1,
-1.930297, -0.4737524, -1.634263, 1, 0, 0, 1, 1,
-1.917579, 0.4251023, -2.150054, 0, 0, 0, 1, 1,
-1.901854, -0.6475423, -1.544764, 0, 0, 0, 1, 1,
-1.888085, 0.0515543, -0.09686596, 0, 0, 0, 1, 1,
-1.855922, -1.495029, -2.37646, 0, 0, 0, 1, 1,
-1.841608, -0.1681118, -1.091499, 0, 0, 0, 1, 1,
-1.835017, -0.3128184, -2.507546, 0, 0, 0, 1, 1,
-1.828369, -0.531454, -1.037212, 0, 0, 0, 1, 1,
-1.814489, 0.8293252, 0.6272615, 1, 1, 1, 1, 1,
-1.784732, -1.253986, -3.040182, 1, 1, 1, 1, 1,
-1.776881, -1.813228, -2.929071, 1, 1, 1, 1, 1,
-1.773097, 0.6179765, -0.7297232, 1, 1, 1, 1, 1,
-1.76761, 0.4238639, -1.043134, 1, 1, 1, 1, 1,
-1.73581, -0.2800778, -1.883851, 1, 1, 1, 1, 1,
-1.71726, -0.2251949, -1.860047, 1, 1, 1, 1, 1,
-1.714325, 0.518756, 0.263444, 1, 1, 1, 1, 1,
-1.706455, 0.1778961, -2.104669, 1, 1, 1, 1, 1,
-1.701097, 0.4264506, -2.347606, 1, 1, 1, 1, 1,
-1.692958, 0.7682331, 0.4430459, 1, 1, 1, 1, 1,
-1.686619, -0.292893, -0.7775102, 1, 1, 1, 1, 1,
-1.681895, -0.4325165, -1.754467, 1, 1, 1, 1, 1,
-1.66929, -0.2772967, -1.552493, 1, 1, 1, 1, 1,
-1.652332, -1.294342, -2.810526, 1, 1, 1, 1, 1,
-1.637563, -0.3921323, 0.04136711, 0, 0, 1, 1, 1,
-1.633604, 0.2172422, -2.90895, 1, 0, 0, 1, 1,
-1.629788, -0.9264825, -2.845091, 1, 0, 0, 1, 1,
-1.62675, -0.1295882, -1.301956, 1, 0, 0, 1, 1,
-1.620742, -0.03265833, -1.753595, 1, 0, 0, 1, 1,
-1.591539, -0.9794424, -0.5096599, 1, 0, 0, 1, 1,
-1.567357, -1.47751, -2.117215, 0, 0, 0, 1, 1,
-1.55919, -1.422463, -4.349744, 0, 0, 0, 1, 1,
-1.557233, 0.8853942, -0.448227, 0, 0, 0, 1, 1,
-1.555506, 0.09282571, -0.9206107, 0, 0, 0, 1, 1,
-1.540205, 0.2655734, -0.5096537, 0, 0, 0, 1, 1,
-1.534286, -0.6093074, -0.7711037, 0, 0, 0, 1, 1,
-1.526316, -0.9335609, -1.41907, 0, 0, 0, 1, 1,
-1.519237, 1.09041, -0.3981089, 1, 1, 1, 1, 1,
-1.519115, -0.3904174, -0.1234392, 1, 1, 1, 1, 1,
-1.518947, -0.5421155, -1.778659, 1, 1, 1, 1, 1,
-1.496186, 1.552577, -0.2464084, 1, 1, 1, 1, 1,
-1.493445, -0.3578263, -0.5832529, 1, 1, 1, 1, 1,
-1.491276, -0.4571138, -3.329154, 1, 1, 1, 1, 1,
-1.490918, -0.04596146, -2.065747, 1, 1, 1, 1, 1,
-1.485732, 0.6567196, -1.213019, 1, 1, 1, 1, 1,
-1.479612, -0.781598, -1.434125, 1, 1, 1, 1, 1,
-1.460178, -0.3007533, -0.5774654, 1, 1, 1, 1, 1,
-1.458437, -2.357483, -1.181908, 1, 1, 1, 1, 1,
-1.457754, 0.1265485, -1.65601, 1, 1, 1, 1, 1,
-1.454891, 1.74262, 0.8094831, 1, 1, 1, 1, 1,
-1.452642, 0.06960726, -2.94635, 1, 1, 1, 1, 1,
-1.444721, -1.209522, -3.882852, 1, 1, 1, 1, 1,
-1.433275, -1.162328, -0.9315529, 0, 0, 1, 1, 1,
-1.430663, 0.2026691, -2.002042, 1, 0, 0, 1, 1,
-1.425536, 0.7385556, -1.448033, 1, 0, 0, 1, 1,
-1.425327, -0.5256987, -2.134085, 1, 0, 0, 1, 1,
-1.423224, 0.8163182, -0.5269848, 1, 0, 0, 1, 1,
-1.421844, 0.149562, -1.113512, 1, 0, 0, 1, 1,
-1.414441, -0.5011589, -2.135077, 0, 0, 0, 1, 1,
-1.411339, 0.6749526, -2.458459, 0, 0, 0, 1, 1,
-1.410429, -0.07827162, -1.224295, 0, 0, 0, 1, 1,
-1.383538, 0.1170375, -1.91775, 0, 0, 0, 1, 1,
-1.382197, 1.456958, 0.8144405, 0, 0, 0, 1, 1,
-1.375913, -1.292925, -1.323927, 0, 0, 0, 1, 1,
-1.37348, -1.160647, -3.094847, 0, 0, 0, 1, 1,
-1.36379, 1.062528, -2.456514, 1, 1, 1, 1, 1,
-1.363479, 0.5437047, -1.610314, 1, 1, 1, 1, 1,
-1.349389, 0.5188873, -1.40256, 1, 1, 1, 1, 1,
-1.343092, -1.22754, -2.678481, 1, 1, 1, 1, 1,
-1.336412, 0.4189492, -1.516791, 1, 1, 1, 1, 1,
-1.332004, 1.165908, 0.6626252, 1, 1, 1, 1, 1,
-1.326184, -0.6095682, -2.691714, 1, 1, 1, 1, 1,
-1.324807, 0.4590873, -2.317881, 1, 1, 1, 1, 1,
-1.323173, -2.033208, -3.589907, 1, 1, 1, 1, 1,
-1.319322, -0.9506695, -1.94899, 1, 1, 1, 1, 1,
-1.317491, 0.5942445, -1.086836, 1, 1, 1, 1, 1,
-1.314508, -0.8937094, -1.656723, 1, 1, 1, 1, 1,
-1.312086, -1.291685, -2.280881, 1, 1, 1, 1, 1,
-1.304488, 0.08784185, -2.365979, 1, 1, 1, 1, 1,
-1.304005, 0.04557328, 0.0009575895, 1, 1, 1, 1, 1,
-1.303305, -1.806447, -4.117481, 0, 0, 1, 1, 1,
-1.30102, 0.6480929, -0.3060072, 1, 0, 0, 1, 1,
-1.293933, 0.1156567, -3.345229, 1, 0, 0, 1, 1,
-1.281948, 1.171092, -0.5869077, 1, 0, 0, 1, 1,
-1.276967, -0.3805393, -1.277919, 1, 0, 0, 1, 1,
-1.273454, -1.940204, -2.596864, 1, 0, 0, 1, 1,
-1.27092, -1.439082, -4.370979, 0, 0, 0, 1, 1,
-1.270281, -1.639549, -2.529841, 0, 0, 0, 1, 1,
-1.257039, -0.448063, -2.855607, 0, 0, 0, 1, 1,
-1.256591, -2.402217, -3.395934, 0, 0, 0, 1, 1,
-1.255844, -0.82816, -3.250191, 0, 0, 0, 1, 1,
-1.25215, -1.392274, -1.873594, 0, 0, 0, 1, 1,
-1.251796, -0.2442814, -2.107726, 0, 0, 0, 1, 1,
-1.245285, 1.965908, 0.8375226, 1, 1, 1, 1, 1,
-1.244157, 0.5027762, -2.431026, 1, 1, 1, 1, 1,
-1.234025, 0.8600395, -1.186644, 1, 1, 1, 1, 1,
-1.227923, 1.297362, 1.020216, 1, 1, 1, 1, 1,
-1.226745, 0.5479125, -1.838502, 1, 1, 1, 1, 1,
-1.224133, -1.323264, -2.400735, 1, 1, 1, 1, 1,
-1.222542, -0.6848491, -1.162045, 1, 1, 1, 1, 1,
-1.220855, -1.160737, -1.702238, 1, 1, 1, 1, 1,
-1.218847, 1.16362, 2.114514, 1, 1, 1, 1, 1,
-1.218581, 0.951829, -1.86309, 1, 1, 1, 1, 1,
-1.204511, 0.8603688, -0.4344986, 1, 1, 1, 1, 1,
-1.200782, 0.7217285, -0.6423873, 1, 1, 1, 1, 1,
-1.200326, -1.131893, -2.003325, 1, 1, 1, 1, 1,
-1.199661, 1.385564, 1.75485, 1, 1, 1, 1, 1,
-1.186547, 0.07408415, 1.157881, 1, 1, 1, 1, 1,
-1.185647, -0.7225357, -3.121039, 0, 0, 1, 1, 1,
-1.182873, -0.8268083, -1.082415, 1, 0, 0, 1, 1,
-1.177176, -0.01203755, -1.776593, 1, 0, 0, 1, 1,
-1.16422, 1.694716, -1.031397, 1, 0, 0, 1, 1,
-1.161234, -1.236591, -2.337729, 1, 0, 0, 1, 1,
-1.147099, 1.628221, -0.5806483, 1, 0, 0, 1, 1,
-1.137703, -0.9093274, -1.660675, 0, 0, 0, 1, 1,
-1.133575, -0.4867538, -1.205831, 0, 0, 0, 1, 1,
-1.125058, -1.917681, -2.768237, 0, 0, 0, 1, 1,
-1.11521, 1.312189, -1.994545, 0, 0, 0, 1, 1,
-1.103433, 0.1662017, -0.3122392, 0, 0, 0, 1, 1,
-1.092419, 0.6562303, -1.073967, 0, 0, 0, 1, 1,
-1.090891, 2.046962, -1.62152, 0, 0, 0, 1, 1,
-1.085839, -0.2623551, -1.505812, 1, 1, 1, 1, 1,
-1.084448, -1.047431, -2.411836, 1, 1, 1, 1, 1,
-1.077466, 1.589007, -0.7456737, 1, 1, 1, 1, 1,
-1.076873, -1.170573, -1.870499, 1, 1, 1, 1, 1,
-1.073475, -0.5388427, -3.459556, 1, 1, 1, 1, 1,
-1.068173, 0.2829661, -1.017037, 1, 1, 1, 1, 1,
-1.059959, -0.3340697, 0.03311452, 1, 1, 1, 1, 1,
-1.043751, 0.05737879, -1.599415, 1, 1, 1, 1, 1,
-1.042894, 0.009196362, -1.520859, 1, 1, 1, 1, 1,
-1.036807, -1.845584, -1.895222, 1, 1, 1, 1, 1,
-1.035995, -1.339303, -4.299969, 1, 1, 1, 1, 1,
-1.033834, 0.1133274, -1.439143, 1, 1, 1, 1, 1,
-1.030921, -0.8607649, -1.819956, 1, 1, 1, 1, 1,
-1.029882, -0.7223397, 0.07136997, 1, 1, 1, 1, 1,
-1.027372, -0.5478371, -2.284764, 1, 1, 1, 1, 1,
-1.022457, 0.4245832, 0.1622248, 0, 0, 1, 1, 1,
-1.018312, 0.3278799, -1.096371, 1, 0, 0, 1, 1,
-1.009525, -1.63287, -2.006705, 1, 0, 0, 1, 1,
-1.006704, -0.1616063, -2.620403, 1, 0, 0, 1, 1,
-0.999907, -1.220881, 0.03341204, 1, 0, 0, 1, 1,
-0.9997694, 0.8846471, -0.9934273, 1, 0, 0, 1, 1,
-0.9985071, 1.059745, -0.5540661, 0, 0, 0, 1, 1,
-0.9968426, -1.211825, -2.163009, 0, 0, 0, 1, 1,
-0.9952881, -1.083982, -4.992053, 0, 0, 0, 1, 1,
-0.9938618, -0.3698117, -1.6002, 0, 0, 0, 1, 1,
-0.9931008, 0.5485128, -1.631065, 0, 0, 0, 1, 1,
-0.9913219, 0.7020559, -1.737754, 0, 0, 0, 1, 1,
-0.990468, -0.0486045, -2.711837, 0, 0, 0, 1, 1,
-0.9827753, 1.51205, -1.210168, 1, 1, 1, 1, 1,
-0.9741647, 0.2141525, -2.104814, 1, 1, 1, 1, 1,
-0.9697772, 1.320033, -0.1179572, 1, 1, 1, 1, 1,
-0.9644796, -0.09599133, -2.172181, 1, 1, 1, 1, 1,
-0.9575471, 1.57473, -1.144588, 1, 1, 1, 1, 1,
-0.9541526, 3.12441, -0.9496813, 1, 1, 1, 1, 1,
-0.9531474, -0.4516641, -2.117409, 1, 1, 1, 1, 1,
-0.9529455, 0.7178125, -1.615139, 1, 1, 1, 1, 1,
-0.9507954, 0.08234915, -1.098877, 1, 1, 1, 1, 1,
-0.9361574, -0.2808062, -2.944922, 1, 1, 1, 1, 1,
-0.9332085, 1.134483, -1.19552, 1, 1, 1, 1, 1,
-0.932887, -0.3879406, -2.651115, 1, 1, 1, 1, 1,
-0.9320211, 0.1750844, -2.230234, 1, 1, 1, 1, 1,
-0.928856, -0.3053293, -1.556732, 1, 1, 1, 1, 1,
-0.9242282, 1.859832, -0.1269545, 1, 1, 1, 1, 1,
-0.9225774, -0.1869558, 0.1389948, 0, 0, 1, 1, 1,
-0.9188056, -0.2781661, -1.326157, 1, 0, 0, 1, 1,
-0.9187511, 0.1024197, -1.662827, 1, 0, 0, 1, 1,
-0.9162782, 2.193747, -0.1290754, 1, 0, 0, 1, 1,
-0.9146173, -1.314862, -2.707109, 1, 0, 0, 1, 1,
-0.9087626, -0.7332913, -1.327498, 1, 0, 0, 1, 1,
-0.9043932, 0.4442311, -3.100518, 0, 0, 0, 1, 1,
-0.901408, 0.7091214, -1.375511, 0, 0, 0, 1, 1,
-0.9006656, -0.7491599, -2.099017, 0, 0, 0, 1, 1,
-0.898902, 0.7323979, 0.009844605, 0, 0, 0, 1, 1,
-0.8975964, -0.7064373, -3.503897, 0, 0, 0, 1, 1,
-0.8966744, 1.561195, 0.4077362, 0, 0, 0, 1, 1,
-0.8956051, 0.2677621, -0.6777132, 0, 0, 0, 1, 1,
-0.8926314, 1.634645, -0.5757588, 1, 1, 1, 1, 1,
-0.8844955, -1.0952, -4.022368, 1, 1, 1, 1, 1,
-0.8766144, -0.9558178, -1.457497, 1, 1, 1, 1, 1,
-0.8724732, 0.6170354, -0.813, 1, 1, 1, 1, 1,
-0.869742, 0.9078567, -1.173478, 1, 1, 1, 1, 1,
-0.8610331, -2.479409, -2.182723, 1, 1, 1, 1, 1,
-0.8510184, -0.3800949, -1.598446, 1, 1, 1, 1, 1,
-0.8501205, 0.1148497, -0.6403872, 1, 1, 1, 1, 1,
-0.8458437, -0.7492254, -1.055952, 1, 1, 1, 1, 1,
-0.8453512, -0.715491, -2.204431, 1, 1, 1, 1, 1,
-0.8440042, -1.489849, -3.250413, 1, 1, 1, 1, 1,
-0.8428798, 0.4520695, -2.47194, 1, 1, 1, 1, 1,
-0.8408465, 0.6495199, -1.719414, 1, 1, 1, 1, 1,
-0.8407683, -0.6809673, -2.148359, 1, 1, 1, 1, 1,
-0.8367239, 0.348363, -0.1664795, 1, 1, 1, 1, 1,
-0.8316069, -0.4845749, -2.08666, 0, 0, 1, 1, 1,
-0.8315853, 0.1751448, -1.77395, 1, 0, 0, 1, 1,
-0.828468, -0.7518475, -1.90221, 1, 0, 0, 1, 1,
-0.8267515, -0.7521791, -1.834558, 1, 0, 0, 1, 1,
-0.8262156, 1.105553, -1.404855, 1, 0, 0, 1, 1,
-0.8133355, -1.192189, -2.36622, 1, 0, 0, 1, 1,
-0.8017476, 1.25306, -1.494988, 0, 0, 0, 1, 1,
-0.7994164, -2.268975, -2.069521, 0, 0, 0, 1, 1,
-0.7980806, -0.8491009, -4.789197, 0, 0, 0, 1, 1,
-0.794484, 0.7501811, -4.039094, 0, 0, 0, 1, 1,
-0.7887708, 1.355738, -0.9455889, 0, 0, 0, 1, 1,
-0.7851329, -0.7688012, -0.8707646, 0, 0, 0, 1, 1,
-0.7835444, 1.431579, -0.3850754, 0, 0, 0, 1, 1,
-0.7709912, -0.6344377, -2.713266, 1, 1, 1, 1, 1,
-0.7689602, 1.18745, 1.011281, 1, 1, 1, 1, 1,
-0.763501, 0.2811087, -1.82305, 1, 1, 1, 1, 1,
-0.7612414, 0.3785553, -1.475653, 1, 1, 1, 1, 1,
-0.7574268, -0.4143799, -2.228341, 1, 1, 1, 1, 1,
-0.7561426, -0.8140893, -3.881077, 1, 1, 1, 1, 1,
-0.7555419, 2.283353, -0.130488, 1, 1, 1, 1, 1,
-0.7549617, -0.03984229, -1.743547, 1, 1, 1, 1, 1,
-0.7541839, 0.7738418, -0.4939291, 1, 1, 1, 1, 1,
-0.7468542, -0.9046876, -3.445948, 1, 1, 1, 1, 1,
-0.7344005, -0.9024132, -2.50872, 1, 1, 1, 1, 1,
-0.7312673, 0.9295205, -0.7899445, 1, 1, 1, 1, 1,
-0.7291521, 1.145174, -0.1675597, 1, 1, 1, 1, 1,
-0.727228, -0.2716922, -3.17429, 1, 1, 1, 1, 1,
-0.7259448, 0.9541362, 1.088461, 1, 1, 1, 1, 1,
-0.7173429, -0.236704, -4.574225, 0, 0, 1, 1, 1,
-0.7134838, -2.547014, -3.278329, 1, 0, 0, 1, 1,
-0.7125694, -0.04010681, -2.821936, 1, 0, 0, 1, 1,
-0.7077873, 1.402247, 2.431179, 1, 0, 0, 1, 1,
-0.6921175, 0.4004369, -1.448107, 1, 0, 0, 1, 1,
-0.6905492, 0.1343142, -1.376872, 1, 0, 0, 1, 1,
-0.6895303, -0.6387356, -1.891016, 0, 0, 0, 1, 1,
-0.6879385, -0.789257, -1.892163, 0, 0, 0, 1, 1,
-0.678512, -0.3998359, -1.495806, 0, 0, 0, 1, 1,
-0.6768126, 0.3128857, -0.4016871, 0, 0, 0, 1, 1,
-0.6757756, -1.075796, -1.553335, 0, 0, 0, 1, 1,
-0.6745122, -0.5880793, -2.030494, 0, 0, 0, 1, 1,
-0.6702826, 0.1190586, -1.069068, 0, 0, 0, 1, 1,
-0.6655202, -0.4484839, -1.138991, 1, 1, 1, 1, 1,
-0.6643288, 0.1836592, -1.264813, 1, 1, 1, 1, 1,
-0.6593186, 0.0654439, -1.214433, 1, 1, 1, 1, 1,
-0.6591936, -0.4772704, -0.7999154, 1, 1, 1, 1, 1,
-0.650898, -0.3547073, -2.284882, 1, 1, 1, 1, 1,
-0.6493327, 0.1174209, -0.06757829, 1, 1, 1, 1, 1,
-0.648093, 0.5646998, -2.483955, 1, 1, 1, 1, 1,
-0.6474733, 0.7055109, -0.1652738, 1, 1, 1, 1, 1,
-0.6454959, 0.8589876, -1.695729, 1, 1, 1, 1, 1,
-0.6412011, 0.7313031, 0.709173, 1, 1, 1, 1, 1,
-0.6400441, 1.012701, -1.556478, 1, 1, 1, 1, 1,
-0.6372217, 0.2021958, -1.501391, 1, 1, 1, 1, 1,
-0.6251311, -0.5042143, -2.047673, 1, 1, 1, 1, 1,
-0.6240149, -0.9920121, -2.565595, 1, 1, 1, 1, 1,
-0.6199495, 1.216765, -0.275833, 1, 1, 1, 1, 1,
-0.6181327, 0.8790725, -0.2600338, 0, 0, 1, 1, 1,
-0.6138157, -0.06733304, -2.136775, 1, 0, 0, 1, 1,
-0.6122697, 0.7318861, -0.3835484, 1, 0, 0, 1, 1,
-0.6104507, 0.7984188, -0.2100682, 1, 0, 0, 1, 1,
-0.6089237, 0.03949556, -1.027684, 1, 0, 0, 1, 1,
-0.6088715, 1.174146, -2.117688, 1, 0, 0, 1, 1,
-0.6088401, 0.5721403, -1.423392, 0, 0, 0, 1, 1,
-0.6068406, 0.04304846, -1.186688, 0, 0, 0, 1, 1,
-0.606425, -0.8170563, -1.324128, 0, 0, 0, 1, 1,
-0.6020777, 1.080153, -1.221386, 0, 0, 0, 1, 1,
-0.600216, -1.287796, -2.230571, 0, 0, 0, 1, 1,
-0.5963126, -0.2464822, -1.496395, 0, 0, 0, 1, 1,
-0.5962865, -0.5511122, -3.214256, 0, 0, 0, 1, 1,
-0.5947866, -0.8319746, -1.146383, 1, 1, 1, 1, 1,
-0.5839708, 0.2499889, -0.4917538, 1, 1, 1, 1, 1,
-0.5822502, 0.2198734, -0.6836901, 1, 1, 1, 1, 1,
-0.579375, -1.132807, -3.529647, 1, 1, 1, 1, 1,
-0.5701063, -0.4333764, -2.468347, 1, 1, 1, 1, 1,
-0.5647025, 0.3971531, -2.02861, 1, 1, 1, 1, 1,
-0.5631203, -1.001563, -3.629648, 1, 1, 1, 1, 1,
-0.5630193, 1.250319, -1.522174, 1, 1, 1, 1, 1,
-0.5611696, 0.005157439, -2.177746, 1, 1, 1, 1, 1,
-0.5571258, -0.1016095, -1.76035, 1, 1, 1, 1, 1,
-0.5566837, -0.1495278, -0.987985, 1, 1, 1, 1, 1,
-0.5539846, 0.6564768, -2.009273, 1, 1, 1, 1, 1,
-0.5519869, 0.9313397, 0.3442575, 1, 1, 1, 1, 1,
-0.5484657, -0.7685248, -3.056869, 1, 1, 1, 1, 1,
-0.5464254, 0.07136163, -0.6281898, 1, 1, 1, 1, 1,
-0.5434864, -0.09825464, -1.369784, 0, 0, 1, 1, 1,
-0.5416428, -0.1432917, -2.173028, 1, 0, 0, 1, 1,
-0.5406373, 0.5292944, -0.748195, 1, 0, 0, 1, 1,
-0.5403728, 0.6109455, 0.3127339, 1, 0, 0, 1, 1,
-0.5394427, -1.375469, -2.502104, 1, 0, 0, 1, 1,
-0.5359517, 1.862853, -0.3940942, 1, 0, 0, 1, 1,
-0.5349635, 0.1963592, -1.923097, 0, 0, 0, 1, 1,
-0.527296, -0.618549, -4.248624, 0, 0, 0, 1, 1,
-0.5257295, 0.7301089, -0.6623495, 0, 0, 0, 1, 1,
-0.5208179, -0.4472899, -2.058936, 0, 0, 0, 1, 1,
-0.5177802, 0.8987371, -0.8817265, 0, 0, 0, 1, 1,
-0.5157845, 0.1614044, 0.1391148, 0, 0, 0, 1, 1,
-0.5154283, 2.021465, -1.559459, 0, 0, 0, 1, 1,
-0.5136695, -0.9646798, -3.27475, 1, 1, 1, 1, 1,
-0.5103356, 0.9755929, -0.9817973, 1, 1, 1, 1, 1,
-0.5098261, 0.3165886, -1.199153, 1, 1, 1, 1, 1,
-0.509468, 0.5626045, 0.4784782, 1, 1, 1, 1, 1,
-0.5090082, -2.814517, -2.661677, 1, 1, 1, 1, 1,
-0.503179, -0.3687753, -1.931127, 1, 1, 1, 1, 1,
-0.4978887, -0.46881, -1.198304, 1, 1, 1, 1, 1,
-0.497413, -0.3378501, -3.261529, 1, 1, 1, 1, 1,
-0.4934641, -1.197161, -3.520347, 1, 1, 1, 1, 1,
-0.4925353, 0.7551885, -0.7254688, 1, 1, 1, 1, 1,
-0.4924933, 1.066772, -1.774252, 1, 1, 1, 1, 1,
-0.4899, 0.2345967, -2.21118, 1, 1, 1, 1, 1,
-0.4866732, 0.2987577, -0.4523075, 1, 1, 1, 1, 1,
-0.4849202, 0.4011951, -1.279386, 1, 1, 1, 1, 1,
-0.4848164, -0.7697602, -3.116778, 1, 1, 1, 1, 1,
-0.4832789, -0.1363284, -3.064888, 0, 0, 1, 1, 1,
-0.4828903, -0.3263294, -1.440488, 1, 0, 0, 1, 1,
-0.4812223, -0.8406885, -3.121112, 1, 0, 0, 1, 1,
-0.4788936, 1.342621, -0.5059416, 1, 0, 0, 1, 1,
-0.4756557, -1.58408, -3.143247, 1, 0, 0, 1, 1,
-0.4748697, -1.592573, -3.031581, 1, 0, 0, 1, 1,
-0.474385, 0.04127832, -1.271953, 0, 0, 0, 1, 1,
-0.4729569, -0.1696109, -2.526754, 0, 0, 0, 1, 1,
-0.4728421, -0.1507183, -2.010815, 0, 0, 0, 1, 1,
-0.4720749, -0.4776493, -1.468064, 0, 0, 0, 1, 1,
-0.4700199, 0.4506942, -0.9555001, 0, 0, 0, 1, 1,
-0.4619574, -1.513592, -2.351182, 0, 0, 0, 1, 1,
-0.4618402, 1.004715, -0.8164171, 0, 0, 0, 1, 1,
-0.4584981, -1.028053, -2.974943, 1, 1, 1, 1, 1,
-0.4576662, -0.2686297, -2.138386, 1, 1, 1, 1, 1,
-0.4559605, -2.339616, -2.064718, 1, 1, 1, 1, 1,
-0.4518445, -0.9415539, -4.447459, 1, 1, 1, 1, 1,
-0.4504956, 0.3020608, -0.06021856, 1, 1, 1, 1, 1,
-0.4470751, -1.765042, -2.815904, 1, 1, 1, 1, 1,
-0.4464655, 1.226097, 0.1452329, 1, 1, 1, 1, 1,
-0.4453836, -0.6534542, -3.902662, 1, 1, 1, 1, 1,
-0.4403274, -0.06991558, -0.2135224, 1, 1, 1, 1, 1,
-0.4343082, 0.7049586, -1.357318, 1, 1, 1, 1, 1,
-0.4321893, -1.148946, -2.006305, 1, 1, 1, 1, 1,
-0.4305981, 0.3309764, -2.173585, 1, 1, 1, 1, 1,
-0.4239043, 0.2160919, -1.736345, 1, 1, 1, 1, 1,
-0.4235133, -1.086235, -1.506486, 1, 1, 1, 1, 1,
-0.4227076, -2.021424, -3.441026, 1, 1, 1, 1, 1,
-0.4213102, -0.6099542, -2.738361, 0, 0, 1, 1, 1,
-0.4200219, 0.5593126, 0.06933547, 1, 0, 0, 1, 1,
-0.4183306, -0.4670519, -2.41279, 1, 0, 0, 1, 1,
-0.4172117, 0.2804738, -0.8188596, 1, 0, 0, 1, 1,
-0.4164705, -0.1576332, -2.555638, 1, 0, 0, 1, 1,
-0.4153214, 0.1982539, -2.746025, 1, 0, 0, 1, 1,
-0.4119755, 1.232703, 0.8146363, 0, 0, 0, 1, 1,
-0.4117007, 0.6450105, -0.4178339, 0, 0, 0, 1, 1,
-0.4078746, -0.9071311, -0.917333, 0, 0, 0, 1, 1,
-0.407372, -0.274549, -1.985297, 0, 0, 0, 1, 1,
-0.405947, -0.005633917, -1.355047, 0, 0, 0, 1, 1,
-0.403154, 1.978882, -0.583813, 0, 0, 0, 1, 1,
-0.4012831, -0.122497, -1.828128, 0, 0, 0, 1, 1,
-0.4008918, 1.35917, -0.5411521, 1, 1, 1, 1, 1,
-0.3995683, 1.329822, 0.761066, 1, 1, 1, 1, 1,
-0.3976628, 0.4784406, 0.5331694, 1, 1, 1, 1, 1,
-0.39032, 0.5324617, -0.5486924, 1, 1, 1, 1, 1,
-0.370917, -0.3949493, -2.004727, 1, 1, 1, 1, 1,
-0.3679515, -0.8607462, -2.009653, 1, 1, 1, 1, 1,
-0.3671003, 1.190128, 0.6505678, 1, 1, 1, 1, 1,
-0.3662966, 0.4492959, 0.09837009, 1, 1, 1, 1, 1,
-0.3617253, 0.8496232, -1.18283, 1, 1, 1, 1, 1,
-0.3599232, -0.2048953, -3.232863, 1, 1, 1, 1, 1,
-0.349805, 0.04709899, -1.627875, 1, 1, 1, 1, 1,
-0.3477993, -1.603867, -4.212524, 1, 1, 1, 1, 1,
-0.3458743, 0.2004176, -0.6634235, 1, 1, 1, 1, 1,
-0.3401773, -0.7874136, -1.09913, 1, 1, 1, 1, 1,
-0.3378478, -0.9526598, -3.198117, 1, 1, 1, 1, 1,
-0.3353583, -1.093928, -2.913852, 0, 0, 1, 1, 1,
-0.3336899, 0.9240991, -0.6279008, 1, 0, 0, 1, 1,
-0.3322661, 0.7358435, -1.21772, 1, 0, 0, 1, 1,
-0.3304541, 0.165041, -2.800542, 1, 0, 0, 1, 1,
-0.3292136, 0.1100251, -1.813245, 1, 0, 0, 1, 1,
-0.3283024, 0.9204886, -1.806927, 1, 0, 0, 1, 1,
-0.3244908, 0.6248071, -0.5105225, 0, 0, 0, 1, 1,
-0.3232371, -1.193736, -2.234035, 0, 0, 0, 1, 1,
-0.3216442, 2.116657, 0.9404308, 0, 0, 0, 1, 1,
-0.3044208, -0.9449648, -2.922409, 0, 0, 0, 1, 1,
-0.2908999, 1.698348, 0.4949345, 0, 0, 0, 1, 1,
-0.2897281, -0.04746993, -3.173415, 0, 0, 0, 1, 1,
-0.2821462, 0.6445063, -0.7452022, 0, 0, 0, 1, 1,
-0.2807259, -1.401226, -3.612057, 1, 1, 1, 1, 1,
-0.2788433, 0.9901401, -0.9877496, 1, 1, 1, 1, 1,
-0.2779205, 0.4113793, -1.905099, 1, 1, 1, 1, 1,
-0.2758111, 0.835985, 1.070708, 1, 1, 1, 1, 1,
-0.2736598, 1.302737, 0.1097107, 1, 1, 1, 1, 1,
-0.2717705, 1.273508, 0.3371406, 1, 1, 1, 1, 1,
-0.2707259, -0.543258, -2.000082, 1, 1, 1, 1, 1,
-0.2676455, 0.6864225, 2.216635, 1, 1, 1, 1, 1,
-0.2657949, -1.255451, -2.054366, 1, 1, 1, 1, 1,
-0.2640723, -1.375227, -1.532146, 1, 1, 1, 1, 1,
-0.2624272, 0.2061315, -2.754574, 1, 1, 1, 1, 1,
-0.258333, -0.9077329, -2.001159, 1, 1, 1, 1, 1,
-0.2579701, -0.3046469, -2.413062, 1, 1, 1, 1, 1,
-0.2543595, 1.328885, 1.443628, 1, 1, 1, 1, 1,
-0.2542047, 0.322332, -1.556626, 1, 1, 1, 1, 1,
-0.2527372, 0.9365306, -0.7994868, 0, 0, 1, 1, 1,
-0.2520021, -0.1407122, -1.883328, 1, 0, 0, 1, 1,
-0.249492, 1.316788, -0.09131125, 1, 0, 0, 1, 1,
-0.2492894, -0.6178734, -2.408765, 1, 0, 0, 1, 1,
-0.2491314, -1.452797, -3.617795, 1, 0, 0, 1, 1,
-0.2482011, -0.402844, -3.423923, 1, 0, 0, 1, 1,
-0.2460337, -0.4812056, -2.217122, 0, 0, 0, 1, 1,
-0.2421561, 0.7542633, -1.139234, 0, 0, 0, 1, 1,
-0.2418434, -1.351712, -2.520951, 0, 0, 0, 1, 1,
-0.2398439, 1.865533, -3.032414, 0, 0, 0, 1, 1,
-0.2371778, -0.1580269, -1.616407, 0, 0, 0, 1, 1,
-0.2364504, 0.2670423, 0.3048111, 0, 0, 0, 1, 1,
-0.2363973, -0.7231801, -2.896636, 0, 0, 0, 1, 1,
-0.2338402, -0.8312159, -2.0439, 1, 1, 1, 1, 1,
-0.2283654, -0.3999573, -3.796544, 1, 1, 1, 1, 1,
-0.222322, 1.623212, -0.09436604, 1, 1, 1, 1, 1,
-0.2222427, -0.4131102, -3.681173, 1, 1, 1, 1, 1,
-0.2218576, -0.3043832, -2.381838, 1, 1, 1, 1, 1,
-0.2217693, -1.105312, -2.940749, 1, 1, 1, 1, 1,
-0.2191617, -1.392886, -2.17112, 1, 1, 1, 1, 1,
-0.2146802, 0.09770151, -2.130657, 1, 1, 1, 1, 1,
-0.2142814, -0.05125351, -2.311525, 1, 1, 1, 1, 1,
-0.2117508, 1.340449, -1.13228, 1, 1, 1, 1, 1,
-0.2106941, -0.2957946, -2.067882, 1, 1, 1, 1, 1,
-0.2102363, 0.9268436, -0.4695939, 1, 1, 1, 1, 1,
-0.2080858, 1.103173, 0.8892278, 1, 1, 1, 1, 1,
-0.2002903, 0.1692728, -3.208742, 1, 1, 1, 1, 1,
-0.196698, 0.8480884, -2.009825, 1, 1, 1, 1, 1,
-0.1884218, -0.1375852, -2.358412, 0, 0, 1, 1, 1,
-0.1761533, 2.679768, 1.168624, 1, 0, 0, 1, 1,
-0.173045, 1.299345, -0.5236799, 1, 0, 0, 1, 1,
-0.1716533, -1.572478, -2.456106, 1, 0, 0, 1, 1,
-0.1704982, -0.6424921, -2.501256, 1, 0, 0, 1, 1,
-0.1643969, 0.3700921, 0.2096255, 1, 0, 0, 1, 1,
-0.1595783, -0.4654393, -3.502256, 0, 0, 0, 1, 1,
-0.1595444, 0.6291117, -1.371872, 0, 0, 0, 1, 1,
-0.1582945, 1.38747, -0.4207848, 0, 0, 0, 1, 1,
-0.1557382, 0.1871721, -1.622802, 0, 0, 0, 1, 1,
-0.1519034, 0.7145995, 0.2191744, 0, 0, 0, 1, 1,
-0.1501103, -0.7078027, -1.839692, 0, 0, 0, 1, 1,
-0.1485867, -0.5178711, -2.737593, 0, 0, 0, 1, 1,
-0.1443851, 0.4705399, 0.6827154, 1, 1, 1, 1, 1,
-0.1436905, 0.2846082, -0.355509, 1, 1, 1, 1, 1,
-0.1383988, 1.1321, -1.676825, 1, 1, 1, 1, 1,
-0.1372257, 1.224922, -0.7077696, 1, 1, 1, 1, 1,
-0.1287837, -0.05666677, 0.4721283, 1, 1, 1, 1, 1,
-0.1264995, -0.8106171, -2.867026, 1, 1, 1, 1, 1,
-0.1190781, -0.8748931, -2.077255, 1, 1, 1, 1, 1,
-0.1146983, 0.01807616, -1.187775, 1, 1, 1, 1, 1,
-0.113919, 0.8551891, -2.298612, 1, 1, 1, 1, 1,
-0.1134415, 1.517253, -1.798346, 1, 1, 1, 1, 1,
-0.112345, -0.2319495, -3.003872, 1, 1, 1, 1, 1,
-0.1090776, 1.209161, 2.16953, 1, 1, 1, 1, 1,
-0.1051227, -0.8153068, -1.317793, 1, 1, 1, 1, 1,
-0.1039735, 1.109124, -1.395243, 1, 1, 1, 1, 1,
-0.1031637, 0.4408654, -0.1209038, 1, 1, 1, 1, 1,
-0.1017438, -0.8386083, -2.412238, 0, 0, 1, 1, 1,
-0.09639645, 1.598676, 0.3523428, 1, 0, 0, 1, 1,
-0.09326122, -2.021521, -2.828675, 1, 0, 0, 1, 1,
-0.09267078, 1.404079, 1.058126, 1, 0, 0, 1, 1,
-0.09035259, 0.4046704, 0.1219796, 1, 0, 0, 1, 1,
-0.08922934, 0.3376918, 1.493018, 1, 0, 0, 1, 1,
-0.08890152, 0.4035162, 0.7709966, 0, 0, 0, 1, 1,
-0.08841698, -0.855506, -3.001182, 0, 0, 0, 1, 1,
-0.08109011, 0.6729667, 0.5083324, 0, 0, 0, 1, 1,
-0.08105333, -0.8734478, -3.275138, 0, 0, 0, 1, 1,
-0.08088902, 0.1006302, -3.496016, 0, 0, 0, 1, 1,
-0.07826181, -0.35661, -1.663843, 0, 0, 0, 1, 1,
-0.07067826, 0.5958442, 0.4377089, 0, 0, 0, 1, 1,
-0.06960514, -1.426663, -3.744286, 1, 1, 1, 1, 1,
-0.06226183, -2.213343, -0.7006603, 1, 1, 1, 1, 1,
-0.06147, -0.6174167, -3.187723, 1, 1, 1, 1, 1,
-0.06007303, -0.666864, -2.675818, 1, 1, 1, 1, 1,
-0.05952286, 0.6291221, 0.3915598, 1, 1, 1, 1, 1,
-0.05669226, 0.3689826, 0.3587084, 1, 1, 1, 1, 1,
-0.05527773, 0.6853083, 0.9065333, 1, 1, 1, 1, 1,
-0.05372919, 2.467598, -2.444292, 1, 1, 1, 1, 1,
-0.04862103, 0.01725556, -0.6304991, 1, 1, 1, 1, 1,
-0.04503777, -0.4534751, -3.266189, 1, 1, 1, 1, 1,
-0.04489319, 1.032418, -0.1232997, 1, 1, 1, 1, 1,
-0.04383639, -1.282769, -3.023452, 1, 1, 1, 1, 1,
-0.04370976, -0.9641399, -4.552469, 1, 1, 1, 1, 1,
-0.03818492, -1.153336, -2.484278, 1, 1, 1, 1, 1,
-0.03467149, 1.056406, 0.2971503, 1, 1, 1, 1, 1,
-0.03444636, 0.5730262, -0.1859813, 0, 0, 1, 1, 1,
-0.03040984, 1.4312, -1.473472, 1, 0, 0, 1, 1,
-0.02812563, -0.4234266, -3.59789, 1, 0, 0, 1, 1,
-0.02633937, 0.9920483, 1.991412, 1, 0, 0, 1, 1,
-0.02600664, 0.9662421, -0.1478991, 1, 0, 0, 1, 1,
-0.02070735, -0.4830261, -4.559873, 1, 0, 0, 1, 1,
-0.01916565, -0.08975379, -3.527247, 0, 0, 0, 1, 1,
-0.01577407, -1.033457, -3.180065, 0, 0, 0, 1, 1,
-0.009279209, -0.7968003, -1.832847, 0, 0, 0, 1, 1,
-0.008127758, 0.1236304, -1.663389, 0, 0, 0, 1, 1,
-0.006895871, -1.294133, -2.035999, 0, 0, 0, 1, 1,
-0.005521697, -0.02560911, -1.870307, 0, 0, 0, 1, 1,
-0.005144549, 0.3076675, -0.424656, 0, 0, 0, 1, 1,
-0.003571655, -0.9588146, -3.348192, 1, 1, 1, 1, 1,
0.006087608, 2.003108, 2.206046, 1, 1, 1, 1, 1,
0.008211647, -0.2729501, 2.171185, 1, 1, 1, 1, 1,
0.008585482, -0.9960237, 2.536921, 1, 1, 1, 1, 1,
0.01503407, 0.1990157, -0.6708649, 1, 1, 1, 1, 1,
0.01562854, -0.7832351, 1.764646, 1, 1, 1, 1, 1,
0.0161129, -0.3002036, 2.739587, 1, 1, 1, 1, 1,
0.02070635, -0.2945522, 1.774169, 1, 1, 1, 1, 1,
0.02097188, -0.4093269, 2.758563, 1, 1, 1, 1, 1,
0.0216677, -1.100711, 3.043538, 1, 1, 1, 1, 1,
0.02257326, 1.322507, -1.139607, 1, 1, 1, 1, 1,
0.0245249, 1.060746, 1.116223, 1, 1, 1, 1, 1,
0.03468154, -0.5916287, 1.981306, 1, 1, 1, 1, 1,
0.03601355, 0.1378027, -1.892872, 1, 1, 1, 1, 1,
0.03800284, -0.3446325, 4.955785, 1, 1, 1, 1, 1,
0.05312474, -0.3617683, 3.653601, 0, 0, 1, 1, 1,
0.05986107, -1.455396, 3.331235, 1, 0, 0, 1, 1,
0.06071221, 0.8998749, -1.735585, 1, 0, 0, 1, 1,
0.06269351, 2.309313, 0.3986498, 1, 0, 0, 1, 1,
0.06431805, -0.393544, 2.734223, 1, 0, 0, 1, 1,
0.06531289, 0.8530147, -0.3243831, 1, 0, 0, 1, 1,
0.06533279, -1.291918, 3.979212, 0, 0, 0, 1, 1,
0.06692865, 1.615106, -0.2960916, 0, 0, 0, 1, 1,
0.06843065, -0.01052298, 1.086178, 0, 0, 0, 1, 1,
0.07202744, 1.854893, 0.3153022, 0, 0, 0, 1, 1,
0.07245327, 0.7599581, 0.7792195, 0, 0, 0, 1, 1,
0.07252972, 0.8523178, 0.08543081, 0, 0, 0, 1, 1,
0.07308665, 0.2106515, -0.345477, 0, 0, 0, 1, 1,
0.07361764, 1.784232, 0.7997472, 1, 1, 1, 1, 1,
0.07438055, -0.05769574, 1.82221, 1, 1, 1, 1, 1,
0.07744396, -0.5243903, 4.298714, 1, 1, 1, 1, 1,
0.07846709, -0.4961631, 1.816774, 1, 1, 1, 1, 1,
0.08048993, -0.09859453, 4.349059, 1, 1, 1, 1, 1,
0.0831919, 1.705615, -0.06655092, 1, 1, 1, 1, 1,
0.08354389, -1.029966, 4.807909, 1, 1, 1, 1, 1,
0.08469687, 1.065668, -0.04298914, 1, 1, 1, 1, 1,
0.08477819, -0.3490409, 2.578725, 1, 1, 1, 1, 1,
0.08495496, 0.6053833, 0.7059455, 1, 1, 1, 1, 1,
0.08535717, 1.465638, -0.9779924, 1, 1, 1, 1, 1,
0.08648331, 0.5989808, 1.357751, 1, 1, 1, 1, 1,
0.087112, -1.421859, 3.584281, 1, 1, 1, 1, 1,
0.0876067, -0.8274639, 2.025161, 1, 1, 1, 1, 1,
0.08811881, -0.2183349, 1.4151, 1, 1, 1, 1, 1,
0.09008922, -0.9434296, 1.953347, 0, 0, 1, 1, 1,
0.09591564, -1.770065, 4.217967, 1, 0, 0, 1, 1,
0.09636493, 0.04144982, 1.231926, 1, 0, 0, 1, 1,
0.114402, 0.8009207, 0.8381814, 1, 0, 0, 1, 1,
0.1189069, -1.260649, 4.3748, 1, 0, 0, 1, 1,
0.123253, 0.08536814, 1.371921, 1, 0, 0, 1, 1,
0.1261889, 0.6095754, 1.061093, 0, 0, 0, 1, 1,
0.1282526, 0.1933611, 1.560883, 0, 0, 0, 1, 1,
0.1346989, 1.635298, -0.7067159, 0, 0, 0, 1, 1,
0.1385013, -0.2918624, 4.051771, 0, 0, 0, 1, 1,
0.1385159, 1.323785, 0.2851904, 0, 0, 0, 1, 1,
0.1425851, -0.9490979, 1.4674, 0, 0, 0, 1, 1,
0.1435902, -0.3093559, 2.366635, 0, 0, 0, 1, 1,
0.1444129, -0.1057278, 3.754874, 1, 1, 1, 1, 1,
0.1466369, -0.4973257, 1.016942, 1, 1, 1, 1, 1,
0.1477908, 2.548726, -0.6562826, 1, 1, 1, 1, 1,
0.1516959, 1.507068, -0.6833032, 1, 1, 1, 1, 1,
0.1544525, -0.9312775, 3.585577, 1, 1, 1, 1, 1,
0.1572907, 0.5619015, 1.27455, 1, 1, 1, 1, 1,
0.1607556, -0.1748451, 3.140822, 1, 1, 1, 1, 1,
0.1631435, 1.581527, 1.74945, 1, 1, 1, 1, 1,
0.1632573, -0.8697048, 3.863334, 1, 1, 1, 1, 1,
0.1705394, 0.5492243, 0.2966592, 1, 1, 1, 1, 1,
0.1756803, -0.04407842, 0.8511234, 1, 1, 1, 1, 1,
0.1811041, -0.06194817, 1.556627, 1, 1, 1, 1, 1,
0.1814054, 0.2737309, 0.6835641, 1, 1, 1, 1, 1,
0.184245, -1.019446, 3.953543, 1, 1, 1, 1, 1,
0.1850541, -1.393037, 4.005545, 1, 1, 1, 1, 1,
0.1877315, 1.244004, 0.8339106, 0, 0, 1, 1, 1,
0.1886343, 0.5527158, 1.384746, 1, 0, 0, 1, 1,
0.1902263, 0.4638058, 0.007018202, 1, 0, 0, 1, 1,
0.1923518, -1.311164, 2.867669, 1, 0, 0, 1, 1,
0.1949479, 0.2255906, 0.4592372, 1, 0, 0, 1, 1,
0.1988953, 0.9182693, 0.5907469, 1, 0, 0, 1, 1,
0.2019469, 0.2410065, 1.373546, 0, 0, 0, 1, 1,
0.2092248, -0.6193364, 3.121356, 0, 0, 0, 1, 1,
0.2190693, -1.507215, 2.730742, 0, 0, 0, 1, 1,
0.2191125, 0.08205483, -0.4678123, 0, 0, 0, 1, 1,
0.2199388, -0.46035, 2.026301, 0, 0, 0, 1, 1,
0.2247005, 0.1395209, -0.3460416, 0, 0, 0, 1, 1,
0.2316127, 0.750409, -1.23368, 0, 0, 0, 1, 1,
0.2319276, -0.3337045, 0.2423553, 1, 1, 1, 1, 1,
0.2322118, -1.054267, 1.902112, 1, 1, 1, 1, 1,
0.2343358, -0.5139632, 2.902182, 1, 1, 1, 1, 1,
0.2398849, -0.6923977, 2.605103, 1, 1, 1, 1, 1,
0.2431269, 0.004068134, 0.5835159, 1, 1, 1, 1, 1,
0.2432214, -0.7328779, 3.984393, 1, 1, 1, 1, 1,
0.2444744, 0.7782173, 1.251352, 1, 1, 1, 1, 1,
0.2537231, 1.793899, -0.6835268, 1, 1, 1, 1, 1,
0.2608004, -0.8876756, 3.493324, 1, 1, 1, 1, 1,
0.2612417, -0.008694363, 2.709947, 1, 1, 1, 1, 1,
0.2636448, 0.1524345, 1.72292, 1, 1, 1, 1, 1,
0.2695496, 1.875291, -0.5474278, 1, 1, 1, 1, 1,
0.2726882, -1.308132, 2.085537, 1, 1, 1, 1, 1,
0.2730482, -1.555425, 3.94689, 1, 1, 1, 1, 1,
0.2788577, -1.351563, 5.153715, 1, 1, 1, 1, 1,
0.281032, -0.2839616, 1.653774, 0, 0, 1, 1, 1,
0.2917044, 0.3515719, 1.234532, 1, 0, 0, 1, 1,
0.2981976, -0.2270394, 3.116128, 1, 0, 0, 1, 1,
0.2983715, 0.9526934, 0.2518938, 1, 0, 0, 1, 1,
0.2990387, 0.6499827, 0.8056495, 1, 0, 0, 1, 1,
0.3011419, 1.123263, 0.816125, 1, 0, 0, 1, 1,
0.3023872, 0.08757222, 0.02515458, 0, 0, 0, 1, 1,
0.3076943, -0.9813904, 2.275229, 0, 0, 0, 1, 1,
0.3084853, -1.468702, 3.163233, 0, 0, 0, 1, 1,
0.3173157, 1.132743, -0.4936088, 0, 0, 0, 1, 1,
0.3181591, -1.286783, 2.830843, 0, 0, 0, 1, 1,
0.3196467, 1.046919, 0.8070092, 0, 0, 0, 1, 1,
0.3202266, 0.2089657, 0.2548154, 0, 0, 0, 1, 1,
0.3222812, -0.7734681, 3.135525, 1, 1, 1, 1, 1,
0.3236402, 0.2483631, 2.042737, 1, 1, 1, 1, 1,
0.3279218, -1.152486, 3.009193, 1, 1, 1, 1, 1,
0.3299429, -1.609597, 2.606966, 1, 1, 1, 1, 1,
0.3340466, -0.7404881, 1.417094, 1, 1, 1, 1, 1,
0.3357848, -0.7002777, 2.959018, 1, 1, 1, 1, 1,
0.3359085, -1.720015, 2.981537, 1, 1, 1, 1, 1,
0.3372984, 0.3645528, 0.8776318, 1, 1, 1, 1, 1,
0.3383155, 2.054504, -0.03487771, 1, 1, 1, 1, 1,
0.3411348, -0.5707508, 1.994377, 1, 1, 1, 1, 1,
0.3429156, -0.7375234, 2.42183, 1, 1, 1, 1, 1,
0.3430562, -0.8153942, 0.3141212, 1, 1, 1, 1, 1,
0.3453536, 0.3986708, 1.136363, 1, 1, 1, 1, 1,
0.346599, -1.627242, 3.900726, 1, 1, 1, 1, 1,
0.3471715, -1.190421, 3.221859, 1, 1, 1, 1, 1,
0.3486011, 0.3810281, -0.1525837, 0, 0, 1, 1, 1,
0.3489619, -0.36246, 2.544409, 1, 0, 0, 1, 1,
0.349794, -0.05326631, 0.5829287, 1, 0, 0, 1, 1,
0.3510765, -2.390009, 4.477722, 1, 0, 0, 1, 1,
0.3513503, 1.053522, 0.9634163, 1, 0, 0, 1, 1,
0.3594575, 0.8435362, 1.968638, 1, 0, 0, 1, 1,
0.3617557, -0.3337152, 3.033944, 0, 0, 0, 1, 1,
0.362815, 0.3966061, -0.7521486, 0, 0, 0, 1, 1,
0.3688023, -1.49286, 2.124453, 0, 0, 0, 1, 1,
0.3696096, 0.7964584, -0.8165675, 0, 0, 0, 1, 1,
0.3708456, -1.405513, 2.004424, 0, 0, 0, 1, 1,
0.3724691, -1.56988, 2.880098, 0, 0, 0, 1, 1,
0.3729054, 0.3099713, 3.165013, 0, 0, 0, 1, 1,
0.3730311, 0.5404885, -1.097018, 1, 1, 1, 1, 1,
0.3756631, 0.3434538, 0.8744646, 1, 1, 1, 1, 1,
0.3901544, 0.9044843, -0.4365806, 1, 1, 1, 1, 1,
0.3916926, 0.9232411, -1.077209, 1, 1, 1, 1, 1,
0.3995191, -0.5189541, 2.766932, 1, 1, 1, 1, 1,
0.4046438, 0.217721, 0.6636654, 1, 1, 1, 1, 1,
0.4051391, 1.001701, -0.4640723, 1, 1, 1, 1, 1,
0.4073674, -1.896374, 1.483783, 1, 1, 1, 1, 1,
0.4085105, -2.481711, 3.258872, 1, 1, 1, 1, 1,
0.4098713, 0.7662858, -0.2198556, 1, 1, 1, 1, 1,
0.4126743, 0.7904712, 0.6192836, 1, 1, 1, 1, 1,
0.4174673, 1.942809, -0.7999581, 1, 1, 1, 1, 1,
0.4222794, 0.3519491, 1.510325, 1, 1, 1, 1, 1,
0.4241463, -0.8527193, 4.232075, 1, 1, 1, 1, 1,
0.4269195, 1.06466, 0.2317682, 1, 1, 1, 1, 1,
0.428115, -0.5141836, 2.820017, 0, 0, 1, 1, 1,
0.4301574, 0.8013772, 1.544054, 1, 0, 0, 1, 1,
0.4322649, 0.8253781, 1.614269, 1, 0, 0, 1, 1,
0.4330239, -1.818973, 2.326188, 1, 0, 0, 1, 1,
0.4344743, -0.74461, 1.816616, 1, 0, 0, 1, 1,
0.4360757, 0.2421553, 1.574377, 1, 0, 0, 1, 1,
0.4384282, 1.313517, 0.607185, 0, 0, 0, 1, 1,
0.4435996, 0.3581059, -0.1261409, 0, 0, 0, 1, 1,
0.4473918, -1.188871, 3.125989, 0, 0, 0, 1, 1,
0.4498009, 0.336547, 0.5013306, 0, 0, 0, 1, 1,
0.4519932, 1.80387, 1.993978, 0, 0, 0, 1, 1,
0.4528784, 0.5105239, 0.2753411, 0, 0, 0, 1, 1,
0.4529607, 0.3247428, 0.3498912, 0, 0, 0, 1, 1,
0.4555775, -0.6703888, 2.442091, 1, 1, 1, 1, 1,
0.4565382, 0.9591541, -1.744096, 1, 1, 1, 1, 1,
0.4576911, -0.4642459, 2.246421, 1, 1, 1, 1, 1,
0.4651304, -0.7702128, 2.400309, 1, 1, 1, 1, 1,
0.4787312, -0.4520741, 2.474082, 1, 1, 1, 1, 1,
0.4788085, -1.176182, 3.652179, 1, 1, 1, 1, 1,
0.4791285, 1.102592, -1.119964, 1, 1, 1, 1, 1,
0.48702, 0.4329484, -0.8244309, 1, 1, 1, 1, 1,
0.4875103, -0.6532212, 2.137717, 1, 1, 1, 1, 1,
0.4952128, 0.9736005, 0.0127373, 1, 1, 1, 1, 1,
0.4983211, -0.9690442, 0.7538032, 1, 1, 1, 1, 1,
0.4986567, 0.5756534, 0.4318893, 1, 1, 1, 1, 1,
0.5012742, 0.8879604, -1.344464, 1, 1, 1, 1, 1,
0.5074112, 0.6125119, 0.180702, 1, 1, 1, 1, 1,
0.508027, -1.276435, 1.623681, 1, 1, 1, 1, 1,
0.51157, -1.437067, 0.6616493, 0, 0, 1, 1, 1,
0.514798, 0.4517423, -0.4292377, 1, 0, 0, 1, 1,
0.5176196, -0.02099116, 0.8708447, 1, 0, 0, 1, 1,
0.5209048, -1.292271, 3.006497, 1, 0, 0, 1, 1,
0.5273001, -0.1169379, 2.004477, 1, 0, 0, 1, 1,
0.5357208, -0.4287492, 3.466781, 1, 0, 0, 1, 1,
0.5382586, 1.165799, 0.925599, 0, 0, 0, 1, 1,
0.546066, -0.1483581, 0.4393842, 0, 0, 0, 1, 1,
0.5472251, -2.592948, 2.129269, 0, 0, 0, 1, 1,
0.5553633, 1.070856, -1.038175, 0, 0, 0, 1, 1,
0.556493, 1.626932, 0.2381002, 0, 0, 0, 1, 1,
0.5572689, -0.3452117, 0.7843338, 0, 0, 0, 1, 1,
0.5576189, -0.3114276, 3.434341, 0, 0, 0, 1, 1,
0.5644994, -0.827755, 4.804104, 1, 1, 1, 1, 1,
0.5691926, -0.8477164, 3.630176, 1, 1, 1, 1, 1,
0.5752287, -1.194397, 3.991457, 1, 1, 1, 1, 1,
0.5778642, 0.2284649, 2.504455, 1, 1, 1, 1, 1,
0.5845901, 2.136175, -0.8878397, 1, 1, 1, 1, 1,
0.5883598, -0.2003295, 1.962119, 1, 1, 1, 1, 1,
0.595304, -0.5256825, 2.111184, 1, 1, 1, 1, 1,
0.5956956, -1.73093, 2.075533, 1, 1, 1, 1, 1,
0.6020624, 1.329307, 1.757445, 1, 1, 1, 1, 1,
0.6047445, 1.171542, 0.8780338, 1, 1, 1, 1, 1,
0.6104089, -1.167041, 1.642639, 1, 1, 1, 1, 1,
0.6125738, 0.7970328, -0.7373033, 1, 1, 1, 1, 1,
0.6129792, -1.199742, 3.055145, 1, 1, 1, 1, 1,
0.6137165, -0.9548104, 1.247804, 1, 1, 1, 1, 1,
0.6137311, -0.2456547, 4.928903, 1, 1, 1, 1, 1,
0.6148108, -1.834042, 3.421875, 0, 0, 1, 1, 1,
0.6155547, -1.924245, 2.318189, 1, 0, 0, 1, 1,
0.6202259, -0.8889654, 3.457581, 1, 0, 0, 1, 1,
0.6212202, -0.2733565, 2.9353, 1, 0, 0, 1, 1,
0.6259003, -0.8984827, 1.461353, 1, 0, 0, 1, 1,
0.6287746, 0.419233, 0.8656604, 1, 0, 0, 1, 1,
0.629878, -1.180453, 2.332189, 0, 0, 0, 1, 1,
0.6377735, -1.516846, 2.80632, 0, 0, 0, 1, 1,
0.6474006, -1.324274, 2.359081, 0, 0, 0, 1, 1,
0.6489128, 0.3174303, 1.125002, 0, 0, 0, 1, 1,
0.6526853, -0.2660434, 1.74213, 0, 0, 0, 1, 1,
0.6540368, 0.1659098, 1.513715, 0, 0, 0, 1, 1,
0.6543003, -0.2681988, 1.917528, 0, 0, 0, 1, 1,
0.6581342, -0.7304555, 3.201876, 1, 1, 1, 1, 1,
0.6615381, 1.40875, 1.782922, 1, 1, 1, 1, 1,
0.6701959, -0.8254853, 2.908725, 1, 1, 1, 1, 1,
0.6724656, 1.24954, 0.1539809, 1, 1, 1, 1, 1,
0.6731087, 1.503503, 0.1414734, 1, 1, 1, 1, 1,
0.6742837, 0.5644738, -0.02295335, 1, 1, 1, 1, 1,
0.6757374, 0.1958502, 1.171204, 1, 1, 1, 1, 1,
0.6791247, -1.174547, 4.943629, 1, 1, 1, 1, 1,
0.6809075, -0.7408872, 1.525471, 1, 1, 1, 1, 1,
0.6825405, 0.7602116, -0.5696221, 1, 1, 1, 1, 1,
0.6856289, -0.136227, 1.003388, 1, 1, 1, 1, 1,
0.6882246, 0.2101725, 1.810364, 1, 1, 1, 1, 1,
0.6988454, -0.2942692, 2.499166, 1, 1, 1, 1, 1,
0.7008926, -0.7592895, 3.302603, 1, 1, 1, 1, 1,
0.7085504, -1.239889, 3.291705, 1, 1, 1, 1, 1,
0.7102963, -0.5809276, 1.908089, 0, 0, 1, 1, 1,
0.712267, -0.5502503, 2.792596, 1, 0, 0, 1, 1,
0.7160574, 1.744946, -0.4525654, 1, 0, 0, 1, 1,
0.717798, -0.4488727, 1.023293, 1, 0, 0, 1, 1,
0.7294456, -1.908126, 3.269397, 1, 0, 0, 1, 1,
0.7310209, 1.001904, 1.506352, 1, 0, 0, 1, 1,
0.7322546, -1.517411, 2.01795, 0, 0, 0, 1, 1,
0.7332358, -0.2119145, 3.158613, 0, 0, 0, 1, 1,
0.733426, -0.7969131, 2.411044, 0, 0, 0, 1, 1,
0.7372757, -0.8296533, 1.641707, 0, 0, 0, 1, 1,
0.7388371, -0.3062716, 2.650099, 0, 0, 0, 1, 1,
0.7394524, -2.199598, 3.796562, 0, 0, 0, 1, 1,
0.7424524, -1.584732, 3.909868, 0, 0, 0, 1, 1,
0.7429049, 0.8984271, -0.03767719, 1, 1, 1, 1, 1,
0.7444445, -1.011824, 3.944741, 1, 1, 1, 1, 1,
0.7530655, 0.9633822, -0.2326349, 1, 1, 1, 1, 1,
0.757141, 1.739489, -0.9054545, 1, 1, 1, 1, 1,
0.7578006, 1.843423, 0.5602605, 1, 1, 1, 1, 1,
0.7639288, -0.6529629, 2.229412, 1, 1, 1, 1, 1,
0.7665199, -1.415989, 1.803815, 1, 1, 1, 1, 1,
0.7734268, 1.298989, -1.075894, 1, 1, 1, 1, 1,
0.7780489, 1.260169, 1.880919, 1, 1, 1, 1, 1,
0.7800477, -0.5499971, 1.670135, 1, 1, 1, 1, 1,
0.781242, 0.7487497, -1.281463, 1, 1, 1, 1, 1,
0.786057, -0.283849, 1.059976, 1, 1, 1, 1, 1,
0.8087767, 1.419633, 0.8747004, 1, 1, 1, 1, 1,
0.809018, -1.584171, 1.398054, 1, 1, 1, 1, 1,
0.8136535, -1.535179, 1.503147, 1, 1, 1, 1, 1,
0.8146554, 0.5035396, 0.2676465, 0, 0, 1, 1, 1,
0.8185508, -0.3351214, 1.302469, 1, 0, 0, 1, 1,
0.8209574, -1.518821, 1.537351, 1, 0, 0, 1, 1,
0.82777, 1.31074, 2.02709, 1, 0, 0, 1, 1,
0.8295043, 0.4522132, 2.31937, 1, 0, 0, 1, 1,
0.836983, 0.1558996, 1.010419, 1, 0, 0, 1, 1,
0.8396016, -0.4854407, 3.012558, 0, 0, 0, 1, 1,
0.8400365, -0.5283821, 2.050333, 0, 0, 0, 1, 1,
0.8415136, 1.645818, -0.3912171, 0, 0, 0, 1, 1,
0.8426628, 0.1300343, -0.1507233, 0, 0, 0, 1, 1,
0.8467727, -0.3072245, 0.7651792, 0, 0, 0, 1, 1,
0.8509497, -0.3791696, 2.179532, 0, 0, 0, 1, 1,
0.8521844, 0.9614151, 0.6483932, 0, 0, 0, 1, 1,
0.8610339, -0.4404315, 2.854446, 1, 1, 1, 1, 1,
0.8614249, -0.7189238, 1.531809, 1, 1, 1, 1, 1,
0.8688315, 0.6148139, 0.3164262, 1, 1, 1, 1, 1,
0.8691955, 0.8345546, 2.831501, 1, 1, 1, 1, 1,
0.8807039, -0.3862677, 1.920156, 1, 1, 1, 1, 1,
0.8860115, -0.5339068, 3.06677, 1, 1, 1, 1, 1,
0.8881059, 1.301463, 0.5504946, 1, 1, 1, 1, 1,
0.8883411, 2.070065, 0.1774423, 1, 1, 1, 1, 1,
0.8926142, -0.3267597, 1.369739, 1, 1, 1, 1, 1,
0.8927479, 0.4755517, 0.6691551, 1, 1, 1, 1, 1,
0.8945629, -0.1123697, 2.38675, 1, 1, 1, 1, 1,
0.8955189, -2.073004, 0.9983898, 1, 1, 1, 1, 1,
0.8973961, -0.9310005, 3.516045, 1, 1, 1, 1, 1,
0.9046744, -0.2827477, 3.1998, 1, 1, 1, 1, 1,
0.9082127, 0.1216215, -0.08969456, 1, 1, 1, 1, 1,
0.9091986, -0.7252049, 1.218269, 0, 0, 1, 1, 1,
0.9153326, -0.4067477, 1.647487, 1, 0, 0, 1, 1,
0.9203772, 0.7452857, 0.7013857, 1, 0, 0, 1, 1,
0.9203841, 1.050689, 0.7817913, 1, 0, 0, 1, 1,
0.9299915, -0.3768975, 2.745773, 1, 0, 0, 1, 1,
0.9344521, 0.2893131, 2.024217, 1, 0, 0, 1, 1,
0.9355627, -0.3143353, 3.716918, 0, 0, 0, 1, 1,
0.9359751, 0.2840226, 1.422376, 0, 0, 0, 1, 1,
0.9367708, 1.725248, 2.203428, 0, 0, 0, 1, 1,
0.9391462, -0.5401192, 0.1688272, 0, 0, 0, 1, 1,
0.9393149, 1.427781, -0.007160393, 0, 0, 0, 1, 1,
0.9401716, -0.04122506, 2.483081, 0, 0, 0, 1, 1,
0.9433274, -0.3862718, 1.386192, 0, 0, 0, 1, 1,
0.9460179, -1.390763, 4.558762, 1, 1, 1, 1, 1,
0.9588107, -1.543274, 2.375173, 1, 1, 1, 1, 1,
0.9588185, -0.4254261, 3.729223, 1, 1, 1, 1, 1,
0.9605959, 0.366338, 2.084484, 1, 1, 1, 1, 1,
0.9619348, -0.4763682, 1.045432, 1, 1, 1, 1, 1,
0.9625536, 1.120599, 3.520613, 1, 1, 1, 1, 1,
0.9637352, -0.1316663, 1.647537, 1, 1, 1, 1, 1,
0.9654933, -0.01095728, 2.371027, 1, 1, 1, 1, 1,
0.9737849, -1.344855, 0.3488478, 1, 1, 1, 1, 1,
0.9849508, -0.324041, 0.9044169, 1, 1, 1, 1, 1,
0.9984237, 1.2157, 1.181196, 1, 1, 1, 1, 1,
1.002156, -0.09313138, 0.3508195, 1, 1, 1, 1, 1,
1.003333, -0.4746819, 1.848087, 1, 1, 1, 1, 1,
1.003604, 1.459538, -1.564317, 1, 1, 1, 1, 1,
1.019905, 1.004339, -0.5779636, 1, 1, 1, 1, 1,
1.034346, -0.277097, 2.717392, 0, 0, 1, 1, 1,
1.037636, -1.916329, 4.56838, 1, 0, 0, 1, 1,
1.041272, 1.801622, -1.119031, 1, 0, 0, 1, 1,
1.04478, -2.131148, 0.7582924, 1, 0, 0, 1, 1,
1.049764, -1.455671, 1.66144, 1, 0, 0, 1, 1,
1.049915, -0.2724018, 1.117322, 1, 0, 0, 1, 1,
1.050711, 0.949746, -0.8257972, 0, 0, 0, 1, 1,
1.051958, -0.2110341, 2.466461, 0, 0, 0, 1, 1,
1.056115, -0.6608878, 2.605213, 0, 0, 0, 1, 1,
1.060185, -0.6603472, 1.189928, 0, 0, 0, 1, 1,
1.061728, 0.3385336, -0.3919161, 0, 0, 0, 1, 1,
1.064157, -1.217528, 2.677238, 0, 0, 0, 1, 1,
1.066346, 0.9864206, 0.5749351, 0, 0, 0, 1, 1,
1.070034, -0.4440782, 1.261147, 1, 1, 1, 1, 1,
1.082198, 0.7282514, -0.07175922, 1, 1, 1, 1, 1,
1.083127, 0.06113544, 1.062866, 1, 1, 1, 1, 1,
1.083508, -1.858378, 2.784308, 1, 1, 1, 1, 1,
1.096008, -0.04978925, -0.2801506, 1, 1, 1, 1, 1,
1.102856, 0.2085555, 1.775385, 1, 1, 1, 1, 1,
1.103928, -0.2584617, 2.072715, 1, 1, 1, 1, 1,
1.106227, -1.695758, 4.40205, 1, 1, 1, 1, 1,
1.109026, 1.228548, -0.7249036, 1, 1, 1, 1, 1,
1.110473, 0.1790967, 1.33406, 1, 1, 1, 1, 1,
1.113513, 1.259058, 1.521816, 1, 1, 1, 1, 1,
1.118652, -0.3673522, 4.394858, 1, 1, 1, 1, 1,
1.123127, 1.197965, 0.3334528, 1, 1, 1, 1, 1,
1.125412, -0.8451902, 2.860733, 1, 1, 1, 1, 1,
1.128803, -0.4717451, 1.916545, 1, 1, 1, 1, 1,
1.129554, -0.6048199, 1.555657, 0, 0, 1, 1, 1,
1.133871, -0.2309662, 2.147275, 1, 0, 0, 1, 1,
1.140164, -0.8719906, 1.848714, 1, 0, 0, 1, 1,
1.146659, 1.917433, -0.0002586961, 1, 0, 0, 1, 1,
1.148473, -1.01043, 1.405864, 1, 0, 0, 1, 1,
1.164475, 1.321587, 0.05635748, 1, 0, 0, 1, 1,
1.171013, 1.487245, -0.4276987, 0, 0, 0, 1, 1,
1.1904, -0.4453839, 1.373269, 0, 0, 0, 1, 1,
1.191544, -1.302622, 2.035581, 0, 0, 0, 1, 1,
1.192761, 0.1063324, 3.218229, 0, 0, 0, 1, 1,
1.194474, -0.3579854, 2.364831, 0, 0, 0, 1, 1,
1.194512, 0.5083978, 1.574545, 0, 0, 0, 1, 1,
1.199618, -0.9773959, 2.058309, 0, 0, 0, 1, 1,
1.20185, -0.8753411, 1.272687, 1, 1, 1, 1, 1,
1.201954, 0.02254065, 2.53154, 1, 1, 1, 1, 1,
1.203864, 0.6519514, 0.4338678, 1, 1, 1, 1, 1,
1.204017, -1.040238, 3.105329, 1, 1, 1, 1, 1,
1.210297, 0.2627437, 0.2332919, 1, 1, 1, 1, 1,
1.211781, -0.390824, 3.040749, 1, 1, 1, 1, 1,
1.219892, -0.1488249, 0.30529, 1, 1, 1, 1, 1,
1.224556, 0.2994929, 1.489659, 1, 1, 1, 1, 1,
1.230178, -0.1813896, 1.663384, 1, 1, 1, 1, 1,
1.234189, 0.3518846, 1.111472, 1, 1, 1, 1, 1,
1.236235, -0.04691243, 2.521852, 1, 1, 1, 1, 1,
1.241642, 0.9928043, -0.4055464, 1, 1, 1, 1, 1,
1.256783, 0.9775626, 1.549759, 1, 1, 1, 1, 1,
1.259158, 2.039414, -1.018221, 1, 1, 1, 1, 1,
1.272637, -0.4747244, 2.026314, 1, 1, 1, 1, 1,
1.275577, 1.062867, 2.215833, 0, 0, 1, 1, 1,
1.292967, 0.1015974, 1.952775, 1, 0, 0, 1, 1,
1.298899, -0.2549892, 1.84942, 1, 0, 0, 1, 1,
1.300974, 0.3017114, 0.4520761, 1, 0, 0, 1, 1,
1.304793, -1.509813, 1.895383, 1, 0, 0, 1, 1,
1.309389, -0.6588163, 2.905073, 1, 0, 0, 1, 1,
1.309868, 0.1667382, 0.9677994, 0, 0, 0, 1, 1,
1.321202, 1.695198, 0.8221937, 0, 0, 0, 1, 1,
1.327459, 0.6217254, 1.918066, 0, 0, 0, 1, 1,
1.327569, -1.427517, 1.851292, 0, 0, 0, 1, 1,
1.336385, -0.6320221, 0.7150885, 0, 0, 0, 1, 1,
1.339252, 1.218703, 1.023765, 0, 0, 0, 1, 1,
1.353315, -1.697884, 2.516525, 0, 0, 0, 1, 1,
1.361963, 1.388893, 1.815371, 1, 1, 1, 1, 1,
1.368216, 1.77853, -0.203802, 1, 1, 1, 1, 1,
1.372353, -1.01537, 2.27223, 1, 1, 1, 1, 1,
1.391698, -0.1229461, 0.1425747, 1, 1, 1, 1, 1,
1.393304, -1.10623, 3.872513, 1, 1, 1, 1, 1,
1.402296, -0.05077387, 1.148584, 1, 1, 1, 1, 1,
1.407025, 0.204683, 0.8926519, 1, 1, 1, 1, 1,
1.409057, -0.1468664, 2.177378, 1, 1, 1, 1, 1,
1.415197, 0.5909858, 1.402285, 1, 1, 1, 1, 1,
1.415262, 1.471638, 1.762799, 1, 1, 1, 1, 1,
1.418509, 0.6772547, 1.892136, 1, 1, 1, 1, 1,
1.430569, -1.294924, 2.572637, 1, 1, 1, 1, 1,
1.431786, 0.124892, 1.591373, 1, 1, 1, 1, 1,
1.432035, -1.452288, 1.642223, 1, 1, 1, 1, 1,
1.43572, 0.784056, 0.3376642, 1, 1, 1, 1, 1,
1.437775, -2.112293, 0.9291177, 0, 0, 1, 1, 1,
1.439172, -0.3833756, 1.776536, 1, 0, 0, 1, 1,
1.452687, -0.3271061, 1.721596, 1, 0, 0, 1, 1,
1.459778, -0.8745524, 1.78624, 1, 0, 0, 1, 1,
1.462251, -0.1163926, 1.787931, 1, 0, 0, 1, 1,
1.470245, 0.4524821, 1.341658, 1, 0, 0, 1, 1,
1.470703, -0.7958862, 3.170805, 0, 0, 0, 1, 1,
1.471984, 2.176486, -0.6953638, 0, 0, 0, 1, 1,
1.485233, 0.7914844, 1.114007, 0, 0, 0, 1, 1,
1.491936, -1.178982, 1.383625, 0, 0, 0, 1, 1,
1.493627, -0.4322127, 3.343688, 0, 0, 0, 1, 1,
1.499392, -0.3276051, 0.8096375, 0, 0, 0, 1, 1,
1.526507, -2.661476, 2.234964, 0, 0, 0, 1, 1,
1.530331, 0.4239009, 0.7591104, 1, 1, 1, 1, 1,
1.541831, 0.2057452, 2.115929, 1, 1, 1, 1, 1,
1.549824, -0.5516387, 2.376581, 1, 1, 1, 1, 1,
1.551357, -0.8941822, 3.770617, 1, 1, 1, 1, 1,
1.552011, 0.3736309, 0.2430018, 1, 1, 1, 1, 1,
1.566172, -1.170308, 3.168639, 1, 1, 1, 1, 1,
1.579398, 0.1035212, 1.222968, 1, 1, 1, 1, 1,
1.580105, -0.6253205, 3.190466, 1, 1, 1, 1, 1,
1.580117, -2.037437, 2.939479, 1, 1, 1, 1, 1,
1.587554, -0.02570314, 0.5299264, 1, 1, 1, 1, 1,
1.595144, 0.4363382, 2.873878, 1, 1, 1, 1, 1,
1.622414, 0.4261251, 0.4887162, 1, 1, 1, 1, 1,
1.631649, -1.396132, 3.571168, 1, 1, 1, 1, 1,
1.63888, -0.8363032, 3.524489, 1, 1, 1, 1, 1,
1.639029, 1.749158, 0.1655499, 1, 1, 1, 1, 1,
1.641636, 0.2954292, 1.09105, 0, 0, 1, 1, 1,
1.650653, -0.5663767, 3.892505, 1, 0, 0, 1, 1,
1.65433, 2.062091, 0.3121145, 1, 0, 0, 1, 1,
1.655631, 0.1907437, 1.89203, 1, 0, 0, 1, 1,
1.660257, -0.899069, 3.983441, 1, 0, 0, 1, 1,
1.66069, -0.5260469, 2.770119, 1, 0, 0, 1, 1,
1.670352, 0.8698303, 1.298648, 0, 0, 0, 1, 1,
1.703756, -1.086707, 2.50595, 0, 0, 0, 1, 1,
1.705788, 0.4125463, -0.3617123, 0, 0, 0, 1, 1,
1.70836, 1.814998, 0.8982249, 0, 0, 0, 1, 1,
1.708376, 0.1141312, 1.948177, 0, 0, 0, 1, 1,
1.715325, -0.5384111, 0.132569, 0, 0, 0, 1, 1,
1.752151, -0.1645702, 2.459278, 0, 0, 0, 1, 1,
1.754447, 0.4142216, 0.2631706, 1, 1, 1, 1, 1,
1.777329, -0.2725015, 1.38744, 1, 1, 1, 1, 1,
1.80448, 0.355908, 1.998969, 1, 1, 1, 1, 1,
1.805434, -1.641251, 2.386759, 1, 1, 1, 1, 1,
1.814233, -0.4136831, -1.381483, 1, 1, 1, 1, 1,
1.831036, 0.3099385, 0.5124494, 1, 1, 1, 1, 1,
1.881934, -0.3511461, 2.469134, 1, 1, 1, 1, 1,
1.884639, 0.09884606, 2.039803, 1, 1, 1, 1, 1,
1.898797, -0.7668688, 0.9713048, 1, 1, 1, 1, 1,
1.956674, -0.3354186, 2.712946, 1, 1, 1, 1, 1,
1.965453, 1.358356, 1.768462, 1, 1, 1, 1, 1,
1.966891, 0.7843375, 2.842453, 1, 1, 1, 1, 1,
1.973031, -1.785938, 2.453749, 1, 1, 1, 1, 1,
2.04674, -0.1288696, 1.873953, 1, 1, 1, 1, 1,
2.062303, 0.5292178, 1.869462, 1, 1, 1, 1, 1,
2.088601, -0.9782017, 1.297619, 0, 0, 1, 1, 1,
2.09697, -0.09979331, 1.49364, 1, 0, 0, 1, 1,
2.101581, 1.000854, 1.122582, 1, 0, 0, 1, 1,
2.104679, 0.5992582, 2.460068, 1, 0, 0, 1, 1,
2.114855, -0.785262, 1.460807, 1, 0, 0, 1, 1,
2.164258, 0.392925, 2.480777, 1, 0, 0, 1, 1,
2.20352, 0.1307776, 0.973782, 0, 0, 0, 1, 1,
2.203878, -0.8997375, 3.967093, 0, 0, 0, 1, 1,
2.252384, 0.2538879, 1.252532, 0, 0, 0, 1, 1,
2.260142, 1.282079, -0.7671745, 0, 0, 0, 1, 1,
2.269583, -0.03910866, 0.7510775, 0, 0, 0, 1, 1,
2.271401, -0.07516549, -0.37588, 0, 0, 0, 1, 1,
2.304389, 0.1333624, 1.465093, 0, 0, 0, 1, 1,
2.379973, -0.2619202, 1.220002, 1, 1, 1, 1, 1,
2.450468, 0.9743689, 1.400201, 1, 1, 1, 1, 1,
2.530003, 0.2858869, 0.4047447, 1, 1, 1, 1, 1,
2.600728, -0.2182587, 1.524288, 1, 1, 1, 1, 1,
2.639404, -0.3024892, 2.01654, 1, 1, 1, 1, 1,
2.658561, -1.602032, 2.440175, 1, 1, 1, 1, 1,
2.928761, -0.9855745, -0.1874988, 1, 1, 1, 1, 1
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
var radius = 9.284852;
var distance = 32.61265;
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
mvMatrix.translate( 0.3851823, -0.1549466, -0.08083081 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.61265);
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
