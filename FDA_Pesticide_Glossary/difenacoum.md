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
-2.706053, 0.364617, -0.4922903, 1, 0, 0, 1,
-2.647842, -1.684636, -0.6200395, 1, 0.007843138, 0, 1,
-2.643537, -0.170397, -3.374279, 1, 0.01176471, 0, 1,
-2.571867, 0.8591939, -1.825707, 1, 0.01960784, 0, 1,
-2.461012, -0.6051854, 0.1440342, 1, 0.02352941, 0, 1,
-2.280576, -1.198076, -3.669322, 1, 0.03137255, 0, 1,
-2.274785, 1.073119, -1.083135, 1, 0.03529412, 0, 1,
-2.139341, 0.4571915, -2.092499, 1, 0.04313726, 0, 1,
-2.096344, -0.08047924, -1.224917, 1, 0.04705882, 0, 1,
-2.064031, -1.539816, -1.328593, 1, 0.05490196, 0, 1,
-2.059108, -0.5815855, -3.474058, 1, 0.05882353, 0, 1,
-2.059101, 0.1306263, 0.518488, 1, 0.06666667, 0, 1,
-2.038223, 0.2369076, -1.817949, 1, 0.07058824, 0, 1,
-2.024392, 0.1533909, 0.6077636, 1, 0.07843138, 0, 1,
-2.000744, -0.1277311, -2.84697, 1, 0.08235294, 0, 1,
-1.971481, 0.4148127, -0.1688419, 1, 0.09019608, 0, 1,
-1.968399, -0.7625844, -1.014764, 1, 0.09411765, 0, 1,
-1.959355, -0.1543596, -0.6147255, 1, 0.1019608, 0, 1,
-1.940578, -0.2318254, -2.257383, 1, 0.1098039, 0, 1,
-1.873917, -0.8988143, -1.676462, 1, 0.1137255, 0, 1,
-1.856711, -0.4752365, -0.9651599, 1, 0.1215686, 0, 1,
-1.846953, -0.9160576, -2.679338, 1, 0.1254902, 0, 1,
-1.836925, 0.4462335, -1.447029, 1, 0.1333333, 0, 1,
-1.835058, -0.8784796, -2.671329, 1, 0.1372549, 0, 1,
-1.825423, -0.4573239, -1.590793, 1, 0.145098, 0, 1,
-1.823745, -1.240226, -1.177431, 1, 0.1490196, 0, 1,
-1.738628, 0.4313713, 0.2655813, 1, 0.1568628, 0, 1,
-1.734446, -0.2866102, -2.533232, 1, 0.1607843, 0, 1,
-1.734237, -0.01168165, -1.912704, 1, 0.1686275, 0, 1,
-1.722911, -1.306599, -1.910661, 1, 0.172549, 0, 1,
-1.712286, 1.534482, -1.155299, 1, 0.1803922, 0, 1,
-1.710884, -0.4223468, -2.018879, 1, 0.1843137, 0, 1,
-1.702181, 1.822773, -1.632217, 1, 0.1921569, 0, 1,
-1.690809, -0.8080234, -0.7254907, 1, 0.1960784, 0, 1,
-1.671769, 0.8029107, -2.868536, 1, 0.2039216, 0, 1,
-1.660695, 0.8226842, -1.259938, 1, 0.2117647, 0, 1,
-1.657223, 0.7848445, -1.970976, 1, 0.2156863, 0, 1,
-1.654407, 0.9476305, -2.271215, 1, 0.2235294, 0, 1,
-1.652752, -0.8687318, -3.433202, 1, 0.227451, 0, 1,
-1.63903, -1.701443, -1.77269, 1, 0.2352941, 0, 1,
-1.638695, 3.121916, -0.4041886, 1, 0.2392157, 0, 1,
-1.624608, -2.066429, -0.6836821, 1, 0.2470588, 0, 1,
-1.620964, -1.300506, -2.660109, 1, 0.2509804, 0, 1,
-1.612341, 0.2759385, -0.006669554, 1, 0.2588235, 0, 1,
-1.596024, -0.915683, -2.146826, 1, 0.2627451, 0, 1,
-1.584101, 1.588451, -0.9859197, 1, 0.2705882, 0, 1,
-1.579307, -1.730427, -2.770732, 1, 0.2745098, 0, 1,
-1.564878, 0.675899, -3.464612, 1, 0.282353, 0, 1,
-1.56109, 2.341506, 0.5357568, 1, 0.2862745, 0, 1,
-1.546498, -0.9077922, -2.952588, 1, 0.2941177, 0, 1,
-1.543587, -0.8449684, -2.355883, 1, 0.3019608, 0, 1,
-1.541547, -0.8179908, -1.993549, 1, 0.3058824, 0, 1,
-1.526923, -2.00323, -0.6197621, 1, 0.3137255, 0, 1,
-1.523416, -0.8241588, -3.379083, 1, 0.3176471, 0, 1,
-1.511859, 0.8165742, -1.809943, 1, 0.3254902, 0, 1,
-1.500388, 1.297101, 0.2619165, 1, 0.3294118, 0, 1,
-1.489728, 0.3242328, -1.502887, 1, 0.3372549, 0, 1,
-1.489624, 0.6386962, -3.253381, 1, 0.3411765, 0, 1,
-1.486249, 0.4434806, -1.037859, 1, 0.3490196, 0, 1,
-1.484989, 0.2488234, 0.6050056, 1, 0.3529412, 0, 1,
-1.475924, -0.4091577, -2.334279, 1, 0.3607843, 0, 1,
-1.46841, 0.945185, 1.285614, 1, 0.3647059, 0, 1,
-1.465031, 1.086043, -0.4010409, 1, 0.372549, 0, 1,
-1.463409, -1.15169, -1.153305, 1, 0.3764706, 0, 1,
-1.440496, -1.057102, -3.179721, 1, 0.3843137, 0, 1,
-1.43688, -0.6687157, -1.892718, 1, 0.3882353, 0, 1,
-1.432088, -1.633204, -4.006702, 1, 0.3960784, 0, 1,
-1.427626, -1.160821, -1.499766, 1, 0.4039216, 0, 1,
-1.425724, -0.8286185, -0.9311866, 1, 0.4078431, 0, 1,
-1.422856, -0.8682389, -1.316113, 1, 0.4156863, 0, 1,
-1.418721, -0.8971642, -3.180187, 1, 0.4196078, 0, 1,
-1.418357, -1.139706, -0.8524711, 1, 0.427451, 0, 1,
-1.418071, -0.4731966, -2.587425, 1, 0.4313726, 0, 1,
-1.416274, -1.498116, -1.565061, 1, 0.4392157, 0, 1,
-1.411098, 0.6567166, -0.9284776, 1, 0.4431373, 0, 1,
-1.410711, 0.7074432, -1.429674, 1, 0.4509804, 0, 1,
-1.409451, -0.1738578, -2.023084, 1, 0.454902, 0, 1,
-1.399397, -2.118394, -2.689314, 1, 0.4627451, 0, 1,
-1.391695, 0.8474764, -1.683627, 1, 0.4666667, 0, 1,
-1.386626, -0.1472307, -2.108172, 1, 0.4745098, 0, 1,
-1.377847, -0.4409165, -2.256915, 1, 0.4784314, 0, 1,
-1.358341, -1.15866, -0.9229273, 1, 0.4862745, 0, 1,
-1.35124, 2.296756, 0.06036365, 1, 0.4901961, 0, 1,
-1.33266, 0.9879556, -1.488818, 1, 0.4980392, 0, 1,
-1.330648, -0.7592568, -2.229603, 1, 0.5058824, 0, 1,
-1.315581, -1.246061, -2.474349, 1, 0.509804, 0, 1,
-1.315148, -1.429204, -3.018689, 1, 0.5176471, 0, 1,
-1.309123, 0.09922479, -1.562599, 1, 0.5215687, 0, 1,
-1.30368, -0.5478287, -2.733525, 1, 0.5294118, 0, 1,
-1.30305, -1.089802, -2.141416, 1, 0.5333334, 0, 1,
-1.293125, 0.4436473, -1.983407, 1, 0.5411765, 0, 1,
-1.293097, 0.09808253, -0.2750298, 1, 0.5450981, 0, 1,
-1.292034, -0.3705613, -2.398778, 1, 0.5529412, 0, 1,
-1.283682, 0.02835445, -2.866215, 1, 0.5568628, 0, 1,
-1.279249, -1.3235, -3.858895, 1, 0.5647059, 0, 1,
-1.27919, 0.6331068, -1.82728, 1, 0.5686275, 0, 1,
-1.278168, 0.9524648, -2.396281, 1, 0.5764706, 0, 1,
-1.274194, 0.15005, -4.072247, 1, 0.5803922, 0, 1,
-1.264394, 0.5574962, 1.137634, 1, 0.5882353, 0, 1,
-1.256511, -0.3231114, -0.7494848, 1, 0.5921569, 0, 1,
-1.25271, -0.9030249, -1.82182, 1, 0.6, 0, 1,
-1.252224, -1.790227, -1.968664, 1, 0.6078432, 0, 1,
-1.248067, 1.457493, -1.263291, 1, 0.6117647, 0, 1,
-1.241633, -1.426316, -2.903545, 1, 0.6196079, 0, 1,
-1.239385, -1.224669, -2.783838, 1, 0.6235294, 0, 1,
-1.233915, 1.7862, 0.3522555, 1, 0.6313726, 0, 1,
-1.231591, 1.3683, 0.6403722, 1, 0.6352941, 0, 1,
-1.223011, 0.5232211, -0.9167201, 1, 0.6431373, 0, 1,
-1.212142, -0.2392391, -2.20989, 1, 0.6470588, 0, 1,
-1.195261, 0.2716142, -0.1675687, 1, 0.654902, 0, 1,
-1.184322, -1.557464, -3.462732, 1, 0.6588235, 0, 1,
-1.180387, 0.4961298, -1.453926, 1, 0.6666667, 0, 1,
-1.179947, 1.548383, -0.8864987, 1, 0.6705883, 0, 1,
-1.170282, 0.7049171, -2.198466, 1, 0.6784314, 0, 1,
-1.17012, -0.9300184, -1.917703, 1, 0.682353, 0, 1,
-1.165272, 0.9764779, -0.7323277, 1, 0.6901961, 0, 1,
-1.164721, 1.020417, -1.546924, 1, 0.6941177, 0, 1,
-1.164311, 0.4227294, 0.3391423, 1, 0.7019608, 0, 1,
-1.162124, 0.0450441, -1.301036, 1, 0.7098039, 0, 1,
-1.161923, 1.52433, -0.1845252, 1, 0.7137255, 0, 1,
-1.161111, -1.114553, -3.253073, 1, 0.7215686, 0, 1,
-1.161107, -1.048995, -2.361128, 1, 0.7254902, 0, 1,
-1.154241, -2.598209, -2.320919, 1, 0.7333333, 0, 1,
-1.146722, -0.6674132, -2.506674, 1, 0.7372549, 0, 1,
-1.145835, -2.417035, -3.024486, 1, 0.7450981, 0, 1,
-1.1329, 0.4164582, -1.48066, 1, 0.7490196, 0, 1,
-1.124917, 0.2868912, -1.051963, 1, 0.7568628, 0, 1,
-1.122892, 0.9656097, -2.207427, 1, 0.7607843, 0, 1,
-1.117622, 2.479115, 0.2277845, 1, 0.7686275, 0, 1,
-1.116904, 0.1526604, -0.9495047, 1, 0.772549, 0, 1,
-1.114999, 1.157189, 1.019042, 1, 0.7803922, 0, 1,
-1.112513, -0.1358455, -1.439981, 1, 0.7843137, 0, 1,
-1.112463, 0.06651842, -1.295358, 1, 0.7921569, 0, 1,
-1.111555, 0.4859336, -3.078757, 1, 0.7960784, 0, 1,
-1.102641, -0.989131, -2.217121, 1, 0.8039216, 0, 1,
-1.094715, -1.215631, -2.5755, 1, 0.8117647, 0, 1,
-1.081154, -1.5709, -2.191651, 1, 0.8156863, 0, 1,
-1.079438, 1.210413, -0.6815425, 1, 0.8235294, 0, 1,
-1.074309, -2.368913, -2.323903, 1, 0.827451, 0, 1,
-1.072377, -0.5912216, -1.037423, 1, 0.8352941, 0, 1,
-1.068544, 0.1348546, -2.558301, 1, 0.8392157, 0, 1,
-1.067458, 1.19404, -1.090615, 1, 0.8470588, 0, 1,
-1.061382, -0.04282204, -0.7442978, 1, 0.8509804, 0, 1,
-1.061129, -0.9306361, -2.276123, 1, 0.8588235, 0, 1,
-1.054539, -0.5468878, -1.555517, 1, 0.8627451, 0, 1,
-1.052892, 0.8865172, -0.9298911, 1, 0.8705882, 0, 1,
-1.046385, 0.8804389, -0.9788995, 1, 0.8745098, 0, 1,
-1.043988, 0.821053, -0.01271289, 1, 0.8823529, 0, 1,
-1.042442, 0.6332787, -1.472572, 1, 0.8862745, 0, 1,
-1.041975, -1.448431, -3.20962, 1, 0.8941177, 0, 1,
-1.040626, -0.2878718, -1.277033, 1, 0.8980392, 0, 1,
-1.035576, -0.09865484, -1.761463, 1, 0.9058824, 0, 1,
-1.029682, -0.158943, -2.273996, 1, 0.9137255, 0, 1,
-1.02914, 0.0690272, -0.9688073, 1, 0.9176471, 0, 1,
-1.025386, -1.453219, -2.990556, 1, 0.9254902, 0, 1,
-1.024729, -1.028494, -3.734087, 1, 0.9294118, 0, 1,
-1.015612, -1.474255, -1.411044, 1, 0.9372549, 0, 1,
-1.014714, 0.9025244, -1.775798, 1, 0.9411765, 0, 1,
-1.012329, -0.9792156, -1.101117, 1, 0.9490196, 0, 1,
-1.01147, 0.08565429, -0.3328889, 1, 0.9529412, 0, 1,
-1.006165, 0.9062776, -1.020448, 1, 0.9607843, 0, 1,
-1.005843, 0.4487705, 0.0073186, 1, 0.9647059, 0, 1,
-1.002527, -0.007845186, -3.062792, 1, 0.972549, 0, 1,
-0.9899675, 0.02347056, -1.997005, 1, 0.9764706, 0, 1,
-0.9822834, 0.2358954, -2.068565, 1, 0.9843137, 0, 1,
-0.9766929, -1.698432, -2.280051, 1, 0.9882353, 0, 1,
-0.9723721, 0.4835793, -2.317183, 1, 0.9960784, 0, 1,
-0.9720333, -1.78635, -2.28399, 0.9960784, 1, 0, 1,
-0.9679275, 1.469482, 2.161583, 0.9921569, 1, 0, 1,
-0.9613711, -1.154396, -1.671796, 0.9843137, 1, 0, 1,
-0.9524938, 0.978218, -2.43258, 0.9803922, 1, 0, 1,
-0.939339, -0.169745, -0.782317, 0.972549, 1, 0, 1,
-0.9385235, 0.6435163, 0.004893146, 0.9686275, 1, 0, 1,
-0.9383338, -1.160535, -1.483272, 0.9607843, 1, 0, 1,
-0.935178, -0.07569741, -1.501898, 0.9568627, 1, 0, 1,
-0.9343418, 0.640074, -1.003231, 0.9490196, 1, 0, 1,
-0.9302555, -0.3407255, -2.141418, 0.945098, 1, 0, 1,
-0.9277967, 1.106364, -0.697328, 0.9372549, 1, 0, 1,
-0.9267622, -0.654425, -1.479091, 0.9333333, 1, 0, 1,
-0.9225234, 0.09648497, -2.253284, 0.9254902, 1, 0, 1,
-0.917272, -0.5222413, -2.888405, 0.9215686, 1, 0, 1,
-0.9164127, -2.363555, -2.935034, 0.9137255, 1, 0, 1,
-0.9124904, -0.3362027, -1.287363, 0.9098039, 1, 0, 1,
-0.9090095, -0.7971277, -3.808813, 0.9019608, 1, 0, 1,
-0.9043523, -1.223135, -2.190759, 0.8941177, 1, 0, 1,
-0.9039603, -1.322784, -0.4143367, 0.8901961, 1, 0, 1,
-0.8956065, -0.6652703, -2.319149, 0.8823529, 1, 0, 1,
-0.8867235, 1.950573, -1.282588, 0.8784314, 1, 0, 1,
-0.8791693, -1.919465, -4.240792, 0.8705882, 1, 0, 1,
-0.87523, -0.5704572, -1.760607, 0.8666667, 1, 0, 1,
-0.8726575, 0.3163449, -2.301859, 0.8588235, 1, 0, 1,
-0.8696319, -0.8379213, -2.987124, 0.854902, 1, 0, 1,
-0.8690094, -1.348694, -1.776052, 0.8470588, 1, 0, 1,
-0.8683442, -1.259059, -2.242775, 0.8431373, 1, 0, 1,
-0.8678107, -0.7471237, -2.481739, 0.8352941, 1, 0, 1,
-0.8651589, 0.4415858, 0.6636017, 0.8313726, 1, 0, 1,
-0.8613469, 0.4134145, -0.5280614, 0.8235294, 1, 0, 1,
-0.860617, 0.6932846, -1.062148, 0.8196079, 1, 0, 1,
-0.8531207, 1.929312, -1.479983, 0.8117647, 1, 0, 1,
-0.8507516, 1.880515, 0.1023566, 0.8078431, 1, 0, 1,
-0.8498138, 1.876446, -0.7650717, 0.8, 1, 0, 1,
-0.8470088, 0.2363457, -2.519631, 0.7921569, 1, 0, 1,
-0.8461148, -1.145317, -1.966815, 0.7882353, 1, 0, 1,
-0.8447248, -0.7703329, -3.476533, 0.7803922, 1, 0, 1,
-0.8431642, 1.363445, -0.5960808, 0.7764706, 1, 0, 1,
-0.8427873, 0.5509605, 0.01259718, 0.7686275, 1, 0, 1,
-0.841895, 0.9741927, -1.031699, 0.7647059, 1, 0, 1,
-0.8394043, -0.2645721, -2.89939, 0.7568628, 1, 0, 1,
-0.8335903, -2.271201, -2.36958, 0.7529412, 1, 0, 1,
-0.8217004, 0.2053368, -0.5866599, 0.7450981, 1, 0, 1,
-0.8202683, 1.063484, 1.269874, 0.7411765, 1, 0, 1,
-0.819918, 1.931734, -1.0523, 0.7333333, 1, 0, 1,
-0.8168035, 0.8249634, -1.832856, 0.7294118, 1, 0, 1,
-0.8160925, 0.362439, -2.565024, 0.7215686, 1, 0, 1,
-0.8152165, 1.456637, -1.900779, 0.7176471, 1, 0, 1,
-0.8092845, -0.3434809, -1.958666, 0.7098039, 1, 0, 1,
-0.8086485, -0.9948146, -2.391356, 0.7058824, 1, 0, 1,
-0.8058506, -2.79123, -2.639802, 0.6980392, 1, 0, 1,
-0.7996289, 0.374992, -0.09980422, 0.6901961, 1, 0, 1,
-0.7989709, -1.220176, -1.433244, 0.6862745, 1, 0, 1,
-0.7960386, 0.8170715, -1.369691, 0.6784314, 1, 0, 1,
-0.7947593, 0.3788572, -0.4840049, 0.6745098, 1, 0, 1,
-0.7917171, -0.4043868, -1.521993, 0.6666667, 1, 0, 1,
-0.786413, -1.314461, -4.140377, 0.6627451, 1, 0, 1,
-0.7845569, 0.4380085, -1.61116, 0.654902, 1, 0, 1,
-0.7776967, -0.9609776, -2.786839, 0.6509804, 1, 0, 1,
-0.7759, 0.1082238, -2.670394, 0.6431373, 1, 0, 1,
-0.7754372, 1.325769, -0.4952163, 0.6392157, 1, 0, 1,
-0.7694455, -0.1759192, -0.5893701, 0.6313726, 1, 0, 1,
-0.7622109, 0.9021732, -3.082798, 0.627451, 1, 0, 1,
-0.7610887, 1.849322, -0.2044453, 0.6196079, 1, 0, 1,
-0.7598631, 0.609456, -0.9679857, 0.6156863, 1, 0, 1,
-0.7597647, -0.3951269, -0.6914359, 0.6078432, 1, 0, 1,
-0.7577274, -0.4808457, -2.834209, 0.6039216, 1, 0, 1,
-0.7573622, 1.050128, -0.7652181, 0.5960785, 1, 0, 1,
-0.750278, 1.431631, -0.3672943, 0.5882353, 1, 0, 1,
-0.7485306, -0.6969905, -3.836534, 0.5843138, 1, 0, 1,
-0.7460783, 1.44507, 0.1801857, 0.5764706, 1, 0, 1,
-0.7459383, 0.3741827, -2.878392, 0.572549, 1, 0, 1,
-0.7454563, 1.878683, -1.654902, 0.5647059, 1, 0, 1,
-0.745438, 0.2049188, -1.090784, 0.5607843, 1, 0, 1,
-0.7362304, -0.8794589, -1.172056, 0.5529412, 1, 0, 1,
-0.7285333, 1.456832, 0.577777, 0.5490196, 1, 0, 1,
-0.7280107, 0.846518, -1.392942, 0.5411765, 1, 0, 1,
-0.7277636, 0.810218, 0.03417279, 0.5372549, 1, 0, 1,
-0.7229684, 0.2311048, -2.291732, 0.5294118, 1, 0, 1,
-0.71746, -0.7162045, -3.60074, 0.5254902, 1, 0, 1,
-0.7122296, -0.4810763, -2.903294, 0.5176471, 1, 0, 1,
-0.7067986, 0.8265563, 0.2767822, 0.5137255, 1, 0, 1,
-0.7026107, 0.7894486, -0.6705944, 0.5058824, 1, 0, 1,
-0.6998762, -1.120589, -2.102667, 0.5019608, 1, 0, 1,
-0.6976146, 1.080299, -1.348, 0.4941176, 1, 0, 1,
-0.6968377, 0.06596922, -1.912127, 0.4862745, 1, 0, 1,
-0.6964566, -1.332088, -3.261698, 0.4823529, 1, 0, 1,
-0.6910111, -0.2506777, -2.77232, 0.4745098, 1, 0, 1,
-0.6871482, 0.734829, -0.6058978, 0.4705882, 1, 0, 1,
-0.6811371, 0.9243932, -1.145407, 0.4627451, 1, 0, 1,
-0.6795542, -1.359124, -1.392255, 0.4588235, 1, 0, 1,
-0.6785627, -0.3099265, -2.24744, 0.4509804, 1, 0, 1,
-0.6713144, -0.168208, 0.4584363, 0.4470588, 1, 0, 1,
-0.6689498, 0.001682503, -2.632072, 0.4392157, 1, 0, 1,
-0.6658043, 0.2515543, -0.1502491, 0.4352941, 1, 0, 1,
-0.6609764, -0.3025376, -1.759497, 0.427451, 1, 0, 1,
-0.6595426, -0.5673129, -2.582293, 0.4235294, 1, 0, 1,
-0.6576177, -1.139892, -2.940861, 0.4156863, 1, 0, 1,
-0.6528979, 0.3490567, -1.342867, 0.4117647, 1, 0, 1,
-0.6450762, 0.02429863, -1.893282, 0.4039216, 1, 0, 1,
-0.6447395, -0.473253, -1.662773, 0.3960784, 1, 0, 1,
-0.643178, 0.1356744, -1.629529, 0.3921569, 1, 0, 1,
-0.640274, -1.495906, -2.444113, 0.3843137, 1, 0, 1,
-0.6351772, 0.7208755, -2.681222, 0.3803922, 1, 0, 1,
-0.6341824, 1.057266, -0.8140283, 0.372549, 1, 0, 1,
-0.6305886, -2.296315, -4.955999, 0.3686275, 1, 0, 1,
-0.6246212, -1.17474, -3.947024, 0.3607843, 1, 0, 1,
-0.6196256, 0.4152365, 0.4470328, 0.3568628, 1, 0, 1,
-0.6181018, -1.287055, -2.582933, 0.3490196, 1, 0, 1,
-0.617219, 0.8752181, 0.164463, 0.345098, 1, 0, 1,
-0.6140083, 0.635885, -1.702466, 0.3372549, 1, 0, 1,
-0.6139274, -0.911323, -2.456606, 0.3333333, 1, 0, 1,
-0.6109399, -1.040621, -0.7089784, 0.3254902, 1, 0, 1,
-0.6093517, -0.6842596, -2.739, 0.3215686, 1, 0, 1,
-0.6012799, -0.5457584, -2.662361, 0.3137255, 1, 0, 1,
-0.6011735, 2.707462, 0.9337429, 0.3098039, 1, 0, 1,
-0.6005008, 0.6098347, -0.7365142, 0.3019608, 1, 0, 1,
-0.5957469, 0.3897119, -1.207491, 0.2941177, 1, 0, 1,
-0.5945651, 0.5687155, -0.6183192, 0.2901961, 1, 0, 1,
-0.5933499, -0.2952152, -2.016233, 0.282353, 1, 0, 1,
-0.5932791, 0.222831, 1.275445, 0.2784314, 1, 0, 1,
-0.5921494, -0.8420421, -2.364277, 0.2705882, 1, 0, 1,
-0.590812, 0.2293203, -1.507919, 0.2666667, 1, 0, 1,
-0.5848422, -0.7256761, -4.580232, 0.2588235, 1, 0, 1,
-0.5836157, -0.4393458, -1.499617, 0.254902, 1, 0, 1,
-0.5815941, -0.05401465, -3.257944, 0.2470588, 1, 0, 1,
-0.5772903, -1.030321, -2.183991, 0.2431373, 1, 0, 1,
-0.5676442, -0.1153209, -1.659022, 0.2352941, 1, 0, 1,
-0.5664368, -0.6473995, -3.452246, 0.2313726, 1, 0, 1,
-0.5581546, 0.2714114, -1.155503, 0.2235294, 1, 0, 1,
-0.555275, 1.359045, -1.76089, 0.2196078, 1, 0, 1,
-0.5551823, 1.314076, -0.03261367, 0.2117647, 1, 0, 1,
-0.5539617, -0.2980603, -1.329079, 0.2078431, 1, 0, 1,
-0.5528095, -1.802815, -1.674588, 0.2, 1, 0, 1,
-0.5508606, -0.1663935, -2.127079, 0.1921569, 1, 0, 1,
-0.5459543, -0.3389365, -2.762627, 0.1882353, 1, 0, 1,
-0.5433626, 0.4595565, -1.242325, 0.1803922, 1, 0, 1,
-0.5343499, 2.190985, 0.02458874, 0.1764706, 1, 0, 1,
-0.5326773, -0.7044007, -2.563094, 0.1686275, 1, 0, 1,
-0.5272177, -0.9347184, -3.346859, 0.1647059, 1, 0, 1,
-0.5260113, 1.399938, -0.1222824, 0.1568628, 1, 0, 1,
-0.5259394, -1.742458, -2.727671, 0.1529412, 1, 0, 1,
-0.5257678, 0.2082394, -0.4055801, 0.145098, 1, 0, 1,
-0.5192222, -3.301811, -2.95778, 0.1411765, 1, 0, 1,
-0.5174623, -0.4563142, -2.188979, 0.1333333, 1, 0, 1,
-0.5130468, -0.1948173, -1.729391, 0.1294118, 1, 0, 1,
-0.5130432, -0.4783445, -2.054489, 0.1215686, 1, 0, 1,
-0.5032379, 1.109907, 1.33095, 0.1176471, 1, 0, 1,
-0.4932291, 1.196275, -1.230756, 0.1098039, 1, 0, 1,
-0.4931183, 0.4501794, -0.2114463, 0.1058824, 1, 0, 1,
-0.4912829, 1.98981, 0.665462, 0.09803922, 1, 0, 1,
-0.4885502, 0.03824893, -0.9771389, 0.09019608, 1, 0, 1,
-0.4848499, 0.06239228, -1.433473, 0.08627451, 1, 0, 1,
-0.4838552, -0.9455773, -3.151125, 0.07843138, 1, 0, 1,
-0.4834645, -1.360948, -2.409423, 0.07450981, 1, 0, 1,
-0.4806875, 0.3223188, -0.2965784, 0.06666667, 1, 0, 1,
-0.4762976, 1.594068, -0.3253821, 0.0627451, 1, 0, 1,
-0.4618244, 0.9776573, -0.5566834, 0.05490196, 1, 0, 1,
-0.4604005, -1.146388, -3.549762, 0.05098039, 1, 0, 1,
-0.4546486, 0.3224368, -1.203879, 0.04313726, 1, 0, 1,
-0.4494588, -0.8352099, -2.373011, 0.03921569, 1, 0, 1,
-0.4457936, 0.7752823, -0.6633743, 0.03137255, 1, 0, 1,
-0.4442297, -0.7868254, -2.181269, 0.02745098, 1, 0, 1,
-0.4440807, -0.9278544, -3.738115, 0.01960784, 1, 0, 1,
-0.4437805, -0.5430829, -2.366292, 0.01568628, 1, 0, 1,
-0.4300742, 0.9944118, -0.703454, 0.007843138, 1, 0, 1,
-0.4289296, -1.399009, -2.326015, 0.003921569, 1, 0, 1,
-0.4194096, 1.411876, -0.7141056, 0, 1, 0.003921569, 1,
-0.4188188, -0.5350606, -2.608392, 0, 1, 0.01176471, 1,
-0.4178436, -0.3069272, -1.337759, 0, 1, 0.01568628, 1,
-0.4176794, 0.518632, 0.2969483, 0, 1, 0.02352941, 1,
-0.4140976, 3.1209, -0.9590466, 0, 1, 0.02745098, 1,
-0.409823, -2.167191, -3.611914, 0, 1, 0.03529412, 1,
-0.4061186, -1.004539, -1.572036, 0, 1, 0.03921569, 1,
-0.4053301, 0.2760678, -1.007114, 0, 1, 0.04705882, 1,
-0.4036861, 1.091489, -1.214804, 0, 1, 0.05098039, 1,
-0.4033265, 0.4363162, 1.49592, 0, 1, 0.05882353, 1,
-0.3995036, -0.6201773, -2.180471, 0, 1, 0.0627451, 1,
-0.3974537, -0.5582061, -2.232322, 0, 1, 0.07058824, 1,
-0.3973636, -0.01945809, -2.657878, 0, 1, 0.07450981, 1,
-0.3970557, 0.04519867, -1.578007, 0, 1, 0.08235294, 1,
-0.3923198, -1.01892, -3.591852, 0, 1, 0.08627451, 1,
-0.3900472, -1.747915, -2.382136, 0, 1, 0.09411765, 1,
-0.3883186, -0.7612076, -3.127751, 0, 1, 0.1019608, 1,
-0.3802965, 0.8724028, 0.476005, 0, 1, 0.1058824, 1,
-0.3759025, -0.6307557, -2.250298, 0, 1, 0.1137255, 1,
-0.3698217, -0.1902988, -0.1115502, 0, 1, 0.1176471, 1,
-0.3680347, -0.5638878, -2.093721, 0, 1, 0.1254902, 1,
-0.3657916, 1.376663, 0.4579821, 0, 1, 0.1294118, 1,
-0.3631777, -0.4772295, -1.040021, 0, 1, 0.1372549, 1,
-0.3588998, 0.1572149, 0.6731117, 0, 1, 0.1411765, 1,
-0.3524301, -1.840592, -3.334596, 0, 1, 0.1490196, 1,
-0.3484976, -0.3750955, -2.529466, 0, 1, 0.1529412, 1,
-0.3454042, 0.7966168, -0.4055614, 0, 1, 0.1607843, 1,
-0.3437358, -0.4659141, -2.077478, 0, 1, 0.1647059, 1,
-0.3401446, -0.2095597, -3.195718, 0, 1, 0.172549, 1,
-0.3363186, -0.3582432, -3.019665, 0, 1, 0.1764706, 1,
-0.3355099, -0.7290408, -3.153471, 0, 1, 0.1843137, 1,
-0.3310429, 0.809817, 0.344168, 0, 1, 0.1882353, 1,
-0.3289797, 0.3361728, 0.3457503, 0, 1, 0.1960784, 1,
-0.3261702, -1.584108, -2.194681, 0, 1, 0.2039216, 1,
-0.3179542, -1.126264, -3.448079, 0, 1, 0.2078431, 1,
-0.3136944, 1.689608, -0.3038616, 0, 1, 0.2156863, 1,
-0.3112697, 0.009445288, -3.522094, 0, 1, 0.2196078, 1,
-0.3088938, -0.8607766, -2.708715, 0, 1, 0.227451, 1,
-0.3087928, -1.668283, -1.896397, 0, 1, 0.2313726, 1,
-0.3062838, 0.01302853, -1.718973, 0, 1, 0.2392157, 1,
-0.3043424, -0.4227813, -2.172747, 0, 1, 0.2431373, 1,
-0.303598, -0.2809298, -2.617481, 0, 1, 0.2509804, 1,
-0.2973018, 0.0007912543, -2.914986, 0, 1, 0.254902, 1,
-0.2947416, -0.9317321, -2.126477, 0, 1, 0.2627451, 1,
-0.2910304, -0.7261241, -2.103898, 0, 1, 0.2666667, 1,
-0.2894169, 0.7936034, -1.389334, 0, 1, 0.2745098, 1,
-0.2886127, 0.8941355, -1.009932, 0, 1, 0.2784314, 1,
-0.2875326, -0.9452525, -2.735451, 0, 1, 0.2862745, 1,
-0.2874144, -1.048747, -2.217143, 0, 1, 0.2901961, 1,
-0.2861719, -0.4300003, -2.93487, 0, 1, 0.2980392, 1,
-0.2851537, 0.6567359, -0.4050581, 0, 1, 0.3058824, 1,
-0.2789478, 0.05957086, -2.233083, 0, 1, 0.3098039, 1,
-0.2786634, -0.5195142, -1.093306, 0, 1, 0.3176471, 1,
-0.2720899, -0.0887625, -2.327332, 0, 1, 0.3215686, 1,
-0.2719918, -0.2943881, -1.894068, 0, 1, 0.3294118, 1,
-0.2681104, -0.1200934, -2.89793, 0, 1, 0.3333333, 1,
-0.2676239, 1.427474, 1.315747, 0, 1, 0.3411765, 1,
-0.2670199, -0.7263089, -2.920166, 0, 1, 0.345098, 1,
-0.265875, -0.1642377, -2.266079, 0, 1, 0.3529412, 1,
-0.2650572, -0.5280532, -1.611435, 0, 1, 0.3568628, 1,
-0.2630394, -1.504609, -2.338725, 0, 1, 0.3647059, 1,
-0.260453, -1.324983, -2.029025, 0, 1, 0.3686275, 1,
-0.2546121, 1.590046, 0.07077178, 0, 1, 0.3764706, 1,
-0.2533827, -1.306384, -2.662952, 0, 1, 0.3803922, 1,
-0.2514608, 0.221917, -0.6818012, 0, 1, 0.3882353, 1,
-0.2510084, -0.07657272, -2.179564, 0, 1, 0.3921569, 1,
-0.2502309, 1.272609, -0.716404, 0, 1, 0.4, 1,
-0.2493362, 1.663589, 0.2281226, 0, 1, 0.4078431, 1,
-0.2482253, -0.5967158, -2.965411, 0, 1, 0.4117647, 1,
-0.2414969, 1.324317, -0.5522125, 0, 1, 0.4196078, 1,
-0.227929, 1.795194, -1.588488, 0, 1, 0.4235294, 1,
-0.2255178, -1.073483, -1.870605, 0, 1, 0.4313726, 1,
-0.225322, -0.4357964, -0.9444888, 0, 1, 0.4352941, 1,
-0.2250718, -0.3760171, -3.648441, 0, 1, 0.4431373, 1,
-0.2223452, -0.50001, -2.812324, 0, 1, 0.4470588, 1,
-0.2209025, -0.6864359, 0.02677453, 0, 1, 0.454902, 1,
-0.2208848, 1.258376, 0.1598057, 0, 1, 0.4588235, 1,
-0.2186663, -0.9005731, -3.295664, 0, 1, 0.4666667, 1,
-0.2156588, -0.2166338, -1.272215, 0, 1, 0.4705882, 1,
-0.214147, -1.122975, -4.473681, 0, 1, 0.4784314, 1,
-0.2134261, -0.9549206, -2.853242, 0, 1, 0.4823529, 1,
-0.2110793, -1.382006, -2.095693, 0, 1, 0.4901961, 1,
-0.2095547, -0.624027, -2.484921, 0, 1, 0.4941176, 1,
-0.2092774, 0.2053025, 0.6968512, 0, 1, 0.5019608, 1,
-0.204828, -0.9014636, -3.051242, 0, 1, 0.509804, 1,
-0.1929072, 1.722635, -0.1386165, 0, 1, 0.5137255, 1,
-0.1885806, 0.3946575, -1.043682, 0, 1, 0.5215687, 1,
-0.1866426, -1.455762, -3.019688, 0, 1, 0.5254902, 1,
-0.1826084, 0.5385835, 0.03992186, 0, 1, 0.5333334, 1,
-0.1815496, 0.5797393, -1.266386, 0, 1, 0.5372549, 1,
-0.1790163, -0.3658143, -2.849264, 0, 1, 0.5450981, 1,
-0.1755935, 1.763303, 0.2761008, 0, 1, 0.5490196, 1,
-0.1737329, -1.570048, -2.53673, 0, 1, 0.5568628, 1,
-0.1716227, -0.8806123, -3.934128, 0, 1, 0.5607843, 1,
-0.1700119, 0.5256051, -0.4619237, 0, 1, 0.5686275, 1,
-0.1697486, 0.05848467, -1.149579, 0, 1, 0.572549, 1,
-0.1679491, 0.0391777, -1.248492, 0, 1, 0.5803922, 1,
-0.163708, 0.5384219, 1.418558, 0, 1, 0.5843138, 1,
-0.1616725, -0.9049211, -4.165188, 0, 1, 0.5921569, 1,
-0.1574674, -0.5106431, -4.071796, 0, 1, 0.5960785, 1,
-0.1570605, -0.09918728, -1.785683, 0, 1, 0.6039216, 1,
-0.1567471, 0.6564146, -0.9066169, 0, 1, 0.6117647, 1,
-0.1548337, 1.117735, -0.2093197, 0, 1, 0.6156863, 1,
-0.1537557, -1.493806, -4.235218, 0, 1, 0.6235294, 1,
-0.1520489, -0.8833599, -2.177992, 0, 1, 0.627451, 1,
-0.1493406, -0.3524582, -1.981628, 0, 1, 0.6352941, 1,
-0.145666, -0.07489488, -0.2989607, 0, 1, 0.6392157, 1,
-0.1451418, -1.049662, -4.593622, 0, 1, 0.6470588, 1,
-0.1371715, -0.1856918, -2.402028, 0, 1, 0.6509804, 1,
-0.1302496, -0.3966187, -2.284605, 0, 1, 0.6588235, 1,
-0.1301838, 0.1810025, -1.248619, 0, 1, 0.6627451, 1,
-0.1295266, 0.3196637, 0.2171902, 0, 1, 0.6705883, 1,
-0.1294804, 0.4182947, 0.465497, 0, 1, 0.6745098, 1,
-0.1269866, -0.8825278, -2.472263, 0, 1, 0.682353, 1,
-0.1268218, -1.115257, -2.916309, 0, 1, 0.6862745, 1,
-0.1252488, 1.268994, -1.285339, 0, 1, 0.6941177, 1,
-0.1243653, -2.129586, -3.73543, 0, 1, 0.7019608, 1,
-0.1163117, -0.8031947, -3.103231, 0, 1, 0.7058824, 1,
-0.09928448, -1.374656, -4.976823, 0, 1, 0.7137255, 1,
-0.09882633, -0.1022663, -1.908612, 0, 1, 0.7176471, 1,
-0.08900611, 0.3934484, -1.411006, 0, 1, 0.7254902, 1,
-0.08874389, 1.287525, -0.1568354, 0, 1, 0.7294118, 1,
-0.08797773, 0.02180498, -3.210569, 0, 1, 0.7372549, 1,
-0.08297825, 0.07606872, -2.640354, 0, 1, 0.7411765, 1,
-0.08260442, -0.120476, -2.222692, 0, 1, 0.7490196, 1,
-0.08177706, -0.4638808, -3.381433, 0, 1, 0.7529412, 1,
-0.08068421, 0.1184049, -1.054339, 0, 1, 0.7607843, 1,
-0.07818875, 0.5559814, -0.9493738, 0, 1, 0.7647059, 1,
-0.07615338, 0.01422718, -1.484137, 0, 1, 0.772549, 1,
-0.07092851, -1.638024, -3.689038, 0, 1, 0.7764706, 1,
-0.06859497, -1.98998, -2.837682, 0, 1, 0.7843137, 1,
-0.06809996, -0.1730993, -2.741138, 0, 1, 0.7882353, 1,
-0.06703052, 1.40682, -0.2679978, 0, 1, 0.7960784, 1,
-0.06525299, -1.257524, -3.79531, 0, 1, 0.8039216, 1,
-0.06514527, -0.2642534, -2.929875, 0, 1, 0.8078431, 1,
-0.06327039, -0.06270172, -2.401762, 0, 1, 0.8156863, 1,
-0.06077386, -0.2790351, -3.021929, 0, 1, 0.8196079, 1,
-0.05988647, -0.2278092, -1.435618, 0, 1, 0.827451, 1,
-0.05887247, -0.3570728, -1.698374, 0, 1, 0.8313726, 1,
-0.05547877, 0.3674371, 0.8980669, 0, 1, 0.8392157, 1,
-0.05527819, -0.6090412, -4.951582, 0, 1, 0.8431373, 1,
-0.05527323, 1.032655, -0.6320806, 0, 1, 0.8509804, 1,
-0.05331381, 0.7612838, 0.2418883, 0, 1, 0.854902, 1,
-0.05322603, 0.9759184, 0.3628389, 0, 1, 0.8627451, 1,
-0.04067544, -1.151341, -4.246136, 0, 1, 0.8666667, 1,
-0.03844194, 1.284849, -0.1303664, 0, 1, 0.8745098, 1,
-0.03787591, -0.04422945, -2.601275, 0, 1, 0.8784314, 1,
-0.03684212, -1.889482, -2.017715, 0, 1, 0.8862745, 1,
-0.0326124, -0.2711575, -4.047874, 0, 1, 0.8901961, 1,
-0.007509462, -0.6961699, -4.055333, 0, 1, 0.8980392, 1,
-0.006812944, 1.630577, 0.2952485, 0, 1, 0.9058824, 1,
-0.005173754, 0.5960656, -0.7428872, 0, 1, 0.9098039, 1,
-0.004167415, -1.255611, -4.711226, 0, 1, 0.9176471, 1,
-0.002048932, -0.08185124, -4.817641, 0, 1, 0.9215686, 1,
-0.0006801119, -1.277672, -2.989319, 0, 1, 0.9294118, 1,
0.002861329, -0.2477785, 3.345187, 0, 1, 0.9333333, 1,
0.003565323, 3.163206, -1.469784, 0, 1, 0.9411765, 1,
0.00812562, -0.781078, 2.072541, 0, 1, 0.945098, 1,
0.01034283, 0.9863294, 2.389591, 0, 1, 0.9529412, 1,
0.01456747, 0.7499807, 0.5250878, 0, 1, 0.9568627, 1,
0.01895353, -1.525234, 4.726193, 0, 1, 0.9647059, 1,
0.02322336, -0.4293477, 2.62402, 0, 1, 0.9686275, 1,
0.02790586, 0.2150286, 0.04073613, 0, 1, 0.9764706, 1,
0.03155161, -1.918439, 2.384958, 0, 1, 0.9803922, 1,
0.03251176, -0.03485063, 1.731694, 0, 1, 0.9882353, 1,
0.03565375, 2.415713, 0.678017, 0, 1, 0.9921569, 1,
0.03566976, 1.348256, 0.7535605, 0, 1, 1, 1,
0.0371365, 0.2969544, 1.625764, 0, 0.9921569, 1, 1,
0.03792773, -0.1803852, 1.883414, 0, 0.9882353, 1, 1,
0.03898156, 1.652738, -1.562151, 0, 0.9803922, 1, 1,
0.03987818, -0.9807755, 4.502623, 0, 0.9764706, 1, 1,
0.04734635, -0.1125778, 3.10945, 0, 0.9686275, 1, 1,
0.04780982, 0.3558868, -1.078314, 0, 0.9647059, 1, 1,
0.04790305, 0.4995204, 1.170797, 0, 0.9568627, 1, 1,
0.04873471, 0.1301155, 1.315776, 0, 0.9529412, 1, 1,
0.04988034, -1.191894, 2.368717, 0, 0.945098, 1, 1,
0.05072168, -0.5039636, 3.060214, 0, 0.9411765, 1, 1,
0.05266161, -1.169954, 3.44456, 0, 0.9333333, 1, 1,
0.0526819, 0.6559615, 2.087623, 0, 0.9294118, 1, 1,
0.0530484, 1.883013, 0.188897, 0, 0.9215686, 1, 1,
0.05739105, 0.5019025, 2.092587, 0, 0.9176471, 1, 1,
0.05825761, -0.06304905, 2.30214, 0, 0.9098039, 1, 1,
0.05953704, -1.440103, 5.159976, 0, 0.9058824, 1, 1,
0.06706135, 2.168224, -0.1230214, 0, 0.8980392, 1, 1,
0.07056289, -0.550406, 4.149795, 0, 0.8901961, 1, 1,
0.07315355, -0.5279724, 2.427267, 0, 0.8862745, 1, 1,
0.07343336, 0.5675226, -1.718506, 0, 0.8784314, 1, 1,
0.07668481, 0.04087603, 2.560282, 0, 0.8745098, 1, 1,
0.07932314, 0.2534921, 1.258072, 0, 0.8666667, 1, 1,
0.08015211, 0.9098991, 0.9243786, 0, 0.8627451, 1, 1,
0.08480695, -1.465064, 3.083131, 0, 0.854902, 1, 1,
0.08488268, 0.296492, -0.3606258, 0, 0.8509804, 1, 1,
0.0853324, 0.07757051, -0.7175065, 0, 0.8431373, 1, 1,
0.08719887, -0.6554696, 1.523266, 0, 0.8392157, 1, 1,
0.08951885, -1.395784, 2.32366, 0, 0.8313726, 1, 1,
0.0939284, 0.294906, 1.381033, 0, 0.827451, 1, 1,
0.09573026, 0.5671805, 0.1965955, 0, 0.8196079, 1, 1,
0.09695254, -0.5501753, 2.451123, 0, 0.8156863, 1, 1,
0.09824929, 1.296595, -0.04033835, 0, 0.8078431, 1, 1,
0.101687, -0.1843579, 3.776566, 0, 0.8039216, 1, 1,
0.1029626, -1.693955, 4.488725, 0, 0.7960784, 1, 1,
0.1066319, -0.08097243, 2.648574, 0, 0.7882353, 1, 1,
0.1097383, 1.284125, -0.8812428, 0, 0.7843137, 1, 1,
0.1099739, -0.8801609, 2.970644, 0, 0.7764706, 1, 1,
0.1110146, 0.4222817, -1.065429, 0, 0.772549, 1, 1,
0.115475, -0.004951963, 0.4625628, 0, 0.7647059, 1, 1,
0.1183405, 1.049274, -1.060994, 0, 0.7607843, 1, 1,
0.118508, -0.9381892, 2.501087, 0, 0.7529412, 1, 1,
0.118678, 0.9659715, 1.053347, 0, 0.7490196, 1, 1,
0.1187945, 0.07387893, 0.5656663, 0, 0.7411765, 1, 1,
0.1218285, -0.04348415, 0.56925, 0, 0.7372549, 1, 1,
0.1239799, -2.298173, 4.393394, 0, 0.7294118, 1, 1,
0.1253307, -0.268156, 2.716514, 0, 0.7254902, 1, 1,
0.1301352, 1.739144, 1.020569, 0, 0.7176471, 1, 1,
0.1349566, -1.574587, 2.747294, 0, 0.7137255, 1, 1,
0.1394658, -1.663741, 2.677943, 0, 0.7058824, 1, 1,
0.1400455, -0.09012295, 1.349765, 0, 0.6980392, 1, 1,
0.1401272, 0.5425959, 0.00290227, 0, 0.6941177, 1, 1,
0.1403327, -1.666471, -0.06665196, 0, 0.6862745, 1, 1,
0.1419221, -0.7394989, 3.220759, 0, 0.682353, 1, 1,
0.1421431, -0.3401078, 4.116131, 0, 0.6745098, 1, 1,
0.1454045, -0.7265931, 1.958023, 0, 0.6705883, 1, 1,
0.1486617, -0.755821, 2.630489, 0, 0.6627451, 1, 1,
0.1581874, -1.711647, 5.034228, 0, 0.6588235, 1, 1,
0.160155, -1.414062, 1.592253, 0, 0.6509804, 1, 1,
0.1653825, 0.2754624, 1.753554, 0, 0.6470588, 1, 1,
0.1716179, -1.557062, 2.829609, 0, 0.6392157, 1, 1,
0.1721907, -1.562307, 2.28205, 0, 0.6352941, 1, 1,
0.1777299, -0.007671795, 1.230557, 0, 0.627451, 1, 1,
0.1804933, 0.1850773, 1.173191, 0, 0.6235294, 1, 1,
0.18484, -0.6473634, 3.007068, 0, 0.6156863, 1, 1,
0.1857913, -0.05903508, 1.923322, 0, 0.6117647, 1, 1,
0.1861907, 0.00248713, 1.864232, 0, 0.6039216, 1, 1,
0.1868126, -0.02756832, 2.366566, 0, 0.5960785, 1, 1,
0.1874595, -0.4106439, 1.454107, 0, 0.5921569, 1, 1,
0.1927163, -0.7271817, 3.062717, 0, 0.5843138, 1, 1,
0.1934537, 1.442701, -0.04894313, 0, 0.5803922, 1, 1,
0.1942308, -0.1596043, 2.175124, 0, 0.572549, 1, 1,
0.1960298, 0.08975311, 3.76573, 0, 0.5686275, 1, 1,
0.1960476, 1.850329, 1.032503, 0, 0.5607843, 1, 1,
0.2028701, 0.8944858, 1.734004, 0, 0.5568628, 1, 1,
0.2034686, -0.8906843, 2.058071, 0, 0.5490196, 1, 1,
0.2207841, -1.339296, 3.263422, 0, 0.5450981, 1, 1,
0.2220757, 3.201281, 0.119695, 0, 0.5372549, 1, 1,
0.2246355, 0.1330929, -1.57886, 0, 0.5333334, 1, 1,
0.2263089, -1.156915, 3.84555, 0, 0.5254902, 1, 1,
0.2291424, 1.139618, 1.473158, 0, 0.5215687, 1, 1,
0.2301649, -1.35954, 3.015715, 0, 0.5137255, 1, 1,
0.238319, 0.1145046, 0.5407419, 0, 0.509804, 1, 1,
0.2398856, -0.6633407, 2.978064, 0, 0.5019608, 1, 1,
0.2407767, 0.05635945, 0.9904004, 0, 0.4941176, 1, 1,
0.246021, -0.2965222, 2.168071, 0, 0.4901961, 1, 1,
0.2470879, -0.1210012, 2.832577, 0, 0.4823529, 1, 1,
0.247376, 1.564438, 0.3262872, 0, 0.4784314, 1, 1,
0.2504935, 0.8578755, 0.3763902, 0, 0.4705882, 1, 1,
0.2518559, 0.5703225, -0.1015692, 0, 0.4666667, 1, 1,
0.2519173, 0.1529323, 1.293083, 0, 0.4588235, 1, 1,
0.2557552, -0.1343089, 2.127563, 0, 0.454902, 1, 1,
0.2562067, -0.2790417, 1.132426, 0, 0.4470588, 1, 1,
0.2562181, 0.2178059, 0.9616764, 0, 0.4431373, 1, 1,
0.2584248, -0.7309484, 3.561947, 0, 0.4352941, 1, 1,
0.2614374, 1.442341, 1.523794, 0, 0.4313726, 1, 1,
0.2639567, -0.03781307, 0.5194164, 0, 0.4235294, 1, 1,
0.2724198, 0.3621914, -0.003498365, 0, 0.4196078, 1, 1,
0.2740887, -0.0593809, 1.823733, 0, 0.4117647, 1, 1,
0.2770723, -1.213692, 2.147359, 0, 0.4078431, 1, 1,
0.2795681, 0.2976795, 0.5715622, 0, 0.4, 1, 1,
0.2829044, -2.326638, 4.10974, 0, 0.3921569, 1, 1,
0.2833942, 1.427976, -0.668799, 0, 0.3882353, 1, 1,
0.2846152, 0.7420009, 0.780816, 0, 0.3803922, 1, 1,
0.290067, 0.8289128, 1.245357, 0, 0.3764706, 1, 1,
0.2946415, -0.9482929, 2.750309, 0, 0.3686275, 1, 1,
0.295422, 2.730574, -0.2311767, 0, 0.3647059, 1, 1,
0.2964613, -1.043592, 3.734374, 0, 0.3568628, 1, 1,
0.2993669, 0.7133344, 0.2426727, 0, 0.3529412, 1, 1,
0.3015367, -0.36225, 3.727294, 0, 0.345098, 1, 1,
0.3103852, -0.6127642, 2.14744, 0, 0.3411765, 1, 1,
0.3137132, -1.16161, 4.311526, 0, 0.3333333, 1, 1,
0.3189233, -1.090742, 4.774242, 0, 0.3294118, 1, 1,
0.319136, 0.4163954, 0.06816892, 0, 0.3215686, 1, 1,
0.3191962, 1.11192, 1.319514, 0, 0.3176471, 1, 1,
0.3205016, -1.496032, 3.898189, 0, 0.3098039, 1, 1,
0.3206447, -0.1508694, 1.968384, 0, 0.3058824, 1, 1,
0.3236723, 1.159602, -1.370459, 0, 0.2980392, 1, 1,
0.3255216, 2.266043, -0.0681454, 0, 0.2901961, 1, 1,
0.3257034, 1.195703, -0.07907814, 0, 0.2862745, 1, 1,
0.3267978, -0.07344034, 1.001937, 0, 0.2784314, 1, 1,
0.3285277, -0.1560473, 1.648501, 0, 0.2745098, 1, 1,
0.3302004, 0.8661388, 0.0849114, 0, 0.2666667, 1, 1,
0.332311, 0.7095038, -0.3471208, 0, 0.2627451, 1, 1,
0.3350206, -0.3006761, 0.4855004, 0, 0.254902, 1, 1,
0.3361499, -2.43648, 0.8935107, 0, 0.2509804, 1, 1,
0.339001, 1.186582, 0.5585609, 0, 0.2431373, 1, 1,
0.3406699, 1.452768, 0.1416863, 0, 0.2392157, 1, 1,
0.3407837, -1.798755, 2.781314, 0, 0.2313726, 1, 1,
0.3408396, 0.5305094, 1.333644, 0, 0.227451, 1, 1,
0.3434968, -1.874353, 4.422662, 0, 0.2196078, 1, 1,
0.3452099, 0.8442249, 0.717109, 0, 0.2156863, 1, 1,
0.3471519, -0.304856, 0.6714024, 0, 0.2078431, 1, 1,
0.347332, -1.516184, 4.600546, 0, 0.2039216, 1, 1,
0.3495312, -1.517617, 1.098251, 0, 0.1960784, 1, 1,
0.3568976, -1.170056, 2.973998, 0, 0.1882353, 1, 1,
0.3614787, 0.1364967, 1.878322, 0, 0.1843137, 1, 1,
0.3699602, -0.09661067, 0.9360153, 0, 0.1764706, 1, 1,
0.3728568, 0.1083278, 0.79287, 0, 0.172549, 1, 1,
0.373812, -0.108789, 1.043152, 0, 0.1647059, 1, 1,
0.3790365, 0.5749421, 2.134787, 0, 0.1607843, 1, 1,
0.3799709, 0.7746783, 1.314795, 0, 0.1529412, 1, 1,
0.3815775, -1.068801, 3.141161, 0, 0.1490196, 1, 1,
0.3893804, 1.011132, 0.4880389, 0, 0.1411765, 1, 1,
0.3913321, 0.6499415, -1.075097, 0, 0.1372549, 1, 1,
0.3933937, -0.164054, 3.967592, 0, 0.1294118, 1, 1,
0.3993504, -0.5036893, 3.343799, 0, 0.1254902, 1, 1,
0.4032258, 1.091978, -0.8264703, 0, 0.1176471, 1, 1,
0.4137215, -0.3532087, 2.35527, 0, 0.1137255, 1, 1,
0.4137965, 1.623775, 0.6053289, 0, 0.1058824, 1, 1,
0.4141702, -1.160152, 3.170419, 0, 0.09803922, 1, 1,
0.4160227, 1.931953, 1.13451, 0, 0.09411765, 1, 1,
0.4243001, -0.2707936, 1.270884, 0, 0.08627451, 1, 1,
0.4266937, 1.160642, -1.524902, 0, 0.08235294, 1, 1,
0.429828, -0.6476957, 4.085694, 0, 0.07450981, 1, 1,
0.4304368, 1.210914, 0.9714851, 0, 0.07058824, 1, 1,
0.4316301, -0.5448936, 2.173028, 0, 0.0627451, 1, 1,
0.4324723, -1.003946, 4.1975, 0, 0.05882353, 1, 1,
0.4340006, -0.04617174, 2.138184, 0, 0.05098039, 1, 1,
0.4351483, -0.2015595, 2.916855, 0, 0.04705882, 1, 1,
0.4405978, -2.018511, 3.220219, 0, 0.03921569, 1, 1,
0.4426727, -0.1538888, 2.122463, 0, 0.03529412, 1, 1,
0.4477174, 1.581841, -0.8238643, 0, 0.02745098, 1, 1,
0.4483376, -1.097954, 2.22653, 0, 0.02352941, 1, 1,
0.4488824, 0.8777848, 0.990678, 0, 0.01568628, 1, 1,
0.4500512, -0.4869705, 4.204489, 0, 0.01176471, 1, 1,
0.451184, 0.9704418, -0.4160809, 0, 0.003921569, 1, 1,
0.451592, -0.2714956, 1.814859, 0.003921569, 0, 1, 1,
0.4521013, -0.547718, 1.683507, 0.007843138, 0, 1, 1,
0.4593245, -0.7867296, 5.982334, 0.01568628, 0, 1, 1,
0.4598088, -0.1967309, 0.7648695, 0.01960784, 0, 1, 1,
0.4659079, 0.4068757, -0.4475666, 0.02745098, 0, 1, 1,
0.4665317, 1.008094, -0.8164167, 0.03137255, 0, 1, 1,
0.4678271, -2.061539, 4.215875, 0.03921569, 0, 1, 1,
0.4683871, 1.132996, 0.7316274, 0.04313726, 0, 1, 1,
0.4802872, -0.2189123, 1.730169, 0.05098039, 0, 1, 1,
0.4818961, 0.09669438, 3.880332, 0.05490196, 0, 1, 1,
0.4840918, -1.686264, 2.535172, 0.0627451, 0, 1, 1,
0.4843233, 0.3055851, 0.5589468, 0.06666667, 0, 1, 1,
0.492599, -0.2526632, 2.342608, 0.07450981, 0, 1, 1,
0.4934489, 0.1422633, 2.049534, 0.07843138, 0, 1, 1,
0.4943263, 0.02167089, 0.3364613, 0.08627451, 0, 1, 1,
0.4943807, 1.251781, -0.01761742, 0.09019608, 0, 1, 1,
0.4958977, 0.01462978, 1.55882, 0.09803922, 0, 1, 1,
0.5037201, 0.3471203, 0.7792324, 0.1058824, 0, 1, 1,
0.5075099, 0.292213, 1.305307, 0.1098039, 0, 1, 1,
0.507844, 0.3320599, 0.9688675, 0.1176471, 0, 1, 1,
0.5105966, -0.3560433, 2.312099, 0.1215686, 0, 1, 1,
0.5126299, 0.6820759, 0.9120051, 0.1294118, 0, 1, 1,
0.5148031, 0.1680709, 1.258973, 0.1333333, 0, 1, 1,
0.5155894, 0.577794, 2.906038, 0.1411765, 0, 1, 1,
0.5157484, -0.4758721, 1.886662, 0.145098, 0, 1, 1,
0.5185525, 0.646645, 0.06692955, 0.1529412, 0, 1, 1,
0.5308614, -1.34549, 3.829397, 0.1568628, 0, 1, 1,
0.5324218, -0.7227038, 1.032142, 0.1647059, 0, 1, 1,
0.5333741, 0.9347674, -0.3543243, 0.1686275, 0, 1, 1,
0.5338343, 0.1809503, 2.263025, 0.1764706, 0, 1, 1,
0.5360869, -0.3497829, 2.185306, 0.1803922, 0, 1, 1,
0.5413663, -0.03170671, 2.425805, 0.1882353, 0, 1, 1,
0.5434231, -1.891024, 3.672119, 0.1921569, 0, 1, 1,
0.5435517, 1.161633, -0.605275, 0.2, 0, 1, 1,
0.5453486, -1.012866, 0.5942094, 0.2078431, 0, 1, 1,
0.5474156, -0.2931668, 2.299617, 0.2117647, 0, 1, 1,
0.5480097, -0.8836203, 3.222511, 0.2196078, 0, 1, 1,
0.5499954, 0.7816139, 1.945228, 0.2235294, 0, 1, 1,
0.5518079, 1.544442, 0.6572154, 0.2313726, 0, 1, 1,
0.5528606, -1.423831, 3.042385, 0.2352941, 0, 1, 1,
0.5536799, -1.005199, 4.890424, 0.2431373, 0, 1, 1,
0.5635464, 0.5667197, -0.2561316, 0.2470588, 0, 1, 1,
0.5641034, 0.8425962, -0.02373044, 0.254902, 0, 1, 1,
0.5643132, 0.4637174, 1.120215, 0.2588235, 0, 1, 1,
0.5658461, 0.2008164, 0.8314682, 0.2666667, 0, 1, 1,
0.5685487, -0.2156134, 1.598962, 0.2705882, 0, 1, 1,
0.5727397, 0.2209249, 1.682029, 0.2784314, 0, 1, 1,
0.5761663, 0.1863199, 1.417865, 0.282353, 0, 1, 1,
0.5766982, -0.2412391, 3.360881, 0.2901961, 0, 1, 1,
0.5805573, 1.162147, 1.199715, 0.2941177, 0, 1, 1,
0.5807341, -2.223705, 0.742043, 0.3019608, 0, 1, 1,
0.5820666, 0.1059417, 1.217164, 0.3098039, 0, 1, 1,
0.5854388, 0.5582562, 1.825625, 0.3137255, 0, 1, 1,
0.595497, 0.9069512, 0.2984553, 0.3215686, 0, 1, 1,
0.5988548, 0.2320656, 0.204063, 0.3254902, 0, 1, 1,
0.6039705, 2.143931, -0.05228978, 0.3333333, 0, 1, 1,
0.6043519, -0.6593968, 2.722506, 0.3372549, 0, 1, 1,
0.6065291, 0.4744888, -1.353768, 0.345098, 0, 1, 1,
0.6076337, 0.869958, -0.3737987, 0.3490196, 0, 1, 1,
0.6091752, -1.281505, 3.110239, 0.3568628, 0, 1, 1,
0.6111221, -1.136397, 5.07256, 0.3607843, 0, 1, 1,
0.614953, 0.6822873, 1.876046, 0.3686275, 0, 1, 1,
0.6199222, 0.1063044, 1.946453, 0.372549, 0, 1, 1,
0.6199777, -0.2630701, 3.129779, 0.3803922, 0, 1, 1,
0.6211306, -0.846963, 3.492416, 0.3843137, 0, 1, 1,
0.6290796, 1.606467, 0.591343, 0.3921569, 0, 1, 1,
0.6324895, -0.4565669, 2.878096, 0.3960784, 0, 1, 1,
0.6353188, 0.3104211, 3.403073, 0.4039216, 0, 1, 1,
0.6364274, 0.5340019, 1.227653, 0.4117647, 0, 1, 1,
0.6367087, 1.0138, 0.08589342, 0.4156863, 0, 1, 1,
0.6375222, 0.6316615, -0.573927, 0.4235294, 0, 1, 1,
0.640725, -0.07372864, 0.09348189, 0.427451, 0, 1, 1,
0.6410342, 1.615133, -0.6456263, 0.4352941, 0, 1, 1,
0.6439121, -1.828852, 2.767291, 0.4392157, 0, 1, 1,
0.6441276, -2.062827, 1.745537, 0.4470588, 0, 1, 1,
0.6456445, 0.423859, 1.692675, 0.4509804, 0, 1, 1,
0.6485896, -1.828941, 2.908724, 0.4588235, 0, 1, 1,
0.6496248, 0.3185555, 0.1981067, 0.4627451, 0, 1, 1,
0.6517279, -0.01413951, 1.689884, 0.4705882, 0, 1, 1,
0.6523092, 1.295619, 0.3343273, 0.4745098, 0, 1, 1,
0.6549399, 0.2450307, -0.1448188, 0.4823529, 0, 1, 1,
0.6571838, -1.324009, 2.139316, 0.4862745, 0, 1, 1,
0.6596573, 0.8426337, 1.879371, 0.4941176, 0, 1, 1,
0.6710842, -1.066102, 0.7964874, 0.5019608, 0, 1, 1,
0.6750581, 0.853443, 1.877, 0.5058824, 0, 1, 1,
0.6754639, -1.532243, 3.657229, 0.5137255, 0, 1, 1,
0.6769291, 1.022632, -0.5540962, 0.5176471, 0, 1, 1,
0.6846169, -0.4237256, 1.729777, 0.5254902, 0, 1, 1,
0.6863575, -0.5443534, 1.256733, 0.5294118, 0, 1, 1,
0.6969897, -0.6381225, 3.350764, 0.5372549, 0, 1, 1,
0.7051945, 0.5284082, 0.3229468, 0.5411765, 0, 1, 1,
0.7099361, 1.891561, 1.178567, 0.5490196, 0, 1, 1,
0.7114456, -0.8429078, 3.698651, 0.5529412, 0, 1, 1,
0.7142398, -0.4518069, 2.351379, 0.5607843, 0, 1, 1,
0.7148314, -1.009743, 1.839541, 0.5647059, 0, 1, 1,
0.7168871, -0.6734582, 1.708268, 0.572549, 0, 1, 1,
0.7186074, 0.8634093, 0.5664616, 0.5764706, 0, 1, 1,
0.7247795, 0.1603711, 0.09630718, 0.5843138, 0, 1, 1,
0.7272866, -1.194806, 2.484814, 0.5882353, 0, 1, 1,
0.7282015, 0.02274447, 2.577891, 0.5960785, 0, 1, 1,
0.7354563, 1.713862, 0.9474433, 0.6039216, 0, 1, 1,
0.7487158, -0.2835928, 1.610163, 0.6078432, 0, 1, 1,
0.7565185, -0.5687049, 3.236861, 0.6156863, 0, 1, 1,
0.7575622, 0.5279104, 1.61946, 0.6196079, 0, 1, 1,
0.7726997, 1.920493, 0.7547793, 0.627451, 0, 1, 1,
0.7763035, -0.4309657, 2.997988, 0.6313726, 0, 1, 1,
0.7774903, -0.132035, 2.364654, 0.6392157, 0, 1, 1,
0.7792164, -2.025658, 1.350725, 0.6431373, 0, 1, 1,
0.7805374, -1.54341, 4.980337, 0.6509804, 0, 1, 1,
0.7886953, -0.9101123, 1.494812, 0.654902, 0, 1, 1,
0.7899376, -0.3397578, 1.871793, 0.6627451, 0, 1, 1,
0.7903631, 1.456526, 1.069058, 0.6666667, 0, 1, 1,
0.7937084, 0.474932, 0.3249703, 0.6745098, 0, 1, 1,
0.7971821, 0.8718806, 1.760909, 0.6784314, 0, 1, 1,
0.8152475, 0.1246875, 1.014661, 0.6862745, 0, 1, 1,
0.8187057, 0.6019773, 0.6891704, 0.6901961, 0, 1, 1,
0.8204758, 1.10181, 0.9896275, 0.6980392, 0, 1, 1,
0.8271621, -1.162423, 2.450934, 0.7058824, 0, 1, 1,
0.8284518, -0.7142597, 1.998372, 0.7098039, 0, 1, 1,
0.8285013, 0.001092918, -0.3489996, 0.7176471, 0, 1, 1,
0.8297564, -0.725338, 5.193936, 0.7215686, 0, 1, 1,
0.8335658, 0.866324, 1.620972, 0.7294118, 0, 1, 1,
0.8355477, 0.880198, 1.134906, 0.7333333, 0, 1, 1,
0.8410739, -1.07657, 1.700386, 0.7411765, 0, 1, 1,
0.8429487, 1.615803, 0.7947223, 0.7450981, 0, 1, 1,
0.8472641, 0.424266, 1.600745, 0.7529412, 0, 1, 1,
0.8536314, -1.08602, 3.199979, 0.7568628, 0, 1, 1,
0.8568968, 0.634691, 0.1281075, 0.7647059, 0, 1, 1,
0.857037, -0.2699009, 0.4482453, 0.7686275, 0, 1, 1,
0.8577328, 0.5673589, 0.7550935, 0.7764706, 0, 1, 1,
0.8607987, -1.344127, 3.757318, 0.7803922, 0, 1, 1,
0.8705273, -0.8111027, 2.372768, 0.7882353, 0, 1, 1,
0.8806608, 0.8806143, 0.4248185, 0.7921569, 0, 1, 1,
0.8829256, -1.022185, -0.2012756, 0.8, 0, 1, 1,
0.8846664, 0.6408074, 0.7508312, 0.8078431, 0, 1, 1,
0.8903281, -0.8069789, 3.216978, 0.8117647, 0, 1, 1,
0.8916581, 1.272497, -0.03607376, 0.8196079, 0, 1, 1,
0.8928699, 1.301477, 1.590779, 0.8235294, 0, 1, 1,
0.8961328, 0.0932982, 2.284162, 0.8313726, 0, 1, 1,
0.8993747, 0.5561829, -0.2811309, 0.8352941, 0, 1, 1,
0.9021873, -1.108667, 3.042105, 0.8431373, 0, 1, 1,
0.9031771, 0.852488, -1.36861, 0.8470588, 0, 1, 1,
0.9051107, -1.213365, 2.879571, 0.854902, 0, 1, 1,
0.9112801, 0.5530236, 0.8070406, 0.8588235, 0, 1, 1,
0.9161767, -1.186957, 3.007495, 0.8666667, 0, 1, 1,
0.9236805, -1.21752, 2.936469, 0.8705882, 0, 1, 1,
0.9240768, 1.19237, -0.9192981, 0.8784314, 0, 1, 1,
0.9299247, 0.5273449, 0.4791296, 0.8823529, 0, 1, 1,
0.9352779, -1.03213, 3.489799, 0.8901961, 0, 1, 1,
0.9370245, -0.3821228, 2.466971, 0.8941177, 0, 1, 1,
0.93782, -0.3039924, 1.591503, 0.9019608, 0, 1, 1,
0.9398202, -0.5253058, 2.56203, 0.9098039, 0, 1, 1,
0.9468138, 0.6722388, 1.918403, 0.9137255, 0, 1, 1,
0.9480927, -1.527227, 3.283008, 0.9215686, 0, 1, 1,
0.9482485, -0.6232737, 0.684825, 0.9254902, 0, 1, 1,
0.9504145, 0.8737177, -0.6872433, 0.9333333, 0, 1, 1,
0.9509023, -0.356825, 3.429753, 0.9372549, 0, 1, 1,
0.9527075, -0.6149122, 2.643023, 0.945098, 0, 1, 1,
0.958807, -0.02407055, 3.392885, 0.9490196, 0, 1, 1,
0.9611031, -2.437097, 2.952996, 0.9568627, 0, 1, 1,
0.9705998, 1.125074, 1.502307, 0.9607843, 0, 1, 1,
0.9728221, -0.5741927, 2.488634, 0.9686275, 0, 1, 1,
0.9731041, 0.5796987, 0.3703554, 0.972549, 0, 1, 1,
0.9731567, 0.3803877, 0.3969634, 0.9803922, 0, 1, 1,
0.9769318, -0.5050446, 0.2355802, 0.9843137, 0, 1, 1,
0.9958912, 1.569059, 1.929918, 0.9921569, 0, 1, 1,
0.997199, -0.9042478, 3.089949, 0.9960784, 0, 1, 1,
1.000216, 0.8010647, 2.156873, 1, 0, 0.9960784, 1,
1.001858, -0.572974, 2.92678, 1, 0, 0.9882353, 1,
1.001934, 1.312999, 1.58487, 1, 0, 0.9843137, 1,
1.002627, 1.581384, 3.538194, 1, 0, 0.9764706, 1,
1.008452, -0.9085913, 2.34599, 1, 0, 0.972549, 1,
1.013331, 2.049952, 0.3301421, 1, 0, 0.9647059, 1,
1.014196, -0.8549135, 1.128136, 1, 0, 0.9607843, 1,
1.016738, 1.647686, 0.8171136, 1, 0, 0.9529412, 1,
1.017332, -0.3897366, 2.158499, 1, 0, 0.9490196, 1,
1.018575, -1.483161, 2.747508, 1, 0, 0.9411765, 1,
1.022859, -1.138269, 4.695052, 1, 0, 0.9372549, 1,
1.022982, 1.19756, 1.03855, 1, 0, 0.9294118, 1,
1.024175, -0.3635375, 0.3828167, 1, 0, 0.9254902, 1,
1.029748, -0.9097403, 2.038181, 1, 0, 0.9176471, 1,
1.030057, 0.1894485, 2.037247, 1, 0, 0.9137255, 1,
1.04587, -0.8190729, 1.926361, 1, 0, 0.9058824, 1,
1.050624, 0.7719443, 1.926721, 1, 0, 0.9019608, 1,
1.051149, -0.412777, 2.716411, 1, 0, 0.8941177, 1,
1.0522, -0.2619867, 1.857168, 1, 0, 0.8862745, 1,
1.053459, 0.2084459, 1.06675, 1, 0, 0.8823529, 1,
1.063128, -1.211878, 1.907503, 1, 0, 0.8745098, 1,
1.063216, 0.5211697, 0.9935805, 1, 0, 0.8705882, 1,
1.065811, -0.1207127, 1.581965, 1, 0, 0.8627451, 1,
1.072665, 0.9374438, 2.216951, 1, 0, 0.8588235, 1,
1.073628, -0.3237372, 1.19196, 1, 0, 0.8509804, 1,
1.096279, -0.4324149, 1.418545, 1, 0, 0.8470588, 1,
1.101546, -0.06992162, 1.189669, 1, 0, 0.8392157, 1,
1.1058, 0.6758273, 1.694567, 1, 0, 0.8352941, 1,
1.106075, 0.7017301, 2.329201, 1, 0, 0.827451, 1,
1.106288, 0.7579895, 2.273234, 1, 0, 0.8235294, 1,
1.112405, 1.626624, -0.5222527, 1, 0, 0.8156863, 1,
1.117488, 1.032583, 0.4679341, 1, 0, 0.8117647, 1,
1.126698, -0.4988421, 2.467074, 1, 0, 0.8039216, 1,
1.128766, 0.8596806, 0.7102848, 1, 0, 0.7960784, 1,
1.135325, 1.358171, -0.6686391, 1, 0, 0.7921569, 1,
1.138961, 0.05729273, 1.903283, 1, 0, 0.7843137, 1,
1.140281, 0.694753, -0.8324948, 1, 0, 0.7803922, 1,
1.142719, 0.539193, 2.109074, 1, 0, 0.772549, 1,
1.149776, 0.5680515, 0.9659432, 1, 0, 0.7686275, 1,
1.150696, -1.756798, 1.289837, 1, 0, 0.7607843, 1,
1.178288, -0.7296875, 2.980401, 1, 0, 0.7568628, 1,
1.179787, 0.5216337, 1.081145, 1, 0, 0.7490196, 1,
1.182343, -1.508953, 2.089911, 1, 0, 0.7450981, 1,
1.183432, -2.193713, 2.200957, 1, 0, 0.7372549, 1,
1.193851, 0.9329164, 0.08739819, 1, 0, 0.7333333, 1,
1.199292, -0.8911697, 1.806039, 1, 0, 0.7254902, 1,
1.209588, 1.734288, 2.812839, 1, 0, 0.7215686, 1,
1.211042, 0.9264838, 0.5862374, 1, 0, 0.7137255, 1,
1.229304, -0.8390865, 0.8636528, 1, 0, 0.7098039, 1,
1.230294, 1.38743, 2.494293, 1, 0, 0.7019608, 1,
1.232043, -0.9704775, 2.409235, 1, 0, 0.6941177, 1,
1.244595, 0.08545273, 1.705154, 1, 0, 0.6901961, 1,
1.24501, -0.8290436, 1.702536, 1, 0, 0.682353, 1,
1.249522, 0.4245899, 2.970471, 1, 0, 0.6784314, 1,
1.250015, -0.2186072, 2.596311, 1, 0, 0.6705883, 1,
1.25103, -1.428218, 2.027964, 1, 0, 0.6666667, 1,
1.251674, -0.6852137, 3.118121, 1, 0, 0.6588235, 1,
1.258478, -0.7455693, 2.194325, 1, 0, 0.654902, 1,
1.262761, 0.9137109, 0.5082922, 1, 0, 0.6470588, 1,
1.26624, -0.1470591, 3.427363, 1, 0, 0.6431373, 1,
1.273056, 0.5399747, 1.4728, 1, 0, 0.6352941, 1,
1.276881, 1.262032, 0.2184599, 1, 0, 0.6313726, 1,
1.278397, 1.20583, -0.0885103, 1, 0, 0.6235294, 1,
1.280688, -1.30178, 2.562418, 1, 0, 0.6196079, 1,
1.281499, -0.6787747, 1.102137, 1, 0, 0.6117647, 1,
1.288894, -0.9318212, 1.413009, 1, 0, 0.6078432, 1,
1.29305, 1.617786, 1.648422, 1, 0, 0.6, 1,
1.295938, 0.8295963, 2.47314, 1, 0, 0.5921569, 1,
1.29676, 0.03495229, 3.000657, 1, 0, 0.5882353, 1,
1.305217, -0.848146, 1.188304, 1, 0, 0.5803922, 1,
1.314005, -0.3500271, 2.048291, 1, 0, 0.5764706, 1,
1.326672, 0.3862658, 2.333381, 1, 0, 0.5686275, 1,
1.332944, -1.334941, 1.711871, 1, 0, 0.5647059, 1,
1.340721, 0.6848429, 0.6554269, 1, 0, 0.5568628, 1,
1.341619, 0.2853018, 1.538061, 1, 0, 0.5529412, 1,
1.349222, 1.027108, 1.283759, 1, 0, 0.5450981, 1,
1.353814, -0.9897164, 3.759432, 1, 0, 0.5411765, 1,
1.359677, -0.4796876, 2.461127, 1, 0, 0.5333334, 1,
1.362001, -1.100496, 3.505546, 1, 0, 0.5294118, 1,
1.366554, -0.8639551, 2.268909, 1, 0, 0.5215687, 1,
1.372934, -0.05588553, 2.863626, 1, 0, 0.5176471, 1,
1.376023, 1.866815, 0.172482, 1, 0, 0.509804, 1,
1.403355, 0.3998453, 1.373483, 1, 0, 0.5058824, 1,
1.408864, 0.08744258, 3.16675, 1, 0, 0.4980392, 1,
1.422872, 1.219772, -0.2419712, 1, 0, 0.4901961, 1,
1.429652, 0.1963896, 1.837544, 1, 0, 0.4862745, 1,
1.432661, 0.06307244, 1.431197, 1, 0, 0.4784314, 1,
1.435123, -2.080027, 1.782112, 1, 0, 0.4745098, 1,
1.435152, -0.2700633, 2.926048, 1, 0, 0.4666667, 1,
1.435152, -0.4540266, 1.872025, 1, 0, 0.4627451, 1,
1.438405, -1.33374, 3.739448, 1, 0, 0.454902, 1,
1.443866, -0.185599, 2.629307, 1, 0, 0.4509804, 1,
1.446247, -0.3059925, 2.350941, 1, 0, 0.4431373, 1,
1.450983, -0.8439985, 2.54401, 1, 0, 0.4392157, 1,
1.452817, -1.350053, 3.743823, 1, 0, 0.4313726, 1,
1.455058, -1.688388, 3.15232, 1, 0, 0.427451, 1,
1.481376, -0.9230533, 3.680259, 1, 0, 0.4196078, 1,
1.489221, -0.8820828, 1.432611, 1, 0, 0.4156863, 1,
1.507946, -1.056467, -0.1589557, 1, 0, 0.4078431, 1,
1.516755, 0.2147052, 1.095728, 1, 0, 0.4039216, 1,
1.530187, 0.8657973, -0.9091926, 1, 0, 0.3960784, 1,
1.531561, 0.1511434, 1.876874, 1, 0, 0.3882353, 1,
1.550571, -0.429633, 1.96255, 1, 0, 0.3843137, 1,
1.553674, 0.08284011, 0.8346763, 1, 0, 0.3764706, 1,
1.563535, -0.5936459, 2.886091, 1, 0, 0.372549, 1,
1.5814, 0.4058307, 2.367965, 1, 0, 0.3647059, 1,
1.588109, 2.01601, 0.1186668, 1, 0, 0.3607843, 1,
1.593224, -0.7027271, 0.5636857, 1, 0, 0.3529412, 1,
1.595027, -0.5631607, 1.941223, 1, 0, 0.3490196, 1,
1.624535, -1.410109, 2.953345, 1, 0, 0.3411765, 1,
1.627013, 0.534667, 0.4422105, 1, 0, 0.3372549, 1,
1.63832, 1.851028, 1.777628, 1, 0, 0.3294118, 1,
1.645452, -1.111628, 1.412845, 1, 0, 0.3254902, 1,
1.652666, -0.6909454, 1.816718, 1, 0, 0.3176471, 1,
1.667121, -1.644366, 2.172969, 1, 0, 0.3137255, 1,
1.67491, 0.07018522, 1.410919, 1, 0, 0.3058824, 1,
1.698603, 0.4772598, 1.163114, 1, 0, 0.2980392, 1,
1.703635, 0.7894462, 1.732502, 1, 0, 0.2941177, 1,
1.705781, -0.2147231, 1.067391, 1, 0, 0.2862745, 1,
1.717924, -1.138892, 3.038418, 1, 0, 0.282353, 1,
1.718413, -0.08637664, 2.576815, 1, 0, 0.2745098, 1,
1.719705, -1.832297, 1.282758, 1, 0, 0.2705882, 1,
1.738816, 0.9586662, 2.307913, 1, 0, 0.2627451, 1,
1.762632, 1.406391, 1.55765, 1, 0, 0.2588235, 1,
1.772215, -1.148288, 0.4824996, 1, 0, 0.2509804, 1,
1.786145, 1.124982, -0.346536, 1, 0, 0.2470588, 1,
1.794025, -0.3721896, 2.627526, 1, 0, 0.2392157, 1,
1.806115, 1.151938, 2.368313, 1, 0, 0.2352941, 1,
1.832172, 1.296435, 1.595743, 1, 0, 0.227451, 1,
1.865172, 1.257988, 1.920046, 1, 0, 0.2235294, 1,
1.866518, -0.4747441, 1.794997, 1, 0, 0.2156863, 1,
1.882533, 0.4919918, 2.21527, 1, 0, 0.2117647, 1,
1.892592, 1.608768, 0.9432465, 1, 0, 0.2039216, 1,
1.905893, -0.04113192, 2.901598, 1, 0, 0.1960784, 1,
1.913126, -0.7703744, 2.1098, 1, 0, 0.1921569, 1,
1.913508, 0.8366327, 1.706132, 1, 0, 0.1843137, 1,
1.918902, 0.4994793, 1.813752, 1, 0, 0.1803922, 1,
1.927567, -1.303131, 1.707405, 1, 0, 0.172549, 1,
1.963129, -1.743316, 3.407451, 1, 0, 0.1686275, 1,
1.963646, -1.669565, 2.428776, 1, 0, 0.1607843, 1,
2.007416, -0.09455629, 0.6143866, 1, 0, 0.1568628, 1,
2.009773, -0.1178959, 3.68789, 1, 0, 0.1490196, 1,
2.017601, -1.028888, 0.7654738, 1, 0, 0.145098, 1,
2.028827, -0.3144796, 3.249256, 1, 0, 0.1372549, 1,
2.072322, 1.644042, 0.8656244, 1, 0, 0.1333333, 1,
2.073574, -3.0618, 2.113562, 1, 0, 0.1254902, 1,
2.095983, -1.051988, 0.5665174, 1, 0, 0.1215686, 1,
2.114033, 1.215988, 3.179215, 1, 0, 0.1137255, 1,
2.128543, -0.5998439, 2.943338, 1, 0, 0.1098039, 1,
2.143314, 0.2526055, 3.170857, 1, 0, 0.1019608, 1,
2.15148, -1.204326, 2.194324, 1, 0, 0.09411765, 1,
2.159427, -0.06529239, 2.30893, 1, 0, 0.09019608, 1,
2.165348, -0.6775289, 0.3123606, 1, 0, 0.08235294, 1,
2.192976, -0.03396689, 2.839385, 1, 0, 0.07843138, 1,
2.307325, -0.1907956, 2.943433, 1, 0, 0.07058824, 1,
2.325749, 0.6616804, 0.2448106, 1, 0, 0.06666667, 1,
2.349797, 1.103615, 1.639802, 1, 0, 0.05882353, 1,
2.398135, 0.9406683, 1.34295, 1, 0, 0.05490196, 1,
2.483801, -0.2705359, 1.693799, 1, 0, 0.04705882, 1,
2.531277, 0.9054005, 0.06408985, 1, 0, 0.04313726, 1,
2.557411, -0.1552064, 1.745116, 1, 0, 0.03529412, 1,
2.628088, 1.8038, 3.322967, 1, 0, 0.03137255, 1,
2.684805, -0.3439533, 0.436743, 1, 0, 0.02352941, 1,
2.800387, -0.6303539, 1.322112, 1, 0, 0.01960784, 1,
2.928989, -0.2053097, 0.9420982, 1, 0, 0.01176471, 1,
3.233168, 0.659119, 2.16045, 1, 0, 0.007843138, 1
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
0.2635576, -4.404085, -6.834401, 0, -0.5, 0.5, 0.5,
0.2635576, -4.404085, -6.834401, 1, -0.5, 0.5, 0.5,
0.2635576, -4.404085, -6.834401, 1, 1.5, 0.5, 0.5,
0.2635576, -4.404085, -6.834401, 0, 1.5, 0.5, 0.5
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
-3.712751, -0.05026495, -6.834401, 0, -0.5, 0.5, 0.5,
-3.712751, -0.05026495, -6.834401, 1, -0.5, 0.5, 0.5,
-3.712751, -0.05026495, -6.834401, 1, 1.5, 0.5, 0.5,
-3.712751, -0.05026495, -6.834401, 0, 1.5, 0.5, 0.5
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
-3.712751, -4.404085, 0.5027552, 0, -0.5, 0.5, 0.5,
-3.712751, -4.404085, 0.5027552, 1, -0.5, 0.5, 0.5,
-3.712751, -4.404085, 0.5027552, 1, 1.5, 0.5, 0.5,
-3.712751, -4.404085, 0.5027552, 0, 1.5, 0.5, 0.5
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
-2, -3.399357, -5.141211,
3, -3.399357, -5.141211,
-2, -3.399357, -5.141211,
-2, -3.566812, -5.423409,
-1, -3.399357, -5.141211,
-1, -3.566812, -5.423409,
0, -3.399357, -5.141211,
0, -3.566812, -5.423409,
1, -3.399357, -5.141211,
1, -3.566812, -5.423409,
2, -3.399357, -5.141211,
2, -3.566812, -5.423409,
3, -3.399357, -5.141211,
3, -3.566812, -5.423409
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
-2, -3.901721, -5.987805, 0, -0.5, 0.5, 0.5,
-2, -3.901721, -5.987805, 1, -0.5, 0.5, 0.5,
-2, -3.901721, -5.987805, 1, 1.5, 0.5, 0.5,
-2, -3.901721, -5.987805, 0, 1.5, 0.5, 0.5,
-1, -3.901721, -5.987805, 0, -0.5, 0.5, 0.5,
-1, -3.901721, -5.987805, 1, -0.5, 0.5, 0.5,
-1, -3.901721, -5.987805, 1, 1.5, 0.5, 0.5,
-1, -3.901721, -5.987805, 0, 1.5, 0.5, 0.5,
0, -3.901721, -5.987805, 0, -0.5, 0.5, 0.5,
0, -3.901721, -5.987805, 1, -0.5, 0.5, 0.5,
0, -3.901721, -5.987805, 1, 1.5, 0.5, 0.5,
0, -3.901721, -5.987805, 0, 1.5, 0.5, 0.5,
1, -3.901721, -5.987805, 0, -0.5, 0.5, 0.5,
1, -3.901721, -5.987805, 1, -0.5, 0.5, 0.5,
1, -3.901721, -5.987805, 1, 1.5, 0.5, 0.5,
1, -3.901721, -5.987805, 0, 1.5, 0.5, 0.5,
2, -3.901721, -5.987805, 0, -0.5, 0.5, 0.5,
2, -3.901721, -5.987805, 1, -0.5, 0.5, 0.5,
2, -3.901721, -5.987805, 1, 1.5, 0.5, 0.5,
2, -3.901721, -5.987805, 0, 1.5, 0.5, 0.5,
3, -3.901721, -5.987805, 0, -0.5, 0.5, 0.5,
3, -3.901721, -5.987805, 1, -0.5, 0.5, 0.5,
3, -3.901721, -5.987805, 1, 1.5, 0.5, 0.5,
3, -3.901721, -5.987805, 0, 1.5, 0.5, 0.5
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
-2.795142, -3, -5.141211,
-2.795142, 3, -5.141211,
-2.795142, -3, -5.141211,
-2.948076, -3, -5.423409,
-2.795142, -2, -5.141211,
-2.948076, -2, -5.423409,
-2.795142, -1, -5.141211,
-2.948076, -1, -5.423409,
-2.795142, 0, -5.141211,
-2.948076, 0, -5.423409,
-2.795142, 1, -5.141211,
-2.948076, 1, -5.423409,
-2.795142, 2, -5.141211,
-2.948076, 2, -5.423409,
-2.795142, 3, -5.141211,
-2.948076, 3, -5.423409
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
-3.253947, -3, -5.987805, 0, -0.5, 0.5, 0.5,
-3.253947, -3, -5.987805, 1, -0.5, 0.5, 0.5,
-3.253947, -3, -5.987805, 1, 1.5, 0.5, 0.5,
-3.253947, -3, -5.987805, 0, 1.5, 0.5, 0.5,
-3.253947, -2, -5.987805, 0, -0.5, 0.5, 0.5,
-3.253947, -2, -5.987805, 1, -0.5, 0.5, 0.5,
-3.253947, -2, -5.987805, 1, 1.5, 0.5, 0.5,
-3.253947, -2, -5.987805, 0, 1.5, 0.5, 0.5,
-3.253947, -1, -5.987805, 0, -0.5, 0.5, 0.5,
-3.253947, -1, -5.987805, 1, -0.5, 0.5, 0.5,
-3.253947, -1, -5.987805, 1, 1.5, 0.5, 0.5,
-3.253947, -1, -5.987805, 0, 1.5, 0.5, 0.5,
-3.253947, 0, -5.987805, 0, -0.5, 0.5, 0.5,
-3.253947, 0, -5.987805, 1, -0.5, 0.5, 0.5,
-3.253947, 0, -5.987805, 1, 1.5, 0.5, 0.5,
-3.253947, 0, -5.987805, 0, 1.5, 0.5, 0.5,
-3.253947, 1, -5.987805, 0, -0.5, 0.5, 0.5,
-3.253947, 1, -5.987805, 1, -0.5, 0.5, 0.5,
-3.253947, 1, -5.987805, 1, 1.5, 0.5, 0.5,
-3.253947, 1, -5.987805, 0, 1.5, 0.5, 0.5,
-3.253947, 2, -5.987805, 0, -0.5, 0.5, 0.5,
-3.253947, 2, -5.987805, 1, -0.5, 0.5, 0.5,
-3.253947, 2, -5.987805, 1, 1.5, 0.5, 0.5,
-3.253947, 2, -5.987805, 0, 1.5, 0.5, 0.5,
-3.253947, 3, -5.987805, 0, -0.5, 0.5, 0.5,
-3.253947, 3, -5.987805, 1, -0.5, 0.5, 0.5,
-3.253947, 3, -5.987805, 1, 1.5, 0.5, 0.5,
-3.253947, 3, -5.987805, 0, 1.5, 0.5, 0.5
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
-2.795142, -3.399357, -4,
-2.795142, -3.399357, 4,
-2.795142, -3.399357, -4,
-2.948076, -3.566812, -4,
-2.795142, -3.399357, -2,
-2.948076, -3.566812, -2,
-2.795142, -3.399357, 0,
-2.948076, -3.566812, 0,
-2.795142, -3.399357, 2,
-2.948076, -3.566812, 2,
-2.795142, -3.399357, 4,
-2.948076, -3.566812, 4
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
-3.253947, -3.901721, -4, 0, -0.5, 0.5, 0.5,
-3.253947, -3.901721, -4, 1, -0.5, 0.5, 0.5,
-3.253947, -3.901721, -4, 1, 1.5, 0.5, 0.5,
-3.253947, -3.901721, -4, 0, 1.5, 0.5, 0.5,
-3.253947, -3.901721, -2, 0, -0.5, 0.5, 0.5,
-3.253947, -3.901721, -2, 1, -0.5, 0.5, 0.5,
-3.253947, -3.901721, -2, 1, 1.5, 0.5, 0.5,
-3.253947, -3.901721, -2, 0, 1.5, 0.5, 0.5,
-3.253947, -3.901721, 0, 0, -0.5, 0.5, 0.5,
-3.253947, -3.901721, 0, 1, -0.5, 0.5, 0.5,
-3.253947, -3.901721, 0, 1, 1.5, 0.5, 0.5,
-3.253947, -3.901721, 0, 0, 1.5, 0.5, 0.5,
-3.253947, -3.901721, 2, 0, -0.5, 0.5, 0.5,
-3.253947, -3.901721, 2, 1, -0.5, 0.5, 0.5,
-3.253947, -3.901721, 2, 1, 1.5, 0.5, 0.5,
-3.253947, -3.901721, 2, 0, 1.5, 0.5, 0.5,
-3.253947, -3.901721, 4, 0, -0.5, 0.5, 0.5,
-3.253947, -3.901721, 4, 1, -0.5, 0.5, 0.5,
-3.253947, -3.901721, 4, 1, 1.5, 0.5, 0.5,
-3.253947, -3.901721, 4, 0, 1.5, 0.5, 0.5
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
-2.795142, -3.399357, -5.141211,
-2.795142, 3.298827, -5.141211,
-2.795142, -3.399357, 6.146721,
-2.795142, 3.298827, 6.146721,
-2.795142, -3.399357, -5.141211,
-2.795142, -3.399357, 6.146721,
-2.795142, 3.298827, -5.141211,
-2.795142, 3.298827, 6.146721,
-2.795142, -3.399357, -5.141211,
3.322257, -3.399357, -5.141211,
-2.795142, -3.399357, 6.146721,
3.322257, -3.399357, 6.146721,
-2.795142, 3.298827, -5.141211,
3.322257, 3.298827, -5.141211,
-2.795142, 3.298827, 6.146721,
3.322257, 3.298827, 6.146721,
3.322257, -3.399357, -5.141211,
3.322257, 3.298827, -5.141211,
3.322257, -3.399357, 6.146721,
3.322257, 3.298827, 6.146721,
3.322257, -3.399357, -5.141211,
3.322257, -3.399357, 6.146721,
3.322257, 3.298827, -5.141211,
3.322257, 3.298827, 6.146721
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
var radius = 7.732689;
var distance = 34.40361;
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
mvMatrix.translate( -0.2635576, 0.05026495, -0.5027552 );
mvMatrix.scale( 1.366714, 1.248209, 0.740679 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.40361);
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
difenacoum<-read.table("difenacoum.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-difenacoum$V2
```

```
## Error in eval(expr, envir, enclos): object 'difenacoum' not found
```

```r
y<-difenacoum$V3
```

```
## Error in eval(expr, envir, enclos): object 'difenacoum' not found
```

```r
z<-difenacoum$V4
```

```
## Error in eval(expr, envir, enclos): object 'difenacoum' not found
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
-2.706053, 0.364617, -0.4922903, 0, 0, 1, 1, 1,
-2.647842, -1.684636, -0.6200395, 1, 0, 0, 1, 1,
-2.643537, -0.170397, -3.374279, 1, 0, 0, 1, 1,
-2.571867, 0.8591939, -1.825707, 1, 0, 0, 1, 1,
-2.461012, -0.6051854, 0.1440342, 1, 0, 0, 1, 1,
-2.280576, -1.198076, -3.669322, 1, 0, 0, 1, 1,
-2.274785, 1.073119, -1.083135, 0, 0, 0, 1, 1,
-2.139341, 0.4571915, -2.092499, 0, 0, 0, 1, 1,
-2.096344, -0.08047924, -1.224917, 0, 0, 0, 1, 1,
-2.064031, -1.539816, -1.328593, 0, 0, 0, 1, 1,
-2.059108, -0.5815855, -3.474058, 0, 0, 0, 1, 1,
-2.059101, 0.1306263, 0.518488, 0, 0, 0, 1, 1,
-2.038223, 0.2369076, -1.817949, 0, 0, 0, 1, 1,
-2.024392, 0.1533909, 0.6077636, 1, 1, 1, 1, 1,
-2.000744, -0.1277311, -2.84697, 1, 1, 1, 1, 1,
-1.971481, 0.4148127, -0.1688419, 1, 1, 1, 1, 1,
-1.968399, -0.7625844, -1.014764, 1, 1, 1, 1, 1,
-1.959355, -0.1543596, -0.6147255, 1, 1, 1, 1, 1,
-1.940578, -0.2318254, -2.257383, 1, 1, 1, 1, 1,
-1.873917, -0.8988143, -1.676462, 1, 1, 1, 1, 1,
-1.856711, -0.4752365, -0.9651599, 1, 1, 1, 1, 1,
-1.846953, -0.9160576, -2.679338, 1, 1, 1, 1, 1,
-1.836925, 0.4462335, -1.447029, 1, 1, 1, 1, 1,
-1.835058, -0.8784796, -2.671329, 1, 1, 1, 1, 1,
-1.825423, -0.4573239, -1.590793, 1, 1, 1, 1, 1,
-1.823745, -1.240226, -1.177431, 1, 1, 1, 1, 1,
-1.738628, 0.4313713, 0.2655813, 1, 1, 1, 1, 1,
-1.734446, -0.2866102, -2.533232, 1, 1, 1, 1, 1,
-1.734237, -0.01168165, -1.912704, 0, 0, 1, 1, 1,
-1.722911, -1.306599, -1.910661, 1, 0, 0, 1, 1,
-1.712286, 1.534482, -1.155299, 1, 0, 0, 1, 1,
-1.710884, -0.4223468, -2.018879, 1, 0, 0, 1, 1,
-1.702181, 1.822773, -1.632217, 1, 0, 0, 1, 1,
-1.690809, -0.8080234, -0.7254907, 1, 0, 0, 1, 1,
-1.671769, 0.8029107, -2.868536, 0, 0, 0, 1, 1,
-1.660695, 0.8226842, -1.259938, 0, 0, 0, 1, 1,
-1.657223, 0.7848445, -1.970976, 0, 0, 0, 1, 1,
-1.654407, 0.9476305, -2.271215, 0, 0, 0, 1, 1,
-1.652752, -0.8687318, -3.433202, 0, 0, 0, 1, 1,
-1.63903, -1.701443, -1.77269, 0, 0, 0, 1, 1,
-1.638695, 3.121916, -0.4041886, 0, 0, 0, 1, 1,
-1.624608, -2.066429, -0.6836821, 1, 1, 1, 1, 1,
-1.620964, -1.300506, -2.660109, 1, 1, 1, 1, 1,
-1.612341, 0.2759385, -0.006669554, 1, 1, 1, 1, 1,
-1.596024, -0.915683, -2.146826, 1, 1, 1, 1, 1,
-1.584101, 1.588451, -0.9859197, 1, 1, 1, 1, 1,
-1.579307, -1.730427, -2.770732, 1, 1, 1, 1, 1,
-1.564878, 0.675899, -3.464612, 1, 1, 1, 1, 1,
-1.56109, 2.341506, 0.5357568, 1, 1, 1, 1, 1,
-1.546498, -0.9077922, -2.952588, 1, 1, 1, 1, 1,
-1.543587, -0.8449684, -2.355883, 1, 1, 1, 1, 1,
-1.541547, -0.8179908, -1.993549, 1, 1, 1, 1, 1,
-1.526923, -2.00323, -0.6197621, 1, 1, 1, 1, 1,
-1.523416, -0.8241588, -3.379083, 1, 1, 1, 1, 1,
-1.511859, 0.8165742, -1.809943, 1, 1, 1, 1, 1,
-1.500388, 1.297101, 0.2619165, 1, 1, 1, 1, 1,
-1.489728, 0.3242328, -1.502887, 0, 0, 1, 1, 1,
-1.489624, 0.6386962, -3.253381, 1, 0, 0, 1, 1,
-1.486249, 0.4434806, -1.037859, 1, 0, 0, 1, 1,
-1.484989, 0.2488234, 0.6050056, 1, 0, 0, 1, 1,
-1.475924, -0.4091577, -2.334279, 1, 0, 0, 1, 1,
-1.46841, 0.945185, 1.285614, 1, 0, 0, 1, 1,
-1.465031, 1.086043, -0.4010409, 0, 0, 0, 1, 1,
-1.463409, -1.15169, -1.153305, 0, 0, 0, 1, 1,
-1.440496, -1.057102, -3.179721, 0, 0, 0, 1, 1,
-1.43688, -0.6687157, -1.892718, 0, 0, 0, 1, 1,
-1.432088, -1.633204, -4.006702, 0, 0, 0, 1, 1,
-1.427626, -1.160821, -1.499766, 0, 0, 0, 1, 1,
-1.425724, -0.8286185, -0.9311866, 0, 0, 0, 1, 1,
-1.422856, -0.8682389, -1.316113, 1, 1, 1, 1, 1,
-1.418721, -0.8971642, -3.180187, 1, 1, 1, 1, 1,
-1.418357, -1.139706, -0.8524711, 1, 1, 1, 1, 1,
-1.418071, -0.4731966, -2.587425, 1, 1, 1, 1, 1,
-1.416274, -1.498116, -1.565061, 1, 1, 1, 1, 1,
-1.411098, 0.6567166, -0.9284776, 1, 1, 1, 1, 1,
-1.410711, 0.7074432, -1.429674, 1, 1, 1, 1, 1,
-1.409451, -0.1738578, -2.023084, 1, 1, 1, 1, 1,
-1.399397, -2.118394, -2.689314, 1, 1, 1, 1, 1,
-1.391695, 0.8474764, -1.683627, 1, 1, 1, 1, 1,
-1.386626, -0.1472307, -2.108172, 1, 1, 1, 1, 1,
-1.377847, -0.4409165, -2.256915, 1, 1, 1, 1, 1,
-1.358341, -1.15866, -0.9229273, 1, 1, 1, 1, 1,
-1.35124, 2.296756, 0.06036365, 1, 1, 1, 1, 1,
-1.33266, 0.9879556, -1.488818, 1, 1, 1, 1, 1,
-1.330648, -0.7592568, -2.229603, 0, 0, 1, 1, 1,
-1.315581, -1.246061, -2.474349, 1, 0, 0, 1, 1,
-1.315148, -1.429204, -3.018689, 1, 0, 0, 1, 1,
-1.309123, 0.09922479, -1.562599, 1, 0, 0, 1, 1,
-1.30368, -0.5478287, -2.733525, 1, 0, 0, 1, 1,
-1.30305, -1.089802, -2.141416, 1, 0, 0, 1, 1,
-1.293125, 0.4436473, -1.983407, 0, 0, 0, 1, 1,
-1.293097, 0.09808253, -0.2750298, 0, 0, 0, 1, 1,
-1.292034, -0.3705613, -2.398778, 0, 0, 0, 1, 1,
-1.283682, 0.02835445, -2.866215, 0, 0, 0, 1, 1,
-1.279249, -1.3235, -3.858895, 0, 0, 0, 1, 1,
-1.27919, 0.6331068, -1.82728, 0, 0, 0, 1, 1,
-1.278168, 0.9524648, -2.396281, 0, 0, 0, 1, 1,
-1.274194, 0.15005, -4.072247, 1, 1, 1, 1, 1,
-1.264394, 0.5574962, 1.137634, 1, 1, 1, 1, 1,
-1.256511, -0.3231114, -0.7494848, 1, 1, 1, 1, 1,
-1.25271, -0.9030249, -1.82182, 1, 1, 1, 1, 1,
-1.252224, -1.790227, -1.968664, 1, 1, 1, 1, 1,
-1.248067, 1.457493, -1.263291, 1, 1, 1, 1, 1,
-1.241633, -1.426316, -2.903545, 1, 1, 1, 1, 1,
-1.239385, -1.224669, -2.783838, 1, 1, 1, 1, 1,
-1.233915, 1.7862, 0.3522555, 1, 1, 1, 1, 1,
-1.231591, 1.3683, 0.6403722, 1, 1, 1, 1, 1,
-1.223011, 0.5232211, -0.9167201, 1, 1, 1, 1, 1,
-1.212142, -0.2392391, -2.20989, 1, 1, 1, 1, 1,
-1.195261, 0.2716142, -0.1675687, 1, 1, 1, 1, 1,
-1.184322, -1.557464, -3.462732, 1, 1, 1, 1, 1,
-1.180387, 0.4961298, -1.453926, 1, 1, 1, 1, 1,
-1.179947, 1.548383, -0.8864987, 0, 0, 1, 1, 1,
-1.170282, 0.7049171, -2.198466, 1, 0, 0, 1, 1,
-1.17012, -0.9300184, -1.917703, 1, 0, 0, 1, 1,
-1.165272, 0.9764779, -0.7323277, 1, 0, 0, 1, 1,
-1.164721, 1.020417, -1.546924, 1, 0, 0, 1, 1,
-1.164311, 0.4227294, 0.3391423, 1, 0, 0, 1, 1,
-1.162124, 0.0450441, -1.301036, 0, 0, 0, 1, 1,
-1.161923, 1.52433, -0.1845252, 0, 0, 0, 1, 1,
-1.161111, -1.114553, -3.253073, 0, 0, 0, 1, 1,
-1.161107, -1.048995, -2.361128, 0, 0, 0, 1, 1,
-1.154241, -2.598209, -2.320919, 0, 0, 0, 1, 1,
-1.146722, -0.6674132, -2.506674, 0, 0, 0, 1, 1,
-1.145835, -2.417035, -3.024486, 0, 0, 0, 1, 1,
-1.1329, 0.4164582, -1.48066, 1, 1, 1, 1, 1,
-1.124917, 0.2868912, -1.051963, 1, 1, 1, 1, 1,
-1.122892, 0.9656097, -2.207427, 1, 1, 1, 1, 1,
-1.117622, 2.479115, 0.2277845, 1, 1, 1, 1, 1,
-1.116904, 0.1526604, -0.9495047, 1, 1, 1, 1, 1,
-1.114999, 1.157189, 1.019042, 1, 1, 1, 1, 1,
-1.112513, -0.1358455, -1.439981, 1, 1, 1, 1, 1,
-1.112463, 0.06651842, -1.295358, 1, 1, 1, 1, 1,
-1.111555, 0.4859336, -3.078757, 1, 1, 1, 1, 1,
-1.102641, -0.989131, -2.217121, 1, 1, 1, 1, 1,
-1.094715, -1.215631, -2.5755, 1, 1, 1, 1, 1,
-1.081154, -1.5709, -2.191651, 1, 1, 1, 1, 1,
-1.079438, 1.210413, -0.6815425, 1, 1, 1, 1, 1,
-1.074309, -2.368913, -2.323903, 1, 1, 1, 1, 1,
-1.072377, -0.5912216, -1.037423, 1, 1, 1, 1, 1,
-1.068544, 0.1348546, -2.558301, 0, 0, 1, 1, 1,
-1.067458, 1.19404, -1.090615, 1, 0, 0, 1, 1,
-1.061382, -0.04282204, -0.7442978, 1, 0, 0, 1, 1,
-1.061129, -0.9306361, -2.276123, 1, 0, 0, 1, 1,
-1.054539, -0.5468878, -1.555517, 1, 0, 0, 1, 1,
-1.052892, 0.8865172, -0.9298911, 1, 0, 0, 1, 1,
-1.046385, 0.8804389, -0.9788995, 0, 0, 0, 1, 1,
-1.043988, 0.821053, -0.01271289, 0, 0, 0, 1, 1,
-1.042442, 0.6332787, -1.472572, 0, 0, 0, 1, 1,
-1.041975, -1.448431, -3.20962, 0, 0, 0, 1, 1,
-1.040626, -0.2878718, -1.277033, 0, 0, 0, 1, 1,
-1.035576, -0.09865484, -1.761463, 0, 0, 0, 1, 1,
-1.029682, -0.158943, -2.273996, 0, 0, 0, 1, 1,
-1.02914, 0.0690272, -0.9688073, 1, 1, 1, 1, 1,
-1.025386, -1.453219, -2.990556, 1, 1, 1, 1, 1,
-1.024729, -1.028494, -3.734087, 1, 1, 1, 1, 1,
-1.015612, -1.474255, -1.411044, 1, 1, 1, 1, 1,
-1.014714, 0.9025244, -1.775798, 1, 1, 1, 1, 1,
-1.012329, -0.9792156, -1.101117, 1, 1, 1, 1, 1,
-1.01147, 0.08565429, -0.3328889, 1, 1, 1, 1, 1,
-1.006165, 0.9062776, -1.020448, 1, 1, 1, 1, 1,
-1.005843, 0.4487705, 0.0073186, 1, 1, 1, 1, 1,
-1.002527, -0.007845186, -3.062792, 1, 1, 1, 1, 1,
-0.9899675, 0.02347056, -1.997005, 1, 1, 1, 1, 1,
-0.9822834, 0.2358954, -2.068565, 1, 1, 1, 1, 1,
-0.9766929, -1.698432, -2.280051, 1, 1, 1, 1, 1,
-0.9723721, 0.4835793, -2.317183, 1, 1, 1, 1, 1,
-0.9720333, -1.78635, -2.28399, 1, 1, 1, 1, 1,
-0.9679275, 1.469482, 2.161583, 0, 0, 1, 1, 1,
-0.9613711, -1.154396, -1.671796, 1, 0, 0, 1, 1,
-0.9524938, 0.978218, -2.43258, 1, 0, 0, 1, 1,
-0.939339, -0.169745, -0.782317, 1, 0, 0, 1, 1,
-0.9385235, 0.6435163, 0.004893146, 1, 0, 0, 1, 1,
-0.9383338, -1.160535, -1.483272, 1, 0, 0, 1, 1,
-0.935178, -0.07569741, -1.501898, 0, 0, 0, 1, 1,
-0.9343418, 0.640074, -1.003231, 0, 0, 0, 1, 1,
-0.9302555, -0.3407255, -2.141418, 0, 0, 0, 1, 1,
-0.9277967, 1.106364, -0.697328, 0, 0, 0, 1, 1,
-0.9267622, -0.654425, -1.479091, 0, 0, 0, 1, 1,
-0.9225234, 0.09648497, -2.253284, 0, 0, 0, 1, 1,
-0.917272, -0.5222413, -2.888405, 0, 0, 0, 1, 1,
-0.9164127, -2.363555, -2.935034, 1, 1, 1, 1, 1,
-0.9124904, -0.3362027, -1.287363, 1, 1, 1, 1, 1,
-0.9090095, -0.7971277, -3.808813, 1, 1, 1, 1, 1,
-0.9043523, -1.223135, -2.190759, 1, 1, 1, 1, 1,
-0.9039603, -1.322784, -0.4143367, 1, 1, 1, 1, 1,
-0.8956065, -0.6652703, -2.319149, 1, 1, 1, 1, 1,
-0.8867235, 1.950573, -1.282588, 1, 1, 1, 1, 1,
-0.8791693, -1.919465, -4.240792, 1, 1, 1, 1, 1,
-0.87523, -0.5704572, -1.760607, 1, 1, 1, 1, 1,
-0.8726575, 0.3163449, -2.301859, 1, 1, 1, 1, 1,
-0.8696319, -0.8379213, -2.987124, 1, 1, 1, 1, 1,
-0.8690094, -1.348694, -1.776052, 1, 1, 1, 1, 1,
-0.8683442, -1.259059, -2.242775, 1, 1, 1, 1, 1,
-0.8678107, -0.7471237, -2.481739, 1, 1, 1, 1, 1,
-0.8651589, 0.4415858, 0.6636017, 1, 1, 1, 1, 1,
-0.8613469, 0.4134145, -0.5280614, 0, 0, 1, 1, 1,
-0.860617, 0.6932846, -1.062148, 1, 0, 0, 1, 1,
-0.8531207, 1.929312, -1.479983, 1, 0, 0, 1, 1,
-0.8507516, 1.880515, 0.1023566, 1, 0, 0, 1, 1,
-0.8498138, 1.876446, -0.7650717, 1, 0, 0, 1, 1,
-0.8470088, 0.2363457, -2.519631, 1, 0, 0, 1, 1,
-0.8461148, -1.145317, -1.966815, 0, 0, 0, 1, 1,
-0.8447248, -0.7703329, -3.476533, 0, 0, 0, 1, 1,
-0.8431642, 1.363445, -0.5960808, 0, 0, 0, 1, 1,
-0.8427873, 0.5509605, 0.01259718, 0, 0, 0, 1, 1,
-0.841895, 0.9741927, -1.031699, 0, 0, 0, 1, 1,
-0.8394043, -0.2645721, -2.89939, 0, 0, 0, 1, 1,
-0.8335903, -2.271201, -2.36958, 0, 0, 0, 1, 1,
-0.8217004, 0.2053368, -0.5866599, 1, 1, 1, 1, 1,
-0.8202683, 1.063484, 1.269874, 1, 1, 1, 1, 1,
-0.819918, 1.931734, -1.0523, 1, 1, 1, 1, 1,
-0.8168035, 0.8249634, -1.832856, 1, 1, 1, 1, 1,
-0.8160925, 0.362439, -2.565024, 1, 1, 1, 1, 1,
-0.8152165, 1.456637, -1.900779, 1, 1, 1, 1, 1,
-0.8092845, -0.3434809, -1.958666, 1, 1, 1, 1, 1,
-0.8086485, -0.9948146, -2.391356, 1, 1, 1, 1, 1,
-0.8058506, -2.79123, -2.639802, 1, 1, 1, 1, 1,
-0.7996289, 0.374992, -0.09980422, 1, 1, 1, 1, 1,
-0.7989709, -1.220176, -1.433244, 1, 1, 1, 1, 1,
-0.7960386, 0.8170715, -1.369691, 1, 1, 1, 1, 1,
-0.7947593, 0.3788572, -0.4840049, 1, 1, 1, 1, 1,
-0.7917171, -0.4043868, -1.521993, 1, 1, 1, 1, 1,
-0.786413, -1.314461, -4.140377, 1, 1, 1, 1, 1,
-0.7845569, 0.4380085, -1.61116, 0, 0, 1, 1, 1,
-0.7776967, -0.9609776, -2.786839, 1, 0, 0, 1, 1,
-0.7759, 0.1082238, -2.670394, 1, 0, 0, 1, 1,
-0.7754372, 1.325769, -0.4952163, 1, 0, 0, 1, 1,
-0.7694455, -0.1759192, -0.5893701, 1, 0, 0, 1, 1,
-0.7622109, 0.9021732, -3.082798, 1, 0, 0, 1, 1,
-0.7610887, 1.849322, -0.2044453, 0, 0, 0, 1, 1,
-0.7598631, 0.609456, -0.9679857, 0, 0, 0, 1, 1,
-0.7597647, -0.3951269, -0.6914359, 0, 0, 0, 1, 1,
-0.7577274, -0.4808457, -2.834209, 0, 0, 0, 1, 1,
-0.7573622, 1.050128, -0.7652181, 0, 0, 0, 1, 1,
-0.750278, 1.431631, -0.3672943, 0, 0, 0, 1, 1,
-0.7485306, -0.6969905, -3.836534, 0, 0, 0, 1, 1,
-0.7460783, 1.44507, 0.1801857, 1, 1, 1, 1, 1,
-0.7459383, 0.3741827, -2.878392, 1, 1, 1, 1, 1,
-0.7454563, 1.878683, -1.654902, 1, 1, 1, 1, 1,
-0.745438, 0.2049188, -1.090784, 1, 1, 1, 1, 1,
-0.7362304, -0.8794589, -1.172056, 1, 1, 1, 1, 1,
-0.7285333, 1.456832, 0.577777, 1, 1, 1, 1, 1,
-0.7280107, 0.846518, -1.392942, 1, 1, 1, 1, 1,
-0.7277636, 0.810218, 0.03417279, 1, 1, 1, 1, 1,
-0.7229684, 0.2311048, -2.291732, 1, 1, 1, 1, 1,
-0.71746, -0.7162045, -3.60074, 1, 1, 1, 1, 1,
-0.7122296, -0.4810763, -2.903294, 1, 1, 1, 1, 1,
-0.7067986, 0.8265563, 0.2767822, 1, 1, 1, 1, 1,
-0.7026107, 0.7894486, -0.6705944, 1, 1, 1, 1, 1,
-0.6998762, -1.120589, -2.102667, 1, 1, 1, 1, 1,
-0.6976146, 1.080299, -1.348, 1, 1, 1, 1, 1,
-0.6968377, 0.06596922, -1.912127, 0, 0, 1, 1, 1,
-0.6964566, -1.332088, -3.261698, 1, 0, 0, 1, 1,
-0.6910111, -0.2506777, -2.77232, 1, 0, 0, 1, 1,
-0.6871482, 0.734829, -0.6058978, 1, 0, 0, 1, 1,
-0.6811371, 0.9243932, -1.145407, 1, 0, 0, 1, 1,
-0.6795542, -1.359124, -1.392255, 1, 0, 0, 1, 1,
-0.6785627, -0.3099265, -2.24744, 0, 0, 0, 1, 1,
-0.6713144, -0.168208, 0.4584363, 0, 0, 0, 1, 1,
-0.6689498, 0.001682503, -2.632072, 0, 0, 0, 1, 1,
-0.6658043, 0.2515543, -0.1502491, 0, 0, 0, 1, 1,
-0.6609764, -0.3025376, -1.759497, 0, 0, 0, 1, 1,
-0.6595426, -0.5673129, -2.582293, 0, 0, 0, 1, 1,
-0.6576177, -1.139892, -2.940861, 0, 0, 0, 1, 1,
-0.6528979, 0.3490567, -1.342867, 1, 1, 1, 1, 1,
-0.6450762, 0.02429863, -1.893282, 1, 1, 1, 1, 1,
-0.6447395, -0.473253, -1.662773, 1, 1, 1, 1, 1,
-0.643178, 0.1356744, -1.629529, 1, 1, 1, 1, 1,
-0.640274, -1.495906, -2.444113, 1, 1, 1, 1, 1,
-0.6351772, 0.7208755, -2.681222, 1, 1, 1, 1, 1,
-0.6341824, 1.057266, -0.8140283, 1, 1, 1, 1, 1,
-0.6305886, -2.296315, -4.955999, 1, 1, 1, 1, 1,
-0.6246212, -1.17474, -3.947024, 1, 1, 1, 1, 1,
-0.6196256, 0.4152365, 0.4470328, 1, 1, 1, 1, 1,
-0.6181018, -1.287055, -2.582933, 1, 1, 1, 1, 1,
-0.617219, 0.8752181, 0.164463, 1, 1, 1, 1, 1,
-0.6140083, 0.635885, -1.702466, 1, 1, 1, 1, 1,
-0.6139274, -0.911323, -2.456606, 1, 1, 1, 1, 1,
-0.6109399, -1.040621, -0.7089784, 1, 1, 1, 1, 1,
-0.6093517, -0.6842596, -2.739, 0, 0, 1, 1, 1,
-0.6012799, -0.5457584, -2.662361, 1, 0, 0, 1, 1,
-0.6011735, 2.707462, 0.9337429, 1, 0, 0, 1, 1,
-0.6005008, 0.6098347, -0.7365142, 1, 0, 0, 1, 1,
-0.5957469, 0.3897119, -1.207491, 1, 0, 0, 1, 1,
-0.5945651, 0.5687155, -0.6183192, 1, 0, 0, 1, 1,
-0.5933499, -0.2952152, -2.016233, 0, 0, 0, 1, 1,
-0.5932791, 0.222831, 1.275445, 0, 0, 0, 1, 1,
-0.5921494, -0.8420421, -2.364277, 0, 0, 0, 1, 1,
-0.590812, 0.2293203, -1.507919, 0, 0, 0, 1, 1,
-0.5848422, -0.7256761, -4.580232, 0, 0, 0, 1, 1,
-0.5836157, -0.4393458, -1.499617, 0, 0, 0, 1, 1,
-0.5815941, -0.05401465, -3.257944, 0, 0, 0, 1, 1,
-0.5772903, -1.030321, -2.183991, 1, 1, 1, 1, 1,
-0.5676442, -0.1153209, -1.659022, 1, 1, 1, 1, 1,
-0.5664368, -0.6473995, -3.452246, 1, 1, 1, 1, 1,
-0.5581546, 0.2714114, -1.155503, 1, 1, 1, 1, 1,
-0.555275, 1.359045, -1.76089, 1, 1, 1, 1, 1,
-0.5551823, 1.314076, -0.03261367, 1, 1, 1, 1, 1,
-0.5539617, -0.2980603, -1.329079, 1, 1, 1, 1, 1,
-0.5528095, -1.802815, -1.674588, 1, 1, 1, 1, 1,
-0.5508606, -0.1663935, -2.127079, 1, 1, 1, 1, 1,
-0.5459543, -0.3389365, -2.762627, 1, 1, 1, 1, 1,
-0.5433626, 0.4595565, -1.242325, 1, 1, 1, 1, 1,
-0.5343499, 2.190985, 0.02458874, 1, 1, 1, 1, 1,
-0.5326773, -0.7044007, -2.563094, 1, 1, 1, 1, 1,
-0.5272177, -0.9347184, -3.346859, 1, 1, 1, 1, 1,
-0.5260113, 1.399938, -0.1222824, 1, 1, 1, 1, 1,
-0.5259394, -1.742458, -2.727671, 0, 0, 1, 1, 1,
-0.5257678, 0.2082394, -0.4055801, 1, 0, 0, 1, 1,
-0.5192222, -3.301811, -2.95778, 1, 0, 0, 1, 1,
-0.5174623, -0.4563142, -2.188979, 1, 0, 0, 1, 1,
-0.5130468, -0.1948173, -1.729391, 1, 0, 0, 1, 1,
-0.5130432, -0.4783445, -2.054489, 1, 0, 0, 1, 1,
-0.5032379, 1.109907, 1.33095, 0, 0, 0, 1, 1,
-0.4932291, 1.196275, -1.230756, 0, 0, 0, 1, 1,
-0.4931183, 0.4501794, -0.2114463, 0, 0, 0, 1, 1,
-0.4912829, 1.98981, 0.665462, 0, 0, 0, 1, 1,
-0.4885502, 0.03824893, -0.9771389, 0, 0, 0, 1, 1,
-0.4848499, 0.06239228, -1.433473, 0, 0, 0, 1, 1,
-0.4838552, -0.9455773, -3.151125, 0, 0, 0, 1, 1,
-0.4834645, -1.360948, -2.409423, 1, 1, 1, 1, 1,
-0.4806875, 0.3223188, -0.2965784, 1, 1, 1, 1, 1,
-0.4762976, 1.594068, -0.3253821, 1, 1, 1, 1, 1,
-0.4618244, 0.9776573, -0.5566834, 1, 1, 1, 1, 1,
-0.4604005, -1.146388, -3.549762, 1, 1, 1, 1, 1,
-0.4546486, 0.3224368, -1.203879, 1, 1, 1, 1, 1,
-0.4494588, -0.8352099, -2.373011, 1, 1, 1, 1, 1,
-0.4457936, 0.7752823, -0.6633743, 1, 1, 1, 1, 1,
-0.4442297, -0.7868254, -2.181269, 1, 1, 1, 1, 1,
-0.4440807, -0.9278544, -3.738115, 1, 1, 1, 1, 1,
-0.4437805, -0.5430829, -2.366292, 1, 1, 1, 1, 1,
-0.4300742, 0.9944118, -0.703454, 1, 1, 1, 1, 1,
-0.4289296, -1.399009, -2.326015, 1, 1, 1, 1, 1,
-0.4194096, 1.411876, -0.7141056, 1, 1, 1, 1, 1,
-0.4188188, -0.5350606, -2.608392, 1, 1, 1, 1, 1,
-0.4178436, -0.3069272, -1.337759, 0, 0, 1, 1, 1,
-0.4176794, 0.518632, 0.2969483, 1, 0, 0, 1, 1,
-0.4140976, 3.1209, -0.9590466, 1, 0, 0, 1, 1,
-0.409823, -2.167191, -3.611914, 1, 0, 0, 1, 1,
-0.4061186, -1.004539, -1.572036, 1, 0, 0, 1, 1,
-0.4053301, 0.2760678, -1.007114, 1, 0, 0, 1, 1,
-0.4036861, 1.091489, -1.214804, 0, 0, 0, 1, 1,
-0.4033265, 0.4363162, 1.49592, 0, 0, 0, 1, 1,
-0.3995036, -0.6201773, -2.180471, 0, 0, 0, 1, 1,
-0.3974537, -0.5582061, -2.232322, 0, 0, 0, 1, 1,
-0.3973636, -0.01945809, -2.657878, 0, 0, 0, 1, 1,
-0.3970557, 0.04519867, -1.578007, 0, 0, 0, 1, 1,
-0.3923198, -1.01892, -3.591852, 0, 0, 0, 1, 1,
-0.3900472, -1.747915, -2.382136, 1, 1, 1, 1, 1,
-0.3883186, -0.7612076, -3.127751, 1, 1, 1, 1, 1,
-0.3802965, 0.8724028, 0.476005, 1, 1, 1, 1, 1,
-0.3759025, -0.6307557, -2.250298, 1, 1, 1, 1, 1,
-0.3698217, -0.1902988, -0.1115502, 1, 1, 1, 1, 1,
-0.3680347, -0.5638878, -2.093721, 1, 1, 1, 1, 1,
-0.3657916, 1.376663, 0.4579821, 1, 1, 1, 1, 1,
-0.3631777, -0.4772295, -1.040021, 1, 1, 1, 1, 1,
-0.3588998, 0.1572149, 0.6731117, 1, 1, 1, 1, 1,
-0.3524301, -1.840592, -3.334596, 1, 1, 1, 1, 1,
-0.3484976, -0.3750955, -2.529466, 1, 1, 1, 1, 1,
-0.3454042, 0.7966168, -0.4055614, 1, 1, 1, 1, 1,
-0.3437358, -0.4659141, -2.077478, 1, 1, 1, 1, 1,
-0.3401446, -0.2095597, -3.195718, 1, 1, 1, 1, 1,
-0.3363186, -0.3582432, -3.019665, 1, 1, 1, 1, 1,
-0.3355099, -0.7290408, -3.153471, 0, 0, 1, 1, 1,
-0.3310429, 0.809817, 0.344168, 1, 0, 0, 1, 1,
-0.3289797, 0.3361728, 0.3457503, 1, 0, 0, 1, 1,
-0.3261702, -1.584108, -2.194681, 1, 0, 0, 1, 1,
-0.3179542, -1.126264, -3.448079, 1, 0, 0, 1, 1,
-0.3136944, 1.689608, -0.3038616, 1, 0, 0, 1, 1,
-0.3112697, 0.009445288, -3.522094, 0, 0, 0, 1, 1,
-0.3088938, -0.8607766, -2.708715, 0, 0, 0, 1, 1,
-0.3087928, -1.668283, -1.896397, 0, 0, 0, 1, 1,
-0.3062838, 0.01302853, -1.718973, 0, 0, 0, 1, 1,
-0.3043424, -0.4227813, -2.172747, 0, 0, 0, 1, 1,
-0.303598, -0.2809298, -2.617481, 0, 0, 0, 1, 1,
-0.2973018, 0.0007912543, -2.914986, 0, 0, 0, 1, 1,
-0.2947416, -0.9317321, -2.126477, 1, 1, 1, 1, 1,
-0.2910304, -0.7261241, -2.103898, 1, 1, 1, 1, 1,
-0.2894169, 0.7936034, -1.389334, 1, 1, 1, 1, 1,
-0.2886127, 0.8941355, -1.009932, 1, 1, 1, 1, 1,
-0.2875326, -0.9452525, -2.735451, 1, 1, 1, 1, 1,
-0.2874144, -1.048747, -2.217143, 1, 1, 1, 1, 1,
-0.2861719, -0.4300003, -2.93487, 1, 1, 1, 1, 1,
-0.2851537, 0.6567359, -0.4050581, 1, 1, 1, 1, 1,
-0.2789478, 0.05957086, -2.233083, 1, 1, 1, 1, 1,
-0.2786634, -0.5195142, -1.093306, 1, 1, 1, 1, 1,
-0.2720899, -0.0887625, -2.327332, 1, 1, 1, 1, 1,
-0.2719918, -0.2943881, -1.894068, 1, 1, 1, 1, 1,
-0.2681104, -0.1200934, -2.89793, 1, 1, 1, 1, 1,
-0.2676239, 1.427474, 1.315747, 1, 1, 1, 1, 1,
-0.2670199, -0.7263089, -2.920166, 1, 1, 1, 1, 1,
-0.265875, -0.1642377, -2.266079, 0, 0, 1, 1, 1,
-0.2650572, -0.5280532, -1.611435, 1, 0, 0, 1, 1,
-0.2630394, -1.504609, -2.338725, 1, 0, 0, 1, 1,
-0.260453, -1.324983, -2.029025, 1, 0, 0, 1, 1,
-0.2546121, 1.590046, 0.07077178, 1, 0, 0, 1, 1,
-0.2533827, -1.306384, -2.662952, 1, 0, 0, 1, 1,
-0.2514608, 0.221917, -0.6818012, 0, 0, 0, 1, 1,
-0.2510084, -0.07657272, -2.179564, 0, 0, 0, 1, 1,
-0.2502309, 1.272609, -0.716404, 0, 0, 0, 1, 1,
-0.2493362, 1.663589, 0.2281226, 0, 0, 0, 1, 1,
-0.2482253, -0.5967158, -2.965411, 0, 0, 0, 1, 1,
-0.2414969, 1.324317, -0.5522125, 0, 0, 0, 1, 1,
-0.227929, 1.795194, -1.588488, 0, 0, 0, 1, 1,
-0.2255178, -1.073483, -1.870605, 1, 1, 1, 1, 1,
-0.225322, -0.4357964, -0.9444888, 1, 1, 1, 1, 1,
-0.2250718, -0.3760171, -3.648441, 1, 1, 1, 1, 1,
-0.2223452, -0.50001, -2.812324, 1, 1, 1, 1, 1,
-0.2209025, -0.6864359, 0.02677453, 1, 1, 1, 1, 1,
-0.2208848, 1.258376, 0.1598057, 1, 1, 1, 1, 1,
-0.2186663, -0.9005731, -3.295664, 1, 1, 1, 1, 1,
-0.2156588, -0.2166338, -1.272215, 1, 1, 1, 1, 1,
-0.214147, -1.122975, -4.473681, 1, 1, 1, 1, 1,
-0.2134261, -0.9549206, -2.853242, 1, 1, 1, 1, 1,
-0.2110793, -1.382006, -2.095693, 1, 1, 1, 1, 1,
-0.2095547, -0.624027, -2.484921, 1, 1, 1, 1, 1,
-0.2092774, 0.2053025, 0.6968512, 1, 1, 1, 1, 1,
-0.204828, -0.9014636, -3.051242, 1, 1, 1, 1, 1,
-0.1929072, 1.722635, -0.1386165, 1, 1, 1, 1, 1,
-0.1885806, 0.3946575, -1.043682, 0, 0, 1, 1, 1,
-0.1866426, -1.455762, -3.019688, 1, 0, 0, 1, 1,
-0.1826084, 0.5385835, 0.03992186, 1, 0, 0, 1, 1,
-0.1815496, 0.5797393, -1.266386, 1, 0, 0, 1, 1,
-0.1790163, -0.3658143, -2.849264, 1, 0, 0, 1, 1,
-0.1755935, 1.763303, 0.2761008, 1, 0, 0, 1, 1,
-0.1737329, -1.570048, -2.53673, 0, 0, 0, 1, 1,
-0.1716227, -0.8806123, -3.934128, 0, 0, 0, 1, 1,
-0.1700119, 0.5256051, -0.4619237, 0, 0, 0, 1, 1,
-0.1697486, 0.05848467, -1.149579, 0, 0, 0, 1, 1,
-0.1679491, 0.0391777, -1.248492, 0, 0, 0, 1, 1,
-0.163708, 0.5384219, 1.418558, 0, 0, 0, 1, 1,
-0.1616725, -0.9049211, -4.165188, 0, 0, 0, 1, 1,
-0.1574674, -0.5106431, -4.071796, 1, 1, 1, 1, 1,
-0.1570605, -0.09918728, -1.785683, 1, 1, 1, 1, 1,
-0.1567471, 0.6564146, -0.9066169, 1, 1, 1, 1, 1,
-0.1548337, 1.117735, -0.2093197, 1, 1, 1, 1, 1,
-0.1537557, -1.493806, -4.235218, 1, 1, 1, 1, 1,
-0.1520489, -0.8833599, -2.177992, 1, 1, 1, 1, 1,
-0.1493406, -0.3524582, -1.981628, 1, 1, 1, 1, 1,
-0.145666, -0.07489488, -0.2989607, 1, 1, 1, 1, 1,
-0.1451418, -1.049662, -4.593622, 1, 1, 1, 1, 1,
-0.1371715, -0.1856918, -2.402028, 1, 1, 1, 1, 1,
-0.1302496, -0.3966187, -2.284605, 1, 1, 1, 1, 1,
-0.1301838, 0.1810025, -1.248619, 1, 1, 1, 1, 1,
-0.1295266, 0.3196637, 0.2171902, 1, 1, 1, 1, 1,
-0.1294804, 0.4182947, 0.465497, 1, 1, 1, 1, 1,
-0.1269866, -0.8825278, -2.472263, 1, 1, 1, 1, 1,
-0.1268218, -1.115257, -2.916309, 0, 0, 1, 1, 1,
-0.1252488, 1.268994, -1.285339, 1, 0, 0, 1, 1,
-0.1243653, -2.129586, -3.73543, 1, 0, 0, 1, 1,
-0.1163117, -0.8031947, -3.103231, 1, 0, 0, 1, 1,
-0.09928448, -1.374656, -4.976823, 1, 0, 0, 1, 1,
-0.09882633, -0.1022663, -1.908612, 1, 0, 0, 1, 1,
-0.08900611, 0.3934484, -1.411006, 0, 0, 0, 1, 1,
-0.08874389, 1.287525, -0.1568354, 0, 0, 0, 1, 1,
-0.08797773, 0.02180498, -3.210569, 0, 0, 0, 1, 1,
-0.08297825, 0.07606872, -2.640354, 0, 0, 0, 1, 1,
-0.08260442, -0.120476, -2.222692, 0, 0, 0, 1, 1,
-0.08177706, -0.4638808, -3.381433, 0, 0, 0, 1, 1,
-0.08068421, 0.1184049, -1.054339, 0, 0, 0, 1, 1,
-0.07818875, 0.5559814, -0.9493738, 1, 1, 1, 1, 1,
-0.07615338, 0.01422718, -1.484137, 1, 1, 1, 1, 1,
-0.07092851, -1.638024, -3.689038, 1, 1, 1, 1, 1,
-0.06859497, -1.98998, -2.837682, 1, 1, 1, 1, 1,
-0.06809996, -0.1730993, -2.741138, 1, 1, 1, 1, 1,
-0.06703052, 1.40682, -0.2679978, 1, 1, 1, 1, 1,
-0.06525299, -1.257524, -3.79531, 1, 1, 1, 1, 1,
-0.06514527, -0.2642534, -2.929875, 1, 1, 1, 1, 1,
-0.06327039, -0.06270172, -2.401762, 1, 1, 1, 1, 1,
-0.06077386, -0.2790351, -3.021929, 1, 1, 1, 1, 1,
-0.05988647, -0.2278092, -1.435618, 1, 1, 1, 1, 1,
-0.05887247, -0.3570728, -1.698374, 1, 1, 1, 1, 1,
-0.05547877, 0.3674371, 0.8980669, 1, 1, 1, 1, 1,
-0.05527819, -0.6090412, -4.951582, 1, 1, 1, 1, 1,
-0.05527323, 1.032655, -0.6320806, 1, 1, 1, 1, 1,
-0.05331381, 0.7612838, 0.2418883, 0, 0, 1, 1, 1,
-0.05322603, 0.9759184, 0.3628389, 1, 0, 0, 1, 1,
-0.04067544, -1.151341, -4.246136, 1, 0, 0, 1, 1,
-0.03844194, 1.284849, -0.1303664, 1, 0, 0, 1, 1,
-0.03787591, -0.04422945, -2.601275, 1, 0, 0, 1, 1,
-0.03684212, -1.889482, -2.017715, 1, 0, 0, 1, 1,
-0.0326124, -0.2711575, -4.047874, 0, 0, 0, 1, 1,
-0.007509462, -0.6961699, -4.055333, 0, 0, 0, 1, 1,
-0.006812944, 1.630577, 0.2952485, 0, 0, 0, 1, 1,
-0.005173754, 0.5960656, -0.7428872, 0, 0, 0, 1, 1,
-0.004167415, -1.255611, -4.711226, 0, 0, 0, 1, 1,
-0.002048932, -0.08185124, -4.817641, 0, 0, 0, 1, 1,
-0.0006801119, -1.277672, -2.989319, 0, 0, 0, 1, 1,
0.002861329, -0.2477785, 3.345187, 1, 1, 1, 1, 1,
0.003565323, 3.163206, -1.469784, 1, 1, 1, 1, 1,
0.00812562, -0.781078, 2.072541, 1, 1, 1, 1, 1,
0.01034283, 0.9863294, 2.389591, 1, 1, 1, 1, 1,
0.01456747, 0.7499807, 0.5250878, 1, 1, 1, 1, 1,
0.01895353, -1.525234, 4.726193, 1, 1, 1, 1, 1,
0.02322336, -0.4293477, 2.62402, 1, 1, 1, 1, 1,
0.02790586, 0.2150286, 0.04073613, 1, 1, 1, 1, 1,
0.03155161, -1.918439, 2.384958, 1, 1, 1, 1, 1,
0.03251176, -0.03485063, 1.731694, 1, 1, 1, 1, 1,
0.03565375, 2.415713, 0.678017, 1, 1, 1, 1, 1,
0.03566976, 1.348256, 0.7535605, 1, 1, 1, 1, 1,
0.0371365, 0.2969544, 1.625764, 1, 1, 1, 1, 1,
0.03792773, -0.1803852, 1.883414, 1, 1, 1, 1, 1,
0.03898156, 1.652738, -1.562151, 1, 1, 1, 1, 1,
0.03987818, -0.9807755, 4.502623, 0, 0, 1, 1, 1,
0.04734635, -0.1125778, 3.10945, 1, 0, 0, 1, 1,
0.04780982, 0.3558868, -1.078314, 1, 0, 0, 1, 1,
0.04790305, 0.4995204, 1.170797, 1, 0, 0, 1, 1,
0.04873471, 0.1301155, 1.315776, 1, 0, 0, 1, 1,
0.04988034, -1.191894, 2.368717, 1, 0, 0, 1, 1,
0.05072168, -0.5039636, 3.060214, 0, 0, 0, 1, 1,
0.05266161, -1.169954, 3.44456, 0, 0, 0, 1, 1,
0.0526819, 0.6559615, 2.087623, 0, 0, 0, 1, 1,
0.0530484, 1.883013, 0.188897, 0, 0, 0, 1, 1,
0.05739105, 0.5019025, 2.092587, 0, 0, 0, 1, 1,
0.05825761, -0.06304905, 2.30214, 0, 0, 0, 1, 1,
0.05953704, -1.440103, 5.159976, 0, 0, 0, 1, 1,
0.06706135, 2.168224, -0.1230214, 1, 1, 1, 1, 1,
0.07056289, -0.550406, 4.149795, 1, 1, 1, 1, 1,
0.07315355, -0.5279724, 2.427267, 1, 1, 1, 1, 1,
0.07343336, 0.5675226, -1.718506, 1, 1, 1, 1, 1,
0.07668481, 0.04087603, 2.560282, 1, 1, 1, 1, 1,
0.07932314, 0.2534921, 1.258072, 1, 1, 1, 1, 1,
0.08015211, 0.9098991, 0.9243786, 1, 1, 1, 1, 1,
0.08480695, -1.465064, 3.083131, 1, 1, 1, 1, 1,
0.08488268, 0.296492, -0.3606258, 1, 1, 1, 1, 1,
0.0853324, 0.07757051, -0.7175065, 1, 1, 1, 1, 1,
0.08719887, -0.6554696, 1.523266, 1, 1, 1, 1, 1,
0.08951885, -1.395784, 2.32366, 1, 1, 1, 1, 1,
0.0939284, 0.294906, 1.381033, 1, 1, 1, 1, 1,
0.09573026, 0.5671805, 0.1965955, 1, 1, 1, 1, 1,
0.09695254, -0.5501753, 2.451123, 1, 1, 1, 1, 1,
0.09824929, 1.296595, -0.04033835, 0, 0, 1, 1, 1,
0.101687, -0.1843579, 3.776566, 1, 0, 0, 1, 1,
0.1029626, -1.693955, 4.488725, 1, 0, 0, 1, 1,
0.1066319, -0.08097243, 2.648574, 1, 0, 0, 1, 1,
0.1097383, 1.284125, -0.8812428, 1, 0, 0, 1, 1,
0.1099739, -0.8801609, 2.970644, 1, 0, 0, 1, 1,
0.1110146, 0.4222817, -1.065429, 0, 0, 0, 1, 1,
0.115475, -0.004951963, 0.4625628, 0, 0, 0, 1, 1,
0.1183405, 1.049274, -1.060994, 0, 0, 0, 1, 1,
0.118508, -0.9381892, 2.501087, 0, 0, 0, 1, 1,
0.118678, 0.9659715, 1.053347, 0, 0, 0, 1, 1,
0.1187945, 0.07387893, 0.5656663, 0, 0, 0, 1, 1,
0.1218285, -0.04348415, 0.56925, 0, 0, 0, 1, 1,
0.1239799, -2.298173, 4.393394, 1, 1, 1, 1, 1,
0.1253307, -0.268156, 2.716514, 1, 1, 1, 1, 1,
0.1301352, 1.739144, 1.020569, 1, 1, 1, 1, 1,
0.1349566, -1.574587, 2.747294, 1, 1, 1, 1, 1,
0.1394658, -1.663741, 2.677943, 1, 1, 1, 1, 1,
0.1400455, -0.09012295, 1.349765, 1, 1, 1, 1, 1,
0.1401272, 0.5425959, 0.00290227, 1, 1, 1, 1, 1,
0.1403327, -1.666471, -0.06665196, 1, 1, 1, 1, 1,
0.1419221, -0.7394989, 3.220759, 1, 1, 1, 1, 1,
0.1421431, -0.3401078, 4.116131, 1, 1, 1, 1, 1,
0.1454045, -0.7265931, 1.958023, 1, 1, 1, 1, 1,
0.1486617, -0.755821, 2.630489, 1, 1, 1, 1, 1,
0.1581874, -1.711647, 5.034228, 1, 1, 1, 1, 1,
0.160155, -1.414062, 1.592253, 1, 1, 1, 1, 1,
0.1653825, 0.2754624, 1.753554, 1, 1, 1, 1, 1,
0.1716179, -1.557062, 2.829609, 0, 0, 1, 1, 1,
0.1721907, -1.562307, 2.28205, 1, 0, 0, 1, 1,
0.1777299, -0.007671795, 1.230557, 1, 0, 0, 1, 1,
0.1804933, 0.1850773, 1.173191, 1, 0, 0, 1, 1,
0.18484, -0.6473634, 3.007068, 1, 0, 0, 1, 1,
0.1857913, -0.05903508, 1.923322, 1, 0, 0, 1, 1,
0.1861907, 0.00248713, 1.864232, 0, 0, 0, 1, 1,
0.1868126, -0.02756832, 2.366566, 0, 0, 0, 1, 1,
0.1874595, -0.4106439, 1.454107, 0, 0, 0, 1, 1,
0.1927163, -0.7271817, 3.062717, 0, 0, 0, 1, 1,
0.1934537, 1.442701, -0.04894313, 0, 0, 0, 1, 1,
0.1942308, -0.1596043, 2.175124, 0, 0, 0, 1, 1,
0.1960298, 0.08975311, 3.76573, 0, 0, 0, 1, 1,
0.1960476, 1.850329, 1.032503, 1, 1, 1, 1, 1,
0.2028701, 0.8944858, 1.734004, 1, 1, 1, 1, 1,
0.2034686, -0.8906843, 2.058071, 1, 1, 1, 1, 1,
0.2207841, -1.339296, 3.263422, 1, 1, 1, 1, 1,
0.2220757, 3.201281, 0.119695, 1, 1, 1, 1, 1,
0.2246355, 0.1330929, -1.57886, 1, 1, 1, 1, 1,
0.2263089, -1.156915, 3.84555, 1, 1, 1, 1, 1,
0.2291424, 1.139618, 1.473158, 1, 1, 1, 1, 1,
0.2301649, -1.35954, 3.015715, 1, 1, 1, 1, 1,
0.238319, 0.1145046, 0.5407419, 1, 1, 1, 1, 1,
0.2398856, -0.6633407, 2.978064, 1, 1, 1, 1, 1,
0.2407767, 0.05635945, 0.9904004, 1, 1, 1, 1, 1,
0.246021, -0.2965222, 2.168071, 1, 1, 1, 1, 1,
0.2470879, -0.1210012, 2.832577, 1, 1, 1, 1, 1,
0.247376, 1.564438, 0.3262872, 1, 1, 1, 1, 1,
0.2504935, 0.8578755, 0.3763902, 0, 0, 1, 1, 1,
0.2518559, 0.5703225, -0.1015692, 1, 0, 0, 1, 1,
0.2519173, 0.1529323, 1.293083, 1, 0, 0, 1, 1,
0.2557552, -0.1343089, 2.127563, 1, 0, 0, 1, 1,
0.2562067, -0.2790417, 1.132426, 1, 0, 0, 1, 1,
0.2562181, 0.2178059, 0.9616764, 1, 0, 0, 1, 1,
0.2584248, -0.7309484, 3.561947, 0, 0, 0, 1, 1,
0.2614374, 1.442341, 1.523794, 0, 0, 0, 1, 1,
0.2639567, -0.03781307, 0.5194164, 0, 0, 0, 1, 1,
0.2724198, 0.3621914, -0.003498365, 0, 0, 0, 1, 1,
0.2740887, -0.0593809, 1.823733, 0, 0, 0, 1, 1,
0.2770723, -1.213692, 2.147359, 0, 0, 0, 1, 1,
0.2795681, 0.2976795, 0.5715622, 0, 0, 0, 1, 1,
0.2829044, -2.326638, 4.10974, 1, 1, 1, 1, 1,
0.2833942, 1.427976, -0.668799, 1, 1, 1, 1, 1,
0.2846152, 0.7420009, 0.780816, 1, 1, 1, 1, 1,
0.290067, 0.8289128, 1.245357, 1, 1, 1, 1, 1,
0.2946415, -0.9482929, 2.750309, 1, 1, 1, 1, 1,
0.295422, 2.730574, -0.2311767, 1, 1, 1, 1, 1,
0.2964613, -1.043592, 3.734374, 1, 1, 1, 1, 1,
0.2993669, 0.7133344, 0.2426727, 1, 1, 1, 1, 1,
0.3015367, -0.36225, 3.727294, 1, 1, 1, 1, 1,
0.3103852, -0.6127642, 2.14744, 1, 1, 1, 1, 1,
0.3137132, -1.16161, 4.311526, 1, 1, 1, 1, 1,
0.3189233, -1.090742, 4.774242, 1, 1, 1, 1, 1,
0.319136, 0.4163954, 0.06816892, 1, 1, 1, 1, 1,
0.3191962, 1.11192, 1.319514, 1, 1, 1, 1, 1,
0.3205016, -1.496032, 3.898189, 1, 1, 1, 1, 1,
0.3206447, -0.1508694, 1.968384, 0, 0, 1, 1, 1,
0.3236723, 1.159602, -1.370459, 1, 0, 0, 1, 1,
0.3255216, 2.266043, -0.0681454, 1, 0, 0, 1, 1,
0.3257034, 1.195703, -0.07907814, 1, 0, 0, 1, 1,
0.3267978, -0.07344034, 1.001937, 1, 0, 0, 1, 1,
0.3285277, -0.1560473, 1.648501, 1, 0, 0, 1, 1,
0.3302004, 0.8661388, 0.0849114, 0, 0, 0, 1, 1,
0.332311, 0.7095038, -0.3471208, 0, 0, 0, 1, 1,
0.3350206, -0.3006761, 0.4855004, 0, 0, 0, 1, 1,
0.3361499, -2.43648, 0.8935107, 0, 0, 0, 1, 1,
0.339001, 1.186582, 0.5585609, 0, 0, 0, 1, 1,
0.3406699, 1.452768, 0.1416863, 0, 0, 0, 1, 1,
0.3407837, -1.798755, 2.781314, 0, 0, 0, 1, 1,
0.3408396, 0.5305094, 1.333644, 1, 1, 1, 1, 1,
0.3434968, -1.874353, 4.422662, 1, 1, 1, 1, 1,
0.3452099, 0.8442249, 0.717109, 1, 1, 1, 1, 1,
0.3471519, -0.304856, 0.6714024, 1, 1, 1, 1, 1,
0.347332, -1.516184, 4.600546, 1, 1, 1, 1, 1,
0.3495312, -1.517617, 1.098251, 1, 1, 1, 1, 1,
0.3568976, -1.170056, 2.973998, 1, 1, 1, 1, 1,
0.3614787, 0.1364967, 1.878322, 1, 1, 1, 1, 1,
0.3699602, -0.09661067, 0.9360153, 1, 1, 1, 1, 1,
0.3728568, 0.1083278, 0.79287, 1, 1, 1, 1, 1,
0.373812, -0.108789, 1.043152, 1, 1, 1, 1, 1,
0.3790365, 0.5749421, 2.134787, 1, 1, 1, 1, 1,
0.3799709, 0.7746783, 1.314795, 1, 1, 1, 1, 1,
0.3815775, -1.068801, 3.141161, 1, 1, 1, 1, 1,
0.3893804, 1.011132, 0.4880389, 1, 1, 1, 1, 1,
0.3913321, 0.6499415, -1.075097, 0, 0, 1, 1, 1,
0.3933937, -0.164054, 3.967592, 1, 0, 0, 1, 1,
0.3993504, -0.5036893, 3.343799, 1, 0, 0, 1, 1,
0.4032258, 1.091978, -0.8264703, 1, 0, 0, 1, 1,
0.4137215, -0.3532087, 2.35527, 1, 0, 0, 1, 1,
0.4137965, 1.623775, 0.6053289, 1, 0, 0, 1, 1,
0.4141702, -1.160152, 3.170419, 0, 0, 0, 1, 1,
0.4160227, 1.931953, 1.13451, 0, 0, 0, 1, 1,
0.4243001, -0.2707936, 1.270884, 0, 0, 0, 1, 1,
0.4266937, 1.160642, -1.524902, 0, 0, 0, 1, 1,
0.429828, -0.6476957, 4.085694, 0, 0, 0, 1, 1,
0.4304368, 1.210914, 0.9714851, 0, 0, 0, 1, 1,
0.4316301, -0.5448936, 2.173028, 0, 0, 0, 1, 1,
0.4324723, -1.003946, 4.1975, 1, 1, 1, 1, 1,
0.4340006, -0.04617174, 2.138184, 1, 1, 1, 1, 1,
0.4351483, -0.2015595, 2.916855, 1, 1, 1, 1, 1,
0.4405978, -2.018511, 3.220219, 1, 1, 1, 1, 1,
0.4426727, -0.1538888, 2.122463, 1, 1, 1, 1, 1,
0.4477174, 1.581841, -0.8238643, 1, 1, 1, 1, 1,
0.4483376, -1.097954, 2.22653, 1, 1, 1, 1, 1,
0.4488824, 0.8777848, 0.990678, 1, 1, 1, 1, 1,
0.4500512, -0.4869705, 4.204489, 1, 1, 1, 1, 1,
0.451184, 0.9704418, -0.4160809, 1, 1, 1, 1, 1,
0.451592, -0.2714956, 1.814859, 1, 1, 1, 1, 1,
0.4521013, -0.547718, 1.683507, 1, 1, 1, 1, 1,
0.4593245, -0.7867296, 5.982334, 1, 1, 1, 1, 1,
0.4598088, -0.1967309, 0.7648695, 1, 1, 1, 1, 1,
0.4659079, 0.4068757, -0.4475666, 1, 1, 1, 1, 1,
0.4665317, 1.008094, -0.8164167, 0, 0, 1, 1, 1,
0.4678271, -2.061539, 4.215875, 1, 0, 0, 1, 1,
0.4683871, 1.132996, 0.7316274, 1, 0, 0, 1, 1,
0.4802872, -0.2189123, 1.730169, 1, 0, 0, 1, 1,
0.4818961, 0.09669438, 3.880332, 1, 0, 0, 1, 1,
0.4840918, -1.686264, 2.535172, 1, 0, 0, 1, 1,
0.4843233, 0.3055851, 0.5589468, 0, 0, 0, 1, 1,
0.492599, -0.2526632, 2.342608, 0, 0, 0, 1, 1,
0.4934489, 0.1422633, 2.049534, 0, 0, 0, 1, 1,
0.4943263, 0.02167089, 0.3364613, 0, 0, 0, 1, 1,
0.4943807, 1.251781, -0.01761742, 0, 0, 0, 1, 1,
0.4958977, 0.01462978, 1.55882, 0, 0, 0, 1, 1,
0.5037201, 0.3471203, 0.7792324, 0, 0, 0, 1, 1,
0.5075099, 0.292213, 1.305307, 1, 1, 1, 1, 1,
0.507844, 0.3320599, 0.9688675, 1, 1, 1, 1, 1,
0.5105966, -0.3560433, 2.312099, 1, 1, 1, 1, 1,
0.5126299, 0.6820759, 0.9120051, 1, 1, 1, 1, 1,
0.5148031, 0.1680709, 1.258973, 1, 1, 1, 1, 1,
0.5155894, 0.577794, 2.906038, 1, 1, 1, 1, 1,
0.5157484, -0.4758721, 1.886662, 1, 1, 1, 1, 1,
0.5185525, 0.646645, 0.06692955, 1, 1, 1, 1, 1,
0.5308614, -1.34549, 3.829397, 1, 1, 1, 1, 1,
0.5324218, -0.7227038, 1.032142, 1, 1, 1, 1, 1,
0.5333741, 0.9347674, -0.3543243, 1, 1, 1, 1, 1,
0.5338343, 0.1809503, 2.263025, 1, 1, 1, 1, 1,
0.5360869, -0.3497829, 2.185306, 1, 1, 1, 1, 1,
0.5413663, -0.03170671, 2.425805, 1, 1, 1, 1, 1,
0.5434231, -1.891024, 3.672119, 1, 1, 1, 1, 1,
0.5435517, 1.161633, -0.605275, 0, 0, 1, 1, 1,
0.5453486, -1.012866, 0.5942094, 1, 0, 0, 1, 1,
0.5474156, -0.2931668, 2.299617, 1, 0, 0, 1, 1,
0.5480097, -0.8836203, 3.222511, 1, 0, 0, 1, 1,
0.5499954, 0.7816139, 1.945228, 1, 0, 0, 1, 1,
0.5518079, 1.544442, 0.6572154, 1, 0, 0, 1, 1,
0.5528606, -1.423831, 3.042385, 0, 0, 0, 1, 1,
0.5536799, -1.005199, 4.890424, 0, 0, 0, 1, 1,
0.5635464, 0.5667197, -0.2561316, 0, 0, 0, 1, 1,
0.5641034, 0.8425962, -0.02373044, 0, 0, 0, 1, 1,
0.5643132, 0.4637174, 1.120215, 0, 0, 0, 1, 1,
0.5658461, 0.2008164, 0.8314682, 0, 0, 0, 1, 1,
0.5685487, -0.2156134, 1.598962, 0, 0, 0, 1, 1,
0.5727397, 0.2209249, 1.682029, 1, 1, 1, 1, 1,
0.5761663, 0.1863199, 1.417865, 1, 1, 1, 1, 1,
0.5766982, -0.2412391, 3.360881, 1, 1, 1, 1, 1,
0.5805573, 1.162147, 1.199715, 1, 1, 1, 1, 1,
0.5807341, -2.223705, 0.742043, 1, 1, 1, 1, 1,
0.5820666, 0.1059417, 1.217164, 1, 1, 1, 1, 1,
0.5854388, 0.5582562, 1.825625, 1, 1, 1, 1, 1,
0.595497, 0.9069512, 0.2984553, 1, 1, 1, 1, 1,
0.5988548, 0.2320656, 0.204063, 1, 1, 1, 1, 1,
0.6039705, 2.143931, -0.05228978, 1, 1, 1, 1, 1,
0.6043519, -0.6593968, 2.722506, 1, 1, 1, 1, 1,
0.6065291, 0.4744888, -1.353768, 1, 1, 1, 1, 1,
0.6076337, 0.869958, -0.3737987, 1, 1, 1, 1, 1,
0.6091752, -1.281505, 3.110239, 1, 1, 1, 1, 1,
0.6111221, -1.136397, 5.07256, 1, 1, 1, 1, 1,
0.614953, 0.6822873, 1.876046, 0, 0, 1, 1, 1,
0.6199222, 0.1063044, 1.946453, 1, 0, 0, 1, 1,
0.6199777, -0.2630701, 3.129779, 1, 0, 0, 1, 1,
0.6211306, -0.846963, 3.492416, 1, 0, 0, 1, 1,
0.6290796, 1.606467, 0.591343, 1, 0, 0, 1, 1,
0.6324895, -0.4565669, 2.878096, 1, 0, 0, 1, 1,
0.6353188, 0.3104211, 3.403073, 0, 0, 0, 1, 1,
0.6364274, 0.5340019, 1.227653, 0, 0, 0, 1, 1,
0.6367087, 1.0138, 0.08589342, 0, 0, 0, 1, 1,
0.6375222, 0.6316615, -0.573927, 0, 0, 0, 1, 1,
0.640725, -0.07372864, 0.09348189, 0, 0, 0, 1, 1,
0.6410342, 1.615133, -0.6456263, 0, 0, 0, 1, 1,
0.6439121, -1.828852, 2.767291, 0, 0, 0, 1, 1,
0.6441276, -2.062827, 1.745537, 1, 1, 1, 1, 1,
0.6456445, 0.423859, 1.692675, 1, 1, 1, 1, 1,
0.6485896, -1.828941, 2.908724, 1, 1, 1, 1, 1,
0.6496248, 0.3185555, 0.1981067, 1, 1, 1, 1, 1,
0.6517279, -0.01413951, 1.689884, 1, 1, 1, 1, 1,
0.6523092, 1.295619, 0.3343273, 1, 1, 1, 1, 1,
0.6549399, 0.2450307, -0.1448188, 1, 1, 1, 1, 1,
0.6571838, -1.324009, 2.139316, 1, 1, 1, 1, 1,
0.6596573, 0.8426337, 1.879371, 1, 1, 1, 1, 1,
0.6710842, -1.066102, 0.7964874, 1, 1, 1, 1, 1,
0.6750581, 0.853443, 1.877, 1, 1, 1, 1, 1,
0.6754639, -1.532243, 3.657229, 1, 1, 1, 1, 1,
0.6769291, 1.022632, -0.5540962, 1, 1, 1, 1, 1,
0.6846169, -0.4237256, 1.729777, 1, 1, 1, 1, 1,
0.6863575, -0.5443534, 1.256733, 1, 1, 1, 1, 1,
0.6969897, -0.6381225, 3.350764, 0, 0, 1, 1, 1,
0.7051945, 0.5284082, 0.3229468, 1, 0, 0, 1, 1,
0.7099361, 1.891561, 1.178567, 1, 0, 0, 1, 1,
0.7114456, -0.8429078, 3.698651, 1, 0, 0, 1, 1,
0.7142398, -0.4518069, 2.351379, 1, 0, 0, 1, 1,
0.7148314, -1.009743, 1.839541, 1, 0, 0, 1, 1,
0.7168871, -0.6734582, 1.708268, 0, 0, 0, 1, 1,
0.7186074, 0.8634093, 0.5664616, 0, 0, 0, 1, 1,
0.7247795, 0.1603711, 0.09630718, 0, 0, 0, 1, 1,
0.7272866, -1.194806, 2.484814, 0, 0, 0, 1, 1,
0.7282015, 0.02274447, 2.577891, 0, 0, 0, 1, 1,
0.7354563, 1.713862, 0.9474433, 0, 0, 0, 1, 1,
0.7487158, -0.2835928, 1.610163, 0, 0, 0, 1, 1,
0.7565185, -0.5687049, 3.236861, 1, 1, 1, 1, 1,
0.7575622, 0.5279104, 1.61946, 1, 1, 1, 1, 1,
0.7726997, 1.920493, 0.7547793, 1, 1, 1, 1, 1,
0.7763035, -0.4309657, 2.997988, 1, 1, 1, 1, 1,
0.7774903, -0.132035, 2.364654, 1, 1, 1, 1, 1,
0.7792164, -2.025658, 1.350725, 1, 1, 1, 1, 1,
0.7805374, -1.54341, 4.980337, 1, 1, 1, 1, 1,
0.7886953, -0.9101123, 1.494812, 1, 1, 1, 1, 1,
0.7899376, -0.3397578, 1.871793, 1, 1, 1, 1, 1,
0.7903631, 1.456526, 1.069058, 1, 1, 1, 1, 1,
0.7937084, 0.474932, 0.3249703, 1, 1, 1, 1, 1,
0.7971821, 0.8718806, 1.760909, 1, 1, 1, 1, 1,
0.8152475, 0.1246875, 1.014661, 1, 1, 1, 1, 1,
0.8187057, 0.6019773, 0.6891704, 1, 1, 1, 1, 1,
0.8204758, 1.10181, 0.9896275, 1, 1, 1, 1, 1,
0.8271621, -1.162423, 2.450934, 0, 0, 1, 1, 1,
0.8284518, -0.7142597, 1.998372, 1, 0, 0, 1, 1,
0.8285013, 0.001092918, -0.3489996, 1, 0, 0, 1, 1,
0.8297564, -0.725338, 5.193936, 1, 0, 0, 1, 1,
0.8335658, 0.866324, 1.620972, 1, 0, 0, 1, 1,
0.8355477, 0.880198, 1.134906, 1, 0, 0, 1, 1,
0.8410739, -1.07657, 1.700386, 0, 0, 0, 1, 1,
0.8429487, 1.615803, 0.7947223, 0, 0, 0, 1, 1,
0.8472641, 0.424266, 1.600745, 0, 0, 0, 1, 1,
0.8536314, -1.08602, 3.199979, 0, 0, 0, 1, 1,
0.8568968, 0.634691, 0.1281075, 0, 0, 0, 1, 1,
0.857037, -0.2699009, 0.4482453, 0, 0, 0, 1, 1,
0.8577328, 0.5673589, 0.7550935, 0, 0, 0, 1, 1,
0.8607987, -1.344127, 3.757318, 1, 1, 1, 1, 1,
0.8705273, -0.8111027, 2.372768, 1, 1, 1, 1, 1,
0.8806608, 0.8806143, 0.4248185, 1, 1, 1, 1, 1,
0.8829256, -1.022185, -0.2012756, 1, 1, 1, 1, 1,
0.8846664, 0.6408074, 0.7508312, 1, 1, 1, 1, 1,
0.8903281, -0.8069789, 3.216978, 1, 1, 1, 1, 1,
0.8916581, 1.272497, -0.03607376, 1, 1, 1, 1, 1,
0.8928699, 1.301477, 1.590779, 1, 1, 1, 1, 1,
0.8961328, 0.0932982, 2.284162, 1, 1, 1, 1, 1,
0.8993747, 0.5561829, -0.2811309, 1, 1, 1, 1, 1,
0.9021873, -1.108667, 3.042105, 1, 1, 1, 1, 1,
0.9031771, 0.852488, -1.36861, 1, 1, 1, 1, 1,
0.9051107, -1.213365, 2.879571, 1, 1, 1, 1, 1,
0.9112801, 0.5530236, 0.8070406, 1, 1, 1, 1, 1,
0.9161767, -1.186957, 3.007495, 1, 1, 1, 1, 1,
0.9236805, -1.21752, 2.936469, 0, 0, 1, 1, 1,
0.9240768, 1.19237, -0.9192981, 1, 0, 0, 1, 1,
0.9299247, 0.5273449, 0.4791296, 1, 0, 0, 1, 1,
0.9352779, -1.03213, 3.489799, 1, 0, 0, 1, 1,
0.9370245, -0.3821228, 2.466971, 1, 0, 0, 1, 1,
0.93782, -0.3039924, 1.591503, 1, 0, 0, 1, 1,
0.9398202, -0.5253058, 2.56203, 0, 0, 0, 1, 1,
0.9468138, 0.6722388, 1.918403, 0, 0, 0, 1, 1,
0.9480927, -1.527227, 3.283008, 0, 0, 0, 1, 1,
0.9482485, -0.6232737, 0.684825, 0, 0, 0, 1, 1,
0.9504145, 0.8737177, -0.6872433, 0, 0, 0, 1, 1,
0.9509023, -0.356825, 3.429753, 0, 0, 0, 1, 1,
0.9527075, -0.6149122, 2.643023, 0, 0, 0, 1, 1,
0.958807, -0.02407055, 3.392885, 1, 1, 1, 1, 1,
0.9611031, -2.437097, 2.952996, 1, 1, 1, 1, 1,
0.9705998, 1.125074, 1.502307, 1, 1, 1, 1, 1,
0.9728221, -0.5741927, 2.488634, 1, 1, 1, 1, 1,
0.9731041, 0.5796987, 0.3703554, 1, 1, 1, 1, 1,
0.9731567, 0.3803877, 0.3969634, 1, 1, 1, 1, 1,
0.9769318, -0.5050446, 0.2355802, 1, 1, 1, 1, 1,
0.9958912, 1.569059, 1.929918, 1, 1, 1, 1, 1,
0.997199, -0.9042478, 3.089949, 1, 1, 1, 1, 1,
1.000216, 0.8010647, 2.156873, 1, 1, 1, 1, 1,
1.001858, -0.572974, 2.92678, 1, 1, 1, 1, 1,
1.001934, 1.312999, 1.58487, 1, 1, 1, 1, 1,
1.002627, 1.581384, 3.538194, 1, 1, 1, 1, 1,
1.008452, -0.9085913, 2.34599, 1, 1, 1, 1, 1,
1.013331, 2.049952, 0.3301421, 1, 1, 1, 1, 1,
1.014196, -0.8549135, 1.128136, 0, 0, 1, 1, 1,
1.016738, 1.647686, 0.8171136, 1, 0, 0, 1, 1,
1.017332, -0.3897366, 2.158499, 1, 0, 0, 1, 1,
1.018575, -1.483161, 2.747508, 1, 0, 0, 1, 1,
1.022859, -1.138269, 4.695052, 1, 0, 0, 1, 1,
1.022982, 1.19756, 1.03855, 1, 0, 0, 1, 1,
1.024175, -0.3635375, 0.3828167, 0, 0, 0, 1, 1,
1.029748, -0.9097403, 2.038181, 0, 0, 0, 1, 1,
1.030057, 0.1894485, 2.037247, 0, 0, 0, 1, 1,
1.04587, -0.8190729, 1.926361, 0, 0, 0, 1, 1,
1.050624, 0.7719443, 1.926721, 0, 0, 0, 1, 1,
1.051149, -0.412777, 2.716411, 0, 0, 0, 1, 1,
1.0522, -0.2619867, 1.857168, 0, 0, 0, 1, 1,
1.053459, 0.2084459, 1.06675, 1, 1, 1, 1, 1,
1.063128, -1.211878, 1.907503, 1, 1, 1, 1, 1,
1.063216, 0.5211697, 0.9935805, 1, 1, 1, 1, 1,
1.065811, -0.1207127, 1.581965, 1, 1, 1, 1, 1,
1.072665, 0.9374438, 2.216951, 1, 1, 1, 1, 1,
1.073628, -0.3237372, 1.19196, 1, 1, 1, 1, 1,
1.096279, -0.4324149, 1.418545, 1, 1, 1, 1, 1,
1.101546, -0.06992162, 1.189669, 1, 1, 1, 1, 1,
1.1058, 0.6758273, 1.694567, 1, 1, 1, 1, 1,
1.106075, 0.7017301, 2.329201, 1, 1, 1, 1, 1,
1.106288, 0.7579895, 2.273234, 1, 1, 1, 1, 1,
1.112405, 1.626624, -0.5222527, 1, 1, 1, 1, 1,
1.117488, 1.032583, 0.4679341, 1, 1, 1, 1, 1,
1.126698, -0.4988421, 2.467074, 1, 1, 1, 1, 1,
1.128766, 0.8596806, 0.7102848, 1, 1, 1, 1, 1,
1.135325, 1.358171, -0.6686391, 0, 0, 1, 1, 1,
1.138961, 0.05729273, 1.903283, 1, 0, 0, 1, 1,
1.140281, 0.694753, -0.8324948, 1, 0, 0, 1, 1,
1.142719, 0.539193, 2.109074, 1, 0, 0, 1, 1,
1.149776, 0.5680515, 0.9659432, 1, 0, 0, 1, 1,
1.150696, -1.756798, 1.289837, 1, 0, 0, 1, 1,
1.178288, -0.7296875, 2.980401, 0, 0, 0, 1, 1,
1.179787, 0.5216337, 1.081145, 0, 0, 0, 1, 1,
1.182343, -1.508953, 2.089911, 0, 0, 0, 1, 1,
1.183432, -2.193713, 2.200957, 0, 0, 0, 1, 1,
1.193851, 0.9329164, 0.08739819, 0, 0, 0, 1, 1,
1.199292, -0.8911697, 1.806039, 0, 0, 0, 1, 1,
1.209588, 1.734288, 2.812839, 0, 0, 0, 1, 1,
1.211042, 0.9264838, 0.5862374, 1, 1, 1, 1, 1,
1.229304, -0.8390865, 0.8636528, 1, 1, 1, 1, 1,
1.230294, 1.38743, 2.494293, 1, 1, 1, 1, 1,
1.232043, -0.9704775, 2.409235, 1, 1, 1, 1, 1,
1.244595, 0.08545273, 1.705154, 1, 1, 1, 1, 1,
1.24501, -0.8290436, 1.702536, 1, 1, 1, 1, 1,
1.249522, 0.4245899, 2.970471, 1, 1, 1, 1, 1,
1.250015, -0.2186072, 2.596311, 1, 1, 1, 1, 1,
1.25103, -1.428218, 2.027964, 1, 1, 1, 1, 1,
1.251674, -0.6852137, 3.118121, 1, 1, 1, 1, 1,
1.258478, -0.7455693, 2.194325, 1, 1, 1, 1, 1,
1.262761, 0.9137109, 0.5082922, 1, 1, 1, 1, 1,
1.26624, -0.1470591, 3.427363, 1, 1, 1, 1, 1,
1.273056, 0.5399747, 1.4728, 1, 1, 1, 1, 1,
1.276881, 1.262032, 0.2184599, 1, 1, 1, 1, 1,
1.278397, 1.20583, -0.0885103, 0, 0, 1, 1, 1,
1.280688, -1.30178, 2.562418, 1, 0, 0, 1, 1,
1.281499, -0.6787747, 1.102137, 1, 0, 0, 1, 1,
1.288894, -0.9318212, 1.413009, 1, 0, 0, 1, 1,
1.29305, 1.617786, 1.648422, 1, 0, 0, 1, 1,
1.295938, 0.8295963, 2.47314, 1, 0, 0, 1, 1,
1.29676, 0.03495229, 3.000657, 0, 0, 0, 1, 1,
1.305217, -0.848146, 1.188304, 0, 0, 0, 1, 1,
1.314005, -0.3500271, 2.048291, 0, 0, 0, 1, 1,
1.326672, 0.3862658, 2.333381, 0, 0, 0, 1, 1,
1.332944, -1.334941, 1.711871, 0, 0, 0, 1, 1,
1.340721, 0.6848429, 0.6554269, 0, 0, 0, 1, 1,
1.341619, 0.2853018, 1.538061, 0, 0, 0, 1, 1,
1.349222, 1.027108, 1.283759, 1, 1, 1, 1, 1,
1.353814, -0.9897164, 3.759432, 1, 1, 1, 1, 1,
1.359677, -0.4796876, 2.461127, 1, 1, 1, 1, 1,
1.362001, -1.100496, 3.505546, 1, 1, 1, 1, 1,
1.366554, -0.8639551, 2.268909, 1, 1, 1, 1, 1,
1.372934, -0.05588553, 2.863626, 1, 1, 1, 1, 1,
1.376023, 1.866815, 0.172482, 1, 1, 1, 1, 1,
1.403355, 0.3998453, 1.373483, 1, 1, 1, 1, 1,
1.408864, 0.08744258, 3.16675, 1, 1, 1, 1, 1,
1.422872, 1.219772, -0.2419712, 1, 1, 1, 1, 1,
1.429652, 0.1963896, 1.837544, 1, 1, 1, 1, 1,
1.432661, 0.06307244, 1.431197, 1, 1, 1, 1, 1,
1.435123, -2.080027, 1.782112, 1, 1, 1, 1, 1,
1.435152, -0.2700633, 2.926048, 1, 1, 1, 1, 1,
1.435152, -0.4540266, 1.872025, 1, 1, 1, 1, 1,
1.438405, -1.33374, 3.739448, 0, 0, 1, 1, 1,
1.443866, -0.185599, 2.629307, 1, 0, 0, 1, 1,
1.446247, -0.3059925, 2.350941, 1, 0, 0, 1, 1,
1.450983, -0.8439985, 2.54401, 1, 0, 0, 1, 1,
1.452817, -1.350053, 3.743823, 1, 0, 0, 1, 1,
1.455058, -1.688388, 3.15232, 1, 0, 0, 1, 1,
1.481376, -0.9230533, 3.680259, 0, 0, 0, 1, 1,
1.489221, -0.8820828, 1.432611, 0, 0, 0, 1, 1,
1.507946, -1.056467, -0.1589557, 0, 0, 0, 1, 1,
1.516755, 0.2147052, 1.095728, 0, 0, 0, 1, 1,
1.530187, 0.8657973, -0.9091926, 0, 0, 0, 1, 1,
1.531561, 0.1511434, 1.876874, 0, 0, 0, 1, 1,
1.550571, -0.429633, 1.96255, 0, 0, 0, 1, 1,
1.553674, 0.08284011, 0.8346763, 1, 1, 1, 1, 1,
1.563535, -0.5936459, 2.886091, 1, 1, 1, 1, 1,
1.5814, 0.4058307, 2.367965, 1, 1, 1, 1, 1,
1.588109, 2.01601, 0.1186668, 1, 1, 1, 1, 1,
1.593224, -0.7027271, 0.5636857, 1, 1, 1, 1, 1,
1.595027, -0.5631607, 1.941223, 1, 1, 1, 1, 1,
1.624535, -1.410109, 2.953345, 1, 1, 1, 1, 1,
1.627013, 0.534667, 0.4422105, 1, 1, 1, 1, 1,
1.63832, 1.851028, 1.777628, 1, 1, 1, 1, 1,
1.645452, -1.111628, 1.412845, 1, 1, 1, 1, 1,
1.652666, -0.6909454, 1.816718, 1, 1, 1, 1, 1,
1.667121, -1.644366, 2.172969, 1, 1, 1, 1, 1,
1.67491, 0.07018522, 1.410919, 1, 1, 1, 1, 1,
1.698603, 0.4772598, 1.163114, 1, 1, 1, 1, 1,
1.703635, 0.7894462, 1.732502, 1, 1, 1, 1, 1,
1.705781, -0.2147231, 1.067391, 0, 0, 1, 1, 1,
1.717924, -1.138892, 3.038418, 1, 0, 0, 1, 1,
1.718413, -0.08637664, 2.576815, 1, 0, 0, 1, 1,
1.719705, -1.832297, 1.282758, 1, 0, 0, 1, 1,
1.738816, 0.9586662, 2.307913, 1, 0, 0, 1, 1,
1.762632, 1.406391, 1.55765, 1, 0, 0, 1, 1,
1.772215, -1.148288, 0.4824996, 0, 0, 0, 1, 1,
1.786145, 1.124982, -0.346536, 0, 0, 0, 1, 1,
1.794025, -0.3721896, 2.627526, 0, 0, 0, 1, 1,
1.806115, 1.151938, 2.368313, 0, 0, 0, 1, 1,
1.832172, 1.296435, 1.595743, 0, 0, 0, 1, 1,
1.865172, 1.257988, 1.920046, 0, 0, 0, 1, 1,
1.866518, -0.4747441, 1.794997, 0, 0, 0, 1, 1,
1.882533, 0.4919918, 2.21527, 1, 1, 1, 1, 1,
1.892592, 1.608768, 0.9432465, 1, 1, 1, 1, 1,
1.905893, -0.04113192, 2.901598, 1, 1, 1, 1, 1,
1.913126, -0.7703744, 2.1098, 1, 1, 1, 1, 1,
1.913508, 0.8366327, 1.706132, 1, 1, 1, 1, 1,
1.918902, 0.4994793, 1.813752, 1, 1, 1, 1, 1,
1.927567, -1.303131, 1.707405, 1, 1, 1, 1, 1,
1.963129, -1.743316, 3.407451, 1, 1, 1, 1, 1,
1.963646, -1.669565, 2.428776, 1, 1, 1, 1, 1,
2.007416, -0.09455629, 0.6143866, 1, 1, 1, 1, 1,
2.009773, -0.1178959, 3.68789, 1, 1, 1, 1, 1,
2.017601, -1.028888, 0.7654738, 1, 1, 1, 1, 1,
2.028827, -0.3144796, 3.249256, 1, 1, 1, 1, 1,
2.072322, 1.644042, 0.8656244, 1, 1, 1, 1, 1,
2.073574, -3.0618, 2.113562, 1, 1, 1, 1, 1,
2.095983, -1.051988, 0.5665174, 0, 0, 1, 1, 1,
2.114033, 1.215988, 3.179215, 1, 0, 0, 1, 1,
2.128543, -0.5998439, 2.943338, 1, 0, 0, 1, 1,
2.143314, 0.2526055, 3.170857, 1, 0, 0, 1, 1,
2.15148, -1.204326, 2.194324, 1, 0, 0, 1, 1,
2.159427, -0.06529239, 2.30893, 1, 0, 0, 1, 1,
2.165348, -0.6775289, 0.3123606, 0, 0, 0, 1, 1,
2.192976, -0.03396689, 2.839385, 0, 0, 0, 1, 1,
2.307325, -0.1907956, 2.943433, 0, 0, 0, 1, 1,
2.325749, 0.6616804, 0.2448106, 0, 0, 0, 1, 1,
2.349797, 1.103615, 1.639802, 0, 0, 0, 1, 1,
2.398135, 0.9406683, 1.34295, 0, 0, 0, 1, 1,
2.483801, -0.2705359, 1.693799, 0, 0, 0, 1, 1,
2.531277, 0.9054005, 0.06408985, 1, 1, 1, 1, 1,
2.557411, -0.1552064, 1.745116, 1, 1, 1, 1, 1,
2.628088, 1.8038, 3.322967, 1, 1, 1, 1, 1,
2.684805, -0.3439533, 0.436743, 1, 1, 1, 1, 1,
2.800387, -0.6303539, 1.322112, 1, 1, 1, 1, 1,
2.928989, -0.2053097, 0.9420982, 1, 1, 1, 1, 1,
3.233168, 0.659119, 2.16045, 1, 1, 1, 1, 1
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
var radius = 9.578113;
var distance = 33.64272;
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
mvMatrix.translate( -0.2635577, 0.05026507, -0.5027552 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.64272);
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
