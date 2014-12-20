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
-3.215554, 0.757302, -1.499029, 1, 0, 0, 1,
-2.910929, -0.2477981, -2.624102, 1, 0.007843138, 0, 1,
-2.895084, -0.4608332, -1.733977, 1, 0.01176471, 0, 1,
-2.647202, -0.09916212, -0.9307519, 1, 0.01960784, 0, 1,
-2.564316, 1.523136, -1.053915, 1, 0.02352941, 0, 1,
-2.450199, -1.333441, -1.927689, 1, 0.03137255, 0, 1,
-2.434184, -1.359432, -2.059688, 1, 0.03529412, 0, 1,
-2.37796, 0.05957567, -0.6609025, 1, 0.04313726, 0, 1,
-2.35997, -0.7794701, -2.648554, 1, 0.04705882, 0, 1,
-2.357623, 0.4843976, -1.518021, 1, 0.05490196, 0, 1,
-2.256535, -0.2757577, -1.975239, 1, 0.05882353, 0, 1,
-2.255164, 1.079776, -2.00952, 1, 0.06666667, 0, 1,
-2.254324, 0.2869666, -1.309405, 1, 0.07058824, 0, 1,
-2.230745, 0.1603566, -1.203691, 1, 0.07843138, 0, 1,
-2.22354, -1.04669, -0.4627539, 1, 0.08235294, 0, 1,
-2.211508, 0.8684568, -1.691425, 1, 0.09019608, 0, 1,
-2.150618, -2.64004, -1.054393, 1, 0.09411765, 0, 1,
-2.137991, -0.1889325, -2.149044, 1, 0.1019608, 0, 1,
-2.108666, 1.061164, -0.7208247, 1, 0.1098039, 0, 1,
-2.10065, -0.9771031, -2.336251, 1, 0.1137255, 0, 1,
-2.092697, 1.073343, 0.1251072, 1, 0.1215686, 0, 1,
-2.051518, -0.1340835, -1.503356, 1, 0.1254902, 0, 1,
-2.041405, 1.921927, -0.5634263, 1, 0.1333333, 0, 1,
-2.032789, -0.1444586, -2.945555, 1, 0.1372549, 0, 1,
-2.004366, -1.946486, -3.466438, 1, 0.145098, 0, 1,
-1.993385, 0.8335121, -1.474471, 1, 0.1490196, 0, 1,
-1.978447, -0.09689449, -1.919742, 1, 0.1568628, 0, 1,
-1.976531, -0.4434092, -1.65649, 1, 0.1607843, 0, 1,
-1.958121, -0.1373725, -2.522981, 1, 0.1686275, 0, 1,
-1.922025, 0.6506193, -0.7552462, 1, 0.172549, 0, 1,
-1.902719, 1.101414, -1.436972, 1, 0.1803922, 0, 1,
-1.887004, 0.7639516, -1.760231, 1, 0.1843137, 0, 1,
-1.878829, 0.9393417, -0.5667851, 1, 0.1921569, 0, 1,
-1.861277, 0.3672462, 0.4908195, 1, 0.1960784, 0, 1,
-1.857345, -0.8290551, -1.722731, 1, 0.2039216, 0, 1,
-1.848764, -0.1048215, -1.09291, 1, 0.2117647, 0, 1,
-1.843457, -0.2102325, -2.83256, 1, 0.2156863, 0, 1,
-1.838098, -1.243189, -2.436881, 1, 0.2235294, 0, 1,
-1.821708, -0.5706005, -3.171901, 1, 0.227451, 0, 1,
-1.768783, 1.203535, -2.318936, 1, 0.2352941, 0, 1,
-1.747411, -0.2825214, -1.239234, 1, 0.2392157, 0, 1,
-1.740847, -0.131246, -1.143237, 1, 0.2470588, 0, 1,
-1.728328, -1.762935, -2.378825, 1, 0.2509804, 0, 1,
-1.718703, -0.08521798, -2.100984, 1, 0.2588235, 0, 1,
-1.714468, 0.2039094, -1.404048, 1, 0.2627451, 0, 1,
-1.695081, -1.129453, -1.589911, 1, 0.2705882, 0, 1,
-1.686165, -1.005017, -1.329143, 1, 0.2745098, 0, 1,
-1.685969, 0.6088697, -0.6192624, 1, 0.282353, 0, 1,
-1.671927, 0.4138824, -2.958018, 1, 0.2862745, 0, 1,
-1.668337, 0.4200164, -0.5686, 1, 0.2941177, 0, 1,
-1.65328, -0.8390508, -2.301976, 1, 0.3019608, 0, 1,
-1.636065, -1.284628, -1.861105, 1, 0.3058824, 0, 1,
-1.631993, 1.733441, -0.175708, 1, 0.3137255, 0, 1,
-1.621324, -0.6411399, -2.64136, 1, 0.3176471, 0, 1,
-1.607727, -0.006820195, -1.506306, 1, 0.3254902, 0, 1,
-1.568791, 1.072582, -0.7039215, 1, 0.3294118, 0, 1,
-1.544279, -0.7714104, -3.311497, 1, 0.3372549, 0, 1,
-1.529473, -0.02469717, -1.477644, 1, 0.3411765, 0, 1,
-1.524723, -1.187652, -2.670849, 1, 0.3490196, 0, 1,
-1.521999, 1.160272, -2.804704, 1, 0.3529412, 0, 1,
-1.517354, -0.3163261, -3.330472, 1, 0.3607843, 0, 1,
-1.5159, 1.376409, -0.4660756, 1, 0.3647059, 0, 1,
-1.515859, -0.5425783, -3.881378, 1, 0.372549, 0, 1,
-1.515103, 1.455458, -1.869959, 1, 0.3764706, 0, 1,
-1.513463, 0.5090457, -0.9888719, 1, 0.3843137, 0, 1,
-1.497137, 0.6325313, -1.046522, 1, 0.3882353, 0, 1,
-1.496034, 0.2537754, -1.605864, 1, 0.3960784, 0, 1,
-1.487905, 1.538345, -0.5147276, 1, 0.4039216, 0, 1,
-1.477658, -0.5601227, -2.307551, 1, 0.4078431, 0, 1,
-1.477476, -0.5388405, -2.034119, 1, 0.4156863, 0, 1,
-1.467334, 0.9212201, -1.366932, 1, 0.4196078, 0, 1,
-1.437415, -0.9685907, -0.9836968, 1, 0.427451, 0, 1,
-1.436042, -1.025574, -2.855386, 1, 0.4313726, 0, 1,
-1.421227, -0.04930503, -1.895935, 1, 0.4392157, 0, 1,
-1.420727, -0.486159, -2.00734, 1, 0.4431373, 0, 1,
-1.396451, 0.06843304, -0.6953623, 1, 0.4509804, 0, 1,
-1.391329, -0.5799091, -0.6836338, 1, 0.454902, 0, 1,
-1.386144, -0.4468599, -1.17224, 1, 0.4627451, 0, 1,
-1.382186, -0.3649914, -2.618253, 1, 0.4666667, 0, 1,
-1.370296, 2.512689, 0.473699, 1, 0.4745098, 0, 1,
-1.365542, 0.4871494, 0.494905, 1, 0.4784314, 0, 1,
-1.35849, -1.040073, -3.364574, 1, 0.4862745, 0, 1,
-1.35839, 0.8263981, -2.934104, 1, 0.4901961, 0, 1,
-1.355932, 1.746469, -0.2513787, 1, 0.4980392, 0, 1,
-1.352836, 1.987275, -2.026475, 1, 0.5058824, 0, 1,
-1.348482, 1.906781, -0.1453685, 1, 0.509804, 0, 1,
-1.339764, 0.130899, -1.662308, 1, 0.5176471, 0, 1,
-1.335577, 0.01014053, -0.2596217, 1, 0.5215687, 0, 1,
-1.334353, 1.426072, -1.001911, 1, 0.5294118, 0, 1,
-1.33064, -0.3747054, -0.7958207, 1, 0.5333334, 0, 1,
-1.323817, -0.3936634, -3.028596, 1, 0.5411765, 0, 1,
-1.323261, -0.9752509, -3.443531, 1, 0.5450981, 0, 1,
-1.321024, -1.195191, -0.3703826, 1, 0.5529412, 0, 1,
-1.320602, 0.4427329, -1.153769, 1, 0.5568628, 0, 1,
-1.31421, 0.8787339, 0.224962, 1, 0.5647059, 0, 1,
-1.309713, -0.9139114, -1.738785, 1, 0.5686275, 0, 1,
-1.304948, 0.2437885, -2.194551, 1, 0.5764706, 0, 1,
-1.286465, 1.456252, -0.9241117, 1, 0.5803922, 0, 1,
-1.270261, -0.9315545, -2.781714, 1, 0.5882353, 0, 1,
-1.261456, 0.4580976, -0.7016697, 1, 0.5921569, 0, 1,
-1.259989, 0.1720383, -1.679684, 1, 0.6, 0, 1,
-1.257776, -0.1035992, 0.4158935, 1, 0.6078432, 0, 1,
-1.257581, 0.7221137, -2.266444, 1, 0.6117647, 0, 1,
-1.254655, 0.2499191, -2.533214, 1, 0.6196079, 0, 1,
-1.239447, 0.5939372, -0.4572931, 1, 0.6235294, 0, 1,
-1.231832, 2.204736, -0.4866038, 1, 0.6313726, 0, 1,
-1.218191, -2.075984, -1.309978, 1, 0.6352941, 0, 1,
-1.214518, 0.1911518, -0.990594, 1, 0.6431373, 0, 1,
-1.21338, 0.5626892, 0.09233841, 1, 0.6470588, 0, 1,
-1.208827, -0.5550491, -1.939763, 1, 0.654902, 0, 1,
-1.207817, -0.395948, -1.918195, 1, 0.6588235, 0, 1,
-1.205041, 0.4402927, -0.4083366, 1, 0.6666667, 0, 1,
-1.178061, 0.459995, -0.8684381, 1, 0.6705883, 0, 1,
-1.173988, -0.4535998, -1.165235, 1, 0.6784314, 0, 1,
-1.169365, 0.1841961, -1.353484, 1, 0.682353, 0, 1,
-1.161012, 0.07841745, -2.629724, 1, 0.6901961, 0, 1,
-1.157704, -0.4809756, -1.610893, 1, 0.6941177, 0, 1,
-1.141181, 1.665665, 0.4407834, 1, 0.7019608, 0, 1,
-1.137326, -0.9019347, -2.868486, 1, 0.7098039, 0, 1,
-1.130589, -0.6970035, -2.799866, 1, 0.7137255, 0, 1,
-1.12904, 1.677667, 0.06126933, 1, 0.7215686, 0, 1,
-1.125893, -1.243716, -1.937487, 1, 0.7254902, 0, 1,
-1.124208, -1.244429, -1.378305, 1, 0.7333333, 0, 1,
-1.114929, 1.047292, 0.7393622, 1, 0.7372549, 0, 1,
-1.111007, -0.3571492, -2.091049, 1, 0.7450981, 0, 1,
-1.10442, -1.079243, -0.9627373, 1, 0.7490196, 0, 1,
-1.094347, 1.026858, 0.0420766, 1, 0.7568628, 0, 1,
-1.092092, -0.7238199, -3.013824, 1, 0.7607843, 0, 1,
-1.089564, 1.47564, -0.2254779, 1, 0.7686275, 0, 1,
-1.088784, -0.9313046, -1.196074, 1, 0.772549, 0, 1,
-1.087401, -0.8634762, -1.774191, 1, 0.7803922, 0, 1,
-1.086007, -0.4116215, -2.535738, 1, 0.7843137, 0, 1,
-1.078613, 0.08917641, -2.169436, 1, 0.7921569, 0, 1,
-1.074925, -0.5442301, -1.976837, 1, 0.7960784, 0, 1,
-1.074115, 0.223219, -2.032954, 1, 0.8039216, 0, 1,
-1.072499, -0.05977713, -2.540637, 1, 0.8117647, 0, 1,
-1.068224, 0.5094765, -1.265932, 1, 0.8156863, 0, 1,
-1.051825, -0.3025478, -3.50176, 1, 0.8235294, 0, 1,
-1.047309, -0.2153388, -1.128912, 1, 0.827451, 0, 1,
-1.044584, 0.4575607, -1.284672, 1, 0.8352941, 0, 1,
-1.04294, -1.314109, -2.707088, 1, 0.8392157, 0, 1,
-1.038348, 1.656878, -1.957807, 1, 0.8470588, 0, 1,
-1.035475, -1.161951, -1.436196, 1, 0.8509804, 0, 1,
-1.030805, 1.669734, 0.368511, 1, 0.8588235, 0, 1,
-1.030049, -0.8046782, -3.046548, 1, 0.8627451, 0, 1,
-1.029714, -0.9425229, -1.948164, 1, 0.8705882, 0, 1,
-1.025522, -1.221573, -2.305652, 1, 0.8745098, 0, 1,
-1.024313, 0.768382, -1.487417, 1, 0.8823529, 0, 1,
-1.02351, 0.624638, -0.8760096, 1, 0.8862745, 0, 1,
-1.019812, -0.5962298, -3.250492, 1, 0.8941177, 0, 1,
-1.015979, 0.5671778, 0.4458317, 1, 0.8980392, 0, 1,
-1.009023, 0.9220748, 0.5398594, 1, 0.9058824, 0, 1,
-1.002505, 1.876132, -1.305233, 1, 0.9137255, 0, 1,
-1.000071, -0.1367969, -2.702223, 1, 0.9176471, 0, 1,
-0.996765, -3.116885, -2.830327, 1, 0.9254902, 0, 1,
-0.9948736, -1.388464, -2.473611, 1, 0.9294118, 0, 1,
-0.9928349, -1.350268, -3.446661, 1, 0.9372549, 0, 1,
-0.9890925, -0.0453806, -0.4344502, 1, 0.9411765, 0, 1,
-0.9855202, 0.05800749, -1.135107, 1, 0.9490196, 0, 1,
-0.9775578, 0.07493429, -1.114115, 1, 0.9529412, 0, 1,
-0.9720246, 1.039092, -0.417091, 1, 0.9607843, 0, 1,
-0.9718933, -1.027224, -1.057968, 1, 0.9647059, 0, 1,
-0.9693841, 0.2539763, -2.798549, 1, 0.972549, 0, 1,
-0.9672151, -1.273947, -3.08831, 1, 0.9764706, 0, 1,
-0.9633528, -0.1512982, -2.50735, 1, 0.9843137, 0, 1,
-0.9615728, 0.03704001, -2.024865, 1, 0.9882353, 0, 1,
-0.9612966, -0.2639289, -1.590201, 1, 0.9960784, 0, 1,
-0.959101, 0.4383173, -1.544423, 0.9960784, 1, 0, 1,
-0.9481401, 1.329971, -0.2233046, 0.9921569, 1, 0, 1,
-0.9433377, -0.8316918, -3.165386, 0.9843137, 1, 0, 1,
-0.9378625, 0.1585675, -0.9635285, 0.9803922, 1, 0, 1,
-0.9358981, 2.203416, -1.784488, 0.972549, 1, 0, 1,
-0.9293179, -1.201644, -2.210758, 0.9686275, 1, 0, 1,
-0.9283884, 0.304828, -2.356225, 0.9607843, 1, 0, 1,
-0.921919, 0.5877753, -1.779827, 0.9568627, 1, 0, 1,
-0.9197447, 0.3386099, -1.998011, 0.9490196, 1, 0, 1,
-0.9193731, 0.7236256, 0.2508677, 0.945098, 1, 0, 1,
-0.9065651, -1.520759, -4.187601, 0.9372549, 1, 0, 1,
-0.9027073, -1.965241, -2.601657, 0.9333333, 1, 0, 1,
-0.9023473, 1.394554, -1.482975, 0.9254902, 1, 0, 1,
-0.8865751, 0.1201091, -2.424668, 0.9215686, 1, 0, 1,
-0.8834007, 1.903268, 0.43835, 0.9137255, 1, 0, 1,
-0.882201, -1.537898, -1.826781, 0.9098039, 1, 0, 1,
-0.8808749, 0.5745916, -2.127361, 0.9019608, 1, 0, 1,
-0.8735611, -0.5138505, -3.44734, 0.8941177, 1, 0, 1,
-0.8718481, 0.9613498, -1.716186, 0.8901961, 1, 0, 1,
-0.8649855, 1.225802, -1.640178, 0.8823529, 1, 0, 1,
-0.8647991, 1.230519, -0.761872, 0.8784314, 1, 0, 1,
-0.8591751, 0.827911, -0.252015, 0.8705882, 1, 0, 1,
-0.8573699, 0.3420106, -1.130092, 0.8666667, 1, 0, 1,
-0.8545657, 0.009778475, -1.822716, 0.8588235, 1, 0, 1,
-0.8543058, -1.602665, -1.547503, 0.854902, 1, 0, 1,
-0.8537831, -1.121912, -2.576582, 0.8470588, 1, 0, 1,
-0.8517603, 1.442801, -0.5764928, 0.8431373, 1, 0, 1,
-0.8506657, 0.03296404, 0.7417729, 0.8352941, 1, 0, 1,
-0.8495663, -0.3388547, -2.71464, 0.8313726, 1, 0, 1,
-0.8428409, -0.0640962, -1.747783, 0.8235294, 1, 0, 1,
-0.8342908, 0.500101, -1.027288, 0.8196079, 1, 0, 1,
-0.8341295, 0.3286797, 0.7856061, 0.8117647, 1, 0, 1,
-0.825135, 0.06122729, 1.10746, 0.8078431, 1, 0, 1,
-0.8215348, 0.2119129, -1.619855, 0.8, 1, 0, 1,
-0.8155468, 0.290871, -1.441445, 0.7921569, 1, 0, 1,
-0.8150427, -0.8782597, -2.381191, 0.7882353, 1, 0, 1,
-0.8118026, -0.2731716, -2.92597, 0.7803922, 1, 0, 1,
-0.80803, 0.2583806, -2.483647, 0.7764706, 1, 0, 1,
-0.8026809, 0.1045786, -2.041998, 0.7686275, 1, 0, 1,
-0.8009382, -0.8920962, -3.565926, 0.7647059, 1, 0, 1,
-0.7995707, 0.7521977, -2.25813, 0.7568628, 1, 0, 1,
-0.7988545, -0.7093869, -1.366237, 0.7529412, 1, 0, 1,
-0.7977769, -0.7928421, 1.122756, 0.7450981, 1, 0, 1,
-0.7967969, -0.9395467, -3.166755, 0.7411765, 1, 0, 1,
-0.793529, -1.053621, -2.762612, 0.7333333, 1, 0, 1,
-0.7865206, 0.9620351, -0.9696722, 0.7294118, 1, 0, 1,
-0.7807975, 3.038881, 0.5680165, 0.7215686, 1, 0, 1,
-0.7793446, 0.08669847, -0.7692499, 0.7176471, 1, 0, 1,
-0.7784451, -0.2980807, -0.7225292, 0.7098039, 1, 0, 1,
-0.7690421, -0.4158144, -2.436941, 0.7058824, 1, 0, 1,
-0.7655728, -0.5850129, -2.708378, 0.6980392, 1, 0, 1,
-0.7623966, -0.7331383, -2.834537, 0.6901961, 1, 0, 1,
-0.7610943, 0.657003, 0.09238011, 0.6862745, 1, 0, 1,
-0.7589111, 0.632947, -0.3044579, 0.6784314, 1, 0, 1,
-0.7567104, 0.1301105, -1.306556, 0.6745098, 1, 0, 1,
-0.7523497, -1.074397, -3.05522, 0.6666667, 1, 0, 1,
-0.7519778, 1.15083, -0.02038041, 0.6627451, 1, 0, 1,
-0.7472821, 0.2902545, -1.941073, 0.654902, 1, 0, 1,
-0.7465312, 0.1744843, -1.036753, 0.6509804, 1, 0, 1,
-0.7426029, -2.035953, -3.349544, 0.6431373, 1, 0, 1,
-0.7416254, 1.470852, -1.486286, 0.6392157, 1, 0, 1,
-0.7405403, -0.3358591, -0.245974, 0.6313726, 1, 0, 1,
-0.7403486, -2.807652, -3.287848, 0.627451, 1, 0, 1,
-0.7357125, 0.6629298, 0.479234, 0.6196079, 1, 0, 1,
-0.7328214, 0.4078343, -1.831186, 0.6156863, 1, 0, 1,
-0.7288466, 0.8969316, -2.34654, 0.6078432, 1, 0, 1,
-0.7282559, 0.6299372, -0.09929669, 0.6039216, 1, 0, 1,
-0.7262435, 0.7660051, -2.028966, 0.5960785, 1, 0, 1,
-0.725358, 0.01227214, -0.919508, 0.5882353, 1, 0, 1,
-0.7248402, 0.8428198, -0.1910147, 0.5843138, 1, 0, 1,
-0.7169172, -0.7207701, -2.336038, 0.5764706, 1, 0, 1,
-0.7159964, 2.280223, 0.7237986, 0.572549, 1, 0, 1,
-0.7156426, 0.8724228, -1.300702, 0.5647059, 1, 0, 1,
-0.7101728, -0.5892766, -2.642437, 0.5607843, 1, 0, 1,
-0.70835, -0.9294579, -0.6658944, 0.5529412, 1, 0, 1,
-0.7069888, 0.1536357, 0.08659764, 0.5490196, 1, 0, 1,
-0.7069453, -0.6307086, -0.6466574, 0.5411765, 1, 0, 1,
-0.7029494, -1.147962, -1.524746, 0.5372549, 1, 0, 1,
-0.7005997, -2.006259, -2.472413, 0.5294118, 1, 0, 1,
-0.6934713, -0.1697466, -3.014644, 0.5254902, 1, 0, 1,
-0.6893635, 1.551417, 1.495247, 0.5176471, 1, 0, 1,
-0.6854737, 0.3614814, 0.03686117, 0.5137255, 1, 0, 1,
-0.6802111, -0.3004181, -1.827207, 0.5058824, 1, 0, 1,
-0.6722096, 2.25638, 0.1546238, 0.5019608, 1, 0, 1,
-0.6702006, -0.8697243, 0.1919675, 0.4941176, 1, 0, 1,
-0.6635028, 1.178296, 0.3852925, 0.4862745, 1, 0, 1,
-0.6545103, 0.0007118257, -1.478242, 0.4823529, 1, 0, 1,
-0.6528283, 0.2856566, -0.06987602, 0.4745098, 1, 0, 1,
-0.6513547, 0.7634782, -0.1030898, 0.4705882, 1, 0, 1,
-0.6461344, -1.240499, -2.876914, 0.4627451, 1, 0, 1,
-0.6423343, 0.6279405, 0.9019643, 0.4588235, 1, 0, 1,
-0.6409763, -1.244821, -3.964417, 0.4509804, 1, 0, 1,
-0.6373664, -1.432876, -4.067506, 0.4470588, 1, 0, 1,
-0.635914, 1.400948, 1.976221, 0.4392157, 1, 0, 1,
-0.6302778, -0.185649, -2.541732, 0.4352941, 1, 0, 1,
-0.6224185, 0.4635368, -2.238423, 0.427451, 1, 0, 1,
-0.6184913, -0.1782402, -1.160262, 0.4235294, 1, 0, 1,
-0.6156598, -0.1440757, -2.166856, 0.4156863, 1, 0, 1,
-0.6147262, 2.161357, 1.319999, 0.4117647, 1, 0, 1,
-0.6094347, -0.4307295, -1.420948, 0.4039216, 1, 0, 1,
-0.5978776, -1.391664, -2.490678, 0.3960784, 1, 0, 1,
-0.5943166, 0.6330344, -2.240421, 0.3921569, 1, 0, 1,
-0.5933592, 1.406147, 0.3955048, 0.3843137, 1, 0, 1,
-0.5867737, -1.52727, -2.581178, 0.3803922, 1, 0, 1,
-0.5859746, -1.246848, -1.978616, 0.372549, 1, 0, 1,
-0.583994, 1.221654, -2.356259, 0.3686275, 1, 0, 1,
-0.5836439, 0.5326737, -0.5876318, 0.3607843, 1, 0, 1,
-0.5795273, -1.875867, -3.515209, 0.3568628, 1, 0, 1,
-0.576941, 1.986672, -0.9744941, 0.3490196, 1, 0, 1,
-0.5717831, 0.6507858, -1.325258, 0.345098, 1, 0, 1,
-0.5716581, 0.5318387, -0.5709119, 0.3372549, 1, 0, 1,
-0.565705, -1.44843, -1.970427, 0.3333333, 1, 0, 1,
-0.5643368, -1.229543, -4.065016, 0.3254902, 1, 0, 1,
-0.5589828, 0.2894053, -3.214352, 0.3215686, 1, 0, 1,
-0.5584694, -0.1197575, -2.784142, 0.3137255, 1, 0, 1,
-0.5521475, -0.004451518, -1.672994, 0.3098039, 1, 0, 1,
-0.5404787, 0.4207041, -0.998977, 0.3019608, 1, 0, 1,
-0.5398059, -0.2712344, -3.078749, 0.2941177, 1, 0, 1,
-0.5382255, -0.7665688, -3.001048, 0.2901961, 1, 0, 1,
-0.537903, 0.6560977, 0.9187551, 0.282353, 1, 0, 1,
-0.5364156, -2.449959, -3.734455, 0.2784314, 1, 0, 1,
-0.5177943, -0.4625174, -1.697946, 0.2705882, 1, 0, 1,
-0.5151736, 1.506193, -1.429816, 0.2666667, 1, 0, 1,
-0.5143587, -0.5018945, -4.011631, 0.2588235, 1, 0, 1,
-0.513895, -1.434811, -2.405828, 0.254902, 1, 0, 1,
-0.5103263, 0.7469541, -1.846583, 0.2470588, 1, 0, 1,
-0.5097029, -0.4446115, -1.411385, 0.2431373, 1, 0, 1,
-0.5081728, -1.009773, -3.217433, 0.2352941, 1, 0, 1,
-0.5049376, -1.422882, -1.453231, 0.2313726, 1, 0, 1,
-0.4956718, 2.142694, 0.9181045, 0.2235294, 1, 0, 1,
-0.4874579, 0.2323271, 0.7726135, 0.2196078, 1, 0, 1,
-0.4856432, 0.7638898, 0.3447368, 0.2117647, 1, 0, 1,
-0.4838805, 0.6091821, -1.103004, 0.2078431, 1, 0, 1,
-0.48191, -0.900539, -4.931936, 0.2, 1, 0, 1,
-0.4807771, 0.1924426, -0.4240755, 0.1921569, 1, 0, 1,
-0.4801512, -0.5296489, -2.192194, 0.1882353, 1, 0, 1,
-0.4785349, 0.9708282, -1.251415, 0.1803922, 1, 0, 1,
-0.4774625, -0.7353101, -3.74015, 0.1764706, 1, 0, 1,
-0.4737545, 2.078093, -1.405797, 0.1686275, 1, 0, 1,
-0.4728755, -1.117835, -3.786398, 0.1647059, 1, 0, 1,
-0.4674469, -0.1511203, -3.02905, 0.1568628, 1, 0, 1,
-0.4656422, 1.062067, -2.116797, 0.1529412, 1, 0, 1,
-0.4654972, -1.7695, 0.7439407, 0.145098, 1, 0, 1,
-0.4632216, -0.5032616, -2.370934, 0.1411765, 1, 0, 1,
-0.4602916, 0.3546322, -0.08317622, 0.1333333, 1, 0, 1,
-0.4592564, -0.2803319, -1.656154, 0.1294118, 1, 0, 1,
-0.4591726, 2.712228, 0.5044637, 0.1215686, 1, 0, 1,
-0.4557016, 2.108268, -0.08913642, 0.1176471, 1, 0, 1,
-0.4521144, 1.040925, 0.1909239, 0.1098039, 1, 0, 1,
-0.4515075, -0.02053576, -1.990342, 0.1058824, 1, 0, 1,
-0.4405743, -0.4115636, -4.405753, 0.09803922, 1, 0, 1,
-0.4399874, 0.551546, -0.4747027, 0.09019608, 1, 0, 1,
-0.4398776, 0.5764185, -0.5861593, 0.08627451, 1, 0, 1,
-0.4388244, -0.9622915, -2.522674, 0.07843138, 1, 0, 1,
-0.4386018, -0.5341814, -3.413113, 0.07450981, 1, 0, 1,
-0.4361948, -0.1765239, -2.018346, 0.06666667, 1, 0, 1,
-0.4353929, 1.758442, 1.992862, 0.0627451, 1, 0, 1,
-0.4340593, -0.07829354, -2.254128, 0.05490196, 1, 0, 1,
-0.4329427, 0.2900741, -0.1290604, 0.05098039, 1, 0, 1,
-0.4287243, 1.509916, -0.6656089, 0.04313726, 1, 0, 1,
-0.4281323, -0.3958314, -2.86696, 0.03921569, 1, 0, 1,
-0.4264647, 0.8333529, -1.838536, 0.03137255, 1, 0, 1,
-0.4256054, 0.7390888, -1.385725, 0.02745098, 1, 0, 1,
-0.4252178, -1.094641, -3.720389, 0.01960784, 1, 0, 1,
-0.4232975, -1.015716, -4.136374, 0.01568628, 1, 0, 1,
-0.4190477, -0.7130206, -2.985677, 0.007843138, 1, 0, 1,
-0.4185447, 0.9308531, -0.2869233, 0.003921569, 1, 0, 1,
-0.4129838, -0.8618366, -3.81002, 0, 1, 0.003921569, 1,
-0.409963, 0.3050309, 0.08209016, 0, 1, 0.01176471, 1,
-0.4065554, -0.8278065, -4.651429, 0, 1, 0.01568628, 1,
-0.4026753, -0.9869173, -2.320767, 0, 1, 0.02352941, 1,
-0.4023255, 0.1505356, -0.09901003, 0, 1, 0.02745098, 1,
-0.3983649, 0.06002641, -0.891094, 0, 1, 0.03529412, 1,
-0.3927666, 0.1193267, -1.376515, 0, 1, 0.03921569, 1,
-0.3905214, -0.4492353, -2.172035, 0, 1, 0.04705882, 1,
-0.3885961, 0.05894617, -1.944722, 0, 1, 0.05098039, 1,
-0.387967, 1.944164, 0.4741161, 0, 1, 0.05882353, 1,
-0.3877079, -0.3768645, -1.384933, 0, 1, 0.0627451, 1,
-0.3855073, 0.4305054, -0.2048987, 0, 1, 0.07058824, 1,
-0.3840526, 0.9255709, -0.3422696, 0, 1, 0.07450981, 1,
-0.3792712, -0.1376726, -0.4606527, 0, 1, 0.08235294, 1,
-0.377341, 0.2160901, 0.8171829, 0, 1, 0.08627451, 1,
-0.377095, 1.243183, -1.810032, 0, 1, 0.09411765, 1,
-0.375702, 0.9783509, 1.441269, 0, 1, 0.1019608, 1,
-0.3701151, 1.231739, -1.193222, 0, 1, 0.1058824, 1,
-0.3600034, -0.2674793, -0.9290003, 0, 1, 0.1137255, 1,
-0.3582533, 0.007115407, -1.975268, 0, 1, 0.1176471, 1,
-0.3581157, -1.153906, -2.920201, 0, 1, 0.1254902, 1,
-0.3575111, -1.054149, -2.546886, 0, 1, 0.1294118, 1,
-0.3573329, -0.6378704, -0.2424113, 0, 1, 0.1372549, 1,
-0.3571021, 0.2826634, -1.582231, 0, 1, 0.1411765, 1,
-0.3506911, 0.1420124, -0.9691194, 0, 1, 0.1490196, 1,
-0.3494901, 1.387623, -0.7887267, 0, 1, 0.1529412, 1,
-0.3494607, 1.341307, 0.3677108, 0, 1, 0.1607843, 1,
-0.3476055, 0.5535694, 0.1001389, 0, 1, 0.1647059, 1,
-0.3454571, 0.5595666, -1.045151, 0, 1, 0.172549, 1,
-0.3430541, 0.8831939, -1.480539, 0, 1, 0.1764706, 1,
-0.339146, 1.739817, -0.004996779, 0, 1, 0.1843137, 1,
-0.3378776, -1.657766, -3.313798, 0, 1, 0.1882353, 1,
-0.3357162, -0.5353518, -3.183127, 0, 1, 0.1960784, 1,
-0.3345019, -0.206407, -1.1797, 0, 1, 0.2039216, 1,
-0.3344952, 1.462289, -1.329414, 0, 1, 0.2078431, 1,
-0.331223, 0.8195636, -0.2395903, 0, 1, 0.2156863, 1,
-0.3297731, -1.059417, -1.465504, 0, 1, 0.2196078, 1,
-0.3285514, 0.07484533, -2.045773, 0, 1, 0.227451, 1,
-0.320553, 1.702125, -0.5061901, 0, 1, 0.2313726, 1,
-0.3183294, -0.0314432, -2.556011, 0, 1, 0.2392157, 1,
-0.313659, 1.245352, -1.603717, 0, 1, 0.2431373, 1,
-0.3088468, -0.7271457, -2.402339, 0, 1, 0.2509804, 1,
-0.3057641, -1.310553, -4.12401, 0, 1, 0.254902, 1,
-0.3054059, 0.3460944, -0.8328658, 0, 1, 0.2627451, 1,
-0.3045109, 0.1708887, -1.293689, 0, 1, 0.2666667, 1,
-0.3030261, 1.465757, -0.7285488, 0, 1, 0.2745098, 1,
-0.3030039, 1.236479, -1.235564, 0, 1, 0.2784314, 1,
-0.3016127, 0.1252013, -1.378837, 0, 1, 0.2862745, 1,
-0.2977306, 0.3490147, -1.501552, 0, 1, 0.2901961, 1,
-0.2970917, -1.041205, -3.84239, 0, 1, 0.2980392, 1,
-0.2942118, 0.9763075, -1.82642, 0, 1, 0.3058824, 1,
-0.2936389, -0.05211449, -2.311916, 0, 1, 0.3098039, 1,
-0.2914302, -0.4474113, -2.927889, 0, 1, 0.3176471, 1,
-0.2913086, -0.2656312, -4.798884, 0, 1, 0.3215686, 1,
-0.2891919, -0.6179442, -1.896317, 0, 1, 0.3294118, 1,
-0.2887471, -1.273227, -3.493646, 0, 1, 0.3333333, 1,
-0.2881333, -2.159909, -2.959505, 0, 1, 0.3411765, 1,
-0.2860354, -0.2122231, -1.827677, 0, 1, 0.345098, 1,
-0.2827678, -0.202114, -2.905535, 0, 1, 0.3529412, 1,
-0.2795959, 1.259231, -1.211038, 0, 1, 0.3568628, 1,
-0.2792161, -0.3444889, -1.631607, 0, 1, 0.3647059, 1,
-0.2788897, -0.2684394, -2.311661, 0, 1, 0.3686275, 1,
-0.2757336, 0.5955423, -0.8716276, 0, 1, 0.3764706, 1,
-0.2756196, 2.890121, 0.5650887, 0, 1, 0.3803922, 1,
-0.2736644, 0.2724849, -1.40708, 0, 1, 0.3882353, 1,
-0.2680066, -0.2421815, -0.6659722, 0, 1, 0.3921569, 1,
-0.2642289, 0.2084172, 0.08167531, 0, 1, 0.4, 1,
-0.2639987, -1.436075, -0.9673884, 0, 1, 0.4078431, 1,
-0.26243, -0.4668802, -2.614751, 0, 1, 0.4117647, 1,
-0.2620002, 1.175854, 0.7058056, 0, 1, 0.4196078, 1,
-0.261576, 0.5057014, 0.4891168, 0, 1, 0.4235294, 1,
-0.2604881, -0.3781837, -1.909017, 0, 1, 0.4313726, 1,
-0.2594017, 0.01348441, -0.8268744, 0, 1, 0.4352941, 1,
-0.2521214, 0.123551, 0.340298, 0, 1, 0.4431373, 1,
-0.2502672, 0.2550074, 0.7925918, 0, 1, 0.4470588, 1,
-0.2480707, -0.04692893, -2.182473, 0, 1, 0.454902, 1,
-0.2431014, 0.8431223, 0.7201268, 0, 1, 0.4588235, 1,
-0.2425964, 0.7453626, -0.05660533, 0, 1, 0.4666667, 1,
-0.2394073, -0.6966929, -3.306447, 0, 1, 0.4705882, 1,
-0.2365841, -0.8532372, -3.610705, 0, 1, 0.4784314, 1,
-0.2361055, 0.9306138, -1.411554, 0, 1, 0.4823529, 1,
-0.236045, -0.9491148, -2.41189, 0, 1, 0.4901961, 1,
-0.2360122, 0.3990465, 0.2413477, 0, 1, 0.4941176, 1,
-0.2331811, -0.1859087, -2.997755, 0, 1, 0.5019608, 1,
-0.2324751, 0.5390627, 0.2162799, 0, 1, 0.509804, 1,
-0.2314454, 0.821588, -1.151034, 0, 1, 0.5137255, 1,
-0.2311035, -0.5208144, -1.625792, 0, 1, 0.5215687, 1,
-0.2301572, -1.11237, -3.604821, 0, 1, 0.5254902, 1,
-0.2241598, 0.4724003, -1.968514, 0, 1, 0.5333334, 1,
-0.2221032, 0.8969653, -0.1879274, 0, 1, 0.5372549, 1,
-0.2148194, -0.6297101, -2.654972, 0, 1, 0.5450981, 1,
-0.2137475, -0.471175, -4.284684, 0, 1, 0.5490196, 1,
-0.2129911, 0.7915034, -0.4372092, 0, 1, 0.5568628, 1,
-0.2105407, 1.011351, -0.912958, 0, 1, 0.5607843, 1,
-0.2095671, -1.094535, -4.322611, 0, 1, 0.5686275, 1,
-0.2069739, 0.913038, -1.80635, 0, 1, 0.572549, 1,
-0.2069684, -0.154341, -2.063715, 0, 1, 0.5803922, 1,
-0.2051082, 0.5119545, -0.5870383, 0, 1, 0.5843138, 1,
-0.1990237, 0.1154948, -2.934137, 0, 1, 0.5921569, 1,
-0.1983284, -0.1040939, -2.977791, 0, 1, 0.5960785, 1,
-0.1923664, -1.101662, -3.321071, 0, 1, 0.6039216, 1,
-0.1888333, -0.2097105, -1.559914, 0, 1, 0.6117647, 1,
-0.1860147, 0.764945, 1.9384, 0, 1, 0.6156863, 1,
-0.183434, 0.8703285, 0.6475576, 0, 1, 0.6235294, 1,
-0.1819979, 0.7905521, -0.595376, 0, 1, 0.627451, 1,
-0.1808403, 0.5079973, -0.2122143, 0, 1, 0.6352941, 1,
-0.1793555, 0.5612568, -1.553637, 0, 1, 0.6392157, 1,
-0.1754455, -0.5725919, -3.447015, 0, 1, 0.6470588, 1,
-0.1752621, -0.7538278, -1.405504, 0, 1, 0.6509804, 1,
-0.1740684, 0.5071087, 0.8995457, 0, 1, 0.6588235, 1,
-0.1712053, 0.7600055, -0.9748157, 0, 1, 0.6627451, 1,
-0.1708361, 0.05675547, -0.03478771, 0, 1, 0.6705883, 1,
-0.1683046, 0.9645916, 0.2262078, 0, 1, 0.6745098, 1,
-0.167285, -0.4308143, -2.761146, 0, 1, 0.682353, 1,
-0.1661552, -0.1228933, -1.525471, 0, 1, 0.6862745, 1,
-0.1657074, 0.2711374, -0.4435675, 0, 1, 0.6941177, 1,
-0.1651555, -0.4249357, -2.117567, 0, 1, 0.7019608, 1,
-0.160851, 0.199665, -0.7886166, 0, 1, 0.7058824, 1,
-0.1556685, 0.01312107, -2.044299, 0, 1, 0.7137255, 1,
-0.1526631, 2.093731, 0.5134374, 0, 1, 0.7176471, 1,
-0.1515399, 0.02231435, -3.359236, 0, 1, 0.7254902, 1,
-0.1504509, -1.39829, -3.124799, 0, 1, 0.7294118, 1,
-0.1448275, -3.070855, -1.77563, 0, 1, 0.7372549, 1,
-0.141063, 0.9466855, -0.1705069, 0, 1, 0.7411765, 1,
-0.1389771, -2.763884, -3.342182, 0, 1, 0.7490196, 1,
-0.1373668, -0.7125151, -1.804157, 0, 1, 0.7529412, 1,
-0.1364214, -0.6689681, -2.5375, 0, 1, 0.7607843, 1,
-0.1354838, 1.033266, 1.387506, 0, 1, 0.7647059, 1,
-0.1332817, 0.9880211, 0.1915078, 0, 1, 0.772549, 1,
-0.1318147, 0.7340924, -0.529284, 0, 1, 0.7764706, 1,
-0.130377, -1.753043, -4.683674, 0, 1, 0.7843137, 1,
-0.1293006, 1.544054, -0.1720224, 0, 1, 0.7882353, 1,
-0.1284803, -0.1325766, -2.404766, 0, 1, 0.7960784, 1,
-0.1243312, -0.9754664, -2.165897, 0, 1, 0.8039216, 1,
-0.1234137, 0.05768554, -1.806424, 0, 1, 0.8078431, 1,
-0.1181925, -1.301621, -2.658261, 0, 1, 0.8156863, 1,
-0.1169029, -0.7770385, -4.144121, 0, 1, 0.8196079, 1,
-0.1146757, 1.08068, 0.08705081, 0, 1, 0.827451, 1,
-0.1134149, -0.8731521, -3.553784, 0, 1, 0.8313726, 1,
-0.1120311, 0.3772159, -0.9000971, 0, 1, 0.8392157, 1,
-0.1119637, 1.328762, -1.619057, 0, 1, 0.8431373, 1,
-0.1100094, -2.208624, -1.974323, 0, 1, 0.8509804, 1,
-0.1083997, 0.2767293, -0.09829166, 0, 1, 0.854902, 1,
-0.1075411, -0.3359635, -3.296731, 0, 1, 0.8627451, 1,
-0.1040554, 0.3239782, 1.806951, 0, 1, 0.8666667, 1,
-0.09740911, -1.382563, -3.866262, 0, 1, 0.8745098, 1,
-0.09513654, -0.08029377, -2.447826, 0, 1, 0.8784314, 1,
-0.08567429, -0.6457034, -2.541953, 0, 1, 0.8862745, 1,
-0.08054654, -0.2948188, -1.477274, 0, 1, 0.8901961, 1,
-0.07932244, 0.1595366, 0.5993155, 0, 1, 0.8980392, 1,
-0.07297125, -1.038514, -2.554179, 0, 1, 0.9058824, 1,
-0.07274313, 1.505032, -0.8492664, 0, 1, 0.9098039, 1,
-0.06989274, 0.7031552, 0.07522957, 0, 1, 0.9176471, 1,
-0.06791069, -1.206506, -3.406115, 0, 1, 0.9215686, 1,
-0.06762182, 0.4643095, -0.9398394, 0, 1, 0.9294118, 1,
-0.06541229, -0.5620944, -2.573287, 0, 1, 0.9333333, 1,
-0.06206182, 0.8805032, -0.4301747, 0, 1, 0.9411765, 1,
-0.05897449, -1.200962, -2.653929, 0, 1, 0.945098, 1,
-0.05859707, -0.112559, -0.7853269, 0, 1, 0.9529412, 1,
-0.05071238, -0.0400053, -1.949638, 0, 1, 0.9568627, 1,
-0.04537254, -0.3296023, -3.306274, 0, 1, 0.9647059, 1,
-0.04437939, -1.436154, -2.939076, 0, 1, 0.9686275, 1,
-0.04215676, -1.755421, -4.112129, 0, 1, 0.9764706, 1,
-0.04166605, 1.903282, -0.03342608, 0, 1, 0.9803922, 1,
-0.04068791, 1.079057, 0.4628198, 0, 1, 0.9882353, 1,
-0.03455207, -0.8912026, -1.86426, 0, 1, 0.9921569, 1,
-0.03441219, 0.8987343, 0.1526529, 0, 1, 1, 1,
-0.03410932, -1.69807, -3.47273, 0, 0.9921569, 1, 1,
-0.03314381, -1.613131, -1.710497, 0, 0.9882353, 1, 1,
-0.03297041, 1.585674, 0.05245519, 0, 0.9803922, 1, 1,
-0.02806174, -1.630578, -3.265128, 0, 0.9764706, 1, 1,
-0.02089711, -0.6625642, -2.234684, 0, 0.9686275, 1, 1,
-0.01643187, -0.6873578, -3.982052, 0, 0.9647059, 1, 1,
-0.01442748, -0.5849554, -3.281528, 0, 0.9568627, 1, 1,
-0.0129614, -1.456781, -2.807028, 0, 0.9529412, 1, 1,
-0.008149974, -0.2649614, -3.281234, 0, 0.945098, 1, 1,
-0.007113232, 0.3640047, 1.220529, 0, 0.9411765, 1, 1,
-0.004536533, -0.1767138, -4.479409, 0, 0.9333333, 1, 1,
-0.003909586, -0.6107838, -2.729236, 0, 0.9294118, 1, 1,
-0.002354404, -0.5588566, -2.457715, 0, 0.9215686, 1, 1,
0.0009491633, -2.204437, 4.240909, 0, 0.9176471, 1, 1,
0.003936192, 1.601674, 0.2273694, 0, 0.9098039, 1, 1,
0.009405717, 0.3441318, -0.3049318, 0, 0.9058824, 1, 1,
0.01183834, 1.505746, -0.442638, 0, 0.8980392, 1, 1,
0.01199921, 0.2417269, 1.014152, 0, 0.8901961, 1, 1,
0.01405676, 0.3857468, 0.8432965, 0, 0.8862745, 1, 1,
0.01655308, 0.3466503, -0.248565, 0, 0.8784314, 1, 1,
0.02220581, -1.063905, 2.778602, 0, 0.8745098, 1, 1,
0.02637121, 1.424764, -0.5721365, 0, 0.8666667, 1, 1,
0.02702229, 0.2259955, 0.2353461, 0, 0.8627451, 1, 1,
0.03374677, -0.3187432, 0.8574932, 0, 0.854902, 1, 1,
0.03918961, -0.5216463, 3.712872, 0, 0.8509804, 1, 1,
0.04050426, 0.6857331, -0.9434701, 0, 0.8431373, 1, 1,
0.04339988, -0.1191837, 2.76556, 0, 0.8392157, 1, 1,
0.0437967, 0.8487783, 0.3777528, 0, 0.8313726, 1, 1,
0.04951938, -0.3060191, 3.099105, 0, 0.827451, 1, 1,
0.05086603, 0.7709408, 0.2558073, 0, 0.8196079, 1, 1,
0.05534982, -0.9753633, 4.119653, 0, 0.8156863, 1, 1,
0.06030647, 0.9031225, -0.6818502, 0, 0.8078431, 1, 1,
0.06301891, 0.09381987, 0.08072516, 0, 0.8039216, 1, 1,
0.06473137, -1.137645, 3.797488, 0, 0.7960784, 1, 1,
0.07381631, 0.1714972, 0.5960788, 0, 0.7882353, 1, 1,
0.07539371, 0.8467101, -1.525178, 0, 0.7843137, 1, 1,
0.07565559, 1.548116, -0.2785891, 0, 0.7764706, 1, 1,
0.07598366, -1.645261, 3.763702, 0, 0.772549, 1, 1,
0.07639451, 0.3352998, 0.8313218, 0, 0.7647059, 1, 1,
0.07688557, -0.3188241, 2.107799, 0, 0.7607843, 1, 1,
0.08211417, -1.230672, 3.924312, 0, 0.7529412, 1, 1,
0.0837795, 0.7622827, 0.8380607, 0, 0.7490196, 1, 1,
0.08378971, 0.7733656, -0.09224483, 0, 0.7411765, 1, 1,
0.08408471, 0.6398081, -0.6644259, 0, 0.7372549, 1, 1,
0.09145528, 1.536698, -2.37475, 0, 0.7294118, 1, 1,
0.09369449, -1.74933, 2.330899, 0, 0.7254902, 1, 1,
0.09477292, 2.020679, -1.123031, 0, 0.7176471, 1, 1,
0.09527535, 0.05515914, 3.045423, 0, 0.7137255, 1, 1,
0.09689843, -0.6959066, 1.445905, 0, 0.7058824, 1, 1,
0.1033824, -1.541561, 2.478449, 0, 0.6980392, 1, 1,
0.1094373, -0.3641455, 3.480155, 0, 0.6941177, 1, 1,
0.1134222, -0.4873888, 3.60172, 0, 0.6862745, 1, 1,
0.1144449, -2.505776, 0.4909388, 0, 0.682353, 1, 1,
0.1147644, -1.395326, 3.419878, 0, 0.6745098, 1, 1,
0.1149676, 1.064102, 1.284135, 0, 0.6705883, 1, 1,
0.1185433, -0.1637267, 2.073903, 0, 0.6627451, 1, 1,
0.1246352, -0.1880536, 1.286014, 0, 0.6588235, 1, 1,
0.1283974, -0.1073009, 2.597357, 0, 0.6509804, 1, 1,
0.1314899, 1.085745, 0.4299052, 0, 0.6470588, 1, 1,
0.1318604, -0.6420276, 2.784645, 0, 0.6392157, 1, 1,
0.1336202, -1.321704, 4.142934, 0, 0.6352941, 1, 1,
0.134586, -0.01737646, -1.089144, 0, 0.627451, 1, 1,
0.1363435, -0.5681661, 1.18021, 0, 0.6235294, 1, 1,
0.1392976, -0.02184044, 1.974737, 0, 0.6156863, 1, 1,
0.1534794, 0.1166059, 0.4626444, 0, 0.6117647, 1, 1,
0.15356, 0.3830713, -0.2774033, 0, 0.6039216, 1, 1,
0.1568402, -1.588078, 3.48109, 0, 0.5960785, 1, 1,
0.1606943, 0.9159055, 0.3795835, 0, 0.5921569, 1, 1,
0.160796, -0.8064083, 2.690071, 0, 0.5843138, 1, 1,
0.1640776, -0.7720308, 3.428246, 0, 0.5803922, 1, 1,
0.1668023, 1.83846, -0.246162, 0, 0.572549, 1, 1,
0.1686324, -0.1295137, 2.543502, 0, 0.5686275, 1, 1,
0.169684, -0.6721825, 3.549489, 0, 0.5607843, 1, 1,
0.1703216, 0.06682213, 1.375455, 0, 0.5568628, 1, 1,
0.1748684, 0.5159687, -1.159081, 0, 0.5490196, 1, 1,
0.1754317, -0.07392503, 1.592379, 0, 0.5450981, 1, 1,
0.1782153, -0.3094304, 2.409004, 0, 0.5372549, 1, 1,
0.1813552, -0.8708875, 4.812453, 0, 0.5333334, 1, 1,
0.1833737, -1.511162, 1.254745, 0, 0.5254902, 1, 1,
0.1847584, 1.570072, -0.06472188, 0, 0.5215687, 1, 1,
0.1865796, -0.04431418, 2.717467, 0, 0.5137255, 1, 1,
0.1867503, -2.561934, 3.668093, 0, 0.509804, 1, 1,
0.1911954, 0.263388, -0.3316576, 0, 0.5019608, 1, 1,
0.1958637, 1.034082, 0.4097516, 0, 0.4941176, 1, 1,
0.1982471, -0.6176231, 1.253431, 0, 0.4901961, 1, 1,
0.2084035, -0.1954296, 1.736292, 0, 0.4823529, 1, 1,
0.2101962, 0.6326857, 1.5324, 0, 0.4784314, 1, 1,
0.2138768, -0.2821012, 2.177904, 0, 0.4705882, 1, 1,
0.2208586, 0.7665351, -0.5792427, 0, 0.4666667, 1, 1,
0.2211649, -1.276724, 2.730509, 0, 0.4588235, 1, 1,
0.2216278, 0.5453447, 0.7881822, 0, 0.454902, 1, 1,
0.2247223, 0.1894831, 1.440719, 0, 0.4470588, 1, 1,
0.2259251, -1.841463, 1.338918, 0, 0.4431373, 1, 1,
0.2306793, -0.2713505, 1.8318, 0, 0.4352941, 1, 1,
0.23177, -0.9643586, 1.055771, 0, 0.4313726, 1, 1,
0.2394786, -0.8227561, 4.51814, 0, 0.4235294, 1, 1,
0.2457621, -1.309363, 1.886966, 0, 0.4196078, 1, 1,
0.2475963, 1.165495, 0.6070064, 0, 0.4117647, 1, 1,
0.250859, 0.4443843, 1.883773, 0, 0.4078431, 1, 1,
0.2594969, -0.4550674, 1.403983, 0, 0.4, 1, 1,
0.2634069, -1.036752, 2.291078, 0, 0.3921569, 1, 1,
0.2634411, -0.05836274, -0.03994092, 0, 0.3882353, 1, 1,
0.2640498, -0.08447445, 1.178289, 0, 0.3803922, 1, 1,
0.2647449, -1.103422, 2.894622, 0, 0.3764706, 1, 1,
0.2673592, 0.713518, -0.3655665, 0, 0.3686275, 1, 1,
0.2685343, -1.09879, 3.299547, 0, 0.3647059, 1, 1,
0.2778478, -1.55566, 3.46294, 0, 0.3568628, 1, 1,
0.2782644, -0.1105336, 2.575796, 0, 0.3529412, 1, 1,
0.2819907, 0.7085689, -0.08805825, 0, 0.345098, 1, 1,
0.2832892, -0.1983409, 1.071458, 0, 0.3411765, 1, 1,
0.28443, -0.3314791, 3.346943, 0, 0.3333333, 1, 1,
0.2851942, 0.3155012, 0.2319327, 0, 0.3294118, 1, 1,
0.2877451, 1.264003, 0.5317806, 0, 0.3215686, 1, 1,
0.294847, 0.9823645, -0.8671935, 0, 0.3176471, 1, 1,
0.2965568, 0.2066974, 0.168704, 0, 0.3098039, 1, 1,
0.2992066, 0.7429751, 0.2763757, 0, 0.3058824, 1, 1,
0.3005852, 0.813494, 1.499737, 0, 0.2980392, 1, 1,
0.3061007, 1.05111, -1.08198, 0, 0.2901961, 1, 1,
0.3147169, -0.6315411, 1.748815, 0, 0.2862745, 1, 1,
0.3200916, 0.2041265, 1.050535, 0, 0.2784314, 1, 1,
0.3212466, -0.3527623, 2.544404, 0, 0.2745098, 1, 1,
0.3220872, -0.7898453, 1.401501, 0, 0.2666667, 1, 1,
0.3275477, -0.5714645, 1.678602, 0, 0.2627451, 1, 1,
0.3321675, -0.7651944, 2.879873, 0, 0.254902, 1, 1,
0.3328664, -0.4297287, 3.352194, 0, 0.2509804, 1, 1,
0.3406807, 1.291566, -0.5344477, 0, 0.2431373, 1, 1,
0.3421816, 0.4093466, 0.1069424, 0, 0.2392157, 1, 1,
0.3439615, 0.2203254, -0.1861862, 0, 0.2313726, 1, 1,
0.3458934, -0.6769759, 2.243546, 0, 0.227451, 1, 1,
0.3470625, 1.300341, 0.3122277, 0, 0.2196078, 1, 1,
0.3473318, 0.02536348, 0.7399294, 0, 0.2156863, 1, 1,
0.3506266, 0.3945037, 1.147301, 0, 0.2078431, 1, 1,
0.3536574, -0.2845431, -0.748273, 0, 0.2039216, 1, 1,
0.3557187, 0.02332776, 1.629338, 0, 0.1960784, 1, 1,
0.3562731, -0.01691435, 1.729401, 0, 0.1882353, 1, 1,
0.3571146, 1.634685, 0.2241611, 0, 0.1843137, 1, 1,
0.3589566, -0.2134139, -1.23153, 0, 0.1764706, 1, 1,
0.3593887, -0.9494614, 3.320907, 0, 0.172549, 1, 1,
0.3608145, -0.8984916, 1.561008, 0, 0.1647059, 1, 1,
0.3633961, 1.092507, -1.126197, 0, 0.1607843, 1, 1,
0.3646041, -0.633001, 1.194079, 0, 0.1529412, 1, 1,
0.364991, -0.276502, 2.80977, 0, 0.1490196, 1, 1,
0.3660591, -0.19954, 2.075458, 0, 0.1411765, 1, 1,
0.367649, -0.0170238, -0.8380793, 0, 0.1372549, 1, 1,
0.3679368, -0.4765624, 1.846939, 0, 0.1294118, 1, 1,
0.3680574, 0.5685099, -1.50261, 0, 0.1254902, 1, 1,
0.3684037, -0.08557103, 2.994399, 0, 0.1176471, 1, 1,
0.3689037, -0.3081763, 3.172903, 0, 0.1137255, 1, 1,
0.3693873, 1.584912, -0.3606698, 0, 0.1058824, 1, 1,
0.3703135, -1.230476, 3.699432, 0, 0.09803922, 1, 1,
0.3727301, -1.025717, 1.921244, 0, 0.09411765, 1, 1,
0.3727902, -0.6273584, 3.652772, 0, 0.08627451, 1, 1,
0.3737753, 0.6231778, 1.586569, 0, 0.08235294, 1, 1,
0.3755606, -0.8264483, 3.932271, 0, 0.07450981, 1, 1,
0.3835705, -1.40042, 3.98236, 0, 0.07058824, 1, 1,
0.3862269, -0.7196454, 2.574153, 0, 0.0627451, 1, 1,
0.391902, -1.957318, 3.849228, 0, 0.05882353, 1, 1,
0.3919869, 0.9399016, 2.769885, 0, 0.05098039, 1, 1,
0.3955618, -1.356401, 1.274584, 0, 0.04705882, 1, 1,
0.3970831, -1.86638, 2.644686, 0, 0.03921569, 1, 1,
0.3976069, 0.6320305, 1.83199, 0, 0.03529412, 1, 1,
0.3982369, 0.6177572, 0.4741517, 0, 0.02745098, 1, 1,
0.3999701, 0.5090922, -0.1328665, 0, 0.02352941, 1, 1,
0.4001675, 0.1340925, 1.156993, 0, 0.01568628, 1, 1,
0.4073752, -0.1978632, 1.189421, 0, 0.01176471, 1, 1,
0.4074276, -0.8149323, 0.4908697, 0, 0.003921569, 1, 1,
0.4088034, 0.4533993, 0.0910029, 0.003921569, 0, 1, 1,
0.4091375, 1.704658, 1.273485, 0.007843138, 0, 1, 1,
0.4131284, -0.3545018, -0.7427089, 0.01568628, 0, 1, 1,
0.4161221, 0.23296, 2.984217, 0.01960784, 0, 1, 1,
0.4216687, 0.5093125, -0.4041089, 0.02745098, 0, 1, 1,
0.4272715, 1.478292, 1.073727, 0.03137255, 0, 1, 1,
0.4276226, -0.3793025, -0.215394, 0.03921569, 0, 1, 1,
0.4282497, 2.319107, 0.7663938, 0.04313726, 0, 1, 1,
0.4309535, 0.2599171, 0.527638, 0.05098039, 0, 1, 1,
0.4375888, 0.01852435, 1.158428, 0.05490196, 0, 1, 1,
0.438167, -0.7975761, 1.728976, 0.0627451, 0, 1, 1,
0.4421172, -2.101729, 3.537044, 0.06666667, 0, 1, 1,
0.4583008, 0.5595668, -0.1112516, 0.07450981, 0, 1, 1,
0.4595511, 0.4860432, -0.1656953, 0.07843138, 0, 1, 1,
0.4622251, 0.2014187, 1.704669, 0.08627451, 0, 1, 1,
0.4627348, 0.4894332, -0.4890231, 0.09019608, 0, 1, 1,
0.4628353, -1.372477, 2.575232, 0.09803922, 0, 1, 1,
0.4669571, -2.245228, 3.221887, 0.1058824, 0, 1, 1,
0.4711648, -1.411572, 3.053295, 0.1098039, 0, 1, 1,
0.4737805, -1.470671, 4.18208, 0.1176471, 0, 1, 1,
0.4749134, 0.4097658, 1.325221, 0.1215686, 0, 1, 1,
0.478661, 0.2508628, 0.1099794, 0.1294118, 0, 1, 1,
0.4823981, 1.986905, 0.602084, 0.1333333, 0, 1, 1,
0.48821, -0.913756, 3.542555, 0.1411765, 0, 1, 1,
0.4895654, 0.9414163, -0.4003137, 0.145098, 0, 1, 1,
0.4971303, -1.436483, 2.595913, 0.1529412, 0, 1, 1,
0.4991588, -0.1581014, 1.213611, 0.1568628, 0, 1, 1,
0.4997157, -1.013401, 3.408847, 0.1647059, 0, 1, 1,
0.5033728, -0.865825, 3.282813, 0.1686275, 0, 1, 1,
0.5078453, -0.1120471, 1.791951, 0.1764706, 0, 1, 1,
0.5113154, 1.644987, 1.594, 0.1803922, 0, 1, 1,
0.5127589, 0.3993091, 3.637033, 0.1882353, 0, 1, 1,
0.5137371, 1.618216, 0.5736367, 0.1921569, 0, 1, 1,
0.5148083, 0.8247777, 0.9726198, 0.2, 0, 1, 1,
0.5158539, -0.3996035, 3.090236, 0.2078431, 0, 1, 1,
0.5218604, 0.9958808, 2.090143, 0.2117647, 0, 1, 1,
0.5226228, -0.03955176, 0.4896703, 0.2196078, 0, 1, 1,
0.5254776, -0.06122219, 1.156724, 0.2235294, 0, 1, 1,
0.536676, -1.575686, 1.585689, 0.2313726, 0, 1, 1,
0.5412184, -1.055088, 2.656373, 0.2352941, 0, 1, 1,
0.544045, -0.1593157, 1.510981, 0.2431373, 0, 1, 1,
0.5476368, -0.9839725, 3.432279, 0.2470588, 0, 1, 1,
0.5498822, -1.330998, 2.205764, 0.254902, 0, 1, 1,
0.5504133, -0.2779381, 2.883769, 0.2588235, 0, 1, 1,
0.5512073, 1.612885, -0.09250107, 0.2666667, 0, 1, 1,
0.5527805, -0.6916343, 3.268003, 0.2705882, 0, 1, 1,
0.552853, -1.657664, 4.704478, 0.2784314, 0, 1, 1,
0.5536726, -0.9414743, 2.429147, 0.282353, 0, 1, 1,
0.554783, 0.8067464, 0.8273653, 0.2901961, 0, 1, 1,
0.5584435, -1.321382, 1.326839, 0.2941177, 0, 1, 1,
0.5597782, -0.5825727, 2.495936, 0.3019608, 0, 1, 1,
0.5610921, -1.941749, 1.846903, 0.3098039, 0, 1, 1,
0.5618365, 0.4310829, 0.9182295, 0.3137255, 0, 1, 1,
0.5620716, 0.7879348, -0.3207565, 0.3215686, 0, 1, 1,
0.5637385, -1.13261, 3.496232, 0.3254902, 0, 1, 1,
0.5651206, 0.7106615, 0.2138344, 0.3333333, 0, 1, 1,
0.5701833, 0.3674081, 0.8089521, 0.3372549, 0, 1, 1,
0.571268, -0.3089572, 3.499207, 0.345098, 0, 1, 1,
0.5755493, 0.5266951, 0.1171729, 0.3490196, 0, 1, 1,
0.5785741, 0.8147438, 0.1454395, 0.3568628, 0, 1, 1,
0.5810127, 0.6159137, 0.758431, 0.3607843, 0, 1, 1,
0.5873705, -1.848771, 1.737023, 0.3686275, 0, 1, 1,
0.5880721, -0.1561012, 1.517985, 0.372549, 0, 1, 1,
0.5883703, -0.7029654, 4.207148, 0.3803922, 0, 1, 1,
0.5897183, 0.7473511, 1.673902, 0.3843137, 0, 1, 1,
0.5928782, 0.7711183, -0.7874164, 0.3921569, 0, 1, 1,
0.5966265, -0.2837294, 3.839342, 0.3960784, 0, 1, 1,
0.599842, -1.968365, 3.006335, 0.4039216, 0, 1, 1,
0.6051819, 1.025842, 0.5014958, 0.4117647, 0, 1, 1,
0.6057693, 0.1662218, 2.306501, 0.4156863, 0, 1, 1,
0.6090924, -1.402406, 4.034493, 0.4235294, 0, 1, 1,
0.6115999, -1.754283, 5.879601, 0.427451, 0, 1, 1,
0.612605, 0.5236942, 0.7552598, 0.4352941, 0, 1, 1,
0.6136318, 1.403675, -0.5025753, 0.4392157, 0, 1, 1,
0.6142612, -0.1479913, 2.163419, 0.4470588, 0, 1, 1,
0.6150783, 0.3288856, 0.2279535, 0.4509804, 0, 1, 1,
0.6160886, -1.54258, 2.445696, 0.4588235, 0, 1, 1,
0.6166058, -1.008369, 3.544588, 0.4627451, 0, 1, 1,
0.6170631, 0.6469583, 0.08665588, 0.4705882, 0, 1, 1,
0.6172111, -0.9621515, 0.978072, 0.4745098, 0, 1, 1,
0.6209227, -0.2910687, 1.585049, 0.4823529, 0, 1, 1,
0.6222382, 2.36228, -0.2053134, 0.4862745, 0, 1, 1,
0.6226764, -0.05454685, 0.507477, 0.4941176, 0, 1, 1,
0.6291922, -0.2780449, 1.46483, 0.5019608, 0, 1, 1,
0.6292625, -0.6146125, 3.087781, 0.5058824, 0, 1, 1,
0.6341237, 0.4933605, 0.2151025, 0.5137255, 0, 1, 1,
0.6372901, -0.2476649, 1.413917, 0.5176471, 0, 1, 1,
0.6503797, -1.078537, 2.794594, 0.5254902, 0, 1, 1,
0.6532514, -1.354854, 2.782793, 0.5294118, 0, 1, 1,
0.6566725, 1.310825, 1.010364, 0.5372549, 0, 1, 1,
0.6587033, 0.9425687, 0.3581835, 0.5411765, 0, 1, 1,
0.6682015, 1.204318, -0.09219329, 0.5490196, 0, 1, 1,
0.6697525, -0.4109315, 3.569458, 0.5529412, 0, 1, 1,
0.6733423, 1.82021, 1.224243, 0.5607843, 0, 1, 1,
0.677855, 0.0403755, 0.4669136, 0.5647059, 0, 1, 1,
0.6778831, -0.5732491, 1.849967, 0.572549, 0, 1, 1,
0.6781316, -0.08613072, 0.7109468, 0.5764706, 0, 1, 1,
0.6803298, -0.190489, -0.3388203, 0.5843138, 0, 1, 1,
0.6906146, -0.5150259, 1.285312, 0.5882353, 0, 1, 1,
0.6910044, 0.2058816, -0.5916873, 0.5960785, 0, 1, 1,
0.6914993, -0.3297437, 1.517217, 0.6039216, 0, 1, 1,
0.6953822, -0.6414322, 2.499048, 0.6078432, 0, 1, 1,
0.6968303, 0.4180231, 0.5591294, 0.6156863, 0, 1, 1,
0.6981597, 0.6509318, 0.7325846, 0.6196079, 0, 1, 1,
0.7017311, -1.625237, 2.4571, 0.627451, 0, 1, 1,
0.7026427, 0.4602683, 2.085266, 0.6313726, 0, 1, 1,
0.7056323, 0.9241718, 0.2568192, 0.6392157, 0, 1, 1,
0.7070607, 0.5382574, 1.754762, 0.6431373, 0, 1, 1,
0.7096835, 1.291331, -0.05367811, 0.6509804, 0, 1, 1,
0.7101634, -1.722635, 2.582753, 0.654902, 0, 1, 1,
0.7206915, -0.02541938, 1.686314, 0.6627451, 0, 1, 1,
0.7219223, -0.7638384, 2.799452, 0.6666667, 0, 1, 1,
0.7242541, -0.7959286, 2.777274, 0.6745098, 0, 1, 1,
0.7278419, 1.019243, 0.43331, 0.6784314, 0, 1, 1,
0.7304545, 0.3640386, 0.2565371, 0.6862745, 0, 1, 1,
0.7320708, 0.2660666, 0.3602788, 0.6901961, 0, 1, 1,
0.7328307, 2.408325, 1.262584, 0.6980392, 0, 1, 1,
0.7360409, 0.8632575, 1.741731, 0.7058824, 0, 1, 1,
0.7382693, 0.6335115, 0.9098301, 0.7098039, 0, 1, 1,
0.7428809, -0.5462443, 4.318773, 0.7176471, 0, 1, 1,
0.7437111, 1.363761, 0.6273853, 0.7215686, 0, 1, 1,
0.7448447, 1.826961, -1.139194, 0.7294118, 0, 1, 1,
0.7448913, 2.819029, 0.6187348, 0.7333333, 0, 1, 1,
0.7462105, -0.5385429, 1.829746, 0.7411765, 0, 1, 1,
0.7497463, -0.5768678, 0.8964201, 0.7450981, 0, 1, 1,
0.7499936, 0.2248391, 2.692274, 0.7529412, 0, 1, 1,
0.7572554, 0.6035313, 0.7233014, 0.7568628, 0, 1, 1,
0.7572752, 0.3100535, 2.724629, 0.7647059, 0, 1, 1,
0.7644747, 0.2917408, -0.3442328, 0.7686275, 0, 1, 1,
0.765684, -1.011153, 2.692742, 0.7764706, 0, 1, 1,
0.7661988, 0.4120156, -0.03611862, 0.7803922, 0, 1, 1,
0.7700056, 0.9047073, 0.4392322, 0.7882353, 0, 1, 1,
0.7715433, 0.3253526, 0.9783483, 0.7921569, 0, 1, 1,
0.7978684, 0.7338634, 1.640966, 0.8, 0, 1, 1,
0.7995849, -0.7609918, 2.252403, 0.8078431, 0, 1, 1,
0.8016286, 0.8472188, 2.661044, 0.8117647, 0, 1, 1,
0.8089032, 0.5059682, 0.4444952, 0.8196079, 0, 1, 1,
0.8130229, 0.09826744, 1.848039, 0.8235294, 0, 1, 1,
0.8136157, 0.9548874, -0.4870414, 0.8313726, 0, 1, 1,
0.8235667, -0.2088411, 1.176689, 0.8352941, 0, 1, 1,
0.8237147, 1.794541, 2.749677, 0.8431373, 0, 1, 1,
0.8239385, -0.3434002, 0.7547638, 0.8470588, 0, 1, 1,
0.8280964, 0.1497522, 2.492081, 0.854902, 0, 1, 1,
0.8283887, 1.456992, 1.116059, 0.8588235, 0, 1, 1,
0.8344138, -1.149902, 3.680116, 0.8666667, 0, 1, 1,
0.8366461, 0.06987602, 0.928607, 0.8705882, 0, 1, 1,
0.8374482, -0.2751772, 2.724526, 0.8784314, 0, 1, 1,
0.8386362, -1.348876, 2.23479, 0.8823529, 0, 1, 1,
0.8404603, -1.844467, 1.241483, 0.8901961, 0, 1, 1,
0.8430973, 1.388986, 1.011312, 0.8941177, 0, 1, 1,
0.8487056, -0.7731717, 2.420537, 0.9019608, 0, 1, 1,
0.8525271, 0.7045686, 1.750613, 0.9098039, 0, 1, 1,
0.8592981, -1.48804, 3.193004, 0.9137255, 0, 1, 1,
0.85978, -0.0691456, 1.831741, 0.9215686, 0, 1, 1,
0.8692503, 0.2276463, 0.4131996, 0.9254902, 0, 1, 1,
0.8703641, -0.2323727, 3.639169, 0.9333333, 0, 1, 1,
0.8721632, 0.549926, 1.132878, 0.9372549, 0, 1, 1,
0.8752128, -1.077391, 2.754336, 0.945098, 0, 1, 1,
0.8940779, -0.8429326, 2.364125, 0.9490196, 0, 1, 1,
0.9065813, 1.671218, 1.462121, 0.9568627, 0, 1, 1,
0.9171214, 0.765976, 1.400745, 0.9607843, 0, 1, 1,
0.9174147, 1.337472, -0.2652491, 0.9686275, 0, 1, 1,
0.9270557, 0.1985991, 0.6470194, 0.972549, 0, 1, 1,
0.9285194, 0.04196838, 1.204499, 0.9803922, 0, 1, 1,
0.928819, 0.2958914, -0.161259, 0.9843137, 0, 1, 1,
0.9342343, 0.9424187, 2.090564, 0.9921569, 0, 1, 1,
0.9390206, 0.00551711, -0.4487901, 0.9960784, 0, 1, 1,
0.9391371, 1.203114, 0.3000441, 1, 0, 0.9960784, 1,
0.9400057, 0.214062, 0.6351353, 1, 0, 0.9882353, 1,
0.9419168, 0.3710955, 1.997953, 1, 0, 0.9843137, 1,
0.9462529, -1.755429, 2.802024, 1, 0, 0.9764706, 1,
0.9478465, -0.4487984, 1.880735, 1, 0, 0.972549, 1,
0.9489152, -0.3488895, 1.094632, 1, 0, 0.9647059, 1,
0.9496921, 0.4093257, 0.3574823, 1, 0, 0.9607843, 1,
0.9502558, 0.3231978, 1.962435, 1, 0, 0.9529412, 1,
0.9549418, 2.607383, 1.733221, 1, 0, 0.9490196, 1,
0.9576889, -0.05684314, 1.245175, 1, 0, 0.9411765, 1,
0.9608405, 0.06572466, 2.140832, 1, 0, 0.9372549, 1,
0.9614303, 1.044119, -0.8162025, 1, 0, 0.9294118, 1,
0.9676057, -0.07687965, 1.308419, 1, 0, 0.9254902, 1,
0.9775158, -0.3139304, 3.19785, 1, 0, 0.9176471, 1,
0.9803675, -1.361725, 1.435509, 1, 0, 0.9137255, 1,
0.9903863, 1.234238, -0.9220855, 1, 0, 0.9058824, 1,
0.9941539, -0.4311992, 2.825673, 1, 0, 0.9019608, 1,
0.9964652, 1.077285, -0.07659105, 1, 0, 0.8941177, 1,
0.9979663, -1.032001, 2.897606, 1, 0, 0.8862745, 1,
0.99826, -0.7913105, 2.528045, 1, 0, 0.8823529, 1,
1.001988, 0.4733589, 0.3162641, 1, 0, 0.8745098, 1,
1.012267, 1.492865, 1.028674, 1, 0, 0.8705882, 1,
1.012688, -0.3016506, 3.62849, 1, 0, 0.8627451, 1,
1.015345, -0.430878, 1.773783, 1, 0, 0.8588235, 1,
1.016988, 0.1580648, 0.4142599, 1, 0, 0.8509804, 1,
1.025285, 0.2899691, 2.595228, 1, 0, 0.8470588, 1,
1.030662, -1.58926, 1.868568, 1, 0, 0.8392157, 1,
1.031892, -0.2897938, -0.04183658, 1, 0, 0.8352941, 1,
1.034916, -0.5898195, 0.1210058, 1, 0, 0.827451, 1,
1.041917, 1.231116, 0.6227787, 1, 0, 0.8235294, 1,
1.04245, 0.717423, -0.0001942699, 1, 0, 0.8156863, 1,
1.044231, 0.569207, 1.976928, 1, 0, 0.8117647, 1,
1.049134, 1.677202, -1.310227, 1, 0, 0.8039216, 1,
1.056091, -0.5670864, 0.5578325, 1, 0, 0.7960784, 1,
1.065091, 0.2251763, 0.09459716, 1, 0, 0.7921569, 1,
1.068026, 0.2903473, 1.239196, 1, 0, 0.7843137, 1,
1.072151, 0.2594354, 1.123195, 1, 0, 0.7803922, 1,
1.076558, 0.3750255, 1.409624, 1, 0, 0.772549, 1,
1.078151, -1.06434, 2.61117, 1, 0, 0.7686275, 1,
1.083475, 0.563314, 1.192517, 1, 0, 0.7607843, 1,
1.086731, -0.4425095, 0.9523334, 1, 0, 0.7568628, 1,
1.090548, -0.3663279, 0.4615492, 1, 0, 0.7490196, 1,
1.098882, 0.02967896, 1.12785, 1, 0, 0.7450981, 1,
1.102259, -0.4693257, 1.407207, 1, 0, 0.7372549, 1,
1.102916, 1.64752, -1.083228, 1, 0, 0.7333333, 1,
1.106663, 0.1834116, 0.772584, 1, 0, 0.7254902, 1,
1.113231, 0.1447086, 0.8763658, 1, 0, 0.7215686, 1,
1.116675, 0.1003472, 1.165602, 1, 0, 0.7137255, 1,
1.120211, 0.7943174, 2.093976, 1, 0, 0.7098039, 1,
1.127448, 0.3905045, -0.1421752, 1, 0, 0.7019608, 1,
1.129053, 0.0616803, 1.175246, 1, 0, 0.6941177, 1,
1.142822, -1.848928, 1.36652, 1, 0, 0.6901961, 1,
1.162472, -0.06576865, 2.335738, 1, 0, 0.682353, 1,
1.168979, -0.5820748, 2.058999, 1, 0, 0.6784314, 1,
1.169182, 0.4252667, 1.046018, 1, 0, 0.6705883, 1,
1.173575, 1.622997, 1.14079, 1, 0, 0.6666667, 1,
1.188622, -0.6216667, 0.5067785, 1, 0, 0.6588235, 1,
1.190365, -0.5349877, 0.3819424, 1, 0, 0.654902, 1,
1.193056, 0.7217893, 1.33614, 1, 0, 0.6470588, 1,
1.200728, 0.2198407, 1.075028, 1, 0, 0.6431373, 1,
1.208147, 0.985283, -0.2338402, 1, 0, 0.6352941, 1,
1.232875, -1.159894, 3.561882, 1, 0, 0.6313726, 1,
1.233067, -1.942085, 0.7536856, 1, 0, 0.6235294, 1,
1.233743, -0.2592622, 1.038102, 1, 0, 0.6196079, 1,
1.240605, 0.9361342, 1.173952, 1, 0, 0.6117647, 1,
1.242049, -1.41776, 0.1304828, 1, 0, 0.6078432, 1,
1.247048, 0.1147912, 2.744437, 1, 0, 0.6, 1,
1.247401, -0.8134059, 0.6204878, 1, 0, 0.5921569, 1,
1.251553, -0.2312354, 0.988009, 1, 0, 0.5882353, 1,
1.266015, -0.1672337, 2.214397, 1, 0, 0.5803922, 1,
1.269214, -1.115722, 3.771356, 1, 0, 0.5764706, 1,
1.27191, -0.5173735, 1.865323, 1, 0, 0.5686275, 1,
1.290247, 0.1645118, 1.971102, 1, 0, 0.5647059, 1,
1.290405, -0.7346447, 2.466469, 1, 0, 0.5568628, 1,
1.303406, -0.4823929, 2.33809, 1, 0, 0.5529412, 1,
1.311354, -0.4629263, 2.9131, 1, 0, 0.5450981, 1,
1.331064, 1.380092, 1.477648, 1, 0, 0.5411765, 1,
1.33115, -0.02099752, 2.790874, 1, 0, 0.5333334, 1,
1.357858, -0.5240919, 1.949565, 1, 0, 0.5294118, 1,
1.359674, -0.8382438, 2.065941, 1, 0, 0.5215687, 1,
1.36173, -2.370835, 1.042442, 1, 0, 0.5176471, 1,
1.367934, 0.6289401, -1.20693, 1, 0, 0.509804, 1,
1.388703, -0.7683984, 4.348766, 1, 0, 0.5058824, 1,
1.391284, -1.395309, 2.282692, 1, 0, 0.4980392, 1,
1.413203, -0.3563884, 3.054617, 1, 0, 0.4901961, 1,
1.418133, -0.07660954, 1.356511, 1, 0, 0.4862745, 1,
1.426241, 0.3688663, 2.510315, 1, 0, 0.4784314, 1,
1.440948, 1.529694, 1.715471, 1, 0, 0.4745098, 1,
1.441385, -0.6739477, 1.951754, 1, 0, 0.4666667, 1,
1.442578, 0.4881746, 2.54548, 1, 0, 0.4627451, 1,
1.467611, -1.776854, 1.792163, 1, 0, 0.454902, 1,
1.472816, 0.4464837, 2.082006, 1, 0, 0.4509804, 1,
1.495229, -0.7448257, 0.5621395, 1, 0, 0.4431373, 1,
1.49748, -0.1092784, 1.276175, 1, 0, 0.4392157, 1,
1.50019, 0.4655502, 0.9738411, 1, 0, 0.4313726, 1,
1.503903, 0.7435347, 1.056789, 1, 0, 0.427451, 1,
1.527595, -0.8413417, 3.423616, 1, 0, 0.4196078, 1,
1.530221, -0.7871947, 1.974157, 1, 0, 0.4156863, 1,
1.541597, 0.4731086, 0.6860419, 1, 0, 0.4078431, 1,
1.543999, 0.05144547, 1.637927, 1, 0, 0.4039216, 1,
1.550961, 0.7510147, 1.617598, 1, 0, 0.3960784, 1,
1.557169, 1.369617, -0.07727861, 1, 0, 0.3882353, 1,
1.570857, -0.06784489, 0.8500091, 1, 0, 0.3843137, 1,
1.579838, -1.025885, 1.862835, 1, 0, 0.3764706, 1,
1.582831, 0.5701198, 1.121724, 1, 0, 0.372549, 1,
1.588399, 1.125748, 0.1986667, 1, 0, 0.3647059, 1,
1.6018, 1.671876, 0.9118457, 1, 0, 0.3607843, 1,
1.606391, -0.7641828, 1.966124, 1, 0, 0.3529412, 1,
1.607623, -0.6829154, 2.892836, 1, 0, 0.3490196, 1,
1.608195, 2.489864, -0.3523803, 1, 0, 0.3411765, 1,
1.613138, 0.5997962, -0.6253927, 1, 0, 0.3372549, 1,
1.617073, 1.586973, -0.198829, 1, 0, 0.3294118, 1,
1.649595, 1.153947, -0.0442329, 1, 0, 0.3254902, 1,
1.658091, -0.3963733, 2.143047, 1, 0, 0.3176471, 1,
1.665579, -0.2541163, 3.274235, 1, 0, 0.3137255, 1,
1.669021, -0.7852468, 2.361979, 1, 0, 0.3058824, 1,
1.684033, 0.03368024, 1.814565, 1, 0, 0.2980392, 1,
1.68837, -0.3791919, 0.6689708, 1, 0, 0.2941177, 1,
1.702688, 1.502576, 1.437264, 1, 0, 0.2862745, 1,
1.709149, -0.02322524, 0.9086661, 1, 0, 0.282353, 1,
1.710509, 1.926824, 1.767837, 1, 0, 0.2745098, 1,
1.71112, -0.03721767, 0.456655, 1, 0, 0.2705882, 1,
1.723634, 0.7865136, 3.43167, 1, 0, 0.2627451, 1,
1.737351, 2.3372, -0.1060104, 1, 0, 0.2588235, 1,
1.741914, 0.8950074, 1.142364, 1, 0, 0.2509804, 1,
1.756958, 1.338616, 2.138459, 1, 0, 0.2470588, 1,
1.763794, 1.578884, 2.389422, 1, 0, 0.2392157, 1,
1.796227, 0.1863843, 2.810096, 1, 0, 0.2352941, 1,
1.814972, 0.01133998, 2.172375, 1, 0, 0.227451, 1,
1.821553, -1.580672, 1.328447, 1, 0, 0.2235294, 1,
1.827826, -0.311126, 1.868342, 1, 0, 0.2156863, 1,
1.831028, 0.2651727, 0.7395964, 1, 0, 0.2117647, 1,
1.843763, -0.4120612, 2.112268, 1, 0, 0.2039216, 1,
1.891065, -1.902418, 3.001271, 1, 0, 0.1960784, 1,
1.927868, -0.1024722, 0.08562382, 1, 0, 0.1921569, 1,
1.941731, -0.02815231, 3.052037, 1, 0, 0.1843137, 1,
1.945564, 0.2956647, 1.157099, 1, 0, 0.1803922, 1,
1.947719, 1.153141, 0.9251413, 1, 0, 0.172549, 1,
1.96268, -0.2959881, 1.874771, 1, 0, 0.1686275, 1,
1.971437, -0.148673, 0.7265872, 1, 0, 0.1607843, 1,
2.007885, -0.6760628, 2.482901, 1, 0, 0.1568628, 1,
2.01275, 0.1823326, 2.294985, 1, 0, 0.1490196, 1,
2.015239, -0.9446682, 1.201522, 1, 0, 0.145098, 1,
2.02398, -0.1866279, 3.607299, 1, 0, 0.1372549, 1,
2.034282, 0.133348, 0.177058, 1, 0, 0.1333333, 1,
2.061339, -0.4047312, 1.760702, 1, 0, 0.1254902, 1,
2.075037, -0.5489287, 1.006633, 1, 0, 0.1215686, 1,
2.077913, -0.6473723, 0.521348, 1, 0, 0.1137255, 1,
2.090751, 0.9166433, 0.8471853, 1, 0, 0.1098039, 1,
2.11801, -0.4342138, -0.09460208, 1, 0, 0.1019608, 1,
2.161038, 0.031994, 3.370632, 1, 0, 0.09411765, 1,
2.20054, 0.3364184, 1.763487, 1, 0, 0.09019608, 1,
2.27663, -0.6860312, 1.014704, 1, 0, 0.08235294, 1,
2.297359, 0.1748514, 1.305667, 1, 0, 0.07843138, 1,
2.31307, -0.1979901, 2.569679, 1, 0, 0.07058824, 1,
2.352147, -0.1046273, 2.519807, 1, 0, 0.06666667, 1,
2.368047, -0.08944329, 0.5336105, 1, 0, 0.05882353, 1,
2.395822, -0.09533016, 2.340097, 1, 0, 0.05490196, 1,
2.403334, -0.6816987, 2.257144, 1, 0, 0.04705882, 1,
2.404404, 0.6972623, 1.177477, 1, 0, 0.04313726, 1,
2.40551, 0.3235, 0.1220534, 1, 0, 0.03529412, 1,
2.479893, 0.1886993, 3.243425, 1, 0, 0.03137255, 1,
2.537642, -0.5333465, 3.66874, 1, 0, 0.02352941, 1,
2.900363, -0.9908344, 2.491518, 1, 0, 0.01960784, 1,
2.961984, 0.003201492, 0.125306, 1, 0, 0.01176471, 1,
3.027262, 2.130955, -0.04109366, 1, 0, 0.007843138, 1
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
-0.09414577, -4.160287, -6.764492, 0, -0.5, 0.5, 0.5,
-0.09414577, -4.160287, -6.764492, 1, -0.5, 0.5, 0.5,
-0.09414577, -4.160287, -6.764492, 1, 1.5, 0.5, 0.5,
-0.09414577, -4.160287, -6.764492, 0, 1.5, 0.5, 0.5
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
-4.273711, -0.0390017, -6.764492, 0, -0.5, 0.5, 0.5,
-4.273711, -0.0390017, -6.764492, 1, -0.5, 0.5, 0.5,
-4.273711, -0.0390017, -6.764492, 1, 1.5, 0.5, 0.5,
-4.273711, -0.0390017, -6.764492, 0, 1.5, 0.5, 0.5
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
-4.273711, -4.160287, 0.4738324, 0, -0.5, 0.5, 0.5,
-4.273711, -4.160287, 0.4738324, 1, -0.5, 0.5, 0.5,
-4.273711, -4.160287, 0.4738324, 1, 1.5, 0.5, 0.5,
-4.273711, -4.160287, 0.4738324, 0, 1.5, 0.5, 0.5
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
-3, -3.209221, -5.09411,
3, -3.209221, -5.09411,
-3, -3.209221, -5.09411,
-3, -3.367732, -5.372507,
-2, -3.209221, -5.09411,
-2, -3.367732, -5.372507,
-1, -3.209221, -5.09411,
-1, -3.367732, -5.372507,
0, -3.209221, -5.09411,
0, -3.367732, -5.372507,
1, -3.209221, -5.09411,
1, -3.367732, -5.372507,
2, -3.209221, -5.09411,
2, -3.367732, -5.372507,
3, -3.209221, -5.09411,
3, -3.367732, -5.372507
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
-3, -3.684754, -5.929301, 0, -0.5, 0.5, 0.5,
-3, -3.684754, -5.929301, 1, -0.5, 0.5, 0.5,
-3, -3.684754, -5.929301, 1, 1.5, 0.5, 0.5,
-3, -3.684754, -5.929301, 0, 1.5, 0.5, 0.5,
-2, -3.684754, -5.929301, 0, -0.5, 0.5, 0.5,
-2, -3.684754, -5.929301, 1, -0.5, 0.5, 0.5,
-2, -3.684754, -5.929301, 1, 1.5, 0.5, 0.5,
-2, -3.684754, -5.929301, 0, 1.5, 0.5, 0.5,
-1, -3.684754, -5.929301, 0, -0.5, 0.5, 0.5,
-1, -3.684754, -5.929301, 1, -0.5, 0.5, 0.5,
-1, -3.684754, -5.929301, 1, 1.5, 0.5, 0.5,
-1, -3.684754, -5.929301, 0, 1.5, 0.5, 0.5,
0, -3.684754, -5.929301, 0, -0.5, 0.5, 0.5,
0, -3.684754, -5.929301, 1, -0.5, 0.5, 0.5,
0, -3.684754, -5.929301, 1, 1.5, 0.5, 0.5,
0, -3.684754, -5.929301, 0, 1.5, 0.5, 0.5,
1, -3.684754, -5.929301, 0, -0.5, 0.5, 0.5,
1, -3.684754, -5.929301, 1, -0.5, 0.5, 0.5,
1, -3.684754, -5.929301, 1, 1.5, 0.5, 0.5,
1, -3.684754, -5.929301, 0, 1.5, 0.5, 0.5,
2, -3.684754, -5.929301, 0, -0.5, 0.5, 0.5,
2, -3.684754, -5.929301, 1, -0.5, 0.5, 0.5,
2, -3.684754, -5.929301, 1, 1.5, 0.5, 0.5,
2, -3.684754, -5.929301, 0, 1.5, 0.5, 0.5,
3, -3.684754, -5.929301, 0, -0.5, 0.5, 0.5,
3, -3.684754, -5.929301, 1, -0.5, 0.5, 0.5,
3, -3.684754, -5.929301, 1, 1.5, 0.5, 0.5,
3, -3.684754, -5.929301, 0, 1.5, 0.5, 0.5
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
-3.309196, -3, -5.09411,
-3.309196, 3, -5.09411,
-3.309196, -3, -5.09411,
-3.469949, -3, -5.372507,
-3.309196, -2, -5.09411,
-3.469949, -2, -5.372507,
-3.309196, -1, -5.09411,
-3.469949, -1, -5.372507,
-3.309196, 0, -5.09411,
-3.469949, 0, -5.372507,
-3.309196, 1, -5.09411,
-3.469949, 1, -5.372507,
-3.309196, 2, -5.09411,
-3.469949, 2, -5.372507,
-3.309196, 3, -5.09411,
-3.469949, 3, -5.372507
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
-3.791454, -3, -5.929301, 0, -0.5, 0.5, 0.5,
-3.791454, -3, -5.929301, 1, -0.5, 0.5, 0.5,
-3.791454, -3, -5.929301, 1, 1.5, 0.5, 0.5,
-3.791454, -3, -5.929301, 0, 1.5, 0.5, 0.5,
-3.791454, -2, -5.929301, 0, -0.5, 0.5, 0.5,
-3.791454, -2, -5.929301, 1, -0.5, 0.5, 0.5,
-3.791454, -2, -5.929301, 1, 1.5, 0.5, 0.5,
-3.791454, -2, -5.929301, 0, 1.5, 0.5, 0.5,
-3.791454, -1, -5.929301, 0, -0.5, 0.5, 0.5,
-3.791454, -1, -5.929301, 1, -0.5, 0.5, 0.5,
-3.791454, -1, -5.929301, 1, 1.5, 0.5, 0.5,
-3.791454, -1, -5.929301, 0, 1.5, 0.5, 0.5,
-3.791454, 0, -5.929301, 0, -0.5, 0.5, 0.5,
-3.791454, 0, -5.929301, 1, -0.5, 0.5, 0.5,
-3.791454, 0, -5.929301, 1, 1.5, 0.5, 0.5,
-3.791454, 0, -5.929301, 0, 1.5, 0.5, 0.5,
-3.791454, 1, -5.929301, 0, -0.5, 0.5, 0.5,
-3.791454, 1, -5.929301, 1, -0.5, 0.5, 0.5,
-3.791454, 1, -5.929301, 1, 1.5, 0.5, 0.5,
-3.791454, 1, -5.929301, 0, 1.5, 0.5, 0.5,
-3.791454, 2, -5.929301, 0, -0.5, 0.5, 0.5,
-3.791454, 2, -5.929301, 1, -0.5, 0.5, 0.5,
-3.791454, 2, -5.929301, 1, 1.5, 0.5, 0.5,
-3.791454, 2, -5.929301, 0, 1.5, 0.5, 0.5,
-3.791454, 3, -5.929301, 0, -0.5, 0.5, 0.5,
-3.791454, 3, -5.929301, 1, -0.5, 0.5, 0.5,
-3.791454, 3, -5.929301, 1, 1.5, 0.5, 0.5,
-3.791454, 3, -5.929301, 0, 1.5, 0.5, 0.5
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
-3.309196, -3.209221, -4,
-3.309196, -3.209221, 4,
-3.309196, -3.209221, -4,
-3.469949, -3.367732, -4,
-3.309196, -3.209221, -2,
-3.469949, -3.367732, -2,
-3.309196, -3.209221, 0,
-3.469949, -3.367732, 0,
-3.309196, -3.209221, 2,
-3.469949, -3.367732, 2,
-3.309196, -3.209221, 4,
-3.469949, -3.367732, 4
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
-3.791454, -3.684754, -4, 0, -0.5, 0.5, 0.5,
-3.791454, -3.684754, -4, 1, -0.5, 0.5, 0.5,
-3.791454, -3.684754, -4, 1, 1.5, 0.5, 0.5,
-3.791454, -3.684754, -4, 0, 1.5, 0.5, 0.5,
-3.791454, -3.684754, -2, 0, -0.5, 0.5, 0.5,
-3.791454, -3.684754, -2, 1, -0.5, 0.5, 0.5,
-3.791454, -3.684754, -2, 1, 1.5, 0.5, 0.5,
-3.791454, -3.684754, -2, 0, 1.5, 0.5, 0.5,
-3.791454, -3.684754, 0, 0, -0.5, 0.5, 0.5,
-3.791454, -3.684754, 0, 1, -0.5, 0.5, 0.5,
-3.791454, -3.684754, 0, 1, 1.5, 0.5, 0.5,
-3.791454, -3.684754, 0, 0, 1.5, 0.5, 0.5,
-3.791454, -3.684754, 2, 0, -0.5, 0.5, 0.5,
-3.791454, -3.684754, 2, 1, -0.5, 0.5, 0.5,
-3.791454, -3.684754, 2, 1, 1.5, 0.5, 0.5,
-3.791454, -3.684754, 2, 0, 1.5, 0.5, 0.5,
-3.791454, -3.684754, 4, 0, -0.5, 0.5, 0.5,
-3.791454, -3.684754, 4, 1, -0.5, 0.5, 0.5,
-3.791454, -3.684754, 4, 1, 1.5, 0.5, 0.5,
-3.791454, -3.684754, 4, 0, 1.5, 0.5, 0.5
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
-3.309196, -3.209221, -5.09411,
-3.309196, 3.131218, -5.09411,
-3.309196, -3.209221, 6.041774,
-3.309196, 3.131218, 6.041774,
-3.309196, -3.209221, -5.09411,
-3.309196, -3.209221, 6.041774,
-3.309196, 3.131218, -5.09411,
-3.309196, 3.131218, 6.041774,
-3.309196, -3.209221, -5.09411,
3.120904, -3.209221, -5.09411,
-3.309196, -3.209221, 6.041774,
3.120904, -3.209221, 6.041774,
-3.309196, 3.131218, -5.09411,
3.120904, 3.131218, -5.09411,
-3.309196, 3.131218, 6.041774,
3.120904, 3.131218, 6.041774,
3.120904, -3.209221, -5.09411,
3.120904, 3.131218, -5.09411,
3.120904, -3.209221, 6.041774,
3.120904, 3.131218, 6.041774,
3.120904, -3.209221, -5.09411,
3.120904, -3.209221, 6.041774,
3.120904, 3.131218, -5.09411,
3.120904, 3.131218, 6.041774
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
var radius = 7.655786;
var distance = 34.06145;
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
mvMatrix.translate( 0.09414577, 0.0390017, -0.4738324 );
mvMatrix.scale( 1.287318, 1.305522, 0.7433254 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.06145);
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
fenchlorazole-ethyl<-read.table("fenchlorazole-ethyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenchlorazole-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenchlorazole' not found
```

```r
y<-fenchlorazole-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenchlorazole' not found
```

```r
z<-fenchlorazole-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenchlorazole' not found
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
-3.215554, 0.757302, -1.499029, 0, 0, 1, 1, 1,
-2.910929, -0.2477981, -2.624102, 1, 0, 0, 1, 1,
-2.895084, -0.4608332, -1.733977, 1, 0, 0, 1, 1,
-2.647202, -0.09916212, -0.9307519, 1, 0, 0, 1, 1,
-2.564316, 1.523136, -1.053915, 1, 0, 0, 1, 1,
-2.450199, -1.333441, -1.927689, 1, 0, 0, 1, 1,
-2.434184, -1.359432, -2.059688, 0, 0, 0, 1, 1,
-2.37796, 0.05957567, -0.6609025, 0, 0, 0, 1, 1,
-2.35997, -0.7794701, -2.648554, 0, 0, 0, 1, 1,
-2.357623, 0.4843976, -1.518021, 0, 0, 0, 1, 1,
-2.256535, -0.2757577, -1.975239, 0, 0, 0, 1, 1,
-2.255164, 1.079776, -2.00952, 0, 0, 0, 1, 1,
-2.254324, 0.2869666, -1.309405, 0, 0, 0, 1, 1,
-2.230745, 0.1603566, -1.203691, 1, 1, 1, 1, 1,
-2.22354, -1.04669, -0.4627539, 1, 1, 1, 1, 1,
-2.211508, 0.8684568, -1.691425, 1, 1, 1, 1, 1,
-2.150618, -2.64004, -1.054393, 1, 1, 1, 1, 1,
-2.137991, -0.1889325, -2.149044, 1, 1, 1, 1, 1,
-2.108666, 1.061164, -0.7208247, 1, 1, 1, 1, 1,
-2.10065, -0.9771031, -2.336251, 1, 1, 1, 1, 1,
-2.092697, 1.073343, 0.1251072, 1, 1, 1, 1, 1,
-2.051518, -0.1340835, -1.503356, 1, 1, 1, 1, 1,
-2.041405, 1.921927, -0.5634263, 1, 1, 1, 1, 1,
-2.032789, -0.1444586, -2.945555, 1, 1, 1, 1, 1,
-2.004366, -1.946486, -3.466438, 1, 1, 1, 1, 1,
-1.993385, 0.8335121, -1.474471, 1, 1, 1, 1, 1,
-1.978447, -0.09689449, -1.919742, 1, 1, 1, 1, 1,
-1.976531, -0.4434092, -1.65649, 1, 1, 1, 1, 1,
-1.958121, -0.1373725, -2.522981, 0, 0, 1, 1, 1,
-1.922025, 0.6506193, -0.7552462, 1, 0, 0, 1, 1,
-1.902719, 1.101414, -1.436972, 1, 0, 0, 1, 1,
-1.887004, 0.7639516, -1.760231, 1, 0, 0, 1, 1,
-1.878829, 0.9393417, -0.5667851, 1, 0, 0, 1, 1,
-1.861277, 0.3672462, 0.4908195, 1, 0, 0, 1, 1,
-1.857345, -0.8290551, -1.722731, 0, 0, 0, 1, 1,
-1.848764, -0.1048215, -1.09291, 0, 0, 0, 1, 1,
-1.843457, -0.2102325, -2.83256, 0, 0, 0, 1, 1,
-1.838098, -1.243189, -2.436881, 0, 0, 0, 1, 1,
-1.821708, -0.5706005, -3.171901, 0, 0, 0, 1, 1,
-1.768783, 1.203535, -2.318936, 0, 0, 0, 1, 1,
-1.747411, -0.2825214, -1.239234, 0, 0, 0, 1, 1,
-1.740847, -0.131246, -1.143237, 1, 1, 1, 1, 1,
-1.728328, -1.762935, -2.378825, 1, 1, 1, 1, 1,
-1.718703, -0.08521798, -2.100984, 1, 1, 1, 1, 1,
-1.714468, 0.2039094, -1.404048, 1, 1, 1, 1, 1,
-1.695081, -1.129453, -1.589911, 1, 1, 1, 1, 1,
-1.686165, -1.005017, -1.329143, 1, 1, 1, 1, 1,
-1.685969, 0.6088697, -0.6192624, 1, 1, 1, 1, 1,
-1.671927, 0.4138824, -2.958018, 1, 1, 1, 1, 1,
-1.668337, 0.4200164, -0.5686, 1, 1, 1, 1, 1,
-1.65328, -0.8390508, -2.301976, 1, 1, 1, 1, 1,
-1.636065, -1.284628, -1.861105, 1, 1, 1, 1, 1,
-1.631993, 1.733441, -0.175708, 1, 1, 1, 1, 1,
-1.621324, -0.6411399, -2.64136, 1, 1, 1, 1, 1,
-1.607727, -0.006820195, -1.506306, 1, 1, 1, 1, 1,
-1.568791, 1.072582, -0.7039215, 1, 1, 1, 1, 1,
-1.544279, -0.7714104, -3.311497, 0, 0, 1, 1, 1,
-1.529473, -0.02469717, -1.477644, 1, 0, 0, 1, 1,
-1.524723, -1.187652, -2.670849, 1, 0, 0, 1, 1,
-1.521999, 1.160272, -2.804704, 1, 0, 0, 1, 1,
-1.517354, -0.3163261, -3.330472, 1, 0, 0, 1, 1,
-1.5159, 1.376409, -0.4660756, 1, 0, 0, 1, 1,
-1.515859, -0.5425783, -3.881378, 0, 0, 0, 1, 1,
-1.515103, 1.455458, -1.869959, 0, 0, 0, 1, 1,
-1.513463, 0.5090457, -0.9888719, 0, 0, 0, 1, 1,
-1.497137, 0.6325313, -1.046522, 0, 0, 0, 1, 1,
-1.496034, 0.2537754, -1.605864, 0, 0, 0, 1, 1,
-1.487905, 1.538345, -0.5147276, 0, 0, 0, 1, 1,
-1.477658, -0.5601227, -2.307551, 0, 0, 0, 1, 1,
-1.477476, -0.5388405, -2.034119, 1, 1, 1, 1, 1,
-1.467334, 0.9212201, -1.366932, 1, 1, 1, 1, 1,
-1.437415, -0.9685907, -0.9836968, 1, 1, 1, 1, 1,
-1.436042, -1.025574, -2.855386, 1, 1, 1, 1, 1,
-1.421227, -0.04930503, -1.895935, 1, 1, 1, 1, 1,
-1.420727, -0.486159, -2.00734, 1, 1, 1, 1, 1,
-1.396451, 0.06843304, -0.6953623, 1, 1, 1, 1, 1,
-1.391329, -0.5799091, -0.6836338, 1, 1, 1, 1, 1,
-1.386144, -0.4468599, -1.17224, 1, 1, 1, 1, 1,
-1.382186, -0.3649914, -2.618253, 1, 1, 1, 1, 1,
-1.370296, 2.512689, 0.473699, 1, 1, 1, 1, 1,
-1.365542, 0.4871494, 0.494905, 1, 1, 1, 1, 1,
-1.35849, -1.040073, -3.364574, 1, 1, 1, 1, 1,
-1.35839, 0.8263981, -2.934104, 1, 1, 1, 1, 1,
-1.355932, 1.746469, -0.2513787, 1, 1, 1, 1, 1,
-1.352836, 1.987275, -2.026475, 0, 0, 1, 1, 1,
-1.348482, 1.906781, -0.1453685, 1, 0, 0, 1, 1,
-1.339764, 0.130899, -1.662308, 1, 0, 0, 1, 1,
-1.335577, 0.01014053, -0.2596217, 1, 0, 0, 1, 1,
-1.334353, 1.426072, -1.001911, 1, 0, 0, 1, 1,
-1.33064, -0.3747054, -0.7958207, 1, 0, 0, 1, 1,
-1.323817, -0.3936634, -3.028596, 0, 0, 0, 1, 1,
-1.323261, -0.9752509, -3.443531, 0, 0, 0, 1, 1,
-1.321024, -1.195191, -0.3703826, 0, 0, 0, 1, 1,
-1.320602, 0.4427329, -1.153769, 0, 0, 0, 1, 1,
-1.31421, 0.8787339, 0.224962, 0, 0, 0, 1, 1,
-1.309713, -0.9139114, -1.738785, 0, 0, 0, 1, 1,
-1.304948, 0.2437885, -2.194551, 0, 0, 0, 1, 1,
-1.286465, 1.456252, -0.9241117, 1, 1, 1, 1, 1,
-1.270261, -0.9315545, -2.781714, 1, 1, 1, 1, 1,
-1.261456, 0.4580976, -0.7016697, 1, 1, 1, 1, 1,
-1.259989, 0.1720383, -1.679684, 1, 1, 1, 1, 1,
-1.257776, -0.1035992, 0.4158935, 1, 1, 1, 1, 1,
-1.257581, 0.7221137, -2.266444, 1, 1, 1, 1, 1,
-1.254655, 0.2499191, -2.533214, 1, 1, 1, 1, 1,
-1.239447, 0.5939372, -0.4572931, 1, 1, 1, 1, 1,
-1.231832, 2.204736, -0.4866038, 1, 1, 1, 1, 1,
-1.218191, -2.075984, -1.309978, 1, 1, 1, 1, 1,
-1.214518, 0.1911518, -0.990594, 1, 1, 1, 1, 1,
-1.21338, 0.5626892, 0.09233841, 1, 1, 1, 1, 1,
-1.208827, -0.5550491, -1.939763, 1, 1, 1, 1, 1,
-1.207817, -0.395948, -1.918195, 1, 1, 1, 1, 1,
-1.205041, 0.4402927, -0.4083366, 1, 1, 1, 1, 1,
-1.178061, 0.459995, -0.8684381, 0, 0, 1, 1, 1,
-1.173988, -0.4535998, -1.165235, 1, 0, 0, 1, 1,
-1.169365, 0.1841961, -1.353484, 1, 0, 0, 1, 1,
-1.161012, 0.07841745, -2.629724, 1, 0, 0, 1, 1,
-1.157704, -0.4809756, -1.610893, 1, 0, 0, 1, 1,
-1.141181, 1.665665, 0.4407834, 1, 0, 0, 1, 1,
-1.137326, -0.9019347, -2.868486, 0, 0, 0, 1, 1,
-1.130589, -0.6970035, -2.799866, 0, 0, 0, 1, 1,
-1.12904, 1.677667, 0.06126933, 0, 0, 0, 1, 1,
-1.125893, -1.243716, -1.937487, 0, 0, 0, 1, 1,
-1.124208, -1.244429, -1.378305, 0, 0, 0, 1, 1,
-1.114929, 1.047292, 0.7393622, 0, 0, 0, 1, 1,
-1.111007, -0.3571492, -2.091049, 0, 0, 0, 1, 1,
-1.10442, -1.079243, -0.9627373, 1, 1, 1, 1, 1,
-1.094347, 1.026858, 0.0420766, 1, 1, 1, 1, 1,
-1.092092, -0.7238199, -3.013824, 1, 1, 1, 1, 1,
-1.089564, 1.47564, -0.2254779, 1, 1, 1, 1, 1,
-1.088784, -0.9313046, -1.196074, 1, 1, 1, 1, 1,
-1.087401, -0.8634762, -1.774191, 1, 1, 1, 1, 1,
-1.086007, -0.4116215, -2.535738, 1, 1, 1, 1, 1,
-1.078613, 0.08917641, -2.169436, 1, 1, 1, 1, 1,
-1.074925, -0.5442301, -1.976837, 1, 1, 1, 1, 1,
-1.074115, 0.223219, -2.032954, 1, 1, 1, 1, 1,
-1.072499, -0.05977713, -2.540637, 1, 1, 1, 1, 1,
-1.068224, 0.5094765, -1.265932, 1, 1, 1, 1, 1,
-1.051825, -0.3025478, -3.50176, 1, 1, 1, 1, 1,
-1.047309, -0.2153388, -1.128912, 1, 1, 1, 1, 1,
-1.044584, 0.4575607, -1.284672, 1, 1, 1, 1, 1,
-1.04294, -1.314109, -2.707088, 0, 0, 1, 1, 1,
-1.038348, 1.656878, -1.957807, 1, 0, 0, 1, 1,
-1.035475, -1.161951, -1.436196, 1, 0, 0, 1, 1,
-1.030805, 1.669734, 0.368511, 1, 0, 0, 1, 1,
-1.030049, -0.8046782, -3.046548, 1, 0, 0, 1, 1,
-1.029714, -0.9425229, -1.948164, 1, 0, 0, 1, 1,
-1.025522, -1.221573, -2.305652, 0, 0, 0, 1, 1,
-1.024313, 0.768382, -1.487417, 0, 0, 0, 1, 1,
-1.02351, 0.624638, -0.8760096, 0, 0, 0, 1, 1,
-1.019812, -0.5962298, -3.250492, 0, 0, 0, 1, 1,
-1.015979, 0.5671778, 0.4458317, 0, 0, 0, 1, 1,
-1.009023, 0.9220748, 0.5398594, 0, 0, 0, 1, 1,
-1.002505, 1.876132, -1.305233, 0, 0, 0, 1, 1,
-1.000071, -0.1367969, -2.702223, 1, 1, 1, 1, 1,
-0.996765, -3.116885, -2.830327, 1, 1, 1, 1, 1,
-0.9948736, -1.388464, -2.473611, 1, 1, 1, 1, 1,
-0.9928349, -1.350268, -3.446661, 1, 1, 1, 1, 1,
-0.9890925, -0.0453806, -0.4344502, 1, 1, 1, 1, 1,
-0.9855202, 0.05800749, -1.135107, 1, 1, 1, 1, 1,
-0.9775578, 0.07493429, -1.114115, 1, 1, 1, 1, 1,
-0.9720246, 1.039092, -0.417091, 1, 1, 1, 1, 1,
-0.9718933, -1.027224, -1.057968, 1, 1, 1, 1, 1,
-0.9693841, 0.2539763, -2.798549, 1, 1, 1, 1, 1,
-0.9672151, -1.273947, -3.08831, 1, 1, 1, 1, 1,
-0.9633528, -0.1512982, -2.50735, 1, 1, 1, 1, 1,
-0.9615728, 0.03704001, -2.024865, 1, 1, 1, 1, 1,
-0.9612966, -0.2639289, -1.590201, 1, 1, 1, 1, 1,
-0.959101, 0.4383173, -1.544423, 1, 1, 1, 1, 1,
-0.9481401, 1.329971, -0.2233046, 0, 0, 1, 1, 1,
-0.9433377, -0.8316918, -3.165386, 1, 0, 0, 1, 1,
-0.9378625, 0.1585675, -0.9635285, 1, 0, 0, 1, 1,
-0.9358981, 2.203416, -1.784488, 1, 0, 0, 1, 1,
-0.9293179, -1.201644, -2.210758, 1, 0, 0, 1, 1,
-0.9283884, 0.304828, -2.356225, 1, 0, 0, 1, 1,
-0.921919, 0.5877753, -1.779827, 0, 0, 0, 1, 1,
-0.9197447, 0.3386099, -1.998011, 0, 0, 0, 1, 1,
-0.9193731, 0.7236256, 0.2508677, 0, 0, 0, 1, 1,
-0.9065651, -1.520759, -4.187601, 0, 0, 0, 1, 1,
-0.9027073, -1.965241, -2.601657, 0, 0, 0, 1, 1,
-0.9023473, 1.394554, -1.482975, 0, 0, 0, 1, 1,
-0.8865751, 0.1201091, -2.424668, 0, 0, 0, 1, 1,
-0.8834007, 1.903268, 0.43835, 1, 1, 1, 1, 1,
-0.882201, -1.537898, -1.826781, 1, 1, 1, 1, 1,
-0.8808749, 0.5745916, -2.127361, 1, 1, 1, 1, 1,
-0.8735611, -0.5138505, -3.44734, 1, 1, 1, 1, 1,
-0.8718481, 0.9613498, -1.716186, 1, 1, 1, 1, 1,
-0.8649855, 1.225802, -1.640178, 1, 1, 1, 1, 1,
-0.8647991, 1.230519, -0.761872, 1, 1, 1, 1, 1,
-0.8591751, 0.827911, -0.252015, 1, 1, 1, 1, 1,
-0.8573699, 0.3420106, -1.130092, 1, 1, 1, 1, 1,
-0.8545657, 0.009778475, -1.822716, 1, 1, 1, 1, 1,
-0.8543058, -1.602665, -1.547503, 1, 1, 1, 1, 1,
-0.8537831, -1.121912, -2.576582, 1, 1, 1, 1, 1,
-0.8517603, 1.442801, -0.5764928, 1, 1, 1, 1, 1,
-0.8506657, 0.03296404, 0.7417729, 1, 1, 1, 1, 1,
-0.8495663, -0.3388547, -2.71464, 1, 1, 1, 1, 1,
-0.8428409, -0.0640962, -1.747783, 0, 0, 1, 1, 1,
-0.8342908, 0.500101, -1.027288, 1, 0, 0, 1, 1,
-0.8341295, 0.3286797, 0.7856061, 1, 0, 0, 1, 1,
-0.825135, 0.06122729, 1.10746, 1, 0, 0, 1, 1,
-0.8215348, 0.2119129, -1.619855, 1, 0, 0, 1, 1,
-0.8155468, 0.290871, -1.441445, 1, 0, 0, 1, 1,
-0.8150427, -0.8782597, -2.381191, 0, 0, 0, 1, 1,
-0.8118026, -0.2731716, -2.92597, 0, 0, 0, 1, 1,
-0.80803, 0.2583806, -2.483647, 0, 0, 0, 1, 1,
-0.8026809, 0.1045786, -2.041998, 0, 0, 0, 1, 1,
-0.8009382, -0.8920962, -3.565926, 0, 0, 0, 1, 1,
-0.7995707, 0.7521977, -2.25813, 0, 0, 0, 1, 1,
-0.7988545, -0.7093869, -1.366237, 0, 0, 0, 1, 1,
-0.7977769, -0.7928421, 1.122756, 1, 1, 1, 1, 1,
-0.7967969, -0.9395467, -3.166755, 1, 1, 1, 1, 1,
-0.793529, -1.053621, -2.762612, 1, 1, 1, 1, 1,
-0.7865206, 0.9620351, -0.9696722, 1, 1, 1, 1, 1,
-0.7807975, 3.038881, 0.5680165, 1, 1, 1, 1, 1,
-0.7793446, 0.08669847, -0.7692499, 1, 1, 1, 1, 1,
-0.7784451, -0.2980807, -0.7225292, 1, 1, 1, 1, 1,
-0.7690421, -0.4158144, -2.436941, 1, 1, 1, 1, 1,
-0.7655728, -0.5850129, -2.708378, 1, 1, 1, 1, 1,
-0.7623966, -0.7331383, -2.834537, 1, 1, 1, 1, 1,
-0.7610943, 0.657003, 0.09238011, 1, 1, 1, 1, 1,
-0.7589111, 0.632947, -0.3044579, 1, 1, 1, 1, 1,
-0.7567104, 0.1301105, -1.306556, 1, 1, 1, 1, 1,
-0.7523497, -1.074397, -3.05522, 1, 1, 1, 1, 1,
-0.7519778, 1.15083, -0.02038041, 1, 1, 1, 1, 1,
-0.7472821, 0.2902545, -1.941073, 0, 0, 1, 1, 1,
-0.7465312, 0.1744843, -1.036753, 1, 0, 0, 1, 1,
-0.7426029, -2.035953, -3.349544, 1, 0, 0, 1, 1,
-0.7416254, 1.470852, -1.486286, 1, 0, 0, 1, 1,
-0.7405403, -0.3358591, -0.245974, 1, 0, 0, 1, 1,
-0.7403486, -2.807652, -3.287848, 1, 0, 0, 1, 1,
-0.7357125, 0.6629298, 0.479234, 0, 0, 0, 1, 1,
-0.7328214, 0.4078343, -1.831186, 0, 0, 0, 1, 1,
-0.7288466, 0.8969316, -2.34654, 0, 0, 0, 1, 1,
-0.7282559, 0.6299372, -0.09929669, 0, 0, 0, 1, 1,
-0.7262435, 0.7660051, -2.028966, 0, 0, 0, 1, 1,
-0.725358, 0.01227214, -0.919508, 0, 0, 0, 1, 1,
-0.7248402, 0.8428198, -0.1910147, 0, 0, 0, 1, 1,
-0.7169172, -0.7207701, -2.336038, 1, 1, 1, 1, 1,
-0.7159964, 2.280223, 0.7237986, 1, 1, 1, 1, 1,
-0.7156426, 0.8724228, -1.300702, 1, 1, 1, 1, 1,
-0.7101728, -0.5892766, -2.642437, 1, 1, 1, 1, 1,
-0.70835, -0.9294579, -0.6658944, 1, 1, 1, 1, 1,
-0.7069888, 0.1536357, 0.08659764, 1, 1, 1, 1, 1,
-0.7069453, -0.6307086, -0.6466574, 1, 1, 1, 1, 1,
-0.7029494, -1.147962, -1.524746, 1, 1, 1, 1, 1,
-0.7005997, -2.006259, -2.472413, 1, 1, 1, 1, 1,
-0.6934713, -0.1697466, -3.014644, 1, 1, 1, 1, 1,
-0.6893635, 1.551417, 1.495247, 1, 1, 1, 1, 1,
-0.6854737, 0.3614814, 0.03686117, 1, 1, 1, 1, 1,
-0.6802111, -0.3004181, -1.827207, 1, 1, 1, 1, 1,
-0.6722096, 2.25638, 0.1546238, 1, 1, 1, 1, 1,
-0.6702006, -0.8697243, 0.1919675, 1, 1, 1, 1, 1,
-0.6635028, 1.178296, 0.3852925, 0, 0, 1, 1, 1,
-0.6545103, 0.0007118257, -1.478242, 1, 0, 0, 1, 1,
-0.6528283, 0.2856566, -0.06987602, 1, 0, 0, 1, 1,
-0.6513547, 0.7634782, -0.1030898, 1, 0, 0, 1, 1,
-0.6461344, -1.240499, -2.876914, 1, 0, 0, 1, 1,
-0.6423343, 0.6279405, 0.9019643, 1, 0, 0, 1, 1,
-0.6409763, -1.244821, -3.964417, 0, 0, 0, 1, 1,
-0.6373664, -1.432876, -4.067506, 0, 0, 0, 1, 1,
-0.635914, 1.400948, 1.976221, 0, 0, 0, 1, 1,
-0.6302778, -0.185649, -2.541732, 0, 0, 0, 1, 1,
-0.6224185, 0.4635368, -2.238423, 0, 0, 0, 1, 1,
-0.6184913, -0.1782402, -1.160262, 0, 0, 0, 1, 1,
-0.6156598, -0.1440757, -2.166856, 0, 0, 0, 1, 1,
-0.6147262, 2.161357, 1.319999, 1, 1, 1, 1, 1,
-0.6094347, -0.4307295, -1.420948, 1, 1, 1, 1, 1,
-0.5978776, -1.391664, -2.490678, 1, 1, 1, 1, 1,
-0.5943166, 0.6330344, -2.240421, 1, 1, 1, 1, 1,
-0.5933592, 1.406147, 0.3955048, 1, 1, 1, 1, 1,
-0.5867737, -1.52727, -2.581178, 1, 1, 1, 1, 1,
-0.5859746, -1.246848, -1.978616, 1, 1, 1, 1, 1,
-0.583994, 1.221654, -2.356259, 1, 1, 1, 1, 1,
-0.5836439, 0.5326737, -0.5876318, 1, 1, 1, 1, 1,
-0.5795273, -1.875867, -3.515209, 1, 1, 1, 1, 1,
-0.576941, 1.986672, -0.9744941, 1, 1, 1, 1, 1,
-0.5717831, 0.6507858, -1.325258, 1, 1, 1, 1, 1,
-0.5716581, 0.5318387, -0.5709119, 1, 1, 1, 1, 1,
-0.565705, -1.44843, -1.970427, 1, 1, 1, 1, 1,
-0.5643368, -1.229543, -4.065016, 1, 1, 1, 1, 1,
-0.5589828, 0.2894053, -3.214352, 0, 0, 1, 1, 1,
-0.5584694, -0.1197575, -2.784142, 1, 0, 0, 1, 1,
-0.5521475, -0.004451518, -1.672994, 1, 0, 0, 1, 1,
-0.5404787, 0.4207041, -0.998977, 1, 0, 0, 1, 1,
-0.5398059, -0.2712344, -3.078749, 1, 0, 0, 1, 1,
-0.5382255, -0.7665688, -3.001048, 1, 0, 0, 1, 1,
-0.537903, 0.6560977, 0.9187551, 0, 0, 0, 1, 1,
-0.5364156, -2.449959, -3.734455, 0, 0, 0, 1, 1,
-0.5177943, -0.4625174, -1.697946, 0, 0, 0, 1, 1,
-0.5151736, 1.506193, -1.429816, 0, 0, 0, 1, 1,
-0.5143587, -0.5018945, -4.011631, 0, 0, 0, 1, 1,
-0.513895, -1.434811, -2.405828, 0, 0, 0, 1, 1,
-0.5103263, 0.7469541, -1.846583, 0, 0, 0, 1, 1,
-0.5097029, -0.4446115, -1.411385, 1, 1, 1, 1, 1,
-0.5081728, -1.009773, -3.217433, 1, 1, 1, 1, 1,
-0.5049376, -1.422882, -1.453231, 1, 1, 1, 1, 1,
-0.4956718, 2.142694, 0.9181045, 1, 1, 1, 1, 1,
-0.4874579, 0.2323271, 0.7726135, 1, 1, 1, 1, 1,
-0.4856432, 0.7638898, 0.3447368, 1, 1, 1, 1, 1,
-0.4838805, 0.6091821, -1.103004, 1, 1, 1, 1, 1,
-0.48191, -0.900539, -4.931936, 1, 1, 1, 1, 1,
-0.4807771, 0.1924426, -0.4240755, 1, 1, 1, 1, 1,
-0.4801512, -0.5296489, -2.192194, 1, 1, 1, 1, 1,
-0.4785349, 0.9708282, -1.251415, 1, 1, 1, 1, 1,
-0.4774625, -0.7353101, -3.74015, 1, 1, 1, 1, 1,
-0.4737545, 2.078093, -1.405797, 1, 1, 1, 1, 1,
-0.4728755, -1.117835, -3.786398, 1, 1, 1, 1, 1,
-0.4674469, -0.1511203, -3.02905, 1, 1, 1, 1, 1,
-0.4656422, 1.062067, -2.116797, 0, 0, 1, 1, 1,
-0.4654972, -1.7695, 0.7439407, 1, 0, 0, 1, 1,
-0.4632216, -0.5032616, -2.370934, 1, 0, 0, 1, 1,
-0.4602916, 0.3546322, -0.08317622, 1, 0, 0, 1, 1,
-0.4592564, -0.2803319, -1.656154, 1, 0, 0, 1, 1,
-0.4591726, 2.712228, 0.5044637, 1, 0, 0, 1, 1,
-0.4557016, 2.108268, -0.08913642, 0, 0, 0, 1, 1,
-0.4521144, 1.040925, 0.1909239, 0, 0, 0, 1, 1,
-0.4515075, -0.02053576, -1.990342, 0, 0, 0, 1, 1,
-0.4405743, -0.4115636, -4.405753, 0, 0, 0, 1, 1,
-0.4399874, 0.551546, -0.4747027, 0, 0, 0, 1, 1,
-0.4398776, 0.5764185, -0.5861593, 0, 0, 0, 1, 1,
-0.4388244, -0.9622915, -2.522674, 0, 0, 0, 1, 1,
-0.4386018, -0.5341814, -3.413113, 1, 1, 1, 1, 1,
-0.4361948, -0.1765239, -2.018346, 1, 1, 1, 1, 1,
-0.4353929, 1.758442, 1.992862, 1, 1, 1, 1, 1,
-0.4340593, -0.07829354, -2.254128, 1, 1, 1, 1, 1,
-0.4329427, 0.2900741, -0.1290604, 1, 1, 1, 1, 1,
-0.4287243, 1.509916, -0.6656089, 1, 1, 1, 1, 1,
-0.4281323, -0.3958314, -2.86696, 1, 1, 1, 1, 1,
-0.4264647, 0.8333529, -1.838536, 1, 1, 1, 1, 1,
-0.4256054, 0.7390888, -1.385725, 1, 1, 1, 1, 1,
-0.4252178, -1.094641, -3.720389, 1, 1, 1, 1, 1,
-0.4232975, -1.015716, -4.136374, 1, 1, 1, 1, 1,
-0.4190477, -0.7130206, -2.985677, 1, 1, 1, 1, 1,
-0.4185447, 0.9308531, -0.2869233, 1, 1, 1, 1, 1,
-0.4129838, -0.8618366, -3.81002, 1, 1, 1, 1, 1,
-0.409963, 0.3050309, 0.08209016, 1, 1, 1, 1, 1,
-0.4065554, -0.8278065, -4.651429, 0, 0, 1, 1, 1,
-0.4026753, -0.9869173, -2.320767, 1, 0, 0, 1, 1,
-0.4023255, 0.1505356, -0.09901003, 1, 0, 0, 1, 1,
-0.3983649, 0.06002641, -0.891094, 1, 0, 0, 1, 1,
-0.3927666, 0.1193267, -1.376515, 1, 0, 0, 1, 1,
-0.3905214, -0.4492353, -2.172035, 1, 0, 0, 1, 1,
-0.3885961, 0.05894617, -1.944722, 0, 0, 0, 1, 1,
-0.387967, 1.944164, 0.4741161, 0, 0, 0, 1, 1,
-0.3877079, -0.3768645, -1.384933, 0, 0, 0, 1, 1,
-0.3855073, 0.4305054, -0.2048987, 0, 0, 0, 1, 1,
-0.3840526, 0.9255709, -0.3422696, 0, 0, 0, 1, 1,
-0.3792712, -0.1376726, -0.4606527, 0, 0, 0, 1, 1,
-0.377341, 0.2160901, 0.8171829, 0, 0, 0, 1, 1,
-0.377095, 1.243183, -1.810032, 1, 1, 1, 1, 1,
-0.375702, 0.9783509, 1.441269, 1, 1, 1, 1, 1,
-0.3701151, 1.231739, -1.193222, 1, 1, 1, 1, 1,
-0.3600034, -0.2674793, -0.9290003, 1, 1, 1, 1, 1,
-0.3582533, 0.007115407, -1.975268, 1, 1, 1, 1, 1,
-0.3581157, -1.153906, -2.920201, 1, 1, 1, 1, 1,
-0.3575111, -1.054149, -2.546886, 1, 1, 1, 1, 1,
-0.3573329, -0.6378704, -0.2424113, 1, 1, 1, 1, 1,
-0.3571021, 0.2826634, -1.582231, 1, 1, 1, 1, 1,
-0.3506911, 0.1420124, -0.9691194, 1, 1, 1, 1, 1,
-0.3494901, 1.387623, -0.7887267, 1, 1, 1, 1, 1,
-0.3494607, 1.341307, 0.3677108, 1, 1, 1, 1, 1,
-0.3476055, 0.5535694, 0.1001389, 1, 1, 1, 1, 1,
-0.3454571, 0.5595666, -1.045151, 1, 1, 1, 1, 1,
-0.3430541, 0.8831939, -1.480539, 1, 1, 1, 1, 1,
-0.339146, 1.739817, -0.004996779, 0, 0, 1, 1, 1,
-0.3378776, -1.657766, -3.313798, 1, 0, 0, 1, 1,
-0.3357162, -0.5353518, -3.183127, 1, 0, 0, 1, 1,
-0.3345019, -0.206407, -1.1797, 1, 0, 0, 1, 1,
-0.3344952, 1.462289, -1.329414, 1, 0, 0, 1, 1,
-0.331223, 0.8195636, -0.2395903, 1, 0, 0, 1, 1,
-0.3297731, -1.059417, -1.465504, 0, 0, 0, 1, 1,
-0.3285514, 0.07484533, -2.045773, 0, 0, 0, 1, 1,
-0.320553, 1.702125, -0.5061901, 0, 0, 0, 1, 1,
-0.3183294, -0.0314432, -2.556011, 0, 0, 0, 1, 1,
-0.313659, 1.245352, -1.603717, 0, 0, 0, 1, 1,
-0.3088468, -0.7271457, -2.402339, 0, 0, 0, 1, 1,
-0.3057641, -1.310553, -4.12401, 0, 0, 0, 1, 1,
-0.3054059, 0.3460944, -0.8328658, 1, 1, 1, 1, 1,
-0.3045109, 0.1708887, -1.293689, 1, 1, 1, 1, 1,
-0.3030261, 1.465757, -0.7285488, 1, 1, 1, 1, 1,
-0.3030039, 1.236479, -1.235564, 1, 1, 1, 1, 1,
-0.3016127, 0.1252013, -1.378837, 1, 1, 1, 1, 1,
-0.2977306, 0.3490147, -1.501552, 1, 1, 1, 1, 1,
-0.2970917, -1.041205, -3.84239, 1, 1, 1, 1, 1,
-0.2942118, 0.9763075, -1.82642, 1, 1, 1, 1, 1,
-0.2936389, -0.05211449, -2.311916, 1, 1, 1, 1, 1,
-0.2914302, -0.4474113, -2.927889, 1, 1, 1, 1, 1,
-0.2913086, -0.2656312, -4.798884, 1, 1, 1, 1, 1,
-0.2891919, -0.6179442, -1.896317, 1, 1, 1, 1, 1,
-0.2887471, -1.273227, -3.493646, 1, 1, 1, 1, 1,
-0.2881333, -2.159909, -2.959505, 1, 1, 1, 1, 1,
-0.2860354, -0.2122231, -1.827677, 1, 1, 1, 1, 1,
-0.2827678, -0.202114, -2.905535, 0, 0, 1, 1, 1,
-0.2795959, 1.259231, -1.211038, 1, 0, 0, 1, 1,
-0.2792161, -0.3444889, -1.631607, 1, 0, 0, 1, 1,
-0.2788897, -0.2684394, -2.311661, 1, 0, 0, 1, 1,
-0.2757336, 0.5955423, -0.8716276, 1, 0, 0, 1, 1,
-0.2756196, 2.890121, 0.5650887, 1, 0, 0, 1, 1,
-0.2736644, 0.2724849, -1.40708, 0, 0, 0, 1, 1,
-0.2680066, -0.2421815, -0.6659722, 0, 0, 0, 1, 1,
-0.2642289, 0.2084172, 0.08167531, 0, 0, 0, 1, 1,
-0.2639987, -1.436075, -0.9673884, 0, 0, 0, 1, 1,
-0.26243, -0.4668802, -2.614751, 0, 0, 0, 1, 1,
-0.2620002, 1.175854, 0.7058056, 0, 0, 0, 1, 1,
-0.261576, 0.5057014, 0.4891168, 0, 0, 0, 1, 1,
-0.2604881, -0.3781837, -1.909017, 1, 1, 1, 1, 1,
-0.2594017, 0.01348441, -0.8268744, 1, 1, 1, 1, 1,
-0.2521214, 0.123551, 0.340298, 1, 1, 1, 1, 1,
-0.2502672, 0.2550074, 0.7925918, 1, 1, 1, 1, 1,
-0.2480707, -0.04692893, -2.182473, 1, 1, 1, 1, 1,
-0.2431014, 0.8431223, 0.7201268, 1, 1, 1, 1, 1,
-0.2425964, 0.7453626, -0.05660533, 1, 1, 1, 1, 1,
-0.2394073, -0.6966929, -3.306447, 1, 1, 1, 1, 1,
-0.2365841, -0.8532372, -3.610705, 1, 1, 1, 1, 1,
-0.2361055, 0.9306138, -1.411554, 1, 1, 1, 1, 1,
-0.236045, -0.9491148, -2.41189, 1, 1, 1, 1, 1,
-0.2360122, 0.3990465, 0.2413477, 1, 1, 1, 1, 1,
-0.2331811, -0.1859087, -2.997755, 1, 1, 1, 1, 1,
-0.2324751, 0.5390627, 0.2162799, 1, 1, 1, 1, 1,
-0.2314454, 0.821588, -1.151034, 1, 1, 1, 1, 1,
-0.2311035, -0.5208144, -1.625792, 0, 0, 1, 1, 1,
-0.2301572, -1.11237, -3.604821, 1, 0, 0, 1, 1,
-0.2241598, 0.4724003, -1.968514, 1, 0, 0, 1, 1,
-0.2221032, 0.8969653, -0.1879274, 1, 0, 0, 1, 1,
-0.2148194, -0.6297101, -2.654972, 1, 0, 0, 1, 1,
-0.2137475, -0.471175, -4.284684, 1, 0, 0, 1, 1,
-0.2129911, 0.7915034, -0.4372092, 0, 0, 0, 1, 1,
-0.2105407, 1.011351, -0.912958, 0, 0, 0, 1, 1,
-0.2095671, -1.094535, -4.322611, 0, 0, 0, 1, 1,
-0.2069739, 0.913038, -1.80635, 0, 0, 0, 1, 1,
-0.2069684, -0.154341, -2.063715, 0, 0, 0, 1, 1,
-0.2051082, 0.5119545, -0.5870383, 0, 0, 0, 1, 1,
-0.1990237, 0.1154948, -2.934137, 0, 0, 0, 1, 1,
-0.1983284, -0.1040939, -2.977791, 1, 1, 1, 1, 1,
-0.1923664, -1.101662, -3.321071, 1, 1, 1, 1, 1,
-0.1888333, -0.2097105, -1.559914, 1, 1, 1, 1, 1,
-0.1860147, 0.764945, 1.9384, 1, 1, 1, 1, 1,
-0.183434, 0.8703285, 0.6475576, 1, 1, 1, 1, 1,
-0.1819979, 0.7905521, -0.595376, 1, 1, 1, 1, 1,
-0.1808403, 0.5079973, -0.2122143, 1, 1, 1, 1, 1,
-0.1793555, 0.5612568, -1.553637, 1, 1, 1, 1, 1,
-0.1754455, -0.5725919, -3.447015, 1, 1, 1, 1, 1,
-0.1752621, -0.7538278, -1.405504, 1, 1, 1, 1, 1,
-0.1740684, 0.5071087, 0.8995457, 1, 1, 1, 1, 1,
-0.1712053, 0.7600055, -0.9748157, 1, 1, 1, 1, 1,
-0.1708361, 0.05675547, -0.03478771, 1, 1, 1, 1, 1,
-0.1683046, 0.9645916, 0.2262078, 1, 1, 1, 1, 1,
-0.167285, -0.4308143, -2.761146, 1, 1, 1, 1, 1,
-0.1661552, -0.1228933, -1.525471, 0, 0, 1, 1, 1,
-0.1657074, 0.2711374, -0.4435675, 1, 0, 0, 1, 1,
-0.1651555, -0.4249357, -2.117567, 1, 0, 0, 1, 1,
-0.160851, 0.199665, -0.7886166, 1, 0, 0, 1, 1,
-0.1556685, 0.01312107, -2.044299, 1, 0, 0, 1, 1,
-0.1526631, 2.093731, 0.5134374, 1, 0, 0, 1, 1,
-0.1515399, 0.02231435, -3.359236, 0, 0, 0, 1, 1,
-0.1504509, -1.39829, -3.124799, 0, 0, 0, 1, 1,
-0.1448275, -3.070855, -1.77563, 0, 0, 0, 1, 1,
-0.141063, 0.9466855, -0.1705069, 0, 0, 0, 1, 1,
-0.1389771, -2.763884, -3.342182, 0, 0, 0, 1, 1,
-0.1373668, -0.7125151, -1.804157, 0, 0, 0, 1, 1,
-0.1364214, -0.6689681, -2.5375, 0, 0, 0, 1, 1,
-0.1354838, 1.033266, 1.387506, 1, 1, 1, 1, 1,
-0.1332817, 0.9880211, 0.1915078, 1, 1, 1, 1, 1,
-0.1318147, 0.7340924, -0.529284, 1, 1, 1, 1, 1,
-0.130377, -1.753043, -4.683674, 1, 1, 1, 1, 1,
-0.1293006, 1.544054, -0.1720224, 1, 1, 1, 1, 1,
-0.1284803, -0.1325766, -2.404766, 1, 1, 1, 1, 1,
-0.1243312, -0.9754664, -2.165897, 1, 1, 1, 1, 1,
-0.1234137, 0.05768554, -1.806424, 1, 1, 1, 1, 1,
-0.1181925, -1.301621, -2.658261, 1, 1, 1, 1, 1,
-0.1169029, -0.7770385, -4.144121, 1, 1, 1, 1, 1,
-0.1146757, 1.08068, 0.08705081, 1, 1, 1, 1, 1,
-0.1134149, -0.8731521, -3.553784, 1, 1, 1, 1, 1,
-0.1120311, 0.3772159, -0.9000971, 1, 1, 1, 1, 1,
-0.1119637, 1.328762, -1.619057, 1, 1, 1, 1, 1,
-0.1100094, -2.208624, -1.974323, 1, 1, 1, 1, 1,
-0.1083997, 0.2767293, -0.09829166, 0, 0, 1, 1, 1,
-0.1075411, -0.3359635, -3.296731, 1, 0, 0, 1, 1,
-0.1040554, 0.3239782, 1.806951, 1, 0, 0, 1, 1,
-0.09740911, -1.382563, -3.866262, 1, 0, 0, 1, 1,
-0.09513654, -0.08029377, -2.447826, 1, 0, 0, 1, 1,
-0.08567429, -0.6457034, -2.541953, 1, 0, 0, 1, 1,
-0.08054654, -0.2948188, -1.477274, 0, 0, 0, 1, 1,
-0.07932244, 0.1595366, 0.5993155, 0, 0, 0, 1, 1,
-0.07297125, -1.038514, -2.554179, 0, 0, 0, 1, 1,
-0.07274313, 1.505032, -0.8492664, 0, 0, 0, 1, 1,
-0.06989274, 0.7031552, 0.07522957, 0, 0, 0, 1, 1,
-0.06791069, -1.206506, -3.406115, 0, 0, 0, 1, 1,
-0.06762182, 0.4643095, -0.9398394, 0, 0, 0, 1, 1,
-0.06541229, -0.5620944, -2.573287, 1, 1, 1, 1, 1,
-0.06206182, 0.8805032, -0.4301747, 1, 1, 1, 1, 1,
-0.05897449, -1.200962, -2.653929, 1, 1, 1, 1, 1,
-0.05859707, -0.112559, -0.7853269, 1, 1, 1, 1, 1,
-0.05071238, -0.0400053, -1.949638, 1, 1, 1, 1, 1,
-0.04537254, -0.3296023, -3.306274, 1, 1, 1, 1, 1,
-0.04437939, -1.436154, -2.939076, 1, 1, 1, 1, 1,
-0.04215676, -1.755421, -4.112129, 1, 1, 1, 1, 1,
-0.04166605, 1.903282, -0.03342608, 1, 1, 1, 1, 1,
-0.04068791, 1.079057, 0.4628198, 1, 1, 1, 1, 1,
-0.03455207, -0.8912026, -1.86426, 1, 1, 1, 1, 1,
-0.03441219, 0.8987343, 0.1526529, 1, 1, 1, 1, 1,
-0.03410932, -1.69807, -3.47273, 1, 1, 1, 1, 1,
-0.03314381, -1.613131, -1.710497, 1, 1, 1, 1, 1,
-0.03297041, 1.585674, 0.05245519, 1, 1, 1, 1, 1,
-0.02806174, -1.630578, -3.265128, 0, 0, 1, 1, 1,
-0.02089711, -0.6625642, -2.234684, 1, 0, 0, 1, 1,
-0.01643187, -0.6873578, -3.982052, 1, 0, 0, 1, 1,
-0.01442748, -0.5849554, -3.281528, 1, 0, 0, 1, 1,
-0.0129614, -1.456781, -2.807028, 1, 0, 0, 1, 1,
-0.008149974, -0.2649614, -3.281234, 1, 0, 0, 1, 1,
-0.007113232, 0.3640047, 1.220529, 0, 0, 0, 1, 1,
-0.004536533, -0.1767138, -4.479409, 0, 0, 0, 1, 1,
-0.003909586, -0.6107838, -2.729236, 0, 0, 0, 1, 1,
-0.002354404, -0.5588566, -2.457715, 0, 0, 0, 1, 1,
0.0009491633, -2.204437, 4.240909, 0, 0, 0, 1, 1,
0.003936192, 1.601674, 0.2273694, 0, 0, 0, 1, 1,
0.009405717, 0.3441318, -0.3049318, 0, 0, 0, 1, 1,
0.01183834, 1.505746, -0.442638, 1, 1, 1, 1, 1,
0.01199921, 0.2417269, 1.014152, 1, 1, 1, 1, 1,
0.01405676, 0.3857468, 0.8432965, 1, 1, 1, 1, 1,
0.01655308, 0.3466503, -0.248565, 1, 1, 1, 1, 1,
0.02220581, -1.063905, 2.778602, 1, 1, 1, 1, 1,
0.02637121, 1.424764, -0.5721365, 1, 1, 1, 1, 1,
0.02702229, 0.2259955, 0.2353461, 1, 1, 1, 1, 1,
0.03374677, -0.3187432, 0.8574932, 1, 1, 1, 1, 1,
0.03918961, -0.5216463, 3.712872, 1, 1, 1, 1, 1,
0.04050426, 0.6857331, -0.9434701, 1, 1, 1, 1, 1,
0.04339988, -0.1191837, 2.76556, 1, 1, 1, 1, 1,
0.0437967, 0.8487783, 0.3777528, 1, 1, 1, 1, 1,
0.04951938, -0.3060191, 3.099105, 1, 1, 1, 1, 1,
0.05086603, 0.7709408, 0.2558073, 1, 1, 1, 1, 1,
0.05534982, -0.9753633, 4.119653, 1, 1, 1, 1, 1,
0.06030647, 0.9031225, -0.6818502, 0, 0, 1, 1, 1,
0.06301891, 0.09381987, 0.08072516, 1, 0, 0, 1, 1,
0.06473137, -1.137645, 3.797488, 1, 0, 0, 1, 1,
0.07381631, 0.1714972, 0.5960788, 1, 0, 0, 1, 1,
0.07539371, 0.8467101, -1.525178, 1, 0, 0, 1, 1,
0.07565559, 1.548116, -0.2785891, 1, 0, 0, 1, 1,
0.07598366, -1.645261, 3.763702, 0, 0, 0, 1, 1,
0.07639451, 0.3352998, 0.8313218, 0, 0, 0, 1, 1,
0.07688557, -0.3188241, 2.107799, 0, 0, 0, 1, 1,
0.08211417, -1.230672, 3.924312, 0, 0, 0, 1, 1,
0.0837795, 0.7622827, 0.8380607, 0, 0, 0, 1, 1,
0.08378971, 0.7733656, -0.09224483, 0, 0, 0, 1, 1,
0.08408471, 0.6398081, -0.6644259, 0, 0, 0, 1, 1,
0.09145528, 1.536698, -2.37475, 1, 1, 1, 1, 1,
0.09369449, -1.74933, 2.330899, 1, 1, 1, 1, 1,
0.09477292, 2.020679, -1.123031, 1, 1, 1, 1, 1,
0.09527535, 0.05515914, 3.045423, 1, 1, 1, 1, 1,
0.09689843, -0.6959066, 1.445905, 1, 1, 1, 1, 1,
0.1033824, -1.541561, 2.478449, 1, 1, 1, 1, 1,
0.1094373, -0.3641455, 3.480155, 1, 1, 1, 1, 1,
0.1134222, -0.4873888, 3.60172, 1, 1, 1, 1, 1,
0.1144449, -2.505776, 0.4909388, 1, 1, 1, 1, 1,
0.1147644, -1.395326, 3.419878, 1, 1, 1, 1, 1,
0.1149676, 1.064102, 1.284135, 1, 1, 1, 1, 1,
0.1185433, -0.1637267, 2.073903, 1, 1, 1, 1, 1,
0.1246352, -0.1880536, 1.286014, 1, 1, 1, 1, 1,
0.1283974, -0.1073009, 2.597357, 1, 1, 1, 1, 1,
0.1314899, 1.085745, 0.4299052, 1, 1, 1, 1, 1,
0.1318604, -0.6420276, 2.784645, 0, 0, 1, 1, 1,
0.1336202, -1.321704, 4.142934, 1, 0, 0, 1, 1,
0.134586, -0.01737646, -1.089144, 1, 0, 0, 1, 1,
0.1363435, -0.5681661, 1.18021, 1, 0, 0, 1, 1,
0.1392976, -0.02184044, 1.974737, 1, 0, 0, 1, 1,
0.1534794, 0.1166059, 0.4626444, 1, 0, 0, 1, 1,
0.15356, 0.3830713, -0.2774033, 0, 0, 0, 1, 1,
0.1568402, -1.588078, 3.48109, 0, 0, 0, 1, 1,
0.1606943, 0.9159055, 0.3795835, 0, 0, 0, 1, 1,
0.160796, -0.8064083, 2.690071, 0, 0, 0, 1, 1,
0.1640776, -0.7720308, 3.428246, 0, 0, 0, 1, 1,
0.1668023, 1.83846, -0.246162, 0, 0, 0, 1, 1,
0.1686324, -0.1295137, 2.543502, 0, 0, 0, 1, 1,
0.169684, -0.6721825, 3.549489, 1, 1, 1, 1, 1,
0.1703216, 0.06682213, 1.375455, 1, 1, 1, 1, 1,
0.1748684, 0.5159687, -1.159081, 1, 1, 1, 1, 1,
0.1754317, -0.07392503, 1.592379, 1, 1, 1, 1, 1,
0.1782153, -0.3094304, 2.409004, 1, 1, 1, 1, 1,
0.1813552, -0.8708875, 4.812453, 1, 1, 1, 1, 1,
0.1833737, -1.511162, 1.254745, 1, 1, 1, 1, 1,
0.1847584, 1.570072, -0.06472188, 1, 1, 1, 1, 1,
0.1865796, -0.04431418, 2.717467, 1, 1, 1, 1, 1,
0.1867503, -2.561934, 3.668093, 1, 1, 1, 1, 1,
0.1911954, 0.263388, -0.3316576, 1, 1, 1, 1, 1,
0.1958637, 1.034082, 0.4097516, 1, 1, 1, 1, 1,
0.1982471, -0.6176231, 1.253431, 1, 1, 1, 1, 1,
0.2084035, -0.1954296, 1.736292, 1, 1, 1, 1, 1,
0.2101962, 0.6326857, 1.5324, 1, 1, 1, 1, 1,
0.2138768, -0.2821012, 2.177904, 0, 0, 1, 1, 1,
0.2208586, 0.7665351, -0.5792427, 1, 0, 0, 1, 1,
0.2211649, -1.276724, 2.730509, 1, 0, 0, 1, 1,
0.2216278, 0.5453447, 0.7881822, 1, 0, 0, 1, 1,
0.2247223, 0.1894831, 1.440719, 1, 0, 0, 1, 1,
0.2259251, -1.841463, 1.338918, 1, 0, 0, 1, 1,
0.2306793, -0.2713505, 1.8318, 0, 0, 0, 1, 1,
0.23177, -0.9643586, 1.055771, 0, 0, 0, 1, 1,
0.2394786, -0.8227561, 4.51814, 0, 0, 0, 1, 1,
0.2457621, -1.309363, 1.886966, 0, 0, 0, 1, 1,
0.2475963, 1.165495, 0.6070064, 0, 0, 0, 1, 1,
0.250859, 0.4443843, 1.883773, 0, 0, 0, 1, 1,
0.2594969, -0.4550674, 1.403983, 0, 0, 0, 1, 1,
0.2634069, -1.036752, 2.291078, 1, 1, 1, 1, 1,
0.2634411, -0.05836274, -0.03994092, 1, 1, 1, 1, 1,
0.2640498, -0.08447445, 1.178289, 1, 1, 1, 1, 1,
0.2647449, -1.103422, 2.894622, 1, 1, 1, 1, 1,
0.2673592, 0.713518, -0.3655665, 1, 1, 1, 1, 1,
0.2685343, -1.09879, 3.299547, 1, 1, 1, 1, 1,
0.2778478, -1.55566, 3.46294, 1, 1, 1, 1, 1,
0.2782644, -0.1105336, 2.575796, 1, 1, 1, 1, 1,
0.2819907, 0.7085689, -0.08805825, 1, 1, 1, 1, 1,
0.2832892, -0.1983409, 1.071458, 1, 1, 1, 1, 1,
0.28443, -0.3314791, 3.346943, 1, 1, 1, 1, 1,
0.2851942, 0.3155012, 0.2319327, 1, 1, 1, 1, 1,
0.2877451, 1.264003, 0.5317806, 1, 1, 1, 1, 1,
0.294847, 0.9823645, -0.8671935, 1, 1, 1, 1, 1,
0.2965568, 0.2066974, 0.168704, 1, 1, 1, 1, 1,
0.2992066, 0.7429751, 0.2763757, 0, 0, 1, 1, 1,
0.3005852, 0.813494, 1.499737, 1, 0, 0, 1, 1,
0.3061007, 1.05111, -1.08198, 1, 0, 0, 1, 1,
0.3147169, -0.6315411, 1.748815, 1, 0, 0, 1, 1,
0.3200916, 0.2041265, 1.050535, 1, 0, 0, 1, 1,
0.3212466, -0.3527623, 2.544404, 1, 0, 0, 1, 1,
0.3220872, -0.7898453, 1.401501, 0, 0, 0, 1, 1,
0.3275477, -0.5714645, 1.678602, 0, 0, 0, 1, 1,
0.3321675, -0.7651944, 2.879873, 0, 0, 0, 1, 1,
0.3328664, -0.4297287, 3.352194, 0, 0, 0, 1, 1,
0.3406807, 1.291566, -0.5344477, 0, 0, 0, 1, 1,
0.3421816, 0.4093466, 0.1069424, 0, 0, 0, 1, 1,
0.3439615, 0.2203254, -0.1861862, 0, 0, 0, 1, 1,
0.3458934, -0.6769759, 2.243546, 1, 1, 1, 1, 1,
0.3470625, 1.300341, 0.3122277, 1, 1, 1, 1, 1,
0.3473318, 0.02536348, 0.7399294, 1, 1, 1, 1, 1,
0.3506266, 0.3945037, 1.147301, 1, 1, 1, 1, 1,
0.3536574, -0.2845431, -0.748273, 1, 1, 1, 1, 1,
0.3557187, 0.02332776, 1.629338, 1, 1, 1, 1, 1,
0.3562731, -0.01691435, 1.729401, 1, 1, 1, 1, 1,
0.3571146, 1.634685, 0.2241611, 1, 1, 1, 1, 1,
0.3589566, -0.2134139, -1.23153, 1, 1, 1, 1, 1,
0.3593887, -0.9494614, 3.320907, 1, 1, 1, 1, 1,
0.3608145, -0.8984916, 1.561008, 1, 1, 1, 1, 1,
0.3633961, 1.092507, -1.126197, 1, 1, 1, 1, 1,
0.3646041, -0.633001, 1.194079, 1, 1, 1, 1, 1,
0.364991, -0.276502, 2.80977, 1, 1, 1, 1, 1,
0.3660591, -0.19954, 2.075458, 1, 1, 1, 1, 1,
0.367649, -0.0170238, -0.8380793, 0, 0, 1, 1, 1,
0.3679368, -0.4765624, 1.846939, 1, 0, 0, 1, 1,
0.3680574, 0.5685099, -1.50261, 1, 0, 0, 1, 1,
0.3684037, -0.08557103, 2.994399, 1, 0, 0, 1, 1,
0.3689037, -0.3081763, 3.172903, 1, 0, 0, 1, 1,
0.3693873, 1.584912, -0.3606698, 1, 0, 0, 1, 1,
0.3703135, -1.230476, 3.699432, 0, 0, 0, 1, 1,
0.3727301, -1.025717, 1.921244, 0, 0, 0, 1, 1,
0.3727902, -0.6273584, 3.652772, 0, 0, 0, 1, 1,
0.3737753, 0.6231778, 1.586569, 0, 0, 0, 1, 1,
0.3755606, -0.8264483, 3.932271, 0, 0, 0, 1, 1,
0.3835705, -1.40042, 3.98236, 0, 0, 0, 1, 1,
0.3862269, -0.7196454, 2.574153, 0, 0, 0, 1, 1,
0.391902, -1.957318, 3.849228, 1, 1, 1, 1, 1,
0.3919869, 0.9399016, 2.769885, 1, 1, 1, 1, 1,
0.3955618, -1.356401, 1.274584, 1, 1, 1, 1, 1,
0.3970831, -1.86638, 2.644686, 1, 1, 1, 1, 1,
0.3976069, 0.6320305, 1.83199, 1, 1, 1, 1, 1,
0.3982369, 0.6177572, 0.4741517, 1, 1, 1, 1, 1,
0.3999701, 0.5090922, -0.1328665, 1, 1, 1, 1, 1,
0.4001675, 0.1340925, 1.156993, 1, 1, 1, 1, 1,
0.4073752, -0.1978632, 1.189421, 1, 1, 1, 1, 1,
0.4074276, -0.8149323, 0.4908697, 1, 1, 1, 1, 1,
0.4088034, 0.4533993, 0.0910029, 1, 1, 1, 1, 1,
0.4091375, 1.704658, 1.273485, 1, 1, 1, 1, 1,
0.4131284, -0.3545018, -0.7427089, 1, 1, 1, 1, 1,
0.4161221, 0.23296, 2.984217, 1, 1, 1, 1, 1,
0.4216687, 0.5093125, -0.4041089, 1, 1, 1, 1, 1,
0.4272715, 1.478292, 1.073727, 0, 0, 1, 1, 1,
0.4276226, -0.3793025, -0.215394, 1, 0, 0, 1, 1,
0.4282497, 2.319107, 0.7663938, 1, 0, 0, 1, 1,
0.4309535, 0.2599171, 0.527638, 1, 0, 0, 1, 1,
0.4375888, 0.01852435, 1.158428, 1, 0, 0, 1, 1,
0.438167, -0.7975761, 1.728976, 1, 0, 0, 1, 1,
0.4421172, -2.101729, 3.537044, 0, 0, 0, 1, 1,
0.4583008, 0.5595668, -0.1112516, 0, 0, 0, 1, 1,
0.4595511, 0.4860432, -0.1656953, 0, 0, 0, 1, 1,
0.4622251, 0.2014187, 1.704669, 0, 0, 0, 1, 1,
0.4627348, 0.4894332, -0.4890231, 0, 0, 0, 1, 1,
0.4628353, -1.372477, 2.575232, 0, 0, 0, 1, 1,
0.4669571, -2.245228, 3.221887, 0, 0, 0, 1, 1,
0.4711648, -1.411572, 3.053295, 1, 1, 1, 1, 1,
0.4737805, -1.470671, 4.18208, 1, 1, 1, 1, 1,
0.4749134, 0.4097658, 1.325221, 1, 1, 1, 1, 1,
0.478661, 0.2508628, 0.1099794, 1, 1, 1, 1, 1,
0.4823981, 1.986905, 0.602084, 1, 1, 1, 1, 1,
0.48821, -0.913756, 3.542555, 1, 1, 1, 1, 1,
0.4895654, 0.9414163, -0.4003137, 1, 1, 1, 1, 1,
0.4971303, -1.436483, 2.595913, 1, 1, 1, 1, 1,
0.4991588, -0.1581014, 1.213611, 1, 1, 1, 1, 1,
0.4997157, -1.013401, 3.408847, 1, 1, 1, 1, 1,
0.5033728, -0.865825, 3.282813, 1, 1, 1, 1, 1,
0.5078453, -0.1120471, 1.791951, 1, 1, 1, 1, 1,
0.5113154, 1.644987, 1.594, 1, 1, 1, 1, 1,
0.5127589, 0.3993091, 3.637033, 1, 1, 1, 1, 1,
0.5137371, 1.618216, 0.5736367, 1, 1, 1, 1, 1,
0.5148083, 0.8247777, 0.9726198, 0, 0, 1, 1, 1,
0.5158539, -0.3996035, 3.090236, 1, 0, 0, 1, 1,
0.5218604, 0.9958808, 2.090143, 1, 0, 0, 1, 1,
0.5226228, -0.03955176, 0.4896703, 1, 0, 0, 1, 1,
0.5254776, -0.06122219, 1.156724, 1, 0, 0, 1, 1,
0.536676, -1.575686, 1.585689, 1, 0, 0, 1, 1,
0.5412184, -1.055088, 2.656373, 0, 0, 0, 1, 1,
0.544045, -0.1593157, 1.510981, 0, 0, 0, 1, 1,
0.5476368, -0.9839725, 3.432279, 0, 0, 0, 1, 1,
0.5498822, -1.330998, 2.205764, 0, 0, 0, 1, 1,
0.5504133, -0.2779381, 2.883769, 0, 0, 0, 1, 1,
0.5512073, 1.612885, -0.09250107, 0, 0, 0, 1, 1,
0.5527805, -0.6916343, 3.268003, 0, 0, 0, 1, 1,
0.552853, -1.657664, 4.704478, 1, 1, 1, 1, 1,
0.5536726, -0.9414743, 2.429147, 1, 1, 1, 1, 1,
0.554783, 0.8067464, 0.8273653, 1, 1, 1, 1, 1,
0.5584435, -1.321382, 1.326839, 1, 1, 1, 1, 1,
0.5597782, -0.5825727, 2.495936, 1, 1, 1, 1, 1,
0.5610921, -1.941749, 1.846903, 1, 1, 1, 1, 1,
0.5618365, 0.4310829, 0.9182295, 1, 1, 1, 1, 1,
0.5620716, 0.7879348, -0.3207565, 1, 1, 1, 1, 1,
0.5637385, -1.13261, 3.496232, 1, 1, 1, 1, 1,
0.5651206, 0.7106615, 0.2138344, 1, 1, 1, 1, 1,
0.5701833, 0.3674081, 0.8089521, 1, 1, 1, 1, 1,
0.571268, -0.3089572, 3.499207, 1, 1, 1, 1, 1,
0.5755493, 0.5266951, 0.1171729, 1, 1, 1, 1, 1,
0.5785741, 0.8147438, 0.1454395, 1, 1, 1, 1, 1,
0.5810127, 0.6159137, 0.758431, 1, 1, 1, 1, 1,
0.5873705, -1.848771, 1.737023, 0, 0, 1, 1, 1,
0.5880721, -0.1561012, 1.517985, 1, 0, 0, 1, 1,
0.5883703, -0.7029654, 4.207148, 1, 0, 0, 1, 1,
0.5897183, 0.7473511, 1.673902, 1, 0, 0, 1, 1,
0.5928782, 0.7711183, -0.7874164, 1, 0, 0, 1, 1,
0.5966265, -0.2837294, 3.839342, 1, 0, 0, 1, 1,
0.599842, -1.968365, 3.006335, 0, 0, 0, 1, 1,
0.6051819, 1.025842, 0.5014958, 0, 0, 0, 1, 1,
0.6057693, 0.1662218, 2.306501, 0, 0, 0, 1, 1,
0.6090924, -1.402406, 4.034493, 0, 0, 0, 1, 1,
0.6115999, -1.754283, 5.879601, 0, 0, 0, 1, 1,
0.612605, 0.5236942, 0.7552598, 0, 0, 0, 1, 1,
0.6136318, 1.403675, -0.5025753, 0, 0, 0, 1, 1,
0.6142612, -0.1479913, 2.163419, 1, 1, 1, 1, 1,
0.6150783, 0.3288856, 0.2279535, 1, 1, 1, 1, 1,
0.6160886, -1.54258, 2.445696, 1, 1, 1, 1, 1,
0.6166058, -1.008369, 3.544588, 1, 1, 1, 1, 1,
0.6170631, 0.6469583, 0.08665588, 1, 1, 1, 1, 1,
0.6172111, -0.9621515, 0.978072, 1, 1, 1, 1, 1,
0.6209227, -0.2910687, 1.585049, 1, 1, 1, 1, 1,
0.6222382, 2.36228, -0.2053134, 1, 1, 1, 1, 1,
0.6226764, -0.05454685, 0.507477, 1, 1, 1, 1, 1,
0.6291922, -0.2780449, 1.46483, 1, 1, 1, 1, 1,
0.6292625, -0.6146125, 3.087781, 1, 1, 1, 1, 1,
0.6341237, 0.4933605, 0.2151025, 1, 1, 1, 1, 1,
0.6372901, -0.2476649, 1.413917, 1, 1, 1, 1, 1,
0.6503797, -1.078537, 2.794594, 1, 1, 1, 1, 1,
0.6532514, -1.354854, 2.782793, 1, 1, 1, 1, 1,
0.6566725, 1.310825, 1.010364, 0, 0, 1, 1, 1,
0.6587033, 0.9425687, 0.3581835, 1, 0, 0, 1, 1,
0.6682015, 1.204318, -0.09219329, 1, 0, 0, 1, 1,
0.6697525, -0.4109315, 3.569458, 1, 0, 0, 1, 1,
0.6733423, 1.82021, 1.224243, 1, 0, 0, 1, 1,
0.677855, 0.0403755, 0.4669136, 1, 0, 0, 1, 1,
0.6778831, -0.5732491, 1.849967, 0, 0, 0, 1, 1,
0.6781316, -0.08613072, 0.7109468, 0, 0, 0, 1, 1,
0.6803298, -0.190489, -0.3388203, 0, 0, 0, 1, 1,
0.6906146, -0.5150259, 1.285312, 0, 0, 0, 1, 1,
0.6910044, 0.2058816, -0.5916873, 0, 0, 0, 1, 1,
0.6914993, -0.3297437, 1.517217, 0, 0, 0, 1, 1,
0.6953822, -0.6414322, 2.499048, 0, 0, 0, 1, 1,
0.6968303, 0.4180231, 0.5591294, 1, 1, 1, 1, 1,
0.6981597, 0.6509318, 0.7325846, 1, 1, 1, 1, 1,
0.7017311, -1.625237, 2.4571, 1, 1, 1, 1, 1,
0.7026427, 0.4602683, 2.085266, 1, 1, 1, 1, 1,
0.7056323, 0.9241718, 0.2568192, 1, 1, 1, 1, 1,
0.7070607, 0.5382574, 1.754762, 1, 1, 1, 1, 1,
0.7096835, 1.291331, -0.05367811, 1, 1, 1, 1, 1,
0.7101634, -1.722635, 2.582753, 1, 1, 1, 1, 1,
0.7206915, -0.02541938, 1.686314, 1, 1, 1, 1, 1,
0.7219223, -0.7638384, 2.799452, 1, 1, 1, 1, 1,
0.7242541, -0.7959286, 2.777274, 1, 1, 1, 1, 1,
0.7278419, 1.019243, 0.43331, 1, 1, 1, 1, 1,
0.7304545, 0.3640386, 0.2565371, 1, 1, 1, 1, 1,
0.7320708, 0.2660666, 0.3602788, 1, 1, 1, 1, 1,
0.7328307, 2.408325, 1.262584, 1, 1, 1, 1, 1,
0.7360409, 0.8632575, 1.741731, 0, 0, 1, 1, 1,
0.7382693, 0.6335115, 0.9098301, 1, 0, 0, 1, 1,
0.7428809, -0.5462443, 4.318773, 1, 0, 0, 1, 1,
0.7437111, 1.363761, 0.6273853, 1, 0, 0, 1, 1,
0.7448447, 1.826961, -1.139194, 1, 0, 0, 1, 1,
0.7448913, 2.819029, 0.6187348, 1, 0, 0, 1, 1,
0.7462105, -0.5385429, 1.829746, 0, 0, 0, 1, 1,
0.7497463, -0.5768678, 0.8964201, 0, 0, 0, 1, 1,
0.7499936, 0.2248391, 2.692274, 0, 0, 0, 1, 1,
0.7572554, 0.6035313, 0.7233014, 0, 0, 0, 1, 1,
0.7572752, 0.3100535, 2.724629, 0, 0, 0, 1, 1,
0.7644747, 0.2917408, -0.3442328, 0, 0, 0, 1, 1,
0.765684, -1.011153, 2.692742, 0, 0, 0, 1, 1,
0.7661988, 0.4120156, -0.03611862, 1, 1, 1, 1, 1,
0.7700056, 0.9047073, 0.4392322, 1, 1, 1, 1, 1,
0.7715433, 0.3253526, 0.9783483, 1, 1, 1, 1, 1,
0.7978684, 0.7338634, 1.640966, 1, 1, 1, 1, 1,
0.7995849, -0.7609918, 2.252403, 1, 1, 1, 1, 1,
0.8016286, 0.8472188, 2.661044, 1, 1, 1, 1, 1,
0.8089032, 0.5059682, 0.4444952, 1, 1, 1, 1, 1,
0.8130229, 0.09826744, 1.848039, 1, 1, 1, 1, 1,
0.8136157, 0.9548874, -0.4870414, 1, 1, 1, 1, 1,
0.8235667, -0.2088411, 1.176689, 1, 1, 1, 1, 1,
0.8237147, 1.794541, 2.749677, 1, 1, 1, 1, 1,
0.8239385, -0.3434002, 0.7547638, 1, 1, 1, 1, 1,
0.8280964, 0.1497522, 2.492081, 1, 1, 1, 1, 1,
0.8283887, 1.456992, 1.116059, 1, 1, 1, 1, 1,
0.8344138, -1.149902, 3.680116, 1, 1, 1, 1, 1,
0.8366461, 0.06987602, 0.928607, 0, 0, 1, 1, 1,
0.8374482, -0.2751772, 2.724526, 1, 0, 0, 1, 1,
0.8386362, -1.348876, 2.23479, 1, 0, 0, 1, 1,
0.8404603, -1.844467, 1.241483, 1, 0, 0, 1, 1,
0.8430973, 1.388986, 1.011312, 1, 0, 0, 1, 1,
0.8487056, -0.7731717, 2.420537, 1, 0, 0, 1, 1,
0.8525271, 0.7045686, 1.750613, 0, 0, 0, 1, 1,
0.8592981, -1.48804, 3.193004, 0, 0, 0, 1, 1,
0.85978, -0.0691456, 1.831741, 0, 0, 0, 1, 1,
0.8692503, 0.2276463, 0.4131996, 0, 0, 0, 1, 1,
0.8703641, -0.2323727, 3.639169, 0, 0, 0, 1, 1,
0.8721632, 0.549926, 1.132878, 0, 0, 0, 1, 1,
0.8752128, -1.077391, 2.754336, 0, 0, 0, 1, 1,
0.8940779, -0.8429326, 2.364125, 1, 1, 1, 1, 1,
0.9065813, 1.671218, 1.462121, 1, 1, 1, 1, 1,
0.9171214, 0.765976, 1.400745, 1, 1, 1, 1, 1,
0.9174147, 1.337472, -0.2652491, 1, 1, 1, 1, 1,
0.9270557, 0.1985991, 0.6470194, 1, 1, 1, 1, 1,
0.9285194, 0.04196838, 1.204499, 1, 1, 1, 1, 1,
0.928819, 0.2958914, -0.161259, 1, 1, 1, 1, 1,
0.9342343, 0.9424187, 2.090564, 1, 1, 1, 1, 1,
0.9390206, 0.00551711, -0.4487901, 1, 1, 1, 1, 1,
0.9391371, 1.203114, 0.3000441, 1, 1, 1, 1, 1,
0.9400057, 0.214062, 0.6351353, 1, 1, 1, 1, 1,
0.9419168, 0.3710955, 1.997953, 1, 1, 1, 1, 1,
0.9462529, -1.755429, 2.802024, 1, 1, 1, 1, 1,
0.9478465, -0.4487984, 1.880735, 1, 1, 1, 1, 1,
0.9489152, -0.3488895, 1.094632, 1, 1, 1, 1, 1,
0.9496921, 0.4093257, 0.3574823, 0, 0, 1, 1, 1,
0.9502558, 0.3231978, 1.962435, 1, 0, 0, 1, 1,
0.9549418, 2.607383, 1.733221, 1, 0, 0, 1, 1,
0.9576889, -0.05684314, 1.245175, 1, 0, 0, 1, 1,
0.9608405, 0.06572466, 2.140832, 1, 0, 0, 1, 1,
0.9614303, 1.044119, -0.8162025, 1, 0, 0, 1, 1,
0.9676057, -0.07687965, 1.308419, 0, 0, 0, 1, 1,
0.9775158, -0.3139304, 3.19785, 0, 0, 0, 1, 1,
0.9803675, -1.361725, 1.435509, 0, 0, 0, 1, 1,
0.9903863, 1.234238, -0.9220855, 0, 0, 0, 1, 1,
0.9941539, -0.4311992, 2.825673, 0, 0, 0, 1, 1,
0.9964652, 1.077285, -0.07659105, 0, 0, 0, 1, 1,
0.9979663, -1.032001, 2.897606, 0, 0, 0, 1, 1,
0.99826, -0.7913105, 2.528045, 1, 1, 1, 1, 1,
1.001988, 0.4733589, 0.3162641, 1, 1, 1, 1, 1,
1.012267, 1.492865, 1.028674, 1, 1, 1, 1, 1,
1.012688, -0.3016506, 3.62849, 1, 1, 1, 1, 1,
1.015345, -0.430878, 1.773783, 1, 1, 1, 1, 1,
1.016988, 0.1580648, 0.4142599, 1, 1, 1, 1, 1,
1.025285, 0.2899691, 2.595228, 1, 1, 1, 1, 1,
1.030662, -1.58926, 1.868568, 1, 1, 1, 1, 1,
1.031892, -0.2897938, -0.04183658, 1, 1, 1, 1, 1,
1.034916, -0.5898195, 0.1210058, 1, 1, 1, 1, 1,
1.041917, 1.231116, 0.6227787, 1, 1, 1, 1, 1,
1.04245, 0.717423, -0.0001942699, 1, 1, 1, 1, 1,
1.044231, 0.569207, 1.976928, 1, 1, 1, 1, 1,
1.049134, 1.677202, -1.310227, 1, 1, 1, 1, 1,
1.056091, -0.5670864, 0.5578325, 1, 1, 1, 1, 1,
1.065091, 0.2251763, 0.09459716, 0, 0, 1, 1, 1,
1.068026, 0.2903473, 1.239196, 1, 0, 0, 1, 1,
1.072151, 0.2594354, 1.123195, 1, 0, 0, 1, 1,
1.076558, 0.3750255, 1.409624, 1, 0, 0, 1, 1,
1.078151, -1.06434, 2.61117, 1, 0, 0, 1, 1,
1.083475, 0.563314, 1.192517, 1, 0, 0, 1, 1,
1.086731, -0.4425095, 0.9523334, 0, 0, 0, 1, 1,
1.090548, -0.3663279, 0.4615492, 0, 0, 0, 1, 1,
1.098882, 0.02967896, 1.12785, 0, 0, 0, 1, 1,
1.102259, -0.4693257, 1.407207, 0, 0, 0, 1, 1,
1.102916, 1.64752, -1.083228, 0, 0, 0, 1, 1,
1.106663, 0.1834116, 0.772584, 0, 0, 0, 1, 1,
1.113231, 0.1447086, 0.8763658, 0, 0, 0, 1, 1,
1.116675, 0.1003472, 1.165602, 1, 1, 1, 1, 1,
1.120211, 0.7943174, 2.093976, 1, 1, 1, 1, 1,
1.127448, 0.3905045, -0.1421752, 1, 1, 1, 1, 1,
1.129053, 0.0616803, 1.175246, 1, 1, 1, 1, 1,
1.142822, -1.848928, 1.36652, 1, 1, 1, 1, 1,
1.162472, -0.06576865, 2.335738, 1, 1, 1, 1, 1,
1.168979, -0.5820748, 2.058999, 1, 1, 1, 1, 1,
1.169182, 0.4252667, 1.046018, 1, 1, 1, 1, 1,
1.173575, 1.622997, 1.14079, 1, 1, 1, 1, 1,
1.188622, -0.6216667, 0.5067785, 1, 1, 1, 1, 1,
1.190365, -0.5349877, 0.3819424, 1, 1, 1, 1, 1,
1.193056, 0.7217893, 1.33614, 1, 1, 1, 1, 1,
1.200728, 0.2198407, 1.075028, 1, 1, 1, 1, 1,
1.208147, 0.985283, -0.2338402, 1, 1, 1, 1, 1,
1.232875, -1.159894, 3.561882, 1, 1, 1, 1, 1,
1.233067, -1.942085, 0.7536856, 0, 0, 1, 1, 1,
1.233743, -0.2592622, 1.038102, 1, 0, 0, 1, 1,
1.240605, 0.9361342, 1.173952, 1, 0, 0, 1, 1,
1.242049, -1.41776, 0.1304828, 1, 0, 0, 1, 1,
1.247048, 0.1147912, 2.744437, 1, 0, 0, 1, 1,
1.247401, -0.8134059, 0.6204878, 1, 0, 0, 1, 1,
1.251553, -0.2312354, 0.988009, 0, 0, 0, 1, 1,
1.266015, -0.1672337, 2.214397, 0, 0, 0, 1, 1,
1.269214, -1.115722, 3.771356, 0, 0, 0, 1, 1,
1.27191, -0.5173735, 1.865323, 0, 0, 0, 1, 1,
1.290247, 0.1645118, 1.971102, 0, 0, 0, 1, 1,
1.290405, -0.7346447, 2.466469, 0, 0, 0, 1, 1,
1.303406, -0.4823929, 2.33809, 0, 0, 0, 1, 1,
1.311354, -0.4629263, 2.9131, 1, 1, 1, 1, 1,
1.331064, 1.380092, 1.477648, 1, 1, 1, 1, 1,
1.33115, -0.02099752, 2.790874, 1, 1, 1, 1, 1,
1.357858, -0.5240919, 1.949565, 1, 1, 1, 1, 1,
1.359674, -0.8382438, 2.065941, 1, 1, 1, 1, 1,
1.36173, -2.370835, 1.042442, 1, 1, 1, 1, 1,
1.367934, 0.6289401, -1.20693, 1, 1, 1, 1, 1,
1.388703, -0.7683984, 4.348766, 1, 1, 1, 1, 1,
1.391284, -1.395309, 2.282692, 1, 1, 1, 1, 1,
1.413203, -0.3563884, 3.054617, 1, 1, 1, 1, 1,
1.418133, -0.07660954, 1.356511, 1, 1, 1, 1, 1,
1.426241, 0.3688663, 2.510315, 1, 1, 1, 1, 1,
1.440948, 1.529694, 1.715471, 1, 1, 1, 1, 1,
1.441385, -0.6739477, 1.951754, 1, 1, 1, 1, 1,
1.442578, 0.4881746, 2.54548, 1, 1, 1, 1, 1,
1.467611, -1.776854, 1.792163, 0, 0, 1, 1, 1,
1.472816, 0.4464837, 2.082006, 1, 0, 0, 1, 1,
1.495229, -0.7448257, 0.5621395, 1, 0, 0, 1, 1,
1.49748, -0.1092784, 1.276175, 1, 0, 0, 1, 1,
1.50019, 0.4655502, 0.9738411, 1, 0, 0, 1, 1,
1.503903, 0.7435347, 1.056789, 1, 0, 0, 1, 1,
1.527595, -0.8413417, 3.423616, 0, 0, 0, 1, 1,
1.530221, -0.7871947, 1.974157, 0, 0, 0, 1, 1,
1.541597, 0.4731086, 0.6860419, 0, 0, 0, 1, 1,
1.543999, 0.05144547, 1.637927, 0, 0, 0, 1, 1,
1.550961, 0.7510147, 1.617598, 0, 0, 0, 1, 1,
1.557169, 1.369617, -0.07727861, 0, 0, 0, 1, 1,
1.570857, -0.06784489, 0.8500091, 0, 0, 0, 1, 1,
1.579838, -1.025885, 1.862835, 1, 1, 1, 1, 1,
1.582831, 0.5701198, 1.121724, 1, 1, 1, 1, 1,
1.588399, 1.125748, 0.1986667, 1, 1, 1, 1, 1,
1.6018, 1.671876, 0.9118457, 1, 1, 1, 1, 1,
1.606391, -0.7641828, 1.966124, 1, 1, 1, 1, 1,
1.607623, -0.6829154, 2.892836, 1, 1, 1, 1, 1,
1.608195, 2.489864, -0.3523803, 1, 1, 1, 1, 1,
1.613138, 0.5997962, -0.6253927, 1, 1, 1, 1, 1,
1.617073, 1.586973, -0.198829, 1, 1, 1, 1, 1,
1.649595, 1.153947, -0.0442329, 1, 1, 1, 1, 1,
1.658091, -0.3963733, 2.143047, 1, 1, 1, 1, 1,
1.665579, -0.2541163, 3.274235, 1, 1, 1, 1, 1,
1.669021, -0.7852468, 2.361979, 1, 1, 1, 1, 1,
1.684033, 0.03368024, 1.814565, 1, 1, 1, 1, 1,
1.68837, -0.3791919, 0.6689708, 1, 1, 1, 1, 1,
1.702688, 1.502576, 1.437264, 0, 0, 1, 1, 1,
1.709149, -0.02322524, 0.9086661, 1, 0, 0, 1, 1,
1.710509, 1.926824, 1.767837, 1, 0, 0, 1, 1,
1.71112, -0.03721767, 0.456655, 1, 0, 0, 1, 1,
1.723634, 0.7865136, 3.43167, 1, 0, 0, 1, 1,
1.737351, 2.3372, -0.1060104, 1, 0, 0, 1, 1,
1.741914, 0.8950074, 1.142364, 0, 0, 0, 1, 1,
1.756958, 1.338616, 2.138459, 0, 0, 0, 1, 1,
1.763794, 1.578884, 2.389422, 0, 0, 0, 1, 1,
1.796227, 0.1863843, 2.810096, 0, 0, 0, 1, 1,
1.814972, 0.01133998, 2.172375, 0, 0, 0, 1, 1,
1.821553, -1.580672, 1.328447, 0, 0, 0, 1, 1,
1.827826, -0.311126, 1.868342, 0, 0, 0, 1, 1,
1.831028, 0.2651727, 0.7395964, 1, 1, 1, 1, 1,
1.843763, -0.4120612, 2.112268, 1, 1, 1, 1, 1,
1.891065, -1.902418, 3.001271, 1, 1, 1, 1, 1,
1.927868, -0.1024722, 0.08562382, 1, 1, 1, 1, 1,
1.941731, -0.02815231, 3.052037, 1, 1, 1, 1, 1,
1.945564, 0.2956647, 1.157099, 1, 1, 1, 1, 1,
1.947719, 1.153141, 0.9251413, 1, 1, 1, 1, 1,
1.96268, -0.2959881, 1.874771, 1, 1, 1, 1, 1,
1.971437, -0.148673, 0.7265872, 1, 1, 1, 1, 1,
2.007885, -0.6760628, 2.482901, 1, 1, 1, 1, 1,
2.01275, 0.1823326, 2.294985, 1, 1, 1, 1, 1,
2.015239, -0.9446682, 1.201522, 1, 1, 1, 1, 1,
2.02398, -0.1866279, 3.607299, 1, 1, 1, 1, 1,
2.034282, 0.133348, 0.177058, 1, 1, 1, 1, 1,
2.061339, -0.4047312, 1.760702, 1, 1, 1, 1, 1,
2.075037, -0.5489287, 1.006633, 0, 0, 1, 1, 1,
2.077913, -0.6473723, 0.521348, 1, 0, 0, 1, 1,
2.090751, 0.9166433, 0.8471853, 1, 0, 0, 1, 1,
2.11801, -0.4342138, -0.09460208, 1, 0, 0, 1, 1,
2.161038, 0.031994, 3.370632, 1, 0, 0, 1, 1,
2.20054, 0.3364184, 1.763487, 1, 0, 0, 1, 1,
2.27663, -0.6860312, 1.014704, 0, 0, 0, 1, 1,
2.297359, 0.1748514, 1.305667, 0, 0, 0, 1, 1,
2.31307, -0.1979901, 2.569679, 0, 0, 0, 1, 1,
2.352147, -0.1046273, 2.519807, 0, 0, 0, 1, 1,
2.368047, -0.08944329, 0.5336105, 0, 0, 0, 1, 1,
2.395822, -0.09533016, 2.340097, 0, 0, 0, 1, 1,
2.403334, -0.6816987, 2.257144, 0, 0, 0, 1, 1,
2.404404, 0.6972623, 1.177477, 1, 1, 1, 1, 1,
2.40551, 0.3235, 0.1220534, 1, 1, 1, 1, 1,
2.479893, 0.1886993, 3.243425, 1, 1, 1, 1, 1,
2.537642, -0.5333465, 3.66874, 1, 1, 1, 1, 1,
2.900363, -0.9908344, 2.491518, 1, 1, 1, 1, 1,
2.961984, 0.003201492, 0.125306, 1, 1, 1, 1, 1,
3.027262, 2.130955, -0.04109366, 1, 1, 1, 1, 1
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
var radius = 9.503962;
var distance = 33.38226;
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
mvMatrix.translate( 0.09414577, 0.0390017, -0.4738324 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.38226);
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
