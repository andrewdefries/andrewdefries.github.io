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
-3.004478, -0.3922683, -1.800686, 1, 0, 0, 1,
-2.800362, 1.573743, -1.637658, 1, 0.007843138, 0, 1,
-2.782439, -0.1472449, -2.595841, 1, 0.01176471, 0, 1,
-2.51403, 0.3908323, -0.9854462, 1, 0.01960784, 0, 1,
-2.452045, 0.1404152, -0.868619, 1, 0.02352941, 0, 1,
-2.375974, 0.3320144, -0.2883313, 1, 0.03137255, 0, 1,
-2.35745, -1.915732, -1.856806, 1, 0.03529412, 0, 1,
-2.288504, 1.060045, -0.2338435, 1, 0.04313726, 0, 1,
-2.258883, -0.2916026, -0.5456374, 1, 0.04705882, 0, 1,
-2.253855, -0.8976431, -3.278075, 1, 0.05490196, 0, 1,
-2.190388, -0.7713174, -1.53696, 1, 0.05882353, 0, 1,
-2.165316, -0.6772704, -2.242184, 1, 0.06666667, 0, 1,
-2.130675, -0.62053, -0.9634855, 1, 0.07058824, 0, 1,
-2.126059, 0.7342145, -1.015564, 1, 0.07843138, 0, 1,
-2.108637, -2.071784, -2.747429, 1, 0.08235294, 0, 1,
-2.079729, 0.4194146, -0.2480201, 1, 0.09019608, 0, 1,
-2.077593, -0.9892137, -2.614025, 1, 0.09411765, 0, 1,
-2.075656, 0.9220309, -1.66308, 1, 0.1019608, 0, 1,
-2.013086, 0.7503444, -1.885253, 1, 0.1098039, 0, 1,
-1.996542, -0.6817079, -2.005469, 1, 0.1137255, 0, 1,
-1.955785, 1.255038, -1.342758, 1, 0.1215686, 0, 1,
-1.932545, -1.632746, -4.96179, 1, 0.1254902, 0, 1,
-1.928204, 0.2521842, -0.6771408, 1, 0.1333333, 0, 1,
-1.916415, 1.32158, -3.594478, 1, 0.1372549, 0, 1,
-1.903891, -0.2853141, -1.223622, 1, 0.145098, 0, 1,
-1.902224, 0.3733646, 0.3911308, 1, 0.1490196, 0, 1,
-1.891065, -0.8271544, -0.5774515, 1, 0.1568628, 0, 1,
-1.878621, 0.3983578, -2.108872, 1, 0.1607843, 0, 1,
-1.871804, 0.5207052, -1.597192, 1, 0.1686275, 0, 1,
-1.868194, 0.8436178, -2.53567, 1, 0.172549, 0, 1,
-1.864377, 0.02302572, -2.430338, 1, 0.1803922, 0, 1,
-1.82371, 0.983488, -2.93269, 1, 0.1843137, 0, 1,
-1.818004, 1.167844, -1.768049, 1, 0.1921569, 0, 1,
-1.814474, -0.6414105, -1.688485, 1, 0.1960784, 0, 1,
-1.792018, -1.795102, -2.484648, 1, 0.2039216, 0, 1,
-1.786454, -1.083298, -2.222927, 1, 0.2117647, 0, 1,
-1.782823, -0.9681796, -2.134471, 1, 0.2156863, 0, 1,
-1.778076, -2.129837, -3.040931, 1, 0.2235294, 0, 1,
-1.77216, -1.114309, -0.2829199, 1, 0.227451, 0, 1,
-1.757604, 1.253026, 0.3308151, 1, 0.2352941, 0, 1,
-1.747997, 0.2249909, -0.9128273, 1, 0.2392157, 0, 1,
-1.723794, -0.01169713, -2.203061, 1, 0.2470588, 0, 1,
-1.723452, -0.9768434, -1.806249, 1, 0.2509804, 0, 1,
-1.717491, 0.7404795, -0.3157786, 1, 0.2588235, 0, 1,
-1.693986, -1.961001, -1.891875, 1, 0.2627451, 0, 1,
-1.681304, -0.8030453, -2.488422, 1, 0.2705882, 0, 1,
-1.661698, -2.105069, -2.221507, 1, 0.2745098, 0, 1,
-1.658462, -0.4110098, -1.459321, 1, 0.282353, 0, 1,
-1.656588, 0.7905495, -2.088634, 1, 0.2862745, 0, 1,
-1.632991, -0.7916252, -1.654298, 1, 0.2941177, 0, 1,
-1.599537, 0.7961529, -0.2904073, 1, 0.3019608, 0, 1,
-1.595349, -0.9523409, -3.87732, 1, 0.3058824, 0, 1,
-1.593441, 0.3260342, -0.09588122, 1, 0.3137255, 0, 1,
-1.589703, 0.1973381, -0.6907736, 1, 0.3176471, 0, 1,
-1.583839, -0.8876674, -3.696932, 1, 0.3254902, 0, 1,
-1.58305, -0.5718195, -0.4223258, 1, 0.3294118, 0, 1,
-1.557939, 0.7212234, -1.721552, 1, 0.3372549, 0, 1,
-1.5569, 1.005628, -0.5268479, 1, 0.3411765, 0, 1,
-1.553001, 2.150943, -1.703826, 1, 0.3490196, 0, 1,
-1.55284, 0.01278045, -0.9286351, 1, 0.3529412, 0, 1,
-1.549468, -0.6392775, -1.134285, 1, 0.3607843, 0, 1,
-1.528703, -1.024203, -2.761414, 1, 0.3647059, 0, 1,
-1.524637, 1.334418, -2.586986, 1, 0.372549, 0, 1,
-1.510692, 0.4877056, -1.787452, 1, 0.3764706, 0, 1,
-1.509376, -0.3385945, -2.647187, 1, 0.3843137, 0, 1,
-1.50511, -0.5158574, -1.54531, 1, 0.3882353, 0, 1,
-1.50141, 0.6877264, -2.376022, 1, 0.3960784, 0, 1,
-1.48913, -0.7226601, -2.505633, 1, 0.4039216, 0, 1,
-1.485309, 0.5661814, 0.2527081, 1, 0.4078431, 0, 1,
-1.483167, -0.5837096, -1.932766, 1, 0.4156863, 0, 1,
-1.475892, 0.4282482, -1.109177, 1, 0.4196078, 0, 1,
-1.47347, -0.2553809, -1.118623, 1, 0.427451, 0, 1,
-1.469715, 0.5885676, -2.128394, 1, 0.4313726, 0, 1,
-1.462658, -0.3418144, -0.3816217, 1, 0.4392157, 0, 1,
-1.460186, 0.0308267, -2.58544, 1, 0.4431373, 0, 1,
-1.452728, 0.9097976, -1.531027, 1, 0.4509804, 0, 1,
-1.445944, -0.8144248, -3.055585, 1, 0.454902, 0, 1,
-1.439351, -1.756953, -2.442929, 1, 0.4627451, 0, 1,
-1.431446, 1.193486, -0.665834, 1, 0.4666667, 0, 1,
-1.427418, -1.572269, -3.120249, 1, 0.4745098, 0, 1,
-1.424899, 2.116001, -0.0428194, 1, 0.4784314, 0, 1,
-1.424206, 1.067888, 0.9728457, 1, 0.4862745, 0, 1,
-1.421924, -0.543985, -1.769601, 1, 0.4901961, 0, 1,
-1.417357, -1.099155, -2.371979, 1, 0.4980392, 0, 1,
-1.41505, 0.2720732, -2.323533, 1, 0.5058824, 0, 1,
-1.406916, 0.03263045, -3.373106, 1, 0.509804, 0, 1,
-1.40584, -0.6695014, -2.713872, 1, 0.5176471, 0, 1,
-1.399636, 0.2444343, -2.07411, 1, 0.5215687, 0, 1,
-1.391876, 0.7603776, -0.9962248, 1, 0.5294118, 0, 1,
-1.387436, -0.3801036, 0.4007474, 1, 0.5333334, 0, 1,
-1.379833, 0.8411093, 0.3478908, 1, 0.5411765, 0, 1,
-1.35635, -1.192832, -3.920832, 1, 0.5450981, 0, 1,
-1.352837, 0.1227614, -0.6962911, 1, 0.5529412, 0, 1,
-1.351837, -1.35574, -1.842247, 1, 0.5568628, 0, 1,
-1.351213, -0.4669103, -2.106886, 1, 0.5647059, 0, 1,
-1.348967, -0.3639971, -3.161417, 1, 0.5686275, 0, 1,
-1.34049, -0.6936244, -3.69829, 1, 0.5764706, 0, 1,
-1.340065, 0.2174307, -1.62365, 1, 0.5803922, 0, 1,
-1.330329, 0.5996421, -1.382003, 1, 0.5882353, 0, 1,
-1.328841, -0.005354778, -1.64356, 1, 0.5921569, 0, 1,
-1.32666, -1.355271, -2.396373, 1, 0.6, 0, 1,
-1.322406, -0.3158514, -2.116692, 1, 0.6078432, 0, 1,
-1.276929, -0.02164053, -1.886218, 1, 0.6117647, 0, 1,
-1.276103, 0.1969069, -0.6612243, 1, 0.6196079, 0, 1,
-1.272694, 1.058084, -1.965984, 1, 0.6235294, 0, 1,
-1.267005, 2.164319, 0.03941449, 1, 0.6313726, 0, 1,
-1.26648, 0.6094657, -1.637673, 1, 0.6352941, 0, 1,
-1.249838, 0.4936042, -0.9710571, 1, 0.6431373, 0, 1,
-1.24881, -0.6205046, -2.17182, 1, 0.6470588, 0, 1,
-1.243002, 0.8405008, -0.09779859, 1, 0.654902, 0, 1,
-1.242619, -1.006804, -2.792318, 1, 0.6588235, 0, 1,
-1.241297, 0.4413365, -0.1261105, 1, 0.6666667, 0, 1,
-1.241159, 0.3896279, -1.665001, 1, 0.6705883, 0, 1,
-1.23969, 0.1539674, -1.484687, 1, 0.6784314, 0, 1,
-1.234999, 0.3620021, 0.1443905, 1, 0.682353, 0, 1,
-1.233455, 0.3822941, -0.5552754, 1, 0.6901961, 0, 1,
-1.233024, 0.9930816, 0.4720005, 1, 0.6941177, 0, 1,
-1.211255, 0.7508655, -2.515159, 1, 0.7019608, 0, 1,
-1.19162, -0.7355184, -3.698905, 1, 0.7098039, 0, 1,
-1.190096, 0.186843, -0.2288107, 1, 0.7137255, 0, 1,
-1.183673, -1.468889, -3.265865, 1, 0.7215686, 0, 1,
-1.17383, 0.9824463, -1.429345, 1, 0.7254902, 0, 1,
-1.169036, -0.0786979, -0.6492466, 1, 0.7333333, 0, 1,
-1.168387, 2.542758, -1.323564, 1, 0.7372549, 0, 1,
-1.164942, -1.187623, -3.310182, 1, 0.7450981, 0, 1,
-1.156908, -0.5670173, -2.93003, 1, 0.7490196, 0, 1,
-1.155362, 1.397102, -0.3983188, 1, 0.7568628, 0, 1,
-1.147825, 1.070052, -1.11281, 1, 0.7607843, 0, 1,
-1.146046, 0.8055103, 0.3266346, 1, 0.7686275, 0, 1,
-1.143716, 0.6143484, 0.227651, 1, 0.772549, 0, 1,
-1.135569, 1.796115, -1.311752, 1, 0.7803922, 0, 1,
-1.133137, 0.988227, -2.255173, 1, 0.7843137, 0, 1,
-1.122843, -0.3068314, -1.885936, 1, 0.7921569, 0, 1,
-1.106307, 0.6780083, -1.041496, 1, 0.7960784, 0, 1,
-1.094843, -0.1741319, -0.7889415, 1, 0.8039216, 0, 1,
-1.08646, 0.2317813, -2.261122, 1, 0.8117647, 0, 1,
-1.084921, 2.325156, -0.4289919, 1, 0.8156863, 0, 1,
-1.084305, -0.5742322, -1.429714, 1, 0.8235294, 0, 1,
-1.080443, 0.5579752, -0.6994428, 1, 0.827451, 0, 1,
-1.07746, -0.771975, -2.099245, 1, 0.8352941, 0, 1,
-1.071013, 0.5418898, -1.949928, 1, 0.8392157, 0, 1,
-1.054932, -0.6896198, -3.196092, 1, 0.8470588, 0, 1,
-1.054135, 0.4823384, -0.8023422, 1, 0.8509804, 0, 1,
-1.050489, -0.4517481, -3.375011, 1, 0.8588235, 0, 1,
-1.048751, -0.2659761, -1.159233, 1, 0.8627451, 0, 1,
-1.047494, -1.205483, -0.5558673, 1, 0.8705882, 0, 1,
-1.04126, -0.9254329, -0.08308354, 1, 0.8745098, 0, 1,
-1.039969, 1.185962, 1.160621, 1, 0.8823529, 0, 1,
-1.038731, -0.9469416, -2.211015, 1, 0.8862745, 0, 1,
-1.034501, -0.8462981, -1.216673, 1, 0.8941177, 0, 1,
-1.031584, -0.2542026, -0.5427011, 1, 0.8980392, 0, 1,
-1.029941, 0.4887013, -0.5270515, 1, 0.9058824, 0, 1,
-1.027899, 1.473697, -2.32355, 1, 0.9137255, 0, 1,
-1.024729, 0.01406609, -0.4339049, 1, 0.9176471, 0, 1,
-1.014953, 1.692288, -0.2830808, 1, 0.9254902, 0, 1,
-1.001958, -0.5643029, -1.623324, 1, 0.9294118, 0, 1,
-1.001468, 1.749068, -0.2462619, 1, 0.9372549, 0, 1,
-0.9920148, -0.2139121, -0.5773921, 1, 0.9411765, 0, 1,
-0.9913358, -0.1563237, -1.511809, 1, 0.9490196, 0, 1,
-0.9894184, -1.456523, -3.843221, 1, 0.9529412, 0, 1,
-0.985822, -2.409287, -3.560537, 1, 0.9607843, 0, 1,
-0.9705353, 0.7152628, -0.9050695, 1, 0.9647059, 0, 1,
-0.9649705, -0.380575, -2.253244, 1, 0.972549, 0, 1,
-0.9545581, -0.2262535, -2.40845, 1, 0.9764706, 0, 1,
-0.951589, 1.119768, -0.4445206, 1, 0.9843137, 0, 1,
-0.9468847, 0.7173325, -0.5954468, 1, 0.9882353, 0, 1,
-0.9424296, 0.9867976, -0.3747709, 1, 0.9960784, 0, 1,
-0.9421888, 0.7612231, 0.1790853, 0.9960784, 1, 0, 1,
-0.9217017, -0.6238686, -3.740994, 0.9921569, 1, 0, 1,
-0.9139238, -1.33892, -1.352269, 0.9843137, 1, 0, 1,
-0.913595, -0.1167451, -2.181176, 0.9803922, 1, 0, 1,
-0.9107041, -0.786062, -2.487, 0.972549, 1, 0, 1,
-0.9106733, 0.4329911, -0.2324581, 0.9686275, 1, 0, 1,
-0.9048592, 1.261217, -0.7431792, 0.9607843, 1, 0, 1,
-0.9037386, 0.04290478, -0.7250981, 0.9568627, 1, 0, 1,
-0.8971598, 0.7907916, -0.8150671, 0.9490196, 1, 0, 1,
-0.8947549, 2.176871, -0.221735, 0.945098, 1, 0, 1,
-0.8880446, -1.182896, -2.610983, 0.9372549, 1, 0, 1,
-0.8807952, -0.3824111, -2.347124, 0.9333333, 1, 0, 1,
-0.8731823, -0.3614028, -0.5688204, 0.9254902, 1, 0, 1,
-0.8711717, -1.683063, -3.164247, 0.9215686, 1, 0, 1,
-0.864229, 1.106238, -0.05761159, 0.9137255, 1, 0, 1,
-0.8603691, -0.3852153, -2.212503, 0.9098039, 1, 0, 1,
-0.8520839, -0.3472562, -2.025953, 0.9019608, 1, 0, 1,
-0.8424488, 0.8826369, 0.3260983, 0.8941177, 1, 0, 1,
-0.8307236, 0.3996902, -1.931791, 0.8901961, 1, 0, 1,
-0.8293987, 0.4169724, -1.462997, 0.8823529, 1, 0, 1,
-0.8218764, -1.072136, -3.659797, 0.8784314, 1, 0, 1,
-0.8212851, -0.1201355, -3.168042, 0.8705882, 1, 0, 1,
-0.8156594, -1.266318, -1.243148, 0.8666667, 1, 0, 1,
-0.8141832, -1.066154, -2.888601, 0.8588235, 1, 0, 1,
-0.8128995, -0.6661379, -1.598359, 0.854902, 1, 0, 1,
-0.8106201, 0.2384834, 0.4515488, 0.8470588, 1, 0, 1,
-0.8085279, 1.239885, -0.124811, 0.8431373, 1, 0, 1,
-0.8081776, 0.2729619, -1.836611, 0.8352941, 1, 0, 1,
-0.8074775, 0.9421985, -1.718999, 0.8313726, 1, 0, 1,
-0.806784, -0.8002304, -3.018887, 0.8235294, 1, 0, 1,
-0.8000801, 0.398246, -1.622212, 0.8196079, 1, 0, 1,
-0.7911885, 0.3259963, -2.023499, 0.8117647, 1, 0, 1,
-0.7911818, 1.152665, -2.437598, 0.8078431, 1, 0, 1,
-0.7871159, -0.09150189, -2.037351, 0.8, 1, 0, 1,
-0.7757914, -0.2609432, -2.982044, 0.7921569, 1, 0, 1,
-0.7757722, 1.086634, 0.7261009, 0.7882353, 1, 0, 1,
-0.7673934, -0.5089775, -4.05605, 0.7803922, 1, 0, 1,
-0.767211, -0.3418932, -1.88097, 0.7764706, 1, 0, 1,
-0.7625763, 0.06882256, -0.8552898, 0.7686275, 1, 0, 1,
-0.759868, -0.02522294, -1.15019, 0.7647059, 1, 0, 1,
-0.7577507, 1.149021, 0.2017191, 0.7568628, 1, 0, 1,
-0.7577379, 0.1472879, -1.305903, 0.7529412, 1, 0, 1,
-0.7568895, -0.6739193, -2.997985, 0.7450981, 1, 0, 1,
-0.7553395, 0.5252945, -1.557835, 0.7411765, 1, 0, 1,
-0.7552336, 0.5166451, -0.3342057, 0.7333333, 1, 0, 1,
-0.7515793, 0.5841948, -0.8011193, 0.7294118, 1, 0, 1,
-0.7470627, -0.5593634, -2.570903, 0.7215686, 1, 0, 1,
-0.7466335, -0.7188474, -3.087996, 0.7176471, 1, 0, 1,
-0.7456523, 1.884006, 0.8373559, 0.7098039, 1, 0, 1,
-0.7418812, -0.494724, -1.06085, 0.7058824, 1, 0, 1,
-0.7390252, -0.7843412, -0.6339919, 0.6980392, 1, 0, 1,
-0.7348388, 0.3574767, -0.8240489, 0.6901961, 1, 0, 1,
-0.7335768, -0.02090008, 0.9357138, 0.6862745, 1, 0, 1,
-0.7288266, 0.7526534, -1.791456, 0.6784314, 1, 0, 1,
-0.7260225, -0.009050508, -1.79244, 0.6745098, 1, 0, 1,
-0.7234517, -0.2978882, -3.122655, 0.6666667, 1, 0, 1,
-0.7197775, -0.1770812, -1.927658, 0.6627451, 1, 0, 1,
-0.7178573, -0.3072697, -1.761574, 0.654902, 1, 0, 1,
-0.7128235, 0.05739865, -0.6847556, 0.6509804, 1, 0, 1,
-0.7119353, 1.62817, -1.017091, 0.6431373, 1, 0, 1,
-0.7112104, 0.235576, -2.351227, 0.6392157, 1, 0, 1,
-0.7109582, -0.8856856, -3.099297, 0.6313726, 1, 0, 1,
-0.7109526, 1.751414, 0.7719359, 0.627451, 1, 0, 1,
-0.7045923, 0.07571768, -2.560048, 0.6196079, 1, 0, 1,
-0.7044127, -1.918511, -0.9906341, 0.6156863, 1, 0, 1,
-0.6873327, -0.6182353, -1.391175, 0.6078432, 1, 0, 1,
-0.686843, -1.365265, -1.951102, 0.6039216, 1, 0, 1,
-0.6838781, -1.688284, -2.029036, 0.5960785, 1, 0, 1,
-0.6794794, 0.3810019, -0.002368045, 0.5882353, 1, 0, 1,
-0.674982, -0.4041972, -1.64277, 0.5843138, 1, 0, 1,
-0.6738254, -0.1053256, -1.694684, 0.5764706, 1, 0, 1,
-0.6734954, 0.7817982, -0.05164556, 0.572549, 1, 0, 1,
-0.6703947, 0.08476581, -3.283608, 0.5647059, 1, 0, 1,
-0.6692035, -1.235621, -4.175142, 0.5607843, 1, 0, 1,
-0.6673918, 0.4230785, 0.4175431, 0.5529412, 1, 0, 1,
-0.6640518, 0.6248561, -1.033887, 0.5490196, 1, 0, 1,
-0.6587314, 1.594952, -0.1402156, 0.5411765, 1, 0, 1,
-0.655265, -0.1933063, -1.111165, 0.5372549, 1, 0, 1,
-0.6527453, -1.431944, -3.385069, 0.5294118, 1, 0, 1,
-0.6488062, 1.17778, -1.451717, 0.5254902, 1, 0, 1,
-0.647987, 2.070076, -0.7769759, 0.5176471, 1, 0, 1,
-0.6400207, 0.2620493, -0.9633361, 0.5137255, 1, 0, 1,
-0.6387987, 0.2041295, -1.015424, 0.5058824, 1, 0, 1,
-0.6327142, 1.993539, -1.220646, 0.5019608, 1, 0, 1,
-0.630822, 0.1584655, -1.061925, 0.4941176, 1, 0, 1,
-0.6284948, 0.272627, -2.553791, 0.4862745, 1, 0, 1,
-0.6259618, 1.206106, 1.625776, 0.4823529, 1, 0, 1,
-0.6139085, -0.8184167, -2.742621, 0.4745098, 1, 0, 1,
-0.6130956, 0.6269025, -0.4724655, 0.4705882, 1, 0, 1,
-0.6122749, 0.1113553, 0.646485, 0.4627451, 1, 0, 1,
-0.6117052, -0.3722882, -3.975321, 0.4588235, 1, 0, 1,
-0.6069568, 0.2090845, -0.05887612, 0.4509804, 1, 0, 1,
-0.6065772, 0.8272544, 0.5496932, 0.4470588, 1, 0, 1,
-0.6007197, -0.9213451, -1.316684, 0.4392157, 1, 0, 1,
-0.5993413, -0.01259274, -1.25818, 0.4352941, 1, 0, 1,
-0.5992302, 0.6663812, 1.266231, 0.427451, 1, 0, 1,
-0.5969061, 0.7289978, -0.4465573, 0.4235294, 1, 0, 1,
-0.5958637, -0.04478915, -2.717008, 0.4156863, 1, 0, 1,
-0.5923622, -0.7664274, -4.097448, 0.4117647, 1, 0, 1,
-0.5895652, -0.1710379, -2.727123, 0.4039216, 1, 0, 1,
-0.5888594, 0.4756771, -2.133208, 0.3960784, 1, 0, 1,
-0.5885024, -0.6108811, -2.086236, 0.3921569, 1, 0, 1,
-0.5821189, 1.118703, 0.0345757, 0.3843137, 1, 0, 1,
-0.5765311, -0.6802854, -0.8765653, 0.3803922, 1, 0, 1,
-0.5763714, -0.2006121, 0.850908, 0.372549, 1, 0, 1,
-0.5733114, -0.8341588, -3.191465, 0.3686275, 1, 0, 1,
-0.5717229, -1.57881, -2.334932, 0.3607843, 1, 0, 1,
-0.5663824, 1.300454, -1.13815, 0.3568628, 1, 0, 1,
-0.5635417, -1.423918, -2.325291, 0.3490196, 1, 0, 1,
-0.5574191, 0.6022987, -0.6656232, 0.345098, 1, 0, 1,
-0.555515, -0.4722477, -3.926395, 0.3372549, 1, 0, 1,
-0.5530678, 1.679133, 0.7663134, 0.3333333, 1, 0, 1,
-0.5528491, 0.2002986, -0.05737954, 0.3254902, 1, 0, 1,
-0.5524943, -1.09501, -3.300519, 0.3215686, 1, 0, 1,
-0.5494063, -0.03309985, -2.649112, 0.3137255, 1, 0, 1,
-0.5455201, 0.5664891, -2.056791, 0.3098039, 1, 0, 1,
-0.5444379, -0.6137607, -2.514364, 0.3019608, 1, 0, 1,
-0.5440078, -2.303302, -0.07741131, 0.2941177, 1, 0, 1,
-0.539394, -1.772293, -2.653301, 0.2901961, 1, 0, 1,
-0.5390732, -0.3497374, -2.368878, 0.282353, 1, 0, 1,
-0.5389318, 0.7991219, 0.9971393, 0.2784314, 1, 0, 1,
-0.5379069, -0.5223742, -4.022281, 0.2705882, 1, 0, 1,
-0.530843, 0.3337952, -1.633445, 0.2666667, 1, 0, 1,
-0.5306442, 1.559298, -1.749475, 0.2588235, 1, 0, 1,
-0.5255078, 1.148744, -0.8335469, 0.254902, 1, 0, 1,
-0.5186148, 2.338732, 0.3162372, 0.2470588, 1, 0, 1,
-0.5170501, -0.1266857, -3.108624, 0.2431373, 1, 0, 1,
-0.5156363, -0.9982947, -2.713283, 0.2352941, 1, 0, 1,
-0.5114657, -0.9265655, -2.2004, 0.2313726, 1, 0, 1,
-0.5013204, 0.2457219, -0.7460952, 0.2235294, 1, 0, 1,
-0.5005307, 0.235708, -1.324098, 0.2196078, 1, 0, 1,
-0.5003168, 1.101341, -1.385942, 0.2117647, 1, 0, 1,
-0.4944115, 0.09537581, -1.346228, 0.2078431, 1, 0, 1,
-0.4928053, 0.3148135, -0.6953667, 0.2, 1, 0, 1,
-0.4857233, 0.642884, -0.217957, 0.1921569, 1, 0, 1,
-0.4855583, 0.6063201, -0.4154892, 0.1882353, 1, 0, 1,
-0.4794418, -0.5761077, -2.843382, 0.1803922, 1, 0, 1,
-0.4771751, 0.3324639, -0.7858374, 0.1764706, 1, 0, 1,
-0.4765599, 0.5537084, -0.7536327, 0.1686275, 1, 0, 1,
-0.4728766, 0.3105673, 0.1371328, 0.1647059, 1, 0, 1,
-0.472372, 0.002437709, -3.04301, 0.1568628, 1, 0, 1,
-0.4650038, 0.5692134, 0.08791821, 0.1529412, 1, 0, 1,
-0.4638002, -0.9576829, -2.740924, 0.145098, 1, 0, 1,
-0.4627283, 1.146561, 1.424553, 0.1411765, 1, 0, 1,
-0.4617597, 0.554791, -1.193035, 0.1333333, 1, 0, 1,
-0.4614482, 0.9236546, -0.7501369, 0.1294118, 1, 0, 1,
-0.4609771, 0.2414836, 0.048313, 0.1215686, 1, 0, 1,
-0.4539464, -1.327195, -2.442921, 0.1176471, 1, 0, 1,
-0.4536387, -0.5653004, -3.403636, 0.1098039, 1, 0, 1,
-0.4455831, -1.039316, -2.061343, 0.1058824, 1, 0, 1,
-0.4363101, -0.846341, -3.569533, 0.09803922, 1, 0, 1,
-0.4288206, -0.2408644, -1.628116, 0.09019608, 1, 0, 1,
-0.4273763, -1.771686, -1.528905, 0.08627451, 1, 0, 1,
-0.4249668, 2.159489, -0.4528072, 0.07843138, 1, 0, 1,
-0.423474, 0.1660999, -1.699327, 0.07450981, 1, 0, 1,
-0.4215754, 0.6864825, -0.5622141, 0.06666667, 1, 0, 1,
-0.4200877, 0.04437309, -2.157364, 0.0627451, 1, 0, 1,
-0.4192961, -1.857585, -1.170778, 0.05490196, 1, 0, 1,
-0.4191228, -1.36986, -4.198956, 0.05098039, 1, 0, 1,
-0.4157084, 0.858852, -0.2487416, 0.04313726, 1, 0, 1,
-0.4139544, 0.9850714, -0.835393, 0.03921569, 1, 0, 1,
-0.4116256, -1.221084, -3.672364, 0.03137255, 1, 0, 1,
-0.4110982, 0.1297356, 1.489726, 0.02745098, 1, 0, 1,
-0.4050347, 0.256749, -0.7418291, 0.01960784, 1, 0, 1,
-0.4033657, 0.0689797, -0.6176348, 0.01568628, 1, 0, 1,
-0.3995743, 1.233756, 0.4191861, 0.007843138, 1, 0, 1,
-0.3966199, 0.3663836, -1.188883, 0.003921569, 1, 0, 1,
-0.396174, 1.55547, 0.03269278, 0, 1, 0.003921569, 1,
-0.3935191, 1.4261, 0.3206451, 0, 1, 0.01176471, 1,
-0.3920296, -0.4804238, -3.194898, 0, 1, 0.01568628, 1,
-0.3772866, 0.1473635, -0.7093946, 0, 1, 0.02352941, 1,
-0.3682263, 0.5802684, -0.3851079, 0, 1, 0.02745098, 1,
-0.3674528, -1.192481, -2.745357, 0, 1, 0.03529412, 1,
-0.3653894, -1.733877, -4.029005, 0, 1, 0.03921569, 1,
-0.3630081, 1.941199, -0.532521, 0, 1, 0.04705882, 1,
-0.3552622, 0.8593009, 0.05506931, 0, 1, 0.05098039, 1,
-0.3521563, 1.408163, -1.066284, 0, 1, 0.05882353, 1,
-0.3506116, -2.16192, -3.120359, 0, 1, 0.0627451, 1,
-0.3466074, -1.447313, -2.681395, 0, 1, 0.07058824, 1,
-0.3440877, -1.114499, -3.408859, 0, 1, 0.07450981, 1,
-0.3440366, -1.231941, -3.073436, 0, 1, 0.08235294, 1,
-0.338207, -1.066585, -3.114186, 0, 1, 0.08627451, 1,
-0.3322445, 0.3911303, -0.2771241, 0, 1, 0.09411765, 1,
-0.3303221, -1.015994, -2.693499, 0, 1, 0.1019608, 1,
-0.3278231, 0.1148514, -1.027547, 0, 1, 0.1058824, 1,
-0.3182903, 0.3040465, -1.367057, 0, 1, 0.1137255, 1,
-0.3182001, 0.7994375, -1.832604, 0, 1, 0.1176471, 1,
-0.3157308, 0.2074483, 0.2276817, 0, 1, 0.1254902, 1,
-0.3156001, 0.1463091, -0.1626339, 0, 1, 0.1294118, 1,
-0.3154016, 0.211985, 0.2745112, 0, 1, 0.1372549, 1,
-0.3136807, 0.8440567, -1.415147, 0, 1, 0.1411765, 1,
-0.3131375, -0.258511, -4.006935, 0, 1, 0.1490196, 1,
-0.3130815, 0.6792367, -0.8008302, 0, 1, 0.1529412, 1,
-0.3091799, -0.01390834, -2.591011, 0, 1, 0.1607843, 1,
-0.3083531, -0.7930205, -2.197828, 0, 1, 0.1647059, 1,
-0.3080017, 0.8817152, 1.253368, 0, 1, 0.172549, 1,
-0.3072331, 0.7897401, -1.313506, 0, 1, 0.1764706, 1,
-0.3067026, -0.98494, -2.087727, 0, 1, 0.1843137, 1,
-0.305507, 0.8407096, -2.338597, 0, 1, 0.1882353, 1,
-0.296598, -0.5973426, -2.755312, 0, 1, 0.1960784, 1,
-0.2940107, 0.8877558, -0.1496492, 0, 1, 0.2039216, 1,
-0.29245, 0.8024858, 0.7116399, 0, 1, 0.2078431, 1,
-0.2912149, 0.4128711, 0.1372669, 0, 1, 0.2156863, 1,
-0.2905279, -1.574802, -3.416322, 0, 1, 0.2196078, 1,
-0.2901631, -0.9018091, -5.563724, 0, 1, 0.227451, 1,
-0.2891307, -0.03822308, -0.604606, 0, 1, 0.2313726, 1,
-0.2862023, -0.5285627, -2.78544, 0, 1, 0.2392157, 1,
-0.2856875, 0.5994102, -1.096271, 0, 1, 0.2431373, 1,
-0.2851046, -1.86379, -3.00803, 0, 1, 0.2509804, 1,
-0.2848465, 0.3209132, -0.02877004, 0, 1, 0.254902, 1,
-0.2838275, 0.3439923, -0.1824097, 0, 1, 0.2627451, 1,
-0.2830449, -1.304385, -2.402818, 0, 1, 0.2666667, 1,
-0.2801031, 0.8198453, 0.5052859, 0, 1, 0.2745098, 1,
-0.277958, -0.4961729, -2.572111, 0, 1, 0.2784314, 1,
-0.272974, 0.2661328, -1.538916, 0, 1, 0.2862745, 1,
-0.2626012, 0.2929142, 1.05358, 0, 1, 0.2901961, 1,
-0.261672, -1.342572, -1.962701, 0, 1, 0.2980392, 1,
-0.2599254, -0.5136421, -2.84441, 0, 1, 0.3058824, 1,
-0.2593463, 0.9249786, -1.634247, 0, 1, 0.3098039, 1,
-0.2584769, -0.7470728, -3.099741, 0, 1, 0.3176471, 1,
-0.2562337, -0.04952971, -2.52292, 0, 1, 0.3215686, 1,
-0.24965, 1.361964, -1.151053, 0, 1, 0.3294118, 1,
-0.247324, -0.3324671, -0.434108, 0, 1, 0.3333333, 1,
-0.2429104, 0.5368447, 0.5108988, 0, 1, 0.3411765, 1,
-0.2386832, 0.989404, 0.874207, 0, 1, 0.345098, 1,
-0.2340654, 1.315859, 0.2272721, 0, 1, 0.3529412, 1,
-0.2330034, 0.2183198, -0.7311201, 0, 1, 0.3568628, 1,
-0.2320083, 0.2388621, -1.137162, 0, 1, 0.3647059, 1,
-0.2304226, 1.601774, 1.561639, 0, 1, 0.3686275, 1,
-0.2304201, -0.458099, -2.493348, 0, 1, 0.3764706, 1,
-0.2290737, -0.2184928, -2.508489, 0, 1, 0.3803922, 1,
-0.2268152, -0.8634757, -2.196054, 0, 1, 0.3882353, 1,
-0.2265433, 0.788941, 1.108308, 0, 1, 0.3921569, 1,
-0.2264442, -0.7945099, -1.589689, 0, 1, 0.4, 1,
-0.2261361, -1.033359, -2.289071, 0, 1, 0.4078431, 1,
-0.22182, 0.6460766, 0.3674457, 0, 1, 0.4117647, 1,
-0.2216994, -0.2828235, -2.102027, 0, 1, 0.4196078, 1,
-0.2187996, -0.382648, -2.373076, 0, 1, 0.4235294, 1,
-0.215425, 0.1462463, -0.1400723, 0, 1, 0.4313726, 1,
-0.2132477, 0.01861528, -0.49658, 0, 1, 0.4352941, 1,
-0.2094166, -2.19207, -1.695448, 0, 1, 0.4431373, 1,
-0.2083878, -0.4153263, -4.352301, 0, 1, 0.4470588, 1,
-0.2079994, 0.8030295, 0.5574658, 0, 1, 0.454902, 1,
-0.2038538, -1.770894, -4.073444, 0, 1, 0.4588235, 1,
-0.200072, 0.4108509, -0.608396, 0, 1, 0.4666667, 1,
-0.1925588, 0.9911695, 0.1241715, 0, 1, 0.4705882, 1,
-0.1923352, 0.9464189, 1.073807, 0, 1, 0.4784314, 1,
-0.1923291, -0.4894978, -0.8765978, 0, 1, 0.4823529, 1,
-0.1894146, 0.212867, -1.054548, 0, 1, 0.4901961, 1,
-0.1890144, -0.2453215, -1.401698, 0, 1, 0.4941176, 1,
-0.1852054, 0.5499586, -2.620477, 0, 1, 0.5019608, 1,
-0.1839267, -0.07892123, -0.2816351, 0, 1, 0.509804, 1,
-0.1815461, -0.2404169, -3.396762, 0, 1, 0.5137255, 1,
-0.1800826, -0.9464058, -2.226918, 0, 1, 0.5215687, 1,
-0.1796046, 0.07154816, -3.253646, 0, 1, 0.5254902, 1,
-0.1794149, -1.03274, -1.598031, 0, 1, 0.5333334, 1,
-0.1777426, -1.64282, -3.667674, 0, 1, 0.5372549, 1,
-0.1773885, -1.600092, -2.414118, 0, 1, 0.5450981, 1,
-0.1754867, -0.5863239, -3.98247, 0, 1, 0.5490196, 1,
-0.1719473, 1.219122, -0.2010433, 0, 1, 0.5568628, 1,
-0.1718506, -1.146598, -3.75199, 0, 1, 0.5607843, 1,
-0.1701421, -0.4481956, -2.430692, 0, 1, 0.5686275, 1,
-0.1693547, -1.688151, -1.697554, 0, 1, 0.572549, 1,
-0.1664733, 0.1039577, 0.6528838, 0, 1, 0.5803922, 1,
-0.1636573, 0.3335298, 0.2611853, 0, 1, 0.5843138, 1,
-0.1629594, 0.08029606, 0.9734521, 0, 1, 0.5921569, 1,
-0.1577728, -0.5932192, -3.450745, 0, 1, 0.5960785, 1,
-0.1536485, -0.9042132, -3.380989, 0, 1, 0.6039216, 1,
-0.1533509, -1.967596, -3.617686, 0, 1, 0.6117647, 1,
-0.153243, -1.060428, -1.870651, 0, 1, 0.6156863, 1,
-0.1504885, -0.444788, -2.050236, 0, 1, 0.6235294, 1,
-0.148838, -0.161261, -2.118617, 0, 1, 0.627451, 1,
-0.1484114, -0.4592439, -1.765237, 0, 1, 0.6352941, 1,
-0.1437371, 1.385, 1.101481, 0, 1, 0.6392157, 1,
-0.1432751, -0.270061, -1.971721, 0, 1, 0.6470588, 1,
-0.1406734, 0.8131991, -1.119117, 0, 1, 0.6509804, 1,
-0.140163, 0.6970198, -1.60639, 0, 1, 0.6588235, 1,
-0.1380765, 0.166828, -1.993937, 0, 1, 0.6627451, 1,
-0.1354044, -1.182216, -3.388473, 0, 1, 0.6705883, 1,
-0.1337534, -0.6483114, -1.497836, 0, 1, 0.6745098, 1,
-0.1286198, -0.2419031, -2.78349, 0, 1, 0.682353, 1,
-0.1243855, -0.5593027, -3.319287, 0, 1, 0.6862745, 1,
-0.118816, -0.9522506, -3.513392, 0, 1, 0.6941177, 1,
-0.1074888, -0.78078, -3.507914, 0, 1, 0.7019608, 1,
-0.1046444, 0.1380119, -0.4316894, 0, 1, 0.7058824, 1,
-0.1036406, -1.110685, -2.685301, 0, 1, 0.7137255, 1,
-0.1020872, 1.425485, -0.2310861, 0, 1, 0.7176471, 1,
-0.101851, -0.5723627, -2.388989, 0, 1, 0.7254902, 1,
-0.1010465, -1.471049, -3.346735, 0, 1, 0.7294118, 1,
-0.09733637, 1.372329, -0.692599, 0, 1, 0.7372549, 1,
-0.09653358, 0.9466525, -2.167532, 0, 1, 0.7411765, 1,
-0.0964179, -0.1935149, -2.096112, 0, 1, 0.7490196, 1,
-0.09522343, -1.255697, -4.549486, 0, 1, 0.7529412, 1,
-0.09518916, -1.78752, -2.643111, 0, 1, 0.7607843, 1,
-0.09454262, 1.072549, -0.285989, 0, 1, 0.7647059, 1,
-0.08590285, 0.7440234, -0.9478698, 0, 1, 0.772549, 1,
-0.08497771, -0.9248667, -3.066309, 0, 1, 0.7764706, 1,
-0.08269641, 1.013064, -0.6490272, 0, 1, 0.7843137, 1,
-0.08206213, -1.25522, -4.649092, 0, 1, 0.7882353, 1,
-0.0817352, 1.306682, 0.1676484, 0, 1, 0.7960784, 1,
-0.0789977, -0.3611941, -2.269604, 0, 1, 0.8039216, 1,
-0.07299938, -0.5616149, -2.140994, 0, 1, 0.8078431, 1,
-0.06876127, 0.3520231, -0.2508437, 0, 1, 0.8156863, 1,
-0.06546826, -0.2943445, -2.318194, 0, 1, 0.8196079, 1,
-0.06140848, 0.8261512, 0.1189362, 0, 1, 0.827451, 1,
-0.05744454, 0.8523225, -1.892035, 0, 1, 0.8313726, 1,
-0.0568402, -2.333513, -2.837648, 0, 1, 0.8392157, 1,
-0.05347279, 1.334863, 0.3326184, 0, 1, 0.8431373, 1,
-0.05300047, -0.4407678, -1.785903, 0, 1, 0.8509804, 1,
-0.0524589, -0.7991131, -3.839129, 0, 1, 0.854902, 1,
-0.05197605, -0.5493079, -2.508204, 0, 1, 0.8627451, 1,
-0.04538402, -0.3011051, -1.099689, 0, 1, 0.8666667, 1,
-0.03895034, -1.596448, -4.31568, 0, 1, 0.8745098, 1,
-0.03891284, -1.48907, -3.117211, 0, 1, 0.8784314, 1,
-0.03853772, -0.2247346, -2.883334, 0, 1, 0.8862745, 1,
-0.03308985, 1.546505, -0.5726523, 0, 1, 0.8901961, 1,
-0.03261217, 0.2782297, -0.5925542, 0, 1, 0.8980392, 1,
-0.02551012, 1.250595, 0.9299039, 0, 1, 0.9058824, 1,
-0.0232103, 1.732541, -0.9149451, 0, 1, 0.9098039, 1,
-0.02266127, -0.182457, -3.096211, 0, 1, 0.9176471, 1,
-0.01846781, 1.212255, -0.1473164, 0, 1, 0.9215686, 1,
-0.01653847, -0.3099585, -2.127193, 0, 1, 0.9294118, 1,
-0.01643313, 0.6193781, 0.2343608, 0, 1, 0.9333333, 1,
-0.01466046, -2.792962, -3.837663, 0, 1, 0.9411765, 1,
-0.01179986, -0.305319, -1.601602, 0, 1, 0.945098, 1,
-0.01107579, -0.7220995, -5.181613, 0, 1, 0.9529412, 1,
-0.009243365, -1.919155, -3.1425, 0, 1, 0.9568627, 1,
-0.008465102, -0.5255192, -4.534767, 0, 1, 0.9647059, 1,
-0.006226081, -0.7702609, -2.788837, 0, 1, 0.9686275, 1,
-0.003549404, -1.463224, -3.396382, 0, 1, 0.9764706, 1,
0.003763537, 0.8184446, 0.1560493, 0, 1, 0.9803922, 1,
0.005798891, 0.8354381, -0.2980566, 0, 1, 0.9882353, 1,
0.006299389, -1.60946, 3.680885, 0, 1, 0.9921569, 1,
0.006685866, 0.05845132, -0.9805791, 0, 1, 1, 1,
0.008925985, -0.02155834, 4.336006, 0, 0.9921569, 1, 1,
0.01352134, -1.660084, 5.133305, 0, 0.9882353, 1, 1,
0.01619441, 0.7473332, -1.615714, 0, 0.9803922, 1, 1,
0.02221973, 0.30149, -1.034278, 0, 0.9764706, 1, 1,
0.02646331, -0.3951463, 3.422498, 0, 0.9686275, 1, 1,
0.02849246, 0.02468397, 1.795584, 0, 0.9647059, 1, 1,
0.02859788, -0.9961894, 4.107506, 0, 0.9568627, 1, 1,
0.03640509, -0.8817495, 3.626264, 0, 0.9529412, 1, 1,
0.03653899, 0.4763175, 0.7771566, 0, 0.945098, 1, 1,
0.03686417, 0.504905, -1.04043, 0, 0.9411765, 1, 1,
0.04532247, -0.1474669, 2.671671, 0, 0.9333333, 1, 1,
0.04707438, -0.988883, 4.132798, 0, 0.9294118, 1, 1,
0.05079411, -1.019794, 1.246016, 0, 0.9215686, 1, 1,
0.0513868, 0.469873, -1.167864, 0, 0.9176471, 1, 1,
0.06111505, 0.8600908, 1.712389, 0, 0.9098039, 1, 1,
0.0646265, -0.05573262, 2.425699, 0, 0.9058824, 1, 1,
0.06825344, 0.3363247, -1.950186, 0, 0.8980392, 1, 1,
0.07266464, 0.4847854, 1.629015, 0, 0.8901961, 1, 1,
0.07410076, 1.60026, 0.246874, 0, 0.8862745, 1, 1,
0.07551358, 0.8581657, 0.1203823, 0, 0.8784314, 1, 1,
0.07986679, 0.4079657, -0.957697, 0, 0.8745098, 1, 1,
0.08656415, 0.612518, -0.6052478, 0, 0.8666667, 1, 1,
0.0906374, 0.6333486, 0.2522289, 0, 0.8627451, 1, 1,
0.09548172, 1.478523, -0.3225175, 0, 0.854902, 1, 1,
0.09934033, 0.1899282, 0.260471, 0, 0.8509804, 1, 1,
0.09939457, 0.4769909, 0.8124346, 0, 0.8431373, 1, 1,
0.1058698, -0.524007, 5.028949, 0, 0.8392157, 1, 1,
0.1120308, -2.073314, 1.40815, 0, 0.8313726, 1, 1,
0.1122451, 1.040814, -0.7161933, 0, 0.827451, 1, 1,
0.1176908, -0.3692328, 3.57045, 0, 0.8196079, 1, 1,
0.1177683, -1.05642, 1.970883, 0, 0.8156863, 1, 1,
0.1293293, -0.8769439, 3.818137, 0, 0.8078431, 1, 1,
0.1297718, -0.5195158, 4.000442, 0, 0.8039216, 1, 1,
0.1310672, -1.516278, 3.495842, 0, 0.7960784, 1, 1,
0.1327896, 0.7388635, -1.058143, 0, 0.7882353, 1, 1,
0.1368439, 0.8550872, -0.7862892, 0, 0.7843137, 1, 1,
0.1400636, -0.08550445, 2.016874, 0, 0.7764706, 1, 1,
0.1404967, -1.297433, 2.861586, 0, 0.772549, 1, 1,
0.144672, 0.7323237, 1.346475, 0, 0.7647059, 1, 1,
0.1466921, -0.3624164, 3.369873, 0, 0.7607843, 1, 1,
0.1520704, -1.099526, 3.714192, 0, 0.7529412, 1, 1,
0.1529978, -0.7157292, 2.325342, 0, 0.7490196, 1, 1,
0.157402, -1.0565, 2.787167, 0, 0.7411765, 1, 1,
0.1580841, -0.108117, 1.847802, 0, 0.7372549, 1, 1,
0.158256, -0.2944125, 3.267884, 0, 0.7294118, 1, 1,
0.1604927, -0.03198817, 0.6080498, 0, 0.7254902, 1, 1,
0.1611786, -0.2456612, 1.974903, 0, 0.7176471, 1, 1,
0.1613423, -0.7985767, 6.06143, 0, 0.7137255, 1, 1,
0.1709271, -0.5055835, 0.8282301, 0, 0.7058824, 1, 1,
0.1713156, -0.5372661, 2.272969, 0, 0.6980392, 1, 1,
0.1745002, -0.09848335, 1.250542, 0, 0.6941177, 1, 1,
0.1778402, -0.223408, 4.950949, 0, 0.6862745, 1, 1,
0.18008, 0.255897, 0.4772769, 0, 0.682353, 1, 1,
0.1832964, -1.266831, 3.27743, 0, 0.6745098, 1, 1,
0.1851965, 1.977262, 0.1399624, 0, 0.6705883, 1, 1,
0.1894704, -0.2127565, 0.8812363, 0, 0.6627451, 1, 1,
0.1912683, 1.302632, -0.1615611, 0, 0.6588235, 1, 1,
0.1932137, -0.4587197, 3.296336, 0, 0.6509804, 1, 1,
0.1950332, 0.8493176, 0.4579909, 0, 0.6470588, 1, 1,
0.1963972, 0.2456088, 1.171532, 0, 0.6392157, 1, 1,
0.2050661, 0.167116, 1.898549, 0, 0.6352941, 1, 1,
0.205133, -0.1147573, 2.583944, 0, 0.627451, 1, 1,
0.2073657, 0.3205751, 2.151842, 0, 0.6235294, 1, 1,
0.2075748, 1.204186, 0.5376906, 0, 0.6156863, 1, 1,
0.2110249, -0.4950762, 3.854237, 0, 0.6117647, 1, 1,
0.2152516, 0.1098807, 1.267907, 0, 0.6039216, 1, 1,
0.2163634, 0.6526787, 0.1824808, 0, 0.5960785, 1, 1,
0.2192396, -0.2053611, 3.025316, 0, 0.5921569, 1, 1,
0.2253679, 0.7599002, 1.865623, 0, 0.5843138, 1, 1,
0.2288906, 0.1709381, 1.651057, 0, 0.5803922, 1, 1,
0.2316137, -1.347884, 2.504125, 0, 0.572549, 1, 1,
0.232812, -1.102631, 2.588317, 0, 0.5686275, 1, 1,
0.2356357, -1.124612, 1.818893, 0, 0.5607843, 1, 1,
0.235784, -1.468608, 4.122894, 0, 0.5568628, 1, 1,
0.2387086, -0.8770874, 4.119933, 0, 0.5490196, 1, 1,
0.2389158, 0.5494004, 0.8232743, 0, 0.5450981, 1, 1,
0.2405428, -0.5054909, 4.025348, 0, 0.5372549, 1, 1,
0.2426206, 1.601039, -0.9644353, 0, 0.5333334, 1, 1,
0.2432282, 0.2489018, -0.3627512, 0, 0.5254902, 1, 1,
0.2435025, -1.193882, 2.644872, 0, 0.5215687, 1, 1,
0.2476009, 0.7441096, -0.3558835, 0, 0.5137255, 1, 1,
0.2494624, 1.561327, 0.01967768, 0, 0.509804, 1, 1,
0.2496911, -0.5880797, 1.691784, 0, 0.5019608, 1, 1,
0.2499852, -0.06697543, 3.02284, 0, 0.4941176, 1, 1,
0.2505009, -1.878175, 2.051765, 0, 0.4901961, 1, 1,
0.251008, 1.470821, 1.83565, 0, 0.4823529, 1, 1,
0.2512417, -0.2998634, 2.623185, 0, 0.4784314, 1, 1,
0.2568507, 0.02635923, 2.065038, 0, 0.4705882, 1, 1,
0.2604748, -0.2291065, 0.3318287, 0, 0.4666667, 1, 1,
0.2636328, -0.6896949, 2.552364, 0, 0.4588235, 1, 1,
0.2654244, 0.4632384, -0.3838738, 0, 0.454902, 1, 1,
0.2659541, 2.728259, -0.4067408, 0, 0.4470588, 1, 1,
0.270881, -0.7734576, 3.807699, 0, 0.4431373, 1, 1,
0.2766164, 0.2514828, 3.201751, 0, 0.4352941, 1, 1,
0.2766741, 0.49238, -1.301306, 0, 0.4313726, 1, 1,
0.2771454, 0.2082761, -0.1043378, 0, 0.4235294, 1, 1,
0.2781053, 1.201092, 0.7332575, 0, 0.4196078, 1, 1,
0.2784323, 0.249621, 3.111165, 0, 0.4117647, 1, 1,
0.280035, 1.099947, 0.1660871, 0, 0.4078431, 1, 1,
0.2815613, -0.4687918, 1.44506, 0, 0.4, 1, 1,
0.2826068, -0.2505507, 0.6570965, 0, 0.3921569, 1, 1,
0.2832639, -0.9051331, 3.56881, 0, 0.3882353, 1, 1,
0.2850072, 1.198202, -0.4835053, 0, 0.3803922, 1, 1,
0.2860374, 1.5658, -1.056648, 0, 0.3764706, 1, 1,
0.2910885, -0.5695275, 4.427263, 0, 0.3686275, 1, 1,
0.2973399, -1.925686, 4.24196, 0, 0.3647059, 1, 1,
0.3028336, 0.1063136, -0.1744143, 0, 0.3568628, 1, 1,
0.3057964, 0.7675869, -0.7280518, 0, 0.3529412, 1, 1,
0.3066006, 0.779196, 0.6386459, 0, 0.345098, 1, 1,
0.3078254, -2.056272, 1.391068, 0, 0.3411765, 1, 1,
0.3115712, 0.09920114, 0.7329634, 0, 0.3333333, 1, 1,
0.3132636, -2.289848, 2.776309, 0, 0.3294118, 1, 1,
0.3151328, 1.807695, -1.344351, 0, 0.3215686, 1, 1,
0.3159552, -0.5537992, 2.666914, 0, 0.3176471, 1, 1,
0.3161205, 1.232965, -0.5095159, 0, 0.3098039, 1, 1,
0.320252, 0.6156119, -1.384053, 0, 0.3058824, 1, 1,
0.3280825, 0.69178, 1.382683, 0, 0.2980392, 1, 1,
0.3302147, 0.06116026, 1.463304, 0, 0.2901961, 1, 1,
0.3304199, 0.3262598, 1.369656, 0, 0.2862745, 1, 1,
0.3369394, -0.03566808, 1.437469, 0, 0.2784314, 1, 1,
0.340073, 0.2387374, 2.992789, 0, 0.2745098, 1, 1,
0.343166, 0.697504, 1.383954, 0, 0.2666667, 1, 1,
0.3442824, -0.3579537, 1.973949, 0, 0.2627451, 1, 1,
0.3503801, 0.7207668, 1.179364, 0, 0.254902, 1, 1,
0.3555087, -0.6612895, 2.526667, 0, 0.2509804, 1, 1,
0.3565893, 0.5880609, 2.256838, 0, 0.2431373, 1, 1,
0.357578, -1.015414, 3.975199, 0, 0.2392157, 1, 1,
0.3591867, -0.1196432, 1.854571, 0, 0.2313726, 1, 1,
0.3618754, 1.198203, -0.6286306, 0, 0.227451, 1, 1,
0.362588, 1.272028, 1.393145, 0, 0.2196078, 1, 1,
0.3653752, 0.02283761, 1.155862, 0, 0.2156863, 1, 1,
0.3692675, 0.9554062, 2.968942, 0, 0.2078431, 1, 1,
0.3717301, 0.1107562, 3.043025, 0, 0.2039216, 1, 1,
0.3723399, 0.2511397, 2.246448, 0, 0.1960784, 1, 1,
0.3727852, -0.6393497, 3.200132, 0, 0.1882353, 1, 1,
0.3742116, 0.2681671, -0.4036018, 0, 0.1843137, 1, 1,
0.3802882, -1.275181, 3.63073, 0, 0.1764706, 1, 1,
0.3822466, -0.790918, 1.810658, 0, 0.172549, 1, 1,
0.3823721, -1.289822, 3.706381, 0, 0.1647059, 1, 1,
0.3834493, 0.02033207, 0.7844034, 0, 0.1607843, 1, 1,
0.3862424, 1.51938, 0.002087837, 0, 0.1529412, 1, 1,
0.3867956, -1.06566, 1.88523, 0, 0.1490196, 1, 1,
0.3988328, 0.2902524, 2.282362, 0, 0.1411765, 1, 1,
0.3993106, 0.820667, 1.242312, 0, 0.1372549, 1, 1,
0.3997344, -0.409303, 2.234991, 0, 0.1294118, 1, 1,
0.4008284, -1.939635, 3.610571, 0, 0.1254902, 1, 1,
0.4019606, -0.481597, 2.964796, 0, 0.1176471, 1, 1,
0.4036574, -1.268902, 1.033003, 0, 0.1137255, 1, 1,
0.4044475, -0.1420054, 0.5893643, 0, 0.1058824, 1, 1,
0.4110664, 1.178316, -1.444815, 0, 0.09803922, 1, 1,
0.4112027, 1.144989, -0.8661951, 0, 0.09411765, 1, 1,
0.4160696, 0.9987888, 0.5030981, 0, 0.08627451, 1, 1,
0.4210621, 0.06858365, 2.048479, 0, 0.08235294, 1, 1,
0.4276778, -1.405913, 3.38205, 0, 0.07450981, 1, 1,
0.4280754, -0.06666518, 1.266691, 0, 0.07058824, 1, 1,
0.4321327, 0.09995077, 2.068423, 0, 0.0627451, 1, 1,
0.432207, -1.332486, 1.109081, 0, 0.05882353, 1, 1,
0.4324969, -0.4417652, 2.263434, 0, 0.05098039, 1, 1,
0.4355129, -0.5884311, 1.632509, 0, 0.04705882, 1, 1,
0.4365305, -0.7739275, 3.935072, 0, 0.03921569, 1, 1,
0.436751, 0.5743721, 2.003803, 0, 0.03529412, 1, 1,
0.4388333, -0.3613346, 1.753196, 0, 0.02745098, 1, 1,
0.4404857, 1.809097, 0.4795933, 0, 0.02352941, 1, 1,
0.4407132, 0.6925198, 1.347481, 0, 0.01568628, 1, 1,
0.4409766, -0.1170561, 1.907487, 0, 0.01176471, 1, 1,
0.4467174, 0.2539904, -0.2086959, 0, 0.003921569, 1, 1,
0.4468636, 0.9878495, -0.7101954, 0.003921569, 0, 1, 1,
0.451197, 2.317135, 0.1400229, 0.007843138, 0, 1, 1,
0.4522077, -1.292291, 2.067912, 0.01568628, 0, 1, 1,
0.452303, -0.5122226, 2.083471, 0.01960784, 0, 1, 1,
0.4528001, 1.939313, -1.149084, 0.02745098, 0, 1, 1,
0.4556121, -0.2141192, 3.163832, 0.03137255, 0, 1, 1,
0.4607461, 0.225916, 1.401202, 0.03921569, 0, 1, 1,
0.4628076, -0.2463538, 2.723747, 0.04313726, 0, 1, 1,
0.4632639, 0.1782957, 1.839618, 0.05098039, 0, 1, 1,
0.4640494, -0.5133356, 3.581376, 0.05490196, 0, 1, 1,
0.4655587, -0.2453445, 2.99158, 0.0627451, 0, 1, 1,
0.4658939, 1.111003, 0.4451122, 0.06666667, 0, 1, 1,
0.4662382, -0.4137366, 1.121496, 0.07450981, 0, 1, 1,
0.4780644, -0.2079214, 1.173341, 0.07843138, 0, 1, 1,
0.4800284, -0.6538222, 2.64345, 0.08627451, 0, 1, 1,
0.4820421, -0.4294979, 1.506779, 0.09019608, 0, 1, 1,
0.4906699, 1.32541, -0.02725201, 0.09803922, 0, 1, 1,
0.4919299, -1.851115, 3.152448, 0.1058824, 0, 1, 1,
0.5035639, -0.4520548, 0.599151, 0.1098039, 0, 1, 1,
0.5084764, -0.5523931, 2.045971, 0.1176471, 0, 1, 1,
0.5158944, 0.2171602, 0.4758303, 0.1215686, 0, 1, 1,
0.5216129, -0.8999637, 2.603942, 0.1294118, 0, 1, 1,
0.5236233, -0.1424286, 0.4174547, 0.1333333, 0, 1, 1,
0.5236772, 0.3148671, -0.3649919, 0.1411765, 0, 1, 1,
0.5270767, 0.3392657, 1.886217, 0.145098, 0, 1, 1,
0.5282722, 0.6955574, -0.3725637, 0.1529412, 0, 1, 1,
0.5299329, -0.04384309, 1.304292, 0.1568628, 0, 1, 1,
0.5351526, -0.4001332, 2.163622, 0.1647059, 0, 1, 1,
0.5362366, -1.197173, 3.025996, 0.1686275, 0, 1, 1,
0.5423139, 1.198662, 0.1493289, 0.1764706, 0, 1, 1,
0.5434602, 0.9890077, 0.241766, 0.1803922, 0, 1, 1,
0.5453938, -0.9175548, 1.939778, 0.1882353, 0, 1, 1,
0.5453971, -0.8065819, 2.025455, 0.1921569, 0, 1, 1,
0.5454559, 0.4383215, -0.07337262, 0.2, 0, 1, 1,
0.5505002, -0.708371, 1.059589, 0.2078431, 0, 1, 1,
0.5574641, -0.6388981, 2.360511, 0.2117647, 0, 1, 1,
0.5581992, -0.1945809, 1.461215, 0.2196078, 0, 1, 1,
0.570646, -0.03069553, 1.394822, 0.2235294, 0, 1, 1,
0.5716717, 0.4660123, 0.6972651, 0.2313726, 0, 1, 1,
0.5745325, -0.8813679, 3.438156, 0.2352941, 0, 1, 1,
0.5747902, -1.380306, 2.268871, 0.2431373, 0, 1, 1,
0.5832598, -0.5087545, 1.965979, 0.2470588, 0, 1, 1,
0.5873454, 1.413262, -0.9500412, 0.254902, 0, 1, 1,
0.5892435, -0.07453527, 1.015144, 0.2588235, 0, 1, 1,
0.5917721, 1.312146, -0.6526978, 0.2666667, 0, 1, 1,
0.5979322, -0.7743132, 2.617249, 0.2705882, 0, 1, 1,
0.5981624, -0.9564275, 3.790521, 0.2784314, 0, 1, 1,
0.5989424, -0.3842934, 2.252812, 0.282353, 0, 1, 1,
0.6000312, -0.1306848, 0.4007283, 0.2901961, 0, 1, 1,
0.6024402, -0.3101229, 0.5048674, 0.2941177, 0, 1, 1,
0.6038617, 1.91769, -0.4998736, 0.3019608, 0, 1, 1,
0.6086395, -0.4284251, 3.068798, 0.3098039, 0, 1, 1,
0.6138648, -0.5683957, 2.323768, 0.3137255, 0, 1, 1,
0.6149395, -1.361934, 3.4411, 0.3215686, 0, 1, 1,
0.6195763, -0.3336587, 1.753924, 0.3254902, 0, 1, 1,
0.6293895, -0.3936564, 3.13958, 0.3333333, 0, 1, 1,
0.6312987, -1.136239, 2.214527, 0.3372549, 0, 1, 1,
0.6352235, 0.5165475, 2.978814, 0.345098, 0, 1, 1,
0.6390964, 1.248238, 0.7280404, 0.3490196, 0, 1, 1,
0.6402099, 0.09235489, 1.929482, 0.3568628, 0, 1, 1,
0.640779, -1.948832, 0.735312, 0.3607843, 0, 1, 1,
0.6425171, 0.3917867, 2.372957, 0.3686275, 0, 1, 1,
0.6425995, 0.8116225, 1.359312, 0.372549, 0, 1, 1,
0.6437159, 0.3415073, 1.032215, 0.3803922, 0, 1, 1,
0.6444459, 0.2656808, 2.121794, 0.3843137, 0, 1, 1,
0.6512014, -1.561869, 3.290787, 0.3921569, 0, 1, 1,
0.6567015, -1.644765, 3.696665, 0.3960784, 0, 1, 1,
0.6609156, 0.460275, 0.4047188, 0.4039216, 0, 1, 1,
0.6638644, 1.741275, -1.600279, 0.4117647, 0, 1, 1,
0.6658198, -1.490121, 1.478033, 0.4156863, 0, 1, 1,
0.6701655, -0.6405668, 1.113257, 0.4235294, 0, 1, 1,
0.6770495, -1.092223, 3.953329, 0.427451, 0, 1, 1,
0.6801211, 0.8785905, 3.184158, 0.4352941, 0, 1, 1,
0.682406, -0.09917025, 3.954133, 0.4392157, 0, 1, 1,
0.68493, 0.5004609, -0.1545597, 0.4470588, 0, 1, 1,
0.6881282, 1.433155, -2.032938, 0.4509804, 0, 1, 1,
0.6914386, 0.9202356, -0.3591543, 0.4588235, 0, 1, 1,
0.6923082, 0.1644147, 0.7574704, 0.4627451, 0, 1, 1,
0.6924785, 0.8194107, -1.451264, 0.4705882, 0, 1, 1,
0.6930684, 1.98705, -0.3972543, 0.4745098, 0, 1, 1,
0.6954197, -0.9965059, 0.9426754, 0.4823529, 0, 1, 1,
0.7040743, -0.2489937, 1.506948, 0.4862745, 0, 1, 1,
0.7056336, 0.1870566, 0.4550096, 0.4941176, 0, 1, 1,
0.7093946, -0.04906972, 2.971075, 0.5019608, 0, 1, 1,
0.7103622, 0.06351382, 0.2961556, 0.5058824, 0, 1, 1,
0.7130058, -0.1289476, 2.15219, 0.5137255, 0, 1, 1,
0.7142737, -0.4930636, 1.123401, 0.5176471, 0, 1, 1,
0.7157066, 0.6019826, -1.355702, 0.5254902, 0, 1, 1,
0.7225504, 0.8447207, -0.5909709, 0.5294118, 0, 1, 1,
0.7252829, -0.260922, 2.576534, 0.5372549, 0, 1, 1,
0.7258516, 0.4608047, 2.051607, 0.5411765, 0, 1, 1,
0.7267225, -0.433168, 1.563953, 0.5490196, 0, 1, 1,
0.7279498, -0.3894702, 3.39157, 0.5529412, 0, 1, 1,
0.729924, 0.8850945, 0.1222877, 0.5607843, 0, 1, 1,
0.736495, 2.7984, -1.626887, 0.5647059, 0, 1, 1,
0.7386737, -1.368084, 1.333668, 0.572549, 0, 1, 1,
0.7392632, -0.4622497, 1.521168, 0.5764706, 0, 1, 1,
0.7410632, -0.3995865, 3.544595, 0.5843138, 0, 1, 1,
0.7468291, -0.195879, 1.452429, 0.5882353, 0, 1, 1,
0.7486014, -0.7815714, -0.009806681, 0.5960785, 0, 1, 1,
0.7506529, -0.6020058, 2.361528, 0.6039216, 0, 1, 1,
0.7515085, 0.319062, 0.8895724, 0.6078432, 0, 1, 1,
0.7522632, -1.821233, 3.697398, 0.6156863, 0, 1, 1,
0.7564207, -0.9412715, 2.427562, 0.6196079, 0, 1, 1,
0.7604805, 2.01019, 0.2041496, 0.627451, 0, 1, 1,
0.7616204, 0.5944021, 1.060102, 0.6313726, 0, 1, 1,
0.7621547, 1.06939, 1.160189, 0.6392157, 0, 1, 1,
0.7645296, -0.1820969, 1.992743, 0.6431373, 0, 1, 1,
0.7647243, -0.23509, 2.19873, 0.6509804, 0, 1, 1,
0.7671861, -0.5905874, 1.147451, 0.654902, 0, 1, 1,
0.7679007, -1.509429, 2.602878, 0.6627451, 0, 1, 1,
0.7717125, 0.7180117, 0.6856717, 0.6666667, 0, 1, 1,
0.7785707, 1.098515, 1.228597, 0.6745098, 0, 1, 1,
0.7810596, 1.257889, -0.343554, 0.6784314, 0, 1, 1,
0.781912, -0.3497196, 0.7625943, 0.6862745, 0, 1, 1,
0.7913199, 0.5800775, 0.111195, 0.6901961, 0, 1, 1,
0.7948968, 1.31111, 1.577706, 0.6980392, 0, 1, 1,
0.8007358, 1.280562, 1.019398, 0.7058824, 0, 1, 1,
0.8034613, -1.287993, 1.339096, 0.7098039, 0, 1, 1,
0.8040106, -0.2118126, 2.208687, 0.7176471, 0, 1, 1,
0.807641, 0.5654194, 0.8051351, 0.7215686, 0, 1, 1,
0.815511, -0.9051405, 2.972889, 0.7294118, 0, 1, 1,
0.8212979, 0.9136158, 1.799318, 0.7333333, 0, 1, 1,
0.8213292, 0.4579133, -0.9196386, 0.7411765, 0, 1, 1,
0.8215109, 0.1592094, 2.1382, 0.7450981, 0, 1, 1,
0.8281144, -0.832758, 1.14968, 0.7529412, 0, 1, 1,
0.8315312, 0.825711, 1.113388, 0.7568628, 0, 1, 1,
0.8344909, -0.03391938, 1.655874, 0.7647059, 0, 1, 1,
0.8452031, 0.6360673, -0.4640772, 0.7686275, 0, 1, 1,
0.8468844, 0.09312194, 1.276151, 0.7764706, 0, 1, 1,
0.8476737, -1.489777, 2.941055, 0.7803922, 0, 1, 1,
0.8543916, -1.540641, 1.52399, 0.7882353, 0, 1, 1,
0.8611615, 1.657202, 0.9150769, 0.7921569, 0, 1, 1,
0.8617225, 1.175348, 1.089782, 0.8, 0, 1, 1,
0.8618013, -0.0963394, 1.659508, 0.8078431, 0, 1, 1,
0.8620992, -1.604661, 3.594659, 0.8117647, 0, 1, 1,
0.8690881, -0.07628825, 0.6573909, 0.8196079, 0, 1, 1,
0.8706301, -0.6603808, 3.228407, 0.8235294, 0, 1, 1,
0.872372, 0.06645364, 2.973533, 0.8313726, 0, 1, 1,
0.8725958, 0.5459079, -0.1702331, 0.8352941, 0, 1, 1,
0.8736823, 0.09359118, 2.211481, 0.8431373, 0, 1, 1,
0.8745158, 0.9033575, 2.268156, 0.8470588, 0, 1, 1,
0.8763238, -0.868984, 1.971076, 0.854902, 0, 1, 1,
0.8817589, 1.566717, 0.172167, 0.8588235, 0, 1, 1,
0.8820762, 0.008701219, -0.1908376, 0.8666667, 0, 1, 1,
0.8868165, -0.7023026, -0.1235755, 0.8705882, 0, 1, 1,
0.8905406, -1.072274, 2.731282, 0.8784314, 0, 1, 1,
0.8913243, -1.908739, 2.081087, 0.8823529, 0, 1, 1,
0.8915395, 1.70424, -1.474864, 0.8901961, 0, 1, 1,
0.8928086, 0.7061042, 0.8922403, 0.8941177, 0, 1, 1,
0.8970228, -0.7744815, 1.649216, 0.9019608, 0, 1, 1,
0.8985907, -0.03382005, 0.8000317, 0.9098039, 0, 1, 1,
0.900268, 0.02261562, 0.06709983, 0.9137255, 0, 1, 1,
0.9094936, 0.1130937, 2.755275, 0.9215686, 0, 1, 1,
0.9169462, 0.3633084, 2.9606, 0.9254902, 0, 1, 1,
0.9236717, 1.282179, 0.4646642, 0.9333333, 0, 1, 1,
0.9256392, -1.061262, 3.70802, 0.9372549, 0, 1, 1,
0.9315533, 2.050438, 1.586275, 0.945098, 0, 1, 1,
0.9429249, -0.4114644, 2.318017, 0.9490196, 0, 1, 1,
0.9433436, -0.1917419, 0.9304351, 0.9568627, 0, 1, 1,
0.9433559, -1.090752, 2.769226, 0.9607843, 0, 1, 1,
0.9514846, 1.623983, -0.07758977, 0.9686275, 0, 1, 1,
0.9537474, 1.647791, 2.3068, 0.972549, 0, 1, 1,
0.9539835, 1.42856, -0.2152509, 0.9803922, 0, 1, 1,
0.9549576, -0.05572943, 2.679549, 0.9843137, 0, 1, 1,
0.9599795, 1.605942, 0.8254235, 0.9921569, 0, 1, 1,
0.9667403, -0.1580133, 2.301266, 0.9960784, 0, 1, 1,
0.9677265, 0.3822005, 1.19249, 1, 0, 0.9960784, 1,
0.9704347, 0.04466492, 3.388089, 1, 0, 0.9882353, 1,
0.9706389, -0.8252574, 3.405694, 1, 0, 0.9843137, 1,
0.9713921, -0.554902, 1.747221, 1, 0, 0.9764706, 1,
0.9818134, 0.2985354, 1.24143, 1, 0, 0.972549, 1,
0.9820696, 0.5271747, 2.18312, 1, 0, 0.9647059, 1,
0.9865381, 0.8198564, 1.00791, 1, 0, 0.9607843, 1,
0.9876083, -0.2780657, 0.8381901, 1, 0, 0.9529412, 1,
0.9902103, 1.670779, 0.578724, 1, 0, 0.9490196, 1,
0.9914336, -0.5367193, 0.3386262, 1, 0, 0.9411765, 1,
0.9918097, -0.227071, 2.261724, 1, 0, 0.9372549, 1,
0.9931601, 1.96951, 1.0844, 1, 0, 0.9294118, 1,
0.9935681, -0.748693, 4.078825, 1, 0, 0.9254902, 1,
0.9944111, -1.250847, 3.091829, 1, 0, 0.9176471, 1,
0.9948006, 0.2972214, 1.269974, 1, 0, 0.9137255, 1,
1.004929, -1.284779, 1.526868, 1, 0, 0.9058824, 1,
1.011739, 0.8298156, 2.630595, 1, 0, 0.9019608, 1,
1.015781, -0.3041432, 1.966909, 1, 0, 0.8941177, 1,
1.019114, 0.08314887, 2.642929, 1, 0, 0.8862745, 1,
1.019514, -1.675258, 2.05575, 1, 0, 0.8823529, 1,
1.029698, 0.4553629, 0.2001712, 1, 0, 0.8745098, 1,
1.038659, 0.1543971, 2.105118, 1, 0, 0.8705882, 1,
1.049442, 0.005833368, 2.044486, 1, 0, 0.8627451, 1,
1.059277, -0.3870806, 0.6315817, 1, 0, 0.8588235, 1,
1.064541, 1.287586, 0.6267921, 1, 0, 0.8509804, 1,
1.072514, -0.9743373, 0.7232623, 1, 0, 0.8470588, 1,
1.077018, -0.2210459, 1.532529, 1, 0, 0.8392157, 1,
1.08001, -0.2461648, 0.6872564, 1, 0, 0.8352941, 1,
1.086449, -0.1872018, 2.770054, 1, 0, 0.827451, 1,
1.088736, -0.08790133, 1.205062, 1, 0, 0.8235294, 1,
1.128329, 2.004697, 0.4541563, 1, 0, 0.8156863, 1,
1.133893, -1.059028, 2.806369, 1, 0, 0.8117647, 1,
1.135215, -0.9364877, 2.338216, 1, 0, 0.8039216, 1,
1.135298, 1.048567, 0.6571499, 1, 0, 0.7960784, 1,
1.152922, -0.3011783, 3.433569, 1, 0, 0.7921569, 1,
1.154382, 0.9732922, 0.4958149, 1, 0, 0.7843137, 1,
1.155856, 1.639836, 2.26291, 1, 0, 0.7803922, 1,
1.157367, -1.33998, 2.591747, 1, 0, 0.772549, 1,
1.157758, 0.7871339, 1.100308, 1, 0, 0.7686275, 1,
1.163661, 0.1611335, -0.7917899, 1, 0, 0.7607843, 1,
1.167593, -0.6096787, -0.4265458, 1, 0, 0.7568628, 1,
1.169419, -2.361145, 4.116786, 1, 0, 0.7490196, 1,
1.17155, 0.2044079, 2.789184, 1, 0, 0.7450981, 1,
1.183894, 0.6019533, 1.354021, 1, 0, 0.7372549, 1,
1.190274, 0.1218328, 0.2925636, 1, 0, 0.7333333, 1,
1.198792, -0.2517303, 1.255219, 1, 0, 0.7254902, 1,
1.20002, -0.6815216, 2.661051, 1, 0, 0.7215686, 1,
1.206339, 0.5727288, 1.649882, 1, 0, 0.7137255, 1,
1.209531, 0.7141522, 1.312929, 1, 0, 0.7098039, 1,
1.210992, -1.082261, 3.173431, 1, 0, 0.7019608, 1,
1.218874, -1.033568, 2.234985, 1, 0, 0.6941177, 1,
1.225841, 0.6706126, 0.9216833, 1, 0, 0.6901961, 1,
1.228367, -0.8663528, 2.734621, 1, 0, 0.682353, 1,
1.236792, -0.5913848, 2.039882, 1, 0, 0.6784314, 1,
1.238502, -1.192236, 2.630891, 1, 0, 0.6705883, 1,
1.238865, -0.3032105, 2.812698, 1, 0, 0.6666667, 1,
1.241291, 0.4365351, 1.602009, 1, 0, 0.6588235, 1,
1.242621, -0.1791175, 0.5634633, 1, 0, 0.654902, 1,
1.246783, -2.832435, 2.953686, 1, 0, 0.6470588, 1,
1.25418, 0.230082, 0.8375479, 1, 0, 0.6431373, 1,
1.255376, 0.4306018, 2.723796, 1, 0, 0.6352941, 1,
1.266588, -1.262037, 2.572132, 1, 0, 0.6313726, 1,
1.273497, 0.7427823, 0.6371539, 1, 0, 0.6235294, 1,
1.274593, -2.640934, 2.730976, 1, 0, 0.6196079, 1,
1.275394, -0.1033214, 2.088917, 1, 0, 0.6117647, 1,
1.28469, -1.728459, 2.715011, 1, 0, 0.6078432, 1,
1.295431, 1.433668, -1.029045, 1, 0, 0.6, 1,
1.303201, -1.446947, 3.418428, 1, 0, 0.5921569, 1,
1.31119, 1.630626, 0.8040832, 1, 0, 0.5882353, 1,
1.311946, -0.5381126, 1.005252, 1, 0, 0.5803922, 1,
1.335869, -0.1736805, 4.478438, 1, 0, 0.5764706, 1,
1.336134, -0.5395991, 2.499774, 1, 0, 0.5686275, 1,
1.347035, -0.09545281, 2.552129, 1, 0, 0.5647059, 1,
1.349204, 1.02916, -0.9353806, 1, 0, 0.5568628, 1,
1.349874, -0.471607, 2.518872, 1, 0, 0.5529412, 1,
1.351819, 0.1466803, 2.450773, 1, 0, 0.5450981, 1,
1.357075, -0.3839484, 2.030355, 1, 0, 0.5411765, 1,
1.370604, 1.512819, 0.6399588, 1, 0, 0.5333334, 1,
1.371068, 1.571327, 1.213791, 1, 0, 0.5294118, 1,
1.374453, 0.06727387, 2.240056, 1, 0, 0.5215687, 1,
1.384261, -1.237785, 2.217661, 1, 0, 0.5176471, 1,
1.386395, 0.6172787, -0.1120164, 1, 0, 0.509804, 1,
1.392328, -0.2142961, 2.909202, 1, 0, 0.5058824, 1,
1.410958, -1.468908, 1.567994, 1, 0, 0.4980392, 1,
1.43028, 0.7025468, 1.397433, 1, 0, 0.4901961, 1,
1.430654, 0.3149397, -0.3110382, 1, 0, 0.4862745, 1,
1.433292, -1.071499, 1.734929, 1, 0, 0.4784314, 1,
1.433723, -0.4128028, 2.298055, 1, 0, 0.4745098, 1,
1.436502, -1.61076, 2.115705, 1, 0, 0.4666667, 1,
1.43746, 0.05011269, 1.805025, 1, 0, 0.4627451, 1,
1.442992, 0.7551237, 0.08155347, 1, 0, 0.454902, 1,
1.445207, 0.7567519, 0.3644663, 1, 0, 0.4509804, 1,
1.451186, -0.5587651, 1.250257, 1, 0, 0.4431373, 1,
1.451722, -0.9633626, 2.224877, 1, 0, 0.4392157, 1,
1.458121, 0.9603019, 1.219522, 1, 0, 0.4313726, 1,
1.46301, 1.678078, 1.563646, 1, 0, 0.427451, 1,
1.468844, 0.6015002, 2.015232, 1, 0, 0.4196078, 1,
1.475678, -0.6341451, 1.677785, 1, 0, 0.4156863, 1,
1.487186, 0.1140255, 2.375486, 1, 0, 0.4078431, 1,
1.490144, 0.2362833, 2.006227, 1, 0, 0.4039216, 1,
1.499717, -0.5980456, 2.133118, 1, 0, 0.3960784, 1,
1.501235, -0.9026222, 1.442645, 1, 0, 0.3882353, 1,
1.505879, 1.158266, 0.7940357, 1, 0, 0.3843137, 1,
1.513228, 0.231693, 1.006047, 1, 0, 0.3764706, 1,
1.525055, -1.116341, 2.198852, 1, 0, 0.372549, 1,
1.538851, 0.3475244, 0.8552164, 1, 0, 0.3647059, 1,
1.540902, -0.9934208, 0.6364245, 1, 0, 0.3607843, 1,
1.545389, 0.06083534, 1.70937, 1, 0, 0.3529412, 1,
1.552783, -0.3288098, -0.02763612, 1, 0, 0.3490196, 1,
1.584911, 0.8670453, -0.6917861, 1, 0, 0.3411765, 1,
1.591548, -0.2724741, 1.844671, 1, 0, 0.3372549, 1,
1.600809, -0.2849004, 0.7319381, 1, 0, 0.3294118, 1,
1.608911, 1.062873, 2.065704, 1, 0, 0.3254902, 1,
1.626035, -0.5551365, 0.5545884, 1, 0, 0.3176471, 1,
1.632493, 2.59061, -0.01564313, 1, 0, 0.3137255, 1,
1.634423, 0.5291506, 1.556294, 1, 0, 0.3058824, 1,
1.638815, -0.2330893, 1.792961, 1, 0, 0.2980392, 1,
1.640433, -0.0957356, 1.958865, 1, 0, 0.2941177, 1,
1.65194, 0.05720397, 1.116106, 1, 0, 0.2862745, 1,
1.657696, -0.2904665, 2.85305, 1, 0, 0.282353, 1,
1.672002, -0.7933353, 2.78661, 1, 0, 0.2745098, 1,
1.673016, 0.314066, 0.9593253, 1, 0, 0.2705882, 1,
1.696306, 0.08357311, 1.063752, 1, 0, 0.2627451, 1,
1.696357, -0.2951604, 1.475842, 1, 0, 0.2588235, 1,
1.703301, 1.556696, -0.4139062, 1, 0, 0.2509804, 1,
1.710941, 0.3389525, 2.011601, 1, 0, 0.2470588, 1,
1.714015, 0.8732405, 2.471799, 1, 0, 0.2392157, 1,
1.739575, 0.1259087, 0.3449273, 1, 0, 0.2352941, 1,
1.75401, -1.199892, 0.9012991, 1, 0, 0.227451, 1,
1.772588, 1.661438, 0.3736823, 1, 0, 0.2235294, 1,
1.786444, 1.504538, -0.6395609, 1, 0, 0.2156863, 1,
1.790745, 0.5041899, 1.836897, 1, 0, 0.2117647, 1,
1.79104, -1.189909, 1.584927, 1, 0, 0.2039216, 1,
1.792221, 0.03329188, 1.141128, 1, 0, 0.1960784, 1,
1.812822, -1.347649, 1.896995, 1, 0, 0.1921569, 1,
1.814259, -1.408849, 1.418275, 1, 0, 0.1843137, 1,
1.815949, 0.7999581, 0.5270564, 1, 0, 0.1803922, 1,
1.817983, -0.3970088, 2.002478, 1, 0, 0.172549, 1,
1.827538, -1.482323, 1.822934, 1, 0, 0.1686275, 1,
1.876259, 0.1294347, 1.947906, 1, 0, 0.1607843, 1,
1.929894, -0.5634292, 1.500883, 1, 0, 0.1568628, 1,
1.935531, -0.764583, 2.850438, 1, 0, 0.1490196, 1,
1.953608, 0.4757133, 1.291132, 1, 0, 0.145098, 1,
1.965221, -0.08450423, 0.8329418, 1, 0, 0.1372549, 1,
2.01236, -1.864311, 4.115147, 1, 0, 0.1333333, 1,
2.016016, 1.005691, 1.85054, 1, 0, 0.1254902, 1,
2.022308, 0.3685812, 2.508426, 1, 0, 0.1215686, 1,
2.02285, 1.854053, 2.218692, 1, 0, 0.1137255, 1,
2.045367, 0.1402131, 1.465372, 1, 0, 0.1098039, 1,
2.056343, -1.316661, 2.230392, 1, 0, 0.1019608, 1,
2.106379, -2.563245, 0.9790224, 1, 0, 0.09411765, 1,
2.15905, -1.025052, -0.1591888, 1, 0, 0.09019608, 1,
2.179167, -0.5977363, 2.055367, 1, 0, 0.08235294, 1,
2.185723, 0.0557472, 0.9808649, 1, 0, 0.07843138, 1,
2.205638, 0.6915942, 0.6659628, 1, 0, 0.07058824, 1,
2.224566, 0.7391315, -0.1425451, 1, 0, 0.06666667, 1,
2.32325, 0.9245012, 0.2647599, 1, 0, 0.05882353, 1,
2.360969, -2.213099, 1.233483, 1, 0, 0.05490196, 1,
2.435475, 0.4576336, 1.322287, 1, 0, 0.04705882, 1,
2.473506, 0.1504091, 2.167028, 1, 0, 0.04313726, 1,
2.512066, 0.7530339, 0.97258, 1, 0, 0.03529412, 1,
2.514749, 0.006003477, 1.446103, 1, 0, 0.03137255, 1,
2.564703, -0.4022225, 1.783526, 1, 0, 0.02352941, 1,
2.569497, 2.423121, 0.6825929, 1, 0, 0.01960784, 1,
2.59403, -2.051269, 3.758513, 1, 0, 0.01176471, 1,
3.435772, 0.4467983, 1.473541, 1, 0, 0.007843138, 1
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
0.215647, -3.786862, -7.534188, 0, -0.5, 0.5, 0.5,
0.215647, -3.786862, -7.534188, 1, -0.5, 0.5, 0.5,
0.215647, -3.786862, -7.534188, 1, 1.5, 0.5, 0.5,
0.215647, -3.786862, -7.534188, 0, 1.5, 0.5, 0.5
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
-4.096101, -0.01701748, -7.534188, 0, -0.5, 0.5, 0.5,
-4.096101, -0.01701748, -7.534188, 1, -0.5, 0.5, 0.5,
-4.096101, -0.01701748, -7.534188, 1, 1.5, 0.5, 0.5,
-4.096101, -0.01701748, -7.534188, 0, 1.5, 0.5, 0.5
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
-4.096101, -3.786862, 0.248853, 0, -0.5, 0.5, 0.5,
-4.096101, -3.786862, 0.248853, 1, -0.5, 0.5, 0.5,
-4.096101, -3.786862, 0.248853, 1, 1.5, 0.5, 0.5,
-4.096101, -3.786862, 0.248853, 0, 1.5, 0.5, 0.5
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
-3, -2.916898, -5.738101,
3, -2.916898, -5.738101,
-3, -2.916898, -5.738101,
-3, -3.061892, -6.037449,
-2, -2.916898, -5.738101,
-2, -3.061892, -6.037449,
-1, -2.916898, -5.738101,
-1, -3.061892, -6.037449,
0, -2.916898, -5.738101,
0, -3.061892, -6.037449,
1, -2.916898, -5.738101,
1, -3.061892, -6.037449,
2, -2.916898, -5.738101,
2, -3.061892, -6.037449,
3, -2.916898, -5.738101,
3, -3.061892, -6.037449
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
-3, -3.35188, -6.636145, 0, -0.5, 0.5, 0.5,
-3, -3.35188, -6.636145, 1, -0.5, 0.5, 0.5,
-3, -3.35188, -6.636145, 1, 1.5, 0.5, 0.5,
-3, -3.35188, -6.636145, 0, 1.5, 0.5, 0.5,
-2, -3.35188, -6.636145, 0, -0.5, 0.5, 0.5,
-2, -3.35188, -6.636145, 1, -0.5, 0.5, 0.5,
-2, -3.35188, -6.636145, 1, 1.5, 0.5, 0.5,
-2, -3.35188, -6.636145, 0, 1.5, 0.5, 0.5,
-1, -3.35188, -6.636145, 0, -0.5, 0.5, 0.5,
-1, -3.35188, -6.636145, 1, -0.5, 0.5, 0.5,
-1, -3.35188, -6.636145, 1, 1.5, 0.5, 0.5,
-1, -3.35188, -6.636145, 0, 1.5, 0.5, 0.5,
0, -3.35188, -6.636145, 0, -0.5, 0.5, 0.5,
0, -3.35188, -6.636145, 1, -0.5, 0.5, 0.5,
0, -3.35188, -6.636145, 1, 1.5, 0.5, 0.5,
0, -3.35188, -6.636145, 0, 1.5, 0.5, 0.5,
1, -3.35188, -6.636145, 0, -0.5, 0.5, 0.5,
1, -3.35188, -6.636145, 1, -0.5, 0.5, 0.5,
1, -3.35188, -6.636145, 1, 1.5, 0.5, 0.5,
1, -3.35188, -6.636145, 0, 1.5, 0.5, 0.5,
2, -3.35188, -6.636145, 0, -0.5, 0.5, 0.5,
2, -3.35188, -6.636145, 1, -0.5, 0.5, 0.5,
2, -3.35188, -6.636145, 1, 1.5, 0.5, 0.5,
2, -3.35188, -6.636145, 0, 1.5, 0.5, 0.5,
3, -3.35188, -6.636145, 0, -0.5, 0.5, 0.5,
3, -3.35188, -6.636145, 1, -0.5, 0.5, 0.5,
3, -3.35188, -6.636145, 1, 1.5, 0.5, 0.5,
3, -3.35188, -6.636145, 0, 1.5, 0.5, 0.5
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
-3.101082, -2, -5.738101,
-3.101082, 2, -5.738101,
-3.101082, -2, -5.738101,
-3.266919, -2, -6.037449,
-3.101082, -1, -5.738101,
-3.266919, -1, -6.037449,
-3.101082, 0, -5.738101,
-3.266919, 0, -6.037449,
-3.101082, 1, -5.738101,
-3.266919, 1, -6.037449,
-3.101082, 2, -5.738101,
-3.266919, 2, -6.037449
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
-3.598592, -2, -6.636145, 0, -0.5, 0.5, 0.5,
-3.598592, -2, -6.636145, 1, -0.5, 0.5, 0.5,
-3.598592, -2, -6.636145, 1, 1.5, 0.5, 0.5,
-3.598592, -2, -6.636145, 0, 1.5, 0.5, 0.5,
-3.598592, -1, -6.636145, 0, -0.5, 0.5, 0.5,
-3.598592, -1, -6.636145, 1, -0.5, 0.5, 0.5,
-3.598592, -1, -6.636145, 1, 1.5, 0.5, 0.5,
-3.598592, -1, -6.636145, 0, 1.5, 0.5, 0.5,
-3.598592, 0, -6.636145, 0, -0.5, 0.5, 0.5,
-3.598592, 0, -6.636145, 1, -0.5, 0.5, 0.5,
-3.598592, 0, -6.636145, 1, 1.5, 0.5, 0.5,
-3.598592, 0, -6.636145, 0, 1.5, 0.5, 0.5,
-3.598592, 1, -6.636145, 0, -0.5, 0.5, 0.5,
-3.598592, 1, -6.636145, 1, -0.5, 0.5, 0.5,
-3.598592, 1, -6.636145, 1, 1.5, 0.5, 0.5,
-3.598592, 1, -6.636145, 0, 1.5, 0.5, 0.5,
-3.598592, 2, -6.636145, 0, -0.5, 0.5, 0.5,
-3.598592, 2, -6.636145, 1, -0.5, 0.5, 0.5,
-3.598592, 2, -6.636145, 1, 1.5, 0.5, 0.5,
-3.598592, 2, -6.636145, 0, 1.5, 0.5, 0.5
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
-3.101082, -2.916898, -4,
-3.101082, -2.916898, 6,
-3.101082, -2.916898, -4,
-3.266919, -3.061892, -4,
-3.101082, -2.916898, -2,
-3.266919, -3.061892, -2,
-3.101082, -2.916898, 0,
-3.266919, -3.061892, 0,
-3.101082, -2.916898, 2,
-3.266919, -3.061892, 2,
-3.101082, -2.916898, 4,
-3.266919, -3.061892, 4,
-3.101082, -2.916898, 6,
-3.266919, -3.061892, 6
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
-3.598592, -3.35188, -4, 0, -0.5, 0.5, 0.5,
-3.598592, -3.35188, -4, 1, -0.5, 0.5, 0.5,
-3.598592, -3.35188, -4, 1, 1.5, 0.5, 0.5,
-3.598592, -3.35188, -4, 0, 1.5, 0.5, 0.5,
-3.598592, -3.35188, -2, 0, -0.5, 0.5, 0.5,
-3.598592, -3.35188, -2, 1, -0.5, 0.5, 0.5,
-3.598592, -3.35188, -2, 1, 1.5, 0.5, 0.5,
-3.598592, -3.35188, -2, 0, 1.5, 0.5, 0.5,
-3.598592, -3.35188, 0, 0, -0.5, 0.5, 0.5,
-3.598592, -3.35188, 0, 1, -0.5, 0.5, 0.5,
-3.598592, -3.35188, 0, 1, 1.5, 0.5, 0.5,
-3.598592, -3.35188, 0, 0, 1.5, 0.5, 0.5,
-3.598592, -3.35188, 2, 0, -0.5, 0.5, 0.5,
-3.598592, -3.35188, 2, 1, -0.5, 0.5, 0.5,
-3.598592, -3.35188, 2, 1, 1.5, 0.5, 0.5,
-3.598592, -3.35188, 2, 0, 1.5, 0.5, 0.5,
-3.598592, -3.35188, 4, 0, -0.5, 0.5, 0.5,
-3.598592, -3.35188, 4, 1, -0.5, 0.5, 0.5,
-3.598592, -3.35188, 4, 1, 1.5, 0.5, 0.5,
-3.598592, -3.35188, 4, 0, 1.5, 0.5, 0.5,
-3.598592, -3.35188, 6, 0, -0.5, 0.5, 0.5,
-3.598592, -3.35188, 6, 1, -0.5, 0.5, 0.5,
-3.598592, -3.35188, 6, 1, 1.5, 0.5, 0.5,
-3.598592, -3.35188, 6, 0, 1.5, 0.5, 0.5
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
-3.101082, -2.916898, -5.738101,
-3.101082, 2.882863, -5.738101,
-3.101082, -2.916898, 6.235807,
-3.101082, 2.882863, 6.235807,
-3.101082, -2.916898, -5.738101,
-3.101082, -2.916898, 6.235807,
-3.101082, 2.882863, -5.738101,
-3.101082, 2.882863, 6.235807,
-3.101082, -2.916898, -5.738101,
3.532376, -2.916898, -5.738101,
-3.101082, -2.916898, 6.235807,
3.532376, -2.916898, 6.235807,
-3.101082, 2.882863, -5.738101,
3.532376, 2.882863, -5.738101,
-3.101082, 2.882863, 6.235807,
3.532376, 2.882863, 6.235807,
3.532376, -2.916898, -5.738101,
3.532376, 2.882863, -5.738101,
3.532376, -2.916898, 6.235807,
3.532376, 2.882863, 6.235807,
3.532376, -2.916898, -5.738101,
3.532376, -2.916898, 6.235807,
3.532376, 2.882863, -5.738101,
3.532376, 2.882863, 6.235807
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
var radius = 7.938452;
var distance = 35.31907;
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
mvMatrix.translate( -0.215647, 0.01701748, -0.248853 );
mvMatrix.scale( 1.293927, 1.479925, 0.7168261 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.31907);
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
flumetover<-read.table("flumetover.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flumetover$V2
```

```
## Error in eval(expr, envir, enclos): object 'flumetover' not found
```

```r
y<-flumetover$V3
```

```
## Error in eval(expr, envir, enclos): object 'flumetover' not found
```

```r
z<-flumetover$V4
```

```
## Error in eval(expr, envir, enclos): object 'flumetover' not found
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
-3.004478, -0.3922683, -1.800686, 0, 0, 1, 1, 1,
-2.800362, 1.573743, -1.637658, 1, 0, 0, 1, 1,
-2.782439, -0.1472449, -2.595841, 1, 0, 0, 1, 1,
-2.51403, 0.3908323, -0.9854462, 1, 0, 0, 1, 1,
-2.452045, 0.1404152, -0.868619, 1, 0, 0, 1, 1,
-2.375974, 0.3320144, -0.2883313, 1, 0, 0, 1, 1,
-2.35745, -1.915732, -1.856806, 0, 0, 0, 1, 1,
-2.288504, 1.060045, -0.2338435, 0, 0, 0, 1, 1,
-2.258883, -0.2916026, -0.5456374, 0, 0, 0, 1, 1,
-2.253855, -0.8976431, -3.278075, 0, 0, 0, 1, 1,
-2.190388, -0.7713174, -1.53696, 0, 0, 0, 1, 1,
-2.165316, -0.6772704, -2.242184, 0, 0, 0, 1, 1,
-2.130675, -0.62053, -0.9634855, 0, 0, 0, 1, 1,
-2.126059, 0.7342145, -1.015564, 1, 1, 1, 1, 1,
-2.108637, -2.071784, -2.747429, 1, 1, 1, 1, 1,
-2.079729, 0.4194146, -0.2480201, 1, 1, 1, 1, 1,
-2.077593, -0.9892137, -2.614025, 1, 1, 1, 1, 1,
-2.075656, 0.9220309, -1.66308, 1, 1, 1, 1, 1,
-2.013086, 0.7503444, -1.885253, 1, 1, 1, 1, 1,
-1.996542, -0.6817079, -2.005469, 1, 1, 1, 1, 1,
-1.955785, 1.255038, -1.342758, 1, 1, 1, 1, 1,
-1.932545, -1.632746, -4.96179, 1, 1, 1, 1, 1,
-1.928204, 0.2521842, -0.6771408, 1, 1, 1, 1, 1,
-1.916415, 1.32158, -3.594478, 1, 1, 1, 1, 1,
-1.903891, -0.2853141, -1.223622, 1, 1, 1, 1, 1,
-1.902224, 0.3733646, 0.3911308, 1, 1, 1, 1, 1,
-1.891065, -0.8271544, -0.5774515, 1, 1, 1, 1, 1,
-1.878621, 0.3983578, -2.108872, 1, 1, 1, 1, 1,
-1.871804, 0.5207052, -1.597192, 0, 0, 1, 1, 1,
-1.868194, 0.8436178, -2.53567, 1, 0, 0, 1, 1,
-1.864377, 0.02302572, -2.430338, 1, 0, 0, 1, 1,
-1.82371, 0.983488, -2.93269, 1, 0, 0, 1, 1,
-1.818004, 1.167844, -1.768049, 1, 0, 0, 1, 1,
-1.814474, -0.6414105, -1.688485, 1, 0, 0, 1, 1,
-1.792018, -1.795102, -2.484648, 0, 0, 0, 1, 1,
-1.786454, -1.083298, -2.222927, 0, 0, 0, 1, 1,
-1.782823, -0.9681796, -2.134471, 0, 0, 0, 1, 1,
-1.778076, -2.129837, -3.040931, 0, 0, 0, 1, 1,
-1.77216, -1.114309, -0.2829199, 0, 0, 0, 1, 1,
-1.757604, 1.253026, 0.3308151, 0, 0, 0, 1, 1,
-1.747997, 0.2249909, -0.9128273, 0, 0, 0, 1, 1,
-1.723794, -0.01169713, -2.203061, 1, 1, 1, 1, 1,
-1.723452, -0.9768434, -1.806249, 1, 1, 1, 1, 1,
-1.717491, 0.7404795, -0.3157786, 1, 1, 1, 1, 1,
-1.693986, -1.961001, -1.891875, 1, 1, 1, 1, 1,
-1.681304, -0.8030453, -2.488422, 1, 1, 1, 1, 1,
-1.661698, -2.105069, -2.221507, 1, 1, 1, 1, 1,
-1.658462, -0.4110098, -1.459321, 1, 1, 1, 1, 1,
-1.656588, 0.7905495, -2.088634, 1, 1, 1, 1, 1,
-1.632991, -0.7916252, -1.654298, 1, 1, 1, 1, 1,
-1.599537, 0.7961529, -0.2904073, 1, 1, 1, 1, 1,
-1.595349, -0.9523409, -3.87732, 1, 1, 1, 1, 1,
-1.593441, 0.3260342, -0.09588122, 1, 1, 1, 1, 1,
-1.589703, 0.1973381, -0.6907736, 1, 1, 1, 1, 1,
-1.583839, -0.8876674, -3.696932, 1, 1, 1, 1, 1,
-1.58305, -0.5718195, -0.4223258, 1, 1, 1, 1, 1,
-1.557939, 0.7212234, -1.721552, 0, 0, 1, 1, 1,
-1.5569, 1.005628, -0.5268479, 1, 0, 0, 1, 1,
-1.553001, 2.150943, -1.703826, 1, 0, 0, 1, 1,
-1.55284, 0.01278045, -0.9286351, 1, 0, 0, 1, 1,
-1.549468, -0.6392775, -1.134285, 1, 0, 0, 1, 1,
-1.528703, -1.024203, -2.761414, 1, 0, 0, 1, 1,
-1.524637, 1.334418, -2.586986, 0, 0, 0, 1, 1,
-1.510692, 0.4877056, -1.787452, 0, 0, 0, 1, 1,
-1.509376, -0.3385945, -2.647187, 0, 0, 0, 1, 1,
-1.50511, -0.5158574, -1.54531, 0, 0, 0, 1, 1,
-1.50141, 0.6877264, -2.376022, 0, 0, 0, 1, 1,
-1.48913, -0.7226601, -2.505633, 0, 0, 0, 1, 1,
-1.485309, 0.5661814, 0.2527081, 0, 0, 0, 1, 1,
-1.483167, -0.5837096, -1.932766, 1, 1, 1, 1, 1,
-1.475892, 0.4282482, -1.109177, 1, 1, 1, 1, 1,
-1.47347, -0.2553809, -1.118623, 1, 1, 1, 1, 1,
-1.469715, 0.5885676, -2.128394, 1, 1, 1, 1, 1,
-1.462658, -0.3418144, -0.3816217, 1, 1, 1, 1, 1,
-1.460186, 0.0308267, -2.58544, 1, 1, 1, 1, 1,
-1.452728, 0.9097976, -1.531027, 1, 1, 1, 1, 1,
-1.445944, -0.8144248, -3.055585, 1, 1, 1, 1, 1,
-1.439351, -1.756953, -2.442929, 1, 1, 1, 1, 1,
-1.431446, 1.193486, -0.665834, 1, 1, 1, 1, 1,
-1.427418, -1.572269, -3.120249, 1, 1, 1, 1, 1,
-1.424899, 2.116001, -0.0428194, 1, 1, 1, 1, 1,
-1.424206, 1.067888, 0.9728457, 1, 1, 1, 1, 1,
-1.421924, -0.543985, -1.769601, 1, 1, 1, 1, 1,
-1.417357, -1.099155, -2.371979, 1, 1, 1, 1, 1,
-1.41505, 0.2720732, -2.323533, 0, 0, 1, 1, 1,
-1.406916, 0.03263045, -3.373106, 1, 0, 0, 1, 1,
-1.40584, -0.6695014, -2.713872, 1, 0, 0, 1, 1,
-1.399636, 0.2444343, -2.07411, 1, 0, 0, 1, 1,
-1.391876, 0.7603776, -0.9962248, 1, 0, 0, 1, 1,
-1.387436, -0.3801036, 0.4007474, 1, 0, 0, 1, 1,
-1.379833, 0.8411093, 0.3478908, 0, 0, 0, 1, 1,
-1.35635, -1.192832, -3.920832, 0, 0, 0, 1, 1,
-1.352837, 0.1227614, -0.6962911, 0, 0, 0, 1, 1,
-1.351837, -1.35574, -1.842247, 0, 0, 0, 1, 1,
-1.351213, -0.4669103, -2.106886, 0, 0, 0, 1, 1,
-1.348967, -0.3639971, -3.161417, 0, 0, 0, 1, 1,
-1.34049, -0.6936244, -3.69829, 0, 0, 0, 1, 1,
-1.340065, 0.2174307, -1.62365, 1, 1, 1, 1, 1,
-1.330329, 0.5996421, -1.382003, 1, 1, 1, 1, 1,
-1.328841, -0.005354778, -1.64356, 1, 1, 1, 1, 1,
-1.32666, -1.355271, -2.396373, 1, 1, 1, 1, 1,
-1.322406, -0.3158514, -2.116692, 1, 1, 1, 1, 1,
-1.276929, -0.02164053, -1.886218, 1, 1, 1, 1, 1,
-1.276103, 0.1969069, -0.6612243, 1, 1, 1, 1, 1,
-1.272694, 1.058084, -1.965984, 1, 1, 1, 1, 1,
-1.267005, 2.164319, 0.03941449, 1, 1, 1, 1, 1,
-1.26648, 0.6094657, -1.637673, 1, 1, 1, 1, 1,
-1.249838, 0.4936042, -0.9710571, 1, 1, 1, 1, 1,
-1.24881, -0.6205046, -2.17182, 1, 1, 1, 1, 1,
-1.243002, 0.8405008, -0.09779859, 1, 1, 1, 1, 1,
-1.242619, -1.006804, -2.792318, 1, 1, 1, 1, 1,
-1.241297, 0.4413365, -0.1261105, 1, 1, 1, 1, 1,
-1.241159, 0.3896279, -1.665001, 0, 0, 1, 1, 1,
-1.23969, 0.1539674, -1.484687, 1, 0, 0, 1, 1,
-1.234999, 0.3620021, 0.1443905, 1, 0, 0, 1, 1,
-1.233455, 0.3822941, -0.5552754, 1, 0, 0, 1, 1,
-1.233024, 0.9930816, 0.4720005, 1, 0, 0, 1, 1,
-1.211255, 0.7508655, -2.515159, 1, 0, 0, 1, 1,
-1.19162, -0.7355184, -3.698905, 0, 0, 0, 1, 1,
-1.190096, 0.186843, -0.2288107, 0, 0, 0, 1, 1,
-1.183673, -1.468889, -3.265865, 0, 0, 0, 1, 1,
-1.17383, 0.9824463, -1.429345, 0, 0, 0, 1, 1,
-1.169036, -0.0786979, -0.6492466, 0, 0, 0, 1, 1,
-1.168387, 2.542758, -1.323564, 0, 0, 0, 1, 1,
-1.164942, -1.187623, -3.310182, 0, 0, 0, 1, 1,
-1.156908, -0.5670173, -2.93003, 1, 1, 1, 1, 1,
-1.155362, 1.397102, -0.3983188, 1, 1, 1, 1, 1,
-1.147825, 1.070052, -1.11281, 1, 1, 1, 1, 1,
-1.146046, 0.8055103, 0.3266346, 1, 1, 1, 1, 1,
-1.143716, 0.6143484, 0.227651, 1, 1, 1, 1, 1,
-1.135569, 1.796115, -1.311752, 1, 1, 1, 1, 1,
-1.133137, 0.988227, -2.255173, 1, 1, 1, 1, 1,
-1.122843, -0.3068314, -1.885936, 1, 1, 1, 1, 1,
-1.106307, 0.6780083, -1.041496, 1, 1, 1, 1, 1,
-1.094843, -0.1741319, -0.7889415, 1, 1, 1, 1, 1,
-1.08646, 0.2317813, -2.261122, 1, 1, 1, 1, 1,
-1.084921, 2.325156, -0.4289919, 1, 1, 1, 1, 1,
-1.084305, -0.5742322, -1.429714, 1, 1, 1, 1, 1,
-1.080443, 0.5579752, -0.6994428, 1, 1, 1, 1, 1,
-1.07746, -0.771975, -2.099245, 1, 1, 1, 1, 1,
-1.071013, 0.5418898, -1.949928, 0, 0, 1, 1, 1,
-1.054932, -0.6896198, -3.196092, 1, 0, 0, 1, 1,
-1.054135, 0.4823384, -0.8023422, 1, 0, 0, 1, 1,
-1.050489, -0.4517481, -3.375011, 1, 0, 0, 1, 1,
-1.048751, -0.2659761, -1.159233, 1, 0, 0, 1, 1,
-1.047494, -1.205483, -0.5558673, 1, 0, 0, 1, 1,
-1.04126, -0.9254329, -0.08308354, 0, 0, 0, 1, 1,
-1.039969, 1.185962, 1.160621, 0, 0, 0, 1, 1,
-1.038731, -0.9469416, -2.211015, 0, 0, 0, 1, 1,
-1.034501, -0.8462981, -1.216673, 0, 0, 0, 1, 1,
-1.031584, -0.2542026, -0.5427011, 0, 0, 0, 1, 1,
-1.029941, 0.4887013, -0.5270515, 0, 0, 0, 1, 1,
-1.027899, 1.473697, -2.32355, 0, 0, 0, 1, 1,
-1.024729, 0.01406609, -0.4339049, 1, 1, 1, 1, 1,
-1.014953, 1.692288, -0.2830808, 1, 1, 1, 1, 1,
-1.001958, -0.5643029, -1.623324, 1, 1, 1, 1, 1,
-1.001468, 1.749068, -0.2462619, 1, 1, 1, 1, 1,
-0.9920148, -0.2139121, -0.5773921, 1, 1, 1, 1, 1,
-0.9913358, -0.1563237, -1.511809, 1, 1, 1, 1, 1,
-0.9894184, -1.456523, -3.843221, 1, 1, 1, 1, 1,
-0.985822, -2.409287, -3.560537, 1, 1, 1, 1, 1,
-0.9705353, 0.7152628, -0.9050695, 1, 1, 1, 1, 1,
-0.9649705, -0.380575, -2.253244, 1, 1, 1, 1, 1,
-0.9545581, -0.2262535, -2.40845, 1, 1, 1, 1, 1,
-0.951589, 1.119768, -0.4445206, 1, 1, 1, 1, 1,
-0.9468847, 0.7173325, -0.5954468, 1, 1, 1, 1, 1,
-0.9424296, 0.9867976, -0.3747709, 1, 1, 1, 1, 1,
-0.9421888, 0.7612231, 0.1790853, 1, 1, 1, 1, 1,
-0.9217017, -0.6238686, -3.740994, 0, 0, 1, 1, 1,
-0.9139238, -1.33892, -1.352269, 1, 0, 0, 1, 1,
-0.913595, -0.1167451, -2.181176, 1, 0, 0, 1, 1,
-0.9107041, -0.786062, -2.487, 1, 0, 0, 1, 1,
-0.9106733, 0.4329911, -0.2324581, 1, 0, 0, 1, 1,
-0.9048592, 1.261217, -0.7431792, 1, 0, 0, 1, 1,
-0.9037386, 0.04290478, -0.7250981, 0, 0, 0, 1, 1,
-0.8971598, 0.7907916, -0.8150671, 0, 0, 0, 1, 1,
-0.8947549, 2.176871, -0.221735, 0, 0, 0, 1, 1,
-0.8880446, -1.182896, -2.610983, 0, 0, 0, 1, 1,
-0.8807952, -0.3824111, -2.347124, 0, 0, 0, 1, 1,
-0.8731823, -0.3614028, -0.5688204, 0, 0, 0, 1, 1,
-0.8711717, -1.683063, -3.164247, 0, 0, 0, 1, 1,
-0.864229, 1.106238, -0.05761159, 1, 1, 1, 1, 1,
-0.8603691, -0.3852153, -2.212503, 1, 1, 1, 1, 1,
-0.8520839, -0.3472562, -2.025953, 1, 1, 1, 1, 1,
-0.8424488, 0.8826369, 0.3260983, 1, 1, 1, 1, 1,
-0.8307236, 0.3996902, -1.931791, 1, 1, 1, 1, 1,
-0.8293987, 0.4169724, -1.462997, 1, 1, 1, 1, 1,
-0.8218764, -1.072136, -3.659797, 1, 1, 1, 1, 1,
-0.8212851, -0.1201355, -3.168042, 1, 1, 1, 1, 1,
-0.8156594, -1.266318, -1.243148, 1, 1, 1, 1, 1,
-0.8141832, -1.066154, -2.888601, 1, 1, 1, 1, 1,
-0.8128995, -0.6661379, -1.598359, 1, 1, 1, 1, 1,
-0.8106201, 0.2384834, 0.4515488, 1, 1, 1, 1, 1,
-0.8085279, 1.239885, -0.124811, 1, 1, 1, 1, 1,
-0.8081776, 0.2729619, -1.836611, 1, 1, 1, 1, 1,
-0.8074775, 0.9421985, -1.718999, 1, 1, 1, 1, 1,
-0.806784, -0.8002304, -3.018887, 0, 0, 1, 1, 1,
-0.8000801, 0.398246, -1.622212, 1, 0, 0, 1, 1,
-0.7911885, 0.3259963, -2.023499, 1, 0, 0, 1, 1,
-0.7911818, 1.152665, -2.437598, 1, 0, 0, 1, 1,
-0.7871159, -0.09150189, -2.037351, 1, 0, 0, 1, 1,
-0.7757914, -0.2609432, -2.982044, 1, 0, 0, 1, 1,
-0.7757722, 1.086634, 0.7261009, 0, 0, 0, 1, 1,
-0.7673934, -0.5089775, -4.05605, 0, 0, 0, 1, 1,
-0.767211, -0.3418932, -1.88097, 0, 0, 0, 1, 1,
-0.7625763, 0.06882256, -0.8552898, 0, 0, 0, 1, 1,
-0.759868, -0.02522294, -1.15019, 0, 0, 0, 1, 1,
-0.7577507, 1.149021, 0.2017191, 0, 0, 0, 1, 1,
-0.7577379, 0.1472879, -1.305903, 0, 0, 0, 1, 1,
-0.7568895, -0.6739193, -2.997985, 1, 1, 1, 1, 1,
-0.7553395, 0.5252945, -1.557835, 1, 1, 1, 1, 1,
-0.7552336, 0.5166451, -0.3342057, 1, 1, 1, 1, 1,
-0.7515793, 0.5841948, -0.8011193, 1, 1, 1, 1, 1,
-0.7470627, -0.5593634, -2.570903, 1, 1, 1, 1, 1,
-0.7466335, -0.7188474, -3.087996, 1, 1, 1, 1, 1,
-0.7456523, 1.884006, 0.8373559, 1, 1, 1, 1, 1,
-0.7418812, -0.494724, -1.06085, 1, 1, 1, 1, 1,
-0.7390252, -0.7843412, -0.6339919, 1, 1, 1, 1, 1,
-0.7348388, 0.3574767, -0.8240489, 1, 1, 1, 1, 1,
-0.7335768, -0.02090008, 0.9357138, 1, 1, 1, 1, 1,
-0.7288266, 0.7526534, -1.791456, 1, 1, 1, 1, 1,
-0.7260225, -0.009050508, -1.79244, 1, 1, 1, 1, 1,
-0.7234517, -0.2978882, -3.122655, 1, 1, 1, 1, 1,
-0.7197775, -0.1770812, -1.927658, 1, 1, 1, 1, 1,
-0.7178573, -0.3072697, -1.761574, 0, 0, 1, 1, 1,
-0.7128235, 0.05739865, -0.6847556, 1, 0, 0, 1, 1,
-0.7119353, 1.62817, -1.017091, 1, 0, 0, 1, 1,
-0.7112104, 0.235576, -2.351227, 1, 0, 0, 1, 1,
-0.7109582, -0.8856856, -3.099297, 1, 0, 0, 1, 1,
-0.7109526, 1.751414, 0.7719359, 1, 0, 0, 1, 1,
-0.7045923, 0.07571768, -2.560048, 0, 0, 0, 1, 1,
-0.7044127, -1.918511, -0.9906341, 0, 0, 0, 1, 1,
-0.6873327, -0.6182353, -1.391175, 0, 0, 0, 1, 1,
-0.686843, -1.365265, -1.951102, 0, 0, 0, 1, 1,
-0.6838781, -1.688284, -2.029036, 0, 0, 0, 1, 1,
-0.6794794, 0.3810019, -0.002368045, 0, 0, 0, 1, 1,
-0.674982, -0.4041972, -1.64277, 0, 0, 0, 1, 1,
-0.6738254, -0.1053256, -1.694684, 1, 1, 1, 1, 1,
-0.6734954, 0.7817982, -0.05164556, 1, 1, 1, 1, 1,
-0.6703947, 0.08476581, -3.283608, 1, 1, 1, 1, 1,
-0.6692035, -1.235621, -4.175142, 1, 1, 1, 1, 1,
-0.6673918, 0.4230785, 0.4175431, 1, 1, 1, 1, 1,
-0.6640518, 0.6248561, -1.033887, 1, 1, 1, 1, 1,
-0.6587314, 1.594952, -0.1402156, 1, 1, 1, 1, 1,
-0.655265, -0.1933063, -1.111165, 1, 1, 1, 1, 1,
-0.6527453, -1.431944, -3.385069, 1, 1, 1, 1, 1,
-0.6488062, 1.17778, -1.451717, 1, 1, 1, 1, 1,
-0.647987, 2.070076, -0.7769759, 1, 1, 1, 1, 1,
-0.6400207, 0.2620493, -0.9633361, 1, 1, 1, 1, 1,
-0.6387987, 0.2041295, -1.015424, 1, 1, 1, 1, 1,
-0.6327142, 1.993539, -1.220646, 1, 1, 1, 1, 1,
-0.630822, 0.1584655, -1.061925, 1, 1, 1, 1, 1,
-0.6284948, 0.272627, -2.553791, 0, 0, 1, 1, 1,
-0.6259618, 1.206106, 1.625776, 1, 0, 0, 1, 1,
-0.6139085, -0.8184167, -2.742621, 1, 0, 0, 1, 1,
-0.6130956, 0.6269025, -0.4724655, 1, 0, 0, 1, 1,
-0.6122749, 0.1113553, 0.646485, 1, 0, 0, 1, 1,
-0.6117052, -0.3722882, -3.975321, 1, 0, 0, 1, 1,
-0.6069568, 0.2090845, -0.05887612, 0, 0, 0, 1, 1,
-0.6065772, 0.8272544, 0.5496932, 0, 0, 0, 1, 1,
-0.6007197, -0.9213451, -1.316684, 0, 0, 0, 1, 1,
-0.5993413, -0.01259274, -1.25818, 0, 0, 0, 1, 1,
-0.5992302, 0.6663812, 1.266231, 0, 0, 0, 1, 1,
-0.5969061, 0.7289978, -0.4465573, 0, 0, 0, 1, 1,
-0.5958637, -0.04478915, -2.717008, 0, 0, 0, 1, 1,
-0.5923622, -0.7664274, -4.097448, 1, 1, 1, 1, 1,
-0.5895652, -0.1710379, -2.727123, 1, 1, 1, 1, 1,
-0.5888594, 0.4756771, -2.133208, 1, 1, 1, 1, 1,
-0.5885024, -0.6108811, -2.086236, 1, 1, 1, 1, 1,
-0.5821189, 1.118703, 0.0345757, 1, 1, 1, 1, 1,
-0.5765311, -0.6802854, -0.8765653, 1, 1, 1, 1, 1,
-0.5763714, -0.2006121, 0.850908, 1, 1, 1, 1, 1,
-0.5733114, -0.8341588, -3.191465, 1, 1, 1, 1, 1,
-0.5717229, -1.57881, -2.334932, 1, 1, 1, 1, 1,
-0.5663824, 1.300454, -1.13815, 1, 1, 1, 1, 1,
-0.5635417, -1.423918, -2.325291, 1, 1, 1, 1, 1,
-0.5574191, 0.6022987, -0.6656232, 1, 1, 1, 1, 1,
-0.555515, -0.4722477, -3.926395, 1, 1, 1, 1, 1,
-0.5530678, 1.679133, 0.7663134, 1, 1, 1, 1, 1,
-0.5528491, 0.2002986, -0.05737954, 1, 1, 1, 1, 1,
-0.5524943, -1.09501, -3.300519, 0, 0, 1, 1, 1,
-0.5494063, -0.03309985, -2.649112, 1, 0, 0, 1, 1,
-0.5455201, 0.5664891, -2.056791, 1, 0, 0, 1, 1,
-0.5444379, -0.6137607, -2.514364, 1, 0, 0, 1, 1,
-0.5440078, -2.303302, -0.07741131, 1, 0, 0, 1, 1,
-0.539394, -1.772293, -2.653301, 1, 0, 0, 1, 1,
-0.5390732, -0.3497374, -2.368878, 0, 0, 0, 1, 1,
-0.5389318, 0.7991219, 0.9971393, 0, 0, 0, 1, 1,
-0.5379069, -0.5223742, -4.022281, 0, 0, 0, 1, 1,
-0.530843, 0.3337952, -1.633445, 0, 0, 0, 1, 1,
-0.5306442, 1.559298, -1.749475, 0, 0, 0, 1, 1,
-0.5255078, 1.148744, -0.8335469, 0, 0, 0, 1, 1,
-0.5186148, 2.338732, 0.3162372, 0, 0, 0, 1, 1,
-0.5170501, -0.1266857, -3.108624, 1, 1, 1, 1, 1,
-0.5156363, -0.9982947, -2.713283, 1, 1, 1, 1, 1,
-0.5114657, -0.9265655, -2.2004, 1, 1, 1, 1, 1,
-0.5013204, 0.2457219, -0.7460952, 1, 1, 1, 1, 1,
-0.5005307, 0.235708, -1.324098, 1, 1, 1, 1, 1,
-0.5003168, 1.101341, -1.385942, 1, 1, 1, 1, 1,
-0.4944115, 0.09537581, -1.346228, 1, 1, 1, 1, 1,
-0.4928053, 0.3148135, -0.6953667, 1, 1, 1, 1, 1,
-0.4857233, 0.642884, -0.217957, 1, 1, 1, 1, 1,
-0.4855583, 0.6063201, -0.4154892, 1, 1, 1, 1, 1,
-0.4794418, -0.5761077, -2.843382, 1, 1, 1, 1, 1,
-0.4771751, 0.3324639, -0.7858374, 1, 1, 1, 1, 1,
-0.4765599, 0.5537084, -0.7536327, 1, 1, 1, 1, 1,
-0.4728766, 0.3105673, 0.1371328, 1, 1, 1, 1, 1,
-0.472372, 0.002437709, -3.04301, 1, 1, 1, 1, 1,
-0.4650038, 0.5692134, 0.08791821, 0, 0, 1, 1, 1,
-0.4638002, -0.9576829, -2.740924, 1, 0, 0, 1, 1,
-0.4627283, 1.146561, 1.424553, 1, 0, 0, 1, 1,
-0.4617597, 0.554791, -1.193035, 1, 0, 0, 1, 1,
-0.4614482, 0.9236546, -0.7501369, 1, 0, 0, 1, 1,
-0.4609771, 0.2414836, 0.048313, 1, 0, 0, 1, 1,
-0.4539464, -1.327195, -2.442921, 0, 0, 0, 1, 1,
-0.4536387, -0.5653004, -3.403636, 0, 0, 0, 1, 1,
-0.4455831, -1.039316, -2.061343, 0, 0, 0, 1, 1,
-0.4363101, -0.846341, -3.569533, 0, 0, 0, 1, 1,
-0.4288206, -0.2408644, -1.628116, 0, 0, 0, 1, 1,
-0.4273763, -1.771686, -1.528905, 0, 0, 0, 1, 1,
-0.4249668, 2.159489, -0.4528072, 0, 0, 0, 1, 1,
-0.423474, 0.1660999, -1.699327, 1, 1, 1, 1, 1,
-0.4215754, 0.6864825, -0.5622141, 1, 1, 1, 1, 1,
-0.4200877, 0.04437309, -2.157364, 1, 1, 1, 1, 1,
-0.4192961, -1.857585, -1.170778, 1, 1, 1, 1, 1,
-0.4191228, -1.36986, -4.198956, 1, 1, 1, 1, 1,
-0.4157084, 0.858852, -0.2487416, 1, 1, 1, 1, 1,
-0.4139544, 0.9850714, -0.835393, 1, 1, 1, 1, 1,
-0.4116256, -1.221084, -3.672364, 1, 1, 1, 1, 1,
-0.4110982, 0.1297356, 1.489726, 1, 1, 1, 1, 1,
-0.4050347, 0.256749, -0.7418291, 1, 1, 1, 1, 1,
-0.4033657, 0.0689797, -0.6176348, 1, 1, 1, 1, 1,
-0.3995743, 1.233756, 0.4191861, 1, 1, 1, 1, 1,
-0.3966199, 0.3663836, -1.188883, 1, 1, 1, 1, 1,
-0.396174, 1.55547, 0.03269278, 1, 1, 1, 1, 1,
-0.3935191, 1.4261, 0.3206451, 1, 1, 1, 1, 1,
-0.3920296, -0.4804238, -3.194898, 0, 0, 1, 1, 1,
-0.3772866, 0.1473635, -0.7093946, 1, 0, 0, 1, 1,
-0.3682263, 0.5802684, -0.3851079, 1, 0, 0, 1, 1,
-0.3674528, -1.192481, -2.745357, 1, 0, 0, 1, 1,
-0.3653894, -1.733877, -4.029005, 1, 0, 0, 1, 1,
-0.3630081, 1.941199, -0.532521, 1, 0, 0, 1, 1,
-0.3552622, 0.8593009, 0.05506931, 0, 0, 0, 1, 1,
-0.3521563, 1.408163, -1.066284, 0, 0, 0, 1, 1,
-0.3506116, -2.16192, -3.120359, 0, 0, 0, 1, 1,
-0.3466074, -1.447313, -2.681395, 0, 0, 0, 1, 1,
-0.3440877, -1.114499, -3.408859, 0, 0, 0, 1, 1,
-0.3440366, -1.231941, -3.073436, 0, 0, 0, 1, 1,
-0.338207, -1.066585, -3.114186, 0, 0, 0, 1, 1,
-0.3322445, 0.3911303, -0.2771241, 1, 1, 1, 1, 1,
-0.3303221, -1.015994, -2.693499, 1, 1, 1, 1, 1,
-0.3278231, 0.1148514, -1.027547, 1, 1, 1, 1, 1,
-0.3182903, 0.3040465, -1.367057, 1, 1, 1, 1, 1,
-0.3182001, 0.7994375, -1.832604, 1, 1, 1, 1, 1,
-0.3157308, 0.2074483, 0.2276817, 1, 1, 1, 1, 1,
-0.3156001, 0.1463091, -0.1626339, 1, 1, 1, 1, 1,
-0.3154016, 0.211985, 0.2745112, 1, 1, 1, 1, 1,
-0.3136807, 0.8440567, -1.415147, 1, 1, 1, 1, 1,
-0.3131375, -0.258511, -4.006935, 1, 1, 1, 1, 1,
-0.3130815, 0.6792367, -0.8008302, 1, 1, 1, 1, 1,
-0.3091799, -0.01390834, -2.591011, 1, 1, 1, 1, 1,
-0.3083531, -0.7930205, -2.197828, 1, 1, 1, 1, 1,
-0.3080017, 0.8817152, 1.253368, 1, 1, 1, 1, 1,
-0.3072331, 0.7897401, -1.313506, 1, 1, 1, 1, 1,
-0.3067026, -0.98494, -2.087727, 0, 0, 1, 1, 1,
-0.305507, 0.8407096, -2.338597, 1, 0, 0, 1, 1,
-0.296598, -0.5973426, -2.755312, 1, 0, 0, 1, 1,
-0.2940107, 0.8877558, -0.1496492, 1, 0, 0, 1, 1,
-0.29245, 0.8024858, 0.7116399, 1, 0, 0, 1, 1,
-0.2912149, 0.4128711, 0.1372669, 1, 0, 0, 1, 1,
-0.2905279, -1.574802, -3.416322, 0, 0, 0, 1, 1,
-0.2901631, -0.9018091, -5.563724, 0, 0, 0, 1, 1,
-0.2891307, -0.03822308, -0.604606, 0, 0, 0, 1, 1,
-0.2862023, -0.5285627, -2.78544, 0, 0, 0, 1, 1,
-0.2856875, 0.5994102, -1.096271, 0, 0, 0, 1, 1,
-0.2851046, -1.86379, -3.00803, 0, 0, 0, 1, 1,
-0.2848465, 0.3209132, -0.02877004, 0, 0, 0, 1, 1,
-0.2838275, 0.3439923, -0.1824097, 1, 1, 1, 1, 1,
-0.2830449, -1.304385, -2.402818, 1, 1, 1, 1, 1,
-0.2801031, 0.8198453, 0.5052859, 1, 1, 1, 1, 1,
-0.277958, -0.4961729, -2.572111, 1, 1, 1, 1, 1,
-0.272974, 0.2661328, -1.538916, 1, 1, 1, 1, 1,
-0.2626012, 0.2929142, 1.05358, 1, 1, 1, 1, 1,
-0.261672, -1.342572, -1.962701, 1, 1, 1, 1, 1,
-0.2599254, -0.5136421, -2.84441, 1, 1, 1, 1, 1,
-0.2593463, 0.9249786, -1.634247, 1, 1, 1, 1, 1,
-0.2584769, -0.7470728, -3.099741, 1, 1, 1, 1, 1,
-0.2562337, -0.04952971, -2.52292, 1, 1, 1, 1, 1,
-0.24965, 1.361964, -1.151053, 1, 1, 1, 1, 1,
-0.247324, -0.3324671, -0.434108, 1, 1, 1, 1, 1,
-0.2429104, 0.5368447, 0.5108988, 1, 1, 1, 1, 1,
-0.2386832, 0.989404, 0.874207, 1, 1, 1, 1, 1,
-0.2340654, 1.315859, 0.2272721, 0, 0, 1, 1, 1,
-0.2330034, 0.2183198, -0.7311201, 1, 0, 0, 1, 1,
-0.2320083, 0.2388621, -1.137162, 1, 0, 0, 1, 1,
-0.2304226, 1.601774, 1.561639, 1, 0, 0, 1, 1,
-0.2304201, -0.458099, -2.493348, 1, 0, 0, 1, 1,
-0.2290737, -0.2184928, -2.508489, 1, 0, 0, 1, 1,
-0.2268152, -0.8634757, -2.196054, 0, 0, 0, 1, 1,
-0.2265433, 0.788941, 1.108308, 0, 0, 0, 1, 1,
-0.2264442, -0.7945099, -1.589689, 0, 0, 0, 1, 1,
-0.2261361, -1.033359, -2.289071, 0, 0, 0, 1, 1,
-0.22182, 0.6460766, 0.3674457, 0, 0, 0, 1, 1,
-0.2216994, -0.2828235, -2.102027, 0, 0, 0, 1, 1,
-0.2187996, -0.382648, -2.373076, 0, 0, 0, 1, 1,
-0.215425, 0.1462463, -0.1400723, 1, 1, 1, 1, 1,
-0.2132477, 0.01861528, -0.49658, 1, 1, 1, 1, 1,
-0.2094166, -2.19207, -1.695448, 1, 1, 1, 1, 1,
-0.2083878, -0.4153263, -4.352301, 1, 1, 1, 1, 1,
-0.2079994, 0.8030295, 0.5574658, 1, 1, 1, 1, 1,
-0.2038538, -1.770894, -4.073444, 1, 1, 1, 1, 1,
-0.200072, 0.4108509, -0.608396, 1, 1, 1, 1, 1,
-0.1925588, 0.9911695, 0.1241715, 1, 1, 1, 1, 1,
-0.1923352, 0.9464189, 1.073807, 1, 1, 1, 1, 1,
-0.1923291, -0.4894978, -0.8765978, 1, 1, 1, 1, 1,
-0.1894146, 0.212867, -1.054548, 1, 1, 1, 1, 1,
-0.1890144, -0.2453215, -1.401698, 1, 1, 1, 1, 1,
-0.1852054, 0.5499586, -2.620477, 1, 1, 1, 1, 1,
-0.1839267, -0.07892123, -0.2816351, 1, 1, 1, 1, 1,
-0.1815461, -0.2404169, -3.396762, 1, 1, 1, 1, 1,
-0.1800826, -0.9464058, -2.226918, 0, 0, 1, 1, 1,
-0.1796046, 0.07154816, -3.253646, 1, 0, 0, 1, 1,
-0.1794149, -1.03274, -1.598031, 1, 0, 0, 1, 1,
-0.1777426, -1.64282, -3.667674, 1, 0, 0, 1, 1,
-0.1773885, -1.600092, -2.414118, 1, 0, 0, 1, 1,
-0.1754867, -0.5863239, -3.98247, 1, 0, 0, 1, 1,
-0.1719473, 1.219122, -0.2010433, 0, 0, 0, 1, 1,
-0.1718506, -1.146598, -3.75199, 0, 0, 0, 1, 1,
-0.1701421, -0.4481956, -2.430692, 0, 0, 0, 1, 1,
-0.1693547, -1.688151, -1.697554, 0, 0, 0, 1, 1,
-0.1664733, 0.1039577, 0.6528838, 0, 0, 0, 1, 1,
-0.1636573, 0.3335298, 0.2611853, 0, 0, 0, 1, 1,
-0.1629594, 0.08029606, 0.9734521, 0, 0, 0, 1, 1,
-0.1577728, -0.5932192, -3.450745, 1, 1, 1, 1, 1,
-0.1536485, -0.9042132, -3.380989, 1, 1, 1, 1, 1,
-0.1533509, -1.967596, -3.617686, 1, 1, 1, 1, 1,
-0.153243, -1.060428, -1.870651, 1, 1, 1, 1, 1,
-0.1504885, -0.444788, -2.050236, 1, 1, 1, 1, 1,
-0.148838, -0.161261, -2.118617, 1, 1, 1, 1, 1,
-0.1484114, -0.4592439, -1.765237, 1, 1, 1, 1, 1,
-0.1437371, 1.385, 1.101481, 1, 1, 1, 1, 1,
-0.1432751, -0.270061, -1.971721, 1, 1, 1, 1, 1,
-0.1406734, 0.8131991, -1.119117, 1, 1, 1, 1, 1,
-0.140163, 0.6970198, -1.60639, 1, 1, 1, 1, 1,
-0.1380765, 0.166828, -1.993937, 1, 1, 1, 1, 1,
-0.1354044, -1.182216, -3.388473, 1, 1, 1, 1, 1,
-0.1337534, -0.6483114, -1.497836, 1, 1, 1, 1, 1,
-0.1286198, -0.2419031, -2.78349, 1, 1, 1, 1, 1,
-0.1243855, -0.5593027, -3.319287, 0, 0, 1, 1, 1,
-0.118816, -0.9522506, -3.513392, 1, 0, 0, 1, 1,
-0.1074888, -0.78078, -3.507914, 1, 0, 0, 1, 1,
-0.1046444, 0.1380119, -0.4316894, 1, 0, 0, 1, 1,
-0.1036406, -1.110685, -2.685301, 1, 0, 0, 1, 1,
-0.1020872, 1.425485, -0.2310861, 1, 0, 0, 1, 1,
-0.101851, -0.5723627, -2.388989, 0, 0, 0, 1, 1,
-0.1010465, -1.471049, -3.346735, 0, 0, 0, 1, 1,
-0.09733637, 1.372329, -0.692599, 0, 0, 0, 1, 1,
-0.09653358, 0.9466525, -2.167532, 0, 0, 0, 1, 1,
-0.0964179, -0.1935149, -2.096112, 0, 0, 0, 1, 1,
-0.09522343, -1.255697, -4.549486, 0, 0, 0, 1, 1,
-0.09518916, -1.78752, -2.643111, 0, 0, 0, 1, 1,
-0.09454262, 1.072549, -0.285989, 1, 1, 1, 1, 1,
-0.08590285, 0.7440234, -0.9478698, 1, 1, 1, 1, 1,
-0.08497771, -0.9248667, -3.066309, 1, 1, 1, 1, 1,
-0.08269641, 1.013064, -0.6490272, 1, 1, 1, 1, 1,
-0.08206213, -1.25522, -4.649092, 1, 1, 1, 1, 1,
-0.0817352, 1.306682, 0.1676484, 1, 1, 1, 1, 1,
-0.0789977, -0.3611941, -2.269604, 1, 1, 1, 1, 1,
-0.07299938, -0.5616149, -2.140994, 1, 1, 1, 1, 1,
-0.06876127, 0.3520231, -0.2508437, 1, 1, 1, 1, 1,
-0.06546826, -0.2943445, -2.318194, 1, 1, 1, 1, 1,
-0.06140848, 0.8261512, 0.1189362, 1, 1, 1, 1, 1,
-0.05744454, 0.8523225, -1.892035, 1, 1, 1, 1, 1,
-0.0568402, -2.333513, -2.837648, 1, 1, 1, 1, 1,
-0.05347279, 1.334863, 0.3326184, 1, 1, 1, 1, 1,
-0.05300047, -0.4407678, -1.785903, 1, 1, 1, 1, 1,
-0.0524589, -0.7991131, -3.839129, 0, 0, 1, 1, 1,
-0.05197605, -0.5493079, -2.508204, 1, 0, 0, 1, 1,
-0.04538402, -0.3011051, -1.099689, 1, 0, 0, 1, 1,
-0.03895034, -1.596448, -4.31568, 1, 0, 0, 1, 1,
-0.03891284, -1.48907, -3.117211, 1, 0, 0, 1, 1,
-0.03853772, -0.2247346, -2.883334, 1, 0, 0, 1, 1,
-0.03308985, 1.546505, -0.5726523, 0, 0, 0, 1, 1,
-0.03261217, 0.2782297, -0.5925542, 0, 0, 0, 1, 1,
-0.02551012, 1.250595, 0.9299039, 0, 0, 0, 1, 1,
-0.0232103, 1.732541, -0.9149451, 0, 0, 0, 1, 1,
-0.02266127, -0.182457, -3.096211, 0, 0, 0, 1, 1,
-0.01846781, 1.212255, -0.1473164, 0, 0, 0, 1, 1,
-0.01653847, -0.3099585, -2.127193, 0, 0, 0, 1, 1,
-0.01643313, 0.6193781, 0.2343608, 1, 1, 1, 1, 1,
-0.01466046, -2.792962, -3.837663, 1, 1, 1, 1, 1,
-0.01179986, -0.305319, -1.601602, 1, 1, 1, 1, 1,
-0.01107579, -0.7220995, -5.181613, 1, 1, 1, 1, 1,
-0.009243365, -1.919155, -3.1425, 1, 1, 1, 1, 1,
-0.008465102, -0.5255192, -4.534767, 1, 1, 1, 1, 1,
-0.006226081, -0.7702609, -2.788837, 1, 1, 1, 1, 1,
-0.003549404, -1.463224, -3.396382, 1, 1, 1, 1, 1,
0.003763537, 0.8184446, 0.1560493, 1, 1, 1, 1, 1,
0.005798891, 0.8354381, -0.2980566, 1, 1, 1, 1, 1,
0.006299389, -1.60946, 3.680885, 1, 1, 1, 1, 1,
0.006685866, 0.05845132, -0.9805791, 1, 1, 1, 1, 1,
0.008925985, -0.02155834, 4.336006, 1, 1, 1, 1, 1,
0.01352134, -1.660084, 5.133305, 1, 1, 1, 1, 1,
0.01619441, 0.7473332, -1.615714, 1, 1, 1, 1, 1,
0.02221973, 0.30149, -1.034278, 0, 0, 1, 1, 1,
0.02646331, -0.3951463, 3.422498, 1, 0, 0, 1, 1,
0.02849246, 0.02468397, 1.795584, 1, 0, 0, 1, 1,
0.02859788, -0.9961894, 4.107506, 1, 0, 0, 1, 1,
0.03640509, -0.8817495, 3.626264, 1, 0, 0, 1, 1,
0.03653899, 0.4763175, 0.7771566, 1, 0, 0, 1, 1,
0.03686417, 0.504905, -1.04043, 0, 0, 0, 1, 1,
0.04532247, -0.1474669, 2.671671, 0, 0, 0, 1, 1,
0.04707438, -0.988883, 4.132798, 0, 0, 0, 1, 1,
0.05079411, -1.019794, 1.246016, 0, 0, 0, 1, 1,
0.0513868, 0.469873, -1.167864, 0, 0, 0, 1, 1,
0.06111505, 0.8600908, 1.712389, 0, 0, 0, 1, 1,
0.0646265, -0.05573262, 2.425699, 0, 0, 0, 1, 1,
0.06825344, 0.3363247, -1.950186, 1, 1, 1, 1, 1,
0.07266464, 0.4847854, 1.629015, 1, 1, 1, 1, 1,
0.07410076, 1.60026, 0.246874, 1, 1, 1, 1, 1,
0.07551358, 0.8581657, 0.1203823, 1, 1, 1, 1, 1,
0.07986679, 0.4079657, -0.957697, 1, 1, 1, 1, 1,
0.08656415, 0.612518, -0.6052478, 1, 1, 1, 1, 1,
0.0906374, 0.6333486, 0.2522289, 1, 1, 1, 1, 1,
0.09548172, 1.478523, -0.3225175, 1, 1, 1, 1, 1,
0.09934033, 0.1899282, 0.260471, 1, 1, 1, 1, 1,
0.09939457, 0.4769909, 0.8124346, 1, 1, 1, 1, 1,
0.1058698, -0.524007, 5.028949, 1, 1, 1, 1, 1,
0.1120308, -2.073314, 1.40815, 1, 1, 1, 1, 1,
0.1122451, 1.040814, -0.7161933, 1, 1, 1, 1, 1,
0.1176908, -0.3692328, 3.57045, 1, 1, 1, 1, 1,
0.1177683, -1.05642, 1.970883, 1, 1, 1, 1, 1,
0.1293293, -0.8769439, 3.818137, 0, 0, 1, 1, 1,
0.1297718, -0.5195158, 4.000442, 1, 0, 0, 1, 1,
0.1310672, -1.516278, 3.495842, 1, 0, 0, 1, 1,
0.1327896, 0.7388635, -1.058143, 1, 0, 0, 1, 1,
0.1368439, 0.8550872, -0.7862892, 1, 0, 0, 1, 1,
0.1400636, -0.08550445, 2.016874, 1, 0, 0, 1, 1,
0.1404967, -1.297433, 2.861586, 0, 0, 0, 1, 1,
0.144672, 0.7323237, 1.346475, 0, 0, 0, 1, 1,
0.1466921, -0.3624164, 3.369873, 0, 0, 0, 1, 1,
0.1520704, -1.099526, 3.714192, 0, 0, 0, 1, 1,
0.1529978, -0.7157292, 2.325342, 0, 0, 0, 1, 1,
0.157402, -1.0565, 2.787167, 0, 0, 0, 1, 1,
0.1580841, -0.108117, 1.847802, 0, 0, 0, 1, 1,
0.158256, -0.2944125, 3.267884, 1, 1, 1, 1, 1,
0.1604927, -0.03198817, 0.6080498, 1, 1, 1, 1, 1,
0.1611786, -0.2456612, 1.974903, 1, 1, 1, 1, 1,
0.1613423, -0.7985767, 6.06143, 1, 1, 1, 1, 1,
0.1709271, -0.5055835, 0.8282301, 1, 1, 1, 1, 1,
0.1713156, -0.5372661, 2.272969, 1, 1, 1, 1, 1,
0.1745002, -0.09848335, 1.250542, 1, 1, 1, 1, 1,
0.1778402, -0.223408, 4.950949, 1, 1, 1, 1, 1,
0.18008, 0.255897, 0.4772769, 1, 1, 1, 1, 1,
0.1832964, -1.266831, 3.27743, 1, 1, 1, 1, 1,
0.1851965, 1.977262, 0.1399624, 1, 1, 1, 1, 1,
0.1894704, -0.2127565, 0.8812363, 1, 1, 1, 1, 1,
0.1912683, 1.302632, -0.1615611, 1, 1, 1, 1, 1,
0.1932137, -0.4587197, 3.296336, 1, 1, 1, 1, 1,
0.1950332, 0.8493176, 0.4579909, 1, 1, 1, 1, 1,
0.1963972, 0.2456088, 1.171532, 0, 0, 1, 1, 1,
0.2050661, 0.167116, 1.898549, 1, 0, 0, 1, 1,
0.205133, -0.1147573, 2.583944, 1, 0, 0, 1, 1,
0.2073657, 0.3205751, 2.151842, 1, 0, 0, 1, 1,
0.2075748, 1.204186, 0.5376906, 1, 0, 0, 1, 1,
0.2110249, -0.4950762, 3.854237, 1, 0, 0, 1, 1,
0.2152516, 0.1098807, 1.267907, 0, 0, 0, 1, 1,
0.2163634, 0.6526787, 0.1824808, 0, 0, 0, 1, 1,
0.2192396, -0.2053611, 3.025316, 0, 0, 0, 1, 1,
0.2253679, 0.7599002, 1.865623, 0, 0, 0, 1, 1,
0.2288906, 0.1709381, 1.651057, 0, 0, 0, 1, 1,
0.2316137, -1.347884, 2.504125, 0, 0, 0, 1, 1,
0.232812, -1.102631, 2.588317, 0, 0, 0, 1, 1,
0.2356357, -1.124612, 1.818893, 1, 1, 1, 1, 1,
0.235784, -1.468608, 4.122894, 1, 1, 1, 1, 1,
0.2387086, -0.8770874, 4.119933, 1, 1, 1, 1, 1,
0.2389158, 0.5494004, 0.8232743, 1, 1, 1, 1, 1,
0.2405428, -0.5054909, 4.025348, 1, 1, 1, 1, 1,
0.2426206, 1.601039, -0.9644353, 1, 1, 1, 1, 1,
0.2432282, 0.2489018, -0.3627512, 1, 1, 1, 1, 1,
0.2435025, -1.193882, 2.644872, 1, 1, 1, 1, 1,
0.2476009, 0.7441096, -0.3558835, 1, 1, 1, 1, 1,
0.2494624, 1.561327, 0.01967768, 1, 1, 1, 1, 1,
0.2496911, -0.5880797, 1.691784, 1, 1, 1, 1, 1,
0.2499852, -0.06697543, 3.02284, 1, 1, 1, 1, 1,
0.2505009, -1.878175, 2.051765, 1, 1, 1, 1, 1,
0.251008, 1.470821, 1.83565, 1, 1, 1, 1, 1,
0.2512417, -0.2998634, 2.623185, 1, 1, 1, 1, 1,
0.2568507, 0.02635923, 2.065038, 0, 0, 1, 1, 1,
0.2604748, -0.2291065, 0.3318287, 1, 0, 0, 1, 1,
0.2636328, -0.6896949, 2.552364, 1, 0, 0, 1, 1,
0.2654244, 0.4632384, -0.3838738, 1, 0, 0, 1, 1,
0.2659541, 2.728259, -0.4067408, 1, 0, 0, 1, 1,
0.270881, -0.7734576, 3.807699, 1, 0, 0, 1, 1,
0.2766164, 0.2514828, 3.201751, 0, 0, 0, 1, 1,
0.2766741, 0.49238, -1.301306, 0, 0, 0, 1, 1,
0.2771454, 0.2082761, -0.1043378, 0, 0, 0, 1, 1,
0.2781053, 1.201092, 0.7332575, 0, 0, 0, 1, 1,
0.2784323, 0.249621, 3.111165, 0, 0, 0, 1, 1,
0.280035, 1.099947, 0.1660871, 0, 0, 0, 1, 1,
0.2815613, -0.4687918, 1.44506, 0, 0, 0, 1, 1,
0.2826068, -0.2505507, 0.6570965, 1, 1, 1, 1, 1,
0.2832639, -0.9051331, 3.56881, 1, 1, 1, 1, 1,
0.2850072, 1.198202, -0.4835053, 1, 1, 1, 1, 1,
0.2860374, 1.5658, -1.056648, 1, 1, 1, 1, 1,
0.2910885, -0.5695275, 4.427263, 1, 1, 1, 1, 1,
0.2973399, -1.925686, 4.24196, 1, 1, 1, 1, 1,
0.3028336, 0.1063136, -0.1744143, 1, 1, 1, 1, 1,
0.3057964, 0.7675869, -0.7280518, 1, 1, 1, 1, 1,
0.3066006, 0.779196, 0.6386459, 1, 1, 1, 1, 1,
0.3078254, -2.056272, 1.391068, 1, 1, 1, 1, 1,
0.3115712, 0.09920114, 0.7329634, 1, 1, 1, 1, 1,
0.3132636, -2.289848, 2.776309, 1, 1, 1, 1, 1,
0.3151328, 1.807695, -1.344351, 1, 1, 1, 1, 1,
0.3159552, -0.5537992, 2.666914, 1, 1, 1, 1, 1,
0.3161205, 1.232965, -0.5095159, 1, 1, 1, 1, 1,
0.320252, 0.6156119, -1.384053, 0, 0, 1, 1, 1,
0.3280825, 0.69178, 1.382683, 1, 0, 0, 1, 1,
0.3302147, 0.06116026, 1.463304, 1, 0, 0, 1, 1,
0.3304199, 0.3262598, 1.369656, 1, 0, 0, 1, 1,
0.3369394, -0.03566808, 1.437469, 1, 0, 0, 1, 1,
0.340073, 0.2387374, 2.992789, 1, 0, 0, 1, 1,
0.343166, 0.697504, 1.383954, 0, 0, 0, 1, 1,
0.3442824, -0.3579537, 1.973949, 0, 0, 0, 1, 1,
0.3503801, 0.7207668, 1.179364, 0, 0, 0, 1, 1,
0.3555087, -0.6612895, 2.526667, 0, 0, 0, 1, 1,
0.3565893, 0.5880609, 2.256838, 0, 0, 0, 1, 1,
0.357578, -1.015414, 3.975199, 0, 0, 0, 1, 1,
0.3591867, -0.1196432, 1.854571, 0, 0, 0, 1, 1,
0.3618754, 1.198203, -0.6286306, 1, 1, 1, 1, 1,
0.362588, 1.272028, 1.393145, 1, 1, 1, 1, 1,
0.3653752, 0.02283761, 1.155862, 1, 1, 1, 1, 1,
0.3692675, 0.9554062, 2.968942, 1, 1, 1, 1, 1,
0.3717301, 0.1107562, 3.043025, 1, 1, 1, 1, 1,
0.3723399, 0.2511397, 2.246448, 1, 1, 1, 1, 1,
0.3727852, -0.6393497, 3.200132, 1, 1, 1, 1, 1,
0.3742116, 0.2681671, -0.4036018, 1, 1, 1, 1, 1,
0.3802882, -1.275181, 3.63073, 1, 1, 1, 1, 1,
0.3822466, -0.790918, 1.810658, 1, 1, 1, 1, 1,
0.3823721, -1.289822, 3.706381, 1, 1, 1, 1, 1,
0.3834493, 0.02033207, 0.7844034, 1, 1, 1, 1, 1,
0.3862424, 1.51938, 0.002087837, 1, 1, 1, 1, 1,
0.3867956, -1.06566, 1.88523, 1, 1, 1, 1, 1,
0.3988328, 0.2902524, 2.282362, 1, 1, 1, 1, 1,
0.3993106, 0.820667, 1.242312, 0, 0, 1, 1, 1,
0.3997344, -0.409303, 2.234991, 1, 0, 0, 1, 1,
0.4008284, -1.939635, 3.610571, 1, 0, 0, 1, 1,
0.4019606, -0.481597, 2.964796, 1, 0, 0, 1, 1,
0.4036574, -1.268902, 1.033003, 1, 0, 0, 1, 1,
0.4044475, -0.1420054, 0.5893643, 1, 0, 0, 1, 1,
0.4110664, 1.178316, -1.444815, 0, 0, 0, 1, 1,
0.4112027, 1.144989, -0.8661951, 0, 0, 0, 1, 1,
0.4160696, 0.9987888, 0.5030981, 0, 0, 0, 1, 1,
0.4210621, 0.06858365, 2.048479, 0, 0, 0, 1, 1,
0.4276778, -1.405913, 3.38205, 0, 0, 0, 1, 1,
0.4280754, -0.06666518, 1.266691, 0, 0, 0, 1, 1,
0.4321327, 0.09995077, 2.068423, 0, 0, 0, 1, 1,
0.432207, -1.332486, 1.109081, 1, 1, 1, 1, 1,
0.4324969, -0.4417652, 2.263434, 1, 1, 1, 1, 1,
0.4355129, -0.5884311, 1.632509, 1, 1, 1, 1, 1,
0.4365305, -0.7739275, 3.935072, 1, 1, 1, 1, 1,
0.436751, 0.5743721, 2.003803, 1, 1, 1, 1, 1,
0.4388333, -0.3613346, 1.753196, 1, 1, 1, 1, 1,
0.4404857, 1.809097, 0.4795933, 1, 1, 1, 1, 1,
0.4407132, 0.6925198, 1.347481, 1, 1, 1, 1, 1,
0.4409766, -0.1170561, 1.907487, 1, 1, 1, 1, 1,
0.4467174, 0.2539904, -0.2086959, 1, 1, 1, 1, 1,
0.4468636, 0.9878495, -0.7101954, 1, 1, 1, 1, 1,
0.451197, 2.317135, 0.1400229, 1, 1, 1, 1, 1,
0.4522077, -1.292291, 2.067912, 1, 1, 1, 1, 1,
0.452303, -0.5122226, 2.083471, 1, 1, 1, 1, 1,
0.4528001, 1.939313, -1.149084, 1, 1, 1, 1, 1,
0.4556121, -0.2141192, 3.163832, 0, 0, 1, 1, 1,
0.4607461, 0.225916, 1.401202, 1, 0, 0, 1, 1,
0.4628076, -0.2463538, 2.723747, 1, 0, 0, 1, 1,
0.4632639, 0.1782957, 1.839618, 1, 0, 0, 1, 1,
0.4640494, -0.5133356, 3.581376, 1, 0, 0, 1, 1,
0.4655587, -0.2453445, 2.99158, 1, 0, 0, 1, 1,
0.4658939, 1.111003, 0.4451122, 0, 0, 0, 1, 1,
0.4662382, -0.4137366, 1.121496, 0, 0, 0, 1, 1,
0.4780644, -0.2079214, 1.173341, 0, 0, 0, 1, 1,
0.4800284, -0.6538222, 2.64345, 0, 0, 0, 1, 1,
0.4820421, -0.4294979, 1.506779, 0, 0, 0, 1, 1,
0.4906699, 1.32541, -0.02725201, 0, 0, 0, 1, 1,
0.4919299, -1.851115, 3.152448, 0, 0, 0, 1, 1,
0.5035639, -0.4520548, 0.599151, 1, 1, 1, 1, 1,
0.5084764, -0.5523931, 2.045971, 1, 1, 1, 1, 1,
0.5158944, 0.2171602, 0.4758303, 1, 1, 1, 1, 1,
0.5216129, -0.8999637, 2.603942, 1, 1, 1, 1, 1,
0.5236233, -0.1424286, 0.4174547, 1, 1, 1, 1, 1,
0.5236772, 0.3148671, -0.3649919, 1, 1, 1, 1, 1,
0.5270767, 0.3392657, 1.886217, 1, 1, 1, 1, 1,
0.5282722, 0.6955574, -0.3725637, 1, 1, 1, 1, 1,
0.5299329, -0.04384309, 1.304292, 1, 1, 1, 1, 1,
0.5351526, -0.4001332, 2.163622, 1, 1, 1, 1, 1,
0.5362366, -1.197173, 3.025996, 1, 1, 1, 1, 1,
0.5423139, 1.198662, 0.1493289, 1, 1, 1, 1, 1,
0.5434602, 0.9890077, 0.241766, 1, 1, 1, 1, 1,
0.5453938, -0.9175548, 1.939778, 1, 1, 1, 1, 1,
0.5453971, -0.8065819, 2.025455, 1, 1, 1, 1, 1,
0.5454559, 0.4383215, -0.07337262, 0, 0, 1, 1, 1,
0.5505002, -0.708371, 1.059589, 1, 0, 0, 1, 1,
0.5574641, -0.6388981, 2.360511, 1, 0, 0, 1, 1,
0.5581992, -0.1945809, 1.461215, 1, 0, 0, 1, 1,
0.570646, -0.03069553, 1.394822, 1, 0, 0, 1, 1,
0.5716717, 0.4660123, 0.6972651, 1, 0, 0, 1, 1,
0.5745325, -0.8813679, 3.438156, 0, 0, 0, 1, 1,
0.5747902, -1.380306, 2.268871, 0, 0, 0, 1, 1,
0.5832598, -0.5087545, 1.965979, 0, 0, 0, 1, 1,
0.5873454, 1.413262, -0.9500412, 0, 0, 0, 1, 1,
0.5892435, -0.07453527, 1.015144, 0, 0, 0, 1, 1,
0.5917721, 1.312146, -0.6526978, 0, 0, 0, 1, 1,
0.5979322, -0.7743132, 2.617249, 0, 0, 0, 1, 1,
0.5981624, -0.9564275, 3.790521, 1, 1, 1, 1, 1,
0.5989424, -0.3842934, 2.252812, 1, 1, 1, 1, 1,
0.6000312, -0.1306848, 0.4007283, 1, 1, 1, 1, 1,
0.6024402, -0.3101229, 0.5048674, 1, 1, 1, 1, 1,
0.6038617, 1.91769, -0.4998736, 1, 1, 1, 1, 1,
0.6086395, -0.4284251, 3.068798, 1, 1, 1, 1, 1,
0.6138648, -0.5683957, 2.323768, 1, 1, 1, 1, 1,
0.6149395, -1.361934, 3.4411, 1, 1, 1, 1, 1,
0.6195763, -0.3336587, 1.753924, 1, 1, 1, 1, 1,
0.6293895, -0.3936564, 3.13958, 1, 1, 1, 1, 1,
0.6312987, -1.136239, 2.214527, 1, 1, 1, 1, 1,
0.6352235, 0.5165475, 2.978814, 1, 1, 1, 1, 1,
0.6390964, 1.248238, 0.7280404, 1, 1, 1, 1, 1,
0.6402099, 0.09235489, 1.929482, 1, 1, 1, 1, 1,
0.640779, -1.948832, 0.735312, 1, 1, 1, 1, 1,
0.6425171, 0.3917867, 2.372957, 0, 0, 1, 1, 1,
0.6425995, 0.8116225, 1.359312, 1, 0, 0, 1, 1,
0.6437159, 0.3415073, 1.032215, 1, 0, 0, 1, 1,
0.6444459, 0.2656808, 2.121794, 1, 0, 0, 1, 1,
0.6512014, -1.561869, 3.290787, 1, 0, 0, 1, 1,
0.6567015, -1.644765, 3.696665, 1, 0, 0, 1, 1,
0.6609156, 0.460275, 0.4047188, 0, 0, 0, 1, 1,
0.6638644, 1.741275, -1.600279, 0, 0, 0, 1, 1,
0.6658198, -1.490121, 1.478033, 0, 0, 0, 1, 1,
0.6701655, -0.6405668, 1.113257, 0, 0, 0, 1, 1,
0.6770495, -1.092223, 3.953329, 0, 0, 0, 1, 1,
0.6801211, 0.8785905, 3.184158, 0, 0, 0, 1, 1,
0.682406, -0.09917025, 3.954133, 0, 0, 0, 1, 1,
0.68493, 0.5004609, -0.1545597, 1, 1, 1, 1, 1,
0.6881282, 1.433155, -2.032938, 1, 1, 1, 1, 1,
0.6914386, 0.9202356, -0.3591543, 1, 1, 1, 1, 1,
0.6923082, 0.1644147, 0.7574704, 1, 1, 1, 1, 1,
0.6924785, 0.8194107, -1.451264, 1, 1, 1, 1, 1,
0.6930684, 1.98705, -0.3972543, 1, 1, 1, 1, 1,
0.6954197, -0.9965059, 0.9426754, 1, 1, 1, 1, 1,
0.7040743, -0.2489937, 1.506948, 1, 1, 1, 1, 1,
0.7056336, 0.1870566, 0.4550096, 1, 1, 1, 1, 1,
0.7093946, -0.04906972, 2.971075, 1, 1, 1, 1, 1,
0.7103622, 0.06351382, 0.2961556, 1, 1, 1, 1, 1,
0.7130058, -0.1289476, 2.15219, 1, 1, 1, 1, 1,
0.7142737, -0.4930636, 1.123401, 1, 1, 1, 1, 1,
0.7157066, 0.6019826, -1.355702, 1, 1, 1, 1, 1,
0.7225504, 0.8447207, -0.5909709, 1, 1, 1, 1, 1,
0.7252829, -0.260922, 2.576534, 0, 0, 1, 1, 1,
0.7258516, 0.4608047, 2.051607, 1, 0, 0, 1, 1,
0.7267225, -0.433168, 1.563953, 1, 0, 0, 1, 1,
0.7279498, -0.3894702, 3.39157, 1, 0, 0, 1, 1,
0.729924, 0.8850945, 0.1222877, 1, 0, 0, 1, 1,
0.736495, 2.7984, -1.626887, 1, 0, 0, 1, 1,
0.7386737, -1.368084, 1.333668, 0, 0, 0, 1, 1,
0.7392632, -0.4622497, 1.521168, 0, 0, 0, 1, 1,
0.7410632, -0.3995865, 3.544595, 0, 0, 0, 1, 1,
0.7468291, -0.195879, 1.452429, 0, 0, 0, 1, 1,
0.7486014, -0.7815714, -0.009806681, 0, 0, 0, 1, 1,
0.7506529, -0.6020058, 2.361528, 0, 0, 0, 1, 1,
0.7515085, 0.319062, 0.8895724, 0, 0, 0, 1, 1,
0.7522632, -1.821233, 3.697398, 1, 1, 1, 1, 1,
0.7564207, -0.9412715, 2.427562, 1, 1, 1, 1, 1,
0.7604805, 2.01019, 0.2041496, 1, 1, 1, 1, 1,
0.7616204, 0.5944021, 1.060102, 1, 1, 1, 1, 1,
0.7621547, 1.06939, 1.160189, 1, 1, 1, 1, 1,
0.7645296, -0.1820969, 1.992743, 1, 1, 1, 1, 1,
0.7647243, -0.23509, 2.19873, 1, 1, 1, 1, 1,
0.7671861, -0.5905874, 1.147451, 1, 1, 1, 1, 1,
0.7679007, -1.509429, 2.602878, 1, 1, 1, 1, 1,
0.7717125, 0.7180117, 0.6856717, 1, 1, 1, 1, 1,
0.7785707, 1.098515, 1.228597, 1, 1, 1, 1, 1,
0.7810596, 1.257889, -0.343554, 1, 1, 1, 1, 1,
0.781912, -0.3497196, 0.7625943, 1, 1, 1, 1, 1,
0.7913199, 0.5800775, 0.111195, 1, 1, 1, 1, 1,
0.7948968, 1.31111, 1.577706, 1, 1, 1, 1, 1,
0.8007358, 1.280562, 1.019398, 0, 0, 1, 1, 1,
0.8034613, -1.287993, 1.339096, 1, 0, 0, 1, 1,
0.8040106, -0.2118126, 2.208687, 1, 0, 0, 1, 1,
0.807641, 0.5654194, 0.8051351, 1, 0, 0, 1, 1,
0.815511, -0.9051405, 2.972889, 1, 0, 0, 1, 1,
0.8212979, 0.9136158, 1.799318, 1, 0, 0, 1, 1,
0.8213292, 0.4579133, -0.9196386, 0, 0, 0, 1, 1,
0.8215109, 0.1592094, 2.1382, 0, 0, 0, 1, 1,
0.8281144, -0.832758, 1.14968, 0, 0, 0, 1, 1,
0.8315312, 0.825711, 1.113388, 0, 0, 0, 1, 1,
0.8344909, -0.03391938, 1.655874, 0, 0, 0, 1, 1,
0.8452031, 0.6360673, -0.4640772, 0, 0, 0, 1, 1,
0.8468844, 0.09312194, 1.276151, 0, 0, 0, 1, 1,
0.8476737, -1.489777, 2.941055, 1, 1, 1, 1, 1,
0.8543916, -1.540641, 1.52399, 1, 1, 1, 1, 1,
0.8611615, 1.657202, 0.9150769, 1, 1, 1, 1, 1,
0.8617225, 1.175348, 1.089782, 1, 1, 1, 1, 1,
0.8618013, -0.0963394, 1.659508, 1, 1, 1, 1, 1,
0.8620992, -1.604661, 3.594659, 1, 1, 1, 1, 1,
0.8690881, -0.07628825, 0.6573909, 1, 1, 1, 1, 1,
0.8706301, -0.6603808, 3.228407, 1, 1, 1, 1, 1,
0.872372, 0.06645364, 2.973533, 1, 1, 1, 1, 1,
0.8725958, 0.5459079, -0.1702331, 1, 1, 1, 1, 1,
0.8736823, 0.09359118, 2.211481, 1, 1, 1, 1, 1,
0.8745158, 0.9033575, 2.268156, 1, 1, 1, 1, 1,
0.8763238, -0.868984, 1.971076, 1, 1, 1, 1, 1,
0.8817589, 1.566717, 0.172167, 1, 1, 1, 1, 1,
0.8820762, 0.008701219, -0.1908376, 1, 1, 1, 1, 1,
0.8868165, -0.7023026, -0.1235755, 0, 0, 1, 1, 1,
0.8905406, -1.072274, 2.731282, 1, 0, 0, 1, 1,
0.8913243, -1.908739, 2.081087, 1, 0, 0, 1, 1,
0.8915395, 1.70424, -1.474864, 1, 0, 0, 1, 1,
0.8928086, 0.7061042, 0.8922403, 1, 0, 0, 1, 1,
0.8970228, -0.7744815, 1.649216, 1, 0, 0, 1, 1,
0.8985907, -0.03382005, 0.8000317, 0, 0, 0, 1, 1,
0.900268, 0.02261562, 0.06709983, 0, 0, 0, 1, 1,
0.9094936, 0.1130937, 2.755275, 0, 0, 0, 1, 1,
0.9169462, 0.3633084, 2.9606, 0, 0, 0, 1, 1,
0.9236717, 1.282179, 0.4646642, 0, 0, 0, 1, 1,
0.9256392, -1.061262, 3.70802, 0, 0, 0, 1, 1,
0.9315533, 2.050438, 1.586275, 0, 0, 0, 1, 1,
0.9429249, -0.4114644, 2.318017, 1, 1, 1, 1, 1,
0.9433436, -0.1917419, 0.9304351, 1, 1, 1, 1, 1,
0.9433559, -1.090752, 2.769226, 1, 1, 1, 1, 1,
0.9514846, 1.623983, -0.07758977, 1, 1, 1, 1, 1,
0.9537474, 1.647791, 2.3068, 1, 1, 1, 1, 1,
0.9539835, 1.42856, -0.2152509, 1, 1, 1, 1, 1,
0.9549576, -0.05572943, 2.679549, 1, 1, 1, 1, 1,
0.9599795, 1.605942, 0.8254235, 1, 1, 1, 1, 1,
0.9667403, -0.1580133, 2.301266, 1, 1, 1, 1, 1,
0.9677265, 0.3822005, 1.19249, 1, 1, 1, 1, 1,
0.9704347, 0.04466492, 3.388089, 1, 1, 1, 1, 1,
0.9706389, -0.8252574, 3.405694, 1, 1, 1, 1, 1,
0.9713921, -0.554902, 1.747221, 1, 1, 1, 1, 1,
0.9818134, 0.2985354, 1.24143, 1, 1, 1, 1, 1,
0.9820696, 0.5271747, 2.18312, 1, 1, 1, 1, 1,
0.9865381, 0.8198564, 1.00791, 0, 0, 1, 1, 1,
0.9876083, -0.2780657, 0.8381901, 1, 0, 0, 1, 1,
0.9902103, 1.670779, 0.578724, 1, 0, 0, 1, 1,
0.9914336, -0.5367193, 0.3386262, 1, 0, 0, 1, 1,
0.9918097, -0.227071, 2.261724, 1, 0, 0, 1, 1,
0.9931601, 1.96951, 1.0844, 1, 0, 0, 1, 1,
0.9935681, -0.748693, 4.078825, 0, 0, 0, 1, 1,
0.9944111, -1.250847, 3.091829, 0, 0, 0, 1, 1,
0.9948006, 0.2972214, 1.269974, 0, 0, 0, 1, 1,
1.004929, -1.284779, 1.526868, 0, 0, 0, 1, 1,
1.011739, 0.8298156, 2.630595, 0, 0, 0, 1, 1,
1.015781, -0.3041432, 1.966909, 0, 0, 0, 1, 1,
1.019114, 0.08314887, 2.642929, 0, 0, 0, 1, 1,
1.019514, -1.675258, 2.05575, 1, 1, 1, 1, 1,
1.029698, 0.4553629, 0.2001712, 1, 1, 1, 1, 1,
1.038659, 0.1543971, 2.105118, 1, 1, 1, 1, 1,
1.049442, 0.005833368, 2.044486, 1, 1, 1, 1, 1,
1.059277, -0.3870806, 0.6315817, 1, 1, 1, 1, 1,
1.064541, 1.287586, 0.6267921, 1, 1, 1, 1, 1,
1.072514, -0.9743373, 0.7232623, 1, 1, 1, 1, 1,
1.077018, -0.2210459, 1.532529, 1, 1, 1, 1, 1,
1.08001, -0.2461648, 0.6872564, 1, 1, 1, 1, 1,
1.086449, -0.1872018, 2.770054, 1, 1, 1, 1, 1,
1.088736, -0.08790133, 1.205062, 1, 1, 1, 1, 1,
1.128329, 2.004697, 0.4541563, 1, 1, 1, 1, 1,
1.133893, -1.059028, 2.806369, 1, 1, 1, 1, 1,
1.135215, -0.9364877, 2.338216, 1, 1, 1, 1, 1,
1.135298, 1.048567, 0.6571499, 1, 1, 1, 1, 1,
1.152922, -0.3011783, 3.433569, 0, 0, 1, 1, 1,
1.154382, 0.9732922, 0.4958149, 1, 0, 0, 1, 1,
1.155856, 1.639836, 2.26291, 1, 0, 0, 1, 1,
1.157367, -1.33998, 2.591747, 1, 0, 0, 1, 1,
1.157758, 0.7871339, 1.100308, 1, 0, 0, 1, 1,
1.163661, 0.1611335, -0.7917899, 1, 0, 0, 1, 1,
1.167593, -0.6096787, -0.4265458, 0, 0, 0, 1, 1,
1.169419, -2.361145, 4.116786, 0, 0, 0, 1, 1,
1.17155, 0.2044079, 2.789184, 0, 0, 0, 1, 1,
1.183894, 0.6019533, 1.354021, 0, 0, 0, 1, 1,
1.190274, 0.1218328, 0.2925636, 0, 0, 0, 1, 1,
1.198792, -0.2517303, 1.255219, 0, 0, 0, 1, 1,
1.20002, -0.6815216, 2.661051, 0, 0, 0, 1, 1,
1.206339, 0.5727288, 1.649882, 1, 1, 1, 1, 1,
1.209531, 0.7141522, 1.312929, 1, 1, 1, 1, 1,
1.210992, -1.082261, 3.173431, 1, 1, 1, 1, 1,
1.218874, -1.033568, 2.234985, 1, 1, 1, 1, 1,
1.225841, 0.6706126, 0.9216833, 1, 1, 1, 1, 1,
1.228367, -0.8663528, 2.734621, 1, 1, 1, 1, 1,
1.236792, -0.5913848, 2.039882, 1, 1, 1, 1, 1,
1.238502, -1.192236, 2.630891, 1, 1, 1, 1, 1,
1.238865, -0.3032105, 2.812698, 1, 1, 1, 1, 1,
1.241291, 0.4365351, 1.602009, 1, 1, 1, 1, 1,
1.242621, -0.1791175, 0.5634633, 1, 1, 1, 1, 1,
1.246783, -2.832435, 2.953686, 1, 1, 1, 1, 1,
1.25418, 0.230082, 0.8375479, 1, 1, 1, 1, 1,
1.255376, 0.4306018, 2.723796, 1, 1, 1, 1, 1,
1.266588, -1.262037, 2.572132, 1, 1, 1, 1, 1,
1.273497, 0.7427823, 0.6371539, 0, 0, 1, 1, 1,
1.274593, -2.640934, 2.730976, 1, 0, 0, 1, 1,
1.275394, -0.1033214, 2.088917, 1, 0, 0, 1, 1,
1.28469, -1.728459, 2.715011, 1, 0, 0, 1, 1,
1.295431, 1.433668, -1.029045, 1, 0, 0, 1, 1,
1.303201, -1.446947, 3.418428, 1, 0, 0, 1, 1,
1.31119, 1.630626, 0.8040832, 0, 0, 0, 1, 1,
1.311946, -0.5381126, 1.005252, 0, 0, 0, 1, 1,
1.335869, -0.1736805, 4.478438, 0, 0, 0, 1, 1,
1.336134, -0.5395991, 2.499774, 0, 0, 0, 1, 1,
1.347035, -0.09545281, 2.552129, 0, 0, 0, 1, 1,
1.349204, 1.02916, -0.9353806, 0, 0, 0, 1, 1,
1.349874, -0.471607, 2.518872, 0, 0, 0, 1, 1,
1.351819, 0.1466803, 2.450773, 1, 1, 1, 1, 1,
1.357075, -0.3839484, 2.030355, 1, 1, 1, 1, 1,
1.370604, 1.512819, 0.6399588, 1, 1, 1, 1, 1,
1.371068, 1.571327, 1.213791, 1, 1, 1, 1, 1,
1.374453, 0.06727387, 2.240056, 1, 1, 1, 1, 1,
1.384261, -1.237785, 2.217661, 1, 1, 1, 1, 1,
1.386395, 0.6172787, -0.1120164, 1, 1, 1, 1, 1,
1.392328, -0.2142961, 2.909202, 1, 1, 1, 1, 1,
1.410958, -1.468908, 1.567994, 1, 1, 1, 1, 1,
1.43028, 0.7025468, 1.397433, 1, 1, 1, 1, 1,
1.430654, 0.3149397, -0.3110382, 1, 1, 1, 1, 1,
1.433292, -1.071499, 1.734929, 1, 1, 1, 1, 1,
1.433723, -0.4128028, 2.298055, 1, 1, 1, 1, 1,
1.436502, -1.61076, 2.115705, 1, 1, 1, 1, 1,
1.43746, 0.05011269, 1.805025, 1, 1, 1, 1, 1,
1.442992, 0.7551237, 0.08155347, 0, 0, 1, 1, 1,
1.445207, 0.7567519, 0.3644663, 1, 0, 0, 1, 1,
1.451186, -0.5587651, 1.250257, 1, 0, 0, 1, 1,
1.451722, -0.9633626, 2.224877, 1, 0, 0, 1, 1,
1.458121, 0.9603019, 1.219522, 1, 0, 0, 1, 1,
1.46301, 1.678078, 1.563646, 1, 0, 0, 1, 1,
1.468844, 0.6015002, 2.015232, 0, 0, 0, 1, 1,
1.475678, -0.6341451, 1.677785, 0, 0, 0, 1, 1,
1.487186, 0.1140255, 2.375486, 0, 0, 0, 1, 1,
1.490144, 0.2362833, 2.006227, 0, 0, 0, 1, 1,
1.499717, -0.5980456, 2.133118, 0, 0, 0, 1, 1,
1.501235, -0.9026222, 1.442645, 0, 0, 0, 1, 1,
1.505879, 1.158266, 0.7940357, 0, 0, 0, 1, 1,
1.513228, 0.231693, 1.006047, 1, 1, 1, 1, 1,
1.525055, -1.116341, 2.198852, 1, 1, 1, 1, 1,
1.538851, 0.3475244, 0.8552164, 1, 1, 1, 1, 1,
1.540902, -0.9934208, 0.6364245, 1, 1, 1, 1, 1,
1.545389, 0.06083534, 1.70937, 1, 1, 1, 1, 1,
1.552783, -0.3288098, -0.02763612, 1, 1, 1, 1, 1,
1.584911, 0.8670453, -0.6917861, 1, 1, 1, 1, 1,
1.591548, -0.2724741, 1.844671, 1, 1, 1, 1, 1,
1.600809, -0.2849004, 0.7319381, 1, 1, 1, 1, 1,
1.608911, 1.062873, 2.065704, 1, 1, 1, 1, 1,
1.626035, -0.5551365, 0.5545884, 1, 1, 1, 1, 1,
1.632493, 2.59061, -0.01564313, 1, 1, 1, 1, 1,
1.634423, 0.5291506, 1.556294, 1, 1, 1, 1, 1,
1.638815, -0.2330893, 1.792961, 1, 1, 1, 1, 1,
1.640433, -0.0957356, 1.958865, 1, 1, 1, 1, 1,
1.65194, 0.05720397, 1.116106, 0, 0, 1, 1, 1,
1.657696, -0.2904665, 2.85305, 1, 0, 0, 1, 1,
1.672002, -0.7933353, 2.78661, 1, 0, 0, 1, 1,
1.673016, 0.314066, 0.9593253, 1, 0, 0, 1, 1,
1.696306, 0.08357311, 1.063752, 1, 0, 0, 1, 1,
1.696357, -0.2951604, 1.475842, 1, 0, 0, 1, 1,
1.703301, 1.556696, -0.4139062, 0, 0, 0, 1, 1,
1.710941, 0.3389525, 2.011601, 0, 0, 0, 1, 1,
1.714015, 0.8732405, 2.471799, 0, 0, 0, 1, 1,
1.739575, 0.1259087, 0.3449273, 0, 0, 0, 1, 1,
1.75401, -1.199892, 0.9012991, 0, 0, 0, 1, 1,
1.772588, 1.661438, 0.3736823, 0, 0, 0, 1, 1,
1.786444, 1.504538, -0.6395609, 0, 0, 0, 1, 1,
1.790745, 0.5041899, 1.836897, 1, 1, 1, 1, 1,
1.79104, -1.189909, 1.584927, 1, 1, 1, 1, 1,
1.792221, 0.03329188, 1.141128, 1, 1, 1, 1, 1,
1.812822, -1.347649, 1.896995, 1, 1, 1, 1, 1,
1.814259, -1.408849, 1.418275, 1, 1, 1, 1, 1,
1.815949, 0.7999581, 0.5270564, 1, 1, 1, 1, 1,
1.817983, -0.3970088, 2.002478, 1, 1, 1, 1, 1,
1.827538, -1.482323, 1.822934, 1, 1, 1, 1, 1,
1.876259, 0.1294347, 1.947906, 1, 1, 1, 1, 1,
1.929894, -0.5634292, 1.500883, 1, 1, 1, 1, 1,
1.935531, -0.764583, 2.850438, 1, 1, 1, 1, 1,
1.953608, 0.4757133, 1.291132, 1, 1, 1, 1, 1,
1.965221, -0.08450423, 0.8329418, 1, 1, 1, 1, 1,
2.01236, -1.864311, 4.115147, 1, 1, 1, 1, 1,
2.016016, 1.005691, 1.85054, 1, 1, 1, 1, 1,
2.022308, 0.3685812, 2.508426, 0, 0, 1, 1, 1,
2.02285, 1.854053, 2.218692, 1, 0, 0, 1, 1,
2.045367, 0.1402131, 1.465372, 1, 0, 0, 1, 1,
2.056343, -1.316661, 2.230392, 1, 0, 0, 1, 1,
2.106379, -2.563245, 0.9790224, 1, 0, 0, 1, 1,
2.15905, -1.025052, -0.1591888, 1, 0, 0, 1, 1,
2.179167, -0.5977363, 2.055367, 0, 0, 0, 1, 1,
2.185723, 0.0557472, 0.9808649, 0, 0, 0, 1, 1,
2.205638, 0.6915942, 0.6659628, 0, 0, 0, 1, 1,
2.224566, 0.7391315, -0.1425451, 0, 0, 0, 1, 1,
2.32325, 0.9245012, 0.2647599, 0, 0, 0, 1, 1,
2.360969, -2.213099, 1.233483, 0, 0, 0, 1, 1,
2.435475, 0.4576336, 1.322287, 0, 0, 0, 1, 1,
2.473506, 0.1504091, 2.167028, 1, 1, 1, 1, 1,
2.512066, 0.7530339, 0.97258, 1, 1, 1, 1, 1,
2.514749, 0.006003477, 1.446103, 1, 1, 1, 1, 1,
2.564703, -0.4022225, 1.783526, 1, 1, 1, 1, 1,
2.569497, 2.423121, 0.6825929, 1, 1, 1, 1, 1,
2.59403, -2.051269, 3.758513, 1, 1, 1, 1, 1,
3.435772, 0.4467983, 1.473541, 1, 1, 1, 1, 1
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
var radius = 9.763272;
var distance = 34.29308;
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
mvMatrix.translate( -0.215647, 0.01701748, -0.248853 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.29308);
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