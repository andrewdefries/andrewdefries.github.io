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
-2.76845, -2.52439, -2.502903, 1, 0, 0, 1,
-2.747063, -1.666726, -1.830692, 1, 0.007843138, 0, 1,
-2.658745, -1.009711, -2.162339, 1, 0.01176471, 0, 1,
-2.641566, 0.5087889, -0.6090144, 1, 0.01960784, 0, 1,
-2.578847, -0.241773, -1.994844, 1, 0.02352941, 0, 1,
-2.486456, 1.186539, -1.706206, 1, 0.03137255, 0, 1,
-2.458707, -0.6055298, -0.883964, 1, 0.03529412, 0, 1,
-2.443032, 1.12257, -1.198775, 1, 0.04313726, 0, 1,
-2.416067, -0.9377521, -1.606026, 1, 0.04705882, 0, 1,
-2.340483, -0.6670963, -3.336694, 1, 0.05490196, 0, 1,
-2.330835, -0.01887988, -1.578103, 1, 0.05882353, 0, 1,
-2.281676, -0.5231898, -1.103568, 1, 0.06666667, 0, 1,
-2.247948, -0.470016, -1.225772, 1, 0.07058824, 0, 1,
-2.211573, -0.3307338, -1.769739, 1, 0.07843138, 0, 1,
-2.205698, -0.2895815, -0.8396349, 1, 0.08235294, 0, 1,
-2.204338, -1.108601, -2.479538, 1, 0.09019608, 0, 1,
-2.156019, 0.3407408, -3.075419, 1, 0.09411765, 0, 1,
-2.150095, -0.5780835, -4.135936, 1, 0.1019608, 0, 1,
-2.12961, -2.003772, -3.260358, 1, 0.1098039, 0, 1,
-2.110643, 0.7603459, -1.225533, 1, 0.1137255, 0, 1,
-2.103971, 1.114809, -0.4057222, 1, 0.1215686, 0, 1,
-2.058553, 0.5965518, -0.4990563, 1, 0.1254902, 0, 1,
-2.049657, 0.8745286, -2.033994, 1, 0.1333333, 0, 1,
-2.005736, 0.04337135, -1.039292, 1, 0.1372549, 0, 1,
-1.989511, 0.08878414, 0.4362208, 1, 0.145098, 0, 1,
-1.979313, 0.8663189, -0.3665156, 1, 0.1490196, 0, 1,
-1.96831, 1.422156, -2.499975, 1, 0.1568628, 0, 1,
-1.938873, 0.9632111, -1.049946, 1, 0.1607843, 0, 1,
-1.925712, -0.8574702, -2.259809, 1, 0.1686275, 0, 1,
-1.922537, 1.431038, -2.115056, 1, 0.172549, 0, 1,
-1.906713, 0.2031751, -2.038826, 1, 0.1803922, 0, 1,
-1.902423, 1.554693, -0.6283925, 1, 0.1843137, 0, 1,
-1.893325, -0.6737733, -3.230418, 1, 0.1921569, 0, 1,
-1.861359, -0.02845125, -1.678332, 1, 0.1960784, 0, 1,
-1.845204, -0.3932039, -1.872441, 1, 0.2039216, 0, 1,
-1.842978, -1.5587, -1.637625, 1, 0.2117647, 0, 1,
-1.825506, -0.7466453, -2.764607, 1, 0.2156863, 0, 1,
-1.819581, 1.196957, -0.9517282, 1, 0.2235294, 0, 1,
-1.802475, -0.8854855, -0.03590764, 1, 0.227451, 0, 1,
-1.787184, -0.8184337, -1.971389, 1, 0.2352941, 0, 1,
-1.786234, 0.7102908, -1.145766, 1, 0.2392157, 0, 1,
-1.781186, 0.3044997, -0.9498124, 1, 0.2470588, 0, 1,
-1.778665, 0.5401376, -2.239784, 1, 0.2509804, 0, 1,
-1.76079, -0.6638079, -3.691169, 1, 0.2588235, 0, 1,
-1.758476, -0.9477037, -2.224275, 1, 0.2627451, 0, 1,
-1.723144, 0.3611193, -0.6248526, 1, 0.2705882, 0, 1,
-1.713965, -1.892144, -2.387951, 1, 0.2745098, 0, 1,
-1.710201, -0.8241153, -2.045161, 1, 0.282353, 0, 1,
-1.693065, -0.76827, -0.528477, 1, 0.2862745, 0, 1,
-1.691125, 1.155459, -0.1524516, 1, 0.2941177, 0, 1,
-1.685002, -0.7114663, -2.64322, 1, 0.3019608, 0, 1,
-1.66019, 1.086881, -0.553308, 1, 0.3058824, 0, 1,
-1.656644, 0.2358462, -1.885255, 1, 0.3137255, 0, 1,
-1.653026, 1.454804, -2.041972, 1, 0.3176471, 0, 1,
-1.646159, 0.06105828, -3.341095, 1, 0.3254902, 0, 1,
-1.640458, -0.9567656, -0.9079924, 1, 0.3294118, 0, 1,
-1.639371, -1.641774, -2.040291, 1, 0.3372549, 0, 1,
-1.636008, 2.447844, -0.6851369, 1, 0.3411765, 0, 1,
-1.634928, -0.02513065, -0.8711729, 1, 0.3490196, 0, 1,
-1.611607, -1.554275, -2.133729, 1, 0.3529412, 0, 1,
-1.599993, -0.08561406, -1.148789, 1, 0.3607843, 0, 1,
-1.593543, -0.4653178, -1.549944, 1, 0.3647059, 0, 1,
-1.583954, -1.57257, -3.600163, 1, 0.372549, 0, 1,
-1.578047, 0.7560197, -1.908647, 1, 0.3764706, 0, 1,
-1.569504, 0.219571, -2.216457, 1, 0.3843137, 0, 1,
-1.559841, 1.630705, -0.6616991, 1, 0.3882353, 0, 1,
-1.542432, -0.5043306, -3.158916, 1, 0.3960784, 0, 1,
-1.53755, -0.2350888, -1.907747, 1, 0.4039216, 0, 1,
-1.531236, 0.2744409, -1.703864, 1, 0.4078431, 0, 1,
-1.526495, -1.10845, -2.524611, 1, 0.4156863, 0, 1,
-1.515546, -1.384703, -1.885154, 1, 0.4196078, 0, 1,
-1.494744, -0.4448583, -4.498672, 1, 0.427451, 0, 1,
-1.47971, -0.782438, -1.560776, 1, 0.4313726, 0, 1,
-1.477934, 0.7977045, -2.418168, 1, 0.4392157, 0, 1,
-1.474449, -1.405885, -2.837157, 1, 0.4431373, 0, 1,
-1.46688, -1.475669, -2.521745, 1, 0.4509804, 0, 1,
-1.466107, 0.3094633, -0.3325886, 1, 0.454902, 0, 1,
-1.464267, -0.4859073, -0.646583, 1, 0.4627451, 0, 1,
-1.462395, 0.3236178, -0.741306, 1, 0.4666667, 0, 1,
-1.460839, -2.246831, -2.989461, 1, 0.4745098, 0, 1,
-1.458438, -2.255942, -2.814487, 1, 0.4784314, 0, 1,
-1.4584, 0.3572769, -0.8044829, 1, 0.4862745, 0, 1,
-1.449074, 1.15941, -0.2881183, 1, 0.4901961, 0, 1,
-1.44258, -0.6511183, -1.711995, 1, 0.4980392, 0, 1,
-1.42153, -0.8232634, -1.085811, 1, 0.5058824, 0, 1,
-1.417316, 0.6983215, -2.354272, 1, 0.509804, 0, 1,
-1.416086, -1.442355, -3.119834, 1, 0.5176471, 0, 1,
-1.408165, -0.3567992, -1.824591, 1, 0.5215687, 0, 1,
-1.398249, -0.8547636, -2.14674, 1, 0.5294118, 0, 1,
-1.389752, -0.8398063, -2.060238, 1, 0.5333334, 0, 1,
-1.387425, 0.506691, -0.3366687, 1, 0.5411765, 0, 1,
-1.382941, -1.25953, -1.830763, 1, 0.5450981, 0, 1,
-1.382898, 0.1446003, -1.761879, 1, 0.5529412, 0, 1,
-1.378887, 0.4869069, -1.407752, 1, 0.5568628, 0, 1,
-1.375436, 0.8801352, -0.8878819, 1, 0.5647059, 0, 1,
-1.371658, -0.5444092, -1.416528, 1, 0.5686275, 0, 1,
-1.360684, -1.570405, -3.866013, 1, 0.5764706, 0, 1,
-1.352118, 0.2668326, -0.4252276, 1, 0.5803922, 0, 1,
-1.344575, -1.033994, -1.115907, 1, 0.5882353, 0, 1,
-1.339369, -1.365445, -2.393857, 1, 0.5921569, 0, 1,
-1.335582, -0.3238448, -1.952725, 1, 0.6, 0, 1,
-1.334497, 0.5556537, -1.730136, 1, 0.6078432, 0, 1,
-1.322514, 0.5699852, -1.734138, 1, 0.6117647, 0, 1,
-1.322046, 1.121799, -0.3888194, 1, 0.6196079, 0, 1,
-1.317757, 0.3951981, -0.4433938, 1, 0.6235294, 0, 1,
-1.317094, 0.903031, -2.415688, 1, 0.6313726, 0, 1,
-1.306684, 0.6204301, -1.575104, 1, 0.6352941, 0, 1,
-1.285802, -0.3515822, -1.0316, 1, 0.6431373, 0, 1,
-1.284414, 0.5119195, -1.716684, 1, 0.6470588, 0, 1,
-1.283021, 0.6211838, -1.688048, 1, 0.654902, 0, 1,
-1.279708, -1.134053, -0.8073754, 1, 0.6588235, 0, 1,
-1.278306, -0.2457001, -2.909902, 1, 0.6666667, 0, 1,
-1.277584, 1.450872, -2.620148, 1, 0.6705883, 0, 1,
-1.274701, 0.606622, -0.4341636, 1, 0.6784314, 0, 1,
-1.273808, 0.0004495493, -1.966605, 1, 0.682353, 0, 1,
-1.271382, -0.7567889, -2.14531, 1, 0.6901961, 0, 1,
-1.264957, 0.4632738, -1.798134, 1, 0.6941177, 0, 1,
-1.256986, 1.978268, 1.002908, 1, 0.7019608, 0, 1,
-1.254462, -0.6655011, -4.032462, 1, 0.7098039, 0, 1,
-1.241486, 0.05117195, -1.014686, 1, 0.7137255, 0, 1,
-1.227837, 0.2588688, -1.855737, 1, 0.7215686, 0, 1,
-1.225379, -0.08754326, -1.608307, 1, 0.7254902, 0, 1,
-1.206285, -2.216607, -3.187597, 1, 0.7333333, 0, 1,
-1.204693, 0.1110378, -0.7920448, 1, 0.7372549, 0, 1,
-1.199372, 1.205444, -0.5742218, 1, 0.7450981, 0, 1,
-1.195356, -1.755044, -3.643336, 1, 0.7490196, 0, 1,
-1.19152, -0.1307717, -0.4993432, 1, 0.7568628, 0, 1,
-1.190835, 0.5262503, -1.420134, 1, 0.7607843, 0, 1,
-1.182856, -0.1127505, -2.22191, 1, 0.7686275, 0, 1,
-1.180831, 1.343174, -1.797304, 1, 0.772549, 0, 1,
-1.162739, 1.203425, -1.76544, 1, 0.7803922, 0, 1,
-1.150179, 0.480041, -2.371873, 1, 0.7843137, 0, 1,
-1.1467, -0.2181382, -3.084646, 1, 0.7921569, 0, 1,
-1.143174, -0.2692123, -1.780676, 1, 0.7960784, 0, 1,
-1.138777, -0.09388741, -0.6230564, 1, 0.8039216, 0, 1,
-1.129484, -0.2535275, -3.134534, 1, 0.8117647, 0, 1,
-1.12465, -0.7674963, -2.719175, 1, 0.8156863, 0, 1,
-1.123113, 0.4637924, -0.6020451, 1, 0.8235294, 0, 1,
-1.11987, 2.525627, 0.5635105, 1, 0.827451, 0, 1,
-1.116479, 0.6270012, -0.5522763, 1, 0.8352941, 0, 1,
-1.114594, -0.712893, -2.208247, 1, 0.8392157, 0, 1,
-1.111658, -1.014502, -3.419794, 1, 0.8470588, 0, 1,
-1.111442, -1.186005, -4.18978, 1, 0.8509804, 0, 1,
-1.100729, -1.213235, -1.71198, 1, 0.8588235, 0, 1,
-1.08982, -0.808647, -1.425606, 1, 0.8627451, 0, 1,
-1.082803, 0.3822649, -1.390315, 1, 0.8705882, 0, 1,
-1.073234, 0.7646477, -3.437058, 1, 0.8745098, 0, 1,
-1.068515, -0.6498478, -2.392735, 1, 0.8823529, 0, 1,
-1.063234, 0.1141341, 0.06621925, 1, 0.8862745, 0, 1,
-1.055815, 1.6167, 0.2772684, 1, 0.8941177, 0, 1,
-1.053749, -1.53348, -1.040877, 1, 0.8980392, 0, 1,
-1.043191, -0.592412, -4.546834, 1, 0.9058824, 0, 1,
-1.043054, 1.105309, -2.732265, 1, 0.9137255, 0, 1,
-1.036082, 0.9390628, 0.506793, 1, 0.9176471, 0, 1,
-1.034405, -1.101475, -2.791346, 1, 0.9254902, 0, 1,
-1.033372, -0.5945373, -3.193876, 1, 0.9294118, 0, 1,
-1.028652, 1.659344, -0.5979575, 1, 0.9372549, 0, 1,
-1.026146, 0.417401, -1.48188, 1, 0.9411765, 0, 1,
-1.018061, -0.1549338, -2.526909, 1, 0.9490196, 0, 1,
-1.016657, 0.560889, 0.01169777, 1, 0.9529412, 0, 1,
-1.016402, -0.4763713, -2.436551, 1, 0.9607843, 0, 1,
-1.015814, -0.804371, -2.972725, 1, 0.9647059, 0, 1,
-1.003056, 0.4932202, 0.473794, 1, 0.972549, 0, 1,
-0.996449, -0.9657678, -1.175633, 1, 0.9764706, 0, 1,
-0.9931498, -1.768006, -3.034101, 1, 0.9843137, 0, 1,
-0.9918938, 0.6229517, -3.386049, 1, 0.9882353, 0, 1,
-0.9895172, 0.5369518, 0.8973672, 1, 0.9960784, 0, 1,
-0.9854758, 1.348404, -1.218458, 0.9960784, 1, 0, 1,
-0.9847853, -0.217645, -1.997573, 0.9921569, 1, 0, 1,
-0.9795741, 1.519874, -0.3743863, 0.9843137, 1, 0, 1,
-0.970743, 0.6299373, -1.481529, 0.9803922, 1, 0, 1,
-0.9692193, -0.3060916, 0.2870182, 0.972549, 1, 0, 1,
-0.9650586, -0.9846013, -1.574085, 0.9686275, 1, 0, 1,
-0.9585775, 1.721968, 0.514874, 0.9607843, 1, 0, 1,
-0.9567105, -0.45778, -2.882695, 0.9568627, 1, 0, 1,
-0.9556776, -0.06237915, -2.000331, 0.9490196, 1, 0, 1,
-0.9488856, 1.203661, -0.4031009, 0.945098, 1, 0, 1,
-0.9451351, -0.4329991, 0.1626515, 0.9372549, 1, 0, 1,
-0.9349582, 0.7065995, -0.4982506, 0.9333333, 1, 0, 1,
-0.9339274, -1.029485, -1.437837, 0.9254902, 1, 0, 1,
-0.9317834, 0.8476797, -0.8329284, 0.9215686, 1, 0, 1,
-0.9317408, 0.2340681, -2.120268, 0.9137255, 1, 0, 1,
-0.9272131, 0.1649754, 0.3736694, 0.9098039, 1, 0, 1,
-0.924583, 0.2528505, -0.66128, 0.9019608, 1, 0, 1,
-0.9242352, -0.4156801, -2.149246, 0.8941177, 1, 0, 1,
-0.9241862, 0.6194, -1.120781, 0.8901961, 1, 0, 1,
-0.9216845, -1.704759, -3.614444, 0.8823529, 1, 0, 1,
-0.9204062, -1.349841, -3.01383, 0.8784314, 1, 0, 1,
-0.9119777, -1.477188, -2.904936, 0.8705882, 1, 0, 1,
-0.9089807, -0.0848286, -2.190664, 0.8666667, 1, 0, 1,
-0.9049237, 0.3300228, -1.045723, 0.8588235, 1, 0, 1,
-0.9037744, -1.482074, -2.922848, 0.854902, 1, 0, 1,
-0.8942879, 0.9335573, -2.230735, 0.8470588, 1, 0, 1,
-0.8901828, -0.02546141, -1.221766, 0.8431373, 1, 0, 1,
-0.8870599, -1.082745, -2.975631, 0.8352941, 1, 0, 1,
-0.8864262, -0.198198, -4.125132, 0.8313726, 1, 0, 1,
-0.8828083, 0.938903, -0.3871841, 0.8235294, 1, 0, 1,
-0.8702807, 0.5794292, -1.312248, 0.8196079, 1, 0, 1,
-0.8700088, -0.2450128, -0.8779468, 0.8117647, 1, 0, 1,
-0.8579105, 0.5118369, 0.2270596, 0.8078431, 1, 0, 1,
-0.8566642, -1.413905, -4.663683, 0.8, 1, 0, 1,
-0.8529552, -1.54321, -3.585893, 0.7921569, 1, 0, 1,
-0.8521359, 0.4747719, -1.34263, 0.7882353, 1, 0, 1,
-0.8492426, -0.3586953, -3.356308, 0.7803922, 1, 0, 1,
-0.8426203, -1.604952, -1.437802, 0.7764706, 1, 0, 1,
-0.8281333, -0.05236208, -1.492498, 0.7686275, 1, 0, 1,
-0.823622, -1.052507, -0.7747967, 0.7647059, 1, 0, 1,
-0.8186224, 2.049641, 0.2029302, 0.7568628, 1, 0, 1,
-0.8184856, 0.8800131, -1.336025, 0.7529412, 1, 0, 1,
-0.8122716, -1.221978, -4.163972, 0.7450981, 1, 0, 1,
-0.8119789, 0.4952069, -0.6978601, 0.7411765, 1, 0, 1,
-0.8066575, 1.62561, -2.031631, 0.7333333, 1, 0, 1,
-0.8029476, -0.9386329, -3.457801, 0.7294118, 1, 0, 1,
-0.7976918, 0.8532324, -0.5116908, 0.7215686, 1, 0, 1,
-0.7899265, 1.042066, -0.7893243, 0.7176471, 1, 0, 1,
-0.787209, 1.847906, -1.249303, 0.7098039, 1, 0, 1,
-0.7856106, -0.5044641, -1.575828, 0.7058824, 1, 0, 1,
-0.7845411, -0.1523055, -3.156788, 0.6980392, 1, 0, 1,
-0.7785634, -0.9604467, -4.613252, 0.6901961, 1, 0, 1,
-0.773581, -0.6916463, -2.087808, 0.6862745, 1, 0, 1,
-0.7684762, 2.235869, -1.105181, 0.6784314, 1, 0, 1,
-0.7669537, -0.08801357, -2.588974, 0.6745098, 1, 0, 1,
-0.7618401, 0.0950597, -0.627974, 0.6666667, 1, 0, 1,
-0.7575818, 1.770544, -1.05093, 0.6627451, 1, 0, 1,
-0.7541921, -0.5672743, -2.460099, 0.654902, 1, 0, 1,
-0.7501875, -0.003726518, -2.033154, 0.6509804, 1, 0, 1,
-0.748226, 0.3455127, 0.726535, 0.6431373, 1, 0, 1,
-0.7471579, -1.969043, -2.946662, 0.6392157, 1, 0, 1,
-0.7455626, -0.960633, -1.721844, 0.6313726, 1, 0, 1,
-0.7410507, -0.4530994, -2.94178, 0.627451, 1, 0, 1,
-0.7384086, 0.7181724, 0.3789638, 0.6196079, 1, 0, 1,
-0.7380301, 0.3255258, -0.192938, 0.6156863, 1, 0, 1,
-0.7338561, 0.2286038, -2.75862, 0.6078432, 1, 0, 1,
-0.7314677, 0.4834668, 1.41759, 0.6039216, 1, 0, 1,
-0.7295321, -0.8500388, -1.575078, 0.5960785, 1, 0, 1,
-0.7245988, 0.2430092, 1.034072, 0.5882353, 1, 0, 1,
-0.7236124, 1.037281, -1.419236, 0.5843138, 1, 0, 1,
-0.7217141, 1.084997, 0.4101438, 0.5764706, 1, 0, 1,
-0.7182219, 0.0190792, -1.472861, 0.572549, 1, 0, 1,
-0.7151513, 1.964075, -1.109349, 0.5647059, 1, 0, 1,
-0.7107495, -0.2633727, -1.729118, 0.5607843, 1, 0, 1,
-0.7088281, -0.4142589, -1.543906, 0.5529412, 1, 0, 1,
-0.6965958, 1.539769, -0.03739896, 0.5490196, 1, 0, 1,
-0.6940494, 1.756532, 0.6451368, 0.5411765, 1, 0, 1,
-0.6885462, -0.3393435, -2.684569, 0.5372549, 1, 0, 1,
-0.6869611, 0.1399436, -1.622484, 0.5294118, 1, 0, 1,
-0.6847582, 0.8390692, -1.236738, 0.5254902, 1, 0, 1,
-0.6844501, 0.9937952, 0.05480742, 0.5176471, 1, 0, 1,
-0.6831658, -0.07870822, -1.676075, 0.5137255, 1, 0, 1,
-0.6827603, 0.8796144, 0.6719865, 0.5058824, 1, 0, 1,
-0.6648102, -0.5703623, -1.76719, 0.5019608, 1, 0, 1,
-0.6629151, -0.4799578, -2.67915, 0.4941176, 1, 0, 1,
-0.6621014, -0.07639444, -0.5933187, 0.4862745, 1, 0, 1,
-0.6582405, -0.8057333, -3.504596, 0.4823529, 1, 0, 1,
-0.6544373, -0.9245313, -2.084094, 0.4745098, 1, 0, 1,
-0.6506975, -0.1553391, -1.902872, 0.4705882, 1, 0, 1,
-0.6454738, 0.5357667, 0.0982611, 0.4627451, 1, 0, 1,
-0.643397, -0.4213023, -2.586961, 0.4588235, 1, 0, 1,
-0.6404811, -0.03403094, -3.94602, 0.4509804, 1, 0, 1,
-0.6369719, -1.06626, -3.640885, 0.4470588, 1, 0, 1,
-0.6360264, 2.574814, 0.09647653, 0.4392157, 1, 0, 1,
-0.6263761, -0.1009111, -0.7498996, 0.4352941, 1, 0, 1,
-0.624534, -0.9531969, -2.554183, 0.427451, 1, 0, 1,
-0.621684, 0.9787419, -0.2761365, 0.4235294, 1, 0, 1,
-0.6194451, -0.2744981, -1.989703, 0.4156863, 1, 0, 1,
-0.6188268, -0.4619021, -2.274317, 0.4117647, 1, 0, 1,
-0.6144195, -2.525939, -4.034037, 0.4039216, 1, 0, 1,
-0.611596, -0.1224178, -3.269322, 0.3960784, 1, 0, 1,
-0.6104697, 0.7150353, -0.7207643, 0.3921569, 1, 0, 1,
-0.6084812, 0.3015037, -1.940566, 0.3843137, 1, 0, 1,
-0.5990238, -1.638948, -3.247133, 0.3803922, 1, 0, 1,
-0.5957984, 0.4016778, -1.024132, 0.372549, 1, 0, 1,
-0.5938601, -2.091783, -3.156185, 0.3686275, 1, 0, 1,
-0.591884, 0.4700035, -3.027931, 0.3607843, 1, 0, 1,
-0.589688, -0.161532, -2.465749, 0.3568628, 1, 0, 1,
-0.5888625, 0.5145985, -1.673178, 0.3490196, 1, 0, 1,
-0.5822294, 0.8257168, -0.8506395, 0.345098, 1, 0, 1,
-0.5818421, -0.9979086, -2.414477, 0.3372549, 1, 0, 1,
-0.5789528, -0.4486968, -2.128984, 0.3333333, 1, 0, 1,
-0.5787851, 0.9522195, -0.480249, 0.3254902, 1, 0, 1,
-0.5761148, -0.3093914, -0.946645, 0.3215686, 1, 0, 1,
-0.5644863, 1.618115, -0.558076, 0.3137255, 1, 0, 1,
-0.5565351, 0.7266801, -2.925333, 0.3098039, 1, 0, 1,
-0.5501953, 0.269219, -1.083783, 0.3019608, 1, 0, 1,
-0.5444347, -0.8663573, -4.245547, 0.2941177, 1, 0, 1,
-0.5402086, -1.330665, -3.155852, 0.2901961, 1, 0, 1,
-0.5377156, -0.2246514, -1.00366, 0.282353, 1, 0, 1,
-0.5049629, 1.871522, 0.1379743, 0.2784314, 1, 0, 1,
-0.5033952, -0.8048269, -1.681167, 0.2705882, 1, 0, 1,
-0.4975016, -0.07797571, -3.145823, 0.2666667, 1, 0, 1,
-0.494766, 0.1294467, -2.591316, 0.2588235, 1, 0, 1,
-0.4933644, -1.145398, -2.370157, 0.254902, 1, 0, 1,
-0.4929258, -1.455693, -2.347024, 0.2470588, 1, 0, 1,
-0.4827525, 2.721733, -0.8718234, 0.2431373, 1, 0, 1,
-0.4805861, 1.613445, 0.02984308, 0.2352941, 1, 0, 1,
-0.4775757, 0.1221812, 0.4713918, 0.2313726, 1, 0, 1,
-0.4775179, 0.1096004, -1.28619, 0.2235294, 1, 0, 1,
-0.4762971, -0.3203002, -3.798615, 0.2196078, 1, 0, 1,
-0.4751944, 0.08404411, -1.872058, 0.2117647, 1, 0, 1,
-0.4745501, -1.184844, -3.477928, 0.2078431, 1, 0, 1,
-0.4745416, 0.9862164, 0.01653546, 0.2, 1, 0, 1,
-0.4717902, 1.916327, -0.2926334, 0.1921569, 1, 0, 1,
-0.4708477, -0.6995106, -2.392007, 0.1882353, 1, 0, 1,
-0.4689928, 1.055536, 0.1854479, 0.1803922, 1, 0, 1,
-0.4678354, -0.09774087, 0.5607693, 0.1764706, 1, 0, 1,
-0.4671117, 0.1130794, 0.2413041, 0.1686275, 1, 0, 1,
-0.4639549, 0.2906766, -1.923822, 0.1647059, 1, 0, 1,
-0.4619397, -0.3982904, -1.357006, 0.1568628, 1, 0, 1,
-0.4611835, 0.1628828, 0.499767, 0.1529412, 1, 0, 1,
-0.4609289, 2.263474, -0.7146786, 0.145098, 1, 0, 1,
-0.4604202, 1.06342, -0.8773596, 0.1411765, 1, 0, 1,
-0.4588107, -0.5824366, -1.225457, 0.1333333, 1, 0, 1,
-0.4528731, -1.399747, -2.603617, 0.1294118, 1, 0, 1,
-0.4519992, 0.2287789, 1.772584, 0.1215686, 1, 0, 1,
-0.4504417, 0.2663688, -2.018208, 0.1176471, 1, 0, 1,
-0.4453268, 1.076241, -0.9396781, 0.1098039, 1, 0, 1,
-0.4448479, 0.6702574, -0.8717203, 0.1058824, 1, 0, 1,
-0.4354039, 2.924158, -0.2598179, 0.09803922, 1, 0, 1,
-0.435177, 1.125058, -1.800366, 0.09019608, 1, 0, 1,
-0.432546, -0.6340302, -2.837029, 0.08627451, 1, 0, 1,
-0.4322067, -1.139638, -2.446649, 0.07843138, 1, 0, 1,
-0.4257196, -0.04231074, 0.3312773, 0.07450981, 1, 0, 1,
-0.4247307, 0.4151872, -1.396715, 0.06666667, 1, 0, 1,
-0.4180972, 0.8527048, -0.7761308, 0.0627451, 1, 0, 1,
-0.4121488, 1.268471, 0.2023201, 0.05490196, 1, 0, 1,
-0.4117537, 1.061893, 0.9309593, 0.05098039, 1, 0, 1,
-0.4092882, -0.9498309, -2.972616, 0.04313726, 1, 0, 1,
-0.4067335, 0.4835933, -0.2245298, 0.03921569, 1, 0, 1,
-0.4057105, -0.3096364, -2.493371, 0.03137255, 1, 0, 1,
-0.4054887, 1.927197, -0.3320055, 0.02745098, 1, 0, 1,
-0.4049192, -0.672963, -1.88006, 0.01960784, 1, 0, 1,
-0.4034318, 0.01990567, -1.847549, 0.01568628, 1, 0, 1,
-0.402451, 0.4632697, -0.6869981, 0.007843138, 1, 0, 1,
-0.4007694, -0.2850043, -3.616725, 0.003921569, 1, 0, 1,
-0.3989564, 0.8630338, -2.033097, 0, 1, 0.003921569, 1,
-0.398837, 0.3980038, 0.1956414, 0, 1, 0.01176471, 1,
-0.3974063, -0.1831941, -1.745906, 0, 1, 0.01568628, 1,
-0.3917712, -0.4636288, -2.830477, 0, 1, 0.02352941, 1,
-0.3895187, -0.6974838, -1.748723, 0, 1, 0.02745098, 1,
-0.3852773, -1.468294, -1.63701, 0, 1, 0.03529412, 1,
-0.3842761, 1.265176, -1.101256, 0, 1, 0.03921569, 1,
-0.3801188, 0.5164164, -1.609374, 0, 1, 0.04705882, 1,
-0.3743438, -2.353213, -3.145797, 0, 1, 0.05098039, 1,
-0.3706893, -0.18308, -0.7641873, 0, 1, 0.05882353, 1,
-0.366993, -1.124354, -1.965481, 0, 1, 0.0627451, 1,
-0.361454, 2.413527, -0.6094694, 0, 1, 0.07058824, 1,
-0.3613696, 1.118277, -0.2919323, 0, 1, 0.07450981, 1,
-0.358097, 0.4375908, -0.05127389, 0, 1, 0.08235294, 1,
-0.3556234, -0.1591698, -3.543346, 0, 1, 0.08627451, 1,
-0.3526581, 0.4902199, -0.9843279, 0, 1, 0.09411765, 1,
-0.3420835, -1.931069, -3.766863, 0, 1, 0.1019608, 1,
-0.3418697, 1.018753, 0.04483796, 0, 1, 0.1058824, 1,
-0.3395814, -0.01069757, -3.582205, 0, 1, 0.1137255, 1,
-0.3370387, 0.8069879, -0.4956836, 0, 1, 0.1176471, 1,
-0.3335104, -0.9847265, -2.579558, 0, 1, 0.1254902, 1,
-0.3251041, 0.3897208, -1.53891, 0, 1, 0.1294118, 1,
-0.3247549, 0.3649025, 0.2953547, 0, 1, 0.1372549, 1,
-0.321782, 0.3897637, -0.2798544, 0, 1, 0.1411765, 1,
-0.3203254, 1.059799, -0.3457467, 0, 1, 0.1490196, 1,
-0.3198069, -0.1145091, -1.66211, 0, 1, 0.1529412, 1,
-0.3162943, -0.1602673, -2.47259, 0, 1, 0.1607843, 1,
-0.3143351, 0.05470503, -1.176466, 0, 1, 0.1647059, 1,
-0.3138877, 0.5093018, -0.4171943, 0, 1, 0.172549, 1,
-0.3102275, 0.419948, 0.7994459, 0, 1, 0.1764706, 1,
-0.3091751, 0.5794484, -0.3029011, 0, 1, 0.1843137, 1,
-0.2984484, -0.8780481, -4.433064, 0, 1, 0.1882353, 1,
-0.2969635, 0.7649079, -2.015914, 0, 1, 0.1960784, 1,
-0.2926408, -1.111184, -3.001125, 0, 1, 0.2039216, 1,
-0.2916631, -1.606902, -2.586214, 0, 1, 0.2078431, 1,
-0.2839462, 0.3143774, -2.002396, 0, 1, 0.2156863, 1,
-0.2714489, 0.3168812, -1.34565, 0, 1, 0.2196078, 1,
-0.2658748, 1.195093, -0.5305018, 0, 1, 0.227451, 1,
-0.2556446, -0.4040247, -2.821388, 0, 1, 0.2313726, 1,
-0.2500495, -0.345473, -2.025375, 0, 1, 0.2392157, 1,
-0.2435653, -0.3129952, -2.421044, 0, 1, 0.2431373, 1,
-0.2429996, -0.9059131, -6.305838, 0, 1, 0.2509804, 1,
-0.2396073, -1.151779, -2.894958, 0, 1, 0.254902, 1,
-0.2355048, 0.5871692, -1.168948, 0, 1, 0.2627451, 1,
-0.2345854, 0.5327312, -1.893996, 0, 1, 0.2666667, 1,
-0.2334347, -1.410194, -3.225057, 0, 1, 0.2745098, 1,
-0.2320939, 1.259987, 0.2826471, 0, 1, 0.2784314, 1,
-0.2269081, 0.1288806, -2.253149, 0, 1, 0.2862745, 1,
-0.2245631, -0.756759, -1.933019, 0, 1, 0.2901961, 1,
-0.2189925, 0.8480837, -0.06945564, 0, 1, 0.2980392, 1,
-0.2177647, 0.3231702, 0.4697778, 0, 1, 0.3058824, 1,
-0.2091876, -2.059269, -4.032766, 0, 1, 0.3098039, 1,
-0.206946, 0.08472509, -1.561815, 0, 1, 0.3176471, 1,
-0.2066233, -0.1195595, -2.487181, 0, 1, 0.3215686, 1,
-0.2059919, -0.001640791, -1.979811, 0, 1, 0.3294118, 1,
-0.2049258, 0.3651851, -1.769691, 0, 1, 0.3333333, 1,
-0.2043033, -2.047044, -2.702621, 0, 1, 0.3411765, 1,
-0.2039343, 1.145226, 1.068618, 0, 1, 0.345098, 1,
-0.2003238, 0.5711302, -0.4842501, 0, 1, 0.3529412, 1,
-0.1985311, -0.9852983, -3.572182, 0, 1, 0.3568628, 1,
-0.197403, 1.095038, -0.2765377, 0, 1, 0.3647059, 1,
-0.1932742, 1.017613, 1.049697, 0, 1, 0.3686275, 1,
-0.1880502, 1.659866, 0.7709092, 0, 1, 0.3764706, 1,
-0.181972, -0.9605996, -3.992873, 0, 1, 0.3803922, 1,
-0.1807885, 0.6252495, 0.8894209, 0, 1, 0.3882353, 1,
-0.180621, -0.08965541, -1.706165, 0, 1, 0.3921569, 1,
-0.1802449, 0.8618404, -0.3489883, 0, 1, 0.4, 1,
-0.1789712, -0.3486637, -3.137158, 0, 1, 0.4078431, 1,
-0.168496, -0.1683714, -2.284335, 0, 1, 0.4117647, 1,
-0.1660631, 0.4438868, 1.376205, 0, 1, 0.4196078, 1,
-0.1642701, -1.201701, -3.672346, 0, 1, 0.4235294, 1,
-0.1625258, 1.967353, -1.954454, 0, 1, 0.4313726, 1,
-0.1624473, -0.4149115, -1.603985, 0, 1, 0.4352941, 1,
-0.1596791, -0.002283037, -2.101676, 0, 1, 0.4431373, 1,
-0.1589448, 0.4307707, -0.8695812, 0, 1, 0.4470588, 1,
-0.1585386, 0.07294172, -1.348853, 0, 1, 0.454902, 1,
-0.1557108, 1.818109, -0.9136592, 0, 1, 0.4588235, 1,
-0.155624, 0.959709, -1.611348, 0, 1, 0.4666667, 1,
-0.154209, -2.944902, -4.943485, 0, 1, 0.4705882, 1,
-0.1504964, -1.100978, -3.764027, 0, 1, 0.4784314, 1,
-0.1501655, -0.179419, -1.455219, 0, 1, 0.4823529, 1,
-0.1481477, -0.8562562, -4.223295, 0, 1, 0.4901961, 1,
-0.1479529, 0.5442924, -0.004735741, 0, 1, 0.4941176, 1,
-0.1474583, 0.1412531, -2.924967, 0, 1, 0.5019608, 1,
-0.1471505, 0.9477016, -0.3262634, 0, 1, 0.509804, 1,
-0.1450688, 0.05672734, -1.761018, 0, 1, 0.5137255, 1,
-0.1370299, 1.329318, -0.914101, 0, 1, 0.5215687, 1,
-0.1304939, 0.4959887, 0.1824151, 0, 1, 0.5254902, 1,
-0.1281939, -0.7872992, -3.17911, 0, 1, 0.5333334, 1,
-0.125843, -0.7262877, -2.650609, 0, 1, 0.5372549, 1,
-0.1257942, -0.5214179, -4.763142, 0, 1, 0.5450981, 1,
-0.1234022, 0.7430356, 0.2426725, 0, 1, 0.5490196, 1,
-0.1218333, 0.03060314, -1.584756, 0, 1, 0.5568628, 1,
-0.1208434, -0.04812309, -1.993531, 0, 1, 0.5607843, 1,
-0.1167264, 0.785342, -0.837931, 0, 1, 0.5686275, 1,
-0.116374, 0.4300886, -1.695358, 0, 1, 0.572549, 1,
-0.11306, -0.8518149, -3.067952, 0, 1, 0.5803922, 1,
-0.1071207, -0.3423754, -1.87967, 0, 1, 0.5843138, 1,
-0.10681, -0.2873832, -2.227793, 0, 1, 0.5921569, 1,
-0.1036313, 1.637111, -2.24191, 0, 1, 0.5960785, 1,
-0.1031705, 0.3233206, -1.948423, 0, 1, 0.6039216, 1,
-0.1008826, 0.9146544, -0.8029013, 0, 1, 0.6117647, 1,
-0.0984902, -0.8226268, -4.212982, 0, 1, 0.6156863, 1,
-0.09824113, 0.5148659, -0.4144471, 0, 1, 0.6235294, 1,
-0.09797303, 1.924424, -0.1884209, 0, 1, 0.627451, 1,
-0.09671399, 1.486155, -0.1325915, 0, 1, 0.6352941, 1,
-0.09373516, -1.350442, -2.630977, 0, 1, 0.6392157, 1,
-0.09187375, 0.4181407, -0.6998904, 0, 1, 0.6470588, 1,
-0.07993919, 0.2565469, -0.7932816, 0, 1, 0.6509804, 1,
-0.074899, 0.661121, -1.238777, 0, 1, 0.6588235, 1,
-0.07460878, 0.003194505, -2.205903, 0, 1, 0.6627451, 1,
-0.0738667, 0.4432426, 1.233223, 0, 1, 0.6705883, 1,
-0.07241394, 0.2012977, 1.100757, 0, 1, 0.6745098, 1,
-0.07202568, -0.52403, -1.603356, 0, 1, 0.682353, 1,
-0.06481276, 0.005051742, -0.6182195, 0, 1, 0.6862745, 1,
-0.06474928, -0.7738998, -2.299153, 0, 1, 0.6941177, 1,
-0.06143901, -0.4933419, -4.985618, 0, 1, 0.7019608, 1,
-0.05685542, 0.08909695, -0.8948628, 0, 1, 0.7058824, 1,
-0.05301915, -0.4951203, -3.360758, 0, 1, 0.7137255, 1,
-0.05127791, -1.37419, -3.933042, 0, 1, 0.7176471, 1,
-0.0500422, -0.3328465, -1.779238, 0, 1, 0.7254902, 1,
-0.04971328, 1.014715, -0.2229917, 0, 1, 0.7294118, 1,
-0.04908639, -0.4391676, -3.124977, 0, 1, 0.7372549, 1,
-0.04696684, 0.7321694, -0.4129742, 0, 1, 0.7411765, 1,
-0.04346323, -0.2787287, -1.951154, 0, 1, 0.7490196, 1,
-0.04237409, -0.7199569, -2.563955, 0, 1, 0.7529412, 1,
-0.04095304, 0.4966852, -2.274143, 0, 1, 0.7607843, 1,
-0.03089617, -0.8557844, -1.836621, 0, 1, 0.7647059, 1,
-0.03043683, -0.02000087, -3.308609, 0, 1, 0.772549, 1,
-0.02895544, 1.327518, 0.0005602352, 0, 1, 0.7764706, 1,
-0.02797056, 0.1184873, -0.530569, 0, 1, 0.7843137, 1,
-0.02750761, 1.888802, 1.297123, 0, 1, 0.7882353, 1,
-0.02576866, -1.403029, -2.57362, 0, 1, 0.7960784, 1,
-0.02513878, -0.9093272, -2.644509, 0, 1, 0.8039216, 1,
-0.0210185, -0.2313102, -3.408005, 0, 1, 0.8078431, 1,
-0.01842827, 0.3566174, 2.202116, 0, 1, 0.8156863, 1,
-0.01343472, -0.6160446, -3.202521, 0, 1, 0.8196079, 1,
-0.00958572, 1.032947, 1.521018, 0, 1, 0.827451, 1,
-0.007003568, 0.6513448, -0.701732, 0, 1, 0.8313726, 1,
-0.004801284, -0.1234107, -4.907138, 0, 1, 0.8392157, 1,
-0.003239476, -0.1182152, -4.179911, 0, 1, 0.8431373, 1,
-0.002931803, 0.6043023, 0.6012073, 0, 1, 0.8509804, 1,
-0.00115392, -0.2474206, -4.656017, 0, 1, 0.854902, 1,
-0.0009771939, -0.05542167, -3.341639, 0, 1, 0.8627451, 1,
0.004117934, 1.026232, 0.6394686, 0, 1, 0.8666667, 1,
0.00583947, 0.6914353, 0.7311425, 0, 1, 0.8745098, 1,
0.01412473, -0.847024, 3.065742, 0, 1, 0.8784314, 1,
0.01663904, -1.35068, 3.875046, 0, 1, 0.8862745, 1,
0.01710552, -0.1270334, 3.544027, 0, 1, 0.8901961, 1,
0.0181858, 1.303065, 1.071985, 0, 1, 0.8980392, 1,
0.02059614, 0.3524569, 0.5453714, 0, 1, 0.9058824, 1,
0.03233803, -0.3188762, 1.929186, 0, 1, 0.9098039, 1,
0.03279721, -0.642567, 2.836571, 0, 1, 0.9176471, 1,
0.03370409, -0.2725096, 3.90255, 0, 1, 0.9215686, 1,
0.04317692, 1.048008, 1.681989, 0, 1, 0.9294118, 1,
0.04443579, 1.227774, -0.1304502, 0, 1, 0.9333333, 1,
0.05374018, -1.30407, 2.266391, 0, 1, 0.9411765, 1,
0.05718862, -0.2917392, 2.925685, 0, 1, 0.945098, 1,
0.05799137, -0.1649906, 3.207525, 0, 1, 0.9529412, 1,
0.05861821, 0.8584002, 0.3487646, 0, 1, 0.9568627, 1,
0.05972193, -0.2115605, 2.920198, 0, 1, 0.9647059, 1,
0.06015949, -0.3614401, 3.780953, 0, 1, 0.9686275, 1,
0.06387338, 0.5295324, -0.7098328, 0, 1, 0.9764706, 1,
0.06688003, -0.5393756, 2.542411, 0, 1, 0.9803922, 1,
0.06925473, 1.707951, 0.2794698, 0, 1, 0.9882353, 1,
0.07085776, -0.4646254, 4.115636, 0, 1, 0.9921569, 1,
0.07098465, 0.8658528, 0.3934997, 0, 1, 1, 1,
0.07130764, 0.4331494, 2.002743, 0, 0.9921569, 1, 1,
0.07318354, -1.971831, 2.087913, 0, 0.9882353, 1, 1,
0.07353181, 0.03523406, 1.390728, 0, 0.9803922, 1, 1,
0.07375129, -0.81185, 2.271246, 0, 0.9764706, 1, 1,
0.07442478, 1.300016, 1.457313, 0, 0.9686275, 1, 1,
0.07529782, 1.301955, -1.821663, 0, 0.9647059, 1, 1,
0.07740726, 0.3683806, -0.008305688, 0, 0.9568627, 1, 1,
0.07968654, 0.315578, 1.273856, 0, 0.9529412, 1, 1,
0.08161492, 0.5038868, -0.4094187, 0, 0.945098, 1, 1,
0.08212041, -0.2037046, 3.126821, 0, 0.9411765, 1, 1,
0.08340772, -0.4622485, 4.562883, 0, 0.9333333, 1, 1,
0.09965643, 0.7175877, -0.525332, 0, 0.9294118, 1, 1,
0.1033241, -1.411783, 3.403734, 0, 0.9215686, 1, 1,
0.1036543, 1.614577, -0.8155851, 0, 0.9176471, 1, 1,
0.1043509, 0.506044, 0.5401341, 0, 0.9098039, 1, 1,
0.1063582, -0.2704534, 2.726147, 0, 0.9058824, 1, 1,
0.1107883, 0.3884919, -0.0420321, 0, 0.8980392, 1, 1,
0.1111115, 1.276633, -1.079826, 0, 0.8901961, 1, 1,
0.111287, -0.1061646, 2.741111, 0, 0.8862745, 1, 1,
0.11288, -1.189553, 4.202311, 0, 0.8784314, 1, 1,
0.1134369, -0.5097758, 3.316732, 0, 0.8745098, 1, 1,
0.1143067, 0.7412486, 0.4646104, 0, 0.8666667, 1, 1,
0.1206735, 1.985525, 0.1281933, 0, 0.8627451, 1, 1,
0.1251067, -0.7872512, 3.13186, 0, 0.854902, 1, 1,
0.1260031, 0.9216243, 2.676312, 0, 0.8509804, 1, 1,
0.1304723, -0.5285062, 2.234639, 0, 0.8431373, 1, 1,
0.1310174, 0.9176388, -1.181297, 0, 0.8392157, 1, 1,
0.1404035, 1.007096, -0.4133446, 0, 0.8313726, 1, 1,
0.1437686, -0.3863763, 0.7303395, 0, 0.827451, 1, 1,
0.1520021, -2.320048, 1.13072, 0, 0.8196079, 1, 1,
0.1521001, 0.2955585, 0.03361646, 0, 0.8156863, 1, 1,
0.1526467, 0.7945946, 0.6553848, 0, 0.8078431, 1, 1,
0.1536919, -0.7291608, 2.539654, 0, 0.8039216, 1, 1,
0.155265, -0.3206078, 3.180998, 0, 0.7960784, 1, 1,
0.1553819, 0.8938134, 0.1698829, 0, 0.7882353, 1, 1,
0.1572514, -0.8632747, 3.745429, 0, 0.7843137, 1, 1,
0.1597325, -0.2959257, 3.008575, 0, 0.7764706, 1, 1,
0.1621393, 1.779937, -0.278998, 0, 0.772549, 1, 1,
0.1676803, 0.5263861, -1.439487, 0, 0.7647059, 1, 1,
0.1680322, 1.041713, -0.06897213, 0, 0.7607843, 1, 1,
0.168326, 0.630838, 0.716253, 0, 0.7529412, 1, 1,
0.1706009, -1.291262, 3.781767, 0, 0.7490196, 1, 1,
0.1711007, 0.6724167, 1.204342, 0, 0.7411765, 1, 1,
0.172125, -1.105615, 3.057381, 0, 0.7372549, 1, 1,
0.1732408, -0.001348106, 2.532316, 0, 0.7294118, 1, 1,
0.1746947, 0.2991413, 1.105089, 0, 0.7254902, 1, 1,
0.1768015, 0.4069785, -0.6898032, 0, 0.7176471, 1, 1,
0.1770204, -0.1153026, 1.869332, 0, 0.7137255, 1, 1,
0.1788306, 1.748418, 1.267777, 0, 0.7058824, 1, 1,
0.180496, -0.2514034, 2.977294, 0, 0.6980392, 1, 1,
0.1856914, -1.326439, 3.664963, 0, 0.6941177, 1, 1,
0.1870396, -0.6013767, 1.780599, 0, 0.6862745, 1, 1,
0.191063, 1.833484, -0.1193652, 0, 0.682353, 1, 1,
0.1946785, -0.8144771, 1.771371, 0, 0.6745098, 1, 1,
0.2063998, -0.2632231, 3.805841, 0, 0.6705883, 1, 1,
0.2107897, 0.7201277, -0.5833725, 0, 0.6627451, 1, 1,
0.2136246, -0.9331164, 3.332533, 0, 0.6588235, 1, 1,
0.2187148, 0.2132181, 1.366218, 0, 0.6509804, 1, 1,
0.219833, 0.2119118, 1.746022, 0, 0.6470588, 1, 1,
0.2208375, 0.2086014, 2.083295, 0, 0.6392157, 1, 1,
0.2215141, 0.3477558, -0.2064726, 0, 0.6352941, 1, 1,
0.2238476, 0.9468876, -0.3961438, 0, 0.627451, 1, 1,
0.2248589, 0.5535415, -0.3893812, 0, 0.6235294, 1, 1,
0.2352019, -0.9999195, 2.253603, 0, 0.6156863, 1, 1,
0.2362338, 1.740056, 0.02203604, 0, 0.6117647, 1, 1,
0.2371994, 1.384608, 0.1295645, 0, 0.6039216, 1, 1,
0.2395993, -1.958021, 2.215611, 0, 0.5960785, 1, 1,
0.2423893, 0.2648163, 2.429051, 0, 0.5921569, 1, 1,
0.2431775, 1.001593, 0.4090957, 0, 0.5843138, 1, 1,
0.2458103, -0.7022535, 1.934233, 0, 0.5803922, 1, 1,
0.250962, -0.6031789, 1.579134, 0, 0.572549, 1, 1,
0.2574911, 1.756704, 0.2494684, 0, 0.5686275, 1, 1,
0.2610388, 0.3687555, 0.3123322, 0, 0.5607843, 1, 1,
0.2676588, -0.7075265, 2.58566, 0, 0.5568628, 1, 1,
0.2680976, 0.9839973, 0.1787849, 0, 0.5490196, 1, 1,
0.2684342, 2.005026, -1.44133, 0, 0.5450981, 1, 1,
0.2700051, -0.2144007, 2.565192, 0, 0.5372549, 1, 1,
0.270106, -0.3178277, 3.64844, 0, 0.5333334, 1, 1,
0.2731256, 0.4181355, -0.2192039, 0, 0.5254902, 1, 1,
0.2758158, -1.299081, 0.1643611, 0, 0.5215687, 1, 1,
0.2789042, 1.074337, -0.6330363, 0, 0.5137255, 1, 1,
0.2808464, -0.02826809, 2.177487, 0, 0.509804, 1, 1,
0.2862425, -0.05580505, 2.504349, 0, 0.5019608, 1, 1,
0.2884717, 0.5682467, 1.78337, 0, 0.4941176, 1, 1,
0.2891452, 0.3286884, 1.437234, 0, 0.4901961, 1, 1,
0.292433, -1.815186, 3.680321, 0, 0.4823529, 1, 1,
0.2964605, 1.057726, 0.3516869, 0, 0.4784314, 1, 1,
0.2973212, 0.69759, 0.07757629, 0, 0.4705882, 1, 1,
0.2999019, 1.23238, 0.9944502, 0, 0.4666667, 1, 1,
0.3014868, 0.4067802, 1.020992, 0, 0.4588235, 1, 1,
0.3072691, 0.6708888, -0.4115985, 0, 0.454902, 1, 1,
0.3121743, 0.2451794, 0.6844254, 0, 0.4470588, 1, 1,
0.3124999, -0.106583, 4.092329, 0, 0.4431373, 1, 1,
0.3141966, 0.698516, 0.3963083, 0, 0.4352941, 1, 1,
0.3158346, 0.8196591, 0.7214686, 0, 0.4313726, 1, 1,
0.3177561, -0.5878773, 1.09587, 0, 0.4235294, 1, 1,
0.3185942, -0.8849642, 2.950348, 0, 0.4196078, 1, 1,
0.324257, -0.6843164, 2.470744, 0, 0.4117647, 1, 1,
0.3288032, 1.159376, 1.210388, 0, 0.4078431, 1, 1,
0.3334267, -1.080777, 3.10661, 0, 0.4, 1, 1,
0.3384917, -0.9277256, 2.561931, 0, 0.3921569, 1, 1,
0.3413035, 0.02761612, 0.9992678, 0, 0.3882353, 1, 1,
0.3416527, 0.05585656, 2.701154, 0, 0.3803922, 1, 1,
0.3469276, 0.341297, -0.2012203, 0, 0.3764706, 1, 1,
0.349216, -1.352715, 4.480962, 0, 0.3686275, 1, 1,
0.3504775, -0.7372187, 2.896709, 0, 0.3647059, 1, 1,
0.3544972, -0.0570147, 0.1791788, 0, 0.3568628, 1, 1,
0.3551913, -0.510314, 2.907295, 0, 0.3529412, 1, 1,
0.3557596, -0.3698992, 1.659334, 0, 0.345098, 1, 1,
0.3558928, 1.514684, 0.2362999, 0, 0.3411765, 1, 1,
0.3567636, 0.7254075, 0.9052026, 0, 0.3333333, 1, 1,
0.3571159, -0.1520856, 0.9863102, 0, 0.3294118, 1, 1,
0.3587742, 0.006772206, 3.638791, 0, 0.3215686, 1, 1,
0.3621066, -0.6034293, 3.141454, 0, 0.3176471, 1, 1,
0.3658548, 1.717796, 2.22397, 0, 0.3098039, 1, 1,
0.3665356, -0.25133, 1.192019, 0, 0.3058824, 1, 1,
0.3666274, 0.5959277, 0.3737422, 0, 0.2980392, 1, 1,
0.3696438, -0.09412847, -0.7155769, 0, 0.2901961, 1, 1,
0.372922, 0.9435406, 0.739098, 0, 0.2862745, 1, 1,
0.378407, 1.091042, -1.279104, 0, 0.2784314, 1, 1,
0.387617, -0.7206366, 2.728323, 0, 0.2745098, 1, 1,
0.391618, 0.1107201, 0.7104341, 0, 0.2666667, 1, 1,
0.3952733, 1.031374, 0.4201896, 0, 0.2627451, 1, 1,
0.3977329, 1.889832, -0.8499759, 0, 0.254902, 1, 1,
0.4050299, 0.5172385, 2.894948, 0, 0.2509804, 1, 1,
0.4080492, -1.289837, 3.350432, 0, 0.2431373, 1, 1,
0.4096936, -0.3348664, 2.142835, 0, 0.2392157, 1, 1,
0.4104719, 1.5946, -0.5280186, 0, 0.2313726, 1, 1,
0.4126538, -0.9970115, 3.177926, 0, 0.227451, 1, 1,
0.413501, -0.1918878, 2.646562, 0, 0.2196078, 1, 1,
0.4149167, 1.012636, 0.4643351, 0, 0.2156863, 1, 1,
0.4266955, 1.293113, 0.4279426, 0, 0.2078431, 1, 1,
0.4290966, 0.5095079, 0.8967456, 0, 0.2039216, 1, 1,
0.4304188, 0.5440284, 0.901858, 0, 0.1960784, 1, 1,
0.4327941, -0.1364801, 1.373203, 0, 0.1882353, 1, 1,
0.4370987, -0.6477529, 2.265397, 0, 0.1843137, 1, 1,
0.4389552, 2.01853, 1.515838, 0, 0.1764706, 1, 1,
0.440784, 0.02827439, 1.473366, 0, 0.172549, 1, 1,
0.4443029, 0.6613138, 0.1365478, 0, 0.1647059, 1, 1,
0.4461705, -1.910017, 5.18138, 0, 0.1607843, 1, 1,
0.4479212, 0.8484026, -0.6378055, 0, 0.1529412, 1, 1,
0.4521146, -0.4271128, 1.801323, 0, 0.1490196, 1, 1,
0.453567, 0.4619238, 1.382409, 0, 0.1411765, 1, 1,
0.4584885, -0.7737639, 3.023602, 0, 0.1372549, 1, 1,
0.4590735, 0.3264076, -0.3140057, 0, 0.1294118, 1, 1,
0.4599119, 0.4342131, -0.04383969, 0, 0.1254902, 1, 1,
0.4605274, -1.29871, 2.778053, 0, 0.1176471, 1, 1,
0.4625807, 1.096419, 0.5339757, 0, 0.1137255, 1, 1,
0.4658534, -1.331073, 1.985286, 0, 0.1058824, 1, 1,
0.4668815, 0.01227616, 0.8940737, 0, 0.09803922, 1, 1,
0.4729286, 0.4940288, 0.5916076, 0, 0.09411765, 1, 1,
0.4770243, -0.03705366, 0.7444527, 0, 0.08627451, 1, 1,
0.4781085, 0.3770294, 3.678037, 0, 0.08235294, 1, 1,
0.478522, 0.5243213, -0.7838329, 0, 0.07450981, 1, 1,
0.4821883, 1.363424, 0.1915343, 0, 0.07058824, 1, 1,
0.4847714, -0.2307838, 1.191071, 0, 0.0627451, 1, 1,
0.4847893, 1.106814, -0.2338308, 0, 0.05882353, 1, 1,
0.4849443, 1.368974, 1.327794, 0, 0.05098039, 1, 1,
0.485507, -0.3623706, 2.225376, 0, 0.04705882, 1, 1,
0.4862965, 1.202555, -1.048938, 0, 0.03921569, 1, 1,
0.4943169, -1.72877, 4.518738, 0, 0.03529412, 1, 1,
0.497824, 0.6697056, -0.7580742, 0, 0.02745098, 1, 1,
0.4992327, -0.6893976, 3.389381, 0, 0.02352941, 1, 1,
0.5022615, 0.3769155, 1.649788, 0, 0.01568628, 1, 1,
0.502603, -1.262439, 2.448463, 0, 0.01176471, 1, 1,
0.505339, 0.3546443, 2.098621, 0, 0.003921569, 1, 1,
0.5091884, -0.5954719, 0.9649894, 0.003921569, 0, 1, 1,
0.5096877, -1.041755, 1.002832, 0.007843138, 0, 1, 1,
0.5104967, -2.467057, 1.835608, 0.01568628, 0, 1, 1,
0.5140384, 0.5354279, 0.1769014, 0.01960784, 0, 1, 1,
0.5186431, -0.2594613, 2.31399, 0.02745098, 0, 1, 1,
0.5245677, -0.6222532, 1.364756, 0.03137255, 0, 1, 1,
0.529851, 1.497231, 0.432243, 0.03921569, 0, 1, 1,
0.5300147, 0.4746708, 2.189973, 0.04313726, 0, 1, 1,
0.5306106, -1.090519, 2.303731, 0.05098039, 0, 1, 1,
0.5347039, -1.073663, 1.701301, 0.05490196, 0, 1, 1,
0.5353847, 1.611046, 0.567609, 0.0627451, 0, 1, 1,
0.5370374, 0.2668477, 1.13384, 0.06666667, 0, 1, 1,
0.538103, -0.4505638, 2.45942, 0.07450981, 0, 1, 1,
0.550867, -1.796463, 2.151522, 0.07843138, 0, 1, 1,
0.5512748, 0.9138761, 1.020717, 0.08627451, 0, 1, 1,
0.5515558, -1.156536, 3.329837, 0.09019608, 0, 1, 1,
0.5588542, -0.03890524, 1.738366, 0.09803922, 0, 1, 1,
0.5648953, -0.0671765, 0.3814059, 0.1058824, 0, 1, 1,
0.5668942, 0.2802295, 0.7792653, 0.1098039, 0, 1, 1,
0.5690484, 0.2608696, 0.515076, 0.1176471, 0, 1, 1,
0.5764852, 0.2879046, 0.00987298, 0.1215686, 0, 1, 1,
0.5768024, -0.07738073, 2.120159, 0.1294118, 0, 1, 1,
0.5796213, 1.061609, 0.8283299, 0.1333333, 0, 1, 1,
0.5809613, 1.202761, 1.508421, 0.1411765, 0, 1, 1,
0.5823032, -1.276224, 2.99306, 0.145098, 0, 1, 1,
0.5898852, 1.283143, 0.8952622, 0.1529412, 0, 1, 1,
0.5902165, 0.4301492, 0.03638786, 0.1568628, 0, 1, 1,
0.5909544, 0.005223337, 2.949658, 0.1647059, 0, 1, 1,
0.5917948, 0.8449172, 0.2214961, 0.1686275, 0, 1, 1,
0.5921436, 0.9417935, -0.5910065, 0.1764706, 0, 1, 1,
0.6009641, 2.322007, 1.016762, 0.1803922, 0, 1, 1,
0.6026694, 0.04271972, -0.3827682, 0.1882353, 0, 1, 1,
0.6039643, -1.11513, 4.464815, 0.1921569, 0, 1, 1,
0.6091915, -0.8685805, 1.055447, 0.2, 0, 1, 1,
0.6107141, -1.002798, 2.264739, 0.2078431, 0, 1, 1,
0.6108369, -2.017767, 2.71255, 0.2117647, 0, 1, 1,
0.615851, -1.009563, 1.034324, 0.2196078, 0, 1, 1,
0.6168724, -0.8357516, 2.116989, 0.2235294, 0, 1, 1,
0.6181939, -0.2370564, 2.813205, 0.2313726, 0, 1, 1,
0.6227542, -0.7221305, 3.223454, 0.2352941, 0, 1, 1,
0.6375523, 1.677235, 1.06582, 0.2431373, 0, 1, 1,
0.6412625, -1.718007, 3.036458, 0.2470588, 0, 1, 1,
0.6420355, -0.04776955, 0.7735426, 0.254902, 0, 1, 1,
0.6426651, 0.07445206, 2.710795, 0.2588235, 0, 1, 1,
0.6438867, -0.2367391, 2.977331, 0.2666667, 0, 1, 1,
0.6496625, -0.3245029, 2.354982, 0.2705882, 0, 1, 1,
0.6516104, 0.3080506, 2.187367, 0.2784314, 0, 1, 1,
0.6603708, 2.367447, -0.760349, 0.282353, 0, 1, 1,
0.6668279, 0.4865549, 2.618177, 0.2901961, 0, 1, 1,
0.668703, 0.4023259, 2.924321, 0.2941177, 0, 1, 1,
0.6694071, -0.922546, 3.42592, 0.3019608, 0, 1, 1,
0.6715476, 1.088564, -0.2711792, 0.3098039, 0, 1, 1,
0.6722986, -1.181752, 2.319364, 0.3137255, 0, 1, 1,
0.6773345, -0.4383448, 4.419081, 0.3215686, 0, 1, 1,
0.6823331, 0.1085944, 1.745384, 0.3254902, 0, 1, 1,
0.682973, -0.7567509, 3.696553, 0.3333333, 0, 1, 1,
0.689052, 0.04570451, 1.589715, 0.3372549, 0, 1, 1,
0.6893683, -0.2081615, 0.7653605, 0.345098, 0, 1, 1,
0.6930245, 1.250186, 1.588136, 0.3490196, 0, 1, 1,
0.6961167, 2.155992, 1.914708, 0.3568628, 0, 1, 1,
0.697029, 0.4514038, 0.6657693, 0.3607843, 0, 1, 1,
0.7067891, 1.136839, -0.2032876, 0.3686275, 0, 1, 1,
0.7122002, 0.1496629, 0.7058024, 0.372549, 0, 1, 1,
0.7138065, 1.500732, 1.762801, 0.3803922, 0, 1, 1,
0.7151912, 0.8130705, 0.6426439, 0.3843137, 0, 1, 1,
0.722612, -0.8634635, 3.556928, 0.3921569, 0, 1, 1,
0.7227829, 0.1352792, 0.9029059, 0.3960784, 0, 1, 1,
0.7285239, -1.864917, 2.654295, 0.4039216, 0, 1, 1,
0.7423629, -1.963012, 3.737892, 0.4117647, 0, 1, 1,
0.7482102, 1.707853, -0.429813, 0.4156863, 0, 1, 1,
0.7529719, 0.1250013, 2.768226, 0.4235294, 0, 1, 1,
0.758706, -0.7129635, 3.334036, 0.427451, 0, 1, 1,
0.7601218, 0.9742573, 0.07962024, 0.4352941, 0, 1, 1,
0.7620563, 2.246071, 0.5457587, 0.4392157, 0, 1, 1,
0.7633168, 1.50607, 1.554562, 0.4470588, 0, 1, 1,
0.7638043, 0.3630901, 2.395676, 0.4509804, 0, 1, 1,
0.7647657, -0.7758714, 3.008271, 0.4588235, 0, 1, 1,
0.766205, 0.2725893, -0.3898372, 0.4627451, 0, 1, 1,
0.7726166, -0.340647, 3.220147, 0.4705882, 0, 1, 1,
0.7730322, 2.117107, -0.01932633, 0.4745098, 0, 1, 1,
0.7736686, 1.22102, 1.289777, 0.4823529, 0, 1, 1,
0.7778069, -0.1996862, 4.120474, 0.4862745, 0, 1, 1,
0.7813962, -0.6909484, 2.95932, 0.4941176, 0, 1, 1,
0.7851722, -0.1314764, 1.09218, 0.5019608, 0, 1, 1,
0.7876901, -0.3102711, 0.667932, 0.5058824, 0, 1, 1,
0.7902552, 0.4326939, 0.7063069, 0.5137255, 0, 1, 1,
0.794061, 0.2745394, 2.787658, 0.5176471, 0, 1, 1,
0.8012928, -1.936387, 3.452057, 0.5254902, 0, 1, 1,
0.8032017, -0.5539789, 2.504966, 0.5294118, 0, 1, 1,
0.8045697, -0.08247644, 1.167786, 0.5372549, 0, 1, 1,
0.8073136, 0.3185855, 0.6772656, 0.5411765, 0, 1, 1,
0.8095972, -0.4270576, 2.105082, 0.5490196, 0, 1, 1,
0.8127173, -0.7766718, 3.09332, 0.5529412, 0, 1, 1,
0.8158054, -0.2852699, 3.311619, 0.5607843, 0, 1, 1,
0.817526, 0.7140252, 0.6457556, 0.5647059, 0, 1, 1,
0.8216047, 0.5138777, 2.781977, 0.572549, 0, 1, 1,
0.8241162, 0.1042925, 0.4075567, 0.5764706, 0, 1, 1,
0.8241519, 0.7962381, 0.5360028, 0.5843138, 0, 1, 1,
0.8250485, -0.08655516, 1.849103, 0.5882353, 0, 1, 1,
0.833268, -0.6275176, 1.764283, 0.5960785, 0, 1, 1,
0.8356118, -1.444706, 3.121336, 0.6039216, 0, 1, 1,
0.840435, 0.661626, 0.1294017, 0.6078432, 0, 1, 1,
0.8410906, -0.2218948, 1.576637, 0.6156863, 0, 1, 1,
0.8488243, 0.1701834, 0.7134129, 0.6196079, 0, 1, 1,
0.8553795, 0.4222188, 2.445473, 0.627451, 0, 1, 1,
0.8586105, 0.922112, 2.614939, 0.6313726, 0, 1, 1,
0.8607708, 0.04432382, 1.902989, 0.6392157, 0, 1, 1,
0.8609517, 0.5322981, 0.9663898, 0.6431373, 0, 1, 1,
0.8628095, 1.6661, 1.187231, 0.6509804, 0, 1, 1,
0.8638236, -0.71145, 2.861301, 0.654902, 0, 1, 1,
0.8659631, -1.436611, 1.955678, 0.6627451, 0, 1, 1,
0.8670797, -1.315826, 4.417259, 0.6666667, 0, 1, 1,
0.8774666, 0.07724845, 3.108947, 0.6745098, 0, 1, 1,
0.880383, -1.728244, 3.694453, 0.6784314, 0, 1, 1,
0.8861235, -0.5287878, 1.301628, 0.6862745, 0, 1, 1,
0.8862807, 0.9401401, 1.039555, 0.6901961, 0, 1, 1,
0.8884555, -1.085725, 2.980346, 0.6980392, 0, 1, 1,
0.8890257, 0.05648633, 1.360072, 0.7058824, 0, 1, 1,
0.890443, -0.9041862, 0.9553127, 0.7098039, 0, 1, 1,
0.8938171, -1.008458, 3.394328, 0.7176471, 0, 1, 1,
0.8986518, 2.148199, 1.769735, 0.7215686, 0, 1, 1,
0.8995931, 1.057534, -0.2730553, 0.7294118, 0, 1, 1,
0.9032632, 0.7102293, 0.6935297, 0.7333333, 0, 1, 1,
0.9053687, 1.22445, -1.002003, 0.7411765, 0, 1, 1,
0.9093525, 2.110003, 2.191706, 0.7450981, 0, 1, 1,
0.9103277, 0.8573849, 2.01428, 0.7529412, 0, 1, 1,
0.9106877, 0.04736004, -0.131285, 0.7568628, 0, 1, 1,
0.9111852, -1.689318, 3.476453, 0.7647059, 0, 1, 1,
0.9123493, -1.012122, 1.109756, 0.7686275, 0, 1, 1,
0.923513, -0.4975372, 3.790593, 0.7764706, 0, 1, 1,
0.9313333, 0.06110236, 0.4382075, 0.7803922, 0, 1, 1,
0.9334639, 1.696815, 1.294127, 0.7882353, 0, 1, 1,
0.9387605, -1.221209, 3.787513, 0.7921569, 0, 1, 1,
0.9482521, 0.6831468, 2.437392, 0.8, 0, 1, 1,
0.9513535, -0.2836199, 1.307191, 0.8078431, 0, 1, 1,
0.9557396, 1.840624, 2.130279, 0.8117647, 0, 1, 1,
0.9558475, -1.101741, 1.99984, 0.8196079, 0, 1, 1,
0.9568164, -2.343961, 2.359236, 0.8235294, 0, 1, 1,
0.9604652, -0.340128, 1.113269, 0.8313726, 0, 1, 1,
0.9611224, -0.4636655, 2.987963, 0.8352941, 0, 1, 1,
0.9622241, -0.5143081, 2.762726, 0.8431373, 0, 1, 1,
0.9675446, -0.3942204, 1.255558, 0.8470588, 0, 1, 1,
0.9724293, 0.5857703, 0.6821946, 0.854902, 0, 1, 1,
0.9743853, -0.328464, 0.7183325, 0.8588235, 0, 1, 1,
0.9907103, 0.866685, 1.893442, 0.8666667, 0, 1, 1,
0.9931167, -1.049205, 2.072956, 0.8705882, 0, 1, 1,
0.9982733, 0.1611104, 1.508411, 0.8784314, 0, 1, 1,
1.005594, 1.10364, 0.823772, 0.8823529, 0, 1, 1,
1.010066, 0.4279901, 0.665575, 0.8901961, 0, 1, 1,
1.010107, -1.16802, 2.642789, 0.8941177, 0, 1, 1,
1.011511, -1.739385, 2.479405, 0.9019608, 0, 1, 1,
1.01729, 1.727566, -0.3760344, 0.9098039, 0, 1, 1,
1.0196, -1.388589, 1.473778, 0.9137255, 0, 1, 1,
1.022084, -0.05456609, 1.882125, 0.9215686, 0, 1, 1,
1.024052, 0.9299635, -0.3122647, 0.9254902, 0, 1, 1,
1.025188, -1.07193, 3.268875, 0.9333333, 0, 1, 1,
1.026994, 1.33096, 1.929689, 0.9372549, 0, 1, 1,
1.028279, -0.4302546, 1.679959, 0.945098, 0, 1, 1,
1.029588, 0.3780143, 0.5754613, 0.9490196, 0, 1, 1,
1.029922, 1.631424, -0.4650425, 0.9568627, 0, 1, 1,
1.034379, -1.848067, 2.510405, 0.9607843, 0, 1, 1,
1.038232, -0.4243834, 1.019519, 0.9686275, 0, 1, 1,
1.038575, 1.004676, 3.400352, 0.972549, 0, 1, 1,
1.050774, 1.265733, 0.5798989, 0.9803922, 0, 1, 1,
1.051002, -0.03896827, 1.800166, 0.9843137, 0, 1, 1,
1.052813, -0.1736009, 1.343152, 0.9921569, 0, 1, 1,
1.053138, 0.1960419, 1.32064, 0.9960784, 0, 1, 1,
1.055546, 1.406323, 0.2991489, 1, 0, 0.9960784, 1,
1.061013, 0.4812469, 0.1036321, 1, 0, 0.9882353, 1,
1.062368, 0.233705, -0.3723872, 1, 0, 0.9843137, 1,
1.064465, -0.1795378, 0.2974154, 1, 0, 0.9764706, 1,
1.066288, 0.2878528, 2.410228, 1, 0, 0.972549, 1,
1.067571, -0.233732, 1.049992, 1, 0, 0.9647059, 1,
1.074652, 0.5949726, 1.026555, 1, 0, 0.9607843, 1,
1.076337, 0.4197963, 1.866501, 1, 0, 0.9529412, 1,
1.080273, 1.52661, -1.318308, 1, 0, 0.9490196, 1,
1.088773, 1.070144, 1.650712, 1, 0, 0.9411765, 1,
1.090316, -0.07984934, 0.4659604, 1, 0, 0.9372549, 1,
1.095189, -2.229369, 2.486233, 1, 0, 0.9294118, 1,
1.101419, -3.179972, 2.652946, 1, 0, 0.9254902, 1,
1.106087, -0.4996212, -0.1101439, 1, 0, 0.9176471, 1,
1.108582, 0.6603609, -0.5704229, 1, 0, 0.9137255, 1,
1.111917, -1.558552, 2.546176, 1, 0, 0.9058824, 1,
1.117827, 0.2329238, -0.3722498, 1, 0, 0.9019608, 1,
1.118724, 0.5910079, 0.4843952, 1, 0, 0.8941177, 1,
1.119159, 0.9280626, 1.855751, 1, 0, 0.8862745, 1,
1.147802, 1.642126, 0.5908139, 1, 0, 0.8823529, 1,
1.148932, 0.8180487, 0.9543809, 1, 0, 0.8745098, 1,
1.155341, 1.765825, 0.3231106, 1, 0, 0.8705882, 1,
1.156072, -0.784426, 1.895384, 1, 0, 0.8627451, 1,
1.157065, -0.6779066, 1.679226, 1, 0, 0.8588235, 1,
1.162219, 1.54178, 1.085264, 1, 0, 0.8509804, 1,
1.163381, 0.1148769, 1.398394, 1, 0, 0.8470588, 1,
1.164048, 0.6834401, 0.6960385, 1, 0, 0.8392157, 1,
1.165589, 0.04270779, 2.706684, 1, 0, 0.8352941, 1,
1.16992, -0.4692219, 1.636931, 1, 0, 0.827451, 1,
1.171438, -0.4556595, 2.621341, 1, 0, 0.8235294, 1,
1.173116, -0.9990603, 2.561721, 1, 0, 0.8156863, 1,
1.174387, -0.7727765, 2.295821, 1, 0, 0.8117647, 1,
1.179424, -0.1649399, 0.8943936, 1, 0, 0.8039216, 1,
1.187463, 0.988061, 0.3552895, 1, 0, 0.7960784, 1,
1.191253, -1.229769, 0.9564699, 1, 0, 0.7921569, 1,
1.195005, 1.144827, -0.8459564, 1, 0, 0.7843137, 1,
1.196058, 0.3738972, 1.906, 1, 0, 0.7803922, 1,
1.201857, 0.2869197, 0.07330195, 1, 0, 0.772549, 1,
1.205273, -0.305303, 3.628995, 1, 0, 0.7686275, 1,
1.208533, 0.8594187, 1.377654, 1, 0, 0.7607843, 1,
1.216387, -1.029631, 0.6723723, 1, 0, 0.7568628, 1,
1.220872, -0.471104, 0.3919574, 1, 0, 0.7490196, 1,
1.238547, 0.4947939, 0.5980129, 1, 0, 0.7450981, 1,
1.246991, -2.183953, 4.136858, 1, 0, 0.7372549, 1,
1.250205, 2.040329, -1.502217, 1, 0, 0.7333333, 1,
1.251308, 0.9909086, 0.8542368, 1, 0, 0.7254902, 1,
1.253377, 1.796587, 1.34583, 1, 0, 0.7215686, 1,
1.255764, -1.832114, 2.094015, 1, 0, 0.7137255, 1,
1.260048, -0.03089632, 0.736267, 1, 0, 0.7098039, 1,
1.262725, 0.1948056, 0.606822, 1, 0, 0.7019608, 1,
1.26311, 2.199853, 2.128188, 1, 0, 0.6941177, 1,
1.264833, -0.764289, 3.835373, 1, 0, 0.6901961, 1,
1.265651, 0.05984802, 3.35692, 1, 0, 0.682353, 1,
1.275222, 0.7630515, 2.232243, 1, 0, 0.6784314, 1,
1.283441, -2.061926, 1.937973, 1, 0, 0.6705883, 1,
1.284071, 0.2212965, 0.1793058, 1, 0, 0.6666667, 1,
1.299148, -0.04064584, 2.429665, 1, 0, 0.6588235, 1,
1.312212, 0.02078689, 2.02813, 1, 0, 0.654902, 1,
1.336949, -0.01636887, 2.031063, 1, 0, 0.6470588, 1,
1.337335, 0.7817987, 2.165996, 1, 0, 0.6431373, 1,
1.337357, -0.7651876, 1.516125, 1, 0, 0.6352941, 1,
1.349258, -0.3438966, 1.578392, 1, 0, 0.6313726, 1,
1.358064, 0.1408941, 3.204759, 1, 0, 0.6235294, 1,
1.362455, 0.8277154, 0.5059135, 1, 0, 0.6196079, 1,
1.377594, 0.7081526, 3.127776, 1, 0, 0.6117647, 1,
1.380426, 0.7086288, 1.987745, 1, 0, 0.6078432, 1,
1.390918, 0.9019473, 2.641533, 1, 0, 0.6, 1,
1.394131, -0.6727809, 3.033636, 1, 0, 0.5921569, 1,
1.396893, -0.430983, 0.8068298, 1, 0, 0.5882353, 1,
1.399146, 0.2980063, 2.588371, 1, 0, 0.5803922, 1,
1.402809, -0.4131412, 1.446956, 1, 0, 0.5764706, 1,
1.422761, -0.02276611, 2.302833, 1, 0, 0.5686275, 1,
1.423973, 2.054821, -0.1135353, 1, 0, 0.5647059, 1,
1.430781, 0.3721108, 1.837002, 1, 0, 0.5568628, 1,
1.432052, 0.03136455, 0.7829678, 1, 0, 0.5529412, 1,
1.438536, -0.3614918, 2.066231, 1, 0, 0.5450981, 1,
1.442835, 1.000291, 1.355695, 1, 0, 0.5411765, 1,
1.443961, 0.4949114, 0.8283693, 1, 0, 0.5333334, 1,
1.458282, 0.03383137, 1.910335, 1, 0, 0.5294118, 1,
1.458765, -0.6633329, 1.493028, 1, 0, 0.5215687, 1,
1.460806, 0.4902694, 1.452876, 1, 0, 0.5176471, 1,
1.461446, 0.9205424, 0.9361216, 1, 0, 0.509804, 1,
1.501726, -0.007041954, 0.3076378, 1, 0, 0.5058824, 1,
1.504291, 0.9994577, -0.9994668, 1, 0, 0.4980392, 1,
1.515595, -0.1765412, 1.101904, 1, 0, 0.4901961, 1,
1.519367, 0.5403789, 0.3315004, 1, 0, 0.4862745, 1,
1.522859, 1.934739, 0.5924697, 1, 0, 0.4784314, 1,
1.537671, 0.352782, 1.581346, 1, 0, 0.4745098, 1,
1.543878, -0.2371849, 2.492586, 1, 0, 0.4666667, 1,
1.557685, -0.6150035, 1.137569, 1, 0, 0.4627451, 1,
1.560228, -0.1529778, 1.587489, 1, 0, 0.454902, 1,
1.578183, -0.4527641, 1.370338, 1, 0, 0.4509804, 1,
1.579879, -0.09403223, 2.662193, 1, 0, 0.4431373, 1,
1.581816, -1.333871, 3.591496, 1, 0, 0.4392157, 1,
1.592948, -0.3605549, 1.172425, 1, 0, 0.4313726, 1,
1.598598, -2.251514, 1.702474, 1, 0, 0.427451, 1,
1.605759, 0.6522028, 0.3289051, 1, 0, 0.4196078, 1,
1.623625, 0.9140055, 1.2429, 1, 0, 0.4156863, 1,
1.626641, -0.8879558, 3.141386, 1, 0, 0.4078431, 1,
1.628676, 0.3483618, 2.082544, 1, 0, 0.4039216, 1,
1.633066, 1.472959, 0.9424787, 1, 0, 0.3960784, 1,
1.636391, 2.039327, 0.6051616, 1, 0, 0.3882353, 1,
1.643515, 1.517406, -1.408098, 1, 0, 0.3843137, 1,
1.645021, 1.565143, 1.779275, 1, 0, 0.3764706, 1,
1.647388, -0.1119253, 2.174557, 1, 0, 0.372549, 1,
1.664935, -0.2433301, 1.723639, 1, 0, 0.3647059, 1,
1.665048, 0.8693327, 1.743534, 1, 0, 0.3607843, 1,
1.673716, -1.407397, 0.5784548, 1, 0, 0.3529412, 1,
1.678543, 1.125638, 1.283535, 1, 0, 0.3490196, 1,
1.690143, 0.2335006, 0.8027455, 1, 0, 0.3411765, 1,
1.693646, 0.7763892, 1.264575, 1, 0, 0.3372549, 1,
1.701274, 0.2610002, 1.35662, 1, 0, 0.3294118, 1,
1.726664, 0.7344763, -0.8594866, 1, 0, 0.3254902, 1,
1.733402, 0.1991099, 3.441188, 1, 0, 0.3176471, 1,
1.765408, 0.3944649, 1.411363, 1, 0, 0.3137255, 1,
1.792031, -0.6355231, 0.932938, 1, 0, 0.3058824, 1,
1.794982, -1.596303, 1.317571, 1, 0, 0.2980392, 1,
1.795798, 2.177741, -0.4915276, 1, 0, 0.2941177, 1,
1.803536, 1.921312, 1.08564, 1, 0, 0.2862745, 1,
1.810748, 0.6295047, 2.697346, 1, 0, 0.282353, 1,
1.818822, -0.4032447, 1.321094, 1, 0, 0.2745098, 1,
1.830501, 2.203515, -1.083676, 1, 0, 0.2705882, 1,
1.851125, 0.634095, 1.138611, 1, 0, 0.2627451, 1,
1.855812, 0.3348575, 1.321691, 1, 0, 0.2588235, 1,
1.857825, 2.036861, 0.4600401, 1, 0, 0.2509804, 1,
1.876577, -0.8005943, 1.731828, 1, 0, 0.2470588, 1,
1.880856, -0.05946689, -0.4187607, 1, 0, 0.2392157, 1,
1.888342, 0.60098, 1.340425, 1, 0, 0.2352941, 1,
1.913213, 1.15239, 1.013905, 1, 0, 0.227451, 1,
1.929338, 2.842783, 0.8854123, 1, 0, 0.2235294, 1,
1.958058, -0.9830697, 2.651953, 1, 0, 0.2156863, 1,
1.960612, -0.7318081, 2.52809, 1, 0, 0.2117647, 1,
1.983037, -0.813491, 0.1696345, 1, 0, 0.2039216, 1,
2.033665, 0.05994453, 1.227977, 1, 0, 0.1960784, 1,
2.036904, -0.9874666, 2.284194, 1, 0, 0.1921569, 1,
2.048182, -0.8250936, 2.432942, 1, 0, 0.1843137, 1,
2.052253, -1.632878, 2.492695, 1, 0, 0.1803922, 1,
2.062205, -0.5133202, 1.319676, 1, 0, 0.172549, 1,
2.065906, 0.5867427, 0.4506716, 1, 0, 0.1686275, 1,
2.081044, 0.4566962, 1.299948, 1, 0, 0.1607843, 1,
2.114474, -0.6281953, 0.5537726, 1, 0, 0.1568628, 1,
2.119763, -0.2550157, 0.9074689, 1, 0, 0.1490196, 1,
2.120844, 0.5642062, 0.8998643, 1, 0, 0.145098, 1,
2.142473, 0.9115756, 1.040543, 1, 0, 0.1372549, 1,
2.170115, -1.708662, 1.843281, 1, 0, 0.1333333, 1,
2.175957, 0.4199177, 2.379791, 1, 0, 0.1254902, 1,
2.176663, 0.5234783, -0.006129793, 1, 0, 0.1215686, 1,
2.203691, -0.3225709, 1.856352, 1, 0, 0.1137255, 1,
2.208538, 1.313857, 2.374619, 1, 0, 0.1098039, 1,
2.277722, 0.6051475, 0.3001239, 1, 0, 0.1019608, 1,
2.323889, -1.410368, 3.105372, 1, 0, 0.09411765, 1,
2.345352, -0.9064657, 1.370789, 1, 0, 0.09019608, 1,
2.371582, 0.1160114, 1.898184, 1, 0, 0.08235294, 1,
2.389052, -1.185549, 2.455963, 1, 0, 0.07843138, 1,
2.3925, -0.3405215, 0.7276419, 1, 0, 0.07058824, 1,
2.394112, -0.2750815, -0.04287036, 1, 0, 0.06666667, 1,
2.409315, -1.656703, 2.792748, 1, 0, 0.05882353, 1,
2.522271, 1.983454, -0.8956152, 1, 0, 0.05490196, 1,
2.522503, 0.7134774, 0.1127595, 1, 0, 0.04705882, 1,
2.580277, -1.251822, 2.177712, 1, 0, 0.04313726, 1,
2.594281, -0.3047749, 5.132901, 1, 0, 0.03529412, 1,
2.62395, -0.0149643, 1.293066, 1, 0, 0.03137255, 1,
2.727029, 1.497206, 1.275372, 1, 0, 0.02352941, 1,
2.988824, -1.607739, 1.445341, 1, 0, 0.01960784, 1,
3.005628, -0.3718548, 1.589342, 1, 0, 0.01176471, 1,
3.585641, 2.078725, 0.1986266, 1, 0, 0.007843138, 1
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
0.4085956, -4.214622, -8.252921, 0, -0.5, 0.5, 0.5,
0.4085956, -4.214622, -8.252921, 1, -0.5, 0.5, 0.5,
0.4085956, -4.214622, -8.252921, 1, 1.5, 0.5, 0.5,
0.4085956, -4.214622, -8.252921, 0, 1.5, 0.5, 0.5
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
-3.845468, -0.1279069, -8.252921, 0, -0.5, 0.5, 0.5,
-3.845468, -0.1279069, -8.252921, 1, -0.5, 0.5, 0.5,
-3.845468, -0.1279069, -8.252921, 1, 1.5, 0.5, 0.5,
-3.845468, -0.1279069, -8.252921, 0, 1.5, 0.5, 0.5
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
-3.845468, -4.214622, -0.5622289, 0, -0.5, 0.5, 0.5,
-3.845468, -4.214622, -0.5622289, 1, -0.5, 0.5, 0.5,
-3.845468, -4.214622, -0.5622289, 1, 1.5, 0.5, 0.5,
-3.845468, -4.214622, -0.5622289, 0, 1.5, 0.5, 0.5
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
-2, -3.271534, -6.478146,
3, -3.271534, -6.478146,
-2, -3.271534, -6.478146,
-2, -3.428715, -6.773942,
-1, -3.271534, -6.478146,
-1, -3.428715, -6.773942,
0, -3.271534, -6.478146,
0, -3.428715, -6.773942,
1, -3.271534, -6.478146,
1, -3.428715, -6.773942,
2, -3.271534, -6.478146,
2, -3.428715, -6.773942,
3, -3.271534, -6.478146,
3, -3.428715, -6.773942
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
-2, -3.743078, -7.365533, 0, -0.5, 0.5, 0.5,
-2, -3.743078, -7.365533, 1, -0.5, 0.5, 0.5,
-2, -3.743078, -7.365533, 1, 1.5, 0.5, 0.5,
-2, -3.743078, -7.365533, 0, 1.5, 0.5, 0.5,
-1, -3.743078, -7.365533, 0, -0.5, 0.5, 0.5,
-1, -3.743078, -7.365533, 1, -0.5, 0.5, 0.5,
-1, -3.743078, -7.365533, 1, 1.5, 0.5, 0.5,
-1, -3.743078, -7.365533, 0, 1.5, 0.5, 0.5,
0, -3.743078, -7.365533, 0, -0.5, 0.5, 0.5,
0, -3.743078, -7.365533, 1, -0.5, 0.5, 0.5,
0, -3.743078, -7.365533, 1, 1.5, 0.5, 0.5,
0, -3.743078, -7.365533, 0, 1.5, 0.5, 0.5,
1, -3.743078, -7.365533, 0, -0.5, 0.5, 0.5,
1, -3.743078, -7.365533, 1, -0.5, 0.5, 0.5,
1, -3.743078, -7.365533, 1, 1.5, 0.5, 0.5,
1, -3.743078, -7.365533, 0, 1.5, 0.5, 0.5,
2, -3.743078, -7.365533, 0, -0.5, 0.5, 0.5,
2, -3.743078, -7.365533, 1, -0.5, 0.5, 0.5,
2, -3.743078, -7.365533, 1, 1.5, 0.5, 0.5,
2, -3.743078, -7.365533, 0, 1.5, 0.5, 0.5,
3, -3.743078, -7.365533, 0, -0.5, 0.5, 0.5,
3, -3.743078, -7.365533, 1, -0.5, 0.5, 0.5,
3, -3.743078, -7.365533, 1, 1.5, 0.5, 0.5,
3, -3.743078, -7.365533, 0, 1.5, 0.5, 0.5
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
-2.863761, -3, -6.478146,
-2.863761, 2, -6.478146,
-2.863761, -3, -6.478146,
-3.027379, -3, -6.773942,
-2.863761, -2, -6.478146,
-3.027379, -2, -6.773942,
-2.863761, -1, -6.478146,
-3.027379, -1, -6.773942,
-2.863761, 0, -6.478146,
-3.027379, 0, -6.773942,
-2.863761, 1, -6.478146,
-3.027379, 1, -6.773942,
-2.863761, 2, -6.478146,
-3.027379, 2, -6.773942
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
-3.354615, -3, -7.365533, 0, -0.5, 0.5, 0.5,
-3.354615, -3, -7.365533, 1, -0.5, 0.5, 0.5,
-3.354615, -3, -7.365533, 1, 1.5, 0.5, 0.5,
-3.354615, -3, -7.365533, 0, 1.5, 0.5, 0.5,
-3.354615, -2, -7.365533, 0, -0.5, 0.5, 0.5,
-3.354615, -2, -7.365533, 1, -0.5, 0.5, 0.5,
-3.354615, -2, -7.365533, 1, 1.5, 0.5, 0.5,
-3.354615, -2, -7.365533, 0, 1.5, 0.5, 0.5,
-3.354615, -1, -7.365533, 0, -0.5, 0.5, 0.5,
-3.354615, -1, -7.365533, 1, -0.5, 0.5, 0.5,
-3.354615, -1, -7.365533, 1, 1.5, 0.5, 0.5,
-3.354615, -1, -7.365533, 0, 1.5, 0.5, 0.5,
-3.354615, 0, -7.365533, 0, -0.5, 0.5, 0.5,
-3.354615, 0, -7.365533, 1, -0.5, 0.5, 0.5,
-3.354615, 0, -7.365533, 1, 1.5, 0.5, 0.5,
-3.354615, 0, -7.365533, 0, 1.5, 0.5, 0.5,
-3.354615, 1, -7.365533, 0, -0.5, 0.5, 0.5,
-3.354615, 1, -7.365533, 1, -0.5, 0.5, 0.5,
-3.354615, 1, -7.365533, 1, 1.5, 0.5, 0.5,
-3.354615, 1, -7.365533, 0, 1.5, 0.5, 0.5,
-3.354615, 2, -7.365533, 0, -0.5, 0.5, 0.5,
-3.354615, 2, -7.365533, 1, -0.5, 0.5, 0.5,
-3.354615, 2, -7.365533, 1, 1.5, 0.5, 0.5,
-3.354615, 2, -7.365533, 0, 1.5, 0.5, 0.5
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
-2.863761, -3.271534, -6,
-2.863761, -3.271534, 4,
-2.863761, -3.271534, -6,
-3.027379, -3.428715, -6,
-2.863761, -3.271534, -4,
-3.027379, -3.428715, -4,
-2.863761, -3.271534, -2,
-3.027379, -3.428715, -2,
-2.863761, -3.271534, 0,
-3.027379, -3.428715, 0,
-2.863761, -3.271534, 2,
-3.027379, -3.428715, 2,
-2.863761, -3.271534, 4,
-3.027379, -3.428715, 4
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
"-6",
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
-3.354615, -3.743078, -6, 0, -0.5, 0.5, 0.5,
-3.354615, -3.743078, -6, 1, -0.5, 0.5, 0.5,
-3.354615, -3.743078, -6, 1, 1.5, 0.5, 0.5,
-3.354615, -3.743078, -6, 0, 1.5, 0.5, 0.5,
-3.354615, -3.743078, -4, 0, -0.5, 0.5, 0.5,
-3.354615, -3.743078, -4, 1, -0.5, 0.5, 0.5,
-3.354615, -3.743078, -4, 1, 1.5, 0.5, 0.5,
-3.354615, -3.743078, -4, 0, 1.5, 0.5, 0.5,
-3.354615, -3.743078, -2, 0, -0.5, 0.5, 0.5,
-3.354615, -3.743078, -2, 1, -0.5, 0.5, 0.5,
-3.354615, -3.743078, -2, 1, 1.5, 0.5, 0.5,
-3.354615, -3.743078, -2, 0, 1.5, 0.5, 0.5,
-3.354615, -3.743078, 0, 0, -0.5, 0.5, 0.5,
-3.354615, -3.743078, 0, 1, -0.5, 0.5, 0.5,
-3.354615, -3.743078, 0, 1, 1.5, 0.5, 0.5,
-3.354615, -3.743078, 0, 0, 1.5, 0.5, 0.5,
-3.354615, -3.743078, 2, 0, -0.5, 0.5, 0.5,
-3.354615, -3.743078, 2, 1, -0.5, 0.5, 0.5,
-3.354615, -3.743078, 2, 1, 1.5, 0.5, 0.5,
-3.354615, -3.743078, 2, 0, 1.5, 0.5, 0.5,
-3.354615, -3.743078, 4, 0, -0.5, 0.5, 0.5,
-3.354615, -3.743078, 4, 1, -0.5, 0.5, 0.5,
-3.354615, -3.743078, 4, 1, 1.5, 0.5, 0.5,
-3.354615, -3.743078, 4, 0, 1.5, 0.5, 0.5
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
-2.863761, -3.271534, -6.478146,
-2.863761, 3.01572, -6.478146,
-2.863761, -3.271534, 5.353688,
-2.863761, 3.01572, 5.353688,
-2.863761, -3.271534, -6.478146,
-2.863761, -3.271534, 5.353688,
-2.863761, 3.01572, -6.478146,
-2.863761, 3.01572, 5.353688,
-2.863761, -3.271534, -6.478146,
3.680952, -3.271534, -6.478146,
-2.863761, -3.271534, 5.353688,
3.680952, -3.271534, 5.353688,
-2.863761, 3.01572, -6.478146,
3.680952, 3.01572, -6.478146,
-2.863761, 3.01572, 5.353688,
3.680952, 3.01572, 5.353688,
3.680952, -3.271534, -6.478146,
3.680952, 3.01572, -6.478146,
3.680952, -3.271534, 5.353688,
3.680952, 3.01572, 5.353688,
3.680952, -3.271534, -6.478146,
3.680952, -3.271534, 5.353688,
3.680952, 3.01572, -6.478146,
3.680952, 3.01572, 5.353688
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
var radius = 7.962493;
var distance = 35.42603;
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
mvMatrix.translate( -0.4085956, 0.1279069, 0.5622289 );
mvMatrix.scale( 1.315444, 1.36931, 0.7276305 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.42603);
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
cyhalofop-butyl<-read.table("cyhalofop-butyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyhalofop-butyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyhalofop' not found
```

```r
y<-cyhalofop-butyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyhalofop' not found
```

```r
z<-cyhalofop-butyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyhalofop' not found
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
-2.76845, -2.52439, -2.502903, 0, 0, 1, 1, 1,
-2.747063, -1.666726, -1.830692, 1, 0, 0, 1, 1,
-2.658745, -1.009711, -2.162339, 1, 0, 0, 1, 1,
-2.641566, 0.5087889, -0.6090144, 1, 0, 0, 1, 1,
-2.578847, -0.241773, -1.994844, 1, 0, 0, 1, 1,
-2.486456, 1.186539, -1.706206, 1, 0, 0, 1, 1,
-2.458707, -0.6055298, -0.883964, 0, 0, 0, 1, 1,
-2.443032, 1.12257, -1.198775, 0, 0, 0, 1, 1,
-2.416067, -0.9377521, -1.606026, 0, 0, 0, 1, 1,
-2.340483, -0.6670963, -3.336694, 0, 0, 0, 1, 1,
-2.330835, -0.01887988, -1.578103, 0, 0, 0, 1, 1,
-2.281676, -0.5231898, -1.103568, 0, 0, 0, 1, 1,
-2.247948, -0.470016, -1.225772, 0, 0, 0, 1, 1,
-2.211573, -0.3307338, -1.769739, 1, 1, 1, 1, 1,
-2.205698, -0.2895815, -0.8396349, 1, 1, 1, 1, 1,
-2.204338, -1.108601, -2.479538, 1, 1, 1, 1, 1,
-2.156019, 0.3407408, -3.075419, 1, 1, 1, 1, 1,
-2.150095, -0.5780835, -4.135936, 1, 1, 1, 1, 1,
-2.12961, -2.003772, -3.260358, 1, 1, 1, 1, 1,
-2.110643, 0.7603459, -1.225533, 1, 1, 1, 1, 1,
-2.103971, 1.114809, -0.4057222, 1, 1, 1, 1, 1,
-2.058553, 0.5965518, -0.4990563, 1, 1, 1, 1, 1,
-2.049657, 0.8745286, -2.033994, 1, 1, 1, 1, 1,
-2.005736, 0.04337135, -1.039292, 1, 1, 1, 1, 1,
-1.989511, 0.08878414, 0.4362208, 1, 1, 1, 1, 1,
-1.979313, 0.8663189, -0.3665156, 1, 1, 1, 1, 1,
-1.96831, 1.422156, -2.499975, 1, 1, 1, 1, 1,
-1.938873, 0.9632111, -1.049946, 1, 1, 1, 1, 1,
-1.925712, -0.8574702, -2.259809, 0, 0, 1, 1, 1,
-1.922537, 1.431038, -2.115056, 1, 0, 0, 1, 1,
-1.906713, 0.2031751, -2.038826, 1, 0, 0, 1, 1,
-1.902423, 1.554693, -0.6283925, 1, 0, 0, 1, 1,
-1.893325, -0.6737733, -3.230418, 1, 0, 0, 1, 1,
-1.861359, -0.02845125, -1.678332, 1, 0, 0, 1, 1,
-1.845204, -0.3932039, -1.872441, 0, 0, 0, 1, 1,
-1.842978, -1.5587, -1.637625, 0, 0, 0, 1, 1,
-1.825506, -0.7466453, -2.764607, 0, 0, 0, 1, 1,
-1.819581, 1.196957, -0.9517282, 0, 0, 0, 1, 1,
-1.802475, -0.8854855, -0.03590764, 0, 0, 0, 1, 1,
-1.787184, -0.8184337, -1.971389, 0, 0, 0, 1, 1,
-1.786234, 0.7102908, -1.145766, 0, 0, 0, 1, 1,
-1.781186, 0.3044997, -0.9498124, 1, 1, 1, 1, 1,
-1.778665, 0.5401376, -2.239784, 1, 1, 1, 1, 1,
-1.76079, -0.6638079, -3.691169, 1, 1, 1, 1, 1,
-1.758476, -0.9477037, -2.224275, 1, 1, 1, 1, 1,
-1.723144, 0.3611193, -0.6248526, 1, 1, 1, 1, 1,
-1.713965, -1.892144, -2.387951, 1, 1, 1, 1, 1,
-1.710201, -0.8241153, -2.045161, 1, 1, 1, 1, 1,
-1.693065, -0.76827, -0.528477, 1, 1, 1, 1, 1,
-1.691125, 1.155459, -0.1524516, 1, 1, 1, 1, 1,
-1.685002, -0.7114663, -2.64322, 1, 1, 1, 1, 1,
-1.66019, 1.086881, -0.553308, 1, 1, 1, 1, 1,
-1.656644, 0.2358462, -1.885255, 1, 1, 1, 1, 1,
-1.653026, 1.454804, -2.041972, 1, 1, 1, 1, 1,
-1.646159, 0.06105828, -3.341095, 1, 1, 1, 1, 1,
-1.640458, -0.9567656, -0.9079924, 1, 1, 1, 1, 1,
-1.639371, -1.641774, -2.040291, 0, 0, 1, 1, 1,
-1.636008, 2.447844, -0.6851369, 1, 0, 0, 1, 1,
-1.634928, -0.02513065, -0.8711729, 1, 0, 0, 1, 1,
-1.611607, -1.554275, -2.133729, 1, 0, 0, 1, 1,
-1.599993, -0.08561406, -1.148789, 1, 0, 0, 1, 1,
-1.593543, -0.4653178, -1.549944, 1, 0, 0, 1, 1,
-1.583954, -1.57257, -3.600163, 0, 0, 0, 1, 1,
-1.578047, 0.7560197, -1.908647, 0, 0, 0, 1, 1,
-1.569504, 0.219571, -2.216457, 0, 0, 0, 1, 1,
-1.559841, 1.630705, -0.6616991, 0, 0, 0, 1, 1,
-1.542432, -0.5043306, -3.158916, 0, 0, 0, 1, 1,
-1.53755, -0.2350888, -1.907747, 0, 0, 0, 1, 1,
-1.531236, 0.2744409, -1.703864, 0, 0, 0, 1, 1,
-1.526495, -1.10845, -2.524611, 1, 1, 1, 1, 1,
-1.515546, -1.384703, -1.885154, 1, 1, 1, 1, 1,
-1.494744, -0.4448583, -4.498672, 1, 1, 1, 1, 1,
-1.47971, -0.782438, -1.560776, 1, 1, 1, 1, 1,
-1.477934, 0.7977045, -2.418168, 1, 1, 1, 1, 1,
-1.474449, -1.405885, -2.837157, 1, 1, 1, 1, 1,
-1.46688, -1.475669, -2.521745, 1, 1, 1, 1, 1,
-1.466107, 0.3094633, -0.3325886, 1, 1, 1, 1, 1,
-1.464267, -0.4859073, -0.646583, 1, 1, 1, 1, 1,
-1.462395, 0.3236178, -0.741306, 1, 1, 1, 1, 1,
-1.460839, -2.246831, -2.989461, 1, 1, 1, 1, 1,
-1.458438, -2.255942, -2.814487, 1, 1, 1, 1, 1,
-1.4584, 0.3572769, -0.8044829, 1, 1, 1, 1, 1,
-1.449074, 1.15941, -0.2881183, 1, 1, 1, 1, 1,
-1.44258, -0.6511183, -1.711995, 1, 1, 1, 1, 1,
-1.42153, -0.8232634, -1.085811, 0, 0, 1, 1, 1,
-1.417316, 0.6983215, -2.354272, 1, 0, 0, 1, 1,
-1.416086, -1.442355, -3.119834, 1, 0, 0, 1, 1,
-1.408165, -0.3567992, -1.824591, 1, 0, 0, 1, 1,
-1.398249, -0.8547636, -2.14674, 1, 0, 0, 1, 1,
-1.389752, -0.8398063, -2.060238, 1, 0, 0, 1, 1,
-1.387425, 0.506691, -0.3366687, 0, 0, 0, 1, 1,
-1.382941, -1.25953, -1.830763, 0, 0, 0, 1, 1,
-1.382898, 0.1446003, -1.761879, 0, 0, 0, 1, 1,
-1.378887, 0.4869069, -1.407752, 0, 0, 0, 1, 1,
-1.375436, 0.8801352, -0.8878819, 0, 0, 0, 1, 1,
-1.371658, -0.5444092, -1.416528, 0, 0, 0, 1, 1,
-1.360684, -1.570405, -3.866013, 0, 0, 0, 1, 1,
-1.352118, 0.2668326, -0.4252276, 1, 1, 1, 1, 1,
-1.344575, -1.033994, -1.115907, 1, 1, 1, 1, 1,
-1.339369, -1.365445, -2.393857, 1, 1, 1, 1, 1,
-1.335582, -0.3238448, -1.952725, 1, 1, 1, 1, 1,
-1.334497, 0.5556537, -1.730136, 1, 1, 1, 1, 1,
-1.322514, 0.5699852, -1.734138, 1, 1, 1, 1, 1,
-1.322046, 1.121799, -0.3888194, 1, 1, 1, 1, 1,
-1.317757, 0.3951981, -0.4433938, 1, 1, 1, 1, 1,
-1.317094, 0.903031, -2.415688, 1, 1, 1, 1, 1,
-1.306684, 0.6204301, -1.575104, 1, 1, 1, 1, 1,
-1.285802, -0.3515822, -1.0316, 1, 1, 1, 1, 1,
-1.284414, 0.5119195, -1.716684, 1, 1, 1, 1, 1,
-1.283021, 0.6211838, -1.688048, 1, 1, 1, 1, 1,
-1.279708, -1.134053, -0.8073754, 1, 1, 1, 1, 1,
-1.278306, -0.2457001, -2.909902, 1, 1, 1, 1, 1,
-1.277584, 1.450872, -2.620148, 0, 0, 1, 1, 1,
-1.274701, 0.606622, -0.4341636, 1, 0, 0, 1, 1,
-1.273808, 0.0004495493, -1.966605, 1, 0, 0, 1, 1,
-1.271382, -0.7567889, -2.14531, 1, 0, 0, 1, 1,
-1.264957, 0.4632738, -1.798134, 1, 0, 0, 1, 1,
-1.256986, 1.978268, 1.002908, 1, 0, 0, 1, 1,
-1.254462, -0.6655011, -4.032462, 0, 0, 0, 1, 1,
-1.241486, 0.05117195, -1.014686, 0, 0, 0, 1, 1,
-1.227837, 0.2588688, -1.855737, 0, 0, 0, 1, 1,
-1.225379, -0.08754326, -1.608307, 0, 0, 0, 1, 1,
-1.206285, -2.216607, -3.187597, 0, 0, 0, 1, 1,
-1.204693, 0.1110378, -0.7920448, 0, 0, 0, 1, 1,
-1.199372, 1.205444, -0.5742218, 0, 0, 0, 1, 1,
-1.195356, -1.755044, -3.643336, 1, 1, 1, 1, 1,
-1.19152, -0.1307717, -0.4993432, 1, 1, 1, 1, 1,
-1.190835, 0.5262503, -1.420134, 1, 1, 1, 1, 1,
-1.182856, -0.1127505, -2.22191, 1, 1, 1, 1, 1,
-1.180831, 1.343174, -1.797304, 1, 1, 1, 1, 1,
-1.162739, 1.203425, -1.76544, 1, 1, 1, 1, 1,
-1.150179, 0.480041, -2.371873, 1, 1, 1, 1, 1,
-1.1467, -0.2181382, -3.084646, 1, 1, 1, 1, 1,
-1.143174, -0.2692123, -1.780676, 1, 1, 1, 1, 1,
-1.138777, -0.09388741, -0.6230564, 1, 1, 1, 1, 1,
-1.129484, -0.2535275, -3.134534, 1, 1, 1, 1, 1,
-1.12465, -0.7674963, -2.719175, 1, 1, 1, 1, 1,
-1.123113, 0.4637924, -0.6020451, 1, 1, 1, 1, 1,
-1.11987, 2.525627, 0.5635105, 1, 1, 1, 1, 1,
-1.116479, 0.6270012, -0.5522763, 1, 1, 1, 1, 1,
-1.114594, -0.712893, -2.208247, 0, 0, 1, 1, 1,
-1.111658, -1.014502, -3.419794, 1, 0, 0, 1, 1,
-1.111442, -1.186005, -4.18978, 1, 0, 0, 1, 1,
-1.100729, -1.213235, -1.71198, 1, 0, 0, 1, 1,
-1.08982, -0.808647, -1.425606, 1, 0, 0, 1, 1,
-1.082803, 0.3822649, -1.390315, 1, 0, 0, 1, 1,
-1.073234, 0.7646477, -3.437058, 0, 0, 0, 1, 1,
-1.068515, -0.6498478, -2.392735, 0, 0, 0, 1, 1,
-1.063234, 0.1141341, 0.06621925, 0, 0, 0, 1, 1,
-1.055815, 1.6167, 0.2772684, 0, 0, 0, 1, 1,
-1.053749, -1.53348, -1.040877, 0, 0, 0, 1, 1,
-1.043191, -0.592412, -4.546834, 0, 0, 0, 1, 1,
-1.043054, 1.105309, -2.732265, 0, 0, 0, 1, 1,
-1.036082, 0.9390628, 0.506793, 1, 1, 1, 1, 1,
-1.034405, -1.101475, -2.791346, 1, 1, 1, 1, 1,
-1.033372, -0.5945373, -3.193876, 1, 1, 1, 1, 1,
-1.028652, 1.659344, -0.5979575, 1, 1, 1, 1, 1,
-1.026146, 0.417401, -1.48188, 1, 1, 1, 1, 1,
-1.018061, -0.1549338, -2.526909, 1, 1, 1, 1, 1,
-1.016657, 0.560889, 0.01169777, 1, 1, 1, 1, 1,
-1.016402, -0.4763713, -2.436551, 1, 1, 1, 1, 1,
-1.015814, -0.804371, -2.972725, 1, 1, 1, 1, 1,
-1.003056, 0.4932202, 0.473794, 1, 1, 1, 1, 1,
-0.996449, -0.9657678, -1.175633, 1, 1, 1, 1, 1,
-0.9931498, -1.768006, -3.034101, 1, 1, 1, 1, 1,
-0.9918938, 0.6229517, -3.386049, 1, 1, 1, 1, 1,
-0.9895172, 0.5369518, 0.8973672, 1, 1, 1, 1, 1,
-0.9854758, 1.348404, -1.218458, 1, 1, 1, 1, 1,
-0.9847853, -0.217645, -1.997573, 0, 0, 1, 1, 1,
-0.9795741, 1.519874, -0.3743863, 1, 0, 0, 1, 1,
-0.970743, 0.6299373, -1.481529, 1, 0, 0, 1, 1,
-0.9692193, -0.3060916, 0.2870182, 1, 0, 0, 1, 1,
-0.9650586, -0.9846013, -1.574085, 1, 0, 0, 1, 1,
-0.9585775, 1.721968, 0.514874, 1, 0, 0, 1, 1,
-0.9567105, -0.45778, -2.882695, 0, 0, 0, 1, 1,
-0.9556776, -0.06237915, -2.000331, 0, 0, 0, 1, 1,
-0.9488856, 1.203661, -0.4031009, 0, 0, 0, 1, 1,
-0.9451351, -0.4329991, 0.1626515, 0, 0, 0, 1, 1,
-0.9349582, 0.7065995, -0.4982506, 0, 0, 0, 1, 1,
-0.9339274, -1.029485, -1.437837, 0, 0, 0, 1, 1,
-0.9317834, 0.8476797, -0.8329284, 0, 0, 0, 1, 1,
-0.9317408, 0.2340681, -2.120268, 1, 1, 1, 1, 1,
-0.9272131, 0.1649754, 0.3736694, 1, 1, 1, 1, 1,
-0.924583, 0.2528505, -0.66128, 1, 1, 1, 1, 1,
-0.9242352, -0.4156801, -2.149246, 1, 1, 1, 1, 1,
-0.9241862, 0.6194, -1.120781, 1, 1, 1, 1, 1,
-0.9216845, -1.704759, -3.614444, 1, 1, 1, 1, 1,
-0.9204062, -1.349841, -3.01383, 1, 1, 1, 1, 1,
-0.9119777, -1.477188, -2.904936, 1, 1, 1, 1, 1,
-0.9089807, -0.0848286, -2.190664, 1, 1, 1, 1, 1,
-0.9049237, 0.3300228, -1.045723, 1, 1, 1, 1, 1,
-0.9037744, -1.482074, -2.922848, 1, 1, 1, 1, 1,
-0.8942879, 0.9335573, -2.230735, 1, 1, 1, 1, 1,
-0.8901828, -0.02546141, -1.221766, 1, 1, 1, 1, 1,
-0.8870599, -1.082745, -2.975631, 1, 1, 1, 1, 1,
-0.8864262, -0.198198, -4.125132, 1, 1, 1, 1, 1,
-0.8828083, 0.938903, -0.3871841, 0, 0, 1, 1, 1,
-0.8702807, 0.5794292, -1.312248, 1, 0, 0, 1, 1,
-0.8700088, -0.2450128, -0.8779468, 1, 0, 0, 1, 1,
-0.8579105, 0.5118369, 0.2270596, 1, 0, 0, 1, 1,
-0.8566642, -1.413905, -4.663683, 1, 0, 0, 1, 1,
-0.8529552, -1.54321, -3.585893, 1, 0, 0, 1, 1,
-0.8521359, 0.4747719, -1.34263, 0, 0, 0, 1, 1,
-0.8492426, -0.3586953, -3.356308, 0, 0, 0, 1, 1,
-0.8426203, -1.604952, -1.437802, 0, 0, 0, 1, 1,
-0.8281333, -0.05236208, -1.492498, 0, 0, 0, 1, 1,
-0.823622, -1.052507, -0.7747967, 0, 0, 0, 1, 1,
-0.8186224, 2.049641, 0.2029302, 0, 0, 0, 1, 1,
-0.8184856, 0.8800131, -1.336025, 0, 0, 0, 1, 1,
-0.8122716, -1.221978, -4.163972, 1, 1, 1, 1, 1,
-0.8119789, 0.4952069, -0.6978601, 1, 1, 1, 1, 1,
-0.8066575, 1.62561, -2.031631, 1, 1, 1, 1, 1,
-0.8029476, -0.9386329, -3.457801, 1, 1, 1, 1, 1,
-0.7976918, 0.8532324, -0.5116908, 1, 1, 1, 1, 1,
-0.7899265, 1.042066, -0.7893243, 1, 1, 1, 1, 1,
-0.787209, 1.847906, -1.249303, 1, 1, 1, 1, 1,
-0.7856106, -0.5044641, -1.575828, 1, 1, 1, 1, 1,
-0.7845411, -0.1523055, -3.156788, 1, 1, 1, 1, 1,
-0.7785634, -0.9604467, -4.613252, 1, 1, 1, 1, 1,
-0.773581, -0.6916463, -2.087808, 1, 1, 1, 1, 1,
-0.7684762, 2.235869, -1.105181, 1, 1, 1, 1, 1,
-0.7669537, -0.08801357, -2.588974, 1, 1, 1, 1, 1,
-0.7618401, 0.0950597, -0.627974, 1, 1, 1, 1, 1,
-0.7575818, 1.770544, -1.05093, 1, 1, 1, 1, 1,
-0.7541921, -0.5672743, -2.460099, 0, 0, 1, 1, 1,
-0.7501875, -0.003726518, -2.033154, 1, 0, 0, 1, 1,
-0.748226, 0.3455127, 0.726535, 1, 0, 0, 1, 1,
-0.7471579, -1.969043, -2.946662, 1, 0, 0, 1, 1,
-0.7455626, -0.960633, -1.721844, 1, 0, 0, 1, 1,
-0.7410507, -0.4530994, -2.94178, 1, 0, 0, 1, 1,
-0.7384086, 0.7181724, 0.3789638, 0, 0, 0, 1, 1,
-0.7380301, 0.3255258, -0.192938, 0, 0, 0, 1, 1,
-0.7338561, 0.2286038, -2.75862, 0, 0, 0, 1, 1,
-0.7314677, 0.4834668, 1.41759, 0, 0, 0, 1, 1,
-0.7295321, -0.8500388, -1.575078, 0, 0, 0, 1, 1,
-0.7245988, 0.2430092, 1.034072, 0, 0, 0, 1, 1,
-0.7236124, 1.037281, -1.419236, 0, 0, 0, 1, 1,
-0.7217141, 1.084997, 0.4101438, 1, 1, 1, 1, 1,
-0.7182219, 0.0190792, -1.472861, 1, 1, 1, 1, 1,
-0.7151513, 1.964075, -1.109349, 1, 1, 1, 1, 1,
-0.7107495, -0.2633727, -1.729118, 1, 1, 1, 1, 1,
-0.7088281, -0.4142589, -1.543906, 1, 1, 1, 1, 1,
-0.6965958, 1.539769, -0.03739896, 1, 1, 1, 1, 1,
-0.6940494, 1.756532, 0.6451368, 1, 1, 1, 1, 1,
-0.6885462, -0.3393435, -2.684569, 1, 1, 1, 1, 1,
-0.6869611, 0.1399436, -1.622484, 1, 1, 1, 1, 1,
-0.6847582, 0.8390692, -1.236738, 1, 1, 1, 1, 1,
-0.6844501, 0.9937952, 0.05480742, 1, 1, 1, 1, 1,
-0.6831658, -0.07870822, -1.676075, 1, 1, 1, 1, 1,
-0.6827603, 0.8796144, 0.6719865, 1, 1, 1, 1, 1,
-0.6648102, -0.5703623, -1.76719, 1, 1, 1, 1, 1,
-0.6629151, -0.4799578, -2.67915, 1, 1, 1, 1, 1,
-0.6621014, -0.07639444, -0.5933187, 0, 0, 1, 1, 1,
-0.6582405, -0.8057333, -3.504596, 1, 0, 0, 1, 1,
-0.6544373, -0.9245313, -2.084094, 1, 0, 0, 1, 1,
-0.6506975, -0.1553391, -1.902872, 1, 0, 0, 1, 1,
-0.6454738, 0.5357667, 0.0982611, 1, 0, 0, 1, 1,
-0.643397, -0.4213023, -2.586961, 1, 0, 0, 1, 1,
-0.6404811, -0.03403094, -3.94602, 0, 0, 0, 1, 1,
-0.6369719, -1.06626, -3.640885, 0, 0, 0, 1, 1,
-0.6360264, 2.574814, 0.09647653, 0, 0, 0, 1, 1,
-0.6263761, -0.1009111, -0.7498996, 0, 0, 0, 1, 1,
-0.624534, -0.9531969, -2.554183, 0, 0, 0, 1, 1,
-0.621684, 0.9787419, -0.2761365, 0, 0, 0, 1, 1,
-0.6194451, -0.2744981, -1.989703, 0, 0, 0, 1, 1,
-0.6188268, -0.4619021, -2.274317, 1, 1, 1, 1, 1,
-0.6144195, -2.525939, -4.034037, 1, 1, 1, 1, 1,
-0.611596, -0.1224178, -3.269322, 1, 1, 1, 1, 1,
-0.6104697, 0.7150353, -0.7207643, 1, 1, 1, 1, 1,
-0.6084812, 0.3015037, -1.940566, 1, 1, 1, 1, 1,
-0.5990238, -1.638948, -3.247133, 1, 1, 1, 1, 1,
-0.5957984, 0.4016778, -1.024132, 1, 1, 1, 1, 1,
-0.5938601, -2.091783, -3.156185, 1, 1, 1, 1, 1,
-0.591884, 0.4700035, -3.027931, 1, 1, 1, 1, 1,
-0.589688, -0.161532, -2.465749, 1, 1, 1, 1, 1,
-0.5888625, 0.5145985, -1.673178, 1, 1, 1, 1, 1,
-0.5822294, 0.8257168, -0.8506395, 1, 1, 1, 1, 1,
-0.5818421, -0.9979086, -2.414477, 1, 1, 1, 1, 1,
-0.5789528, -0.4486968, -2.128984, 1, 1, 1, 1, 1,
-0.5787851, 0.9522195, -0.480249, 1, 1, 1, 1, 1,
-0.5761148, -0.3093914, -0.946645, 0, 0, 1, 1, 1,
-0.5644863, 1.618115, -0.558076, 1, 0, 0, 1, 1,
-0.5565351, 0.7266801, -2.925333, 1, 0, 0, 1, 1,
-0.5501953, 0.269219, -1.083783, 1, 0, 0, 1, 1,
-0.5444347, -0.8663573, -4.245547, 1, 0, 0, 1, 1,
-0.5402086, -1.330665, -3.155852, 1, 0, 0, 1, 1,
-0.5377156, -0.2246514, -1.00366, 0, 0, 0, 1, 1,
-0.5049629, 1.871522, 0.1379743, 0, 0, 0, 1, 1,
-0.5033952, -0.8048269, -1.681167, 0, 0, 0, 1, 1,
-0.4975016, -0.07797571, -3.145823, 0, 0, 0, 1, 1,
-0.494766, 0.1294467, -2.591316, 0, 0, 0, 1, 1,
-0.4933644, -1.145398, -2.370157, 0, 0, 0, 1, 1,
-0.4929258, -1.455693, -2.347024, 0, 0, 0, 1, 1,
-0.4827525, 2.721733, -0.8718234, 1, 1, 1, 1, 1,
-0.4805861, 1.613445, 0.02984308, 1, 1, 1, 1, 1,
-0.4775757, 0.1221812, 0.4713918, 1, 1, 1, 1, 1,
-0.4775179, 0.1096004, -1.28619, 1, 1, 1, 1, 1,
-0.4762971, -0.3203002, -3.798615, 1, 1, 1, 1, 1,
-0.4751944, 0.08404411, -1.872058, 1, 1, 1, 1, 1,
-0.4745501, -1.184844, -3.477928, 1, 1, 1, 1, 1,
-0.4745416, 0.9862164, 0.01653546, 1, 1, 1, 1, 1,
-0.4717902, 1.916327, -0.2926334, 1, 1, 1, 1, 1,
-0.4708477, -0.6995106, -2.392007, 1, 1, 1, 1, 1,
-0.4689928, 1.055536, 0.1854479, 1, 1, 1, 1, 1,
-0.4678354, -0.09774087, 0.5607693, 1, 1, 1, 1, 1,
-0.4671117, 0.1130794, 0.2413041, 1, 1, 1, 1, 1,
-0.4639549, 0.2906766, -1.923822, 1, 1, 1, 1, 1,
-0.4619397, -0.3982904, -1.357006, 1, 1, 1, 1, 1,
-0.4611835, 0.1628828, 0.499767, 0, 0, 1, 1, 1,
-0.4609289, 2.263474, -0.7146786, 1, 0, 0, 1, 1,
-0.4604202, 1.06342, -0.8773596, 1, 0, 0, 1, 1,
-0.4588107, -0.5824366, -1.225457, 1, 0, 0, 1, 1,
-0.4528731, -1.399747, -2.603617, 1, 0, 0, 1, 1,
-0.4519992, 0.2287789, 1.772584, 1, 0, 0, 1, 1,
-0.4504417, 0.2663688, -2.018208, 0, 0, 0, 1, 1,
-0.4453268, 1.076241, -0.9396781, 0, 0, 0, 1, 1,
-0.4448479, 0.6702574, -0.8717203, 0, 0, 0, 1, 1,
-0.4354039, 2.924158, -0.2598179, 0, 0, 0, 1, 1,
-0.435177, 1.125058, -1.800366, 0, 0, 0, 1, 1,
-0.432546, -0.6340302, -2.837029, 0, 0, 0, 1, 1,
-0.4322067, -1.139638, -2.446649, 0, 0, 0, 1, 1,
-0.4257196, -0.04231074, 0.3312773, 1, 1, 1, 1, 1,
-0.4247307, 0.4151872, -1.396715, 1, 1, 1, 1, 1,
-0.4180972, 0.8527048, -0.7761308, 1, 1, 1, 1, 1,
-0.4121488, 1.268471, 0.2023201, 1, 1, 1, 1, 1,
-0.4117537, 1.061893, 0.9309593, 1, 1, 1, 1, 1,
-0.4092882, -0.9498309, -2.972616, 1, 1, 1, 1, 1,
-0.4067335, 0.4835933, -0.2245298, 1, 1, 1, 1, 1,
-0.4057105, -0.3096364, -2.493371, 1, 1, 1, 1, 1,
-0.4054887, 1.927197, -0.3320055, 1, 1, 1, 1, 1,
-0.4049192, -0.672963, -1.88006, 1, 1, 1, 1, 1,
-0.4034318, 0.01990567, -1.847549, 1, 1, 1, 1, 1,
-0.402451, 0.4632697, -0.6869981, 1, 1, 1, 1, 1,
-0.4007694, -0.2850043, -3.616725, 1, 1, 1, 1, 1,
-0.3989564, 0.8630338, -2.033097, 1, 1, 1, 1, 1,
-0.398837, 0.3980038, 0.1956414, 1, 1, 1, 1, 1,
-0.3974063, -0.1831941, -1.745906, 0, 0, 1, 1, 1,
-0.3917712, -0.4636288, -2.830477, 1, 0, 0, 1, 1,
-0.3895187, -0.6974838, -1.748723, 1, 0, 0, 1, 1,
-0.3852773, -1.468294, -1.63701, 1, 0, 0, 1, 1,
-0.3842761, 1.265176, -1.101256, 1, 0, 0, 1, 1,
-0.3801188, 0.5164164, -1.609374, 1, 0, 0, 1, 1,
-0.3743438, -2.353213, -3.145797, 0, 0, 0, 1, 1,
-0.3706893, -0.18308, -0.7641873, 0, 0, 0, 1, 1,
-0.366993, -1.124354, -1.965481, 0, 0, 0, 1, 1,
-0.361454, 2.413527, -0.6094694, 0, 0, 0, 1, 1,
-0.3613696, 1.118277, -0.2919323, 0, 0, 0, 1, 1,
-0.358097, 0.4375908, -0.05127389, 0, 0, 0, 1, 1,
-0.3556234, -0.1591698, -3.543346, 0, 0, 0, 1, 1,
-0.3526581, 0.4902199, -0.9843279, 1, 1, 1, 1, 1,
-0.3420835, -1.931069, -3.766863, 1, 1, 1, 1, 1,
-0.3418697, 1.018753, 0.04483796, 1, 1, 1, 1, 1,
-0.3395814, -0.01069757, -3.582205, 1, 1, 1, 1, 1,
-0.3370387, 0.8069879, -0.4956836, 1, 1, 1, 1, 1,
-0.3335104, -0.9847265, -2.579558, 1, 1, 1, 1, 1,
-0.3251041, 0.3897208, -1.53891, 1, 1, 1, 1, 1,
-0.3247549, 0.3649025, 0.2953547, 1, 1, 1, 1, 1,
-0.321782, 0.3897637, -0.2798544, 1, 1, 1, 1, 1,
-0.3203254, 1.059799, -0.3457467, 1, 1, 1, 1, 1,
-0.3198069, -0.1145091, -1.66211, 1, 1, 1, 1, 1,
-0.3162943, -0.1602673, -2.47259, 1, 1, 1, 1, 1,
-0.3143351, 0.05470503, -1.176466, 1, 1, 1, 1, 1,
-0.3138877, 0.5093018, -0.4171943, 1, 1, 1, 1, 1,
-0.3102275, 0.419948, 0.7994459, 1, 1, 1, 1, 1,
-0.3091751, 0.5794484, -0.3029011, 0, 0, 1, 1, 1,
-0.2984484, -0.8780481, -4.433064, 1, 0, 0, 1, 1,
-0.2969635, 0.7649079, -2.015914, 1, 0, 0, 1, 1,
-0.2926408, -1.111184, -3.001125, 1, 0, 0, 1, 1,
-0.2916631, -1.606902, -2.586214, 1, 0, 0, 1, 1,
-0.2839462, 0.3143774, -2.002396, 1, 0, 0, 1, 1,
-0.2714489, 0.3168812, -1.34565, 0, 0, 0, 1, 1,
-0.2658748, 1.195093, -0.5305018, 0, 0, 0, 1, 1,
-0.2556446, -0.4040247, -2.821388, 0, 0, 0, 1, 1,
-0.2500495, -0.345473, -2.025375, 0, 0, 0, 1, 1,
-0.2435653, -0.3129952, -2.421044, 0, 0, 0, 1, 1,
-0.2429996, -0.9059131, -6.305838, 0, 0, 0, 1, 1,
-0.2396073, -1.151779, -2.894958, 0, 0, 0, 1, 1,
-0.2355048, 0.5871692, -1.168948, 1, 1, 1, 1, 1,
-0.2345854, 0.5327312, -1.893996, 1, 1, 1, 1, 1,
-0.2334347, -1.410194, -3.225057, 1, 1, 1, 1, 1,
-0.2320939, 1.259987, 0.2826471, 1, 1, 1, 1, 1,
-0.2269081, 0.1288806, -2.253149, 1, 1, 1, 1, 1,
-0.2245631, -0.756759, -1.933019, 1, 1, 1, 1, 1,
-0.2189925, 0.8480837, -0.06945564, 1, 1, 1, 1, 1,
-0.2177647, 0.3231702, 0.4697778, 1, 1, 1, 1, 1,
-0.2091876, -2.059269, -4.032766, 1, 1, 1, 1, 1,
-0.206946, 0.08472509, -1.561815, 1, 1, 1, 1, 1,
-0.2066233, -0.1195595, -2.487181, 1, 1, 1, 1, 1,
-0.2059919, -0.001640791, -1.979811, 1, 1, 1, 1, 1,
-0.2049258, 0.3651851, -1.769691, 1, 1, 1, 1, 1,
-0.2043033, -2.047044, -2.702621, 1, 1, 1, 1, 1,
-0.2039343, 1.145226, 1.068618, 1, 1, 1, 1, 1,
-0.2003238, 0.5711302, -0.4842501, 0, 0, 1, 1, 1,
-0.1985311, -0.9852983, -3.572182, 1, 0, 0, 1, 1,
-0.197403, 1.095038, -0.2765377, 1, 0, 0, 1, 1,
-0.1932742, 1.017613, 1.049697, 1, 0, 0, 1, 1,
-0.1880502, 1.659866, 0.7709092, 1, 0, 0, 1, 1,
-0.181972, -0.9605996, -3.992873, 1, 0, 0, 1, 1,
-0.1807885, 0.6252495, 0.8894209, 0, 0, 0, 1, 1,
-0.180621, -0.08965541, -1.706165, 0, 0, 0, 1, 1,
-0.1802449, 0.8618404, -0.3489883, 0, 0, 0, 1, 1,
-0.1789712, -0.3486637, -3.137158, 0, 0, 0, 1, 1,
-0.168496, -0.1683714, -2.284335, 0, 0, 0, 1, 1,
-0.1660631, 0.4438868, 1.376205, 0, 0, 0, 1, 1,
-0.1642701, -1.201701, -3.672346, 0, 0, 0, 1, 1,
-0.1625258, 1.967353, -1.954454, 1, 1, 1, 1, 1,
-0.1624473, -0.4149115, -1.603985, 1, 1, 1, 1, 1,
-0.1596791, -0.002283037, -2.101676, 1, 1, 1, 1, 1,
-0.1589448, 0.4307707, -0.8695812, 1, 1, 1, 1, 1,
-0.1585386, 0.07294172, -1.348853, 1, 1, 1, 1, 1,
-0.1557108, 1.818109, -0.9136592, 1, 1, 1, 1, 1,
-0.155624, 0.959709, -1.611348, 1, 1, 1, 1, 1,
-0.154209, -2.944902, -4.943485, 1, 1, 1, 1, 1,
-0.1504964, -1.100978, -3.764027, 1, 1, 1, 1, 1,
-0.1501655, -0.179419, -1.455219, 1, 1, 1, 1, 1,
-0.1481477, -0.8562562, -4.223295, 1, 1, 1, 1, 1,
-0.1479529, 0.5442924, -0.004735741, 1, 1, 1, 1, 1,
-0.1474583, 0.1412531, -2.924967, 1, 1, 1, 1, 1,
-0.1471505, 0.9477016, -0.3262634, 1, 1, 1, 1, 1,
-0.1450688, 0.05672734, -1.761018, 1, 1, 1, 1, 1,
-0.1370299, 1.329318, -0.914101, 0, 0, 1, 1, 1,
-0.1304939, 0.4959887, 0.1824151, 1, 0, 0, 1, 1,
-0.1281939, -0.7872992, -3.17911, 1, 0, 0, 1, 1,
-0.125843, -0.7262877, -2.650609, 1, 0, 0, 1, 1,
-0.1257942, -0.5214179, -4.763142, 1, 0, 0, 1, 1,
-0.1234022, 0.7430356, 0.2426725, 1, 0, 0, 1, 1,
-0.1218333, 0.03060314, -1.584756, 0, 0, 0, 1, 1,
-0.1208434, -0.04812309, -1.993531, 0, 0, 0, 1, 1,
-0.1167264, 0.785342, -0.837931, 0, 0, 0, 1, 1,
-0.116374, 0.4300886, -1.695358, 0, 0, 0, 1, 1,
-0.11306, -0.8518149, -3.067952, 0, 0, 0, 1, 1,
-0.1071207, -0.3423754, -1.87967, 0, 0, 0, 1, 1,
-0.10681, -0.2873832, -2.227793, 0, 0, 0, 1, 1,
-0.1036313, 1.637111, -2.24191, 1, 1, 1, 1, 1,
-0.1031705, 0.3233206, -1.948423, 1, 1, 1, 1, 1,
-0.1008826, 0.9146544, -0.8029013, 1, 1, 1, 1, 1,
-0.0984902, -0.8226268, -4.212982, 1, 1, 1, 1, 1,
-0.09824113, 0.5148659, -0.4144471, 1, 1, 1, 1, 1,
-0.09797303, 1.924424, -0.1884209, 1, 1, 1, 1, 1,
-0.09671399, 1.486155, -0.1325915, 1, 1, 1, 1, 1,
-0.09373516, -1.350442, -2.630977, 1, 1, 1, 1, 1,
-0.09187375, 0.4181407, -0.6998904, 1, 1, 1, 1, 1,
-0.07993919, 0.2565469, -0.7932816, 1, 1, 1, 1, 1,
-0.074899, 0.661121, -1.238777, 1, 1, 1, 1, 1,
-0.07460878, 0.003194505, -2.205903, 1, 1, 1, 1, 1,
-0.0738667, 0.4432426, 1.233223, 1, 1, 1, 1, 1,
-0.07241394, 0.2012977, 1.100757, 1, 1, 1, 1, 1,
-0.07202568, -0.52403, -1.603356, 1, 1, 1, 1, 1,
-0.06481276, 0.005051742, -0.6182195, 0, 0, 1, 1, 1,
-0.06474928, -0.7738998, -2.299153, 1, 0, 0, 1, 1,
-0.06143901, -0.4933419, -4.985618, 1, 0, 0, 1, 1,
-0.05685542, 0.08909695, -0.8948628, 1, 0, 0, 1, 1,
-0.05301915, -0.4951203, -3.360758, 1, 0, 0, 1, 1,
-0.05127791, -1.37419, -3.933042, 1, 0, 0, 1, 1,
-0.0500422, -0.3328465, -1.779238, 0, 0, 0, 1, 1,
-0.04971328, 1.014715, -0.2229917, 0, 0, 0, 1, 1,
-0.04908639, -0.4391676, -3.124977, 0, 0, 0, 1, 1,
-0.04696684, 0.7321694, -0.4129742, 0, 0, 0, 1, 1,
-0.04346323, -0.2787287, -1.951154, 0, 0, 0, 1, 1,
-0.04237409, -0.7199569, -2.563955, 0, 0, 0, 1, 1,
-0.04095304, 0.4966852, -2.274143, 0, 0, 0, 1, 1,
-0.03089617, -0.8557844, -1.836621, 1, 1, 1, 1, 1,
-0.03043683, -0.02000087, -3.308609, 1, 1, 1, 1, 1,
-0.02895544, 1.327518, 0.0005602352, 1, 1, 1, 1, 1,
-0.02797056, 0.1184873, -0.530569, 1, 1, 1, 1, 1,
-0.02750761, 1.888802, 1.297123, 1, 1, 1, 1, 1,
-0.02576866, -1.403029, -2.57362, 1, 1, 1, 1, 1,
-0.02513878, -0.9093272, -2.644509, 1, 1, 1, 1, 1,
-0.0210185, -0.2313102, -3.408005, 1, 1, 1, 1, 1,
-0.01842827, 0.3566174, 2.202116, 1, 1, 1, 1, 1,
-0.01343472, -0.6160446, -3.202521, 1, 1, 1, 1, 1,
-0.00958572, 1.032947, 1.521018, 1, 1, 1, 1, 1,
-0.007003568, 0.6513448, -0.701732, 1, 1, 1, 1, 1,
-0.004801284, -0.1234107, -4.907138, 1, 1, 1, 1, 1,
-0.003239476, -0.1182152, -4.179911, 1, 1, 1, 1, 1,
-0.002931803, 0.6043023, 0.6012073, 1, 1, 1, 1, 1,
-0.00115392, -0.2474206, -4.656017, 0, 0, 1, 1, 1,
-0.0009771939, -0.05542167, -3.341639, 1, 0, 0, 1, 1,
0.004117934, 1.026232, 0.6394686, 1, 0, 0, 1, 1,
0.00583947, 0.6914353, 0.7311425, 1, 0, 0, 1, 1,
0.01412473, -0.847024, 3.065742, 1, 0, 0, 1, 1,
0.01663904, -1.35068, 3.875046, 1, 0, 0, 1, 1,
0.01710552, -0.1270334, 3.544027, 0, 0, 0, 1, 1,
0.0181858, 1.303065, 1.071985, 0, 0, 0, 1, 1,
0.02059614, 0.3524569, 0.5453714, 0, 0, 0, 1, 1,
0.03233803, -0.3188762, 1.929186, 0, 0, 0, 1, 1,
0.03279721, -0.642567, 2.836571, 0, 0, 0, 1, 1,
0.03370409, -0.2725096, 3.90255, 0, 0, 0, 1, 1,
0.04317692, 1.048008, 1.681989, 0, 0, 0, 1, 1,
0.04443579, 1.227774, -0.1304502, 1, 1, 1, 1, 1,
0.05374018, -1.30407, 2.266391, 1, 1, 1, 1, 1,
0.05718862, -0.2917392, 2.925685, 1, 1, 1, 1, 1,
0.05799137, -0.1649906, 3.207525, 1, 1, 1, 1, 1,
0.05861821, 0.8584002, 0.3487646, 1, 1, 1, 1, 1,
0.05972193, -0.2115605, 2.920198, 1, 1, 1, 1, 1,
0.06015949, -0.3614401, 3.780953, 1, 1, 1, 1, 1,
0.06387338, 0.5295324, -0.7098328, 1, 1, 1, 1, 1,
0.06688003, -0.5393756, 2.542411, 1, 1, 1, 1, 1,
0.06925473, 1.707951, 0.2794698, 1, 1, 1, 1, 1,
0.07085776, -0.4646254, 4.115636, 1, 1, 1, 1, 1,
0.07098465, 0.8658528, 0.3934997, 1, 1, 1, 1, 1,
0.07130764, 0.4331494, 2.002743, 1, 1, 1, 1, 1,
0.07318354, -1.971831, 2.087913, 1, 1, 1, 1, 1,
0.07353181, 0.03523406, 1.390728, 1, 1, 1, 1, 1,
0.07375129, -0.81185, 2.271246, 0, 0, 1, 1, 1,
0.07442478, 1.300016, 1.457313, 1, 0, 0, 1, 1,
0.07529782, 1.301955, -1.821663, 1, 0, 0, 1, 1,
0.07740726, 0.3683806, -0.008305688, 1, 0, 0, 1, 1,
0.07968654, 0.315578, 1.273856, 1, 0, 0, 1, 1,
0.08161492, 0.5038868, -0.4094187, 1, 0, 0, 1, 1,
0.08212041, -0.2037046, 3.126821, 0, 0, 0, 1, 1,
0.08340772, -0.4622485, 4.562883, 0, 0, 0, 1, 1,
0.09965643, 0.7175877, -0.525332, 0, 0, 0, 1, 1,
0.1033241, -1.411783, 3.403734, 0, 0, 0, 1, 1,
0.1036543, 1.614577, -0.8155851, 0, 0, 0, 1, 1,
0.1043509, 0.506044, 0.5401341, 0, 0, 0, 1, 1,
0.1063582, -0.2704534, 2.726147, 0, 0, 0, 1, 1,
0.1107883, 0.3884919, -0.0420321, 1, 1, 1, 1, 1,
0.1111115, 1.276633, -1.079826, 1, 1, 1, 1, 1,
0.111287, -0.1061646, 2.741111, 1, 1, 1, 1, 1,
0.11288, -1.189553, 4.202311, 1, 1, 1, 1, 1,
0.1134369, -0.5097758, 3.316732, 1, 1, 1, 1, 1,
0.1143067, 0.7412486, 0.4646104, 1, 1, 1, 1, 1,
0.1206735, 1.985525, 0.1281933, 1, 1, 1, 1, 1,
0.1251067, -0.7872512, 3.13186, 1, 1, 1, 1, 1,
0.1260031, 0.9216243, 2.676312, 1, 1, 1, 1, 1,
0.1304723, -0.5285062, 2.234639, 1, 1, 1, 1, 1,
0.1310174, 0.9176388, -1.181297, 1, 1, 1, 1, 1,
0.1404035, 1.007096, -0.4133446, 1, 1, 1, 1, 1,
0.1437686, -0.3863763, 0.7303395, 1, 1, 1, 1, 1,
0.1520021, -2.320048, 1.13072, 1, 1, 1, 1, 1,
0.1521001, 0.2955585, 0.03361646, 1, 1, 1, 1, 1,
0.1526467, 0.7945946, 0.6553848, 0, 0, 1, 1, 1,
0.1536919, -0.7291608, 2.539654, 1, 0, 0, 1, 1,
0.155265, -0.3206078, 3.180998, 1, 0, 0, 1, 1,
0.1553819, 0.8938134, 0.1698829, 1, 0, 0, 1, 1,
0.1572514, -0.8632747, 3.745429, 1, 0, 0, 1, 1,
0.1597325, -0.2959257, 3.008575, 1, 0, 0, 1, 1,
0.1621393, 1.779937, -0.278998, 0, 0, 0, 1, 1,
0.1676803, 0.5263861, -1.439487, 0, 0, 0, 1, 1,
0.1680322, 1.041713, -0.06897213, 0, 0, 0, 1, 1,
0.168326, 0.630838, 0.716253, 0, 0, 0, 1, 1,
0.1706009, -1.291262, 3.781767, 0, 0, 0, 1, 1,
0.1711007, 0.6724167, 1.204342, 0, 0, 0, 1, 1,
0.172125, -1.105615, 3.057381, 0, 0, 0, 1, 1,
0.1732408, -0.001348106, 2.532316, 1, 1, 1, 1, 1,
0.1746947, 0.2991413, 1.105089, 1, 1, 1, 1, 1,
0.1768015, 0.4069785, -0.6898032, 1, 1, 1, 1, 1,
0.1770204, -0.1153026, 1.869332, 1, 1, 1, 1, 1,
0.1788306, 1.748418, 1.267777, 1, 1, 1, 1, 1,
0.180496, -0.2514034, 2.977294, 1, 1, 1, 1, 1,
0.1856914, -1.326439, 3.664963, 1, 1, 1, 1, 1,
0.1870396, -0.6013767, 1.780599, 1, 1, 1, 1, 1,
0.191063, 1.833484, -0.1193652, 1, 1, 1, 1, 1,
0.1946785, -0.8144771, 1.771371, 1, 1, 1, 1, 1,
0.2063998, -0.2632231, 3.805841, 1, 1, 1, 1, 1,
0.2107897, 0.7201277, -0.5833725, 1, 1, 1, 1, 1,
0.2136246, -0.9331164, 3.332533, 1, 1, 1, 1, 1,
0.2187148, 0.2132181, 1.366218, 1, 1, 1, 1, 1,
0.219833, 0.2119118, 1.746022, 1, 1, 1, 1, 1,
0.2208375, 0.2086014, 2.083295, 0, 0, 1, 1, 1,
0.2215141, 0.3477558, -0.2064726, 1, 0, 0, 1, 1,
0.2238476, 0.9468876, -0.3961438, 1, 0, 0, 1, 1,
0.2248589, 0.5535415, -0.3893812, 1, 0, 0, 1, 1,
0.2352019, -0.9999195, 2.253603, 1, 0, 0, 1, 1,
0.2362338, 1.740056, 0.02203604, 1, 0, 0, 1, 1,
0.2371994, 1.384608, 0.1295645, 0, 0, 0, 1, 1,
0.2395993, -1.958021, 2.215611, 0, 0, 0, 1, 1,
0.2423893, 0.2648163, 2.429051, 0, 0, 0, 1, 1,
0.2431775, 1.001593, 0.4090957, 0, 0, 0, 1, 1,
0.2458103, -0.7022535, 1.934233, 0, 0, 0, 1, 1,
0.250962, -0.6031789, 1.579134, 0, 0, 0, 1, 1,
0.2574911, 1.756704, 0.2494684, 0, 0, 0, 1, 1,
0.2610388, 0.3687555, 0.3123322, 1, 1, 1, 1, 1,
0.2676588, -0.7075265, 2.58566, 1, 1, 1, 1, 1,
0.2680976, 0.9839973, 0.1787849, 1, 1, 1, 1, 1,
0.2684342, 2.005026, -1.44133, 1, 1, 1, 1, 1,
0.2700051, -0.2144007, 2.565192, 1, 1, 1, 1, 1,
0.270106, -0.3178277, 3.64844, 1, 1, 1, 1, 1,
0.2731256, 0.4181355, -0.2192039, 1, 1, 1, 1, 1,
0.2758158, -1.299081, 0.1643611, 1, 1, 1, 1, 1,
0.2789042, 1.074337, -0.6330363, 1, 1, 1, 1, 1,
0.2808464, -0.02826809, 2.177487, 1, 1, 1, 1, 1,
0.2862425, -0.05580505, 2.504349, 1, 1, 1, 1, 1,
0.2884717, 0.5682467, 1.78337, 1, 1, 1, 1, 1,
0.2891452, 0.3286884, 1.437234, 1, 1, 1, 1, 1,
0.292433, -1.815186, 3.680321, 1, 1, 1, 1, 1,
0.2964605, 1.057726, 0.3516869, 1, 1, 1, 1, 1,
0.2973212, 0.69759, 0.07757629, 0, 0, 1, 1, 1,
0.2999019, 1.23238, 0.9944502, 1, 0, 0, 1, 1,
0.3014868, 0.4067802, 1.020992, 1, 0, 0, 1, 1,
0.3072691, 0.6708888, -0.4115985, 1, 0, 0, 1, 1,
0.3121743, 0.2451794, 0.6844254, 1, 0, 0, 1, 1,
0.3124999, -0.106583, 4.092329, 1, 0, 0, 1, 1,
0.3141966, 0.698516, 0.3963083, 0, 0, 0, 1, 1,
0.3158346, 0.8196591, 0.7214686, 0, 0, 0, 1, 1,
0.3177561, -0.5878773, 1.09587, 0, 0, 0, 1, 1,
0.3185942, -0.8849642, 2.950348, 0, 0, 0, 1, 1,
0.324257, -0.6843164, 2.470744, 0, 0, 0, 1, 1,
0.3288032, 1.159376, 1.210388, 0, 0, 0, 1, 1,
0.3334267, -1.080777, 3.10661, 0, 0, 0, 1, 1,
0.3384917, -0.9277256, 2.561931, 1, 1, 1, 1, 1,
0.3413035, 0.02761612, 0.9992678, 1, 1, 1, 1, 1,
0.3416527, 0.05585656, 2.701154, 1, 1, 1, 1, 1,
0.3469276, 0.341297, -0.2012203, 1, 1, 1, 1, 1,
0.349216, -1.352715, 4.480962, 1, 1, 1, 1, 1,
0.3504775, -0.7372187, 2.896709, 1, 1, 1, 1, 1,
0.3544972, -0.0570147, 0.1791788, 1, 1, 1, 1, 1,
0.3551913, -0.510314, 2.907295, 1, 1, 1, 1, 1,
0.3557596, -0.3698992, 1.659334, 1, 1, 1, 1, 1,
0.3558928, 1.514684, 0.2362999, 1, 1, 1, 1, 1,
0.3567636, 0.7254075, 0.9052026, 1, 1, 1, 1, 1,
0.3571159, -0.1520856, 0.9863102, 1, 1, 1, 1, 1,
0.3587742, 0.006772206, 3.638791, 1, 1, 1, 1, 1,
0.3621066, -0.6034293, 3.141454, 1, 1, 1, 1, 1,
0.3658548, 1.717796, 2.22397, 1, 1, 1, 1, 1,
0.3665356, -0.25133, 1.192019, 0, 0, 1, 1, 1,
0.3666274, 0.5959277, 0.3737422, 1, 0, 0, 1, 1,
0.3696438, -0.09412847, -0.7155769, 1, 0, 0, 1, 1,
0.372922, 0.9435406, 0.739098, 1, 0, 0, 1, 1,
0.378407, 1.091042, -1.279104, 1, 0, 0, 1, 1,
0.387617, -0.7206366, 2.728323, 1, 0, 0, 1, 1,
0.391618, 0.1107201, 0.7104341, 0, 0, 0, 1, 1,
0.3952733, 1.031374, 0.4201896, 0, 0, 0, 1, 1,
0.3977329, 1.889832, -0.8499759, 0, 0, 0, 1, 1,
0.4050299, 0.5172385, 2.894948, 0, 0, 0, 1, 1,
0.4080492, -1.289837, 3.350432, 0, 0, 0, 1, 1,
0.4096936, -0.3348664, 2.142835, 0, 0, 0, 1, 1,
0.4104719, 1.5946, -0.5280186, 0, 0, 0, 1, 1,
0.4126538, -0.9970115, 3.177926, 1, 1, 1, 1, 1,
0.413501, -0.1918878, 2.646562, 1, 1, 1, 1, 1,
0.4149167, 1.012636, 0.4643351, 1, 1, 1, 1, 1,
0.4266955, 1.293113, 0.4279426, 1, 1, 1, 1, 1,
0.4290966, 0.5095079, 0.8967456, 1, 1, 1, 1, 1,
0.4304188, 0.5440284, 0.901858, 1, 1, 1, 1, 1,
0.4327941, -0.1364801, 1.373203, 1, 1, 1, 1, 1,
0.4370987, -0.6477529, 2.265397, 1, 1, 1, 1, 1,
0.4389552, 2.01853, 1.515838, 1, 1, 1, 1, 1,
0.440784, 0.02827439, 1.473366, 1, 1, 1, 1, 1,
0.4443029, 0.6613138, 0.1365478, 1, 1, 1, 1, 1,
0.4461705, -1.910017, 5.18138, 1, 1, 1, 1, 1,
0.4479212, 0.8484026, -0.6378055, 1, 1, 1, 1, 1,
0.4521146, -0.4271128, 1.801323, 1, 1, 1, 1, 1,
0.453567, 0.4619238, 1.382409, 1, 1, 1, 1, 1,
0.4584885, -0.7737639, 3.023602, 0, 0, 1, 1, 1,
0.4590735, 0.3264076, -0.3140057, 1, 0, 0, 1, 1,
0.4599119, 0.4342131, -0.04383969, 1, 0, 0, 1, 1,
0.4605274, -1.29871, 2.778053, 1, 0, 0, 1, 1,
0.4625807, 1.096419, 0.5339757, 1, 0, 0, 1, 1,
0.4658534, -1.331073, 1.985286, 1, 0, 0, 1, 1,
0.4668815, 0.01227616, 0.8940737, 0, 0, 0, 1, 1,
0.4729286, 0.4940288, 0.5916076, 0, 0, 0, 1, 1,
0.4770243, -0.03705366, 0.7444527, 0, 0, 0, 1, 1,
0.4781085, 0.3770294, 3.678037, 0, 0, 0, 1, 1,
0.478522, 0.5243213, -0.7838329, 0, 0, 0, 1, 1,
0.4821883, 1.363424, 0.1915343, 0, 0, 0, 1, 1,
0.4847714, -0.2307838, 1.191071, 0, 0, 0, 1, 1,
0.4847893, 1.106814, -0.2338308, 1, 1, 1, 1, 1,
0.4849443, 1.368974, 1.327794, 1, 1, 1, 1, 1,
0.485507, -0.3623706, 2.225376, 1, 1, 1, 1, 1,
0.4862965, 1.202555, -1.048938, 1, 1, 1, 1, 1,
0.4943169, -1.72877, 4.518738, 1, 1, 1, 1, 1,
0.497824, 0.6697056, -0.7580742, 1, 1, 1, 1, 1,
0.4992327, -0.6893976, 3.389381, 1, 1, 1, 1, 1,
0.5022615, 0.3769155, 1.649788, 1, 1, 1, 1, 1,
0.502603, -1.262439, 2.448463, 1, 1, 1, 1, 1,
0.505339, 0.3546443, 2.098621, 1, 1, 1, 1, 1,
0.5091884, -0.5954719, 0.9649894, 1, 1, 1, 1, 1,
0.5096877, -1.041755, 1.002832, 1, 1, 1, 1, 1,
0.5104967, -2.467057, 1.835608, 1, 1, 1, 1, 1,
0.5140384, 0.5354279, 0.1769014, 1, 1, 1, 1, 1,
0.5186431, -0.2594613, 2.31399, 1, 1, 1, 1, 1,
0.5245677, -0.6222532, 1.364756, 0, 0, 1, 1, 1,
0.529851, 1.497231, 0.432243, 1, 0, 0, 1, 1,
0.5300147, 0.4746708, 2.189973, 1, 0, 0, 1, 1,
0.5306106, -1.090519, 2.303731, 1, 0, 0, 1, 1,
0.5347039, -1.073663, 1.701301, 1, 0, 0, 1, 1,
0.5353847, 1.611046, 0.567609, 1, 0, 0, 1, 1,
0.5370374, 0.2668477, 1.13384, 0, 0, 0, 1, 1,
0.538103, -0.4505638, 2.45942, 0, 0, 0, 1, 1,
0.550867, -1.796463, 2.151522, 0, 0, 0, 1, 1,
0.5512748, 0.9138761, 1.020717, 0, 0, 0, 1, 1,
0.5515558, -1.156536, 3.329837, 0, 0, 0, 1, 1,
0.5588542, -0.03890524, 1.738366, 0, 0, 0, 1, 1,
0.5648953, -0.0671765, 0.3814059, 0, 0, 0, 1, 1,
0.5668942, 0.2802295, 0.7792653, 1, 1, 1, 1, 1,
0.5690484, 0.2608696, 0.515076, 1, 1, 1, 1, 1,
0.5764852, 0.2879046, 0.00987298, 1, 1, 1, 1, 1,
0.5768024, -0.07738073, 2.120159, 1, 1, 1, 1, 1,
0.5796213, 1.061609, 0.8283299, 1, 1, 1, 1, 1,
0.5809613, 1.202761, 1.508421, 1, 1, 1, 1, 1,
0.5823032, -1.276224, 2.99306, 1, 1, 1, 1, 1,
0.5898852, 1.283143, 0.8952622, 1, 1, 1, 1, 1,
0.5902165, 0.4301492, 0.03638786, 1, 1, 1, 1, 1,
0.5909544, 0.005223337, 2.949658, 1, 1, 1, 1, 1,
0.5917948, 0.8449172, 0.2214961, 1, 1, 1, 1, 1,
0.5921436, 0.9417935, -0.5910065, 1, 1, 1, 1, 1,
0.6009641, 2.322007, 1.016762, 1, 1, 1, 1, 1,
0.6026694, 0.04271972, -0.3827682, 1, 1, 1, 1, 1,
0.6039643, -1.11513, 4.464815, 1, 1, 1, 1, 1,
0.6091915, -0.8685805, 1.055447, 0, 0, 1, 1, 1,
0.6107141, -1.002798, 2.264739, 1, 0, 0, 1, 1,
0.6108369, -2.017767, 2.71255, 1, 0, 0, 1, 1,
0.615851, -1.009563, 1.034324, 1, 0, 0, 1, 1,
0.6168724, -0.8357516, 2.116989, 1, 0, 0, 1, 1,
0.6181939, -0.2370564, 2.813205, 1, 0, 0, 1, 1,
0.6227542, -0.7221305, 3.223454, 0, 0, 0, 1, 1,
0.6375523, 1.677235, 1.06582, 0, 0, 0, 1, 1,
0.6412625, -1.718007, 3.036458, 0, 0, 0, 1, 1,
0.6420355, -0.04776955, 0.7735426, 0, 0, 0, 1, 1,
0.6426651, 0.07445206, 2.710795, 0, 0, 0, 1, 1,
0.6438867, -0.2367391, 2.977331, 0, 0, 0, 1, 1,
0.6496625, -0.3245029, 2.354982, 0, 0, 0, 1, 1,
0.6516104, 0.3080506, 2.187367, 1, 1, 1, 1, 1,
0.6603708, 2.367447, -0.760349, 1, 1, 1, 1, 1,
0.6668279, 0.4865549, 2.618177, 1, 1, 1, 1, 1,
0.668703, 0.4023259, 2.924321, 1, 1, 1, 1, 1,
0.6694071, -0.922546, 3.42592, 1, 1, 1, 1, 1,
0.6715476, 1.088564, -0.2711792, 1, 1, 1, 1, 1,
0.6722986, -1.181752, 2.319364, 1, 1, 1, 1, 1,
0.6773345, -0.4383448, 4.419081, 1, 1, 1, 1, 1,
0.6823331, 0.1085944, 1.745384, 1, 1, 1, 1, 1,
0.682973, -0.7567509, 3.696553, 1, 1, 1, 1, 1,
0.689052, 0.04570451, 1.589715, 1, 1, 1, 1, 1,
0.6893683, -0.2081615, 0.7653605, 1, 1, 1, 1, 1,
0.6930245, 1.250186, 1.588136, 1, 1, 1, 1, 1,
0.6961167, 2.155992, 1.914708, 1, 1, 1, 1, 1,
0.697029, 0.4514038, 0.6657693, 1, 1, 1, 1, 1,
0.7067891, 1.136839, -0.2032876, 0, 0, 1, 1, 1,
0.7122002, 0.1496629, 0.7058024, 1, 0, 0, 1, 1,
0.7138065, 1.500732, 1.762801, 1, 0, 0, 1, 1,
0.7151912, 0.8130705, 0.6426439, 1, 0, 0, 1, 1,
0.722612, -0.8634635, 3.556928, 1, 0, 0, 1, 1,
0.7227829, 0.1352792, 0.9029059, 1, 0, 0, 1, 1,
0.7285239, -1.864917, 2.654295, 0, 0, 0, 1, 1,
0.7423629, -1.963012, 3.737892, 0, 0, 0, 1, 1,
0.7482102, 1.707853, -0.429813, 0, 0, 0, 1, 1,
0.7529719, 0.1250013, 2.768226, 0, 0, 0, 1, 1,
0.758706, -0.7129635, 3.334036, 0, 0, 0, 1, 1,
0.7601218, 0.9742573, 0.07962024, 0, 0, 0, 1, 1,
0.7620563, 2.246071, 0.5457587, 0, 0, 0, 1, 1,
0.7633168, 1.50607, 1.554562, 1, 1, 1, 1, 1,
0.7638043, 0.3630901, 2.395676, 1, 1, 1, 1, 1,
0.7647657, -0.7758714, 3.008271, 1, 1, 1, 1, 1,
0.766205, 0.2725893, -0.3898372, 1, 1, 1, 1, 1,
0.7726166, -0.340647, 3.220147, 1, 1, 1, 1, 1,
0.7730322, 2.117107, -0.01932633, 1, 1, 1, 1, 1,
0.7736686, 1.22102, 1.289777, 1, 1, 1, 1, 1,
0.7778069, -0.1996862, 4.120474, 1, 1, 1, 1, 1,
0.7813962, -0.6909484, 2.95932, 1, 1, 1, 1, 1,
0.7851722, -0.1314764, 1.09218, 1, 1, 1, 1, 1,
0.7876901, -0.3102711, 0.667932, 1, 1, 1, 1, 1,
0.7902552, 0.4326939, 0.7063069, 1, 1, 1, 1, 1,
0.794061, 0.2745394, 2.787658, 1, 1, 1, 1, 1,
0.8012928, -1.936387, 3.452057, 1, 1, 1, 1, 1,
0.8032017, -0.5539789, 2.504966, 1, 1, 1, 1, 1,
0.8045697, -0.08247644, 1.167786, 0, 0, 1, 1, 1,
0.8073136, 0.3185855, 0.6772656, 1, 0, 0, 1, 1,
0.8095972, -0.4270576, 2.105082, 1, 0, 0, 1, 1,
0.8127173, -0.7766718, 3.09332, 1, 0, 0, 1, 1,
0.8158054, -0.2852699, 3.311619, 1, 0, 0, 1, 1,
0.817526, 0.7140252, 0.6457556, 1, 0, 0, 1, 1,
0.8216047, 0.5138777, 2.781977, 0, 0, 0, 1, 1,
0.8241162, 0.1042925, 0.4075567, 0, 0, 0, 1, 1,
0.8241519, 0.7962381, 0.5360028, 0, 0, 0, 1, 1,
0.8250485, -0.08655516, 1.849103, 0, 0, 0, 1, 1,
0.833268, -0.6275176, 1.764283, 0, 0, 0, 1, 1,
0.8356118, -1.444706, 3.121336, 0, 0, 0, 1, 1,
0.840435, 0.661626, 0.1294017, 0, 0, 0, 1, 1,
0.8410906, -0.2218948, 1.576637, 1, 1, 1, 1, 1,
0.8488243, 0.1701834, 0.7134129, 1, 1, 1, 1, 1,
0.8553795, 0.4222188, 2.445473, 1, 1, 1, 1, 1,
0.8586105, 0.922112, 2.614939, 1, 1, 1, 1, 1,
0.8607708, 0.04432382, 1.902989, 1, 1, 1, 1, 1,
0.8609517, 0.5322981, 0.9663898, 1, 1, 1, 1, 1,
0.8628095, 1.6661, 1.187231, 1, 1, 1, 1, 1,
0.8638236, -0.71145, 2.861301, 1, 1, 1, 1, 1,
0.8659631, -1.436611, 1.955678, 1, 1, 1, 1, 1,
0.8670797, -1.315826, 4.417259, 1, 1, 1, 1, 1,
0.8774666, 0.07724845, 3.108947, 1, 1, 1, 1, 1,
0.880383, -1.728244, 3.694453, 1, 1, 1, 1, 1,
0.8861235, -0.5287878, 1.301628, 1, 1, 1, 1, 1,
0.8862807, 0.9401401, 1.039555, 1, 1, 1, 1, 1,
0.8884555, -1.085725, 2.980346, 1, 1, 1, 1, 1,
0.8890257, 0.05648633, 1.360072, 0, 0, 1, 1, 1,
0.890443, -0.9041862, 0.9553127, 1, 0, 0, 1, 1,
0.8938171, -1.008458, 3.394328, 1, 0, 0, 1, 1,
0.8986518, 2.148199, 1.769735, 1, 0, 0, 1, 1,
0.8995931, 1.057534, -0.2730553, 1, 0, 0, 1, 1,
0.9032632, 0.7102293, 0.6935297, 1, 0, 0, 1, 1,
0.9053687, 1.22445, -1.002003, 0, 0, 0, 1, 1,
0.9093525, 2.110003, 2.191706, 0, 0, 0, 1, 1,
0.9103277, 0.8573849, 2.01428, 0, 0, 0, 1, 1,
0.9106877, 0.04736004, -0.131285, 0, 0, 0, 1, 1,
0.9111852, -1.689318, 3.476453, 0, 0, 0, 1, 1,
0.9123493, -1.012122, 1.109756, 0, 0, 0, 1, 1,
0.923513, -0.4975372, 3.790593, 0, 0, 0, 1, 1,
0.9313333, 0.06110236, 0.4382075, 1, 1, 1, 1, 1,
0.9334639, 1.696815, 1.294127, 1, 1, 1, 1, 1,
0.9387605, -1.221209, 3.787513, 1, 1, 1, 1, 1,
0.9482521, 0.6831468, 2.437392, 1, 1, 1, 1, 1,
0.9513535, -0.2836199, 1.307191, 1, 1, 1, 1, 1,
0.9557396, 1.840624, 2.130279, 1, 1, 1, 1, 1,
0.9558475, -1.101741, 1.99984, 1, 1, 1, 1, 1,
0.9568164, -2.343961, 2.359236, 1, 1, 1, 1, 1,
0.9604652, -0.340128, 1.113269, 1, 1, 1, 1, 1,
0.9611224, -0.4636655, 2.987963, 1, 1, 1, 1, 1,
0.9622241, -0.5143081, 2.762726, 1, 1, 1, 1, 1,
0.9675446, -0.3942204, 1.255558, 1, 1, 1, 1, 1,
0.9724293, 0.5857703, 0.6821946, 1, 1, 1, 1, 1,
0.9743853, -0.328464, 0.7183325, 1, 1, 1, 1, 1,
0.9907103, 0.866685, 1.893442, 1, 1, 1, 1, 1,
0.9931167, -1.049205, 2.072956, 0, 0, 1, 1, 1,
0.9982733, 0.1611104, 1.508411, 1, 0, 0, 1, 1,
1.005594, 1.10364, 0.823772, 1, 0, 0, 1, 1,
1.010066, 0.4279901, 0.665575, 1, 0, 0, 1, 1,
1.010107, -1.16802, 2.642789, 1, 0, 0, 1, 1,
1.011511, -1.739385, 2.479405, 1, 0, 0, 1, 1,
1.01729, 1.727566, -0.3760344, 0, 0, 0, 1, 1,
1.0196, -1.388589, 1.473778, 0, 0, 0, 1, 1,
1.022084, -0.05456609, 1.882125, 0, 0, 0, 1, 1,
1.024052, 0.9299635, -0.3122647, 0, 0, 0, 1, 1,
1.025188, -1.07193, 3.268875, 0, 0, 0, 1, 1,
1.026994, 1.33096, 1.929689, 0, 0, 0, 1, 1,
1.028279, -0.4302546, 1.679959, 0, 0, 0, 1, 1,
1.029588, 0.3780143, 0.5754613, 1, 1, 1, 1, 1,
1.029922, 1.631424, -0.4650425, 1, 1, 1, 1, 1,
1.034379, -1.848067, 2.510405, 1, 1, 1, 1, 1,
1.038232, -0.4243834, 1.019519, 1, 1, 1, 1, 1,
1.038575, 1.004676, 3.400352, 1, 1, 1, 1, 1,
1.050774, 1.265733, 0.5798989, 1, 1, 1, 1, 1,
1.051002, -0.03896827, 1.800166, 1, 1, 1, 1, 1,
1.052813, -0.1736009, 1.343152, 1, 1, 1, 1, 1,
1.053138, 0.1960419, 1.32064, 1, 1, 1, 1, 1,
1.055546, 1.406323, 0.2991489, 1, 1, 1, 1, 1,
1.061013, 0.4812469, 0.1036321, 1, 1, 1, 1, 1,
1.062368, 0.233705, -0.3723872, 1, 1, 1, 1, 1,
1.064465, -0.1795378, 0.2974154, 1, 1, 1, 1, 1,
1.066288, 0.2878528, 2.410228, 1, 1, 1, 1, 1,
1.067571, -0.233732, 1.049992, 1, 1, 1, 1, 1,
1.074652, 0.5949726, 1.026555, 0, 0, 1, 1, 1,
1.076337, 0.4197963, 1.866501, 1, 0, 0, 1, 1,
1.080273, 1.52661, -1.318308, 1, 0, 0, 1, 1,
1.088773, 1.070144, 1.650712, 1, 0, 0, 1, 1,
1.090316, -0.07984934, 0.4659604, 1, 0, 0, 1, 1,
1.095189, -2.229369, 2.486233, 1, 0, 0, 1, 1,
1.101419, -3.179972, 2.652946, 0, 0, 0, 1, 1,
1.106087, -0.4996212, -0.1101439, 0, 0, 0, 1, 1,
1.108582, 0.6603609, -0.5704229, 0, 0, 0, 1, 1,
1.111917, -1.558552, 2.546176, 0, 0, 0, 1, 1,
1.117827, 0.2329238, -0.3722498, 0, 0, 0, 1, 1,
1.118724, 0.5910079, 0.4843952, 0, 0, 0, 1, 1,
1.119159, 0.9280626, 1.855751, 0, 0, 0, 1, 1,
1.147802, 1.642126, 0.5908139, 1, 1, 1, 1, 1,
1.148932, 0.8180487, 0.9543809, 1, 1, 1, 1, 1,
1.155341, 1.765825, 0.3231106, 1, 1, 1, 1, 1,
1.156072, -0.784426, 1.895384, 1, 1, 1, 1, 1,
1.157065, -0.6779066, 1.679226, 1, 1, 1, 1, 1,
1.162219, 1.54178, 1.085264, 1, 1, 1, 1, 1,
1.163381, 0.1148769, 1.398394, 1, 1, 1, 1, 1,
1.164048, 0.6834401, 0.6960385, 1, 1, 1, 1, 1,
1.165589, 0.04270779, 2.706684, 1, 1, 1, 1, 1,
1.16992, -0.4692219, 1.636931, 1, 1, 1, 1, 1,
1.171438, -0.4556595, 2.621341, 1, 1, 1, 1, 1,
1.173116, -0.9990603, 2.561721, 1, 1, 1, 1, 1,
1.174387, -0.7727765, 2.295821, 1, 1, 1, 1, 1,
1.179424, -0.1649399, 0.8943936, 1, 1, 1, 1, 1,
1.187463, 0.988061, 0.3552895, 1, 1, 1, 1, 1,
1.191253, -1.229769, 0.9564699, 0, 0, 1, 1, 1,
1.195005, 1.144827, -0.8459564, 1, 0, 0, 1, 1,
1.196058, 0.3738972, 1.906, 1, 0, 0, 1, 1,
1.201857, 0.2869197, 0.07330195, 1, 0, 0, 1, 1,
1.205273, -0.305303, 3.628995, 1, 0, 0, 1, 1,
1.208533, 0.8594187, 1.377654, 1, 0, 0, 1, 1,
1.216387, -1.029631, 0.6723723, 0, 0, 0, 1, 1,
1.220872, -0.471104, 0.3919574, 0, 0, 0, 1, 1,
1.238547, 0.4947939, 0.5980129, 0, 0, 0, 1, 1,
1.246991, -2.183953, 4.136858, 0, 0, 0, 1, 1,
1.250205, 2.040329, -1.502217, 0, 0, 0, 1, 1,
1.251308, 0.9909086, 0.8542368, 0, 0, 0, 1, 1,
1.253377, 1.796587, 1.34583, 0, 0, 0, 1, 1,
1.255764, -1.832114, 2.094015, 1, 1, 1, 1, 1,
1.260048, -0.03089632, 0.736267, 1, 1, 1, 1, 1,
1.262725, 0.1948056, 0.606822, 1, 1, 1, 1, 1,
1.26311, 2.199853, 2.128188, 1, 1, 1, 1, 1,
1.264833, -0.764289, 3.835373, 1, 1, 1, 1, 1,
1.265651, 0.05984802, 3.35692, 1, 1, 1, 1, 1,
1.275222, 0.7630515, 2.232243, 1, 1, 1, 1, 1,
1.283441, -2.061926, 1.937973, 1, 1, 1, 1, 1,
1.284071, 0.2212965, 0.1793058, 1, 1, 1, 1, 1,
1.299148, -0.04064584, 2.429665, 1, 1, 1, 1, 1,
1.312212, 0.02078689, 2.02813, 1, 1, 1, 1, 1,
1.336949, -0.01636887, 2.031063, 1, 1, 1, 1, 1,
1.337335, 0.7817987, 2.165996, 1, 1, 1, 1, 1,
1.337357, -0.7651876, 1.516125, 1, 1, 1, 1, 1,
1.349258, -0.3438966, 1.578392, 1, 1, 1, 1, 1,
1.358064, 0.1408941, 3.204759, 0, 0, 1, 1, 1,
1.362455, 0.8277154, 0.5059135, 1, 0, 0, 1, 1,
1.377594, 0.7081526, 3.127776, 1, 0, 0, 1, 1,
1.380426, 0.7086288, 1.987745, 1, 0, 0, 1, 1,
1.390918, 0.9019473, 2.641533, 1, 0, 0, 1, 1,
1.394131, -0.6727809, 3.033636, 1, 0, 0, 1, 1,
1.396893, -0.430983, 0.8068298, 0, 0, 0, 1, 1,
1.399146, 0.2980063, 2.588371, 0, 0, 0, 1, 1,
1.402809, -0.4131412, 1.446956, 0, 0, 0, 1, 1,
1.422761, -0.02276611, 2.302833, 0, 0, 0, 1, 1,
1.423973, 2.054821, -0.1135353, 0, 0, 0, 1, 1,
1.430781, 0.3721108, 1.837002, 0, 0, 0, 1, 1,
1.432052, 0.03136455, 0.7829678, 0, 0, 0, 1, 1,
1.438536, -0.3614918, 2.066231, 1, 1, 1, 1, 1,
1.442835, 1.000291, 1.355695, 1, 1, 1, 1, 1,
1.443961, 0.4949114, 0.8283693, 1, 1, 1, 1, 1,
1.458282, 0.03383137, 1.910335, 1, 1, 1, 1, 1,
1.458765, -0.6633329, 1.493028, 1, 1, 1, 1, 1,
1.460806, 0.4902694, 1.452876, 1, 1, 1, 1, 1,
1.461446, 0.9205424, 0.9361216, 1, 1, 1, 1, 1,
1.501726, -0.007041954, 0.3076378, 1, 1, 1, 1, 1,
1.504291, 0.9994577, -0.9994668, 1, 1, 1, 1, 1,
1.515595, -0.1765412, 1.101904, 1, 1, 1, 1, 1,
1.519367, 0.5403789, 0.3315004, 1, 1, 1, 1, 1,
1.522859, 1.934739, 0.5924697, 1, 1, 1, 1, 1,
1.537671, 0.352782, 1.581346, 1, 1, 1, 1, 1,
1.543878, -0.2371849, 2.492586, 1, 1, 1, 1, 1,
1.557685, -0.6150035, 1.137569, 1, 1, 1, 1, 1,
1.560228, -0.1529778, 1.587489, 0, 0, 1, 1, 1,
1.578183, -0.4527641, 1.370338, 1, 0, 0, 1, 1,
1.579879, -0.09403223, 2.662193, 1, 0, 0, 1, 1,
1.581816, -1.333871, 3.591496, 1, 0, 0, 1, 1,
1.592948, -0.3605549, 1.172425, 1, 0, 0, 1, 1,
1.598598, -2.251514, 1.702474, 1, 0, 0, 1, 1,
1.605759, 0.6522028, 0.3289051, 0, 0, 0, 1, 1,
1.623625, 0.9140055, 1.2429, 0, 0, 0, 1, 1,
1.626641, -0.8879558, 3.141386, 0, 0, 0, 1, 1,
1.628676, 0.3483618, 2.082544, 0, 0, 0, 1, 1,
1.633066, 1.472959, 0.9424787, 0, 0, 0, 1, 1,
1.636391, 2.039327, 0.6051616, 0, 0, 0, 1, 1,
1.643515, 1.517406, -1.408098, 0, 0, 0, 1, 1,
1.645021, 1.565143, 1.779275, 1, 1, 1, 1, 1,
1.647388, -0.1119253, 2.174557, 1, 1, 1, 1, 1,
1.664935, -0.2433301, 1.723639, 1, 1, 1, 1, 1,
1.665048, 0.8693327, 1.743534, 1, 1, 1, 1, 1,
1.673716, -1.407397, 0.5784548, 1, 1, 1, 1, 1,
1.678543, 1.125638, 1.283535, 1, 1, 1, 1, 1,
1.690143, 0.2335006, 0.8027455, 1, 1, 1, 1, 1,
1.693646, 0.7763892, 1.264575, 1, 1, 1, 1, 1,
1.701274, 0.2610002, 1.35662, 1, 1, 1, 1, 1,
1.726664, 0.7344763, -0.8594866, 1, 1, 1, 1, 1,
1.733402, 0.1991099, 3.441188, 1, 1, 1, 1, 1,
1.765408, 0.3944649, 1.411363, 1, 1, 1, 1, 1,
1.792031, -0.6355231, 0.932938, 1, 1, 1, 1, 1,
1.794982, -1.596303, 1.317571, 1, 1, 1, 1, 1,
1.795798, 2.177741, -0.4915276, 1, 1, 1, 1, 1,
1.803536, 1.921312, 1.08564, 0, 0, 1, 1, 1,
1.810748, 0.6295047, 2.697346, 1, 0, 0, 1, 1,
1.818822, -0.4032447, 1.321094, 1, 0, 0, 1, 1,
1.830501, 2.203515, -1.083676, 1, 0, 0, 1, 1,
1.851125, 0.634095, 1.138611, 1, 0, 0, 1, 1,
1.855812, 0.3348575, 1.321691, 1, 0, 0, 1, 1,
1.857825, 2.036861, 0.4600401, 0, 0, 0, 1, 1,
1.876577, -0.8005943, 1.731828, 0, 0, 0, 1, 1,
1.880856, -0.05946689, -0.4187607, 0, 0, 0, 1, 1,
1.888342, 0.60098, 1.340425, 0, 0, 0, 1, 1,
1.913213, 1.15239, 1.013905, 0, 0, 0, 1, 1,
1.929338, 2.842783, 0.8854123, 0, 0, 0, 1, 1,
1.958058, -0.9830697, 2.651953, 0, 0, 0, 1, 1,
1.960612, -0.7318081, 2.52809, 1, 1, 1, 1, 1,
1.983037, -0.813491, 0.1696345, 1, 1, 1, 1, 1,
2.033665, 0.05994453, 1.227977, 1, 1, 1, 1, 1,
2.036904, -0.9874666, 2.284194, 1, 1, 1, 1, 1,
2.048182, -0.8250936, 2.432942, 1, 1, 1, 1, 1,
2.052253, -1.632878, 2.492695, 1, 1, 1, 1, 1,
2.062205, -0.5133202, 1.319676, 1, 1, 1, 1, 1,
2.065906, 0.5867427, 0.4506716, 1, 1, 1, 1, 1,
2.081044, 0.4566962, 1.299948, 1, 1, 1, 1, 1,
2.114474, -0.6281953, 0.5537726, 1, 1, 1, 1, 1,
2.119763, -0.2550157, 0.9074689, 1, 1, 1, 1, 1,
2.120844, 0.5642062, 0.8998643, 1, 1, 1, 1, 1,
2.142473, 0.9115756, 1.040543, 1, 1, 1, 1, 1,
2.170115, -1.708662, 1.843281, 1, 1, 1, 1, 1,
2.175957, 0.4199177, 2.379791, 1, 1, 1, 1, 1,
2.176663, 0.5234783, -0.006129793, 0, 0, 1, 1, 1,
2.203691, -0.3225709, 1.856352, 1, 0, 0, 1, 1,
2.208538, 1.313857, 2.374619, 1, 0, 0, 1, 1,
2.277722, 0.6051475, 0.3001239, 1, 0, 0, 1, 1,
2.323889, -1.410368, 3.105372, 1, 0, 0, 1, 1,
2.345352, -0.9064657, 1.370789, 1, 0, 0, 1, 1,
2.371582, 0.1160114, 1.898184, 0, 0, 0, 1, 1,
2.389052, -1.185549, 2.455963, 0, 0, 0, 1, 1,
2.3925, -0.3405215, 0.7276419, 0, 0, 0, 1, 1,
2.394112, -0.2750815, -0.04287036, 0, 0, 0, 1, 1,
2.409315, -1.656703, 2.792748, 0, 0, 0, 1, 1,
2.522271, 1.983454, -0.8956152, 0, 0, 0, 1, 1,
2.522503, 0.7134774, 0.1127595, 0, 0, 0, 1, 1,
2.580277, -1.251822, 2.177712, 1, 1, 1, 1, 1,
2.594281, -0.3047749, 5.132901, 1, 1, 1, 1, 1,
2.62395, -0.0149643, 1.293066, 1, 1, 1, 1, 1,
2.727029, 1.497206, 1.275372, 1, 1, 1, 1, 1,
2.988824, -1.607739, 1.445341, 1, 1, 1, 1, 1,
3.005628, -0.3718548, 1.589342, 1, 1, 1, 1, 1,
3.585641, 2.078725, 0.1986266, 1, 1, 1, 1, 1
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
var radius = 9.798228;
var distance = 34.41586;
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
mvMatrix.translate( -0.4085956, 0.1279069, 0.5622289 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.41586);
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
