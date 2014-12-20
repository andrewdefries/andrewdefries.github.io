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
-3.447762, 1.052448, -1.784759, 1, 0, 0, 1,
-2.872006, 1.957175, 0.963373, 1, 0.007843138, 0, 1,
-2.866513, -0.2240683, -1.590183, 1, 0.01176471, 0, 1,
-2.771975, 1.657657, -1.882308, 1, 0.01960784, 0, 1,
-2.688002, 0.3911549, -1.91391, 1, 0.02352941, 0, 1,
-2.67841, 1.43878, -0.09945013, 1, 0.03137255, 0, 1,
-2.654339, -0.0909443, -2.493872, 1, 0.03529412, 0, 1,
-2.627891, 0.1246643, -0.9201806, 1, 0.04313726, 0, 1,
-2.492711, -0.6992694, -0.004206968, 1, 0.04705882, 0, 1,
-2.458673, -0.2336092, -3.339682, 1, 0.05490196, 0, 1,
-2.453679, 1.67379, -1.142385, 1, 0.05882353, 0, 1,
-2.314442, -0.1568883, -3.138235, 1, 0.06666667, 0, 1,
-2.278796, 0.381125, -0.4543819, 1, 0.07058824, 0, 1,
-2.222843, 0.9938043, -2.992122, 1, 0.07843138, 0, 1,
-2.222045, 0.03163569, -1.928261, 1, 0.08235294, 0, 1,
-2.191288, -1.249835, -0.05418564, 1, 0.09019608, 0, 1,
-2.177498, 0.9256831, -1.095156, 1, 0.09411765, 0, 1,
-2.155912, -0.3471279, -2.742659, 1, 0.1019608, 0, 1,
-2.112639, 0.7854488, -0.07603018, 1, 0.1098039, 0, 1,
-2.097533, -0.0612267, -2.653089, 1, 0.1137255, 0, 1,
-2.092155, -0.570738, -2.767144, 1, 0.1215686, 0, 1,
-2.075201, -0.9281924, -1.201587, 1, 0.1254902, 0, 1,
-2.0678, 0.9560498, -2.048704, 1, 0.1333333, 0, 1,
-2.022415, 0.01033042, -0.8224233, 1, 0.1372549, 0, 1,
-2.000196, -0.878582, -1.053817, 1, 0.145098, 0, 1,
-1.984859, -0.004434919, -2.545987, 1, 0.1490196, 0, 1,
-1.977404, -0.8285909, -1.90745, 1, 0.1568628, 0, 1,
-1.963627, 0.2164267, 0.4919386, 1, 0.1607843, 0, 1,
-1.959114, 2.138845, -2.041936, 1, 0.1686275, 0, 1,
-1.955108, -0.5055536, 0.494559, 1, 0.172549, 0, 1,
-1.943741, -0.3909192, -2.086239, 1, 0.1803922, 0, 1,
-1.921379, 1.688525, 0.183798, 1, 0.1843137, 0, 1,
-1.915066, 0.2420819, -1.854572, 1, 0.1921569, 0, 1,
-1.899329, -1.288549, -3.76788, 1, 0.1960784, 0, 1,
-1.832349, 0.8647209, -2.855407, 1, 0.2039216, 0, 1,
-1.799577, 1.717419, -0.8180432, 1, 0.2117647, 0, 1,
-1.796003, 0.6503175, -0.8107467, 1, 0.2156863, 0, 1,
-1.782955, -0.7464454, -0.710283, 1, 0.2235294, 0, 1,
-1.781997, -1.713491, -3.291101, 1, 0.227451, 0, 1,
-1.725225, -1.245744, -2.48627, 1, 0.2352941, 0, 1,
-1.724584, 0.8272075, -0.5797068, 1, 0.2392157, 0, 1,
-1.719233, 2.071576, -2.721447, 1, 0.2470588, 0, 1,
-1.699068, 1.51783, -2.238131, 1, 0.2509804, 0, 1,
-1.69675, 1.137417, -0.2894139, 1, 0.2588235, 0, 1,
-1.650437, 0.8464319, -1.444397, 1, 0.2627451, 0, 1,
-1.645868, -0.3588539, -2.096983, 1, 0.2705882, 0, 1,
-1.644269, -1.570501, -2.07226, 1, 0.2745098, 0, 1,
-1.642792, -0.29592, -1.033317, 1, 0.282353, 0, 1,
-1.639767, 0.5796732, -2.738286, 1, 0.2862745, 0, 1,
-1.631047, 0.5058111, -2.553597, 1, 0.2941177, 0, 1,
-1.626004, 0.2778694, -2.040057, 1, 0.3019608, 0, 1,
-1.61218, -2.049656, -3.380625, 1, 0.3058824, 0, 1,
-1.59772, 0.9254409, -0.1544595, 1, 0.3137255, 0, 1,
-1.596091, -0.04945278, -3.532586, 1, 0.3176471, 0, 1,
-1.590542, -1.020847, -2.301618, 1, 0.3254902, 0, 1,
-1.589598, 0.6249239, -2.286529, 1, 0.3294118, 0, 1,
-1.58575, 0.5106751, -0.806003, 1, 0.3372549, 0, 1,
-1.581928, -0.3965133, -1.649079, 1, 0.3411765, 0, 1,
-1.577051, 0.5432776, -2.268385, 1, 0.3490196, 0, 1,
-1.573723, 1.550652, -0.8420167, 1, 0.3529412, 0, 1,
-1.550221, 0.6339837, -2.311025, 1, 0.3607843, 0, 1,
-1.542719, 0.03810834, -0.996122, 1, 0.3647059, 0, 1,
-1.539128, 0.03706704, -0.9822506, 1, 0.372549, 0, 1,
-1.538099, -0.3432182, -0.2429003, 1, 0.3764706, 0, 1,
-1.527316, 1.216073, -1.024363, 1, 0.3843137, 0, 1,
-1.521531, -1.238297, -1.967094, 1, 0.3882353, 0, 1,
-1.517659, 0.1640109, -1.582696, 1, 0.3960784, 0, 1,
-1.517638, -1.226886, -3.014868, 1, 0.4039216, 0, 1,
-1.513638, -0.3344123, -1.882272, 1, 0.4078431, 0, 1,
-1.511986, -1.71036, -2.162066, 1, 0.4156863, 0, 1,
-1.506679, 1.087242, -1.527391, 1, 0.4196078, 0, 1,
-1.483758, 1.490629, 0.482785, 1, 0.427451, 0, 1,
-1.468656, 0.305799, -2.598394, 1, 0.4313726, 0, 1,
-1.468507, -0.682035, -1.673275, 1, 0.4392157, 0, 1,
-1.462968, 0.29407, -1.725813, 1, 0.4431373, 0, 1,
-1.4551, -2.151845, -1.38599, 1, 0.4509804, 0, 1,
-1.44899, 0.6637278, -1.029837, 1, 0.454902, 0, 1,
-1.439718, 1.002621, -1.418265, 1, 0.4627451, 0, 1,
-1.432822, -0.1244305, -0.8804834, 1, 0.4666667, 0, 1,
-1.432434, -0.4656031, -3.314647, 1, 0.4745098, 0, 1,
-1.428367, 0.8740113, -1.906134, 1, 0.4784314, 0, 1,
-1.417278, 2.154932, 0.7523743, 1, 0.4862745, 0, 1,
-1.414357, 0.7228747, -0.7581918, 1, 0.4901961, 0, 1,
-1.404914, 0.7296084, -1.123427, 1, 0.4980392, 0, 1,
-1.402992, 0.02390443, -2.008447, 1, 0.5058824, 0, 1,
-1.39608, 1.904405, -0.1477168, 1, 0.509804, 0, 1,
-1.392598, -0.23759, -1.966043, 1, 0.5176471, 0, 1,
-1.381568, 0.3718612, -1.380505, 1, 0.5215687, 0, 1,
-1.379258, 0.3495783, -1.918301, 1, 0.5294118, 0, 1,
-1.378663, 0.3333597, -0.9648901, 1, 0.5333334, 0, 1,
-1.363523, -0.870885, -1.817427, 1, 0.5411765, 0, 1,
-1.361042, -0.2731849, -1.510288, 1, 0.5450981, 0, 1,
-1.360834, 0.8924645, -2.246989, 1, 0.5529412, 0, 1,
-1.357336, -1.077893, -3.822759, 1, 0.5568628, 0, 1,
-1.354554, 0.5391324, -0.5492768, 1, 0.5647059, 0, 1,
-1.353634, -0.6849013, -3.921138, 1, 0.5686275, 0, 1,
-1.346257, 0.04870826, -1.761795, 1, 0.5764706, 0, 1,
-1.339913, -1.636987, -2.831024, 1, 0.5803922, 0, 1,
-1.33902, 2.554471, 0.8230985, 1, 0.5882353, 0, 1,
-1.337282, -0.6340268, -1.279945, 1, 0.5921569, 0, 1,
-1.332543, -0.05420706, -1.573708, 1, 0.6, 0, 1,
-1.329237, 0.04843968, 0.09049218, 1, 0.6078432, 0, 1,
-1.320813, -0.2121365, -0.9236186, 1, 0.6117647, 0, 1,
-1.314619, -0.3474219, -0.900636, 1, 0.6196079, 0, 1,
-1.313266, 2.962221, 1.339752, 1, 0.6235294, 0, 1,
-1.310431, -0.1535825, -0.7553051, 1, 0.6313726, 0, 1,
-1.305122, -0.8672138, -3.107535, 1, 0.6352941, 0, 1,
-1.303663, 0.7176593, -2.043423, 1, 0.6431373, 0, 1,
-1.297913, -0.6877491, -0.7970407, 1, 0.6470588, 0, 1,
-1.294271, 0.06258246, -2.124756, 1, 0.654902, 0, 1,
-1.289819, -1.073979, -4.177709, 1, 0.6588235, 0, 1,
-1.288669, -0.2676783, -3.008207, 1, 0.6666667, 0, 1,
-1.288213, -1.864821, -1.225306, 1, 0.6705883, 0, 1,
-1.287523, 1.133697, -0.790938, 1, 0.6784314, 0, 1,
-1.286755, -1.103637, -1.86152, 1, 0.682353, 0, 1,
-1.2758, -2.079616, -3.788973, 1, 0.6901961, 0, 1,
-1.269972, 0.8826964, -0.3816211, 1, 0.6941177, 0, 1,
-1.261308, 0.7261054, -0.8063592, 1, 0.7019608, 0, 1,
-1.259378, 0.2952141, -1.800886, 1, 0.7098039, 0, 1,
-1.255015, 0.4863802, -2.834032, 1, 0.7137255, 0, 1,
-1.253261, -0.4849618, -1.700508, 1, 0.7215686, 0, 1,
-1.250273, -0.4038483, -2.679563, 1, 0.7254902, 0, 1,
-1.243968, -1.265953, -4.687828, 1, 0.7333333, 0, 1,
-1.237349, 0.5922655, -0.7686766, 1, 0.7372549, 0, 1,
-1.23562, -0.810187, -1.981637, 1, 0.7450981, 0, 1,
-1.220317, 0.1015069, -3.197275, 1, 0.7490196, 0, 1,
-1.218546, 0.8337313, -3.30945, 1, 0.7568628, 0, 1,
-1.212702, -0.3210436, -2.719721, 1, 0.7607843, 0, 1,
-1.211991, -0.58094, -1.682401, 1, 0.7686275, 0, 1,
-1.210735, 0.3206849, -0.3990498, 1, 0.772549, 0, 1,
-1.210485, 0.004606105, -0.878056, 1, 0.7803922, 0, 1,
-1.204411, 0.5325308, -2.801552, 1, 0.7843137, 0, 1,
-1.203076, -2.108171, -3.032483, 1, 0.7921569, 0, 1,
-1.199144, 2.468664, -1.188998, 1, 0.7960784, 0, 1,
-1.19895, 0.4101794, -2.515989, 1, 0.8039216, 0, 1,
-1.196605, 0.106948, -2.567874, 1, 0.8117647, 0, 1,
-1.170603, 0.1800612, 0.1729693, 1, 0.8156863, 0, 1,
-1.167808, 0.5275021, 0.4887219, 1, 0.8235294, 0, 1,
-1.166881, -1.431706, -3.206673, 1, 0.827451, 0, 1,
-1.165288, 0.1633891, -0.3073213, 1, 0.8352941, 0, 1,
-1.158924, 1.155084, -1.016053, 1, 0.8392157, 0, 1,
-1.148462, -1.879104, -3.625497, 1, 0.8470588, 0, 1,
-1.148223, -1.547073, -2.355491, 1, 0.8509804, 0, 1,
-1.147861, -1.002012, -1.348419, 1, 0.8588235, 0, 1,
-1.144648, -1.072722, -4.108875, 1, 0.8627451, 0, 1,
-1.14304, 0.5614182, -0.1310186, 1, 0.8705882, 0, 1,
-1.141002, 0.1463225, -0.6636725, 1, 0.8745098, 0, 1,
-1.124931, -1.611507, -1.326276, 1, 0.8823529, 0, 1,
-1.117785, 0.07269344, 0.01325629, 1, 0.8862745, 0, 1,
-1.116095, -0.7012948, -0.885808, 1, 0.8941177, 0, 1,
-1.11507, 0.3648391, -1.231962, 1, 0.8980392, 0, 1,
-1.114284, 0.8169628, 0.2104429, 1, 0.9058824, 0, 1,
-1.106685, 1.552163, -0.7009317, 1, 0.9137255, 0, 1,
-1.103209, 0.520259, -0.07852376, 1, 0.9176471, 0, 1,
-1.095288, -0.06460256, -1.414124, 1, 0.9254902, 0, 1,
-1.0851, 0.2483865, -1.256324, 1, 0.9294118, 0, 1,
-1.084712, 2.607704, 0.1022893, 1, 0.9372549, 0, 1,
-1.084009, -1.83904, -0.7308958, 1, 0.9411765, 0, 1,
-1.083455, 0.510825, 0.1724437, 1, 0.9490196, 0, 1,
-1.082353, 0.9063128, -0.2545468, 1, 0.9529412, 0, 1,
-1.075887, 0.003922848, -3.087551, 1, 0.9607843, 0, 1,
-1.072441, 0.7113968, -1.102397, 1, 0.9647059, 0, 1,
-1.072323, -0.2977205, -2.605293, 1, 0.972549, 0, 1,
-1.070631, -0.277245, -1.834883, 1, 0.9764706, 0, 1,
-1.066675, -0.6132585, -3.374222, 1, 0.9843137, 0, 1,
-1.062997, 2.441657, -2.039989, 1, 0.9882353, 0, 1,
-1.061065, -0.4147356, -1.099351, 1, 0.9960784, 0, 1,
-1.054237, 0.8358186, -1.908446, 0.9960784, 1, 0, 1,
-1.042224, -1.423505, -1.998465, 0.9921569, 1, 0, 1,
-1.041202, 0.8839834, -0.7351432, 0.9843137, 1, 0, 1,
-1.035135, 0.8302683, -0.1078535, 0.9803922, 1, 0, 1,
-1.029219, 0.894106, 0.2076022, 0.972549, 1, 0, 1,
-1.022755, -1.510943, -3.963921, 0.9686275, 1, 0, 1,
-1.018542, -2.25414, -2.822889, 0.9607843, 1, 0, 1,
-1.015794, 1.645317, -1.11078, 0.9568627, 1, 0, 1,
-1.007098, 0.4981886, -1.971835, 0.9490196, 1, 0, 1,
-1.00624, -0.01360907, 1.394734, 0.945098, 1, 0, 1,
-1.004183, -0.4807868, -0.9994804, 0.9372549, 1, 0, 1,
-1.002464, -0.5738769, -2.184895, 0.9333333, 1, 0, 1,
-0.9968436, 0.4079586, -0.9473476, 0.9254902, 1, 0, 1,
-0.9833933, 0.6790482, -0.110956, 0.9215686, 1, 0, 1,
-0.9810898, 0.4073596, -1.241701, 0.9137255, 1, 0, 1,
-0.9801396, -1.014689, -2.383951, 0.9098039, 1, 0, 1,
-0.9789736, -0.4492858, -3.988522, 0.9019608, 1, 0, 1,
-0.9725045, 0.2925075, -0.7140679, 0.8941177, 1, 0, 1,
-0.9694159, 1.194704, -0.9520086, 0.8901961, 1, 0, 1,
-0.9651467, 0.5418027, -0.871599, 0.8823529, 1, 0, 1,
-0.9637503, 0.7547801, -1.043937, 0.8784314, 1, 0, 1,
-0.9620211, 0.4272598, -1.982895, 0.8705882, 1, 0, 1,
-0.9579672, -0.7583982, -1.306142, 0.8666667, 1, 0, 1,
-0.9507698, -2.194925, -4.619508, 0.8588235, 1, 0, 1,
-0.9505138, 0.03474897, 0.1330737, 0.854902, 1, 0, 1,
-0.9503862, 0.6946081, -0.9847066, 0.8470588, 1, 0, 1,
-0.9478863, -1.281961, -0.6647341, 0.8431373, 1, 0, 1,
-0.9329081, 0.5649746, -1.683394, 0.8352941, 1, 0, 1,
-0.9317476, -0.7914641, -3.027151, 0.8313726, 1, 0, 1,
-0.9314491, 0.8768701, -1.473074, 0.8235294, 1, 0, 1,
-0.9300585, 1.603394, 1.336181, 0.8196079, 1, 0, 1,
-0.9271087, -0.04349337, -2.107929, 0.8117647, 1, 0, 1,
-0.9256011, 0.2436171, -1.823778, 0.8078431, 1, 0, 1,
-0.9239169, 0.7424927, -0.847497, 0.8, 1, 0, 1,
-0.92365, 0.7449005, -2.275036, 0.7921569, 1, 0, 1,
-0.9224904, -0.6238559, -2.328869, 0.7882353, 1, 0, 1,
-0.9057829, 0.7710724, 0.2443305, 0.7803922, 1, 0, 1,
-0.9027102, 1.182388, -0.5621362, 0.7764706, 1, 0, 1,
-0.8983037, 0.09925707, -1.332896, 0.7686275, 1, 0, 1,
-0.8975618, 0.9437616, -1.094163, 0.7647059, 1, 0, 1,
-0.8967917, -0.3209476, -1.922572, 0.7568628, 1, 0, 1,
-0.896529, -0.7505785, -1.943854, 0.7529412, 1, 0, 1,
-0.8948387, 0.06301001, -1.492168, 0.7450981, 1, 0, 1,
-0.8939158, -1.162701, -2.764575, 0.7411765, 1, 0, 1,
-0.8858782, 0.8662596, -0.6335365, 0.7333333, 1, 0, 1,
-0.8809127, 1.904968, -0.6637467, 0.7294118, 1, 0, 1,
-0.8795635, -0.4527834, -3.222916, 0.7215686, 1, 0, 1,
-0.8756898, -0.2094092, -0.1217974, 0.7176471, 1, 0, 1,
-0.8735516, -0.9185523, -1.634462, 0.7098039, 1, 0, 1,
-0.8728202, 0.07604496, -0.2641847, 0.7058824, 1, 0, 1,
-0.8715716, 0.06240688, -1.62776, 0.6980392, 1, 0, 1,
-0.8713698, -0.9823918, -2.911488, 0.6901961, 1, 0, 1,
-0.8713071, -0.5851773, -4.568486, 0.6862745, 1, 0, 1,
-0.8697081, -0.7948509, -2.170259, 0.6784314, 1, 0, 1,
-0.8670208, -0.9581957, -1.9326, 0.6745098, 1, 0, 1,
-0.8540995, 0.1695997, -1.847916, 0.6666667, 1, 0, 1,
-0.8485759, -0.3070901, -2.814325, 0.6627451, 1, 0, 1,
-0.8483707, -2.206389, -4.411077, 0.654902, 1, 0, 1,
-0.8313571, 0.406335, -0.9292819, 0.6509804, 1, 0, 1,
-0.8300181, -0.1958958, -0.9075297, 0.6431373, 1, 0, 1,
-0.8290848, -0.8726217, -1.244383, 0.6392157, 1, 0, 1,
-0.8275977, -0.1311013, -1.111711, 0.6313726, 1, 0, 1,
-0.8251967, -0.4062719, -2.343575, 0.627451, 1, 0, 1,
-0.8132298, -0.139388, -3.378671, 0.6196079, 1, 0, 1,
-0.7987852, 0.5556985, -0.8750267, 0.6156863, 1, 0, 1,
-0.7965703, -0.9185507, -1.291718, 0.6078432, 1, 0, 1,
-0.7946001, -2.488461, -3.464265, 0.6039216, 1, 0, 1,
-0.7931975, 0.4523166, -4.368314, 0.5960785, 1, 0, 1,
-0.7823234, 0.7914603, -1.477728, 0.5882353, 1, 0, 1,
-0.7747091, 0.8998059, -1.784877, 0.5843138, 1, 0, 1,
-0.7743065, -0.3190121, -1.679063, 0.5764706, 1, 0, 1,
-0.7734596, 1.727047, 0.7645612, 0.572549, 1, 0, 1,
-0.7698837, -0.06094628, -1.820961, 0.5647059, 1, 0, 1,
-0.7671903, 0.9209477, -1.147764, 0.5607843, 1, 0, 1,
-0.7646888, -0.6701718, -2.187497, 0.5529412, 1, 0, 1,
-0.764352, 0.08275053, -2.559762, 0.5490196, 1, 0, 1,
-0.7627463, -0.08074542, -0.4980869, 0.5411765, 1, 0, 1,
-0.7621748, -0.4109419, -1.175877, 0.5372549, 1, 0, 1,
-0.7487508, 0.3112693, -1.323876, 0.5294118, 1, 0, 1,
-0.7447156, -1.299785, -3.440385, 0.5254902, 1, 0, 1,
-0.7437436, 0.552318, -0.5468884, 0.5176471, 1, 0, 1,
-0.7435246, 1.840288, -0.1549841, 0.5137255, 1, 0, 1,
-0.7410814, -0.1641517, -2.085436, 0.5058824, 1, 0, 1,
-0.7349709, 0.8102802, 0.7374817, 0.5019608, 1, 0, 1,
-0.7293243, 1.740905, 1.480314, 0.4941176, 1, 0, 1,
-0.7291574, -0.9755511, -2.912204, 0.4862745, 1, 0, 1,
-0.7273365, 0.3505546, -0.852607, 0.4823529, 1, 0, 1,
-0.718873, 0.4060378, -1.540092, 0.4745098, 1, 0, 1,
-0.7175618, 0.949908, -0.9057885, 0.4705882, 1, 0, 1,
-0.7098839, -3.332265, -0.6739555, 0.4627451, 1, 0, 1,
-0.7079806, 0.4683925, -1.527827, 0.4588235, 1, 0, 1,
-0.7053976, 0.4183817, 0.3715331, 0.4509804, 1, 0, 1,
-0.7036043, -0.3385472, -2.406935, 0.4470588, 1, 0, 1,
-0.7034537, 0.8247915, -0.5326601, 0.4392157, 1, 0, 1,
-0.6971043, -0.6974796, -1.152366, 0.4352941, 1, 0, 1,
-0.6934989, -0.03223287, -1.019738, 0.427451, 1, 0, 1,
-0.6903811, -0.7679186, -1.802909, 0.4235294, 1, 0, 1,
-0.6816106, -0.1191986, -0.7143468, 0.4156863, 1, 0, 1,
-0.6802321, 1.93156, -1.271502, 0.4117647, 1, 0, 1,
-0.6753238, -0.8445553, -1.286245, 0.4039216, 1, 0, 1,
-0.673968, 1.827297, -1.807672, 0.3960784, 1, 0, 1,
-0.6731029, -0.9903274, -3.668922, 0.3921569, 1, 0, 1,
-0.6729329, -0.1062639, 0.04651283, 0.3843137, 1, 0, 1,
-0.6729015, 0.6889969, -0.001012144, 0.3803922, 1, 0, 1,
-0.6721322, -0.8942343, -2.393331, 0.372549, 1, 0, 1,
-0.6676037, -0.6543064, -3.558094, 0.3686275, 1, 0, 1,
-0.6637998, 0.4815048, -0.824783, 0.3607843, 1, 0, 1,
-0.6542538, 1.024745, 1.435994, 0.3568628, 1, 0, 1,
-0.6518169, 0.6600703, -2.877208, 0.3490196, 1, 0, 1,
-0.6350473, -0.1856967, -4.004933, 0.345098, 1, 0, 1,
-0.6342373, 0.4950286, -0.468042, 0.3372549, 1, 0, 1,
-0.6255103, 0.7581479, -1.786608, 0.3333333, 1, 0, 1,
-0.6232827, -0.9187005, -2.119244, 0.3254902, 1, 0, 1,
-0.6219255, 0.7762218, -0.6914408, 0.3215686, 1, 0, 1,
-0.6214716, -0.06119828, -0.4024632, 0.3137255, 1, 0, 1,
-0.6213812, -0.3825124, -3.006048, 0.3098039, 1, 0, 1,
-0.6201205, 0.2646646, -1.615028, 0.3019608, 1, 0, 1,
-0.6201073, -0.2546465, -2.907746, 0.2941177, 1, 0, 1,
-0.6189378, -1.28329, -1.719866, 0.2901961, 1, 0, 1,
-0.6146759, -1.270578, -2.100619, 0.282353, 1, 0, 1,
-0.6099253, -1.950138, -1.800932, 0.2784314, 1, 0, 1,
-0.6069543, -0.1863947, -1.06685, 0.2705882, 1, 0, 1,
-0.6050137, 0.2623815, -1.190578, 0.2666667, 1, 0, 1,
-0.5972884, 0.4168979, -1.182602, 0.2588235, 1, 0, 1,
-0.5938367, -0.194356, -1.60743, 0.254902, 1, 0, 1,
-0.5923712, 0.5001259, -0.1477259, 0.2470588, 1, 0, 1,
-0.5869552, -0.7597563, -3.433115, 0.2431373, 1, 0, 1,
-0.5865608, -1.033998, -1.981491, 0.2352941, 1, 0, 1,
-0.5774975, -1.026683, -2.510263, 0.2313726, 1, 0, 1,
-0.5735493, -1.012011, -3.271503, 0.2235294, 1, 0, 1,
-0.5662723, -0.361797, -0.7045429, 0.2196078, 1, 0, 1,
-0.561376, 0.1496689, -3.441482, 0.2117647, 1, 0, 1,
-0.5538157, -0.368872, -0.4541004, 0.2078431, 1, 0, 1,
-0.5504471, -0.1142132, -1.179278, 0.2, 1, 0, 1,
-0.5486513, -0.8679348, -0.788744, 0.1921569, 1, 0, 1,
-0.5475546, -0.1657153, -1.975646, 0.1882353, 1, 0, 1,
-0.5424628, 0.5147436, -1.950957, 0.1803922, 1, 0, 1,
-0.5366557, 0.655548, -0.1135753, 0.1764706, 1, 0, 1,
-0.5359856, -0.1798813, -1.85264, 0.1686275, 1, 0, 1,
-0.5321462, 0.8759938, -0.4296537, 0.1647059, 1, 0, 1,
-0.5303159, -1.297395, -2.724499, 0.1568628, 1, 0, 1,
-0.5198145, 0.5485206, -0.08378125, 0.1529412, 1, 0, 1,
-0.515963, -0.5962826, -1.099287, 0.145098, 1, 0, 1,
-0.5147942, -1.845152, -3.647624, 0.1411765, 1, 0, 1,
-0.5134851, -0.5480435, -3.83818, 0.1333333, 1, 0, 1,
-0.5101683, 1.564028, -1.174382, 0.1294118, 1, 0, 1,
-0.5091326, 0.009075209, -0.4994879, 0.1215686, 1, 0, 1,
-0.5089699, 1.98014, -1.581833, 0.1176471, 1, 0, 1,
-0.5070133, -0.03151048, -2.447127, 0.1098039, 1, 0, 1,
-0.5061962, -0.5417991, -1.34819, 0.1058824, 1, 0, 1,
-0.5019784, -0.5744721, -3.490324, 0.09803922, 1, 0, 1,
-0.499278, 0.01529862, -2.405491, 0.09019608, 1, 0, 1,
-0.4948359, 0.8505704, -1.14689, 0.08627451, 1, 0, 1,
-0.491588, 0.6523038, -1.150551, 0.07843138, 1, 0, 1,
-0.4901908, -0.2791951, -3.398224, 0.07450981, 1, 0, 1,
-0.4869351, 0.3378722, 0.1615466, 0.06666667, 1, 0, 1,
-0.4834122, 0.403712, -1.274566, 0.0627451, 1, 0, 1,
-0.4813883, -0.02939244, -1.484866, 0.05490196, 1, 0, 1,
-0.475142, 0.3476878, -1.318838, 0.05098039, 1, 0, 1,
-0.4721234, 1.139148, -0.4018207, 0.04313726, 1, 0, 1,
-0.4702361, 0.1793547, -0.6257762, 0.03921569, 1, 0, 1,
-0.4661682, 1.094605, -0.1049702, 0.03137255, 1, 0, 1,
-0.4593424, 2.08951, -1.979814, 0.02745098, 1, 0, 1,
-0.4580173, -1.044814, -4.217945, 0.01960784, 1, 0, 1,
-0.4548619, -0.1974905, -0.5655751, 0.01568628, 1, 0, 1,
-0.4544153, -0.3918259, -3.573205, 0.007843138, 1, 0, 1,
-0.4525545, 0.7736546, 0.02077951, 0.003921569, 1, 0, 1,
-0.4519385, 1.291409, 0.5807373, 0, 1, 0.003921569, 1,
-0.4502475, 0.2282158, -2.185034, 0, 1, 0.01176471, 1,
-0.4502393, -1.11626, -1.910099, 0, 1, 0.01568628, 1,
-0.4495365, -1.319981, -2.33098, 0, 1, 0.02352941, 1,
-0.4443536, -0.2254565, -1.583307, 0, 1, 0.02745098, 1,
-0.4430108, 0.01975516, -3.267152, 0, 1, 0.03529412, 1,
-0.4419581, -0.8563188, -2.673974, 0, 1, 0.03921569, 1,
-0.440383, 1.447788, 0.220565, 0, 1, 0.04705882, 1,
-0.4394739, -0.9097594, -3.368695, 0, 1, 0.05098039, 1,
-0.4394504, -1.263591, -4.682495, 0, 1, 0.05882353, 1,
-0.439326, -0.9817539, -3.429537, 0, 1, 0.0627451, 1,
-0.4354447, -1.261432, -2.659064, 0, 1, 0.07058824, 1,
-0.432184, 2.339222, 0.3954805, 0, 1, 0.07450981, 1,
-0.4303995, 0.7549468, 0.3200199, 0, 1, 0.08235294, 1,
-0.4289816, 0.06197134, -0.620131, 0, 1, 0.08627451, 1,
-0.4286577, -1.386461, -4.652556, 0, 1, 0.09411765, 1,
-0.4240235, -0.6833034, -3.0163, 0, 1, 0.1019608, 1,
-0.4235675, -0.200832, -5.352247, 0, 1, 0.1058824, 1,
-0.4189377, 0.3522053, 0.06986323, 0, 1, 0.1137255, 1,
-0.4138771, -1.880561, -1.218698, 0, 1, 0.1176471, 1,
-0.4009545, 0.7284585, -0.2131609, 0, 1, 0.1254902, 1,
-0.3969481, 7.625791e-05, -0.6119002, 0, 1, 0.1294118, 1,
-0.396428, -0.2052327, -0.9178802, 0, 1, 0.1372549, 1,
-0.3884109, -0.7451569, -3.759793, 0, 1, 0.1411765, 1,
-0.3853981, 0.0855689, -1.197533, 0, 1, 0.1490196, 1,
-0.3850313, -1.072981, -3.663351, 0, 1, 0.1529412, 1,
-0.3835307, -1.484483, -1.860957, 0, 1, 0.1607843, 1,
-0.3805279, -0.9855217, -3.209587, 0, 1, 0.1647059, 1,
-0.3775576, -0.5454622, -1.136197, 0, 1, 0.172549, 1,
-0.3775373, 1.399653, -0.349831, 0, 1, 0.1764706, 1,
-0.3748797, -1.16271, -2.687871, 0, 1, 0.1843137, 1,
-0.372085, -1.358077, -1.926749, 0, 1, 0.1882353, 1,
-0.3682283, 0.01539474, -1.639955, 0, 1, 0.1960784, 1,
-0.3675435, 0.9775034, -1.685266, 0, 1, 0.2039216, 1,
-0.3632277, 1.31035, 0.3508996, 0, 1, 0.2078431, 1,
-0.3623176, 0.4356688, 1.1171, 0, 1, 0.2156863, 1,
-0.3610201, -1.013853, -3.429118, 0, 1, 0.2196078, 1,
-0.3600774, -0.2015857, -1.456595, 0, 1, 0.227451, 1,
-0.3584779, 0.2696487, -0.8193631, 0, 1, 0.2313726, 1,
-0.3548469, 2.785372, -0.7765244, 0, 1, 0.2392157, 1,
-0.3542713, 0.1515701, -0.1851009, 0, 1, 0.2431373, 1,
-0.3530826, -1.641096, -3.861239, 0, 1, 0.2509804, 1,
-0.3497095, 0.3128354, -0.7586287, 0, 1, 0.254902, 1,
-0.3433529, -0.2546448, -0.7311437, 0, 1, 0.2627451, 1,
-0.3390822, -0.2159463, -3.453978, 0, 1, 0.2666667, 1,
-0.3371195, 0.03148116, -2.000715, 0, 1, 0.2745098, 1,
-0.3368833, -0.3022525, -1.637213, 0, 1, 0.2784314, 1,
-0.3358856, 0.450913, 0.09474534, 0, 1, 0.2862745, 1,
-0.3349142, -0.07764889, -1.982223, 0, 1, 0.2901961, 1,
-0.3325871, 1.449123, -0.596333, 0, 1, 0.2980392, 1,
-0.3259704, 1.368333, 0.9348239, 0, 1, 0.3058824, 1,
-0.3250735, -0.004798768, -1.241214, 0, 1, 0.3098039, 1,
-0.3202164, 0.5337858, -2.758293, 0, 1, 0.3176471, 1,
-0.3171337, 1.00625, 1.269722, 0, 1, 0.3215686, 1,
-0.3160428, -0.1713229, -2.481256, 0, 1, 0.3294118, 1,
-0.3135961, -0.4550538, -3.773336, 0, 1, 0.3333333, 1,
-0.3125918, -1.135867, -3.960873, 0, 1, 0.3411765, 1,
-0.3107921, 0.577108, -2.074479, 0, 1, 0.345098, 1,
-0.3102257, 0.788979, -0.5818923, 0, 1, 0.3529412, 1,
-0.3093218, 2.143558, 0.4041674, 0, 1, 0.3568628, 1,
-0.3009827, 0.6449175, -0.5343178, 0, 1, 0.3647059, 1,
-0.2971461, -0.05147403, -1.847453, 0, 1, 0.3686275, 1,
-0.2966472, -2.126488, -3.09654, 0, 1, 0.3764706, 1,
-0.295471, 0.3324338, 2.195882, 0, 1, 0.3803922, 1,
-0.2951773, -0.2057095, -0.3998938, 0, 1, 0.3882353, 1,
-0.2916875, 0.3773592, -1.109122, 0, 1, 0.3921569, 1,
-0.2814571, -1.081297, -2.872626, 0, 1, 0.4, 1,
-0.2804461, -0.6077576, -2.967847, 0, 1, 0.4078431, 1,
-0.2774287, 1.374035, 0.7403456, 0, 1, 0.4117647, 1,
-0.2768805, 0.7243798, 0.1754304, 0, 1, 0.4196078, 1,
-0.2718548, -1.311327, -2.734909, 0, 1, 0.4235294, 1,
-0.2706843, 0.4198393, -0.1801127, 0, 1, 0.4313726, 1,
-0.2664559, -0.4606544, -2.800249, 0, 1, 0.4352941, 1,
-0.26103, -0.1440968, -3.488304, 0, 1, 0.4431373, 1,
-0.2601473, 1.593801, 0.4347701, 0, 1, 0.4470588, 1,
-0.2554432, -0.187412, -1.552856, 0, 1, 0.454902, 1,
-0.2505622, 1.951983, -1.091121, 0, 1, 0.4588235, 1,
-0.246733, -2.892486, -4.335916, 0, 1, 0.4666667, 1,
-0.2463586, -0.5351127, -1.545513, 0, 1, 0.4705882, 1,
-0.245601, -0.07323724, -2.296696, 0, 1, 0.4784314, 1,
-0.2439263, 2.280086, 0.5348091, 0, 1, 0.4823529, 1,
-0.2423986, 0.6537755, -0.3511161, 0, 1, 0.4901961, 1,
-0.242132, 1.310965, -0.3711064, 0, 1, 0.4941176, 1,
-0.2366987, -0.8056102, -2.535499, 0, 1, 0.5019608, 1,
-0.2338352, 1.455085, 1.035822, 0, 1, 0.509804, 1,
-0.231377, 0.6759055, -0.4712065, 0, 1, 0.5137255, 1,
-0.2312777, 0.1970394, 0.2913578, 0, 1, 0.5215687, 1,
-0.2270856, 0.9537681, -1.22225, 0, 1, 0.5254902, 1,
-0.2252988, 1.14465, 0.5636756, 0, 1, 0.5333334, 1,
-0.2245024, 0.5420641, -1.386568, 0, 1, 0.5372549, 1,
-0.2243243, -0.940056, -3.294475, 0, 1, 0.5450981, 1,
-0.2200958, 0.777579, 0.8617887, 0, 1, 0.5490196, 1,
-0.220029, 0.4136175, -0.2487231, 0, 1, 0.5568628, 1,
-0.2094616, -0.5094298, -2.772071, 0, 1, 0.5607843, 1,
-0.2083469, 0.5276893, -1.132128, 0, 1, 0.5686275, 1,
-0.2039969, 0.5468085, -0.3413152, 0, 1, 0.572549, 1,
-0.2029604, -0.9121628, -3.012242, 0, 1, 0.5803922, 1,
-0.2007991, -1.396905, -3.919987, 0, 1, 0.5843138, 1,
-0.1977705, -0.1517552, -3.864332, 0, 1, 0.5921569, 1,
-0.1912251, -1.124, -3.918015, 0, 1, 0.5960785, 1,
-0.1904878, -0.6912463, -2.880535, 0, 1, 0.6039216, 1,
-0.1897998, -0.09539778, -2.169402, 0, 1, 0.6117647, 1,
-0.1874554, 0.01227634, -0.7849247, 0, 1, 0.6156863, 1,
-0.1850889, -0.6584694, -3.209285, 0, 1, 0.6235294, 1,
-0.1840544, -1.548199, -3.864995, 0, 1, 0.627451, 1,
-0.1836351, 1.187215, 0.01177389, 0, 1, 0.6352941, 1,
-0.1808737, -0.2792326, -2.938754, 0, 1, 0.6392157, 1,
-0.1796317, 1.57429, -0.4182889, 0, 1, 0.6470588, 1,
-0.1747493, 0.2665606, -0.2653972, 0, 1, 0.6509804, 1,
-0.1727211, -0.2754336, -4.963301, 0, 1, 0.6588235, 1,
-0.1685981, 1.587357, -0.3238058, 0, 1, 0.6627451, 1,
-0.1653099, 1.448532, -0.9664599, 0, 1, 0.6705883, 1,
-0.1625243, -0.6106216, -4.149743, 0, 1, 0.6745098, 1,
-0.1619465, -0.2918253, -2.854388, 0, 1, 0.682353, 1,
-0.1614914, -1.756948, -4.039763, 0, 1, 0.6862745, 1,
-0.1612017, 1.46867, 0.02610045, 0, 1, 0.6941177, 1,
-0.1585732, 1.382202, 3.036812, 0, 1, 0.7019608, 1,
-0.1485019, 1.707535, -0.2045219, 0, 1, 0.7058824, 1,
-0.1452946, 0.410979, -0.06423801, 0, 1, 0.7137255, 1,
-0.1447435, 0.1899168, -1.454326, 0, 1, 0.7176471, 1,
-0.1357915, -0.2365554, -2.914686, 0, 1, 0.7254902, 1,
-0.1356461, 0.101614, 0.3596938, 0, 1, 0.7294118, 1,
-0.130169, -0.2803473, -3.317477, 0, 1, 0.7372549, 1,
-0.1236045, 0.2453897, -1.344748, 0, 1, 0.7411765, 1,
-0.122376, 0.4561669, 1.086049, 0, 1, 0.7490196, 1,
-0.1209214, 0.6557278, 1.929407, 0, 1, 0.7529412, 1,
-0.1124919, 0.7973147, 0.5988808, 0, 1, 0.7607843, 1,
-0.1119221, -1.054093, -1.568262, 0, 1, 0.7647059, 1,
-0.1112722, 0.3968474, -0.6707473, 0, 1, 0.772549, 1,
-0.1073684, 0.2784528, -1.698333, 0, 1, 0.7764706, 1,
-0.1044154, -0.5696057, -2.680189, 0, 1, 0.7843137, 1,
-0.1013411, 0.8784346, 0.9384802, 0, 1, 0.7882353, 1,
-0.09879216, -0.7479554, -2.688318, 0, 1, 0.7960784, 1,
-0.09823773, -0.5474174, -4.149574, 0, 1, 0.8039216, 1,
-0.09735297, 0.1919855, 0.5131205, 0, 1, 0.8078431, 1,
-0.09208892, 1.824684, 0.9164779, 0, 1, 0.8156863, 1,
-0.09073703, -0.2982852, -3.370914, 0, 1, 0.8196079, 1,
-0.08093917, 0.8520965, 0.1717856, 0, 1, 0.827451, 1,
-0.08090508, 0.3069397, -0.5421934, 0, 1, 0.8313726, 1,
-0.08080236, 0.2915201, -0.63477, 0, 1, 0.8392157, 1,
-0.0744672, 1.210833, 0.08059945, 0, 1, 0.8431373, 1,
-0.06965367, -1.287561, -2.935151, 0, 1, 0.8509804, 1,
-0.06929272, 0.9709564, 0.9505552, 0, 1, 0.854902, 1,
-0.05816294, 0.6903866, -0.14225, 0, 1, 0.8627451, 1,
-0.05761023, 0.3424258, -0.271643, 0, 1, 0.8666667, 1,
-0.05595651, 0.4796744, 0.8564643, 0, 1, 0.8745098, 1,
-0.05289027, 0.755047, -0.2198604, 0, 1, 0.8784314, 1,
-0.05198204, 1.371372, 1.177141, 0, 1, 0.8862745, 1,
-0.04680961, 0.4898886, -0.4268536, 0, 1, 0.8901961, 1,
-0.04238047, -0.7554456, -2.445124, 0, 1, 0.8980392, 1,
-0.04210028, 0.7597127, 1.063997, 0, 1, 0.9058824, 1,
-0.04165923, 0.3042333, -1.372202, 0, 1, 0.9098039, 1,
-0.03696571, -0.7270165, -3.774331, 0, 1, 0.9176471, 1,
-0.03332537, 0.1197102, 0.1702778, 0, 1, 0.9215686, 1,
-0.03182901, 0.3097696, -0.5899739, 0, 1, 0.9294118, 1,
-0.03164752, 0.3758404, -1.308926, 0, 1, 0.9333333, 1,
-0.03152005, -2.072662, -3.521586, 0, 1, 0.9411765, 1,
-0.02892078, -0.5904181, -2.198925, 0, 1, 0.945098, 1,
-0.02113618, 0.0896321, -0.1839223, 0, 1, 0.9529412, 1,
-0.01911847, -0.2454753, -3.434873, 0, 1, 0.9568627, 1,
-0.01765145, 1.852307, 0.4736786, 0, 1, 0.9647059, 1,
-0.01641002, -1.096546, -2.53362, 0, 1, 0.9686275, 1,
-0.01432604, -0.1789476, -1.037067, 0, 1, 0.9764706, 1,
-0.01428339, 0.9782302, 0.07940838, 0, 1, 0.9803922, 1,
-0.009568824, 0.8142645, 0.002075784, 0, 1, 0.9882353, 1,
-0.008052329, -0.3963787, -3.549523, 0, 1, 0.9921569, 1,
-0.005021394, -1.01685, -3.690424, 0, 1, 1, 1,
-0.004266271, -0.8615085, -1.766902, 0, 0.9921569, 1, 1,
0.009121547, -1.823349, 3.174032, 0, 0.9882353, 1, 1,
0.01129908, 2.147303, -2.302265, 0, 0.9803922, 1, 1,
0.0119973, -0.497283, 2.533867, 0, 0.9764706, 1, 1,
0.0256213, 1.00186, 1.685611, 0, 0.9686275, 1, 1,
0.02599406, 0.1975691, -0.1519691, 0, 0.9647059, 1, 1,
0.02763442, 0.538581, 0.9848431, 0, 0.9568627, 1, 1,
0.02926735, 0.3660969, 0.6058292, 0, 0.9529412, 1, 1,
0.03138391, -2.265514, 2.406373, 0, 0.945098, 1, 1,
0.03174939, 0.06878486, 0.9345781, 0, 0.9411765, 1, 1,
0.03238492, 1.076947, -0.1839854, 0, 0.9333333, 1, 1,
0.03457658, 0.6585014, -0.3175785, 0, 0.9294118, 1, 1,
0.03695634, 0.7337927, -2.065175, 0, 0.9215686, 1, 1,
0.04169153, -0.09909751, 0.601028, 0, 0.9176471, 1, 1,
0.04170945, 0.09249482, 1.007507, 0, 0.9098039, 1, 1,
0.04278568, 0.662229, -0.9342682, 0, 0.9058824, 1, 1,
0.04437438, -0.06314019, 1.789899, 0, 0.8980392, 1, 1,
0.04641695, -2.428496, 3.966856, 0, 0.8901961, 1, 1,
0.04762943, 0.5469204, -0.9930473, 0, 0.8862745, 1, 1,
0.05170463, 0.8532795, 0.5027187, 0, 0.8784314, 1, 1,
0.05540964, -1.38241, 2.293339, 0, 0.8745098, 1, 1,
0.05844399, -0.5719365, 2.37758, 0, 0.8666667, 1, 1,
0.05998948, 0.7708772, 0.00724798, 0, 0.8627451, 1, 1,
0.06127102, 0.95592, -1.235255, 0, 0.854902, 1, 1,
0.06520291, -0.8559543, 2.125677, 0, 0.8509804, 1, 1,
0.06556164, 1.68984, 0.8660185, 0, 0.8431373, 1, 1,
0.06612267, 0.8459585, 0.2602901, 0, 0.8392157, 1, 1,
0.06653582, -1.088657, 4.768577, 0, 0.8313726, 1, 1,
0.06856736, 1.011781, -0.2883175, 0, 0.827451, 1, 1,
0.06873999, 0.2693864, 2.558608, 0, 0.8196079, 1, 1,
0.07141948, 1.135408, -0.7469058, 0, 0.8156863, 1, 1,
0.07432164, -0.2262819, 1.421867, 0, 0.8078431, 1, 1,
0.07716018, -0.9452865, 3.60652, 0, 0.8039216, 1, 1,
0.08169474, 2.284305, 0.4134142, 0, 0.7960784, 1, 1,
0.08173044, 1.890754, -0.5942189, 0, 0.7882353, 1, 1,
0.08444792, -0.2380145, 0.251175, 0, 0.7843137, 1, 1,
0.08635605, 1.170456, 1.108414, 0, 0.7764706, 1, 1,
0.08954041, -0.2596326, 1.823241, 0, 0.772549, 1, 1,
0.09000635, 0.9301448, 0.9418923, 0, 0.7647059, 1, 1,
0.09002759, -0.09224191, 3.080585, 0, 0.7607843, 1, 1,
0.09370076, -1.312804, 3.194593, 0, 0.7529412, 1, 1,
0.09419794, -0.690945, 2.396228, 0, 0.7490196, 1, 1,
0.09485402, -0.1539883, 4.612106, 0, 0.7411765, 1, 1,
0.09583813, 0.1388652, 0.8375888, 0, 0.7372549, 1, 1,
0.09912051, 1.935413, -1.072376, 0, 0.7294118, 1, 1,
0.09998196, 0.2459197, -0.1746629, 0, 0.7254902, 1, 1,
0.1107027, -1.795684, 2.031854, 0, 0.7176471, 1, 1,
0.1121577, 0.5168465, -0.9336125, 0, 0.7137255, 1, 1,
0.1137085, 0.29207, 3.152828, 0, 0.7058824, 1, 1,
0.1143031, -0.2524497, 2.453627, 0, 0.6980392, 1, 1,
0.1158181, -0.7762001, 2.193413, 0, 0.6941177, 1, 1,
0.1164581, -0.9895855, 2.78064, 0, 0.6862745, 1, 1,
0.128783, 0.409421, -1.123961, 0, 0.682353, 1, 1,
0.1313107, -0.1595311, 0.9327995, 0, 0.6745098, 1, 1,
0.140202, 0.3107291, -0.3394169, 0, 0.6705883, 1, 1,
0.1480896, -1.490065, 2.953885, 0, 0.6627451, 1, 1,
0.1492267, 1.436512, -0.6322614, 0, 0.6588235, 1, 1,
0.1503258, -1.425343, 3.318911, 0, 0.6509804, 1, 1,
0.1504472, -1.58587, 3.276552, 0, 0.6470588, 1, 1,
0.1504683, 0.1238348, 1.860397, 0, 0.6392157, 1, 1,
0.151815, 0.5238183, 2.181035, 0, 0.6352941, 1, 1,
0.1525223, 0.7434803, 2.362964, 0, 0.627451, 1, 1,
0.1584801, -0.6344948, 2.28825, 0, 0.6235294, 1, 1,
0.1605776, -0.3657031, 2.266035, 0, 0.6156863, 1, 1,
0.162848, 0.4989555, -0.2589816, 0, 0.6117647, 1, 1,
0.1660332, 0.5640495, 0.1818889, 0, 0.6039216, 1, 1,
0.1693013, 0.1040729, 0.2401142, 0, 0.5960785, 1, 1,
0.1705151, -0.3926367, 2.74147, 0, 0.5921569, 1, 1,
0.170974, 0.7731919, -0.1470723, 0, 0.5843138, 1, 1,
0.1715236, -0.3030672, 1.741227, 0, 0.5803922, 1, 1,
0.1716536, -1.967797, 3.840744, 0, 0.572549, 1, 1,
0.1730561, -0.4242236, 4.333157, 0, 0.5686275, 1, 1,
0.1843354, 0.6540444, 0.590124, 0, 0.5607843, 1, 1,
0.1878901, -0.8526854, 3.336709, 0, 0.5568628, 1, 1,
0.1913246, 0.4988435, 2.07585, 0, 0.5490196, 1, 1,
0.1951856, 0.05717589, 0.8911036, 0, 0.5450981, 1, 1,
0.1968944, 0.74849, 1.771233, 0, 0.5372549, 1, 1,
0.1970706, -0.3285246, 2.359693, 0, 0.5333334, 1, 1,
0.2017553, 1.534376, -0.3669643, 0, 0.5254902, 1, 1,
0.2018214, 0.8825252, 0.1785333, 0, 0.5215687, 1, 1,
0.2020051, -2.039465, 3.985721, 0, 0.5137255, 1, 1,
0.2067881, 0.9297263, -0.3607007, 0, 0.509804, 1, 1,
0.207967, 0.4240751, -0.2330297, 0, 0.5019608, 1, 1,
0.2101782, 1.2903, 0.145502, 0, 0.4941176, 1, 1,
0.2101803, 1.225812, 0.6743983, 0, 0.4901961, 1, 1,
0.2146345, -0.2777768, 2.248013, 0, 0.4823529, 1, 1,
0.2227316, -0.9432598, 4.021109, 0, 0.4784314, 1, 1,
0.2245793, 0.1271908, 1.730986, 0, 0.4705882, 1, 1,
0.225453, 1.893767, -0.2525256, 0, 0.4666667, 1, 1,
0.2271013, -0.3902385, 3.204935, 0, 0.4588235, 1, 1,
0.2296082, 0.1296186, -0.8191343, 0, 0.454902, 1, 1,
0.2319922, -1.426171, 3.475973, 0, 0.4470588, 1, 1,
0.2319959, 0.9683388, 2.169436, 0, 0.4431373, 1, 1,
0.2348368, 0.6181798, -0.4737875, 0, 0.4352941, 1, 1,
0.2350252, -1.346511, 3.419526, 0, 0.4313726, 1, 1,
0.2362364, 0.7544921, 1.147884, 0, 0.4235294, 1, 1,
0.2383998, 1.146039, -1.34242, 0, 0.4196078, 1, 1,
0.2439517, -0.7485501, 1.319346, 0, 0.4117647, 1, 1,
0.2487621, 1.212391, -0.4025054, 0, 0.4078431, 1, 1,
0.2551314, 1.058701, -0.2861248, 0, 0.4, 1, 1,
0.2553482, -0.3963068, 2.83611, 0, 0.3921569, 1, 1,
0.2554041, 0.7754502, 0.8532975, 0, 0.3882353, 1, 1,
0.257045, -0.9535726, 3.578596, 0, 0.3803922, 1, 1,
0.2607779, -0.722749, 4.014658, 0, 0.3764706, 1, 1,
0.26293, -1.14993, 2.497626, 0, 0.3686275, 1, 1,
0.2734821, 0.8229358, 1.094199, 0, 0.3647059, 1, 1,
0.2753448, -0.005723028, 2.192882, 0, 0.3568628, 1, 1,
0.2849278, -1.116406, 3.669688, 0, 0.3529412, 1, 1,
0.2867266, 0.2204876, 1.179426, 0, 0.345098, 1, 1,
0.289479, 1.764472, 0.2476385, 0, 0.3411765, 1, 1,
0.292132, -0.007733213, 0.9385694, 0, 0.3333333, 1, 1,
0.2971315, -0.1025352, 2.111287, 0, 0.3294118, 1, 1,
0.2988763, 0.8563185, 2.317901, 0, 0.3215686, 1, 1,
0.3039435, 0.3069117, 0.5914887, 0, 0.3176471, 1, 1,
0.3068226, 0.08941226, 0.9110088, 0, 0.3098039, 1, 1,
0.3081912, -1.243171, 3.492428, 0, 0.3058824, 1, 1,
0.3107692, 1.844159, 1.152329, 0, 0.2980392, 1, 1,
0.3139206, -0.06356601, 3.88901, 0, 0.2901961, 1, 1,
0.3171982, 0.5554971, -0.1953115, 0, 0.2862745, 1, 1,
0.3204335, -0.270969, 2.711566, 0, 0.2784314, 1, 1,
0.3223744, 1.579881, 0.5963084, 0, 0.2745098, 1, 1,
0.3256412, 0.5823959, 0.1056163, 0, 0.2666667, 1, 1,
0.3269837, 1.329069, -0.2957753, 0, 0.2627451, 1, 1,
0.3298284, -1.521571, 2.838756, 0, 0.254902, 1, 1,
0.3309668, -1.085381, 3.010979, 0, 0.2509804, 1, 1,
0.3316035, -0.51515, 1.306681, 0, 0.2431373, 1, 1,
0.3339067, -0.3233919, 1.479831, 0, 0.2392157, 1, 1,
0.3341233, -1.982119, 3.210815, 0, 0.2313726, 1, 1,
0.3370128, -1.228816, 2.14215, 0, 0.227451, 1, 1,
0.338325, -1.084737, 3.470246, 0, 0.2196078, 1, 1,
0.3428327, -0.7140388, 2.232264, 0, 0.2156863, 1, 1,
0.3441533, 0.8233959, 0.9730871, 0, 0.2078431, 1, 1,
0.3467358, 1.130926, 0.3197042, 0, 0.2039216, 1, 1,
0.3477476, 0.5930873, 1.298856, 0, 0.1960784, 1, 1,
0.3506916, -0.03410158, 1.452739, 0, 0.1882353, 1, 1,
0.3512053, 0.7731532, -0.812192, 0, 0.1843137, 1, 1,
0.354041, 0.4989725, -0.9396019, 0, 0.1764706, 1, 1,
0.3555806, -0.5771503, 2.387425, 0, 0.172549, 1, 1,
0.3580158, 2.021007, 2.054273, 0, 0.1647059, 1, 1,
0.3604163, -0.4588363, 2.941143, 0, 0.1607843, 1, 1,
0.3608702, -3.235761, 3.839387, 0, 0.1529412, 1, 1,
0.3631947, -0.9622902, 0.1963158, 0, 0.1490196, 1, 1,
0.3688926, -0.969576, 1.432409, 0, 0.1411765, 1, 1,
0.3726737, -0.3382123, 0.5500857, 0, 0.1372549, 1, 1,
0.3748348, 0.4579798, 1.879152, 0, 0.1294118, 1, 1,
0.3754902, -1.300406, 2.512129, 0, 0.1254902, 1, 1,
0.3783038, 0.2836798, 0.6622506, 0, 0.1176471, 1, 1,
0.3791942, -0.4887804, 2.237857, 0, 0.1137255, 1, 1,
0.3847131, 1.552638, 0.7394577, 0, 0.1058824, 1, 1,
0.3871897, 0.6796443, -0.0952228, 0, 0.09803922, 1, 1,
0.3910241, -1.689126, 3.508146, 0, 0.09411765, 1, 1,
0.400912, 1.085466, 0.8184541, 0, 0.08627451, 1, 1,
0.4085462, 2.275225, -1.864716, 0, 0.08235294, 1, 1,
0.4103434, 0.03322935, 3.099809, 0, 0.07450981, 1, 1,
0.4140638, 0.02071924, 2.100386, 0, 0.07058824, 1, 1,
0.4151864, -0.3918855, 0.5773892, 0, 0.0627451, 1, 1,
0.4156298, 0.4483515, 0.3287002, 0, 0.05882353, 1, 1,
0.417624, -1.127314, 3.211043, 0, 0.05098039, 1, 1,
0.4295382, 0.9183992, 0.2681729, 0, 0.04705882, 1, 1,
0.43132, 0.593812, 0.6693386, 0, 0.03921569, 1, 1,
0.4358137, -0.4646608, 2.629578, 0, 0.03529412, 1, 1,
0.436188, -0.3002249, 3.242352, 0, 0.02745098, 1, 1,
0.4386943, 0.2108699, 0.7574812, 0, 0.02352941, 1, 1,
0.4392321, 1.174336, 1.194309, 0, 0.01568628, 1, 1,
0.4411196, -1.390972, 2.889326, 0, 0.01176471, 1, 1,
0.4413678, 1.0988, 0.1147492, 0, 0.003921569, 1, 1,
0.4475975, -0.3568839, 2.032472, 0.003921569, 0, 1, 1,
0.4578163, -0.5109521, 4.063375, 0.007843138, 0, 1, 1,
0.457885, 1.190788, -2.127596, 0.01568628, 0, 1, 1,
0.4623589, -0.9661362, 2.913383, 0.01960784, 0, 1, 1,
0.4641396, -1.830684, 2.887526, 0.02745098, 0, 1, 1,
0.4715883, -0.5497176, 1.967298, 0.03137255, 0, 1, 1,
0.48641, -1.524538, 4.090053, 0.03921569, 0, 1, 1,
0.4868505, -0.9199494, 4.52241, 0.04313726, 0, 1, 1,
0.4916712, 0.196408, 0.6240323, 0.05098039, 0, 1, 1,
0.4941977, 0.5484647, 1.387087, 0.05490196, 0, 1, 1,
0.4943528, 0.36034, -1.110698, 0.0627451, 0, 1, 1,
0.4964306, -1.821457, 2.02593, 0.06666667, 0, 1, 1,
0.4974739, -0.2566658, 1.862251, 0.07450981, 0, 1, 1,
0.4976267, -0.09437856, 2.542701, 0.07843138, 0, 1, 1,
0.4999982, 0.3124817, 2.178706, 0.08627451, 0, 1, 1,
0.5047823, 0.4065477, 0.6921369, 0.09019608, 0, 1, 1,
0.5101897, -0.019665, 2.074936, 0.09803922, 0, 1, 1,
0.5112649, -0.01167192, 2.367186, 0.1058824, 0, 1, 1,
0.5157611, 0.4148397, -0.1489651, 0.1098039, 0, 1, 1,
0.5160762, -0.2534777, 3.670237, 0.1176471, 0, 1, 1,
0.5162805, -0.533367, 1.748622, 0.1215686, 0, 1, 1,
0.5164705, -1.69893, 4.110275, 0.1294118, 0, 1, 1,
0.516483, 1.100013, -1.881551, 0.1333333, 0, 1, 1,
0.5213077, 1.123938, 0.6214257, 0.1411765, 0, 1, 1,
0.5227624, -0.3183279, 2.0468, 0.145098, 0, 1, 1,
0.5245681, 1.632189, -1.231964, 0.1529412, 0, 1, 1,
0.532361, -0.4468879, 2.449581, 0.1568628, 0, 1, 1,
0.5401556, -0.6903532, 3.091521, 0.1647059, 0, 1, 1,
0.5424349, -0.5388553, 3.730337, 0.1686275, 0, 1, 1,
0.5441518, 0.8347676, 1.950831, 0.1764706, 0, 1, 1,
0.5494823, -1.03917, 2.317473, 0.1803922, 0, 1, 1,
0.5523823, -0.7178624, 2.866119, 0.1882353, 0, 1, 1,
0.554378, 1.395247, 0.1702695, 0.1921569, 0, 1, 1,
0.5632027, -0.896472, 2.706582, 0.2, 0, 1, 1,
0.5657225, -1.006595, 2.818175, 0.2078431, 0, 1, 1,
0.5693411, 0.2606289, 1.970539, 0.2117647, 0, 1, 1,
0.5763534, -0.7588421, 2.414925, 0.2196078, 0, 1, 1,
0.5796782, 0.1609098, 1.538455, 0.2235294, 0, 1, 1,
0.5803568, -1.951399, 3.58758, 0.2313726, 0, 1, 1,
0.5815821, -0.3351559, 0.8240684, 0.2352941, 0, 1, 1,
0.5823439, 0.5053678, 1.466417, 0.2431373, 0, 1, 1,
0.5853095, 0.648711, 1.372555, 0.2470588, 0, 1, 1,
0.5889834, 0.5297537, 1.090744, 0.254902, 0, 1, 1,
0.5954628, -1.526531, 2.137442, 0.2588235, 0, 1, 1,
0.5965479, 0.4484813, 2.564108, 0.2666667, 0, 1, 1,
0.5976205, 1.477656, 0.8918161, 0.2705882, 0, 1, 1,
0.5976567, -0.2609038, 2.54626, 0.2784314, 0, 1, 1,
0.6052732, 1.839627, 0.5925574, 0.282353, 0, 1, 1,
0.6064707, 0.1192399, 1.407892, 0.2901961, 0, 1, 1,
0.6105462, -0.6822708, 4.135029, 0.2941177, 0, 1, 1,
0.6157985, 0.2803783, 2.077734, 0.3019608, 0, 1, 1,
0.618937, -1.414672, 2.957265, 0.3098039, 0, 1, 1,
0.6228763, -0.2181221, 1.062043, 0.3137255, 0, 1, 1,
0.6265954, 0.267215, 2.365183, 0.3215686, 0, 1, 1,
0.627157, -1.789756, 1.706346, 0.3254902, 0, 1, 1,
0.6295117, -0.6632995, 2.48262, 0.3333333, 0, 1, 1,
0.6300031, 0.1474118, 2.277873, 0.3372549, 0, 1, 1,
0.630439, -0.01753132, 2.676135, 0.345098, 0, 1, 1,
0.631178, 1.21316, -0.2678737, 0.3490196, 0, 1, 1,
0.6339347, 2.398684, 0.03414439, 0.3568628, 0, 1, 1,
0.6350583, 1.712151, 2.5817, 0.3607843, 0, 1, 1,
0.6356457, 1.025222, 0.2175082, 0.3686275, 0, 1, 1,
0.6373177, -0.1779756, 2.079128, 0.372549, 0, 1, 1,
0.6399639, 0.703238, 1.71298, 0.3803922, 0, 1, 1,
0.6440632, 0.3337221, 2.061259, 0.3843137, 0, 1, 1,
0.6473309, -0.3177271, 1.710493, 0.3921569, 0, 1, 1,
0.6515008, -0.8307522, 2.64869, 0.3960784, 0, 1, 1,
0.6626747, -0.5434933, 1.152394, 0.4039216, 0, 1, 1,
0.6628072, 0.3033349, -1.66968, 0.4117647, 0, 1, 1,
0.6692109, 0.7650849, 0.865787, 0.4156863, 0, 1, 1,
0.6798099, -0.1606606, 2.548732, 0.4235294, 0, 1, 1,
0.6854007, 1.299132, 1.110523, 0.427451, 0, 1, 1,
0.6870477, 0.8629289, 1.121344, 0.4352941, 0, 1, 1,
0.6873164, -1.645567, 2.189362, 0.4392157, 0, 1, 1,
0.6877227, 0.2993364, 1.327316, 0.4470588, 0, 1, 1,
0.6913661, -2.537686, 3.46346, 0.4509804, 0, 1, 1,
0.6939986, -0.8080876, 4.327772, 0.4588235, 0, 1, 1,
0.7011848, -0.6581675, 3.493782, 0.4627451, 0, 1, 1,
0.7030719, 0.2744729, 1.345519, 0.4705882, 0, 1, 1,
0.7049413, -0.02594666, -1.002374, 0.4745098, 0, 1, 1,
0.7184322, 0.3945702, 0.8709795, 0.4823529, 0, 1, 1,
0.7212951, -1.067682, 0.1553055, 0.4862745, 0, 1, 1,
0.7220301, 0.5017975, -0.531519, 0.4941176, 0, 1, 1,
0.7257978, -0.3583685, 3.431949, 0.5019608, 0, 1, 1,
0.7338398, -1.339617, 1.935671, 0.5058824, 0, 1, 1,
0.7432736, 1.22089, -0.7051994, 0.5137255, 0, 1, 1,
0.7453806, 0.5474472, 1.661379, 0.5176471, 0, 1, 1,
0.7461727, 1.213656, 0.9115952, 0.5254902, 0, 1, 1,
0.7500484, -0.9990196, 3.727799, 0.5294118, 0, 1, 1,
0.7509411, -0.130177, 2.126363, 0.5372549, 0, 1, 1,
0.7513385, -0.5845003, 2.270377, 0.5411765, 0, 1, 1,
0.7522197, -0.3240774, 2.797866, 0.5490196, 0, 1, 1,
0.7556854, 0.23632, 2.948718, 0.5529412, 0, 1, 1,
0.758685, 0.3913244, 1.05927, 0.5607843, 0, 1, 1,
0.7648512, 0.07458942, 2.200794, 0.5647059, 0, 1, 1,
0.7711777, -0.3802747, 0.9755221, 0.572549, 0, 1, 1,
0.7731205, 1.39538, -0.1351562, 0.5764706, 0, 1, 1,
0.7741839, -0.3070514, 1.765867, 0.5843138, 0, 1, 1,
0.7794382, 0.2223958, 1.580628, 0.5882353, 0, 1, 1,
0.7818039, -0.5271615, 3.753226, 0.5960785, 0, 1, 1,
0.8098462, -1.055168, 1.413833, 0.6039216, 0, 1, 1,
0.8110759, 0.0156431, 2.002181, 0.6078432, 0, 1, 1,
0.8136376, 0.2355207, -0.5771119, 0.6156863, 0, 1, 1,
0.825906, 1.595135, -0.2684763, 0.6196079, 0, 1, 1,
0.828239, -1.250611, 3.246109, 0.627451, 0, 1, 1,
0.8390495, -0.5675569, 1.565526, 0.6313726, 0, 1, 1,
0.849984, -0.3662499, 2.938636, 0.6392157, 0, 1, 1,
0.8520392, 1.03101, -0.1133303, 0.6431373, 0, 1, 1,
0.855385, 1.569624, -0.0541359, 0.6509804, 0, 1, 1,
0.8597686, 1.528977, 1.191133, 0.654902, 0, 1, 1,
0.8623222, 0.2444934, 0.1626664, 0.6627451, 0, 1, 1,
0.8637268, 0.08380625, 0.7433973, 0.6666667, 0, 1, 1,
0.870446, 0.5340272, -1.36596, 0.6745098, 0, 1, 1,
0.8716277, -0.1733458, 4.841274, 0.6784314, 0, 1, 1,
0.8735062, -1.179937, 3.296657, 0.6862745, 0, 1, 1,
0.8771685, 0.5466153, 0.5421036, 0.6901961, 0, 1, 1,
0.8795719, -0.7974531, 3.426044, 0.6980392, 0, 1, 1,
0.8800766, -0.1647537, 1.241274, 0.7058824, 0, 1, 1,
0.8804055, 0.6379362, 0.3262203, 0.7098039, 0, 1, 1,
0.8813862, -0.9007965, 3.295417, 0.7176471, 0, 1, 1,
0.886558, -0.6527248, 2.889799, 0.7215686, 0, 1, 1,
0.8870154, -0.3113356, 0.9624538, 0.7294118, 0, 1, 1,
0.8884392, 0.2792, 0.3154836, 0.7333333, 0, 1, 1,
0.8899415, -1.079305, 3.403205, 0.7411765, 0, 1, 1,
0.8944731, 0.05302094, 1.72406, 0.7450981, 0, 1, 1,
0.8988261, -1.21239, 1.507955, 0.7529412, 0, 1, 1,
0.8991429, -2.677804, 2.427841, 0.7568628, 0, 1, 1,
0.9065741, -0.8321061, 2.774203, 0.7647059, 0, 1, 1,
0.9112065, -1.282447, 2.192905, 0.7686275, 0, 1, 1,
0.9153382, -0.3438451, 0.6297036, 0.7764706, 0, 1, 1,
0.9156535, 0.1355966, 2.433518, 0.7803922, 0, 1, 1,
0.9172223, -1.785007, 1.392769, 0.7882353, 0, 1, 1,
0.9217397, 0.4431293, 1.02745, 0.7921569, 0, 1, 1,
0.930046, 0.01105238, 1.163465, 0.8, 0, 1, 1,
0.9305828, -1.167285, -1.033473, 0.8078431, 0, 1, 1,
0.9323761, -0.549795, 1.681265, 0.8117647, 0, 1, 1,
0.9358481, 0.8499846, 0.1290996, 0.8196079, 0, 1, 1,
0.9413706, -1.248332, -0.6240036, 0.8235294, 0, 1, 1,
0.9417965, 0.8829328, 0.5798089, 0.8313726, 0, 1, 1,
0.9516762, -2.192057, 2.770443, 0.8352941, 0, 1, 1,
0.9567116, -0.02933958, 1.639889, 0.8431373, 0, 1, 1,
0.9574271, 1.206506, 0.5096096, 0.8470588, 0, 1, 1,
0.95994, -1.056429, 1.26972, 0.854902, 0, 1, 1,
0.9622099, 0.4700607, 0.8309807, 0.8588235, 0, 1, 1,
0.9624983, 0.4628311, 0.2947149, 0.8666667, 0, 1, 1,
0.964441, -0.2499153, 4.75431, 0.8705882, 0, 1, 1,
0.9645888, -0.7038069, 3.62717, 0.8784314, 0, 1, 1,
0.9676207, -0.06627606, 1.739387, 0.8823529, 0, 1, 1,
0.968281, -1.292702, 3.26399, 0.8901961, 0, 1, 1,
0.9797296, -0.1918546, 1.095536, 0.8941177, 0, 1, 1,
0.9873629, -0.008837963, 1.54989, 0.9019608, 0, 1, 1,
0.9902465, 1.079896, 0.9189295, 0.9098039, 0, 1, 1,
0.9912053, 0.9348744, 1.138019, 0.9137255, 0, 1, 1,
0.9934804, -0.7871822, 1.96783, 0.9215686, 0, 1, 1,
0.9970221, -0.9692441, 1.063185, 0.9254902, 0, 1, 1,
1.00256, 1.249271, 2.280926, 0.9333333, 0, 1, 1,
1.002904, -0.8175556, 2.262975, 0.9372549, 0, 1, 1,
1.005412, 0.4412606, 2.336948, 0.945098, 0, 1, 1,
1.008858, 1.139138, 1.671646, 0.9490196, 0, 1, 1,
1.011007, 1.31343, 2.916157, 0.9568627, 0, 1, 1,
1.015467, 0.3788845, 2.192118, 0.9607843, 0, 1, 1,
1.017847, -1.171577, 3.857689, 0.9686275, 0, 1, 1,
1.019172, 0.9415396, 1.742219, 0.972549, 0, 1, 1,
1.019416, 0.315251, 1.81625, 0.9803922, 0, 1, 1,
1.028015, 1.238112, 1.269326, 0.9843137, 0, 1, 1,
1.030948, -0.7944779, 3.189934, 0.9921569, 0, 1, 1,
1.031732, 0.6319472, 1.80343, 0.9960784, 0, 1, 1,
1.03417, 0.3871778, -0.3062303, 1, 0, 0.9960784, 1,
1.036926, 0.3868943, 1.542524, 1, 0, 0.9882353, 1,
1.037898, 0.5299432, -1.095923, 1, 0, 0.9843137, 1,
1.042437, -0.6430956, 1.907433, 1, 0, 0.9764706, 1,
1.04444, 0.1266843, 1.863703, 1, 0, 0.972549, 1,
1.044704, -0.5736813, 2.598179, 1, 0, 0.9647059, 1,
1.049813, -2.519805, 2.604706, 1, 0, 0.9607843, 1,
1.051448, -0.5556167, 3.21596, 1, 0, 0.9529412, 1,
1.056308, -0.2393742, 0.9689884, 1, 0, 0.9490196, 1,
1.063465, 0.4308175, 1.474258, 1, 0, 0.9411765, 1,
1.071644, -1.111866, 3.136987, 1, 0, 0.9372549, 1,
1.073331, -2.601176, 3.011685, 1, 0, 0.9294118, 1,
1.076373, 0.05063577, 0.4697967, 1, 0, 0.9254902, 1,
1.076721, -0.4516521, 1.553144, 1, 0, 0.9176471, 1,
1.093003, 1.507469, 1.184874, 1, 0, 0.9137255, 1,
1.095518, -0.7154507, 0.1857797, 1, 0, 0.9058824, 1,
1.099184, 0.6430597, 0.004395131, 1, 0, 0.9019608, 1,
1.100542, 0.7852883, 0.6831096, 1, 0, 0.8941177, 1,
1.110003, 0.5185643, 3.042668, 1, 0, 0.8862745, 1,
1.11165, -1.165075, 2.664812, 1, 0, 0.8823529, 1,
1.125309, -1.928555, 3.301065, 1, 0, 0.8745098, 1,
1.129292, -0.7074164, 2.493507, 1, 0, 0.8705882, 1,
1.133158, 1.028978, 0.1605046, 1, 0, 0.8627451, 1,
1.138424, -0.4342701, 1.445098, 1, 0, 0.8588235, 1,
1.142197, 0.4988881, 3.347541, 1, 0, 0.8509804, 1,
1.142993, -0.08647348, 2.754424, 1, 0, 0.8470588, 1,
1.153105, 1.838243, 0.2219951, 1, 0, 0.8392157, 1,
1.161305, 0.3219725, 1.545205, 1, 0, 0.8352941, 1,
1.164828, -0.4744981, 2.11171, 1, 0, 0.827451, 1,
1.168584, -1.240781, 1.446559, 1, 0, 0.8235294, 1,
1.171352, 0.2126731, 1.421622, 1, 0, 0.8156863, 1,
1.174644, 0.02529945, 2.432743, 1, 0, 0.8117647, 1,
1.174841, 1.029489, 0.03459813, 1, 0, 0.8039216, 1,
1.176322, 0.5319969, 2.619218, 1, 0, 0.7960784, 1,
1.176645, 1.287037, -1.089986, 1, 0, 0.7921569, 1,
1.177542, 0.739579, 1.375573, 1, 0, 0.7843137, 1,
1.18424, -0.1523135, 0.2576553, 1, 0, 0.7803922, 1,
1.185927, 0.7435048, 1.712079, 1, 0, 0.772549, 1,
1.187748, -1.255764, 1.202119, 1, 0, 0.7686275, 1,
1.190612, 1.247291, 1.335938, 1, 0, 0.7607843, 1,
1.19062, -1.060927, 0.9521289, 1, 0, 0.7568628, 1,
1.199899, 0.8696151, 1.250923, 1, 0, 0.7490196, 1,
1.200411, 1.701626, 0.6226192, 1, 0, 0.7450981, 1,
1.212433, 0.7084536, 0.63111, 1, 0, 0.7372549, 1,
1.21708, 0.4107203, -0.206334, 1, 0, 0.7333333, 1,
1.219516, 0.0150999, -0.07945929, 1, 0, 0.7254902, 1,
1.227176, 2.221869, 1.1888, 1, 0, 0.7215686, 1,
1.227959, 1.030924, 1.967017, 1, 0, 0.7137255, 1,
1.233791, -0.1844134, 2.893117, 1, 0, 0.7098039, 1,
1.253223, 1.597022, 0.3291755, 1, 0, 0.7019608, 1,
1.255476, -0.57548, 2.869713, 1, 0, 0.6941177, 1,
1.268909, 0.2494862, 0.8511966, 1, 0, 0.6901961, 1,
1.270123, 0.03065559, 1.679064, 1, 0, 0.682353, 1,
1.270297, 0.6315178, 3.033096, 1, 0, 0.6784314, 1,
1.282034, -0.2495242, 1.402882, 1, 0, 0.6705883, 1,
1.293185, 1.478593, 0.1261208, 1, 0, 0.6666667, 1,
1.296896, 0.7289874, 1.358409, 1, 0, 0.6588235, 1,
1.305141, 1.025673, -0.5185279, 1, 0, 0.654902, 1,
1.314547, 1.104783, 0.9025761, 1, 0, 0.6470588, 1,
1.31557, 1.829567, -0.78426, 1, 0, 0.6431373, 1,
1.324667, 0.00655509, 1.382021, 1, 0, 0.6352941, 1,
1.326166, -0.4316925, 0.3945325, 1, 0, 0.6313726, 1,
1.335982, 0.3693382, 2.931864, 1, 0, 0.6235294, 1,
1.338172, 1.044619, -0.9219719, 1, 0, 0.6196079, 1,
1.339076, -1.095385, 0.9952488, 1, 0, 0.6117647, 1,
1.343221, 0.1172797, 2.406538, 1, 0, 0.6078432, 1,
1.343506, 0.03399189, 1.623669, 1, 0, 0.6, 1,
1.345531, 1.303376, 1.066309, 1, 0, 0.5921569, 1,
1.349718, -0.168009, 4.469199, 1, 0, 0.5882353, 1,
1.357396, -1.185747, 0.9927204, 1, 0, 0.5803922, 1,
1.358684, -2.107654, 4.485405, 1, 0, 0.5764706, 1,
1.359513, 2.11832, 0.07357586, 1, 0, 0.5686275, 1,
1.361148, 0.9522578, 2.580677, 1, 0, 0.5647059, 1,
1.362394, 0.4522874, 0.677481, 1, 0, 0.5568628, 1,
1.362518, 0.03381437, 1.592074, 1, 0, 0.5529412, 1,
1.364394, -1.058285, 1.484777, 1, 0, 0.5450981, 1,
1.367842, -1.873425, 2.615638, 1, 0, 0.5411765, 1,
1.376869, 1.506022, 0.05814299, 1, 0, 0.5333334, 1,
1.395232, -1.997605, 1.942236, 1, 0, 0.5294118, 1,
1.401209, 0.7244871, 1.792518, 1, 0, 0.5215687, 1,
1.404407, 0.04700552, 0.3282619, 1, 0, 0.5176471, 1,
1.407315, -1.072516, 3.187771, 1, 0, 0.509804, 1,
1.408574, -0.8794766, 3.727659, 1, 0, 0.5058824, 1,
1.416454, 0.009580047, 1.787065, 1, 0, 0.4980392, 1,
1.419637, -3.134154, 2.821767, 1, 0, 0.4901961, 1,
1.427195, 2.125562, -0.6111147, 1, 0, 0.4862745, 1,
1.43704, 1.73762, -0.2639785, 1, 0, 0.4784314, 1,
1.447516, -0.2160674, 3.299529, 1, 0, 0.4745098, 1,
1.451653, -1.250742, 3.119505, 1, 0, 0.4666667, 1,
1.464568, -0.6062689, 2.099219, 1, 0, 0.4627451, 1,
1.465167, -0.6110668, 1.128571, 1, 0, 0.454902, 1,
1.473321, -1.210153, 0.9521043, 1, 0, 0.4509804, 1,
1.476089, 0.1249203, 3.821056, 1, 0, 0.4431373, 1,
1.484953, -0.5257881, 1.886813, 1, 0, 0.4392157, 1,
1.493446, -0.7079319, 2.096337, 1, 0, 0.4313726, 1,
1.496809, 0.184646, 0.5823615, 1, 0, 0.427451, 1,
1.51089, 0.6468574, 1.767374, 1, 0, 0.4196078, 1,
1.513352, 0.8006753, 0.5986462, 1, 0, 0.4156863, 1,
1.517989, -1.257536, 1.183993, 1, 0, 0.4078431, 1,
1.520579, 0.6100923, 0.9917949, 1, 0, 0.4039216, 1,
1.534399, -0.2767776, 0.7952636, 1, 0, 0.3960784, 1,
1.535187, 1.325951, 0.5331603, 1, 0, 0.3882353, 1,
1.538476, 1.027976, 1.747721, 1, 0, 0.3843137, 1,
1.550624, 1.189505, 0.8443089, 1, 0, 0.3764706, 1,
1.569964, -0.7931924, 0.4510112, 1, 0, 0.372549, 1,
1.586736, 0.05862281, 1.470263, 1, 0, 0.3647059, 1,
1.588098, 0.2271607, 0.989781, 1, 0, 0.3607843, 1,
1.589937, -1.595579, 2.818413, 1, 0, 0.3529412, 1,
1.602022, 0.4197274, -0.03451343, 1, 0, 0.3490196, 1,
1.612204, 0.648695, 0.4586059, 1, 0, 0.3411765, 1,
1.619941, 0.2011501, 0.2367724, 1, 0, 0.3372549, 1,
1.62051, -0.1987014, 1.523594, 1, 0, 0.3294118, 1,
1.621642, 0.3997687, 0.7135291, 1, 0, 0.3254902, 1,
1.62822, 0.4055564, 0.9059364, 1, 0, 0.3176471, 1,
1.636336, 1.013916, 1.019693, 1, 0, 0.3137255, 1,
1.641138, 0.2299488, 1.190536, 1, 0, 0.3058824, 1,
1.646836, 0.542947, 2.08274, 1, 0, 0.2980392, 1,
1.674755, 0.2171829, 1.183061, 1, 0, 0.2941177, 1,
1.677149, 0.1765319, 2.277409, 1, 0, 0.2862745, 1,
1.680862, -0.5482824, 3.057903, 1, 0, 0.282353, 1,
1.703539, -0.3743281, 1.049626, 1, 0, 0.2745098, 1,
1.724767, -0.6641989, 2.034378, 1, 0, 0.2705882, 1,
1.728152, 0.3006821, 1.842895, 1, 0, 0.2627451, 1,
1.74442, -0.6378801, 1.397562, 1, 0, 0.2588235, 1,
1.751635, -0.2292022, 1.376206, 1, 0, 0.2509804, 1,
1.774266, -0.6796232, 3.338602, 1, 0, 0.2470588, 1,
1.779857, 0.6989766, 1.451179, 1, 0, 0.2392157, 1,
1.785524, 0.08147183, 0.3973693, 1, 0, 0.2352941, 1,
1.789752, 0.2843852, 0.6342044, 1, 0, 0.227451, 1,
1.790683, 0.1551849, 2.084531, 1, 0, 0.2235294, 1,
1.791025, -0.1310909, 1.61377, 1, 0, 0.2156863, 1,
1.81494, -1.058578, 2.930344, 1, 0, 0.2117647, 1,
1.839731, 0.9205706, 0.223398, 1, 0, 0.2039216, 1,
1.840835, -1.115203, 1.499095, 1, 0, 0.1960784, 1,
1.848557, -0.1921839, 1.916702, 1, 0, 0.1921569, 1,
1.857907, 1.945892, 0.7347301, 1, 0, 0.1843137, 1,
1.874642, -0.1997872, 3.912054, 1, 0, 0.1803922, 1,
1.879071, -1.393045, 0.9122429, 1, 0, 0.172549, 1,
1.896875, -1.012312, 2.281117, 1, 0, 0.1686275, 1,
1.916966, 1.195894, 1.185655, 1, 0, 0.1607843, 1,
1.920089, -0.853478, 2.413758, 1, 0, 0.1568628, 1,
1.953347, -0.7589933, 2.227531, 1, 0, 0.1490196, 1,
1.994985, 0.7601693, 0.5393552, 1, 0, 0.145098, 1,
2.043729, -0.4212812, 0.6119133, 1, 0, 0.1372549, 1,
2.105903, 1.109511, 2.161351, 1, 0, 0.1333333, 1,
2.115342, 0.7168264, 0.2142839, 1, 0, 0.1254902, 1,
2.14843, -0.4287888, 2.257113, 1, 0, 0.1215686, 1,
2.165871, 0.2755301, 2.024371, 1, 0, 0.1137255, 1,
2.1845, -2.192471, 0.9532333, 1, 0, 0.1098039, 1,
2.194738, 0.3322829, 0.3927983, 1, 0, 0.1019608, 1,
2.202145, 0.655136, 1.665989, 1, 0, 0.09411765, 1,
2.259786, -0.9456234, 2.083244, 1, 0, 0.09019608, 1,
2.264582, 2.119239, -0.05843776, 1, 0, 0.08235294, 1,
2.292871, 1.318412, 0.4717517, 1, 0, 0.07843138, 1,
2.348388, -0.8956159, 1.911931, 1, 0, 0.07058824, 1,
2.439586, -1.316375, 2.993077, 1, 0, 0.06666667, 1,
2.444408, -1.117839, 2.463865, 1, 0, 0.05882353, 1,
2.531247, -1.747493, 3.218864, 1, 0, 0.05490196, 1,
2.546626, -0.4415172, 2.540755, 1, 0, 0.04705882, 1,
2.550477, -0.7075775, 2.379377, 1, 0, 0.04313726, 1,
2.646117, 1.358083, 0.7668628, 1, 0, 0.03529412, 1,
2.646674, -0.1010206, 1.703625, 1, 0, 0.03137255, 1,
2.663754, -0.6727852, 2.793423, 1, 0, 0.02352941, 1,
2.68503, 1.120319, 1.800696, 1, 0, 0.01960784, 1,
2.748876, -0.6815289, 1.357058, 1, 0, 0.01176471, 1,
3.041815, -0.1644037, 0.6003428, 1, 0, 0.007843138, 1
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
-0.2029732, -4.39918, -7.080049, 0, -0.5, 0.5, 0.5,
-0.2029732, -4.39918, -7.080049, 1, -0.5, 0.5, 0.5,
-0.2029732, -4.39918, -7.080049, 1, 1.5, 0.5, 0.5,
-0.2029732, -4.39918, -7.080049, 0, 1.5, 0.5, 0.5
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
-4.547745, -0.1850222, -7.080049, 0, -0.5, 0.5, 0.5,
-4.547745, -0.1850222, -7.080049, 1, -0.5, 0.5, 0.5,
-4.547745, -0.1850222, -7.080049, 1, 1.5, 0.5, 0.5,
-4.547745, -0.1850222, -7.080049, 0, 1.5, 0.5, 0.5
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
-4.547745, -4.39918, -0.2554865, 0, -0.5, 0.5, 0.5,
-4.547745, -4.39918, -0.2554865, 1, -0.5, 0.5, 0.5,
-4.547745, -4.39918, -0.2554865, 1, 1.5, 0.5, 0.5,
-4.547745, -4.39918, -0.2554865, 0, 1.5, 0.5, 0.5
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
-3, -3.426682, -5.50515,
3, -3.426682, -5.50515,
-3, -3.426682, -5.50515,
-3, -3.588765, -5.767633,
-2, -3.426682, -5.50515,
-2, -3.588765, -5.767633,
-1, -3.426682, -5.50515,
-1, -3.588765, -5.767633,
0, -3.426682, -5.50515,
0, -3.588765, -5.767633,
1, -3.426682, -5.50515,
1, -3.588765, -5.767633,
2, -3.426682, -5.50515,
2, -3.588765, -5.767633,
3, -3.426682, -5.50515,
3, -3.588765, -5.767633
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
-3, -3.912931, -6.2926, 0, -0.5, 0.5, 0.5,
-3, -3.912931, -6.2926, 1, -0.5, 0.5, 0.5,
-3, -3.912931, -6.2926, 1, 1.5, 0.5, 0.5,
-3, -3.912931, -6.2926, 0, 1.5, 0.5, 0.5,
-2, -3.912931, -6.2926, 0, -0.5, 0.5, 0.5,
-2, -3.912931, -6.2926, 1, -0.5, 0.5, 0.5,
-2, -3.912931, -6.2926, 1, 1.5, 0.5, 0.5,
-2, -3.912931, -6.2926, 0, 1.5, 0.5, 0.5,
-1, -3.912931, -6.2926, 0, -0.5, 0.5, 0.5,
-1, -3.912931, -6.2926, 1, -0.5, 0.5, 0.5,
-1, -3.912931, -6.2926, 1, 1.5, 0.5, 0.5,
-1, -3.912931, -6.2926, 0, 1.5, 0.5, 0.5,
0, -3.912931, -6.2926, 0, -0.5, 0.5, 0.5,
0, -3.912931, -6.2926, 1, -0.5, 0.5, 0.5,
0, -3.912931, -6.2926, 1, 1.5, 0.5, 0.5,
0, -3.912931, -6.2926, 0, 1.5, 0.5, 0.5,
1, -3.912931, -6.2926, 0, -0.5, 0.5, 0.5,
1, -3.912931, -6.2926, 1, -0.5, 0.5, 0.5,
1, -3.912931, -6.2926, 1, 1.5, 0.5, 0.5,
1, -3.912931, -6.2926, 0, 1.5, 0.5, 0.5,
2, -3.912931, -6.2926, 0, -0.5, 0.5, 0.5,
2, -3.912931, -6.2926, 1, -0.5, 0.5, 0.5,
2, -3.912931, -6.2926, 1, 1.5, 0.5, 0.5,
2, -3.912931, -6.2926, 0, 1.5, 0.5, 0.5,
3, -3.912931, -6.2926, 0, -0.5, 0.5, 0.5,
3, -3.912931, -6.2926, 1, -0.5, 0.5, 0.5,
3, -3.912931, -6.2926, 1, 1.5, 0.5, 0.5,
3, -3.912931, -6.2926, 0, 1.5, 0.5, 0.5
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
-3.545105, -3, -5.50515,
-3.545105, 2, -5.50515,
-3.545105, -3, -5.50515,
-3.712212, -3, -5.767633,
-3.545105, -2, -5.50515,
-3.712212, -2, -5.767633,
-3.545105, -1, -5.50515,
-3.712212, -1, -5.767633,
-3.545105, 0, -5.50515,
-3.712212, 0, -5.767633,
-3.545105, 1, -5.50515,
-3.712212, 1, -5.767633,
-3.545105, 2, -5.50515,
-3.712212, 2, -5.767633
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
-4.046425, -3, -6.2926, 0, -0.5, 0.5, 0.5,
-4.046425, -3, -6.2926, 1, -0.5, 0.5, 0.5,
-4.046425, -3, -6.2926, 1, 1.5, 0.5, 0.5,
-4.046425, -3, -6.2926, 0, 1.5, 0.5, 0.5,
-4.046425, -2, -6.2926, 0, -0.5, 0.5, 0.5,
-4.046425, -2, -6.2926, 1, -0.5, 0.5, 0.5,
-4.046425, -2, -6.2926, 1, 1.5, 0.5, 0.5,
-4.046425, -2, -6.2926, 0, 1.5, 0.5, 0.5,
-4.046425, -1, -6.2926, 0, -0.5, 0.5, 0.5,
-4.046425, -1, -6.2926, 1, -0.5, 0.5, 0.5,
-4.046425, -1, -6.2926, 1, 1.5, 0.5, 0.5,
-4.046425, -1, -6.2926, 0, 1.5, 0.5, 0.5,
-4.046425, 0, -6.2926, 0, -0.5, 0.5, 0.5,
-4.046425, 0, -6.2926, 1, -0.5, 0.5, 0.5,
-4.046425, 0, -6.2926, 1, 1.5, 0.5, 0.5,
-4.046425, 0, -6.2926, 0, 1.5, 0.5, 0.5,
-4.046425, 1, -6.2926, 0, -0.5, 0.5, 0.5,
-4.046425, 1, -6.2926, 1, -0.5, 0.5, 0.5,
-4.046425, 1, -6.2926, 1, 1.5, 0.5, 0.5,
-4.046425, 1, -6.2926, 0, 1.5, 0.5, 0.5,
-4.046425, 2, -6.2926, 0, -0.5, 0.5, 0.5,
-4.046425, 2, -6.2926, 1, -0.5, 0.5, 0.5,
-4.046425, 2, -6.2926, 1, 1.5, 0.5, 0.5,
-4.046425, 2, -6.2926, 0, 1.5, 0.5, 0.5
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
-3.545105, -3.426682, -4,
-3.545105, -3.426682, 4,
-3.545105, -3.426682, -4,
-3.712212, -3.588765, -4,
-3.545105, -3.426682, -2,
-3.712212, -3.588765, -2,
-3.545105, -3.426682, 0,
-3.712212, -3.588765, 0,
-3.545105, -3.426682, 2,
-3.712212, -3.588765, 2,
-3.545105, -3.426682, 4,
-3.712212, -3.588765, 4
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
-4.046425, -3.912931, -4, 0, -0.5, 0.5, 0.5,
-4.046425, -3.912931, -4, 1, -0.5, 0.5, 0.5,
-4.046425, -3.912931, -4, 1, 1.5, 0.5, 0.5,
-4.046425, -3.912931, -4, 0, 1.5, 0.5, 0.5,
-4.046425, -3.912931, -2, 0, -0.5, 0.5, 0.5,
-4.046425, -3.912931, -2, 1, -0.5, 0.5, 0.5,
-4.046425, -3.912931, -2, 1, 1.5, 0.5, 0.5,
-4.046425, -3.912931, -2, 0, 1.5, 0.5, 0.5,
-4.046425, -3.912931, 0, 0, -0.5, 0.5, 0.5,
-4.046425, -3.912931, 0, 1, -0.5, 0.5, 0.5,
-4.046425, -3.912931, 0, 1, 1.5, 0.5, 0.5,
-4.046425, -3.912931, 0, 0, 1.5, 0.5, 0.5,
-4.046425, -3.912931, 2, 0, -0.5, 0.5, 0.5,
-4.046425, -3.912931, 2, 1, -0.5, 0.5, 0.5,
-4.046425, -3.912931, 2, 1, 1.5, 0.5, 0.5,
-4.046425, -3.912931, 2, 0, 1.5, 0.5, 0.5,
-4.046425, -3.912931, 4, 0, -0.5, 0.5, 0.5,
-4.046425, -3.912931, 4, 1, -0.5, 0.5, 0.5,
-4.046425, -3.912931, 4, 1, 1.5, 0.5, 0.5,
-4.046425, -3.912931, 4, 0, 1.5, 0.5, 0.5
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
-3.545105, -3.426682, -5.50515,
-3.545105, 3.056638, -5.50515,
-3.545105, -3.426682, 4.994177,
-3.545105, 3.056638, 4.994177,
-3.545105, -3.426682, -5.50515,
-3.545105, -3.426682, 4.994177,
-3.545105, 3.056638, -5.50515,
-3.545105, 3.056638, 4.994177,
-3.545105, -3.426682, -5.50515,
3.139159, -3.426682, -5.50515,
-3.545105, -3.426682, 4.994177,
3.139159, -3.426682, 4.994177,
-3.545105, 3.056638, -5.50515,
3.139159, 3.056638, -5.50515,
-3.545105, 3.056638, 4.994177,
3.139159, 3.056638, 4.994177,
3.139159, -3.426682, -5.50515,
3.139159, 3.056638, -5.50515,
3.139159, -3.426682, 4.994177,
3.139159, 3.056638, 4.994177,
3.139159, -3.426682, -5.50515,
3.139159, -3.426682, 4.994177,
3.139159, 3.056638, -5.50515,
3.139159, 3.056638, 4.994177
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
var radius = 7.493798;
var distance = 33.34075;
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
mvMatrix.translate( 0.2029732, 0.1850222, 0.2554865 );
mvMatrix.scale( 1.212167, 1.249736, 0.7717106 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.34075);
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
chloropropylate<-read.table("chloropropylate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chloropropylate$V2
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate' not found
```

```r
y<-chloropropylate$V3
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate' not found
```

```r
z<-chloropropylate$V4
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate' not found
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
-3.447762, 1.052448, -1.784759, 0, 0, 1, 1, 1,
-2.872006, 1.957175, 0.963373, 1, 0, 0, 1, 1,
-2.866513, -0.2240683, -1.590183, 1, 0, 0, 1, 1,
-2.771975, 1.657657, -1.882308, 1, 0, 0, 1, 1,
-2.688002, 0.3911549, -1.91391, 1, 0, 0, 1, 1,
-2.67841, 1.43878, -0.09945013, 1, 0, 0, 1, 1,
-2.654339, -0.0909443, -2.493872, 0, 0, 0, 1, 1,
-2.627891, 0.1246643, -0.9201806, 0, 0, 0, 1, 1,
-2.492711, -0.6992694, -0.004206968, 0, 0, 0, 1, 1,
-2.458673, -0.2336092, -3.339682, 0, 0, 0, 1, 1,
-2.453679, 1.67379, -1.142385, 0, 0, 0, 1, 1,
-2.314442, -0.1568883, -3.138235, 0, 0, 0, 1, 1,
-2.278796, 0.381125, -0.4543819, 0, 0, 0, 1, 1,
-2.222843, 0.9938043, -2.992122, 1, 1, 1, 1, 1,
-2.222045, 0.03163569, -1.928261, 1, 1, 1, 1, 1,
-2.191288, -1.249835, -0.05418564, 1, 1, 1, 1, 1,
-2.177498, 0.9256831, -1.095156, 1, 1, 1, 1, 1,
-2.155912, -0.3471279, -2.742659, 1, 1, 1, 1, 1,
-2.112639, 0.7854488, -0.07603018, 1, 1, 1, 1, 1,
-2.097533, -0.0612267, -2.653089, 1, 1, 1, 1, 1,
-2.092155, -0.570738, -2.767144, 1, 1, 1, 1, 1,
-2.075201, -0.9281924, -1.201587, 1, 1, 1, 1, 1,
-2.0678, 0.9560498, -2.048704, 1, 1, 1, 1, 1,
-2.022415, 0.01033042, -0.8224233, 1, 1, 1, 1, 1,
-2.000196, -0.878582, -1.053817, 1, 1, 1, 1, 1,
-1.984859, -0.004434919, -2.545987, 1, 1, 1, 1, 1,
-1.977404, -0.8285909, -1.90745, 1, 1, 1, 1, 1,
-1.963627, 0.2164267, 0.4919386, 1, 1, 1, 1, 1,
-1.959114, 2.138845, -2.041936, 0, 0, 1, 1, 1,
-1.955108, -0.5055536, 0.494559, 1, 0, 0, 1, 1,
-1.943741, -0.3909192, -2.086239, 1, 0, 0, 1, 1,
-1.921379, 1.688525, 0.183798, 1, 0, 0, 1, 1,
-1.915066, 0.2420819, -1.854572, 1, 0, 0, 1, 1,
-1.899329, -1.288549, -3.76788, 1, 0, 0, 1, 1,
-1.832349, 0.8647209, -2.855407, 0, 0, 0, 1, 1,
-1.799577, 1.717419, -0.8180432, 0, 0, 0, 1, 1,
-1.796003, 0.6503175, -0.8107467, 0, 0, 0, 1, 1,
-1.782955, -0.7464454, -0.710283, 0, 0, 0, 1, 1,
-1.781997, -1.713491, -3.291101, 0, 0, 0, 1, 1,
-1.725225, -1.245744, -2.48627, 0, 0, 0, 1, 1,
-1.724584, 0.8272075, -0.5797068, 0, 0, 0, 1, 1,
-1.719233, 2.071576, -2.721447, 1, 1, 1, 1, 1,
-1.699068, 1.51783, -2.238131, 1, 1, 1, 1, 1,
-1.69675, 1.137417, -0.2894139, 1, 1, 1, 1, 1,
-1.650437, 0.8464319, -1.444397, 1, 1, 1, 1, 1,
-1.645868, -0.3588539, -2.096983, 1, 1, 1, 1, 1,
-1.644269, -1.570501, -2.07226, 1, 1, 1, 1, 1,
-1.642792, -0.29592, -1.033317, 1, 1, 1, 1, 1,
-1.639767, 0.5796732, -2.738286, 1, 1, 1, 1, 1,
-1.631047, 0.5058111, -2.553597, 1, 1, 1, 1, 1,
-1.626004, 0.2778694, -2.040057, 1, 1, 1, 1, 1,
-1.61218, -2.049656, -3.380625, 1, 1, 1, 1, 1,
-1.59772, 0.9254409, -0.1544595, 1, 1, 1, 1, 1,
-1.596091, -0.04945278, -3.532586, 1, 1, 1, 1, 1,
-1.590542, -1.020847, -2.301618, 1, 1, 1, 1, 1,
-1.589598, 0.6249239, -2.286529, 1, 1, 1, 1, 1,
-1.58575, 0.5106751, -0.806003, 0, 0, 1, 1, 1,
-1.581928, -0.3965133, -1.649079, 1, 0, 0, 1, 1,
-1.577051, 0.5432776, -2.268385, 1, 0, 0, 1, 1,
-1.573723, 1.550652, -0.8420167, 1, 0, 0, 1, 1,
-1.550221, 0.6339837, -2.311025, 1, 0, 0, 1, 1,
-1.542719, 0.03810834, -0.996122, 1, 0, 0, 1, 1,
-1.539128, 0.03706704, -0.9822506, 0, 0, 0, 1, 1,
-1.538099, -0.3432182, -0.2429003, 0, 0, 0, 1, 1,
-1.527316, 1.216073, -1.024363, 0, 0, 0, 1, 1,
-1.521531, -1.238297, -1.967094, 0, 0, 0, 1, 1,
-1.517659, 0.1640109, -1.582696, 0, 0, 0, 1, 1,
-1.517638, -1.226886, -3.014868, 0, 0, 0, 1, 1,
-1.513638, -0.3344123, -1.882272, 0, 0, 0, 1, 1,
-1.511986, -1.71036, -2.162066, 1, 1, 1, 1, 1,
-1.506679, 1.087242, -1.527391, 1, 1, 1, 1, 1,
-1.483758, 1.490629, 0.482785, 1, 1, 1, 1, 1,
-1.468656, 0.305799, -2.598394, 1, 1, 1, 1, 1,
-1.468507, -0.682035, -1.673275, 1, 1, 1, 1, 1,
-1.462968, 0.29407, -1.725813, 1, 1, 1, 1, 1,
-1.4551, -2.151845, -1.38599, 1, 1, 1, 1, 1,
-1.44899, 0.6637278, -1.029837, 1, 1, 1, 1, 1,
-1.439718, 1.002621, -1.418265, 1, 1, 1, 1, 1,
-1.432822, -0.1244305, -0.8804834, 1, 1, 1, 1, 1,
-1.432434, -0.4656031, -3.314647, 1, 1, 1, 1, 1,
-1.428367, 0.8740113, -1.906134, 1, 1, 1, 1, 1,
-1.417278, 2.154932, 0.7523743, 1, 1, 1, 1, 1,
-1.414357, 0.7228747, -0.7581918, 1, 1, 1, 1, 1,
-1.404914, 0.7296084, -1.123427, 1, 1, 1, 1, 1,
-1.402992, 0.02390443, -2.008447, 0, 0, 1, 1, 1,
-1.39608, 1.904405, -0.1477168, 1, 0, 0, 1, 1,
-1.392598, -0.23759, -1.966043, 1, 0, 0, 1, 1,
-1.381568, 0.3718612, -1.380505, 1, 0, 0, 1, 1,
-1.379258, 0.3495783, -1.918301, 1, 0, 0, 1, 1,
-1.378663, 0.3333597, -0.9648901, 1, 0, 0, 1, 1,
-1.363523, -0.870885, -1.817427, 0, 0, 0, 1, 1,
-1.361042, -0.2731849, -1.510288, 0, 0, 0, 1, 1,
-1.360834, 0.8924645, -2.246989, 0, 0, 0, 1, 1,
-1.357336, -1.077893, -3.822759, 0, 0, 0, 1, 1,
-1.354554, 0.5391324, -0.5492768, 0, 0, 0, 1, 1,
-1.353634, -0.6849013, -3.921138, 0, 0, 0, 1, 1,
-1.346257, 0.04870826, -1.761795, 0, 0, 0, 1, 1,
-1.339913, -1.636987, -2.831024, 1, 1, 1, 1, 1,
-1.33902, 2.554471, 0.8230985, 1, 1, 1, 1, 1,
-1.337282, -0.6340268, -1.279945, 1, 1, 1, 1, 1,
-1.332543, -0.05420706, -1.573708, 1, 1, 1, 1, 1,
-1.329237, 0.04843968, 0.09049218, 1, 1, 1, 1, 1,
-1.320813, -0.2121365, -0.9236186, 1, 1, 1, 1, 1,
-1.314619, -0.3474219, -0.900636, 1, 1, 1, 1, 1,
-1.313266, 2.962221, 1.339752, 1, 1, 1, 1, 1,
-1.310431, -0.1535825, -0.7553051, 1, 1, 1, 1, 1,
-1.305122, -0.8672138, -3.107535, 1, 1, 1, 1, 1,
-1.303663, 0.7176593, -2.043423, 1, 1, 1, 1, 1,
-1.297913, -0.6877491, -0.7970407, 1, 1, 1, 1, 1,
-1.294271, 0.06258246, -2.124756, 1, 1, 1, 1, 1,
-1.289819, -1.073979, -4.177709, 1, 1, 1, 1, 1,
-1.288669, -0.2676783, -3.008207, 1, 1, 1, 1, 1,
-1.288213, -1.864821, -1.225306, 0, 0, 1, 1, 1,
-1.287523, 1.133697, -0.790938, 1, 0, 0, 1, 1,
-1.286755, -1.103637, -1.86152, 1, 0, 0, 1, 1,
-1.2758, -2.079616, -3.788973, 1, 0, 0, 1, 1,
-1.269972, 0.8826964, -0.3816211, 1, 0, 0, 1, 1,
-1.261308, 0.7261054, -0.8063592, 1, 0, 0, 1, 1,
-1.259378, 0.2952141, -1.800886, 0, 0, 0, 1, 1,
-1.255015, 0.4863802, -2.834032, 0, 0, 0, 1, 1,
-1.253261, -0.4849618, -1.700508, 0, 0, 0, 1, 1,
-1.250273, -0.4038483, -2.679563, 0, 0, 0, 1, 1,
-1.243968, -1.265953, -4.687828, 0, 0, 0, 1, 1,
-1.237349, 0.5922655, -0.7686766, 0, 0, 0, 1, 1,
-1.23562, -0.810187, -1.981637, 0, 0, 0, 1, 1,
-1.220317, 0.1015069, -3.197275, 1, 1, 1, 1, 1,
-1.218546, 0.8337313, -3.30945, 1, 1, 1, 1, 1,
-1.212702, -0.3210436, -2.719721, 1, 1, 1, 1, 1,
-1.211991, -0.58094, -1.682401, 1, 1, 1, 1, 1,
-1.210735, 0.3206849, -0.3990498, 1, 1, 1, 1, 1,
-1.210485, 0.004606105, -0.878056, 1, 1, 1, 1, 1,
-1.204411, 0.5325308, -2.801552, 1, 1, 1, 1, 1,
-1.203076, -2.108171, -3.032483, 1, 1, 1, 1, 1,
-1.199144, 2.468664, -1.188998, 1, 1, 1, 1, 1,
-1.19895, 0.4101794, -2.515989, 1, 1, 1, 1, 1,
-1.196605, 0.106948, -2.567874, 1, 1, 1, 1, 1,
-1.170603, 0.1800612, 0.1729693, 1, 1, 1, 1, 1,
-1.167808, 0.5275021, 0.4887219, 1, 1, 1, 1, 1,
-1.166881, -1.431706, -3.206673, 1, 1, 1, 1, 1,
-1.165288, 0.1633891, -0.3073213, 1, 1, 1, 1, 1,
-1.158924, 1.155084, -1.016053, 0, 0, 1, 1, 1,
-1.148462, -1.879104, -3.625497, 1, 0, 0, 1, 1,
-1.148223, -1.547073, -2.355491, 1, 0, 0, 1, 1,
-1.147861, -1.002012, -1.348419, 1, 0, 0, 1, 1,
-1.144648, -1.072722, -4.108875, 1, 0, 0, 1, 1,
-1.14304, 0.5614182, -0.1310186, 1, 0, 0, 1, 1,
-1.141002, 0.1463225, -0.6636725, 0, 0, 0, 1, 1,
-1.124931, -1.611507, -1.326276, 0, 0, 0, 1, 1,
-1.117785, 0.07269344, 0.01325629, 0, 0, 0, 1, 1,
-1.116095, -0.7012948, -0.885808, 0, 0, 0, 1, 1,
-1.11507, 0.3648391, -1.231962, 0, 0, 0, 1, 1,
-1.114284, 0.8169628, 0.2104429, 0, 0, 0, 1, 1,
-1.106685, 1.552163, -0.7009317, 0, 0, 0, 1, 1,
-1.103209, 0.520259, -0.07852376, 1, 1, 1, 1, 1,
-1.095288, -0.06460256, -1.414124, 1, 1, 1, 1, 1,
-1.0851, 0.2483865, -1.256324, 1, 1, 1, 1, 1,
-1.084712, 2.607704, 0.1022893, 1, 1, 1, 1, 1,
-1.084009, -1.83904, -0.7308958, 1, 1, 1, 1, 1,
-1.083455, 0.510825, 0.1724437, 1, 1, 1, 1, 1,
-1.082353, 0.9063128, -0.2545468, 1, 1, 1, 1, 1,
-1.075887, 0.003922848, -3.087551, 1, 1, 1, 1, 1,
-1.072441, 0.7113968, -1.102397, 1, 1, 1, 1, 1,
-1.072323, -0.2977205, -2.605293, 1, 1, 1, 1, 1,
-1.070631, -0.277245, -1.834883, 1, 1, 1, 1, 1,
-1.066675, -0.6132585, -3.374222, 1, 1, 1, 1, 1,
-1.062997, 2.441657, -2.039989, 1, 1, 1, 1, 1,
-1.061065, -0.4147356, -1.099351, 1, 1, 1, 1, 1,
-1.054237, 0.8358186, -1.908446, 1, 1, 1, 1, 1,
-1.042224, -1.423505, -1.998465, 0, 0, 1, 1, 1,
-1.041202, 0.8839834, -0.7351432, 1, 0, 0, 1, 1,
-1.035135, 0.8302683, -0.1078535, 1, 0, 0, 1, 1,
-1.029219, 0.894106, 0.2076022, 1, 0, 0, 1, 1,
-1.022755, -1.510943, -3.963921, 1, 0, 0, 1, 1,
-1.018542, -2.25414, -2.822889, 1, 0, 0, 1, 1,
-1.015794, 1.645317, -1.11078, 0, 0, 0, 1, 1,
-1.007098, 0.4981886, -1.971835, 0, 0, 0, 1, 1,
-1.00624, -0.01360907, 1.394734, 0, 0, 0, 1, 1,
-1.004183, -0.4807868, -0.9994804, 0, 0, 0, 1, 1,
-1.002464, -0.5738769, -2.184895, 0, 0, 0, 1, 1,
-0.9968436, 0.4079586, -0.9473476, 0, 0, 0, 1, 1,
-0.9833933, 0.6790482, -0.110956, 0, 0, 0, 1, 1,
-0.9810898, 0.4073596, -1.241701, 1, 1, 1, 1, 1,
-0.9801396, -1.014689, -2.383951, 1, 1, 1, 1, 1,
-0.9789736, -0.4492858, -3.988522, 1, 1, 1, 1, 1,
-0.9725045, 0.2925075, -0.7140679, 1, 1, 1, 1, 1,
-0.9694159, 1.194704, -0.9520086, 1, 1, 1, 1, 1,
-0.9651467, 0.5418027, -0.871599, 1, 1, 1, 1, 1,
-0.9637503, 0.7547801, -1.043937, 1, 1, 1, 1, 1,
-0.9620211, 0.4272598, -1.982895, 1, 1, 1, 1, 1,
-0.9579672, -0.7583982, -1.306142, 1, 1, 1, 1, 1,
-0.9507698, -2.194925, -4.619508, 1, 1, 1, 1, 1,
-0.9505138, 0.03474897, 0.1330737, 1, 1, 1, 1, 1,
-0.9503862, 0.6946081, -0.9847066, 1, 1, 1, 1, 1,
-0.9478863, -1.281961, -0.6647341, 1, 1, 1, 1, 1,
-0.9329081, 0.5649746, -1.683394, 1, 1, 1, 1, 1,
-0.9317476, -0.7914641, -3.027151, 1, 1, 1, 1, 1,
-0.9314491, 0.8768701, -1.473074, 0, 0, 1, 1, 1,
-0.9300585, 1.603394, 1.336181, 1, 0, 0, 1, 1,
-0.9271087, -0.04349337, -2.107929, 1, 0, 0, 1, 1,
-0.9256011, 0.2436171, -1.823778, 1, 0, 0, 1, 1,
-0.9239169, 0.7424927, -0.847497, 1, 0, 0, 1, 1,
-0.92365, 0.7449005, -2.275036, 1, 0, 0, 1, 1,
-0.9224904, -0.6238559, -2.328869, 0, 0, 0, 1, 1,
-0.9057829, 0.7710724, 0.2443305, 0, 0, 0, 1, 1,
-0.9027102, 1.182388, -0.5621362, 0, 0, 0, 1, 1,
-0.8983037, 0.09925707, -1.332896, 0, 0, 0, 1, 1,
-0.8975618, 0.9437616, -1.094163, 0, 0, 0, 1, 1,
-0.8967917, -0.3209476, -1.922572, 0, 0, 0, 1, 1,
-0.896529, -0.7505785, -1.943854, 0, 0, 0, 1, 1,
-0.8948387, 0.06301001, -1.492168, 1, 1, 1, 1, 1,
-0.8939158, -1.162701, -2.764575, 1, 1, 1, 1, 1,
-0.8858782, 0.8662596, -0.6335365, 1, 1, 1, 1, 1,
-0.8809127, 1.904968, -0.6637467, 1, 1, 1, 1, 1,
-0.8795635, -0.4527834, -3.222916, 1, 1, 1, 1, 1,
-0.8756898, -0.2094092, -0.1217974, 1, 1, 1, 1, 1,
-0.8735516, -0.9185523, -1.634462, 1, 1, 1, 1, 1,
-0.8728202, 0.07604496, -0.2641847, 1, 1, 1, 1, 1,
-0.8715716, 0.06240688, -1.62776, 1, 1, 1, 1, 1,
-0.8713698, -0.9823918, -2.911488, 1, 1, 1, 1, 1,
-0.8713071, -0.5851773, -4.568486, 1, 1, 1, 1, 1,
-0.8697081, -0.7948509, -2.170259, 1, 1, 1, 1, 1,
-0.8670208, -0.9581957, -1.9326, 1, 1, 1, 1, 1,
-0.8540995, 0.1695997, -1.847916, 1, 1, 1, 1, 1,
-0.8485759, -0.3070901, -2.814325, 1, 1, 1, 1, 1,
-0.8483707, -2.206389, -4.411077, 0, 0, 1, 1, 1,
-0.8313571, 0.406335, -0.9292819, 1, 0, 0, 1, 1,
-0.8300181, -0.1958958, -0.9075297, 1, 0, 0, 1, 1,
-0.8290848, -0.8726217, -1.244383, 1, 0, 0, 1, 1,
-0.8275977, -0.1311013, -1.111711, 1, 0, 0, 1, 1,
-0.8251967, -0.4062719, -2.343575, 1, 0, 0, 1, 1,
-0.8132298, -0.139388, -3.378671, 0, 0, 0, 1, 1,
-0.7987852, 0.5556985, -0.8750267, 0, 0, 0, 1, 1,
-0.7965703, -0.9185507, -1.291718, 0, 0, 0, 1, 1,
-0.7946001, -2.488461, -3.464265, 0, 0, 0, 1, 1,
-0.7931975, 0.4523166, -4.368314, 0, 0, 0, 1, 1,
-0.7823234, 0.7914603, -1.477728, 0, 0, 0, 1, 1,
-0.7747091, 0.8998059, -1.784877, 0, 0, 0, 1, 1,
-0.7743065, -0.3190121, -1.679063, 1, 1, 1, 1, 1,
-0.7734596, 1.727047, 0.7645612, 1, 1, 1, 1, 1,
-0.7698837, -0.06094628, -1.820961, 1, 1, 1, 1, 1,
-0.7671903, 0.9209477, -1.147764, 1, 1, 1, 1, 1,
-0.7646888, -0.6701718, -2.187497, 1, 1, 1, 1, 1,
-0.764352, 0.08275053, -2.559762, 1, 1, 1, 1, 1,
-0.7627463, -0.08074542, -0.4980869, 1, 1, 1, 1, 1,
-0.7621748, -0.4109419, -1.175877, 1, 1, 1, 1, 1,
-0.7487508, 0.3112693, -1.323876, 1, 1, 1, 1, 1,
-0.7447156, -1.299785, -3.440385, 1, 1, 1, 1, 1,
-0.7437436, 0.552318, -0.5468884, 1, 1, 1, 1, 1,
-0.7435246, 1.840288, -0.1549841, 1, 1, 1, 1, 1,
-0.7410814, -0.1641517, -2.085436, 1, 1, 1, 1, 1,
-0.7349709, 0.8102802, 0.7374817, 1, 1, 1, 1, 1,
-0.7293243, 1.740905, 1.480314, 1, 1, 1, 1, 1,
-0.7291574, -0.9755511, -2.912204, 0, 0, 1, 1, 1,
-0.7273365, 0.3505546, -0.852607, 1, 0, 0, 1, 1,
-0.718873, 0.4060378, -1.540092, 1, 0, 0, 1, 1,
-0.7175618, 0.949908, -0.9057885, 1, 0, 0, 1, 1,
-0.7098839, -3.332265, -0.6739555, 1, 0, 0, 1, 1,
-0.7079806, 0.4683925, -1.527827, 1, 0, 0, 1, 1,
-0.7053976, 0.4183817, 0.3715331, 0, 0, 0, 1, 1,
-0.7036043, -0.3385472, -2.406935, 0, 0, 0, 1, 1,
-0.7034537, 0.8247915, -0.5326601, 0, 0, 0, 1, 1,
-0.6971043, -0.6974796, -1.152366, 0, 0, 0, 1, 1,
-0.6934989, -0.03223287, -1.019738, 0, 0, 0, 1, 1,
-0.6903811, -0.7679186, -1.802909, 0, 0, 0, 1, 1,
-0.6816106, -0.1191986, -0.7143468, 0, 0, 0, 1, 1,
-0.6802321, 1.93156, -1.271502, 1, 1, 1, 1, 1,
-0.6753238, -0.8445553, -1.286245, 1, 1, 1, 1, 1,
-0.673968, 1.827297, -1.807672, 1, 1, 1, 1, 1,
-0.6731029, -0.9903274, -3.668922, 1, 1, 1, 1, 1,
-0.6729329, -0.1062639, 0.04651283, 1, 1, 1, 1, 1,
-0.6729015, 0.6889969, -0.001012144, 1, 1, 1, 1, 1,
-0.6721322, -0.8942343, -2.393331, 1, 1, 1, 1, 1,
-0.6676037, -0.6543064, -3.558094, 1, 1, 1, 1, 1,
-0.6637998, 0.4815048, -0.824783, 1, 1, 1, 1, 1,
-0.6542538, 1.024745, 1.435994, 1, 1, 1, 1, 1,
-0.6518169, 0.6600703, -2.877208, 1, 1, 1, 1, 1,
-0.6350473, -0.1856967, -4.004933, 1, 1, 1, 1, 1,
-0.6342373, 0.4950286, -0.468042, 1, 1, 1, 1, 1,
-0.6255103, 0.7581479, -1.786608, 1, 1, 1, 1, 1,
-0.6232827, -0.9187005, -2.119244, 1, 1, 1, 1, 1,
-0.6219255, 0.7762218, -0.6914408, 0, 0, 1, 1, 1,
-0.6214716, -0.06119828, -0.4024632, 1, 0, 0, 1, 1,
-0.6213812, -0.3825124, -3.006048, 1, 0, 0, 1, 1,
-0.6201205, 0.2646646, -1.615028, 1, 0, 0, 1, 1,
-0.6201073, -0.2546465, -2.907746, 1, 0, 0, 1, 1,
-0.6189378, -1.28329, -1.719866, 1, 0, 0, 1, 1,
-0.6146759, -1.270578, -2.100619, 0, 0, 0, 1, 1,
-0.6099253, -1.950138, -1.800932, 0, 0, 0, 1, 1,
-0.6069543, -0.1863947, -1.06685, 0, 0, 0, 1, 1,
-0.6050137, 0.2623815, -1.190578, 0, 0, 0, 1, 1,
-0.5972884, 0.4168979, -1.182602, 0, 0, 0, 1, 1,
-0.5938367, -0.194356, -1.60743, 0, 0, 0, 1, 1,
-0.5923712, 0.5001259, -0.1477259, 0, 0, 0, 1, 1,
-0.5869552, -0.7597563, -3.433115, 1, 1, 1, 1, 1,
-0.5865608, -1.033998, -1.981491, 1, 1, 1, 1, 1,
-0.5774975, -1.026683, -2.510263, 1, 1, 1, 1, 1,
-0.5735493, -1.012011, -3.271503, 1, 1, 1, 1, 1,
-0.5662723, -0.361797, -0.7045429, 1, 1, 1, 1, 1,
-0.561376, 0.1496689, -3.441482, 1, 1, 1, 1, 1,
-0.5538157, -0.368872, -0.4541004, 1, 1, 1, 1, 1,
-0.5504471, -0.1142132, -1.179278, 1, 1, 1, 1, 1,
-0.5486513, -0.8679348, -0.788744, 1, 1, 1, 1, 1,
-0.5475546, -0.1657153, -1.975646, 1, 1, 1, 1, 1,
-0.5424628, 0.5147436, -1.950957, 1, 1, 1, 1, 1,
-0.5366557, 0.655548, -0.1135753, 1, 1, 1, 1, 1,
-0.5359856, -0.1798813, -1.85264, 1, 1, 1, 1, 1,
-0.5321462, 0.8759938, -0.4296537, 1, 1, 1, 1, 1,
-0.5303159, -1.297395, -2.724499, 1, 1, 1, 1, 1,
-0.5198145, 0.5485206, -0.08378125, 0, 0, 1, 1, 1,
-0.515963, -0.5962826, -1.099287, 1, 0, 0, 1, 1,
-0.5147942, -1.845152, -3.647624, 1, 0, 0, 1, 1,
-0.5134851, -0.5480435, -3.83818, 1, 0, 0, 1, 1,
-0.5101683, 1.564028, -1.174382, 1, 0, 0, 1, 1,
-0.5091326, 0.009075209, -0.4994879, 1, 0, 0, 1, 1,
-0.5089699, 1.98014, -1.581833, 0, 0, 0, 1, 1,
-0.5070133, -0.03151048, -2.447127, 0, 0, 0, 1, 1,
-0.5061962, -0.5417991, -1.34819, 0, 0, 0, 1, 1,
-0.5019784, -0.5744721, -3.490324, 0, 0, 0, 1, 1,
-0.499278, 0.01529862, -2.405491, 0, 0, 0, 1, 1,
-0.4948359, 0.8505704, -1.14689, 0, 0, 0, 1, 1,
-0.491588, 0.6523038, -1.150551, 0, 0, 0, 1, 1,
-0.4901908, -0.2791951, -3.398224, 1, 1, 1, 1, 1,
-0.4869351, 0.3378722, 0.1615466, 1, 1, 1, 1, 1,
-0.4834122, 0.403712, -1.274566, 1, 1, 1, 1, 1,
-0.4813883, -0.02939244, -1.484866, 1, 1, 1, 1, 1,
-0.475142, 0.3476878, -1.318838, 1, 1, 1, 1, 1,
-0.4721234, 1.139148, -0.4018207, 1, 1, 1, 1, 1,
-0.4702361, 0.1793547, -0.6257762, 1, 1, 1, 1, 1,
-0.4661682, 1.094605, -0.1049702, 1, 1, 1, 1, 1,
-0.4593424, 2.08951, -1.979814, 1, 1, 1, 1, 1,
-0.4580173, -1.044814, -4.217945, 1, 1, 1, 1, 1,
-0.4548619, -0.1974905, -0.5655751, 1, 1, 1, 1, 1,
-0.4544153, -0.3918259, -3.573205, 1, 1, 1, 1, 1,
-0.4525545, 0.7736546, 0.02077951, 1, 1, 1, 1, 1,
-0.4519385, 1.291409, 0.5807373, 1, 1, 1, 1, 1,
-0.4502475, 0.2282158, -2.185034, 1, 1, 1, 1, 1,
-0.4502393, -1.11626, -1.910099, 0, 0, 1, 1, 1,
-0.4495365, -1.319981, -2.33098, 1, 0, 0, 1, 1,
-0.4443536, -0.2254565, -1.583307, 1, 0, 0, 1, 1,
-0.4430108, 0.01975516, -3.267152, 1, 0, 0, 1, 1,
-0.4419581, -0.8563188, -2.673974, 1, 0, 0, 1, 1,
-0.440383, 1.447788, 0.220565, 1, 0, 0, 1, 1,
-0.4394739, -0.9097594, -3.368695, 0, 0, 0, 1, 1,
-0.4394504, -1.263591, -4.682495, 0, 0, 0, 1, 1,
-0.439326, -0.9817539, -3.429537, 0, 0, 0, 1, 1,
-0.4354447, -1.261432, -2.659064, 0, 0, 0, 1, 1,
-0.432184, 2.339222, 0.3954805, 0, 0, 0, 1, 1,
-0.4303995, 0.7549468, 0.3200199, 0, 0, 0, 1, 1,
-0.4289816, 0.06197134, -0.620131, 0, 0, 0, 1, 1,
-0.4286577, -1.386461, -4.652556, 1, 1, 1, 1, 1,
-0.4240235, -0.6833034, -3.0163, 1, 1, 1, 1, 1,
-0.4235675, -0.200832, -5.352247, 1, 1, 1, 1, 1,
-0.4189377, 0.3522053, 0.06986323, 1, 1, 1, 1, 1,
-0.4138771, -1.880561, -1.218698, 1, 1, 1, 1, 1,
-0.4009545, 0.7284585, -0.2131609, 1, 1, 1, 1, 1,
-0.3969481, 7.625791e-05, -0.6119002, 1, 1, 1, 1, 1,
-0.396428, -0.2052327, -0.9178802, 1, 1, 1, 1, 1,
-0.3884109, -0.7451569, -3.759793, 1, 1, 1, 1, 1,
-0.3853981, 0.0855689, -1.197533, 1, 1, 1, 1, 1,
-0.3850313, -1.072981, -3.663351, 1, 1, 1, 1, 1,
-0.3835307, -1.484483, -1.860957, 1, 1, 1, 1, 1,
-0.3805279, -0.9855217, -3.209587, 1, 1, 1, 1, 1,
-0.3775576, -0.5454622, -1.136197, 1, 1, 1, 1, 1,
-0.3775373, 1.399653, -0.349831, 1, 1, 1, 1, 1,
-0.3748797, -1.16271, -2.687871, 0, 0, 1, 1, 1,
-0.372085, -1.358077, -1.926749, 1, 0, 0, 1, 1,
-0.3682283, 0.01539474, -1.639955, 1, 0, 0, 1, 1,
-0.3675435, 0.9775034, -1.685266, 1, 0, 0, 1, 1,
-0.3632277, 1.31035, 0.3508996, 1, 0, 0, 1, 1,
-0.3623176, 0.4356688, 1.1171, 1, 0, 0, 1, 1,
-0.3610201, -1.013853, -3.429118, 0, 0, 0, 1, 1,
-0.3600774, -0.2015857, -1.456595, 0, 0, 0, 1, 1,
-0.3584779, 0.2696487, -0.8193631, 0, 0, 0, 1, 1,
-0.3548469, 2.785372, -0.7765244, 0, 0, 0, 1, 1,
-0.3542713, 0.1515701, -0.1851009, 0, 0, 0, 1, 1,
-0.3530826, -1.641096, -3.861239, 0, 0, 0, 1, 1,
-0.3497095, 0.3128354, -0.7586287, 0, 0, 0, 1, 1,
-0.3433529, -0.2546448, -0.7311437, 1, 1, 1, 1, 1,
-0.3390822, -0.2159463, -3.453978, 1, 1, 1, 1, 1,
-0.3371195, 0.03148116, -2.000715, 1, 1, 1, 1, 1,
-0.3368833, -0.3022525, -1.637213, 1, 1, 1, 1, 1,
-0.3358856, 0.450913, 0.09474534, 1, 1, 1, 1, 1,
-0.3349142, -0.07764889, -1.982223, 1, 1, 1, 1, 1,
-0.3325871, 1.449123, -0.596333, 1, 1, 1, 1, 1,
-0.3259704, 1.368333, 0.9348239, 1, 1, 1, 1, 1,
-0.3250735, -0.004798768, -1.241214, 1, 1, 1, 1, 1,
-0.3202164, 0.5337858, -2.758293, 1, 1, 1, 1, 1,
-0.3171337, 1.00625, 1.269722, 1, 1, 1, 1, 1,
-0.3160428, -0.1713229, -2.481256, 1, 1, 1, 1, 1,
-0.3135961, -0.4550538, -3.773336, 1, 1, 1, 1, 1,
-0.3125918, -1.135867, -3.960873, 1, 1, 1, 1, 1,
-0.3107921, 0.577108, -2.074479, 1, 1, 1, 1, 1,
-0.3102257, 0.788979, -0.5818923, 0, 0, 1, 1, 1,
-0.3093218, 2.143558, 0.4041674, 1, 0, 0, 1, 1,
-0.3009827, 0.6449175, -0.5343178, 1, 0, 0, 1, 1,
-0.2971461, -0.05147403, -1.847453, 1, 0, 0, 1, 1,
-0.2966472, -2.126488, -3.09654, 1, 0, 0, 1, 1,
-0.295471, 0.3324338, 2.195882, 1, 0, 0, 1, 1,
-0.2951773, -0.2057095, -0.3998938, 0, 0, 0, 1, 1,
-0.2916875, 0.3773592, -1.109122, 0, 0, 0, 1, 1,
-0.2814571, -1.081297, -2.872626, 0, 0, 0, 1, 1,
-0.2804461, -0.6077576, -2.967847, 0, 0, 0, 1, 1,
-0.2774287, 1.374035, 0.7403456, 0, 0, 0, 1, 1,
-0.2768805, 0.7243798, 0.1754304, 0, 0, 0, 1, 1,
-0.2718548, -1.311327, -2.734909, 0, 0, 0, 1, 1,
-0.2706843, 0.4198393, -0.1801127, 1, 1, 1, 1, 1,
-0.2664559, -0.4606544, -2.800249, 1, 1, 1, 1, 1,
-0.26103, -0.1440968, -3.488304, 1, 1, 1, 1, 1,
-0.2601473, 1.593801, 0.4347701, 1, 1, 1, 1, 1,
-0.2554432, -0.187412, -1.552856, 1, 1, 1, 1, 1,
-0.2505622, 1.951983, -1.091121, 1, 1, 1, 1, 1,
-0.246733, -2.892486, -4.335916, 1, 1, 1, 1, 1,
-0.2463586, -0.5351127, -1.545513, 1, 1, 1, 1, 1,
-0.245601, -0.07323724, -2.296696, 1, 1, 1, 1, 1,
-0.2439263, 2.280086, 0.5348091, 1, 1, 1, 1, 1,
-0.2423986, 0.6537755, -0.3511161, 1, 1, 1, 1, 1,
-0.242132, 1.310965, -0.3711064, 1, 1, 1, 1, 1,
-0.2366987, -0.8056102, -2.535499, 1, 1, 1, 1, 1,
-0.2338352, 1.455085, 1.035822, 1, 1, 1, 1, 1,
-0.231377, 0.6759055, -0.4712065, 1, 1, 1, 1, 1,
-0.2312777, 0.1970394, 0.2913578, 0, 0, 1, 1, 1,
-0.2270856, 0.9537681, -1.22225, 1, 0, 0, 1, 1,
-0.2252988, 1.14465, 0.5636756, 1, 0, 0, 1, 1,
-0.2245024, 0.5420641, -1.386568, 1, 0, 0, 1, 1,
-0.2243243, -0.940056, -3.294475, 1, 0, 0, 1, 1,
-0.2200958, 0.777579, 0.8617887, 1, 0, 0, 1, 1,
-0.220029, 0.4136175, -0.2487231, 0, 0, 0, 1, 1,
-0.2094616, -0.5094298, -2.772071, 0, 0, 0, 1, 1,
-0.2083469, 0.5276893, -1.132128, 0, 0, 0, 1, 1,
-0.2039969, 0.5468085, -0.3413152, 0, 0, 0, 1, 1,
-0.2029604, -0.9121628, -3.012242, 0, 0, 0, 1, 1,
-0.2007991, -1.396905, -3.919987, 0, 0, 0, 1, 1,
-0.1977705, -0.1517552, -3.864332, 0, 0, 0, 1, 1,
-0.1912251, -1.124, -3.918015, 1, 1, 1, 1, 1,
-0.1904878, -0.6912463, -2.880535, 1, 1, 1, 1, 1,
-0.1897998, -0.09539778, -2.169402, 1, 1, 1, 1, 1,
-0.1874554, 0.01227634, -0.7849247, 1, 1, 1, 1, 1,
-0.1850889, -0.6584694, -3.209285, 1, 1, 1, 1, 1,
-0.1840544, -1.548199, -3.864995, 1, 1, 1, 1, 1,
-0.1836351, 1.187215, 0.01177389, 1, 1, 1, 1, 1,
-0.1808737, -0.2792326, -2.938754, 1, 1, 1, 1, 1,
-0.1796317, 1.57429, -0.4182889, 1, 1, 1, 1, 1,
-0.1747493, 0.2665606, -0.2653972, 1, 1, 1, 1, 1,
-0.1727211, -0.2754336, -4.963301, 1, 1, 1, 1, 1,
-0.1685981, 1.587357, -0.3238058, 1, 1, 1, 1, 1,
-0.1653099, 1.448532, -0.9664599, 1, 1, 1, 1, 1,
-0.1625243, -0.6106216, -4.149743, 1, 1, 1, 1, 1,
-0.1619465, -0.2918253, -2.854388, 1, 1, 1, 1, 1,
-0.1614914, -1.756948, -4.039763, 0, 0, 1, 1, 1,
-0.1612017, 1.46867, 0.02610045, 1, 0, 0, 1, 1,
-0.1585732, 1.382202, 3.036812, 1, 0, 0, 1, 1,
-0.1485019, 1.707535, -0.2045219, 1, 0, 0, 1, 1,
-0.1452946, 0.410979, -0.06423801, 1, 0, 0, 1, 1,
-0.1447435, 0.1899168, -1.454326, 1, 0, 0, 1, 1,
-0.1357915, -0.2365554, -2.914686, 0, 0, 0, 1, 1,
-0.1356461, 0.101614, 0.3596938, 0, 0, 0, 1, 1,
-0.130169, -0.2803473, -3.317477, 0, 0, 0, 1, 1,
-0.1236045, 0.2453897, -1.344748, 0, 0, 0, 1, 1,
-0.122376, 0.4561669, 1.086049, 0, 0, 0, 1, 1,
-0.1209214, 0.6557278, 1.929407, 0, 0, 0, 1, 1,
-0.1124919, 0.7973147, 0.5988808, 0, 0, 0, 1, 1,
-0.1119221, -1.054093, -1.568262, 1, 1, 1, 1, 1,
-0.1112722, 0.3968474, -0.6707473, 1, 1, 1, 1, 1,
-0.1073684, 0.2784528, -1.698333, 1, 1, 1, 1, 1,
-0.1044154, -0.5696057, -2.680189, 1, 1, 1, 1, 1,
-0.1013411, 0.8784346, 0.9384802, 1, 1, 1, 1, 1,
-0.09879216, -0.7479554, -2.688318, 1, 1, 1, 1, 1,
-0.09823773, -0.5474174, -4.149574, 1, 1, 1, 1, 1,
-0.09735297, 0.1919855, 0.5131205, 1, 1, 1, 1, 1,
-0.09208892, 1.824684, 0.9164779, 1, 1, 1, 1, 1,
-0.09073703, -0.2982852, -3.370914, 1, 1, 1, 1, 1,
-0.08093917, 0.8520965, 0.1717856, 1, 1, 1, 1, 1,
-0.08090508, 0.3069397, -0.5421934, 1, 1, 1, 1, 1,
-0.08080236, 0.2915201, -0.63477, 1, 1, 1, 1, 1,
-0.0744672, 1.210833, 0.08059945, 1, 1, 1, 1, 1,
-0.06965367, -1.287561, -2.935151, 1, 1, 1, 1, 1,
-0.06929272, 0.9709564, 0.9505552, 0, 0, 1, 1, 1,
-0.05816294, 0.6903866, -0.14225, 1, 0, 0, 1, 1,
-0.05761023, 0.3424258, -0.271643, 1, 0, 0, 1, 1,
-0.05595651, 0.4796744, 0.8564643, 1, 0, 0, 1, 1,
-0.05289027, 0.755047, -0.2198604, 1, 0, 0, 1, 1,
-0.05198204, 1.371372, 1.177141, 1, 0, 0, 1, 1,
-0.04680961, 0.4898886, -0.4268536, 0, 0, 0, 1, 1,
-0.04238047, -0.7554456, -2.445124, 0, 0, 0, 1, 1,
-0.04210028, 0.7597127, 1.063997, 0, 0, 0, 1, 1,
-0.04165923, 0.3042333, -1.372202, 0, 0, 0, 1, 1,
-0.03696571, -0.7270165, -3.774331, 0, 0, 0, 1, 1,
-0.03332537, 0.1197102, 0.1702778, 0, 0, 0, 1, 1,
-0.03182901, 0.3097696, -0.5899739, 0, 0, 0, 1, 1,
-0.03164752, 0.3758404, -1.308926, 1, 1, 1, 1, 1,
-0.03152005, -2.072662, -3.521586, 1, 1, 1, 1, 1,
-0.02892078, -0.5904181, -2.198925, 1, 1, 1, 1, 1,
-0.02113618, 0.0896321, -0.1839223, 1, 1, 1, 1, 1,
-0.01911847, -0.2454753, -3.434873, 1, 1, 1, 1, 1,
-0.01765145, 1.852307, 0.4736786, 1, 1, 1, 1, 1,
-0.01641002, -1.096546, -2.53362, 1, 1, 1, 1, 1,
-0.01432604, -0.1789476, -1.037067, 1, 1, 1, 1, 1,
-0.01428339, 0.9782302, 0.07940838, 1, 1, 1, 1, 1,
-0.009568824, 0.8142645, 0.002075784, 1, 1, 1, 1, 1,
-0.008052329, -0.3963787, -3.549523, 1, 1, 1, 1, 1,
-0.005021394, -1.01685, -3.690424, 1, 1, 1, 1, 1,
-0.004266271, -0.8615085, -1.766902, 1, 1, 1, 1, 1,
0.009121547, -1.823349, 3.174032, 1, 1, 1, 1, 1,
0.01129908, 2.147303, -2.302265, 1, 1, 1, 1, 1,
0.0119973, -0.497283, 2.533867, 0, 0, 1, 1, 1,
0.0256213, 1.00186, 1.685611, 1, 0, 0, 1, 1,
0.02599406, 0.1975691, -0.1519691, 1, 0, 0, 1, 1,
0.02763442, 0.538581, 0.9848431, 1, 0, 0, 1, 1,
0.02926735, 0.3660969, 0.6058292, 1, 0, 0, 1, 1,
0.03138391, -2.265514, 2.406373, 1, 0, 0, 1, 1,
0.03174939, 0.06878486, 0.9345781, 0, 0, 0, 1, 1,
0.03238492, 1.076947, -0.1839854, 0, 0, 0, 1, 1,
0.03457658, 0.6585014, -0.3175785, 0, 0, 0, 1, 1,
0.03695634, 0.7337927, -2.065175, 0, 0, 0, 1, 1,
0.04169153, -0.09909751, 0.601028, 0, 0, 0, 1, 1,
0.04170945, 0.09249482, 1.007507, 0, 0, 0, 1, 1,
0.04278568, 0.662229, -0.9342682, 0, 0, 0, 1, 1,
0.04437438, -0.06314019, 1.789899, 1, 1, 1, 1, 1,
0.04641695, -2.428496, 3.966856, 1, 1, 1, 1, 1,
0.04762943, 0.5469204, -0.9930473, 1, 1, 1, 1, 1,
0.05170463, 0.8532795, 0.5027187, 1, 1, 1, 1, 1,
0.05540964, -1.38241, 2.293339, 1, 1, 1, 1, 1,
0.05844399, -0.5719365, 2.37758, 1, 1, 1, 1, 1,
0.05998948, 0.7708772, 0.00724798, 1, 1, 1, 1, 1,
0.06127102, 0.95592, -1.235255, 1, 1, 1, 1, 1,
0.06520291, -0.8559543, 2.125677, 1, 1, 1, 1, 1,
0.06556164, 1.68984, 0.8660185, 1, 1, 1, 1, 1,
0.06612267, 0.8459585, 0.2602901, 1, 1, 1, 1, 1,
0.06653582, -1.088657, 4.768577, 1, 1, 1, 1, 1,
0.06856736, 1.011781, -0.2883175, 1, 1, 1, 1, 1,
0.06873999, 0.2693864, 2.558608, 1, 1, 1, 1, 1,
0.07141948, 1.135408, -0.7469058, 1, 1, 1, 1, 1,
0.07432164, -0.2262819, 1.421867, 0, 0, 1, 1, 1,
0.07716018, -0.9452865, 3.60652, 1, 0, 0, 1, 1,
0.08169474, 2.284305, 0.4134142, 1, 0, 0, 1, 1,
0.08173044, 1.890754, -0.5942189, 1, 0, 0, 1, 1,
0.08444792, -0.2380145, 0.251175, 1, 0, 0, 1, 1,
0.08635605, 1.170456, 1.108414, 1, 0, 0, 1, 1,
0.08954041, -0.2596326, 1.823241, 0, 0, 0, 1, 1,
0.09000635, 0.9301448, 0.9418923, 0, 0, 0, 1, 1,
0.09002759, -0.09224191, 3.080585, 0, 0, 0, 1, 1,
0.09370076, -1.312804, 3.194593, 0, 0, 0, 1, 1,
0.09419794, -0.690945, 2.396228, 0, 0, 0, 1, 1,
0.09485402, -0.1539883, 4.612106, 0, 0, 0, 1, 1,
0.09583813, 0.1388652, 0.8375888, 0, 0, 0, 1, 1,
0.09912051, 1.935413, -1.072376, 1, 1, 1, 1, 1,
0.09998196, 0.2459197, -0.1746629, 1, 1, 1, 1, 1,
0.1107027, -1.795684, 2.031854, 1, 1, 1, 1, 1,
0.1121577, 0.5168465, -0.9336125, 1, 1, 1, 1, 1,
0.1137085, 0.29207, 3.152828, 1, 1, 1, 1, 1,
0.1143031, -0.2524497, 2.453627, 1, 1, 1, 1, 1,
0.1158181, -0.7762001, 2.193413, 1, 1, 1, 1, 1,
0.1164581, -0.9895855, 2.78064, 1, 1, 1, 1, 1,
0.128783, 0.409421, -1.123961, 1, 1, 1, 1, 1,
0.1313107, -0.1595311, 0.9327995, 1, 1, 1, 1, 1,
0.140202, 0.3107291, -0.3394169, 1, 1, 1, 1, 1,
0.1480896, -1.490065, 2.953885, 1, 1, 1, 1, 1,
0.1492267, 1.436512, -0.6322614, 1, 1, 1, 1, 1,
0.1503258, -1.425343, 3.318911, 1, 1, 1, 1, 1,
0.1504472, -1.58587, 3.276552, 1, 1, 1, 1, 1,
0.1504683, 0.1238348, 1.860397, 0, 0, 1, 1, 1,
0.151815, 0.5238183, 2.181035, 1, 0, 0, 1, 1,
0.1525223, 0.7434803, 2.362964, 1, 0, 0, 1, 1,
0.1584801, -0.6344948, 2.28825, 1, 0, 0, 1, 1,
0.1605776, -0.3657031, 2.266035, 1, 0, 0, 1, 1,
0.162848, 0.4989555, -0.2589816, 1, 0, 0, 1, 1,
0.1660332, 0.5640495, 0.1818889, 0, 0, 0, 1, 1,
0.1693013, 0.1040729, 0.2401142, 0, 0, 0, 1, 1,
0.1705151, -0.3926367, 2.74147, 0, 0, 0, 1, 1,
0.170974, 0.7731919, -0.1470723, 0, 0, 0, 1, 1,
0.1715236, -0.3030672, 1.741227, 0, 0, 0, 1, 1,
0.1716536, -1.967797, 3.840744, 0, 0, 0, 1, 1,
0.1730561, -0.4242236, 4.333157, 0, 0, 0, 1, 1,
0.1843354, 0.6540444, 0.590124, 1, 1, 1, 1, 1,
0.1878901, -0.8526854, 3.336709, 1, 1, 1, 1, 1,
0.1913246, 0.4988435, 2.07585, 1, 1, 1, 1, 1,
0.1951856, 0.05717589, 0.8911036, 1, 1, 1, 1, 1,
0.1968944, 0.74849, 1.771233, 1, 1, 1, 1, 1,
0.1970706, -0.3285246, 2.359693, 1, 1, 1, 1, 1,
0.2017553, 1.534376, -0.3669643, 1, 1, 1, 1, 1,
0.2018214, 0.8825252, 0.1785333, 1, 1, 1, 1, 1,
0.2020051, -2.039465, 3.985721, 1, 1, 1, 1, 1,
0.2067881, 0.9297263, -0.3607007, 1, 1, 1, 1, 1,
0.207967, 0.4240751, -0.2330297, 1, 1, 1, 1, 1,
0.2101782, 1.2903, 0.145502, 1, 1, 1, 1, 1,
0.2101803, 1.225812, 0.6743983, 1, 1, 1, 1, 1,
0.2146345, -0.2777768, 2.248013, 1, 1, 1, 1, 1,
0.2227316, -0.9432598, 4.021109, 1, 1, 1, 1, 1,
0.2245793, 0.1271908, 1.730986, 0, 0, 1, 1, 1,
0.225453, 1.893767, -0.2525256, 1, 0, 0, 1, 1,
0.2271013, -0.3902385, 3.204935, 1, 0, 0, 1, 1,
0.2296082, 0.1296186, -0.8191343, 1, 0, 0, 1, 1,
0.2319922, -1.426171, 3.475973, 1, 0, 0, 1, 1,
0.2319959, 0.9683388, 2.169436, 1, 0, 0, 1, 1,
0.2348368, 0.6181798, -0.4737875, 0, 0, 0, 1, 1,
0.2350252, -1.346511, 3.419526, 0, 0, 0, 1, 1,
0.2362364, 0.7544921, 1.147884, 0, 0, 0, 1, 1,
0.2383998, 1.146039, -1.34242, 0, 0, 0, 1, 1,
0.2439517, -0.7485501, 1.319346, 0, 0, 0, 1, 1,
0.2487621, 1.212391, -0.4025054, 0, 0, 0, 1, 1,
0.2551314, 1.058701, -0.2861248, 0, 0, 0, 1, 1,
0.2553482, -0.3963068, 2.83611, 1, 1, 1, 1, 1,
0.2554041, 0.7754502, 0.8532975, 1, 1, 1, 1, 1,
0.257045, -0.9535726, 3.578596, 1, 1, 1, 1, 1,
0.2607779, -0.722749, 4.014658, 1, 1, 1, 1, 1,
0.26293, -1.14993, 2.497626, 1, 1, 1, 1, 1,
0.2734821, 0.8229358, 1.094199, 1, 1, 1, 1, 1,
0.2753448, -0.005723028, 2.192882, 1, 1, 1, 1, 1,
0.2849278, -1.116406, 3.669688, 1, 1, 1, 1, 1,
0.2867266, 0.2204876, 1.179426, 1, 1, 1, 1, 1,
0.289479, 1.764472, 0.2476385, 1, 1, 1, 1, 1,
0.292132, -0.007733213, 0.9385694, 1, 1, 1, 1, 1,
0.2971315, -0.1025352, 2.111287, 1, 1, 1, 1, 1,
0.2988763, 0.8563185, 2.317901, 1, 1, 1, 1, 1,
0.3039435, 0.3069117, 0.5914887, 1, 1, 1, 1, 1,
0.3068226, 0.08941226, 0.9110088, 1, 1, 1, 1, 1,
0.3081912, -1.243171, 3.492428, 0, 0, 1, 1, 1,
0.3107692, 1.844159, 1.152329, 1, 0, 0, 1, 1,
0.3139206, -0.06356601, 3.88901, 1, 0, 0, 1, 1,
0.3171982, 0.5554971, -0.1953115, 1, 0, 0, 1, 1,
0.3204335, -0.270969, 2.711566, 1, 0, 0, 1, 1,
0.3223744, 1.579881, 0.5963084, 1, 0, 0, 1, 1,
0.3256412, 0.5823959, 0.1056163, 0, 0, 0, 1, 1,
0.3269837, 1.329069, -0.2957753, 0, 0, 0, 1, 1,
0.3298284, -1.521571, 2.838756, 0, 0, 0, 1, 1,
0.3309668, -1.085381, 3.010979, 0, 0, 0, 1, 1,
0.3316035, -0.51515, 1.306681, 0, 0, 0, 1, 1,
0.3339067, -0.3233919, 1.479831, 0, 0, 0, 1, 1,
0.3341233, -1.982119, 3.210815, 0, 0, 0, 1, 1,
0.3370128, -1.228816, 2.14215, 1, 1, 1, 1, 1,
0.338325, -1.084737, 3.470246, 1, 1, 1, 1, 1,
0.3428327, -0.7140388, 2.232264, 1, 1, 1, 1, 1,
0.3441533, 0.8233959, 0.9730871, 1, 1, 1, 1, 1,
0.3467358, 1.130926, 0.3197042, 1, 1, 1, 1, 1,
0.3477476, 0.5930873, 1.298856, 1, 1, 1, 1, 1,
0.3506916, -0.03410158, 1.452739, 1, 1, 1, 1, 1,
0.3512053, 0.7731532, -0.812192, 1, 1, 1, 1, 1,
0.354041, 0.4989725, -0.9396019, 1, 1, 1, 1, 1,
0.3555806, -0.5771503, 2.387425, 1, 1, 1, 1, 1,
0.3580158, 2.021007, 2.054273, 1, 1, 1, 1, 1,
0.3604163, -0.4588363, 2.941143, 1, 1, 1, 1, 1,
0.3608702, -3.235761, 3.839387, 1, 1, 1, 1, 1,
0.3631947, -0.9622902, 0.1963158, 1, 1, 1, 1, 1,
0.3688926, -0.969576, 1.432409, 1, 1, 1, 1, 1,
0.3726737, -0.3382123, 0.5500857, 0, 0, 1, 1, 1,
0.3748348, 0.4579798, 1.879152, 1, 0, 0, 1, 1,
0.3754902, -1.300406, 2.512129, 1, 0, 0, 1, 1,
0.3783038, 0.2836798, 0.6622506, 1, 0, 0, 1, 1,
0.3791942, -0.4887804, 2.237857, 1, 0, 0, 1, 1,
0.3847131, 1.552638, 0.7394577, 1, 0, 0, 1, 1,
0.3871897, 0.6796443, -0.0952228, 0, 0, 0, 1, 1,
0.3910241, -1.689126, 3.508146, 0, 0, 0, 1, 1,
0.400912, 1.085466, 0.8184541, 0, 0, 0, 1, 1,
0.4085462, 2.275225, -1.864716, 0, 0, 0, 1, 1,
0.4103434, 0.03322935, 3.099809, 0, 0, 0, 1, 1,
0.4140638, 0.02071924, 2.100386, 0, 0, 0, 1, 1,
0.4151864, -0.3918855, 0.5773892, 0, 0, 0, 1, 1,
0.4156298, 0.4483515, 0.3287002, 1, 1, 1, 1, 1,
0.417624, -1.127314, 3.211043, 1, 1, 1, 1, 1,
0.4295382, 0.9183992, 0.2681729, 1, 1, 1, 1, 1,
0.43132, 0.593812, 0.6693386, 1, 1, 1, 1, 1,
0.4358137, -0.4646608, 2.629578, 1, 1, 1, 1, 1,
0.436188, -0.3002249, 3.242352, 1, 1, 1, 1, 1,
0.4386943, 0.2108699, 0.7574812, 1, 1, 1, 1, 1,
0.4392321, 1.174336, 1.194309, 1, 1, 1, 1, 1,
0.4411196, -1.390972, 2.889326, 1, 1, 1, 1, 1,
0.4413678, 1.0988, 0.1147492, 1, 1, 1, 1, 1,
0.4475975, -0.3568839, 2.032472, 1, 1, 1, 1, 1,
0.4578163, -0.5109521, 4.063375, 1, 1, 1, 1, 1,
0.457885, 1.190788, -2.127596, 1, 1, 1, 1, 1,
0.4623589, -0.9661362, 2.913383, 1, 1, 1, 1, 1,
0.4641396, -1.830684, 2.887526, 1, 1, 1, 1, 1,
0.4715883, -0.5497176, 1.967298, 0, 0, 1, 1, 1,
0.48641, -1.524538, 4.090053, 1, 0, 0, 1, 1,
0.4868505, -0.9199494, 4.52241, 1, 0, 0, 1, 1,
0.4916712, 0.196408, 0.6240323, 1, 0, 0, 1, 1,
0.4941977, 0.5484647, 1.387087, 1, 0, 0, 1, 1,
0.4943528, 0.36034, -1.110698, 1, 0, 0, 1, 1,
0.4964306, -1.821457, 2.02593, 0, 0, 0, 1, 1,
0.4974739, -0.2566658, 1.862251, 0, 0, 0, 1, 1,
0.4976267, -0.09437856, 2.542701, 0, 0, 0, 1, 1,
0.4999982, 0.3124817, 2.178706, 0, 0, 0, 1, 1,
0.5047823, 0.4065477, 0.6921369, 0, 0, 0, 1, 1,
0.5101897, -0.019665, 2.074936, 0, 0, 0, 1, 1,
0.5112649, -0.01167192, 2.367186, 0, 0, 0, 1, 1,
0.5157611, 0.4148397, -0.1489651, 1, 1, 1, 1, 1,
0.5160762, -0.2534777, 3.670237, 1, 1, 1, 1, 1,
0.5162805, -0.533367, 1.748622, 1, 1, 1, 1, 1,
0.5164705, -1.69893, 4.110275, 1, 1, 1, 1, 1,
0.516483, 1.100013, -1.881551, 1, 1, 1, 1, 1,
0.5213077, 1.123938, 0.6214257, 1, 1, 1, 1, 1,
0.5227624, -0.3183279, 2.0468, 1, 1, 1, 1, 1,
0.5245681, 1.632189, -1.231964, 1, 1, 1, 1, 1,
0.532361, -0.4468879, 2.449581, 1, 1, 1, 1, 1,
0.5401556, -0.6903532, 3.091521, 1, 1, 1, 1, 1,
0.5424349, -0.5388553, 3.730337, 1, 1, 1, 1, 1,
0.5441518, 0.8347676, 1.950831, 1, 1, 1, 1, 1,
0.5494823, -1.03917, 2.317473, 1, 1, 1, 1, 1,
0.5523823, -0.7178624, 2.866119, 1, 1, 1, 1, 1,
0.554378, 1.395247, 0.1702695, 1, 1, 1, 1, 1,
0.5632027, -0.896472, 2.706582, 0, 0, 1, 1, 1,
0.5657225, -1.006595, 2.818175, 1, 0, 0, 1, 1,
0.5693411, 0.2606289, 1.970539, 1, 0, 0, 1, 1,
0.5763534, -0.7588421, 2.414925, 1, 0, 0, 1, 1,
0.5796782, 0.1609098, 1.538455, 1, 0, 0, 1, 1,
0.5803568, -1.951399, 3.58758, 1, 0, 0, 1, 1,
0.5815821, -0.3351559, 0.8240684, 0, 0, 0, 1, 1,
0.5823439, 0.5053678, 1.466417, 0, 0, 0, 1, 1,
0.5853095, 0.648711, 1.372555, 0, 0, 0, 1, 1,
0.5889834, 0.5297537, 1.090744, 0, 0, 0, 1, 1,
0.5954628, -1.526531, 2.137442, 0, 0, 0, 1, 1,
0.5965479, 0.4484813, 2.564108, 0, 0, 0, 1, 1,
0.5976205, 1.477656, 0.8918161, 0, 0, 0, 1, 1,
0.5976567, -0.2609038, 2.54626, 1, 1, 1, 1, 1,
0.6052732, 1.839627, 0.5925574, 1, 1, 1, 1, 1,
0.6064707, 0.1192399, 1.407892, 1, 1, 1, 1, 1,
0.6105462, -0.6822708, 4.135029, 1, 1, 1, 1, 1,
0.6157985, 0.2803783, 2.077734, 1, 1, 1, 1, 1,
0.618937, -1.414672, 2.957265, 1, 1, 1, 1, 1,
0.6228763, -0.2181221, 1.062043, 1, 1, 1, 1, 1,
0.6265954, 0.267215, 2.365183, 1, 1, 1, 1, 1,
0.627157, -1.789756, 1.706346, 1, 1, 1, 1, 1,
0.6295117, -0.6632995, 2.48262, 1, 1, 1, 1, 1,
0.6300031, 0.1474118, 2.277873, 1, 1, 1, 1, 1,
0.630439, -0.01753132, 2.676135, 1, 1, 1, 1, 1,
0.631178, 1.21316, -0.2678737, 1, 1, 1, 1, 1,
0.6339347, 2.398684, 0.03414439, 1, 1, 1, 1, 1,
0.6350583, 1.712151, 2.5817, 1, 1, 1, 1, 1,
0.6356457, 1.025222, 0.2175082, 0, 0, 1, 1, 1,
0.6373177, -0.1779756, 2.079128, 1, 0, 0, 1, 1,
0.6399639, 0.703238, 1.71298, 1, 0, 0, 1, 1,
0.6440632, 0.3337221, 2.061259, 1, 0, 0, 1, 1,
0.6473309, -0.3177271, 1.710493, 1, 0, 0, 1, 1,
0.6515008, -0.8307522, 2.64869, 1, 0, 0, 1, 1,
0.6626747, -0.5434933, 1.152394, 0, 0, 0, 1, 1,
0.6628072, 0.3033349, -1.66968, 0, 0, 0, 1, 1,
0.6692109, 0.7650849, 0.865787, 0, 0, 0, 1, 1,
0.6798099, -0.1606606, 2.548732, 0, 0, 0, 1, 1,
0.6854007, 1.299132, 1.110523, 0, 0, 0, 1, 1,
0.6870477, 0.8629289, 1.121344, 0, 0, 0, 1, 1,
0.6873164, -1.645567, 2.189362, 0, 0, 0, 1, 1,
0.6877227, 0.2993364, 1.327316, 1, 1, 1, 1, 1,
0.6913661, -2.537686, 3.46346, 1, 1, 1, 1, 1,
0.6939986, -0.8080876, 4.327772, 1, 1, 1, 1, 1,
0.7011848, -0.6581675, 3.493782, 1, 1, 1, 1, 1,
0.7030719, 0.2744729, 1.345519, 1, 1, 1, 1, 1,
0.7049413, -0.02594666, -1.002374, 1, 1, 1, 1, 1,
0.7184322, 0.3945702, 0.8709795, 1, 1, 1, 1, 1,
0.7212951, -1.067682, 0.1553055, 1, 1, 1, 1, 1,
0.7220301, 0.5017975, -0.531519, 1, 1, 1, 1, 1,
0.7257978, -0.3583685, 3.431949, 1, 1, 1, 1, 1,
0.7338398, -1.339617, 1.935671, 1, 1, 1, 1, 1,
0.7432736, 1.22089, -0.7051994, 1, 1, 1, 1, 1,
0.7453806, 0.5474472, 1.661379, 1, 1, 1, 1, 1,
0.7461727, 1.213656, 0.9115952, 1, 1, 1, 1, 1,
0.7500484, -0.9990196, 3.727799, 1, 1, 1, 1, 1,
0.7509411, -0.130177, 2.126363, 0, 0, 1, 1, 1,
0.7513385, -0.5845003, 2.270377, 1, 0, 0, 1, 1,
0.7522197, -0.3240774, 2.797866, 1, 0, 0, 1, 1,
0.7556854, 0.23632, 2.948718, 1, 0, 0, 1, 1,
0.758685, 0.3913244, 1.05927, 1, 0, 0, 1, 1,
0.7648512, 0.07458942, 2.200794, 1, 0, 0, 1, 1,
0.7711777, -0.3802747, 0.9755221, 0, 0, 0, 1, 1,
0.7731205, 1.39538, -0.1351562, 0, 0, 0, 1, 1,
0.7741839, -0.3070514, 1.765867, 0, 0, 0, 1, 1,
0.7794382, 0.2223958, 1.580628, 0, 0, 0, 1, 1,
0.7818039, -0.5271615, 3.753226, 0, 0, 0, 1, 1,
0.8098462, -1.055168, 1.413833, 0, 0, 0, 1, 1,
0.8110759, 0.0156431, 2.002181, 0, 0, 0, 1, 1,
0.8136376, 0.2355207, -0.5771119, 1, 1, 1, 1, 1,
0.825906, 1.595135, -0.2684763, 1, 1, 1, 1, 1,
0.828239, -1.250611, 3.246109, 1, 1, 1, 1, 1,
0.8390495, -0.5675569, 1.565526, 1, 1, 1, 1, 1,
0.849984, -0.3662499, 2.938636, 1, 1, 1, 1, 1,
0.8520392, 1.03101, -0.1133303, 1, 1, 1, 1, 1,
0.855385, 1.569624, -0.0541359, 1, 1, 1, 1, 1,
0.8597686, 1.528977, 1.191133, 1, 1, 1, 1, 1,
0.8623222, 0.2444934, 0.1626664, 1, 1, 1, 1, 1,
0.8637268, 0.08380625, 0.7433973, 1, 1, 1, 1, 1,
0.870446, 0.5340272, -1.36596, 1, 1, 1, 1, 1,
0.8716277, -0.1733458, 4.841274, 1, 1, 1, 1, 1,
0.8735062, -1.179937, 3.296657, 1, 1, 1, 1, 1,
0.8771685, 0.5466153, 0.5421036, 1, 1, 1, 1, 1,
0.8795719, -0.7974531, 3.426044, 1, 1, 1, 1, 1,
0.8800766, -0.1647537, 1.241274, 0, 0, 1, 1, 1,
0.8804055, 0.6379362, 0.3262203, 1, 0, 0, 1, 1,
0.8813862, -0.9007965, 3.295417, 1, 0, 0, 1, 1,
0.886558, -0.6527248, 2.889799, 1, 0, 0, 1, 1,
0.8870154, -0.3113356, 0.9624538, 1, 0, 0, 1, 1,
0.8884392, 0.2792, 0.3154836, 1, 0, 0, 1, 1,
0.8899415, -1.079305, 3.403205, 0, 0, 0, 1, 1,
0.8944731, 0.05302094, 1.72406, 0, 0, 0, 1, 1,
0.8988261, -1.21239, 1.507955, 0, 0, 0, 1, 1,
0.8991429, -2.677804, 2.427841, 0, 0, 0, 1, 1,
0.9065741, -0.8321061, 2.774203, 0, 0, 0, 1, 1,
0.9112065, -1.282447, 2.192905, 0, 0, 0, 1, 1,
0.9153382, -0.3438451, 0.6297036, 0, 0, 0, 1, 1,
0.9156535, 0.1355966, 2.433518, 1, 1, 1, 1, 1,
0.9172223, -1.785007, 1.392769, 1, 1, 1, 1, 1,
0.9217397, 0.4431293, 1.02745, 1, 1, 1, 1, 1,
0.930046, 0.01105238, 1.163465, 1, 1, 1, 1, 1,
0.9305828, -1.167285, -1.033473, 1, 1, 1, 1, 1,
0.9323761, -0.549795, 1.681265, 1, 1, 1, 1, 1,
0.9358481, 0.8499846, 0.1290996, 1, 1, 1, 1, 1,
0.9413706, -1.248332, -0.6240036, 1, 1, 1, 1, 1,
0.9417965, 0.8829328, 0.5798089, 1, 1, 1, 1, 1,
0.9516762, -2.192057, 2.770443, 1, 1, 1, 1, 1,
0.9567116, -0.02933958, 1.639889, 1, 1, 1, 1, 1,
0.9574271, 1.206506, 0.5096096, 1, 1, 1, 1, 1,
0.95994, -1.056429, 1.26972, 1, 1, 1, 1, 1,
0.9622099, 0.4700607, 0.8309807, 1, 1, 1, 1, 1,
0.9624983, 0.4628311, 0.2947149, 1, 1, 1, 1, 1,
0.964441, -0.2499153, 4.75431, 0, 0, 1, 1, 1,
0.9645888, -0.7038069, 3.62717, 1, 0, 0, 1, 1,
0.9676207, -0.06627606, 1.739387, 1, 0, 0, 1, 1,
0.968281, -1.292702, 3.26399, 1, 0, 0, 1, 1,
0.9797296, -0.1918546, 1.095536, 1, 0, 0, 1, 1,
0.9873629, -0.008837963, 1.54989, 1, 0, 0, 1, 1,
0.9902465, 1.079896, 0.9189295, 0, 0, 0, 1, 1,
0.9912053, 0.9348744, 1.138019, 0, 0, 0, 1, 1,
0.9934804, -0.7871822, 1.96783, 0, 0, 0, 1, 1,
0.9970221, -0.9692441, 1.063185, 0, 0, 0, 1, 1,
1.00256, 1.249271, 2.280926, 0, 0, 0, 1, 1,
1.002904, -0.8175556, 2.262975, 0, 0, 0, 1, 1,
1.005412, 0.4412606, 2.336948, 0, 0, 0, 1, 1,
1.008858, 1.139138, 1.671646, 1, 1, 1, 1, 1,
1.011007, 1.31343, 2.916157, 1, 1, 1, 1, 1,
1.015467, 0.3788845, 2.192118, 1, 1, 1, 1, 1,
1.017847, -1.171577, 3.857689, 1, 1, 1, 1, 1,
1.019172, 0.9415396, 1.742219, 1, 1, 1, 1, 1,
1.019416, 0.315251, 1.81625, 1, 1, 1, 1, 1,
1.028015, 1.238112, 1.269326, 1, 1, 1, 1, 1,
1.030948, -0.7944779, 3.189934, 1, 1, 1, 1, 1,
1.031732, 0.6319472, 1.80343, 1, 1, 1, 1, 1,
1.03417, 0.3871778, -0.3062303, 1, 1, 1, 1, 1,
1.036926, 0.3868943, 1.542524, 1, 1, 1, 1, 1,
1.037898, 0.5299432, -1.095923, 1, 1, 1, 1, 1,
1.042437, -0.6430956, 1.907433, 1, 1, 1, 1, 1,
1.04444, 0.1266843, 1.863703, 1, 1, 1, 1, 1,
1.044704, -0.5736813, 2.598179, 1, 1, 1, 1, 1,
1.049813, -2.519805, 2.604706, 0, 0, 1, 1, 1,
1.051448, -0.5556167, 3.21596, 1, 0, 0, 1, 1,
1.056308, -0.2393742, 0.9689884, 1, 0, 0, 1, 1,
1.063465, 0.4308175, 1.474258, 1, 0, 0, 1, 1,
1.071644, -1.111866, 3.136987, 1, 0, 0, 1, 1,
1.073331, -2.601176, 3.011685, 1, 0, 0, 1, 1,
1.076373, 0.05063577, 0.4697967, 0, 0, 0, 1, 1,
1.076721, -0.4516521, 1.553144, 0, 0, 0, 1, 1,
1.093003, 1.507469, 1.184874, 0, 0, 0, 1, 1,
1.095518, -0.7154507, 0.1857797, 0, 0, 0, 1, 1,
1.099184, 0.6430597, 0.004395131, 0, 0, 0, 1, 1,
1.100542, 0.7852883, 0.6831096, 0, 0, 0, 1, 1,
1.110003, 0.5185643, 3.042668, 0, 0, 0, 1, 1,
1.11165, -1.165075, 2.664812, 1, 1, 1, 1, 1,
1.125309, -1.928555, 3.301065, 1, 1, 1, 1, 1,
1.129292, -0.7074164, 2.493507, 1, 1, 1, 1, 1,
1.133158, 1.028978, 0.1605046, 1, 1, 1, 1, 1,
1.138424, -0.4342701, 1.445098, 1, 1, 1, 1, 1,
1.142197, 0.4988881, 3.347541, 1, 1, 1, 1, 1,
1.142993, -0.08647348, 2.754424, 1, 1, 1, 1, 1,
1.153105, 1.838243, 0.2219951, 1, 1, 1, 1, 1,
1.161305, 0.3219725, 1.545205, 1, 1, 1, 1, 1,
1.164828, -0.4744981, 2.11171, 1, 1, 1, 1, 1,
1.168584, -1.240781, 1.446559, 1, 1, 1, 1, 1,
1.171352, 0.2126731, 1.421622, 1, 1, 1, 1, 1,
1.174644, 0.02529945, 2.432743, 1, 1, 1, 1, 1,
1.174841, 1.029489, 0.03459813, 1, 1, 1, 1, 1,
1.176322, 0.5319969, 2.619218, 1, 1, 1, 1, 1,
1.176645, 1.287037, -1.089986, 0, 0, 1, 1, 1,
1.177542, 0.739579, 1.375573, 1, 0, 0, 1, 1,
1.18424, -0.1523135, 0.2576553, 1, 0, 0, 1, 1,
1.185927, 0.7435048, 1.712079, 1, 0, 0, 1, 1,
1.187748, -1.255764, 1.202119, 1, 0, 0, 1, 1,
1.190612, 1.247291, 1.335938, 1, 0, 0, 1, 1,
1.19062, -1.060927, 0.9521289, 0, 0, 0, 1, 1,
1.199899, 0.8696151, 1.250923, 0, 0, 0, 1, 1,
1.200411, 1.701626, 0.6226192, 0, 0, 0, 1, 1,
1.212433, 0.7084536, 0.63111, 0, 0, 0, 1, 1,
1.21708, 0.4107203, -0.206334, 0, 0, 0, 1, 1,
1.219516, 0.0150999, -0.07945929, 0, 0, 0, 1, 1,
1.227176, 2.221869, 1.1888, 0, 0, 0, 1, 1,
1.227959, 1.030924, 1.967017, 1, 1, 1, 1, 1,
1.233791, -0.1844134, 2.893117, 1, 1, 1, 1, 1,
1.253223, 1.597022, 0.3291755, 1, 1, 1, 1, 1,
1.255476, -0.57548, 2.869713, 1, 1, 1, 1, 1,
1.268909, 0.2494862, 0.8511966, 1, 1, 1, 1, 1,
1.270123, 0.03065559, 1.679064, 1, 1, 1, 1, 1,
1.270297, 0.6315178, 3.033096, 1, 1, 1, 1, 1,
1.282034, -0.2495242, 1.402882, 1, 1, 1, 1, 1,
1.293185, 1.478593, 0.1261208, 1, 1, 1, 1, 1,
1.296896, 0.7289874, 1.358409, 1, 1, 1, 1, 1,
1.305141, 1.025673, -0.5185279, 1, 1, 1, 1, 1,
1.314547, 1.104783, 0.9025761, 1, 1, 1, 1, 1,
1.31557, 1.829567, -0.78426, 1, 1, 1, 1, 1,
1.324667, 0.00655509, 1.382021, 1, 1, 1, 1, 1,
1.326166, -0.4316925, 0.3945325, 1, 1, 1, 1, 1,
1.335982, 0.3693382, 2.931864, 0, 0, 1, 1, 1,
1.338172, 1.044619, -0.9219719, 1, 0, 0, 1, 1,
1.339076, -1.095385, 0.9952488, 1, 0, 0, 1, 1,
1.343221, 0.1172797, 2.406538, 1, 0, 0, 1, 1,
1.343506, 0.03399189, 1.623669, 1, 0, 0, 1, 1,
1.345531, 1.303376, 1.066309, 1, 0, 0, 1, 1,
1.349718, -0.168009, 4.469199, 0, 0, 0, 1, 1,
1.357396, -1.185747, 0.9927204, 0, 0, 0, 1, 1,
1.358684, -2.107654, 4.485405, 0, 0, 0, 1, 1,
1.359513, 2.11832, 0.07357586, 0, 0, 0, 1, 1,
1.361148, 0.9522578, 2.580677, 0, 0, 0, 1, 1,
1.362394, 0.4522874, 0.677481, 0, 0, 0, 1, 1,
1.362518, 0.03381437, 1.592074, 0, 0, 0, 1, 1,
1.364394, -1.058285, 1.484777, 1, 1, 1, 1, 1,
1.367842, -1.873425, 2.615638, 1, 1, 1, 1, 1,
1.376869, 1.506022, 0.05814299, 1, 1, 1, 1, 1,
1.395232, -1.997605, 1.942236, 1, 1, 1, 1, 1,
1.401209, 0.7244871, 1.792518, 1, 1, 1, 1, 1,
1.404407, 0.04700552, 0.3282619, 1, 1, 1, 1, 1,
1.407315, -1.072516, 3.187771, 1, 1, 1, 1, 1,
1.408574, -0.8794766, 3.727659, 1, 1, 1, 1, 1,
1.416454, 0.009580047, 1.787065, 1, 1, 1, 1, 1,
1.419637, -3.134154, 2.821767, 1, 1, 1, 1, 1,
1.427195, 2.125562, -0.6111147, 1, 1, 1, 1, 1,
1.43704, 1.73762, -0.2639785, 1, 1, 1, 1, 1,
1.447516, -0.2160674, 3.299529, 1, 1, 1, 1, 1,
1.451653, -1.250742, 3.119505, 1, 1, 1, 1, 1,
1.464568, -0.6062689, 2.099219, 1, 1, 1, 1, 1,
1.465167, -0.6110668, 1.128571, 0, 0, 1, 1, 1,
1.473321, -1.210153, 0.9521043, 1, 0, 0, 1, 1,
1.476089, 0.1249203, 3.821056, 1, 0, 0, 1, 1,
1.484953, -0.5257881, 1.886813, 1, 0, 0, 1, 1,
1.493446, -0.7079319, 2.096337, 1, 0, 0, 1, 1,
1.496809, 0.184646, 0.5823615, 1, 0, 0, 1, 1,
1.51089, 0.6468574, 1.767374, 0, 0, 0, 1, 1,
1.513352, 0.8006753, 0.5986462, 0, 0, 0, 1, 1,
1.517989, -1.257536, 1.183993, 0, 0, 0, 1, 1,
1.520579, 0.6100923, 0.9917949, 0, 0, 0, 1, 1,
1.534399, -0.2767776, 0.7952636, 0, 0, 0, 1, 1,
1.535187, 1.325951, 0.5331603, 0, 0, 0, 1, 1,
1.538476, 1.027976, 1.747721, 0, 0, 0, 1, 1,
1.550624, 1.189505, 0.8443089, 1, 1, 1, 1, 1,
1.569964, -0.7931924, 0.4510112, 1, 1, 1, 1, 1,
1.586736, 0.05862281, 1.470263, 1, 1, 1, 1, 1,
1.588098, 0.2271607, 0.989781, 1, 1, 1, 1, 1,
1.589937, -1.595579, 2.818413, 1, 1, 1, 1, 1,
1.602022, 0.4197274, -0.03451343, 1, 1, 1, 1, 1,
1.612204, 0.648695, 0.4586059, 1, 1, 1, 1, 1,
1.619941, 0.2011501, 0.2367724, 1, 1, 1, 1, 1,
1.62051, -0.1987014, 1.523594, 1, 1, 1, 1, 1,
1.621642, 0.3997687, 0.7135291, 1, 1, 1, 1, 1,
1.62822, 0.4055564, 0.9059364, 1, 1, 1, 1, 1,
1.636336, 1.013916, 1.019693, 1, 1, 1, 1, 1,
1.641138, 0.2299488, 1.190536, 1, 1, 1, 1, 1,
1.646836, 0.542947, 2.08274, 1, 1, 1, 1, 1,
1.674755, 0.2171829, 1.183061, 1, 1, 1, 1, 1,
1.677149, 0.1765319, 2.277409, 0, 0, 1, 1, 1,
1.680862, -0.5482824, 3.057903, 1, 0, 0, 1, 1,
1.703539, -0.3743281, 1.049626, 1, 0, 0, 1, 1,
1.724767, -0.6641989, 2.034378, 1, 0, 0, 1, 1,
1.728152, 0.3006821, 1.842895, 1, 0, 0, 1, 1,
1.74442, -0.6378801, 1.397562, 1, 0, 0, 1, 1,
1.751635, -0.2292022, 1.376206, 0, 0, 0, 1, 1,
1.774266, -0.6796232, 3.338602, 0, 0, 0, 1, 1,
1.779857, 0.6989766, 1.451179, 0, 0, 0, 1, 1,
1.785524, 0.08147183, 0.3973693, 0, 0, 0, 1, 1,
1.789752, 0.2843852, 0.6342044, 0, 0, 0, 1, 1,
1.790683, 0.1551849, 2.084531, 0, 0, 0, 1, 1,
1.791025, -0.1310909, 1.61377, 0, 0, 0, 1, 1,
1.81494, -1.058578, 2.930344, 1, 1, 1, 1, 1,
1.839731, 0.9205706, 0.223398, 1, 1, 1, 1, 1,
1.840835, -1.115203, 1.499095, 1, 1, 1, 1, 1,
1.848557, -0.1921839, 1.916702, 1, 1, 1, 1, 1,
1.857907, 1.945892, 0.7347301, 1, 1, 1, 1, 1,
1.874642, -0.1997872, 3.912054, 1, 1, 1, 1, 1,
1.879071, -1.393045, 0.9122429, 1, 1, 1, 1, 1,
1.896875, -1.012312, 2.281117, 1, 1, 1, 1, 1,
1.916966, 1.195894, 1.185655, 1, 1, 1, 1, 1,
1.920089, -0.853478, 2.413758, 1, 1, 1, 1, 1,
1.953347, -0.7589933, 2.227531, 1, 1, 1, 1, 1,
1.994985, 0.7601693, 0.5393552, 1, 1, 1, 1, 1,
2.043729, -0.4212812, 0.6119133, 1, 1, 1, 1, 1,
2.105903, 1.109511, 2.161351, 1, 1, 1, 1, 1,
2.115342, 0.7168264, 0.2142839, 1, 1, 1, 1, 1,
2.14843, -0.4287888, 2.257113, 0, 0, 1, 1, 1,
2.165871, 0.2755301, 2.024371, 1, 0, 0, 1, 1,
2.1845, -2.192471, 0.9532333, 1, 0, 0, 1, 1,
2.194738, 0.3322829, 0.3927983, 1, 0, 0, 1, 1,
2.202145, 0.655136, 1.665989, 1, 0, 0, 1, 1,
2.259786, -0.9456234, 2.083244, 1, 0, 0, 1, 1,
2.264582, 2.119239, -0.05843776, 0, 0, 0, 1, 1,
2.292871, 1.318412, 0.4717517, 0, 0, 0, 1, 1,
2.348388, -0.8956159, 1.911931, 0, 0, 0, 1, 1,
2.439586, -1.316375, 2.993077, 0, 0, 0, 1, 1,
2.444408, -1.117839, 2.463865, 0, 0, 0, 1, 1,
2.531247, -1.747493, 3.218864, 0, 0, 0, 1, 1,
2.546626, -0.4415172, 2.540755, 0, 0, 0, 1, 1,
2.550477, -0.7075775, 2.379377, 1, 1, 1, 1, 1,
2.646117, 1.358083, 0.7668628, 1, 1, 1, 1, 1,
2.646674, -0.1010206, 1.703625, 1, 1, 1, 1, 1,
2.663754, -0.6727852, 2.793423, 1, 1, 1, 1, 1,
2.68503, 1.120319, 1.800696, 1, 1, 1, 1, 1,
2.748876, -0.6815289, 1.357058, 1, 1, 1, 1, 1,
3.041815, -0.1644037, 0.6003428, 1, 1, 1, 1, 1
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
var radius = 9.358947;
var distance = 32.87291;
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
mvMatrix.translate( 0.2029734, 0.1850221, 0.2554865 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.87291);
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
