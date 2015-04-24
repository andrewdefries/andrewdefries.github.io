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
-3.390353, -1.384037, -4.973509, 1, 0, 0, 1,
-3.275678, 0.3165705, -1.75771, 1, 0.007843138, 0, 1,
-2.693237, 1.642609, -1.041561, 1, 0.01176471, 0, 1,
-2.667404, 0.5313331, -0.6582505, 1, 0.01960784, 0, 1,
-2.66648, -0.2389175, -1.082489, 1, 0.02352941, 0, 1,
-2.662543, -0.9797492, -1.138911, 1, 0.03137255, 0, 1,
-2.608424, -0.005246732, -3.732569, 1, 0.03529412, 0, 1,
-2.575775, 0.006197893, -1.191286, 1, 0.04313726, 0, 1,
-2.536169, -0.9901457, -2.481509, 1, 0.04705882, 0, 1,
-2.456242, 0.9663792, -0.4438339, 1, 0.05490196, 0, 1,
-2.381159, -0.6489233, -2.113464, 1, 0.05882353, 0, 1,
-2.378166, -0.825223, -1.009197, 1, 0.06666667, 0, 1,
-2.367679, -0.3422109, -2.833994, 1, 0.07058824, 0, 1,
-2.343228, 0.7742636, -3.230687, 1, 0.07843138, 0, 1,
-2.313548, 0.7025582, 0.2064261, 1, 0.08235294, 0, 1,
-2.243842, -1.05087, -0.8016031, 1, 0.09019608, 0, 1,
-2.210172, -2.647081, -4.672991, 1, 0.09411765, 0, 1,
-2.182959, 0.5807548, -0.7132332, 1, 0.1019608, 0, 1,
-2.17209, -0.5087626, -0.1959426, 1, 0.1098039, 0, 1,
-2.145341, 0.7413574, -1.322105, 1, 0.1137255, 0, 1,
-2.086819, -0.8038017, -0.4436919, 1, 0.1215686, 0, 1,
-2.080575, -0.9285245, -0.2879001, 1, 0.1254902, 0, 1,
-2.06748, -0.5911908, -0.4633459, 1, 0.1333333, 0, 1,
-2.060138, -0.6009547, -2.410158, 1, 0.1372549, 0, 1,
-2.040105, 0.7921718, -2.823261, 1, 0.145098, 0, 1,
-2.032959, 0.03363467, -1.003683, 1, 0.1490196, 0, 1,
-2.024292, 0.5797648, -3.046933, 1, 0.1568628, 0, 1,
-1.99413, -1.116447, -2.624503, 1, 0.1607843, 0, 1,
-1.981774, -0.08207189, -3.525181, 1, 0.1686275, 0, 1,
-1.972048, 0.750001, -1.282852, 1, 0.172549, 0, 1,
-1.970976, -0.953557, -3.410947, 1, 0.1803922, 0, 1,
-1.945663, 1.18124, -0.639663, 1, 0.1843137, 0, 1,
-1.925098, 0.8762842, -0.6586336, 1, 0.1921569, 0, 1,
-1.887477, 0.3666472, 0.6165588, 1, 0.1960784, 0, 1,
-1.886222, -0.8519072, -0.9978149, 1, 0.2039216, 0, 1,
-1.860571, -0.6708493, -1.440779, 1, 0.2117647, 0, 1,
-1.848926, -0.7447934, -2.6214, 1, 0.2156863, 0, 1,
-1.844888, 1.290052, 0.141146, 1, 0.2235294, 0, 1,
-1.838837, 0.9034912, -2.442257, 1, 0.227451, 0, 1,
-1.829671, -1.60557, -1.286853, 1, 0.2352941, 0, 1,
-1.822704, 0.814468, -1.633618, 1, 0.2392157, 0, 1,
-1.799639, 1.08835, -1.257204, 1, 0.2470588, 0, 1,
-1.793455, -1.660028, -1.589239, 1, 0.2509804, 0, 1,
-1.783491, 0.7144623, -0.119727, 1, 0.2588235, 0, 1,
-1.774884, -0.3501033, -2.758322, 1, 0.2627451, 0, 1,
-1.76412, -0.9770472, -1.651328, 1, 0.2705882, 0, 1,
-1.76074, -0.5584269, -1.363222, 1, 0.2745098, 0, 1,
-1.759526, 1.0778, -2.636118, 1, 0.282353, 0, 1,
-1.758805, -1.25946, -2.751568, 1, 0.2862745, 0, 1,
-1.749887, 0.9679852, 1.616976, 1, 0.2941177, 0, 1,
-1.736592, 0.6560892, -0.9539056, 1, 0.3019608, 0, 1,
-1.716856, 1.666863, 0.2070457, 1, 0.3058824, 0, 1,
-1.676614, -0.3736714, -2.660846, 1, 0.3137255, 0, 1,
-1.667927, -0.01296618, -1.330315, 1, 0.3176471, 0, 1,
-1.667577, 2.076409, -2.008862, 1, 0.3254902, 0, 1,
-1.666232, 0.3784662, -1.578529, 1, 0.3294118, 0, 1,
-1.649925, 0.02653098, -0.1921796, 1, 0.3372549, 0, 1,
-1.648145, -0.9113065, -0.6095401, 1, 0.3411765, 0, 1,
-1.642586, -1.33042, -2.84849, 1, 0.3490196, 0, 1,
-1.630274, 0.2525886, -1.86617, 1, 0.3529412, 0, 1,
-1.628138, -0.87576, -3.750451, 1, 0.3607843, 0, 1,
-1.618971, 0.09087788, -1.9878, 1, 0.3647059, 0, 1,
-1.604016, 0.3105531, -2.532866, 1, 0.372549, 0, 1,
-1.603689, 1.338, -0.8923326, 1, 0.3764706, 0, 1,
-1.59362, 0.6951191, -0.7986077, 1, 0.3843137, 0, 1,
-1.557813, 0.9265425, -0.3190328, 1, 0.3882353, 0, 1,
-1.555123, -1.719513, -2.200912, 1, 0.3960784, 0, 1,
-1.529331, -0.02841578, -0.1017236, 1, 0.4039216, 0, 1,
-1.52895, 0.8758558, -1.533764, 1, 0.4078431, 0, 1,
-1.528169, 0.5372682, 0.1898392, 1, 0.4156863, 0, 1,
-1.512105, 0.03096139, -1.657083, 1, 0.4196078, 0, 1,
-1.50762, 0.07468743, -2.502058, 1, 0.427451, 0, 1,
-1.499141, -0.1248539, -2.152593, 1, 0.4313726, 0, 1,
-1.489643, 1.521947, -1.239373, 1, 0.4392157, 0, 1,
-1.485349, 0.9087453, 0.2175926, 1, 0.4431373, 0, 1,
-1.47878, 0.3855245, -0.2218419, 1, 0.4509804, 0, 1,
-1.477018, 1.180825, -0.6196865, 1, 0.454902, 0, 1,
-1.471928, -1.475153, -2.365965, 1, 0.4627451, 0, 1,
-1.45239, 0.6079603, -1.241165, 1, 0.4666667, 0, 1,
-1.446991, -0.838771, -2.433101, 1, 0.4745098, 0, 1,
-1.431177, 1.550074, -1.55748, 1, 0.4784314, 0, 1,
-1.416629, -0.7683266, -1.400543, 1, 0.4862745, 0, 1,
-1.410137, 0.630282, -2.610925, 1, 0.4901961, 0, 1,
-1.409724, -0.8813736, -0.5330719, 1, 0.4980392, 0, 1,
-1.407564, -1.606217, -1.91902, 1, 0.5058824, 0, 1,
-1.406339, 0.02179791, 0.204064, 1, 0.509804, 0, 1,
-1.399536, -2.2828, -2.013094, 1, 0.5176471, 0, 1,
-1.397358, 2.070689, -0.09573636, 1, 0.5215687, 0, 1,
-1.392595, -0.8977818, -1.465863, 1, 0.5294118, 0, 1,
-1.389701, 1.298224, -0.5291906, 1, 0.5333334, 0, 1,
-1.383081, 0.9211749, -1.530981, 1, 0.5411765, 0, 1,
-1.37685, 0.3499446, -2.640435, 1, 0.5450981, 0, 1,
-1.36256, -0.08758224, -0.5322824, 1, 0.5529412, 0, 1,
-1.353275, -0.684162, -1.215134, 1, 0.5568628, 0, 1,
-1.343582, 2.135456, -0.5030524, 1, 0.5647059, 0, 1,
-1.337903, -0.289979, -4.005286, 1, 0.5686275, 0, 1,
-1.332423, -0.4599319, -3.199359, 1, 0.5764706, 0, 1,
-1.329682, 0.5300442, -1.998043, 1, 0.5803922, 0, 1,
-1.324668, 0.05645137, -0.9251517, 1, 0.5882353, 0, 1,
-1.317298, 0.6982298, -0.4318714, 1, 0.5921569, 0, 1,
-1.308843, -0.2051139, -3.035525, 1, 0.6, 0, 1,
-1.299853, -0.0004828286, -0.5730392, 1, 0.6078432, 0, 1,
-1.296024, -1.322858, -1.949961, 1, 0.6117647, 0, 1,
-1.29214, -0.4618336, -2.234091, 1, 0.6196079, 0, 1,
-1.28432, -0.254525, -2.107952, 1, 0.6235294, 0, 1,
-1.281249, 0.8088255, -1.37737, 1, 0.6313726, 0, 1,
-1.276073, -0.08523302, -0.4012301, 1, 0.6352941, 0, 1,
-1.276033, -0.8288552, -1.561921, 1, 0.6431373, 0, 1,
-1.275053, -0.5078198, -3.007249, 1, 0.6470588, 0, 1,
-1.268117, 0.2908996, -1.159528, 1, 0.654902, 0, 1,
-1.266425, 1.130701, 0.6742795, 1, 0.6588235, 0, 1,
-1.262333, 1.379999, -0.4319308, 1, 0.6666667, 0, 1,
-1.256605, 1.276485, -0.5365869, 1, 0.6705883, 0, 1,
-1.256433, 1.139511, -0.2789093, 1, 0.6784314, 0, 1,
-1.255255, 0.6971663, -1.363203, 1, 0.682353, 0, 1,
-1.233042, 0.2189014, -0.6836374, 1, 0.6901961, 0, 1,
-1.231759, 0.06772412, -1.515248, 1, 0.6941177, 0, 1,
-1.220139, 0.6500133, -2.813446, 1, 0.7019608, 0, 1,
-1.218552, -0.1187017, -2.3522, 1, 0.7098039, 0, 1,
-1.21055, 0.02264348, -1.545442, 1, 0.7137255, 0, 1,
-1.204323, -1.29374, -2.411137, 1, 0.7215686, 0, 1,
-1.200034, -0.2161392, -1.933128, 1, 0.7254902, 0, 1,
-1.197243, 0.1472068, -0.09142067, 1, 0.7333333, 0, 1,
-1.185958, 1.645065, -0.4943264, 1, 0.7372549, 0, 1,
-1.182795, -1.087257, -4.64745, 1, 0.7450981, 0, 1,
-1.180473, 2.038889, 0.313954, 1, 0.7490196, 0, 1,
-1.172378, -0.2260544, -1.319018, 1, 0.7568628, 0, 1,
-1.165031, -1.153898, -1.340862, 1, 0.7607843, 0, 1,
-1.161566, -0.4318032, -2.708692, 1, 0.7686275, 0, 1,
-1.159021, 0.6855596, 0.6501294, 1, 0.772549, 0, 1,
-1.150244, 0.2548376, -0.7362368, 1, 0.7803922, 0, 1,
-1.143273, -0.03665876, -2.54544, 1, 0.7843137, 0, 1,
-1.134857, 0.9748662, -1.048847, 1, 0.7921569, 0, 1,
-1.133093, -1.011785, -3.010858, 1, 0.7960784, 0, 1,
-1.132698, -1.141266, -0.7944477, 1, 0.8039216, 0, 1,
-1.131743, 0.05002334, -0.9835117, 1, 0.8117647, 0, 1,
-1.125374, 0.4280397, -1.182023, 1, 0.8156863, 0, 1,
-1.124682, -0.4640863, -1.442295, 1, 0.8235294, 0, 1,
-1.122749, 1.111762, -0.4190762, 1, 0.827451, 0, 1,
-1.11102, 2.009722, 0.01375107, 1, 0.8352941, 0, 1,
-1.110109, 0.04215514, -3.069439, 1, 0.8392157, 0, 1,
-1.081857, -0.1896216, -3.136898, 1, 0.8470588, 0, 1,
-1.062923, -0.9013833, -1.676618, 1, 0.8509804, 0, 1,
-1.061419, -0.5223736, -3.226262, 1, 0.8588235, 0, 1,
-1.055562, -0.1081945, -2.009973, 1, 0.8627451, 0, 1,
-1.048279, -1.743839, -3.008818, 1, 0.8705882, 0, 1,
-1.046869, -0.5748748, -1.848133, 1, 0.8745098, 0, 1,
-1.043602, 0.2854836, -1.109503, 1, 0.8823529, 0, 1,
-1.043319, -0.4762996, -1.115158, 1, 0.8862745, 0, 1,
-1.040031, 1.287332, -0.9893398, 1, 0.8941177, 0, 1,
-1.036008, -0.9469297, -2.298334, 1, 0.8980392, 0, 1,
-1.035455, -1.82477, -3.228076, 1, 0.9058824, 0, 1,
-1.033932, 0.09905779, -1.983652, 1, 0.9137255, 0, 1,
-1.031319, 1.950837, -0.1174757, 1, 0.9176471, 0, 1,
-1.029043, -0.3316422, -1.577697, 1, 0.9254902, 0, 1,
-1.017495, 0.4255298, -1.452834, 1, 0.9294118, 0, 1,
-1.008473, 1.135757, -0.355529, 1, 0.9372549, 0, 1,
-1.004074, -0.3825465, -3.346437, 1, 0.9411765, 0, 1,
-0.9983417, 0.553196, -1.624311, 1, 0.9490196, 0, 1,
-0.9961185, -1.266609, -3.246374, 1, 0.9529412, 0, 1,
-0.9950219, 2.163074, -0.2810709, 1, 0.9607843, 0, 1,
-0.9948493, -2.376988, -3.530981, 1, 0.9647059, 0, 1,
-0.9812672, -0.2740794, -0.9079983, 1, 0.972549, 0, 1,
-0.9737936, -1.500773, -2.827527, 1, 0.9764706, 0, 1,
-0.9724693, 1.342276, -1.589104, 1, 0.9843137, 0, 1,
-0.9640514, 0.818012, -1.235526, 1, 0.9882353, 0, 1,
-0.9617763, 0.4565893, -2.587705, 1, 0.9960784, 0, 1,
-0.9600162, 1.330236, -1.412748, 0.9960784, 1, 0, 1,
-0.9495862, -0.6610057, -0.5119634, 0.9921569, 1, 0, 1,
-0.9485218, 0.2721632, -0.8325581, 0.9843137, 1, 0, 1,
-0.9344329, -0.9610521, -2.341387, 0.9803922, 1, 0, 1,
-0.9326498, -0.08637966, -2.271474, 0.972549, 1, 0, 1,
-0.9305439, -0.2574507, -2.436887, 0.9686275, 1, 0, 1,
-0.9260619, -0.6371328, -2.120157, 0.9607843, 1, 0, 1,
-0.9248592, 0.1868498, -1.322833, 0.9568627, 1, 0, 1,
-0.9237192, 0.4393899, 0.7546611, 0.9490196, 1, 0, 1,
-0.9219244, 0.9352502, 0.3005557, 0.945098, 1, 0, 1,
-0.9129438, -2.093024, -2.936062, 0.9372549, 1, 0, 1,
-0.9092871, -1.706308, -2.170932, 0.9333333, 1, 0, 1,
-0.8983477, 1.131394, 0.147134, 0.9254902, 1, 0, 1,
-0.882375, 0.7585934, -1.351359, 0.9215686, 1, 0, 1,
-0.8797768, 1.292934, 0.06452338, 0.9137255, 1, 0, 1,
-0.8795294, 2.15138, -0.9692089, 0.9098039, 1, 0, 1,
-0.8767514, 1.371449, -2.019907, 0.9019608, 1, 0, 1,
-0.8646677, 1.356529, -0.7017206, 0.8941177, 1, 0, 1,
-0.862083, -0.8539795, -2.694599, 0.8901961, 1, 0, 1,
-0.8612781, -0.149911, 0.2553771, 0.8823529, 1, 0, 1,
-0.8545775, -0.7662596, -1.250503, 0.8784314, 1, 0, 1,
-0.8360612, 0.5697803, -1.071372, 0.8705882, 1, 0, 1,
-0.8343786, -0.8341031, -4.742114, 0.8666667, 1, 0, 1,
-0.8298809, -1.104955, -0.3600608, 0.8588235, 1, 0, 1,
-0.8284747, -1.850887, -2.953762, 0.854902, 1, 0, 1,
-0.8273352, 0.7157236, -0.1742861, 0.8470588, 1, 0, 1,
-0.8232626, 0.750972, 1.138316, 0.8431373, 1, 0, 1,
-0.8194743, 0.06061808, -1.245149, 0.8352941, 1, 0, 1,
-0.8144079, -0.37479, -2.18418, 0.8313726, 1, 0, 1,
-0.8028095, 0.07393534, -1.078995, 0.8235294, 1, 0, 1,
-0.7928221, 0.8763864, -0.143338, 0.8196079, 1, 0, 1,
-0.7819375, 1.810083, 0.5911022, 0.8117647, 1, 0, 1,
-0.7793334, 0.7692496, -1.523303, 0.8078431, 1, 0, 1,
-0.7736926, 0.3798562, -1.537501, 0.8, 1, 0, 1,
-0.7707548, 1.776062, -1.067012, 0.7921569, 1, 0, 1,
-0.7682706, 0.5702128, -1.096374, 0.7882353, 1, 0, 1,
-0.7675112, 0.1142302, -0.7862502, 0.7803922, 1, 0, 1,
-0.763743, 1.504904, 0.7929131, 0.7764706, 1, 0, 1,
-0.7584432, -0.8471313, -3.123219, 0.7686275, 1, 0, 1,
-0.7560257, 1.800197, -1.284179, 0.7647059, 1, 0, 1,
-0.7548196, -0.2974716, -2.010603, 0.7568628, 1, 0, 1,
-0.7513536, -1.248832, -3.676426, 0.7529412, 1, 0, 1,
-0.7511089, 0.07609071, -0.2315607, 0.7450981, 1, 0, 1,
-0.7498513, 0.2413395, -1.52685, 0.7411765, 1, 0, 1,
-0.7467744, -1.463204, -3.361471, 0.7333333, 1, 0, 1,
-0.7466601, 0.02575362, -2.365256, 0.7294118, 1, 0, 1,
-0.7349411, 0.8589073, -0.7767841, 0.7215686, 1, 0, 1,
-0.7340444, -0.07776212, -0.8602073, 0.7176471, 1, 0, 1,
-0.7301384, -0.5662228, -1.70672, 0.7098039, 1, 0, 1,
-0.7299918, -0.134287, -1.054258, 0.7058824, 1, 0, 1,
-0.7217056, -1.136887, -3.70727, 0.6980392, 1, 0, 1,
-0.7202495, -0.6456606, -2.816226, 0.6901961, 1, 0, 1,
-0.7156141, 0.7845771, -0.06730998, 0.6862745, 1, 0, 1,
-0.7139595, 0.9283356, -1.66632, 0.6784314, 1, 0, 1,
-0.7111949, 0.5584339, -1.557102, 0.6745098, 1, 0, 1,
-0.7094895, -0.8467275, -2.737296, 0.6666667, 1, 0, 1,
-0.708653, -0.04153949, -1.564726, 0.6627451, 1, 0, 1,
-0.7059933, -0.6691518, -1.695706, 0.654902, 1, 0, 1,
-0.7051931, 2.028813, 0.1834021, 0.6509804, 1, 0, 1,
-0.7044425, -0.2814999, -2.567309, 0.6431373, 1, 0, 1,
-0.6969709, -1.162177, -1.90068, 0.6392157, 1, 0, 1,
-0.6918765, -0.7627271, -0.5982497, 0.6313726, 1, 0, 1,
-0.6889946, -0.6248287, -0.9589323, 0.627451, 1, 0, 1,
-0.6827285, 0.0401058, -2.850835, 0.6196079, 1, 0, 1,
-0.6795716, -0.5579718, -1.718955, 0.6156863, 1, 0, 1,
-0.679057, -0.8534399, -4.30961, 0.6078432, 1, 0, 1,
-0.676295, -0.7229027, -2.392856, 0.6039216, 1, 0, 1,
-0.6742954, -0.08703692, -2.569549, 0.5960785, 1, 0, 1,
-0.670635, 0.6201372, -1.505291, 0.5882353, 1, 0, 1,
-0.670494, 1.217667, -0.8769348, 0.5843138, 1, 0, 1,
-0.668127, -0.7569343, -4.105921, 0.5764706, 1, 0, 1,
-0.6665737, -1.468776, -3.219944, 0.572549, 1, 0, 1,
-0.6644583, 0.3661584, -3.084878, 0.5647059, 1, 0, 1,
-0.6584024, -0.6074657, -1.049282, 0.5607843, 1, 0, 1,
-0.6577556, -1.427262, -2.210931, 0.5529412, 1, 0, 1,
-0.6567124, -1.489725, -2.551744, 0.5490196, 1, 0, 1,
-0.6521616, -0.4124023, -1.461484, 0.5411765, 1, 0, 1,
-0.6519334, -1.006963, -3.746751, 0.5372549, 1, 0, 1,
-0.6507624, 1.470169, -2.570077, 0.5294118, 1, 0, 1,
-0.6503044, -0.5208188, -3.438082, 0.5254902, 1, 0, 1,
-0.650106, 1.325534, -1.841211, 0.5176471, 1, 0, 1,
-0.6499954, 0.5379087, -0.2207492, 0.5137255, 1, 0, 1,
-0.6495194, -0.2964734, -1.790709, 0.5058824, 1, 0, 1,
-0.6463488, 0.6065226, -0.1653547, 0.5019608, 1, 0, 1,
-0.6445247, -0.8194864, -1.633611, 0.4941176, 1, 0, 1,
-0.640766, 0.5360007, -0.7722276, 0.4862745, 1, 0, 1,
-0.6332215, 0.4334077, -0.5755405, 0.4823529, 1, 0, 1,
-0.6316102, -0.2566236, -1.594109, 0.4745098, 1, 0, 1,
-0.6294093, 0.7009106, -1.507597, 0.4705882, 1, 0, 1,
-0.6287115, 0.7798259, -0.3981709, 0.4627451, 1, 0, 1,
-0.6260843, 0.3495223, -2.015165, 0.4588235, 1, 0, 1,
-0.6251252, -1.139132, -2.33954, 0.4509804, 1, 0, 1,
-0.6239569, -0.8998488, -2.54997, 0.4470588, 1, 0, 1,
-0.6232014, 0.09314527, -1.167482, 0.4392157, 1, 0, 1,
-0.6208443, -0.6819515, -2.737484, 0.4352941, 1, 0, 1,
-0.6162515, -1.62134, -2.889035, 0.427451, 1, 0, 1,
-0.612198, -1.09133, -4.667723, 0.4235294, 1, 0, 1,
-0.6105711, -0.1170546, -3.3966, 0.4156863, 1, 0, 1,
-0.6100599, 0.9012588, -1.599524, 0.4117647, 1, 0, 1,
-0.6084546, 0.7664675, -0.09060802, 0.4039216, 1, 0, 1,
-0.6039647, -0.4527739, -3.470991, 0.3960784, 1, 0, 1,
-0.6010439, 0.5725302, -0.6117357, 0.3921569, 1, 0, 1,
-0.5979149, 0.1379015, -0.1041173, 0.3843137, 1, 0, 1,
-0.5966018, -0.6870998, -1.190639, 0.3803922, 1, 0, 1,
-0.5940615, -1.017125, -3.605015, 0.372549, 1, 0, 1,
-0.5932415, 0.1903963, -0.5742288, 0.3686275, 1, 0, 1,
-0.5846831, 2.053979, -1.019942, 0.3607843, 1, 0, 1,
-0.5809914, -2.760221, -1.679703, 0.3568628, 1, 0, 1,
-0.5801262, -0.1891623, -1.572541, 0.3490196, 1, 0, 1,
-0.5798251, -0.7016706, -2.030605, 0.345098, 1, 0, 1,
-0.5769975, -0.3763206, -1.552677, 0.3372549, 1, 0, 1,
-0.5764734, -0.1341457, -0.6257725, 0.3333333, 1, 0, 1,
-0.5714718, 0.3863506, -2.349245, 0.3254902, 1, 0, 1,
-0.5700761, -0.007958657, -1.066859, 0.3215686, 1, 0, 1,
-0.5700502, 0.8921391, -0.9839198, 0.3137255, 1, 0, 1,
-0.5676546, -0.8301781, -1.102607, 0.3098039, 1, 0, 1,
-0.5665401, 0.7305169, -0.760493, 0.3019608, 1, 0, 1,
-0.5638355, 0.6658432, -2.610301, 0.2941177, 1, 0, 1,
-0.5635918, 1.843012, 1.548325, 0.2901961, 1, 0, 1,
-0.5618839, -0.6363596, -1.996787, 0.282353, 1, 0, 1,
-0.5614055, 0.4531725, -0.6584562, 0.2784314, 1, 0, 1,
-0.5611876, -1.160051, -2.106787, 0.2705882, 1, 0, 1,
-0.5598601, -0.03474981, -1.171519, 0.2666667, 1, 0, 1,
-0.5572892, -0.2022995, -3.167956, 0.2588235, 1, 0, 1,
-0.5567065, 0.2183209, -0.7432051, 0.254902, 1, 0, 1,
-0.5547181, 1.081865, 0.9200004, 0.2470588, 1, 0, 1,
-0.5500929, -0.3873718, -2.26018, 0.2431373, 1, 0, 1,
-0.5492747, -1.131076, -2.526657, 0.2352941, 1, 0, 1,
-0.5479209, -0.2364409, -2.249207, 0.2313726, 1, 0, 1,
-0.5475837, -0.08633085, -0.7190687, 0.2235294, 1, 0, 1,
-0.5470749, 0.164412, -0.9689519, 0.2196078, 1, 0, 1,
-0.5453445, -0.3343064, -1.523591, 0.2117647, 1, 0, 1,
-0.5410711, -1.886612, -0.5360057, 0.2078431, 1, 0, 1,
-0.5369503, -0.3605587, -1.544946, 0.2, 1, 0, 1,
-0.5326788, 0.6189726, -0.2465106, 0.1921569, 1, 0, 1,
-0.5323544, 0.1484261, -0.7140114, 0.1882353, 1, 0, 1,
-0.5321038, -0.831774, -1.650014, 0.1803922, 1, 0, 1,
-0.5297746, -0.6347628, -4.601855, 0.1764706, 1, 0, 1,
-0.5279624, 0.595749, -0.7479508, 0.1686275, 1, 0, 1,
-0.5269824, -0.2848264, -2.341231, 0.1647059, 1, 0, 1,
-0.5238171, 1.599539, -0.3985325, 0.1568628, 1, 0, 1,
-0.5233791, -0.5012876, -3.576213, 0.1529412, 1, 0, 1,
-0.5233169, -0.9563149, -2.605451, 0.145098, 1, 0, 1,
-0.5232792, -0.1625336, -1.924242, 0.1411765, 1, 0, 1,
-0.5211579, -0.6584664, -2.0967, 0.1333333, 1, 0, 1,
-0.5197549, 0.8495527, -1.860337, 0.1294118, 1, 0, 1,
-0.5172685, -0.2530562, -0.9510995, 0.1215686, 1, 0, 1,
-0.5166531, -0.06771298, -3.065104, 0.1176471, 1, 0, 1,
-0.5164194, 0.8570119, 1.199565, 0.1098039, 1, 0, 1,
-0.5140856, 2.103939, -0.935937, 0.1058824, 1, 0, 1,
-0.5127166, 0.619151, -1.652413, 0.09803922, 1, 0, 1,
-0.5115291, -1.321121, -1.368572, 0.09019608, 1, 0, 1,
-0.5107284, 0.08766055, -2.219188, 0.08627451, 1, 0, 1,
-0.503346, -1.902071, -4.917612, 0.07843138, 1, 0, 1,
-0.5033264, -0.2139892, -0.9963834, 0.07450981, 1, 0, 1,
-0.5017528, 0.4002354, -0.5301099, 0.06666667, 1, 0, 1,
-0.5005291, -0.09407997, -1.13708, 0.0627451, 1, 0, 1,
-0.5000783, -0.6157152, -2.428583, 0.05490196, 1, 0, 1,
-0.4996313, 0.005256014, -0.3528344, 0.05098039, 1, 0, 1,
-0.4993815, -0.4490548, 0.001797071, 0.04313726, 1, 0, 1,
-0.4923837, -2.20922, -2.200537, 0.03921569, 1, 0, 1,
-0.4905034, -0.3081726, -2.449413, 0.03137255, 1, 0, 1,
-0.4866761, -0.3924637, -1.92333, 0.02745098, 1, 0, 1,
-0.4848869, -0.1714194, -3.314068, 0.01960784, 1, 0, 1,
-0.4847522, 0.3714659, -0.7873396, 0.01568628, 1, 0, 1,
-0.4833161, -0.3554453, -1.740372, 0.007843138, 1, 0, 1,
-0.4790764, -0.9980137, -1.654823, 0.003921569, 1, 0, 1,
-0.4772221, -0.6387566, -1.276187, 0, 1, 0.003921569, 1,
-0.4752642, 0.1002753, -2.469089, 0, 1, 0.01176471, 1,
-0.4749252, 0.08031713, -1.260024, 0, 1, 0.01568628, 1,
-0.4714749, 1.554604, -1.478229, 0, 1, 0.02352941, 1,
-0.4696493, 0.5005957, -0.1170704, 0, 1, 0.02745098, 1,
-0.4688702, 0.2187726, -1.504125, 0, 1, 0.03529412, 1,
-0.4673139, 1.423099, -0.4676911, 0, 1, 0.03921569, 1,
-0.4635043, -0.9953638, -3.780053, 0, 1, 0.04705882, 1,
-0.4629213, 0.910614, 0.675368, 0, 1, 0.05098039, 1,
-0.4608279, -0.1610831, -0.3549445, 0, 1, 0.05882353, 1,
-0.4586452, 1.062692, 0.1614396, 0, 1, 0.0627451, 1,
-0.4536441, 0.1898311, -0.1599972, 0, 1, 0.07058824, 1,
-0.4486581, 0.7958217, -0.948924, 0, 1, 0.07450981, 1,
-0.4474962, 1.907382, -0.5502919, 0, 1, 0.08235294, 1,
-0.445565, 0.02746227, -1.379409, 0, 1, 0.08627451, 1,
-0.4401805, -0.06381349, -1.026689, 0, 1, 0.09411765, 1,
-0.4369416, 0.709577, 0.9150646, 0, 1, 0.1019608, 1,
-0.4367648, 1.049156, 0.008127565, 0, 1, 0.1058824, 1,
-0.4365966, 1.033124, -0.9180843, 0, 1, 0.1137255, 1,
-0.4362453, 0.8356732, 0.3775366, 0, 1, 0.1176471, 1,
-0.4344768, -0.2506987, -1.736124, 0, 1, 0.1254902, 1,
-0.4287093, -0.5187542, -1.636393, 0, 1, 0.1294118, 1,
-0.4283253, 0.4500666, -0.6263694, 0, 1, 0.1372549, 1,
-0.4275261, 0.6967214, 0.6517128, 0, 1, 0.1411765, 1,
-0.4245195, 0.8748372, -1.033858, 0, 1, 0.1490196, 1,
-0.4227712, -0.9680673, -2.416447, 0, 1, 0.1529412, 1,
-0.4204432, -0.6877336, -4.228557, 0, 1, 0.1607843, 1,
-0.4195718, 0.3633374, -0.3724682, 0, 1, 0.1647059, 1,
-0.4171366, 0.1975343, -1.771364, 0, 1, 0.172549, 1,
-0.4151265, 0.6199111, -1.90515, 0, 1, 0.1764706, 1,
-0.4077492, 1.149731, -1.017721, 0, 1, 0.1843137, 1,
-0.4074472, -0.476735, -2.308375, 0, 1, 0.1882353, 1,
-0.3998179, 1.298599, 0.8354588, 0, 1, 0.1960784, 1,
-0.3990593, 1.043401, -0.5485851, 0, 1, 0.2039216, 1,
-0.3979908, -0.03421647, -1.660992, 0, 1, 0.2078431, 1,
-0.3973264, -0.8278649, -2.912668, 0, 1, 0.2156863, 1,
-0.3954567, -0.9350505, -2.309167, 0, 1, 0.2196078, 1,
-0.3892257, 1.487639, 0.3667129, 0, 1, 0.227451, 1,
-0.3866213, -0.5681381, -2.281888, 0, 1, 0.2313726, 1,
-0.3862444, -0.5210244, -2.789007, 0, 1, 0.2392157, 1,
-0.3858798, 1.598519, -1.313258, 0, 1, 0.2431373, 1,
-0.3812034, -0.2823113, -2.00632, 0, 1, 0.2509804, 1,
-0.3804135, 0.4906074, 0.5476876, 0, 1, 0.254902, 1,
-0.3762254, -1.095742, -2.487616, 0, 1, 0.2627451, 1,
-0.3751179, -0.4138831, -1.833176, 0, 1, 0.2666667, 1,
-0.3739806, 0.1335511, -1.622816, 0, 1, 0.2745098, 1,
-0.3720616, 1.868128, 0.6924046, 0, 1, 0.2784314, 1,
-0.3714443, 1.429106, 0.2781076, 0, 1, 0.2862745, 1,
-0.3674352, -0.09121039, -0.4279071, 0, 1, 0.2901961, 1,
-0.3668873, -0.1153117, -0.8289067, 0, 1, 0.2980392, 1,
-0.3659138, 0.2858904, -0.4084781, 0, 1, 0.3058824, 1,
-0.3649019, -0.3811014, -2.281766, 0, 1, 0.3098039, 1,
-0.3632852, -0.5438495, -4.277217, 0, 1, 0.3176471, 1,
-0.3622122, 0.8074635, -1.584785, 0, 1, 0.3215686, 1,
-0.3586956, -0.02472719, -0.2887131, 0, 1, 0.3294118, 1,
-0.3581266, 1.417307, -0.506309, 0, 1, 0.3333333, 1,
-0.3568234, 0.2606746, -0.3135269, 0, 1, 0.3411765, 1,
-0.3467307, 0.2363133, -1.568683, 0, 1, 0.345098, 1,
-0.3462922, -0.08671693, -2.31693, 0, 1, 0.3529412, 1,
-0.3414378, -1.97363, -3.530694, 0, 1, 0.3568628, 1,
-0.3392227, 1.129773, -0.5140441, 0, 1, 0.3647059, 1,
-0.3328712, -1.476297, -2.642945, 0, 1, 0.3686275, 1,
-0.3311644, -1.70797, -3.157398, 0, 1, 0.3764706, 1,
-0.3277299, 0.07028872, -1.138847, 0, 1, 0.3803922, 1,
-0.3265629, 0.2693405, -0.1231816, 0, 1, 0.3882353, 1,
-0.3259504, -1.093183, -3.169615, 0, 1, 0.3921569, 1,
-0.3246067, -1.282318, -3.699076, 0, 1, 0.4, 1,
-0.324301, 0.5800552, -1.302749, 0, 1, 0.4078431, 1,
-0.3191378, 0.6210201, 0.6178936, 0, 1, 0.4117647, 1,
-0.3175012, 0.6264202, -0.5774992, 0, 1, 0.4196078, 1,
-0.3167571, 0.9481593, 0.5611452, 0, 1, 0.4235294, 1,
-0.3161131, 0.847997, -0.8325999, 0, 1, 0.4313726, 1,
-0.3141484, 0.2941068, -1.10845, 0, 1, 0.4352941, 1,
-0.3091569, 0.04780864, -1.444711, 0, 1, 0.4431373, 1,
-0.3061084, -1.293224, -3.788526, 0, 1, 0.4470588, 1,
-0.2963125, 0.8194438, -1.176845, 0, 1, 0.454902, 1,
-0.2935643, -0.1117111, -1.346212, 0, 1, 0.4588235, 1,
-0.2786233, 1.126315, 0.7003429, 0, 1, 0.4666667, 1,
-0.2785667, 0.4110222, -0.4937779, 0, 1, 0.4705882, 1,
-0.2754146, -0.8935721, -4.277478, 0, 1, 0.4784314, 1,
-0.2717335, 0.5964983, 0.7152011, 0, 1, 0.4823529, 1,
-0.2628522, -0.8236895, -4.059867, 0, 1, 0.4901961, 1,
-0.2601359, -0.1764743, -1.39107, 0, 1, 0.4941176, 1,
-0.2593821, -1.884559, -5.489362, 0, 1, 0.5019608, 1,
-0.2591583, 1.186038, 0.9903853, 0, 1, 0.509804, 1,
-0.2522033, -0.5573713, -1.604042, 0, 1, 0.5137255, 1,
-0.2408576, 1.660194, 0.3710426, 0, 1, 0.5215687, 1,
-0.2400984, 0.8016002, 1.590661, 0, 1, 0.5254902, 1,
-0.2392529, 1.928934, 0.4259123, 0, 1, 0.5333334, 1,
-0.2368062, -0.7703144, -3.918782, 0, 1, 0.5372549, 1,
-0.2353797, 0.7580064, -0.2241642, 0, 1, 0.5450981, 1,
-0.2328663, 1.990935, 1.608653, 0, 1, 0.5490196, 1,
-0.2327675, -0.301554, -3.000203, 0, 1, 0.5568628, 1,
-0.232631, -1.275081, -3.426129, 0, 1, 0.5607843, 1,
-0.2283903, 0.51459, -0.4142976, 0, 1, 0.5686275, 1,
-0.2197745, 1.415945, 0.1972451, 0, 1, 0.572549, 1,
-0.2180155, 0.3921869, -0.5892113, 0, 1, 0.5803922, 1,
-0.215951, -0.2826386, -2.656693, 0, 1, 0.5843138, 1,
-0.2156383, 1.439568, 0.1971347, 0, 1, 0.5921569, 1,
-0.2132786, 1.368636, 0.1347072, 0, 1, 0.5960785, 1,
-0.2107499, 0.3914533, -0.2441622, 0, 1, 0.6039216, 1,
-0.2098074, -0.05485655, -2.813974, 0, 1, 0.6117647, 1,
-0.2073824, 0.1450704, 0.2888888, 0, 1, 0.6156863, 1,
-0.2025699, 0.2136447, -0.2771751, 0, 1, 0.6235294, 1,
-0.2003796, -0.638643, -2.39295, 0, 1, 0.627451, 1,
-0.1998939, -0.9418709, -1.183098, 0, 1, 0.6352941, 1,
-0.197437, 1.195212, -0.9960737, 0, 1, 0.6392157, 1,
-0.197429, -0.04328644, -0.3096848, 0, 1, 0.6470588, 1,
-0.196185, -1.050025, -4.691514, 0, 1, 0.6509804, 1,
-0.1923989, 0.2772632, -1.511912, 0, 1, 0.6588235, 1,
-0.1893946, -2.164322, -0.4874839, 0, 1, 0.6627451, 1,
-0.1855406, 0.1947603, -0.2238198, 0, 1, 0.6705883, 1,
-0.180428, -0.08835343, -1.227663, 0, 1, 0.6745098, 1,
-0.1802463, -0.1354299, -0.4383512, 0, 1, 0.682353, 1,
-0.1790058, -0.8864629, -3.293588, 0, 1, 0.6862745, 1,
-0.1765166, -0.1421513, -1.714849, 0, 1, 0.6941177, 1,
-0.1755282, -0.9972968, -1.738319, 0, 1, 0.7019608, 1,
-0.1753074, -0.8605664, -2.088965, 0, 1, 0.7058824, 1,
-0.1748011, 0.5284709, 0.4688637, 0, 1, 0.7137255, 1,
-0.1713167, 0.2573625, -0.3946763, 0, 1, 0.7176471, 1,
-0.1678841, -1.298777, -2.640958, 0, 1, 0.7254902, 1,
-0.1662711, -1.704566, -3.788347, 0, 1, 0.7294118, 1,
-0.1629483, -0.630865, -2.704526, 0, 1, 0.7372549, 1,
-0.1623123, -0.7467225, -2.002458, 0, 1, 0.7411765, 1,
-0.1612168, 0.3114935, 0.6278071, 0, 1, 0.7490196, 1,
-0.1606652, -0.8269007, -3.125832, 0, 1, 0.7529412, 1,
-0.155307, -0.8298793, -2.648467, 0, 1, 0.7607843, 1,
-0.1526526, -0.336432, -2.470162, 0, 1, 0.7647059, 1,
-0.1523576, 0.7077144, -0.2716711, 0, 1, 0.772549, 1,
-0.150649, 0.3553782, -0.8466048, 0, 1, 0.7764706, 1,
-0.1481297, 0.9987581, -0.2358854, 0, 1, 0.7843137, 1,
-0.1463064, 0.7435316, -0.3958847, 0, 1, 0.7882353, 1,
-0.1443629, -0.920852, -2.486099, 0, 1, 0.7960784, 1,
-0.1435419, 0.7358209, -1.787813, 0, 1, 0.8039216, 1,
-0.1433682, 0.1725453, -0.3293539, 0, 1, 0.8078431, 1,
-0.1425489, 0.9349416, 0.3186762, 0, 1, 0.8156863, 1,
-0.1410782, 0.4962707, 1.010754, 0, 1, 0.8196079, 1,
-0.1401287, 0.7574356, -0.3127271, 0, 1, 0.827451, 1,
-0.1336969, -0.5570416, -3.920729, 0, 1, 0.8313726, 1,
-0.132965, -0.7932599, -2.942781, 0, 1, 0.8392157, 1,
-0.1275829, 0.5163281, 0.2819527, 0, 1, 0.8431373, 1,
-0.1271497, 0.7639909, 0.7811069, 0, 1, 0.8509804, 1,
-0.1262551, -0.5536236, -4.088902, 0, 1, 0.854902, 1,
-0.1252225, -0.07989547, -3.067141, 0, 1, 0.8627451, 1,
-0.1193318, 0.9399397, -0.4167455, 0, 1, 0.8666667, 1,
-0.1170894, -0.6663986, -3.186667, 0, 1, 0.8745098, 1,
-0.1116352, 1.118382, -0.4256918, 0, 1, 0.8784314, 1,
-0.1099947, 0.5302575, -1.091622, 0, 1, 0.8862745, 1,
-0.1097522, -0.436621, -3.147788, 0, 1, 0.8901961, 1,
-0.1072278, 1.412276, 1.289149, 0, 1, 0.8980392, 1,
-0.1043553, 1.35387, -0.3533806, 0, 1, 0.9058824, 1,
-0.0993112, 0.5147101, 1.898688, 0, 1, 0.9098039, 1,
-0.09863079, -0.2303548, -1.775473, 0, 1, 0.9176471, 1,
-0.09771118, 0.4218979, -0.491455, 0, 1, 0.9215686, 1,
-0.09670303, 0.6429603, 0.4602264, 0, 1, 0.9294118, 1,
-0.09616025, -1.879547, -2.663746, 0, 1, 0.9333333, 1,
-0.09605642, -0.2201191, -2.66979, 0, 1, 0.9411765, 1,
-0.09449284, 0.3975909, 0.309985, 0, 1, 0.945098, 1,
-0.09215382, 0.7286476, -0.202786, 0, 1, 0.9529412, 1,
-0.08901775, -0.6190043, -1.608483, 0, 1, 0.9568627, 1,
-0.08752773, 1.030993, 0.5896795, 0, 1, 0.9647059, 1,
-0.08340663, 0.5281856, -0.3510621, 0, 1, 0.9686275, 1,
-0.08282779, -0.7693025, -2.443321, 0, 1, 0.9764706, 1,
-0.07728091, 0.2839543, 0.9095193, 0, 1, 0.9803922, 1,
-0.07694857, 0.7689916, -1.286623, 0, 1, 0.9882353, 1,
-0.07596789, -0.5802473, -2.832719, 0, 1, 0.9921569, 1,
-0.07560179, 0.4274334, 1.573078, 0, 1, 1, 1,
-0.06639346, 0.1418382, -0.7390208, 0, 0.9921569, 1, 1,
-0.06288302, 0.5509698, -1.319236, 0, 0.9882353, 1, 1,
-0.06217308, -0.8117884, -3.551343, 0, 0.9803922, 1, 1,
-0.06142716, -0.7965616, -3.644901, 0, 0.9764706, 1, 1,
-0.06132345, 0.08821097, 0.2077128, 0, 0.9686275, 1, 1,
-0.06024823, 1.450311, 0.9853039, 0, 0.9647059, 1, 1,
-0.05722366, 0.1721357, -0.55878, 0, 0.9568627, 1, 1,
-0.04237527, 1.299956, 0.004944597, 0, 0.9529412, 1, 1,
-0.03339357, 0.7200261, 0.3088851, 0, 0.945098, 1, 1,
-0.0331816, 0.4535341, 1.301997, 0, 0.9411765, 1, 1,
-0.02820098, -0.1602104, -3.454036, 0, 0.9333333, 1, 1,
-0.01833732, -0.4882455, -4.726238, 0, 0.9294118, 1, 1,
-0.01766334, -0.3933181, -3.100787, 0, 0.9215686, 1, 1,
-0.01612983, 0.341249, -0.4808902, 0, 0.9176471, 1, 1,
-0.01147698, 1.514828, -0.1950046, 0, 0.9098039, 1, 1,
-0.01057869, -1.014377, -4.259396, 0, 0.9058824, 1, 1,
-0.00802488, 2.851023, 1.745428, 0, 0.8980392, 1, 1,
-0.006016326, -0.1419728, -3.031866, 0, 0.8901961, 1, 1,
-0.00546272, -0.7637818, -2.026307, 0, 0.8862745, 1, 1,
0.002402929, 0.6339266, -0.09872887, 0, 0.8784314, 1, 1,
0.002742959, 0.1837465, 2.168835, 0, 0.8745098, 1, 1,
0.005428938, 1.64084, 0.4102104, 0, 0.8666667, 1, 1,
0.005447395, -0.1078699, 2.952166, 0, 0.8627451, 1, 1,
0.00736532, 0.5057109, -0.2797765, 0, 0.854902, 1, 1,
0.007387207, 0.4943929, -1.647586, 0, 0.8509804, 1, 1,
0.00783976, 1.144341, 1.008394, 0, 0.8431373, 1, 1,
0.01430815, 0.5726519, -0.8179598, 0, 0.8392157, 1, 1,
0.01526019, 0.2024113, 2.551147, 0, 0.8313726, 1, 1,
0.01843871, 1.246644, 1.006028, 0, 0.827451, 1, 1,
0.02112498, -1.572601, 1.99551, 0, 0.8196079, 1, 1,
0.02208085, 0.1865921, -0.931438, 0, 0.8156863, 1, 1,
0.02472389, 0.7743906, 0.01431777, 0, 0.8078431, 1, 1,
0.03426542, 1.451679, 0.2069522, 0, 0.8039216, 1, 1,
0.03598033, -0.01471381, 1.456628, 0, 0.7960784, 1, 1,
0.03792388, 1.116907, 1.661184, 0, 0.7882353, 1, 1,
0.04220135, -0.2277538, 3.918373, 0, 0.7843137, 1, 1,
0.05163922, 0.4672804, 1.619234, 0, 0.7764706, 1, 1,
0.06241635, 1.726643, -0.405443, 0, 0.772549, 1, 1,
0.06267553, 0.3133397, 1.301666, 0, 0.7647059, 1, 1,
0.06347108, 0.7630569, 0.359353, 0, 0.7607843, 1, 1,
0.06406964, 0.7940595, -0.8745963, 0, 0.7529412, 1, 1,
0.06523837, -0.4418546, 2.684807, 0, 0.7490196, 1, 1,
0.0656001, -1.797042, 1.941015, 0, 0.7411765, 1, 1,
0.06667321, -0.6111207, 4.324634, 0, 0.7372549, 1, 1,
0.06672097, 0.5955441, 0.5228766, 0, 0.7294118, 1, 1,
0.06890281, -0.1081696, 1.919091, 0, 0.7254902, 1, 1,
0.07257523, -0.2740124, 2.796273, 0, 0.7176471, 1, 1,
0.07657158, -1.623889, 2.105346, 0, 0.7137255, 1, 1,
0.08050089, 1.10076, -0.07941691, 0, 0.7058824, 1, 1,
0.08355754, -0.8058879, 4.961657, 0, 0.6980392, 1, 1,
0.08524299, -0.2508936, 3.467002, 0, 0.6941177, 1, 1,
0.08545244, -0.09657266, 3.592081, 0, 0.6862745, 1, 1,
0.08609919, -0.5530184, 2.933969, 0, 0.682353, 1, 1,
0.09183867, -0.0005841393, 1.386685, 0, 0.6745098, 1, 1,
0.09244636, -1.002081, 3.130293, 0, 0.6705883, 1, 1,
0.09359039, 0.2584471, 0.1371382, 0, 0.6627451, 1, 1,
0.09391333, -1.053549, 4.040597, 0, 0.6588235, 1, 1,
0.09946779, -1.419986, 2.085068, 0, 0.6509804, 1, 1,
0.09965587, -1.232222, 4.512467, 0, 0.6470588, 1, 1,
0.1005376, 1.049283, -0.400708, 0, 0.6392157, 1, 1,
0.1103616, -0.1866309, 4.783239, 0, 0.6352941, 1, 1,
0.1111461, 0.8304313, 0.7709281, 0, 0.627451, 1, 1,
0.1255988, -0.9730588, 2.748243, 0, 0.6235294, 1, 1,
0.1274037, -0.8957199, 3.603612, 0, 0.6156863, 1, 1,
0.1298202, 1.199318, -0.2352524, 0, 0.6117647, 1, 1,
0.1314391, -1.956461, 2.41765, 0, 0.6039216, 1, 1,
0.138606, 1.425603, -0.0131575, 0, 0.5960785, 1, 1,
0.1417217, 1.429594, 0.693363, 0, 0.5921569, 1, 1,
0.1441985, -0.1501755, 3.440941, 0, 0.5843138, 1, 1,
0.1458956, 0.3801021, 0.0238341, 0, 0.5803922, 1, 1,
0.1468056, -0.2788779, 1.639964, 0, 0.572549, 1, 1,
0.1479653, 0.2695638, 1.455582, 0, 0.5686275, 1, 1,
0.1495096, 1.543906, 0.7396684, 0, 0.5607843, 1, 1,
0.1502415, -2.412647, 3.6671, 0, 0.5568628, 1, 1,
0.1550692, 0.8681318, 1.382666, 0, 0.5490196, 1, 1,
0.155402, 0.5249305, -0.1641643, 0, 0.5450981, 1, 1,
0.1566187, 1.526522, -1.855242, 0, 0.5372549, 1, 1,
0.1598994, 0.8167081, 0.9580351, 0, 0.5333334, 1, 1,
0.1670343, -0.232453, 1.898932, 0, 0.5254902, 1, 1,
0.1690276, 0.32406, -0.170336, 0, 0.5215687, 1, 1,
0.1743393, 1.740709, 1.144587, 0, 0.5137255, 1, 1,
0.1743945, -0.440748, 3.327052, 0, 0.509804, 1, 1,
0.1746073, -0.3095819, 3.010308, 0, 0.5019608, 1, 1,
0.1758789, -0.5922315, 4.032611, 0, 0.4941176, 1, 1,
0.1774334, 0.3092697, 0.7021482, 0, 0.4901961, 1, 1,
0.1787623, -0.9014071, 3.261204, 0, 0.4823529, 1, 1,
0.1798892, -1.303886, 2.384952, 0, 0.4784314, 1, 1,
0.1800529, 0.9820825, 0.725426, 0, 0.4705882, 1, 1,
0.180583, -1.247138, 3.302501, 0, 0.4666667, 1, 1,
0.1859192, -0.07243753, 1.684208, 0, 0.4588235, 1, 1,
0.1879141, -0.5977699, 3.500592, 0, 0.454902, 1, 1,
0.1887614, -0.5649053, 2.80947, 0, 0.4470588, 1, 1,
0.1942602, 1.015309, 1.275216, 0, 0.4431373, 1, 1,
0.1957919, 1.133229, -0.3997543, 0, 0.4352941, 1, 1,
0.1971902, 0.8055003, 1.793735, 0, 0.4313726, 1, 1,
0.1974825, 0.855282, 0.7596691, 0, 0.4235294, 1, 1,
0.198682, 0.05871703, 0.3685636, 0, 0.4196078, 1, 1,
0.2010819, 0.1100957, 0.1167501, 0, 0.4117647, 1, 1,
0.2035911, 0.4238663, 0.7422734, 0, 0.4078431, 1, 1,
0.20554, -1.073081, 2.657304, 0, 0.4, 1, 1,
0.206787, 0.4364798, 0.5179624, 0, 0.3921569, 1, 1,
0.2118902, -0.3970225, 2.763124, 0, 0.3882353, 1, 1,
0.2144154, 0.7998096, 0.4540808, 0, 0.3803922, 1, 1,
0.217443, -1.819159, 4.117754, 0, 0.3764706, 1, 1,
0.2193777, 0.469422, -0.5189267, 0, 0.3686275, 1, 1,
0.2205233, 0.3282282, -0.2768143, 0, 0.3647059, 1, 1,
0.2231528, 0.8737283, 0.3139378, 0, 0.3568628, 1, 1,
0.2255895, 1.906235, -0.6690953, 0, 0.3529412, 1, 1,
0.2263227, -0.7956882, 2.079708, 0, 0.345098, 1, 1,
0.2267236, 0.9459207, 0.5464762, 0, 0.3411765, 1, 1,
0.2334673, 2.340301, -1.174419, 0, 0.3333333, 1, 1,
0.2383872, 1.475369, 0.2849006, 0, 0.3294118, 1, 1,
0.2388092, -0.6610218, 2.363084, 0, 0.3215686, 1, 1,
0.23906, -0.8741738, 2.501017, 0, 0.3176471, 1, 1,
0.2446167, 0.4312891, 1.095822, 0, 0.3098039, 1, 1,
0.24964, 0.3654323, 1.661437, 0, 0.3058824, 1, 1,
0.2516979, -2.436379, 1.880063, 0, 0.2980392, 1, 1,
0.2536, 1.358999, 0.1222716, 0, 0.2901961, 1, 1,
0.2567937, -0.7382706, 3.680984, 0, 0.2862745, 1, 1,
0.2649727, 0.3183715, 0.4055142, 0, 0.2784314, 1, 1,
0.2752479, -1.306366, 3.339248, 0, 0.2745098, 1, 1,
0.2763591, 1.750269, -0.4517862, 0, 0.2666667, 1, 1,
0.2764956, 0.04208542, 1.559234, 0, 0.2627451, 1, 1,
0.2896884, -0.9412596, 2.986715, 0, 0.254902, 1, 1,
0.2904564, -1.38092, 2.985084, 0, 0.2509804, 1, 1,
0.2954846, 0.7157121, 1.514964, 0, 0.2431373, 1, 1,
0.2999858, -1.154673, 2.706138, 0, 0.2392157, 1, 1,
0.302282, 0.8557748, -0.3256755, 0, 0.2313726, 1, 1,
0.3090382, -0.9198695, 1.27053, 0, 0.227451, 1, 1,
0.3129691, 0.0251781, 2.799988, 0, 0.2196078, 1, 1,
0.3137326, 1.187596, -1.415191, 0, 0.2156863, 1, 1,
0.316033, 1.308923, -0.02745551, 0, 0.2078431, 1, 1,
0.3303083, -0.5857172, 2.313265, 0, 0.2039216, 1, 1,
0.3324471, -1.452911, 2.781947, 0, 0.1960784, 1, 1,
0.3337734, 0.2458055, 0.8201093, 0, 0.1882353, 1, 1,
0.3352232, -0.4060595, 0.7837996, 0, 0.1843137, 1, 1,
0.3352968, -1.053853, 3.377278, 0, 0.1764706, 1, 1,
0.3371757, -0.9989568, 1.758103, 0, 0.172549, 1, 1,
0.3377226, 1.942023, 1.063903, 0, 0.1647059, 1, 1,
0.3513533, 0.5582446, 2.049576, 0, 0.1607843, 1, 1,
0.3543395, -0.2009364, 2.089829, 0, 0.1529412, 1, 1,
0.3553194, -0.1730421, 1.001699, 0, 0.1490196, 1, 1,
0.3642088, -1.892274, 3.31306, 0, 0.1411765, 1, 1,
0.3650443, -0.5250724, 2.588581, 0, 0.1372549, 1, 1,
0.3656963, -1.466687, 2.712499, 0, 0.1294118, 1, 1,
0.3669692, -0.1666442, 1.279859, 0, 0.1254902, 1, 1,
0.3676871, -1.386391, 1.381154, 0, 0.1176471, 1, 1,
0.371649, 0.7547457, 2.765264, 0, 0.1137255, 1, 1,
0.377545, -0.315007, 1.967272, 0, 0.1058824, 1, 1,
0.377704, -0.2292468, 2.456725, 0, 0.09803922, 1, 1,
0.3785785, 0.1864808, 0.6596706, 0, 0.09411765, 1, 1,
0.3788789, 1.11132, -0.09943385, 0, 0.08627451, 1, 1,
0.3791714, -0.4808308, 4.7458, 0, 0.08235294, 1, 1,
0.3831335, -0.622412, 3.026871, 0, 0.07450981, 1, 1,
0.3891135, -2.035872, 2.471047, 0, 0.07058824, 1, 1,
0.3951979, -0.9704034, 1.834791, 0, 0.0627451, 1, 1,
0.3953912, 0.5375727, 0.108572, 0, 0.05882353, 1, 1,
0.3982638, 0.8614493, 0.8921933, 0, 0.05098039, 1, 1,
0.4025273, -0.1727307, 2.468019, 0, 0.04705882, 1, 1,
0.4060872, -0.2065495, 1.380167, 0, 0.03921569, 1, 1,
0.4061669, -0.4375328, 1.967621, 0, 0.03529412, 1, 1,
0.4074889, -0.09859401, 1.922448, 0, 0.02745098, 1, 1,
0.4111436, -0.7018219, 1.671864, 0, 0.02352941, 1, 1,
0.4124202, -0.01618682, 1.816765, 0, 0.01568628, 1, 1,
0.4124972, -0.5162567, 4.6074, 0, 0.01176471, 1, 1,
0.4141394, -0.3576136, 2.306293, 0, 0.003921569, 1, 1,
0.4180563, -1.055878, 2.654289, 0.003921569, 0, 1, 1,
0.4180973, -1.52024, 2.351132, 0.007843138, 0, 1, 1,
0.4191553, 0.101033, 1.542537, 0.01568628, 0, 1, 1,
0.4203826, -0.4841192, 1.577781, 0.01960784, 0, 1, 1,
0.4219597, 1.066512, -0.2390558, 0.02745098, 0, 1, 1,
0.4231404, 0.2815061, 1.992054, 0.03137255, 0, 1, 1,
0.4236128, 0.4047318, -0.02620502, 0.03921569, 0, 1, 1,
0.4239039, 0.809503, 0.4189339, 0.04313726, 0, 1, 1,
0.4271077, -0.8478429, 3.682104, 0.05098039, 0, 1, 1,
0.4280706, 0.7316978, 2.902725, 0.05490196, 0, 1, 1,
0.4310491, -1.139779, 0.3326052, 0.0627451, 0, 1, 1,
0.4350362, -0.7041841, 1.452027, 0.06666667, 0, 1, 1,
0.4352397, 1.503065, 0.5429307, 0.07450981, 0, 1, 1,
0.4378923, -0.154134, 2.088873, 0.07843138, 0, 1, 1,
0.4389866, -0.1972135, 0.7836252, 0.08627451, 0, 1, 1,
0.4424547, -1.566036, 2.530353, 0.09019608, 0, 1, 1,
0.4455771, -1.169908, 3.133283, 0.09803922, 0, 1, 1,
0.4471488, 0.3743587, 1.507431, 0.1058824, 0, 1, 1,
0.4503271, 2.122414, -0.07976019, 0.1098039, 0, 1, 1,
0.4527301, -0.3833011, 2.038961, 0.1176471, 0, 1, 1,
0.4575975, -1.253747, 3.891801, 0.1215686, 0, 1, 1,
0.4585194, -1.107516, 2.761786, 0.1294118, 0, 1, 1,
0.4678591, -1.353048, 3.927073, 0.1333333, 0, 1, 1,
0.4685033, -0.06218313, 1.541147, 0.1411765, 0, 1, 1,
0.4690199, -0.6365123, 2.551596, 0.145098, 0, 1, 1,
0.4704298, 1.032022, -0.6151143, 0.1529412, 0, 1, 1,
0.4720025, 0.06547002, 1.668577, 0.1568628, 0, 1, 1,
0.4823927, -0.4680022, 2.74825, 0.1647059, 0, 1, 1,
0.4843968, -0.2960325, 2.357126, 0.1686275, 0, 1, 1,
0.4863297, -0.2722304, 1.064204, 0.1764706, 0, 1, 1,
0.487583, -1.597098, 2.385001, 0.1803922, 0, 1, 1,
0.4941581, -0.7053658, 1.415611, 0.1882353, 0, 1, 1,
0.4960807, 0.8648022, 1.000524, 0.1921569, 0, 1, 1,
0.4981384, 0.09006491, 1.300345, 0.2, 0, 1, 1,
0.4986557, 0.636532, 0.7545061, 0.2078431, 0, 1, 1,
0.5022296, 0.6101639, 1.902289, 0.2117647, 0, 1, 1,
0.5031301, 0.5756844, -0.2641716, 0.2196078, 0, 1, 1,
0.5123061, 1.546513, 1.899041, 0.2235294, 0, 1, 1,
0.5143133, -0.9384583, 3.552234, 0.2313726, 0, 1, 1,
0.5194732, -1.136548, 2.359941, 0.2352941, 0, 1, 1,
0.5203267, -1.891821, 4.809412, 0.2431373, 0, 1, 1,
0.5250462, -1.056734, 2.805888, 0.2470588, 0, 1, 1,
0.5267921, 1.309488, 0.2038338, 0.254902, 0, 1, 1,
0.5271214, 1.714342, 0.004858899, 0.2588235, 0, 1, 1,
0.5275658, -2.083589, 3.950087, 0.2666667, 0, 1, 1,
0.5401288, -2.56742, 2.32546, 0.2705882, 0, 1, 1,
0.5407687, -0.7678045, 1.283451, 0.2784314, 0, 1, 1,
0.5413205, -0.5357097, 1.764352, 0.282353, 0, 1, 1,
0.5438849, 0.3302865, 1.510619, 0.2901961, 0, 1, 1,
0.5472683, -1.55062, 0.8111917, 0.2941177, 0, 1, 1,
0.5508851, -1.106439, 2.463518, 0.3019608, 0, 1, 1,
0.551091, 0.4765416, 1.832335, 0.3098039, 0, 1, 1,
0.5563638, 0.1378037, 1.464883, 0.3137255, 0, 1, 1,
0.5612437, -0.3134136, 1.244289, 0.3215686, 0, 1, 1,
0.5714834, -0.4955954, 2.201688, 0.3254902, 0, 1, 1,
0.5771614, -0.3117995, 2.439826, 0.3333333, 0, 1, 1,
0.5813008, -0.3671718, 2.330713, 0.3372549, 0, 1, 1,
0.5841124, 0.0156704, 1.068981, 0.345098, 0, 1, 1,
0.5873206, 1.178049, -0.8585952, 0.3490196, 0, 1, 1,
0.5900044, 0.2556697, 1.055565, 0.3568628, 0, 1, 1,
0.5939501, -0.3807515, 1.602453, 0.3607843, 0, 1, 1,
0.6058081, -1.125361, 3.829462, 0.3686275, 0, 1, 1,
0.60679, -1.656041, 1.618346, 0.372549, 0, 1, 1,
0.607443, 0.523586, 0.99511, 0.3803922, 0, 1, 1,
0.6099747, 1.93191, -0.2114221, 0.3843137, 0, 1, 1,
0.6122346, 1.212063, 0.5574373, 0.3921569, 0, 1, 1,
0.623836, -0.2150506, 1.347591, 0.3960784, 0, 1, 1,
0.6250514, -0.6586426, 2.579521, 0.4039216, 0, 1, 1,
0.6310955, -0.4517253, 2.775965, 0.4117647, 0, 1, 1,
0.6343567, 0.3359295, -0.5387481, 0.4156863, 0, 1, 1,
0.6344801, 0.1594996, 1.578273, 0.4235294, 0, 1, 1,
0.6352173, 0.48916, 1.169593, 0.427451, 0, 1, 1,
0.6372696, -0.3580884, 3.623666, 0.4352941, 0, 1, 1,
0.638001, -1.274483, 3.579729, 0.4392157, 0, 1, 1,
0.6454996, 1.795218, 2.217999, 0.4470588, 0, 1, 1,
0.6516787, -1.37588, 3.632852, 0.4509804, 0, 1, 1,
0.6533439, -2.420254, 3.555236, 0.4588235, 0, 1, 1,
0.6534497, -0.4321479, 2.702772, 0.4627451, 0, 1, 1,
0.6607372, -1.763978, 2.637738, 0.4705882, 0, 1, 1,
0.6650149, 0.8032618, 2.016956, 0.4745098, 0, 1, 1,
0.6660526, 0.608128, 0.8320983, 0.4823529, 0, 1, 1,
0.6687586, 1.061134, -1.308141, 0.4862745, 0, 1, 1,
0.6715295, 0.2802266, -0.2956728, 0.4941176, 0, 1, 1,
0.6715498, -0.2480358, 2.391796, 0.5019608, 0, 1, 1,
0.6860838, -0.5123783, 3.090154, 0.5058824, 0, 1, 1,
0.6867107, 0.273265, 0.02262738, 0.5137255, 0, 1, 1,
0.6867253, -1.039866, 3.604794, 0.5176471, 0, 1, 1,
0.6921496, 0.9899894, 0.6968084, 0.5254902, 0, 1, 1,
0.6926229, 2.683549, 1.215614, 0.5294118, 0, 1, 1,
0.6948184, 1.336873, -0.02801621, 0.5372549, 0, 1, 1,
0.6972092, -0.1882174, 2.525178, 0.5411765, 0, 1, 1,
0.7062002, -0.2856544, 2.048815, 0.5490196, 0, 1, 1,
0.7165964, -0.3920383, 2.568607, 0.5529412, 0, 1, 1,
0.7168695, -0.04701478, 0.3922819, 0.5607843, 0, 1, 1,
0.7181076, -0.8962874, 3.379057, 0.5647059, 0, 1, 1,
0.7282631, -0.803829, 3.510915, 0.572549, 0, 1, 1,
0.7291291, -0.9360807, 2.22819, 0.5764706, 0, 1, 1,
0.7293034, 1.45078, 0.8720329, 0.5843138, 0, 1, 1,
0.7356955, -0.2076584, 0.3506446, 0.5882353, 0, 1, 1,
0.7395251, 0.1887197, 3.792658, 0.5960785, 0, 1, 1,
0.741065, -1.4879, 3.632492, 0.6039216, 0, 1, 1,
0.7447041, 1.187228, -2.015014, 0.6078432, 0, 1, 1,
0.7459997, -0.6998817, 1.737641, 0.6156863, 0, 1, 1,
0.748058, -0.3756868, 1.827016, 0.6196079, 0, 1, 1,
0.7636088, 0.755704, 0.01435715, 0.627451, 0, 1, 1,
0.7675291, -0.0307531, 1.780456, 0.6313726, 0, 1, 1,
0.768016, 0.4553682, 2.406028, 0.6392157, 0, 1, 1,
0.7681521, 0.0117593, 1.355332, 0.6431373, 0, 1, 1,
0.7706448, -0.7344164, 2.386933, 0.6509804, 0, 1, 1,
0.7706502, 1.387401, -0.3636614, 0.654902, 0, 1, 1,
0.7768096, 1.072994, 1.077383, 0.6627451, 0, 1, 1,
0.7780589, 1.266944, -0.1623466, 0.6666667, 0, 1, 1,
0.7863046, -1.256485, 2.993304, 0.6745098, 0, 1, 1,
0.7900106, -0.2374279, 3.138698, 0.6784314, 0, 1, 1,
0.7900455, 1.048154, 1.200434, 0.6862745, 0, 1, 1,
0.7944748, -1.027813, 1.550453, 0.6901961, 0, 1, 1,
0.7993609, 0.8960497, 2.23652, 0.6980392, 0, 1, 1,
0.8014714, 0.304181, 0.5904196, 0.7058824, 0, 1, 1,
0.808028, -0.5588852, 3.910585, 0.7098039, 0, 1, 1,
0.808567, -0.7904382, 2.304784, 0.7176471, 0, 1, 1,
0.8101377, 0.6583483, 0.6102467, 0.7215686, 0, 1, 1,
0.8151071, 0.1877772, 1.503516, 0.7294118, 0, 1, 1,
0.8156495, -2.990923, 4.074553, 0.7333333, 0, 1, 1,
0.8160424, 0.1876961, 1.675831, 0.7411765, 0, 1, 1,
0.8187376, 0.2131999, 1.357281, 0.7450981, 0, 1, 1,
0.8211092, -0.7011474, 1.504291, 0.7529412, 0, 1, 1,
0.8257527, 1.220761, 0.2567862, 0.7568628, 0, 1, 1,
0.8283391, 0.7173157, 0.1131001, 0.7647059, 0, 1, 1,
0.8287656, -1.34725, 3.217489, 0.7686275, 0, 1, 1,
0.8307971, -0.7453479, 0.8537869, 0.7764706, 0, 1, 1,
0.8413351, 1.486375, 1.953235, 0.7803922, 0, 1, 1,
0.8425572, -0.4955291, 2.752137, 0.7882353, 0, 1, 1,
0.8487358, 1.799292, -0.3429444, 0.7921569, 0, 1, 1,
0.8493859, 2.730911, 2.064871, 0.8, 0, 1, 1,
0.8554559, 1.194493, 1.893545, 0.8078431, 0, 1, 1,
0.8555031, 0.6703939, 0.4767965, 0.8117647, 0, 1, 1,
0.8629779, 1.302752, -0.6133189, 0.8196079, 0, 1, 1,
0.8639153, 0.09511948, 0.7207565, 0.8235294, 0, 1, 1,
0.8726206, -0.1218939, 0.3694736, 0.8313726, 0, 1, 1,
0.872995, -0.5999308, 4.041328, 0.8352941, 0, 1, 1,
0.8845796, 1.654093, -0.5217395, 0.8431373, 0, 1, 1,
0.8909457, 1.132491, -1.535927, 0.8470588, 0, 1, 1,
0.8960828, 0.2715509, 2.151263, 0.854902, 0, 1, 1,
0.8981171, -0.001176935, 1.674371, 0.8588235, 0, 1, 1,
0.9025546, 0.3474336, 1.426221, 0.8666667, 0, 1, 1,
0.9088495, 0.4066457, 0.786768, 0.8705882, 0, 1, 1,
0.9197499, 0.1872784, 1.590145, 0.8784314, 0, 1, 1,
0.9221673, 0.748924, 0.6642017, 0.8823529, 0, 1, 1,
0.9239336, -0.6123621, 0.9769143, 0.8901961, 0, 1, 1,
0.9293981, 0.8818421, -0.02002635, 0.8941177, 0, 1, 1,
0.9298517, 0.3879955, 1.810207, 0.9019608, 0, 1, 1,
0.9381822, 0.03950045, 1.790197, 0.9098039, 0, 1, 1,
0.9384545, 0.8131926, 1.260155, 0.9137255, 0, 1, 1,
0.9387844, 2.569519, 0.6749687, 0.9215686, 0, 1, 1,
0.945935, 0.5428746, 2.379097, 0.9254902, 0, 1, 1,
0.9557157, -1.828744, 1.334338, 0.9333333, 0, 1, 1,
0.9627246, 0.7056156, 1.252424, 0.9372549, 0, 1, 1,
0.963468, -1.401006, 3.441786, 0.945098, 0, 1, 1,
0.9643546, 0.3534912, 1.665931, 0.9490196, 0, 1, 1,
0.966738, -0.05092967, 2.354834, 0.9568627, 0, 1, 1,
0.973095, 1.052242, 1.016774, 0.9607843, 0, 1, 1,
0.9736806, 0.1918789, -0.2769105, 0.9686275, 0, 1, 1,
0.9751858, -1.453467, 3.725245, 0.972549, 0, 1, 1,
0.9816927, 1.273242, -0.5218622, 0.9803922, 0, 1, 1,
0.9840369, -0.9230265, 0.6289583, 0.9843137, 0, 1, 1,
0.9856182, -0.3528755, 3.611837, 0.9921569, 0, 1, 1,
0.9858579, -1.976231, 3.806196, 0.9960784, 0, 1, 1,
0.994445, 0.2954234, 1.614235, 1, 0, 0.9960784, 1,
0.9978312, -1.311965, 2.415191, 1, 0, 0.9882353, 1,
1.004552, -1.090107, 1.284571, 1, 0, 0.9843137, 1,
1.01008, 0.554974, 2.357272, 1, 0, 0.9764706, 1,
1.015819, 0.8682491, 0.2344491, 1, 0, 0.972549, 1,
1.016278, -0.733664, 3.613338, 1, 0, 0.9647059, 1,
1.01666, -1.090506, 0.9578489, 1, 0, 0.9607843, 1,
1.020584, -1.112292, 0.8821127, 1, 0, 0.9529412, 1,
1.03267, -0.107465, 1.458919, 1, 0, 0.9490196, 1,
1.040923, -0.233811, 1.328983, 1, 0, 0.9411765, 1,
1.044899, 0.6802997, -0.702911, 1, 0, 0.9372549, 1,
1.045876, -0.9502578, 1.443505, 1, 0, 0.9294118, 1,
1.046072, 0.1176367, 2.324302, 1, 0, 0.9254902, 1,
1.049113, -0.7473459, 2.962463, 1, 0, 0.9176471, 1,
1.051187, 1.060151, 0.1118636, 1, 0, 0.9137255, 1,
1.052149, -0.1693529, 0.8763669, 1, 0, 0.9058824, 1,
1.052535, 0.6300694, 2.409779, 1, 0, 0.9019608, 1,
1.05603, 1.386003, 2.118684, 1, 0, 0.8941177, 1,
1.065115, 1.477057, 1.214203, 1, 0, 0.8862745, 1,
1.066156, 0.919077, -1.0573, 1, 0, 0.8823529, 1,
1.069328, 1.678764, -0.9322273, 1, 0, 0.8745098, 1,
1.075248, 0.7341647, 0.6569871, 1, 0, 0.8705882, 1,
1.076155, -1.730428, 2.077105, 1, 0, 0.8627451, 1,
1.077851, 0.05170137, 1.96137, 1, 0, 0.8588235, 1,
1.097024, 0.5796731, 0.4181076, 1, 0, 0.8509804, 1,
1.098234, -0.6561246, 1.88325, 1, 0, 0.8470588, 1,
1.107569, -0.06192135, 0.3845122, 1, 0, 0.8392157, 1,
1.120196, 0.09566218, 1.546055, 1, 0, 0.8352941, 1,
1.128132, 1.475008, 2.120497, 1, 0, 0.827451, 1,
1.132553, -1.612052, 2.739531, 1, 0, 0.8235294, 1,
1.133015, -2.03529, 2.180129, 1, 0, 0.8156863, 1,
1.13626, 0.7564189, 0.7123078, 1, 0, 0.8117647, 1,
1.137446, 0.2125476, 0.7600144, 1, 0, 0.8039216, 1,
1.14659, -0.9388226, 1.59007, 1, 0, 0.7960784, 1,
1.159358, 2.025175, 0.8586909, 1, 0, 0.7921569, 1,
1.159684, -0.007085366, 0.7486479, 1, 0, 0.7843137, 1,
1.160685, 0.03355452, 0.9438562, 1, 0, 0.7803922, 1,
1.165753, 0.1375392, -0.2344178, 1, 0, 0.772549, 1,
1.168492, -0.5549059, 1.676826, 1, 0, 0.7686275, 1,
1.173274, -1.701769, 4.323031, 1, 0, 0.7607843, 1,
1.174375, -1.359908, 3.364267, 1, 0, 0.7568628, 1,
1.17441, -0.4284345, 0.793305, 1, 0, 0.7490196, 1,
1.175724, 0.1126975, 1.759828, 1, 0, 0.7450981, 1,
1.177229, -0.1573336, 1.213174, 1, 0, 0.7372549, 1,
1.187734, -1.013755, 2.496189, 1, 0, 0.7333333, 1,
1.191494, -0.3045718, 3.277084, 1, 0, 0.7254902, 1,
1.196325, -0.2834572, 2.64021, 1, 0, 0.7215686, 1,
1.197403, -1.491862, 2.187022, 1, 0, 0.7137255, 1,
1.199086, 0.9154556, -0.2404815, 1, 0, 0.7098039, 1,
1.203604, -1.338665, 0.5822317, 1, 0, 0.7019608, 1,
1.2143, 1.358628, -0.6492485, 1, 0, 0.6941177, 1,
1.226464, 0.3226244, 1.788577, 1, 0, 0.6901961, 1,
1.227371, 0.5214614, 0.2484197, 1, 0, 0.682353, 1,
1.2332, -0.1075849, 0.8509195, 1, 0, 0.6784314, 1,
1.236212, 0.07816576, 0.9730331, 1, 0, 0.6705883, 1,
1.237184, -0.1766138, 3.322665, 1, 0, 0.6666667, 1,
1.23768, -0.02921049, 2.078792, 1, 0, 0.6588235, 1,
1.258742, 1.208948, 0.01894712, 1, 0, 0.654902, 1,
1.260345, -2.343935, 1.532242, 1, 0, 0.6470588, 1,
1.263546, -1.274935, 3.536253, 1, 0, 0.6431373, 1,
1.264466, -0.7545006, 1.41755, 1, 0, 0.6352941, 1,
1.272909, 1.19821, 1.297663, 1, 0, 0.6313726, 1,
1.274234, 0.08655123, 2.081131, 1, 0, 0.6235294, 1,
1.275172, -0.038354, 2.020424, 1, 0, 0.6196079, 1,
1.279494, -0.06338806, 2.602011, 1, 0, 0.6117647, 1,
1.291893, -0.6309658, 2.716481, 1, 0, 0.6078432, 1,
1.307648, -0.7844089, 3.095513, 1, 0, 0.6, 1,
1.319879, 0.2316729, 0.8868661, 1, 0, 0.5921569, 1,
1.356711, 1.154931, 0.7274386, 1, 0, 0.5882353, 1,
1.363072, 1.858895, 0.6336591, 1, 0, 0.5803922, 1,
1.372167, -0.002935249, 0.4362434, 1, 0, 0.5764706, 1,
1.374085, -0.06706695, 3.983782, 1, 0, 0.5686275, 1,
1.376706, 0.6389087, 1.050093, 1, 0, 0.5647059, 1,
1.400504, 0.4151813, 2.30582, 1, 0, 0.5568628, 1,
1.407997, 0.5957408, 0.181701, 1, 0, 0.5529412, 1,
1.40988, -0.210344, 0.7492392, 1, 0, 0.5450981, 1,
1.417046, 1.159205, -0.2178032, 1, 0, 0.5411765, 1,
1.422314, 1.765694, 1.660167, 1, 0, 0.5333334, 1,
1.427552, -0.001229596, 2.25802, 1, 0, 0.5294118, 1,
1.429987, -0.4623998, 2.260662, 1, 0, 0.5215687, 1,
1.43283, 0.6724184, 1.476758, 1, 0, 0.5176471, 1,
1.433707, -1.247904, 4.24097, 1, 0, 0.509804, 1,
1.444441, -1.547277, 2.353499, 1, 0, 0.5058824, 1,
1.447206, -0.3684515, 0.2446389, 1, 0, 0.4980392, 1,
1.451602, 1.271977, 1.165813, 1, 0, 0.4901961, 1,
1.452466, -0.549786, 0.6430946, 1, 0, 0.4862745, 1,
1.45592, -1.125878, 3.139532, 1, 0, 0.4784314, 1,
1.459759, -0.06869636, 0.6556649, 1, 0, 0.4745098, 1,
1.472147, 0.7180272, 2.227591, 1, 0, 0.4666667, 1,
1.474744, 0.6711487, -0.2727743, 1, 0, 0.4627451, 1,
1.482336, 0.4290393, 0.8443006, 1, 0, 0.454902, 1,
1.49038, 0.4588571, 1.671193, 1, 0, 0.4509804, 1,
1.493149, 0.8106709, 2.845885, 1, 0, 0.4431373, 1,
1.497251, -0.9582126, 2.058304, 1, 0, 0.4392157, 1,
1.497542, 0.8624629, 0.5380868, 1, 0, 0.4313726, 1,
1.503216, -1.320242, 1.966324, 1, 0, 0.427451, 1,
1.50909, 0.3199461, 2.129822, 1, 0, 0.4196078, 1,
1.517811, -0.2177072, -0.1078823, 1, 0, 0.4156863, 1,
1.51967, 1.391514, -0.09607349, 1, 0, 0.4078431, 1,
1.5206, -1.83065, 1.935133, 1, 0, 0.4039216, 1,
1.524209, 0.189512, 2.089897, 1, 0, 0.3960784, 1,
1.533578, 0.2561734, 2.32309, 1, 0, 0.3882353, 1,
1.571463, 0.4007617, 1.779202, 1, 0, 0.3843137, 1,
1.585609, 0.3639793, 1.463053, 1, 0, 0.3764706, 1,
1.59595, 0.5480074, 0.4779454, 1, 0, 0.372549, 1,
1.598459, -0.4782317, 2.051577, 1, 0, 0.3647059, 1,
1.661288, -0.4140356, 3.606911, 1, 0, 0.3607843, 1,
1.675806, -0.8018843, 0.1060527, 1, 0, 0.3529412, 1,
1.679088, -0.8772293, 1.882835, 1, 0, 0.3490196, 1,
1.692813, 1.368664, 0.4762523, 1, 0, 0.3411765, 1,
1.694686, -0.2277287, 1.656345, 1, 0, 0.3372549, 1,
1.697304, -1.31065, 1.616434, 1, 0, 0.3294118, 1,
1.706176, -1.042316, 0.9835829, 1, 0, 0.3254902, 1,
1.711668, -0.7489201, 0.933003, 1, 0, 0.3176471, 1,
1.732285, 0.8691629, 1.709194, 1, 0, 0.3137255, 1,
1.734327, -0.577688, 1.896926, 1, 0, 0.3058824, 1,
1.735096, 0.3513447, -0.4701641, 1, 0, 0.2980392, 1,
1.739362, 1.38063, 0.8512037, 1, 0, 0.2941177, 1,
1.752444, 1.165838, 1.00748, 1, 0, 0.2862745, 1,
1.781035, -1.348968, 1.879176, 1, 0, 0.282353, 1,
1.784253, -0.9608388, 0.7783957, 1, 0, 0.2745098, 1,
1.79283, 0.1758095, 2.168045, 1, 0, 0.2705882, 1,
1.836841, 1.142992, 0.3809438, 1, 0, 0.2627451, 1,
1.839258, -0.06520927, 0.3955606, 1, 0, 0.2588235, 1,
1.845424, 0.04372778, 1.017351, 1, 0, 0.2509804, 1,
1.857677, -1.341607, 1.030019, 1, 0, 0.2470588, 1,
1.863152, 0.05140414, 1.177256, 1, 0, 0.2392157, 1,
1.869498, 0.7320155, 3.032395, 1, 0, 0.2352941, 1,
1.873519, -0.8419629, 2.843341, 1, 0, 0.227451, 1,
1.886215, 1.964816, -0.6007544, 1, 0, 0.2235294, 1,
1.89032, -0.2890215, 1.012156, 1, 0, 0.2156863, 1,
1.904632, 0.4500885, 0.3629971, 1, 0, 0.2117647, 1,
1.909833, -0.491121, 0.220311, 1, 0, 0.2039216, 1,
1.917352, 1.514921, 2.238535, 1, 0, 0.1960784, 1,
1.921224, -0.2489368, 0.5763251, 1, 0, 0.1921569, 1,
1.934558, -0.05625653, 2.509391, 1, 0, 0.1843137, 1,
1.939319, -0.7638887, 2.026087, 1, 0, 0.1803922, 1,
1.942719, -0.1969429, 1.417013, 1, 0, 0.172549, 1,
1.942776, -0.3937007, 0.8301008, 1, 0, 0.1686275, 1,
1.943215, 1.201539, -0.7966279, 1, 0, 0.1607843, 1,
1.947411, -2.08385, 4.054898, 1, 0, 0.1568628, 1,
1.987204, 0.1866096, 2.551105, 1, 0, 0.1490196, 1,
1.991106, 0.3711961, 0.5639849, 1, 0, 0.145098, 1,
2.007659, 1.324981, 2.102644, 1, 0, 0.1372549, 1,
2.023572, -1.350165, 3.10652, 1, 0, 0.1333333, 1,
2.058469, 0.8240341, 1.898039, 1, 0, 0.1254902, 1,
2.066666, -2.552335, 2.004599, 1, 0, 0.1215686, 1,
2.074572, -1.103369, 2.401671, 1, 0, 0.1137255, 1,
2.081948, -0.04597518, 1.968992, 1, 0, 0.1098039, 1,
2.087088, 0.5804483, 1.098431, 1, 0, 0.1019608, 1,
2.108228, 0.7314161, 1.977164, 1, 0, 0.09411765, 1,
2.110871, 1.227175, 1.642434, 1, 0, 0.09019608, 1,
2.125346, 0.8698586, 3.186766, 1, 0, 0.08235294, 1,
2.149916, -0.09010586, 1.181861, 1, 0, 0.07843138, 1,
2.150074, 0.05426523, 2.936947, 1, 0, 0.07058824, 1,
2.178147, -0.2903625, 2.683564, 1, 0, 0.06666667, 1,
2.236687, -0.007460952, 0.6252446, 1, 0, 0.05882353, 1,
2.26963, 0.11541, 1.179698, 1, 0, 0.05490196, 1,
2.480373, -0.1264463, 1.091368, 1, 0, 0.04705882, 1,
2.509638, 1.478714, 0.3150875, 1, 0, 0.04313726, 1,
2.528623, -1.075408, 1.667871, 1, 0, 0.03529412, 1,
2.531249, -0.9822345, 1.958369, 1, 0, 0.03137255, 1,
2.635483, -0.2099782, 0.7671245, 1, 0, 0.02352941, 1,
2.637099, -0.259882, 0.866173, 1, 0, 0.01960784, 1,
2.668463, 2.533016, -0.02452536, 1, 0, 0.01176471, 1,
2.918957, -0.6000549, 1.266689, 1, 0, 0.007843138, 1
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
-0.2356981, -3.981133, -7.26081, 0, -0.5, 0.5, 0.5,
-0.2356981, -3.981133, -7.26081, 1, -0.5, 0.5, 0.5,
-0.2356981, -3.981133, -7.26081, 1, 1.5, 0.5, 0.5,
-0.2356981, -3.981133, -7.26081, 0, 1.5, 0.5, 0.5
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
-4.459781, -0.0699501, -7.26081, 0, -0.5, 0.5, 0.5,
-4.459781, -0.0699501, -7.26081, 1, -0.5, 0.5, 0.5,
-4.459781, -0.0699501, -7.26081, 1, 1.5, 0.5, 0.5,
-4.459781, -0.0699501, -7.26081, 0, 1.5, 0.5, 0.5
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
-4.459781, -3.981133, -0.2638528, 0, -0.5, 0.5, 0.5,
-4.459781, -3.981133, -0.2638528, 1, -0.5, 0.5, 0.5,
-4.459781, -3.981133, -0.2638528, 1, 1.5, 0.5, 0.5,
-4.459781, -3.981133, -0.2638528, 0, 1.5, 0.5, 0.5
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
-3, -3.078552, -5.646128,
2, -3.078552, -5.646128,
-3, -3.078552, -5.646128,
-3, -3.228982, -5.915241,
-2, -3.078552, -5.646128,
-2, -3.228982, -5.915241,
-1, -3.078552, -5.646128,
-1, -3.228982, -5.915241,
0, -3.078552, -5.646128,
0, -3.228982, -5.915241,
1, -3.078552, -5.646128,
1, -3.228982, -5.915241,
2, -3.078552, -5.646128,
2, -3.228982, -5.915241
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
-3, -3.529842, -6.453469, 0, -0.5, 0.5, 0.5,
-3, -3.529842, -6.453469, 1, -0.5, 0.5, 0.5,
-3, -3.529842, -6.453469, 1, 1.5, 0.5, 0.5,
-3, -3.529842, -6.453469, 0, 1.5, 0.5, 0.5,
-2, -3.529842, -6.453469, 0, -0.5, 0.5, 0.5,
-2, -3.529842, -6.453469, 1, -0.5, 0.5, 0.5,
-2, -3.529842, -6.453469, 1, 1.5, 0.5, 0.5,
-2, -3.529842, -6.453469, 0, 1.5, 0.5, 0.5,
-1, -3.529842, -6.453469, 0, -0.5, 0.5, 0.5,
-1, -3.529842, -6.453469, 1, -0.5, 0.5, 0.5,
-1, -3.529842, -6.453469, 1, 1.5, 0.5, 0.5,
-1, -3.529842, -6.453469, 0, 1.5, 0.5, 0.5,
0, -3.529842, -6.453469, 0, -0.5, 0.5, 0.5,
0, -3.529842, -6.453469, 1, -0.5, 0.5, 0.5,
0, -3.529842, -6.453469, 1, 1.5, 0.5, 0.5,
0, -3.529842, -6.453469, 0, 1.5, 0.5, 0.5,
1, -3.529842, -6.453469, 0, -0.5, 0.5, 0.5,
1, -3.529842, -6.453469, 1, -0.5, 0.5, 0.5,
1, -3.529842, -6.453469, 1, 1.5, 0.5, 0.5,
1, -3.529842, -6.453469, 0, 1.5, 0.5, 0.5,
2, -3.529842, -6.453469, 0, -0.5, 0.5, 0.5,
2, -3.529842, -6.453469, 1, -0.5, 0.5, 0.5,
2, -3.529842, -6.453469, 1, 1.5, 0.5, 0.5,
2, -3.529842, -6.453469, 0, 1.5, 0.5, 0.5
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
-3.484993, -2, -5.646128,
-3.484993, 2, -5.646128,
-3.484993, -2, -5.646128,
-3.647458, -2, -5.915241,
-3.484993, -1, -5.646128,
-3.647458, -1, -5.915241,
-3.484993, 0, -5.646128,
-3.647458, 0, -5.915241,
-3.484993, 1, -5.646128,
-3.647458, 1, -5.915241,
-3.484993, 2, -5.646128,
-3.647458, 2, -5.915241
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
-3.972387, -2, -6.453469, 0, -0.5, 0.5, 0.5,
-3.972387, -2, -6.453469, 1, -0.5, 0.5, 0.5,
-3.972387, -2, -6.453469, 1, 1.5, 0.5, 0.5,
-3.972387, -2, -6.453469, 0, 1.5, 0.5, 0.5,
-3.972387, -1, -6.453469, 0, -0.5, 0.5, 0.5,
-3.972387, -1, -6.453469, 1, -0.5, 0.5, 0.5,
-3.972387, -1, -6.453469, 1, 1.5, 0.5, 0.5,
-3.972387, -1, -6.453469, 0, 1.5, 0.5, 0.5,
-3.972387, 0, -6.453469, 0, -0.5, 0.5, 0.5,
-3.972387, 0, -6.453469, 1, -0.5, 0.5, 0.5,
-3.972387, 0, -6.453469, 1, 1.5, 0.5, 0.5,
-3.972387, 0, -6.453469, 0, 1.5, 0.5, 0.5,
-3.972387, 1, -6.453469, 0, -0.5, 0.5, 0.5,
-3.972387, 1, -6.453469, 1, -0.5, 0.5, 0.5,
-3.972387, 1, -6.453469, 1, 1.5, 0.5, 0.5,
-3.972387, 1, -6.453469, 0, 1.5, 0.5, 0.5,
-3.972387, 2, -6.453469, 0, -0.5, 0.5, 0.5,
-3.972387, 2, -6.453469, 1, -0.5, 0.5, 0.5,
-3.972387, 2, -6.453469, 1, 1.5, 0.5, 0.5,
-3.972387, 2, -6.453469, 0, 1.5, 0.5, 0.5
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
-3.484993, -3.078552, -4,
-3.484993, -3.078552, 4,
-3.484993, -3.078552, -4,
-3.647458, -3.228982, -4,
-3.484993, -3.078552, -2,
-3.647458, -3.228982, -2,
-3.484993, -3.078552, 0,
-3.647458, -3.228982, 0,
-3.484993, -3.078552, 2,
-3.647458, -3.228982, 2,
-3.484993, -3.078552, 4,
-3.647458, -3.228982, 4
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
-3.972387, -3.529842, -4, 0, -0.5, 0.5, 0.5,
-3.972387, -3.529842, -4, 1, -0.5, 0.5, 0.5,
-3.972387, -3.529842, -4, 1, 1.5, 0.5, 0.5,
-3.972387, -3.529842, -4, 0, 1.5, 0.5, 0.5,
-3.972387, -3.529842, -2, 0, -0.5, 0.5, 0.5,
-3.972387, -3.529842, -2, 1, -0.5, 0.5, 0.5,
-3.972387, -3.529842, -2, 1, 1.5, 0.5, 0.5,
-3.972387, -3.529842, -2, 0, 1.5, 0.5, 0.5,
-3.972387, -3.529842, 0, 0, -0.5, 0.5, 0.5,
-3.972387, -3.529842, 0, 1, -0.5, 0.5, 0.5,
-3.972387, -3.529842, 0, 1, 1.5, 0.5, 0.5,
-3.972387, -3.529842, 0, 0, 1.5, 0.5, 0.5,
-3.972387, -3.529842, 2, 0, -0.5, 0.5, 0.5,
-3.972387, -3.529842, 2, 1, -0.5, 0.5, 0.5,
-3.972387, -3.529842, 2, 1, 1.5, 0.5, 0.5,
-3.972387, -3.529842, 2, 0, 1.5, 0.5, 0.5,
-3.972387, -3.529842, 4, 0, -0.5, 0.5, 0.5,
-3.972387, -3.529842, 4, 1, -0.5, 0.5, 0.5,
-3.972387, -3.529842, 4, 1, 1.5, 0.5, 0.5,
-3.972387, -3.529842, 4, 0, 1.5, 0.5, 0.5
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
-3.484993, -3.078552, -5.646128,
-3.484993, 2.938652, -5.646128,
-3.484993, -3.078552, 5.118422,
-3.484993, 2.938652, 5.118422,
-3.484993, -3.078552, -5.646128,
-3.484993, -3.078552, 5.118422,
-3.484993, 2.938652, -5.646128,
-3.484993, 2.938652, 5.118422,
-3.484993, -3.078552, -5.646128,
3.013597, -3.078552, -5.646128,
-3.484993, -3.078552, 5.118422,
3.013597, -3.078552, 5.118422,
-3.484993, 2.938652, -5.646128,
3.013597, 2.938652, -5.646128,
-3.484993, 2.938652, 5.118422,
3.013597, 2.938652, 5.118422,
3.013597, -3.078552, -5.646128,
3.013597, 2.938652, -5.646128,
3.013597, -3.078552, 5.118422,
3.013597, 2.938652, 5.118422,
3.013597, -3.078552, -5.646128,
3.013597, -3.078552, 5.118422,
3.013597, 2.938652, -5.646128,
3.013597, 2.938652, 5.118422
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
var radius = 7.443504;
var distance = 33.11699;
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
mvMatrix.translate( 0.2356981, 0.0699501, 0.2638528 );
mvMatrix.scale( 1.238432, 1.337509, 0.7476451 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.11699);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
ferbam<-read.table("ferbam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ferbam$V2
```

```
## Error in eval(expr, envir, enclos): object 'ferbam' not found
```

```r
y<-ferbam$V3
```

```
## Error in eval(expr, envir, enclos): object 'ferbam' not found
```

```r
z<-ferbam$V4
```

```
## Error in eval(expr, envir, enclos): object 'ferbam' not found
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
-3.390353, -1.384037, -4.973509, 0, 0, 1, 1, 1,
-3.275678, 0.3165705, -1.75771, 1, 0, 0, 1, 1,
-2.693237, 1.642609, -1.041561, 1, 0, 0, 1, 1,
-2.667404, 0.5313331, -0.6582505, 1, 0, 0, 1, 1,
-2.66648, -0.2389175, -1.082489, 1, 0, 0, 1, 1,
-2.662543, -0.9797492, -1.138911, 1, 0, 0, 1, 1,
-2.608424, -0.005246732, -3.732569, 0, 0, 0, 1, 1,
-2.575775, 0.006197893, -1.191286, 0, 0, 0, 1, 1,
-2.536169, -0.9901457, -2.481509, 0, 0, 0, 1, 1,
-2.456242, 0.9663792, -0.4438339, 0, 0, 0, 1, 1,
-2.381159, -0.6489233, -2.113464, 0, 0, 0, 1, 1,
-2.378166, -0.825223, -1.009197, 0, 0, 0, 1, 1,
-2.367679, -0.3422109, -2.833994, 0, 0, 0, 1, 1,
-2.343228, 0.7742636, -3.230687, 1, 1, 1, 1, 1,
-2.313548, 0.7025582, 0.2064261, 1, 1, 1, 1, 1,
-2.243842, -1.05087, -0.8016031, 1, 1, 1, 1, 1,
-2.210172, -2.647081, -4.672991, 1, 1, 1, 1, 1,
-2.182959, 0.5807548, -0.7132332, 1, 1, 1, 1, 1,
-2.17209, -0.5087626, -0.1959426, 1, 1, 1, 1, 1,
-2.145341, 0.7413574, -1.322105, 1, 1, 1, 1, 1,
-2.086819, -0.8038017, -0.4436919, 1, 1, 1, 1, 1,
-2.080575, -0.9285245, -0.2879001, 1, 1, 1, 1, 1,
-2.06748, -0.5911908, -0.4633459, 1, 1, 1, 1, 1,
-2.060138, -0.6009547, -2.410158, 1, 1, 1, 1, 1,
-2.040105, 0.7921718, -2.823261, 1, 1, 1, 1, 1,
-2.032959, 0.03363467, -1.003683, 1, 1, 1, 1, 1,
-2.024292, 0.5797648, -3.046933, 1, 1, 1, 1, 1,
-1.99413, -1.116447, -2.624503, 1, 1, 1, 1, 1,
-1.981774, -0.08207189, -3.525181, 0, 0, 1, 1, 1,
-1.972048, 0.750001, -1.282852, 1, 0, 0, 1, 1,
-1.970976, -0.953557, -3.410947, 1, 0, 0, 1, 1,
-1.945663, 1.18124, -0.639663, 1, 0, 0, 1, 1,
-1.925098, 0.8762842, -0.6586336, 1, 0, 0, 1, 1,
-1.887477, 0.3666472, 0.6165588, 1, 0, 0, 1, 1,
-1.886222, -0.8519072, -0.9978149, 0, 0, 0, 1, 1,
-1.860571, -0.6708493, -1.440779, 0, 0, 0, 1, 1,
-1.848926, -0.7447934, -2.6214, 0, 0, 0, 1, 1,
-1.844888, 1.290052, 0.141146, 0, 0, 0, 1, 1,
-1.838837, 0.9034912, -2.442257, 0, 0, 0, 1, 1,
-1.829671, -1.60557, -1.286853, 0, 0, 0, 1, 1,
-1.822704, 0.814468, -1.633618, 0, 0, 0, 1, 1,
-1.799639, 1.08835, -1.257204, 1, 1, 1, 1, 1,
-1.793455, -1.660028, -1.589239, 1, 1, 1, 1, 1,
-1.783491, 0.7144623, -0.119727, 1, 1, 1, 1, 1,
-1.774884, -0.3501033, -2.758322, 1, 1, 1, 1, 1,
-1.76412, -0.9770472, -1.651328, 1, 1, 1, 1, 1,
-1.76074, -0.5584269, -1.363222, 1, 1, 1, 1, 1,
-1.759526, 1.0778, -2.636118, 1, 1, 1, 1, 1,
-1.758805, -1.25946, -2.751568, 1, 1, 1, 1, 1,
-1.749887, 0.9679852, 1.616976, 1, 1, 1, 1, 1,
-1.736592, 0.6560892, -0.9539056, 1, 1, 1, 1, 1,
-1.716856, 1.666863, 0.2070457, 1, 1, 1, 1, 1,
-1.676614, -0.3736714, -2.660846, 1, 1, 1, 1, 1,
-1.667927, -0.01296618, -1.330315, 1, 1, 1, 1, 1,
-1.667577, 2.076409, -2.008862, 1, 1, 1, 1, 1,
-1.666232, 0.3784662, -1.578529, 1, 1, 1, 1, 1,
-1.649925, 0.02653098, -0.1921796, 0, 0, 1, 1, 1,
-1.648145, -0.9113065, -0.6095401, 1, 0, 0, 1, 1,
-1.642586, -1.33042, -2.84849, 1, 0, 0, 1, 1,
-1.630274, 0.2525886, -1.86617, 1, 0, 0, 1, 1,
-1.628138, -0.87576, -3.750451, 1, 0, 0, 1, 1,
-1.618971, 0.09087788, -1.9878, 1, 0, 0, 1, 1,
-1.604016, 0.3105531, -2.532866, 0, 0, 0, 1, 1,
-1.603689, 1.338, -0.8923326, 0, 0, 0, 1, 1,
-1.59362, 0.6951191, -0.7986077, 0, 0, 0, 1, 1,
-1.557813, 0.9265425, -0.3190328, 0, 0, 0, 1, 1,
-1.555123, -1.719513, -2.200912, 0, 0, 0, 1, 1,
-1.529331, -0.02841578, -0.1017236, 0, 0, 0, 1, 1,
-1.52895, 0.8758558, -1.533764, 0, 0, 0, 1, 1,
-1.528169, 0.5372682, 0.1898392, 1, 1, 1, 1, 1,
-1.512105, 0.03096139, -1.657083, 1, 1, 1, 1, 1,
-1.50762, 0.07468743, -2.502058, 1, 1, 1, 1, 1,
-1.499141, -0.1248539, -2.152593, 1, 1, 1, 1, 1,
-1.489643, 1.521947, -1.239373, 1, 1, 1, 1, 1,
-1.485349, 0.9087453, 0.2175926, 1, 1, 1, 1, 1,
-1.47878, 0.3855245, -0.2218419, 1, 1, 1, 1, 1,
-1.477018, 1.180825, -0.6196865, 1, 1, 1, 1, 1,
-1.471928, -1.475153, -2.365965, 1, 1, 1, 1, 1,
-1.45239, 0.6079603, -1.241165, 1, 1, 1, 1, 1,
-1.446991, -0.838771, -2.433101, 1, 1, 1, 1, 1,
-1.431177, 1.550074, -1.55748, 1, 1, 1, 1, 1,
-1.416629, -0.7683266, -1.400543, 1, 1, 1, 1, 1,
-1.410137, 0.630282, -2.610925, 1, 1, 1, 1, 1,
-1.409724, -0.8813736, -0.5330719, 1, 1, 1, 1, 1,
-1.407564, -1.606217, -1.91902, 0, 0, 1, 1, 1,
-1.406339, 0.02179791, 0.204064, 1, 0, 0, 1, 1,
-1.399536, -2.2828, -2.013094, 1, 0, 0, 1, 1,
-1.397358, 2.070689, -0.09573636, 1, 0, 0, 1, 1,
-1.392595, -0.8977818, -1.465863, 1, 0, 0, 1, 1,
-1.389701, 1.298224, -0.5291906, 1, 0, 0, 1, 1,
-1.383081, 0.9211749, -1.530981, 0, 0, 0, 1, 1,
-1.37685, 0.3499446, -2.640435, 0, 0, 0, 1, 1,
-1.36256, -0.08758224, -0.5322824, 0, 0, 0, 1, 1,
-1.353275, -0.684162, -1.215134, 0, 0, 0, 1, 1,
-1.343582, 2.135456, -0.5030524, 0, 0, 0, 1, 1,
-1.337903, -0.289979, -4.005286, 0, 0, 0, 1, 1,
-1.332423, -0.4599319, -3.199359, 0, 0, 0, 1, 1,
-1.329682, 0.5300442, -1.998043, 1, 1, 1, 1, 1,
-1.324668, 0.05645137, -0.9251517, 1, 1, 1, 1, 1,
-1.317298, 0.6982298, -0.4318714, 1, 1, 1, 1, 1,
-1.308843, -0.2051139, -3.035525, 1, 1, 1, 1, 1,
-1.299853, -0.0004828286, -0.5730392, 1, 1, 1, 1, 1,
-1.296024, -1.322858, -1.949961, 1, 1, 1, 1, 1,
-1.29214, -0.4618336, -2.234091, 1, 1, 1, 1, 1,
-1.28432, -0.254525, -2.107952, 1, 1, 1, 1, 1,
-1.281249, 0.8088255, -1.37737, 1, 1, 1, 1, 1,
-1.276073, -0.08523302, -0.4012301, 1, 1, 1, 1, 1,
-1.276033, -0.8288552, -1.561921, 1, 1, 1, 1, 1,
-1.275053, -0.5078198, -3.007249, 1, 1, 1, 1, 1,
-1.268117, 0.2908996, -1.159528, 1, 1, 1, 1, 1,
-1.266425, 1.130701, 0.6742795, 1, 1, 1, 1, 1,
-1.262333, 1.379999, -0.4319308, 1, 1, 1, 1, 1,
-1.256605, 1.276485, -0.5365869, 0, 0, 1, 1, 1,
-1.256433, 1.139511, -0.2789093, 1, 0, 0, 1, 1,
-1.255255, 0.6971663, -1.363203, 1, 0, 0, 1, 1,
-1.233042, 0.2189014, -0.6836374, 1, 0, 0, 1, 1,
-1.231759, 0.06772412, -1.515248, 1, 0, 0, 1, 1,
-1.220139, 0.6500133, -2.813446, 1, 0, 0, 1, 1,
-1.218552, -0.1187017, -2.3522, 0, 0, 0, 1, 1,
-1.21055, 0.02264348, -1.545442, 0, 0, 0, 1, 1,
-1.204323, -1.29374, -2.411137, 0, 0, 0, 1, 1,
-1.200034, -0.2161392, -1.933128, 0, 0, 0, 1, 1,
-1.197243, 0.1472068, -0.09142067, 0, 0, 0, 1, 1,
-1.185958, 1.645065, -0.4943264, 0, 0, 0, 1, 1,
-1.182795, -1.087257, -4.64745, 0, 0, 0, 1, 1,
-1.180473, 2.038889, 0.313954, 1, 1, 1, 1, 1,
-1.172378, -0.2260544, -1.319018, 1, 1, 1, 1, 1,
-1.165031, -1.153898, -1.340862, 1, 1, 1, 1, 1,
-1.161566, -0.4318032, -2.708692, 1, 1, 1, 1, 1,
-1.159021, 0.6855596, 0.6501294, 1, 1, 1, 1, 1,
-1.150244, 0.2548376, -0.7362368, 1, 1, 1, 1, 1,
-1.143273, -0.03665876, -2.54544, 1, 1, 1, 1, 1,
-1.134857, 0.9748662, -1.048847, 1, 1, 1, 1, 1,
-1.133093, -1.011785, -3.010858, 1, 1, 1, 1, 1,
-1.132698, -1.141266, -0.7944477, 1, 1, 1, 1, 1,
-1.131743, 0.05002334, -0.9835117, 1, 1, 1, 1, 1,
-1.125374, 0.4280397, -1.182023, 1, 1, 1, 1, 1,
-1.124682, -0.4640863, -1.442295, 1, 1, 1, 1, 1,
-1.122749, 1.111762, -0.4190762, 1, 1, 1, 1, 1,
-1.11102, 2.009722, 0.01375107, 1, 1, 1, 1, 1,
-1.110109, 0.04215514, -3.069439, 0, 0, 1, 1, 1,
-1.081857, -0.1896216, -3.136898, 1, 0, 0, 1, 1,
-1.062923, -0.9013833, -1.676618, 1, 0, 0, 1, 1,
-1.061419, -0.5223736, -3.226262, 1, 0, 0, 1, 1,
-1.055562, -0.1081945, -2.009973, 1, 0, 0, 1, 1,
-1.048279, -1.743839, -3.008818, 1, 0, 0, 1, 1,
-1.046869, -0.5748748, -1.848133, 0, 0, 0, 1, 1,
-1.043602, 0.2854836, -1.109503, 0, 0, 0, 1, 1,
-1.043319, -0.4762996, -1.115158, 0, 0, 0, 1, 1,
-1.040031, 1.287332, -0.9893398, 0, 0, 0, 1, 1,
-1.036008, -0.9469297, -2.298334, 0, 0, 0, 1, 1,
-1.035455, -1.82477, -3.228076, 0, 0, 0, 1, 1,
-1.033932, 0.09905779, -1.983652, 0, 0, 0, 1, 1,
-1.031319, 1.950837, -0.1174757, 1, 1, 1, 1, 1,
-1.029043, -0.3316422, -1.577697, 1, 1, 1, 1, 1,
-1.017495, 0.4255298, -1.452834, 1, 1, 1, 1, 1,
-1.008473, 1.135757, -0.355529, 1, 1, 1, 1, 1,
-1.004074, -0.3825465, -3.346437, 1, 1, 1, 1, 1,
-0.9983417, 0.553196, -1.624311, 1, 1, 1, 1, 1,
-0.9961185, -1.266609, -3.246374, 1, 1, 1, 1, 1,
-0.9950219, 2.163074, -0.2810709, 1, 1, 1, 1, 1,
-0.9948493, -2.376988, -3.530981, 1, 1, 1, 1, 1,
-0.9812672, -0.2740794, -0.9079983, 1, 1, 1, 1, 1,
-0.9737936, -1.500773, -2.827527, 1, 1, 1, 1, 1,
-0.9724693, 1.342276, -1.589104, 1, 1, 1, 1, 1,
-0.9640514, 0.818012, -1.235526, 1, 1, 1, 1, 1,
-0.9617763, 0.4565893, -2.587705, 1, 1, 1, 1, 1,
-0.9600162, 1.330236, -1.412748, 1, 1, 1, 1, 1,
-0.9495862, -0.6610057, -0.5119634, 0, 0, 1, 1, 1,
-0.9485218, 0.2721632, -0.8325581, 1, 0, 0, 1, 1,
-0.9344329, -0.9610521, -2.341387, 1, 0, 0, 1, 1,
-0.9326498, -0.08637966, -2.271474, 1, 0, 0, 1, 1,
-0.9305439, -0.2574507, -2.436887, 1, 0, 0, 1, 1,
-0.9260619, -0.6371328, -2.120157, 1, 0, 0, 1, 1,
-0.9248592, 0.1868498, -1.322833, 0, 0, 0, 1, 1,
-0.9237192, 0.4393899, 0.7546611, 0, 0, 0, 1, 1,
-0.9219244, 0.9352502, 0.3005557, 0, 0, 0, 1, 1,
-0.9129438, -2.093024, -2.936062, 0, 0, 0, 1, 1,
-0.9092871, -1.706308, -2.170932, 0, 0, 0, 1, 1,
-0.8983477, 1.131394, 0.147134, 0, 0, 0, 1, 1,
-0.882375, 0.7585934, -1.351359, 0, 0, 0, 1, 1,
-0.8797768, 1.292934, 0.06452338, 1, 1, 1, 1, 1,
-0.8795294, 2.15138, -0.9692089, 1, 1, 1, 1, 1,
-0.8767514, 1.371449, -2.019907, 1, 1, 1, 1, 1,
-0.8646677, 1.356529, -0.7017206, 1, 1, 1, 1, 1,
-0.862083, -0.8539795, -2.694599, 1, 1, 1, 1, 1,
-0.8612781, -0.149911, 0.2553771, 1, 1, 1, 1, 1,
-0.8545775, -0.7662596, -1.250503, 1, 1, 1, 1, 1,
-0.8360612, 0.5697803, -1.071372, 1, 1, 1, 1, 1,
-0.8343786, -0.8341031, -4.742114, 1, 1, 1, 1, 1,
-0.8298809, -1.104955, -0.3600608, 1, 1, 1, 1, 1,
-0.8284747, -1.850887, -2.953762, 1, 1, 1, 1, 1,
-0.8273352, 0.7157236, -0.1742861, 1, 1, 1, 1, 1,
-0.8232626, 0.750972, 1.138316, 1, 1, 1, 1, 1,
-0.8194743, 0.06061808, -1.245149, 1, 1, 1, 1, 1,
-0.8144079, -0.37479, -2.18418, 1, 1, 1, 1, 1,
-0.8028095, 0.07393534, -1.078995, 0, 0, 1, 1, 1,
-0.7928221, 0.8763864, -0.143338, 1, 0, 0, 1, 1,
-0.7819375, 1.810083, 0.5911022, 1, 0, 0, 1, 1,
-0.7793334, 0.7692496, -1.523303, 1, 0, 0, 1, 1,
-0.7736926, 0.3798562, -1.537501, 1, 0, 0, 1, 1,
-0.7707548, 1.776062, -1.067012, 1, 0, 0, 1, 1,
-0.7682706, 0.5702128, -1.096374, 0, 0, 0, 1, 1,
-0.7675112, 0.1142302, -0.7862502, 0, 0, 0, 1, 1,
-0.763743, 1.504904, 0.7929131, 0, 0, 0, 1, 1,
-0.7584432, -0.8471313, -3.123219, 0, 0, 0, 1, 1,
-0.7560257, 1.800197, -1.284179, 0, 0, 0, 1, 1,
-0.7548196, -0.2974716, -2.010603, 0, 0, 0, 1, 1,
-0.7513536, -1.248832, -3.676426, 0, 0, 0, 1, 1,
-0.7511089, 0.07609071, -0.2315607, 1, 1, 1, 1, 1,
-0.7498513, 0.2413395, -1.52685, 1, 1, 1, 1, 1,
-0.7467744, -1.463204, -3.361471, 1, 1, 1, 1, 1,
-0.7466601, 0.02575362, -2.365256, 1, 1, 1, 1, 1,
-0.7349411, 0.8589073, -0.7767841, 1, 1, 1, 1, 1,
-0.7340444, -0.07776212, -0.8602073, 1, 1, 1, 1, 1,
-0.7301384, -0.5662228, -1.70672, 1, 1, 1, 1, 1,
-0.7299918, -0.134287, -1.054258, 1, 1, 1, 1, 1,
-0.7217056, -1.136887, -3.70727, 1, 1, 1, 1, 1,
-0.7202495, -0.6456606, -2.816226, 1, 1, 1, 1, 1,
-0.7156141, 0.7845771, -0.06730998, 1, 1, 1, 1, 1,
-0.7139595, 0.9283356, -1.66632, 1, 1, 1, 1, 1,
-0.7111949, 0.5584339, -1.557102, 1, 1, 1, 1, 1,
-0.7094895, -0.8467275, -2.737296, 1, 1, 1, 1, 1,
-0.708653, -0.04153949, -1.564726, 1, 1, 1, 1, 1,
-0.7059933, -0.6691518, -1.695706, 0, 0, 1, 1, 1,
-0.7051931, 2.028813, 0.1834021, 1, 0, 0, 1, 1,
-0.7044425, -0.2814999, -2.567309, 1, 0, 0, 1, 1,
-0.6969709, -1.162177, -1.90068, 1, 0, 0, 1, 1,
-0.6918765, -0.7627271, -0.5982497, 1, 0, 0, 1, 1,
-0.6889946, -0.6248287, -0.9589323, 1, 0, 0, 1, 1,
-0.6827285, 0.0401058, -2.850835, 0, 0, 0, 1, 1,
-0.6795716, -0.5579718, -1.718955, 0, 0, 0, 1, 1,
-0.679057, -0.8534399, -4.30961, 0, 0, 0, 1, 1,
-0.676295, -0.7229027, -2.392856, 0, 0, 0, 1, 1,
-0.6742954, -0.08703692, -2.569549, 0, 0, 0, 1, 1,
-0.670635, 0.6201372, -1.505291, 0, 0, 0, 1, 1,
-0.670494, 1.217667, -0.8769348, 0, 0, 0, 1, 1,
-0.668127, -0.7569343, -4.105921, 1, 1, 1, 1, 1,
-0.6665737, -1.468776, -3.219944, 1, 1, 1, 1, 1,
-0.6644583, 0.3661584, -3.084878, 1, 1, 1, 1, 1,
-0.6584024, -0.6074657, -1.049282, 1, 1, 1, 1, 1,
-0.6577556, -1.427262, -2.210931, 1, 1, 1, 1, 1,
-0.6567124, -1.489725, -2.551744, 1, 1, 1, 1, 1,
-0.6521616, -0.4124023, -1.461484, 1, 1, 1, 1, 1,
-0.6519334, -1.006963, -3.746751, 1, 1, 1, 1, 1,
-0.6507624, 1.470169, -2.570077, 1, 1, 1, 1, 1,
-0.6503044, -0.5208188, -3.438082, 1, 1, 1, 1, 1,
-0.650106, 1.325534, -1.841211, 1, 1, 1, 1, 1,
-0.6499954, 0.5379087, -0.2207492, 1, 1, 1, 1, 1,
-0.6495194, -0.2964734, -1.790709, 1, 1, 1, 1, 1,
-0.6463488, 0.6065226, -0.1653547, 1, 1, 1, 1, 1,
-0.6445247, -0.8194864, -1.633611, 1, 1, 1, 1, 1,
-0.640766, 0.5360007, -0.7722276, 0, 0, 1, 1, 1,
-0.6332215, 0.4334077, -0.5755405, 1, 0, 0, 1, 1,
-0.6316102, -0.2566236, -1.594109, 1, 0, 0, 1, 1,
-0.6294093, 0.7009106, -1.507597, 1, 0, 0, 1, 1,
-0.6287115, 0.7798259, -0.3981709, 1, 0, 0, 1, 1,
-0.6260843, 0.3495223, -2.015165, 1, 0, 0, 1, 1,
-0.6251252, -1.139132, -2.33954, 0, 0, 0, 1, 1,
-0.6239569, -0.8998488, -2.54997, 0, 0, 0, 1, 1,
-0.6232014, 0.09314527, -1.167482, 0, 0, 0, 1, 1,
-0.6208443, -0.6819515, -2.737484, 0, 0, 0, 1, 1,
-0.6162515, -1.62134, -2.889035, 0, 0, 0, 1, 1,
-0.612198, -1.09133, -4.667723, 0, 0, 0, 1, 1,
-0.6105711, -0.1170546, -3.3966, 0, 0, 0, 1, 1,
-0.6100599, 0.9012588, -1.599524, 1, 1, 1, 1, 1,
-0.6084546, 0.7664675, -0.09060802, 1, 1, 1, 1, 1,
-0.6039647, -0.4527739, -3.470991, 1, 1, 1, 1, 1,
-0.6010439, 0.5725302, -0.6117357, 1, 1, 1, 1, 1,
-0.5979149, 0.1379015, -0.1041173, 1, 1, 1, 1, 1,
-0.5966018, -0.6870998, -1.190639, 1, 1, 1, 1, 1,
-0.5940615, -1.017125, -3.605015, 1, 1, 1, 1, 1,
-0.5932415, 0.1903963, -0.5742288, 1, 1, 1, 1, 1,
-0.5846831, 2.053979, -1.019942, 1, 1, 1, 1, 1,
-0.5809914, -2.760221, -1.679703, 1, 1, 1, 1, 1,
-0.5801262, -0.1891623, -1.572541, 1, 1, 1, 1, 1,
-0.5798251, -0.7016706, -2.030605, 1, 1, 1, 1, 1,
-0.5769975, -0.3763206, -1.552677, 1, 1, 1, 1, 1,
-0.5764734, -0.1341457, -0.6257725, 1, 1, 1, 1, 1,
-0.5714718, 0.3863506, -2.349245, 1, 1, 1, 1, 1,
-0.5700761, -0.007958657, -1.066859, 0, 0, 1, 1, 1,
-0.5700502, 0.8921391, -0.9839198, 1, 0, 0, 1, 1,
-0.5676546, -0.8301781, -1.102607, 1, 0, 0, 1, 1,
-0.5665401, 0.7305169, -0.760493, 1, 0, 0, 1, 1,
-0.5638355, 0.6658432, -2.610301, 1, 0, 0, 1, 1,
-0.5635918, 1.843012, 1.548325, 1, 0, 0, 1, 1,
-0.5618839, -0.6363596, -1.996787, 0, 0, 0, 1, 1,
-0.5614055, 0.4531725, -0.6584562, 0, 0, 0, 1, 1,
-0.5611876, -1.160051, -2.106787, 0, 0, 0, 1, 1,
-0.5598601, -0.03474981, -1.171519, 0, 0, 0, 1, 1,
-0.5572892, -0.2022995, -3.167956, 0, 0, 0, 1, 1,
-0.5567065, 0.2183209, -0.7432051, 0, 0, 0, 1, 1,
-0.5547181, 1.081865, 0.9200004, 0, 0, 0, 1, 1,
-0.5500929, -0.3873718, -2.26018, 1, 1, 1, 1, 1,
-0.5492747, -1.131076, -2.526657, 1, 1, 1, 1, 1,
-0.5479209, -0.2364409, -2.249207, 1, 1, 1, 1, 1,
-0.5475837, -0.08633085, -0.7190687, 1, 1, 1, 1, 1,
-0.5470749, 0.164412, -0.9689519, 1, 1, 1, 1, 1,
-0.5453445, -0.3343064, -1.523591, 1, 1, 1, 1, 1,
-0.5410711, -1.886612, -0.5360057, 1, 1, 1, 1, 1,
-0.5369503, -0.3605587, -1.544946, 1, 1, 1, 1, 1,
-0.5326788, 0.6189726, -0.2465106, 1, 1, 1, 1, 1,
-0.5323544, 0.1484261, -0.7140114, 1, 1, 1, 1, 1,
-0.5321038, -0.831774, -1.650014, 1, 1, 1, 1, 1,
-0.5297746, -0.6347628, -4.601855, 1, 1, 1, 1, 1,
-0.5279624, 0.595749, -0.7479508, 1, 1, 1, 1, 1,
-0.5269824, -0.2848264, -2.341231, 1, 1, 1, 1, 1,
-0.5238171, 1.599539, -0.3985325, 1, 1, 1, 1, 1,
-0.5233791, -0.5012876, -3.576213, 0, 0, 1, 1, 1,
-0.5233169, -0.9563149, -2.605451, 1, 0, 0, 1, 1,
-0.5232792, -0.1625336, -1.924242, 1, 0, 0, 1, 1,
-0.5211579, -0.6584664, -2.0967, 1, 0, 0, 1, 1,
-0.5197549, 0.8495527, -1.860337, 1, 0, 0, 1, 1,
-0.5172685, -0.2530562, -0.9510995, 1, 0, 0, 1, 1,
-0.5166531, -0.06771298, -3.065104, 0, 0, 0, 1, 1,
-0.5164194, 0.8570119, 1.199565, 0, 0, 0, 1, 1,
-0.5140856, 2.103939, -0.935937, 0, 0, 0, 1, 1,
-0.5127166, 0.619151, -1.652413, 0, 0, 0, 1, 1,
-0.5115291, -1.321121, -1.368572, 0, 0, 0, 1, 1,
-0.5107284, 0.08766055, -2.219188, 0, 0, 0, 1, 1,
-0.503346, -1.902071, -4.917612, 0, 0, 0, 1, 1,
-0.5033264, -0.2139892, -0.9963834, 1, 1, 1, 1, 1,
-0.5017528, 0.4002354, -0.5301099, 1, 1, 1, 1, 1,
-0.5005291, -0.09407997, -1.13708, 1, 1, 1, 1, 1,
-0.5000783, -0.6157152, -2.428583, 1, 1, 1, 1, 1,
-0.4996313, 0.005256014, -0.3528344, 1, 1, 1, 1, 1,
-0.4993815, -0.4490548, 0.001797071, 1, 1, 1, 1, 1,
-0.4923837, -2.20922, -2.200537, 1, 1, 1, 1, 1,
-0.4905034, -0.3081726, -2.449413, 1, 1, 1, 1, 1,
-0.4866761, -0.3924637, -1.92333, 1, 1, 1, 1, 1,
-0.4848869, -0.1714194, -3.314068, 1, 1, 1, 1, 1,
-0.4847522, 0.3714659, -0.7873396, 1, 1, 1, 1, 1,
-0.4833161, -0.3554453, -1.740372, 1, 1, 1, 1, 1,
-0.4790764, -0.9980137, -1.654823, 1, 1, 1, 1, 1,
-0.4772221, -0.6387566, -1.276187, 1, 1, 1, 1, 1,
-0.4752642, 0.1002753, -2.469089, 1, 1, 1, 1, 1,
-0.4749252, 0.08031713, -1.260024, 0, 0, 1, 1, 1,
-0.4714749, 1.554604, -1.478229, 1, 0, 0, 1, 1,
-0.4696493, 0.5005957, -0.1170704, 1, 0, 0, 1, 1,
-0.4688702, 0.2187726, -1.504125, 1, 0, 0, 1, 1,
-0.4673139, 1.423099, -0.4676911, 1, 0, 0, 1, 1,
-0.4635043, -0.9953638, -3.780053, 1, 0, 0, 1, 1,
-0.4629213, 0.910614, 0.675368, 0, 0, 0, 1, 1,
-0.4608279, -0.1610831, -0.3549445, 0, 0, 0, 1, 1,
-0.4586452, 1.062692, 0.1614396, 0, 0, 0, 1, 1,
-0.4536441, 0.1898311, -0.1599972, 0, 0, 0, 1, 1,
-0.4486581, 0.7958217, -0.948924, 0, 0, 0, 1, 1,
-0.4474962, 1.907382, -0.5502919, 0, 0, 0, 1, 1,
-0.445565, 0.02746227, -1.379409, 0, 0, 0, 1, 1,
-0.4401805, -0.06381349, -1.026689, 1, 1, 1, 1, 1,
-0.4369416, 0.709577, 0.9150646, 1, 1, 1, 1, 1,
-0.4367648, 1.049156, 0.008127565, 1, 1, 1, 1, 1,
-0.4365966, 1.033124, -0.9180843, 1, 1, 1, 1, 1,
-0.4362453, 0.8356732, 0.3775366, 1, 1, 1, 1, 1,
-0.4344768, -0.2506987, -1.736124, 1, 1, 1, 1, 1,
-0.4287093, -0.5187542, -1.636393, 1, 1, 1, 1, 1,
-0.4283253, 0.4500666, -0.6263694, 1, 1, 1, 1, 1,
-0.4275261, 0.6967214, 0.6517128, 1, 1, 1, 1, 1,
-0.4245195, 0.8748372, -1.033858, 1, 1, 1, 1, 1,
-0.4227712, -0.9680673, -2.416447, 1, 1, 1, 1, 1,
-0.4204432, -0.6877336, -4.228557, 1, 1, 1, 1, 1,
-0.4195718, 0.3633374, -0.3724682, 1, 1, 1, 1, 1,
-0.4171366, 0.1975343, -1.771364, 1, 1, 1, 1, 1,
-0.4151265, 0.6199111, -1.90515, 1, 1, 1, 1, 1,
-0.4077492, 1.149731, -1.017721, 0, 0, 1, 1, 1,
-0.4074472, -0.476735, -2.308375, 1, 0, 0, 1, 1,
-0.3998179, 1.298599, 0.8354588, 1, 0, 0, 1, 1,
-0.3990593, 1.043401, -0.5485851, 1, 0, 0, 1, 1,
-0.3979908, -0.03421647, -1.660992, 1, 0, 0, 1, 1,
-0.3973264, -0.8278649, -2.912668, 1, 0, 0, 1, 1,
-0.3954567, -0.9350505, -2.309167, 0, 0, 0, 1, 1,
-0.3892257, 1.487639, 0.3667129, 0, 0, 0, 1, 1,
-0.3866213, -0.5681381, -2.281888, 0, 0, 0, 1, 1,
-0.3862444, -0.5210244, -2.789007, 0, 0, 0, 1, 1,
-0.3858798, 1.598519, -1.313258, 0, 0, 0, 1, 1,
-0.3812034, -0.2823113, -2.00632, 0, 0, 0, 1, 1,
-0.3804135, 0.4906074, 0.5476876, 0, 0, 0, 1, 1,
-0.3762254, -1.095742, -2.487616, 1, 1, 1, 1, 1,
-0.3751179, -0.4138831, -1.833176, 1, 1, 1, 1, 1,
-0.3739806, 0.1335511, -1.622816, 1, 1, 1, 1, 1,
-0.3720616, 1.868128, 0.6924046, 1, 1, 1, 1, 1,
-0.3714443, 1.429106, 0.2781076, 1, 1, 1, 1, 1,
-0.3674352, -0.09121039, -0.4279071, 1, 1, 1, 1, 1,
-0.3668873, -0.1153117, -0.8289067, 1, 1, 1, 1, 1,
-0.3659138, 0.2858904, -0.4084781, 1, 1, 1, 1, 1,
-0.3649019, -0.3811014, -2.281766, 1, 1, 1, 1, 1,
-0.3632852, -0.5438495, -4.277217, 1, 1, 1, 1, 1,
-0.3622122, 0.8074635, -1.584785, 1, 1, 1, 1, 1,
-0.3586956, -0.02472719, -0.2887131, 1, 1, 1, 1, 1,
-0.3581266, 1.417307, -0.506309, 1, 1, 1, 1, 1,
-0.3568234, 0.2606746, -0.3135269, 1, 1, 1, 1, 1,
-0.3467307, 0.2363133, -1.568683, 1, 1, 1, 1, 1,
-0.3462922, -0.08671693, -2.31693, 0, 0, 1, 1, 1,
-0.3414378, -1.97363, -3.530694, 1, 0, 0, 1, 1,
-0.3392227, 1.129773, -0.5140441, 1, 0, 0, 1, 1,
-0.3328712, -1.476297, -2.642945, 1, 0, 0, 1, 1,
-0.3311644, -1.70797, -3.157398, 1, 0, 0, 1, 1,
-0.3277299, 0.07028872, -1.138847, 1, 0, 0, 1, 1,
-0.3265629, 0.2693405, -0.1231816, 0, 0, 0, 1, 1,
-0.3259504, -1.093183, -3.169615, 0, 0, 0, 1, 1,
-0.3246067, -1.282318, -3.699076, 0, 0, 0, 1, 1,
-0.324301, 0.5800552, -1.302749, 0, 0, 0, 1, 1,
-0.3191378, 0.6210201, 0.6178936, 0, 0, 0, 1, 1,
-0.3175012, 0.6264202, -0.5774992, 0, 0, 0, 1, 1,
-0.3167571, 0.9481593, 0.5611452, 0, 0, 0, 1, 1,
-0.3161131, 0.847997, -0.8325999, 1, 1, 1, 1, 1,
-0.3141484, 0.2941068, -1.10845, 1, 1, 1, 1, 1,
-0.3091569, 0.04780864, -1.444711, 1, 1, 1, 1, 1,
-0.3061084, -1.293224, -3.788526, 1, 1, 1, 1, 1,
-0.2963125, 0.8194438, -1.176845, 1, 1, 1, 1, 1,
-0.2935643, -0.1117111, -1.346212, 1, 1, 1, 1, 1,
-0.2786233, 1.126315, 0.7003429, 1, 1, 1, 1, 1,
-0.2785667, 0.4110222, -0.4937779, 1, 1, 1, 1, 1,
-0.2754146, -0.8935721, -4.277478, 1, 1, 1, 1, 1,
-0.2717335, 0.5964983, 0.7152011, 1, 1, 1, 1, 1,
-0.2628522, -0.8236895, -4.059867, 1, 1, 1, 1, 1,
-0.2601359, -0.1764743, -1.39107, 1, 1, 1, 1, 1,
-0.2593821, -1.884559, -5.489362, 1, 1, 1, 1, 1,
-0.2591583, 1.186038, 0.9903853, 1, 1, 1, 1, 1,
-0.2522033, -0.5573713, -1.604042, 1, 1, 1, 1, 1,
-0.2408576, 1.660194, 0.3710426, 0, 0, 1, 1, 1,
-0.2400984, 0.8016002, 1.590661, 1, 0, 0, 1, 1,
-0.2392529, 1.928934, 0.4259123, 1, 0, 0, 1, 1,
-0.2368062, -0.7703144, -3.918782, 1, 0, 0, 1, 1,
-0.2353797, 0.7580064, -0.2241642, 1, 0, 0, 1, 1,
-0.2328663, 1.990935, 1.608653, 1, 0, 0, 1, 1,
-0.2327675, -0.301554, -3.000203, 0, 0, 0, 1, 1,
-0.232631, -1.275081, -3.426129, 0, 0, 0, 1, 1,
-0.2283903, 0.51459, -0.4142976, 0, 0, 0, 1, 1,
-0.2197745, 1.415945, 0.1972451, 0, 0, 0, 1, 1,
-0.2180155, 0.3921869, -0.5892113, 0, 0, 0, 1, 1,
-0.215951, -0.2826386, -2.656693, 0, 0, 0, 1, 1,
-0.2156383, 1.439568, 0.1971347, 0, 0, 0, 1, 1,
-0.2132786, 1.368636, 0.1347072, 1, 1, 1, 1, 1,
-0.2107499, 0.3914533, -0.2441622, 1, 1, 1, 1, 1,
-0.2098074, -0.05485655, -2.813974, 1, 1, 1, 1, 1,
-0.2073824, 0.1450704, 0.2888888, 1, 1, 1, 1, 1,
-0.2025699, 0.2136447, -0.2771751, 1, 1, 1, 1, 1,
-0.2003796, -0.638643, -2.39295, 1, 1, 1, 1, 1,
-0.1998939, -0.9418709, -1.183098, 1, 1, 1, 1, 1,
-0.197437, 1.195212, -0.9960737, 1, 1, 1, 1, 1,
-0.197429, -0.04328644, -0.3096848, 1, 1, 1, 1, 1,
-0.196185, -1.050025, -4.691514, 1, 1, 1, 1, 1,
-0.1923989, 0.2772632, -1.511912, 1, 1, 1, 1, 1,
-0.1893946, -2.164322, -0.4874839, 1, 1, 1, 1, 1,
-0.1855406, 0.1947603, -0.2238198, 1, 1, 1, 1, 1,
-0.180428, -0.08835343, -1.227663, 1, 1, 1, 1, 1,
-0.1802463, -0.1354299, -0.4383512, 1, 1, 1, 1, 1,
-0.1790058, -0.8864629, -3.293588, 0, 0, 1, 1, 1,
-0.1765166, -0.1421513, -1.714849, 1, 0, 0, 1, 1,
-0.1755282, -0.9972968, -1.738319, 1, 0, 0, 1, 1,
-0.1753074, -0.8605664, -2.088965, 1, 0, 0, 1, 1,
-0.1748011, 0.5284709, 0.4688637, 1, 0, 0, 1, 1,
-0.1713167, 0.2573625, -0.3946763, 1, 0, 0, 1, 1,
-0.1678841, -1.298777, -2.640958, 0, 0, 0, 1, 1,
-0.1662711, -1.704566, -3.788347, 0, 0, 0, 1, 1,
-0.1629483, -0.630865, -2.704526, 0, 0, 0, 1, 1,
-0.1623123, -0.7467225, -2.002458, 0, 0, 0, 1, 1,
-0.1612168, 0.3114935, 0.6278071, 0, 0, 0, 1, 1,
-0.1606652, -0.8269007, -3.125832, 0, 0, 0, 1, 1,
-0.155307, -0.8298793, -2.648467, 0, 0, 0, 1, 1,
-0.1526526, -0.336432, -2.470162, 1, 1, 1, 1, 1,
-0.1523576, 0.7077144, -0.2716711, 1, 1, 1, 1, 1,
-0.150649, 0.3553782, -0.8466048, 1, 1, 1, 1, 1,
-0.1481297, 0.9987581, -0.2358854, 1, 1, 1, 1, 1,
-0.1463064, 0.7435316, -0.3958847, 1, 1, 1, 1, 1,
-0.1443629, -0.920852, -2.486099, 1, 1, 1, 1, 1,
-0.1435419, 0.7358209, -1.787813, 1, 1, 1, 1, 1,
-0.1433682, 0.1725453, -0.3293539, 1, 1, 1, 1, 1,
-0.1425489, 0.9349416, 0.3186762, 1, 1, 1, 1, 1,
-0.1410782, 0.4962707, 1.010754, 1, 1, 1, 1, 1,
-0.1401287, 0.7574356, -0.3127271, 1, 1, 1, 1, 1,
-0.1336969, -0.5570416, -3.920729, 1, 1, 1, 1, 1,
-0.132965, -0.7932599, -2.942781, 1, 1, 1, 1, 1,
-0.1275829, 0.5163281, 0.2819527, 1, 1, 1, 1, 1,
-0.1271497, 0.7639909, 0.7811069, 1, 1, 1, 1, 1,
-0.1262551, -0.5536236, -4.088902, 0, 0, 1, 1, 1,
-0.1252225, -0.07989547, -3.067141, 1, 0, 0, 1, 1,
-0.1193318, 0.9399397, -0.4167455, 1, 0, 0, 1, 1,
-0.1170894, -0.6663986, -3.186667, 1, 0, 0, 1, 1,
-0.1116352, 1.118382, -0.4256918, 1, 0, 0, 1, 1,
-0.1099947, 0.5302575, -1.091622, 1, 0, 0, 1, 1,
-0.1097522, -0.436621, -3.147788, 0, 0, 0, 1, 1,
-0.1072278, 1.412276, 1.289149, 0, 0, 0, 1, 1,
-0.1043553, 1.35387, -0.3533806, 0, 0, 0, 1, 1,
-0.0993112, 0.5147101, 1.898688, 0, 0, 0, 1, 1,
-0.09863079, -0.2303548, -1.775473, 0, 0, 0, 1, 1,
-0.09771118, 0.4218979, -0.491455, 0, 0, 0, 1, 1,
-0.09670303, 0.6429603, 0.4602264, 0, 0, 0, 1, 1,
-0.09616025, -1.879547, -2.663746, 1, 1, 1, 1, 1,
-0.09605642, -0.2201191, -2.66979, 1, 1, 1, 1, 1,
-0.09449284, 0.3975909, 0.309985, 1, 1, 1, 1, 1,
-0.09215382, 0.7286476, -0.202786, 1, 1, 1, 1, 1,
-0.08901775, -0.6190043, -1.608483, 1, 1, 1, 1, 1,
-0.08752773, 1.030993, 0.5896795, 1, 1, 1, 1, 1,
-0.08340663, 0.5281856, -0.3510621, 1, 1, 1, 1, 1,
-0.08282779, -0.7693025, -2.443321, 1, 1, 1, 1, 1,
-0.07728091, 0.2839543, 0.9095193, 1, 1, 1, 1, 1,
-0.07694857, 0.7689916, -1.286623, 1, 1, 1, 1, 1,
-0.07596789, -0.5802473, -2.832719, 1, 1, 1, 1, 1,
-0.07560179, 0.4274334, 1.573078, 1, 1, 1, 1, 1,
-0.06639346, 0.1418382, -0.7390208, 1, 1, 1, 1, 1,
-0.06288302, 0.5509698, -1.319236, 1, 1, 1, 1, 1,
-0.06217308, -0.8117884, -3.551343, 1, 1, 1, 1, 1,
-0.06142716, -0.7965616, -3.644901, 0, 0, 1, 1, 1,
-0.06132345, 0.08821097, 0.2077128, 1, 0, 0, 1, 1,
-0.06024823, 1.450311, 0.9853039, 1, 0, 0, 1, 1,
-0.05722366, 0.1721357, -0.55878, 1, 0, 0, 1, 1,
-0.04237527, 1.299956, 0.004944597, 1, 0, 0, 1, 1,
-0.03339357, 0.7200261, 0.3088851, 1, 0, 0, 1, 1,
-0.0331816, 0.4535341, 1.301997, 0, 0, 0, 1, 1,
-0.02820098, -0.1602104, -3.454036, 0, 0, 0, 1, 1,
-0.01833732, -0.4882455, -4.726238, 0, 0, 0, 1, 1,
-0.01766334, -0.3933181, -3.100787, 0, 0, 0, 1, 1,
-0.01612983, 0.341249, -0.4808902, 0, 0, 0, 1, 1,
-0.01147698, 1.514828, -0.1950046, 0, 0, 0, 1, 1,
-0.01057869, -1.014377, -4.259396, 0, 0, 0, 1, 1,
-0.00802488, 2.851023, 1.745428, 1, 1, 1, 1, 1,
-0.006016326, -0.1419728, -3.031866, 1, 1, 1, 1, 1,
-0.00546272, -0.7637818, -2.026307, 1, 1, 1, 1, 1,
0.002402929, 0.6339266, -0.09872887, 1, 1, 1, 1, 1,
0.002742959, 0.1837465, 2.168835, 1, 1, 1, 1, 1,
0.005428938, 1.64084, 0.4102104, 1, 1, 1, 1, 1,
0.005447395, -0.1078699, 2.952166, 1, 1, 1, 1, 1,
0.00736532, 0.5057109, -0.2797765, 1, 1, 1, 1, 1,
0.007387207, 0.4943929, -1.647586, 1, 1, 1, 1, 1,
0.00783976, 1.144341, 1.008394, 1, 1, 1, 1, 1,
0.01430815, 0.5726519, -0.8179598, 1, 1, 1, 1, 1,
0.01526019, 0.2024113, 2.551147, 1, 1, 1, 1, 1,
0.01843871, 1.246644, 1.006028, 1, 1, 1, 1, 1,
0.02112498, -1.572601, 1.99551, 1, 1, 1, 1, 1,
0.02208085, 0.1865921, -0.931438, 1, 1, 1, 1, 1,
0.02472389, 0.7743906, 0.01431777, 0, 0, 1, 1, 1,
0.03426542, 1.451679, 0.2069522, 1, 0, 0, 1, 1,
0.03598033, -0.01471381, 1.456628, 1, 0, 0, 1, 1,
0.03792388, 1.116907, 1.661184, 1, 0, 0, 1, 1,
0.04220135, -0.2277538, 3.918373, 1, 0, 0, 1, 1,
0.05163922, 0.4672804, 1.619234, 1, 0, 0, 1, 1,
0.06241635, 1.726643, -0.405443, 0, 0, 0, 1, 1,
0.06267553, 0.3133397, 1.301666, 0, 0, 0, 1, 1,
0.06347108, 0.7630569, 0.359353, 0, 0, 0, 1, 1,
0.06406964, 0.7940595, -0.8745963, 0, 0, 0, 1, 1,
0.06523837, -0.4418546, 2.684807, 0, 0, 0, 1, 1,
0.0656001, -1.797042, 1.941015, 0, 0, 0, 1, 1,
0.06667321, -0.6111207, 4.324634, 0, 0, 0, 1, 1,
0.06672097, 0.5955441, 0.5228766, 1, 1, 1, 1, 1,
0.06890281, -0.1081696, 1.919091, 1, 1, 1, 1, 1,
0.07257523, -0.2740124, 2.796273, 1, 1, 1, 1, 1,
0.07657158, -1.623889, 2.105346, 1, 1, 1, 1, 1,
0.08050089, 1.10076, -0.07941691, 1, 1, 1, 1, 1,
0.08355754, -0.8058879, 4.961657, 1, 1, 1, 1, 1,
0.08524299, -0.2508936, 3.467002, 1, 1, 1, 1, 1,
0.08545244, -0.09657266, 3.592081, 1, 1, 1, 1, 1,
0.08609919, -0.5530184, 2.933969, 1, 1, 1, 1, 1,
0.09183867, -0.0005841393, 1.386685, 1, 1, 1, 1, 1,
0.09244636, -1.002081, 3.130293, 1, 1, 1, 1, 1,
0.09359039, 0.2584471, 0.1371382, 1, 1, 1, 1, 1,
0.09391333, -1.053549, 4.040597, 1, 1, 1, 1, 1,
0.09946779, -1.419986, 2.085068, 1, 1, 1, 1, 1,
0.09965587, -1.232222, 4.512467, 1, 1, 1, 1, 1,
0.1005376, 1.049283, -0.400708, 0, 0, 1, 1, 1,
0.1103616, -0.1866309, 4.783239, 1, 0, 0, 1, 1,
0.1111461, 0.8304313, 0.7709281, 1, 0, 0, 1, 1,
0.1255988, -0.9730588, 2.748243, 1, 0, 0, 1, 1,
0.1274037, -0.8957199, 3.603612, 1, 0, 0, 1, 1,
0.1298202, 1.199318, -0.2352524, 1, 0, 0, 1, 1,
0.1314391, -1.956461, 2.41765, 0, 0, 0, 1, 1,
0.138606, 1.425603, -0.0131575, 0, 0, 0, 1, 1,
0.1417217, 1.429594, 0.693363, 0, 0, 0, 1, 1,
0.1441985, -0.1501755, 3.440941, 0, 0, 0, 1, 1,
0.1458956, 0.3801021, 0.0238341, 0, 0, 0, 1, 1,
0.1468056, -0.2788779, 1.639964, 0, 0, 0, 1, 1,
0.1479653, 0.2695638, 1.455582, 0, 0, 0, 1, 1,
0.1495096, 1.543906, 0.7396684, 1, 1, 1, 1, 1,
0.1502415, -2.412647, 3.6671, 1, 1, 1, 1, 1,
0.1550692, 0.8681318, 1.382666, 1, 1, 1, 1, 1,
0.155402, 0.5249305, -0.1641643, 1, 1, 1, 1, 1,
0.1566187, 1.526522, -1.855242, 1, 1, 1, 1, 1,
0.1598994, 0.8167081, 0.9580351, 1, 1, 1, 1, 1,
0.1670343, -0.232453, 1.898932, 1, 1, 1, 1, 1,
0.1690276, 0.32406, -0.170336, 1, 1, 1, 1, 1,
0.1743393, 1.740709, 1.144587, 1, 1, 1, 1, 1,
0.1743945, -0.440748, 3.327052, 1, 1, 1, 1, 1,
0.1746073, -0.3095819, 3.010308, 1, 1, 1, 1, 1,
0.1758789, -0.5922315, 4.032611, 1, 1, 1, 1, 1,
0.1774334, 0.3092697, 0.7021482, 1, 1, 1, 1, 1,
0.1787623, -0.9014071, 3.261204, 1, 1, 1, 1, 1,
0.1798892, -1.303886, 2.384952, 1, 1, 1, 1, 1,
0.1800529, 0.9820825, 0.725426, 0, 0, 1, 1, 1,
0.180583, -1.247138, 3.302501, 1, 0, 0, 1, 1,
0.1859192, -0.07243753, 1.684208, 1, 0, 0, 1, 1,
0.1879141, -0.5977699, 3.500592, 1, 0, 0, 1, 1,
0.1887614, -0.5649053, 2.80947, 1, 0, 0, 1, 1,
0.1942602, 1.015309, 1.275216, 1, 0, 0, 1, 1,
0.1957919, 1.133229, -0.3997543, 0, 0, 0, 1, 1,
0.1971902, 0.8055003, 1.793735, 0, 0, 0, 1, 1,
0.1974825, 0.855282, 0.7596691, 0, 0, 0, 1, 1,
0.198682, 0.05871703, 0.3685636, 0, 0, 0, 1, 1,
0.2010819, 0.1100957, 0.1167501, 0, 0, 0, 1, 1,
0.2035911, 0.4238663, 0.7422734, 0, 0, 0, 1, 1,
0.20554, -1.073081, 2.657304, 0, 0, 0, 1, 1,
0.206787, 0.4364798, 0.5179624, 1, 1, 1, 1, 1,
0.2118902, -0.3970225, 2.763124, 1, 1, 1, 1, 1,
0.2144154, 0.7998096, 0.4540808, 1, 1, 1, 1, 1,
0.217443, -1.819159, 4.117754, 1, 1, 1, 1, 1,
0.2193777, 0.469422, -0.5189267, 1, 1, 1, 1, 1,
0.2205233, 0.3282282, -0.2768143, 1, 1, 1, 1, 1,
0.2231528, 0.8737283, 0.3139378, 1, 1, 1, 1, 1,
0.2255895, 1.906235, -0.6690953, 1, 1, 1, 1, 1,
0.2263227, -0.7956882, 2.079708, 1, 1, 1, 1, 1,
0.2267236, 0.9459207, 0.5464762, 1, 1, 1, 1, 1,
0.2334673, 2.340301, -1.174419, 1, 1, 1, 1, 1,
0.2383872, 1.475369, 0.2849006, 1, 1, 1, 1, 1,
0.2388092, -0.6610218, 2.363084, 1, 1, 1, 1, 1,
0.23906, -0.8741738, 2.501017, 1, 1, 1, 1, 1,
0.2446167, 0.4312891, 1.095822, 1, 1, 1, 1, 1,
0.24964, 0.3654323, 1.661437, 0, 0, 1, 1, 1,
0.2516979, -2.436379, 1.880063, 1, 0, 0, 1, 1,
0.2536, 1.358999, 0.1222716, 1, 0, 0, 1, 1,
0.2567937, -0.7382706, 3.680984, 1, 0, 0, 1, 1,
0.2649727, 0.3183715, 0.4055142, 1, 0, 0, 1, 1,
0.2752479, -1.306366, 3.339248, 1, 0, 0, 1, 1,
0.2763591, 1.750269, -0.4517862, 0, 0, 0, 1, 1,
0.2764956, 0.04208542, 1.559234, 0, 0, 0, 1, 1,
0.2896884, -0.9412596, 2.986715, 0, 0, 0, 1, 1,
0.2904564, -1.38092, 2.985084, 0, 0, 0, 1, 1,
0.2954846, 0.7157121, 1.514964, 0, 0, 0, 1, 1,
0.2999858, -1.154673, 2.706138, 0, 0, 0, 1, 1,
0.302282, 0.8557748, -0.3256755, 0, 0, 0, 1, 1,
0.3090382, -0.9198695, 1.27053, 1, 1, 1, 1, 1,
0.3129691, 0.0251781, 2.799988, 1, 1, 1, 1, 1,
0.3137326, 1.187596, -1.415191, 1, 1, 1, 1, 1,
0.316033, 1.308923, -0.02745551, 1, 1, 1, 1, 1,
0.3303083, -0.5857172, 2.313265, 1, 1, 1, 1, 1,
0.3324471, -1.452911, 2.781947, 1, 1, 1, 1, 1,
0.3337734, 0.2458055, 0.8201093, 1, 1, 1, 1, 1,
0.3352232, -0.4060595, 0.7837996, 1, 1, 1, 1, 1,
0.3352968, -1.053853, 3.377278, 1, 1, 1, 1, 1,
0.3371757, -0.9989568, 1.758103, 1, 1, 1, 1, 1,
0.3377226, 1.942023, 1.063903, 1, 1, 1, 1, 1,
0.3513533, 0.5582446, 2.049576, 1, 1, 1, 1, 1,
0.3543395, -0.2009364, 2.089829, 1, 1, 1, 1, 1,
0.3553194, -0.1730421, 1.001699, 1, 1, 1, 1, 1,
0.3642088, -1.892274, 3.31306, 1, 1, 1, 1, 1,
0.3650443, -0.5250724, 2.588581, 0, 0, 1, 1, 1,
0.3656963, -1.466687, 2.712499, 1, 0, 0, 1, 1,
0.3669692, -0.1666442, 1.279859, 1, 0, 0, 1, 1,
0.3676871, -1.386391, 1.381154, 1, 0, 0, 1, 1,
0.371649, 0.7547457, 2.765264, 1, 0, 0, 1, 1,
0.377545, -0.315007, 1.967272, 1, 0, 0, 1, 1,
0.377704, -0.2292468, 2.456725, 0, 0, 0, 1, 1,
0.3785785, 0.1864808, 0.6596706, 0, 0, 0, 1, 1,
0.3788789, 1.11132, -0.09943385, 0, 0, 0, 1, 1,
0.3791714, -0.4808308, 4.7458, 0, 0, 0, 1, 1,
0.3831335, -0.622412, 3.026871, 0, 0, 0, 1, 1,
0.3891135, -2.035872, 2.471047, 0, 0, 0, 1, 1,
0.3951979, -0.9704034, 1.834791, 0, 0, 0, 1, 1,
0.3953912, 0.5375727, 0.108572, 1, 1, 1, 1, 1,
0.3982638, 0.8614493, 0.8921933, 1, 1, 1, 1, 1,
0.4025273, -0.1727307, 2.468019, 1, 1, 1, 1, 1,
0.4060872, -0.2065495, 1.380167, 1, 1, 1, 1, 1,
0.4061669, -0.4375328, 1.967621, 1, 1, 1, 1, 1,
0.4074889, -0.09859401, 1.922448, 1, 1, 1, 1, 1,
0.4111436, -0.7018219, 1.671864, 1, 1, 1, 1, 1,
0.4124202, -0.01618682, 1.816765, 1, 1, 1, 1, 1,
0.4124972, -0.5162567, 4.6074, 1, 1, 1, 1, 1,
0.4141394, -0.3576136, 2.306293, 1, 1, 1, 1, 1,
0.4180563, -1.055878, 2.654289, 1, 1, 1, 1, 1,
0.4180973, -1.52024, 2.351132, 1, 1, 1, 1, 1,
0.4191553, 0.101033, 1.542537, 1, 1, 1, 1, 1,
0.4203826, -0.4841192, 1.577781, 1, 1, 1, 1, 1,
0.4219597, 1.066512, -0.2390558, 1, 1, 1, 1, 1,
0.4231404, 0.2815061, 1.992054, 0, 0, 1, 1, 1,
0.4236128, 0.4047318, -0.02620502, 1, 0, 0, 1, 1,
0.4239039, 0.809503, 0.4189339, 1, 0, 0, 1, 1,
0.4271077, -0.8478429, 3.682104, 1, 0, 0, 1, 1,
0.4280706, 0.7316978, 2.902725, 1, 0, 0, 1, 1,
0.4310491, -1.139779, 0.3326052, 1, 0, 0, 1, 1,
0.4350362, -0.7041841, 1.452027, 0, 0, 0, 1, 1,
0.4352397, 1.503065, 0.5429307, 0, 0, 0, 1, 1,
0.4378923, -0.154134, 2.088873, 0, 0, 0, 1, 1,
0.4389866, -0.1972135, 0.7836252, 0, 0, 0, 1, 1,
0.4424547, -1.566036, 2.530353, 0, 0, 0, 1, 1,
0.4455771, -1.169908, 3.133283, 0, 0, 0, 1, 1,
0.4471488, 0.3743587, 1.507431, 0, 0, 0, 1, 1,
0.4503271, 2.122414, -0.07976019, 1, 1, 1, 1, 1,
0.4527301, -0.3833011, 2.038961, 1, 1, 1, 1, 1,
0.4575975, -1.253747, 3.891801, 1, 1, 1, 1, 1,
0.4585194, -1.107516, 2.761786, 1, 1, 1, 1, 1,
0.4678591, -1.353048, 3.927073, 1, 1, 1, 1, 1,
0.4685033, -0.06218313, 1.541147, 1, 1, 1, 1, 1,
0.4690199, -0.6365123, 2.551596, 1, 1, 1, 1, 1,
0.4704298, 1.032022, -0.6151143, 1, 1, 1, 1, 1,
0.4720025, 0.06547002, 1.668577, 1, 1, 1, 1, 1,
0.4823927, -0.4680022, 2.74825, 1, 1, 1, 1, 1,
0.4843968, -0.2960325, 2.357126, 1, 1, 1, 1, 1,
0.4863297, -0.2722304, 1.064204, 1, 1, 1, 1, 1,
0.487583, -1.597098, 2.385001, 1, 1, 1, 1, 1,
0.4941581, -0.7053658, 1.415611, 1, 1, 1, 1, 1,
0.4960807, 0.8648022, 1.000524, 1, 1, 1, 1, 1,
0.4981384, 0.09006491, 1.300345, 0, 0, 1, 1, 1,
0.4986557, 0.636532, 0.7545061, 1, 0, 0, 1, 1,
0.5022296, 0.6101639, 1.902289, 1, 0, 0, 1, 1,
0.5031301, 0.5756844, -0.2641716, 1, 0, 0, 1, 1,
0.5123061, 1.546513, 1.899041, 1, 0, 0, 1, 1,
0.5143133, -0.9384583, 3.552234, 1, 0, 0, 1, 1,
0.5194732, -1.136548, 2.359941, 0, 0, 0, 1, 1,
0.5203267, -1.891821, 4.809412, 0, 0, 0, 1, 1,
0.5250462, -1.056734, 2.805888, 0, 0, 0, 1, 1,
0.5267921, 1.309488, 0.2038338, 0, 0, 0, 1, 1,
0.5271214, 1.714342, 0.004858899, 0, 0, 0, 1, 1,
0.5275658, -2.083589, 3.950087, 0, 0, 0, 1, 1,
0.5401288, -2.56742, 2.32546, 0, 0, 0, 1, 1,
0.5407687, -0.7678045, 1.283451, 1, 1, 1, 1, 1,
0.5413205, -0.5357097, 1.764352, 1, 1, 1, 1, 1,
0.5438849, 0.3302865, 1.510619, 1, 1, 1, 1, 1,
0.5472683, -1.55062, 0.8111917, 1, 1, 1, 1, 1,
0.5508851, -1.106439, 2.463518, 1, 1, 1, 1, 1,
0.551091, 0.4765416, 1.832335, 1, 1, 1, 1, 1,
0.5563638, 0.1378037, 1.464883, 1, 1, 1, 1, 1,
0.5612437, -0.3134136, 1.244289, 1, 1, 1, 1, 1,
0.5714834, -0.4955954, 2.201688, 1, 1, 1, 1, 1,
0.5771614, -0.3117995, 2.439826, 1, 1, 1, 1, 1,
0.5813008, -0.3671718, 2.330713, 1, 1, 1, 1, 1,
0.5841124, 0.0156704, 1.068981, 1, 1, 1, 1, 1,
0.5873206, 1.178049, -0.8585952, 1, 1, 1, 1, 1,
0.5900044, 0.2556697, 1.055565, 1, 1, 1, 1, 1,
0.5939501, -0.3807515, 1.602453, 1, 1, 1, 1, 1,
0.6058081, -1.125361, 3.829462, 0, 0, 1, 1, 1,
0.60679, -1.656041, 1.618346, 1, 0, 0, 1, 1,
0.607443, 0.523586, 0.99511, 1, 0, 0, 1, 1,
0.6099747, 1.93191, -0.2114221, 1, 0, 0, 1, 1,
0.6122346, 1.212063, 0.5574373, 1, 0, 0, 1, 1,
0.623836, -0.2150506, 1.347591, 1, 0, 0, 1, 1,
0.6250514, -0.6586426, 2.579521, 0, 0, 0, 1, 1,
0.6310955, -0.4517253, 2.775965, 0, 0, 0, 1, 1,
0.6343567, 0.3359295, -0.5387481, 0, 0, 0, 1, 1,
0.6344801, 0.1594996, 1.578273, 0, 0, 0, 1, 1,
0.6352173, 0.48916, 1.169593, 0, 0, 0, 1, 1,
0.6372696, -0.3580884, 3.623666, 0, 0, 0, 1, 1,
0.638001, -1.274483, 3.579729, 0, 0, 0, 1, 1,
0.6454996, 1.795218, 2.217999, 1, 1, 1, 1, 1,
0.6516787, -1.37588, 3.632852, 1, 1, 1, 1, 1,
0.6533439, -2.420254, 3.555236, 1, 1, 1, 1, 1,
0.6534497, -0.4321479, 2.702772, 1, 1, 1, 1, 1,
0.6607372, -1.763978, 2.637738, 1, 1, 1, 1, 1,
0.6650149, 0.8032618, 2.016956, 1, 1, 1, 1, 1,
0.6660526, 0.608128, 0.8320983, 1, 1, 1, 1, 1,
0.6687586, 1.061134, -1.308141, 1, 1, 1, 1, 1,
0.6715295, 0.2802266, -0.2956728, 1, 1, 1, 1, 1,
0.6715498, -0.2480358, 2.391796, 1, 1, 1, 1, 1,
0.6860838, -0.5123783, 3.090154, 1, 1, 1, 1, 1,
0.6867107, 0.273265, 0.02262738, 1, 1, 1, 1, 1,
0.6867253, -1.039866, 3.604794, 1, 1, 1, 1, 1,
0.6921496, 0.9899894, 0.6968084, 1, 1, 1, 1, 1,
0.6926229, 2.683549, 1.215614, 1, 1, 1, 1, 1,
0.6948184, 1.336873, -0.02801621, 0, 0, 1, 1, 1,
0.6972092, -0.1882174, 2.525178, 1, 0, 0, 1, 1,
0.7062002, -0.2856544, 2.048815, 1, 0, 0, 1, 1,
0.7165964, -0.3920383, 2.568607, 1, 0, 0, 1, 1,
0.7168695, -0.04701478, 0.3922819, 1, 0, 0, 1, 1,
0.7181076, -0.8962874, 3.379057, 1, 0, 0, 1, 1,
0.7282631, -0.803829, 3.510915, 0, 0, 0, 1, 1,
0.7291291, -0.9360807, 2.22819, 0, 0, 0, 1, 1,
0.7293034, 1.45078, 0.8720329, 0, 0, 0, 1, 1,
0.7356955, -0.2076584, 0.3506446, 0, 0, 0, 1, 1,
0.7395251, 0.1887197, 3.792658, 0, 0, 0, 1, 1,
0.741065, -1.4879, 3.632492, 0, 0, 0, 1, 1,
0.7447041, 1.187228, -2.015014, 0, 0, 0, 1, 1,
0.7459997, -0.6998817, 1.737641, 1, 1, 1, 1, 1,
0.748058, -0.3756868, 1.827016, 1, 1, 1, 1, 1,
0.7636088, 0.755704, 0.01435715, 1, 1, 1, 1, 1,
0.7675291, -0.0307531, 1.780456, 1, 1, 1, 1, 1,
0.768016, 0.4553682, 2.406028, 1, 1, 1, 1, 1,
0.7681521, 0.0117593, 1.355332, 1, 1, 1, 1, 1,
0.7706448, -0.7344164, 2.386933, 1, 1, 1, 1, 1,
0.7706502, 1.387401, -0.3636614, 1, 1, 1, 1, 1,
0.7768096, 1.072994, 1.077383, 1, 1, 1, 1, 1,
0.7780589, 1.266944, -0.1623466, 1, 1, 1, 1, 1,
0.7863046, -1.256485, 2.993304, 1, 1, 1, 1, 1,
0.7900106, -0.2374279, 3.138698, 1, 1, 1, 1, 1,
0.7900455, 1.048154, 1.200434, 1, 1, 1, 1, 1,
0.7944748, -1.027813, 1.550453, 1, 1, 1, 1, 1,
0.7993609, 0.8960497, 2.23652, 1, 1, 1, 1, 1,
0.8014714, 0.304181, 0.5904196, 0, 0, 1, 1, 1,
0.808028, -0.5588852, 3.910585, 1, 0, 0, 1, 1,
0.808567, -0.7904382, 2.304784, 1, 0, 0, 1, 1,
0.8101377, 0.6583483, 0.6102467, 1, 0, 0, 1, 1,
0.8151071, 0.1877772, 1.503516, 1, 0, 0, 1, 1,
0.8156495, -2.990923, 4.074553, 1, 0, 0, 1, 1,
0.8160424, 0.1876961, 1.675831, 0, 0, 0, 1, 1,
0.8187376, 0.2131999, 1.357281, 0, 0, 0, 1, 1,
0.8211092, -0.7011474, 1.504291, 0, 0, 0, 1, 1,
0.8257527, 1.220761, 0.2567862, 0, 0, 0, 1, 1,
0.8283391, 0.7173157, 0.1131001, 0, 0, 0, 1, 1,
0.8287656, -1.34725, 3.217489, 0, 0, 0, 1, 1,
0.8307971, -0.7453479, 0.8537869, 0, 0, 0, 1, 1,
0.8413351, 1.486375, 1.953235, 1, 1, 1, 1, 1,
0.8425572, -0.4955291, 2.752137, 1, 1, 1, 1, 1,
0.8487358, 1.799292, -0.3429444, 1, 1, 1, 1, 1,
0.8493859, 2.730911, 2.064871, 1, 1, 1, 1, 1,
0.8554559, 1.194493, 1.893545, 1, 1, 1, 1, 1,
0.8555031, 0.6703939, 0.4767965, 1, 1, 1, 1, 1,
0.8629779, 1.302752, -0.6133189, 1, 1, 1, 1, 1,
0.8639153, 0.09511948, 0.7207565, 1, 1, 1, 1, 1,
0.8726206, -0.1218939, 0.3694736, 1, 1, 1, 1, 1,
0.872995, -0.5999308, 4.041328, 1, 1, 1, 1, 1,
0.8845796, 1.654093, -0.5217395, 1, 1, 1, 1, 1,
0.8909457, 1.132491, -1.535927, 1, 1, 1, 1, 1,
0.8960828, 0.2715509, 2.151263, 1, 1, 1, 1, 1,
0.8981171, -0.001176935, 1.674371, 1, 1, 1, 1, 1,
0.9025546, 0.3474336, 1.426221, 1, 1, 1, 1, 1,
0.9088495, 0.4066457, 0.786768, 0, 0, 1, 1, 1,
0.9197499, 0.1872784, 1.590145, 1, 0, 0, 1, 1,
0.9221673, 0.748924, 0.6642017, 1, 0, 0, 1, 1,
0.9239336, -0.6123621, 0.9769143, 1, 0, 0, 1, 1,
0.9293981, 0.8818421, -0.02002635, 1, 0, 0, 1, 1,
0.9298517, 0.3879955, 1.810207, 1, 0, 0, 1, 1,
0.9381822, 0.03950045, 1.790197, 0, 0, 0, 1, 1,
0.9384545, 0.8131926, 1.260155, 0, 0, 0, 1, 1,
0.9387844, 2.569519, 0.6749687, 0, 0, 0, 1, 1,
0.945935, 0.5428746, 2.379097, 0, 0, 0, 1, 1,
0.9557157, -1.828744, 1.334338, 0, 0, 0, 1, 1,
0.9627246, 0.7056156, 1.252424, 0, 0, 0, 1, 1,
0.963468, -1.401006, 3.441786, 0, 0, 0, 1, 1,
0.9643546, 0.3534912, 1.665931, 1, 1, 1, 1, 1,
0.966738, -0.05092967, 2.354834, 1, 1, 1, 1, 1,
0.973095, 1.052242, 1.016774, 1, 1, 1, 1, 1,
0.9736806, 0.1918789, -0.2769105, 1, 1, 1, 1, 1,
0.9751858, -1.453467, 3.725245, 1, 1, 1, 1, 1,
0.9816927, 1.273242, -0.5218622, 1, 1, 1, 1, 1,
0.9840369, -0.9230265, 0.6289583, 1, 1, 1, 1, 1,
0.9856182, -0.3528755, 3.611837, 1, 1, 1, 1, 1,
0.9858579, -1.976231, 3.806196, 1, 1, 1, 1, 1,
0.994445, 0.2954234, 1.614235, 1, 1, 1, 1, 1,
0.9978312, -1.311965, 2.415191, 1, 1, 1, 1, 1,
1.004552, -1.090107, 1.284571, 1, 1, 1, 1, 1,
1.01008, 0.554974, 2.357272, 1, 1, 1, 1, 1,
1.015819, 0.8682491, 0.2344491, 1, 1, 1, 1, 1,
1.016278, -0.733664, 3.613338, 1, 1, 1, 1, 1,
1.01666, -1.090506, 0.9578489, 0, 0, 1, 1, 1,
1.020584, -1.112292, 0.8821127, 1, 0, 0, 1, 1,
1.03267, -0.107465, 1.458919, 1, 0, 0, 1, 1,
1.040923, -0.233811, 1.328983, 1, 0, 0, 1, 1,
1.044899, 0.6802997, -0.702911, 1, 0, 0, 1, 1,
1.045876, -0.9502578, 1.443505, 1, 0, 0, 1, 1,
1.046072, 0.1176367, 2.324302, 0, 0, 0, 1, 1,
1.049113, -0.7473459, 2.962463, 0, 0, 0, 1, 1,
1.051187, 1.060151, 0.1118636, 0, 0, 0, 1, 1,
1.052149, -0.1693529, 0.8763669, 0, 0, 0, 1, 1,
1.052535, 0.6300694, 2.409779, 0, 0, 0, 1, 1,
1.05603, 1.386003, 2.118684, 0, 0, 0, 1, 1,
1.065115, 1.477057, 1.214203, 0, 0, 0, 1, 1,
1.066156, 0.919077, -1.0573, 1, 1, 1, 1, 1,
1.069328, 1.678764, -0.9322273, 1, 1, 1, 1, 1,
1.075248, 0.7341647, 0.6569871, 1, 1, 1, 1, 1,
1.076155, -1.730428, 2.077105, 1, 1, 1, 1, 1,
1.077851, 0.05170137, 1.96137, 1, 1, 1, 1, 1,
1.097024, 0.5796731, 0.4181076, 1, 1, 1, 1, 1,
1.098234, -0.6561246, 1.88325, 1, 1, 1, 1, 1,
1.107569, -0.06192135, 0.3845122, 1, 1, 1, 1, 1,
1.120196, 0.09566218, 1.546055, 1, 1, 1, 1, 1,
1.128132, 1.475008, 2.120497, 1, 1, 1, 1, 1,
1.132553, -1.612052, 2.739531, 1, 1, 1, 1, 1,
1.133015, -2.03529, 2.180129, 1, 1, 1, 1, 1,
1.13626, 0.7564189, 0.7123078, 1, 1, 1, 1, 1,
1.137446, 0.2125476, 0.7600144, 1, 1, 1, 1, 1,
1.14659, -0.9388226, 1.59007, 1, 1, 1, 1, 1,
1.159358, 2.025175, 0.8586909, 0, 0, 1, 1, 1,
1.159684, -0.007085366, 0.7486479, 1, 0, 0, 1, 1,
1.160685, 0.03355452, 0.9438562, 1, 0, 0, 1, 1,
1.165753, 0.1375392, -0.2344178, 1, 0, 0, 1, 1,
1.168492, -0.5549059, 1.676826, 1, 0, 0, 1, 1,
1.173274, -1.701769, 4.323031, 1, 0, 0, 1, 1,
1.174375, -1.359908, 3.364267, 0, 0, 0, 1, 1,
1.17441, -0.4284345, 0.793305, 0, 0, 0, 1, 1,
1.175724, 0.1126975, 1.759828, 0, 0, 0, 1, 1,
1.177229, -0.1573336, 1.213174, 0, 0, 0, 1, 1,
1.187734, -1.013755, 2.496189, 0, 0, 0, 1, 1,
1.191494, -0.3045718, 3.277084, 0, 0, 0, 1, 1,
1.196325, -0.2834572, 2.64021, 0, 0, 0, 1, 1,
1.197403, -1.491862, 2.187022, 1, 1, 1, 1, 1,
1.199086, 0.9154556, -0.2404815, 1, 1, 1, 1, 1,
1.203604, -1.338665, 0.5822317, 1, 1, 1, 1, 1,
1.2143, 1.358628, -0.6492485, 1, 1, 1, 1, 1,
1.226464, 0.3226244, 1.788577, 1, 1, 1, 1, 1,
1.227371, 0.5214614, 0.2484197, 1, 1, 1, 1, 1,
1.2332, -0.1075849, 0.8509195, 1, 1, 1, 1, 1,
1.236212, 0.07816576, 0.9730331, 1, 1, 1, 1, 1,
1.237184, -0.1766138, 3.322665, 1, 1, 1, 1, 1,
1.23768, -0.02921049, 2.078792, 1, 1, 1, 1, 1,
1.258742, 1.208948, 0.01894712, 1, 1, 1, 1, 1,
1.260345, -2.343935, 1.532242, 1, 1, 1, 1, 1,
1.263546, -1.274935, 3.536253, 1, 1, 1, 1, 1,
1.264466, -0.7545006, 1.41755, 1, 1, 1, 1, 1,
1.272909, 1.19821, 1.297663, 1, 1, 1, 1, 1,
1.274234, 0.08655123, 2.081131, 0, 0, 1, 1, 1,
1.275172, -0.038354, 2.020424, 1, 0, 0, 1, 1,
1.279494, -0.06338806, 2.602011, 1, 0, 0, 1, 1,
1.291893, -0.6309658, 2.716481, 1, 0, 0, 1, 1,
1.307648, -0.7844089, 3.095513, 1, 0, 0, 1, 1,
1.319879, 0.2316729, 0.8868661, 1, 0, 0, 1, 1,
1.356711, 1.154931, 0.7274386, 0, 0, 0, 1, 1,
1.363072, 1.858895, 0.6336591, 0, 0, 0, 1, 1,
1.372167, -0.002935249, 0.4362434, 0, 0, 0, 1, 1,
1.374085, -0.06706695, 3.983782, 0, 0, 0, 1, 1,
1.376706, 0.6389087, 1.050093, 0, 0, 0, 1, 1,
1.400504, 0.4151813, 2.30582, 0, 0, 0, 1, 1,
1.407997, 0.5957408, 0.181701, 0, 0, 0, 1, 1,
1.40988, -0.210344, 0.7492392, 1, 1, 1, 1, 1,
1.417046, 1.159205, -0.2178032, 1, 1, 1, 1, 1,
1.422314, 1.765694, 1.660167, 1, 1, 1, 1, 1,
1.427552, -0.001229596, 2.25802, 1, 1, 1, 1, 1,
1.429987, -0.4623998, 2.260662, 1, 1, 1, 1, 1,
1.43283, 0.6724184, 1.476758, 1, 1, 1, 1, 1,
1.433707, -1.247904, 4.24097, 1, 1, 1, 1, 1,
1.444441, -1.547277, 2.353499, 1, 1, 1, 1, 1,
1.447206, -0.3684515, 0.2446389, 1, 1, 1, 1, 1,
1.451602, 1.271977, 1.165813, 1, 1, 1, 1, 1,
1.452466, -0.549786, 0.6430946, 1, 1, 1, 1, 1,
1.45592, -1.125878, 3.139532, 1, 1, 1, 1, 1,
1.459759, -0.06869636, 0.6556649, 1, 1, 1, 1, 1,
1.472147, 0.7180272, 2.227591, 1, 1, 1, 1, 1,
1.474744, 0.6711487, -0.2727743, 1, 1, 1, 1, 1,
1.482336, 0.4290393, 0.8443006, 0, 0, 1, 1, 1,
1.49038, 0.4588571, 1.671193, 1, 0, 0, 1, 1,
1.493149, 0.8106709, 2.845885, 1, 0, 0, 1, 1,
1.497251, -0.9582126, 2.058304, 1, 0, 0, 1, 1,
1.497542, 0.8624629, 0.5380868, 1, 0, 0, 1, 1,
1.503216, -1.320242, 1.966324, 1, 0, 0, 1, 1,
1.50909, 0.3199461, 2.129822, 0, 0, 0, 1, 1,
1.517811, -0.2177072, -0.1078823, 0, 0, 0, 1, 1,
1.51967, 1.391514, -0.09607349, 0, 0, 0, 1, 1,
1.5206, -1.83065, 1.935133, 0, 0, 0, 1, 1,
1.524209, 0.189512, 2.089897, 0, 0, 0, 1, 1,
1.533578, 0.2561734, 2.32309, 0, 0, 0, 1, 1,
1.571463, 0.4007617, 1.779202, 0, 0, 0, 1, 1,
1.585609, 0.3639793, 1.463053, 1, 1, 1, 1, 1,
1.59595, 0.5480074, 0.4779454, 1, 1, 1, 1, 1,
1.598459, -0.4782317, 2.051577, 1, 1, 1, 1, 1,
1.661288, -0.4140356, 3.606911, 1, 1, 1, 1, 1,
1.675806, -0.8018843, 0.1060527, 1, 1, 1, 1, 1,
1.679088, -0.8772293, 1.882835, 1, 1, 1, 1, 1,
1.692813, 1.368664, 0.4762523, 1, 1, 1, 1, 1,
1.694686, -0.2277287, 1.656345, 1, 1, 1, 1, 1,
1.697304, -1.31065, 1.616434, 1, 1, 1, 1, 1,
1.706176, -1.042316, 0.9835829, 1, 1, 1, 1, 1,
1.711668, -0.7489201, 0.933003, 1, 1, 1, 1, 1,
1.732285, 0.8691629, 1.709194, 1, 1, 1, 1, 1,
1.734327, -0.577688, 1.896926, 1, 1, 1, 1, 1,
1.735096, 0.3513447, -0.4701641, 1, 1, 1, 1, 1,
1.739362, 1.38063, 0.8512037, 1, 1, 1, 1, 1,
1.752444, 1.165838, 1.00748, 0, 0, 1, 1, 1,
1.781035, -1.348968, 1.879176, 1, 0, 0, 1, 1,
1.784253, -0.9608388, 0.7783957, 1, 0, 0, 1, 1,
1.79283, 0.1758095, 2.168045, 1, 0, 0, 1, 1,
1.836841, 1.142992, 0.3809438, 1, 0, 0, 1, 1,
1.839258, -0.06520927, 0.3955606, 1, 0, 0, 1, 1,
1.845424, 0.04372778, 1.017351, 0, 0, 0, 1, 1,
1.857677, -1.341607, 1.030019, 0, 0, 0, 1, 1,
1.863152, 0.05140414, 1.177256, 0, 0, 0, 1, 1,
1.869498, 0.7320155, 3.032395, 0, 0, 0, 1, 1,
1.873519, -0.8419629, 2.843341, 0, 0, 0, 1, 1,
1.886215, 1.964816, -0.6007544, 0, 0, 0, 1, 1,
1.89032, -0.2890215, 1.012156, 0, 0, 0, 1, 1,
1.904632, 0.4500885, 0.3629971, 1, 1, 1, 1, 1,
1.909833, -0.491121, 0.220311, 1, 1, 1, 1, 1,
1.917352, 1.514921, 2.238535, 1, 1, 1, 1, 1,
1.921224, -0.2489368, 0.5763251, 1, 1, 1, 1, 1,
1.934558, -0.05625653, 2.509391, 1, 1, 1, 1, 1,
1.939319, -0.7638887, 2.026087, 1, 1, 1, 1, 1,
1.942719, -0.1969429, 1.417013, 1, 1, 1, 1, 1,
1.942776, -0.3937007, 0.8301008, 1, 1, 1, 1, 1,
1.943215, 1.201539, -0.7966279, 1, 1, 1, 1, 1,
1.947411, -2.08385, 4.054898, 1, 1, 1, 1, 1,
1.987204, 0.1866096, 2.551105, 1, 1, 1, 1, 1,
1.991106, 0.3711961, 0.5639849, 1, 1, 1, 1, 1,
2.007659, 1.324981, 2.102644, 1, 1, 1, 1, 1,
2.023572, -1.350165, 3.10652, 1, 1, 1, 1, 1,
2.058469, 0.8240341, 1.898039, 1, 1, 1, 1, 1,
2.066666, -2.552335, 2.004599, 0, 0, 1, 1, 1,
2.074572, -1.103369, 2.401671, 1, 0, 0, 1, 1,
2.081948, -0.04597518, 1.968992, 1, 0, 0, 1, 1,
2.087088, 0.5804483, 1.098431, 1, 0, 0, 1, 1,
2.108228, 0.7314161, 1.977164, 1, 0, 0, 1, 1,
2.110871, 1.227175, 1.642434, 1, 0, 0, 1, 1,
2.125346, 0.8698586, 3.186766, 0, 0, 0, 1, 1,
2.149916, -0.09010586, 1.181861, 0, 0, 0, 1, 1,
2.150074, 0.05426523, 2.936947, 0, 0, 0, 1, 1,
2.178147, -0.2903625, 2.683564, 0, 0, 0, 1, 1,
2.236687, -0.007460952, 0.6252446, 0, 0, 0, 1, 1,
2.26963, 0.11541, 1.179698, 0, 0, 0, 1, 1,
2.480373, -0.1264463, 1.091368, 0, 0, 0, 1, 1,
2.509638, 1.478714, 0.3150875, 1, 1, 1, 1, 1,
2.528623, -1.075408, 1.667871, 1, 1, 1, 1, 1,
2.531249, -0.9822345, 1.958369, 1, 1, 1, 1, 1,
2.635483, -0.2099782, 0.7671245, 1, 1, 1, 1, 1,
2.637099, -0.259882, 0.866173, 1, 1, 1, 1, 1,
2.668463, 2.533016, -0.02452536, 1, 1, 1, 1, 1,
2.918957, -0.6000549, 1.266689, 1, 1, 1, 1, 1
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
var radius = 9.294327;
var distance = 32.64593;
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
mvMatrix.translate( 0.2356981, 0.0699501, 0.2638528 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.64593);
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