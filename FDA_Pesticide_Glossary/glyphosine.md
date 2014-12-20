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
-2.828791, 0.8424168, -0.7534412, 1, 0, 0, 1,
-2.758143, 2.191118, -0.6890227, 1, 0.007843138, 0, 1,
-2.430175, -1.26122, -2.998232, 1, 0.01176471, 0, 1,
-2.419332, -0.7046305, -1.860185, 1, 0.01960784, 0, 1,
-2.406365, -0.09240086, -0.9440148, 1, 0.02352941, 0, 1,
-2.343105, -0.09440913, -2.110804, 1, 0.03137255, 0, 1,
-2.329173, 0.06635684, -0.7551003, 1, 0.03529412, 0, 1,
-2.308619, 0.1761698, -1.416648, 1, 0.04313726, 0, 1,
-2.253574, 0.2004467, -0.2356154, 1, 0.04705882, 0, 1,
-2.252765, -2.318584, -1.657695, 1, 0.05490196, 0, 1,
-2.229671, -0.9097455, -2.693887, 1, 0.05882353, 0, 1,
-2.186155, 1.707969, -1.267376, 1, 0.06666667, 0, 1,
-2.145038, -0.8386009, -1.571796, 1, 0.07058824, 0, 1,
-2.143361, 1.117133, -3.246763, 1, 0.07843138, 0, 1,
-2.045708, 0.1966507, -1.304771, 1, 0.08235294, 0, 1,
-2.042547, 0.27988, -2.415999, 1, 0.09019608, 0, 1,
-2.029859, -0.2121937, -1.040186, 1, 0.09411765, 0, 1,
-1.966702, 0.729975, -1.579607, 1, 0.1019608, 0, 1,
-1.965679, 0.552605, 1.018836, 1, 0.1098039, 0, 1,
-1.922443, 0.6685476, -1.138781, 1, 0.1137255, 0, 1,
-1.869453, 1.529597, -0.4305602, 1, 0.1215686, 0, 1,
-1.866074, 0.832891, -2.472907, 1, 0.1254902, 0, 1,
-1.863556, 0.05887552, -0.6446018, 1, 0.1333333, 0, 1,
-1.857593, -2.164176, -2.482935, 1, 0.1372549, 0, 1,
-1.855557, 0.9100747, -0.8508356, 1, 0.145098, 0, 1,
-1.85498, -1.078413, -3.253902, 1, 0.1490196, 0, 1,
-1.843254, -0.4144983, -2.801366, 1, 0.1568628, 0, 1,
-1.834216, 0.2165748, -3.383456, 1, 0.1607843, 0, 1,
-1.834105, 0.1465301, -1.52397, 1, 0.1686275, 0, 1,
-1.800729, -1.633154, -1.811292, 1, 0.172549, 0, 1,
-1.775989, -2.962954, -4.165668, 1, 0.1803922, 0, 1,
-1.762144, -1.558425, -1.732224, 1, 0.1843137, 0, 1,
-1.759226, -0.3274432, -0.4969558, 1, 0.1921569, 0, 1,
-1.753399, 0.8310471, 0.7845584, 1, 0.1960784, 0, 1,
-1.747743, 0.65027, -2.469443, 1, 0.2039216, 0, 1,
-1.74634, -1.6968, -3.279562, 1, 0.2117647, 0, 1,
-1.737132, -1.201928, -2.063156, 1, 0.2156863, 0, 1,
-1.730401, -1.664953, -1.723221, 1, 0.2235294, 0, 1,
-1.713942, -0.5511144, 0.8135515, 1, 0.227451, 0, 1,
-1.703153, 2.766162, -1.502501, 1, 0.2352941, 0, 1,
-1.70253, 0.8424596, -1.490542, 1, 0.2392157, 0, 1,
-1.693846, -0.7999611, 0.07634562, 1, 0.2470588, 0, 1,
-1.692297, 0.250357, -1.409508, 1, 0.2509804, 0, 1,
-1.688741, 0.8166075, -2.620034, 1, 0.2588235, 0, 1,
-1.686825, -0.5198435, -1.951851, 1, 0.2627451, 0, 1,
-1.676841, -1.076218, -3.332644, 1, 0.2705882, 0, 1,
-1.669318, -2.133361, -0.7116022, 1, 0.2745098, 0, 1,
-1.668495, -0.1881737, -2.40243, 1, 0.282353, 0, 1,
-1.666412, 0.4313178, -2.696301, 1, 0.2862745, 0, 1,
-1.652577, 0.5732252, -1.064608, 1, 0.2941177, 0, 1,
-1.646532, -0.1597248, -2.160075, 1, 0.3019608, 0, 1,
-1.640104, 0.06641522, -2.624166, 1, 0.3058824, 0, 1,
-1.636831, 0.2187785, -1.194902, 1, 0.3137255, 0, 1,
-1.635895, -0.05066589, -2.00131, 1, 0.3176471, 0, 1,
-1.625182, 0.9040398, 0.3834529, 1, 0.3254902, 0, 1,
-1.603634, 0.8377019, -2.936435, 1, 0.3294118, 0, 1,
-1.586784, 1.327931, 1.109052, 1, 0.3372549, 0, 1,
-1.570151, 0.9116918, -2.596561, 1, 0.3411765, 0, 1,
-1.557899, 0.01744758, -0.5895704, 1, 0.3490196, 0, 1,
-1.54494, 2.200802, 0.4290362, 1, 0.3529412, 0, 1,
-1.540994, 0.8860928, 0.405982, 1, 0.3607843, 0, 1,
-1.504795, -1.02805, -2.096344, 1, 0.3647059, 0, 1,
-1.485602, -1.279478, -1.467931, 1, 0.372549, 0, 1,
-1.484848, -0.6157486, -1.003383, 1, 0.3764706, 0, 1,
-1.469816, -0.5647519, -2.018053, 1, 0.3843137, 0, 1,
-1.463196, -1.905701, -2.559873, 1, 0.3882353, 0, 1,
-1.446963, -2.156576, -2.137047, 1, 0.3960784, 0, 1,
-1.44032, 0.2806378, -2.777158, 1, 0.4039216, 0, 1,
-1.434262, 0.6977913, -2.307146, 1, 0.4078431, 0, 1,
-1.425845, 0.4648676, -3.186208, 1, 0.4156863, 0, 1,
-1.425765, -0.9045492, -3.292386, 1, 0.4196078, 0, 1,
-1.415995, -0.315801, -3.208073, 1, 0.427451, 0, 1,
-1.410175, 0.1571906, -1.924293, 1, 0.4313726, 0, 1,
-1.408918, -0.8259065, -1.553707, 1, 0.4392157, 0, 1,
-1.403331, -0.7760407, -3.042457, 1, 0.4431373, 0, 1,
-1.401422, -0.6379456, -2.861513, 1, 0.4509804, 0, 1,
-1.399784, -0.1789929, 0.02640195, 1, 0.454902, 0, 1,
-1.390986, 0.6110294, -2.22546, 1, 0.4627451, 0, 1,
-1.388725, -0.2775961, -0.01140455, 1, 0.4666667, 0, 1,
-1.388379, 1.136753, -0.3421795, 1, 0.4745098, 0, 1,
-1.386513, -1.619886, -1.917407, 1, 0.4784314, 0, 1,
-1.379694, -1.320192, -2.718748, 1, 0.4862745, 0, 1,
-1.377744, -0.1203365, -0.1741469, 1, 0.4901961, 0, 1,
-1.377095, 0.3303982, -0.05376855, 1, 0.4980392, 0, 1,
-1.376438, -1.116782, -2.21129, 1, 0.5058824, 0, 1,
-1.368828, -1.226231, -2.524816, 1, 0.509804, 0, 1,
-1.364993, -0.4455571, -3.461968, 1, 0.5176471, 0, 1,
-1.361774, 0.4587918, -0.8097147, 1, 0.5215687, 0, 1,
-1.351982, 0.8458064, 0.27743, 1, 0.5294118, 0, 1,
-1.351968, -1.752536, -3.735209, 1, 0.5333334, 0, 1,
-1.350576, -0.4904971, -1.769257, 1, 0.5411765, 0, 1,
-1.342469, 0.439959, -0.2862393, 1, 0.5450981, 0, 1,
-1.340204, -0.03453947, -1.86709, 1, 0.5529412, 0, 1,
-1.332604, -0.4409134, -2.2038, 1, 0.5568628, 0, 1,
-1.306955, 0.1827755, -2.840884, 1, 0.5647059, 0, 1,
-1.305588, 0.02416072, -1.371493, 1, 0.5686275, 0, 1,
-1.292053, -1.046791, -2.613691, 1, 0.5764706, 0, 1,
-1.291413, -0.9890379, -2.336953, 1, 0.5803922, 0, 1,
-1.280515, -1.233876, -2.546624, 1, 0.5882353, 0, 1,
-1.270522, -0.5136531, 0.3551349, 1, 0.5921569, 0, 1,
-1.259347, 1.438622, -0.4791509, 1, 0.6, 0, 1,
-1.253243, 1.008199, -0.5074262, 1, 0.6078432, 0, 1,
-1.245609, -0.4451323, -0.1799356, 1, 0.6117647, 0, 1,
-1.219854, -1.33388, -1.803642, 1, 0.6196079, 0, 1,
-1.216564, -1.526012, -2.446994, 1, 0.6235294, 0, 1,
-1.212916, 1.193674, -1.308786, 1, 0.6313726, 0, 1,
-1.211566, -0.4798925, -3.209779, 1, 0.6352941, 0, 1,
-1.200405, 0.1240024, 0.2904271, 1, 0.6431373, 0, 1,
-1.198444, -1.202382, -0.9560013, 1, 0.6470588, 0, 1,
-1.19317, 1.180551, 0.5257779, 1, 0.654902, 0, 1,
-1.186693, 0.6385729, -0.3952519, 1, 0.6588235, 0, 1,
-1.182543, 0.9022931, -0.9878659, 1, 0.6666667, 0, 1,
-1.172985, -1.069989, -1.499628, 1, 0.6705883, 0, 1,
-1.17194, 0.3923692, -1.425765, 1, 0.6784314, 0, 1,
-1.165424, -0.3886507, -2.6191, 1, 0.682353, 0, 1,
-1.157732, -0.200683, -1.137928, 1, 0.6901961, 0, 1,
-1.14716, -0.5325568, -0.9449358, 1, 0.6941177, 0, 1,
-1.144122, 0.4739402, -0.9398586, 1, 0.7019608, 0, 1,
-1.143569, 0.06998868, 0.2465677, 1, 0.7098039, 0, 1,
-1.138633, -0.3383327, -1.814471, 1, 0.7137255, 0, 1,
-1.136219, -0.02084216, -1.504695, 1, 0.7215686, 0, 1,
-1.133459, -1.957431, -3.224549, 1, 0.7254902, 0, 1,
-1.128478, -0.7004856, -2.115855, 1, 0.7333333, 0, 1,
-1.112921, 0.02897024, 0.6156316, 1, 0.7372549, 0, 1,
-1.109054, -0.1252003, -0.7101324, 1, 0.7450981, 0, 1,
-1.097505, 1.643847, -1.66049, 1, 0.7490196, 0, 1,
-1.096152, -0.1434807, -2.460492, 1, 0.7568628, 0, 1,
-1.093231, 0.325116, 0.1620824, 1, 0.7607843, 0, 1,
-1.087815, 1.490222, -0.9450547, 1, 0.7686275, 0, 1,
-1.082309, -0.4877109, -1.808095, 1, 0.772549, 0, 1,
-1.070099, -2.50041, -2.278062, 1, 0.7803922, 0, 1,
-1.056099, 0.6629254, 0.3506632, 1, 0.7843137, 0, 1,
-1.052001, 0.3698405, -2.823663, 1, 0.7921569, 0, 1,
-1.05053, 0.4180995, -3.586113, 1, 0.7960784, 0, 1,
-1.050429, 0.3396522, -0.3057058, 1, 0.8039216, 0, 1,
-1.042326, -0.506183, -4.312152, 1, 0.8117647, 0, 1,
-1.041711, -1.319246, -1.629414, 1, 0.8156863, 0, 1,
-1.034451, 0.3114794, -0.3159262, 1, 0.8235294, 0, 1,
-1.028513, -0.6463324, -3.669253, 1, 0.827451, 0, 1,
-1.024955, 1.188959, 0.2625144, 1, 0.8352941, 0, 1,
-1.023221, 0.7620711, -2.740851, 1, 0.8392157, 0, 1,
-1.020236, -1.589347, -2.14987, 1, 0.8470588, 0, 1,
-1.01686, -0.6474018, -1.402904, 1, 0.8509804, 0, 1,
-1.013801, 1.1529, -2.244008, 1, 0.8588235, 0, 1,
-1.00974, 1.166382, 0.01370469, 1, 0.8627451, 0, 1,
-1.005713, 0.1370682, 0.1267259, 1, 0.8705882, 0, 1,
-1.003405, 0.05366524, -3.849824, 1, 0.8745098, 0, 1,
-0.9965955, -1.024269, -1.449589, 1, 0.8823529, 0, 1,
-0.9965754, 1.08437, -2.463286, 1, 0.8862745, 0, 1,
-0.9928821, -0.9248957, -2.599802, 1, 0.8941177, 0, 1,
-0.9922835, -0.5202652, -0.678657, 1, 0.8980392, 0, 1,
-0.9921291, -0.03227138, -1.552414, 1, 0.9058824, 0, 1,
-0.9762475, -0.5991855, -2.153373, 1, 0.9137255, 0, 1,
-0.9689973, -0.5768977, -2.361237, 1, 0.9176471, 0, 1,
-0.9662872, -0.441622, -2.213729, 1, 0.9254902, 0, 1,
-0.9647871, 0.768742, -0.8739945, 1, 0.9294118, 0, 1,
-0.9622877, 0.08424831, -2.613105, 1, 0.9372549, 0, 1,
-0.9592832, 1.148671, 0.1861623, 1, 0.9411765, 0, 1,
-0.9518624, 0.179797, -0.663132, 1, 0.9490196, 0, 1,
-0.9510825, -0.4365664, -1.980511, 1, 0.9529412, 0, 1,
-0.9507547, -0.8780791, -2.35927, 1, 0.9607843, 0, 1,
-0.9468262, 0.8459439, -0.3043592, 1, 0.9647059, 0, 1,
-0.9429179, 0.5846721, -0.3317886, 1, 0.972549, 0, 1,
-0.9405215, 0.4336916, -1.033958, 1, 0.9764706, 0, 1,
-0.9382299, -0.7575502, -2.413032, 1, 0.9843137, 0, 1,
-0.9323922, -0.8552469, -2.406433, 1, 0.9882353, 0, 1,
-0.9314876, -0.7702038, -0.6439994, 1, 0.9960784, 0, 1,
-0.9302602, 0.6369128, -0.1485898, 0.9960784, 1, 0, 1,
-0.9290656, -0.4748534, -1.27336, 0.9921569, 1, 0, 1,
-0.9271254, -1.281916, -0.9046162, 0.9843137, 1, 0, 1,
-0.9129835, 0.4613629, 0.01060797, 0.9803922, 1, 0, 1,
-0.9088623, -0.548927, -1.6813, 0.972549, 1, 0, 1,
-0.9059635, 0.3308508, -0.7429681, 0.9686275, 1, 0, 1,
-0.9056891, -0.4028606, -3.280644, 0.9607843, 1, 0, 1,
-0.9029043, 0.9301729, 0.4303118, 0.9568627, 1, 0, 1,
-0.8999417, -0.8073408, -0.3575433, 0.9490196, 1, 0, 1,
-0.8981928, 1.424159, 0.5868344, 0.945098, 1, 0, 1,
-0.8924627, 2.871295, -0.2434915, 0.9372549, 1, 0, 1,
-0.8908668, 0.1439263, -1.839276, 0.9333333, 1, 0, 1,
-0.8867037, 1.405953, -0.104655, 0.9254902, 1, 0, 1,
-0.8866646, -0.3136474, -1.257446, 0.9215686, 1, 0, 1,
-0.8841506, -1.171238, -3.41507, 0.9137255, 1, 0, 1,
-0.8828785, -1.772348, -1.485862, 0.9098039, 1, 0, 1,
-0.8808824, -1.203215, -3.930753, 0.9019608, 1, 0, 1,
-0.8700415, 0.1227157, -1.770476, 0.8941177, 1, 0, 1,
-0.8618971, -1.30591, -3.791686, 0.8901961, 1, 0, 1,
-0.8566792, 1.181419, -0.6082712, 0.8823529, 1, 0, 1,
-0.8548484, 1.370555, -3.122107, 0.8784314, 1, 0, 1,
-0.849884, 1.545506, -3.022421, 0.8705882, 1, 0, 1,
-0.8494114, -1.774422, -1.832756, 0.8666667, 1, 0, 1,
-0.8357422, 1.301369, -0.2218998, 0.8588235, 1, 0, 1,
-0.8327573, 0.515323, -2.910365, 0.854902, 1, 0, 1,
-0.8318152, 0.8754325, -1.755945, 0.8470588, 1, 0, 1,
-0.8310311, -0.7975266, -1.566135, 0.8431373, 1, 0, 1,
-0.8296186, -1.467408, -3.037654, 0.8352941, 1, 0, 1,
-0.8260392, -0.5869236, -3.964916, 0.8313726, 1, 0, 1,
-0.8177291, 0.1666104, -0.8665904, 0.8235294, 1, 0, 1,
-0.8035912, -1.035838, -1.848566, 0.8196079, 1, 0, 1,
-0.8012065, 0.2137454, -0.2044092, 0.8117647, 1, 0, 1,
-0.7988659, 1.606358, -2.433902, 0.8078431, 1, 0, 1,
-0.7984943, -1.056294, -2.949687, 0.8, 1, 0, 1,
-0.7957367, -1.175711, -2.664876, 0.7921569, 1, 0, 1,
-0.7947664, 0.005401941, -1.410489, 0.7882353, 1, 0, 1,
-0.7943805, 0.570121, 0.9859861, 0.7803922, 1, 0, 1,
-0.7912584, 0.2190498, -3.562236, 0.7764706, 1, 0, 1,
-0.7893614, -0.9811049, -1.735992, 0.7686275, 1, 0, 1,
-0.7861418, -0.4726972, -2.206282, 0.7647059, 1, 0, 1,
-0.78176, -1.475996, -2.889005, 0.7568628, 1, 0, 1,
-0.7673268, 0.1343396, -1.282932, 0.7529412, 1, 0, 1,
-0.767274, -0.2148421, -2.768195, 0.7450981, 1, 0, 1,
-0.764808, 0.7014732, -1.464143, 0.7411765, 1, 0, 1,
-0.7639751, -0.3316799, -1.876804, 0.7333333, 1, 0, 1,
-0.7636816, 0.5946067, 0.2100805, 0.7294118, 1, 0, 1,
-0.7634023, 0.08585291, -1.115443, 0.7215686, 1, 0, 1,
-0.7577488, -1.230589, -1.279408, 0.7176471, 1, 0, 1,
-0.7551246, 0.2109744, -0.6337783, 0.7098039, 1, 0, 1,
-0.7524804, -0.9418325, -2.405432, 0.7058824, 1, 0, 1,
-0.7436988, -0.7948991, -3.564789, 0.6980392, 1, 0, 1,
-0.741099, 0.9871495, -1.045105, 0.6901961, 1, 0, 1,
-0.7385246, 0.5622174, -0.8398142, 0.6862745, 1, 0, 1,
-0.7382156, -0.6316622, -1.863285, 0.6784314, 1, 0, 1,
-0.7345055, -0.6976349, -2.479577, 0.6745098, 1, 0, 1,
-0.7342003, -0.1473543, -3.432286, 0.6666667, 1, 0, 1,
-0.7315257, 1.363808, -0.2972672, 0.6627451, 1, 0, 1,
-0.722265, -0.5106773, -2.583106, 0.654902, 1, 0, 1,
-0.7204147, 2.393919, 1.840123, 0.6509804, 1, 0, 1,
-0.7099003, -1.065716, -2.875998, 0.6431373, 1, 0, 1,
-0.7037317, -0.8615808, -2.809225, 0.6392157, 1, 0, 1,
-0.7035303, -2.070745, -3.390541, 0.6313726, 1, 0, 1,
-0.6961998, -2.409853, -1.895422, 0.627451, 1, 0, 1,
-0.6945361, 0.1754658, -2.793296, 0.6196079, 1, 0, 1,
-0.6924853, -0.2883851, -0.2989455, 0.6156863, 1, 0, 1,
-0.6884389, 0.2665713, -1.234713, 0.6078432, 1, 0, 1,
-0.6872403, 1.373465, 0.3580569, 0.6039216, 1, 0, 1,
-0.6794791, -0.8562189, -2.695404, 0.5960785, 1, 0, 1,
-0.6782531, -1.046561, 0.4739464, 0.5882353, 1, 0, 1,
-0.6756858, 0.005483915, -2.042794, 0.5843138, 1, 0, 1,
-0.6750311, -1.5327, -2.804785, 0.5764706, 1, 0, 1,
-0.6698447, 0.6469529, -0.7851475, 0.572549, 1, 0, 1,
-0.6668358, 0.7111059, 0.1571437, 0.5647059, 1, 0, 1,
-0.6613533, -0.3711084, -0.1534863, 0.5607843, 1, 0, 1,
-0.6578934, 0.4321935, -0.3005244, 0.5529412, 1, 0, 1,
-0.6547009, 0.5111042, -1.968526, 0.5490196, 1, 0, 1,
-0.6532316, -0.7561059, -3.337276, 0.5411765, 1, 0, 1,
-0.6518717, 0.288542, -2.321593, 0.5372549, 1, 0, 1,
-0.647984, 0.8825906, -0.2156919, 0.5294118, 1, 0, 1,
-0.6409471, -2.002736, -2.465232, 0.5254902, 1, 0, 1,
-0.6212593, 1.555272, 0.240397, 0.5176471, 1, 0, 1,
-0.616804, 1.608225, -0.9617615, 0.5137255, 1, 0, 1,
-0.6145772, -2.027619, -3.723501, 0.5058824, 1, 0, 1,
-0.6137093, 0.253549, -3.086591, 0.5019608, 1, 0, 1,
-0.605417, 0.3461972, 0.5676793, 0.4941176, 1, 0, 1,
-0.6049348, 1.839539, -0.2886452, 0.4862745, 1, 0, 1,
-0.5999694, -1.256563, -3.145924, 0.4823529, 1, 0, 1,
-0.5986826, 0.3771786, -0.8217692, 0.4745098, 1, 0, 1,
-0.5974584, -0.2242264, -2.838855, 0.4705882, 1, 0, 1,
-0.5970867, 0.5634716, -1.657188, 0.4627451, 1, 0, 1,
-0.5955468, 0.3640941, -0.3042142, 0.4588235, 1, 0, 1,
-0.5952808, 1.091933, 0.3785836, 0.4509804, 1, 0, 1,
-0.5934812, 1.102214, -1.812808, 0.4470588, 1, 0, 1,
-0.5898699, -0.9909033, -1.96685, 0.4392157, 1, 0, 1,
-0.5886711, -0.3626739, -3.396374, 0.4352941, 1, 0, 1,
-0.5834529, -0.8919333, -3.727688, 0.427451, 1, 0, 1,
-0.5762913, -0.338886, -1.67656, 0.4235294, 1, 0, 1,
-0.5746651, -1.651929, -2.916583, 0.4156863, 1, 0, 1,
-0.5735673, 0.5295244, -1.023887, 0.4117647, 1, 0, 1,
-0.5706714, 0.945423, -0.5622012, 0.4039216, 1, 0, 1,
-0.5700697, -0.2307435, -0.7681735, 0.3960784, 1, 0, 1,
-0.567679, -1.254062, -2.710266, 0.3921569, 1, 0, 1,
-0.5670773, -0.8338611, -1.728848, 0.3843137, 1, 0, 1,
-0.5626989, 0.7916447, -0.9271794, 0.3803922, 1, 0, 1,
-0.5577897, -0.1156152, -1.365675, 0.372549, 1, 0, 1,
-0.5544828, -0.6744363, -1.375105, 0.3686275, 1, 0, 1,
-0.5541593, -0.04583548, -0.7180354, 0.3607843, 1, 0, 1,
-0.5532908, -2.264563, -3.221591, 0.3568628, 1, 0, 1,
-0.5526451, -1.787983, -3.942532, 0.3490196, 1, 0, 1,
-0.5523061, -1.352605, -3.222999, 0.345098, 1, 0, 1,
-0.5505295, 0.3052048, -0.7562619, 0.3372549, 1, 0, 1,
-0.5490522, 0.02238117, -3.187041, 0.3333333, 1, 0, 1,
-0.5473788, 0.4414823, -0.1953939, 0.3254902, 1, 0, 1,
-0.5412132, -0.5137547, -2.129284, 0.3215686, 1, 0, 1,
-0.5384037, -0.3256207, -0.5932307, 0.3137255, 1, 0, 1,
-0.5343143, 0.2072473, -1.408356, 0.3098039, 1, 0, 1,
-0.5274816, 0.3462753, -2.262706, 0.3019608, 1, 0, 1,
-0.5255877, 1.136322, 0.09296214, 0.2941177, 1, 0, 1,
-0.5185903, -0.9082, -2.740331, 0.2901961, 1, 0, 1,
-0.5171761, 0.3042195, -1.648255, 0.282353, 1, 0, 1,
-0.5042598, 0.3415478, 0.004931161, 0.2784314, 1, 0, 1,
-0.4980855, -0.1831285, -0.4256213, 0.2705882, 1, 0, 1,
-0.4949093, -1.857282, -3.527014, 0.2666667, 1, 0, 1,
-0.4946084, 0.2339373, -2.497747, 0.2588235, 1, 0, 1,
-0.4937067, -0.205275, -1.486631, 0.254902, 1, 0, 1,
-0.4886549, 0.1719815, -1.789585, 0.2470588, 1, 0, 1,
-0.4829234, 1.048236, -0.6750333, 0.2431373, 1, 0, 1,
-0.482539, -0.7478634, -1.781298, 0.2352941, 1, 0, 1,
-0.4815355, -0.681502, 1.037187, 0.2313726, 1, 0, 1,
-0.4794363, -0.3978262, -2.459632, 0.2235294, 1, 0, 1,
-0.4775577, 0.08109909, -2.25996, 0.2196078, 1, 0, 1,
-0.4724154, -0.5285825, -3.129477, 0.2117647, 1, 0, 1,
-0.4723039, 0.765782, -0.5347859, 0.2078431, 1, 0, 1,
-0.4700903, -0.3530317, -4.475271, 0.2, 1, 0, 1,
-0.4683242, -0.7386972, -0.75749, 0.1921569, 1, 0, 1,
-0.4654955, -1.362955, -3.605924, 0.1882353, 1, 0, 1,
-0.4476971, -0.7394351, -2.602247, 0.1803922, 1, 0, 1,
-0.4471033, 0.5852994, 0.5415868, 0.1764706, 1, 0, 1,
-0.4426517, -1.063024, -2.471394, 0.1686275, 1, 0, 1,
-0.4389692, 0.2111697, -0.701713, 0.1647059, 1, 0, 1,
-0.429465, 0.2339571, -1.490654, 0.1568628, 1, 0, 1,
-0.4288018, -0.6946046, -2.021886, 0.1529412, 1, 0, 1,
-0.4283859, 0.3219282, -3.326795, 0.145098, 1, 0, 1,
-0.4273773, -0.07352257, -0.8167004, 0.1411765, 1, 0, 1,
-0.42724, -0.2851055, -3.592139, 0.1333333, 1, 0, 1,
-0.4271299, -0.1196491, -1.775176, 0.1294118, 1, 0, 1,
-0.4271245, 1.246679, -0.4695085, 0.1215686, 1, 0, 1,
-0.4230768, -1.95644, -3.298402, 0.1176471, 1, 0, 1,
-0.4226024, -2.798876, -2.148299, 0.1098039, 1, 0, 1,
-0.4184028, -0.7015125, -4.1809, 0.1058824, 1, 0, 1,
-0.416538, 1.014515, -0.545194, 0.09803922, 1, 0, 1,
-0.4075561, 0.9651479, 0.9258643, 0.09019608, 1, 0, 1,
-0.4048585, -0.316674, -1.675045, 0.08627451, 1, 0, 1,
-0.4028339, 0.4987974, -0.3825258, 0.07843138, 1, 0, 1,
-0.4011695, 0.4989448, -0.912613, 0.07450981, 1, 0, 1,
-0.3999093, 0.3987354, 0.1310685, 0.06666667, 1, 0, 1,
-0.3942813, -1.633575, -2.591056, 0.0627451, 1, 0, 1,
-0.3935483, -2.598039, -2.175735, 0.05490196, 1, 0, 1,
-0.3915347, -0.8384421, -2.097289, 0.05098039, 1, 0, 1,
-0.386863, 1.672203, 1.822593, 0.04313726, 1, 0, 1,
-0.386358, 0.3015757, -2.565786, 0.03921569, 1, 0, 1,
-0.3821992, -0.9571437, -2.313102, 0.03137255, 1, 0, 1,
-0.3816796, -1.35656, -1.292974, 0.02745098, 1, 0, 1,
-0.3812765, -0.453966, -3.624409, 0.01960784, 1, 0, 1,
-0.3770782, -0.2570539, -3.794478, 0.01568628, 1, 0, 1,
-0.3751442, 2.215174, 1.959699, 0.007843138, 1, 0, 1,
-0.37467, -0.9669248, -3.721544, 0.003921569, 1, 0, 1,
-0.3746694, 1.971924, -0.9525474, 0, 1, 0.003921569, 1,
-0.3745005, -1.626429, -1.671935, 0, 1, 0.01176471, 1,
-0.3720218, 1.016827, -3.187427, 0, 1, 0.01568628, 1,
-0.3701851, -0.03350009, -0.4173302, 0, 1, 0.02352941, 1,
-0.3693387, -0.4605161, -2.274877, 0, 1, 0.02745098, 1,
-0.3673835, -0.1830785, -2.892462, 0, 1, 0.03529412, 1,
-0.3637528, 0.3663575, -1.42948, 0, 1, 0.03921569, 1,
-0.3621612, -0.411364, -3.30749, 0, 1, 0.04705882, 1,
-0.3585752, -1.160477, -2.030948, 0, 1, 0.05098039, 1,
-0.3581617, -1.330602, -1.724306, 0, 1, 0.05882353, 1,
-0.3572114, 1.288514, -0.1881314, 0, 1, 0.0627451, 1,
-0.3539177, 0.6577168, -1.004224, 0, 1, 0.07058824, 1,
-0.3534951, 0.5569292, -0.1327172, 0, 1, 0.07450981, 1,
-0.3505785, -0.2156666, -3.16059, 0, 1, 0.08235294, 1,
-0.349419, -0.3069657, -3.230938, 0, 1, 0.08627451, 1,
-0.34931, 0.2881503, -1.939491, 0, 1, 0.09411765, 1,
-0.3445447, 0.4934477, -0.1980872, 0, 1, 0.1019608, 1,
-0.3434193, 2.137317, 0.6822461, 0, 1, 0.1058824, 1,
-0.3339654, 0.03909786, -2.125346, 0, 1, 0.1137255, 1,
-0.3316491, 0.2746096, -2.762694, 0, 1, 0.1176471, 1,
-0.3309524, 1.789142, -0.6284038, 0, 1, 0.1254902, 1,
-0.3295744, -0.2445724, -2.059586, 0, 1, 0.1294118, 1,
-0.3272236, -1.475302, -3.205371, 0, 1, 0.1372549, 1,
-0.3196269, -1.115036, -2.365529, 0, 1, 0.1411765, 1,
-0.3172375, 0.03814654, -2.746602, 0, 1, 0.1490196, 1,
-0.3139139, 1.023667, 0.382887, 0, 1, 0.1529412, 1,
-0.3134096, -1.34055, -3.321557, 0, 1, 0.1607843, 1,
-0.3044134, -0.462066, -4.097182, 0, 1, 0.1647059, 1,
-0.3036355, 1.473611, 1.233518, 0, 1, 0.172549, 1,
-0.303633, 0.06510221, -2.495937, 0, 1, 0.1764706, 1,
-0.297423, -1.028529, -2.001355, 0, 1, 0.1843137, 1,
-0.2966408, -2.369497, -3.869654, 0, 1, 0.1882353, 1,
-0.28999, 0.257874, -1.660405, 0, 1, 0.1960784, 1,
-0.2886564, -1.916012, -3.799345, 0, 1, 0.2039216, 1,
-0.2863074, 0.2143736, 0.009280041, 0, 1, 0.2078431, 1,
-0.2841754, 0.478837, -0.5882863, 0, 1, 0.2156863, 1,
-0.2796305, 1.077793, -0.02717848, 0, 1, 0.2196078, 1,
-0.2789757, 0.4097764, -0.7976948, 0, 1, 0.227451, 1,
-0.276827, -1.587428, -4.12188, 0, 1, 0.2313726, 1,
-0.2735172, -0.6755327, -3.926963, 0, 1, 0.2392157, 1,
-0.271155, 0.04003324, -1.871672, 0, 1, 0.2431373, 1,
-0.2699693, -0.3098201, -2.795466, 0, 1, 0.2509804, 1,
-0.2698949, -1.60403, -3.719359, 0, 1, 0.254902, 1,
-0.269172, 0.01162871, -2.069722, 0, 1, 0.2627451, 1,
-0.2676125, 1.63467, -2.015293, 0, 1, 0.2666667, 1,
-0.2652515, 0.1264594, -1.196942, 0, 1, 0.2745098, 1,
-0.2651847, 1.595566, 0.1198055, 0, 1, 0.2784314, 1,
-0.2645283, 1.296615, -0.2160087, 0, 1, 0.2862745, 1,
-0.2596827, -0.4129101, -4.111101, 0, 1, 0.2901961, 1,
-0.2579541, 0.2665572, 0.4278883, 0, 1, 0.2980392, 1,
-0.2484625, 1.171681, -0.8440678, 0, 1, 0.3058824, 1,
-0.2455436, -1.105778, -3.841911, 0, 1, 0.3098039, 1,
-0.2438814, -0.2738972, -2.97299, 0, 1, 0.3176471, 1,
-0.2420127, -0.716567, -0.9342628, 0, 1, 0.3215686, 1,
-0.2406265, -1.825362, -4.238457, 0, 1, 0.3294118, 1,
-0.2314578, -2.047601, -2.194732, 0, 1, 0.3333333, 1,
-0.2314388, 1.433718, 1.314253, 0, 1, 0.3411765, 1,
-0.2274488, -0.3346576, -2.258929, 0, 1, 0.345098, 1,
-0.2273274, -0.3988967, -1.90803, 0, 1, 0.3529412, 1,
-0.2261128, -0.6012661, -3.340504, 0, 1, 0.3568628, 1,
-0.2255821, 0.3308696, 0.4618154, 0, 1, 0.3647059, 1,
-0.2253551, 0.569714, -1.526218, 0, 1, 0.3686275, 1,
-0.2245136, -0.4644728, -1.086497, 0, 1, 0.3764706, 1,
-0.218994, -0.2781608, -2.38284, 0, 1, 0.3803922, 1,
-0.2140571, 0.3830188, -0.0582549, 0, 1, 0.3882353, 1,
-0.2119544, -1.994812, -0.4192066, 0, 1, 0.3921569, 1,
-0.2109707, 0.1644617, -0.6712229, 0, 1, 0.4, 1,
-0.2101077, 1.965271, -0.3136845, 0, 1, 0.4078431, 1,
-0.2022518, 0.8270808, 0.6677673, 0, 1, 0.4117647, 1,
-0.2002762, 0.4377924, -0.4986764, 0, 1, 0.4196078, 1,
-0.1972741, 0.1452857, -2.195082, 0, 1, 0.4235294, 1,
-0.1956394, -0.3441596, -3.018782, 0, 1, 0.4313726, 1,
-0.192066, 0.5367167, -0.4057149, 0, 1, 0.4352941, 1,
-0.1867597, -1.569329, -2.791971, 0, 1, 0.4431373, 1,
-0.1807079, 0.5960519, 0.6300624, 0, 1, 0.4470588, 1,
-0.178442, 0.4948128, -1.592378, 0, 1, 0.454902, 1,
-0.1777537, 0.7466574, -1.143399, 0, 1, 0.4588235, 1,
-0.1755092, 0.4101679, -2.016768, 0, 1, 0.4666667, 1,
-0.1751929, 0.6911638, -0.4942057, 0, 1, 0.4705882, 1,
-0.1576252, 0.7453091, -0.08366506, 0, 1, 0.4784314, 1,
-0.1565295, -0.1572603, -2.196508, 0, 1, 0.4823529, 1,
-0.156386, -1.712693, -2.802736, 0, 1, 0.4901961, 1,
-0.1548859, 0.07366975, -0.6783667, 0, 1, 0.4941176, 1,
-0.1539068, 0.5696529, -0.4055497, 0, 1, 0.5019608, 1,
-0.1530901, 0.03186344, -1.23844, 0, 1, 0.509804, 1,
-0.1517516, -0.4301356, -1.57184, 0, 1, 0.5137255, 1,
-0.1494526, -1.775928, -2.462878, 0, 1, 0.5215687, 1,
-0.1486366, -1.13746, -3.55473, 0, 1, 0.5254902, 1,
-0.1469329, 0.2677345, -0.2503281, 0, 1, 0.5333334, 1,
-0.1444233, 0.06779386, -1.18302, 0, 1, 0.5372549, 1,
-0.1427244, 0.5677962, -0.9473275, 0, 1, 0.5450981, 1,
-0.1417568, -0.7543597, -4.116427, 0, 1, 0.5490196, 1,
-0.1382431, 1.616556, -0.3342661, 0, 1, 0.5568628, 1,
-0.1359826, 0.4045563, -0.8205525, 0, 1, 0.5607843, 1,
-0.1339116, -0.5848422, -0.9800063, 0, 1, 0.5686275, 1,
-0.1289086, -0.9224399, -3.699345, 0, 1, 0.572549, 1,
-0.1240944, 0.1777787, -0.7342449, 0, 1, 0.5803922, 1,
-0.1228367, 0.634289, 0.3282481, 0, 1, 0.5843138, 1,
-0.1196511, 0.8218103, -1.506039, 0, 1, 0.5921569, 1,
-0.1180048, -0.5685371, -2.148884, 0, 1, 0.5960785, 1,
-0.1131734, -2.032988, -4.73783, 0, 1, 0.6039216, 1,
-0.1130521, -1.042299, -3.009574, 0, 1, 0.6117647, 1,
-0.1119266, 1.007334, -1.276379, 0, 1, 0.6156863, 1,
-0.1109447, 2.324821, 0.1608081, 0, 1, 0.6235294, 1,
-0.1108202, 0.4314456, -0.9248899, 0, 1, 0.627451, 1,
-0.1106374, -0.4549949, -2.520292, 0, 1, 0.6352941, 1,
-0.10153, -0.8028441, -2.829115, 0, 1, 0.6392157, 1,
-0.09651002, -0.6555122, -3.104359, 0, 1, 0.6470588, 1,
-0.09491586, 1.414147, 0.5101686, 0, 1, 0.6509804, 1,
-0.09197758, -0.4429286, -3.374255, 0, 1, 0.6588235, 1,
-0.08794416, -0.1009826, -2.819075, 0, 1, 0.6627451, 1,
-0.08338594, -2.147704, -3.098753, 0, 1, 0.6705883, 1,
-0.08214708, -0.3249711, -3.460072, 0, 1, 0.6745098, 1,
-0.08214464, 0.3796298, 0.9153866, 0, 1, 0.682353, 1,
-0.07851388, 1.118642, -1.205951, 0, 1, 0.6862745, 1,
-0.07689165, 0.3579285, 0.939001, 0, 1, 0.6941177, 1,
-0.07435404, -1.614662, -3.670933, 0, 1, 0.7019608, 1,
-0.07434883, -0.4931884, -5.085167, 0, 1, 0.7058824, 1,
-0.06908476, -0.6058564, -2.021489, 0, 1, 0.7137255, 1,
-0.06881166, 0.3396977, 0.4212068, 0, 1, 0.7176471, 1,
-0.06734385, -1.591727, -2.789798, 0, 1, 0.7254902, 1,
-0.06392504, -1.375554, -2.506517, 0, 1, 0.7294118, 1,
-0.06148095, 0.148511, 0.6095752, 0, 1, 0.7372549, 1,
-0.0600214, 0.1249226, 0.1834755, 0, 1, 0.7411765, 1,
-0.0562365, 0.7270889, -0.4305924, 0, 1, 0.7490196, 1,
-0.05191481, 0.9789451, -1.231893, 0, 1, 0.7529412, 1,
-0.05090729, -0.6010941, -2.064722, 0, 1, 0.7607843, 1,
-0.04853397, -2.531019, -3.477297, 0, 1, 0.7647059, 1,
-0.04297789, 1.008029, -0.3687863, 0, 1, 0.772549, 1,
-0.04232078, 0.486856, -0.01013847, 0, 1, 0.7764706, 1,
-0.04087942, 0.2873334, 1.10648, 0, 1, 0.7843137, 1,
-0.03959707, -0.5868132, -2.401354, 0, 1, 0.7882353, 1,
-0.03883048, 0.9074413, 0.1274317, 0, 1, 0.7960784, 1,
-0.03622682, 1.64521, -0.6602976, 0, 1, 0.8039216, 1,
-0.03558687, 1.34161, -1.893213, 0, 1, 0.8078431, 1,
-0.03497155, 0.7292767, -1.398002, 0, 1, 0.8156863, 1,
-0.02746561, 0.5975391, -0.5834933, 0, 1, 0.8196079, 1,
-0.02658124, 0.9534796, 0.4065414, 0, 1, 0.827451, 1,
-0.02197488, 0.9585423, 0.6330992, 0, 1, 0.8313726, 1,
-0.01677097, 1.213009, -0.4508877, 0, 1, 0.8392157, 1,
-0.01476492, -0.4424113, -3.503836, 0, 1, 0.8431373, 1,
-0.005200345, 0.2385995, 0.5722381, 0, 1, 0.8509804, 1,
-0.003810862, -0.5026017, -2.469203, 0, 1, 0.854902, 1,
-0.002269833, -0.1219714, -4.458738, 0, 1, 0.8627451, 1,
0.003461024, 0.2736633, -0.1281624, 0, 1, 0.8666667, 1,
0.004863537, 0.07970125, -0.1003299, 0, 1, 0.8745098, 1,
0.005007061, -1.296487, 4.927409, 0, 1, 0.8784314, 1,
0.007777532, -0.4475691, 3.916422, 0, 1, 0.8862745, 1,
0.01013655, 0.5305732, -1.611632, 0, 1, 0.8901961, 1,
0.01213885, 0.03327346, 1.633254, 0, 1, 0.8980392, 1,
0.01408987, -0.7690499, 3.221479, 0, 1, 0.9058824, 1,
0.01921577, 0.3549833, -0.01688046, 0, 1, 0.9098039, 1,
0.0209085, -0.4039806, 2.07744, 0, 1, 0.9176471, 1,
0.02194649, -0.3485762, 3.293097, 0, 1, 0.9215686, 1,
0.02221496, -0.09938044, 2.227523, 0, 1, 0.9294118, 1,
0.0239404, 0.4437992, -1.40158, 0, 1, 0.9333333, 1,
0.02504546, -0.1227137, 2.062565, 0, 1, 0.9411765, 1,
0.02673797, -0.05634381, 1.033745, 0, 1, 0.945098, 1,
0.03121942, -0.3773567, 2.853029, 0, 1, 0.9529412, 1,
0.03441778, 0.7130498, 1.876384, 0, 1, 0.9568627, 1,
0.03659401, 0.24996, 0.9831275, 0, 1, 0.9647059, 1,
0.04055124, 0.9062062, 0.2894156, 0, 1, 0.9686275, 1,
0.04485646, -2.304591, 3.40307, 0, 1, 0.9764706, 1,
0.04489447, -0.006409365, 0.9218662, 0, 1, 0.9803922, 1,
0.04524498, 0.5638596, 1.231009, 0, 1, 0.9882353, 1,
0.05042727, -0.5818859, 1.081663, 0, 1, 0.9921569, 1,
0.05105869, 2.107177, 1.214739, 0, 1, 1, 1,
0.05181673, 0.5853957, -0.912623, 0, 0.9921569, 1, 1,
0.05251971, -0.1472926, 1.013481, 0, 0.9882353, 1, 1,
0.05323692, -1.392931, 2.148454, 0, 0.9803922, 1, 1,
0.05631697, 0.04662514, 1.172537, 0, 0.9764706, 1, 1,
0.05754569, -0.04681709, 1.688521, 0, 0.9686275, 1, 1,
0.06061449, 0.1994754, -0.8296426, 0, 0.9647059, 1, 1,
0.06186787, -0.3289787, 2.949173, 0, 0.9568627, 1, 1,
0.06501693, -0.06230941, 1.535714, 0, 0.9529412, 1, 1,
0.06760851, -0.1328788, 0.9824882, 0, 0.945098, 1, 1,
0.06906123, 0.3434074, -0.6943806, 0, 0.9411765, 1, 1,
0.07002158, -1.148615, 3.32996, 0, 0.9333333, 1, 1,
0.07381872, -0.3082764, 1.862308, 0, 0.9294118, 1, 1,
0.07972612, -0.8772902, 3.015201, 0, 0.9215686, 1, 1,
0.08164608, 0.3507519, 0.5833234, 0, 0.9176471, 1, 1,
0.08547109, 2.996878, 0.7593714, 0, 0.9098039, 1, 1,
0.0863352, 0.6726751, -1.312217, 0, 0.9058824, 1, 1,
0.08899169, -0.7695049, 3.118369, 0, 0.8980392, 1, 1,
0.09159836, 1.497356, 1.224971, 0, 0.8901961, 1, 1,
0.09346399, 1.478222, 0.4739023, 0, 0.8862745, 1, 1,
0.09523129, 1.482369, -0.7865825, 0, 0.8784314, 1, 1,
0.0957344, -1.210935, 4.895777, 0, 0.8745098, 1, 1,
0.09585474, 0.9092926, 0.1231884, 0, 0.8666667, 1, 1,
0.09654669, -1.287817, 3.399416, 0, 0.8627451, 1, 1,
0.09841873, -0.8416577, 4.015602, 0, 0.854902, 1, 1,
0.1055401, -0.9186452, 4.015072, 0, 0.8509804, 1, 1,
0.1064557, 0.6001055, -1.165304, 0, 0.8431373, 1, 1,
0.1100474, 1.123731, 2.679054, 0, 0.8392157, 1, 1,
0.1123586, 0.4026866, 2.408676, 0, 0.8313726, 1, 1,
0.1125559, 0.758374, 1.218591, 0, 0.827451, 1, 1,
0.1160267, -2.605172, 3.397309, 0, 0.8196079, 1, 1,
0.1194706, -0.1181856, 2.149782, 0, 0.8156863, 1, 1,
0.120112, 0.2349273, 0.6358343, 0, 0.8078431, 1, 1,
0.1223741, -0.5873136, 2.685601, 0, 0.8039216, 1, 1,
0.1267973, -0.6488621, 4.342804, 0, 0.7960784, 1, 1,
0.1274281, -0.7986716, 1.483693, 0, 0.7882353, 1, 1,
0.1277329, -0.9954621, 4.152164, 0, 0.7843137, 1, 1,
0.1283704, 0.01660145, 1.631037, 0, 0.7764706, 1, 1,
0.130784, 1.121282, 2.486068, 0, 0.772549, 1, 1,
0.1389516, 0.4156865, -0.52106, 0, 0.7647059, 1, 1,
0.1410141, 0.6242902, 0.2238371, 0, 0.7607843, 1, 1,
0.1420339, 0.8122529, 1.619293, 0, 0.7529412, 1, 1,
0.1435457, 0.7014438, 1.284387, 0, 0.7490196, 1, 1,
0.1437067, -0.6581539, 2.134921, 0, 0.7411765, 1, 1,
0.1456293, -0.0007132112, 0.267533, 0, 0.7372549, 1, 1,
0.1460321, -0.3060695, 1.647489, 0, 0.7294118, 1, 1,
0.1478748, -0.2504634, 3.093817, 0, 0.7254902, 1, 1,
0.1513073, 0.425204, -0.3461682, 0, 0.7176471, 1, 1,
0.1577786, 0.9019533, -1.059897, 0, 0.7137255, 1, 1,
0.1586188, 2.328892, 0.03683558, 0, 0.7058824, 1, 1,
0.1599252, -2.097026, 2.852888, 0, 0.6980392, 1, 1,
0.1615695, -0.04392158, 1.706728, 0, 0.6941177, 1, 1,
0.1627831, -1.886835, 1.491709, 0, 0.6862745, 1, 1,
0.1665378, 1.271254, 1.00531, 0, 0.682353, 1, 1,
0.1709582, 0.6775336, -0.9228376, 0, 0.6745098, 1, 1,
0.1729096, -0.9784787, 2.538076, 0, 0.6705883, 1, 1,
0.1749819, 1.030761, 0.2118124, 0, 0.6627451, 1, 1,
0.1786737, -0.8100454, 3.040025, 0, 0.6588235, 1, 1,
0.1827424, 2.965359, -1.075023, 0, 0.6509804, 1, 1,
0.1891767, -0.3532298, 3.217448, 0, 0.6470588, 1, 1,
0.1905103, -0.1904873, 3.472997, 0, 0.6392157, 1, 1,
0.1912282, -1.296403, 2.812002, 0, 0.6352941, 1, 1,
0.193248, 0.1504249, 1.742743, 0, 0.627451, 1, 1,
0.1945223, -1.84492, 2.697028, 0, 0.6235294, 1, 1,
0.1986124, -1.185701, 3.293155, 0, 0.6156863, 1, 1,
0.2120049, 1.049664, -1.017544, 0, 0.6117647, 1, 1,
0.2132968, 0.03083207, 1.610531, 0, 0.6039216, 1, 1,
0.2145695, -1.048721, 2.821041, 0, 0.5960785, 1, 1,
0.2218771, 1.899363, 0.7585948, 0, 0.5921569, 1, 1,
0.2235592, 1.075035, 0.3448271, 0, 0.5843138, 1, 1,
0.2246119, -1.103994, 1.996942, 0, 0.5803922, 1, 1,
0.225803, -0.2964189, 2.662498, 0, 0.572549, 1, 1,
0.2378756, -0.9973522, 2.560247, 0, 0.5686275, 1, 1,
0.2386633, -0.4502499, 1.294767, 0, 0.5607843, 1, 1,
0.2469542, 0.280285, -0.8248038, 0, 0.5568628, 1, 1,
0.2540996, -0.4286881, 2.320742, 0, 0.5490196, 1, 1,
0.2545921, -0.8837166, 3.424597, 0, 0.5450981, 1, 1,
0.2552681, -1.804902, 4.235679, 0, 0.5372549, 1, 1,
0.2552693, -1.668489, 3.026264, 0, 0.5333334, 1, 1,
0.2564567, 0.04927864, 3.539881, 0, 0.5254902, 1, 1,
0.2591912, 1.296468, -2.147156, 0, 0.5215687, 1, 1,
0.2599808, -0.4746443, 1.73824, 0, 0.5137255, 1, 1,
0.263115, -0.8986238, 2.914352, 0, 0.509804, 1, 1,
0.2659405, 0.6810762, -0.1060568, 0, 0.5019608, 1, 1,
0.2663593, 1.695673, 0.8866463, 0, 0.4941176, 1, 1,
0.2736295, 1.046229, -2.307845, 0, 0.4901961, 1, 1,
0.2745804, -0.4307815, 3.783966, 0, 0.4823529, 1, 1,
0.2750272, -0.4502035, 3.572128, 0, 0.4784314, 1, 1,
0.2776393, -1.808811, 2.32079, 0, 0.4705882, 1, 1,
0.280651, -2.023555, 3.686278, 0, 0.4666667, 1, 1,
0.2815198, -1.629957, 2.527863, 0, 0.4588235, 1, 1,
0.2854104, 1.743165, 0.649268, 0, 0.454902, 1, 1,
0.2907111, -1.136552, 3.13621, 0, 0.4470588, 1, 1,
0.2962394, -0.1953456, 0.2982418, 0, 0.4431373, 1, 1,
0.2990302, 0.3855802, 0.2561653, 0, 0.4352941, 1, 1,
0.2994155, -1.036353, 2.572491, 0, 0.4313726, 1, 1,
0.3002553, -0.0610209, 1.689521, 0, 0.4235294, 1, 1,
0.3024527, -0.4964248, 2.201864, 0, 0.4196078, 1, 1,
0.3037843, -0.07557729, -0.1831343, 0, 0.4117647, 1, 1,
0.3043121, 0.4706043, 0.6776147, 0, 0.4078431, 1, 1,
0.3061284, 1.284291, 1.740741, 0, 0.4, 1, 1,
0.3072695, 1.610679, -0.2985049, 0, 0.3921569, 1, 1,
0.3085603, -0.1131864, 0.2087857, 0, 0.3882353, 1, 1,
0.3148104, 0.3239216, -0.1001616, 0, 0.3803922, 1, 1,
0.3164491, 1.054866, 0.1530926, 0, 0.3764706, 1, 1,
0.3227099, -0.9396376, 1.336244, 0, 0.3686275, 1, 1,
0.3228496, -1.201334, 0.5159693, 0, 0.3647059, 1, 1,
0.3257822, -0.4478589, 4.139489, 0, 0.3568628, 1, 1,
0.3282528, -0.6185924, 2.151779, 0, 0.3529412, 1, 1,
0.3319416, -0.1079452, 1.069434, 0, 0.345098, 1, 1,
0.3335411, -2.439084, 2.343327, 0, 0.3411765, 1, 1,
0.339449, 0.9590989, -0.3244811, 0, 0.3333333, 1, 1,
0.3413858, 0.8861356, 1.747251, 0, 0.3294118, 1, 1,
0.3418178, 1.316645, -2.399526, 0, 0.3215686, 1, 1,
0.3430433, -1.346056, 3.001935, 0, 0.3176471, 1, 1,
0.3437194, -0.04711463, 0.5271544, 0, 0.3098039, 1, 1,
0.3445598, 0.1479989, -0.2852279, 0, 0.3058824, 1, 1,
0.3447467, -1.081832, 3.2167, 0, 0.2980392, 1, 1,
0.3476806, 0.8980024, 0.9216238, 0, 0.2901961, 1, 1,
0.350211, -0.4962319, 1.433848, 0, 0.2862745, 1, 1,
0.3521831, 0.3343961, 1.646083, 0, 0.2784314, 1, 1,
0.3612261, -0.3223126, 1.271382, 0, 0.2745098, 1, 1,
0.3633486, -1.894924, 4.514225, 0, 0.2666667, 1, 1,
0.3636416, -1.522623, 3.108441, 0, 0.2627451, 1, 1,
0.3682633, 1.152831, -0.2315824, 0, 0.254902, 1, 1,
0.3776685, -2.049594, 2.618, 0, 0.2509804, 1, 1,
0.3791043, 1.146313, 1.041697, 0, 0.2431373, 1, 1,
0.3801392, -0.05669257, 0.8594113, 0, 0.2392157, 1, 1,
0.3805134, 0.5535614, 0.4676246, 0, 0.2313726, 1, 1,
0.3813936, -2.196669, 4.677754, 0, 0.227451, 1, 1,
0.3896237, -0.4474422, 2.423004, 0, 0.2196078, 1, 1,
0.3899442, 0.8603698, -0.1358636, 0, 0.2156863, 1, 1,
0.3951886, -0.4116336, 1.652299, 0, 0.2078431, 1, 1,
0.395447, -0.9046687, 2.161592, 0, 0.2039216, 1, 1,
0.3989088, 1.538817, 0.3030106, 0, 0.1960784, 1, 1,
0.3993767, 1.878967, -1.332669, 0, 0.1882353, 1, 1,
0.4047564, 0.1212109, 2.774907, 0, 0.1843137, 1, 1,
0.4096754, -0.5369791, 3.218033, 0, 0.1764706, 1, 1,
0.413604, -1.514083, 1.741249, 0, 0.172549, 1, 1,
0.4189907, -1.637565, 5.910135, 0, 0.1647059, 1, 1,
0.4211944, 2.757974, -0.7278186, 0, 0.1607843, 1, 1,
0.4236321, 0.3176424, 0.2939221, 0, 0.1529412, 1, 1,
0.4260901, 0.2651314, 0.5121332, 0, 0.1490196, 1, 1,
0.426148, -1.280702, 3.662318, 0, 0.1411765, 1, 1,
0.42971, 0.3461306, 0.4907625, 0, 0.1372549, 1, 1,
0.4314449, 1.320812, 0.5246812, 0, 0.1294118, 1, 1,
0.4316362, -1.799354, 1.389735, 0, 0.1254902, 1, 1,
0.4396298, -0.2493264, 3.726277, 0, 0.1176471, 1, 1,
0.4402452, 0.7881459, 1.723236, 0, 0.1137255, 1, 1,
0.4410808, 0.1741183, 2.13987, 0, 0.1058824, 1, 1,
0.451759, 1.03396, -0.6996581, 0, 0.09803922, 1, 1,
0.4527662, -0.5058427, 1.416264, 0, 0.09411765, 1, 1,
0.4528407, -0.5630062, 3.511796, 0, 0.08627451, 1, 1,
0.4542486, -1.40712, 1.58645, 0, 0.08235294, 1, 1,
0.4673145, 1.157713, 1.339972, 0, 0.07450981, 1, 1,
0.4693316, 0.5476041, 0.2722519, 0, 0.07058824, 1, 1,
0.4698537, 0.9664515, -0.576305, 0, 0.0627451, 1, 1,
0.4737231, 0.3804599, 0.4944916, 0, 0.05882353, 1, 1,
0.4811801, -0.09478956, 2.194732, 0, 0.05098039, 1, 1,
0.4826225, -0.1784775, 1.118349, 0, 0.04705882, 1, 1,
0.4832084, 2.076341, -0.9071097, 0, 0.03921569, 1, 1,
0.4836262, -0.307803, 1.502057, 0, 0.03529412, 1, 1,
0.4876857, -1.016166, 2.939929, 0, 0.02745098, 1, 1,
0.4891442, 1.173593, 0.5236276, 0, 0.02352941, 1, 1,
0.4900528, 0.7842973, 2.576187, 0, 0.01568628, 1, 1,
0.4903328, -2.736399, 1.708208, 0, 0.01176471, 1, 1,
0.4920244, 0.7160777, -0.3127111, 0, 0.003921569, 1, 1,
0.4955392, 0.9805964, 1.043268, 0.003921569, 0, 1, 1,
0.4955742, 1.940818, 2.545077, 0.007843138, 0, 1, 1,
0.4961554, 0.003044448, 2.035477, 0.01568628, 0, 1, 1,
0.4978867, 0.2873292, 0.5251182, 0.01960784, 0, 1, 1,
0.5006357, 1.741288, -0.1871679, 0.02745098, 0, 1, 1,
0.5018868, 1.626652, -0.2516731, 0.03137255, 0, 1, 1,
0.5031458, -0.1148756, 1.345703, 0.03921569, 0, 1, 1,
0.5055926, 0.5966173, 0.7579578, 0.04313726, 0, 1, 1,
0.5094095, 0.4020554, 0.009177671, 0.05098039, 0, 1, 1,
0.5135096, -1.372841, 2.892673, 0.05490196, 0, 1, 1,
0.517064, -1.130611, 2.675133, 0.0627451, 0, 1, 1,
0.5177507, -2.27899, 2.749344, 0.06666667, 0, 1, 1,
0.5215207, -1.115414, 3.798203, 0.07450981, 0, 1, 1,
0.5231762, -0.4325495, 1.507865, 0.07843138, 0, 1, 1,
0.526737, -0.02032815, 0.6738055, 0.08627451, 0, 1, 1,
0.5272639, -0.2946134, 1.476725, 0.09019608, 0, 1, 1,
0.5280704, -1.170037, 1.827604, 0.09803922, 0, 1, 1,
0.5357282, 0.9997641, 1.237935, 0.1058824, 0, 1, 1,
0.5390806, 0.5401855, 0.06373525, 0.1098039, 0, 1, 1,
0.5395176, -0.9306884, 2.256485, 0.1176471, 0, 1, 1,
0.5414307, -1.833455, 3.246854, 0.1215686, 0, 1, 1,
0.5466666, -0.3887208, 4.378242, 0.1294118, 0, 1, 1,
0.5467807, -0.5833659, 2.908187, 0.1333333, 0, 1, 1,
0.5474492, -0.6083021, 1.669501, 0.1411765, 0, 1, 1,
0.5501397, -0.1884616, 1.492968, 0.145098, 0, 1, 1,
0.5502826, 0.7993983, -0.3155882, 0.1529412, 0, 1, 1,
0.555742, -0.06844159, 2.953058, 0.1568628, 0, 1, 1,
0.5577589, -1.088424, 2.799443, 0.1647059, 0, 1, 1,
0.5613559, -0.01523258, 2.616015, 0.1686275, 0, 1, 1,
0.5627009, -0.7396278, 3.532511, 0.1764706, 0, 1, 1,
0.5637506, 0.3233411, 0.9572411, 0.1803922, 0, 1, 1,
0.5676113, -1.162916, 4.235286, 0.1882353, 0, 1, 1,
0.568031, 0.739871, 1.281325, 0.1921569, 0, 1, 1,
0.5688286, 1.269026, -0.7288917, 0.2, 0, 1, 1,
0.5723546, -0.9985543, 1.794143, 0.2078431, 0, 1, 1,
0.5734729, -2.317966, 3.90735, 0.2117647, 0, 1, 1,
0.5758816, 0.8220459, 3.42965, 0.2196078, 0, 1, 1,
0.5787241, -0.8087314, 3.419971, 0.2235294, 0, 1, 1,
0.5824883, -0.7006142, 2.805407, 0.2313726, 0, 1, 1,
0.5905207, 1.734131, -0.123894, 0.2352941, 0, 1, 1,
0.5906584, 0.1725158, -0.316628, 0.2431373, 0, 1, 1,
0.5919614, 1.482933, 0.04404477, 0.2470588, 0, 1, 1,
0.5946326, 0.15639, 0.7622693, 0.254902, 0, 1, 1,
0.5970168, -1.299803, 3.639247, 0.2588235, 0, 1, 1,
0.5987852, 0.3712969, 3.264763, 0.2666667, 0, 1, 1,
0.5997421, -0.1974029, 3.677496, 0.2705882, 0, 1, 1,
0.599749, -0.2842249, 2.331182, 0.2784314, 0, 1, 1,
0.6071391, 1.28331, -1.668633, 0.282353, 0, 1, 1,
0.6133987, -0.1408972, 0.9190014, 0.2901961, 0, 1, 1,
0.6157837, -1.459317, -0.1821633, 0.2941177, 0, 1, 1,
0.6161602, -0.3312415, 1.48365, 0.3019608, 0, 1, 1,
0.6171347, -1.301252, 3.52492, 0.3098039, 0, 1, 1,
0.6197367, -0.7484391, 1.767231, 0.3137255, 0, 1, 1,
0.6209155, 0.9019825, -0.04547595, 0.3215686, 0, 1, 1,
0.6216183, 0.4833082, 0.9860045, 0.3254902, 0, 1, 1,
0.6221675, 1.647616, 2.216836, 0.3333333, 0, 1, 1,
0.6229269, -0.2113304, 2.235082, 0.3372549, 0, 1, 1,
0.6241711, -0.6652471, 2.858076, 0.345098, 0, 1, 1,
0.6256114, 0.01151394, 0.6863, 0.3490196, 0, 1, 1,
0.6283181, 0.9885604, 0.02525315, 0.3568628, 0, 1, 1,
0.6323375, 0.2806585, 1.088297, 0.3607843, 0, 1, 1,
0.632864, -0.3264376, 0.3664587, 0.3686275, 0, 1, 1,
0.6363393, -1.137943, 2.483657, 0.372549, 0, 1, 1,
0.6383549, -0.2690832, 1.748993, 0.3803922, 0, 1, 1,
0.6429725, -0.7635415, 3.005039, 0.3843137, 0, 1, 1,
0.6431754, 0.08510914, -0.702606, 0.3921569, 0, 1, 1,
0.6472362, 0.3841079, 0.8787689, 0.3960784, 0, 1, 1,
0.6476071, -1.46168, 3.27724, 0.4039216, 0, 1, 1,
0.6525077, -0.9003702, 1.993557, 0.4117647, 0, 1, 1,
0.6545671, 0.2163989, -0.03410795, 0.4156863, 0, 1, 1,
0.6565387, 0.9261898, 0.4712816, 0.4235294, 0, 1, 1,
0.6630493, -0.05887347, 3.931112, 0.427451, 0, 1, 1,
0.6636489, -0.9357076, 2.693344, 0.4352941, 0, 1, 1,
0.6649463, 1.573916, -0.6810802, 0.4392157, 0, 1, 1,
0.6700394, -0.07587348, 1.731565, 0.4470588, 0, 1, 1,
0.6759904, -0.7836169, 0.8480098, 0.4509804, 0, 1, 1,
0.6762748, 1.03944, 3.600669, 0.4588235, 0, 1, 1,
0.6840697, 0.6336485, 1.13191, 0.4627451, 0, 1, 1,
0.6890027, -0.7426422, 1.09978, 0.4705882, 0, 1, 1,
0.6913235, -1.398321, 0.9068851, 0.4745098, 0, 1, 1,
0.6949143, -1.369138, 2.926629, 0.4823529, 0, 1, 1,
0.6957673, -0.2071728, 1.7634, 0.4862745, 0, 1, 1,
0.6976767, -0.9633016, 3.026387, 0.4941176, 0, 1, 1,
0.70525, 1.080604, -0.3574252, 0.5019608, 0, 1, 1,
0.7070397, -1.944949, 2.645452, 0.5058824, 0, 1, 1,
0.7074432, -0.2467109, 2.942509, 0.5137255, 0, 1, 1,
0.7085708, 1.587393, 0.6401613, 0.5176471, 0, 1, 1,
0.7161173, 0.1581129, 0.9191333, 0.5254902, 0, 1, 1,
0.7165948, -1.225429, 2.255741, 0.5294118, 0, 1, 1,
0.7191079, 2.500205, 0.7200269, 0.5372549, 0, 1, 1,
0.7200387, -0.7675655, 4.357996, 0.5411765, 0, 1, 1,
0.7259844, -1.058403, 3.617744, 0.5490196, 0, 1, 1,
0.7298915, -0.4816614, 2.126304, 0.5529412, 0, 1, 1,
0.7307632, 0.3957316, -0.7009126, 0.5607843, 0, 1, 1,
0.733556, -1.57338, 2.656342, 0.5647059, 0, 1, 1,
0.7370282, -0.7856342, 1.736095, 0.572549, 0, 1, 1,
0.7384703, 0.8907418, 1.352825, 0.5764706, 0, 1, 1,
0.7503393, -0.09968732, 2.73374, 0.5843138, 0, 1, 1,
0.756888, -1.061917, 2.284457, 0.5882353, 0, 1, 1,
0.758525, 1.653582, -0.1838406, 0.5960785, 0, 1, 1,
0.7585813, -0.6336684, 3.079721, 0.6039216, 0, 1, 1,
0.7647393, -0.6448147, 2.897404, 0.6078432, 0, 1, 1,
0.7656116, 0.488387, 2.514395, 0.6156863, 0, 1, 1,
0.7715536, 0.1039893, 0.5560942, 0.6196079, 0, 1, 1,
0.7870746, -0.2078491, 0.5458561, 0.627451, 0, 1, 1,
0.7881056, -1.170181, 1.62548, 0.6313726, 0, 1, 1,
0.7896183, -0.06420956, 1.274855, 0.6392157, 0, 1, 1,
0.7904902, 1.176977, -0.1000359, 0.6431373, 0, 1, 1,
0.7990969, -0.468879, 3.526051, 0.6509804, 0, 1, 1,
0.8005556, -2.117888, 2.584535, 0.654902, 0, 1, 1,
0.807619, 0.9085769, -0.6161247, 0.6627451, 0, 1, 1,
0.8090122, 0.437273, 0.6720329, 0.6666667, 0, 1, 1,
0.8107061, -1.279797, 1.635953, 0.6745098, 0, 1, 1,
0.8142634, -0.01284086, 0.9507705, 0.6784314, 0, 1, 1,
0.8158212, -0.50078, 2.153454, 0.6862745, 0, 1, 1,
0.8194826, -0.909343, 1.899325, 0.6901961, 0, 1, 1,
0.8209045, 2.481319, 1.336744, 0.6980392, 0, 1, 1,
0.8248615, 1.755917, -0.5311475, 0.7058824, 0, 1, 1,
0.825451, 0.559931, 0.3106891, 0.7098039, 0, 1, 1,
0.834385, 0.6526102, 1.14985, 0.7176471, 0, 1, 1,
0.8392369, 0.9820785, -0.3510376, 0.7215686, 0, 1, 1,
0.8430697, 1.151641, 0.9324442, 0.7294118, 0, 1, 1,
0.8466052, -0.6096866, 1.783208, 0.7333333, 0, 1, 1,
0.8483104, 1.305042, 2.702467, 0.7411765, 0, 1, 1,
0.8542855, 0.2656204, 0.7668831, 0.7450981, 0, 1, 1,
0.8568404, -0.2691438, 0.988196, 0.7529412, 0, 1, 1,
0.8574235, -1.425546, 3.666885, 0.7568628, 0, 1, 1,
0.8579788, 0.6512168, 1.299849, 0.7647059, 0, 1, 1,
0.8616917, -0.001726861, 2.971366, 0.7686275, 0, 1, 1,
0.8696704, -0.5620239, 2.099874, 0.7764706, 0, 1, 1,
0.877127, -0.006210644, 1.252687, 0.7803922, 0, 1, 1,
0.8772686, -0.6583897, 2.489432, 0.7882353, 0, 1, 1,
0.8822761, -1.256803, 1.185543, 0.7921569, 0, 1, 1,
0.8891361, -0.7679175, 2.246325, 0.8, 0, 1, 1,
0.8904269, -0.4358755, 3.755437, 0.8078431, 0, 1, 1,
0.8943261, 0.1767105, 1.820345, 0.8117647, 0, 1, 1,
0.896288, -1.818658, 2.596285, 0.8196079, 0, 1, 1,
0.8968117, 0.1064539, 0.508788, 0.8235294, 0, 1, 1,
0.9145053, -0.0518646, 1.219972, 0.8313726, 0, 1, 1,
0.9174737, 0.161388, 0.03840334, 0.8352941, 0, 1, 1,
0.9215807, 0.1204988, 2.933086, 0.8431373, 0, 1, 1,
0.9218116, 0.8042191, 0.4370869, 0.8470588, 0, 1, 1,
0.922942, 1.508758, 1.48527, 0.854902, 0, 1, 1,
0.9257956, -0.9175557, 1.032418, 0.8588235, 0, 1, 1,
0.9264373, -0.2472356, 2.294614, 0.8666667, 0, 1, 1,
0.9269527, 0.2498903, 0.787297, 0.8705882, 0, 1, 1,
0.930648, 1.117464, 0.3911891, 0.8784314, 0, 1, 1,
0.9322883, 1.370828, 0.4814454, 0.8823529, 0, 1, 1,
0.9341268, -2.398485, 2.358983, 0.8901961, 0, 1, 1,
0.9349522, -1.431774, 3.879155, 0.8941177, 0, 1, 1,
0.9355495, 1.245883, 0.5707987, 0.9019608, 0, 1, 1,
0.9467063, 0.08393134, 2.506707, 0.9098039, 0, 1, 1,
0.9513383, 0.3661689, 1.531425, 0.9137255, 0, 1, 1,
0.9610921, -1.362497, 2.677881, 0.9215686, 0, 1, 1,
0.9661014, 1.702252, 1.249493, 0.9254902, 0, 1, 1,
0.9672483, -1.176754, 1.881416, 0.9333333, 0, 1, 1,
0.9679101, -0.9004427, 2.776803, 0.9372549, 0, 1, 1,
0.9702449, 0.7931237, -0.4861038, 0.945098, 0, 1, 1,
0.9762189, -0.106026, 1.438953, 0.9490196, 0, 1, 1,
0.9776833, 0.255468, 0.9283927, 0.9568627, 0, 1, 1,
0.9799633, -1.806595, 1.486812, 0.9607843, 0, 1, 1,
0.9830711, 1.833812, 1.01153, 0.9686275, 0, 1, 1,
0.9838203, -0.1746482, 2.044983, 0.972549, 0, 1, 1,
0.9847048, 1.799084, -0.5059388, 0.9803922, 0, 1, 1,
0.9957254, 0.09284247, 1.646486, 0.9843137, 0, 1, 1,
1.00043, -1.190909, 3.750347, 0.9921569, 0, 1, 1,
1.003647, 1.069224, 0.6408352, 0.9960784, 0, 1, 1,
1.007197, 0.6671245, -0.4887102, 1, 0, 0.9960784, 1,
1.010713, 0.4467113, 1.040242, 1, 0, 0.9882353, 1,
1.022588, -1.048243, 3.076116, 1, 0, 0.9843137, 1,
1.023672, 0.531251, -0.463115, 1, 0, 0.9764706, 1,
1.031125, -1.529065, 2.388791, 1, 0, 0.972549, 1,
1.03574, 1.851212, 0.3549443, 1, 0, 0.9647059, 1,
1.036306, 0.699623, 1.045826, 1, 0, 0.9607843, 1,
1.040647, -1.367347, 0.2597692, 1, 0, 0.9529412, 1,
1.049223, 0.7259583, 0.2624549, 1, 0, 0.9490196, 1,
1.050052, 1.290911, 2.13169, 1, 0, 0.9411765, 1,
1.059697, -0.09601308, 0.6862227, 1, 0, 0.9372549, 1,
1.062873, -0.404887, 2.590905, 1, 0, 0.9294118, 1,
1.063758, -0.7948166, 2.686333, 1, 0, 0.9254902, 1,
1.066584, -0.5750424, 1.728937, 1, 0, 0.9176471, 1,
1.068065, -0.6797628, 2.731409, 1, 0, 0.9137255, 1,
1.0787, -0.544732, 1.821579, 1, 0, 0.9058824, 1,
1.086094, 0.7792192, 0.6363562, 1, 0, 0.9019608, 1,
1.087284, 0.9725642, 1.630645, 1, 0, 0.8941177, 1,
1.095034, 0.08926208, 0.3978671, 1, 0, 0.8862745, 1,
1.097082, 0.1952455, 2.1298, 1, 0, 0.8823529, 1,
1.097191, -1.435836, 1.246906, 1, 0, 0.8745098, 1,
1.098823, 0.9720971, 0.09167147, 1, 0, 0.8705882, 1,
1.101998, -0.1468366, 1.791412, 1, 0, 0.8627451, 1,
1.102259, -0.5718117, 1.991686, 1, 0, 0.8588235, 1,
1.104684, 1.059582, 0.6215502, 1, 0, 0.8509804, 1,
1.113094, -2.255791, 0.3926732, 1, 0, 0.8470588, 1,
1.114494, 0.8203173, 1.11584, 1, 0, 0.8392157, 1,
1.114603, -1.372738, 3.853091, 1, 0, 0.8352941, 1,
1.131069, -0.06852194, -0.4342874, 1, 0, 0.827451, 1,
1.139697, 1.036304, 1.002268, 1, 0, 0.8235294, 1,
1.140505, -1.014059, 2.970198, 1, 0, 0.8156863, 1,
1.140847, 2.772191, -0.3529519, 1, 0, 0.8117647, 1,
1.142277, 0.9315003, 0.3544696, 1, 0, 0.8039216, 1,
1.146584, 0.8818479, -0.1067928, 1, 0, 0.7960784, 1,
1.155199, 0.5569162, 1.187181, 1, 0, 0.7921569, 1,
1.155676, 0.9383737, 1.197917, 1, 0, 0.7843137, 1,
1.16299, 0.984157, 2.926589, 1, 0, 0.7803922, 1,
1.175705, 1.219038, 0.4437547, 1, 0, 0.772549, 1,
1.176216, -1.44682, 3.424356, 1, 0, 0.7686275, 1,
1.184915, 0.4140404, 1.431674, 1, 0, 0.7607843, 1,
1.194208, -1.393083, 0.5796171, 1, 0, 0.7568628, 1,
1.202202, -0.228767, 1.640693, 1, 0, 0.7490196, 1,
1.205043, -0.4670104, 1.84492, 1, 0, 0.7450981, 1,
1.228259, 0.9834973, -1.189048, 1, 0, 0.7372549, 1,
1.233498, -1.370357, 3.453632, 1, 0, 0.7333333, 1,
1.237242, 1.925673, 0.9873183, 1, 0, 0.7254902, 1,
1.239713, -0.5062147, 0.9215511, 1, 0, 0.7215686, 1,
1.241217, -1.013687, 2.042362, 1, 0, 0.7137255, 1,
1.247876, -0.3251959, 0.06515424, 1, 0, 0.7098039, 1,
1.253402, -0.8104605, 1.914862, 1, 0, 0.7019608, 1,
1.258087, -1.309127, 2.168855, 1, 0, 0.6941177, 1,
1.264693, 0.6748843, 0.1665661, 1, 0, 0.6901961, 1,
1.267654, -0.533534, 3.011595, 1, 0, 0.682353, 1,
1.275565, 0.7414443, 1.375591, 1, 0, 0.6784314, 1,
1.27598, -0.1180611, 3.630205, 1, 0, 0.6705883, 1,
1.278062, -1.759408, 2.306831, 1, 0, 0.6666667, 1,
1.285057, 0.2724037, 1.011453, 1, 0, 0.6588235, 1,
1.287256, 0.3393222, 2.492276, 1, 0, 0.654902, 1,
1.289258, 1.154057, 0.326169, 1, 0, 0.6470588, 1,
1.289977, -2.363288, 3.438777, 1, 0, 0.6431373, 1,
1.292646, 0.9730073, 3.344234, 1, 0, 0.6352941, 1,
1.295285, 0.7033666, 0.1071423, 1, 0, 0.6313726, 1,
1.299703, -1.27792, 3.405262, 1, 0, 0.6235294, 1,
1.302606, 0.09668627, 1.353096, 1, 0, 0.6196079, 1,
1.310554, -1.126349, -0.5703222, 1, 0, 0.6117647, 1,
1.310714, -0.9791083, 3.660445, 1, 0, 0.6078432, 1,
1.312834, 1.811332, 1.194573, 1, 0, 0.6, 1,
1.313437, -0.312423, 1.307688, 1, 0, 0.5921569, 1,
1.319841, -0.3268704, 1.005507, 1, 0, 0.5882353, 1,
1.330316, -0.2717622, 2.48477, 1, 0, 0.5803922, 1,
1.33082, -1.349522, 3.490073, 1, 0, 0.5764706, 1,
1.335167, 0.180088, 1.338221, 1, 0, 0.5686275, 1,
1.336033, -1.399082, 2.853004, 1, 0, 0.5647059, 1,
1.337081, -1.555824, 2.462999, 1, 0, 0.5568628, 1,
1.341419, -0.1209467, 1.388836, 1, 0, 0.5529412, 1,
1.349912, 0.9953598, 1.463568, 1, 0, 0.5450981, 1,
1.357821, -1.899827, 1.955556, 1, 0, 0.5411765, 1,
1.358507, -0.2434753, 2.254361, 1, 0, 0.5333334, 1,
1.358792, -0.832293, 3.268516, 1, 0, 0.5294118, 1,
1.359119, 0.4684375, 0.3731596, 1, 0, 0.5215687, 1,
1.363817, -1.842638, 2.180024, 1, 0, 0.5176471, 1,
1.368071, 1.252663, 1.620024, 1, 0, 0.509804, 1,
1.377952, 0.7043638, -0.5820823, 1, 0, 0.5058824, 1,
1.379375, 0.6868314, 0.7192606, 1, 0, 0.4980392, 1,
1.380215, 0.5942541, 1.025522, 1, 0, 0.4901961, 1,
1.389745, -0.4392355, 2.202678, 1, 0, 0.4862745, 1,
1.398963, -0.06603666, 0.8845996, 1, 0, 0.4784314, 1,
1.404866, -0.151931, 3.281396, 1, 0, 0.4745098, 1,
1.409134, 0.05405774, 1.724718, 1, 0, 0.4666667, 1,
1.41321, -0.3187037, 2.221549, 1, 0, 0.4627451, 1,
1.438986, -2.005335, 2.24874, 1, 0, 0.454902, 1,
1.467572, -1.121409, 2.569777, 1, 0, 0.4509804, 1,
1.469002, 2.413248, 1.941207, 1, 0, 0.4431373, 1,
1.482042, -0.920696, 1.644509, 1, 0, 0.4392157, 1,
1.484222, 1.453669, 0.4211987, 1, 0, 0.4313726, 1,
1.487197, -0.7228, 1.887934, 1, 0, 0.427451, 1,
1.502732, 0.4094108, 1.983912, 1, 0, 0.4196078, 1,
1.508831, 0.7847047, 2.667331, 1, 0, 0.4156863, 1,
1.510255, 0.9475325, -0.2266861, 1, 0, 0.4078431, 1,
1.518366, -0.3314887, 2.716915, 1, 0, 0.4039216, 1,
1.524008, 0.1046979, 1.364534, 1, 0, 0.3960784, 1,
1.52556, 2.342544, 0.009192606, 1, 0, 0.3882353, 1,
1.543219, -0.2632181, 2.027269, 1, 0, 0.3843137, 1,
1.545391, -1.221042, 2.922245, 1, 0, 0.3764706, 1,
1.547634, 0.7501933, 1.432878, 1, 0, 0.372549, 1,
1.552112, -0.604138, 3.409299, 1, 0, 0.3647059, 1,
1.56384, 1.583562, 1.457002, 1, 0, 0.3607843, 1,
1.58682, 2.222935, 0.5656921, 1, 0, 0.3529412, 1,
1.596701, 0.2141571, 1.25547, 1, 0, 0.3490196, 1,
1.633348, -0.4378309, 2.148048, 1, 0, 0.3411765, 1,
1.637426, -1.040399, 2.995847, 1, 0, 0.3372549, 1,
1.654051, 0.8711247, 1.460273, 1, 0, 0.3294118, 1,
1.668996, -0.5161512, 2.276697, 1, 0, 0.3254902, 1,
1.678962, -0.5013224, 2.829466, 1, 0, 0.3176471, 1,
1.686602, -0.3497675, 1.267746, 1, 0, 0.3137255, 1,
1.687439, -0.2094764, -0.05645337, 1, 0, 0.3058824, 1,
1.69672, -2.354054, 1.991731, 1, 0, 0.2980392, 1,
1.704204, -1.166681, 1.956408, 1, 0, 0.2941177, 1,
1.709856, -0.1520052, 3.077207, 1, 0, 0.2862745, 1,
1.727817, 0.6468823, 1.684597, 1, 0, 0.282353, 1,
1.743996, -0.03943742, 0.7416965, 1, 0, 0.2745098, 1,
1.757659, -2.470178, 2.345473, 1, 0, 0.2705882, 1,
1.768295, 1.885393, -0.2104404, 1, 0, 0.2627451, 1,
1.773532, -0.2212407, 0.7909111, 1, 0, 0.2588235, 1,
1.776072, -0.7108263, 2.06108, 1, 0, 0.2509804, 1,
1.807088, -1.909422, 5.019469, 1, 0, 0.2470588, 1,
1.80808, -1.566288, 2.261245, 1, 0, 0.2392157, 1,
1.82796, -1.653438, 2.541676, 1, 0, 0.2352941, 1,
1.833778, -0.2717796, 3.402534, 1, 0, 0.227451, 1,
1.834523, -0.8781248, 0.07194509, 1, 0, 0.2235294, 1,
1.854331, 0.4490386, 1.588896, 1, 0, 0.2156863, 1,
1.867781, 0.4972097, -0.5088548, 1, 0, 0.2117647, 1,
1.87231, 0.1911172, 1.896881, 1, 0, 0.2039216, 1,
1.876832, -0.5352326, 1.690955, 1, 0, 0.1960784, 1,
1.8913, -1.10856, 2.717977, 1, 0, 0.1921569, 1,
1.90725, 1.934348, 2.413196, 1, 0, 0.1843137, 1,
1.911321, 1.597412, -0.3074438, 1, 0, 0.1803922, 1,
1.933384, 1.2019, 1.686261, 1, 0, 0.172549, 1,
1.936081, -1.957884, 1.990711, 1, 0, 0.1686275, 1,
1.943685, -1.673155, 3.05601, 1, 0, 0.1607843, 1,
1.946059, 0.005723909, 0.8072485, 1, 0, 0.1568628, 1,
1.963253, 0.3382366, 2.87606, 1, 0, 0.1490196, 1,
1.969705, -0.6787558, 3.283708, 1, 0, 0.145098, 1,
1.996173, 1.034335, 1.180927, 1, 0, 0.1372549, 1,
2.024762, 0.6799889, 1.885321, 1, 0, 0.1333333, 1,
2.0378, 0.8742417, 0.6538068, 1, 0, 0.1254902, 1,
2.056308, -1.138301, 3.995361, 1, 0, 0.1215686, 1,
2.066206, 0.6910859, 2.5564, 1, 0, 0.1137255, 1,
2.069172, -1.396453, 3.49662, 1, 0, 0.1098039, 1,
2.091286, 0.06843515, 1.360938, 1, 0, 0.1019608, 1,
2.260105, 0.1452377, 1.139502, 1, 0, 0.09411765, 1,
2.262816, 0.4544899, 0.7446023, 1, 0, 0.09019608, 1,
2.31762, 0.6827255, 1.055298, 1, 0, 0.08235294, 1,
2.344238, -0.08508767, 1.562466, 1, 0, 0.07843138, 1,
2.392856, -0.2637938, 1.968857, 1, 0, 0.07058824, 1,
2.458402, 0.5043548, 0.4719975, 1, 0, 0.06666667, 1,
2.459053, -0.7452893, 1.712273, 1, 0, 0.05882353, 1,
2.51817, 0.991066, 1.126242, 1, 0, 0.05490196, 1,
2.538583, 0.7658001, 1.943406, 1, 0, 0.04705882, 1,
2.685945, 0.6376109, 1.863302, 1, 0, 0.04313726, 1,
2.693523, 0.9722683, 1.0528, 1, 0, 0.03529412, 1,
2.764257, 1.536344, -1.154055, 1, 0, 0.03137255, 1,
2.774443, 0.3465081, 2.018039, 1, 0, 0.02352941, 1,
2.835323, -1.708059, 1.591213, 1, 0, 0.01960784, 1,
3.031248, 0.3227287, 0.477238, 1, 0, 0.01176471, 1,
3.382027, -0.2456791, 3.024263, 1, 0, 0.007843138, 1
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
0.2766181, -3.973145, -6.948871, 0, -0.5, 0.5, 0.5,
0.2766181, -3.973145, -6.948871, 1, -0.5, 0.5, 0.5,
0.2766181, -3.973145, -6.948871, 1, 1.5, 0.5, 0.5,
0.2766181, -3.973145, -6.948871, 0, 1.5, 0.5, 0.5
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
-3.881524, 0.01696205, -6.948871, 0, -0.5, 0.5, 0.5,
-3.881524, 0.01696205, -6.948871, 1, -0.5, 0.5, 0.5,
-3.881524, 0.01696205, -6.948871, 1, 1.5, 0.5, 0.5,
-3.881524, 0.01696205, -6.948871, 0, 1.5, 0.5, 0.5
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
-3.881524, -3.973145, 0.4124837, 0, -0.5, 0.5, 0.5,
-3.881524, -3.973145, 0.4124837, 1, -0.5, 0.5, 0.5,
-3.881524, -3.973145, 0.4124837, 1, 1.5, 0.5, 0.5,
-3.881524, -3.973145, 0.4124837, 0, 1.5, 0.5, 0.5
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
-2, -3.052351, -5.250097,
3, -3.052351, -5.250097,
-2, -3.052351, -5.250097,
-2, -3.205817, -5.533226,
-1, -3.052351, -5.250097,
-1, -3.205817, -5.533226,
0, -3.052351, -5.250097,
0, -3.205817, -5.533226,
1, -3.052351, -5.250097,
1, -3.205817, -5.533226,
2, -3.052351, -5.250097,
2, -3.205817, -5.533226,
3, -3.052351, -5.250097,
3, -3.205817, -5.533226
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
-2, -3.512748, -6.099484, 0, -0.5, 0.5, 0.5,
-2, -3.512748, -6.099484, 1, -0.5, 0.5, 0.5,
-2, -3.512748, -6.099484, 1, 1.5, 0.5, 0.5,
-2, -3.512748, -6.099484, 0, 1.5, 0.5, 0.5,
-1, -3.512748, -6.099484, 0, -0.5, 0.5, 0.5,
-1, -3.512748, -6.099484, 1, -0.5, 0.5, 0.5,
-1, -3.512748, -6.099484, 1, 1.5, 0.5, 0.5,
-1, -3.512748, -6.099484, 0, 1.5, 0.5, 0.5,
0, -3.512748, -6.099484, 0, -0.5, 0.5, 0.5,
0, -3.512748, -6.099484, 1, -0.5, 0.5, 0.5,
0, -3.512748, -6.099484, 1, 1.5, 0.5, 0.5,
0, -3.512748, -6.099484, 0, 1.5, 0.5, 0.5,
1, -3.512748, -6.099484, 0, -0.5, 0.5, 0.5,
1, -3.512748, -6.099484, 1, -0.5, 0.5, 0.5,
1, -3.512748, -6.099484, 1, 1.5, 0.5, 0.5,
1, -3.512748, -6.099484, 0, 1.5, 0.5, 0.5,
2, -3.512748, -6.099484, 0, -0.5, 0.5, 0.5,
2, -3.512748, -6.099484, 1, -0.5, 0.5, 0.5,
2, -3.512748, -6.099484, 1, 1.5, 0.5, 0.5,
2, -3.512748, -6.099484, 0, 1.5, 0.5, 0.5,
3, -3.512748, -6.099484, 0, -0.5, 0.5, 0.5,
3, -3.512748, -6.099484, 1, -0.5, 0.5, 0.5,
3, -3.512748, -6.099484, 1, 1.5, 0.5, 0.5,
3, -3.512748, -6.099484, 0, 1.5, 0.5, 0.5
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
-2.921953, -2, -5.250097,
-2.921953, 2, -5.250097,
-2.921953, -2, -5.250097,
-3.081882, -2, -5.533226,
-2.921953, -1, -5.250097,
-3.081882, -1, -5.533226,
-2.921953, 0, -5.250097,
-3.081882, 0, -5.533226,
-2.921953, 1, -5.250097,
-3.081882, 1, -5.533226,
-2.921953, 2, -5.250097,
-3.081882, 2, -5.533226
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
-3.401739, -2, -6.099484, 0, -0.5, 0.5, 0.5,
-3.401739, -2, -6.099484, 1, -0.5, 0.5, 0.5,
-3.401739, -2, -6.099484, 1, 1.5, 0.5, 0.5,
-3.401739, -2, -6.099484, 0, 1.5, 0.5, 0.5,
-3.401739, -1, -6.099484, 0, -0.5, 0.5, 0.5,
-3.401739, -1, -6.099484, 1, -0.5, 0.5, 0.5,
-3.401739, -1, -6.099484, 1, 1.5, 0.5, 0.5,
-3.401739, -1, -6.099484, 0, 1.5, 0.5, 0.5,
-3.401739, 0, -6.099484, 0, -0.5, 0.5, 0.5,
-3.401739, 0, -6.099484, 1, -0.5, 0.5, 0.5,
-3.401739, 0, -6.099484, 1, 1.5, 0.5, 0.5,
-3.401739, 0, -6.099484, 0, 1.5, 0.5, 0.5,
-3.401739, 1, -6.099484, 0, -0.5, 0.5, 0.5,
-3.401739, 1, -6.099484, 1, -0.5, 0.5, 0.5,
-3.401739, 1, -6.099484, 1, 1.5, 0.5, 0.5,
-3.401739, 1, -6.099484, 0, 1.5, 0.5, 0.5,
-3.401739, 2, -6.099484, 0, -0.5, 0.5, 0.5,
-3.401739, 2, -6.099484, 1, -0.5, 0.5, 0.5,
-3.401739, 2, -6.099484, 1, 1.5, 0.5, 0.5,
-3.401739, 2, -6.099484, 0, 1.5, 0.5, 0.5
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
-2.921953, -3.052351, -4,
-2.921953, -3.052351, 4,
-2.921953, -3.052351, -4,
-3.081882, -3.205817, -4,
-2.921953, -3.052351, -2,
-3.081882, -3.205817, -2,
-2.921953, -3.052351, 0,
-3.081882, -3.205817, 0,
-2.921953, -3.052351, 2,
-3.081882, -3.205817, 2,
-2.921953, -3.052351, 4,
-3.081882, -3.205817, 4
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
-3.401739, -3.512748, -4, 0, -0.5, 0.5, 0.5,
-3.401739, -3.512748, -4, 1, -0.5, 0.5, 0.5,
-3.401739, -3.512748, -4, 1, 1.5, 0.5, 0.5,
-3.401739, -3.512748, -4, 0, 1.5, 0.5, 0.5,
-3.401739, -3.512748, -2, 0, -0.5, 0.5, 0.5,
-3.401739, -3.512748, -2, 1, -0.5, 0.5, 0.5,
-3.401739, -3.512748, -2, 1, 1.5, 0.5, 0.5,
-3.401739, -3.512748, -2, 0, 1.5, 0.5, 0.5,
-3.401739, -3.512748, 0, 0, -0.5, 0.5, 0.5,
-3.401739, -3.512748, 0, 1, -0.5, 0.5, 0.5,
-3.401739, -3.512748, 0, 1, 1.5, 0.5, 0.5,
-3.401739, -3.512748, 0, 0, 1.5, 0.5, 0.5,
-3.401739, -3.512748, 2, 0, -0.5, 0.5, 0.5,
-3.401739, -3.512748, 2, 1, -0.5, 0.5, 0.5,
-3.401739, -3.512748, 2, 1, 1.5, 0.5, 0.5,
-3.401739, -3.512748, 2, 0, 1.5, 0.5, 0.5,
-3.401739, -3.512748, 4, 0, -0.5, 0.5, 0.5,
-3.401739, -3.512748, 4, 1, -0.5, 0.5, 0.5,
-3.401739, -3.512748, 4, 1, 1.5, 0.5, 0.5,
-3.401739, -3.512748, 4, 0, 1.5, 0.5, 0.5
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
-2.921953, -3.052351, -5.250097,
-2.921953, 3.086275, -5.250097,
-2.921953, -3.052351, 6.075064,
-2.921953, 3.086275, 6.075064,
-2.921953, -3.052351, -5.250097,
-2.921953, -3.052351, 6.075064,
-2.921953, 3.086275, -5.250097,
-2.921953, 3.086275, 6.075064,
-2.921953, -3.052351, -5.250097,
3.475189, -3.052351, -5.250097,
-2.921953, -3.052351, 6.075064,
3.475189, -3.052351, 6.075064,
-2.921953, 3.086275, -5.250097,
3.475189, 3.086275, -5.250097,
-2.921953, 3.086275, 6.075064,
3.475189, 3.086275, 6.075064,
3.475189, -3.052351, -5.250097,
3.475189, 3.086275, -5.250097,
3.475189, -3.052351, 6.075064,
3.475189, 3.086275, 6.075064,
3.475189, -3.052351, -5.250097,
3.475189, -3.052351, 6.075064,
3.475189, 3.086275, -5.250097,
3.475189, 3.086275, 6.075064
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
var radius = 7.680145;
var distance = 34.16984;
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
mvMatrix.translate( -0.2766181, -0.01696205, -0.4124837 );
mvMatrix.scale( 1.298068, 1.352733, 0.7332278 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.16984);
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
glyphosine<-read.table("glyphosine.xyz")
```

```
## Error in read.table("glyphosine.xyz"): no lines available in input
```

```r
x<-glyphosine$V2
```

```
## Error in eval(expr, envir, enclos): object 'glyphosine' not found
```

```r
y<-glyphosine$V3
```

```
## Error in eval(expr, envir, enclos): object 'glyphosine' not found
```

```r
z<-glyphosine$V4
```

```
## Error in eval(expr, envir, enclos): object 'glyphosine' not found
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
-2.828791, 0.8424168, -0.7534412, 0, 0, 1, 1, 1,
-2.758143, 2.191118, -0.6890227, 1, 0, 0, 1, 1,
-2.430175, -1.26122, -2.998232, 1, 0, 0, 1, 1,
-2.419332, -0.7046305, -1.860185, 1, 0, 0, 1, 1,
-2.406365, -0.09240086, -0.9440148, 1, 0, 0, 1, 1,
-2.343105, -0.09440913, -2.110804, 1, 0, 0, 1, 1,
-2.329173, 0.06635684, -0.7551003, 0, 0, 0, 1, 1,
-2.308619, 0.1761698, -1.416648, 0, 0, 0, 1, 1,
-2.253574, 0.2004467, -0.2356154, 0, 0, 0, 1, 1,
-2.252765, -2.318584, -1.657695, 0, 0, 0, 1, 1,
-2.229671, -0.9097455, -2.693887, 0, 0, 0, 1, 1,
-2.186155, 1.707969, -1.267376, 0, 0, 0, 1, 1,
-2.145038, -0.8386009, -1.571796, 0, 0, 0, 1, 1,
-2.143361, 1.117133, -3.246763, 1, 1, 1, 1, 1,
-2.045708, 0.1966507, -1.304771, 1, 1, 1, 1, 1,
-2.042547, 0.27988, -2.415999, 1, 1, 1, 1, 1,
-2.029859, -0.2121937, -1.040186, 1, 1, 1, 1, 1,
-1.966702, 0.729975, -1.579607, 1, 1, 1, 1, 1,
-1.965679, 0.552605, 1.018836, 1, 1, 1, 1, 1,
-1.922443, 0.6685476, -1.138781, 1, 1, 1, 1, 1,
-1.869453, 1.529597, -0.4305602, 1, 1, 1, 1, 1,
-1.866074, 0.832891, -2.472907, 1, 1, 1, 1, 1,
-1.863556, 0.05887552, -0.6446018, 1, 1, 1, 1, 1,
-1.857593, -2.164176, -2.482935, 1, 1, 1, 1, 1,
-1.855557, 0.9100747, -0.8508356, 1, 1, 1, 1, 1,
-1.85498, -1.078413, -3.253902, 1, 1, 1, 1, 1,
-1.843254, -0.4144983, -2.801366, 1, 1, 1, 1, 1,
-1.834216, 0.2165748, -3.383456, 1, 1, 1, 1, 1,
-1.834105, 0.1465301, -1.52397, 0, 0, 1, 1, 1,
-1.800729, -1.633154, -1.811292, 1, 0, 0, 1, 1,
-1.775989, -2.962954, -4.165668, 1, 0, 0, 1, 1,
-1.762144, -1.558425, -1.732224, 1, 0, 0, 1, 1,
-1.759226, -0.3274432, -0.4969558, 1, 0, 0, 1, 1,
-1.753399, 0.8310471, 0.7845584, 1, 0, 0, 1, 1,
-1.747743, 0.65027, -2.469443, 0, 0, 0, 1, 1,
-1.74634, -1.6968, -3.279562, 0, 0, 0, 1, 1,
-1.737132, -1.201928, -2.063156, 0, 0, 0, 1, 1,
-1.730401, -1.664953, -1.723221, 0, 0, 0, 1, 1,
-1.713942, -0.5511144, 0.8135515, 0, 0, 0, 1, 1,
-1.703153, 2.766162, -1.502501, 0, 0, 0, 1, 1,
-1.70253, 0.8424596, -1.490542, 0, 0, 0, 1, 1,
-1.693846, -0.7999611, 0.07634562, 1, 1, 1, 1, 1,
-1.692297, 0.250357, -1.409508, 1, 1, 1, 1, 1,
-1.688741, 0.8166075, -2.620034, 1, 1, 1, 1, 1,
-1.686825, -0.5198435, -1.951851, 1, 1, 1, 1, 1,
-1.676841, -1.076218, -3.332644, 1, 1, 1, 1, 1,
-1.669318, -2.133361, -0.7116022, 1, 1, 1, 1, 1,
-1.668495, -0.1881737, -2.40243, 1, 1, 1, 1, 1,
-1.666412, 0.4313178, -2.696301, 1, 1, 1, 1, 1,
-1.652577, 0.5732252, -1.064608, 1, 1, 1, 1, 1,
-1.646532, -0.1597248, -2.160075, 1, 1, 1, 1, 1,
-1.640104, 0.06641522, -2.624166, 1, 1, 1, 1, 1,
-1.636831, 0.2187785, -1.194902, 1, 1, 1, 1, 1,
-1.635895, -0.05066589, -2.00131, 1, 1, 1, 1, 1,
-1.625182, 0.9040398, 0.3834529, 1, 1, 1, 1, 1,
-1.603634, 0.8377019, -2.936435, 1, 1, 1, 1, 1,
-1.586784, 1.327931, 1.109052, 0, 0, 1, 1, 1,
-1.570151, 0.9116918, -2.596561, 1, 0, 0, 1, 1,
-1.557899, 0.01744758, -0.5895704, 1, 0, 0, 1, 1,
-1.54494, 2.200802, 0.4290362, 1, 0, 0, 1, 1,
-1.540994, 0.8860928, 0.405982, 1, 0, 0, 1, 1,
-1.504795, -1.02805, -2.096344, 1, 0, 0, 1, 1,
-1.485602, -1.279478, -1.467931, 0, 0, 0, 1, 1,
-1.484848, -0.6157486, -1.003383, 0, 0, 0, 1, 1,
-1.469816, -0.5647519, -2.018053, 0, 0, 0, 1, 1,
-1.463196, -1.905701, -2.559873, 0, 0, 0, 1, 1,
-1.446963, -2.156576, -2.137047, 0, 0, 0, 1, 1,
-1.44032, 0.2806378, -2.777158, 0, 0, 0, 1, 1,
-1.434262, 0.6977913, -2.307146, 0, 0, 0, 1, 1,
-1.425845, 0.4648676, -3.186208, 1, 1, 1, 1, 1,
-1.425765, -0.9045492, -3.292386, 1, 1, 1, 1, 1,
-1.415995, -0.315801, -3.208073, 1, 1, 1, 1, 1,
-1.410175, 0.1571906, -1.924293, 1, 1, 1, 1, 1,
-1.408918, -0.8259065, -1.553707, 1, 1, 1, 1, 1,
-1.403331, -0.7760407, -3.042457, 1, 1, 1, 1, 1,
-1.401422, -0.6379456, -2.861513, 1, 1, 1, 1, 1,
-1.399784, -0.1789929, 0.02640195, 1, 1, 1, 1, 1,
-1.390986, 0.6110294, -2.22546, 1, 1, 1, 1, 1,
-1.388725, -0.2775961, -0.01140455, 1, 1, 1, 1, 1,
-1.388379, 1.136753, -0.3421795, 1, 1, 1, 1, 1,
-1.386513, -1.619886, -1.917407, 1, 1, 1, 1, 1,
-1.379694, -1.320192, -2.718748, 1, 1, 1, 1, 1,
-1.377744, -0.1203365, -0.1741469, 1, 1, 1, 1, 1,
-1.377095, 0.3303982, -0.05376855, 1, 1, 1, 1, 1,
-1.376438, -1.116782, -2.21129, 0, 0, 1, 1, 1,
-1.368828, -1.226231, -2.524816, 1, 0, 0, 1, 1,
-1.364993, -0.4455571, -3.461968, 1, 0, 0, 1, 1,
-1.361774, 0.4587918, -0.8097147, 1, 0, 0, 1, 1,
-1.351982, 0.8458064, 0.27743, 1, 0, 0, 1, 1,
-1.351968, -1.752536, -3.735209, 1, 0, 0, 1, 1,
-1.350576, -0.4904971, -1.769257, 0, 0, 0, 1, 1,
-1.342469, 0.439959, -0.2862393, 0, 0, 0, 1, 1,
-1.340204, -0.03453947, -1.86709, 0, 0, 0, 1, 1,
-1.332604, -0.4409134, -2.2038, 0, 0, 0, 1, 1,
-1.306955, 0.1827755, -2.840884, 0, 0, 0, 1, 1,
-1.305588, 0.02416072, -1.371493, 0, 0, 0, 1, 1,
-1.292053, -1.046791, -2.613691, 0, 0, 0, 1, 1,
-1.291413, -0.9890379, -2.336953, 1, 1, 1, 1, 1,
-1.280515, -1.233876, -2.546624, 1, 1, 1, 1, 1,
-1.270522, -0.5136531, 0.3551349, 1, 1, 1, 1, 1,
-1.259347, 1.438622, -0.4791509, 1, 1, 1, 1, 1,
-1.253243, 1.008199, -0.5074262, 1, 1, 1, 1, 1,
-1.245609, -0.4451323, -0.1799356, 1, 1, 1, 1, 1,
-1.219854, -1.33388, -1.803642, 1, 1, 1, 1, 1,
-1.216564, -1.526012, -2.446994, 1, 1, 1, 1, 1,
-1.212916, 1.193674, -1.308786, 1, 1, 1, 1, 1,
-1.211566, -0.4798925, -3.209779, 1, 1, 1, 1, 1,
-1.200405, 0.1240024, 0.2904271, 1, 1, 1, 1, 1,
-1.198444, -1.202382, -0.9560013, 1, 1, 1, 1, 1,
-1.19317, 1.180551, 0.5257779, 1, 1, 1, 1, 1,
-1.186693, 0.6385729, -0.3952519, 1, 1, 1, 1, 1,
-1.182543, 0.9022931, -0.9878659, 1, 1, 1, 1, 1,
-1.172985, -1.069989, -1.499628, 0, 0, 1, 1, 1,
-1.17194, 0.3923692, -1.425765, 1, 0, 0, 1, 1,
-1.165424, -0.3886507, -2.6191, 1, 0, 0, 1, 1,
-1.157732, -0.200683, -1.137928, 1, 0, 0, 1, 1,
-1.14716, -0.5325568, -0.9449358, 1, 0, 0, 1, 1,
-1.144122, 0.4739402, -0.9398586, 1, 0, 0, 1, 1,
-1.143569, 0.06998868, 0.2465677, 0, 0, 0, 1, 1,
-1.138633, -0.3383327, -1.814471, 0, 0, 0, 1, 1,
-1.136219, -0.02084216, -1.504695, 0, 0, 0, 1, 1,
-1.133459, -1.957431, -3.224549, 0, 0, 0, 1, 1,
-1.128478, -0.7004856, -2.115855, 0, 0, 0, 1, 1,
-1.112921, 0.02897024, 0.6156316, 0, 0, 0, 1, 1,
-1.109054, -0.1252003, -0.7101324, 0, 0, 0, 1, 1,
-1.097505, 1.643847, -1.66049, 1, 1, 1, 1, 1,
-1.096152, -0.1434807, -2.460492, 1, 1, 1, 1, 1,
-1.093231, 0.325116, 0.1620824, 1, 1, 1, 1, 1,
-1.087815, 1.490222, -0.9450547, 1, 1, 1, 1, 1,
-1.082309, -0.4877109, -1.808095, 1, 1, 1, 1, 1,
-1.070099, -2.50041, -2.278062, 1, 1, 1, 1, 1,
-1.056099, 0.6629254, 0.3506632, 1, 1, 1, 1, 1,
-1.052001, 0.3698405, -2.823663, 1, 1, 1, 1, 1,
-1.05053, 0.4180995, -3.586113, 1, 1, 1, 1, 1,
-1.050429, 0.3396522, -0.3057058, 1, 1, 1, 1, 1,
-1.042326, -0.506183, -4.312152, 1, 1, 1, 1, 1,
-1.041711, -1.319246, -1.629414, 1, 1, 1, 1, 1,
-1.034451, 0.3114794, -0.3159262, 1, 1, 1, 1, 1,
-1.028513, -0.6463324, -3.669253, 1, 1, 1, 1, 1,
-1.024955, 1.188959, 0.2625144, 1, 1, 1, 1, 1,
-1.023221, 0.7620711, -2.740851, 0, 0, 1, 1, 1,
-1.020236, -1.589347, -2.14987, 1, 0, 0, 1, 1,
-1.01686, -0.6474018, -1.402904, 1, 0, 0, 1, 1,
-1.013801, 1.1529, -2.244008, 1, 0, 0, 1, 1,
-1.00974, 1.166382, 0.01370469, 1, 0, 0, 1, 1,
-1.005713, 0.1370682, 0.1267259, 1, 0, 0, 1, 1,
-1.003405, 0.05366524, -3.849824, 0, 0, 0, 1, 1,
-0.9965955, -1.024269, -1.449589, 0, 0, 0, 1, 1,
-0.9965754, 1.08437, -2.463286, 0, 0, 0, 1, 1,
-0.9928821, -0.9248957, -2.599802, 0, 0, 0, 1, 1,
-0.9922835, -0.5202652, -0.678657, 0, 0, 0, 1, 1,
-0.9921291, -0.03227138, -1.552414, 0, 0, 0, 1, 1,
-0.9762475, -0.5991855, -2.153373, 0, 0, 0, 1, 1,
-0.9689973, -0.5768977, -2.361237, 1, 1, 1, 1, 1,
-0.9662872, -0.441622, -2.213729, 1, 1, 1, 1, 1,
-0.9647871, 0.768742, -0.8739945, 1, 1, 1, 1, 1,
-0.9622877, 0.08424831, -2.613105, 1, 1, 1, 1, 1,
-0.9592832, 1.148671, 0.1861623, 1, 1, 1, 1, 1,
-0.9518624, 0.179797, -0.663132, 1, 1, 1, 1, 1,
-0.9510825, -0.4365664, -1.980511, 1, 1, 1, 1, 1,
-0.9507547, -0.8780791, -2.35927, 1, 1, 1, 1, 1,
-0.9468262, 0.8459439, -0.3043592, 1, 1, 1, 1, 1,
-0.9429179, 0.5846721, -0.3317886, 1, 1, 1, 1, 1,
-0.9405215, 0.4336916, -1.033958, 1, 1, 1, 1, 1,
-0.9382299, -0.7575502, -2.413032, 1, 1, 1, 1, 1,
-0.9323922, -0.8552469, -2.406433, 1, 1, 1, 1, 1,
-0.9314876, -0.7702038, -0.6439994, 1, 1, 1, 1, 1,
-0.9302602, 0.6369128, -0.1485898, 1, 1, 1, 1, 1,
-0.9290656, -0.4748534, -1.27336, 0, 0, 1, 1, 1,
-0.9271254, -1.281916, -0.9046162, 1, 0, 0, 1, 1,
-0.9129835, 0.4613629, 0.01060797, 1, 0, 0, 1, 1,
-0.9088623, -0.548927, -1.6813, 1, 0, 0, 1, 1,
-0.9059635, 0.3308508, -0.7429681, 1, 0, 0, 1, 1,
-0.9056891, -0.4028606, -3.280644, 1, 0, 0, 1, 1,
-0.9029043, 0.9301729, 0.4303118, 0, 0, 0, 1, 1,
-0.8999417, -0.8073408, -0.3575433, 0, 0, 0, 1, 1,
-0.8981928, 1.424159, 0.5868344, 0, 0, 0, 1, 1,
-0.8924627, 2.871295, -0.2434915, 0, 0, 0, 1, 1,
-0.8908668, 0.1439263, -1.839276, 0, 0, 0, 1, 1,
-0.8867037, 1.405953, -0.104655, 0, 0, 0, 1, 1,
-0.8866646, -0.3136474, -1.257446, 0, 0, 0, 1, 1,
-0.8841506, -1.171238, -3.41507, 1, 1, 1, 1, 1,
-0.8828785, -1.772348, -1.485862, 1, 1, 1, 1, 1,
-0.8808824, -1.203215, -3.930753, 1, 1, 1, 1, 1,
-0.8700415, 0.1227157, -1.770476, 1, 1, 1, 1, 1,
-0.8618971, -1.30591, -3.791686, 1, 1, 1, 1, 1,
-0.8566792, 1.181419, -0.6082712, 1, 1, 1, 1, 1,
-0.8548484, 1.370555, -3.122107, 1, 1, 1, 1, 1,
-0.849884, 1.545506, -3.022421, 1, 1, 1, 1, 1,
-0.8494114, -1.774422, -1.832756, 1, 1, 1, 1, 1,
-0.8357422, 1.301369, -0.2218998, 1, 1, 1, 1, 1,
-0.8327573, 0.515323, -2.910365, 1, 1, 1, 1, 1,
-0.8318152, 0.8754325, -1.755945, 1, 1, 1, 1, 1,
-0.8310311, -0.7975266, -1.566135, 1, 1, 1, 1, 1,
-0.8296186, -1.467408, -3.037654, 1, 1, 1, 1, 1,
-0.8260392, -0.5869236, -3.964916, 1, 1, 1, 1, 1,
-0.8177291, 0.1666104, -0.8665904, 0, 0, 1, 1, 1,
-0.8035912, -1.035838, -1.848566, 1, 0, 0, 1, 1,
-0.8012065, 0.2137454, -0.2044092, 1, 0, 0, 1, 1,
-0.7988659, 1.606358, -2.433902, 1, 0, 0, 1, 1,
-0.7984943, -1.056294, -2.949687, 1, 0, 0, 1, 1,
-0.7957367, -1.175711, -2.664876, 1, 0, 0, 1, 1,
-0.7947664, 0.005401941, -1.410489, 0, 0, 0, 1, 1,
-0.7943805, 0.570121, 0.9859861, 0, 0, 0, 1, 1,
-0.7912584, 0.2190498, -3.562236, 0, 0, 0, 1, 1,
-0.7893614, -0.9811049, -1.735992, 0, 0, 0, 1, 1,
-0.7861418, -0.4726972, -2.206282, 0, 0, 0, 1, 1,
-0.78176, -1.475996, -2.889005, 0, 0, 0, 1, 1,
-0.7673268, 0.1343396, -1.282932, 0, 0, 0, 1, 1,
-0.767274, -0.2148421, -2.768195, 1, 1, 1, 1, 1,
-0.764808, 0.7014732, -1.464143, 1, 1, 1, 1, 1,
-0.7639751, -0.3316799, -1.876804, 1, 1, 1, 1, 1,
-0.7636816, 0.5946067, 0.2100805, 1, 1, 1, 1, 1,
-0.7634023, 0.08585291, -1.115443, 1, 1, 1, 1, 1,
-0.7577488, -1.230589, -1.279408, 1, 1, 1, 1, 1,
-0.7551246, 0.2109744, -0.6337783, 1, 1, 1, 1, 1,
-0.7524804, -0.9418325, -2.405432, 1, 1, 1, 1, 1,
-0.7436988, -0.7948991, -3.564789, 1, 1, 1, 1, 1,
-0.741099, 0.9871495, -1.045105, 1, 1, 1, 1, 1,
-0.7385246, 0.5622174, -0.8398142, 1, 1, 1, 1, 1,
-0.7382156, -0.6316622, -1.863285, 1, 1, 1, 1, 1,
-0.7345055, -0.6976349, -2.479577, 1, 1, 1, 1, 1,
-0.7342003, -0.1473543, -3.432286, 1, 1, 1, 1, 1,
-0.7315257, 1.363808, -0.2972672, 1, 1, 1, 1, 1,
-0.722265, -0.5106773, -2.583106, 0, 0, 1, 1, 1,
-0.7204147, 2.393919, 1.840123, 1, 0, 0, 1, 1,
-0.7099003, -1.065716, -2.875998, 1, 0, 0, 1, 1,
-0.7037317, -0.8615808, -2.809225, 1, 0, 0, 1, 1,
-0.7035303, -2.070745, -3.390541, 1, 0, 0, 1, 1,
-0.6961998, -2.409853, -1.895422, 1, 0, 0, 1, 1,
-0.6945361, 0.1754658, -2.793296, 0, 0, 0, 1, 1,
-0.6924853, -0.2883851, -0.2989455, 0, 0, 0, 1, 1,
-0.6884389, 0.2665713, -1.234713, 0, 0, 0, 1, 1,
-0.6872403, 1.373465, 0.3580569, 0, 0, 0, 1, 1,
-0.6794791, -0.8562189, -2.695404, 0, 0, 0, 1, 1,
-0.6782531, -1.046561, 0.4739464, 0, 0, 0, 1, 1,
-0.6756858, 0.005483915, -2.042794, 0, 0, 0, 1, 1,
-0.6750311, -1.5327, -2.804785, 1, 1, 1, 1, 1,
-0.6698447, 0.6469529, -0.7851475, 1, 1, 1, 1, 1,
-0.6668358, 0.7111059, 0.1571437, 1, 1, 1, 1, 1,
-0.6613533, -0.3711084, -0.1534863, 1, 1, 1, 1, 1,
-0.6578934, 0.4321935, -0.3005244, 1, 1, 1, 1, 1,
-0.6547009, 0.5111042, -1.968526, 1, 1, 1, 1, 1,
-0.6532316, -0.7561059, -3.337276, 1, 1, 1, 1, 1,
-0.6518717, 0.288542, -2.321593, 1, 1, 1, 1, 1,
-0.647984, 0.8825906, -0.2156919, 1, 1, 1, 1, 1,
-0.6409471, -2.002736, -2.465232, 1, 1, 1, 1, 1,
-0.6212593, 1.555272, 0.240397, 1, 1, 1, 1, 1,
-0.616804, 1.608225, -0.9617615, 1, 1, 1, 1, 1,
-0.6145772, -2.027619, -3.723501, 1, 1, 1, 1, 1,
-0.6137093, 0.253549, -3.086591, 1, 1, 1, 1, 1,
-0.605417, 0.3461972, 0.5676793, 1, 1, 1, 1, 1,
-0.6049348, 1.839539, -0.2886452, 0, 0, 1, 1, 1,
-0.5999694, -1.256563, -3.145924, 1, 0, 0, 1, 1,
-0.5986826, 0.3771786, -0.8217692, 1, 0, 0, 1, 1,
-0.5974584, -0.2242264, -2.838855, 1, 0, 0, 1, 1,
-0.5970867, 0.5634716, -1.657188, 1, 0, 0, 1, 1,
-0.5955468, 0.3640941, -0.3042142, 1, 0, 0, 1, 1,
-0.5952808, 1.091933, 0.3785836, 0, 0, 0, 1, 1,
-0.5934812, 1.102214, -1.812808, 0, 0, 0, 1, 1,
-0.5898699, -0.9909033, -1.96685, 0, 0, 0, 1, 1,
-0.5886711, -0.3626739, -3.396374, 0, 0, 0, 1, 1,
-0.5834529, -0.8919333, -3.727688, 0, 0, 0, 1, 1,
-0.5762913, -0.338886, -1.67656, 0, 0, 0, 1, 1,
-0.5746651, -1.651929, -2.916583, 0, 0, 0, 1, 1,
-0.5735673, 0.5295244, -1.023887, 1, 1, 1, 1, 1,
-0.5706714, 0.945423, -0.5622012, 1, 1, 1, 1, 1,
-0.5700697, -0.2307435, -0.7681735, 1, 1, 1, 1, 1,
-0.567679, -1.254062, -2.710266, 1, 1, 1, 1, 1,
-0.5670773, -0.8338611, -1.728848, 1, 1, 1, 1, 1,
-0.5626989, 0.7916447, -0.9271794, 1, 1, 1, 1, 1,
-0.5577897, -0.1156152, -1.365675, 1, 1, 1, 1, 1,
-0.5544828, -0.6744363, -1.375105, 1, 1, 1, 1, 1,
-0.5541593, -0.04583548, -0.7180354, 1, 1, 1, 1, 1,
-0.5532908, -2.264563, -3.221591, 1, 1, 1, 1, 1,
-0.5526451, -1.787983, -3.942532, 1, 1, 1, 1, 1,
-0.5523061, -1.352605, -3.222999, 1, 1, 1, 1, 1,
-0.5505295, 0.3052048, -0.7562619, 1, 1, 1, 1, 1,
-0.5490522, 0.02238117, -3.187041, 1, 1, 1, 1, 1,
-0.5473788, 0.4414823, -0.1953939, 1, 1, 1, 1, 1,
-0.5412132, -0.5137547, -2.129284, 0, 0, 1, 1, 1,
-0.5384037, -0.3256207, -0.5932307, 1, 0, 0, 1, 1,
-0.5343143, 0.2072473, -1.408356, 1, 0, 0, 1, 1,
-0.5274816, 0.3462753, -2.262706, 1, 0, 0, 1, 1,
-0.5255877, 1.136322, 0.09296214, 1, 0, 0, 1, 1,
-0.5185903, -0.9082, -2.740331, 1, 0, 0, 1, 1,
-0.5171761, 0.3042195, -1.648255, 0, 0, 0, 1, 1,
-0.5042598, 0.3415478, 0.004931161, 0, 0, 0, 1, 1,
-0.4980855, -0.1831285, -0.4256213, 0, 0, 0, 1, 1,
-0.4949093, -1.857282, -3.527014, 0, 0, 0, 1, 1,
-0.4946084, 0.2339373, -2.497747, 0, 0, 0, 1, 1,
-0.4937067, -0.205275, -1.486631, 0, 0, 0, 1, 1,
-0.4886549, 0.1719815, -1.789585, 0, 0, 0, 1, 1,
-0.4829234, 1.048236, -0.6750333, 1, 1, 1, 1, 1,
-0.482539, -0.7478634, -1.781298, 1, 1, 1, 1, 1,
-0.4815355, -0.681502, 1.037187, 1, 1, 1, 1, 1,
-0.4794363, -0.3978262, -2.459632, 1, 1, 1, 1, 1,
-0.4775577, 0.08109909, -2.25996, 1, 1, 1, 1, 1,
-0.4724154, -0.5285825, -3.129477, 1, 1, 1, 1, 1,
-0.4723039, 0.765782, -0.5347859, 1, 1, 1, 1, 1,
-0.4700903, -0.3530317, -4.475271, 1, 1, 1, 1, 1,
-0.4683242, -0.7386972, -0.75749, 1, 1, 1, 1, 1,
-0.4654955, -1.362955, -3.605924, 1, 1, 1, 1, 1,
-0.4476971, -0.7394351, -2.602247, 1, 1, 1, 1, 1,
-0.4471033, 0.5852994, 0.5415868, 1, 1, 1, 1, 1,
-0.4426517, -1.063024, -2.471394, 1, 1, 1, 1, 1,
-0.4389692, 0.2111697, -0.701713, 1, 1, 1, 1, 1,
-0.429465, 0.2339571, -1.490654, 1, 1, 1, 1, 1,
-0.4288018, -0.6946046, -2.021886, 0, 0, 1, 1, 1,
-0.4283859, 0.3219282, -3.326795, 1, 0, 0, 1, 1,
-0.4273773, -0.07352257, -0.8167004, 1, 0, 0, 1, 1,
-0.42724, -0.2851055, -3.592139, 1, 0, 0, 1, 1,
-0.4271299, -0.1196491, -1.775176, 1, 0, 0, 1, 1,
-0.4271245, 1.246679, -0.4695085, 1, 0, 0, 1, 1,
-0.4230768, -1.95644, -3.298402, 0, 0, 0, 1, 1,
-0.4226024, -2.798876, -2.148299, 0, 0, 0, 1, 1,
-0.4184028, -0.7015125, -4.1809, 0, 0, 0, 1, 1,
-0.416538, 1.014515, -0.545194, 0, 0, 0, 1, 1,
-0.4075561, 0.9651479, 0.9258643, 0, 0, 0, 1, 1,
-0.4048585, -0.316674, -1.675045, 0, 0, 0, 1, 1,
-0.4028339, 0.4987974, -0.3825258, 0, 0, 0, 1, 1,
-0.4011695, 0.4989448, -0.912613, 1, 1, 1, 1, 1,
-0.3999093, 0.3987354, 0.1310685, 1, 1, 1, 1, 1,
-0.3942813, -1.633575, -2.591056, 1, 1, 1, 1, 1,
-0.3935483, -2.598039, -2.175735, 1, 1, 1, 1, 1,
-0.3915347, -0.8384421, -2.097289, 1, 1, 1, 1, 1,
-0.386863, 1.672203, 1.822593, 1, 1, 1, 1, 1,
-0.386358, 0.3015757, -2.565786, 1, 1, 1, 1, 1,
-0.3821992, -0.9571437, -2.313102, 1, 1, 1, 1, 1,
-0.3816796, -1.35656, -1.292974, 1, 1, 1, 1, 1,
-0.3812765, -0.453966, -3.624409, 1, 1, 1, 1, 1,
-0.3770782, -0.2570539, -3.794478, 1, 1, 1, 1, 1,
-0.3751442, 2.215174, 1.959699, 1, 1, 1, 1, 1,
-0.37467, -0.9669248, -3.721544, 1, 1, 1, 1, 1,
-0.3746694, 1.971924, -0.9525474, 1, 1, 1, 1, 1,
-0.3745005, -1.626429, -1.671935, 1, 1, 1, 1, 1,
-0.3720218, 1.016827, -3.187427, 0, 0, 1, 1, 1,
-0.3701851, -0.03350009, -0.4173302, 1, 0, 0, 1, 1,
-0.3693387, -0.4605161, -2.274877, 1, 0, 0, 1, 1,
-0.3673835, -0.1830785, -2.892462, 1, 0, 0, 1, 1,
-0.3637528, 0.3663575, -1.42948, 1, 0, 0, 1, 1,
-0.3621612, -0.411364, -3.30749, 1, 0, 0, 1, 1,
-0.3585752, -1.160477, -2.030948, 0, 0, 0, 1, 1,
-0.3581617, -1.330602, -1.724306, 0, 0, 0, 1, 1,
-0.3572114, 1.288514, -0.1881314, 0, 0, 0, 1, 1,
-0.3539177, 0.6577168, -1.004224, 0, 0, 0, 1, 1,
-0.3534951, 0.5569292, -0.1327172, 0, 0, 0, 1, 1,
-0.3505785, -0.2156666, -3.16059, 0, 0, 0, 1, 1,
-0.349419, -0.3069657, -3.230938, 0, 0, 0, 1, 1,
-0.34931, 0.2881503, -1.939491, 1, 1, 1, 1, 1,
-0.3445447, 0.4934477, -0.1980872, 1, 1, 1, 1, 1,
-0.3434193, 2.137317, 0.6822461, 1, 1, 1, 1, 1,
-0.3339654, 0.03909786, -2.125346, 1, 1, 1, 1, 1,
-0.3316491, 0.2746096, -2.762694, 1, 1, 1, 1, 1,
-0.3309524, 1.789142, -0.6284038, 1, 1, 1, 1, 1,
-0.3295744, -0.2445724, -2.059586, 1, 1, 1, 1, 1,
-0.3272236, -1.475302, -3.205371, 1, 1, 1, 1, 1,
-0.3196269, -1.115036, -2.365529, 1, 1, 1, 1, 1,
-0.3172375, 0.03814654, -2.746602, 1, 1, 1, 1, 1,
-0.3139139, 1.023667, 0.382887, 1, 1, 1, 1, 1,
-0.3134096, -1.34055, -3.321557, 1, 1, 1, 1, 1,
-0.3044134, -0.462066, -4.097182, 1, 1, 1, 1, 1,
-0.3036355, 1.473611, 1.233518, 1, 1, 1, 1, 1,
-0.303633, 0.06510221, -2.495937, 1, 1, 1, 1, 1,
-0.297423, -1.028529, -2.001355, 0, 0, 1, 1, 1,
-0.2966408, -2.369497, -3.869654, 1, 0, 0, 1, 1,
-0.28999, 0.257874, -1.660405, 1, 0, 0, 1, 1,
-0.2886564, -1.916012, -3.799345, 1, 0, 0, 1, 1,
-0.2863074, 0.2143736, 0.009280041, 1, 0, 0, 1, 1,
-0.2841754, 0.478837, -0.5882863, 1, 0, 0, 1, 1,
-0.2796305, 1.077793, -0.02717848, 0, 0, 0, 1, 1,
-0.2789757, 0.4097764, -0.7976948, 0, 0, 0, 1, 1,
-0.276827, -1.587428, -4.12188, 0, 0, 0, 1, 1,
-0.2735172, -0.6755327, -3.926963, 0, 0, 0, 1, 1,
-0.271155, 0.04003324, -1.871672, 0, 0, 0, 1, 1,
-0.2699693, -0.3098201, -2.795466, 0, 0, 0, 1, 1,
-0.2698949, -1.60403, -3.719359, 0, 0, 0, 1, 1,
-0.269172, 0.01162871, -2.069722, 1, 1, 1, 1, 1,
-0.2676125, 1.63467, -2.015293, 1, 1, 1, 1, 1,
-0.2652515, 0.1264594, -1.196942, 1, 1, 1, 1, 1,
-0.2651847, 1.595566, 0.1198055, 1, 1, 1, 1, 1,
-0.2645283, 1.296615, -0.2160087, 1, 1, 1, 1, 1,
-0.2596827, -0.4129101, -4.111101, 1, 1, 1, 1, 1,
-0.2579541, 0.2665572, 0.4278883, 1, 1, 1, 1, 1,
-0.2484625, 1.171681, -0.8440678, 1, 1, 1, 1, 1,
-0.2455436, -1.105778, -3.841911, 1, 1, 1, 1, 1,
-0.2438814, -0.2738972, -2.97299, 1, 1, 1, 1, 1,
-0.2420127, -0.716567, -0.9342628, 1, 1, 1, 1, 1,
-0.2406265, -1.825362, -4.238457, 1, 1, 1, 1, 1,
-0.2314578, -2.047601, -2.194732, 1, 1, 1, 1, 1,
-0.2314388, 1.433718, 1.314253, 1, 1, 1, 1, 1,
-0.2274488, -0.3346576, -2.258929, 1, 1, 1, 1, 1,
-0.2273274, -0.3988967, -1.90803, 0, 0, 1, 1, 1,
-0.2261128, -0.6012661, -3.340504, 1, 0, 0, 1, 1,
-0.2255821, 0.3308696, 0.4618154, 1, 0, 0, 1, 1,
-0.2253551, 0.569714, -1.526218, 1, 0, 0, 1, 1,
-0.2245136, -0.4644728, -1.086497, 1, 0, 0, 1, 1,
-0.218994, -0.2781608, -2.38284, 1, 0, 0, 1, 1,
-0.2140571, 0.3830188, -0.0582549, 0, 0, 0, 1, 1,
-0.2119544, -1.994812, -0.4192066, 0, 0, 0, 1, 1,
-0.2109707, 0.1644617, -0.6712229, 0, 0, 0, 1, 1,
-0.2101077, 1.965271, -0.3136845, 0, 0, 0, 1, 1,
-0.2022518, 0.8270808, 0.6677673, 0, 0, 0, 1, 1,
-0.2002762, 0.4377924, -0.4986764, 0, 0, 0, 1, 1,
-0.1972741, 0.1452857, -2.195082, 0, 0, 0, 1, 1,
-0.1956394, -0.3441596, -3.018782, 1, 1, 1, 1, 1,
-0.192066, 0.5367167, -0.4057149, 1, 1, 1, 1, 1,
-0.1867597, -1.569329, -2.791971, 1, 1, 1, 1, 1,
-0.1807079, 0.5960519, 0.6300624, 1, 1, 1, 1, 1,
-0.178442, 0.4948128, -1.592378, 1, 1, 1, 1, 1,
-0.1777537, 0.7466574, -1.143399, 1, 1, 1, 1, 1,
-0.1755092, 0.4101679, -2.016768, 1, 1, 1, 1, 1,
-0.1751929, 0.6911638, -0.4942057, 1, 1, 1, 1, 1,
-0.1576252, 0.7453091, -0.08366506, 1, 1, 1, 1, 1,
-0.1565295, -0.1572603, -2.196508, 1, 1, 1, 1, 1,
-0.156386, -1.712693, -2.802736, 1, 1, 1, 1, 1,
-0.1548859, 0.07366975, -0.6783667, 1, 1, 1, 1, 1,
-0.1539068, 0.5696529, -0.4055497, 1, 1, 1, 1, 1,
-0.1530901, 0.03186344, -1.23844, 1, 1, 1, 1, 1,
-0.1517516, -0.4301356, -1.57184, 1, 1, 1, 1, 1,
-0.1494526, -1.775928, -2.462878, 0, 0, 1, 1, 1,
-0.1486366, -1.13746, -3.55473, 1, 0, 0, 1, 1,
-0.1469329, 0.2677345, -0.2503281, 1, 0, 0, 1, 1,
-0.1444233, 0.06779386, -1.18302, 1, 0, 0, 1, 1,
-0.1427244, 0.5677962, -0.9473275, 1, 0, 0, 1, 1,
-0.1417568, -0.7543597, -4.116427, 1, 0, 0, 1, 1,
-0.1382431, 1.616556, -0.3342661, 0, 0, 0, 1, 1,
-0.1359826, 0.4045563, -0.8205525, 0, 0, 0, 1, 1,
-0.1339116, -0.5848422, -0.9800063, 0, 0, 0, 1, 1,
-0.1289086, -0.9224399, -3.699345, 0, 0, 0, 1, 1,
-0.1240944, 0.1777787, -0.7342449, 0, 0, 0, 1, 1,
-0.1228367, 0.634289, 0.3282481, 0, 0, 0, 1, 1,
-0.1196511, 0.8218103, -1.506039, 0, 0, 0, 1, 1,
-0.1180048, -0.5685371, -2.148884, 1, 1, 1, 1, 1,
-0.1131734, -2.032988, -4.73783, 1, 1, 1, 1, 1,
-0.1130521, -1.042299, -3.009574, 1, 1, 1, 1, 1,
-0.1119266, 1.007334, -1.276379, 1, 1, 1, 1, 1,
-0.1109447, 2.324821, 0.1608081, 1, 1, 1, 1, 1,
-0.1108202, 0.4314456, -0.9248899, 1, 1, 1, 1, 1,
-0.1106374, -0.4549949, -2.520292, 1, 1, 1, 1, 1,
-0.10153, -0.8028441, -2.829115, 1, 1, 1, 1, 1,
-0.09651002, -0.6555122, -3.104359, 1, 1, 1, 1, 1,
-0.09491586, 1.414147, 0.5101686, 1, 1, 1, 1, 1,
-0.09197758, -0.4429286, -3.374255, 1, 1, 1, 1, 1,
-0.08794416, -0.1009826, -2.819075, 1, 1, 1, 1, 1,
-0.08338594, -2.147704, -3.098753, 1, 1, 1, 1, 1,
-0.08214708, -0.3249711, -3.460072, 1, 1, 1, 1, 1,
-0.08214464, 0.3796298, 0.9153866, 1, 1, 1, 1, 1,
-0.07851388, 1.118642, -1.205951, 0, 0, 1, 1, 1,
-0.07689165, 0.3579285, 0.939001, 1, 0, 0, 1, 1,
-0.07435404, -1.614662, -3.670933, 1, 0, 0, 1, 1,
-0.07434883, -0.4931884, -5.085167, 1, 0, 0, 1, 1,
-0.06908476, -0.6058564, -2.021489, 1, 0, 0, 1, 1,
-0.06881166, 0.3396977, 0.4212068, 1, 0, 0, 1, 1,
-0.06734385, -1.591727, -2.789798, 0, 0, 0, 1, 1,
-0.06392504, -1.375554, -2.506517, 0, 0, 0, 1, 1,
-0.06148095, 0.148511, 0.6095752, 0, 0, 0, 1, 1,
-0.0600214, 0.1249226, 0.1834755, 0, 0, 0, 1, 1,
-0.0562365, 0.7270889, -0.4305924, 0, 0, 0, 1, 1,
-0.05191481, 0.9789451, -1.231893, 0, 0, 0, 1, 1,
-0.05090729, -0.6010941, -2.064722, 0, 0, 0, 1, 1,
-0.04853397, -2.531019, -3.477297, 1, 1, 1, 1, 1,
-0.04297789, 1.008029, -0.3687863, 1, 1, 1, 1, 1,
-0.04232078, 0.486856, -0.01013847, 1, 1, 1, 1, 1,
-0.04087942, 0.2873334, 1.10648, 1, 1, 1, 1, 1,
-0.03959707, -0.5868132, -2.401354, 1, 1, 1, 1, 1,
-0.03883048, 0.9074413, 0.1274317, 1, 1, 1, 1, 1,
-0.03622682, 1.64521, -0.6602976, 1, 1, 1, 1, 1,
-0.03558687, 1.34161, -1.893213, 1, 1, 1, 1, 1,
-0.03497155, 0.7292767, -1.398002, 1, 1, 1, 1, 1,
-0.02746561, 0.5975391, -0.5834933, 1, 1, 1, 1, 1,
-0.02658124, 0.9534796, 0.4065414, 1, 1, 1, 1, 1,
-0.02197488, 0.9585423, 0.6330992, 1, 1, 1, 1, 1,
-0.01677097, 1.213009, -0.4508877, 1, 1, 1, 1, 1,
-0.01476492, -0.4424113, -3.503836, 1, 1, 1, 1, 1,
-0.005200345, 0.2385995, 0.5722381, 1, 1, 1, 1, 1,
-0.003810862, -0.5026017, -2.469203, 0, 0, 1, 1, 1,
-0.002269833, -0.1219714, -4.458738, 1, 0, 0, 1, 1,
0.003461024, 0.2736633, -0.1281624, 1, 0, 0, 1, 1,
0.004863537, 0.07970125, -0.1003299, 1, 0, 0, 1, 1,
0.005007061, -1.296487, 4.927409, 1, 0, 0, 1, 1,
0.007777532, -0.4475691, 3.916422, 1, 0, 0, 1, 1,
0.01013655, 0.5305732, -1.611632, 0, 0, 0, 1, 1,
0.01213885, 0.03327346, 1.633254, 0, 0, 0, 1, 1,
0.01408987, -0.7690499, 3.221479, 0, 0, 0, 1, 1,
0.01921577, 0.3549833, -0.01688046, 0, 0, 0, 1, 1,
0.0209085, -0.4039806, 2.07744, 0, 0, 0, 1, 1,
0.02194649, -0.3485762, 3.293097, 0, 0, 0, 1, 1,
0.02221496, -0.09938044, 2.227523, 0, 0, 0, 1, 1,
0.0239404, 0.4437992, -1.40158, 1, 1, 1, 1, 1,
0.02504546, -0.1227137, 2.062565, 1, 1, 1, 1, 1,
0.02673797, -0.05634381, 1.033745, 1, 1, 1, 1, 1,
0.03121942, -0.3773567, 2.853029, 1, 1, 1, 1, 1,
0.03441778, 0.7130498, 1.876384, 1, 1, 1, 1, 1,
0.03659401, 0.24996, 0.9831275, 1, 1, 1, 1, 1,
0.04055124, 0.9062062, 0.2894156, 1, 1, 1, 1, 1,
0.04485646, -2.304591, 3.40307, 1, 1, 1, 1, 1,
0.04489447, -0.006409365, 0.9218662, 1, 1, 1, 1, 1,
0.04524498, 0.5638596, 1.231009, 1, 1, 1, 1, 1,
0.05042727, -0.5818859, 1.081663, 1, 1, 1, 1, 1,
0.05105869, 2.107177, 1.214739, 1, 1, 1, 1, 1,
0.05181673, 0.5853957, -0.912623, 1, 1, 1, 1, 1,
0.05251971, -0.1472926, 1.013481, 1, 1, 1, 1, 1,
0.05323692, -1.392931, 2.148454, 1, 1, 1, 1, 1,
0.05631697, 0.04662514, 1.172537, 0, 0, 1, 1, 1,
0.05754569, -0.04681709, 1.688521, 1, 0, 0, 1, 1,
0.06061449, 0.1994754, -0.8296426, 1, 0, 0, 1, 1,
0.06186787, -0.3289787, 2.949173, 1, 0, 0, 1, 1,
0.06501693, -0.06230941, 1.535714, 1, 0, 0, 1, 1,
0.06760851, -0.1328788, 0.9824882, 1, 0, 0, 1, 1,
0.06906123, 0.3434074, -0.6943806, 0, 0, 0, 1, 1,
0.07002158, -1.148615, 3.32996, 0, 0, 0, 1, 1,
0.07381872, -0.3082764, 1.862308, 0, 0, 0, 1, 1,
0.07972612, -0.8772902, 3.015201, 0, 0, 0, 1, 1,
0.08164608, 0.3507519, 0.5833234, 0, 0, 0, 1, 1,
0.08547109, 2.996878, 0.7593714, 0, 0, 0, 1, 1,
0.0863352, 0.6726751, -1.312217, 0, 0, 0, 1, 1,
0.08899169, -0.7695049, 3.118369, 1, 1, 1, 1, 1,
0.09159836, 1.497356, 1.224971, 1, 1, 1, 1, 1,
0.09346399, 1.478222, 0.4739023, 1, 1, 1, 1, 1,
0.09523129, 1.482369, -0.7865825, 1, 1, 1, 1, 1,
0.0957344, -1.210935, 4.895777, 1, 1, 1, 1, 1,
0.09585474, 0.9092926, 0.1231884, 1, 1, 1, 1, 1,
0.09654669, -1.287817, 3.399416, 1, 1, 1, 1, 1,
0.09841873, -0.8416577, 4.015602, 1, 1, 1, 1, 1,
0.1055401, -0.9186452, 4.015072, 1, 1, 1, 1, 1,
0.1064557, 0.6001055, -1.165304, 1, 1, 1, 1, 1,
0.1100474, 1.123731, 2.679054, 1, 1, 1, 1, 1,
0.1123586, 0.4026866, 2.408676, 1, 1, 1, 1, 1,
0.1125559, 0.758374, 1.218591, 1, 1, 1, 1, 1,
0.1160267, -2.605172, 3.397309, 1, 1, 1, 1, 1,
0.1194706, -0.1181856, 2.149782, 1, 1, 1, 1, 1,
0.120112, 0.2349273, 0.6358343, 0, 0, 1, 1, 1,
0.1223741, -0.5873136, 2.685601, 1, 0, 0, 1, 1,
0.1267973, -0.6488621, 4.342804, 1, 0, 0, 1, 1,
0.1274281, -0.7986716, 1.483693, 1, 0, 0, 1, 1,
0.1277329, -0.9954621, 4.152164, 1, 0, 0, 1, 1,
0.1283704, 0.01660145, 1.631037, 1, 0, 0, 1, 1,
0.130784, 1.121282, 2.486068, 0, 0, 0, 1, 1,
0.1389516, 0.4156865, -0.52106, 0, 0, 0, 1, 1,
0.1410141, 0.6242902, 0.2238371, 0, 0, 0, 1, 1,
0.1420339, 0.8122529, 1.619293, 0, 0, 0, 1, 1,
0.1435457, 0.7014438, 1.284387, 0, 0, 0, 1, 1,
0.1437067, -0.6581539, 2.134921, 0, 0, 0, 1, 1,
0.1456293, -0.0007132112, 0.267533, 0, 0, 0, 1, 1,
0.1460321, -0.3060695, 1.647489, 1, 1, 1, 1, 1,
0.1478748, -0.2504634, 3.093817, 1, 1, 1, 1, 1,
0.1513073, 0.425204, -0.3461682, 1, 1, 1, 1, 1,
0.1577786, 0.9019533, -1.059897, 1, 1, 1, 1, 1,
0.1586188, 2.328892, 0.03683558, 1, 1, 1, 1, 1,
0.1599252, -2.097026, 2.852888, 1, 1, 1, 1, 1,
0.1615695, -0.04392158, 1.706728, 1, 1, 1, 1, 1,
0.1627831, -1.886835, 1.491709, 1, 1, 1, 1, 1,
0.1665378, 1.271254, 1.00531, 1, 1, 1, 1, 1,
0.1709582, 0.6775336, -0.9228376, 1, 1, 1, 1, 1,
0.1729096, -0.9784787, 2.538076, 1, 1, 1, 1, 1,
0.1749819, 1.030761, 0.2118124, 1, 1, 1, 1, 1,
0.1786737, -0.8100454, 3.040025, 1, 1, 1, 1, 1,
0.1827424, 2.965359, -1.075023, 1, 1, 1, 1, 1,
0.1891767, -0.3532298, 3.217448, 1, 1, 1, 1, 1,
0.1905103, -0.1904873, 3.472997, 0, 0, 1, 1, 1,
0.1912282, -1.296403, 2.812002, 1, 0, 0, 1, 1,
0.193248, 0.1504249, 1.742743, 1, 0, 0, 1, 1,
0.1945223, -1.84492, 2.697028, 1, 0, 0, 1, 1,
0.1986124, -1.185701, 3.293155, 1, 0, 0, 1, 1,
0.2120049, 1.049664, -1.017544, 1, 0, 0, 1, 1,
0.2132968, 0.03083207, 1.610531, 0, 0, 0, 1, 1,
0.2145695, -1.048721, 2.821041, 0, 0, 0, 1, 1,
0.2218771, 1.899363, 0.7585948, 0, 0, 0, 1, 1,
0.2235592, 1.075035, 0.3448271, 0, 0, 0, 1, 1,
0.2246119, -1.103994, 1.996942, 0, 0, 0, 1, 1,
0.225803, -0.2964189, 2.662498, 0, 0, 0, 1, 1,
0.2378756, -0.9973522, 2.560247, 0, 0, 0, 1, 1,
0.2386633, -0.4502499, 1.294767, 1, 1, 1, 1, 1,
0.2469542, 0.280285, -0.8248038, 1, 1, 1, 1, 1,
0.2540996, -0.4286881, 2.320742, 1, 1, 1, 1, 1,
0.2545921, -0.8837166, 3.424597, 1, 1, 1, 1, 1,
0.2552681, -1.804902, 4.235679, 1, 1, 1, 1, 1,
0.2552693, -1.668489, 3.026264, 1, 1, 1, 1, 1,
0.2564567, 0.04927864, 3.539881, 1, 1, 1, 1, 1,
0.2591912, 1.296468, -2.147156, 1, 1, 1, 1, 1,
0.2599808, -0.4746443, 1.73824, 1, 1, 1, 1, 1,
0.263115, -0.8986238, 2.914352, 1, 1, 1, 1, 1,
0.2659405, 0.6810762, -0.1060568, 1, 1, 1, 1, 1,
0.2663593, 1.695673, 0.8866463, 1, 1, 1, 1, 1,
0.2736295, 1.046229, -2.307845, 1, 1, 1, 1, 1,
0.2745804, -0.4307815, 3.783966, 1, 1, 1, 1, 1,
0.2750272, -0.4502035, 3.572128, 1, 1, 1, 1, 1,
0.2776393, -1.808811, 2.32079, 0, 0, 1, 1, 1,
0.280651, -2.023555, 3.686278, 1, 0, 0, 1, 1,
0.2815198, -1.629957, 2.527863, 1, 0, 0, 1, 1,
0.2854104, 1.743165, 0.649268, 1, 0, 0, 1, 1,
0.2907111, -1.136552, 3.13621, 1, 0, 0, 1, 1,
0.2962394, -0.1953456, 0.2982418, 1, 0, 0, 1, 1,
0.2990302, 0.3855802, 0.2561653, 0, 0, 0, 1, 1,
0.2994155, -1.036353, 2.572491, 0, 0, 0, 1, 1,
0.3002553, -0.0610209, 1.689521, 0, 0, 0, 1, 1,
0.3024527, -0.4964248, 2.201864, 0, 0, 0, 1, 1,
0.3037843, -0.07557729, -0.1831343, 0, 0, 0, 1, 1,
0.3043121, 0.4706043, 0.6776147, 0, 0, 0, 1, 1,
0.3061284, 1.284291, 1.740741, 0, 0, 0, 1, 1,
0.3072695, 1.610679, -0.2985049, 1, 1, 1, 1, 1,
0.3085603, -0.1131864, 0.2087857, 1, 1, 1, 1, 1,
0.3148104, 0.3239216, -0.1001616, 1, 1, 1, 1, 1,
0.3164491, 1.054866, 0.1530926, 1, 1, 1, 1, 1,
0.3227099, -0.9396376, 1.336244, 1, 1, 1, 1, 1,
0.3228496, -1.201334, 0.5159693, 1, 1, 1, 1, 1,
0.3257822, -0.4478589, 4.139489, 1, 1, 1, 1, 1,
0.3282528, -0.6185924, 2.151779, 1, 1, 1, 1, 1,
0.3319416, -0.1079452, 1.069434, 1, 1, 1, 1, 1,
0.3335411, -2.439084, 2.343327, 1, 1, 1, 1, 1,
0.339449, 0.9590989, -0.3244811, 1, 1, 1, 1, 1,
0.3413858, 0.8861356, 1.747251, 1, 1, 1, 1, 1,
0.3418178, 1.316645, -2.399526, 1, 1, 1, 1, 1,
0.3430433, -1.346056, 3.001935, 1, 1, 1, 1, 1,
0.3437194, -0.04711463, 0.5271544, 1, 1, 1, 1, 1,
0.3445598, 0.1479989, -0.2852279, 0, 0, 1, 1, 1,
0.3447467, -1.081832, 3.2167, 1, 0, 0, 1, 1,
0.3476806, 0.8980024, 0.9216238, 1, 0, 0, 1, 1,
0.350211, -0.4962319, 1.433848, 1, 0, 0, 1, 1,
0.3521831, 0.3343961, 1.646083, 1, 0, 0, 1, 1,
0.3612261, -0.3223126, 1.271382, 1, 0, 0, 1, 1,
0.3633486, -1.894924, 4.514225, 0, 0, 0, 1, 1,
0.3636416, -1.522623, 3.108441, 0, 0, 0, 1, 1,
0.3682633, 1.152831, -0.2315824, 0, 0, 0, 1, 1,
0.3776685, -2.049594, 2.618, 0, 0, 0, 1, 1,
0.3791043, 1.146313, 1.041697, 0, 0, 0, 1, 1,
0.3801392, -0.05669257, 0.8594113, 0, 0, 0, 1, 1,
0.3805134, 0.5535614, 0.4676246, 0, 0, 0, 1, 1,
0.3813936, -2.196669, 4.677754, 1, 1, 1, 1, 1,
0.3896237, -0.4474422, 2.423004, 1, 1, 1, 1, 1,
0.3899442, 0.8603698, -0.1358636, 1, 1, 1, 1, 1,
0.3951886, -0.4116336, 1.652299, 1, 1, 1, 1, 1,
0.395447, -0.9046687, 2.161592, 1, 1, 1, 1, 1,
0.3989088, 1.538817, 0.3030106, 1, 1, 1, 1, 1,
0.3993767, 1.878967, -1.332669, 1, 1, 1, 1, 1,
0.4047564, 0.1212109, 2.774907, 1, 1, 1, 1, 1,
0.4096754, -0.5369791, 3.218033, 1, 1, 1, 1, 1,
0.413604, -1.514083, 1.741249, 1, 1, 1, 1, 1,
0.4189907, -1.637565, 5.910135, 1, 1, 1, 1, 1,
0.4211944, 2.757974, -0.7278186, 1, 1, 1, 1, 1,
0.4236321, 0.3176424, 0.2939221, 1, 1, 1, 1, 1,
0.4260901, 0.2651314, 0.5121332, 1, 1, 1, 1, 1,
0.426148, -1.280702, 3.662318, 1, 1, 1, 1, 1,
0.42971, 0.3461306, 0.4907625, 0, 0, 1, 1, 1,
0.4314449, 1.320812, 0.5246812, 1, 0, 0, 1, 1,
0.4316362, -1.799354, 1.389735, 1, 0, 0, 1, 1,
0.4396298, -0.2493264, 3.726277, 1, 0, 0, 1, 1,
0.4402452, 0.7881459, 1.723236, 1, 0, 0, 1, 1,
0.4410808, 0.1741183, 2.13987, 1, 0, 0, 1, 1,
0.451759, 1.03396, -0.6996581, 0, 0, 0, 1, 1,
0.4527662, -0.5058427, 1.416264, 0, 0, 0, 1, 1,
0.4528407, -0.5630062, 3.511796, 0, 0, 0, 1, 1,
0.4542486, -1.40712, 1.58645, 0, 0, 0, 1, 1,
0.4673145, 1.157713, 1.339972, 0, 0, 0, 1, 1,
0.4693316, 0.5476041, 0.2722519, 0, 0, 0, 1, 1,
0.4698537, 0.9664515, -0.576305, 0, 0, 0, 1, 1,
0.4737231, 0.3804599, 0.4944916, 1, 1, 1, 1, 1,
0.4811801, -0.09478956, 2.194732, 1, 1, 1, 1, 1,
0.4826225, -0.1784775, 1.118349, 1, 1, 1, 1, 1,
0.4832084, 2.076341, -0.9071097, 1, 1, 1, 1, 1,
0.4836262, -0.307803, 1.502057, 1, 1, 1, 1, 1,
0.4876857, -1.016166, 2.939929, 1, 1, 1, 1, 1,
0.4891442, 1.173593, 0.5236276, 1, 1, 1, 1, 1,
0.4900528, 0.7842973, 2.576187, 1, 1, 1, 1, 1,
0.4903328, -2.736399, 1.708208, 1, 1, 1, 1, 1,
0.4920244, 0.7160777, -0.3127111, 1, 1, 1, 1, 1,
0.4955392, 0.9805964, 1.043268, 1, 1, 1, 1, 1,
0.4955742, 1.940818, 2.545077, 1, 1, 1, 1, 1,
0.4961554, 0.003044448, 2.035477, 1, 1, 1, 1, 1,
0.4978867, 0.2873292, 0.5251182, 1, 1, 1, 1, 1,
0.5006357, 1.741288, -0.1871679, 1, 1, 1, 1, 1,
0.5018868, 1.626652, -0.2516731, 0, 0, 1, 1, 1,
0.5031458, -0.1148756, 1.345703, 1, 0, 0, 1, 1,
0.5055926, 0.5966173, 0.7579578, 1, 0, 0, 1, 1,
0.5094095, 0.4020554, 0.009177671, 1, 0, 0, 1, 1,
0.5135096, -1.372841, 2.892673, 1, 0, 0, 1, 1,
0.517064, -1.130611, 2.675133, 1, 0, 0, 1, 1,
0.5177507, -2.27899, 2.749344, 0, 0, 0, 1, 1,
0.5215207, -1.115414, 3.798203, 0, 0, 0, 1, 1,
0.5231762, -0.4325495, 1.507865, 0, 0, 0, 1, 1,
0.526737, -0.02032815, 0.6738055, 0, 0, 0, 1, 1,
0.5272639, -0.2946134, 1.476725, 0, 0, 0, 1, 1,
0.5280704, -1.170037, 1.827604, 0, 0, 0, 1, 1,
0.5357282, 0.9997641, 1.237935, 0, 0, 0, 1, 1,
0.5390806, 0.5401855, 0.06373525, 1, 1, 1, 1, 1,
0.5395176, -0.9306884, 2.256485, 1, 1, 1, 1, 1,
0.5414307, -1.833455, 3.246854, 1, 1, 1, 1, 1,
0.5466666, -0.3887208, 4.378242, 1, 1, 1, 1, 1,
0.5467807, -0.5833659, 2.908187, 1, 1, 1, 1, 1,
0.5474492, -0.6083021, 1.669501, 1, 1, 1, 1, 1,
0.5501397, -0.1884616, 1.492968, 1, 1, 1, 1, 1,
0.5502826, 0.7993983, -0.3155882, 1, 1, 1, 1, 1,
0.555742, -0.06844159, 2.953058, 1, 1, 1, 1, 1,
0.5577589, -1.088424, 2.799443, 1, 1, 1, 1, 1,
0.5613559, -0.01523258, 2.616015, 1, 1, 1, 1, 1,
0.5627009, -0.7396278, 3.532511, 1, 1, 1, 1, 1,
0.5637506, 0.3233411, 0.9572411, 1, 1, 1, 1, 1,
0.5676113, -1.162916, 4.235286, 1, 1, 1, 1, 1,
0.568031, 0.739871, 1.281325, 1, 1, 1, 1, 1,
0.5688286, 1.269026, -0.7288917, 0, 0, 1, 1, 1,
0.5723546, -0.9985543, 1.794143, 1, 0, 0, 1, 1,
0.5734729, -2.317966, 3.90735, 1, 0, 0, 1, 1,
0.5758816, 0.8220459, 3.42965, 1, 0, 0, 1, 1,
0.5787241, -0.8087314, 3.419971, 1, 0, 0, 1, 1,
0.5824883, -0.7006142, 2.805407, 1, 0, 0, 1, 1,
0.5905207, 1.734131, -0.123894, 0, 0, 0, 1, 1,
0.5906584, 0.1725158, -0.316628, 0, 0, 0, 1, 1,
0.5919614, 1.482933, 0.04404477, 0, 0, 0, 1, 1,
0.5946326, 0.15639, 0.7622693, 0, 0, 0, 1, 1,
0.5970168, -1.299803, 3.639247, 0, 0, 0, 1, 1,
0.5987852, 0.3712969, 3.264763, 0, 0, 0, 1, 1,
0.5997421, -0.1974029, 3.677496, 0, 0, 0, 1, 1,
0.599749, -0.2842249, 2.331182, 1, 1, 1, 1, 1,
0.6071391, 1.28331, -1.668633, 1, 1, 1, 1, 1,
0.6133987, -0.1408972, 0.9190014, 1, 1, 1, 1, 1,
0.6157837, -1.459317, -0.1821633, 1, 1, 1, 1, 1,
0.6161602, -0.3312415, 1.48365, 1, 1, 1, 1, 1,
0.6171347, -1.301252, 3.52492, 1, 1, 1, 1, 1,
0.6197367, -0.7484391, 1.767231, 1, 1, 1, 1, 1,
0.6209155, 0.9019825, -0.04547595, 1, 1, 1, 1, 1,
0.6216183, 0.4833082, 0.9860045, 1, 1, 1, 1, 1,
0.6221675, 1.647616, 2.216836, 1, 1, 1, 1, 1,
0.6229269, -0.2113304, 2.235082, 1, 1, 1, 1, 1,
0.6241711, -0.6652471, 2.858076, 1, 1, 1, 1, 1,
0.6256114, 0.01151394, 0.6863, 1, 1, 1, 1, 1,
0.6283181, 0.9885604, 0.02525315, 1, 1, 1, 1, 1,
0.6323375, 0.2806585, 1.088297, 1, 1, 1, 1, 1,
0.632864, -0.3264376, 0.3664587, 0, 0, 1, 1, 1,
0.6363393, -1.137943, 2.483657, 1, 0, 0, 1, 1,
0.6383549, -0.2690832, 1.748993, 1, 0, 0, 1, 1,
0.6429725, -0.7635415, 3.005039, 1, 0, 0, 1, 1,
0.6431754, 0.08510914, -0.702606, 1, 0, 0, 1, 1,
0.6472362, 0.3841079, 0.8787689, 1, 0, 0, 1, 1,
0.6476071, -1.46168, 3.27724, 0, 0, 0, 1, 1,
0.6525077, -0.9003702, 1.993557, 0, 0, 0, 1, 1,
0.6545671, 0.2163989, -0.03410795, 0, 0, 0, 1, 1,
0.6565387, 0.9261898, 0.4712816, 0, 0, 0, 1, 1,
0.6630493, -0.05887347, 3.931112, 0, 0, 0, 1, 1,
0.6636489, -0.9357076, 2.693344, 0, 0, 0, 1, 1,
0.6649463, 1.573916, -0.6810802, 0, 0, 0, 1, 1,
0.6700394, -0.07587348, 1.731565, 1, 1, 1, 1, 1,
0.6759904, -0.7836169, 0.8480098, 1, 1, 1, 1, 1,
0.6762748, 1.03944, 3.600669, 1, 1, 1, 1, 1,
0.6840697, 0.6336485, 1.13191, 1, 1, 1, 1, 1,
0.6890027, -0.7426422, 1.09978, 1, 1, 1, 1, 1,
0.6913235, -1.398321, 0.9068851, 1, 1, 1, 1, 1,
0.6949143, -1.369138, 2.926629, 1, 1, 1, 1, 1,
0.6957673, -0.2071728, 1.7634, 1, 1, 1, 1, 1,
0.6976767, -0.9633016, 3.026387, 1, 1, 1, 1, 1,
0.70525, 1.080604, -0.3574252, 1, 1, 1, 1, 1,
0.7070397, -1.944949, 2.645452, 1, 1, 1, 1, 1,
0.7074432, -0.2467109, 2.942509, 1, 1, 1, 1, 1,
0.7085708, 1.587393, 0.6401613, 1, 1, 1, 1, 1,
0.7161173, 0.1581129, 0.9191333, 1, 1, 1, 1, 1,
0.7165948, -1.225429, 2.255741, 1, 1, 1, 1, 1,
0.7191079, 2.500205, 0.7200269, 0, 0, 1, 1, 1,
0.7200387, -0.7675655, 4.357996, 1, 0, 0, 1, 1,
0.7259844, -1.058403, 3.617744, 1, 0, 0, 1, 1,
0.7298915, -0.4816614, 2.126304, 1, 0, 0, 1, 1,
0.7307632, 0.3957316, -0.7009126, 1, 0, 0, 1, 1,
0.733556, -1.57338, 2.656342, 1, 0, 0, 1, 1,
0.7370282, -0.7856342, 1.736095, 0, 0, 0, 1, 1,
0.7384703, 0.8907418, 1.352825, 0, 0, 0, 1, 1,
0.7503393, -0.09968732, 2.73374, 0, 0, 0, 1, 1,
0.756888, -1.061917, 2.284457, 0, 0, 0, 1, 1,
0.758525, 1.653582, -0.1838406, 0, 0, 0, 1, 1,
0.7585813, -0.6336684, 3.079721, 0, 0, 0, 1, 1,
0.7647393, -0.6448147, 2.897404, 0, 0, 0, 1, 1,
0.7656116, 0.488387, 2.514395, 1, 1, 1, 1, 1,
0.7715536, 0.1039893, 0.5560942, 1, 1, 1, 1, 1,
0.7870746, -0.2078491, 0.5458561, 1, 1, 1, 1, 1,
0.7881056, -1.170181, 1.62548, 1, 1, 1, 1, 1,
0.7896183, -0.06420956, 1.274855, 1, 1, 1, 1, 1,
0.7904902, 1.176977, -0.1000359, 1, 1, 1, 1, 1,
0.7990969, -0.468879, 3.526051, 1, 1, 1, 1, 1,
0.8005556, -2.117888, 2.584535, 1, 1, 1, 1, 1,
0.807619, 0.9085769, -0.6161247, 1, 1, 1, 1, 1,
0.8090122, 0.437273, 0.6720329, 1, 1, 1, 1, 1,
0.8107061, -1.279797, 1.635953, 1, 1, 1, 1, 1,
0.8142634, -0.01284086, 0.9507705, 1, 1, 1, 1, 1,
0.8158212, -0.50078, 2.153454, 1, 1, 1, 1, 1,
0.8194826, -0.909343, 1.899325, 1, 1, 1, 1, 1,
0.8209045, 2.481319, 1.336744, 1, 1, 1, 1, 1,
0.8248615, 1.755917, -0.5311475, 0, 0, 1, 1, 1,
0.825451, 0.559931, 0.3106891, 1, 0, 0, 1, 1,
0.834385, 0.6526102, 1.14985, 1, 0, 0, 1, 1,
0.8392369, 0.9820785, -0.3510376, 1, 0, 0, 1, 1,
0.8430697, 1.151641, 0.9324442, 1, 0, 0, 1, 1,
0.8466052, -0.6096866, 1.783208, 1, 0, 0, 1, 1,
0.8483104, 1.305042, 2.702467, 0, 0, 0, 1, 1,
0.8542855, 0.2656204, 0.7668831, 0, 0, 0, 1, 1,
0.8568404, -0.2691438, 0.988196, 0, 0, 0, 1, 1,
0.8574235, -1.425546, 3.666885, 0, 0, 0, 1, 1,
0.8579788, 0.6512168, 1.299849, 0, 0, 0, 1, 1,
0.8616917, -0.001726861, 2.971366, 0, 0, 0, 1, 1,
0.8696704, -0.5620239, 2.099874, 0, 0, 0, 1, 1,
0.877127, -0.006210644, 1.252687, 1, 1, 1, 1, 1,
0.8772686, -0.6583897, 2.489432, 1, 1, 1, 1, 1,
0.8822761, -1.256803, 1.185543, 1, 1, 1, 1, 1,
0.8891361, -0.7679175, 2.246325, 1, 1, 1, 1, 1,
0.8904269, -0.4358755, 3.755437, 1, 1, 1, 1, 1,
0.8943261, 0.1767105, 1.820345, 1, 1, 1, 1, 1,
0.896288, -1.818658, 2.596285, 1, 1, 1, 1, 1,
0.8968117, 0.1064539, 0.508788, 1, 1, 1, 1, 1,
0.9145053, -0.0518646, 1.219972, 1, 1, 1, 1, 1,
0.9174737, 0.161388, 0.03840334, 1, 1, 1, 1, 1,
0.9215807, 0.1204988, 2.933086, 1, 1, 1, 1, 1,
0.9218116, 0.8042191, 0.4370869, 1, 1, 1, 1, 1,
0.922942, 1.508758, 1.48527, 1, 1, 1, 1, 1,
0.9257956, -0.9175557, 1.032418, 1, 1, 1, 1, 1,
0.9264373, -0.2472356, 2.294614, 1, 1, 1, 1, 1,
0.9269527, 0.2498903, 0.787297, 0, 0, 1, 1, 1,
0.930648, 1.117464, 0.3911891, 1, 0, 0, 1, 1,
0.9322883, 1.370828, 0.4814454, 1, 0, 0, 1, 1,
0.9341268, -2.398485, 2.358983, 1, 0, 0, 1, 1,
0.9349522, -1.431774, 3.879155, 1, 0, 0, 1, 1,
0.9355495, 1.245883, 0.5707987, 1, 0, 0, 1, 1,
0.9467063, 0.08393134, 2.506707, 0, 0, 0, 1, 1,
0.9513383, 0.3661689, 1.531425, 0, 0, 0, 1, 1,
0.9610921, -1.362497, 2.677881, 0, 0, 0, 1, 1,
0.9661014, 1.702252, 1.249493, 0, 0, 0, 1, 1,
0.9672483, -1.176754, 1.881416, 0, 0, 0, 1, 1,
0.9679101, -0.9004427, 2.776803, 0, 0, 0, 1, 1,
0.9702449, 0.7931237, -0.4861038, 0, 0, 0, 1, 1,
0.9762189, -0.106026, 1.438953, 1, 1, 1, 1, 1,
0.9776833, 0.255468, 0.9283927, 1, 1, 1, 1, 1,
0.9799633, -1.806595, 1.486812, 1, 1, 1, 1, 1,
0.9830711, 1.833812, 1.01153, 1, 1, 1, 1, 1,
0.9838203, -0.1746482, 2.044983, 1, 1, 1, 1, 1,
0.9847048, 1.799084, -0.5059388, 1, 1, 1, 1, 1,
0.9957254, 0.09284247, 1.646486, 1, 1, 1, 1, 1,
1.00043, -1.190909, 3.750347, 1, 1, 1, 1, 1,
1.003647, 1.069224, 0.6408352, 1, 1, 1, 1, 1,
1.007197, 0.6671245, -0.4887102, 1, 1, 1, 1, 1,
1.010713, 0.4467113, 1.040242, 1, 1, 1, 1, 1,
1.022588, -1.048243, 3.076116, 1, 1, 1, 1, 1,
1.023672, 0.531251, -0.463115, 1, 1, 1, 1, 1,
1.031125, -1.529065, 2.388791, 1, 1, 1, 1, 1,
1.03574, 1.851212, 0.3549443, 1, 1, 1, 1, 1,
1.036306, 0.699623, 1.045826, 0, 0, 1, 1, 1,
1.040647, -1.367347, 0.2597692, 1, 0, 0, 1, 1,
1.049223, 0.7259583, 0.2624549, 1, 0, 0, 1, 1,
1.050052, 1.290911, 2.13169, 1, 0, 0, 1, 1,
1.059697, -0.09601308, 0.6862227, 1, 0, 0, 1, 1,
1.062873, -0.404887, 2.590905, 1, 0, 0, 1, 1,
1.063758, -0.7948166, 2.686333, 0, 0, 0, 1, 1,
1.066584, -0.5750424, 1.728937, 0, 0, 0, 1, 1,
1.068065, -0.6797628, 2.731409, 0, 0, 0, 1, 1,
1.0787, -0.544732, 1.821579, 0, 0, 0, 1, 1,
1.086094, 0.7792192, 0.6363562, 0, 0, 0, 1, 1,
1.087284, 0.9725642, 1.630645, 0, 0, 0, 1, 1,
1.095034, 0.08926208, 0.3978671, 0, 0, 0, 1, 1,
1.097082, 0.1952455, 2.1298, 1, 1, 1, 1, 1,
1.097191, -1.435836, 1.246906, 1, 1, 1, 1, 1,
1.098823, 0.9720971, 0.09167147, 1, 1, 1, 1, 1,
1.101998, -0.1468366, 1.791412, 1, 1, 1, 1, 1,
1.102259, -0.5718117, 1.991686, 1, 1, 1, 1, 1,
1.104684, 1.059582, 0.6215502, 1, 1, 1, 1, 1,
1.113094, -2.255791, 0.3926732, 1, 1, 1, 1, 1,
1.114494, 0.8203173, 1.11584, 1, 1, 1, 1, 1,
1.114603, -1.372738, 3.853091, 1, 1, 1, 1, 1,
1.131069, -0.06852194, -0.4342874, 1, 1, 1, 1, 1,
1.139697, 1.036304, 1.002268, 1, 1, 1, 1, 1,
1.140505, -1.014059, 2.970198, 1, 1, 1, 1, 1,
1.140847, 2.772191, -0.3529519, 1, 1, 1, 1, 1,
1.142277, 0.9315003, 0.3544696, 1, 1, 1, 1, 1,
1.146584, 0.8818479, -0.1067928, 1, 1, 1, 1, 1,
1.155199, 0.5569162, 1.187181, 0, 0, 1, 1, 1,
1.155676, 0.9383737, 1.197917, 1, 0, 0, 1, 1,
1.16299, 0.984157, 2.926589, 1, 0, 0, 1, 1,
1.175705, 1.219038, 0.4437547, 1, 0, 0, 1, 1,
1.176216, -1.44682, 3.424356, 1, 0, 0, 1, 1,
1.184915, 0.4140404, 1.431674, 1, 0, 0, 1, 1,
1.194208, -1.393083, 0.5796171, 0, 0, 0, 1, 1,
1.202202, -0.228767, 1.640693, 0, 0, 0, 1, 1,
1.205043, -0.4670104, 1.84492, 0, 0, 0, 1, 1,
1.228259, 0.9834973, -1.189048, 0, 0, 0, 1, 1,
1.233498, -1.370357, 3.453632, 0, 0, 0, 1, 1,
1.237242, 1.925673, 0.9873183, 0, 0, 0, 1, 1,
1.239713, -0.5062147, 0.9215511, 0, 0, 0, 1, 1,
1.241217, -1.013687, 2.042362, 1, 1, 1, 1, 1,
1.247876, -0.3251959, 0.06515424, 1, 1, 1, 1, 1,
1.253402, -0.8104605, 1.914862, 1, 1, 1, 1, 1,
1.258087, -1.309127, 2.168855, 1, 1, 1, 1, 1,
1.264693, 0.6748843, 0.1665661, 1, 1, 1, 1, 1,
1.267654, -0.533534, 3.011595, 1, 1, 1, 1, 1,
1.275565, 0.7414443, 1.375591, 1, 1, 1, 1, 1,
1.27598, -0.1180611, 3.630205, 1, 1, 1, 1, 1,
1.278062, -1.759408, 2.306831, 1, 1, 1, 1, 1,
1.285057, 0.2724037, 1.011453, 1, 1, 1, 1, 1,
1.287256, 0.3393222, 2.492276, 1, 1, 1, 1, 1,
1.289258, 1.154057, 0.326169, 1, 1, 1, 1, 1,
1.289977, -2.363288, 3.438777, 1, 1, 1, 1, 1,
1.292646, 0.9730073, 3.344234, 1, 1, 1, 1, 1,
1.295285, 0.7033666, 0.1071423, 1, 1, 1, 1, 1,
1.299703, -1.27792, 3.405262, 0, 0, 1, 1, 1,
1.302606, 0.09668627, 1.353096, 1, 0, 0, 1, 1,
1.310554, -1.126349, -0.5703222, 1, 0, 0, 1, 1,
1.310714, -0.9791083, 3.660445, 1, 0, 0, 1, 1,
1.312834, 1.811332, 1.194573, 1, 0, 0, 1, 1,
1.313437, -0.312423, 1.307688, 1, 0, 0, 1, 1,
1.319841, -0.3268704, 1.005507, 0, 0, 0, 1, 1,
1.330316, -0.2717622, 2.48477, 0, 0, 0, 1, 1,
1.33082, -1.349522, 3.490073, 0, 0, 0, 1, 1,
1.335167, 0.180088, 1.338221, 0, 0, 0, 1, 1,
1.336033, -1.399082, 2.853004, 0, 0, 0, 1, 1,
1.337081, -1.555824, 2.462999, 0, 0, 0, 1, 1,
1.341419, -0.1209467, 1.388836, 0, 0, 0, 1, 1,
1.349912, 0.9953598, 1.463568, 1, 1, 1, 1, 1,
1.357821, -1.899827, 1.955556, 1, 1, 1, 1, 1,
1.358507, -0.2434753, 2.254361, 1, 1, 1, 1, 1,
1.358792, -0.832293, 3.268516, 1, 1, 1, 1, 1,
1.359119, 0.4684375, 0.3731596, 1, 1, 1, 1, 1,
1.363817, -1.842638, 2.180024, 1, 1, 1, 1, 1,
1.368071, 1.252663, 1.620024, 1, 1, 1, 1, 1,
1.377952, 0.7043638, -0.5820823, 1, 1, 1, 1, 1,
1.379375, 0.6868314, 0.7192606, 1, 1, 1, 1, 1,
1.380215, 0.5942541, 1.025522, 1, 1, 1, 1, 1,
1.389745, -0.4392355, 2.202678, 1, 1, 1, 1, 1,
1.398963, -0.06603666, 0.8845996, 1, 1, 1, 1, 1,
1.404866, -0.151931, 3.281396, 1, 1, 1, 1, 1,
1.409134, 0.05405774, 1.724718, 1, 1, 1, 1, 1,
1.41321, -0.3187037, 2.221549, 1, 1, 1, 1, 1,
1.438986, -2.005335, 2.24874, 0, 0, 1, 1, 1,
1.467572, -1.121409, 2.569777, 1, 0, 0, 1, 1,
1.469002, 2.413248, 1.941207, 1, 0, 0, 1, 1,
1.482042, -0.920696, 1.644509, 1, 0, 0, 1, 1,
1.484222, 1.453669, 0.4211987, 1, 0, 0, 1, 1,
1.487197, -0.7228, 1.887934, 1, 0, 0, 1, 1,
1.502732, 0.4094108, 1.983912, 0, 0, 0, 1, 1,
1.508831, 0.7847047, 2.667331, 0, 0, 0, 1, 1,
1.510255, 0.9475325, -0.2266861, 0, 0, 0, 1, 1,
1.518366, -0.3314887, 2.716915, 0, 0, 0, 1, 1,
1.524008, 0.1046979, 1.364534, 0, 0, 0, 1, 1,
1.52556, 2.342544, 0.009192606, 0, 0, 0, 1, 1,
1.543219, -0.2632181, 2.027269, 0, 0, 0, 1, 1,
1.545391, -1.221042, 2.922245, 1, 1, 1, 1, 1,
1.547634, 0.7501933, 1.432878, 1, 1, 1, 1, 1,
1.552112, -0.604138, 3.409299, 1, 1, 1, 1, 1,
1.56384, 1.583562, 1.457002, 1, 1, 1, 1, 1,
1.58682, 2.222935, 0.5656921, 1, 1, 1, 1, 1,
1.596701, 0.2141571, 1.25547, 1, 1, 1, 1, 1,
1.633348, -0.4378309, 2.148048, 1, 1, 1, 1, 1,
1.637426, -1.040399, 2.995847, 1, 1, 1, 1, 1,
1.654051, 0.8711247, 1.460273, 1, 1, 1, 1, 1,
1.668996, -0.5161512, 2.276697, 1, 1, 1, 1, 1,
1.678962, -0.5013224, 2.829466, 1, 1, 1, 1, 1,
1.686602, -0.3497675, 1.267746, 1, 1, 1, 1, 1,
1.687439, -0.2094764, -0.05645337, 1, 1, 1, 1, 1,
1.69672, -2.354054, 1.991731, 1, 1, 1, 1, 1,
1.704204, -1.166681, 1.956408, 1, 1, 1, 1, 1,
1.709856, -0.1520052, 3.077207, 0, 0, 1, 1, 1,
1.727817, 0.6468823, 1.684597, 1, 0, 0, 1, 1,
1.743996, -0.03943742, 0.7416965, 1, 0, 0, 1, 1,
1.757659, -2.470178, 2.345473, 1, 0, 0, 1, 1,
1.768295, 1.885393, -0.2104404, 1, 0, 0, 1, 1,
1.773532, -0.2212407, 0.7909111, 1, 0, 0, 1, 1,
1.776072, -0.7108263, 2.06108, 0, 0, 0, 1, 1,
1.807088, -1.909422, 5.019469, 0, 0, 0, 1, 1,
1.80808, -1.566288, 2.261245, 0, 0, 0, 1, 1,
1.82796, -1.653438, 2.541676, 0, 0, 0, 1, 1,
1.833778, -0.2717796, 3.402534, 0, 0, 0, 1, 1,
1.834523, -0.8781248, 0.07194509, 0, 0, 0, 1, 1,
1.854331, 0.4490386, 1.588896, 0, 0, 0, 1, 1,
1.867781, 0.4972097, -0.5088548, 1, 1, 1, 1, 1,
1.87231, 0.1911172, 1.896881, 1, 1, 1, 1, 1,
1.876832, -0.5352326, 1.690955, 1, 1, 1, 1, 1,
1.8913, -1.10856, 2.717977, 1, 1, 1, 1, 1,
1.90725, 1.934348, 2.413196, 1, 1, 1, 1, 1,
1.911321, 1.597412, -0.3074438, 1, 1, 1, 1, 1,
1.933384, 1.2019, 1.686261, 1, 1, 1, 1, 1,
1.936081, -1.957884, 1.990711, 1, 1, 1, 1, 1,
1.943685, -1.673155, 3.05601, 1, 1, 1, 1, 1,
1.946059, 0.005723909, 0.8072485, 1, 1, 1, 1, 1,
1.963253, 0.3382366, 2.87606, 1, 1, 1, 1, 1,
1.969705, -0.6787558, 3.283708, 1, 1, 1, 1, 1,
1.996173, 1.034335, 1.180927, 1, 1, 1, 1, 1,
2.024762, 0.6799889, 1.885321, 1, 1, 1, 1, 1,
2.0378, 0.8742417, 0.6538068, 1, 1, 1, 1, 1,
2.056308, -1.138301, 3.995361, 0, 0, 1, 1, 1,
2.066206, 0.6910859, 2.5564, 1, 0, 0, 1, 1,
2.069172, -1.396453, 3.49662, 1, 0, 0, 1, 1,
2.091286, 0.06843515, 1.360938, 1, 0, 0, 1, 1,
2.260105, 0.1452377, 1.139502, 1, 0, 0, 1, 1,
2.262816, 0.4544899, 0.7446023, 1, 0, 0, 1, 1,
2.31762, 0.6827255, 1.055298, 0, 0, 0, 1, 1,
2.344238, -0.08508767, 1.562466, 0, 0, 0, 1, 1,
2.392856, -0.2637938, 1.968857, 0, 0, 0, 1, 1,
2.458402, 0.5043548, 0.4719975, 0, 0, 0, 1, 1,
2.459053, -0.7452893, 1.712273, 0, 0, 0, 1, 1,
2.51817, 0.991066, 1.126242, 0, 0, 0, 1, 1,
2.538583, 0.7658001, 1.943406, 0, 0, 0, 1, 1,
2.685945, 0.6376109, 1.863302, 1, 1, 1, 1, 1,
2.693523, 0.9722683, 1.0528, 1, 1, 1, 1, 1,
2.764257, 1.536344, -1.154055, 1, 1, 1, 1, 1,
2.774443, 0.3465081, 2.018039, 1, 1, 1, 1, 1,
2.835323, -1.708059, 1.591213, 1, 1, 1, 1, 1,
3.031248, 0.3227287, 0.477238, 1, 1, 1, 1, 1,
3.382027, -0.2456791, 3.024263, 1, 1, 1, 1, 1
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
var radius = 9.520789;
var distance = 33.44137;
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
mvMatrix.translate( -0.276618, -0.01696205, -0.4124837 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.44137);
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
