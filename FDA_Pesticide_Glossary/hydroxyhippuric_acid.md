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
-3.724552, -0.9415581, -1.197043, 1, 0, 0, 1,
-2.956543, 0.5240135, -2.40544, 1, 0.007843138, 0, 1,
-2.855275, 0.496379, -2.624506, 1, 0.01176471, 0, 1,
-2.733257, -0.05577189, -1.335226, 1, 0.01960784, 0, 1,
-2.605411, -0.1713102, -2.29958, 1, 0.02352941, 0, 1,
-2.592347, -0.4838616, -2.438374, 1, 0.03137255, 0, 1,
-2.512666, -2.438656, -4.10187, 1, 0.03529412, 0, 1,
-2.490935, -2.152276, -2.076358, 1, 0.04313726, 0, 1,
-2.487587, -0.03641796, -1.750235, 1, 0.04705882, 0, 1,
-2.465295, 1.350329, -3.247158, 1, 0.05490196, 0, 1,
-2.459051, 0.2231038, -1.710851, 1, 0.05882353, 0, 1,
-2.446772, -1.010059, -1.711073, 1, 0.06666667, 0, 1,
-2.346853, 2.416315, -0.2029132, 1, 0.07058824, 0, 1,
-2.326098, -0.4654291, -1.516902, 1, 0.07843138, 0, 1,
-2.303323, 0.417559, -1.790253, 1, 0.08235294, 0, 1,
-2.30109, 0.6028271, -2.044919, 1, 0.09019608, 0, 1,
-2.27151, -0.386312, -0.8164842, 1, 0.09411765, 0, 1,
-2.229532, -0.06245445, -1.246161, 1, 0.1019608, 0, 1,
-2.217745, 0.3565434, -2.264208, 1, 0.1098039, 0, 1,
-2.158312, -0.09929545, -0.4642053, 1, 0.1137255, 0, 1,
-2.121035, 0.4891773, -1.707482, 1, 0.1215686, 0, 1,
-2.11812, 0.1016206, -1.397608, 1, 0.1254902, 0, 1,
-2.105792, -0.07316048, -1.464487, 1, 0.1333333, 0, 1,
-2.076214, 1.252161, -1.918872, 1, 0.1372549, 0, 1,
-2.063008, 0.8283601, -1.397256, 1, 0.145098, 0, 1,
-2.034678, 1.184704, -1.346824, 1, 0.1490196, 0, 1,
-2.007813, 0.01659794, -0.3293718, 1, 0.1568628, 0, 1,
-1.98956, -0.2909271, 1.251805, 1, 0.1607843, 0, 1,
-1.978864, 1.162422, 0.3191103, 1, 0.1686275, 0, 1,
-1.965175, -0.7152307, -0.5653099, 1, 0.172549, 0, 1,
-1.953814, -0.8807117, -1.455697, 1, 0.1803922, 0, 1,
-1.874987, -0.7262691, -1.69228, 1, 0.1843137, 0, 1,
-1.864902, -0.6106869, -1.069988, 1, 0.1921569, 0, 1,
-1.86321, -0.5202779, -2.736362, 1, 0.1960784, 0, 1,
-1.855165, -1.057605, -0.1166616, 1, 0.2039216, 0, 1,
-1.84706, 0.04701328, -3.022386, 1, 0.2117647, 0, 1,
-1.842124, -0.4400996, -2.965309, 1, 0.2156863, 0, 1,
-1.82692, 0.5943874, -0.7698323, 1, 0.2235294, 0, 1,
-1.813136, 0.1013836, -0.387861, 1, 0.227451, 0, 1,
-1.797668, -0.1976565, -2.928328, 1, 0.2352941, 0, 1,
-1.789164, -1.224812, -4.043469, 1, 0.2392157, 0, 1,
-1.776915, 1.434847, -0.7921551, 1, 0.2470588, 0, 1,
-1.774251, -0.683844, -1.383338, 1, 0.2509804, 0, 1,
-1.763609, 0.5510342, -1.569627, 1, 0.2588235, 0, 1,
-1.756992, 0.2352957, -0.4822434, 1, 0.2627451, 0, 1,
-1.743169, 0.1858642, -0.2604796, 1, 0.2705882, 0, 1,
-1.728443, -0.7290191, -2.472323, 1, 0.2745098, 0, 1,
-1.716281, -1.430157, -3.413566, 1, 0.282353, 0, 1,
-1.714835, -1.075373, -1.375592, 1, 0.2862745, 0, 1,
-1.710883, -0.3376154, -1.817658, 1, 0.2941177, 0, 1,
-1.70276, -0.9692163, -3.271879, 1, 0.3019608, 0, 1,
-1.701938, 0.6795774, -1.8495, 1, 0.3058824, 0, 1,
-1.695457, 0.1474117, -3.163519, 1, 0.3137255, 0, 1,
-1.683318, -1.252847, -3.67049, 1, 0.3176471, 0, 1,
-1.666536, -1.387106, -2.280367, 1, 0.3254902, 0, 1,
-1.664122, -1.160741, -1.78249, 1, 0.3294118, 0, 1,
-1.658397, 1.753835, -1.248029, 1, 0.3372549, 0, 1,
-1.648155, -1.172414, -3.444982, 1, 0.3411765, 0, 1,
-1.641224, -0.8595714, -1.283553, 1, 0.3490196, 0, 1,
-1.617283, -0.6400837, -3.482019, 1, 0.3529412, 0, 1,
-1.616983, -1.38984, -2.698717, 1, 0.3607843, 0, 1,
-1.604311, -0.958613, -3.505773, 1, 0.3647059, 0, 1,
-1.585526, 0.6689063, -1.316178, 1, 0.372549, 0, 1,
-1.577292, 0.5061634, -0.1398576, 1, 0.3764706, 0, 1,
-1.554851, -0.9828431, -1.609541, 1, 0.3843137, 0, 1,
-1.552271, -2.073858, -2.677108, 1, 0.3882353, 0, 1,
-1.548594, 0.2713983, -1.455311, 1, 0.3960784, 0, 1,
-1.542808, 1.137161, -0.9807674, 1, 0.4039216, 0, 1,
-1.53815, -1.066038, -1.093698, 1, 0.4078431, 0, 1,
-1.533593, -0.9328921, -2.350109, 1, 0.4156863, 0, 1,
-1.528204, -1.575455, -2.882004, 1, 0.4196078, 0, 1,
-1.518502, -1.446512, -1.652642, 1, 0.427451, 0, 1,
-1.51521, -1.219953, -3.026828, 1, 0.4313726, 0, 1,
-1.510226, -0.158151, -2.273074, 1, 0.4392157, 0, 1,
-1.508949, -1.45748, -1.88481, 1, 0.4431373, 0, 1,
-1.47749, 0.5258507, -0.2750171, 1, 0.4509804, 0, 1,
-1.468703, -3.75719, -3.385704, 1, 0.454902, 0, 1,
-1.463049, 1.899433, -0.9803286, 1, 0.4627451, 0, 1,
-1.460993, 1.765214, -1.475765, 1, 0.4666667, 0, 1,
-1.452189, -0.1607959, -1.868461, 1, 0.4745098, 0, 1,
-1.451997, -0.3553061, -2.542267, 1, 0.4784314, 0, 1,
-1.449983, 1.493779, -0.6825743, 1, 0.4862745, 0, 1,
-1.449007, -1.283823, -2.479368, 1, 0.4901961, 0, 1,
-1.443147, 0.7219279, -2.230547, 1, 0.4980392, 0, 1,
-1.440532, -0.5952335, -2.302427, 1, 0.5058824, 0, 1,
-1.438219, 0.8965582, -0.9276423, 1, 0.509804, 0, 1,
-1.428464, 0.1871282, -0.9203601, 1, 0.5176471, 0, 1,
-1.425391, -1.757975, -3.309048, 1, 0.5215687, 0, 1,
-1.408445, -0.06760669, -0.5417726, 1, 0.5294118, 0, 1,
-1.400837, 0.8394362, -1.135214, 1, 0.5333334, 0, 1,
-1.391111, 1.383161, -2.584467, 1, 0.5411765, 0, 1,
-1.388137, 1.106026, -1.019665, 1, 0.5450981, 0, 1,
-1.375073, -0.2736412, -2.289763, 1, 0.5529412, 0, 1,
-1.373095, 0.443579, -0.9083572, 1, 0.5568628, 0, 1,
-1.358423, 1.016263, -1.893184, 1, 0.5647059, 0, 1,
-1.338721, 2.140396, -1.459462, 1, 0.5686275, 0, 1,
-1.331879, 1.344194, -3.38589, 1, 0.5764706, 0, 1,
-1.329284, 0.3775777, -1.708813, 1, 0.5803922, 0, 1,
-1.30426, -1.808099, -2.437499, 1, 0.5882353, 0, 1,
-1.299915, 0.01085795, -0.9232264, 1, 0.5921569, 0, 1,
-1.29781, -0.07871706, -3.737566, 1, 0.6, 0, 1,
-1.29685, -0.3596215, -2.071476, 1, 0.6078432, 0, 1,
-1.296605, 0.4033848, -1.921159, 1, 0.6117647, 0, 1,
-1.292156, -0.6848043, -1.809782, 1, 0.6196079, 0, 1,
-1.290187, -0.5379553, -2.858614, 1, 0.6235294, 0, 1,
-1.289966, -2.12022, -1.799307, 1, 0.6313726, 0, 1,
-1.288785, -0.6498041, -1.71592, 1, 0.6352941, 0, 1,
-1.287471, 1.81172, -0.4035725, 1, 0.6431373, 0, 1,
-1.281002, 0.4993412, -1.622083, 1, 0.6470588, 0, 1,
-1.274066, -0.0706349, -2.699822, 1, 0.654902, 0, 1,
-1.27326, 0.6871454, -0.9712781, 1, 0.6588235, 0, 1,
-1.266984, -0.3031353, -2.170807, 1, 0.6666667, 0, 1,
-1.266788, -0.4845482, -1.709813, 1, 0.6705883, 0, 1,
-1.256257, -0.3583009, -2.786419, 1, 0.6784314, 0, 1,
-1.249237, -0.4552135, -1.660476, 1, 0.682353, 0, 1,
-1.247859, 0.1571363, -2.089865, 1, 0.6901961, 0, 1,
-1.23729, -0.4740988, -2.454975, 1, 0.6941177, 0, 1,
-1.23615, 0.2629142, 0.003364204, 1, 0.7019608, 0, 1,
-1.235023, -0.2152446, -1.07437, 1, 0.7098039, 0, 1,
-1.231121, 0.0960054, -0.9647893, 1, 0.7137255, 0, 1,
-1.206996, -1.324195, -1.789769, 1, 0.7215686, 0, 1,
-1.200743, -1.485527, -1.46413, 1, 0.7254902, 0, 1,
-1.19936, -0.1460665, -0.5160947, 1, 0.7333333, 0, 1,
-1.197368, 0.3826081, -1.44071, 1, 0.7372549, 0, 1,
-1.192993, 0.356343, -3.130274, 1, 0.7450981, 0, 1,
-1.192894, 1.405947, -1.060136, 1, 0.7490196, 0, 1,
-1.192614, -0.1303006, -2.832136, 1, 0.7568628, 0, 1,
-1.191071, 0.1664587, -1.317903, 1, 0.7607843, 0, 1,
-1.187394, 0.573477, -2.730609, 1, 0.7686275, 0, 1,
-1.177912, 1.599472, -2.883185, 1, 0.772549, 0, 1,
-1.17373, -1.012388, -2.682758, 1, 0.7803922, 0, 1,
-1.166381, -0.7722632, -2.255551, 1, 0.7843137, 0, 1,
-1.161268, 0.5578796, -0.02802202, 1, 0.7921569, 0, 1,
-1.150644, -1.643141, -2.844293, 1, 0.7960784, 0, 1,
-1.149271, -0.4249544, -0.9214516, 1, 0.8039216, 0, 1,
-1.148325, -0.4595606, -2.055776, 1, 0.8117647, 0, 1,
-1.143443, 0.4703618, 1.583404, 1, 0.8156863, 0, 1,
-1.143046, 0.4371194, 0.6445922, 1, 0.8235294, 0, 1,
-1.137608, 0.7975715, -1.463805, 1, 0.827451, 0, 1,
-1.136961, 0.8559021, -1.889447, 1, 0.8352941, 0, 1,
-1.132684, 0.024862, -2.183634, 1, 0.8392157, 0, 1,
-1.128403, -1.268091, -1.850194, 1, 0.8470588, 0, 1,
-1.126837, 1.838262, 0.9891703, 1, 0.8509804, 0, 1,
-1.123837, 0.9897033, 0.6077595, 1, 0.8588235, 0, 1,
-1.122082, 0.445594, 0.6557205, 1, 0.8627451, 0, 1,
-1.120114, 1.206639, -2.065126, 1, 0.8705882, 0, 1,
-1.101835, 0.2623994, -0.3107394, 1, 0.8745098, 0, 1,
-1.098258, 0.1391827, -1.566281, 1, 0.8823529, 0, 1,
-1.096236, 1.414834, -1.702236, 1, 0.8862745, 0, 1,
-1.095122, -1.575688, -2.429832, 1, 0.8941177, 0, 1,
-1.068497, -0.52773, -3.081057, 1, 0.8980392, 0, 1,
-1.065761, 2.375444, 0.6959303, 1, 0.9058824, 0, 1,
-1.063551, 1.232088, -1.158479, 1, 0.9137255, 0, 1,
-1.059642, -0.7069941, -2.082065, 1, 0.9176471, 0, 1,
-1.059369, -0.04064041, -1.505395, 1, 0.9254902, 0, 1,
-1.057282, 0.02972104, -2.126202, 1, 0.9294118, 0, 1,
-1.054537, 0.417712, 0.6220644, 1, 0.9372549, 0, 1,
-1.053692, -0.5849353, 0.0996054, 1, 0.9411765, 0, 1,
-1.052788, -1.535283, -1.668716, 1, 0.9490196, 0, 1,
-1.048249, 0.9772479, 0.3818015, 1, 0.9529412, 0, 1,
-1.046127, 0.5510634, -1.440411, 1, 0.9607843, 0, 1,
-1.04343, -1.786305, -3.071597, 1, 0.9647059, 0, 1,
-1.039141, -0.9413105, -1.85228, 1, 0.972549, 0, 1,
-1.030614, 0.8693748, -0.732308, 1, 0.9764706, 0, 1,
-1.023523, 1.237022, -1.187059, 1, 0.9843137, 0, 1,
-1.021157, 0.1931259, 0.946855, 1, 0.9882353, 0, 1,
-1.016822, 0.06064761, -2.961111, 1, 0.9960784, 0, 1,
-1.014439, -0.05913521, -1.015641, 0.9960784, 1, 0, 1,
-1.007705, -0.9380223, -2.604878, 0.9921569, 1, 0, 1,
-1.002476, 0.8888662, -1.086859, 0.9843137, 1, 0, 1,
-0.9940346, 0.4915459, -0.5936094, 0.9803922, 1, 0, 1,
-0.99322, 0.523704, -0.1127796, 0.972549, 1, 0, 1,
-0.9896234, 0.3592101, -1.99061, 0.9686275, 1, 0, 1,
-0.9876912, 0.04477328, -2.583947, 0.9607843, 1, 0, 1,
-0.9571178, -0.6080919, -2.002622, 0.9568627, 1, 0, 1,
-0.9526623, 0.9841166, -0.3826661, 0.9490196, 1, 0, 1,
-0.9525914, -0.3717601, -1.337173, 0.945098, 1, 0, 1,
-0.9517194, -0.5840496, -0.8569199, 0.9372549, 1, 0, 1,
-0.9472064, -1.301547, -4.759286, 0.9333333, 1, 0, 1,
-0.9467232, -0.5876544, -2.974092, 0.9254902, 1, 0, 1,
-0.9415409, -0.2448126, 0.220647, 0.9215686, 1, 0, 1,
-0.9406151, -1.483315, -1.89935, 0.9137255, 1, 0, 1,
-0.938983, 0.4290103, 0.3303331, 0.9098039, 1, 0, 1,
-0.9385465, -1.613421, -2.097403, 0.9019608, 1, 0, 1,
-0.9303539, -0.8948339, -2.594256, 0.8941177, 1, 0, 1,
-0.9302976, -0.4662444, -2.174298, 0.8901961, 1, 0, 1,
-0.9276989, -0.1049308, -1.11272, 0.8823529, 1, 0, 1,
-0.9180807, -1.694727, -2.085751, 0.8784314, 1, 0, 1,
-0.9170105, -2.032485, -1.787342, 0.8705882, 1, 0, 1,
-0.9096451, 0.740521, -2.552892, 0.8666667, 1, 0, 1,
-0.9091247, -0.6065665, -3.702271, 0.8588235, 1, 0, 1,
-0.9085316, 0.5870562, -1.405248, 0.854902, 1, 0, 1,
-0.9053808, -1.066042, -1.140751, 0.8470588, 1, 0, 1,
-0.903571, 0.1188841, -1.475813, 0.8431373, 1, 0, 1,
-0.9031355, 0.3545803, -1.459805, 0.8352941, 1, 0, 1,
-0.9028867, 0.0192106, -0.2001063, 0.8313726, 1, 0, 1,
-0.901798, 0.3665842, -3.56504, 0.8235294, 1, 0, 1,
-0.8988919, -0.4071832, 0.2650978, 0.8196079, 1, 0, 1,
-0.8980721, 0.1669419, 0.2898549, 0.8117647, 1, 0, 1,
-0.8938524, -0.5919549, -0.9981533, 0.8078431, 1, 0, 1,
-0.8932118, 1.535827, 0.1505351, 0.8, 1, 0, 1,
-0.889617, 0.09074493, -1.460751, 0.7921569, 1, 0, 1,
-0.8877921, -0.9491152, -2.389731, 0.7882353, 1, 0, 1,
-0.8796813, 0.21949, -2.258163, 0.7803922, 1, 0, 1,
-0.8706192, 1.204088, 1.234576, 0.7764706, 1, 0, 1,
-0.8669492, 0.6870046, -0.7396962, 0.7686275, 1, 0, 1,
-0.8664565, -0.04740306, -0.4837857, 0.7647059, 1, 0, 1,
-0.8642111, -0.6496847, -1.559793, 0.7568628, 1, 0, 1,
-0.861266, -1.210852, -0.5899972, 0.7529412, 1, 0, 1,
-0.8597351, 0.2934394, -0.3059022, 0.7450981, 1, 0, 1,
-0.856728, 0.3940721, -1.726025, 0.7411765, 1, 0, 1,
-0.852577, 0.9217504, 0.209618, 0.7333333, 1, 0, 1,
-0.8498048, 0.9180828, -2.737575, 0.7294118, 1, 0, 1,
-0.8461613, -0.6535897, -3.236724, 0.7215686, 1, 0, 1,
-0.8426307, -0.003724433, -2.217236, 0.7176471, 1, 0, 1,
-0.8400918, 0.4273552, -0.1842851, 0.7098039, 1, 0, 1,
-0.835383, -0.04748109, -1.950643, 0.7058824, 1, 0, 1,
-0.8331426, 0.538491, -0.03079551, 0.6980392, 1, 0, 1,
-0.8330402, 0.2457776, 0.5094686, 0.6901961, 1, 0, 1,
-0.832404, 0.179313, -3.194706, 0.6862745, 1, 0, 1,
-0.8246878, 1.070615, -1.649398, 0.6784314, 1, 0, 1,
-0.8196601, -0.07979961, -2.234963, 0.6745098, 1, 0, 1,
-0.8140244, 0.6417239, -0.3519302, 0.6666667, 1, 0, 1,
-0.8113014, 0.6543479, -2.007277, 0.6627451, 1, 0, 1,
-0.7910938, 1.316661, -1.384329, 0.654902, 1, 0, 1,
-0.7883567, -0.5317186, -2.379143, 0.6509804, 1, 0, 1,
-0.7863705, 0.9531544, -0.07874145, 0.6431373, 1, 0, 1,
-0.7858565, -0.3849174, -2.380124, 0.6392157, 1, 0, 1,
-0.7834091, -0.3776889, -0.8097492, 0.6313726, 1, 0, 1,
-0.7822848, -0.5194592, -1.714201, 0.627451, 1, 0, 1,
-0.7806612, 0.4719422, -0.3775562, 0.6196079, 1, 0, 1,
-0.7788252, -1.175851, -2.335209, 0.6156863, 1, 0, 1,
-0.7725484, 0.08726857, -1.108243, 0.6078432, 1, 0, 1,
-0.7693183, -0.7961329, -2.876872, 0.6039216, 1, 0, 1,
-0.7626109, -1.2783, -2.661087, 0.5960785, 1, 0, 1,
-0.7546307, -0.5301862, -2.605877, 0.5882353, 1, 0, 1,
-0.7538447, -0.4827341, -0.8863652, 0.5843138, 1, 0, 1,
-0.7532421, -0.2663799, -1.724625, 0.5764706, 1, 0, 1,
-0.752705, -1.200595, -1.700531, 0.572549, 1, 0, 1,
-0.7440065, -0.6574255, -2.991158, 0.5647059, 1, 0, 1,
-0.7366605, -0.7853, -3.754198, 0.5607843, 1, 0, 1,
-0.7355717, -0.4400613, -2.632445, 0.5529412, 1, 0, 1,
-0.7267108, -0.4003056, -0.8291139, 0.5490196, 1, 0, 1,
-0.7180136, -0.8251436, -2.104207, 0.5411765, 1, 0, 1,
-0.7159708, -2.60749, -3.432578, 0.5372549, 1, 0, 1,
-0.7063004, 1.308418, 1.133434, 0.5294118, 1, 0, 1,
-0.6976028, -3.342232, -3.703456, 0.5254902, 1, 0, 1,
-0.6927199, -0.8839882, -3.602265, 0.5176471, 1, 0, 1,
-0.6926324, -0.5279503, -1.433706, 0.5137255, 1, 0, 1,
-0.6920038, 0.02311498, -1.576143, 0.5058824, 1, 0, 1,
-0.6894795, -0.398297, -0.03761003, 0.5019608, 1, 0, 1,
-0.6890545, 1.05626, 0.902559, 0.4941176, 1, 0, 1,
-0.6847793, 0.9074354, -1.708507, 0.4862745, 1, 0, 1,
-0.6823429, 1.884173, -0.1026119, 0.4823529, 1, 0, 1,
-0.6719059, 1.677327, -1.242119, 0.4745098, 1, 0, 1,
-0.6708019, -0.3954079, -2.843517, 0.4705882, 1, 0, 1,
-0.6704428, -0.6801005, -1.537803, 0.4627451, 1, 0, 1,
-0.6675486, 1.208963, 1.887663, 0.4588235, 1, 0, 1,
-0.6648076, -0.1180118, -2.781275, 0.4509804, 1, 0, 1,
-0.6611562, -0.397157, -1.046126, 0.4470588, 1, 0, 1,
-0.6590398, 0.1278943, -0.5205539, 0.4392157, 1, 0, 1,
-0.6528786, 0.1599306, 0.319828, 0.4352941, 1, 0, 1,
-0.6510981, -0.5791671, -4.084962, 0.427451, 1, 0, 1,
-0.6510373, -0.04678876, -2.890731, 0.4235294, 1, 0, 1,
-0.6504118, -1.478274, -3.545119, 0.4156863, 1, 0, 1,
-0.6501553, 0.6563847, -0.02886241, 0.4117647, 1, 0, 1,
-0.6486792, 1.149686, 0.6543015, 0.4039216, 1, 0, 1,
-0.6476349, 0.3863825, 1.584139, 0.3960784, 1, 0, 1,
-0.6448042, 0.865629, 0.4746507, 0.3921569, 1, 0, 1,
-0.6303609, -0.200508, -0.6511874, 0.3843137, 1, 0, 1,
-0.6291142, 0.7140616, 0.2434917, 0.3803922, 1, 0, 1,
-0.6255631, -0.107315, -0.3762378, 0.372549, 1, 0, 1,
-0.6248104, 1.276813, 0.5148178, 0.3686275, 1, 0, 1,
-0.6241083, -1.505682, -1.924183, 0.3607843, 1, 0, 1,
-0.6230946, 0.5394915, -2.770992, 0.3568628, 1, 0, 1,
-0.6200188, 1.552618, -1.355777, 0.3490196, 1, 0, 1,
-0.6198048, -0.7870647, -2.00789, 0.345098, 1, 0, 1,
-0.6117608, 0.09819893, -0.5406084, 0.3372549, 1, 0, 1,
-0.6112583, 0.2911374, -0.9515968, 0.3333333, 1, 0, 1,
-0.6094943, -1.053197, -2.520899, 0.3254902, 1, 0, 1,
-0.6060946, 0.09103218, -0.3797605, 0.3215686, 1, 0, 1,
-0.6008246, 1.457726, 2.002081, 0.3137255, 1, 0, 1,
-0.5974827, -1.85001, -2.657661, 0.3098039, 1, 0, 1,
-0.5875143, 0.4657652, -0.9411672, 0.3019608, 1, 0, 1,
-0.5861096, 1.31027, -0.8016239, 0.2941177, 1, 0, 1,
-0.5828706, 1.390128, 0.2806742, 0.2901961, 1, 0, 1,
-0.5792268, 0.008651751, -2.234791, 0.282353, 1, 0, 1,
-0.5780792, 0.07669726, -1.553462, 0.2784314, 1, 0, 1,
-0.5767126, 1.8158, -0.5297148, 0.2705882, 1, 0, 1,
-0.5760624, -1.033914, -1.390551, 0.2666667, 1, 0, 1,
-0.57095, -0.4760268, -2.704137, 0.2588235, 1, 0, 1,
-0.5695714, 0.03924408, -2.507636, 0.254902, 1, 0, 1,
-0.5680372, -0.1962081, -0.1864032, 0.2470588, 1, 0, 1,
-0.5680009, 1.133344, -1.235309, 0.2431373, 1, 0, 1,
-0.5650207, 0.2358189, 0.7104962, 0.2352941, 1, 0, 1,
-0.5647499, -0.267195, 0.01298573, 0.2313726, 1, 0, 1,
-0.5629745, -0.8159947, -4.095133, 0.2235294, 1, 0, 1,
-0.5600942, 2.213237, -0.459229, 0.2196078, 1, 0, 1,
-0.5584884, -0.562075, -2.998542, 0.2117647, 1, 0, 1,
-0.5548712, -2.420533, -2.913663, 0.2078431, 1, 0, 1,
-0.5547199, 1.916555, 1.463436, 0.2, 1, 0, 1,
-0.5546464, -0.531444, -2.273436, 0.1921569, 1, 0, 1,
-0.5520973, -1.995081, -3.835115, 0.1882353, 1, 0, 1,
-0.5501508, 0.03863038, -1.458966, 0.1803922, 1, 0, 1,
-0.5466414, -0.7122893, -2.007224, 0.1764706, 1, 0, 1,
-0.5419477, 0.8791755, -1.078356, 0.1686275, 1, 0, 1,
-0.5415901, 0.7143698, -2.23417, 0.1647059, 1, 0, 1,
-0.5399303, -0.5393392, -3.339597, 0.1568628, 1, 0, 1,
-0.5319123, 0.2594027, -1.533091, 0.1529412, 1, 0, 1,
-0.5239861, 1.734363, -2.178181, 0.145098, 1, 0, 1,
-0.522848, -0.04246462, -2.127839, 0.1411765, 1, 0, 1,
-0.5195718, 0.4304946, -1.713226, 0.1333333, 1, 0, 1,
-0.5159383, -0.2125109, -2.630694, 0.1294118, 1, 0, 1,
-0.5062743, 1.181588, 0.01982752, 0.1215686, 1, 0, 1,
-0.5061397, 2.005781, -1.719093, 0.1176471, 1, 0, 1,
-0.5020193, 1.109381, -1.860198, 0.1098039, 1, 0, 1,
-0.4995128, 0.5050522, 1.264356, 0.1058824, 1, 0, 1,
-0.4962821, -0.7597021, -1.181886, 0.09803922, 1, 0, 1,
-0.4961313, -0.1064847, -0.5453927, 0.09019608, 1, 0, 1,
-0.4922703, -0.2143699, -3.656246, 0.08627451, 1, 0, 1,
-0.4892533, 0.6443457, 0.9478675, 0.07843138, 1, 0, 1,
-0.4870118, 0.7741005, -0.6161389, 0.07450981, 1, 0, 1,
-0.4849069, -1.445737, -2.451544, 0.06666667, 1, 0, 1,
-0.4829803, 0.5724743, -0.4153906, 0.0627451, 1, 0, 1,
-0.4812454, -1.114209, -2.433033, 0.05490196, 1, 0, 1,
-0.4804271, 1.092763, 2.156081, 0.05098039, 1, 0, 1,
-0.4721215, -2.084897, -5.391781, 0.04313726, 1, 0, 1,
-0.4701726, -3.054365, -1.557336, 0.03921569, 1, 0, 1,
-0.4680833, -0.6180444, -1.614289, 0.03137255, 1, 0, 1,
-0.4629515, 0.9439823, -0.975875, 0.02745098, 1, 0, 1,
-0.4588843, 0.9127263, 0.1640593, 0.01960784, 1, 0, 1,
-0.4570813, 0.7634344, 0.1454753, 0.01568628, 1, 0, 1,
-0.4489196, -0.05786226, -2.026836, 0.007843138, 1, 0, 1,
-0.4456135, 1.830108, -1.890809, 0.003921569, 1, 0, 1,
-0.4454065, 0.1797712, -1.530026, 0, 1, 0.003921569, 1,
-0.443469, 0.438746, -0.04112715, 0, 1, 0.01176471, 1,
-0.4428281, 0.6737812, -1.502577, 0, 1, 0.01568628, 1,
-0.4399294, -0.3178968, -1.097973, 0, 1, 0.02352941, 1,
-0.4345114, 0.06421958, -2.308797, 0, 1, 0.02745098, 1,
-0.4339499, 0.4915989, 0.08825634, 0, 1, 0.03529412, 1,
-0.4255796, 0.4870551, -0.2030946, 0, 1, 0.03921569, 1,
-0.4232869, 0.3219507, 0.04596315, 0, 1, 0.04705882, 1,
-0.4229403, 2.035843, -1.925421, 0, 1, 0.05098039, 1,
-0.422198, 0.2583793, -0.8784553, 0, 1, 0.05882353, 1,
-0.4207807, -0.3012648, -2.079472, 0, 1, 0.0627451, 1,
-0.4182403, 0.0005627624, -0.05948711, 0, 1, 0.07058824, 1,
-0.4147965, 0.5446729, 0.0724923, 0, 1, 0.07450981, 1,
-0.414453, 0.007964708, -2.648848, 0, 1, 0.08235294, 1,
-0.4129904, -0.1469554, -1.126715, 0, 1, 0.08627451, 1,
-0.4076584, -0.8275952, -3.803019, 0, 1, 0.09411765, 1,
-0.4073378, -0.1257884, -1.319395, 0, 1, 0.1019608, 1,
-0.4009378, -0.1533889, -1.939888, 0, 1, 0.1058824, 1,
-0.4006435, -1.278863, -3.670195, 0, 1, 0.1137255, 1,
-0.3995571, 1.247159, -1.547632, 0, 1, 0.1176471, 1,
-0.3988463, -1.783935, -2.551819, 0, 1, 0.1254902, 1,
-0.3960389, 1.31631, -1.133823, 0, 1, 0.1294118, 1,
-0.3952645, -1.190559, -2.648244, 0, 1, 0.1372549, 1,
-0.3947228, -0.1106312, -0.9528419, 0, 1, 0.1411765, 1,
-0.3911704, -0.7649962, -4.312206, 0, 1, 0.1490196, 1,
-0.3901621, -0.9028876, -3.464613, 0, 1, 0.1529412, 1,
-0.3884318, 1.360753, -0.01020437, 0, 1, 0.1607843, 1,
-0.3871188, -0.7246542, -1.119646, 0, 1, 0.1647059, 1,
-0.3844491, -0.2615432, -1.84302, 0, 1, 0.172549, 1,
-0.3789973, 1.133214, -1.102304, 0, 1, 0.1764706, 1,
-0.3789846, 1.746303, 0.4193891, 0, 1, 0.1843137, 1,
-0.3738941, 0.9026991, 0.2019936, 0, 1, 0.1882353, 1,
-0.3675182, 1.85808, 1.565286, 0, 1, 0.1960784, 1,
-0.3663448, -0.2629563, -2.152936, 0, 1, 0.2039216, 1,
-0.3627008, -1.296859, -2.027803, 0, 1, 0.2078431, 1,
-0.3601298, 0.8816664, -0.4264899, 0, 1, 0.2156863, 1,
-0.354656, -0.6166041, -2.771532, 0, 1, 0.2196078, 1,
-0.352989, 2.957057, -0.9989253, 0, 1, 0.227451, 1,
-0.3495645, 0.5843859, -0.962002, 0, 1, 0.2313726, 1,
-0.344036, -0.4071063, -1.922764, 0, 1, 0.2392157, 1,
-0.3428578, -0.1663996, -2.439027, 0, 1, 0.2431373, 1,
-0.3403604, 1.222932, 0.8907856, 0, 1, 0.2509804, 1,
-0.3403279, 1.317174, -0.2412352, 0, 1, 0.254902, 1,
-0.3356915, -1.941958, -2.131007, 0, 1, 0.2627451, 1,
-0.3299162, -0.6473157, -5.145237, 0, 1, 0.2666667, 1,
-0.325372, 0.9010224, -0.824631, 0, 1, 0.2745098, 1,
-0.3243329, 0.7193692, -2.138612, 0, 1, 0.2784314, 1,
-0.324003, -1.008891, -2.875604, 0, 1, 0.2862745, 1,
-0.3233242, -1.996939, -2.339779, 0, 1, 0.2901961, 1,
-0.3217179, -0.03785127, -2.417171, 0, 1, 0.2980392, 1,
-0.3190556, -0.1971933, -2.67034, 0, 1, 0.3058824, 1,
-0.3172347, -0.3373307, -2.55226, 0, 1, 0.3098039, 1,
-0.3161221, 0.7155308, -1.103508, 0, 1, 0.3176471, 1,
-0.3099782, 0.7823201, -0.6019926, 0, 1, 0.3215686, 1,
-0.3078626, -0.6010429, -1.527061, 0, 1, 0.3294118, 1,
-0.305346, -0.6711257, -1.537249, 0, 1, 0.3333333, 1,
-0.3045911, -0.3516484, -2.244467, 0, 1, 0.3411765, 1,
-0.3035917, 1.131543, -0.2659146, 0, 1, 0.345098, 1,
-0.3018307, 0.2528733, -0.9528458, 0, 1, 0.3529412, 1,
-0.295647, 1.562122, -0.8083233, 0, 1, 0.3568628, 1,
-0.2952704, -0.3704733, -2.166341, 0, 1, 0.3647059, 1,
-0.2951199, 0.4584691, -0.7516357, 0, 1, 0.3686275, 1,
-0.2915136, 0.03582452, -2.99332, 0, 1, 0.3764706, 1,
-0.2825108, 1.211943, -1.219576, 0, 1, 0.3803922, 1,
-0.2810998, -2.903193, -1.621132, 0, 1, 0.3882353, 1,
-0.2663933, 0.0826052, -1.017439, 0, 1, 0.3921569, 1,
-0.261938, 0.9113275, -0.7675782, 0, 1, 0.4, 1,
-0.2614292, 0.6327106, 1.328244, 0, 1, 0.4078431, 1,
-0.261253, 0.06830315, -1.178663, 0, 1, 0.4117647, 1,
-0.2516084, 0.995936, 1.97843, 0, 1, 0.4196078, 1,
-0.2441856, 0.8315212, 0.714373, 0, 1, 0.4235294, 1,
-0.2435559, -1.807583, -2.631195, 0, 1, 0.4313726, 1,
-0.2414459, 0.4973139, 0.6993189, 0, 1, 0.4352941, 1,
-0.232906, 0.4437177, -0.9037227, 0, 1, 0.4431373, 1,
-0.231829, 1.111733, -0.1823055, 0, 1, 0.4470588, 1,
-0.2312098, 1.377566, -1.162712, 0, 1, 0.454902, 1,
-0.2310318, -1.24055, -3.294277, 0, 1, 0.4588235, 1,
-0.2299495, -0.4203606, -2.434141, 0, 1, 0.4666667, 1,
-0.2260878, -0.461726, -2.128125, 0, 1, 0.4705882, 1,
-0.2245346, 0.1807192, -1.838332, 0, 1, 0.4784314, 1,
-0.2228185, 0.3074171, -1.168371, 0, 1, 0.4823529, 1,
-0.2182004, 1.198716, 0.3585735, 0, 1, 0.4901961, 1,
-0.217625, -0.6012883, -2.767057, 0, 1, 0.4941176, 1,
-0.2166075, -1.036137, -3.475756, 0, 1, 0.5019608, 1,
-0.2164905, -1.008512, -2.528431, 0, 1, 0.509804, 1,
-0.2158673, 1.241157, 0.106194, 0, 1, 0.5137255, 1,
-0.2135033, 1.066774, -0.7381966, 0, 1, 0.5215687, 1,
-0.2116183, -1.050371, -2.45792, 0, 1, 0.5254902, 1,
-0.20755, -1.159127, -2.495621, 0, 1, 0.5333334, 1,
-0.2006165, 1.431872, -0.3579134, 0, 1, 0.5372549, 1,
-0.1995569, 0.05423721, -1.393523, 0, 1, 0.5450981, 1,
-0.1993099, 0.8442508, -0.9087384, 0, 1, 0.5490196, 1,
-0.1961551, 0.009421707, -0.6909705, 0, 1, 0.5568628, 1,
-0.1944773, -0.934279, -2.160765, 0, 1, 0.5607843, 1,
-0.1900739, -0.8230267, -3.371771, 0, 1, 0.5686275, 1,
-0.1876206, 0.3908829, -1.416129, 0, 1, 0.572549, 1,
-0.1852918, 0.8799073, -0.241414, 0, 1, 0.5803922, 1,
-0.1801868, 0.8450968, 0.4188282, 0, 1, 0.5843138, 1,
-0.1727561, -0.2871818, -4.426857, 0, 1, 0.5921569, 1,
-0.1714249, -1.198979, -1.969401, 0, 1, 0.5960785, 1,
-0.1685201, 0.6265644, -0.7606708, 0, 1, 0.6039216, 1,
-0.1667493, 0.7510188, -1.842713, 0, 1, 0.6117647, 1,
-0.1646518, -1.996641, -3.393873, 0, 1, 0.6156863, 1,
-0.1624829, 0.4439571, -1.358197, 0, 1, 0.6235294, 1,
-0.1615083, 0.5772069, -1.764505, 0, 1, 0.627451, 1,
-0.1602998, -0.837119, -6.05446, 0, 1, 0.6352941, 1,
-0.1586669, -0.2305325, -4.053504, 0, 1, 0.6392157, 1,
-0.1566903, 0.5878968, -0.2135666, 0, 1, 0.6470588, 1,
-0.1561431, 0.6509281, -0.1983073, 0, 1, 0.6509804, 1,
-0.1556387, -0.4356422, -3.785324, 0, 1, 0.6588235, 1,
-0.1386785, -1.65889, -3.324414, 0, 1, 0.6627451, 1,
-0.1346776, 0.1451272, -0.1258071, 0, 1, 0.6705883, 1,
-0.1346103, -0.5408752, -4.011836, 0, 1, 0.6745098, 1,
-0.1326981, 0.03936888, 0.5599596, 0, 1, 0.682353, 1,
-0.1272269, 1.019541, -2.55948, 0, 1, 0.6862745, 1,
-0.1261512, 0.7459241, 0.9408087, 0, 1, 0.6941177, 1,
-0.1191799, 0.9257386, 0.1107319, 0, 1, 0.7019608, 1,
-0.1187663, -0.9774658, -4.04894, 0, 1, 0.7058824, 1,
-0.1181301, -0.9398699, -3.202864, 0, 1, 0.7137255, 1,
-0.117943, -0.8789448, -3.065801, 0, 1, 0.7176471, 1,
-0.1171034, 1.237126, -0.09004331, 0, 1, 0.7254902, 1,
-0.1150287, 0.5963478, -0.2828612, 0, 1, 0.7294118, 1,
-0.1124303, -0.6056347, -4.56946, 0, 1, 0.7372549, 1,
-0.1122212, 0.6414086, -0.6278184, 0, 1, 0.7411765, 1,
-0.1109091, -1.071232, -3.496387, 0, 1, 0.7490196, 1,
-0.1091852, 0.6719152, 0.7953207, 0, 1, 0.7529412, 1,
-0.1090138, -0.581955, -1.921676, 0, 1, 0.7607843, 1,
-0.1072395, -0.466376, -3.594673, 0, 1, 0.7647059, 1,
-0.1009493, 0.5523854, 0.3859468, 0, 1, 0.772549, 1,
-0.09385104, -0.2477353, -2.303354, 0, 1, 0.7764706, 1,
-0.09322746, -0.5181697, -3.622857, 0, 1, 0.7843137, 1,
-0.08976892, -1.056021, -1.273099, 0, 1, 0.7882353, 1,
-0.0887371, 0.4970403, 0.5117227, 0, 1, 0.7960784, 1,
-0.08656695, 1.055069, -0.552875, 0, 1, 0.8039216, 1,
-0.08489916, -1.174486, -4.793676, 0, 1, 0.8078431, 1,
-0.08170483, -0.2686027, -2.651313, 0, 1, 0.8156863, 1,
-0.07537116, 0.9912426, -0.9101111, 0, 1, 0.8196079, 1,
-0.07334137, -1.245302, -2.762202, 0, 1, 0.827451, 1,
-0.07306141, 0.5492794, -1.270152, 0, 1, 0.8313726, 1,
-0.07236739, 0.1296602, 0.818536, 0, 1, 0.8392157, 1,
-0.07034112, -1.215751, -3.330592, 0, 1, 0.8431373, 1,
-0.06891552, 0.09059317, 0.03508772, 0, 1, 0.8509804, 1,
-0.06202972, 0.6213088, 0.45242, 0, 1, 0.854902, 1,
-0.05216547, -0.1677444, -1.036507, 0, 1, 0.8627451, 1,
-0.04584663, -0.08466254, -2.78887, 0, 1, 0.8666667, 1,
-0.04215389, -0.8270008, -4.18077, 0, 1, 0.8745098, 1,
-0.04127642, -1.440312, -3.264998, 0, 1, 0.8784314, 1,
-0.03936407, 1.836152, 0.1860137, 0, 1, 0.8862745, 1,
-0.03131725, -0.2521309, -2.441146, 0, 1, 0.8901961, 1,
-0.02876065, -0.1443352, -3.100836, 0, 1, 0.8980392, 1,
-0.02219552, -2.716555, -2.176398, 0, 1, 0.9058824, 1,
-0.01627915, -0.54897, -2.910337, 0, 1, 0.9098039, 1,
-0.008881293, -0.093038, -2.403146, 0, 1, 0.9176471, 1,
-0.007403079, -1.112335, -4.037281, 0, 1, 0.9215686, 1,
-0.005072715, 0.8451925, -0.2163502, 0, 1, 0.9294118, 1,
-0.003642815, 1.304709, 0.5575735, 0, 1, 0.9333333, 1,
0.005723741, 1.059055, -0.2202612, 0, 1, 0.9411765, 1,
0.007527532, -0.4710433, 2.064669, 0, 1, 0.945098, 1,
0.01019076, 0.4251002, -0.03836458, 0, 1, 0.9529412, 1,
0.01022157, -0.9935859, 2.877654, 0, 1, 0.9568627, 1,
0.01401107, -0.8555734, 3.338675, 0, 1, 0.9647059, 1,
0.01604757, 1.415966, -1.209177, 0, 1, 0.9686275, 1,
0.01775619, 2.583635, -0.3147209, 0, 1, 0.9764706, 1,
0.01869098, 1.191044, 0.2351025, 0, 1, 0.9803922, 1,
0.02005825, -0.2346337, 2.849556, 0, 1, 0.9882353, 1,
0.02999156, 2.258435, -1.149119, 0, 1, 0.9921569, 1,
0.03177464, 1.129351, -0.7210569, 0, 1, 1, 1,
0.0350247, -0.002466571, 2.076659, 0, 0.9921569, 1, 1,
0.03702122, 0.4749156, 0.1041301, 0, 0.9882353, 1, 1,
0.04028958, -0.2074051, 2.738116, 0, 0.9803922, 1, 1,
0.04095042, 0.4756519, 0.5973539, 0, 0.9764706, 1, 1,
0.04299366, 0.5411357, 2.222564, 0, 0.9686275, 1, 1,
0.04435187, 0.4298065, 1.488775, 0, 0.9647059, 1, 1,
0.04451096, 0.9658535, -0.2240519, 0, 0.9568627, 1, 1,
0.04523294, -0.3509975, 1.292159, 0, 0.9529412, 1, 1,
0.04765369, -0.9947125, 2.078701, 0, 0.945098, 1, 1,
0.04885686, 1.575913, -1.043725, 0, 0.9411765, 1, 1,
0.05110545, -0.8164967, 2.523072, 0, 0.9333333, 1, 1,
0.05269659, 0.9982702, 0.2088746, 0, 0.9294118, 1, 1,
0.05345112, 0.382852, -0.1135875, 0, 0.9215686, 1, 1,
0.05464781, -0.6925215, 2.175745, 0, 0.9176471, 1, 1,
0.06538445, -0.9467623, 2.089135, 0, 0.9098039, 1, 1,
0.07071073, -0.5416912, 2.111155, 0, 0.9058824, 1, 1,
0.07727523, -0.4998176, 2.555115, 0, 0.8980392, 1, 1,
0.08220498, 1.003021, 0.5820714, 0, 0.8901961, 1, 1,
0.08656031, -0.7987032, 0.8918006, 0, 0.8862745, 1, 1,
0.08935501, 0.4914852, -0.2189928, 0, 0.8784314, 1, 1,
0.09090295, -0.3676469, 1.93565, 0, 0.8745098, 1, 1,
0.09110758, -0.03365891, 1.096679, 0, 0.8666667, 1, 1,
0.09372409, 1.385404, 0.9398693, 0, 0.8627451, 1, 1,
0.0963611, -0.7425001, 2.75698, 0, 0.854902, 1, 1,
0.1029592, 0.8825617, 1.203335, 0, 0.8509804, 1, 1,
0.1097843, 1.215216, -1.840422, 0, 0.8431373, 1, 1,
0.1147179, 0.04342884, -0.2028083, 0, 0.8392157, 1, 1,
0.1170371, -1.099524, 2.748391, 0, 0.8313726, 1, 1,
0.1210582, 0.8438973, 0.3735755, 0, 0.827451, 1, 1,
0.1228364, 1.487848, -0.4807124, 0, 0.8196079, 1, 1,
0.1233945, -0.657809, 4.322556, 0, 0.8156863, 1, 1,
0.1248542, -0.06243769, 3.408085, 0, 0.8078431, 1, 1,
0.1257655, -1.160651, 2.590601, 0, 0.8039216, 1, 1,
0.1308402, -0.6107796, 1.493097, 0, 0.7960784, 1, 1,
0.1339432, 0.1337541, -0.05929617, 0, 0.7882353, 1, 1,
0.1340109, 0.8607721, -0.1639633, 0, 0.7843137, 1, 1,
0.1349322, -0.363459, 2.110762, 0, 0.7764706, 1, 1,
0.1364778, -0.3212005, 0.5865027, 0, 0.772549, 1, 1,
0.1398929, -0.9064021, 2.639078, 0, 0.7647059, 1, 1,
0.1411537, -1.427325, 5.018337, 0, 0.7607843, 1, 1,
0.1419005, 0.4710043, 2.572622, 0, 0.7529412, 1, 1,
0.1431939, 0.1462043, -0.2944541, 0, 0.7490196, 1, 1,
0.1432763, -0.09849785, 2.44963, 0, 0.7411765, 1, 1,
0.1440413, 1.418038, -0.4966664, 0, 0.7372549, 1, 1,
0.1467057, -1.215915, 3.69898, 0, 0.7294118, 1, 1,
0.1492936, 0.1545554, 1.10016, 0, 0.7254902, 1, 1,
0.1499564, -1.60282, 1.609691, 0, 0.7176471, 1, 1,
0.1523612, -0.2994982, 2.644551, 0, 0.7137255, 1, 1,
0.1564047, 0.6638879, 0.8922656, 0, 0.7058824, 1, 1,
0.1574092, -1.46235, 3.283032, 0, 0.6980392, 1, 1,
0.1619545, 0.1356349, 1.172457, 0, 0.6941177, 1, 1,
0.1658893, 1.742188, 0.5317907, 0, 0.6862745, 1, 1,
0.1660348, -2.295005, 2.555102, 0, 0.682353, 1, 1,
0.1708561, 0.9454355, -1.227477, 0, 0.6745098, 1, 1,
0.1729071, 0.5832973, 1.097821, 0, 0.6705883, 1, 1,
0.1741548, 0.1456833, 1.254151, 0, 0.6627451, 1, 1,
0.1829825, -1.37886, 2.157065, 0, 0.6588235, 1, 1,
0.1832973, -1.321281, 2.862676, 0, 0.6509804, 1, 1,
0.1883894, 1.706245, 0.10667, 0, 0.6470588, 1, 1,
0.1916437, 0.1965942, -0.159639, 0, 0.6392157, 1, 1,
0.1970346, 0.8156324, 0.4845595, 0, 0.6352941, 1, 1,
0.199047, -0.3454441, 3.898857, 0, 0.627451, 1, 1,
0.1991232, 0.2615389, 0.7083637, 0, 0.6235294, 1, 1,
0.2057458, 3.709589, 1.307207, 0, 0.6156863, 1, 1,
0.2072606, -1.761091, 2.763576, 0, 0.6117647, 1, 1,
0.2112726, -0.2001167, 1.769686, 0, 0.6039216, 1, 1,
0.2119492, -0.8671191, 3.050213, 0, 0.5960785, 1, 1,
0.2166487, -0.3322823, 2.890493, 0, 0.5921569, 1, 1,
0.2199098, -0.4937032, 4.927873, 0, 0.5843138, 1, 1,
0.2211111, 0.142448, -0.6076998, 0, 0.5803922, 1, 1,
0.2238281, -0.8539376, 3.898563, 0, 0.572549, 1, 1,
0.2239112, -0.4636561, 3.076651, 0, 0.5686275, 1, 1,
0.2251227, 2.698134, 2.075403, 0, 0.5607843, 1, 1,
0.2258944, -1.097039, 5.082686, 0, 0.5568628, 1, 1,
0.2301032, 0.2024027, 2.103952, 0, 0.5490196, 1, 1,
0.2324495, -0.1618222, 0.8578535, 0, 0.5450981, 1, 1,
0.2353752, 0.09153036, 1.39452, 0, 0.5372549, 1, 1,
0.2374651, 1.084922, 2.551303, 0, 0.5333334, 1, 1,
0.2376725, -1.309312, 5.315336, 0, 0.5254902, 1, 1,
0.2406048, -0.335774, 3.880037, 0, 0.5215687, 1, 1,
0.2425162, 0.3173372, -0.5139708, 0, 0.5137255, 1, 1,
0.2433515, 0.3752023, -0.934792, 0, 0.509804, 1, 1,
0.2448296, 1.37013, 0.7560235, 0, 0.5019608, 1, 1,
0.2466038, 0.295424, 1.110929, 0, 0.4941176, 1, 1,
0.2496945, -0.3819465, 3.076909, 0, 0.4901961, 1, 1,
0.2511449, 0.0893299, 0.8367795, 0, 0.4823529, 1, 1,
0.2528724, -0.1566052, 0.1424989, 0, 0.4784314, 1, 1,
0.2537684, 0.8701907, 1.513365, 0, 0.4705882, 1, 1,
0.2544661, 0.4789308, -2.000154, 0, 0.4666667, 1, 1,
0.2581567, 0.2505306, 0.2074797, 0, 0.4588235, 1, 1,
0.258947, -1.386379, 2.627289, 0, 0.454902, 1, 1,
0.2665128, 1.841663, 0.7050532, 0, 0.4470588, 1, 1,
0.2674364, 0.5582739, 0.4149023, 0, 0.4431373, 1, 1,
0.2677898, 0.9507502, -0.8564315, 0, 0.4352941, 1, 1,
0.271992, 1.206986, 1.276889, 0, 0.4313726, 1, 1,
0.2736308, -1.582124, 2.056382, 0, 0.4235294, 1, 1,
0.2764101, -1.790035, 2.406986, 0, 0.4196078, 1, 1,
0.2828406, -0.8069776, 2.958136, 0, 0.4117647, 1, 1,
0.285228, -1.44273, 4.022774, 0, 0.4078431, 1, 1,
0.2870309, -0.7119136, 2.486357, 0, 0.4, 1, 1,
0.2913137, 2.448078, -0.1577341, 0, 0.3921569, 1, 1,
0.2921291, -0.06973784, 1.701112, 0, 0.3882353, 1, 1,
0.2921866, 0.3029222, 0.7382318, 0, 0.3803922, 1, 1,
0.2925658, 0.2107625, 2.632649, 0, 0.3764706, 1, 1,
0.2952334, 0.6258366, -0.4412072, 0, 0.3686275, 1, 1,
0.2954744, -0.167325, 1.581308, 0, 0.3647059, 1, 1,
0.2981902, -1.623629, 3.330691, 0, 0.3568628, 1, 1,
0.3041611, 0.8939751, -0.0192815, 0, 0.3529412, 1, 1,
0.3144784, 0.4166939, -0.06802236, 0, 0.345098, 1, 1,
0.3201244, 0.04396025, 1.104851, 0, 0.3411765, 1, 1,
0.3215565, -1.917167, 3.374718, 0, 0.3333333, 1, 1,
0.3224679, -0.2401045, 2.854438, 0, 0.3294118, 1, 1,
0.3243668, -1.454749, 2.704901, 0, 0.3215686, 1, 1,
0.3263821, 0.6166778, 1.971214, 0, 0.3176471, 1, 1,
0.3315156, -0.9051234, 3.898126, 0, 0.3098039, 1, 1,
0.3342394, 0.2078228, 1.101212, 0, 0.3058824, 1, 1,
0.3350956, 0.5513756, 0.3429102, 0, 0.2980392, 1, 1,
0.3374235, -2.437949, 2.136495, 0, 0.2901961, 1, 1,
0.3420583, 0.3021157, -0.3911624, 0, 0.2862745, 1, 1,
0.3428919, 0.2098108, 0.9095953, 0, 0.2784314, 1, 1,
0.3459669, 0.5509819, 1.296868, 0, 0.2745098, 1, 1,
0.3478842, 1.001008, -0.6987331, 0, 0.2666667, 1, 1,
0.3530719, -2.047781, 4.116343, 0, 0.2627451, 1, 1,
0.3581453, -0.1206063, 1.725013, 0, 0.254902, 1, 1,
0.3645466, 0.06539852, 3.032198, 0, 0.2509804, 1, 1,
0.3651881, 0.3909304, 2.288961, 0, 0.2431373, 1, 1,
0.3654732, 1.088709, 0.230149, 0, 0.2392157, 1, 1,
0.3684314, 0.4936764, 0.3063744, 0, 0.2313726, 1, 1,
0.3690799, 1.641599, 0.8508015, 0, 0.227451, 1, 1,
0.3737129, -0.2758938, 1.940194, 0, 0.2196078, 1, 1,
0.375233, 0.3767276, -1.057966, 0, 0.2156863, 1, 1,
0.3791057, -0.9285485, 3.199865, 0, 0.2078431, 1, 1,
0.379649, 0.08325602, 1.59024, 0, 0.2039216, 1, 1,
0.3818812, -0.2592313, 2.800547, 0, 0.1960784, 1, 1,
0.3841525, -0.7040747, 2.379452, 0, 0.1882353, 1, 1,
0.385101, -1.1407, 3.523285, 0, 0.1843137, 1, 1,
0.3892643, 0.4821779, 1.261079, 0, 0.1764706, 1, 1,
0.3904195, -1.34526, 3.829962, 0, 0.172549, 1, 1,
0.3910785, -1.484944, 1.671463, 0, 0.1647059, 1, 1,
0.3920462, -0.1846646, 1.242894, 0, 0.1607843, 1, 1,
0.393712, 1.633109, -0.1488394, 0, 0.1529412, 1, 1,
0.3970997, -1.786709, 2.43266, 0, 0.1490196, 1, 1,
0.3987766, 0.3680646, -0.1102713, 0, 0.1411765, 1, 1,
0.399098, -0.7572081, 2.300452, 0, 0.1372549, 1, 1,
0.4000271, -1.102734, 3.684299, 0, 0.1294118, 1, 1,
0.4004109, 0.05607617, 1.909947, 0, 0.1254902, 1, 1,
0.40094, -0.2254837, 3.056589, 0, 0.1176471, 1, 1,
0.4011563, -0.2821586, 3.322026, 0, 0.1137255, 1, 1,
0.402348, 0.1265263, 0.3987758, 0, 0.1058824, 1, 1,
0.4034079, -0.5293558, 3.568286, 0, 0.09803922, 1, 1,
0.4036416, 0.1340084, 1.695346, 0, 0.09411765, 1, 1,
0.4080617, -0.8770256, 2.589828, 0, 0.08627451, 1, 1,
0.4097568, 0.05267916, 1.857435, 0, 0.08235294, 1, 1,
0.4131964, -0.3245431, 1.444394, 0, 0.07450981, 1, 1,
0.413623, -0.4459105, 2.626021, 0, 0.07058824, 1, 1,
0.4151386, -2.947833, 4.620487, 0, 0.0627451, 1, 1,
0.4152053, 0.1153898, 0.04320452, 0, 0.05882353, 1, 1,
0.4209313, -0.245246, 1.057315, 0, 0.05098039, 1, 1,
0.4220178, 0.009530599, 0.1387334, 0, 0.04705882, 1, 1,
0.4223997, -0.5154029, 1.830318, 0, 0.03921569, 1, 1,
0.42352, -0.3741259, 2.610576, 0, 0.03529412, 1, 1,
0.425282, -0.1328998, 3.01884, 0, 0.02745098, 1, 1,
0.4277868, 0.5543351, 1.740933, 0, 0.02352941, 1, 1,
0.4279802, 1.199488, -0.8510011, 0, 0.01568628, 1, 1,
0.4286126, -0.689064, 4.907588, 0, 0.01176471, 1, 1,
0.4316506, -0.7257788, 1.210974, 0, 0.003921569, 1, 1,
0.4485095, 0.9288154, -0.5023624, 0.003921569, 0, 1, 1,
0.449794, -1.878458, 3.495044, 0.007843138, 0, 1, 1,
0.4575554, 0.09113154, 1.112133, 0.01568628, 0, 1, 1,
0.4581502, -0.8300658, 4.213647, 0.01960784, 0, 1, 1,
0.4616041, 0.138285, 0.4936921, 0.02745098, 0, 1, 1,
0.4735145, 1.209002, 0.5082459, 0.03137255, 0, 1, 1,
0.4739322, 1.143274, -0.005218128, 0.03921569, 0, 1, 1,
0.4757004, 0.4905498, -0.2645343, 0.04313726, 0, 1, 1,
0.4804412, -0.4516941, 1.94936, 0.05098039, 0, 1, 1,
0.4816517, 0.4112677, 1.420759, 0.05490196, 0, 1, 1,
0.4841591, 0.02641575, 2.033223, 0.0627451, 0, 1, 1,
0.484445, 0.7006742, 1.249717, 0.06666667, 0, 1, 1,
0.4865099, 0.9048674, 2.284651, 0.07450981, 0, 1, 1,
0.4870374, 0.7018512, 0.3430863, 0.07843138, 0, 1, 1,
0.489609, 0.4640367, 1.131759, 0.08627451, 0, 1, 1,
0.4907149, 1.315625, 0.8553035, 0.09019608, 0, 1, 1,
0.4926392, -2.075429, 2.532446, 0.09803922, 0, 1, 1,
0.4961734, 0.8719429, -0.08820476, 0.1058824, 0, 1, 1,
0.4970336, -0.8475994, 2.25887, 0.1098039, 0, 1, 1,
0.5000249, -0.1901519, 2.81325, 0.1176471, 0, 1, 1,
0.5026964, 0.8445402, -1.076881, 0.1215686, 0, 1, 1,
0.5170068, 1.542949, -0.221564, 0.1294118, 0, 1, 1,
0.5174145, 0.9861861, -0.04299758, 0.1333333, 0, 1, 1,
0.5195357, -0.1415419, 0.2325747, 0.1411765, 0, 1, 1,
0.5290565, 0.3573983, -0.9010812, 0.145098, 0, 1, 1,
0.5357922, 0.3855003, 0.3404037, 0.1529412, 0, 1, 1,
0.541054, 0.04896864, -0.3186408, 0.1568628, 0, 1, 1,
0.5482877, 0.3411546, 1.071225, 0.1647059, 0, 1, 1,
0.5498957, 0.8814639, 0.7568641, 0.1686275, 0, 1, 1,
0.5502339, 1.398425, 0.477537, 0.1764706, 0, 1, 1,
0.5505209, -2.183507, 3.775727, 0.1803922, 0, 1, 1,
0.5527361, -0.1322804, 1.132796, 0.1882353, 0, 1, 1,
0.5546079, -0.8600292, 1.258724, 0.1921569, 0, 1, 1,
0.5586209, -0.7883366, 2.37348, 0.2, 0, 1, 1,
0.560374, 0.3055865, 1.800621, 0.2078431, 0, 1, 1,
0.5622466, -1.175624, 3.645412, 0.2117647, 0, 1, 1,
0.5649238, 1.512778, 0.1865943, 0.2196078, 0, 1, 1,
0.5651157, 0.5470656, 0.06802567, 0.2235294, 0, 1, 1,
0.5652618, -1.477633, 1.541925, 0.2313726, 0, 1, 1,
0.5804788, -1.079398, 1.752593, 0.2352941, 0, 1, 1,
0.5825746, -1.326234, -0.02509881, 0.2431373, 0, 1, 1,
0.5845397, 2.696355, 1.546067, 0.2470588, 0, 1, 1,
0.5889555, 0.2037452, 2.775137, 0.254902, 0, 1, 1,
0.5909209, 1.986096, 1.008872, 0.2588235, 0, 1, 1,
0.5935987, -2.214446, 2.945201, 0.2666667, 0, 1, 1,
0.5942962, -0.04261542, 0.07046358, 0.2705882, 0, 1, 1,
0.596569, -0.2973191, 1.749043, 0.2784314, 0, 1, 1,
0.6047908, -0.818438, 2.972373, 0.282353, 0, 1, 1,
0.6092565, -0.04784162, 2.557514, 0.2901961, 0, 1, 1,
0.6124339, -0.3210058, 2.114184, 0.2941177, 0, 1, 1,
0.6153067, -0.2922686, 2.665256, 0.3019608, 0, 1, 1,
0.6155151, -0.6067861, 2.992908, 0.3098039, 0, 1, 1,
0.6172977, 0.03461135, 2.676016, 0.3137255, 0, 1, 1,
0.6206416, 0.1171664, 2.509981, 0.3215686, 0, 1, 1,
0.6218067, -0.02427324, -0.001933587, 0.3254902, 0, 1, 1,
0.6272273, -0.06693649, 2.282613, 0.3333333, 0, 1, 1,
0.6282, 0.8675115, 0.1221203, 0.3372549, 0, 1, 1,
0.6292192, -0.5020814, 1.521128, 0.345098, 0, 1, 1,
0.6365761, -0.1569397, 1.53697, 0.3490196, 0, 1, 1,
0.6395692, 1.612917, -0.3912696, 0.3568628, 0, 1, 1,
0.6398448, 1.460406, 1.259665, 0.3607843, 0, 1, 1,
0.6460647, 0.2993127, 1.656545, 0.3686275, 0, 1, 1,
0.6543282, -1.413666, 2.989604, 0.372549, 0, 1, 1,
0.6553603, 0.7069445, -1.271246, 0.3803922, 0, 1, 1,
0.6557393, 0.09271234, 1.317977, 0.3843137, 0, 1, 1,
0.6567436, -1.239377, 2.846669, 0.3921569, 0, 1, 1,
0.6590895, 0.904149, 1.692526, 0.3960784, 0, 1, 1,
0.6598474, -0.4930654, 0.5754142, 0.4039216, 0, 1, 1,
0.6622025, 0.06569397, 1.555727, 0.4117647, 0, 1, 1,
0.666953, -0.5748383, 3.542346, 0.4156863, 0, 1, 1,
0.6709851, -1.174766, 3.261562, 0.4235294, 0, 1, 1,
0.6852365, 1.09024, 0.006532073, 0.427451, 0, 1, 1,
0.6858314, 0.6455217, 0.1918524, 0.4352941, 0, 1, 1,
0.6989857, 0.3877598, -0.4145214, 0.4392157, 0, 1, 1,
0.7022942, 0.9925518, 1.424808, 0.4470588, 0, 1, 1,
0.7085513, 0.8225697, 0.8771517, 0.4509804, 0, 1, 1,
0.7097138, -0.5983475, 2.056833, 0.4588235, 0, 1, 1,
0.7106618, 0.1492512, 1.573078, 0.4627451, 0, 1, 1,
0.7175066, -1.313334, 2.138138, 0.4705882, 0, 1, 1,
0.7178185, -0.1473314, 2.106144, 0.4745098, 0, 1, 1,
0.7195749, 0.4786668, 0.912288, 0.4823529, 0, 1, 1,
0.7206546, 0.7358282, -0.1883137, 0.4862745, 0, 1, 1,
0.7332169, 0.5716245, 0.8232561, 0.4941176, 0, 1, 1,
0.7342194, -0.4437601, 2.233304, 0.5019608, 0, 1, 1,
0.7358812, -1.017146, 2.009252, 0.5058824, 0, 1, 1,
0.7380783, -0.09387586, -1.729632, 0.5137255, 0, 1, 1,
0.7407174, -0.0876137, 1.23777, 0.5176471, 0, 1, 1,
0.7466174, -0.1367753, 1.691431, 0.5254902, 0, 1, 1,
0.7472533, -0.3127368, 2.472081, 0.5294118, 0, 1, 1,
0.7502033, 0.4665168, 2.57942, 0.5372549, 0, 1, 1,
0.7513392, 0.004072557, 2.041851, 0.5411765, 0, 1, 1,
0.7573823, -0.2423226, 1.843588, 0.5490196, 0, 1, 1,
0.7599735, -1.517223, 1.595474, 0.5529412, 0, 1, 1,
0.7682903, 1.08077, 0.08588132, 0.5607843, 0, 1, 1,
0.770081, -0.1332692, 0.6624683, 0.5647059, 0, 1, 1,
0.772203, -0.5307565, 3.883826, 0.572549, 0, 1, 1,
0.7753405, -1.269606, 2.031074, 0.5764706, 0, 1, 1,
0.7825253, 0.4349609, 0.9549012, 0.5843138, 0, 1, 1,
0.7832707, 0.770204, 0.2354852, 0.5882353, 0, 1, 1,
0.7849975, 0.03521883, 1.463335, 0.5960785, 0, 1, 1,
0.7883017, 0.09230554, 1.015439, 0.6039216, 0, 1, 1,
0.7883514, -0.3672346, 1.134777, 0.6078432, 0, 1, 1,
0.7922471, 0.738234, -0.02438203, 0.6156863, 0, 1, 1,
0.7934843, 0.4942602, 0.5254802, 0.6196079, 0, 1, 1,
0.7973225, -1.222349, 0.913891, 0.627451, 0, 1, 1,
0.8029796, 1.893431, 0.9977831, 0.6313726, 0, 1, 1,
0.8050867, 0.9547136, 1.852286, 0.6392157, 0, 1, 1,
0.8065951, -0.4171536, 1.619964, 0.6431373, 0, 1, 1,
0.8081882, 0.2135132, -0.1547106, 0.6509804, 0, 1, 1,
0.8095017, 1.121945, 0.8019338, 0.654902, 0, 1, 1,
0.81747, -0.6460896, 1.418973, 0.6627451, 0, 1, 1,
0.8189933, -1.445255, 1.553271, 0.6666667, 0, 1, 1,
0.8243873, -0.2924932, 3.415657, 0.6745098, 0, 1, 1,
0.8306789, -0.6303027, 4.284652, 0.6784314, 0, 1, 1,
0.8332231, 0.3291248, 0.6014988, 0.6862745, 0, 1, 1,
0.8376933, -0.3747865, 1.470916, 0.6901961, 0, 1, 1,
0.840444, -0.3626712, 1.673983, 0.6980392, 0, 1, 1,
0.851427, 0.4240784, 0.4008647, 0.7058824, 0, 1, 1,
0.8555913, 1.812588, -0.6885567, 0.7098039, 0, 1, 1,
0.8557385, 0.003275047, 1.338857, 0.7176471, 0, 1, 1,
0.860054, 0.3681082, 2.047225, 0.7215686, 0, 1, 1,
0.8619924, 0.294417, 1.70511, 0.7294118, 0, 1, 1,
0.8676457, -0.08367056, 2.152964, 0.7333333, 0, 1, 1,
0.8686665, -0.4962344, 1.64989, 0.7411765, 0, 1, 1,
0.8689278, -0.3037201, 2.900478, 0.7450981, 0, 1, 1,
0.8695662, 1.363372, 2.14519, 0.7529412, 0, 1, 1,
0.8741858, 1.389827, 0.2159487, 0.7568628, 0, 1, 1,
0.8760879, -0.3098101, 1.559198, 0.7647059, 0, 1, 1,
0.8784121, 0.003685226, 1.065589, 0.7686275, 0, 1, 1,
0.8817859, -0.1155895, 3.296971, 0.7764706, 0, 1, 1,
0.8823428, -0.6463569, 3.426154, 0.7803922, 0, 1, 1,
0.8876141, 1.445649, 2.276167, 0.7882353, 0, 1, 1,
0.8883486, -0.9650272, 2.321582, 0.7921569, 0, 1, 1,
0.8898698, -1.130546, 3.226062, 0.8, 0, 1, 1,
0.8919768, -1.441284, 3.624554, 0.8078431, 0, 1, 1,
0.8953315, -0.1914829, 2.05667, 0.8117647, 0, 1, 1,
0.8958988, -1.868579, 3.031561, 0.8196079, 0, 1, 1,
0.8959664, 0.8815649, 2.023347, 0.8235294, 0, 1, 1,
0.8963639, 0.5308333, 1.778731, 0.8313726, 0, 1, 1,
0.9007524, -1.528311, 1.281314, 0.8352941, 0, 1, 1,
0.9010975, -0.09591494, 1.529542, 0.8431373, 0, 1, 1,
0.9029819, -0.09538659, 2.30052, 0.8470588, 0, 1, 1,
0.9155666, -0.4844891, 1.996397, 0.854902, 0, 1, 1,
0.9185262, 0.5732978, 0.8706775, 0.8588235, 0, 1, 1,
0.9235305, -0.03448058, 2.28198, 0.8666667, 0, 1, 1,
0.9351912, -0.422894, 2.180363, 0.8705882, 0, 1, 1,
0.9401496, -1.614587, 1.977993, 0.8784314, 0, 1, 1,
0.9420657, -0.2201305, 0.9183921, 0.8823529, 0, 1, 1,
0.9454777, 1.488498, 1.45679, 0.8901961, 0, 1, 1,
0.9463517, -1.337307, 3.944842, 0.8941177, 0, 1, 1,
0.9467496, 2.089848, 1.642638, 0.9019608, 0, 1, 1,
0.9473439, -0.361173, 3.003062, 0.9098039, 0, 1, 1,
0.9482548, 1.718871, 0.1613802, 0.9137255, 0, 1, 1,
0.9533451, 1.492486, 0.966301, 0.9215686, 0, 1, 1,
0.953488, -1.575674, 3.069871, 0.9254902, 0, 1, 1,
0.9562764, -0.7558481, 0.9951537, 0.9333333, 0, 1, 1,
0.9581183, 1.424091, 1.53135, 0.9372549, 0, 1, 1,
0.9581658, -0.2969124, 2.454222, 0.945098, 0, 1, 1,
0.9645889, 2.933604, 1.147454, 0.9490196, 0, 1, 1,
0.9679474, 1.28868, 0.0360328, 0.9568627, 0, 1, 1,
0.9771268, 0.3245812, 1.32208, 0.9607843, 0, 1, 1,
0.9785957, 1.507829, -0.7646231, 0.9686275, 0, 1, 1,
0.9787593, 0.7327737, 0.4361348, 0.972549, 0, 1, 1,
0.9891724, 1.070894, 1.304995, 0.9803922, 0, 1, 1,
0.9896387, -0.122904, 1.626295, 0.9843137, 0, 1, 1,
0.9989901, -0.2710495, 2.504173, 0.9921569, 0, 1, 1,
1.015059, 0.4754866, 2.759953, 0.9960784, 0, 1, 1,
1.02087, -0.8947784, 2.977532, 1, 0, 0.9960784, 1,
1.021191, 1.558139, 2.590306, 1, 0, 0.9882353, 1,
1.029192, -2.041703, 2.747117, 1, 0, 0.9843137, 1,
1.030253, -0.2787271, 2.766749, 1, 0, 0.9764706, 1,
1.030931, 0.006530021, 0.6069132, 1, 0, 0.972549, 1,
1.035237, -0.7976536, 3.289071, 1, 0, 0.9647059, 1,
1.035344, 0.02641179, 1.546744, 1, 0, 0.9607843, 1,
1.036542, -0.06990935, 1.764497, 1, 0, 0.9529412, 1,
1.040487, 0.5761996, 0.7941211, 1, 0, 0.9490196, 1,
1.04253, -1.549217, 1.490967, 1, 0, 0.9411765, 1,
1.045259, -0.2647548, 2.482872, 1, 0, 0.9372549, 1,
1.04669, -0.3914971, 2.452734, 1, 0, 0.9294118, 1,
1.047231, 1.468696, 1.899546, 1, 0, 0.9254902, 1,
1.054047, -0.7099488, 3.09584, 1, 0, 0.9176471, 1,
1.057837, 1.780597, 0.9615194, 1, 0, 0.9137255, 1,
1.071445, -1.884198, 1.870484, 1, 0, 0.9058824, 1,
1.08047, -0.6385813, 1.271152, 1, 0, 0.9019608, 1,
1.081509, 1.26423, -0.1187345, 1, 0, 0.8941177, 1,
1.089898, -0.9905638, 1.647154, 1, 0, 0.8862745, 1,
1.096709, 0.3675418, 2.691363, 1, 0, 0.8823529, 1,
1.099529, -1.717127, 2.661642, 1, 0, 0.8745098, 1,
1.100223, 0.2689613, 1.98777, 1, 0, 0.8705882, 1,
1.11289, 0.2723497, 0.374766, 1, 0, 0.8627451, 1,
1.129324, -0.9168203, 1.613582, 1, 0, 0.8588235, 1,
1.136104, -0.8709491, 0.7476131, 1, 0, 0.8509804, 1,
1.141298, 1.279455, 0.2557097, 1, 0, 0.8470588, 1,
1.1578, 0.6505321, 0.4159869, 1, 0, 0.8392157, 1,
1.164985, -2.826453, 0.8986222, 1, 0, 0.8352941, 1,
1.166531, 0.143325, 2.232865, 1, 0, 0.827451, 1,
1.17831, -0.1450519, 0.1374243, 1, 0, 0.8235294, 1,
1.193136, 0.5038637, 2.38356, 1, 0, 0.8156863, 1,
1.198735, 0.8532971, 0.8030085, 1, 0, 0.8117647, 1,
1.199732, 0.5044531, 2.061127, 1, 0, 0.8039216, 1,
1.201016, -1.611352, 2.190905, 1, 0, 0.7960784, 1,
1.202755, -0.2602657, 1.769573, 1, 0, 0.7921569, 1,
1.202771, 0.9867393, 2.040378, 1, 0, 0.7843137, 1,
1.206567, -0.2690383, 1.081622, 1, 0, 0.7803922, 1,
1.209739, -0.4061477, 0.2948896, 1, 0, 0.772549, 1,
1.211016, 0.008557325, 2.656401, 1, 0, 0.7686275, 1,
1.215294, 1.044056, 1.576701, 1, 0, 0.7607843, 1,
1.215581, -1.258461, 2.348772, 1, 0, 0.7568628, 1,
1.216267, -1.178046, 3.303664, 1, 0, 0.7490196, 1,
1.216902, -0.2924725, 2.404084, 1, 0, 0.7450981, 1,
1.220318, -1.035024, 3.750628, 1, 0, 0.7372549, 1,
1.22692, 1.694525, 0.6622688, 1, 0, 0.7333333, 1,
1.233308, -0.5463295, 1.54451, 1, 0, 0.7254902, 1,
1.235003, -0.8503787, -0.3329009, 1, 0, 0.7215686, 1,
1.235988, -1.047285, 1.847807, 1, 0, 0.7137255, 1,
1.238623, 0.4014054, 0.8237571, 1, 0, 0.7098039, 1,
1.239811, -0.432499, 3.267253, 1, 0, 0.7019608, 1,
1.245041, 0.01652499, 2.58024, 1, 0, 0.6941177, 1,
1.247887, 0.4411117, 2.6001, 1, 0, 0.6901961, 1,
1.249241, -0.9741549, 1.526675, 1, 0, 0.682353, 1,
1.257737, -1.593216, 1.45537, 1, 0, 0.6784314, 1,
1.266197, 0.7805749, 0.698498, 1, 0, 0.6705883, 1,
1.278148, -0.2154398, 0.5443095, 1, 0, 0.6666667, 1,
1.278754, 0.3409159, 3.022115, 1, 0, 0.6588235, 1,
1.291595, -0.05068866, 0.8518285, 1, 0, 0.654902, 1,
1.29379, 1.318715, -0.7257362, 1, 0, 0.6470588, 1,
1.293911, -0.1096522, 0.4680883, 1, 0, 0.6431373, 1,
1.297786, -1.799049, 4.159431, 1, 0, 0.6352941, 1,
1.304683, 0.5962023, 0.6697503, 1, 0, 0.6313726, 1,
1.306219, 0.9199419, 0.818583, 1, 0, 0.6235294, 1,
1.309858, -1.120311, 2.420787, 1, 0, 0.6196079, 1,
1.309992, -0.3835579, 0.3999345, 1, 0, 0.6117647, 1,
1.315918, -1.027561, 2.873982, 1, 0, 0.6078432, 1,
1.317472, -0.1552583, 3.3682, 1, 0, 0.6, 1,
1.320639, 0.7267804, -0.2140093, 1, 0, 0.5921569, 1,
1.323008, -0.871002, 2.862316, 1, 0, 0.5882353, 1,
1.32786, 0.6121064, 2.260076, 1, 0, 0.5803922, 1,
1.329802, 0.5525467, 0.4413555, 1, 0, 0.5764706, 1,
1.333087, 0.6610888, -0.1450339, 1, 0, 0.5686275, 1,
1.339425, 0.3341872, 2.462977, 1, 0, 0.5647059, 1,
1.356842, 0.59183, 1.151957, 1, 0, 0.5568628, 1,
1.364239, 0.7017351, 2.158262, 1, 0, 0.5529412, 1,
1.37166, -1.762849, 2.662789, 1, 0, 0.5450981, 1,
1.371792, 0.4360774, 1.862532, 1, 0, 0.5411765, 1,
1.385918, -2.467314, 2.850976, 1, 0, 0.5333334, 1,
1.386005, -0.8033587, 0.9615148, 1, 0, 0.5294118, 1,
1.389813, -0.7150047, 4.48084, 1, 0, 0.5215687, 1,
1.395469, 1.990377, 1.455473, 1, 0, 0.5176471, 1,
1.399223, -0.2879525, 1.615646, 1, 0, 0.509804, 1,
1.401221, -0.2249582, 4.43097, 1, 0, 0.5058824, 1,
1.414899, -1.640948, 2.990618, 1, 0, 0.4980392, 1,
1.436495, 0.9867478, 0.02704027, 1, 0, 0.4901961, 1,
1.455008, 1.136982, 2.677291, 1, 0, 0.4862745, 1,
1.47814, -0.5477878, 2.936558, 1, 0, 0.4784314, 1,
1.48114, 0.09385947, 1.339616, 1, 0, 0.4745098, 1,
1.497482, -1.817117, 3.810224, 1, 0, 0.4666667, 1,
1.498966, 0.6603801, 0.6561032, 1, 0, 0.4627451, 1,
1.516086, 0.5485499, 2.047227, 1, 0, 0.454902, 1,
1.526928, 0.1112993, 0.2201922, 1, 0, 0.4509804, 1,
1.527253, -1.444054, 1.822187, 1, 0, 0.4431373, 1,
1.533333, 0.8564317, 0.4767317, 1, 0, 0.4392157, 1,
1.537237, 0.5282719, 0.6679494, 1, 0, 0.4313726, 1,
1.541249, -1.511504, 5.015216, 1, 0, 0.427451, 1,
1.577492, 0.4932339, 1.273181, 1, 0, 0.4196078, 1,
1.578113, 0.4267015, 1.304323, 1, 0, 0.4156863, 1,
1.579576, 0.1556131, 0.1583744, 1, 0, 0.4078431, 1,
1.588118, -0.3506416, 2.92292, 1, 0, 0.4039216, 1,
1.597003, -0.4376633, 3.026584, 1, 0, 0.3960784, 1,
1.600072, -0.02684491, 0.760825, 1, 0, 0.3882353, 1,
1.611346, 0.3263133, 0.6756155, 1, 0, 0.3843137, 1,
1.632555, 0.7129608, 1.391994, 1, 0, 0.3764706, 1,
1.636783, -1.240927, 1.823862, 1, 0, 0.372549, 1,
1.65162, 0.2060895, 2.370508, 1, 0, 0.3647059, 1,
1.667247, -0.5154551, 1.562628, 1, 0, 0.3607843, 1,
1.668417, 0.3033157, -0.6302937, 1, 0, 0.3529412, 1,
1.671117, 0.1402808, 1.484622, 1, 0, 0.3490196, 1,
1.672155, 0.02257422, 0.4233525, 1, 0, 0.3411765, 1,
1.679446, -0.9082454, 3.523519, 1, 0, 0.3372549, 1,
1.68147, 0.7944114, 2.399035, 1, 0, 0.3294118, 1,
1.686937, 0.3714388, 0.7352231, 1, 0, 0.3254902, 1,
1.691352, -0.3752402, 1.707835, 1, 0, 0.3176471, 1,
1.692777, 1.020451, -0.177576, 1, 0, 0.3137255, 1,
1.723157, -0.8052673, 1.042777, 1, 0, 0.3058824, 1,
1.729325, -1.971247, 5.048235, 1, 0, 0.2980392, 1,
1.754258, -0.2919141, 1.898338, 1, 0, 0.2941177, 1,
1.756566, -1.888019, 1.196839, 1, 0, 0.2862745, 1,
1.790337, 0.4997216, 0.8434585, 1, 0, 0.282353, 1,
1.807038, -0.2448192, 1.493849, 1, 0, 0.2745098, 1,
1.820864, -0.09597808, 1.487746, 1, 0, 0.2705882, 1,
1.835767, 0.9535474, 0.6928998, 1, 0, 0.2627451, 1,
1.867775, -1.183064, 1.84352, 1, 0, 0.2588235, 1,
1.901379, 2.989896, 0.3577375, 1, 0, 0.2509804, 1,
1.942104, 0.488202, -1.142457, 1, 0, 0.2470588, 1,
1.954602, 0.5926736, 0.6232132, 1, 0, 0.2392157, 1,
1.997631, 0.2852961, -0.2105032, 1, 0, 0.2352941, 1,
2.013197, 0.8672019, 1.979271, 1, 0, 0.227451, 1,
2.033498, 1.014506, 0.3532494, 1, 0, 0.2235294, 1,
2.064579, 0.8036237, 1.108975, 1, 0, 0.2156863, 1,
2.067413, 1.045514, 0.2456385, 1, 0, 0.2117647, 1,
2.082111, 0.269646, 1.023164, 1, 0, 0.2039216, 1,
2.089835, 0.4228622, 0.8068128, 1, 0, 0.1960784, 1,
2.107183, 0.5518883, -1.374439, 1, 0, 0.1921569, 1,
2.117584, 1.163477, 1.23737, 1, 0, 0.1843137, 1,
2.165188, -0.7241138, 3.091127, 1, 0, 0.1803922, 1,
2.168069, 0.2323367, 2.200876, 1, 0, 0.172549, 1,
2.17136, 2.035204, 4.03983, 1, 0, 0.1686275, 1,
2.240863, -0.5643325, 2.451091, 1, 0, 0.1607843, 1,
2.244108, -2.25169, 1.787529, 1, 0, 0.1568628, 1,
2.251779, 0.2709366, -0.7240798, 1, 0, 0.1490196, 1,
2.291018, 0.4473988, 0.8816571, 1, 0, 0.145098, 1,
2.303097, -0.3350344, 1.876241, 1, 0, 0.1372549, 1,
2.320502, -0.3629946, 1.815604, 1, 0, 0.1333333, 1,
2.382528, 0.4395746, 1.556616, 1, 0, 0.1254902, 1,
2.385635, -0.2521857, 0.260533, 1, 0, 0.1215686, 1,
2.390038, -0.316712, 1.152967, 1, 0, 0.1137255, 1,
2.394664, 0.2788099, 0.9706221, 1, 0, 0.1098039, 1,
2.4112, 0.2931974, 2.810254, 1, 0, 0.1019608, 1,
2.430628, 1.884788, 1.802706, 1, 0, 0.09411765, 1,
2.438533, -0.2226645, 3.297315, 1, 0, 0.09019608, 1,
2.451977, -0.4716812, 3.623983, 1, 0, 0.08235294, 1,
2.465535, 1.67756, 0.03289375, 1, 0, 0.07843138, 1,
2.471865, 0.7109812, 0.3762187, 1, 0, 0.07058824, 1,
2.571867, -0.03251965, -0.1285212, 1, 0, 0.06666667, 1,
2.617935, 0.8686157, 1.938821, 1, 0, 0.05882353, 1,
2.699655, 1.835136, -0.7095444, 1, 0, 0.05490196, 1,
2.700085, 0.5768945, 1.093275, 1, 0, 0.04705882, 1,
2.761905, -0.5376206, 2.463461, 1, 0, 0.04313726, 1,
2.776493, 1.137759, 1.586536, 1, 0, 0.03529412, 1,
2.801551, -0.7949848, 1.224645, 1, 0, 0.03137255, 1,
2.868125, -0.6628802, 1.003682, 1, 0, 0.02352941, 1,
2.930421, -0.1422548, 2.2738, 1, 0, 0.01960784, 1,
2.932451, -0.267957, 0.8727821, 1, 0, 0.01176471, 1,
3.175071, 0.3367253, 0.8192747, 1, 0, 0.007843138, 1
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
-0.2747402, -5.022809, -7.98164, 0, -0.5, 0.5, 0.5,
-0.2747402, -5.022809, -7.98164, 1, -0.5, 0.5, 0.5,
-0.2747402, -5.022809, -7.98164, 1, 1.5, 0.5, 0.5,
-0.2747402, -5.022809, -7.98164, 0, 1.5, 0.5, 0.5
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
-4.894038, -0.02380025, -7.98164, 0, -0.5, 0.5, 0.5,
-4.894038, -0.02380025, -7.98164, 1, -0.5, 0.5, 0.5,
-4.894038, -0.02380025, -7.98164, 1, 1.5, 0.5, 0.5,
-4.894038, -0.02380025, -7.98164, 0, 1.5, 0.5, 0.5
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
-4.894038, -5.022809, -0.3695617, 0, -0.5, 0.5, 0.5,
-4.894038, -5.022809, -0.3695617, 1, -0.5, 0.5, 0.5,
-4.894038, -5.022809, -0.3695617, 1, 1.5, 0.5, 0.5,
-4.894038, -5.022809, -0.3695617, 0, 1.5, 0.5, 0.5
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
-3, -3.869191, -6.225007,
3, -3.869191, -6.225007,
-3, -3.869191, -6.225007,
-3, -4.061461, -6.517779,
-2, -3.869191, -6.225007,
-2, -4.061461, -6.517779,
-1, -3.869191, -6.225007,
-1, -4.061461, -6.517779,
0, -3.869191, -6.225007,
0, -4.061461, -6.517779,
1, -3.869191, -6.225007,
1, -4.061461, -6.517779,
2, -3.869191, -6.225007,
2, -4.061461, -6.517779,
3, -3.869191, -6.225007,
3, -4.061461, -6.517779
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
-3, -4.446, -7.103323, 0, -0.5, 0.5, 0.5,
-3, -4.446, -7.103323, 1, -0.5, 0.5, 0.5,
-3, -4.446, -7.103323, 1, 1.5, 0.5, 0.5,
-3, -4.446, -7.103323, 0, 1.5, 0.5, 0.5,
-2, -4.446, -7.103323, 0, -0.5, 0.5, 0.5,
-2, -4.446, -7.103323, 1, -0.5, 0.5, 0.5,
-2, -4.446, -7.103323, 1, 1.5, 0.5, 0.5,
-2, -4.446, -7.103323, 0, 1.5, 0.5, 0.5,
-1, -4.446, -7.103323, 0, -0.5, 0.5, 0.5,
-1, -4.446, -7.103323, 1, -0.5, 0.5, 0.5,
-1, -4.446, -7.103323, 1, 1.5, 0.5, 0.5,
-1, -4.446, -7.103323, 0, 1.5, 0.5, 0.5,
0, -4.446, -7.103323, 0, -0.5, 0.5, 0.5,
0, -4.446, -7.103323, 1, -0.5, 0.5, 0.5,
0, -4.446, -7.103323, 1, 1.5, 0.5, 0.5,
0, -4.446, -7.103323, 0, 1.5, 0.5, 0.5,
1, -4.446, -7.103323, 0, -0.5, 0.5, 0.5,
1, -4.446, -7.103323, 1, -0.5, 0.5, 0.5,
1, -4.446, -7.103323, 1, 1.5, 0.5, 0.5,
1, -4.446, -7.103323, 0, 1.5, 0.5, 0.5,
2, -4.446, -7.103323, 0, -0.5, 0.5, 0.5,
2, -4.446, -7.103323, 1, -0.5, 0.5, 0.5,
2, -4.446, -7.103323, 1, 1.5, 0.5, 0.5,
2, -4.446, -7.103323, 0, 1.5, 0.5, 0.5,
3, -4.446, -7.103323, 0, -0.5, 0.5, 0.5,
3, -4.446, -7.103323, 1, -0.5, 0.5, 0.5,
3, -4.446, -7.103323, 1, 1.5, 0.5, 0.5,
3, -4.446, -7.103323, 0, 1.5, 0.5, 0.5
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
-3.828046, -2, -6.225007,
-3.828046, 2, -6.225007,
-3.828046, -2, -6.225007,
-4.005712, -2, -6.517779,
-3.828046, 0, -6.225007,
-4.005712, 0, -6.517779,
-3.828046, 2, -6.225007,
-4.005712, 2, -6.517779
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
-4.361042, -2, -7.103323, 0, -0.5, 0.5, 0.5,
-4.361042, -2, -7.103323, 1, -0.5, 0.5, 0.5,
-4.361042, -2, -7.103323, 1, 1.5, 0.5, 0.5,
-4.361042, -2, -7.103323, 0, 1.5, 0.5, 0.5,
-4.361042, 0, -7.103323, 0, -0.5, 0.5, 0.5,
-4.361042, 0, -7.103323, 1, -0.5, 0.5, 0.5,
-4.361042, 0, -7.103323, 1, 1.5, 0.5, 0.5,
-4.361042, 0, -7.103323, 0, 1.5, 0.5, 0.5,
-4.361042, 2, -7.103323, 0, -0.5, 0.5, 0.5,
-4.361042, 2, -7.103323, 1, -0.5, 0.5, 0.5,
-4.361042, 2, -7.103323, 1, 1.5, 0.5, 0.5,
-4.361042, 2, -7.103323, 0, 1.5, 0.5, 0.5
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
-3.828046, -3.869191, -6,
-3.828046, -3.869191, 4,
-3.828046, -3.869191, -6,
-4.005712, -4.061461, -6,
-3.828046, -3.869191, -4,
-4.005712, -4.061461, -4,
-3.828046, -3.869191, -2,
-4.005712, -4.061461, -2,
-3.828046, -3.869191, 0,
-4.005712, -4.061461, 0,
-3.828046, -3.869191, 2,
-4.005712, -4.061461, 2,
-3.828046, -3.869191, 4,
-4.005712, -4.061461, 4
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
"-6",
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
-4.361042, -4.446, -6, 0, -0.5, 0.5, 0.5,
-4.361042, -4.446, -6, 1, -0.5, 0.5, 0.5,
-4.361042, -4.446, -6, 1, 1.5, 0.5, 0.5,
-4.361042, -4.446, -6, 0, 1.5, 0.5, 0.5,
-4.361042, -4.446, -4, 0, -0.5, 0.5, 0.5,
-4.361042, -4.446, -4, 1, -0.5, 0.5, 0.5,
-4.361042, -4.446, -4, 1, 1.5, 0.5, 0.5,
-4.361042, -4.446, -4, 0, 1.5, 0.5, 0.5,
-4.361042, -4.446, -2, 0, -0.5, 0.5, 0.5,
-4.361042, -4.446, -2, 1, -0.5, 0.5, 0.5,
-4.361042, -4.446, -2, 1, 1.5, 0.5, 0.5,
-4.361042, -4.446, -2, 0, 1.5, 0.5, 0.5,
-4.361042, -4.446, 0, 0, -0.5, 0.5, 0.5,
-4.361042, -4.446, 0, 1, -0.5, 0.5, 0.5,
-4.361042, -4.446, 0, 1, 1.5, 0.5, 0.5,
-4.361042, -4.446, 0, 0, 1.5, 0.5, 0.5,
-4.361042, -4.446, 2, 0, -0.5, 0.5, 0.5,
-4.361042, -4.446, 2, 1, -0.5, 0.5, 0.5,
-4.361042, -4.446, 2, 1, 1.5, 0.5, 0.5,
-4.361042, -4.446, 2, 0, 1.5, 0.5, 0.5,
-4.361042, -4.446, 4, 0, -0.5, 0.5, 0.5,
-4.361042, -4.446, 4, 1, -0.5, 0.5, 0.5,
-4.361042, -4.446, 4, 1, 1.5, 0.5, 0.5,
-4.361042, -4.446, 4, 0, 1.5, 0.5, 0.5
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
-3.828046, -3.869191, -6.225007,
-3.828046, 3.821591, -6.225007,
-3.828046, -3.869191, 5.485883,
-3.828046, 3.821591, 5.485883,
-3.828046, -3.869191, -6.225007,
-3.828046, -3.869191, 5.485883,
-3.828046, 3.821591, -6.225007,
-3.828046, 3.821591, 5.485883,
-3.828046, -3.869191, -6.225007,
3.278566, -3.869191, -6.225007,
-3.828046, -3.869191, 5.485883,
3.278566, -3.869191, 5.485883,
-3.828046, 3.821591, -6.225007,
3.278566, 3.821591, -6.225007,
-3.828046, 3.821591, 5.485883,
3.278566, 3.821591, 5.485883,
3.278566, -3.869191, -6.225007,
3.278566, 3.821591, -6.225007,
3.278566, -3.869191, 5.485883,
3.278566, 3.821591, 5.485883,
3.278566, -3.869191, -6.225007,
3.278566, -3.869191, 5.485883,
3.278566, 3.821591, -6.225007,
3.278566, 3.821591, 5.485883
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
var radius = 8.388715;
var distance = 37.32234;
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
mvMatrix.translate( 0.2747402, 0.02380025, 0.3695617 );
mvMatrix.scale( 1.276282, 1.179339, 0.7744964 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.32234);
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
hydroxyhippuric_acid<-read.table("hydroxyhippuric_acid.xyz")
```

```
## Error in read.table("hydroxyhippuric_acid.xyz"): no lines available in input
```

```r
x<-hydroxyhippuric_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyhippuric_acid' not found
```

```r
y<-hydroxyhippuric_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyhippuric_acid' not found
```

```r
z<-hydroxyhippuric_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyhippuric_acid' not found
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
-3.724552, -0.9415581, -1.197043, 0, 0, 1, 1, 1,
-2.956543, 0.5240135, -2.40544, 1, 0, 0, 1, 1,
-2.855275, 0.496379, -2.624506, 1, 0, 0, 1, 1,
-2.733257, -0.05577189, -1.335226, 1, 0, 0, 1, 1,
-2.605411, -0.1713102, -2.29958, 1, 0, 0, 1, 1,
-2.592347, -0.4838616, -2.438374, 1, 0, 0, 1, 1,
-2.512666, -2.438656, -4.10187, 0, 0, 0, 1, 1,
-2.490935, -2.152276, -2.076358, 0, 0, 0, 1, 1,
-2.487587, -0.03641796, -1.750235, 0, 0, 0, 1, 1,
-2.465295, 1.350329, -3.247158, 0, 0, 0, 1, 1,
-2.459051, 0.2231038, -1.710851, 0, 0, 0, 1, 1,
-2.446772, -1.010059, -1.711073, 0, 0, 0, 1, 1,
-2.346853, 2.416315, -0.2029132, 0, 0, 0, 1, 1,
-2.326098, -0.4654291, -1.516902, 1, 1, 1, 1, 1,
-2.303323, 0.417559, -1.790253, 1, 1, 1, 1, 1,
-2.30109, 0.6028271, -2.044919, 1, 1, 1, 1, 1,
-2.27151, -0.386312, -0.8164842, 1, 1, 1, 1, 1,
-2.229532, -0.06245445, -1.246161, 1, 1, 1, 1, 1,
-2.217745, 0.3565434, -2.264208, 1, 1, 1, 1, 1,
-2.158312, -0.09929545, -0.4642053, 1, 1, 1, 1, 1,
-2.121035, 0.4891773, -1.707482, 1, 1, 1, 1, 1,
-2.11812, 0.1016206, -1.397608, 1, 1, 1, 1, 1,
-2.105792, -0.07316048, -1.464487, 1, 1, 1, 1, 1,
-2.076214, 1.252161, -1.918872, 1, 1, 1, 1, 1,
-2.063008, 0.8283601, -1.397256, 1, 1, 1, 1, 1,
-2.034678, 1.184704, -1.346824, 1, 1, 1, 1, 1,
-2.007813, 0.01659794, -0.3293718, 1, 1, 1, 1, 1,
-1.98956, -0.2909271, 1.251805, 1, 1, 1, 1, 1,
-1.978864, 1.162422, 0.3191103, 0, 0, 1, 1, 1,
-1.965175, -0.7152307, -0.5653099, 1, 0, 0, 1, 1,
-1.953814, -0.8807117, -1.455697, 1, 0, 0, 1, 1,
-1.874987, -0.7262691, -1.69228, 1, 0, 0, 1, 1,
-1.864902, -0.6106869, -1.069988, 1, 0, 0, 1, 1,
-1.86321, -0.5202779, -2.736362, 1, 0, 0, 1, 1,
-1.855165, -1.057605, -0.1166616, 0, 0, 0, 1, 1,
-1.84706, 0.04701328, -3.022386, 0, 0, 0, 1, 1,
-1.842124, -0.4400996, -2.965309, 0, 0, 0, 1, 1,
-1.82692, 0.5943874, -0.7698323, 0, 0, 0, 1, 1,
-1.813136, 0.1013836, -0.387861, 0, 0, 0, 1, 1,
-1.797668, -0.1976565, -2.928328, 0, 0, 0, 1, 1,
-1.789164, -1.224812, -4.043469, 0, 0, 0, 1, 1,
-1.776915, 1.434847, -0.7921551, 1, 1, 1, 1, 1,
-1.774251, -0.683844, -1.383338, 1, 1, 1, 1, 1,
-1.763609, 0.5510342, -1.569627, 1, 1, 1, 1, 1,
-1.756992, 0.2352957, -0.4822434, 1, 1, 1, 1, 1,
-1.743169, 0.1858642, -0.2604796, 1, 1, 1, 1, 1,
-1.728443, -0.7290191, -2.472323, 1, 1, 1, 1, 1,
-1.716281, -1.430157, -3.413566, 1, 1, 1, 1, 1,
-1.714835, -1.075373, -1.375592, 1, 1, 1, 1, 1,
-1.710883, -0.3376154, -1.817658, 1, 1, 1, 1, 1,
-1.70276, -0.9692163, -3.271879, 1, 1, 1, 1, 1,
-1.701938, 0.6795774, -1.8495, 1, 1, 1, 1, 1,
-1.695457, 0.1474117, -3.163519, 1, 1, 1, 1, 1,
-1.683318, -1.252847, -3.67049, 1, 1, 1, 1, 1,
-1.666536, -1.387106, -2.280367, 1, 1, 1, 1, 1,
-1.664122, -1.160741, -1.78249, 1, 1, 1, 1, 1,
-1.658397, 1.753835, -1.248029, 0, 0, 1, 1, 1,
-1.648155, -1.172414, -3.444982, 1, 0, 0, 1, 1,
-1.641224, -0.8595714, -1.283553, 1, 0, 0, 1, 1,
-1.617283, -0.6400837, -3.482019, 1, 0, 0, 1, 1,
-1.616983, -1.38984, -2.698717, 1, 0, 0, 1, 1,
-1.604311, -0.958613, -3.505773, 1, 0, 0, 1, 1,
-1.585526, 0.6689063, -1.316178, 0, 0, 0, 1, 1,
-1.577292, 0.5061634, -0.1398576, 0, 0, 0, 1, 1,
-1.554851, -0.9828431, -1.609541, 0, 0, 0, 1, 1,
-1.552271, -2.073858, -2.677108, 0, 0, 0, 1, 1,
-1.548594, 0.2713983, -1.455311, 0, 0, 0, 1, 1,
-1.542808, 1.137161, -0.9807674, 0, 0, 0, 1, 1,
-1.53815, -1.066038, -1.093698, 0, 0, 0, 1, 1,
-1.533593, -0.9328921, -2.350109, 1, 1, 1, 1, 1,
-1.528204, -1.575455, -2.882004, 1, 1, 1, 1, 1,
-1.518502, -1.446512, -1.652642, 1, 1, 1, 1, 1,
-1.51521, -1.219953, -3.026828, 1, 1, 1, 1, 1,
-1.510226, -0.158151, -2.273074, 1, 1, 1, 1, 1,
-1.508949, -1.45748, -1.88481, 1, 1, 1, 1, 1,
-1.47749, 0.5258507, -0.2750171, 1, 1, 1, 1, 1,
-1.468703, -3.75719, -3.385704, 1, 1, 1, 1, 1,
-1.463049, 1.899433, -0.9803286, 1, 1, 1, 1, 1,
-1.460993, 1.765214, -1.475765, 1, 1, 1, 1, 1,
-1.452189, -0.1607959, -1.868461, 1, 1, 1, 1, 1,
-1.451997, -0.3553061, -2.542267, 1, 1, 1, 1, 1,
-1.449983, 1.493779, -0.6825743, 1, 1, 1, 1, 1,
-1.449007, -1.283823, -2.479368, 1, 1, 1, 1, 1,
-1.443147, 0.7219279, -2.230547, 1, 1, 1, 1, 1,
-1.440532, -0.5952335, -2.302427, 0, 0, 1, 1, 1,
-1.438219, 0.8965582, -0.9276423, 1, 0, 0, 1, 1,
-1.428464, 0.1871282, -0.9203601, 1, 0, 0, 1, 1,
-1.425391, -1.757975, -3.309048, 1, 0, 0, 1, 1,
-1.408445, -0.06760669, -0.5417726, 1, 0, 0, 1, 1,
-1.400837, 0.8394362, -1.135214, 1, 0, 0, 1, 1,
-1.391111, 1.383161, -2.584467, 0, 0, 0, 1, 1,
-1.388137, 1.106026, -1.019665, 0, 0, 0, 1, 1,
-1.375073, -0.2736412, -2.289763, 0, 0, 0, 1, 1,
-1.373095, 0.443579, -0.9083572, 0, 0, 0, 1, 1,
-1.358423, 1.016263, -1.893184, 0, 0, 0, 1, 1,
-1.338721, 2.140396, -1.459462, 0, 0, 0, 1, 1,
-1.331879, 1.344194, -3.38589, 0, 0, 0, 1, 1,
-1.329284, 0.3775777, -1.708813, 1, 1, 1, 1, 1,
-1.30426, -1.808099, -2.437499, 1, 1, 1, 1, 1,
-1.299915, 0.01085795, -0.9232264, 1, 1, 1, 1, 1,
-1.29781, -0.07871706, -3.737566, 1, 1, 1, 1, 1,
-1.29685, -0.3596215, -2.071476, 1, 1, 1, 1, 1,
-1.296605, 0.4033848, -1.921159, 1, 1, 1, 1, 1,
-1.292156, -0.6848043, -1.809782, 1, 1, 1, 1, 1,
-1.290187, -0.5379553, -2.858614, 1, 1, 1, 1, 1,
-1.289966, -2.12022, -1.799307, 1, 1, 1, 1, 1,
-1.288785, -0.6498041, -1.71592, 1, 1, 1, 1, 1,
-1.287471, 1.81172, -0.4035725, 1, 1, 1, 1, 1,
-1.281002, 0.4993412, -1.622083, 1, 1, 1, 1, 1,
-1.274066, -0.0706349, -2.699822, 1, 1, 1, 1, 1,
-1.27326, 0.6871454, -0.9712781, 1, 1, 1, 1, 1,
-1.266984, -0.3031353, -2.170807, 1, 1, 1, 1, 1,
-1.266788, -0.4845482, -1.709813, 0, 0, 1, 1, 1,
-1.256257, -0.3583009, -2.786419, 1, 0, 0, 1, 1,
-1.249237, -0.4552135, -1.660476, 1, 0, 0, 1, 1,
-1.247859, 0.1571363, -2.089865, 1, 0, 0, 1, 1,
-1.23729, -0.4740988, -2.454975, 1, 0, 0, 1, 1,
-1.23615, 0.2629142, 0.003364204, 1, 0, 0, 1, 1,
-1.235023, -0.2152446, -1.07437, 0, 0, 0, 1, 1,
-1.231121, 0.0960054, -0.9647893, 0, 0, 0, 1, 1,
-1.206996, -1.324195, -1.789769, 0, 0, 0, 1, 1,
-1.200743, -1.485527, -1.46413, 0, 0, 0, 1, 1,
-1.19936, -0.1460665, -0.5160947, 0, 0, 0, 1, 1,
-1.197368, 0.3826081, -1.44071, 0, 0, 0, 1, 1,
-1.192993, 0.356343, -3.130274, 0, 0, 0, 1, 1,
-1.192894, 1.405947, -1.060136, 1, 1, 1, 1, 1,
-1.192614, -0.1303006, -2.832136, 1, 1, 1, 1, 1,
-1.191071, 0.1664587, -1.317903, 1, 1, 1, 1, 1,
-1.187394, 0.573477, -2.730609, 1, 1, 1, 1, 1,
-1.177912, 1.599472, -2.883185, 1, 1, 1, 1, 1,
-1.17373, -1.012388, -2.682758, 1, 1, 1, 1, 1,
-1.166381, -0.7722632, -2.255551, 1, 1, 1, 1, 1,
-1.161268, 0.5578796, -0.02802202, 1, 1, 1, 1, 1,
-1.150644, -1.643141, -2.844293, 1, 1, 1, 1, 1,
-1.149271, -0.4249544, -0.9214516, 1, 1, 1, 1, 1,
-1.148325, -0.4595606, -2.055776, 1, 1, 1, 1, 1,
-1.143443, 0.4703618, 1.583404, 1, 1, 1, 1, 1,
-1.143046, 0.4371194, 0.6445922, 1, 1, 1, 1, 1,
-1.137608, 0.7975715, -1.463805, 1, 1, 1, 1, 1,
-1.136961, 0.8559021, -1.889447, 1, 1, 1, 1, 1,
-1.132684, 0.024862, -2.183634, 0, 0, 1, 1, 1,
-1.128403, -1.268091, -1.850194, 1, 0, 0, 1, 1,
-1.126837, 1.838262, 0.9891703, 1, 0, 0, 1, 1,
-1.123837, 0.9897033, 0.6077595, 1, 0, 0, 1, 1,
-1.122082, 0.445594, 0.6557205, 1, 0, 0, 1, 1,
-1.120114, 1.206639, -2.065126, 1, 0, 0, 1, 1,
-1.101835, 0.2623994, -0.3107394, 0, 0, 0, 1, 1,
-1.098258, 0.1391827, -1.566281, 0, 0, 0, 1, 1,
-1.096236, 1.414834, -1.702236, 0, 0, 0, 1, 1,
-1.095122, -1.575688, -2.429832, 0, 0, 0, 1, 1,
-1.068497, -0.52773, -3.081057, 0, 0, 0, 1, 1,
-1.065761, 2.375444, 0.6959303, 0, 0, 0, 1, 1,
-1.063551, 1.232088, -1.158479, 0, 0, 0, 1, 1,
-1.059642, -0.7069941, -2.082065, 1, 1, 1, 1, 1,
-1.059369, -0.04064041, -1.505395, 1, 1, 1, 1, 1,
-1.057282, 0.02972104, -2.126202, 1, 1, 1, 1, 1,
-1.054537, 0.417712, 0.6220644, 1, 1, 1, 1, 1,
-1.053692, -0.5849353, 0.0996054, 1, 1, 1, 1, 1,
-1.052788, -1.535283, -1.668716, 1, 1, 1, 1, 1,
-1.048249, 0.9772479, 0.3818015, 1, 1, 1, 1, 1,
-1.046127, 0.5510634, -1.440411, 1, 1, 1, 1, 1,
-1.04343, -1.786305, -3.071597, 1, 1, 1, 1, 1,
-1.039141, -0.9413105, -1.85228, 1, 1, 1, 1, 1,
-1.030614, 0.8693748, -0.732308, 1, 1, 1, 1, 1,
-1.023523, 1.237022, -1.187059, 1, 1, 1, 1, 1,
-1.021157, 0.1931259, 0.946855, 1, 1, 1, 1, 1,
-1.016822, 0.06064761, -2.961111, 1, 1, 1, 1, 1,
-1.014439, -0.05913521, -1.015641, 1, 1, 1, 1, 1,
-1.007705, -0.9380223, -2.604878, 0, 0, 1, 1, 1,
-1.002476, 0.8888662, -1.086859, 1, 0, 0, 1, 1,
-0.9940346, 0.4915459, -0.5936094, 1, 0, 0, 1, 1,
-0.99322, 0.523704, -0.1127796, 1, 0, 0, 1, 1,
-0.9896234, 0.3592101, -1.99061, 1, 0, 0, 1, 1,
-0.9876912, 0.04477328, -2.583947, 1, 0, 0, 1, 1,
-0.9571178, -0.6080919, -2.002622, 0, 0, 0, 1, 1,
-0.9526623, 0.9841166, -0.3826661, 0, 0, 0, 1, 1,
-0.9525914, -0.3717601, -1.337173, 0, 0, 0, 1, 1,
-0.9517194, -0.5840496, -0.8569199, 0, 0, 0, 1, 1,
-0.9472064, -1.301547, -4.759286, 0, 0, 0, 1, 1,
-0.9467232, -0.5876544, -2.974092, 0, 0, 0, 1, 1,
-0.9415409, -0.2448126, 0.220647, 0, 0, 0, 1, 1,
-0.9406151, -1.483315, -1.89935, 1, 1, 1, 1, 1,
-0.938983, 0.4290103, 0.3303331, 1, 1, 1, 1, 1,
-0.9385465, -1.613421, -2.097403, 1, 1, 1, 1, 1,
-0.9303539, -0.8948339, -2.594256, 1, 1, 1, 1, 1,
-0.9302976, -0.4662444, -2.174298, 1, 1, 1, 1, 1,
-0.9276989, -0.1049308, -1.11272, 1, 1, 1, 1, 1,
-0.9180807, -1.694727, -2.085751, 1, 1, 1, 1, 1,
-0.9170105, -2.032485, -1.787342, 1, 1, 1, 1, 1,
-0.9096451, 0.740521, -2.552892, 1, 1, 1, 1, 1,
-0.9091247, -0.6065665, -3.702271, 1, 1, 1, 1, 1,
-0.9085316, 0.5870562, -1.405248, 1, 1, 1, 1, 1,
-0.9053808, -1.066042, -1.140751, 1, 1, 1, 1, 1,
-0.903571, 0.1188841, -1.475813, 1, 1, 1, 1, 1,
-0.9031355, 0.3545803, -1.459805, 1, 1, 1, 1, 1,
-0.9028867, 0.0192106, -0.2001063, 1, 1, 1, 1, 1,
-0.901798, 0.3665842, -3.56504, 0, 0, 1, 1, 1,
-0.8988919, -0.4071832, 0.2650978, 1, 0, 0, 1, 1,
-0.8980721, 0.1669419, 0.2898549, 1, 0, 0, 1, 1,
-0.8938524, -0.5919549, -0.9981533, 1, 0, 0, 1, 1,
-0.8932118, 1.535827, 0.1505351, 1, 0, 0, 1, 1,
-0.889617, 0.09074493, -1.460751, 1, 0, 0, 1, 1,
-0.8877921, -0.9491152, -2.389731, 0, 0, 0, 1, 1,
-0.8796813, 0.21949, -2.258163, 0, 0, 0, 1, 1,
-0.8706192, 1.204088, 1.234576, 0, 0, 0, 1, 1,
-0.8669492, 0.6870046, -0.7396962, 0, 0, 0, 1, 1,
-0.8664565, -0.04740306, -0.4837857, 0, 0, 0, 1, 1,
-0.8642111, -0.6496847, -1.559793, 0, 0, 0, 1, 1,
-0.861266, -1.210852, -0.5899972, 0, 0, 0, 1, 1,
-0.8597351, 0.2934394, -0.3059022, 1, 1, 1, 1, 1,
-0.856728, 0.3940721, -1.726025, 1, 1, 1, 1, 1,
-0.852577, 0.9217504, 0.209618, 1, 1, 1, 1, 1,
-0.8498048, 0.9180828, -2.737575, 1, 1, 1, 1, 1,
-0.8461613, -0.6535897, -3.236724, 1, 1, 1, 1, 1,
-0.8426307, -0.003724433, -2.217236, 1, 1, 1, 1, 1,
-0.8400918, 0.4273552, -0.1842851, 1, 1, 1, 1, 1,
-0.835383, -0.04748109, -1.950643, 1, 1, 1, 1, 1,
-0.8331426, 0.538491, -0.03079551, 1, 1, 1, 1, 1,
-0.8330402, 0.2457776, 0.5094686, 1, 1, 1, 1, 1,
-0.832404, 0.179313, -3.194706, 1, 1, 1, 1, 1,
-0.8246878, 1.070615, -1.649398, 1, 1, 1, 1, 1,
-0.8196601, -0.07979961, -2.234963, 1, 1, 1, 1, 1,
-0.8140244, 0.6417239, -0.3519302, 1, 1, 1, 1, 1,
-0.8113014, 0.6543479, -2.007277, 1, 1, 1, 1, 1,
-0.7910938, 1.316661, -1.384329, 0, 0, 1, 1, 1,
-0.7883567, -0.5317186, -2.379143, 1, 0, 0, 1, 1,
-0.7863705, 0.9531544, -0.07874145, 1, 0, 0, 1, 1,
-0.7858565, -0.3849174, -2.380124, 1, 0, 0, 1, 1,
-0.7834091, -0.3776889, -0.8097492, 1, 0, 0, 1, 1,
-0.7822848, -0.5194592, -1.714201, 1, 0, 0, 1, 1,
-0.7806612, 0.4719422, -0.3775562, 0, 0, 0, 1, 1,
-0.7788252, -1.175851, -2.335209, 0, 0, 0, 1, 1,
-0.7725484, 0.08726857, -1.108243, 0, 0, 0, 1, 1,
-0.7693183, -0.7961329, -2.876872, 0, 0, 0, 1, 1,
-0.7626109, -1.2783, -2.661087, 0, 0, 0, 1, 1,
-0.7546307, -0.5301862, -2.605877, 0, 0, 0, 1, 1,
-0.7538447, -0.4827341, -0.8863652, 0, 0, 0, 1, 1,
-0.7532421, -0.2663799, -1.724625, 1, 1, 1, 1, 1,
-0.752705, -1.200595, -1.700531, 1, 1, 1, 1, 1,
-0.7440065, -0.6574255, -2.991158, 1, 1, 1, 1, 1,
-0.7366605, -0.7853, -3.754198, 1, 1, 1, 1, 1,
-0.7355717, -0.4400613, -2.632445, 1, 1, 1, 1, 1,
-0.7267108, -0.4003056, -0.8291139, 1, 1, 1, 1, 1,
-0.7180136, -0.8251436, -2.104207, 1, 1, 1, 1, 1,
-0.7159708, -2.60749, -3.432578, 1, 1, 1, 1, 1,
-0.7063004, 1.308418, 1.133434, 1, 1, 1, 1, 1,
-0.6976028, -3.342232, -3.703456, 1, 1, 1, 1, 1,
-0.6927199, -0.8839882, -3.602265, 1, 1, 1, 1, 1,
-0.6926324, -0.5279503, -1.433706, 1, 1, 1, 1, 1,
-0.6920038, 0.02311498, -1.576143, 1, 1, 1, 1, 1,
-0.6894795, -0.398297, -0.03761003, 1, 1, 1, 1, 1,
-0.6890545, 1.05626, 0.902559, 1, 1, 1, 1, 1,
-0.6847793, 0.9074354, -1.708507, 0, 0, 1, 1, 1,
-0.6823429, 1.884173, -0.1026119, 1, 0, 0, 1, 1,
-0.6719059, 1.677327, -1.242119, 1, 0, 0, 1, 1,
-0.6708019, -0.3954079, -2.843517, 1, 0, 0, 1, 1,
-0.6704428, -0.6801005, -1.537803, 1, 0, 0, 1, 1,
-0.6675486, 1.208963, 1.887663, 1, 0, 0, 1, 1,
-0.6648076, -0.1180118, -2.781275, 0, 0, 0, 1, 1,
-0.6611562, -0.397157, -1.046126, 0, 0, 0, 1, 1,
-0.6590398, 0.1278943, -0.5205539, 0, 0, 0, 1, 1,
-0.6528786, 0.1599306, 0.319828, 0, 0, 0, 1, 1,
-0.6510981, -0.5791671, -4.084962, 0, 0, 0, 1, 1,
-0.6510373, -0.04678876, -2.890731, 0, 0, 0, 1, 1,
-0.6504118, -1.478274, -3.545119, 0, 0, 0, 1, 1,
-0.6501553, 0.6563847, -0.02886241, 1, 1, 1, 1, 1,
-0.6486792, 1.149686, 0.6543015, 1, 1, 1, 1, 1,
-0.6476349, 0.3863825, 1.584139, 1, 1, 1, 1, 1,
-0.6448042, 0.865629, 0.4746507, 1, 1, 1, 1, 1,
-0.6303609, -0.200508, -0.6511874, 1, 1, 1, 1, 1,
-0.6291142, 0.7140616, 0.2434917, 1, 1, 1, 1, 1,
-0.6255631, -0.107315, -0.3762378, 1, 1, 1, 1, 1,
-0.6248104, 1.276813, 0.5148178, 1, 1, 1, 1, 1,
-0.6241083, -1.505682, -1.924183, 1, 1, 1, 1, 1,
-0.6230946, 0.5394915, -2.770992, 1, 1, 1, 1, 1,
-0.6200188, 1.552618, -1.355777, 1, 1, 1, 1, 1,
-0.6198048, -0.7870647, -2.00789, 1, 1, 1, 1, 1,
-0.6117608, 0.09819893, -0.5406084, 1, 1, 1, 1, 1,
-0.6112583, 0.2911374, -0.9515968, 1, 1, 1, 1, 1,
-0.6094943, -1.053197, -2.520899, 1, 1, 1, 1, 1,
-0.6060946, 0.09103218, -0.3797605, 0, 0, 1, 1, 1,
-0.6008246, 1.457726, 2.002081, 1, 0, 0, 1, 1,
-0.5974827, -1.85001, -2.657661, 1, 0, 0, 1, 1,
-0.5875143, 0.4657652, -0.9411672, 1, 0, 0, 1, 1,
-0.5861096, 1.31027, -0.8016239, 1, 0, 0, 1, 1,
-0.5828706, 1.390128, 0.2806742, 1, 0, 0, 1, 1,
-0.5792268, 0.008651751, -2.234791, 0, 0, 0, 1, 1,
-0.5780792, 0.07669726, -1.553462, 0, 0, 0, 1, 1,
-0.5767126, 1.8158, -0.5297148, 0, 0, 0, 1, 1,
-0.5760624, -1.033914, -1.390551, 0, 0, 0, 1, 1,
-0.57095, -0.4760268, -2.704137, 0, 0, 0, 1, 1,
-0.5695714, 0.03924408, -2.507636, 0, 0, 0, 1, 1,
-0.5680372, -0.1962081, -0.1864032, 0, 0, 0, 1, 1,
-0.5680009, 1.133344, -1.235309, 1, 1, 1, 1, 1,
-0.5650207, 0.2358189, 0.7104962, 1, 1, 1, 1, 1,
-0.5647499, -0.267195, 0.01298573, 1, 1, 1, 1, 1,
-0.5629745, -0.8159947, -4.095133, 1, 1, 1, 1, 1,
-0.5600942, 2.213237, -0.459229, 1, 1, 1, 1, 1,
-0.5584884, -0.562075, -2.998542, 1, 1, 1, 1, 1,
-0.5548712, -2.420533, -2.913663, 1, 1, 1, 1, 1,
-0.5547199, 1.916555, 1.463436, 1, 1, 1, 1, 1,
-0.5546464, -0.531444, -2.273436, 1, 1, 1, 1, 1,
-0.5520973, -1.995081, -3.835115, 1, 1, 1, 1, 1,
-0.5501508, 0.03863038, -1.458966, 1, 1, 1, 1, 1,
-0.5466414, -0.7122893, -2.007224, 1, 1, 1, 1, 1,
-0.5419477, 0.8791755, -1.078356, 1, 1, 1, 1, 1,
-0.5415901, 0.7143698, -2.23417, 1, 1, 1, 1, 1,
-0.5399303, -0.5393392, -3.339597, 1, 1, 1, 1, 1,
-0.5319123, 0.2594027, -1.533091, 0, 0, 1, 1, 1,
-0.5239861, 1.734363, -2.178181, 1, 0, 0, 1, 1,
-0.522848, -0.04246462, -2.127839, 1, 0, 0, 1, 1,
-0.5195718, 0.4304946, -1.713226, 1, 0, 0, 1, 1,
-0.5159383, -0.2125109, -2.630694, 1, 0, 0, 1, 1,
-0.5062743, 1.181588, 0.01982752, 1, 0, 0, 1, 1,
-0.5061397, 2.005781, -1.719093, 0, 0, 0, 1, 1,
-0.5020193, 1.109381, -1.860198, 0, 0, 0, 1, 1,
-0.4995128, 0.5050522, 1.264356, 0, 0, 0, 1, 1,
-0.4962821, -0.7597021, -1.181886, 0, 0, 0, 1, 1,
-0.4961313, -0.1064847, -0.5453927, 0, 0, 0, 1, 1,
-0.4922703, -0.2143699, -3.656246, 0, 0, 0, 1, 1,
-0.4892533, 0.6443457, 0.9478675, 0, 0, 0, 1, 1,
-0.4870118, 0.7741005, -0.6161389, 1, 1, 1, 1, 1,
-0.4849069, -1.445737, -2.451544, 1, 1, 1, 1, 1,
-0.4829803, 0.5724743, -0.4153906, 1, 1, 1, 1, 1,
-0.4812454, -1.114209, -2.433033, 1, 1, 1, 1, 1,
-0.4804271, 1.092763, 2.156081, 1, 1, 1, 1, 1,
-0.4721215, -2.084897, -5.391781, 1, 1, 1, 1, 1,
-0.4701726, -3.054365, -1.557336, 1, 1, 1, 1, 1,
-0.4680833, -0.6180444, -1.614289, 1, 1, 1, 1, 1,
-0.4629515, 0.9439823, -0.975875, 1, 1, 1, 1, 1,
-0.4588843, 0.9127263, 0.1640593, 1, 1, 1, 1, 1,
-0.4570813, 0.7634344, 0.1454753, 1, 1, 1, 1, 1,
-0.4489196, -0.05786226, -2.026836, 1, 1, 1, 1, 1,
-0.4456135, 1.830108, -1.890809, 1, 1, 1, 1, 1,
-0.4454065, 0.1797712, -1.530026, 1, 1, 1, 1, 1,
-0.443469, 0.438746, -0.04112715, 1, 1, 1, 1, 1,
-0.4428281, 0.6737812, -1.502577, 0, 0, 1, 1, 1,
-0.4399294, -0.3178968, -1.097973, 1, 0, 0, 1, 1,
-0.4345114, 0.06421958, -2.308797, 1, 0, 0, 1, 1,
-0.4339499, 0.4915989, 0.08825634, 1, 0, 0, 1, 1,
-0.4255796, 0.4870551, -0.2030946, 1, 0, 0, 1, 1,
-0.4232869, 0.3219507, 0.04596315, 1, 0, 0, 1, 1,
-0.4229403, 2.035843, -1.925421, 0, 0, 0, 1, 1,
-0.422198, 0.2583793, -0.8784553, 0, 0, 0, 1, 1,
-0.4207807, -0.3012648, -2.079472, 0, 0, 0, 1, 1,
-0.4182403, 0.0005627624, -0.05948711, 0, 0, 0, 1, 1,
-0.4147965, 0.5446729, 0.0724923, 0, 0, 0, 1, 1,
-0.414453, 0.007964708, -2.648848, 0, 0, 0, 1, 1,
-0.4129904, -0.1469554, -1.126715, 0, 0, 0, 1, 1,
-0.4076584, -0.8275952, -3.803019, 1, 1, 1, 1, 1,
-0.4073378, -0.1257884, -1.319395, 1, 1, 1, 1, 1,
-0.4009378, -0.1533889, -1.939888, 1, 1, 1, 1, 1,
-0.4006435, -1.278863, -3.670195, 1, 1, 1, 1, 1,
-0.3995571, 1.247159, -1.547632, 1, 1, 1, 1, 1,
-0.3988463, -1.783935, -2.551819, 1, 1, 1, 1, 1,
-0.3960389, 1.31631, -1.133823, 1, 1, 1, 1, 1,
-0.3952645, -1.190559, -2.648244, 1, 1, 1, 1, 1,
-0.3947228, -0.1106312, -0.9528419, 1, 1, 1, 1, 1,
-0.3911704, -0.7649962, -4.312206, 1, 1, 1, 1, 1,
-0.3901621, -0.9028876, -3.464613, 1, 1, 1, 1, 1,
-0.3884318, 1.360753, -0.01020437, 1, 1, 1, 1, 1,
-0.3871188, -0.7246542, -1.119646, 1, 1, 1, 1, 1,
-0.3844491, -0.2615432, -1.84302, 1, 1, 1, 1, 1,
-0.3789973, 1.133214, -1.102304, 1, 1, 1, 1, 1,
-0.3789846, 1.746303, 0.4193891, 0, 0, 1, 1, 1,
-0.3738941, 0.9026991, 0.2019936, 1, 0, 0, 1, 1,
-0.3675182, 1.85808, 1.565286, 1, 0, 0, 1, 1,
-0.3663448, -0.2629563, -2.152936, 1, 0, 0, 1, 1,
-0.3627008, -1.296859, -2.027803, 1, 0, 0, 1, 1,
-0.3601298, 0.8816664, -0.4264899, 1, 0, 0, 1, 1,
-0.354656, -0.6166041, -2.771532, 0, 0, 0, 1, 1,
-0.352989, 2.957057, -0.9989253, 0, 0, 0, 1, 1,
-0.3495645, 0.5843859, -0.962002, 0, 0, 0, 1, 1,
-0.344036, -0.4071063, -1.922764, 0, 0, 0, 1, 1,
-0.3428578, -0.1663996, -2.439027, 0, 0, 0, 1, 1,
-0.3403604, 1.222932, 0.8907856, 0, 0, 0, 1, 1,
-0.3403279, 1.317174, -0.2412352, 0, 0, 0, 1, 1,
-0.3356915, -1.941958, -2.131007, 1, 1, 1, 1, 1,
-0.3299162, -0.6473157, -5.145237, 1, 1, 1, 1, 1,
-0.325372, 0.9010224, -0.824631, 1, 1, 1, 1, 1,
-0.3243329, 0.7193692, -2.138612, 1, 1, 1, 1, 1,
-0.324003, -1.008891, -2.875604, 1, 1, 1, 1, 1,
-0.3233242, -1.996939, -2.339779, 1, 1, 1, 1, 1,
-0.3217179, -0.03785127, -2.417171, 1, 1, 1, 1, 1,
-0.3190556, -0.1971933, -2.67034, 1, 1, 1, 1, 1,
-0.3172347, -0.3373307, -2.55226, 1, 1, 1, 1, 1,
-0.3161221, 0.7155308, -1.103508, 1, 1, 1, 1, 1,
-0.3099782, 0.7823201, -0.6019926, 1, 1, 1, 1, 1,
-0.3078626, -0.6010429, -1.527061, 1, 1, 1, 1, 1,
-0.305346, -0.6711257, -1.537249, 1, 1, 1, 1, 1,
-0.3045911, -0.3516484, -2.244467, 1, 1, 1, 1, 1,
-0.3035917, 1.131543, -0.2659146, 1, 1, 1, 1, 1,
-0.3018307, 0.2528733, -0.9528458, 0, 0, 1, 1, 1,
-0.295647, 1.562122, -0.8083233, 1, 0, 0, 1, 1,
-0.2952704, -0.3704733, -2.166341, 1, 0, 0, 1, 1,
-0.2951199, 0.4584691, -0.7516357, 1, 0, 0, 1, 1,
-0.2915136, 0.03582452, -2.99332, 1, 0, 0, 1, 1,
-0.2825108, 1.211943, -1.219576, 1, 0, 0, 1, 1,
-0.2810998, -2.903193, -1.621132, 0, 0, 0, 1, 1,
-0.2663933, 0.0826052, -1.017439, 0, 0, 0, 1, 1,
-0.261938, 0.9113275, -0.7675782, 0, 0, 0, 1, 1,
-0.2614292, 0.6327106, 1.328244, 0, 0, 0, 1, 1,
-0.261253, 0.06830315, -1.178663, 0, 0, 0, 1, 1,
-0.2516084, 0.995936, 1.97843, 0, 0, 0, 1, 1,
-0.2441856, 0.8315212, 0.714373, 0, 0, 0, 1, 1,
-0.2435559, -1.807583, -2.631195, 1, 1, 1, 1, 1,
-0.2414459, 0.4973139, 0.6993189, 1, 1, 1, 1, 1,
-0.232906, 0.4437177, -0.9037227, 1, 1, 1, 1, 1,
-0.231829, 1.111733, -0.1823055, 1, 1, 1, 1, 1,
-0.2312098, 1.377566, -1.162712, 1, 1, 1, 1, 1,
-0.2310318, -1.24055, -3.294277, 1, 1, 1, 1, 1,
-0.2299495, -0.4203606, -2.434141, 1, 1, 1, 1, 1,
-0.2260878, -0.461726, -2.128125, 1, 1, 1, 1, 1,
-0.2245346, 0.1807192, -1.838332, 1, 1, 1, 1, 1,
-0.2228185, 0.3074171, -1.168371, 1, 1, 1, 1, 1,
-0.2182004, 1.198716, 0.3585735, 1, 1, 1, 1, 1,
-0.217625, -0.6012883, -2.767057, 1, 1, 1, 1, 1,
-0.2166075, -1.036137, -3.475756, 1, 1, 1, 1, 1,
-0.2164905, -1.008512, -2.528431, 1, 1, 1, 1, 1,
-0.2158673, 1.241157, 0.106194, 1, 1, 1, 1, 1,
-0.2135033, 1.066774, -0.7381966, 0, 0, 1, 1, 1,
-0.2116183, -1.050371, -2.45792, 1, 0, 0, 1, 1,
-0.20755, -1.159127, -2.495621, 1, 0, 0, 1, 1,
-0.2006165, 1.431872, -0.3579134, 1, 0, 0, 1, 1,
-0.1995569, 0.05423721, -1.393523, 1, 0, 0, 1, 1,
-0.1993099, 0.8442508, -0.9087384, 1, 0, 0, 1, 1,
-0.1961551, 0.009421707, -0.6909705, 0, 0, 0, 1, 1,
-0.1944773, -0.934279, -2.160765, 0, 0, 0, 1, 1,
-0.1900739, -0.8230267, -3.371771, 0, 0, 0, 1, 1,
-0.1876206, 0.3908829, -1.416129, 0, 0, 0, 1, 1,
-0.1852918, 0.8799073, -0.241414, 0, 0, 0, 1, 1,
-0.1801868, 0.8450968, 0.4188282, 0, 0, 0, 1, 1,
-0.1727561, -0.2871818, -4.426857, 0, 0, 0, 1, 1,
-0.1714249, -1.198979, -1.969401, 1, 1, 1, 1, 1,
-0.1685201, 0.6265644, -0.7606708, 1, 1, 1, 1, 1,
-0.1667493, 0.7510188, -1.842713, 1, 1, 1, 1, 1,
-0.1646518, -1.996641, -3.393873, 1, 1, 1, 1, 1,
-0.1624829, 0.4439571, -1.358197, 1, 1, 1, 1, 1,
-0.1615083, 0.5772069, -1.764505, 1, 1, 1, 1, 1,
-0.1602998, -0.837119, -6.05446, 1, 1, 1, 1, 1,
-0.1586669, -0.2305325, -4.053504, 1, 1, 1, 1, 1,
-0.1566903, 0.5878968, -0.2135666, 1, 1, 1, 1, 1,
-0.1561431, 0.6509281, -0.1983073, 1, 1, 1, 1, 1,
-0.1556387, -0.4356422, -3.785324, 1, 1, 1, 1, 1,
-0.1386785, -1.65889, -3.324414, 1, 1, 1, 1, 1,
-0.1346776, 0.1451272, -0.1258071, 1, 1, 1, 1, 1,
-0.1346103, -0.5408752, -4.011836, 1, 1, 1, 1, 1,
-0.1326981, 0.03936888, 0.5599596, 1, 1, 1, 1, 1,
-0.1272269, 1.019541, -2.55948, 0, 0, 1, 1, 1,
-0.1261512, 0.7459241, 0.9408087, 1, 0, 0, 1, 1,
-0.1191799, 0.9257386, 0.1107319, 1, 0, 0, 1, 1,
-0.1187663, -0.9774658, -4.04894, 1, 0, 0, 1, 1,
-0.1181301, -0.9398699, -3.202864, 1, 0, 0, 1, 1,
-0.117943, -0.8789448, -3.065801, 1, 0, 0, 1, 1,
-0.1171034, 1.237126, -0.09004331, 0, 0, 0, 1, 1,
-0.1150287, 0.5963478, -0.2828612, 0, 0, 0, 1, 1,
-0.1124303, -0.6056347, -4.56946, 0, 0, 0, 1, 1,
-0.1122212, 0.6414086, -0.6278184, 0, 0, 0, 1, 1,
-0.1109091, -1.071232, -3.496387, 0, 0, 0, 1, 1,
-0.1091852, 0.6719152, 0.7953207, 0, 0, 0, 1, 1,
-0.1090138, -0.581955, -1.921676, 0, 0, 0, 1, 1,
-0.1072395, -0.466376, -3.594673, 1, 1, 1, 1, 1,
-0.1009493, 0.5523854, 0.3859468, 1, 1, 1, 1, 1,
-0.09385104, -0.2477353, -2.303354, 1, 1, 1, 1, 1,
-0.09322746, -0.5181697, -3.622857, 1, 1, 1, 1, 1,
-0.08976892, -1.056021, -1.273099, 1, 1, 1, 1, 1,
-0.0887371, 0.4970403, 0.5117227, 1, 1, 1, 1, 1,
-0.08656695, 1.055069, -0.552875, 1, 1, 1, 1, 1,
-0.08489916, -1.174486, -4.793676, 1, 1, 1, 1, 1,
-0.08170483, -0.2686027, -2.651313, 1, 1, 1, 1, 1,
-0.07537116, 0.9912426, -0.9101111, 1, 1, 1, 1, 1,
-0.07334137, -1.245302, -2.762202, 1, 1, 1, 1, 1,
-0.07306141, 0.5492794, -1.270152, 1, 1, 1, 1, 1,
-0.07236739, 0.1296602, 0.818536, 1, 1, 1, 1, 1,
-0.07034112, -1.215751, -3.330592, 1, 1, 1, 1, 1,
-0.06891552, 0.09059317, 0.03508772, 1, 1, 1, 1, 1,
-0.06202972, 0.6213088, 0.45242, 0, 0, 1, 1, 1,
-0.05216547, -0.1677444, -1.036507, 1, 0, 0, 1, 1,
-0.04584663, -0.08466254, -2.78887, 1, 0, 0, 1, 1,
-0.04215389, -0.8270008, -4.18077, 1, 0, 0, 1, 1,
-0.04127642, -1.440312, -3.264998, 1, 0, 0, 1, 1,
-0.03936407, 1.836152, 0.1860137, 1, 0, 0, 1, 1,
-0.03131725, -0.2521309, -2.441146, 0, 0, 0, 1, 1,
-0.02876065, -0.1443352, -3.100836, 0, 0, 0, 1, 1,
-0.02219552, -2.716555, -2.176398, 0, 0, 0, 1, 1,
-0.01627915, -0.54897, -2.910337, 0, 0, 0, 1, 1,
-0.008881293, -0.093038, -2.403146, 0, 0, 0, 1, 1,
-0.007403079, -1.112335, -4.037281, 0, 0, 0, 1, 1,
-0.005072715, 0.8451925, -0.2163502, 0, 0, 0, 1, 1,
-0.003642815, 1.304709, 0.5575735, 1, 1, 1, 1, 1,
0.005723741, 1.059055, -0.2202612, 1, 1, 1, 1, 1,
0.007527532, -0.4710433, 2.064669, 1, 1, 1, 1, 1,
0.01019076, 0.4251002, -0.03836458, 1, 1, 1, 1, 1,
0.01022157, -0.9935859, 2.877654, 1, 1, 1, 1, 1,
0.01401107, -0.8555734, 3.338675, 1, 1, 1, 1, 1,
0.01604757, 1.415966, -1.209177, 1, 1, 1, 1, 1,
0.01775619, 2.583635, -0.3147209, 1, 1, 1, 1, 1,
0.01869098, 1.191044, 0.2351025, 1, 1, 1, 1, 1,
0.02005825, -0.2346337, 2.849556, 1, 1, 1, 1, 1,
0.02999156, 2.258435, -1.149119, 1, 1, 1, 1, 1,
0.03177464, 1.129351, -0.7210569, 1, 1, 1, 1, 1,
0.0350247, -0.002466571, 2.076659, 1, 1, 1, 1, 1,
0.03702122, 0.4749156, 0.1041301, 1, 1, 1, 1, 1,
0.04028958, -0.2074051, 2.738116, 1, 1, 1, 1, 1,
0.04095042, 0.4756519, 0.5973539, 0, 0, 1, 1, 1,
0.04299366, 0.5411357, 2.222564, 1, 0, 0, 1, 1,
0.04435187, 0.4298065, 1.488775, 1, 0, 0, 1, 1,
0.04451096, 0.9658535, -0.2240519, 1, 0, 0, 1, 1,
0.04523294, -0.3509975, 1.292159, 1, 0, 0, 1, 1,
0.04765369, -0.9947125, 2.078701, 1, 0, 0, 1, 1,
0.04885686, 1.575913, -1.043725, 0, 0, 0, 1, 1,
0.05110545, -0.8164967, 2.523072, 0, 0, 0, 1, 1,
0.05269659, 0.9982702, 0.2088746, 0, 0, 0, 1, 1,
0.05345112, 0.382852, -0.1135875, 0, 0, 0, 1, 1,
0.05464781, -0.6925215, 2.175745, 0, 0, 0, 1, 1,
0.06538445, -0.9467623, 2.089135, 0, 0, 0, 1, 1,
0.07071073, -0.5416912, 2.111155, 0, 0, 0, 1, 1,
0.07727523, -0.4998176, 2.555115, 1, 1, 1, 1, 1,
0.08220498, 1.003021, 0.5820714, 1, 1, 1, 1, 1,
0.08656031, -0.7987032, 0.8918006, 1, 1, 1, 1, 1,
0.08935501, 0.4914852, -0.2189928, 1, 1, 1, 1, 1,
0.09090295, -0.3676469, 1.93565, 1, 1, 1, 1, 1,
0.09110758, -0.03365891, 1.096679, 1, 1, 1, 1, 1,
0.09372409, 1.385404, 0.9398693, 1, 1, 1, 1, 1,
0.0963611, -0.7425001, 2.75698, 1, 1, 1, 1, 1,
0.1029592, 0.8825617, 1.203335, 1, 1, 1, 1, 1,
0.1097843, 1.215216, -1.840422, 1, 1, 1, 1, 1,
0.1147179, 0.04342884, -0.2028083, 1, 1, 1, 1, 1,
0.1170371, -1.099524, 2.748391, 1, 1, 1, 1, 1,
0.1210582, 0.8438973, 0.3735755, 1, 1, 1, 1, 1,
0.1228364, 1.487848, -0.4807124, 1, 1, 1, 1, 1,
0.1233945, -0.657809, 4.322556, 1, 1, 1, 1, 1,
0.1248542, -0.06243769, 3.408085, 0, 0, 1, 1, 1,
0.1257655, -1.160651, 2.590601, 1, 0, 0, 1, 1,
0.1308402, -0.6107796, 1.493097, 1, 0, 0, 1, 1,
0.1339432, 0.1337541, -0.05929617, 1, 0, 0, 1, 1,
0.1340109, 0.8607721, -0.1639633, 1, 0, 0, 1, 1,
0.1349322, -0.363459, 2.110762, 1, 0, 0, 1, 1,
0.1364778, -0.3212005, 0.5865027, 0, 0, 0, 1, 1,
0.1398929, -0.9064021, 2.639078, 0, 0, 0, 1, 1,
0.1411537, -1.427325, 5.018337, 0, 0, 0, 1, 1,
0.1419005, 0.4710043, 2.572622, 0, 0, 0, 1, 1,
0.1431939, 0.1462043, -0.2944541, 0, 0, 0, 1, 1,
0.1432763, -0.09849785, 2.44963, 0, 0, 0, 1, 1,
0.1440413, 1.418038, -0.4966664, 0, 0, 0, 1, 1,
0.1467057, -1.215915, 3.69898, 1, 1, 1, 1, 1,
0.1492936, 0.1545554, 1.10016, 1, 1, 1, 1, 1,
0.1499564, -1.60282, 1.609691, 1, 1, 1, 1, 1,
0.1523612, -0.2994982, 2.644551, 1, 1, 1, 1, 1,
0.1564047, 0.6638879, 0.8922656, 1, 1, 1, 1, 1,
0.1574092, -1.46235, 3.283032, 1, 1, 1, 1, 1,
0.1619545, 0.1356349, 1.172457, 1, 1, 1, 1, 1,
0.1658893, 1.742188, 0.5317907, 1, 1, 1, 1, 1,
0.1660348, -2.295005, 2.555102, 1, 1, 1, 1, 1,
0.1708561, 0.9454355, -1.227477, 1, 1, 1, 1, 1,
0.1729071, 0.5832973, 1.097821, 1, 1, 1, 1, 1,
0.1741548, 0.1456833, 1.254151, 1, 1, 1, 1, 1,
0.1829825, -1.37886, 2.157065, 1, 1, 1, 1, 1,
0.1832973, -1.321281, 2.862676, 1, 1, 1, 1, 1,
0.1883894, 1.706245, 0.10667, 1, 1, 1, 1, 1,
0.1916437, 0.1965942, -0.159639, 0, 0, 1, 1, 1,
0.1970346, 0.8156324, 0.4845595, 1, 0, 0, 1, 1,
0.199047, -0.3454441, 3.898857, 1, 0, 0, 1, 1,
0.1991232, 0.2615389, 0.7083637, 1, 0, 0, 1, 1,
0.2057458, 3.709589, 1.307207, 1, 0, 0, 1, 1,
0.2072606, -1.761091, 2.763576, 1, 0, 0, 1, 1,
0.2112726, -0.2001167, 1.769686, 0, 0, 0, 1, 1,
0.2119492, -0.8671191, 3.050213, 0, 0, 0, 1, 1,
0.2166487, -0.3322823, 2.890493, 0, 0, 0, 1, 1,
0.2199098, -0.4937032, 4.927873, 0, 0, 0, 1, 1,
0.2211111, 0.142448, -0.6076998, 0, 0, 0, 1, 1,
0.2238281, -0.8539376, 3.898563, 0, 0, 0, 1, 1,
0.2239112, -0.4636561, 3.076651, 0, 0, 0, 1, 1,
0.2251227, 2.698134, 2.075403, 1, 1, 1, 1, 1,
0.2258944, -1.097039, 5.082686, 1, 1, 1, 1, 1,
0.2301032, 0.2024027, 2.103952, 1, 1, 1, 1, 1,
0.2324495, -0.1618222, 0.8578535, 1, 1, 1, 1, 1,
0.2353752, 0.09153036, 1.39452, 1, 1, 1, 1, 1,
0.2374651, 1.084922, 2.551303, 1, 1, 1, 1, 1,
0.2376725, -1.309312, 5.315336, 1, 1, 1, 1, 1,
0.2406048, -0.335774, 3.880037, 1, 1, 1, 1, 1,
0.2425162, 0.3173372, -0.5139708, 1, 1, 1, 1, 1,
0.2433515, 0.3752023, -0.934792, 1, 1, 1, 1, 1,
0.2448296, 1.37013, 0.7560235, 1, 1, 1, 1, 1,
0.2466038, 0.295424, 1.110929, 1, 1, 1, 1, 1,
0.2496945, -0.3819465, 3.076909, 1, 1, 1, 1, 1,
0.2511449, 0.0893299, 0.8367795, 1, 1, 1, 1, 1,
0.2528724, -0.1566052, 0.1424989, 1, 1, 1, 1, 1,
0.2537684, 0.8701907, 1.513365, 0, 0, 1, 1, 1,
0.2544661, 0.4789308, -2.000154, 1, 0, 0, 1, 1,
0.2581567, 0.2505306, 0.2074797, 1, 0, 0, 1, 1,
0.258947, -1.386379, 2.627289, 1, 0, 0, 1, 1,
0.2665128, 1.841663, 0.7050532, 1, 0, 0, 1, 1,
0.2674364, 0.5582739, 0.4149023, 1, 0, 0, 1, 1,
0.2677898, 0.9507502, -0.8564315, 0, 0, 0, 1, 1,
0.271992, 1.206986, 1.276889, 0, 0, 0, 1, 1,
0.2736308, -1.582124, 2.056382, 0, 0, 0, 1, 1,
0.2764101, -1.790035, 2.406986, 0, 0, 0, 1, 1,
0.2828406, -0.8069776, 2.958136, 0, 0, 0, 1, 1,
0.285228, -1.44273, 4.022774, 0, 0, 0, 1, 1,
0.2870309, -0.7119136, 2.486357, 0, 0, 0, 1, 1,
0.2913137, 2.448078, -0.1577341, 1, 1, 1, 1, 1,
0.2921291, -0.06973784, 1.701112, 1, 1, 1, 1, 1,
0.2921866, 0.3029222, 0.7382318, 1, 1, 1, 1, 1,
0.2925658, 0.2107625, 2.632649, 1, 1, 1, 1, 1,
0.2952334, 0.6258366, -0.4412072, 1, 1, 1, 1, 1,
0.2954744, -0.167325, 1.581308, 1, 1, 1, 1, 1,
0.2981902, -1.623629, 3.330691, 1, 1, 1, 1, 1,
0.3041611, 0.8939751, -0.0192815, 1, 1, 1, 1, 1,
0.3144784, 0.4166939, -0.06802236, 1, 1, 1, 1, 1,
0.3201244, 0.04396025, 1.104851, 1, 1, 1, 1, 1,
0.3215565, -1.917167, 3.374718, 1, 1, 1, 1, 1,
0.3224679, -0.2401045, 2.854438, 1, 1, 1, 1, 1,
0.3243668, -1.454749, 2.704901, 1, 1, 1, 1, 1,
0.3263821, 0.6166778, 1.971214, 1, 1, 1, 1, 1,
0.3315156, -0.9051234, 3.898126, 1, 1, 1, 1, 1,
0.3342394, 0.2078228, 1.101212, 0, 0, 1, 1, 1,
0.3350956, 0.5513756, 0.3429102, 1, 0, 0, 1, 1,
0.3374235, -2.437949, 2.136495, 1, 0, 0, 1, 1,
0.3420583, 0.3021157, -0.3911624, 1, 0, 0, 1, 1,
0.3428919, 0.2098108, 0.9095953, 1, 0, 0, 1, 1,
0.3459669, 0.5509819, 1.296868, 1, 0, 0, 1, 1,
0.3478842, 1.001008, -0.6987331, 0, 0, 0, 1, 1,
0.3530719, -2.047781, 4.116343, 0, 0, 0, 1, 1,
0.3581453, -0.1206063, 1.725013, 0, 0, 0, 1, 1,
0.3645466, 0.06539852, 3.032198, 0, 0, 0, 1, 1,
0.3651881, 0.3909304, 2.288961, 0, 0, 0, 1, 1,
0.3654732, 1.088709, 0.230149, 0, 0, 0, 1, 1,
0.3684314, 0.4936764, 0.3063744, 0, 0, 0, 1, 1,
0.3690799, 1.641599, 0.8508015, 1, 1, 1, 1, 1,
0.3737129, -0.2758938, 1.940194, 1, 1, 1, 1, 1,
0.375233, 0.3767276, -1.057966, 1, 1, 1, 1, 1,
0.3791057, -0.9285485, 3.199865, 1, 1, 1, 1, 1,
0.379649, 0.08325602, 1.59024, 1, 1, 1, 1, 1,
0.3818812, -0.2592313, 2.800547, 1, 1, 1, 1, 1,
0.3841525, -0.7040747, 2.379452, 1, 1, 1, 1, 1,
0.385101, -1.1407, 3.523285, 1, 1, 1, 1, 1,
0.3892643, 0.4821779, 1.261079, 1, 1, 1, 1, 1,
0.3904195, -1.34526, 3.829962, 1, 1, 1, 1, 1,
0.3910785, -1.484944, 1.671463, 1, 1, 1, 1, 1,
0.3920462, -0.1846646, 1.242894, 1, 1, 1, 1, 1,
0.393712, 1.633109, -0.1488394, 1, 1, 1, 1, 1,
0.3970997, -1.786709, 2.43266, 1, 1, 1, 1, 1,
0.3987766, 0.3680646, -0.1102713, 1, 1, 1, 1, 1,
0.399098, -0.7572081, 2.300452, 0, 0, 1, 1, 1,
0.4000271, -1.102734, 3.684299, 1, 0, 0, 1, 1,
0.4004109, 0.05607617, 1.909947, 1, 0, 0, 1, 1,
0.40094, -0.2254837, 3.056589, 1, 0, 0, 1, 1,
0.4011563, -0.2821586, 3.322026, 1, 0, 0, 1, 1,
0.402348, 0.1265263, 0.3987758, 1, 0, 0, 1, 1,
0.4034079, -0.5293558, 3.568286, 0, 0, 0, 1, 1,
0.4036416, 0.1340084, 1.695346, 0, 0, 0, 1, 1,
0.4080617, -0.8770256, 2.589828, 0, 0, 0, 1, 1,
0.4097568, 0.05267916, 1.857435, 0, 0, 0, 1, 1,
0.4131964, -0.3245431, 1.444394, 0, 0, 0, 1, 1,
0.413623, -0.4459105, 2.626021, 0, 0, 0, 1, 1,
0.4151386, -2.947833, 4.620487, 0, 0, 0, 1, 1,
0.4152053, 0.1153898, 0.04320452, 1, 1, 1, 1, 1,
0.4209313, -0.245246, 1.057315, 1, 1, 1, 1, 1,
0.4220178, 0.009530599, 0.1387334, 1, 1, 1, 1, 1,
0.4223997, -0.5154029, 1.830318, 1, 1, 1, 1, 1,
0.42352, -0.3741259, 2.610576, 1, 1, 1, 1, 1,
0.425282, -0.1328998, 3.01884, 1, 1, 1, 1, 1,
0.4277868, 0.5543351, 1.740933, 1, 1, 1, 1, 1,
0.4279802, 1.199488, -0.8510011, 1, 1, 1, 1, 1,
0.4286126, -0.689064, 4.907588, 1, 1, 1, 1, 1,
0.4316506, -0.7257788, 1.210974, 1, 1, 1, 1, 1,
0.4485095, 0.9288154, -0.5023624, 1, 1, 1, 1, 1,
0.449794, -1.878458, 3.495044, 1, 1, 1, 1, 1,
0.4575554, 0.09113154, 1.112133, 1, 1, 1, 1, 1,
0.4581502, -0.8300658, 4.213647, 1, 1, 1, 1, 1,
0.4616041, 0.138285, 0.4936921, 1, 1, 1, 1, 1,
0.4735145, 1.209002, 0.5082459, 0, 0, 1, 1, 1,
0.4739322, 1.143274, -0.005218128, 1, 0, 0, 1, 1,
0.4757004, 0.4905498, -0.2645343, 1, 0, 0, 1, 1,
0.4804412, -0.4516941, 1.94936, 1, 0, 0, 1, 1,
0.4816517, 0.4112677, 1.420759, 1, 0, 0, 1, 1,
0.4841591, 0.02641575, 2.033223, 1, 0, 0, 1, 1,
0.484445, 0.7006742, 1.249717, 0, 0, 0, 1, 1,
0.4865099, 0.9048674, 2.284651, 0, 0, 0, 1, 1,
0.4870374, 0.7018512, 0.3430863, 0, 0, 0, 1, 1,
0.489609, 0.4640367, 1.131759, 0, 0, 0, 1, 1,
0.4907149, 1.315625, 0.8553035, 0, 0, 0, 1, 1,
0.4926392, -2.075429, 2.532446, 0, 0, 0, 1, 1,
0.4961734, 0.8719429, -0.08820476, 0, 0, 0, 1, 1,
0.4970336, -0.8475994, 2.25887, 1, 1, 1, 1, 1,
0.5000249, -0.1901519, 2.81325, 1, 1, 1, 1, 1,
0.5026964, 0.8445402, -1.076881, 1, 1, 1, 1, 1,
0.5170068, 1.542949, -0.221564, 1, 1, 1, 1, 1,
0.5174145, 0.9861861, -0.04299758, 1, 1, 1, 1, 1,
0.5195357, -0.1415419, 0.2325747, 1, 1, 1, 1, 1,
0.5290565, 0.3573983, -0.9010812, 1, 1, 1, 1, 1,
0.5357922, 0.3855003, 0.3404037, 1, 1, 1, 1, 1,
0.541054, 0.04896864, -0.3186408, 1, 1, 1, 1, 1,
0.5482877, 0.3411546, 1.071225, 1, 1, 1, 1, 1,
0.5498957, 0.8814639, 0.7568641, 1, 1, 1, 1, 1,
0.5502339, 1.398425, 0.477537, 1, 1, 1, 1, 1,
0.5505209, -2.183507, 3.775727, 1, 1, 1, 1, 1,
0.5527361, -0.1322804, 1.132796, 1, 1, 1, 1, 1,
0.5546079, -0.8600292, 1.258724, 1, 1, 1, 1, 1,
0.5586209, -0.7883366, 2.37348, 0, 0, 1, 1, 1,
0.560374, 0.3055865, 1.800621, 1, 0, 0, 1, 1,
0.5622466, -1.175624, 3.645412, 1, 0, 0, 1, 1,
0.5649238, 1.512778, 0.1865943, 1, 0, 0, 1, 1,
0.5651157, 0.5470656, 0.06802567, 1, 0, 0, 1, 1,
0.5652618, -1.477633, 1.541925, 1, 0, 0, 1, 1,
0.5804788, -1.079398, 1.752593, 0, 0, 0, 1, 1,
0.5825746, -1.326234, -0.02509881, 0, 0, 0, 1, 1,
0.5845397, 2.696355, 1.546067, 0, 0, 0, 1, 1,
0.5889555, 0.2037452, 2.775137, 0, 0, 0, 1, 1,
0.5909209, 1.986096, 1.008872, 0, 0, 0, 1, 1,
0.5935987, -2.214446, 2.945201, 0, 0, 0, 1, 1,
0.5942962, -0.04261542, 0.07046358, 0, 0, 0, 1, 1,
0.596569, -0.2973191, 1.749043, 1, 1, 1, 1, 1,
0.6047908, -0.818438, 2.972373, 1, 1, 1, 1, 1,
0.6092565, -0.04784162, 2.557514, 1, 1, 1, 1, 1,
0.6124339, -0.3210058, 2.114184, 1, 1, 1, 1, 1,
0.6153067, -0.2922686, 2.665256, 1, 1, 1, 1, 1,
0.6155151, -0.6067861, 2.992908, 1, 1, 1, 1, 1,
0.6172977, 0.03461135, 2.676016, 1, 1, 1, 1, 1,
0.6206416, 0.1171664, 2.509981, 1, 1, 1, 1, 1,
0.6218067, -0.02427324, -0.001933587, 1, 1, 1, 1, 1,
0.6272273, -0.06693649, 2.282613, 1, 1, 1, 1, 1,
0.6282, 0.8675115, 0.1221203, 1, 1, 1, 1, 1,
0.6292192, -0.5020814, 1.521128, 1, 1, 1, 1, 1,
0.6365761, -0.1569397, 1.53697, 1, 1, 1, 1, 1,
0.6395692, 1.612917, -0.3912696, 1, 1, 1, 1, 1,
0.6398448, 1.460406, 1.259665, 1, 1, 1, 1, 1,
0.6460647, 0.2993127, 1.656545, 0, 0, 1, 1, 1,
0.6543282, -1.413666, 2.989604, 1, 0, 0, 1, 1,
0.6553603, 0.7069445, -1.271246, 1, 0, 0, 1, 1,
0.6557393, 0.09271234, 1.317977, 1, 0, 0, 1, 1,
0.6567436, -1.239377, 2.846669, 1, 0, 0, 1, 1,
0.6590895, 0.904149, 1.692526, 1, 0, 0, 1, 1,
0.6598474, -0.4930654, 0.5754142, 0, 0, 0, 1, 1,
0.6622025, 0.06569397, 1.555727, 0, 0, 0, 1, 1,
0.666953, -0.5748383, 3.542346, 0, 0, 0, 1, 1,
0.6709851, -1.174766, 3.261562, 0, 0, 0, 1, 1,
0.6852365, 1.09024, 0.006532073, 0, 0, 0, 1, 1,
0.6858314, 0.6455217, 0.1918524, 0, 0, 0, 1, 1,
0.6989857, 0.3877598, -0.4145214, 0, 0, 0, 1, 1,
0.7022942, 0.9925518, 1.424808, 1, 1, 1, 1, 1,
0.7085513, 0.8225697, 0.8771517, 1, 1, 1, 1, 1,
0.7097138, -0.5983475, 2.056833, 1, 1, 1, 1, 1,
0.7106618, 0.1492512, 1.573078, 1, 1, 1, 1, 1,
0.7175066, -1.313334, 2.138138, 1, 1, 1, 1, 1,
0.7178185, -0.1473314, 2.106144, 1, 1, 1, 1, 1,
0.7195749, 0.4786668, 0.912288, 1, 1, 1, 1, 1,
0.7206546, 0.7358282, -0.1883137, 1, 1, 1, 1, 1,
0.7332169, 0.5716245, 0.8232561, 1, 1, 1, 1, 1,
0.7342194, -0.4437601, 2.233304, 1, 1, 1, 1, 1,
0.7358812, -1.017146, 2.009252, 1, 1, 1, 1, 1,
0.7380783, -0.09387586, -1.729632, 1, 1, 1, 1, 1,
0.7407174, -0.0876137, 1.23777, 1, 1, 1, 1, 1,
0.7466174, -0.1367753, 1.691431, 1, 1, 1, 1, 1,
0.7472533, -0.3127368, 2.472081, 1, 1, 1, 1, 1,
0.7502033, 0.4665168, 2.57942, 0, 0, 1, 1, 1,
0.7513392, 0.004072557, 2.041851, 1, 0, 0, 1, 1,
0.7573823, -0.2423226, 1.843588, 1, 0, 0, 1, 1,
0.7599735, -1.517223, 1.595474, 1, 0, 0, 1, 1,
0.7682903, 1.08077, 0.08588132, 1, 0, 0, 1, 1,
0.770081, -0.1332692, 0.6624683, 1, 0, 0, 1, 1,
0.772203, -0.5307565, 3.883826, 0, 0, 0, 1, 1,
0.7753405, -1.269606, 2.031074, 0, 0, 0, 1, 1,
0.7825253, 0.4349609, 0.9549012, 0, 0, 0, 1, 1,
0.7832707, 0.770204, 0.2354852, 0, 0, 0, 1, 1,
0.7849975, 0.03521883, 1.463335, 0, 0, 0, 1, 1,
0.7883017, 0.09230554, 1.015439, 0, 0, 0, 1, 1,
0.7883514, -0.3672346, 1.134777, 0, 0, 0, 1, 1,
0.7922471, 0.738234, -0.02438203, 1, 1, 1, 1, 1,
0.7934843, 0.4942602, 0.5254802, 1, 1, 1, 1, 1,
0.7973225, -1.222349, 0.913891, 1, 1, 1, 1, 1,
0.8029796, 1.893431, 0.9977831, 1, 1, 1, 1, 1,
0.8050867, 0.9547136, 1.852286, 1, 1, 1, 1, 1,
0.8065951, -0.4171536, 1.619964, 1, 1, 1, 1, 1,
0.8081882, 0.2135132, -0.1547106, 1, 1, 1, 1, 1,
0.8095017, 1.121945, 0.8019338, 1, 1, 1, 1, 1,
0.81747, -0.6460896, 1.418973, 1, 1, 1, 1, 1,
0.8189933, -1.445255, 1.553271, 1, 1, 1, 1, 1,
0.8243873, -0.2924932, 3.415657, 1, 1, 1, 1, 1,
0.8306789, -0.6303027, 4.284652, 1, 1, 1, 1, 1,
0.8332231, 0.3291248, 0.6014988, 1, 1, 1, 1, 1,
0.8376933, -0.3747865, 1.470916, 1, 1, 1, 1, 1,
0.840444, -0.3626712, 1.673983, 1, 1, 1, 1, 1,
0.851427, 0.4240784, 0.4008647, 0, 0, 1, 1, 1,
0.8555913, 1.812588, -0.6885567, 1, 0, 0, 1, 1,
0.8557385, 0.003275047, 1.338857, 1, 0, 0, 1, 1,
0.860054, 0.3681082, 2.047225, 1, 0, 0, 1, 1,
0.8619924, 0.294417, 1.70511, 1, 0, 0, 1, 1,
0.8676457, -0.08367056, 2.152964, 1, 0, 0, 1, 1,
0.8686665, -0.4962344, 1.64989, 0, 0, 0, 1, 1,
0.8689278, -0.3037201, 2.900478, 0, 0, 0, 1, 1,
0.8695662, 1.363372, 2.14519, 0, 0, 0, 1, 1,
0.8741858, 1.389827, 0.2159487, 0, 0, 0, 1, 1,
0.8760879, -0.3098101, 1.559198, 0, 0, 0, 1, 1,
0.8784121, 0.003685226, 1.065589, 0, 0, 0, 1, 1,
0.8817859, -0.1155895, 3.296971, 0, 0, 0, 1, 1,
0.8823428, -0.6463569, 3.426154, 1, 1, 1, 1, 1,
0.8876141, 1.445649, 2.276167, 1, 1, 1, 1, 1,
0.8883486, -0.9650272, 2.321582, 1, 1, 1, 1, 1,
0.8898698, -1.130546, 3.226062, 1, 1, 1, 1, 1,
0.8919768, -1.441284, 3.624554, 1, 1, 1, 1, 1,
0.8953315, -0.1914829, 2.05667, 1, 1, 1, 1, 1,
0.8958988, -1.868579, 3.031561, 1, 1, 1, 1, 1,
0.8959664, 0.8815649, 2.023347, 1, 1, 1, 1, 1,
0.8963639, 0.5308333, 1.778731, 1, 1, 1, 1, 1,
0.9007524, -1.528311, 1.281314, 1, 1, 1, 1, 1,
0.9010975, -0.09591494, 1.529542, 1, 1, 1, 1, 1,
0.9029819, -0.09538659, 2.30052, 1, 1, 1, 1, 1,
0.9155666, -0.4844891, 1.996397, 1, 1, 1, 1, 1,
0.9185262, 0.5732978, 0.8706775, 1, 1, 1, 1, 1,
0.9235305, -0.03448058, 2.28198, 1, 1, 1, 1, 1,
0.9351912, -0.422894, 2.180363, 0, 0, 1, 1, 1,
0.9401496, -1.614587, 1.977993, 1, 0, 0, 1, 1,
0.9420657, -0.2201305, 0.9183921, 1, 0, 0, 1, 1,
0.9454777, 1.488498, 1.45679, 1, 0, 0, 1, 1,
0.9463517, -1.337307, 3.944842, 1, 0, 0, 1, 1,
0.9467496, 2.089848, 1.642638, 1, 0, 0, 1, 1,
0.9473439, -0.361173, 3.003062, 0, 0, 0, 1, 1,
0.9482548, 1.718871, 0.1613802, 0, 0, 0, 1, 1,
0.9533451, 1.492486, 0.966301, 0, 0, 0, 1, 1,
0.953488, -1.575674, 3.069871, 0, 0, 0, 1, 1,
0.9562764, -0.7558481, 0.9951537, 0, 0, 0, 1, 1,
0.9581183, 1.424091, 1.53135, 0, 0, 0, 1, 1,
0.9581658, -0.2969124, 2.454222, 0, 0, 0, 1, 1,
0.9645889, 2.933604, 1.147454, 1, 1, 1, 1, 1,
0.9679474, 1.28868, 0.0360328, 1, 1, 1, 1, 1,
0.9771268, 0.3245812, 1.32208, 1, 1, 1, 1, 1,
0.9785957, 1.507829, -0.7646231, 1, 1, 1, 1, 1,
0.9787593, 0.7327737, 0.4361348, 1, 1, 1, 1, 1,
0.9891724, 1.070894, 1.304995, 1, 1, 1, 1, 1,
0.9896387, -0.122904, 1.626295, 1, 1, 1, 1, 1,
0.9989901, -0.2710495, 2.504173, 1, 1, 1, 1, 1,
1.015059, 0.4754866, 2.759953, 1, 1, 1, 1, 1,
1.02087, -0.8947784, 2.977532, 1, 1, 1, 1, 1,
1.021191, 1.558139, 2.590306, 1, 1, 1, 1, 1,
1.029192, -2.041703, 2.747117, 1, 1, 1, 1, 1,
1.030253, -0.2787271, 2.766749, 1, 1, 1, 1, 1,
1.030931, 0.006530021, 0.6069132, 1, 1, 1, 1, 1,
1.035237, -0.7976536, 3.289071, 1, 1, 1, 1, 1,
1.035344, 0.02641179, 1.546744, 0, 0, 1, 1, 1,
1.036542, -0.06990935, 1.764497, 1, 0, 0, 1, 1,
1.040487, 0.5761996, 0.7941211, 1, 0, 0, 1, 1,
1.04253, -1.549217, 1.490967, 1, 0, 0, 1, 1,
1.045259, -0.2647548, 2.482872, 1, 0, 0, 1, 1,
1.04669, -0.3914971, 2.452734, 1, 0, 0, 1, 1,
1.047231, 1.468696, 1.899546, 0, 0, 0, 1, 1,
1.054047, -0.7099488, 3.09584, 0, 0, 0, 1, 1,
1.057837, 1.780597, 0.9615194, 0, 0, 0, 1, 1,
1.071445, -1.884198, 1.870484, 0, 0, 0, 1, 1,
1.08047, -0.6385813, 1.271152, 0, 0, 0, 1, 1,
1.081509, 1.26423, -0.1187345, 0, 0, 0, 1, 1,
1.089898, -0.9905638, 1.647154, 0, 0, 0, 1, 1,
1.096709, 0.3675418, 2.691363, 1, 1, 1, 1, 1,
1.099529, -1.717127, 2.661642, 1, 1, 1, 1, 1,
1.100223, 0.2689613, 1.98777, 1, 1, 1, 1, 1,
1.11289, 0.2723497, 0.374766, 1, 1, 1, 1, 1,
1.129324, -0.9168203, 1.613582, 1, 1, 1, 1, 1,
1.136104, -0.8709491, 0.7476131, 1, 1, 1, 1, 1,
1.141298, 1.279455, 0.2557097, 1, 1, 1, 1, 1,
1.1578, 0.6505321, 0.4159869, 1, 1, 1, 1, 1,
1.164985, -2.826453, 0.8986222, 1, 1, 1, 1, 1,
1.166531, 0.143325, 2.232865, 1, 1, 1, 1, 1,
1.17831, -0.1450519, 0.1374243, 1, 1, 1, 1, 1,
1.193136, 0.5038637, 2.38356, 1, 1, 1, 1, 1,
1.198735, 0.8532971, 0.8030085, 1, 1, 1, 1, 1,
1.199732, 0.5044531, 2.061127, 1, 1, 1, 1, 1,
1.201016, -1.611352, 2.190905, 1, 1, 1, 1, 1,
1.202755, -0.2602657, 1.769573, 0, 0, 1, 1, 1,
1.202771, 0.9867393, 2.040378, 1, 0, 0, 1, 1,
1.206567, -0.2690383, 1.081622, 1, 0, 0, 1, 1,
1.209739, -0.4061477, 0.2948896, 1, 0, 0, 1, 1,
1.211016, 0.008557325, 2.656401, 1, 0, 0, 1, 1,
1.215294, 1.044056, 1.576701, 1, 0, 0, 1, 1,
1.215581, -1.258461, 2.348772, 0, 0, 0, 1, 1,
1.216267, -1.178046, 3.303664, 0, 0, 0, 1, 1,
1.216902, -0.2924725, 2.404084, 0, 0, 0, 1, 1,
1.220318, -1.035024, 3.750628, 0, 0, 0, 1, 1,
1.22692, 1.694525, 0.6622688, 0, 0, 0, 1, 1,
1.233308, -0.5463295, 1.54451, 0, 0, 0, 1, 1,
1.235003, -0.8503787, -0.3329009, 0, 0, 0, 1, 1,
1.235988, -1.047285, 1.847807, 1, 1, 1, 1, 1,
1.238623, 0.4014054, 0.8237571, 1, 1, 1, 1, 1,
1.239811, -0.432499, 3.267253, 1, 1, 1, 1, 1,
1.245041, 0.01652499, 2.58024, 1, 1, 1, 1, 1,
1.247887, 0.4411117, 2.6001, 1, 1, 1, 1, 1,
1.249241, -0.9741549, 1.526675, 1, 1, 1, 1, 1,
1.257737, -1.593216, 1.45537, 1, 1, 1, 1, 1,
1.266197, 0.7805749, 0.698498, 1, 1, 1, 1, 1,
1.278148, -0.2154398, 0.5443095, 1, 1, 1, 1, 1,
1.278754, 0.3409159, 3.022115, 1, 1, 1, 1, 1,
1.291595, -0.05068866, 0.8518285, 1, 1, 1, 1, 1,
1.29379, 1.318715, -0.7257362, 1, 1, 1, 1, 1,
1.293911, -0.1096522, 0.4680883, 1, 1, 1, 1, 1,
1.297786, -1.799049, 4.159431, 1, 1, 1, 1, 1,
1.304683, 0.5962023, 0.6697503, 1, 1, 1, 1, 1,
1.306219, 0.9199419, 0.818583, 0, 0, 1, 1, 1,
1.309858, -1.120311, 2.420787, 1, 0, 0, 1, 1,
1.309992, -0.3835579, 0.3999345, 1, 0, 0, 1, 1,
1.315918, -1.027561, 2.873982, 1, 0, 0, 1, 1,
1.317472, -0.1552583, 3.3682, 1, 0, 0, 1, 1,
1.320639, 0.7267804, -0.2140093, 1, 0, 0, 1, 1,
1.323008, -0.871002, 2.862316, 0, 0, 0, 1, 1,
1.32786, 0.6121064, 2.260076, 0, 0, 0, 1, 1,
1.329802, 0.5525467, 0.4413555, 0, 0, 0, 1, 1,
1.333087, 0.6610888, -0.1450339, 0, 0, 0, 1, 1,
1.339425, 0.3341872, 2.462977, 0, 0, 0, 1, 1,
1.356842, 0.59183, 1.151957, 0, 0, 0, 1, 1,
1.364239, 0.7017351, 2.158262, 0, 0, 0, 1, 1,
1.37166, -1.762849, 2.662789, 1, 1, 1, 1, 1,
1.371792, 0.4360774, 1.862532, 1, 1, 1, 1, 1,
1.385918, -2.467314, 2.850976, 1, 1, 1, 1, 1,
1.386005, -0.8033587, 0.9615148, 1, 1, 1, 1, 1,
1.389813, -0.7150047, 4.48084, 1, 1, 1, 1, 1,
1.395469, 1.990377, 1.455473, 1, 1, 1, 1, 1,
1.399223, -0.2879525, 1.615646, 1, 1, 1, 1, 1,
1.401221, -0.2249582, 4.43097, 1, 1, 1, 1, 1,
1.414899, -1.640948, 2.990618, 1, 1, 1, 1, 1,
1.436495, 0.9867478, 0.02704027, 1, 1, 1, 1, 1,
1.455008, 1.136982, 2.677291, 1, 1, 1, 1, 1,
1.47814, -0.5477878, 2.936558, 1, 1, 1, 1, 1,
1.48114, 0.09385947, 1.339616, 1, 1, 1, 1, 1,
1.497482, -1.817117, 3.810224, 1, 1, 1, 1, 1,
1.498966, 0.6603801, 0.6561032, 1, 1, 1, 1, 1,
1.516086, 0.5485499, 2.047227, 0, 0, 1, 1, 1,
1.526928, 0.1112993, 0.2201922, 1, 0, 0, 1, 1,
1.527253, -1.444054, 1.822187, 1, 0, 0, 1, 1,
1.533333, 0.8564317, 0.4767317, 1, 0, 0, 1, 1,
1.537237, 0.5282719, 0.6679494, 1, 0, 0, 1, 1,
1.541249, -1.511504, 5.015216, 1, 0, 0, 1, 1,
1.577492, 0.4932339, 1.273181, 0, 0, 0, 1, 1,
1.578113, 0.4267015, 1.304323, 0, 0, 0, 1, 1,
1.579576, 0.1556131, 0.1583744, 0, 0, 0, 1, 1,
1.588118, -0.3506416, 2.92292, 0, 0, 0, 1, 1,
1.597003, -0.4376633, 3.026584, 0, 0, 0, 1, 1,
1.600072, -0.02684491, 0.760825, 0, 0, 0, 1, 1,
1.611346, 0.3263133, 0.6756155, 0, 0, 0, 1, 1,
1.632555, 0.7129608, 1.391994, 1, 1, 1, 1, 1,
1.636783, -1.240927, 1.823862, 1, 1, 1, 1, 1,
1.65162, 0.2060895, 2.370508, 1, 1, 1, 1, 1,
1.667247, -0.5154551, 1.562628, 1, 1, 1, 1, 1,
1.668417, 0.3033157, -0.6302937, 1, 1, 1, 1, 1,
1.671117, 0.1402808, 1.484622, 1, 1, 1, 1, 1,
1.672155, 0.02257422, 0.4233525, 1, 1, 1, 1, 1,
1.679446, -0.9082454, 3.523519, 1, 1, 1, 1, 1,
1.68147, 0.7944114, 2.399035, 1, 1, 1, 1, 1,
1.686937, 0.3714388, 0.7352231, 1, 1, 1, 1, 1,
1.691352, -0.3752402, 1.707835, 1, 1, 1, 1, 1,
1.692777, 1.020451, -0.177576, 1, 1, 1, 1, 1,
1.723157, -0.8052673, 1.042777, 1, 1, 1, 1, 1,
1.729325, -1.971247, 5.048235, 1, 1, 1, 1, 1,
1.754258, -0.2919141, 1.898338, 1, 1, 1, 1, 1,
1.756566, -1.888019, 1.196839, 0, 0, 1, 1, 1,
1.790337, 0.4997216, 0.8434585, 1, 0, 0, 1, 1,
1.807038, -0.2448192, 1.493849, 1, 0, 0, 1, 1,
1.820864, -0.09597808, 1.487746, 1, 0, 0, 1, 1,
1.835767, 0.9535474, 0.6928998, 1, 0, 0, 1, 1,
1.867775, -1.183064, 1.84352, 1, 0, 0, 1, 1,
1.901379, 2.989896, 0.3577375, 0, 0, 0, 1, 1,
1.942104, 0.488202, -1.142457, 0, 0, 0, 1, 1,
1.954602, 0.5926736, 0.6232132, 0, 0, 0, 1, 1,
1.997631, 0.2852961, -0.2105032, 0, 0, 0, 1, 1,
2.013197, 0.8672019, 1.979271, 0, 0, 0, 1, 1,
2.033498, 1.014506, 0.3532494, 0, 0, 0, 1, 1,
2.064579, 0.8036237, 1.108975, 0, 0, 0, 1, 1,
2.067413, 1.045514, 0.2456385, 1, 1, 1, 1, 1,
2.082111, 0.269646, 1.023164, 1, 1, 1, 1, 1,
2.089835, 0.4228622, 0.8068128, 1, 1, 1, 1, 1,
2.107183, 0.5518883, -1.374439, 1, 1, 1, 1, 1,
2.117584, 1.163477, 1.23737, 1, 1, 1, 1, 1,
2.165188, -0.7241138, 3.091127, 1, 1, 1, 1, 1,
2.168069, 0.2323367, 2.200876, 1, 1, 1, 1, 1,
2.17136, 2.035204, 4.03983, 1, 1, 1, 1, 1,
2.240863, -0.5643325, 2.451091, 1, 1, 1, 1, 1,
2.244108, -2.25169, 1.787529, 1, 1, 1, 1, 1,
2.251779, 0.2709366, -0.7240798, 1, 1, 1, 1, 1,
2.291018, 0.4473988, 0.8816571, 1, 1, 1, 1, 1,
2.303097, -0.3350344, 1.876241, 1, 1, 1, 1, 1,
2.320502, -0.3629946, 1.815604, 1, 1, 1, 1, 1,
2.382528, 0.4395746, 1.556616, 1, 1, 1, 1, 1,
2.385635, -0.2521857, 0.260533, 0, 0, 1, 1, 1,
2.390038, -0.316712, 1.152967, 1, 0, 0, 1, 1,
2.394664, 0.2788099, 0.9706221, 1, 0, 0, 1, 1,
2.4112, 0.2931974, 2.810254, 1, 0, 0, 1, 1,
2.430628, 1.884788, 1.802706, 1, 0, 0, 1, 1,
2.438533, -0.2226645, 3.297315, 1, 0, 0, 1, 1,
2.451977, -0.4716812, 3.623983, 0, 0, 0, 1, 1,
2.465535, 1.67756, 0.03289375, 0, 0, 0, 1, 1,
2.471865, 0.7109812, 0.3762187, 0, 0, 0, 1, 1,
2.571867, -0.03251965, -0.1285212, 0, 0, 0, 1, 1,
2.617935, 0.8686157, 1.938821, 0, 0, 0, 1, 1,
2.699655, 1.835136, -0.7095444, 0, 0, 0, 1, 1,
2.700085, 0.5768945, 1.093275, 0, 0, 0, 1, 1,
2.761905, -0.5376206, 2.463461, 1, 1, 1, 1, 1,
2.776493, 1.137759, 1.586536, 1, 1, 1, 1, 1,
2.801551, -0.7949848, 1.224645, 1, 1, 1, 1, 1,
2.868125, -0.6628802, 1.003682, 1, 1, 1, 1, 1,
2.930421, -0.1422548, 2.2738, 1, 1, 1, 1, 1,
2.932451, -0.267957, 0.8727821, 1, 1, 1, 1, 1,
3.175071, 0.3367253, 0.8192747, 1, 1, 1, 1, 1
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
var radius = 10.25384;
var distance = 36.01619;
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
mvMatrix.translate( 0.2747402, 0.02380037, 0.3695617 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.01619);
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
