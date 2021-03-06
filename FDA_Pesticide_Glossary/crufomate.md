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
-3.286269, -0.792008, -1.117302, 1, 0, 0, 1,
-3.250333, 0.1258466, -1.648956, 1, 0.007843138, 0, 1,
-2.830032, 1.110976, -3.850076, 1, 0.01176471, 0, 1,
-2.747642, 0.1659907, -2.335013, 1, 0.01960784, 0, 1,
-2.712621, 1.956549, 0.3079912, 1, 0.02352941, 0, 1,
-2.587605, 1.532388, 0.01212152, 1, 0.03137255, 0, 1,
-2.469576, 0.6108515, -1.363523, 1, 0.03529412, 0, 1,
-2.432973, 0.1489587, -1.711151, 1, 0.04313726, 0, 1,
-2.369051, 0.6557455, -1.160529, 1, 0.04705882, 0, 1,
-2.33976, 0.5765968, -1.107752, 1, 0.05490196, 0, 1,
-2.299775, 1.024336, -2.112692, 1, 0.05882353, 0, 1,
-2.274169, -0.2943102, -0.576946, 1, 0.06666667, 0, 1,
-2.204644, -0.4113804, -1.065812, 1, 0.07058824, 0, 1,
-2.168763, -0.3983318, -2.064734, 1, 0.07843138, 0, 1,
-2.124555, -1.944192, -2.410609, 1, 0.08235294, 0, 1,
-2.12086, 0.6387729, -0.4612591, 1, 0.09019608, 0, 1,
-2.116444, -0.6920242, -0.9700611, 1, 0.09411765, 0, 1,
-2.094924, 0.4380467, -0.06298126, 1, 0.1019608, 0, 1,
-2.061832, -0.9336453, -1.362686, 1, 0.1098039, 0, 1,
-2.008861, -0.4428952, -1.209004, 1, 0.1137255, 0, 1,
-2.006956, 0.6368629, -1.883361, 1, 0.1215686, 0, 1,
-2.004852, 1.85284, -2.308386, 1, 0.1254902, 0, 1,
-1.988261, -0.9465729, -3.213045, 1, 0.1333333, 0, 1,
-1.958619, 1.07347, -1.226154, 1, 0.1372549, 0, 1,
-1.949775, 1.384657, 0.8326588, 1, 0.145098, 0, 1,
-1.94014, 0.6745415, -2.692461, 1, 0.1490196, 0, 1,
-1.8978, -0.4851901, -2.938541, 1, 0.1568628, 0, 1,
-1.896223, 1.336639, -3.092406, 1, 0.1607843, 0, 1,
-1.894101, -1.370826, -1.646731, 1, 0.1686275, 0, 1,
-1.862796, 2.148523, -0.04430413, 1, 0.172549, 0, 1,
-1.853873, -1.183123, -3.233501, 1, 0.1803922, 0, 1,
-1.847115, -0.4901314, -2.355108, 1, 0.1843137, 0, 1,
-1.823359, 0.7257802, -1.041366, 1, 0.1921569, 0, 1,
-1.816424, 0.3055429, -1.643745, 1, 0.1960784, 0, 1,
-1.812045, -0.3776755, -1.110259, 1, 0.2039216, 0, 1,
-1.796357, 0.4913227, -1.47175, 1, 0.2117647, 0, 1,
-1.794783, -0.884666, -0.9395703, 1, 0.2156863, 0, 1,
-1.789151, 0.2549736, -0.3706247, 1, 0.2235294, 0, 1,
-1.775365, 0.4916377, -1.553651, 1, 0.227451, 0, 1,
-1.772144, 0.8104274, -1.983593, 1, 0.2352941, 0, 1,
-1.751366, -0.5041763, -4.544471, 1, 0.2392157, 0, 1,
-1.741258, -0.03891071, 0.5317466, 1, 0.2470588, 0, 1,
-1.737393, -1.316558, -3.162345, 1, 0.2509804, 0, 1,
-1.734906, -0.1993262, -1.60821, 1, 0.2588235, 0, 1,
-1.729585, -0.5634986, -1.625759, 1, 0.2627451, 0, 1,
-1.6925, -0.516418, -2.577454, 1, 0.2705882, 0, 1,
-1.690848, -0.3727973, -2.733648, 1, 0.2745098, 0, 1,
-1.686484, 0.3925487, 0.2846113, 1, 0.282353, 0, 1,
-1.686147, 0.2783039, -1.000557, 1, 0.2862745, 0, 1,
-1.680628, 0.9419501, -1.433899, 1, 0.2941177, 0, 1,
-1.65057, 0.8048665, -0.2126505, 1, 0.3019608, 0, 1,
-1.64877, -0.8689424, -1.709082, 1, 0.3058824, 0, 1,
-1.647964, -0.2068778, -3.233917, 1, 0.3137255, 0, 1,
-1.60044, 2.019029, 0.4092145, 1, 0.3176471, 0, 1,
-1.597508, -0.4379585, -4.154707, 1, 0.3254902, 0, 1,
-1.587422, -1.393149, -1.673618, 1, 0.3294118, 0, 1,
-1.579452, 0.3222698, 1.058325, 1, 0.3372549, 0, 1,
-1.574296, -0.4985501, -1.448722, 1, 0.3411765, 0, 1,
-1.571219, 1.133936, -1.145773, 1, 0.3490196, 0, 1,
-1.569273, 0.5647882, -1.762786, 1, 0.3529412, 0, 1,
-1.549681, 0.1459572, -0.3722291, 1, 0.3607843, 0, 1,
-1.544166, 0.1252763, -1.133518, 1, 0.3647059, 0, 1,
-1.522682, -0.9770632, -3.228984, 1, 0.372549, 0, 1,
-1.518817, -0.6993709, -1.695507, 1, 0.3764706, 0, 1,
-1.515553, -1.498994, -2.46765, 1, 0.3843137, 0, 1,
-1.509076, -0.3680784, -1.682074, 1, 0.3882353, 0, 1,
-1.50488, 0.6065859, -0.2036338, 1, 0.3960784, 0, 1,
-1.503789, 1.013427, 0.3951789, 1, 0.4039216, 0, 1,
-1.502563, -1.083925, -2.372503, 1, 0.4078431, 0, 1,
-1.495961, -1.305813, -2.021594, 1, 0.4156863, 0, 1,
-1.492167, 0.1706075, -0.6668153, 1, 0.4196078, 0, 1,
-1.490789, -0.1237582, -0.9010774, 1, 0.427451, 0, 1,
-1.487095, -0.8851534, -0.4596885, 1, 0.4313726, 0, 1,
-1.467622, 0.9341897, 0.5681338, 1, 0.4392157, 0, 1,
-1.465109, 0.7850982, -0.5091873, 1, 0.4431373, 0, 1,
-1.454358, 0.4820259, -2.402177, 1, 0.4509804, 0, 1,
-1.450794, 0.1367192, -3.061542, 1, 0.454902, 0, 1,
-1.448962, -0.2842455, -0.58356, 1, 0.4627451, 0, 1,
-1.431015, -0.3570611, -2.1461, 1, 0.4666667, 0, 1,
-1.427195, -0.2658037, -3.545623, 1, 0.4745098, 0, 1,
-1.427151, 0.268741, -0.7795871, 1, 0.4784314, 0, 1,
-1.426817, -0.4112895, -1.385172, 1, 0.4862745, 0, 1,
-1.418521, 0.06940133, -0.4321419, 1, 0.4901961, 0, 1,
-1.417558, 0.7034772, -0.769545, 1, 0.4980392, 0, 1,
-1.41569, 0.8519796, -0.05698493, 1, 0.5058824, 0, 1,
-1.411997, 1.463694, -0.5917444, 1, 0.509804, 0, 1,
-1.391907, -0.4702782, -2.509102, 1, 0.5176471, 0, 1,
-1.388908, -1.121897, -0.748196, 1, 0.5215687, 0, 1,
-1.388158, 0.9369105, -2.022658, 1, 0.5294118, 0, 1,
-1.382422, 1.211523, -3.203724, 1, 0.5333334, 0, 1,
-1.377861, 0.5787688, 0.03529421, 1, 0.5411765, 0, 1,
-1.376238, 0.3377707, -0.06517377, 1, 0.5450981, 0, 1,
-1.371358, -1.174252, -3.414139, 1, 0.5529412, 0, 1,
-1.370237, -0.9878359, -3.578182, 1, 0.5568628, 0, 1,
-1.366442, 1.515066, 0.3638434, 1, 0.5647059, 0, 1,
-1.366057, 1.26199, -0.763437, 1, 0.5686275, 0, 1,
-1.358361, -0.1585579, -0.3832156, 1, 0.5764706, 0, 1,
-1.353491, -2.390174, -4.456295, 1, 0.5803922, 0, 1,
-1.350768, -1.326781, -2.926027, 1, 0.5882353, 0, 1,
-1.341816, -0.8339031, -0.4179643, 1, 0.5921569, 0, 1,
-1.340223, 0.4769752, -2.532347, 1, 0.6, 0, 1,
-1.340124, -1.74481, -2.797205, 1, 0.6078432, 0, 1,
-1.337947, 0.7309899, -0.3815557, 1, 0.6117647, 0, 1,
-1.337313, -0.09888923, -3.770639, 1, 0.6196079, 0, 1,
-1.331581, 1.798215, -0.7352031, 1, 0.6235294, 0, 1,
-1.328329, 0.1109687, -0.6887476, 1, 0.6313726, 0, 1,
-1.320759, 0.01664521, -2.831798, 1, 0.6352941, 0, 1,
-1.315863, 1.45817, -1.991391, 1, 0.6431373, 0, 1,
-1.313037, -0.006886724, -2.967079, 1, 0.6470588, 0, 1,
-1.30951, 1.483547, -0.5733038, 1, 0.654902, 0, 1,
-1.304815, 1.884493, -1.327763, 1, 0.6588235, 0, 1,
-1.293931, 0.216723, -4.634064, 1, 0.6666667, 0, 1,
-1.293397, 0.01170851, -1.018239, 1, 0.6705883, 0, 1,
-1.278718, -0.7901416, -1.868054, 1, 0.6784314, 0, 1,
-1.277501, -0.784973, -2.698255, 1, 0.682353, 0, 1,
-1.270284, 0.8641742, -0.8520529, 1, 0.6901961, 0, 1,
-1.259371, -0.2703241, -1.577812, 1, 0.6941177, 0, 1,
-1.255238, -1.200601, -3.831516, 1, 0.7019608, 0, 1,
-1.244462, 1.042931, -1.586198, 1, 0.7098039, 0, 1,
-1.242389, 1.699196, -1.697299, 1, 0.7137255, 0, 1,
-1.239095, 1.976457, -1.235063, 1, 0.7215686, 0, 1,
-1.23846, 0.3190489, -2.480708, 1, 0.7254902, 0, 1,
-1.237684, 0.060702, -2.442998, 1, 0.7333333, 0, 1,
-1.22481, 0.899804, -1.51834, 1, 0.7372549, 0, 1,
-1.221624, -0.2019477, -1.196569, 1, 0.7450981, 0, 1,
-1.218419, -0.4086443, -2.356441, 1, 0.7490196, 0, 1,
-1.211795, -0.5981359, -1.110282, 1, 0.7568628, 0, 1,
-1.209338, 0.8471957, -0.2228617, 1, 0.7607843, 0, 1,
-1.208847, -1.490892, -0.8681039, 1, 0.7686275, 0, 1,
-1.189279, -1.456241, -2.764568, 1, 0.772549, 0, 1,
-1.187558, 1.034353, 0.1465978, 1, 0.7803922, 0, 1,
-1.186973, -0.1296841, -1.068867, 1, 0.7843137, 0, 1,
-1.185719, 1.882286, 1.66888, 1, 0.7921569, 0, 1,
-1.182363, 0.5357683, -0.9525322, 1, 0.7960784, 0, 1,
-1.167522, -0.6077839, -3.328678, 1, 0.8039216, 0, 1,
-1.161972, -1.11721, -1.946083, 1, 0.8117647, 0, 1,
-1.161305, 0.3849628, 0.2581402, 1, 0.8156863, 0, 1,
-1.157489, -1.98693, -4.039262, 1, 0.8235294, 0, 1,
-1.155658, 2.611128, -2.148141, 1, 0.827451, 0, 1,
-1.15564, -1.091889, -3.444842, 1, 0.8352941, 0, 1,
-1.145325, -0.2445168, 0.6979778, 1, 0.8392157, 0, 1,
-1.125111, -0.4536626, -1.022213, 1, 0.8470588, 0, 1,
-1.112885, -1.428414, -2.839263, 1, 0.8509804, 0, 1,
-1.102909, 3.120453, 0.4646943, 1, 0.8588235, 0, 1,
-1.099795, 0.1216442, -1.401549, 1, 0.8627451, 0, 1,
-1.093933, -0.04435498, -2.906388, 1, 0.8705882, 0, 1,
-1.089469, 0.3694738, -1.166988, 1, 0.8745098, 0, 1,
-1.087985, -1.083254, -1.835361, 1, 0.8823529, 0, 1,
-1.086444, 0.890156, -0.377281, 1, 0.8862745, 0, 1,
-1.078814, 0.4971722, -0.7430964, 1, 0.8941177, 0, 1,
-1.072229, 0.3777098, -0.2540627, 1, 0.8980392, 0, 1,
-1.067998, -0.9705083, -1.287682, 1, 0.9058824, 0, 1,
-1.065953, 0.171445, -1.948865, 1, 0.9137255, 0, 1,
-1.061067, 0.5518535, -3.143012, 1, 0.9176471, 0, 1,
-1.059187, 0.07669986, -0.2698904, 1, 0.9254902, 0, 1,
-1.057873, -0.9456691, -2.373191, 1, 0.9294118, 0, 1,
-1.056377, -0.3063974, -0.6566784, 1, 0.9372549, 0, 1,
-1.045781, -1.520493, -4.327447, 1, 0.9411765, 0, 1,
-1.044139, -2.691044, -1.935398, 1, 0.9490196, 0, 1,
-1.035502, 0.0437497, -1.9295, 1, 0.9529412, 0, 1,
-1.035275, 0.7751507, -1.805169, 1, 0.9607843, 0, 1,
-1.034708, 0.153898, -1.549122, 1, 0.9647059, 0, 1,
-1.033236, 1.898844, -0.6476893, 1, 0.972549, 0, 1,
-1.03035, 0.6449649, -0.31513, 1, 0.9764706, 0, 1,
-1.027184, 0.4471304, -2.470445, 1, 0.9843137, 0, 1,
-1.022758, -1.576626, -3.240156, 1, 0.9882353, 0, 1,
-1.022442, 0.6560335, 0.191403, 1, 0.9960784, 0, 1,
-1.016056, 0.02530177, -1.588204, 0.9960784, 1, 0, 1,
-1.007484, 1.424042, 0.1576676, 0.9921569, 1, 0, 1,
-0.9914255, 0.4814301, -0.9619716, 0.9843137, 1, 0, 1,
-0.9831568, 0.3386121, -1.549178, 0.9803922, 1, 0, 1,
-0.9801881, 0.9426715, 0.002777727, 0.972549, 1, 0, 1,
-0.9790908, -0.08600411, -1.075121, 0.9686275, 1, 0, 1,
-0.9786146, -1.436989, -3.697669, 0.9607843, 1, 0, 1,
-0.9733971, -0.02386746, -1.462208, 0.9568627, 1, 0, 1,
-0.9705704, -0.9227127, -1.731603, 0.9490196, 1, 0, 1,
-0.9621148, -2.06844, -1.867559, 0.945098, 1, 0, 1,
-0.9620531, -1.460959, -0.6038526, 0.9372549, 1, 0, 1,
-0.961383, 1.00379, -1.101787, 0.9333333, 1, 0, 1,
-0.9612788, -0.7427133, -2.492922, 0.9254902, 1, 0, 1,
-0.9495596, -0.5029142, -3.517073, 0.9215686, 1, 0, 1,
-0.9488863, -0.5937114, -2.929726, 0.9137255, 1, 0, 1,
-0.9422866, 0.5086894, -0.5359248, 0.9098039, 1, 0, 1,
-0.9354818, 0.05262375, -1.654389, 0.9019608, 1, 0, 1,
-0.9289823, -1.01124, -3.005075, 0.8941177, 1, 0, 1,
-0.9287376, 2.260694, -1.498607, 0.8901961, 1, 0, 1,
-0.9254099, -1.078416, -2.201912, 0.8823529, 1, 0, 1,
-0.9182585, 0.6539619, -1.189778, 0.8784314, 1, 0, 1,
-0.9137902, 0.5534253, 0.320481, 0.8705882, 1, 0, 1,
-0.913694, 0.2965104, -3.712664, 0.8666667, 1, 0, 1,
-0.908681, 0.4918208, -1.069825, 0.8588235, 1, 0, 1,
-0.9084677, 0.3506537, -1.013238, 0.854902, 1, 0, 1,
-0.9042186, 0.6602114, -1.464196, 0.8470588, 1, 0, 1,
-0.9029123, 1.887062, -0.4078334, 0.8431373, 1, 0, 1,
-0.9013996, 0.9952206, -3.131616, 0.8352941, 1, 0, 1,
-0.9006706, 0.2482208, -0.6245342, 0.8313726, 1, 0, 1,
-0.8943005, 2.181067, 0.2411315, 0.8235294, 1, 0, 1,
-0.8927397, -1.17575, -1.216212, 0.8196079, 1, 0, 1,
-0.8907952, -2.015088, -1.465726, 0.8117647, 1, 0, 1,
-0.8835281, -0.6297016, -2.095151, 0.8078431, 1, 0, 1,
-0.8811499, 1.14447, -1.525033, 0.8, 1, 0, 1,
-0.8800612, -0.635676, -1.736861, 0.7921569, 1, 0, 1,
-0.8782881, -0.6165084, -3.624255, 0.7882353, 1, 0, 1,
-0.8712922, -1.806647, -2.627554, 0.7803922, 1, 0, 1,
-0.8706241, -2.07222, -1.39723, 0.7764706, 1, 0, 1,
-0.8703716, -0.7991059, -3.018544, 0.7686275, 1, 0, 1,
-0.8685342, -1.758987, -4.404491, 0.7647059, 1, 0, 1,
-0.8625183, -1.46126, -2.504375, 0.7568628, 1, 0, 1,
-0.8604187, -0.4043935, -1.236662, 0.7529412, 1, 0, 1,
-0.8537457, 1.339524, -1.882454, 0.7450981, 1, 0, 1,
-0.8453214, -0.09521022, -0.4793917, 0.7411765, 1, 0, 1,
-0.8445234, -0.2991448, -1.965247, 0.7333333, 1, 0, 1,
-0.8298777, -0.6261895, -0.7865298, 0.7294118, 1, 0, 1,
-0.8272801, -0.05143267, -1.448445, 0.7215686, 1, 0, 1,
-0.8231858, -1.583917, -3.160884, 0.7176471, 1, 0, 1,
-0.8198397, -0.6817037, -2.951734, 0.7098039, 1, 0, 1,
-0.8168847, 0.6933284, -1.382968, 0.7058824, 1, 0, 1,
-0.8163791, 0.3497445, -0.4115016, 0.6980392, 1, 0, 1,
-0.8156788, -1.798557, -2.613621, 0.6901961, 1, 0, 1,
-0.8150119, 0.5303306, -1.57356, 0.6862745, 1, 0, 1,
-0.813177, -0.5919182, -2.965727, 0.6784314, 1, 0, 1,
-0.8046839, -1.02184, -2.830775, 0.6745098, 1, 0, 1,
-0.8031419, 0.1055312, -0.7229388, 0.6666667, 1, 0, 1,
-0.8019444, -1.104721, -2.928624, 0.6627451, 1, 0, 1,
-0.80002, 0.604689, 1.223822, 0.654902, 1, 0, 1,
-0.7973996, -0.6196533, -3.383087, 0.6509804, 1, 0, 1,
-0.7905077, 0.770318, -2.026672, 0.6431373, 1, 0, 1,
-0.7894931, -0.6689112, -1.862924, 0.6392157, 1, 0, 1,
-0.7872586, 0.3634009, -1.039827, 0.6313726, 1, 0, 1,
-0.7865519, -0.08229394, -2.070685, 0.627451, 1, 0, 1,
-0.778674, 1.436849, 0.6601818, 0.6196079, 1, 0, 1,
-0.77722, 2.05361, 1.787145, 0.6156863, 1, 0, 1,
-0.7708672, 0.847658, -0.6131266, 0.6078432, 1, 0, 1,
-0.7630203, 0.1223251, -0.6684047, 0.6039216, 1, 0, 1,
-0.7603, -0.2720706, -1.929927, 0.5960785, 1, 0, 1,
-0.7438521, 0.9979236, -1.704363, 0.5882353, 1, 0, 1,
-0.7365007, -1.556083, -3.348731, 0.5843138, 1, 0, 1,
-0.7344863, -1.174472, -2.101214, 0.5764706, 1, 0, 1,
-0.73232, -0.2493037, -2.405058, 0.572549, 1, 0, 1,
-0.7309563, -0.7978567, -1.811246, 0.5647059, 1, 0, 1,
-0.7287745, -1.10137, -3.691934, 0.5607843, 1, 0, 1,
-0.7281716, 0.5567449, -2.254236, 0.5529412, 1, 0, 1,
-0.726302, -0.4687478, -3.608684, 0.5490196, 1, 0, 1,
-0.7244673, 1.850065, 0.6757507, 0.5411765, 1, 0, 1,
-0.7208806, -0.4294475, -1.102364, 0.5372549, 1, 0, 1,
-0.7177606, 1.661901, -0.356878, 0.5294118, 1, 0, 1,
-0.7172137, 0.2280764, -1.359067, 0.5254902, 1, 0, 1,
-0.7142386, 0.3288122, -0.3373434, 0.5176471, 1, 0, 1,
-0.7100837, -0.4632591, -1.816397, 0.5137255, 1, 0, 1,
-0.7091785, 0.09948754, -3.236334, 0.5058824, 1, 0, 1,
-0.6996507, -1.103426, -2.07478, 0.5019608, 1, 0, 1,
-0.6995233, -0.8235547, -2.327166, 0.4941176, 1, 0, 1,
-0.6994899, 0.8864009, 1.971477, 0.4862745, 1, 0, 1,
-0.6977109, -0.4663382, -2.127741, 0.4823529, 1, 0, 1,
-0.696346, 0.06485011, -2.775557, 0.4745098, 1, 0, 1,
-0.6938887, -0.05314219, -0.6112697, 0.4705882, 1, 0, 1,
-0.6915281, -0.4119478, -1.828165, 0.4627451, 1, 0, 1,
-0.6913261, -0.1369945, -1.170568, 0.4588235, 1, 0, 1,
-0.6872246, -0.8486683, -2.206462, 0.4509804, 1, 0, 1,
-0.6871473, -2.281075, -2.100566, 0.4470588, 1, 0, 1,
-0.6842645, 0.3322367, -1.038351, 0.4392157, 1, 0, 1,
-0.6808528, 0.4723173, 0.4841598, 0.4352941, 1, 0, 1,
-0.6777183, -1.103472, -0.6906549, 0.427451, 1, 0, 1,
-0.6753672, -1.224653, -1.608278, 0.4235294, 1, 0, 1,
-0.6706126, -0.7904805, -1.975577, 0.4156863, 1, 0, 1,
-0.6636845, -0.37352, -1.22938, 0.4117647, 1, 0, 1,
-0.6600519, 1.517284, 1.45916, 0.4039216, 1, 0, 1,
-0.6599994, 1.104681, -1.291255, 0.3960784, 1, 0, 1,
-0.6591086, 1.19624, -0.5256805, 0.3921569, 1, 0, 1,
-0.6488842, -2.078697, -4.068852, 0.3843137, 1, 0, 1,
-0.6477761, -1.12143, -3.636866, 0.3803922, 1, 0, 1,
-0.6476266, 0.4681429, -2.105464, 0.372549, 1, 0, 1,
-0.6436635, -1.38476, -3.303898, 0.3686275, 1, 0, 1,
-0.6429644, 0.8211383, 0.2870727, 0.3607843, 1, 0, 1,
-0.6371167, -0.4431247, -1.569433, 0.3568628, 1, 0, 1,
-0.6271742, 0.2365727, -1.177961, 0.3490196, 1, 0, 1,
-0.6229823, -0.5184858, -1.601968, 0.345098, 1, 0, 1,
-0.6175669, 0.2239429, -2.842193, 0.3372549, 1, 0, 1,
-0.6099722, -1.1469, -2.63015, 0.3333333, 1, 0, 1,
-0.6093464, 0.4295392, -1.257028, 0.3254902, 1, 0, 1,
-0.6053384, 0.3316927, 0.7233059, 0.3215686, 1, 0, 1,
-0.6050639, 0.3367023, -2.152842, 0.3137255, 1, 0, 1,
-0.6006245, 1.508872, 1.4473, 0.3098039, 1, 0, 1,
-0.5891434, 0.6310528, -0.002294157, 0.3019608, 1, 0, 1,
-0.5867106, -0.4549593, -1.909856, 0.2941177, 1, 0, 1,
-0.5847416, 0.207084, -1.936774, 0.2901961, 1, 0, 1,
-0.5846184, 0.3569065, -2.431472, 0.282353, 1, 0, 1,
-0.5803234, 0.3818876, -1.468937, 0.2784314, 1, 0, 1,
-0.5795275, -1.445151, -2.6565, 0.2705882, 1, 0, 1,
-0.5751491, 1.102169, -1.209993, 0.2666667, 1, 0, 1,
-0.5705034, -0.00821314, -1.965093, 0.2588235, 1, 0, 1,
-0.5696602, -1.49223, -1.886303, 0.254902, 1, 0, 1,
-0.564195, -1.673978, -3.211686, 0.2470588, 1, 0, 1,
-0.5521427, -0.007946277, -1.482742, 0.2431373, 1, 0, 1,
-0.5477135, -0.1492817, -1.733396, 0.2352941, 1, 0, 1,
-0.5433045, -0.7757047, -1.165661, 0.2313726, 1, 0, 1,
-0.5432877, 0.9389874, -1.876811, 0.2235294, 1, 0, 1,
-0.542913, -0.4434229, -3.687695, 0.2196078, 1, 0, 1,
-0.5406953, 0.4315059, -1.561895, 0.2117647, 1, 0, 1,
-0.5398564, -1.421158, -5.154687, 0.2078431, 1, 0, 1,
-0.5382327, 1.05301, -0.512584, 0.2, 1, 0, 1,
-0.5366684, 0.7371593, -0.9510326, 0.1921569, 1, 0, 1,
-0.5349438, -0.3874556, -3.693577, 0.1882353, 1, 0, 1,
-0.5330269, 0.1483793, -0.9219133, 0.1803922, 1, 0, 1,
-0.5265707, 0.5210767, -0.1268216, 0.1764706, 1, 0, 1,
-0.5264137, 0.07326463, -2.619698, 0.1686275, 1, 0, 1,
-0.5235057, -0.8298059, -2.140752, 0.1647059, 1, 0, 1,
-0.5229, -1.218274, -1.381076, 0.1568628, 1, 0, 1,
-0.520115, 0.1572284, -3.28293, 0.1529412, 1, 0, 1,
-0.5189009, -1.213115, -1.243531, 0.145098, 1, 0, 1,
-0.5171541, -1.325775, -2.702219, 0.1411765, 1, 0, 1,
-0.51509, 0.7310447, 0.7956969, 0.1333333, 1, 0, 1,
-0.514975, -1.097367, -3.72211, 0.1294118, 1, 0, 1,
-0.5128965, 1.455045, 0.3687302, 0.1215686, 1, 0, 1,
-0.5125024, -0.5275176, -1.230873, 0.1176471, 1, 0, 1,
-0.510076, -0.1768886, -1.676834, 0.1098039, 1, 0, 1,
-0.5061779, 0.2104211, -0.4036067, 0.1058824, 1, 0, 1,
-0.5048822, -0.2667647, -1.015863, 0.09803922, 1, 0, 1,
-0.5039381, -1.89386, -2.768753, 0.09019608, 1, 0, 1,
-0.5029539, 1.052738, -0.6405131, 0.08627451, 1, 0, 1,
-0.498758, 0.4513772, 0.3124233, 0.07843138, 1, 0, 1,
-0.4930182, 1.023926, 1.103847, 0.07450981, 1, 0, 1,
-0.4912868, -0.5661584, -1.434606, 0.06666667, 1, 0, 1,
-0.4866488, -0.4556971, -1.748091, 0.0627451, 1, 0, 1,
-0.4744574, -0.03911921, -2.39029, 0.05490196, 1, 0, 1,
-0.4723493, 0.9945526, -0.4642028, 0.05098039, 1, 0, 1,
-0.471298, 1.722839, 1.55313, 0.04313726, 1, 0, 1,
-0.4674528, -0.7662492, -1.775463, 0.03921569, 1, 0, 1,
-0.4654202, 1.251888, -0.01854279, 0.03137255, 1, 0, 1,
-0.4635399, 0.05473706, -0.6218445, 0.02745098, 1, 0, 1,
-0.4620353, -0.3589006, -0.2715512, 0.01960784, 1, 0, 1,
-0.4612723, -0.07410955, 0.2089106, 0.01568628, 1, 0, 1,
-0.4600605, -0.4139386, -3.834123, 0.007843138, 1, 0, 1,
-0.459642, -1.44742, -3.739335, 0.003921569, 1, 0, 1,
-0.459028, -1.76197, -2.349145, 0, 1, 0.003921569, 1,
-0.4558611, -1.090564, -4.534099, 0, 1, 0.01176471, 1,
-0.4541132, -2.215455, -2.878757, 0, 1, 0.01568628, 1,
-0.4514933, 0.4473822, -1.301499, 0, 1, 0.02352941, 1,
-0.4507098, 1.53011, -0.6215802, 0, 1, 0.02745098, 1,
-0.4499317, 0.6137336, -1.785393, 0, 1, 0.03529412, 1,
-0.4478548, -0.004461191, -1.736115, 0, 1, 0.03921569, 1,
-0.4463668, -1.709145, -2.940967, 0, 1, 0.04705882, 1,
-0.4425694, 0.1245862, -2.336693, 0, 1, 0.05098039, 1,
-0.4233586, 0.9609433, -1.049342, 0, 1, 0.05882353, 1,
-0.4232575, -0.4566708, -2.338887, 0, 1, 0.0627451, 1,
-0.4219149, 0.005334873, -1.634816, 0, 1, 0.07058824, 1,
-0.4208311, -0.9026992, -3.118057, 0, 1, 0.07450981, 1,
-0.4141781, -0.7527397, -2.425811, 0, 1, 0.08235294, 1,
-0.407589, 1.586823, -0.4744453, 0, 1, 0.08627451, 1,
-0.402565, -0.6009336, -3.571992, 0, 1, 0.09411765, 1,
-0.4011583, 1.737473, 1.120369, 0, 1, 0.1019608, 1,
-0.3985844, -0.681567, -2.423192, 0, 1, 0.1058824, 1,
-0.3885235, 1.04594, -1.018372, 0, 1, 0.1137255, 1,
-0.3884103, -1.032682, -2.506572, 0, 1, 0.1176471, 1,
-0.3852649, 1.45977, -1.262451, 0, 1, 0.1254902, 1,
-0.3849063, -1.203038, -2.542754, 0, 1, 0.1294118, 1,
-0.3808601, 0.9197956, -0.9794016, 0, 1, 0.1372549, 1,
-0.3795978, 0.8594745, 1.02353, 0, 1, 0.1411765, 1,
-0.3780883, 0.8417233, 0.8334576, 0, 1, 0.1490196, 1,
-0.3754085, -1.853348, -1.192603, 0, 1, 0.1529412, 1,
-0.3736273, -0.2020904, -2.577792, 0, 1, 0.1607843, 1,
-0.3721375, -1.067492, -0.7876262, 0, 1, 0.1647059, 1,
-0.3717973, -0.6902943, -1.275994, 0, 1, 0.172549, 1,
-0.367581, 0.9916515, 0.2102414, 0, 1, 0.1764706, 1,
-0.3659489, 0.08673114, -1.4896, 0, 1, 0.1843137, 1,
-0.3657456, 0.5588934, -0.3566908, 0, 1, 0.1882353, 1,
-0.3635972, 1.797565, -0.143608, 0, 1, 0.1960784, 1,
-0.3612758, -0.655161, -1.162895, 0, 1, 0.2039216, 1,
-0.3558388, 0.4374398, -0.6380181, 0, 1, 0.2078431, 1,
-0.3535955, 1.243626, -0.7882376, 0, 1, 0.2156863, 1,
-0.348403, -0.01162593, -1.472889, 0, 1, 0.2196078, 1,
-0.3451569, 1.910624, 3.09581, 0, 1, 0.227451, 1,
-0.344724, 0.8837345, -0.7854272, 0, 1, 0.2313726, 1,
-0.3395015, 0.4924136, 1.15314, 0, 1, 0.2392157, 1,
-0.3392703, -2.085728, -1.61791, 0, 1, 0.2431373, 1,
-0.3369882, -0.142987, -2.001854, 0, 1, 0.2509804, 1,
-0.3306028, 0.359606, -0.3036803, 0, 1, 0.254902, 1,
-0.3217648, -0.534181, -1.354342, 0, 1, 0.2627451, 1,
-0.3203822, -0.9687387, -2.411819, 0, 1, 0.2666667, 1,
-0.3187063, 1.714679, -0.7626541, 0, 1, 0.2745098, 1,
-0.3179867, -0.787423, -2.168208, 0, 1, 0.2784314, 1,
-0.3170469, -0.1705963, -2.310951, 0, 1, 0.2862745, 1,
-0.314524, -0.4660608, -1.884897, 0, 1, 0.2901961, 1,
-0.3132821, -1.431251, -5.05932, 0, 1, 0.2980392, 1,
-0.3111843, 0.2944235, 0.4351264, 0, 1, 0.3058824, 1,
-0.3076815, 0.5413905, -1.024855, 0, 1, 0.3098039, 1,
-0.3057714, -0.09509567, -1.061422, 0, 1, 0.3176471, 1,
-0.3048464, -1.381283, -2.468611, 0, 1, 0.3215686, 1,
-0.3016099, -0.1063165, -3.879672, 0, 1, 0.3294118, 1,
-0.2993909, -1.362059, -3.263403, 0, 1, 0.3333333, 1,
-0.296704, 0.2454671, -0.04716058, 0, 1, 0.3411765, 1,
-0.2957425, 0.08046553, -2.115669, 0, 1, 0.345098, 1,
-0.2862057, 0.6661914, -0.8871368, 0, 1, 0.3529412, 1,
-0.2858978, 0.1909219, -2.365056, 0, 1, 0.3568628, 1,
-0.284674, -1.102992, -3.163313, 0, 1, 0.3647059, 1,
-0.2842596, -0.6677676, -2.762666, 0, 1, 0.3686275, 1,
-0.2841408, -1.517053, -3.243068, 0, 1, 0.3764706, 1,
-0.2792497, 0.6787542, -1.316123, 0, 1, 0.3803922, 1,
-0.277687, 0.9574015, -1.467746, 0, 1, 0.3882353, 1,
-0.2758922, 0.04125185, -2.525938, 0, 1, 0.3921569, 1,
-0.2755122, 0.6875336, 0.8702471, 0, 1, 0.4, 1,
-0.2722352, -0.2783891, -2.562623, 0, 1, 0.4078431, 1,
-0.2704801, 1.694357, -0.8728358, 0, 1, 0.4117647, 1,
-0.2655292, 1.685845, 1.20399, 0, 1, 0.4196078, 1,
-0.2562229, -0.7124372, -3.01939, 0, 1, 0.4235294, 1,
-0.2536495, -2.338033, -2.801975, 0, 1, 0.4313726, 1,
-0.2494322, 0.8491048, -1.9764, 0, 1, 0.4352941, 1,
-0.2461228, -0.6241668, -4.598938, 0, 1, 0.4431373, 1,
-0.2384315, 0.6396407, -0.4356773, 0, 1, 0.4470588, 1,
-0.2302105, -0.2120569, -2.242649, 0, 1, 0.454902, 1,
-0.2243975, 1.356042, 0.1964677, 0, 1, 0.4588235, 1,
-0.2237539, 0.4478261, -1.519572, 0, 1, 0.4666667, 1,
-0.2199073, -1.295784, -2.984319, 0, 1, 0.4705882, 1,
-0.2170674, -0.1312445, -3.659153, 0, 1, 0.4784314, 1,
-0.2134333, 0.2484244, 1.470291, 0, 1, 0.4823529, 1,
-0.2118003, 1.3107, 0.350244, 0, 1, 0.4901961, 1,
-0.211535, -1.009849, -4.222515, 0, 1, 0.4941176, 1,
-0.2059709, 0.274936, -0.7358798, 0, 1, 0.5019608, 1,
-0.2043878, -2.430198, -1.306898, 0, 1, 0.509804, 1,
-0.2000579, -1.047576, -2.174607, 0, 1, 0.5137255, 1,
-0.1999236, 0.5397381, 0.1032836, 0, 1, 0.5215687, 1,
-0.1970419, -0.4538625, -1.699126, 0, 1, 0.5254902, 1,
-0.1912744, -0.6876415, -2.835015, 0, 1, 0.5333334, 1,
-0.191214, -0.519315, -2.100978, 0, 1, 0.5372549, 1,
-0.1904585, 0.6662552, 0.8033746, 0, 1, 0.5450981, 1,
-0.1879352, 0.7000127, -1.301004, 0, 1, 0.5490196, 1,
-0.1824223, 0.4291733, -1.040265, 0, 1, 0.5568628, 1,
-0.1821085, 0.4744509, -0.198758, 0, 1, 0.5607843, 1,
-0.1780474, -1.123267, -2.260719, 0, 1, 0.5686275, 1,
-0.1764672, 0.1684034, -2.474433, 0, 1, 0.572549, 1,
-0.1759307, 0.2467067, 1.047177, 0, 1, 0.5803922, 1,
-0.1687512, 0.4911466, -1.013094, 0, 1, 0.5843138, 1,
-0.1669605, 0.7749257, -0.2935721, 0, 1, 0.5921569, 1,
-0.1638972, -0.2449672, -0.4094024, 0, 1, 0.5960785, 1,
-0.1601508, -1.192456, -2.422108, 0, 1, 0.6039216, 1,
-0.1594838, -0.9590749, -3.000529, 0, 1, 0.6117647, 1,
-0.1576408, 0.8021647, -1.352637, 0, 1, 0.6156863, 1,
-0.1539573, -0.07391626, -1.785266, 0, 1, 0.6235294, 1,
-0.1536965, 0.4946576, -0.426924, 0, 1, 0.627451, 1,
-0.1534864, 0.53009, -1.623161, 0, 1, 0.6352941, 1,
-0.1509987, 1.039101, 0.4697155, 0, 1, 0.6392157, 1,
-0.1430523, 0.3207287, 0.2951074, 0, 1, 0.6470588, 1,
-0.1411181, -1.376874, -4.206903, 0, 1, 0.6509804, 1,
-0.1306994, -1.554559, -2.66671, 0, 1, 0.6588235, 1,
-0.1298163, 1.688626, -0.9283282, 0, 1, 0.6627451, 1,
-0.1297747, -0.905722, -3.467599, 0, 1, 0.6705883, 1,
-0.1259291, 1.059666, -0.5183636, 0, 1, 0.6745098, 1,
-0.1203142, -0.4996741, -4.03209, 0, 1, 0.682353, 1,
-0.1198684, -0.1347396, -1.379588, 0, 1, 0.6862745, 1,
-0.1184757, -0.5373515, -1.550998, 0, 1, 0.6941177, 1,
-0.1179692, -0.1116804, -2.55366, 0, 1, 0.7019608, 1,
-0.1175614, 0.2615002, -1.836295, 0, 1, 0.7058824, 1,
-0.1164145, -0.5519028, -1.579465, 0, 1, 0.7137255, 1,
-0.1121811, 0.4076957, -0.3680419, 0, 1, 0.7176471, 1,
-0.1120348, 1.143247, -0.3205343, 0, 1, 0.7254902, 1,
-0.1116229, -0.4050139, -3.357614, 0, 1, 0.7294118, 1,
-0.1108462, -0.2921363, -3.429868, 0, 1, 0.7372549, 1,
-0.1092895, 0.1129354, -1.700794, 0, 1, 0.7411765, 1,
-0.107403, -0.5370678, -3.99209, 0, 1, 0.7490196, 1,
-0.1050788, 0.673444, 2.123477, 0, 1, 0.7529412, 1,
-0.1021753, -0.04463311, -1.889191, 0, 1, 0.7607843, 1,
-0.09850109, 0.3134998, -0.3394941, 0, 1, 0.7647059, 1,
-0.0834543, -1.506969, -0.662197, 0, 1, 0.772549, 1,
-0.08158734, 0.01867133, -1.87194, 0, 1, 0.7764706, 1,
-0.08061164, 0.249892, -0.5106927, 0, 1, 0.7843137, 1,
-0.07892778, -0.2071553, -1.883102, 0, 1, 0.7882353, 1,
-0.07757039, -0.3340164, -2.610894, 0, 1, 0.7960784, 1,
-0.07471107, -0.2529297, -5.653768, 0, 1, 0.8039216, 1,
-0.07236971, 2.185134, -0.08458102, 0, 1, 0.8078431, 1,
-0.06998315, -0.492322, -3.256763, 0, 1, 0.8156863, 1,
-0.06691076, -0.7001819, -4.502584, 0, 1, 0.8196079, 1,
-0.06626217, 0.1003225, 1.212579, 0, 1, 0.827451, 1,
-0.06610207, 0.1254492, 0.5743737, 0, 1, 0.8313726, 1,
-0.06465903, -1.265284, -2.113133, 0, 1, 0.8392157, 1,
-0.06443338, 0.5249702, -1.63177, 0, 1, 0.8431373, 1,
-0.0625206, 0.2909943, -0.433915, 0, 1, 0.8509804, 1,
-0.05935542, 1.298685, -1.377307, 0, 1, 0.854902, 1,
-0.05600636, -0.2629425, -3.532894, 0, 1, 0.8627451, 1,
-0.05594801, 0.122601, -0.9762217, 0, 1, 0.8666667, 1,
-0.05463889, -1.678978, -3.140944, 0, 1, 0.8745098, 1,
-0.0532513, -0.2358866, -2.646482, 0, 1, 0.8784314, 1,
-0.05280463, -1.187246, -2.52585, 0, 1, 0.8862745, 1,
-0.05166506, 0.9366069, 0.5552521, 0, 1, 0.8901961, 1,
-0.04805991, -0.04601444, -3.088746, 0, 1, 0.8980392, 1,
-0.04777135, -1.488028, -2.258763, 0, 1, 0.9058824, 1,
-0.04774653, 0.3356823, -0.7554475, 0, 1, 0.9098039, 1,
-0.04636124, -0.9394924, -2.937901, 0, 1, 0.9176471, 1,
-0.04145989, 0.3314672, -0.9296525, 0, 1, 0.9215686, 1,
-0.03996678, 0.6454664, 1.143215, 0, 1, 0.9294118, 1,
-0.03848521, 1.576177, 0.8621019, 0, 1, 0.9333333, 1,
-0.03779824, -1.34843, -2.895866, 0, 1, 0.9411765, 1,
-0.03702695, -2.135785, -2.162714, 0, 1, 0.945098, 1,
-0.03232821, 1.168641, -0.9410064, 0, 1, 0.9529412, 1,
-0.03020751, 0.8033189, -0.9094721, 0, 1, 0.9568627, 1,
-0.02758971, 1.796915, -1.523635, 0, 1, 0.9647059, 1,
-0.02706858, 0.5713049, 0.524727, 0, 1, 0.9686275, 1,
-0.02572675, 0.8444504, 1.43835, 0, 1, 0.9764706, 1,
-0.02450051, -0.7231238, -3.1466, 0, 1, 0.9803922, 1,
-0.02015845, -0.9559554, -5.071855, 0, 1, 0.9882353, 1,
-0.01971366, -0.8073639, -2.160542, 0, 1, 0.9921569, 1,
-0.01266406, 0.9973544, -0.545103, 0, 1, 1, 1,
-0.01040092, 1.568831, 0.2043358, 0, 0.9921569, 1, 1,
-0.00923356, 0.04200631, -0.4572767, 0, 0.9882353, 1, 1,
-0.007690107, -1.771047, -2.14641, 0, 0.9803922, 1, 1,
-0.006655342, -0.7147348, -3.449211, 0, 0.9764706, 1, 1,
-0.005799422, -0.4203226, -2.47708, 0, 0.9686275, 1, 1,
-0.001441113, -1.289399, -2.973364, 0, 0.9647059, 1, 1,
-0.0002645601, 1.214456, 0.02956923, 0, 0.9568627, 1, 1,
0.0006345854, -0.3318629, 2.276203, 0, 0.9529412, 1, 1,
0.003566607, 0.08307968, 0.7043793, 0, 0.945098, 1, 1,
0.003686434, -0.7093046, 2.490594, 0, 0.9411765, 1, 1,
0.005334425, 0.2018749, 1.342024, 0, 0.9333333, 1, 1,
0.007017713, -1.921503, 3.282992, 0, 0.9294118, 1, 1,
0.01029766, 0.6203544, 0.3591021, 0, 0.9215686, 1, 1,
0.01048045, -0.7122341, 1.786422, 0, 0.9176471, 1, 1,
0.01520705, 0.864453, 0.1265841, 0, 0.9098039, 1, 1,
0.01592727, -0.6480244, 4.7817, 0, 0.9058824, 1, 1,
0.01598456, -0.156104, 3.815856, 0, 0.8980392, 1, 1,
0.01956227, -1.545594, 3.383545, 0, 0.8901961, 1, 1,
0.02513605, 0.09795308, 0.780407, 0, 0.8862745, 1, 1,
0.02745578, 0.6121057, 0.8913718, 0, 0.8784314, 1, 1,
0.03138631, -0.1878444, 1.836093, 0, 0.8745098, 1, 1,
0.03332502, -0.2842399, 2.804529, 0, 0.8666667, 1, 1,
0.034171, -0.9997157, 3.831543, 0, 0.8627451, 1, 1,
0.03584353, -1.815535, 3.634794, 0, 0.854902, 1, 1,
0.03602942, -0.7054428, 2.703511, 0, 0.8509804, 1, 1,
0.03720633, 0.7882099, 0.2617295, 0, 0.8431373, 1, 1,
0.03949111, 1.287806, -0.8314453, 0, 0.8392157, 1, 1,
0.0419455, 0.235156, 0.1963512, 0, 0.8313726, 1, 1,
0.04226914, 0.221719, 0.3410802, 0, 0.827451, 1, 1,
0.04301818, 0.322156, 0.7437376, 0, 0.8196079, 1, 1,
0.04421433, 1.570494, -1.52024, 0, 0.8156863, 1, 1,
0.04825543, 1.303122, -0.05296797, 0, 0.8078431, 1, 1,
0.05098986, -1.643118, 3.554729, 0, 0.8039216, 1, 1,
0.05817222, -0.006634794, 1.269585, 0, 0.7960784, 1, 1,
0.06134111, 0.03952441, 2.162568, 0, 0.7882353, 1, 1,
0.06373759, 0.8141239, -0.550246, 0, 0.7843137, 1, 1,
0.07297426, -1.164255, 6.001313, 0, 0.7764706, 1, 1,
0.07337994, 1.307907, 1.775299, 0, 0.772549, 1, 1,
0.0742889, -0.3689369, 0.534187, 0, 0.7647059, 1, 1,
0.07615602, 0.1870188, 0.2761574, 0, 0.7607843, 1, 1,
0.07798737, 0.04497961, 1.533721, 0, 0.7529412, 1, 1,
0.07827976, -0.739876, 4.47408, 0, 0.7490196, 1, 1,
0.0807167, -0.9690049, 1.903556, 0, 0.7411765, 1, 1,
0.08623249, -0.31067, 3.805065, 0, 0.7372549, 1, 1,
0.08904909, 0.07583199, -0.1018062, 0, 0.7294118, 1, 1,
0.09164797, -0.6446657, 3.273612, 0, 0.7254902, 1, 1,
0.09391138, 1.333565, -0.782112, 0, 0.7176471, 1, 1,
0.09450519, -1.321994, 3.140888, 0, 0.7137255, 1, 1,
0.09908026, 1.153332, 1.508215, 0, 0.7058824, 1, 1,
0.1011005, -1.127136, 2.695129, 0, 0.6980392, 1, 1,
0.10693, -0.7908818, 2.953242, 0, 0.6941177, 1, 1,
0.1071019, -0.05688873, 0.7553488, 0, 0.6862745, 1, 1,
0.1081543, 0.349536, 0.8593376, 0, 0.682353, 1, 1,
0.1128316, -0.6093773, 3.438789, 0, 0.6745098, 1, 1,
0.1204214, 0.7888087, 2.38809, 0, 0.6705883, 1, 1,
0.1218638, -1.299275, 3.999509, 0, 0.6627451, 1, 1,
0.1224382, 0.5179616, -0.5456815, 0, 0.6588235, 1, 1,
0.1239351, -2.297221, 1.483394, 0, 0.6509804, 1, 1,
0.1245401, -1.491293, 2.529432, 0, 0.6470588, 1, 1,
0.1250287, -0.5319679, 2.859631, 0, 0.6392157, 1, 1,
0.1255191, 0.9002422, 0.6159164, 0, 0.6352941, 1, 1,
0.1284757, 0.8003713, 1.209936, 0, 0.627451, 1, 1,
0.130405, -1.56524, 3.370751, 0, 0.6235294, 1, 1,
0.1311578, -1.446732, 5.57789, 0, 0.6156863, 1, 1,
0.133074, -1.114616, 3.092394, 0, 0.6117647, 1, 1,
0.1333535, 1.622038, 0.2417974, 0, 0.6039216, 1, 1,
0.1338744, -1.043, 2.637703, 0, 0.5960785, 1, 1,
0.1374962, 0.763549, -0.6556227, 0, 0.5921569, 1, 1,
0.1395594, -0.284723, 2.419956, 0, 0.5843138, 1, 1,
0.1424531, 0.04781175, 1.947494, 0, 0.5803922, 1, 1,
0.1440558, -1.173528, 3.436749, 0, 0.572549, 1, 1,
0.1446219, -0.9814566, 4.347702, 0, 0.5686275, 1, 1,
0.1524622, -1.047473, 2.093565, 0, 0.5607843, 1, 1,
0.1558894, 0.1234336, 1.279545, 0, 0.5568628, 1, 1,
0.1726597, -0.05517984, 1.102708, 0, 0.5490196, 1, 1,
0.1771714, 0.04796233, 1.369125, 0, 0.5450981, 1, 1,
0.1792514, 1.207161, 1.032724, 0, 0.5372549, 1, 1,
0.1804313, -2.410465, 2.194957, 0, 0.5333334, 1, 1,
0.1806971, 1.503591, 0.783953, 0, 0.5254902, 1, 1,
0.1900245, 0.5746149, -1.102298, 0, 0.5215687, 1, 1,
0.1911254, -1.462279, 4.223984, 0, 0.5137255, 1, 1,
0.1928399, 0.1866804, 0.8553194, 0, 0.509804, 1, 1,
0.2006968, -1.268448, 2.82645, 0, 0.5019608, 1, 1,
0.2024127, -0.154462, 2.622392, 0, 0.4941176, 1, 1,
0.2027563, -0.273432, 3.564468, 0, 0.4901961, 1, 1,
0.2043074, -0.3570253, 1.677763, 0, 0.4823529, 1, 1,
0.2081116, -0.5703836, 3.398271, 0, 0.4784314, 1, 1,
0.2094055, -0.4902086, 2.882936, 0, 0.4705882, 1, 1,
0.2143798, 0.3989747, -0.6932282, 0, 0.4666667, 1, 1,
0.2149878, 2.494601, 0.6690463, 0, 0.4588235, 1, 1,
0.2154086, -0.3874072, 2.617203, 0, 0.454902, 1, 1,
0.2156517, 0.8559319, -0.8381801, 0, 0.4470588, 1, 1,
0.2159712, 0.5310351, -0.3714383, 0, 0.4431373, 1, 1,
0.2189479, 0.5191107, -1.02841, 0, 0.4352941, 1, 1,
0.2194578, 0.3513091, 0.7839844, 0, 0.4313726, 1, 1,
0.2211598, 1.954368, 1.899348, 0, 0.4235294, 1, 1,
0.2234881, -0.6186337, 4.060641, 0, 0.4196078, 1, 1,
0.2254901, -1.41669, 3.034467, 0, 0.4117647, 1, 1,
0.2272317, 1.072237, 2.073864, 0, 0.4078431, 1, 1,
0.2274781, -0.2091946, 3.41891, 0, 0.4, 1, 1,
0.2300153, -0.329178, 1.886412, 0, 0.3921569, 1, 1,
0.2334422, -0.4178528, 1.915035, 0, 0.3882353, 1, 1,
0.233918, 0.4218951, -0.1963856, 0, 0.3803922, 1, 1,
0.2341442, 1.354288, -0.4594864, 0, 0.3764706, 1, 1,
0.2356721, -0.4570611, 3.6392, 0, 0.3686275, 1, 1,
0.2374269, -0.66288, 1.71282, 0, 0.3647059, 1, 1,
0.2377654, 1.374219, -1.203596, 0, 0.3568628, 1, 1,
0.2411312, -3.099145, 3.981555, 0, 0.3529412, 1, 1,
0.2456782, -0.02547075, 0.7338888, 0, 0.345098, 1, 1,
0.2496932, -0.5088697, 3.008397, 0, 0.3411765, 1, 1,
0.2500361, 1.133082, -1.693828, 0, 0.3333333, 1, 1,
0.251901, 0.4034081, 0.6957641, 0, 0.3294118, 1, 1,
0.2528756, -0.03912727, 0.1126467, 0, 0.3215686, 1, 1,
0.2658817, 0.715655, 0.3818947, 0, 0.3176471, 1, 1,
0.2686424, 0.9720399, -1.035925, 0, 0.3098039, 1, 1,
0.2763828, 1.460545, -0.1954201, 0, 0.3058824, 1, 1,
0.2797621, 0.979874, -0.3646638, 0, 0.2980392, 1, 1,
0.2822452, 0.3922797, 0.3118109, 0, 0.2901961, 1, 1,
0.2834055, -0.3083089, 5.041728, 0, 0.2862745, 1, 1,
0.2838714, -2.335278, 2.458604, 0, 0.2784314, 1, 1,
0.283986, -0.3079724, 4.010684, 0, 0.2745098, 1, 1,
0.2862859, 0.1903832, 3.515396, 0, 0.2666667, 1, 1,
0.2879909, -0.3193837, 3.007804, 0, 0.2627451, 1, 1,
0.2993102, -0.1351338, 2.818122, 0, 0.254902, 1, 1,
0.3038372, 1.664027, 0.3703516, 0, 0.2509804, 1, 1,
0.3056953, 0.4548008, 0.5030857, 0, 0.2431373, 1, 1,
0.3059853, 0.7922066, 1.690079, 0, 0.2392157, 1, 1,
0.3075094, -1.714647, 1.742495, 0, 0.2313726, 1, 1,
0.3088023, 0.1710756, 1.640166, 0, 0.227451, 1, 1,
0.3102611, -0.5870602, 0.5616269, 0, 0.2196078, 1, 1,
0.3128387, 2.03596, 0.6530315, 0, 0.2156863, 1, 1,
0.3220683, 0.2937819, -0.1168509, 0, 0.2078431, 1, 1,
0.3222328, -0.2260264, 2.963371, 0, 0.2039216, 1, 1,
0.3232512, -1.042058, 4.668623, 0, 0.1960784, 1, 1,
0.3259687, 1.288315, -0.9009975, 0, 0.1882353, 1, 1,
0.3319084, 0.3405404, 0.6238999, 0, 0.1843137, 1, 1,
0.3338186, 0.1483493, 0.8316694, 0, 0.1764706, 1, 1,
0.3343396, 0.5354091, 0.9646807, 0, 0.172549, 1, 1,
0.3459661, 0.7177609, -0.181776, 0, 0.1647059, 1, 1,
0.353949, 0.09088718, 3.61065, 0, 0.1607843, 1, 1,
0.3571408, -0.7069001, 3.875468, 0, 0.1529412, 1, 1,
0.3593669, -0.09258388, 1.743824, 0, 0.1490196, 1, 1,
0.3629649, 1.634511, -0.7426092, 0, 0.1411765, 1, 1,
0.3662042, -0.1855145, 1.892729, 0, 0.1372549, 1, 1,
0.3685525, -1.484866, 1.098353, 0, 0.1294118, 1, 1,
0.3688847, 0.605909, 1.434364, 0, 0.1254902, 1, 1,
0.3752179, 0.09446292, 1.049761, 0, 0.1176471, 1, 1,
0.3789962, 0.3561183, 1.081823, 0, 0.1137255, 1, 1,
0.3803065, -0.502026, 2.407661, 0, 0.1058824, 1, 1,
0.3846256, 2.011567, -0.0366367, 0, 0.09803922, 1, 1,
0.3848483, -0.2472126, 2.539417, 0, 0.09411765, 1, 1,
0.3861377, 0.5517991, 0.7873771, 0, 0.08627451, 1, 1,
0.3915863, -1.864705, 2.327795, 0, 0.08235294, 1, 1,
0.3919649, -2.126615, 3.074418, 0, 0.07450981, 1, 1,
0.3946607, 1.118576, 0.6315463, 0, 0.07058824, 1, 1,
0.3966002, 0.7931139, -0.1128822, 0, 0.0627451, 1, 1,
0.3982908, -1.912825, 3.82657, 0, 0.05882353, 1, 1,
0.4015637, 0.3015617, 0.805382, 0, 0.05098039, 1, 1,
0.4025185, 0.2972226, 1.523255, 0, 0.04705882, 1, 1,
0.4046873, -0.7801536, 2.316478, 0, 0.03921569, 1, 1,
0.4050571, 0.9711509, -0.6763936, 0, 0.03529412, 1, 1,
0.4080347, -0.7995028, 1.903847, 0, 0.02745098, 1, 1,
0.408059, -0.3598717, 3.300263, 0, 0.02352941, 1, 1,
0.4130825, -0.1704199, 3.975156, 0, 0.01568628, 1, 1,
0.4146543, 0.145691, 2.023508, 0, 0.01176471, 1, 1,
0.4169754, -1.11286, 3.497278, 0, 0.003921569, 1, 1,
0.4178099, -1.499419, 2.703437, 0.003921569, 0, 1, 1,
0.4192387, 0.1290095, 1.26599, 0.007843138, 0, 1, 1,
0.4200481, 0.102998, 1.583221, 0.01568628, 0, 1, 1,
0.4205307, -1.891302, 1.265298, 0.01960784, 0, 1, 1,
0.4240496, -1.891482, 0.7174371, 0.02745098, 0, 1, 1,
0.4285506, 2.689783, -1.574436, 0.03137255, 0, 1, 1,
0.4286734, 0.2993434, -0.5252137, 0.03921569, 0, 1, 1,
0.4306043, 0.6887136, 0.3716454, 0.04313726, 0, 1, 1,
0.4346741, 0.2955635, 1.220043, 0.05098039, 0, 1, 1,
0.4349082, -0.1776965, 1.127499, 0.05490196, 0, 1, 1,
0.4383187, -0.9955779, 2.844462, 0.0627451, 0, 1, 1,
0.4402069, -1.250185, 1.536447, 0.06666667, 0, 1, 1,
0.4462223, 1.255522, -0.4237076, 0.07450981, 0, 1, 1,
0.4472479, 0.8642237, -0.8547206, 0.07843138, 0, 1, 1,
0.44927, -0.377317, 2.620648, 0.08627451, 0, 1, 1,
0.4499005, -0.6003258, 4.116652, 0.09019608, 0, 1, 1,
0.4500122, 2.057617, -1.507411, 0.09803922, 0, 1, 1,
0.4562354, 1.65959, 0.1720662, 0.1058824, 0, 1, 1,
0.4564831, 1.320848, -0.2475846, 0.1098039, 0, 1, 1,
0.457299, 0.1950972, 0.665878, 0.1176471, 0, 1, 1,
0.4613182, 1.240766, -0.3362114, 0.1215686, 0, 1, 1,
0.4631377, 0.1377281, 1.057522, 0.1294118, 0, 1, 1,
0.4644976, -0.02630896, 2.190306, 0.1333333, 0, 1, 1,
0.4648275, 0.002719707, 0.6290301, 0.1411765, 0, 1, 1,
0.4648468, 0.8670827, -0.7265952, 0.145098, 0, 1, 1,
0.4656825, 0.0150567, 1.386292, 0.1529412, 0, 1, 1,
0.4673619, 1.111347, -0.1793147, 0.1568628, 0, 1, 1,
0.4715818, 0.6469161, 0.3247341, 0.1647059, 0, 1, 1,
0.4721887, -1.298047, 3.438408, 0.1686275, 0, 1, 1,
0.473392, -1.171089, 3.285359, 0.1764706, 0, 1, 1,
0.4741057, 0.4876516, 1.659076, 0.1803922, 0, 1, 1,
0.4795108, -3.120183, 2.395192, 0.1882353, 0, 1, 1,
0.4795846, -2.997581, 1.741274, 0.1921569, 0, 1, 1,
0.4807144, 0.01165092, 0.4297339, 0.2, 0, 1, 1,
0.4846832, 0.3476985, 1.003874, 0.2078431, 0, 1, 1,
0.4928591, 0.1025114, 2.318319, 0.2117647, 0, 1, 1,
0.4942711, -0.8458316, 2.883129, 0.2196078, 0, 1, 1,
0.4983863, -0.08136062, 2.067128, 0.2235294, 0, 1, 1,
0.4998197, 1.611662, -2.451305, 0.2313726, 0, 1, 1,
0.5051671, 0.5454589, 0.8113902, 0.2352941, 0, 1, 1,
0.5091014, 0.2130492, 1.498196, 0.2431373, 0, 1, 1,
0.509186, 0.6445569, 1.789734, 0.2470588, 0, 1, 1,
0.5098759, -1.248202, 3.374348, 0.254902, 0, 1, 1,
0.5148872, -0.1162389, 0.1198381, 0.2588235, 0, 1, 1,
0.5168191, -0.172216, 3.342051, 0.2666667, 0, 1, 1,
0.5185535, 1.354633, -0.4959822, 0.2705882, 0, 1, 1,
0.521006, -1.111843, 1.678471, 0.2784314, 0, 1, 1,
0.5310572, -0.1001932, 0.6778637, 0.282353, 0, 1, 1,
0.5320759, 1.199506, -0.7684559, 0.2901961, 0, 1, 1,
0.5321286, -1.404687, 2.425494, 0.2941177, 0, 1, 1,
0.5329106, -0.3724769, 2.156232, 0.3019608, 0, 1, 1,
0.5352812, -0.7467479, 3.262859, 0.3098039, 0, 1, 1,
0.5354711, -1.598303, 1.974992, 0.3137255, 0, 1, 1,
0.5360719, 1.224327, -0.9307879, 0.3215686, 0, 1, 1,
0.5369878, -1.929856, 2.33996, 0.3254902, 0, 1, 1,
0.5390853, 0.702707, -0.06821068, 0.3333333, 0, 1, 1,
0.5398488, 0.2214257, -0.2728848, 0.3372549, 0, 1, 1,
0.5418421, -0.1822899, -0.2804738, 0.345098, 0, 1, 1,
0.5426722, 0.8626099, 1.385077, 0.3490196, 0, 1, 1,
0.5457933, -0.7793986, 2.27504, 0.3568628, 0, 1, 1,
0.5471885, -0.2851757, 1.528088, 0.3607843, 0, 1, 1,
0.5489176, 1.738144, 1.793766, 0.3686275, 0, 1, 1,
0.5543727, 0.1749906, 1.96434, 0.372549, 0, 1, 1,
0.5582829, -1.013809, 4.484473, 0.3803922, 0, 1, 1,
0.5617145, 1.554777, -0.1506755, 0.3843137, 0, 1, 1,
0.5621241, -1.294355, 1.92479, 0.3921569, 0, 1, 1,
0.5671635, -0.2340721, 2.962977, 0.3960784, 0, 1, 1,
0.5716236, 0.5282982, 1.994706, 0.4039216, 0, 1, 1,
0.578328, -0.9040656, 1.192169, 0.4117647, 0, 1, 1,
0.5826586, 0.6432315, 1.424212, 0.4156863, 0, 1, 1,
0.5831414, -0.05451, 0.2967775, 0.4235294, 0, 1, 1,
0.5864506, 0.2486679, 1.480208, 0.427451, 0, 1, 1,
0.5901868, 0.9246925, 3.070583, 0.4352941, 0, 1, 1,
0.5917225, 0.04262664, 2.414491, 0.4392157, 0, 1, 1,
0.5927637, -0.4262282, 3.812989, 0.4470588, 0, 1, 1,
0.593636, -0.4437308, 1.369549, 0.4509804, 0, 1, 1,
0.5963596, -0.7478398, 2.335031, 0.4588235, 0, 1, 1,
0.5964422, -0.7874463, 4.253963, 0.4627451, 0, 1, 1,
0.596544, -0.1194151, 1.010065, 0.4705882, 0, 1, 1,
0.6018729, -0.9004764, 2.704567, 0.4745098, 0, 1, 1,
0.6033657, -2.27282, 2.553143, 0.4823529, 0, 1, 1,
0.6038221, -1.372884, 3.952209, 0.4862745, 0, 1, 1,
0.6041664, 0.562704, 1.542041, 0.4941176, 0, 1, 1,
0.6097234, 0.4347918, 1.92864, 0.5019608, 0, 1, 1,
0.6118739, 1.511126, -0.2297623, 0.5058824, 0, 1, 1,
0.6137228, 1.064877, 0.3527762, 0.5137255, 0, 1, 1,
0.6158118, 1.537305, 0.9211894, 0.5176471, 0, 1, 1,
0.6182774, -0.2329908, 2.94015, 0.5254902, 0, 1, 1,
0.6237796, -1.269853, 2.928707, 0.5294118, 0, 1, 1,
0.6243839, -0.6155787, 2.455901, 0.5372549, 0, 1, 1,
0.627286, 1.727368, -0.1196566, 0.5411765, 0, 1, 1,
0.628361, -1.158668, 2.815914, 0.5490196, 0, 1, 1,
0.6287427, -0.7039997, 3.08335, 0.5529412, 0, 1, 1,
0.6299503, 0.09906515, 1.565001, 0.5607843, 0, 1, 1,
0.6312752, -2.144047, 2.311181, 0.5647059, 0, 1, 1,
0.6332455, -1.224162, 2.131516, 0.572549, 0, 1, 1,
0.6340318, -0.3264841, 2.259207, 0.5764706, 0, 1, 1,
0.638165, 1.74283, -0.6539335, 0.5843138, 0, 1, 1,
0.6384022, -1.788403, 3.957065, 0.5882353, 0, 1, 1,
0.6410103, -1.534592, 4.582384, 0.5960785, 0, 1, 1,
0.6505912, -0.3148066, 2.05203, 0.6039216, 0, 1, 1,
0.6522241, 0.6303339, 0.5694578, 0.6078432, 0, 1, 1,
0.653242, -0.5138046, 3.25716, 0.6156863, 0, 1, 1,
0.6580001, -0.2854364, 1.10959, 0.6196079, 0, 1, 1,
0.6587539, 0.1419993, 0.4992086, 0.627451, 0, 1, 1,
0.6659694, -0.5581899, 2.988522, 0.6313726, 0, 1, 1,
0.6674023, -0.7151574, 0.9855435, 0.6392157, 0, 1, 1,
0.6684558, -0.4930834, 4.005243, 0.6431373, 0, 1, 1,
0.6696348, 0.2841332, 2.488719, 0.6509804, 0, 1, 1,
0.6728044, 0.9538403, 1.104083, 0.654902, 0, 1, 1,
0.6763036, 2.337803, 1.116596, 0.6627451, 0, 1, 1,
0.6770439, -0.3546323, 0.5269696, 0.6666667, 0, 1, 1,
0.680429, -0.1231044, 3.674037, 0.6745098, 0, 1, 1,
0.6829209, 0.6567946, 3.55699, 0.6784314, 0, 1, 1,
0.6834143, 0.1274161, 3.120041, 0.6862745, 0, 1, 1,
0.6908694, -1.569557, 2.491328, 0.6901961, 0, 1, 1,
0.6957659, -1.301051, 2.748636, 0.6980392, 0, 1, 1,
0.6968331, 0.09899528, 2.439253, 0.7058824, 0, 1, 1,
0.7081833, 0.1539723, 1.645506, 0.7098039, 0, 1, 1,
0.7092938, 1.288092, 1.360894, 0.7176471, 0, 1, 1,
0.7119243, 0.2686011, 1.41303, 0.7215686, 0, 1, 1,
0.7134631, -0.9549494, 5.375537, 0.7294118, 0, 1, 1,
0.71484, -0.5847594, 2.641016, 0.7333333, 0, 1, 1,
0.7196286, 0.8764921, 1.775229, 0.7411765, 0, 1, 1,
0.7198559, 1.773676, -0.3399758, 0.7450981, 0, 1, 1,
0.723843, -0.2955902, 3.190705, 0.7529412, 0, 1, 1,
0.725793, 0.9129479, 0.1220227, 0.7568628, 0, 1, 1,
0.7280232, 0.3603958, 3.426633, 0.7647059, 0, 1, 1,
0.7283592, 1.57329, 0.1224105, 0.7686275, 0, 1, 1,
0.7442477, -0.1863903, 3.049809, 0.7764706, 0, 1, 1,
0.7473039, 0.200768, 0.5147123, 0.7803922, 0, 1, 1,
0.748471, -0.4703773, 0.8666631, 0.7882353, 0, 1, 1,
0.7594393, -1.216023, 2.8862, 0.7921569, 0, 1, 1,
0.7597191, -0.236734, 0.3783592, 0.8, 0, 1, 1,
0.7606701, 0.0359838, 2.21926, 0.8078431, 0, 1, 1,
0.774895, -1.303373, 3.084608, 0.8117647, 0, 1, 1,
0.7755206, 1.132768, 1.06555, 0.8196079, 0, 1, 1,
0.7770124, -1.662738, 1.412429, 0.8235294, 0, 1, 1,
0.7772384, 0.8997934, 2.164753, 0.8313726, 0, 1, 1,
0.7836679, -0.1845906, 0.611852, 0.8352941, 0, 1, 1,
0.7870792, 1.301947, 0.8254969, 0.8431373, 0, 1, 1,
0.7900748, -0.1454833, -0.1245297, 0.8470588, 0, 1, 1,
0.7921295, -0.4626598, 3.793577, 0.854902, 0, 1, 1,
0.7946655, 0.9974912, 0.6209031, 0.8588235, 0, 1, 1,
0.8039172, 0.09981768, -0.873128, 0.8666667, 0, 1, 1,
0.8050395, -1.205439, 1.98397, 0.8705882, 0, 1, 1,
0.8064653, 0.327952, 1.938933, 0.8784314, 0, 1, 1,
0.8114915, 0.148434, 1.86886, 0.8823529, 0, 1, 1,
0.8148618, -0.7904694, 2.322854, 0.8901961, 0, 1, 1,
0.8154947, 0.9545085, 0.687811, 0.8941177, 0, 1, 1,
0.8172449, -0.2370092, 3.04832, 0.9019608, 0, 1, 1,
0.8172801, 0.3351694, 0.3034771, 0.9098039, 0, 1, 1,
0.8188488, -0.4374002, 2.545579, 0.9137255, 0, 1, 1,
0.8235602, 1.015824, -0.2586302, 0.9215686, 0, 1, 1,
0.8252487, 0.009504694, 1.111338, 0.9254902, 0, 1, 1,
0.8298002, -1.17316, 3.121744, 0.9333333, 0, 1, 1,
0.8326658, -0.7445691, 1.898398, 0.9372549, 0, 1, 1,
0.8347657, -0.3027852, 1.952992, 0.945098, 0, 1, 1,
0.8374156, -0.05560724, 1.186951, 0.9490196, 0, 1, 1,
0.8386134, 0.3189867, -0.5043235, 0.9568627, 0, 1, 1,
0.8446939, 0.1330108, 0.7664782, 0.9607843, 0, 1, 1,
0.8472829, 1.391558, 0.3835419, 0.9686275, 0, 1, 1,
0.8502936, 0.2224521, -0.1572368, 0.972549, 0, 1, 1,
0.8507941, -0.2508455, 1.989679, 0.9803922, 0, 1, 1,
0.8545392, -0.6354652, 3.347371, 0.9843137, 0, 1, 1,
0.8570716, 0.1031631, 1.611729, 0.9921569, 0, 1, 1,
0.8589731, 0.9436321, -0.7564478, 0.9960784, 0, 1, 1,
0.8628798, -0.8902467, 1.549724, 1, 0, 0.9960784, 1,
0.8684101, 0.6131205, -0.2026398, 1, 0, 0.9882353, 1,
0.869081, -1.543864, 2.3408, 1, 0, 0.9843137, 1,
0.8730017, 0.3173463, 1.887012, 1, 0, 0.9764706, 1,
0.873205, 0.8623821, 1.227346, 1, 0, 0.972549, 1,
0.8740952, -0.186017, 2.011205, 1, 0, 0.9647059, 1,
0.8780889, 0.9573669, 1.772102, 1, 0, 0.9607843, 1,
0.8859035, 0.9475967, 0.327167, 1, 0, 0.9529412, 1,
0.8973354, 0.462971, 1.828217, 1, 0, 0.9490196, 1,
0.89974, -0.8122802, 2.083459, 1, 0, 0.9411765, 1,
0.9036079, -0.8067597, 2.905576, 1, 0, 0.9372549, 1,
0.9055321, -0.8848555, 3.908087, 1, 0, 0.9294118, 1,
0.9142274, 1.526437, -0.4467175, 1, 0, 0.9254902, 1,
0.9153637, 1.368389, -0.1231546, 1, 0, 0.9176471, 1,
0.9176098, -0.5115267, 1.886606, 1, 0, 0.9137255, 1,
0.9281799, -2.068464, 1.548465, 1, 0, 0.9058824, 1,
0.9347361, -0.5839988, 2.945439, 1, 0, 0.9019608, 1,
0.9354138, -0.7293884, 2.361711, 1, 0, 0.8941177, 1,
0.9408222, 0.4920972, 3.628928, 1, 0, 0.8862745, 1,
0.9425305, -1.337583, 4.986006, 1, 0, 0.8823529, 1,
0.9476855, 1.359314, 0.8671044, 1, 0, 0.8745098, 1,
0.9558799, 0.67995, 0.678034, 1, 0, 0.8705882, 1,
0.9564088, -0.2112993, 1.633931, 1, 0, 0.8627451, 1,
0.9640276, 0.3640744, 1.533364, 1, 0, 0.8588235, 1,
0.9667996, -1.325211, 1.538817, 1, 0, 0.8509804, 1,
0.9740269, -0.8688306, 3.707323, 1, 0, 0.8470588, 1,
0.9778717, 1.666565, 1.179402, 1, 0, 0.8392157, 1,
0.9798238, 0.5522084, -0.3092048, 1, 0, 0.8352941, 1,
0.9819373, 0.04300162, 0.7727947, 1, 0, 0.827451, 1,
0.9887523, 0.3777249, 2.151356, 1, 0, 0.8235294, 1,
0.9987599, 0.3982449, 1.506495, 1, 0, 0.8156863, 1,
0.9991816, 0.2977295, 1.202341, 1, 0, 0.8117647, 1,
1.003208, 0.4544868, 1.315052, 1, 0, 0.8039216, 1,
1.008722, -0.2591482, 1.033125, 1, 0, 0.7960784, 1,
1.009109, -0.8616486, 4.196208, 1, 0, 0.7921569, 1,
1.018001, -0.8332032, 2.762086, 1, 0, 0.7843137, 1,
1.019479, -0.3544092, 3.866621, 1, 0, 0.7803922, 1,
1.021439, -0.5275632, 1.093966, 1, 0, 0.772549, 1,
1.025108, 0.3137521, 2.004694, 1, 0, 0.7686275, 1,
1.027834, 1.629092, 3.243232, 1, 0, 0.7607843, 1,
1.027975, -0.4844421, 2.009068, 1, 0, 0.7568628, 1,
1.030842, -0.6702976, 1.501947, 1, 0, 0.7490196, 1,
1.03171, -0.6297643, 2.234109, 1, 0, 0.7450981, 1,
1.032802, -0.5930112, 1.297058, 1, 0, 0.7372549, 1,
1.042471, 0.9948611, 0.02878826, 1, 0, 0.7333333, 1,
1.048334, -0.6720467, 1.70458, 1, 0, 0.7254902, 1,
1.052271, -2.001574, 3.052678, 1, 0, 0.7215686, 1,
1.052962, 0.7563651, 0.7688961, 1, 0, 0.7137255, 1,
1.054513, 0.8005667, 1.704465, 1, 0, 0.7098039, 1,
1.064319, -0.1052757, 3.785635, 1, 0, 0.7019608, 1,
1.064475, 1.105075, 0.04139214, 1, 0, 0.6941177, 1,
1.070597, -1.438833, 2.666166, 1, 0, 0.6901961, 1,
1.08076, -1.176511, 2.539158, 1, 0, 0.682353, 1,
1.08258, -0.2661602, 1.657332, 1, 0, 0.6784314, 1,
1.086596, -1.783935, 1.420369, 1, 0, 0.6705883, 1,
1.094215, -0.4942705, 2.1275, 1, 0, 0.6666667, 1,
1.09436, -1.035204, 1.488618, 1, 0, 0.6588235, 1,
1.097883, 0.02328937, 4.183329, 1, 0, 0.654902, 1,
1.10206, -2.264284, 2.847388, 1, 0, 0.6470588, 1,
1.104319, -1.778227, 2.914497, 1, 0, 0.6431373, 1,
1.108139, -0.2891051, 3.449839, 1, 0, 0.6352941, 1,
1.126191, 0.3481205, 1.939063, 1, 0, 0.6313726, 1,
1.136189, -0.1966235, 2.613537, 1, 0, 0.6235294, 1,
1.138155, -0.1805191, 3.563048, 1, 0, 0.6196079, 1,
1.147452, 0.550049, 1.41884, 1, 0, 0.6117647, 1,
1.147954, 1.200175, 1.757684, 1, 0, 0.6078432, 1,
1.151404, 0.2683245, 0.4994292, 1, 0, 0.6, 1,
1.156522, 0.5431862, 0.1010126, 1, 0, 0.5921569, 1,
1.158239, 0.3604357, 0.2412262, 1, 0, 0.5882353, 1,
1.164355, -0.6266074, 0.8068928, 1, 0, 0.5803922, 1,
1.175215, 0.786046, 0.5017028, 1, 0, 0.5764706, 1,
1.185679, -0.5305974, 2.707074, 1, 0, 0.5686275, 1,
1.187034, -1.334891, 1.285946, 1, 0, 0.5647059, 1,
1.195612, 0.8446701, 0.1284381, 1, 0, 0.5568628, 1,
1.225295, 0.1468222, 0.9901343, 1, 0, 0.5529412, 1,
1.226919, 1.358351, -0.09147133, 1, 0, 0.5450981, 1,
1.230035, 0.4393741, 1.508628, 1, 0, 0.5411765, 1,
1.230064, 0.7468557, 0.92918, 1, 0, 0.5333334, 1,
1.231266, -2.090967, 2.637045, 1, 0, 0.5294118, 1,
1.23522, 0.06112844, 2.402848, 1, 0, 0.5215687, 1,
1.240396, -0.2185112, 2.580784, 1, 0, 0.5176471, 1,
1.244233, -1.216397, 2.892385, 1, 0, 0.509804, 1,
1.247122, 0.18319, 1.809863, 1, 0, 0.5058824, 1,
1.24839, 1.962847, 0.05404188, 1, 0, 0.4980392, 1,
1.261829, 2.845826, 0.3486298, 1, 0, 0.4901961, 1,
1.26964, 2.039112, 1.185309, 1, 0, 0.4862745, 1,
1.278211, 1.480876, 1.081348, 1, 0, 0.4784314, 1,
1.286374, -0.5388035, 3.145379, 1, 0, 0.4745098, 1,
1.289694, -0.6828957, 3.816901, 1, 0, 0.4666667, 1,
1.292537, -0.8006202, 2.618163, 1, 0, 0.4627451, 1,
1.292769, -0.4022802, 3.563839, 1, 0, 0.454902, 1,
1.302557, 0.734016, 1.909504, 1, 0, 0.4509804, 1,
1.307642, -0.08095896, 0.3153329, 1, 0, 0.4431373, 1,
1.314722, 2.643153, 0.5464349, 1, 0, 0.4392157, 1,
1.318275, 2.653004, -0.9006593, 1, 0, 0.4313726, 1,
1.334844, 0.5851755, 2.74375, 1, 0, 0.427451, 1,
1.34069, 1.289532, 0.07967639, 1, 0, 0.4196078, 1,
1.343818, -1.247191, 2.58239, 1, 0, 0.4156863, 1,
1.344095, -1.350246, 0.2137566, 1, 0, 0.4078431, 1,
1.346222, 0.8644446, 0.5745986, 1, 0, 0.4039216, 1,
1.346361, 0.9363709, 0.8183473, 1, 0, 0.3960784, 1,
1.359694, 0.1374312, 0.8938114, 1, 0, 0.3882353, 1,
1.376397, 0.6855031, 2.191502, 1, 0, 0.3843137, 1,
1.387159, -0.6061481, 1.851655, 1, 0, 0.3764706, 1,
1.402399, -1.109676, 3.039121, 1, 0, 0.372549, 1,
1.402745, -0.1742105, 2.898981, 1, 0, 0.3647059, 1,
1.411536, 0.2417872, 0.5001608, 1, 0, 0.3607843, 1,
1.41388, -0.7539619, 2.452854, 1, 0, 0.3529412, 1,
1.424707, -0.4338752, 2.312718, 1, 0, 0.3490196, 1,
1.433169, -1.10821, 1.49471, 1, 0, 0.3411765, 1,
1.438036, 0.6645718, 1.926241, 1, 0, 0.3372549, 1,
1.455059, -0.8377959, 3.250318, 1, 0, 0.3294118, 1,
1.473459, -0.4889974, 1.471827, 1, 0, 0.3254902, 1,
1.499115, 0.5209267, 0.963661, 1, 0, 0.3176471, 1,
1.5023, 1.937648, 0.5285017, 1, 0, 0.3137255, 1,
1.513222, -0.2755083, 1.147454, 1, 0, 0.3058824, 1,
1.515976, 0.5840386, 0.9105443, 1, 0, 0.2980392, 1,
1.530568, 1.122662, 1.818557, 1, 0, 0.2941177, 1,
1.561725, 0.5770586, 2.145251, 1, 0, 0.2862745, 1,
1.564895, 0.3790439, 0.1197954, 1, 0, 0.282353, 1,
1.576079, -1.557919, 3.791808, 1, 0, 0.2745098, 1,
1.583634, 0.4966825, 2.713806, 1, 0, 0.2705882, 1,
1.602506, 0.2991698, 0.5909472, 1, 0, 0.2627451, 1,
1.608008, 0.8177417, 1.004006, 1, 0, 0.2588235, 1,
1.62196, -2.211211, 2.401252, 1, 0, 0.2509804, 1,
1.645769, 0.9105355, 3.507758, 1, 0, 0.2470588, 1,
1.679877, -0.5536923, 1.724037, 1, 0, 0.2392157, 1,
1.684355, -0.2896779, 1.971316, 1, 0, 0.2352941, 1,
1.692441, -0.4008081, -0.05203293, 1, 0, 0.227451, 1,
1.696687, 0.769947, 2.183424, 1, 0, 0.2235294, 1,
1.702528, 0.1134483, 2.907772, 1, 0, 0.2156863, 1,
1.769239, 1.073365, 0.1147266, 1, 0, 0.2117647, 1,
1.773422, -0.1860475, 1.739807, 1, 0, 0.2039216, 1,
1.774294, -1.853125, 2.802426, 1, 0, 0.1960784, 1,
1.777895, -0.5592791, 2.213968, 1, 0, 0.1921569, 1,
1.802917, 0.1214719, 1.598069, 1, 0, 0.1843137, 1,
1.817724, 0.8508519, 1.975016, 1, 0, 0.1803922, 1,
1.840156, -0.1442823, -0.1023794, 1, 0, 0.172549, 1,
1.84548, 0.772545, -0.4645021, 1, 0, 0.1686275, 1,
1.869441, -0.5146499, 1.877305, 1, 0, 0.1607843, 1,
1.869817, 0.2363256, 1.89902, 1, 0, 0.1568628, 1,
1.901997, 1.144049, 0.8942479, 1, 0, 0.1490196, 1,
1.943323, -1.424066, 0.933313, 1, 0, 0.145098, 1,
1.967324, -0.06540725, 3.850402, 1, 0, 0.1372549, 1,
1.969716, 0.7369375, 3.278027, 1, 0, 0.1333333, 1,
1.976525, -0.5460945, 1.22346, 1, 0, 0.1254902, 1,
1.980536, -0.201819, 1.492516, 1, 0, 0.1215686, 1,
2.005851, 0.2921829, 0.7165028, 1, 0, 0.1137255, 1,
2.018235, 0.7212184, 0.6049721, 1, 0, 0.1098039, 1,
2.028218, -0.6072091, 3.39978, 1, 0, 0.1019608, 1,
2.042261, -1.133897, 1.499217, 1, 0, 0.09411765, 1,
2.109925, -2.378118, 0.5765325, 1, 0, 0.09019608, 1,
2.11523, -0.2621385, 2.931216, 1, 0, 0.08235294, 1,
2.148236, 0.4734462, 2.351916, 1, 0, 0.07843138, 1,
2.155462, 1.615267, 1.659971, 1, 0, 0.07058824, 1,
2.175738, 0.2776101, 1.767885, 1, 0, 0.06666667, 1,
2.195295, 0.005276703, 0.5845455, 1, 0, 0.05882353, 1,
2.244736, 0.08668194, 1.208896, 1, 0, 0.05490196, 1,
2.266058, -0.9268227, 2.175148, 1, 0, 0.04705882, 1,
2.28272, -1.398065, 2.520455, 1, 0, 0.04313726, 1,
2.29657, -1.304136, 2.010847, 1, 0, 0.03529412, 1,
2.338894, -0.1223959, 2.053414, 1, 0, 0.03137255, 1,
2.371488, -0.5628803, 0.6448352, 1, 0, 0.02352941, 1,
2.437894, -0.8447899, 1.240341, 1, 0, 0.01960784, 1,
2.6125, -0.4620411, 1.054137, 1, 0, 0.01176471, 1,
2.637893, -1.097952, 1.453182, 1, 0, 0.007843138, 1
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
-0.3241882, -4.17797, -7.629304, 0, -0.5, 0.5, 0.5,
-0.3241882, -4.17797, -7.629304, 1, -0.5, 0.5, 0.5,
-0.3241882, -4.17797, -7.629304, 1, 1.5, 0.5, 0.5,
-0.3241882, -4.17797, -7.629304, 0, 1.5, 0.5, 0.5
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
-4.290415, 0.0001351833, -7.629304, 0, -0.5, 0.5, 0.5,
-4.290415, 0.0001351833, -7.629304, 1, -0.5, 0.5, 0.5,
-4.290415, 0.0001351833, -7.629304, 1, 1.5, 0.5, 0.5,
-4.290415, 0.0001351833, -7.629304, 0, 1.5, 0.5, 0.5
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
-4.290415, -4.17797, 0.1737726, 0, -0.5, 0.5, 0.5,
-4.290415, -4.17797, 0.1737726, 1, -0.5, 0.5, 0.5,
-4.290415, -4.17797, 0.1737726, 1, 1.5, 0.5, 0.5,
-4.290415, -4.17797, 0.1737726, 0, 1.5, 0.5, 0.5
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
-3, -3.213792, -5.828594,
2, -3.213792, -5.828594,
-3, -3.213792, -5.828594,
-3, -3.374489, -6.128712,
-2, -3.213792, -5.828594,
-2, -3.374489, -6.128712,
-1, -3.213792, -5.828594,
-1, -3.374489, -6.128712,
0, -3.213792, -5.828594,
0, -3.374489, -6.128712,
1, -3.213792, -5.828594,
1, -3.374489, -6.128712,
2, -3.213792, -5.828594,
2, -3.374489, -6.128712
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
-3, -3.695881, -6.728949, 0, -0.5, 0.5, 0.5,
-3, -3.695881, -6.728949, 1, -0.5, 0.5, 0.5,
-3, -3.695881, -6.728949, 1, 1.5, 0.5, 0.5,
-3, -3.695881, -6.728949, 0, 1.5, 0.5, 0.5,
-2, -3.695881, -6.728949, 0, -0.5, 0.5, 0.5,
-2, -3.695881, -6.728949, 1, -0.5, 0.5, 0.5,
-2, -3.695881, -6.728949, 1, 1.5, 0.5, 0.5,
-2, -3.695881, -6.728949, 0, 1.5, 0.5, 0.5,
-1, -3.695881, -6.728949, 0, -0.5, 0.5, 0.5,
-1, -3.695881, -6.728949, 1, -0.5, 0.5, 0.5,
-1, -3.695881, -6.728949, 1, 1.5, 0.5, 0.5,
-1, -3.695881, -6.728949, 0, 1.5, 0.5, 0.5,
0, -3.695881, -6.728949, 0, -0.5, 0.5, 0.5,
0, -3.695881, -6.728949, 1, -0.5, 0.5, 0.5,
0, -3.695881, -6.728949, 1, 1.5, 0.5, 0.5,
0, -3.695881, -6.728949, 0, 1.5, 0.5, 0.5,
1, -3.695881, -6.728949, 0, -0.5, 0.5, 0.5,
1, -3.695881, -6.728949, 1, -0.5, 0.5, 0.5,
1, -3.695881, -6.728949, 1, 1.5, 0.5, 0.5,
1, -3.695881, -6.728949, 0, 1.5, 0.5, 0.5,
2, -3.695881, -6.728949, 0, -0.5, 0.5, 0.5,
2, -3.695881, -6.728949, 1, -0.5, 0.5, 0.5,
2, -3.695881, -6.728949, 1, 1.5, 0.5, 0.5,
2, -3.695881, -6.728949, 0, 1.5, 0.5, 0.5
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
-3.375132, -3, -5.828594,
-3.375132, 3, -5.828594,
-3.375132, -3, -5.828594,
-3.527679, -3, -6.128712,
-3.375132, -2, -5.828594,
-3.527679, -2, -6.128712,
-3.375132, -1, -5.828594,
-3.527679, -1, -6.128712,
-3.375132, 0, -5.828594,
-3.527679, 0, -6.128712,
-3.375132, 1, -5.828594,
-3.527679, 1, -6.128712,
-3.375132, 2, -5.828594,
-3.527679, 2, -6.128712,
-3.375132, 3, -5.828594,
-3.527679, 3, -6.128712
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
-3.832773, -3, -6.728949, 0, -0.5, 0.5, 0.5,
-3.832773, -3, -6.728949, 1, -0.5, 0.5, 0.5,
-3.832773, -3, -6.728949, 1, 1.5, 0.5, 0.5,
-3.832773, -3, -6.728949, 0, 1.5, 0.5, 0.5,
-3.832773, -2, -6.728949, 0, -0.5, 0.5, 0.5,
-3.832773, -2, -6.728949, 1, -0.5, 0.5, 0.5,
-3.832773, -2, -6.728949, 1, 1.5, 0.5, 0.5,
-3.832773, -2, -6.728949, 0, 1.5, 0.5, 0.5,
-3.832773, -1, -6.728949, 0, -0.5, 0.5, 0.5,
-3.832773, -1, -6.728949, 1, -0.5, 0.5, 0.5,
-3.832773, -1, -6.728949, 1, 1.5, 0.5, 0.5,
-3.832773, -1, -6.728949, 0, 1.5, 0.5, 0.5,
-3.832773, 0, -6.728949, 0, -0.5, 0.5, 0.5,
-3.832773, 0, -6.728949, 1, -0.5, 0.5, 0.5,
-3.832773, 0, -6.728949, 1, 1.5, 0.5, 0.5,
-3.832773, 0, -6.728949, 0, 1.5, 0.5, 0.5,
-3.832773, 1, -6.728949, 0, -0.5, 0.5, 0.5,
-3.832773, 1, -6.728949, 1, -0.5, 0.5, 0.5,
-3.832773, 1, -6.728949, 1, 1.5, 0.5, 0.5,
-3.832773, 1, -6.728949, 0, 1.5, 0.5, 0.5,
-3.832773, 2, -6.728949, 0, -0.5, 0.5, 0.5,
-3.832773, 2, -6.728949, 1, -0.5, 0.5, 0.5,
-3.832773, 2, -6.728949, 1, 1.5, 0.5, 0.5,
-3.832773, 2, -6.728949, 0, 1.5, 0.5, 0.5,
-3.832773, 3, -6.728949, 0, -0.5, 0.5, 0.5,
-3.832773, 3, -6.728949, 1, -0.5, 0.5, 0.5,
-3.832773, 3, -6.728949, 1, 1.5, 0.5, 0.5,
-3.832773, 3, -6.728949, 0, 1.5, 0.5, 0.5
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
-3.375132, -3.213792, -4,
-3.375132, -3.213792, 6,
-3.375132, -3.213792, -4,
-3.527679, -3.374489, -4,
-3.375132, -3.213792, -2,
-3.527679, -3.374489, -2,
-3.375132, -3.213792, 0,
-3.527679, -3.374489, 0,
-3.375132, -3.213792, 2,
-3.527679, -3.374489, 2,
-3.375132, -3.213792, 4,
-3.527679, -3.374489, 4,
-3.375132, -3.213792, 6,
-3.527679, -3.374489, 6
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
-3.832773, -3.695881, -4, 0, -0.5, 0.5, 0.5,
-3.832773, -3.695881, -4, 1, -0.5, 0.5, 0.5,
-3.832773, -3.695881, -4, 1, 1.5, 0.5, 0.5,
-3.832773, -3.695881, -4, 0, 1.5, 0.5, 0.5,
-3.832773, -3.695881, -2, 0, -0.5, 0.5, 0.5,
-3.832773, -3.695881, -2, 1, -0.5, 0.5, 0.5,
-3.832773, -3.695881, -2, 1, 1.5, 0.5, 0.5,
-3.832773, -3.695881, -2, 0, 1.5, 0.5, 0.5,
-3.832773, -3.695881, 0, 0, -0.5, 0.5, 0.5,
-3.832773, -3.695881, 0, 1, -0.5, 0.5, 0.5,
-3.832773, -3.695881, 0, 1, 1.5, 0.5, 0.5,
-3.832773, -3.695881, 0, 0, 1.5, 0.5, 0.5,
-3.832773, -3.695881, 2, 0, -0.5, 0.5, 0.5,
-3.832773, -3.695881, 2, 1, -0.5, 0.5, 0.5,
-3.832773, -3.695881, 2, 1, 1.5, 0.5, 0.5,
-3.832773, -3.695881, 2, 0, 1.5, 0.5, 0.5,
-3.832773, -3.695881, 4, 0, -0.5, 0.5, 0.5,
-3.832773, -3.695881, 4, 1, -0.5, 0.5, 0.5,
-3.832773, -3.695881, 4, 1, 1.5, 0.5, 0.5,
-3.832773, -3.695881, 4, 0, 1.5, 0.5, 0.5,
-3.832773, -3.695881, 6, 0, -0.5, 0.5, 0.5,
-3.832773, -3.695881, 6, 1, -0.5, 0.5, 0.5,
-3.832773, -3.695881, 6, 1, 1.5, 0.5, 0.5,
-3.832773, -3.695881, 6, 0, 1.5, 0.5, 0.5
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
-3.375132, -3.213792, -5.828594,
-3.375132, 3.214063, -5.828594,
-3.375132, -3.213792, 6.176139,
-3.375132, 3.214063, 6.176139,
-3.375132, -3.213792, -5.828594,
-3.375132, -3.213792, 6.176139,
-3.375132, 3.214063, -5.828594,
-3.375132, 3.214063, 6.176139,
-3.375132, -3.213792, -5.828594,
2.726755, -3.213792, -5.828594,
-3.375132, -3.213792, 6.176139,
2.726755, -3.213792, 6.176139,
-3.375132, 3.214063, -5.828594,
2.726755, 3.214063, -5.828594,
-3.375132, 3.214063, 6.176139,
2.726755, 3.214063, 6.176139,
2.726755, -3.213792, -5.828594,
2.726755, 3.214063, -5.828594,
2.726755, -3.213792, 6.176139,
2.726755, 3.214063, 6.176139,
2.726755, -3.213792, -5.828594,
2.726755, -3.213792, 6.176139,
2.726755, 3.214063, -5.828594,
2.726755, 3.214063, 6.176139
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
var radius = 7.96802;
var distance = 35.45062;
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
mvMatrix.translate( 0.3241882, -0.0001351833, -0.1737726 );
mvMatrix.scale( 1.411888, 1.340288, 0.7176486 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.45062);
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
crufomate<-read.table("crufomate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-crufomate$V2
```

```
## Error in eval(expr, envir, enclos): object 'crufomate' not found
```

```r
y<-crufomate$V3
```

```
## Error in eval(expr, envir, enclos): object 'crufomate' not found
```

```r
z<-crufomate$V4
```

```
## Error in eval(expr, envir, enclos): object 'crufomate' not found
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
-3.286269, -0.792008, -1.117302, 0, 0, 1, 1, 1,
-3.250333, 0.1258466, -1.648956, 1, 0, 0, 1, 1,
-2.830032, 1.110976, -3.850076, 1, 0, 0, 1, 1,
-2.747642, 0.1659907, -2.335013, 1, 0, 0, 1, 1,
-2.712621, 1.956549, 0.3079912, 1, 0, 0, 1, 1,
-2.587605, 1.532388, 0.01212152, 1, 0, 0, 1, 1,
-2.469576, 0.6108515, -1.363523, 0, 0, 0, 1, 1,
-2.432973, 0.1489587, -1.711151, 0, 0, 0, 1, 1,
-2.369051, 0.6557455, -1.160529, 0, 0, 0, 1, 1,
-2.33976, 0.5765968, -1.107752, 0, 0, 0, 1, 1,
-2.299775, 1.024336, -2.112692, 0, 0, 0, 1, 1,
-2.274169, -0.2943102, -0.576946, 0, 0, 0, 1, 1,
-2.204644, -0.4113804, -1.065812, 0, 0, 0, 1, 1,
-2.168763, -0.3983318, -2.064734, 1, 1, 1, 1, 1,
-2.124555, -1.944192, -2.410609, 1, 1, 1, 1, 1,
-2.12086, 0.6387729, -0.4612591, 1, 1, 1, 1, 1,
-2.116444, -0.6920242, -0.9700611, 1, 1, 1, 1, 1,
-2.094924, 0.4380467, -0.06298126, 1, 1, 1, 1, 1,
-2.061832, -0.9336453, -1.362686, 1, 1, 1, 1, 1,
-2.008861, -0.4428952, -1.209004, 1, 1, 1, 1, 1,
-2.006956, 0.6368629, -1.883361, 1, 1, 1, 1, 1,
-2.004852, 1.85284, -2.308386, 1, 1, 1, 1, 1,
-1.988261, -0.9465729, -3.213045, 1, 1, 1, 1, 1,
-1.958619, 1.07347, -1.226154, 1, 1, 1, 1, 1,
-1.949775, 1.384657, 0.8326588, 1, 1, 1, 1, 1,
-1.94014, 0.6745415, -2.692461, 1, 1, 1, 1, 1,
-1.8978, -0.4851901, -2.938541, 1, 1, 1, 1, 1,
-1.896223, 1.336639, -3.092406, 1, 1, 1, 1, 1,
-1.894101, -1.370826, -1.646731, 0, 0, 1, 1, 1,
-1.862796, 2.148523, -0.04430413, 1, 0, 0, 1, 1,
-1.853873, -1.183123, -3.233501, 1, 0, 0, 1, 1,
-1.847115, -0.4901314, -2.355108, 1, 0, 0, 1, 1,
-1.823359, 0.7257802, -1.041366, 1, 0, 0, 1, 1,
-1.816424, 0.3055429, -1.643745, 1, 0, 0, 1, 1,
-1.812045, -0.3776755, -1.110259, 0, 0, 0, 1, 1,
-1.796357, 0.4913227, -1.47175, 0, 0, 0, 1, 1,
-1.794783, -0.884666, -0.9395703, 0, 0, 0, 1, 1,
-1.789151, 0.2549736, -0.3706247, 0, 0, 0, 1, 1,
-1.775365, 0.4916377, -1.553651, 0, 0, 0, 1, 1,
-1.772144, 0.8104274, -1.983593, 0, 0, 0, 1, 1,
-1.751366, -0.5041763, -4.544471, 0, 0, 0, 1, 1,
-1.741258, -0.03891071, 0.5317466, 1, 1, 1, 1, 1,
-1.737393, -1.316558, -3.162345, 1, 1, 1, 1, 1,
-1.734906, -0.1993262, -1.60821, 1, 1, 1, 1, 1,
-1.729585, -0.5634986, -1.625759, 1, 1, 1, 1, 1,
-1.6925, -0.516418, -2.577454, 1, 1, 1, 1, 1,
-1.690848, -0.3727973, -2.733648, 1, 1, 1, 1, 1,
-1.686484, 0.3925487, 0.2846113, 1, 1, 1, 1, 1,
-1.686147, 0.2783039, -1.000557, 1, 1, 1, 1, 1,
-1.680628, 0.9419501, -1.433899, 1, 1, 1, 1, 1,
-1.65057, 0.8048665, -0.2126505, 1, 1, 1, 1, 1,
-1.64877, -0.8689424, -1.709082, 1, 1, 1, 1, 1,
-1.647964, -0.2068778, -3.233917, 1, 1, 1, 1, 1,
-1.60044, 2.019029, 0.4092145, 1, 1, 1, 1, 1,
-1.597508, -0.4379585, -4.154707, 1, 1, 1, 1, 1,
-1.587422, -1.393149, -1.673618, 1, 1, 1, 1, 1,
-1.579452, 0.3222698, 1.058325, 0, 0, 1, 1, 1,
-1.574296, -0.4985501, -1.448722, 1, 0, 0, 1, 1,
-1.571219, 1.133936, -1.145773, 1, 0, 0, 1, 1,
-1.569273, 0.5647882, -1.762786, 1, 0, 0, 1, 1,
-1.549681, 0.1459572, -0.3722291, 1, 0, 0, 1, 1,
-1.544166, 0.1252763, -1.133518, 1, 0, 0, 1, 1,
-1.522682, -0.9770632, -3.228984, 0, 0, 0, 1, 1,
-1.518817, -0.6993709, -1.695507, 0, 0, 0, 1, 1,
-1.515553, -1.498994, -2.46765, 0, 0, 0, 1, 1,
-1.509076, -0.3680784, -1.682074, 0, 0, 0, 1, 1,
-1.50488, 0.6065859, -0.2036338, 0, 0, 0, 1, 1,
-1.503789, 1.013427, 0.3951789, 0, 0, 0, 1, 1,
-1.502563, -1.083925, -2.372503, 0, 0, 0, 1, 1,
-1.495961, -1.305813, -2.021594, 1, 1, 1, 1, 1,
-1.492167, 0.1706075, -0.6668153, 1, 1, 1, 1, 1,
-1.490789, -0.1237582, -0.9010774, 1, 1, 1, 1, 1,
-1.487095, -0.8851534, -0.4596885, 1, 1, 1, 1, 1,
-1.467622, 0.9341897, 0.5681338, 1, 1, 1, 1, 1,
-1.465109, 0.7850982, -0.5091873, 1, 1, 1, 1, 1,
-1.454358, 0.4820259, -2.402177, 1, 1, 1, 1, 1,
-1.450794, 0.1367192, -3.061542, 1, 1, 1, 1, 1,
-1.448962, -0.2842455, -0.58356, 1, 1, 1, 1, 1,
-1.431015, -0.3570611, -2.1461, 1, 1, 1, 1, 1,
-1.427195, -0.2658037, -3.545623, 1, 1, 1, 1, 1,
-1.427151, 0.268741, -0.7795871, 1, 1, 1, 1, 1,
-1.426817, -0.4112895, -1.385172, 1, 1, 1, 1, 1,
-1.418521, 0.06940133, -0.4321419, 1, 1, 1, 1, 1,
-1.417558, 0.7034772, -0.769545, 1, 1, 1, 1, 1,
-1.41569, 0.8519796, -0.05698493, 0, 0, 1, 1, 1,
-1.411997, 1.463694, -0.5917444, 1, 0, 0, 1, 1,
-1.391907, -0.4702782, -2.509102, 1, 0, 0, 1, 1,
-1.388908, -1.121897, -0.748196, 1, 0, 0, 1, 1,
-1.388158, 0.9369105, -2.022658, 1, 0, 0, 1, 1,
-1.382422, 1.211523, -3.203724, 1, 0, 0, 1, 1,
-1.377861, 0.5787688, 0.03529421, 0, 0, 0, 1, 1,
-1.376238, 0.3377707, -0.06517377, 0, 0, 0, 1, 1,
-1.371358, -1.174252, -3.414139, 0, 0, 0, 1, 1,
-1.370237, -0.9878359, -3.578182, 0, 0, 0, 1, 1,
-1.366442, 1.515066, 0.3638434, 0, 0, 0, 1, 1,
-1.366057, 1.26199, -0.763437, 0, 0, 0, 1, 1,
-1.358361, -0.1585579, -0.3832156, 0, 0, 0, 1, 1,
-1.353491, -2.390174, -4.456295, 1, 1, 1, 1, 1,
-1.350768, -1.326781, -2.926027, 1, 1, 1, 1, 1,
-1.341816, -0.8339031, -0.4179643, 1, 1, 1, 1, 1,
-1.340223, 0.4769752, -2.532347, 1, 1, 1, 1, 1,
-1.340124, -1.74481, -2.797205, 1, 1, 1, 1, 1,
-1.337947, 0.7309899, -0.3815557, 1, 1, 1, 1, 1,
-1.337313, -0.09888923, -3.770639, 1, 1, 1, 1, 1,
-1.331581, 1.798215, -0.7352031, 1, 1, 1, 1, 1,
-1.328329, 0.1109687, -0.6887476, 1, 1, 1, 1, 1,
-1.320759, 0.01664521, -2.831798, 1, 1, 1, 1, 1,
-1.315863, 1.45817, -1.991391, 1, 1, 1, 1, 1,
-1.313037, -0.006886724, -2.967079, 1, 1, 1, 1, 1,
-1.30951, 1.483547, -0.5733038, 1, 1, 1, 1, 1,
-1.304815, 1.884493, -1.327763, 1, 1, 1, 1, 1,
-1.293931, 0.216723, -4.634064, 1, 1, 1, 1, 1,
-1.293397, 0.01170851, -1.018239, 0, 0, 1, 1, 1,
-1.278718, -0.7901416, -1.868054, 1, 0, 0, 1, 1,
-1.277501, -0.784973, -2.698255, 1, 0, 0, 1, 1,
-1.270284, 0.8641742, -0.8520529, 1, 0, 0, 1, 1,
-1.259371, -0.2703241, -1.577812, 1, 0, 0, 1, 1,
-1.255238, -1.200601, -3.831516, 1, 0, 0, 1, 1,
-1.244462, 1.042931, -1.586198, 0, 0, 0, 1, 1,
-1.242389, 1.699196, -1.697299, 0, 0, 0, 1, 1,
-1.239095, 1.976457, -1.235063, 0, 0, 0, 1, 1,
-1.23846, 0.3190489, -2.480708, 0, 0, 0, 1, 1,
-1.237684, 0.060702, -2.442998, 0, 0, 0, 1, 1,
-1.22481, 0.899804, -1.51834, 0, 0, 0, 1, 1,
-1.221624, -0.2019477, -1.196569, 0, 0, 0, 1, 1,
-1.218419, -0.4086443, -2.356441, 1, 1, 1, 1, 1,
-1.211795, -0.5981359, -1.110282, 1, 1, 1, 1, 1,
-1.209338, 0.8471957, -0.2228617, 1, 1, 1, 1, 1,
-1.208847, -1.490892, -0.8681039, 1, 1, 1, 1, 1,
-1.189279, -1.456241, -2.764568, 1, 1, 1, 1, 1,
-1.187558, 1.034353, 0.1465978, 1, 1, 1, 1, 1,
-1.186973, -0.1296841, -1.068867, 1, 1, 1, 1, 1,
-1.185719, 1.882286, 1.66888, 1, 1, 1, 1, 1,
-1.182363, 0.5357683, -0.9525322, 1, 1, 1, 1, 1,
-1.167522, -0.6077839, -3.328678, 1, 1, 1, 1, 1,
-1.161972, -1.11721, -1.946083, 1, 1, 1, 1, 1,
-1.161305, 0.3849628, 0.2581402, 1, 1, 1, 1, 1,
-1.157489, -1.98693, -4.039262, 1, 1, 1, 1, 1,
-1.155658, 2.611128, -2.148141, 1, 1, 1, 1, 1,
-1.15564, -1.091889, -3.444842, 1, 1, 1, 1, 1,
-1.145325, -0.2445168, 0.6979778, 0, 0, 1, 1, 1,
-1.125111, -0.4536626, -1.022213, 1, 0, 0, 1, 1,
-1.112885, -1.428414, -2.839263, 1, 0, 0, 1, 1,
-1.102909, 3.120453, 0.4646943, 1, 0, 0, 1, 1,
-1.099795, 0.1216442, -1.401549, 1, 0, 0, 1, 1,
-1.093933, -0.04435498, -2.906388, 1, 0, 0, 1, 1,
-1.089469, 0.3694738, -1.166988, 0, 0, 0, 1, 1,
-1.087985, -1.083254, -1.835361, 0, 0, 0, 1, 1,
-1.086444, 0.890156, -0.377281, 0, 0, 0, 1, 1,
-1.078814, 0.4971722, -0.7430964, 0, 0, 0, 1, 1,
-1.072229, 0.3777098, -0.2540627, 0, 0, 0, 1, 1,
-1.067998, -0.9705083, -1.287682, 0, 0, 0, 1, 1,
-1.065953, 0.171445, -1.948865, 0, 0, 0, 1, 1,
-1.061067, 0.5518535, -3.143012, 1, 1, 1, 1, 1,
-1.059187, 0.07669986, -0.2698904, 1, 1, 1, 1, 1,
-1.057873, -0.9456691, -2.373191, 1, 1, 1, 1, 1,
-1.056377, -0.3063974, -0.6566784, 1, 1, 1, 1, 1,
-1.045781, -1.520493, -4.327447, 1, 1, 1, 1, 1,
-1.044139, -2.691044, -1.935398, 1, 1, 1, 1, 1,
-1.035502, 0.0437497, -1.9295, 1, 1, 1, 1, 1,
-1.035275, 0.7751507, -1.805169, 1, 1, 1, 1, 1,
-1.034708, 0.153898, -1.549122, 1, 1, 1, 1, 1,
-1.033236, 1.898844, -0.6476893, 1, 1, 1, 1, 1,
-1.03035, 0.6449649, -0.31513, 1, 1, 1, 1, 1,
-1.027184, 0.4471304, -2.470445, 1, 1, 1, 1, 1,
-1.022758, -1.576626, -3.240156, 1, 1, 1, 1, 1,
-1.022442, 0.6560335, 0.191403, 1, 1, 1, 1, 1,
-1.016056, 0.02530177, -1.588204, 1, 1, 1, 1, 1,
-1.007484, 1.424042, 0.1576676, 0, 0, 1, 1, 1,
-0.9914255, 0.4814301, -0.9619716, 1, 0, 0, 1, 1,
-0.9831568, 0.3386121, -1.549178, 1, 0, 0, 1, 1,
-0.9801881, 0.9426715, 0.002777727, 1, 0, 0, 1, 1,
-0.9790908, -0.08600411, -1.075121, 1, 0, 0, 1, 1,
-0.9786146, -1.436989, -3.697669, 1, 0, 0, 1, 1,
-0.9733971, -0.02386746, -1.462208, 0, 0, 0, 1, 1,
-0.9705704, -0.9227127, -1.731603, 0, 0, 0, 1, 1,
-0.9621148, -2.06844, -1.867559, 0, 0, 0, 1, 1,
-0.9620531, -1.460959, -0.6038526, 0, 0, 0, 1, 1,
-0.961383, 1.00379, -1.101787, 0, 0, 0, 1, 1,
-0.9612788, -0.7427133, -2.492922, 0, 0, 0, 1, 1,
-0.9495596, -0.5029142, -3.517073, 0, 0, 0, 1, 1,
-0.9488863, -0.5937114, -2.929726, 1, 1, 1, 1, 1,
-0.9422866, 0.5086894, -0.5359248, 1, 1, 1, 1, 1,
-0.9354818, 0.05262375, -1.654389, 1, 1, 1, 1, 1,
-0.9289823, -1.01124, -3.005075, 1, 1, 1, 1, 1,
-0.9287376, 2.260694, -1.498607, 1, 1, 1, 1, 1,
-0.9254099, -1.078416, -2.201912, 1, 1, 1, 1, 1,
-0.9182585, 0.6539619, -1.189778, 1, 1, 1, 1, 1,
-0.9137902, 0.5534253, 0.320481, 1, 1, 1, 1, 1,
-0.913694, 0.2965104, -3.712664, 1, 1, 1, 1, 1,
-0.908681, 0.4918208, -1.069825, 1, 1, 1, 1, 1,
-0.9084677, 0.3506537, -1.013238, 1, 1, 1, 1, 1,
-0.9042186, 0.6602114, -1.464196, 1, 1, 1, 1, 1,
-0.9029123, 1.887062, -0.4078334, 1, 1, 1, 1, 1,
-0.9013996, 0.9952206, -3.131616, 1, 1, 1, 1, 1,
-0.9006706, 0.2482208, -0.6245342, 1, 1, 1, 1, 1,
-0.8943005, 2.181067, 0.2411315, 0, 0, 1, 1, 1,
-0.8927397, -1.17575, -1.216212, 1, 0, 0, 1, 1,
-0.8907952, -2.015088, -1.465726, 1, 0, 0, 1, 1,
-0.8835281, -0.6297016, -2.095151, 1, 0, 0, 1, 1,
-0.8811499, 1.14447, -1.525033, 1, 0, 0, 1, 1,
-0.8800612, -0.635676, -1.736861, 1, 0, 0, 1, 1,
-0.8782881, -0.6165084, -3.624255, 0, 0, 0, 1, 1,
-0.8712922, -1.806647, -2.627554, 0, 0, 0, 1, 1,
-0.8706241, -2.07222, -1.39723, 0, 0, 0, 1, 1,
-0.8703716, -0.7991059, -3.018544, 0, 0, 0, 1, 1,
-0.8685342, -1.758987, -4.404491, 0, 0, 0, 1, 1,
-0.8625183, -1.46126, -2.504375, 0, 0, 0, 1, 1,
-0.8604187, -0.4043935, -1.236662, 0, 0, 0, 1, 1,
-0.8537457, 1.339524, -1.882454, 1, 1, 1, 1, 1,
-0.8453214, -0.09521022, -0.4793917, 1, 1, 1, 1, 1,
-0.8445234, -0.2991448, -1.965247, 1, 1, 1, 1, 1,
-0.8298777, -0.6261895, -0.7865298, 1, 1, 1, 1, 1,
-0.8272801, -0.05143267, -1.448445, 1, 1, 1, 1, 1,
-0.8231858, -1.583917, -3.160884, 1, 1, 1, 1, 1,
-0.8198397, -0.6817037, -2.951734, 1, 1, 1, 1, 1,
-0.8168847, 0.6933284, -1.382968, 1, 1, 1, 1, 1,
-0.8163791, 0.3497445, -0.4115016, 1, 1, 1, 1, 1,
-0.8156788, -1.798557, -2.613621, 1, 1, 1, 1, 1,
-0.8150119, 0.5303306, -1.57356, 1, 1, 1, 1, 1,
-0.813177, -0.5919182, -2.965727, 1, 1, 1, 1, 1,
-0.8046839, -1.02184, -2.830775, 1, 1, 1, 1, 1,
-0.8031419, 0.1055312, -0.7229388, 1, 1, 1, 1, 1,
-0.8019444, -1.104721, -2.928624, 1, 1, 1, 1, 1,
-0.80002, 0.604689, 1.223822, 0, 0, 1, 1, 1,
-0.7973996, -0.6196533, -3.383087, 1, 0, 0, 1, 1,
-0.7905077, 0.770318, -2.026672, 1, 0, 0, 1, 1,
-0.7894931, -0.6689112, -1.862924, 1, 0, 0, 1, 1,
-0.7872586, 0.3634009, -1.039827, 1, 0, 0, 1, 1,
-0.7865519, -0.08229394, -2.070685, 1, 0, 0, 1, 1,
-0.778674, 1.436849, 0.6601818, 0, 0, 0, 1, 1,
-0.77722, 2.05361, 1.787145, 0, 0, 0, 1, 1,
-0.7708672, 0.847658, -0.6131266, 0, 0, 0, 1, 1,
-0.7630203, 0.1223251, -0.6684047, 0, 0, 0, 1, 1,
-0.7603, -0.2720706, -1.929927, 0, 0, 0, 1, 1,
-0.7438521, 0.9979236, -1.704363, 0, 0, 0, 1, 1,
-0.7365007, -1.556083, -3.348731, 0, 0, 0, 1, 1,
-0.7344863, -1.174472, -2.101214, 1, 1, 1, 1, 1,
-0.73232, -0.2493037, -2.405058, 1, 1, 1, 1, 1,
-0.7309563, -0.7978567, -1.811246, 1, 1, 1, 1, 1,
-0.7287745, -1.10137, -3.691934, 1, 1, 1, 1, 1,
-0.7281716, 0.5567449, -2.254236, 1, 1, 1, 1, 1,
-0.726302, -0.4687478, -3.608684, 1, 1, 1, 1, 1,
-0.7244673, 1.850065, 0.6757507, 1, 1, 1, 1, 1,
-0.7208806, -0.4294475, -1.102364, 1, 1, 1, 1, 1,
-0.7177606, 1.661901, -0.356878, 1, 1, 1, 1, 1,
-0.7172137, 0.2280764, -1.359067, 1, 1, 1, 1, 1,
-0.7142386, 0.3288122, -0.3373434, 1, 1, 1, 1, 1,
-0.7100837, -0.4632591, -1.816397, 1, 1, 1, 1, 1,
-0.7091785, 0.09948754, -3.236334, 1, 1, 1, 1, 1,
-0.6996507, -1.103426, -2.07478, 1, 1, 1, 1, 1,
-0.6995233, -0.8235547, -2.327166, 1, 1, 1, 1, 1,
-0.6994899, 0.8864009, 1.971477, 0, 0, 1, 1, 1,
-0.6977109, -0.4663382, -2.127741, 1, 0, 0, 1, 1,
-0.696346, 0.06485011, -2.775557, 1, 0, 0, 1, 1,
-0.6938887, -0.05314219, -0.6112697, 1, 0, 0, 1, 1,
-0.6915281, -0.4119478, -1.828165, 1, 0, 0, 1, 1,
-0.6913261, -0.1369945, -1.170568, 1, 0, 0, 1, 1,
-0.6872246, -0.8486683, -2.206462, 0, 0, 0, 1, 1,
-0.6871473, -2.281075, -2.100566, 0, 0, 0, 1, 1,
-0.6842645, 0.3322367, -1.038351, 0, 0, 0, 1, 1,
-0.6808528, 0.4723173, 0.4841598, 0, 0, 0, 1, 1,
-0.6777183, -1.103472, -0.6906549, 0, 0, 0, 1, 1,
-0.6753672, -1.224653, -1.608278, 0, 0, 0, 1, 1,
-0.6706126, -0.7904805, -1.975577, 0, 0, 0, 1, 1,
-0.6636845, -0.37352, -1.22938, 1, 1, 1, 1, 1,
-0.6600519, 1.517284, 1.45916, 1, 1, 1, 1, 1,
-0.6599994, 1.104681, -1.291255, 1, 1, 1, 1, 1,
-0.6591086, 1.19624, -0.5256805, 1, 1, 1, 1, 1,
-0.6488842, -2.078697, -4.068852, 1, 1, 1, 1, 1,
-0.6477761, -1.12143, -3.636866, 1, 1, 1, 1, 1,
-0.6476266, 0.4681429, -2.105464, 1, 1, 1, 1, 1,
-0.6436635, -1.38476, -3.303898, 1, 1, 1, 1, 1,
-0.6429644, 0.8211383, 0.2870727, 1, 1, 1, 1, 1,
-0.6371167, -0.4431247, -1.569433, 1, 1, 1, 1, 1,
-0.6271742, 0.2365727, -1.177961, 1, 1, 1, 1, 1,
-0.6229823, -0.5184858, -1.601968, 1, 1, 1, 1, 1,
-0.6175669, 0.2239429, -2.842193, 1, 1, 1, 1, 1,
-0.6099722, -1.1469, -2.63015, 1, 1, 1, 1, 1,
-0.6093464, 0.4295392, -1.257028, 1, 1, 1, 1, 1,
-0.6053384, 0.3316927, 0.7233059, 0, 0, 1, 1, 1,
-0.6050639, 0.3367023, -2.152842, 1, 0, 0, 1, 1,
-0.6006245, 1.508872, 1.4473, 1, 0, 0, 1, 1,
-0.5891434, 0.6310528, -0.002294157, 1, 0, 0, 1, 1,
-0.5867106, -0.4549593, -1.909856, 1, 0, 0, 1, 1,
-0.5847416, 0.207084, -1.936774, 1, 0, 0, 1, 1,
-0.5846184, 0.3569065, -2.431472, 0, 0, 0, 1, 1,
-0.5803234, 0.3818876, -1.468937, 0, 0, 0, 1, 1,
-0.5795275, -1.445151, -2.6565, 0, 0, 0, 1, 1,
-0.5751491, 1.102169, -1.209993, 0, 0, 0, 1, 1,
-0.5705034, -0.00821314, -1.965093, 0, 0, 0, 1, 1,
-0.5696602, -1.49223, -1.886303, 0, 0, 0, 1, 1,
-0.564195, -1.673978, -3.211686, 0, 0, 0, 1, 1,
-0.5521427, -0.007946277, -1.482742, 1, 1, 1, 1, 1,
-0.5477135, -0.1492817, -1.733396, 1, 1, 1, 1, 1,
-0.5433045, -0.7757047, -1.165661, 1, 1, 1, 1, 1,
-0.5432877, 0.9389874, -1.876811, 1, 1, 1, 1, 1,
-0.542913, -0.4434229, -3.687695, 1, 1, 1, 1, 1,
-0.5406953, 0.4315059, -1.561895, 1, 1, 1, 1, 1,
-0.5398564, -1.421158, -5.154687, 1, 1, 1, 1, 1,
-0.5382327, 1.05301, -0.512584, 1, 1, 1, 1, 1,
-0.5366684, 0.7371593, -0.9510326, 1, 1, 1, 1, 1,
-0.5349438, -0.3874556, -3.693577, 1, 1, 1, 1, 1,
-0.5330269, 0.1483793, -0.9219133, 1, 1, 1, 1, 1,
-0.5265707, 0.5210767, -0.1268216, 1, 1, 1, 1, 1,
-0.5264137, 0.07326463, -2.619698, 1, 1, 1, 1, 1,
-0.5235057, -0.8298059, -2.140752, 1, 1, 1, 1, 1,
-0.5229, -1.218274, -1.381076, 1, 1, 1, 1, 1,
-0.520115, 0.1572284, -3.28293, 0, 0, 1, 1, 1,
-0.5189009, -1.213115, -1.243531, 1, 0, 0, 1, 1,
-0.5171541, -1.325775, -2.702219, 1, 0, 0, 1, 1,
-0.51509, 0.7310447, 0.7956969, 1, 0, 0, 1, 1,
-0.514975, -1.097367, -3.72211, 1, 0, 0, 1, 1,
-0.5128965, 1.455045, 0.3687302, 1, 0, 0, 1, 1,
-0.5125024, -0.5275176, -1.230873, 0, 0, 0, 1, 1,
-0.510076, -0.1768886, -1.676834, 0, 0, 0, 1, 1,
-0.5061779, 0.2104211, -0.4036067, 0, 0, 0, 1, 1,
-0.5048822, -0.2667647, -1.015863, 0, 0, 0, 1, 1,
-0.5039381, -1.89386, -2.768753, 0, 0, 0, 1, 1,
-0.5029539, 1.052738, -0.6405131, 0, 0, 0, 1, 1,
-0.498758, 0.4513772, 0.3124233, 0, 0, 0, 1, 1,
-0.4930182, 1.023926, 1.103847, 1, 1, 1, 1, 1,
-0.4912868, -0.5661584, -1.434606, 1, 1, 1, 1, 1,
-0.4866488, -0.4556971, -1.748091, 1, 1, 1, 1, 1,
-0.4744574, -0.03911921, -2.39029, 1, 1, 1, 1, 1,
-0.4723493, 0.9945526, -0.4642028, 1, 1, 1, 1, 1,
-0.471298, 1.722839, 1.55313, 1, 1, 1, 1, 1,
-0.4674528, -0.7662492, -1.775463, 1, 1, 1, 1, 1,
-0.4654202, 1.251888, -0.01854279, 1, 1, 1, 1, 1,
-0.4635399, 0.05473706, -0.6218445, 1, 1, 1, 1, 1,
-0.4620353, -0.3589006, -0.2715512, 1, 1, 1, 1, 1,
-0.4612723, -0.07410955, 0.2089106, 1, 1, 1, 1, 1,
-0.4600605, -0.4139386, -3.834123, 1, 1, 1, 1, 1,
-0.459642, -1.44742, -3.739335, 1, 1, 1, 1, 1,
-0.459028, -1.76197, -2.349145, 1, 1, 1, 1, 1,
-0.4558611, -1.090564, -4.534099, 1, 1, 1, 1, 1,
-0.4541132, -2.215455, -2.878757, 0, 0, 1, 1, 1,
-0.4514933, 0.4473822, -1.301499, 1, 0, 0, 1, 1,
-0.4507098, 1.53011, -0.6215802, 1, 0, 0, 1, 1,
-0.4499317, 0.6137336, -1.785393, 1, 0, 0, 1, 1,
-0.4478548, -0.004461191, -1.736115, 1, 0, 0, 1, 1,
-0.4463668, -1.709145, -2.940967, 1, 0, 0, 1, 1,
-0.4425694, 0.1245862, -2.336693, 0, 0, 0, 1, 1,
-0.4233586, 0.9609433, -1.049342, 0, 0, 0, 1, 1,
-0.4232575, -0.4566708, -2.338887, 0, 0, 0, 1, 1,
-0.4219149, 0.005334873, -1.634816, 0, 0, 0, 1, 1,
-0.4208311, -0.9026992, -3.118057, 0, 0, 0, 1, 1,
-0.4141781, -0.7527397, -2.425811, 0, 0, 0, 1, 1,
-0.407589, 1.586823, -0.4744453, 0, 0, 0, 1, 1,
-0.402565, -0.6009336, -3.571992, 1, 1, 1, 1, 1,
-0.4011583, 1.737473, 1.120369, 1, 1, 1, 1, 1,
-0.3985844, -0.681567, -2.423192, 1, 1, 1, 1, 1,
-0.3885235, 1.04594, -1.018372, 1, 1, 1, 1, 1,
-0.3884103, -1.032682, -2.506572, 1, 1, 1, 1, 1,
-0.3852649, 1.45977, -1.262451, 1, 1, 1, 1, 1,
-0.3849063, -1.203038, -2.542754, 1, 1, 1, 1, 1,
-0.3808601, 0.9197956, -0.9794016, 1, 1, 1, 1, 1,
-0.3795978, 0.8594745, 1.02353, 1, 1, 1, 1, 1,
-0.3780883, 0.8417233, 0.8334576, 1, 1, 1, 1, 1,
-0.3754085, -1.853348, -1.192603, 1, 1, 1, 1, 1,
-0.3736273, -0.2020904, -2.577792, 1, 1, 1, 1, 1,
-0.3721375, -1.067492, -0.7876262, 1, 1, 1, 1, 1,
-0.3717973, -0.6902943, -1.275994, 1, 1, 1, 1, 1,
-0.367581, 0.9916515, 0.2102414, 1, 1, 1, 1, 1,
-0.3659489, 0.08673114, -1.4896, 0, 0, 1, 1, 1,
-0.3657456, 0.5588934, -0.3566908, 1, 0, 0, 1, 1,
-0.3635972, 1.797565, -0.143608, 1, 0, 0, 1, 1,
-0.3612758, -0.655161, -1.162895, 1, 0, 0, 1, 1,
-0.3558388, 0.4374398, -0.6380181, 1, 0, 0, 1, 1,
-0.3535955, 1.243626, -0.7882376, 1, 0, 0, 1, 1,
-0.348403, -0.01162593, -1.472889, 0, 0, 0, 1, 1,
-0.3451569, 1.910624, 3.09581, 0, 0, 0, 1, 1,
-0.344724, 0.8837345, -0.7854272, 0, 0, 0, 1, 1,
-0.3395015, 0.4924136, 1.15314, 0, 0, 0, 1, 1,
-0.3392703, -2.085728, -1.61791, 0, 0, 0, 1, 1,
-0.3369882, -0.142987, -2.001854, 0, 0, 0, 1, 1,
-0.3306028, 0.359606, -0.3036803, 0, 0, 0, 1, 1,
-0.3217648, -0.534181, -1.354342, 1, 1, 1, 1, 1,
-0.3203822, -0.9687387, -2.411819, 1, 1, 1, 1, 1,
-0.3187063, 1.714679, -0.7626541, 1, 1, 1, 1, 1,
-0.3179867, -0.787423, -2.168208, 1, 1, 1, 1, 1,
-0.3170469, -0.1705963, -2.310951, 1, 1, 1, 1, 1,
-0.314524, -0.4660608, -1.884897, 1, 1, 1, 1, 1,
-0.3132821, -1.431251, -5.05932, 1, 1, 1, 1, 1,
-0.3111843, 0.2944235, 0.4351264, 1, 1, 1, 1, 1,
-0.3076815, 0.5413905, -1.024855, 1, 1, 1, 1, 1,
-0.3057714, -0.09509567, -1.061422, 1, 1, 1, 1, 1,
-0.3048464, -1.381283, -2.468611, 1, 1, 1, 1, 1,
-0.3016099, -0.1063165, -3.879672, 1, 1, 1, 1, 1,
-0.2993909, -1.362059, -3.263403, 1, 1, 1, 1, 1,
-0.296704, 0.2454671, -0.04716058, 1, 1, 1, 1, 1,
-0.2957425, 0.08046553, -2.115669, 1, 1, 1, 1, 1,
-0.2862057, 0.6661914, -0.8871368, 0, 0, 1, 1, 1,
-0.2858978, 0.1909219, -2.365056, 1, 0, 0, 1, 1,
-0.284674, -1.102992, -3.163313, 1, 0, 0, 1, 1,
-0.2842596, -0.6677676, -2.762666, 1, 0, 0, 1, 1,
-0.2841408, -1.517053, -3.243068, 1, 0, 0, 1, 1,
-0.2792497, 0.6787542, -1.316123, 1, 0, 0, 1, 1,
-0.277687, 0.9574015, -1.467746, 0, 0, 0, 1, 1,
-0.2758922, 0.04125185, -2.525938, 0, 0, 0, 1, 1,
-0.2755122, 0.6875336, 0.8702471, 0, 0, 0, 1, 1,
-0.2722352, -0.2783891, -2.562623, 0, 0, 0, 1, 1,
-0.2704801, 1.694357, -0.8728358, 0, 0, 0, 1, 1,
-0.2655292, 1.685845, 1.20399, 0, 0, 0, 1, 1,
-0.2562229, -0.7124372, -3.01939, 0, 0, 0, 1, 1,
-0.2536495, -2.338033, -2.801975, 1, 1, 1, 1, 1,
-0.2494322, 0.8491048, -1.9764, 1, 1, 1, 1, 1,
-0.2461228, -0.6241668, -4.598938, 1, 1, 1, 1, 1,
-0.2384315, 0.6396407, -0.4356773, 1, 1, 1, 1, 1,
-0.2302105, -0.2120569, -2.242649, 1, 1, 1, 1, 1,
-0.2243975, 1.356042, 0.1964677, 1, 1, 1, 1, 1,
-0.2237539, 0.4478261, -1.519572, 1, 1, 1, 1, 1,
-0.2199073, -1.295784, -2.984319, 1, 1, 1, 1, 1,
-0.2170674, -0.1312445, -3.659153, 1, 1, 1, 1, 1,
-0.2134333, 0.2484244, 1.470291, 1, 1, 1, 1, 1,
-0.2118003, 1.3107, 0.350244, 1, 1, 1, 1, 1,
-0.211535, -1.009849, -4.222515, 1, 1, 1, 1, 1,
-0.2059709, 0.274936, -0.7358798, 1, 1, 1, 1, 1,
-0.2043878, -2.430198, -1.306898, 1, 1, 1, 1, 1,
-0.2000579, -1.047576, -2.174607, 1, 1, 1, 1, 1,
-0.1999236, 0.5397381, 0.1032836, 0, 0, 1, 1, 1,
-0.1970419, -0.4538625, -1.699126, 1, 0, 0, 1, 1,
-0.1912744, -0.6876415, -2.835015, 1, 0, 0, 1, 1,
-0.191214, -0.519315, -2.100978, 1, 0, 0, 1, 1,
-0.1904585, 0.6662552, 0.8033746, 1, 0, 0, 1, 1,
-0.1879352, 0.7000127, -1.301004, 1, 0, 0, 1, 1,
-0.1824223, 0.4291733, -1.040265, 0, 0, 0, 1, 1,
-0.1821085, 0.4744509, -0.198758, 0, 0, 0, 1, 1,
-0.1780474, -1.123267, -2.260719, 0, 0, 0, 1, 1,
-0.1764672, 0.1684034, -2.474433, 0, 0, 0, 1, 1,
-0.1759307, 0.2467067, 1.047177, 0, 0, 0, 1, 1,
-0.1687512, 0.4911466, -1.013094, 0, 0, 0, 1, 1,
-0.1669605, 0.7749257, -0.2935721, 0, 0, 0, 1, 1,
-0.1638972, -0.2449672, -0.4094024, 1, 1, 1, 1, 1,
-0.1601508, -1.192456, -2.422108, 1, 1, 1, 1, 1,
-0.1594838, -0.9590749, -3.000529, 1, 1, 1, 1, 1,
-0.1576408, 0.8021647, -1.352637, 1, 1, 1, 1, 1,
-0.1539573, -0.07391626, -1.785266, 1, 1, 1, 1, 1,
-0.1536965, 0.4946576, -0.426924, 1, 1, 1, 1, 1,
-0.1534864, 0.53009, -1.623161, 1, 1, 1, 1, 1,
-0.1509987, 1.039101, 0.4697155, 1, 1, 1, 1, 1,
-0.1430523, 0.3207287, 0.2951074, 1, 1, 1, 1, 1,
-0.1411181, -1.376874, -4.206903, 1, 1, 1, 1, 1,
-0.1306994, -1.554559, -2.66671, 1, 1, 1, 1, 1,
-0.1298163, 1.688626, -0.9283282, 1, 1, 1, 1, 1,
-0.1297747, -0.905722, -3.467599, 1, 1, 1, 1, 1,
-0.1259291, 1.059666, -0.5183636, 1, 1, 1, 1, 1,
-0.1203142, -0.4996741, -4.03209, 1, 1, 1, 1, 1,
-0.1198684, -0.1347396, -1.379588, 0, 0, 1, 1, 1,
-0.1184757, -0.5373515, -1.550998, 1, 0, 0, 1, 1,
-0.1179692, -0.1116804, -2.55366, 1, 0, 0, 1, 1,
-0.1175614, 0.2615002, -1.836295, 1, 0, 0, 1, 1,
-0.1164145, -0.5519028, -1.579465, 1, 0, 0, 1, 1,
-0.1121811, 0.4076957, -0.3680419, 1, 0, 0, 1, 1,
-0.1120348, 1.143247, -0.3205343, 0, 0, 0, 1, 1,
-0.1116229, -0.4050139, -3.357614, 0, 0, 0, 1, 1,
-0.1108462, -0.2921363, -3.429868, 0, 0, 0, 1, 1,
-0.1092895, 0.1129354, -1.700794, 0, 0, 0, 1, 1,
-0.107403, -0.5370678, -3.99209, 0, 0, 0, 1, 1,
-0.1050788, 0.673444, 2.123477, 0, 0, 0, 1, 1,
-0.1021753, -0.04463311, -1.889191, 0, 0, 0, 1, 1,
-0.09850109, 0.3134998, -0.3394941, 1, 1, 1, 1, 1,
-0.0834543, -1.506969, -0.662197, 1, 1, 1, 1, 1,
-0.08158734, 0.01867133, -1.87194, 1, 1, 1, 1, 1,
-0.08061164, 0.249892, -0.5106927, 1, 1, 1, 1, 1,
-0.07892778, -0.2071553, -1.883102, 1, 1, 1, 1, 1,
-0.07757039, -0.3340164, -2.610894, 1, 1, 1, 1, 1,
-0.07471107, -0.2529297, -5.653768, 1, 1, 1, 1, 1,
-0.07236971, 2.185134, -0.08458102, 1, 1, 1, 1, 1,
-0.06998315, -0.492322, -3.256763, 1, 1, 1, 1, 1,
-0.06691076, -0.7001819, -4.502584, 1, 1, 1, 1, 1,
-0.06626217, 0.1003225, 1.212579, 1, 1, 1, 1, 1,
-0.06610207, 0.1254492, 0.5743737, 1, 1, 1, 1, 1,
-0.06465903, -1.265284, -2.113133, 1, 1, 1, 1, 1,
-0.06443338, 0.5249702, -1.63177, 1, 1, 1, 1, 1,
-0.0625206, 0.2909943, -0.433915, 1, 1, 1, 1, 1,
-0.05935542, 1.298685, -1.377307, 0, 0, 1, 1, 1,
-0.05600636, -0.2629425, -3.532894, 1, 0, 0, 1, 1,
-0.05594801, 0.122601, -0.9762217, 1, 0, 0, 1, 1,
-0.05463889, -1.678978, -3.140944, 1, 0, 0, 1, 1,
-0.0532513, -0.2358866, -2.646482, 1, 0, 0, 1, 1,
-0.05280463, -1.187246, -2.52585, 1, 0, 0, 1, 1,
-0.05166506, 0.9366069, 0.5552521, 0, 0, 0, 1, 1,
-0.04805991, -0.04601444, -3.088746, 0, 0, 0, 1, 1,
-0.04777135, -1.488028, -2.258763, 0, 0, 0, 1, 1,
-0.04774653, 0.3356823, -0.7554475, 0, 0, 0, 1, 1,
-0.04636124, -0.9394924, -2.937901, 0, 0, 0, 1, 1,
-0.04145989, 0.3314672, -0.9296525, 0, 0, 0, 1, 1,
-0.03996678, 0.6454664, 1.143215, 0, 0, 0, 1, 1,
-0.03848521, 1.576177, 0.8621019, 1, 1, 1, 1, 1,
-0.03779824, -1.34843, -2.895866, 1, 1, 1, 1, 1,
-0.03702695, -2.135785, -2.162714, 1, 1, 1, 1, 1,
-0.03232821, 1.168641, -0.9410064, 1, 1, 1, 1, 1,
-0.03020751, 0.8033189, -0.9094721, 1, 1, 1, 1, 1,
-0.02758971, 1.796915, -1.523635, 1, 1, 1, 1, 1,
-0.02706858, 0.5713049, 0.524727, 1, 1, 1, 1, 1,
-0.02572675, 0.8444504, 1.43835, 1, 1, 1, 1, 1,
-0.02450051, -0.7231238, -3.1466, 1, 1, 1, 1, 1,
-0.02015845, -0.9559554, -5.071855, 1, 1, 1, 1, 1,
-0.01971366, -0.8073639, -2.160542, 1, 1, 1, 1, 1,
-0.01266406, 0.9973544, -0.545103, 1, 1, 1, 1, 1,
-0.01040092, 1.568831, 0.2043358, 1, 1, 1, 1, 1,
-0.00923356, 0.04200631, -0.4572767, 1, 1, 1, 1, 1,
-0.007690107, -1.771047, -2.14641, 1, 1, 1, 1, 1,
-0.006655342, -0.7147348, -3.449211, 0, 0, 1, 1, 1,
-0.005799422, -0.4203226, -2.47708, 1, 0, 0, 1, 1,
-0.001441113, -1.289399, -2.973364, 1, 0, 0, 1, 1,
-0.0002645601, 1.214456, 0.02956923, 1, 0, 0, 1, 1,
0.0006345854, -0.3318629, 2.276203, 1, 0, 0, 1, 1,
0.003566607, 0.08307968, 0.7043793, 1, 0, 0, 1, 1,
0.003686434, -0.7093046, 2.490594, 0, 0, 0, 1, 1,
0.005334425, 0.2018749, 1.342024, 0, 0, 0, 1, 1,
0.007017713, -1.921503, 3.282992, 0, 0, 0, 1, 1,
0.01029766, 0.6203544, 0.3591021, 0, 0, 0, 1, 1,
0.01048045, -0.7122341, 1.786422, 0, 0, 0, 1, 1,
0.01520705, 0.864453, 0.1265841, 0, 0, 0, 1, 1,
0.01592727, -0.6480244, 4.7817, 0, 0, 0, 1, 1,
0.01598456, -0.156104, 3.815856, 1, 1, 1, 1, 1,
0.01956227, -1.545594, 3.383545, 1, 1, 1, 1, 1,
0.02513605, 0.09795308, 0.780407, 1, 1, 1, 1, 1,
0.02745578, 0.6121057, 0.8913718, 1, 1, 1, 1, 1,
0.03138631, -0.1878444, 1.836093, 1, 1, 1, 1, 1,
0.03332502, -0.2842399, 2.804529, 1, 1, 1, 1, 1,
0.034171, -0.9997157, 3.831543, 1, 1, 1, 1, 1,
0.03584353, -1.815535, 3.634794, 1, 1, 1, 1, 1,
0.03602942, -0.7054428, 2.703511, 1, 1, 1, 1, 1,
0.03720633, 0.7882099, 0.2617295, 1, 1, 1, 1, 1,
0.03949111, 1.287806, -0.8314453, 1, 1, 1, 1, 1,
0.0419455, 0.235156, 0.1963512, 1, 1, 1, 1, 1,
0.04226914, 0.221719, 0.3410802, 1, 1, 1, 1, 1,
0.04301818, 0.322156, 0.7437376, 1, 1, 1, 1, 1,
0.04421433, 1.570494, -1.52024, 1, 1, 1, 1, 1,
0.04825543, 1.303122, -0.05296797, 0, 0, 1, 1, 1,
0.05098986, -1.643118, 3.554729, 1, 0, 0, 1, 1,
0.05817222, -0.006634794, 1.269585, 1, 0, 0, 1, 1,
0.06134111, 0.03952441, 2.162568, 1, 0, 0, 1, 1,
0.06373759, 0.8141239, -0.550246, 1, 0, 0, 1, 1,
0.07297426, -1.164255, 6.001313, 1, 0, 0, 1, 1,
0.07337994, 1.307907, 1.775299, 0, 0, 0, 1, 1,
0.0742889, -0.3689369, 0.534187, 0, 0, 0, 1, 1,
0.07615602, 0.1870188, 0.2761574, 0, 0, 0, 1, 1,
0.07798737, 0.04497961, 1.533721, 0, 0, 0, 1, 1,
0.07827976, -0.739876, 4.47408, 0, 0, 0, 1, 1,
0.0807167, -0.9690049, 1.903556, 0, 0, 0, 1, 1,
0.08623249, -0.31067, 3.805065, 0, 0, 0, 1, 1,
0.08904909, 0.07583199, -0.1018062, 1, 1, 1, 1, 1,
0.09164797, -0.6446657, 3.273612, 1, 1, 1, 1, 1,
0.09391138, 1.333565, -0.782112, 1, 1, 1, 1, 1,
0.09450519, -1.321994, 3.140888, 1, 1, 1, 1, 1,
0.09908026, 1.153332, 1.508215, 1, 1, 1, 1, 1,
0.1011005, -1.127136, 2.695129, 1, 1, 1, 1, 1,
0.10693, -0.7908818, 2.953242, 1, 1, 1, 1, 1,
0.1071019, -0.05688873, 0.7553488, 1, 1, 1, 1, 1,
0.1081543, 0.349536, 0.8593376, 1, 1, 1, 1, 1,
0.1128316, -0.6093773, 3.438789, 1, 1, 1, 1, 1,
0.1204214, 0.7888087, 2.38809, 1, 1, 1, 1, 1,
0.1218638, -1.299275, 3.999509, 1, 1, 1, 1, 1,
0.1224382, 0.5179616, -0.5456815, 1, 1, 1, 1, 1,
0.1239351, -2.297221, 1.483394, 1, 1, 1, 1, 1,
0.1245401, -1.491293, 2.529432, 1, 1, 1, 1, 1,
0.1250287, -0.5319679, 2.859631, 0, 0, 1, 1, 1,
0.1255191, 0.9002422, 0.6159164, 1, 0, 0, 1, 1,
0.1284757, 0.8003713, 1.209936, 1, 0, 0, 1, 1,
0.130405, -1.56524, 3.370751, 1, 0, 0, 1, 1,
0.1311578, -1.446732, 5.57789, 1, 0, 0, 1, 1,
0.133074, -1.114616, 3.092394, 1, 0, 0, 1, 1,
0.1333535, 1.622038, 0.2417974, 0, 0, 0, 1, 1,
0.1338744, -1.043, 2.637703, 0, 0, 0, 1, 1,
0.1374962, 0.763549, -0.6556227, 0, 0, 0, 1, 1,
0.1395594, -0.284723, 2.419956, 0, 0, 0, 1, 1,
0.1424531, 0.04781175, 1.947494, 0, 0, 0, 1, 1,
0.1440558, -1.173528, 3.436749, 0, 0, 0, 1, 1,
0.1446219, -0.9814566, 4.347702, 0, 0, 0, 1, 1,
0.1524622, -1.047473, 2.093565, 1, 1, 1, 1, 1,
0.1558894, 0.1234336, 1.279545, 1, 1, 1, 1, 1,
0.1726597, -0.05517984, 1.102708, 1, 1, 1, 1, 1,
0.1771714, 0.04796233, 1.369125, 1, 1, 1, 1, 1,
0.1792514, 1.207161, 1.032724, 1, 1, 1, 1, 1,
0.1804313, -2.410465, 2.194957, 1, 1, 1, 1, 1,
0.1806971, 1.503591, 0.783953, 1, 1, 1, 1, 1,
0.1900245, 0.5746149, -1.102298, 1, 1, 1, 1, 1,
0.1911254, -1.462279, 4.223984, 1, 1, 1, 1, 1,
0.1928399, 0.1866804, 0.8553194, 1, 1, 1, 1, 1,
0.2006968, -1.268448, 2.82645, 1, 1, 1, 1, 1,
0.2024127, -0.154462, 2.622392, 1, 1, 1, 1, 1,
0.2027563, -0.273432, 3.564468, 1, 1, 1, 1, 1,
0.2043074, -0.3570253, 1.677763, 1, 1, 1, 1, 1,
0.2081116, -0.5703836, 3.398271, 1, 1, 1, 1, 1,
0.2094055, -0.4902086, 2.882936, 0, 0, 1, 1, 1,
0.2143798, 0.3989747, -0.6932282, 1, 0, 0, 1, 1,
0.2149878, 2.494601, 0.6690463, 1, 0, 0, 1, 1,
0.2154086, -0.3874072, 2.617203, 1, 0, 0, 1, 1,
0.2156517, 0.8559319, -0.8381801, 1, 0, 0, 1, 1,
0.2159712, 0.5310351, -0.3714383, 1, 0, 0, 1, 1,
0.2189479, 0.5191107, -1.02841, 0, 0, 0, 1, 1,
0.2194578, 0.3513091, 0.7839844, 0, 0, 0, 1, 1,
0.2211598, 1.954368, 1.899348, 0, 0, 0, 1, 1,
0.2234881, -0.6186337, 4.060641, 0, 0, 0, 1, 1,
0.2254901, -1.41669, 3.034467, 0, 0, 0, 1, 1,
0.2272317, 1.072237, 2.073864, 0, 0, 0, 1, 1,
0.2274781, -0.2091946, 3.41891, 0, 0, 0, 1, 1,
0.2300153, -0.329178, 1.886412, 1, 1, 1, 1, 1,
0.2334422, -0.4178528, 1.915035, 1, 1, 1, 1, 1,
0.233918, 0.4218951, -0.1963856, 1, 1, 1, 1, 1,
0.2341442, 1.354288, -0.4594864, 1, 1, 1, 1, 1,
0.2356721, -0.4570611, 3.6392, 1, 1, 1, 1, 1,
0.2374269, -0.66288, 1.71282, 1, 1, 1, 1, 1,
0.2377654, 1.374219, -1.203596, 1, 1, 1, 1, 1,
0.2411312, -3.099145, 3.981555, 1, 1, 1, 1, 1,
0.2456782, -0.02547075, 0.7338888, 1, 1, 1, 1, 1,
0.2496932, -0.5088697, 3.008397, 1, 1, 1, 1, 1,
0.2500361, 1.133082, -1.693828, 1, 1, 1, 1, 1,
0.251901, 0.4034081, 0.6957641, 1, 1, 1, 1, 1,
0.2528756, -0.03912727, 0.1126467, 1, 1, 1, 1, 1,
0.2658817, 0.715655, 0.3818947, 1, 1, 1, 1, 1,
0.2686424, 0.9720399, -1.035925, 1, 1, 1, 1, 1,
0.2763828, 1.460545, -0.1954201, 0, 0, 1, 1, 1,
0.2797621, 0.979874, -0.3646638, 1, 0, 0, 1, 1,
0.2822452, 0.3922797, 0.3118109, 1, 0, 0, 1, 1,
0.2834055, -0.3083089, 5.041728, 1, 0, 0, 1, 1,
0.2838714, -2.335278, 2.458604, 1, 0, 0, 1, 1,
0.283986, -0.3079724, 4.010684, 1, 0, 0, 1, 1,
0.2862859, 0.1903832, 3.515396, 0, 0, 0, 1, 1,
0.2879909, -0.3193837, 3.007804, 0, 0, 0, 1, 1,
0.2993102, -0.1351338, 2.818122, 0, 0, 0, 1, 1,
0.3038372, 1.664027, 0.3703516, 0, 0, 0, 1, 1,
0.3056953, 0.4548008, 0.5030857, 0, 0, 0, 1, 1,
0.3059853, 0.7922066, 1.690079, 0, 0, 0, 1, 1,
0.3075094, -1.714647, 1.742495, 0, 0, 0, 1, 1,
0.3088023, 0.1710756, 1.640166, 1, 1, 1, 1, 1,
0.3102611, -0.5870602, 0.5616269, 1, 1, 1, 1, 1,
0.3128387, 2.03596, 0.6530315, 1, 1, 1, 1, 1,
0.3220683, 0.2937819, -0.1168509, 1, 1, 1, 1, 1,
0.3222328, -0.2260264, 2.963371, 1, 1, 1, 1, 1,
0.3232512, -1.042058, 4.668623, 1, 1, 1, 1, 1,
0.3259687, 1.288315, -0.9009975, 1, 1, 1, 1, 1,
0.3319084, 0.3405404, 0.6238999, 1, 1, 1, 1, 1,
0.3338186, 0.1483493, 0.8316694, 1, 1, 1, 1, 1,
0.3343396, 0.5354091, 0.9646807, 1, 1, 1, 1, 1,
0.3459661, 0.7177609, -0.181776, 1, 1, 1, 1, 1,
0.353949, 0.09088718, 3.61065, 1, 1, 1, 1, 1,
0.3571408, -0.7069001, 3.875468, 1, 1, 1, 1, 1,
0.3593669, -0.09258388, 1.743824, 1, 1, 1, 1, 1,
0.3629649, 1.634511, -0.7426092, 1, 1, 1, 1, 1,
0.3662042, -0.1855145, 1.892729, 0, 0, 1, 1, 1,
0.3685525, -1.484866, 1.098353, 1, 0, 0, 1, 1,
0.3688847, 0.605909, 1.434364, 1, 0, 0, 1, 1,
0.3752179, 0.09446292, 1.049761, 1, 0, 0, 1, 1,
0.3789962, 0.3561183, 1.081823, 1, 0, 0, 1, 1,
0.3803065, -0.502026, 2.407661, 1, 0, 0, 1, 1,
0.3846256, 2.011567, -0.0366367, 0, 0, 0, 1, 1,
0.3848483, -0.2472126, 2.539417, 0, 0, 0, 1, 1,
0.3861377, 0.5517991, 0.7873771, 0, 0, 0, 1, 1,
0.3915863, -1.864705, 2.327795, 0, 0, 0, 1, 1,
0.3919649, -2.126615, 3.074418, 0, 0, 0, 1, 1,
0.3946607, 1.118576, 0.6315463, 0, 0, 0, 1, 1,
0.3966002, 0.7931139, -0.1128822, 0, 0, 0, 1, 1,
0.3982908, -1.912825, 3.82657, 1, 1, 1, 1, 1,
0.4015637, 0.3015617, 0.805382, 1, 1, 1, 1, 1,
0.4025185, 0.2972226, 1.523255, 1, 1, 1, 1, 1,
0.4046873, -0.7801536, 2.316478, 1, 1, 1, 1, 1,
0.4050571, 0.9711509, -0.6763936, 1, 1, 1, 1, 1,
0.4080347, -0.7995028, 1.903847, 1, 1, 1, 1, 1,
0.408059, -0.3598717, 3.300263, 1, 1, 1, 1, 1,
0.4130825, -0.1704199, 3.975156, 1, 1, 1, 1, 1,
0.4146543, 0.145691, 2.023508, 1, 1, 1, 1, 1,
0.4169754, -1.11286, 3.497278, 1, 1, 1, 1, 1,
0.4178099, -1.499419, 2.703437, 1, 1, 1, 1, 1,
0.4192387, 0.1290095, 1.26599, 1, 1, 1, 1, 1,
0.4200481, 0.102998, 1.583221, 1, 1, 1, 1, 1,
0.4205307, -1.891302, 1.265298, 1, 1, 1, 1, 1,
0.4240496, -1.891482, 0.7174371, 1, 1, 1, 1, 1,
0.4285506, 2.689783, -1.574436, 0, 0, 1, 1, 1,
0.4286734, 0.2993434, -0.5252137, 1, 0, 0, 1, 1,
0.4306043, 0.6887136, 0.3716454, 1, 0, 0, 1, 1,
0.4346741, 0.2955635, 1.220043, 1, 0, 0, 1, 1,
0.4349082, -0.1776965, 1.127499, 1, 0, 0, 1, 1,
0.4383187, -0.9955779, 2.844462, 1, 0, 0, 1, 1,
0.4402069, -1.250185, 1.536447, 0, 0, 0, 1, 1,
0.4462223, 1.255522, -0.4237076, 0, 0, 0, 1, 1,
0.4472479, 0.8642237, -0.8547206, 0, 0, 0, 1, 1,
0.44927, -0.377317, 2.620648, 0, 0, 0, 1, 1,
0.4499005, -0.6003258, 4.116652, 0, 0, 0, 1, 1,
0.4500122, 2.057617, -1.507411, 0, 0, 0, 1, 1,
0.4562354, 1.65959, 0.1720662, 0, 0, 0, 1, 1,
0.4564831, 1.320848, -0.2475846, 1, 1, 1, 1, 1,
0.457299, 0.1950972, 0.665878, 1, 1, 1, 1, 1,
0.4613182, 1.240766, -0.3362114, 1, 1, 1, 1, 1,
0.4631377, 0.1377281, 1.057522, 1, 1, 1, 1, 1,
0.4644976, -0.02630896, 2.190306, 1, 1, 1, 1, 1,
0.4648275, 0.002719707, 0.6290301, 1, 1, 1, 1, 1,
0.4648468, 0.8670827, -0.7265952, 1, 1, 1, 1, 1,
0.4656825, 0.0150567, 1.386292, 1, 1, 1, 1, 1,
0.4673619, 1.111347, -0.1793147, 1, 1, 1, 1, 1,
0.4715818, 0.6469161, 0.3247341, 1, 1, 1, 1, 1,
0.4721887, -1.298047, 3.438408, 1, 1, 1, 1, 1,
0.473392, -1.171089, 3.285359, 1, 1, 1, 1, 1,
0.4741057, 0.4876516, 1.659076, 1, 1, 1, 1, 1,
0.4795108, -3.120183, 2.395192, 1, 1, 1, 1, 1,
0.4795846, -2.997581, 1.741274, 1, 1, 1, 1, 1,
0.4807144, 0.01165092, 0.4297339, 0, 0, 1, 1, 1,
0.4846832, 0.3476985, 1.003874, 1, 0, 0, 1, 1,
0.4928591, 0.1025114, 2.318319, 1, 0, 0, 1, 1,
0.4942711, -0.8458316, 2.883129, 1, 0, 0, 1, 1,
0.4983863, -0.08136062, 2.067128, 1, 0, 0, 1, 1,
0.4998197, 1.611662, -2.451305, 1, 0, 0, 1, 1,
0.5051671, 0.5454589, 0.8113902, 0, 0, 0, 1, 1,
0.5091014, 0.2130492, 1.498196, 0, 0, 0, 1, 1,
0.509186, 0.6445569, 1.789734, 0, 0, 0, 1, 1,
0.5098759, -1.248202, 3.374348, 0, 0, 0, 1, 1,
0.5148872, -0.1162389, 0.1198381, 0, 0, 0, 1, 1,
0.5168191, -0.172216, 3.342051, 0, 0, 0, 1, 1,
0.5185535, 1.354633, -0.4959822, 0, 0, 0, 1, 1,
0.521006, -1.111843, 1.678471, 1, 1, 1, 1, 1,
0.5310572, -0.1001932, 0.6778637, 1, 1, 1, 1, 1,
0.5320759, 1.199506, -0.7684559, 1, 1, 1, 1, 1,
0.5321286, -1.404687, 2.425494, 1, 1, 1, 1, 1,
0.5329106, -0.3724769, 2.156232, 1, 1, 1, 1, 1,
0.5352812, -0.7467479, 3.262859, 1, 1, 1, 1, 1,
0.5354711, -1.598303, 1.974992, 1, 1, 1, 1, 1,
0.5360719, 1.224327, -0.9307879, 1, 1, 1, 1, 1,
0.5369878, -1.929856, 2.33996, 1, 1, 1, 1, 1,
0.5390853, 0.702707, -0.06821068, 1, 1, 1, 1, 1,
0.5398488, 0.2214257, -0.2728848, 1, 1, 1, 1, 1,
0.5418421, -0.1822899, -0.2804738, 1, 1, 1, 1, 1,
0.5426722, 0.8626099, 1.385077, 1, 1, 1, 1, 1,
0.5457933, -0.7793986, 2.27504, 1, 1, 1, 1, 1,
0.5471885, -0.2851757, 1.528088, 1, 1, 1, 1, 1,
0.5489176, 1.738144, 1.793766, 0, 0, 1, 1, 1,
0.5543727, 0.1749906, 1.96434, 1, 0, 0, 1, 1,
0.5582829, -1.013809, 4.484473, 1, 0, 0, 1, 1,
0.5617145, 1.554777, -0.1506755, 1, 0, 0, 1, 1,
0.5621241, -1.294355, 1.92479, 1, 0, 0, 1, 1,
0.5671635, -0.2340721, 2.962977, 1, 0, 0, 1, 1,
0.5716236, 0.5282982, 1.994706, 0, 0, 0, 1, 1,
0.578328, -0.9040656, 1.192169, 0, 0, 0, 1, 1,
0.5826586, 0.6432315, 1.424212, 0, 0, 0, 1, 1,
0.5831414, -0.05451, 0.2967775, 0, 0, 0, 1, 1,
0.5864506, 0.2486679, 1.480208, 0, 0, 0, 1, 1,
0.5901868, 0.9246925, 3.070583, 0, 0, 0, 1, 1,
0.5917225, 0.04262664, 2.414491, 0, 0, 0, 1, 1,
0.5927637, -0.4262282, 3.812989, 1, 1, 1, 1, 1,
0.593636, -0.4437308, 1.369549, 1, 1, 1, 1, 1,
0.5963596, -0.7478398, 2.335031, 1, 1, 1, 1, 1,
0.5964422, -0.7874463, 4.253963, 1, 1, 1, 1, 1,
0.596544, -0.1194151, 1.010065, 1, 1, 1, 1, 1,
0.6018729, -0.9004764, 2.704567, 1, 1, 1, 1, 1,
0.6033657, -2.27282, 2.553143, 1, 1, 1, 1, 1,
0.6038221, -1.372884, 3.952209, 1, 1, 1, 1, 1,
0.6041664, 0.562704, 1.542041, 1, 1, 1, 1, 1,
0.6097234, 0.4347918, 1.92864, 1, 1, 1, 1, 1,
0.6118739, 1.511126, -0.2297623, 1, 1, 1, 1, 1,
0.6137228, 1.064877, 0.3527762, 1, 1, 1, 1, 1,
0.6158118, 1.537305, 0.9211894, 1, 1, 1, 1, 1,
0.6182774, -0.2329908, 2.94015, 1, 1, 1, 1, 1,
0.6237796, -1.269853, 2.928707, 1, 1, 1, 1, 1,
0.6243839, -0.6155787, 2.455901, 0, 0, 1, 1, 1,
0.627286, 1.727368, -0.1196566, 1, 0, 0, 1, 1,
0.628361, -1.158668, 2.815914, 1, 0, 0, 1, 1,
0.6287427, -0.7039997, 3.08335, 1, 0, 0, 1, 1,
0.6299503, 0.09906515, 1.565001, 1, 0, 0, 1, 1,
0.6312752, -2.144047, 2.311181, 1, 0, 0, 1, 1,
0.6332455, -1.224162, 2.131516, 0, 0, 0, 1, 1,
0.6340318, -0.3264841, 2.259207, 0, 0, 0, 1, 1,
0.638165, 1.74283, -0.6539335, 0, 0, 0, 1, 1,
0.6384022, -1.788403, 3.957065, 0, 0, 0, 1, 1,
0.6410103, -1.534592, 4.582384, 0, 0, 0, 1, 1,
0.6505912, -0.3148066, 2.05203, 0, 0, 0, 1, 1,
0.6522241, 0.6303339, 0.5694578, 0, 0, 0, 1, 1,
0.653242, -0.5138046, 3.25716, 1, 1, 1, 1, 1,
0.6580001, -0.2854364, 1.10959, 1, 1, 1, 1, 1,
0.6587539, 0.1419993, 0.4992086, 1, 1, 1, 1, 1,
0.6659694, -0.5581899, 2.988522, 1, 1, 1, 1, 1,
0.6674023, -0.7151574, 0.9855435, 1, 1, 1, 1, 1,
0.6684558, -0.4930834, 4.005243, 1, 1, 1, 1, 1,
0.6696348, 0.2841332, 2.488719, 1, 1, 1, 1, 1,
0.6728044, 0.9538403, 1.104083, 1, 1, 1, 1, 1,
0.6763036, 2.337803, 1.116596, 1, 1, 1, 1, 1,
0.6770439, -0.3546323, 0.5269696, 1, 1, 1, 1, 1,
0.680429, -0.1231044, 3.674037, 1, 1, 1, 1, 1,
0.6829209, 0.6567946, 3.55699, 1, 1, 1, 1, 1,
0.6834143, 0.1274161, 3.120041, 1, 1, 1, 1, 1,
0.6908694, -1.569557, 2.491328, 1, 1, 1, 1, 1,
0.6957659, -1.301051, 2.748636, 1, 1, 1, 1, 1,
0.6968331, 0.09899528, 2.439253, 0, 0, 1, 1, 1,
0.7081833, 0.1539723, 1.645506, 1, 0, 0, 1, 1,
0.7092938, 1.288092, 1.360894, 1, 0, 0, 1, 1,
0.7119243, 0.2686011, 1.41303, 1, 0, 0, 1, 1,
0.7134631, -0.9549494, 5.375537, 1, 0, 0, 1, 1,
0.71484, -0.5847594, 2.641016, 1, 0, 0, 1, 1,
0.7196286, 0.8764921, 1.775229, 0, 0, 0, 1, 1,
0.7198559, 1.773676, -0.3399758, 0, 0, 0, 1, 1,
0.723843, -0.2955902, 3.190705, 0, 0, 0, 1, 1,
0.725793, 0.9129479, 0.1220227, 0, 0, 0, 1, 1,
0.7280232, 0.3603958, 3.426633, 0, 0, 0, 1, 1,
0.7283592, 1.57329, 0.1224105, 0, 0, 0, 1, 1,
0.7442477, -0.1863903, 3.049809, 0, 0, 0, 1, 1,
0.7473039, 0.200768, 0.5147123, 1, 1, 1, 1, 1,
0.748471, -0.4703773, 0.8666631, 1, 1, 1, 1, 1,
0.7594393, -1.216023, 2.8862, 1, 1, 1, 1, 1,
0.7597191, -0.236734, 0.3783592, 1, 1, 1, 1, 1,
0.7606701, 0.0359838, 2.21926, 1, 1, 1, 1, 1,
0.774895, -1.303373, 3.084608, 1, 1, 1, 1, 1,
0.7755206, 1.132768, 1.06555, 1, 1, 1, 1, 1,
0.7770124, -1.662738, 1.412429, 1, 1, 1, 1, 1,
0.7772384, 0.8997934, 2.164753, 1, 1, 1, 1, 1,
0.7836679, -0.1845906, 0.611852, 1, 1, 1, 1, 1,
0.7870792, 1.301947, 0.8254969, 1, 1, 1, 1, 1,
0.7900748, -0.1454833, -0.1245297, 1, 1, 1, 1, 1,
0.7921295, -0.4626598, 3.793577, 1, 1, 1, 1, 1,
0.7946655, 0.9974912, 0.6209031, 1, 1, 1, 1, 1,
0.8039172, 0.09981768, -0.873128, 1, 1, 1, 1, 1,
0.8050395, -1.205439, 1.98397, 0, 0, 1, 1, 1,
0.8064653, 0.327952, 1.938933, 1, 0, 0, 1, 1,
0.8114915, 0.148434, 1.86886, 1, 0, 0, 1, 1,
0.8148618, -0.7904694, 2.322854, 1, 0, 0, 1, 1,
0.8154947, 0.9545085, 0.687811, 1, 0, 0, 1, 1,
0.8172449, -0.2370092, 3.04832, 1, 0, 0, 1, 1,
0.8172801, 0.3351694, 0.3034771, 0, 0, 0, 1, 1,
0.8188488, -0.4374002, 2.545579, 0, 0, 0, 1, 1,
0.8235602, 1.015824, -0.2586302, 0, 0, 0, 1, 1,
0.8252487, 0.009504694, 1.111338, 0, 0, 0, 1, 1,
0.8298002, -1.17316, 3.121744, 0, 0, 0, 1, 1,
0.8326658, -0.7445691, 1.898398, 0, 0, 0, 1, 1,
0.8347657, -0.3027852, 1.952992, 0, 0, 0, 1, 1,
0.8374156, -0.05560724, 1.186951, 1, 1, 1, 1, 1,
0.8386134, 0.3189867, -0.5043235, 1, 1, 1, 1, 1,
0.8446939, 0.1330108, 0.7664782, 1, 1, 1, 1, 1,
0.8472829, 1.391558, 0.3835419, 1, 1, 1, 1, 1,
0.8502936, 0.2224521, -0.1572368, 1, 1, 1, 1, 1,
0.8507941, -0.2508455, 1.989679, 1, 1, 1, 1, 1,
0.8545392, -0.6354652, 3.347371, 1, 1, 1, 1, 1,
0.8570716, 0.1031631, 1.611729, 1, 1, 1, 1, 1,
0.8589731, 0.9436321, -0.7564478, 1, 1, 1, 1, 1,
0.8628798, -0.8902467, 1.549724, 1, 1, 1, 1, 1,
0.8684101, 0.6131205, -0.2026398, 1, 1, 1, 1, 1,
0.869081, -1.543864, 2.3408, 1, 1, 1, 1, 1,
0.8730017, 0.3173463, 1.887012, 1, 1, 1, 1, 1,
0.873205, 0.8623821, 1.227346, 1, 1, 1, 1, 1,
0.8740952, -0.186017, 2.011205, 1, 1, 1, 1, 1,
0.8780889, 0.9573669, 1.772102, 0, 0, 1, 1, 1,
0.8859035, 0.9475967, 0.327167, 1, 0, 0, 1, 1,
0.8973354, 0.462971, 1.828217, 1, 0, 0, 1, 1,
0.89974, -0.8122802, 2.083459, 1, 0, 0, 1, 1,
0.9036079, -0.8067597, 2.905576, 1, 0, 0, 1, 1,
0.9055321, -0.8848555, 3.908087, 1, 0, 0, 1, 1,
0.9142274, 1.526437, -0.4467175, 0, 0, 0, 1, 1,
0.9153637, 1.368389, -0.1231546, 0, 0, 0, 1, 1,
0.9176098, -0.5115267, 1.886606, 0, 0, 0, 1, 1,
0.9281799, -2.068464, 1.548465, 0, 0, 0, 1, 1,
0.9347361, -0.5839988, 2.945439, 0, 0, 0, 1, 1,
0.9354138, -0.7293884, 2.361711, 0, 0, 0, 1, 1,
0.9408222, 0.4920972, 3.628928, 0, 0, 0, 1, 1,
0.9425305, -1.337583, 4.986006, 1, 1, 1, 1, 1,
0.9476855, 1.359314, 0.8671044, 1, 1, 1, 1, 1,
0.9558799, 0.67995, 0.678034, 1, 1, 1, 1, 1,
0.9564088, -0.2112993, 1.633931, 1, 1, 1, 1, 1,
0.9640276, 0.3640744, 1.533364, 1, 1, 1, 1, 1,
0.9667996, -1.325211, 1.538817, 1, 1, 1, 1, 1,
0.9740269, -0.8688306, 3.707323, 1, 1, 1, 1, 1,
0.9778717, 1.666565, 1.179402, 1, 1, 1, 1, 1,
0.9798238, 0.5522084, -0.3092048, 1, 1, 1, 1, 1,
0.9819373, 0.04300162, 0.7727947, 1, 1, 1, 1, 1,
0.9887523, 0.3777249, 2.151356, 1, 1, 1, 1, 1,
0.9987599, 0.3982449, 1.506495, 1, 1, 1, 1, 1,
0.9991816, 0.2977295, 1.202341, 1, 1, 1, 1, 1,
1.003208, 0.4544868, 1.315052, 1, 1, 1, 1, 1,
1.008722, -0.2591482, 1.033125, 1, 1, 1, 1, 1,
1.009109, -0.8616486, 4.196208, 0, 0, 1, 1, 1,
1.018001, -0.8332032, 2.762086, 1, 0, 0, 1, 1,
1.019479, -0.3544092, 3.866621, 1, 0, 0, 1, 1,
1.021439, -0.5275632, 1.093966, 1, 0, 0, 1, 1,
1.025108, 0.3137521, 2.004694, 1, 0, 0, 1, 1,
1.027834, 1.629092, 3.243232, 1, 0, 0, 1, 1,
1.027975, -0.4844421, 2.009068, 0, 0, 0, 1, 1,
1.030842, -0.6702976, 1.501947, 0, 0, 0, 1, 1,
1.03171, -0.6297643, 2.234109, 0, 0, 0, 1, 1,
1.032802, -0.5930112, 1.297058, 0, 0, 0, 1, 1,
1.042471, 0.9948611, 0.02878826, 0, 0, 0, 1, 1,
1.048334, -0.6720467, 1.70458, 0, 0, 0, 1, 1,
1.052271, -2.001574, 3.052678, 0, 0, 0, 1, 1,
1.052962, 0.7563651, 0.7688961, 1, 1, 1, 1, 1,
1.054513, 0.8005667, 1.704465, 1, 1, 1, 1, 1,
1.064319, -0.1052757, 3.785635, 1, 1, 1, 1, 1,
1.064475, 1.105075, 0.04139214, 1, 1, 1, 1, 1,
1.070597, -1.438833, 2.666166, 1, 1, 1, 1, 1,
1.08076, -1.176511, 2.539158, 1, 1, 1, 1, 1,
1.08258, -0.2661602, 1.657332, 1, 1, 1, 1, 1,
1.086596, -1.783935, 1.420369, 1, 1, 1, 1, 1,
1.094215, -0.4942705, 2.1275, 1, 1, 1, 1, 1,
1.09436, -1.035204, 1.488618, 1, 1, 1, 1, 1,
1.097883, 0.02328937, 4.183329, 1, 1, 1, 1, 1,
1.10206, -2.264284, 2.847388, 1, 1, 1, 1, 1,
1.104319, -1.778227, 2.914497, 1, 1, 1, 1, 1,
1.108139, -0.2891051, 3.449839, 1, 1, 1, 1, 1,
1.126191, 0.3481205, 1.939063, 1, 1, 1, 1, 1,
1.136189, -0.1966235, 2.613537, 0, 0, 1, 1, 1,
1.138155, -0.1805191, 3.563048, 1, 0, 0, 1, 1,
1.147452, 0.550049, 1.41884, 1, 0, 0, 1, 1,
1.147954, 1.200175, 1.757684, 1, 0, 0, 1, 1,
1.151404, 0.2683245, 0.4994292, 1, 0, 0, 1, 1,
1.156522, 0.5431862, 0.1010126, 1, 0, 0, 1, 1,
1.158239, 0.3604357, 0.2412262, 0, 0, 0, 1, 1,
1.164355, -0.6266074, 0.8068928, 0, 0, 0, 1, 1,
1.175215, 0.786046, 0.5017028, 0, 0, 0, 1, 1,
1.185679, -0.5305974, 2.707074, 0, 0, 0, 1, 1,
1.187034, -1.334891, 1.285946, 0, 0, 0, 1, 1,
1.195612, 0.8446701, 0.1284381, 0, 0, 0, 1, 1,
1.225295, 0.1468222, 0.9901343, 0, 0, 0, 1, 1,
1.226919, 1.358351, -0.09147133, 1, 1, 1, 1, 1,
1.230035, 0.4393741, 1.508628, 1, 1, 1, 1, 1,
1.230064, 0.7468557, 0.92918, 1, 1, 1, 1, 1,
1.231266, -2.090967, 2.637045, 1, 1, 1, 1, 1,
1.23522, 0.06112844, 2.402848, 1, 1, 1, 1, 1,
1.240396, -0.2185112, 2.580784, 1, 1, 1, 1, 1,
1.244233, -1.216397, 2.892385, 1, 1, 1, 1, 1,
1.247122, 0.18319, 1.809863, 1, 1, 1, 1, 1,
1.24839, 1.962847, 0.05404188, 1, 1, 1, 1, 1,
1.261829, 2.845826, 0.3486298, 1, 1, 1, 1, 1,
1.26964, 2.039112, 1.185309, 1, 1, 1, 1, 1,
1.278211, 1.480876, 1.081348, 1, 1, 1, 1, 1,
1.286374, -0.5388035, 3.145379, 1, 1, 1, 1, 1,
1.289694, -0.6828957, 3.816901, 1, 1, 1, 1, 1,
1.292537, -0.8006202, 2.618163, 1, 1, 1, 1, 1,
1.292769, -0.4022802, 3.563839, 0, 0, 1, 1, 1,
1.302557, 0.734016, 1.909504, 1, 0, 0, 1, 1,
1.307642, -0.08095896, 0.3153329, 1, 0, 0, 1, 1,
1.314722, 2.643153, 0.5464349, 1, 0, 0, 1, 1,
1.318275, 2.653004, -0.9006593, 1, 0, 0, 1, 1,
1.334844, 0.5851755, 2.74375, 1, 0, 0, 1, 1,
1.34069, 1.289532, 0.07967639, 0, 0, 0, 1, 1,
1.343818, -1.247191, 2.58239, 0, 0, 0, 1, 1,
1.344095, -1.350246, 0.2137566, 0, 0, 0, 1, 1,
1.346222, 0.8644446, 0.5745986, 0, 0, 0, 1, 1,
1.346361, 0.9363709, 0.8183473, 0, 0, 0, 1, 1,
1.359694, 0.1374312, 0.8938114, 0, 0, 0, 1, 1,
1.376397, 0.6855031, 2.191502, 0, 0, 0, 1, 1,
1.387159, -0.6061481, 1.851655, 1, 1, 1, 1, 1,
1.402399, -1.109676, 3.039121, 1, 1, 1, 1, 1,
1.402745, -0.1742105, 2.898981, 1, 1, 1, 1, 1,
1.411536, 0.2417872, 0.5001608, 1, 1, 1, 1, 1,
1.41388, -0.7539619, 2.452854, 1, 1, 1, 1, 1,
1.424707, -0.4338752, 2.312718, 1, 1, 1, 1, 1,
1.433169, -1.10821, 1.49471, 1, 1, 1, 1, 1,
1.438036, 0.6645718, 1.926241, 1, 1, 1, 1, 1,
1.455059, -0.8377959, 3.250318, 1, 1, 1, 1, 1,
1.473459, -0.4889974, 1.471827, 1, 1, 1, 1, 1,
1.499115, 0.5209267, 0.963661, 1, 1, 1, 1, 1,
1.5023, 1.937648, 0.5285017, 1, 1, 1, 1, 1,
1.513222, -0.2755083, 1.147454, 1, 1, 1, 1, 1,
1.515976, 0.5840386, 0.9105443, 1, 1, 1, 1, 1,
1.530568, 1.122662, 1.818557, 1, 1, 1, 1, 1,
1.561725, 0.5770586, 2.145251, 0, 0, 1, 1, 1,
1.564895, 0.3790439, 0.1197954, 1, 0, 0, 1, 1,
1.576079, -1.557919, 3.791808, 1, 0, 0, 1, 1,
1.583634, 0.4966825, 2.713806, 1, 0, 0, 1, 1,
1.602506, 0.2991698, 0.5909472, 1, 0, 0, 1, 1,
1.608008, 0.8177417, 1.004006, 1, 0, 0, 1, 1,
1.62196, -2.211211, 2.401252, 0, 0, 0, 1, 1,
1.645769, 0.9105355, 3.507758, 0, 0, 0, 1, 1,
1.679877, -0.5536923, 1.724037, 0, 0, 0, 1, 1,
1.684355, -0.2896779, 1.971316, 0, 0, 0, 1, 1,
1.692441, -0.4008081, -0.05203293, 0, 0, 0, 1, 1,
1.696687, 0.769947, 2.183424, 0, 0, 0, 1, 1,
1.702528, 0.1134483, 2.907772, 0, 0, 0, 1, 1,
1.769239, 1.073365, 0.1147266, 1, 1, 1, 1, 1,
1.773422, -0.1860475, 1.739807, 1, 1, 1, 1, 1,
1.774294, -1.853125, 2.802426, 1, 1, 1, 1, 1,
1.777895, -0.5592791, 2.213968, 1, 1, 1, 1, 1,
1.802917, 0.1214719, 1.598069, 1, 1, 1, 1, 1,
1.817724, 0.8508519, 1.975016, 1, 1, 1, 1, 1,
1.840156, -0.1442823, -0.1023794, 1, 1, 1, 1, 1,
1.84548, 0.772545, -0.4645021, 1, 1, 1, 1, 1,
1.869441, -0.5146499, 1.877305, 1, 1, 1, 1, 1,
1.869817, 0.2363256, 1.89902, 1, 1, 1, 1, 1,
1.901997, 1.144049, 0.8942479, 1, 1, 1, 1, 1,
1.943323, -1.424066, 0.933313, 1, 1, 1, 1, 1,
1.967324, -0.06540725, 3.850402, 1, 1, 1, 1, 1,
1.969716, 0.7369375, 3.278027, 1, 1, 1, 1, 1,
1.976525, -0.5460945, 1.22346, 1, 1, 1, 1, 1,
1.980536, -0.201819, 1.492516, 0, 0, 1, 1, 1,
2.005851, 0.2921829, 0.7165028, 1, 0, 0, 1, 1,
2.018235, 0.7212184, 0.6049721, 1, 0, 0, 1, 1,
2.028218, -0.6072091, 3.39978, 1, 0, 0, 1, 1,
2.042261, -1.133897, 1.499217, 1, 0, 0, 1, 1,
2.109925, -2.378118, 0.5765325, 1, 0, 0, 1, 1,
2.11523, -0.2621385, 2.931216, 0, 0, 0, 1, 1,
2.148236, 0.4734462, 2.351916, 0, 0, 0, 1, 1,
2.155462, 1.615267, 1.659971, 0, 0, 0, 1, 1,
2.175738, 0.2776101, 1.767885, 0, 0, 0, 1, 1,
2.195295, 0.005276703, 0.5845455, 0, 0, 0, 1, 1,
2.244736, 0.08668194, 1.208896, 0, 0, 0, 1, 1,
2.266058, -0.9268227, 2.175148, 0, 0, 0, 1, 1,
2.28272, -1.398065, 2.520455, 1, 1, 1, 1, 1,
2.29657, -1.304136, 2.010847, 1, 1, 1, 1, 1,
2.338894, -0.1223959, 2.053414, 1, 1, 1, 1, 1,
2.371488, -0.5628803, 0.6448352, 1, 1, 1, 1, 1,
2.437894, -0.8447899, 1.240341, 1, 1, 1, 1, 1,
2.6125, -0.4620411, 1.054137, 1, 1, 1, 1, 1,
2.637893, -1.097952, 1.453182, 1, 1, 1, 1, 1
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
var radius = 9.794968;
var distance = 34.40441;
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
mvMatrix.translate( 0.3241882, -0.0001349449, -0.1737726 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.40441);
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
