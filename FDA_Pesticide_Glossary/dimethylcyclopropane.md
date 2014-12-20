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
-3.212571, 0.5688694, -1.048013, 1, 0, 0, 1,
-3.179781, 1.374401, -2.284819, 1, 0.007843138, 0, 1,
-2.965865, 0.5173569, -1.151315, 1, 0.01176471, 0, 1,
-2.924764, 1.683832, -0.6696578, 1, 0.01960784, 0, 1,
-2.753523, -2.766864, -2.789845, 1, 0.02352941, 0, 1,
-2.709377, -1.913088, -0.6618603, 1, 0.03137255, 0, 1,
-2.708671, -0.05533171, -2.283432, 1, 0.03529412, 0, 1,
-2.625829, 0.9171483, -0.2588502, 1, 0.04313726, 0, 1,
-2.580789, -0.3194001, -1.682586, 1, 0.04705882, 0, 1,
-2.579821, -0.8675372, -3.443108, 1, 0.05490196, 0, 1,
-2.554113, 1.629923, -1.150933, 1, 0.05882353, 0, 1,
-2.53786, -0.5774701, -1.624019, 1, 0.06666667, 0, 1,
-2.476475, 0.008091733, -2.594603, 1, 0.07058824, 0, 1,
-2.44277, -1.638471, -2.932461, 1, 0.07843138, 0, 1,
-2.374619, -0.5371195, -1.724491, 1, 0.08235294, 0, 1,
-2.252101, -0.3250496, -1.149249, 1, 0.09019608, 0, 1,
-2.251212, -0.6063153, -0.645035, 1, 0.09411765, 0, 1,
-2.203507, 0.8170135, -0.5137073, 1, 0.1019608, 0, 1,
-2.191793, -2.163303, -3.783987, 1, 0.1098039, 0, 1,
-2.158107, 0.6668332, -0.7583712, 1, 0.1137255, 0, 1,
-2.147881, -0.7517986, -2.092501, 1, 0.1215686, 0, 1,
-2.10282, -0.8867599, -2.591937, 1, 0.1254902, 0, 1,
-2.066667, 1.030514, -2.169764, 1, 0.1333333, 0, 1,
-2.01269, 0.2917362, -2.274772, 1, 0.1372549, 0, 1,
-1.979323, -0.152721, -2.101085, 1, 0.145098, 0, 1,
-1.954754, 1.348994, 0.349171, 1, 0.1490196, 0, 1,
-1.941608, -0.4624102, -3.355751, 1, 0.1568628, 0, 1,
-1.932972, -0.5598989, -2.762001, 1, 0.1607843, 0, 1,
-1.915925, -2.291712, -2.991536, 1, 0.1686275, 0, 1,
-1.906541, 2.156932, 0.7164417, 1, 0.172549, 0, 1,
-1.904332, -0.6492712, -2.183901, 1, 0.1803922, 0, 1,
-1.88736, -1.046457, -2.67129, 1, 0.1843137, 0, 1,
-1.839556, -0.4093953, 0.5637586, 1, 0.1921569, 0, 1,
-1.817655, -0.1565464, -1.14051, 1, 0.1960784, 0, 1,
-1.781957, 0.05263714, -2.538783, 1, 0.2039216, 0, 1,
-1.768013, -0.9493778, -3.241575, 1, 0.2117647, 0, 1,
-1.755215, 1.267847, -0.05311907, 1, 0.2156863, 0, 1,
-1.720566, 0.4873187, -1.01183, 1, 0.2235294, 0, 1,
-1.688299, 0.5836229, -1.666981, 1, 0.227451, 0, 1,
-1.682624, 0.8402258, -0.05730191, 1, 0.2352941, 0, 1,
-1.676045, 1.0613, -1.97849, 1, 0.2392157, 0, 1,
-1.648458, 0.394106, -2.432505, 1, 0.2470588, 0, 1,
-1.636866, -1.085555, -0.846157, 1, 0.2509804, 0, 1,
-1.635077, -0.5280583, -2.798448, 1, 0.2588235, 0, 1,
-1.624668, 1.854547, -1.052973, 1, 0.2627451, 0, 1,
-1.624642, 0.3544959, -1.843743, 1, 0.2705882, 0, 1,
-1.611759, 1.319417, -0.6696541, 1, 0.2745098, 0, 1,
-1.598511, -1.654366, -2.676448, 1, 0.282353, 0, 1,
-1.584061, 1.035515, -1.68709, 1, 0.2862745, 0, 1,
-1.551198, -1.019812, -1.45948, 1, 0.2941177, 0, 1,
-1.549448, 0.001381972, 1.190244, 1, 0.3019608, 0, 1,
-1.540087, 0.3229977, -1.883022, 1, 0.3058824, 0, 1,
-1.522109, 2.317455, 0.2283651, 1, 0.3137255, 0, 1,
-1.515242, -1.421715, -3.109951, 1, 0.3176471, 0, 1,
-1.496691, 0.741582, 0.2333511, 1, 0.3254902, 0, 1,
-1.483719, 0.508629, -0.94468, 1, 0.3294118, 0, 1,
-1.478158, 0.8954981, 0.3161521, 1, 0.3372549, 0, 1,
-1.477411, -0.03406011, -0.6896913, 1, 0.3411765, 0, 1,
-1.476254, -1.127878, -1.707138, 1, 0.3490196, 0, 1,
-1.460893, -1.130389, -1.005563, 1, 0.3529412, 0, 1,
-1.45312, -0.6824372, -3.298707, 1, 0.3607843, 0, 1,
-1.445787, -0.0604528, -2.083885, 1, 0.3647059, 0, 1,
-1.434204, -2.049922, -2.071357, 1, 0.372549, 0, 1,
-1.402389, -0.7543609, -2.936797, 1, 0.3764706, 0, 1,
-1.387781, -1.231498, -3.148187, 1, 0.3843137, 0, 1,
-1.369653, 0.02705291, -1.040411, 1, 0.3882353, 0, 1,
-1.359935, 2.69463, -1.983882, 1, 0.3960784, 0, 1,
-1.352786, 0.2690545, -1.894898, 1, 0.4039216, 0, 1,
-1.34173, 1.688553, 0.5018302, 1, 0.4078431, 0, 1,
-1.33855, -0.1324745, -2.396176, 1, 0.4156863, 0, 1,
-1.335205, -0.8412038, -3.942136, 1, 0.4196078, 0, 1,
-1.316756, -0.3317778, -1.815073, 1, 0.427451, 0, 1,
-1.315663, -1.959536, -0.5457795, 1, 0.4313726, 0, 1,
-1.310022, -0.4766314, -0.9601644, 1, 0.4392157, 0, 1,
-1.302535, -1.592623, -2.910817, 1, 0.4431373, 0, 1,
-1.297177, -0.6177053, -1.137741, 1, 0.4509804, 0, 1,
-1.280752, -1.189554, -3.474983, 1, 0.454902, 0, 1,
-1.280547, -0.3792113, -2.752499, 1, 0.4627451, 0, 1,
-1.27931, -0.8203218, -1.458754, 1, 0.4666667, 0, 1,
-1.277117, -0.9453676, -3.034903, 1, 0.4745098, 0, 1,
-1.274239, 1.407103, -0.02719491, 1, 0.4784314, 0, 1,
-1.273376, 0.7780865, -0.7649589, 1, 0.4862745, 0, 1,
-1.266646, -0.7725179, -2.564075, 1, 0.4901961, 0, 1,
-1.264683, 0.293621, -3.507011, 1, 0.4980392, 0, 1,
-1.264151, 0.405526, -2.622288, 1, 0.5058824, 0, 1,
-1.241427, 0.6750882, -0.3396446, 1, 0.509804, 0, 1,
-1.238733, 0.5575401, -1.159108, 1, 0.5176471, 0, 1,
-1.231591, -1.49203, -2.62167, 1, 0.5215687, 0, 1,
-1.224699, 0.04436094, 1.506177, 1, 0.5294118, 0, 1,
-1.213241, -1.21396, -1.738082, 1, 0.5333334, 0, 1,
-1.203096, 0.5343729, 0.4228379, 1, 0.5411765, 0, 1,
-1.190713, -1.264124, -3.120835, 1, 0.5450981, 0, 1,
-1.167471, 1.957511, 1.079299, 1, 0.5529412, 0, 1,
-1.166199, 0.8847051, -0.161613, 1, 0.5568628, 0, 1,
-1.16585, -0.8280472, -1.008119, 1, 0.5647059, 0, 1,
-1.162898, 2.483855, -0.5878149, 1, 0.5686275, 0, 1,
-1.154219, 1.288121, 0.6303215, 1, 0.5764706, 0, 1,
-1.148717, 0.4699983, 0.04365874, 1, 0.5803922, 0, 1,
-1.14775, -0.03654066, -2.015789, 1, 0.5882353, 0, 1,
-1.139374, -0.9754431, -3.285925, 1, 0.5921569, 0, 1,
-1.138815, -0.191007, -1.771966, 1, 0.6, 0, 1,
-1.133872, 1.178895, 0.5593817, 1, 0.6078432, 0, 1,
-1.13194, -1.320608, -1.759128, 1, 0.6117647, 0, 1,
-1.118325, 1.300555, -2.061275, 1, 0.6196079, 0, 1,
-1.111625, 1.220494, -0.6087847, 1, 0.6235294, 0, 1,
-1.110465, -0.03629108, -2.058109, 1, 0.6313726, 0, 1,
-1.096008, 1.53851, -0.9536197, 1, 0.6352941, 0, 1,
-1.09595, 1.392906, -0.1672571, 1, 0.6431373, 0, 1,
-1.095479, -0.126375, -1.092106, 1, 0.6470588, 0, 1,
-1.078705, -1.288519, -2.797469, 1, 0.654902, 0, 1,
-1.078178, -1.260801, -2.676137, 1, 0.6588235, 0, 1,
-1.074609, 1.927261, -0.8110213, 1, 0.6666667, 0, 1,
-1.07012, -1.927411, -3.322253, 1, 0.6705883, 0, 1,
-1.066822, -0.522909, -1.045123, 1, 0.6784314, 0, 1,
-1.059766, 2.497256, -2.086579, 1, 0.682353, 0, 1,
-1.058175, 1.155478, -0.8792803, 1, 0.6901961, 0, 1,
-1.05248, 1.016891, -0.2832807, 1, 0.6941177, 0, 1,
-1.042912, 1.113834, -1.197192, 1, 0.7019608, 0, 1,
-1.041861, -0.5226918, -1.243659, 1, 0.7098039, 0, 1,
-1.035726, -1.109849, -3.438498, 1, 0.7137255, 0, 1,
-1.034106, -0.2120871, -3.613407, 1, 0.7215686, 0, 1,
-1.028776, 0.5258014, -1.835564, 1, 0.7254902, 0, 1,
-1.024895, 1.001706, 0.1459599, 1, 0.7333333, 0, 1,
-1.024416, 0.08117963, -2.808244, 1, 0.7372549, 0, 1,
-1.018314, 1.482091, -2.681537, 1, 0.7450981, 0, 1,
-1.015434, 0.2248395, -1.231856, 1, 0.7490196, 0, 1,
-1.011996, -0.5713331, -2.802026, 1, 0.7568628, 0, 1,
-1.00876, 0.7335485, 0.05255788, 1, 0.7607843, 0, 1,
-1.008632, 0.1413352, -0.8218707, 1, 0.7686275, 0, 1,
-1.008405, -0.6261083, -1.793243, 1, 0.772549, 0, 1,
-1.007587, -0.5248217, -1.429962, 1, 0.7803922, 0, 1,
-1.003133, 1.288861, 1.820912, 1, 0.7843137, 0, 1,
-0.9946353, 0.5329444, -0.572045, 1, 0.7921569, 0, 1,
-0.9921964, 0.5755575, -1.941997, 1, 0.7960784, 0, 1,
-0.991859, -0.5466822, -2.526019, 1, 0.8039216, 0, 1,
-0.9912723, 0.7977266, -2.867574, 1, 0.8117647, 0, 1,
-0.9845008, 0.2817729, -0.5589257, 1, 0.8156863, 0, 1,
-0.9734425, -0.2131597, -1.590774, 1, 0.8235294, 0, 1,
-0.9667966, -1.742244, -2.032662, 1, 0.827451, 0, 1,
-0.9639305, 1.167181, 0.1130546, 1, 0.8352941, 0, 1,
-0.9581266, 1.164656, 1.037212, 1, 0.8392157, 0, 1,
-0.956439, 0.475924, 0.07964919, 1, 0.8470588, 0, 1,
-0.9557641, 1.652143, -1.79671, 1, 0.8509804, 0, 1,
-0.9520549, -1.211516, -1.576949, 1, 0.8588235, 0, 1,
-0.9497479, -0.7281507, -3.825404, 1, 0.8627451, 0, 1,
-0.9482066, -0.2151126, -0.8230333, 1, 0.8705882, 0, 1,
-0.9477819, -0.5223707, -2.790074, 1, 0.8745098, 0, 1,
-0.947153, 0.9669535, -0.2177598, 1, 0.8823529, 0, 1,
-0.9469318, 0.6833436, -1.644557, 1, 0.8862745, 0, 1,
-0.9452409, 0.7455061, 0.0426837, 1, 0.8941177, 0, 1,
-0.9417646, -0.5138514, -2.576479, 1, 0.8980392, 0, 1,
-0.9403756, -1.140064, -2.341146, 1, 0.9058824, 0, 1,
-0.93538, -1.15162, -1.372554, 1, 0.9137255, 0, 1,
-0.9353566, -1.321362, -1.06993, 1, 0.9176471, 0, 1,
-0.9351556, -0.6648373, -2.63493, 1, 0.9254902, 0, 1,
-0.9262559, -0.5895142, -1.798543, 1, 0.9294118, 0, 1,
-0.9227196, 0.6873558, 0.08288647, 1, 0.9372549, 0, 1,
-0.9123497, -0.2146672, -3.988549, 1, 0.9411765, 0, 1,
-0.9074648, -1.740966, -2.264651, 1, 0.9490196, 0, 1,
-0.9062859, -1.548803, -2.064667, 1, 0.9529412, 0, 1,
-0.9047614, -0.7791694, -2.127224, 1, 0.9607843, 0, 1,
-0.9038977, 0.2888245, -1.036638, 1, 0.9647059, 0, 1,
-0.8997129, 0.1814549, -1.054356, 1, 0.972549, 0, 1,
-0.8912304, 1.470285, 0.6410446, 1, 0.9764706, 0, 1,
-0.8895293, 0.1464868, -1.146937, 1, 0.9843137, 0, 1,
-0.8844585, 0.8772564, -0.5733444, 1, 0.9882353, 0, 1,
-0.8727404, 0.9410274, -0.2163736, 1, 0.9960784, 0, 1,
-0.8675168, 1.222707, -0.9007871, 0.9960784, 1, 0, 1,
-0.8645911, 1.085816, -2.36066, 0.9921569, 1, 0, 1,
-0.8589941, -0.4521137, -0.4089936, 0.9843137, 1, 0, 1,
-0.8561972, -0.1733605, -2.256841, 0.9803922, 1, 0, 1,
-0.8523594, 0.3451557, -1.706484, 0.972549, 1, 0, 1,
-0.8485713, -0.9288453, -1.283004, 0.9686275, 1, 0, 1,
-0.8485387, 0.3235016, -0.8897287, 0.9607843, 1, 0, 1,
-0.8401754, 0.2134637, -2.246332, 0.9568627, 1, 0, 1,
-0.8302093, -1.078335, -2.796425, 0.9490196, 1, 0, 1,
-0.8244869, 0.8284557, -0.7481493, 0.945098, 1, 0, 1,
-0.8241428, 0.5368015, -0.5181641, 0.9372549, 1, 0, 1,
-0.82207, -0.3064251, -2.963964, 0.9333333, 1, 0, 1,
-0.8213346, 1.798643, -1.45947, 0.9254902, 1, 0, 1,
-0.8141475, 1.714528, 1.006655, 0.9215686, 1, 0, 1,
-0.8136169, -1.274119, -1.746356, 0.9137255, 1, 0, 1,
-0.8112932, 2.177525, 0.5186626, 0.9098039, 1, 0, 1,
-0.8098367, -0.5406523, -1.902215, 0.9019608, 1, 0, 1,
-0.809665, 0.2477877, -2.500118, 0.8941177, 1, 0, 1,
-0.8058231, 0.6115628, -0.3284234, 0.8901961, 1, 0, 1,
-0.8052295, 0.07966209, -1.444758, 0.8823529, 1, 0, 1,
-0.7981032, 0.1531141, -2.67569, 0.8784314, 1, 0, 1,
-0.7914019, -1.722918, -3.979186, 0.8705882, 1, 0, 1,
-0.7840907, 0.2920201, -2.038724, 0.8666667, 1, 0, 1,
-0.783729, 0.2062454, -1.336033, 0.8588235, 1, 0, 1,
-0.781678, 0.819191, -0.6857122, 0.854902, 1, 0, 1,
-0.7815731, 0.7459353, 1.398175, 0.8470588, 1, 0, 1,
-0.7806836, -0.6117859, -0.6489189, 0.8431373, 1, 0, 1,
-0.7755324, 0.4817874, -1.581115, 0.8352941, 1, 0, 1,
-0.7748728, -1.738267, -3.629241, 0.8313726, 1, 0, 1,
-0.774443, -0.5264512, -1.659588, 0.8235294, 1, 0, 1,
-0.7712849, -1.708044, -1.557711, 0.8196079, 1, 0, 1,
-0.7705481, -0.6505297, -2.184397, 0.8117647, 1, 0, 1,
-0.770146, -2.220937, -2.962142, 0.8078431, 1, 0, 1,
-0.7668789, 0.6220694, 0.51099, 0.8, 1, 0, 1,
-0.7541388, 2.263275, -0.7275063, 0.7921569, 1, 0, 1,
-0.7457156, -0.661274, -2.590745, 0.7882353, 1, 0, 1,
-0.7416884, -0.2967776, -0.4887193, 0.7803922, 1, 0, 1,
-0.7385156, -0.3272911, 0.4068568, 0.7764706, 1, 0, 1,
-0.7348594, -0.6523916, -1.927047, 0.7686275, 1, 0, 1,
-0.7295314, -0.187042, -1.552972, 0.7647059, 1, 0, 1,
-0.7279235, -0.3109072, -2.437682, 0.7568628, 1, 0, 1,
-0.7264707, 1.603789, -0.6952946, 0.7529412, 1, 0, 1,
-0.7147668, -0.03727966, -0.2277216, 0.7450981, 1, 0, 1,
-0.712586, 1.48, -0.4628159, 0.7411765, 1, 0, 1,
-0.7069056, 0.7484705, -0.7032353, 0.7333333, 1, 0, 1,
-0.7059392, 0.7951494, -1.569868, 0.7294118, 1, 0, 1,
-0.704842, 0.8004738, -2.21946, 0.7215686, 1, 0, 1,
-0.7040459, 1.496469, 0.4066922, 0.7176471, 1, 0, 1,
-0.7026961, -0.05254842, -1.436176, 0.7098039, 1, 0, 1,
-0.6954096, -0.5282665, -2.260389, 0.7058824, 1, 0, 1,
-0.6954041, -0.4829354, 0.3481635, 0.6980392, 1, 0, 1,
-0.6953297, 0.1766288, -1.818343, 0.6901961, 1, 0, 1,
-0.6948419, -0.3863107, -1.422558, 0.6862745, 1, 0, 1,
-0.6924489, 1.600929, 0.7684873, 0.6784314, 1, 0, 1,
-0.6892821, -0.8774121, -1.398507, 0.6745098, 1, 0, 1,
-0.6889502, -2.080559, -1.75729, 0.6666667, 1, 0, 1,
-0.6864938, 1.112699, -1.088197, 0.6627451, 1, 0, 1,
-0.6836458, -0.673669, -1.388225, 0.654902, 1, 0, 1,
-0.6784073, 0.595299, 0.2827272, 0.6509804, 1, 0, 1,
-0.6761851, -0.3042421, -0.8010329, 0.6431373, 1, 0, 1,
-0.6723229, -1.050636, -2.157856, 0.6392157, 1, 0, 1,
-0.6719211, 0.8866073, -1.6912, 0.6313726, 1, 0, 1,
-0.6633837, 0.6888018, -0.8008437, 0.627451, 1, 0, 1,
-0.6596653, 1.494181, -0.4861238, 0.6196079, 1, 0, 1,
-0.6589847, 0.7019187, -1.023527, 0.6156863, 1, 0, 1,
-0.6571052, 0.2892174, -0.4438778, 0.6078432, 1, 0, 1,
-0.6549181, -0.4582967, -4.808657, 0.6039216, 1, 0, 1,
-0.6506761, -0.250542, -2.504375, 0.5960785, 1, 0, 1,
-0.6504873, -0.4340219, -2.065579, 0.5882353, 1, 0, 1,
-0.6484646, 0.3671927, -1.709198, 0.5843138, 1, 0, 1,
-0.646749, -0.8923281, -3.989625, 0.5764706, 1, 0, 1,
-0.6374608, -0.3705859, -3.909914, 0.572549, 1, 0, 1,
-0.6354772, -0.1055262, -1.151065, 0.5647059, 1, 0, 1,
-0.6353353, -0.9501179, -2.667884, 0.5607843, 1, 0, 1,
-0.6282545, -2.030443, -2.369822, 0.5529412, 1, 0, 1,
-0.6221952, 0.8321936, -0.5643339, 0.5490196, 1, 0, 1,
-0.6203821, 0.1628924, -0.8792681, 0.5411765, 1, 0, 1,
-0.6196901, -1.39781, -3.683178, 0.5372549, 1, 0, 1,
-0.6196299, 1.002113, 1.411318, 0.5294118, 1, 0, 1,
-0.6186798, -0.6055974, -1.909261, 0.5254902, 1, 0, 1,
-0.6174637, -1.359643, -2.49151, 0.5176471, 1, 0, 1,
-0.6129687, -0.3764596, -3.239431, 0.5137255, 1, 0, 1,
-0.6039649, -0.5759312, -2.983527, 0.5058824, 1, 0, 1,
-0.5978934, -0.09087025, -1.464949, 0.5019608, 1, 0, 1,
-0.593796, 1.688731, -0.5163747, 0.4941176, 1, 0, 1,
-0.5925231, 0.2922426, -2.010278, 0.4862745, 1, 0, 1,
-0.5911225, -0.05176829, -1.542425, 0.4823529, 1, 0, 1,
-0.5858474, -0.9535517, -1.795036, 0.4745098, 1, 0, 1,
-0.5829149, -0.5955975, -3.442075, 0.4705882, 1, 0, 1,
-0.5810034, -1.180822, -1.66803, 0.4627451, 1, 0, 1,
-0.5800665, -0.1159804, -2.699358, 0.4588235, 1, 0, 1,
-0.5698335, 0.5681341, -0.8250099, 0.4509804, 1, 0, 1,
-0.5648769, 0.5516007, 0.5980411, 0.4470588, 1, 0, 1,
-0.5560147, -0.05851076, -2.765395, 0.4392157, 1, 0, 1,
-0.554069, 1.092157, 0.1322501, 0.4352941, 1, 0, 1,
-0.553396, 0.1202488, -0.670133, 0.427451, 1, 0, 1,
-0.5517241, 0.3127194, -0.7973998, 0.4235294, 1, 0, 1,
-0.5494168, -0.543447, -1.356092, 0.4156863, 1, 0, 1,
-0.5426211, 0.7967349, 0.5176439, 0.4117647, 1, 0, 1,
-0.5425499, 3.085085, 0.717098, 0.4039216, 1, 0, 1,
-0.5409778, -2.331866, -2.597923, 0.3960784, 1, 0, 1,
-0.5406808, 0.4181423, -0.5102935, 0.3921569, 1, 0, 1,
-0.5352712, -1.128108, -3.063418, 0.3843137, 1, 0, 1,
-0.5292479, -0.492291, -2.110238, 0.3803922, 1, 0, 1,
-0.5274235, -0.5693262, -2.055076, 0.372549, 1, 0, 1,
-0.5225505, 0.4541289, -1.338408, 0.3686275, 1, 0, 1,
-0.5179193, -1.33888, -3.024089, 0.3607843, 1, 0, 1,
-0.5122683, -0.251848, -3.612479, 0.3568628, 1, 0, 1,
-0.5041535, -0.1796831, -0.350113, 0.3490196, 1, 0, 1,
-0.5037401, -0.8857383, -3.589571, 0.345098, 1, 0, 1,
-0.502036, -1.156951, -2.678456, 0.3372549, 1, 0, 1,
-0.5008494, -1.082398, -2.728656, 0.3333333, 1, 0, 1,
-0.4985701, -0.04839905, -0.3978097, 0.3254902, 1, 0, 1,
-0.4985129, 0.6254537, -1.493401, 0.3215686, 1, 0, 1,
-0.4961139, -0.9680986, -3.733128, 0.3137255, 1, 0, 1,
-0.4959081, -1.681958, -4.740437, 0.3098039, 1, 0, 1,
-0.4948759, -0.9159832, -1.412835, 0.3019608, 1, 0, 1,
-0.4940109, 0.8195519, -1.338864, 0.2941177, 1, 0, 1,
-0.487907, -0.2008291, -1.7134, 0.2901961, 1, 0, 1,
-0.4814492, 0.8298672, 0.4222874, 0.282353, 1, 0, 1,
-0.4745493, 0.5452599, -1.640509, 0.2784314, 1, 0, 1,
-0.4737846, -0.07552129, -0.3060099, 0.2705882, 1, 0, 1,
-0.4726997, -1.623987, -3.022762, 0.2666667, 1, 0, 1,
-0.4715873, -0.1321516, -2.208895, 0.2588235, 1, 0, 1,
-0.4650377, 1.155607, 0.3798487, 0.254902, 1, 0, 1,
-0.4616737, 0.248541, -1.402224, 0.2470588, 1, 0, 1,
-0.4564025, -0.4440311, -1.672518, 0.2431373, 1, 0, 1,
-0.4512085, -0.3567285, -4.799314, 0.2352941, 1, 0, 1,
-0.4454925, 1.153707, -1.080046, 0.2313726, 1, 0, 1,
-0.4431725, -0.3480726, -1.864397, 0.2235294, 1, 0, 1,
-0.4414079, -1.055648, -0.8486441, 0.2196078, 1, 0, 1,
-0.4409608, 1.062651, -0.339933, 0.2117647, 1, 0, 1,
-0.4389222, -0.1926487, -2.112203, 0.2078431, 1, 0, 1,
-0.4375685, 0.7428799, 1.408923, 0.2, 1, 0, 1,
-0.4363396, 0.07529956, -2.74976, 0.1921569, 1, 0, 1,
-0.4341713, 0.06581883, -0.828028, 0.1882353, 1, 0, 1,
-0.4336343, 1.314767, 0.6774189, 0.1803922, 1, 0, 1,
-0.4328347, -0.8374311, -3.698763, 0.1764706, 1, 0, 1,
-0.4313295, 1.762395, -0.6253302, 0.1686275, 1, 0, 1,
-0.4272738, -0.9190273, -0.7058101, 0.1647059, 1, 0, 1,
-0.4234523, -0.02961341, -0.6702081, 0.1568628, 1, 0, 1,
-0.4207795, 0.3075089, -0.2768995, 0.1529412, 1, 0, 1,
-0.4193511, 1.456223, -1.069136, 0.145098, 1, 0, 1,
-0.4119775, 1.632275, -0.3988359, 0.1411765, 1, 0, 1,
-0.4112583, -0.5407882, -3.285049, 0.1333333, 1, 0, 1,
-0.4105257, 1.285179, -0.572479, 0.1294118, 1, 0, 1,
-0.408599, -0.8058547, -3.852509, 0.1215686, 1, 0, 1,
-0.4057963, 0.2767849, -0.1207938, 0.1176471, 1, 0, 1,
-0.4049406, 2.205735, 1.350066, 0.1098039, 1, 0, 1,
-0.4004947, -0.5905132, -2.513631, 0.1058824, 1, 0, 1,
-0.3999762, -0.9937104, -2.729846, 0.09803922, 1, 0, 1,
-0.3964596, -0.4011441, -3.078784, 0.09019608, 1, 0, 1,
-0.3941671, 0.3210697, -2.956, 0.08627451, 1, 0, 1,
-0.3900209, 0.8710095, 0.2877318, 0.07843138, 1, 0, 1,
-0.3890718, 0.4296353, -1.943706, 0.07450981, 1, 0, 1,
-0.3880515, -0.2305512, -4.155695, 0.06666667, 1, 0, 1,
-0.3836412, -0.8869844, -4.183471, 0.0627451, 1, 0, 1,
-0.3723075, -1.081888, -3.076095, 0.05490196, 1, 0, 1,
-0.3698728, -0.4090515, -3.428086, 0.05098039, 1, 0, 1,
-0.3664678, -1.088247, -2.63902, 0.04313726, 1, 0, 1,
-0.364868, 0.07120586, -1.046482, 0.03921569, 1, 0, 1,
-0.3529408, 0.5447813, -1.06649, 0.03137255, 1, 0, 1,
-0.3409739, 1.107342, 1.852644, 0.02745098, 1, 0, 1,
-0.3397742, -0.1138778, -0.495171, 0.01960784, 1, 0, 1,
-0.3393178, 0.311621, -2.156293, 0.01568628, 1, 0, 1,
-0.3354149, -0.7755352, -2.480382, 0.007843138, 1, 0, 1,
-0.3346895, -0.2305921, -1.626611, 0.003921569, 1, 0, 1,
-0.3337304, -1.366087, -3.860365, 0, 1, 0.003921569, 1,
-0.3334211, -0.2057755, -1.293697, 0, 1, 0.01176471, 1,
-0.3330808, -0.1751914, -1.913206, 0, 1, 0.01568628, 1,
-0.3308895, 0.6618188, -1.782987, 0, 1, 0.02352941, 1,
-0.3292392, 1.153927, -0.2620255, 0, 1, 0.02745098, 1,
-0.3268903, 0.6485023, -1.473475, 0, 1, 0.03529412, 1,
-0.3263726, -0.03079409, -0.9450243, 0, 1, 0.03921569, 1,
-0.3261137, 0.8221157, 1.581778, 0, 1, 0.04705882, 1,
-0.3171472, 0.9550185, -1.457969, 0, 1, 0.05098039, 1,
-0.3111191, 1.0442, -0.8287803, 0, 1, 0.05882353, 1,
-0.3099928, 0.4363629, -1.499729, 0, 1, 0.0627451, 1,
-0.3092064, -1.961238, -2.616748, 0, 1, 0.07058824, 1,
-0.309169, 0.3475789, -0.9931232, 0, 1, 0.07450981, 1,
-0.3089478, 1.252831, -1.075131, 0, 1, 0.08235294, 1,
-0.3075395, 0.697567, -0.03738458, 0, 1, 0.08627451, 1,
-0.3073758, -0.409767, -3.464077, 0, 1, 0.09411765, 1,
-0.3065132, 0.2238522, -0.7756549, 0, 1, 0.1019608, 1,
-0.300139, 0.6991952, -1.385656, 0, 1, 0.1058824, 1,
-0.2965176, 0.2576338, -0.7210991, 0, 1, 0.1137255, 1,
-0.2912714, 0.2680826, -2.707353, 0, 1, 0.1176471, 1,
-0.2900042, 1.088961, -1.905829, 0, 1, 0.1254902, 1,
-0.2898625, 0.5477217, -1.395255, 0, 1, 0.1294118, 1,
-0.289337, -1.460227, -2.552789, 0, 1, 0.1372549, 1,
-0.2863358, 0.7989097, -0.2890668, 0, 1, 0.1411765, 1,
-0.2820514, -0.06033377, -0.4824404, 0, 1, 0.1490196, 1,
-0.2819014, -0.2964587, -1.735193, 0, 1, 0.1529412, 1,
-0.2800786, 0.1361255, -1.96071, 0, 1, 0.1607843, 1,
-0.276809, 1.785679, 1.722288, 0, 1, 0.1647059, 1,
-0.2750726, 1.817669, 0.1258744, 0, 1, 0.172549, 1,
-0.2724736, -0.1701677, -1.353736, 0, 1, 0.1764706, 1,
-0.2723587, 0.7101983, -0.4550784, 0, 1, 0.1843137, 1,
-0.2689503, -2.137774, -4.185497, 0, 1, 0.1882353, 1,
-0.2667638, 0.63055, -0.0657412, 0, 1, 0.1960784, 1,
-0.2656481, 0.6944693, -1.080109, 0, 1, 0.2039216, 1,
-0.2637977, 0.2115362, -1.136972, 0, 1, 0.2078431, 1,
-0.2586914, 0.9219088, -1.272891, 0, 1, 0.2156863, 1,
-0.2546333, 1.502066, -0.9030806, 0, 1, 0.2196078, 1,
-0.2518389, -2.050399, -3.518549, 0, 1, 0.227451, 1,
-0.2490984, 1.208414, 0.865945, 0, 1, 0.2313726, 1,
-0.2475219, -0.1491014, -1.7061, 0, 1, 0.2392157, 1,
-0.2451995, -1.558072, -2.883105, 0, 1, 0.2431373, 1,
-0.2401327, 1.749734, 0.1656727, 0, 1, 0.2509804, 1,
-0.2386663, -0.9487604, -2.087074, 0, 1, 0.254902, 1,
-0.2354854, -0.2012022, -2.856455, 0, 1, 0.2627451, 1,
-0.231875, -1.158134, -1.66762, 0, 1, 0.2666667, 1,
-0.2317012, 1.605205, -1.01005, 0, 1, 0.2745098, 1,
-0.231456, 1.195138, 0.1267786, 0, 1, 0.2784314, 1,
-0.2262978, -0.4729044, -1.511935, 0, 1, 0.2862745, 1,
-0.2209914, 0.6080753, 0.9015406, 0, 1, 0.2901961, 1,
-0.2198931, 0.6958075, -0.1732147, 0, 1, 0.2980392, 1,
-0.208906, -1.954285, -1.964065, 0, 1, 0.3058824, 1,
-0.208747, 0.9281305, -0.264789, 0, 1, 0.3098039, 1,
-0.207291, -0.1380073, -2.257837, 0, 1, 0.3176471, 1,
-0.2065641, -0.2240847, -5.304996, 0, 1, 0.3215686, 1,
-0.2063991, -0.3832103, -3.751869, 0, 1, 0.3294118, 1,
-0.2032915, 1.666899, 0.739616, 0, 1, 0.3333333, 1,
-0.2002006, 0.7241899, -0.4513393, 0, 1, 0.3411765, 1,
-0.197512, -1.53778, -3.029075, 0, 1, 0.345098, 1,
-0.1894671, -1.023795, -1.413818, 0, 1, 0.3529412, 1,
-0.186231, 0.2097535, -1.160724, 0, 1, 0.3568628, 1,
-0.1850514, 0.4289559, -2.203429, 0, 1, 0.3647059, 1,
-0.182232, 1.425043, -0.6327105, 0, 1, 0.3686275, 1,
-0.1807523, -0.2997773, -3.244651, 0, 1, 0.3764706, 1,
-0.1782389, -0.8330563, -4.262081, 0, 1, 0.3803922, 1,
-0.1741599, -1.491771, -1.766167, 0, 1, 0.3882353, 1,
-0.1739878, -0.9073168, -3.160886, 0, 1, 0.3921569, 1,
-0.1722952, -1.470331, -3.795139, 0, 1, 0.4, 1,
-0.1697104, 0.5075419, 0.4469235, 0, 1, 0.4078431, 1,
-0.1689011, -0.8353502, -3.366712, 0, 1, 0.4117647, 1,
-0.1624861, 0.3883332, -0.109838, 0, 1, 0.4196078, 1,
-0.1589432, -0.6366541, -4.495474, 0, 1, 0.4235294, 1,
-0.158753, 0.6528932, 0.2493378, 0, 1, 0.4313726, 1,
-0.1561343, -0.2035843, -1.78871, 0, 1, 0.4352941, 1,
-0.1547048, -1.204531, -2.729606, 0, 1, 0.4431373, 1,
-0.1534551, -0.6850369, -2.640661, 0, 1, 0.4470588, 1,
-0.1523324, 0.09630552, 0.4280935, 0, 1, 0.454902, 1,
-0.1493362, 0.05268515, -0.5869548, 0, 1, 0.4588235, 1,
-0.1490233, -0.5218748, -3.146822, 0, 1, 0.4666667, 1,
-0.1409657, 1.40206, 0.7149968, 0, 1, 0.4705882, 1,
-0.1396747, -0.1863139, -2.978491, 0, 1, 0.4784314, 1,
-0.1363814, 0.1304585, 0.9758304, 0, 1, 0.4823529, 1,
-0.1362673, -0.7539887, -3.522009, 0, 1, 0.4901961, 1,
-0.1292319, 2.173876, 0.1585583, 0, 1, 0.4941176, 1,
-0.1291035, -1.315016, -3.267652, 0, 1, 0.5019608, 1,
-0.1261844, 1.169132, -1.294083, 0, 1, 0.509804, 1,
-0.1242198, 1.888394, -0.3782898, 0, 1, 0.5137255, 1,
-0.1210707, 0.2788588, 0.7154929, 0, 1, 0.5215687, 1,
-0.1208382, -0.8292069, -3.8741, 0, 1, 0.5254902, 1,
-0.1202403, 0.009571915, -1.61291, 0, 1, 0.5333334, 1,
-0.1192074, 0.9459276, -1.566579, 0, 1, 0.5372549, 1,
-0.1153586, -0.9483004, -4.822714, 0, 1, 0.5450981, 1,
-0.1152954, 0.5438408, 0.308335, 0, 1, 0.5490196, 1,
-0.113408, -1.18368, -3.151723, 0, 1, 0.5568628, 1,
-0.1088764, 0.841336, -0.004241384, 0, 1, 0.5607843, 1,
-0.1070599, 1.728876, 1.264919, 0, 1, 0.5686275, 1,
-0.1051467, -0.1433102, -2.045467, 0, 1, 0.572549, 1,
-0.1037743, -0.9001451, -1.940072, 0, 1, 0.5803922, 1,
-0.1027975, 0.910973, -0.3782076, 0, 1, 0.5843138, 1,
-0.1012794, -0.210286, -0.3686205, 0, 1, 0.5921569, 1,
-0.1009308, 1.58498, -1.283574, 0, 1, 0.5960785, 1,
-0.09950725, -0.8451991, -3.474951, 0, 1, 0.6039216, 1,
-0.0944512, -1.057758, -3.070316, 0, 1, 0.6117647, 1,
-0.09344812, -0.8316629, -3.106382, 0, 1, 0.6156863, 1,
-0.09257299, 1.251463, -1.271218, 0, 1, 0.6235294, 1,
-0.08659825, -1.260933, -3.836046, 0, 1, 0.627451, 1,
-0.08618468, 1.025386, -1.211565, 0, 1, 0.6352941, 1,
-0.08563845, 0.2826806, 0.1418129, 0, 1, 0.6392157, 1,
-0.07858768, -1.291908, -2.042258, 0, 1, 0.6470588, 1,
-0.07530003, -0.04340181, -3.081863, 0, 1, 0.6509804, 1,
-0.07528636, 1.785866, -0.2655777, 0, 1, 0.6588235, 1,
-0.07492975, -2.979945, -1.706923, 0, 1, 0.6627451, 1,
-0.06656973, -0.6164101, -2.076578, 0, 1, 0.6705883, 1,
-0.0665292, 2.511705, 0.205542, 0, 1, 0.6745098, 1,
-0.05120931, -0.3485675, -2.67733, 0, 1, 0.682353, 1,
-0.04329638, 0.3195404, -1.046653, 0, 1, 0.6862745, 1,
-0.04321983, 1.671829, -1.222018, 0, 1, 0.6941177, 1,
-0.04229055, 0.04599502, -0.9026914, 0, 1, 0.7019608, 1,
-0.04143806, 0.2296026, 1.483545, 0, 1, 0.7058824, 1,
-0.03762947, -0.889735, -2.864566, 0, 1, 0.7137255, 1,
-0.03128117, -1.593276, -2.402698, 0, 1, 0.7176471, 1,
-0.0265695, 0.1533132, -1.015914, 0, 1, 0.7254902, 1,
-0.02517036, 0.09167968, 1.089322, 0, 1, 0.7294118, 1,
-0.02179521, -0.1586774, -2.493776, 0, 1, 0.7372549, 1,
-0.01912107, 0.04997589, -0.08657742, 0, 1, 0.7411765, 1,
-0.01804984, -0.8027783, -2.087587, 0, 1, 0.7490196, 1,
-0.01797596, 0.2102409, -1.508717, 0, 1, 0.7529412, 1,
-0.01791537, 0.3730036, 1.229161, 0, 1, 0.7607843, 1,
-0.01690891, -0.921839, -5.137852, 0, 1, 0.7647059, 1,
-0.01629565, -0.7289464, -1.443852, 0, 1, 0.772549, 1,
-0.01562807, -0.3575644, -4.321144, 0, 1, 0.7764706, 1,
-0.007065231, -0.5762224, -3.202793, 0, 1, 0.7843137, 1,
-0.005150452, -0.585021, -3.942381, 0, 1, 0.7882353, 1,
-0.004236731, -0.3930798, -5.038613, 0, 1, 0.7960784, 1,
-0.002125489, -0.8303041, -5.349106, 0, 1, 0.8039216, 1,
0.0002354788, 1.051106, -0.0553519, 0, 1, 0.8078431, 1,
0.008385764, -0.4162802, 3.116145, 0, 1, 0.8156863, 1,
0.009017278, 0.4896966, 0.04545295, 0, 1, 0.8196079, 1,
0.01410041, 0.8561671, 0.4962963, 0, 1, 0.827451, 1,
0.0237469, 0.09852572, -0.08924499, 0, 1, 0.8313726, 1,
0.02707249, 1.105445, 2.639048, 0, 1, 0.8392157, 1,
0.02713753, -0.5437535, 3.707987, 0, 1, 0.8431373, 1,
0.0285677, -0.9738681, 3.177842, 0, 1, 0.8509804, 1,
0.02862167, -2.204245, 2.797452, 0, 1, 0.854902, 1,
0.03045064, -1.914297, 2.72363, 0, 1, 0.8627451, 1,
0.03076621, 1.189077, 0.7575427, 0, 1, 0.8666667, 1,
0.03171417, -1.585904, 2.355561, 0, 1, 0.8745098, 1,
0.0318373, -0.8193899, 2.649752, 0, 1, 0.8784314, 1,
0.0327788, -0.3595332, 3.834489, 0, 1, 0.8862745, 1,
0.0351956, -0.6206312, 2.233409, 0, 1, 0.8901961, 1,
0.03853475, 0.5754674, 1.666924, 0, 1, 0.8980392, 1,
0.04093307, 1.63308, 1.237916, 0, 1, 0.9058824, 1,
0.04186697, 1.531209, -1.078924, 0, 1, 0.9098039, 1,
0.04290554, 0.3664977, 0.7087535, 0, 1, 0.9176471, 1,
0.0477875, 0.2033597, -1.511813, 0, 1, 0.9215686, 1,
0.05168333, -0.03639493, 2.264758, 0, 1, 0.9294118, 1,
0.05199403, -0.585692, 4.011117, 0, 1, 0.9333333, 1,
0.05474574, 0.5908728, -1.110943, 0, 1, 0.9411765, 1,
0.05864722, 0.2980133, -0.3258372, 0, 1, 0.945098, 1,
0.05976475, 1.379368, 0.2990367, 0, 1, 0.9529412, 1,
0.06110118, 0.1447656, 0.2052554, 0, 1, 0.9568627, 1,
0.06192984, 0.09582154, 1.549418, 0, 1, 0.9647059, 1,
0.0654853, 1.866924, -0.7159454, 0, 1, 0.9686275, 1,
0.06871732, -0.3236142, 1.556326, 0, 1, 0.9764706, 1,
0.0739264, 0.07302739, 0.8446768, 0, 1, 0.9803922, 1,
0.07536975, 0.2368332, 1.775471, 0, 1, 0.9882353, 1,
0.07742275, -0.585721, 2.396832, 0, 1, 0.9921569, 1,
0.07830479, -1.111327, 3.161139, 0, 1, 1, 1,
0.0828182, -0.8098825, 3.509827, 0, 0.9921569, 1, 1,
0.084242, -0.4622127, 3.701172, 0, 0.9882353, 1, 1,
0.08667292, -0.7244193, 3.069644, 0, 0.9803922, 1, 1,
0.08902615, 0.2303343, -0.4520403, 0, 0.9764706, 1, 1,
0.09897053, 0.7689673, 0.9069177, 0, 0.9686275, 1, 1,
0.1009477, 0.5928514, 0.1771706, 0, 0.9647059, 1, 1,
0.1013299, -0.2662328, 2.323314, 0, 0.9568627, 1, 1,
0.1048964, -1.263028, 2.239398, 0, 0.9529412, 1, 1,
0.1067058, -1.338175, 2.449147, 0, 0.945098, 1, 1,
0.1088858, -0.6750759, 2.234627, 0, 0.9411765, 1, 1,
0.1090686, 0.5757725, 1.127005, 0, 0.9333333, 1, 1,
0.1105432, 0.6912225, 1.545317, 0, 0.9294118, 1, 1,
0.1110956, 2.744796, 0.3901157, 0, 0.9215686, 1, 1,
0.1119284, -0.2566846, 2.036252, 0, 0.9176471, 1, 1,
0.116895, 0.5312351, 1.756342, 0, 0.9098039, 1, 1,
0.1190131, 1.996366, -2.054816, 0, 0.9058824, 1, 1,
0.1200969, 0.2232691, 0.6009128, 0, 0.8980392, 1, 1,
0.124078, -1.096306, 4.236341, 0, 0.8901961, 1, 1,
0.1279407, -1.517837, 3.883951, 0, 0.8862745, 1, 1,
0.134349, 0.249508, 0.7927204, 0, 0.8784314, 1, 1,
0.135489, 2.168357, 0.7495025, 0, 0.8745098, 1, 1,
0.1365695, 0.52621, -1.086469, 0, 0.8666667, 1, 1,
0.1377153, -0.449974, 2.703385, 0, 0.8627451, 1, 1,
0.138999, 0.6529651, -1.586071, 0, 0.854902, 1, 1,
0.1393199, -0.9588486, 3.193506, 0, 0.8509804, 1, 1,
0.1405942, 1.543071, -1.435068, 0, 0.8431373, 1, 1,
0.1409529, 0.3610011, -0.1176331, 0, 0.8392157, 1, 1,
0.1423078, 0.7597138, 2.575934, 0, 0.8313726, 1, 1,
0.144807, -0.2197446, 2.002816, 0, 0.827451, 1, 1,
0.1524993, 1.858989, 0.2429097, 0, 0.8196079, 1, 1,
0.1537059, 0.5829626, -0.7943011, 0, 0.8156863, 1, 1,
0.1562561, 1.663248, 1.564747, 0, 0.8078431, 1, 1,
0.1573071, -0.8875177, 3.362037, 0, 0.8039216, 1, 1,
0.1585359, -1.414255, 3.178651, 0, 0.7960784, 1, 1,
0.1589251, -2.0573, 2.962013, 0, 0.7882353, 1, 1,
0.1653492, -0.5143627, 3.514812, 0, 0.7843137, 1, 1,
0.1693037, 0.7782838, -0.7067454, 0, 0.7764706, 1, 1,
0.1717675, -0.9999299, 4.382563, 0, 0.772549, 1, 1,
0.173682, 2.043521, 1.050618, 0, 0.7647059, 1, 1,
0.1751358, 0.2082421, 1.501635, 0, 0.7607843, 1, 1,
0.1773903, 0.1767886, 0.9047871, 0, 0.7529412, 1, 1,
0.1801157, 0.452941, 1.424207, 0, 0.7490196, 1, 1,
0.1822049, -0.5235953, 3.646991, 0, 0.7411765, 1, 1,
0.1884521, 0.3516208, 0.2224341, 0, 0.7372549, 1, 1,
0.1895324, 0.1513717, 1.120343, 0, 0.7294118, 1, 1,
0.1910117, -2.421458, 2.922144, 0, 0.7254902, 1, 1,
0.1917665, -0.0424076, 2.826189, 0, 0.7176471, 1, 1,
0.1938904, -1.549597, 3.20176, 0, 0.7137255, 1, 1,
0.2000395, -0.02800866, 1.189372, 0, 0.7058824, 1, 1,
0.2089932, 1.320934, -1.044543, 0, 0.6980392, 1, 1,
0.2120623, -1.951133, 3.394995, 0, 0.6941177, 1, 1,
0.2153286, 0.5652609, -0.6707779, 0, 0.6862745, 1, 1,
0.2164805, -2.280992, 2.092371, 0, 0.682353, 1, 1,
0.2178639, 1.505844, 0.5532194, 0, 0.6745098, 1, 1,
0.2178695, 1.840442, -1.384095, 0, 0.6705883, 1, 1,
0.2202264, 1.100773, 0.5107042, 0, 0.6627451, 1, 1,
0.2212096, -0.2730975, 3.178735, 0, 0.6588235, 1, 1,
0.2226247, 0.05680326, 1.899534, 0, 0.6509804, 1, 1,
0.2261644, 2.013321, 0.8017709, 0, 0.6470588, 1, 1,
0.2280518, -2.177258, 3.240963, 0, 0.6392157, 1, 1,
0.229763, 1.344887, -0.9226141, 0, 0.6352941, 1, 1,
0.2348733, 1.200567, -0.5545627, 0, 0.627451, 1, 1,
0.2379475, -1.08924, 2.507648, 0, 0.6235294, 1, 1,
0.2379929, 0.4877059, 2.399333, 0, 0.6156863, 1, 1,
0.2415082, 0.2778165, -0.4842055, 0, 0.6117647, 1, 1,
0.2425059, -1.436684, 2.922692, 0, 0.6039216, 1, 1,
0.2452389, 0.6436315, 2.348561, 0, 0.5960785, 1, 1,
0.2468567, -0.7855663, 2.056808, 0, 0.5921569, 1, 1,
0.2472768, -0.1260173, 2.017501, 0, 0.5843138, 1, 1,
0.2490807, 0.7379963, 2.975709, 0, 0.5803922, 1, 1,
0.252888, 2.150101, 2.305075, 0, 0.572549, 1, 1,
0.2562607, 0.8621426, 0.5830645, 0, 0.5686275, 1, 1,
0.2565856, 0.8825232, 0.8760481, 0, 0.5607843, 1, 1,
0.2568783, -0.5965521, 3.673383, 0, 0.5568628, 1, 1,
0.2571935, -0.1410294, 2.354816, 0, 0.5490196, 1, 1,
0.258137, 0.9903523, 1.209173, 0, 0.5450981, 1, 1,
0.2584657, -1.219989, 2.406349, 0, 0.5372549, 1, 1,
0.2650845, -0.7969522, 3.637277, 0, 0.5333334, 1, 1,
0.2664497, -1.627259, 3.092364, 0, 0.5254902, 1, 1,
0.2728723, -1.939553, 4.913957, 0, 0.5215687, 1, 1,
0.273738, -0.4949308, 1.617421, 0, 0.5137255, 1, 1,
0.2785765, 0.3294536, 0.1254096, 0, 0.509804, 1, 1,
0.2807796, -0.8347011, 2.727545, 0, 0.5019608, 1, 1,
0.2813016, -0.8132544, 1.674068, 0, 0.4941176, 1, 1,
0.2837226, 1.63821, -1.040944, 0, 0.4901961, 1, 1,
0.2847501, 0.7671177, -0.1257872, 0, 0.4823529, 1, 1,
0.2857641, -0.5702468, 3.745887, 0, 0.4784314, 1, 1,
0.2899891, -1.412051, 3.909599, 0, 0.4705882, 1, 1,
0.2917345, 0.3892199, -1.054503, 0, 0.4666667, 1, 1,
0.291983, 0.6084733, -0.8611856, 0, 0.4588235, 1, 1,
0.2946966, -0.3427882, 2.932331, 0, 0.454902, 1, 1,
0.3009951, 0.4406452, 0.791025, 0, 0.4470588, 1, 1,
0.3035038, -1.655962, 3.786162, 0, 0.4431373, 1, 1,
0.3077733, 0.925119, 1.086741, 0, 0.4352941, 1, 1,
0.3089763, -0.6594223, 0.7947509, 0, 0.4313726, 1, 1,
0.3092619, -0.08438345, 2.596022, 0, 0.4235294, 1, 1,
0.3155052, 1.747805, 0.9169081, 0, 0.4196078, 1, 1,
0.3168694, -2.154947, 3.15636, 0, 0.4117647, 1, 1,
0.3199555, -2.639771, 1.812778, 0, 0.4078431, 1, 1,
0.3210853, -0.1347815, 2.111266, 0, 0.4, 1, 1,
0.322869, -2.293729, 3.644046, 0, 0.3921569, 1, 1,
0.3255443, 0.4054385, 1.516333, 0, 0.3882353, 1, 1,
0.3264235, -0.3656833, 3.367138, 0, 0.3803922, 1, 1,
0.3286822, 1.178696, 0.9606885, 0, 0.3764706, 1, 1,
0.3289011, -0.3688058, 4.039396, 0, 0.3686275, 1, 1,
0.3318341, -0.08225205, 1.790338, 0, 0.3647059, 1, 1,
0.3346458, -0.4659213, 2.306434, 0, 0.3568628, 1, 1,
0.3350188, -2.082511, 4.372149, 0, 0.3529412, 1, 1,
0.3354455, 2.862076, -2.397123, 0, 0.345098, 1, 1,
0.3388639, -0.06173376, 1.70024, 0, 0.3411765, 1, 1,
0.340286, -2.269841, 4.099118, 0, 0.3333333, 1, 1,
0.3406742, 0.6002215, 0.19929, 0, 0.3294118, 1, 1,
0.3472166, 1.442407, -0.9688519, 0, 0.3215686, 1, 1,
0.3653961, -0.7370821, 1.719324, 0, 0.3176471, 1, 1,
0.3655752, 1.240107, -0.2749197, 0, 0.3098039, 1, 1,
0.3658408, -0.994067, 2.648122, 0, 0.3058824, 1, 1,
0.3674129, 1.130847, -1.508979, 0, 0.2980392, 1, 1,
0.3743606, 0.7292237, 0.8020699, 0, 0.2901961, 1, 1,
0.3749585, 0.3152259, 0.7250805, 0, 0.2862745, 1, 1,
0.3753729, 1.037228, 1.692475, 0, 0.2784314, 1, 1,
0.3773569, 1.331913, 0.5546368, 0, 0.2745098, 1, 1,
0.377887, -0.9634784, 0.9713212, 0, 0.2666667, 1, 1,
0.382592, 2.152579, 0.4928617, 0, 0.2627451, 1, 1,
0.3841323, 0.9882169, 1.117463, 0, 0.254902, 1, 1,
0.3871271, 0.0365115, -0.1486151, 0, 0.2509804, 1, 1,
0.3894982, -2.419728, 3.16633, 0, 0.2431373, 1, 1,
0.3912121, -0.604375, 2.742076, 0, 0.2392157, 1, 1,
0.3968277, -0.4173748, 2.454144, 0, 0.2313726, 1, 1,
0.3970296, -0.9897192, 1.053755, 0, 0.227451, 1, 1,
0.3976455, 1.542642, 0.5791276, 0, 0.2196078, 1, 1,
0.3979214, 1.04361, 1.148566, 0, 0.2156863, 1, 1,
0.4025994, 0.2106317, 1.726847, 0, 0.2078431, 1, 1,
0.4042757, 0.4645336, 1.794796, 0, 0.2039216, 1, 1,
0.4048403, 0.03708529, 0.9067679, 0, 0.1960784, 1, 1,
0.4064988, 1.277067, 0.3094731, 0, 0.1882353, 1, 1,
0.4070307, 1.747376, 0.8742475, 0, 0.1843137, 1, 1,
0.4082275, -0.7011986, 1.735607, 0, 0.1764706, 1, 1,
0.409749, 1.744452, -0.4264079, 0, 0.172549, 1, 1,
0.4149679, 1.586748, 0.7346392, 0, 0.1647059, 1, 1,
0.4173184, 0.9249156, -0.8310971, 0, 0.1607843, 1, 1,
0.4264, 1.408635, -0.2849827, 0, 0.1529412, 1, 1,
0.4288737, -1.573819, 3.495717, 0, 0.1490196, 1, 1,
0.4321786, 0.5489963, -0.3076877, 0, 0.1411765, 1, 1,
0.4334681, -2.106024, 3.113437, 0, 0.1372549, 1, 1,
0.4345351, 0.3831239, 2.680414, 0, 0.1294118, 1, 1,
0.4348863, 0.4947405, 0.3211567, 0, 0.1254902, 1, 1,
0.4372596, 1.132235, 0.3696781, 0, 0.1176471, 1, 1,
0.444806, 0.1359552, 0.8949317, 0, 0.1137255, 1, 1,
0.4448269, 0.3210827, 1.282241, 0, 0.1058824, 1, 1,
0.4455546, 2.252136, 0.2613693, 0, 0.09803922, 1, 1,
0.4462158, 1.111143, -0.7771702, 0, 0.09411765, 1, 1,
0.4489408, -0.3924222, 2.789879, 0, 0.08627451, 1, 1,
0.4533172, 1.622695, -0.3386555, 0, 0.08235294, 1, 1,
0.4578335, -0.6393269, 3.684041, 0, 0.07450981, 1, 1,
0.4627693, 0.8078791, 1.291178, 0, 0.07058824, 1, 1,
0.4634074, 0.5134705, 2.744346, 0, 0.0627451, 1, 1,
0.4660503, -0.09914103, 4.728902, 0, 0.05882353, 1, 1,
0.4668326, -1.034463, 3.19117, 0, 0.05098039, 1, 1,
0.4697219, 0.7235299, 0.1396172, 0, 0.04705882, 1, 1,
0.4699329, -0.1656415, 3.239026, 0, 0.03921569, 1, 1,
0.4711517, 0.80068, 0.1617483, 0, 0.03529412, 1, 1,
0.4738152, -1.718163, 3.187598, 0, 0.02745098, 1, 1,
0.4756541, 0.05404857, 0.6328322, 0, 0.02352941, 1, 1,
0.4775033, -0.0707773, 1.401547, 0, 0.01568628, 1, 1,
0.4776891, -0.1348646, 0.9458843, 0, 0.01176471, 1, 1,
0.4786734, -0.05475863, 2.287047, 0, 0.003921569, 1, 1,
0.4837288, 2.288631, 0.6295733, 0.003921569, 0, 1, 1,
0.4845651, -1.458358, 2.063428, 0.007843138, 0, 1, 1,
0.4890069, -0.9714509, 2.080688, 0.01568628, 0, 1, 1,
0.4936187, 0.5803761, 0.6841577, 0.01960784, 0, 1, 1,
0.4936845, 1.12489, -0.4928354, 0.02745098, 0, 1, 1,
0.5021226, 0.1838991, 2.191598, 0.03137255, 0, 1, 1,
0.5040357, 0.07027397, 4.52363, 0.03921569, 0, 1, 1,
0.5045477, 2.670778, 0.6908628, 0.04313726, 0, 1, 1,
0.506027, -0.1961954, 3.109396, 0.05098039, 0, 1, 1,
0.5061713, 1.18541, 0.6695359, 0.05490196, 0, 1, 1,
0.5098497, 0.4686862, 0.09457143, 0.0627451, 0, 1, 1,
0.5150827, -0.7857339, 2.370411, 0.06666667, 0, 1, 1,
0.5211976, -0.9267864, 2.511528, 0.07450981, 0, 1, 1,
0.521453, -1.445251, 3.759434, 0.07843138, 0, 1, 1,
0.5244367, -0.7784345, 2.476646, 0.08627451, 0, 1, 1,
0.5282997, 0.1291131, 1.469812, 0.09019608, 0, 1, 1,
0.5292437, 1.398263, 0.8272271, 0.09803922, 0, 1, 1,
0.5396228, -0.4390658, 2.15233, 0.1058824, 0, 1, 1,
0.5441328, 0.6648663, 0.4172656, 0.1098039, 0, 1, 1,
0.5452893, 0.1686398, 0.1836559, 0.1176471, 0, 1, 1,
0.5492359, -1.082094, 2.61058, 0.1215686, 0, 1, 1,
0.5535758, -0.8918665, 2.401834, 0.1294118, 0, 1, 1,
0.5611004, 0.7409098, -0.5069102, 0.1333333, 0, 1, 1,
0.5613061, -0.6648111, 3.517456, 0.1411765, 0, 1, 1,
0.5680346, -0.6455553, 0.4841619, 0.145098, 0, 1, 1,
0.5709492, 1.672846, 1.161322, 0.1529412, 0, 1, 1,
0.5758284, -1.408253, 4.809771, 0.1568628, 0, 1, 1,
0.5780346, -0.2594089, 3.507922, 0.1647059, 0, 1, 1,
0.582907, -0.4056541, 1.135165, 0.1686275, 0, 1, 1,
0.5831445, -0.1699528, 1.548725, 0.1764706, 0, 1, 1,
0.5853602, -0.6623939, 1.859826, 0.1803922, 0, 1, 1,
0.5908828, -0.5239713, 2.751041, 0.1882353, 0, 1, 1,
0.5922185, 1.965313, 0.7409136, 0.1921569, 0, 1, 1,
0.5940422, -2.229957, 3.870309, 0.2, 0, 1, 1,
0.5997884, -0.2367645, 2.384201, 0.2078431, 0, 1, 1,
0.6055537, 1.918663, 0.6790752, 0.2117647, 0, 1, 1,
0.6082353, 1.537358, 0.9973802, 0.2196078, 0, 1, 1,
0.6088614, -1.065218, 3.313559, 0.2235294, 0, 1, 1,
0.6098536, 1.269977, 0.6074952, 0.2313726, 0, 1, 1,
0.6110014, -2.086059, 3.947628, 0.2352941, 0, 1, 1,
0.6110026, 0.873576, 0.9370776, 0.2431373, 0, 1, 1,
0.6203443, 0.1208218, 1.663122, 0.2470588, 0, 1, 1,
0.6242754, 0.3733528, 0.6318078, 0.254902, 0, 1, 1,
0.6243961, 0.4325138, 1.517058, 0.2588235, 0, 1, 1,
0.6266389, 0.6149759, 1.673243, 0.2666667, 0, 1, 1,
0.6279222, 0.2904533, 0.7385167, 0.2705882, 0, 1, 1,
0.6319338, 1.572784, 0.5030742, 0.2784314, 0, 1, 1,
0.6325866, -1.000742, 2.415258, 0.282353, 0, 1, 1,
0.6370353, -0.4705115, 1.648147, 0.2901961, 0, 1, 1,
0.6375181, -1.482729, 0.3909938, 0.2941177, 0, 1, 1,
0.6375967, -0.9744831, 2.920329, 0.3019608, 0, 1, 1,
0.6380263, -0.1118614, 2.028064, 0.3098039, 0, 1, 1,
0.6420243, -0.41388, 0.8769379, 0.3137255, 0, 1, 1,
0.642495, -0.08730356, -0.0812734, 0.3215686, 0, 1, 1,
0.6434327, 0.4031254, 1.381247, 0.3254902, 0, 1, 1,
0.650619, -0.1081848, 1.535298, 0.3333333, 0, 1, 1,
0.651605, 0.5495346, -0.9033135, 0.3372549, 0, 1, 1,
0.6534813, -0.2940328, 3.425446, 0.345098, 0, 1, 1,
0.6585752, -0.6261416, 2.291308, 0.3490196, 0, 1, 1,
0.6638122, 0.2095146, 2.058322, 0.3568628, 0, 1, 1,
0.6672835, -0.02468785, 2.356324, 0.3607843, 0, 1, 1,
0.6673731, -1.716224, 3.458465, 0.3686275, 0, 1, 1,
0.6686447, -0.1617725, 1.141139, 0.372549, 0, 1, 1,
0.6711676, 0.1012505, 3.57832, 0.3803922, 0, 1, 1,
0.674123, -0.08525935, 2.535545, 0.3843137, 0, 1, 1,
0.6744274, 0.4113417, 1.108411, 0.3921569, 0, 1, 1,
0.6751549, 0.2205464, 2.562861, 0.3960784, 0, 1, 1,
0.6843575, -0.944675, 1.842031, 0.4039216, 0, 1, 1,
0.6947159, -0.5748001, 4.00009, 0.4117647, 0, 1, 1,
0.695444, -0.8213386, 2.202269, 0.4156863, 0, 1, 1,
0.7007278, -0.5429729, 2.02492, 0.4235294, 0, 1, 1,
0.7017683, 0.7599832, 2.349491, 0.427451, 0, 1, 1,
0.7064263, 0.7966073, 0.1457865, 0.4352941, 0, 1, 1,
0.7102612, 0.2114047, -0.9426869, 0.4392157, 0, 1, 1,
0.7115428, 1.747482, 2.000795, 0.4470588, 0, 1, 1,
0.7135831, -0.0597285, 1.09865, 0.4509804, 0, 1, 1,
0.7146749, -0.303182, 3.35066, 0.4588235, 0, 1, 1,
0.7239485, 0.7715868, 0.2626882, 0.4627451, 0, 1, 1,
0.7266976, -0.2967406, 2.423592, 0.4705882, 0, 1, 1,
0.7318364, -2.05008, 1.391791, 0.4745098, 0, 1, 1,
0.7335058, 0.6490714, 1.113793, 0.4823529, 0, 1, 1,
0.7339307, 0.1081258, 1.65696, 0.4862745, 0, 1, 1,
0.7408999, -0.2676794, 1.716811, 0.4941176, 0, 1, 1,
0.7573213, 0.5804251, 1.48769, 0.5019608, 0, 1, 1,
0.7600119, -0.9476123, 3.325163, 0.5058824, 0, 1, 1,
0.7606279, 0.9040736, 1.484248, 0.5137255, 0, 1, 1,
0.762641, -1.491719, 2.49192, 0.5176471, 0, 1, 1,
0.7638292, -2.618128, 2.769861, 0.5254902, 0, 1, 1,
0.7654133, 0.3892311, 0.8938792, 0.5294118, 0, 1, 1,
0.7661127, -0.1081342, 1.640957, 0.5372549, 0, 1, 1,
0.7670277, 1.518147, 1.199007, 0.5411765, 0, 1, 1,
0.7685417, 1.174592, 0.8152669, 0.5490196, 0, 1, 1,
0.7687669, 0.07752455, 2.132949, 0.5529412, 0, 1, 1,
0.7706453, 1.372614, -0.7818692, 0.5607843, 0, 1, 1,
0.7744274, -0.1960781, 2.779898, 0.5647059, 0, 1, 1,
0.7837644, -1.921164, 2.388306, 0.572549, 0, 1, 1,
0.7892234, 0.8219465, 0.7274492, 0.5764706, 0, 1, 1,
0.7952328, -0.8814663, 2.6625, 0.5843138, 0, 1, 1,
0.7958931, 3.01791, -0.3085106, 0.5882353, 0, 1, 1,
0.7967626, 0.8924938, 2.438647, 0.5960785, 0, 1, 1,
0.7969407, 1.015811, -0.8515022, 0.6039216, 0, 1, 1,
0.8074406, -1.219562, 2.149285, 0.6078432, 0, 1, 1,
0.8082038, -0.9938437, 3.812027, 0.6156863, 0, 1, 1,
0.8092185, -1.985017, 2.211364, 0.6196079, 0, 1, 1,
0.8092716, -0.06272113, 1.482247, 0.627451, 0, 1, 1,
0.8119962, -1.463684, 3.958143, 0.6313726, 0, 1, 1,
0.8133543, 0.3124715, 0.103133, 0.6392157, 0, 1, 1,
0.813506, 1.752142, -0.3877808, 0.6431373, 0, 1, 1,
0.8143784, 0.6567291, 0.2780891, 0.6509804, 0, 1, 1,
0.8197291, -0.1329297, 0.3052758, 0.654902, 0, 1, 1,
0.8236431, 0.8666573, 1.114776, 0.6627451, 0, 1, 1,
0.823914, 1.212418, 1.090789, 0.6666667, 0, 1, 1,
0.8282995, -0.8706107, 2.259636, 0.6745098, 0, 1, 1,
0.8291295, -1.916963, 2.665656, 0.6784314, 0, 1, 1,
0.8333293, -0.1612204, 2.819407, 0.6862745, 0, 1, 1,
0.8358088, -0.2891725, 1.593663, 0.6901961, 0, 1, 1,
0.8384169, 0.2868724, -0.6936149, 0.6980392, 0, 1, 1,
0.8433656, 0.8052919, -0.619591, 0.7058824, 0, 1, 1,
0.8444636, -0.09994802, 1.226727, 0.7098039, 0, 1, 1,
0.8489667, 0.9068435, 0.04522415, 0.7176471, 0, 1, 1,
0.8499082, 0.4408087, 1.547695, 0.7215686, 0, 1, 1,
0.8583761, 0.8844002, 0.2991636, 0.7294118, 0, 1, 1,
0.8637115, -0.9738637, 1.344244, 0.7333333, 0, 1, 1,
0.8643429, 0.06536878, 1.438931, 0.7411765, 0, 1, 1,
0.8644309, -1.74809, 5.312711, 0.7450981, 0, 1, 1,
0.8713643, 1.051823, 0.6220789, 0.7529412, 0, 1, 1,
0.8727083, 0.1195925, 2.754179, 0.7568628, 0, 1, 1,
0.8751324, -0.592264, 0.9934683, 0.7647059, 0, 1, 1,
0.8771176, -0.08963558, 2.149328, 0.7686275, 0, 1, 1,
0.8785418, 0.9850751, -1.022784, 0.7764706, 0, 1, 1,
0.8845243, 0.1361212, 1.238532, 0.7803922, 0, 1, 1,
0.8853477, 1.10223, -0.1730086, 0.7882353, 0, 1, 1,
0.892242, 0.07974171, 2.02407, 0.7921569, 0, 1, 1,
0.8926218, -2.48407, 2.147971, 0.8, 0, 1, 1,
0.8928535, -0.5079492, 1.32755, 0.8078431, 0, 1, 1,
0.8933047, -0.7083285, 1.16951, 0.8117647, 0, 1, 1,
0.8978174, -0.10917, -0.07056011, 0.8196079, 0, 1, 1,
0.9003779, 0.6126808, -0.3644311, 0.8235294, 0, 1, 1,
0.9037457, -0.4326574, 2.072167, 0.8313726, 0, 1, 1,
0.9041794, -0.3194361, 2.400389, 0.8352941, 0, 1, 1,
0.9083872, 0.998948, 1.453033, 0.8431373, 0, 1, 1,
0.9101859, 0.9464598, 0.1444833, 0.8470588, 0, 1, 1,
0.9136665, -0.7945901, 2.146907, 0.854902, 0, 1, 1,
0.9142041, -0.878959, 1.824236, 0.8588235, 0, 1, 1,
0.9261769, 1.096446, 1.422241, 0.8666667, 0, 1, 1,
0.931776, 2.228451, 0.1102875, 0.8705882, 0, 1, 1,
0.9339347, 0.2570232, 2.23351, 0.8784314, 0, 1, 1,
0.9347699, 2.077733, 0.11001, 0.8823529, 0, 1, 1,
0.9351942, 0.01050967, 1.888069, 0.8901961, 0, 1, 1,
0.937427, -0.8510737, 1.438161, 0.8941177, 0, 1, 1,
0.9398082, 0.4759903, 1.165284, 0.9019608, 0, 1, 1,
0.9420012, 2.721423, 0.4164865, 0.9098039, 0, 1, 1,
0.9508633, -0.1432545, 2.794921, 0.9137255, 0, 1, 1,
0.9545975, 1.456165, 2.843363, 0.9215686, 0, 1, 1,
0.9581232, -0.08868808, 2.766955, 0.9254902, 0, 1, 1,
0.9590375, -0.8168828, 4.318854, 0.9333333, 0, 1, 1,
0.9641067, -0.2400762, 3.406647, 0.9372549, 0, 1, 1,
0.9678168, 1.374949, 1.003402, 0.945098, 0, 1, 1,
0.9683051, -0.1363677, 1.38639, 0.9490196, 0, 1, 1,
0.9686315, 0.2230688, 1.51184, 0.9568627, 0, 1, 1,
0.9711233, -0.2239239, 0.644116, 0.9607843, 0, 1, 1,
0.9795552, -0.5622206, 0.3433056, 0.9686275, 0, 1, 1,
0.9842221, 0.2020974, 2.126254, 0.972549, 0, 1, 1,
0.986361, 1.366389, -0.5090666, 0.9803922, 0, 1, 1,
0.989155, 0.4336594, 1.636836, 0.9843137, 0, 1, 1,
0.9905009, 1.164916, 0.216046, 0.9921569, 0, 1, 1,
1.003237, -0.8849808, 3.52268, 0.9960784, 0, 1, 1,
1.003255, 0.7496268, 0.4737821, 1, 0, 0.9960784, 1,
1.003978, 0.3633173, 0.7325418, 1, 0, 0.9882353, 1,
1.006613, -0.4541718, 3.722661, 1, 0, 0.9843137, 1,
1.007199, 1.139679, -1.23704, 1, 0, 0.9764706, 1,
1.010593, 1.343225, 0.8352276, 1, 0, 0.972549, 1,
1.013062, -0.3366944, 1.641702, 1, 0, 0.9647059, 1,
1.016474, -0.06319961, 1.403696, 1, 0, 0.9607843, 1,
1.027749, -1.685084, 3.264229, 1, 0, 0.9529412, 1,
1.032588, -1.312113, 0.9408434, 1, 0, 0.9490196, 1,
1.038836, 0.4631611, 0.627911, 1, 0, 0.9411765, 1,
1.041285, 1.120666, -0.3478735, 1, 0, 0.9372549, 1,
1.048413, -0.5529983, 1.224592, 1, 0, 0.9294118, 1,
1.052476, -0.3326802, 1.31556, 1, 0, 0.9254902, 1,
1.056233, -0.03528666, 1.403564, 1, 0, 0.9176471, 1,
1.059548, -0.03169154, 2.465525, 1, 0, 0.9137255, 1,
1.059652, 0.1997261, 1.943673, 1, 0, 0.9058824, 1,
1.060269, 0.3465119, 1.872683, 1, 0, 0.9019608, 1,
1.065537, 0.6269453, 1.211433, 1, 0, 0.8941177, 1,
1.065639, -0.6173189, 3.312281, 1, 0, 0.8862745, 1,
1.083605, -0.2507299, 0.9114081, 1, 0, 0.8823529, 1,
1.08684, -1.402585, 3.132521, 1, 0, 0.8745098, 1,
1.088676, 0.3717407, 2.041391, 1, 0, 0.8705882, 1,
1.090988, -0.4566085, 1.026963, 1, 0, 0.8627451, 1,
1.095704, -0.1082098, 1.928755, 1, 0, 0.8588235, 1,
1.099206, -0.7964436, 3.457583, 1, 0, 0.8509804, 1,
1.104953, 0.4341084, 0.8195536, 1, 0, 0.8470588, 1,
1.107232, -1.682088, 2.538237, 1, 0, 0.8392157, 1,
1.107756, 1.334269, -1.29894, 1, 0, 0.8352941, 1,
1.113599, -0.3723052, 1.946768, 1, 0, 0.827451, 1,
1.115482, 0.2930995, 1.548146, 1, 0, 0.8235294, 1,
1.121939, -0.9044648, 2.102151, 1, 0, 0.8156863, 1,
1.127272, -1.621485, 2.473888, 1, 0, 0.8117647, 1,
1.127311, -0.4603854, 2.345929, 1, 0, 0.8039216, 1,
1.135387, -0.6226934, 1.861825, 1, 0, 0.7960784, 1,
1.141141, 0.3806948, 1.877295, 1, 0, 0.7921569, 1,
1.14629, 0.3247163, 1.219684, 1, 0, 0.7843137, 1,
1.157052, -0.07858838, 2.025474, 1, 0, 0.7803922, 1,
1.159006, -0.2519684, 1.344522, 1, 0, 0.772549, 1,
1.159694, 0.5356327, 0.3558002, 1, 0, 0.7686275, 1,
1.162143, -1.499611, 2.412043, 1, 0, 0.7607843, 1,
1.162651, 1.046709, 0.5564836, 1, 0, 0.7568628, 1,
1.164727, 0.8126577, 2.342994, 1, 0, 0.7490196, 1,
1.168359, 0.3334202, 0.7310435, 1, 0, 0.7450981, 1,
1.170214, -0.3976033, 3.128165, 1, 0, 0.7372549, 1,
1.17546, -0.6816586, 0.6348066, 1, 0, 0.7333333, 1,
1.194578, -0.1582735, 0.8225641, 1, 0, 0.7254902, 1,
1.19485, 0.240891, 1.461617, 1, 0, 0.7215686, 1,
1.195151, -1.744165, 2.558069, 1, 0, 0.7137255, 1,
1.203236, -0.07193357, 1.942533, 1, 0, 0.7098039, 1,
1.208193, 0.08278593, 1.771807, 1, 0, 0.7019608, 1,
1.215032, 0.7540084, 0.8974752, 1, 0, 0.6941177, 1,
1.22217, 1.404208, -0.9814205, 1, 0, 0.6901961, 1,
1.223128, -0.5326066, 1.352386, 1, 0, 0.682353, 1,
1.225549, -1.404886, 1.321007, 1, 0, 0.6784314, 1,
1.236287, 0.005181607, 1.437352, 1, 0, 0.6705883, 1,
1.238996, -0.7131531, 2.486866, 1, 0, 0.6666667, 1,
1.243447, 0.6813743, 0.7549515, 1, 0, 0.6588235, 1,
1.24498, -0.02980972, 1.61464, 1, 0, 0.654902, 1,
1.249837, 1.066802, 0.639522, 1, 0, 0.6470588, 1,
1.253919, 0.3831445, 1.995675, 1, 0, 0.6431373, 1,
1.255406, -0.7241803, 3.102412, 1, 0, 0.6352941, 1,
1.256139, 0.6216666, 0.4642375, 1, 0, 0.6313726, 1,
1.257143, -1.499848, 1.673027, 1, 0, 0.6235294, 1,
1.25955, -0.6770682, 1.718672, 1, 0, 0.6196079, 1,
1.263791, -0.02006128, 3.030897, 1, 0, 0.6117647, 1,
1.267524, 1.50018, 0.7375938, 1, 0, 0.6078432, 1,
1.272135, 0.03712116, 2.179477, 1, 0, 0.6, 1,
1.272411, 1.279172, 0.1697512, 1, 0, 0.5921569, 1,
1.273983, 0.5231963, 0.09077646, 1, 0, 0.5882353, 1,
1.274267, -0.8782766, 1.355093, 1, 0, 0.5803922, 1,
1.288437, -0.09390962, 2.807433, 1, 0, 0.5764706, 1,
1.29415, -0.465208, 2.78448, 1, 0, 0.5686275, 1,
1.299651, 0.0997196, 1.17521, 1, 0, 0.5647059, 1,
1.30442, 0.8019258, 1.154246, 1, 0, 0.5568628, 1,
1.305272, 1.365199, 1.262386, 1, 0, 0.5529412, 1,
1.310989, 0.498413, -0.283796, 1, 0, 0.5450981, 1,
1.316509, 1.378524, 0.5256718, 1, 0, 0.5411765, 1,
1.318682, -0.1880232, 1.066496, 1, 0, 0.5333334, 1,
1.318847, -0.2457347, 1.547217, 1, 0, 0.5294118, 1,
1.327909, -0.2612585, 3.229163, 1, 0, 0.5215687, 1,
1.328562, 0.591566, 2.167472, 1, 0, 0.5176471, 1,
1.335128, -0.871237, 2.401613, 1, 0, 0.509804, 1,
1.341357, 2.506741, 0.7701495, 1, 0, 0.5058824, 1,
1.35328, 0.9545256, 1.463553, 1, 0, 0.4980392, 1,
1.35499, 1.016291, 0.3916694, 1, 0, 0.4901961, 1,
1.355013, -0.5885682, 2.338684, 1, 0, 0.4862745, 1,
1.367056, 0.135859, 0.5566318, 1, 0, 0.4784314, 1,
1.373872, 0.5115917, 1.95936, 1, 0, 0.4745098, 1,
1.379763, 0.2664629, 1.950778, 1, 0, 0.4666667, 1,
1.385509, 0.9078661, 1.490134, 1, 0, 0.4627451, 1,
1.386048, 0.4879143, 1.807406, 1, 0, 0.454902, 1,
1.39318, 1.057619, 0.9685467, 1, 0, 0.4509804, 1,
1.406216, 1.396606, -0.6439501, 1, 0, 0.4431373, 1,
1.408454, 0.2628921, 0.9887713, 1, 0, 0.4392157, 1,
1.40955, 0.6888923, 0.2276162, 1, 0, 0.4313726, 1,
1.411574, 0.8712505, 2.030226, 1, 0, 0.427451, 1,
1.417441, -0.4930983, 2.571614, 1, 0, 0.4196078, 1,
1.424037, 1.577488, 1.021829, 1, 0, 0.4156863, 1,
1.439806, -0.3261127, 0.8336464, 1, 0, 0.4078431, 1,
1.468051, 1.070139, 1.79739, 1, 0, 0.4039216, 1,
1.480541, 1.06933, 1.946949, 1, 0, 0.3960784, 1,
1.490493, 1.271229, 0.904109, 1, 0, 0.3882353, 1,
1.508554, -0.2414999, 3.285247, 1, 0, 0.3843137, 1,
1.518332, -0.3185149, 1.962343, 1, 0, 0.3764706, 1,
1.519064, -0.1854628, 1.847946, 1, 0, 0.372549, 1,
1.524035, -0.3289259, 2.471637, 1, 0, 0.3647059, 1,
1.52456, -1.208766, 2.846177, 1, 0, 0.3607843, 1,
1.527268, -0.3333934, 0.7963605, 1, 0, 0.3529412, 1,
1.53256, -0.1477626, 2.740076, 1, 0, 0.3490196, 1,
1.544168, -0.4872985, 2.939338, 1, 0, 0.3411765, 1,
1.547187, 0.989591, 3.731879, 1, 0, 0.3372549, 1,
1.550373, 1.601162, -0.375444, 1, 0, 0.3294118, 1,
1.550753, -0.8185362, 2.562607, 1, 0, 0.3254902, 1,
1.572531, 0.1567833, 1.480667, 1, 0, 0.3176471, 1,
1.573045, -0.1568301, 1.551697, 1, 0, 0.3137255, 1,
1.60804, 0.7300351, 2.434009, 1, 0, 0.3058824, 1,
1.612111, -0.3368969, 1.485988, 1, 0, 0.2980392, 1,
1.629359, 1.221004, 2.323501, 1, 0, 0.2941177, 1,
1.633288, -0.7693, 3.890872, 1, 0, 0.2862745, 1,
1.634798, -0.5030351, 2.194695, 1, 0, 0.282353, 1,
1.638537, -0.2748654, 0.9296052, 1, 0, 0.2745098, 1,
1.641002, 0.5725408, -0.1438721, 1, 0, 0.2705882, 1,
1.643258, 0.07478393, 2.499954, 1, 0, 0.2627451, 1,
1.675432, 0.1283184, 2.315856, 1, 0, 0.2588235, 1,
1.676352, 0.8173723, 2.663844, 1, 0, 0.2509804, 1,
1.681304, 2.910961, -2.354855, 1, 0, 0.2470588, 1,
1.685188, 1.501329, -0.5909796, 1, 0, 0.2392157, 1,
1.696019, -0.4423336, 1.579238, 1, 0, 0.2352941, 1,
1.711904, 0.3036265, 2.006295, 1, 0, 0.227451, 1,
1.717516, -0.1426762, 1.902393, 1, 0, 0.2235294, 1,
1.72302, 0.3518961, 1.465029, 1, 0, 0.2156863, 1,
1.725377, -0.5726126, 0.07449154, 1, 0, 0.2117647, 1,
1.733029, 0.7368232, 1.2954, 1, 0, 0.2039216, 1,
1.764034, 1.324598, -0.9845471, 1, 0, 0.1960784, 1,
1.784742, -0.00976313, 1.751514, 1, 0, 0.1921569, 1,
1.818051, -1.184658, 4.463156, 1, 0, 0.1843137, 1,
1.833688, -0.1438981, 2.096002, 1, 0, 0.1803922, 1,
1.838873, 1.673443, 1.523081, 1, 0, 0.172549, 1,
1.878412, -0.8742474, 1.212981, 1, 0, 0.1686275, 1,
1.883052, 2.243312, 0.3047725, 1, 0, 0.1607843, 1,
1.888255, 0.23427, 1.457892, 1, 0, 0.1568628, 1,
1.889832, 1.056597, 0.4677924, 1, 0, 0.1490196, 1,
1.889991, -1.948937, 1.545925, 1, 0, 0.145098, 1,
1.899052, 0.8945999, -0.6998909, 1, 0, 0.1372549, 1,
1.932651, -3.133335, 3.493541, 1, 0, 0.1333333, 1,
1.935301, 0.7394903, 1.932289, 1, 0, 0.1254902, 1,
1.943514, -0.2670293, 1.844023, 1, 0, 0.1215686, 1,
1.944119, 0.4754672, 2.943312, 1, 0, 0.1137255, 1,
1.973386, 0.4756295, 2.785725, 1, 0, 0.1098039, 1,
2.026484, 0.2194449, 2.447985, 1, 0, 0.1019608, 1,
2.062368, -0.5745548, -0.790109, 1, 0, 0.09411765, 1,
2.071298, -0.8840871, 3.310236, 1, 0, 0.09019608, 1,
2.092964, -0.6834969, 2.399918, 1, 0, 0.08235294, 1,
2.120115, -0.2170716, 2.966843, 1, 0, 0.07843138, 1,
2.121274, -0.2901886, 1.022419, 1, 0, 0.07058824, 1,
2.205303, 0.588013, 3.04732, 1, 0, 0.06666667, 1,
2.255821, -0.0376452, 2.47665, 1, 0, 0.05882353, 1,
2.274822, 0.9828264, 2.058056, 1, 0, 0.05490196, 1,
2.309408, -0.5966538, 1.189807, 1, 0, 0.04705882, 1,
2.395031, -0.1702785, 2.06918, 1, 0, 0.04313726, 1,
2.403463, 0.3999428, 2.813037, 1, 0, 0.03529412, 1,
2.44857, 0.1327024, 0.5804823, 1, 0, 0.03137255, 1,
2.463007, -1.908889, 2.083639, 1, 0, 0.02352941, 1,
2.609786, -2.278848, 1.972159, 1, 0, 0.01960784, 1,
2.749701, -0.7730328, 2.694686, 1, 0, 0.01176471, 1,
3.328839, -0.0102161, -0.02404469, 1, 0, 0.007843138, 1
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
0.05813384, -4.187357, -7.156284, 0, -0.5, 0.5, 0.5,
0.05813384, -4.187357, -7.156284, 1, -0.5, 0.5, 0.5,
0.05813384, -4.187357, -7.156284, 1, 1.5, 0.5, 0.5,
0.05813384, -4.187357, -7.156284, 0, 1.5, 0.5, 0.5
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
-4.321341, -0.02412498, -7.156284, 0, -0.5, 0.5, 0.5,
-4.321341, -0.02412498, -7.156284, 1, -0.5, 0.5, 0.5,
-4.321341, -0.02412498, -7.156284, 1, 1.5, 0.5, 0.5,
-4.321341, -0.02412498, -7.156284, 0, 1.5, 0.5, 0.5
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
-4.321341, -4.187357, -0.01819754, 0, -0.5, 0.5, 0.5,
-4.321341, -4.187357, -0.01819754, 1, -0.5, 0.5, 0.5,
-4.321341, -4.187357, -0.01819754, 1, 1.5, 0.5, 0.5,
-4.321341, -4.187357, -0.01819754, 0, 1.5, 0.5, 0.5
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
-3, -3.226611, -5.509034,
3, -3.226611, -5.509034,
-3, -3.226611, -5.509034,
-3, -3.386736, -5.783576,
-2, -3.226611, -5.509034,
-2, -3.386736, -5.783576,
-1, -3.226611, -5.509034,
-1, -3.386736, -5.783576,
0, -3.226611, -5.509034,
0, -3.386736, -5.783576,
1, -3.226611, -5.509034,
1, -3.386736, -5.783576,
2, -3.226611, -5.509034,
2, -3.386736, -5.783576,
3, -3.226611, -5.509034,
3, -3.386736, -5.783576
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
-3, -3.706984, -6.332659, 0, -0.5, 0.5, 0.5,
-3, -3.706984, -6.332659, 1, -0.5, 0.5, 0.5,
-3, -3.706984, -6.332659, 1, 1.5, 0.5, 0.5,
-3, -3.706984, -6.332659, 0, 1.5, 0.5, 0.5,
-2, -3.706984, -6.332659, 0, -0.5, 0.5, 0.5,
-2, -3.706984, -6.332659, 1, -0.5, 0.5, 0.5,
-2, -3.706984, -6.332659, 1, 1.5, 0.5, 0.5,
-2, -3.706984, -6.332659, 0, 1.5, 0.5, 0.5,
-1, -3.706984, -6.332659, 0, -0.5, 0.5, 0.5,
-1, -3.706984, -6.332659, 1, -0.5, 0.5, 0.5,
-1, -3.706984, -6.332659, 1, 1.5, 0.5, 0.5,
-1, -3.706984, -6.332659, 0, 1.5, 0.5, 0.5,
0, -3.706984, -6.332659, 0, -0.5, 0.5, 0.5,
0, -3.706984, -6.332659, 1, -0.5, 0.5, 0.5,
0, -3.706984, -6.332659, 1, 1.5, 0.5, 0.5,
0, -3.706984, -6.332659, 0, 1.5, 0.5, 0.5,
1, -3.706984, -6.332659, 0, -0.5, 0.5, 0.5,
1, -3.706984, -6.332659, 1, -0.5, 0.5, 0.5,
1, -3.706984, -6.332659, 1, 1.5, 0.5, 0.5,
1, -3.706984, -6.332659, 0, 1.5, 0.5, 0.5,
2, -3.706984, -6.332659, 0, -0.5, 0.5, 0.5,
2, -3.706984, -6.332659, 1, -0.5, 0.5, 0.5,
2, -3.706984, -6.332659, 1, 1.5, 0.5, 0.5,
2, -3.706984, -6.332659, 0, 1.5, 0.5, 0.5,
3, -3.706984, -6.332659, 0, -0.5, 0.5, 0.5,
3, -3.706984, -6.332659, 1, -0.5, 0.5, 0.5,
3, -3.706984, -6.332659, 1, 1.5, 0.5, 0.5,
3, -3.706984, -6.332659, 0, 1.5, 0.5, 0.5
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
-3.310693, -3, -5.509034,
-3.310693, 3, -5.509034,
-3.310693, -3, -5.509034,
-3.479134, -3, -5.783576,
-3.310693, -2, -5.509034,
-3.479134, -2, -5.783576,
-3.310693, -1, -5.509034,
-3.479134, -1, -5.783576,
-3.310693, 0, -5.509034,
-3.479134, 0, -5.783576,
-3.310693, 1, -5.509034,
-3.479134, 1, -5.783576,
-3.310693, 2, -5.509034,
-3.479134, 2, -5.783576,
-3.310693, 3, -5.509034,
-3.479134, 3, -5.783576
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
-3.816016, -3, -6.332659, 0, -0.5, 0.5, 0.5,
-3.816016, -3, -6.332659, 1, -0.5, 0.5, 0.5,
-3.816016, -3, -6.332659, 1, 1.5, 0.5, 0.5,
-3.816016, -3, -6.332659, 0, 1.5, 0.5, 0.5,
-3.816016, -2, -6.332659, 0, -0.5, 0.5, 0.5,
-3.816016, -2, -6.332659, 1, -0.5, 0.5, 0.5,
-3.816016, -2, -6.332659, 1, 1.5, 0.5, 0.5,
-3.816016, -2, -6.332659, 0, 1.5, 0.5, 0.5,
-3.816016, -1, -6.332659, 0, -0.5, 0.5, 0.5,
-3.816016, -1, -6.332659, 1, -0.5, 0.5, 0.5,
-3.816016, -1, -6.332659, 1, 1.5, 0.5, 0.5,
-3.816016, -1, -6.332659, 0, 1.5, 0.5, 0.5,
-3.816016, 0, -6.332659, 0, -0.5, 0.5, 0.5,
-3.816016, 0, -6.332659, 1, -0.5, 0.5, 0.5,
-3.816016, 0, -6.332659, 1, 1.5, 0.5, 0.5,
-3.816016, 0, -6.332659, 0, 1.5, 0.5, 0.5,
-3.816016, 1, -6.332659, 0, -0.5, 0.5, 0.5,
-3.816016, 1, -6.332659, 1, -0.5, 0.5, 0.5,
-3.816016, 1, -6.332659, 1, 1.5, 0.5, 0.5,
-3.816016, 1, -6.332659, 0, 1.5, 0.5, 0.5,
-3.816016, 2, -6.332659, 0, -0.5, 0.5, 0.5,
-3.816016, 2, -6.332659, 1, -0.5, 0.5, 0.5,
-3.816016, 2, -6.332659, 1, 1.5, 0.5, 0.5,
-3.816016, 2, -6.332659, 0, 1.5, 0.5, 0.5,
-3.816016, 3, -6.332659, 0, -0.5, 0.5, 0.5,
-3.816016, 3, -6.332659, 1, -0.5, 0.5, 0.5,
-3.816016, 3, -6.332659, 1, 1.5, 0.5, 0.5,
-3.816016, 3, -6.332659, 0, 1.5, 0.5, 0.5
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
-3.310693, -3.226611, -4,
-3.310693, -3.226611, 4,
-3.310693, -3.226611, -4,
-3.479134, -3.386736, -4,
-3.310693, -3.226611, -2,
-3.479134, -3.386736, -2,
-3.310693, -3.226611, 0,
-3.479134, -3.386736, 0,
-3.310693, -3.226611, 2,
-3.479134, -3.386736, 2,
-3.310693, -3.226611, 4,
-3.479134, -3.386736, 4
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
-3.816016, -3.706984, -4, 0, -0.5, 0.5, 0.5,
-3.816016, -3.706984, -4, 1, -0.5, 0.5, 0.5,
-3.816016, -3.706984, -4, 1, 1.5, 0.5, 0.5,
-3.816016, -3.706984, -4, 0, 1.5, 0.5, 0.5,
-3.816016, -3.706984, -2, 0, -0.5, 0.5, 0.5,
-3.816016, -3.706984, -2, 1, -0.5, 0.5, 0.5,
-3.816016, -3.706984, -2, 1, 1.5, 0.5, 0.5,
-3.816016, -3.706984, -2, 0, 1.5, 0.5, 0.5,
-3.816016, -3.706984, 0, 0, -0.5, 0.5, 0.5,
-3.816016, -3.706984, 0, 1, -0.5, 0.5, 0.5,
-3.816016, -3.706984, 0, 1, 1.5, 0.5, 0.5,
-3.816016, -3.706984, 0, 0, 1.5, 0.5, 0.5,
-3.816016, -3.706984, 2, 0, -0.5, 0.5, 0.5,
-3.816016, -3.706984, 2, 1, -0.5, 0.5, 0.5,
-3.816016, -3.706984, 2, 1, 1.5, 0.5, 0.5,
-3.816016, -3.706984, 2, 0, 1.5, 0.5, 0.5,
-3.816016, -3.706984, 4, 0, -0.5, 0.5, 0.5,
-3.816016, -3.706984, 4, 1, -0.5, 0.5, 0.5,
-3.816016, -3.706984, 4, 1, 1.5, 0.5, 0.5,
-3.816016, -3.706984, 4, 0, 1.5, 0.5, 0.5
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
-3.310693, -3.226611, -5.509034,
-3.310693, 3.178361, -5.509034,
-3.310693, -3.226611, 5.472639,
-3.310693, 3.178361, 5.472639,
-3.310693, -3.226611, -5.509034,
-3.310693, -3.226611, 5.472639,
-3.310693, 3.178361, -5.509034,
-3.310693, 3.178361, 5.472639,
-3.310693, -3.226611, -5.509034,
3.42696, -3.226611, -5.509034,
-3.310693, -3.226611, 5.472639,
3.42696, -3.226611, 5.472639,
-3.310693, 3.178361, -5.509034,
3.42696, 3.178361, -5.509034,
-3.310693, 3.178361, 5.472639,
3.42696, 3.178361, 5.472639,
3.42696, -3.226611, -5.509034,
3.42696, 3.178361, -5.509034,
3.42696, -3.226611, 5.472639,
3.42696, 3.178361, 5.472639,
3.42696, -3.226611, -5.509034,
3.42696, -3.226611, 5.472639,
3.42696, 3.178361, -5.509034,
3.42696, 3.178361, 5.472639
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
var radius = 7.682954;
var distance = 34.18233;
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
mvMatrix.translate( -0.05813384, 0.02412498, 0.01819754 );
mvMatrix.scale( 1.232916, 1.296955, 0.7564386 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.18233);
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
dimethylcyclopropane<-read.table("dimethylcyclopropane.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethylcyclopropane$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethylcyclopropane' not found
```

```r
y<-dimethylcyclopropane$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethylcyclopropane' not found
```

```r
z<-dimethylcyclopropane$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethylcyclopropane' not found
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
-3.212571, 0.5688694, -1.048013, 0, 0, 1, 1, 1,
-3.179781, 1.374401, -2.284819, 1, 0, 0, 1, 1,
-2.965865, 0.5173569, -1.151315, 1, 0, 0, 1, 1,
-2.924764, 1.683832, -0.6696578, 1, 0, 0, 1, 1,
-2.753523, -2.766864, -2.789845, 1, 0, 0, 1, 1,
-2.709377, -1.913088, -0.6618603, 1, 0, 0, 1, 1,
-2.708671, -0.05533171, -2.283432, 0, 0, 0, 1, 1,
-2.625829, 0.9171483, -0.2588502, 0, 0, 0, 1, 1,
-2.580789, -0.3194001, -1.682586, 0, 0, 0, 1, 1,
-2.579821, -0.8675372, -3.443108, 0, 0, 0, 1, 1,
-2.554113, 1.629923, -1.150933, 0, 0, 0, 1, 1,
-2.53786, -0.5774701, -1.624019, 0, 0, 0, 1, 1,
-2.476475, 0.008091733, -2.594603, 0, 0, 0, 1, 1,
-2.44277, -1.638471, -2.932461, 1, 1, 1, 1, 1,
-2.374619, -0.5371195, -1.724491, 1, 1, 1, 1, 1,
-2.252101, -0.3250496, -1.149249, 1, 1, 1, 1, 1,
-2.251212, -0.6063153, -0.645035, 1, 1, 1, 1, 1,
-2.203507, 0.8170135, -0.5137073, 1, 1, 1, 1, 1,
-2.191793, -2.163303, -3.783987, 1, 1, 1, 1, 1,
-2.158107, 0.6668332, -0.7583712, 1, 1, 1, 1, 1,
-2.147881, -0.7517986, -2.092501, 1, 1, 1, 1, 1,
-2.10282, -0.8867599, -2.591937, 1, 1, 1, 1, 1,
-2.066667, 1.030514, -2.169764, 1, 1, 1, 1, 1,
-2.01269, 0.2917362, -2.274772, 1, 1, 1, 1, 1,
-1.979323, -0.152721, -2.101085, 1, 1, 1, 1, 1,
-1.954754, 1.348994, 0.349171, 1, 1, 1, 1, 1,
-1.941608, -0.4624102, -3.355751, 1, 1, 1, 1, 1,
-1.932972, -0.5598989, -2.762001, 1, 1, 1, 1, 1,
-1.915925, -2.291712, -2.991536, 0, 0, 1, 1, 1,
-1.906541, 2.156932, 0.7164417, 1, 0, 0, 1, 1,
-1.904332, -0.6492712, -2.183901, 1, 0, 0, 1, 1,
-1.88736, -1.046457, -2.67129, 1, 0, 0, 1, 1,
-1.839556, -0.4093953, 0.5637586, 1, 0, 0, 1, 1,
-1.817655, -0.1565464, -1.14051, 1, 0, 0, 1, 1,
-1.781957, 0.05263714, -2.538783, 0, 0, 0, 1, 1,
-1.768013, -0.9493778, -3.241575, 0, 0, 0, 1, 1,
-1.755215, 1.267847, -0.05311907, 0, 0, 0, 1, 1,
-1.720566, 0.4873187, -1.01183, 0, 0, 0, 1, 1,
-1.688299, 0.5836229, -1.666981, 0, 0, 0, 1, 1,
-1.682624, 0.8402258, -0.05730191, 0, 0, 0, 1, 1,
-1.676045, 1.0613, -1.97849, 0, 0, 0, 1, 1,
-1.648458, 0.394106, -2.432505, 1, 1, 1, 1, 1,
-1.636866, -1.085555, -0.846157, 1, 1, 1, 1, 1,
-1.635077, -0.5280583, -2.798448, 1, 1, 1, 1, 1,
-1.624668, 1.854547, -1.052973, 1, 1, 1, 1, 1,
-1.624642, 0.3544959, -1.843743, 1, 1, 1, 1, 1,
-1.611759, 1.319417, -0.6696541, 1, 1, 1, 1, 1,
-1.598511, -1.654366, -2.676448, 1, 1, 1, 1, 1,
-1.584061, 1.035515, -1.68709, 1, 1, 1, 1, 1,
-1.551198, -1.019812, -1.45948, 1, 1, 1, 1, 1,
-1.549448, 0.001381972, 1.190244, 1, 1, 1, 1, 1,
-1.540087, 0.3229977, -1.883022, 1, 1, 1, 1, 1,
-1.522109, 2.317455, 0.2283651, 1, 1, 1, 1, 1,
-1.515242, -1.421715, -3.109951, 1, 1, 1, 1, 1,
-1.496691, 0.741582, 0.2333511, 1, 1, 1, 1, 1,
-1.483719, 0.508629, -0.94468, 1, 1, 1, 1, 1,
-1.478158, 0.8954981, 0.3161521, 0, 0, 1, 1, 1,
-1.477411, -0.03406011, -0.6896913, 1, 0, 0, 1, 1,
-1.476254, -1.127878, -1.707138, 1, 0, 0, 1, 1,
-1.460893, -1.130389, -1.005563, 1, 0, 0, 1, 1,
-1.45312, -0.6824372, -3.298707, 1, 0, 0, 1, 1,
-1.445787, -0.0604528, -2.083885, 1, 0, 0, 1, 1,
-1.434204, -2.049922, -2.071357, 0, 0, 0, 1, 1,
-1.402389, -0.7543609, -2.936797, 0, 0, 0, 1, 1,
-1.387781, -1.231498, -3.148187, 0, 0, 0, 1, 1,
-1.369653, 0.02705291, -1.040411, 0, 0, 0, 1, 1,
-1.359935, 2.69463, -1.983882, 0, 0, 0, 1, 1,
-1.352786, 0.2690545, -1.894898, 0, 0, 0, 1, 1,
-1.34173, 1.688553, 0.5018302, 0, 0, 0, 1, 1,
-1.33855, -0.1324745, -2.396176, 1, 1, 1, 1, 1,
-1.335205, -0.8412038, -3.942136, 1, 1, 1, 1, 1,
-1.316756, -0.3317778, -1.815073, 1, 1, 1, 1, 1,
-1.315663, -1.959536, -0.5457795, 1, 1, 1, 1, 1,
-1.310022, -0.4766314, -0.9601644, 1, 1, 1, 1, 1,
-1.302535, -1.592623, -2.910817, 1, 1, 1, 1, 1,
-1.297177, -0.6177053, -1.137741, 1, 1, 1, 1, 1,
-1.280752, -1.189554, -3.474983, 1, 1, 1, 1, 1,
-1.280547, -0.3792113, -2.752499, 1, 1, 1, 1, 1,
-1.27931, -0.8203218, -1.458754, 1, 1, 1, 1, 1,
-1.277117, -0.9453676, -3.034903, 1, 1, 1, 1, 1,
-1.274239, 1.407103, -0.02719491, 1, 1, 1, 1, 1,
-1.273376, 0.7780865, -0.7649589, 1, 1, 1, 1, 1,
-1.266646, -0.7725179, -2.564075, 1, 1, 1, 1, 1,
-1.264683, 0.293621, -3.507011, 1, 1, 1, 1, 1,
-1.264151, 0.405526, -2.622288, 0, 0, 1, 1, 1,
-1.241427, 0.6750882, -0.3396446, 1, 0, 0, 1, 1,
-1.238733, 0.5575401, -1.159108, 1, 0, 0, 1, 1,
-1.231591, -1.49203, -2.62167, 1, 0, 0, 1, 1,
-1.224699, 0.04436094, 1.506177, 1, 0, 0, 1, 1,
-1.213241, -1.21396, -1.738082, 1, 0, 0, 1, 1,
-1.203096, 0.5343729, 0.4228379, 0, 0, 0, 1, 1,
-1.190713, -1.264124, -3.120835, 0, 0, 0, 1, 1,
-1.167471, 1.957511, 1.079299, 0, 0, 0, 1, 1,
-1.166199, 0.8847051, -0.161613, 0, 0, 0, 1, 1,
-1.16585, -0.8280472, -1.008119, 0, 0, 0, 1, 1,
-1.162898, 2.483855, -0.5878149, 0, 0, 0, 1, 1,
-1.154219, 1.288121, 0.6303215, 0, 0, 0, 1, 1,
-1.148717, 0.4699983, 0.04365874, 1, 1, 1, 1, 1,
-1.14775, -0.03654066, -2.015789, 1, 1, 1, 1, 1,
-1.139374, -0.9754431, -3.285925, 1, 1, 1, 1, 1,
-1.138815, -0.191007, -1.771966, 1, 1, 1, 1, 1,
-1.133872, 1.178895, 0.5593817, 1, 1, 1, 1, 1,
-1.13194, -1.320608, -1.759128, 1, 1, 1, 1, 1,
-1.118325, 1.300555, -2.061275, 1, 1, 1, 1, 1,
-1.111625, 1.220494, -0.6087847, 1, 1, 1, 1, 1,
-1.110465, -0.03629108, -2.058109, 1, 1, 1, 1, 1,
-1.096008, 1.53851, -0.9536197, 1, 1, 1, 1, 1,
-1.09595, 1.392906, -0.1672571, 1, 1, 1, 1, 1,
-1.095479, -0.126375, -1.092106, 1, 1, 1, 1, 1,
-1.078705, -1.288519, -2.797469, 1, 1, 1, 1, 1,
-1.078178, -1.260801, -2.676137, 1, 1, 1, 1, 1,
-1.074609, 1.927261, -0.8110213, 1, 1, 1, 1, 1,
-1.07012, -1.927411, -3.322253, 0, 0, 1, 1, 1,
-1.066822, -0.522909, -1.045123, 1, 0, 0, 1, 1,
-1.059766, 2.497256, -2.086579, 1, 0, 0, 1, 1,
-1.058175, 1.155478, -0.8792803, 1, 0, 0, 1, 1,
-1.05248, 1.016891, -0.2832807, 1, 0, 0, 1, 1,
-1.042912, 1.113834, -1.197192, 1, 0, 0, 1, 1,
-1.041861, -0.5226918, -1.243659, 0, 0, 0, 1, 1,
-1.035726, -1.109849, -3.438498, 0, 0, 0, 1, 1,
-1.034106, -0.2120871, -3.613407, 0, 0, 0, 1, 1,
-1.028776, 0.5258014, -1.835564, 0, 0, 0, 1, 1,
-1.024895, 1.001706, 0.1459599, 0, 0, 0, 1, 1,
-1.024416, 0.08117963, -2.808244, 0, 0, 0, 1, 1,
-1.018314, 1.482091, -2.681537, 0, 0, 0, 1, 1,
-1.015434, 0.2248395, -1.231856, 1, 1, 1, 1, 1,
-1.011996, -0.5713331, -2.802026, 1, 1, 1, 1, 1,
-1.00876, 0.7335485, 0.05255788, 1, 1, 1, 1, 1,
-1.008632, 0.1413352, -0.8218707, 1, 1, 1, 1, 1,
-1.008405, -0.6261083, -1.793243, 1, 1, 1, 1, 1,
-1.007587, -0.5248217, -1.429962, 1, 1, 1, 1, 1,
-1.003133, 1.288861, 1.820912, 1, 1, 1, 1, 1,
-0.9946353, 0.5329444, -0.572045, 1, 1, 1, 1, 1,
-0.9921964, 0.5755575, -1.941997, 1, 1, 1, 1, 1,
-0.991859, -0.5466822, -2.526019, 1, 1, 1, 1, 1,
-0.9912723, 0.7977266, -2.867574, 1, 1, 1, 1, 1,
-0.9845008, 0.2817729, -0.5589257, 1, 1, 1, 1, 1,
-0.9734425, -0.2131597, -1.590774, 1, 1, 1, 1, 1,
-0.9667966, -1.742244, -2.032662, 1, 1, 1, 1, 1,
-0.9639305, 1.167181, 0.1130546, 1, 1, 1, 1, 1,
-0.9581266, 1.164656, 1.037212, 0, 0, 1, 1, 1,
-0.956439, 0.475924, 0.07964919, 1, 0, 0, 1, 1,
-0.9557641, 1.652143, -1.79671, 1, 0, 0, 1, 1,
-0.9520549, -1.211516, -1.576949, 1, 0, 0, 1, 1,
-0.9497479, -0.7281507, -3.825404, 1, 0, 0, 1, 1,
-0.9482066, -0.2151126, -0.8230333, 1, 0, 0, 1, 1,
-0.9477819, -0.5223707, -2.790074, 0, 0, 0, 1, 1,
-0.947153, 0.9669535, -0.2177598, 0, 0, 0, 1, 1,
-0.9469318, 0.6833436, -1.644557, 0, 0, 0, 1, 1,
-0.9452409, 0.7455061, 0.0426837, 0, 0, 0, 1, 1,
-0.9417646, -0.5138514, -2.576479, 0, 0, 0, 1, 1,
-0.9403756, -1.140064, -2.341146, 0, 0, 0, 1, 1,
-0.93538, -1.15162, -1.372554, 0, 0, 0, 1, 1,
-0.9353566, -1.321362, -1.06993, 1, 1, 1, 1, 1,
-0.9351556, -0.6648373, -2.63493, 1, 1, 1, 1, 1,
-0.9262559, -0.5895142, -1.798543, 1, 1, 1, 1, 1,
-0.9227196, 0.6873558, 0.08288647, 1, 1, 1, 1, 1,
-0.9123497, -0.2146672, -3.988549, 1, 1, 1, 1, 1,
-0.9074648, -1.740966, -2.264651, 1, 1, 1, 1, 1,
-0.9062859, -1.548803, -2.064667, 1, 1, 1, 1, 1,
-0.9047614, -0.7791694, -2.127224, 1, 1, 1, 1, 1,
-0.9038977, 0.2888245, -1.036638, 1, 1, 1, 1, 1,
-0.8997129, 0.1814549, -1.054356, 1, 1, 1, 1, 1,
-0.8912304, 1.470285, 0.6410446, 1, 1, 1, 1, 1,
-0.8895293, 0.1464868, -1.146937, 1, 1, 1, 1, 1,
-0.8844585, 0.8772564, -0.5733444, 1, 1, 1, 1, 1,
-0.8727404, 0.9410274, -0.2163736, 1, 1, 1, 1, 1,
-0.8675168, 1.222707, -0.9007871, 1, 1, 1, 1, 1,
-0.8645911, 1.085816, -2.36066, 0, 0, 1, 1, 1,
-0.8589941, -0.4521137, -0.4089936, 1, 0, 0, 1, 1,
-0.8561972, -0.1733605, -2.256841, 1, 0, 0, 1, 1,
-0.8523594, 0.3451557, -1.706484, 1, 0, 0, 1, 1,
-0.8485713, -0.9288453, -1.283004, 1, 0, 0, 1, 1,
-0.8485387, 0.3235016, -0.8897287, 1, 0, 0, 1, 1,
-0.8401754, 0.2134637, -2.246332, 0, 0, 0, 1, 1,
-0.8302093, -1.078335, -2.796425, 0, 0, 0, 1, 1,
-0.8244869, 0.8284557, -0.7481493, 0, 0, 0, 1, 1,
-0.8241428, 0.5368015, -0.5181641, 0, 0, 0, 1, 1,
-0.82207, -0.3064251, -2.963964, 0, 0, 0, 1, 1,
-0.8213346, 1.798643, -1.45947, 0, 0, 0, 1, 1,
-0.8141475, 1.714528, 1.006655, 0, 0, 0, 1, 1,
-0.8136169, -1.274119, -1.746356, 1, 1, 1, 1, 1,
-0.8112932, 2.177525, 0.5186626, 1, 1, 1, 1, 1,
-0.8098367, -0.5406523, -1.902215, 1, 1, 1, 1, 1,
-0.809665, 0.2477877, -2.500118, 1, 1, 1, 1, 1,
-0.8058231, 0.6115628, -0.3284234, 1, 1, 1, 1, 1,
-0.8052295, 0.07966209, -1.444758, 1, 1, 1, 1, 1,
-0.7981032, 0.1531141, -2.67569, 1, 1, 1, 1, 1,
-0.7914019, -1.722918, -3.979186, 1, 1, 1, 1, 1,
-0.7840907, 0.2920201, -2.038724, 1, 1, 1, 1, 1,
-0.783729, 0.2062454, -1.336033, 1, 1, 1, 1, 1,
-0.781678, 0.819191, -0.6857122, 1, 1, 1, 1, 1,
-0.7815731, 0.7459353, 1.398175, 1, 1, 1, 1, 1,
-0.7806836, -0.6117859, -0.6489189, 1, 1, 1, 1, 1,
-0.7755324, 0.4817874, -1.581115, 1, 1, 1, 1, 1,
-0.7748728, -1.738267, -3.629241, 1, 1, 1, 1, 1,
-0.774443, -0.5264512, -1.659588, 0, 0, 1, 1, 1,
-0.7712849, -1.708044, -1.557711, 1, 0, 0, 1, 1,
-0.7705481, -0.6505297, -2.184397, 1, 0, 0, 1, 1,
-0.770146, -2.220937, -2.962142, 1, 0, 0, 1, 1,
-0.7668789, 0.6220694, 0.51099, 1, 0, 0, 1, 1,
-0.7541388, 2.263275, -0.7275063, 1, 0, 0, 1, 1,
-0.7457156, -0.661274, -2.590745, 0, 0, 0, 1, 1,
-0.7416884, -0.2967776, -0.4887193, 0, 0, 0, 1, 1,
-0.7385156, -0.3272911, 0.4068568, 0, 0, 0, 1, 1,
-0.7348594, -0.6523916, -1.927047, 0, 0, 0, 1, 1,
-0.7295314, -0.187042, -1.552972, 0, 0, 0, 1, 1,
-0.7279235, -0.3109072, -2.437682, 0, 0, 0, 1, 1,
-0.7264707, 1.603789, -0.6952946, 0, 0, 0, 1, 1,
-0.7147668, -0.03727966, -0.2277216, 1, 1, 1, 1, 1,
-0.712586, 1.48, -0.4628159, 1, 1, 1, 1, 1,
-0.7069056, 0.7484705, -0.7032353, 1, 1, 1, 1, 1,
-0.7059392, 0.7951494, -1.569868, 1, 1, 1, 1, 1,
-0.704842, 0.8004738, -2.21946, 1, 1, 1, 1, 1,
-0.7040459, 1.496469, 0.4066922, 1, 1, 1, 1, 1,
-0.7026961, -0.05254842, -1.436176, 1, 1, 1, 1, 1,
-0.6954096, -0.5282665, -2.260389, 1, 1, 1, 1, 1,
-0.6954041, -0.4829354, 0.3481635, 1, 1, 1, 1, 1,
-0.6953297, 0.1766288, -1.818343, 1, 1, 1, 1, 1,
-0.6948419, -0.3863107, -1.422558, 1, 1, 1, 1, 1,
-0.6924489, 1.600929, 0.7684873, 1, 1, 1, 1, 1,
-0.6892821, -0.8774121, -1.398507, 1, 1, 1, 1, 1,
-0.6889502, -2.080559, -1.75729, 1, 1, 1, 1, 1,
-0.6864938, 1.112699, -1.088197, 1, 1, 1, 1, 1,
-0.6836458, -0.673669, -1.388225, 0, 0, 1, 1, 1,
-0.6784073, 0.595299, 0.2827272, 1, 0, 0, 1, 1,
-0.6761851, -0.3042421, -0.8010329, 1, 0, 0, 1, 1,
-0.6723229, -1.050636, -2.157856, 1, 0, 0, 1, 1,
-0.6719211, 0.8866073, -1.6912, 1, 0, 0, 1, 1,
-0.6633837, 0.6888018, -0.8008437, 1, 0, 0, 1, 1,
-0.6596653, 1.494181, -0.4861238, 0, 0, 0, 1, 1,
-0.6589847, 0.7019187, -1.023527, 0, 0, 0, 1, 1,
-0.6571052, 0.2892174, -0.4438778, 0, 0, 0, 1, 1,
-0.6549181, -0.4582967, -4.808657, 0, 0, 0, 1, 1,
-0.6506761, -0.250542, -2.504375, 0, 0, 0, 1, 1,
-0.6504873, -0.4340219, -2.065579, 0, 0, 0, 1, 1,
-0.6484646, 0.3671927, -1.709198, 0, 0, 0, 1, 1,
-0.646749, -0.8923281, -3.989625, 1, 1, 1, 1, 1,
-0.6374608, -0.3705859, -3.909914, 1, 1, 1, 1, 1,
-0.6354772, -0.1055262, -1.151065, 1, 1, 1, 1, 1,
-0.6353353, -0.9501179, -2.667884, 1, 1, 1, 1, 1,
-0.6282545, -2.030443, -2.369822, 1, 1, 1, 1, 1,
-0.6221952, 0.8321936, -0.5643339, 1, 1, 1, 1, 1,
-0.6203821, 0.1628924, -0.8792681, 1, 1, 1, 1, 1,
-0.6196901, -1.39781, -3.683178, 1, 1, 1, 1, 1,
-0.6196299, 1.002113, 1.411318, 1, 1, 1, 1, 1,
-0.6186798, -0.6055974, -1.909261, 1, 1, 1, 1, 1,
-0.6174637, -1.359643, -2.49151, 1, 1, 1, 1, 1,
-0.6129687, -0.3764596, -3.239431, 1, 1, 1, 1, 1,
-0.6039649, -0.5759312, -2.983527, 1, 1, 1, 1, 1,
-0.5978934, -0.09087025, -1.464949, 1, 1, 1, 1, 1,
-0.593796, 1.688731, -0.5163747, 1, 1, 1, 1, 1,
-0.5925231, 0.2922426, -2.010278, 0, 0, 1, 1, 1,
-0.5911225, -0.05176829, -1.542425, 1, 0, 0, 1, 1,
-0.5858474, -0.9535517, -1.795036, 1, 0, 0, 1, 1,
-0.5829149, -0.5955975, -3.442075, 1, 0, 0, 1, 1,
-0.5810034, -1.180822, -1.66803, 1, 0, 0, 1, 1,
-0.5800665, -0.1159804, -2.699358, 1, 0, 0, 1, 1,
-0.5698335, 0.5681341, -0.8250099, 0, 0, 0, 1, 1,
-0.5648769, 0.5516007, 0.5980411, 0, 0, 0, 1, 1,
-0.5560147, -0.05851076, -2.765395, 0, 0, 0, 1, 1,
-0.554069, 1.092157, 0.1322501, 0, 0, 0, 1, 1,
-0.553396, 0.1202488, -0.670133, 0, 0, 0, 1, 1,
-0.5517241, 0.3127194, -0.7973998, 0, 0, 0, 1, 1,
-0.5494168, -0.543447, -1.356092, 0, 0, 0, 1, 1,
-0.5426211, 0.7967349, 0.5176439, 1, 1, 1, 1, 1,
-0.5425499, 3.085085, 0.717098, 1, 1, 1, 1, 1,
-0.5409778, -2.331866, -2.597923, 1, 1, 1, 1, 1,
-0.5406808, 0.4181423, -0.5102935, 1, 1, 1, 1, 1,
-0.5352712, -1.128108, -3.063418, 1, 1, 1, 1, 1,
-0.5292479, -0.492291, -2.110238, 1, 1, 1, 1, 1,
-0.5274235, -0.5693262, -2.055076, 1, 1, 1, 1, 1,
-0.5225505, 0.4541289, -1.338408, 1, 1, 1, 1, 1,
-0.5179193, -1.33888, -3.024089, 1, 1, 1, 1, 1,
-0.5122683, -0.251848, -3.612479, 1, 1, 1, 1, 1,
-0.5041535, -0.1796831, -0.350113, 1, 1, 1, 1, 1,
-0.5037401, -0.8857383, -3.589571, 1, 1, 1, 1, 1,
-0.502036, -1.156951, -2.678456, 1, 1, 1, 1, 1,
-0.5008494, -1.082398, -2.728656, 1, 1, 1, 1, 1,
-0.4985701, -0.04839905, -0.3978097, 1, 1, 1, 1, 1,
-0.4985129, 0.6254537, -1.493401, 0, 0, 1, 1, 1,
-0.4961139, -0.9680986, -3.733128, 1, 0, 0, 1, 1,
-0.4959081, -1.681958, -4.740437, 1, 0, 0, 1, 1,
-0.4948759, -0.9159832, -1.412835, 1, 0, 0, 1, 1,
-0.4940109, 0.8195519, -1.338864, 1, 0, 0, 1, 1,
-0.487907, -0.2008291, -1.7134, 1, 0, 0, 1, 1,
-0.4814492, 0.8298672, 0.4222874, 0, 0, 0, 1, 1,
-0.4745493, 0.5452599, -1.640509, 0, 0, 0, 1, 1,
-0.4737846, -0.07552129, -0.3060099, 0, 0, 0, 1, 1,
-0.4726997, -1.623987, -3.022762, 0, 0, 0, 1, 1,
-0.4715873, -0.1321516, -2.208895, 0, 0, 0, 1, 1,
-0.4650377, 1.155607, 0.3798487, 0, 0, 0, 1, 1,
-0.4616737, 0.248541, -1.402224, 0, 0, 0, 1, 1,
-0.4564025, -0.4440311, -1.672518, 1, 1, 1, 1, 1,
-0.4512085, -0.3567285, -4.799314, 1, 1, 1, 1, 1,
-0.4454925, 1.153707, -1.080046, 1, 1, 1, 1, 1,
-0.4431725, -0.3480726, -1.864397, 1, 1, 1, 1, 1,
-0.4414079, -1.055648, -0.8486441, 1, 1, 1, 1, 1,
-0.4409608, 1.062651, -0.339933, 1, 1, 1, 1, 1,
-0.4389222, -0.1926487, -2.112203, 1, 1, 1, 1, 1,
-0.4375685, 0.7428799, 1.408923, 1, 1, 1, 1, 1,
-0.4363396, 0.07529956, -2.74976, 1, 1, 1, 1, 1,
-0.4341713, 0.06581883, -0.828028, 1, 1, 1, 1, 1,
-0.4336343, 1.314767, 0.6774189, 1, 1, 1, 1, 1,
-0.4328347, -0.8374311, -3.698763, 1, 1, 1, 1, 1,
-0.4313295, 1.762395, -0.6253302, 1, 1, 1, 1, 1,
-0.4272738, -0.9190273, -0.7058101, 1, 1, 1, 1, 1,
-0.4234523, -0.02961341, -0.6702081, 1, 1, 1, 1, 1,
-0.4207795, 0.3075089, -0.2768995, 0, 0, 1, 1, 1,
-0.4193511, 1.456223, -1.069136, 1, 0, 0, 1, 1,
-0.4119775, 1.632275, -0.3988359, 1, 0, 0, 1, 1,
-0.4112583, -0.5407882, -3.285049, 1, 0, 0, 1, 1,
-0.4105257, 1.285179, -0.572479, 1, 0, 0, 1, 1,
-0.408599, -0.8058547, -3.852509, 1, 0, 0, 1, 1,
-0.4057963, 0.2767849, -0.1207938, 0, 0, 0, 1, 1,
-0.4049406, 2.205735, 1.350066, 0, 0, 0, 1, 1,
-0.4004947, -0.5905132, -2.513631, 0, 0, 0, 1, 1,
-0.3999762, -0.9937104, -2.729846, 0, 0, 0, 1, 1,
-0.3964596, -0.4011441, -3.078784, 0, 0, 0, 1, 1,
-0.3941671, 0.3210697, -2.956, 0, 0, 0, 1, 1,
-0.3900209, 0.8710095, 0.2877318, 0, 0, 0, 1, 1,
-0.3890718, 0.4296353, -1.943706, 1, 1, 1, 1, 1,
-0.3880515, -0.2305512, -4.155695, 1, 1, 1, 1, 1,
-0.3836412, -0.8869844, -4.183471, 1, 1, 1, 1, 1,
-0.3723075, -1.081888, -3.076095, 1, 1, 1, 1, 1,
-0.3698728, -0.4090515, -3.428086, 1, 1, 1, 1, 1,
-0.3664678, -1.088247, -2.63902, 1, 1, 1, 1, 1,
-0.364868, 0.07120586, -1.046482, 1, 1, 1, 1, 1,
-0.3529408, 0.5447813, -1.06649, 1, 1, 1, 1, 1,
-0.3409739, 1.107342, 1.852644, 1, 1, 1, 1, 1,
-0.3397742, -0.1138778, -0.495171, 1, 1, 1, 1, 1,
-0.3393178, 0.311621, -2.156293, 1, 1, 1, 1, 1,
-0.3354149, -0.7755352, -2.480382, 1, 1, 1, 1, 1,
-0.3346895, -0.2305921, -1.626611, 1, 1, 1, 1, 1,
-0.3337304, -1.366087, -3.860365, 1, 1, 1, 1, 1,
-0.3334211, -0.2057755, -1.293697, 1, 1, 1, 1, 1,
-0.3330808, -0.1751914, -1.913206, 0, 0, 1, 1, 1,
-0.3308895, 0.6618188, -1.782987, 1, 0, 0, 1, 1,
-0.3292392, 1.153927, -0.2620255, 1, 0, 0, 1, 1,
-0.3268903, 0.6485023, -1.473475, 1, 0, 0, 1, 1,
-0.3263726, -0.03079409, -0.9450243, 1, 0, 0, 1, 1,
-0.3261137, 0.8221157, 1.581778, 1, 0, 0, 1, 1,
-0.3171472, 0.9550185, -1.457969, 0, 0, 0, 1, 1,
-0.3111191, 1.0442, -0.8287803, 0, 0, 0, 1, 1,
-0.3099928, 0.4363629, -1.499729, 0, 0, 0, 1, 1,
-0.3092064, -1.961238, -2.616748, 0, 0, 0, 1, 1,
-0.309169, 0.3475789, -0.9931232, 0, 0, 0, 1, 1,
-0.3089478, 1.252831, -1.075131, 0, 0, 0, 1, 1,
-0.3075395, 0.697567, -0.03738458, 0, 0, 0, 1, 1,
-0.3073758, -0.409767, -3.464077, 1, 1, 1, 1, 1,
-0.3065132, 0.2238522, -0.7756549, 1, 1, 1, 1, 1,
-0.300139, 0.6991952, -1.385656, 1, 1, 1, 1, 1,
-0.2965176, 0.2576338, -0.7210991, 1, 1, 1, 1, 1,
-0.2912714, 0.2680826, -2.707353, 1, 1, 1, 1, 1,
-0.2900042, 1.088961, -1.905829, 1, 1, 1, 1, 1,
-0.2898625, 0.5477217, -1.395255, 1, 1, 1, 1, 1,
-0.289337, -1.460227, -2.552789, 1, 1, 1, 1, 1,
-0.2863358, 0.7989097, -0.2890668, 1, 1, 1, 1, 1,
-0.2820514, -0.06033377, -0.4824404, 1, 1, 1, 1, 1,
-0.2819014, -0.2964587, -1.735193, 1, 1, 1, 1, 1,
-0.2800786, 0.1361255, -1.96071, 1, 1, 1, 1, 1,
-0.276809, 1.785679, 1.722288, 1, 1, 1, 1, 1,
-0.2750726, 1.817669, 0.1258744, 1, 1, 1, 1, 1,
-0.2724736, -0.1701677, -1.353736, 1, 1, 1, 1, 1,
-0.2723587, 0.7101983, -0.4550784, 0, 0, 1, 1, 1,
-0.2689503, -2.137774, -4.185497, 1, 0, 0, 1, 1,
-0.2667638, 0.63055, -0.0657412, 1, 0, 0, 1, 1,
-0.2656481, 0.6944693, -1.080109, 1, 0, 0, 1, 1,
-0.2637977, 0.2115362, -1.136972, 1, 0, 0, 1, 1,
-0.2586914, 0.9219088, -1.272891, 1, 0, 0, 1, 1,
-0.2546333, 1.502066, -0.9030806, 0, 0, 0, 1, 1,
-0.2518389, -2.050399, -3.518549, 0, 0, 0, 1, 1,
-0.2490984, 1.208414, 0.865945, 0, 0, 0, 1, 1,
-0.2475219, -0.1491014, -1.7061, 0, 0, 0, 1, 1,
-0.2451995, -1.558072, -2.883105, 0, 0, 0, 1, 1,
-0.2401327, 1.749734, 0.1656727, 0, 0, 0, 1, 1,
-0.2386663, -0.9487604, -2.087074, 0, 0, 0, 1, 1,
-0.2354854, -0.2012022, -2.856455, 1, 1, 1, 1, 1,
-0.231875, -1.158134, -1.66762, 1, 1, 1, 1, 1,
-0.2317012, 1.605205, -1.01005, 1, 1, 1, 1, 1,
-0.231456, 1.195138, 0.1267786, 1, 1, 1, 1, 1,
-0.2262978, -0.4729044, -1.511935, 1, 1, 1, 1, 1,
-0.2209914, 0.6080753, 0.9015406, 1, 1, 1, 1, 1,
-0.2198931, 0.6958075, -0.1732147, 1, 1, 1, 1, 1,
-0.208906, -1.954285, -1.964065, 1, 1, 1, 1, 1,
-0.208747, 0.9281305, -0.264789, 1, 1, 1, 1, 1,
-0.207291, -0.1380073, -2.257837, 1, 1, 1, 1, 1,
-0.2065641, -0.2240847, -5.304996, 1, 1, 1, 1, 1,
-0.2063991, -0.3832103, -3.751869, 1, 1, 1, 1, 1,
-0.2032915, 1.666899, 0.739616, 1, 1, 1, 1, 1,
-0.2002006, 0.7241899, -0.4513393, 1, 1, 1, 1, 1,
-0.197512, -1.53778, -3.029075, 1, 1, 1, 1, 1,
-0.1894671, -1.023795, -1.413818, 0, 0, 1, 1, 1,
-0.186231, 0.2097535, -1.160724, 1, 0, 0, 1, 1,
-0.1850514, 0.4289559, -2.203429, 1, 0, 0, 1, 1,
-0.182232, 1.425043, -0.6327105, 1, 0, 0, 1, 1,
-0.1807523, -0.2997773, -3.244651, 1, 0, 0, 1, 1,
-0.1782389, -0.8330563, -4.262081, 1, 0, 0, 1, 1,
-0.1741599, -1.491771, -1.766167, 0, 0, 0, 1, 1,
-0.1739878, -0.9073168, -3.160886, 0, 0, 0, 1, 1,
-0.1722952, -1.470331, -3.795139, 0, 0, 0, 1, 1,
-0.1697104, 0.5075419, 0.4469235, 0, 0, 0, 1, 1,
-0.1689011, -0.8353502, -3.366712, 0, 0, 0, 1, 1,
-0.1624861, 0.3883332, -0.109838, 0, 0, 0, 1, 1,
-0.1589432, -0.6366541, -4.495474, 0, 0, 0, 1, 1,
-0.158753, 0.6528932, 0.2493378, 1, 1, 1, 1, 1,
-0.1561343, -0.2035843, -1.78871, 1, 1, 1, 1, 1,
-0.1547048, -1.204531, -2.729606, 1, 1, 1, 1, 1,
-0.1534551, -0.6850369, -2.640661, 1, 1, 1, 1, 1,
-0.1523324, 0.09630552, 0.4280935, 1, 1, 1, 1, 1,
-0.1493362, 0.05268515, -0.5869548, 1, 1, 1, 1, 1,
-0.1490233, -0.5218748, -3.146822, 1, 1, 1, 1, 1,
-0.1409657, 1.40206, 0.7149968, 1, 1, 1, 1, 1,
-0.1396747, -0.1863139, -2.978491, 1, 1, 1, 1, 1,
-0.1363814, 0.1304585, 0.9758304, 1, 1, 1, 1, 1,
-0.1362673, -0.7539887, -3.522009, 1, 1, 1, 1, 1,
-0.1292319, 2.173876, 0.1585583, 1, 1, 1, 1, 1,
-0.1291035, -1.315016, -3.267652, 1, 1, 1, 1, 1,
-0.1261844, 1.169132, -1.294083, 1, 1, 1, 1, 1,
-0.1242198, 1.888394, -0.3782898, 1, 1, 1, 1, 1,
-0.1210707, 0.2788588, 0.7154929, 0, 0, 1, 1, 1,
-0.1208382, -0.8292069, -3.8741, 1, 0, 0, 1, 1,
-0.1202403, 0.009571915, -1.61291, 1, 0, 0, 1, 1,
-0.1192074, 0.9459276, -1.566579, 1, 0, 0, 1, 1,
-0.1153586, -0.9483004, -4.822714, 1, 0, 0, 1, 1,
-0.1152954, 0.5438408, 0.308335, 1, 0, 0, 1, 1,
-0.113408, -1.18368, -3.151723, 0, 0, 0, 1, 1,
-0.1088764, 0.841336, -0.004241384, 0, 0, 0, 1, 1,
-0.1070599, 1.728876, 1.264919, 0, 0, 0, 1, 1,
-0.1051467, -0.1433102, -2.045467, 0, 0, 0, 1, 1,
-0.1037743, -0.9001451, -1.940072, 0, 0, 0, 1, 1,
-0.1027975, 0.910973, -0.3782076, 0, 0, 0, 1, 1,
-0.1012794, -0.210286, -0.3686205, 0, 0, 0, 1, 1,
-0.1009308, 1.58498, -1.283574, 1, 1, 1, 1, 1,
-0.09950725, -0.8451991, -3.474951, 1, 1, 1, 1, 1,
-0.0944512, -1.057758, -3.070316, 1, 1, 1, 1, 1,
-0.09344812, -0.8316629, -3.106382, 1, 1, 1, 1, 1,
-0.09257299, 1.251463, -1.271218, 1, 1, 1, 1, 1,
-0.08659825, -1.260933, -3.836046, 1, 1, 1, 1, 1,
-0.08618468, 1.025386, -1.211565, 1, 1, 1, 1, 1,
-0.08563845, 0.2826806, 0.1418129, 1, 1, 1, 1, 1,
-0.07858768, -1.291908, -2.042258, 1, 1, 1, 1, 1,
-0.07530003, -0.04340181, -3.081863, 1, 1, 1, 1, 1,
-0.07528636, 1.785866, -0.2655777, 1, 1, 1, 1, 1,
-0.07492975, -2.979945, -1.706923, 1, 1, 1, 1, 1,
-0.06656973, -0.6164101, -2.076578, 1, 1, 1, 1, 1,
-0.0665292, 2.511705, 0.205542, 1, 1, 1, 1, 1,
-0.05120931, -0.3485675, -2.67733, 1, 1, 1, 1, 1,
-0.04329638, 0.3195404, -1.046653, 0, 0, 1, 1, 1,
-0.04321983, 1.671829, -1.222018, 1, 0, 0, 1, 1,
-0.04229055, 0.04599502, -0.9026914, 1, 0, 0, 1, 1,
-0.04143806, 0.2296026, 1.483545, 1, 0, 0, 1, 1,
-0.03762947, -0.889735, -2.864566, 1, 0, 0, 1, 1,
-0.03128117, -1.593276, -2.402698, 1, 0, 0, 1, 1,
-0.0265695, 0.1533132, -1.015914, 0, 0, 0, 1, 1,
-0.02517036, 0.09167968, 1.089322, 0, 0, 0, 1, 1,
-0.02179521, -0.1586774, -2.493776, 0, 0, 0, 1, 1,
-0.01912107, 0.04997589, -0.08657742, 0, 0, 0, 1, 1,
-0.01804984, -0.8027783, -2.087587, 0, 0, 0, 1, 1,
-0.01797596, 0.2102409, -1.508717, 0, 0, 0, 1, 1,
-0.01791537, 0.3730036, 1.229161, 0, 0, 0, 1, 1,
-0.01690891, -0.921839, -5.137852, 1, 1, 1, 1, 1,
-0.01629565, -0.7289464, -1.443852, 1, 1, 1, 1, 1,
-0.01562807, -0.3575644, -4.321144, 1, 1, 1, 1, 1,
-0.007065231, -0.5762224, -3.202793, 1, 1, 1, 1, 1,
-0.005150452, -0.585021, -3.942381, 1, 1, 1, 1, 1,
-0.004236731, -0.3930798, -5.038613, 1, 1, 1, 1, 1,
-0.002125489, -0.8303041, -5.349106, 1, 1, 1, 1, 1,
0.0002354788, 1.051106, -0.0553519, 1, 1, 1, 1, 1,
0.008385764, -0.4162802, 3.116145, 1, 1, 1, 1, 1,
0.009017278, 0.4896966, 0.04545295, 1, 1, 1, 1, 1,
0.01410041, 0.8561671, 0.4962963, 1, 1, 1, 1, 1,
0.0237469, 0.09852572, -0.08924499, 1, 1, 1, 1, 1,
0.02707249, 1.105445, 2.639048, 1, 1, 1, 1, 1,
0.02713753, -0.5437535, 3.707987, 1, 1, 1, 1, 1,
0.0285677, -0.9738681, 3.177842, 1, 1, 1, 1, 1,
0.02862167, -2.204245, 2.797452, 0, 0, 1, 1, 1,
0.03045064, -1.914297, 2.72363, 1, 0, 0, 1, 1,
0.03076621, 1.189077, 0.7575427, 1, 0, 0, 1, 1,
0.03171417, -1.585904, 2.355561, 1, 0, 0, 1, 1,
0.0318373, -0.8193899, 2.649752, 1, 0, 0, 1, 1,
0.0327788, -0.3595332, 3.834489, 1, 0, 0, 1, 1,
0.0351956, -0.6206312, 2.233409, 0, 0, 0, 1, 1,
0.03853475, 0.5754674, 1.666924, 0, 0, 0, 1, 1,
0.04093307, 1.63308, 1.237916, 0, 0, 0, 1, 1,
0.04186697, 1.531209, -1.078924, 0, 0, 0, 1, 1,
0.04290554, 0.3664977, 0.7087535, 0, 0, 0, 1, 1,
0.0477875, 0.2033597, -1.511813, 0, 0, 0, 1, 1,
0.05168333, -0.03639493, 2.264758, 0, 0, 0, 1, 1,
0.05199403, -0.585692, 4.011117, 1, 1, 1, 1, 1,
0.05474574, 0.5908728, -1.110943, 1, 1, 1, 1, 1,
0.05864722, 0.2980133, -0.3258372, 1, 1, 1, 1, 1,
0.05976475, 1.379368, 0.2990367, 1, 1, 1, 1, 1,
0.06110118, 0.1447656, 0.2052554, 1, 1, 1, 1, 1,
0.06192984, 0.09582154, 1.549418, 1, 1, 1, 1, 1,
0.0654853, 1.866924, -0.7159454, 1, 1, 1, 1, 1,
0.06871732, -0.3236142, 1.556326, 1, 1, 1, 1, 1,
0.0739264, 0.07302739, 0.8446768, 1, 1, 1, 1, 1,
0.07536975, 0.2368332, 1.775471, 1, 1, 1, 1, 1,
0.07742275, -0.585721, 2.396832, 1, 1, 1, 1, 1,
0.07830479, -1.111327, 3.161139, 1, 1, 1, 1, 1,
0.0828182, -0.8098825, 3.509827, 1, 1, 1, 1, 1,
0.084242, -0.4622127, 3.701172, 1, 1, 1, 1, 1,
0.08667292, -0.7244193, 3.069644, 1, 1, 1, 1, 1,
0.08902615, 0.2303343, -0.4520403, 0, 0, 1, 1, 1,
0.09897053, 0.7689673, 0.9069177, 1, 0, 0, 1, 1,
0.1009477, 0.5928514, 0.1771706, 1, 0, 0, 1, 1,
0.1013299, -0.2662328, 2.323314, 1, 0, 0, 1, 1,
0.1048964, -1.263028, 2.239398, 1, 0, 0, 1, 1,
0.1067058, -1.338175, 2.449147, 1, 0, 0, 1, 1,
0.1088858, -0.6750759, 2.234627, 0, 0, 0, 1, 1,
0.1090686, 0.5757725, 1.127005, 0, 0, 0, 1, 1,
0.1105432, 0.6912225, 1.545317, 0, 0, 0, 1, 1,
0.1110956, 2.744796, 0.3901157, 0, 0, 0, 1, 1,
0.1119284, -0.2566846, 2.036252, 0, 0, 0, 1, 1,
0.116895, 0.5312351, 1.756342, 0, 0, 0, 1, 1,
0.1190131, 1.996366, -2.054816, 0, 0, 0, 1, 1,
0.1200969, 0.2232691, 0.6009128, 1, 1, 1, 1, 1,
0.124078, -1.096306, 4.236341, 1, 1, 1, 1, 1,
0.1279407, -1.517837, 3.883951, 1, 1, 1, 1, 1,
0.134349, 0.249508, 0.7927204, 1, 1, 1, 1, 1,
0.135489, 2.168357, 0.7495025, 1, 1, 1, 1, 1,
0.1365695, 0.52621, -1.086469, 1, 1, 1, 1, 1,
0.1377153, -0.449974, 2.703385, 1, 1, 1, 1, 1,
0.138999, 0.6529651, -1.586071, 1, 1, 1, 1, 1,
0.1393199, -0.9588486, 3.193506, 1, 1, 1, 1, 1,
0.1405942, 1.543071, -1.435068, 1, 1, 1, 1, 1,
0.1409529, 0.3610011, -0.1176331, 1, 1, 1, 1, 1,
0.1423078, 0.7597138, 2.575934, 1, 1, 1, 1, 1,
0.144807, -0.2197446, 2.002816, 1, 1, 1, 1, 1,
0.1524993, 1.858989, 0.2429097, 1, 1, 1, 1, 1,
0.1537059, 0.5829626, -0.7943011, 1, 1, 1, 1, 1,
0.1562561, 1.663248, 1.564747, 0, 0, 1, 1, 1,
0.1573071, -0.8875177, 3.362037, 1, 0, 0, 1, 1,
0.1585359, -1.414255, 3.178651, 1, 0, 0, 1, 1,
0.1589251, -2.0573, 2.962013, 1, 0, 0, 1, 1,
0.1653492, -0.5143627, 3.514812, 1, 0, 0, 1, 1,
0.1693037, 0.7782838, -0.7067454, 1, 0, 0, 1, 1,
0.1717675, -0.9999299, 4.382563, 0, 0, 0, 1, 1,
0.173682, 2.043521, 1.050618, 0, 0, 0, 1, 1,
0.1751358, 0.2082421, 1.501635, 0, 0, 0, 1, 1,
0.1773903, 0.1767886, 0.9047871, 0, 0, 0, 1, 1,
0.1801157, 0.452941, 1.424207, 0, 0, 0, 1, 1,
0.1822049, -0.5235953, 3.646991, 0, 0, 0, 1, 1,
0.1884521, 0.3516208, 0.2224341, 0, 0, 0, 1, 1,
0.1895324, 0.1513717, 1.120343, 1, 1, 1, 1, 1,
0.1910117, -2.421458, 2.922144, 1, 1, 1, 1, 1,
0.1917665, -0.0424076, 2.826189, 1, 1, 1, 1, 1,
0.1938904, -1.549597, 3.20176, 1, 1, 1, 1, 1,
0.2000395, -0.02800866, 1.189372, 1, 1, 1, 1, 1,
0.2089932, 1.320934, -1.044543, 1, 1, 1, 1, 1,
0.2120623, -1.951133, 3.394995, 1, 1, 1, 1, 1,
0.2153286, 0.5652609, -0.6707779, 1, 1, 1, 1, 1,
0.2164805, -2.280992, 2.092371, 1, 1, 1, 1, 1,
0.2178639, 1.505844, 0.5532194, 1, 1, 1, 1, 1,
0.2178695, 1.840442, -1.384095, 1, 1, 1, 1, 1,
0.2202264, 1.100773, 0.5107042, 1, 1, 1, 1, 1,
0.2212096, -0.2730975, 3.178735, 1, 1, 1, 1, 1,
0.2226247, 0.05680326, 1.899534, 1, 1, 1, 1, 1,
0.2261644, 2.013321, 0.8017709, 1, 1, 1, 1, 1,
0.2280518, -2.177258, 3.240963, 0, 0, 1, 1, 1,
0.229763, 1.344887, -0.9226141, 1, 0, 0, 1, 1,
0.2348733, 1.200567, -0.5545627, 1, 0, 0, 1, 1,
0.2379475, -1.08924, 2.507648, 1, 0, 0, 1, 1,
0.2379929, 0.4877059, 2.399333, 1, 0, 0, 1, 1,
0.2415082, 0.2778165, -0.4842055, 1, 0, 0, 1, 1,
0.2425059, -1.436684, 2.922692, 0, 0, 0, 1, 1,
0.2452389, 0.6436315, 2.348561, 0, 0, 0, 1, 1,
0.2468567, -0.7855663, 2.056808, 0, 0, 0, 1, 1,
0.2472768, -0.1260173, 2.017501, 0, 0, 0, 1, 1,
0.2490807, 0.7379963, 2.975709, 0, 0, 0, 1, 1,
0.252888, 2.150101, 2.305075, 0, 0, 0, 1, 1,
0.2562607, 0.8621426, 0.5830645, 0, 0, 0, 1, 1,
0.2565856, 0.8825232, 0.8760481, 1, 1, 1, 1, 1,
0.2568783, -0.5965521, 3.673383, 1, 1, 1, 1, 1,
0.2571935, -0.1410294, 2.354816, 1, 1, 1, 1, 1,
0.258137, 0.9903523, 1.209173, 1, 1, 1, 1, 1,
0.2584657, -1.219989, 2.406349, 1, 1, 1, 1, 1,
0.2650845, -0.7969522, 3.637277, 1, 1, 1, 1, 1,
0.2664497, -1.627259, 3.092364, 1, 1, 1, 1, 1,
0.2728723, -1.939553, 4.913957, 1, 1, 1, 1, 1,
0.273738, -0.4949308, 1.617421, 1, 1, 1, 1, 1,
0.2785765, 0.3294536, 0.1254096, 1, 1, 1, 1, 1,
0.2807796, -0.8347011, 2.727545, 1, 1, 1, 1, 1,
0.2813016, -0.8132544, 1.674068, 1, 1, 1, 1, 1,
0.2837226, 1.63821, -1.040944, 1, 1, 1, 1, 1,
0.2847501, 0.7671177, -0.1257872, 1, 1, 1, 1, 1,
0.2857641, -0.5702468, 3.745887, 1, 1, 1, 1, 1,
0.2899891, -1.412051, 3.909599, 0, 0, 1, 1, 1,
0.2917345, 0.3892199, -1.054503, 1, 0, 0, 1, 1,
0.291983, 0.6084733, -0.8611856, 1, 0, 0, 1, 1,
0.2946966, -0.3427882, 2.932331, 1, 0, 0, 1, 1,
0.3009951, 0.4406452, 0.791025, 1, 0, 0, 1, 1,
0.3035038, -1.655962, 3.786162, 1, 0, 0, 1, 1,
0.3077733, 0.925119, 1.086741, 0, 0, 0, 1, 1,
0.3089763, -0.6594223, 0.7947509, 0, 0, 0, 1, 1,
0.3092619, -0.08438345, 2.596022, 0, 0, 0, 1, 1,
0.3155052, 1.747805, 0.9169081, 0, 0, 0, 1, 1,
0.3168694, -2.154947, 3.15636, 0, 0, 0, 1, 1,
0.3199555, -2.639771, 1.812778, 0, 0, 0, 1, 1,
0.3210853, -0.1347815, 2.111266, 0, 0, 0, 1, 1,
0.322869, -2.293729, 3.644046, 1, 1, 1, 1, 1,
0.3255443, 0.4054385, 1.516333, 1, 1, 1, 1, 1,
0.3264235, -0.3656833, 3.367138, 1, 1, 1, 1, 1,
0.3286822, 1.178696, 0.9606885, 1, 1, 1, 1, 1,
0.3289011, -0.3688058, 4.039396, 1, 1, 1, 1, 1,
0.3318341, -0.08225205, 1.790338, 1, 1, 1, 1, 1,
0.3346458, -0.4659213, 2.306434, 1, 1, 1, 1, 1,
0.3350188, -2.082511, 4.372149, 1, 1, 1, 1, 1,
0.3354455, 2.862076, -2.397123, 1, 1, 1, 1, 1,
0.3388639, -0.06173376, 1.70024, 1, 1, 1, 1, 1,
0.340286, -2.269841, 4.099118, 1, 1, 1, 1, 1,
0.3406742, 0.6002215, 0.19929, 1, 1, 1, 1, 1,
0.3472166, 1.442407, -0.9688519, 1, 1, 1, 1, 1,
0.3653961, -0.7370821, 1.719324, 1, 1, 1, 1, 1,
0.3655752, 1.240107, -0.2749197, 1, 1, 1, 1, 1,
0.3658408, -0.994067, 2.648122, 0, 0, 1, 1, 1,
0.3674129, 1.130847, -1.508979, 1, 0, 0, 1, 1,
0.3743606, 0.7292237, 0.8020699, 1, 0, 0, 1, 1,
0.3749585, 0.3152259, 0.7250805, 1, 0, 0, 1, 1,
0.3753729, 1.037228, 1.692475, 1, 0, 0, 1, 1,
0.3773569, 1.331913, 0.5546368, 1, 0, 0, 1, 1,
0.377887, -0.9634784, 0.9713212, 0, 0, 0, 1, 1,
0.382592, 2.152579, 0.4928617, 0, 0, 0, 1, 1,
0.3841323, 0.9882169, 1.117463, 0, 0, 0, 1, 1,
0.3871271, 0.0365115, -0.1486151, 0, 0, 0, 1, 1,
0.3894982, -2.419728, 3.16633, 0, 0, 0, 1, 1,
0.3912121, -0.604375, 2.742076, 0, 0, 0, 1, 1,
0.3968277, -0.4173748, 2.454144, 0, 0, 0, 1, 1,
0.3970296, -0.9897192, 1.053755, 1, 1, 1, 1, 1,
0.3976455, 1.542642, 0.5791276, 1, 1, 1, 1, 1,
0.3979214, 1.04361, 1.148566, 1, 1, 1, 1, 1,
0.4025994, 0.2106317, 1.726847, 1, 1, 1, 1, 1,
0.4042757, 0.4645336, 1.794796, 1, 1, 1, 1, 1,
0.4048403, 0.03708529, 0.9067679, 1, 1, 1, 1, 1,
0.4064988, 1.277067, 0.3094731, 1, 1, 1, 1, 1,
0.4070307, 1.747376, 0.8742475, 1, 1, 1, 1, 1,
0.4082275, -0.7011986, 1.735607, 1, 1, 1, 1, 1,
0.409749, 1.744452, -0.4264079, 1, 1, 1, 1, 1,
0.4149679, 1.586748, 0.7346392, 1, 1, 1, 1, 1,
0.4173184, 0.9249156, -0.8310971, 1, 1, 1, 1, 1,
0.4264, 1.408635, -0.2849827, 1, 1, 1, 1, 1,
0.4288737, -1.573819, 3.495717, 1, 1, 1, 1, 1,
0.4321786, 0.5489963, -0.3076877, 1, 1, 1, 1, 1,
0.4334681, -2.106024, 3.113437, 0, 0, 1, 1, 1,
0.4345351, 0.3831239, 2.680414, 1, 0, 0, 1, 1,
0.4348863, 0.4947405, 0.3211567, 1, 0, 0, 1, 1,
0.4372596, 1.132235, 0.3696781, 1, 0, 0, 1, 1,
0.444806, 0.1359552, 0.8949317, 1, 0, 0, 1, 1,
0.4448269, 0.3210827, 1.282241, 1, 0, 0, 1, 1,
0.4455546, 2.252136, 0.2613693, 0, 0, 0, 1, 1,
0.4462158, 1.111143, -0.7771702, 0, 0, 0, 1, 1,
0.4489408, -0.3924222, 2.789879, 0, 0, 0, 1, 1,
0.4533172, 1.622695, -0.3386555, 0, 0, 0, 1, 1,
0.4578335, -0.6393269, 3.684041, 0, 0, 0, 1, 1,
0.4627693, 0.8078791, 1.291178, 0, 0, 0, 1, 1,
0.4634074, 0.5134705, 2.744346, 0, 0, 0, 1, 1,
0.4660503, -0.09914103, 4.728902, 1, 1, 1, 1, 1,
0.4668326, -1.034463, 3.19117, 1, 1, 1, 1, 1,
0.4697219, 0.7235299, 0.1396172, 1, 1, 1, 1, 1,
0.4699329, -0.1656415, 3.239026, 1, 1, 1, 1, 1,
0.4711517, 0.80068, 0.1617483, 1, 1, 1, 1, 1,
0.4738152, -1.718163, 3.187598, 1, 1, 1, 1, 1,
0.4756541, 0.05404857, 0.6328322, 1, 1, 1, 1, 1,
0.4775033, -0.0707773, 1.401547, 1, 1, 1, 1, 1,
0.4776891, -0.1348646, 0.9458843, 1, 1, 1, 1, 1,
0.4786734, -0.05475863, 2.287047, 1, 1, 1, 1, 1,
0.4837288, 2.288631, 0.6295733, 1, 1, 1, 1, 1,
0.4845651, -1.458358, 2.063428, 1, 1, 1, 1, 1,
0.4890069, -0.9714509, 2.080688, 1, 1, 1, 1, 1,
0.4936187, 0.5803761, 0.6841577, 1, 1, 1, 1, 1,
0.4936845, 1.12489, -0.4928354, 1, 1, 1, 1, 1,
0.5021226, 0.1838991, 2.191598, 0, 0, 1, 1, 1,
0.5040357, 0.07027397, 4.52363, 1, 0, 0, 1, 1,
0.5045477, 2.670778, 0.6908628, 1, 0, 0, 1, 1,
0.506027, -0.1961954, 3.109396, 1, 0, 0, 1, 1,
0.5061713, 1.18541, 0.6695359, 1, 0, 0, 1, 1,
0.5098497, 0.4686862, 0.09457143, 1, 0, 0, 1, 1,
0.5150827, -0.7857339, 2.370411, 0, 0, 0, 1, 1,
0.5211976, -0.9267864, 2.511528, 0, 0, 0, 1, 1,
0.521453, -1.445251, 3.759434, 0, 0, 0, 1, 1,
0.5244367, -0.7784345, 2.476646, 0, 0, 0, 1, 1,
0.5282997, 0.1291131, 1.469812, 0, 0, 0, 1, 1,
0.5292437, 1.398263, 0.8272271, 0, 0, 0, 1, 1,
0.5396228, -0.4390658, 2.15233, 0, 0, 0, 1, 1,
0.5441328, 0.6648663, 0.4172656, 1, 1, 1, 1, 1,
0.5452893, 0.1686398, 0.1836559, 1, 1, 1, 1, 1,
0.5492359, -1.082094, 2.61058, 1, 1, 1, 1, 1,
0.5535758, -0.8918665, 2.401834, 1, 1, 1, 1, 1,
0.5611004, 0.7409098, -0.5069102, 1, 1, 1, 1, 1,
0.5613061, -0.6648111, 3.517456, 1, 1, 1, 1, 1,
0.5680346, -0.6455553, 0.4841619, 1, 1, 1, 1, 1,
0.5709492, 1.672846, 1.161322, 1, 1, 1, 1, 1,
0.5758284, -1.408253, 4.809771, 1, 1, 1, 1, 1,
0.5780346, -0.2594089, 3.507922, 1, 1, 1, 1, 1,
0.582907, -0.4056541, 1.135165, 1, 1, 1, 1, 1,
0.5831445, -0.1699528, 1.548725, 1, 1, 1, 1, 1,
0.5853602, -0.6623939, 1.859826, 1, 1, 1, 1, 1,
0.5908828, -0.5239713, 2.751041, 1, 1, 1, 1, 1,
0.5922185, 1.965313, 0.7409136, 1, 1, 1, 1, 1,
0.5940422, -2.229957, 3.870309, 0, 0, 1, 1, 1,
0.5997884, -0.2367645, 2.384201, 1, 0, 0, 1, 1,
0.6055537, 1.918663, 0.6790752, 1, 0, 0, 1, 1,
0.6082353, 1.537358, 0.9973802, 1, 0, 0, 1, 1,
0.6088614, -1.065218, 3.313559, 1, 0, 0, 1, 1,
0.6098536, 1.269977, 0.6074952, 1, 0, 0, 1, 1,
0.6110014, -2.086059, 3.947628, 0, 0, 0, 1, 1,
0.6110026, 0.873576, 0.9370776, 0, 0, 0, 1, 1,
0.6203443, 0.1208218, 1.663122, 0, 0, 0, 1, 1,
0.6242754, 0.3733528, 0.6318078, 0, 0, 0, 1, 1,
0.6243961, 0.4325138, 1.517058, 0, 0, 0, 1, 1,
0.6266389, 0.6149759, 1.673243, 0, 0, 0, 1, 1,
0.6279222, 0.2904533, 0.7385167, 0, 0, 0, 1, 1,
0.6319338, 1.572784, 0.5030742, 1, 1, 1, 1, 1,
0.6325866, -1.000742, 2.415258, 1, 1, 1, 1, 1,
0.6370353, -0.4705115, 1.648147, 1, 1, 1, 1, 1,
0.6375181, -1.482729, 0.3909938, 1, 1, 1, 1, 1,
0.6375967, -0.9744831, 2.920329, 1, 1, 1, 1, 1,
0.6380263, -0.1118614, 2.028064, 1, 1, 1, 1, 1,
0.6420243, -0.41388, 0.8769379, 1, 1, 1, 1, 1,
0.642495, -0.08730356, -0.0812734, 1, 1, 1, 1, 1,
0.6434327, 0.4031254, 1.381247, 1, 1, 1, 1, 1,
0.650619, -0.1081848, 1.535298, 1, 1, 1, 1, 1,
0.651605, 0.5495346, -0.9033135, 1, 1, 1, 1, 1,
0.6534813, -0.2940328, 3.425446, 1, 1, 1, 1, 1,
0.6585752, -0.6261416, 2.291308, 1, 1, 1, 1, 1,
0.6638122, 0.2095146, 2.058322, 1, 1, 1, 1, 1,
0.6672835, -0.02468785, 2.356324, 1, 1, 1, 1, 1,
0.6673731, -1.716224, 3.458465, 0, 0, 1, 1, 1,
0.6686447, -0.1617725, 1.141139, 1, 0, 0, 1, 1,
0.6711676, 0.1012505, 3.57832, 1, 0, 0, 1, 1,
0.674123, -0.08525935, 2.535545, 1, 0, 0, 1, 1,
0.6744274, 0.4113417, 1.108411, 1, 0, 0, 1, 1,
0.6751549, 0.2205464, 2.562861, 1, 0, 0, 1, 1,
0.6843575, -0.944675, 1.842031, 0, 0, 0, 1, 1,
0.6947159, -0.5748001, 4.00009, 0, 0, 0, 1, 1,
0.695444, -0.8213386, 2.202269, 0, 0, 0, 1, 1,
0.7007278, -0.5429729, 2.02492, 0, 0, 0, 1, 1,
0.7017683, 0.7599832, 2.349491, 0, 0, 0, 1, 1,
0.7064263, 0.7966073, 0.1457865, 0, 0, 0, 1, 1,
0.7102612, 0.2114047, -0.9426869, 0, 0, 0, 1, 1,
0.7115428, 1.747482, 2.000795, 1, 1, 1, 1, 1,
0.7135831, -0.0597285, 1.09865, 1, 1, 1, 1, 1,
0.7146749, -0.303182, 3.35066, 1, 1, 1, 1, 1,
0.7239485, 0.7715868, 0.2626882, 1, 1, 1, 1, 1,
0.7266976, -0.2967406, 2.423592, 1, 1, 1, 1, 1,
0.7318364, -2.05008, 1.391791, 1, 1, 1, 1, 1,
0.7335058, 0.6490714, 1.113793, 1, 1, 1, 1, 1,
0.7339307, 0.1081258, 1.65696, 1, 1, 1, 1, 1,
0.7408999, -0.2676794, 1.716811, 1, 1, 1, 1, 1,
0.7573213, 0.5804251, 1.48769, 1, 1, 1, 1, 1,
0.7600119, -0.9476123, 3.325163, 1, 1, 1, 1, 1,
0.7606279, 0.9040736, 1.484248, 1, 1, 1, 1, 1,
0.762641, -1.491719, 2.49192, 1, 1, 1, 1, 1,
0.7638292, -2.618128, 2.769861, 1, 1, 1, 1, 1,
0.7654133, 0.3892311, 0.8938792, 1, 1, 1, 1, 1,
0.7661127, -0.1081342, 1.640957, 0, 0, 1, 1, 1,
0.7670277, 1.518147, 1.199007, 1, 0, 0, 1, 1,
0.7685417, 1.174592, 0.8152669, 1, 0, 0, 1, 1,
0.7687669, 0.07752455, 2.132949, 1, 0, 0, 1, 1,
0.7706453, 1.372614, -0.7818692, 1, 0, 0, 1, 1,
0.7744274, -0.1960781, 2.779898, 1, 0, 0, 1, 1,
0.7837644, -1.921164, 2.388306, 0, 0, 0, 1, 1,
0.7892234, 0.8219465, 0.7274492, 0, 0, 0, 1, 1,
0.7952328, -0.8814663, 2.6625, 0, 0, 0, 1, 1,
0.7958931, 3.01791, -0.3085106, 0, 0, 0, 1, 1,
0.7967626, 0.8924938, 2.438647, 0, 0, 0, 1, 1,
0.7969407, 1.015811, -0.8515022, 0, 0, 0, 1, 1,
0.8074406, -1.219562, 2.149285, 0, 0, 0, 1, 1,
0.8082038, -0.9938437, 3.812027, 1, 1, 1, 1, 1,
0.8092185, -1.985017, 2.211364, 1, 1, 1, 1, 1,
0.8092716, -0.06272113, 1.482247, 1, 1, 1, 1, 1,
0.8119962, -1.463684, 3.958143, 1, 1, 1, 1, 1,
0.8133543, 0.3124715, 0.103133, 1, 1, 1, 1, 1,
0.813506, 1.752142, -0.3877808, 1, 1, 1, 1, 1,
0.8143784, 0.6567291, 0.2780891, 1, 1, 1, 1, 1,
0.8197291, -0.1329297, 0.3052758, 1, 1, 1, 1, 1,
0.8236431, 0.8666573, 1.114776, 1, 1, 1, 1, 1,
0.823914, 1.212418, 1.090789, 1, 1, 1, 1, 1,
0.8282995, -0.8706107, 2.259636, 1, 1, 1, 1, 1,
0.8291295, -1.916963, 2.665656, 1, 1, 1, 1, 1,
0.8333293, -0.1612204, 2.819407, 1, 1, 1, 1, 1,
0.8358088, -0.2891725, 1.593663, 1, 1, 1, 1, 1,
0.8384169, 0.2868724, -0.6936149, 1, 1, 1, 1, 1,
0.8433656, 0.8052919, -0.619591, 0, 0, 1, 1, 1,
0.8444636, -0.09994802, 1.226727, 1, 0, 0, 1, 1,
0.8489667, 0.9068435, 0.04522415, 1, 0, 0, 1, 1,
0.8499082, 0.4408087, 1.547695, 1, 0, 0, 1, 1,
0.8583761, 0.8844002, 0.2991636, 1, 0, 0, 1, 1,
0.8637115, -0.9738637, 1.344244, 1, 0, 0, 1, 1,
0.8643429, 0.06536878, 1.438931, 0, 0, 0, 1, 1,
0.8644309, -1.74809, 5.312711, 0, 0, 0, 1, 1,
0.8713643, 1.051823, 0.6220789, 0, 0, 0, 1, 1,
0.8727083, 0.1195925, 2.754179, 0, 0, 0, 1, 1,
0.8751324, -0.592264, 0.9934683, 0, 0, 0, 1, 1,
0.8771176, -0.08963558, 2.149328, 0, 0, 0, 1, 1,
0.8785418, 0.9850751, -1.022784, 0, 0, 0, 1, 1,
0.8845243, 0.1361212, 1.238532, 1, 1, 1, 1, 1,
0.8853477, 1.10223, -0.1730086, 1, 1, 1, 1, 1,
0.892242, 0.07974171, 2.02407, 1, 1, 1, 1, 1,
0.8926218, -2.48407, 2.147971, 1, 1, 1, 1, 1,
0.8928535, -0.5079492, 1.32755, 1, 1, 1, 1, 1,
0.8933047, -0.7083285, 1.16951, 1, 1, 1, 1, 1,
0.8978174, -0.10917, -0.07056011, 1, 1, 1, 1, 1,
0.9003779, 0.6126808, -0.3644311, 1, 1, 1, 1, 1,
0.9037457, -0.4326574, 2.072167, 1, 1, 1, 1, 1,
0.9041794, -0.3194361, 2.400389, 1, 1, 1, 1, 1,
0.9083872, 0.998948, 1.453033, 1, 1, 1, 1, 1,
0.9101859, 0.9464598, 0.1444833, 1, 1, 1, 1, 1,
0.9136665, -0.7945901, 2.146907, 1, 1, 1, 1, 1,
0.9142041, -0.878959, 1.824236, 1, 1, 1, 1, 1,
0.9261769, 1.096446, 1.422241, 1, 1, 1, 1, 1,
0.931776, 2.228451, 0.1102875, 0, 0, 1, 1, 1,
0.9339347, 0.2570232, 2.23351, 1, 0, 0, 1, 1,
0.9347699, 2.077733, 0.11001, 1, 0, 0, 1, 1,
0.9351942, 0.01050967, 1.888069, 1, 0, 0, 1, 1,
0.937427, -0.8510737, 1.438161, 1, 0, 0, 1, 1,
0.9398082, 0.4759903, 1.165284, 1, 0, 0, 1, 1,
0.9420012, 2.721423, 0.4164865, 0, 0, 0, 1, 1,
0.9508633, -0.1432545, 2.794921, 0, 0, 0, 1, 1,
0.9545975, 1.456165, 2.843363, 0, 0, 0, 1, 1,
0.9581232, -0.08868808, 2.766955, 0, 0, 0, 1, 1,
0.9590375, -0.8168828, 4.318854, 0, 0, 0, 1, 1,
0.9641067, -0.2400762, 3.406647, 0, 0, 0, 1, 1,
0.9678168, 1.374949, 1.003402, 0, 0, 0, 1, 1,
0.9683051, -0.1363677, 1.38639, 1, 1, 1, 1, 1,
0.9686315, 0.2230688, 1.51184, 1, 1, 1, 1, 1,
0.9711233, -0.2239239, 0.644116, 1, 1, 1, 1, 1,
0.9795552, -0.5622206, 0.3433056, 1, 1, 1, 1, 1,
0.9842221, 0.2020974, 2.126254, 1, 1, 1, 1, 1,
0.986361, 1.366389, -0.5090666, 1, 1, 1, 1, 1,
0.989155, 0.4336594, 1.636836, 1, 1, 1, 1, 1,
0.9905009, 1.164916, 0.216046, 1, 1, 1, 1, 1,
1.003237, -0.8849808, 3.52268, 1, 1, 1, 1, 1,
1.003255, 0.7496268, 0.4737821, 1, 1, 1, 1, 1,
1.003978, 0.3633173, 0.7325418, 1, 1, 1, 1, 1,
1.006613, -0.4541718, 3.722661, 1, 1, 1, 1, 1,
1.007199, 1.139679, -1.23704, 1, 1, 1, 1, 1,
1.010593, 1.343225, 0.8352276, 1, 1, 1, 1, 1,
1.013062, -0.3366944, 1.641702, 1, 1, 1, 1, 1,
1.016474, -0.06319961, 1.403696, 0, 0, 1, 1, 1,
1.027749, -1.685084, 3.264229, 1, 0, 0, 1, 1,
1.032588, -1.312113, 0.9408434, 1, 0, 0, 1, 1,
1.038836, 0.4631611, 0.627911, 1, 0, 0, 1, 1,
1.041285, 1.120666, -0.3478735, 1, 0, 0, 1, 1,
1.048413, -0.5529983, 1.224592, 1, 0, 0, 1, 1,
1.052476, -0.3326802, 1.31556, 0, 0, 0, 1, 1,
1.056233, -0.03528666, 1.403564, 0, 0, 0, 1, 1,
1.059548, -0.03169154, 2.465525, 0, 0, 0, 1, 1,
1.059652, 0.1997261, 1.943673, 0, 0, 0, 1, 1,
1.060269, 0.3465119, 1.872683, 0, 0, 0, 1, 1,
1.065537, 0.6269453, 1.211433, 0, 0, 0, 1, 1,
1.065639, -0.6173189, 3.312281, 0, 0, 0, 1, 1,
1.083605, -0.2507299, 0.9114081, 1, 1, 1, 1, 1,
1.08684, -1.402585, 3.132521, 1, 1, 1, 1, 1,
1.088676, 0.3717407, 2.041391, 1, 1, 1, 1, 1,
1.090988, -0.4566085, 1.026963, 1, 1, 1, 1, 1,
1.095704, -0.1082098, 1.928755, 1, 1, 1, 1, 1,
1.099206, -0.7964436, 3.457583, 1, 1, 1, 1, 1,
1.104953, 0.4341084, 0.8195536, 1, 1, 1, 1, 1,
1.107232, -1.682088, 2.538237, 1, 1, 1, 1, 1,
1.107756, 1.334269, -1.29894, 1, 1, 1, 1, 1,
1.113599, -0.3723052, 1.946768, 1, 1, 1, 1, 1,
1.115482, 0.2930995, 1.548146, 1, 1, 1, 1, 1,
1.121939, -0.9044648, 2.102151, 1, 1, 1, 1, 1,
1.127272, -1.621485, 2.473888, 1, 1, 1, 1, 1,
1.127311, -0.4603854, 2.345929, 1, 1, 1, 1, 1,
1.135387, -0.6226934, 1.861825, 1, 1, 1, 1, 1,
1.141141, 0.3806948, 1.877295, 0, 0, 1, 1, 1,
1.14629, 0.3247163, 1.219684, 1, 0, 0, 1, 1,
1.157052, -0.07858838, 2.025474, 1, 0, 0, 1, 1,
1.159006, -0.2519684, 1.344522, 1, 0, 0, 1, 1,
1.159694, 0.5356327, 0.3558002, 1, 0, 0, 1, 1,
1.162143, -1.499611, 2.412043, 1, 0, 0, 1, 1,
1.162651, 1.046709, 0.5564836, 0, 0, 0, 1, 1,
1.164727, 0.8126577, 2.342994, 0, 0, 0, 1, 1,
1.168359, 0.3334202, 0.7310435, 0, 0, 0, 1, 1,
1.170214, -0.3976033, 3.128165, 0, 0, 0, 1, 1,
1.17546, -0.6816586, 0.6348066, 0, 0, 0, 1, 1,
1.194578, -0.1582735, 0.8225641, 0, 0, 0, 1, 1,
1.19485, 0.240891, 1.461617, 0, 0, 0, 1, 1,
1.195151, -1.744165, 2.558069, 1, 1, 1, 1, 1,
1.203236, -0.07193357, 1.942533, 1, 1, 1, 1, 1,
1.208193, 0.08278593, 1.771807, 1, 1, 1, 1, 1,
1.215032, 0.7540084, 0.8974752, 1, 1, 1, 1, 1,
1.22217, 1.404208, -0.9814205, 1, 1, 1, 1, 1,
1.223128, -0.5326066, 1.352386, 1, 1, 1, 1, 1,
1.225549, -1.404886, 1.321007, 1, 1, 1, 1, 1,
1.236287, 0.005181607, 1.437352, 1, 1, 1, 1, 1,
1.238996, -0.7131531, 2.486866, 1, 1, 1, 1, 1,
1.243447, 0.6813743, 0.7549515, 1, 1, 1, 1, 1,
1.24498, -0.02980972, 1.61464, 1, 1, 1, 1, 1,
1.249837, 1.066802, 0.639522, 1, 1, 1, 1, 1,
1.253919, 0.3831445, 1.995675, 1, 1, 1, 1, 1,
1.255406, -0.7241803, 3.102412, 1, 1, 1, 1, 1,
1.256139, 0.6216666, 0.4642375, 1, 1, 1, 1, 1,
1.257143, -1.499848, 1.673027, 0, 0, 1, 1, 1,
1.25955, -0.6770682, 1.718672, 1, 0, 0, 1, 1,
1.263791, -0.02006128, 3.030897, 1, 0, 0, 1, 1,
1.267524, 1.50018, 0.7375938, 1, 0, 0, 1, 1,
1.272135, 0.03712116, 2.179477, 1, 0, 0, 1, 1,
1.272411, 1.279172, 0.1697512, 1, 0, 0, 1, 1,
1.273983, 0.5231963, 0.09077646, 0, 0, 0, 1, 1,
1.274267, -0.8782766, 1.355093, 0, 0, 0, 1, 1,
1.288437, -0.09390962, 2.807433, 0, 0, 0, 1, 1,
1.29415, -0.465208, 2.78448, 0, 0, 0, 1, 1,
1.299651, 0.0997196, 1.17521, 0, 0, 0, 1, 1,
1.30442, 0.8019258, 1.154246, 0, 0, 0, 1, 1,
1.305272, 1.365199, 1.262386, 0, 0, 0, 1, 1,
1.310989, 0.498413, -0.283796, 1, 1, 1, 1, 1,
1.316509, 1.378524, 0.5256718, 1, 1, 1, 1, 1,
1.318682, -0.1880232, 1.066496, 1, 1, 1, 1, 1,
1.318847, -0.2457347, 1.547217, 1, 1, 1, 1, 1,
1.327909, -0.2612585, 3.229163, 1, 1, 1, 1, 1,
1.328562, 0.591566, 2.167472, 1, 1, 1, 1, 1,
1.335128, -0.871237, 2.401613, 1, 1, 1, 1, 1,
1.341357, 2.506741, 0.7701495, 1, 1, 1, 1, 1,
1.35328, 0.9545256, 1.463553, 1, 1, 1, 1, 1,
1.35499, 1.016291, 0.3916694, 1, 1, 1, 1, 1,
1.355013, -0.5885682, 2.338684, 1, 1, 1, 1, 1,
1.367056, 0.135859, 0.5566318, 1, 1, 1, 1, 1,
1.373872, 0.5115917, 1.95936, 1, 1, 1, 1, 1,
1.379763, 0.2664629, 1.950778, 1, 1, 1, 1, 1,
1.385509, 0.9078661, 1.490134, 1, 1, 1, 1, 1,
1.386048, 0.4879143, 1.807406, 0, 0, 1, 1, 1,
1.39318, 1.057619, 0.9685467, 1, 0, 0, 1, 1,
1.406216, 1.396606, -0.6439501, 1, 0, 0, 1, 1,
1.408454, 0.2628921, 0.9887713, 1, 0, 0, 1, 1,
1.40955, 0.6888923, 0.2276162, 1, 0, 0, 1, 1,
1.411574, 0.8712505, 2.030226, 1, 0, 0, 1, 1,
1.417441, -0.4930983, 2.571614, 0, 0, 0, 1, 1,
1.424037, 1.577488, 1.021829, 0, 0, 0, 1, 1,
1.439806, -0.3261127, 0.8336464, 0, 0, 0, 1, 1,
1.468051, 1.070139, 1.79739, 0, 0, 0, 1, 1,
1.480541, 1.06933, 1.946949, 0, 0, 0, 1, 1,
1.490493, 1.271229, 0.904109, 0, 0, 0, 1, 1,
1.508554, -0.2414999, 3.285247, 0, 0, 0, 1, 1,
1.518332, -0.3185149, 1.962343, 1, 1, 1, 1, 1,
1.519064, -0.1854628, 1.847946, 1, 1, 1, 1, 1,
1.524035, -0.3289259, 2.471637, 1, 1, 1, 1, 1,
1.52456, -1.208766, 2.846177, 1, 1, 1, 1, 1,
1.527268, -0.3333934, 0.7963605, 1, 1, 1, 1, 1,
1.53256, -0.1477626, 2.740076, 1, 1, 1, 1, 1,
1.544168, -0.4872985, 2.939338, 1, 1, 1, 1, 1,
1.547187, 0.989591, 3.731879, 1, 1, 1, 1, 1,
1.550373, 1.601162, -0.375444, 1, 1, 1, 1, 1,
1.550753, -0.8185362, 2.562607, 1, 1, 1, 1, 1,
1.572531, 0.1567833, 1.480667, 1, 1, 1, 1, 1,
1.573045, -0.1568301, 1.551697, 1, 1, 1, 1, 1,
1.60804, 0.7300351, 2.434009, 1, 1, 1, 1, 1,
1.612111, -0.3368969, 1.485988, 1, 1, 1, 1, 1,
1.629359, 1.221004, 2.323501, 1, 1, 1, 1, 1,
1.633288, -0.7693, 3.890872, 0, 0, 1, 1, 1,
1.634798, -0.5030351, 2.194695, 1, 0, 0, 1, 1,
1.638537, -0.2748654, 0.9296052, 1, 0, 0, 1, 1,
1.641002, 0.5725408, -0.1438721, 1, 0, 0, 1, 1,
1.643258, 0.07478393, 2.499954, 1, 0, 0, 1, 1,
1.675432, 0.1283184, 2.315856, 1, 0, 0, 1, 1,
1.676352, 0.8173723, 2.663844, 0, 0, 0, 1, 1,
1.681304, 2.910961, -2.354855, 0, 0, 0, 1, 1,
1.685188, 1.501329, -0.5909796, 0, 0, 0, 1, 1,
1.696019, -0.4423336, 1.579238, 0, 0, 0, 1, 1,
1.711904, 0.3036265, 2.006295, 0, 0, 0, 1, 1,
1.717516, -0.1426762, 1.902393, 0, 0, 0, 1, 1,
1.72302, 0.3518961, 1.465029, 0, 0, 0, 1, 1,
1.725377, -0.5726126, 0.07449154, 1, 1, 1, 1, 1,
1.733029, 0.7368232, 1.2954, 1, 1, 1, 1, 1,
1.764034, 1.324598, -0.9845471, 1, 1, 1, 1, 1,
1.784742, -0.00976313, 1.751514, 1, 1, 1, 1, 1,
1.818051, -1.184658, 4.463156, 1, 1, 1, 1, 1,
1.833688, -0.1438981, 2.096002, 1, 1, 1, 1, 1,
1.838873, 1.673443, 1.523081, 1, 1, 1, 1, 1,
1.878412, -0.8742474, 1.212981, 1, 1, 1, 1, 1,
1.883052, 2.243312, 0.3047725, 1, 1, 1, 1, 1,
1.888255, 0.23427, 1.457892, 1, 1, 1, 1, 1,
1.889832, 1.056597, 0.4677924, 1, 1, 1, 1, 1,
1.889991, -1.948937, 1.545925, 1, 1, 1, 1, 1,
1.899052, 0.8945999, -0.6998909, 1, 1, 1, 1, 1,
1.932651, -3.133335, 3.493541, 1, 1, 1, 1, 1,
1.935301, 0.7394903, 1.932289, 1, 1, 1, 1, 1,
1.943514, -0.2670293, 1.844023, 0, 0, 1, 1, 1,
1.944119, 0.4754672, 2.943312, 1, 0, 0, 1, 1,
1.973386, 0.4756295, 2.785725, 1, 0, 0, 1, 1,
2.026484, 0.2194449, 2.447985, 1, 0, 0, 1, 1,
2.062368, -0.5745548, -0.790109, 1, 0, 0, 1, 1,
2.071298, -0.8840871, 3.310236, 1, 0, 0, 1, 1,
2.092964, -0.6834969, 2.399918, 0, 0, 0, 1, 1,
2.120115, -0.2170716, 2.966843, 0, 0, 0, 1, 1,
2.121274, -0.2901886, 1.022419, 0, 0, 0, 1, 1,
2.205303, 0.588013, 3.04732, 0, 0, 0, 1, 1,
2.255821, -0.0376452, 2.47665, 0, 0, 0, 1, 1,
2.274822, 0.9828264, 2.058056, 0, 0, 0, 1, 1,
2.309408, -0.5966538, 1.189807, 0, 0, 0, 1, 1,
2.395031, -0.1702785, 2.06918, 1, 1, 1, 1, 1,
2.403463, 0.3999428, 2.813037, 1, 1, 1, 1, 1,
2.44857, 0.1327024, 0.5804823, 1, 1, 1, 1, 1,
2.463007, -1.908889, 2.083639, 1, 1, 1, 1, 1,
2.609786, -2.278848, 1.972159, 1, 1, 1, 1, 1,
2.749701, -0.7730328, 2.694686, 1, 1, 1, 1, 1,
3.328839, -0.0102161, -0.02404469, 1, 1, 1, 1, 1
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
var radius = 9.539286;
var distance = 33.50634;
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
mvMatrix.translate( -0.05813408, 0.0241251, 0.01819754 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.50634);
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
