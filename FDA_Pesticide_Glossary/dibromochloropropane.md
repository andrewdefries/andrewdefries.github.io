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
-3.203343, 1.228565, -3.053194, 1, 0, 0, 1,
-3.188354, 1.736747, -1.487881, 1, 0.007843138, 0, 1,
-3.159182, 1.228223, -0.03092824, 1, 0.01176471, 0, 1,
-3.142439, 0.08609746, -2.535783, 1, 0.01960784, 0, 1,
-3.090128, -0.4235277, -0.6135505, 1, 0.02352941, 0, 1,
-2.896263, 1.126063, -2.699061, 1, 0.03137255, 0, 1,
-2.806405, 1.254742, -2.021452, 1, 0.03529412, 0, 1,
-2.555475, 0.6116285, -1.556503, 1, 0.04313726, 0, 1,
-2.474311, -0.2241986, -0.3011946, 1, 0.04705882, 0, 1,
-2.422663, 0.1384683, -2.545008, 1, 0.05490196, 0, 1,
-2.366892, -1.720676, -2.954515, 1, 0.05882353, 0, 1,
-2.314749, 0.4106751, -1.020054, 1, 0.06666667, 0, 1,
-2.284343, -0.4227291, -1.042371, 1, 0.07058824, 0, 1,
-2.283169, 1.074788, -1.227363, 1, 0.07843138, 0, 1,
-2.256589, 1.586529, 0.7276396, 1, 0.08235294, 0, 1,
-2.219643, -2.524279, -1.909995, 1, 0.09019608, 0, 1,
-2.192369, -0.9859164, -4.261518, 1, 0.09411765, 0, 1,
-2.145638, -2.382615, -1.169476, 1, 0.1019608, 0, 1,
-2.062953, -0.482695, -1.089373, 1, 0.1098039, 0, 1,
-2.060807, -0.1093634, -1.353172, 1, 0.1137255, 0, 1,
-2.050987, -2.150929, -4.096966, 1, 0.1215686, 0, 1,
-2.026493, 0.06535081, -2.06088, 1, 0.1254902, 0, 1,
-2.0162, -0.4733342, -0.4764335, 1, 0.1333333, 0, 1,
-2.016033, 2.511198, -1.250777, 1, 0.1372549, 0, 1,
-2.015625, -0.5423238, -0.9844362, 1, 0.145098, 0, 1,
-1.988586, -1.791555, -1.836439, 1, 0.1490196, 0, 1,
-1.960918, -0.8807947, -3.430918, 1, 0.1568628, 0, 1,
-1.947472, -0.1294652, -1.741042, 1, 0.1607843, 0, 1,
-1.920956, -1.089601, -2.570146, 1, 0.1686275, 0, 1,
-1.917157, 0.3591551, 0.1559149, 1, 0.172549, 0, 1,
-1.905301, 0.07077808, -2.667652, 1, 0.1803922, 0, 1,
-1.872795, 0.06032781, -1.469895, 1, 0.1843137, 0, 1,
-1.865149, 0.3155603, -2.508234, 1, 0.1921569, 0, 1,
-1.862074, -0.2204738, -2.009562, 1, 0.1960784, 0, 1,
-1.844366, 0.4803779, -2.056288, 1, 0.2039216, 0, 1,
-1.831729, -0.5930664, -3.025098, 1, 0.2117647, 0, 1,
-1.829602, 1.293971, -0.285506, 1, 0.2156863, 0, 1,
-1.818427, -1.357129, -0.9693062, 1, 0.2235294, 0, 1,
-1.805499, -1.758519, -1.935059, 1, 0.227451, 0, 1,
-1.805037, 0.1406809, -1.1164, 1, 0.2352941, 0, 1,
-1.784787, -0.6284776, -2.499081, 1, 0.2392157, 0, 1,
-1.776007, 0.336726, -1.099084, 1, 0.2470588, 0, 1,
-1.775176, 0.2957416, -2.140188, 1, 0.2509804, 0, 1,
-1.770719, -1.239352, -1.092882, 1, 0.2588235, 0, 1,
-1.770059, 0.01255555, -1.229377, 1, 0.2627451, 0, 1,
-1.754853, 1.191034, -1.44141, 1, 0.2705882, 0, 1,
-1.744831, 1.781365, -2.016649, 1, 0.2745098, 0, 1,
-1.744791, 0.2497519, -0.6350305, 1, 0.282353, 0, 1,
-1.741818, 0.1253944, -2.018284, 1, 0.2862745, 0, 1,
-1.710862, 0.655593, -1.038636, 1, 0.2941177, 0, 1,
-1.703421, 1.22163, -1.696143, 1, 0.3019608, 0, 1,
-1.677721, -0.256241, -3.277715, 1, 0.3058824, 0, 1,
-1.668659, -0.9079697, 0.7365507, 1, 0.3137255, 0, 1,
-1.655799, -0.7835879, -1.215999, 1, 0.3176471, 0, 1,
-1.646364, 0.9174163, -0.6306132, 1, 0.3254902, 0, 1,
-1.643168, 0.8911971, 0.3494312, 1, 0.3294118, 0, 1,
-1.628806, 0.1313936, -1.020692, 1, 0.3372549, 0, 1,
-1.622856, 0.8716823, -0.7846135, 1, 0.3411765, 0, 1,
-1.5968, -1.22138, -1.874958, 1, 0.3490196, 0, 1,
-1.5723, -1.235573, -2.22458, 1, 0.3529412, 0, 1,
-1.568958, -1.643653, -1.933032, 1, 0.3607843, 0, 1,
-1.565239, 1.581045, -1.764279, 1, 0.3647059, 0, 1,
-1.563894, 1.433641, -0.3994226, 1, 0.372549, 0, 1,
-1.562454, 0.8238511, -1.400133, 1, 0.3764706, 0, 1,
-1.561066, -0.6039845, 0.2781435, 1, 0.3843137, 0, 1,
-1.555005, -1.881816, -1.46107, 1, 0.3882353, 0, 1,
-1.552111, 1.609267, -0.8540695, 1, 0.3960784, 0, 1,
-1.545566, -0.9378895, -3.582754, 1, 0.4039216, 0, 1,
-1.541581, 0.08097265, 0.1760388, 1, 0.4078431, 0, 1,
-1.529879, 0.05888164, -1.157373, 1, 0.4156863, 0, 1,
-1.508576, -0.01134442, -1.840689, 1, 0.4196078, 0, 1,
-1.497854, 1.465173, 1.920524, 1, 0.427451, 0, 1,
-1.49235, -0.5738269, 0.412127, 1, 0.4313726, 0, 1,
-1.484031, 0.07513504, -0.5991031, 1, 0.4392157, 0, 1,
-1.476934, -0.1969933, 0.2250326, 1, 0.4431373, 0, 1,
-1.476612, -0.8483486, -2.265169, 1, 0.4509804, 0, 1,
-1.468295, 0.8263627, -0.3868502, 1, 0.454902, 0, 1,
-1.463312, -0.21592, -2.191037, 1, 0.4627451, 0, 1,
-1.46017, 1.130958, -0.8434463, 1, 0.4666667, 0, 1,
-1.459111, -1.492761, -2.308798, 1, 0.4745098, 0, 1,
-1.458398, -0.8489792, -3.026834, 1, 0.4784314, 0, 1,
-1.455443, 0.8735746, -1.574467, 1, 0.4862745, 0, 1,
-1.44653, 0.2731628, -0.10523, 1, 0.4901961, 0, 1,
-1.443049, 0.3263291, -3.760256, 1, 0.4980392, 0, 1,
-1.440612, 1.730448, -0.4054683, 1, 0.5058824, 0, 1,
-1.439497, 2.142458, -0.04508169, 1, 0.509804, 0, 1,
-1.433516, -1.59366, -3.179411, 1, 0.5176471, 0, 1,
-1.43201, -0.1973316, -2.270371, 1, 0.5215687, 0, 1,
-1.429233, -0.8682041, -1.964387, 1, 0.5294118, 0, 1,
-1.416063, -1.055524, -3.291073, 1, 0.5333334, 0, 1,
-1.395381, 1.825938, 0.173779, 1, 0.5411765, 0, 1,
-1.381546, -0.8554556, -2.04463, 1, 0.5450981, 0, 1,
-1.37895, 2.147832, -0.3763867, 1, 0.5529412, 0, 1,
-1.369984, -2.296807, -3.060351, 1, 0.5568628, 0, 1,
-1.36745, -0.6268127, -2.161899, 1, 0.5647059, 0, 1,
-1.361645, 1.439911, 0.8451101, 1, 0.5686275, 0, 1,
-1.357731, 1.119797, -1.634364, 1, 0.5764706, 0, 1,
-1.354572, 0.5906702, -0.02303147, 1, 0.5803922, 0, 1,
-1.348159, 0.9708228, 0.6998017, 1, 0.5882353, 0, 1,
-1.344947, 0.145153, -1.876372, 1, 0.5921569, 0, 1,
-1.344272, -1.462484, -2.431154, 1, 0.6, 0, 1,
-1.338063, -0.6644149, -2.966841, 1, 0.6078432, 0, 1,
-1.312145, 0.3452127, -0.9128153, 1, 0.6117647, 0, 1,
-1.306519, 1.012284, -2.649053, 1, 0.6196079, 0, 1,
-1.306264, 0.2899357, -1.587711, 1, 0.6235294, 0, 1,
-1.302701, 0.05708943, -3.109169, 1, 0.6313726, 0, 1,
-1.301679, 0.9174953, -0.4903109, 1, 0.6352941, 0, 1,
-1.298498, 0.1991488, -0.6254451, 1, 0.6431373, 0, 1,
-1.296648, 0.9401212, -0.3952216, 1, 0.6470588, 0, 1,
-1.296191, 1.366498, -1.856833, 1, 0.654902, 0, 1,
-1.284618, -1.247344, -1.878565, 1, 0.6588235, 0, 1,
-1.273726, -0.1962685, -4.179095, 1, 0.6666667, 0, 1,
-1.260819, -1.485096, -1.920426, 1, 0.6705883, 0, 1,
-1.260184, -1.921479, -3.14124, 1, 0.6784314, 0, 1,
-1.259947, 1.848293, -1.086822, 1, 0.682353, 0, 1,
-1.255072, 2.138952, -1.1168, 1, 0.6901961, 0, 1,
-1.253242, 1.146141, -1.635828, 1, 0.6941177, 0, 1,
-1.251553, -0.4091386, -3.783618, 1, 0.7019608, 0, 1,
-1.246099, -0.4684835, -2.536423, 1, 0.7098039, 0, 1,
-1.228977, 0.8515364, 0.1663316, 1, 0.7137255, 0, 1,
-1.227704, 0.8120692, -2.460441, 1, 0.7215686, 0, 1,
-1.214123, -0.6736566, -1.137786, 1, 0.7254902, 0, 1,
-1.209822, 0.2186222, -2.375267, 1, 0.7333333, 0, 1,
-1.205316, -1.041206, -1.053419, 1, 0.7372549, 0, 1,
-1.205266, 0.5576161, -2.260164, 1, 0.7450981, 0, 1,
-1.203475, -0.3096882, -1.240631, 1, 0.7490196, 0, 1,
-1.200379, -1.787302, -2.638367, 1, 0.7568628, 0, 1,
-1.197626, 0.2622604, -0.0616597, 1, 0.7607843, 0, 1,
-1.195474, 0.9169412, 0.9014443, 1, 0.7686275, 0, 1,
-1.186664, -0.1844978, -0.8651894, 1, 0.772549, 0, 1,
-1.185916, 0.7643596, -1.27184, 1, 0.7803922, 0, 1,
-1.185031, 0.9107184, -0.634418, 1, 0.7843137, 0, 1,
-1.170538, -0.2660744, -1.618488, 1, 0.7921569, 0, 1,
-1.159427, 1.04984, -0.5690823, 1, 0.7960784, 0, 1,
-1.152072, -0.6106185, -1.924447, 1, 0.8039216, 0, 1,
-1.14983, -0.1474456, -1.457121, 1, 0.8117647, 0, 1,
-1.146296, 1.132099, 0.1612959, 1, 0.8156863, 0, 1,
-1.145219, -0.1085075, -2.125353, 1, 0.8235294, 0, 1,
-1.140154, -0.4807896, -0.6424774, 1, 0.827451, 0, 1,
-1.134018, -0.5683893, -1.413065, 1, 0.8352941, 0, 1,
-1.129669, 0.3776705, -4.460864, 1, 0.8392157, 0, 1,
-1.126533, -0.331539, -2.170442, 1, 0.8470588, 0, 1,
-1.122462, 0.06496468, -2.060141, 1, 0.8509804, 0, 1,
-1.12047, -0.436626, -1.885716, 1, 0.8588235, 0, 1,
-1.119258, -1.138458, -2.09397, 1, 0.8627451, 0, 1,
-1.118796, 0.06169519, -0.7779311, 1, 0.8705882, 0, 1,
-1.099941, -0.2616007, -2.367322, 1, 0.8745098, 0, 1,
-1.098938, -0.07342883, -2.465624, 1, 0.8823529, 0, 1,
-1.097793, 0.2513865, 0.2513594, 1, 0.8862745, 0, 1,
-1.092199, 0.4102086, -2.059352, 1, 0.8941177, 0, 1,
-1.092022, 0.269513, -2.140686, 1, 0.8980392, 0, 1,
-1.085611, -0.7665082, -2.154648, 1, 0.9058824, 0, 1,
-1.08062, 1.329236, -0.3685339, 1, 0.9137255, 0, 1,
-1.079686, 0.6054207, -1.499796, 1, 0.9176471, 0, 1,
-1.079606, -0.1501102, -0.4466715, 1, 0.9254902, 0, 1,
-1.077249, -0.380219, -1.46033, 1, 0.9294118, 0, 1,
-1.066576, -0.8168998, -2.462786, 1, 0.9372549, 0, 1,
-1.061797, 0.8698109, -2.359171, 1, 0.9411765, 0, 1,
-1.060281, 0.2451295, -1.661383, 1, 0.9490196, 0, 1,
-1.059294, -1.43666, -2.249334, 1, 0.9529412, 0, 1,
-1.058362, -1.229594, -1.106178, 1, 0.9607843, 0, 1,
-1.054363, -0.5314026, -2.136636, 1, 0.9647059, 0, 1,
-1.05327, -0.2112078, -1.755927, 1, 0.972549, 0, 1,
-1.049189, -0.07589377, -2.042392, 1, 0.9764706, 0, 1,
-1.049047, 0.0449099, -2.280938, 1, 0.9843137, 0, 1,
-1.046509, 0.2827228, -1.177937, 1, 0.9882353, 0, 1,
-1.040284, -0.1937093, -1.992675, 1, 0.9960784, 0, 1,
-1.033248, 1.16627, -0.3864832, 0.9960784, 1, 0, 1,
-1.028437, 0.1642196, -1.814216, 0.9921569, 1, 0, 1,
-1.028374, 0.8998588, -1.235184, 0.9843137, 1, 0, 1,
-1.020818, 0.9952515, 0.657051, 0.9803922, 1, 0, 1,
-1.019225, 0.1489707, -1.63607, 0.972549, 1, 0, 1,
-1.013269, 1.049662, 0.7217465, 0.9686275, 1, 0, 1,
-1.012182, -0.3723499, -3.21612, 0.9607843, 1, 0, 1,
-1.009796, 0.4419341, -1.025918, 0.9568627, 1, 0, 1,
-1.009356, 0.4934696, -1.422215, 0.9490196, 1, 0, 1,
-1.008655, -0.947966, -2.238592, 0.945098, 1, 0, 1,
-1.00582, 0.9710604, -0.64803, 0.9372549, 1, 0, 1,
-1.005561, -0.589474, -2.583293, 0.9333333, 1, 0, 1,
-1.002181, 1.982107, 0.1041579, 0.9254902, 1, 0, 1,
-0.995024, -0.1087709, -1.419059, 0.9215686, 1, 0, 1,
-0.9928817, 2.648286, -0.4235677, 0.9137255, 1, 0, 1,
-0.9901745, 1.529041, -1.782717, 0.9098039, 1, 0, 1,
-0.9714623, -0.8571627, -3.142876, 0.9019608, 1, 0, 1,
-0.9675025, 0.4647547, -0.685743, 0.8941177, 1, 0, 1,
-0.966312, -0.6667679, -2.487082, 0.8901961, 1, 0, 1,
-0.9652747, -0.891932, -1.158769, 0.8823529, 1, 0, 1,
-0.9609636, -0.2526715, 1.381249, 0.8784314, 1, 0, 1,
-0.9523786, -0.2235054, -2.520764, 0.8705882, 1, 0, 1,
-0.9477891, -0.4264819, -1.6337, 0.8666667, 1, 0, 1,
-0.9471594, -0.6908207, -4.041768, 0.8588235, 1, 0, 1,
-0.9436289, -0.9008628, -2.591802, 0.854902, 1, 0, 1,
-0.9364969, -1.449813, -1.729508, 0.8470588, 1, 0, 1,
-0.9336632, -0.3481029, -1.109037, 0.8431373, 1, 0, 1,
-0.9168479, 0.3632792, -0.8141674, 0.8352941, 1, 0, 1,
-0.9159995, 0.3931201, -2.07846, 0.8313726, 1, 0, 1,
-0.9148924, -0.04257229, -1.246897, 0.8235294, 1, 0, 1,
-0.9144462, -0.3681493, -3.14874, 0.8196079, 1, 0, 1,
-0.9094566, 0.6999907, 0.6804507, 0.8117647, 1, 0, 1,
-0.8950372, -1.371499, -1.471173, 0.8078431, 1, 0, 1,
-0.891163, -0.3717908, -0.6462618, 0.8, 1, 0, 1,
-0.8911005, -2.191157, -2.54783, 0.7921569, 1, 0, 1,
-0.888361, 2.412903, -1.549944, 0.7882353, 1, 0, 1,
-0.8874088, -0.6006717, -1.410913, 0.7803922, 1, 0, 1,
-0.8799155, 0.5732678, -1.021802, 0.7764706, 1, 0, 1,
-0.8729042, 0.08611805, -1.555315, 0.7686275, 1, 0, 1,
-0.8716246, 0.2805398, -0.3943397, 0.7647059, 1, 0, 1,
-0.8692681, -1.190022, -0.7391647, 0.7568628, 1, 0, 1,
-0.8654048, 1.346469, -0.9216068, 0.7529412, 1, 0, 1,
-0.8604839, -1.036949, -1.120226, 0.7450981, 1, 0, 1,
-0.8596513, 0.1947844, -0.6586627, 0.7411765, 1, 0, 1,
-0.8588874, 0.1736063, -0.4173845, 0.7333333, 1, 0, 1,
-0.8557432, 2.082081, -0.01375874, 0.7294118, 1, 0, 1,
-0.8432702, -0.7724183, -0.1352912, 0.7215686, 1, 0, 1,
-0.8315237, -0.319806, 0.05999211, 0.7176471, 1, 0, 1,
-0.8308713, 0.5104558, -1.987594, 0.7098039, 1, 0, 1,
-0.8293296, 0.04457252, -0.7731203, 0.7058824, 1, 0, 1,
-0.8270438, 0.1887074, -2.302186, 0.6980392, 1, 0, 1,
-0.8228227, 0.6131563, -0.02016668, 0.6901961, 1, 0, 1,
-0.8206815, 0.4394459, -0.8826088, 0.6862745, 1, 0, 1,
-0.8204339, -1.289032, -1.749069, 0.6784314, 1, 0, 1,
-0.8134106, -0.8012245, -2.296942, 0.6745098, 1, 0, 1,
-0.8027979, -1.3743, -2.360835, 0.6666667, 1, 0, 1,
-0.8022, -1.248829, -3.043529, 0.6627451, 1, 0, 1,
-0.7976642, 0.2201174, -1.632578, 0.654902, 1, 0, 1,
-0.794418, 1.492372, -0.7449304, 0.6509804, 1, 0, 1,
-0.7917046, 1.315101, -0.5521408, 0.6431373, 1, 0, 1,
-0.7811108, -0.9215916, -3.797013, 0.6392157, 1, 0, 1,
-0.7747781, 0.9395881, 0.6370252, 0.6313726, 1, 0, 1,
-0.768935, -0.03081524, -3.004216, 0.627451, 1, 0, 1,
-0.7660514, 0.5051721, -0.550295, 0.6196079, 1, 0, 1,
-0.7654243, -0.5122661, -2.992121, 0.6156863, 1, 0, 1,
-0.7616005, 0.9936761, -0.7360871, 0.6078432, 1, 0, 1,
-0.7585291, 1.84168, 0.573221, 0.6039216, 1, 0, 1,
-0.7578286, -1.193812, -2.448014, 0.5960785, 1, 0, 1,
-0.7495047, 1.607095, -1.229164, 0.5882353, 1, 0, 1,
-0.7489301, 0.12089, -0.9674356, 0.5843138, 1, 0, 1,
-0.743988, -1.689228, -3.750152, 0.5764706, 1, 0, 1,
-0.7400821, -0.2658135, -0.9433919, 0.572549, 1, 0, 1,
-0.738085, 1.517793, -2.292093, 0.5647059, 1, 0, 1,
-0.7359682, -1.60422, -3.679221, 0.5607843, 1, 0, 1,
-0.734296, 1.417933, -1.509257, 0.5529412, 1, 0, 1,
-0.7306582, -0.4748562, -2.334285, 0.5490196, 1, 0, 1,
-0.7086149, 0.2938562, -1.854879, 0.5411765, 1, 0, 1,
-0.7067158, -0.4734917, -2.07863, 0.5372549, 1, 0, 1,
-0.7042963, 0.1335556, -0.5776526, 0.5294118, 1, 0, 1,
-0.7038247, 1.841753, 1.483784, 0.5254902, 1, 0, 1,
-0.7021382, -0.845911, -2.754978, 0.5176471, 1, 0, 1,
-0.6999337, -0.7514336, -3.194155, 0.5137255, 1, 0, 1,
-0.6993223, -0.5631484, -4.540399, 0.5058824, 1, 0, 1,
-0.6981495, 1.138853, -0.8642301, 0.5019608, 1, 0, 1,
-0.6967141, -1.342207, -2.958349, 0.4941176, 1, 0, 1,
-0.6949846, -0.9323776, -2.028513, 0.4862745, 1, 0, 1,
-0.6905476, -0.3249557, -4.28314, 0.4823529, 1, 0, 1,
-0.6893744, 1.739338, -1.142377, 0.4745098, 1, 0, 1,
-0.6875811, -0.07260746, -2.173111, 0.4705882, 1, 0, 1,
-0.6848782, -0.2597348, -1.373095, 0.4627451, 1, 0, 1,
-0.683924, -0.4345863, -3.091451, 0.4588235, 1, 0, 1,
-0.6833412, 1.19536, -1.51628, 0.4509804, 1, 0, 1,
-0.6830445, 1.06664, -0.3888389, 0.4470588, 1, 0, 1,
-0.677731, 0.6305649, -1.481973, 0.4392157, 1, 0, 1,
-0.6775459, -0.4883904, -1.005394, 0.4352941, 1, 0, 1,
-0.6767883, 1.171343, 1.307583, 0.427451, 1, 0, 1,
-0.6692319, 0.6925249, -2.324555, 0.4235294, 1, 0, 1,
-0.6628539, 1.175418, 0.08385859, 0.4156863, 1, 0, 1,
-0.6602069, 0.1453008, -2.115566, 0.4117647, 1, 0, 1,
-0.6601875, 0.8895928, -2.245588, 0.4039216, 1, 0, 1,
-0.6595345, -0.4332192, -1.932975, 0.3960784, 1, 0, 1,
-0.6585218, -0.4345821, -0.5735166, 0.3921569, 1, 0, 1,
-0.6534649, -0.2829047, -3.52285, 0.3843137, 1, 0, 1,
-0.6509518, -0.8400398, -1.53591, 0.3803922, 1, 0, 1,
-0.6506018, -1.403882, -3.57705, 0.372549, 1, 0, 1,
-0.649456, -1.149367, -3.06101, 0.3686275, 1, 0, 1,
-0.6451949, -0.1312265, -3.61597, 0.3607843, 1, 0, 1,
-0.6435893, 0.8683833, -1.974788, 0.3568628, 1, 0, 1,
-0.6402494, 0.9759405, 0.9869968, 0.3490196, 1, 0, 1,
-0.6370468, -1.552799, -4.147739, 0.345098, 1, 0, 1,
-0.6357211, 0.07429864, -1.099667, 0.3372549, 1, 0, 1,
-0.6353639, -0.7509649, -2.860683, 0.3333333, 1, 0, 1,
-0.6340476, 0.4588912, -2.176479, 0.3254902, 1, 0, 1,
-0.6318749, 0.5109099, -2.187989, 0.3215686, 1, 0, 1,
-0.6306512, -1.422086, -2.512546, 0.3137255, 1, 0, 1,
-0.6291617, -0.5872164, -0.4871443, 0.3098039, 1, 0, 1,
-0.6290668, -0.02856295, -0.4458311, 0.3019608, 1, 0, 1,
-0.6271013, 2.080156, -0.6681476, 0.2941177, 1, 0, 1,
-0.6167533, -0.2100394, -1.535392, 0.2901961, 1, 0, 1,
-0.6138393, 0.4182692, -1.662148, 0.282353, 1, 0, 1,
-0.608439, 2.275409, -0.2541252, 0.2784314, 1, 0, 1,
-0.6046582, 1.165735, -0.6989753, 0.2705882, 1, 0, 1,
-0.5931866, -0.1167815, -1.14748, 0.2666667, 1, 0, 1,
-0.5877804, -0.07071465, -0.3392881, 0.2588235, 1, 0, 1,
-0.5839686, -0.3104448, -0.6681692, 0.254902, 1, 0, 1,
-0.5825685, 0.457975, -0.02763061, 0.2470588, 1, 0, 1,
-0.5820358, 0.6222055, 0.1783192, 0.2431373, 1, 0, 1,
-0.5800146, 0.1327741, -1.874378, 0.2352941, 1, 0, 1,
-0.5767954, 0.5563776, -3.227651, 0.2313726, 1, 0, 1,
-0.5759087, 1.66718, -1.375651, 0.2235294, 1, 0, 1,
-0.5738626, 1.832359, 1.477072, 0.2196078, 1, 0, 1,
-0.5723068, -0.2601105, -1.942672, 0.2117647, 1, 0, 1,
-0.5714806, 0.09702305, -1.597248, 0.2078431, 1, 0, 1,
-0.5671741, 0.278325, -1.41661, 0.2, 1, 0, 1,
-0.566346, 0.2421591, 0.002291743, 0.1921569, 1, 0, 1,
-0.5645309, 0.8139688, -3.687576, 0.1882353, 1, 0, 1,
-0.562243, 1.039369, -0.6009902, 0.1803922, 1, 0, 1,
-0.5580585, 1.378798, -1.223244, 0.1764706, 1, 0, 1,
-0.5549475, -0.2405006, -2.729317, 0.1686275, 1, 0, 1,
-0.5507923, 0.3002822, -1.392626, 0.1647059, 1, 0, 1,
-0.5380719, 0.1264945, -2.356936, 0.1568628, 1, 0, 1,
-0.5368243, 1.015485, -1.042566, 0.1529412, 1, 0, 1,
-0.5361753, 1.099621, -0.2492205, 0.145098, 1, 0, 1,
-0.5357839, 1.234757, -0.2179437, 0.1411765, 1, 0, 1,
-0.5345209, 0.6661865, -1.606601, 0.1333333, 1, 0, 1,
-0.5331301, 0.2680312, -1.297491, 0.1294118, 1, 0, 1,
-0.5243686, -0.9887846, -1.471818, 0.1215686, 1, 0, 1,
-0.5186821, -1.089483, -1.537947, 0.1176471, 1, 0, 1,
-0.5180226, 0.5115108, -1.092828, 0.1098039, 1, 0, 1,
-0.5178575, -0.1505921, -0.1673736, 0.1058824, 1, 0, 1,
-0.5176373, 0.2716132, 0.09104507, 0.09803922, 1, 0, 1,
-0.517447, -0.4569549, -1.585107, 0.09019608, 1, 0, 1,
-0.5123324, -0.1648539, -2.027811, 0.08627451, 1, 0, 1,
-0.5107181, 0.1870192, -1.094528, 0.07843138, 1, 0, 1,
-0.507026, 0.8256878, 0.5333459, 0.07450981, 1, 0, 1,
-0.5034113, -0.3410083, -2.697311, 0.06666667, 1, 0, 1,
-0.5029532, -0.3503319, -2.239367, 0.0627451, 1, 0, 1,
-0.4980094, -1.289236, -3.385121, 0.05490196, 1, 0, 1,
-0.4950514, -0.1489235, -3.315381, 0.05098039, 1, 0, 1,
-0.4942647, -0.5331178, -1.588622, 0.04313726, 1, 0, 1,
-0.4925341, 1.764104, 1.119895, 0.03921569, 1, 0, 1,
-0.4917945, 0.2298361, -1.077303, 0.03137255, 1, 0, 1,
-0.4900462, 1.241736, -2.20369, 0.02745098, 1, 0, 1,
-0.485829, 0.5476528, 0.1477108, 0.01960784, 1, 0, 1,
-0.4818543, 0.08276003, -1.576899, 0.01568628, 1, 0, 1,
-0.4797226, -0.6003638, -2.395305, 0.007843138, 1, 0, 1,
-0.4733427, 0.6475102, 0.7189005, 0.003921569, 1, 0, 1,
-0.471487, 0.5342681, -1.243474, 0, 1, 0.003921569, 1,
-0.4703419, 0.4628488, -1.586481, 0, 1, 0.01176471, 1,
-0.4688237, -1.898241, -5.029559, 0, 1, 0.01568628, 1,
-0.4662278, -1.141459, -1.089505, 0, 1, 0.02352941, 1,
-0.4647177, -1.007852, -4.566197, 0, 1, 0.02745098, 1,
-0.4642954, -1.587337, -2.643876, 0, 1, 0.03529412, 1,
-0.4620738, 1.460561, -0.1724573, 0, 1, 0.03921569, 1,
-0.4588892, 1.393872, 0.5506779, 0, 1, 0.04705882, 1,
-0.458883, 0.2960716, -2.257972, 0, 1, 0.05098039, 1,
-0.4575973, 1.654534, -1.606325, 0, 1, 0.05882353, 1,
-0.4536765, 2.388207, -1.016413, 0, 1, 0.0627451, 1,
-0.4528057, 0.3656134, -2.662169, 0, 1, 0.07058824, 1,
-0.4510412, -1.260875, -1.765404, 0, 1, 0.07450981, 1,
-0.4491728, 2.441033, 0.5753051, 0, 1, 0.08235294, 1,
-0.4460301, -2.242397, -1.772354, 0, 1, 0.08627451, 1,
-0.4432173, 1.629421, 0.5578337, 0, 1, 0.09411765, 1,
-0.4424485, 0.8082374, -2.002327, 0, 1, 0.1019608, 1,
-0.4420306, -2.279606, -4.172157, 0, 1, 0.1058824, 1,
-0.4407571, -1.565361, -2.621876, 0, 1, 0.1137255, 1,
-0.4390232, -0.45632, -2.963465, 0, 1, 0.1176471, 1,
-0.4382734, 0.6178038, 0.1098292, 0, 1, 0.1254902, 1,
-0.4357503, 1.013224, -0.2636414, 0, 1, 0.1294118, 1,
-0.4271333, 0.1160741, -1.853142, 0, 1, 0.1372549, 1,
-0.4261648, 1.259716, -1.107553, 0, 1, 0.1411765, 1,
-0.4257862, 0.088989, -1.559485, 0, 1, 0.1490196, 1,
-0.4189979, 1.239158, -2.223148, 0, 1, 0.1529412, 1,
-0.4135791, -0.2337292, -1.562253, 0, 1, 0.1607843, 1,
-0.4109329, 0.6704434, -1.2577, 0, 1, 0.1647059, 1,
-0.4095011, -0.2162025, -1.459404, 0, 1, 0.172549, 1,
-0.4038422, -1.656305, -1.392168, 0, 1, 0.1764706, 1,
-0.4014126, -2.381761, -2.808969, 0, 1, 0.1843137, 1,
-0.3977795, -0.1741572, -2.374761, 0, 1, 0.1882353, 1,
-0.3968081, 0.2040058, -1.025772, 0, 1, 0.1960784, 1,
-0.3961945, 0.923148, 0.268325, 0, 1, 0.2039216, 1,
-0.3928986, 0.1966342, -1.699971, 0, 1, 0.2078431, 1,
-0.3908255, -0.5415714, -3.720914, 0, 1, 0.2156863, 1,
-0.3896575, -1.004788, -2.13767, 0, 1, 0.2196078, 1,
-0.383982, -0.199089, -0.1795367, 0, 1, 0.227451, 1,
-0.382502, -0.2806548, -2.973047, 0, 1, 0.2313726, 1,
-0.3812181, -2.074747, -3.269528, 0, 1, 0.2392157, 1,
-0.3795221, 0.7134006, 0.6650484, 0, 1, 0.2431373, 1,
-0.3785822, -1.496788, -4.445588, 0, 1, 0.2509804, 1,
-0.3715204, -0.2761923, -1.626866, 0, 1, 0.254902, 1,
-0.3688257, -0.8210257, -2.719538, 0, 1, 0.2627451, 1,
-0.3652017, 0.148244, -1.134389, 0, 1, 0.2666667, 1,
-0.3565701, -1.522986, -4.116427, 0, 1, 0.2745098, 1,
-0.3515308, 1.245671, 0.1214729, 0, 1, 0.2784314, 1,
-0.3515095, -0.9745334, -3.089633, 0, 1, 0.2862745, 1,
-0.3505895, -0.421435, -3.215634, 0, 1, 0.2901961, 1,
-0.3463829, -0.1233633, -3.129436, 0, 1, 0.2980392, 1,
-0.3440319, 1.502006, -1.327166, 0, 1, 0.3058824, 1,
-0.3402168, -1.344274, -4.099306, 0, 1, 0.3098039, 1,
-0.3359701, 0.3765047, -0.8109619, 0, 1, 0.3176471, 1,
-0.3352854, 1.34942, -0.1582527, 0, 1, 0.3215686, 1,
-0.3335077, 0.3071588, 0.9536401, 0, 1, 0.3294118, 1,
-0.3310814, -0.09877655, -2.453521, 0, 1, 0.3333333, 1,
-0.3308516, -0.2696161, -2.707012, 0, 1, 0.3411765, 1,
-0.3247993, -0.1718044, -2.037743, 0, 1, 0.345098, 1,
-0.3210912, -0.4640201, -2.180456, 0, 1, 0.3529412, 1,
-0.3204621, -0.3481505, -2.809561, 0, 1, 0.3568628, 1,
-0.317577, -0.820628, -4.619838, 0, 1, 0.3647059, 1,
-0.3168867, 1.646395, 0.802458, 0, 1, 0.3686275, 1,
-0.3104518, 1.791097, -0.2710067, 0, 1, 0.3764706, 1,
-0.310284, -1.760728, -3.416386, 0, 1, 0.3803922, 1,
-0.3085084, 1.48337, -0.738636, 0, 1, 0.3882353, 1,
-0.2988065, -0.7299351, -2.679734, 0, 1, 0.3921569, 1,
-0.298791, 0.5497318, -0.387642, 0, 1, 0.4, 1,
-0.2955844, 1.645272, -0.8951746, 0, 1, 0.4078431, 1,
-0.2892214, -0.216553, -3.655569, 0, 1, 0.4117647, 1,
-0.2889936, -0.5772139, -1.406533, 0, 1, 0.4196078, 1,
-0.2845451, 1.358234, 0.9211649, 0, 1, 0.4235294, 1,
-0.2841998, 1.308352, -0.1044158, 0, 1, 0.4313726, 1,
-0.2770573, -0.8069051, -3.287314, 0, 1, 0.4352941, 1,
-0.2694239, -0.4570791, -1.83567, 0, 1, 0.4431373, 1,
-0.2647566, 0.1746516, -0.4085188, 0, 1, 0.4470588, 1,
-0.2606128, -0.5229299, -2.524095, 0, 1, 0.454902, 1,
-0.2587385, 0.02491816, -0.7708336, 0, 1, 0.4588235, 1,
-0.2571539, 0.568593, 0.3893684, 0, 1, 0.4666667, 1,
-0.2480937, -0.1484159, -2.192838, 0, 1, 0.4705882, 1,
-0.2293068, -1.029425, -3.702293, 0, 1, 0.4784314, 1,
-0.2258991, -0.9838505, -5.167563, 0, 1, 0.4823529, 1,
-0.2221663, 0.1445484, -1.637532, 0, 1, 0.4901961, 1,
-0.2210007, 0.1751484, -1.728989, 0, 1, 0.4941176, 1,
-0.2204254, -0.8191211, -3.532416, 0, 1, 0.5019608, 1,
-0.2113705, -0.225384, -3.883492, 0, 1, 0.509804, 1,
-0.2111134, -0.2032401, -2.646393, 0, 1, 0.5137255, 1,
-0.2089812, 1.708922, 1.874004, 0, 1, 0.5215687, 1,
-0.2069372, 1.874788, 0.1867222, 0, 1, 0.5254902, 1,
-0.2043136, 1.20529, -0.7627878, 0, 1, 0.5333334, 1,
-0.2038917, 0.7219341, -0.1793473, 0, 1, 0.5372549, 1,
-0.2028261, 0.8725563, -1.773591, 0, 1, 0.5450981, 1,
-0.1947803, -1.067664, -3.389623, 0, 1, 0.5490196, 1,
-0.1945562, -1.328615, -4.000674, 0, 1, 0.5568628, 1,
-0.1903878, 1.210381, -0.5405541, 0, 1, 0.5607843, 1,
-0.188684, -1.177787, -1.697365, 0, 1, 0.5686275, 1,
-0.1886823, 0.4964843, -0.5455574, 0, 1, 0.572549, 1,
-0.185277, -1.257917, -1.366377, 0, 1, 0.5803922, 1,
-0.183624, -0.6201875, -4.001109, 0, 1, 0.5843138, 1,
-0.1827944, 1.919771, -0.4647321, 0, 1, 0.5921569, 1,
-0.1713554, -0.3091687, -1.450413, 0, 1, 0.5960785, 1,
-0.1697704, -1.260031, -4.386406, 0, 1, 0.6039216, 1,
-0.1680042, 1.140593, -0.7698796, 0, 1, 0.6117647, 1,
-0.1676718, -0.1502609, -2.491251, 0, 1, 0.6156863, 1,
-0.1662114, -0.01669245, -1.76956, 0, 1, 0.6235294, 1,
-0.165292, -2.472113, -2.627157, 0, 1, 0.627451, 1,
-0.1623008, 1.031095, -1.267039, 0, 1, 0.6352941, 1,
-0.160759, 2.303933, 1.619754, 0, 1, 0.6392157, 1,
-0.1559266, 0.5421779, 0.2676579, 0, 1, 0.6470588, 1,
-0.155486, 1.105287, -0.8600655, 0, 1, 0.6509804, 1,
-0.1520676, 0.4257561, -0.9490633, 0, 1, 0.6588235, 1,
-0.1482934, -0.5030914, -3.842378, 0, 1, 0.6627451, 1,
-0.1469483, 0.1208302, -3.798407, 0, 1, 0.6705883, 1,
-0.1466843, 0.1003427, -2.80105, 0, 1, 0.6745098, 1,
-0.1394992, -0.170874, -3.606978, 0, 1, 0.682353, 1,
-0.1351385, 1.434236, -1.32044, 0, 1, 0.6862745, 1,
-0.1347051, -0.6380323, -1.159395, 0, 1, 0.6941177, 1,
-0.1334893, 0.3424901, -0.8161606, 0, 1, 0.7019608, 1,
-0.1304781, -0.9080892, -4.152777, 0, 1, 0.7058824, 1,
-0.1267595, -1.73665, -2.874307, 0, 1, 0.7137255, 1,
-0.1261375, -1.027001, -0.4180088, 0, 1, 0.7176471, 1,
-0.1250441, 0.1595227, -0.8171547, 0, 1, 0.7254902, 1,
-0.1217729, -0.689024, -2.437525, 0, 1, 0.7294118, 1,
-0.1194117, -0.3534245, -1.907253, 0, 1, 0.7372549, 1,
-0.1174374, -0.3214433, -2.3803, 0, 1, 0.7411765, 1,
-0.1172381, 0.8537518, -0.1649705, 0, 1, 0.7490196, 1,
-0.1154978, -1.118546, -3.883292, 0, 1, 0.7529412, 1,
-0.1118605, 1.237361, -0.3742796, 0, 1, 0.7607843, 1,
-0.1116707, -2.047455, -3.091737, 0, 1, 0.7647059, 1,
-0.109603, 0.4331971, 1.501471, 0, 1, 0.772549, 1,
-0.1023668, -0.04018089, -3.340167, 0, 1, 0.7764706, 1,
-0.09883372, -0.3370946, -1.778375, 0, 1, 0.7843137, 1,
-0.09722248, -0.5850226, -2.219762, 0, 1, 0.7882353, 1,
-0.09608105, 1.166827, -0.2394616, 0, 1, 0.7960784, 1,
-0.094559, -0.8996887, -3.25288, 0, 1, 0.8039216, 1,
-0.09225216, -0.3349879, -3.379474, 0, 1, 0.8078431, 1,
-0.08705685, -2.140304, -2.970103, 0, 1, 0.8156863, 1,
-0.0855757, 0.7171364, -0.6633173, 0, 1, 0.8196079, 1,
-0.08421334, -0.1367211, -2.814887, 0, 1, 0.827451, 1,
-0.0834154, 0.05688334, 0.4961794, 0, 1, 0.8313726, 1,
-0.08316381, 3.401273, 0.7474779, 0, 1, 0.8392157, 1,
-0.07907556, 1.080787, -0.1653546, 0, 1, 0.8431373, 1,
-0.07650527, -0.7252344, -2.410305, 0, 1, 0.8509804, 1,
-0.07598711, -0.4998966, -2.43482, 0, 1, 0.854902, 1,
-0.0757023, -0.1762792, -1.731924, 0, 1, 0.8627451, 1,
-0.07199469, 2.084258, -0.3106013, 0, 1, 0.8666667, 1,
-0.07065585, -0.6171222, -3.371617, 0, 1, 0.8745098, 1,
-0.06903988, 0.2033258, -0.06964588, 0, 1, 0.8784314, 1,
-0.06719781, -0.1432026, -4.314515, 0, 1, 0.8862745, 1,
-0.06586365, -0.7225055, -3.075748, 0, 1, 0.8901961, 1,
-0.05874876, 1.167093, 0.3700227, 0, 1, 0.8980392, 1,
-0.05536329, -0.2122308, -2.720709, 0, 1, 0.9058824, 1,
-0.04928088, 0.5753986, -1.426824, 0, 1, 0.9098039, 1,
-0.04818605, -0.09220437, -2.542497, 0, 1, 0.9176471, 1,
-0.04759829, 0.01668743, -1.350024, 0, 1, 0.9215686, 1,
-0.04538168, -0.6433581, -2.431046, 0, 1, 0.9294118, 1,
-0.04520465, 0.3869184, -0.7844468, 0, 1, 0.9333333, 1,
-0.0449059, 1.953761, -0.7805253, 0, 1, 0.9411765, 1,
-0.04366072, -1.099535, -3.178752, 0, 1, 0.945098, 1,
-0.0427784, 0.1171266, 0.1434398, 0, 1, 0.9529412, 1,
-0.04228079, -1.423585, -3.705118, 0, 1, 0.9568627, 1,
-0.04096081, -1.131776, -3.161029, 0, 1, 0.9647059, 1,
-0.03843373, -0.207996, -4.046665, 0, 1, 0.9686275, 1,
-0.0369386, -0.4835031, -2.971139, 0, 1, 0.9764706, 1,
-0.03121077, -0.2200115, -4.107567, 0, 1, 0.9803922, 1,
-0.02910355, -0.05007265, -3.795544, 0, 1, 0.9882353, 1,
-0.02387688, -0.9970533, -2.420309, 0, 1, 0.9921569, 1,
-0.01915331, 0.3294211, 1.127243, 0, 1, 1, 1,
-0.01324521, -0.7162659, -4.963775, 0, 0.9921569, 1, 1,
-0.008556255, 0.1153278, -0.1485642, 0, 0.9882353, 1, 1,
-0.007249023, 0.8075465, -0.8163049, 0, 0.9803922, 1, 1,
-0.005053522, -0.879945, -3.691377, 0, 0.9764706, 1, 1,
-0.001606497, -0.1351406, -3.577636, 0, 0.9686275, 1, 1,
0.001793913, -0.3946791, 0.7369935, 0, 0.9647059, 1, 1,
0.003012275, 0.196163, 0.082635, 0, 0.9568627, 1, 1,
0.006349505, -0.4861147, 3.776818, 0, 0.9529412, 1, 1,
0.00658311, 0.5553428, -1.065275, 0, 0.945098, 1, 1,
0.009566744, -2.301887, 1.943079, 0, 0.9411765, 1, 1,
0.01038779, -0.4553085, 2.203249, 0, 0.9333333, 1, 1,
0.01267616, 0.5345715, 0.0342927, 0, 0.9294118, 1, 1,
0.01269955, -0.8705609, 3.772725, 0, 0.9215686, 1, 1,
0.01689878, 1.537141, 0.527629, 0, 0.9176471, 1, 1,
0.02193252, -0.9733285, 2.796599, 0, 0.9098039, 1, 1,
0.02630521, 0.7891605, 0.2101775, 0, 0.9058824, 1, 1,
0.02831948, -0.4766871, 2.544264, 0, 0.8980392, 1, 1,
0.02909098, -1.170771, 4.89322, 0, 0.8901961, 1, 1,
0.02980603, -0.1574867, 2.89616, 0, 0.8862745, 1, 1,
0.0300741, -0.1201427, 2.710611, 0, 0.8784314, 1, 1,
0.03687811, 0.2971751, 0.4519432, 0, 0.8745098, 1, 1,
0.03808459, 1.585568, -0.6807146, 0, 0.8666667, 1, 1,
0.04017974, -0.9134488, 1.57712, 0, 0.8627451, 1, 1,
0.04159898, 0.5692915, 0.2697827, 0, 0.854902, 1, 1,
0.04408981, 0.3270066, 0.8055812, 0, 0.8509804, 1, 1,
0.04638816, -0.8630807, 4.224138, 0, 0.8431373, 1, 1,
0.04690664, -0.09694985, 2.500461, 0, 0.8392157, 1, 1,
0.0496309, 0.398627, -0.3949682, 0, 0.8313726, 1, 1,
0.0530533, 2.812025, -1.470726, 0, 0.827451, 1, 1,
0.06095027, -0.9929038, 3.328547, 0, 0.8196079, 1, 1,
0.06171673, -0.8705176, 1.787175, 0, 0.8156863, 1, 1,
0.06264633, -0.8065857, 3.922457, 0, 0.8078431, 1, 1,
0.06497562, 0.02236984, 1.278611, 0, 0.8039216, 1, 1,
0.06926107, -0.5229804, 3.688506, 0, 0.7960784, 1, 1,
0.07149981, 0.5377488, -0.7355159, 0, 0.7882353, 1, 1,
0.07290526, 0.03033547, 1.217268, 0, 0.7843137, 1, 1,
0.07342432, 1.523268, -0.5682034, 0, 0.7764706, 1, 1,
0.07698353, 0.5311524, -0.5416564, 0, 0.772549, 1, 1,
0.08188302, 1.696312, 1.833504, 0, 0.7647059, 1, 1,
0.08199061, -0.0836173, 2.703072, 0, 0.7607843, 1, 1,
0.08286819, -0.3668528, 4.721837, 0, 0.7529412, 1, 1,
0.08477643, -0.07925501, 2.599577, 0, 0.7490196, 1, 1,
0.08644966, 0.4124992, 0.4014958, 0, 0.7411765, 1, 1,
0.09034077, -1.387272, 2.982977, 0, 0.7372549, 1, 1,
0.09140626, 0.407425, 1.958485, 0, 0.7294118, 1, 1,
0.09231721, -0.2109743, 2.454215, 0, 0.7254902, 1, 1,
0.0928533, -1.59418, 3.1456, 0, 0.7176471, 1, 1,
0.0952924, 0.9898477, 0.08589309, 0, 0.7137255, 1, 1,
0.09626222, 0.2406628, 1.007899, 0, 0.7058824, 1, 1,
0.1027587, -0.7757894, 3.272167, 0, 0.6980392, 1, 1,
0.1032059, 1.439995, -0.5522851, 0, 0.6941177, 1, 1,
0.1127912, 0.3687494, 0.2172688, 0, 0.6862745, 1, 1,
0.1132964, -1.036227, 3.610492, 0, 0.682353, 1, 1,
0.1144648, 0.4514913, -0.7307085, 0, 0.6745098, 1, 1,
0.1156387, -0.2991383, 2.797692, 0, 0.6705883, 1, 1,
0.11875, 0.6719955, 1.454671, 0, 0.6627451, 1, 1,
0.1300102, -1.975175, 5.597932, 0, 0.6588235, 1, 1,
0.1342764, 0.6657761, -1.13089, 0, 0.6509804, 1, 1,
0.1392125, -1.735688, 2.256603, 0, 0.6470588, 1, 1,
0.1450604, 0.970575, -0.3010105, 0, 0.6392157, 1, 1,
0.1492227, -2.194455, 3.335489, 0, 0.6352941, 1, 1,
0.1494532, -0.7444854, 4.883068, 0, 0.627451, 1, 1,
0.1556509, 0.02218981, 3.572229, 0, 0.6235294, 1, 1,
0.157917, -0.2151715, 3.237192, 0, 0.6156863, 1, 1,
0.1586349, 1.390011, -0.8507284, 0, 0.6117647, 1, 1,
0.1586433, 0.7496036, 0.7592698, 0, 0.6039216, 1, 1,
0.1672026, -0.352129, 2.440886, 0, 0.5960785, 1, 1,
0.1686315, -0.4597272, 1.992038, 0, 0.5921569, 1, 1,
0.1693504, -0.1140383, 1.619021, 0, 0.5843138, 1, 1,
0.1713838, -0.07497302, 1.890209, 0, 0.5803922, 1, 1,
0.1730174, -0.5197405, 1.951378, 0, 0.572549, 1, 1,
0.1772652, -1.510839, 3.753425, 0, 0.5686275, 1, 1,
0.1795169, 0.0884648, 1.400407, 0, 0.5607843, 1, 1,
0.1807121, 1.598005, 0.2894374, 0, 0.5568628, 1, 1,
0.1840298, 1.027419, 0.003918853, 0, 0.5490196, 1, 1,
0.1841073, 0.9507769, 1.209842, 0, 0.5450981, 1, 1,
0.1850019, -0.2130656, 2.88343, 0, 0.5372549, 1, 1,
0.1961568, 0.668322, 1.117709, 0, 0.5333334, 1, 1,
0.1976511, -1.490127, 2.367071, 0, 0.5254902, 1, 1,
0.2012836, -0.8399133, 3.721301, 0, 0.5215687, 1, 1,
0.2029598, -0.0160399, 1.633638, 0, 0.5137255, 1, 1,
0.2069942, -1.562886, 4.035915, 0, 0.509804, 1, 1,
0.2078925, -0.2817712, 3.017108, 0, 0.5019608, 1, 1,
0.2079256, 0.812983, 0.2377743, 0, 0.4941176, 1, 1,
0.2083263, 0.8185639, -0.7230932, 0, 0.4901961, 1, 1,
0.2115732, 0.1869777, 0.9811981, 0, 0.4823529, 1, 1,
0.2130955, -0.5428854, 3.066411, 0, 0.4784314, 1, 1,
0.2136569, 2.396492, -1.14208, 0, 0.4705882, 1, 1,
0.2151227, 0.1248127, 0.7373967, 0, 0.4666667, 1, 1,
0.2222353, 0.4207712, 0.7881746, 0, 0.4588235, 1, 1,
0.2266967, -0.5928816, 2.256083, 0, 0.454902, 1, 1,
0.2338884, -0.7402019, 2.457169, 0, 0.4470588, 1, 1,
0.2368352, -2.034663, 3.724293, 0, 0.4431373, 1, 1,
0.2379041, -0.01199886, 3.706624, 0, 0.4352941, 1, 1,
0.2436143, 0.9266255, 1.567332, 0, 0.4313726, 1, 1,
0.2445533, -1.003224, 2.904087, 0, 0.4235294, 1, 1,
0.253189, 0.7267631, -2.043385, 0, 0.4196078, 1, 1,
0.2532676, -0.202128, 1.808835, 0, 0.4117647, 1, 1,
0.2550091, -0.9420586, 5.664792, 0, 0.4078431, 1, 1,
0.2579669, 0.1863326, -0.9699258, 0, 0.4, 1, 1,
0.2581067, -1.370852, 1.759492, 0, 0.3921569, 1, 1,
0.2640286, -2.029049, 1.834946, 0, 0.3882353, 1, 1,
0.2654398, 1.037485, 0.4390172, 0, 0.3803922, 1, 1,
0.2666192, 0.5895419, 0.4096361, 0, 0.3764706, 1, 1,
0.2683846, 1.332591, 0.4834208, 0, 0.3686275, 1, 1,
0.2692773, -0.1857955, 2.534706, 0, 0.3647059, 1, 1,
0.2694461, 0.5307335, 1.524527, 0, 0.3568628, 1, 1,
0.2717829, 0.3341452, 1.344459, 0, 0.3529412, 1, 1,
0.2722271, -1.105479, 5.103062, 0, 0.345098, 1, 1,
0.2755798, -0.3366221, 1.806474, 0, 0.3411765, 1, 1,
0.2771515, 0.7305817, -0.5282789, 0, 0.3333333, 1, 1,
0.2839621, -0.3210858, 2.964913, 0, 0.3294118, 1, 1,
0.2846889, 0.441217, 1.55199, 0, 0.3215686, 1, 1,
0.2881199, -1.249136, 2.629315, 0, 0.3176471, 1, 1,
0.2887878, 0.1121148, 0.2727761, 0, 0.3098039, 1, 1,
0.2889116, 0.1092393, 2.984631, 0, 0.3058824, 1, 1,
0.2914166, -0.214257, 2.638685, 0, 0.2980392, 1, 1,
0.2915795, -0.5476105, 2.40043, 0, 0.2901961, 1, 1,
0.2917336, -0.2526706, 3.682578, 0, 0.2862745, 1, 1,
0.2944318, 1.051756, 0.1043347, 0, 0.2784314, 1, 1,
0.2944855, 1.281007, 1.878072, 0, 0.2745098, 1, 1,
0.2950372, 0.4771225, 1.086194, 0, 0.2666667, 1, 1,
0.2979885, 0.2980835, 0.5074624, 0, 0.2627451, 1, 1,
0.3020765, -1.612047, 3.482507, 0, 0.254902, 1, 1,
0.3025515, 0.08384101, 0.6728731, 0, 0.2509804, 1, 1,
0.3034338, -0.2136156, 4.278274, 0, 0.2431373, 1, 1,
0.3056163, -0.03300536, 0.9134494, 0, 0.2392157, 1, 1,
0.3093492, -1.067126, 2.993652, 0, 0.2313726, 1, 1,
0.3097953, 0.5292999, 2.102431, 0, 0.227451, 1, 1,
0.3106022, 0.6470671, 1.733367, 0, 0.2196078, 1, 1,
0.3113242, -1.256576, 1.976027, 0, 0.2156863, 1, 1,
0.316657, 0.4005834, 0.4492205, 0, 0.2078431, 1, 1,
0.3292892, 0.04717929, 0.7652981, 0, 0.2039216, 1, 1,
0.330217, -0.2578896, 1.411628, 0, 0.1960784, 1, 1,
0.3331541, 0.592379, 0.05606978, 0, 0.1882353, 1, 1,
0.333313, -2.397094, 3.657527, 0, 0.1843137, 1, 1,
0.3408618, 0.4185441, 1.113614, 0, 0.1764706, 1, 1,
0.3419911, -0.837944, 3.94416, 0, 0.172549, 1, 1,
0.3467451, -1.016494, 3.016633, 0, 0.1647059, 1, 1,
0.3475872, -1.731829, 3.352116, 0, 0.1607843, 1, 1,
0.3586689, 0.5750421, 1.671304, 0, 0.1529412, 1, 1,
0.3601483, -1.906379, 3.846547, 0, 0.1490196, 1, 1,
0.3618881, 0.5087816, 1.557777, 0, 0.1411765, 1, 1,
0.3623248, -0.57044, 2.587437, 0, 0.1372549, 1, 1,
0.3655661, -0.1451456, 2.814626, 0, 0.1294118, 1, 1,
0.3673419, 0.1859575, 1.854537, 0, 0.1254902, 1, 1,
0.3679609, 0.2148848, -0.5168841, 0, 0.1176471, 1, 1,
0.3709951, -0.3055504, 3.847546, 0, 0.1137255, 1, 1,
0.3740303, -0.2743201, 2.705477, 0, 0.1058824, 1, 1,
0.3810245, 0.2896614, 0.8072156, 0, 0.09803922, 1, 1,
0.3901245, 0.9890786, 0.9488389, 0, 0.09411765, 1, 1,
0.3919802, -0.6484558, 4.143003, 0, 0.08627451, 1, 1,
0.3933711, 0.5876399, 0.6297216, 0, 0.08235294, 1, 1,
0.3945583, 0.5988107, -0.1367672, 0, 0.07450981, 1, 1,
0.4003151, -0.1998109, 3.100349, 0, 0.07058824, 1, 1,
0.4013803, 2.084457, 0.7520816, 0, 0.0627451, 1, 1,
0.4049521, 0.1284267, 1.417838, 0, 0.05882353, 1, 1,
0.4097212, 0.3063495, 0.8787412, 0, 0.05098039, 1, 1,
0.4105913, 0.4979313, 2.197496, 0, 0.04705882, 1, 1,
0.410679, 1.403822, -0.9424732, 0, 0.03921569, 1, 1,
0.4226368, 0.6966258, 0.6048017, 0, 0.03529412, 1, 1,
0.4228178, -0.7135541, 3.735194, 0, 0.02745098, 1, 1,
0.4332674, 1.527448, 0.9020011, 0, 0.02352941, 1, 1,
0.4335352, -0.01855684, -0.8291439, 0, 0.01568628, 1, 1,
0.4359432, -1.010101, 2.317001, 0, 0.01176471, 1, 1,
0.436184, 0.04488083, 1.976603, 0, 0.003921569, 1, 1,
0.4389189, -0.2354597, 2.45629, 0.003921569, 0, 1, 1,
0.439819, 0.2931564, -0.7677901, 0.007843138, 0, 1, 1,
0.440356, 2.475497, -1.09217, 0.01568628, 0, 1, 1,
0.4445735, 0.2520202, -0.2169572, 0.01960784, 0, 1, 1,
0.4499402, 0.1421974, 1.504597, 0.02745098, 0, 1, 1,
0.451197, 0.8775413, 0.2158685, 0.03137255, 0, 1, 1,
0.4521395, -2.981057, 3.180496, 0.03921569, 0, 1, 1,
0.4523391, 0.870437, 1.445939, 0.04313726, 0, 1, 1,
0.4543478, 0.1319551, -1.281629, 0.05098039, 0, 1, 1,
0.4545504, 0.9989048, 1.137472, 0.05490196, 0, 1, 1,
0.4593726, -1.042848, 3.912787, 0.0627451, 0, 1, 1,
0.4643034, 1.454717, -0.8581238, 0.06666667, 0, 1, 1,
0.4652734, -0.9555527, 2.548892, 0.07450981, 0, 1, 1,
0.4752189, 1.11844, 0.9857786, 0.07843138, 0, 1, 1,
0.4768263, -0.1596496, 1.09676, 0.08627451, 0, 1, 1,
0.4801568, -1.728613, 2.949534, 0.09019608, 0, 1, 1,
0.4815261, 0.4993358, 0.2444478, 0.09803922, 0, 1, 1,
0.4829333, -1.445566, 2.483057, 0.1058824, 0, 1, 1,
0.4832808, 1.38765, 1.334868, 0.1098039, 0, 1, 1,
0.486876, -0.7920971, 2.520188, 0.1176471, 0, 1, 1,
0.4870203, -1.961775, 2.01836, 0.1215686, 0, 1, 1,
0.4879302, -0.4837938, 2.392969, 0.1294118, 0, 1, 1,
0.4903974, -1.462046, 2.595357, 0.1333333, 0, 1, 1,
0.4908468, -0.6604052, 2.817803, 0.1411765, 0, 1, 1,
0.494828, 0.02449936, 1.868897, 0.145098, 0, 1, 1,
0.4982819, 2.056502, 0.4157754, 0.1529412, 0, 1, 1,
0.4986975, -0.04071243, 1.145984, 0.1568628, 0, 1, 1,
0.5041701, -0.8599691, 1.882445, 0.1647059, 0, 1, 1,
0.5045325, 0.1404054, 0.5874044, 0.1686275, 0, 1, 1,
0.5064867, -0.1623943, 0.6708904, 0.1764706, 0, 1, 1,
0.5116384, -0.5810496, 2.694288, 0.1803922, 0, 1, 1,
0.5132211, 0.8479128, -0.3240668, 0.1882353, 0, 1, 1,
0.5159978, 0.9783854, 0.1323662, 0.1921569, 0, 1, 1,
0.5334545, -0.1686513, 2.039788, 0.2, 0, 1, 1,
0.533864, -1.075559, 2.872457, 0.2078431, 0, 1, 1,
0.5346055, 0.3057139, 0.9551977, 0.2117647, 0, 1, 1,
0.536883, 0.1743995, 0.5129163, 0.2196078, 0, 1, 1,
0.5385838, -0.5976775, 2.112963, 0.2235294, 0, 1, 1,
0.5386887, -1.150524, 2.765805, 0.2313726, 0, 1, 1,
0.5397002, 0.1740687, 1.673091, 0.2352941, 0, 1, 1,
0.5423844, -0.3341536, 3.084238, 0.2431373, 0, 1, 1,
0.5433075, 1.834296, 0.8335787, 0.2470588, 0, 1, 1,
0.5476049, -0.5572978, 3.955508, 0.254902, 0, 1, 1,
0.552784, 0.966943, 1.055918, 0.2588235, 0, 1, 1,
0.5621765, 0.1609926, 0.1805571, 0.2666667, 0, 1, 1,
0.564561, -0.3232464, 1.686698, 0.2705882, 0, 1, 1,
0.5678763, 0.1578936, 1.315876, 0.2784314, 0, 1, 1,
0.5721112, -0.6676486, -0.1862884, 0.282353, 0, 1, 1,
0.5770163, -0.4172025, 3.491324, 0.2901961, 0, 1, 1,
0.5777634, 0.252258, 1.417243, 0.2941177, 0, 1, 1,
0.5828817, 0.4998014, -0.8838454, 0.3019608, 0, 1, 1,
0.5829814, 0.02670365, 1.628994, 0.3098039, 0, 1, 1,
0.5863987, 0.2242001, 1.364696, 0.3137255, 0, 1, 1,
0.5922686, 0.4659377, -1.056226, 0.3215686, 0, 1, 1,
0.5940048, -1.595699, 2.590759, 0.3254902, 0, 1, 1,
0.594187, -0.5372667, 1.898874, 0.3333333, 0, 1, 1,
0.5992704, 0.1178865, 2.233892, 0.3372549, 0, 1, 1,
0.6019486, 1.24895, 1.347228, 0.345098, 0, 1, 1,
0.6038943, 1.072295, 1.030509, 0.3490196, 0, 1, 1,
0.6047583, 1.242441, 0.3942408, 0.3568628, 0, 1, 1,
0.6065435, 1.692569, 0.3208915, 0.3607843, 0, 1, 1,
0.6165474, -1.095792, 3.738051, 0.3686275, 0, 1, 1,
0.6219399, -0.8308138, 4.261434, 0.372549, 0, 1, 1,
0.62481, 1.633446, -0.2060191, 0.3803922, 0, 1, 1,
0.6266566, -1.938486, 3.957856, 0.3843137, 0, 1, 1,
0.627421, -0.1063201, 1.396571, 0.3921569, 0, 1, 1,
0.6281259, 0.2543807, 1.115919, 0.3960784, 0, 1, 1,
0.6293138, -1.846238, 0.6014001, 0.4039216, 0, 1, 1,
0.6302909, 1.107309, 0.110952, 0.4117647, 0, 1, 1,
0.6311997, 0.6575719, 1.264036, 0.4156863, 0, 1, 1,
0.6387022, 0.6046695, 1.43275, 0.4235294, 0, 1, 1,
0.6387188, 0.7116246, 1.134935, 0.427451, 0, 1, 1,
0.6418466, -0.4737921, 0.7903991, 0.4352941, 0, 1, 1,
0.6459659, 0.1199114, 2.348525, 0.4392157, 0, 1, 1,
0.6505954, 0.03039335, 1.097895, 0.4470588, 0, 1, 1,
0.651248, 0.1645753, 0.6119662, 0.4509804, 0, 1, 1,
0.654656, -0.2543416, 1.049476, 0.4588235, 0, 1, 1,
0.655372, 0.9427863, 2.213992, 0.4627451, 0, 1, 1,
0.6558871, 0.1179577, -0.03376029, 0.4705882, 0, 1, 1,
0.656155, 1.878848, 0.6096384, 0.4745098, 0, 1, 1,
0.6601856, -0.1718985, 3.115841, 0.4823529, 0, 1, 1,
0.6630975, -1.381403, 2.783171, 0.4862745, 0, 1, 1,
0.6639394, -0.821891, 1.341944, 0.4941176, 0, 1, 1,
0.6643608, -0.4191086, 1.870992, 0.5019608, 0, 1, 1,
0.66442, 1.246956, -1.333721, 0.5058824, 0, 1, 1,
0.6654266, 0.7999453, 2.853422, 0.5137255, 0, 1, 1,
0.6655277, 0.9470866, 0.2095586, 0.5176471, 0, 1, 1,
0.66982, -0.004344516, 2.285367, 0.5254902, 0, 1, 1,
0.6713828, 0.2650688, -0.1502437, 0.5294118, 0, 1, 1,
0.684868, 0.5448854, 0.02551051, 0.5372549, 0, 1, 1,
0.6975734, -0.3507748, 2.089986, 0.5411765, 0, 1, 1,
0.6987708, -1.164279, 3.889361, 0.5490196, 0, 1, 1,
0.7010857, -1.186166, 3.181594, 0.5529412, 0, 1, 1,
0.7011447, -0.229122, 3.076851, 0.5607843, 0, 1, 1,
0.7040723, 0.714999, 0.516913, 0.5647059, 0, 1, 1,
0.704328, 0.9173054, 1.354515, 0.572549, 0, 1, 1,
0.7047712, 1.642434, 1.575756, 0.5764706, 0, 1, 1,
0.7069773, 0.514916, -0.3635553, 0.5843138, 0, 1, 1,
0.7279856, -0.6136352, 1.466577, 0.5882353, 0, 1, 1,
0.7308703, -0.2891231, 3.026204, 0.5960785, 0, 1, 1,
0.7310061, 0.1114175, 0.498849, 0.6039216, 0, 1, 1,
0.7350249, -0.7584553, 3.504452, 0.6078432, 0, 1, 1,
0.7471835, -1.749627, 3.734864, 0.6156863, 0, 1, 1,
0.7480694, 0.2140775, 1.418481, 0.6196079, 0, 1, 1,
0.7503445, 0.4284858, 2.063293, 0.627451, 0, 1, 1,
0.7548941, 0.4188246, 1.960873, 0.6313726, 0, 1, 1,
0.758195, -1.190218, 2.804873, 0.6392157, 0, 1, 1,
0.7582998, 0.4742777, 0.9605708, 0.6431373, 0, 1, 1,
0.758991, -0.3174052, 1.900457, 0.6509804, 0, 1, 1,
0.7614936, 0.2589771, 1.620495, 0.654902, 0, 1, 1,
0.7646743, -0.4962517, 1.287531, 0.6627451, 0, 1, 1,
0.7654913, -0.2188295, 1.914266, 0.6666667, 0, 1, 1,
0.7737413, 0.259387, 2.157565, 0.6745098, 0, 1, 1,
0.7754229, 0.07528765, 0.3041433, 0.6784314, 0, 1, 1,
0.7793571, 0.9247062, -0.5224431, 0.6862745, 0, 1, 1,
0.7822037, -0.6666158, 2.105247, 0.6901961, 0, 1, 1,
0.7823016, -0.1255077, 1.280919, 0.6980392, 0, 1, 1,
0.7833272, 0.203587, 2.773996, 0.7058824, 0, 1, 1,
0.786042, -0.5860252, 2.507611, 0.7098039, 0, 1, 1,
0.7887058, -0.4740037, 2.141031, 0.7176471, 0, 1, 1,
0.7955305, 0.4638117, -0.02496632, 0.7215686, 0, 1, 1,
0.7967117, -0.3374379, 1.790852, 0.7294118, 0, 1, 1,
0.7995007, 2.146167, 1.740814, 0.7333333, 0, 1, 1,
0.8032582, 1.361019, -1.410778, 0.7411765, 0, 1, 1,
0.8061972, 1.202189, -0.1099206, 0.7450981, 0, 1, 1,
0.8065516, -0.7714893, 2.316664, 0.7529412, 0, 1, 1,
0.8084903, 0.6324068, -0.6833379, 0.7568628, 0, 1, 1,
0.8122919, -1.921693, 3.167513, 0.7647059, 0, 1, 1,
0.8137265, -0.1103635, 1.997489, 0.7686275, 0, 1, 1,
0.8203834, 0.8506508, 0.8206552, 0.7764706, 0, 1, 1,
0.8233039, 0.4657606, 2.550092, 0.7803922, 0, 1, 1,
0.8334749, 2.045959, -0.7697324, 0.7882353, 0, 1, 1,
0.8338136, 0.8478159, 1.680382, 0.7921569, 0, 1, 1,
0.8344814, -0.5304952, 2.401692, 0.8, 0, 1, 1,
0.8397255, -0.8689196, 1.554523, 0.8078431, 0, 1, 1,
0.8458072, -0.6949354, 2.844968, 0.8117647, 0, 1, 1,
0.8496453, -0.5048402, 2.212808, 0.8196079, 0, 1, 1,
0.8500986, 0.5252477, 0.8668773, 0.8235294, 0, 1, 1,
0.8516222, -0.9482344, 4.505164, 0.8313726, 0, 1, 1,
0.8520604, -0.5716488, 2.050714, 0.8352941, 0, 1, 1,
0.8526817, 1.215474, 0.7435788, 0.8431373, 0, 1, 1,
0.8537769, -1.693622, 3.659669, 0.8470588, 0, 1, 1,
0.8583856, 0.7727268, 1.619536, 0.854902, 0, 1, 1,
0.8631902, 0.2789326, 3.470436, 0.8588235, 0, 1, 1,
0.8695241, -0.05246919, 1.532514, 0.8666667, 0, 1, 1,
0.8728886, -0.6657563, 1.683423, 0.8705882, 0, 1, 1,
0.8770636, 0.09042138, 0.3409725, 0.8784314, 0, 1, 1,
0.8771223, 0.9431461, 0.9096054, 0.8823529, 0, 1, 1,
0.8818941, 0.42924, 0.5413656, 0.8901961, 0, 1, 1,
0.884684, -0.5238435, 1.767471, 0.8941177, 0, 1, 1,
0.8872385, 1.170824, 0.4310226, 0.9019608, 0, 1, 1,
0.8873089, -0.997961, 3.103457, 0.9098039, 0, 1, 1,
0.8946901, 1.150511, -0.1296576, 0.9137255, 0, 1, 1,
0.896326, -0.9994083, 1.074744, 0.9215686, 0, 1, 1,
0.898838, -1.578295, 3.610427, 0.9254902, 0, 1, 1,
0.8988481, -0.4179038, 1.620358, 0.9333333, 0, 1, 1,
0.9015425, 1.474183, 0.870944, 0.9372549, 0, 1, 1,
0.9027487, -0.8108428, 2.880219, 0.945098, 0, 1, 1,
0.9099932, 0.4909292, 1.706168, 0.9490196, 0, 1, 1,
0.9109862, 0.2574828, 2.421319, 0.9568627, 0, 1, 1,
0.912539, -0.7337013, 2.570631, 0.9607843, 0, 1, 1,
0.9147608, -0.2305517, 1.242184, 0.9686275, 0, 1, 1,
0.9271822, -0.1137286, 1.56211, 0.972549, 0, 1, 1,
0.9319708, -0.7432935, 1.361688, 0.9803922, 0, 1, 1,
0.9377328, -1.254319, 3.2969, 0.9843137, 0, 1, 1,
0.9384002, -0.03626033, 2.15561, 0.9921569, 0, 1, 1,
0.9405951, -1.007906, 2.173915, 0.9960784, 0, 1, 1,
0.941578, -0.1173892, 1.895143, 1, 0, 0.9960784, 1,
0.9424547, -0.4182781, 3.406659, 1, 0, 0.9882353, 1,
0.9473279, 0.04392478, -0.01237707, 1, 0, 0.9843137, 1,
0.9493424, 0.9615449, 0.7223694, 1, 0, 0.9764706, 1,
0.955726, 0.821714, 1.588229, 1, 0, 0.972549, 1,
0.9564378, 0.6176147, -0.1419412, 1, 0, 0.9647059, 1,
0.9595402, 2.054993, -0.07425056, 1, 0, 0.9607843, 1,
0.9646383, -0.8290533, 3.425101, 1, 0, 0.9529412, 1,
0.970449, 1.119007, 0.4429636, 1, 0, 0.9490196, 1,
0.9716237, 1.316809, 1.210504, 1, 0, 0.9411765, 1,
0.9809846, 1.230226, -0.4964713, 1, 0, 0.9372549, 1,
0.9914104, -1.620619, 2.156113, 1, 0, 0.9294118, 1,
0.9936768, -0.5093669, 2.242331, 1, 0, 0.9254902, 1,
0.9949711, 1.108996, -0.29832, 1, 0, 0.9176471, 1,
1.020284, -2.037114, 2.514321, 1, 0, 0.9137255, 1,
1.023544, 0.7163361, 2.491378, 1, 0, 0.9058824, 1,
1.032654, 0.6204779, -0.07946302, 1, 0, 0.9019608, 1,
1.034295, -1.522124, 3.105671, 1, 0, 0.8941177, 1,
1.044054, 0.6743198, 2.45404, 1, 0, 0.8862745, 1,
1.046318, 1.623298, 0.1552309, 1, 0, 0.8823529, 1,
1.053192, 0.881991, -0.5285541, 1, 0, 0.8745098, 1,
1.054192, 0.4669048, 2.043147, 1, 0, 0.8705882, 1,
1.057075, 0.7805448, 1.463106, 1, 0, 0.8627451, 1,
1.062518, 1.126909, -1.079662, 1, 0, 0.8588235, 1,
1.064192, 0.7083718, 1.697775, 1, 0, 0.8509804, 1,
1.068628, 1.05649, -0.03110416, 1, 0, 0.8470588, 1,
1.070382, 0.4535646, 0.1329706, 1, 0, 0.8392157, 1,
1.070888, -0.8778641, 0.2296034, 1, 0, 0.8352941, 1,
1.074243, 1.606059, 1.816494, 1, 0, 0.827451, 1,
1.083685, 0.4563268, -2.206589, 1, 0, 0.8235294, 1,
1.086093, 0.7283275, 2.298007, 1, 0, 0.8156863, 1,
1.110849, -0.3167046, 1.082538, 1, 0, 0.8117647, 1,
1.127354, 0.8040123, 1.295498, 1, 0, 0.8039216, 1,
1.136295, 0.4997182, 2.083203, 1, 0, 0.7960784, 1,
1.138053, -0.2224419, 1.468047, 1, 0, 0.7921569, 1,
1.143168, -0.3280712, 1.026422, 1, 0, 0.7843137, 1,
1.143392, 0.1980796, 2.479023, 1, 0, 0.7803922, 1,
1.144297, 2.032898, 0.059949, 1, 0, 0.772549, 1,
1.147681, -0.433632, 1.199698, 1, 0, 0.7686275, 1,
1.149367, 0.2774764, 2.794772, 1, 0, 0.7607843, 1,
1.154686, 0.1748236, 1.46178, 1, 0, 0.7568628, 1,
1.159319, -0.03630992, 0.3374361, 1, 0, 0.7490196, 1,
1.165226, -0.2290728, 0.3451613, 1, 0, 0.7450981, 1,
1.167377, -0.6256588, 0.653543, 1, 0, 0.7372549, 1,
1.183049, -0.4029635, 4.106031, 1, 0, 0.7333333, 1,
1.193684, 0.5370014, 1.995188, 1, 0, 0.7254902, 1,
1.199428, 0.8760188, 1.421246, 1, 0, 0.7215686, 1,
1.202596, 0.2129456, 1.614502, 1, 0, 0.7137255, 1,
1.204571, 0.9185174, 0.8698063, 1, 0, 0.7098039, 1,
1.209228, 0.2757551, 1.247854, 1, 0, 0.7019608, 1,
1.2114, 1.021888, 0.3655472, 1, 0, 0.6941177, 1,
1.212019, 0.4350259, 1.73199, 1, 0, 0.6901961, 1,
1.212285, 0.5943518, 1.52182, 1, 0, 0.682353, 1,
1.21488, -0.5103326, 2.285657, 1, 0, 0.6784314, 1,
1.221911, 1.589627, 1.555625, 1, 0, 0.6705883, 1,
1.222694, -0.6186334, 2.663349, 1, 0, 0.6666667, 1,
1.225751, -0.4262974, -0.1168594, 1, 0, 0.6588235, 1,
1.237017, 0.5564538, 1.498401, 1, 0, 0.654902, 1,
1.237302, 0.6778485, 0.3704304, 1, 0, 0.6470588, 1,
1.237936, 0.8981292, 1.270046, 1, 0, 0.6431373, 1,
1.245626, 0.4982656, 1.80917, 1, 0, 0.6352941, 1,
1.256023, 0.4843265, 0.364262, 1, 0, 0.6313726, 1,
1.276539, 1.101542, 1.54733, 1, 0, 0.6235294, 1,
1.27919, 1.286899, -0.4605113, 1, 0, 0.6196079, 1,
1.280993, -0.4915611, 1.477369, 1, 0, 0.6117647, 1,
1.287461, 2.683686, -0.5792978, 1, 0, 0.6078432, 1,
1.290476, -1.242938, -0.3653961, 1, 0, 0.6, 1,
1.301338, -0.186984, 0.2726564, 1, 0, 0.5921569, 1,
1.302474, 0.04416347, 1.94172, 1, 0, 0.5882353, 1,
1.303872, -0.006161975, 1.732623, 1, 0, 0.5803922, 1,
1.307769, -1.723032, 1.513451, 1, 0, 0.5764706, 1,
1.308469, 0.9761633, -0.9514886, 1, 0, 0.5686275, 1,
1.309919, 0.3934042, 3.701133, 1, 0, 0.5647059, 1,
1.310413, 0.110137, 0.4640382, 1, 0, 0.5568628, 1,
1.313592, 1.48772, -0.3536282, 1, 0, 0.5529412, 1,
1.313767, -0.7429458, 3.059685, 1, 0, 0.5450981, 1,
1.323329, -0.10888, 2.842503, 1, 0, 0.5411765, 1,
1.32563, 0.06888841, 0.9825214, 1, 0, 0.5333334, 1,
1.328764, 0.4412666, 1.849102, 1, 0, 0.5294118, 1,
1.334944, 0.4706009, 2.26527, 1, 0, 0.5215687, 1,
1.341649, 1.501594, 1.275106, 1, 0, 0.5176471, 1,
1.348807, 1.049408, -0.09994259, 1, 0, 0.509804, 1,
1.351145, -2.678381, 3.169331, 1, 0, 0.5058824, 1,
1.361049, 0.01509155, 1.83742, 1, 0, 0.4980392, 1,
1.373875, -0.4081073, 1.444561, 1, 0, 0.4901961, 1,
1.385096, -1.284755, 4.286406, 1, 0, 0.4862745, 1,
1.39013, 0.9897194, 1.591496, 1, 0, 0.4784314, 1,
1.392505, 0.9968301, 1.620122, 1, 0, 0.4745098, 1,
1.398697, -0.7101828, 1.795549, 1, 0, 0.4666667, 1,
1.413296, -1.473057, 2.457921, 1, 0, 0.4627451, 1,
1.416345, 0.2681025, 1.027847, 1, 0, 0.454902, 1,
1.42139, -1.890101, 2.248759, 1, 0, 0.4509804, 1,
1.445109, -0.6063384, 1.796978, 1, 0, 0.4431373, 1,
1.446199, -1.289019, 2.560455, 1, 0, 0.4392157, 1,
1.449948, 0.3317295, 2.020151, 1, 0, 0.4313726, 1,
1.456557, 1.70236, 0.05303564, 1, 0, 0.427451, 1,
1.461637, 0.5602456, 1.153362, 1, 0, 0.4196078, 1,
1.468024, -0.4204237, 2.069494, 1, 0, 0.4156863, 1,
1.469499, 0.5155581, 0.4481341, 1, 0, 0.4078431, 1,
1.473633, 1.040132, 1.005063, 1, 0, 0.4039216, 1,
1.490925, -1.590414, 3.318572, 1, 0, 0.3960784, 1,
1.495246, -0.8329814, 2.987113, 1, 0, 0.3882353, 1,
1.497922, 0.2534383, 1.964084, 1, 0, 0.3843137, 1,
1.524827, -0.07426915, 2.571546, 1, 0, 0.3764706, 1,
1.532598, 0.7997801, 0.9923385, 1, 0, 0.372549, 1,
1.537391, -0.02983836, 1.534565, 1, 0, 0.3647059, 1,
1.538944, 1.049403, 0.6018729, 1, 0, 0.3607843, 1,
1.563239, -0.3960081, 1.948459, 1, 0, 0.3529412, 1,
1.565485, -2.215033, 0.4560668, 1, 0, 0.3490196, 1,
1.575336, 0.3705985, 0.507889, 1, 0, 0.3411765, 1,
1.578772, -0.6159288, 2.028463, 1, 0, 0.3372549, 1,
1.585602, -1.218758, 2.516386, 1, 0, 0.3294118, 1,
1.589133, 0.4696989, 1.971515, 1, 0, 0.3254902, 1,
1.595474, -0.169096, 2.346126, 1, 0, 0.3176471, 1,
1.600241, -2.09351, 2.411013, 1, 0, 0.3137255, 1,
1.604141, -0.538878, 2.10731, 1, 0, 0.3058824, 1,
1.610515, 0.1825932, 2.765695, 1, 0, 0.2980392, 1,
1.614041, -0.05056417, 2.802433, 1, 0, 0.2941177, 1,
1.621732, 1.345218, 1.289158, 1, 0, 0.2862745, 1,
1.667394, 0.3437521, 0.00405687, 1, 0, 0.282353, 1,
1.67873, 0.1003035, 2.54561, 1, 0, 0.2745098, 1,
1.696971, 0.6831195, 1.15138, 1, 0, 0.2705882, 1,
1.701489, -1.528255, 1.732678, 1, 0, 0.2627451, 1,
1.712212, -0.01175566, 4.046127, 1, 0, 0.2588235, 1,
1.719769, 0.05780398, 0.6625572, 1, 0, 0.2509804, 1,
1.723219, 1.707351, -0.0840079, 1, 0, 0.2470588, 1,
1.725964, -0.3768188, 3.208014, 1, 0, 0.2392157, 1,
1.739785, -0.6422368, 1.625794, 1, 0, 0.2352941, 1,
1.744545, -0.6113099, 2.601798, 1, 0, 0.227451, 1,
1.745338, -0.3100413, 0.6389578, 1, 0, 0.2235294, 1,
1.761181, -0.8521284, 1.068796, 1, 0, 0.2156863, 1,
1.768892, -0.4728277, 1.552069, 1, 0, 0.2117647, 1,
1.810494, -0.5988696, 2.361915, 1, 0, 0.2039216, 1,
1.813908, -1.086617, 0.8179271, 1, 0, 0.1960784, 1,
1.814957, -0.366865, 2.06937, 1, 0, 0.1921569, 1,
1.844275, -0.4752978, 0.07935652, 1, 0, 0.1843137, 1,
1.847724, -0.3161073, 1.950961, 1, 0, 0.1803922, 1,
1.897988, 1.206383, 0.5991302, 1, 0, 0.172549, 1,
1.916361, -0.4557022, 1.95401, 1, 0, 0.1686275, 1,
1.949093, 0.2726885, 0.9572641, 1, 0, 0.1607843, 1,
1.97644, 0.6989728, 1.95437, 1, 0, 0.1568628, 1,
1.99508, -0.6201302, 2.592482, 1, 0, 0.1490196, 1,
1.996528, -0.1824929, 1.600751, 1, 0, 0.145098, 1,
2.012383, 0.9086106, 1.729389, 1, 0, 0.1372549, 1,
2.025195, -0.6574475, 2.631906, 1, 0, 0.1333333, 1,
2.047328, -0.3504698, 1.692897, 1, 0, 0.1254902, 1,
2.089534, 0.2981204, 1.109698, 1, 0, 0.1215686, 1,
2.095662, -1.200837, 3.148374, 1, 0, 0.1137255, 1,
2.139339, 1.160575, -0.2267525, 1, 0, 0.1098039, 1,
2.143753, 0.525674, 1.541335, 1, 0, 0.1019608, 1,
2.154433, 1.002537, 1.471693, 1, 0, 0.09411765, 1,
2.156184, 1.106303, 1.526967, 1, 0, 0.09019608, 1,
2.159554, -0.3162267, 2.37711, 1, 0, 0.08235294, 1,
2.236349, 0.9232006, 3.089539, 1, 0, 0.07843138, 1,
2.242734, 0.5464869, 0.7077428, 1, 0, 0.07058824, 1,
2.252508, -0.4057359, 1.516624, 1, 0, 0.06666667, 1,
2.262491, 0.8339547, -0.6028463, 1, 0, 0.05882353, 1,
2.294394, -0.6756567, 1.185798, 1, 0, 0.05490196, 1,
2.303473, 0.4460596, 1.010047, 1, 0, 0.04705882, 1,
2.361262, 1.98964, 2.150277, 1, 0, 0.04313726, 1,
2.433102, 1.530959, 0.5866697, 1, 0, 0.03529412, 1,
2.444853, 0.07433732, 0.7595808, 1, 0, 0.03137255, 1,
2.569997, -0.6656918, 2.637254, 1, 0, 0.02352941, 1,
2.731476, 1.210569, 2.293453, 1, 0, 0.01960784, 1,
3.355374, -1.067833, 1.794421, 1, 0, 0.01176471, 1,
3.404108, -1.575774, 3.540593, 1, 0, 0.007843138, 1
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
0.1003827, -4.062862, -7.003648, 0, -0.5, 0.5, 0.5,
0.1003827, -4.062862, -7.003648, 1, -0.5, 0.5, 0.5,
0.1003827, -4.062862, -7.003648, 1, 1.5, 0.5, 0.5,
0.1003827, -4.062862, -7.003648, 0, 1.5, 0.5, 0.5
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
-4.323306, 0.2101078, -7.003648, 0, -0.5, 0.5, 0.5,
-4.323306, 0.2101078, -7.003648, 1, -0.5, 0.5, 0.5,
-4.323306, 0.2101078, -7.003648, 1, 1.5, 0.5, 0.5,
-4.323306, 0.2101078, -7.003648, 0, 1.5, 0.5, 0.5
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
-4.323306, -4.062862, 0.2486141, 0, -0.5, 0.5, 0.5,
-4.323306, -4.062862, 0.2486141, 1, -0.5, 0.5, 0.5,
-4.323306, -4.062862, 0.2486141, 1, 1.5, 0.5, 0.5,
-4.323306, -4.062862, 0.2486141, 0, 1.5, 0.5, 0.5
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
-3, -3.076792, -5.330049,
3, -3.076792, -5.330049,
-3, -3.076792, -5.330049,
-3, -3.241137, -5.608982,
-2, -3.076792, -5.330049,
-2, -3.241137, -5.608982,
-1, -3.076792, -5.330049,
-1, -3.241137, -5.608982,
0, -3.076792, -5.330049,
0, -3.241137, -5.608982,
1, -3.076792, -5.330049,
1, -3.241137, -5.608982,
2, -3.076792, -5.330049,
2, -3.241137, -5.608982,
3, -3.076792, -5.330049,
3, -3.241137, -5.608982
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
-3, -3.569827, -6.166848, 0, -0.5, 0.5, 0.5,
-3, -3.569827, -6.166848, 1, -0.5, 0.5, 0.5,
-3, -3.569827, -6.166848, 1, 1.5, 0.5, 0.5,
-3, -3.569827, -6.166848, 0, 1.5, 0.5, 0.5,
-2, -3.569827, -6.166848, 0, -0.5, 0.5, 0.5,
-2, -3.569827, -6.166848, 1, -0.5, 0.5, 0.5,
-2, -3.569827, -6.166848, 1, 1.5, 0.5, 0.5,
-2, -3.569827, -6.166848, 0, 1.5, 0.5, 0.5,
-1, -3.569827, -6.166848, 0, -0.5, 0.5, 0.5,
-1, -3.569827, -6.166848, 1, -0.5, 0.5, 0.5,
-1, -3.569827, -6.166848, 1, 1.5, 0.5, 0.5,
-1, -3.569827, -6.166848, 0, 1.5, 0.5, 0.5,
0, -3.569827, -6.166848, 0, -0.5, 0.5, 0.5,
0, -3.569827, -6.166848, 1, -0.5, 0.5, 0.5,
0, -3.569827, -6.166848, 1, 1.5, 0.5, 0.5,
0, -3.569827, -6.166848, 0, 1.5, 0.5, 0.5,
1, -3.569827, -6.166848, 0, -0.5, 0.5, 0.5,
1, -3.569827, -6.166848, 1, -0.5, 0.5, 0.5,
1, -3.569827, -6.166848, 1, 1.5, 0.5, 0.5,
1, -3.569827, -6.166848, 0, 1.5, 0.5, 0.5,
2, -3.569827, -6.166848, 0, -0.5, 0.5, 0.5,
2, -3.569827, -6.166848, 1, -0.5, 0.5, 0.5,
2, -3.569827, -6.166848, 1, 1.5, 0.5, 0.5,
2, -3.569827, -6.166848, 0, 1.5, 0.5, 0.5,
3, -3.569827, -6.166848, 0, -0.5, 0.5, 0.5,
3, -3.569827, -6.166848, 1, -0.5, 0.5, 0.5,
3, -3.569827, -6.166848, 1, 1.5, 0.5, 0.5,
3, -3.569827, -6.166848, 0, 1.5, 0.5, 0.5
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
-3.302455, -2, -5.330049,
-3.302455, 3, -5.330049,
-3.302455, -2, -5.330049,
-3.472597, -2, -5.608982,
-3.302455, -1, -5.330049,
-3.472597, -1, -5.608982,
-3.302455, 0, -5.330049,
-3.472597, 0, -5.608982,
-3.302455, 1, -5.330049,
-3.472597, 1, -5.608982,
-3.302455, 2, -5.330049,
-3.472597, 2, -5.608982,
-3.302455, 3, -5.330049,
-3.472597, 3, -5.608982
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
-3.81288, -2, -6.166848, 0, -0.5, 0.5, 0.5,
-3.81288, -2, -6.166848, 1, -0.5, 0.5, 0.5,
-3.81288, -2, -6.166848, 1, 1.5, 0.5, 0.5,
-3.81288, -2, -6.166848, 0, 1.5, 0.5, 0.5,
-3.81288, -1, -6.166848, 0, -0.5, 0.5, 0.5,
-3.81288, -1, -6.166848, 1, -0.5, 0.5, 0.5,
-3.81288, -1, -6.166848, 1, 1.5, 0.5, 0.5,
-3.81288, -1, -6.166848, 0, 1.5, 0.5, 0.5,
-3.81288, 0, -6.166848, 0, -0.5, 0.5, 0.5,
-3.81288, 0, -6.166848, 1, -0.5, 0.5, 0.5,
-3.81288, 0, -6.166848, 1, 1.5, 0.5, 0.5,
-3.81288, 0, -6.166848, 0, 1.5, 0.5, 0.5,
-3.81288, 1, -6.166848, 0, -0.5, 0.5, 0.5,
-3.81288, 1, -6.166848, 1, -0.5, 0.5, 0.5,
-3.81288, 1, -6.166848, 1, 1.5, 0.5, 0.5,
-3.81288, 1, -6.166848, 0, 1.5, 0.5, 0.5,
-3.81288, 2, -6.166848, 0, -0.5, 0.5, 0.5,
-3.81288, 2, -6.166848, 1, -0.5, 0.5, 0.5,
-3.81288, 2, -6.166848, 1, 1.5, 0.5, 0.5,
-3.81288, 2, -6.166848, 0, 1.5, 0.5, 0.5,
-3.81288, 3, -6.166848, 0, -0.5, 0.5, 0.5,
-3.81288, 3, -6.166848, 1, -0.5, 0.5, 0.5,
-3.81288, 3, -6.166848, 1, 1.5, 0.5, 0.5,
-3.81288, 3, -6.166848, 0, 1.5, 0.5, 0.5
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
-3.302455, -3.076792, -4,
-3.302455, -3.076792, 4,
-3.302455, -3.076792, -4,
-3.472597, -3.241137, -4,
-3.302455, -3.076792, -2,
-3.472597, -3.241137, -2,
-3.302455, -3.076792, 0,
-3.472597, -3.241137, 0,
-3.302455, -3.076792, 2,
-3.472597, -3.241137, 2,
-3.302455, -3.076792, 4,
-3.472597, -3.241137, 4
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
-3.81288, -3.569827, -4, 0, -0.5, 0.5, 0.5,
-3.81288, -3.569827, -4, 1, -0.5, 0.5, 0.5,
-3.81288, -3.569827, -4, 1, 1.5, 0.5, 0.5,
-3.81288, -3.569827, -4, 0, 1.5, 0.5, 0.5,
-3.81288, -3.569827, -2, 0, -0.5, 0.5, 0.5,
-3.81288, -3.569827, -2, 1, -0.5, 0.5, 0.5,
-3.81288, -3.569827, -2, 1, 1.5, 0.5, 0.5,
-3.81288, -3.569827, -2, 0, 1.5, 0.5, 0.5,
-3.81288, -3.569827, 0, 0, -0.5, 0.5, 0.5,
-3.81288, -3.569827, 0, 1, -0.5, 0.5, 0.5,
-3.81288, -3.569827, 0, 1, 1.5, 0.5, 0.5,
-3.81288, -3.569827, 0, 0, 1.5, 0.5, 0.5,
-3.81288, -3.569827, 2, 0, -0.5, 0.5, 0.5,
-3.81288, -3.569827, 2, 1, -0.5, 0.5, 0.5,
-3.81288, -3.569827, 2, 1, 1.5, 0.5, 0.5,
-3.81288, -3.569827, 2, 0, 1.5, 0.5, 0.5,
-3.81288, -3.569827, 4, 0, -0.5, 0.5, 0.5,
-3.81288, -3.569827, 4, 1, -0.5, 0.5, 0.5,
-3.81288, -3.569827, 4, 1, 1.5, 0.5, 0.5,
-3.81288, -3.569827, 4, 0, 1.5, 0.5, 0.5
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
-3.302455, -3.076792, -5.330049,
-3.302455, 3.497007, -5.330049,
-3.302455, -3.076792, 5.827277,
-3.302455, 3.497007, 5.827277,
-3.302455, -3.076792, -5.330049,
-3.302455, -3.076792, 5.827277,
-3.302455, 3.497007, -5.330049,
-3.302455, 3.497007, 5.827277,
-3.302455, -3.076792, -5.330049,
3.50322, -3.076792, -5.330049,
-3.302455, -3.076792, 5.827277,
3.50322, -3.076792, 5.827277,
-3.302455, 3.497007, -5.330049,
3.50322, 3.497007, -5.330049,
-3.302455, 3.497007, 5.827277,
3.50322, 3.497007, 5.827277,
3.50322, -3.076792, -5.330049,
3.50322, 3.497007, -5.330049,
3.50322, -3.076792, 5.827277,
3.50322, 3.497007, 5.827277,
3.50322, -3.076792, -5.330049,
3.50322, -3.076792, 5.827277,
3.50322, 3.497007, -5.330049,
3.50322, 3.497007, 5.827277
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
var radius = 7.81179;
var distance = 34.75554;
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
mvMatrix.translate( -0.1003827, -0.2101078, -0.2486141 );
mvMatrix.scale( 1.241061, 1.284837, 0.7570148 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.75554);
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
dibromochloropropane<-read.table("dibromochloropropane.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dibromochloropropane$V2
```

```
## Error in eval(expr, envir, enclos): object 'dibromochloropropane' not found
```

```r
y<-dibromochloropropane$V3
```

```
## Error in eval(expr, envir, enclos): object 'dibromochloropropane' not found
```

```r
z<-dibromochloropropane$V4
```

```
## Error in eval(expr, envir, enclos): object 'dibromochloropropane' not found
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
-3.203343, 1.228565, -3.053194, 0, 0, 1, 1, 1,
-3.188354, 1.736747, -1.487881, 1, 0, 0, 1, 1,
-3.159182, 1.228223, -0.03092824, 1, 0, 0, 1, 1,
-3.142439, 0.08609746, -2.535783, 1, 0, 0, 1, 1,
-3.090128, -0.4235277, -0.6135505, 1, 0, 0, 1, 1,
-2.896263, 1.126063, -2.699061, 1, 0, 0, 1, 1,
-2.806405, 1.254742, -2.021452, 0, 0, 0, 1, 1,
-2.555475, 0.6116285, -1.556503, 0, 0, 0, 1, 1,
-2.474311, -0.2241986, -0.3011946, 0, 0, 0, 1, 1,
-2.422663, 0.1384683, -2.545008, 0, 0, 0, 1, 1,
-2.366892, -1.720676, -2.954515, 0, 0, 0, 1, 1,
-2.314749, 0.4106751, -1.020054, 0, 0, 0, 1, 1,
-2.284343, -0.4227291, -1.042371, 0, 0, 0, 1, 1,
-2.283169, 1.074788, -1.227363, 1, 1, 1, 1, 1,
-2.256589, 1.586529, 0.7276396, 1, 1, 1, 1, 1,
-2.219643, -2.524279, -1.909995, 1, 1, 1, 1, 1,
-2.192369, -0.9859164, -4.261518, 1, 1, 1, 1, 1,
-2.145638, -2.382615, -1.169476, 1, 1, 1, 1, 1,
-2.062953, -0.482695, -1.089373, 1, 1, 1, 1, 1,
-2.060807, -0.1093634, -1.353172, 1, 1, 1, 1, 1,
-2.050987, -2.150929, -4.096966, 1, 1, 1, 1, 1,
-2.026493, 0.06535081, -2.06088, 1, 1, 1, 1, 1,
-2.0162, -0.4733342, -0.4764335, 1, 1, 1, 1, 1,
-2.016033, 2.511198, -1.250777, 1, 1, 1, 1, 1,
-2.015625, -0.5423238, -0.9844362, 1, 1, 1, 1, 1,
-1.988586, -1.791555, -1.836439, 1, 1, 1, 1, 1,
-1.960918, -0.8807947, -3.430918, 1, 1, 1, 1, 1,
-1.947472, -0.1294652, -1.741042, 1, 1, 1, 1, 1,
-1.920956, -1.089601, -2.570146, 0, 0, 1, 1, 1,
-1.917157, 0.3591551, 0.1559149, 1, 0, 0, 1, 1,
-1.905301, 0.07077808, -2.667652, 1, 0, 0, 1, 1,
-1.872795, 0.06032781, -1.469895, 1, 0, 0, 1, 1,
-1.865149, 0.3155603, -2.508234, 1, 0, 0, 1, 1,
-1.862074, -0.2204738, -2.009562, 1, 0, 0, 1, 1,
-1.844366, 0.4803779, -2.056288, 0, 0, 0, 1, 1,
-1.831729, -0.5930664, -3.025098, 0, 0, 0, 1, 1,
-1.829602, 1.293971, -0.285506, 0, 0, 0, 1, 1,
-1.818427, -1.357129, -0.9693062, 0, 0, 0, 1, 1,
-1.805499, -1.758519, -1.935059, 0, 0, 0, 1, 1,
-1.805037, 0.1406809, -1.1164, 0, 0, 0, 1, 1,
-1.784787, -0.6284776, -2.499081, 0, 0, 0, 1, 1,
-1.776007, 0.336726, -1.099084, 1, 1, 1, 1, 1,
-1.775176, 0.2957416, -2.140188, 1, 1, 1, 1, 1,
-1.770719, -1.239352, -1.092882, 1, 1, 1, 1, 1,
-1.770059, 0.01255555, -1.229377, 1, 1, 1, 1, 1,
-1.754853, 1.191034, -1.44141, 1, 1, 1, 1, 1,
-1.744831, 1.781365, -2.016649, 1, 1, 1, 1, 1,
-1.744791, 0.2497519, -0.6350305, 1, 1, 1, 1, 1,
-1.741818, 0.1253944, -2.018284, 1, 1, 1, 1, 1,
-1.710862, 0.655593, -1.038636, 1, 1, 1, 1, 1,
-1.703421, 1.22163, -1.696143, 1, 1, 1, 1, 1,
-1.677721, -0.256241, -3.277715, 1, 1, 1, 1, 1,
-1.668659, -0.9079697, 0.7365507, 1, 1, 1, 1, 1,
-1.655799, -0.7835879, -1.215999, 1, 1, 1, 1, 1,
-1.646364, 0.9174163, -0.6306132, 1, 1, 1, 1, 1,
-1.643168, 0.8911971, 0.3494312, 1, 1, 1, 1, 1,
-1.628806, 0.1313936, -1.020692, 0, 0, 1, 1, 1,
-1.622856, 0.8716823, -0.7846135, 1, 0, 0, 1, 1,
-1.5968, -1.22138, -1.874958, 1, 0, 0, 1, 1,
-1.5723, -1.235573, -2.22458, 1, 0, 0, 1, 1,
-1.568958, -1.643653, -1.933032, 1, 0, 0, 1, 1,
-1.565239, 1.581045, -1.764279, 1, 0, 0, 1, 1,
-1.563894, 1.433641, -0.3994226, 0, 0, 0, 1, 1,
-1.562454, 0.8238511, -1.400133, 0, 0, 0, 1, 1,
-1.561066, -0.6039845, 0.2781435, 0, 0, 0, 1, 1,
-1.555005, -1.881816, -1.46107, 0, 0, 0, 1, 1,
-1.552111, 1.609267, -0.8540695, 0, 0, 0, 1, 1,
-1.545566, -0.9378895, -3.582754, 0, 0, 0, 1, 1,
-1.541581, 0.08097265, 0.1760388, 0, 0, 0, 1, 1,
-1.529879, 0.05888164, -1.157373, 1, 1, 1, 1, 1,
-1.508576, -0.01134442, -1.840689, 1, 1, 1, 1, 1,
-1.497854, 1.465173, 1.920524, 1, 1, 1, 1, 1,
-1.49235, -0.5738269, 0.412127, 1, 1, 1, 1, 1,
-1.484031, 0.07513504, -0.5991031, 1, 1, 1, 1, 1,
-1.476934, -0.1969933, 0.2250326, 1, 1, 1, 1, 1,
-1.476612, -0.8483486, -2.265169, 1, 1, 1, 1, 1,
-1.468295, 0.8263627, -0.3868502, 1, 1, 1, 1, 1,
-1.463312, -0.21592, -2.191037, 1, 1, 1, 1, 1,
-1.46017, 1.130958, -0.8434463, 1, 1, 1, 1, 1,
-1.459111, -1.492761, -2.308798, 1, 1, 1, 1, 1,
-1.458398, -0.8489792, -3.026834, 1, 1, 1, 1, 1,
-1.455443, 0.8735746, -1.574467, 1, 1, 1, 1, 1,
-1.44653, 0.2731628, -0.10523, 1, 1, 1, 1, 1,
-1.443049, 0.3263291, -3.760256, 1, 1, 1, 1, 1,
-1.440612, 1.730448, -0.4054683, 0, 0, 1, 1, 1,
-1.439497, 2.142458, -0.04508169, 1, 0, 0, 1, 1,
-1.433516, -1.59366, -3.179411, 1, 0, 0, 1, 1,
-1.43201, -0.1973316, -2.270371, 1, 0, 0, 1, 1,
-1.429233, -0.8682041, -1.964387, 1, 0, 0, 1, 1,
-1.416063, -1.055524, -3.291073, 1, 0, 0, 1, 1,
-1.395381, 1.825938, 0.173779, 0, 0, 0, 1, 1,
-1.381546, -0.8554556, -2.04463, 0, 0, 0, 1, 1,
-1.37895, 2.147832, -0.3763867, 0, 0, 0, 1, 1,
-1.369984, -2.296807, -3.060351, 0, 0, 0, 1, 1,
-1.36745, -0.6268127, -2.161899, 0, 0, 0, 1, 1,
-1.361645, 1.439911, 0.8451101, 0, 0, 0, 1, 1,
-1.357731, 1.119797, -1.634364, 0, 0, 0, 1, 1,
-1.354572, 0.5906702, -0.02303147, 1, 1, 1, 1, 1,
-1.348159, 0.9708228, 0.6998017, 1, 1, 1, 1, 1,
-1.344947, 0.145153, -1.876372, 1, 1, 1, 1, 1,
-1.344272, -1.462484, -2.431154, 1, 1, 1, 1, 1,
-1.338063, -0.6644149, -2.966841, 1, 1, 1, 1, 1,
-1.312145, 0.3452127, -0.9128153, 1, 1, 1, 1, 1,
-1.306519, 1.012284, -2.649053, 1, 1, 1, 1, 1,
-1.306264, 0.2899357, -1.587711, 1, 1, 1, 1, 1,
-1.302701, 0.05708943, -3.109169, 1, 1, 1, 1, 1,
-1.301679, 0.9174953, -0.4903109, 1, 1, 1, 1, 1,
-1.298498, 0.1991488, -0.6254451, 1, 1, 1, 1, 1,
-1.296648, 0.9401212, -0.3952216, 1, 1, 1, 1, 1,
-1.296191, 1.366498, -1.856833, 1, 1, 1, 1, 1,
-1.284618, -1.247344, -1.878565, 1, 1, 1, 1, 1,
-1.273726, -0.1962685, -4.179095, 1, 1, 1, 1, 1,
-1.260819, -1.485096, -1.920426, 0, 0, 1, 1, 1,
-1.260184, -1.921479, -3.14124, 1, 0, 0, 1, 1,
-1.259947, 1.848293, -1.086822, 1, 0, 0, 1, 1,
-1.255072, 2.138952, -1.1168, 1, 0, 0, 1, 1,
-1.253242, 1.146141, -1.635828, 1, 0, 0, 1, 1,
-1.251553, -0.4091386, -3.783618, 1, 0, 0, 1, 1,
-1.246099, -0.4684835, -2.536423, 0, 0, 0, 1, 1,
-1.228977, 0.8515364, 0.1663316, 0, 0, 0, 1, 1,
-1.227704, 0.8120692, -2.460441, 0, 0, 0, 1, 1,
-1.214123, -0.6736566, -1.137786, 0, 0, 0, 1, 1,
-1.209822, 0.2186222, -2.375267, 0, 0, 0, 1, 1,
-1.205316, -1.041206, -1.053419, 0, 0, 0, 1, 1,
-1.205266, 0.5576161, -2.260164, 0, 0, 0, 1, 1,
-1.203475, -0.3096882, -1.240631, 1, 1, 1, 1, 1,
-1.200379, -1.787302, -2.638367, 1, 1, 1, 1, 1,
-1.197626, 0.2622604, -0.0616597, 1, 1, 1, 1, 1,
-1.195474, 0.9169412, 0.9014443, 1, 1, 1, 1, 1,
-1.186664, -0.1844978, -0.8651894, 1, 1, 1, 1, 1,
-1.185916, 0.7643596, -1.27184, 1, 1, 1, 1, 1,
-1.185031, 0.9107184, -0.634418, 1, 1, 1, 1, 1,
-1.170538, -0.2660744, -1.618488, 1, 1, 1, 1, 1,
-1.159427, 1.04984, -0.5690823, 1, 1, 1, 1, 1,
-1.152072, -0.6106185, -1.924447, 1, 1, 1, 1, 1,
-1.14983, -0.1474456, -1.457121, 1, 1, 1, 1, 1,
-1.146296, 1.132099, 0.1612959, 1, 1, 1, 1, 1,
-1.145219, -0.1085075, -2.125353, 1, 1, 1, 1, 1,
-1.140154, -0.4807896, -0.6424774, 1, 1, 1, 1, 1,
-1.134018, -0.5683893, -1.413065, 1, 1, 1, 1, 1,
-1.129669, 0.3776705, -4.460864, 0, 0, 1, 1, 1,
-1.126533, -0.331539, -2.170442, 1, 0, 0, 1, 1,
-1.122462, 0.06496468, -2.060141, 1, 0, 0, 1, 1,
-1.12047, -0.436626, -1.885716, 1, 0, 0, 1, 1,
-1.119258, -1.138458, -2.09397, 1, 0, 0, 1, 1,
-1.118796, 0.06169519, -0.7779311, 1, 0, 0, 1, 1,
-1.099941, -0.2616007, -2.367322, 0, 0, 0, 1, 1,
-1.098938, -0.07342883, -2.465624, 0, 0, 0, 1, 1,
-1.097793, 0.2513865, 0.2513594, 0, 0, 0, 1, 1,
-1.092199, 0.4102086, -2.059352, 0, 0, 0, 1, 1,
-1.092022, 0.269513, -2.140686, 0, 0, 0, 1, 1,
-1.085611, -0.7665082, -2.154648, 0, 0, 0, 1, 1,
-1.08062, 1.329236, -0.3685339, 0, 0, 0, 1, 1,
-1.079686, 0.6054207, -1.499796, 1, 1, 1, 1, 1,
-1.079606, -0.1501102, -0.4466715, 1, 1, 1, 1, 1,
-1.077249, -0.380219, -1.46033, 1, 1, 1, 1, 1,
-1.066576, -0.8168998, -2.462786, 1, 1, 1, 1, 1,
-1.061797, 0.8698109, -2.359171, 1, 1, 1, 1, 1,
-1.060281, 0.2451295, -1.661383, 1, 1, 1, 1, 1,
-1.059294, -1.43666, -2.249334, 1, 1, 1, 1, 1,
-1.058362, -1.229594, -1.106178, 1, 1, 1, 1, 1,
-1.054363, -0.5314026, -2.136636, 1, 1, 1, 1, 1,
-1.05327, -0.2112078, -1.755927, 1, 1, 1, 1, 1,
-1.049189, -0.07589377, -2.042392, 1, 1, 1, 1, 1,
-1.049047, 0.0449099, -2.280938, 1, 1, 1, 1, 1,
-1.046509, 0.2827228, -1.177937, 1, 1, 1, 1, 1,
-1.040284, -0.1937093, -1.992675, 1, 1, 1, 1, 1,
-1.033248, 1.16627, -0.3864832, 1, 1, 1, 1, 1,
-1.028437, 0.1642196, -1.814216, 0, 0, 1, 1, 1,
-1.028374, 0.8998588, -1.235184, 1, 0, 0, 1, 1,
-1.020818, 0.9952515, 0.657051, 1, 0, 0, 1, 1,
-1.019225, 0.1489707, -1.63607, 1, 0, 0, 1, 1,
-1.013269, 1.049662, 0.7217465, 1, 0, 0, 1, 1,
-1.012182, -0.3723499, -3.21612, 1, 0, 0, 1, 1,
-1.009796, 0.4419341, -1.025918, 0, 0, 0, 1, 1,
-1.009356, 0.4934696, -1.422215, 0, 0, 0, 1, 1,
-1.008655, -0.947966, -2.238592, 0, 0, 0, 1, 1,
-1.00582, 0.9710604, -0.64803, 0, 0, 0, 1, 1,
-1.005561, -0.589474, -2.583293, 0, 0, 0, 1, 1,
-1.002181, 1.982107, 0.1041579, 0, 0, 0, 1, 1,
-0.995024, -0.1087709, -1.419059, 0, 0, 0, 1, 1,
-0.9928817, 2.648286, -0.4235677, 1, 1, 1, 1, 1,
-0.9901745, 1.529041, -1.782717, 1, 1, 1, 1, 1,
-0.9714623, -0.8571627, -3.142876, 1, 1, 1, 1, 1,
-0.9675025, 0.4647547, -0.685743, 1, 1, 1, 1, 1,
-0.966312, -0.6667679, -2.487082, 1, 1, 1, 1, 1,
-0.9652747, -0.891932, -1.158769, 1, 1, 1, 1, 1,
-0.9609636, -0.2526715, 1.381249, 1, 1, 1, 1, 1,
-0.9523786, -0.2235054, -2.520764, 1, 1, 1, 1, 1,
-0.9477891, -0.4264819, -1.6337, 1, 1, 1, 1, 1,
-0.9471594, -0.6908207, -4.041768, 1, 1, 1, 1, 1,
-0.9436289, -0.9008628, -2.591802, 1, 1, 1, 1, 1,
-0.9364969, -1.449813, -1.729508, 1, 1, 1, 1, 1,
-0.9336632, -0.3481029, -1.109037, 1, 1, 1, 1, 1,
-0.9168479, 0.3632792, -0.8141674, 1, 1, 1, 1, 1,
-0.9159995, 0.3931201, -2.07846, 1, 1, 1, 1, 1,
-0.9148924, -0.04257229, -1.246897, 0, 0, 1, 1, 1,
-0.9144462, -0.3681493, -3.14874, 1, 0, 0, 1, 1,
-0.9094566, 0.6999907, 0.6804507, 1, 0, 0, 1, 1,
-0.8950372, -1.371499, -1.471173, 1, 0, 0, 1, 1,
-0.891163, -0.3717908, -0.6462618, 1, 0, 0, 1, 1,
-0.8911005, -2.191157, -2.54783, 1, 0, 0, 1, 1,
-0.888361, 2.412903, -1.549944, 0, 0, 0, 1, 1,
-0.8874088, -0.6006717, -1.410913, 0, 0, 0, 1, 1,
-0.8799155, 0.5732678, -1.021802, 0, 0, 0, 1, 1,
-0.8729042, 0.08611805, -1.555315, 0, 0, 0, 1, 1,
-0.8716246, 0.2805398, -0.3943397, 0, 0, 0, 1, 1,
-0.8692681, -1.190022, -0.7391647, 0, 0, 0, 1, 1,
-0.8654048, 1.346469, -0.9216068, 0, 0, 0, 1, 1,
-0.8604839, -1.036949, -1.120226, 1, 1, 1, 1, 1,
-0.8596513, 0.1947844, -0.6586627, 1, 1, 1, 1, 1,
-0.8588874, 0.1736063, -0.4173845, 1, 1, 1, 1, 1,
-0.8557432, 2.082081, -0.01375874, 1, 1, 1, 1, 1,
-0.8432702, -0.7724183, -0.1352912, 1, 1, 1, 1, 1,
-0.8315237, -0.319806, 0.05999211, 1, 1, 1, 1, 1,
-0.8308713, 0.5104558, -1.987594, 1, 1, 1, 1, 1,
-0.8293296, 0.04457252, -0.7731203, 1, 1, 1, 1, 1,
-0.8270438, 0.1887074, -2.302186, 1, 1, 1, 1, 1,
-0.8228227, 0.6131563, -0.02016668, 1, 1, 1, 1, 1,
-0.8206815, 0.4394459, -0.8826088, 1, 1, 1, 1, 1,
-0.8204339, -1.289032, -1.749069, 1, 1, 1, 1, 1,
-0.8134106, -0.8012245, -2.296942, 1, 1, 1, 1, 1,
-0.8027979, -1.3743, -2.360835, 1, 1, 1, 1, 1,
-0.8022, -1.248829, -3.043529, 1, 1, 1, 1, 1,
-0.7976642, 0.2201174, -1.632578, 0, 0, 1, 1, 1,
-0.794418, 1.492372, -0.7449304, 1, 0, 0, 1, 1,
-0.7917046, 1.315101, -0.5521408, 1, 0, 0, 1, 1,
-0.7811108, -0.9215916, -3.797013, 1, 0, 0, 1, 1,
-0.7747781, 0.9395881, 0.6370252, 1, 0, 0, 1, 1,
-0.768935, -0.03081524, -3.004216, 1, 0, 0, 1, 1,
-0.7660514, 0.5051721, -0.550295, 0, 0, 0, 1, 1,
-0.7654243, -0.5122661, -2.992121, 0, 0, 0, 1, 1,
-0.7616005, 0.9936761, -0.7360871, 0, 0, 0, 1, 1,
-0.7585291, 1.84168, 0.573221, 0, 0, 0, 1, 1,
-0.7578286, -1.193812, -2.448014, 0, 0, 0, 1, 1,
-0.7495047, 1.607095, -1.229164, 0, 0, 0, 1, 1,
-0.7489301, 0.12089, -0.9674356, 0, 0, 0, 1, 1,
-0.743988, -1.689228, -3.750152, 1, 1, 1, 1, 1,
-0.7400821, -0.2658135, -0.9433919, 1, 1, 1, 1, 1,
-0.738085, 1.517793, -2.292093, 1, 1, 1, 1, 1,
-0.7359682, -1.60422, -3.679221, 1, 1, 1, 1, 1,
-0.734296, 1.417933, -1.509257, 1, 1, 1, 1, 1,
-0.7306582, -0.4748562, -2.334285, 1, 1, 1, 1, 1,
-0.7086149, 0.2938562, -1.854879, 1, 1, 1, 1, 1,
-0.7067158, -0.4734917, -2.07863, 1, 1, 1, 1, 1,
-0.7042963, 0.1335556, -0.5776526, 1, 1, 1, 1, 1,
-0.7038247, 1.841753, 1.483784, 1, 1, 1, 1, 1,
-0.7021382, -0.845911, -2.754978, 1, 1, 1, 1, 1,
-0.6999337, -0.7514336, -3.194155, 1, 1, 1, 1, 1,
-0.6993223, -0.5631484, -4.540399, 1, 1, 1, 1, 1,
-0.6981495, 1.138853, -0.8642301, 1, 1, 1, 1, 1,
-0.6967141, -1.342207, -2.958349, 1, 1, 1, 1, 1,
-0.6949846, -0.9323776, -2.028513, 0, 0, 1, 1, 1,
-0.6905476, -0.3249557, -4.28314, 1, 0, 0, 1, 1,
-0.6893744, 1.739338, -1.142377, 1, 0, 0, 1, 1,
-0.6875811, -0.07260746, -2.173111, 1, 0, 0, 1, 1,
-0.6848782, -0.2597348, -1.373095, 1, 0, 0, 1, 1,
-0.683924, -0.4345863, -3.091451, 1, 0, 0, 1, 1,
-0.6833412, 1.19536, -1.51628, 0, 0, 0, 1, 1,
-0.6830445, 1.06664, -0.3888389, 0, 0, 0, 1, 1,
-0.677731, 0.6305649, -1.481973, 0, 0, 0, 1, 1,
-0.6775459, -0.4883904, -1.005394, 0, 0, 0, 1, 1,
-0.6767883, 1.171343, 1.307583, 0, 0, 0, 1, 1,
-0.6692319, 0.6925249, -2.324555, 0, 0, 0, 1, 1,
-0.6628539, 1.175418, 0.08385859, 0, 0, 0, 1, 1,
-0.6602069, 0.1453008, -2.115566, 1, 1, 1, 1, 1,
-0.6601875, 0.8895928, -2.245588, 1, 1, 1, 1, 1,
-0.6595345, -0.4332192, -1.932975, 1, 1, 1, 1, 1,
-0.6585218, -0.4345821, -0.5735166, 1, 1, 1, 1, 1,
-0.6534649, -0.2829047, -3.52285, 1, 1, 1, 1, 1,
-0.6509518, -0.8400398, -1.53591, 1, 1, 1, 1, 1,
-0.6506018, -1.403882, -3.57705, 1, 1, 1, 1, 1,
-0.649456, -1.149367, -3.06101, 1, 1, 1, 1, 1,
-0.6451949, -0.1312265, -3.61597, 1, 1, 1, 1, 1,
-0.6435893, 0.8683833, -1.974788, 1, 1, 1, 1, 1,
-0.6402494, 0.9759405, 0.9869968, 1, 1, 1, 1, 1,
-0.6370468, -1.552799, -4.147739, 1, 1, 1, 1, 1,
-0.6357211, 0.07429864, -1.099667, 1, 1, 1, 1, 1,
-0.6353639, -0.7509649, -2.860683, 1, 1, 1, 1, 1,
-0.6340476, 0.4588912, -2.176479, 1, 1, 1, 1, 1,
-0.6318749, 0.5109099, -2.187989, 0, 0, 1, 1, 1,
-0.6306512, -1.422086, -2.512546, 1, 0, 0, 1, 1,
-0.6291617, -0.5872164, -0.4871443, 1, 0, 0, 1, 1,
-0.6290668, -0.02856295, -0.4458311, 1, 0, 0, 1, 1,
-0.6271013, 2.080156, -0.6681476, 1, 0, 0, 1, 1,
-0.6167533, -0.2100394, -1.535392, 1, 0, 0, 1, 1,
-0.6138393, 0.4182692, -1.662148, 0, 0, 0, 1, 1,
-0.608439, 2.275409, -0.2541252, 0, 0, 0, 1, 1,
-0.6046582, 1.165735, -0.6989753, 0, 0, 0, 1, 1,
-0.5931866, -0.1167815, -1.14748, 0, 0, 0, 1, 1,
-0.5877804, -0.07071465, -0.3392881, 0, 0, 0, 1, 1,
-0.5839686, -0.3104448, -0.6681692, 0, 0, 0, 1, 1,
-0.5825685, 0.457975, -0.02763061, 0, 0, 0, 1, 1,
-0.5820358, 0.6222055, 0.1783192, 1, 1, 1, 1, 1,
-0.5800146, 0.1327741, -1.874378, 1, 1, 1, 1, 1,
-0.5767954, 0.5563776, -3.227651, 1, 1, 1, 1, 1,
-0.5759087, 1.66718, -1.375651, 1, 1, 1, 1, 1,
-0.5738626, 1.832359, 1.477072, 1, 1, 1, 1, 1,
-0.5723068, -0.2601105, -1.942672, 1, 1, 1, 1, 1,
-0.5714806, 0.09702305, -1.597248, 1, 1, 1, 1, 1,
-0.5671741, 0.278325, -1.41661, 1, 1, 1, 1, 1,
-0.566346, 0.2421591, 0.002291743, 1, 1, 1, 1, 1,
-0.5645309, 0.8139688, -3.687576, 1, 1, 1, 1, 1,
-0.562243, 1.039369, -0.6009902, 1, 1, 1, 1, 1,
-0.5580585, 1.378798, -1.223244, 1, 1, 1, 1, 1,
-0.5549475, -0.2405006, -2.729317, 1, 1, 1, 1, 1,
-0.5507923, 0.3002822, -1.392626, 1, 1, 1, 1, 1,
-0.5380719, 0.1264945, -2.356936, 1, 1, 1, 1, 1,
-0.5368243, 1.015485, -1.042566, 0, 0, 1, 1, 1,
-0.5361753, 1.099621, -0.2492205, 1, 0, 0, 1, 1,
-0.5357839, 1.234757, -0.2179437, 1, 0, 0, 1, 1,
-0.5345209, 0.6661865, -1.606601, 1, 0, 0, 1, 1,
-0.5331301, 0.2680312, -1.297491, 1, 0, 0, 1, 1,
-0.5243686, -0.9887846, -1.471818, 1, 0, 0, 1, 1,
-0.5186821, -1.089483, -1.537947, 0, 0, 0, 1, 1,
-0.5180226, 0.5115108, -1.092828, 0, 0, 0, 1, 1,
-0.5178575, -0.1505921, -0.1673736, 0, 0, 0, 1, 1,
-0.5176373, 0.2716132, 0.09104507, 0, 0, 0, 1, 1,
-0.517447, -0.4569549, -1.585107, 0, 0, 0, 1, 1,
-0.5123324, -0.1648539, -2.027811, 0, 0, 0, 1, 1,
-0.5107181, 0.1870192, -1.094528, 0, 0, 0, 1, 1,
-0.507026, 0.8256878, 0.5333459, 1, 1, 1, 1, 1,
-0.5034113, -0.3410083, -2.697311, 1, 1, 1, 1, 1,
-0.5029532, -0.3503319, -2.239367, 1, 1, 1, 1, 1,
-0.4980094, -1.289236, -3.385121, 1, 1, 1, 1, 1,
-0.4950514, -0.1489235, -3.315381, 1, 1, 1, 1, 1,
-0.4942647, -0.5331178, -1.588622, 1, 1, 1, 1, 1,
-0.4925341, 1.764104, 1.119895, 1, 1, 1, 1, 1,
-0.4917945, 0.2298361, -1.077303, 1, 1, 1, 1, 1,
-0.4900462, 1.241736, -2.20369, 1, 1, 1, 1, 1,
-0.485829, 0.5476528, 0.1477108, 1, 1, 1, 1, 1,
-0.4818543, 0.08276003, -1.576899, 1, 1, 1, 1, 1,
-0.4797226, -0.6003638, -2.395305, 1, 1, 1, 1, 1,
-0.4733427, 0.6475102, 0.7189005, 1, 1, 1, 1, 1,
-0.471487, 0.5342681, -1.243474, 1, 1, 1, 1, 1,
-0.4703419, 0.4628488, -1.586481, 1, 1, 1, 1, 1,
-0.4688237, -1.898241, -5.029559, 0, 0, 1, 1, 1,
-0.4662278, -1.141459, -1.089505, 1, 0, 0, 1, 1,
-0.4647177, -1.007852, -4.566197, 1, 0, 0, 1, 1,
-0.4642954, -1.587337, -2.643876, 1, 0, 0, 1, 1,
-0.4620738, 1.460561, -0.1724573, 1, 0, 0, 1, 1,
-0.4588892, 1.393872, 0.5506779, 1, 0, 0, 1, 1,
-0.458883, 0.2960716, -2.257972, 0, 0, 0, 1, 1,
-0.4575973, 1.654534, -1.606325, 0, 0, 0, 1, 1,
-0.4536765, 2.388207, -1.016413, 0, 0, 0, 1, 1,
-0.4528057, 0.3656134, -2.662169, 0, 0, 0, 1, 1,
-0.4510412, -1.260875, -1.765404, 0, 0, 0, 1, 1,
-0.4491728, 2.441033, 0.5753051, 0, 0, 0, 1, 1,
-0.4460301, -2.242397, -1.772354, 0, 0, 0, 1, 1,
-0.4432173, 1.629421, 0.5578337, 1, 1, 1, 1, 1,
-0.4424485, 0.8082374, -2.002327, 1, 1, 1, 1, 1,
-0.4420306, -2.279606, -4.172157, 1, 1, 1, 1, 1,
-0.4407571, -1.565361, -2.621876, 1, 1, 1, 1, 1,
-0.4390232, -0.45632, -2.963465, 1, 1, 1, 1, 1,
-0.4382734, 0.6178038, 0.1098292, 1, 1, 1, 1, 1,
-0.4357503, 1.013224, -0.2636414, 1, 1, 1, 1, 1,
-0.4271333, 0.1160741, -1.853142, 1, 1, 1, 1, 1,
-0.4261648, 1.259716, -1.107553, 1, 1, 1, 1, 1,
-0.4257862, 0.088989, -1.559485, 1, 1, 1, 1, 1,
-0.4189979, 1.239158, -2.223148, 1, 1, 1, 1, 1,
-0.4135791, -0.2337292, -1.562253, 1, 1, 1, 1, 1,
-0.4109329, 0.6704434, -1.2577, 1, 1, 1, 1, 1,
-0.4095011, -0.2162025, -1.459404, 1, 1, 1, 1, 1,
-0.4038422, -1.656305, -1.392168, 1, 1, 1, 1, 1,
-0.4014126, -2.381761, -2.808969, 0, 0, 1, 1, 1,
-0.3977795, -0.1741572, -2.374761, 1, 0, 0, 1, 1,
-0.3968081, 0.2040058, -1.025772, 1, 0, 0, 1, 1,
-0.3961945, 0.923148, 0.268325, 1, 0, 0, 1, 1,
-0.3928986, 0.1966342, -1.699971, 1, 0, 0, 1, 1,
-0.3908255, -0.5415714, -3.720914, 1, 0, 0, 1, 1,
-0.3896575, -1.004788, -2.13767, 0, 0, 0, 1, 1,
-0.383982, -0.199089, -0.1795367, 0, 0, 0, 1, 1,
-0.382502, -0.2806548, -2.973047, 0, 0, 0, 1, 1,
-0.3812181, -2.074747, -3.269528, 0, 0, 0, 1, 1,
-0.3795221, 0.7134006, 0.6650484, 0, 0, 0, 1, 1,
-0.3785822, -1.496788, -4.445588, 0, 0, 0, 1, 1,
-0.3715204, -0.2761923, -1.626866, 0, 0, 0, 1, 1,
-0.3688257, -0.8210257, -2.719538, 1, 1, 1, 1, 1,
-0.3652017, 0.148244, -1.134389, 1, 1, 1, 1, 1,
-0.3565701, -1.522986, -4.116427, 1, 1, 1, 1, 1,
-0.3515308, 1.245671, 0.1214729, 1, 1, 1, 1, 1,
-0.3515095, -0.9745334, -3.089633, 1, 1, 1, 1, 1,
-0.3505895, -0.421435, -3.215634, 1, 1, 1, 1, 1,
-0.3463829, -0.1233633, -3.129436, 1, 1, 1, 1, 1,
-0.3440319, 1.502006, -1.327166, 1, 1, 1, 1, 1,
-0.3402168, -1.344274, -4.099306, 1, 1, 1, 1, 1,
-0.3359701, 0.3765047, -0.8109619, 1, 1, 1, 1, 1,
-0.3352854, 1.34942, -0.1582527, 1, 1, 1, 1, 1,
-0.3335077, 0.3071588, 0.9536401, 1, 1, 1, 1, 1,
-0.3310814, -0.09877655, -2.453521, 1, 1, 1, 1, 1,
-0.3308516, -0.2696161, -2.707012, 1, 1, 1, 1, 1,
-0.3247993, -0.1718044, -2.037743, 1, 1, 1, 1, 1,
-0.3210912, -0.4640201, -2.180456, 0, 0, 1, 1, 1,
-0.3204621, -0.3481505, -2.809561, 1, 0, 0, 1, 1,
-0.317577, -0.820628, -4.619838, 1, 0, 0, 1, 1,
-0.3168867, 1.646395, 0.802458, 1, 0, 0, 1, 1,
-0.3104518, 1.791097, -0.2710067, 1, 0, 0, 1, 1,
-0.310284, -1.760728, -3.416386, 1, 0, 0, 1, 1,
-0.3085084, 1.48337, -0.738636, 0, 0, 0, 1, 1,
-0.2988065, -0.7299351, -2.679734, 0, 0, 0, 1, 1,
-0.298791, 0.5497318, -0.387642, 0, 0, 0, 1, 1,
-0.2955844, 1.645272, -0.8951746, 0, 0, 0, 1, 1,
-0.2892214, -0.216553, -3.655569, 0, 0, 0, 1, 1,
-0.2889936, -0.5772139, -1.406533, 0, 0, 0, 1, 1,
-0.2845451, 1.358234, 0.9211649, 0, 0, 0, 1, 1,
-0.2841998, 1.308352, -0.1044158, 1, 1, 1, 1, 1,
-0.2770573, -0.8069051, -3.287314, 1, 1, 1, 1, 1,
-0.2694239, -0.4570791, -1.83567, 1, 1, 1, 1, 1,
-0.2647566, 0.1746516, -0.4085188, 1, 1, 1, 1, 1,
-0.2606128, -0.5229299, -2.524095, 1, 1, 1, 1, 1,
-0.2587385, 0.02491816, -0.7708336, 1, 1, 1, 1, 1,
-0.2571539, 0.568593, 0.3893684, 1, 1, 1, 1, 1,
-0.2480937, -0.1484159, -2.192838, 1, 1, 1, 1, 1,
-0.2293068, -1.029425, -3.702293, 1, 1, 1, 1, 1,
-0.2258991, -0.9838505, -5.167563, 1, 1, 1, 1, 1,
-0.2221663, 0.1445484, -1.637532, 1, 1, 1, 1, 1,
-0.2210007, 0.1751484, -1.728989, 1, 1, 1, 1, 1,
-0.2204254, -0.8191211, -3.532416, 1, 1, 1, 1, 1,
-0.2113705, -0.225384, -3.883492, 1, 1, 1, 1, 1,
-0.2111134, -0.2032401, -2.646393, 1, 1, 1, 1, 1,
-0.2089812, 1.708922, 1.874004, 0, 0, 1, 1, 1,
-0.2069372, 1.874788, 0.1867222, 1, 0, 0, 1, 1,
-0.2043136, 1.20529, -0.7627878, 1, 0, 0, 1, 1,
-0.2038917, 0.7219341, -0.1793473, 1, 0, 0, 1, 1,
-0.2028261, 0.8725563, -1.773591, 1, 0, 0, 1, 1,
-0.1947803, -1.067664, -3.389623, 1, 0, 0, 1, 1,
-0.1945562, -1.328615, -4.000674, 0, 0, 0, 1, 1,
-0.1903878, 1.210381, -0.5405541, 0, 0, 0, 1, 1,
-0.188684, -1.177787, -1.697365, 0, 0, 0, 1, 1,
-0.1886823, 0.4964843, -0.5455574, 0, 0, 0, 1, 1,
-0.185277, -1.257917, -1.366377, 0, 0, 0, 1, 1,
-0.183624, -0.6201875, -4.001109, 0, 0, 0, 1, 1,
-0.1827944, 1.919771, -0.4647321, 0, 0, 0, 1, 1,
-0.1713554, -0.3091687, -1.450413, 1, 1, 1, 1, 1,
-0.1697704, -1.260031, -4.386406, 1, 1, 1, 1, 1,
-0.1680042, 1.140593, -0.7698796, 1, 1, 1, 1, 1,
-0.1676718, -0.1502609, -2.491251, 1, 1, 1, 1, 1,
-0.1662114, -0.01669245, -1.76956, 1, 1, 1, 1, 1,
-0.165292, -2.472113, -2.627157, 1, 1, 1, 1, 1,
-0.1623008, 1.031095, -1.267039, 1, 1, 1, 1, 1,
-0.160759, 2.303933, 1.619754, 1, 1, 1, 1, 1,
-0.1559266, 0.5421779, 0.2676579, 1, 1, 1, 1, 1,
-0.155486, 1.105287, -0.8600655, 1, 1, 1, 1, 1,
-0.1520676, 0.4257561, -0.9490633, 1, 1, 1, 1, 1,
-0.1482934, -0.5030914, -3.842378, 1, 1, 1, 1, 1,
-0.1469483, 0.1208302, -3.798407, 1, 1, 1, 1, 1,
-0.1466843, 0.1003427, -2.80105, 1, 1, 1, 1, 1,
-0.1394992, -0.170874, -3.606978, 1, 1, 1, 1, 1,
-0.1351385, 1.434236, -1.32044, 0, 0, 1, 1, 1,
-0.1347051, -0.6380323, -1.159395, 1, 0, 0, 1, 1,
-0.1334893, 0.3424901, -0.8161606, 1, 0, 0, 1, 1,
-0.1304781, -0.9080892, -4.152777, 1, 0, 0, 1, 1,
-0.1267595, -1.73665, -2.874307, 1, 0, 0, 1, 1,
-0.1261375, -1.027001, -0.4180088, 1, 0, 0, 1, 1,
-0.1250441, 0.1595227, -0.8171547, 0, 0, 0, 1, 1,
-0.1217729, -0.689024, -2.437525, 0, 0, 0, 1, 1,
-0.1194117, -0.3534245, -1.907253, 0, 0, 0, 1, 1,
-0.1174374, -0.3214433, -2.3803, 0, 0, 0, 1, 1,
-0.1172381, 0.8537518, -0.1649705, 0, 0, 0, 1, 1,
-0.1154978, -1.118546, -3.883292, 0, 0, 0, 1, 1,
-0.1118605, 1.237361, -0.3742796, 0, 0, 0, 1, 1,
-0.1116707, -2.047455, -3.091737, 1, 1, 1, 1, 1,
-0.109603, 0.4331971, 1.501471, 1, 1, 1, 1, 1,
-0.1023668, -0.04018089, -3.340167, 1, 1, 1, 1, 1,
-0.09883372, -0.3370946, -1.778375, 1, 1, 1, 1, 1,
-0.09722248, -0.5850226, -2.219762, 1, 1, 1, 1, 1,
-0.09608105, 1.166827, -0.2394616, 1, 1, 1, 1, 1,
-0.094559, -0.8996887, -3.25288, 1, 1, 1, 1, 1,
-0.09225216, -0.3349879, -3.379474, 1, 1, 1, 1, 1,
-0.08705685, -2.140304, -2.970103, 1, 1, 1, 1, 1,
-0.0855757, 0.7171364, -0.6633173, 1, 1, 1, 1, 1,
-0.08421334, -0.1367211, -2.814887, 1, 1, 1, 1, 1,
-0.0834154, 0.05688334, 0.4961794, 1, 1, 1, 1, 1,
-0.08316381, 3.401273, 0.7474779, 1, 1, 1, 1, 1,
-0.07907556, 1.080787, -0.1653546, 1, 1, 1, 1, 1,
-0.07650527, -0.7252344, -2.410305, 1, 1, 1, 1, 1,
-0.07598711, -0.4998966, -2.43482, 0, 0, 1, 1, 1,
-0.0757023, -0.1762792, -1.731924, 1, 0, 0, 1, 1,
-0.07199469, 2.084258, -0.3106013, 1, 0, 0, 1, 1,
-0.07065585, -0.6171222, -3.371617, 1, 0, 0, 1, 1,
-0.06903988, 0.2033258, -0.06964588, 1, 0, 0, 1, 1,
-0.06719781, -0.1432026, -4.314515, 1, 0, 0, 1, 1,
-0.06586365, -0.7225055, -3.075748, 0, 0, 0, 1, 1,
-0.05874876, 1.167093, 0.3700227, 0, 0, 0, 1, 1,
-0.05536329, -0.2122308, -2.720709, 0, 0, 0, 1, 1,
-0.04928088, 0.5753986, -1.426824, 0, 0, 0, 1, 1,
-0.04818605, -0.09220437, -2.542497, 0, 0, 0, 1, 1,
-0.04759829, 0.01668743, -1.350024, 0, 0, 0, 1, 1,
-0.04538168, -0.6433581, -2.431046, 0, 0, 0, 1, 1,
-0.04520465, 0.3869184, -0.7844468, 1, 1, 1, 1, 1,
-0.0449059, 1.953761, -0.7805253, 1, 1, 1, 1, 1,
-0.04366072, -1.099535, -3.178752, 1, 1, 1, 1, 1,
-0.0427784, 0.1171266, 0.1434398, 1, 1, 1, 1, 1,
-0.04228079, -1.423585, -3.705118, 1, 1, 1, 1, 1,
-0.04096081, -1.131776, -3.161029, 1, 1, 1, 1, 1,
-0.03843373, -0.207996, -4.046665, 1, 1, 1, 1, 1,
-0.0369386, -0.4835031, -2.971139, 1, 1, 1, 1, 1,
-0.03121077, -0.2200115, -4.107567, 1, 1, 1, 1, 1,
-0.02910355, -0.05007265, -3.795544, 1, 1, 1, 1, 1,
-0.02387688, -0.9970533, -2.420309, 1, 1, 1, 1, 1,
-0.01915331, 0.3294211, 1.127243, 1, 1, 1, 1, 1,
-0.01324521, -0.7162659, -4.963775, 1, 1, 1, 1, 1,
-0.008556255, 0.1153278, -0.1485642, 1, 1, 1, 1, 1,
-0.007249023, 0.8075465, -0.8163049, 1, 1, 1, 1, 1,
-0.005053522, -0.879945, -3.691377, 0, 0, 1, 1, 1,
-0.001606497, -0.1351406, -3.577636, 1, 0, 0, 1, 1,
0.001793913, -0.3946791, 0.7369935, 1, 0, 0, 1, 1,
0.003012275, 0.196163, 0.082635, 1, 0, 0, 1, 1,
0.006349505, -0.4861147, 3.776818, 1, 0, 0, 1, 1,
0.00658311, 0.5553428, -1.065275, 1, 0, 0, 1, 1,
0.009566744, -2.301887, 1.943079, 0, 0, 0, 1, 1,
0.01038779, -0.4553085, 2.203249, 0, 0, 0, 1, 1,
0.01267616, 0.5345715, 0.0342927, 0, 0, 0, 1, 1,
0.01269955, -0.8705609, 3.772725, 0, 0, 0, 1, 1,
0.01689878, 1.537141, 0.527629, 0, 0, 0, 1, 1,
0.02193252, -0.9733285, 2.796599, 0, 0, 0, 1, 1,
0.02630521, 0.7891605, 0.2101775, 0, 0, 0, 1, 1,
0.02831948, -0.4766871, 2.544264, 1, 1, 1, 1, 1,
0.02909098, -1.170771, 4.89322, 1, 1, 1, 1, 1,
0.02980603, -0.1574867, 2.89616, 1, 1, 1, 1, 1,
0.0300741, -0.1201427, 2.710611, 1, 1, 1, 1, 1,
0.03687811, 0.2971751, 0.4519432, 1, 1, 1, 1, 1,
0.03808459, 1.585568, -0.6807146, 1, 1, 1, 1, 1,
0.04017974, -0.9134488, 1.57712, 1, 1, 1, 1, 1,
0.04159898, 0.5692915, 0.2697827, 1, 1, 1, 1, 1,
0.04408981, 0.3270066, 0.8055812, 1, 1, 1, 1, 1,
0.04638816, -0.8630807, 4.224138, 1, 1, 1, 1, 1,
0.04690664, -0.09694985, 2.500461, 1, 1, 1, 1, 1,
0.0496309, 0.398627, -0.3949682, 1, 1, 1, 1, 1,
0.0530533, 2.812025, -1.470726, 1, 1, 1, 1, 1,
0.06095027, -0.9929038, 3.328547, 1, 1, 1, 1, 1,
0.06171673, -0.8705176, 1.787175, 1, 1, 1, 1, 1,
0.06264633, -0.8065857, 3.922457, 0, 0, 1, 1, 1,
0.06497562, 0.02236984, 1.278611, 1, 0, 0, 1, 1,
0.06926107, -0.5229804, 3.688506, 1, 0, 0, 1, 1,
0.07149981, 0.5377488, -0.7355159, 1, 0, 0, 1, 1,
0.07290526, 0.03033547, 1.217268, 1, 0, 0, 1, 1,
0.07342432, 1.523268, -0.5682034, 1, 0, 0, 1, 1,
0.07698353, 0.5311524, -0.5416564, 0, 0, 0, 1, 1,
0.08188302, 1.696312, 1.833504, 0, 0, 0, 1, 1,
0.08199061, -0.0836173, 2.703072, 0, 0, 0, 1, 1,
0.08286819, -0.3668528, 4.721837, 0, 0, 0, 1, 1,
0.08477643, -0.07925501, 2.599577, 0, 0, 0, 1, 1,
0.08644966, 0.4124992, 0.4014958, 0, 0, 0, 1, 1,
0.09034077, -1.387272, 2.982977, 0, 0, 0, 1, 1,
0.09140626, 0.407425, 1.958485, 1, 1, 1, 1, 1,
0.09231721, -0.2109743, 2.454215, 1, 1, 1, 1, 1,
0.0928533, -1.59418, 3.1456, 1, 1, 1, 1, 1,
0.0952924, 0.9898477, 0.08589309, 1, 1, 1, 1, 1,
0.09626222, 0.2406628, 1.007899, 1, 1, 1, 1, 1,
0.1027587, -0.7757894, 3.272167, 1, 1, 1, 1, 1,
0.1032059, 1.439995, -0.5522851, 1, 1, 1, 1, 1,
0.1127912, 0.3687494, 0.2172688, 1, 1, 1, 1, 1,
0.1132964, -1.036227, 3.610492, 1, 1, 1, 1, 1,
0.1144648, 0.4514913, -0.7307085, 1, 1, 1, 1, 1,
0.1156387, -0.2991383, 2.797692, 1, 1, 1, 1, 1,
0.11875, 0.6719955, 1.454671, 1, 1, 1, 1, 1,
0.1300102, -1.975175, 5.597932, 1, 1, 1, 1, 1,
0.1342764, 0.6657761, -1.13089, 1, 1, 1, 1, 1,
0.1392125, -1.735688, 2.256603, 1, 1, 1, 1, 1,
0.1450604, 0.970575, -0.3010105, 0, 0, 1, 1, 1,
0.1492227, -2.194455, 3.335489, 1, 0, 0, 1, 1,
0.1494532, -0.7444854, 4.883068, 1, 0, 0, 1, 1,
0.1556509, 0.02218981, 3.572229, 1, 0, 0, 1, 1,
0.157917, -0.2151715, 3.237192, 1, 0, 0, 1, 1,
0.1586349, 1.390011, -0.8507284, 1, 0, 0, 1, 1,
0.1586433, 0.7496036, 0.7592698, 0, 0, 0, 1, 1,
0.1672026, -0.352129, 2.440886, 0, 0, 0, 1, 1,
0.1686315, -0.4597272, 1.992038, 0, 0, 0, 1, 1,
0.1693504, -0.1140383, 1.619021, 0, 0, 0, 1, 1,
0.1713838, -0.07497302, 1.890209, 0, 0, 0, 1, 1,
0.1730174, -0.5197405, 1.951378, 0, 0, 0, 1, 1,
0.1772652, -1.510839, 3.753425, 0, 0, 0, 1, 1,
0.1795169, 0.0884648, 1.400407, 1, 1, 1, 1, 1,
0.1807121, 1.598005, 0.2894374, 1, 1, 1, 1, 1,
0.1840298, 1.027419, 0.003918853, 1, 1, 1, 1, 1,
0.1841073, 0.9507769, 1.209842, 1, 1, 1, 1, 1,
0.1850019, -0.2130656, 2.88343, 1, 1, 1, 1, 1,
0.1961568, 0.668322, 1.117709, 1, 1, 1, 1, 1,
0.1976511, -1.490127, 2.367071, 1, 1, 1, 1, 1,
0.2012836, -0.8399133, 3.721301, 1, 1, 1, 1, 1,
0.2029598, -0.0160399, 1.633638, 1, 1, 1, 1, 1,
0.2069942, -1.562886, 4.035915, 1, 1, 1, 1, 1,
0.2078925, -0.2817712, 3.017108, 1, 1, 1, 1, 1,
0.2079256, 0.812983, 0.2377743, 1, 1, 1, 1, 1,
0.2083263, 0.8185639, -0.7230932, 1, 1, 1, 1, 1,
0.2115732, 0.1869777, 0.9811981, 1, 1, 1, 1, 1,
0.2130955, -0.5428854, 3.066411, 1, 1, 1, 1, 1,
0.2136569, 2.396492, -1.14208, 0, 0, 1, 1, 1,
0.2151227, 0.1248127, 0.7373967, 1, 0, 0, 1, 1,
0.2222353, 0.4207712, 0.7881746, 1, 0, 0, 1, 1,
0.2266967, -0.5928816, 2.256083, 1, 0, 0, 1, 1,
0.2338884, -0.7402019, 2.457169, 1, 0, 0, 1, 1,
0.2368352, -2.034663, 3.724293, 1, 0, 0, 1, 1,
0.2379041, -0.01199886, 3.706624, 0, 0, 0, 1, 1,
0.2436143, 0.9266255, 1.567332, 0, 0, 0, 1, 1,
0.2445533, -1.003224, 2.904087, 0, 0, 0, 1, 1,
0.253189, 0.7267631, -2.043385, 0, 0, 0, 1, 1,
0.2532676, -0.202128, 1.808835, 0, 0, 0, 1, 1,
0.2550091, -0.9420586, 5.664792, 0, 0, 0, 1, 1,
0.2579669, 0.1863326, -0.9699258, 0, 0, 0, 1, 1,
0.2581067, -1.370852, 1.759492, 1, 1, 1, 1, 1,
0.2640286, -2.029049, 1.834946, 1, 1, 1, 1, 1,
0.2654398, 1.037485, 0.4390172, 1, 1, 1, 1, 1,
0.2666192, 0.5895419, 0.4096361, 1, 1, 1, 1, 1,
0.2683846, 1.332591, 0.4834208, 1, 1, 1, 1, 1,
0.2692773, -0.1857955, 2.534706, 1, 1, 1, 1, 1,
0.2694461, 0.5307335, 1.524527, 1, 1, 1, 1, 1,
0.2717829, 0.3341452, 1.344459, 1, 1, 1, 1, 1,
0.2722271, -1.105479, 5.103062, 1, 1, 1, 1, 1,
0.2755798, -0.3366221, 1.806474, 1, 1, 1, 1, 1,
0.2771515, 0.7305817, -0.5282789, 1, 1, 1, 1, 1,
0.2839621, -0.3210858, 2.964913, 1, 1, 1, 1, 1,
0.2846889, 0.441217, 1.55199, 1, 1, 1, 1, 1,
0.2881199, -1.249136, 2.629315, 1, 1, 1, 1, 1,
0.2887878, 0.1121148, 0.2727761, 1, 1, 1, 1, 1,
0.2889116, 0.1092393, 2.984631, 0, 0, 1, 1, 1,
0.2914166, -0.214257, 2.638685, 1, 0, 0, 1, 1,
0.2915795, -0.5476105, 2.40043, 1, 0, 0, 1, 1,
0.2917336, -0.2526706, 3.682578, 1, 0, 0, 1, 1,
0.2944318, 1.051756, 0.1043347, 1, 0, 0, 1, 1,
0.2944855, 1.281007, 1.878072, 1, 0, 0, 1, 1,
0.2950372, 0.4771225, 1.086194, 0, 0, 0, 1, 1,
0.2979885, 0.2980835, 0.5074624, 0, 0, 0, 1, 1,
0.3020765, -1.612047, 3.482507, 0, 0, 0, 1, 1,
0.3025515, 0.08384101, 0.6728731, 0, 0, 0, 1, 1,
0.3034338, -0.2136156, 4.278274, 0, 0, 0, 1, 1,
0.3056163, -0.03300536, 0.9134494, 0, 0, 0, 1, 1,
0.3093492, -1.067126, 2.993652, 0, 0, 0, 1, 1,
0.3097953, 0.5292999, 2.102431, 1, 1, 1, 1, 1,
0.3106022, 0.6470671, 1.733367, 1, 1, 1, 1, 1,
0.3113242, -1.256576, 1.976027, 1, 1, 1, 1, 1,
0.316657, 0.4005834, 0.4492205, 1, 1, 1, 1, 1,
0.3292892, 0.04717929, 0.7652981, 1, 1, 1, 1, 1,
0.330217, -0.2578896, 1.411628, 1, 1, 1, 1, 1,
0.3331541, 0.592379, 0.05606978, 1, 1, 1, 1, 1,
0.333313, -2.397094, 3.657527, 1, 1, 1, 1, 1,
0.3408618, 0.4185441, 1.113614, 1, 1, 1, 1, 1,
0.3419911, -0.837944, 3.94416, 1, 1, 1, 1, 1,
0.3467451, -1.016494, 3.016633, 1, 1, 1, 1, 1,
0.3475872, -1.731829, 3.352116, 1, 1, 1, 1, 1,
0.3586689, 0.5750421, 1.671304, 1, 1, 1, 1, 1,
0.3601483, -1.906379, 3.846547, 1, 1, 1, 1, 1,
0.3618881, 0.5087816, 1.557777, 1, 1, 1, 1, 1,
0.3623248, -0.57044, 2.587437, 0, 0, 1, 1, 1,
0.3655661, -0.1451456, 2.814626, 1, 0, 0, 1, 1,
0.3673419, 0.1859575, 1.854537, 1, 0, 0, 1, 1,
0.3679609, 0.2148848, -0.5168841, 1, 0, 0, 1, 1,
0.3709951, -0.3055504, 3.847546, 1, 0, 0, 1, 1,
0.3740303, -0.2743201, 2.705477, 1, 0, 0, 1, 1,
0.3810245, 0.2896614, 0.8072156, 0, 0, 0, 1, 1,
0.3901245, 0.9890786, 0.9488389, 0, 0, 0, 1, 1,
0.3919802, -0.6484558, 4.143003, 0, 0, 0, 1, 1,
0.3933711, 0.5876399, 0.6297216, 0, 0, 0, 1, 1,
0.3945583, 0.5988107, -0.1367672, 0, 0, 0, 1, 1,
0.4003151, -0.1998109, 3.100349, 0, 0, 0, 1, 1,
0.4013803, 2.084457, 0.7520816, 0, 0, 0, 1, 1,
0.4049521, 0.1284267, 1.417838, 1, 1, 1, 1, 1,
0.4097212, 0.3063495, 0.8787412, 1, 1, 1, 1, 1,
0.4105913, 0.4979313, 2.197496, 1, 1, 1, 1, 1,
0.410679, 1.403822, -0.9424732, 1, 1, 1, 1, 1,
0.4226368, 0.6966258, 0.6048017, 1, 1, 1, 1, 1,
0.4228178, -0.7135541, 3.735194, 1, 1, 1, 1, 1,
0.4332674, 1.527448, 0.9020011, 1, 1, 1, 1, 1,
0.4335352, -0.01855684, -0.8291439, 1, 1, 1, 1, 1,
0.4359432, -1.010101, 2.317001, 1, 1, 1, 1, 1,
0.436184, 0.04488083, 1.976603, 1, 1, 1, 1, 1,
0.4389189, -0.2354597, 2.45629, 1, 1, 1, 1, 1,
0.439819, 0.2931564, -0.7677901, 1, 1, 1, 1, 1,
0.440356, 2.475497, -1.09217, 1, 1, 1, 1, 1,
0.4445735, 0.2520202, -0.2169572, 1, 1, 1, 1, 1,
0.4499402, 0.1421974, 1.504597, 1, 1, 1, 1, 1,
0.451197, 0.8775413, 0.2158685, 0, 0, 1, 1, 1,
0.4521395, -2.981057, 3.180496, 1, 0, 0, 1, 1,
0.4523391, 0.870437, 1.445939, 1, 0, 0, 1, 1,
0.4543478, 0.1319551, -1.281629, 1, 0, 0, 1, 1,
0.4545504, 0.9989048, 1.137472, 1, 0, 0, 1, 1,
0.4593726, -1.042848, 3.912787, 1, 0, 0, 1, 1,
0.4643034, 1.454717, -0.8581238, 0, 0, 0, 1, 1,
0.4652734, -0.9555527, 2.548892, 0, 0, 0, 1, 1,
0.4752189, 1.11844, 0.9857786, 0, 0, 0, 1, 1,
0.4768263, -0.1596496, 1.09676, 0, 0, 0, 1, 1,
0.4801568, -1.728613, 2.949534, 0, 0, 0, 1, 1,
0.4815261, 0.4993358, 0.2444478, 0, 0, 0, 1, 1,
0.4829333, -1.445566, 2.483057, 0, 0, 0, 1, 1,
0.4832808, 1.38765, 1.334868, 1, 1, 1, 1, 1,
0.486876, -0.7920971, 2.520188, 1, 1, 1, 1, 1,
0.4870203, -1.961775, 2.01836, 1, 1, 1, 1, 1,
0.4879302, -0.4837938, 2.392969, 1, 1, 1, 1, 1,
0.4903974, -1.462046, 2.595357, 1, 1, 1, 1, 1,
0.4908468, -0.6604052, 2.817803, 1, 1, 1, 1, 1,
0.494828, 0.02449936, 1.868897, 1, 1, 1, 1, 1,
0.4982819, 2.056502, 0.4157754, 1, 1, 1, 1, 1,
0.4986975, -0.04071243, 1.145984, 1, 1, 1, 1, 1,
0.5041701, -0.8599691, 1.882445, 1, 1, 1, 1, 1,
0.5045325, 0.1404054, 0.5874044, 1, 1, 1, 1, 1,
0.5064867, -0.1623943, 0.6708904, 1, 1, 1, 1, 1,
0.5116384, -0.5810496, 2.694288, 1, 1, 1, 1, 1,
0.5132211, 0.8479128, -0.3240668, 1, 1, 1, 1, 1,
0.5159978, 0.9783854, 0.1323662, 1, 1, 1, 1, 1,
0.5334545, -0.1686513, 2.039788, 0, 0, 1, 1, 1,
0.533864, -1.075559, 2.872457, 1, 0, 0, 1, 1,
0.5346055, 0.3057139, 0.9551977, 1, 0, 0, 1, 1,
0.536883, 0.1743995, 0.5129163, 1, 0, 0, 1, 1,
0.5385838, -0.5976775, 2.112963, 1, 0, 0, 1, 1,
0.5386887, -1.150524, 2.765805, 1, 0, 0, 1, 1,
0.5397002, 0.1740687, 1.673091, 0, 0, 0, 1, 1,
0.5423844, -0.3341536, 3.084238, 0, 0, 0, 1, 1,
0.5433075, 1.834296, 0.8335787, 0, 0, 0, 1, 1,
0.5476049, -0.5572978, 3.955508, 0, 0, 0, 1, 1,
0.552784, 0.966943, 1.055918, 0, 0, 0, 1, 1,
0.5621765, 0.1609926, 0.1805571, 0, 0, 0, 1, 1,
0.564561, -0.3232464, 1.686698, 0, 0, 0, 1, 1,
0.5678763, 0.1578936, 1.315876, 1, 1, 1, 1, 1,
0.5721112, -0.6676486, -0.1862884, 1, 1, 1, 1, 1,
0.5770163, -0.4172025, 3.491324, 1, 1, 1, 1, 1,
0.5777634, 0.252258, 1.417243, 1, 1, 1, 1, 1,
0.5828817, 0.4998014, -0.8838454, 1, 1, 1, 1, 1,
0.5829814, 0.02670365, 1.628994, 1, 1, 1, 1, 1,
0.5863987, 0.2242001, 1.364696, 1, 1, 1, 1, 1,
0.5922686, 0.4659377, -1.056226, 1, 1, 1, 1, 1,
0.5940048, -1.595699, 2.590759, 1, 1, 1, 1, 1,
0.594187, -0.5372667, 1.898874, 1, 1, 1, 1, 1,
0.5992704, 0.1178865, 2.233892, 1, 1, 1, 1, 1,
0.6019486, 1.24895, 1.347228, 1, 1, 1, 1, 1,
0.6038943, 1.072295, 1.030509, 1, 1, 1, 1, 1,
0.6047583, 1.242441, 0.3942408, 1, 1, 1, 1, 1,
0.6065435, 1.692569, 0.3208915, 1, 1, 1, 1, 1,
0.6165474, -1.095792, 3.738051, 0, 0, 1, 1, 1,
0.6219399, -0.8308138, 4.261434, 1, 0, 0, 1, 1,
0.62481, 1.633446, -0.2060191, 1, 0, 0, 1, 1,
0.6266566, -1.938486, 3.957856, 1, 0, 0, 1, 1,
0.627421, -0.1063201, 1.396571, 1, 0, 0, 1, 1,
0.6281259, 0.2543807, 1.115919, 1, 0, 0, 1, 1,
0.6293138, -1.846238, 0.6014001, 0, 0, 0, 1, 1,
0.6302909, 1.107309, 0.110952, 0, 0, 0, 1, 1,
0.6311997, 0.6575719, 1.264036, 0, 0, 0, 1, 1,
0.6387022, 0.6046695, 1.43275, 0, 0, 0, 1, 1,
0.6387188, 0.7116246, 1.134935, 0, 0, 0, 1, 1,
0.6418466, -0.4737921, 0.7903991, 0, 0, 0, 1, 1,
0.6459659, 0.1199114, 2.348525, 0, 0, 0, 1, 1,
0.6505954, 0.03039335, 1.097895, 1, 1, 1, 1, 1,
0.651248, 0.1645753, 0.6119662, 1, 1, 1, 1, 1,
0.654656, -0.2543416, 1.049476, 1, 1, 1, 1, 1,
0.655372, 0.9427863, 2.213992, 1, 1, 1, 1, 1,
0.6558871, 0.1179577, -0.03376029, 1, 1, 1, 1, 1,
0.656155, 1.878848, 0.6096384, 1, 1, 1, 1, 1,
0.6601856, -0.1718985, 3.115841, 1, 1, 1, 1, 1,
0.6630975, -1.381403, 2.783171, 1, 1, 1, 1, 1,
0.6639394, -0.821891, 1.341944, 1, 1, 1, 1, 1,
0.6643608, -0.4191086, 1.870992, 1, 1, 1, 1, 1,
0.66442, 1.246956, -1.333721, 1, 1, 1, 1, 1,
0.6654266, 0.7999453, 2.853422, 1, 1, 1, 1, 1,
0.6655277, 0.9470866, 0.2095586, 1, 1, 1, 1, 1,
0.66982, -0.004344516, 2.285367, 1, 1, 1, 1, 1,
0.6713828, 0.2650688, -0.1502437, 1, 1, 1, 1, 1,
0.684868, 0.5448854, 0.02551051, 0, 0, 1, 1, 1,
0.6975734, -0.3507748, 2.089986, 1, 0, 0, 1, 1,
0.6987708, -1.164279, 3.889361, 1, 0, 0, 1, 1,
0.7010857, -1.186166, 3.181594, 1, 0, 0, 1, 1,
0.7011447, -0.229122, 3.076851, 1, 0, 0, 1, 1,
0.7040723, 0.714999, 0.516913, 1, 0, 0, 1, 1,
0.704328, 0.9173054, 1.354515, 0, 0, 0, 1, 1,
0.7047712, 1.642434, 1.575756, 0, 0, 0, 1, 1,
0.7069773, 0.514916, -0.3635553, 0, 0, 0, 1, 1,
0.7279856, -0.6136352, 1.466577, 0, 0, 0, 1, 1,
0.7308703, -0.2891231, 3.026204, 0, 0, 0, 1, 1,
0.7310061, 0.1114175, 0.498849, 0, 0, 0, 1, 1,
0.7350249, -0.7584553, 3.504452, 0, 0, 0, 1, 1,
0.7471835, -1.749627, 3.734864, 1, 1, 1, 1, 1,
0.7480694, 0.2140775, 1.418481, 1, 1, 1, 1, 1,
0.7503445, 0.4284858, 2.063293, 1, 1, 1, 1, 1,
0.7548941, 0.4188246, 1.960873, 1, 1, 1, 1, 1,
0.758195, -1.190218, 2.804873, 1, 1, 1, 1, 1,
0.7582998, 0.4742777, 0.9605708, 1, 1, 1, 1, 1,
0.758991, -0.3174052, 1.900457, 1, 1, 1, 1, 1,
0.7614936, 0.2589771, 1.620495, 1, 1, 1, 1, 1,
0.7646743, -0.4962517, 1.287531, 1, 1, 1, 1, 1,
0.7654913, -0.2188295, 1.914266, 1, 1, 1, 1, 1,
0.7737413, 0.259387, 2.157565, 1, 1, 1, 1, 1,
0.7754229, 0.07528765, 0.3041433, 1, 1, 1, 1, 1,
0.7793571, 0.9247062, -0.5224431, 1, 1, 1, 1, 1,
0.7822037, -0.6666158, 2.105247, 1, 1, 1, 1, 1,
0.7823016, -0.1255077, 1.280919, 1, 1, 1, 1, 1,
0.7833272, 0.203587, 2.773996, 0, 0, 1, 1, 1,
0.786042, -0.5860252, 2.507611, 1, 0, 0, 1, 1,
0.7887058, -0.4740037, 2.141031, 1, 0, 0, 1, 1,
0.7955305, 0.4638117, -0.02496632, 1, 0, 0, 1, 1,
0.7967117, -0.3374379, 1.790852, 1, 0, 0, 1, 1,
0.7995007, 2.146167, 1.740814, 1, 0, 0, 1, 1,
0.8032582, 1.361019, -1.410778, 0, 0, 0, 1, 1,
0.8061972, 1.202189, -0.1099206, 0, 0, 0, 1, 1,
0.8065516, -0.7714893, 2.316664, 0, 0, 0, 1, 1,
0.8084903, 0.6324068, -0.6833379, 0, 0, 0, 1, 1,
0.8122919, -1.921693, 3.167513, 0, 0, 0, 1, 1,
0.8137265, -0.1103635, 1.997489, 0, 0, 0, 1, 1,
0.8203834, 0.8506508, 0.8206552, 0, 0, 0, 1, 1,
0.8233039, 0.4657606, 2.550092, 1, 1, 1, 1, 1,
0.8334749, 2.045959, -0.7697324, 1, 1, 1, 1, 1,
0.8338136, 0.8478159, 1.680382, 1, 1, 1, 1, 1,
0.8344814, -0.5304952, 2.401692, 1, 1, 1, 1, 1,
0.8397255, -0.8689196, 1.554523, 1, 1, 1, 1, 1,
0.8458072, -0.6949354, 2.844968, 1, 1, 1, 1, 1,
0.8496453, -0.5048402, 2.212808, 1, 1, 1, 1, 1,
0.8500986, 0.5252477, 0.8668773, 1, 1, 1, 1, 1,
0.8516222, -0.9482344, 4.505164, 1, 1, 1, 1, 1,
0.8520604, -0.5716488, 2.050714, 1, 1, 1, 1, 1,
0.8526817, 1.215474, 0.7435788, 1, 1, 1, 1, 1,
0.8537769, -1.693622, 3.659669, 1, 1, 1, 1, 1,
0.8583856, 0.7727268, 1.619536, 1, 1, 1, 1, 1,
0.8631902, 0.2789326, 3.470436, 1, 1, 1, 1, 1,
0.8695241, -0.05246919, 1.532514, 1, 1, 1, 1, 1,
0.8728886, -0.6657563, 1.683423, 0, 0, 1, 1, 1,
0.8770636, 0.09042138, 0.3409725, 1, 0, 0, 1, 1,
0.8771223, 0.9431461, 0.9096054, 1, 0, 0, 1, 1,
0.8818941, 0.42924, 0.5413656, 1, 0, 0, 1, 1,
0.884684, -0.5238435, 1.767471, 1, 0, 0, 1, 1,
0.8872385, 1.170824, 0.4310226, 1, 0, 0, 1, 1,
0.8873089, -0.997961, 3.103457, 0, 0, 0, 1, 1,
0.8946901, 1.150511, -0.1296576, 0, 0, 0, 1, 1,
0.896326, -0.9994083, 1.074744, 0, 0, 0, 1, 1,
0.898838, -1.578295, 3.610427, 0, 0, 0, 1, 1,
0.8988481, -0.4179038, 1.620358, 0, 0, 0, 1, 1,
0.9015425, 1.474183, 0.870944, 0, 0, 0, 1, 1,
0.9027487, -0.8108428, 2.880219, 0, 0, 0, 1, 1,
0.9099932, 0.4909292, 1.706168, 1, 1, 1, 1, 1,
0.9109862, 0.2574828, 2.421319, 1, 1, 1, 1, 1,
0.912539, -0.7337013, 2.570631, 1, 1, 1, 1, 1,
0.9147608, -0.2305517, 1.242184, 1, 1, 1, 1, 1,
0.9271822, -0.1137286, 1.56211, 1, 1, 1, 1, 1,
0.9319708, -0.7432935, 1.361688, 1, 1, 1, 1, 1,
0.9377328, -1.254319, 3.2969, 1, 1, 1, 1, 1,
0.9384002, -0.03626033, 2.15561, 1, 1, 1, 1, 1,
0.9405951, -1.007906, 2.173915, 1, 1, 1, 1, 1,
0.941578, -0.1173892, 1.895143, 1, 1, 1, 1, 1,
0.9424547, -0.4182781, 3.406659, 1, 1, 1, 1, 1,
0.9473279, 0.04392478, -0.01237707, 1, 1, 1, 1, 1,
0.9493424, 0.9615449, 0.7223694, 1, 1, 1, 1, 1,
0.955726, 0.821714, 1.588229, 1, 1, 1, 1, 1,
0.9564378, 0.6176147, -0.1419412, 1, 1, 1, 1, 1,
0.9595402, 2.054993, -0.07425056, 0, 0, 1, 1, 1,
0.9646383, -0.8290533, 3.425101, 1, 0, 0, 1, 1,
0.970449, 1.119007, 0.4429636, 1, 0, 0, 1, 1,
0.9716237, 1.316809, 1.210504, 1, 0, 0, 1, 1,
0.9809846, 1.230226, -0.4964713, 1, 0, 0, 1, 1,
0.9914104, -1.620619, 2.156113, 1, 0, 0, 1, 1,
0.9936768, -0.5093669, 2.242331, 0, 0, 0, 1, 1,
0.9949711, 1.108996, -0.29832, 0, 0, 0, 1, 1,
1.020284, -2.037114, 2.514321, 0, 0, 0, 1, 1,
1.023544, 0.7163361, 2.491378, 0, 0, 0, 1, 1,
1.032654, 0.6204779, -0.07946302, 0, 0, 0, 1, 1,
1.034295, -1.522124, 3.105671, 0, 0, 0, 1, 1,
1.044054, 0.6743198, 2.45404, 0, 0, 0, 1, 1,
1.046318, 1.623298, 0.1552309, 1, 1, 1, 1, 1,
1.053192, 0.881991, -0.5285541, 1, 1, 1, 1, 1,
1.054192, 0.4669048, 2.043147, 1, 1, 1, 1, 1,
1.057075, 0.7805448, 1.463106, 1, 1, 1, 1, 1,
1.062518, 1.126909, -1.079662, 1, 1, 1, 1, 1,
1.064192, 0.7083718, 1.697775, 1, 1, 1, 1, 1,
1.068628, 1.05649, -0.03110416, 1, 1, 1, 1, 1,
1.070382, 0.4535646, 0.1329706, 1, 1, 1, 1, 1,
1.070888, -0.8778641, 0.2296034, 1, 1, 1, 1, 1,
1.074243, 1.606059, 1.816494, 1, 1, 1, 1, 1,
1.083685, 0.4563268, -2.206589, 1, 1, 1, 1, 1,
1.086093, 0.7283275, 2.298007, 1, 1, 1, 1, 1,
1.110849, -0.3167046, 1.082538, 1, 1, 1, 1, 1,
1.127354, 0.8040123, 1.295498, 1, 1, 1, 1, 1,
1.136295, 0.4997182, 2.083203, 1, 1, 1, 1, 1,
1.138053, -0.2224419, 1.468047, 0, 0, 1, 1, 1,
1.143168, -0.3280712, 1.026422, 1, 0, 0, 1, 1,
1.143392, 0.1980796, 2.479023, 1, 0, 0, 1, 1,
1.144297, 2.032898, 0.059949, 1, 0, 0, 1, 1,
1.147681, -0.433632, 1.199698, 1, 0, 0, 1, 1,
1.149367, 0.2774764, 2.794772, 1, 0, 0, 1, 1,
1.154686, 0.1748236, 1.46178, 0, 0, 0, 1, 1,
1.159319, -0.03630992, 0.3374361, 0, 0, 0, 1, 1,
1.165226, -0.2290728, 0.3451613, 0, 0, 0, 1, 1,
1.167377, -0.6256588, 0.653543, 0, 0, 0, 1, 1,
1.183049, -0.4029635, 4.106031, 0, 0, 0, 1, 1,
1.193684, 0.5370014, 1.995188, 0, 0, 0, 1, 1,
1.199428, 0.8760188, 1.421246, 0, 0, 0, 1, 1,
1.202596, 0.2129456, 1.614502, 1, 1, 1, 1, 1,
1.204571, 0.9185174, 0.8698063, 1, 1, 1, 1, 1,
1.209228, 0.2757551, 1.247854, 1, 1, 1, 1, 1,
1.2114, 1.021888, 0.3655472, 1, 1, 1, 1, 1,
1.212019, 0.4350259, 1.73199, 1, 1, 1, 1, 1,
1.212285, 0.5943518, 1.52182, 1, 1, 1, 1, 1,
1.21488, -0.5103326, 2.285657, 1, 1, 1, 1, 1,
1.221911, 1.589627, 1.555625, 1, 1, 1, 1, 1,
1.222694, -0.6186334, 2.663349, 1, 1, 1, 1, 1,
1.225751, -0.4262974, -0.1168594, 1, 1, 1, 1, 1,
1.237017, 0.5564538, 1.498401, 1, 1, 1, 1, 1,
1.237302, 0.6778485, 0.3704304, 1, 1, 1, 1, 1,
1.237936, 0.8981292, 1.270046, 1, 1, 1, 1, 1,
1.245626, 0.4982656, 1.80917, 1, 1, 1, 1, 1,
1.256023, 0.4843265, 0.364262, 1, 1, 1, 1, 1,
1.276539, 1.101542, 1.54733, 0, 0, 1, 1, 1,
1.27919, 1.286899, -0.4605113, 1, 0, 0, 1, 1,
1.280993, -0.4915611, 1.477369, 1, 0, 0, 1, 1,
1.287461, 2.683686, -0.5792978, 1, 0, 0, 1, 1,
1.290476, -1.242938, -0.3653961, 1, 0, 0, 1, 1,
1.301338, -0.186984, 0.2726564, 1, 0, 0, 1, 1,
1.302474, 0.04416347, 1.94172, 0, 0, 0, 1, 1,
1.303872, -0.006161975, 1.732623, 0, 0, 0, 1, 1,
1.307769, -1.723032, 1.513451, 0, 0, 0, 1, 1,
1.308469, 0.9761633, -0.9514886, 0, 0, 0, 1, 1,
1.309919, 0.3934042, 3.701133, 0, 0, 0, 1, 1,
1.310413, 0.110137, 0.4640382, 0, 0, 0, 1, 1,
1.313592, 1.48772, -0.3536282, 0, 0, 0, 1, 1,
1.313767, -0.7429458, 3.059685, 1, 1, 1, 1, 1,
1.323329, -0.10888, 2.842503, 1, 1, 1, 1, 1,
1.32563, 0.06888841, 0.9825214, 1, 1, 1, 1, 1,
1.328764, 0.4412666, 1.849102, 1, 1, 1, 1, 1,
1.334944, 0.4706009, 2.26527, 1, 1, 1, 1, 1,
1.341649, 1.501594, 1.275106, 1, 1, 1, 1, 1,
1.348807, 1.049408, -0.09994259, 1, 1, 1, 1, 1,
1.351145, -2.678381, 3.169331, 1, 1, 1, 1, 1,
1.361049, 0.01509155, 1.83742, 1, 1, 1, 1, 1,
1.373875, -0.4081073, 1.444561, 1, 1, 1, 1, 1,
1.385096, -1.284755, 4.286406, 1, 1, 1, 1, 1,
1.39013, 0.9897194, 1.591496, 1, 1, 1, 1, 1,
1.392505, 0.9968301, 1.620122, 1, 1, 1, 1, 1,
1.398697, -0.7101828, 1.795549, 1, 1, 1, 1, 1,
1.413296, -1.473057, 2.457921, 1, 1, 1, 1, 1,
1.416345, 0.2681025, 1.027847, 0, 0, 1, 1, 1,
1.42139, -1.890101, 2.248759, 1, 0, 0, 1, 1,
1.445109, -0.6063384, 1.796978, 1, 0, 0, 1, 1,
1.446199, -1.289019, 2.560455, 1, 0, 0, 1, 1,
1.449948, 0.3317295, 2.020151, 1, 0, 0, 1, 1,
1.456557, 1.70236, 0.05303564, 1, 0, 0, 1, 1,
1.461637, 0.5602456, 1.153362, 0, 0, 0, 1, 1,
1.468024, -0.4204237, 2.069494, 0, 0, 0, 1, 1,
1.469499, 0.5155581, 0.4481341, 0, 0, 0, 1, 1,
1.473633, 1.040132, 1.005063, 0, 0, 0, 1, 1,
1.490925, -1.590414, 3.318572, 0, 0, 0, 1, 1,
1.495246, -0.8329814, 2.987113, 0, 0, 0, 1, 1,
1.497922, 0.2534383, 1.964084, 0, 0, 0, 1, 1,
1.524827, -0.07426915, 2.571546, 1, 1, 1, 1, 1,
1.532598, 0.7997801, 0.9923385, 1, 1, 1, 1, 1,
1.537391, -0.02983836, 1.534565, 1, 1, 1, 1, 1,
1.538944, 1.049403, 0.6018729, 1, 1, 1, 1, 1,
1.563239, -0.3960081, 1.948459, 1, 1, 1, 1, 1,
1.565485, -2.215033, 0.4560668, 1, 1, 1, 1, 1,
1.575336, 0.3705985, 0.507889, 1, 1, 1, 1, 1,
1.578772, -0.6159288, 2.028463, 1, 1, 1, 1, 1,
1.585602, -1.218758, 2.516386, 1, 1, 1, 1, 1,
1.589133, 0.4696989, 1.971515, 1, 1, 1, 1, 1,
1.595474, -0.169096, 2.346126, 1, 1, 1, 1, 1,
1.600241, -2.09351, 2.411013, 1, 1, 1, 1, 1,
1.604141, -0.538878, 2.10731, 1, 1, 1, 1, 1,
1.610515, 0.1825932, 2.765695, 1, 1, 1, 1, 1,
1.614041, -0.05056417, 2.802433, 1, 1, 1, 1, 1,
1.621732, 1.345218, 1.289158, 0, 0, 1, 1, 1,
1.667394, 0.3437521, 0.00405687, 1, 0, 0, 1, 1,
1.67873, 0.1003035, 2.54561, 1, 0, 0, 1, 1,
1.696971, 0.6831195, 1.15138, 1, 0, 0, 1, 1,
1.701489, -1.528255, 1.732678, 1, 0, 0, 1, 1,
1.712212, -0.01175566, 4.046127, 1, 0, 0, 1, 1,
1.719769, 0.05780398, 0.6625572, 0, 0, 0, 1, 1,
1.723219, 1.707351, -0.0840079, 0, 0, 0, 1, 1,
1.725964, -0.3768188, 3.208014, 0, 0, 0, 1, 1,
1.739785, -0.6422368, 1.625794, 0, 0, 0, 1, 1,
1.744545, -0.6113099, 2.601798, 0, 0, 0, 1, 1,
1.745338, -0.3100413, 0.6389578, 0, 0, 0, 1, 1,
1.761181, -0.8521284, 1.068796, 0, 0, 0, 1, 1,
1.768892, -0.4728277, 1.552069, 1, 1, 1, 1, 1,
1.810494, -0.5988696, 2.361915, 1, 1, 1, 1, 1,
1.813908, -1.086617, 0.8179271, 1, 1, 1, 1, 1,
1.814957, -0.366865, 2.06937, 1, 1, 1, 1, 1,
1.844275, -0.4752978, 0.07935652, 1, 1, 1, 1, 1,
1.847724, -0.3161073, 1.950961, 1, 1, 1, 1, 1,
1.897988, 1.206383, 0.5991302, 1, 1, 1, 1, 1,
1.916361, -0.4557022, 1.95401, 1, 1, 1, 1, 1,
1.949093, 0.2726885, 0.9572641, 1, 1, 1, 1, 1,
1.97644, 0.6989728, 1.95437, 1, 1, 1, 1, 1,
1.99508, -0.6201302, 2.592482, 1, 1, 1, 1, 1,
1.996528, -0.1824929, 1.600751, 1, 1, 1, 1, 1,
2.012383, 0.9086106, 1.729389, 1, 1, 1, 1, 1,
2.025195, -0.6574475, 2.631906, 1, 1, 1, 1, 1,
2.047328, -0.3504698, 1.692897, 1, 1, 1, 1, 1,
2.089534, 0.2981204, 1.109698, 0, 0, 1, 1, 1,
2.095662, -1.200837, 3.148374, 1, 0, 0, 1, 1,
2.139339, 1.160575, -0.2267525, 1, 0, 0, 1, 1,
2.143753, 0.525674, 1.541335, 1, 0, 0, 1, 1,
2.154433, 1.002537, 1.471693, 1, 0, 0, 1, 1,
2.156184, 1.106303, 1.526967, 1, 0, 0, 1, 1,
2.159554, -0.3162267, 2.37711, 0, 0, 0, 1, 1,
2.236349, 0.9232006, 3.089539, 0, 0, 0, 1, 1,
2.242734, 0.5464869, 0.7077428, 0, 0, 0, 1, 1,
2.252508, -0.4057359, 1.516624, 0, 0, 0, 1, 1,
2.262491, 0.8339547, -0.6028463, 0, 0, 0, 1, 1,
2.294394, -0.6756567, 1.185798, 0, 0, 0, 1, 1,
2.303473, 0.4460596, 1.010047, 0, 0, 0, 1, 1,
2.361262, 1.98964, 2.150277, 1, 1, 1, 1, 1,
2.433102, 1.530959, 0.5866697, 1, 1, 1, 1, 1,
2.444853, 0.07433732, 0.7595808, 1, 1, 1, 1, 1,
2.569997, -0.6656918, 2.637254, 1, 1, 1, 1, 1,
2.731476, 1.210569, 2.293453, 1, 1, 1, 1, 1,
3.355374, -1.067833, 1.794421, 1, 1, 1, 1, 1,
3.404108, -1.575774, 3.540593, 1, 1, 1, 1, 1
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
var radius = 9.668446;
var distance = 33.96001;
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
mvMatrix.translate( -0.1003826, -0.2101079, -0.2486141 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.96001);
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
