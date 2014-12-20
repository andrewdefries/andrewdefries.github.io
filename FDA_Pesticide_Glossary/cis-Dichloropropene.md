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
-3.245002, 0.2621458, -0.8021579, 1, 0, 0, 1,
-2.959581, -1.259865, -3.472172, 1, 0.007843138, 0, 1,
-2.885707, -0.6417958, -2.830952, 1, 0.01176471, 0, 1,
-2.750694, -1.019162, -3.896562, 1, 0.01960784, 0, 1,
-2.517569, -0.6542873, -0.01835282, 1, 0.02352941, 0, 1,
-2.488454, -0.9703017, -2.158238, 1, 0.03137255, 0, 1,
-2.480507, -0.7347695, -3.139601, 1, 0.03529412, 0, 1,
-2.369183, -0.291385, -1.700166, 1, 0.04313726, 0, 1,
-2.368034, 0.4288743, 1.017862, 1, 0.04705882, 0, 1,
-2.352738, 1.540159, 0.7867857, 1, 0.05490196, 0, 1,
-2.329225, -1.355726, -1.797339, 1, 0.05882353, 0, 1,
-2.306014, 0.454123, -0.9601552, 1, 0.06666667, 0, 1,
-2.299999, -1.121765, -3.349453, 1, 0.07058824, 0, 1,
-2.265709, -1.685882, -1.747184, 1, 0.07843138, 0, 1,
-2.262132, -1.44811, -3.673692, 1, 0.08235294, 0, 1,
-2.247872, -1.39852, -2.407426, 1, 0.09019608, 0, 1,
-2.239898, 0.04658892, -0.9157465, 1, 0.09411765, 0, 1,
-2.207644, -0.1560931, -2.369009, 1, 0.1019608, 0, 1,
-2.167221, 1.218016, -1.525588, 1, 0.1098039, 0, 1,
-2.166403, 0.1013934, -1.269868, 1, 0.1137255, 0, 1,
-2.141021, -0.8886299, -2.34795, 1, 0.1215686, 0, 1,
-2.096963, 0.7180213, -1.999084, 1, 0.1254902, 0, 1,
-2.093594, 0.5914473, -1.850214, 1, 0.1333333, 0, 1,
-2.092728, 0.2854181, -2.034658, 1, 0.1372549, 0, 1,
-2.087527, -0.3858599, -0.7876483, 1, 0.145098, 0, 1,
-2.040293, 0.4928369, -0.5478907, 1, 0.1490196, 0, 1,
-2.011708, 0.3528668, -0.2115616, 1, 0.1568628, 0, 1,
-1.9905, -0.4040638, -2.274747, 1, 0.1607843, 0, 1,
-1.983266, -0.6035111, -0.4761666, 1, 0.1686275, 0, 1,
-1.976463, 0.05042842, -0.3847126, 1, 0.172549, 0, 1,
-1.969677, 1.346415, -0.7897987, 1, 0.1803922, 0, 1,
-1.955086, 0.6279815, -1.786426, 1, 0.1843137, 0, 1,
-1.945885, -0.699492, -1.295451, 1, 0.1921569, 0, 1,
-1.942921, -0.2383208, -1.101244, 1, 0.1960784, 0, 1,
-1.926761, -0.9656122, 1.254918, 1, 0.2039216, 0, 1,
-1.900165, -0.6800815, -1.17087, 1, 0.2117647, 0, 1,
-1.898008, 0.2546634, -3.753238, 1, 0.2156863, 0, 1,
-1.897001, 0.2794666, -1.262623, 1, 0.2235294, 0, 1,
-1.895549, 1.540341, 0.1173823, 1, 0.227451, 0, 1,
-1.877878, -2.69867, -3.684087, 1, 0.2352941, 0, 1,
-1.872163, 0.5143764, -0.6259081, 1, 0.2392157, 0, 1,
-1.865959, 0.8259507, -0.8779248, 1, 0.2470588, 0, 1,
-1.865195, 0.709907, -1.808143, 1, 0.2509804, 0, 1,
-1.825961, 0.938053, -1.476737, 1, 0.2588235, 0, 1,
-1.822379, -1.679571, -1.364719, 1, 0.2627451, 0, 1,
-1.808489, 0.5398905, 0.2395909, 1, 0.2705882, 0, 1,
-1.797737, -0.5589952, -2.507827, 1, 0.2745098, 0, 1,
-1.791528, -0.5285702, -3.155679, 1, 0.282353, 0, 1,
-1.784677, -0.1927204, -1.440412, 1, 0.2862745, 0, 1,
-1.784037, -0.234965, -1.699458, 1, 0.2941177, 0, 1,
-1.776809, 1.164516, -0.8058314, 1, 0.3019608, 0, 1,
-1.767211, 1.368591, -2.653908, 1, 0.3058824, 0, 1,
-1.75293, 0.7372152, -2.106695, 1, 0.3137255, 0, 1,
-1.74973, 1.747812, -1.801892, 1, 0.3176471, 0, 1,
-1.712445, -1.128473, -3.121246, 1, 0.3254902, 0, 1,
-1.703745, 1.45792, -1.767554, 1, 0.3294118, 0, 1,
-1.699665, 0.9212385, -2.863374, 1, 0.3372549, 0, 1,
-1.694516, 0.9267341, 0.10057, 1, 0.3411765, 0, 1,
-1.679713, 0.3693235, -1.980274, 1, 0.3490196, 0, 1,
-1.654925, -0.7619515, -1.936117, 1, 0.3529412, 0, 1,
-1.654601, -0.4403415, -0.9753205, 1, 0.3607843, 0, 1,
-1.650074, -1.128352, -3.393711, 1, 0.3647059, 0, 1,
-1.623974, -1.621038, -2.98664, 1, 0.372549, 0, 1,
-1.623705, -0.07665776, -2.2315, 1, 0.3764706, 0, 1,
-1.619777, 1.411094, -1.822852, 1, 0.3843137, 0, 1,
-1.600612, -0.7569539, -2.880089, 1, 0.3882353, 0, 1,
-1.586746, -0.5026121, -2.205759, 1, 0.3960784, 0, 1,
-1.585667, 0.1758327, -1.822482, 1, 0.4039216, 0, 1,
-1.578282, 0.2079643, -3.111117, 1, 0.4078431, 0, 1,
-1.568849, -0.3892463, -2.826307, 1, 0.4156863, 0, 1,
-1.568309, -1.356025, -2.348425, 1, 0.4196078, 0, 1,
-1.562462, 0.08854029, -1.91929, 1, 0.427451, 0, 1,
-1.558971, -1.27253, -3.921591, 1, 0.4313726, 0, 1,
-1.557038, -0.7585308, -2.181013, 1, 0.4392157, 0, 1,
-1.555393, -0.08168057, -0.7055583, 1, 0.4431373, 0, 1,
-1.548278, 1.852377, -2.91497, 1, 0.4509804, 0, 1,
-1.541125, 0.314469, -0.4514081, 1, 0.454902, 0, 1,
-1.540835, 1.111432, 0.6966873, 1, 0.4627451, 0, 1,
-1.53706, 1.189153, -3.082262, 1, 0.4666667, 0, 1,
-1.535382, 1.372585, -1.472104, 1, 0.4745098, 0, 1,
-1.52132, 0.736547, -1.275402, 1, 0.4784314, 0, 1,
-1.517507, 1.004858, -2.727834, 1, 0.4862745, 0, 1,
-1.500341, 0.9687843, 1.704551, 1, 0.4901961, 0, 1,
-1.496103, 0.05962892, 0.2420337, 1, 0.4980392, 0, 1,
-1.49067, -0.3010057, -0.8295926, 1, 0.5058824, 0, 1,
-1.483006, 0.3220988, -0.3083808, 1, 0.509804, 0, 1,
-1.470483, 1.465925, -1.678483, 1, 0.5176471, 0, 1,
-1.461131, 0.3677627, 0.1592411, 1, 0.5215687, 0, 1,
-1.45752, 1.078847, -0.6835205, 1, 0.5294118, 0, 1,
-1.439616, -0.04879779, -1.977619, 1, 0.5333334, 0, 1,
-1.426732, -0.5700403, -2.737827, 1, 0.5411765, 0, 1,
-1.423603, 0.1505097, -2.959138, 1, 0.5450981, 0, 1,
-1.418601, 0.1236076, -0.8710839, 1, 0.5529412, 0, 1,
-1.416484, 0.01755776, -2.211179, 1, 0.5568628, 0, 1,
-1.410699, -0.421792, -1.122641, 1, 0.5647059, 0, 1,
-1.410042, 0.07796346, -1.208154, 1, 0.5686275, 0, 1,
-1.409145, -0.5832694, -2.007004, 1, 0.5764706, 0, 1,
-1.403754, 1.300435, -1.018013, 1, 0.5803922, 0, 1,
-1.392472, 0.4724776, -0.966225, 1, 0.5882353, 0, 1,
-1.390305, -0.3579467, -1.297999, 1, 0.5921569, 0, 1,
-1.381619, 1.046811, 0.5348222, 1, 0.6, 0, 1,
-1.380799, 0.431215, -2.967702, 1, 0.6078432, 0, 1,
-1.378181, -0.8847333, -1.767455, 1, 0.6117647, 0, 1,
-1.37448, 0.5657812, -1.500741, 1, 0.6196079, 0, 1,
-1.371342, 1.699072, -0.3629214, 1, 0.6235294, 0, 1,
-1.366945, 0.7812472, -1.439972, 1, 0.6313726, 0, 1,
-1.365347, -0.2129272, -3.7574, 1, 0.6352941, 0, 1,
-1.363498, -0.4411069, -1.153301, 1, 0.6431373, 0, 1,
-1.362554, 0.5322456, -1.59099, 1, 0.6470588, 0, 1,
-1.361101, 1.436006, -1.822235, 1, 0.654902, 0, 1,
-1.356271, 2.39722, -1.509071, 1, 0.6588235, 0, 1,
-1.354616, 1.63314, -0.08608674, 1, 0.6666667, 0, 1,
-1.353583, -0.6119799, -2.960566, 1, 0.6705883, 0, 1,
-1.34469, -1.389264, -2.07432, 1, 0.6784314, 0, 1,
-1.343507, -0.08402832, -2.659386, 1, 0.682353, 0, 1,
-1.341802, 0.8307326, -0.7466617, 1, 0.6901961, 0, 1,
-1.33066, 0.575609, 1.019276, 1, 0.6941177, 0, 1,
-1.32256, 0.3717017, -1.66179, 1, 0.7019608, 0, 1,
-1.313039, 0.2466413, -1.852409, 1, 0.7098039, 0, 1,
-1.30608, 0.2040086, -3.204333, 1, 0.7137255, 0, 1,
-1.298041, -0.2721654, -0.9434894, 1, 0.7215686, 0, 1,
-1.284192, -0.5696297, -2.033407, 1, 0.7254902, 0, 1,
-1.273759, -0.9629502, -2.708692, 1, 0.7333333, 0, 1,
-1.272615, 0.3614834, -1.338747, 1, 0.7372549, 0, 1,
-1.271271, -1.513418, 0.2150996, 1, 0.7450981, 0, 1,
-1.263561, 0.9169596, -1.631577, 1, 0.7490196, 0, 1,
-1.26324, -1.133967, -2.925709, 1, 0.7568628, 0, 1,
-1.262209, -0.4693946, -2.539008, 1, 0.7607843, 0, 1,
-1.248808, 0.2789414, -1.529586, 1, 0.7686275, 0, 1,
-1.246427, -0.4272549, -1.396839, 1, 0.772549, 0, 1,
-1.237221, 0.1576833, -2.180966, 1, 0.7803922, 0, 1,
-1.235086, -0.9273033, -1.317869, 1, 0.7843137, 0, 1,
-1.22824, -0.03563982, 0.2678992, 1, 0.7921569, 0, 1,
-1.219984, -1.101612, -1.536169, 1, 0.7960784, 0, 1,
-1.195894, -0.2286031, -2.543051, 1, 0.8039216, 0, 1,
-1.19202, -0.6116083, -3.21249, 1, 0.8117647, 0, 1,
-1.189828, 1.421707, -1.422736, 1, 0.8156863, 0, 1,
-1.186256, -0.1010861, -1.142744, 1, 0.8235294, 0, 1,
-1.177659, -0.7702985, -3.173853, 1, 0.827451, 0, 1,
-1.175898, 0.3768526, -0.3941745, 1, 0.8352941, 0, 1,
-1.169834, 0.09619308, 0.04518639, 1, 0.8392157, 0, 1,
-1.168535, 1.352502, 0.1797508, 1, 0.8470588, 0, 1,
-1.161496, 0.1943989, -3.329537, 1, 0.8509804, 0, 1,
-1.154893, 0.8548332, -0.8697261, 1, 0.8588235, 0, 1,
-1.154271, 0.1528224, -0.5851215, 1, 0.8627451, 0, 1,
-1.153349, -0.003729428, -1.674844, 1, 0.8705882, 0, 1,
-1.149818, -0.9314845, -2.264876, 1, 0.8745098, 0, 1,
-1.144263, 0.6790436, -1.655085, 1, 0.8823529, 0, 1,
-1.132772, -3.958176, -3.203387, 1, 0.8862745, 0, 1,
-1.131784, -0.9235995, -0.6509562, 1, 0.8941177, 0, 1,
-1.121256, -0.8291956, -1.882302, 1, 0.8980392, 0, 1,
-1.112549, 0.500358, -1.926613, 1, 0.9058824, 0, 1,
-1.10092, -0.7617281, -1.480896, 1, 0.9137255, 0, 1,
-1.099736, -0.2362636, -1.710011, 1, 0.9176471, 0, 1,
-1.098642, -0.01411821, -1.36487, 1, 0.9254902, 0, 1,
-1.097517, 0.8225902, -1.553349, 1, 0.9294118, 0, 1,
-1.095569, 0.7949857, -1.117221, 1, 0.9372549, 0, 1,
-1.094364, -1.727619, -2.643441, 1, 0.9411765, 0, 1,
-1.092796, 1.210577, 0.4261008, 1, 0.9490196, 0, 1,
-1.089957, -0.8013, -3.584785, 1, 0.9529412, 0, 1,
-1.072391, 0.4411368, -0.8968629, 1, 0.9607843, 0, 1,
-1.071826, 0.8463386, -1.068564, 1, 0.9647059, 0, 1,
-1.071322, -0.9893424, -0.7346491, 1, 0.972549, 0, 1,
-1.069624, 1.114624, 0.6233142, 1, 0.9764706, 0, 1,
-1.068715, 1.044212, 0.09913645, 1, 0.9843137, 0, 1,
-1.066554, 0.0005289094, -1.37898, 1, 0.9882353, 0, 1,
-1.064819, 1.535357, -1.249445, 1, 0.9960784, 0, 1,
-1.063443, -1.611996, -1.763541, 0.9960784, 1, 0, 1,
-1.057127, -0.0396088, -0.6461791, 0.9921569, 1, 0, 1,
-1.054302, -0.5890407, -0.7374265, 0.9843137, 1, 0, 1,
-1.042025, -0.2651482, -1.748959, 0.9803922, 1, 0, 1,
-1.034512, 1.258432, -0.2408946, 0.972549, 1, 0, 1,
-1.028515, 1.514244, -1.60683, 0.9686275, 1, 0, 1,
-1.028081, -0.9595991, -2.463248, 0.9607843, 1, 0, 1,
-1.026436, -0.9335089, -2.223392, 0.9568627, 1, 0, 1,
-1.025643, -0.4709552, -1.323555, 0.9490196, 1, 0, 1,
-1.018826, 0.8521273, 0.4298777, 0.945098, 1, 0, 1,
-1.014091, 0.2806786, -1.091974, 0.9372549, 1, 0, 1,
-1.01363, 1.959546, 0.3455447, 0.9333333, 1, 0, 1,
-1.007451, 1.803972, 2.240195, 0.9254902, 1, 0, 1,
-1.000974, 1.024809, -0.9669396, 0.9215686, 1, 0, 1,
-0.9997026, 1.306865, 1.285981, 0.9137255, 1, 0, 1,
-0.9979324, 0.09351568, 0.6470926, 0.9098039, 1, 0, 1,
-0.9938371, -0.06898141, -1.409319, 0.9019608, 1, 0, 1,
-0.9913188, -0.1899395, -1.971287, 0.8941177, 1, 0, 1,
-0.9911063, -0.1631423, -2.494897, 0.8901961, 1, 0, 1,
-0.9909165, -0.6050655, -1.841844, 0.8823529, 1, 0, 1,
-0.9876637, -0.3114884, -1.249592, 0.8784314, 1, 0, 1,
-0.9864317, -0.2955314, 0.142084, 0.8705882, 1, 0, 1,
-0.9829987, 0.01790877, -0.08746819, 0.8666667, 1, 0, 1,
-0.9824239, 0.5328379, -1.241685, 0.8588235, 1, 0, 1,
-0.9794419, -2.453357, 0.5509687, 0.854902, 1, 0, 1,
-0.9677752, -0.1685977, -2.812466, 0.8470588, 1, 0, 1,
-0.9587222, 0.4226831, -1.536441, 0.8431373, 1, 0, 1,
-0.9554541, -0.5222172, -0.418489, 0.8352941, 1, 0, 1,
-0.9547228, 0.01506218, -2.568059, 0.8313726, 1, 0, 1,
-0.9538591, -1.588757, -2.417716, 0.8235294, 1, 0, 1,
-0.9482187, -0.7987055, -0.46534, 0.8196079, 1, 0, 1,
-0.9463179, -0.2950393, -1.606594, 0.8117647, 1, 0, 1,
-0.9401507, -0.5577547, 0.004586479, 0.8078431, 1, 0, 1,
-0.9358923, -0.5614719, -1.444295, 0.8, 1, 0, 1,
-0.925538, -0.2273915, -0.3949718, 0.7921569, 1, 0, 1,
-0.9247886, -2.053175, -1.700175, 0.7882353, 1, 0, 1,
-0.9206389, -0.9238496, -3.137643, 0.7803922, 1, 0, 1,
-0.9202337, 1.962581, 1.370813, 0.7764706, 1, 0, 1,
-0.9200671, -0.114758, -1.316481, 0.7686275, 1, 0, 1,
-0.9151856, 0.4734405, -2.141678, 0.7647059, 1, 0, 1,
-0.9148183, 0.2058012, -1.923066, 0.7568628, 1, 0, 1,
-0.9127119, -1.920744, -4.359699, 0.7529412, 1, 0, 1,
-0.9125071, 1.438547, 0.06102914, 0.7450981, 1, 0, 1,
-0.9122249, 1.156467, 0.5319551, 0.7411765, 1, 0, 1,
-0.9066844, 0.1635786, -2.22184, 0.7333333, 1, 0, 1,
-0.9049789, -1.002153, -1.541346, 0.7294118, 1, 0, 1,
-0.9038716, 1.168182, -1.32872, 0.7215686, 1, 0, 1,
-0.9027999, 1.30739, 0.03759257, 0.7176471, 1, 0, 1,
-0.9019563, -0.6245217, -1.930519, 0.7098039, 1, 0, 1,
-0.9012889, -0.7618983, -1.752252, 0.7058824, 1, 0, 1,
-0.8989965, 0.7799017, -0.3271681, 0.6980392, 1, 0, 1,
-0.8865162, -0.575117, -0.668027, 0.6901961, 1, 0, 1,
-0.874308, -1.036381, -1.668529, 0.6862745, 1, 0, 1,
-0.8740551, 0.5439674, -0.4750516, 0.6784314, 1, 0, 1,
-0.8656574, 0.4481334, -2.390262, 0.6745098, 1, 0, 1,
-0.8619936, -0.4570279, -3.379582, 0.6666667, 1, 0, 1,
-0.8616808, -1.160001, -4.027118, 0.6627451, 1, 0, 1,
-0.8564269, 0.782016, -0.2098662, 0.654902, 1, 0, 1,
-0.8442362, 1.564381, -0.3736032, 0.6509804, 1, 0, 1,
-0.843385, 0.6783571, -0.9167562, 0.6431373, 1, 0, 1,
-0.8379967, 0.43075, -1.186547, 0.6392157, 1, 0, 1,
-0.8370038, 0.2202913, -1.197091, 0.6313726, 1, 0, 1,
-0.8355711, -0.2210673, -1.954501, 0.627451, 1, 0, 1,
-0.8354883, -0.04639857, -0.8380554, 0.6196079, 1, 0, 1,
-0.8342966, -0.4895976, -3.219407, 0.6156863, 1, 0, 1,
-0.8171809, -0.5796803, -2.044278, 0.6078432, 1, 0, 1,
-0.8170575, 0.1531612, -0.746385, 0.6039216, 1, 0, 1,
-0.8138972, -0.396942, -1.455979, 0.5960785, 1, 0, 1,
-0.8110836, 0.9773645, -0.5027814, 0.5882353, 1, 0, 1,
-0.8095355, 0.08565906, -0.4705538, 0.5843138, 1, 0, 1,
-0.8037735, -1.71172, -1.524399, 0.5764706, 1, 0, 1,
-0.7971448, 0.1806025, -2.859073, 0.572549, 1, 0, 1,
-0.7936987, 0.5030934, 0.005940812, 0.5647059, 1, 0, 1,
-0.7929797, -0.2993, -1.044645, 0.5607843, 1, 0, 1,
-0.789045, 0.4511036, -1.166573, 0.5529412, 1, 0, 1,
-0.7825014, 0.1400583, -1.011466, 0.5490196, 1, 0, 1,
-0.7807094, 0.2214961, -1.432602, 0.5411765, 1, 0, 1,
-0.7754572, 0.6291743, 0.5352558, 0.5372549, 1, 0, 1,
-0.7730797, -0.4900665, -2.552012, 0.5294118, 1, 0, 1,
-0.7727327, -1.184037, -3.204528, 0.5254902, 1, 0, 1,
-0.765007, 0.07647166, 0.2926458, 0.5176471, 1, 0, 1,
-0.7618043, 0.1181629, -1.070994, 0.5137255, 1, 0, 1,
-0.7602516, 0.3650152, -1.713941, 0.5058824, 1, 0, 1,
-0.7594873, -0.6916687, -1.272032, 0.5019608, 1, 0, 1,
-0.7592387, -0.4681216, -2.446014, 0.4941176, 1, 0, 1,
-0.7559135, 2.378944, -2.54258, 0.4862745, 1, 0, 1,
-0.7558799, -1.870198, -3.035011, 0.4823529, 1, 0, 1,
-0.7475531, 0.1940634, -2.025813, 0.4745098, 1, 0, 1,
-0.7464281, -1.90707, -2.824686, 0.4705882, 1, 0, 1,
-0.7456778, -0.9763361, -1.71287, 0.4627451, 1, 0, 1,
-0.7428978, -0.8248749, -1.025239, 0.4588235, 1, 0, 1,
-0.7417713, -1.359773, -2.615799, 0.4509804, 1, 0, 1,
-0.7407205, 0.4330954, -1.003096, 0.4470588, 1, 0, 1,
-0.740575, -0.409192, -1.42206, 0.4392157, 1, 0, 1,
-0.7371976, 0.2205805, 0.2666537, 0.4352941, 1, 0, 1,
-0.7275301, 1.138981, -0.3085116, 0.427451, 1, 0, 1,
-0.7263033, -0.1958378, -4.097277, 0.4235294, 1, 0, 1,
-0.7209081, -0.9124709, -2.344665, 0.4156863, 1, 0, 1,
-0.7200382, -0.2150431, -1.857773, 0.4117647, 1, 0, 1,
-0.7171525, -0.6895019, -3.000953, 0.4039216, 1, 0, 1,
-0.7170236, -1.785659, -3.727486, 0.3960784, 1, 0, 1,
-0.7136159, 0.2834409, -1.329358, 0.3921569, 1, 0, 1,
-0.7082132, 1.347096, -1.724468, 0.3843137, 1, 0, 1,
-0.7074085, -0.9326462, -3.074702, 0.3803922, 1, 0, 1,
-0.7040632, 0.3991218, -1.024157, 0.372549, 1, 0, 1,
-0.7028955, -1.330972, -2.424499, 0.3686275, 1, 0, 1,
-0.7024758, 0.2868928, -1.118255, 0.3607843, 1, 0, 1,
-0.6987649, -0.05334263, -2.43564, 0.3568628, 1, 0, 1,
-0.6986864, -1.009064, -2.028877, 0.3490196, 1, 0, 1,
-0.6963072, 1.135969, -0.08879578, 0.345098, 1, 0, 1,
-0.695994, 0.9735928, -0.271262, 0.3372549, 1, 0, 1,
-0.6941896, 0.0894211, -1.649597, 0.3333333, 1, 0, 1,
-0.6935854, -1.173931, -4.020217, 0.3254902, 1, 0, 1,
-0.6902442, -1.654976, -3.06644, 0.3215686, 1, 0, 1,
-0.6850544, -2.134421, -1.868667, 0.3137255, 1, 0, 1,
-0.6806741, -0.4336904, -3.877044, 0.3098039, 1, 0, 1,
-0.6777227, 0.8155133, -0.08036741, 0.3019608, 1, 0, 1,
-0.6747966, -1.13591, -3.641862, 0.2941177, 1, 0, 1,
-0.67158, 0.1753822, -0.5189446, 0.2901961, 1, 0, 1,
-0.6703264, 0.943042, -0.77538, 0.282353, 1, 0, 1,
-0.6686811, 2.810805, 0.9435, 0.2784314, 1, 0, 1,
-0.6645944, -1.492585, -3.053598, 0.2705882, 1, 0, 1,
-0.6613141, -0.3549223, -2.374928, 0.2666667, 1, 0, 1,
-0.6605659, 0.05538084, -0.6389832, 0.2588235, 1, 0, 1,
-0.6587323, 0.6024148, -0.3313975, 0.254902, 1, 0, 1,
-0.6579082, -1.28938, -1.734828, 0.2470588, 1, 0, 1,
-0.6578132, -0.9133496, -4.697637, 0.2431373, 1, 0, 1,
-0.6549067, -0.2695004, -1.128379, 0.2352941, 1, 0, 1,
-0.6488893, 1.698567, -0.7044115, 0.2313726, 1, 0, 1,
-0.6409891, 0.08745729, -1.840572, 0.2235294, 1, 0, 1,
-0.6409888, 1.97953, -1.386295, 0.2196078, 1, 0, 1,
-0.6408402, 1.727333, -0.7020161, 0.2117647, 1, 0, 1,
-0.6400684, -0.2547339, -2.88173, 0.2078431, 1, 0, 1,
-0.6381193, -0.8478668, -3.692041, 0.2, 1, 0, 1,
-0.6353246, -1.858506, -2.496136, 0.1921569, 1, 0, 1,
-0.6280015, 0.05865859, 0.02243242, 0.1882353, 1, 0, 1,
-0.6249112, 1.923496, -0.9634632, 0.1803922, 1, 0, 1,
-0.6236006, 0.532577, -1.601914, 0.1764706, 1, 0, 1,
-0.623156, -0.7799163, -2.679078, 0.1686275, 1, 0, 1,
-0.6200798, 0.1761443, -1.618471, 0.1647059, 1, 0, 1,
-0.6183486, -1.868614, -2.333915, 0.1568628, 1, 0, 1,
-0.6150715, -0.2988688, -4.244114, 0.1529412, 1, 0, 1,
-0.6129425, 0.2593333, -2.693841, 0.145098, 1, 0, 1,
-0.6091074, -0.1863508, -2.44097, 0.1411765, 1, 0, 1,
-0.6069989, 0.5363846, 0.08336033, 0.1333333, 1, 0, 1,
-0.6068723, -2.013279, -1.830218, 0.1294118, 1, 0, 1,
-0.6055943, -1.22311, -2.802272, 0.1215686, 1, 0, 1,
-0.6023061, 0.3052845, -2.004093, 0.1176471, 1, 0, 1,
-0.6009222, -1.207727, -2.581909, 0.1098039, 1, 0, 1,
-0.5945729, 0.9966568, -1.063757, 0.1058824, 1, 0, 1,
-0.5939636, 0.6052259, -0.5646111, 0.09803922, 1, 0, 1,
-0.5820187, -0.5568613, -1.544132, 0.09019608, 1, 0, 1,
-0.5702778, 0.07474483, -2.082203, 0.08627451, 1, 0, 1,
-0.5638971, 1.489072, -2.719224, 0.07843138, 1, 0, 1,
-0.5602928, -1.713308, -3.837453, 0.07450981, 1, 0, 1,
-0.5600744, 1.707833, -0.640986, 0.06666667, 1, 0, 1,
-0.5542797, 1.775016, -0.03464766, 0.0627451, 1, 0, 1,
-0.5509238, 0.2100147, -2.446434, 0.05490196, 1, 0, 1,
-0.5476133, 0.2867833, -0.9279592, 0.05098039, 1, 0, 1,
-0.5467106, 0.3017759, -1.828582, 0.04313726, 1, 0, 1,
-0.5459151, 1.223298, -2.874874, 0.03921569, 1, 0, 1,
-0.5457166, -0.03775127, -2.432293, 0.03137255, 1, 0, 1,
-0.5448215, -0.6197042, -1.048592, 0.02745098, 1, 0, 1,
-0.5440185, 0.001298765, 0.1147469, 0.01960784, 1, 0, 1,
-0.5418023, -1.330892, -0.6561987, 0.01568628, 1, 0, 1,
-0.5335071, -1.295541, -2.748612, 0.007843138, 1, 0, 1,
-0.5286483, 0.5675487, -0.8278206, 0.003921569, 1, 0, 1,
-0.526773, 0.6138489, -2.099024, 0, 1, 0.003921569, 1,
-0.5207066, 1.865833, -1.984103, 0, 1, 0.01176471, 1,
-0.519165, -2.783482, -1.163516, 0, 1, 0.01568628, 1,
-0.5173191, -0.9256686, -1.963925, 0, 1, 0.02352941, 1,
-0.5123654, -0.2042033, -1.60339, 0, 1, 0.02745098, 1,
-0.5117359, 1.17461, -0.1792303, 0, 1, 0.03529412, 1,
-0.5085157, 0.385512, -0.6537185, 0, 1, 0.03921569, 1,
-0.5058416, -1.056051, -4.076224, 0, 1, 0.04705882, 1,
-0.5055761, 1.149062, 0.1728806, 0, 1, 0.05098039, 1,
-0.5010142, -0.9226987, -2.552317, 0, 1, 0.05882353, 1,
-0.49337, 0.515044, -0.9226595, 0, 1, 0.0627451, 1,
-0.4932412, -0.1383274, -0.5771969, 0, 1, 0.07058824, 1,
-0.4928807, -0.7836384, -1.478205, 0, 1, 0.07450981, 1,
-0.4903375, 0.7529145, -1.857683, 0, 1, 0.08235294, 1,
-0.4864043, -0.8661035, -3.724697, 0, 1, 0.08627451, 1,
-0.4772114, -0.3265715, -2.16414, 0, 1, 0.09411765, 1,
-0.4753263, -0.2398724, -3.117904, 0, 1, 0.1019608, 1,
-0.4735592, -0.1910276, -1.540493, 0, 1, 0.1058824, 1,
-0.4719188, 0.5534068, -1.506983, 0, 1, 0.1137255, 1,
-0.4700698, -1.371776, -3.201852, 0, 1, 0.1176471, 1,
-0.4646214, 0.6716168, -1.06696, 0, 1, 0.1254902, 1,
-0.4646109, -0.3779236, -2.241897, 0, 1, 0.1294118, 1,
-0.4645768, -1.318891, -3.881465, 0, 1, 0.1372549, 1,
-0.454505, -0.5904649, -1.965512, 0, 1, 0.1411765, 1,
-0.4503853, 0.5212418, -0.2080555, 0, 1, 0.1490196, 1,
-0.4492057, -0.5052114, -1.928295, 0, 1, 0.1529412, 1,
-0.4451629, -0.7333536, -2.711192, 0, 1, 0.1607843, 1,
-0.4408373, -1.69222, -1.880855, 0, 1, 0.1647059, 1,
-0.4380379, -2.257078, -2.978835, 0, 1, 0.172549, 1,
-0.4325239, -0.3431767, -2.192459, 0, 1, 0.1764706, 1,
-0.4318528, -0.3235589, -1.068539, 0, 1, 0.1843137, 1,
-0.4279756, 0.6769502, 0.08970588, 0, 1, 0.1882353, 1,
-0.4228002, -0.2789962, -4.050027, 0, 1, 0.1960784, 1,
-0.4204873, -1.698362, -4.218562, 0, 1, 0.2039216, 1,
-0.4194492, -2.695554, -0.6204113, 0, 1, 0.2078431, 1,
-0.417204, 0.03582107, -1.364712, 0, 1, 0.2156863, 1,
-0.4171346, -0.4246508, -2.445507, 0, 1, 0.2196078, 1,
-0.4159688, -0.183602, -0.50001, 0, 1, 0.227451, 1,
-0.4159605, -0.5412013, -1.760473, 0, 1, 0.2313726, 1,
-0.4136519, -0.9084209, -2.341402, 0, 1, 0.2392157, 1,
-0.412591, -1.031361, -2.645659, 0, 1, 0.2431373, 1,
-0.4100348, 1.484777, -1.3739, 0, 1, 0.2509804, 1,
-0.4059661, -1.081355, -3.547449, 0, 1, 0.254902, 1,
-0.3988231, -0.2506009, -3.219791, 0, 1, 0.2627451, 1,
-0.3941195, 0.1184301, 0.2590113, 0, 1, 0.2666667, 1,
-0.3923702, 0.2432569, -1.051407, 0, 1, 0.2745098, 1,
-0.3888835, 1.29756, -0.7028675, 0, 1, 0.2784314, 1,
-0.3856073, 0.09537553, -1.893652, 0, 1, 0.2862745, 1,
-0.3850828, -0.2655889, -1.738823, 0, 1, 0.2901961, 1,
-0.380893, 0.3793159, -2.661808, 0, 1, 0.2980392, 1,
-0.3734479, 1.09691, -1.648516, 0, 1, 0.3058824, 1,
-0.3606895, -0.948681, -4.345578, 0, 1, 0.3098039, 1,
-0.356729, -1.297009, -3.249764, 0, 1, 0.3176471, 1,
-0.3556864, 1.241631, -0.01290366, 0, 1, 0.3215686, 1,
-0.3548876, 0.7902772, -0.453262, 0, 1, 0.3294118, 1,
-0.3547079, -2.450864, -3.008706, 0, 1, 0.3333333, 1,
-0.3545125, -1.529786, -3.883185, 0, 1, 0.3411765, 1,
-0.3531733, -0.6624432, -0.6880827, 0, 1, 0.345098, 1,
-0.3418202, 1.79558, -0.8427548, 0, 1, 0.3529412, 1,
-0.3313361, 2.126015, 0.2521535, 0, 1, 0.3568628, 1,
-0.3280224, -0.3038359, -1.144378, 0, 1, 0.3647059, 1,
-0.3170078, 0.01392626, -1.545745, 0, 1, 0.3686275, 1,
-0.3035926, -1.091474, -3.538306, 0, 1, 0.3764706, 1,
-0.3023403, -0.4747046, -1.408651, 0, 1, 0.3803922, 1,
-0.3013343, 0.2312396, -2.060578, 0, 1, 0.3882353, 1,
-0.3000573, 0.4777495, 0.02252236, 0, 1, 0.3921569, 1,
-0.2979744, -0.619724, -2.28376, 0, 1, 0.4, 1,
-0.296625, -0.01262708, -3.730614, 0, 1, 0.4078431, 1,
-0.2928064, -1.256406, -3.451037, 0, 1, 0.4117647, 1,
-0.2927103, -1.650351, -2.416659, 0, 1, 0.4196078, 1,
-0.2921553, 0.4588881, -1.19965, 0, 1, 0.4235294, 1,
-0.2903017, -1.862455, -4.146667, 0, 1, 0.4313726, 1,
-0.2842706, -0.4812271, -3.108418, 0, 1, 0.4352941, 1,
-0.2833611, -0.6881824, -4.471681, 0, 1, 0.4431373, 1,
-0.2817187, -0.2793967, -4.117136, 0, 1, 0.4470588, 1,
-0.2787447, 1.710329, -0.715128, 0, 1, 0.454902, 1,
-0.2763245, 1.032513, 0.766076, 0, 1, 0.4588235, 1,
-0.2751616, -0.713107, -2.358561, 0, 1, 0.4666667, 1,
-0.2722026, -0.4930709, -4.354467, 0, 1, 0.4705882, 1,
-0.2712618, 0.2532065, 0.3820212, 0, 1, 0.4784314, 1,
-0.2710618, 0.1530703, -1.201604, 0, 1, 0.4823529, 1,
-0.2700998, 0.6439554, 1.238688, 0, 1, 0.4901961, 1,
-0.2649468, -0.3841784, -2.404016, 0, 1, 0.4941176, 1,
-0.2638504, -0.7390275, -3.061522, 0, 1, 0.5019608, 1,
-0.2627744, 0.08773658, -1.954353, 0, 1, 0.509804, 1,
-0.2594906, -0.7066789, -2.139462, 0, 1, 0.5137255, 1,
-0.258871, 0.3003701, -0.140836, 0, 1, 0.5215687, 1,
-0.2585641, -0.8845505, -3.654038, 0, 1, 0.5254902, 1,
-0.2574962, 0.7253962, 1.33853, 0, 1, 0.5333334, 1,
-0.2526299, 0.3768449, -0.9626863, 0, 1, 0.5372549, 1,
-0.2501612, 0.1164407, -0.1343948, 0, 1, 0.5450981, 1,
-0.2465598, 0.6011504, -2.101882, 0, 1, 0.5490196, 1,
-0.2460658, 0.3062128, -1.558167, 0, 1, 0.5568628, 1,
-0.2444945, -0.6732433, -3.870179, 0, 1, 0.5607843, 1,
-0.2371505, -0.09382625, -1.691555, 0, 1, 0.5686275, 1,
-0.229191, 0.4002671, -0.3536299, 0, 1, 0.572549, 1,
-0.2280693, 0.9486976, -0.6195306, 0, 1, 0.5803922, 1,
-0.2221399, 1.117445, -1.682767, 0, 1, 0.5843138, 1,
-0.2170626, 0.4769001, -1.653923, 0, 1, 0.5921569, 1,
-0.2152159, 1.897872, -0.2493175, 0, 1, 0.5960785, 1,
-0.2115356, 0.2201901, 0.1556915, 0, 1, 0.6039216, 1,
-0.2041097, 0.2979889, -0.9795661, 0, 1, 0.6117647, 1,
-0.2040014, 0.9454286, -1.334441, 0, 1, 0.6156863, 1,
-0.2025728, 0.359311, -2.36201, 0, 1, 0.6235294, 1,
-0.2015042, 0.6543823, 0.03883248, 0, 1, 0.627451, 1,
-0.2002275, -1.748497, -2.714442, 0, 1, 0.6352941, 1,
-0.1997911, -0.1845174, -1.583257, 0, 1, 0.6392157, 1,
-0.1990167, -0.08083346, 1.093477, 0, 1, 0.6470588, 1,
-0.1972078, -0.7264602, -2.114389, 0, 1, 0.6509804, 1,
-0.1969018, 0.06687567, -1.733381, 0, 1, 0.6588235, 1,
-0.1941314, -1.208625, -2.350899, 0, 1, 0.6627451, 1,
-0.1905976, -0.6366937, -2.372806, 0, 1, 0.6705883, 1,
-0.1869685, -1.78137, -2.715085, 0, 1, 0.6745098, 1,
-0.1865262, 0.08424826, 0.4223787, 0, 1, 0.682353, 1,
-0.1844177, -0.8674673, -1.818542, 0, 1, 0.6862745, 1,
-0.1837264, 0.3177021, -0.5453274, 0, 1, 0.6941177, 1,
-0.1834717, 0.6622366, -0.7752015, 0, 1, 0.7019608, 1,
-0.1827582, -0.5052775, -3.239032, 0, 1, 0.7058824, 1,
-0.1785747, -1.154822, -2.658098, 0, 1, 0.7137255, 1,
-0.1757056, -0.2148587, -1.766236, 0, 1, 0.7176471, 1,
-0.172996, 0.06374143, -0.8605722, 0, 1, 0.7254902, 1,
-0.1700175, 0.402809, 0.7204902, 0, 1, 0.7294118, 1,
-0.1698494, 1.017933, -0.5861769, 0, 1, 0.7372549, 1,
-0.1654482, 0.2270319, -0.9139851, 0, 1, 0.7411765, 1,
-0.1608594, -1.060577, -4.308487, 0, 1, 0.7490196, 1,
-0.1603479, 0.3820157, 0.9686553, 0, 1, 0.7529412, 1,
-0.1597526, 0.1753621, -1.432647, 0, 1, 0.7607843, 1,
-0.1563465, -0.8901525, -2.745711, 0, 1, 0.7647059, 1,
-0.1526842, -0.5218102, -3.851427, 0, 1, 0.772549, 1,
-0.14676, -0.5363432, -1.64384, 0, 1, 0.7764706, 1,
-0.1383479, -1.833693, -1.144789, 0, 1, 0.7843137, 1,
-0.1330759, -0.9821984, -1.433589, 0, 1, 0.7882353, 1,
-0.1313386, 0.8477458, 0.8427265, 0, 1, 0.7960784, 1,
-0.1268702, 2.847295, -0.9533758, 0, 1, 0.8039216, 1,
-0.1258899, 0.005058746, -2.153205, 0, 1, 0.8078431, 1,
-0.1252259, 0.04207468, -2.827551, 0, 1, 0.8156863, 1,
-0.1191631, -0.505227, -1.289184, 0, 1, 0.8196079, 1,
-0.1187973, 1.570929, 0.4816645, 0, 1, 0.827451, 1,
-0.1180637, -2.138082, -2.206466, 0, 1, 0.8313726, 1,
-0.1164897, 0.5912733, -3.661395, 0, 1, 0.8392157, 1,
-0.1154911, 0.2781492, -0.9165165, 0, 1, 0.8431373, 1,
-0.1132149, -0.3651913, -4.57882, 0, 1, 0.8509804, 1,
-0.112737, 0.391775, 0.6154796, 0, 1, 0.854902, 1,
-0.1117367, 1.913809, -1.325751, 0, 1, 0.8627451, 1,
-0.1091262, 1.552269, -1.208695, 0, 1, 0.8666667, 1,
-0.1086371, 0.4002082, -1.544574, 0, 1, 0.8745098, 1,
-0.1080014, 0.1078928, -1.100715, 0, 1, 0.8784314, 1,
-0.1047517, 0.1042839, -0.7940593, 0, 1, 0.8862745, 1,
-0.1032341, -0.782243, -0.9766875, 0, 1, 0.8901961, 1,
-0.1009074, -0.4209361, -2.122364, 0, 1, 0.8980392, 1,
-0.1003035, -1.208403, -2.403564, 0, 1, 0.9058824, 1,
-0.08892584, -0.185958, -4.464842, 0, 1, 0.9098039, 1,
-0.08223227, 1.074091, 1.046709, 0, 1, 0.9176471, 1,
-0.08172433, 0.77183, 1.037939, 0, 1, 0.9215686, 1,
-0.07909796, -0.3529567, -2.211953, 0, 1, 0.9294118, 1,
-0.07840139, 0.02970279, -1.302609, 0, 1, 0.9333333, 1,
-0.07676723, -0.1382032, -4.822201, 0, 1, 0.9411765, 1,
-0.07650314, 1.212497, -1.172434, 0, 1, 0.945098, 1,
-0.07465839, 0.9137743, 0.9411798, 0, 1, 0.9529412, 1,
-0.07140918, 0.793218, 0.3478122, 0, 1, 0.9568627, 1,
-0.07074108, 0.2597671, -1.173593, 0, 1, 0.9647059, 1,
-0.07073431, -0.1268052, -3.091491, 0, 1, 0.9686275, 1,
-0.05479513, 0.7128537, 1.032175, 0, 1, 0.9764706, 1,
-0.05430346, -0.3033162, -3.761594, 0, 1, 0.9803922, 1,
-0.05159287, -0.1179114, 0.02738902, 0, 1, 0.9882353, 1,
-0.04946749, -1.012535, -3.216563, 0, 1, 0.9921569, 1,
-0.04788616, -0.2596937, -0.6510958, 0, 1, 1, 1,
-0.04556419, 1.037481, 2.431155, 0, 0.9921569, 1, 1,
-0.0447797, 0.6237397, 0.07726963, 0, 0.9882353, 1, 1,
-0.04306705, 0.5263643, -0.9905479, 0, 0.9803922, 1, 1,
-0.0428813, 1.296308, -0.378404, 0, 0.9764706, 1, 1,
-0.04105604, -0.1222157, -3.730379, 0, 0.9686275, 1, 1,
-0.03984712, -0.1392606, -1.634118, 0, 0.9647059, 1, 1,
-0.03807524, -0.7284099, -3.504773, 0, 0.9568627, 1, 1,
-0.03233637, -0.169538, -3.262786, 0, 0.9529412, 1, 1,
-0.02757148, 1.029936, -0.1357715, 0, 0.945098, 1, 1,
-0.02689604, 0.2930939, 0.7900288, 0, 0.9411765, 1, 1,
-0.02090693, 0.1915889, -0.7476372, 0, 0.9333333, 1, 1,
-0.01865703, -0.246497, -2.558307, 0, 0.9294118, 1, 1,
-0.018338, 0.6077676, -0.1188352, 0, 0.9215686, 1, 1,
-0.01793304, -0.3551947, -2.181447, 0, 0.9176471, 1, 1,
-0.01532127, -1.431184, -3.371803, 0, 0.9098039, 1, 1,
-0.01040256, -0.1836525, -4.220743, 0, 0.9058824, 1, 1,
-0.005535892, -0.337243, -3.551135, 0, 0.8980392, 1, 1,
-0.005253362, 1.115504, -0.1304953, 0, 0.8901961, 1, 1,
-0.004151944, 1.480605, -0.2324201, 0, 0.8862745, 1, 1,
-0.003692377, -0.3396443, -3.119036, 0, 0.8784314, 1, 1,
-0.002911978, -0.6590853, -5.090203, 0, 0.8745098, 1, 1,
0.002983289, -0.08895697, 5.037031, 0, 0.8666667, 1, 1,
0.004154417, 2.322134, 0.2668651, 0, 0.8627451, 1, 1,
0.01156775, -0.07074802, 2.721326, 0, 0.854902, 1, 1,
0.01696586, -0.1694683, 4.053142, 0, 0.8509804, 1, 1,
0.01963086, -2.284727, 2.198945, 0, 0.8431373, 1, 1,
0.02064716, 0.1982105, 0.03144829, 0, 0.8392157, 1, 1,
0.02300411, 0.4021085, 1.306069, 0, 0.8313726, 1, 1,
0.02348505, -0.7837638, 0.8825226, 0, 0.827451, 1, 1,
0.02552026, -0.2198578, 1.745837, 0, 0.8196079, 1, 1,
0.03495362, -0.3741996, 1.753622, 0, 0.8156863, 1, 1,
0.03703131, -0.263783, 1.178099, 0, 0.8078431, 1, 1,
0.0432125, -1.010613, 3.591172, 0, 0.8039216, 1, 1,
0.04533261, 1.120455, 0.7653428, 0, 0.7960784, 1, 1,
0.04704258, -0.4795024, 4.214268, 0, 0.7882353, 1, 1,
0.04748555, -0.6189038, 1.166564, 0, 0.7843137, 1, 1,
0.05053657, 0.3920222, 1.474556, 0, 0.7764706, 1, 1,
0.05428489, -0.5849816, 1.456332, 0, 0.772549, 1, 1,
0.05692255, -0.9784937, 2.268824, 0, 0.7647059, 1, 1,
0.05809693, -1.129941, 4.660662, 0, 0.7607843, 1, 1,
0.06037625, 1.168761, 0.3253701, 0, 0.7529412, 1, 1,
0.06185152, 1.400883, 0.5691494, 0, 0.7490196, 1, 1,
0.06625825, -1.387227, 3.872297, 0, 0.7411765, 1, 1,
0.0662879, 1.91048, 1.140971, 0, 0.7372549, 1, 1,
0.06722934, 0.475466, 0.1834408, 0, 0.7294118, 1, 1,
0.07231546, -0.3858228, 3.716785, 0, 0.7254902, 1, 1,
0.07266161, 0.3024517, 1.274775, 0, 0.7176471, 1, 1,
0.07266396, 0.1698981, 0.6057262, 0, 0.7137255, 1, 1,
0.07309601, -0.4795824, 1.856185, 0, 0.7058824, 1, 1,
0.07377435, 1.203566, 1.771224, 0, 0.6980392, 1, 1,
0.08000985, -1.950665, 2.95597, 0, 0.6941177, 1, 1,
0.08419467, 2.347382, 0.8370667, 0, 0.6862745, 1, 1,
0.08458047, -0.8980679, 3.645554, 0, 0.682353, 1, 1,
0.08477928, -1.346428, 2.68067, 0, 0.6745098, 1, 1,
0.0895007, -0.3090389, 2.214725, 0, 0.6705883, 1, 1,
0.09714059, 0.8229806, -0.5470632, 0, 0.6627451, 1, 1,
0.1046328, 1.36429, -0.3599233, 0, 0.6588235, 1, 1,
0.1056782, 0.7169237, 1.682504, 0, 0.6509804, 1, 1,
0.1072665, 0.3897539, 0.7466084, 0, 0.6470588, 1, 1,
0.1125197, -0.4110267, 2.649874, 0, 0.6392157, 1, 1,
0.1145345, -1.599972, 3.407072, 0, 0.6352941, 1, 1,
0.1146718, 0.5370248, 0.3908632, 0, 0.627451, 1, 1,
0.1262223, 1.249466, -1.13203, 0, 0.6235294, 1, 1,
0.1268969, 0.8466541, 0.8790975, 0, 0.6156863, 1, 1,
0.1290634, 0.2736878, -1.427256, 0, 0.6117647, 1, 1,
0.1317549, -0.398033, 2.274003, 0, 0.6039216, 1, 1,
0.1362683, -1.517058, 3.71915, 0, 0.5960785, 1, 1,
0.1366475, -1.165498, 0.9343305, 0, 0.5921569, 1, 1,
0.1378306, -0.3560176, 4.325974, 0, 0.5843138, 1, 1,
0.1379169, 0.7742994, 0.5782834, 0, 0.5803922, 1, 1,
0.1394637, 0.1959622, 0.4218075, 0, 0.572549, 1, 1,
0.1403484, -1.229649, 2.325369, 0, 0.5686275, 1, 1,
0.1416969, 1.083982, 0.0285912, 0, 0.5607843, 1, 1,
0.1436637, -1.018249, 1.845972, 0, 0.5568628, 1, 1,
0.1445049, -1.862412, 4.21551, 0, 0.5490196, 1, 1,
0.1471763, 0.6306592, -0.1115023, 0, 0.5450981, 1, 1,
0.1568136, -0.8335232, 1.91546, 0, 0.5372549, 1, 1,
0.157455, 1.365413, -0.4599538, 0, 0.5333334, 1, 1,
0.1618292, -0.4347817, 2.325988, 0, 0.5254902, 1, 1,
0.1682481, -0.3069526, 2.574935, 0, 0.5215687, 1, 1,
0.1709327, -0.1774291, 0.7877063, 0, 0.5137255, 1, 1,
0.1714181, 1.112886, -0.8552392, 0, 0.509804, 1, 1,
0.1749043, 0.8262469, 1.393978, 0, 0.5019608, 1, 1,
0.1759199, 0.5531461, 2.751278, 0, 0.4941176, 1, 1,
0.1765514, 0.6019278, -0.2887447, 0, 0.4901961, 1, 1,
0.1778126, 0.6091824, -0.6155899, 0, 0.4823529, 1, 1,
0.1788623, 0.424376, 0.004817226, 0, 0.4784314, 1, 1,
0.1861301, 0.942147, -0.453368, 0, 0.4705882, 1, 1,
0.1871302, -0.5293488, 2.43612, 0, 0.4666667, 1, 1,
0.1904791, -0.1540735, 2.054021, 0, 0.4588235, 1, 1,
0.1978542, 0.2358635, 0.9227349, 0, 0.454902, 1, 1,
0.2100762, -1.579738, 2.529052, 0, 0.4470588, 1, 1,
0.2113381, 1.039319, 1.311321, 0, 0.4431373, 1, 1,
0.2126963, 0.04465052, -0.9588598, 0, 0.4352941, 1, 1,
0.2130537, -1.339815, 4.83218, 0, 0.4313726, 1, 1,
0.2155625, 0.6033412, 0.2171436, 0, 0.4235294, 1, 1,
0.2163895, -0.1292911, 2.22313, 0, 0.4196078, 1, 1,
0.2285828, 0.641113, -0.7697036, 0, 0.4117647, 1, 1,
0.2300667, 1.277096, 0.9466019, 0, 0.4078431, 1, 1,
0.233108, -0.6287788, 0.4275389, 0, 0.4, 1, 1,
0.2336345, 0.4655667, -0.2276272, 0, 0.3921569, 1, 1,
0.2338254, 0.4254473, 0.103689, 0, 0.3882353, 1, 1,
0.2340644, 0.5216534, -0.8748888, 0, 0.3803922, 1, 1,
0.2378122, 0.4935989, 0.7383436, 0, 0.3764706, 1, 1,
0.2382469, -1.891544, 3.076564, 0, 0.3686275, 1, 1,
0.2408153, 0.6162339, 0.9784395, 0, 0.3647059, 1, 1,
0.2447936, -1.503269, 2.430923, 0, 0.3568628, 1, 1,
0.2450233, -0.987333, 3.543034, 0, 0.3529412, 1, 1,
0.2453748, -0.8513917, 4.411602, 0, 0.345098, 1, 1,
0.2501563, 0.5595752, 1.567804, 0, 0.3411765, 1, 1,
0.2507996, -2.572153, 3.384146, 0, 0.3333333, 1, 1,
0.2508869, 0.01325385, 0.606465, 0, 0.3294118, 1, 1,
0.2515712, -1.485124, 2.804441, 0, 0.3215686, 1, 1,
0.2518777, -0.1495305, 1.504935, 0, 0.3176471, 1, 1,
0.2530924, -1.162423, 1.690712, 0, 0.3098039, 1, 1,
0.2535108, -0.1221411, 1.035311, 0, 0.3058824, 1, 1,
0.2540264, 1.680686, 1.350755, 0, 0.2980392, 1, 1,
0.2582144, 0.7426474, 0.1805023, 0, 0.2901961, 1, 1,
0.2599926, 1.173446, 1.098608, 0, 0.2862745, 1, 1,
0.2646991, -0.0693686, 2.019585, 0, 0.2784314, 1, 1,
0.2673108, 0.5894286, 0.8585131, 0, 0.2745098, 1, 1,
0.2706786, 0.6904671, 0.443058, 0, 0.2666667, 1, 1,
0.277639, 0.774546, 0.5823845, 0, 0.2627451, 1, 1,
0.2789838, -1.243872, 0.7716427, 0, 0.254902, 1, 1,
0.2816299, 0.5725238, 0.3567148, 0, 0.2509804, 1, 1,
0.2922343, 1.700122, -1.060623, 0, 0.2431373, 1, 1,
0.3014522, 0.6076633, 1.097237, 0, 0.2392157, 1, 1,
0.3045938, -1.082882, -0.2510782, 0, 0.2313726, 1, 1,
0.3048319, -0.5051966, 3.10811, 0, 0.227451, 1, 1,
0.3069666, -0.9020553, 4.310964, 0, 0.2196078, 1, 1,
0.307313, -0.04541055, 1.702347, 0, 0.2156863, 1, 1,
0.3098818, -0.6838343, 4.893777, 0, 0.2078431, 1, 1,
0.3106626, -0.966987, 2.899868, 0, 0.2039216, 1, 1,
0.312268, 0.5393772, 1.590704, 0, 0.1960784, 1, 1,
0.3151074, 2.063064, 1.015524, 0, 0.1882353, 1, 1,
0.3162949, -2.146669, 2.324817, 0, 0.1843137, 1, 1,
0.3180574, -0.1788162, 2.05835, 0, 0.1764706, 1, 1,
0.3261252, -0.6099015, 3.747962, 0, 0.172549, 1, 1,
0.329685, -0.03704822, 1.083974, 0, 0.1647059, 1, 1,
0.3306487, -1.314223, 3.369221, 0, 0.1607843, 1, 1,
0.3393318, -0.740007, 3.211714, 0, 0.1529412, 1, 1,
0.3399892, 0.2311993, 1.314145, 0, 0.1490196, 1, 1,
0.3403282, -0.0195483, 1.964327, 0, 0.1411765, 1, 1,
0.3413102, -0.1877309, 2.905298, 0, 0.1372549, 1, 1,
0.3419712, 0.5242993, 0.04815056, 0, 0.1294118, 1, 1,
0.3436717, 1.827197, 0.04426345, 0, 0.1254902, 1, 1,
0.3468581, -0.2051392, 1.645301, 0, 0.1176471, 1, 1,
0.3475174, -1.314729, 3.138625, 0, 0.1137255, 1, 1,
0.3489303, -0.7671365, 4.159271, 0, 0.1058824, 1, 1,
0.3553706, 0.1279573, 1.430268, 0, 0.09803922, 1, 1,
0.3555807, -0.8563229, 1.760301, 0, 0.09411765, 1, 1,
0.3563392, 0.7447922, 0.4330723, 0, 0.08627451, 1, 1,
0.3581022, -0.1199639, 0.7146577, 0, 0.08235294, 1, 1,
0.3662691, 1.524588, 0.3395626, 0, 0.07450981, 1, 1,
0.366903, 0.2691999, 1.635103, 0, 0.07058824, 1, 1,
0.3692236, -0.2479567, 1.552281, 0, 0.0627451, 1, 1,
0.371252, -1.334478, 3.603055, 0, 0.05882353, 1, 1,
0.3739459, -0.2191843, -0.05099768, 0, 0.05098039, 1, 1,
0.3743396, -0.4835286, 2.248702, 0, 0.04705882, 1, 1,
0.3806133, 1.099474, -1.320953, 0, 0.03921569, 1, 1,
0.38345, -0.09943175, 1.831991, 0, 0.03529412, 1, 1,
0.3841659, 0.1409465, 1.804996, 0, 0.02745098, 1, 1,
0.387771, -2.443509, 4.449197, 0, 0.02352941, 1, 1,
0.3921349, -0.1809471, 4.363589, 0, 0.01568628, 1, 1,
0.3928702, -0.7557542, 1.113884, 0, 0.01176471, 1, 1,
0.3945215, -0.03300671, -0.1445334, 0, 0.003921569, 1, 1,
0.3984785, -0.7625026, 0.4823914, 0.003921569, 0, 1, 1,
0.4018283, 0.1550436, 0.5804561, 0.007843138, 0, 1, 1,
0.4031116, -0.4342222, 0.3738666, 0.01568628, 0, 1, 1,
0.4047073, -0.7709846, 4.332848, 0.01960784, 0, 1, 1,
0.4080473, -3.04669, 4.690605, 0.02745098, 0, 1, 1,
0.4088284, 0.920804, 0.07893577, 0.03137255, 0, 1, 1,
0.4112455, 0.991695, 0.9034432, 0.03921569, 0, 1, 1,
0.4133001, -0.2321591, 2.948699, 0.04313726, 0, 1, 1,
0.4149401, -0.3469828, 1.338557, 0.05098039, 0, 1, 1,
0.4170729, 0.1547703, 1.019801, 0.05490196, 0, 1, 1,
0.4174187, -1.106516, 2.344323, 0.0627451, 0, 1, 1,
0.4181534, 1.993256, 0.1397234, 0.06666667, 0, 1, 1,
0.4187074, 0.324933, -0.9742115, 0.07450981, 0, 1, 1,
0.4217642, 0.8968689, 0.2345273, 0.07843138, 0, 1, 1,
0.4219414, -0.4909762, 4.030499, 0.08627451, 0, 1, 1,
0.4250464, 0.1750496, 4.128107, 0.09019608, 0, 1, 1,
0.425288, -0.5633297, 3.735656, 0.09803922, 0, 1, 1,
0.4286923, 1.149275, 1.109798, 0.1058824, 0, 1, 1,
0.4350955, 0.8801712, 0.2383785, 0.1098039, 0, 1, 1,
0.4374179, -0.0418975, 1.131334, 0.1176471, 0, 1, 1,
0.4386572, -1.745266, 2.600832, 0.1215686, 0, 1, 1,
0.4410771, 0.356265, 3.397825, 0.1294118, 0, 1, 1,
0.4416619, -0.7414466, 2.053685, 0.1333333, 0, 1, 1,
0.4421545, 0.4661779, 1.558728, 0.1411765, 0, 1, 1,
0.4433653, -1.31201, 2.754873, 0.145098, 0, 1, 1,
0.4460751, 2.581167, -2.434354, 0.1529412, 0, 1, 1,
0.4467145, -1.486436, 4.118627, 0.1568628, 0, 1, 1,
0.4488324, -0.7244241, 2.777226, 0.1647059, 0, 1, 1,
0.4494276, -0.5098308, 2.425216, 0.1686275, 0, 1, 1,
0.450965, 0.683154, -0.1173325, 0.1764706, 0, 1, 1,
0.4515113, 0.5705839, 0.9280643, 0.1803922, 0, 1, 1,
0.4527927, 0.3558938, -0.2185121, 0.1882353, 0, 1, 1,
0.4550301, 0.4868243, 1.376671, 0.1921569, 0, 1, 1,
0.4571123, -1.358336, 2.599492, 0.2, 0, 1, 1,
0.4667364, 0.09666845, 2.919368, 0.2078431, 0, 1, 1,
0.4679895, 2.102767, 0.161918, 0.2117647, 0, 1, 1,
0.4690391, 0.4798738, -0.01328823, 0.2196078, 0, 1, 1,
0.4749773, -0.2140223, 3.830191, 0.2235294, 0, 1, 1,
0.476365, 1.393068, 1.051985, 0.2313726, 0, 1, 1,
0.4767452, -0.2429857, 1.373323, 0.2352941, 0, 1, 1,
0.4775214, -0.6087191, 2.878348, 0.2431373, 0, 1, 1,
0.4806264, -0.5964974, 3.497512, 0.2470588, 0, 1, 1,
0.4817031, 0.6881683, 0.5454741, 0.254902, 0, 1, 1,
0.4851997, -1.026267, 2.024668, 0.2588235, 0, 1, 1,
0.4911352, 0.9070615, -0.2975215, 0.2666667, 0, 1, 1,
0.4931422, -1.067282, 4.126026, 0.2705882, 0, 1, 1,
0.4945874, 0.1254373, 1.481006, 0.2784314, 0, 1, 1,
0.4965827, -0.4123594, 1.057291, 0.282353, 0, 1, 1,
0.5002984, 0.5824465, 0.9599091, 0.2901961, 0, 1, 1,
0.5011037, 0.8456299, -0.6596248, 0.2941177, 0, 1, 1,
0.5019214, 0.3802063, 1.398387, 0.3019608, 0, 1, 1,
0.5057601, 0.7422174, 0.1606445, 0.3098039, 0, 1, 1,
0.5062192, 0.2435903, 0.5366473, 0.3137255, 0, 1, 1,
0.5073767, -0.7719881, 4.487832, 0.3215686, 0, 1, 1,
0.508723, -0.2853725, 0.7224061, 0.3254902, 0, 1, 1,
0.5091743, 0.1503564, 1.918334, 0.3333333, 0, 1, 1,
0.5097742, 0.8242563, 0.2981646, 0.3372549, 0, 1, 1,
0.5145603, 0.8419518, 0.5676603, 0.345098, 0, 1, 1,
0.5145878, 2.606301, -1.327112, 0.3490196, 0, 1, 1,
0.5196722, 0.6449985, 1.008621, 0.3568628, 0, 1, 1,
0.522966, 0.1695541, 1.331096, 0.3607843, 0, 1, 1,
0.5314489, 0.2932508, 1.363911, 0.3686275, 0, 1, 1,
0.5336273, -1.522193, 3.437206, 0.372549, 0, 1, 1,
0.5348848, -0.2333492, 3.016978, 0.3803922, 0, 1, 1,
0.5433773, 0.5700865, 0.7102723, 0.3843137, 0, 1, 1,
0.5524207, -0.8260309, 3.695944, 0.3921569, 0, 1, 1,
0.5530027, -0.8565135, 2.624976, 0.3960784, 0, 1, 1,
0.5532069, 1.113263, -1.112467, 0.4039216, 0, 1, 1,
0.5564255, -0.4423969, 3.910286, 0.4117647, 0, 1, 1,
0.5581507, -0.06645202, 0.4486898, 0.4156863, 0, 1, 1,
0.5593046, -1.013618, 2.117273, 0.4235294, 0, 1, 1,
0.5643957, 0.6803955, -0.144519, 0.427451, 0, 1, 1,
0.567137, -0.1738499, 0.8357462, 0.4352941, 0, 1, 1,
0.5729305, -0.8050028, 2.692679, 0.4392157, 0, 1, 1,
0.5744812, -0.03836416, 2.02391, 0.4470588, 0, 1, 1,
0.5752766, -0.7992027, 0.1233463, 0.4509804, 0, 1, 1,
0.576277, -1.401607, 1.505794, 0.4588235, 0, 1, 1,
0.576453, -1.668356, 1.390579, 0.4627451, 0, 1, 1,
0.580134, -1.104051, 3.311797, 0.4705882, 0, 1, 1,
0.5825871, 0.1893417, 2.448846, 0.4745098, 0, 1, 1,
0.5902473, 0.1588637, 1.420673, 0.4823529, 0, 1, 1,
0.5918604, 1.711968, 1.294618, 0.4862745, 0, 1, 1,
0.6030756, -0.5972066, 1.741599, 0.4941176, 0, 1, 1,
0.605041, 0.9691036, 0.1420219, 0.5019608, 0, 1, 1,
0.6055316, -0.2579225, 1.81256, 0.5058824, 0, 1, 1,
0.6059545, 0.06708825, 1.992434, 0.5137255, 0, 1, 1,
0.6061438, -0.7531394, 2.780313, 0.5176471, 0, 1, 1,
0.6110002, 0.03070527, 0.3351898, 0.5254902, 0, 1, 1,
0.6154039, -0.3824989, 2.548277, 0.5294118, 0, 1, 1,
0.6167305, 0.0765053, -0.3031287, 0.5372549, 0, 1, 1,
0.6186405, 0.3543735, 0.03043167, 0.5411765, 0, 1, 1,
0.6232948, -1.482272, 4.026255, 0.5490196, 0, 1, 1,
0.6240051, -1.104051, 3.25202, 0.5529412, 0, 1, 1,
0.6263157, 1.185289, 1.098544, 0.5607843, 0, 1, 1,
0.6271569, -1.378496, 2.558052, 0.5647059, 0, 1, 1,
0.6275799, -0.6123334, 2.487342, 0.572549, 0, 1, 1,
0.633954, 0.01184015, 0.7750332, 0.5764706, 0, 1, 1,
0.6341826, -2.100398, 3.001779, 0.5843138, 0, 1, 1,
0.6346357, -1.612196, 3.279577, 0.5882353, 0, 1, 1,
0.6415592, 0.144421, 1.340222, 0.5960785, 0, 1, 1,
0.6445046, -0.2129646, 3.343457, 0.6039216, 0, 1, 1,
0.6464713, -0.4873676, 1.587391, 0.6078432, 0, 1, 1,
0.6670805, -1.813322, 2.585021, 0.6156863, 0, 1, 1,
0.670488, -1.420908, 1.701478, 0.6196079, 0, 1, 1,
0.6724411, 0.7408563, 1.510262, 0.627451, 0, 1, 1,
0.6738663, 0.5182862, 1.625057, 0.6313726, 0, 1, 1,
0.6759809, 0.5181865, 1.207268, 0.6392157, 0, 1, 1,
0.6852767, -0.3093703, 0.7189291, 0.6431373, 0, 1, 1,
0.6861976, -0.8227124, 3.531581, 0.6509804, 0, 1, 1,
0.6867281, -0.04047174, 2.593608, 0.654902, 0, 1, 1,
0.6878691, 1.304469, -0.08334449, 0.6627451, 0, 1, 1,
0.6927094, -0.631576, 1.759472, 0.6666667, 0, 1, 1,
0.6976249, -0.881121, 2.559454, 0.6745098, 0, 1, 1,
0.70628, 0.05342646, -0.6270165, 0.6784314, 0, 1, 1,
0.7119296, -1.007034, 2.52338, 0.6862745, 0, 1, 1,
0.7128407, 0.3858002, 0.5853834, 0.6901961, 0, 1, 1,
0.7143142, 0.8359562, 0.2531747, 0.6980392, 0, 1, 1,
0.7188171, 0.1608015, 2.147773, 0.7058824, 0, 1, 1,
0.7195874, -0.5231004, 2.066126, 0.7098039, 0, 1, 1,
0.7207456, 0.6784041, 0.7070858, 0.7176471, 0, 1, 1,
0.7255758, 1.992805, 3.367811, 0.7215686, 0, 1, 1,
0.7266226, -1.063292, 3.284881, 0.7294118, 0, 1, 1,
0.7322043, -0.9153352, 2.129419, 0.7333333, 0, 1, 1,
0.7333483, -0.6300474, 1.508741, 0.7411765, 0, 1, 1,
0.7353888, 0.4339039, 2.096634, 0.7450981, 0, 1, 1,
0.7404614, 1.800023, -0.7670981, 0.7529412, 0, 1, 1,
0.7446159, -0.690433, 3.052917, 0.7568628, 0, 1, 1,
0.7459862, 0.1503452, 1.992885, 0.7647059, 0, 1, 1,
0.7479538, -1.067222, 4.395002, 0.7686275, 0, 1, 1,
0.7480556, -1.461004, 3.336333, 0.7764706, 0, 1, 1,
0.7503954, 2.033338, 1.726926, 0.7803922, 0, 1, 1,
0.7549925, -0.2380817, 3.464125, 0.7882353, 0, 1, 1,
0.7556321, 0.1832367, 1.918254, 0.7921569, 0, 1, 1,
0.7565258, -1.128941, 2.170861, 0.8, 0, 1, 1,
0.7587498, -1.937066, 4.314599, 0.8078431, 0, 1, 1,
0.7590008, -0.2809592, 0.9595848, 0.8117647, 0, 1, 1,
0.7627865, 1.83253, 0.528565, 0.8196079, 0, 1, 1,
0.7635257, 1.291987, 0.4938718, 0.8235294, 0, 1, 1,
0.7670408, -0.5762646, 3.844455, 0.8313726, 0, 1, 1,
0.7719991, -0.7703377, 2.026421, 0.8352941, 0, 1, 1,
0.7956354, 2.660299, -1.060475, 0.8431373, 0, 1, 1,
0.7969553, 0.3779391, 0.9770516, 0.8470588, 0, 1, 1,
0.7970014, -1.768316, 1.930102, 0.854902, 0, 1, 1,
0.801159, 0.7468122, 0.6273179, 0.8588235, 0, 1, 1,
0.8062738, 0.2711027, 0.5654839, 0.8666667, 0, 1, 1,
0.812665, -2.083977, 3.360816, 0.8705882, 0, 1, 1,
0.8129362, 1.283523, 0.1587066, 0.8784314, 0, 1, 1,
0.8175882, 1.16088, 1.583632, 0.8823529, 0, 1, 1,
0.8197707, -0.5381563, 3.135297, 0.8901961, 0, 1, 1,
0.8227502, 1.288019, 1.018502, 0.8941177, 0, 1, 1,
0.8250256, 1.255026, -0.03499196, 0.9019608, 0, 1, 1,
0.8284141, -0.3941786, 1.682286, 0.9098039, 0, 1, 1,
0.8306063, -0.4422918, 4.038132, 0.9137255, 0, 1, 1,
0.8352935, -0.3278161, 0.9593142, 0.9215686, 0, 1, 1,
0.8414641, -0.9048582, 1.250936, 0.9254902, 0, 1, 1,
0.8485636, 0.7164909, 1.666908, 0.9333333, 0, 1, 1,
0.853609, -0.8792611, 2.127337, 0.9372549, 0, 1, 1,
0.8542178, 0.7294224, 0.8129115, 0.945098, 0, 1, 1,
0.8557074, 0.7069154, 1.177817, 0.9490196, 0, 1, 1,
0.8586435, -0.2288934, 2.247362, 0.9568627, 0, 1, 1,
0.859948, -0.2008207, 2.800481, 0.9607843, 0, 1, 1,
0.860586, 1.09685, 0.9920766, 0.9686275, 0, 1, 1,
0.8608747, -0.9001666, 1.895125, 0.972549, 0, 1, 1,
0.8635424, -0.6941975, 1.789039, 0.9803922, 0, 1, 1,
0.86704, 2.174828, 0.6229932, 0.9843137, 0, 1, 1,
0.8752413, 0.8737634, 1.181246, 0.9921569, 0, 1, 1,
0.8800789, -0.4515468, 2.038315, 0.9960784, 0, 1, 1,
0.886683, 0.6878676, 1.406211, 1, 0, 0.9960784, 1,
0.8937818, 0.06903908, 1.13136, 1, 0, 0.9882353, 1,
0.9018366, -0.578478, 1.137059, 1, 0, 0.9843137, 1,
0.9037204, 0.1440551, -0.09533729, 1, 0, 0.9764706, 1,
0.9038786, 0.7721601, 0.3442242, 1, 0, 0.972549, 1,
0.9076426, -1.538891, 1.981895, 1, 0, 0.9647059, 1,
0.90915, 0.4131421, 1.658348, 1, 0, 0.9607843, 1,
0.916074, -1.430831, 1.480026, 1, 0, 0.9529412, 1,
0.9244635, 0.1018798, 1.526957, 1, 0, 0.9490196, 1,
0.9276763, 0.2566236, 1.44594, 1, 0, 0.9411765, 1,
0.9279062, -0.2534512, 1.222489, 1, 0, 0.9372549, 1,
0.9349148, -1.158086, 2.11827, 1, 0, 0.9294118, 1,
0.9362166, -0.3063626, 1.584628, 1, 0, 0.9254902, 1,
0.9420493, -0.6625578, 1.031969, 1, 0, 0.9176471, 1,
0.9455049, -0.01490587, 2.325513, 1, 0, 0.9137255, 1,
0.9515594, -0.966585, 1.995679, 1, 0, 0.9058824, 1,
0.9536301, 0.2419541, 1.226661, 1, 0, 0.9019608, 1,
0.9581274, -0.1737631, 2.502345, 1, 0, 0.8941177, 1,
0.959037, -0.04116512, 0.8050726, 1, 0, 0.8862745, 1,
0.9633812, -1.180258, 2.803349, 1, 0, 0.8823529, 1,
0.9729681, 0.3329636, 3.355715, 1, 0, 0.8745098, 1,
0.9898415, -1.161744, 2.87494, 1, 0, 0.8705882, 1,
0.9920385, 0.2958267, 2.516918, 1, 0, 0.8627451, 1,
0.9973187, -0.7604262, 2.088926, 1, 0, 0.8588235, 1,
0.9973345, -0.5819206, 0.1481904, 1, 0, 0.8509804, 1,
0.9978359, 1.105448, 2.377332, 1, 0, 0.8470588, 1,
1.001502, 0.4061798, 0.7265853, 1, 0, 0.8392157, 1,
1.003061, 1.064282, 0.714016, 1, 0, 0.8352941, 1,
1.010901, -0.995322, 0.3409655, 1, 0, 0.827451, 1,
1.014404, 0.7265235, -0.182468, 1, 0, 0.8235294, 1,
1.037908, 0.183003, 1.488198, 1, 0, 0.8156863, 1,
1.040536, -1.264405, 3.733174, 1, 0, 0.8117647, 1,
1.041444, 1.115092, 0.6004348, 1, 0, 0.8039216, 1,
1.04158, -1.344057, 1.169648, 1, 0, 0.7960784, 1,
1.052055, -0.1007097, 1.079902, 1, 0, 0.7921569, 1,
1.054183, 0.3143083, 1.882701, 1, 0, 0.7843137, 1,
1.055166, 0.2144775, 2.358372, 1, 0, 0.7803922, 1,
1.056506, -0.679558, 1.559782, 1, 0, 0.772549, 1,
1.057797, -1.793388, 2.818844, 1, 0, 0.7686275, 1,
1.062785, -0.06866298, 1.439922, 1, 0, 0.7607843, 1,
1.073931, -0.01003617, -0.6995686, 1, 0, 0.7568628, 1,
1.086371, 1.712184, 0.9695505, 1, 0, 0.7490196, 1,
1.108704, 0.02326568, 1.647933, 1, 0, 0.7450981, 1,
1.115499, 0.415968, 0.9736544, 1, 0, 0.7372549, 1,
1.117486, -1.810036, 2.256317, 1, 0, 0.7333333, 1,
1.135184, 1.276584, -1.628013, 1, 0, 0.7254902, 1,
1.136038, -0.02074594, 3.023989, 1, 0, 0.7215686, 1,
1.137914, -1.393664, 2.32206, 1, 0, 0.7137255, 1,
1.143068, 1.571949, 0.7310091, 1, 0, 0.7098039, 1,
1.145327, 0.1285192, 0.8731968, 1, 0, 0.7019608, 1,
1.146571, 0.2799102, 0.9884914, 1, 0, 0.6941177, 1,
1.149563, -0.3088915, 2.675824, 1, 0, 0.6901961, 1,
1.159004, 1.812518, 0.4744232, 1, 0, 0.682353, 1,
1.160606, -0.1170545, 1.050579, 1, 0, 0.6784314, 1,
1.161245, -0.6391327, 1.163893, 1, 0, 0.6705883, 1,
1.162557, -0.01462439, 1.528903, 1, 0, 0.6666667, 1,
1.169183, 0.4385437, 1.854738, 1, 0, 0.6588235, 1,
1.170269, 0.193944, -0.6946585, 1, 0, 0.654902, 1,
1.177006, -0.1131943, 2.061959, 1, 0, 0.6470588, 1,
1.187533, -0.1934321, 1.184021, 1, 0, 0.6431373, 1,
1.187972, 0.6738481, -0.02821201, 1, 0, 0.6352941, 1,
1.191333, -1.370316, 1.87708, 1, 0, 0.6313726, 1,
1.193747, 0.1864599, 2.649185, 1, 0, 0.6235294, 1,
1.19643, -1.532833, 3.266752, 1, 0, 0.6196079, 1,
1.200882, -0.2541946, -0.2491448, 1, 0, 0.6117647, 1,
1.20327, 0.009805479, 1.241114, 1, 0, 0.6078432, 1,
1.208132, -0.4063741, 3.434249, 1, 0, 0.6, 1,
1.213544, -1.651084, 2.793741, 1, 0, 0.5921569, 1,
1.215104, -0.1352938, 2.977134, 1, 0, 0.5882353, 1,
1.224323, -1.212853, 2.067168, 1, 0, 0.5803922, 1,
1.240518, 0.5331888, 2.052598, 1, 0, 0.5764706, 1,
1.244723, -1.240516, 1.220288, 1, 0, 0.5686275, 1,
1.247528, 0.3585215, -0.01367784, 1, 0, 0.5647059, 1,
1.260003, -0.5956101, 2.103189, 1, 0, 0.5568628, 1,
1.262473, 1.221221, -0.5526769, 1, 0, 0.5529412, 1,
1.26273, 0.3931013, 0.4617184, 1, 0, 0.5450981, 1,
1.269791, -1.4022, 2.653339, 1, 0, 0.5411765, 1,
1.277183, -0.3203373, 0.3124856, 1, 0, 0.5333334, 1,
1.277936, 0.598428, -0.2900414, 1, 0, 0.5294118, 1,
1.283425, 2.696386, -0.76085, 1, 0, 0.5215687, 1,
1.284717, 0.5642809, 0.3738867, 1, 0, 0.5176471, 1,
1.288111, -1.346286, 0.6278315, 1, 0, 0.509804, 1,
1.288479, 0.5310059, 1.226554, 1, 0, 0.5058824, 1,
1.300555, 0.8822135, -0.7230003, 1, 0, 0.4980392, 1,
1.304875, 0.742537, 2.577218, 1, 0, 0.4901961, 1,
1.320569, -2.41206, 5.014849, 1, 0, 0.4862745, 1,
1.326541, 0.2231611, 3.196555, 1, 0, 0.4784314, 1,
1.328019, 0.8790423, 0.6521063, 1, 0, 0.4745098, 1,
1.329964, -0.9929514, 3.187833, 1, 0, 0.4666667, 1,
1.333944, -1.056986, 1.828667, 1, 0, 0.4627451, 1,
1.3357, 0.2208967, 2.584315, 1, 0, 0.454902, 1,
1.338349, -0.9351479, 4.546457, 1, 0, 0.4509804, 1,
1.338642, 1.181406, 0.02894653, 1, 0, 0.4431373, 1,
1.346753, -0.5801913, 0.8748721, 1, 0, 0.4392157, 1,
1.358262, -0.7954625, 2.75052, 1, 0, 0.4313726, 1,
1.370408, -0.07952552, 2.233317, 1, 0, 0.427451, 1,
1.385996, -1.513104, 3.321944, 1, 0, 0.4196078, 1,
1.398694, 2.407433, 2.209168, 1, 0, 0.4156863, 1,
1.401382, 0.08121974, 2.0843, 1, 0, 0.4078431, 1,
1.417239, -1.375834, 2.115738, 1, 0, 0.4039216, 1,
1.425954, 0.3077982, 1.872914, 1, 0, 0.3960784, 1,
1.429259, -0.4261856, 1.39652, 1, 0, 0.3882353, 1,
1.430729, 0.1069, 2.250502, 1, 0, 0.3843137, 1,
1.431656, 0.9550439, 1.652078, 1, 0, 0.3764706, 1,
1.440103, 1.386266, 1.23105, 1, 0, 0.372549, 1,
1.454603, 0.4349837, 0.7249337, 1, 0, 0.3647059, 1,
1.459064, -0.4943308, 1.01622, 1, 0, 0.3607843, 1,
1.463548, 1.344116, 0.5033336, 1, 0, 0.3529412, 1,
1.472223, 0.470942, 1.692, 1, 0, 0.3490196, 1,
1.479649, 0.543287, 1.635574, 1, 0, 0.3411765, 1,
1.488062, 0.6288171, 0.8034161, 1, 0, 0.3372549, 1,
1.490106, 0.2791668, 0.7975917, 1, 0, 0.3294118, 1,
1.497947, -1.140462, 1.915828, 1, 0, 0.3254902, 1,
1.509801, 2.454051, 0.545375, 1, 0, 0.3176471, 1,
1.522219, -0.06563707, 1.277105, 1, 0, 0.3137255, 1,
1.529755, -0.9833366, 3.004207, 1, 0, 0.3058824, 1,
1.537204, 2.365258, 1.173883, 1, 0, 0.2980392, 1,
1.546721, 1.640294, 1.901484, 1, 0, 0.2941177, 1,
1.580003, 0.287519, 1.505231, 1, 0, 0.2862745, 1,
1.58198, -0.0101907, 0.4254259, 1, 0, 0.282353, 1,
1.58268, 1.330877, 1.992008, 1, 0, 0.2745098, 1,
1.5905, 0.4832679, 1.626507, 1, 0, 0.2705882, 1,
1.592229, 0.509078, 1.090058, 1, 0, 0.2627451, 1,
1.593338, -1.187321, 2.373138, 1, 0, 0.2588235, 1,
1.601469, 0.0233101, 0.9055288, 1, 0, 0.2509804, 1,
1.608603, 0.4668543, 1.988161, 1, 0, 0.2470588, 1,
1.617886, -0.105638, 1.14987, 1, 0, 0.2392157, 1,
1.640481, -1.368376, 1.724827, 1, 0, 0.2352941, 1,
1.641834, 0.2990499, 0.9781792, 1, 0, 0.227451, 1,
1.649381, -1.428167, 1.846527, 1, 0, 0.2235294, 1,
1.679865, 1.411166, 0.9815986, 1, 0, 0.2156863, 1,
1.722338, 0.570371, 1.255406, 1, 0, 0.2117647, 1,
1.723384, 1.389493, 0.1029479, 1, 0, 0.2039216, 1,
1.728609, 0.5633579, 3.249533, 1, 0, 0.1960784, 1,
1.733743, 1.02862, 2.051541, 1, 0, 0.1921569, 1,
1.735595, -0.04980523, 2.556622, 1, 0, 0.1843137, 1,
1.738079, -1.668902, 4.033172, 1, 0, 0.1803922, 1,
1.748529, -0.2757491, 2.13683, 1, 0, 0.172549, 1,
1.794675, -0.6783, 2.858518, 1, 0, 0.1686275, 1,
1.803003, 0.5595843, 2.465779, 1, 0, 0.1607843, 1,
1.877803, -0.4633596, 0.3938192, 1, 0, 0.1568628, 1,
1.956618, -1.604797, 3.380061, 1, 0, 0.1490196, 1,
1.962642, 1.232173, 0.5463018, 1, 0, 0.145098, 1,
1.971153, 0.3064746, 2.213773, 1, 0, 0.1372549, 1,
1.985992, 0.00816359, 1.536592, 1, 0, 0.1333333, 1,
2.012489, -0.1854611, 1.65644, 1, 0, 0.1254902, 1,
2.064142, -0.1391062, 2.13403, 1, 0, 0.1215686, 1,
2.067416, 1.193513, 1.77624, 1, 0, 0.1137255, 1,
2.07339, -0.7942305, 1.962743, 1, 0, 0.1098039, 1,
2.116876, -0.7781228, 0.8270839, 1, 0, 0.1019608, 1,
2.121809, -0.8444523, 0.5163704, 1, 0, 0.09411765, 1,
2.13793, -0.1845795, 1.746306, 1, 0, 0.09019608, 1,
2.16133, -0.7568637, 3.512117, 1, 0, 0.08235294, 1,
2.23501, -1.658601, 3.906285, 1, 0, 0.07843138, 1,
2.247263, -1.403891, 2.98408, 1, 0, 0.07058824, 1,
2.283031, 0.9157929, 1.020755, 1, 0, 0.06666667, 1,
2.311385, 0.7416617, 0.05984689, 1, 0, 0.05882353, 1,
2.4599, 1.316634, 2.160048, 1, 0, 0.05490196, 1,
2.520162, -0.1645813, 1.572172, 1, 0, 0.04705882, 1,
2.546393, -0.1726302, 2.020297, 1, 0, 0.04313726, 1,
2.585005, -0.4708199, 1.116594, 1, 0, 0.03529412, 1,
2.642258, -1.412841, 2.926141, 1, 0, 0.03137255, 1,
2.848619, -0.7719799, 1.382379, 1, 0, 0.02352941, 1,
2.922694, -0.2435168, 1.172964, 1, 0, 0.01960784, 1,
3.013804, 1.595007, 0.566449, 1, 0, 0.01176471, 1,
3.133522, -0.08138925, 3.207808, 1, 0, 0.007843138, 1
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
-0.05573988, -5.111703, -6.806769, 0, -0.5, 0.5, 0.5,
-0.05573988, -5.111703, -6.806769, 1, -0.5, 0.5, 0.5,
-0.05573988, -5.111703, -6.806769, 1, 1.5, 0.5, 0.5,
-0.05573988, -5.111703, -6.806769, 0, 1.5, 0.5, 0.5
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
-4.326161, -0.5554405, -6.806769, 0, -0.5, 0.5, 0.5,
-4.326161, -0.5554405, -6.806769, 1, -0.5, 0.5, 0.5,
-4.326161, -0.5554405, -6.806769, 1, 1.5, 0.5, 0.5,
-4.326161, -0.5554405, -6.806769, 0, 1.5, 0.5, 0.5
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
-4.326161, -5.111703, -0.02658606, 0, -0.5, 0.5, 0.5,
-4.326161, -5.111703, -0.02658606, 1, -0.5, 0.5, 0.5,
-4.326161, -5.111703, -0.02658606, 1, 1.5, 0.5, 0.5,
-4.326161, -5.111703, -0.02658606, 0, 1.5, 0.5, 0.5
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
-3, -4.060258, -5.242112,
3, -4.060258, -5.242112,
-3, -4.060258, -5.242112,
-3, -4.235499, -5.502888,
-2, -4.060258, -5.242112,
-2, -4.235499, -5.502888,
-1, -4.060258, -5.242112,
-1, -4.235499, -5.502888,
0, -4.060258, -5.242112,
0, -4.235499, -5.502888,
1, -4.060258, -5.242112,
1, -4.235499, -5.502888,
2, -4.060258, -5.242112,
2, -4.235499, -5.502888,
3, -4.060258, -5.242112,
3, -4.235499, -5.502888
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
-3, -4.58598, -6.024441, 0, -0.5, 0.5, 0.5,
-3, -4.58598, -6.024441, 1, -0.5, 0.5, 0.5,
-3, -4.58598, -6.024441, 1, 1.5, 0.5, 0.5,
-3, -4.58598, -6.024441, 0, 1.5, 0.5, 0.5,
-2, -4.58598, -6.024441, 0, -0.5, 0.5, 0.5,
-2, -4.58598, -6.024441, 1, -0.5, 0.5, 0.5,
-2, -4.58598, -6.024441, 1, 1.5, 0.5, 0.5,
-2, -4.58598, -6.024441, 0, 1.5, 0.5, 0.5,
-1, -4.58598, -6.024441, 0, -0.5, 0.5, 0.5,
-1, -4.58598, -6.024441, 1, -0.5, 0.5, 0.5,
-1, -4.58598, -6.024441, 1, 1.5, 0.5, 0.5,
-1, -4.58598, -6.024441, 0, 1.5, 0.5, 0.5,
0, -4.58598, -6.024441, 0, -0.5, 0.5, 0.5,
0, -4.58598, -6.024441, 1, -0.5, 0.5, 0.5,
0, -4.58598, -6.024441, 1, 1.5, 0.5, 0.5,
0, -4.58598, -6.024441, 0, 1.5, 0.5, 0.5,
1, -4.58598, -6.024441, 0, -0.5, 0.5, 0.5,
1, -4.58598, -6.024441, 1, -0.5, 0.5, 0.5,
1, -4.58598, -6.024441, 1, 1.5, 0.5, 0.5,
1, -4.58598, -6.024441, 0, 1.5, 0.5, 0.5,
2, -4.58598, -6.024441, 0, -0.5, 0.5, 0.5,
2, -4.58598, -6.024441, 1, -0.5, 0.5, 0.5,
2, -4.58598, -6.024441, 1, 1.5, 0.5, 0.5,
2, -4.58598, -6.024441, 0, 1.5, 0.5, 0.5,
3, -4.58598, -6.024441, 0, -0.5, 0.5, 0.5,
3, -4.58598, -6.024441, 1, -0.5, 0.5, 0.5,
3, -4.58598, -6.024441, 1, 1.5, 0.5, 0.5,
3, -4.58598, -6.024441, 0, 1.5, 0.5, 0.5
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
-3.340679, -3, -5.242112,
-3.340679, 2, -5.242112,
-3.340679, -3, -5.242112,
-3.504926, -3, -5.502888,
-3.340679, -2, -5.242112,
-3.504926, -2, -5.502888,
-3.340679, -1, -5.242112,
-3.504926, -1, -5.502888,
-3.340679, 0, -5.242112,
-3.504926, 0, -5.502888,
-3.340679, 1, -5.242112,
-3.504926, 1, -5.502888,
-3.340679, 2, -5.242112,
-3.504926, 2, -5.502888
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
-3.83342, -3, -6.024441, 0, -0.5, 0.5, 0.5,
-3.83342, -3, -6.024441, 1, -0.5, 0.5, 0.5,
-3.83342, -3, -6.024441, 1, 1.5, 0.5, 0.5,
-3.83342, -3, -6.024441, 0, 1.5, 0.5, 0.5,
-3.83342, -2, -6.024441, 0, -0.5, 0.5, 0.5,
-3.83342, -2, -6.024441, 1, -0.5, 0.5, 0.5,
-3.83342, -2, -6.024441, 1, 1.5, 0.5, 0.5,
-3.83342, -2, -6.024441, 0, 1.5, 0.5, 0.5,
-3.83342, -1, -6.024441, 0, -0.5, 0.5, 0.5,
-3.83342, -1, -6.024441, 1, -0.5, 0.5, 0.5,
-3.83342, -1, -6.024441, 1, 1.5, 0.5, 0.5,
-3.83342, -1, -6.024441, 0, 1.5, 0.5, 0.5,
-3.83342, 0, -6.024441, 0, -0.5, 0.5, 0.5,
-3.83342, 0, -6.024441, 1, -0.5, 0.5, 0.5,
-3.83342, 0, -6.024441, 1, 1.5, 0.5, 0.5,
-3.83342, 0, -6.024441, 0, 1.5, 0.5, 0.5,
-3.83342, 1, -6.024441, 0, -0.5, 0.5, 0.5,
-3.83342, 1, -6.024441, 1, -0.5, 0.5, 0.5,
-3.83342, 1, -6.024441, 1, 1.5, 0.5, 0.5,
-3.83342, 1, -6.024441, 0, 1.5, 0.5, 0.5,
-3.83342, 2, -6.024441, 0, -0.5, 0.5, 0.5,
-3.83342, 2, -6.024441, 1, -0.5, 0.5, 0.5,
-3.83342, 2, -6.024441, 1, 1.5, 0.5, 0.5,
-3.83342, 2, -6.024441, 0, 1.5, 0.5, 0.5
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
-3.340679, -4.060258, -4,
-3.340679, -4.060258, 4,
-3.340679, -4.060258, -4,
-3.504926, -4.235499, -4,
-3.340679, -4.060258, -2,
-3.504926, -4.235499, -2,
-3.340679, -4.060258, 0,
-3.504926, -4.235499, 0,
-3.340679, -4.060258, 2,
-3.504926, -4.235499, 2,
-3.340679, -4.060258, 4,
-3.504926, -4.235499, 4
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
-3.83342, -4.58598, -4, 0, -0.5, 0.5, 0.5,
-3.83342, -4.58598, -4, 1, -0.5, 0.5, 0.5,
-3.83342, -4.58598, -4, 1, 1.5, 0.5, 0.5,
-3.83342, -4.58598, -4, 0, 1.5, 0.5, 0.5,
-3.83342, -4.58598, -2, 0, -0.5, 0.5, 0.5,
-3.83342, -4.58598, -2, 1, -0.5, 0.5, 0.5,
-3.83342, -4.58598, -2, 1, 1.5, 0.5, 0.5,
-3.83342, -4.58598, -2, 0, 1.5, 0.5, 0.5,
-3.83342, -4.58598, 0, 0, -0.5, 0.5, 0.5,
-3.83342, -4.58598, 0, 1, -0.5, 0.5, 0.5,
-3.83342, -4.58598, 0, 1, 1.5, 0.5, 0.5,
-3.83342, -4.58598, 0, 0, 1.5, 0.5, 0.5,
-3.83342, -4.58598, 2, 0, -0.5, 0.5, 0.5,
-3.83342, -4.58598, 2, 1, -0.5, 0.5, 0.5,
-3.83342, -4.58598, 2, 1, 1.5, 0.5, 0.5,
-3.83342, -4.58598, 2, 0, 1.5, 0.5, 0.5,
-3.83342, -4.58598, 4, 0, -0.5, 0.5, 0.5,
-3.83342, -4.58598, 4, 1, -0.5, 0.5, 0.5,
-3.83342, -4.58598, 4, 1, 1.5, 0.5, 0.5,
-3.83342, -4.58598, 4, 0, 1.5, 0.5, 0.5
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
-3.340679, -4.060258, -5.242112,
-3.340679, 2.949377, -5.242112,
-3.340679, -4.060258, 5.18894,
-3.340679, 2.949377, 5.18894,
-3.340679, -4.060258, -5.242112,
-3.340679, -4.060258, 5.18894,
-3.340679, 2.949377, -5.242112,
-3.340679, 2.949377, 5.18894,
-3.340679, -4.060258, -5.242112,
3.2292, -4.060258, -5.242112,
-3.340679, -4.060258, 5.18894,
3.2292, -4.060258, 5.18894,
-3.340679, 2.949377, -5.242112,
3.2292, 2.949377, -5.242112,
-3.340679, 2.949377, 5.18894,
3.2292, 2.949377, 5.18894,
3.2292, -4.060258, -5.242112,
3.2292, 2.949377, -5.242112,
3.2292, -4.060258, 5.18894,
3.2292, 2.949377, 5.18894,
3.2292, -4.060258, -5.242112,
3.2292, -4.060258, 5.18894,
3.2292, 2.949377, -5.242112,
3.2292, 2.949377, 5.18894
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
var radius = 7.572461;
var distance = 33.69073;
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
mvMatrix.translate( 0.05573988, 0.5554405, 0.02658606 );
mvMatrix.scale( 1.246217, 1.168034, 0.7849154 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.69073);
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
cis-Dichloropropene<-read.table("cis-Dichloropropene.xyz")
```

```
## Error in read.table("cis-Dichloropropene.xyz"): no lines available in input
```

```r
x<-cis-Dichloropropene$V2
```

```
## Error in eval(expr, envir, enclos): object 'cis' not found
```

```r
y<-cis-Dichloropropene$V3
```

```
## Error in eval(expr, envir, enclos): object 'cis' not found
```

```r
z<-cis-Dichloropropene$V4
```

```
## Error in eval(expr, envir, enclos): object 'cis' not found
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
-3.245002, 0.2621458, -0.8021579, 0, 0, 1, 1, 1,
-2.959581, -1.259865, -3.472172, 1, 0, 0, 1, 1,
-2.885707, -0.6417958, -2.830952, 1, 0, 0, 1, 1,
-2.750694, -1.019162, -3.896562, 1, 0, 0, 1, 1,
-2.517569, -0.6542873, -0.01835282, 1, 0, 0, 1, 1,
-2.488454, -0.9703017, -2.158238, 1, 0, 0, 1, 1,
-2.480507, -0.7347695, -3.139601, 0, 0, 0, 1, 1,
-2.369183, -0.291385, -1.700166, 0, 0, 0, 1, 1,
-2.368034, 0.4288743, 1.017862, 0, 0, 0, 1, 1,
-2.352738, 1.540159, 0.7867857, 0, 0, 0, 1, 1,
-2.329225, -1.355726, -1.797339, 0, 0, 0, 1, 1,
-2.306014, 0.454123, -0.9601552, 0, 0, 0, 1, 1,
-2.299999, -1.121765, -3.349453, 0, 0, 0, 1, 1,
-2.265709, -1.685882, -1.747184, 1, 1, 1, 1, 1,
-2.262132, -1.44811, -3.673692, 1, 1, 1, 1, 1,
-2.247872, -1.39852, -2.407426, 1, 1, 1, 1, 1,
-2.239898, 0.04658892, -0.9157465, 1, 1, 1, 1, 1,
-2.207644, -0.1560931, -2.369009, 1, 1, 1, 1, 1,
-2.167221, 1.218016, -1.525588, 1, 1, 1, 1, 1,
-2.166403, 0.1013934, -1.269868, 1, 1, 1, 1, 1,
-2.141021, -0.8886299, -2.34795, 1, 1, 1, 1, 1,
-2.096963, 0.7180213, -1.999084, 1, 1, 1, 1, 1,
-2.093594, 0.5914473, -1.850214, 1, 1, 1, 1, 1,
-2.092728, 0.2854181, -2.034658, 1, 1, 1, 1, 1,
-2.087527, -0.3858599, -0.7876483, 1, 1, 1, 1, 1,
-2.040293, 0.4928369, -0.5478907, 1, 1, 1, 1, 1,
-2.011708, 0.3528668, -0.2115616, 1, 1, 1, 1, 1,
-1.9905, -0.4040638, -2.274747, 1, 1, 1, 1, 1,
-1.983266, -0.6035111, -0.4761666, 0, 0, 1, 1, 1,
-1.976463, 0.05042842, -0.3847126, 1, 0, 0, 1, 1,
-1.969677, 1.346415, -0.7897987, 1, 0, 0, 1, 1,
-1.955086, 0.6279815, -1.786426, 1, 0, 0, 1, 1,
-1.945885, -0.699492, -1.295451, 1, 0, 0, 1, 1,
-1.942921, -0.2383208, -1.101244, 1, 0, 0, 1, 1,
-1.926761, -0.9656122, 1.254918, 0, 0, 0, 1, 1,
-1.900165, -0.6800815, -1.17087, 0, 0, 0, 1, 1,
-1.898008, 0.2546634, -3.753238, 0, 0, 0, 1, 1,
-1.897001, 0.2794666, -1.262623, 0, 0, 0, 1, 1,
-1.895549, 1.540341, 0.1173823, 0, 0, 0, 1, 1,
-1.877878, -2.69867, -3.684087, 0, 0, 0, 1, 1,
-1.872163, 0.5143764, -0.6259081, 0, 0, 0, 1, 1,
-1.865959, 0.8259507, -0.8779248, 1, 1, 1, 1, 1,
-1.865195, 0.709907, -1.808143, 1, 1, 1, 1, 1,
-1.825961, 0.938053, -1.476737, 1, 1, 1, 1, 1,
-1.822379, -1.679571, -1.364719, 1, 1, 1, 1, 1,
-1.808489, 0.5398905, 0.2395909, 1, 1, 1, 1, 1,
-1.797737, -0.5589952, -2.507827, 1, 1, 1, 1, 1,
-1.791528, -0.5285702, -3.155679, 1, 1, 1, 1, 1,
-1.784677, -0.1927204, -1.440412, 1, 1, 1, 1, 1,
-1.784037, -0.234965, -1.699458, 1, 1, 1, 1, 1,
-1.776809, 1.164516, -0.8058314, 1, 1, 1, 1, 1,
-1.767211, 1.368591, -2.653908, 1, 1, 1, 1, 1,
-1.75293, 0.7372152, -2.106695, 1, 1, 1, 1, 1,
-1.74973, 1.747812, -1.801892, 1, 1, 1, 1, 1,
-1.712445, -1.128473, -3.121246, 1, 1, 1, 1, 1,
-1.703745, 1.45792, -1.767554, 1, 1, 1, 1, 1,
-1.699665, 0.9212385, -2.863374, 0, 0, 1, 1, 1,
-1.694516, 0.9267341, 0.10057, 1, 0, 0, 1, 1,
-1.679713, 0.3693235, -1.980274, 1, 0, 0, 1, 1,
-1.654925, -0.7619515, -1.936117, 1, 0, 0, 1, 1,
-1.654601, -0.4403415, -0.9753205, 1, 0, 0, 1, 1,
-1.650074, -1.128352, -3.393711, 1, 0, 0, 1, 1,
-1.623974, -1.621038, -2.98664, 0, 0, 0, 1, 1,
-1.623705, -0.07665776, -2.2315, 0, 0, 0, 1, 1,
-1.619777, 1.411094, -1.822852, 0, 0, 0, 1, 1,
-1.600612, -0.7569539, -2.880089, 0, 0, 0, 1, 1,
-1.586746, -0.5026121, -2.205759, 0, 0, 0, 1, 1,
-1.585667, 0.1758327, -1.822482, 0, 0, 0, 1, 1,
-1.578282, 0.2079643, -3.111117, 0, 0, 0, 1, 1,
-1.568849, -0.3892463, -2.826307, 1, 1, 1, 1, 1,
-1.568309, -1.356025, -2.348425, 1, 1, 1, 1, 1,
-1.562462, 0.08854029, -1.91929, 1, 1, 1, 1, 1,
-1.558971, -1.27253, -3.921591, 1, 1, 1, 1, 1,
-1.557038, -0.7585308, -2.181013, 1, 1, 1, 1, 1,
-1.555393, -0.08168057, -0.7055583, 1, 1, 1, 1, 1,
-1.548278, 1.852377, -2.91497, 1, 1, 1, 1, 1,
-1.541125, 0.314469, -0.4514081, 1, 1, 1, 1, 1,
-1.540835, 1.111432, 0.6966873, 1, 1, 1, 1, 1,
-1.53706, 1.189153, -3.082262, 1, 1, 1, 1, 1,
-1.535382, 1.372585, -1.472104, 1, 1, 1, 1, 1,
-1.52132, 0.736547, -1.275402, 1, 1, 1, 1, 1,
-1.517507, 1.004858, -2.727834, 1, 1, 1, 1, 1,
-1.500341, 0.9687843, 1.704551, 1, 1, 1, 1, 1,
-1.496103, 0.05962892, 0.2420337, 1, 1, 1, 1, 1,
-1.49067, -0.3010057, -0.8295926, 0, 0, 1, 1, 1,
-1.483006, 0.3220988, -0.3083808, 1, 0, 0, 1, 1,
-1.470483, 1.465925, -1.678483, 1, 0, 0, 1, 1,
-1.461131, 0.3677627, 0.1592411, 1, 0, 0, 1, 1,
-1.45752, 1.078847, -0.6835205, 1, 0, 0, 1, 1,
-1.439616, -0.04879779, -1.977619, 1, 0, 0, 1, 1,
-1.426732, -0.5700403, -2.737827, 0, 0, 0, 1, 1,
-1.423603, 0.1505097, -2.959138, 0, 0, 0, 1, 1,
-1.418601, 0.1236076, -0.8710839, 0, 0, 0, 1, 1,
-1.416484, 0.01755776, -2.211179, 0, 0, 0, 1, 1,
-1.410699, -0.421792, -1.122641, 0, 0, 0, 1, 1,
-1.410042, 0.07796346, -1.208154, 0, 0, 0, 1, 1,
-1.409145, -0.5832694, -2.007004, 0, 0, 0, 1, 1,
-1.403754, 1.300435, -1.018013, 1, 1, 1, 1, 1,
-1.392472, 0.4724776, -0.966225, 1, 1, 1, 1, 1,
-1.390305, -0.3579467, -1.297999, 1, 1, 1, 1, 1,
-1.381619, 1.046811, 0.5348222, 1, 1, 1, 1, 1,
-1.380799, 0.431215, -2.967702, 1, 1, 1, 1, 1,
-1.378181, -0.8847333, -1.767455, 1, 1, 1, 1, 1,
-1.37448, 0.5657812, -1.500741, 1, 1, 1, 1, 1,
-1.371342, 1.699072, -0.3629214, 1, 1, 1, 1, 1,
-1.366945, 0.7812472, -1.439972, 1, 1, 1, 1, 1,
-1.365347, -0.2129272, -3.7574, 1, 1, 1, 1, 1,
-1.363498, -0.4411069, -1.153301, 1, 1, 1, 1, 1,
-1.362554, 0.5322456, -1.59099, 1, 1, 1, 1, 1,
-1.361101, 1.436006, -1.822235, 1, 1, 1, 1, 1,
-1.356271, 2.39722, -1.509071, 1, 1, 1, 1, 1,
-1.354616, 1.63314, -0.08608674, 1, 1, 1, 1, 1,
-1.353583, -0.6119799, -2.960566, 0, 0, 1, 1, 1,
-1.34469, -1.389264, -2.07432, 1, 0, 0, 1, 1,
-1.343507, -0.08402832, -2.659386, 1, 0, 0, 1, 1,
-1.341802, 0.8307326, -0.7466617, 1, 0, 0, 1, 1,
-1.33066, 0.575609, 1.019276, 1, 0, 0, 1, 1,
-1.32256, 0.3717017, -1.66179, 1, 0, 0, 1, 1,
-1.313039, 0.2466413, -1.852409, 0, 0, 0, 1, 1,
-1.30608, 0.2040086, -3.204333, 0, 0, 0, 1, 1,
-1.298041, -0.2721654, -0.9434894, 0, 0, 0, 1, 1,
-1.284192, -0.5696297, -2.033407, 0, 0, 0, 1, 1,
-1.273759, -0.9629502, -2.708692, 0, 0, 0, 1, 1,
-1.272615, 0.3614834, -1.338747, 0, 0, 0, 1, 1,
-1.271271, -1.513418, 0.2150996, 0, 0, 0, 1, 1,
-1.263561, 0.9169596, -1.631577, 1, 1, 1, 1, 1,
-1.26324, -1.133967, -2.925709, 1, 1, 1, 1, 1,
-1.262209, -0.4693946, -2.539008, 1, 1, 1, 1, 1,
-1.248808, 0.2789414, -1.529586, 1, 1, 1, 1, 1,
-1.246427, -0.4272549, -1.396839, 1, 1, 1, 1, 1,
-1.237221, 0.1576833, -2.180966, 1, 1, 1, 1, 1,
-1.235086, -0.9273033, -1.317869, 1, 1, 1, 1, 1,
-1.22824, -0.03563982, 0.2678992, 1, 1, 1, 1, 1,
-1.219984, -1.101612, -1.536169, 1, 1, 1, 1, 1,
-1.195894, -0.2286031, -2.543051, 1, 1, 1, 1, 1,
-1.19202, -0.6116083, -3.21249, 1, 1, 1, 1, 1,
-1.189828, 1.421707, -1.422736, 1, 1, 1, 1, 1,
-1.186256, -0.1010861, -1.142744, 1, 1, 1, 1, 1,
-1.177659, -0.7702985, -3.173853, 1, 1, 1, 1, 1,
-1.175898, 0.3768526, -0.3941745, 1, 1, 1, 1, 1,
-1.169834, 0.09619308, 0.04518639, 0, 0, 1, 1, 1,
-1.168535, 1.352502, 0.1797508, 1, 0, 0, 1, 1,
-1.161496, 0.1943989, -3.329537, 1, 0, 0, 1, 1,
-1.154893, 0.8548332, -0.8697261, 1, 0, 0, 1, 1,
-1.154271, 0.1528224, -0.5851215, 1, 0, 0, 1, 1,
-1.153349, -0.003729428, -1.674844, 1, 0, 0, 1, 1,
-1.149818, -0.9314845, -2.264876, 0, 0, 0, 1, 1,
-1.144263, 0.6790436, -1.655085, 0, 0, 0, 1, 1,
-1.132772, -3.958176, -3.203387, 0, 0, 0, 1, 1,
-1.131784, -0.9235995, -0.6509562, 0, 0, 0, 1, 1,
-1.121256, -0.8291956, -1.882302, 0, 0, 0, 1, 1,
-1.112549, 0.500358, -1.926613, 0, 0, 0, 1, 1,
-1.10092, -0.7617281, -1.480896, 0, 0, 0, 1, 1,
-1.099736, -0.2362636, -1.710011, 1, 1, 1, 1, 1,
-1.098642, -0.01411821, -1.36487, 1, 1, 1, 1, 1,
-1.097517, 0.8225902, -1.553349, 1, 1, 1, 1, 1,
-1.095569, 0.7949857, -1.117221, 1, 1, 1, 1, 1,
-1.094364, -1.727619, -2.643441, 1, 1, 1, 1, 1,
-1.092796, 1.210577, 0.4261008, 1, 1, 1, 1, 1,
-1.089957, -0.8013, -3.584785, 1, 1, 1, 1, 1,
-1.072391, 0.4411368, -0.8968629, 1, 1, 1, 1, 1,
-1.071826, 0.8463386, -1.068564, 1, 1, 1, 1, 1,
-1.071322, -0.9893424, -0.7346491, 1, 1, 1, 1, 1,
-1.069624, 1.114624, 0.6233142, 1, 1, 1, 1, 1,
-1.068715, 1.044212, 0.09913645, 1, 1, 1, 1, 1,
-1.066554, 0.0005289094, -1.37898, 1, 1, 1, 1, 1,
-1.064819, 1.535357, -1.249445, 1, 1, 1, 1, 1,
-1.063443, -1.611996, -1.763541, 1, 1, 1, 1, 1,
-1.057127, -0.0396088, -0.6461791, 0, 0, 1, 1, 1,
-1.054302, -0.5890407, -0.7374265, 1, 0, 0, 1, 1,
-1.042025, -0.2651482, -1.748959, 1, 0, 0, 1, 1,
-1.034512, 1.258432, -0.2408946, 1, 0, 0, 1, 1,
-1.028515, 1.514244, -1.60683, 1, 0, 0, 1, 1,
-1.028081, -0.9595991, -2.463248, 1, 0, 0, 1, 1,
-1.026436, -0.9335089, -2.223392, 0, 0, 0, 1, 1,
-1.025643, -0.4709552, -1.323555, 0, 0, 0, 1, 1,
-1.018826, 0.8521273, 0.4298777, 0, 0, 0, 1, 1,
-1.014091, 0.2806786, -1.091974, 0, 0, 0, 1, 1,
-1.01363, 1.959546, 0.3455447, 0, 0, 0, 1, 1,
-1.007451, 1.803972, 2.240195, 0, 0, 0, 1, 1,
-1.000974, 1.024809, -0.9669396, 0, 0, 0, 1, 1,
-0.9997026, 1.306865, 1.285981, 1, 1, 1, 1, 1,
-0.9979324, 0.09351568, 0.6470926, 1, 1, 1, 1, 1,
-0.9938371, -0.06898141, -1.409319, 1, 1, 1, 1, 1,
-0.9913188, -0.1899395, -1.971287, 1, 1, 1, 1, 1,
-0.9911063, -0.1631423, -2.494897, 1, 1, 1, 1, 1,
-0.9909165, -0.6050655, -1.841844, 1, 1, 1, 1, 1,
-0.9876637, -0.3114884, -1.249592, 1, 1, 1, 1, 1,
-0.9864317, -0.2955314, 0.142084, 1, 1, 1, 1, 1,
-0.9829987, 0.01790877, -0.08746819, 1, 1, 1, 1, 1,
-0.9824239, 0.5328379, -1.241685, 1, 1, 1, 1, 1,
-0.9794419, -2.453357, 0.5509687, 1, 1, 1, 1, 1,
-0.9677752, -0.1685977, -2.812466, 1, 1, 1, 1, 1,
-0.9587222, 0.4226831, -1.536441, 1, 1, 1, 1, 1,
-0.9554541, -0.5222172, -0.418489, 1, 1, 1, 1, 1,
-0.9547228, 0.01506218, -2.568059, 1, 1, 1, 1, 1,
-0.9538591, -1.588757, -2.417716, 0, 0, 1, 1, 1,
-0.9482187, -0.7987055, -0.46534, 1, 0, 0, 1, 1,
-0.9463179, -0.2950393, -1.606594, 1, 0, 0, 1, 1,
-0.9401507, -0.5577547, 0.004586479, 1, 0, 0, 1, 1,
-0.9358923, -0.5614719, -1.444295, 1, 0, 0, 1, 1,
-0.925538, -0.2273915, -0.3949718, 1, 0, 0, 1, 1,
-0.9247886, -2.053175, -1.700175, 0, 0, 0, 1, 1,
-0.9206389, -0.9238496, -3.137643, 0, 0, 0, 1, 1,
-0.9202337, 1.962581, 1.370813, 0, 0, 0, 1, 1,
-0.9200671, -0.114758, -1.316481, 0, 0, 0, 1, 1,
-0.9151856, 0.4734405, -2.141678, 0, 0, 0, 1, 1,
-0.9148183, 0.2058012, -1.923066, 0, 0, 0, 1, 1,
-0.9127119, -1.920744, -4.359699, 0, 0, 0, 1, 1,
-0.9125071, 1.438547, 0.06102914, 1, 1, 1, 1, 1,
-0.9122249, 1.156467, 0.5319551, 1, 1, 1, 1, 1,
-0.9066844, 0.1635786, -2.22184, 1, 1, 1, 1, 1,
-0.9049789, -1.002153, -1.541346, 1, 1, 1, 1, 1,
-0.9038716, 1.168182, -1.32872, 1, 1, 1, 1, 1,
-0.9027999, 1.30739, 0.03759257, 1, 1, 1, 1, 1,
-0.9019563, -0.6245217, -1.930519, 1, 1, 1, 1, 1,
-0.9012889, -0.7618983, -1.752252, 1, 1, 1, 1, 1,
-0.8989965, 0.7799017, -0.3271681, 1, 1, 1, 1, 1,
-0.8865162, -0.575117, -0.668027, 1, 1, 1, 1, 1,
-0.874308, -1.036381, -1.668529, 1, 1, 1, 1, 1,
-0.8740551, 0.5439674, -0.4750516, 1, 1, 1, 1, 1,
-0.8656574, 0.4481334, -2.390262, 1, 1, 1, 1, 1,
-0.8619936, -0.4570279, -3.379582, 1, 1, 1, 1, 1,
-0.8616808, -1.160001, -4.027118, 1, 1, 1, 1, 1,
-0.8564269, 0.782016, -0.2098662, 0, 0, 1, 1, 1,
-0.8442362, 1.564381, -0.3736032, 1, 0, 0, 1, 1,
-0.843385, 0.6783571, -0.9167562, 1, 0, 0, 1, 1,
-0.8379967, 0.43075, -1.186547, 1, 0, 0, 1, 1,
-0.8370038, 0.2202913, -1.197091, 1, 0, 0, 1, 1,
-0.8355711, -0.2210673, -1.954501, 1, 0, 0, 1, 1,
-0.8354883, -0.04639857, -0.8380554, 0, 0, 0, 1, 1,
-0.8342966, -0.4895976, -3.219407, 0, 0, 0, 1, 1,
-0.8171809, -0.5796803, -2.044278, 0, 0, 0, 1, 1,
-0.8170575, 0.1531612, -0.746385, 0, 0, 0, 1, 1,
-0.8138972, -0.396942, -1.455979, 0, 0, 0, 1, 1,
-0.8110836, 0.9773645, -0.5027814, 0, 0, 0, 1, 1,
-0.8095355, 0.08565906, -0.4705538, 0, 0, 0, 1, 1,
-0.8037735, -1.71172, -1.524399, 1, 1, 1, 1, 1,
-0.7971448, 0.1806025, -2.859073, 1, 1, 1, 1, 1,
-0.7936987, 0.5030934, 0.005940812, 1, 1, 1, 1, 1,
-0.7929797, -0.2993, -1.044645, 1, 1, 1, 1, 1,
-0.789045, 0.4511036, -1.166573, 1, 1, 1, 1, 1,
-0.7825014, 0.1400583, -1.011466, 1, 1, 1, 1, 1,
-0.7807094, 0.2214961, -1.432602, 1, 1, 1, 1, 1,
-0.7754572, 0.6291743, 0.5352558, 1, 1, 1, 1, 1,
-0.7730797, -0.4900665, -2.552012, 1, 1, 1, 1, 1,
-0.7727327, -1.184037, -3.204528, 1, 1, 1, 1, 1,
-0.765007, 0.07647166, 0.2926458, 1, 1, 1, 1, 1,
-0.7618043, 0.1181629, -1.070994, 1, 1, 1, 1, 1,
-0.7602516, 0.3650152, -1.713941, 1, 1, 1, 1, 1,
-0.7594873, -0.6916687, -1.272032, 1, 1, 1, 1, 1,
-0.7592387, -0.4681216, -2.446014, 1, 1, 1, 1, 1,
-0.7559135, 2.378944, -2.54258, 0, 0, 1, 1, 1,
-0.7558799, -1.870198, -3.035011, 1, 0, 0, 1, 1,
-0.7475531, 0.1940634, -2.025813, 1, 0, 0, 1, 1,
-0.7464281, -1.90707, -2.824686, 1, 0, 0, 1, 1,
-0.7456778, -0.9763361, -1.71287, 1, 0, 0, 1, 1,
-0.7428978, -0.8248749, -1.025239, 1, 0, 0, 1, 1,
-0.7417713, -1.359773, -2.615799, 0, 0, 0, 1, 1,
-0.7407205, 0.4330954, -1.003096, 0, 0, 0, 1, 1,
-0.740575, -0.409192, -1.42206, 0, 0, 0, 1, 1,
-0.7371976, 0.2205805, 0.2666537, 0, 0, 0, 1, 1,
-0.7275301, 1.138981, -0.3085116, 0, 0, 0, 1, 1,
-0.7263033, -0.1958378, -4.097277, 0, 0, 0, 1, 1,
-0.7209081, -0.9124709, -2.344665, 0, 0, 0, 1, 1,
-0.7200382, -0.2150431, -1.857773, 1, 1, 1, 1, 1,
-0.7171525, -0.6895019, -3.000953, 1, 1, 1, 1, 1,
-0.7170236, -1.785659, -3.727486, 1, 1, 1, 1, 1,
-0.7136159, 0.2834409, -1.329358, 1, 1, 1, 1, 1,
-0.7082132, 1.347096, -1.724468, 1, 1, 1, 1, 1,
-0.7074085, -0.9326462, -3.074702, 1, 1, 1, 1, 1,
-0.7040632, 0.3991218, -1.024157, 1, 1, 1, 1, 1,
-0.7028955, -1.330972, -2.424499, 1, 1, 1, 1, 1,
-0.7024758, 0.2868928, -1.118255, 1, 1, 1, 1, 1,
-0.6987649, -0.05334263, -2.43564, 1, 1, 1, 1, 1,
-0.6986864, -1.009064, -2.028877, 1, 1, 1, 1, 1,
-0.6963072, 1.135969, -0.08879578, 1, 1, 1, 1, 1,
-0.695994, 0.9735928, -0.271262, 1, 1, 1, 1, 1,
-0.6941896, 0.0894211, -1.649597, 1, 1, 1, 1, 1,
-0.6935854, -1.173931, -4.020217, 1, 1, 1, 1, 1,
-0.6902442, -1.654976, -3.06644, 0, 0, 1, 1, 1,
-0.6850544, -2.134421, -1.868667, 1, 0, 0, 1, 1,
-0.6806741, -0.4336904, -3.877044, 1, 0, 0, 1, 1,
-0.6777227, 0.8155133, -0.08036741, 1, 0, 0, 1, 1,
-0.6747966, -1.13591, -3.641862, 1, 0, 0, 1, 1,
-0.67158, 0.1753822, -0.5189446, 1, 0, 0, 1, 1,
-0.6703264, 0.943042, -0.77538, 0, 0, 0, 1, 1,
-0.6686811, 2.810805, 0.9435, 0, 0, 0, 1, 1,
-0.6645944, -1.492585, -3.053598, 0, 0, 0, 1, 1,
-0.6613141, -0.3549223, -2.374928, 0, 0, 0, 1, 1,
-0.6605659, 0.05538084, -0.6389832, 0, 0, 0, 1, 1,
-0.6587323, 0.6024148, -0.3313975, 0, 0, 0, 1, 1,
-0.6579082, -1.28938, -1.734828, 0, 0, 0, 1, 1,
-0.6578132, -0.9133496, -4.697637, 1, 1, 1, 1, 1,
-0.6549067, -0.2695004, -1.128379, 1, 1, 1, 1, 1,
-0.6488893, 1.698567, -0.7044115, 1, 1, 1, 1, 1,
-0.6409891, 0.08745729, -1.840572, 1, 1, 1, 1, 1,
-0.6409888, 1.97953, -1.386295, 1, 1, 1, 1, 1,
-0.6408402, 1.727333, -0.7020161, 1, 1, 1, 1, 1,
-0.6400684, -0.2547339, -2.88173, 1, 1, 1, 1, 1,
-0.6381193, -0.8478668, -3.692041, 1, 1, 1, 1, 1,
-0.6353246, -1.858506, -2.496136, 1, 1, 1, 1, 1,
-0.6280015, 0.05865859, 0.02243242, 1, 1, 1, 1, 1,
-0.6249112, 1.923496, -0.9634632, 1, 1, 1, 1, 1,
-0.6236006, 0.532577, -1.601914, 1, 1, 1, 1, 1,
-0.623156, -0.7799163, -2.679078, 1, 1, 1, 1, 1,
-0.6200798, 0.1761443, -1.618471, 1, 1, 1, 1, 1,
-0.6183486, -1.868614, -2.333915, 1, 1, 1, 1, 1,
-0.6150715, -0.2988688, -4.244114, 0, 0, 1, 1, 1,
-0.6129425, 0.2593333, -2.693841, 1, 0, 0, 1, 1,
-0.6091074, -0.1863508, -2.44097, 1, 0, 0, 1, 1,
-0.6069989, 0.5363846, 0.08336033, 1, 0, 0, 1, 1,
-0.6068723, -2.013279, -1.830218, 1, 0, 0, 1, 1,
-0.6055943, -1.22311, -2.802272, 1, 0, 0, 1, 1,
-0.6023061, 0.3052845, -2.004093, 0, 0, 0, 1, 1,
-0.6009222, -1.207727, -2.581909, 0, 0, 0, 1, 1,
-0.5945729, 0.9966568, -1.063757, 0, 0, 0, 1, 1,
-0.5939636, 0.6052259, -0.5646111, 0, 0, 0, 1, 1,
-0.5820187, -0.5568613, -1.544132, 0, 0, 0, 1, 1,
-0.5702778, 0.07474483, -2.082203, 0, 0, 0, 1, 1,
-0.5638971, 1.489072, -2.719224, 0, 0, 0, 1, 1,
-0.5602928, -1.713308, -3.837453, 1, 1, 1, 1, 1,
-0.5600744, 1.707833, -0.640986, 1, 1, 1, 1, 1,
-0.5542797, 1.775016, -0.03464766, 1, 1, 1, 1, 1,
-0.5509238, 0.2100147, -2.446434, 1, 1, 1, 1, 1,
-0.5476133, 0.2867833, -0.9279592, 1, 1, 1, 1, 1,
-0.5467106, 0.3017759, -1.828582, 1, 1, 1, 1, 1,
-0.5459151, 1.223298, -2.874874, 1, 1, 1, 1, 1,
-0.5457166, -0.03775127, -2.432293, 1, 1, 1, 1, 1,
-0.5448215, -0.6197042, -1.048592, 1, 1, 1, 1, 1,
-0.5440185, 0.001298765, 0.1147469, 1, 1, 1, 1, 1,
-0.5418023, -1.330892, -0.6561987, 1, 1, 1, 1, 1,
-0.5335071, -1.295541, -2.748612, 1, 1, 1, 1, 1,
-0.5286483, 0.5675487, -0.8278206, 1, 1, 1, 1, 1,
-0.526773, 0.6138489, -2.099024, 1, 1, 1, 1, 1,
-0.5207066, 1.865833, -1.984103, 1, 1, 1, 1, 1,
-0.519165, -2.783482, -1.163516, 0, 0, 1, 1, 1,
-0.5173191, -0.9256686, -1.963925, 1, 0, 0, 1, 1,
-0.5123654, -0.2042033, -1.60339, 1, 0, 0, 1, 1,
-0.5117359, 1.17461, -0.1792303, 1, 0, 0, 1, 1,
-0.5085157, 0.385512, -0.6537185, 1, 0, 0, 1, 1,
-0.5058416, -1.056051, -4.076224, 1, 0, 0, 1, 1,
-0.5055761, 1.149062, 0.1728806, 0, 0, 0, 1, 1,
-0.5010142, -0.9226987, -2.552317, 0, 0, 0, 1, 1,
-0.49337, 0.515044, -0.9226595, 0, 0, 0, 1, 1,
-0.4932412, -0.1383274, -0.5771969, 0, 0, 0, 1, 1,
-0.4928807, -0.7836384, -1.478205, 0, 0, 0, 1, 1,
-0.4903375, 0.7529145, -1.857683, 0, 0, 0, 1, 1,
-0.4864043, -0.8661035, -3.724697, 0, 0, 0, 1, 1,
-0.4772114, -0.3265715, -2.16414, 1, 1, 1, 1, 1,
-0.4753263, -0.2398724, -3.117904, 1, 1, 1, 1, 1,
-0.4735592, -0.1910276, -1.540493, 1, 1, 1, 1, 1,
-0.4719188, 0.5534068, -1.506983, 1, 1, 1, 1, 1,
-0.4700698, -1.371776, -3.201852, 1, 1, 1, 1, 1,
-0.4646214, 0.6716168, -1.06696, 1, 1, 1, 1, 1,
-0.4646109, -0.3779236, -2.241897, 1, 1, 1, 1, 1,
-0.4645768, -1.318891, -3.881465, 1, 1, 1, 1, 1,
-0.454505, -0.5904649, -1.965512, 1, 1, 1, 1, 1,
-0.4503853, 0.5212418, -0.2080555, 1, 1, 1, 1, 1,
-0.4492057, -0.5052114, -1.928295, 1, 1, 1, 1, 1,
-0.4451629, -0.7333536, -2.711192, 1, 1, 1, 1, 1,
-0.4408373, -1.69222, -1.880855, 1, 1, 1, 1, 1,
-0.4380379, -2.257078, -2.978835, 1, 1, 1, 1, 1,
-0.4325239, -0.3431767, -2.192459, 1, 1, 1, 1, 1,
-0.4318528, -0.3235589, -1.068539, 0, 0, 1, 1, 1,
-0.4279756, 0.6769502, 0.08970588, 1, 0, 0, 1, 1,
-0.4228002, -0.2789962, -4.050027, 1, 0, 0, 1, 1,
-0.4204873, -1.698362, -4.218562, 1, 0, 0, 1, 1,
-0.4194492, -2.695554, -0.6204113, 1, 0, 0, 1, 1,
-0.417204, 0.03582107, -1.364712, 1, 0, 0, 1, 1,
-0.4171346, -0.4246508, -2.445507, 0, 0, 0, 1, 1,
-0.4159688, -0.183602, -0.50001, 0, 0, 0, 1, 1,
-0.4159605, -0.5412013, -1.760473, 0, 0, 0, 1, 1,
-0.4136519, -0.9084209, -2.341402, 0, 0, 0, 1, 1,
-0.412591, -1.031361, -2.645659, 0, 0, 0, 1, 1,
-0.4100348, 1.484777, -1.3739, 0, 0, 0, 1, 1,
-0.4059661, -1.081355, -3.547449, 0, 0, 0, 1, 1,
-0.3988231, -0.2506009, -3.219791, 1, 1, 1, 1, 1,
-0.3941195, 0.1184301, 0.2590113, 1, 1, 1, 1, 1,
-0.3923702, 0.2432569, -1.051407, 1, 1, 1, 1, 1,
-0.3888835, 1.29756, -0.7028675, 1, 1, 1, 1, 1,
-0.3856073, 0.09537553, -1.893652, 1, 1, 1, 1, 1,
-0.3850828, -0.2655889, -1.738823, 1, 1, 1, 1, 1,
-0.380893, 0.3793159, -2.661808, 1, 1, 1, 1, 1,
-0.3734479, 1.09691, -1.648516, 1, 1, 1, 1, 1,
-0.3606895, -0.948681, -4.345578, 1, 1, 1, 1, 1,
-0.356729, -1.297009, -3.249764, 1, 1, 1, 1, 1,
-0.3556864, 1.241631, -0.01290366, 1, 1, 1, 1, 1,
-0.3548876, 0.7902772, -0.453262, 1, 1, 1, 1, 1,
-0.3547079, -2.450864, -3.008706, 1, 1, 1, 1, 1,
-0.3545125, -1.529786, -3.883185, 1, 1, 1, 1, 1,
-0.3531733, -0.6624432, -0.6880827, 1, 1, 1, 1, 1,
-0.3418202, 1.79558, -0.8427548, 0, 0, 1, 1, 1,
-0.3313361, 2.126015, 0.2521535, 1, 0, 0, 1, 1,
-0.3280224, -0.3038359, -1.144378, 1, 0, 0, 1, 1,
-0.3170078, 0.01392626, -1.545745, 1, 0, 0, 1, 1,
-0.3035926, -1.091474, -3.538306, 1, 0, 0, 1, 1,
-0.3023403, -0.4747046, -1.408651, 1, 0, 0, 1, 1,
-0.3013343, 0.2312396, -2.060578, 0, 0, 0, 1, 1,
-0.3000573, 0.4777495, 0.02252236, 0, 0, 0, 1, 1,
-0.2979744, -0.619724, -2.28376, 0, 0, 0, 1, 1,
-0.296625, -0.01262708, -3.730614, 0, 0, 0, 1, 1,
-0.2928064, -1.256406, -3.451037, 0, 0, 0, 1, 1,
-0.2927103, -1.650351, -2.416659, 0, 0, 0, 1, 1,
-0.2921553, 0.4588881, -1.19965, 0, 0, 0, 1, 1,
-0.2903017, -1.862455, -4.146667, 1, 1, 1, 1, 1,
-0.2842706, -0.4812271, -3.108418, 1, 1, 1, 1, 1,
-0.2833611, -0.6881824, -4.471681, 1, 1, 1, 1, 1,
-0.2817187, -0.2793967, -4.117136, 1, 1, 1, 1, 1,
-0.2787447, 1.710329, -0.715128, 1, 1, 1, 1, 1,
-0.2763245, 1.032513, 0.766076, 1, 1, 1, 1, 1,
-0.2751616, -0.713107, -2.358561, 1, 1, 1, 1, 1,
-0.2722026, -0.4930709, -4.354467, 1, 1, 1, 1, 1,
-0.2712618, 0.2532065, 0.3820212, 1, 1, 1, 1, 1,
-0.2710618, 0.1530703, -1.201604, 1, 1, 1, 1, 1,
-0.2700998, 0.6439554, 1.238688, 1, 1, 1, 1, 1,
-0.2649468, -0.3841784, -2.404016, 1, 1, 1, 1, 1,
-0.2638504, -0.7390275, -3.061522, 1, 1, 1, 1, 1,
-0.2627744, 0.08773658, -1.954353, 1, 1, 1, 1, 1,
-0.2594906, -0.7066789, -2.139462, 1, 1, 1, 1, 1,
-0.258871, 0.3003701, -0.140836, 0, 0, 1, 1, 1,
-0.2585641, -0.8845505, -3.654038, 1, 0, 0, 1, 1,
-0.2574962, 0.7253962, 1.33853, 1, 0, 0, 1, 1,
-0.2526299, 0.3768449, -0.9626863, 1, 0, 0, 1, 1,
-0.2501612, 0.1164407, -0.1343948, 1, 0, 0, 1, 1,
-0.2465598, 0.6011504, -2.101882, 1, 0, 0, 1, 1,
-0.2460658, 0.3062128, -1.558167, 0, 0, 0, 1, 1,
-0.2444945, -0.6732433, -3.870179, 0, 0, 0, 1, 1,
-0.2371505, -0.09382625, -1.691555, 0, 0, 0, 1, 1,
-0.229191, 0.4002671, -0.3536299, 0, 0, 0, 1, 1,
-0.2280693, 0.9486976, -0.6195306, 0, 0, 0, 1, 1,
-0.2221399, 1.117445, -1.682767, 0, 0, 0, 1, 1,
-0.2170626, 0.4769001, -1.653923, 0, 0, 0, 1, 1,
-0.2152159, 1.897872, -0.2493175, 1, 1, 1, 1, 1,
-0.2115356, 0.2201901, 0.1556915, 1, 1, 1, 1, 1,
-0.2041097, 0.2979889, -0.9795661, 1, 1, 1, 1, 1,
-0.2040014, 0.9454286, -1.334441, 1, 1, 1, 1, 1,
-0.2025728, 0.359311, -2.36201, 1, 1, 1, 1, 1,
-0.2015042, 0.6543823, 0.03883248, 1, 1, 1, 1, 1,
-0.2002275, -1.748497, -2.714442, 1, 1, 1, 1, 1,
-0.1997911, -0.1845174, -1.583257, 1, 1, 1, 1, 1,
-0.1990167, -0.08083346, 1.093477, 1, 1, 1, 1, 1,
-0.1972078, -0.7264602, -2.114389, 1, 1, 1, 1, 1,
-0.1969018, 0.06687567, -1.733381, 1, 1, 1, 1, 1,
-0.1941314, -1.208625, -2.350899, 1, 1, 1, 1, 1,
-0.1905976, -0.6366937, -2.372806, 1, 1, 1, 1, 1,
-0.1869685, -1.78137, -2.715085, 1, 1, 1, 1, 1,
-0.1865262, 0.08424826, 0.4223787, 1, 1, 1, 1, 1,
-0.1844177, -0.8674673, -1.818542, 0, 0, 1, 1, 1,
-0.1837264, 0.3177021, -0.5453274, 1, 0, 0, 1, 1,
-0.1834717, 0.6622366, -0.7752015, 1, 0, 0, 1, 1,
-0.1827582, -0.5052775, -3.239032, 1, 0, 0, 1, 1,
-0.1785747, -1.154822, -2.658098, 1, 0, 0, 1, 1,
-0.1757056, -0.2148587, -1.766236, 1, 0, 0, 1, 1,
-0.172996, 0.06374143, -0.8605722, 0, 0, 0, 1, 1,
-0.1700175, 0.402809, 0.7204902, 0, 0, 0, 1, 1,
-0.1698494, 1.017933, -0.5861769, 0, 0, 0, 1, 1,
-0.1654482, 0.2270319, -0.9139851, 0, 0, 0, 1, 1,
-0.1608594, -1.060577, -4.308487, 0, 0, 0, 1, 1,
-0.1603479, 0.3820157, 0.9686553, 0, 0, 0, 1, 1,
-0.1597526, 0.1753621, -1.432647, 0, 0, 0, 1, 1,
-0.1563465, -0.8901525, -2.745711, 1, 1, 1, 1, 1,
-0.1526842, -0.5218102, -3.851427, 1, 1, 1, 1, 1,
-0.14676, -0.5363432, -1.64384, 1, 1, 1, 1, 1,
-0.1383479, -1.833693, -1.144789, 1, 1, 1, 1, 1,
-0.1330759, -0.9821984, -1.433589, 1, 1, 1, 1, 1,
-0.1313386, 0.8477458, 0.8427265, 1, 1, 1, 1, 1,
-0.1268702, 2.847295, -0.9533758, 1, 1, 1, 1, 1,
-0.1258899, 0.005058746, -2.153205, 1, 1, 1, 1, 1,
-0.1252259, 0.04207468, -2.827551, 1, 1, 1, 1, 1,
-0.1191631, -0.505227, -1.289184, 1, 1, 1, 1, 1,
-0.1187973, 1.570929, 0.4816645, 1, 1, 1, 1, 1,
-0.1180637, -2.138082, -2.206466, 1, 1, 1, 1, 1,
-0.1164897, 0.5912733, -3.661395, 1, 1, 1, 1, 1,
-0.1154911, 0.2781492, -0.9165165, 1, 1, 1, 1, 1,
-0.1132149, -0.3651913, -4.57882, 1, 1, 1, 1, 1,
-0.112737, 0.391775, 0.6154796, 0, 0, 1, 1, 1,
-0.1117367, 1.913809, -1.325751, 1, 0, 0, 1, 1,
-0.1091262, 1.552269, -1.208695, 1, 0, 0, 1, 1,
-0.1086371, 0.4002082, -1.544574, 1, 0, 0, 1, 1,
-0.1080014, 0.1078928, -1.100715, 1, 0, 0, 1, 1,
-0.1047517, 0.1042839, -0.7940593, 1, 0, 0, 1, 1,
-0.1032341, -0.782243, -0.9766875, 0, 0, 0, 1, 1,
-0.1009074, -0.4209361, -2.122364, 0, 0, 0, 1, 1,
-0.1003035, -1.208403, -2.403564, 0, 0, 0, 1, 1,
-0.08892584, -0.185958, -4.464842, 0, 0, 0, 1, 1,
-0.08223227, 1.074091, 1.046709, 0, 0, 0, 1, 1,
-0.08172433, 0.77183, 1.037939, 0, 0, 0, 1, 1,
-0.07909796, -0.3529567, -2.211953, 0, 0, 0, 1, 1,
-0.07840139, 0.02970279, -1.302609, 1, 1, 1, 1, 1,
-0.07676723, -0.1382032, -4.822201, 1, 1, 1, 1, 1,
-0.07650314, 1.212497, -1.172434, 1, 1, 1, 1, 1,
-0.07465839, 0.9137743, 0.9411798, 1, 1, 1, 1, 1,
-0.07140918, 0.793218, 0.3478122, 1, 1, 1, 1, 1,
-0.07074108, 0.2597671, -1.173593, 1, 1, 1, 1, 1,
-0.07073431, -0.1268052, -3.091491, 1, 1, 1, 1, 1,
-0.05479513, 0.7128537, 1.032175, 1, 1, 1, 1, 1,
-0.05430346, -0.3033162, -3.761594, 1, 1, 1, 1, 1,
-0.05159287, -0.1179114, 0.02738902, 1, 1, 1, 1, 1,
-0.04946749, -1.012535, -3.216563, 1, 1, 1, 1, 1,
-0.04788616, -0.2596937, -0.6510958, 1, 1, 1, 1, 1,
-0.04556419, 1.037481, 2.431155, 1, 1, 1, 1, 1,
-0.0447797, 0.6237397, 0.07726963, 1, 1, 1, 1, 1,
-0.04306705, 0.5263643, -0.9905479, 1, 1, 1, 1, 1,
-0.0428813, 1.296308, -0.378404, 0, 0, 1, 1, 1,
-0.04105604, -0.1222157, -3.730379, 1, 0, 0, 1, 1,
-0.03984712, -0.1392606, -1.634118, 1, 0, 0, 1, 1,
-0.03807524, -0.7284099, -3.504773, 1, 0, 0, 1, 1,
-0.03233637, -0.169538, -3.262786, 1, 0, 0, 1, 1,
-0.02757148, 1.029936, -0.1357715, 1, 0, 0, 1, 1,
-0.02689604, 0.2930939, 0.7900288, 0, 0, 0, 1, 1,
-0.02090693, 0.1915889, -0.7476372, 0, 0, 0, 1, 1,
-0.01865703, -0.246497, -2.558307, 0, 0, 0, 1, 1,
-0.018338, 0.6077676, -0.1188352, 0, 0, 0, 1, 1,
-0.01793304, -0.3551947, -2.181447, 0, 0, 0, 1, 1,
-0.01532127, -1.431184, -3.371803, 0, 0, 0, 1, 1,
-0.01040256, -0.1836525, -4.220743, 0, 0, 0, 1, 1,
-0.005535892, -0.337243, -3.551135, 1, 1, 1, 1, 1,
-0.005253362, 1.115504, -0.1304953, 1, 1, 1, 1, 1,
-0.004151944, 1.480605, -0.2324201, 1, 1, 1, 1, 1,
-0.003692377, -0.3396443, -3.119036, 1, 1, 1, 1, 1,
-0.002911978, -0.6590853, -5.090203, 1, 1, 1, 1, 1,
0.002983289, -0.08895697, 5.037031, 1, 1, 1, 1, 1,
0.004154417, 2.322134, 0.2668651, 1, 1, 1, 1, 1,
0.01156775, -0.07074802, 2.721326, 1, 1, 1, 1, 1,
0.01696586, -0.1694683, 4.053142, 1, 1, 1, 1, 1,
0.01963086, -2.284727, 2.198945, 1, 1, 1, 1, 1,
0.02064716, 0.1982105, 0.03144829, 1, 1, 1, 1, 1,
0.02300411, 0.4021085, 1.306069, 1, 1, 1, 1, 1,
0.02348505, -0.7837638, 0.8825226, 1, 1, 1, 1, 1,
0.02552026, -0.2198578, 1.745837, 1, 1, 1, 1, 1,
0.03495362, -0.3741996, 1.753622, 1, 1, 1, 1, 1,
0.03703131, -0.263783, 1.178099, 0, 0, 1, 1, 1,
0.0432125, -1.010613, 3.591172, 1, 0, 0, 1, 1,
0.04533261, 1.120455, 0.7653428, 1, 0, 0, 1, 1,
0.04704258, -0.4795024, 4.214268, 1, 0, 0, 1, 1,
0.04748555, -0.6189038, 1.166564, 1, 0, 0, 1, 1,
0.05053657, 0.3920222, 1.474556, 1, 0, 0, 1, 1,
0.05428489, -0.5849816, 1.456332, 0, 0, 0, 1, 1,
0.05692255, -0.9784937, 2.268824, 0, 0, 0, 1, 1,
0.05809693, -1.129941, 4.660662, 0, 0, 0, 1, 1,
0.06037625, 1.168761, 0.3253701, 0, 0, 0, 1, 1,
0.06185152, 1.400883, 0.5691494, 0, 0, 0, 1, 1,
0.06625825, -1.387227, 3.872297, 0, 0, 0, 1, 1,
0.0662879, 1.91048, 1.140971, 0, 0, 0, 1, 1,
0.06722934, 0.475466, 0.1834408, 1, 1, 1, 1, 1,
0.07231546, -0.3858228, 3.716785, 1, 1, 1, 1, 1,
0.07266161, 0.3024517, 1.274775, 1, 1, 1, 1, 1,
0.07266396, 0.1698981, 0.6057262, 1, 1, 1, 1, 1,
0.07309601, -0.4795824, 1.856185, 1, 1, 1, 1, 1,
0.07377435, 1.203566, 1.771224, 1, 1, 1, 1, 1,
0.08000985, -1.950665, 2.95597, 1, 1, 1, 1, 1,
0.08419467, 2.347382, 0.8370667, 1, 1, 1, 1, 1,
0.08458047, -0.8980679, 3.645554, 1, 1, 1, 1, 1,
0.08477928, -1.346428, 2.68067, 1, 1, 1, 1, 1,
0.0895007, -0.3090389, 2.214725, 1, 1, 1, 1, 1,
0.09714059, 0.8229806, -0.5470632, 1, 1, 1, 1, 1,
0.1046328, 1.36429, -0.3599233, 1, 1, 1, 1, 1,
0.1056782, 0.7169237, 1.682504, 1, 1, 1, 1, 1,
0.1072665, 0.3897539, 0.7466084, 1, 1, 1, 1, 1,
0.1125197, -0.4110267, 2.649874, 0, 0, 1, 1, 1,
0.1145345, -1.599972, 3.407072, 1, 0, 0, 1, 1,
0.1146718, 0.5370248, 0.3908632, 1, 0, 0, 1, 1,
0.1262223, 1.249466, -1.13203, 1, 0, 0, 1, 1,
0.1268969, 0.8466541, 0.8790975, 1, 0, 0, 1, 1,
0.1290634, 0.2736878, -1.427256, 1, 0, 0, 1, 1,
0.1317549, -0.398033, 2.274003, 0, 0, 0, 1, 1,
0.1362683, -1.517058, 3.71915, 0, 0, 0, 1, 1,
0.1366475, -1.165498, 0.9343305, 0, 0, 0, 1, 1,
0.1378306, -0.3560176, 4.325974, 0, 0, 0, 1, 1,
0.1379169, 0.7742994, 0.5782834, 0, 0, 0, 1, 1,
0.1394637, 0.1959622, 0.4218075, 0, 0, 0, 1, 1,
0.1403484, -1.229649, 2.325369, 0, 0, 0, 1, 1,
0.1416969, 1.083982, 0.0285912, 1, 1, 1, 1, 1,
0.1436637, -1.018249, 1.845972, 1, 1, 1, 1, 1,
0.1445049, -1.862412, 4.21551, 1, 1, 1, 1, 1,
0.1471763, 0.6306592, -0.1115023, 1, 1, 1, 1, 1,
0.1568136, -0.8335232, 1.91546, 1, 1, 1, 1, 1,
0.157455, 1.365413, -0.4599538, 1, 1, 1, 1, 1,
0.1618292, -0.4347817, 2.325988, 1, 1, 1, 1, 1,
0.1682481, -0.3069526, 2.574935, 1, 1, 1, 1, 1,
0.1709327, -0.1774291, 0.7877063, 1, 1, 1, 1, 1,
0.1714181, 1.112886, -0.8552392, 1, 1, 1, 1, 1,
0.1749043, 0.8262469, 1.393978, 1, 1, 1, 1, 1,
0.1759199, 0.5531461, 2.751278, 1, 1, 1, 1, 1,
0.1765514, 0.6019278, -0.2887447, 1, 1, 1, 1, 1,
0.1778126, 0.6091824, -0.6155899, 1, 1, 1, 1, 1,
0.1788623, 0.424376, 0.004817226, 1, 1, 1, 1, 1,
0.1861301, 0.942147, -0.453368, 0, 0, 1, 1, 1,
0.1871302, -0.5293488, 2.43612, 1, 0, 0, 1, 1,
0.1904791, -0.1540735, 2.054021, 1, 0, 0, 1, 1,
0.1978542, 0.2358635, 0.9227349, 1, 0, 0, 1, 1,
0.2100762, -1.579738, 2.529052, 1, 0, 0, 1, 1,
0.2113381, 1.039319, 1.311321, 1, 0, 0, 1, 1,
0.2126963, 0.04465052, -0.9588598, 0, 0, 0, 1, 1,
0.2130537, -1.339815, 4.83218, 0, 0, 0, 1, 1,
0.2155625, 0.6033412, 0.2171436, 0, 0, 0, 1, 1,
0.2163895, -0.1292911, 2.22313, 0, 0, 0, 1, 1,
0.2285828, 0.641113, -0.7697036, 0, 0, 0, 1, 1,
0.2300667, 1.277096, 0.9466019, 0, 0, 0, 1, 1,
0.233108, -0.6287788, 0.4275389, 0, 0, 0, 1, 1,
0.2336345, 0.4655667, -0.2276272, 1, 1, 1, 1, 1,
0.2338254, 0.4254473, 0.103689, 1, 1, 1, 1, 1,
0.2340644, 0.5216534, -0.8748888, 1, 1, 1, 1, 1,
0.2378122, 0.4935989, 0.7383436, 1, 1, 1, 1, 1,
0.2382469, -1.891544, 3.076564, 1, 1, 1, 1, 1,
0.2408153, 0.6162339, 0.9784395, 1, 1, 1, 1, 1,
0.2447936, -1.503269, 2.430923, 1, 1, 1, 1, 1,
0.2450233, -0.987333, 3.543034, 1, 1, 1, 1, 1,
0.2453748, -0.8513917, 4.411602, 1, 1, 1, 1, 1,
0.2501563, 0.5595752, 1.567804, 1, 1, 1, 1, 1,
0.2507996, -2.572153, 3.384146, 1, 1, 1, 1, 1,
0.2508869, 0.01325385, 0.606465, 1, 1, 1, 1, 1,
0.2515712, -1.485124, 2.804441, 1, 1, 1, 1, 1,
0.2518777, -0.1495305, 1.504935, 1, 1, 1, 1, 1,
0.2530924, -1.162423, 1.690712, 1, 1, 1, 1, 1,
0.2535108, -0.1221411, 1.035311, 0, 0, 1, 1, 1,
0.2540264, 1.680686, 1.350755, 1, 0, 0, 1, 1,
0.2582144, 0.7426474, 0.1805023, 1, 0, 0, 1, 1,
0.2599926, 1.173446, 1.098608, 1, 0, 0, 1, 1,
0.2646991, -0.0693686, 2.019585, 1, 0, 0, 1, 1,
0.2673108, 0.5894286, 0.8585131, 1, 0, 0, 1, 1,
0.2706786, 0.6904671, 0.443058, 0, 0, 0, 1, 1,
0.277639, 0.774546, 0.5823845, 0, 0, 0, 1, 1,
0.2789838, -1.243872, 0.7716427, 0, 0, 0, 1, 1,
0.2816299, 0.5725238, 0.3567148, 0, 0, 0, 1, 1,
0.2922343, 1.700122, -1.060623, 0, 0, 0, 1, 1,
0.3014522, 0.6076633, 1.097237, 0, 0, 0, 1, 1,
0.3045938, -1.082882, -0.2510782, 0, 0, 0, 1, 1,
0.3048319, -0.5051966, 3.10811, 1, 1, 1, 1, 1,
0.3069666, -0.9020553, 4.310964, 1, 1, 1, 1, 1,
0.307313, -0.04541055, 1.702347, 1, 1, 1, 1, 1,
0.3098818, -0.6838343, 4.893777, 1, 1, 1, 1, 1,
0.3106626, -0.966987, 2.899868, 1, 1, 1, 1, 1,
0.312268, 0.5393772, 1.590704, 1, 1, 1, 1, 1,
0.3151074, 2.063064, 1.015524, 1, 1, 1, 1, 1,
0.3162949, -2.146669, 2.324817, 1, 1, 1, 1, 1,
0.3180574, -0.1788162, 2.05835, 1, 1, 1, 1, 1,
0.3261252, -0.6099015, 3.747962, 1, 1, 1, 1, 1,
0.329685, -0.03704822, 1.083974, 1, 1, 1, 1, 1,
0.3306487, -1.314223, 3.369221, 1, 1, 1, 1, 1,
0.3393318, -0.740007, 3.211714, 1, 1, 1, 1, 1,
0.3399892, 0.2311993, 1.314145, 1, 1, 1, 1, 1,
0.3403282, -0.0195483, 1.964327, 1, 1, 1, 1, 1,
0.3413102, -0.1877309, 2.905298, 0, 0, 1, 1, 1,
0.3419712, 0.5242993, 0.04815056, 1, 0, 0, 1, 1,
0.3436717, 1.827197, 0.04426345, 1, 0, 0, 1, 1,
0.3468581, -0.2051392, 1.645301, 1, 0, 0, 1, 1,
0.3475174, -1.314729, 3.138625, 1, 0, 0, 1, 1,
0.3489303, -0.7671365, 4.159271, 1, 0, 0, 1, 1,
0.3553706, 0.1279573, 1.430268, 0, 0, 0, 1, 1,
0.3555807, -0.8563229, 1.760301, 0, 0, 0, 1, 1,
0.3563392, 0.7447922, 0.4330723, 0, 0, 0, 1, 1,
0.3581022, -0.1199639, 0.7146577, 0, 0, 0, 1, 1,
0.3662691, 1.524588, 0.3395626, 0, 0, 0, 1, 1,
0.366903, 0.2691999, 1.635103, 0, 0, 0, 1, 1,
0.3692236, -0.2479567, 1.552281, 0, 0, 0, 1, 1,
0.371252, -1.334478, 3.603055, 1, 1, 1, 1, 1,
0.3739459, -0.2191843, -0.05099768, 1, 1, 1, 1, 1,
0.3743396, -0.4835286, 2.248702, 1, 1, 1, 1, 1,
0.3806133, 1.099474, -1.320953, 1, 1, 1, 1, 1,
0.38345, -0.09943175, 1.831991, 1, 1, 1, 1, 1,
0.3841659, 0.1409465, 1.804996, 1, 1, 1, 1, 1,
0.387771, -2.443509, 4.449197, 1, 1, 1, 1, 1,
0.3921349, -0.1809471, 4.363589, 1, 1, 1, 1, 1,
0.3928702, -0.7557542, 1.113884, 1, 1, 1, 1, 1,
0.3945215, -0.03300671, -0.1445334, 1, 1, 1, 1, 1,
0.3984785, -0.7625026, 0.4823914, 1, 1, 1, 1, 1,
0.4018283, 0.1550436, 0.5804561, 1, 1, 1, 1, 1,
0.4031116, -0.4342222, 0.3738666, 1, 1, 1, 1, 1,
0.4047073, -0.7709846, 4.332848, 1, 1, 1, 1, 1,
0.4080473, -3.04669, 4.690605, 1, 1, 1, 1, 1,
0.4088284, 0.920804, 0.07893577, 0, 0, 1, 1, 1,
0.4112455, 0.991695, 0.9034432, 1, 0, 0, 1, 1,
0.4133001, -0.2321591, 2.948699, 1, 0, 0, 1, 1,
0.4149401, -0.3469828, 1.338557, 1, 0, 0, 1, 1,
0.4170729, 0.1547703, 1.019801, 1, 0, 0, 1, 1,
0.4174187, -1.106516, 2.344323, 1, 0, 0, 1, 1,
0.4181534, 1.993256, 0.1397234, 0, 0, 0, 1, 1,
0.4187074, 0.324933, -0.9742115, 0, 0, 0, 1, 1,
0.4217642, 0.8968689, 0.2345273, 0, 0, 0, 1, 1,
0.4219414, -0.4909762, 4.030499, 0, 0, 0, 1, 1,
0.4250464, 0.1750496, 4.128107, 0, 0, 0, 1, 1,
0.425288, -0.5633297, 3.735656, 0, 0, 0, 1, 1,
0.4286923, 1.149275, 1.109798, 0, 0, 0, 1, 1,
0.4350955, 0.8801712, 0.2383785, 1, 1, 1, 1, 1,
0.4374179, -0.0418975, 1.131334, 1, 1, 1, 1, 1,
0.4386572, -1.745266, 2.600832, 1, 1, 1, 1, 1,
0.4410771, 0.356265, 3.397825, 1, 1, 1, 1, 1,
0.4416619, -0.7414466, 2.053685, 1, 1, 1, 1, 1,
0.4421545, 0.4661779, 1.558728, 1, 1, 1, 1, 1,
0.4433653, -1.31201, 2.754873, 1, 1, 1, 1, 1,
0.4460751, 2.581167, -2.434354, 1, 1, 1, 1, 1,
0.4467145, -1.486436, 4.118627, 1, 1, 1, 1, 1,
0.4488324, -0.7244241, 2.777226, 1, 1, 1, 1, 1,
0.4494276, -0.5098308, 2.425216, 1, 1, 1, 1, 1,
0.450965, 0.683154, -0.1173325, 1, 1, 1, 1, 1,
0.4515113, 0.5705839, 0.9280643, 1, 1, 1, 1, 1,
0.4527927, 0.3558938, -0.2185121, 1, 1, 1, 1, 1,
0.4550301, 0.4868243, 1.376671, 1, 1, 1, 1, 1,
0.4571123, -1.358336, 2.599492, 0, 0, 1, 1, 1,
0.4667364, 0.09666845, 2.919368, 1, 0, 0, 1, 1,
0.4679895, 2.102767, 0.161918, 1, 0, 0, 1, 1,
0.4690391, 0.4798738, -0.01328823, 1, 0, 0, 1, 1,
0.4749773, -0.2140223, 3.830191, 1, 0, 0, 1, 1,
0.476365, 1.393068, 1.051985, 1, 0, 0, 1, 1,
0.4767452, -0.2429857, 1.373323, 0, 0, 0, 1, 1,
0.4775214, -0.6087191, 2.878348, 0, 0, 0, 1, 1,
0.4806264, -0.5964974, 3.497512, 0, 0, 0, 1, 1,
0.4817031, 0.6881683, 0.5454741, 0, 0, 0, 1, 1,
0.4851997, -1.026267, 2.024668, 0, 0, 0, 1, 1,
0.4911352, 0.9070615, -0.2975215, 0, 0, 0, 1, 1,
0.4931422, -1.067282, 4.126026, 0, 0, 0, 1, 1,
0.4945874, 0.1254373, 1.481006, 1, 1, 1, 1, 1,
0.4965827, -0.4123594, 1.057291, 1, 1, 1, 1, 1,
0.5002984, 0.5824465, 0.9599091, 1, 1, 1, 1, 1,
0.5011037, 0.8456299, -0.6596248, 1, 1, 1, 1, 1,
0.5019214, 0.3802063, 1.398387, 1, 1, 1, 1, 1,
0.5057601, 0.7422174, 0.1606445, 1, 1, 1, 1, 1,
0.5062192, 0.2435903, 0.5366473, 1, 1, 1, 1, 1,
0.5073767, -0.7719881, 4.487832, 1, 1, 1, 1, 1,
0.508723, -0.2853725, 0.7224061, 1, 1, 1, 1, 1,
0.5091743, 0.1503564, 1.918334, 1, 1, 1, 1, 1,
0.5097742, 0.8242563, 0.2981646, 1, 1, 1, 1, 1,
0.5145603, 0.8419518, 0.5676603, 1, 1, 1, 1, 1,
0.5145878, 2.606301, -1.327112, 1, 1, 1, 1, 1,
0.5196722, 0.6449985, 1.008621, 1, 1, 1, 1, 1,
0.522966, 0.1695541, 1.331096, 1, 1, 1, 1, 1,
0.5314489, 0.2932508, 1.363911, 0, 0, 1, 1, 1,
0.5336273, -1.522193, 3.437206, 1, 0, 0, 1, 1,
0.5348848, -0.2333492, 3.016978, 1, 0, 0, 1, 1,
0.5433773, 0.5700865, 0.7102723, 1, 0, 0, 1, 1,
0.5524207, -0.8260309, 3.695944, 1, 0, 0, 1, 1,
0.5530027, -0.8565135, 2.624976, 1, 0, 0, 1, 1,
0.5532069, 1.113263, -1.112467, 0, 0, 0, 1, 1,
0.5564255, -0.4423969, 3.910286, 0, 0, 0, 1, 1,
0.5581507, -0.06645202, 0.4486898, 0, 0, 0, 1, 1,
0.5593046, -1.013618, 2.117273, 0, 0, 0, 1, 1,
0.5643957, 0.6803955, -0.144519, 0, 0, 0, 1, 1,
0.567137, -0.1738499, 0.8357462, 0, 0, 0, 1, 1,
0.5729305, -0.8050028, 2.692679, 0, 0, 0, 1, 1,
0.5744812, -0.03836416, 2.02391, 1, 1, 1, 1, 1,
0.5752766, -0.7992027, 0.1233463, 1, 1, 1, 1, 1,
0.576277, -1.401607, 1.505794, 1, 1, 1, 1, 1,
0.576453, -1.668356, 1.390579, 1, 1, 1, 1, 1,
0.580134, -1.104051, 3.311797, 1, 1, 1, 1, 1,
0.5825871, 0.1893417, 2.448846, 1, 1, 1, 1, 1,
0.5902473, 0.1588637, 1.420673, 1, 1, 1, 1, 1,
0.5918604, 1.711968, 1.294618, 1, 1, 1, 1, 1,
0.6030756, -0.5972066, 1.741599, 1, 1, 1, 1, 1,
0.605041, 0.9691036, 0.1420219, 1, 1, 1, 1, 1,
0.6055316, -0.2579225, 1.81256, 1, 1, 1, 1, 1,
0.6059545, 0.06708825, 1.992434, 1, 1, 1, 1, 1,
0.6061438, -0.7531394, 2.780313, 1, 1, 1, 1, 1,
0.6110002, 0.03070527, 0.3351898, 1, 1, 1, 1, 1,
0.6154039, -0.3824989, 2.548277, 1, 1, 1, 1, 1,
0.6167305, 0.0765053, -0.3031287, 0, 0, 1, 1, 1,
0.6186405, 0.3543735, 0.03043167, 1, 0, 0, 1, 1,
0.6232948, -1.482272, 4.026255, 1, 0, 0, 1, 1,
0.6240051, -1.104051, 3.25202, 1, 0, 0, 1, 1,
0.6263157, 1.185289, 1.098544, 1, 0, 0, 1, 1,
0.6271569, -1.378496, 2.558052, 1, 0, 0, 1, 1,
0.6275799, -0.6123334, 2.487342, 0, 0, 0, 1, 1,
0.633954, 0.01184015, 0.7750332, 0, 0, 0, 1, 1,
0.6341826, -2.100398, 3.001779, 0, 0, 0, 1, 1,
0.6346357, -1.612196, 3.279577, 0, 0, 0, 1, 1,
0.6415592, 0.144421, 1.340222, 0, 0, 0, 1, 1,
0.6445046, -0.2129646, 3.343457, 0, 0, 0, 1, 1,
0.6464713, -0.4873676, 1.587391, 0, 0, 0, 1, 1,
0.6670805, -1.813322, 2.585021, 1, 1, 1, 1, 1,
0.670488, -1.420908, 1.701478, 1, 1, 1, 1, 1,
0.6724411, 0.7408563, 1.510262, 1, 1, 1, 1, 1,
0.6738663, 0.5182862, 1.625057, 1, 1, 1, 1, 1,
0.6759809, 0.5181865, 1.207268, 1, 1, 1, 1, 1,
0.6852767, -0.3093703, 0.7189291, 1, 1, 1, 1, 1,
0.6861976, -0.8227124, 3.531581, 1, 1, 1, 1, 1,
0.6867281, -0.04047174, 2.593608, 1, 1, 1, 1, 1,
0.6878691, 1.304469, -0.08334449, 1, 1, 1, 1, 1,
0.6927094, -0.631576, 1.759472, 1, 1, 1, 1, 1,
0.6976249, -0.881121, 2.559454, 1, 1, 1, 1, 1,
0.70628, 0.05342646, -0.6270165, 1, 1, 1, 1, 1,
0.7119296, -1.007034, 2.52338, 1, 1, 1, 1, 1,
0.7128407, 0.3858002, 0.5853834, 1, 1, 1, 1, 1,
0.7143142, 0.8359562, 0.2531747, 1, 1, 1, 1, 1,
0.7188171, 0.1608015, 2.147773, 0, 0, 1, 1, 1,
0.7195874, -0.5231004, 2.066126, 1, 0, 0, 1, 1,
0.7207456, 0.6784041, 0.7070858, 1, 0, 0, 1, 1,
0.7255758, 1.992805, 3.367811, 1, 0, 0, 1, 1,
0.7266226, -1.063292, 3.284881, 1, 0, 0, 1, 1,
0.7322043, -0.9153352, 2.129419, 1, 0, 0, 1, 1,
0.7333483, -0.6300474, 1.508741, 0, 0, 0, 1, 1,
0.7353888, 0.4339039, 2.096634, 0, 0, 0, 1, 1,
0.7404614, 1.800023, -0.7670981, 0, 0, 0, 1, 1,
0.7446159, -0.690433, 3.052917, 0, 0, 0, 1, 1,
0.7459862, 0.1503452, 1.992885, 0, 0, 0, 1, 1,
0.7479538, -1.067222, 4.395002, 0, 0, 0, 1, 1,
0.7480556, -1.461004, 3.336333, 0, 0, 0, 1, 1,
0.7503954, 2.033338, 1.726926, 1, 1, 1, 1, 1,
0.7549925, -0.2380817, 3.464125, 1, 1, 1, 1, 1,
0.7556321, 0.1832367, 1.918254, 1, 1, 1, 1, 1,
0.7565258, -1.128941, 2.170861, 1, 1, 1, 1, 1,
0.7587498, -1.937066, 4.314599, 1, 1, 1, 1, 1,
0.7590008, -0.2809592, 0.9595848, 1, 1, 1, 1, 1,
0.7627865, 1.83253, 0.528565, 1, 1, 1, 1, 1,
0.7635257, 1.291987, 0.4938718, 1, 1, 1, 1, 1,
0.7670408, -0.5762646, 3.844455, 1, 1, 1, 1, 1,
0.7719991, -0.7703377, 2.026421, 1, 1, 1, 1, 1,
0.7956354, 2.660299, -1.060475, 1, 1, 1, 1, 1,
0.7969553, 0.3779391, 0.9770516, 1, 1, 1, 1, 1,
0.7970014, -1.768316, 1.930102, 1, 1, 1, 1, 1,
0.801159, 0.7468122, 0.6273179, 1, 1, 1, 1, 1,
0.8062738, 0.2711027, 0.5654839, 1, 1, 1, 1, 1,
0.812665, -2.083977, 3.360816, 0, 0, 1, 1, 1,
0.8129362, 1.283523, 0.1587066, 1, 0, 0, 1, 1,
0.8175882, 1.16088, 1.583632, 1, 0, 0, 1, 1,
0.8197707, -0.5381563, 3.135297, 1, 0, 0, 1, 1,
0.8227502, 1.288019, 1.018502, 1, 0, 0, 1, 1,
0.8250256, 1.255026, -0.03499196, 1, 0, 0, 1, 1,
0.8284141, -0.3941786, 1.682286, 0, 0, 0, 1, 1,
0.8306063, -0.4422918, 4.038132, 0, 0, 0, 1, 1,
0.8352935, -0.3278161, 0.9593142, 0, 0, 0, 1, 1,
0.8414641, -0.9048582, 1.250936, 0, 0, 0, 1, 1,
0.8485636, 0.7164909, 1.666908, 0, 0, 0, 1, 1,
0.853609, -0.8792611, 2.127337, 0, 0, 0, 1, 1,
0.8542178, 0.7294224, 0.8129115, 0, 0, 0, 1, 1,
0.8557074, 0.7069154, 1.177817, 1, 1, 1, 1, 1,
0.8586435, -0.2288934, 2.247362, 1, 1, 1, 1, 1,
0.859948, -0.2008207, 2.800481, 1, 1, 1, 1, 1,
0.860586, 1.09685, 0.9920766, 1, 1, 1, 1, 1,
0.8608747, -0.9001666, 1.895125, 1, 1, 1, 1, 1,
0.8635424, -0.6941975, 1.789039, 1, 1, 1, 1, 1,
0.86704, 2.174828, 0.6229932, 1, 1, 1, 1, 1,
0.8752413, 0.8737634, 1.181246, 1, 1, 1, 1, 1,
0.8800789, -0.4515468, 2.038315, 1, 1, 1, 1, 1,
0.886683, 0.6878676, 1.406211, 1, 1, 1, 1, 1,
0.8937818, 0.06903908, 1.13136, 1, 1, 1, 1, 1,
0.9018366, -0.578478, 1.137059, 1, 1, 1, 1, 1,
0.9037204, 0.1440551, -0.09533729, 1, 1, 1, 1, 1,
0.9038786, 0.7721601, 0.3442242, 1, 1, 1, 1, 1,
0.9076426, -1.538891, 1.981895, 1, 1, 1, 1, 1,
0.90915, 0.4131421, 1.658348, 0, 0, 1, 1, 1,
0.916074, -1.430831, 1.480026, 1, 0, 0, 1, 1,
0.9244635, 0.1018798, 1.526957, 1, 0, 0, 1, 1,
0.9276763, 0.2566236, 1.44594, 1, 0, 0, 1, 1,
0.9279062, -0.2534512, 1.222489, 1, 0, 0, 1, 1,
0.9349148, -1.158086, 2.11827, 1, 0, 0, 1, 1,
0.9362166, -0.3063626, 1.584628, 0, 0, 0, 1, 1,
0.9420493, -0.6625578, 1.031969, 0, 0, 0, 1, 1,
0.9455049, -0.01490587, 2.325513, 0, 0, 0, 1, 1,
0.9515594, -0.966585, 1.995679, 0, 0, 0, 1, 1,
0.9536301, 0.2419541, 1.226661, 0, 0, 0, 1, 1,
0.9581274, -0.1737631, 2.502345, 0, 0, 0, 1, 1,
0.959037, -0.04116512, 0.8050726, 0, 0, 0, 1, 1,
0.9633812, -1.180258, 2.803349, 1, 1, 1, 1, 1,
0.9729681, 0.3329636, 3.355715, 1, 1, 1, 1, 1,
0.9898415, -1.161744, 2.87494, 1, 1, 1, 1, 1,
0.9920385, 0.2958267, 2.516918, 1, 1, 1, 1, 1,
0.9973187, -0.7604262, 2.088926, 1, 1, 1, 1, 1,
0.9973345, -0.5819206, 0.1481904, 1, 1, 1, 1, 1,
0.9978359, 1.105448, 2.377332, 1, 1, 1, 1, 1,
1.001502, 0.4061798, 0.7265853, 1, 1, 1, 1, 1,
1.003061, 1.064282, 0.714016, 1, 1, 1, 1, 1,
1.010901, -0.995322, 0.3409655, 1, 1, 1, 1, 1,
1.014404, 0.7265235, -0.182468, 1, 1, 1, 1, 1,
1.037908, 0.183003, 1.488198, 1, 1, 1, 1, 1,
1.040536, -1.264405, 3.733174, 1, 1, 1, 1, 1,
1.041444, 1.115092, 0.6004348, 1, 1, 1, 1, 1,
1.04158, -1.344057, 1.169648, 1, 1, 1, 1, 1,
1.052055, -0.1007097, 1.079902, 0, 0, 1, 1, 1,
1.054183, 0.3143083, 1.882701, 1, 0, 0, 1, 1,
1.055166, 0.2144775, 2.358372, 1, 0, 0, 1, 1,
1.056506, -0.679558, 1.559782, 1, 0, 0, 1, 1,
1.057797, -1.793388, 2.818844, 1, 0, 0, 1, 1,
1.062785, -0.06866298, 1.439922, 1, 0, 0, 1, 1,
1.073931, -0.01003617, -0.6995686, 0, 0, 0, 1, 1,
1.086371, 1.712184, 0.9695505, 0, 0, 0, 1, 1,
1.108704, 0.02326568, 1.647933, 0, 0, 0, 1, 1,
1.115499, 0.415968, 0.9736544, 0, 0, 0, 1, 1,
1.117486, -1.810036, 2.256317, 0, 0, 0, 1, 1,
1.135184, 1.276584, -1.628013, 0, 0, 0, 1, 1,
1.136038, -0.02074594, 3.023989, 0, 0, 0, 1, 1,
1.137914, -1.393664, 2.32206, 1, 1, 1, 1, 1,
1.143068, 1.571949, 0.7310091, 1, 1, 1, 1, 1,
1.145327, 0.1285192, 0.8731968, 1, 1, 1, 1, 1,
1.146571, 0.2799102, 0.9884914, 1, 1, 1, 1, 1,
1.149563, -0.3088915, 2.675824, 1, 1, 1, 1, 1,
1.159004, 1.812518, 0.4744232, 1, 1, 1, 1, 1,
1.160606, -0.1170545, 1.050579, 1, 1, 1, 1, 1,
1.161245, -0.6391327, 1.163893, 1, 1, 1, 1, 1,
1.162557, -0.01462439, 1.528903, 1, 1, 1, 1, 1,
1.169183, 0.4385437, 1.854738, 1, 1, 1, 1, 1,
1.170269, 0.193944, -0.6946585, 1, 1, 1, 1, 1,
1.177006, -0.1131943, 2.061959, 1, 1, 1, 1, 1,
1.187533, -0.1934321, 1.184021, 1, 1, 1, 1, 1,
1.187972, 0.6738481, -0.02821201, 1, 1, 1, 1, 1,
1.191333, -1.370316, 1.87708, 1, 1, 1, 1, 1,
1.193747, 0.1864599, 2.649185, 0, 0, 1, 1, 1,
1.19643, -1.532833, 3.266752, 1, 0, 0, 1, 1,
1.200882, -0.2541946, -0.2491448, 1, 0, 0, 1, 1,
1.20327, 0.009805479, 1.241114, 1, 0, 0, 1, 1,
1.208132, -0.4063741, 3.434249, 1, 0, 0, 1, 1,
1.213544, -1.651084, 2.793741, 1, 0, 0, 1, 1,
1.215104, -0.1352938, 2.977134, 0, 0, 0, 1, 1,
1.224323, -1.212853, 2.067168, 0, 0, 0, 1, 1,
1.240518, 0.5331888, 2.052598, 0, 0, 0, 1, 1,
1.244723, -1.240516, 1.220288, 0, 0, 0, 1, 1,
1.247528, 0.3585215, -0.01367784, 0, 0, 0, 1, 1,
1.260003, -0.5956101, 2.103189, 0, 0, 0, 1, 1,
1.262473, 1.221221, -0.5526769, 0, 0, 0, 1, 1,
1.26273, 0.3931013, 0.4617184, 1, 1, 1, 1, 1,
1.269791, -1.4022, 2.653339, 1, 1, 1, 1, 1,
1.277183, -0.3203373, 0.3124856, 1, 1, 1, 1, 1,
1.277936, 0.598428, -0.2900414, 1, 1, 1, 1, 1,
1.283425, 2.696386, -0.76085, 1, 1, 1, 1, 1,
1.284717, 0.5642809, 0.3738867, 1, 1, 1, 1, 1,
1.288111, -1.346286, 0.6278315, 1, 1, 1, 1, 1,
1.288479, 0.5310059, 1.226554, 1, 1, 1, 1, 1,
1.300555, 0.8822135, -0.7230003, 1, 1, 1, 1, 1,
1.304875, 0.742537, 2.577218, 1, 1, 1, 1, 1,
1.320569, -2.41206, 5.014849, 1, 1, 1, 1, 1,
1.326541, 0.2231611, 3.196555, 1, 1, 1, 1, 1,
1.328019, 0.8790423, 0.6521063, 1, 1, 1, 1, 1,
1.329964, -0.9929514, 3.187833, 1, 1, 1, 1, 1,
1.333944, -1.056986, 1.828667, 1, 1, 1, 1, 1,
1.3357, 0.2208967, 2.584315, 0, 0, 1, 1, 1,
1.338349, -0.9351479, 4.546457, 1, 0, 0, 1, 1,
1.338642, 1.181406, 0.02894653, 1, 0, 0, 1, 1,
1.346753, -0.5801913, 0.8748721, 1, 0, 0, 1, 1,
1.358262, -0.7954625, 2.75052, 1, 0, 0, 1, 1,
1.370408, -0.07952552, 2.233317, 1, 0, 0, 1, 1,
1.385996, -1.513104, 3.321944, 0, 0, 0, 1, 1,
1.398694, 2.407433, 2.209168, 0, 0, 0, 1, 1,
1.401382, 0.08121974, 2.0843, 0, 0, 0, 1, 1,
1.417239, -1.375834, 2.115738, 0, 0, 0, 1, 1,
1.425954, 0.3077982, 1.872914, 0, 0, 0, 1, 1,
1.429259, -0.4261856, 1.39652, 0, 0, 0, 1, 1,
1.430729, 0.1069, 2.250502, 0, 0, 0, 1, 1,
1.431656, 0.9550439, 1.652078, 1, 1, 1, 1, 1,
1.440103, 1.386266, 1.23105, 1, 1, 1, 1, 1,
1.454603, 0.4349837, 0.7249337, 1, 1, 1, 1, 1,
1.459064, -0.4943308, 1.01622, 1, 1, 1, 1, 1,
1.463548, 1.344116, 0.5033336, 1, 1, 1, 1, 1,
1.472223, 0.470942, 1.692, 1, 1, 1, 1, 1,
1.479649, 0.543287, 1.635574, 1, 1, 1, 1, 1,
1.488062, 0.6288171, 0.8034161, 1, 1, 1, 1, 1,
1.490106, 0.2791668, 0.7975917, 1, 1, 1, 1, 1,
1.497947, -1.140462, 1.915828, 1, 1, 1, 1, 1,
1.509801, 2.454051, 0.545375, 1, 1, 1, 1, 1,
1.522219, -0.06563707, 1.277105, 1, 1, 1, 1, 1,
1.529755, -0.9833366, 3.004207, 1, 1, 1, 1, 1,
1.537204, 2.365258, 1.173883, 1, 1, 1, 1, 1,
1.546721, 1.640294, 1.901484, 1, 1, 1, 1, 1,
1.580003, 0.287519, 1.505231, 0, 0, 1, 1, 1,
1.58198, -0.0101907, 0.4254259, 1, 0, 0, 1, 1,
1.58268, 1.330877, 1.992008, 1, 0, 0, 1, 1,
1.5905, 0.4832679, 1.626507, 1, 0, 0, 1, 1,
1.592229, 0.509078, 1.090058, 1, 0, 0, 1, 1,
1.593338, -1.187321, 2.373138, 1, 0, 0, 1, 1,
1.601469, 0.0233101, 0.9055288, 0, 0, 0, 1, 1,
1.608603, 0.4668543, 1.988161, 0, 0, 0, 1, 1,
1.617886, -0.105638, 1.14987, 0, 0, 0, 1, 1,
1.640481, -1.368376, 1.724827, 0, 0, 0, 1, 1,
1.641834, 0.2990499, 0.9781792, 0, 0, 0, 1, 1,
1.649381, -1.428167, 1.846527, 0, 0, 0, 1, 1,
1.679865, 1.411166, 0.9815986, 0, 0, 0, 1, 1,
1.722338, 0.570371, 1.255406, 1, 1, 1, 1, 1,
1.723384, 1.389493, 0.1029479, 1, 1, 1, 1, 1,
1.728609, 0.5633579, 3.249533, 1, 1, 1, 1, 1,
1.733743, 1.02862, 2.051541, 1, 1, 1, 1, 1,
1.735595, -0.04980523, 2.556622, 1, 1, 1, 1, 1,
1.738079, -1.668902, 4.033172, 1, 1, 1, 1, 1,
1.748529, -0.2757491, 2.13683, 1, 1, 1, 1, 1,
1.794675, -0.6783, 2.858518, 1, 1, 1, 1, 1,
1.803003, 0.5595843, 2.465779, 1, 1, 1, 1, 1,
1.877803, -0.4633596, 0.3938192, 1, 1, 1, 1, 1,
1.956618, -1.604797, 3.380061, 1, 1, 1, 1, 1,
1.962642, 1.232173, 0.5463018, 1, 1, 1, 1, 1,
1.971153, 0.3064746, 2.213773, 1, 1, 1, 1, 1,
1.985992, 0.00816359, 1.536592, 1, 1, 1, 1, 1,
2.012489, -0.1854611, 1.65644, 1, 1, 1, 1, 1,
2.064142, -0.1391062, 2.13403, 0, 0, 1, 1, 1,
2.067416, 1.193513, 1.77624, 1, 0, 0, 1, 1,
2.07339, -0.7942305, 1.962743, 1, 0, 0, 1, 1,
2.116876, -0.7781228, 0.8270839, 1, 0, 0, 1, 1,
2.121809, -0.8444523, 0.5163704, 1, 0, 0, 1, 1,
2.13793, -0.1845795, 1.746306, 1, 0, 0, 1, 1,
2.16133, -0.7568637, 3.512117, 0, 0, 0, 1, 1,
2.23501, -1.658601, 3.906285, 0, 0, 0, 1, 1,
2.247263, -1.403891, 2.98408, 0, 0, 0, 1, 1,
2.283031, 0.9157929, 1.020755, 0, 0, 0, 1, 1,
2.311385, 0.7416617, 0.05984689, 0, 0, 0, 1, 1,
2.4599, 1.316634, 2.160048, 0, 0, 0, 1, 1,
2.520162, -0.1645813, 1.572172, 0, 0, 0, 1, 1,
2.546393, -0.1726302, 2.020297, 1, 1, 1, 1, 1,
2.585005, -0.4708199, 1.116594, 1, 1, 1, 1, 1,
2.642258, -1.412841, 2.926141, 1, 1, 1, 1, 1,
2.848619, -0.7719799, 1.382379, 1, 1, 1, 1, 1,
2.922694, -0.2435168, 1.172964, 1, 1, 1, 1, 1,
3.013804, 1.595007, 0.566449, 1, 1, 1, 1, 1,
3.133522, -0.08138925, 3.207808, 1, 1, 1, 1, 1
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
var radius = 9.44345;
var distance = 33.16972;
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
mvMatrix.translate( 0.05573988, 0.5554404, 0.02658606 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16972);
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
