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
-3.337105, -1.381531, -0.524446, 1, 0, 0, 1,
-3.142148, 0.9113617, -1.59051, 1, 0.007843138, 0, 1,
-3.064889, -0.1546166, -1.55027, 1, 0.01176471, 0, 1,
-3.064347, -1.306895, -2.658914, 1, 0.01960784, 0, 1,
-3.036193, -0.1341788, 0.2376409, 1, 0.02352941, 0, 1,
-2.863189, -0.1486923, 0.5738711, 1, 0.03137255, 0, 1,
-2.852371, -0.4987715, -3.108949, 1, 0.03529412, 0, 1,
-2.766886, 0.43144, -2.765905, 1, 0.04313726, 0, 1,
-2.613521, 0.5840079, -1.746879, 1, 0.04705882, 0, 1,
-2.591377, 0.9647093, -0.8496447, 1, 0.05490196, 0, 1,
-2.453813, -1.190909, -2.956251, 1, 0.05882353, 0, 1,
-2.428553, -0.3304431, -0.6688748, 1, 0.06666667, 0, 1,
-2.38024, 0.9212392, -1.320941, 1, 0.07058824, 0, 1,
-2.369089, 1.057222, 0.1370288, 1, 0.07843138, 0, 1,
-2.334605, 0.4171749, -0.8130275, 1, 0.08235294, 0, 1,
-2.256045, -0.3843784, -0.6036043, 1, 0.09019608, 0, 1,
-2.212951, -0.4721469, -1.27519, 1, 0.09411765, 0, 1,
-2.209264, -0.3415784, -1.755401, 1, 0.1019608, 0, 1,
-2.197766, 1.392855, -0.800324, 1, 0.1098039, 0, 1,
-2.195894, -0.1520759, -0.8730957, 1, 0.1137255, 0, 1,
-2.033797, -0.8691859, -2.134745, 1, 0.1215686, 0, 1,
-1.988966, -1.548272, -2.591995, 1, 0.1254902, 0, 1,
-1.986925, 0.3607685, -1.160075, 1, 0.1333333, 0, 1,
-1.982248, 0.2381391, -2.099095, 1, 0.1372549, 0, 1,
-1.953667, 0.3456884, -0.8790547, 1, 0.145098, 0, 1,
-1.889776, -0.1612386, -3.785912, 1, 0.1490196, 0, 1,
-1.871305, -0.5954909, -0.5547192, 1, 0.1568628, 0, 1,
-1.865341, -0.6475635, -0.1332808, 1, 0.1607843, 0, 1,
-1.861641, 0.4951502, 0.2822303, 1, 0.1686275, 0, 1,
-1.859378, -0.07511209, -3.143322, 1, 0.172549, 0, 1,
-1.848714, 2.580272, -0.802874, 1, 0.1803922, 0, 1,
-1.846857, -0.07489198, -2.26017, 1, 0.1843137, 0, 1,
-1.832204, -0.07720678, -0.5201116, 1, 0.1921569, 0, 1,
-1.811764, 0.06943475, -0.3776227, 1, 0.1960784, 0, 1,
-1.811741, -0.2910175, -4.086467, 1, 0.2039216, 0, 1,
-1.808148, -1.307201, -3.25216, 1, 0.2117647, 0, 1,
-1.804756, -0.5579152, -3.232984, 1, 0.2156863, 0, 1,
-1.787169, -0.4234676, 0.2910476, 1, 0.2235294, 0, 1,
-1.781461, -1.373262, -0.1862335, 1, 0.227451, 0, 1,
-1.780946, 2.170727, -0.5840499, 1, 0.2352941, 0, 1,
-1.758249, 0.4472157, -0.930757, 1, 0.2392157, 0, 1,
-1.746535, 0.1048925, -1.696954, 1, 0.2470588, 0, 1,
-1.740266, 1.69561, -2.202909, 1, 0.2509804, 0, 1,
-1.734079, 0.3904117, -1.034362, 1, 0.2588235, 0, 1,
-1.717688, 3.22408, -3.141574, 1, 0.2627451, 0, 1,
-1.712849, -2.085553, -4.53055, 1, 0.2705882, 0, 1,
-1.682535, -0.3055771, -0.3988584, 1, 0.2745098, 0, 1,
-1.668911, -0.08915955, -0.6750616, 1, 0.282353, 0, 1,
-1.666763, 0.803849, 0.1682198, 1, 0.2862745, 0, 1,
-1.659477, -0.6904927, -2.588609, 1, 0.2941177, 0, 1,
-1.652454, -0.05017336, -0.04976295, 1, 0.3019608, 0, 1,
-1.651878, 0.1117421, -2.614332, 1, 0.3058824, 0, 1,
-1.642513, -1.422915, -2.236476, 1, 0.3137255, 0, 1,
-1.622693, 0.7479975, -3.453158, 1, 0.3176471, 0, 1,
-1.61402, -0.1532701, -0.7676319, 1, 0.3254902, 0, 1,
-1.602121, 0.3696678, -0.7802363, 1, 0.3294118, 0, 1,
-1.601265, -0.6753618, -2.750433, 1, 0.3372549, 0, 1,
-1.585923, -0.5070423, -2.692904, 1, 0.3411765, 0, 1,
-1.579152, -0.2092593, -1.305199, 1, 0.3490196, 0, 1,
-1.572692, -0.7316617, -3.197771, 1, 0.3529412, 0, 1,
-1.5689, 0.8975938, 0.2166006, 1, 0.3607843, 0, 1,
-1.556214, 0.5253984, -0.8150358, 1, 0.3647059, 0, 1,
-1.525822, 1.275797, -2.788538, 1, 0.372549, 0, 1,
-1.496297, -0.6227525, -1.732968, 1, 0.3764706, 0, 1,
-1.494058, 0.02281775, -2.082137, 1, 0.3843137, 0, 1,
-1.49275, 1.425, 0.9996944, 1, 0.3882353, 0, 1,
-1.484805, -0.8727257, -2.42372, 1, 0.3960784, 0, 1,
-1.482082, 2.258569, 0.4168445, 1, 0.4039216, 0, 1,
-1.479537, -1.698654, -2.903978, 1, 0.4078431, 0, 1,
-1.46801, 0.5469328, -0.6951678, 1, 0.4156863, 0, 1,
-1.467999, -1.107776, -1.252359, 1, 0.4196078, 0, 1,
-1.466998, -1.306746, -2.821057, 1, 0.427451, 0, 1,
-1.465916, 0.5357362, -1.066128, 1, 0.4313726, 0, 1,
-1.45509, -0.4144739, -1.802639, 1, 0.4392157, 0, 1,
-1.442467, 0.7746066, -2.731289, 1, 0.4431373, 0, 1,
-1.431218, 0.559527, -0.3593261, 1, 0.4509804, 0, 1,
-1.430588, 1.076476, -0.7616895, 1, 0.454902, 0, 1,
-1.428182, -0.8982384, -1.532215, 1, 0.4627451, 0, 1,
-1.427191, -0.3241206, -0.9578943, 1, 0.4666667, 0, 1,
-1.424437, 0.8900644, -2.241598, 1, 0.4745098, 0, 1,
-1.414032, 0.9772201, -0.8874658, 1, 0.4784314, 0, 1,
-1.408067, -1.240224, -2.61531, 1, 0.4862745, 0, 1,
-1.401903, 1.020881, -1.282752, 1, 0.4901961, 0, 1,
-1.392652, 1.852083, 0.2751672, 1, 0.4980392, 0, 1,
-1.392043, 0.7058141, -1.083097, 1, 0.5058824, 0, 1,
-1.386831, -0.9700657, -3.465961, 1, 0.509804, 0, 1,
-1.380548, 1.604505, -0.9989491, 1, 0.5176471, 0, 1,
-1.377005, 1.993556, -1.713682, 1, 0.5215687, 0, 1,
-1.37065, -0.7342968, -0.7690283, 1, 0.5294118, 0, 1,
-1.355272, 0.09377789, -3.286232, 1, 0.5333334, 0, 1,
-1.348608, 0.345544, -2.231872, 1, 0.5411765, 0, 1,
-1.344579, -0.05286469, 0.04627757, 1, 0.5450981, 0, 1,
-1.34166, 1.146653, -2.159128, 1, 0.5529412, 0, 1,
-1.340492, 0.4659388, -1.18633, 1, 0.5568628, 0, 1,
-1.326486, -1.000932, -2.596193, 1, 0.5647059, 0, 1,
-1.326309, 1.588002, -1.328339, 1, 0.5686275, 0, 1,
-1.324289, 0.915366, -2.403814, 1, 0.5764706, 0, 1,
-1.317915, 0.04781552, -2.332166, 1, 0.5803922, 0, 1,
-1.313558, -0.09151044, -0.04448841, 1, 0.5882353, 0, 1,
-1.305791, 1.112371, -0.09297629, 1, 0.5921569, 0, 1,
-1.305606, -0.8754435, -1.011243, 1, 0.6, 0, 1,
-1.303522, -0.09643387, -2.244756, 1, 0.6078432, 0, 1,
-1.269868, -1.276006, -2.544965, 1, 0.6117647, 0, 1,
-1.25366, 0.1129611, -0.8531218, 1, 0.6196079, 0, 1,
-1.240733, -1.139675, -2.429365, 1, 0.6235294, 0, 1,
-1.238828, -0.6828446, -2.147421, 1, 0.6313726, 0, 1,
-1.232174, 0.005762395, -1.82209, 1, 0.6352941, 0, 1,
-1.230917, 1.265957, 0.1604159, 1, 0.6431373, 0, 1,
-1.228196, -2.001939, -3.462158, 1, 0.6470588, 0, 1,
-1.222415, -0.2584572, -2.761348, 1, 0.654902, 0, 1,
-1.218505, 1.149511, 0.8761624, 1, 0.6588235, 0, 1,
-1.218146, -0.05819735, -2.204589, 1, 0.6666667, 0, 1,
-1.208135, 0.06994415, -2.304779, 1, 0.6705883, 0, 1,
-1.203894, -1.35774, -4.201491, 1, 0.6784314, 0, 1,
-1.199859, 0.4837398, -1.116267, 1, 0.682353, 0, 1,
-1.180643, -0.2310769, -1.520816, 1, 0.6901961, 0, 1,
-1.173943, 2.205337, -0.9090632, 1, 0.6941177, 0, 1,
-1.168222, -0.1773964, -1.376332, 1, 0.7019608, 0, 1,
-1.127946, -1.023837, -2.397349, 1, 0.7098039, 0, 1,
-1.123306, 0.699371, -0.4734996, 1, 0.7137255, 0, 1,
-1.117972, -1.394552, -1.192867, 1, 0.7215686, 0, 1,
-1.112824, 0.4836681, -1.792065, 1, 0.7254902, 0, 1,
-1.106463, 0.9063025, 0.1653024, 1, 0.7333333, 0, 1,
-1.105238, -0.2343304, -1.848489, 1, 0.7372549, 0, 1,
-1.103181, 1.100911, -0.7605362, 1, 0.7450981, 0, 1,
-1.099956, 0.4434316, -2.801666, 1, 0.7490196, 0, 1,
-1.097435, 1.247117, -0.01255054, 1, 0.7568628, 0, 1,
-1.096322, 1.096637, -1.41922, 1, 0.7607843, 0, 1,
-1.094362, -0.9653276, -1.633498, 1, 0.7686275, 0, 1,
-1.089408, -0.2149905, -2.096464, 1, 0.772549, 0, 1,
-1.077954, -0.7400674, -2.731771, 1, 0.7803922, 0, 1,
-1.069825, 0.5733876, -0.8686026, 1, 0.7843137, 0, 1,
-1.066337, -1.227368, -3.315399, 1, 0.7921569, 0, 1,
-1.061208, -1.05622, -2.074981, 1, 0.7960784, 0, 1,
-1.059221, -1.467978, -1.971406, 1, 0.8039216, 0, 1,
-1.057809, 0.517483, -2.994714, 1, 0.8117647, 0, 1,
-1.042191, 0.05659267, -0.4180289, 1, 0.8156863, 0, 1,
-1.038463, -0.2868561, -1.168645, 1, 0.8235294, 0, 1,
-1.037272, 0.293172, 0.03152335, 1, 0.827451, 0, 1,
-1.036919, 0.1998809, -0.5492331, 1, 0.8352941, 0, 1,
-1.018939, 0.3867571, -1.854776, 1, 0.8392157, 0, 1,
-1.018848, -1.194651, -1.076145, 1, 0.8470588, 0, 1,
-1.002254, -0.303485, -3.319425, 1, 0.8509804, 0, 1,
-0.9997288, 1.287726, 0.1266313, 1, 0.8588235, 0, 1,
-0.9920564, -0.9017361, -2.24197, 1, 0.8627451, 0, 1,
-0.9870931, -0.9779629, -2.793835, 1, 0.8705882, 0, 1,
-0.9822748, -0.859509, -3.837493, 1, 0.8745098, 0, 1,
-0.9812489, 1.198322, -0.6797631, 1, 0.8823529, 0, 1,
-0.9646779, 0.6700332, -0.1743953, 1, 0.8862745, 0, 1,
-0.9582924, 0.7171389, -0.2284593, 1, 0.8941177, 0, 1,
-0.9570439, -0.2721427, -2.056892, 1, 0.8980392, 0, 1,
-0.9570388, -0.2123672, -1.40552, 1, 0.9058824, 0, 1,
-0.9552228, -0.07242911, -1.286401, 1, 0.9137255, 0, 1,
-0.948489, -0.07557533, -2.111624, 1, 0.9176471, 0, 1,
-0.9475932, -0.4007291, -0.8272232, 1, 0.9254902, 0, 1,
-0.9461872, -0.4537515, -2.612989, 1, 0.9294118, 0, 1,
-0.9428117, 0.1651122, -1.347463, 1, 0.9372549, 0, 1,
-0.939103, -0.01439273, -2.690806, 1, 0.9411765, 0, 1,
-0.9385406, -0.2512772, -2.645228, 1, 0.9490196, 0, 1,
-0.9377315, 0.06390611, -1.081531, 1, 0.9529412, 0, 1,
-0.9373767, 0.7647669, -0.6527284, 1, 0.9607843, 0, 1,
-0.9350718, -0.164252, -1.733883, 1, 0.9647059, 0, 1,
-0.9297535, -1.255075, -1.616279, 1, 0.972549, 0, 1,
-0.9292784, 0.8044471, -1.055009, 1, 0.9764706, 0, 1,
-0.9249968, -0.9598562, -2.075803, 1, 0.9843137, 0, 1,
-0.9237693, 0.3417019, -0.4523562, 1, 0.9882353, 0, 1,
-0.9214533, -0.09377637, -1.840501, 1, 0.9960784, 0, 1,
-0.9213028, 0.01410604, -2.75556, 0.9960784, 1, 0, 1,
-0.9099467, 0.2970168, -1.775825, 0.9921569, 1, 0, 1,
-0.9030375, 0.550275, 0.5782784, 0.9843137, 1, 0, 1,
-0.8992029, -0.2738724, -1.02419, 0.9803922, 1, 0, 1,
-0.886181, 1.03623, -1.96095, 0.972549, 1, 0, 1,
-0.8834424, 2.361112, 0.3961385, 0.9686275, 1, 0, 1,
-0.8810471, -0.8976103, -3.566058, 0.9607843, 1, 0, 1,
-0.8780981, -1.915614, -3.470701, 0.9568627, 1, 0, 1,
-0.8769279, -1.625218, -4.250414, 0.9490196, 1, 0, 1,
-0.8768935, 0.522261, 0.3444723, 0.945098, 1, 0, 1,
-0.8764207, -1.556772, -3.596224, 0.9372549, 1, 0, 1,
-0.8681868, 0.006192325, -3.867582, 0.9333333, 1, 0, 1,
-0.8609717, -0.4487938, -2.125863, 0.9254902, 1, 0, 1,
-0.8594559, 0.44051, -1.740703, 0.9215686, 1, 0, 1,
-0.852346, -1.077164, -2.467044, 0.9137255, 1, 0, 1,
-0.8468397, 0.4218669, -2.514732, 0.9098039, 1, 0, 1,
-0.8419815, 2.123856, -0.9687157, 0.9019608, 1, 0, 1,
-0.8383135, 1.239441, -0.7134631, 0.8941177, 1, 0, 1,
-0.8321488, -0.7183317, -2.363938, 0.8901961, 1, 0, 1,
-0.8303502, 1.393145, -1.076426, 0.8823529, 1, 0, 1,
-0.8290101, 0.3893096, -0.08192246, 0.8784314, 1, 0, 1,
-0.8276951, 1.18645, -1.13052, 0.8705882, 1, 0, 1,
-0.8263286, 1.018838, -1.587126, 0.8666667, 1, 0, 1,
-0.8145654, -0.3428994, -3.069155, 0.8588235, 1, 0, 1,
-0.8145398, -0.4630783, -1.368553, 0.854902, 1, 0, 1,
-0.8109503, 1.096878, -1.58668, 0.8470588, 1, 0, 1,
-0.807735, 0.4775847, -2.361696, 0.8431373, 1, 0, 1,
-0.8058325, -0.9768062, -2.675544, 0.8352941, 1, 0, 1,
-0.8048513, 0.4627267, -2.050929, 0.8313726, 1, 0, 1,
-0.8047146, -0.08951676, -2.189854, 0.8235294, 1, 0, 1,
-0.8017272, 0.565136, -0.6801083, 0.8196079, 1, 0, 1,
-0.8016692, -0.8095903, -0.7751547, 0.8117647, 1, 0, 1,
-0.7997169, -1.086599, -0.0921393, 0.8078431, 1, 0, 1,
-0.794871, -1.429636, -4.38065, 0.8, 1, 0, 1,
-0.7886516, -0.773636, -1.41861, 0.7921569, 1, 0, 1,
-0.7880126, 0.6077437, -1.22721, 0.7882353, 1, 0, 1,
-0.7857987, 0.451753, -1.148973, 0.7803922, 1, 0, 1,
-0.7807181, 0.07640448, -1.011851, 0.7764706, 1, 0, 1,
-0.7804291, -0.7899579, -1.805902, 0.7686275, 1, 0, 1,
-0.7792507, 1.319407, -2.988755, 0.7647059, 1, 0, 1,
-0.7739345, -0.9682183, -2.867875, 0.7568628, 1, 0, 1,
-0.772956, -0.4021535, -3.804691, 0.7529412, 1, 0, 1,
-0.765184, -1.013535, -2.576083, 0.7450981, 1, 0, 1,
-0.7648426, 0.2480922, -0.07658809, 0.7411765, 1, 0, 1,
-0.7593135, 0.1425846, -4.256124, 0.7333333, 1, 0, 1,
-0.7550235, 0.3454444, -1.009155, 0.7294118, 1, 0, 1,
-0.7360495, 0.9662647, -3.87037, 0.7215686, 1, 0, 1,
-0.7355399, 0.481714, -1.338677, 0.7176471, 1, 0, 1,
-0.7322253, -0.6353905, -3.968938, 0.7098039, 1, 0, 1,
-0.7294971, 0.52068, -3.261663, 0.7058824, 1, 0, 1,
-0.7288224, -0.7199311, -2.742177, 0.6980392, 1, 0, 1,
-0.7259257, 0.5648907, 0.6902398, 0.6901961, 1, 0, 1,
-0.7190403, -1.364563, -2.757571, 0.6862745, 1, 0, 1,
-0.7188561, -0.2157233, -2.001694, 0.6784314, 1, 0, 1,
-0.7147291, -0.8168827, -3.356294, 0.6745098, 1, 0, 1,
-0.7138627, 0.1524823, -1.079502, 0.6666667, 1, 0, 1,
-0.7068729, 0.8300183, -1.43226, 0.6627451, 1, 0, 1,
-0.7041442, -0.2808483, -1.822893, 0.654902, 1, 0, 1,
-0.7031063, -0.7420479, -1.563412, 0.6509804, 1, 0, 1,
-0.6988746, 0.9911043, -0.2709734, 0.6431373, 1, 0, 1,
-0.6982185, 0.5255886, -2.451566, 0.6392157, 1, 0, 1,
-0.6971109, 0.3212316, -1.561714, 0.6313726, 1, 0, 1,
-0.6953487, 0.6037201, -1.515298, 0.627451, 1, 0, 1,
-0.692141, 1.201507, 0.3269129, 0.6196079, 1, 0, 1,
-0.6870208, -1.133707, -2.955477, 0.6156863, 1, 0, 1,
-0.6809427, -0.08002953, -0.3981712, 0.6078432, 1, 0, 1,
-0.6765054, 0.04478898, -1.852934, 0.6039216, 1, 0, 1,
-0.6756597, -0.2606529, -2.202653, 0.5960785, 1, 0, 1,
-0.6711102, 1.232371, -0.4218623, 0.5882353, 1, 0, 1,
-0.6660044, -2.160188, -3.663655, 0.5843138, 1, 0, 1,
-0.6638153, 0.1273025, -1.430802, 0.5764706, 1, 0, 1,
-0.6602325, 0.5127991, 0.2033159, 0.572549, 1, 0, 1,
-0.6580658, -2.162804, -2.021815, 0.5647059, 1, 0, 1,
-0.6576149, -1.346158, -1.95769, 0.5607843, 1, 0, 1,
-0.6541993, 0.1047654, -2.483438, 0.5529412, 1, 0, 1,
-0.6469315, 0.614392, -2.59284, 0.5490196, 1, 0, 1,
-0.6458138, -1.370173, -2.964292, 0.5411765, 1, 0, 1,
-0.6449006, 0.5217948, -1.24239, 0.5372549, 1, 0, 1,
-0.6388963, -0.8320981, -2.997895, 0.5294118, 1, 0, 1,
-0.6371796, 2.260466, 0.8867947, 0.5254902, 1, 0, 1,
-0.635016, 0.02840547, -2.39633, 0.5176471, 1, 0, 1,
-0.6319286, 1.609707, -2.205228, 0.5137255, 1, 0, 1,
-0.6310092, -0.5744213, -2.843728, 0.5058824, 1, 0, 1,
-0.6276183, 0.01752671, -1.959283, 0.5019608, 1, 0, 1,
-0.6252342, 0.808383, -0.8675451, 0.4941176, 1, 0, 1,
-0.6215527, 0.9961093, 0.8131782, 0.4862745, 1, 0, 1,
-0.6206992, 0.9518999, -0.5761269, 0.4823529, 1, 0, 1,
-0.6206861, 0.3318712, 0.7731532, 0.4745098, 1, 0, 1,
-0.6191143, -0.841301, -1.764521, 0.4705882, 1, 0, 1,
-0.612356, -0.3116833, -2.129378, 0.4627451, 1, 0, 1,
-0.6105577, 0.8279799, 0.5000101, 0.4588235, 1, 0, 1,
-0.6101878, 0.9548742, -0.3550203, 0.4509804, 1, 0, 1,
-0.6084527, -1.037007, -2.013442, 0.4470588, 1, 0, 1,
-0.6082461, -0.4795653, -1.787874, 0.4392157, 1, 0, 1,
-0.6061257, 1.1058, -0.6468659, 0.4352941, 1, 0, 1,
-0.6008954, -1.92857, -3.577246, 0.427451, 1, 0, 1,
-0.598965, -0.7077981, -0.4599964, 0.4235294, 1, 0, 1,
-0.5984824, 0.04093157, -0.9887263, 0.4156863, 1, 0, 1,
-0.5965557, -1.248924, -2.27441, 0.4117647, 1, 0, 1,
-0.595171, -1.210747, -2.552566, 0.4039216, 1, 0, 1,
-0.5951, -0.2945802, -1.322654, 0.3960784, 1, 0, 1,
-0.5898931, 1.99582, -0.1062651, 0.3921569, 1, 0, 1,
-0.5870984, 0.3251339, -0.4039584, 0.3843137, 1, 0, 1,
-0.5815144, 1.714906, -2.015722, 0.3803922, 1, 0, 1,
-0.578777, -1.378192, -3.144913, 0.372549, 1, 0, 1,
-0.5779616, 1.210315, -0.1420634, 0.3686275, 1, 0, 1,
-0.5748428, -0.08997495, -2.335371, 0.3607843, 1, 0, 1,
-0.5692652, -0.7937278, -2.536266, 0.3568628, 1, 0, 1,
-0.5678593, -1.658062, -3.209485, 0.3490196, 1, 0, 1,
-0.5662481, 0.9248258, 0.7959995, 0.345098, 1, 0, 1,
-0.5642993, -0.664469, -2.04773, 0.3372549, 1, 0, 1,
-0.5602688, 0.4560559, 0.1776038, 0.3333333, 1, 0, 1,
-0.5571013, 0.8029491, 0.7610832, 0.3254902, 1, 0, 1,
-0.5560637, -1.497347, -1.952211, 0.3215686, 1, 0, 1,
-0.5557947, 1.102547, -0.3761291, 0.3137255, 1, 0, 1,
-0.5544868, 0.1656979, -1.804666, 0.3098039, 1, 0, 1,
-0.5483098, 0.9832855, 0.6575589, 0.3019608, 1, 0, 1,
-0.5432084, 1.542633, -2.100223, 0.2941177, 1, 0, 1,
-0.5386837, -0.4305075, -4.297665, 0.2901961, 1, 0, 1,
-0.5374541, -0.3636002, -1.405285, 0.282353, 1, 0, 1,
-0.5351183, -0.07764599, -0.8740751, 0.2784314, 1, 0, 1,
-0.5308635, 0.5975175, -1.805048, 0.2705882, 1, 0, 1,
-0.5276243, 0.5810352, -0.1444418, 0.2666667, 1, 0, 1,
-0.5274859, -0.8108035, -1.370603, 0.2588235, 1, 0, 1,
-0.5245063, 2.107786, -1.133247, 0.254902, 1, 0, 1,
-0.5243887, -1.38661, -1.695873, 0.2470588, 1, 0, 1,
-0.5241887, 0.8173038, -0.5011374, 0.2431373, 1, 0, 1,
-0.5240621, 1.340053, 2.258962, 0.2352941, 1, 0, 1,
-0.5237722, 1.214836, -0.7511914, 0.2313726, 1, 0, 1,
-0.5112157, 1.449604, -1.192075, 0.2235294, 1, 0, 1,
-0.5062709, 0.6592695, -0.6699997, 0.2196078, 1, 0, 1,
-0.5047518, -0.7741138, -2.453925, 0.2117647, 1, 0, 1,
-0.5016305, -0.3764535, -2.640549, 0.2078431, 1, 0, 1,
-0.5006788, 1.128829, 1.619957, 0.2, 1, 0, 1,
-0.4976, -0.3731374, -2.095705, 0.1921569, 1, 0, 1,
-0.4941413, -0.3682508, -2.024666, 0.1882353, 1, 0, 1,
-0.4857493, 1.020193, 0.4982681, 0.1803922, 1, 0, 1,
-0.4840669, 0.1238403, -2.539447, 0.1764706, 1, 0, 1,
-0.4828976, -0.202352, -3.261684, 0.1686275, 1, 0, 1,
-0.4812787, 0.4508653, -1.909462, 0.1647059, 1, 0, 1,
-0.4791713, -1.042459, -2.922441, 0.1568628, 1, 0, 1,
-0.4774903, -0.2904486, -2.586623, 0.1529412, 1, 0, 1,
-0.4715828, 1.105068, -1.046089, 0.145098, 1, 0, 1,
-0.4691779, -0.2921287, -1.455465, 0.1411765, 1, 0, 1,
-0.4687187, 0.5927351, -0.02769863, 0.1333333, 1, 0, 1,
-0.4669513, 1.65733, -0.7249278, 0.1294118, 1, 0, 1,
-0.4668387, 1.024103, -1.764081, 0.1215686, 1, 0, 1,
-0.4667361, 1.134015, 0.7274515, 0.1176471, 1, 0, 1,
-0.4664524, -0.7014377, -2.314598, 0.1098039, 1, 0, 1,
-0.4657932, -0.5459595, -2.231097, 0.1058824, 1, 0, 1,
-0.4557027, 0.5242594, -1.858529, 0.09803922, 1, 0, 1,
-0.4525009, -1.356465, -4.52076, 0.09019608, 1, 0, 1,
-0.4407531, 0.7241895, 0.2869185, 0.08627451, 1, 0, 1,
-0.4387108, -0.2623491, -2.591055, 0.07843138, 1, 0, 1,
-0.4348198, 0.4947649, -1.242021, 0.07450981, 1, 0, 1,
-0.4346665, 0.5452149, 0.8924051, 0.06666667, 1, 0, 1,
-0.4319544, -0.3202487, -1.551483, 0.0627451, 1, 0, 1,
-0.4298299, 0.5478349, 0.0646796, 0.05490196, 1, 0, 1,
-0.4293451, -0.1862262, -1.646042, 0.05098039, 1, 0, 1,
-0.4262312, 0.7070056, -0.2204874, 0.04313726, 1, 0, 1,
-0.4260148, 1.695816, -1.747918, 0.03921569, 1, 0, 1,
-0.4193585, 0.5339961, -1.277778, 0.03137255, 1, 0, 1,
-0.4151666, -1.140951, -2.142388, 0.02745098, 1, 0, 1,
-0.4151005, 0.9971694, 1.130887, 0.01960784, 1, 0, 1,
-0.4128025, -1.981364, -3.308385, 0.01568628, 1, 0, 1,
-0.4109274, -0.02882652, -4.380999, 0.007843138, 1, 0, 1,
-0.4104513, 1.442882, -0.4486931, 0.003921569, 1, 0, 1,
-0.408294, -1.290418, -2.814868, 0, 1, 0.003921569, 1,
-0.4082395, -1.783766, -2.570219, 0, 1, 0.01176471, 1,
-0.4048348, -1.158564, -1.779338, 0, 1, 0.01568628, 1,
-0.4026172, -0.5963606, -2.826842, 0, 1, 0.02352941, 1,
-0.4018739, -0.7010339, -3.035865, 0, 1, 0.02745098, 1,
-0.3995163, -0.7500387, -1.853232, 0, 1, 0.03529412, 1,
-0.3954894, 1.241128, 0.07483622, 0, 1, 0.03921569, 1,
-0.3954863, 0.1060906, -1.028133, 0, 1, 0.04705882, 1,
-0.3919528, -1.038721, -2.959902, 0, 1, 0.05098039, 1,
-0.3916762, -0.018893, -2.072607, 0, 1, 0.05882353, 1,
-0.3893819, -1.173897, -2.153404, 0, 1, 0.0627451, 1,
-0.3848355, -0.3173839, -2.686914, 0, 1, 0.07058824, 1,
-0.3767613, 0.1863162, -0.5664646, 0, 1, 0.07450981, 1,
-0.3740511, -0.7044125, -1.071094, 0, 1, 0.08235294, 1,
-0.373345, -1.990047, -3.297152, 0, 1, 0.08627451, 1,
-0.3685651, -0.2457271, -3.263947, 0, 1, 0.09411765, 1,
-0.3657067, -0.193291, -4.20684, 0, 1, 0.1019608, 1,
-0.3630719, -0.4796861, -1.543003, 0, 1, 0.1058824, 1,
-0.3556944, -1.030016, -2.259933, 0, 1, 0.1137255, 1,
-0.3543155, 0.8471281, -1.242643, 0, 1, 0.1176471, 1,
-0.3504876, -0.02435732, -2.698549, 0, 1, 0.1254902, 1,
-0.3503774, -0.83226, -1.905741, 0, 1, 0.1294118, 1,
-0.3499162, 1.942525, -2.106845, 0, 1, 0.1372549, 1,
-0.3481058, 1.543473, -0.6248009, 0, 1, 0.1411765, 1,
-0.346462, -0.225988, -2.95909, 0, 1, 0.1490196, 1,
-0.3452016, 1.537054, -0.109112, 0, 1, 0.1529412, 1,
-0.3424008, -0.938197, -1.259826, 0, 1, 0.1607843, 1,
-0.3396263, -1.534681, -1.549714, 0, 1, 0.1647059, 1,
-0.3394065, -0.6800527, -2.465068, 0, 1, 0.172549, 1,
-0.3317688, 0.2911542, 0.4624971, 0, 1, 0.1764706, 1,
-0.3302444, -0.758207, -4.331337, 0, 1, 0.1843137, 1,
-0.3274651, -1.180131, -2.264005, 0, 1, 0.1882353, 1,
-0.3208659, 1.645794, -0.7968515, 0, 1, 0.1960784, 1,
-0.3206827, 0.7267725, 1.543528, 0, 1, 0.2039216, 1,
-0.3205403, 0.1030386, -1.116026, 0, 1, 0.2078431, 1,
-0.3174021, 0.3247567, -1.630066, 0, 1, 0.2156863, 1,
-0.3170205, 0.5215144, -1.589835, 0, 1, 0.2196078, 1,
-0.3155707, 2.306671, -0.253251, 0, 1, 0.227451, 1,
-0.3083594, 1.173278, 0.3004925, 0, 1, 0.2313726, 1,
-0.3058729, -0.05218355, -1.375587, 0, 1, 0.2392157, 1,
-0.2969284, -2.300997, -1.787584, 0, 1, 0.2431373, 1,
-0.2805373, 0.5540016, 0.4704469, 0, 1, 0.2509804, 1,
-0.2740334, 0.1772209, -0.5276906, 0, 1, 0.254902, 1,
-0.2733695, -0.3098635, -2.33516, 0, 1, 0.2627451, 1,
-0.2725842, 1.213022, -0.2853306, 0, 1, 0.2666667, 1,
-0.2706127, 0.03967385, -0.1639999, 0, 1, 0.2745098, 1,
-0.2702194, -0.6420394, -4.046093, 0, 1, 0.2784314, 1,
-0.2698369, -1.087179, -2.986245, 0, 1, 0.2862745, 1,
-0.2692231, -0.953131, -3.143008, 0, 1, 0.2901961, 1,
-0.269093, -0.3676247, -1.53049, 0, 1, 0.2980392, 1,
-0.2666437, 0.04421945, 0.3364758, 0, 1, 0.3058824, 1,
-0.2599554, 1.830437, 0.1489923, 0, 1, 0.3098039, 1,
-0.2590882, 0.1031845, 0.3526704, 0, 1, 0.3176471, 1,
-0.2590803, -0.6050223, -3.395208, 0, 1, 0.3215686, 1,
-0.2578124, 1.110088, -1.223949, 0, 1, 0.3294118, 1,
-0.2548424, -0.2925584, -2.073786, 0, 1, 0.3333333, 1,
-0.2545131, -0.841392, -2.502538, 0, 1, 0.3411765, 1,
-0.2525001, 0.4827127, -0.6982231, 0, 1, 0.345098, 1,
-0.2487723, -0.05373764, -2.587671, 0, 1, 0.3529412, 1,
-0.2463322, 0.5122815, 0.5933701, 0, 1, 0.3568628, 1,
-0.2454134, -0.706746, -2.887096, 0, 1, 0.3647059, 1,
-0.2437907, -1.151037, -3.929659, 0, 1, 0.3686275, 1,
-0.2389005, 1.015539, -0.5369621, 0, 1, 0.3764706, 1,
-0.2364919, -0.6113861, -3.685225, 0, 1, 0.3803922, 1,
-0.233461, -0.2940042, -1.821607, 0, 1, 0.3882353, 1,
-0.2312881, 0.1681522, -1.233718, 0, 1, 0.3921569, 1,
-0.22609, -0.2547461, -4.902909, 0, 1, 0.4, 1,
-0.2250094, 0.2158354, 0.6436876, 0, 1, 0.4078431, 1,
-0.2199942, 0.5240676, -0.3737067, 0, 1, 0.4117647, 1,
-0.219642, 1.058765, -0.1484048, 0, 1, 0.4196078, 1,
-0.2177542, 0.4096752, -1.023374, 0, 1, 0.4235294, 1,
-0.216525, -1.097879, -2.371472, 0, 1, 0.4313726, 1,
-0.2138696, 0.02526769, -1.310922, 0, 1, 0.4352941, 1,
-0.2128724, 0.8051305, 1.027279, 0, 1, 0.4431373, 1,
-0.2094143, -0.5455918, -3.014838, 0, 1, 0.4470588, 1,
-0.1983998, 0.8734165, 1.11578, 0, 1, 0.454902, 1,
-0.1983301, -0.5002692, -1.544922, 0, 1, 0.4588235, 1,
-0.1962822, 0.4528076, 0.532968, 0, 1, 0.4666667, 1,
-0.1961909, -1.731686, -3.389811, 0, 1, 0.4705882, 1,
-0.1921708, -0.9996507, -3.792895, 0, 1, 0.4784314, 1,
-0.1913492, 1.23288, -0.8813852, 0, 1, 0.4823529, 1,
-0.1880036, 0.1508032, -2.131739, 0, 1, 0.4901961, 1,
-0.1870096, 1.323506, 1.002659, 0, 1, 0.4941176, 1,
-0.1867477, 0.4321291, 0.6626498, 0, 1, 0.5019608, 1,
-0.1807662, -0.114359, -1.704524, 0, 1, 0.509804, 1,
-0.1780749, 0.08790833, -1.114731, 0, 1, 0.5137255, 1,
-0.176781, 0.3409609, 0.6964511, 0, 1, 0.5215687, 1,
-0.171181, -0.9302502, -2.101765, 0, 1, 0.5254902, 1,
-0.1696239, -0.5940976, -2.500463, 0, 1, 0.5333334, 1,
-0.1692926, 0.7347408, 0.6530005, 0, 1, 0.5372549, 1,
-0.1677424, -1.305285, -3.288892, 0, 1, 0.5450981, 1,
-0.1660783, 0.7947279, -3.362911, 0, 1, 0.5490196, 1,
-0.1634622, -0.0559379, -2.61704, 0, 1, 0.5568628, 1,
-0.1630736, -0.03705956, -1.871385, 0, 1, 0.5607843, 1,
-0.1603304, -0.4075319, -2.278951, 0, 1, 0.5686275, 1,
-0.1591928, 0.2292321, 0.5172094, 0, 1, 0.572549, 1,
-0.1589177, 0.2236104, 1.398904, 0, 1, 0.5803922, 1,
-0.1587792, -0.82538, -1.415426, 0, 1, 0.5843138, 1,
-0.148332, -0.1566199, -1.952679, 0, 1, 0.5921569, 1,
-0.1326244, -0.8230172, -5.266631, 0, 1, 0.5960785, 1,
-0.1318265, -0.09627605, -1.177484, 0, 1, 0.6039216, 1,
-0.1298557, -2.461667, -4.704247, 0, 1, 0.6117647, 1,
-0.1221785, -0.9132877, -3.331013, 0, 1, 0.6156863, 1,
-0.1214535, 0.06682576, -1.572202, 0, 1, 0.6235294, 1,
-0.120993, 0.4846813, -0.4566863, 0, 1, 0.627451, 1,
-0.1209896, -0.6943229, -2.737447, 0, 1, 0.6352941, 1,
-0.1179102, -0.1813218, -3.453049, 0, 1, 0.6392157, 1,
-0.1174773, 2.975395, -1.336741, 0, 1, 0.6470588, 1,
-0.1163803, -0.6171961, -5.543098, 0, 1, 0.6509804, 1,
-0.1146538, -0.9970005, -2.39866, 0, 1, 0.6588235, 1,
-0.1136131, 0.8141136, -1.361265, 0, 1, 0.6627451, 1,
-0.107494, 0.6268291, 1.443988, 0, 1, 0.6705883, 1,
-0.1034799, -1.460061, -4.914621, 0, 1, 0.6745098, 1,
-0.09748597, -1.056606, -3.847011, 0, 1, 0.682353, 1,
-0.09739749, -0.9336007, -3.57319, 0, 1, 0.6862745, 1,
-0.09563483, 0.2709492, 0.444312, 0, 1, 0.6941177, 1,
-0.09561666, 0.7309884, -1.190441, 0, 1, 0.7019608, 1,
-0.09519692, -0.06954126, -2.355382, 0, 1, 0.7058824, 1,
-0.09506826, -0.534914, -2.348949, 0, 1, 0.7137255, 1,
-0.09335609, 0.9303526, -0.1459722, 0, 1, 0.7176471, 1,
-0.09272701, 0.1920207, 0.5458261, 0, 1, 0.7254902, 1,
-0.0925867, -0.07809029, -1.442768, 0, 1, 0.7294118, 1,
-0.08818672, 2.516814, 0.9114391, 0, 1, 0.7372549, 1,
-0.08505427, -1.130319, -1.799303, 0, 1, 0.7411765, 1,
-0.08383642, 2.028592, 0.7288215, 0, 1, 0.7490196, 1,
-0.08091713, -0.6499152, -3.745291, 0, 1, 0.7529412, 1,
-0.08005058, -0.6898878, -1.648008, 0, 1, 0.7607843, 1,
-0.07874304, 1.626001, 0.2217463, 0, 1, 0.7647059, 1,
-0.07428877, -1.259715, -4.233921, 0, 1, 0.772549, 1,
-0.07232901, -0.451988, -2.317363, 0, 1, 0.7764706, 1,
-0.06983081, 0.1114901, -0.9821068, 0, 1, 0.7843137, 1,
-0.06583424, -1.621427, -3.053628, 0, 1, 0.7882353, 1,
-0.06338409, 0.2822443, -1.175128, 0, 1, 0.7960784, 1,
-0.05964195, -0.7594048, -2.026365, 0, 1, 0.8039216, 1,
-0.05682678, -0.1415518, -2.765486, 0, 1, 0.8078431, 1,
-0.05619157, 0.4375776, -0.2642183, 0, 1, 0.8156863, 1,
-0.05552574, -0.5138348, -1.808411, 0, 1, 0.8196079, 1,
-0.05539337, -1.253588, -4.115031, 0, 1, 0.827451, 1,
-0.0543616, -0.1815517, -3.305092, 0, 1, 0.8313726, 1,
-0.04952956, -1.292904, -1.978951, 0, 1, 0.8392157, 1,
-0.04895861, -0.8378618, -4.135981, 0, 1, 0.8431373, 1,
-0.04817032, 2.165031, 0.4620943, 0, 1, 0.8509804, 1,
-0.04191247, 0.2570327, -0.1366215, 0, 1, 0.854902, 1,
-0.02872784, -0.5993598, -1.900307, 0, 1, 0.8627451, 1,
-0.02216868, -2.207887, -4.089222, 0, 1, 0.8666667, 1,
-0.02159289, -0.9670987, -0.8953617, 0, 1, 0.8745098, 1,
-0.02065155, -1.160587, -2.28927, 0, 1, 0.8784314, 1,
-0.01756185, 1.030789, -0.7094965, 0, 1, 0.8862745, 1,
-0.01009482, 0.3773909, -0.07990055, 0, 1, 0.8901961, 1,
-0.009511556, 0.07768236, 1.443031, 0, 1, 0.8980392, 1,
-0.008504729, -0.4517417, -2.202453, 0, 1, 0.9058824, 1,
-0.001212574, 1.590344, 1.285304, 0, 1, 0.9098039, 1,
0.00209152, -0.3857579, 2.379651, 0, 1, 0.9176471, 1,
0.004303401, -0.5660071, 3.71694, 0, 1, 0.9215686, 1,
0.004677163, 1.738243, 0.4688023, 0, 1, 0.9294118, 1,
0.009102804, -0.5981028, 3.590399, 0, 1, 0.9333333, 1,
0.01279609, -0.455451, 3.629735, 0, 1, 0.9411765, 1,
0.01354656, 1.145327, 0.5565407, 0, 1, 0.945098, 1,
0.01881932, -1.177367, 4.859015, 0, 1, 0.9529412, 1,
0.02181558, 0.04522714, 1.66047, 0, 1, 0.9568627, 1,
0.02264268, 0.4817238, -0.27546, 0, 1, 0.9647059, 1,
0.02317817, 1.161933, -1.003, 0, 1, 0.9686275, 1,
0.02392952, 1.076275, -0.8370426, 0, 1, 0.9764706, 1,
0.02503393, 0.5082051, -0.5929107, 0, 1, 0.9803922, 1,
0.0298259, -0.5698528, 2.636388, 0, 1, 0.9882353, 1,
0.03663024, 0.4837642, 0.1524878, 0, 1, 0.9921569, 1,
0.03787321, -0.830667, 2.533295, 0, 1, 1, 1,
0.03829747, 1.411578, 0.8530756, 0, 0.9921569, 1, 1,
0.03908585, 0.2338802, 0.3822166, 0, 0.9882353, 1, 1,
0.05644395, -1.620147, 4.15332, 0, 0.9803922, 1, 1,
0.05651423, 0.383523, 0.01209794, 0, 0.9764706, 1, 1,
0.06302879, -0.4227995, 2.467141, 0, 0.9686275, 1, 1,
0.06525621, -0.6544136, 3.604946, 0, 0.9647059, 1, 1,
0.06654236, -1.237173, 2.848448, 0, 0.9568627, 1, 1,
0.07087576, -0.2099476, 1.75081, 0, 0.9529412, 1, 1,
0.07142442, -0.4844945, 3.890379, 0, 0.945098, 1, 1,
0.07278809, -0.2032733, 3.465225, 0, 0.9411765, 1, 1,
0.09239936, 0.361903, 0.59487, 0, 0.9333333, 1, 1,
0.09248728, -1.091624, 3.161818, 0, 0.9294118, 1, 1,
0.09382319, -0.2914867, 3.590209, 0, 0.9215686, 1, 1,
0.09512716, -0.4204343, 3.627099, 0, 0.9176471, 1, 1,
0.09568767, 0.1680864, 0.9007696, 0, 0.9098039, 1, 1,
0.09706599, 0.1344904, 1.242884, 0, 0.9058824, 1, 1,
0.09948976, -0.2062817, 2.411038, 0, 0.8980392, 1, 1,
0.1036859, 0.8488929, 1.143791, 0, 0.8901961, 1, 1,
0.1061626, -0.5649878, 4.568994, 0, 0.8862745, 1, 1,
0.1089455, 0.9298685, 1.084855, 0, 0.8784314, 1, 1,
0.1180488, -0.9474689, 3.455479, 0, 0.8745098, 1, 1,
0.1195778, 1.309504, 3.702429, 0, 0.8666667, 1, 1,
0.124124, -0.7099036, 2.230934, 0, 0.8627451, 1, 1,
0.126222, 0.2836314, 0.006659129, 0, 0.854902, 1, 1,
0.1292382, -0.5650988, 2.062, 0, 0.8509804, 1, 1,
0.1299754, 0.1893849, 1.464221, 0, 0.8431373, 1, 1,
0.1313553, 0.7592176, -0.6531755, 0, 0.8392157, 1, 1,
0.1318175, 1.356332, 0.4210025, 0, 0.8313726, 1, 1,
0.1323528, 0.3251737, 1.005846, 0, 0.827451, 1, 1,
0.1337165, -0.95792, 1.836119, 0, 0.8196079, 1, 1,
0.1347684, -0.591124, 2.843757, 0, 0.8156863, 1, 1,
0.1358036, -1.341067, 2.929698, 0, 0.8078431, 1, 1,
0.1364522, -0.5006163, 2.511865, 0, 0.8039216, 1, 1,
0.142412, -1.290923, 4.507149, 0, 0.7960784, 1, 1,
0.1449667, -0.889632, 2.051462, 0, 0.7882353, 1, 1,
0.1454459, 0.1326722, 1.185265, 0, 0.7843137, 1, 1,
0.1474611, -0.2052836, 1.702768, 0, 0.7764706, 1, 1,
0.1485728, 0.2816534, 0.5159613, 0, 0.772549, 1, 1,
0.1511761, 0.3505874, 1.178164, 0, 0.7647059, 1, 1,
0.1530321, 1.110125, 1.956969, 0, 0.7607843, 1, 1,
0.1613347, -0.04100913, -0.001668309, 0, 0.7529412, 1, 1,
0.1624733, -0.1325383, 2.605711, 0, 0.7490196, 1, 1,
0.1680425, -1.344301, 4.937726, 0, 0.7411765, 1, 1,
0.1686074, -1.029695, 2.146941, 0, 0.7372549, 1, 1,
0.1701496, 2.42337, 0.5320417, 0, 0.7294118, 1, 1,
0.1712916, 1.826397, -1.283596, 0, 0.7254902, 1, 1,
0.1724631, -0.8192081, 3.430726, 0, 0.7176471, 1, 1,
0.1743343, -0.1184483, 2.871288, 0, 0.7137255, 1, 1,
0.1748706, 1.107881, 0.5300396, 0, 0.7058824, 1, 1,
0.1757486, 1.286899, 1.82226, 0, 0.6980392, 1, 1,
0.1762162, 1.008194, 0.8564523, 0, 0.6941177, 1, 1,
0.1763091, -0.2531554, 1.756017, 0, 0.6862745, 1, 1,
0.1798404, 3.342196, 0.3033696, 0, 0.682353, 1, 1,
0.1908004, 1.06431, 0.940059, 0, 0.6745098, 1, 1,
0.1908029, 0.6431283, 0.9879326, 0, 0.6705883, 1, 1,
0.1930526, 1.676625, 0.193552, 0, 0.6627451, 1, 1,
0.1958514, -0.2836493, 2.561042, 0, 0.6588235, 1, 1,
0.1978784, 0.1196766, -0.1361933, 0, 0.6509804, 1, 1,
0.1982299, 0.08942237, 2.774944, 0, 0.6470588, 1, 1,
0.2012423, -1.783978, 1.79747, 0, 0.6392157, 1, 1,
0.2027658, 1.448532, -0.04050963, 0, 0.6352941, 1, 1,
0.2083072, 0.8386067, 0.6179457, 0, 0.627451, 1, 1,
0.2105393, 0.5957385, -0.03878323, 0, 0.6235294, 1, 1,
0.2117749, 1.339862, 0.0556116, 0, 0.6156863, 1, 1,
0.2160523, -0.1641602, 2.80092, 0, 0.6117647, 1, 1,
0.2178288, 1.255223, 0.07854192, 0, 0.6039216, 1, 1,
0.2189377, -0.5404932, 3.296475, 0, 0.5960785, 1, 1,
0.2209817, -1.028716, 4.51266, 0, 0.5921569, 1, 1,
0.2226489, -1.07878, 2.329193, 0, 0.5843138, 1, 1,
0.2313779, 0.1423711, 0.7184896, 0, 0.5803922, 1, 1,
0.2334288, -0.7472586, 3.386038, 0, 0.572549, 1, 1,
0.2361304, 1.101561, -0.008282837, 0, 0.5686275, 1, 1,
0.2372793, -0.0506535, 2.764965, 0, 0.5607843, 1, 1,
0.2374231, 0.950344, -0.0004941227, 0, 0.5568628, 1, 1,
0.241126, -2.104842, 3.422537, 0, 0.5490196, 1, 1,
0.242257, -0.2957603, 2.697658, 0, 0.5450981, 1, 1,
0.2468203, 0.03238873, 0.9483215, 0, 0.5372549, 1, 1,
0.246841, 0.167873, -0.8267035, 0, 0.5333334, 1, 1,
0.2479194, 0.2250733, 0.4171489, 0, 0.5254902, 1, 1,
0.2505857, 1.422347, 0.2892458, 0, 0.5215687, 1, 1,
0.2591628, 0.4052593, 0.07252166, 0, 0.5137255, 1, 1,
0.2612869, -1.187429, 2.458827, 0, 0.509804, 1, 1,
0.2636475, -0.6105459, 2.434375, 0, 0.5019608, 1, 1,
0.2643801, 0.2355583, 0.3241624, 0, 0.4941176, 1, 1,
0.2664816, -1.629071, 2.683833, 0, 0.4901961, 1, 1,
0.2666621, -1.314124, 2.483312, 0, 0.4823529, 1, 1,
0.2673934, 0.5202316, 0.1128848, 0, 0.4784314, 1, 1,
0.2686252, 1.509701, -0.5194718, 0, 0.4705882, 1, 1,
0.2693426, -0.07197586, -0.5898976, 0, 0.4666667, 1, 1,
0.269586, -0.6645691, 3.592828, 0, 0.4588235, 1, 1,
0.2707204, 0.6603864, 1.861015, 0, 0.454902, 1, 1,
0.2766051, -0.9684566, 3.692878, 0, 0.4470588, 1, 1,
0.2778555, 0.6114688, 1.30474, 0, 0.4431373, 1, 1,
0.2779538, -0.3364429, 2.318605, 0, 0.4352941, 1, 1,
0.2805611, -0.6685659, 1.016858, 0, 0.4313726, 1, 1,
0.2854939, 0.261454, 0.02046634, 0, 0.4235294, 1, 1,
0.2865563, 0.9283733, -1.391264, 0, 0.4196078, 1, 1,
0.2931736, -1.405072, 3.588239, 0, 0.4117647, 1, 1,
0.295308, 0.349219, 2.550891, 0, 0.4078431, 1, 1,
0.2981771, -0.3217666, 1.004873, 0, 0.4, 1, 1,
0.2984989, 0.4676498, 1.180923, 0, 0.3921569, 1, 1,
0.305371, 0.2355966, -0.1104113, 0, 0.3882353, 1, 1,
0.3056617, -0.4487844, 1.262479, 0, 0.3803922, 1, 1,
0.3083514, 2.570873, 0.5126436, 0, 0.3764706, 1, 1,
0.3086463, 0.2615746, 0.8523352, 0, 0.3686275, 1, 1,
0.3096092, 0.09908996, 2.230357, 0, 0.3647059, 1, 1,
0.3106666, 1.618656, 0.3542487, 0, 0.3568628, 1, 1,
0.3108657, 0.1243497, -1.288172, 0, 0.3529412, 1, 1,
0.3110986, 1.283072, 0.5471224, 0, 0.345098, 1, 1,
0.3169414, 0.4379275, 0.8650478, 0, 0.3411765, 1, 1,
0.317711, 0.009674208, 2.104742, 0, 0.3333333, 1, 1,
0.3231301, 0.4150321, 0.02177856, 0, 0.3294118, 1, 1,
0.3315596, 0.5777194, 0.2845066, 0, 0.3215686, 1, 1,
0.3316728, 0.682288, 0.9899476, 0, 0.3176471, 1, 1,
0.3325289, -1.655509, 4.294866, 0, 0.3098039, 1, 1,
0.3325645, 0.860234, 0.9815446, 0, 0.3058824, 1, 1,
0.3331854, -0.7780164, 3.877096, 0, 0.2980392, 1, 1,
0.3368183, -0.4074809, 1.689618, 0, 0.2901961, 1, 1,
0.3429859, 0.1726526, 0.3277445, 0, 0.2862745, 1, 1,
0.3485228, 0.7283674, -0.5354013, 0, 0.2784314, 1, 1,
0.3487324, 1.698896, 0.3259885, 0, 0.2745098, 1, 1,
0.3515747, -0.7734386, 3.220956, 0, 0.2666667, 1, 1,
0.3536424, 0.5169584, 0.5827492, 0, 0.2627451, 1, 1,
0.3576589, 0.7017105, 0.201609, 0, 0.254902, 1, 1,
0.3607118, -1.116081, 4.387021, 0, 0.2509804, 1, 1,
0.3619848, -0.2818076, 1.467534, 0, 0.2431373, 1, 1,
0.3655374, -0.6656607, 1.561067, 0, 0.2392157, 1, 1,
0.3691095, -1.027875, 4.069818, 0, 0.2313726, 1, 1,
0.3696347, 2.957062, -0.4560075, 0, 0.227451, 1, 1,
0.3703655, -0.1661681, 2.919655, 0, 0.2196078, 1, 1,
0.3707426, 0.09241967, 0.0588767, 0, 0.2156863, 1, 1,
0.3724983, -1.28022, 2.570538, 0, 0.2078431, 1, 1,
0.3760209, -0.4065855, 0.6625817, 0, 0.2039216, 1, 1,
0.3772425, 0.1325924, 0.04159836, 0, 0.1960784, 1, 1,
0.3778833, 0.3753792, 0.9612358, 0, 0.1882353, 1, 1,
0.3815405, 0.2627139, 2.40811, 0, 0.1843137, 1, 1,
0.3875196, 0.7902622, 0.1552708, 0, 0.1764706, 1, 1,
0.3888375, 0.6979828, 0.05536725, 0, 0.172549, 1, 1,
0.3893517, -0.458902, 2.820709, 0, 0.1647059, 1, 1,
0.3959901, -1.001529, 3.64782, 0, 0.1607843, 1, 1,
0.3966559, 0.08002856, 0.6053774, 0, 0.1529412, 1, 1,
0.3978825, -0.6278732, 2.751156, 0, 0.1490196, 1, 1,
0.4060427, -0.2015607, 1.888796, 0, 0.1411765, 1, 1,
0.4140304, 0.9409203, 0.201048, 0, 0.1372549, 1, 1,
0.4154527, 1.008164, -0.8233953, 0, 0.1294118, 1, 1,
0.4181626, 1.856024, -0.3952349, 0, 0.1254902, 1, 1,
0.4201035, -1.989841, 3.381855, 0, 0.1176471, 1, 1,
0.4206133, 2.357174, -0.2871656, 0, 0.1137255, 1, 1,
0.4217413, 1.047627, 0.2821822, 0, 0.1058824, 1, 1,
0.4218851, -0.09890179, 2.056162, 0, 0.09803922, 1, 1,
0.4223338, -0.8318513, 2.720443, 0, 0.09411765, 1, 1,
0.4248405, 0.5458115, 1.090714, 0, 0.08627451, 1, 1,
0.4333312, -1.278901, 3.941594, 0, 0.08235294, 1, 1,
0.4341641, -0.04370484, 3.235758, 0, 0.07450981, 1, 1,
0.4360068, 1.141332, 0.3087983, 0, 0.07058824, 1, 1,
0.443788, -0.08104259, 1.769311, 0, 0.0627451, 1, 1,
0.4443978, -0.6487173, 2.764172, 0, 0.05882353, 1, 1,
0.4519919, -1.471291, 1.251166, 0, 0.05098039, 1, 1,
0.4523698, 0.7746802, 1.742634, 0, 0.04705882, 1, 1,
0.455657, 0.1640681, 1.484895, 0, 0.03921569, 1, 1,
0.4561259, 0.5228524, 0.2407008, 0, 0.03529412, 1, 1,
0.462279, -1.169321, 1.599913, 0, 0.02745098, 1, 1,
0.4626914, 1.853233, 1.011339, 0, 0.02352941, 1, 1,
0.4628651, -0.5685711, 2.1259, 0, 0.01568628, 1, 1,
0.4631499, 0.08937769, -0.1321313, 0, 0.01176471, 1, 1,
0.4664436, 0.6934196, 2.154617, 0, 0.003921569, 1, 1,
0.4673839, 0.09616955, 0.9052598, 0.003921569, 0, 1, 1,
0.4687876, -0.4982054, 1.177713, 0.007843138, 0, 1, 1,
0.4762994, 0.2941557, -0.4511018, 0.01568628, 0, 1, 1,
0.4767406, -1.550609, 4.573168, 0.01960784, 0, 1, 1,
0.4788209, 0.1857915, 0.8024852, 0.02745098, 0, 1, 1,
0.485628, -0.1496003, 2.796854, 0.03137255, 0, 1, 1,
0.4879387, 1.975139, 0.1637104, 0.03921569, 0, 1, 1,
0.4881137, -1.201297, 1.327537, 0.04313726, 0, 1, 1,
0.4888947, 0.01719311, 3.195614, 0.05098039, 0, 1, 1,
0.4904641, -0.5350654, 1.616582, 0.05490196, 0, 1, 1,
0.4906345, 1.743715, 0.9159435, 0.0627451, 0, 1, 1,
0.4950925, 0.1014835, 0.4080333, 0.06666667, 0, 1, 1,
0.5054003, 1.520061, 0.603125, 0.07450981, 0, 1, 1,
0.5076043, -0.8194495, 1.732834, 0.07843138, 0, 1, 1,
0.5083946, -2.012751, 1.325838, 0.08627451, 0, 1, 1,
0.5117974, 0.3014184, 2.054329, 0.09019608, 0, 1, 1,
0.5158298, 0.7154509, 0.9554142, 0.09803922, 0, 1, 1,
0.5166531, 0.2910748, 1.215311, 0.1058824, 0, 1, 1,
0.5221276, -0.1889929, 0.3589965, 0.1098039, 0, 1, 1,
0.5225312, 0.09929935, 0.9174523, 0.1176471, 0, 1, 1,
0.5236319, 1.316755, -0.07602645, 0.1215686, 0, 1, 1,
0.5312731, -0.8584694, 3.56034, 0.1294118, 0, 1, 1,
0.5330236, -2.815988, 3.379241, 0.1333333, 0, 1, 1,
0.5341142, -0.367312, 2.539868, 0.1411765, 0, 1, 1,
0.5363736, 0.2074573, 2.933462, 0.145098, 0, 1, 1,
0.5427512, -0.146105, -0.1012929, 0.1529412, 0, 1, 1,
0.542873, 0.897266, -0.01747008, 0.1568628, 0, 1, 1,
0.5443358, -1.909125, 2.497942, 0.1647059, 0, 1, 1,
0.5499539, -0.2725814, 1.920443, 0.1686275, 0, 1, 1,
0.5500785, 0.1440259, 2.617885, 0.1764706, 0, 1, 1,
0.5553508, -0.119809, 2.002961, 0.1803922, 0, 1, 1,
0.5716636, -2.430658, 4.087989, 0.1882353, 0, 1, 1,
0.5804017, 0.1803406, 2.087707, 0.1921569, 0, 1, 1,
0.5816966, -1.906607, 3.253613, 0.2, 0, 1, 1,
0.5845974, 0.06345246, 2.769347, 0.2078431, 0, 1, 1,
0.5873719, -0.3697712, 2.931952, 0.2117647, 0, 1, 1,
0.5935595, -0.7542146, 2.11414, 0.2196078, 0, 1, 1,
0.5957391, -1.307363, 3.376466, 0.2235294, 0, 1, 1,
0.5965661, 0.4618877, -1.028239, 0.2313726, 0, 1, 1,
0.5970162, 0.4034863, 1.539258, 0.2352941, 0, 1, 1,
0.6025236, 0.5482122, 0.6962331, 0.2431373, 0, 1, 1,
0.6026402, -0.2633599, 1.350509, 0.2470588, 0, 1, 1,
0.6066734, -0.6024969, 0.438852, 0.254902, 0, 1, 1,
0.6073011, 0.1044697, 1.487291, 0.2588235, 0, 1, 1,
0.6079853, 0.5878814, 1.666531, 0.2666667, 0, 1, 1,
0.6144915, 0.06814919, 1.400889, 0.2705882, 0, 1, 1,
0.6166935, 1.000127, 0.2074842, 0.2784314, 0, 1, 1,
0.6200499, -1.701727, 1.45806, 0.282353, 0, 1, 1,
0.6241856, -0.2463011, 1.752547, 0.2901961, 0, 1, 1,
0.6274267, 0.1221279, 1.240216, 0.2941177, 0, 1, 1,
0.6280861, -0.04278106, 1.111426, 0.3019608, 0, 1, 1,
0.6330834, -0.1879475, 1.622394, 0.3098039, 0, 1, 1,
0.6462139, 1.364933, 0.6551812, 0.3137255, 0, 1, 1,
0.6468639, -0.3469135, 3.228515, 0.3215686, 0, 1, 1,
0.6476592, -0.1255693, 0.7176715, 0.3254902, 0, 1, 1,
0.6477109, 1.120757, 1.210678, 0.3333333, 0, 1, 1,
0.6484461, 1.237754, 0.3869384, 0.3372549, 0, 1, 1,
0.6503308, 0.3491524, 2.759534, 0.345098, 0, 1, 1,
0.650692, 2.661962, 0.7700835, 0.3490196, 0, 1, 1,
0.6514303, 0.08638742, 0.7090554, 0.3568628, 0, 1, 1,
0.6562382, 1.135307, 1.255014, 0.3607843, 0, 1, 1,
0.6602404, -0.6556062, 3.460323, 0.3686275, 0, 1, 1,
0.6632435, -0.9564744, 2.191946, 0.372549, 0, 1, 1,
0.6642361, 0.3428596, 1.461346, 0.3803922, 0, 1, 1,
0.6676326, 0.2904347, 0.1660039, 0.3843137, 0, 1, 1,
0.6689017, -0.512971, 0.1779386, 0.3921569, 0, 1, 1,
0.6707211, -0.5180135, 4.097005, 0.3960784, 0, 1, 1,
0.6719338, 1.052968, 2.487553, 0.4039216, 0, 1, 1,
0.6784216, 1.186919, 0.2390575, 0.4117647, 0, 1, 1,
0.6814706, -0.7216689, 3.924097, 0.4156863, 0, 1, 1,
0.6824586, 0.522305, 0.535404, 0.4235294, 0, 1, 1,
0.6867955, -2.269667, 4.188681, 0.427451, 0, 1, 1,
0.6910486, -0.1585633, 1.532477, 0.4352941, 0, 1, 1,
0.6910558, -0.3021991, 0.8920113, 0.4392157, 0, 1, 1,
0.6922618, 1.139271, -0.1322266, 0.4470588, 0, 1, 1,
0.70124, 0.05461634, 2.692763, 0.4509804, 0, 1, 1,
0.7012506, 0.7682089, -0.0335505, 0.4588235, 0, 1, 1,
0.7049029, 0.6945747, 0.5703651, 0.4627451, 0, 1, 1,
0.7068915, -0.6931937, 2.649235, 0.4705882, 0, 1, 1,
0.7174999, -0.6369002, 2.179384, 0.4745098, 0, 1, 1,
0.7191532, 0.8322214, -2.142618, 0.4823529, 0, 1, 1,
0.7279853, -0.3314962, 1.232406, 0.4862745, 0, 1, 1,
0.7295438, 1.453436, 2.390516, 0.4941176, 0, 1, 1,
0.7302507, -0.3412808, 1.984334, 0.5019608, 0, 1, 1,
0.7365074, -0.6384539, 2.533023, 0.5058824, 0, 1, 1,
0.7368613, -1.507105, 0.7896601, 0.5137255, 0, 1, 1,
0.7395052, 1.053734, 0.7311693, 0.5176471, 0, 1, 1,
0.7399303, 0.3156188, 1.719984, 0.5254902, 0, 1, 1,
0.7466891, 1.254757, 0.7333462, 0.5294118, 0, 1, 1,
0.7469677, -1.641613, 2.071829, 0.5372549, 0, 1, 1,
0.7484546, 0.416178, 0.7604658, 0.5411765, 0, 1, 1,
0.7492678, -0.8594916, 2.204703, 0.5490196, 0, 1, 1,
0.7517191, -0.2929763, 2.326086, 0.5529412, 0, 1, 1,
0.7537647, -0.3696702, 1.344359, 0.5607843, 0, 1, 1,
0.7580721, 0.6876318, -0.3850088, 0.5647059, 0, 1, 1,
0.759288, 0.2361543, 1.793038, 0.572549, 0, 1, 1,
0.7649132, 0.1053007, 2.181647, 0.5764706, 0, 1, 1,
0.7671045, -0.2228467, 1.552158, 0.5843138, 0, 1, 1,
0.7676133, -1.896971, 4.246219, 0.5882353, 0, 1, 1,
0.7698595, 0.8408726, -0.02617804, 0.5960785, 0, 1, 1,
0.7727758, 0.248673, -0.729439, 0.6039216, 0, 1, 1,
0.7753482, 0.2053757, 2.029613, 0.6078432, 0, 1, 1,
0.7761732, -0.7192336, 3.106376, 0.6156863, 0, 1, 1,
0.7765862, -0.5412275, 2.428954, 0.6196079, 0, 1, 1,
0.7882591, -0.0835567, 1.889418, 0.627451, 0, 1, 1,
0.7914968, -1.136416, 2.497071, 0.6313726, 0, 1, 1,
0.7921875, -0.9171866, 2.778918, 0.6392157, 0, 1, 1,
0.7924972, 0.3788529, 0.9873807, 0.6431373, 0, 1, 1,
0.7925087, 1.047995, 1.660927, 0.6509804, 0, 1, 1,
0.7965026, 0.9370061, 2.275573, 0.654902, 0, 1, 1,
0.7973567, -0.07030149, 2.613451, 0.6627451, 0, 1, 1,
0.8015322, -0.175251, 2.243944, 0.6666667, 0, 1, 1,
0.8030137, -0.1311609, 1.981452, 0.6745098, 0, 1, 1,
0.8165565, -0.8286622, 2.30272, 0.6784314, 0, 1, 1,
0.8203699, 1.211, -0.5334426, 0.6862745, 0, 1, 1,
0.8244429, -0.7696226, 1.811015, 0.6901961, 0, 1, 1,
0.8251039, 2.460643, 0.8059756, 0.6980392, 0, 1, 1,
0.8280654, 0.6569205, -0.728964, 0.7058824, 0, 1, 1,
0.8305719, -0.8565654, 4.044674, 0.7098039, 0, 1, 1,
0.833451, -1.184972, 4.080832, 0.7176471, 0, 1, 1,
0.834972, 0.90619, -0.08781851, 0.7215686, 0, 1, 1,
0.8353957, 1.089584, 0.6346356, 0.7294118, 0, 1, 1,
0.8361518, -0.5374732, 1.906062, 0.7333333, 0, 1, 1,
0.8389858, -0.4346034, 2.397541, 0.7411765, 0, 1, 1,
0.8399703, -0.608928, 2.970266, 0.7450981, 0, 1, 1,
0.8401805, 1.281559, 0.05172499, 0.7529412, 0, 1, 1,
0.8438044, -1.34445, 2.043519, 0.7568628, 0, 1, 1,
0.8564251, 0.5279731, 3.411734, 0.7647059, 0, 1, 1,
0.8585825, -0.5507337, 1.701178, 0.7686275, 0, 1, 1,
0.8589609, -0.04991251, 1.727005, 0.7764706, 0, 1, 1,
0.862368, -1.050667, 3.119183, 0.7803922, 0, 1, 1,
0.8630852, -0.5888608, 3.672956, 0.7882353, 0, 1, 1,
0.8664663, -0.6670572, 2.442757, 0.7921569, 0, 1, 1,
0.8667424, -0.6604844, 2.500109, 0.8, 0, 1, 1,
0.8695669, 1.797166, 0.4824326, 0.8078431, 0, 1, 1,
0.8700082, 1.13125, -1.027588, 0.8117647, 0, 1, 1,
0.8735518, 0.5252095, 1.981488, 0.8196079, 0, 1, 1,
0.8743318, 1.981242, -0.001080226, 0.8235294, 0, 1, 1,
0.8847358, -0.2432578, 0.4949203, 0.8313726, 0, 1, 1,
0.8864521, -2.338974, 2.570636, 0.8352941, 0, 1, 1,
0.8914752, -0.316049, 1.893731, 0.8431373, 0, 1, 1,
0.8925836, -1.639259, 2.803003, 0.8470588, 0, 1, 1,
0.8937649, 0.495453, 0.1080813, 0.854902, 0, 1, 1,
0.8985351, 1.173262, 1.127378, 0.8588235, 0, 1, 1,
0.9031976, -1.068778, 2.907301, 0.8666667, 0, 1, 1,
0.9034441, 1.623883, -0.2217282, 0.8705882, 0, 1, 1,
0.9081753, -1.76539, 2.402281, 0.8784314, 0, 1, 1,
0.9119964, 1.305255, 1.173282, 0.8823529, 0, 1, 1,
0.9213523, -0.8913059, 2.05361, 0.8901961, 0, 1, 1,
0.9252937, -0.2051201, 0.9443434, 0.8941177, 0, 1, 1,
0.9273698, -2.208811, 2.471329, 0.9019608, 0, 1, 1,
0.9274496, 1.839924, -0.2464938, 0.9098039, 0, 1, 1,
0.9278705, -0.9180693, 0.9708048, 0.9137255, 0, 1, 1,
0.937229, 0.7751935, 1.575571, 0.9215686, 0, 1, 1,
0.941292, 0.713511, 0.5751169, 0.9254902, 0, 1, 1,
0.9432819, 0.9905804, 1.155389, 0.9333333, 0, 1, 1,
0.9452267, -0.003338574, -0.7271672, 0.9372549, 0, 1, 1,
0.9457561, -0.8783563, 0.4481001, 0.945098, 0, 1, 1,
0.9463298, 0.5111672, -0.1658204, 0.9490196, 0, 1, 1,
0.9477007, -0.6094522, 1.484913, 0.9568627, 0, 1, 1,
0.9496005, -0.2923993, 3.036716, 0.9607843, 0, 1, 1,
0.9529377, 0.4755647, 0.5907229, 0.9686275, 0, 1, 1,
0.9553053, -0.5126177, 1.822532, 0.972549, 0, 1, 1,
0.9565552, -0.556861, 3.41346, 0.9803922, 0, 1, 1,
0.9571365, -0.08429542, 1.482712, 0.9843137, 0, 1, 1,
0.9618123, -0.725098, 1.36238, 0.9921569, 0, 1, 1,
0.9646767, -1.551079, 1.847232, 0.9960784, 0, 1, 1,
0.9688185, 1.481047, -0.614376, 1, 0, 0.9960784, 1,
0.9714385, 1.780831, -1.164458, 1, 0, 0.9882353, 1,
0.9734801, 2.074486, -0.8264199, 1, 0, 0.9843137, 1,
0.9779173, 0.3546713, 0.910588, 1, 0, 0.9764706, 1,
0.9797793, 1.221555, 0.1531243, 1, 0, 0.972549, 1,
0.9839394, 0.6658091, 1.434766, 1, 0, 0.9647059, 1,
0.9901479, -0.3124912, 2.286386, 1, 0, 0.9607843, 1,
0.9946401, -0.05226158, 0.269978, 1, 0, 0.9529412, 1,
0.9949314, 0.8103874, 1.524916, 1, 0, 0.9490196, 1,
1.013157, -1.755671, 4.283205, 1, 0, 0.9411765, 1,
1.014151, -2.343781, 3.049783, 1, 0, 0.9372549, 1,
1.016398, 0.1152081, 1.695015, 1, 0, 0.9294118, 1,
1.020723, 0.6692058, 0.3794315, 1, 0, 0.9254902, 1,
1.022577, 0.6923845, 1.074073, 1, 0, 0.9176471, 1,
1.02318, 1.718137, 2.312921, 1, 0, 0.9137255, 1,
1.027209, -1.546909, 3.074701, 1, 0, 0.9058824, 1,
1.031096, 0.3443126, 2.64621, 1, 0, 0.9019608, 1,
1.031519, -0.5975803, 1.491189, 1, 0, 0.8941177, 1,
1.039907, 0.1996785, 2.926429, 1, 0, 0.8862745, 1,
1.046634, -0.9958376, 2.031567, 1, 0, 0.8823529, 1,
1.046654, -0.1864617, 0.1388191, 1, 0, 0.8745098, 1,
1.054921, -0.5700568, 1.311416, 1, 0, 0.8705882, 1,
1.056477, 0.6695917, 1.569821, 1, 0, 0.8627451, 1,
1.068168, 2.255388, 0.9140798, 1, 0, 0.8588235, 1,
1.070572, -2.004126, 1.890471, 1, 0, 0.8509804, 1,
1.072504, 0.7319002, 1.353256, 1, 0, 0.8470588, 1,
1.081171, 1.760535, -0.829859, 1, 0, 0.8392157, 1,
1.091741, 0.8965753, -0.5287515, 1, 0, 0.8352941, 1,
1.096001, -0.9089924, 2.785509, 1, 0, 0.827451, 1,
1.099975, -0.9934294, 3.269874, 1, 0, 0.8235294, 1,
1.107906, -1.090928, 3.77439, 1, 0, 0.8156863, 1,
1.114687, 0.8655992, 0.8052943, 1, 0, 0.8117647, 1,
1.115436, 0.9680221, 1.366617, 1, 0, 0.8039216, 1,
1.116533, 0.2012442, 0.4720215, 1, 0, 0.7960784, 1,
1.120121, 1.260264, 0.9890571, 1, 0, 0.7921569, 1,
1.122508, -0.7684488, 2.060913, 1, 0, 0.7843137, 1,
1.139091, -0.8787132, 1.527832, 1, 0, 0.7803922, 1,
1.143291, 2.021546, 0.07137585, 1, 0, 0.772549, 1,
1.156025, -0.1787174, 1.417012, 1, 0, 0.7686275, 1,
1.166925, 0.2966169, 0.6420912, 1, 0, 0.7607843, 1,
1.176278, 0.4603484, 0.2211592, 1, 0, 0.7568628, 1,
1.179327, 1.392843, 2.311593, 1, 0, 0.7490196, 1,
1.183647, 0.2642788, 0.8827693, 1, 0, 0.7450981, 1,
1.185066, 0.3674158, 1.114365, 1, 0, 0.7372549, 1,
1.187879, 0.2191744, 0.6547662, 1, 0, 0.7333333, 1,
1.192336, 0.7488367, 1.684289, 1, 0, 0.7254902, 1,
1.200174, -1.021867, 1.632792, 1, 0, 0.7215686, 1,
1.202464, 0.6788982, -0.1248258, 1, 0, 0.7137255, 1,
1.2062, -1.02416, 4.234824, 1, 0, 0.7098039, 1,
1.206335, -0.5838932, 1.407932, 1, 0, 0.7019608, 1,
1.210414, 0.9656472, 1.302224, 1, 0, 0.6941177, 1,
1.211437, -0.653143, 2.729106, 1, 0, 0.6901961, 1,
1.213199, 0.2200366, 0.4054688, 1, 0, 0.682353, 1,
1.216248, 0.1664895, 2.350776, 1, 0, 0.6784314, 1,
1.217042, -0.2417117, -0.1772082, 1, 0, 0.6705883, 1,
1.220495, 1.520188, 1.115735, 1, 0, 0.6666667, 1,
1.223097, 0.1568095, 1.417206, 1, 0, 0.6588235, 1,
1.223295, -0.6844928, 4.308296, 1, 0, 0.654902, 1,
1.224734, 0.4550913, 0.752848, 1, 0, 0.6470588, 1,
1.227842, -2.448075, 2.947057, 1, 0, 0.6431373, 1,
1.230675, -3.119242, 2.778288, 1, 0, 0.6352941, 1,
1.231895, -1.566957, 3.2315, 1, 0, 0.6313726, 1,
1.232001, -0.3275804, 0.9747501, 1, 0, 0.6235294, 1,
1.232282, 0.1525422, 0.4587881, 1, 0, 0.6196079, 1,
1.246683, 0.5486578, 2.801722, 1, 0, 0.6117647, 1,
1.249366, -0.7979796, 3.759543, 1, 0, 0.6078432, 1,
1.253093, 0.3051477, 2.271617, 1, 0, 0.6, 1,
1.257808, 1.625015, -0.649762, 1, 0, 0.5921569, 1,
1.271193, -2.346828, 2.076931, 1, 0, 0.5882353, 1,
1.271974, -0.2903514, 0.5965003, 1, 0, 0.5803922, 1,
1.272363, -0.9794359, 2.28549, 1, 0, 0.5764706, 1,
1.277464, -0.3760072, 3.970612, 1, 0, 0.5686275, 1,
1.280429, 1.107275, 0.02243146, 1, 0, 0.5647059, 1,
1.281977, -2.901106, 3.651612, 1, 0, 0.5568628, 1,
1.308435, 0.6078349, 3.445864, 1, 0, 0.5529412, 1,
1.311053, -1.967544, 3.25515, 1, 0, 0.5450981, 1,
1.315568, -1.587761, 2.892836, 1, 0, 0.5411765, 1,
1.331572, 2.318909, 1.359145, 1, 0, 0.5333334, 1,
1.342165, -0.4805907, 0.904146, 1, 0, 0.5294118, 1,
1.342485, -0.9239202, 4.422626, 1, 0, 0.5215687, 1,
1.350718, 0.3984263, 1.839397, 1, 0, 0.5176471, 1,
1.36094, 0.9710031, 0.6379382, 1, 0, 0.509804, 1,
1.36108, -0.1995129, 3.889311, 1, 0, 0.5058824, 1,
1.370078, 0.02917846, 1.350753, 1, 0, 0.4980392, 1,
1.374462, -1.659785, 3.020319, 1, 0, 0.4901961, 1,
1.389769, -0.5077158, 2.50499, 1, 0, 0.4862745, 1,
1.389896, -1.01361, 1.276725, 1, 0, 0.4784314, 1,
1.395673, -0.05783694, 0.005340226, 1, 0, 0.4745098, 1,
1.396768, 0.2967909, -0.2244224, 1, 0, 0.4666667, 1,
1.404462, 0.4331053, 3.67851, 1, 0, 0.4627451, 1,
1.407116, -0.152092, 2.828287, 1, 0, 0.454902, 1,
1.418022, 1.642629, 0.8589495, 1, 0, 0.4509804, 1,
1.42513, -0.178161, 2.731997, 1, 0, 0.4431373, 1,
1.427673, 0.04770948, 1.551986, 1, 0, 0.4392157, 1,
1.441429, -0.2446771, 2.237816, 1, 0, 0.4313726, 1,
1.442291, 1.109336, 0.9393151, 1, 0, 0.427451, 1,
1.455672, -0.20415, 1.76746, 1, 0, 0.4196078, 1,
1.464469, -1.109471, 1.911883, 1, 0, 0.4156863, 1,
1.466608, 0.2500673, 1.500454, 1, 0, 0.4078431, 1,
1.467785, 0.9011729, 0.465043, 1, 0, 0.4039216, 1,
1.468586, -0.3353207, 1.576631, 1, 0, 0.3960784, 1,
1.479991, -0.4765243, 1.061782, 1, 0, 0.3882353, 1,
1.488039, -0.8038278, 2.808118, 1, 0, 0.3843137, 1,
1.489159, -0.02075141, 1.972604, 1, 0, 0.3764706, 1,
1.496079, -1.16335, 3.484284, 1, 0, 0.372549, 1,
1.50787, -0.314133, 1.93787, 1, 0, 0.3647059, 1,
1.508633, 1.100369, 0.9161606, 1, 0, 0.3607843, 1,
1.532406, -0.8799021, 0.5422854, 1, 0, 0.3529412, 1,
1.538096, 1.570005, 0.217644, 1, 0, 0.3490196, 1,
1.538545, -1.829045, 2.849753, 1, 0, 0.3411765, 1,
1.541048, -1.052901, 4.177396, 1, 0, 0.3372549, 1,
1.567617, -0.4844199, 1.15386, 1, 0, 0.3294118, 1,
1.570819, -0.3878543, 2.151352, 1, 0, 0.3254902, 1,
1.577906, -1.517135, 3.509499, 1, 0, 0.3176471, 1,
1.584319, -0.1864783, 2.708221, 1, 0, 0.3137255, 1,
1.597803, -2.221465, 3.490739, 1, 0, 0.3058824, 1,
1.609337, -1.759171, 3.233453, 1, 0, 0.2980392, 1,
1.609974, 0.2571524, 1.267993, 1, 0, 0.2941177, 1,
1.626858, 0.4180076, 1.188362, 1, 0, 0.2862745, 1,
1.640688, -0.5287421, 1.097551, 1, 0, 0.282353, 1,
1.663614, 1.07088, -0.3953495, 1, 0, 0.2745098, 1,
1.666224, 0.2820459, 1.265954, 1, 0, 0.2705882, 1,
1.681175, 0.8205113, 0.3553872, 1, 0, 0.2627451, 1,
1.683259, -0.7629219, 2.634086, 1, 0, 0.2588235, 1,
1.685392, -3.357321, 1.892786, 1, 0, 0.2509804, 1,
1.687806, 0.03571377, 0.7821438, 1, 0, 0.2470588, 1,
1.689777, -0.869005, 2.010572, 1, 0, 0.2392157, 1,
1.6931, -0.01415379, 1.92423, 1, 0, 0.2352941, 1,
1.728518, 0.8136895, 0.4530678, 1, 0, 0.227451, 1,
1.746327, -0.2409893, 1.201656, 1, 0, 0.2235294, 1,
1.754008, 1.281302, 0.0808218, 1, 0, 0.2156863, 1,
1.755671, 1.46495, 0.3932319, 1, 0, 0.2117647, 1,
1.760023, -0.186785, 1.018236, 1, 0, 0.2039216, 1,
1.765847, -1.269461, 3.269149, 1, 0, 0.1960784, 1,
1.777999, 2.059716, 1.070953, 1, 0, 0.1921569, 1,
1.785509, 0.05713088, 3.545212, 1, 0, 0.1843137, 1,
1.804944, -1.366925, 1.160204, 1, 0, 0.1803922, 1,
1.817146, -2.468826, 2.521927, 1, 0, 0.172549, 1,
1.849847, -0.3848052, 0.005045747, 1, 0, 0.1686275, 1,
1.878752, 1.187392, 1.999561, 1, 0, 0.1607843, 1,
1.885158, 0.682344, 1.931283, 1, 0, 0.1568628, 1,
1.889252, 1.773973, 2.246205, 1, 0, 0.1490196, 1,
1.910033, 0.1536132, 2.026191, 1, 0, 0.145098, 1,
1.91713, -0.2323121, 1.437342, 1, 0, 0.1372549, 1,
1.927206, -0.1410285, 0.8346226, 1, 0, 0.1333333, 1,
1.976789, 0.04939994, 0.1714178, 1, 0, 0.1254902, 1,
1.988612, -0.5672606, 3.238191, 1, 0, 0.1215686, 1,
2.004489, -0.8019035, 1.694589, 1, 0, 0.1137255, 1,
2.012599, -0.06557789, 0.777557, 1, 0, 0.1098039, 1,
2.037844, 0.04903631, 0.2089849, 1, 0, 0.1019608, 1,
2.06283, 0.2294352, 1.206273, 1, 0, 0.09411765, 1,
2.080491, 0.5999597, 0.9632951, 1, 0, 0.09019608, 1,
2.09202, 0.6314575, 1.656276, 1, 0, 0.08235294, 1,
2.116754, -0.5486069, 1.975061, 1, 0, 0.07843138, 1,
2.120871, -0.4925804, 1.797698, 1, 0, 0.07058824, 1,
2.157041, 0.3376367, 1.78678, 1, 0, 0.06666667, 1,
2.217956, -0.04786143, 0.3153307, 1, 0, 0.05882353, 1,
2.236389, -0.4277802, 1.187586, 1, 0, 0.05490196, 1,
2.238661, -0.3453054, 3.715892, 1, 0, 0.04705882, 1,
2.427772, -2.087935, 1.747433, 1, 0, 0.04313726, 1,
2.492978, -0.1651147, 2.927316, 1, 0, 0.03529412, 1,
2.687215, -1.030334, 2.73934, 1, 0, 0.03137255, 1,
2.755061, -0.226066, 1.936698, 1, 0, 0.02352941, 1,
2.769017, 0.1758634, 1.62887, 1, 0, 0.01960784, 1,
3.004245, -0.8027421, 0.9803028, 1, 0, 0.01176471, 1,
3.783334, -0.5741799, 1.586874, 1, 0, 0.007843138, 1
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
0.2231145, -4.492889, -7.319598, 0, -0.5, 0.5, 0.5,
0.2231145, -4.492889, -7.319598, 1, -0.5, 0.5, 0.5,
0.2231145, -4.492889, -7.319598, 1, 1.5, 0.5, 0.5,
0.2231145, -4.492889, -7.319598, 0, 1.5, 0.5, 0.5
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
-4.54402, -0.007562637, -7.319598, 0, -0.5, 0.5, 0.5,
-4.54402, -0.007562637, -7.319598, 1, -0.5, 0.5, 0.5,
-4.54402, -0.007562637, -7.319598, 1, 1.5, 0.5, 0.5,
-4.54402, -0.007562637, -7.319598, 0, 1.5, 0.5, 0.5
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
-4.54402, -4.492889, -0.3026862, 0, -0.5, 0.5, 0.5,
-4.54402, -4.492889, -0.3026862, 1, -0.5, 0.5, 0.5,
-4.54402, -4.492889, -0.3026862, 1, 1.5, 0.5, 0.5,
-4.54402, -4.492889, -0.3026862, 0, 1.5, 0.5, 0.5
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
-2, -3.457814, -5.700311,
2, -3.457814, -5.700311,
-2, -3.457814, -5.700311,
-2, -3.630326, -5.970192,
0, -3.457814, -5.700311,
0, -3.630326, -5.970192,
2, -3.457814, -5.700311,
2, -3.630326, -5.970192
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
"0",
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
-2, -3.975351, -6.509954, 0, -0.5, 0.5, 0.5,
-2, -3.975351, -6.509954, 1, -0.5, 0.5, 0.5,
-2, -3.975351, -6.509954, 1, 1.5, 0.5, 0.5,
-2, -3.975351, -6.509954, 0, 1.5, 0.5, 0.5,
0, -3.975351, -6.509954, 0, -0.5, 0.5, 0.5,
0, -3.975351, -6.509954, 1, -0.5, 0.5, 0.5,
0, -3.975351, -6.509954, 1, 1.5, 0.5, 0.5,
0, -3.975351, -6.509954, 0, 1.5, 0.5, 0.5,
2, -3.975351, -6.509954, 0, -0.5, 0.5, 0.5,
2, -3.975351, -6.509954, 1, -0.5, 0.5, 0.5,
2, -3.975351, -6.509954, 1, 1.5, 0.5, 0.5,
2, -3.975351, -6.509954, 0, 1.5, 0.5, 0.5
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
-3.443912, -3, -5.700311,
-3.443912, 3, -5.700311,
-3.443912, -3, -5.700311,
-3.627263, -3, -5.970192,
-3.443912, -2, -5.700311,
-3.627263, -2, -5.970192,
-3.443912, -1, -5.700311,
-3.627263, -1, -5.970192,
-3.443912, 0, -5.700311,
-3.627263, 0, -5.970192,
-3.443912, 1, -5.700311,
-3.627263, 1, -5.970192,
-3.443912, 2, -5.700311,
-3.627263, 2, -5.970192,
-3.443912, 3, -5.700311,
-3.627263, 3, -5.970192
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
-3.993966, -3, -6.509954, 0, -0.5, 0.5, 0.5,
-3.993966, -3, -6.509954, 1, -0.5, 0.5, 0.5,
-3.993966, -3, -6.509954, 1, 1.5, 0.5, 0.5,
-3.993966, -3, -6.509954, 0, 1.5, 0.5, 0.5,
-3.993966, -2, -6.509954, 0, -0.5, 0.5, 0.5,
-3.993966, -2, -6.509954, 1, -0.5, 0.5, 0.5,
-3.993966, -2, -6.509954, 1, 1.5, 0.5, 0.5,
-3.993966, -2, -6.509954, 0, 1.5, 0.5, 0.5,
-3.993966, -1, -6.509954, 0, -0.5, 0.5, 0.5,
-3.993966, -1, -6.509954, 1, -0.5, 0.5, 0.5,
-3.993966, -1, -6.509954, 1, 1.5, 0.5, 0.5,
-3.993966, -1, -6.509954, 0, 1.5, 0.5, 0.5,
-3.993966, 0, -6.509954, 0, -0.5, 0.5, 0.5,
-3.993966, 0, -6.509954, 1, -0.5, 0.5, 0.5,
-3.993966, 0, -6.509954, 1, 1.5, 0.5, 0.5,
-3.993966, 0, -6.509954, 0, 1.5, 0.5, 0.5,
-3.993966, 1, -6.509954, 0, -0.5, 0.5, 0.5,
-3.993966, 1, -6.509954, 1, -0.5, 0.5, 0.5,
-3.993966, 1, -6.509954, 1, 1.5, 0.5, 0.5,
-3.993966, 1, -6.509954, 0, 1.5, 0.5, 0.5,
-3.993966, 2, -6.509954, 0, -0.5, 0.5, 0.5,
-3.993966, 2, -6.509954, 1, -0.5, 0.5, 0.5,
-3.993966, 2, -6.509954, 1, 1.5, 0.5, 0.5,
-3.993966, 2, -6.509954, 0, 1.5, 0.5, 0.5,
-3.993966, 3, -6.509954, 0, -0.5, 0.5, 0.5,
-3.993966, 3, -6.509954, 1, -0.5, 0.5, 0.5,
-3.993966, 3, -6.509954, 1, 1.5, 0.5, 0.5,
-3.993966, 3, -6.509954, 0, 1.5, 0.5, 0.5
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
-3.443912, -3.457814, -4,
-3.443912, -3.457814, 4,
-3.443912, -3.457814, -4,
-3.627263, -3.630326, -4,
-3.443912, -3.457814, -2,
-3.627263, -3.630326, -2,
-3.443912, -3.457814, 0,
-3.627263, -3.630326, 0,
-3.443912, -3.457814, 2,
-3.627263, -3.630326, 2,
-3.443912, -3.457814, 4,
-3.627263, -3.630326, 4
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
-3.993966, -3.975351, -4, 0, -0.5, 0.5, 0.5,
-3.993966, -3.975351, -4, 1, -0.5, 0.5, 0.5,
-3.993966, -3.975351, -4, 1, 1.5, 0.5, 0.5,
-3.993966, -3.975351, -4, 0, 1.5, 0.5, 0.5,
-3.993966, -3.975351, -2, 0, -0.5, 0.5, 0.5,
-3.993966, -3.975351, -2, 1, -0.5, 0.5, 0.5,
-3.993966, -3.975351, -2, 1, 1.5, 0.5, 0.5,
-3.993966, -3.975351, -2, 0, 1.5, 0.5, 0.5,
-3.993966, -3.975351, 0, 0, -0.5, 0.5, 0.5,
-3.993966, -3.975351, 0, 1, -0.5, 0.5, 0.5,
-3.993966, -3.975351, 0, 1, 1.5, 0.5, 0.5,
-3.993966, -3.975351, 0, 0, 1.5, 0.5, 0.5,
-3.993966, -3.975351, 2, 0, -0.5, 0.5, 0.5,
-3.993966, -3.975351, 2, 1, -0.5, 0.5, 0.5,
-3.993966, -3.975351, 2, 1, 1.5, 0.5, 0.5,
-3.993966, -3.975351, 2, 0, 1.5, 0.5, 0.5,
-3.993966, -3.975351, 4, 0, -0.5, 0.5, 0.5,
-3.993966, -3.975351, 4, 1, -0.5, 0.5, 0.5,
-3.993966, -3.975351, 4, 1, 1.5, 0.5, 0.5,
-3.993966, -3.975351, 4, 0, 1.5, 0.5, 0.5
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
-3.443912, -3.457814, -5.700311,
-3.443912, 3.442688, -5.700311,
-3.443912, -3.457814, 5.094938,
-3.443912, 3.442688, 5.094938,
-3.443912, -3.457814, -5.700311,
-3.443912, -3.457814, 5.094938,
-3.443912, 3.442688, -5.700311,
-3.443912, 3.442688, 5.094938,
-3.443912, -3.457814, -5.700311,
3.890141, -3.457814, -5.700311,
-3.443912, -3.457814, 5.094938,
3.890141, -3.457814, 5.094938,
-3.443912, 3.442688, -5.700311,
3.890141, 3.442688, -5.700311,
-3.443912, 3.442688, 5.094938,
3.890141, 3.442688, 5.094938,
3.890141, -3.457814, -5.700311,
3.890141, 3.442688, -5.700311,
3.890141, -3.457814, 5.094938,
3.890141, 3.442688, 5.094938,
3.890141, -3.457814, -5.700311,
3.890141, -3.457814, 5.094938,
3.890141, 3.442688, -5.700311,
3.890141, 3.442688, 5.094938
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
var radius = 7.883092;
var distance = 35.07277;
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
mvMatrix.translate( -0.2231145, 0.007562637, 0.3026862 );
mvMatrix.scale( 1.162161, 1.235179, 0.7895467 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.07277);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
ethylene_dichloride_<-read.table("ethylene_dichloride_.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethylene_dichloride_$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dichloride_' not found
```

```r
y<-ethylene_dichloride_$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dichloride_' not found
```

```r
z<-ethylene_dichloride_$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dichloride_' not found
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
-3.337105, -1.381531, -0.524446, 0, 0, 1, 1, 1,
-3.142148, 0.9113617, -1.59051, 1, 0, 0, 1, 1,
-3.064889, -0.1546166, -1.55027, 1, 0, 0, 1, 1,
-3.064347, -1.306895, -2.658914, 1, 0, 0, 1, 1,
-3.036193, -0.1341788, 0.2376409, 1, 0, 0, 1, 1,
-2.863189, -0.1486923, 0.5738711, 1, 0, 0, 1, 1,
-2.852371, -0.4987715, -3.108949, 0, 0, 0, 1, 1,
-2.766886, 0.43144, -2.765905, 0, 0, 0, 1, 1,
-2.613521, 0.5840079, -1.746879, 0, 0, 0, 1, 1,
-2.591377, 0.9647093, -0.8496447, 0, 0, 0, 1, 1,
-2.453813, -1.190909, -2.956251, 0, 0, 0, 1, 1,
-2.428553, -0.3304431, -0.6688748, 0, 0, 0, 1, 1,
-2.38024, 0.9212392, -1.320941, 0, 0, 0, 1, 1,
-2.369089, 1.057222, 0.1370288, 1, 1, 1, 1, 1,
-2.334605, 0.4171749, -0.8130275, 1, 1, 1, 1, 1,
-2.256045, -0.3843784, -0.6036043, 1, 1, 1, 1, 1,
-2.212951, -0.4721469, -1.27519, 1, 1, 1, 1, 1,
-2.209264, -0.3415784, -1.755401, 1, 1, 1, 1, 1,
-2.197766, 1.392855, -0.800324, 1, 1, 1, 1, 1,
-2.195894, -0.1520759, -0.8730957, 1, 1, 1, 1, 1,
-2.033797, -0.8691859, -2.134745, 1, 1, 1, 1, 1,
-1.988966, -1.548272, -2.591995, 1, 1, 1, 1, 1,
-1.986925, 0.3607685, -1.160075, 1, 1, 1, 1, 1,
-1.982248, 0.2381391, -2.099095, 1, 1, 1, 1, 1,
-1.953667, 0.3456884, -0.8790547, 1, 1, 1, 1, 1,
-1.889776, -0.1612386, -3.785912, 1, 1, 1, 1, 1,
-1.871305, -0.5954909, -0.5547192, 1, 1, 1, 1, 1,
-1.865341, -0.6475635, -0.1332808, 1, 1, 1, 1, 1,
-1.861641, 0.4951502, 0.2822303, 0, 0, 1, 1, 1,
-1.859378, -0.07511209, -3.143322, 1, 0, 0, 1, 1,
-1.848714, 2.580272, -0.802874, 1, 0, 0, 1, 1,
-1.846857, -0.07489198, -2.26017, 1, 0, 0, 1, 1,
-1.832204, -0.07720678, -0.5201116, 1, 0, 0, 1, 1,
-1.811764, 0.06943475, -0.3776227, 1, 0, 0, 1, 1,
-1.811741, -0.2910175, -4.086467, 0, 0, 0, 1, 1,
-1.808148, -1.307201, -3.25216, 0, 0, 0, 1, 1,
-1.804756, -0.5579152, -3.232984, 0, 0, 0, 1, 1,
-1.787169, -0.4234676, 0.2910476, 0, 0, 0, 1, 1,
-1.781461, -1.373262, -0.1862335, 0, 0, 0, 1, 1,
-1.780946, 2.170727, -0.5840499, 0, 0, 0, 1, 1,
-1.758249, 0.4472157, -0.930757, 0, 0, 0, 1, 1,
-1.746535, 0.1048925, -1.696954, 1, 1, 1, 1, 1,
-1.740266, 1.69561, -2.202909, 1, 1, 1, 1, 1,
-1.734079, 0.3904117, -1.034362, 1, 1, 1, 1, 1,
-1.717688, 3.22408, -3.141574, 1, 1, 1, 1, 1,
-1.712849, -2.085553, -4.53055, 1, 1, 1, 1, 1,
-1.682535, -0.3055771, -0.3988584, 1, 1, 1, 1, 1,
-1.668911, -0.08915955, -0.6750616, 1, 1, 1, 1, 1,
-1.666763, 0.803849, 0.1682198, 1, 1, 1, 1, 1,
-1.659477, -0.6904927, -2.588609, 1, 1, 1, 1, 1,
-1.652454, -0.05017336, -0.04976295, 1, 1, 1, 1, 1,
-1.651878, 0.1117421, -2.614332, 1, 1, 1, 1, 1,
-1.642513, -1.422915, -2.236476, 1, 1, 1, 1, 1,
-1.622693, 0.7479975, -3.453158, 1, 1, 1, 1, 1,
-1.61402, -0.1532701, -0.7676319, 1, 1, 1, 1, 1,
-1.602121, 0.3696678, -0.7802363, 1, 1, 1, 1, 1,
-1.601265, -0.6753618, -2.750433, 0, 0, 1, 1, 1,
-1.585923, -0.5070423, -2.692904, 1, 0, 0, 1, 1,
-1.579152, -0.2092593, -1.305199, 1, 0, 0, 1, 1,
-1.572692, -0.7316617, -3.197771, 1, 0, 0, 1, 1,
-1.5689, 0.8975938, 0.2166006, 1, 0, 0, 1, 1,
-1.556214, 0.5253984, -0.8150358, 1, 0, 0, 1, 1,
-1.525822, 1.275797, -2.788538, 0, 0, 0, 1, 1,
-1.496297, -0.6227525, -1.732968, 0, 0, 0, 1, 1,
-1.494058, 0.02281775, -2.082137, 0, 0, 0, 1, 1,
-1.49275, 1.425, 0.9996944, 0, 0, 0, 1, 1,
-1.484805, -0.8727257, -2.42372, 0, 0, 0, 1, 1,
-1.482082, 2.258569, 0.4168445, 0, 0, 0, 1, 1,
-1.479537, -1.698654, -2.903978, 0, 0, 0, 1, 1,
-1.46801, 0.5469328, -0.6951678, 1, 1, 1, 1, 1,
-1.467999, -1.107776, -1.252359, 1, 1, 1, 1, 1,
-1.466998, -1.306746, -2.821057, 1, 1, 1, 1, 1,
-1.465916, 0.5357362, -1.066128, 1, 1, 1, 1, 1,
-1.45509, -0.4144739, -1.802639, 1, 1, 1, 1, 1,
-1.442467, 0.7746066, -2.731289, 1, 1, 1, 1, 1,
-1.431218, 0.559527, -0.3593261, 1, 1, 1, 1, 1,
-1.430588, 1.076476, -0.7616895, 1, 1, 1, 1, 1,
-1.428182, -0.8982384, -1.532215, 1, 1, 1, 1, 1,
-1.427191, -0.3241206, -0.9578943, 1, 1, 1, 1, 1,
-1.424437, 0.8900644, -2.241598, 1, 1, 1, 1, 1,
-1.414032, 0.9772201, -0.8874658, 1, 1, 1, 1, 1,
-1.408067, -1.240224, -2.61531, 1, 1, 1, 1, 1,
-1.401903, 1.020881, -1.282752, 1, 1, 1, 1, 1,
-1.392652, 1.852083, 0.2751672, 1, 1, 1, 1, 1,
-1.392043, 0.7058141, -1.083097, 0, 0, 1, 1, 1,
-1.386831, -0.9700657, -3.465961, 1, 0, 0, 1, 1,
-1.380548, 1.604505, -0.9989491, 1, 0, 0, 1, 1,
-1.377005, 1.993556, -1.713682, 1, 0, 0, 1, 1,
-1.37065, -0.7342968, -0.7690283, 1, 0, 0, 1, 1,
-1.355272, 0.09377789, -3.286232, 1, 0, 0, 1, 1,
-1.348608, 0.345544, -2.231872, 0, 0, 0, 1, 1,
-1.344579, -0.05286469, 0.04627757, 0, 0, 0, 1, 1,
-1.34166, 1.146653, -2.159128, 0, 0, 0, 1, 1,
-1.340492, 0.4659388, -1.18633, 0, 0, 0, 1, 1,
-1.326486, -1.000932, -2.596193, 0, 0, 0, 1, 1,
-1.326309, 1.588002, -1.328339, 0, 0, 0, 1, 1,
-1.324289, 0.915366, -2.403814, 0, 0, 0, 1, 1,
-1.317915, 0.04781552, -2.332166, 1, 1, 1, 1, 1,
-1.313558, -0.09151044, -0.04448841, 1, 1, 1, 1, 1,
-1.305791, 1.112371, -0.09297629, 1, 1, 1, 1, 1,
-1.305606, -0.8754435, -1.011243, 1, 1, 1, 1, 1,
-1.303522, -0.09643387, -2.244756, 1, 1, 1, 1, 1,
-1.269868, -1.276006, -2.544965, 1, 1, 1, 1, 1,
-1.25366, 0.1129611, -0.8531218, 1, 1, 1, 1, 1,
-1.240733, -1.139675, -2.429365, 1, 1, 1, 1, 1,
-1.238828, -0.6828446, -2.147421, 1, 1, 1, 1, 1,
-1.232174, 0.005762395, -1.82209, 1, 1, 1, 1, 1,
-1.230917, 1.265957, 0.1604159, 1, 1, 1, 1, 1,
-1.228196, -2.001939, -3.462158, 1, 1, 1, 1, 1,
-1.222415, -0.2584572, -2.761348, 1, 1, 1, 1, 1,
-1.218505, 1.149511, 0.8761624, 1, 1, 1, 1, 1,
-1.218146, -0.05819735, -2.204589, 1, 1, 1, 1, 1,
-1.208135, 0.06994415, -2.304779, 0, 0, 1, 1, 1,
-1.203894, -1.35774, -4.201491, 1, 0, 0, 1, 1,
-1.199859, 0.4837398, -1.116267, 1, 0, 0, 1, 1,
-1.180643, -0.2310769, -1.520816, 1, 0, 0, 1, 1,
-1.173943, 2.205337, -0.9090632, 1, 0, 0, 1, 1,
-1.168222, -0.1773964, -1.376332, 1, 0, 0, 1, 1,
-1.127946, -1.023837, -2.397349, 0, 0, 0, 1, 1,
-1.123306, 0.699371, -0.4734996, 0, 0, 0, 1, 1,
-1.117972, -1.394552, -1.192867, 0, 0, 0, 1, 1,
-1.112824, 0.4836681, -1.792065, 0, 0, 0, 1, 1,
-1.106463, 0.9063025, 0.1653024, 0, 0, 0, 1, 1,
-1.105238, -0.2343304, -1.848489, 0, 0, 0, 1, 1,
-1.103181, 1.100911, -0.7605362, 0, 0, 0, 1, 1,
-1.099956, 0.4434316, -2.801666, 1, 1, 1, 1, 1,
-1.097435, 1.247117, -0.01255054, 1, 1, 1, 1, 1,
-1.096322, 1.096637, -1.41922, 1, 1, 1, 1, 1,
-1.094362, -0.9653276, -1.633498, 1, 1, 1, 1, 1,
-1.089408, -0.2149905, -2.096464, 1, 1, 1, 1, 1,
-1.077954, -0.7400674, -2.731771, 1, 1, 1, 1, 1,
-1.069825, 0.5733876, -0.8686026, 1, 1, 1, 1, 1,
-1.066337, -1.227368, -3.315399, 1, 1, 1, 1, 1,
-1.061208, -1.05622, -2.074981, 1, 1, 1, 1, 1,
-1.059221, -1.467978, -1.971406, 1, 1, 1, 1, 1,
-1.057809, 0.517483, -2.994714, 1, 1, 1, 1, 1,
-1.042191, 0.05659267, -0.4180289, 1, 1, 1, 1, 1,
-1.038463, -0.2868561, -1.168645, 1, 1, 1, 1, 1,
-1.037272, 0.293172, 0.03152335, 1, 1, 1, 1, 1,
-1.036919, 0.1998809, -0.5492331, 1, 1, 1, 1, 1,
-1.018939, 0.3867571, -1.854776, 0, 0, 1, 1, 1,
-1.018848, -1.194651, -1.076145, 1, 0, 0, 1, 1,
-1.002254, -0.303485, -3.319425, 1, 0, 0, 1, 1,
-0.9997288, 1.287726, 0.1266313, 1, 0, 0, 1, 1,
-0.9920564, -0.9017361, -2.24197, 1, 0, 0, 1, 1,
-0.9870931, -0.9779629, -2.793835, 1, 0, 0, 1, 1,
-0.9822748, -0.859509, -3.837493, 0, 0, 0, 1, 1,
-0.9812489, 1.198322, -0.6797631, 0, 0, 0, 1, 1,
-0.9646779, 0.6700332, -0.1743953, 0, 0, 0, 1, 1,
-0.9582924, 0.7171389, -0.2284593, 0, 0, 0, 1, 1,
-0.9570439, -0.2721427, -2.056892, 0, 0, 0, 1, 1,
-0.9570388, -0.2123672, -1.40552, 0, 0, 0, 1, 1,
-0.9552228, -0.07242911, -1.286401, 0, 0, 0, 1, 1,
-0.948489, -0.07557533, -2.111624, 1, 1, 1, 1, 1,
-0.9475932, -0.4007291, -0.8272232, 1, 1, 1, 1, 1,
-0.9461872, -0.4537515, -2.612989, 1, 1, 1, 1, 1,
-0.9428117, 0.1651122, -1.347463, 1, 1, 1, 1, 1,
-0.939103, -0.01439273, -2.690806, 1, 1, 1, 1, 1,
-0.9385406, -0.2512772, -2.645228, 1, 1, 1, 1, 1,
-0.9377315, 0.06390611, -1.081531, 1, 1, 1, 1, 1,
-0.9373767, 0.7647669, -0.6527284, 1, 1, 1, 1, 1,
-0.9350718, -0.164252, -1.733883, 1, 1, 1, 1, 1,
-0.9297535, -1.255075, -1.616279, 1, 1, 1, 1, 1,
-0.9292784, 0.8044471, -1.055009, 1, 1, 1, 1, 1,
-0.9249968, -0.9598562, -2.075803, 1, 1, 1, 1, 1,
-0.9237693, 0.3417019, -0.4523562, 1, 1, 1, 1, 1,
-0.9214533, -0.09377637, -1.840501, 1, 1, 1, 1, 1,
-0.9213028, 0.01410604, -2.75556, 1, 1, 1, 1, 1,
-0.9099467, 0.2970168, -1.775825, 0, 0, 1, 1, 1,
-0.9030375, 0.550275, 0.5782784, 1, 0, 0, 1, 1,
-0.8992029, -0.2738724, -1.02419, 1, 0, 0, 1, 1,
-0.886181, 1.03623, -1.96095, 1, 0, 0, 1, 1,
-0.8834424, 2.361112, 0.3961385, 1, 0, 0, 1, 1,
-0.8810471, -0.8976103, -3.566058, 1, 0, 0, 1, 1,
-0.8780981, -1.915614, -3.470701, 0, 0, 0, 1, 1,
-0.8769279, -1.625218, -4.250414, 0, 0, 0, 1, 1,
-0.8768935, 0.522261, 0.3444723, 0, 0, 0, 1, 1,
-0.8764207, -1.556772, -3.596224, 0, 0, 0, 1, 1,
-0.8681868, 0.006192325, -3.867582, 0, 0, 0, 1, 1,
-0.8609717, -0.4487938, -2.125863, 0, 0, 0, 1, 1,
-0.8594559, 0.44051, -1.740703, 0, 0, 0, 1, 1,
-0.852346, -1.077164, -2.467044, 1, 1, 1, 1, 1,
-0.8468397, 0.4218669, -2.514732, 1, 1, 1, 1, 1,
-0.8419815, 2.123856, -0.9687157, 1, 1, 1, 1, 1,
-0.8383135, 1.239441, -0.7134631, 1, 1, 1, 1, 1,
-0.8321488, -0.7183317, -2.363938, 1, 1, 1, 1, 1,
-0.8303502, 1.393145, -1.076426, 1, 1, 1, 1, 1,
-0.8290101, 0.3893096, -0.08192246, 1, 1, 1, 1, 1,
-0.8276951, 1.18645, -1.13052, 1, 1, 1, 1, 1,
-0.8263286, 1.018838, -1.587126, 1, 1, 1, 1, 1,
-0.8145654, -0.3428994, -3.069155, 1, 1, 1, 1, 1,
-0.8145398, -0.4630783, -1.368553, 1, 1, 1, 1, 1,
-0.8109503, 1.096878, -1.58668, 1, 1, 1, 1, 1,
-0.807735, 0.4775847, -2.361696, 1, 1, 1, 1, 1,
-0.8058325, -0.9768062, -2.675544, 1, 1, 1, 1, 1,
-0.8048513, 0.4627267, -2.050929, 1, 1, 1, 1, 1,
-0.8047146, -0.08951676, -2.189854, 0, 0, 1, 1, 1,
-0.8017272, 0.565136, -0.6801083, 1, 0, 0, 1, 1,
-0.8016692, -0.8095903, -0.7751547, 1, 0, 0, 1, 1,
-0.7997169, -1.086599, -0.0921393, 1, 0, 0, 1, 1,
-0.794871, -1.429636, -4.38065, 1, 0, 0, 1, 1,
-0.7886516, -0.773636, -1.41861, 1, 0, 0, 1, 1,
-0.7880126, 0.6077437, -1.22721, 0, 0, 0, 1, 1,
-0.7857987, 0.451753, -1.148973, 0, 0, 0, 1, 1,
-0.7807181, 0.07640448, -1.011851, 0, 0, 0, 1, 1,
-0.7804291, -0.7899579, -1.805902, 0, 0, 0, 1, 1,
-0.7792507, 1.319407, -2.988755, 0, 0, 0, 1, 1,
-0.7739345, -0.9682183, -2.867875, 0, 0, 0, 1, 1,
-0.772956, -0.4021535, -3.804691, 0, 0, 0, 1, 1,
-0.765184, -1.013535, -2.576083, 1, 1, 1, 1, 1,
-0.7648426, 0.2480922, -0.07658809, 1, 1, 1, 1, 1,
-0.7593135, 0.1425846, -4.256124, 1, 1, 1, 1, 1,
-0.7550235, 0.3454444, -1.009155, 1, 1, 1, 1, 1,
-0.7360495, 0.9662647, -3.87037, 1, 1, 1, 1, 1,
-0.7355399, 0.481714, -1.338677, 1, 1, 1, 1, 1,
-0.7322253, -0.6353905, -3.968938, 1, 1, 1, 1, 1,
-0.7294971, 0.52068, -3.261663, 1, 1, 1, 1, 1,
-0.7288224, -0.7199311, -2.742177, 1, 1, 1, 1, 1,
-0.7259257, 0.5648907, 0.6902398, 1, 1, 1, 1, 1,
-0.7190403, -1.364563, -2.757571, 1, 1, 1, 1, 1,
-0.7188561, -0.2157233, -2.001694, 1, 1, 1, 1, 1,
-0.7147291, -0.8168827, -3.356294, 1, 1, 1, 1, 1,
-0.7138627, 0.1524823, -1.079502, 1, 1, 1, 1, 1,
-0.7068729, 0.8300183, -1.43226, 1, 1, 1, 1, 1,
-0.7041442, -0.2808483, -1.822893, 0, 0, 1, 1, 1,
-0.7031063, -0.7420479, -1.563412, 1, 0, 0, 1, 1,
-0.6988746, 0.9911043, -0.2709734, 1, 0, 0, 1, 1,
-0.6982185, 0.5255886, -2.451566, 1, 0, 0, 1, 1,
-0.6971109, 0.3212316, -1.561714, 1, 0, 0, 1, 1,
-0.6953487, 0.6037201, -1.515298, 1, 0, 0, 1, 1,
-0.692141, 1.201507, 0.3269129, 0, 0, 0, 1, 1,
-0.6870208, -1.133707, -2.955477, 0, 0, 0, 1, 1,
-0.6809427, -0.08002953, -0.3981712, 0, 0, 0, 1, 1,
-0.6765054, 0.04478898, -1.852934, 0, 0, 0, 1, 1,
-0.6756597, -0.2606529, -2.202653, 0, 0, 0, 1, 1,
-0.6711102, 1.232371, -0.4218623, 0, 0, 0, 1, 1,
-0.6660044, -2.160188, -3.663655, 0, 0, 0, 1, 1,
-0.6638153, 0.1273025, -1.430802, 1, 1, 1, 1, 1,
-0.6602325, 0.5127991, 0.2033159, 1, 1, 1, 1, 1,
-0.6580658, -2.162804, -2.021815, 1, 1, 1, 1, 1,
-0.6576149, -1.346158, -1.95769, 1, 1, 1, 1, 1,
-0.6541993, 0.1047654, -2.483438, 1, 1, 1, 1, 1,
-0.6469315, 0.614392, -2.59284, 1, 1, 1, 1, 1,
-0.6458138, -1.370173, -2.964292, 1, 1, 1, 1, 1,
-0.6449006, 0.5217948, -1.24239, 1, 1, 1, 1, 1,
-0.6388963, -0.8320981, -2.997895, 1, 1, 1, 1, 1,
-0.6371796, 2.260466, 0.8867947, 1, 1, 1, 1, 1,
-0.635016, 0.02840547, -2.39633, 1, 1, 1, 1, 1,
-0.6319286, 1.609707, -2.205228, 1, 1, 1, 1, 1,
-0.6310092, -0.5744213, -2.843728, 1, 1, 1, 1, 1,
-0.6276183, 0.01752671, -1.959283, 1, 1, 1, 1, 1,
-0.6252342, 0.808383, -0.8675451, 1, 1, 1, 1, 1,
-0.6215527, 0.9961093, 0.8131782, 0, 0, 1, 1, 1,
-0.6206992, 0.9518999, -0.5761269, 1, 0, 0, 1, 1,
-0.6206861, 0.3318712, 0.7731532, 1, 0, 0, 1, 1,
-0.6191143, -0.841301, -1.764521, 1, 0, 0, 1, 1,
-0.612356, -0.3116833, -2.129378, 1, 0, 0, 1, 1,
-0.6105577, 0.8279799, 0.5000101, 1, 0, 0, 1, 1,
-0.6101878, 0.9548742, -0.3550203, 0, 0, 0, 1, 1,
-0.6084527, -1.037007, -2.013442, 0, 0, 0, 1, 1,
-0.6082461, -0.4795653, -1.787874, 0, 0, 0, 1, 1,
-0.6061257, 1.1058, -0.6468659, 0, 0, 0, 1, 1,
-0.6008954, -1.92857, -3.577246, 0, 0, 0, 1, 1,
-0.598965, -0.7077981, -0.4599964, 0, 0, 0, 1, 1,
-0.5984824, 0.04093157, -0.9887263, 0, 0, 0, 1, 1,
-0.5965557, -1.248924, -2.27441, 1, 1, 1, 1, 1,
-0.595171, -1.210747, -2.552566, 1, 1, 1, 1, 1,
-0.5951, -0.2945802, -1.322654, 1, 1, 1, 1, 1,
-0.5898931, 1.99582, -0.1062651, 1, 1, 1, 1, 1,
-0.5870984, 0.3251339, -0.4039584, 1, 1, 1, 1, 1,
-0.5815144, 1.714906, -2.015722, 1, 1, 1, 1, 1,
-0.578777, -1.378192, -3.144913, 1, 1, 1, 1, 1,
-0.5779616, 1.210315, -0.1420634, 1, 1, 1, 1, 1,
-0.5748428, -0.08997495, -2.335371, 1, 1, 1, 1, 1,
-0.5692652, -0.7937278, -2.536266, 1, 1, 1, 1, 1,
-0.5678593, -1.658062, -3.209485, 1, 1, 1, 1, 1,
-0.5662481, 0.9248258, 0.7959995, 1, 1, 1, 1, 1,
-0.5642993, -0.664469, -2.04773, 1, 1, 1, 1, 1,
-0.5602688, 0.4560559, 0.1776038, 1, 1, 1, 1, 1,
-0.5571013, 0.8029491, 0.7610832, 1, 1, 1, 1, 1,
-0.5560637, -1.497347, -1.952211, 0, 0, 1, 1, 1,
-0.5557947, 1.102547, -0.3761291, 1, 0, 0, 1, 1,
-0.5544868, 0.1656979, -1.804666, 1, 0, 0, 1, 1,
-0.5483098, 0.9832855, 0.6575589, 1, 0, 0, 1, 1,
-0.5432084, 1.542633, -2.100223, 1, 0, 0, 1, 1,
-0.5386837, -0.4305075, -4.297665, 1, 0, 0, 1, 1,
-0.5374541, -0.3636002, -1.405285, 0, 0, 0, 1, 1,
-0.5351183, -0.07764599, -0.8740751, 0, 0, 0, 1, 1,
-0.5308635, 0.5975175, -1.805048, 0, 0, 0, 1, 1,
-0.5276243, 0.5810352, -0.1444418, 0, 0, 0, 1, 1,
-0.5274859, -0.8108035, -1.370603, 0, 0, 0, 1, 1,
-0.5245063, 2.107786, -1.133247, 0, 0, 0, 1, 1,
-0.5243887, -1.38661, -1.695873, 0, 0, 0, 1, 1,
-0.5241887, 0.8173038, -0.5011374, 1, 1, 1, 1, 1,
-0.5240621, 1.340053, 2.258962, 1, 1, 1, 1, 1,
-0.5237722, 1.214836, -0.7511914, 1, 1, 1, 1, 1,
-0.5112157, 1.449604, -1.192075, 1, 1, 1, 1, 1,
-0.5062709, 0.6592695, -0.6699997, 1, 1, 1, 1, 1,
-0.5047518, -0.7741138, -2.453925, 1, 1, 1, 1, 1,
-0.5016305, -0.3764535, -2.640549, 1, 1, 1, 1, 1,
-0.5006788, 1.128829, 1.619957, 1, 1, 1, 1, 1,
-0.4976, -0.3731374, -2.095705, 1, 1, 1, 1, 1,
-0.4941413, -0.3682508, -2.024666, 1, 1, 1, 1, 1,
-0.4857493, 1.020193, 0.4982681, 1, 1, 1, 1, 1,
-0.4840669, 0.1238403, -2.539447, 1, 1, 1, 1, 1,
-0.4828976, -0.202352, -3.261684, 1, 1, 1, 1, 1,
-0.4812787, 0.4508653, -1.909462, 1, 1, 1, 1, 1,
-0.4791713, -1.042459, -2.922441, 1, 1, 1, 1, 1,
-0.4774903, -0.2904486, -2.586623, 0, 0, 1, 1, 1,
-0.4715828, 1.105068, -1.046089, 1, 0, 0, 1, 1,
-0.4691779, -0.2921287, -1.455465, 1, 0, 0, 1, 1,
-0.4687187, 0.5927351, -0.02769863, 1, 0, 0, 1, 1,
-0.4669513, 1.65733, -0.7249278, 1, 0, 0, 1, 1,
-0.4668387, 1.024103, -1.764081, 1, 0, 0, 1, 1,
-0.4667361, 1.134015, 0.7274515, 0, 0, 0, 1, 1,
-0.4664524, -0.7014377, -2.314598, 0, 0, 0, 1, 1,
-0.4657932, -0.5459595, -2.231097, 0, 0, 0, 1, 1,
-0.4557027, 0.5242594, -1.858529, 0, 0, 0, 1, 1,
-0.4525009, -1.356465, -4.52076, 0, 0, 0, 1, 1,
-0.4407531, 0.7241895, 0.2869185, 0, 0, 0, 1, 1,
-0.4387108, -0.2623491, -2.591055, 0, 0, 0, 1, 1,
-0.4348198, 0.4947649, -1.242021, 1, 1, 1, 1, 1,
-0.4346665, 0.5452149, 0.8924051, 1, 1, 1, 1, 1,
-0.4319544, -0.3202487, -1.551483, 1, 1, 1, 1, 1,
-0.4298299, 0.5478349, 0.0646796, 1, 1, 1, 1, 1,
-0.4293451, -0.1862262, -1.646042, 1, 1, 1, 1, 1,
-0.4262312, 0.7070056, -0.2204874, 1, 1, 1, 1, 1,
-0.4260148, 1.695816, -1.747918, 1, 1, 1, 1, 1,
-0.4193585, 0.5339961, -1.277778, 1, 1, 1, 1, 1,
-0.4151666, -1.140951, -2.142388, 1, 1, 1, 1, 1,
-0.4151005, 0.9971694, 1.130887, 1, 1, 1, 1, 1,
-0.4128025, -1.981364, -3.308385, 1, 1, 1, 1, 1,
-0.4109274, -0.02882652, -4.380999, 1, 1, 1, 1, 1,
-0.4104513, 1.442882, -0.4486931, 1, 1, 1, 1, 1,
-0.408294, -1.290418, -2.814868, 1, 1, 1, 1, 1,
-0.4082395, -1.783766, -2.570219, 1, 1, 1, 1, 1,
-0.4048348, -1.158564, -1.779338, 0, 0, 1, 1, 1,
-0.4026172, -0.5963606, -2.826842, 1, 0, 0, 1, 1,
-0.4018739, -0.7010339, -3.035865, 1, 0, 0, 1, 1,
-0.3995163, -0.7500387, -1.853232, 1, 0, 0, 1, 1,
-0.3954894, 1.241128, 0.07483622, 1, 0, 0, 1, 1,
-0.3954863, 0.1060906, -1.028133, 1, 0, 0, 1, 1,
-0.3919528, -1.038721, -2.959902, 0, 0, 0, 1, 1,
-0.3916762, -0.018893, -2.072607, 0, 0, 0, 1, 1,
-0.3893819, -1.173897, -2.153404, 0, 0, 0, 1, 1,
-0.3848355, -0.3173839, -2.686914, 0, 0, 0, 1, 1,
-0.3767613, 0.1863162, -0.5664646, 0, 0, 0, 1, 1,
-0.3740511, -0.7044125, -1.071094, 0, 0, 0, 1, 1,
-0.373345, -1.990047, -3.297152, 0, 0, 0, 1, 1,
-0.3685651, -0.2457271, -3.263947, 1, 1, 1, 1, 1,
-0.3657067, -0.193291, -4.20684, 1, 1, 1, 1, 1,
-0.3630719, -0.4796861, -1.543003, 1, 1, 1, 1, 1,
-0.3556944, -1.030016, -2.259933, 1, 1, 1, 1, 1,
-0.3543155, 0.8471281, -1.242643, 1, 1, 1, 1, 1,
-0.3504876, -0.02435732, -2.698549, 1, 1, 1, 1, 1,
-0.3503774, -0.83226, -1.905741, 1, 1, 1, 1, 1,
-0.3499162, 1.942525, -2.106845, 1, 1, 1, 1, 1,
-0.3481058, 1.543473, -0.6248009, 1, 1, 1, 1, 1,
-0.346462, -0.225988, -2.95909, 1, 1, 1, 1, 1,
-0.3452016, 1.537054, -0.109112, 1, 1, 1, 1, 1,
-0.3424008, -0.938197, -1.259826, 1, 1, 1, 1, 1,
-0.3396263, -1.534681, -1.549714, 1, 1, 1, 1, 1,
-0.3394065, -0.6800527, -2.465068, 1, 1, 1, 1, 1,
-0.3317688, 0.2911542, 0.4624971, 1, 1, 1, 1, 1,
-0.3302444, -0.758207, -4.331337, 0, 0, 1, 1, 1,
-0.3274651, -1.180131, -2.264005, 1, 0, 0, 1, 1,
-0.3208659, 1.645794, -0.7968515, 1, 0, 0, 1, 1,
-0.3206827, 0.7267725, 1.543528, 1, 0, 0, 1, 1,
-0.3205403, 0.1030386, -1.116026, 1, 0, 0, 1, 1,
-0.3174021, 0.3247567, -1.630066, 1, 0, 0, 1, 1,
-0.3170205, 0.5215144, -1.589835, 0, 0, 0, 1, 1,
-0.3155707, 2.306671, -0.253251, 0, 0, 0, 1, 1,
-0.3083594, 1.173278, 0.3004925, 0, 0, 0, 1, 1,
-0.3058729, -0.05218355, -1.375587, 0, 0, 0, 1, 1,
-0.2969284, -2.300997, -1.787584, 0, 0, 0, 1, 1,
-0.2805373, 0.5540016, 0.4704469, 0, 0, 0, 1, 1,
-0.2740334, 0.1772209, -0.5276906, 0, 0, 0, 1, 1,
-0.2733695, -0.3098635, -2.33516, 1, 1, 1, 1, 1,
-0.2725842, 1.213022, -0.2853306, 1, 1, 1, 1, 1,
-0.2706127, 0.03967385, -0.1639999, 1, 1, 1, 1, 1,
-0.2702194, -0.6420394, -4.046093, 1, 1, 1, 1, 1,
-0.2698369, -1.087179, -2.986245, 1, 1, 1, 1, 1,
-0.2692231, -0.953131, -3.143008, 1, 1, 1, 1, 1,
-0.269093, -0.3676247, -1.53049, 1, 1, 1, 1, 1,
-0.2666437, 0.04421945, 0.3364758, 1, 1, 1, 1, 1,
-0.2599554, 1.830437, 0.1489923, 1, 1, 1, 1, 1,
-0.2590882, 0.1031845, 0.3526704, 1, 1, 1, 1, 1,
-0.2590803, -0.6050223, -3.395208, 1, 1, 1, 1, 1,
-0.2578124, 1.110088, -1.223949, 1, 1, 1, 1, 1,
-0.2548424, -0.2925584, -2.073786, 1, 1, 1, 1, 1,
-0.2545131, -0.841392, -2.502538, 1, 1, 1, 1, 1,
-0.2525001, 0.4827127, -0.6982231, 1, 1, 1, 1, 1,
-0.2487723, -0.05373764, -2.587671, 0, 0, 1, 1, 1,
-0.2463322, 0.5122815, 0.5933701, 1, 0, 0, 1, 1,
-0.2454134, -0.706746, -2.887096, 1, 0, 0, 1, 1,
-0.2437907, -1.151037, -3.929659, 1, 0, 0, 1, 1,
-0.2389005, 1.015539, -0.5369621, 1, 0, 0, 1, 1,
-0.2364919, -0.6113861, -3.685225, 1, 0, 0, 1, 1,
-0.233461, -0.2940042, -1.821607, 0, 0, 0, 1, 1,
-0.2312881, 0.1681522, -1.233718, 0, 0, 0, 1, 1,
-0.22609, -0.2547461, -4.902909, 0, 0, 0, 1, 1,
-0.2250094, 0.2158354, 0.6436876, 0, 0, 0, 1, 1,
-0.2199942, 0.5240676, -0.3737067, 0, 0, 0, 1, 1,
-0.219642, 1.058765, -0.1484048, 0, 0, 0, 1, 1,
-0.2177542, 0.4096752, -1.023374, 0, 0, 0, 1, 1,
-0.216525, -1.097879, -2.371472, 1, 1, 1, 1, 1,
-0.2138696, 0.02526769, -1.310922, 1, 1, 1, 1, 1,
-0.2128724, 0.8051305, 1.027279, 1, 1, 1, 1, 1,
-0.2094143, -0.5455918, -3.014838, 1, 1, 1, 1, 1,
-0.1983998, 0.8734165, 1.11578, 1, 1, 1, 1, 1,
-0.1983301, -0.5002692, -1.544922, 1, 1, 1, 1, 1,
-0.1962822, 0.4528076, 0.532968, 1, 1, 1, 1, 1,
-0.1961909, -1.731686, -3.389811, 1, 1, 1, 1, 1,
-0.1921708, -0.9996507, -3.792895, 1, 1, 1, 1, 1,
-0.1913492, 1.23288, -0.8813852, 1, 1, 1, 1, 1,
-0.1880036, 0.1508032, -2.131739, 1, 1, 1, 1, 1,
-0.1870096, 1.323506, 1.002659, 1, 1, 1, 1, 1,
-0.1867477, 0.4321291, 0.6626498, 1, 1, 1, 1, 1,
-0.1807662, -0.114359, -1.704524, 1, 1, 1, 1, 1,
-0.1780749, 0.08790833, -1.114731, 1, 1, 1, 1, 1,
-0.176781, 0.3409609, 0.6964511, 0, 0, 1, 1, 1,
-0.171181, -0.9302502, -2.101765, 1, 0, 0, 1, 1,
-0.1696239, -0.5940976, -2.500463, 1, 0, 0, 1, 1,
-0.1692926, 0.7347408, 0.6530005, 1, 0, 0, 1, 1,
-0.1677424, -1.305285, -3.288892, 1, 0, 0, 1, 1,
-0.1660783, 0.7947279, -3.362911, 1, 0, 0, 1, 1,
-0.1634622, -0.0559379, -2.61704, 0, 0, 0, 1, 1,
-0.1630736, -0.03705956, -1.871385, 0, 0, 0, 1, 1,
-0.1603304, -0.4075319, -2.278951, 0, 0, 0, 1, 1,
-0.1591928, 0.2292321, 0.5172094, 0, 0, 0, 1, 1,
-0.1589177, 0.2236104, 1.398904, 0, 0, 0, 1, 1,
-0.1587792, -0.82538, -1.415426, 0, 0, 0, 1, 1,
-0.148332, -0.1566199, -1.952679, 0, 0, 0, 1, 1,
-0.1326244, -0.8230172, -5.266631, 1, 1, 1, 1, 1,
-0.1318265, -0.09627605, -1.177484, 1, 1, 1, 1, 1,
-0.1298557, -2.461667, -4.704247, 1, 1, 1, 1, 1,
-0.1221785, -0.9132877, -3.331013, 1, 1, 1, 1, 1,
-0.1214535, 0.06682576, -1.572202, 1, 1, 1, 1, 1,
-0.120993, 0.4846813, -0.4566863, 1, 1, 1, 1, 1,
-0.1209896, -0.6943229, -2.737447, 1, 1, 1, 1, 1,
-0.1179102, -0.1813218, -3.453049, 1, 1, 1, 1, 1,
-0.1174773, 2.975395, -1.336741, 1, 1, 1, 1, 1,
-0.1163803, -0.6171961, -5.543098, 1, 1, 1, 1, 1,
-0.1146538, -0.9970005, -2.39866, 1, 1, 1, 1, 1,
-0.1136131, 0.8141136, -1.361265, 1, 1, 1, 1, 1,
-0.107494, 0.6268291, 1.443988, 1, 1, 1, 1, 1,
-0.1034799, -1.460061, -4.914621, 1, 1, 1, 1, 1,
-0.09748597, -1.056606, -3.847011, 1, 1, 1, 1, 1,
-0.09739749, -0.9336007, -3.57319, 0, 0, 1, 1, 1,
-0.09563483, 0.2709492, 0.444312, 1, 0, 0, 1, 1,
-0.09561666, 0.7309884, -1.190441, 1, 0, 0, 1, 1,
-0.09519692, -0.06954126, -2.355382, 1, 0, 0, 1, 1,
-0.09506826, -0.534914, -2.348949, 1, 0, 0, 1, 1,
-0.09335609, 0.9303526, -0.1459722, 1, 0, 0, 1, 1,
-0.09272701, 0.1920207, 0.5458261, 0, 0, 0, 1, 1,
-0.0925867, -0.07809029, -1.442768, 0, 0, 0, 1, 1,
-0.08818672, 2.516814, 0.9114391, 0, 0, 0, 1, 1,
-0.08505427, -1.130319, -1.799303, 0, 0, 0, 1, 1,
-0.08383642, 2.028592, 0.7288215, 0, 0, 0, 1, 1,
-0.08091713, -0.6499152, -3.745291, 0, 0, 0, 1, 1,
-0.08005058, -0.6898878, -1.648008, 0, 0, 0, 1, 1,
-0.07874304, 1.626001, 0.2217463, 1, 1, 1, 1, 1,
-0.07428877, -1.259715, -4.233921, 1, 1, 1, 1, 1,
-0.07232901, -0.451988, -2.317363, 1, 1, 1, 1, 1,
-0.06983081, 0.1114901, -0.9821068, 1, 1, 1, 1, 1,
-0.06583424, -1.621427, -3.053628, 1, 1, 1, 1, 1,
-0.06338409, 0.2822443, -1.175128, 1, 1, 1, 1, 1,
-0.05964195, -0.7594048, -2.026365, 1, 1, 1, 1, 1,
-0.05682678, -0.1415518, -2.765486, 1, 1, 1, 1, 1,
-0.05619157, 0.4375776, -0.2642183, 1, 1, 1, 1, 1,
-0.05552574, -0.5138348, -1.808411, 1, 1, 1, 1, 1,
-0.05539337, -1.253588, -4.115031, 1, 1, 1, 1, 1,
-0.0543616, -0.1815517, -3.305092, 1, 1, 1, 1, 1,
-0.04952956, -1.292904, -1.978951, 1, 1, 1, 1, 1,
-0.04895861, -0.8378618, -4.135981, 1, 1, 1, 1, 1,
-0.04817032, 2.165031, 0.4620943, 1, 1, 1, 1, 1,
-0.04191247, 0.2570327, -0.1366215, 0, 0, 1, 1, 1,
-0.02872784, -0.5993598, -1.900307, 1, 0, 0, 1, 1,
-0.02216868, -2.207887, -4.089222, 1, 0, 0, 1, 1,
-0.02159289, -0.9670987, -0.8953617, 1, 0, 0, 1, 1,
-0.02065155, -1.160587, -2.28927, 1, 0, 0, 1, 1,
-0.01756185, 1.030789, -0.7094965, 1, 0, 0, 1, 1,
-0.01009482, 0.3773909, -0.07990055, 0, 0, 0, 1, 1,
-0.009511556, 0.07768236, 1.443031, 0, 0, 0, 1, 1,
-0.008504729, -0.4517417, -2.202453, 0, 0, 0, 1, 1,
-0.001212574, 1.590344, 1.285304, 0, 0, 0, 1, 1,
0.00209152, -0.3857579, 2.379651, 0, 0, 0, 1, 1,
0.004303401, -0.5660071, 3.71694, 0, 0, 0, 1, 1,
0.004677163, 1.738243, 0.4688023, 0, 0, 0, 1, 1,
0.009102804, -0.5981028, 3.590399, 1, 1, 1, 1, 1,
0.01279609, -0.455451, 3.629735, 1, 1, 1, 1, 1,
0.01354656, 1.145327, 0.5565407, 1, 1, 1, 1, 1,
0.01881932, -1.177367, 4.859015, 1, 1, 1, 1, 1,
0.02181558, 0.04522714, 1.66047, 1, 1, 1, 1, 1,
0.02264268, 0.4817238, -0.27546, 1, 1, 1, 1, 1,
0.02317817, 1.161933, -1.003, 1, 1, 1, 1, 1,
0.02392952, 1.076275, -0.8370426, 1, 1, 1, 1, 1,
0.02503393, 0.5082051, -0.5929107, 1, 1, 1, 1, 1,
0.0298259, -0.5698528, 2.636388, 1, 1, 1, 1, 1,
0.03663024, 0.4837642, 0.1524878, 1, 1, 1, 1, 1,
0.03787321, -0.830667, 2.533295, 1, 1, 1, 1, 1,
0.03829747, 1.411578, 0.8530756, 1, 1, 1, 1, 1,
0.03908585, 0.2338802, 0.3822166, 1, 1, 1, 1, 1,
0.05644395, -1.620147, 4.15332, 1, 1, 1, 1, 1,
0.05651423, 0.383523, 0.01209794, 0, 0, 1, 1, 1,
0.06302879, -0.4227995, 2.467141, 1, 0, 0, 1, 1,
0.06525621, -0.6544136, 3.604946, 1, 0, 0, 1, 1,
0.06654236, -1.237173, 2.848448, 1, 0, 0, 1, 1,
0.07087576, -0.2099476, 1.75081, 1, 0, 0, 1, 1,
0.07142442, -0.4844945, 3.890379, 1, 0, 0, 1, 1,
0.07278809, -0.2032733, 3.465225, 0, 0, 0, 1, 1,
0.09239936, 0.361903, 0.59487, 0, 0, 0, 1, 1,
0.09248728, -1.091624, 3.161818, 0, 0, 0, 1, 1,
0.09382319, -0.2914867, 3.590209, 0, 0, 0, 1, 1,
0.09512716, -0.4204343, 3.627099, 0, 0, 0, 1, 1,
0.09568767, 0.1680864, 0.9007696, 0, 0, 0, 1, 1,
0.09706599, 0.1344904, 1.242884, 0, 0, 0, 1, 1,
0.09948976, -0.2062817, 2.411038, 1, 1, 1, 1, 1,
0.1036859, 0.8488929, 1.143791, 1, 1, 1, 1, 1,
0.1061626, -0.5649878, 4.568994, 1, 1, 1, 1, 1,
0.1089455, 0.9298685, 1.084855, 1, 1, 1, 1, 1,
0.1180488, -0.9474689, 3.455479, 1, 1, 1, 1, 1,
0.1195778, 1.309504, 3.702429, 1, 1, 1, 1, 1,
0.124124, -0.7099036, 2.230934, 1, 1, 1, 1, 1,
0.126222, 0.2836314, 0.006659129, 1, 1, 1, 1, 1,
0.1292382, -0.5650988, 2.062, 1, 1, 1, 1, 1,
0.1299754, 0.1893849, 1.464221, 1, 1, 1, 1, 1,
0.1313553, 0.7592176, -0.6531755, 1, 1, 1, 1, 1,
0.1318175, 1.356332, 0.4210025, 1, 1, 1, 1, 1,
0.1323528, 0.3251737, 1.005846, 1, 1, 1, 1, 1,
0.1337165, -0.95792, 1.836119, 1, 1, 1, 1, 1,
0.1347684, -0.591124, 2.843757, 1, 1, 1, 1, 1,
0.1358036, -1.341067, 2.929698, 0, 0, 1, 1, 1,
0.1364522, -0.5006163, 2.511865, 1, 0, 0, 1, 1,
0.142412, -1.290923, 4.507149, 1, 0, 0, 1, 1,
0.1449667, -0.889632, 2.051462, 1, 0, 0, 1, 1,
0.1454459, 0.1326722, 1.185265, 1, 0, 0, 1, 1,
0.1474611, -0.2052836, 1.702768, 1, 0, 0, 1, 1,
0.1485728, 0.2816534, 0.5159613, 0, 0, 0, 1, 1,
0.1511761, 0.3505874, 1.178164, 0, 0, 0, 1, 1,
0.1530321, 1.110125, 1.956969, 0, 0, 0, 1, 1,
0.1613347, -0.04100913, -0.001668309, 0, 0, 0, 1, 1,
0.1624733, -0.1325383, 2.605711, 0, 0, 0, 1, 1,
0.1680425, -1.344301, 4.937726, 0, 0, 0, 1, 1,
0.1686074, -1.029695, 2.146941, 0, 0, 0, 1, 1,
0.1701496, 2.42337, 0.5320417, 1, 1, 1, 1, 1,
0.1712916, 1.826397, -1.283596, 1, 1, 1, 1, 1,
0.1724631, -0.8192081, 3.430726, 1, 1, 1, 1, 1,
0.1743343, -0.1184483, 2.871288, 1, 1, 1, 1, 1,
0.1748706, 1.107881, 0.5300396, 1, 1, 1, 1, 1,
0.1757486, 1.286899, 1.82226, 1, 1, 1, 1, 1,
0.1762162, 1.008194, 0.8564523, 1, 1, 1, 1, 1,
0.1763091, -0.2531554, 1.756017, 1, 1, 1, 1, 1,
0.1798404, 3.342196, 0.3033696, 1, 1, 1, 1, 1,
0.1908004, 1.06431, 0.940059, 1, 1, 1, 1, 1,
0.1908029, 0.6431283, 0.9879326, 1, 1, 1, 1, 1,
0.1930526, 1.676625, 0.193552, 1, 1, 1, 1, 1,
0.1958514, -0.2836493, 2.561042, 1, 1, 1, 1, 1,
0.1978784, 0.1196766, -0.1361933, 1, 1, 1, 1, 1,
0.1982299, 0.08942237, 2.774944, 1, 1, 1, 1, 1,
0.2012423, -1.783978, 1.79747, 0, 0, 1, 1, 1,
0.2027658, 1.448532, -0.04050963, 1, 0, 0, 1, 1,
0.2083072, 0.8386067, 0.6179457, 1, 0, 0, 1, 1,
0.2105393, 0.5957385, -0.03878323, 1, 0, 0, 1, 1,
0.2117749, 1.339862, 0.0556116, 1, 0, 0, 1, 1,
0.2160523, -0.1641602, 2.80092, 1, 0, 0, 1, 1,
0.2178288, 1.255223, 0.07854192, 0, 0, 0, 1, 1,
0.2189377, -0.5404932, 3.296475, 0, 0, 0, 1, 1,
0.2209817, -1.028716, 4.51266, 0, 0, 0, 1, 1,
0.2226489, -1.07878, 2.329193, 0, 0, 0, 1, 1,
0.2313779, 0.1423711, 0.7184896, 0, 0, 0, 1, 1,
0.2334288, -0.7472586, 3.386038, 0, 0, 0, 1, 1,
0.2361304, 1.101561, -0.008282837, 0, 0, 0, 1, 1,
0.2372793, -0.0506535, 2.764965, 1, 1, 1, 1, 1,
0.2374231, 0.950344, -0.0004941227, 1, 1, 1, 1, 1,
0.241126, -2.104842, 3.422537, 1, 1, 1, 1, 1,
0.242257, -0.2957603, 2.697658, 1, 1, 1, 1, 1,
0.2468203, 0.03238873, 0.9483215, 1, 1, 1, 1, 1,
0.246841, 0.167873, -0.8267035, 1, 1, 1, 1, 1,
0.2479194, 0.2250733, 0.4171489, 1, 1, 1, 1, 1,
0.2505857, 1.422347, 0.2892458, 1, 1, 1, 1, 1,
0.2591628, 0.4052593, 0.07252166, 1, 1, 1, 1, 1,
0.2612869, -1.187429, 2.458827, 1, 1, 1, 1, 1,
0.2636475, -0.6105459, 2.434375, 1, 1, 1, 1, 1,
0.2643801, 0.2355583, 0.3241624, 1, 1, 1, 1, 1,
0.2664816, -1.629071, 2.683833, 1, 1, 1, 1, 1,
0.2666621, -1.314124, 2.483312, 1, 1, 1, 1, 1,
0.2673934, 0.5202316, 0.1128848, 1, 1, 1, 1, 1,
0.2686252, 1.509701, -0.5194718, 0, 0, 1, 1, 1,
0.2693426, -0.07197586, -0.5898976, 1, 0, 0, 1, 1,
0.269586, -0.6645691, 3.592828, 1, 0, 0, 1, 1,
0.2707204, 0.6603864, 1.861015, 1, 0, 0, 1, 1,
0.2766051, -0.9684566, 3.692878, 1, 0, 0, 1, 1,
0.2778555, 0.6114688, 1.30474, 1, 0, 0, 1, 1,
0.2779538, -0.3364429, 2.318605, 0, 0, 0, 1, 1,
0.2805611, -0.6685659, 1.016858, 0, 0, 0, 1, 1,
0.2854939, 0.261454, 0.02046634, 0, 0, 0, 1, 1,
0.2865563, 0.9283733, -1.391264, 0, 0, 0, 1, 1,
0.2931736, -1.405072, 3.588239, 0, 0, 0, 1, 1,
0.295308, 0.349219, 2.550891, 0, 0, 0, 1, 1,
0.2981771, -0.3217666, 1.004873, 0, 0, 0, 1, 1,
0.2984989, 0.4676498, 1.180923, 1, 1, 1, 1, 1,
0.305371, 0.2355966, -0.1104113, 1, 1, 1, 1, 1,
0.3056617, -0.4487844, 1.262479, 1, 1, 1, 1, 1,
0.3083514, 2.570873, 0.5126436, 1, 1, 1, 1, 1,
0.3086463, 0.2615746, 0.8523352, 1, 1, 1, 1, 1,
0.3096092, 0.09908996, 2.230357, 1, 1, 1, 1, 1,
0.3106666, 1.618656, 0.3542487, 1, 1, 1, 1, 1,
0.3108657, 0.1243497, -1.288172, 1, 1, 1, 1, 1,
0.3110986, 1.283072, 0.5471224, 1, 1, 1, 1, 1,
0.3169414, 0.4379275, 0.8650478, 1, 1, 1, 1, 1,
0.317711, 0.009674208, 2.104742, 1, 1, 1, 1, 1,
0.3231301, 0.4150321, 0.02177856, 1, 1, 1, 1, 1,
0.3315596, 0.5777194, 0.2845066, 1, 1, 1, 1, 1,
0.3316728, 0.682288, 0.9899476, 1, 1, 1, 1, 1,
0.3325289, -1.655509, 4.294866, 1, 1, 1, 1, 1,
0.3325645, 0.860234, 0.9815446, 0, 0, 1, 1, 1,
0.3331854, -0.7780164, 3.877096, 1, 0, 0, 1, 1,
0.3368183, -0.4074809, 1.689618, 1, 0, 0, 1, 1,
0.3429859, 0.1726526, 0.3277445, 1, 0, 0, 1, 1,
0.3485228, 0.7283674, -0.5354013, 1, 0, 0, 1, 1,
0.3487324, 1.698896, 0.3259885, 1, 0, 0, 1, 1,
0.3515747, -0.7734386, 3.220956, 0, 0, 0, 1, 1,
0.3536424, 0.5169584, 0.5827492, 0, 0, 0, 1, 1,
0.3576589, 0.7017105, 0.201609, 0, 0, 0, 1, 1,
0.3607118, -1.116081, 4.387021, 0, 0, 0, 1, 1,
0.3619848, -0.2818076, 1.467534, 0, 0, 0, 1, 1,
0.3655374, -0.6656607, 1.561067, 0, 0, 0, 1, 1,
0.3691095, -1.027875, 4.069818, 0, 0, 0, 1, 1,
0.3696347, 2.957062, -0.4560075, 1, 1, 1, 1, 1,
0.3703655, -0.1661681, 2.919655, 1, 1, 1, 1, 1,
0.3707426, 0.09241967, 0.0588767, 1, 1, 1, 1, 1,
0.3724983, -1.28022, 2.570538, 1, 1, 1, 1, 1,
0.3760209, -0.4065855, 0.6625817, 1, 1, 1, 1, 1,
0.3772425, 0.1325924, 0.04159836, 1, 1, 1, 1, 1,
0.3778833, 0.3753792, 0.9612358, 1, 1, 1, 1, 1,
0.3815405, 0.2627139, 2.40811, 1, 1, 1, 1, 1,
0.3875196, 0.7902622, 0.1552708, 1, 1, 1, 1, 1,
0.3888375, 0.6979828, 0.05536725, 1, 1, 1, 1, 1,
0.3893517, -0.458902, 2.820709, 1, 1, 1, 1, 1,
0.3959901, -1.001529, 3.64782, 1, 1, 1, 1, 1,
0.3966559, 0.08002856, 0.6053774, 1, 1, 1, 1, 1,
0.3978825, -0.6278732, 2.751156, 1, 1, 1, 1, 1,
0.4060427, -0.2015607, 1.888796, 1, 1, 1, 1, 1,
0.4140304, 0.9409203, 0.201048, 0, 0, 1, 1, 1,
0.4154527, 1.008164, -0.8233953, 1, 0, 0, 1, 1,
0.4181626, 1.856024, -0.3952349, 1, 0, 0, 1, 1,
0.4201035, -1.989841, 3.381855, 1, 0, 0, 1, 1,
0.4206133, 2.357174, -0.2871656, 1, 0, 0, 1, 1,
0.4217413, 1.047627, 0.2821822, 1, 0, 0, 1, 1,
0.4218851, -0.09890179, 2.056162, 0, 0, 0, 1, 1,
0.4223338, -0.8318513, 2.720443, 0, 0, 0, 1, 1,
0.4248405, 0.5458115, 1.090714, 0, 0, 0, 1, 1,
0.4333312, -1.278901, 3.941594, 0, 0, 0, 1, 1,
0.4341641, -0.04370484, 3.235758, 0, 0, 0, 1, 1,
0.4360068, 1.141332, 0.3087983, 0, 0, 0, 1, 1,
0.443788, -0.08104259, 1.769311, 0, 0, 0, 1, 1,
0.4443978, -0.6487173, 2.764172, 1, 1, 1, 1, 1,
0.4519919, -1.471291, 1.251166, 1, 1, 1, 1, 1,
0.4523698, 0.7746802, 1.742634, 1, 1, 1, 1, 1,
0.455657, 0.1640681, 1.484895, 1, 1, 1, 1, 1,
0.4561259, 0.5228524, 0.2407008, 1, 1, 1, 1, 1,
0.462279, -1.169321, 1.599913, 1, 1, 1, 1, 1,
0.4626914, 1.853233, 1.011339, 1, 1, 1, 1, 1,
0.4628651, -0.5685711, 2.1259, 1, 1, 1, 1, 1,
0.4631499, 0.08937769, -0.1321313, 1, 1, 1, 1, 1,
0.4664436, 0.6934196, 2.154617, 1, 1, 1, 1, 1,
0.4673839, 0.09616955, 0.9052598, 1, 1, 1, 1, 1,
0.4687876, -0.4982054, 1.177713, 1, 1, 1, 1, 1,
0.4762994, 0.2941557, -0.4511018, 1, 1, 1, 1, 1,
0.4767406, -1.550609, 4.573168, 1, 1, 1, 1, 1,
0.4788209, 0.1857915, 0.8024852, 1, 1, 1, 1, 1,
0.485628, -0.1496003, 2.796854, 0, 0, 1, 1, 1,
0.4879387, 1.975139, 0.1637104, 1, 0, 0, 1, 1,
0.4881137, -1.201297, 1.327537, 1, 0, 0, 1, 1,
0.4888947, 0.01719311, 3.195614, 1, 0, 0, 1, 1,
0.4904641, -0.5350654, 1.616582, 1, 0, 0, 1, 1,
0.4906345, 1.743715, 0.9159435, 1, 0, 0, 1, 1,
0.4950925, 0.1014835, 0.4080333, 0, 0, 0, 1, 1,
0.5054003, 1.520061, 0.603125, 0, 0, 0, 1, 1,
0.5076043, -0.8194495, 1.732834, 0, 0, 0, 1, 1,
0.5083946, -2.012751, 1.325838, 0, 0, 0, 1, 1,
0.5117974, 0.3014184, 2.054329, 0, 0, 0, 1, 1,
0.5158298, 0.7154509, 0.9554142, 0, 0, 0, 1, 1,
0.5166531, 0.2910748, 1.215311, 0, 0, 0, 1, 1,
0.5221276, -0.1889929, 0.3589965, 1, 1, 1, 1, 1,
0.5225312, 0.09929935, 0.9174523, 1, 1, 1, 1, 1,
0.5236319, 1.316755, -0.07602645, 1, 1, 1, 1, 1,
0.5312731, -0.8584694, 3.56034, 1, 1, 1, 1, 1,
0.5330236, -2.815988, 3.379241, 1, 1, 1, 1, 1,
0.5341142, -0.367312, 2.539868, 1, 1, 1, 1, 1,
0.5363736, 0.2074573, 2.933462, 1, 1, 1, 1, 1,
0.5427512, -0.146105, -0.1012929, 1, 1, 1, 1, 1,
0.542873, 0.897266, -0.01747008, 1, 1, 1, 1, 1,
0.5443358, -1.909125, 2.497942, 1, 1, 1, 1, 1,
0.5499539, -0.2725814, 1.920443, 1, 1, 1, 1, 1,
0.5500785, 0.1440259, 2.617885, 1, 1, 1, 1, 1,
0.5553508, -0.119809, 2.002961, 1, 1, 1, 1, 1,
0.5716636, -2.430658, 4.087989, 1, 1, 1, 1, 1,
0.5804017, 0.1803406, 2.087707, 1, 1, 1, 1, 1,
0.5816966, -1.906607, 3.253613, 0, 0, 1, 1, 1,
0.5845974, 0.06345246, 2.769347, 1, 0, 0, 1, 1,
0.5873719, -0.3697712, 2.931952, 1, 0, 0, 1, 1,
0.5935595, -0.7542146, 2.11414, 1, 0, 0, 1, 1,
0.5957391, -1.307363, 3.376466, 1, 0, 0, 1, 1,
0.5965661, 0.4618877, -1.028239, 1, 0, 0, 1, 1,
0.5970162, 0.4034863, 1.539258, 0, 0, 0, 1, 1,
0.6025236, 0.5482122, 0.6962331, 0, 0, 0, 1, 1,
0.6026402, -0.2633599, 1.350509, 0, 0, 0, 1, 1,
0.6066734, -0.6024969, 0.438852, 0, 0, 0, 1, 1,
0.6073011, 0.1044697, 1.487291, 0, 0, 0, 1, 1,
0.6079853, 0.5878814, 1.666531, 0, 0, 0, 1, 1,
0.6144915, 0.06814919, 1.400889, 0, 0, 0, 1, 1,
0.6166935, 1.000127, 0.2074842, 1, 1, 1, 1, 1,
0.6200499, -1.701727, 1.45806, 1, 1, 1, 1, 1,
0.6241856, -0.2463011, 1.752547, 1, 1, 1, 1, 1,
0.6274267, 0.1221279, 1.240216, 1, 1, 1, 1, 1,
0.6280861, -0.04278106, 1.111426, 1, 1, 1, 1, 1,
0.6330834, -0.1879475, 1.622394, 1, 1, 1, 1, 1,
0.6462139, 1.364933, 0.6551812, 1, 1, 1, 1, 1,
0.6468639, -0.3469135, 3.228515, 1, 1, 1, 1, 1,
0.6476592, -0.1255693, 0.7176715, 1, 1, 1, 1, 1,
0.6477109, 1.120757, 1.210678, 1, 1, 1, 1, 1,
0.6484461, 1.237754, 0.3869384, 1, 1, 1, 1, 1,
0.6503308, 0.3491524, 2.759534, 1, 1, 1, 1, 1,
0.650692, 2.661962, 0.7700835, 1, 1, 1, 1, 1,
0.6514303, 0.08638742, 0.7090554, 1, 1, 1, 1, 1,
0.6562382, 1.135307, 1.255014, 1, 1, 1, 1, 1,
0.6602404, -0.6556062, 3.460323, 0, 0, 1, 1, 1,
0.6632435, -0.9564744, 2.191946, 1, 0, 0, 1, 1,
0.6642361, 0.3428596, 1.461346, 1, 0, 0, 1, 1,
0.6676326, 0.2904347, 0.1660039, 1, 0, 0, 1, 1,
0.6689017, -0.512971, 0.1779386, 1, 0, 0, 1, 1,
0.6707211, -0.5180135, 4.097005, 1, 0, 0, 1, 1,
0.6719338, 1.052968, 2.487553, 0, 0, 0, 1, 1,
0.6784216, 1.186919, 0.2390575, 0, 0, 0, 1, 1,
0.6814706, -0.7216689, 3.924097, 0, 0, 0, 1, 1,
0.6824586, 0.522305, 0.535404, 0, 0, 0, 1, 1,
0.6867955, -2.269667, 4.188681, 0, 0, 0, 1, 1,
0.6910486, -0.1585633, 1.532477, 0, 0, 0, 1, 1,
0.6910558, -0.3021991, 0.8920113, 0, 0, 0, 1, 1,
0.6922618, 1.139271, -0.1322266, 1, 1, 1, 1, 1,
0.70124, 0.05461634, 2.692763, 1, 1, 1, 1, 1,
0.7012506, 0.7682089, -0.0335505, 1, 1, 1, 1, 1,
0.7049029, 0.6945747, 0.5703651, 1, 1, 1, 1, 1,
0.7068915, -0.6931937, 2.649235, 1, 1, 1, 1, 1,
0.7174999, -0.6369002, 2.179384, 1, 1, 1, 1, 1,
0.7191532, 0.8322214, -2.142618, 1, 1, 1, 1, 1,
0.7279853, -0.3314962, 1.232406, 1, 1, 1, 1, 1,
0.7295438, 1.453436, 2.390516, 1, 1, 1, 1, 1,
0.7302507, -0.3412808, 1.984334, 1, 1, 1, 1, 1,
0.7365074, -0.6384539, 2.533023, 1, 1, 1, 1, 1,
0.7368613, -1.507105, 0.7896601, 1, 1, 1, 1, 1,
0.7395052, 1.053734, 0.7311693, 1, 1, 1, 1, 1,
0.7399303, 0.3156188, 1.719984, 1, 1, 1, 1, 1,
0.7466891, 1.254757, 0.7333462, 1, 1, 1, 1, 1,
0.7469677, -1.641613, 2.071829, 0, 0, 1, 1, 1,
0.7484546, 0.416178, 0.7604658, 1, 0, 0, 1, 1,
0.7492678, -0.8594916, 2.204703, 1, 0, 0, 1, 1,
0.7517191, -0.2929763, 2.326086, 1, 0, 0, 1, 1,
0.7537647, -0.3696702, 1.344359, 1, 0, 0, 1, 1,
0.7580721, 0.6876318, -0.3850088, 1, 0, 0, 1, 1,
0.759288, 0.2361543, 1.793038, 0, 0, 0, 1, 1,
0.7649132, 0.1053007, 2.181647, 0, 0, 0, 1, 1,
0.7671045, -0.2228467, 1.552158, 0, 0, 0, 1, 1,
0.7676133, -1.896971, 4.246219, 0, 0, 0, 1, 1,
0.7698595, 0.8408726, -0.02617804, 0, 0, 0, 1, 1,
0.7727758, 0.248673, -0.729439, 0, 0, 0, 1, 1,
0.7753482, 0.2053757, 2.029613, 0, 0, 0, 1, 1,
0.7761732, -0.7192336, 3.106376, 1, 1, 1, 1, 1,
0.7765862, -0.5412275, 2.428954, 1, 1, 1, 1, 1,
0.7882591, -0.0835567, 1.889418, 1, 1, 1, 1, 1,
0.7914968, -1.136416, 2.497071, 1, 1, 1, 1, 1,
0.7921875, -0.9171866, 2.778918, 1, 1, 1, 1, 1,
0.7924972, 0.3788529, 0.9873807, 1, 1, 1, 1, 1,
0.7925087, 1.047995, 1.660927, 1, 1, 1, 1, 1,
0.7965026, 0.9370061, 2.275573, 1, 1, 1, 1, 1,
0.7973567, -0.07030149, 2.613451, 1, 1, 1, 1, 1,
0.8015322, -0.175251, 2.243944, 1, 1, 1, 1, 1,
0.8030137, -0.1311609, 1.981452, 1, 1, 1, 1, 1,
0.8165565, -0.8286622, 2.30272, 1, 1, 1, 1, 1,
0.8203699, 1.211, -0.5334426, 1, 1, 1, 1, 1,
0.8244429, -0.7696226, 1.811015, 1, 1, 1, 1, 1,
0.8251039, 2.460643, 0.8059756, 1, 1, 1, 1, 1,
0.8280654, 0.6569205, -0.728964, 0, 0, 1, 1, 1,
0.8305719, -0.8565654, 4.044674, 1, 0, 0, 1, 1,
0.833451, -1.184972, 4.080832, 1, 0, 0, 1, 1,
0.834972, 0.90619, -0.08781851, 1, 0, 0, 1, 1,
0.8353957, 1.089584, 0.6346356, 1, 0, 0, 1, 1,
0.8361518, -0.5374732, 1.906062, 1, 0, 0, 1, 1,
0.8389858, -0.4346034, 2.397541, 0, 0, 0, 1, 1,
0.8399703, -0.608928, 2.970266, 0, 0, 0, 1, 1,
0.8401805, 1.281559, 0.05172499, 0, 0, 0, 1, 1,
0.8438044, -1.34445, 2.043519, 0, 0, 0, 1, 1,
0.8564251, 0.5279731, 3.411734, 0, 0, 0, 1, 1,
0.8585825, -0.5507337, 1.701178, 0, 0, 0, 1, 1,
0.8589609, -0.04991251, 1.727005, 0, 0, 0, 1, 1,
0.862368, -1.050667, 3.119183, 1, 1, 1, 1, 1,
0.8630852, -0.5888608, 3.672956, 1, 1, 1, 1, 1,
0.8664663, -0.6670572, 2.442757, 1, 1, 1, 1, 1,
0.8667424, -0.6604844, 2.500109, 1, 1, 1, 1, 1,
0.8695669, 1.797166, 0.4824326, 1, 1, 1, 1, 1,
0.8700082, 1.13125, -1.027588, 1, 1, 1, 1, 1,
0.8735518, 0.5252095, 1.981488, 1, 1, 1, 1, 1,
0.8743318, 1.981242, -0.001080226, 1, 1, 1, 1, 1,
0.8847358, -0.2432578, 0.4949203, 1, 1, 1, 1, 1,
0.8864521, -2.338974, 2.570636, 1, 1, 1, 1, 1,
0.8914752, -0.316049, 1.893731, 1, 1, 1, 1, 1,
0.8925836, -1.639259, 2.803003, 1, 1, 1, 1, 1,
0.8937649, 0.495453, 0.1080813, 1, 1, 1, 1, 1,
0.8985351, 1.173262, 1.127378, 1, 1, 1, 1, 1,
0.9031976, -1.068778, 2.907301, 1, 1, 1, 1, 1,
0.9034441, 1.623883, -0.2217282, 0, 0, 1, 1, 1,
0.9081753, -1.76539, 2.402281, 1, 0, 0, 1, 1,
0.9119964, 1.305255, 1.173282, 1, 0, 0, 1, 1,
0.9213523, -0.8913059, 2.05361, 1, 0, 0, 1, 1,
0.9252937, -0.2051201, 0.9443434, 1, 0, 0, 1, 1,
0.9273698, -2.208811, 2.471329, 1, 0, 0, 1, 1,
0.9274496, 1.839924, -0.2464938, 0, 0, 0, 1, 1,
0.9278705, -0.9180693, 0.9708048, 0, 0, 0, 1, 1,
0.937229, 0.7751935, 1.575571, 0, 0, 0, 1, 1,
0.941292, 0.713511, 0.5751169, 0, 0, 0, 1, 1,
0.9432819, 0.9905804, 1.155389, 0, 0, 0, 1, 1,
0.9452267, -0.003338574, -0.7271672, 0, 0, 0, 1, 1,
0.9457561, -0.8783563, 0.4481001, 0, 0, 0, 1, 1,
0.9463298, 0.5111672, -0.1658204, 1, 1, 1, 1, 1,
0.9477007, -0.6094522, 1.484913, 1, 1, 1, 1, 1,
0.9496005, -0.2923993, 3.036716, 1, 1, 1, 1, 1,
0.9529377, 0.4755647, 0.5907229, 1, 1, 1, 1, 1,
0.9553053, -0.5126177, 1.822532, 1, 1, 1, 1, 1,
0.9565552, -0.556861, 3.41346, 1, 1, 1, 1, 1,
0.9571365, -0.08429542, 1.482712, 1, 1, 1, 1, 1,
0.9618123, -0.725098, 1.36238, 1, 1, 1, 1, 1,
0.9646767, -1.551079, 1.847232, 1, 1, 1, 1, 1,
0.9688185, 1.481047, -0.614376, 1, 1, 1, 1, 1,
0.9714385, 1.780831, -1.164458, 1, 1, 1, 1, 1,
0.9734801, 2.074486, -0.8264199, 1, 1, 1, 1, 1,
0.9779173, 0.3546713, 0.910588, 1, 1, 1, 1, 1,
0.9797793, 1.221555, 0.1531243, 1, 1, 1, 1, 1,
0.9839394, 0.6658091, 1.434766, 1, 1, 1, 1, 1,
0.9901479, -0.3124912, 2.286386, 0, 0, 1, 1, 1,
0.9946401, -0.05226158, 0.269978, 1, 0, 0, 1, 1,
0.9949314, 0.8103874, 1.524916, 1, 0, 0, 1, 1,
1.013157, -1.755671, 4.283205, 1, 0, 0, 1, 1,
1.014151, -2.343781, 3.049783, 1, 0, 0, 1, 1,
1.016398, 0.1152081, 1.695015, 1, 0, 0, 1, 1,
1.020723, 0.6692058, 0.3794315, 0, 0, 0, 1, 1,
1.022577, 0.6923845, 1.074073, 0, 0, 0, 1, 1,
1.02318, 1.718137, 2.312921, 0, 0, 0, 1, 1,
1.027209, -1.546909, 3.074701, 0, 0, 0, 1, 1,
1.031096, 0.3443126, 2.64621, 0, 0, 0, 1, 1,
1.031519, -0.5975803, 1.491189, 0, 0, 0, 1, 1,
1.039907, 0.1996785, 2.926429, 0, 0, 0, 1, 1,
1.046634, -0.9958376, 2.031567, 1, 1, 1, 1, 1,
1.046654, -0.1864617, 0.1388191, 1, 1, 1, 1, 1,
1.054921, -0.5700568, 1.311416, 1, 1, 1, 1, 1,
1.056477, 0.6695917, 1.569821, 1, 1, 1, 1, 1,
1.068168, 2.255388, 0.9140798, 1, 1, 1, 1, 1,
1.070572, -2.004126, 1.890471, 1, 1, 1, 1, 1,
1.072504, 0.7319002, 1.353256, 1, 1, 1, 1, 1,
1.081171, 1.760535, -0.829859, 1, 1, 1, 1, 1,
1.091741, 0.8965753, -0.5287515, 1, 1, 1, 1, 1,
1.096001, -0.9089924, 2.785509, 1, 1, 1, 1, 1,
1.099975, -0.9934294, 3.269874, 1, 1, 1, 1, 1,
1.107906, -1.090928, 3.77439, 1, 1, 1, 1, 1,
1.114687, 0.8655992, 0.8052943, 1, 1, 1, 1, 1,
1.115436, 0.9680221, 1.366617, 1, 1, 1, 1, 1,
1.116533, 0.2012442, 0.4720215, 1, 1, 1, 1, 1,
1.120121, 1.260264, 0.9890571, 0, 0, 1, 1, 1,
1.122508, -0.7684488, 2.060913, 1, 0, 0, 1, 1,
1.139091, -0.8787132, 1.527832, 1, 0, 0, 1, 1,
1.143291, 2.021546, 0.07137585, 1, 0, 0, 1, 1,
1.156025, -0.1787174, 1.417012, 1, 0, 0, 1, 1,
1.166925, 0.2966169, 0.6420912, 1, 0, 0, 1, 1,
1.176278, 0.4603484, 0.2211592, 0, 0, 0, 1, 1,
1.179327, 1.392843, 2.311593, 0, 0, 0, 1, 1,
1.183647, 0.2642788, 0.8827693, 0, 0, 0, 1, 1,
1.185066, 0.3674158, 1.114365, 0, 0, 0, 1, 1,
1.187879, 0.2191744, 0.6547662, 0, 0, 0, 1, 1,
1.192336, 0.7488367, 1.684289, 0, 0, 0, 1, 1,
1.200174, -1.021867, 1.632792, 0, 0, 0, 1, 1,
1.202464, 0.6788982, -0.1248258, 1, 1, 1, 1, 1,
1.2062, -1.02416, 4.234824, 1, 1, 1, 1, 1,
1.206335, -0.5838932, 1.407932, 1, 1, 1, 1, 1,
1.210414, 0.9656472, 1.302224, 1, 1, 1, 1, 1,
1.211437, -0.653143, 2.729106, 1, 1, 1, 1, 1,
1.213199, 0.2200366, 0.4054688, 1, 1, 1, 1, 1,
1.216248, 0.1664895, 2.350776, 1, 1, 1, 1, 1,
1.217042, -0.2417117, -0.1772082, 1, 1, 1, 1, 1,
1.220495, 1.520188, 1.115735, 1, 1, 1, 1, 1,
1.223097, 0.1568095, 1.417206, 1, 1, 1, 1, 1,
1.223295, -0.6844928, 4.308296, 1, 1, 1, 1, 1,
1.224734, 0.4550913, 0.752848, 1, 1, 1, 1, 1,
1.227842, -2.448075, 2.947057, 1, 1, 1, 1, 1,
1.230675, -3.119242, 2.778288, 1, 1, 1, 1, 1,
1.231895, -1.566957, 3.2315, 1, 1, 1, 1, 1,
1.232001, -0.3275804, 0.9747501, 0, 0, 1, 1, 1,
1.232282, 0.1525422, 0.4587881, 1, 0, 0, 1, 1,
1.246683, 0.5486578, 2.801722, 1, 0, 0, 1, 1,
1.249366, -0.7979796, 3.759543, 1, 0, 0, 1, 1,
1.253093, 0.3051477, 2.271617, 1, 0, 0, 1, 1,
1.257808, 1.625015, -0.649762, 1, 0, 0, 1, 1,
1.271193, -2.346828, 2.076931, 0, 0, 0, 1, 1,
1.271974, -0.2903514, 0.5965003, 0, 0, 0, 1, 1,
1.272363, -0.9794359, 2.28549, 0, 0, 0, 1, 1,
1.277464, -0.3760072, 3.970612, 0, 0, 0, 1, 1,
1.280429, 1.107275, 0.02243146, 0, 0, 0, 1, 1,
1.281977, -2.901106, 3.651612, 0, 0, 0, 1, 1,
1.308435, 0.6078349, 3.445864, 0, 0, 0, 1, 1,
1.311053, -1.967544, 3.25515, 1, 1, 1, 1, 1,
1.315568, -1.587761, 2.892836, 1, 1, 1, 1, 1,
1.331572, 2.318909, 1.359145, 1, 1, 1, 1, 1,
1.342165, -0.4805907, 0.904146, 1, 1, 1, 1, 1,
1.342485, -0.9239202, 4.422626, 1, 1, 1, 1, 1,
1.350718, 0.3984263, 1.839397, 1, 1, 1, 1, 1,
1.36094, 0.9710031, 0.6379382, 1, 1, 1, 1, 1,
1.36108, -0.1995129, 3.889311, 1, 1, 1, 1, 1,
1.370078, 0.02917846, 1.350753, 1, 1, 1, 1, 1,
1.374462, -1.659785, 3.020319, 1, 1, 1, 1, 1,
1.389769, -0.5077158, 2.50499, 1, 1, 1, 1, 1,
1.389896, -1.01361, 1.276725, 1, 1, 1, 1, 1,
1.395673, -0.05783694, 0.005340226, 1, 1, 1, 1, 1,
1.396768, 0.2967909, -0.2244224, 1, 1, 1, 1, 1,
1.404462, 0.4331053, 3.67851, 1, 1, 1, 1, 1,
1.407116, -0.152092, 2.828287, 0, 0, 1, 1, 1,
1.418022, 1.642629, 0.8589495, 1, 0, 0, 1, 1,
1.42513, -0.178161, 2.731997, 1, 0, 0, 1, 1,
1.427673, 0.04770948, 1.551986, 1, 0, 0, 1, 1,
1.441429, -0.2446771, 2.237816, 1, 0, 0, 1, 1,
1.442291, 1.109336, 0.9393151, 1, 0, 0, 1, 1,
1.455672, -0.20415, 1.76746, 0, 0, 0, 1, 1,
1.464469, -1.109471, 1.911883, 0, 0, 0, 1, 1,
1.466608, 0.2500673, 1.500454, 0, 0, 0, 1, 1,
1.467785, 0.9011729, 0.465043, 0, 0, 0, 1, 1,
1.468586, -0.3353207, 1.576631, 0, 0, 0, 1, 1,
1.479991, -0.4765243, 1.061782, 0, 0, 0, 1, 1,
1.488039, -0.8038278, 2.808118, 0, 0, 0, 1, 1,
1.489159, -0.02075141, 1.972604, 1, 1, 1, 1, 1,
1.496079, -1.16335, 3.484284, 1, 1, 1, 1, 1,
1.50787, -0.314133, 1.93787, 1, 1, 1, 1, 1,
1.508633, 1.100369, 0.9161606, 1, 1, 1, 1, 1,
1.532406, -0.8799021, 0.5422854, 1, 1, 1, 1, 1,
1.538096, 1.570005, 0.217644, 1, 1, 1, 1, 1,
1.538545, -1.829045, 2.849753, 1, 1, 1, 1, 1,
1.541048, -1.052901, 4.177396, 1, 1, 1, 1, 1,
1.567617, -0.4844199, 1.15386, 1, 1, 1, 1, 1,
1.570819, -0.3878543, 2.151352, 1, 1, 1, 1, 1,
1.577906, -1.517135, 3.509499, 1, 1, 1, 1, 1,
1.584319, -0.1864783, 2.708221, 1, 1, 1, 1, 1,
1.597803, -2.221465, 3.490739, 1, 1, 1, 1, 1,
1.609337, -1.759171, 3.233453, 1, 1, 1, 1, 1,
1.609974, 0.2571524, 1.267993, 1, 1, 1, 1, 1,
1.626858, 0.4180076, 1.188362, 0, 0, 1, 1, 1,
1.640688, -0.5287421, 1.097551, 1, 0, 0, 1, 1,
1.663614, 1.07088, -0.3953495, 1, 0, 0, 1, 1,
1.666224, 0.2820459, 1.265954, 1, 0, 0, 1, 1,
1.681175, 0.8205113, 0.3553872, 1, 0, 0, 1, 1,
1.683259, -0.7629219, 2.634086, 1, 0, 0, 1, 1,
1.685392, -3.357321, 1.892786, 0, 0, 0, 1, 1,
1.687806, 0.03571377, 0.7821438, 0, 0, 0, 1, 1,
1.689777, -0.869005, 2.010572, 0, 0, 0, 1, 1,
1.6931, -0.01415379, 1.92423, 0, 0, 0, 1, 1,
1.728518, 0.8136895, 0.4530678, 0, 0, 0, 1, 1,
1.746327, -0.2409893, 1.201656, 0, 0, 0, 1, 1,
1.754008, 1.281302, 0.0808218, 0, 0, 0, 1, 1,
1.755671, 1.46495, 0.3932319, 1, 1, 1, 1, 1,
1.760023, -0.186785, 1.018236, 1, 1, 1, 1, 1,
1.765847, -1.269461, 3.269149, 1, 1, 1, 1, 1,
1.777999, 2.059716, 1.070953, 1, 1, 1, 1, 1,
1.785509, 0.05713088, 3.545212, 1, 1, 1, 1, 1,
1.804944, -1.366925, 1.160204, 1, 1, 1, 1, 1,
1.817146, -2.468826, 2.521927, 1, 1, 1, 1, 1,
1.849847, -0.3848052, 0.005045747, 1, 1, 1, 1, 1,
1.878752, 1.187392, 1.999561, 1, 1, 1, 1, 1,
1.885158, 0.682344, 1.931283, 1, 1, 1, 1, 1,
1.889252, 1.773973, 2.246205, 1, 1, 1, 1, 1,
1.910033, 0.1536132, 2.026191, 1, 1, 1, 1, 1,
1.91713, -0.2323121, 1.437342, 1, 1, 1, 1, 1,
1.927206, -0.1410285, 0.8346226, 1, 1, 1, 1, 1,
1.976789, 0.04939994, 0.1714178, 1, 1, 1, 1, 1,
1.988612, -0.5672606, 3.238191, 0, 0, 1, 1, 1,
2.004489, -0.8019035, 1.694589, 1, 0, 0, 1, 1,
2.012599, -0.06557789, 0.777557, 1, 0, 0, 1, 1,
2.037844, 0.04903631, 0.2089849, 1, 0, 0, 1, 1,
2.06283, 0.2294352, 1.206273, 1, 0, 0, 1, 1,
2.080491, 0.5999597, 0.9632951, 1, 0, 0, 1, 1,
2.09202, 0.6314575, 1.656276, 0, 0, 0, 1, 1,
2.116754, -0.5486069, 1.975061, 0, 0, 0, 1, 1,
2.120871, -0.4925804, 1.797698, 0, 0, 0, 1, 1,
2.157041, 0.3376367, 1.78678, 0, 0, 0, 1, 1,
2.217956, -0.04786143, 0.3153307, 0, 0, 0, 1, 1,
2.236389, -0.4277802, 1.187586, 0, 0, 0, 1, 1,
2.238661, -0.3453054, 3.715892, 0, 0, 0, 1, 1,
2.427772, -2.087935, 1.747433, 1, 1, 1, 1, 1,
2.492978, -0.1651147, 2.927316, 1, 1, 1, 1, 1,
2.687215, -1.030334, 2.73934, 1, 1, 1, 1, 1,
2.755061, -0.226066, 1.936698, 1, 1, 1, 1, 1,
2.769017, 0.1758634, 1.62887, 1, 1, 1, 1, 1,
3.004245, -0.8027421, 0.9803028, 1, 1, 1, 1, 1,
3.783334, -0.5741799, 1.586874, 1, 1, 1, 1, 1
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
var radius = 9.755874;
var distance = 34.26709;
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
mvMatrix.translate( -0.2231145, 0.007562637, 0.3026862 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.26709);
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
