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
-3.333953, -1.321505, -1.972053, 1, 0, 0, 1,
-3.229997, 1.488015, -1.390481, 1, 0.007843138, 0, 1,
-3.105202, 0.8385905, -1.673141, 1, 0.01176471, 0, 1,
-3.102428, -1.371529, -0.8108733, 1, 0.01960784, 0, 1,
-2.676303, 0.1555033, -1.348181, 1, 0.02352941, 0, 1,
-2.443127, 0.5193436, -1.779023, 1, 0.03137255, 0, 1,
-2.408003, -1.587968, -1.98573, 1, 0.03529412, 0, 1,
-2.401118, 1.264704, -0.8954559, 1, 0.04313726, 0, 1,
-2.391535, -2.449296, -0.4267652, 1, 0.04705882, 0, 1,
-2.384687, -0.544834, -1.388007, 1, 0.05490196, 0, 1,
-2.309924, -0.06339178, -1.982859, 1, 0.05882353, 0, 1,
-2.293076, 0.174109, -3.373498, 1, 0.06666667, 0, 1,
-2.289624, -0.8191351, -2.624635, 1, 0.07058824, 0, 1,
-2.280059, 0.9365106, 0.1993018, 1, 0.07843138, 0, 1,
-2.249076, 0.2174391, -1.129239, 1, 0.08235294, 0, 1,
-2.245032, 0.7125942, -1.852394, 1, 0.09019608, 0, 1,
-2.171487, -1.899815, -1.612607, 1, 0.09411765, 0, 1,
-2.108588, 1.169648, -1.098747, 1, 0.1019608, 0, 1,
-2.098639, 0.6287509, -2.00451, 1, 0.1098039, 0, 1,
-2.087758, -0.5126064, -1.369461, 1, 0.1137255, 0, 1,
-2.083437, 1.745317, -1.375157, 1, 0.1215686, 0, 1,
-2.083213, 0.1006696, -1.607869, 1, 0.1254902, 0, 1,
-2.07091, -0.5127655, -1.398525, 1, 0.1333333, 0, 1,
-2.065585, -1.553903, -0.8248646, 1, 0.1372549, 0, 1,
-2.057939, 0.5060714, -2.346399, 1, 0.145098, 0, 1,
-2.049306, -1.106689, -1.444973, 1, 0.1490196, 0, 1,
-2.048985, 1.856015, -0.6239182, 1, 0.1568628, 0, 1,
-2.014042, -0.7500087, -1.86225, 1, 0.1607843, 0, 1,
-1.999469, -0.5760006, -1.895244, 1, 0.1686275, 0, 1,
-1.989285, -0.3515031, -3.259491, 1, 0.172549, 0, 1,
-1.979294, 1.703656, -1.979318, 1, 0.1803922, 0, 1,
-1.945654, -0.830384, -2.27782, 1, 0.1843137, 0, 1,
-1.941567, -0.8181515, -2.612048, 1, 0.1921569, 0, 1,
-1.901402, -1.017782, -3.027808, 1, 0.1960784, 0, 1,
-1.890077, -0.0317921, -3.299148, 1, 0.2039216, 0, 1,
-1.887531, -0.4422156, -1.446747, 1, 0.2117647, 0, 1,
-1.856054, -0.519835, -1.949963, 1, 0.2156863, 0, 1,
-1.850482, -0.4380581, -1.686975, 1, 0.2235294, 0, 1,
-1.81915, -1.08432, -1.666504, 1, 0.227451, 0, 1,
-1.781207, 0.1238059, -0.717109, 1, 0.2352941, 0, 1,
-1.746873, 1.811334, 0.2333283, 1, 0.2392157, 0, 1,
-1.745889, -0.8852949, -1.497536, 1, 0.2470588, 0, 1,
-1.735719, -0.2856332, -1.780926, 1, 0.2509804, 0, 1,
-1.726771, 0.3121717, -2.405721, 1, 0.2588235, 0, 1,
-1.723769, -1.281628, -1.544795, 1, 0.2627451, 0, 1,
-1.721888, 0.8907204, -1.802264, 1, 0.2705882, 0, 1,
-1.699478, -0.4055698, -1.407874, 1, 0.2745098, 0, 1,
-1.690645, -0.4572082, -2.158176, 1, 0.282353, 0, 1,
-1.683385, -2.044206, -0.455701, 1, 0.2862745, 0, 1,
-1.672427, 0.1113174, -2.232901, 1, 0.2941177, 0, 1,
-1.668216, -0.5644956, -2.263726, 1, 0.3019608, 0, 1,
-1.663022, -0.2680591, -1.239772, 1, 0.3058824, 0, 1,
-1.65473, 0.4235404, -0.1128379, 1, 0.3137255, 0, 1,
-1.651942, 0.1620133, -2.584411, 1, 0.3176471, 0, 1,
-1.649989, 1.087095, -0.9539376, 1, 0.3254902, 0, 1,
-1.635941, -1.56216, -1.348457, 1, 0.3294118, 0, 1,
-1.618926, -1.564654, -3.164735, 1, 0.3372549, 0, 1,
-1.612669, 0.1279976, -0.971114, 1, 0.3411765, 0, 1,
-1.611734, -0.05292904, -1.378802, 1, 0.3490196, 0, 1,
-1.603097, -1.311812, -2.467117, 1, 0.3529412, 0, 1,
-1.591186, -0.7011482, -2.80621, 1, 0.3607843, 0, 1,
-1.588722, 0.7968984, -0.07358136, 1, 0.3647059, 0, 1,
-1.57843, 0.5867669, -0.872042, 1, 0.372549, 0, 1,
-1.554888, -0.5290611, -1.594868, 1, 0.3764706, 0, 1,
-1.538584, 0.8767056, -0.4448619, 1, 0.3843137, 0, 1,
-1.537053, -2.831903, -3.468535, 1, 0.3882353, 0, 1,
-1.531489, 0.6192076, -0.642491, 1, 0.3960784, 0, 1,
-1.526607, -0.4380603, -3.536212, 1, 0.4039216, 0, 1,
-1.523405, 1.87529, 0.05572695, 1, 0.4078431, 0, 1,
-1.511941, -0.2667469, -0.9375678, 1, 0.4156863, 0, 1,
-1.506749, -0.3524882, -1.871028, 1, 0.4196078, 0, 1,
-1.498886, -1.226277, -0.514577, 1, 0.427451, 0, 1,
-1.492256, -0.8839751, -2.314347, 1, 0.4313726, 0, 1,
-1.473568, 0.06261665, -1.012908, 1, 0.4392157, 0, 1,
-1.462557, -1.482947, -0.05332117, 1, 0.4431373, 0, 1,
-1.447331, -0.05127743, -2.104155, 1, 0.4509804, 0, 1,
-1.445928, 0.3269151, -2.15064, 1, 0.454902, 0, 1,
-1.436917, 0.5416496, -1.88016, 1, 0.4627451, 0, 1,
-1.434504, 1.082182, -0.4654509, 1, 0.4666667, 0, 1,
-1.429218, 1.456776, -1.101624, 1, 0.4745098, 0, 1,
-1.394183, -0.3893104, -2.145768, 1, 0.4784314, 0, 1,
-1.392532, -0.9928007, -1.827681, 1, 0.4862745, 0, 1,
-1.385308, -0.6234444, -2.819166, 1, 0.4901961, 0, 1,
-1.376445, -0.5814291, -3.849869, 1, 0.4980392, 0, 1,
-1.375705, 0.284193, -2.783671, 1, 0.5058824, 0, 1,
-1.366115, -0.05627315, -1.747768, 1, 0.509804, 0, 1,
-1.365401, -0.6953608, -1.584337, 1, 0.5176471, 0, 1,
-1.36386, 0.6238551, 1.409044, 1, 0.5215687, 0, 1,
-1.360605, 0.1720184, -1.897193, 1, 0.5294118, 0, 1,
-1.348597, 0.1397392, -4.166937, 1, 0.5333334, 0, 1,
-1.343179, -1.833992, -2.878176, 1, 0.5411765, 0, 1,
-1.338621, 0.672931, -0.7977553, 1, 0.5450981, 0, 1,
-1.334695, -0.04364454, -1.501237, 1, 0.5529412, 0, 1,
-1.324214, -0.8223973, -1.286819, 1, 0.5568628, 0, 1,
-1.309638, -1.130784, -2.451184, 1, 0.5647059, 0, 1,
-1.306223, 0.6901671, -0.6498813, 1, 0.5686275, 0, 1,
-1.289295, 0.4459194, -2.657536, 1, 0.5764706, 0, 1,
-1.267978, -1.406217, -2.338432, 1, 0.5803922, 0, 1,
-1.267658, 0.5738212, -1.815442, 1, 0.5882353, 0, 1,
-1.26706, -0.03392226, -2.333563, 1, 0.5921569, 0, 1,
-1.251064, -0.351917, -2.4861, 1, 0.6, 0, 1,
-1.24814, 2.035198, -0.2657904, 1, 0.6078432, 0, 1,
-1.241542, 1.680641, -0.5286821, 1, 0.6117647, 0, 1,
-1.237425, -1.693626, -3.474592, 1, 0.6196079, 0, 1,
-1.231819, 0.6094211, 1.397143, 1, 0.6235294, 0, 1,
-1.219753, 1.199163, -0.2282792, 1, 0.6313726, 0, 1,
-1.217743, -0.2321565, -3.935349, 1, 0.6352941, 0, 1,
-1.200181, -0.2892625, -0.6380848, 1, 0.6431373, 0, 1,
-1.193646, -0.7282926, -1.198686, 1, 0.6470588, 0, 1,
-1.188427, -1.750714, -3.160852, 1, 0.654902, 0, 1,
-1.181903, -1.554902, 0.3549275, 1, 0.6588235, 0, 1,
-1.17785, 0.5947907, -1.134584, 1, 0.6666667, 0, 1,
-1.171607, -0.5722376, -0.8351217, 1, 0.6705883, 0, 1,
-1.152258, 0.9674432, 0.1583437, 1, 0.6784314, 0, 1,
-1.145064, -2.166825, -3.368113, 1, 0.682353, 0, 1,
-1.143426, 0.3352319, -1.198931, 1, 0.6901961, 0, 1,
-1.139061, 0.8785502, -0.6596045, 1, 0.6941177, 0, 1,
-1.136141, 0.551714, -0.2792358, 1, 0.7019608, 0, 1,
-1.132425, 0.3343379, -0.6427048, 1, 0.7098039, 0, 1,
-1.132419, -2.308663, -2.113656, 1, 0.7137255, 0, 1,
-1.128159, 0.1717801, -2.416403, 1, 0.7215686, 0, 1,
-1.126001, 1.749388, -0.03133822, 1, 0.7254902, 0, 1,
-1.118889, -1.881186, -3.847359, 1, 0.7333333, 0, 1,
-1.114478, -0.8812003, -3.595794, 1, 0.7372549, 0, 1,
-1.111206, 0.2880672, -2.599876, 1, 0.7450981, 0, 1,
-1.108019, 0.2959207, -1.415239, 1, 0.7490196, 0, 1,
-1.107286, -0.06494705, -2.404894, 1, 0.7568628, 0, 1,
-1.099443, -0.2306269, -1.421634, 1, 0.7607843, 0, 1,
-1.099035, 1.47106, -0.6305525, 1, 0.7686275, 0, 1,
-1.090833, -2.268091, -3.902626, 1, 0.772549, 0, 1,
-1.085418, 1.884908, -2.325372, 1, 0.7803922, 0, 1,
-1.081497, -0.1889963, -0.6846154, 1, 0.7843137, 0, 1,
-1.079258, -0.5154122, -1.792372, 1, 0.7921569, 0, 1,
-1.074862, 0.257306, -2.357507, 1, 0.7960784, 0, 1,
-1.071659, 0.2450157, -1.043435, 1, 0.8039216, 0, 1,
-1.065881, 0.9608362, -1.408494, 1, 0.8117647, 0, 1,
-1.06125, 0.08917541, -1.97459, 1, 0.8156863, 0, 1,
-1.060295, 0.2613857, -0.6312773, 1, 0.8235294, 0, 1,
-1.055627, 0.04065807, -2.349096, 1, 0.827451, 0, 1,
-1.050036, -0.1541048, -0.3303284, 1, 0.8352941, 0, 1,
-1.044297, 0.980784, -0.8651641, 1, 0.8392157, 0, 1,
-1.041186, 0.8414934, 1.152846, 1, 0.8470588, 0, 1,
-1.039364, 0.8416968, -3.503757, 1, 0.8509804, 0, 1,
-1.036004, 0.9673833, -1.872895, 1, 0.8588235, 0, 1,
-1.034537, 0.6222848, -0.3644364, 1, 0.8627451, 0, 1,
-1.025138, -1.039488, -1.926607, 1, 0.8705882, 0, 1,
-1.022629, 1.527273, 0.6969178, 1, 0.8745098, 0, 1,
-1.019822, 0.1770322, -0.7814972, 1, 0.8823529, 0, 1,
-1.01393, -1.208685, -1.687091, 1, 0.8862745, 0, 1,
-1.01202, -1.10876, -1.871222, 1, 0.8941177, 0, 1,
-1.008588, 0.9529719, -1.873524, 1, 0.8980392, 0, 1,
-1.004332, -0.2935047, -1.747324, 1, 0.9058824, 0, 1,
-0.9970209, -0.2004924, -4.016392, 1, 0.9137255, 0, 1,
-0.9950928, -2.01982, -2.674568, 1, 0.9176471, 0, 1,
-0.9944453, -0.8480124, -0.3076022, 1, 0.9254902, 0, 1,
-0.99422, -0.6296359, -1.663934, 1, 0.9294118, 0, 1,
-0.9936748, 1.28533, -2.877146, 1, 0.9372549, 0, 1,
-0.9844798, 1.658662, -0.1271829, 1, 0.9411765, 0, 1,
-0.9830469, 1.012861, -1.048289, 1, 0.9490196, 0, 1,
-0.9798341, 1.474537, -0.04289706, 1, 0.9529412, 0, 1,
-0.9768389, -0.03668996, -1.594412, 1, 0.9607843, 0, 1,
-0.9760035, -0.8579266, -1.094532, 1, 0.9647059, 0, 1,
-0.9757994, 0.4065935, -0.1862202, 1, 0.972549, 0, 1,
-0.9753828, 0.2275183, -1.131198, 1, 0.9764706, 0, 1,
-0.9734883, 1.98707, 0.6001834, 1, 0.9843137, 0, 1,
-0.9725047, -0.8578351, -2.993146, 1, 0.9882353, 0, 1,
-0.9724194, 0.3775765, -1.018347, 1, 0.9960784, 0, 1,
-0.971684, 0.7336951, -0.257416, 0.9960784, 1, 0, 1,
-0.9683365, -1.367844, -1.789524, 0.9921569, 1, 0, 1,
-0.9580414, 1.110699, -1.169231, 0.9843137, 1, 0, 1,
-0.9531742, 1.16804, -0.390168, 0.9803922, 1, 0, 1,
-0.9492931, 0.4512807, -2.626451, 0.972549, 1, 0, 1,
-0.9475861, -0.7558369, -2.210786, 0.9686275, 1, 0, 1,
-0.945217, -0.3331202, -2.097064, 0.9607843, 1, 0, 1,
-0.9421081, -1.051318, -1.957464, 0.9568627, 1, 0, 1,
-0.937295, 0.2816059, -1.393138, 0.9490196, 1, 0, 1,
-0.9280406, -0.8904476, -2.51284, 0.945098, 1, 0, 1,
-0.921672, 2.19761, 1.290338, 0.9372549, 1, 0, 1,
-0.9103662, -1.084819, -1.125954, 0.9333333, 1, 0, 1,
-0.9050382, 0.4543928, -1.487239, 0.9254902, 1, 0, 1,
-0.8949596, -1.277663, -4.329155, 0.9215686, 1, 0, 1,
-0.8928391, 0.5781389, -2.217718, 0.9137255, 1, 0, 1,
-0.8800505, 0.1591565, -0.5293539, 0.9098039, 1, 0, 1,
-0.8784958, -0.7204655, -4.095935, 0.9019608, 1, 0, 1,
-0.8720592, -0.7967239, -1.483874, 0.8941177, 1, 0, 1,
-0.8697823, 2.069842, -1.737979, 0.8901961, 1, 0, 1,
-0.8650261, -0.8785552, -3.957604, 0.8823529, 1, 0, 1,
-0.8642837, -0.1558896, -2.689903, 0.8784314, 1, 0, 1,
-0.8601942, 0.6465407, -1.458888, 0.8705882, 1, 0, 1,
-0.8594785, -1.193685, -2.088392, 0.8666667, 1, 0, 1,
-0.8594136, 0.02379359, -0.785748, 0.8588235, 1, 0, 1,
-0.8584012, -0.06395867, -1.337776, 0.854902, 1, 0, 1,
-0.8579611, 1.892715, 0.3015003, 0.8470588, 1, 0, 1,
-0.8543922, -0.7488776, -2.58756, 0.8431373, 1, 0, 1,
-0.8499011, 0.1623647, -1.004207, 0.8352941, 1, 0, 1,
-0.8480945, 1.086978, -2.087833, 0.8313726, 1, 0, 1,
-0.8478615, -0.4048052, 1.702584, 0.8235294, 1, 0, 1,
-0.8471884, 0.4397397, -2.039226, 0.8196079, 1, 0, 1,
-0.84711, -2.427556, -3.045493, 0.8117647, 1, 0, 1,
-0.8456228, 0.533846, -1.216908, 0.8078431, 1, 0, 1,
-0.8445798, 1.183946, -1.615411, 0.8, 1, 0, 1,
-0.8417013, -1.703527, -1.75422, 0.7921569, 1, 0, 1,
-0.8244521, 0.7229764, -1.390423, 0.7882353, 1, 0, 1,
-0.819815, 0.7615668, -2.764459, 0.7803922, 1, 0, 1,
-0.8180082, -0.9179304, -1.282087, 0.7764706, 1, 0, 1,
-0.814763, 1.103572, 0.1416421, 0.7686275, 1, 0, 1,
-0.8139663, -0.5438775, -1.583559, 0.7647059, 1, 0, 1,
-0.8136492, 0.3068248, -2.826994, 0.7568628, 1, 0, 1,
-0.8122956, -1.752154, -1.765871, 0.7529412, 1, 0, 1,
-0.8093457, 0.3752895, -1.748463, 0.7450981, 1, 0, 1,
-0.7941939, -0.6115085, -3.165123, 0.7411765, 1, 0, 1,
-0.7935034, -0.3389725, -1.099082, 0.7333333, 1, 0, 1,
-0.7925587, -0.0585422, -2.932357, 0.7294118, 1, 0, 1,
-0.7880477, 1.405456, -1.238216, 0.7215686, 1, 0, 1,
-0.7866986, -2.649904, -3.208658, 0.7176471, 1, 0, 1,
-0.780495, 1.622189, 0.1558524, 0.7098039, 1, 0, 1,
-0.780192, -0.09926109, -2.350722, 0.7058824, 1, 0, 1,
-0.7771484, -0.5092053, -3.694525, 0.6980392, 1, 0, 1,
-0.7767231, 0.8776474, -0.9504004, 0.6901961, 1, 0, 1,
-0.7728774, -0.7676994, -1.155972, 0.6862745, 1, 0, 1,
-0.7711863, 0.1971983, -1.504052, 0.6784314, 1, 0, 1,
-0.7703801, 0.1430159, -1.194145, 0.6745098, 1, 0, 1,
-0.767123, -0.5727494, -4.15844, 0.6666667, 1, 0, 1,
-0.7600269, 0.8510317, -1.776701, 0.6627451, 1, 0, 1,
-0.7539971, -1.296464, -2.602555, 0.654902, 1, 0, 1,
-0.7527326, 1.234394, -0.1241685, 0.6509804, 1, 0, 1,
-0.7448961, 0.2873531, -1.746805, 0.6431373, 1, 0, 1,
-0.7347548, -1.547333, -3.736404, 0.6392157, 1, 0, 1,
-0.7345435, 2.204992, -1.006961, 0.6313726, 1, 0, 1,
-0.7334056, -1.646692, -3.044529, 0.627451, 1, 0, 1,
-0.7331678, -2.025073, -1.777221, 0.6196079, 1, 0, 1,
-0.7308598, -1.771951, -2.408551, 0.6156863, 1, 0, 1,
-0.7276764, -1.28526, -3.911983, 0.6078432, 1, 0, 1,
-0.7242714, 1.596747, -0.9490186, 0.6039216, 1, 0, 1,
-0.7208057, 1.319958, -1.898177, 0.5960785, 1, 0, 1,
-0.7161232, -1.090179, -3.496371, 0.5882353, 1, 0, 1,
-0.716086, 0.1993537, -1.146214, 0.5843138, 1, 0, 1,
-0.7125911, -0.4182658, -1.245978, 0.5764706, 1, 0, 1,
-0.7116662, -1.148124, -2.971084, 0.572549, 1, 0, 1,
-0.7055179, 2.492801, 1.958397, 0.5647059, 1, 0, 1,
-0.7028256, 0.5831793, -1.116471, 0.5607843, 1, 0, 1,
-0.7025598, 0.05475651, -1.820724, 0.5529412, 1, 0, 1,
-0.6937779, -1.791307, -3.023084, 0.5490196, 1, 0, 1,
-0.6925038, -0.3859843, -1.881976, 0.5411765, 1, 0, 1,
-0.6897826, -0.4332088, -2.306478, 0.5372549, 1, 0, 1,
-0.6825534, -0.4706086, -3.238148, 0.5294118, 1, 0, 1,
-0.670575, -0.6983728, -2.138183, 0.5254902, 1, 0, 1,
-0.6685939, -0.05973047, -1.726852, 0.5176471, 1, 0, 1,
-0.6666497, -0.7929053, -1.203566, 0.5137255, 1, 0, 1,
-0.6656637, -1.036152, -1.59624, 0.5058824, 1, 0, 1,
-0.6636226, 0.5903322, -0.9890132, 0.5019608, 1, 0, 1,
-0.6573724, 0.6065527, -2.098716, 0.4941176, 1, 0, 1,
-0.6541759, 1.400352, -0.3737355, 0.4862745, 1, 0, 1,
-0.6541104, 1.586619, -1.379762, 0.4823529, 1, 0, 1,
-0.6532968, 0.4451218, -1.528888, 0.4745098, 1, 0, 1,
-0.6515244, -1.224639, -1.233567, 0.4705882, 1, 0, 1,
-0.6491564, 0.1144335, -2.150176, 0.4627451, 1, 0, 1,
-0.6482994, -0.2375984, -1.51552, 0.4588235, 1, 0, 1,
-0.6454496, -0.3260472, -2.637574, 0.4509804, 1, 0, 1,
-0.6427947, 0.8180293, -0.3233607, 0.4470588, 1, 0, 1,
-0.6396178, -1.884731, -3.442284, 0.4392157, 1, 0, 1,
-0.6391082, -0.8343096, -2.300064, 0.4352941, 1, 0, 1,
-0.6311126, -0.3752208, -1.419557, 0.427451, 1, 0, 1,
-0.630679, 0.003494832, -0.4554893, 0.4235294, 1, 0, 1,
-0.6259419, 1.052776, -1.151872, 0.4156863, 1, 0, 1,
-0.6159574, -1.048041, -2.832937, 0.4117647, 1, 0, 1,
-0.6028038, 0.7602935, 0.1962791, 0.4039216, 1, 0, 1,
-0.6027321, -0.6800814, -1.817081, 0.3960784, 1, 0, 1,
-0.6022778, -0.10976, -0.9762262, 0.3921569, 1, 0, 1,
-0.6021997, 0.09350972, -1.207986, 0.3843137, 1, 0, 1,
-0.5999048, 0.8877757, 0.1703893, 0.3803922, 1, 0, 1,
-0.5938824, -1.036389, -1.075168, 0.372549, 1, 0, 1,
-0.5900042, -0.4372095, -1.286745, 0.3686275, 1, 0, 1,
-0.5802208, 1.174686, -1.928669, 0.3607843, 1, 0, 1,
-0.5760508, -2.216522, -2.118183, 0.3568628, 1, 0, 1,
-0.5748729, -0.7671121, -2.456078, 0.3490196, 1, 0, 1,
-0.573594, 0.4333171, 0.3399583, 0.345098, 1, 0, 1,
-0.5654631, 0.1962143, 0.1332605, 0.3372549, 1, 0, 1,
-0.5543438, -0.1588749, -3.704139, 0.3333333, 1, 0, 1,
-0.5503781, -0.3370394, -1.948469, 0.3254902, 1, 0, 1,
-0.5489107, -0.4618961, -2.930476, 0.3215686, 1, 0, 1,
-0.5458329, -1.452494, -3.219886, 0.3137255, 1, 0, 1,
-0.5428199, -0.9666712, -3.072756, 0.3098039, 1, 0, 1,
-0.5401945, 0.2163863, -0.1987204, 0.3019608, 1, 0, 1,
-0.5400169, -1.096883, -1.100894, 0.2941177, 1, 0, 1,
-0.5358171, 1.105658, -0.5394236, 0.2901961, 1, 0, 1,
-0.5315319, -1.104077, -3.798636, 0.282353, 1, 0, 1,
-0.5311611, -2.039522, -2.873201, 0.2784314, 1, 0, 1,
-0.5259277, 1.537438, 0.7819778, 0.2705882, 1, 0, 1,
-0.5252175, -1.168967, -1.973194, 0.2666667, 1, 0, 1,
-0.5251774, -0.7354935, -2.681504, 0.2588235, 1, 0, 1,
-0.5181116, 0.3893643, -0.4316681, 0.254902, 1, 0, 1,
-0.5180587, -0.1106938, -1.734422, 0.2470588, 1, 0, 1,
-0.5173514, 0.1861977, -1.799049, 0.2431373, 1, 0, 1,
-0.511898, -1.085139, -2.053723, 0.2352941, 1, 0, 1,
-0.5089489, 0.5574399, 1.15596, 0.2313726, 1, 0, 1,
-0.5086686, -0.265449, -3.947552, 0.2235294, 1, 0, 1,
-0.5080808, -0.9933805, -2.461466, 0.2196078, 1, 0, 1,
-0.5074898, 0.9108911, -0.3422086, 0.2117647, 1, 0, 1,
-0.5034912, -1.001506, -2.729442, 0.2078431, 1, 0, 1,
-0.4968758, 1.506637, 0.008115252, 0.2, 1, 0, 1,
-0.4964252, -1.022817, -2.613548, 0.1921569, 1, 0, 1,
-0.4937872, -0.4056168, -1.406683, 0.1882353, 1, 0, 1,
-0.4892951, -0.5814896, -2.814068, 0.1803922, 1, 0, 1,
-0.4794037, -0.8053381, -3.720557, 0.1764706, 1, 0, 1,
-0.4788291, -0.686249, -2.45027, 0.1686275, 1, 0, 1,
-0.4766068, -0.7295941, -1.485638, 0.1647059, 1, 0, 1,
-0.4751912, -0.1458772, -2.012691, 0.1568628, 1, 0, 1,
-0.4744407, 0.7484972, 1.594237, 0.1529412, 1, 0, 1,
-0.468509, 0.4865642, -0.6362076, 0.145098, 1, 0, 1,
-0.4677887, -1.75847, -3.529157, 0.1411765, 1, 0, 1,
-0.4673412, 0.5308627, 0.6767236, 0.1333333, 1, 0, 1,
-0.4655108, 0.1977566, -0.7855855, 0.1294118, 1, 0, 1,
-0.4635178, -1.477825, -4.015503, 0.1215686, 1, 0, 1,
-0.4582259, -0.8878964, -1.75332, 0.1176471, 1, 0, 1,
-0.457454, -1.056568, -1.833155, 0.1098039, 1, 0, 1,
-0.4521542, -1.840499, -4.018385, 0.1058824, 1, 0, 1,
-0.4513446, 0.212258, 0.08966477, 0.09803922, 1, 0, 1,
-0.4466475, 0.4270172, -1.123772, 0.09019608, 1, 0, 1,
-0.4435949, -0.09027185, -3.146449, 0.08627451, 1, 0, 1,
-0.4420408, -0.2620015, -2.572419, 0.07843138, 1, 0, 1,
-0.432504, 0.6072623, -0.8913611, 0.07450981, 1, 0, 1,
-0.4322504, -0.4201225, -1.504293, 0.06666667, 1, 0, 1,
-0.4303849, -1.387588, -4.499249, 0.0627451, 1, 0, 1,
-0.4298476, -0.8220484, -1.671657, 0.05490196, 1, 0, 1,
-0.4257408, -0.8793586, -2.183611, 0.05098039, 1, 0, 1,
-0.4232412, -1.621517, -1.957069, 0.04313726, 1, 0, 1,
-0.4203666, 0.3766367, -2.319097, 0.03921569, 1, 0, 1,
-0.4200461, 0.3929016, -2.867531, 0.03137255, 1, 0, 1,
-0.4180758, 1.307242, -0.5736866, 0.02745098, 1, 0, 1,
-0.4180206, -0.3200701, -2.812745, 0.01960784, 1, 0, 1,
-0.4174456, 0.05192445, -2.427664, 0.01568628, 1, 0, 1,
-0.4145902, 1.250033, 0.5026922, 0.007843138, 1, 0, 1,
-0.413458, 0.7790269, -2.10097, 0.003921569, 1, 0, 1,
-0.413307, 0.9320815, -1.33376, 0, 1, 0.003921569, 1,
-0.412055, 1.360263, -1.124153, 0, 1, 0.01176471, 1,
-0.4117218, -0.3751779, 0.2639726, 0, 1, 0.01568628, 1,
-0.410119, 0.0509105, -2.069137, 0, 1, 0.02352941, 1,
-0.4100709, -0.7546, -2.178492, 0, 1, 0.02745098, 1,
-0.4083773, 0.1970429, -1.092129, 0, 1, 0.03529412, 1,
-0.4081766, 0.6330138, -1.068103, 0, 1, 0.03921569, 1,
-0.4063765, 0.07242267, -2.004759, 0, 1, 0.04705882, 1,
-0.4026693, -2.310997, -3.016206, 0, 1, 0.05098039, 1,
-0.4021502, -0.3212235, -2.239546, 0, 1, 0.05882353, 1,
-0.4004385, -0.4423459, -0.4216333, 0, 1, 0.0627451, 1,
-0.3970442, -0.2531869, -2.39297, 0, 1, 0.07058824, 1,
-0.396737, -0.03328907, 0.2701231, 0, 1, 0.07450981, 1,
-0.3921565, 1.050657, 0.5690572, 0, 1, 0.08235294, 1,
-0.3898263, -0.5313463, -2.083967, 0, 1, 0.08627451, 1,
-0.3866886, 0.2265779, 0.4001207, 0, 1, 0.09411765, 1,
-0.3812507, -0.1183711, -1.980354, 0, 1, 0.1019608, 1,
-0.3765301, -0.570899, -3.245006, 0, 1, 0.1058824, 1,
-0.3763227, 0.5539381, -0.02153978, 0, 1, 0.1137255, 1,
-0.371778, -0.673546, -3.709755, 0, 1, 0.1176471, 1,
-0.3682956, -1.095002, -2.329639, 0, 1, 0.1254902, 1,
-0.3671903, 0.07225086, -0.4661839, 0, 1, 0.1294118, 1,
-0.3665261, 0.6286638, 0.5355662, 0, 1, 0.1372549, 1,
-0.363071, -0.8426778, -2.393719, 0, 1, 0.1411765, 1,
-0.3576328, 1.297238, -1.205748, 0, 1, 0.1490196, 1,
-0.3559421, 0.3120931, 0.8812644, 0, 1, 0.1529412, 1,
-0.3558055, -1.308583, -2.94628, 0, 1, 0.1607843, 1,
-0.3552554, 0.5254013, -2.079664, 0, 1, 0.1647059, 1,
-0.3538233, -0.8892723, -3.749404, 0, 1, 0.172549, 1,
-0.3515516, -1.783161, -1.553188, 0, 1, 0.1764706, 1,
-0.345948, 1.442554, 0.1638158, 0, 1, 0.1843137, 1,
-0.3382609, -1.257312, -3.088874, 0, 1, 0.1882353, 1,
-0.3310826, 0.6079538, -0.9873194, 0, 1, 0.1960784, 1,
-0.3294672, 0.2297398, -1.175991, 0, 1, 0.2039216, 1,
-0.3279671, -1.023283, -3.207127, 0, 1, 0.2078431, 1,
-0.3266942, -0.4338669, -4.306811, 0, 1, 0.2156863, 1,
-0.3242612, -0.6020595, -2.827196, 0, 1, 0.2196078, 1,
-0.3233874, 0.1234559, -1.385016, 0, 1, 0.227451, 1,
-0.3231272, -1.554476, -4.373719, 0, 1, 0.2313726, 1,
-0.3167868, 0.740371, -0.4792324, 0, 1, 0.2392157, 1,
-0.3160571, 0.02690466, -1.231884, 0, 1, 0.2431373, 1,
-0.3130459, 0.4274454, 0.1256961, 0, 1, 0.2509804, 1,
-0.3111056, -0.2117516, -2.202129, 0, 1, 0.254902, 1,
-0.3099016, -0.05851944, -1.387483, 0, 1, 0.2627451, 1,
-0.3067512, 0.2645852, -0.4156086, 0, 1, 0.2666667, 1,
-0.3029531, 0.7042634, -0.2715057, 0, 1, 0.2745098, 1,
-0.3028072, -0.4345784, -2.980426, 0, 1, 0.2784314, 1,
-0.301515, 0.3802771, -0.8193774, 0, 1, 0.2862745, 1,
-0.2986481, -0.4834696, -3.375908, 0, 1, 0.2901961, 1,
-0.2940813, 0.6792729, 0.6634066, 0, 1, 0.2980392, 1,
-0.2939237, 0.1990187, 0.2572892, 0, 1, 0.3058824, 1,
-0.2930155, 0.3852961, 0.05592046, 0, 1, 0.3098039, 1,
-0.2910207, -1.320101, -2.434401, 0, 1, 0.3176471, 1,
-0.2905117, 1.272938, -1.822264, 0, 1, 0.3215686, 1,
-0.2902892, 1.002931, 0.3474811, 0, 1, 0.3294118, 1,
-0.2882257, -0.8660748, -3.715465, 0, 1, 0.3333333, 1,
-0.2876036, -0.3724772, -3.431263, 0, 1, 0.3411765, 1,
-0.2872948, 0.9316602, -2.995157, 0, 1, 0.345098, 1,
-0.2812367, 1.125957, -1.239229, 0, 1, 0.3529412, 1,
-0.2800333, 0.7106441, -0.896255, 0, 1, 0.3568628, 1,
-0.2768309, -0.1194858, -1.418562, 0, 1, 0.3647059, 1,
-0.2752828, -0.3543273, -3.562131, 0, 1, 0.3686275, 1,
-0.2735249, -0.4531853, -4.197176, 0, 1, 0.3764706, 1,
-0.2727766, -0.4625734, -1.846365, 0, 1, 0.3803922, 1,
-0.2702152, -0.7615179, -2.635231, 0, 1, 0.3882353, 1,
-0.2687475, -1.397981, -2.988976, 0, 1, 0.3921569, 1,
-0.2603533, -1.118592, -0.6330729, 0, 1, 0.4, 1,
-0.2603224, -0.1153984, -0.1420846, 0, 1, 0.4078431, 1,
-0.2588905, -0.1016475, -3.378706, 0, 1, 0.4117647, 1,
-0.2576991, -0.9913551, -3.856659, 0, 1, 0.4196078, 1,
-0.2555095, 0.7871734, -1.649491, 0, 1, 0.4235294, 1,
-0.2543071, -0.5173293, -1.510418, 0, 1, 0.4313726, 1,
-0.2542012, -0.4985557, -1.515742, 0, 1, 0.4352941, 1,
-0.247356, 0.7948852, 0.2814087, 0, 1, 0.4431373, 1,
-0.2472008, 0.983206, 1.334037, 0, 1, 0.4470588, 1,
-0.2410654, -0.7536209, -1.380594, 0, 1, 0.454902, 1,
-0.2402803, -0.04426105, -1.502249, 0, 1, 0.4588235, 1,
-0.2399041, -0.515553, -1.710445, 0, 1, 0.4666667, 1,
-0.2366001, 2.536958, -0.362624, 0, 1, 0.4705882, 1,
-0.2323988, 0.02861698, -1.959771, 0, 1, 0.4784314, 1,
-0.232013, 1.579131, 0.1326608, 0, 1, 0.4823529, 1,
-0.2251518, 0.008757322, -1.734571, 0, 1, 0.4901961, 1,
-0.2245606, 0.7657229, -0.06960477, 0, 1, 0.4941176, 1,
-0.2210138, 0.03366316, -3.179319, 0, 1, 0.5019608, 1,
-0.220154, -0.01402521, -1.985246, 0, 1, 0.509804, 1,
-0.2190662, 0.6080013, -0.6525006, 0, 1, 0.5137255, 1,
-0.2187068, -1.275167, -3.824251, 0, 1, 0.5215687, 1,
-0.2173526, -0.9461458, -2.553933, 0, 1, 0.5254902, 1,
-0.2148666, 0.1102637, -1.904337, 0, 1, 0.5333334, 1,
-0.211856, -0.8450617, -4.106166, 0, 1, 0.5372549, 1,
-0.210869, -1.057867, -2.322645, 0, 1, 0.5450981, 1,
-0.2064249, 0.6044745, -0.9771412, 0, 1, 0.5490196, 1,
-0.2035436, -0.4046333, -2.994366, 0, 1, 0.5568628, 1,
-0.2016149, -1.18013, -3.372165, 0, 1, 0.5607843, 1,
-0.199613, 0.426816, 2.117644, 0, 1, 0.5686275, 1,
-0.1949762, 2.544038, 0.5039548, 0, 1, 0.572549, 1,
-0.1947767, -1.652847, -2.068654, 0, 1, 0.5803922, 1,
-0.1929468, 0.07886042, -1.323156, 0, 1, 0.5843138, 1,
-0.1918703, -1.533707, -4.746887, 0, 1, 0.5921569, 1,
-0.1897182, 1.443359, -1.505126, 0, 1, 0.5960785, 1,
-0.1858499, -1.370364, -2.943386, 0, 1, 0.6039216, 1,
-0.1818282, 0.5415059, -1.862454, 0, 1, 0.6117647, 1,
-0.181312, 0.7901779, 1.320212, 0, 1, 0.6156863, 1,
-0.1796366, 0.126624, -1.654074, 0, 1, 0.6235294, 1,
-0.1786118, 1.383184, -0.1466044, 0, 1, 0.627451, 1,
-0.1780246, -0.1940646, -2.571004, 0, 1, 0.6352941, 1,
-0.1769406, -0.8827742, -1.919309, 0, 1, 0.6392157, 1,
-0.1764359, 0.4481825, 0.3101292, 0, 1, 0.6470588, 1,
-0.1750357, 0.883518, -0.7639956, 0, 1, 0.6509804, 1,
-0.1735039, 1.212826, 1.314321, 0, 1, 0.6588235, 1,
-0.1731684, 0.3049475, -1.520438, 0, 1, 0.6627451, 1,
-0.1717064, -0.4688823, -4.578538, 0, 1, 0.6705883, 1,
-0.1697978, 0.241014, 1.525403, 0, 1, 0.6745098, 1,
-0.1649163, 0.5205467, -0.6863784, 0, 1, 0.682353, 1,
-0.1641542, 1.209844, -1.126024, 0, 1, 0.6862745, 1,
-0.1595019, -0.5839188, -2.534892, 0, 1, 0.6941177, 1,
-0.1593269, -0.8187599, -4.231091, 0, 1, 0.7019608, 1,
-0.1537341, -0.745554, -3.673127, 0, 1, 0.7058824, 1,
-0.152057, 0.04514904, -0.4006005, 0, 1, 0.7137255, 1,
-0.1518103, 0.761353, 0.06652243, 0, 1, 0.7176471, 1,
-0.1504626, -0.4764559, -3.346161, 0, 1, 0.7254902, 1,
-0.1482066, 0.3364338, -0.4045441, 0, 1, 0.7294118, 1,
-0.1460883, 1.014553, 1.061453, 0, 1, 0.7372549, 1,
-0.1459616, 0.1981368, -1.278231, 0, 1, 0.7411765, 1,
-0.1448345, -1.915528, -4.093437, 0, 1, 0.7490196, 1,
-0.1410724, -0.08049002, -1.761083, 0, 1, 0.7529412, 1,
-0.1406237, -0.5968269, -1.908432, 0, 1, 0.7607843, 1,
-0.1395208, 0.4197935, 0.6002061, 0, 1, 0.7647059, 1,
-0.1385097, -0.4718519, -3.942587, 0, 1, 0.772549, 1,
-0.1378827, 0.1414647, -0.2398897, 0, 1, 0.7764706, 1,
-0.1378229, -0.804096, -3.844769, 0, 1, 0.7843137, 1,
-0.1372078, -0.140843, -3.814983, 0, 1, 0.7882353, 1,
-0.1329886, -0.8929421, -2.769343, 0, 1, 0.7960784, 1,
-0.131782, -2.870772, -3.793528, 0, 1, 0.8039216, 1,
-0.1279032, -0.1348887, -1.383671, 0, 1, 0.8078431, 1,
-0.1244425, -0.7933943, -4.85479, 0, 1, 0.8156863, 1,
-0.1234153, 1.18143, -0.7646986, 0, 1, 0.8196079, 1,
-0.1192017, 0.7784518, -1.821936, 0, 1, 0.827451, 1,
-0.118769, -0.2865917, -0.7794107, 0, 1, 0.8313726, 1,
-0.1152898, 0.4847168, 0.8646767, 0, 1, 0.8392157, 1,
-0.1141768, 0.03345644, -2.077189, 0, 1, 0.8431373, 1,
-0.1047259, -0.004512705, 0.4711098, 0, 1, 0.8509804, 1,
-0.1030354, -0.8864912, -2.426271, 0, 1, 0.854902, 1,
-0.1024975, 0.1408117, 1.673542, 0, 1, 0.8627451, 1,
-0.09847672, -1.171295, -5.043813, 0, 1, 0.8666667, 1,
-0.09647439, -0.00802315, -2.758108, 0, 1, 0.8745098, 1,
-0.09621711, -0.9166842, -2.355258, 0, 1, 0.8784314, 1,
-0.09357937, -0.676302, -0.9016846, 0, 1, 0.8862745, 1,
-0.08984546, -0.1730708, -2.197837, 0, 1, 0.8901961, 1,
-0.08932262, 2.730618, 1.016572, 0, 1, 0.8980392, 1,
-0.08869908, -0.04698598, -1.99149, 0, 1, 0.9058824, 1,
-0.07928456, 0.05146188, -0.7915548, 0, 1, 0.9098039, 1,
-0.07823752, -1.457328, -2.841345, 0, 1, 0.9176471, 1,
-0.06974566, -0.3816995, -2.951567, 0, 1, 0.9215686, 1,
-0.05434509, -1.005762, -3.485833, 0, 1, 0.9294118, 1,
-0.05366096, -0.03193413, -1.245288, 0, 1, 0.9333333, 1,
-0.05205432, 1.328807, 1.435279, 0, 1, 0.9411765, 1,
-0.05154615, -0.6852323, -4.207685, 0, 1, 0.945098, 1,
-0.0487428, 1.32931, 0.5614135, 0, 1, 0.9529412, 1,
-0.04802268, -0.4432923, -5.190782, 0, 1, 0.9568627, 1,
-0.04480578, 1.016978, 1.447833, 0, 1, 0.9647059, 1,
-0.04172572, -0.7531034, -4.048665, 0, 1, 0.9686275, 1,
-0.04093193, -2.639245, -3.551166, 0, 1, 0.9764706, 1,
-0.03879208, 0.4649588, 0.8979006, 0, 1, 0.9803922, 1,
-0.03872625, 0.5896538, -0.09114541, 0, 1, 0.9882353, 1,
-0.03801833, 0.884851, -2.058123, 0, 1, 0.9921569, 1,
-0.03710719, 1.254846, -0.1868428, 0, 1, 1, 1,
-0.035397, -0.6990337, -2.529104, 0, 0.9921569, 1, 1,
-0.03450739, 0.7928328, -0.4579359, 0, 0.9882353, 1, 1,
-0.03190242, 1.870673, -0.1452624, 0, 0.9803922, 1, 1,
-0.03046044, -1.179529, -1.680686, 0, 0.9764706, 1, 1,
-0.02650734, 3.113725, -0.3107325, 0, 0.9686275, 1, 1,
-0.02538317, 0.3635724, 0.1479605, 0, 0.9647059, 1, 1,
-0.0229377, 0.8989944, -1.125073, 0, 0.9568627, 1, 1,
-0.01818079, 0.5033484, 0.1503311, 0, 0.9529412, 1, 1,
-0.01735852, -0.7473468, -2.517932, 0, 0.945098, 1, 1,
-0.01511385, -0.9452141, -1.727622, 0, 0.9411765, 1, 1,
-0.01387077, 0.3094445, -0.9653304, 0, 0.9333333, 1, 1,
-0.01201485, -0.7408283, -4.145883, 0, 0.9294118, 1, 1,
-0.01055122, -1.114401, -3.119575, 0, 0.9215686, 1, 1,
-0.007415071, 0.2953066, 1.121722, 0, 0.9176471, 1, 1,
-0.006095177, 0.4993699, -0.6215317, 0, 0.9098039, 1, 1,
-0.005373139, 1.845533, 0.4552023, 0, 0.9058824, 1, 1,
-0.003213146, -1.717209, -1.840097, 0, 0.8980392, 1, 1,
-0.0009941506, 1.345804, 0.9545194, 0, 0.8901961, 1, 1,
0.005656893, 0.2944897, -1.236, 0, 0.8862745, 1, 1,
0.00750507, -0.06707474, 2.54893, 0, 0.8784314, 1, 1,
0.007705991, 0.04130813, -1.848679, 0, 0.8745098, 1, 1,
0.008947898, 0.3145437, 0.5124997, 0, 0.8666667, 1, 1,
0.01769255, 1.047131, 0.2606769, 0, 0.8627451, 1, 1,
0.01804309, -1.362225, 5.09232, 0, 0.854902, 1, 1,
0.0190495, -1.099487, 1.202009, 0, 0.8509804, 1, 1,
0.02304634, -1.0992, 3.778559, 0, 0.8431373, 1, 1,
0.02406045, -1.42876, 2.994674, 0, 0.8392157, 1, 1,
0.0245243, 0.007079023, 1.231432, 0, 0.8313726, 1, 1,
0.0262076, 0.1558943, 1.162427, 0, 0.827451, 1, 1,
0.0267302, -0.3893541, 4.550916, 0, 0.8196079, 1, 1,
0.02755417, -0.803627, 2.989995, 0, 0.8156863, 1, 1,
0.02761835, -1.810839, 3.390239, 0, 0.8078431, 1, 1,
0.03097888, -0.00873326, 3.268202, 0, 0.8039216, 1, 1,
0.03741605, -0.8775111, 2.787422, 0, 0.7960784, 1, 1,
0.03833555, 0.1143463, -0.3510212, 0, 0.7882353, 1, 1,
0.04404422, -0.5073878, 3.079322, 0, 0.7843137, 1, 1,
0.05161615, -0.7744074, 3.040409, 0, 0.7764706, 1, 1,
0.05165207, -0.04260586, 2.089419, 0, 0.772549, 1, 1,
0.05441004, -1.602336, 2.502027, 0, 0.7647059, 1, 1,
0.05486603, 1.18039, -1.01491, 0, 0.7607843, 1, 1,
0.05572626, 1.144048, 1.82201, 0, 0.7529412, 1, 1,
0.05638912, -1.057187, 1.528227, 0, 0.7490196, 1, 1,
0.05919862, 1.18515, 0.5141033, 0, 0.7411765, 1, 1,
0.06057858, -0.266044, 3.208892, 0, 0.7372549, 1, 1,
0.06531478, 0.1112262, 0.09283432, 0, 0.7294118, 1, 1,
0.06991166, 1.090683, -0.3971324, 0, 0.7254902, 1, 1,
0.07238837, 2.032745, 0.6839156, 0, 0.7176471, 1, 1,
0.08315614, 0.6035674, -0.9836815, 0, 0.7137255, 1, 1,
0.08426721, -0.02812882, 2.263127, 0, 0.7058824, 1, 1,
0.08517291, -0.8271777, 1.896946, 0, 0.6980392, 1, 1,
0.09358249, -1.530036, 2.244516, 0, 0.6941177, 1, 1,
0.09478722, 0.8613869, 1.10954, 0, 0.6862745, 1, 1,
0.09552623, 0.2314595, 1.269157, 0, 0.682353, 1, 1,
0.09753653, -0.3702453, 4.234785, 0, 0.6745098, 1, 1,
0.09970057, -0.2918573, 3.821788, 0, 0.6705883, 1, 1,
0.1010668, -0.2145623, 1.349278, 0, 0.6627451, 1, 1,
0.1077265, -0.4085358, 2.51363, 0, 0.6588235, 1, 1,
0.1131708, -1.245672, 2.84243, 0, 0.6509804, 1, 1,
0.1207185, -1.430675, 2.022474, 0, 0.6470588, 1, 1,
0.1208767, -1.022143, 2.248231, 0, 0.6392157, 1, 1,
0.1267136, -0.6942016, 3.247449, 0, 0.6352941, 1, 1,
0.1288596, -0.8507508, 3.406605, 0, 0.627451, 1, 1,
0.1295037, 1.183114, -1.076471, 0, 0.6235294, 1, 1,
0.1313542, -1.843222, 2.359191, 0, 0.6156863, 1, 1,
0.1320862, -2.10559, 4.580856, 0, 0.6117647, 1, 1,
0.1333057, -0.4792173, 1.402552, 0, 0.6039216, 1, 1,
0.1394097, -0.2762291, 3.320021, 0, 0.5960785, 1, 1,
0.142863, -0.8923724, 2.110907, 0, 0.5921569, 1, 1,
0.1436659, 0.8173734, -0.5855999, 0, 0.5843138, 1, 1,
0.1474063, 1.216382, 0.1102446, 0, 0.5803922, 1, 1,
0.1481657, 0.1647184, -1.798534, 0, 0.572549, 1, 1,
0.1485065, -0.9185184, 4.375879, 0, 0.5686275, 1, 1,
0.1532595, -1.854272, 1.017959, 0, 0.5607843, 1, 1,
0.1580604, -0.4853923, 2.049527, 0, 0.5568628, 1, 1,
0.1588869, 0.9794655, 2.136249, 0, 0.5490196, 1, 1,
0.1590022, -0.3513631, 0.9062245, 0, 0.5450981, 1, 1,
0.1606651, -2.462741, 5.170283, 0, 0.5372549, 1, 1,
0.1612756, 0.3885289, 2.006402, 0, 0.5333334, 1, 1,
0.1623428, -1.550185, 3.969022, 0, 0.5254902, 1, 1,
0.1650257, -0.05309535, 3.054928, 0, 0.5215687, 1, 1,
0.1660663, 0.5857425, -0.1703664, 0, 0.5137255, 1, 1,
0.1669398, 0.4783272, -0.162403, 0, 0.509804, 1, 1,
0.1680463, 0.4168879, 0.05659057, 0, 0.5019608, 1, 1,
0.1719392, 1.255958, -1.669145, 0, 0.4941176, 1, 1,
0.1779956, -0.7045917, 1.578191, 0, 0.4901961, 1, 1,
0.1792823, 0.7923928, 1.978548, 0, 0.4823529, 1, 1,
0.1803738, 0.8218849, -0.1740462, 0, 0.4784314, 1, 1,
0.185187, -0.7470687, 5.11281, 0, 0.4705882, 1, 1,
0.1929095, 1.095362, 0.9413193, 0, 0.4666667, 1, 1,
0.197118, 1.150816, 0.1734743, 0, 0.4588235, 1, 1,
0.2005329, 0.9859649, 1.380026, 0, 0.454902, 1, 1,
0.2047769, -0.7003796, 3.545794, 0, 0.4470588, 1, 1,
0.2050496, 0.8106257, -0.4246296, 0, 0.4431373, 1, 1,
0.2070072, -0.5550229, 1.926243, 0, 0.4352941, 1, 1,
0.208363, -0.4762447, 2.454502, 0, 0.4313726, 1, 1,
0.2093592, 1.162731, -0.4133777, 0, 0.4235294, 1, 1,
0.2099643, -0.3585966, 2.928389, 0, 0.4196078, 1, 1,
0.2132646, 0.7350554, -0.2517217, 0, 0.4117647, 1, 1,
0.2158819, 0.5133394, 0.2014766, 0, 0.4078431, 1, 1,
0.2188469, 0.9734276, -0.2340757, 0, 0.4, 1, 1,
0.2211697, -0.39227, 3.767346, 0, 0.3921569, 1, 1,
0.2262902, 2.07117, -0.6395043, 0, 0.3882353, 1, 1,
0.226408, -0.1302514, 1.032098, 0, 0.3803922, 1, 1,
0.227043, -0.6957492, 2.806049, 0, 0.3764706, 1, 1,
0.2284263, 0.4062075, -0.891935, 0, 0.3686275, 1, 1,
0.2326015, -1.469885, 2.754064, 0, 0.3647059, 1, 1,
0.2326469, 0.956212, 0.6842666, 0, 0.3568628, 1, 1,
0.2341823, 0.8468785, 0.3705223, 0, 0.3529412, 1, 1,
0.2342139, 0.3345804, -0.7004541, 0, 0.345098, 1, 1,
0.2344868, 0.2947386, 1.432662, 0, 0.3411765, 1, 1,
0.2369851, -1.656344, 2.766419, 0, 0.3333333, 1, 1,
0.2419004, -1.3143, 3.545181, 0, 0.3294118, 1, 1,
0.2429786, -1.98753, 4.046905, 0, 0.3215686, 1, 1,
0.2441831, -1.50528, 4.020706, 0, 0.3176471, 1, 1,
0.2467103, 0.4106065, -0.1329, 0, 0.3098039, 1, 1,
0.247428, 0.1030155, -0.3922271, 0, 0.3058824, 1, 1,
0.2496683, 0.187366, 0.9185905, 0, 0.2980392, 1, 1,
0.2505015, 1.89756, 0.5860114, 0, 0.2901961, 1, 1,
0.2507479, 0.1525726, 2.558897, 0, 0.2862745, 1, 1,
0.252587, -1.086964, 4.734354, 0, 0.2784314, 1, 1,
0.2559337, -0.4112701, 1.1348, 0, 0.2745098, 1, 1,
0.2671373, -1.847843, 2.357314, 0, 0.2666667, 1, 1,
0.2672494, -0.5844584, 4.152536, 0, 0.2627451, 1, 1,
0.2690924, 0.5529013, 1.59737, 0, 0.254902, 1, 1,
0.2693706, 1.090734, -0.687233, 0, 0.2509804, 1, 1,
0.2703217, -1.352448, 3.562048, 0, 0.2431373, 1, 1,
0.2712881, -0.07418286, 1.719301, 0, 0.2392157, 1, 1,
0.2728296, -0.1533272, 3.976932, 0, 0.2313726, 1, 1,
0.2732503, -0.782845, 3.794218, 0, 0.227451, 1, 1,
0.2763735, -0.6649944, 3.944139, 0, 0.2196078, 1, 1,
0.2772686, 1.061058, -0.2929592, 0, 0.2156863, 1, 1,
0.2792063, 0.7165312, -1.41625, 0, 0.2078431, 1, 1,
0.2809116, 1.001001, -0.739041, 0, 0.2039216, 1, 1,
0.2820716, 1.847661, 0.06254376, 0, 0.1960784, 1, 1,
0.2847416, 0.480246, -0.3718038, 0, 0.1882353, 1, 1,
0.2907795, -0.9419975, 4.027852, 0, 0.1843137, 1, 1,
0.2945589, -0.5480669, 0.8090953, 0, 0.1764706, 1, 1,
0.2953986, -1.440352, 3.051247, 0, 0.172549, 1, 1,
0.2995816, -0.07917854, 1.391074, 0, 0.1647059, 1, 1,
0.3053096, -0.9345638, 1.756331, 0, 0.1607843, 1, 1,
0.3063418, -0.6379035, 2.359758, 0, 0.1529412, 1, 1,
0.3073435, -0.4471445, 2.023008, 0, 0.1490196, 1, 1,
0.3089609, 0.2238049, 0.7370081, 0, 0.1411765, 1, 1,
0.3119394, -0.525175, 1.83533, 0, 0.1372549, 1, 1,
0.3125961, -1.959443, 0.6723743, 0, 0.1294118, 1, 1,
0.3130817, -1.328473, 2.859963, 0, 0.1254902, 1, 1,
0.3180449, -0.8176752, 3.997016, 0, 0.1176471, 1, 1,
0.3184196, 0.9923335, 1.799202, 0, 0.1137255, 1, 1,
0.326461, -0.1579973, 1.573912, 0, 0.1058824, 1, 1,
0.3280996, 0.4045973, 0.7585747, 0, 0.09803922, 1, 1,
0.337836, 0.2608941, 2.053833, 0, 0.09411765, 1, 1,
0.3451274, 0.9388205, 0.1822346, 0, 0.08627451, 1, 1,
0.3459104, -1.229211, 3.690009, 0, 0.08235294, 1, 1,
0.3473729, 1.043679, 0.4234794, 0, 0.07450981, 1, 1,
0.348071, -0.2325322, 3.105933, 0, 0.07058824, 1, 1,
0.352115, -0.2652868, 0.07145445, 0, 0.0627451, 1, 1,
0.3540372, 0.6341106, 1.191318, 0, 0.05882353, 1, 1,
0.3587521, -1.748677, 0.9949512, 0, 0.05098039, 1, 1,
0.3599615, 0.5707636, 0.683056, 0, 0.04705882, 1, 1,
0.3657832, -1.207221, 1.660674, 0, 0.03921569, 1, 1,
0.3703087, 0.8630729, -0.3871788, 0, 0.03529412, 1, 1,
0.3739548, 0.09620856, 0.250984, 0, 0.02745098, 1, 1,
0.3748003, 1.240723, -0.567629, 0, 0.02352941, 1, 1,
0.3769863, -0.2950903, 3.491641, 0, 0.01568628, 1, 1,
0.3781348, 0.4059277, 1.552416, 0, 0.01176471, 1, 1,
0.3794097, 1.175651, 0.878599, 0, 0.003921569, 1, 1,
0.3844046, 1.067885, 2.510036, 0.003921569, 0, 1, 1,
0.3853583, 1.02121, 1.893918, 0.007843138, 0, 1, 1,
0.3895787, -0.7357092, 2.462114, 0.01568628, 0, 1, 1,
0.3904662, 0.6390046, -0.306518, 0.01960784, 0, 1, 1,
0.4006042, 0.7870713, 0.7212147, 0.02745098, 0, 1, 1,
0.4020944, -1.215437, 2.499907, 0.03137255, 0, 1, 1,
0.4045451, -0.6673954, 2.021688, 0.03921569, 0, 1, 1,
0.4055019, -1.45033, 2.037343, 0.04313726, 0, 1, 1,
0.4063828, 1.208632, 0.8923975, 0.05098039, 0, 1, 1,
0.4083886, -0.01678181, 1.525162, 0.05490196, 0, 1, 1,
0.4096005, -0.4877885, 2.36951, 0.0627451, 0, 1, 1,
0.4111169, 0.1625175, 0.2370696, 0.06666667, 0, 1, 1,
0.4125272, -0.5743209, 2.549209, 0.07450981, 0, 1, 1,
0.4175918, -1.037513, 4.244292, 0.07843138, 0, 1, 1,
0.4214948, 0.5857815, 0.4859627, 0.08627451, 0, 1, 1,
0.4258239, -1.632617, 4.046093, 0.09019608, 0, 1, 1,
0.4306823, -0.91132, 1.738145, 0.09803922, 0, 1, 1,
0.4329603, 0.4865356, 0.2917168, 0.1058824, 0, 1, 1,
0.433165, -1.851915, 2.437411, 0.1098039, 0, 1, 1,
0.43472, -2.259433, 2.571286, 0.1176471, 0, 1, 1,
0.4379925, 0.2627882, 1.465624, 0.1215686, 0, 1, 1,
0.4424476, 0.4643513, 2.467516, 0.1294118, 0, 1, 1,
0.44362, -0.3033086, 3.795365, 0.1333333, 0, 1, 1,
0.4437232, 0.3663966, 0.4911295, 0.1411765, 0, 1, 1,
0.444025, -1.401646, 1.77879, 0.145098, 0, 1, 1,
0.4552727, -1.765574, 3.27397, 0.1529412, 0, 1, 1,
0.4608946, 0.2809935, 0.7824351, 0.1568628, 0, 1, 1,
0.4612674, 1.121879, 1.389538, 0.1647059, 0, 1, 1,
0.4622741, -0.3022884, 2.179318, 0.1686275, 0, 1, 1,
0.4635747, 0.5852993, 1.361288, 0.1764706, 0, 1, 1,
0.4644147, -0.1815984, 2.242132, 0.1803922, 0, 1, 1,
0.4698355, -1.040106, 2.895244, 0.1882353, 0, 1, 1,
0.476215, -2.994354, 1.074547, 0.1921569, 0, 1, 1,
0.4772122, 1.057279, -0.2687327, 0.2, 0, 1, 1,
0.4796287, -1.142623, 2.912997, 0.2078431, 0, 1, 1,
0.4842602, 0.8984326, 0.1081704, 0.2117647, 0, 1, 1,
0.4862167, 1.697242, -0.03979324, 0.2196078, 0, 1, 1,
0.4880039, -0.4335219, 4.839235, 0.2235294, 0, 1, 1,
0.5037526, 3.030129, -0.4872873, 0.2313726, 0, 1, 1,
0.5045173, -0.2869776, 2.202381, 0.2352941, 0, 1, 1,
0.5053537, -1.558995, 3.783962, 0.2431373, 0, 1, 1,
0.5059522, -0.3950041, 2.129042, 0.2470588, 0, 1, 1,
0.5141556, 1.201939, -0.564994, 0.254902, 0, 1, 1,
0.5177325, -0.2754647, 2.406853, 0.2588235, 0, 1, 1,
0.5186188, -0.5524471, 2.350677, 0.2666667, 0, 1, 1,
0.5259021, 0.3956801, 0.04666048, 0.2705882, 0, 1, 1,
0.5263828, 0.04102703, 1.759882, 0.2784314, 0, 1, 1,
0.5269529, 0.1489139, 2.665961, 0.282353, 0, 1, 1,
0.5297118, -0.1308839, 1.942146, 0.2901961, 0, 1, 1,
0.542388, -0.0214483, 2.592068, 0.2941177, 0, 1, 1,
0.5429764, -0.4978012, 3.744024, 0.3019608, 0, 1, 1,
0.5433921, 0.046041, 0.2707611, 0.3098039, 0, 1, 1,
0.5509, 0.05331695, -0.2357106, 0.3137255, 0, 1, 1,
0.5527312, -0.08653548, 1.843895, 0.3215686, 0, 1, 1,
0.5532852, -0.1533752, 0.4926125, 0.3254902, 0, 1, 1,
0.5560585, 0.2299375, -0.0219771, 0.3333333, 0, 1, 1,
0.559862, 0.5516001, 0.9721357, 0.3372549, 0, 1, 1,
0.5623233, -1.590209, 2.547872, 0.345098, 0, 1, 1,
0.5632859, 0.2656628, -0.9673845, 0.3490196, 0, 1, 1,
0.5751759, -0.1041035, 1.407458, 0.3568628, 0, 1, 1,
0.5776199, -1.076357, 1.967252, 0.3607843, 0, 1, 1,
0.5790013, 0.2987889, 0.8726465, 0.3686275, 0, 1, 1,
0.5798992, 0.3137133, 1.742278, 0.372549, 0, 1, 1,
0.5802499, 0.9507456, 0.6655374, 0.3803922, 0, 1, 1,
0.5819991, 0.2043594, 1.229758, 0.3843137, 0, 1, 1,
0.5858308, -0.1368237, 0.7065, 0.3921569, 0, 1, 1,
0.5879364, 1.065502, -0.05759264, 0.3960784, 0, 1, 1,
0.5898799, -1.080409, 2.899333, 0.4039216, 0, 1, 1,
0.5905226, -0.7021724, 0.8420065, 0.4117647, 0, 1, 1,
0.5996141, 0.3412124, 1.093075, 0.4156863, 0, 1, 1,
0.6005068, 0.05426308, 0.967285, 0.4235294, 0, 1, 1,
0.60338, 1.97881, 0.2453746, 0.427451, 0, 1, 1,
0.6068031, -0.04564527, 2.35598, 0.4352941, 0, 1, 1,
0.609002, -0.9109322, 2.801634, 0.4392157, 0, 1, 1,
0.6109849, -1.139394, 2.033311, 0.4470588, 0, 1, 1,
0.612486, -0.8119432, 2.445392, 0.4509804, 0, 1, 1,
0.6155583, -0.1664823, 2.374988, 0.4588235, 0, 1, 1,
0.6180183, -1.539406, 2.862719, 0.4627451, 0, 1, 1,
0.6183583, -2.075171, 3.495327, 0.4705882, 0, 1, 1,
0.6243493, -0.5548563, 2.815155, 0.4745098, 0, 1, 1,
0.6246232, -0.8465571, 0.6171146, 0.4823529, 0, 1, 1,
0.6283951, -1.231998, 4.133565, 0.4862745, 0, 1, 1,
0.628756, -0.5218357, 2.054209, 0.4941176, 0, 1, 1,
0.6296209, 0.008171907, 2.515096, 0.5019608, 0, 1, 1,
0.6319937, 1.134654, 2.362854, 0.5058824, 0, 1, 1,
0.635206, 0.07041488, 0.4608782, 0.5137255, 0, 1, 1,
0.6411962, 0.8450465, 0.3938469, 0.5176471, 0, 1, 1,
0.6456183, 0.5152282, 0.741599, 0.5254902, 0, 1, 1,
0.6457309, -0.4182715, 3.109377, 0.5294118, 0, 1, 1,
0.6484046, 0.2725494, 1.900167, 0.5372549, 0, 1, 1,
0.659388, -0.1112218, 2.264064, 0.5411765, 0, 1, 1,
0.662231, -0.3162385, 1.33523, 0.5490196, 0, 1, 1,
0.6693279, -1.103809, 3.721613, 0.5529412, 0, 1, 1,
0.6715707, -0.0855964, 2.707433, 0.5607843, 0, 1, 1,
0.6776173, -0.3231086, 1.631655, 0.5647059, 0, 1, 1,
0.6794274, -0.05197254, 3.780188, 0.572549, 0, 1, 1,
0.6813974, -1.728443, 2.146057, 0.5764706, 0, 1, 1,
0.6820317, -0.4387087, 3.657065, 0.5843138, 0, 1, 1,
0.6868457, -0.0312583, 1.230696, 0.5882353, 0, 1, 1,
0.6916159, 2.576658, 0.5782048, 0.5960785, 0, 1, 1,
0.6977981, -0.3076696, 1.957272, 0.6039216, 0, 1, 1,
0.6989334, -1.774691, 3.042825, 0.6078432, 0, 1, 1,
0.6995826, -0.3569364, 1.908509, 0.6156863, 0, 1, 1,
0.7044661, -0.9741788, 1.746962, 0.6196079, 0, 1, 1,
0.7092844, -0.5621631, 1.906289, 0.627451, 0, 1, 1,
0.709538, -0.4484335, 3.78987, 0.6313726, 0, 1, 1,
0.7103294, 0.5279831, 0.9062306, 0.6392157, 0, 1, 1,
0.7126237, -0.2956336, 2.381645, 0.6431373, 0, 1, 1,
0.7201468, -1.596311, 2.899707, 0.6509804, 0, 1, 1,
0.7227862, -0.467308, 1.354917, 0.654902, 0, 1, 1,
0.7242247, -1.51347, 4.297688, 0.6627451, 0, 1, 1,
0.7269867, -1.232775, 1.882005, 0.6666667, 0, 1, 1,
0.7319669, 0.4969094, 0.4772018, 0.6745098, 0, 1, 1,
0.734045, 0.5656235, 2.238467, 0.6784314, 0, 1, 1,
0.735464, -0.6538476, 3.259045, 0.6862745, 0, 1, 1,
0.7380033, 0.08205745, -0.1323873, 0.6901961, 0, 1, 1,
0.7394648, -0.06895814, 3.26889, 0.6980392, 0, 1, 1,
0.7496732, 0.2069031, 1.562103, 0.7058824, 0, 1, 1,
0.7526565, -0.7497001, 0.4042911, 0.7098039, 0, 1, 1,
0.7680088, -0.2379953, 1.781344, 0.7176471, 0, 1, 1,
0.7740321, -1.541612, 1.983929, 0.7215686, 0, 1, 1,
0.7755545, -0.3605256, 2.368103, 0.7294118, 0, 1, 1,
0.7759397, 0.6002488, -0.04425481, 0.7333333, 0, 1, 1,
0.7798665, 0.2167899, 0.3175848, 0.7411765, 0, 1, 1,
0.7830698, -1.061581, 2.7278, 0.7450981, 0, 1, 1,
0.7902924, 0.7310669, 1.039443, 0.7529412, 0, 1, 1,
0.7961193, 0.704506, 1.397517, 0.7568628, 0, 1, 1,
0.798995, -0.1970758, 1.65182, 0.7647059, 0, 1, 1,
0.7992759, 1.020135, -0.1937668, 0.7686275, 0, 1, 1,
0.8001792, -0.8592499, 2.385396, 0.7764706, 0, 1, 1,
0.8023431, 1.510642, 1.423015, 0.7803922, 0, 1, 1,
0.8050532, -0.780198, 2.178876, 0.7882353, 0, 1, 1,
0.8074927, -0.2923415, 2.993972, 0.7921569, 0, 1, 1,
0.8125578, -0.584784, 2.386662, 0.8, 0, 1, 1,
0.8162387, 0.3272164, 1.011161, 0.8078431, 0, 1, 1,
0.8173151, 1.124226, -0.6470681, 0.8117647, 0, 1, 1,
0.8207441, 0.50691, -0.1154592, 0.8196079, 0, 1, 1,
0.8223447, -0.2513859, 0.4604958, 0.8235294, 0, 1, 1,
0.8241473, 0.6104609, -0.4004906, 0.8313726, 0, 1, 1,
0.8267148, 0.286219, -0.8990743, 0.8352941, 0, 1, 1,
0.8271669, -0.1742779, 2.192164, 0.8431373, 0, 1, 1,
0.8281223, 1.010274, 1.225677, 0.8470588, 0, 1, 1,
0.8298835, -1.543365, 2.847587, 0.854902, 0, 1, 1,
0.8301147, 0.8107386, -2.324535, 0.8588235, 0, 1, 1,
0.8307728, 0.1825907, 0.8118922, 0.8666667, 0, 1, 1,
0.8313811, 1.099621, 2.225903, 0.8705882, 0, 1, 1,
0.8318936, -3.717153, 3.195123, 0.8784314, 0, 1, 1,
0.8354901, -0.302095, 2.923566, 0.8823529, 0, 1, 1,
0.8370813, -0.7645518, 2.567879, 0.8901961, 0, 1, 1,
0.8396571, -0.8700485, 1.619595, 0.8941177, 0, 1, 1,
0.8413432, -1.658628, 3.339109, 0.9019608, 0, 1, 1,
0.8553021, -1.65254, 2.540606, 0.9098039, 0, 1, 1,
0.8556977, 0.1010977, -0.2464003, 0.9137255, 0, 1, 1,
0.860624, 0.9687994, 0.7205664, 0.9215686, 0, 1, 1,
0.8611934, 0.03461418, 0.904362, 0.9254902, 0, 1, 1,
0.8648481, 0.8137648, -0.2645013, 0.9333333, 0, 1, 1,
0.8700495, -0.4537171, 1.616815, 0.9372549, 0, 1, 1,
0.873517, -0.8861151, 1.734048, 0.945098, 0, 1, 1,
0.8830405, -0.6432315, 3.241214, 0.9490196, 0, 1, 1,
0.8907323, 0.7206365, 1.825788, 0.9568627, 0, 1, 1,
0.893206, 0.605325, -0.1588075, 0.9607843, 0, 1, 1,
0.902323, -0.6122431, 2.805561, 0.9686275, 0, 1, 1,
0.9089895, -0.5254062, 0.4833848, 0.972549, 0, 1, 1,
0.9128168, 0.3770235, 0.3397392, 0.9803922, 0, 1, 1,
0.9150107, 0.3765059, 1.924689, 0.9843137, 0, 1, 1,
0.9212512, 0.06244265, 1.000329, 0.9921569, 0, 1, 1,
0.9237635, 0.6471615, 1.211977, 0.9960784, 0, 1, 1,
0.9259495, 1.826528, 1.374056, 1, 0, 0.9960784, 1,
0.9306474, 0.09746142, 0.9149146, 1, 0, 0.9882353, 1,
0.9313527, -0.8487392, 3.907182, 1, 0, 0.9843137, 1,
0.9354052, -0.405378, 2.124539, 1, 0, 0.9764706, 1,
0.9428921, 0.6325206, 0.692386, 1, 0, 0.972549, 1,
0.9465587, -0.7299666, 1.66626, 1, 0, 0.9647059, 1,
0.9488719, 0.8552415, 1.014309, 1, 0, 0.9607843, 1,
0.9533782, 1.1056, -0.2414127, 1, 0, 0.9529412, 1,
0.9618104, -0.9684085, 1.026504, 1, 0, 0.9490196, 1,
0.9625235, -0.6878491, 1.301043, 1, 0, 0.9411765, 1,
0.9674947, -1.201922, 1.913466, 1, 0, 0.9372549, 1,
0.9831828, 1.278764, 1.837156, 1, 0, 0.9294118, 1,
0.9874011, 0.1908234, 1.98893, 1, 0, 0.9254902, 1,
0.9882795, 0.1967845, 0.5381551, 1, 0, 0.9176471, 1,
0.9913868, -0.1367389, 2.251881, 1, 0, 0.9137255, 1,
0.9926338, -0.3326028, 3.84568, 1, 0, 0.9058824, 1,
1.001503, -0.1722275, 3.608403, 1, 0, 0.9019608, 1,
1.005133, 0.09159768, 2.063269, 1, 0, 0.8941177, 1,
1.008307, -0.009190619, 1.960608, 1, 0, 0.8862745, 1,
1.01241, -0.8335333, 1.195055, 1, 0, 0.8823529, 1,
1.015964, 0.9273244, 0.7691284, 1, 0, 0.8745098, 1,
1.018757, -0.3971655, 1.935484, 1, 0, 0.8705882, 1,
1.024553, 0.8694291, 1.363424, 1, 0, 0.8627451, 1,
1.031677, 1.181486, 0.02333294, 1, 0, 0.8588235, 1,
1.037855, -0.5779061, 0.8029771, 1, 0, 0.8509804, 1,
1.038554, -0.7919003, 2.291185, 1, 0, 0.8470588, 1,
1.039344, -0.3221293, 0.8059086, 1, 0, 0.8392157, 1,
1.0403, 2.691749, -0.7145317, 1, 0, 0.8352941, 1,
1.049934, -0.3327402, 3.230715, 1, 0, 0.827451, 1,
1.050166, -0.3831899, -0.431872, 1, 0, 0.8235294, 1,
1.055775, -2.261996, 3.613732, 1, 0, 0.8156863, 1,
1.061522, -1.243308, 1.908474, 1, 0, 0.8117647, 1,
1.061756, -0.3473405, 2.555262, 1, 0, 0.8039216, 1,
1.072813, 0.1903906, 1.6659, 1, 0, 0.7960784, 1,
1.073522, -0.823275, 3.248622, 1, 0, 0.7921569, 1,
1.073611, 1.226891, 0.1353719, 1, 0, 0.7843137, 1,
1.083845, 0.3376388, 1.308471, 1, 0, 0.7803922, 1,
1.0889, 1.561336, 0.4860227, 1, 0, 0.772549, 1,
1.093538, 0.06598534, 1.12616, 1, 0, 0.7686275, 1,
1.095786, -1.0168, 2.425119, 1, 0, 0.7607843, 1,
1.099636, -1.802824, 3.245505, 1, 0, 0.7568628, 1,
1.110216, 1.055963, -0.7082843, 1, 0, 0.7490196, 1,
1.112113, -1.691761, 2.260281, 1, 0, 0.7450981, 1,
1.119969, 1.710251, -0.6512727, 1, 0, 0.7372549, 1,
1.127946, 0.4246728, 1.822385, 1, 0, 0.7333333, 1,
1.135818, -0.3220565, 1.196591, 1, 0, 0.7254902, 1,
1.157713, 1.112782, 0.1512886, 1, 0, 0.7215686, 1,
1.160429, 0.7724836, 0.7031677, 1, 0, 0.7137255, 1,
1.165084, -0.4488103, 2.323719, 1, 0, 0.7098039, 1,
1.170859, 0.5632505, 0.7283291, 1, 0, 0.7019608, 1,
1.171326, 0.8265777, -0.1644164, 1, 0, 0.6941177, 1,
1.174393, -0.5176098, 1.496804, 1, 0, 0.6901961, 1,
1.191904, 1.319929, 1.242387, 1, 0, 0.682353, 1,
1.201306, 0.6092193, 0.6536731, 1, 0, 0.6784314, 1,
1.204534, -0.02900033, 1.141454, 1, 0, 0.6705883, 1,
1.204849, 1.229237, -0.6444409, 1, 0, 0.6666667, 1,
1.212034, -0.6504353, 2.96195, 1, 0, 0.6588235, 1,
1.21259, 0.009462428, 0.05331296, 1, 0, 0.654902, 1,
1.215785, -0.1324977, 1.709136, 1, 0, 0.6470588, 1,
1.217997, 0.8210403, 1.36994, 1, 0, 0.6431373, 1,
1.218784, -0.7922298, 2.553721, 1, 0, 0.6352941, 1,
1.226119, -0.5760458, 1.734973, 1, 0, 0.6313726, 1,
1.230035, -0.7032622, 3.200996, 1, 0, 0.6235294, 1,
1.23737, -1.404052, 2.745312, 1, 0, 0.6196079, 1,
1.243836, 0.6678293, 0.313209, 1, 0, 0.6117647, 1,
1.256291, -0.6381842, 3.375826, 1, 0, 0.6078432, 1,
1.256906, -0.04013869, 1.750149, 1, 0, 0.6, 1,
1.25964, -0.9270312, 2.696893, 1, 0, 0.5921569, 1,
1.261188, 0.6179016, 0.4670944, 1, 0, 0.5882353, 1,
1.267027, -0.4950382, 1.215231, 1, 0, 0.5803922, 1,
1.279203, -0.4523118, 3.478793, 1, 0, 0.5764706, 1,
1.27942, -0.006036518, 0.4516365, 1, 0, 0.5686275, 1,
1.283006, 0.4978084, 2.303158, 1, 0, 0.5647059, 1,
1.284601, -0.1760694, 1.535965, 1, 0, 0.5568628, 1,
1.288663, -0.7247396, 1.012821, 1, 0, 0.5529412, 1,
1.291416, 0.1407985, 2.122511, 1, 0, 0.5450981, 1,
1.306817, -0.7807679, 3.032853, 1, 0, 0.5411765, 1,
1.32128, -0.4260154, 1.602582, 1, 0, 0.5333334, 1,
1.324588, 1.207633, 0.979762, 1, 0, 0.5294118, 1,
1.331509, 0.0265297, 0.1288126, 1, 0, 0.5215687, 1,
1.333447, 1.762454, 0.5676509, 1, 0, 0.5176471, 1,
1.340631, 0.56185, 0.7123514, 1, 0, 0.509804, 1,
1.351179, 0.9995364, 0.3505674, 1, 0, 0.5058824, 1,
1.352592, 0.2126488, 1.286639, 1, 0, 0.4980392, 1,
1.357696, -0.9923432, 3.122677, 1, 0, 0.4901961, 1,
1.358502, -0.9721217, 0.6012735, 1, 0, 0.4862745, 1,
1.3682, 0.5442094, 3.125832, 1, 0, 0.4784314, 1,
1.372805, 2.388749, 1.081779, 1, 0, 0.4745098, 1,
1.382272, -2.140505, 1.941897, 1, 0, 0.4666667, 1,
1.389166, -1.368024, 1.960816, 1, 0, 0.4627451, 1,
1.41417, 0.9080635, 0.9906747, 1, 0, 0.454902, 1,
1.41554, -0.2699645, 0.9826447, 1, 0, 0.4509804, 1,
1.426831, -0.458922, 0.6988415, 1, 0, 0.4431373, 1,
1.437583, 1.549338, 0.4112804, 1, 0, 0.4392157, 1,
1.442853, 1.557659, -1.047197, 1, 0, 0.4313726, 1,
1.445947, 0.2166223, 0.5382023, 1, 0, 0.427451, 1,
1.446925, 1.459894, -0.02088537, 1, 0, 0.4196078, 1,
1.453412, -0.01778475, 1.691181, 1, 0, 0.4156863, 1,
1.459543, -0.2383755, 1.399991, 1, 0, 0.4078431, 1,
1.467046, -0.340421, 2.930469, 1, 0, 0.4039216, 1,
1.469132, -1.523933, 2.389801, 1, 0, 0.3960784, 1,
1.474467, 0.03398797, 0.9838065, 1, 0, 0.3882353, 1,
1.480125, -0.09806485, 1.647508, 1, 0, 0.3843137, 1,
1.484837, 0.7779012, 0.0552192, 1, 0, 0.3764706, 1,
1.490804, 0.3309028, 1.871987, 1, 0, 0.372549, 1,
1.491379, -1.629267, 1.504131, 1, 0, 0.3647059, 1,
1.505902, 2.908576, 0.3883186, 1, 0, 0.3607843, 1,
1.507671, 0.7428417, 0.915357, 1, 0, 0.3529412, 1,
1.511162, 1.113884, -0.5959709, 1, 0, 0.3490196, 1,
1.52595, 0.6778337, 1.033367, 1, 0, 0.3411765, 1,
1.533097, -0.4382892, 1.896587, 1, 0, 0.3372549, 1,
1.546603, -0.2030873, 2.857183, 1, 0, 0.3294118, 1,
1.554843, 0.6536103, 1.78473, 1, 0, 0.3254902, 1,
1.563716, 0.2792173, 2.623269, 1, 0, 0.3176471, 1,
1.564814, 0.6054435, 0.2271549, 1, 0, 0.3137255, 1,
1.594227, 0.05446692, 0.8803594, 1, 0, 0.3058824, 1,
1.611712, 1.957884, 1.89437, 1, 0, 0.2980392, 1,
1.617388, 0.2799733, 1.373726, 1, 0, 0.2941177, 1,
1.628874, 0.143999, 1.331624, 1, 0, 0.2862745, 1,
1.631989, 0.001815633, 2.897995, 1, 0, 0.282353, 1,
1.635529, -0.1157941, 1.814198, 1, 0, 0.2745098, 1,
1.662611, 0.6803994, 1.10577, 1, 0, 0.2705882, 1,
1.685919, -1.322045, -0.7428049, 1, 0, 0.2627451, 1,
1.687974, 0.16286, 0.2612729, 1, 0, 0.2588235, 1,
1.700168, 0.9644863, 1.6907, 1, 0, 0.2509804, 1,
1.706236, 0.7403917, 0.09099271, 1, 0, 0.2470588, 1,
1.758627, 0.8346685, 1.64934, 1, 0, 0.2392157, 1,
1.77364, -0.5549522, 2.728895, 1, 0, 0.2352941, 1,
1.795123, -0.1368747, 1.790755, 1, 0, 0.227451, 1,
1.797827, -0.8410458, 1.949203, 1, 0, 0.2235294, 1,
1.812344, 1.903178, -0.8051545, 1, 0, 0.2156863, 1,
1.901682, -0.9309166, 1.279471, 1, 0, 0.2117647, 1,
1.930283, -0.3315738, 3.442127, 1, 0, 0.2039216, 1,
1.960372, 0.1449648, 2.089543, 1, 0, 0.1960784, 1,
1.968159, 0.3328771, 1.33184, 1, 0, 0.1921569, 1,
1.986835, -0.5538378, 1.693253, 1, 0, 0.1843137, 1,
1.988669, -0.4691682, 1.359507, 1, 0, 0.1803922, 1,
2.000422, -0.6875051, 1.541783, 1, 0, 0.172549, 1,
2.054476, -0.2565416, 1.475736, 1, 0, 0.1686275, 1,
2.055588, -1.901642, 1.530988, 1, 0, 0.1607843, 1,
2.060346, -1.622303, 3.707752, 1, 0, 0.1568628, 1,
2.088071, 0.2505147, 1.112835, 1, 0, 0.1490196, 1,
2.120883, 1.964163, 1.770799, 1, 0, 0.145098, 1,
2.123383, -0.2561105, 1.31241, 1, 0, 0.1372549, 1,
2.127769, -0.3676531, 2.289028, 1, 0, 0.1333333, 1,
2.129714, -0.6428323, 2.373311, 1, 0, 0.1254902, 1,
2.138259, 0.6853424, -0.01316848, 1, 0, 0.1215686, 1,
2.142087, -0.8991552, 1.893559, 1, 0, 0.1137255, 1,
2.20158, 0.8854066, 2.504965, 1, 0, 0.1098039, 1,
2.209624, 0.537685, 1.515645, 1, 0, 0.1019608, 1,
2.217727, -0.1427613, 1.270238, 1, 0, 0.09411765, 1,
2.217931, 1.124618, 2.292037, 1, 0, 0.09019608, 1,
2.249627, 1.261865, 1.030156, 1, 0, 0.08235294, 1,
2.295453, 0.5797207, 3.394865, 1, 0, 0.07843138, 1,
2.309391, 1.464979, 0.03050443, 1, 0, 0.07058824, 1,
2.35608, -0.7112787, 3.045598, 1, 0, 0.06666667, 1,
2.386039, -0.8584269, 3.115158, 1, 0, 0.05882353, 1,
2.402227, -0.01871286, 1.946203, 1, 0, 0.05490196, 1,
2.575385, -0.1317896, 1.212076, 1, 0, 0.04705882, 1,
2.667307, 1.004667, 2.529788, 1, 0, 0.04313726, 1,
2.700789, 0.4533275, 1.223, 1, 0, 0.03529412, 1,
2.914377, -0.7604805, 2.006988, 1, 0, 0.03137255, 1,
2.95945, -1.839324, 1.5902, 1, 0, 0.02352941, 1,
3.073058, -1.025611, 2.63227, 1, 0, 0.01960784, 1,
3.076545, -0.675383, 1.2714, 1, 0, 0.01176471, 1,
3.079159, -1.476685, 1.093363, 1, 0, 0.007843138, 1
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
-0.1273968, -4.874987, -6.946982, 0, -0.5, 0.5, 0.5,
-0.1273968, -4.874987, -6.946982, 1, -0.5, 0.5, 0.5,
-0.1273968, -4.874987, -6.946982, 1, 1.5, 0.5, 0.5,
-0.1273968, -4.874987, -6.946982, 0, 1.5, 0.5, 0.5
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
-4.420975, -0.3017138, -6.946982, 0, -0.5, 0.5, 0.5,
-4.420975, -0.3017138, -6.946982, 1, -0.5, 0.5, 0.5,
-4.420975, -0.3017138, -6.946982, 1, 1.5, 0.5, 0.5,
-4.420975, -0.3017138, -6.946982, 0, 1.5, 0.5, 0.5
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
-4.420975, -4.874987, -0.01024914, 0, -0.5, 0.5, 0.5,
-4.420975, -4.874987, -0.01024914, 1, -0.5, 0.5, 0.5,
-4.420975, -4.874987, -0.01024914, 1, 1.5, 0.5, 0.5,
-4.420975, -4.874987, -0.01024914, 0, 1.5, 0.5, 0.5
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
-3, -3.819616, -5.346198,
3, -3.819616, -5.346198,
-3, -3.819616, -5.346198,
-3, -3.995511, -5.612995,
-2, -3.819616, -5.346198,
-2, -3.995511, -5.612995,
-1, -3.819616, -5.346198,
-1, -3.995511, -5.612995,
0, -3.819616, -5.346198,
0, -3.995511, -5.612995,
1, -3.819616, -5.346198,
1, -3.995511, -5.612995,
2, -3.819616, -5.346198,
2, -3.995511, -5.612995,
3, -3.819616, -5.346198,
3, -3.995511, -5.612995
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
-3, -4.347301, -6.14659, 0, -0.5, 0.5, 0.5,
-3, -4.347301, -6.14659, 1, -0.5, 0.5, 0.5,
-3, -4.347301, -6.14659, 1, 1.5, 0.5, 0.5,
-3, -4.347301, -6.14659, 0, 1.5, 0.5, 0.5,
-2, -4.347301, -6.14659, 0, -0.5, 0.5, 0.5,
-2, -4.347301, -6.14659, 1, -0.5, 0.5, 0.5,
-2, -4.347301, -6.14659, 1, 1.5, 0.5, 0.5,
-2, -4.347301, -6.14659, 0, 1.5, 0.5, 0.5,
-1, -4.347301, -6.14659, 0, -0.5, 0.5, 0.5,
-1, -4.347301, -6.14659, 1, -0.5, 0.5, 0.5,
-1, -4.347301, -6.14659, 1, 1.5, 0.5, 0.5,
-1, -4.347301, -6.14659, 0, 1.5, 0.5, 0.5,
0, -4.347301, -6.14659, 0, -0.5, 0.5, 0.5,
0, -4.347301, -6.14659, 1, -0.5, 0.5, 0.5,
0, -4.347301, -6.14659, 1, 1.5, 0.5, 0.5,
0, -4.347301, -6.14659, 0, 1.5, 0.5, 0.5,
1, -4.347301, -6.14659, 0, -0.5, 0.5, 0.5,
1, -4.347301, -6.14659, 1, -0.5, 0.5, 0.5,
1, -4.347301, -6.14659, 1, 1.5, 0.5, 0.5,
1, -4.347301, -6.14659, 0, 1.5, 0.5, 0.5,
2, -4.347301, -6.14659, 0, -0.5, 0.5, 0.5,
2, -4.347301, -6.14659, 1, -0.5, 0.5, 0.5,
2, -4.347301, -6.14659, 1, 1.5, 0.5, 0.5,
2, -4.347301, -6.14659, 0, 1.5, 0.5, 0.5,
3, -4.347301, -6.14659, 0, -0.5, 0.5, 0.5,
3, -4.347301, -6.14659, 1, -0.5, 0.5, 0.5,
3, -4.347301, -6.14659, 1, 1.5, 0.5, 0.5,
3, -4.347301, -6.14659, 0, 1.5, 0.5, 0.5
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
-3.430149, -3, -5.346198,
-3.430149, 3, -5.346198,
-3.430149, -3, -5.346198,
-3.595287, -3, -5.612995,
-3.430149, -2, -5.346198,
-3.595287, -2, -5.612995,
-3.430149, -1, -5.346198,
-3.595287, -1, -5.612995,
-3.430149, 0, -5.346198,
-3.595287, 0, -5.612995,
-3.430149, 1, -5.346198,
-3.595287, 1, -5.612995,
-3.430149, 2, -5.346198,
-3.595287, 2, -5.612995,
-3.430149, 3, -5.346198,
-3.595287, 3, -5.612995
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
-3.925562, -3, -6.14659, 0, -0.5, 0.5, 0.5,
-3.925562, -3, -6.14659, 1, -0.5, 0.5, 0.5,
-3.925562, -3, -6.14659, 1, 1.5, 0.5, 0.5,
-3.925562, -3, -6.14659, 0, 1.5, 0.5, 0.5,
-3.925562, -2, -6.14659, 0, -0.5, 0.5, 0.5,
-3.925562, -2, -6.14659, 1, -0.5, 0.5, 0.5,
-3.925562, -2, -6.14659, 1, 1.5, 0.5, 0.5,
-3.925562, -2, -6.14659, 0, 1.5, 0.5, 0.5,
-3.925562, -1, -6.14659, 0, -0.5, 0.5, 0.5,
-3.925562, -1, -6.14659, 1, -0.5, 0.5, 0.5,
-3.925562, -1, -6.14659, 1, 1.5, 0.5, 0.5,
-3.925562, -1, -6.14659, 0, 1.5, 0.5, 0.5,
-3.925562, 0, -6.14659, 0, -0.5, 0.5, 0.5,
-3.925562, 0, -6.14659, 1, -0.5, 0.5, 0.5,
-3.925562, 0, -6.14659, 1, 1.5, 0.5, 0.5,
-3.925562, 0, -6.14659, 0, 1.5, 0.5, 0.5,
-3.925562, 1, -6.14659, 0, -0.5, 0.5, 0.5,
-3.925562, 1, -6.14659, 1, -0.5, 0.5, 0.5,
-3.925562, 1, -6.14659, 1, 1.5, 0.5, 0.5,
-3.925562, 1, -6.14659, 0, 1.5, 0.5, 0.5,
-3.925562, 2, -6.14659, 0, -0.5, 0.5, 0.5,
-3.925562, 2, -6.14659, 1, -0.5, 0.5, 0.5,
-3.925562, 2, -6.14659, 1, 1.5, 0.5, 0.5,
-3.925562, 2, -6.14659, 0, 1.5, 0.5, 0.5,
-3.925562, 3, -6.14659, 0, -0.5, 0.5, 0.5,
-3.925562, 3, -6.14659, 1, -0.5, 0.5, 0.5,
-3.925562, 3, -6.14659, 1, 1.5, 0.5, 0.5,
-3.925562, 3, -6.14659, 0, 1.5, 0.5, 0.5
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
-3.430149, -3.819616, -4,
-3.430149, -3.819616, 4,
-3.430149, -3.819616, -4,
-3.595287, -3.995511, -4,
-3.430149, -3.819616, -2,
-3.595287, -3.995511, -2,
-3.430149, -3.819616, 0,
-3.595287, -3.995511, 0,
-3.430149, -3.819616, 2,
-3.595287, -3.995511, 2,
-3.430149, -3.819616, 4,
-3.595287, -3.995511, 4
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
-3.925562, -4.347301, -4, 0, -0.5, 0.5, 0.5,
-3.925562, -4.347301, -4, 1, -0.5, 0.5, 0.5,
-3.925562, -4.347301, -4, 1, 1.5, 0.5, 0.5,
-3.925562, -4.347301, -4, 0, 1.5, 0.5, 0.5,
-3.925562, -4.347301, -2, 0, -0.5, 0.5, 0.5,
-3.925562, -4.347301, -2, 1, -0.5, 0.5, 0.5,
-3.925562, -4.347301, -2, 1, 1.5, 0.5, 0.5,
-3.925562, -4.347301, -2, 0, 1.5, 0.5, 0.5,
-3.925562, -4.347301, 0, 0, -0.5, 0.5, 0.5,
-3.925562, -4.347301, 0, 1, -0.5, 0.5, 0.5,
-3.925562, -4.347301, 0, 1, 1.5, 0.5, 0.5,
-3.925562, -4.347301, 0, 0, 1.5, 0.5, 0.5,
-3.925562, -4.347301, 2, 0, -0.5, 0.5, 0.5,
-3.925562, -4.347301, 2, 1, -0.5, 0.5, 0.5,
-3.925562, -4.347301, 2, 1, 1.5, 0.5, 0.5,
-3.925562, -4.347301, 2, 0, 1.5, 0.5, 0.5,
-3.925562, -4.347301, 4, 0, -0.5, 0.5, 0.5,
-3.925562, -4.347301, 4, 1, -0.5, 0.5, 0.5,
-3.925562, -4.347301, 4, 1, 1.5, 0.5, 0.5,
-3.925562, -4.347301, 4, 0, 1.5, 0.5, 0.5
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
-3.430149, -3.819616, -5.346198,
-3.430149, 3.216188, -5.346198,
-3.430149, -3.819616, 5.325699,
-3.430149, 3.216188, 5.325699,
-3.430149, -3.819616, -5.346198,
-3.430149, -3.819616, 5.325699,
-3.430149, 3.216188, -5.346198,
-3.430149, 3.216188, 5.325699,
-3.430149, -3.819616, -5.346198,
3.175356, -3.819616, -5.346198,
-3.430149, -3.819616, 5.325699,
3.175356, -3.819616, 5.325699,
-3.430149, 3.216188, -5.346198,
3.175356, 3.216188, -5.346198,
-3.430149, 3.216188, 5.325699,
3.175356, 3.216188, 5.325699,
3.175356, -3.819616, -5.346198,
3.175356, 3.216188, -5.346198,
3.175356, -3.819616, 5.325699,
3.175356, 3.216188, 5.325699,
3.175356, -3.819616, -5.346198,
3.175356, -3.819616, 5.325699,
3.175356, 3.216188, -5.346198,
3.175356, 3.216188, 5.325699
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
var radius = 7.6831;
var distance = 34.18298;
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
mvMatrix.translate( 0.1273968, 0.3017138, 0.01024914 );
mvMatrix.scale( 1.257605, 1.180692, 0.7784106 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.18298);
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
fluthiacet-methyl<-read.table("fluthiacet-methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluthiacet-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluthiacet' not found
```

```r
y<-fluthiacet-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluthiacet' not found
```

```r
z<-fluthiacet-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluthiacet' not found
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
-3.333953, -1.321505, -1.972053, 0, 0, 1, 1, 1,
-3.229997, 1.488015, -1.390481, 1, 0, 0, 1, 1,
-3.105202, 0.8385905, -1.673141, 1, 0, 0, 1, 1,
-3.102428, -1.371529, -0.8108733, 1, 0, 0, 1, 1,
-2.676303, 0.1555033, -1.348181, 1, 0, 0, 1, 1,
-2.443127, 0.5193436, -1.779023, 1, 0, 0, 1, 1,
-2.408003, -1.587968, -1.98573, 0, 0, 0, 1, 1,
-2.401118, 1.264704, -0.8954559, 0, 0, 0, 1, 1,
-2.391535, -2.449296, -0.4267652, 0, 0, 0, 1, 1,
-2.384687, -0.544834, -1.388007, 0, 0, 0, 1, 1,
-2.309924, -0.06339178, -1.982859, 0, 0, 0, 1, 1,
-2.293076, 0.174109, -3.373498, 0, 0, 0, 1, 1,
-2.289624, -0.8191351, -2.624635, 0, 0, 0, 1, 1,
-2.280059, 0.9365106, 0.1993018, 1, 1, 1, 1, 1,
-2.249076, 0.2174391, -1.129239, 1, 1, 1, 1, 1,
-2.245032, 0.7125942, -1.852394, 1, 1, 1, 1, 1,
-2.171487, -1.899815, -1.612607, 1, 1, 1, 1, 1,
-2.108588, 1.169648, -1.098747, 1, 1, 1, 1, 1,
-2.098639, 0.6287509, -2.00451, 1, 1, 1, 1, 1,
-2.087758, -0.5126064, -1.369461, 1, 1, 1, 1, 1,
-2.083437, 1.745317, -1.375157, 1, 1, 1, 1, 1,
-2.083213, 0.1006696, -1.607869, 1, 1, 1, 1, 1,
-2.07091, -0.5127655, -1.398525, 1, 1, 1, 1, 1,
-2.065585, -1.553903, -0.8248646, 1, 1, 1, 1, 1,
-2.057939, 0.5060714, -2.346399, 1, 1, 1, 1, 1,
-2.049306, -1.106689, -1.444973, 1, 1, 1, 1, 1,
-2.048985, 1.856015, -0.6239182, 1, 1, 1, 1, 1,
-2.014042, -0.7500087, -1.86225, 1, 1, 1, 1, 1,
-1.999469, -0.5760006, -1.895244, 0, 0, 1, 1, 1,
-1.989285, -0.3515031, -3.259491, 1, 0, 0, 1, 1,
-1.979294, 1.703656, -1.979318, 1, 0, 0, 1, 1,
-1.945654, -0.830384, -2.27782, 1, 0, 0, 1, 1,
-1.941567, -0.8181515, -2.612048, 1, 0, 0, 1, 1,
-1.901402, -1.017782, -3.027808, 1, 0, 0, 1, 1,
-1.890077, -0.0317921, -3.299148, 0, 0, 0, 1, 1,
-1.887531, -0.4422156, -1.446747, 0, 0, 0, 1, 1,
-1.856054, -0.519835, -1.949963, 0, 0, 0, 1, 1,
-1.850482, -0.4380581, -1.686975, 0, 0, 0, 1, 1,
-1.81915, -1.08432, -1.666504, 0, 0, 0, 1, 1,
-1.781207, 0.1238059, -0.717109, 0, 0, 0, 1, 1,
-1.746873, 1.811334, 0.2333283, 0, 0, 0, 1, 1,
-1.745889, -0.8852949, -1.497536, 1, 1, 1, 1, 1,
-1.735719, -0.2856332, -1.780926, 1, 1, 1, 1, 1,
-1.726771, 0.3121717, -2.405721, 1, 1, 1, 1, 1,
-1.723769, -1.281628, -1.544795, 1, 1, 1, 1, 1,
-1.721888, 0.8907204, -1.802264, 1, 1, 1, 1, 1,
-1.699478, -0.4055698, -1.407874, 1, 1, 1, 1, 1,
-1.690645, -0.4572082, -2.158176, 1, 1, 1, 1, 1,
-1.683385, -2.044206, -0.455701, 1, 1, 1, 1, 1,
-1.672427, 0.1113174, -2.232901, 1, 1, 1, 1, 1,
-1.668216, -0.5644956, -2.263726, 1, 1, 1, 1, 1,
-1.663022, -0.2680591, -1.239772, 1, 1, 1, 1, 1,
-1.65473, 0.4235404, -0.1128379, 1, 1, 1, 1, 1,
-1.651942, 0.1620133, -2.584411, 1, 1, 1, 1, 1,
-1.649989, 1.087095, -0.9539376, 1, 1, 1, 1, 1,
-1.635941, -1.56216, -1.348457, 1, 1, 1, 1, 1,
-1.618926, -1.564654, -3.164735, 0, 0, 1, 1, 1,
-1.612669, 0.1279976, -0.971114, 1, 0, 0, 1, 1,
-1.611734, -0.05292904, -1.378802, 1, 0, 0, 1, 1,
-1.603097, -1.311812, -2.467117, 1, 0, 0, 1, 1,
-1.591186, -0.7011482, -2.80621, 1, 0, 0, 1, 1,
-1.588722, 0.7968984, -0.07358136, 1, 0, 0, 1, 1,
-1.57843, 0.5867669, -0.872042, 0, 0, 0, 1, 1,
-1.554888, -0.5290611, -1.594868, 0, 0, 0, 1, 1,
-1.538584, 0.8767056, -0.4448619, 0, 0, 0, 1, 1,
-1.537053, -2.831903, -3.468535, 0, 0, 0, 1, 1,
-1.531489, 0.6192076, -0.642491, 0, 0, 0, 1, 1,
-1.526607, -0.4380603, -3.536212, 0, 0, 0, 1, 1,
-1.523405, 1.87529, 0.05572695, 0, 0, 0, 1, 1,
-1.511941, -0.2667469, -0.9375678, 1, 1, 1, 1, 1,
-1.506749, -0.3524882, -1.871028, 1, 1, 1, 1, 1,
-1.498886, -1.226277, -0.514577, 1, 1, 1, 1, 1,
-1.492256, -0.8839751, -2.314347, 1, 1, 1, 1, 1,
-1.473568, 0.06261665, -1.012908, 1, 1, 1, 1, 1,
-1.462557, -1.482947, -0.05332117, 1, 1, 1, 1, 1,
-1.447331, -0.05127743, -2.104155, 1, 1, 1, 1, 1,
-1.445928, 0.3269151, -2.15064, 1, 1, 1, 1, 1,
-1.436917, 0.5416496, -1.88016, 1, 1, 1, 1, 1,
-1.434504, 1.082182, -0.4654509, 1, 1, 1, 1, 1,
-1.429218, 1.456776, -1.101624, 1, 1, 1, 1, 1,
-1.394183, -0.3893104, -2.145768, 1, 1, 1, 1, 1,
-1.392532, -0.9928007, -1.827681, 1, 1, 1, 1, 1,
-1.385308, -0.6234444, -2.819166, 1, 1, 1, 1, 1,
-1.376445, -0.5814291, -3.849869, 1, 1, 1, 1, 1,
-1.375705, 0.284193, -2.783671, 0, 0, 1, 1, 1,
-1.366115, -0.05627315, -1.747768, 1, 0, 0, 1, 1,
-1.365401, -0.6953608, -1.584337, 1, 0, 0, 1, 1,
-1.36386, 0.6238551, 1.409044, 1, 0, 0, 1, 1,
-1.360605, 0.1720184, -1.897193, 1, 0, 0, 1, 1,
-1.348597, 0.1397392, -4.166937, 1, 0, 0, 1, 1,
-1.343179, -1.833992, -2.878176, 0, 0, 0, 1, 1,
-1.338621, 0.672931, -0.7977553, 0, 0, 0, 1, 1,
-1.334695, -0.04364454, -1.501237, 0, 0, 0, 1, 1,
-1.324214, -0.8223973, -1.286819, 0, 0, 0, 1, 1,
-1.309638, -1.130784, -2.451184, 0, 0, 0, 1, 1,
-1.306223, 0.6901671, -0.6498813, 0, 0, 0, 1, 1,
-1.289295, 0.4459194, -2.657536, 0, 0, 0, 1, 1,
-1.267978, -1.406217, -2.338432, 1, 1, 1, 1, 1,
-1.267658, 0.5738212, -1.815442, 1, 1, 1, 1, 1,
-1.26706, -0.03392226, -2.333563, 1, 1, 1, 1, 1,
-1.251064, -0.351917, -2.4861, 1, 1, 1, 1, 1,
-1.24814, 2.035198, -0.2657904, 1, 1, 1, 1, 1,
-1.241542, 1.680641, -0.5286821, 1, 1, 1, 1, 1,
-1.237425, -1.693626, -3.474592, 1, 1, 1, 1, 1,
-1.231819, 0.6094211, 1.397143, 1, 1, 1, 1, 1,
-1.219753, 1.199163, -0.2282792, 1, 1, 1, 1, 1,
-1.217743, -0.2321565, -3.935349, 1, 1, 1, 1, 1,
-1.200181, -0.2892625, -0.6380848, 1, 1, 1, 1, 1,
-1.193646, -0.7282926, -1.198686, 1, 1, 1, 1, 1,
-1.188427, -1.750714, -3.160852, 1, 1, 1, 1, 1,
-1.181903, -1.554902, 0.3549275, 1, 1, 1, 1, 1,
-1.17785, 0.5947907, -1.134584, 1, 1, 1, 1, 1,
-1.171607, -0.5722376, -0.8351217, 0, 0, 1, 1, 1,
-1.152258, 0.9674432, 0.1583437, 1, 0, 0, 1, 1,
-1.145064, -2.166825, -3.368113, 1, 0, 0, 1, 1,
-1.143426, 0.3352319, -1.198931, 1, 0, 0, 1, 1,
-1.139061, 0.8785502, -0.6596045, 1, 0, 0, 1, 1,
-1.136141, 0.551714, -0.2792358, 1, 0, 0, 1, 1,
-1.132425, 0.3343379, -0.6427048, 0, 0, 0, 1, 1,
-1.132419, -2.308663, -2.113656, 0, 0, 0, 1, 1,
-1.128159, 0.1717801, -2.416403, 0, 0, 0, 1, 1,
-1.126001, 1.749388, -0.03133822, 0, 0, 0, 1, 1,
-1.118889, -1.881186, -3.847359, 0, 0, 0, 1, 1,
-1.114478, -0.8812003, -3.595794, 0, 0, 0, 1, 1,
-1.111206, 0.2880672, -2.599876, 0, 0, 0, 1, 1,
-1.108019, 0.2959207, -1.415239, 1, 1, 1, 1, 1,
-1.107286, -0.06494705, -2.404894, 1, 1, 1, 1, 1,
-1.099443, -0.2306269, -1.421634, 1, 1, 1, 1, 1,
-1.099035, 1.47106, -0.6305525, 1, 1, 1, 1, 1,
-1.090833, -2.268091, -3.902626, 1, 1, 1, 1, 1,
-1.085418, 1.884908, -2.325372, 1, 1, 1, 1, 1,
-1.081497, -0.1889963, -0.6846154, 1, 1, 1, 1, 1,
-1.079258, -0.5154122, -1.792372, 1, 1, 1, 1, 1,
-1.074862, 0.257306, -2.357507, 1, 1, 1, 1, 1,
-1.071659, 0.2450157, -1.043435, 1, 1, 1, 1, 1,
-1.065881, 0.9608362, -1.408494, 1, 1, 1, 1, 1,
-1.06125, 0.08917541, -1.97459, 1, 1, 1, 1, 1,
-1.060295, 0.2613857, -0.6312773, 1, 1, 1, 1, 1,
-1.055627, 0.04065807, -2.349096, 1, 1, 1, 1, 1,
-1.050036, -0.1541048, -0.3303284, 1, 1, 1, 1, 1,
-1.044297, 0.980784, -0.8651641, 0, 0, 1, 1, 1,
-1.041186, 0.8414934, 1.152846, 1, 0, 0, 1, 1,
-1.039364, 0.8416968, -3.503757, 1, 0, 0, 1, 1,
-1.036004, 0.9673833, -1.872895, 1, 0, 0, 1, 1,
-1.034537, 0.6222848, -0.3644364, 1, 0, 0, 1, 1,
-1.025138, -1.039488, -1.926607, 1, 0, 0, 1, 1,
-1.022629, 1.527273, 0.6969178, 0, 0, 0, 1, 1,
-1.019822, 0.1770322, -0.7814972, 0, 0, 0, 1, 1,
-1.01393, -1.208685, -1.687091, 0, 0, 0, 1, 1,
-1.01202, -1.10876, -1.871222, 0, 0, 0, 1, 1,
-1.008588, 0.9529719, -1.873524, 0, 0, 0, 1, 1,
-1.004332, -0.2935047, -1.747324, 0, 0, 0, 1, 1,
-0.9970209, -0.2004924, -4.016392, 0, 0, 0, 1, 1,
-0.9950928, -2.01982, -2.674568, 1, 1, 1, 1, 1,
-0.9944453, -0.8480124, -0.3076022, 1, 1, 1, 1, 1,
-0.99422, -0.6296359, -1.663934, 1, 1, 1, 1, 1,
-0.9936748, 1.28533, -2.877146, 1, 1, 1, 1, 1,
-0.9844798, 1.658662, -0.1271829, 1, 1, 1, 1, 1,
-0.9830469, 1.012861, -1.048289, 1, 1, 1, 1, 1,
-0.9798341, 1.474537, -0.04289706, 1, 1, 1, 1, 1,
-0.9768389, -0.03668996, -1.594412, 1, 1, 1, 1, 1,
-0.9760035, -0.8579266, -1.094532, 1, 1, 1, 1, 1,
-0.9757994, 0.4065935, -0.1862202, 1, 1, 1, 1, 1,
-0.9753828, 0.2275183, -1.131198, 1, 1, 1, 1, 1,
-0.9734883, 1.98707, 0.6001834, 1, 1, 1, 1, 1,
-0.9725047, -0.8578351, -2.993146, 1, 1, 1, 1, 1,
-0.9724194, 0.3775765, -1.018347, 1, 1, 1, 1, 1,
-0.971684, 0.7336951, -0.257416, 1, 1, 1, 1, 1,
-0.9683365, -1.367844, -1.789524, 0, 0, 1, 1, 1,
-0.9580414, 1.110699, -1.169231, 1, 0, 0, 1, 1,
-0.9531742, 1.16804, -0.390168, 1, 0, 0, 1, 1,
-0.9492931, 0.4512807, -2.626451, 1, 0, 0, 1, 1,
-0.9475861, -0.7558369, -2.210786, 1, 0, 0, 1, 1,
-0.945217, -0.3331202, -2.097064, 1, 0, 0, 1, 1,
-0.9421081, -1.051318, -1.957464, 0, 0, 0, 1, 1,
-0.937295, 0.2816059, -1.393138, 0, 0, 0, 1, 1,
-0.9280406, -0.8904476, -2.51284, 0, 0, 0, 1, 1,
-0.921672, 2.19761, 1.290338, 0, 0, 0, 1, 1,
-0.9103662, -1.084819, -1.125954, 0, 0, 0, 1, 1,
-0.9050382, 0.4543928, -1.487239, 0, 0, 0, 1, 1,
-0.8949596, -1.277663, -4.329155, 0, 0, 0, 1, 1,
-0.8928391, 0.5781389, -2.217718, 1, 1, 1, 1, 1,
-0.8800505, 0.1591565, -0.5293539, 1, 1, 1, 1, 1,
-0.8784958, -0.7204655, -4.095935, 1, 1, 1, 1, 1,
-0.8720592, -0.7967239, -1.483874, 1, 1, 1, 1, 1,
-0.8697823, 2.069842, -1.737979, 1, 1, 1, 1, 1,
-0.8650261, -0.8785552, -3.957604, 1, 1, 1, 1, 1,
-0.8642837, -0.1558896, -2.689903, 1, 1, 1, 1, 1,
-0.8601942, 0.6465407, -1.458888, 1, 1, 1, 1, 1,
-0.8594785, -1.193685, -2.088392, 1, 1, 1, 1, 1,
-0.8594136, 0.02379359, -0.785748, 1, 1, 1, 1, 1,
-0.8584012, -0.06395867, -1.337776, 1, 1, 1, 1, 1,
-0.8579611, 1.892715, 0.3015003, 1, 1, 1, 1, 1,
-0.8543922, -0.7488776, -2.58756, 1, 1, 1, 1, 1,
-0.8499011, 0.1623647, -1.004207, 1, 1, 1, 1, 1,
-0.8480945, 1.086978, -2.087833, 1, 1, 1, 1, 1,
-0.8478615, -0.4048052, 1.702584, 0, 0, 1, 1, 1,
-0.8471884, 0.4397397, -2.039226, 1, 0, 0, 1, 1,
-0.84711, -2.427556, -3.045493, 1, 0, 0, 1, 1,
-0.8456228, 0.533846, -1.216908, 1, 0, 0, 1, 1,
-0.8445798, 1.183946, -1.615411, 1, 0, 0, 1, 1,
-0.8417013, -1.703527, -1.75422, 1, 0, 0, 1, 1,
-0.8244521, 0.7229764, -1.390423, 0, 0, 0, 1, 1,
-0.819815, 0.7615668, -2.764459, 0, 0, 0, 1, 1,
-0.8180082, -0.9179304, -1.282087, 0, 0, 0, 1, 1,
-0.814763, 1.103572, 0.1416421, 0, 0, 0, 1, 1,
-0.8139663, -0.5438775, -1.583559, 0, 0, 0, 1, 1,
-0.8136492, 0.3068248, -2.826994, 0, 0, 0, 1, 1,
-0.8122956, -1.752154, -1.765871, 0, 0, 0, 1, 1,
-0.8093457, 0.3752895, -1.748463, 1, 1, 1, 1, 1,
-0.7941939, -0.6115085, -3.165123, 1, 1, 1, 1, 1,
-0.7935034, -0.3389725, -1.099082, 1, 1, 1, 1, 1,
-0.7925587, -0.0585422, -2.932357, 1, 1, 1, 1, 1,
-0.7880477, 1.405456, -1.238216, 1, 1, 1, 1, 1,
-0.7866986, -2.649904, -3.208658, 1, 1, 1, 1, 1,
-0.780495, 1.622189, 0.1558524, 1, 1, 1, 1, 1,
-0.780192, -0.09926109, -2.350722, 1, 1, 1, 1, 1,
-0.7771484, -0.5092053, -3.694525, 1, 1, 1, 1, 1,
-0.7767231, 0.8776474, -0.9504004, 1, 1, 1, 1, 1,
-0.7728774, -0.7676994, -1.155972, 1, 1, 1, 1, 1,
-0.7711863, 0.1971983, -1.504052, 1, 1, 1, 1, 1,
-0.7703801, 0.1430159, -1.194145, 1, 1, 1, 1, 1,
-0.767123, -0.5727494, -4.15844, 1, 1, 1, 1, 1,
-0.7600269, 0.8510317, -1.776701, 1, 1, 1, 1, 1,
-0.7539971, -1.296464, -2.602555, 0, 0, 1, 1, 1,
-0.7527326, 1.234394, -0.1241685, 1, 0, 0, 1, 1,
-0.7448961, 0.2873531, -1.746805, 1, 0, 0, 1, 1,
-0.7347548, -1.547333, -3.736404, 1, 0, 0, 1, 1,
-0.7345435, 2.204992, -1.006961, 1, 0, 0, 1, 1,
-0.7334056, -1.646692, -3.044529, 1, 0, 0, 1, 1,
-0.7331678, -2.025073, -1.777221, 0, 0, 0, 1, 1,
-0.7308598, -1.771951, -2.408551, 0, 0, 0, 1, 1,
-0.7276764, -1.28526, -3.911983, 0, 0, 0, 1, 1,
-0.7242714, 1.596747, -0.9490186, 0, 0, 0, 1, 1,
-0.7208057, 1.319958, -1.898177, 0, 0, 0, 1, 1,
-0.7161232, -1.090179, -3.496371, 0, 0, 0, 1, 1,
-0.716086, 0.1993537, -1.146214, 0, 0, 0, 1, 1,
-0.7125911, -0.4182658, -1.245978, 1, 1, 1, 1, 1,
-0.7116662, -1.148124, -2.971084, 1, 1, 1, 1, 1,
-0.7055179, 2.492801, 1.958397, 1, 1, 1, 1, 1,
-0.7028256, 0.5831793, -1.116471, 1, 1, 1, 1, 1,
-0.7025598, 0.05475651, -1.820724, 1, 1, 1, 1, 1,
-0.6937779, -1.791307, -3.023084, 1, 1, 1, 1, 1,
-0.6925038, -0.3859843, -1.881976, 1, 1, 1, 1, 1,
-0.6897826, -0.4332088, -2.306478, 1, 1, 1, 1, 1,
-0.6825534, -0.4706086, -3.238148, 1, 1, 1, 1, 1,
-0.670575, -0.6983728, -2.138183, 1, 1, 1, 1, 1,
-0.6685939, -0.05973047, -1.726852, 1, 1, 1, 1, 1,
-0.6666497, -0.7929053, -1.203566, 1, 1, 1, 1, 1,
-0.6656637, -1.036152, -1.59624, 1, 1, 1, 1, 1,
-0.6636226, 0.5903322, -0.9890132, 1, 1, 1, 1, 1,
-0.6573724, 0.6065527, -2.098716, 1, 1, 1, 1, 1,
-0.6541759, 1.400352, -0.3737355, 0, 0, 1, 1, 1,
-0.6541104, 1.586619, -1.379762, 1, 0, 0, 1, 1,
-0.6532968, 0.4451218, -1.528888, 1, 0, 0, 1, 1,
-0.6515244, -1.224639, -1.233567, 1, 0, 0, 1, 1,
-0.6491564, 0.1144335, -2.150176, 1, 0, 0, 1, 1,
-0.6482994, -0.2375984, -1.51552, 1, 0, 0, 1, 1,
-0.6454496, -0.3260472, -2.637574, 0, 0, 0, 1, 1,
-0.6427947, 0.8180293, -0.3233607, 0, 0, 0, 1, 1,
-0.6396178, -1.884731, -3.442284, 0, 0, 0, 1, 1,
-0.6391082, -0.8343096, -2.300064, 0, 0, 0, 1, 1,
-0.6311126, -0.3752208, -1.419557, 0, 0, 0, 1, 1,
-0.630679, 0.003494832, -0.4554893, 0, 0, 0, 1, 1,
-0.6259419, 1.052776, -1.151872, 0, 0, 0, 1, 1,
-0.6159574, -1.048041, -2.832937, 1, 1, 1, 1, 1,
-0.6028038, 0.7602935, 0.1962791, 1, 1, 1, 1, 1,
-0.6027321, -0.6800814, -1.817081, 1, 1, 1, 1, 1,
-0.6022778, -0.10976, -0.9762262, 1, 1, 1, 1, 1,
-0.6021997, 0.09350972, -1.207986, 1, 1, 1, 1, 1,
-0.5999048, 0.8877757, 0.1703893, 1, 1, 1, 1, 1,
-0.5938824, -1.036389, -1.075168, 1, 1, 1, 1, 1,
-0.5900042, -0.4372095, -1.286745, 1, 1, 1, 1, 1,
-0.5802208, 1.174686, -1.928669, 1, 1, 1, 1, 1,
-0.5760508, -2.216522, -2.118183, 1, 1, 1, 1, 1,
-0.5748729, -0.7671121, -2.456078, 1, 1, 1, 1, 1,
-0.573594, 0.4333171, 0.3399583, 1, 1, 1, 1, 1,
-0.5654631, 0.1962143, 0.1332605, 1, 1, 1, 1, 1,
-0.5543438, -0.1588749, -3.704139, 1, 1, 1, 1, 1,
-0.5503781, -0.3370394, -1.948469, 1, 1, 1, 1, 1,
-0.5489107, -0.4618961, -2.930476, 0, 0, 1, 1, 1,
-0.5458329, -1.452494, -3.219886, 1, 0, 0, 1, 1,
-0.5428199, -0.9666712, -3.072756, 1, 0, 0, 1, 1,
-0.5401945, 0.2163863, -0.1987204, 1, 0, 0, 1, 1,
-0.5400169, -1.096883, -1.100894, 1, 0, 0, 1, 1,
-0.5358171, 1.105658, -0.5394236, 1, 0, 0, 1, 1,
-0.5315319, -1.104077, -3.798636, 0, 0, 0, 1, 1,
-0.5311611, -2.039522, -2.873201, 0, 0, 0, 1, 1,
-0.5259277, 1.537438, 0.7819778, 0, 0, 0, 1, 1,
-0.5252175, -1.168967, -1.973194, 0, 0, 0, 1, 1,
-0.5251774, -0.7354935, -2.681504, 0, 0, 0, 1, 1,
-0.5181116, 0.3893643, -0.4316681, 0, 0, 0, 1, 1,
-0.5180587, -0.1106938, -1.734422, 0, 0, 0, 1, 1,
-0.5173514, 0.1861977, -1.799049, 1, 1, 1, 1, 1,
-0.511898, -1.085139, -2.053723, 1, 1, 1, 1, 1,
-0.5089489, 0.5574399, 1.15596, 1, 1, 1, 1, 1,
-0.5086686, -0.265449, -3.947552, 1, 1, 1, 1, 1,
-0.5080808, -0.9933805, -2.461466, 1, 1, 1, 1, 1,
-0.5074898, 0.9108911, -0.3422086, 1, 1, 1, 1, 1,
-0.5034912, -1.001506, -2.729442, 1, 1, 1, 1, 1,
-0.4968758, 1.506637, 0.008115252, 1, 1, 1, 1, 1,
-0.4964252, -1.022817, -2.613548, 1, 1, 1, 1, 1,
-0.4937872, -0.4056168, -1.406683, 1, 1, 1, 1, 1,
-0.4892951, -0.5814896, -2.814068, 1, 1, 1, 1, 1,
-0.4794037, -0.8053381, -3.720557, 1, 1, 1, 1, 1,
-0.4788291, -0.686249, -2.45027, 1, 1, 1, 1, 1,
-0.4766068, -0.7295941, -1.485638, 1, 1, 1, 1, 1,
-0.4751912, -0.1458772, -2.012691, 1, 1, 1, 1, 1,
-0.4744407, 0.7484972, 1.594237, 0, 0, 1, 1, 1,
-0.468509, 0.4865642, -0.6362076, 1, 0, 0, 1, 1,
-0.4677887, -1.75847, -3.529157, 1, 0, 0, 1, 1,
-0.4673412, 0.5308627, 0.6767236, 1, 0, 0, 1, 1,
-0.4655108, 0.1977566, -0.7855855, 1, 0, 0, 1, 1,
-0.4635178, -1.477825, -4.015503, 1, 0, 0, 1, 1,
-0.4582259, -0.8878964, -1.75332, 0, 0, 0, 1, 1,
-0.457454, -1.056568, -1.833155, 0, 0, 0, 1, 1,
-0.4521542, -1.840499, -4.018385, 0, 0, 0, 1, 1,
-0.4513446, 0.212258, 0.08966477, 0, 0, 0, 1, 1,
-0.4466475, 0.4270172, -1.123772, 0, 0, 0, 1, 1,
-0.4435949, -0.09027185, -3.146449, 0, 0, 0, 1, 1,
-0.4420408, -0.2620015, -2.572419, 0, 0, 0, 1, 1,
-0.432504, 0.6072623, -0.8913611, 1, 1, 1, 1, 1,
-0.4322504, -0.4201225, -1.504293, 1, 1, 1, 1, 1,
-0.4303849, -1.387588, -4.499249, 1, 1, 1, 1, 1,
-0.4298476, -0.8220484, -1.671657, 1, 1, 1, 1, 1,
-0.4257408, -0.8793586, -2.183611, 1, 1, 1, 1, 1,
-0.4232412, -1.621517, -1.957069, 1, 1, 1, 1, 1,
-0.4203666, 0.3766367, -2.319097, 1, 1, 1, 1, 1,
-0.4200461, 0.3929016, -2.867531, 1, 1, 1, 1, 1,
-0.4180758, 1.307242, -0.5736866, 1, 1, 1, 1, 1,
-0.4180206, -0.3200701, -2.812745, 1, 1, 1, 1, 1,
-0.4174456, 0.05192445, -2.427664, 1, 1, 1, 1, 1,
-0.4145902, 1.250033, 0.5026922, 1, 1, 1, 1, 1,
-0.413458, 0.7790269, -2.10097, 1, 1, 1, 1, 1,
-0.413307, 0.9320815, -1.33376, 1, 1, 1, 1, 1,
-0.412055, 1.360263, -1.124153, 1, 1, 1, 1, 1,
-0.4117218, -0.3751779, 0.2639726, 0, 0, 1, 1, 1,
-0.410119, 0.0509105, -2.069137, 1, 0, 0, 1, 1,
-0.4100709, -0.7546, -2.178492, 1, 0, 0, 1, 1,
-0.4083773, 0.1970429, -1.092129, 1, 0, 0, 1, 1,
-0.4081766, 0.6330138, -1.068103, 1, 0, 0, 1, 1,
-0.4063765, 0.07242267, -2.004759, 1, 0, 0, 1, 1,
-0.4026693, -2.310997, -3.016206, 0, 0, 0, 1, 1,
-0.4021502, -0.3212235, -2.239546, 0, 0, 0, 1, 1,
-0.4004385, -0.4423459, -0.4216333, 0, 0, 0, 1, 1,
-0.3970442, -0.2531869, -2.39297, 0, 0, 0, 1, 1,
-0.396737, -0.03328907, 0.2701231, 0, 0, 0, 1, 1,
-0.3921565, 1.050657, 0.5690572, 0, 0, 0, 1, 1,
-0.3898263, -0.5313463, -2.083967, 0, 0, 0, 1, 1,
-0.3866886, 0.2265779, 0.4001207, 1, 1, 1, 1, 1,
-0.3812507, -0.1183711, -1.980354, 1, 1, 1, 1, 1,
-0.3765301, -0.570899, -3.245006, 1, 1, 1, 1, 1,
-0.3763227, 0.5539381, -0.02153978, 1, 1, 1, 1, 1,
-0.371778, -0.673546, -3.709755, 1, 1, 1, 1, 1,
-0.3682956, -1.095002, -2.329639, 1, 1, 1, 1, 1,
-0.3671903, 0.07225086, -0.4661839, 1, 1, 1, 1, 1,
-0.3665261, 0.6286638, 0.5355662, 1, 1, 1, 1, 1,
-0.363071, -0.8426778, -2.393719, 1, 1, 1, 1, 1,
-0.3576328, 1.297238, -1.205748, 1, 1, 1, 1, 1,
-0.3559421, 0.3120931, 0.8812644, 1, 1, 1, 1, 1,
-0.3558055, -1.308583, -2.94628, 1, 1, 1, 1, 1,
-0.3552554, 0.5254013, -2.079664, 1, 1, 1, 1, 1,
-0.3538233, -0.8892723, -3.749404, 1, 1, 1, 1, 1,
-0.3515516, -1.783161, -1.553188, 1, 1, 1, 1, 1,
-0.345948, 1.442554, 0.1638158, 0, 0, 1, 1, 1,
-0.3382609, -1.257312, -3.088874, 1, 0, 0, 1, 1,
-0.3310826, 0.6079538, -0.9873194, 1, 0, 0, 1, 1,
-0.3294672, 0.2297398, -1.175991, 1, 0, 0, 1, 1,
-0.3279671, -1.023283, -3.207127, 1, 0, 0, 1, 1,
-0.3266942, -0.4338669, -4.306811, 1, 0, 0, 1, 1,
-0.3242612, -0.6020595, -2.827196, 0, 0, 0, 1, 1,
-0.3233874, 0.1234559, -1.385016, 0, 0, 0, 1, 1,
-0.3231272, -1.554476, -4.373719, 0, 0, 0, 1, 1,
-0.3167868, 0.740371, -0.4792324, 0, 0, 0, 1, 1,
-0.3160571, 0.02690466, -1.231884, 0, 0, 0, 1, 1,
-0.3130459, 0.4274454, 0.1256961, 0, 0, 0, 1, 1,
-0.3111056, -0.2117516, -2.202129, 0, 0, 0, 1, 1,
-0.3099016, -0.05851944, -1.387483, 1, 1, 1, 1, 1,
-0.3067512, 0.2645852, -0.4156086, 1, 1, 1, 1, 1,
-0.3029531, 0.7042634, -0.2715057, 1, 1, 1, 1, 1,
-0.3028072, -0.4345784, -2.980426, 1, 1, 1, 1, 1,
-0.301515, 0.3802771, -0.8193774, 1, 1, 1, 1, 1,
-0.2986481, -0.4834696, -3.375908, 1, 1, 1, 1, 1,
-0.2940813, 0.6792729, 0.6634066, 1, 1, 1, 1, 1,
-0.2939237, 0.1990187, 0.2572892, 1, 1, 1, 1, 1,
-0.2930155, 0.3852961, 0.05592046, 1, 1, 1, 1, 1,
-0.2910207, -1.320101, -2.434401, 1, 1, 1, 1, 1,
-0.2905117, 1.272938, -1.822264, 1, 1, 1, 1, 1,
-0.2902892, 1.002931, 0.3474811, 1, 1, 1, 1, 1,
-0.2882257, -0.8660748, -3.715465, 1, 1, 1, 1, 1,
-0.2876036, -0.3724772, -3.431263, 1, 1, 1, 1, 1,
-0.2872948, 0.9316602, -2.995157, 1, 1, 1, 1, 1,
-0.2812367, 1.125957, -1.239229, 0, 0, 1, 1, 1,
-0.2800333, 0.7106441, -0.896255, 1, 0, 0, 1, 1,
-0.2768309, -0.1194858, -1.418562, 1, 0, 0, 1, 1,
-0.2752828, -0.3543273, -3.562131, 1, 0, 0, 1, 1,
-0.2735249, -0.4531853, -4.197176, 1, 0, 0, 1, 1,
-0.2727766, -0.4625734, -1.846365, 1, 0, 0, 1, 1,
-0.2702152, -0.7615179, -2.635231, 0, 0, 0, 1, 1,
-0.2687475, -1.397981, -2.988976, 0, 0, 0, 1, 1,
-0.2603533, -1.118592, -0.6330729, 0, 0, 0, 1, 1,
-0.2603224, -0.1153984, -0.1420846, 0, 0, 0, 1, 1,
-0.2588905, -0.1016475, -3.378706, 0, 0, 0, 1, 1,
-0.2576991, -0.9913551, -3.856659, 0, 0, 0, 1, 1,
-0.2555095, 0.7871734, -1.649491, 0, 0, 0, 1, 1,
-0.2543071, -0.5173293, -1.510418, 1, 1, 1, 1, 1,
-0.2542012, -0.4985557, -1.515742, 1, 1, 1, 1, 1,
-0.247356, 0.7948852, 0.2814087, 1, 1, 1, 1, 1,
-0.2472008, 0.983206, 1.334037, 1, 1, 1, 1, 1,
-0.2410654, -0.7536209, -1.380594, 1, 1, 1, 1, 1,
-0.2402803, -0.04426105, -1.502249, 1, 1, 1, 1, 1,
-0.2399041, -0.515553, -1.710445, 1, 1, 1, 1, 1,
-0.2366001, 2.536958, -0.362624, 1, 1, 1, 1, 1,
-0.2323988, 0.02861698, -1.959771, 1, 1, 1, 1, 1,
-0.232013, 1.579131, 0.1326608, 1, 1, 1, 1, 1,
-0.2251518, 0.008757322, -1.734571, 1, 1, 1, 1, 1,
-0.2245606, 0.7657229, -0.06960477, 1, 1, 1, 1, 1,
-0.2210138, 0.03366316, -3.179319, 1, 1, 1, 1, 1,
-0.220154, -0.01402521, -1.985246, 1, 1, 1, 1, 1,
-0.2190662, 0.6080013, -0.6525006, 1, 1, 1, 1, 1,
-0.2187068, -1.275167, -3.824251, 0, 0, 1, 1, 1,
-0.2173526, -0.9461458, -2.553933, 1, 0, 0, 1, 1,
-0.2148666, 0.1102637, -1.904337, 1, 0, 0, 1, 1,
-0.211856, -0.8450617, -4.106166, 1, 0, 0, 1, 1,
-0.210869, -1.057867, -2.322645, 1, 0, 0, 1, 1,
-0.2064249, 0.6044745, -0.9771412, 1, 0, 0, 1, 1,
-0.2035436, -0.4046333, -2.994366, 0, 0, 0, 1, 1,
-0.2016149, -1.18013, -3.372165, 0, 0, 0, 1, 1,
-0.199613, 0.426816, 2.117644, 0, 0, 0, 1, 1,
-0.1949762, 2.544038, 0.5039548, 0, 0, 0, 1, 1,
-0.1947767, -1.652847, -2.068654, 0, 0, 0, 1, 1,
-0.1929468, 0.07886042, -1.323156, 0, 0, 0, 1, 1,
-0.1918703, -1.533707, -4.746887, 0, 0, 0, 1, 1,
-0.1897182, 1.443359, -1.505126, 1, 1, 1, 1, 1,
-0.1858499, -1.370364, -2.943386, 1, 1, 1, 1, 1,
-0.1818282, 0.5415059, -1.862454, 1, 1, 1, 1, 1,
-0.181312, 0.7901779, 1.320212, 1, 1, 1, 1, 1,
-0.1796366, 0.126624, -1.654074, 1, 1, 1, 1, 1,
-0.1786118, 1.383184, -0.1466044, 1, 1, 1, 1, 1,
-0.1780246, -0.1940646, -2.571004, 1, 1, 1, 1, 1,
-0.1769406, -0.8827742, -1.919309, 1, 1, 1, 1, 1,
-0.1764359, 0.4481825, 0.3101292, 1, 1, 1, 1, 1,
-0.1750357, 0.883518, -0.7639956, 1, 1, 1, 1, 1,
-0.1735039, 1.212826, 1.314321, 1, 1, 1, 1, 1,
-0.1731684, 0.3049475, -1.520438, 1, 1, 1, 1, 1,
-0.1717064, -0.4688823, -4.578538, 1, 1, 1, 1, 1,
-0.1697978, 0.241014, 1.525403, 1, 1, 1, 1, 1,
-0.1649163, 0.5205467, -0.6863784, 1, 1, 1, 1, 1,
-0.1641542, 1.209844, -1.126024, 0, 0, 1, 1, 1,
-0.1595019, -0.5839188, -2.534892, 1, 0, 0, 1, 1,
-0.1593269, -0.8187599, -4.231091, 1, 0, 0, 1, 1,
-0.1537341, -0.745554, -3.673127, 1, 0, 0, 1, 1,
-0.152057, 0.04514904, -0.4006005, 1, 0, 0, 1, 1,
-0.1518103, 0.761353, 0.06652243, 1, 0, 0, 1, 1,
-0.1504626, -0.4764559, -3.346161, 0, 0, 0, 1, 1,
-0.1482066, 0.3364338, -0.4045441, 0, 0, 0, 1, 1,
-0.1460883, 1.014553, 1.061453, 0, 0, 0, 1, 1,
-0.1459616, 0.1981368, -1.278231, 0, 0, 0, 1, 1,
-0.1448345, -1.915528, -4.093437, 0, 0, 0, 1, 1,
-0.1410724, -0.08049002, -1.761083, 0, 0, 0, 1, 1,
-0.1406237, -0.5968269, -1.908432, 0, 0, 0, 1, 1,
-0.1395208, 0.4197935, 0.6002061, 1, 1, 1, 1, 1,
-0.1385097, -0.4718519, -3.942587, 1, 1, 1, 1, 1,
-0.1378827, 0.1414647, -0.2398897, 1, 1, 1, 1, 1,
-0.1378229, -0.804096, -3.844769, 1, 1, 1, 1, 1,
-0.1372078, -0.140843, -3.814983, 1, 1, 1, 1, 1,
-0.1329886, -0.8929421, -2.769343, 1, 1, 1, 1, 1,
-0.131782, -2.870772, -3.793528, 1, 1, 1, 1, 1,
-0.1279032, -0.1348887, -1.383671, 1, 1, 1, 1, 1,
-0.1244425, -0.7933943, -4.85479, 1, 1, 1, 1, 1,
-0.1234153, 1.18143, -0.7646986, 1, 1, 1, 1, 1,
-0.1192017, 0.7784518, -1.821936, 1, 1, 1, 1, 1,
-0.118769, -0.2865917, -0.7794107, 1, 1, 1, 1, 1,
-0.1152898, 0.4847168, 0.8646767, 1, 1, 1, 1, 1,
-0.1141768, 0.03345644, -2.077189, 1, 1, 1, 1, 1,
-0.1047259, -0.004512705, 0.4711098, 1, 1, 1, 1, 1,
-0.1030354, -0.8864912, -2.426271, 0, 0, 1, 1, 1,
-0.1024975, 0.1408117, 1.673542, 1, 0, 0, 1, 1,
-0.09847672, -1.171295, -5.043813, 1, 0, 0, 1, 1,
-0.09647439, -0.00802315, -2.758108, 1, 0, 0, 1, 1,
-0.09621711, -0.9166842, -2.355258, 1, 0, 0, 1, 1,
-0.09357937, -0.676302, -0.9016846, 1, 0, 0, 1, 1,
-0.08984546, -0.1730708, -2.197837, 0, 0, 0, 1, 1,
-0.08932262, 2.730618, 1.016572, 0, 0, 0, 1, 1,
-0.08869908, -0.04698598, -1.99149, 0, 0, 0, 1, 1,
-0.07928456, 0.05146188, -0.7915548, 0, 0, 0, 1, 1,
-0.07823752, -1.457328, -2.841345, 0, 0, 0, 1, 1,
-0.06974566, -0.3816995, -2.951567, 0, 0, 0, 1, 1,
-0.05434509, -1.005762, -3.485833, 0, 0, 0, 1, 1,
-0.05366096, -0.03193413, -1.245288, 1, 1, 1, 1, 1,
-0.05205432, 1.328807, 1.435279, 1, 1, 1, 1, 1,
-0.05154615, -0.6852323, -4.207685, 1, 1, 1, 1, 1,
-0.0487428, 1.32931, 0.5614135, 1, 1, 1, 1, 1,
-0.04802268, -0.4432923, -5.190782, 1, 1, 1, 1, 1,
-0.04480578, 1.016978, 1.447833, 1, 1, 1, 1, 1,
-0.04172572, -0.7531034, -4.048665, 1, 1, 1, 1, 1,
-0.04093193, -2.639245, -3.551166, 1, 1, 1, 1, 1,
-0.03879208, 0.4649588, 0.8979006, 1, 1, 1, 1, 1,
-0.03872625, 0.5896538, -0.09114541, 1, 1, 1, 1, 1,
-0.03801833, 0.884851, -2.058123, 1, 1, 1, 1, 1,
-0.03710719, 1.254846, -0.1868428, 1, 1, 1, 1, 1,
-0.035397, -0.6990337, -2.529104, 1, 1, 1, 1, 1,
-0.03450739, 0.7928328, -0.4579359, 1, 1, 1, 1, 1,
-0.03190242, 1.870673, -0.1452624, 1, 1, 1, 1, 1,
-0.03046044, -1.179529, -1.680686, 0, 0, 1, 1, 1,
-0.02650734, 3.113725, -0.3107325, 1, 0, 0, 1, 1,
-0.02538317, 0.3635724, 0.1479605, 1, 0, 0, 1, 1,
-0.0229377, 0.8989944, -1.125073, 1, 0, 0, 1, 1,
-0.01818079, 0.5033484, 0.1503311, 1, 0, 0, 1, 1,
-0.01735852, -0.7473468, -2.517932, 1, 0, 0, 1, 1,
-0.01511385, -0.9452141, -1.727622, 0, 0, 0, 1, 1,
-0.01387077, 0.3094445, -0.9653304, 0, 0, 0, 1, 1,
-0.01201485, -0.7408283, -4.145883, 0, 0, 0, 1, 1,
-0.01055122, -1.114401, -3.119575, 0, 0, 0, 1, 1,
-0.007415071, 0.2953066, 1.121722, 0, 0, 0, 1, 1,
-0.006095177, 0.4993699, -0.6215317, 0, 0, 0, 1, 1,
-0.005373139, 1.845533, 0.4552023, 0, 0, 0, 1, 1,
-0.003213146, -1.717209, -1.840097, 1, 1, 1, 1, 1,
-0.0009941506, 1.345804, 0.9545194, 1, 1, 1, 1, 1,
0.005656893, 0.2944897, -1.236, 1, 1, 1, 1, 1,
0.00750507, -0.06707474, 2.54893, 1, 1, 1, 1, 1,
0.007705991, 0.04130813, -1.848679, 1, 1, 1, 1, 1,
0.008947898, 0.3145437, 0.5124997, 1, 1, 1, 1, 1,
0.01769255, 1.047131, 0.2606769, 1, 1, 1, 1, 1,
0.01804309, -1.362225, 5.09232, 1, 1, 1, 1, 1,
0.0190495, -1.099487, 1.202009, 1, 1, 1, 1, 1,
0.02304634, -1.0992, 3.778559, 1, 1, 1, 1, 1,
0.02406045, -1.42876, 2.994674, 1, 1, 1, 1, 1,
0.0245243, 0.007079023, 1.231432, 1, 1, 1, 1, 1,
0.0262076, 0.1558943, 1.162427, 1, 1, 1, 1, 1,
0.0267302, -0.3893541, 4.550916, 1, 1, 1, 1, 1,
0.02755417, -0.803627, 2.989995, 1, 1, 1, 1, 1,
0.02761835, -1.810839, 3.390239, 0, 0, 1, 1, 1,
0.03097888, -0.00873326, 3.268202, 1, 0, 0, 1, 1,
0.03741605, -0.8775111, 2.787422, 1, 0, 0, 1, 1,
0.03833555, 0.1143463, -0.3510212, 1, 0, 0, 1, 1,
0.04404422, -0.5073878, 3.079322, 1, 0, 0, 1, 1,
0.05161615, -0.7744074, 3.040409, 1, 0, 0, 1, 1,
0.05165207, -0.04260586, 2.089419, 0, 0, 0, 1, 1,
0.05441004, -1.602336, 2.502027, 0, 0, 0, 1, 1,
0.05486603, 1.18039, -1.01491, 0, 0, 0, 1, 1,
0.05572626, 1.144048, 1.82201, 0, 0, 0, 1, 1,
0.05638912, -1.057187, 1.528227, 0, 0, 0, 1, 1,
0.05919862, 1.18515, 0.5141033, 0, 0, 0, 1, 1,
0.06057858, -0.266044, 3.208892, 0, 0, 0, 1, 1,
0.06531478, 0.1112262, 0.09283432, 1, 1, 1, 1, 1,
0.06991166, 1.090683, -0.3971324, 1, 1, 1, 1, 1,
0.07238837, 2.032745, 0.6839156, 1, 1, 1, 1, 1,
0.08315614, 0.6035674, -0.9836815, 1, 1, 1, 1, 1,
0.08426721, -0.02812882, 2.263127, 1, 1, 1, 1, 1,
0.08517291, -0.8271777, 1.896946, 1, 1, 1, 1, 1,
0.09358249, -1.530036, 2.244516, 1, 1, 1, 1, 1,
0.09478722, 0.8613869, 1.10954, 1, 1, 1, 1, 1,
0.09552623, 0.2314595, 1.269157, 1, 1, 1, 1, 1,
0.09753653, -0.3702453, 4.234785, 1, 1, 1, 1, 1,
0.09970057, -0.2918573, 3.821788, 1, 1, 1, 1, 1,
0.1010668, -0.2145623, 1.349278, 1, 1, 1, 1, 1,
0.1077265, -0.4085358, 2.51363, 1, 1, 1, 1, 1,
0.1131708, -1.245672, 2.84243, 1, 1, 1, 1, 1,
0.1207185, -1.430675, 2.022474, 1, 1, 1, 1, 1,
0.1208767, -1.022143, 2.248231, 0, 0, 1, 1, 1,
0.1267136, -0.6942016, 3.247449, 1, 0, 0, 1, 1,
0.1288596, -0.8507508, 3.406605, 1, 0, 0, 1, 1,
0.1295037, 1.183114, -1.076471, 1, 0, 0, 1, 1,
0.1313542, -1.843222, 2.359191, 1, 0, 0, 1, 1,
0.1320862, -2.10559, 4.580856, 1, 0, 0, 1, 1,
0.1333057, -0.4792173, 1.402552, 0, 0, 0, 1, 1,
0.1394097, -0.2762291, 3.320021, 0, 0, 0, 1, 1,
0.142863, -0.8923724, 2.110907, 0, 0, 0, 1, 1,
0.1436659, 0.8173734, -0.5855999, 0, 0, 0, 1, 1,
0.1474063, 1.216382, 0.1102446, 0, 0, 0, 1, 1,
0.1481657, 0.1647184, -1.798534, 0, 0, 0, 1, 1,
0.1485065, -0.9185184, 4.375879, 0, 0, 0, 1, 1,
0.1532595, -1.854272, 1.017959, 1, 1, 1, 1, 1,
0.1580604, -0.4853923, 2.049527, 1, 1, 1, 1, 1,
0.1588869, 0.9794655, 2.136249, 1, 1, 1, 1, 1,
0.1590022, -0.3513631, 0.9062245, 1, 1, 1, 1, 1,
0.1606651, -2.462741, 5.170283, 1, 1, 1, 1, 1,
0.1612756, 0.3885289, 2.006402, 1, 1, 1, 1, 1,
0.1623428, -1.550185, 3.969022, 1, 1, 1, 1, 1,
0.1650257, -0.05309535, 3.054928, 1, 1, 1, 1, 1,
0.1660663, 0.5857425, -0.1703664, 1, 1, 1, 1, 1,
0.1669398, 0.4783272, -0.162403, 1, 1, 1, 1, 1,
0.1680463, 0.4168879, 0.05659057, 1, 1, 1, 1, 1,
0.1719392, 1.255958, -1.669145, 1, 1, 1, 1, 1,
0.1779956, -0.7045917, 1.578191, 1, 1, 1, 1, 1,
0.1792823, 0.7923928, 1.978548, 1, 1, 1, 1, 1,
0.1803738, 0.8218849, -0.1740462, 1, 1, 1, 1, 1,
0.185187, -0.7470687, 5.11281, 0, 0, 1, 1, 1,
0.1929095, 1.095362, 0.9413193, 1, 0, 0, 1, 1,
0.197118, 1.150816, 0.1734743, 1, 0, 0, 1, 1,
0.2005329, 0.9859649, 1.380026, 1, 0, 0, 1, 1,
0.2047769, -0.7003796, 3.545794, 1, 0, 0, 1, 1,
0.2050496, 0.8106257, -0.4246296, 1, 0, 0, 1, 1,
0.2070072, -0.5550229, 1.926243, 0, 0, 0, 1, 1,
0.208363, -0.4762447, 2.454502, 0, 0, 0, 1, 1,
0.2093592, 1.162731, -0.4133777, 0, 0, 0, 1, 1,
0.2099643, -0.3585966, 2.928389, 0, 0, 0, 1, 1,
0.2132646, 0.7350554, -0.2517217, 0, 0, 0, 1, 1,
0.2158819, 0.5133394, 0.2014766, 0, 0, 0, 1, 1,
0.2188469, 0.9734276, -0.2340757, 0, 0, 0, 1, 1,
0.2211697, -0.39227, 3.767346, 1, 1, 1, 1, 1,
0.2262902, 2.07117, -0.6395043, 1, 1, 1, 1, 1,
0.226408, -0.1302514, 1.032098, 1, 1, 1, 1, 1,
0.227043, -0.6957492, 2.806049, 1, 1, 1, 1, 1,
0.2284263, 0.4062075, -0.891935, 1, 1, 1, 1, 1,
0.2326015, -1.469885, 2.754064, 1, 1, 1, 1, 1,
0.2326469, 0.956212, 0.6842666, 1, 1, 1, 1, 1,
0.2341823, 0.8468785, 0.3705223, 1, 1, 1, 1, 1,
0.2342139, 0.3345804, -0.7004541, 1, 1, 1, 1, 1,
0.2344868, 0.2947386, 1.432662, 1, 1, 1, 1, 1,
0.2369851, -1.656344, 2.766419, 1, 1, 1, 1, 1,
0.2419004, -1.3143, 3.545181, 1, 1, 1, 1, 1,
0.2429786, -1.98753, 4.046905, 1, 1, 1, 1, 1,
0.2441831, -1.50528, 4.020706, 1, 1, 1, 1, 1,
0.2467103, 0.4106065, -0.1329, 1, 1, 1, 1, 1,
0.247428, 0.1030155, -0.3922271, 0, 0, 1, 1, 1,
0.2496683, 0.187366, 0.9185905, 1, 0, 0, 1, 1,
0.2505015, 1.89756, 0.5860114, 1, 0, 0, 1, 1,
0.2507479, 0.1525726, 2.558897, 1, 0, 0, 1, 1,
0.252587, -1.086964, 4.734354, 1, 0, 0, 1, 1,
0.2559337, -0.4112701, 1.1348, 1, 0, 0, 1, 1,
0.2671373, -1.847843, 2.357314, 0, 0, 0, 1, 1,
0.2672494, -0.5844584, 4.152536, 0, 0, 0, 1, 1,
0.2690924, 0.5529013, 1.59737, 0, 0, 0, 1, 1,
0.2693706, 1.090734, -0.687233, 0, 0, 0, 1, 1,
0.2703217, -1.352448, 3.562048, 0, 0, 0, 1, 1,
0.2712881, -0.07418286, 1.719301, 0, 0, 0, 1, 1,
0.2728296, -0.1533272, 3.976932, 0, 0, 0, 1, 1,
0.2732503, -0.782845, 3.794218, 1, 1, 1, 1, 1,
0.2763735, -0.6649944, 3.944139, 1, 1, 1, 1, 1,
0.2772686, 1.061058, -0.2929592, 1, 1, 1, 1, 1,
0.2792063, 0.7165312, -1.41625, 1, 1, 1, 1, 1,
0.2809116, 1.001001, -0.739041, 1, 1, 1, 1, 1,
0.2820716, 1.847661, 0.06254376, 1, 1, 1, 1, 1,
0.2847416, 0.480246, -0.3718038, 1, 1, 1, 1, 1,
0.2907795, -0.9419975, 4.027852, 1, 1, 1, 1, 1,
0.2945589, -0.5480669, 0.8090953, 1, 1, 1, 1, 1,
0.2953986, -1.440352, 3.051247, 1, 1, 1, 1, 1,
0.2995816, -0.07917854, 1.391074, 1, 1, 1, 1, 1,
0.3053096, -0.9345638, 1.756331, 1, 1, 1, 1, 1,
0.3063418, -0.6379035, 2.359758, 1, 1, 1, 1, 1,
0.3073435, -0.4471445, 2.023008, 1, 1, 1, 1, 1,
0.3089609, 0.2238049, 0.7370081, 1, 1, 1, 1, 1,
0.3119394, -0.525175, 1.83533, 0, 0, 1, 1, 1,
0.3125961, -1.959443, 0.6723743, 1, 0, 0, 1, 1,
0.3130817, -1.328473, 2.859963, 1, 0, 0, 1, 1,
0.3180449, -0.8176752, 3.997016, 1, 0, 0, 1, 1,
0.3184196, 0.9923335, 1.799202, 1, 0, 0, 1, 1,
0.326461, -0.1579973, 1.573912, 1, 0, 0, 1, 1,
0.3280996, 0.4045973, 0.7585747, 0, 0, 0, 1, 1,
0.337836, 0.2608941, 2.053833, 0, 0, 0, 1, 1,
0.3451274, 0.9388205, 0.1822346, 0, 0, 0, 1, 1,
0.3459104, -1.229211, 3.690009, 0, 0, 0, 1, 1,
0.3473729, 1.043679, 0.4234794, 0, 0, 0, 1, 1,
0.348071, -0.2325322, 3.105933, 0, 0, 0, 1, 1,
0.352115, -0.2652868, 0.07145445, 0, 0, 0, 1, 1,
0.3540372, 0.6341106, 1.191318, 1, 1, 1, 1, 1,
0.3587521, -1.748677, 0.9949512, 1, 1, 1, 1, 1,
0.3599615, 0.5707636, 0.683056, 1, 1, 1, 1, 1,
0.3657832, -1.207221, 1.660674, 1, 1, 1, 1, 1,
0.3703087, 0.8630729, -0.3871788, 1, 1, 1, 1, 1,
0.3739548, 0.09620856, 0.250984, 1, 1, 1, 1, 1,
0.3748003, 1.240723, -0.567629, 1, 1, 1, 1, 1,
0.3769863, -0.2950903, 3.491641, 1, 1, 1, 1, 1,
0.3781348, 0.4059277, 1.552416, 1, 1, 1, 1, 1,
0.3794097, 1.175651, 0.878599, 1, 1, 1, 1, 1,
0.3844046, 1.067885, 2.510036, 1, 1, 1, 1, 1,
0.3853583, 1.02121, 1.893918, 1, 1, 1, 1, 1,
0.3895787, -0.7357092, 2.462114, 1, 1, 1, 1, 1,
0.3904662, 0.6390046, -0.306518, 1, 1, 1, 1, 1,
0.4006042, 0.7870713, 0.7212147, 1, 1, 1, 1, 1,
0.4020944, -1.215437, 2.499907, 0, 0, 1, 1, 1,
0.4045451, -0.6673954, 2.021688, 1, 0, 0, 1, 1,
0.4055019, -1.45033, 2.037343, 1, 0, 0, 1, 1,
0.4063828, 1.208632, 0.8923975, 1, 0, 0, 1, 1,
0.4083886, -0.01678181, 1.525162, 1, 0, 0, 1, 1,
0.4096005, -0.4877885, 2.36951, 1, 0, 0, 1, 1,
0.4111169, 0.1625175, 0.2370696, 0, 0, 0, 1, 1,
0.4125272, -0.5743209, 2.549209, 0, 0, 0, 1, 1,
0.4175918, -1.037513, 4.244292, 0, 0, 0, 1, 1,
0.4214948, 0.5857815, 0.4859627, 0, 0, 0, 1, 1,
0.4258239, -1.632617, 4.046093, 0, 0, 0, 1, 1,
0.4306823, -0.91132, 1.738145, 0, 0, 0, 1, 1,
0.4329603, 0.4865356, 0.2917168, 0, 0, 0, 1, 1,
0.433165, -1.851915, 2.437411, 1, 1, 1, 1, 1,
0.43472, -2.259433, 2.571286, 1, 1, 1, 1, 1,
0.4379925, 0.2627882, 1.465624, 1, 1, 1, 1, 1,
0.4424476, 0.4643513, 2.467516, 1, 1, 1, 1, 1,
0.44362, -0.3033086, 3.795365, 1, 1, 1, 1, 1,
0.4437232, 0.3663966, 0.4911295, 1, 1, 1, 1, 1,
0.444025, -1.401646, 1.77879, 1, 1, 1, 1, 1,
0.4552727, -1.765574, 3.27397, 1, 1, 1, 1, 1,
0.4608946, 0.2809935, 0.7824351, 1, 1, 1, 1, 1,
0.4612674, 1.121879, 1.389538, 1, 1, 1, 1, 1,
0.4622741, -0.3022884, 2.179318, 1, 1, 1, 1, 1,
0.4635747, 0.5852993, 1.361288, 1, 1, 1, 1, 1,
0.4644147, -0.1815984, 2.242132, 1, 1, 1, 1, 1,
0.4698355, -1.040106, 2.895244, 1, 1, 1, 1, 1,
0.476215, -2.994354, 1.074547, 1, 1, 1, 1, 1,
0.4772122, 1.057279, -0.2687327, 0, 0, 1, 1, 1,
0.4796287, -1.142623, 2.912997, 1, 0, 0, 1, 1,
0.4842602, 0.8984326, 0.1081704, 1, 0, 0, 1, 1,
0.4862167, 1.697242, -0.03979324, 1, 0, 0, 1, 1,
0.4880039, -0.4335219, 4.839235, 1, 0, 0, 1, 1,
0.5037526, 3.030129, -0.4872873, 1, 0, 0, 1, 1,
0.5045173, -0.2869776, 2.202381, 0, 0, 0, 1, 1,
0.5053537, -1.558995, 3.783962, 0, 0, 0, 1, 1,
0.5059522, -0.3950041, 2.129042, 0, 0, 0, 1, 1,
0.5141556, 1.201939, -0.564994, 0, 0, 0, 1, 1,
0.5177325, -0.2754647, 2.406853, 0, 0, 0, 1, 1,
0.5186188, -0.5524471, 2.350677, 0, 0, 0, 1, 1,
0.5259021, 0.3956801, 0.04666048, 0, 0, 0, 1, 1,
0.5263828, 0.04102703, 1.759882, 1, 1, 1, 1, 1,
0.5269529, 0.1489139, 2.665961, 1, 1, 1, 1, 1,
0.5297118, -0.1308839, 1.942146, 1, 1, 1, 1, 1,
0.542388, -0.0214483, 2.592068, 1, 1, 1, 1, 1,
0.5429764, -0.4978012, 3.744024, 1, 1, 1, 1, 1,
0.5433921, 0.046041, 0.2707611, 1, 1, 1, 1, 1,
0.5509, 0.05331695, -0.2357106, 1, 1, 1, 1, 1,
0.5527312, -0.08653548, 1.843895, 1, 1, 1, 1, 1,
0.5532852, -0.1533752, 0.4926125, 1, 1, 1, 1, 1,
0.5560585, 0.2299375, -0.0219771, 1, 1, 1, 1, 1,
0.559862, 0.5516001, 0.9721357, 1, 1, 1, 1, 1,
0.5623233, -1.590209, 2.547872, 1, 1, 1, 1, 1,
0.5632859, 0.2656628, -0.9673845, 1, 1, 1, 1, 1,
0.5751759, -0.1041035, 1.407458, 1, 1, 1, 1, 1,
0.5776199, -1.076357, 1.967252, 1, 1, 1, 1, 1,
0.5790013, 0.2987889, 0.8726465, 0, 0, 1, 1, 1,
0.5798992, 0.3137133, 1.742278, 1, 0, 0, 1, 1,
0.5802499, 0.9507456, 0.6655374, 1, 0, 0, 1, 1,
0.5819991, 0.2043594, 1.229758, 1, 0, 0, 1, 1,
0.5858308, -0.1368237, 0.7065, 1, 0, 0, 1, 1,
0.5879364, 1.065502, -0.05759264, 1, 0, 0, 1, 1,
0.5898799, -1.080409, 2.899333, 0, 0, 0, 1, 1,
0.5905226, -0.7021724, 0.8420065, 0, 0, 0, 1, 1,
0.5996141, 0.3412124, 1.093075, 0, 0, 0, 1, 1,
0.6005068, 0.05426308, 0.967285, 0, 0, 0, 1, 1,
0.60338, 1.97881, 0.2453746, 0, 0, 0, 1, 1,
0.6068031, -0.04564527, 2.35598, 0, 0, 0, 1, 1,
0.609002, -0.9109322, 2.801634, 0, 0, 0, 1, 1,
0.6109849, -1.139394, 2.033311, 1, 1, 1, 1, 1,
0.612486, -0.8119432, 2.445392, 1, 1, 1, 1, 1,
0.6155583, -0.1664823, 2.374988, 1, 1, 1, 1, 1,
0.6180183, -1.539406, 2.862719, 1, 1, 1, 1, 1,
0.6183583, -2.075171, 3.495327, 1, 1, 1, 1, 1,
0.6243493, -0.5548563, 2.815155, 1, 1, 1, 1, 1,
0.6246232, -0.8465571, 0.6171146, 1, 1, 1, 1, 1,
0.6283951, -1.231998, 4.133565, 1, 1, 1, 1, 1,
0.628756, -0.5218357, 2.054209, 1, 1, 1, 1, 1,
0.6296209, 0.008171907, 2.515096, 1, 1, 1, 1, 1,
0.6319937, 1.134654, 2.362854, 1, 1, 1, 1, 1,
0.635206, 0.07041488, 0.4608782, 1, 1, 1, 1, 1,
0.6411962, 0.8450465, 0.3938469, 1, 1, 1, 1, 1,
0.6456183, 0.5152282, 0.741599, 1, 1, 1, 1, 1,
0.6457309, -0.4182715, 3.109377, 1, 1, 1, 1, 1,
0.6484046, 0.2725494, 1.900167, 0, 0, 1, 1, 1,
0.659388, -0.1112218, 2.264064, 1, 0, 0, 1, 1,
0.662231, -0.3162385, 1.33523, 1, 0, 0, 1, 1,
0.6693279, -1.103809, 3.721613, 1, 0, 0, 1, 1,
0.6715707, -0.0855964, 2.707433, 1, 0, 0, 1, 1,
0.6776173, -0.3231086, 1.631655, 1, 0, 0, 1, 1,
0.6794274, -0.05197254, 3.780188, 0, 0, 0, 1, 1,
0.6813974, -1.728443, 2.146057, 0, 0, 0, 1, 1,
0.6820317, -0.4387087, 3.657065, 0, 0, 0, 1, 1,
0.6868457, -0.0312583, 1.230696, 0, 0, 0, 1, 1,
0.6916159, 2.576658, 0.5782048, 0, 0, 0, 1, 1,
0.6977981, -0.3076696, 1.957272, 0, 0, 0, 1, 1,
0.6989334, -1.774691, 3.042825, 0, 0, 0, 1, 1,
0.6995826, -0.3569364, 1.908509, 1, 1, 1, 1, 1,
0.7044661, -0.9741788, 1.746962, 1, 1, 1, 1, 1,
0.7092844, -0.5621631, 1.906289, 1, 1, 1, 1, 1,
0.709538, -0.4484335, 3.78987, 1, 1, 1, 1, 1,
0.7103294, 0.5279831, 0.9062306, 1, 1, 1, 1, 1,
0.7126237, -0.2956336, 2.381645, 1, 1, 1, 1, 1,
0.7201468, -1.596311, 2.899707, 1, 1, 1, 1, 1,
0.7227862, -0.467308, 1.354917, 1, 1, 1, 1, 1,
0.7242247, -1.51347, 4.297688, 1, 1, 1, 1, 1,
0.7269867, -1.232775, 1.882005, 1, 1, 1, 1, 1,
0.7319669, 0.4969094, 0.4772018, 1, 1, 1, 1, 1,
0.734045, 0.5656235, 2.238467, 1, 1, 1, 1, 1,
0.735464, -0.6538476, 3.259045, 1, 1, 1, 1, 1,
0.7380033, 0.08205745, -0.1323873, 1, 1, 1, 1, 1,
0.7394648, -0.06895814, 3.26889, 1, 1, 1, 1, 1,
0.7496732, 0.2069031, 1.562103, 0, 0, 1, 1, 1,
0.7526565, -0.7497001, 0.4042911, 1, 0, 0, 1, 1,
0.7680088, -0.2379953, 1.781344, 1, 0, 0, 1, 1,
0.7740321, -1.541612, 1.983929, 1, 0, 0, 1, 1,
0.7755545, -0.3605256, 2.368103, 1, 0, 0, 1, 1,
0.7759397, 0.6002488, -0.04425481, 1, 0, 0, 1, 1,
0.7798665, 0.2167899, 0.3175848, 0, 0, 0, 1, 1,
0.7830698, -1.061581, 2.7278, 0, 0, 0, 1, 1,
0.7902924, 0.7310669, 1.039443, 0, 0, 0, 1, 1,
0.7961193, 0.704506, 1.397517, 0, 0, 0, 1, 1,
0.798995, -0.1970758, 1.65182, 0, 0, 0, 1, 1,
0.7992759, 1.020135, -0.1937668, 0, 0, 0, 1, 1,
0.8001792, -0.8592499, 2.385396, 0, 0, 0, 1, 1,
0.8023431, 1.510642, 1.423015, 1, 1, 1, 1, 1,
0.8050532, -0.780198, 2.178876, 1, 1, 1, 1, 1,
0.8074927, -0.2923415, 2.993972, 1, 1, 1, 1, 1,
0.8125578, -0.584784, 2.386662, 1, 1, 1, 1, 1,
0.8162387, 0.3272164, 1.011161, 1, 1, 1, 1, 1,
0.8173151, 1.124226, -0.6470681, 1, 1, 1, 1, 1,
0.8207441, 0.50691, -0.1154592, 1, 1, 1, 1, 1,
0.8223447, -0.2513859, 0.4604958, 1, 1, 1, 1, 1,
0.8241473, 0.6104609, -0.4004906, 1, 1, 1, 1, 1,
0.8267148, 0.286219, -0.8990743, 1, 1, 1, 1, 1,
0.8271669, -0.1742779, 2.192164, 1, 1, 1, 1, 1,
0.8281223, 1.010274, 1.225677, 1, 1, 1, 1, 1,
0.8298835, -1.543365, 2.847587, 1, 1, 1, 1, 1,
0.8301147, 0.8107386, -2.324535, 1, 1, 1, 1, 1,
0.8307728, 0.1825907, 0.8118922, 1, 1, 1, 1, 1,
0.8313811, 1.099621, 2.225903, 0, 0, 1, 1, 1,
0.8318936, -3.717153, 3.195123, 1, 0, 0, 1, 1,
0.8354901, -0.302095, 2.923566, 1, 0, 0, 1, 1,
0.8370813, -0.7645518, 2.567879, 1, 0, 0, 1, 1,
0.8396571, -0.8700485, 1.619595, 1, 0, 0, 1, 1,
0.8413432, -1.658628, 3.339109, 1, 0, 0, 1, 1,
0.8553021, -1.65254, 2.540606, 0, 0, 0, 1, 1,
0.8556977, 0.1010977, -0.2464003, 0, 0, 0, 1, 1,
0.860624, 0.9687994, 0.7205664, 0, 0, 0, 1, 1,
0.8611934, 0.03461418, 0.904362, 0, 0, 0, 1, 1,
0.8648481, 0.8137648, -0.2645013, 0, 0, 0, 1, 1,
0.8700495, -0.4537171, 1.616815, 0, 0, 0, 1, 1,
0.873517, -0.8861151, 1.734048, 0, 0, 0, 1, 1,
0.8830405, -0.6432315, 3.241214, 1, 1, 1, 1, 1,
0.8907323, 0.7206365, 1.825788, 1, 1, 1, 1, 1,
0.893206, 0.605325, -0.1588075, 1, 1, 1, 1, 1,
0.902323, -0.6122431, 2.805561, 1, 1, 1, 1, 1,
0.9089895, -0.5254062, 0.4833848, 1, 1, 1, 1, 1,
0.9128168, 0.3770235, 0.3397392, 1, 1, 1, 1, 1,
0.9150107, 0.3765059, 1.924689, 1, 1, 1, 1, 1,
0.9212512, 0.06244265, 1.000329, 1, 1, 1, 1, 1,
0.9237635, 0.6471615, 1.211977, 1, 1, 1, 1, 1,
0.9259495, 1.826528, 1.374056, 1, 1, 1, 1, 1,
0.9306474, 0.09746142, 0.9149146, 1, 1, 1, 1, 1,
0.9313527, -0.8487392, 3.907182, 1, 1, 1, 1, 1,
0.9354052, -0.405378, 2.124539, 1, 1, 1, 1, 1,
0.9428921, 0.6325206, 0.692386, 1, 1, 1, 1, 1,
0.9465587, -0.7299666, 1.66626, 1, 1, 1, 1, 1,
0.9488719, 0.8552415, 1.014309, 0, 0, 1, 1, 1,
0.9533782, 1.1056, -0.2414127, 1, 0, 0, 1, 1,
0.9618104, -0.9684085, 1.026504, 1, 0, 0, 1, 1,
0.9625235, -0.6878491, 1.301043, 1, 0, 0, 1, 1,
0.9674947, -1.201922, 1.913466, 1, 0, 0, 1, 1,
0.9831828, 1.278764, 1.837156, 1, 0, 0, 1, 1,
0.9874011, 0.1908234, 1.98893, 0, 0, 0, 1, 1,
0.9882795, 0.1967845, 0.5381551, 0, 0, 0, 1, 1,
0.9913868, -0.1367389, 2.251881, 0, 0, 0, 1, 1,
0.9926338, -0.3326028, 3.84568, 0, 0, 0, 1, 1,
1.001503, -0.1722275, 3.608403, 0, 0, 0, 1, 1,
1.005133, 0.09159768, 2.063269, 0, 0, 0, 1, 1,
1.008307, -0.009190619, 1.960608, 0, 0, 0, 1, 1,
1.01241, -0.8335333, 1.195055, 1, 1, 1, 1, 1,
1.015964, 0.9273244, 0.7691284, 1, 1, 1, 1, 1,
1.018757, -0.3971655, 1.935484, 1, 1, 1, 1, 1,
1.024553, 0.8694291, 1.363424, 1, 1, 1, 1, 1,
1.031677, 1.181486, 0.02333294, 1, 1, 1, 1, 1,
1.037855, -0.5779061, 0.8029771, 1, 1, 1, 1, 1,
1.038554, -0.7919003, 2.291185, 1, 1, 1, 1, 1,
1.039344, -0.3221293, 0.8059086, 1, 1, 1, 1, 1,
1.0403, 2.691749, -0.7145317, 1, 1, 1, 1, 1,
1.049934, -0.3327402, 3.230715, 1, 1, 1, 1, 1,
1.050166, -0.3831899, -0.431872, 1, 1, 1, 1, 1,
1.055775, -2.261996, 3.613732, 1, 1, 1, 1, 1,
1.061522, -1.243308, 1.908474, 1, 1, 1, 1, 1,
1.061756, -0.3473405, 2.555262, 1, 1, 1, 1, 1,
1.072813, 0.1903906, 1.6659, 1, 1, 1, 1, 1,
1.073522, -0.823275, 3.248622, 0, 0, 1, 1, 1,
1.073611, 1.226891, 0.1353719, 1, 0, 0, 1, 1,
1.083845, 0.3376388, 1.308471, 1, 0, 0, 1, 1,
1.0889, 1.561336, 0.4860227, 1, 0, 0, 1, 1,
1.093538, 0.06598534, 1.12616, 1, 0, 0, 1, 1,
1.095786, -1.0168, 2.425119, 1, 0, 0, 1, 1,
1.099636, -1.802824, 3.245505, 0, 0, 0, 1, 1,
1.110216, 1.055963, -0.7082843, 0, 0, 0, 1, 1,
1.112113, -1.691761, 2.260281, 0, 0, 0, 1, 1,
1.119969, 1.710251, -0.6512727, 0, 0, 0, 1, 1,
1.127946, 0.4246728, 1.822385, 0, 0, 0, 1, 1,
1.135818, -0.3220565, 1.196591, 0, 0, 0, 1, 1,
1.157713, 1.112782, 0.1512886, 0, 0, 0, 1, 1,
1.160429, 0.7724836, 0.7031677, 1, 1, 1, 1, 1,
1.165084, -0.4488103, 2.323719, 1, 1, 1, 1, 1,
1.170859, 0.5632505, 0.7283291, 1, 1, 1, 1, 1,
1.171326, 0.8265777, -0.1644164, 1, 1, 1, 1, 1,
1.174393, -0.5176098, 1.496804, 1, 1, 1, 1, 1,
1.191904, 1.319929, 1.242387, 1, 1, 1, 1, 1,
1.201306, 0.6092193, 0.6536731, 1, 1, 1, 1, 1,
1.204534, -0.02900033, 1.141454, 1, 1, 1, 1, 1,
1.204849, 1.229237, -0.6444409, 1, 1, 1, 1, 1,
1.212034, -0.6504353, 2.96195, 1, 1, 1, 1, 1,
1.21259, 0.009462428, 0.05331296, 1, 1, 1, 1, 1,
1.215785, -0.1324977, 1.709136, 1, 1, 1, 1, 1,
1.217997, 0.8210403, 1.36994, 1, 1, 1, 1, 1,
1.218784, -0.7922298, 2.553721, 1, 1, 1, 1, 1,
1.226119, -0.5760458, 1.734973, 1, 1, 1, 1, 1,
1.230035, -0.7032622, 3.200996, 0, 0, 1, 1, 1,
1.23737, -1.404052, 2.745312, 1, 0, 0, 1, 1,
1.243836, 0.6678293, 0.313209, 1, 0, 0, 1, 1,
1.256291, -0.6381842, 3.375826, 1, 0, 0, 1, 1,
1.256906, -0.04013869, 1.750149, 1, 0, 0, 1, 1,
1.25964, -0.9270312, 2.696893, 1, 0, 0, 1, 1,
1.261188, 0.6179016, 0.4670944, 0, 0, 0, 1, 1,
1.267027, -0.4950382, 1.215231, 0, 0, 0, 1, 1,
1.279203, -0.4523118, 3.478793, 0, 0, 0, 1, 1,
1.27942, -0.006036518, 0.4516365, 0, 0, 0, 1, 1,
1.283006, 0.4978084, 2.303158, 0, 0, 0, 1, 1,
1.284601, -0.1760694, 1.535965, 0, 0, 0, 1, 1,
1.288663, -0.7247396, 1.012821, 0, 0, 0, 1, 1,
1.291416, 0.1407985, 2.122511, 1, 1, 1, 1, 1,
1.306817, -0.7807679, 3.032853, 1, 1, 1, 1, 1,
1.32128, -0.4260154, 1.602582, 1, 1, 1, 1, 1,
1.324588, 1.207633, 0.979762, 1, 1, 1, 1, 1,
1.331509, 0.0265297, 0.1288126, 1, 1, 1, 1, 1,
1.333447, 1.762454, 0.5676509, 1, 1, 1, 1, 1,
1.340631, 0.56185, 0.7123514, 1, 1, 1, 1, 1,
1.351179, 0.9995364, 0.3505674, 1, 1, 1, 1, 1,
1.352592, 0.2126488, 1.286639, 1, 1, 1, 1, 1,
1.357696, -0.9923432, 3.122677, 1, 1, 1, 1, 1,
1.358502, -0.9721217, 0.6012735, 1, 1, 1, 1, 1,
1.3682, 0.5442094, 3.125832, 1, 1, 1, 1, 1,
1.372805, 2.388749, 1.081779, 1, 1, 1, 1, 1,
1.382272, -2.140505, 1.941897, 1, 1, 1, 1, 1,
1.389166, -1.368024, 1.960816, 1, 1, 1, 1, 1,
1.41417, 0.9080635, 0.9906747, 0, 0, 1, 1, 1,
1.41554, -0.2699645, 0.9826447, 1, 0, 0, 1, 1,
1.426831, -0.458922, 0.6988415, 1, 0, 0, 1, 1,
1.437583, 1.549338, 0.4112804, 1, 0, 0, 1, 1,
1.442853, 1.557659, -1.047197, 1, 0, 0, 1, 1,
1.445947, 0.2166223, 0.5382023, 1, 0, 0, 1, 1,
1.446925, 1.459894, -0.02088537, 0, 0, 0, 1, 1,
1.453412, -0.01778475, 1.691181, 0, 0, 0, 1, 1,
1.459543, -0.2383755, 1.399991, 0, 0, 0, 1, 1,
1.467046, -0.340421, 2.930469, 0, 0, 0, 1, 1,
1.469132, -1.523933, 2.389801, 0, 0, 0, 1, 1,
1.474467, 0.03398797, 0.9838065, 0, 0, 0, 1, 1,
1.480125, -0.09806485, 1.647508, 0, 0, 0, 1, 1,
1.484837, 0.7779012, 0.0552192, 1, 1, 1, 1, 1,
1.490804, 0.3309028, 1.871987, 1, 1, 1, 1, 1,
1.491379, -1.629267, 1.504131, 1, 1, 1, 1, 1,
1.505902, 2.908576, 0.3883186, 1, 1, 1, 1, 1,
1.507671, 0.7428417, 0.915357, 1, 1, 1, 1, 1,
1.511162, 1.113884, -0.5959709, 1, 1, 1, 1, 1,
1.52595, 0.6778337, 1.033367, 1, 1, 1, 1, 1,
1.533097, -0.4382892, 1.896587, 1, 1, 1, 1, 1,
1.546603, -0.2030873, 2.857183, 1, 1, 1, 1, 1,
1.554843, 0.6536103, 1.78473, 1, 1, 1, 1, 1,
1.563716, 0.2792173, 2.623269, 1, 1, 1, 1, 1,
1.564814, 0.6054435, 0.2271549, 1, 1, 1, 1, 1,
1.594227, 0.05446692, 0.8803594, 1, 1, 1, 1, 1,
1.611712, 1.957884, 1.89437, 1, 1, 1, 1, 1,
1.617388, 0.2799733, 1.373726, 1, 1, 1, 1, 1,
1.628874, 0.143999, 1.331624, 0, 0, 1, 1, 1,
1.631989, 0.001815633, 2.897995, 1, 0, 0, 1, 1,
1.635529, -0.1157941, 1.814198, 1, 0, 0, 1, 1,
1.662611, 0.6803994, 1.10577, 1, 0, 0, 1, 1,
1.685919, -1.322045, -0.7428049, 1, 0, 0, 1, 1,
1.687974, 0.16286, 0.2612729, 1, 0, 0, 1, 1,
1.700168, 0.9644863, 1.6907, 0, 0, 0, 1, 1,
1.706236, 0.7403917, 0.09099271, 0, 0, 0, 1, 1,
1.758627, 0.8346685, 1.64934, 0, 0, 0, 1, 1,
1.77364, -0.5549522, 2.728895, 0, 0, 0, 1, 1,
1.795123, -0.1368747, 1.790755, 0, 0, 0, 1, 1,
1.797827, -0.8410458, 1.949203, 0, 0, 0, 1, 1,
1.812344, 1.903178, -0.8051545, 0, 0, 0, 1, 1,
1.901682, -0.9309166, 1.279471, 1, 1, 1, 1, 1,
1.930283, -0.3315738, 3.442127, 1, 1, 1, 1, 1,
1.960372, 0.1449648, 2.089543, 1, 1, 1, 1, 1,
1.968159, 0.3328771, 1.33184, 1, 1, 1, 1, 1,
1.986835, -0.5538378, 1.693253, 1, 1, 1, 1, 1,
1.988669, -0.4691682, 1.359507, 1, 1, 1, 1, 1,
2.000422, -0.6875051, 1.541783, 1, 1, 1, 1, 1,
2.054476, -0.2565416, 1.475736, 1, 1, 1, 1, 1,
2.055588, -1.901642, 1.530988, 1, 1, 1, 1, 1,
2.060346, -1.622303, 3.707752, 1, 1, 1, 1, 1,
2.088071, 0.2505147, 1.112835, 1, 1, 1, 1, 1,
2.120883, 1.964163, 1.770799, 1, 1, 1, 1, 1,
2.123383, -0.2561105, 1.31241, 1, 1, 1, 1, 1,
2.127769, -0.3676531, 2.289028, 1, 1, 1, 1, 1,
2.129714, -0.6428323, 2.373311, 1, 1, 1, 1, 1,
2.138259, 0.6853424, -0.01316848, 0, 0, 1, 1, 1,
2.142087, -0.8991552, 1.893559, 1, 0, 0, 1, 1,
2.20158, 0.8854066, 2.504965, 1, 0, 0, 1, 1,
2.209624, 0.537685, 1.515645, 1, 0, 0, 1, 1,
2.217727, -0.1427613, 1.270238, 1, 0, 0, 1, 1,
2.217931, 1.124618, 2.292037, 1, 0, 0, 1, 1,
2.249627, 1.261865, 1.030156, 0, 0, 0, 1, 1,
2.295453, 0.5797207, 3.394865, 0, 0, 0, 1, 1,
2.309391, 1.464979, 0.03050443, 0, 0, 0, 1, 1,
2.35608, -0.7112787, 3.045598, 0, 0, 0, 1, 1,
2.386039, -0.8584269, 3.115158, 0, 0, 0, 1, 1,
2.402227, -0.01871286, 1.946203, 0, 0, 0, 1, 1,
2.575385, -0.1317896, 1.212076, 0, 0, 0, 1, 1,
2.667307, 1.004667, 2.529788, 1, 1, 1, 1, 1,
2.700789, 0.4533275, 1.223, 1, 1, 1, 1, 1,
2.914377, -0.7604805, 2.006988, 1, 1, 1, 1, 1,
2.95945, -1.839324, 1.5902, 1, 1, 1, 1, 1,
3.073058, -1.025611, 2.63227, 1, 1, 1, 1, 1,
3.076545, -0.675383, 1.2714, 1, 1, 1, 1, 1,
3.079159, -1.476685, 1.093363, 1, 1, 1, 1, 1
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
var radius = 9.551028;
var distance = 33.54758;
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
mvMatrix.translate( 0.1273971, 0.3017137, 0.01024914 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.54758);
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
