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
-2.800481, 0.8260728, -0.04779416, 1, 0, 0, 1,
-2.598572, 0.7704594, -1.419697, 1, 0.007843138, 0, 1,
-2.573813, 0.5979086, 0.3256176, 1, 0.01176471, 0, 1,
-2.482264, 1.797613, 0.4642501, 1, 0.01960784, 0, 1,
-2.425139, -1.924881, -3.167887, 1, 0.02352941, 0, 1,
-2.385623, -0.7294633, -2.404154, 1, 0.03137255, 0, 1,
-2.344953, 0.2206479, -1.016997, 1, 0.03529412, 0, 1,
-2.294498, -0.4050271, -3.038758, 1, 0.04313726, 0, 1,
-2.215453, 0.9733363, -0.2422226, 1, 0.04705882, 0, 1,
-2.198071, 0.8469334, -0.777716, 1, 0.05490196, 0, 1,
-2.165429, -0.6633339, -0.4638691, 1, 0.05882353, 0, 1,
-2.152345, -0.3930631, -2.134161, 1, 0.06666667, 0, 1,
-2.077393, -0.7776951, -3.151334, 1, 0.07058824, 0, 1,
-2.074823, -0.7592265, -3.477446, 1, 0.07843138, 0, 1,
-2.067038, 0.3294949, -0.04876858, 1, 0.08235294, 0, 1,
-2.049577, 1.664447, -0.2784843, 1, 0.09019608, 0, 1,
-2.044741, -0.9109556, -2.029017, 1, 0.09411765, 0, 1,
-1.957052, 0.5384859, 0.6861246, 1, 0.1019608, 0, 1,
-1.91489, 0.745752, -2.710428, 1, 0.1098039, 0, 1,
-1.905479, 0.8462557, -0.2415521, 1, 0.1137255, 0, 1,
-1.895605, -1.012728, -0.6358832, 1, 0.1215686, 0, 1,
-1.88121, 0.2210728, -1.927698, 1, 0.1254902, 0, 1,
-1.859425, 1.294374, -0.4623139, 1, 0.1333333, 0, 1,
-1.850052, -0.1315074, -1.227665, 1, 0.1372549, 0, 1,
-1.843673, -2.352315, -3.34673, 1, 0.145098, 0, 1,
-1.842867, 1.835868, -0.7385691, 1, 0.1490196, 0, 1,
-1.837127, -0.9708458, -0.7479974, 1, 0.1568628, 0, 1,
-1.835848, -2.129488, -0.6814241, 1, 0.1607843, 0, 1,
-1.829148, -0.9076259, -3.035438, 1, 0.1686275, 0, 1,
-1.814711, 1.189651, 1.289984, 1, 0.172549, 0, 1,
-1.803061, -0.296074, -2.352087, 1, 0.1803922, 0, 1,
-1.796328, 0.1884979, -1.651028, 1, 0.1843137, 0, 1,
-1.796316, -0.6643213, -0.8908818, 1, 0.1921569, 0, 1,
-1.794843, 0.09520755, 0.02726275, 1, 0.1960784, 0, 1,
-1.77729, -1.307274, -2.429103, 1, 0.2039216, 0, 1,
-1.770301, -1.000668, -2.41012, 1, 0.2117647, 0, 1,
-1.759981, -2.526134, -1.423725, 1, 0.2156863, 0, 1,
-1.755408, 0.6853443, -1.999074, 1, 0.2235294, 0, 1,
-1.748663, 1.00314, 0.2727094, 1, 0.227451, 0, 1,
-1.737022, -1.6475, -4.029761, 1, 0.2352941, 0, 1,
-1.727251, 0.6378343, -2.457179, 1, 0.2392157, 0, 1,
-1.717653, 0.2169506, -0.9858729, 1, 0.2470588, 0, 1,
-1.710524, -1.340774, -1.370264, 1, 0.2509804, 0, 1,
-1.69218, 1.253518, -1.069976, 1, 0.2588235, 0, 1,
-1.689231, 0.8881537, -0.9558419, 1, 0.2627451, 0, 1,
-1.684005, 0.9490096, -1.398287, 1, 0.2705882, 0, 1,
-1.681334, 0.2405207, 0.8437292, 1, 0.2745098, 0, 1,
-1.670556, 0.4682975, -2.695549, 1, 0.282353, 0, 1,
-1.660146, 0.3410726, -2.878399, 1, 0.2862745, 0, 1,
-1.655094, 0.5822273, -0.9218, 1, 0.2941177, 0, 1,
-1.652234, 0.1323136, -3.217691, 1, 0.3019608, 0, 1,
-1.647484, 0.9572702, -1.078249, 1, 0.3058824, 0, 1,
-1.643814, -0.08907352, -2.005673, 1, 0.3137255, 0, 1,
-1.629804, 0.5463602, 0.2103531, 1, 0.3176471, 0, 1,
-1.621882, -0.2739941, -1.052683, 1, 0.3254902, 0, 1,
-1.621333, -0.6179938, 0.06567274, 1, 0.3294118, 0, 1,
-1.620596, 1.7377, -1.06087, 1, 0.3372549, 0, 1,
-1.619201, -0.1756741, -2.618752, 1, 0.3411765, 0, 1,
-1.601168, 1.164102, 0.4492022, 1, 0.3490196, 0, 1,
-1.59199, 0.5120423, -0.6214087, 1, 0.3529412, 0, 1,
-1.583956, 1.752908, -0.454537, 1, 0.3607843, 0, 1,
-1.583458, -1.278929, -2.760479, 1, 0.3647059, 0, 1,
-1.582356, 0.5208695, 0.4494886, 1, 0.372549, 0, 1,
-1.58057, 0.03855497, -0.6768495, 1, 0.3764706, 0, 1,
-1.578194, -1.285793, -3.309023, 1, 0.3843137, 0, 1,
-1.569254, 0.5122315, -2.543086, 1, 0.3882353, 0, 1,
-1.563587, -1.11183, -1.324269, 1, 0.3960784, 0, 1,
-1.563216, -1.42259, -2.969317, 1, 0.4039216, 0, 1,
-1.556437, -1.572739, -2.871464, 1, 0.4078431, 0, 1,
-1.545474, 0.2954169, -3.285458, 1, 0.4156863, 0, 1,
-1.544819, -2.452945, -2.226509, 1, 0.4196078, 0, 1,
-1.528159, 1.357625, -0.08824468, 1, 0.427451, 0, 1,
-1.519631, -0.8070639, -1.93554, 1, 0.4313726, 0, 1,
-1.514355, -1.997516, -0.9785266, 1, 0.4392157, 0, 1,
-1.502302, 0.265387, 0.3332264, 1, 0.4431373, 0, 1,
-1.499013, 0.5060586, -1.509899, 1, 0.4509804, 0, 1,
-1.488577, -0.02588088, -1.958581, 1, 0.454902, 0, 1,
-1.478895, -0.2392014, -2.093845, 1, 0.4627451, 0, 1,
-1.478267, -0.2623433, -1.290539, 1, 0.4666667, 0, 1,
-1.474095, -1.311294, -2.95217, 1, 0.4745098, 0, 1,
-1.47397, -0.2762838, -2.960265, 1, 0.4784314, 0, 1,
-1.468358, 1.462316, -1.701565, 1, 0.4862745, 0, 1,
-1.467663, 0.0689792, -1.698224, 1, 0.4901961, 0, 1,
-1.454611, 2.148031, -2.072065, 1, 0.4980392, 0, 1,
-1.450938, 0.3082872, -2.51511, 1, 0.5058824, 0, 1,
-1.448706, 0.8228524, -1.456012, 1, 0.509804, 0, 1,
-1.438019, 0.2191827, -2.195612, 1, 0.5176471, 0, 1,
-1.400796, -2.367221, -2.38742, 1, 0.5215687, 0, 1,
-1.39725, 0.1493167, -0.8184212, 1, 0.5294118, 0, 1,
-1.393511, 0.198149, -1.324686, 1, 0.5333334, 0, 1,
-1.378535, 0.2375423, -1.928921, 1, 0.5411765, 0, 1,
-1.359657, 0.6333342, 0.3206742, 1, 0.5450981, 0, 1,
-1.358012, 1.071104, -2.740114, 1, 0.5529412, 0, 1,
-1.356917, -1.11672, -1.77487, 1, 0.5568628, 0, 1,
-1.339648, -0.1864278, -3.018938, 1, 0.5647059, 0, 1,
-1.33343, 1.209882, -0.07161427, 1, 0.5686275, 0, 1,
-1.331226, -0.1585248, -0.4292507, 1, 0.5764706, 0, 1,
-1.330275, 1.161307, -0.03233684, 1, 0.5803922, 0, 1,
-1.329004, -0.731904, -2.195936, 1, 0.5882353, 0, 1,
-1.315393, 0.1358642, -2.327891, 1, 0.5921569, 0, 1,
-1.311117, 1.348886, -0.8004997, 1, 0.6, 0, 1,
-1.285624, 0.5068069, -1.018347, 1, 0.6078432, 0, 1,
-1.282929, -0.2820502, -3.153609, 1, 0.6117647, 0, 1,
-1.26472, -0.7422541, -1.297009, 1, 0.6196079, 0, 1,
-1.262222, -0.5641281, -3.342156, 1, 0.6235294, 0, 1,
-1.255576, 0.8868061, -0.176963, 1, 0.6313726, 0, 1,
-1.247526, 0.5091329, -1.596345, 1, 0.6352941, 0, 1,
-1.24525, 0.02741543, -2.580459, 1, 0.6431373, 0, 1,
-1.240236, -0.2991713, -3.005875, 1, 0.6470588, 0, 1,
-1.238813, 0.319908, 0.09620266, 1, 0.654902, 0, 1,
-1.232681, -1.197185, -2.806651, 1, 0.6588235, 0, 1,
-1.229976, 0.254665, -1.467898, 1, 0.6666667, 0, 1,
-1.226933, -0.4649179, -2.456952, 1, 0.6705883, 0, 1,
-1.223519, 1.22668, -0.2730332, 1, 0.6784314, 0, 1,
-1.222489, -1.808969, -0.5382618, 1, 0.682353, 0, 1,
-1.219797, 0.2087029, -2.756112, 1, 0.6901961, 0, 1,
-1.216846, 0.6701688, -1.383327, 1, 0.6941177, 0, 1,
-1.216228, -1.264747, -0.3311903, 1, 0.7019608, 0, 1,
-1.209521, 0.6738037, -0.2737243, 1, 0.7098039, 0, 1,
-1.206245, 0.7524365, 0.2887677, 1, 0.7137255, 0, 1,
-1.196907, 0.8406187, -0.6463221, 1, 0.7215686, 0, 1,
-1.194462, 0.3821906, -0.5343255, 1, 0.7254902, 0, 1,
-1.188751, -0.3646815, -2.578212, 1, 0.7333333, 0, 1,
-1.181641, 0.8632886, -0.98521, 1, 0.7372549, 0, 1,
-1.177906, 0.4580658, -1.029523, 1, 0.7450981, 0, 1,
-1.174409, -3.05467, -3.677687, 1, 0.7490196, 0, 1,
-1.165848, -0.8617036, -3.726292, 1, 0.7568628, 0, 1,
-1.157224, -0.6318027, -2.256634, 1, 0.7607843, 0, 1,
-1.155468, 2.062356, 0.716674, 1, 0.7686275, 0, 1,
-1.153986, 0.9106101, -0.3907313, 1, 0.772549, 0, 1,
-1.143792, -0.358269, -1.456194, 1, 0.7803922, 0, 1,
-1.136331, 0.2907662, -0.840412, 1, 0.7843137, 0, 1,
-1.132156, -0.5264378, -1.963881, 1, 0.7921569, 0, 1,
-1.131434, -0.08135855, -0.7628626, 1, 0.7960784, 0, 1,
-1.130513, -1.886647, -4.010683, 1, 0.8039216, 0, 1,
-1.113942, -0.46453, -0.6041775, 1, 0.8117647, 0, 1,
-1.102645, -1.070186, -5.17936, 1, 0.8156863, 0, 1,
-1.100106, -0.6510921, -0.7358665, 1, 0.8235294, 0, 1,
-1.097611, -0.703871, -1.77775, 1, 0.827451, 0, 1,
-1.09401, 0.5740884, 0.0164378, 1, 0.8352941, 0, 1,
-1.092992, -1.879674, -2.511608, 1, 0.8392157, 0, 1,
-1.089734, -0.749848, -1.314201, 1, 0.8470588, 0, 1,
-1.088906, 0.1789164, -0.9660941, 1, 0.8509804, 0, 1,
-1.080633, -1.260695, -4.108232, 1, 0.8588235, 0, 1,
-1.079586, 0.6493633, 0.1389292, 1, 0.8627451, 0, 1,
-1.066415, 0.6960079, -0.3363769, 1, 0.8705882, 0, 1,
-1.065814, 0.738225, 0.01002793, 1, 0.8745098, 0, 1,
-1.060008, 1.535492, -1.636177, 1, 0.8823529, 0, 1,
-1.05726, 1.870364, -1.094389, 1, 0.8862745, 0, 1,
-1.044136, -0.8018412, -2.550776, 1, 0.8941177, 0, 1,
-1.041012, 2.581573, -0.6002452, 1, 0.8980392, 0, 1,
-1.036681, -0.2283239, -1.059182, 1, 0.9058824, 0, 1,
-1.035016, 0.4948419, -1.07977, 1, 0.9137255, 0, 1,
-1.027187, -0.2813589, -3.336523, 1, 0.9176471, 0, 1,
-1.024345, 0.2011129, -0.6407993, 1, 0.9254902, 0, 1,
-1.021746, 0.1895126, -1.28621, 1, 0.9294118, 0, 1,
-1.018835, -1.621711, -3.011403, 1, 0.9372549, 0, 1,
-1.014492, -0.6643605, -2.481874, 1, 0.9411765, 0, 1,
-1.0112, -0.6457576, -2.926067, 1, 0.9490196, 0, 1,
-1.003606, -0.7526649, -2.609726, 1, 0.9529412, 0, 1,
-1.000863, 1.636973, -0.1522526, 1, 0.9607843, 0, 1,
-0.9980435, -2.186201, -2.794394, 1, 0.9647059, 0, 1,
-0.9943082, -0.236934, -1.927598, 1, 0.972549, 0, 1,
-0.9921522, 0.2762233, -2.792237, 1, 0.9764706, 0, 1,
-0.9849092, 0.217846, -2.428919, 1, 0.9843137, 0, 1,
-0.976221, 1.540481, -0.1013271, 1, 0.9882353, 0, 1,
-0.9694958, -0.002681014, -2.850625, 1, 0.9960784, 0, 1,
-0.9616627, 0.3840123, 0.1093015, 0.9960784, 1, 0, 1,
-0.9571258, 0.4118591, -2.194852, 0.9921569, 1, 0, 1,
-0.9523622, -0.8064329, -3.908126, 0.9843137, 1, 0, 1,
-0.9504354, 0.1002221, -1.551644, 0.9803922, 1, 0, 1,
-0.9464109, -1.653887, -2.409414, 0.972549, 1, 0, 1,
-0.9440838, 2.196245, -1.450657, 0.9686275, 1, 0, 1,
-0.9421195, 0.495932, 0.8292283, 0.9607843, 1, 0, 1,
-0.9321979, -1.943932, -2.739757, 0.9568627, 1, 0, 1,
-0.9264975, -0.4373949, -0.7742373, 0.9490196, 1, 0, 1,
-0.9248314, -0.2660631, -2.351083, 0.945098, 1, 0, 1,
-0.9225434, 1.18751, -2.516963, 0.9372549, 1, 0, 1,
-0.9200895, -0.7643239, -0.6332998, 0.9333333, 1, 0, 1,
-0.9063591, 0.3701538, -0.726449, 0.9254902, 1, 0, 1,
-0.9059792, 1.133617, 1.029401, 0.9215686, 1, 0, 1,
-0.9008253, 0.09782077, -2.424841, 0.9137255, 1, 0, 1,
-0.9001933, -2.607773, -1.887779, 0.9098039, 1, 0, 1,
-0.8850279, -0.2087582, -2.995602, 0.9019608, 1, 0, 1,
-0.8835822, -0.9094329, -3.503791, 0.8941177, 1, 0, 1,
-0.8797255, 0.4432883, -0.6457052, 0.8901961, 1, 0, 1,
-0.8764763, 0.8372477, -1.098789, 0.8823529, 1, 0, 1,
-0.8728195, -0.8719727, -2.765548, 0.8784314, 1, 0, 1,
-0.8618857, 0.1196139, -3.0469, 0.8705882, 1, 0, 1,
-0.8616678, -0.7251769, -2.927252, 0.8666667, 1, 0, 1,
-0.8538049, 0.1594122, -2.206081, 0.8588235, 1, 0, 1,
-0.8395471, -0.7777648, -2.541789, 0.854902, 1, 0, 1,
-0.8389378, 0.08661544, -0.795976, 0.8470588, 1, 0, 1,
-0.8384075, 1.02957, -2.425776, 0.8431373, 1, 0, 1,
-0.829045, -0.3584465, -3.972266, 0.8352941, 1, 0, 1,
-0.8264315, -1.782187, -1.815009, 0.8313726, 1, 0, 1,
-0.8221048, -1.380848, -2.369533, 0.8235294, 1, 0, 1,
-0.8213617, -0.9975768, -2.923776, 0.8196079, 1, 0, 1,
-0.8166855, -0.3684511, -1.741096, 0.8117647, 1, 0, 1,
-0.8115445, 0.7882829, -0.4461198, 0.8078431, 1, 0, 1,
-0.8108359, 0.3535271, 0.9501558, 0.8, 1, 0, 1,
-0.8056692, -1.223652, -2.727244, 0.7921569, 1, 0, 1,
-0.805034, -1.513082, -2.960939, 0.7882353, 1, 0, 1,
-0.8004975, 0.2131684, -0.8697959, 0.7803922, 1, 0, 1,
-0.7998674, -1.563827, -2.95709, 0.7764706, 1, 0, 1,
-0.7944155, -0.7800617, -2.436337, 0.7686275, 1, 0, 1,
-0.7892622, 0.9493672, -0.2805581, 0.7647059, 1, 0, 1,
-0.786244, -1.368644, -3.880244, 0.7568628, 1, 0, 1,
-0.783563, -0.7888339, -1.629821, 0.7529412, 1, 0, 1,
-0.7806734, -1.590919, -2.363487, 0.7450981, 1, 0, 1,
-0.7800289, 0.3543101, 0.5428542, 0.7411765, 1, 0, 1,
-0.7789931, -0.4204998, -2.003134, 0.7333333, 1, 0, 1,
-0.7745767, 1.835431, 0.04461831, 0.7294118, 1, 0, 1,
-0.7632242, 1.099371, -0.9645085, 0.7215686, 1, 0, 1,
-0.7628529, 0.1072349, -2.488436, 0.7176471, 1, 0, 1,
-0.7588968, 0.5637363, 0.5786211, 0.7098039, 1, 0, 1,
-0.7513644, 0.7037242, 0.4793266, 0.7058824, 1, 0, 1,
-0.7508909, -1.548135, -3.046189, 0.6980392, 1, 0, 1,
-0.7485168, -1.384888, -3.277063, 0.6901961, 1, 0, 1,
-0.745721, -0.3015093, -1.306008, 0.6862745, 1, 0, 1,
-0.7456577, -2.232883, -1.384758, 0.6784314, 1, 0, 1,
-0.7437875, -0.2364749, -3.232294, 0.6745098, 1, 0, 1,
-0.7422774, -0.6197833, -1.357196, 0.6666667, 1, 0, 1,
-0.7417278, -1.089043, -2.869235, 0.6627451, 1, 0, 1,
-0.7390757, 0.2593725, -0.4157882, 0.654902, 1, 0, 1,
-0.7385135, -1.390995, -1.452489, 0.6509804, 1, 0, 1,
-0.7216496, 1.355407, 0.4407539, 0.6431373, 1, 0, 1,
-0.7162958, 2.427445, 0.1619712, 0.6392157, 1, 0, 1,
-0.7134387, -1.102245, -2.243719, 0.6313726, 1, 0, 1,
-0.7118764, 0.4677742, -1.331154, 0.627451, 1, 0, 1,
-0.7104149, -0.4017216, -2.431814, 0.6196079, 1, 0, 1,
-0.7069795, 1.637401, -1.505687, 0.6156863, 1, 0, 1,
-0.7043158, 0.8422801, -1.80308, 0.6078432, 1, 0, 1,
-0.7019833, 0.7942573, -1.433393, 0.6039216, 1, 0, 1,
-0.7002617, -0.4513013, -3.37081, 0.5960785, 1, 0, 1,
-0.6981695, 0.2008193, -1.09439, 0.5882353, 1, 0, 1,
-0.6902373, -0.735536, -3.476488, 0.5843138, 1, 0, 1,
-0.6893794, 0.1961722, -1.993565, 0.5764706, 1, 0, 1,
-0.689197, 0.4245842, 0.2968652, 0.572549, 1, 0, 1,
-0.6852241, -0.6696237, -1.187162, 0.5647059, 1, 0, 1,
-0.6817283, 1.22421, -0.2984745, 0.5607843, 1, 0, 1,
-0.6809731, -0.8342676, -2.469731, 0.5529412, 1, 0, 1,
-0.6759313, 1.415348, -0.6607516, 0.5490196, 1, 0, 1,
-0.6726736, -0.3494449, -2.064439, 0.5411765, 1, 0, 1,
-0.6685712, 0.1071847, -1.660112, 0.5372549, 1, 0, 1,
-0.66601, 0.7476186, -0.02289017, 0.5294118, 1, 0, 1,
-0.6656523, 1.16415, -0.4646855, 0.5254902, 1, 0, 1,
-0.6565765, 0.4721714, -1.553695, 0.5176471, 1, 0, 1,
-0.6559631, 0.1653165, -0.6738566, 0.5137255, 1, 0, 1,
-0.6541457, -0.2335158, -1.318676, 0.5058824, 1, 0, 1,
-0.6485004, 0.06612815, 0.2854486, 0.5019608, 1, 0, 1,
-0.6463494, -1.022957, -3.073395, 0.4941176, 1, 0, 1,
-0.6389288, 0.08545198, -1.401753, 0.4862745, 1, 0, 1,
-0.6376346, 1.482387, 1.42179, 0.4823529, 1, 0, 1,
-0.6330891, 0.1199944, -2.539203, 0.4745098, 1, 0, 1,
-0.6276023, 0.373572, 0.007498969, 0.4705882, 1, 0, 1,
-0.6273207, -2.312092, -3.69288, 0.4627451, 1, 0, 1,
-0.6257666, -0.608156, -1.427266, 0.4588235, 1, 0, 1,
-0.6243263, -0.2840296, -4.54765, 0.4509804, 1, 0, 1,
-0.6217812, 0.6278397, 0.1655941, 0.4470588, 1, 0, 1,
-0.6212413, 0.6500628, -3.297525, 0.4392157, 1, 0, 1,
-0.6078288, 1.0256, 0.8206988, 0.4352941, 1, 0, 1,
-0.607385, 0.5876955, 0.7729111, 0.427451, 1, 0, 1,
-0.6069098, 0.09912083, -0.00721481, 0.4235294, 1, 0, 1,
-0.6005786, -0.3488398, -1.956136, 0.4156863, 1, 0, 1,
-0.5951226, -0.6952447, -0.9700996, 0.4117647, 1, 0, 1,
-0.5948, 0.737681, -0.3098325, 0.4039216, 1, 0, 1,
-0.5868784, 0.7439951, 1.156023, 0.3960784, 1, 0, 1,
-0.5836895, -0.8390001, -3.796281, 0.3921569, 1, 0, 1,
-0.5755564, 1.246365, -0.009240991, 0.3843137, 1, 0, 1,
-0.5735524, 1.371962, -0.8972891, 0.3803922, 1, 0, 1,
-0.5656935, -0.08915454, -2.230686, 0.372549, 1, 0, 1,
-0.5632613, -0.6351479, -2.657321, 0.3686275, 1, 0, 1,
-0.5619925, 0.3423789, -0.06309068, 0.3607843, 1, 0, 1,
-0.5605598, 1.149726, 0.5730973, 0.3568628, 1, 0, 1,
-0.5568554, -0.6403156, -2.10579, 0.3490196, 1, 0, 1,
-0.5509281, -0.2789196, -1.165784, 0.345098, 1, 0, 1,
-0.5461895, -1.686234, -1.347694, 0.3372549, 1, 0, 1,
-0.5410973, 0.5176375, -0.7526801, 0.3333333, 1, 0, 1,
-0.5387019, 1.424677, -0.8648793, 0.3254902, 1, 0, 1,
-0.5292919, 1.597959, 1.825384, 0.3215686, 1, 0, 1,
-0.5291598, 0.15763, -1.997127, 0.3137255, 1, 0, 1,
-0.5274088, -0.1238871, -0.8431035, 0.3098039, 1, 0, 1,
-0.5248976, 0.06558817, -0.6720653, 0.3019608, 1, 0, 1,
-0.5239608, 0.2052498, -0.1346368, 0.2941177, 1, 0, 1,
-0.5233769, 0.333537, 0.1490811, 0.2901961, 1, 0, 1,
-0.5226653, -0.8185412, -3.007164, 0.282353, 1, 0, 1,
-0.5192859, 1.883106, -1.129524, 0.2784314, 1, 0, 1,
-0.5187017, 0.07373109, -0.3441474, 0.2705882, 1, 0, 1,
-0.5162852, -0.1761464, -0.7301408, 0.2666667, 1, 0, 1,
-0.5020254, 0.7365624, 0.04717757, 0.2588235, 1, 0, 1,
-0.5015039, 1.719404, 0.2098088, 0.254902, 1, 0, 1,
-0.4997641, 0.6278331, 0.240559, 0.2470588, 1, 0, 1,
-0.4968598, -0.3571557, -3.245463, 0.2431373, 1, 0, 1,
-0.4957968, 0.6087158, 0.549021, 0.2352941, 1, 0, 1,
-0.494542, 1.238156, 0.2660471, 0.2313726, 1, 0, 1,
-0.4927365, 0.9826892, -0.9335585, 0.2235294, 1, 0, 1,
-0.4906668, 0.2131754, 0.02625813, 0.2196078, 1, 0, 1,
-0.4893507, -0.5494648, -2.354601, 0.2117647, 1, 0, 1,
-0.4886241, -0.6613345, -3.807437, 0.2078431, 1, 0, 1,
-0.48105, 0.2486089, -1.11111, 0.2, 1, 0, 1,
-0.4791249, -2.029051, -3.556677, 0.1921569, 1, 0, 1,
-0.478819, -0.4648686, -2.98261, 0.1882353, 1, 0, 1,
-0.477088, -2.726789, -3.003399, 0.1803922, 1, 0, 1,
-0.4702932, 0.2071699, 0.07140674, 0.1764706, 1, 0, 1,
-0.4694886, -0.06191299, -1.720939, 0.1686275, 1, 0, 1,
-0.4643162, 0.8726789, -1.544946, 0.1647059, 1, 0, 1,
-0.4603037, -0.5017503, -2.361918, 0.1568628, 1, 0, 1,
-0.4530544, -2.012291, -4.521869, 0.1529412, 1, 0, 1,
-0.4473854, 2.109781, -1.97015, 0.145098, 1, 0, 1,
-0.4461372, -1.513562, -2.945321, 0.1411765, 1, 0, 1,
-0.4447534, 1.205494, -0.03611868, 0.1333333, 1, 0, 1,
-0.442568, -0.4480523, -2.630109, 0.1294118, 1, 0, 1,
-0.4420595, 1.495037, -0.04013532, 0.1215686, 1, 0, 1,
-0.4391858, -2.15861, -0.5047117, 0.1176471, 1, 0, 1,
-0.43557, -0.05352829, -4.460114, 0.1098039, 1, 0, 1,
-0.4348556, 0.6527157, -3.446233, 0.1058824, 1, 0, 1,
-0.4242862, -1.163077, -2.182491, 0.09803922, 1, 0, 1,
-0.4233195, 0.183678, -2.799258, 0.09019608, 1, 0, 1,
-0.4208612, -1.070131, -1.439861, 0.08627451, 1, 0, 1,
-0.4198518, 1.031522, 1.38361, 0.07843138, 1, 0, 1,
-0.413555, -0.3400345, -2.388715, 0.07450981, 1, 0, 1,
-0.4105741, 0.4516219, -0.1717352, 0.06666667, 1, 0, 1,
-0.4074249, 0.2105647, -2.636194, 0.0627451, 1, 0, 1,
-0.4072021, 0.6635695, -0.3896133, 0.05490196, 1, 0, 1,
-0.4048694, -0.8579718, -2.546753, 0.05098039, 1, 0, 1,
-0.4023201, 0.7889515, -1.496004, 0.04313726, 1, 0, 1,
-0.4010229, -1.675372, -3.920035, 0.03921569, 1, 0, 1,
-0.4008955, 0.6039108, 0.08309972, 0.03137255, 1, 0, 1,
-0.3994908, 0.1003565, -0.8313155, 0.02745098, 1, 0, 1,
-0.3953433, 0.09516061, -1.965523, 0.01960784, 1, 0, 1,
-0.3922638, -1.965863, -3.944886, 0.01568628, 1, 0, 1,
-0.3877668, 0.8808597, -1.356165, 0.007843138, 1, 0, 1,
-0.3831496, -1.624719, -2.575964, 0.003921569, 1, 0, 1,
-0.3777998, -0.7529184, -4.183948, 0, 1, 0.003921569, 1,
-0.376033, -0.2315762, -2.256818, 0, 1, 0.01176471, 1,
-0.3732191, -1.748538, -2.419535, 0, 1, 0.01568628, 1,
-0.3705195, -1.772254, -1.369019, 0, 1, 0.02352941, 1,
-0.3689646, 0.343221, 0.5436916, 0, 1, 0.02745098, 1,
-0.3677508, -0.738154, -4.321229, 0, 1, 0.03529412, 1,
-0.367719, -0.5916933, -3.706657, 0, 1, 0.03921569, 1,
-0.3677002, -0.2706667, -1.737244, 0, 1, 0.04705882, 1,
-0.3647794, -1.600906, -1.004053, 0, 1, 0.05098039, 1,
-0.3646132, 0.2345024, -0.6812922, 0, 1, 0.05882353, 1,
-0.3617422, 0.7225184, -0.9303855, 0, 1, 0.0627451, 1,
-0.3605632, 0.9763129, -0.01989699, 0, 1, 0.07058824, 1,
-0.3587155, -2.726327, -3.574228, 0, 1, 0.07450981, 1,
-0.358326, -0.6574154, -4.037136, 0, 1, 0.08235294, 1,
-0.3501467, -0.280744, -2.55303, 0, 1, 0.08627451, 1,
-0.3478642, -1.906228, -3.738198, 0, 1, 0.09411765, 1,
-0.3465512, 0.8653636, -0.2413751, 0, 1, 0.1019608, 1,
-0.3444119, -0.9961823, -3.246648, 0, 1, 0.1058824, 1,
-0.3398224, -0.3560064, -4.237386, 0, 1, 0.1137255, 1,
-0.3354755, -1.27418, -3.822932, 0, 1, 0.1176471, 1,
-0.3353661, -1.521483, -2.488902, 0, 1, 0.1254902, 1,
-0.3342932, -0.1555032, -2.34946, 0, 1, 0.1294118, 1,
-0.3341646, 1.28571, -0.7359185, 0, 1, 0.1372549, 1,
-0.3313633, 1.196895, -0.5358769, 0, 1, 0.1411765, 1,
-0.3309714, -1.590263, -1.932207, 0, 1, 0.1490196, 1,
-0.3288243, -0.4331128, -2.717848, 0, 1, 0.1529412, 1,
-0.3264095, -0.471157, -3.357012, 0, 1, 0.1607843, 1,
-0.3261566, 1.204913, -0.2133645, 0, 1, 0.1647059, 1,
-0.3245679, -0.5809976, -2.030894, 0, 1, 0.172549, 1,
-0.3193959, -0.7993111, -4.85603, 0, 1, 0.1764706, 1,
-0.314652, -0.7469906, -1.674243, 0, 1, 0.1843137, 1,
-0.3132984, -0.7938305, -2.66232, 0, 1, 0.1882353, 1,
-0.3095115, 1.398219, 0.1581766, 0, 1, 0.1960784, 1,
-0.3035496, 0.5129653, 0.7014309, 0, 1, 0.2039216, 1,
-0.3015259, 2.04897, 1.869919, 0, 1, 0.2078431, 1,
-0.3001675, 0.8226267, -1.640494, 0, 1, 0.2156863, 1,
-0.2977867, -1.508535, -2.541407, 0, 1, 0.2196078, 1,
-0.2972322, 0.2484946, -1.41217, 0, 1, 0.227451, 1,
-0.2968499, -1.800591, -3.458778, 0, 1, 0.2313726, 1,
-0.2964566, 1.217988, -0.4213467, 0, 1, 0.2392157, 1,
-0.29017, -0.8335913, -4.700712, 0, 1, 0.2431373, 1,
-0.2877311, 2.011221, -0.03505268, 0, 1, 0.2509804, 1,
-0.2868249, 2.723039, 0.4310284, 0, 1, 0.254902, 1,
-0.2804533, 0.5256964, -1.357397, 0, 1, 0.2627451, 1,
-0.2778327, -0.9203007, -3.058702, 0, 1, 0.2666667, 1,
-0.2763845, 0.7135528, -1.121194, 0, 1, 0.2745098, 1,
-0.2761534, -1.524772, -1.903044, 0, 1, 0.2784314, 1,
-0.2684202, 0.3340681, -1.820263, 0, 1, 0.2862745, 1,
-0.2647999, 0.6401835, -1.541141, 0, 1, 0.2901961, 1,
-0.2625275, -1.394678, -3.995492, 0, 1, 0.2980392, 1,
-0.26084, -0.3411426, -1.733639, 0, 1, 0.3058824, 1,
-0.2559654, -1.918938, -1.530327, 0, 1, 0.3098039, 1,
-0.2542495, -0.1947438, -3.622665, 0, 1, 0.3176471, 1,
-0.2541647, 0.9836467, -0.9892827, 0, 1, 0.3215686, 1,
-0.2509598, -0.2519423, -1.269034, 0, 1, 0.3294118, 1,
-0.2401665, -0.123553, -3.093145, 0, 1, 0.3333333, 1,
-0.239441, 0.3109897, 1.070192, 0, 1, 0.3411765, 1,
-0.2387725, -0.4127558, -1.848931, 0, 1, 0.345098, 1,
-0.2384987, -1.332663, -4.967352, 0, 1, 0.3529412, 1,
-0.2382785, 1.020631, 0.4167829, 0, 1, 0.3568628, 1,
-0.2338472, 2.332809, -0.2106141, 0, 1, 0.3647059, 1,
-0.2335569, -1.891744, 0.2388021, 0, 1, 0.3686275, 1,
-0.2314022, 0.7113904, -0.7736198, 0, 1, 0.3764706, 1,
-0.2256239, 2.089077, 1.004818, 0, 1, 0.3803922, 1,
-0.2256084, 0.1824043, -1.145645, 0, 1, 0.3882353, 1,
-0.224372, -0.3167629, -2.362543, 0, 1, 0.3921569, 1,
-0.2234352, -0.9904189, -2.155257, 0, 1, 0.4, 1,
-0.213037, -0.4487112, -5.306399, 0, 1, 0.4078431, 1,
-0.2125692, -0.9658716, -3.968088, 0, 1, 0.4117647, 1,
-0.2106512, -0.668586, -0.4667986, 0, 1, 0.4196078, 1,
-0.2066393, -0.01072013, -0.2050049, 0, 1, 0.4235294, 1,
-0.2046629, -0.5013589, -1.841266, 0, 1, 0.4313726, 1,
-0.2042883, 0.307642, 0.1787774, 0, 1, 0.4352941, 1,
-0.2027281, 0.9857643, -0.6467298, 0, 1, 0.4431373, 1,
-0.1950876, -0.9337949, -4.134269, 0, 1, 0.4470588, 1,
-0.1927122, 0.3577053, -0.003051854, 0, 1, 0.454902, 1,
-0.1909297, 0.738328, 0.01260906, 0, 1, 0.4588235, 1,
-0.1893197, -0.5772313, -4.00008, 0, 1, 0.4666667, 1,
-0.1873057, 0.7386397, 0.1069327, 0, 1, 0.4705882, 1,
-0.1854556, -0.428186, -3.286306, 0, 1, 0.4784314, 1,
-0.1845968, 1.142731, -1.672462, 0, 1, 0.4823529, 1,
-0.1826033, -0.02558189, -1.864462, 0, 1, 0.4901961, 1,
-0.181946, 0.8818703, -0.1367927, 0, 1, 0.4941176, 1,
-0.1813172, 1.253053, -0.2339856, 0, 1, 0.5019608, 1,
-0.1793877, -1.49743, -5.020982, 0, 1, 0.509804, 1,
-0.1763576, -1.148524, -4.635322, 0, 1, 0.5137255, 1,
-0.1731056, 2.029277, -0.3666542, 0, 1, 0.5215687, 1,
-0.165837, -0.014429, -0.9059829, 0, 1, 0.5254902, 1,
-0.1647048, -0.4954336, -2.515645, 0, 1, 0.5333334, 1,
-0.1638689, -1.750518, -1.599395, 0, 1, 0.5372549, 1,
-0.1609207, -0.1512041, -2.623214, 0, 1, 0.5450981, 1,
-0.1532825, -0.2857037, -2.150742, 0, 1, 0.5490196, 1,
-0.1483938, 0.08858207, -1.267675, 0, 1, 0.5568628, 1,
-0.1477436, 0.5532618, 0.04814818, 0, 1, 0.5607843, 1,
-0.1463059, -1.435253, -1.183067, 0, 1, 0.5686275, 1,
-0.1462223, -0.2589022, -2.019626, 0, 1, 0.572549, 1,
-0.1451759, 1.719004, -1.903947, 0, 1, 0.5803922, 1,
-0.1413325, 0.3333723, 1.146756, 0, 1, 0.5843138, 1,
-0.1372278, -0.04940124, -2.304566, 0, 1, 0.5921569, 1,
-0.1348986, 1.609419, 2.901057, 0, 1, 0.5960785, 1,
-0.1321766, -1.951921, -2.508218, 0, 1, 0.6039216, 1,
-0.1284724, 0.4426686, -1.377876, 0, 1, 0.6117647, 1,
-0.1190077, -0.7317313, -3.709789, 0, 1, 0.6156863, 1,
-0.1174389, 0.7465762, -0.421485, 0, 1, 0.6235294, 1,
-0.1106283, 0.982571, -0.725466, 0, 1, 0.627451, 1,
-0.108042, 0.109866, -1.492328, 0, 1, 0.6352941, 1,
-0.1054148, -0.04962783, -4.844575, 0, 1, 0.6392157, 1,
-0.1011755, 0.21329, -1.384331, 0, 1, 0.6470588, 1,
-0.1007279, -1.274523, -3.120275, 0, 1, 0.6509804, 1,
-0.09959809, -0.1644536, -4.428079, 0, 1, 0.6588235, 1,
-0.09522316, -0.6482539, -2.328457, 0, 1, 0.6627451, 1,
-0.09218272, 1.944074, 1.624544, 0, 1, 0.6705883, 1,
-0.09113844, 1.093652, -1.398366, 0, 1, 0.6745098, 1,
-0.09064297, -0.4063853, -3.135238, 0, 1, 0.682353, 1,
-0.09024873, -0.8578376, -1.627239, 0, 1, 0.6862745, 1,
-0.08743244, 0.7373983, -1.044699, 0, 1, 0.6941177, 1,
-0.08321957, 1.653266, 0.7845817, 0, 1, 0.7019608, 1,
-0.07483317, 0.4612518, -1.926557, 0, 1, 0.7058824, 1,
-0.07180696, 1.546217, -0.5429327, 0, 1, 0.7137255, 1,
-0.06802665, 0.024382, -2.045372, 0, 1, 0.7176471, 1,
-0.06354147, -0.3159015, -3.546996, 0, 1, 0.7254902, 1,
-0.06217139, -1.774357, -3.097298, 0, 1, 0.7294118, 1,
-0.05897657, 0.03448933, -0.000372941, 0, 1, 0.7372549, 1,
-0.05308148, -0.3656426, -3.544774, 0, 1, 0.7411765, 1,
-0.0526538, -1.415078, -5.671406, 0, 1, 0.7490196, 1,
-0.05006737, -1.88035, -3.438072, 0, 1, 0.7529412, 1,
-0.04966388, -1.082396, -3.660542, 0, 1, 0.7607843, 1,
-0.04520207, 0.4006478, -0.8046088, 0, 1, 0.7647059, 1,
-0.04034291, -2.405221, -4.035297, 0, 1, 0.772549, 1,
-0.03740536, 0.8278591, 0.1264488, 0, 1, 0.7764706, 1,
-0.03613447, 0.5090437, -0.113166, 0, 1, 0.7843137, 1,
-0.03547867, 0.3792198, -1.090294, 0, 1, 0.7882353, 1,
-0.03291266, 0.3378718, -2.015384, 0, 1, 0.7960784, 1,
-0.03200213, 0.5914128, -0.3411925, 0, 1, 0.8039216, 1,
-0.03057819, -0.767891, -2.772964, 0, 1, 0.8078431, 1,
-0.02934976, -0.9456775, -1.507802, 0, 1, 0.8156863, 1,
-0.02719172, 0.2667766, 0.9485735, 0, 1, 0.8196079, 1,
-0.02061518, -0.4660194, -1.484763, 0, 1, 0.827451, 1,
-0.01923803, 0.1958666, 0.1853008, 0, 1, 0.8313726, 1,
-0.01886659, -3.076315, -1.885274, 0, 1, 0.8392157, 1,
-0.01708216, 0.8342066, 0.09286909, 0, 1, 0.8431373, 1,
-0.01393403, -0.3559221, -2.842882, 0, 1, 0.8509804, 1,
-0.01361354, -0.2277092, -4.00664, 0, 1, 0.854902, 1,
-0.01252395, 0.4670302, -0.2572073, 0, 1, 0.8627451, 1,
-0.01083724, 0.1349649, 0.403618, 0, 1, 0.8666667, 1,
-0.008838207, -1.049209, -2.281949, 0, 1, 0.8745098, 1,
-0.00718629, -0.09886986, -3.530764, 0, 1, 0.8784314, 1,
-0.006388509, -0.2912311, -3.278051, 0, 1, 0.8862745, 1,
-0.006274423, -1.394931, -4.315532, 0, 1, 0.8901961, 1,
-0.004999948, 1.180007, -1.021926, 0, 1, 0.8980392, 1,
0.0009952051, 1.078914, 0.1658619, 0, 1, 0.9058824, 1,
0.001139537, 0.5196765, -1.217589, 0, 1, 0.9098039, 1,
0.002588566, 0.742127, 0.06141675, 0, 1, 0.9176471, 1,
0.00843923, 0.6833557, -0.02842166, 0, 1, 0.9215686, 1,
0.008515345, -0.3649668, 3.211715, 0, 1, 0.9294118, 1,
0.008578941, -0.5004636, 1.55662, 0, 1, 0.9333333, 1,
0.009868485, -1.959494, 3.302915, 0, 1, 0.9411765, 1,
0.009954746, -0.4785788, 2.340831, 0, 1, 0.945098, 1,
0.01009517, 0.08895522, 1.065137, 0, 1, 0.9529412, 1,
0.01136971, 0.4540851, -0.1653081, 0, 1, 0.9568627, 1,
0.01268906, 1.160072, 0.2689719, 0, 1, 0.9647059, 1,
0.01351249, -0.2246007, 1.432408, 0, 1, 0.9686275, 1,
0.02064269, 0.5481538, 1.804021, 0, 1, 0.9764706, 1,
0.02395036, -2.039673, 4.631758, 0, 1, 0.9803922, 1,
0.02604577, 0.3015578, 1.137329, 0, 1, 0.9882353, 1,
0.02917958, 0.2957698, 1.075663, 0, 1, 0.9921569, 1,
0.03087992, -0.6018345, 3.756515, 0, 1, 1, 1,
0.03115731, 0.4159021, -1.931794, 0, 0.9921569, 1, 1,
0.03594197, 0.8619102, -0.5003057, 0, 0.9882353, 1, 1,
0.0392123, 2.125181, 1.630353, 0, 0.9803922, 1, 1,
0.03959128, -0.8684524, 3.105552, 0, 0.9764706, 1, 1,
0.0419553, 0.2478138, 0.7823473, 0, 0.9686275, 1, 1,
0.04214397, -0.07580917, 2.691599, 0, 0.9647059, 1, 1,
0.04286052, 0.03643351, -1.012355, 0, 0.9568627, 1, 1,
0.04583538, -0.910184, 2.695622, 0, 0.9529412, 1, 1,
0.04854535, 1.237506, 0.804089, 0, 0.945098, 1, 1,
0.04895615, -0.7975377, 3.52078, 0, 0.9411765, 1, 1,
0.0528785, 2.52923, -0.8662325, 0, 0.9333333, 1, 1,
0.05905307, 0.7327367, 0.1423689, 0, 0.9294118, 1, 1,
0.05967281, 1.188507, -1.365326, 0, 0.9215686, 1, 1,
0.06106403, -1.149743, 3.598107, 0, 0.9176471, 1, 1,
0.06842831, 0.9425755, -0.1739394, 0, 0.9098039, 1, 1,
0.06912228, -0.1426634, 4.164524, 0, 0.9058824, 1, 1,
0.07334014, -0.6572995, 2.42748, 0, 0.8980392, 1, 1,
0.07916089, -0.1919267, 3.861737, 0, 0.8901961, 1, 1,
0.08187658, 1.336384, 0.81341, 0, 0.8862745, 1, 1,
0.08310925, 0.6221696, 0.0156865, 0, 0.8784314, 1, 1,
0.08613026, -1.160741, 3.413668, 0, 0.8745098, 1, 1,
0.08793299, -0.8719743, 2.381294, 0, 0.8666667, 1, 1,
0.09416596, 0.3031997, -0.06834756, 0, 0.8627451, 1, 1,
0.09480555, -0.1523579, 2.647196, 0, 0.854902, 1, 1,
0.1020411, -1.841725, 2.230081, 0, 0.8509804, 1, 1,
0.1041335, -0.4192125, 3.267634, 0, 0.8431373, 1, 1,
0.1045383, -0.7757925, 2.253531, 0, 0.8392157, 1, 1,
0.1051358, 0.5273435, -1.222852, 0, 0.8313726, 1, 1,
0.1063888, 0.3218722, -0.9392556, 0, 0.827451, 1, 1,
0.1070756, 1.260801, -0.2542117, 0, 0.8196079, 1, 1,
0.1072559, -0.1913856, 1.315475, 0, 0.8156863, 1, 1,
0.1075474, 1.309247, 1.296785, 0, 0.8078431, 1, 1,
0.1091682, -0.4114373, 1.772538, 0, 0.8039216, 1, 1,
0.1140528, 0.6813639, 0.9813679, 0, 0.7960784, 1, 1,
0.1143872, 1.567937, -0.89904, 0, 0.7882353, 1, 1,
0.1154138, -0.5656864, 3.925728, 0, 0.7843137, 1, 1,
0.1166421, -0.5176126, 4.264262, 0, 0.7764706, 1, 1,
0.1204432, 0.9592152, 0.1137313, 0, 0.772549, 1, 1,
0.1248952, 1.589402, -0.7019805, 0, 0.7647059, 1, 1,
0.1258633, -8.470807e-05, 1.123648, 0, 0.7607843, 1, 1,
0.1271016, -0.6920506, 2.536399, 0, 0.7529412, 1, 1,
0.1274331, 0.5010941, 1.398582, 0, 0.7490196, 1, 1,
0.1279812, 0.7482846, 0.8074666, 0, 0.7411765, 1, 1,
0.1285219, 0.9642268, 1.03393, 0, 0.7372549, 1, 1,
0.1361207, -0.5473423, 2.905297, 0, 0.7294118, 1, 1,
0.138363, -1.605679, 3.450717, 0, 0.7254902, 1, 1,
0.1398984, 0.9190385, -1.133845, 0, 0.7176471, 1, 1,
0.1402538, -0.1681509, 3.537387, 0, 0.7137255, 1, 1,
0.14438, -1.290326, 2.017859, 0, 0.7058824, 1, 1,
0.1453966, 0.178353, 0.9107381, 0, 0.6980392, 1, 1,
0.1469747, 0.1167978, 0.9987028, 0, 0.6941177, 1, 1,
0.1509563, -0.1283066, 1.501608, 0, 0.6862745, 1, 1,
0.1514391, 1.279372, 0.6376548, 0, 0.682353, 1, 1,
0.1519096, 1.234296, -0.05619186, 0, 0.6745098, 1, 1,
0.1543285, -0.8038419, 4.360411, 0, 0.6705883, 1, 1,
0.1571355, 0.338905, 2.45166, 0, 0.6627451, 1, 1,
0.1693567, -1.699541, 3.367259, 0, 0.6588235, 1, 1,
0.171154, 1.709221, -0.03207441, 0, 0.6509804, 1, 1,
0.174049, -0.4542156, 1.913156, 0, 0.6470588, 1, 1,
0.17462, 0.1194037, 1.480286, 0, 0.6392157, 1, 1,
0.1748925, 1.241661, 0.2717793, 0, 0.6352941, 1, 1,
0.1751561, -2.330912, 2.991857, 0, 0.627451, 1, 1,
0.1755982, 0.5806508, -0.0424446, 0, 0.6235294, 1, 1,
0.1769692, -0.8682622, 2.394631, 0, 0.6156863, 1, 1,
0.1795958, -0.7142652, 2.71704, 0, 0.6117647, 1, 1,
0.1814823, -0.1624721, 2.764694, 0, 0.6039216, 1, 1,
0.1824229, -0.3600735, 2.943679, 0, 0.5960785, 1, 1,
0.1884789, -0.1557259, 2.256821, 0, 0.5921569, 1, 1,
0.1900331, -0.6242165, 2.929736, 0, 0.5843138, 1, 1,
0.192055, -0.4494356, 3.662019, 0, 0.5803922, 1, 1,
0.1922801, -0.1710024, 1.870158, 0, 0.572549, 1, 1,
0.1966006, -0.5594858, 1.904375, 0, 0.5686275, 1, 1,
0.1971717, 0.4994305, 1.408873, 0, 0.5607843, 1, 1,
0.2028276, -0.4400637, 1.89692, 0, 0.5568628, 1, 1,
0.2029097, 0.730332, 0.07053211, 0, 0.5490196, 1, 1,
0.2037518, -0.800788, 2.743447, 0, 0.5450981, 1, 1,
0.2092707, -0.5897275, 2.402205, 0, 0.5372549, 1, 1,
0.2165775, -0.6282798, 2.64336, 0, 0.5333334, 1, 1,
0.2196278, 0.679451, 1.491963, 0, 0.5254902, 1, 1,
0.21977, -0.284765, 2.02924, 0, 0.5215687, 1, 1,
0.2242085, 2.014144, 2.456741, 0, 0.5137255, 1, 1,
0.2250144, 0.3745311, 0.3105096, 0, 0.509804, 1, 1,
0.2292096, 2.191096, -1.158244, 0, 0.5019608, 1, 1,
0.2341695, 1.333762, 1.092292, 0, 0.4941176, 1, 1,
0.235921, 1.393219, 0.8246258, 0, 0.4901961, 1, 1,
0.2369433, -0.4342832, 3.425927, 0, 0.4823529, 1, 1,
0.2459914, -1.838123, 4.962534, 0, 0.4784314, 1, 1,
0.2471608, -0.6623985, 1.748052, 0, 0.4705882, 1, 1,
0.2473425, -0.3169236, 2.196456, 0, 0.4666667, 1, 1,
0.2544824, 2.34353, 0.4229442, 0, 0.4588235, 1, 1,
0.2548078, -0.0396628, 2.665992, 0, 0.454902, 1, 1,
0.2588683, 0.1597756, 1.906212, 0, 0.4470588, 1, 1,
0.2618863, 1.218491, -0.2027493, 0, 0.4431373, 1, 1,
0.2680337, 1.492133, 1.328201, 0, 0.4352941, 1, 1,
0.2698984, -1.225703, 3.448315, 0, 0.4313726, 1, 1,
0.2769578, -0.9120042, 3.70706, 0, 0.4235294, 1, 1,
0.2785007, -0.4564328, 1.827145, 0, 0.4196078, 1, 1,
0.2814222, 1.967967, 0.3696812, 0, 0.4117647, 1, 1,
0.2904153, -2.758538, 3.127925, 0, 0.4078431, 1, 1,
0.2927177, 0.9143875, 0.881465, 0, 0.4, 1, 1,
0.3009079, 0.9558346, 0.7797229, 0, 0.3921569, 1, 1,
0.3012516, -1.043475, 3.10286, 0, 0.3882353, 1, 1,
0.3022545, 1.285118, -1.609127, 0, 0.3803922, 1, 1,
0.3028477, -0.4599042, 2.147304, 0, 0.3764706, 1, 1,
0.3044584, 0.4460988, -0.1076833, 0, 0.3686275, 1, 1,
0.3060343, 0.4449333, 0.3258622, 0, 0.3647059, 1, 1,
0.3064356, 1.500053, 0.9691312, 0, 0.3568628, 1, 1,
0.3100756, -0.06973337, 2.328691, 0, 0.3529412, 1, 1,
0.3108217, 1.51288, -0.2633216, 0, 0.345098, 1, 1,
0.3321885, -0.2427694, 2.815927, 0, 0.3411765, 1, 1,
0.332769, 0.1654755, 0.4017847, 0, 0.3333333, 1, 1,
0.3328037, -0.1347804, 0.6117643, 0, 0.3294118, 1, 1,
0.3366363, -1.44828, 3.931909, 0, 0.3215686, 1, 1,
0.3386108, -0.3755639, 3.072025, 0, 0.3176471, 1, 1,
0.3436685, 1.035273, 0.412188, 0, 0.3098039, 1, 1,
0.3458085, -0.5970695, 2.364094, 0, 0.3058824, 1, 1,
0.354335, 0.2854352, 1.697529, 0, 0.2980392, 1, 1,
0.3595898, -0.1285944, 2.306485, 0, 0.2901961, 1, 1,
0.362651, 1.5339, -1.077739, 0, 0.2862745, 1, 1,
0.3659183, 0.8465949, -0.2198549, 0, 0.2784314, 1, 1,
0.3666844, -0.8499249, 2.001905, 0, 0.2745098, 1, 1,
0.3689674, -2.082935, 3.07757, 0, 0.2666667, 1, 1,
0.3697456, -0.1206468, 2.391815, 0, 0.2627451, 1, 1,
0.3778591, 1.261296, 0.08416634, 0, 0.254902, 1, 1,
0.3803868, -0.8468406, 3.252346, 0, 0.2509804, 1, 1,
0.3888347, 0.2628984, 0.3648598, 0, 0.2431373, 1, 1,
0.397853, 0.4857266, 1.257439, 0, 0.2392157, 1, 1,
0.3985634, 0.221553, 0.8609114, 0, 0.2313726, 1, 1,
0.398617, 0.454639, 0.6772563, 0, 0.227451, 1, 1,
0.4015063, 0.9084949, -1.078604, 0, 0.2196078, 1, 1,
0.402076, 1.258318, 0.5635698, 0, 0.2156863, 1, 1,
0.4049704, 0.5691696, 1.266746, 0, 0.2078431, 1, 1,
0.4051057, 0.8787586, -0.8351592, 0, 0.2039216, 1, 1,
0.4083187, 0.6382987, 0.07210036, 0, 0.1960784, 1, 1,
0.4093032, 0.0814366, 4.350579, 0, 0.1882353, 1, 1,
0.4105782, -0.04759414, 1.116139, 0, 0.1843137, 1, 1,
0.4106118, 0.8530045, -0.2897795, 0, 0.1764706, 1, 1,
0.4116038, -0.04463396, 1.200757, 0, 0.172549, 1, 1,
0.4121554, 0.305691, 0.9407036, 0, 0.1647059, 1, 1,
0.4128803, -0.4152955, 4.348464, 0, 0.1607843, 1, 1,
0.4164044, -0.2852281, 2.480199, 0, 0.1529412, 1, 1,
0.4171246, -0.8764484, 2.704983, 0, 0.1490196, 1, 1,
0.4188506, 0.8263005, 0.491961, 0, 0.1411765, 1, 1,
0.4198803, -0.1416562, 0.7285449, 0, 0.1372549, 1, 1,
0.4199006, 1.559186, 1.314209, 0, 0.1294118, 1, 1,
0.4230562, 0.04424688, 1.175109, 0, 0.1254902, 1, 1,
0.4274674, -0.684281, 3.227087, 0, 0.1176471, 1, 1,
0.4279118, 0.4946812, 1.454967, 0, 0.1137255, 1, 1,
0.430332, -1.149778, 2.627913, 0, 0.1058824, 1, 1,
0.4303641, 0.667951, -0.2735952, 0, 0.09803922, 1, 1,
0.4309463, -1.673219, 4.792978, 0, 0.09411765, 1, 1,
0.4311893, -0.5308031, 0.9786957, 0, 0.08627451, 1, 1,
0.4325981, 0.1761828, 1.210065, 0, 0.08235294, 1, 1,
0.4383094, -0.1919453, 1.089203, 0, 0.07450981, 1, 1,
0.4475788, -0.5146928, 2.932997, 0, 0.07058824, 1, 1,
0.4493212, -1.69622, 3.061743, 0, 0.0627451, 1, 1,
0.4508851, 1.994139, 0.6891336, 0, 0.05882353, 1, 1,
0.4522994, 0.4505301, -0.2810408, 0, 0.05098039, 1, 1,
0.4578065, 0.3646013, 1.652313, 0, 0.04705882, 1, 1,
0.458567, 1.213382, 2.412431, 0, 0.03921569, 1, 1,
0.4605256, 0.5004728, 2.125367, 0, 0.03529412, 1, 1,
0.461028, 1.208315, 0.2768856, 0, 0.02745098, 1, 1,
0.4675102, 1.898402, 2.051574, 0, 0.02352941, 1, 1,
0.468381, -1.822233, 3.068675, 0, 0.01568628, 1, 1,
0.4743999, 1.20282, -2.40576, 0, 0.01176471, 1, 1,
0.4788651, 0.526299, 0.9552576, 0, 0.003921569, 1, 1,
0.4799133, -0.03792629, 1.894697, 0.003921569, 0, 1, 1,
0.4874097, 0.3311977, 1.060596, 0.007843138, 0, 1, 1,
0.4886384, 0.240298, 2.278609, 0.01568628, 0, 1, 1,
0.4898289, -0.315599, 1.791664, 0.01960784, 0, 1, 1,
0.4901113, -2.283044, 2.840068, 0.02745098, 0, 1, 1,
0.4920855, 0.6733173, 0.03078734, 0.03137255, 0, 1, 1,
0.4931505, -0.9875101, 3.858599, 0.03921569, 0, 1, 1,
0.4983027, 1.226682, 1.611373, 0.04313726, 0, 1, 1,
0.4997385, 0.9894245, 0.7536965, 0.05098039, 0, 1, 1,
0.5046182, 1.654533, 0.1533981, 0.05490196, 0, 1, 1,
0.5051416, 0.8751334, -0.04440987, 0.0627451, 0, 1, 1,
0.5069494, -0.6209776, 3.816718, 0.06666667, 0, 1, 1,
0.5113177, -0.1294798, 1.36853, 0.07450981, 0, 1, 1,
0.5120595, -1.214846, 1.582332, 0.07843138, 0, 1, 1,
0.5134407, 2.301492, 1.045498, 0.08627451, 0, 1, 1,
0.5169324, 2.180106, 1.140863, 0.09019608, 0, 1, 1,
0.524049, -0.7164872, 2.518156, 0.09803922, 0, 1, 1,
0.5256138, -0.2339684, 2.12968, 0.1058824, 0, 1, 1,
0.5258703, -0.8041778, 3.049413, 0.1098039, 0, 1, 1,
0.5290335, -0.3262487, 3.369848, 0.1176471, 0, 1, 1,
0.5293729, 0.1489427, 2.030397, 0.1215686, 0, 1, 1,
0.5309753, 1.051289, -0.6545565, 0.1294118, 0, 1, 1,
0.5322883, -1.57584, 4.082232, 0.1333333, 0, 1, 1,
0.5362131, 0.0768243, 1.791972, 0.1411765, 0, 1, 1,
0.5382711, -0.6734315, 2.912828, 0.145098, 0, 1, 1,
0.5383241, 0.1919932, 3.018565, 0.1529412, 0, 1, 1,
0.5417439, -1.294769, 2.794058, 0.1568628, 0, 1, 1,
0.5424579, 0.3890882, 0.0827132, 0.1647059, 0, 1, 1,
0.5433391, -0.656045, 2.015193, 0.1686275, 0, 1, 1,
0.5448742, -0.9585469, 1.96977, 0.1764706, 0, 1, 1,
0.5466886, 0.2372278, 0.2851026, 0.1803922, 0, 1, 1,
0.5487444, -1.200398, 3.204992, 0.1882353, 0, 1, 1,
0.5506334, 0.3805456, 1.003768, 0.1921569, 0, 1, 1,
0.5547552, 0.8186358, 2.730705, 0.2, 0, 1, 1,
0.5558695, -2.049265, 1.131718, 0.2078431, 0, 1, 1,
0.5568167, 0.7239337, 0.8792906, 0.2117647, 0, 1, 1,
0.5590854, -1.13501, 2.46791, 0.2196078, 0, 1, 1,
0.5599084, -0.811171, 1.809362, 0.2235294, 0, 1, 1,
0.5623266, 1.429884, 1.133638, 0.2313726, 0, 1, 1,
0.5666263, -0.03523326, 3.462431, 0.2352941, 0, 1, 1,
0.5690773, 0.657351, 0.8793265, 0.2431373, 0, 1, 1,
0.5697595, -0.9980784, 3.310964, 0.2470588, 0, 1, 1,
0.5727758, 0.5587612, 0.6801041, 0.254902, 0, 1, 1,
0.5739982, -1.629899, 1.281387, 0.2588235, 0, 1, 1,
0.5830128, -0.04185554, 2.048031, 0.2666667, 0, 1, 1,
0.5844113, -0.3276886, 1.970251, 0.2705882, 0, 1, 1,
0.5879432, -0.8254873, 2.597907, 0.2784314, 0, 1, 1,
0.5911328, -0.234027, 1.397627, 0.282353, 0, 1, 1,
0.5930831, -1.392142, 3.702407, 0.2901961, 0, 1, 1,
0.5948822, -0.237348, 0.1238929, 0.2941177, 0, 1, 1,
0.6016372, 0.5728402, 0.9472075, 0.3019608, 0, 1, 1,
0.6027218, 0.6607951, 0.1218848, 0.3098039, 0, 1, 1,
0.613728, 1.545168, -0.4142482, 0.3137255, 0, 1, 1,
0.6148431, 1.907868, -0.05352468, 0.3215686, 0, 1, 1,
0.6153083, -1.039411, 3.586726, 0.3254902, 0, 1, 1,
0.6201016, -0.3387315, 2.659018, 0.3333333, 0, 1, 1,
0.6233082, 0.1318848, 2.207707, 0.3372549, 0, 1, 1,
0.6286806, -0.5940394, 2.661251, 0.345098, 0, 1, 1,
0.6341261, 0.5077013, 0.08120374, 0.3490196, 0, 1, 1,
0.6341336, -0.3254686, 2.370965, 0.3568628, 0, 1, 1,
0.6401317, 0.9062637, -0.9950296, 0.3607843, 0, 1, 1,
0.6407418, 0.5598098, 0.2408845, 0.3686275, 0, 1, 1,
0.6418266, 1.435298, 1.287565, 0.372549, 0, 1, 1,
0.642132, 0.689077, -0.2491152, 0.3803922, 0, 1, 1,
0.6422217, 1.507713, 1.172318, 0.3843137, 0, 1, 1,
0.6455151, 0.2237722, 1.047096, 0.3921569, 0, 1, 1,
0.6476405, 0.544307, 0.5979855, 0.3960784, 0, 1, 1,
0.6476706, -0.5838941, 3.092206, 0.4039216, 0, 1, 1,
0.6493744, 0.8073252, 0.2552209, 0.4117647, 0, 1, 1,
0.6537443, -1.070826, 1.328353, 0.4156863, 0, 1, 1,
0.6640974, -1.926983, 3.427251, 0.4235294, 0, 1, 1,
0.6645536, -0.6501238, 2.850826, 0.427451, 0, 1, 1,
0.6702799, 0.4360014, 0.3003361, 0.4352941, 0, 1, 1,
0.6703372, -0.03261735, 1.886855, 0.4392157, 0, 1, 1,
0.6728568, 2.560439, 0.8695971, 0.4470588, 0, 1, 1,
0.6810041, -0.1017904, 2.095566, 0.4509804, 0, 1, 1,
0.6837295, 0.05360181, 2.595304, 0.4588235, 0, 1, 1,
0.6841343, 0.6309763, 0.6914304, 0.4627451, 0, 1, 1,
0.6911064, -2.780055, 3.541519, 0.4705882, 0, 1, 1,
0.6939687, -0.3821201, 0.5286311, 0.4745098, 0, 1, 1,
0.6941239, -0.3891271, 3.059181, 0.4823529, 0, 1, 1,
0.6962532, -2.188061, 3.758948, 0.4862745, 0, 1, 1,
0.699131, -0.4107107, 2.337698, 0.4941176, 0, 1, 1,
0.6999452, -0.8869247, 3.792602, 0.5019608, 0, 1, 1,
0.7054943, -0.2571571, 1.851663, 0.5058824, 0, 1, 1,
0.7081163, -1.127362, 2.325761, 0.5137255, 0, 1, 1,
0.7106123, 1.719687, -2.330496, 0.5176471, 0, 1, 1,
0.711845, 0.5569548, 0.01066798, 0.5254902, 0, 1, 1,
0.7126802, -0.8051395, 0.8280605, 0.5294118, 0, 1, 1,
0.7145666, 0.9475484, 1.595887, 0.5372549, 0, 1, 1,
0.719865, 0.05743346, 1.560913, 0.5411765, 0, 1, 1,
0.7205539, -0.9566976, 2.255974, 0.5490196, 0, 1, 1,
0.7211512, -0.03587165, 1.224586, 0.5529412, 0, 1, 1,
0.7265145, 0.6873928, 0.4275917, 0.5607843, 0, 1, 1,
0.7277767, -0.03294732, 2.228186, 0.5647059, 0, 1, 1,
0.7310388, -1.732089, 1.763048, 0.572549, 0, 1, 1,
0.733177, 0.239055, 0.6676852, 0.5764706, 0, 1, 1,
0.743016, -0.2262811, 3.630437, 0.5843138, 0, 1, 1,
0.7445894, -1.539493, 2.160599, 0.5882353, 0, 1, 1,
0.7473866, -1.025916, 1.38434, 0.5960785, 0, 1, 1,
0.7477782, 0.1592136, 1.447829, 0.6039216, 0, 1, 1,
0.7498286, -0.6840595, 2.502363, 0.6078432, 0, 1, 1,
0.7607583, 0.8731843, 3.807633, 0.6156863, 0, 1, 1,
0.7633234, -1.400314, 4.083656, 0.6196079, 0, 1, 1,
0.7681025, -2.561279, 1.690709, 0.627451, 0, 1, 1,
0.7715604, 0.3131557, 1.18926, 0.6313726, 0, 1, 1,
0.7718633, 0.3885392, 1.909097, 0.6392157, 0, 1, 1,
0.7769165, 1.364178, -0.2277779, 0.6431373, 0, 1, 1,
0.7810571, -1.698297, 2.319153, 0.6509804, 0, 1, 1,
0.7862728, -0.3896846, 1.49068, 0.654902, 0, 1, 1,
0.7905634, -1.520197, 3.000831, 0.6627451, 0, 1, 1,
0.791249, 0.9291378, -1.011634, 0.6666667, 0, 1, 1,
0.8022773, 0.4487053, 0.6940392, 0.6745098, 0, 1, 1,
0.8092352, 0.8030233, 1.008975, 0.6784314, 0, 1, 1,
0.8137231, 1.014142, 0.592678, 0.6862745, 0, 1, 1,
0.8163936, -1.495555, 3.19091, 0.6901961, 0, 1, 1,
0.8182704, 1.072608, 1.101748, 0.6980392, 0, 1, 1,
0.8196717, -0.3113439, 0.4714314, 0.7058824, 0, 1, 1,
0.8278718, -1.41885, 2.46109, 0.7098039, 0, 1, 1,
0.8281153, -0.6180912, 1.222701, 0.7176471, 0, 1, 1,
0.8296608, 0.406662, 0.6502366, 0.7215686, 0, 1, 1,
0.8304812, 0.03166608, 3.112121, 0.7294118, 0, 1, 1,
0.8306311, -2.043874, 3.310495, 0.7333333, 0, 1, 1,
0.8402445, -0.3159844, 1.091804, 0.7411765, 0, 1, 1,
0.8455538, -0.967576, 1.769064, 0.7450981, 0, 1, 1,
0.8552024, -0.8180838, 2.585151, 0.7529412, 0, 1, 1,
0.858747, 1.538325, 1.382338, 0.7568628, 0, 1, 1,
0.8618828, 0.003346974, -0.3834609, 0.7647059, 0, 1, 1,
0.8637893, -1.056666, 0.9126707, 0.7686275, 0, 1, 1,
0.8643804, -1.388619, 3.391246, 0.7764706, 0, 1, 1,
0.8697854, 0.2999462, 0.4606334, 0.7803922, 0, 1, 1,
0.8718134, -0.9921925, 2.684995, 0.7882353, 0, 1, 1,
0.8740276, 1.071692, 1.541525, 0.7921569, 0, 1, 1,
0.8777865, -0.007570758, 1.480801, 0.8, 0, 1, 1,
0.8903829, 0.0148089, 1.473238, 0.8078431, 0, 1, 1,
0.8909307, -0.1091328, 1.866341, 0.8117647, 0, 1, 1,
0.8950708, 0.07155846, 3.284238, 0.8196079, 0, 1, 1,
0.8966025, 1.715825, -0.832316, 0.8235294, 0, 1, 1,
0.8979719, 1.821867, 1.2119, 0.8313726, 0, 1, 1,
0.8989114, -2.099635, 4.21994, 0.8352941, 0, 1, 1,
0.9004306, 0.3740767, 0.1152227, 0.8431373, 0, 1, 1,
0.9060765, -1.104386, 2.664876, 0.8470588, 0, 1, 1,
0.9062331, -0.3337739, 2.327979, 0.854902, 0, 1, 1,
0.9090835, -1.658882, 2.95453, 0.8588235, 0, 1, 1,
0.9094785, -0.2601453, 1.955996, 0.8666667, 0, 1, 1,
0.9146509, 0.636932, -1.797125, 0.8705882, 0, 1, 1,
0.9146519, -1.070714, 3.454697, 0.8784314, 0, 1, 1,
0.9181705, -0.2906745, 2.92686, 0.8823529, 0, 1, 1,
0.9197434, 0.6352827, 0.2003269, 0.8901961, 0, 1, 1,
0.9223939, 0.3996909, 0.4714372, 0.8941177, 0, 1, 1,
0.9283946, 0.4562563, 0.639166, 0.9019608, 0, 1, 1,
0.9299657, 0.9493572, 0.6816192, 0.9098039, 0, 1, 1,
0.9338846, -0.1454622, 1.703342, 0.9137255, 0, 1, 1,
0.9404686, 0.5813973, 0.0665096, 0.9215686, 0, 1, 1,
0.948295, -1.242594, 2.472082, 0.9254902, 0, 1, 1,
0.9497703, 0.5001811, -0.8242213, 0.9333333, 0, 1, 1,
0.9518165, 2.971698, -0.8796857, 0.9372549, 0, 1, 1,
0.9525252, -0.265152, 2.522644, 0.945098, 0, 1, 1,
0.9601232, 0.801252, -0.06532132, 0.9490196, 0, 1, 1,
0.9728416, 0.7384676, 2.100953, 0.9568627, 0, 1, 1,
0.9731842, 0.07801288, -0.5829782, 0.9607843, 0, 1, 1,
0.9837604, -1.74153, 4.095116, 0.9686275, 0, 1, 1,
0.9849343, 1.120248, 2.151112, 0.972549, 0, 1, 1,
0.9874836, 1.334801, -0.4369056, 0.9803922, 0, 1, 1,
0.9913824, -0.5445738, 0.6545737, 0.9843137, 0, 1, 1,
1.002523, 0.8584574, 1.127055, 0.9921569, 0, 1, 1,
1.005811, 0.9235922, -0.3391623, 0.9960784, 0, 1, 1,
1.008602, 1.600117, 1.746413, 1, 0, 0.9960784, 1,
1.018175, -0.5433916, 2.310039, 1, 0, 0.9882353, 1,
1.019952, -0.008589866, 0.3752049, 1, 0, 0.9843137, 1,
1.020737, 0.368668, -0.4169365, 1, 0, 0.9764706, 1,
1.023211, -2.370529, 1.580064, 1, 0, 0.972549, 1,
1.028641, 0.5463356, 0.136363, 1, 0, 0.9647059, 1,
1.032691, -1.381281, 0.7551695, 1, 0, 0.9607843, 1,
1.034996, -0.7822162, 3.101856, 1, 0, 0.9529412, 1,
1.039638, -0.1700039, 1.611318, 1, 0, 0.9490196, 1,
1.040995, -1.41246, 3.006621, 1, 0, 0.9411765, 1,
1.044243, -0.9355726, 0.5835325, 1, 0, 0.9372549, 1,
1.04858, -0.9038573, 2.930353, 1, 0, 0.9294118, 1,
1.058969, 0.2892831, 0.805366, 1, 0, 0.9254902, 1,
1.065026, 0.852243, -1.042624, 1, 0, 0.9176471, 1,
1.065768, 0.526148, -1.681407, 1, 0, 0.9137255, 1,
1.067282, 0.7680707, 0.6935034, 1, 0, 0.9058824, 1,
1.070178, 0.01147683, 2.233379, 1, 0, 0.9019608, 1,
1.073834, 1.332663, 1.739922, 1, 0, 0.8941177, 1,
1.084027, -1.349716, 0.4460245, 1, 0, 0.8862745, 1,
1.084124, 0.8065588, 1.050479, 1, 0, 0.8823529, 1,
1.085242, 0.0900051, 0.6878453, 1, 0, 0.8745098, 1,
1.086972, -0.5216635, 1.537398, 1, 0, 0.8705882, 1,
1.088894, 0.2119319, 2.473489, 1, 0, 0.8627451, 1,
1.100394, -0.4316559, 1.848288, 1, 0, 0.8588235, 1,
1.104645, 0.5995612, 2.341208, 1, 0, 0.8509804, 1,
1.109785, 0.2961478, 0.6683806, 1, 0, 0.8470588, 1,
1.111026, -0.455123, 1.990542, 1, 0, 0.8392157, 1,
1.115712, -0.2226778, 3.711036, 1, 0, 0.8352941, 1,
1.121245, 0.07066367, -0.5509741, 1, 0, 0.827451, 1,
1.124896, 0.385426, -0.2604921, 1, 0, 0.8235294, 1,
1.130253, 0.5010034, -0.7574706, 1, 0, 0.8156863, 1,
1.131906, -0.798796, 1.85204, 1, 0, 0.8117647, 1,
1.138918, 0.6711618, 1.606331, 1, 0, 0.8039216, 1,
1.142653, -0.06284866, 0.4752043, 1, 0, 0.7960784, 1,
1.143787, -0.07923939, 2.478163, 1, 0, 0.7921569, 1,
1.14507, -1.588531, 1.402111, 1, 0, 0.7843137, 1,
1.145967, 1.138799, 0.3921906, 1, 0, 0.7803922, 1,
1.149088, 0.2045399, 0.874474, 1, 0, 0.772549, 1,
1.152021, 0.06974708, 1.737212, 1, 0, 0.7686275, 1,
1.160049, -0.1273867, -0.08445492, 1, 0, 0.7607843, 1,
1.169347, -1.988907, 2.131376, 1, 0, 0.7568628, 1,
1.169851, -0.09167954, 1.971123, 1, 0, 0.7490196, 1,
1.179834, 0.07899918, 3.32398, 1, 0, 0.7450981, 1,
1.194627, 0.2611089, 1.061881, 1, 0, 0.7372549, 1,
1.196049, -0.6100497, 2.383392, 1, 0, 0.7333333, 1,
1.200021, 0.8891418, 2.520448, 1, 0, 0.7254902, 1,
1.205556, 0.7094241, -0.3984286, 1, 0, 0.7215686, 1,
1.207703, -0.300139, 2.155753, 1, 0, 0.7137255, 1,
1.208819, 0.1485626, 1.715702, 1, 0, 0.7098039, 1,
1.218818, 0.868853, 0.7051045, 1, 0, 0.7019608, 1,
1.219623, 0.6963168, 1.322715, 1, 0, 0.6941177, 1,
1.220827, 0.618531, 0.4406974, 1, 0, 0.6901961, 1,
1.221779, 0.3371303, 0.8868794, 1, 0, 0.682353, 1,
1.23524, 0.396809, 1.281329, 1, 0, 0.6784314, 1,
1.259684, -0.05713165, 1.62306, 1, 0, 0.6705883, 1,
1.265098, -2.034187, 2.210625, 1, 0, 0.6666667, 1,
1.26527, -0.196293, 0.6772144, 1, 0, 0.6588235, 1,
1.270791, -0.6967844, 2.011969, 1, 0, 0.654902, 1,
1.279403, 2.220933, 0.5354564, 1, 0, 0.6470588, 1,
1.279725, 0.1985566, 1.434951, 1, 0, 0.6431373, 1,
1.284561, -0.7735873, 0.1912471, 1, 0, 0.6352941, 1,
1.296328, -0.7112867, 1.2893, 1, 0, 0.6313726, 1,
1.296974, 0.8196286, 0.566692, 1, 0, 0.6235294, 1,
1.300325, -0.1872617, 1.192825, 1, 0, 0.6196079, 1,
1.300567, -1.431778, 3.063302, 1, 0, 0.6117647, 1,
1.306096, -0.6302124, 1.30658, 1, 0, 0.6078432, 1,
1.309438, 2.818334, 0.7426139, 1, 0, 0.6, 1,
1.313237, 0.4193167, 2.383851, 1, 0, 0.5921569, 1,
1.319566, -0.1507075, 1.65596, 1, 0, 0.5882353, 1,
1.323837, -0.7309668, 3.71298, 1, 0, 0.5803922, 1,
1.32432, -0.592754, 1.789866, 1, 0, 0.5764706, 1,
1.333569, -0.3443315, 2.512436, 1, 0, 0.5686275, 1,
1.337372, -0.4587634, 3.760206, 1, 0, 0.5647059, 1,
1.346378, -0.5114195, -0.2319362, 1, 0, 0.5568628, 1,
1.358622, -1.165561, 3.014202, 1, 0, 0.5529412, 1,
1.365575, -0.78412, 0.9050092, 1, 0, 0.5450981, 1,
1.366359, -0.5263835, 1.386016, 1, 0, 0.5411765, 1,
1.388686, -0.8453392, 2.983721, 1, 0, 0.5333334, 1,
1.391686, 1.670679, 1.379153, 1, 0, 0.5294118, 1,
1.405006, -1.157241, 2.935713, 1, 0, 0.5215687, 1,
1.407553, 0.3106084, 2.484481, 1, 0, 0.5176471, 1,
1.412166, 0.1379619, 1.307308, 1, 0, 0.509804, 1,
1.416563, -0.3358201, 1.875977, 1, 0, 0.5058824, 1,
1.41677, -1.158337, 4.567083, 1, 0, 0.4980392, 1,
1.417225, 0.2297525, -0.1453795, 1, 0, 0.4901961, 1,
1.423877, 2.335883, 0.2121617, 1, 0, 0.4862745, 1,
1.425288, -0.7866398, 2.285144, 1, 0, 0.4784314, 1,
1.436213, -0.03599159, 3.739047, 1, 0, 0.4745098, 1,
1.442067, -1.793929, 2.266582, 1, 0, 0.4666667, 1,
1.452461, 0.2223012, 2.769165, 1, 0, 0.4627451, 1,
1.469408, 0.1867915, 1.379429, 1, 0, 0.454902, 1,
1.469759, 1.228225, 1.301774, 1, 0, 0.4509804, 1,
1.483642, 0.8206838, 1.916613, 1, 0, 0.4431373, 1,
1.498978, -0.08866012, 0.4852629, 1, 0, 0.4392157, 1,
1.505122, -1.415397, 0.843392, 1, 0, 0.4313726, 1,
1.515315, -1.136861, 1.945282, 1, 0, 0.427451, 1,
1.552598, -0.1857949, 1.628611, 1, 0, 0.4196078, 1,
1.557563, -1.440094, 2.852041, 1, 0, 0.4156863, 1,
1.558799, -0.02560573, 2.31508, 1, 0, 0.4078431, 1,
1.564412, -0.1995619, 2.594962, 1, 0, 0.4039216, 1,
1.579716, -0.3210353, 0.3531694, 1, 0, 0.3960784, 1,
1.597984, 1.243852, 0.251785, 1, 0, 0.3882353, 1,
1.607685, -0.236412, 0.210367, 1, 0, 0.3843137, 1,
1.608405, -1.671546, 3.090143, 1, 0, 0.3764706, 1,
1.614007, -0.4805491, 3.327045, 1, 0, 0.372549, 1,
1.615951, 0.4440335, 1.916711, 1, 0, 0.3647059, 1,
1.622444, 0.7397357, 1.337352, 1, 0, 0.3607843, 1,
1.628765, -1.310238, 0.8420979, 1, 0, 0.3529412, 1,
1.63123, 0.6199349, 2.182361, 1, 0, 0.3490196, 1,
1.649139, -0.9517878, 1.123279, 1, 0, 0.3411765, 1,
1.656732, -0.05832033, 1.972269, 1, 0, 0.3372549, 1,
1.660417, -0.1839884, 2.390483, 1, 0, 0.3294118, 1,
1.67859, 0.5996751, 1.287935, 1, 0, 0.3254902, 1,
1.696586, 0.5876998, 1.421629, 1, 0, 0.3176471, 1,
1.723879, 1.099114, 1.303108, 1, 0, 0.3137255, 1,
1.729607, 1.039095, 2.190499, 1, 0, 0.3058824, 1,
1.748876, 0.6267512, 0.06787694, 1, 0, 0.2980392, 1,
1.784745, 0.183761, 0.2542133, 1, 0, 0.2941177, 1,
1.78593, -1.313972, 1.974743, 1, 0, 0.2862745, 1,
1.78725, 0.05767266, 1.76506, 1, 0, 0.282353, 1,
1.795654, -0.4607645, 3.155316, 1, 0, 0.2745098, 1,
1.80297, -0.4924244, 2.207025, 1, 0, 0.2705882, 1,
1.808135, 0.0365403, 2.313762, 1, 0, 0.2627451, 1,
1.850417, -0.6232596, 3.362733, 1, 0, 0.2588235, 1,
1.863938, 0.4607349, 2.909164, 1, 0, 0.2509804, 1,
1.878699, -1.115149, 2.020227, 1, 0, 0.2470588, 1,
1.886363, -1.991258, 1.753296, 1, 0, 0.2392157, 1,
1.905839, 0.9788049, 0.8160556, 1, 0, 0.2352941, 1,
1.906533, 1.589278, 0.719092, 1, 0, 0.227451, 1,
1.921157, 0.1138164, 0.3031619, 1, 0, 0.2235294, 1,
1.935207, -0.299435, 1.921668, 1, 0, 0.2156863, 1,
1.939515, -0.8675632, 1.692716, 1, 0, 0.2117647, 1,
1.948996, 0.6236695, -0.1863869, 1, 0, 0.2039216, 1,
1.950179, -1.997539, 1.246983, 1, 0, 0.1960784, 1,
1.950784, 0.6565307, 2.973561, 1, 0, 0.1921569, 1,
1.963251, -1.930896, 4.4009, 1, 0, 0.1843137, 1,
1.968911, 0.5289373, 2.148003, 1, 0, 0.1803922, 1,
1.977131, -2.414159, 2.441481, 1, 0, 0.172549, 1,
1.980155, 0.6752819, 0.7229057, 1, 0, 0.1686275, 1,
1.980302, 1.428879, 1.123989, 1, 0, 0.1607843, 1,
1.98531, -0.162917, 1.856887, 1, 0, 0.1568628, 1,
1.992402, 0.7555067, 1.175626, 1, 0, 0.1490196, 1,
1.997222, 0.2440349, 0.8970481, 1, 0, 0.145098, 1,
2.002201, -0.6907093, 0.6801853, 1, 0, 0.1372549, 1,
2.022002, -0.7673899, 3.667248, 1, 0, 0.1333333, 1,
2.026532, -1.836874, 2.298604, 1, 0, 0.1254902, 1,
2.077169, -1.738149, 1.439544, 1, 0, 0.1215686, 1,
2.098967, 0.6356258, 1.582659, 1, 0, 0.1137255, 1,
2.132308, -1.760101, 2.999543, 1, 0, 0.1098039, 1,
2.143906, -0.3758536, 1.752118, 1, 0, 0.1019608, 1,
2.151091, -1.072477, 1.045852, 1, 0, 0.09411765, 1,
2.218829, -0.1543068, 0.8696744, 1, 0, 0.09019608, 1,
2.234149, 0.897909, 1.99617, 1, 0, 0.08235294, 1,
2.248821, 0.6238641, 0.8839293, 1, 0, 0.07843138, 1,
2.269262, 0.2837562, 3.258613, 1, 0, 0.07058824, 1,
2.330892, -1.053016, 3.497069, 1, 0, 0.06666667, 1,
2.504491, -0.382895, 2.25876, 1, 0, 0.05882353, 1,
2.518321, 0.6176879, 2.679369, 1, 0, 0.05490196, 1,
2.549691, 0.5112024, -0.05211285, 1, 0, 0.04705882, 1,
2.57333, -0.2759166, 1.656731, 1, 0, 0.04313726, 1,
2.589806, 0.5913787, 1.018565, 1, 0, 0.03529412, 1,
2.834121, -1.399769, 2.610522, 1, 0, 0.03137255, 1,
2.835745, -1.676364, 1.158429, 1, 0, 0.02352941, 1,
2.853667, -1.156882, 2.429511, 1, 0, 0.01960784, 1,
3.208543, -1.329685, 1.736562, 1, 0, 0.01176471, 1,
3.328121, -1.411563, 2.111207, 1, 0, 0.007843138, 1
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
0.2638201, -4.101454, -7.473859, 0, -0.5, 0.5, 0.5,
0.2638201, -4.101454, -7.473859, 1, -0.5, 0.5, 0.5,
0.2638201, -4.101454, -7.473859, 1, 1.5, 0.5, 0.5,
0.2638201, -4.101454, -7.473859, 0, 1.5, 0.5, 0.5
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
-3.839279, -0.0523088, -7.473859, 0, -0.5, 0.5, 0.5,
-3.839279, -0.0523088, -7.473859, 1, -0.5, 0.5, 0.5,
-3.839279, -0.0523088, -7.473859, 1, 1.5, 0.5, 0.5,
-3.839279, -0.0523088, -7.473859, 0, 1.5, 0.5, 0.5
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
-3.839279, -4.101454, -0.3544359, 0, -0.5, 0.5, 0.5,
-3.839279, -4.101454, -0.3544359, 1, -0.5, 0.5, 0.5,
-3.839279, -4.101454, -0.3544359, 1, 1.5, 0.5, 0.5,
-3.839279, -4.101454, -0.3544359, 0, 1.5, 0.5, 0.5
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
-2, -3.167036, -5.830915,
3, -3.167036, -5.830915,
-2, -3.167036, -5.830915,
-2, -3.322772, -6.104739,
-1, -3.167036, -5.830915,
-1, -3.322772, -6.104739,
0, -3.167036, -5.830915,
0, -3.322772, -6.104739,
1, -3.167036, -5.830915,
1, -3.322772, -6.104739,
2, -3.167036, -5.830915,
2, -3.322772, -6.104739,
3, -3.167036, -5.830915,
3, -3.322772, -6.104739
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
-2, -3.634245, -6.652387, 0, -0.5, 0.5, 0.5,
-2, -3.634245, -6.652387, 1, -0.5, 0.5, 0.5,
-2, -3.634245, -6.652387, 1, 1.5, 0.5, 0.5,
-2, -3.634245, -6.652387, 0, 1.5, 0.5, 0.5,
-1, -3.634245, -6.652387, 0, -0.5, 0.5, 0.5,
-1, -3.634245, -6.652387, 1, -0.5, 0.5, 0.5,
-1, -3.634245, -6.652387, 1, 1.5, 0.5, 0.5,
-1, -3.634245, -6.652387, 0, 1.5, 0.5, 0.5,
0, -3.634245, -6.652387, 0, -0.5, 0.5, 0.5,
0, -3.634245, -6.652387, 1, -0.5, 0.5, 0.5,
0, -3.634245, -6.652387, 1, 1.5, 0.5, 0.5,
0, -3.634245, -6.652387, 0, 1.5, 0.5, 0.5,
1, -3.634245, -6.652387, 0, -0.5, 0.5, 0.5,
1, -3.634245, -6.652387, 1, -0.5, 0.5, 0.5,
1, -3.634245, -6.652387, 1, 1.5, 0.5, 0.5,
1, -3.634245, -6.652387, 0, 1.5, 0.5, 0.5,
2, -3.634245, -6.652387, 0, -0.5, 0.5, 0.5,
2, -3.634245, -6.652387, 1, -0.5, 0.5, 0.5,
2, -3.634245, -6.652387, 1, 1.5, 0.5, 0.5,
2, -3.634245, -6.652387, 0, 1.5, 0.5, 0.5,
3, -3.634245, -6.652387, 0, -0.5, 0.5, 0.5,
3, -3.634245, -6.652387, 1, -0.5, 0.5, 0.5,
3, -3.634245, -6.652387, 1, 1.5, 0.5, 0.5,
3, -3.634245, -6.652387, 0, 1.5, 0.5, 0.5
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
-2.89241, -3, -5.830915,
-2.89241, 2, -5.830915,
-2.89241, -3, -5.830915,
-3.050222, -3, -6.104739,
-2.89241, -2, -5.830915,
-3.050222, -2, -6.104739,
-2.89241, -1, -5.830915,
-3.050222, -1, -6.104739,
-2.89241, 0, -5.830915,
-3.050222, 0, -6.104739,
-2.89241, 1, -5.830915,
-3.050222, 1, -6.104739,
-2.89241, 2, -5.830915,
-3.050222, 2, -6.104739
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
-3.365845, -3, -6.652387, 0, -0.5, 0.5, 0.5,
-3.365845, -3, -6.652387, 1, -0.5, 0.5, 0.5,
-3.365845, -3, -6.652387, 1, 1.5, 0.5, 0.5,
-3.365845, -3, -6.652387, 0, 1.5, 0.5, 0.5,
-3.365845, -2, -6.652387, 0, -0.5, 0.5, 0.5,
-3.365845, -2, -6.652387, 1, -0.5, 0.5, 0.5,
-3.365845, -2, -6.652387, 1, 1.5, 0.5, 0.5,
-3.365845, -2, -6.652387, 0, 1.5, 0.5, 0.5,
-3.365845, -1, -6.652387, 0, -0.5, 0.5, 0.5,
-3.365845, -1, -6.652387, 1, -0.5, 0.5, 0.5,
-3.365845, -1, -6.652387, 1, 1.5, 0.5, 0.5,
-3.365845, -1, -6.652387, 0, 1.5, 0.5, 0.5,
-3.365845, 0, -6.652387, 0, -0.5, 0.5, 0.5,
-3.365845, 0, -6.652387, 1, -0.5, 0.5, 0.5,
-3.365845, 0, -6.652387, 1, 1.5, 0.5, 0.5,
-3.365845, 0, -6.652387, 0, 1.5, 0.5, 0.5,
-3.365845, 1, -6.652387, 0, -0.5, 0.5, 0.5,
-3.365845, 1, -6.652387, 1, -0.5, 0.5, 0.5,
-3.365845, 1, -6.652387, 1, 1.5, 0.5, 0.5,
-3.365845, 1, -6.652387, 0, 1.5, 0.5, 0.5,
-3.365845, 2, -6.652387, 0, -0.5, 0.5, 0.5,
-3.365845, 2, -6.652387, 1, -0.5, 0.5, 0.5,
-3.365845, 2, -6.652387, 1, 1.5, 0.5, 0.5,
-3.365845, 2, -6.652387, 0, 1.5, 0.5, 0.5
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
-2.89241, -3.167036, -4,
-2.89241, -3.167036, 4,
-2.89241, -3.167036, -4,
-3.050222, -3.322772, -4,
-2.89241, -3.167036, -2,
-3.050222, -3.322772, -2,
-2.89241, -3.167036, 0,
-3.050222, -3.322772, 0,
-2.89241, -3.167036, 2,
-3.050222, -3.322772, 2,
-2.89241, -3.167036, 4,
-3.050222, -3.322772, 4
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
-3.365845, -3.634245, -4, 0, -0.5, 0.5, 0.5,
-3.365845, -3.634245, -4, 1, -0.5, 0.5, 0.5,
-3.365845, -3.634245, -4, 1, 1.5, 0.5, 0.5,
-3.365845, -3.634245, -4, 0, 1.5, 0.5, 0.5,
-3.365845, -3.634245, -2, 0, -0.5, 0.5, 0.5,
-3.365845, -3.634245, -2, 1, -0.5, 0.5, 0.5,
-3.365845, -3.634245, -2, 1, 1.5, 0.5, 0.5,
-3.365845, -3.634245, -2, 0, 1.5, 0.5, 0.5,
-3.365845, -3.634245, 0, 0, -0.5, 0.5, 0.5,
-3.365845, -3.634245, 0, 1, -0.5, 0.5, 0.5,
-3.365845, -3.634245, 0, 1, 1.5, 0.5, 0.5,
-3.365845, -3.634245, 0, 0, 1.5, 0.5, 0.5,
-3.365845, -3.634245, 2, 0, -0.5, 0.5, 0.5,
-3.365845, -3.634245, 2, 1, -0.5, 0.5, 0.5,
-3.365845, -3.634245, 2, 1, 1.5, 0.5, 0.5,
-3.365845, -3.634245, 2, 0, 1.5, 0.5, 0.5,
-3.365845, -3.634245, 4, 0, -0.5, 0.5, 0.5,
-3.365845, -3.634245, 4, 1, -0.5, 0.5, 0.5,
-3.365845, -3.634245, 4, 1, 1.5, 0.5, 0.5,
-3.365845, -3.634245, 4, 0, 1.5, 0.5, 0.5
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
-2.89241, -3.167036, -5.830915,
-2.89241, 3.062418, -5.830915,
-2.89241, -3.167036, 5.122044,
-2.89241, 3.062418, 5.122044,
-2.89241, -3.167036, -5.830915,
-2.89241, -3.167036, 5.122044,
-2.89241, 3.062418, -5.830915,
-2.89241, 3.062418, 5.122044,
-2.89241, -3.167036, -5.830915,
3.42005, -3.167036, -5.830915,
-2.89241, -3.167036, 5.122044,
3.42005, -3.167036, 5.122044,
-2.89241, 3.062418, -5.830915,
3.42005, 3.062418, -5.830915,
-2.89241, 3.062418, 5.122044,
3.42005, 3.062418, 5.122044,
3.42005, -3.167036, -5.830915,
3.42005, 3.062418, -5.830915,
3.42005, -3.167036, 5.122044,
3.42005, 3.062418, 5.122044,
3.42005, -3.167036, -5.830915,
3.42005, -3.167036, 5.122044,
3.42005, 3.062418, -5.830915,
3.42005, 3.062418, 5.122044
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
var radius = 7.525538;
var distance = 33.48197;
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
mvMatrix.translate( -0.2638201, 0.0523088, 0.3544359 );
mvMatrix.scale( 1.289, 1.306175, 0.7428823 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.48197);
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
dodecylguanidine_mon<-read.table("dodecylguanidine_mon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dodecylguanidine_mon$V2
```

```
## Error in eval(expr, envir, enclos): object 'dodecylguanidine_mon' not found
```

```r
y<-dodecylguanidine_mon$V3
```

```
## Error in eval(expr, envir, enclos): object 'dodecylguanidine_mon' not found
```

```r
z<-dodecylguanidine_mon$V4
```

```
## Error in eval(expr, envir, enclos): object 'dodecylguanidine_mon' not found
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
-2.800481, 0.8260728, -0.04779416, 0, 0, 1, 1, 1,
-2.598572, 0.7704594, -1.419697, 1, 0, 0, 1, 1,
-2.573813, 0.5979086, 0.3256176, 1, 0, 0, 1, 1,
-2.482264, 1.797613, 0.4642501, 1, 0, 0, 1, 1,
-2.425139, -1.924881, -3.167887, 1, 0, 0, 1, 1,
-2.385623, -0.7294633, -2.404154, 1, 0, 0, 1, 1,
-2.344953, 0.2206479, -1.016997, 0, 0, 0, 1, 1,
-2.294498, -0.4050271, -3.038758, 0, 0, 0, 1, 1,
-2.215453, 0.9733363, -0.2422226, 0, 0, 0, 1, 1,
-2.198071, 0.8469334, -0.777716, 0, 0, 0, 1, 1,
-2.165429, -0.6633339, -0.4638691, 0, 0, 0, 1, 1,
-2.152345, -0.3930631, -2.134161, 0, 0, 0, 1, 1,
-2.077393, -0.7776951, -3.151334, 0, 0, 0, 1, 1,
-2.074823, -0.7592265, -3.477446, 1, 1, 1, 1, 1,
-2.067038, 0.3294949, -0.04876858, 1, 1, 1, 1, 1,
-2.049577, 1.664447, -0.2784843, 1, 1, 1, 1, 1,
-2.044741, -0.9109556, -2.029017, 1, 1, 1, 1, 1,
-1.957052, 0.5384859, 0.6861246, 1, 1, 1, 1, 1,
-1.91489, 0.745752, -2.710428, 1, 1, 1, 1, 1,
-1.905479, 0.8462557, -0.2415521, 1, 1, 1, 1, 1,
-1.895605, -1.012728, -0.6358832, 1, 1, 1, 1, 1,
-1.88121, 0.2210728, -1.927698, 1, 1, 1, 1, 1,
-1.859425, 1.294374, -0.4623139, 1, 1, 1, 1, 1,
-1.850052, -0.1315074, -1.227665, 1, 1, 1, 1, 1,
-1.843673, -2.352315, -3.34673, 1, 1, 1, 1, 1,
-1.842867, 1.835868, -0.7385691, 1, 1, 1, 1, 1,
-1.837127, -0.9708458, -0.7479974, 1, 1, 1, 1, 1,
-1.835848, -2.129488, -0.6814241, 1, 1, 1, 1, 1,
-1.829148, -0.9076259, -3.035438, 0, 0, 1, 1, 1,
-1.814711, 1.189651, 1.289984, 1, 0, 0, 1, 1,
-1.803061, -0.296074, -2.352087, 1, 0, 0, 1, 1,
-1.796328, 0.1884979, -1.651028, 1, 0, 0, 1, 1,
-1.796316, -0.6643213, -0.8908818, 1, 0, 0, 1, 1,
-1.794843, 0.09520755, 0.02726275, 1, 0, 0, 1, 1,
-1.77729, -1.307274, -2.429103, 0, 0, 0, 1, 1,
-1.770301, -1.000668, -2.41012, 0, 0, 0, 1, 1,
-1.759981, -2.526134, -1.423725, 0, 0, 0, 1, 1,
-1.755408, 0.6853443, -1.999074, 0, 0, 0, 1, 1,
-1.748663, 1.00314, 0.2727094, 0, 0, 0, 1, 1,
-1.737022, -1.6475, -4.029761, 0, 0, 0, 1, 1,
-1.727251, 0.6378343, -2.457179, 0, 0, 0, 1, 1,
-1.717653, 0.2169506, -0.9858729, 1, 1, 1, 1, 1,
-1.710524, -1.340774, -1.370264, 1, 1, 1, 1, 1,
-1.69218, 1.253518, -1.069976, 1, 1, 1, 1, 1,
-1.689231, 0.8881537, -0.9558419, 1, 1, 1, 1, 1,
-1.684005, 0.9490096, -1.398287, 1, 1, 1, 1, 1,
-1.681334, 0.2405207, 0.8437292, 1, 1, 1, 1, 1,
-1.670556, 0.4682975, -2.695549, 1, 1, 1, 1, 1,
-1.660146, 0.3410726, -2.878399, 1, 1, 1, 1, 1,
-1.655094, 0.5822273, -0.9218, 1, 1, 1, 1, 1,
-1.652234, 0.1323136, -3.217691, 1, 1, 1, 1, 1,
-1.647484, 0.9572702, -1.078249, 1, 1, 1, 1, 1,
-1.643814, -0.08907352, -2.005673, 1, 1, 1, 1, 1,
-1.629804, 0.5463602, 0.2103531, 1, 1, 1, 1, 1,
-1.621882, -0.2739941, -1.052683, 1, 1, 1, 1, 1,
-1.621333, -0.6179938, 0.06567274, 1, 1, 1, 1, 1,
-1.620596, 1.7377, -1.06087, 0, 0, 1, 1, 1,
-1.619201, -0.1756741, -2.618752, 1, 0, 0, 1, 1,
-1.601168, 1.164102, 0.4492022, 1, 0, 0, 1, 1,
-1.59199, 0.5120423, -0.6214087, 1, 0, 0, 1, 1,
-1.583956, 1.752908, -0.454537, 1, 0, 0, 1, 1,
-1.583458, -1.278929, -2.760479, 1, 0, 0, 1, 1,
-1.582356, 0.5208695, 0.4494886, 0, 0, 0, 1, 1,
-1.58057, 0.03855497, -0.6768495, 0, 0, 0, 1, 1,
-1.578194, -1.285793, -3.309023, 0, 0, 0, 1, 1,
-1.569254, 0.5122315, -2.543086, 0, 0, 0, 1, 1,
-1.563587, -1.11183, -1.324269, 0, 0, 0, 1, 1,
-1.563216, -1.42259, -2.969317, 0, 0, 0, 1, 1,
-1.556437, -1.572739, -2.871464, 0, 0, 0, 1, 1,
-1.545474, 0.2954169, -3.285458, 1, 1, 1, 1, 1,
-1.544819, -2.452945, -2.226509, 1, 1, 1, 1, 1,
-1.528159, 1.357625, -0.08824468, 1, 1, 1, 1, 1,
-1.519631, -0.8070639, -1.93554, 1, 1, 1, 1, 1,
-1.514355, -1.997516, -0.9785266, 1, 1, 1, 1, 1,
-1.502302, 0.265387, 0.3332264, 1, 1, 1, 1, 1,
-1.499013, 0.5060586, -1.509899, 1, 1, 1, 1, 1,
-1.488577, -0.02588088, -1.958581, 1, 1, 1, 1, 1,
-1.478895, -0.2392014, -2.093845, 1, 1, 1, 1, 1,
-1.478267, -0.2623433, -1.290539, 1, 1, 1, 1, 1,
-1.474095, -1.311294, -2.95217, 1, 1, 1, 1, 1,
-1.47397, -0.2762838, -2.960265, 1, 1, 1, 1, 1,
-1.468358, 1.462316, -1.701565, 1, 1, 1, 1, 1,
-1.467663, 0.0689792, -1.698224, 1, 1, 1, 1, 1,
-1.454611, 2.148031, -2.072065, 1, 1, 1, 1, 1,
-1.450938, 0.3082872, -2.51511, 0, 0, 1, 1, 1,
-1.448706, 0.8228524, -1.456012, 1, 0, 0, 1, 1,
-1.438019, 0.2191827, -2.195612, 1, 0, 0, 1, 1,
-1.400796, -2.367221, -2.38742, 1, 0, 0, 1, 1,
-1.39725, 0.1493167, -0.8184212, 1, 0, 0, 1, 1,
-1.393511, 0.198149, -1.324686, 1, 0, 0, 1, 1,
-1.378535, 0.2375423, -1.928921, 0, 0, 0, 1, 1,
-1.359657, 0.6333342, 0.3206742, 0, 0, 0, 1, 1,
-1.358012, 1.071104, -2.740114, 0, 0, 0, 1, 1,
-1.356917, -1.11672, -1.77487, 0, 0, 0, 1, 1,
-1.339648, -0.1864278, -3.018938, 0, 0, 0, 1, 1,
-1.33343, 1.209882, -0.07161427, 0, 0, 0, 1, 1,
-1.331226, -0.1585248, -0.4292507, 0, 0, 0, 1, 1,
-1.330275, 1.161307, -0.03233684, 1, 1, 1, 1, 1,
-1.329004, -0.731904, -2.195936, 1, 1, 1, 1, 1,
-1.315393, 0.1358642, -2.327891, 1, 1, 1, 1, 1,
-1.311117, 1.348886, -0.8004997, 1, 1, 1, 1, 1,
-1.285624, 0.5068069, -1.018347, 1, 1, 1, 1, 1,
-1.282929, -0.2820502, -3.153609, 1, 1, 1, 1, 1,
-1.26472, -0.7422541, -1.297009, 1, 1, 1, 1, 1,
-1.262222, -0.5641281, -3.342156, 1, 1, 1, 1, 1,
-1.255576, 0.8868061, -0.176963, 1, 1, 1, 1, 1,
-1.247526, 0.5091329, -1.596345, 1, 1, 1, 1, 1,
-1.24525, 0.02741543, -2.580459, 1, 1, 1, 1, 1,
-1.240236, -0.2991713, -3.005875, 1, 1, 1, 1, 1,
-1.238813, 0.319908, 0.09620266, 1, 1, 1, 1, 1,
-1.232681, -1.197185, -2.806651, 1, 1, 1, 1, 1,
-1.229976, 0.254665, -1.467898, 1, 1, 1, 1, 1,
-1.226933, -0.4649179, -2.456952, 0, 0, 1, 1, 1,
-1.223519, 1.22668, -0.2730332, 1, 0, 0, 1, 1,
-1.222489, -1.808969, -0.5382618, 1, 0, 0, 1, 1,
-1.219797, 0.2087029, -2.756112, 1, 0, 0, 1, 1,
-1.216846, 0.6701688, -1.383327, 1, 0, 0, 1, 1,
-1.216228, -1.264747, -0.3311903, 1, 0, 0, 1, 1,
-1.209521, 0.6738037, -0.2737243, 0, 0, 0, 1, 1,
-1.206245, 0.7524365, 0.2887677, 0, 0, 0, 1, 1,
-1.196907, 0.8406187, -0.6463221, 0, 0, 0, 1, 1,
-1.194462, 0.3821906, -0.5343255, 0, 0, 0, 1, 1,
-1.188751, -0.3646815, -2.578212, 0, 0, 0, 1, 1,
-1.181641, 0.8632886, -0.98521, 0, 0, 0, 1, 1,
-1.177906, 0.4580658, -1.029523, 0, 0, 0, 1, 1,
-1.174409, -3.05467, -3.677687, 1, 1, 1, 1, 1,
-1.165848, -0.8617036, -3.726292, 1, 1, 1, 1, 1,
-1.157224, -0.6318027, -2.256634, 1, 1, 1, 1, 1,
-1.155468, 2.062356, 0.716674, 1, 1, 1, 1, 1,
-1.153986, 0.9106101, -0.3907313, 1, 1, 1, 1, 1,
-1.143792, -0.358269, -1.456194, 1, 1, 1, 1, 1,
-1.136331, 0.2907662, -0.840412, 1, 1, 1, 1, 1,
-1.132156, -0.5264378, -1.963881, 1, 1, 1, 1, 1,
-1.131434, -0.08135855, -0.7628626, 1, 1, 1, 1, 1,
-1.130513, -1.886647, -4.010683, 1, 1, 1, 1, 1,
-1.113942, -0.46453, -0.6041775, 1, 1, 1, 1, 1,
-1.102645, -1.070186, -5.17936, 1, 1, 1, 1, 1,
-1.100106, -0.6510921, -0.7358665, 1, 1, 1, 1, 1,
-1.097611, -0.703871, -1.77775, 1, 1, 1, 1, 1,
-1.09401, 0.5740884, 0.0164378, 1, 1, 1, 1, 1,
-1.092992, -1.879674, -2.511608, 0, 0, 1, 1, 1,
-1.089734, -0.749848, -1.314201, 1, 0, 0, 1, 1,
-1.088906, 0.1789164, -0.9660941, 1, 0, 0, 1, 1,
-1.080633, -1.260695, -4.108232, 1, 0, 0, 1, 1,
-1.079586, 0.6493633, 0.1389292, 1, 0, 0, 1, 1,
-1.066415, 0.6960079, -0.3363769, 1, 0, 0, 1, 1,
-1.065814, 0.738225, 0.01002793, 0, 0, 0, 1, 1,
-1.060008, 1.535492, -1.636177, 0, 0, 0, 1, 1,
-1.05726, 1.870364, -1.094389, 0, 0, 0, 1, 1,
-1.044136, -0.8018412, -2.550776, 0, 0, 0, 1, 1,
-1.041012, 2.581573, -0.6002452, 0, 0, 0, 1, 1,
-1.036681, -0.2283239, -1.059182, 0, 0, 0, 1, 1,
-1.035016, 0.4948419, -1.07977, 0, 0, 0, 1, 1,
-1.027187, -0.2813589, -3.336523, 1, 1, 1, 1, 1,
-1.024345, 0.2011129, -0.6407993, 1, 1, 1, 1, 1,
-1.021746, 0.1895126, -1.28621, 1, 1, 1, 1, 1,
-1.018835, -1.621711, -3.011403, 1, 1, 1, 1, 1,
-1.014492, -0.6643605, -2.481874, 1, 1, 1, 1, 1,
-1.0112, -0.6457576, -2.926067, 1, 1, 1, 1, 1,
-1.003606, -0.7526649, -2.609726, 1, 1, 1, 1, 1,
-1.000863, 1.636973, -0.1522526, 1, 1, 1, 1, 1,
-0.9980435, -2.186201, -2.794394, 1, 1, 1, 1, 1,
-0.9943082, -0.236934, -1.927598, 1, 1, 1, 1, 1,
-0.9921522, 0.2762233, -2.792237, 1, 1, 1, 1, 1,
-0.9849092, 0.217846, -2.428919, 1, 1, 1, 1, 1,
-0.976221, 1.540481, -0.1013271, 1, 1, 1, 1, 1,
-0.9694958, -0.002681014, -2.850625, 1, 1, 1, 1, 1,
-0.9616627, 0.3840123, 0.1093015, 1, 1, 1, 1, 1,
-0.9571258, 0.4118591, -2.194852, 0, 0, 1, 1, 1,
-0.9523622, -0.8064329, -3.908126, 1, 0, 0, 1, 1,
-0.9504354, 0.1002221, -1.551644, 1, 0, 0, 1, 1,
-0.9464109, -1.653887, -2.409414, 1, 0, 0, 1, 1,
-0.9440838, 2.196245, -1.450657, 1, 0, 0, 1, 1,
-0.9421195, 0.495932, 0.8292283, 1, 0, 0, 1, 1,
-0.9321979, -1.943932, -2.739757, 0, 0, 0, 1, 1,
-0.9264975, -0.4373949, -0.7742373, 0, 0, 0, 1, 1,
-0.9248314, -0.2660631, -2.351083, 0, 0, 0, 1, 1,
-0.9225434, 1.18751, -2.516963, 0, 0, 0, 1, 1,
-0.9200895, -0.7643239, -0.6332998, 0, 0, 0, 1, 1,
-0.9063591, 0.3701538, -0.726449, 0, 0, 0, 1, 1,
-0.9059792, 1.133617, 1.029401, 0, 0, 0, 1, 1,
-0.9008253, 0.09782077, -2.424841, 1, 1, 1, 1, 1,
-0.9001933, -2.607773, -1.887779, 1, 1, 1, 1, 1,
-0.8850279, -0.2087582, -2.995602, 1, 1, 1, 1, 1,
-0.8835822, -0.9094329, -3.503791, 1, 1, 1, 1, 1,
-0.8797255, 0.4432883, -0.6457052, 1, 1, 1, 1, 1,
-0.8764763, 0.8372477, -1.098789, 1, 1, 1, 1, 1,
-0.8728195, -0.8719727, -2.765548, 1, 1, 1, 1, 1,
-0.8618857, 0.1196139, -3.0469, 1, 1, 1, 1, 1,
-0.8616678, -0.7251769, -2.927252, 1, 1, 1, 1, 1,
-0.8538049, 0.1594122, -2.206081, 1, 1, 1, 1, 1,
-0.8395471, -0.7777648, -2.541789, 1, 1, 1, 1, 1,
-0.8389378, 0.08661544, -0.795976, 1, 1, 1, 1, 1,
-0.8384075, 1.02957, -2.425776, 1, 1, 1, 1, 1,
-0.829045, -0.3584465, -3.972266, 1, 1, 1, 1, 1,
-0.8264315, -1.782187, -1.815009, 1, 1, 1, 1, 1,
-0.8221048, -1.380848, -2.369533, 0, 0, 1, 1, 1,
-0.8213617, -0.9975768, -2.923776, 1, 0, 0, 1, 1,
-0.8166855, -0.3684511, -1.741096, 1, 0, 0, 1, 1,
-0.8115445, 0.7882829, -0.4461198, 1, 0, 0, 1, 1,
-0.8108359, 0.3535271, 0.9501558, 1, 0, 0, 1, 1,
-0.8056692, -1.223652, -2.727244, 1, 0, 0, 1, 1,
-0.805034, -1.513082, -2.960939, 0, 0, 0, 1, 1,
-0.8004975, 0.2131684, -0.8697959, 0, 0, 0, 1, 1,
-0.7998674, -1.563827, -2.95709, 0, 0, 0, 1, 1,
-0.7944155, -0.7800617, -2.436337, 0, 0, 0, 1, 1,
-0.7892622, 0.9493672, -0.2805581, 0, 0, 0, 1, 1,
-0.786244, -1.368644, -3.880244, 0, 0, 0, 1, 1,
-0.783563, -0.7888339, -1.629821, 0, 0, 0, 1, 1,
-0.7806734, -1.590919, -2.363487, 1, 1, 1, 1, 1,
-0.7800289, 0.3543101, 0.5428542, 1, 1, 1, 1, 1,
-0.7789931, -0.4204998, -2.003134, 1, 1, 1, 1, 1,
-0.7745767, 1.835431, 0.04461831, 1, 1, 1, 1, 1,
-0.7632242, 1.099371, -0.9645085, 1, 1, 1, 1, 1,
-0.7628529, 0.1072349, -2.488436, 1, 1, 1, 1, 1,
-0.7588968, 0.5637363, 0.5786211, 1, 1, 1, 1, 1,
-0.7513644, 0.7037242, 0.4793266, 1, 1, 1, 1, 1,
-0.7508909, -1.548135, -3.046189, 1, 1, 1, 1, 1,
-0.7485168, -1.384888, -3.277063, 1, 1, 1, 1, 1,
-0.745721, -0.3015093, -1.306008, 1, 1, 1, 1, 1,
-0.7456577, -2.232883, -1.384758, 1, 1, 1, 1, 1,
-0.7437875, -0.2364749, -3.232294, 1, 1, 1, 1, 1,
-0.7422774, -0.6197833, -1.357196, 1, 1, 1, 1, 1,
-0.7417278, -1.089043, -2.869235, 1, 1, 1, 1, 1,
-0.7390757, 0.2593725, -0.4157882, 0, 0, 1, 1, 1,
-0.7385135, -1.390995, -1.452489, 1, 0, 0, 1, 1,
-0.7216496, 1.355407, 0.4407539, 1, 0, 0, 1, 1,
-0.7162958, 2.427445, 0.1619712, 1, 0, 0, 1, 1,
-0.7134387, -1.102245, -2.243719, 1, 0, 0, 1, 1,
-0.7118764, 0.4677742, -1.331154, 1, 0, 0, 1, 1,
-0.7104149, -0.4017216, -2.431814, 0, 0, 0, 1, 1,
-0.7069795, 1.637401, -1.505687, 0, 0, 0, 1, 1,
-0.7043158, 0.8422801, -1.80308, 0, 0, 0, 1, 1,
-0.7019833, 0.7942573, -1.433393, 0, 0, 0, 1, 1,
-0.7002617, -0.4513013, -3.37081, 0, 0, 0, 1, 1,
-0.6981695, 0.2008193, -1.09439, 0, 0, 0, 1, 1,
-0.6902373, -0.735536, -3.476488, 0, 0, 0, 1, 1,
-0.6893794, 0.1961722, -1.993565, 1, 1, 1, 1, 1,
-0.689197, 0.4245842, 0.2968652, 1, 1, 1, 1, 1,
-0.6852241, -0.6696237, -1.187162, 1, 1, 1, 1, 1,
-0.6817283, 1.22421, -0.2984745, 1, 1, 1, 1, 1,
-0.6809731, -0.8342676, -2.469731, 1, 1, 1, 1, 1,
-0.6759313, 1.415348, -0.6607516, 1, 1, 1, 1, 1,
-0.6726736, -0.3494449, -2.064439, 1, 1, 1, 1, 1,
-0.6685712, 0.1071847, -1.660112, 1, 1, 1, 1, 1,
-0.66601, 0.7476186, -0.02289017, 1, 1, 1, 1, 1,
-0.6656523, 1.16415, -0.4646855, 1, 1, 1, 1, 1,
-0.6565765, 0.4721714, -1.553695, 1, 1, 1, 1, 1,
-0.6559631, 0.1653165, -0.6738566, 1, 1, 1, 1, 1,
-0.6541457, -0.2335158, -1.318676, 1, 1, 1, 1, 1,
-0.6485004, 0.06612815, 0.2854486, 1, 1, 1, 1, 1,
-0.6463494, -1.022957, -3.073395, 1, 1, 1, 1, 1,
-0.6389288, 0.08545198, -1.401753, 0, 0, 1, 1, 1,
-0.6376346, 1.482387, 1.42179, 1, 0, 0, 1, 1,
-0.6330891, 0.1199944, -2.539203, 1, 0, 0, 1, 1,
-0.6276023, 0.373572, 0.007498969, 1, 0, 0, 1, 1,
-0.6273207, -2.312092, -3.69288, 1, 0, 0, 1, 1,
-0.6257666, -0.608156, -1.427266, 1, 0, 0, 1, 1,
-0.6243263, -0.2840296, -4.54765, 0, 0, 0, 1, 1,
-0.6217812, 0.6278397, 0.1655941, 0, 0, 0, 1, 1,
-0.6212413, 0.6500628, -3.297525, 0, 0, 0, 1, 1,
-0.6078288, 1.0256, 0.8206988, 0, 0, 0, 1, 1,
-0.607385, 0.5876955, 0.7729111, 0, 0, 0, 1, 1,
-0.6069098, 0.09912083, -0.00721481, 0, 0, 0, 1, 1,
-0.6005786, -0.3488398, -1.956136, 0, 0, 0, 1, 1,
-0.5951226, -0.6952447, -0.9700996, 1, 1, 1, 1, 1,
-0.5948, 0.737681, -0.3098325, 1, 1, 1, 1, 1,
-0.5868784, 0.7439951, 1.156023, 1, 1, 1, 1, 1,
-0.5836895, -0.8390001, -3.796281, 1, 1, 1, 1, 1,
-0.5755564, 1.246365, -0.009240991, 1, 1, 1, 1, 1,
-0.5735524, 1.371962, -0.8972891, 1, 1, 1, 1, 1,
-0.5656935, -0.08915454, -2.230686, 1, 1, 1, 1, 1,
-0.5632613, -0.6351479, -2.657321, 1, 1, 1, 1, 1,
-0.5619925, 0.3423789, -0.06309068, 1, 1, 1, 1, 1,
-0.5605598, 1.149726, 0.5730973, 1, 1, 1, 1, 1,
-0.5568554, -0.6403156, -2.10579, 1, 1, 1, 1, 1,
-0.5509281, -0.2789196, -1.165784, 1, 1, 1, 1, 1,
-0.5461895, -1.686234, -1.347694, 1, 1, 1, 1, 1,
-0.5410973, 0.5176375, -0.7526801, 1, 1, 1, 1, 1,
-0.5387019, 1.424677, -0.8648793, 1, 1, 1, 1, 1,
-0.5292919, 1.597959, 1.825384, 0, 0, 1, 1, 1,
-0.5291598, 0.15763, -1.997127, 1, 0, 0, 1, 1,
-0.5274088, -0.1238871, -0.8431035, 1, 0, 0, 1, 1,
-0.5248976, 0.06558817, -0.6720653, 1, 0, 0, 1, 1,
-0.5239608, 0.2052498, -0.1346368, 1, 0, 0, 1, 1,
-0.5233769, 0.333537, 0.1490811, 1, 0, 0, 1, 1,
-0.5226653, -0.8185412, -3.007164, 0, 0, 0, 1, 1,
-0.5192859, 1.883106, -1.129524, 0, 0, 0, 1, 1,
-0.5187017, 0.07373109, -0.3441474, 0, 0, 0, 1, 1,
-0.5162852, -0.1761464, -0.7301408, 0, 0, 0, 1, 1,
-0.5020254, 0.7365624, 0.04717757, 0, 0, 0, 1, 1,
-0.5015039, 1.719404, 0.2098088, 0, 0, 0, 1, 1,
-0.4997641, 0.6278331, 0.240559, 0, 0, 0, 1, 1,
-0.4968598, -0.3571557, -3.245463, 1, 1, 1, 1, 1,
-0.4957968, 0.6087158, 0.549021, 1, 1, 1, 1, 1,
-0.494542, 1.238156, 0.2660471, 1, 1, 1, 1, 1,
-0.4927365, 0.9826892, -0.9335585, 1, 1, 1, 1, 1,
-0.4906668, 0.2131754, 0.02625813, 1, 1, 1, 1, 1,
-0.4893507, -0.5494648, -2.354601, 1, 1, 1, 1, 1,
-0.4886241, -0.6613345, -3.807437, 1, 1, 1, 1, 1,
-0.48105, 0.2486089, -1.11111, 1, 1, 1, 1, 1,
-0.4791249, -2.029051, -3.556677, 1, 1, 1, 1, 1,
-0.478819, -0.4648686, -2.98261, 1, 1, 1, 1, 1,
-0.477088, -2.726789, -3.003399, 1, 1, 1, 1, 1,
-0.4702932, 0.2071699, 0.07140674, 1, 1, 1, 1, 1,
-0.4694886, -0.06191299, -1.720939, 1, 1, 1, 1, 1,
-0.4643162, 0.8726789, -1.544946, 1, 1, 1, 1, 1,
-0.4603037, -0.5017503, -2.361918, 1, 1, 1, 1, 1,
-0.4530544, -2.012291, -4.521869, 0, 0, 1, 1, 1,
-0.4473854, 2.109781, -1.97015, 1, 0, 0, 1, 1,
-0.4461372, -1.513562, -2.945321, 1, 0, 0, 1, 1,
-0.4447534, 1.205494, -0.03611868, 1, 0, 0, 1, 1,
-0.442568, -0.4480523, -2.630109, 1, 0, 0, 1, 1,
-0.4420595, 1.495037, -0.04013532, 1, 0, 0, 1, 1,
-0.4391858, -2.15861, -0.5047117, 0, 0, 0, 1, 1,
-0.43557, -0.05352829, -4.460114, 0, 0, 0, 1, 1,
-0.4348556, 0.6527157, -3.446233, 0, 0, 0, 1, 1,
-0.4242862, -1.163077, -2.182491, 0, 0, 0, 1, 1,
-0.4233195, 0.183678, -2.799258, 0, 0, 0, 1, 1,
-0.4208612, -1.070131, -1.439861, 0, 0, 0, 1, 1,
-0.4198518, 1.031522, 1.38361, 0, 0, 0, 1, 1,
-0.413555, -0.3400345, -2.388715, 1, 1, 1, 1, 1,
-0.4105741, 0.4516219, -0.1717352, 1, 1, 1, 1, 1,
-0.4074249, 0.2105647, -2.636194, 1, 1, 1, 1, 1,
-0.4072021, 0.6635695, -0.3896133, 1, 1, 1, 1, 1,
-0.4048694, -0.8579718, -2.546753, 1, 1, 1, 1, 1,
-0.4023201, 0.7889515, -1.496004, 1, 1, 1, 1, 1,
-0.4010229, -1.675372, -3.920035, 1, 1, 1, 1, 1,
-0.4008955, 0.6039108, 0.08309972, 1, 1, 1, 1, 1,
-0.3994908, 0.1003565, -0.8313155, 1, 1, 1, 1, 1,
-0.3953433, 0.09516061, -1.965523, 1, 1, 1, 1, 1,
-0.3922638, -1.965863, -3.944886, 1, 1, 1, 1, 1,
-0.3877668, 0.8808597, -1.356165, 1, 1, 1, 1, 1,
-0.3831496, -1.624719, -2.575964, 1, 1, 1, 1, 1,
-0.3777998, -0.7529184, -4.183948, 1, 1, 1, 1, 1,
-0.376033, -0.2315762, -2.256818, 1, 1, 1, 1, 1,
-0.3732191, -1.748538, -2.419535, 0, 0, 1, 1, 1,
-0.3705195, -1.772254, -1.369019, 1, 0, 0, 1, 1,
-0.3689646, 0.343221, 0.5436916, 1, 0, 0, 1, 1,
-0.3677508, -0.738154, -4.321229, 1, 0, 0, 1, 1,
-0.367719, -0.5916933, -3.706657, 1, 0, 0, 1, 1,
-0.3677002, -0.2706667, -1.737244, 1, 0, 0, 1, 1,
-0.3647794, -1.600906, -1.004053, 0, 0, 0, 1, 1,
-0.3646132, 0.2345024, -0.6812922, 0, 0, 0, 1, 1,
-0.3617422, 0.7225184, -0.9303855, 0, 0, 0, 1, 1,
-0.3605632, 0.9763129, -0.01989699, 0, 0, 0, 1, 1,
-0.3587155, -2.726327, -3.574228, 0, 0, 0, 1, 1,
-0.358326, -0.6574154, -4.037136, 0, 0, 0, 1, 1,
-0.3501467, -0.280744, -2.55303, 0, 0, 0, 1, 1,
-0.3478642, -1.906228, -3.738198, 1, 1, 1, 1, 1,
-0.3465512, 0.8653636, -0.2413751, 1, 1, 1, 1, 1,
-0.3444119, -0.9961823, -3.246648, 1, 1, 1, 1, 1,
-0.3398224, -0.3560064, -4.237386, 1, 1, 1, 1, 1,
-0.3354755, -1.27418, -3.822932, 1, 1, 1, 1, 1,
-0.3353661, -1.521483, -2.488902, 1, 1, 1, 1, 1,
-0.3342932, -0.1555032, -2.34946, 1, 1, 1, 1, 1,
-0.3341646, 1.28571, -0.7359185, 1, 1, 1, 1, 1,
-0.3313633, 1.196895, -0.5358769, 1, 1, 1, 1, 1,
-0.3309714, -1.590263, -1.932207, 1, 1, 1, 1, 1,
-0.3288243, -0.4331128, -2.717848, 1, 1, 1, 1, 1,
-0.3264095, -0.471157, -3.357012, 1, 1, 1, 1, 1,
-0.3261566, 1.204913, -0.2133645, 1, 1, 1, 1, 1,
-0.3245679, -0.5809976, -2.030894, 1, 1, 1, 1, 1,
-0.3193959, -0.7993111, -4.85603, 1, 1, 1, 1, 1,
-0.314652, -0.7469906, -1.674243, 0, 0, 1, 1, 1,
-0.3132984, -0.7938305, -2.66232, 1, 0, 0, 1, 1,
-0.3095115, 1.398219, 0.1581766, 1, 0, 0, 1, 1,
-0.3035496, 0.5129653, 0.7014309, 1, 0, 0, 1, 1,
-0.3015259, 2.04897, 1.869919, 1, 0, 0, 1, 1,
-0.3001675, 0.8226267, -1.640494, 1, 0, 0, 1, 1,
-0.2977867, -1.508535, -2.541407, 0, 0, 0, 1, 1,
-0.2972322, 0.2484946, -1.41217, 0, 0, 0, 1, 1,
-0.2968499, -1.800591, -3.458778, 0, 0, 0, 1, 1,
-0.2964566, 1.217988, -0.4213467, 0, 0, 0, 1, 1,
-0.29017, -0.8335913, -4.700712, 0, 0, 0, 1, 1,
-0.2877311, 2.011221, -0.03505268, 0, 0, 0, 1, 1,
-0.2868249, 2.723039, 0.4310284, 0, 0, 0, 1, 1,
-0.2804533, 0.5256964, -1.357397, 1, 1, 1, 1, 1,
-0.2778327, -0.9203007, -3.058702, 1, 1, 1, 1, 1,
-0.2763845, 0.7135528, -1.121194, 1, 1, 1, 1, 1,
-0.2761534, -1.524772, -1.903044, 1, 1, 1, 1, 1,
-0.2684202, 0.3340681, -1.820263, 1, 1, 1, 1, 1,
-0.2647999, 0.6401835, -1.541141, 1, 1, 1, 1, 1,
-0.2625275, -1.394678, -3.995492, 1, 1, 1, 1, 1,
-0.26084, -0.3411426, -1.733639, 1, 1, 1, 1, 1,
-0.2559654, -1.918938, -1.530327, 1, 1, 1, 1, 1,
-0.2542495, -0.1947438, -3.622665, 1, 1, 1, 1, 1,
-0.2541647, 0.9836467, -0.9892827, 1, 1, 1, 1, 1,
-0.2509598, -0.2519423, -1.269034, 1, 1, 1, 1, 1,
-0.2401665, -0.123553, -3.093145, 1, 1, 1, 1, 1,
-0.239441, 0.3109897, 1.070192, 1, 1, 1, 1, 1,
-0.2387725, -0.4127558, -1.848931, 1, 1, 1, 1, 1,
-0.2384987, -1.332663, -4.967352, 0, 0, 1, 1, 1,
-0.2382785, 1.020631, 0.4167829, 1, 0, 0, 1, 1,
-0.2338472, 2.332809, -0.2106141, 1, 0, 0, 1, 1,
-0.2335569, -1.891744, 0.2388021, 1, 0, 0, 1, 1,
-0.2314022, 0.7113904, -0.7736198, 1, 0, 0, 1, 1,
-0.2256239, 2.089077, 1.004818, 1, 0, 0, 1, 1,
-0.2256084, 0.1824043, -1.145645, 0, 0, 0, 1, 1,
-0.224372, -0.3167629, -2.362543, 0, 0, 0, 1, 1,
-0.2234352, -0.9904189, -2.155257, 0, 0, 0, 1, 1,
-0.213037, -0.4487112, -5.306399, 0, 0, 0, 1, 1,
-0.2125692, -0.9658716, -3.968088, 0, 0, 0, 1, 1,
-0.2106512, -0.668586, -0.4667986, 0, 0, 0, 1, 1,
-0.2066393, -0.01072013, -0.2050049, 0, 0, 0, 1, 1,
-0.2046629, -0.5013589, -1.841266, 1, 1, 1, 1, 1,
-0.2042883, 0.307642, 0.1787774, 1, 1, 1, 1, 1,
-0.2027281, 0.9857643, -0.6467298, 1, 1, 1, 1, 1,
-0.1950876, -0.9337949, -4.134269, 1, 1, 1, 1, 1,
-0.1927122, 0.3577053, -0.003051854, 1, 1, 1, 1, 1,
-0.1909297, 0.738328, 0.01260906, 1, 1, 1, 1, 1,
-0.1893197, -0.5772313, -4.00008, 1, 1, 1, 1, 1,
-0.1873057, 0.7386397, 0.1069327, 1, 1, 1, 1, 1,
-0.1854556, -0.428186, -3.286306, 1, 1, 1, 1, 1,
-0.1845968, 1.142731, -1.672462, 1, 1, 1, 1, 1,
-0.1826033, -0.02558189, -1.864462, 1, 1, 1, 1, 1,
-0.181946, 0.8818703, -0.1367927, 1, 1, 1, 1, 1,
-0.1813172, 1.253053, -0.2339856, 1, 1, 1, 1, 1,
-0.1793877, -1.49743, -5.020982, 1, 1, 1, 1, 1,
-0.1763576, -1.148524, -4.635322, 1, 1, 1, 1, 1,
-0.1731056, 2.029277, -0.3666542, 0, 0, 1, 1, 1,
-0.165837, -0.014429, -0.9059829, 1, 0, 0, 1, 1,
-0.1647048, -0.4954336, -2.515645, 1, 0, 0, 1, 1,
-0.1638689, -1.750518, -1.599395, 1, 0, 0, 1, 1,
-0.1609207, -0.1512041, -2.623214, 1, 0, 0, 1, 1,
-0.1532825, -0.2857037, -2.150742, 1, 0, 0, 1, 1,
-0.1483938, 0.08858207, -1.267675, 0, 0, 0, 1, 1,
-0.1477436, 0.5532618, 0.04814818, 0, 0, 0, 1, 1,
-0.1463059, -1.435253, -1.183067, 0, 0, 0, 1, 1,
-0.1462223, -0.2589022, -2.019626, 0, 0, 0, 1, 1,
-0.1451759, 1.719004, -1.903947, 0, 0, 0, 1, 1,
-0.1413325, 0.3333723, 1.146756, 0, 0, 0, 1, 1,
-0.1372278, -0.04940124, -2.304566, 0, 0, 0, 1, 1,
-0.1348986, 1.609419, 2.901057, 1, 1, 1, 1, 1,
-0.1321766, -1.951921, -2.508218, 1, 1, 1, 1, 1,
-0.1284724, 0.4426686, -1.377876, 1, 1, 1, 1, 1,
-0.1190077, -0.7317313, -3.709789, 1, 1, 1, 1, 1,
-0.1174389, 0.7465762, -0.421485, 1, 1, 1, 1, 1,
-0.1106283, 0.982571, -0.725466, 1, 1, 1, 1, 1,
-0.108042, 0.109866, -1.492328, 1, 1, 1, 1, 1,
-0.1054148, -0.04962783, -4.844575, 1, 1, 1, 1, 1,
-0.1011755, 0.21329, -1.384331, 1, 1, 1, 1, 1,
-0.1007279, -1.274523, -3.120275, 1, 1, 1, 1, 1,
-0.09959809, -0.1644536, -4.428079, 1, 1, 1, 1, 1,
-0.09522316, -0.6482539, -2.328457, 1, 1, 1, 1, 1,
-0.09218272, 1.944074, 1.624544, 1, 1, 1, 1, 1,
-0.09113844, 1.093652, -1.398366, 1, 1, 1, 1, 1,
-0.09064297, -0.4063853, -3.135238, 1, 1, 1, 1, 1,
-0.09024873, -0.8578376, -1.627239, 0, 0, 1, 1, 1,
-0.08743244, 0.7373983, -1.044699, 1, 0, 0, 1, 1,
-0.08321957, 1.653266, 0.7845817, 1, 0, 0, 1, 1,
-0.07483317, 0.4612518, -1.926557, 1, 0, 0, 1, 1,
-0.07180696, 1.546217, -0.5429327, 1, 0, 0, 1, 1,
-0.06802665, 0.024382, -2.045372, 1, 0, 0, 1, 1,
-0.06354147, -0.3159015, -3.546996, 0, 0, 0, 1, 1,
-0.06217139, -1.774357, -3.097298, 0, 0, 0, 1, 1,
-0.05897657, 0.03448933, -0.000372941, 0, 0, 0, 1, 1,
-0.05308148, -0.3656426, -3.544774, 0, 0, 0, 1, 1,
-0.0526538, -1.415078, -5.671406, 0, 0, 0, 1, 1,
-0.05006737, -1.88035, -3.438072, 0, 0, 0, 1, 1,
-0.04966388, -1.082396, -3.660542, 0, 0, 0, 1, 1,
-0.04520207, 0.4006478, -0.8046088, 1, 1, 1, 1, 1,
-0.04034291, -2.405221, -4.035297, 1, 1, 1, 1, 1,
-0.03740536, 0.8278591, 0.1264488, 1, 1, 1, 1, 1,
-0.03613447, 0.5090437, -0.113166, 1, 1, 1, 1, 1,
-0.03547867, 0.3792198, -1.090294, 1, 1, 1, 1, 1,
-0.03291266, 0.3378718, -2.015384, 1, 1, 1, 1, 1,
-0.03200213, 0.5914128, -0.3411925, 1, 1, 1, 1, 1,
-0.03057819, -0.767891, -2.772964, 1, 1, 1, 1, 1,
-0.02934976, -0.9456775, -1.507802, 1, 1, 1, 1, 1,
-0.02719172, 0.2667766, 0.9485735, 1, 1, 1, 1, 1,
-0.02061518, -0.4660194, -1.484763, 1, 1, 1, 1, 1,
-0.01923803, 0.1958666, 0.1853008, 1, 1, 1, 1, 1,
-0.01886659, -3.076315, -1.885274, 1, 1, 1, 1, 1,
-0.01708216, 0.8342066, 0.09286909, 1, 1, 1, 1, 1,
-0.01393403, -0.3559221, -2.842882, 1, 1, 1, 1, 1,
-0.01361354, -0.2277092, -4.00664, 0, 0, 1, 1, 1,
-0.01252395, 0.4670302, -0.2572073, 1, 0, 0, 1, 1,
-0.01083724, 0.1349649, 0.403618, 1, 0, 0, 1, 1,
-0.008838207, -1.049209, -2.281949, 1, 0, 0, 1, 1,
-0.00718629, -0.09886986, -3.530764, 1, 0, 0, 1, 1,
-0.006388509, -0.2912311, -3.278051, 1, 0, 0, 1, 1,
-0.006274423, -1.394931, -4.315532, 0, 0, 0, 1, 1,
-0.004999948, 1.180007, -1.021926, 0, 0, 0, 1, 1,
0.0009952051, 1.078914, 0.1658619, 0, 0, 0, 1, 1,
0.001139537, 0.5196765, -1.217589, 0, 0, 0, 1, 1,
0.002588566, 0.742127, 0.06141675, 0, 0, 0, 1, 1,
0.00843923, 0.6833557, -0.02842166, 0, 0, 0, 1, 1,
0.008515345, -0.3649668, 3.211715, 0, 0, 0, 1, 1,
0.008578941, -0.5004636, 1.55662, 1, 1, 1, 1, 1,
0.009868485, -1.959494, 3.302915, 1, 1, 1, 1, 1,
0.009954746, -0.4785788, 2.340831, 1, 1, 1, 1, 1,
0.01009517, 0.08895522, 1.065137, 1, 1, 1, 1, 1,
0.01136971, 0.4540851, -0.1653081, 1, 1, 1, 1, 1,
0.01268906, 1.160072, 0.2689719, 1, 1, 1, 1, 1,
0.01351249, -0.2246007, 1.432408, 1, 1, 1, 1, 1,
0.02064269, 0.5481538, 1.804021, 1, 1, 1, 1, 1,
0.02395036, -2.039673, 4.631758, 1, 1, 1, 1, 1,
0.02604577, 0.3015578, 1.137329, 1, 1, 1, 1, 1,
0.02917958, 0.2957698, 1.075663, 1, 1, 1, 1, 1,
0.03087992, -0.6018345, 3.756515, 1, 1, 1, 1, 1,
0.03115731, 0.4159021, -1.931794, 1, 1, 1, 1, 1,
0.03594197, 0.8619102, -0.5003057, 1, 1, 1, 1, 1,
0.0392123, 2.125181, 1.630353, 1, 1, 1, 1, 1,
0.03959128, -0.8684524, 3.105552, 0, 0, 1, 1, 1,
0.0419553, 0.2478138, 0.7823473, 1, 0, 0, 1, 1,
0.04214397, -0.07580917, 2.691599, 1, 0, 0, 1, 1,
0.04286052, 0.03643351, -1.012355, 1, 0, 0, 1, 1,
0.04583538, -0.910184, 2.695622, 1, 0, 0, 1, 1,
0.04854535, 1.237506, 0.804089, 1, 0, 0, 1, 1,
0.04895615, -0.7975377, 3.52078, 0, 0, 0, 1, 1,
0.0528785, 2.52923, -0.8662325, 0, 0, 0, 1, 1,
0.05905307, 0.7327367, 0.1423689, 0, 0, 0, 1, 1,
0.05967281, 1.188507, -1.365326, 0, 0, 0, 1, 1,
0.06106403, -1.149743, 3.598107, 0, 0, 0, 1, 1,
0.06842831, 0.9425755, -0.1739394, 0, 0, 0, 1, 1,
0.06912228, -0.1426634, 4.164524, 0, 0, 0, 1, 1,
0.07334014, -0.6572995, 2.42748, 1, 1, 1, 1, 1,
0.07916089, -0.1919267, 3.861737, 1, 1, 1, 1, 1,
0.08187658, 1.336384, 0.81341, 1, 1, 1, 1, 1,
0.08310925, 0.6221696, 0.0156865, 1, 1, 1, 1, 1,
0.08613026, -1.160741, 3.413668, 1, 1, 1, 1, 1,
0.08793299, -0.8719743, 2.381294, 1, 1, 1, 1, 1,
0.09416596, 0.3031997, -0.06834756, 1, 1, 1, 1, 1,
0.09480555, -0.1523579, 2.647196, 1, 1, 1, 1, 1,
0.1020411, -1.841725, 2.230081, 1, 1, 1, 1, 1,
0.1041335, -0.4192125, 3.267634, 1, 1, 1, 1, 1,
0.1045383, -0.7757925, 2.253531, 1, 1, 1, 1, 1,
0.1051358, 0.5273435, -1.222852, 1, 1, 1, 1, 1,
0.1063888, 0.3218722, -0.9392556, 1, 1, 1, 1, 1,
0.1070756, 1.260801, -0.2542117, 1, 1, 1, 1, 1,
0.1072559, -0.1913856, 1.315475, 1, 1, 1, 1, 1,
0.1075474, 1.309247, 1.296785, 0, 0, 1, 1, 1,
0.1091682, -0.4114373, 1.772538, 1, 0, 0, 1, 1,
0.1140528, 0.6813639, 0.9813679, 1, 0, 0, 1, 1,
0.1143872, 1.567937, -0.89904, 1, 0, 0, 1, 1,
0.1154138, -0.5656864, 3.925728, 1, 0, 0, 1, 1,
0.1166421, -0.5176126, 4.264262, 1, 0, 0, 1, 1,
0.1204432, 0.9592152, 0.1137313, 0, 0, 0, 1, 1,
0.1248952, 1.589402, -0.7019805, 0, 0, 0, 1, 1,
0.1258633, -8.470807e-05, 1.123648, 0, 0, 0, 1, 1,
0.1271016, -0.6920506, 2.536399, 0, 0, 0, 1, 1,
0.1274331, 0.5010941, 1.398582, 0, 0, 0, 1, 1,
0.1279812, 0.7482846, 0.8074666, 0, 0, 0, 1, 1,
0.1285219, 0.9642268, 1.03393, 0, 0, 0, 1, 1,
0.1361207, -0.5473423, 2.905297, 1, 1, 1, 1, 1,
0.138363, -1.605679, 3.450717, 1, 1, 1, 1, 1,
0.1398984, 0.9190385, -1.133845, 1, 1, 1, 1, 1,
0.1402538, -0.1681509, 3.537387, 1, 1, 1, 1, 1,
0.14438, -1.290326, 2.017859, 1, 1, 1, 1, 1,
0.1453966, 0.178353, 0.9107381, 1, 1, 1, 1, 1,
0.1469747, 0.1167978, 0.9987028, 1, 1, 1, 1, 1,
0.1509563, -0.1283066, 1.501608, 1, 1, 1, 1, 1,
0.1514391, 1.279372, 0.6376548, 1, 1, 1, 1, 1,
0.1519096, 1.234296, -0.05619186, 1, 1, 1, 1, 1,
0.1543285, -0.8038419, 4.360411, 1, 1, 1, 1, 1,
0.1571355, 0.338905, 2.45166, 1, 1, 1, 1, 1,
0.1693567, -1.699541, 3.367259, 1, 1, 1, 1, 1,
0.171154, 1.709221, -0.03207441, 1, 1, 1, 1, 1,
0.174049, -0.4542156, 1.913156, 1, 1, 1, 1, 1,
0.17462, 0.1194037, 1.480286, 0, 0, 1, 1, 1,
0.1748925, 1.241661, 0.2717793, 1, 0, 0, 1, 1,
0.1751561, -2.330912, 2.991857, 1, 0, 0, 1, 1,
0.1755982, 0.5806508, -0.0424446, 1, 0, 0, 1, 1,
0.1769692, -0.8682622, 2.394631, 1, 0, 0, 1, 1,
0.1795958, -0.7142652, 2.71704, 1, 0, 0, 1, 1,
0.1814823, -0.1624721, 2.764694, 0, 0, 0, 1, 1,
0.1824229, -0.3600735, 2.943679, 0, 0, 0, 1, 1,
0.1884789, -0.1557259, 2.256821, 0, 0, 0, 1, 1,
0.1900331, -0.6242165, 2.929736, 0, 0, 0, 1, 1,
0.192055, -0.4494356, 3.662019, 0, 0, 0, 1, 1,
0.1922801, -0.1710024, 1.870158, 0, 0, 0, 1, 1,
0.1966006, -0.5594858, 1.904375, 0, 0, 0, 1, 1,
0.1971717, 0.4994305, 1.408873, 1, 1, 1, 1, 1,
0.2028276, -0.4400637, 1.89692, 1, 1, 1, 1, 1,
0.2029097, 0.730332, 0.07053211, 1, 1, 1, 1, 1,
0.2037518, -0.800788, 2.743447, 1, 1, 1, 1, 1,
0.2092707, -0.5897275, 2.402205, 1, 1, 1, 1, 1,
0.2165775, -0.6282798, 2.64336, 1, 1, 1, 1, 1,
0.2196278, 0.679451, 1.491963, 1, 1, 1, 1, 1,
0.21977, -0.284765, 2.02924, 1, 1, 1, 1, 1,
0.2242085, 2.014144, 2.456741, 1, 1, 1, 1, 1,
0.2250144, 0.3745311, 0.3105096, 1, 1, 1, 1, 1,
0.2292096, 2.191096, -1.158244, 1, 1, 1, 1, 1,
0.2341695, 1.333762, 1.092292, 1, 1, 1, 1, 1,
0.235921, 1.393219, 0.8246258, 1, 1, 1, 1, 1,
0.2369433, -0.4342832, 3.425927, 1, 1, 1, 1, 1,
0.2459914, -1.838123, 4.962534, 1, 1, 1, 1, 1,
0.2471608, -0.6623985, 1.748052, 0, 0, 1, 1, 1,
0.2473425, -0.3169236, 2.196456, 1, 0, 0, 1, 1,
0.2544824, 2.34353, 0.4229442, 1, 0, 0, 1, 1,
0.2548078, -0.0396628, 2.665992, 1, 0, 0, 1, 1,
0.2588683, 0.1597756, 1.906212, 1, 0, 0, 1, 1,
0.2618863, 1.218491, -0.2027493, 1, 0, 0, 1, 1,
0.2680337, 1.492133, 1.328201, 0, 0, 0, 1, 1,
0.2698984, -1.225703, 3.448315, 0, 0, 0, 1, 1,
0.2769578, -0.9120042, 3.70706, 0, 0, 0, 1, 1,
0.2785007, -0.4564328, 1.827145, 0, 0, 0, 1, 1,
0.2814222, 1.967967, 0.3696812, 0, 0, 0, 1, 1,
0.2904153, -2.758538, 3.127925, 0, 0, 0, 1, 1,
0.2927177, 0.9143875, 0.881465, 0, 0, 0, 1, 1,
0.3009079, 0.9558346, 0.7797229, 1, 1, 1, 1, 1,
0.3012516, -1.043475, 3.10286, 1, 1, 1, 1, 1,
0.3022545, 1.285118, -1.609127, 1, 1, 1, 1, 1,
0.3028477, -0.4599042, 2.147304, 1, 1, 1, 1, 1,
0.3044584, 0.4460988, -0.1076833, 1, 1, 1, 1, 1,
0.3060343, 0.4449333, 0.3258622, 1, 1, 1, 1, 1,
0.3064356, 1.500053, 0.9691312, 1, 1, 1, 1, 1,
0.3100756, -0.06973337, 2.328691, 1, 1, 1, 1, 1,
0.3108217, 1.51288, -0.2633216, 1, 1, 1, 1, 1,
0.3321885, -0.2427694, 2.815927, 1, 1, 1, 1, 1,
0.332769, 0.1654755, 0.4017847, 1, 1, 1, 1, 1,
0.3328037, -0.1347804, 0.6117643, 1, 1, 1, 1, 1,
0.3366363, -1.44828, 3.931909, 1, 1, 1, 1, 1,
0.3386108, -0.3755639, 3.072025, 1, 1, 1, 1, 1,
0.3436685, 1.035273, 0.412188, 1, 1, 1, 1, 1,
0.3458085, -0.5970695, 2.364094, 0, 0, 1, 1, 1,
0.354335, 0.2854352, 1.697529, 1, 0, 0, 1, 1,
0.3595898, -0.1285944, 2.306485, 1, 0, 0, 1, 1,
0.362651, 1.5339, -1.077739, 1, 0, 0, 1, 1,
0.3659183, 0.8465949, -0.2198549, 1, 0, 0, 1, 1,
0.3666844, -0.8499249, 2.001905, 1, 0, 0, 1, 1,
0.3689674, -2.082935, 3.07757, 0, 0, 0, 1, 1,
0.3697456, -0.1206468, 2.391815, 0, 0, 0, 1, 1,
0.3778591, 1.261296, 0.08416634, 0, 0, 0, 1, 1,
0.3803868, -0.8468406, 3.252346, 0, 0, 0, 1, 1,
0.3888347, 0.2628984, 0.3648598, 0, 0, 0, 1, 1,
0.397853, 0.4857266, 1.257439, 0, 0, 0, 1, 1,
0.3985634, 0.221553, 0.8609114, 0, 0, 0, 1, 1,
0.398617, 0.454639, 0.6772563, 1, 1, 1, 1, 1,
0.4015063, 0.9084949, -1.078604, 1, 1, 1, 1, 1,
0.402076, 1.258318, 0.5635698, 1, 1, 1, 1, 1,
0.4049704, 0.5691696, 1.266746, 1, 1, 1, 1, 1,
0.4051057, 0.8787586, -0.8351592, 1, 1, 1, 1, 1,
0.4083187, 0.6382987, 0.07210036, 1, 1, 1, 1, 1,
0.4093032, 0.0814366, 4.350579, 1, 1, 1, 1, 1,
0.4105782, -0.04759414, 1.116139, 1, 1, 1, 1, 1,
0.4106118, 0.8530045, -0.2897795, 1, 1, 1, 1, 1,
0.4116038, -0.04463396, 1.200757, 1, 1, 1, 1, 1,
0.4121554, 0.305691, 0.9407036, 1, 1, 1, 1, 1,
0.4128803, -0.4152955, 4.348464, 1, 1, 1, 1, 1,
0.4164044, -0.2852281, 2.480199, 1, 1, 1, 1, 1,
0.4171246, -0.8764484, 2.704983, 1, 1, 1, 1, 1,
0.4188506, 0.8263005, 0.491961, 1, 1, 1, 1, 1,
0.4198803, -0.1416562, 0.7285449, 0, 0, 1, 1, 1,
0.4199006, 1.559186, 1.314209, 1, 0, 0, 1, 1,
0.4230562, 0.04424688, 1.175109, 1, 0, 0, 1, 1,
0.4274674, -0.684281, 3.227087, 1, 0, 0, 1, 1,
0.4279118, 0.4946812, 1.454967, 1, 0, 0, 1, 1,
0.430332, -1.149778, 2.627913, 1, 0, 0, 1, 1,
0.4303641, 0.667951, -0.2735952, 0, 0, 0, 1, 1,
0.4309463, -1.673219, 4.792978, 0, 0, 0, 1, 1,
0.4311893, -0.5308031, 0.9786957, 0, 0, 0, 1, 1,
0.4325981, 0.1761828, 1.210065, 0, 0, 0, 1, 1,
0.4383094, -0.1919453, 1.089203, 0, 0, 0, 1, 1,
0.4475788, -0.5146928, 2.932997, 0, 0, 0, 1, 1,
0.4493212, -1.69622, 3.061743, 0, 0, 0, 1, 1,
0.4508851, 1.994139, 0.6891336, 1, 1, 1, 1, 1,
0.4522994, 0.4505301, -0.2810408, 1, 1, 1, 1, 1,
0.4578065, 0.3646013, 1.652313, 1, 1, 1, 1, 1,
0.458567, 1.213382, 2.412431, 1, 1, 1, 1, 1,
0.4605256, 0.5004728, 2.125367, 1, 1, 1, 1, 1,
0.461028, 1.208315, 0.2768856, 1, 1, 1, 1, 1,
0.4675102, 1.898402, 2.051574, 1, 1, 1, 1, 1,
0.468381, -1.822233, 3.068675, 1, 1, 1, 1, 1,
0.4743999, 1.20282, -2.40576, 1, 1, 1, 1, 1,
0.4788651, 0.526299, 0.9552576, 1, 1, 1, 1, 1,
0.4799133, -0.03792629, 1.894697, 1, 1, 1, 1, 1,
0.4874097, 0.3311977, 1.060596, 1, 1, 1, 1, 1,
0.4886384, 0.240298, 2.278609, 1, 1, 1, 1, 1,
0.4898289, -0.315599, 1.791664, 1, 1, 1, 1, 1,
0.4901113, -2.283044, 2.840068, 1, 1, 1, 1, 1,
0.4920855, 0.6733173, 0.03078734, 0, 0, 1, 1, 1,
0.4931505, -0.9875101, 3.858599, 1, 0, 0, 1, 1,
0.4983027, 1.226682, 1.611373, 1, 0, 0, 1, 1,
0.4997385, 0.9894245, 0.7536965, 1, 0, 0, 1, 1,
0.5046182, 1.654533, 0.1533981, 1, 0, 0, 1, 1,
0.5051416, 0.8751334, -0.04440987, 1, 0, 0, 1, 1,
0.5069494, -0.6209776, 3.816718, 0, 0, 0, 1, 1,
0.5113177, -0.1294798, 1.36853, 0, 0, 0, 1, 1,
0.5120595, -1.214846, 1.582332, 0, 0, 0, 1, 1,
0.5134407, 2.301492, 1.045498, 0, 0, 0, 1, 1,
0.5169324, 2.180106, 1.140863, 0, 0, 0, 1, 1,
0.524049, -0.7164872, 2.518156, 0, 0, 0, 1, 1,
0.5256138, -0.2339684, 2.12968, 0, 0, 0, 1, 1,
0.5258703, -0.8041778, 3.049413, 1, 1, 1, 1, 1,
0.5290335, -0.3262487, 3.369848, 1, 1, 1, 1, 1,
0.5293729, 0.1489427, 2.030397, 1, 1, 1, 1, 1,
0.5309753, 1.051289, -0.6545565, 1, 1, 1, 1, 1,
0.5322883, -1.57584, 4.082232, 1, 1, 1, 1, 1,
0.5362131, 0.0768243, 1.791972, 1, 1, 1, 1, 1,
0.5382711, -0.6734315, 2.912828, 1, 1, 1, 1, 1,
0.5383241, 0.1919932, 3.018565, 1, 1, 1, 1, 1,
0.5417439, -1.294769, 2.794058, 1, 1, 1, 1, 1,
0.5424579, 0.3890882, 0.0827132, 1, 1, 1, 1, 1,
0.5433391, -0.656045, 2.015193, 1, 1, 1, 1, 1,
0.5448742, -0.9585469, 1.96977, 1, 1, 1, 1, 1,
0.5466886, 0.2372278, 0.2851026, 1, 1, 1, 1, 1,
0.5487444, -1.200398, 3.204992, 1, 1, 1, 1, 1,
0.5506334, 0.3805456, 1.003768, 1, 1, 1, 1, 1,
0.5547552, 0.8186358, 2.730705, 0, 0, 1, 1, 1,
0.5558695, -2.049265, 1.131718, 1, 0, 0, 1, 1,
0.5568167, 0.7239337, 0.8792906, 1, 0, 0, 1, 1,
0.5590854, -1.13501, 2.46791, 1, 0, 0, 1, 1,
0.5599084, -0.811171, 1.809362, 1, 0, 0, 1, 1,
0.5623266, 1.429884, 1.133638, 1, 0, 0, 1, 1,
0.5666263, -0.03523326, 3.462431, 0, 0, 0, 1, 1,
0.5690773, 0.657351, 0.8793265, 0, 0, 0, 1, 1,
0.5697595, -0.9980784, 3.310964, 0, 0, 0, 1, 1,
0.5727758, 0.5587612, 0.6801041, 0, 0, 0, 1, 1,
0.5739982, -1.629899, 1.281387, 0, 0, 0, 1, 1,
0.5830128, -0.04185554, 2.048031, 0, 0, 0, 1, 1,
0.5844113, -0.3276886, 1.970251, 0, 0, 0, 1, 1,
0.5879432, -0.8254873, 2.597907, 1, 1, 1, 1, 1,
0.5911328, -0.234027, 1.397627, 1, 1, 1, 1, 1,
0.5930831, -1.392142, 3.702407, 1, 1, 1, 1, 1,
0.5948822, -0.237348, 0.1238929, 1, 1, 1, 1, 1,
0.6016372, 0.5728402, 0.9472075, 1, 1, 1, 1, 1,
0.6027218, 0.6607951, 0.1218848, 1, 1, 1, 1, 1,
0.613728, 1.545168, -0.4142482, 1, 1, 1, 1, 1,
0.6148431, 1.907868, -0.05352468, 1, 1, 1, 1, 1,
0.6153083, -1.039411, 3.586726, 1, 1, 1, 1, 1,
0.6201016, -0.3387315, 2.659018, 1, 1, 1, 1, 1,
0.6233082, 0.1318848, 2.207707, 1, 1, 1, 1, 1,
0.6286806, -0.5940394, 2.661251, 1, 1, 1, 1, 1,
0.6341261, 0.5077013, 0.08120374, 1, 1, 1, 1, 1,
0.6341336, -0.3254686, 2.370965, 1, 1, 1, 1, 1,
0.6401317, 0.9062637, -0.9950296, 1, 1, 1, 1, 1,
0.6407418, 0.5598098, 0.2408845, 0, 0, 1, 1, 1,
0.6418266, 1.435298, 1.287565, 1, 0, 0, 1, 1,
0.642132, 0.689077, -0.2491152, 1, 0, 0, 1, 1,
0.6422217, 1.507713, 1.172318, 1, 0, 0, 1, 1,
0.6455151, 0.2237722, 1.047096, 1, 0, 0, 1, 1,
0.6476405, 0.544307, 0.5979855, 1, 0, 0, 1, 1,
0.6476706, -0.5838941, 3.092206, 0, 0, 0, 1, 1,
0.6493744, 0.8073252, 0.2552209, 0, 0, 0, 1, 1,
0.6537443, -1.070826, 1.328353, 0, 0, 0, 1, 1,
0.6640974, -1.926983, 3.427251, 0, 0, 0, 1, 1,
0.6645536, -0.6501238, 2.850826, 0, 0, 0, 1, 1,
0.6702799, 0.4360014, 0.3003361, 0, 0, 0, 1, 1,
0.6703372, -0.03261735, 1.886855, 0, 0, 0, 1, 1,
0.6728568, 2.560439, 0.8695971, 1, 1, 1, 1, 1,
0.6810041, -0.1017904, 2.095566, 1, 1, 1, 1, 1,
0.6837295, 0.05360181, 2.595304, 1, 1, 1, 1, 1,
0.6841343, 0.6309763, 0.6914304, 1, 1, 1, 1, 1,
0.6911064, -2.780055, 3.541519, 1, 1, 1, 1, 1,
0.6939687, -0.3821201, 0.5286311, 1, 1, 1, 1, 1,
0.6941239, -0.3891271, 3.059181, 1, 1, 1, 1, 1,
0.6962532, -2.188061, 3.758948, 1, 1, 1, 1, 1,
0.699131, -0.4107107, 2.337698, 1, 1, 1, 1, 1,
0.6999452, -0.8869247, 3.792602, 1, 1, 1, 1, 1,
0.7054943, -0.2571571, 1.851663, 1, 1, 1, 1, 1,
0.7081163, -1.127362, 2.325761, 1, 1, 1, 1, 1,
0.7106123, 1.719687, -2.330496, 1, 1, 1, 1, 1,
0.711845, 0.5569548, 0.01066798, 1, 1, 1, 1, 1,
0.7126802, -0.8051395, 0.8280605, 1, 1, 1, 1, 1,
0.7145666, 0.9475484, 1.595887, 0, 0, 1, 1, 1,
0.719865, 0.05743346, 1.560913, 1, 0, 0, 1, 1,
0.7205539, -0.9566976, 2.255974, 1, 0, 0, 1, 1,
0.7211512, -0.03587165, 1.224586, 1, 0, 0, 1, 1,
0.7265145, 0.6873928, 0.4275917, 1, 0, 0, 1, 1,
0.7277767, -0.03294732, 2.228186, 1, 0, 0, 1, 1,
0.7310388, -1.732089, 1.763048, 0, 0, 0, 1, 1,
0.733177, 0.239055, 0.6676852, 0, 0, 0, 1, 1,
0.743016, -0.2262811, 3.630437, 0, 0, 0, 1, 1,
0.7445894, -1.539493, 2.160599, 0, 0, 0, 1, 1,
0.7473866, -1.025916, 1.38434, 0, 0, 0, 1, 1,
0.7477782, 0.1592136, 1.447829, 0, 0, 0, 1, 1,
0.7498286, -0.6840595, 2.502363, 0, 0, 0, 1, 1,
0.7607583, 0.8731843, 3.807633, 1, 1, 1, 1, 1,
0.7633234, -1.400314, 4.083656, 1, 1, 1, 1, 1,
0.7681025, -2.561279, 1.690709, 1, 1, 1, 1, 1,
0.7715604, 0.3131557, 1.18926, 1, 1, 1, 1, 1,
0.7718633, 0.3885392, 1.909097, 1, 1, 1, 1, 1,
0.7769165, 1.364178, -0.2277779, 1, 1, 1, 1, 1,
0.7810571, -1.698297, 2.319153, 1, 1, 1, 1, 1,
0.7862728, -0.3896846, 1.49068, 1, 1, 1, 1, 1,
0.7905634, -1.520197, 3.000831, 1, 1, 1, 1, 1,
0.791249, 0.9291378, -1.011634, 1, 1, 1, 1, 1,
0.8022773, 0.4487053, 0.6940392, 1, 1, 1, 1, 1,
0.8092352, 0.8030233, 1.008975, 1, 1, 1, 1, 1,
0.8137231, 1.014142, 0.592678, 1, 1, 1, 1, 1,
0.8163936, -1.495555, 3.19091, 1, 1, 1, 1, 1,
0.8182704, 1.072608, 1.101748, 1, 1, 1, 1, 1,
0.8196717, -0.3113439, 0.4714314, 0, 0, 1, 1, 1,
0.8278718, -1.41885, 2.46109, 1, 0, 0, 1, 1,
0.8281153, -0.6180912, 1.222701, 1, 0, 0, 1, 1,
0.8296608, 0.406662, 0.6502366, 1, 0, 0, 1, 1,
0.8304812, 0.03166608, 3.112121, 1, 0, 0, 1, 1,
0.8306311, -2.043874, 3.310495, 1, 0, 0, 1, 1,
0.8402445, -0.3159844, 1.091804, 0, 0, 0, 1, 1,
0.8455538, -0.967576, 1.769064, 0, 0, 0, 1, 1,
0.8552024, -0.8180838, 2.585151, 0, 0, 0, 1, 1,
0.858747, 1.538325, 1.382338, 0, 0, 0, 1, 1,
0.8618828, 0.003346974, -0.3834609, 0, 0, 0, 1, 1,
0.8637893, -1.056666, 0.9126707, 0, 0, 0, 1, 1,
0.8643804, -1.388619, 3.391246, 0, 0, 0, 1, 1,
0.8697854, 0.2999462, 0.4606334, 1, 1, 1, 1, 1,
0.8718134, -0.9921925, 2.684995, 1, 1, 1, 1, 1,
0.8740276, 1.071692, 1.541525, 1, 1, 1, 1, 1,
0.8777865, -0.007570758, 1.480801, 1, 1, 1, 1, 1,
0.8903829, 0.0148089, 1.473238, 1, 1, 1, 1, 1,
0.8909307, -0.1091328, 1.866341, 1, 1, 1, 1, 1,
0.8950708, 0.07155846, 3.284238, 1, 1, 1, 1, 1,
0.8966025, 1.715825, -0.832316, 1, 1, 1, 1, 1,
0.8979719, 1.821867, 1.2119, 1, 1, 1, 1, 1,
0.8989114, -2.099635, 4.21994, 1, 1, 1, 1, 1,
0.9004306, 0.3740767, 0.1152227, 1, 1, 1, 1, 1,
0.9060765, -1.104386, 2.664876, 1, 1, 1, 1, 1,
0.9062331, -0.3337739, 2.327979, 1, 1, 1, 1, 1,
0.9090835, -1.658882, 2.95453, 1, 1, 1, 1, 1,
0.9094785, -0.2601453, 1.955996, 1, 1, 1, 1, 1,
0.9146509, 0.636932, -1.797125, 0, 0, 1, 1, 1,
0.9146519, -1.070714, 3.454697, 1, 0, 0, 1, 1,
0.9181705, -0.2906745, 2.92686, 1, 0, 0, 1, 1,
0.9197434, 0.6352827, 0.2003269, 1, 0, 0, 1, 1,
0.9223939, 0.3996909, 0.4714372, 1, 0, 0, 1, 1,
0.9283946, 0.4562563, 0.639166, 1, 0, 0, 1, 1,
0.9299657, 0.9493572, 0.6816192, 0, 0, 0, 1, 1,
0.9338846, -0.1454622, 1.703342, 0, 0, 0, 1, 1,
0.9404686, 0.5813973, 0.0665096, 0, 0, 0, 1, 1,
0.948295, -1.242594, 2.472082, 0, 0, 0, 1, 1,
0.9497703, 0.5001811, -0.8242213, 0, 0, 0, 1, 1,
0.9518165, 2.971698, -0.8796857, 0, 0, 0, 1, 1,
0.9525252, -0.265152, 2.522644, 0, 0, 0, 1, 1,
0.9601232, 0.801252, -0.06532132, 1, 1, 1, 1, 1,
0.9728416, 0.7384676, 2.100953, 1, 1, 1, 1, 1,
0.9731842, 0.07801288, -0.5829782, 1, 1, 1, 1, 1,
0.9837604, -1.74153, 4.095116, 1, 1, 1, 1, 1,
0.9849343, 1.120248, 2.151112, 1, 1, 1, 1, 1,
0.9874836, 1.334801, -0.4369056, 1, 1, 1, 1, 1,
0.9913824, -0.5445738, 0.6545737, 1, 1, 1, 1, 1,
1.002523, 0.8584574, 1.127055, 1, 1, 1, 1, 1,
1.005811, 0.9235922, -0.3391623, 1, 1, 1, 1, 1,
1.008602, 1.600117, 1.746413, 1, 1, 1, 1, 1,
1.018175, -0.5433916, 2.310039, 1, 1, 1, 1, 1,
1.019952, -0.008589866, 0.3752049, 1, 1, 1, 1, 1,
1.020737, 0.368668, -0.4169365, 1, 1, 1, 1, 1,
1.023211, -2.370529, 1.580064, 1, 1, 1, 1, 1,
1.028641, 0.5463356, 0.136363, 1, 1, 1, 1, 1,
1.032691, -1.381281, 0.7551695, 0, 0, 1, 1, 1,
1.034996, -0.7822162, 3.101856, 1, 0, 0, 1, 1,
1.039638, -0.1700039, 1.611318, 1, 0, 0, 1, 1,
1.040995, -1.41246, 3.006621, 1, 0, 0, 1, 1,
1.044243, -0.9355726, 0.5835325, 1, 0, 0, 1, 1,
1.04858, -0.9038573, 2.930353, 1, 0, 0, 1, 1,
1.058969, 0.2892831, 0.805366, 0, 0, 0, 1, 1,
1.065026, 0.852243, -1.042624, 0, 0, 0, 1, 1,
1.065768, 0.526148, -1.681407, 0, 0, 0, 1, 1,
1.067282, 0.7680707, 0.6935034, 0, 0, 0, 1, 1,
1.070178, 0.01147683, 2.233379, 0, 0, 0, 1, 1,
1.073834, 1.332663, 1.739922, 0, 0, 0, 1, 1,
1.084027, -1.349716, 0.4460245, 0, 0, 0, 1, 1,
1.084124, 0.8065588, 1.050479, 1, 1, 1, 1, 1,
1.085242, 0.0900051, 0.6878453, 1, 1, 1, 1, 1,
1.086972, -0.5216635, 1.537398, 1, 1, 1, 1, 1,
1.088894, 0.2119319, 2.473489, 1, 1, 1, 1, 1,
1.100394, -0.4316559, 1.848288, 1, 1, 1, 1, 1,
1.104645, 0.5995612, 2.341208, 1, 1, 1, 1, 1,
1.109785, 0.2961478, 0.6683806, 1, 1, 1, 1, 1,
1.111026, -0.455123, 1.990542, 1, 1, 1, 1, 1,
1.115712, -0.2226778, 3.711036, 1, 1, 1, 1, 1,
1.121245, 0.07066367, -0.5509741, 1, 1, 1, 1, 1,
1.124896, 0.385426, -0.2604921, 1, 1, 1, 1, 1,
1.130253, 0.5010034, -0.7574706, 1, 1, 1, 1, 1,
1.131906, -0.798796, 1.85204, 1, 1, 1, 1, 1,
1.138918, 0.6711618, 1.606331, 1, 1, 1, 1, 1,
1.142653, -0.06284866, 0.4752043, 1, 1, 1, 1, 1,
1.143787, -0.07923939, 2.478163, 0, 0, 1, 1, 1,
1.14507, -1.588531, 1.402111, 1, 0, 0, 1, 1,
1.145967, 1.138799, 0.3921906, 1, 0, 0, 1, 1,
1.149088, 0.2045399, 0.874474, 1, 0, 0, 1, 1,
1.152021, 0.06974708, 1.737212, 1, 0, 0, 1, 1,
1.160049, -0.1273867, -0.08445492, 1, 0, 0, 1, 1,
1.169347, -1.988907, 2.131376, 0, 0, 0, 1, 1,
1.169851, -0.09167954, 1.971123, 0, 0, 0, 1, 1,
1.179834, 0.07899918, 3.32398, 0, 0, 0, 1, 1,
1.194627, 0.2611089, 1.061881, 0, 0, 0, 1, 1,
1.196049, -0.6100497, 2.383392, 0, 0, 0, 1, 1,
1.200021, 0.8891418, 2.520448, 0, 0, 0, 1, 1,
1.205556, 0.7094241, -0.3984286, 0, 0, 0, 1, 1,
1.207703, -0.300139, 2.155753, 1, 1, 1, 1, 1,
1.208819, 0.1485626, 1.715702, 1, 1, 1, 1, 1,
1.218818, 0.868853, 0.7051045, 1, 1, 1, 1, 1,
1.219623, 0.6963168, 1.322715, 1, 1, 1, 1, 1,
1.220827, 0.618531, 0.4406974, 1, 1, 1, 1, 1,
1.221779, 0.3371303, 0.8868794, 1, 1, 1, 1, 1,
1.23524, 0.396809, 1.281329, 1, 1, 1, 1, 1,
1.259684, -0.05713165, 1.62306, 1, 1, 1, 1, 1,
1.265098, -2.034187, 2.210625, 1, 1, 1, 1, 1,
1.26527, -0.196293, 0.6772144, 1, 1, 1, 1, 1,
1.270791, -0.6967844, 2.011969, 1, 1, 1, 1, 1,
1.279403, 2.220933, 0.5354564, 1, 1, 1, 1, 1,
1.279725, 0.1985566, 1.434951, 1, 1, 1, 1, 1,
1.284561, -0.7735873, 0.1912471, 1, 1, 1, 1, 1,
1.296328, -0.7112867, 1.2893, 1, 1, 1, 1, 1,
1.296974, 0.8196286, 0.566692, 0, 0, 1, 1, 1,
1.300325, -0.1872617, 1.192825, 1, 0, 0, 1, 1,
1.300567, -1.431778, 3.063302, 1, 0, 0, 1, 1,
1.306096, -0.6302124, 1.30658, 1, 0, 0, 1, 1,
1.309438, 2.818334, 0.7426139, 1, 0, 0, 1, 1,
1.313237, 0.4193167, 2.383851, 1, 0, 0, 1, 1,
1.319566, -0.1507075, 1.65596, 0, 0, 0, 1, 1,
1.323837, -0.7309668, 3.71298, 0, 0, 0, 1, 1,
1.32432, -0.592754, 1.789866, 0, 0, 0, 1, 1,
1.333569, -0.3443315, 2.512436, 0, 0, 0, 1, 1,
1.337372, -0.4587634, 3.760206, 0, 0, 0, 1, 1,
1.346378, -0.5114195, -0.2319362, 0, 0, 0, 1, 1,
1.358622, -1.165561, 3.014202, 0, 0, 0, 1, 1,
1.365575, -0.78412, 0.9050092, 1, 1, 1, 1, 1,
1.366359, -0.5263835, 1.386016, 1, 1, 1, 1, 1,
1.388686, -0.8453392, 2.983721, 1, 1, 1, 1, 1,
1.391686, 1.670679, 1.379153, 1, 1, 1, 1, 1,
1.405006, -1.157241, 2.935713, 1, 1, 1, 1, 1,
1.407553, 0.3106084, 2.484481, 1, 1, 1, 1, 1,
1.412166, 0.1379619, 1.307308, 1, 1, 1, 1, 1,
1.416563, -0.3358201, 1.875977, 1, 1, 1, 1, 1,
1.41677, -1.158337, 4.567083, 1, 1, 1, 1, 1,
1.417225, 0.2297525, -0.1453795, 1, 1, 1, 1, 1,
1.423877, 2.335883, 0.2121617, 1, 1, 1, 1, 1,
1.425288, -0.7866398, 2.285144, 1, 1, 1, 1, 1,
1.436213, -0.03599159, 3.739047, 1, 1, 1, 1, 1,
1.442067, -1.793929, 2.266582, 1, 1, 1, 1, 1,
1.452461, 0.2223012, 2.769165, 1, 1, 1, 1, 1,
1.469408, 0.1867915, 1.379429, 0, 0, 1, 1, 1,
1.469759, 1.228225, 1.301774, 1, 0, 0, 1, 1,
1.483642, 0.8206838, 1.916613, 1, 0, 0, 1, 1,
1.498978, -0.08866012, 0.4852629, 1, 0, 0, 1, 1,
1.505122, -1.415397, 0.843392, 1, 0, 0, 1, 1,
1.515315, -1.136861, 1.945282, 1, 0, 0, 1, 1,
1.552598, -0.1857949, 1.628611, 0, 0, 0, 1, 1,
1.557563, -1.440094, 2.852041, 0, 0, 0, 1, 1,
1.558799, -0.02560573, 2.31508, 0, 0, 0, 1, 1,
1.564412, -0.1995619, 2.594962, 0, 0, 0, 1, 1,
1.579716, -0.3210353, 0.3531694, 0, 0, 0, 1, 1,
1.597984, 1.243852, 0.251785, 0, 0, 0, 1, 1,
1.607685, -0.236412, 0.210367, 0, 0, 0, 1, 1,
1.608405, -1.671546, 3.090143, 1, 1, 1, 1, 1,
1.614007, -0.4805491, 3.327045, 1, 1, 1, 1, 1,
1.615951, 0.4440335, 1.916711, 1, 1, 1, 1, 1,
1.622444, 0.7397357, 1.337352, 1, 1, 1, 1, 1,
1.628765, -1.310238, 0.8420979, 1, 1, 1, 1, 1,
1.63123, 0.6199349, 2.182361, 1, 1, 1, 1, 1,
1.649139, -0.9517878, 1.123279, 1, 1, 1, 1, 1,
1.656732, -0.05832033, 1.972269, 1, 1, 1, 1, 1,
1.660417, -0.1839884, 2.390483, 1, 1, 1, 1, 1,
1.67859, 0.5996751, 1.287935, 1, 1, 1, 1, 1,
1.696586, 0.5876998, 1.421629, 1, 1, 1, 1, 1,
1.723879, 1.099114, 1.303108, 1, 1, 1, 1, 1,
1.729607, 1.039095, 2.190499, 1, 1, 1, 1, 1,
1.748876, 0.6267512, 0.06787694, 1, 1, 1, 1, 1,
1.784745, 0.183761, 0.2542133, 1, 1, 1, 1, 1,
1.78593, -1.313972, 1.974743, 0, 0, 1, 1, 1,
1.78725, 0.05767266, 1.76506, 1, 0, 0, 1, 1,
1.795654, -0.4607645, 3.155316, 1, 0, 0, 1, 1,
1.80297, -0.4924244, 2.207025, 1, 0, 0, 1, 1,
1.808135, 0.0365403, 2.313762, 1, 0, 0, 1, 1,
1.850417, -0.6232596, 3.362733, 1, 0, 0, 1, 1,
1.863938, 0.4607349, 2.909164, 0, 0, 0, 1, 1,
1.878699, -1.115149, 2.020227, 0, 0, 0, 1, 1,
1.886363, -1.991258, 1.753296, 0, 0, 0, 1, 1,
1.905839, 0.9788049, 0.8160556, 0, 0, 0, 1, 1,
1.906533, 1.589278, 0.719092, 0, 0, 0, 1, 1,
1.921157, 0.1138164, 0.3031619, 0, 0, 0, 1, 1,
1.935207, -0.299435, 1.921668, 0, 0, 0, 1, 1,
1.939515, -0.8675632, 1.692716, 1, 1, 1, 1, 1,
1.948996, 0.6236695, -0.1863869, 1, 1, 1, 1, 1,
1.950179, -1.997539, 1.246983, 1, 1, 1, 1, 1,
1.950784, 0.6565307, 2.973561, 1, 1, 1, 1, 1,
1.963251, -1.930896, 4.4009, 1, 1, 1, 1, 1,
1.968911, 0.5289373, 2.148003, 1, 1, 1, 1, 1,
1.977131, -2.414159, 2.441481, 1, 1, 1, 1, 1,
1.980155, 0.6752819, 0.7229057, 1, 1, 1, 1, 1,
1.980302, 1.428879, 1.123989, 1, 1, 1, 1, 1,
1.98531, -0.162917, 1.856887, 1, 1, 1, 1, 1,
1.992402, 0.7555067, 1.175626, 1, 1, 1, 1, 1,
1.997222, 0.2440349, 0.8970481, 1, 1, 1, 1, 1,
2.002201, -0.6907093, 0.6801853, 1, 1, 1, 1, 1,
2.022002, -0.7673899, 3.667248, 1, 1, 1, 1, 1,
2.026532, -1.836874, 2.298604, 1, 1, 1, 1, 1,
2.077169, -1.738149, 1.439544, 0, 0, 1, 1, 1,
2.098967, 0.6356258, 1.582659, 1, 0, 0, 1, 1,
2.132308, -1.760101, 2.999543, 1, 0, 0, 1, 1,
2.143906, -0.3758536, 1.752118, 1, 0, 0, 1, 1,
2.151091, -1.072477, 1.045852, 1, 0, 0, 1, 1,
2.218829, -0.1543068, 0.8696744, 1, 0, 0, 1, 1,
2.234149, 0.897909, 1.99617, 0, 0, 0, 1, 1,
2.248821, 0.6238641, 0.8839293, 0, 0, 0, 1, 1,
2.269262, 0.2837562, 3.258613, 0, 0, 0, 1, 1,
2.330892, -1.053016, 3.497069, 0, 0, 0, 1, 1,
2.504491, -0.382895, 2.25876, 0, 0, 0, 1, 1,
2.518321, 0.6176879, 2.679369, 0, 0, 0, 1, 1,
2.549691, 0.5112024, -0.05211285, 0, 0, 0, 1, 1,
2.57333, -0.2759166, 1.656731, 1, 1, 1, 1, 1,
2.589806, 0.5913787, 1.018565, 1, 1, 1, 1, 1,
2.834121, -1.399769, 2.610522, 1, 1, 1, 1, 1,
2.835745, -1.676364, 1.158429, 1, 1, 1, 1, 1,
2.853667, -1.156882, 2.429511, 1, 1, 1, 1, 1,
3.208543, -1.329685, 1.736562, 1, 1, 1, 1, 1,
3.328121, -1.411563, 2.111207, 1, 1, 1, 1, 1
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
var radius = 9.373606;
var distance = 32.9244;
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
mvMatrix.translate( -0.2638199, 0.0523088, 0.3544359 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.9244);
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