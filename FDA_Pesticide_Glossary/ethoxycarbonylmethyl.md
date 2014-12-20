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
-3.283221, -0.9614818, -1.063232, 1, 0, 0, 1,
-3.267888, -0.1782957, 0.5177116, 1, 0.007843138, 0, 1,
-3.131704, -0.5438645, -0.8638168, 1, 0.01176471, 0, 1,
-2.887417, -0.06195623, -1.808507, 1, 0.01960784, 0, 1,
-2.776476, -1.056776, 0.08530205, 1, 0.02352941, 0, 1,
-2.697296, -0.7555206, -0.9509761, 1, 0.03137255, 0, 1,
-2.661589, 1.56199, 0.7447115, 1, 0.03529412, 0, 1,
-2.535614, 0.1432769, -1.481989, 1, 0.04313726, 0, 1,
-2.507359, -1.426212, -1.027115, 1, 0.04705882, 0, 1,
-2.420808, -1.333225, 0.9228783, 1, 0.05490196, 0, 1,
-2.407996, -2.399376, -2.957232, 1, 0.05882353, 0, 1,
-2.372592, 0.3344406, 0.6053832, 1, 0.06666667, 0, 1,
-2.369928, 0.6333396, -3.000284, 1, 0.07058824, 0, 1,
-2.365547, -0.7967153, -2.489545, 1, 0.07843138, 0, 1,
-2.308414, -1.13981, -2.42319, 1, 0.08235294, 0, 1,
-2.259012, 0.4555917, -0.3131253, 1, 0.09019608, 0, 1,
-2.227315, 0.06667194, -0.5170085, 1, 0.09411765, 0, 1,
-2.202481, 0.7824059, -2.216374, 1, 0.1019608, 0, 1,
-2.182084, 0.2138198, -1.948182, 1, 0.1098039, 0, 1,
-2.117755, -0.595331, -1.762661, 1, 0.1137255, 0, 1,
-2.071558, -0.0996258, -2.163333, 1, 0.1215686, 0, 1,
-2.061731, -0.03982313, -2.262685, 1, 0.1254902, 0, 1,
-2.052767, -0.4451399, -1.956309, 1, 0.1333333, 0, 1,
-2.037031, -0.5682368, -1.423043, 1, 0.1372549, 0, 1,
-2.008273, 2.408667, -1.42412, 1, 0.145098, 0, 1,
-1.997977, -0.9341605, -0.869785, 1, 0.1490196, 0, 1,
-1.988788, 0.2640169, -2.887254, 1, 0.1568628, 0, 1,
-1.987875, 0.4832261, -2.389329, 1, 0.1607843, 0, 1,
-1.983319, -0.08220301, -2.259341, 1, 0.1686275, 0, 1,
-1.98027, -0.4892375, -1.560467, 1, 0.172549, 0, 1,
-1.955658, 0.3166798, 0.4596989, 1, 0.1803922, 0, 1,
-1.931654, -1.093001, -2.139418, 1, 0.1843137, 0, 1,
-1.927214, -0.8589769, -2.596438, 1, 0.1921569, 0, 1,
-1.914612, 0.256588, -2.188009, 1, 0.1960784, 0, 1,
-1.895315, 0.03838918, -2.036133, 1, 0.2039216, 0, 1,
-1.883233, 0.6974864, -1.968585, 1, 0.2117647, 0, 1,
-1.878545, -1.93845, -2.586825, 1, 0.2156863, 0, 1,
-1.870961, -0.4784199, -2.376473, 1, 0.2235294, 0, 1,
-1.846864, -0.9277151, -3.025952, 1, 0.227451, 0, 1,
-1.844833, 0.6880917, -3.983543, 1, 0.2352941, 0, 1,
-1.829566, 0.6891993, -1.247059, 1, 0.2392157, 0, 1,
-1.82058, -0.4892885, -1.262683, 1, 0.2470588, 0, 1,
-1.808094, 0.4504974, -0.843246, 1, 0.2509804, 0, 1,
-1.805229, 1.125855, -2.129168, 1, 0.2588235, 0, 1,
-1.792328, 0.5733717, -1.687479, 1, 0.2627451, 0, 1,
-1.77632, -1.120217, -2.378569, 1, 0.2705882, 0, 1,
-1.728695, -1.170324, -1.933596, 1, 0.2745098, 0, 1,
-1.72585, 0.5602844, -3.037168, 1, 0.282353, 0, 1,
-1.719127, -0.1546143, -1.422058, 1, 0.2862745, 0, 1,
-1.716143, 0.6764147, -1.287216, 1, 0.2941177, 0, 1,
-1.707641, 0.2920534, -1.188226, 1, 0.3019608, 0, 1,
-1.694097, 1.681146, -0.1271182, 1, 0.3058824, 0, 1,
-1.685723, 0.7971886, -0.9554009, 1, 0.3137255, 0, 1,
-1.682576, -0.5377928, -2.004372, 1, 0.3176471, 0, 1,
-1.653522, -0.4405598, -1.071126, 1, 0.3254902, 0, 1,
-1.635627, -1.297863, -2.508852, 1, 0.3294118, 0, 1,
-1.613207, 0.644576, -1.450135, 1, 0.3372549, 0, 1,
-1.609248, 2.167896, -1.838509, 1, 0.3411765, 0, 1,
-1.608458, 1.211138, 0.828133, 1, 0.3490196, 0, 1,
-1.572427, -1.179869, -2.039923, 1, 0.3529412, 0, 1,
-1.566601, -0.4002366, -2.394812, 1, 0.3607843, 0, 1,
-1.56331, -1.344556, -1.546887, 1, 0.3647059, 0, 1,
-1.554883, -0.9388967, 0.4107396, 1, 0.372549, 0, 1,
-1.546985, -0.5463594, -3.164602, 1, 0.3764706, 0, 1,
-1.534958, 0.9446914, 0.2736267, 1, 0.3843137, 0, 1,
-1.509289, -0.78164, -2.984506, 1, 0.3882353, 0, 1,
-1.48991, -0.2542624, -0.05519773, 1, 0.3960784, 0, 1,
-1.484995, 0.09802313, -1.190395, 1, 0.4039216, 0, 1,
-1.483774, 0.6687016, -1.678469, 1, 0.4078431, 0, 1,
-1.474435, 1.301592, 0.1593322, 1, 0.4156863, 0, 1,
-1.472844, -2.038657, -1.268472, 1, 0.4196078, 0, 1,
-1.472771, -0.03751461, -3.063245, 1, 0.427451, 0, 1,
-1.47185, 0.5631661, -3.328503, 1, 0.4313726, 0, 1,
-1.462294, 1.420811, 0.01356754, 1, 0.4392157, 0, 1,
-1.456824, 0.3286858, -1.20761, 1, 0.4431373, 0, 1,
-1.425499, -1.476035, -2.334008, 1, 0.4509804, 0, 1,
-1.417346, -1.174784, -2.31142, 1, 0.454902, 0, 1,
-1.404941, 0.4581088, -2.273053, 1, 0.4627451, 0, 1,
-1.391842, -0.5361168, -2.843084, 1, 0.4666667, 0, 1,
-1.388963, -0.8234674, -0.7581363, 1, 0.4745098, 0, 1,
-1.387581, 1.243954, -0.3283041, 1, 0.4784314, 0, 1,
-1.377092, -0.45803, -2.729845, 1, 0.4862745, 0, 1,
-1.373733, 0.6602197, -1.404871, 1, 0.4901961, 0, 1,
-1.366687, -1.123988, -2.074712, 1, 0.4980392, 0, 1,
-1.365894, -0.4060732, -2.07268, 1, 0.5058824, 0, 1,
-1.361674, 0.3214383, -2.845105, 1, 0.509804, 0, 1,
-1.356918, -0.6798817, -2.864134, 1, 0.5176471, 0, 1,
-1.339007, 0.2926328, -3.173193, 1, 0.5215687, 0, 1,
-1.330138, -0.2555622, -2.662176, 1, 0.5294118, 0, 1,
-1.320721, -0.1778306, -2.476286, 1, 0.5333334, 0, 1,
-1.3128, -0.2253508, -2.548442, 1, 0.5411765, 0, 1,
-1.310784, -0.9632271, -1.517148, 1, 0.5450981, 0, 1,
-1.308757, 1.239861, -0.6896204, 1, 0.5529412, 0, 1,
-1.266223, 0.3992375, -2.170509, 1, 0.5568628, 0, 1,
-1.244139, -1.495915, -3.576166, 1, 0.5647059, 0, 1,
-1.239411, -2.401443, -2.641368, 1, 0.5686275, 0, 1,
-1.233589, -0.2559164, -1.125317, 1, 0.5764706, 0, 1,
-1.232864, -0.364778, -0.7088301, 1, 0.5803922, 0, 1,
-1.218953, 0.1206502, -1.032486, 1, 0.5882353, 0, 1,
-1.210872, 0.7773486, -0.03487462, 1, 0.5921569, 0, 1,
-1.201541, -0.8730222, -2.165268, 1, 0.6, 0, 1,
-1.197021, 0.02501773, -1.379585, 1, 0.6078432, 0, 1,
-1.189057, 0.3065022, -1.113572, 1, 0.6117647, 0, 1,
-1.187341, -1.033835, -2.350566, 1, 0.6196079, 0, 1,
-1.184573, 1.101689, -0.5231, 1, 0.6235294, 0, 1,
-1.180045, 1.803082, -0.165519, 1, 0.6313726, 0, 1,
-1.176548, -0.08076997, -2.243436, 1, 0.6352941, 0, 1,
-1.176498, 1.094101, -0.4592959, 1, 0.6431373, 0, 1,
-1.17275, -1.931556, -3.402677, 1, 0.6470588, 0, 1,
-1.172421, -0.01745229, -2.540943, 1, 0.654902, 0, 1,
-1.171521, -3.840743, -4.065824, 1, 0.6588235, 0, 1,
-1.170744, 0.374026, -0.2327909, 1, 0.6666667, 0, 1,
-1.168177, 0.9661325, -0.1743791, 1, 0.6705883, 0, 1,
-1.164696, -1.01046, -2.904808, 1, 0.6784314, 0, 1,
-1.159904, 3.603543, -0.7744651, 1, 0.682353, 0, 1,
-1.150945, -1.376805, -2.091982, 1, 0.6901961, 0, 1,
-1.149824, 1.050406, 0.2834818, 1, 0.6941177, 0, 1,
-1.147788, -1.284776, -2.301773, 1, 0.7019608, 0, 1,
-1.143451, -1.528919, -3.262558, 1, 0.7098039, 0, 1,
-1.138315, 0.5278163, -1.474648, 1, 0.7137255, 0, 1,
-1.138185, -1.94951, -2.627587, 1, 0.7215686, 0, 1,
-1.129088, -0.0963879, -1.579296, 1, 0.7254902, 0, 1,
-1.12808, 0.8974507, -0.9181461, 1, 0.7333333, 0, 1,
-1.127064, -0.3691373, -2.088085, 1, 0.7372549, 0, 1,
-1.122192, -0.4452757, -1.574182, 1, 0.7450981, 0, 1,
-1.121372, -1.892037, -1.575485, 1, 0.7490196, 0, 1,
-1.112519, -0.5160081, -0.6418059, 1, 0.7568628, 0, 1,
-1.104333, -0.6450807, -0.4301695, 1, 0.7607843, 0, 1,
-1.094538, 0.1961355, -1.339616, 1, 0.7686275, 0, 1,
-1.088515, 0.06864593, -3.118402, 1, 0.772549, 0, 1,
-1.086957, -0.2532471, -2.45068, 1, 0.7803922, 0, 1,
-1.083708, 0.6105261, -1.700949, 1, 0.7843137, 0, 1,
-1.080267, -0.06388511, -3.541648, 1, 0.7921569, 0, 1,
-1.079648, 0.03722985, -1.944695, 1, 0.7960784, 0, 1,
-1.074872, 0.1415277, -1.901196, 1, 0.8039216, 0, 1,
-1.062504, 1.485411, -0.06076866, 1, 0.8117647, 0, 1,
-1.058811, -0.8449341, -2.572353, 1, 0.8156863, 0, 1,
-1.055527, 0.2950306, -0.3958551, 1, 0.8235294, 0, 1,
-1.054531, 1.089685, -0.9130814, 1, 0.827451, 0, 1,
-1.051748, -0.09105375, -1.95415, 1, 0.8352941, 0, 1,
-1.049989, -0.3353949, -1.595105, 1, 0.8392157, 0, 1,
-1.042188, -2.003308, -2.040888, 1, 0.8470588, 0, 1,
-1.036523, -0.4038956, -1.743121, 1, 0.8509804, 0, 1,
-1.035798, -0.9312652, -2.327383, 1, 0.8588235, 0, 1,
-1.035007, 0.6537216, -0.7296631, 1, 0.8627451, 0, 1,
-1.033591, -0.2165885, -2.581584, 1, 0.8705882, 0, 1,
-1.032595, -1.061604, -1.945384, 1, 0.8745098, 0, 1,
-1.025413, 0.03869461, -2.004318, 1, 0.8823529, 0, 1,
-1.022121, 0.16671, 0.2428815, 1, 0.8862745, 0, 1,
-1.017114, 0.5448969, -2.915409, 1, 0.8941177, 0, 1,
-1.00852, -0.357924, -0.7011802, 1, 0.8980392, 0, 1,
-0.9964572, 1.272375, -0.7006679, 1, 0.9058824, 0, 1,
-0.9957284, -1.07985, -3.124698, 1, 0.9137255, 0, 1,
-0.9934583, 0.8943526, 0.1037184, 1, 0.9176471, 0, 1,
-0.9819305, 0.3133866, 0.04159309, 1, 0.9254902, 0, 1,
-0.9812309, 0.5701618, -1.322091, 1, 0.9294118, 0, 1,
-0.971489, -0.1144655, -2.203864, 1, 0.9372549, 0, 1,
-0.9652519, 0.4487327, 0.3002583, 1, 0.9411765, 0, 1,
-0.9623346, 1.390889, -0.5607554, 1, 0.9490196, 0, 1,
-0.9618865, 0.861081, 1.28438, 1, 0.9529412, 0, 1,
-0.9597552, 0.7776851, 0.2039409, 1, 0.9607843, 0, 1,
-0.9546741, 0.6123253, -2.013756, 1, 0.9647059, 0, 1,
-0.9539931, 0.313218, 1.106057, 1, 0.972549, 0, 1,
-0.9528792, -1.824793, -3.13242, 1, 0.9764706, 0, 1,
-0.9484311, 0.7220741, -1.717675, 1, 0.9843137, 0, 1,
-0.9480227, -0.1565853, -1.934512, 1, 0.9882353, 0, 1,
-0.9443151, -1.288374, -4.234631, 1, 0.9960784, 0, 1,
-0.9442244, 0.7087869, -0.4683548, 0.9960784, 1, 0, 1,
-0.9380606, -2.601661, -4.109566, 0.9921569, 1, 0, 1,
-0.9373369, 0.8112216, -0.1176286, 0.9843137, 1, 0, 1,
-0.9345291, -1.088114, -1.6795, 0.9803922, 1, 0, 1,
-0.9342326, 0.3320462, -0.3279743, 0.972549, 1, 0, 1,
-0.9329563, 0.4153008, -0.3053153, 0.9686275, 1, 0, 1,
-0.9314919, -2.098749, -2.146868, 0.9607843, 1, 0, 1,
-0.9297124, 0.3332848, 2.133761, 0.9568627, 1, 0, 1,
-0.9251393, 0.8572719, -1.583392, 0.9490196, 1, 0, 1,
-0.9237608, -0.6022048, -2.793129, 0.945098, 1, 0, 1,
-0.9235515, -0.5411766, -2.397542, 0.9372549, 1, 0, 1,
-0.9208101, -0.4052076, -3.08752, 0.9333333, 1, 0, 1,
-0.9185579, 1.056366, 0.6144285, 0.9254902, 1, 0, 1,
-0.9171767, -0.2685788, -2.085207, 0.9215686, 1, 0, 1,
-0.9140084, -0.5353526, -2.137571, 0.9137255, 1, 0, 1,
-0.9139137, -1.175592, -3.16522, 0.9098039, 1, 0, 1,
-0.9092844, 1.112772, -0.7524304, 0.9019608, 1, 0, 1,
-0.9081695, -1.073363, -0.8404022, 0.8941177, 1, 0, 1,
-0.9074615, -1.51314, -2.579522, 0.8901961, 1, 0, 1,
-0.9018283, -0.4210331, -1.731397, 0.8823529, 1, 0, 1,
-0.8999115, -0.6437311, -2.457411, 0.8784314, 1, 0, 1,
-0.8997518, 0.4202389, 0.09447314, 0.8705882, 1, 0, 1,
-0.8983107, -0.04317888, -2.883728, 0.8666667, 1, 0, 1,
-0.8916817, -1.611657, -3.227179, 0.8588235, 1, 0, 1,
-0.8779595, -0.5682291, -1.963683, 0.854902, 1, 0, 1,
-0.8767242, 0.3174, -2.633828, 0.8470588, 1, 0, 1,
-0.8689637, 2.261163, 0.7084869, 0.8431373, 1, 0, 1,
-0.8569778, -0.3720375, -1.448651, 0.8352941, 1, 0, 1,
-0.8525795, -1.513581, -2.437716, 0.8313726, 1, 0, 1,
-0.8477697, -1.177865, -2.442893, 0.8235294, 1, 0, 1,
-0.8461869, -0.05729098, -1.308291, 0.8196079, 1, 0, 1,
-0.8461087, 0.7326893, -1.338881, 0.8117647, 1, 0, 1,
-0.8448617, -0.8910156, -3.390405, 0.8078431, 1, 0, 1,
-0.8412228, -1.040709, -0.1055752, 0.8, 1, 0, 1,
-0.8364044, -0.7366213, -2.014577, 0.7921569, 1, 0, 1,
-0.831817, 1.865246, 0.1302918, 0.7882353, 1, 0, 1,
-0.8240603, 1.097699, 0.2740547, 0.7803922, 1, 0, 1,
-0.8236837, -0.05547128, -0.9903118, 0.7764706, 1, 0, 1,
-0.8227755, -0.3480885, -2.233119, 0.7686275, 1, 0, 1,
-0.811321, -1.842654, -2.552796, 0.7647059, 1, 0, 1,
-0.8082302, 0.9590113, 0.456223, 0.7568628, 1, 0, 1,
-0.8082044, 1.591438, -0.4180858, 0.7529412, 1, 0, 1,
-0.8061011, -0.115899, -1.331654, 0.7450981, 1, 0, 1,
-0.8059213, 0.01661066, -2.318214, 0.7411765, 1, 0, 1,
-0.8046919, 0.9851578, -1.77273, 0.7333333, 1, 0, 1,
-0.8012434, -0.2139466, -2.827919, 0.7294118, 1, 0, 1,
-0.7995131, -2.514515, -2.374424, 0.7215686, 1, 0, 1,
-0.7986463, -2.169388, -3.03931, 0.7176471, 1, 0, 1,
-0.7982794, -0.425111, -1.693821, 0.7098039, 1, 0, 1,
-0.7939473, 1.305491, 0.09845746, 0.7058824, 1, 0, 1,
-0.7933364, -1.416386, -3.488863, 0.6980392, 1, 0, 1,
-0.7924674, -0.4843163, -3.978002, 0.6901961, 1, 0, 1,
-0.791483, 1.128879, 0.3175364, 0.6862745, 1, 0, 1,
-0.7866901, -0.001101452, -1.970763, 0.6784314, 1, 0, 1,
-0.7784079, 1.040454, -1.800564, 0.6745098, 1, 0, 1,
-0.7667512, -0.9468668, -2.123868, 0.6666667, 1, 0, 1,
-0.7646326, -1.184428, -2.40518, 0.6627451, 1, 0, 1,
-0.7621915, -0.8738264, -3.836416, 0.654902, 1, 0, 1,
-0.7616263, -1.264354, -2.126627, 0.6509804, 1, 0, 1,
-0.759672, -0.971266, -2.602646, 0.6431373, 1, 0, 1,
-0.7537932, -3.137911, -4.666592, 0.6392157, 1, 0, 1,
-0.7527879, -0.776725, -0.7264174, 0.6313726, 1, 0, 1,
-0.7325322, 0.3077224, 0.8131556, 0.627451, 1, 0, 1,
-0.7301049, 1.626521, -0.8199565, 0.6196079, 1, 0, 1,
-0.721709, 0.8326011, -2.026566, 0.6156863, 1, 0, 1,
-0.7141441, 0.4584289, 0.5360878, 0.6078432, 1, 0, 1,
-0.7132019, -0.650928, -1.208997, 0.6039216, 1, 0, 1,
-0.7124413, -0.243719, -0.9165936, 0.5960785, 1, 0, 1,
-0.7117077, 0.1638065, -0.3890514, 0.5882353, 1, 0, 1,
-0.7110644, -1.627428, -4.526295, 0.5843138, 1, 0, 1,
-0.7087721, -1.052627, -4.206888, 0.5764706, 1, 0, 1,
-0.7061138, -1.368953, -3.044937, 0.572549, 1, 0, 1,
-0.7054818, -0.9114186, -1.246649, 0.5647059, 1, 0, 1,
-0.7043333, -0.8013467, -3.337345, 0.5607843, 1, 0, 1,
-0.7007841, 0.7274266, -1.817268, 0.5529412, 1, 0, 1,
-0.7007832, 0.8200078, -1.18168, 0.5490196, 1, 0, 1,
-0.6889072, 0.01539188, 0.4218924, 0.5411765, 1, 0, 1,
-0.6882258, -0.5999469, -3.901067, 0.5372549, 1, 0, 1,
-0.6875924, -0.5215153, -1.279359, 0.5294118, 1, 0, 1,
-0.6837299, -0.790123, -0.3331119, 0.5254902, 1, 0, 1,
-0.6827095, -0.08782099, -0.7535157, 0.5176471, 1, 0, 1,
-0.6779308, -0.3930167, -2.909331, 0.5137255, 1, 0, 1,
-0.676269, 1.865455, -0.9216827, 0.5058824, 1, 0, 1,
-0.6718639, 1.860692, -0.7437419, 0.5019608, 1, 0, 1,
-0.6685847, -0.8509596, -2.872355, 0.4941176, 1, 0, 1,
-0.6660343, 1.109396, -0.3399123, 0.4862745, 1, 0, 1,
-0.6627886, 0.08147885, -2.304088, 0.4823529, 1, 0, 1,
-0.6592801, -1.351929, -4.062292, 0.4745098, 1, 0, 1,
-0.6580161, 2.034214, -0.7595899, 0.4705882, 1, 0, 1,
-0.6488609, 0.2127929, -2.481756, 0.4627451, 1, 0, 1,
-0.6485486, -2.292969, -2.92399, 0.4588235, 1, 0, 1,
-0.6484121, 0.7533899, -1.007972, 0.4509804, 1, 0, 1,
-0.6483427, 0.06117459, -3.455367, 0.4470588, 1, 0, 1,
-0.6454077, -0.4796324, -0.8776691, 0.4392157, 1, 0, 1,
-0.6430188, -0.06305899, -0.4483741, 0.4352941, 1, 0, 1,
-0.6425633, 1.249844, 0.8182996, 0.427451, 1, 0, 1,
-0.641166, 0.7770022, 0.877875, 0.4235294, 1, 0, 1,
-0.6283934, 1.070586, 0.2542638, 0.4156863, 1, 0, 1,
-0.6274028, 2.154398, -2.236804, 0.4117647, 1, 0, 1,
-0.6266729, 0.1805551, -1.043275, 0.4039216, 1, 0, 1,
-0.625914, -0.6999726, -2.081927, 0.3960784, 1, 0, 1,
-0.622218, 1.012762, -2.074451, 0.3921569, 1, 0, 1,
-0.6159859, -0.9984912, -3.941798, 0.3843137, 1, 0, 1,
-0.6146587, 0.0477775, -1.573145, 0.3803922, 1, 0, 1,
-0.613883, 0.2975484, -2.459548, 0.372549, 1, 0, 1,
-0.6120829, -1.81143, -2.216992, 0.3686275, 1, 0, 1,
-0.6056035, 1.396427, -1.794451, 0.3607843, 1, 0, 1,
-0.6041311, 0.4812838, -0.2716436, 0.3568628, 1, 0, 1,
-0.6035896, 0.6655474, -0.9156584, 0.3490196, 1, 0, 1,
-0.5988308, 0.06587025, -2.590105, 0.345098, 1, 0, 1,
-0.5979341, -0.4554761, -0.3814118, 0.3372549, 1, 0, 1,
-0.5971147, 2.191915, -1.52448, 0.3333333, 1, 0, 1,
-0.5969843, 0.1844243, -3.366352, 0.3254902, 1, 0, 1,
-0.5958142, -0.7040494, -1.288125, 0.3215686, 1, 0, 1,
-0.5881055, 0.382934, -2.216432, 0.3137255, 1, 0, 1,
-0.5832556, -0.3119573, -3.198535, 0.3098039, 1, 0, 1,
-0.5832313, 1.583643, -0.8857501, 0.3019608, 1, 0, 1,
-0.5778599, -0.1598165, -3.037223, 0.2941177, 1, 0, 1,
-0.5758325, 0.5784594, 0.2347186, 0.2901961, 1, 0, 1,
-0.5741097, -0.4320456, -2.203303, 0.282353, 1, 0, 1,
-0.570024, 0.1837136, -1.353519, 0.2784314, 1, 0, 1,
-0.5694828, -1.144866, -2.3695, 0.2705882, 1, 0, 1,
-0.5687065, 0.3228184, -2.239785, 0.2666667, 1, 0, 1,
-0.5612105, -0.5966203, -2.205914, 0.2588235, 1, 0, 1,
-0.5605773, -1.680727, -2.094355, 0.254902, 1, 0, 1,
-0.5592574, 0.3246392, -2.250181, 0.2470588, 1, 0, 1,
-0.5484325, 0.1241452, -1.802314, 0.2431373, 1, 0, 1,
-0.5473889, -0.7054192, -3.275266, 0.2352941, 1, 0, 1,
-0.5382515, 2.660776, -0.8136526, 0.2313726, 1, 0, 1,
-0.5382324, -0.3612759, -3.401962, 0.2235294, 1, 0, 1,
-0.5379294, -0.7440864, -2.751638, 0.2196078, 1, 0, 1,
-0.5373426, -1.496224, -1.215735, 0.2117647, 1, 0, 1,
-0.5346214, -0.8249233, -3.389942, 0.2078431, 1, 0, 1,
-0.5277019, -0.3359617, -1.179188, 0.2, 1, 0, 1,
-0.5219632, -0.56937, -2.26898, 0.1921569, 1, 0, 1,
-0.5197818, 1.819487, 0.01706656, 0.1882353, 1, 0, 1,
-0.5176256, -1.126803, -2.338291, 0.1803922, 1, 0, 1,
-0.5173131, 0.4953379, 0.2128912, 0.1764706, 1, 0, 1,
-0.5164947, -1.812707, -3.187409, 0.1686275, 1, 0, 1,
-0.5100086, 0.6101118, -0.7468211, 0.1647059, 1, 0, 1,
-0.509885, 1.763632, 1.101058, 0.1568628, 1, 0, 1,
-0.5074577, -0.9308307, -2.683508, 0.1529412, 1, 0, 1,
-0.5036173, 0.07737669, -1.306731, 0.145098, 1, 0, 1,
-0.5034645, -0.3312216, -1.351436, 0.1411765, 1, 0, 1,
-0.5031536, -0.2770484, -4.015567, 0.1333333, 1, 0, 1,
-0.5023534, -1.020007, -3.610767, 0.1294118, 1, 0, 1,
-0.5021532, -0.5245512, -2.345747, 0.1215686, 1, 0, 1,
-0.5006575, -0.2831575, -3.018972, 0.1176471, 1, 0, 1,
-0.4945622, 0.4454069, 0.7491544, 0.1098039, 1, 0, 1,
-0.494104, -0.1008438, -2.454691, 0.1058824, 1, 0, 1,
-0.4884523, -0.7181383, -3.909553, 0.09803922, 1, 0, 1,
-0.4875792, 0.9137363, -0.5395615, 0.09019608, 1, 0, 1,
-0.4842299, -0.6542785, -1.308892, 0.08627451, 1, 0, 1,
-0.4820184, -0.5576865, -2.64193, 0.07843138, 1, 0, 1,
-0.4808644, 0.6103032, 0.2293936, 0.07450981, 1, 0, 1,
-0.4789622, -0.5262654, -1.272493, 0.06666667, 1, 0, 1,
-0.4655024, 0.3700261, -1.795755, 0.0627451, 1, 0, 1,
-0.4634584, 0.1790198, 0.4243998, 0.05490196, 1, 0, 1,
-0.4632477, 0.7157993, -1.193738, 0.05098039, 1, 0, 1,
-0.458294, -1.025007, -3.756378, 0.04313726, 1, 0, 1,
-0.4581496, 1.193643, 1.516036, 0.03921569, 1, 0, 1,
-0.4570719, -0.5303355, -3.237671, 0.03137255, 1, 0, 1,
-0.4562066, -1.08017, -2.0952, 0.02745098, 1, 0, 1,
-0.4540599, -0.3293149, -2.535087, 0.01960784, 1, 0, 1,
-0.4467042, 0.05042604, -2.615922, 0.01568628, 1, 0, 1,
-0.4388483, -0.5683263, -2.758416, 0.007843138, 1, 0, 1,
-0.4346063, 0.3479628, -1.518018, 0.003921569, 1, 0, 1,
-0.4335747, -0.09856122, -1.821986, 0, 1, 0.003921569, 1,
-0.429878, 1.338577, 0.8634537, 0, 1, 0.01176471, 1,
-0.4281522, -0.09388404, -1.184426, 0, 1, 0.01568628, 1,
-0.4278228, -1.228206, -3.365994, 0, 1, 0.02352941, 1,
-0.4192104, 0.5182038, -1.589058, 0, 1, 0.02745098, 1,
-0.4100992, 1.612953, 0.1494, 0, 1, 0.03529412, 1,
-0.404495, 0.1748425, -0.5505177, 0, 1, 0.03921569, 1,
-0.4004742, -1.945662, -2.418282, 0, 1, 0.04705882, 1,
-0.4004632, -0.6204135, -2.415765, 0, 1, 0.05098039, 1,
-0.3982303, 0.9043492, -0.363427, 0, 1, 0.05882353, 1,
-0.3961386, -1.48934, -2.700107, 0, 1, 0.0627451, 1,
-0.3957004, -1.509047, -2.223601, 0, 1, 0.07058824, 1,
-0.3871142, 0.9873798, -0.8964181, 0, 1, 0.07450981, 1,
-0.3865434, -1.304021, -4.514013, 0, 1, 0.08235294, 1,
-0.3856293, -0.08905749, -3.388093, 0, 1, 0.08627451, 1,
-0.3823507, 0.6927494, -0.9512707, 0, 1, 0.09411765, 1,
-0.3753865, 0.05171924, -2.228239, 0, 1, 0.1019608, 1,
-0.3698702, -0.1446712, -1.280903, 0, 1, 0.1058824, 1,
-0.3677413, -1.59906, -1.985933, 0, 1, 0.1137255, 1,
-0.3677363, -1.739366, -2.746737, 0, 1, 0.1176471, 1,
-0.3676259, 0.3618734, -0.4844789, 0, 1, 0.1254902, 1,
-0.3612475, 2.080962, 2.133053, 0, 1, 0.1294118, 1,
-0.3586729, -0.4354368, -0.9035766, 0, 1, 0.1372549, 1,
-0.3580588, -0.86911, -3.55167, 0, 1, 0.1411765, 1,
-0.3554374, -1.17284, -3.439582, 0, 1, 0.1490196, 1,
-0.3512809, -0.4336442, -0.3258182, 0, 1, 0.1529412, 1,
-0.341687, -0.2358428, -1.35306, 0, 1, 0.1607843, 1,
-0.3416023, -0.6162916, -3.6764, 0, 1, 0.1647059, 1,
-0.3386128, -0.7118438, -3.799429, 0, 1, 0.172549, 1,
-0.3384983, -1.336309, -3.754294, 0, 1, 0.1764706, 1,
-0.3369266, -0.2628224, -3.978495, 0, 1, 0.1843137, 1,
-0.3342144, 0.7577485, 0.3970878, 0, 1, 0.1882353, 1,
-0.3305343, 1.119604, -1.42133, 0, 1, 0.1960784, 1,
-0.328437, -0.356907, -3.627446, 0, 1, 0.2039216, 1,
-0.3274727, 0.1347037, -0.9193391, 0, 1, 0.2078431, 1,
-0.3225529, 1.160643, 0.753722, 0, 1, 0.2156863, 1,
-0.3209321, -0.5889726, -2.367443, 0, 1, 0.2196078, 1,
-0.3200288, 1.709092, 0.8058465, 0, 1, 0.227451, 1,
-0.3194338, -0.9966261, -2.702703, 0, 1, 0.2313726, 1,
-0.3181773, -0.4913543, -3.43959, 0, 1, 0.2392157, 1,
-0.3175222, -1.022535, -3.257962, 0, 1, 0.2431373, 1,
-0.3134261, 0.5991072, 0.5121742, 0, 1, 0.2509804, 1,
-0.3120755, -1.684273, -2.107687, 0, 1, 0.254902, 1,
-0.311157, 2.372603, -0.2542863, 0, 1, 0.2627451, 1,
-0.3087455, -0.8371178, -3.1338, 0, 1, 0.2666667, 1,
-0.3083883, 0.8549598, -1.899047, 0, 1, 0.2745098, 1,
-0.2999302, -0.3179643, -4.286037, 0, 1, 0.2784314, 1,
-0.2914889, 0.6641522, -1.553576, 0, 1, 0.2862745, 1,
-0.2905566, 0.3842579, -0.398376, 0, 1, 0.2901961, 1,
-0.2890823, 0.6341848, -2.590403, 0, 1, 0.2980392, 1,
-0.2863151, 1.173533, -1.746511, 0, 1, 0.3058824, 1,
-0.2861797, 0.08612072, -0.9100977, 0, 1, 0.3098039, 1,
-0.2855613, -0.2544245, -3.667206, 0, 1, 0.3176471, 1,
-0.2823689, -0.692582, -3.13154, 0, 1, 0.3215686, 1,
-0.2793636, 1.533097, -0.9668913, 0, 1, 0.3294118, 1,
-0.2774069, 0.6703818, -0.5682865, 0, 1, 0.3333333, 1,
-0.2732141, 0.3245781, -2.334288, 0, 1, 0.3411765, 1,
-0.272848, -0.557866, -3.46911, 0, 1, 0.345098, 1,
-0.2716917, -0.2843236, 0.4915552, 0, 1, 0.3529412, 1,
-0.270772, -0.08598063, -2.932475, 0, 1, 0.3568628, 1,
-0.2697086, 1.421793, 1.40484, 0, 1, 0.3647059, 1,
-0.2696638, -1.72229, -2.19281, 0, 1, 0.3686275, 1,
-0.2665129, 1.742214, -1.613034, 0, 1, 0.3764706, 1,
-0.2652937, -0.5574572, -4.587532, 0, 1, 0.3803922, 1,
-0.2645086, 0.9297966, 0.2813342, 0, 1, 0.3882353, 1,
-0.2595351, 1.088209, 0.3009962, 0, 1, 0.3921569, 1,
-0.2551894, 0.6678668, -1.734929, 0, 1, 0.4, 1,
-0.2549425, 0.9702182, -0.5298784, 0, 1, 0.4078431, 1,
-0.2529272, -0.3974768, -2.25684, 0, 1, 0.4117647, 1,
-0.2476738, -1.279607, -3.421431, 0, 1, 0.4196078, 1,
-0.245089, 1.934766, -1.32723, 0, 1, 0.4235294, 1,
-0.2436336, -2.158793, -2.647971, 0, 1, 0.4313726, 1,
-0.2405979, 0.2681978, -0.2859553, 0, 1, 0.4352941, 1,
-0.2374003, -1.032013, -3.748143, 0, 1, 0.4431373, 1,
-0.2366744, -0.9499306, -3.089844, 0, 1, 0.4470588, 1,
-0.2364709, -0.6095662, -0.6467069, 0, 1, 0.454902, 1,
-0.2337439, 1.506604, 0.871549, 0, 1, 0.4588235, 1,
-0.2222688, 0.2392069, 1.502503, 0, 1, 0.4666667, 1,
-0.2164607, -0.6129405, -0.6616202, 0, 1, 0.4705882, 1,
-0.2077414, 2.468403, 0.02875276, 0, 1, 0.4784314, 1,
-0.2076021, -0.2332053, -2.144855, 0, 1, 0.4823529, 1,
-0.2013954, -0.5054792, -3.168934, 0, 1, 0.4901961, 1,
-0.2005996, 1.258718, -0.3854197, 0, 1, 0.4941176, 1,
-0.1987524, -0.6612455, -3.273788, 0, 1, 0.5019608, 1,
-0.1942966, 0.06726091, -2.050742, 0, 1, 0.509804, 1,
-0.193506, -0.03151852, -0.4922388, 0, 1, 0.5137255, 1,
-0.1859498, 1.580932, 0.6176094, 0, 1, 0.5215687, 1,
-0.1849201, 1.510395, 0.4520391, 0, 1, 0.5254902, 1,
-0.1846419, 0.9918223, -0.7740701, 0, 1, 0.5333334, 1,
-0.1815386, -1.25167, -2.369793, 0, 1, 0.5372549, 1,
-0.1799399, 1.408558, 1.107314, 0, 1, 0.5450981, 1,
-0.1777319, -0.3030319, -3.057999, 0, 1, 0.5490196, 1,
-0.1768453, 0.2387519, -0.06657722, 0, 1, 0.5568628, 1,
-0.1731092, 0.4599227, -2.217841, 0, 1, 0.5607843, 1,
-0.1715893, 0.4906676, -1.788522, 0, 1, 0.5686275, 1,
-0.1696446, -1.711909, -3.217317, 0, 1, 0.572549, 1,
-0.1626146, 0.5683458, -1.526846, 0, 1, 0.5803922, 1,
-0.1592277, 0.3872292, -1.126047, 0, 1, 0.5843138, 1,
-0.1556484, 0.7252632, -0.9791457, 0, 1, 0.5921569, 1,
-0.1547567, 0.03496403, -2.093501, 0, 1, 0.5960785, 1,
-0.1475906, 1.504141, 0.7959321, 0, 1, 0.6039216, 1,
-0.1464673, -0.7343392, -3.350239, 0, 1, 0.6117647, 1,
-0.1424154, -1.665022, -1.973132, 0, 1, 0.6156863, 1,
-0.142031, -0.04852497, -2.110271, 0, 1, 0.6235294, 1,
-0.1412148, -0.7541775, -3.332669, 0, 1, 0.627451, 1,
-0.1393388, -0.741116, -2.513941, 0, 1, 0.6352941, 1,
-0.1331835, 1.184922, -1.898085, 0, 1, 0.6392157, 1,
-0.1290379, 1.329096, -0.5358441, 0, 1, 0.6470588, 1,
-0.1258226, -1.16022, -3.707066, 0, 1, 0.6509804, 1,
-0.1253752, -1.952902, -3.864766, 0, 1, 0.6588235, 1,
-0.1246728, 0.04388431, -0.8268133, 0, 1, 0.6627451, 1,
-0.1232503, -0.3497503, -5.02953, 0, 1, 0.6705883, 1,
-0.1157108, 0.4087439, 0.8523769, 0, 1, 0.6745098, 1,
-0.1129271, -0.7018499, -3.922873, 0, 1, 0.682353, 1,
-0.1110249, 0.3546437, -2.753018, 0, 1, 0.6862745, 1,
-0.1103631, 1.159924, -0.775457, 0, 1, 0.6941177, 1,
-0.1089589, 0.2343002, -0.6034541, 0, 1, 0.7019608, 1,
-0.1001422, 0.5422735, -0.4279658, 0, 1, 0.7058824, 1,
-0.1000022, -0.1115278, -1.181124, 0, 1, 0.7137255, 1,
-0.09878611, -0.8908554, -4.060502, 0, 1, 0.7176471, 1,
-0.09659891, -0.6351117, -3.533393, 0, 1, 0.7254902, 1,
-0.09488247, -0.625294, -0.7980313, 0, 1, 0.7294118, 1,
-0.09430663, -0.3123347, -0.06322155, 0, 1, 0.7372549, 1,
-0.09114315, 0.02573223, -1.324629, 0, 1, 0.7411765, 1,
-0.08349569, -1.501228, -2.802676, 0, 1, 0.7490196, 1,
-0.07966305, -0.2568145, -3.929257, 0, 1, 0.7529412, 1,
-0.07874981, -1.963089, -4.076374, 0, 1, 0.7607843, 1,
-0.07753538, 0.4725129, 0.9500183, 0, 1, 0.7647059, 1,
-0.07640015, -2.792537, -4.189753, 0, 1, 0.772549, 1,
-0.07475588, -0.3782071, -1.674833, 0, 1, 0.7764706, 1,
-0.0639587, 1.334701, -2.950016, 0, 1, 0.7843137, 1,
-0.06193213, 0.8914865, 0.5564315, 0, 1, 0.7882353, 1,
-0.06161504, 1.281137, 1.189113, 0, 1, 0.7960784, 1,
-0.05698432, 1.104247, 2.277739, 0, 1, 0.8039216, 1,
-0.05620181, 2.09233, -1.457903, 0, 1, 0.8078431, 1,
-0.05602071, -0.3277334, -3.273713, 0, 1, 0.8156863, 1,
-0.05116398, 0.09035143, -0.4998536, 0, 1, 0.8196079, 1,
-0.04926264, -0.2967937, -3.056235, 0, 1, 0.827451, 1,
-0.04822812, 0.3196878, 1.350844, 0, 1, 0.8313726, 1,
-0.04803712, 0.6374549, -0.405731, 0, 1, 0.8392157, 1,
-0.04407953, -0.9925476, -4.075363, 0, 1, 0.8431373, 1,
-0.04324379, 0.8038085, -1.077505, 0, 1, 0.8509804, 1,
-0.04280759, 0.3302877, -0.3887751, 0, 1, 0.854902, 1,
-0.04004854, -0.6798126, -3.203517, 0, 1, 0.8627451, 1,
-0.03813025, -1.575771, -3.1932, 0, 1, 0.8666667, 1,
-0.03785983, -0.7253454, -5.453321, 0, 1, 0.8745098, 1,
-0.03236864, -0.2112297, -2.824907, 0, 1, 0.8784314, 1,
-0.03092736, 0.1829654, -0.02540632, 0, 1, 0.8862745, 1,
-0.02909394, -0.242342, -1.107067, 0, 1, 0.8901961, 1,
-0.02901084, -0.7875466, -2.889041, 0, 1, 0.8980392, 1,
-0.02291728, -2.661747, -3.502634, 0, 1, 0.9058824, 1,
-0.02041122, 0.2939505, 1.056646, 0, 1, 0.9098039, 1,
-0.01889481, -0.2729442, -2.387701, 0, 1, 0.9176471, 1,
-0.0150253, 0.6827997, 0.6613422, 0, 1, 0.9215686, 1,
-0.01448525, 1.624108, -1.056335, 0, 1, 0.9294118, 1,
-0.01400836, 0.6351856, -0.01970076, 0, 1, 0.9333333, 1,
-0.01251697, -0.0439278, -3.107679, 0, 1, 0.9411765, 1,
-0.01193093, 0.2200488, -2.172162, 0, 1, 0.945098, 1,
-0.009893142, 0.06717358, -0.1440109, 0, 1, 0.9529412, 1,
-0.009607928, -1.03792, -5.490887, 0, 1, 0.9568627, 1,
-0.009168883, -0.2641145, -3.109761, 0, 1, 0.9647059, 1,
-0.004480413, 0.797703, 0.9974461, 0, 1, 0.9686275, 1,
-0.003655801, -1.94696, -3.516391, 0, 1, 0.9764706, 1,
-0.0004087267, -0.1450286, -3.770419, 0, 1, 0.9803922, 1,
0.004470631, 0.7749293, -1.732001, 0, 1, 0.9882353, 1,
0.006859578, -1.186052, 3.026718, 0, 1, 0.9921569, 1,
0.01237727, -0.4802121, 2.872678, 0, 1, 1, 1,
0.013838, 0.5981331, -0.2229431, 0, 0.9921569, 1, 1,
0.01511305, 0.8631206, -0.5479497, 0, 0.9882353, 1, 1,
0.01541969, 0.3704017, 0.8735873, 0, 0.9803922, 1, 1,
0.02106708, 0.5644596, 0.9871377, 0, 0.9764706, 1, 1,
0.0223129, -1.945811, 3.024973, 0, 0.9686275, 1, 1,
0.02332437, 1.154275, -0.9363955, 0, 0.9647059, 1, 1,
0.02663784, 0.3837195, -1.305461, 0, 0.9568627, 1, 1,
0.02813119, -0.1722602, 3.627161, 0, 0.9529412, 1, 1,
0.02885408, -0.02932968, 2.132442, 0, 0.945098, 1, 1,
0.02890634, -0.4363413, 3.575546, 0, 0.9411765, 1, 1,
0.03200524, -1.348142, 4.36876, 0, 0.9333333, 1, 1,
0.0323181, -0.6530885, 2.231367, 0, 0.9294118, 1, 1,
0.03356261, 2.837201, -0.1987077, 0, 0.9215686, 1, 1,
0.03677782, 2.101406, -0.9413497, 0, 0.9176471, 1, 1,
0.03826138, 0.304624, 1.66764, 0, 0.9098039, 1, 1,
0.04048374, -0.01369081, 1.651678, 0, 0.9058824, 1, 1,
0.04334658, -0.5205747, 1.097142, 0, 0.8980392, 1, 1,
0.04343922, 0.4751732, -0.3206285, 0, 0.8901961, 1, 1,
0.0442615, -1.230318, 2.965289, 0, 0.8862745, 1, 1,
0.04518311, 0.3104453, 0.6870459, 0, 0.8784314, 1, 1,
0.04568991, 2.689965, -0.6574742, 0, 0.8745098, 1, 1,
0.05339118, 0.2707891, -0.5129925, 0, 0.8666667, 1, 1,
0.05852605, 0.5760244, 0.4550566, 0, 0.8627451, 1, 1,
0.0630036, 0.08104459, 2.635937, 0, 0.854902, 1, 1,
0.06523953, 0.1699906, 0.5623127, 0, 0.8509804, 1, 1,
0.0657852, 0.03453922, 0.6848007, 0, 0.8431373, 1, 1,
0.06585263, 1.106707, 0.9695583, 0, 0.8392157, 1, 1,
0.07333357, 0.08317285, 1.069477, 0, 0.8313726, 1, 1,
0.07614885, -0.04013852, 2.756641, 0, 0.827451, 1, 1,
0.0764877, 0.7882534, -0.3632113, 0, 0.8196079, 1, 1,
0.0771442, 2.131848, 0.4368176, 0, 0.8156863, 1, 1,
0.08010027, 1.136731, 0.2113291, 0, 0.8078431, 1, 1,
0.08225875, -0.2174296, 2.694746, 0, 0.8039216, 1, 1,
0.08244157, 1.531336, 0.9685054, 0, 0.7960784, 1, 1,
0.08345882, -0.02228099, 1.768974, 0, 0.7882353, 1, 1,
0.08616018, 1.755311, -0.5234789, 0, 0.7843137, 1, 1,
0.09104966, 1.977294, -0.5234326, 0, 0.7764706, 1, 1,
0.1031499, 1.527411, 0.442492, 0, 0.772549, 1, 1,
0.1100039, -0.3487256, 1.11085, 0, 0.7647059, 1, 1,
0.1105778, -0.6203167, 1.335781, 0, 0.7607843, 1, 1,
0.1129573, 1.815534, 0.8298669, 0, 0.7529412, 1, 1,
0.1133932, -0.1044272, 0.9223991, 0, 0.7490196, 1, 1,
0.1141702, -0.146063, 1.961677, 0, 0.7411765, 1, 1,
0.1157958, -0.0655002, 1.853531, 0, 0.7372549, 1, 1,
0.1203172, 0.1578764, 3.19751, 0, 0.7294118, 1, 1,
0.1212011, 0.05856405, 1.408456, 0, 0.7254902, 1, 1,
0.1217021, -1.341899, 1.1453, 0, 0.7176471, 1, 1,
0.1266569, 0.356724, 0.2738416, 0, 0.7137255, 1, 1,
0.1290038, -1.01213, 1.532712, 0, 0.7058824, 1, 1,
0.1305071, -0.4308701, 2.03431, 0, 0.6980392, 1, 1,
0.1316616, 1.355489, -0.008853181, 0, 0.6941177, 1, 1,
0.1338093, 0.2356534, 0.06238351, 0, 0.6862745, 1, 1,
0.1360091, -0.4569244, 2.586897, 0, 0.682353, 1, 1,
0.137845, -0.7312692, 1.68117, 0, 0.6745098, 1, 1,
0.1388049, -0.3973116, 2.931792, 0, 0.6705883, 1, 1,
0.139199, -0.6018412, 1.601147, 0, 0.6627451, 1, 1,
0.1411466, -0.9977188, 1.620641, 0, 0.6588235, 1, 1,
0.1448981, 0.06043223, 1.088163, 0, 0.6509804, 1, 1,
0.1482501, 0.1823664, -0.8045377, 0, 0.6470588, 1, 1,
0.1496819, 0.5672547, -0.02950537, 0, 0.6392157, 1, 1,
0.1541106, 0.5318615, 0.07972725, 0, 0.6352941, 1, 1,
0.1557116, 0.3608626, 1.255382, 0, 0.627451, 1, 1,
0.1575868, 0.3760741, 0.7352218, 0, 0.6235294, 1, 1,
0.1615896, 1.306073, 0.2856684, 0, 0.6156863, 1, 1,
0.1643359, -0.232356, 1.7043, 0, 0.6117647, 1, 1,
0.164538, -0.9095045, 1.758909, 0, 0.6039216, 1, 1,
0.1662939, -0.2655701, 1.66192, 0, 0.5960785, 1, 1,
0.1682182, -0.5520396, 4.507838, 0, 0.5921569, 1, 1,
0.1684897, -0.8934778, 3.615335, 0, 0.5843138, 1, 1,
0.1716208, 1.180125, -0.6780311, 0, 0.5803922, 1, 1,
0.1723896, 0.1296578, 2.386237, 0, 0.572549, 1, 1,
0.1730233, 1.004514, 0.5646104, 0, 0.5686275, 1, 1,
0.1734038, 1.099938, 0.5772994, 0, 0.5607843, 1, 1,
0.1758703, 0.5385072, -1.187098, 0, 0.5568628, 1, 1,
0.176172, 1.338969, -0.9389123, 0, 0.5490196, 1, 1,
0.1789896, -1.947282, 3.561865, 0, 0.5450981, 1, 1,
0.1793343, -0.0005801612, 3.027638, 0, 0.5372549, 1, 1,
0.1815396, -2.60929, 3.40754, 0, 0.5333334, 1, 1,
0.1869412, 0.653805, 0.4504417, 0, 0.5254902, 1, 1,
0.1870078, -1.109164, 3.274767, 0, 0.5215687, 1, 1,
0.1903151, -1.119614, 3.077989, 0, 0.5137255, 1, 1,
0.1933465, -1.710695, 3.321602, 0, 0.509804, 1, 1,
0.2009613, 0.3088498, 1.197516, 0, 0.5019608, 1, 1,
0.2027625, 1.836745, 1.069189, 0, 0.4941176, 1, 1,
0.2037101, -1.425573, 4.603539, 0, 0.4901961, 1, 1,
0.2098333, -0.3490802, 1.935228, 0, 0.4823529, 1, 1,
0.2168343, -0.7198969, 1.498972, 0, 0.4784314, 1, 1,
0.2195845, 0.4892657, -0.8864542, 0, 0.4705882, 1, 1,
0.2219634, -0.1597838, 1.32281, 0, 0.4666667, 1, 1,
0.2219795, -0.7716951, 2.809289, 0, 0.4588235, 1, 1,
0.2226449, 0.6443561, 1.053783, 0, 0.454902, 1, 1,
0.2231449, -1.579753, 4.367503, 0, 0.4470588, 1, 1,
0.2233734, -0.7605339, 2.029118, 0, 0.4431373, 1, 1,
0.2249379, 1.392875, 1.394497, 0, 0.4352941, 1, 1,
0.2274708, 0.8605958, 0.1728271, 0, 0.4313726, 1, 1,
0.2280407, 1.214187, 0.5697339, 0, 0.4235294, 1, 1,
0.2295579, 1.184797, -1.07956, 0, 0.4196078, 1, 1,
0.2321271, 1.188179, -1.802156, 0, 0.4117647, 1, 1,
0.2371498, 0.384145, 1.6019, 0, 0.4078431, 1, 1,
0.238612, -1.057879, 3.242228, 0, 0.4, 1, 1,
0.241129, 0.7045991, -0.6826245, 0, 0.3921569, 1, 1,
0.2423836, -0.3930228, 1.959174, 0, 0.3882353, 1, 1,
0.2429727, -0.2667257, 1.648676, 0, 0.3803922, 1, 1,
0.2440937, 1.154121, -0.6040238, 0, 0.3764706, 1, 1,
0.2450734, 0.8683723, -1.044546, 0, 0.3686275, 1, 1,
0.2500807, -0.8782938, 3.293171, 0, 0.3647059, 1, 1,
0.2512952, -0.08741505, 2.572445, 0, 0.3568628, 1, 1,
0.2551283, 0.7968042, -0.165633, 0, 0.3529412, 1, 1,
0.2555249, -0.05844322, 2.362309, 0, 0.345098, 1, 1,
0.2652056, -0.8699564, 1.314377, 0, 0.3411765, 1, 1,
0.2705772, 1.282096, -0.4400069, 0, 0.3333333, 1, 1,
0.273164, -1.490564, 1.649301, 0, 0.3294118, 1, 1,
0.2774908, -0.3434979, 3.481412, 0, 0.3215686, 1, 1,
0.2780429, -1.137419, 4.056998, 0, 0.3176471, 1, 1,
0.2846971, 0.8626895, 1.84317, 0, 0.3098039, 1, 1,
0.2869874, -1.079903, 2.303017, 0, 0.3058824, 1, 1,
0.2912392, 0.462164, -0.4306689, 0, 0.2980392, 1, 1,
0.2928045, -0.5659927, 4.083169, 0, 0.2901961, 1, 1,
0.2933683, 0.4200253, 3.069862, 0, 0.2862745, 1, 1,
0.2940897, -0.9731857, 0.5085056, 0, 0.2784314, 1, 1,
0.2982716, -1.181139, 3.597853, 0, 0.2745098, 1, 1,
0.299626, 1.020643, -0.1611769, 0, 0.2666667, 1, 1,
0.3007322, 0.6151913, 2.11229, 0, 0.2627451, 1, 1,
0.3040866, 0.5678646, 0.2585134, 0, 0.254902, 1, 1,
0.3051275, 0.8869006, 0.1257733, 0, 0.2509804, 1, 1,
0.3064288, 0.3925348, 1.132626, 0, 0.2431373, 1, 1,
0.3138101, -0.9730491, 3.027084, 0, 0.2392157, 1, 1,
0.3143144, -2.19406, 2.303374, 0, 0.2313726, 1, 1,
0.3163604, -0.8243834, 3.589038, 0, 0.227451, 1, 1,
0.3242991, -0.3098996, 1.287297, 0, 0.2196078, 1, 1,
0.3243976, -0.3930754, 2.664701, 0, 0.2156863, 1, 1,
0.3272968, -0.4196416, 2.71248, 0, 0.2078431, 1, 1,
0.329584, -0.2393751, 3.198209, 0, 0.2039216, 1, 1,
0.3343283, 0.5661258, 0.6421859, 0, 0.1960784, 1, 1,
0.3348268, -1.310581, 3.651515, 0, 0.1882353, 1, 1,
0.3351102, -2.025045, 1.749671, 0, 0.1843137, 1, 1,
0.3359502, -0.4994637, 4.474741, 0, 0.1764706, 1, 1,
0.338771, -1.383379, 4.104668, 0, 0.172549, 1, 1,
0.3401077, 0.1430547, 1.172725, 0, 0.1647059, 1, 1,
0.3424344, 0.1816142, 1.318569, 0, 0.1607843, 1, 1,
0.3431681, 0.4795012, 1.038062, 0, 0.1529412, 1, 1,
0.3518917, -1.165591, 2.082192, 0, 0.1490196, 1, 1,
0.353233, -0.6781009, 2.121762, 0, 0.1411765, 1, 1,
0.3629591, 0.7735515, -0.0244745, 0, 0.1372549, 1, 1,
0.3631377, -1.143435, 1.98208, 0, 0.1294118, 1, 1,
0.3651135, 1.46366, -0.8568127, 0, 0.1254902, 1, 1,
0.365586, 0.2279733, 2.920222, 0, 0.1176471, 1, 1,
0.3686293, 1.134926, 1.474423, 0, 0.1137255, 1, 1,
0.3699003, -0.5253633, 0.08069934, 0, 0.1058824, 1, 1,
0.3710663, 1.784896, 0.8160998, 0, 0.09803922, 1, 1,
0.3721816, -0.9742352, 2.234035, 0, 0.09411765, 1, 1,
0.3721968, -0.8583272, 3.551738, 0, 0.08627451, 1, 1,
0.373646, 0.02410777, 2.93843, 0, 0.08235294, 1, 1,
0.3738167, -0.3309345, 0.810119, 0, 0.07450981, 1, 1,
0.3742744, 1.885338, -0.1612475, 0, 0.07058824, 1, 1,
0.3782363, -1.217302, 2.771658, 0, 0.0627451, 1, 1,
0.3794343, -0.08230892, 2.161345, 0, 0.05882353, 1, 1,
0.3820013, -0.4373794, 1.70775, 0, 0.05098039, 1, 1,
0.3875782, 0.4491178, -0.3055567, 0, 0.04705882, 1, 1,
0.3911809, 2.723151, -0.780807, 0, 0.03921569, 1, 1,
0.3958312, -1.142904, 3.634738, 0, 0.03529412, 1, 1,
0.4043127, 0.6529963, -0.7791643, 0, 0.02745098, 1, 1,
0.4118208, -0.89625, 3.372257, 0, 0.02352941, 1, 1,
0.4139948, 1.309233, 0.7160797, 0, 0.01568628, 1, 1,
0.4149427, 0.7515958, 0.834552, 0, 0.01176471, 1, 1,
0.4150049, -0.8929812, 1.773296, 0, 0.003921569, 1, 1,
0.4162123, -1.007885, 3.410446, 0.003921569, 0, 1, 1,
0.41867, -0.3849267, 0.4155071, 0.007843138, 0, 1, 1,
0.4211488, -0.5801298, 3.654857, 0.01568628, 0, 1, 1,
0.4279553, 1.923981, -0.4679668, 0.01960784, 0, 1, 1,
0.4288103, 0.4353555, -0.2445765, 0.02745098, 0, 1, 1,
0.4316307, 0.121301, 1.99829, 0.03137255, 0, 1, 1,
0.439867, 0.3614877, 0.9014755, 0.03921569, 0, 1, 1,
0.4419067, -0.3039771, 1.966057, 0.04313726, 0, 1, 1,
0.4421081, 0.5790504, 0.4192584, 0.05098039, 0, 1, 1,
0.442139, 1.430346, -0.7324083, 0.05490196, 0, 1, 1,
0.442749, 1.156606, 0.2534634, 0.0627451, 0, 1, 1,
0.4450434, 0.1685569, 0.3886672, 0.06666667, 0, 1, 1,
0.445689, -0.5717145, 1.391709, 0.07450981, 0, 1, 1,
0.4459262, -1.599871, 3.24545, 0.07843138, 0, 1, 1,
0.4465534, -1.787765, 1.736481, 0.08627451, 0, 1, 1,
0.452044, -2.300127, 2.401687, 0.09019608, 0, 1, 1,
0.454485, 2.044848, -0.3437569, 0.09803922, 0, 1, 1,
0.4600388, -0.2899088, 2.903932, 0.1058824, 0, 1, 1,
0.4634066, -1.227234, 5.209879, 0.1098039, 0, 1, 1,
0.4665625, -1.3463, 2.521645, 0.1176471, 0, 1, 1,
0.4673611, 1.224567, 0.4480163, 0.1215686, 0, 1, 1,
0.468335, -0.7391208, 2.681625, 0.1294118, 0, 1, 1,
0.4692248, -1.617582, 1.732773, 0.1333333, 0, 1, 1,
0.471593, 0.6279643, -0.2344047, 0.1411765, 0, 1, 1,
0.4738373, -0.6472296, 1.426945, 0.145098, 0, 1, 1,
0.4755023, -1.618698, 3.946396, 0.1529412, 0, 1, 1,
0.4788596, -0.5308006, 2.845445, 0.1568628, 0, 1, 1,
0.4793133, -0.5255084, 3.23437, 0.1647059, 0, 1, 1,
0.4873999, -1.560514, 3.446601, 0.1686275, 0, 1, 1,
0.4882867, -1.600712, 1.960735, 0.1764706, 0, 1, 1,
0.4884863, 0.1853957, 0.97123, 0.1803922, 0, 1, 1,
0.4891592, 0.2073859, 1.143511, 0.1882353, 0, 1, 1,
0.4956183, -0.4519373, 1.675671, 0.1921569, 0, 1, 1,
0.4960665, 0.171693, 1.021001, 0.2, 0, 1, 1,
0.4987454, 0.4557068, 0.5322152, 0.2078431, 0, 1, 1,
0.5019696, -1.092865, 1.857059, 0.2117647, 0, 1, 1,
0.502618, -0.5938027, 2.002086, 0.2196078, 0, 1, 1,
0.5026446, 0.4474889, 1.484237, 0.2235294, 0, 1, 1,
0.5052514, -2.472725, 2.057203, 0.2313726, 0, 1, 1,
0.507214, -1.538649, -0.1651173, 0.2352941, 0, 1, 1,
0.5102703, 0.6320054, 0.2757367, 0.2431373, 0, 1, 1,
0.5115029, 2.416985, 0.7482847, 0.2470588, 0, 1, 1,
0.5140528, -0.1283289, 2.585899, 0.254902, 0, 1, 1,
0.516336, -0.469456, 1.823629, 0.2588235, 0, 1, 1,
0.5234692, -0.5782174, 1.871628, 0.2666667, 0, 1, 1,
0.5301165, 1.009682, 0.5296351, 0.2705882, 0, 1, 1,
0.5345426, 0.02244124, 1.033038, 0.2784314, 0, 1, 1,
0.534692, 0.9368482, -0.06634673, 0.282353, 0, 1, 1,
0.5382374, -0.5062751, 2.748463, 0.2901961, 0, 1, 1,
0.5423092, -0.04923227, 0.8366536, 0.2941177, 0, 1, 1,
0.5446982, -0.01219989, 0.6645848, 0.3019608, 0, 1, 1,
0.5558845, -0.5101752, 2.319251, 0.3098039, 0, 1, 1,
0.5582767, 0.2492445, -0.04635535, 0.3137255, 0, 1, 1,
0.5589725, -0.344767, 0.9343994, 0.3215686, 0, 1, 1,
0.5634922, -0.8107677, 2.462469, 0.3254902, 0, 1, 1,
0.5656454, -0.2051045, 0.569437, 0.3333333, 0, 1, 1,
0.5721954, 0.7795545, 0.2683707, 0.3372549, 0, 1, 1,
0.5925458, 0.2007513, 1.40438, 0.345098, 0, 1, 1,
0.6044205, 0.864702, 0.499275, 0.3490196, 0, 1, 1,
0.6097103, 0.6962096, 0.424788, 0.3568628, 0, 1, 1,
0.6146082, 1.444528, 0.9291011, 0.3607843, 0, 1, 1,
0.61874, -1.194367, 3.014951, 0.3686275, 0, 1, 1,
0.6191126, -1.22724, 0.677307, 0.372549, 0, 1, 1,
0.619426, 0.1928532, 0.8708811, 0.3803922, 0, 1, 1,
0.6227899, 0.1855761, 1.704531, 0.3843137, 0, 1, 1,
0.6277707, 0.294101, 2.092131, 0.3921569, 0, 1, 1,
0.6297159, 1.42571, -0.05349837, 0.3960784, 0, 1, 1,
0.6299828, 0.7156992, -0.5878175, 0.4039216, 0, 1, 1,
0.640357, -2.215095, 4.446194, 0.4117647, 0, 1, 1,
0.6405194, -0.2508067, 2.671607, 0.4156863, 0, 1, 1,
0.6405409, -1.566525, 3.108611, 0.4235294, 0, 1, 1,
0.6406881, 0.2452069, 0.9150795, 0.427451, 0, 1, 1,
0.6458858, 1.673254, 1.561774, 0.4352941, 0, 1, 1,
0.6461579, -0.01184387, 1.807207, 0.4392157, 0, 1, 1,
0.6463484, 0.161411, -0.1551228, 0.4470588, 0, 1, 1,
0.6465933, 0.9318783, 2.319799, 0.4509804, 0, 1, 1,
0.6475654, 0.8213012, 0.5798337, 0.4588235, 0, 1, 1,
0.6513411, 0.6514531, 1.335976, 0.4627451, 0, 1, 1,
0.6514022, -0.0780858, 4.742858, 0.4705882, 0, 1, 1,
0.6576238, 0.2359838, 1.653356, 0.4745098, 0, 1, 1,
0.6601005, -1.400804, 1.707836, 0.4823529, 0, 1, 1,
0.6642278, 0.8453099, 1.284483, 0.4862745, 0, 1, 1,
0.6651404, -1.546326, 4.035255, 0.4941176, 0, 1, 1,
0.665507, 0.2904497, 0.1781861, 0.5019608, 0, 1, 1,
0.6679562, -0.668574, 1.561948, 0.5058824, 0, 1, 1,
0.6742067, 0.9924442, 1.502236, 0.5137255, 0, 1, 1,
0.6900812, 0.6834182, 0.3081348, 0.5176471, 0, 1, 1,
0.6993676, 1.657734, 1.259603, 0.5254902, 0, 1, 1,
0.7043529, 0.2715115, 0.5056707, 0.5294118, 0, 1, 1,
0.7051628, -1.067583, 3.930862, 0.5372549, 0, 1, 1,
0.70675, 1.36334, -0.192983, 0.5411765, 0, 1, 1,
0.7164398, 1.209995, 0.1779398, 0.5490196, 0, 1, 1,
0.7312576, -0.8632321, 2.773036, 0.5529412, 0, 1, 1,
0.7321729, -1.47253, 1.78395, 0.5607843, 0, 1, 1,
0.7326785, -1.870631, 2.775127, 0.5647059, 0, 1, 1,
0.7332858, -0.5052263, 2.656591, 0.572549, 0, 1, 1,
0.7345142, 0.8574054, -0.7430047, 0.5764706, 0, 1, 1,
0.7372875, 1.063493, 0.8768085, 0.5843138, 0, 1, 1,
0.7419021, 0.3780902, 1.816784, 0.5882353, 0, 1, 1,
0.7469954, 1.482525, 2.717364, 0.5960785, 0, 1, 1,
0.750207, 0.1140542, 0.6760474, 0.6039216, 0, 1, 1,
0.7503413, -0.4261964, 2.11466, 0.6078432, 0, 1, 1,
0.7571131, 0.6810917, 0.9096861, 0.6156863, 0, 1, 1,
0.7592781, 0.6853467, 0.2469126, 0.6196079, 0, 1, 1,
0.7741556, 1.116717, 0.9839024, 0.627451, 0, 1, 1,
0.7742223, -1.737539, 4.886067, 0.6313726, 0, 1, 1,
0.7743306, 1.383229, -0.612416, 0.6392157, 0, 1, 1,
0.7812854, -1.217802, 2.73446, 0.6431373, 0, 1, 1,
0.7849318, 0.235453, 0.4513094, 0.6509804, 0, 1, 1,
0.7867843, -0.7938421, 1.535068, 0.654902, 0, 1, 1,
0.7870346, -0.5357935, 2.464207, 0.6627451, 0, 1, 1,
0.7955685, 1.012628, -2.619616, 0.6666667, 0, 1, 1,
0.7959455, 1.153865, 0.1471497, 0.6745098, 0, 1, 1,
0.8021276, 0.1429729, 3.071092, 0.6784314, 0, 1, 1,
0.8037853, 1.560802, 0.8376588, 0.6862745, 0, 1, 1,
0.8060068, 0.5439205, 1.351527, 0.6901961, 0, 1, 1,
0.8151249, -1.444419, 3.321486, 0.6980392, 0, 1, 1,
0.8200045, 0.7102801, 1.5953, 0.7058824, 0, 1, 1,
0.8227553, -1.164855, 2.024745, 0.7098039, 0, 1, 1,
0.8290419, -1.238164, 3.537447, 0.7176471, 0, 1, 1,
0.8295138, -0.766096, 2.859594, 0.7215686, 0, 1, 1,
0.8315781, 0.6813388, 1.341775, 0.7294118, 0, 1, 1,
0.8338366, 1.435785, 0.1743774, 0.7333333, 0, 1, 1,
0.8357624, -1.375423, 3.204367, 0.7411765, 0, 1, 1,
0.8423608, -0.09972209, 1.604541, 0.7450981, 0, 1, 1,
0.8467761, -0.1481221, 0.3781631, 0.7529412, 0, 1, 1,
0.8470551, 0.2081134, 1.361527, 0.7568628, 0, 1, 1,
0.8522612, 0.07504779, 2.390004, 0.7647059, 0, 1, 1,
0.8614404, 0.3810517, 0.5665855, 0.7686275, 0, 1, 1,
0.8642945, -0.7502941, 1.8252, 0.7764706, 0, 1, 1,
0.866794, 0.4687355, 0.07019, 0.7803922, 0, 1, 1,
0.8686952, 1.238867, 0.9982945, 0.7882353, 0, 1, 1,
0.8693455, -1.113006, 2.058717, 0.7921569, 0, 1, 1,
0.8717984, 2.028124, -1.505329, 0.8, 0, 1, 1,
0.8739478, 0.03736152, 1.116287, 0.8078431, 0, 1, 1,
0.8794324, -1.120289, 1.237809, 0.8117647, 0, 1, 1,
0.8819795, 0.35256, 0.7916188, 0.8196079, 0, 1, 1,
0.8868145, -0.2064404, 1.949091, 0.8235294, 0, 1, 1,
0.8905288, -0.6528534, 3.038969, 0.8313726, 0, 1, 1,
0.8933215, 0.1869983, 0.8152393, 0.8352941, 0, 1, 1,
0.8956067, -0.4760279, 2.753563, 0.8431373, 0, 1, 1,
0.8975749, -0.06179026, 2.846189, 0.8470588, 0, 1, 1,
0.8992698, -0.2426654, 2.669235, 0.854902, 0, 1, 1,
0.9016061, -0.8717219, 1.933226, 0.8588235, 0, 1, 1,
0.9030254, -1.492007, 3.297895, 0.8666667, 0, 1, 1,
0.9060541, 2.244365, 0.8675977, 0.8705882, 0, 1, 1,
0.9079148, 1.206619, 1.463042, 0.8784314, 0, 1, 1,
0.9159162, -0.5253161, 2.482228, 0.8823529, 0, 1, 1,
0.918444, -0.4060727, 2.697143, 0.8901961, 0, 1, 1,
0.9216848, 0.2670322, 1.877803, 0.8941177, 0, 1, 1,
0.9308878, -0.6813022, 2.590513, 0.9019608, 0, 1, 1,
0.9357572, -1.178838, 2.79266, 0.9098039, 0, 1, 1,
0.9369432, -0.477253, 2.76635, 0.9137255, 0, 1, 1,
0.9420413, -0.5094706, 1.804055, 0.9215686, 0, 1, 1,
0.9421656, -0.1499765, 2.339129, 0.9254902, 0, 1, 1,
0.9464062, 1.245724, 1.244836, 0.9333333, 0, 1, 1,
0.9514101, -0.11865, 1.409174, 0.9372549, 0, 1, 1,
0.9562673, 2.088764, -0.5450824, 0.945098, 0, 1, 1,
0.9659256, -1.00008, 2.346676, 0.9490196, 0, 1, 1,
0.9789779, -0.1311666, 1.388103, 0.9568627, 0, 1, 1,
0.9807416, -1.765144, 3.485221, 0.9607843, 0, 1, 1,
0.9824768, -1.953207, 2.606445, 0.9686275, 0, 1, 1,
0.9854359, 0.2694949, 1.800426, 0.972549, 0, 1, 1,
0.9871404, -0.2995941, -0.3565305, 0.9803922, 0, 1, 1,
0.9891593, -1.151483, 3.690103, 0.9843137, 0, 1, 1,
0.9905654, -1.234657, 2.847793, 0.9921569, 0, 1, 1,
0.9929054, 1.024392, -0.1990084, 0.9960784, 0, 1, 1,
0.9931622, 0.1592115, 0.7138783, 1, 0, 0.9960784, 1,
0.9961269, 1.464957, -0.1438654, 1, 0, 0.9882353, 1,
1.000874, 1.36332, -0.3621362, 1, 0, 0.9843137, 1,
1.01131, 0.2553426, 0.7254658, 1, 0, 0.9764706, 1,
1.013744, -0.9361896, 3.330549, 1, 0, 0.972549, 1,
1.014943, 0.0377652, 1.806164, 1, 0, 0.9647059, 1,
1.020698, 0.7795784, 0.8276561, 1, 0, 0.9607843, 1,
1.025665, 1.35632, 0.1191616, 1, 0, 0.9529412, 1,
1.030425, -0.8917212, 1.831245, 1, 0, 0.9490196, 1,
1.031549, -0.04414107, 1.256618, 1, 0, 0.9411765, 1,
1.034308, -0.3307744, 2.7889, 1, 0, 0.9372549, 1,
1.038522, -0.2764114, 2.162688, 1, 0, 0.9294118, 1,
1.041519, -0.4673098, 2.368719, 1, 0, 0.9254902, 1,
1.042863, 0.9150535, -0.2791473, 1, 0, 0.9176471, 1,
1.044884, -0.2303102, 0.7221324, 1, 0, 0.9137255, 1,
1.049649, 0.728169, 0.1414298, 1, 0, 0.9058824, 1,
1.05076, 0.1626954, 2.343092, 1, 0, 0.9019608, 1,
1.05168, 0.09853411, 1.607173, 1, 0, 0.8941177, 1,
1.053455, 0.7705135, 2.15905, 1, 0, 0.8862745, 1,
1.053506, 0.0005773909, 1.670043, 1, 0, 0.8823529, 1,
1.062352, -0.8067081, 0.8725049, 1, 0, 0.8745098, 1,
1.063367, 0.8613414, 1.26458, 1, 0, 0.8705882, 1,
1.071674, -1.198215, 3.244417, 1, 0, 0.8627451, 1,
1.074662, 1.024251, 0.6567193, 1, 0, 0.8588235, 1,
1.080826, 0.1110857, 2.932706, 1, 0, 0.8509804, 1,
1.084044, -1.321752, 2.822083, 1, 0, 0.8470588, 1,
1.086163, 2.207401, 1.9434, 1, 0, 0.8392157, 1,
1.088744, -0.4523049, 2.579637, 1, 0, 0.8352941, 1,
1.097019, -0.06560905, 1.709381, 1, 0, 0.827451, 1,
1.101261, 0.32282, 1.758306, 1, 0, 0.8235294, 1,
1.105728, 1.29094, 0.2425053, 1, 0, 0.8156863, 1,
1.116393, -0.06854533, -0.6087931, 1, 0, 0.8117647, 1,
1.119827, -1.128041, 2.140531, 1, 0, 0.8039216, 1,
1.124554, -1.065394, 2.878994, 1, 0, 0.7960784, 1,
1.127807, -2.024875, 3.224836, 1, 0, 0.7921569, 1,
1.128767, 0.6939211, 0.4394725, 1, 0, 0.7843137, 1,
1.129682, -0.09864641, 1.755598, 1, 0, 0.7803922, 1,
1.133808, -0.9661934, 1.030406, 1, 0, 0.772549, 1,
1.136826, 0.1286356, 0.8521251, 1, 0, 0.7686275, 1,
1.143062, -0.1149867, -0.2319504, 1, 0, 0.7607843, 1,
1.171061, 0.5817807, 1.003835, 1, 0, 0.7568628, 1,
1.181093, -0.3283755, 1.880024, 1, 0, 0.7490196, 1,
1.183147, 2.687017, 1.195951, 1, 0, 0.7450981, 1,
1.191871, -0.1514378, -0.7330178, 1, 0, 0.7372549, 1,
1.191987, -1.736597, 1.147021, 1, 0, 0.7333333, 1,
1.194703, -1.614632, 4.276502, 1, 0, 0.7254902, 1,
1.198336, -1.608499, 2.693641, 1, 0, 0.7215686, 1,
1.20639, 0.9791348, 2.481589, 1, 0, 0.7137255, 1,
1.215597, 0.4294769, 2.011658, 1, 0, 0.7098039, 1,
1.229684, -1.225495, 1.708356, 1, 0, 0.7019608, 1,
1.232656, 0.09663519, 0.6056296, 1, 0, 0.6941177, 1,
1.244375, -0.1689863, 4.139152, 1, 0, 0.6901961, 1,
1.245308, -0.5338944, 3.098829, 1, 0, 0.682353, 1,
1.253367, 0.3796197, -0.5446827, 1, 0, 0.6784314, 1,
1.257366, 0.8862262, 2.383301, 1, 0, 0.6705883, 1,
1.259174, -0.1147428, 2.001899, 1, 0, 0.6666667, 1,
1.260067, 0.3936096, 1.226377, 1, 0, 0.6588235, 1,
1.269615, -0.05837939, 3.188008, 1, 0, 0.654902, 1,
1.271504, 0.6852994, 0.001062357, 1, 0, 0.6470588, 1,
1.273608, -0.2147123, 2.268828, 1, 0, 0.6431373, 1,
1.277439, -0.1291564, 2.605862, 1, 0, 0.6352941, 1,
1.281883, 1.266646, 0.1385629, 1, 0, 0.6313726, 1,
1.285589, 1.299532, -0.6834142, 1, 0, 0.6235294, 1,
1.286824, -0.5126285, 1.876904, 1, 0, 0.6196079, 1,
1.287666, 0.3560832, -0.3862508, 1, 0, 0.6117647, 1,
1.288295, -0.5194003, 1.841027, 1, 0, 0.6078432, 1,
1.294195, -0.8454797, 1.961687, 1, 0, 0.6, 1,
1.303414, 0.2220041, 1.931672, 1, 0, 0.5921569, 1,
1.313848, -1.15199, 0.8166147, 1, 0, 0.5882353, 1,
1.318491, -0.7596977, 0.8487417, 1, 0, 0.5803922, 1,
1.319323, -1.130852, 2.922319, 1, 0, 0.5764706, 1,
1.329729, 0.08240001, 0.6498171, 1, 0, 0.5686275, 1,
1.341528, -0.7873233, 1.682486, 1, 0, 0.5647059, 1,
1.353299, 1.984578, 0.2724255, 1, 0, 0.5568628, 1,
1.356676, 0.6220375, -0.2300236, 1, 0, 0.5529412, 1,
1.358293, 0.4210986, 1.659908, 1, 0, 0.5450981, 1,
1.36596, 1.338814, -0.07409582, 1, 0, 0.5411765, 1,
1.366307, 1.500547, 0.6985155, 1, 0, 0.5333334, 1,
1.367679, 1.671912, 1.160213, 1, 0, 0.5294118, 1,
1.369042, -0.01249088, -1.121119, 1, 0, 0.5215687, 1,
1.369377, -0.6297349, 2.174945, 1, 0, 0.5176471, 1,
1.414457, -1.234661, 2.880877, 1, 0, 0.509804, 1,
1.418967, -0.465501, 2.814515, 1, 0, 0.5058824, 1,
1.426532, 0.2962933, 1.048853, 1, 0, 0.4980392, 1,
1.432217, -0.7906533, 2.113855, 1, 0, 0.4901961, 1,
1.440916, -0.3322861, 2.968112, 1, 0, 0.4862745, 1,
1.443517, -0.9931029, 2.83617, 1, 0, 0.4784314, 1,
1.447314, 1.487629, 2.49342, 1, 0, 0.4745098, 1,
1.447591, -0.6298743, 4.817047, 1, 0, 0.4666667, 1,
1.46662, -0.2370897, 1.576703, 1, 0, 0.4627451, 1,
1.479468, 1.507269, 1.573269, 1, 0, 0.454902, 1,
1.494747, -0.1121883, 2.60449, 1, 0, 0.4509804, 1,
1.496002, -0.2890102, 1.198896, 1, 0, 0.4431373, 1,
1.497092, 0.8827482, 0.9830357, 1, 0, 0.4392157, 1,
1.498814, -2.745926, 2.633701, 1, 0, 0.4313726, 1,
1.504541, 0.5034236, 2.882442, 1, 0, 0.427451, 1,
1.511744, -0.606536, 2.234987, 1, 0, 0.4196078, 1,
1.511933, -0.7319074, 2.741006, 1, 0, 0.4156863, 1,
1.515912, -0.4053436, 1.988013, 1, 0, 0.4078431, 1,
1.516368, 0.782477, 0.6018988, 1, 0, 0.4039216, 1,
1.518637, 0.7289574, 0.5865061, 1, 0, 0.3960784, 1,
1.525181, -0.1242758, 1.189225, 1, 0, 0.3882353, 1,
1.53435, -0.9839925, 1.933916, 1, 0, 0.3843137, 1,
1.537442, 0.463407, 0.4165559, 1, 0, 0.3764706, 1,
1.539958, -1.09343, 2.426083, 1, 0, 0.372549, 1,
1.544942, -1.397819, 1.496756, 1, 0, 0.3647059, 1,
1.550652, -1.314968, 1.29974, 1, 0, 0.3607843, 1,
1.573603, 0.169619, -0.06894759, 1, 0, 0.3529412, 1,
1.607667, 0.466051, 0.1549671, 1, 0, 0.3490196, 1,
1.613439, 0.3593133, 1.705936, 1, 0, 0.3411765, 1,
1.618677, -0.2485221, 4.072195, 1, 0, 0.3372549, 1,
1.623097, 2.541039, 1.752116, 1, 0, 0.3294118, 1,
1.633909, -0.9220224, 3.281103, 1, 0, 0.3254902, 1,
1.634895, 0.1448228, 0.9389923, 1, 0, 0.3176471, 1,
1.63601, -0.8923398, 1.667341, 1, 0, 0.3137255, 1,
1.642943, 0.5289108, -0.07211412, 1, 0, 0.3058824, 1,
1.644508, -0.0597102, 0.4191815, 1, 0, 0.2980392, 1,
1.647398, 1.475078, 0.9413126, 1, 0, 0.2941177, 1,
1.652236, -0.6659639, 2.048022, 1, 0, 0.2862745, 1,
1.673907, -1.89498, 2.767716, 1, 0, 0.282353, 1,
1.681558, -0.9467829, 1.963954, 1, 0, 0.2745098, 1,
1.744116, -1.469055, 3.316727, 1, 0, 0.2705882, 1,
1.745968, 0.7281535, 1.762717, 1, 0, 0.2627451, 1,
1.749512, -0.01761708, 1.55829, 1, 0, 0.2588235, 1,
1.754239, 0.1461388, 0.7962441, 1, 0, 0.2509804, 1,
1.761486, -0.1845565, 2.321718, 1, 0, 0.2470588, 1,
1.763606, 0.01085398, 3.501252, 1, 0, 0.2392157, 1,
1.777582, 0.09478031, 0.448137, 1, 0, 0.2352941, 1,
1.815499, -0.3651204, 1.214549, 1, 0, 0.227451, 1,
1.833156, 0.3383115, 2.392411, 1, 0, 0.2235294, 1,
1.840278, -1.645454, 1.711882, 1, 0, 0.2156863, 1,
1.8406, -0.6899169, 2.829897, 1, 0, 0.2117647, 1,
1.864665, -0.5265712, 0.7021029, 1, 0, 0.2039216, 1,
1.876647, -0.3884541, 3.410352, 1, 0, 0.1960784, 1,
1.878237, 1.254354, -0.1695208, 1, 0, 0.1921569, 1,
1.890835, -1.192675, 2.167957, 1, 0, 0.1843137, 1,
1.906677, -0.2872813, 2.492448, 1, 0, 0.1803922, 1,
1.910044, -0.3314576, 2.991972, 1, 0, 0.172549, 1,
1.916357, -1.010438, 1.601764, 1, 0, 0.1686275, 1,
1.933076, 1.287401, -0.1647165, 1, 0, 0.1607843, 1,
1.938538, 0.384773, 2.528393, 1, 0, 0.1568628, 1,
1.967684, -0.1213054, 1.244054, 1, 0, 0.1490196, 1,
1.971916, 0.09260645, 1.510606, 1, 0, 0.145098, 1,
2.00939, 0.5240526, 0.551366, 1, 0, 0.1372549, 1,
2.035053, -0.5379248, 1.969633, 1, 0, 0.1333333, 1,
2.052788, 1.483407, 1.229259, 1, 0, 0.1254902, 1,
2.073195, 0.318502, 1.361919, 1, 0, 0.1215686, 1,
2.083907, -0.0163837, 1.784057, 1, 0, 0.1137255, 1,
2.087353, -1.041946, 0.9784779, 1, 0, 0.1098039, 1,
2.101444, 0.2835196, 2.109847, 1, 0, 0.1019608, 1,
2.113967, 0.1956755, 1.731231, 1, 0, 0.09411765, 1,
2.129619, 0.4330739, 1.242074, 1, 0, 0.09019608, 1,
2.156778, -1.015244, 1.611392, 1, 0, 0.08235294, 1,
2.16418, 1.832754, 1.47711, 1, 0, 0.07843138, 1,
2.173699, 1.336347, 2.254179, 1, 0, 0.07058824, 1,
2.178692, 1.914107, 0.8796811, 1, 0, 0.06666667, 1,
2.179876, -2.193844, 4.055764, 1, 0, 0.05882353, 1,
2.198089, -0.1160581, 3.631022, 1, 0, 0.05490196, 1,
2.198116, -0.09795506, 1.359461, 1, 0, 0.04705882, 1,
2.198802, -0.03271681, 1.467693, 1, 0, 0.04313726, 1,
2.444121, 0.6116076, -0.2671727, 1, 0, 0.03529412, 1,
2.476474, 1.594888, 0.05109323, 1, 0, 0.03137255, 1,
2.566903, -0.5662854, 2.143827, 1, 0, 0.02352941, 1,
2.688879, 0.1718235, 1.92831, 1, 0, 0.01960784, 1,
3.128185, 2.065044, -0.9630309, 1, 0, 0.01176471, 1,
3.334557, -1.466829, 2.76057, 1, 0, 0.007843138, 1
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
0.02566803, -5.10255, -7.304667, 0, -0.5, 0.5, 0.5,
0.02566803, -5.10255, -7.304667, 1, -0.5, 0.5, 0.5,
0.02566803, -5.10255, -7.304667, 1, 1.5, 0.5, 0.5,
0.02566803, -5.10255, -7.304667, 0, 1.5, 0.5, 0.5
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
-4.404934, -0.1186, -7.304667, 0, -0.5, 0.5, 0.5,
-4.404934, -0.1186, -7.304667, 1, -0.5, 0.5, 0.5,
-4.404934, -0.1186, -7.304667, 1, 1.5, 0.5, 0.5,
-4.404934, -0.1186, -7.304667, 0, 1.5, 0.5, 0.5
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
-4.404934, -5.10255, -0.1405039, 0, -0.5, 0.5, 0.5,
-4.404934, -5.10255, -0.1405039, 1, -0.5, 0.5, 0.5,
-4.404934, -5.10255, -0.1405039, 1, 1.5, 0.5, 0.5,
-4.404934, -5.10255, -0.1405039, 0, 1.5, 0.5, 0.5
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
-3, -3.952408, -5.651399,
3, -3.952408, -5.651399,
-3, -3.952408, -5.651399,
-3, -4.144098, -5.926943,
-2, -3.952408, -5.651399,
-2, -4.144098, -5.926943,
-1, -3.952408, -5.651399,
-1, -4.144098, -5.926943,
0, -3.952408, -5.651399,
0, -4.144098, -5.926943,
1, -3.952408, -5.651399,
1, -4.144098, -5.926943,
2, -3.952408, -5.651399,
2, -4.144098, -5.926943,
3, -3.952408, -5.651399,
3, -4.144098, -5.926943
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
-3, -4.527479, -6.478033, 0, -0.5, 0.5, 0.5,
-3, -4.527479, -6.478033, 1, -0.5, 0.5, 0.5,
-3, -4.527479, -6.478033, 1, 1.5, 0.5, 0.5,
-3, -4.527479, -6.478033, 0, 1.5, 0.5, 0.5,
-2, -4.527479, -6.478033, 0, -0.5, 0.5, 0.5,
-2, -4.527479, -6.478033, 1, -0.5, 0.5, 0.5,
-2, -4.527479, -6.478033, 1, 1.5, 0.5, 0.5,
-2, -4.527479, -6.478033, 0, 1.5, 0.5, 0.5,
-1, -4.527479, -6.478033, 0, -0.5, 0.5, 0.5,
-1, -4.527479, -6.478033, 1, -0.5, 0.5, 0.5,
-1, -4.527479, -6.478033, 1, 1.5, 0.5, 0.5,
-1, -4.527479, -6.478033, 0, 1.5, 0.5, 0.5,
0, -4.527479, -6.478033, 0, -0.5, 0.5, 0.5,
0, -4.527479, -6.478033, 1, -0.5, 0.5, 0.5,
0, -4.527479, -6.478033, 1, 1.5, 0.5, 0.5,
0, -4.527479, -6.478033, 0, 1.5, 0.5, 0.5,
1, -4.527479, -6.478033, 0, -0.5, 0.5, 0.5,
1, -4.527479, -6.478033, 1, -0.5, 0.5, 0.5,
1, -4.527479, -6.478033, 1, 1.5, 0.5, 0.5,
1, -4.527479, -6.478033, 0, 1.5, 0.5, 0.5,
2, -4.527479, -6.478033, 0, -0.5, 0.5, 0.5,
2, -4.527479, -6.478033, 1, -0.5, 0.5, 0.5,
2, -4.527479, -6.478033, 1, 1.5, 0.5, 0.5,
2, -4.527479, -6.478033, 0, 1.5, 0.5, 0.5,
3, -4.527479, -6.478033, 0, -0.5, 0.5, 0.5,
3, -4.527479, -6.478033, 1, -0.5, 0.5, 0.5,
3, -4.527479, -6.478033, 1, 1.5, 0.5, 0.5,
3, -4.527479, -6.478033, 0, 1.5, 0.5, 0.5
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
-3.382487, -2, -5.651399,
-3.382487, 2, -5.651399,
-3.382487, -2, -5.651399,
-3.552895, -2, -5.926943,
-3.382487, 0, -5.651399,
-3.552895, 0, -5.926943,
-3.382487, 2, -5.651399,
-3.552895, 2, -5.926943
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
"0",
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
-3.89371, -2, -6.478033, 0, -0.5, 0.5, 0.5,
-3.89371, -2, -6.478033, 1, -0.5, 0.5, 0.5,
-3.89371, -2, -6.478033, 1, 1.5, 0.5, 0.5,
-3.89371, -2, -6.478033, 0, 1.5, 0.5, 0.5,
-3.89371, 0, -6.478033, 0, -0.5, 0.5, 0.5,
-3.89371, 0, -6.478033, 1, -0.5, 0.5, 0.5,
-3.89371, 0, -6.478033, 1, 1.5, 0.5, 0.5,
-3.89371, 0, -6.478033, 0, 1.5, 0.5, 0.5,
-3.89371, 2, -6.478033, 0, -0.5, 0.5, 0.5,
-3.89371, 2, -6.478033, 1, -0.5, 0.5, 0.5,
-3.89371, 2, -6.478033, 1, 1.5, 0.5, 0.5,
-3.89371, 2, -6.478033, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.382487, -3.952408, -4,
-3.382487, -3.952408, 4,
-3.382487, -3.952408, -4,
-3.552895, -4.144098, -4,
-3.382487, -3.952408, -2,
-3.552895, -4.144098, -2,
-3.382487, -3.952408, 0,
-3.552895, -4.144098, 0,
-3.382487, -3.952408, 2,
-3.552895, -4.144098, 2,
-3.382487, -3.952408, 4,
-3.552895, -4.144098, 4
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
-3.89371, -4.527479, -4, 0, -0.5, 0.5, 0.5,
-3.89371, -4.527479, -4, 1, -0.5, 0.5, 0.5,
-3.89371, -4.527479, -4, 1, 1.5, 0.5, 0.5,
-3.89371, -4.527479, -4, 0, 1.5, 0.5, 0.5,
-3.89371, -4.527479, -2, 0, -0.5, 0.5, 0.5,
-3.89371, -4.527479, -2, 1, -0.5, 0.5, 0.5,
-3.89371, -4.527479, -2, 1, 1.5, 0.5, 0.5,
-3.89371, -4.527479, -2, 0, 1.5, 0.5, 0.5,
-3.89371, -4.527479, 0, 0, -0.5, 0.5, 0.5,
-3.89371, -4.527479, 0, 1, -0.5, 0.5, 0.5,
-3.89371, -4.527479, 0, 1, 1.5, 0.5, 0.5,
-3.89371, -4.527479, 0, 0, 1.5, 0.5, 0.5,
-3.89371, -4.527479, 2, 0, -0.5, 0.5, 0.5,
-3.89371, -4.527479, 2, 1, -0.5, 0.5, 0.5,
-3.89371, -4.527479, 2, 1, 1.5, 0.5, 0.5,
-3.89371, -4.527479, 2, 0, 1.5, 0.5, 0.5,
-3.89371, -4.527479, 4, 0, -0.5, 0.5, 0.5,
-3.89371, -4.527479, 4, 1, -0.5, 0.5, 0.5,
-3.89371, -4.527479, 4, 1, 1.5, 0.5, 0.5,
-3.89371, -4.527479, 4, 0, 1.5, 0.5, 0.5
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
-3.382487, -3.952408, -5.651399,
-3.382487, 3.715208, -5.651399,
-3.382487, -3.952408, 5.370391,
-3.382487, 3.715208, 5.370391,
-3.382487, -3.952408, -5.651399,
-3.382487, -3.952408, 5.370391,
-3.382487, 3.715208, -5.651399,
-3.382487, 3.715208, 5.370391,
-3.382487, -3.952408, -5.651399,
3.433823, -3.952408, -5.651399,
-3.382487, -3.952408, 5.370391,
3.433823, -3.952408, 5.370391,
-3.382487, 3.715208, -5.651399,
3.433823, 3.715208, -5.651399,
-3.382487, 3.715208, 5.370391,
3.433823, 3.715208, 5.370391,
3.433823, -3.952408, -5.651399,
3.433823, 3.715208, -5.651399,
3.433823, -3.952408, 5.370391,
3.433823, 3.715208, 5.370391,
3.433823, -3.952408, -5.651399,
3.433823, -3.952408, 5.370391,
3.433823, 3.715208, -5.651399,
3.433823, 3.715208, 5.370391
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
var radius = 8.040518;
var distance = 35.77317;
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
mvMatrix.translate( -0.02566803, 0.1186, 0.1405039 );
mvMatrix.scale( 1.275406, 1.133803, 0.7887617 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.77317);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
ethoxycarbonylmethyl<-read.table("ethoxycarbonylmethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethoxycarbonylmethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethoxycarbonylmethyl' not found
```

```r
y<-ethoxycarbonylmethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethoxycarbonylmethyl' not found
```

```r
z<-ethoxycarbonylmethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethoxycarbonylmethyl' not found
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
-3.283221, -0.9614818, -1.063232, 0, 0, 1, 1, 1,
-3.267888, -0.1782957, 0.5177116, 1, 0, 0, 1, 1,
-3.131704, -0.5438645, -0.8638168, 1, 0, 0, 1, 1,
-2.887417, -0.06195623, -1.808507, 1, 0, 0, 1, 1,
-2.776476, -1.056776, 0.08530205, 1, 0, 0, 1, 1,
-2.697296, -0.7555206, -0.9509761, 1, 0, 0, 1, 1,
-2.661589, 1.56199, 0.7447115, 0, 0, 0, 1, 1,
-2.535614, 0.1432769, -1.481989, 0, 0, 0, 1, 1,
-2.507359, -1.426212, -1.027115, 0, 0, 0, 1, 1,
-2.420808, -1.333225, 0.9228783, 0, 0, 0, 1, 1,
-2.407996, -2.399376, -2.957232, 0, 0, 0, 1, 1,
-2.372592, 0.3344406, 0.6053832, 0, 0, 0, 1, 1,
-2.369928, 0.6333396, -3.000284, 0, 0, 0, 1, 1,
-2.365547, -0.7967153, -2.489545, 1, 1, 1, 1, 1,
-2.308414, -1.13981, -2.42319, 1, 1, 1, 1, 1,
-2.259012, 0.4555917, -0.3131253, 1, 1, 1, 1, 1,
-2.227315, 0.06667194, -0.5170085, 1, 1, 1, 1, 1,
-2.202481, 0.7824059, -2.216374, 1, 1, 1, 1, 1,
-2.182084, 0.2138198, -1.948182, 1, 1, 1, 1, 1,
-2.117755, -0.595331, -1.762661, 1, 1, 1, 1, 1,
-2.071558, -0.0996258, -2.163333, 1, 1, 1, 1, 1,
-2.061731, -0.03982313, -2.262685, 1, 1, 1, 1, 1,
-2.052767, -0.4451399, -1.956309, 1, 1, 1, 1, 1,
-2.037031, -0.5682368, -1.423043, 1, 1, 1, 1, 1,
-2.008273, 2.408667, -1.42412, 1, 1, 1, 1, 1,
-1.997977, -0.9341605, -0.869785, 1, 1, 1, 1, 1,
-1.988788, 0.2640169, -2.887254, 1, 1, 1, 1, 1,
-1.987875, 0.4832261, -2.389329, 1, 1, 1, 1, 1,
-1.983319, -0.08220301, -2.259341, 0, 0, 1, 1, 1,
-1.98027, -0.4892375, -1.560467, 1, 0, 0, 1, 1,
-1.955658, 0.3166798, 0.4596989, 1, 0, 0, 1, 1,
-1.931654, -1.093001, -2.139418, 1, 0, 0, 1, 1,
-1.927214, -0.8589769, -2.596438, 1, 0, 0, 1, 1,
-1.914612, 0.256588, -2.188009, 1, 0, 0, 1, 1,
-1.895315, 0.03838918, -2.036133, 0, 0, 0, 1, 1,
-1.883233, 0.6974864, -1.968585, 0, 0, 0, 1, 1,
-1.878545, -1.93845, -2.586825, 0, 0, 0, 1, 1,
-1.870961, -0.4784199, -2.376473, 0, 0, 0, 1, 1,
-1.846864, -0.9277151, -3.025952, 0, 0, 0, 1, 1,
-1.844833, 0.6880917, -3.983543, 0, 0, 0, 1, 1,
-1.829566, 0.6891993, -1.247059, 0, 0, 0, 1, 1,
-1.82058, -0.4892885, -1.262683, 1, 1, 1, 1, 1,
-1.808094, 0.4504974, -0.843246, 1, 1, 1, 1, 1,
-1.805229, 1.125855, -2.129168, 1, 1, 1, 1, 1,
-1.792328, 0.5733717, -1.687479, 1, 1, 1, 1, 1,
-1.77632, -1.120217, -2.378569, 1, 1, 1, 1, 1,
-1.728695, -1.170324, -1.933596, 1, 1, 1, 1, 1,
-1.72585, 0.5602844, -3.037168, 1, 1, 1, 1, 1,
-1.719127, -0.1546143, -1.422058, 1, 1, 1, 1, 1,
-1.716143, 0.6764147, -1.287216, 1, 1, 1, 1, 1,
-1.707641, 0.2920534, -1.188226, 1, 1, 1, 1, 1,
-1.694097, 1.681146, -0.1271182, 1, 1, 1, 1, 1,
-1.685723, 0.7971886, -0.9554009, 1, 1, 1, 1, 1,
-1.682576, -0.5377928, -2.004372, 1, 1, 1, 1, 1,
-1.653522, -0.4405598, -1.071126, 1, 1, 1, 1, 1,
-1.635627, -1.297863, -2.508852, 1, 1, 1, 1, 1,
-1.613207, 0.644576, -1.450135, 0, 0, 1, 1, 1,
-1.609248, 2.167896, -1.838509, 1, 0, 0, 1, 1,
-1.608458, 1.211138, 0.828133, 1, 0, 0, 1, 1,
-1.572427, -1.179869, -2.039923, 1, 0, 0, 1, 1,
-1.566601, -0.4002366, -2.394812, 1, 0, 0, 1, 1,
-1.56331, -1.344556, -1.546887, 1, 0, 0, 1, 1,
-1.554883, -0.9388967, 0.4107396, 0, 0, 0, 1, 1,
-1.546985, -0.5463594, -3.164602, 0, 0, 0, 1, 1,
-1.534958, 0.9446914, 0.2736267, 0, 0, 0, 1, 1,
-1.509289, -0.78164, -2.984506, 0, 0, 0, 1, 1,
-1.48991, -0.2542624, -0.05519773, 0, 0, 0, 1, 1,
-1.484995, 0.09802313, -1.190395, 0, 0, 0, 1, 1,
-1.483774, 0.6687016, -1.678469, 0, 0, 0, 1, 1,
-1.474435, 1.301592, 0.1593322, 1, 1, 1, 1, 1,
-1.472844, -2.038657, -1.268472, 1, 1, 1, 1, 1,
-1.472771, -0.03751461, -3.063245, 1, 1, 1, 1, 1,
-1.47185, 0.5631661, -3.328503, 1, 1, 1, 1, 1,
-1.462294, 1.420811, 0.01356754, 1, 1, 1, 1, 1,
-1.456824, 0.3286858, -1.20761, 1, 1, 1, 1, 1,
-1.425499, -1.476035, -2.334008, 1, 1, 1, 1, 1,
-1.417346, -1.174784, -2.31142, 1, 1, 1, 1, 1,
-1.404941, 0.4581088, -2.273053, 1, 1, 1, 1, 1,
-1.391842, -0.5361168, -2.843084, 1, 1, 1, 1, 1,
-1.388963, -0.8234674, -0.7581363, 1, 1, 1, 1, 1,
-1.387581, 1.243954, -0.3283041, 1, 1, 1, 1, 1,
-1.377092, -0.45803, -2.729845, 1, 1, 1, 1, 1,
-1.373733, 0.6602197, -1.404871, 1, 1, 1, 1, 1,
-1.366687, -1.123988, -2.074712, 1, 1, 1, 1, 1,
-1.365894, -0.4060732, -2.07268, 0, 0, 1, 1, 1,
-1.361674, 0.3214383, -2.845105, 1, 0, 0, 1, 1,
-1.356918, -0.6798817, -2.864134, 1, 0, 0, 1, 1,
-1.339007, 0.2926328, -3.173193, 1, 0, 0, 1, 1,
-1.330138, -0.2555622, -2.662176, 1, 0, 0, 1, 1,
-1.320721, -0.1778306, -2.476286, 1, 0, 0, 1, 1,
-1.3128, -0.2253508, -2.548442, 0, 0, 0, 1, 1,
-1.310784, -0.9632271, -1.517148, 0, 0, 0, 1, 1,
-1.308757, 1.239861, -0.6896204, 0, 0, 0, 1, 1,
-1.266223, 0.3992375, -2.170509, 0, 0, 0, 1, 1,
-1.244139, -1.495915, -3.576166, 0, 0, 0, 1, 1,
-1.239411, -2.401443, -2.641368, 0, 0, 0, 1, 1,
-1.233589, -0.2559164, -1.125317, 0, 0, 0, 1, 1,
-1.232864, -0.364778, -0.7088301, 1, 1, 1, 1, 1,
-1.218953, 0.1206502, -1.032486, 1, 1, 1, 1, 1,
-1.210872, 0.7773486, -0.03487462, 1, 1, 1, 1, 1,
-1.201541, -0.8730222, -2.165268, 1, 1, 1, 1, 1,
-1.197021, 0.02501773, -1.379585, 1, 1, 1, 1, 1,
-1.189057, 0.3065022, -1.113572, 1, 1, 1, 1, 1,
-1.187341, -1.033835, -2.350566, 1, 1, 1, 1, 1,
-1.184573, 1.101689, -0.5231, 1, 1, 1, 1, 1,
-1.180045, 1.803082, -0.165519, 1, 1, 1, 1, 1,
-1.176548, -0.08076997, -2.243436, 1, 1, 1, 1, 1,
-1.176498, 1.094101, -0.4592959, 1, 1, 1, 1, 1,
-1.17275, -1.931556, -3.402677, 1, 1, 1, 1, 1,
-1.172421, -0.01745229, -2.540943, 1, 1, 1, 1, 1,
-1.171521, -3.840743, -4.065824, 1, 1, 1, 1, 1,
-1.170744, 0.374026, -0.2327909, 1, 1, 1, 1, 1,
-1.168177, 0.9661325, -0.1743791, 0, 0, 1, 1, 1,
-1.164696, -1.01046, -2.904808, 1, 0, 0, 1, 1,
-1.159904, 3.603543, -0.7744651, 1, 0, 0, 1, 1,
-1.150945, -1.376805, -2.091982, 1, 0, 0, 1, 1,
-1.149824, 1.050406, 0.2834818, 1, 0, 0, 1, 1,
-1.147788, -1.284776, -2.301773, 1, 0, 0, 1, 1,
-1.143451, -1.528919, -3.262558, 0, 0, 0, 1, 1,
-1.138315, 0.5278163, -1.474648, 0, 0, 0, 1, 1,
-1.138185, -1.94951, -2.627587, 0, 0, 0, 1, 1,
-1.129088, -0.0963879, -1.579296, 0, 0, 0, 1, 1,
-1.12808, 0.8974507, -0.9181461, 0, 0, 0, 1, 1,
-1.127064, -0.3691373, -2.088085, 0, 0, 0, 1, 1,
-1.122192, -0.4452757, -1.574182, 0, 0, 0, 1, 1,
-1.121372, -1.892037, -1.575485, 1, 1, 1, 1, 1,
-1.112519, -0.5160081, -0.6418059, 1, 1, 1, 1, 1,
-1.104333, -0.6450807, -0.4301695, 1, 1, 1, 1, 1,
-1.094538, 0.1961355, -1.339616, 1, 1, 1, 1, 1,
-1.088515, 0.06864593, -3.118402, 1, 1, 1, 1, 1,
-1.086957, -0.2532471, -2.45068, 1, 1, 1, 1, 1,
-1.083708, 0.6105261, -1.700949, 1, 1, 1, 1, 1,
-1.080267, -0.06388511, -3.541648, 1, 1, 1, 1, 1,
-1.079648, 0.03722985, -1.944695, 1, 1, 1, 1, 1,
-1.074872, 0.1415277, -1.901196, 1, 1, 1, 1, 1,
-1.062504, 1.485411, -0.06076866, 1, 1, 1, 1, 1,
-1.058811, -0.8449341, -2.572353, 1, 1, 1, 1, 1,
-1.055527, 0.2950306, -0.3958551, 1, 1, 1, 1, 1,
-1.054531, 1.089685, -0.9130814, 1, 1, 1, 1, 1,
-1.051748, -0.09105375, -1.95415, 1, 1, 1, 1, 1,
-1.049989, -0.3353949, -1.595105, 0, 0, 1, 1, 1,
-1.042188, -2.003308, -2.040888, 1, 0, 0, 1, 1,
-1.036523, -0.4038956, -1.743121, 1, 0, 0, 1, 1,
-1.035798, -0.9312652, -2.327383, 1, 0, 0, 1, 1,
-1.035007, 0.6537216, -0.7296631, 1, 0, 0, 1, 1,
-1.033591, -0.2165885, -2.581584, 1, 0, 0, 1, 1,
-1.032595, -1.061604, -1.945384, 0, 0, 0, 1, 1,
-1.025413, 0.03869461, -2.004318, 0, 0, 0, 1, 1,
-1.022121, 0.16671, 0.2428815, 0, 0, 0, 1, 1,
-1.017114, 0.5448969, -2.915409, 0, 0, 0, 1, 1,
-1.00852, -0.357924, -0.7011802, 0, 0, 0, 1, 1,
-0.9964572, 1.272375, -0.7006679, 0, 0, 0, 1, 1,
-0.9957284, -1.07985, -3.124698, 0, 0, 0, 1, 1,
-0.9934583, 0.8943526, 0.1037184, 1, 1, 1, 1, 1,
-0.9819305, 0.3133866, 0.04159309, 1, 1, 1, 1, 1,
-0.9812309, 0.5701618, -1.322091, 1, 1, 1, 1, 1,
-0.971489, -0.1144655, -2.203864, 1, 1, 1, 1, 1,
-0.9652519, 0.4487327, 0.3002583, 1, 1, 1, 1, 1,
-0.9623346, 1.390889, -0.5607554, 1, 1, 1, 1, 1,
-0.9618865, 0.861081, 1.28438, 1, 1, 1, 1, 1,
-0.9597552, 0.7776851, 0.2039409, 1, 1, 1, 1, 1,
-0.9546741, 0.6123253, -2.013756, 1, 1, 1, 1, 1,
-0.9539931, 0.313218, 1.106057, 1, 1, 1, 1, 1,
-0.9528792, -1.824793, -3.13242, 1, 1, 1, 1, 1,
-0.9484311, 0.7220741, -1.717675, 1, 1, 1, 1, 1,
-0.9480227, -0.1565853, -1.934512, 1, 1, 1, 1, 1,
-0.9443151, -1.288374, -4.234631, 1, 1, 1, 1, 1,
-0.9442244, 0.7087869, -0.4683548, 1, 1, 1, 1, 1,
-0.9380606, -2.601661, -4.109566, 0, 0, 1, 1, 1,
-0.9373369, 0.8112216, -0.1176286, 1, 0, 0, 1, 1,
-0.9345291, -1.088114, -1.6795, 1, 0, 0, 1, 1,
-0.9342326, 0.3320462, -0.3279743, 1, 0, 0, 1, 1,
-0.9329563, 0.4153008, -0.3053153, 1, 0, 0, 1, 1,
-0.9314919, -2.098749, -2.146868, 1, 0, 0, 1, 1,
-0.9297124, 0.3332848, 2.133761, 0, 0, 0, 1, 1,
-0.9251393, 0.8572719, -1.583392, 0, 0, 0, 1, 1,
-0.9237608, -0.6022048, -2.793129, 0, 0, 0, 1, 1,
-0.9235515, -0.5411766, -2.397542, 0, 0, 0, 1, 1,
-0.9208101, -0.4052076, -3.08752, 0, 0, 0, 1, 1,
-0.9185579, 1.056366, 0.6144285, 0, 0, 0, 1, 1,
-0.9171767, -0.2685788, -2.085207, 0, 0, 0, 1, 1,
-0.9140084, -0.5353526, -2.137571, 1, 1, 1, 1, 1,
-0.9139137, -1.175592, -3.16522, 1, 1, 1, 1, 1,
-0.9092844, 1.112772, -0.7524304, 1, 1, 1, 1, 1,
-0.9081695, -1.073363, -0.8404022, 1, 1, 1, 1, 1,
-0.9074615, -1.51314, -2.579522, 1, 1, 1, 1, 1,
-0.9018283, -0.4210331, -1.731397, 1, 1, 1, 1, 1,
-0.8999115, -0.6437311, -2.457411, 1, 1, 1, 1, 1,
-0.8997518, 0.4202389, 0.09447314, 1, 1, 1, 1, 1,
-0.8983107, -0.04317888, -2.883728, 1, 1, 1, 1, 1,
-0.8916817, -1.611657, -3.227179, 1, 1, 1, 1, 1,
-0.8779595, -0.5682291, -1.963683, 1, 1, 1, 1, 1,
-0.8767242, 0.3174, -2.633828, 1, 1, 1, 1, 1,
-0.8689637, 2.261163, 0.7084869, 1, 1, 1, 1, 1,
-0.8569778, -0.3720375, -1.448651, 1, 1, 1, 1, 1,
-0.8525795, -1.513581, -2.437716, 1, 1, 1, 1, 1,
-0.8477697, -1.177865, -2.442893, 0, 0, 1, 1, 1,
-0.8461869, -0.05729098, -1.308291, 1, 0, 0, 1, 1,
-0.8461087, 0.7326893, -1.338881, 1, 0, 0, 1, 1,
-0.8448617, -0.8910156, -3.390405, 1, 0, 0, 1, 1,
-0.8412228, -1.040709, -0.1055752, 1, 0, 0, 1, 1,
-0.8364044, -0.7366213, -2.014577, 1, 0, 0, 1, 1,
-0.831817, 1.865246, 0.1302918, 0, 0, 0, 1, 1,
-0.8240603, 1.097699, 0.2740547, 0, 0, 0, 1, 1,
-0.8236837, -0.05547128, -0.9903118, 0, 0, 0, 1, 1,
-0.8227755, -0.3480885, -2.233119, 0, 0, 0, 1, 1,
-0.811321, -1.842654, -2.552796, 0, 0, 0, 1, 1,
-0.8082302, 0.9590113, 0.456223, 0, 0, 0, 1, 1,
-0.8082044, 1.591438, -0.4180858, 0, 0, 0, 1, 1,
-0.8061011, -0.115899, -1.331654, 1, 1, 1, 1, 1,
-0.8059213, 0.01661066, -2.318214, 1, 1, 1, 1, 1,
-0.8046919, 0.9851578, -1.77273, 1, 1, 1, 1, 1,
-0.8012434, -0.2139466, -2.827919, 1, 1, 1, 1, 1,
-0.7995131, -2.514515, -2.374424, 1, 1, 1, 1, 1,
-0.7986463, -2.169388, -3.03931, 1, 1, 1, 1, 1,
-0.7982794, -0.425111, -1.693821, 1, 1, 1, 1, 1,
-0.7939473, 1.305491, 0.09845746, 1, 1, 1, 1, 1,
-0.7933364, -1.416386, -3.488863, 1, 1, 1, 1, 1,
-0.7924674, -0.4843163, -3.978002, 1, 1, 1, 1, 1,
-0.791483, 1.128879, 0.3175364, 1, 1, 1, 1, 1,
-0.7866901, -0.001101452, -1.970763, 1, 1, 1, 1, 1,
-0.7784079, 1.040454, -1.800564, 1, 1, 1, 1, 1,
-0.7667512, -0.9468668, -2.123868, 1, 1, 1, 1, 1,
-0.7646326, -1.184428, -2.40518, 1, 1, 1, 1, 1,
-0.7621915, -0.8738264, -3.836416, 0, 0, 1, 1, 1,
-0.7616263, -1.264354, -2.126627, 1, 0, 0, 1, 1,
-0.759672, -0.971266, -2.602646, 1, 0, 0, 1, 1,
-0.7537932, -3.137911, -4.666592, 1, 0, 0, 1, 1,
-0.7527879, -0.776725, -0.7264174, 1, 0, 0, 1, 1,
-0.7325322, 0.3077224, 0.8131556, 1, 0, 0, 1, 1,
-0.7301049, 1.626521, -0.8199565, 0, 0, 0, 1, 1,
-0.721709, 0.8326011, -2.026566, 0, 0, 0, 1, 1,
-0.7141441, 0.4584289, 0.5360878, 0, 0, 0, 1, 1,
-0.7132019, -0.650928, -1.208997, 0, 0, 0, 1, 1,
-0.7124413, -0.243719, -0.9165936, 0, 0, 0, 1, 1,
-0.7117077, 0.1638065, -0.3890514, 0, 0, 0, 1, 1,
-0.7110644, -1.627428, -4.526295, 0, 0, 0, 1, 1,
-0.7087721, -1.052627, -4.206888, 1, 1, 1, 1, 1,
-0.7061138, -1.368953, -3.044937, 1, 1, 1, 1, 1,
-0.7054818, -0.9114186, -1.246649, 1, 1, 1, 1, 1,
-0.7043333, -0.8013467, -3.337345, 1, 1, 1, 1, 1,
-0.7007841, 0.7274266, -1.817268, 1, 1, 1, 1, 1,
-0.7007832, 0.8200078, -1.18168, 1, 1, 1, 1, 1,
-0.6889072, 0.01539188, 0.4218924, 1, 1, 1, 1, 1,
-0.6882258, -0.5999469, -3.901067, 1, 1, 1, 1, 1,
-0.6875924, -0.5215153, -1.279359, 1, 1, 1, 1, 1,
-0.6837299, -0.790123, -0.3331119, 1, 1, 1, 1, 1,
-0.6827095, -0.08782099, -0.7535157, 1, 1, 1, 1, 1,
-0.6779308, -0.3930167, -2.909331, 1, 1, 1, 1, 1,
-0.676269, 1.865455, -0.9216827, 1, 1, 1, 1, 1,
-0.6718639, 1.860692, -0.7437419, 1, 1, 1, 1, 1,
-0.6685847, -0.8509596, -2.872355, 1, 1, 1, 1, 1,
-0.6660343, 1.109396, -0.3399123, 0, 0, 1, 1, 1,
-0.6627886, 0.08147885, -2.304088, 1, 0, 0, 1, 1,
-0.6592801, -1.351929, -4.062292, 1, 0, 0, 1, 1,
-0.6580161, 2.034214, -0.7595899, 1, 0, 0, 1, 1,
-0.6488609, 0.2127929, -2.481756, 1, 0, 0, 1, 1,
-0.6485486, -2.292969, -2.92399, 1, 0, 0, 1, 1,
-0.6484121, 0.7533899, -1.007972, 0, 0, 0, 1, 1,
-0.6483427, 0.06117459, -3.455367, 0, 0, 0, 1, 1,
-0.6454077, -0.4796324, -0.8776691, 0, 0, 0, 1, 1,
-0.6430188, -0.06305899, -0.4483741, 0, 0, 0, 1, 1,
-0.6425633, 1.249844, 0.8182996, 0, 0, 0, 1, 1,
-0.641166, 0.7770022, 0.877875, 0, 0, 0, 1, 1,
-0.6283934, 1.070586, 0.2542638, 0, 0, 0, 1, 1,
-0.6274028, 2.154398, -2.236804, 1, 1, 1, 1, 1,
-0.6266729, 0.1805551, -1.043275, 1, 1, 1, 1, 1,
-0.625914, -0.6999726, -2.081927, 1, 1, 1, 1, 1,
-0.622218, 1.012762, -2.074451, 1, 1, 1, 1, 1,
-0.6159859, -0.9984912, -3.941798, 1, 1, 1, 1, 1,
-0.6146587, 0.0477775, -1.573145, 1, 1, 1, 1, 1,
-0.613883, 0.2975484, -2.459548, 1, 1, 1, 1, 1,
-0.6120829, -1.81143, -2.216992, 1, 1, 1, 1, 1,
-0.6056035, 1.396427, -1.794451, 1, 1, 1, 1, 1,
-0.6041311, 0.4812838, -0.2716436, 1, 1, 1, 1, 1,
-0.6035896, 0.6655474, -0.9156584, 1, 1, 1, 1, 1,
-0.5988308, 0.06587025, -2.590105, 1, 1, 1, 1, 1,
-0.5979341, -0.4554761, -0.3814118, 1, 1, 1, 1, 1,
-0.5971147, 2.191915, -1.52448, 1, 1, 1, 1, 1,
-0.5969843, 0.1844243, -3.366352, 1, 1, 1, 1, 1,
-0.5958142, -0.7040494, -1.288125, 0, 0, 1, 1, 1,
-0.5881055, 0.382934, -2.216432, 1, 0, 0, 1, 1,
-0.5832556, -0.3119573, -3.198535, 1, 0, 0, 1, 1,
-0.5832313, 1.583643, -0.8857501, 1, 0, 0, 1, 1,
-0.5778599, -0.1598165, -3.037223, 1, 0, 0, 1, 1,
-0.5758325, 0.5784594, 0.2347186, 1, 0, 0, 1, 1,
-0.5741097, -0.4320456, -2.203303, 0, 0, 0, 1, 1,
-0.570024, 0.1837136, -1.353519, 0, 0, 0, 1, 1,
-0.5694828, -1.144866, -2.3695, 0, 0, 0, 1, 1,
-0.5687065, 0.3228184, -2.239785, 0, 0, 0, 1, 1,
-0.5612105, -0.5966203, -2.205914, 0, 0, 0, 1, 1,
-0.5605773, -1.680727, -2.094355, 0, 0, 0, 1, 1,
-0.5592574, 0.3246392, -2.250181, 0, 0, 0, 1, 1,
-0.5484325, 0.1241452, -1.802314, 1, 1, 1, 1, 1,
-0.5473889, -0.7054192, -3.275266, 1, 1, 1, 1, 1,
-0.5382515, 2.660776, -0.8136526, 1, 1, 1, 1, 1,
-0.5382324, -0.3612759, -3.401962, 1, 1, 1, 1, 1,
-0.5379294, -0.7440864, -2.751638, 1, 1, 1, 1, 1,
-0.5373426, -1.496224, -1.215735, 1, 1, 1, 1, 1,
-0.5346214, -0.8249233, -3.389942, 1, 1, 1, 1, 1,
-0.5277019, -0.3359617, -1.179188, 1, 1, 1, 1, 1,
-0.5219632, -0.56937, -2.26898, 1, 1, 1, 1, 1,
-0.5197818, 1.819487, 0.01706656, 1, 1, 1, 1, 1,
-0.5176256, -1.126803, -2.338291, 1, 1, 1, 1, 1,
-0.5173131, 0.4953379, 0.2128912, 1, 1, 1, 1, 1,
-0.5164947, -1.812707, -3.187409, 1, 1, 1, 1, 1,
-0.5100086, 0.6101118, -0.7468211, 1, 1, 1, 1, 1,
-0.509885, 1.763632, 1.101058, 1, 1, 1, 1, 1,
-0.5074577, -0.9308307, -2.683508, 0, 0, 1, 1, 1,
-0.5036173, 0.07737669, -1.306731, 1, 0, 0, 1, 1,
-0.5034645, -0.3312216, -1.351436, 1, 0, 0, 1, 1,
-0.5031536, -0.2770484, -4.015567, 1, 0, 0, 1, 1,
-0.5023534, -1.020007, -3.610767, 1, 0, 0, 1, 1,
-0.5021532, -0.5245512, -2.345747, 1, 0, 0, 1, 1,
-0.5006575, -0.2831575, -3.018972, 0, 0, 0, 1, 1,
-0.4945622, 0.4454069, 0.7491544, 0, 0, 0, 1, 1,
-0.494104, -0.1008438, -2.454691, 0, 0, 0, 1, 1,
-0.4884523, -0.7181383, -3.909553, 0, 0, 0, 1, 1,
-0.4875792, 0.9137363, -0.5395615, 0, 0, 0, 1, 1,
-0.4842299, -0.6542785, -1.308892, 0, 0, 0, 1, 1,
-0.4820184, -0.5576865, -2.64193, 0, 0, 0, 1, 1,
-0.4808644, 0.6103032, 0.2293936, 1, 1, 1, 1, 1,
-0.4789622, -0.5262654, -1.272493, 1, 1, 1, 1, 1,
-0.4655024, 0.3700261, -1.795755, 1, 1, 1, 1, 1,
-0.4634584, 0.1790198, 0.4243998, 1, 1, 1, 1, 1,
-0.4632477, 0.7157993, -1.193738, 1, 1, 1, 1, 1,
-0.458294, -1.025007, -3.756378, 1, 1, 1, 1, 1,
-0.4581496, 1.193643, 1.516036, 1, 1, 1, 1, 1,
-0.4570719, -0.5303355, -3.237671, 1, 1, 1, 1, 1,
-0.4562066, -1.08017, -2.0952, 1, 1, 1, 1, 1,
-0.4540599, -0.3293149, -2.535087, 1, 1, 1, 1, 1,
-0.4467042, 0.05042604, -2.615922, 1, 1, 1, 1, 1,
-0.4388483, -0.5683263, -2.758416, 1, 1, 1, 1, 1,
-0.4346063, 0.3479628, -1.518018, 1, 1, 1, 1, 1,
-0.4335747, -0.09856122, -1.821986, 1, 1, 1, 1, 1,
-0.429878, 1.338577, 0.8634537, 1, 1, 1, 1, 1,
-0.4281522, -0.09388404, -1.184426, 0, 0, 1, 1, 1,
-0.4278228, -1.228206, -3.365994, 1, 0, 0, 1, 1,
-0.4192104, 0.5182038, -1.589058, 1, 0, 0, 1, 1,
-0.4100992, 1.612953, 0.1494, 1, 0, 0, 1, 1,
-0.404495, 0.1748425, -0.5505177, 1, 0, 0, 1, 1,
-0.4004742, -1.945662, -2.418282, 1, 0, 0, 1, 1,
-0.4004632, -0.6204135, -2.415765, 0, 0, 0, 1, 1,
-0.3982303, 0.9043492, -0.363427, 0, 0, 0, 1, 1,
-0.3961386, -1.48934, -2.700107, 0, 0, 0, 1, 1,
-0.3957004, -1.509047, -2.223601, 0, 0, 0, 1, 1,
-0.3871142, 0.9873798, -0.8964181, 0, 0, 0, 1, 1,
-0.3865434, -1.304021, -4.514013, 0, 0, 0, 1, 1,
-0.3856293, -0.08905749, -3.388093, 0, 0, 0, 1, 1,
-0.3823507, 0.6927494, -0.9512707, 1, 1, 1, 1, 1,
-0.3753865, 0.05171924, -2.228239, 1, 1, 1, 1, 1,
-0.3698702, -0.1446712, -1.280903, 1, 1, 1, 1, 1,
-0.3677413, -1.59906, -1.985933, 1, 1, 1, 1, 1,
-0.3677363, -1.739366, -2.746737, 1, 1, 1, 1, 1,
-0.3676259, 0.3618734, -0.4844789, 1, 1, 1, 1, 1,
-0.3612475, 2.080962, 2.133053, 1, 1, 1, 1, 1,
-0.3586729, -0.4354368, -0.9035766, 1, 1, 1, 1, 1,
-0.3580588, -0.86911, -3.55167, 1, 1, 1, 1, 1,
-0.3554374, -1.17284, -3.439582, 1, 1, 1, 1, 1,
-0.3512809, -0.4336442, -0.3258182, 1, 1, 1, 1, 1,
-0.341687, -0.2358428, -1.35306, 1, 1, 1, 1, 1,
-0.3416023, -0.6162916, -3.6764, 1, 1, 1, 1, 1,
-0.3386128, -0.7118438, -3.799429, 1, 1, 1, 1, 1,
-0.3384983, -1.336309, -3.754294, 1, 1, 1, 1, 1,
-0.3369266, -0.2628224, -3.978495, 0, 0, 1, 1, 1,
-0.3342144, 0.7577485, 0.3970878, 1, 0, 0, 1, 1,
-0.3305343, 1.119604, -1.42133, 1, 0, 0, 1, 1,
-0.328437, -0.356907, -3.627446, 1, 0, 0, 1, 1,
-0.3274727, 0.1347037, -0.9193391, 1, 0, 0, 1, 1,
-0.3225529, 1.160643, 0.753722, 1, 0, 0, 1, 1,
-0.3209321, -0.5889726, -2.367443, 0, 0, 0, 1, 1,
-0.3200288, 1.709092, 0.8058465, 0, 0, 0, 1, 1,
-0.3194338, -0.9966261, -2.702703, 0, 0, 0, 1, 1,
-0.3181773, -0.4913543, -3.43959, 0, 0, 0, 1, 1,
-0.3175222, -1.022535, -3.257962, 0, 0, 0, 1, 1,
-0.3134261, 0.5991072, 0.5121742, 0, 0, 0, 1, 1,
-0.3120755, -1.684273, -2.107687, 0, 0, 0, 1, 1,
-0.311157, 2.372603, -0.2542863, 1, 1, 1, 1, 1,
-0.3087455, -0.8371178, -3.1338, 1, 1, 1, 1, 1,
-0.3083883, 0.8549598, -1.899047, 1, 1, 1, 1, 1,
-0.2999302, -0.3179643, -4.286037, 1, 1, 1, 1, 1,
-0.2914889, 0.6641522, -1.553576, 1, 1, 1, 1, 1,
-0.2905566, 0.3842579, -0.398376, 1, 1, 1, 1, 1,
-0.2890823, 0.6341848, -2.590403, 1, 1, 1, 1, 1,
-0.2863151, 1.173533, -1.746511, 1, 1, 1, 1, 1,
-0.2861797, 0.08612072, -0.9100977, 1, 1, 1, 1, 1,
-0.2855613, -0.2544245, -3.667206, 1, 1, 1, 1, 1,
-0.2823689, -0.692582, -3.13154, 1, 1, 1, 1, 1,
-0.2793636, 1.533097, -0.9668913, 1, 1, 1, 1, 1,
-0.2774069, 0.6703818, -0.5682865, 1, 1, 1, 1, 1,
-0.2732141, 0.3245781, -2.334288, 1, 1, 1, 1, 1,
-0.272848, -0.557866, -3.46911, 1, 1, 1, 1, 1,
-0.2716917, -0.2843236, 0.4915552, 0, 0, 1, 1, 1,
-0.270772, -0.08598063, -2.932475, 1, 0, 0, 1, 1,
-0.2697086, 1.421793, 1.40484, 1, 0, 0, 1, 1,
-0.2696638, -1.72229, -2.19281, 1, 0, 0, 1, 1,
-0.2665129, 1.742214, -1.613034, 1, 0, 0, 1, 1,
-0.2652937, -0.5574572, -4.587532, 1, 0, 0, 1, 1,
-0.2645086, 0.9297966, 0.2813342, 0, 0, 0, 1, 1,
-0.2595351, 1.088209, 0.3009962, 0, 0, 0, 1, 1,
-0.2551894, 0.6678668, -1.734929, 0, 0, 0, 1, 1,
-0.2549425, 0.9702182, -0.5298784, 0, 0, 0, 1, 1,
-0.2529272, -0.3974768, -2.25684, 0, 0, 0, 1, 1,
-0.2476738, -1.279607, -3.421431, 0, 0, 0, 1, 1,
-0.245089, 1.934766, -1.32723, 0, 0, 0, 1, 1,
-0.2436336, -2.158793, -2.647971, 1, 1, 1, 1, 1,
-0.2405979, 0.2681978, -0.2859553, 1, 1, 1, 1, 1,
-0.2374003, -1.032013, -3.748143, 1, 1, 1, 1, 1,
-0.2366744, -0.9499306, -3.089844, 1, 1, 1, 1, 1,
-0.2364709, -0.6095662, -0.6467069, 1, 1, 1, 1, 1,
-0.2337439, 1.506604, 0.871549, 1, 1, 1, 1, 1,
-0.2222688, 0.2392069, 1.502503, 1, 1, 1, 1, 1,
-0.2164607, -0.6129405, -0.6616202, 1, 1, 1, 1, 1,
-0.2077414, 2.468403, 0.02875276, 1, 1, 1, 1, 1,
-0.2076021, -0.2332053, -2.144855, 1, 1, 1, 1, 1,
-0.2013954, -0.5054792, -3.168934, 1, 1, 1, 1, 1,
-0.2005996, 1.258718, -0.3854197, 1, 1, 1, 1, 1,
-0.1987524, -0.6612455, -3.273788, 1, 1, 1, 1, 1,
-0.1942966, 0.06726091, -2.050742, 1, 1, 1, 1, 1,
-0.193506, -0.03151852, -0.4922388, 1, 1, 1, 1, 1,
-0.1859498, 1.580932, 0.6176094, 0, 0, 1, 1, 1,
-0.1849201, 1.510395, 0.4520391, 1, 0, 0, 1, 1,
-0.1846419, 0.9918223, -0.7740701, 1, 0, 0, 1, 1,
-0.1815386, -1.25167, -2.369793, 1, 0, 0, 1, 1,
-0.1799399, 1.408558, 1.107314, 1, 0, 0, 1, 1,
-0.1777319, -0.3030319, -3.057999, 1, 0, 0, 1, 1,
-0.1768453, 0.2387519, -0.06657722, 0, 0, 0, 1, 1,
-0.1731092, 0.4599227, -2.217841, 0, 0, 0, 1, 1,
-0.1715893, 0.4906676, -1.788522, 0, 0, 0, 1, 1,
-0.1696446, -1.711909, -3.217317, 0, 0, 0, 1, 1,
-0.1626146, 0.5683458, -1.526846, 0, 0, 0, 1, 1,
-0.1592277, 0.3872292, -1.126047, 0, 0, 0, 1, 1,
-0.1556484, 0.7252632, -0.9791457, 0, 0, 0, 1, 1,
-0.1547567, 0.03496403, -2.093501, 1, 1, 1, 1, 1,
-0.1475906, 1.504141, 0.7959321, 1, 1, 1, 1, 1,
-0.1464673, -0.7343392, -3.350239, 1, 1, 1, 1, 1,
-0.1424154, -1.665022, -1.973132, 1, 1, 1, 1, 1,
-0.142031, -0.04852497, -2.110271, 1, 1, 1, 1, 1,
-0.1412148, -0.7541775, -3.332669, 1, 1, 1, 1, 1,
-0.1393388, -0.741116, -2.513941, 1, 1, 1, 1, 1,
-0.1331835, 1.184922, -1.898085, 1, 1, 1, 1, 1,
-0.1290379, 1.329096, -0.5358441, 1, 1, 1, 1, 1,
-0.1258226, -1.16022, -3.707066, 1, 1, 1, 1, 1,
-0.1253752, -1.952902, -3.864766, 1, 1, 1, 1, 1,
-0.1246728, 0.04388431, -0.8268133, 1, 1, 1, 1, 1,
-0.1232503, -0.3497503, -5.02953, 1, 1, 1, 1, 1,
-0.1157108, 0.4087439, 0.8523769, 1, 1, 1, 1, 1,
-0.1129271, -0.7018499, -3.922873, 1, 1, 1, 1, 1,
-0.1110249, 0.3546437, -2.753018, 0, 0, 1, 1, 1,
-0.1103631, 1.159924, -0.775457, 1, 0, 0, 1, 1,
-0.1089589, 0.2343002, -0.6034541, 1, 0, 0, 1, 1,
-0.1001422, 0.5422735, -0.4279658, 1, 0, 0, 1, 1,
-0.1000022, -0.1115278, -1.181124, 1, 0, 0, 1, 1,
-0.09878611, -0.8908554, -4.060502, 1, 0, 0, 1, 1,
-0.09659891, -0.6351117, -3.533393, 0, 0, 0, 1, 1,
-0.09488247, -0.625294, -0.7980313, 0, 0, 0, 1, 1,
-0.09430663, -0.3123347, -0.06322155, 0, 0, 0, 1, 1,
-0.09114315, 0.02573223, -1.324629, 0, 0, 0, 1, 1,
-0.08349569, -1.501228, -2.802676, 0, 0, 0, 1, 1,
-0.07966305, -0.2568145, -3.929257, 0, 0, 0, 1, 1,
-0.07874981, -1.963089, -4.076374, 0, 0, 0, 1, 1,
-0.07753538, 0.4725129, 0.9500183, 1, 1, 1, 1, 1,
-0.07640015, -2.792537, -4.189753, 1, 1, 1, 1, 1,
-0.07475588, -0.3782071, -1.674833, 1, 1, 1, 1, 1,
-0.0639587, 1.334701, -2.950016, 1, 1, 1, 1, 1,
-0.06193213, 0.8914865, 0.5564315, 1, 1, 1, 1, 1,
-0.06161504, 1.281137, 1.189113, 1, 1, 1, 1, 1,
-0.05698432, 1.104247, 2.277739, 1, 1, 1, 1, 1,
-0.05620181, 2.09233, -1.457903, 1, 1, 1, 1, 1,
-0.05602071, -0.3277334, -3.273713, 1, 1, 1, 1, 1,
-0.05116398, 0.09035143, -0.4998536, 1, 1, 1, 1, 1,
-0.04926264, -0.2967937, -3.056235, 1, 1, 1, 1, 1,
-0.04822812, 0.3196878, 1.350844, 1, 1, 1, 1, 1,
-0.04803712, 0.6374549, -0.405731, 1, 1, 1, 1, 1,
-0.04407953, -0.9925476, -4.075363, 1, 1, 1, 1, 1,
-0.04324379, 0.8038085, -1.077505, 1, 1, 1, 1, 1,
-0.04280759, 0.3302877, -0.3887751, 0, 0, 1, 1, 1,
-0.04004854, -0.6798126, -3.203517, 1, 0, 0, 1, 1,
-0.03813025, -1.575771, -3.1932, 1, 0, 0, 1, 1,
-0.03785983, -0.7253454, -5.453321, 1, 0, 0, 1, 1,
-0.03236864, -0.2112297, -2.824907, 1, 0, 0, 1, 1,
-0.03092736, 0.1829654, -0.02540632, 1, 0, 0, 1, 1,
-0.02909394, -0.242342, -1.107067, 0, 0, 0, 1, 1,
-0.02901084, -0.7875466, -2.889041, 0, 0, 0, 1, 1,
-0.02291728, -2.661747, -3.502634, 0, 0, 0, 1, 1,
-0.02041122, 0.2939505, 1.056646, 0, 0, 0, 1, 1,
-0.01889481, -0.2729442, -2.387701, 0, 0, 0, 1, 1,
-0.0150253, 0.6827997, 0.6613422, 0, 0, 0, 1, 1,
-0.01448525, 1.624108, -1.056335, 0, 0, 0, 1, 1,
-0.01400836, 0.6351856, -0.01970076, 1, 1, 1, 1, 1,
-0.01251697, -0.0439278, -3.107679, 1, 1, 1, 1, 1,
-0.01193093, 0.2200488, -2.172162, 1, 1, 1, 1, 1,
-0.009893142, 0.06717358, -0.1440109, 1, 1, 1, 1, 1,
-0.009607928, -1.03792, -5.490887, 1, 1, 1, 1, 1,
-0.009168883, -0.2641145, -3.109761, 1, 1, 1, 1, 1,
-0.004480413, 0.797703, 0.9974461, 1, 1, 1, 1, 1,
-0.003655801, -1.94696, -3.516391, 1, 1, 1, 1, 1,
-0.0004087267, -0.1450286, -3.770419, 1, 1, 1, 1, 1,
0.004470631, 0.7749293, -1.732001, 1, 1, 1, 1, 1,
0.006859578, -1.186052, 3.026718, 1, 1, 1, 1, 1,
0.01237727, -0.4802121, 2.872678, 1, 1, 1, 1, 1,
0.013838, 0.5981331, -0.2229431, 1, 1, 1, 1, 1,
0.01511305, 0.8631206, -0.5479497, 1, 1, 1, 1, 1,
0.01541969, 0.3704017, 0.8735873, 1, 1, 1, 1, 1,
0.02106708, 0.5644596, 0.9871377, 0, 0, 1, 1, 1,
0.0223129, -1.945811, 3.024973, 1, 0, 0, 1, 1,
0.02332437, 1.154275, -0.9363955, 1, 0, 0, 1, 1,
0.02663784, 0.3837195, -1.305461, 1, 0, 0, 1, 1,
0.02813119, -0.1722602, 3.627161, 1, 0, 0, 1, 1,
0.02885408, -0.02932968, 2.132442, 1, 0, 0, 1, 1,
0.02890634, -0.4363413, 3.575546, 0, 0, 0, 1, 1,
0.03200524, -1.348142, 4.36876, 0, 0, 0, 1, 1,
0.0323181, -0.6530885, 2.231367, 0, 0, 0, 1, 1,
0.03356261, 2.837201, -0.1987077, 0, 0, 0, 1, 1,
0.03677782, 2.101406, -0.9413497, 0, 0, 0, 1, 1,
0.03826138, 0.304624, 1.66764, 0, 0, 0, 1, 1,
0.04048374, -0.01369081, 1.651678, 0, 0, 0, 1, 1,
0.04334658, -0.5205747, 1.097142, 1, 1, 1, 1, 1,
0.04343922, 0.4751732, -0.3206285, 1, 1, 1, 1, 1,
0.0442615, -1.230318, 2.965289, 1, 1, 1, 1, 1,
0.04518311, 0.3104453, 0.6870459, 1, 1, 1, 1, 1,
0.04568991, 2.689965, -0.6574742, 1, 1, 1, 1, 1,
0.05339118, 0.2707891, -0.5129925, 1, 1, 1, 1, 1,
0.05852605, 0.5760244, 0.4550566, 1, 1, 1, 1, 1,
0.0630036, 0.08104459, 2.635937, 1, 1, 1, 1, 1,
0.06523953, 0.1699906, 0.5623127, 1, 1, 1, 1, 1,
0.0657852, 0.03453922, 0.6848007, 1, 1, 1, 1, 1,
0.06585263, 1.106707, 0.9695583, 1, 1, 1, 1, 1,
0.07333357, 0.08317285, 1.069477, 1, 1, 1, 1, 1,
0.07614885, -0.04013852, 2.756641, 1, 1, 1, 1, 1,
0.0764877, 0.7882534, -0.3632113, 1, 1, 1, 1, 1,
0.0771442, 2.131848, 0.4368176, 1, 1, 1, 1, 1,
0.08010027, 1.136731, 0.2113291, 0, 0, 1, 1, 1,
0.08225875, -0.2174296, 2.694746, 1, 0, 0, 1, 1,
0.08244157, 1.531336, 0.9685054, 1, 0, 0, 1, 1,
0.08345882, -0.02228099, 1.768974, 1, 0, 0, 1, 1,
0.08616018, 1.755311, -0.5234789, 1, 0, 0, 1, 1,
0.09104966, 1.977294, -0.5234326, 1, 0, 0, 1, 1,
0.1031499, 1.527411, 0.442492, 0, 0, 0, 1, 1,
0.1100039, -0.3487256, 1.11085, 0, 0, 0, 1, 1,
0.1105778, -0.6203167, 1.335781, 0, 0, 0, 1, 1,
0.1129573, 1.815534, 0.8298669, 0, 0, 0, 1, 1,
0.1133932, -0.1044272, 0.9223991, 0, 0, 0, 1, 1,
0.1141702, -0.146063, 1.961677, 0, 0, 0, 1, 1,
0.1157958, -0.0655002, 1.853531, 0, 0, 0, 1, 1,
0.1203172, 0.1578764, 3.19751, 1, 1, 1, 1, 1,
0.1212011, 0.05856405, 1.408456, 1, 1, 1, 1, 1,
0.1217021, -1.341899, 1.1453, 1, 1, 1, 1, 1,
0.1266569, 0.356724, 0.2738416, 1, 1, 1, 1, 1,
0.1290038, -1.01213, 1.532712, 1, 1, 1, 1, 1,
0.1305071, -0.4308701, 2.03431, 1, 1, 1, 1, 1,
0.1316616, 1.355489, -0.008853181, 1, 1, 1, 1, 1,
0.1338093, 0.2356534, 0.06238351, 1, 1, 1, 1, 1,
0.1360091, -0.4569244, 2.586897, 1, 1, 1, 1, 1,
0.137845, -0.7312692, 1.68117, 1, 1, 1, 1, 1,
0.1388049, -0.3973116, 2.931792, 1, 1, 1, 1, 1,
0.139199, -0.6018412, 1.601147, 1, 1, 1, 1, 1,
0.1411466, -0.9977188, 1.620641, 1, 1, 1, 1, 1,
0.1448981, 0.06043223, 1.088163, 1, 1, 1, 1, 1,
0.1482501, 0.1823664, -0.8045377, 1, 1, 1, 1, 1,
0.1496819, 0.5672547, -0.02950537, 0, 0, 1, 1, 1,
0.1541106, 0.5318615, 0.07972725, 1, 0, 0, 1, 1,
0.1557116, 0.3608626, 1.255382, 1, 0, 0, 1, 1,
0.1575868, 0.3760741, 0.7352218, 1, 0, 0, 1, 1,
0.1615896, 1.306073, 0.2856684, 1, 0, 0, 1, 1,
0.1643359, -0.232356, 1.7043, 1, 0, 0, 1, 1,
0.164538, -0.9095045, 1.758909, 0, 0, 0, 1, 1,
0.1662939, -0.2655701, 1.66192, 0, 0, 0, 1, 1,
0.1682182, -0.5520396, 4.507838, 0, 0, 0, 1, 1,
0.1684897, -0.8934778, 3.615335, 0, 0, 0, 1, 1,
0.1716208, 1.180125, -0.6780311, 0, 0, 0, 1, 1,
0.1723896, 0.1296578, 2.386237, 0, 0, 0, 1, 1,
0.1730233, 1.004514, 0.5646104, 0, 0, 0, 1, 1,
0.1734038, 1.099938, 0.5772994, 1, 1, 1, 1, 1,
0.1758703, 0.5385072, -1.187098, 1, 1, 1, 1, 1,
0.176172, 1.338969, -0.9389123, 1, 1, 1, 1, 1,
0.1789896, -1.947282, 3.561865, 1, 1, 1, 1, 1,
0.1793343, -0.0005801612, 3.027638, 1, 1, 1, 1, 1,
0.1815396, -2.60929, 3.40754, 1, 1, 1, 1, 1,
0.1869412, 0.653805, 0.4504417, 1, 1, 1, 1, 1,
0.1870078, -1.109164, 3.274767, 1, 1, 1, 1, 1,
0.1903151, -1.119614, 3.077989, 1, 1, 1, 1, 1,
0.1933465, -1.710695, 3.321602, 1, 1, 1, 1, 1,
0.2009613, 0.3088498, 1.197516, 1, 1, 1, 1, 1,
0.2027625, 1.836745, 1.069189, 1, 1, 1, 1, 1,
0.2037101, -1.425573, 4.603539, 1, 1, 1, 1, 1,
0.2098333, -0.3490802, 1.935228, 1, 1, 1, 1, 1,
0.2168343, -0.7198969, 1.498972, 1, 1, 1, 1, 1,
0.2195845, 0.4892657, -0.8864542, 0, 0, 1, 1, 1,
0.2219634, -0.1597838, 1.32281, 1, 0, 0, 1, 1,
0.2219795, -0.7716951, 2.809289, 1, 0, 0, 1, 1,
0.2226449, 0.6443561, 1.053783, 1, 0, 0, 1, 1,
0.2231449, -1.579753, 4.367503, 1, 0, 0, 1, 1,
0.2233734, -0.7605339, 2.029118, 1, 0, 0, 1, 1,
0.2249379, 1.392875, 1.394497, 0, 0, 0, 1, 1,
0.2274708, 0.8605958, 0.1728271, 0, 0, 0, 1, 1,
0.2280407, 1.214187, 0.5697339, 0, 0, 0, 1, 1,
0.2295579, 1.184797, -1.07956, 0, 0, 0, 1, 1,
0.2321271, 1.188179, -1.802156, 0, 0, 0, 1, 1,
0.2371498, 0.384145, 1.6019, 0, 0, 0, 1, 1,
0.238612, -1.057879, 3.242228, 0, 0, 0, 1, 1,
0.241129, 0.7045991, -0.6826245, 1, 1, 1, 1, 1,
0.2423836, -0.3930228, 1.959174, 1, 1, 1, 1, 1,
0.2429727, -0.2667257, 1.648676, 1, 1, 1, 1, 1,
0.2440937, 1.154121, -0.6040238, 1, 1, 1, 1, 1,
0.2450734, 0.8683723, -1.044546, 1, 1, 1, 1, 1,
0.2500807, -0.8782938, 3.293171, 1, 1, 1, 1, 1,
0.2512952, -0.08741505, 2.572445, 1, 1, 1, 1, 1,
0.2551283, 0.7968042, -0.165633, 1, 1, 1, 1, 1,
0.2555249, -0.05844322, 2.362309, 1, 1, 1, 1, 1,
0.2652056, -0.8699564, 1.314377, 1, 1, 1, 1, 1,
0.2705772, 1.282096, -0.4400069, 1, 1, 1, 1, 1,
0.273164, -1.490564, 1.649301, 1, 1, 1, 1, 1,
0.2774908, -0.3434979, 3.481412, 1, 1, 1, 1, 1,
0.2780429, -1.137419, 4.056998, 1, 1, 1, 1, 1,
0.2846971, 0.8626895, 1.84317, 1, 1, 1, 1, 1,
0.2869874, -1.079903, 2.303017, 0, 0, 1, 1, 1,
0.2912392, 0.462164, -0.4306689, 1, 0, 0, 1, 1,
0.2928045, -0.5659927, 4.083169, 1, 0, 0, 1, 1,
0.2933683, 0.4200253, 3.069862, 1, 0, 0, 1, 1,
0.2940897, -0.9731857, 0.5085056, 1, 0, 0, 1, 1,
0.2982716, -1.181139, 3.597853, 1, 0, 0, 1, 1,
0.299626, 1.020643, -0.1611769, 0, 0, 0, 1, 1,
0.3007322, 0.6151913, 2.11229, 0, 0, 0, 1, 1,
0.3040866, 0.5678646, 0.2585134, 0, 0, 0, 1, 1,
0.3051275, 0.8869006, 0.1257733, 0, 0, 0, 1, 1,
0.3064288, 0.3925348, 1.132626, 0, 0, 0, 1, 1,
0.3138101, -0.9730491, 3.027084, 0, 0, 0, 1, 1,
0.3143144, -2.19406, 2.303374, 0, 0, 0, 1, 1,
0.3163604, -0.8243834, 3.589038, 1, 1, 1, 1, 1,
0.3242991, -0.3098996, 1.287297, 1, 1, 1, 1, 1,
0.3243976, -0.3930754, 2.664701, 1, 1, 1, 1, 1,
0.3272968, -0.4196416, 2.71248, 1, 1, 1, 1, 1,
0.329584, -0.2393751, 3.198209, 1, 1, 1, 1, 1,
0.3343283, 0.5661258, 0.6421859, 1, 1, 1, 1, 1,
0.3348268, -1.310581, 3.651515, 1, 1, 1, 1, 1,
0.3351102, -2.025045, 1.749671, 1, 1, 1, 1, 1,
0.3359502, -0.4994637, 4.474741, 1, 1, 1, 1, 1,
0.338771, -1.383379, 4.104668, 1, 1, 1, 1, 1,
0.3401077, 0.1430547, 1.172725, 1, 1, 1, 1, 1,
0.3424344, 0.1816142, 1.318569, 1, 1, 1, 1, 1,
0.3431681, 0.4795012, 1.038062, 1, 1, 1, 1, 1,
0.3518917, -1.165591, 2.082192, 1, 1, 1, 1, 1,
0.353233, -0.6781009, 2.121762, 1, 1, 1, 1, 1,
0.3629591, 0.7735515, -0.0244745, 0, 0, 1, 1, 1,
0.3631377, -1.143435, 1.98208, 1, 0, 0, 1, 1,
0.3651135, 1.46366, -0.8568127, 1, 0, 0, 1, 1,
0.365586, 0.2279733, 2.920222, 1, 0, 0, 1, 1,
0.3686293, 1.134926, 1.474423, 1, 0, 0, 1, 1,
0.3699003, -0.5253633, 0.08069934, 1, 0, 0, 1, 1,
0.3710663, 1.784896, 0.8160998, 0, 0, 0, 1, 1,
0.3721816, -0.9742352, 2.234035, 0, 0, 0, 1, 1,
0.3721968, -0.8583272, 3.551738, 0, 0, 0, 1, 1,
0.373646, 0.02410777, 2.93843, 0, 0, 0, 1, 1,
0.3738167, -0.3309345, 0.810119, 0, 0, 0, 1, 1,
0.3742744, 1.885338, -0.1612475, 0, 0, 0, 1, 1,
0.3782363, -1.217302, 2.771658, 0, 0, 0, 1, 1,
0.3794343, -0.08230892, 2.161345, 1, 1, 1, 1, 1,
0.3820013, -0.4373794, 1.70775, 1, 1, 1, 1, 1,
0.3875782, 0.4491178, -0.3055567, 1, 1, 1, 1, 1,
0.3911809, 2.723151, -0.780807, 1, 1, 1, 1, 1,
0.3958312, -1.142904, 3.634738, 1, 1, 1, 1, 1,
0.4043127, 0.6529963, -0.7791643, 1, 1, 1, 1, 1,
0.4118208, -0.89625, 3.372257, 1, 1, 1, 1, 1,
0.4139948, 1.309233, 0.7160797, 1, 1, 1, 1, 1,
0.4149427, 0.7515958, 0.834552, 1, 1, 1, 1, 1,
0.4150049, -0.8929812, 1.773296, 1, 1, 1, 1, 1,
0.4162123, -1.007885, 3.410446, 1, 1, 1, 1, 1,
0.41867, -0.3849267, 0.4155071, 1, 1, 1, 1, 1,
0.4211488, -0.5801298, 3.654857, 1, 1, 1, 1, 1,
0.4279553, 1.923981, -0.4679668, 1, 1, 1, 1, 1,
0.4288103, 0.4353555, -0.2445765, 1, 1, 1, 1, 1,
0.4316307, 0.121301, 1.99829, 0, 0, 1, 1, 1,
0.439867, 0.3614877, 0.9014755, 1, 0, 0, 1, 1,
0.4419067, -0.3039771, 1.966057, 1, 0, 0, 1, 1,
0.4421081, 0.5790504, 0.4192584, 1, 0, 0, 1, 1,
0.442139, 1.430346, -0.7324083, 1, 0, 0, 1, 1,
0.442749, 1.156606, 0.2534634, 1, 0, 0, 1, 1,
0.4450434, 0.1685569, 0.3886672, 0, 0, 0, 1, 1,
0.445689, -0.5717145, 1.391709, 0, 0, 0, 1, 1,
0.4459262, -1.599871, 3.24545, 0, 0, 0, 1, 1,
0.4465534, -1.787765, 1.736481, 0, 0, 0, 1, 1,
0.452044, -2.300127, 2.401687, 0, 0, 0, 1, 1,
0.454485, 2.044848, -0.3437569, 0, 0, 0, 1, 1,
0.4600388, -0.2899088, 2.903932, 0, 0, 0, 1, 1,
0.4634066, -1.227234, 5.209879, 1, 1, 1, 1, 1,
0.4665625, -1.3463, 2.521645, 1, 1, 1, 1, 1,
0.4673611, 1.224567, 0.4480163, 1, 1, 1, 1, 1,
0.468335, -0.7391208, 2.681625, 1, 1, 1, 1, 1,
0.4692248, -1.617582, 1.732773, 1, 1, 1, 1, 1,
0.471593, 0.6279643, -0.2344047, 1, 1, 1, 1, 1,
0.4738373, -0.6472296, 1.426945, 1, 1, 1, 1, 1,
0.4755023, -1.618698, 3.946396, 1, 1, 1, 1, 1,
0.4788596, -0.5308006, 2.845445, 1, 1, 1, 1, 1,
0.4793133, -0.5255084, 3.23437, 1, 1, 1, 1, 1,
0.4873999, -1.560514, 3.446601, 1, 1, 1, 1, 1,
0.4882867, -1.600712, 1.960735, 1, 1, 1, 1, 1,
0.4884863, 0.1853957, 0.97123, 1, 1, 1, 1, 1,
0.4891592, 0.2073859, 1.143511, 1, 1, 1, 1, 1,
0.4956183, -0.4519373, 1.675671, 1, 1, 1, 1, 1,
0.4960665, 0.171693, 1.021001, 0, 0, 1, 1, 1,
0.4987454, 0.4557068, 0.5322152, 1, 0, 0, 1, 1,
0.5019696, -1.092865, 1.857059, 1, 0, 0, 1, 1,
0.502618, -0.5938027, 2.002086, 1, 0, 0, 1, 1,
0.5026446, 0.4474889, 1.484237, 1, 0, 0, 1, 1,
0.5052514, -2.472725, 2.057203, 1, 0, 0, 1, 1,
0.507214, -1.538649, -0.1651173, 0, 0, 0, 1, 1,
0.5102703, 0.6320054, 0.2757367, 0, 0, 0, 1, 1,
0.5115029, 2.416985, 0.7482847, 0, 0, 0, 1, 1,
0.5140528, -0.1283289, 2.585899, 0, 0, 0, 1, 1,
0.516336, -0.469456, 1.823629, 0, 0, 0, 1, 1,
0.5234692, -0.5782174, 1.871628, 0, 0, 0, 1, 1,
0.5301165, 1.009682, 0.5296351, 0, 0, 0, 1, 1,
0.5345426, 0.02244124, 1.033038, 1, 1, 1, 1, 1,
0.534692, 0.9368482, -0.06634673, 1, 1, 1, 1, 1,
0.5382374, -0.5062751, 2.748463, 1, 1, 1, 1, 1,
0.5423092, -0.04923227, 0.8366536, 1, 1, 1, 1, 1,
0.5446982, -0.01219989, 0.6645848, 1, 1, 1, 1, 1,
0.5558845, -0.5101752, 2.319251, 1, 1, 1, 1, 1,
0.5582767, 0.2492445, -0.04635535, 1, 1, 1, 1, 1,
0.5589725, -0.344767, 0.9343994, 1, 1, 1, 1, 1,
0.5634922, -0.8107677, 2.462469, 1, 1, 1, 1, 1,
0.5656454, -0.2051045, 0.569437, 1, 1, 1, 1, 1,
0.5721954, 0.7795545, 0.2683707, 1, 1, 1, 1, 1,
0.5925458, 0.2007513, 1.40438, 1, 1, 1, 1, 1,
0.6044205, 0.864702, 0.499275, 1, 1, 1, 1, 1,
0.6097103, 0.6962096, 0.424788, 1, 1, 1, 1, 1,
0.6146082, 1.444528, 0.9291011, 1, 1, 1, 1, 1,
0.61874, -1.194367, 3.014951, 0, 0, 1, 1, 1,
0.6191126, -1.22724, 0.677307, 1, 0, 0, 1, 1,
0.619426, 0.1928532, 0.8708811, 1, 0, 0, 1, 1,
0.6227899, 0.1855761, 1.704531, 1, 0, 0, 1, 1,
0.6277707, 0.294101, 2.092131, 1, 0, 0, 1, 1,
0.6297159, 1.42571, -0.05349837, 1, 0, 0, 1, 1,
0.6299828, 0.7156992, -0.5878175, 0, 0, 0, 1, 1,
0.640357, -2.215095, 4.446194, 0, 0, 0, 1, 1,
0.6405194, -0.2508067, 2.671607, 0, 0, 0, 1, 1,
0.6405409, -1.566525, 3.108611, 0, 0, 0, 1, 1,
0.6406881, 0.2452069, 0.9150795, 0, 0, 0, 1, 1,
0.6458858, 1.673254, 1.561774, 0, 0, 0, 1, 1,
0.6461579, -0.01184387, 1.807207, 0, 0, 0, 1, 1,
0.6463484, 0.161411, -0.1551228, 1, 1, 1, 1, 1,
0.6465933, 0.9318783, 2.319799, 1, 1, 1, 1, 1,
0.6475654, 0.8213012, 0.5798337, 1, 1, 1, 1, 1,
0.6513411, 0.6514531, 1.335976, 1, 1, 1, 1, 1,
0.6514022, -0.0780858, 4.742858, 1, 1, 1, 1, 1,
0.6576238, 0.2359838, 1.653356, 1, 1, 1, 1, 1,
0.6601005, -1.400804, 1.707836, 1, 1, 1, 1, 1,
0.6642278, 0.8453099, 1.284483, 1, 1, 1, 1, 1,
0.6651404, -1.546326, 4.035255, 1, 1, 1, 1, 1,
0.665507, 0.2904497, 0.1781861, 1, 1, 1, 1, 1,
0.6679562, -0.668574, 1.561948, 1, 1, 1, 1, 1,
0.6742067, 0.9924442, 1.502236, 1, 1, 1, 1, 1,
0.6900812, 0.6834182, 0.3081348, 1, 1, 1, 1, 1,
0.6993676, 1.657734, 1.259603, 1, 1, 1, 1, 1,
0.7043529, 0.2715115, 0.5056707, 1, 1, 1, 1, 1,
0.7051628, -1.067583, 3.930862, 0, 0, 1, 1, 1,
0.70675, 1.36334, -0.192983, 1, 0, 0, 1, 1,
0.7164398, 1.209995, 0.1779398, 1, 0, 0, 1, 1,
0.7312576, -0.8632321, 2.773036, 1, 0, 0, 1, 1,
0.7321729, -1.47253, 1.78395, 1, 0, 0, 1, 1,
0.7326785, -1.870631, 2.775127, 1, 0, 0, 1, 1,
0.7332858, -0.5052263, 2.656591, 0, 0, 0, 1, 1,
0.7345142, 0.8574054, -0.7430047, 0, 0, 0, 1, 1,
0.7372875, 1.063493, 0.8768085, 0, 0, 0, 1, 1,
0.7419021, 0.3780902, 1.816784, 0, 0, 0, 1, 1,
0.7469954, 1.482525, 2.717364, 0, 0, 0, 1, 1,
0.750207, 0.1140542, 0.6760474, 0, 0, 0, 1, 1,
0.7503413, -0.4261964, 2.11466, 0, 0, 0, 1, 1,
0.7571131, 0.6810917, 0.9096861, 1, 1, 1, 1, 1,
0.7592781, 0.6853467, 0.2469126, 1, 1, 1, 1, 1,
0.7741556, 1.116717, 0.9839024, 1, 1, 1, 1, 1,
0.7742223, -1.737539, 4.886067, 1, 1, 1, 1, 1,
0.7743306, 1.383229, -0.612416, 1, 1, 1, 1, 1,
0.7812854, -1.217802, 2.73446, 1, 1, 1, 1, 1,
0.7849318, 0.235453, 0.4513094, 1, 1, 1, 1, 1,
0.7867843, -0.7938421, 1.535068, 1, 1, 1, 1, 1,
0.7870346, -0.5357935, 2.464207, 1, 1, 1, 1, 1,
0.7955685, 1.012628, -2.619616, 1, 1, 1, 1, 1,
0.7959455, 1.153865, 0.1471497, 1, 1, 1, 1, 1,
0.8021276, 0.1429729, 3.071092, 1, 1, 1, 1, 1,
0.8037853, 1.560802, 0.8376588, 1, 1, 1, 1, 1,
0.8060068, 0.5439205, 1.351527, 1, 1, 1, 1, 1,
0.8151249, -1.444419, 3.321486, 1, 1, 1, 1, 1,
0.8200045, 0.7102801, 1.5953, 0, 0, 1, 1, 1,
0.8227553, -1.164855, 2.024745, 1, 0, 0, 1, 1,
0.8290419, -1.238164, 3.537447, 1, 0, 0, 1, 1,
0.8295138, -0.766096, 2.859594, 1, 0, 0, 1, 1,
0.8315781, 0.6813388, 1.341775, 1, 0, 0, 1, 1,
0.8338366, 1.435785, 0.1743774, 1, 0, 0, 1, 1,
0.8357624, -1.375423, 3.204367, 0, 0, 0, 1, 1,
0.8423608, -0.09972209, 1.604541, 0, 0, 0, 1, 1,
0.8467761, -0.1481221, 0.3781631, 0, 0, 0, 1, 1,
0.8470551, 0.2081134, 1.361527, 0, 0, 0, 1, 1,
0.8522612, 0.07504779, 2.390004, 0, 0, 0, 1, 1,
0.8614404, 0.3810517, 0.5665855, 0, 0, 0, 1, 1,
0.8642945, -0.7502941, 1.8252, 0, 0, 0, 1, 1,
0.866794, 0.4687355, 0.07019, 1, 1, 1, 1, 1,
0.8686952, 1.238867, 0.9982945, 1, 1, 1, 1, 1,
0.8693455, -1.113006, 2.058717, 1, 1, 1, 1, 1,
0.8717984, 2.028124, -1.505329, 1, 1, 1, 1, 1,
0.8739478, 0.03736152, 1.116287, 1, 1, 1, 1, 1,
0.8794324, -1.120289, 1.237809, 1, 1, 1, 1, 1,
0.8819795, 0.35256, 0.7916188, 1, 1, 1, 1, 1,
0.8868145, -0.2064404, 1.949091, 1, 1, 1, 1, 1,
0.8905288, -0.6528534, 3.038969, 1, 1, 1, 1, 1,
0.8933215, 0.1869983, 0.8152393, 1, 1, 1, 1, 1,
0.8956067, -0.4760279, 2.753563, 1, 1, 1, 1, 1,
0.8975749, -0.06179026, 2.846189, 1, 1, 1, 1, 1,
0.8992698, -0.2426654, 2.669235, 1, 1, 1, 1, 1,
0.9016061, -0.8717219, 1.933226, 1, 1, 1, 1, 1,
0.9030254, -1.492007, 3.297895, 1, 1, 1, 1, 1,
0.9060541, 2.244365, 0.8675977, 0, 0, 1, 1, 1,
0.9079148, 1.206619, 1.463042, 1, 0, 0, 1, 1,
0.9159162, -0.5253161, 2.482228, 1, 0, 0, 1, 1,
0.918444, -0.4060727, 2.697143, 1, 0, 0, 1, 1,
0.9216848, 0.2670322, 1.877803, 1, 0, 0, 1, 1,
0.9308878, -0.6813022, 2.590513, 1, 0, 0, 1, 1,
0.9357572, -1.178838, 2.79266, 0, 0, 0, 1, 1,
0.9369432, -0.477253, 2.76635, 0, 0, 0, 1, 1,
0.9420413, -0.5094706, 1.804055, 0, 0, 0, 1, 1,
0.9421656, -0.1499765, 2.339129, 0, 0, 0, 1, 1,
0.9464062, 1.245724, 1.244836, 0, 0, 0, 1, 1,
0.9514101, -0.11865, 1.409174, 0, 0, 0, 1, 1,
0.9562673, 2.088764, -0.5450824, 0, 0, 0, 1, 1,
0.9659256, -1.00008, 2.346676, 1, 1, 1, 1, 1,
0.9789779, -0.1311666, 1.388103, 1, 1, 1, 1, 1,
0.9807416, -1.765144, 3.485221, 1, 1, 1, 1, 1,
0.9824768, -1.953207, 2.606445, 1, 1, 1, 1, 1,
0.9854359, 0.2694949, 1.800426, 1, 1, 1, 1, 1,
0.9871404, -0.2995941, -0.3565305, 1, 1, 1, 1, 1,
0.9891593, -1.151483, 3.690103, 1, 1, 1, 1, 1,
0.9905654, -1.234657, 2.847793, 1, 1, 1, 1, 1,
0.9929054, 1.024392, -0.1990084, 1, 1, 1, 1, 1,
0.9931622, 0.1592115, 0.7138783, 1, 1, 1, 1, 1,
0.9961269, 1.464957, -0.1438654, 1, 1, 1, 1, 1,
1.000874, 1.36332, -0.3621362, 1, 1, 1, 1, 1,
1.01131, 0.2553426, 0.7254658, 1, 1, 1, 1, 1,
1.013744, -0.9361896, 3.330549, 1, 1, 1, 1, 1,
1.014943, 0.0377652, 1.806164, 1, 1, 1, 1, 1,
1.020698, 0.7795784, 0.8276561, 0, 0, 1, 1, 1,
1.025665, 1.35632, 0.1191616, 1, 0, 0, 1, 1,
1.030425, -0.8917212, 1.831245, 1, 0, 0, 1, 1,
1.031549, -0.04414107, 1.256618, 1, 0, 0, 1, 1,
1.034308, -0.3307744, 2.7889, 1, 0, 0, 1, 1,
1.038522, -0.2764114, 2.162688, 1, 0, 0, 1, 1,
1.041519, -0.4673098, 2.368719, 0, 0, 0, 1, 1,
1.042863, 0.9150535, -0.2791473, 0, 0, 0, 1, 1,
1.044884, -0.2303102, 0.7221324, 0, 0, 0, 1, 1,
1.049649, 0.728169, 0.1414298, 0, 0, 0, 1, 1,
1.05076, 0.1626954, 2.343092, 0, 0, 0, 1, 1,
1.05168, 0.09853411, 1.607173, 0, 0, 0, 1, 1,
1.053455, 0.7705135, 2.15905, 0, 0, 0, 1, 1,
1.053506, 0.0005773909, 1.670043, 1, 1, 1, 1, 1,
1.062352, -0.8067081, 0.8725049, 1, 1, 1, 1, 1,
1.063367, 0.8613414, 1.26458, 1, 1, 1, 1, 1,
1.071674, -1.198215, 3.244417, 1, 1, 1, 1, 1,
1.074662, 1.024251, 0.6567193, 1, 1, 1, 1, 1,
1.080826, 0.1110857, 2.932706, 1, 1, 1, 1, 1,
1.084044, -1.321752, 2.822083, 1, 1, 1, 1, 1,
1.086163, 2.207401, 1.9434, 1, 1, 1, 1, 1,
1.088744, -0.4523049, 2.579637, 1, 1, 1, 1, 1,
1.097019, -0.06560905, 1.709381, 1, 1, 1, 1, 1,
1.101261, 0.32282, 1.758306, 1, 1, 1, 1, 1,
1.105728, 1.29094, 0.2425053, 1, 1, 1, 1, 1,
1.116393, -0.06854533, -0.6087931, 1, 1, 1, 1, 1,
1.119827, -1.128041, 2.140531, 1, 1, 1, 1, 1,
1.124554, -1.065394, 2.878994, 1, 1, 1, 1, 1,
1.127807, -2.024875, 3.224836, 0, 0, 1, 1, 1,
1.128767, 0.6939211, 0.4394725, 1, 0, 0, 1, 1,
1.129682, -0.09864641, 1.755598, 1, 0, 0, 1, 1,
1.133808, -0.9661934, 1.030406, 1, 0, 0, 1, 1,
1.136826, 0.1286356, 0.8521251, 1, 0, 0, 1, 1,
1.143062, -0.1149867, -0.2319504, 1, 0, 0, 1, 1,
1.171061, 0.5817807, 1.003835, 0, 0, 0, 1, 1,
1.181093, -0.3283755, 1.880024, 0, 0, 0, 1, 1,
1.183147, 2.687017, 1.195951, 0, 0, 0, 1, 1,
1.191871, -0.1514378, -0.7330178, 0, 0, 0, 1, 1,
1.191987, -1.736597, 1.147021, 0, 0, 0, 1, 1,
1.194703, -1.614632, 4.276502, 0, 0, 0, 1, 1,
1.198336, -1.608499, 2.693641, 0, 0, 0, 1, 1,
1.20639, 0.9791348, 2.481589, 1, 1, 1, 1, 1,
1.215597, 0.4294769, 2.011658, 1, 1, 1, 1, 1,
1.229684, -1.225495, 1.708356, 1, 1, 1, 1, 1,
1.232656, 0.09663519, 0.6056296, 1, 1, 1, 1, 1,
1.244375, -0.1689863, 4.139152, 1, 1, 1, 1, 1,
1.245308, -0.5338944, 3.098829, 1, 1, 1, 1, 1,
1.253367, 0.3796197, -0.5446827, 1, 1, 1, 1, 1,
1.257366, 0.8862262, 2.383301, 1, 1, 1, 1, 1,
1.259174, -0.1147428, 2.001899, 1, 1, 1, 1, 1,
1.260067, 0.3936096, 1.226377, 1, 1, 1, 1, 1,
1.269615, -0.05837939, 3.188008, 1, 1, 1, 1, 1,
1.271504, 0.6852994, 0.001062357, 1, 1, 1, 1, 1,
1.273608, -0.2147123, 2.268828, 1, 1, 1, 1, 1,
1.277439, -0.1291564, 2.605862, 1, 1, 1, 1, 1,
1.281883, 1.266646, 0.1385629, 1, 1, 1, 1, 1,
1.285589, 1.299532, -0.6834142, 0, 0, 1, 1, 1,
1.286824, -0.5126285, 1.876904, 1, 0, 0, 1, 1,
1.287666, 0.3560832, -0.3862508, 1, 0, 0, 1, 1,
1.288295, -0.5194003, 1.841027, 1, 0, 0, 1, 1,
1.294195, -0.8454797, 1.961687, 1, 0, 0, 1, 1,
1.303414, 0.2220041, 1.931672, 1, 0, 0, 1, 1,
1.313848, -1.15199, 0.8166147, 0, 0, 0, 1, 1,
1.318491, -0.7596977, 0.8487417, 0, 0, 0, 1, 1,
1.319323, -1.130852, 2.922319, 0, 0, 0, 1, 1,
1.329729, 0.08240001, 0.6498171, 0, 0, 0, 1, 1,
1.341528, -0.7873233, 1.682486, 0, 0, 0, 1, 1,
1.353299, 1.984578, 0.2724255, 0, 0, 0, 1, 1,
1.356676, 0.6220375, -0.2300236, 0, 0, 0, 1, 1,
1.358293, 0.4210986, 1.659908, 1, 1, 1, 1, 1,
1.36596, 1.338814, -0.07409582, 1, 1, 1, 1, 1,
1.366307, 1.500547, 0.6985155, 1, 1, 1, 1, 1,
1.367679, 1.671912, 1.160213, 1, 1, 1, 1, 1,
1.369042, -0.01249088, -1.121119, 1, 1, 1, 1, 1,
1.369377, -0.6297349, 2.174945, 1, 1, 1, 1, 1,
1.414457, -1.234661, 2.880877, 1, 1, 1, 1, 1,
1.418967, -0.465501, 2.814515, 1, 1, 1, 1, 1,
1.426532, 0.2962933, 1.048853, 1, 1, 1, 1, 1,
1.432217, -0.7906533, 2.113855, 1, 1, 1, 1, 1,
1.440916, -0.3322861, 2.968112, 1, 1, 1, 1, 1,
1.443517, -0.9931029, 2.83617, 1, 1, 1, 1, 1,
1.447314, 1.487629, 2.49342, 1, 1, 1, 1, 1,
1.447591, -0.6298743, 4.817047, 1, 1, 1, 1, 1,
1.46662, -0.2370897, 1.576703, 1, 1, 1, 1, 1,
1.479468, 1.507269, 1.573269, 0, 0, 1, 1, 1,
1.494747, -0.1121883, 2.60449, 1, 0, 0, 1, 1,
1.496002, -0.2890102, 1.198896, 1, 0, 0, 1, 1,
1.497092, 0.8827482, 0.9830357, 1, 0, 0, 1, 1,
1.498814, -2.745926, 2.633701, 1, 0, 0, 1, 1,
1.504541, 0.5034236, 2.882442, 1, 0, 0, 1, 1,
1.511744, -0.606536, 2.234987, 0, 0, 0, 1, 1,
1.511933, -0.7319074, 2.741006, 0, 0, 0, 1, 1,
1.515912, -0.4053436, 1.988013, 0, 0, 0, 1, 1,
1.516368, 0.782477, 0.6018988, 0, 0, 0, 1, 1,
1.518637, 0.7289574, 0.5865061, 0, 0, 0, 1, 1,
1.525181, -0.1242758, 1.189225, 0, 0, 0, 1, 1,
1.53435, -0.9839925, 1.933916, 0, 0, 0, 1, 1,
1.537442, 0.463407, 0.4165559, 1, 1, 1, 1, 1,
1.539958, -1.09343, 2.426083, 1, 1, 1, 1, 1,
1.544942, -1.397819, 1.496756, 1, 1, 1, 1, 1,
1.550652, -1.314968, 1.29974, 1, 1, 1, 1, 1,
1.573603, 0.169619, -0.06894759, 1, 1, 1, 1, 1,
1.607667, 0.466051, 0.1549671, 1, 1, 1, 1, 1,
1.613439, 0.3593133, 1.705936, 1, 1, 1, 1, 1,
1.618677, -0.2485221, 4.072195, 1, 1, 1, 1, 1,
1.623097, 2.541039, 1.752116, 1, 1, 1, 1, 1,
1.633909, -0.9220224, 3.281103, 1, 1, 1, 1, 1,
1.634895, 0.1448228, 0.9389923, 1, 1, 1, 1, 1,
1.63601, -0.8923398, 1.667341, 1, 1, 1, 1, 1,
1.642943, 0.5289108, -0.07211412, 1, 1, 1, 1, 1,
1.644508, -0.0597102, 0.4191815, 1, 1, 1, 1, 1,
1.647398, 1.475078, 0.9413126, 1, 1, 1, 1, 1,
1.652236, -0.6659639, 2.048022, 0, 0, 1, 1, 1,
1.673907, -1.89498, 2.767716, 1, 0, 0, 1, 1,
1.681558, -0.9467829, 1.963954, 1, 0, 0, 1, 1,
1.744116, -1.469055, 3.316727, 1, 0, 0, 1, 1,
1.745968, 0.7281535, 1.762717, 1, 0, 0, 1, 1,
1.749512, -0.01761708, 1.55829, 1, 0, 0, 1, 1,
1.754239, 0.1461388, 0.7962441, 0, 0, 0, 1, 1,
1.761486, -0.1845565, 2.321718, 0, 0, 0, 1, 1,
1.763606, 0.01085398, 3.501252, 0, 0, 0, 1, 1,
1.777582, 0.09478031, 0.448137, 0, 0, 0, 1, 1,
1.815499, -0.3651204, 1.214549, 0, 0, 0, 1, 1,
1.833156, 0.3383115, 2.392411, 0, 0, 0, 1, 1,
1.840278, -1.645454, 1.711882, 0, 0, 0, 1, 1,
1.8406, -0.6899169, 2.829897, 1, 1, 1, 1, 1,
1.864665, -0.5265712, 0.7021029, 1, 1, 1, 1, 1,
1.876647, -0.3884541, 3.410352, 1, 1, 1, 1, 1,
1.878237, 1.254354, -0.1695208, 1, 1, 1, 1, 1,
1.890835, -1.192675, 2.167957, 1, 1, 1, 1, 1,
1.906677, -0.2872813, 2.492448, 1, 1, 1, 1, 1,
1.910044, -0.3314576, 2.991972, 1, 1, 1, 1, 1,
1.916357, -1.010438, 1.601764, 1, 1, 1, 1, 1,
1.933076, 1.287401, -0.1647165, 1, 1, 1, 1, 1,
1.938538, 0.384773, 2.528393, 1, 1, 1, 1, 1,
1.967684, -0.1213054, 1.244054, 1, 1, 1, 1, 1,
1.971916, 0.09260645, 1.510606, 1, 1, 1, 1, 1,
2.00939, 0.5240526, 0.551366, 1, 1, 1, 1, 1,
2.035053, -0.5379248, 1.969633, 1, 1, 1, 1, 1,
2.052788, 1.483407, 1.229259, 1, 1, 1, 1, 1,
2.073195, 0.318502, 1.361919, 0, 0, 1, 1, 1,
2.083907, -0.0163837, 1.784057, 1, 0, 0, 1, 1,
2.087353, -1.041946, 0.9784779, 1, 0, 0, 1, 1,
2.101444, 0.2835196, 2.109847, 1, 0, 0, 1, 1,
2.113967, 0.1956755, 1.731231, 1, 0, 0, 1, 1,
2.129619, 0.4330739, 1.242074, 1, 0, 0, 1, 1,
2.156778, -1.015244, 1.611392, 0, 0, 0, 1, 1,
2.16418, 1.832754, 1.47711, 0, 0, 0, 1, 1,
2.173699, 1.336347, 2.254179, 0, 0, 0, 1, 1,
2.178692, 1.914107, 0.8796811, 0, 0, 0, 1, 1,
2.179876, -2.193844, 4.055764, 0, 0, 0, 1, 1,
2.198089, -0.1160581, 3.631022, 0, 0, 0, 1, 1,
2.198116, -0.09795506, 1.359461, 0, 0, 0, 1, 1,
2.198802, -0.03271681, 1.467693, 1, 1, 1, 1, 1,
2.444121, 0.6116076, -0.2671727, 1, 1, 1, 1, 1,
2.476474, 1.594888, 0.05109323, 1, 1, 1, 1, 1,
2.566903, -0.5662854, 2.143827, 1, 1, 1, 1, 1,
2.688879, 0.1718235, 1.92831, 1, 1, 1, 1, 1,
3.128185, 2.065044, -0.9630309, 1, 1, 1, 1, 1,
3.334557, -1.466829, 2.76057, 1, 1, 1, 1, 1
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
var radius = 9.911758;
var distance = 34.81463;
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
mvMatrix.translate( -0.02566814, 0.1185999, 0.1405039 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.81463);
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
