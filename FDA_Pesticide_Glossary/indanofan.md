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
-3.621435, -0.985733, -2.952361, 1, 0, 0, 1,
-3.039097, 0.2705239, -1.428086, 1, 0.007843138, 0, 1,
-2.949695, -1.193864, -4.669153, 1, 0.01176471, 0, 1,
-2.837854, 0.8578408, -1.139412, 1, 0.01960784, 0, 1,
-2.801888, 1.531568, -1.394737, 1, 0.02352941, 0, 1,
-2.752073, 1.676653, -0.9564427, 1, 0.03137255, 0, 1,
-2.668958, 0.2478671, -1.722871, 1, 0.03529412, 0, 1,
-2.668212, -0.811029, -2.125447, 1, 0.04313726, 0, 1,
-2.443279, 0.4010685, -1.599226, 1, 0.04705882, 0, 1,
-2.414983, 0.871648, -1.40027, 1, 0.05490196, 0, 1,
-2.368801, 0.05548498, -1.540951, 1, 0.05882353, 0, 1,
-2.318061, 1.164351, -1.625723, 1, 0.06666667, 0, 1,
-2.307466, -0.6844184, -0.4449314, 1, 0.07058824, 0, 1,
-2.289895, -1.427261, -3.874159, 1, 0.07843138, 0, 1,
-2.282155, -0.06158498, -2.172168, 1, 0.08235294, 0, 1,
-2.273421, 2.285423, -0.3597179, 1, 0.09019608, 0, 1,
-2.271891, 1.086391, -1.917348, 1, 0.09411765, 0, 1,
-2.269309, -1.377861, -2.06608, 1, 0.1019608, 0, 1,
-2.246336, -0.9766656, -2.966786, 1, 0.1098039, 0, 1,
-2.224953, 0.7300424, -2.020987, 1, 0.1137255, 0, 1,
-2.193182, -0.6016062, -0.3099031, 1, 0.1215686, 0, 1,
-2.149504, -0.5463509, -1.387448, 1, 0.1254902, 0, 1,
-2.083702, -0.6911222, -2.650084, 1, 0.1333333, 0, 1,
-2.075845, -1.588912, -3.083452, 1, 0.1372549, 0, 1,
-2.069092, -0.5256631, -1.613961, 1, 0.145098, 0, 1,
-2.049799, 0.1548048, -0.6971644, 1, 0.1490196, 0, 1,
-2.036021, 1.062453, -1.568673, 1, 0.1568628, 0, 1,
-2.033097, -0.5195421, -1.252709, 1, 0.1607843, 0, 1,
-1.994122, 1.528182, -0.4803901, 1, 0.1686275, 0, 1,
-1.98333, -0.5754884, -2.288872, 1, 0.172549, 0, 1,
-1.972659, 1.40008, -0.3091749, 1, 0.1803922, 0, 1,
-1.969, -0.3047897, -2.364095, 1, 0.1843137, 0, 1,
-1.953229, -0.1148483, -1.285692, 1, 0.1921569, 0, 1,
-1.932069, 1.110541, -1.789754, 1, 0.1960784, 0, 1,
-1.894466, -0.9215744, -2.399588, 1, 0.2039216, 0, 1,
-1.863869, -1.082435, -1.274214, 1, 0.2117647, 0, 1,
-1.809887, 0.7334339, -2.07413, 1, 0.2156863, 0, 1,
-1.802147, -2.176506, -0.7051131, 1, 0.2235294, 0, 1,
-1.797737, 1.023444, -1.487807, 1, 0.227451, 0, 1,
-1.787694, 0.853317, -1.257731, 1, 0.2352941, 0, 1,
-1.778661, -1.230277, -3.811687, 1, 0.2392157, 0, 1,
-1.764921, -1.793111, -2.71351, 1, 0.2470588, 0, 1,
-1.764102, 0.1925159, -1.238842, 1, 0.2509804, 0, 1,
-1.763175, 0.09986555, -1.718173, 1, 0.2588235, 0, 1,
-1.722621, 1.706977, 0.4691547, 1, 0.2627451, 0, 1,
-1.71616, 2.224388, -1.354027, 1, 0.2705882, 0, 1,
-1.709772, 0.7777894, -0.9866384, 1, 0.2745098, 0, 1,
-1.698752, -0.03916145, -0.1282985, 1, 0.282353, 0, 1,
-1.691695, -0.7309311, -4.372524, 1, 0.2862745, 0, 1,
-1.691527, -0.0843079, -1.197789, 1, 0.2941177, 0, 1,
-1.655895, 1.395881, -0.02992537, 1, 0.3019608, 0, 1,
-1.643691, -1.262596, -0.3587206, 1, 0.3058824, 0, 1,
-1.640687, 0.2010572, -2.479149, 1, 0.3137255, 0, 1,
-1.610474, -2.614683, -3.329412, 1, 0.3176471, 0, 1,
-1.602501, -0.5340326, -2.707115, 1, 0.3254902, 0, 1,
-1.60067, 1.380923, -0.3828725, 1, 0.3294118, 0, 1,
-1.595789, 0.3263538, -1.493913, 1, 0.3372549, 0, 1,
-1.569442, 1.644051, -1.943185, 1, 0.3411765, 0, 1,
-1.567569, -0.4149103, -2.982151, 1, 0.3490196, 0, 1,
-1.566211, -1.687047, -0.4868377, 1, 0.3529412, 0, 1,
-1.565874, 0.04063367, -0.8104346, 1, 0.3607843, 0, 1,
-1.561665, -1.470996, -2.583385, 1, 0.3647059, 0, 1,
-1.559114, -0.3918484, -1.857707, 1, 0.372549, 0, 1,
-1.549984, 0.01112703, -4.070706, 1, 0.3764706, 0, 1,
-1.548121, -0.9623965, -2.621319, 1, 0.3843137, 0, 1,
-1.545347, -0.8091398, -1.729215, 1, 0.3882353, 0, 1,
-1.53879, 0.5142321, -1.117428, 1, 0.3960784, 0, 1,
-1.521519, -0.375026, -1.06569, 1, 0.4039216, 0, 1,
-1.519861, -0.07354946, -2.286561, 1, 0.4078431, 0, 1,
-1.516238, 1.167153, -0.3640403, 1, 0.4156863, 0, 1,
-1.515686, 1.500197, -0.2737126, 1, 0.4196078, 0, 1,
-1.511877, -0.2297716, -1.73488, 1, 0.427451, 0, 1,
-1.502069, -0.6800289, -0.7849669, 1, 0.4313726, 0, 1,
-1.501382, -0.1813087, -2.459948, 1, 0.4392157, 0, 1,
-1.485632, -2.029002, -1.975343, 1, 0.4431373, 0, 1,
-1.483533, -0.1598956, -1.830503, 1, 0.4509804, 0, 1,
-1.479223, -1.362285, -1.712826, 1, 0.454902, 0, 1,
-1.478271, -2.365143, -3.114776, 1, 0.4627451, 0, 1,
-1.468206, 0.5424012, -0.361705, 1, 0.4666667, 0, 1,
-1.461937, 0.5829602, -3.259835, 1, 0.4745098, 0, 1,
-1.446186, 0.1483779, -0.8178226, 1, 0.4784314, 0, 1,
-1.441626, -0.217205, -1.186671, 1, 0.4862745, 0, 1,
-1.436979, -0.5558612, -2.922237, 1, 0.4901961, 0, 1,
-1.436809, 1.528274, -1.361753, 1, 0.4980392, 0, 1,
-1.434972, 1.553617, -0.2239398, 1, 0.5058824, 0, 1,
-1.429177, 0.5716887, -0.2645503, 1, 0.509804, 0, 1,
-1.4282, 0.8253394, -1.172923, 1, 0.5176471, 0, 1,
-1.418307, -0.5972058, -3.031955, 1, 0.5215687, 0, 1,
-1.396125, 0.4784715, -0.2723562, 1, 0.5294118, 0, 1,
-1.390766, 1.222088, -0.2887122, 1, 0.5333334, 0, 1,
-1.387351, 1.311839, 0.5876785, 1, 0.5411765, 0, 1,
-1.372615, -1.640038, -4.590705, 1, 0.5450981, 0, 1,
-1.367207, -0.4564725, -2.256363, 1, 0.5529412, 0, 1,
-1.359515, -0.4865173, -1.998565, 1, 0.5568628, 0, 1,
-1.358585, 0.4336064, -0.7370587, 1, 0.5647059, 0, 1,
-1.355844, 0.7200261, -1.674103, 1, 0.5686275, 0, 1,
-1.354838, -0.9374337, -2.825704, 1, 0.5764706, 0, 1,
-1.328518, -0.742008, -2.933194, 1, 0.5803922, 0, 1,
-1.3252, -0.3455985, -2.864618, 1, 0.5882353, 0, 1,
-1.318777, 0.1609395, -2.568569, 1, 0.5921569, 0, 1,
-1.313815, 0.2735274, -4.345707, 1, 0.6, 0, 1,
-1.313271, 1.617396, -2.644552, 1, 0.6078432, 0, 1,
-1.31281, 0.9753132, -2.522614, 1, 0.6117647, 0, 1,
-1.307538, -1.102647, -3.282685, 1, 0.6196079, 0, 1,
-1.302901, 0.1746423, -0.3323933, 1, 0.6235294, 0, 1,
-1.293831, 0.5300705, -1.074283, 1, 0.6313726, 0, 1,
-1.288926, -0.1758178, -1.892222, 1, 0.6352941, 0, 1,
-1.274945, 1.184083, -1.055574, 1, 0.6431373, 0, 1,
-1.263841, 2.653119, 1.647892, 1, 0.6470588, 0, 1,
-1.259937, -0.1144075, -4.017746, 1, 0.654902, 0, 1,
-1.251832, -0.4240887, 1.008697, 1, 0.6588235, 0, 1,
-1.232403, -2.106715, -3.979441, 1, 0.6666667, 0, 1,
-1.23166, -0.8364291, -1.141481, 1, 0.6705883, 0, 1,
-1.22604, -1.940603, -2.888553, 1, 0.6784314, 0, 1,
-1.218065, 0.9636999, -0.2767249, 1, 0.682353, 0, 1,
-1.213383, -0.6969841, -2.126613, 1, 0.6901961, 0, 1,
-1.211383, 0.6836585, -0.3241912, 1, 0.6941177, 0, 1,
-1.206881, 0.5290481, -0.1720383, 1, 0.7019608, 0, 1,
-1.192799, -0.5178832, -1.686361, 1, 0.7098039, 0, 1,
-1.17833, 1.923415, -1.333868, 1, 0.7137255, 0, 1,
-1.174134, -1.38157, -2.973272, 1, 0.7215686, 0, 1,
-1.167256, 0.2876562, -1.564078, 1, 0.7254902, 0, 1,
-1.155909, 1.773809, -2.765738, 1, 0.7333333, 0, 1,
-1.152903, 0.6069636, -1.425875, 1, 0.7372549, 0, 1,
-1.151123, 0.8971775, -2.191064, 1, 0.7450981, 0, 1,
-1.142207, -0.5673748, -2.642231, 1, 0.7490196, 0, 1,
-1.13434, -0.1325799, -1.560658, 1, 0.7568628, 0, 1,
-1.134101, 0.2319012, -3.518619, 1, 0.7607843, 0, 1,
-1.131054, 0.811685, -0.7712614, 1, 0.7686275, 0, 1,
-1.127278, 0.2875785, -2.480232, 1, 0.772549, 0, 1,
-1.119612, 0.975442, 0.1941784, 1, 0.7803922, 0, 1,
-1.11523, 0.8576002, -0.1503811, 1, 0.7843137, 0, 1,
-1.113944, 0.3713793, -2.00393, 1, 0.7921569, 0, 1,
-1.108996, 1.205636, 1.384405, 1, 0.7960784, 0, 1,
-1.108667, 0.5545486, -2.22211, 1, 0.8039216, 0, 1,
-1.106018, -1.370777, -1.553431, 1, 0.8117647, 0, 1,
-1.105908, 0.9176955, -2.333581, 1, 0.8156863, 0, 1,
-1.105825, -0.05889361, -3.057001, 1, 0.8235294, 0, 1,
-1.103508, -0.06765246, -1.069628, 1, 0.827451, 0, 1,
-1.101109, -0.6201035, -0.7994512, 1, 0.8352941, 0, 1,
-1.091767, -0.9622278, -2.909427, 1, 0.8392157, 0, 1,
-1.090945, -0.09597429, -0.8275909, 1, 0.8470588, 0, 1,
-1.089324, 0.1297133, -0.9792266, 1, 0.8509804, 0, 1,
-1.08879, -0.2934669, -2.328282, 1, 0.8588235, 0, 1,
-1.086653, -1.288068, -3.426982, 1, 0.8627451, 0, 1,
-1.084664, 0.3553127, -2.132315, 1, 0.8705882, 0, 1,
-1.074626, -2.147087, -3.698032, 1, 0.8745098, 0, 1,
-1.073277, -1.199062, -3.382702, 1, 0.8823529, 0, 1,
-1.067429, -0.3574951, -2.712327, 1, 0.8862745, 0, 1,
-1.065885, -0.6023068, -0.9239396, 1, 0.8941177, 0, 1,
-1.064253, -0.508439, -0.7682492, 1, 0.8980392, 0, 1,
-1.062557, 0.07780685, -0.7705615, 1, 0.9058824, 0, 1,
-1.05895, -0.2279273, -1.769266, 1, 0.9137255, 0, 1,
-1.054332, 0.1767079, -2.234523, 1, 0.9176471, 0, 1,
-1.044959, -0.3363627, -1.221701, 1, 0.9254902, 0, 1,
-1.044909, -0.1217104, -0.9602149, 1, 0.9294118, 0, 1,
-1.043206, -0.6330453, -3.331058, 1, 0.9372549, 0, 1,
-1.038127, -0.05664014, -1.803058, 1, 0.9411765, 0, 1,
-1.029979, 0.3101055, 1.621144, 1, 0.9490196, 0, 1,
-1.017462, 0.2226816, -2.612051, 1, 0.9529412, 0, 1,
-1.014536, 0.3406628, -1.569552, 1, 0.9607843, 0, 1,
-1.012207, 1.027887, -1.762794, 1, 0.9647059, 0, 1,
-0.9996657, 1.252342, -0.4148009, 1, 0.972549, 0, 1,
-0.9953046, -0.2721368, -1.55628, 1, 0.9764706, 0, 1,
-0.98641, 0.384644, -2.30299, 1, 0.9843137, 0, 1,
-0.985852, -0.03350009, -2.416761, 1, 0.9882353, 0, 1,
-0.9854897, -1.024258, -0.3091057, 1, 0.9960784, 0, 1,
-0.9796586, -0.9197441, -2.593176, 0.9960784, 1, 0, 1,
-0.9725153, -0.3524315, -2.71096, 0.9921569, 1, 0, 1,
-0.9689876, 0.3598454, 0.1378505, 0.9843137, 1, 0, 1,
-0.9659866, -0.04097014, -0.6785454, 0.9803922, 1, 0, 1,
-0.9645337, -1.334478, -2.371221, 0.972549, 1, 0, 1,
-0.9588095, 1.329469, -0.6540407, 0.9686275, 1, 0, 1,
-0.9572731, -0.2502043, -1.14309, 0.9607843, 1, 0, 1,
-0.955142, -0.2231638, -1.826008, 0.9568627, 1, 0, 1,
-0.9549086, 0.2482602, 0.3012885, 0.9490196, 1, 0, 1,
-0.9538513, 1.104999, -0.9341397, 0.945098, 1, 0, 1,
-0.9533496, -1.246891, -2.844197, 0.9372549, 1, 0, 1,
-0.9453635, 0.4846102, -0.2267262, 0.9333333, 1, 0, 1,
-0.9378119, 1.070957, -1.233212, 0.9254902, 1, 0, 1,
-0.9209192, 0.9508617, -0.6511339, 0.9215686, 1, 0, 1,
-0.9182523, 0.4196919, -2.725869, 0.9137255, 1, 0, 1,
-0.9140421, 0.3002702, 0.7430353, 0.9098039, 1, 0, 1,
-0.9120008, -0.6883878, -3.65986, 0.9019608, 1, 0, 1,
-0.9092575, 0.231795, -0.1898975, 0.8941177, 1, 0, 1,
-0.9029907, 0.9468347, -1.358297, 0.8901961, 1, 0, 1,
-0.88789, 1.81973, -0.05533835, 0.8823529, 1, 0, 1,
-0.8828716, -0.7514221, -1.432214, 0.8784314, 1, 0, 1,
-0.8809388, 1.866717, -2.517838, 0.8705882, 1, 0, 1,
-0.8730032, -1.279448, -2.537085, 0.8666667, 1, 0, 1,
-0.8695861, -0.4458577, -0.9766704, 0.8588235, 1, 0, 1,
-0.8608158, 1.854064, -0.5786383, 0.854902, 1, 0, 1,
-0.8466715, -0.4599318, -2.91997, 0.8470588, 1, 0, 1,
-0.8466272, -0.2947589, -0.3483893, 0.8431373, 1, 0, 1,
-0.8455418, -0.6472144, -2.625835, 0.8352941, 1, 0, 1,
-0.8415251, 2.732391, -1.669338, 0.8313726, 1, 0, 1,
-0.8407879, -0.4026904, -1.272412, 0.8235294, 1, 0, 1,
-0.8371315, -1.442291, -3.719512, 0.8196079, 1, 0, 1,
-0.8354503, -1.528598, -1.106024, 0.8117647, 1, 0, 1,
-0.8303627, 0.09231722, -1.483817, 0.8078431, 1, 0, 1,
-0.8294044, -0.5315424, -3.367358, 0.8, 1, 0, 1,
-0.823599, -0.3438843, -2.136598, 0.7921569, 1, 0, 1,
-0.8134474, 1.212454, -0.850765, 0.7882353, 1, 0, 1,
-0.8104395, 1.160253, -0.3328615, 0.7803922, 1, 0, 1,
-0.8068028, 1.364991, -1.03306, 0.7764706, 1, 0, 1,
-0.7995488, -0.3481277, -0.5058177, 0.7686275, 1, 0, 1,
-0.79909, -0.2825072, -2.078547, 0.7647059, 1, 0, 1,
-0.7990136, 1.159785, -1.002723, 0.7568628, 1, 0, 1,
-0.7917238, -0.4026492, -2.914233, 0.7529412, 1, 0, 1,
-0.7860786, -0.09306356, -1.124337, 0.7450981, 1, 0, 1,
-0.7805938, -0.5510191, -4.315797, 0.7411765, 1, 0, 1,
-0.7778742, 1.022496, -0.8295673, 0.7333333, 1, 0, 1,
-0.7721142, 0.2529494, -1.750507, 0.7294118, 1, 0, 1,
-0.7718374, 1.554546, -0.3194267, 0.7215686, 1, 0, 1,
-0.7631796, -0.9030079, -2.395998, 0.7176471, 1, 0, 1,
-0.7612194, 0.03505204, -3.252935, 0.7098039, 1, 0, 1,
-0.7604311, -0.9244913, -0.532319, 0.7058824, 1, 0, 1,
-0.758912, 0.4469825, -0.192608, 0.6980392, 1, 0, 1,
-0.7573952, 0.02842441, -2.362234, 0.6901961, 1, 0, 1,
-0.7545035, -0.8254367, -2.059744, 0.6862745, 1, 0, 1,
-0.7535696, -0.3613512, -1.198786, 0.6784314, 1, 0, 1,
-0.7527716, -1.401015, -0.7523004, 0.6745098, 1, 0, 1,
-0.7496622, 1.654466, 1.159058, 0.6666667, 1, 0, 1,
-0.7456185, 1.330136, -1.207438, 0.6627451, 1, 0, 1,
-0.7414723, -0.688063, -3.678346, 0.654902, 1, 0, 1,
-0.7334245, -1.02342, -3.406017, 0.6509804, 1, 0, 1,
-0.7323821, 1.806187, 0.03452925, 0.6431373, 1, 0, 1,
-0.7310536, 0.1232363, -0.6910101, 0.6392157, 1, 0, 1,
-0.7263902, -0.6803229, -2.358364, 0.6313726, 1, 0, 1,
-0.7175156, 2.723923, -2.053159, 0.627451, 1, 0, 1,
-0.6989272, -0.08511584, -2.482193, 0.6196079, 1, 0, 1,
-0.6953944, -0.3216404, -1.524028, 0.6156863, 1, 0, 1,
-0.6898227, -0.00482594, -1.774485, 0.6078432, 1, 0, 1,
-0.6850544, 0.03587209, -1.736112, 0.6039216, 1, 0, 1,
-0.6849571, 1.136038, 0.7462986, 0.5960785, 1, 0, 1,
-0.684072, 0.5007842, -1.792796, 0.5882353, 1, 0, 1,
-0.6807692, -0.4582894, -1.424287, 0.5843138, 1, 0, 1,
-0.6793476, 0.8527527, -1.306999, 0.5764706, 1, 0, 1,
-0.6792658, 0.911303, -2.758801, 0.572549, 1, 0, 1,
-0.678277, 0.9462131, -1.834501, 0.5647059, 1, 0, 1,
-0.6755483, -0.4062135, -2.065381, 0.5607843, 1, 0, 1,
-0.6742287, -0.3360921, -2.872032, 0.5529412, 1, 0, 1,
-0.6726142, 0.14057, -1.716298, 0.5490196, 1, 0, 1,
-0.6716905, -1.156148, -2.902193, 0.5411765, 1, 0, 1,
-0.6643468, -0.8988186, -2.348477, 0.5372549, 1, 0, 1,
-0.6629463, -1.758373, -1.018757, 0.5294118, 1, 0, 1,
-0.661048, -0.2162671, -2.21647, 0.5254902, 1, 0, 1,
-0.6568404, -0.8016927, -1.643641, 0.5176471, 1, 0, 1,
-0.6539914, 1.66431, -0.2808377, 0.5137255, 1, 0, 1,
-0.6493307, -1.956282, -2.484877, 0.5058824, 1, 0, 1,
-0.6426226, 0.2273561, -2.925868, 0.5019608, 1, 0, 1,
-0.6375713, 1.002739, -0.9695622, 0.4941176, 1, 0, 1,
-0.6327839, 1.638711, 0.009718549, 0.4862745, 1, 0, 1,
-0.6276933, 0.0666917, -1.995306, 0.4823529, 1, 0, 1,
-0.6207342, -0.5476119, -1.107082, 0.4745098, 1, 0, 1,
-0.6190892, 0.3349092, -0.7535699, 0.4705882, 1, 0, 1,
-0.6174152, -0.8187479, -3.058524, 0.4627451, 1, 0, 1,
-0.6162705, -0.07917276, -1.970114, 0.4588235, 1, 0, 1,
-0.6155358, 0.2957919, -0.8850477, 0.4509804, 1, 0, 1,
-0.6152708, -0.5398583, -1.506211, 0.4470588, 1, 0, 1,
-0.6130694, -0.0626358, -0.6109415, 0.4392157, 1, 0, 1,
-0.6115577, 0.4344953, -2.11127, 0.4352941, 1, 0, 1,
-0.6019898, 0.3282766, -0.3344359, 0.427451, 1, 0, 1,
-0.597768, 2.277857, -0.05371111, 0.4235294, 1, 0, 1,
-0.5912827, -0.7541799, -3.200497, 0.4156863, 1, 0, 1,
-0.5904298, -0.5640652, -3.651285, 0.4117647, 1, 0, 1,
-0.5853939, -0.205044, -2.618875, 0.4039216, 1, 0, 1,
-0.5837739, -0.06582143, -1.06339, 0.3960784, 1, 0, 1,
-0.5816914, -0.07450497, -1.528371, 0.3921569, 1, 0, 1,
-0.5805486, -1.758957, -2.522196, 0.3843137, 1, 0, 1,
-0.5726088, 0.5828086, -1.007962, 0.3803922, 1, 0, 1,
-0.568619, -1.372888, -1.910849, 0.372549, 1, 0, 1,
-0.5671147, -0.1903293, -0.2805835, 0.3686275, 1, 0, 1,
-0.5669516, 1.71232, -1.194003, 0.3607843, 1, 0, 1,
-0.564186, 0.1926298, -2.014382, 0.3568628, 1, 0, 1,
-0.5554571, -0.2905045, -1.24599, 0.3490196, 1, 0, 1,
-0.5545766, -1.382205, -4.152414, 0.345098, 1, 0, 1,
-0.5516495, 0.9915735, 0.3111232, 0.3372549, 1, 0, 1,
-0.5515703, 1.297439, -0.6321257, 0.3333333, 1, 0, 1,
-0.5512007, 1.275483, 0.4696635, 0.3254902, 1, 0, 1,
-0.5477101, -0.604482, -2.702445, 0.3215686, 1, 0, 1,
-0.5454051, 2.770431, -0.8609733, 0.3137255, 1, 0, 1,
-0.5448229, -0.5763204, -1.900692, 0.3098039, 1, 0, 1,
-0.543502, 0.04100772, -2.324797, 0.3019608, 1, 0, 1,
-0.5414694, -0.2559527, -2.871997, 0.2941177, 1, 0, 1,
-0.538047, 0.3305661, -2.41261, 0.2901961, 1, 0, 1,
-0.5342778, 1.311383, 0.1230845, 0.282353, 1, 0, 1,
-0.5341657, -0.4607529, -1.319622, 0.2784314, 1, 0, 1,
-0.528293, 1.159292, -1.473903, 0.2705882, 1, 0, 1,
-0.5276052, 0.3900879, -1.115278, 0.2666667, 1, 0, 1,
-0.5255026, -1.054151, -2.390955, 0.2588235, 1, 0, 1,
-0.5246184, -1.0221, -0.783137, 0.254902, 1, 0, 1,
-0.5234002, 1.397073, -1.371475, 0.2470588, 1, 0, 1,
-0.5203951, -0.4190351, -3.210069, 0.2431373, 1, 0, 1,
-0.5200102, 0.06635571, -1.23351, 0.2352941, 1, 0, 1,
-0.5196921, 0.3942684, -0.07279679, 0.2313726, 1, 0, 1,
-0.5175208, -0.6078156, -2.031153, 0.2235294, 1, 0, 1,
-0.5120072, -0.72307, -2.203806, 0.2196078, 1, 0, 1,
-0.5096085, 0.4554616, 0.5501384, 0.2117647, 1, 0, 1,
-0.5090667, 1.156193, -0.6433942, 0.2078431, 1, 0, 1,
-0.5083717, -0.8163604, -1.635766, 0.2, 1, 0, 1,
-0.4983819, -1.101213, -2.672232, 0.1921569, 1, 0, 1,
-0.4973635, -0.9943638, -2.840631, 0.1882353, 1, 0, 1,
-0.4957258, -0.6782191, -2.018596, 0.1803922, 1, 0, 1,
-0.4839574, 0.1250539, -0.6368531, 0.1764706, 1, 0, 1,
-0.4799077, 0.895889, -3.146282, 0.1686275, 1, 0, 1,
-0.479501, -0.3752692, -1.748056, 0.1647059, 1, 0, 1,
-0.4787426, 0.3706522, -1.428563, 0.1568628, 1, 0, 1,
-0.4738111, -0.8928863, -1.925723, 0.1529412, 1, 0, 1,
-0.4724645, -0.6419791, -3.389629, 0.145098, 1, 0, 1,
-0.4720942, -0.2664353, -1.24378, 0.1411765, 1, 0, 1,
-0.4717949, 1.217527, -1.575679, 0.1333333, 1, 0, 1,
-0.4684782, 0.1569669, -2.762892, 0.1294118, 1, 0, 1,
-0.4653692, -0.6280656, -2.739766, 0.1215686, 1, 0, 1,
-0.4612283, 0.5740255, -0.4659747, 0.1176471, 1, 0, 1,
-0.4588075, 0.778218, -0.9124561, 0.1098039, 1, 0, 1,
-0.4466611, 0.6329833, -1.965865, 0.1058824, 1, 0, 1,
-0.4429236, -1.176575, -1.842535, 0.09803922, 1, 0, 1,
-0.4421566, -0.7723012, -3.709341, 0.09019608, 1, 0, 1,
-0.4382041, -0.9690899, -2.757821, 0.08627451, 1, 0, 1,
-0.4343249, 0.6782328, -0.6921898, 0.07843138, 1, 0, 1,
-0.4277844, 0.04682923, 0.4039713, 0.07450981, 1, 0, 1,
-0.4268244, 1.394064, 1.062127, 0.06666667, 1, 0, 1,
-0.4261836, 1.177265, -1.026326, 0.0627451, 1, 0, 1,
-0.424262, -0.9727682, -2.626112, 0.05490196, 1, 0, 1,
-0.414827, -0.2843569, -4.381761, 0.05098039, 1, 0, 1,
-0.4097686, -0.7926388, -4.176491, 0.04313726, 1, 0, 1,
-0.4064154, 0.4298314, -2.879897, 0.03921569, 1, 0, 1,
-0.4021088, 1.089686, -0.6204916, 0.03137255, 1, 0, 1,
-0.3977258, 0.6695669, -1.493049, 0.02745098, 1, 0, 1,
-0.397509, -1.051966, -2.643958, 0.01960784, 1, 0, 1,
-0.3933077, -0.003568818, -0.5765215, 0.01568628, 1, 0, 1,
-0.390662, 0.09913021, -2.654951, 0.007843138, 1, 0, 1,
-0.3903618, -0.9544847, -2.719598, 0.003921569, 1, 0, 1,
-0.3865301, -1.263249, -3.751158, 0, 1, 0.003921569, 1,
-0.3829749, 0.5112925, -1.1212, 0, 1, 0.01176471, 1,
-0.3794684, -0.2104913, -1.48012, 0, 1, 0.01568628, 1,
-0.3793581, 1.487401, 0.4563378, 0, 1, 0.02352941, 1,
-0.3734433, 0.5116158, 0.6760396, 0, 1, 0.02745098, 1,
-0.3715952, 0.01874841, -2.45344, 0, 1, 0.03529412, 1,
-0.3685525, -0.602161, -0.1267713, 0, 1, 0.03921569, 1,
-0.366662, 0.5546196, 0.6681008, 0, 1, 0.04705882, 1,
-0.3643861, -0.04092912, -2.082346, 0, 1, 0.05098039, 1,
-0.3608735, -1.194089, -3.972888, 0, 1, 0.05882353, 1,
-0.3596777, 1.545671, -0.7941341, 0, 1, 0.0627451, 1,
-0.3563499, -0.30978, -1.693396, 0, 1, 0.07058824, 1,
-0.3531253, 0.6301798, -0.1540689, 0, 1, 0.07450981, 1,
-0.3524201, -1.549257, -2.746697, 0, 1, 0.08235294, 1,
-0.3522992, 0.2073747, -0.5947983, 0, 1, 0.08627451, 1,
-0.3497273, -2.267596, -4.090909, 0, 1, 0.09411765, 1,
-0.3494234, -0.6788385, -4.042423, 0, 1, 0.1019608, 1,
-0.3477623, -0.113778, -1.776989, 0, 1, 0.1058824, 1,
-0.3384855, 0.8952206, 3.146616, 0, 1, 0.1137255, 1,
-0.3359499, 0.1358338, -1.810744, 0, 1, 0.1176471, 1,
-0.3316278, -1.513392, -0.9113142, 0, 1, 0.1254902, 1,
-0.3305579, -0.2774149, -2.154525, 0, 1, 0.1294118, 1,
-0.3293906, -0.5579684, -2.02121, 0, 1, 0.1372549, 1,
-0.3282121, -0.8501998, -2.057703, 0, 1, 0.1411765, 1,
-0.3269811, -1.582751, -5.088949, 0, 1, 0.1490196, 1,
-0.318568, -0.596545, -1.851363, 0, 1, 0.1529412, 1,
-0.3183029, -1.78624, -3.039816, 0, 1, 0.1607843, 1,
-0.3153347, 0.5256514, 0.822145, 0, 1, 0.1647059, 1,
-0.3137701, 1.036704, 2.186992, 0, 1, 0.172549, 1,
-0.3098885, 0.01769261, -2.631489, 0, 1, 0.1764706, 1,
-0.299828, -0.8925792, -2.152031, 0, 1, 0.1843137, 1,
-0.2926272, 0.704273, -0.2102547, 0, 1, 0.1882353, 1,
-0.2875734, 0.5998737, -1.681408, 0, 1, 0.1960784, 1,
-0.2798001, 0.3055506, -0.0905531, 0, 1, 0.2039216, 1,
-0.2775668, 0.228265, -1.952989, 0, 1, 0.2078431, 1,
-0.2765653, -1.929767, -4.002457, 0, 1, 0.2156863, 1,
-0.2763375, 0.443275, -1.21549, 0, 1, 0.2196078, 1,
-0.2720013, -0.685322, -1.343309, 0, 1, 0.227451, 1,
-0.2714255, 0.3917137, -0.8684197, 0, 1, 0.2313726, 1,
-0.2713921, 0.8280436, -0.4180703, 0, 1, 0.2392157, 1,
-0.2710414, -0.8271875, -2.073657, 0, 1, 0.2431373, 1,
-0.2710402, -0.1332608, -1.48958, 0, 1, 0.2509804, 1,
-0.2709242, 0.2463455, -0.3630533, 0, 1, 0.254902, 1,
-0.2671646, -1.83342, -3.312912, 0, 1, 0.2627451, 1,
-0.2640384, 1.315119, -0.1070061, 0, 1, 0.2666667, 1,
-0.2591427, 0.6678607, -1.920242, 0, 1, 0.2745098, 1,
-0.258067, -1.020213, -2.341574, 0, 1, 0.2784314, 1,
-0.2565337, 0.6480957, -0.6571702, 0, 1, 0.2862745, 1,
-0.2559231, -0.6871293, -2.721113, 0, 1, 0.2901961, 1,
-0.2555824, 0.2697574, 0.8582885, 0, 1, 0.2980392, 1,
-0.2512773, 0.3865635, 0.04043834, 0, 1, 0.3058824, 1,
-0.24895, 0.1616093, -1.182716, 0, 1, 0.3098039, 1,
-0.2462102, 0.781179, -0.2763103, 0, 1, 0.3176471, 1,
-0.2443522, -1.408107, -2.128072, 0, 1, 0.3215686, 1,
-0.2408922, -0.3841064, -1.348136, 0, 1, 0.3294118, 1,
-0.2364806, 0.2004326, -2.085895, 0, 1, 0.3333333, 1,
-0.2341966, 0.6324092, -1.651297, 0, 1, 0.3411765, 1,
-0.2246674, -0.9243994, -1.801344, 0, 1, 0.345098, 1,
-0.2207013, -0.1137263, -1.087336, 0, 1, 0.3529412, 1,
-0.2200975, 2.075183, 0.4505102, 0, 1, 0.3568628, 1,
-0.2183195, 0.2175713, -1.182942, 0, 1, 0.3647059, 1,
-0.2182712, -1.691599, -3.606776, 0, 1, 0.3686275, 1,
-0.2063896, -0.5883256, -3.111889, 0, 1, 0.3764706, 1,
-0.1978475, -0.009417189, -4.223419, 0, 1, 0.3803922, 1,
-0.1978202, 0.3173699, 0.6477395, 0, 1, 0.3882353, 1,
-0.1916388, 0.01864829, -1.372865, 0, 1, 0.3921569, 1,
-0.1916329, -0.8001402, -2.424431, 0, 1, 0.4, 1,
-0.1905023, 0.177765, -2.680408, 0, 1, 0.4078431, 1,
-0.1866551, -0.7819372, -2.262378, 0, 1, 0.4117647, 1,
-0.1809617, -0.3639911, -1.627281, 0, 1, 0.4196078, 1,
-0.1808968, 0.8490389, -0.515646, 0, 1, 0.4235294, 1,
-0.1808966, 0.921763, -1.772908, 0, 1, 0.4313726, 1,
-0.1798493, 0.8151712, 0.7177523, 0, 1, 0.4352941, 1,
-0.1741834, 0.5698231, 1.778286, 0, 1, 0.4431373, 1,
-0.173714, -1.02839, -2.756268, 0, 1, 0.4470588, 1,
-0.1693473, -0.01674735, -1.798354, 0, 1, 0.454902, 1,
-0.1661627, 0.4175478, -2.018772, 0, 1, 0.4588235, 1,
-0.1648747, 1.205301, -0.7906559, 0, 1, 0.4666667, 1,
-0.1643156, -0.2167967, -1.946348, 0, 1, 0.4705882, 1,
-0.1615497, -0.7261236, -4.749319, 0, 1, 0.4784314, 1,
-0.160385, 2.04907, -0.5345144, 0, 1, 0.4823529, 1,
-0.15967, -1.011237, -3.294888, 0, 1, 0.4901961, 1,
-0.1590379, 0.2562693, -0.1692833, 0, 1, 0.4941176, 1,
-0.1582453, 0.9758851, 0.7985487, 0, 1, 0.5019608, 1,
-0.1479763, 0.1495052, -0.9490634, 0, 1, 0.509804, 1,
-0.1458105, 0.1047962, 0.04313737, 0, 1, 0.5137255, 1,
-0.1446197, 0.1709592, -0.4476919, 0, 1, 0.5215687, 1,
-0.1406962, -0.5562626, -4.849684, 0, 1, 0.5254902, 1,
-0.1402217, 0.08586664, -0.02580802, 0, 1, 0.5333334, 1,
-0.1386095, 1.619371, -0.5610787, 0, 1, 0.5372549, 1,
-0.1362778, 0.5246857, -0.4225594, 0, 1, 0.5450981, 1,
-0.1266212, 1.297702, -0.01260706, 0, 1, 0.5490196, 1,
-0.1260497, -0.9499745, -2.544532, 0, 1, 0.5568628, 1,
-0.1224895, 0.8790175, -0.9097195, 0, 1, 0.5607843, 1,
-0.1220343, 0.5691182, -0.7244504, 0, 1, 0.5686275, 1,
-0.1189021, -1.015661, -2.642339, 0, 1, 0.572549, 1,
-0.117605, 0.5478988, -0.6332257, 0, 1, 0.5803922, 1,
-0.1163803, -0.8708905, -2.586223, 0, 1, 0.5843138, 1,
-0.1140328, 0.9513316, 0.436089, 0, 1, 0.5921569, 1,
-0.1118282, -1.571954, -3.129149, 0, 1, 0.5960785, 1,
-0.1113179, -2.65597, -4.662905, 0, 1, 0.6039216, 1,
-0.1093173, 0.3055674, -1.515714, 0, 1, 0.6117647, 1,
-0.1068946, 0.8662107, -0.3649218, 0, 1, 0.6156863, 1,
-0.1057059, -0.5757788, -1.894879, 0, 1, 0.6235294, 1,
-0.1043873, 0.5556415, 0.4850441, 0, 1, 0.627451, 1,
-0.1043215, -0.6167613, -2.588979, 0, 1, 0.6352941, 1,
-0.1025311, 0.7946113, 1.121481, 0, 1, 0.6392157, 1,
-0.09865345, 2.220816, 0.3478851, 0, 1, 0.6470588, 1,
-0.09803841, -0.50327, -2.870254, 0, 1, 0.6509804, 1,
-0.09693502, 0.4535072, -1.070815, 0, 1, 0.6588235, 1,
-0.09303708, -1.641553, -3.081129, 0, 1, 0.6627451, 1,
-0.08990048, -0.6433016, -4.188825, 0, 1, 0.6705883, 1,
-0.08936146, -1.249949, -3.236271, 0, 1, 0.6745098, 1,
-0.08821561, 0.694589, -1.68557, 0, 1, 0.682353, 1,
-0.08647963, -1.776384, -4.201375, 0, 1, 0.6862745, 1,
-0.08572253, -1.998754, -2.938364, 0, 1, 0.6941177, 1,
-0.08190463, -0.8690819, -1.587867, 0, 1, 0.7019608, 1,
-0.07444779, 0.3119005, -0.1320621, 0, 1, 0.7058824, 1,
-0.07429779, -0.04136311, -1.589645, 0, 1, 0.7137255, 1,
-0.07290006, -0.08771337, -2.011118, 0, 1, 0.7176471, 1,
-0.06785131, 0.3916007, 0.07031592, 0, 1, 0.7254902, 1,
-0.06693543, 1.322626, -1.542565, 0, 1, 0.7294118, 1,
-0.06660806, -0.07728031, -4.631275, 0, 1, 0.7372549, 1,
-0.0643611, -1.879204, -3.018312, 0, 1, 0.7411765, 1,
-0.06243488, 0.111545, -2.050748, 0, 1, 0.7490196, 1,
-0.05920022, -0.4122846, -2.190646, 0, 1, 0.7529412, 1,
-0.05897231, 0.9422184, -0.6148715, 0, 1, 0.7607843, 1,
-0.05599198, 0.328641, -1.706505, 0, 1, 0.7647059, 1,
-0.05019672, -1.110416, -4.688923, 0, 1, 0.772549, 1,
-0.04973672, 1.199894, -1.543687, 0, 1, 0.7764706, 1,
-0.04929928, 0.8553328, 0.07947213, 0, 1, 0.7843137, 1,
-0.04821714, 0.01475425, -0.5362384, 0, 1, 0.7882353, 1,
-0.04102626, -0.5915195, -2.957637, 0, 1, 0.7960784, 1,
-0.04014035, 0.3233829, -0.6940471, 0, 1, 0.8039216, 1,
-0.03499365, -0.1900181, -0.6937482, 0, 1, 0.8078431, 1,
-0.02910791, 0.5044545, 2.488629, 0, 1, 0.8156863, 1,
-0.02169487, -0.8439407, -2.863062, 0, 1, 0.8196079, 1,
-0.01940688, 0.815048, 0.4289909, 0, 1, 0.827451, 1,
-0.01908146, -0.6858968, -4.084777, 0, 1, 0.8313726, 1,
-0.01837285, -1.04197, -3.631826, 0, 1, 0.8392157, 1,
-0.01753059, -0.5981535, -2.928418, 0, 1, 0.8431373, 1,
-0.01742414, -0.5325788, -3.243073, 0, 1, 0.8509804, 1,
-0.01348494, -0.2410037, -3.050507, 0, 1, 0.854902, 1,
-0.0113087, -1.414229, -2.461479, 0, 1, 0.8627451, 1,
-0.005074925, 1.619283, -1.086103, 0, 1, 0.8666667, 1,
-0.005052787, -0.3257277, -4.121543, 0, 1, 0.8745098, 1,
-0.004046324, 0.5398655, 0.5212328, 0, 1, 0.8784314, 1,
-0.00393129, 1.233325, -0.1450605, 0, 1, 0.8862745, 1,
-0.002481631, -0.772823, -2.143508, 0, 1, 0.8901961, 1,
-0.002008297, 1.200516, -0.3317634, 0, 1, 0.8980392, 1,
0.007511912, -0.5066189, 5.214513, 0, 1, 0.9058824, 1,
0.01357403, 1.155147, -0.00739638, 0, 1, 0.9098039, 1,
0.01579838, 0.007961974, 0.6029614, 0, 1, 0.9176471, 1,
0.01645762, 1.136361, 0.2958364, 0, 1, 0.9215686, 1,
0.02119453, -0.09409537, 4.452416, 0, 1, 0.9294118, 1,
0.03342083, -2.016566, 2.96172, 0, 1, 0.9333333, 1,
0.03362467, -0.01420635, 1.877664, 0, 1, 0.9411765, 1,
0.03518175, 0.0630624, -0.1954326, 0, 1, 0.945098, 1,
0.03635274, 0.6961768, 0.3929186, 0, 1, 0.9529412, 1,
0.03676108, -0.3105415, 3.622985, 0, 1, 0.9568627, 1,
0.04416049, -0.8331655, 2.447397, 0, 1, 0.9647059, 1,
0.05054506, -1.909174, 2.383548, 0, 1, 0.9686275, 1,
0.05208747, 0.5622429, -0.01582545, 0, 1, 0.9764706, 1,
0.05460029, -0.4365865, 3.029694, 0, 1, 0.9803922, 1,
0.05608167, -0.1303793, 0.8448961, 0, 1, 0.9882353, 1,
0.05794102, -0.02078104, 1.108069, 0, 1, 0.9921569, 1,
0.05903683, -0.3052147, 1.723901, 0, 1, 1, 1,
0.0591821, 0.003539313, 1.436874, 0, 0.9921569, 1, 1,
0.05957888, 0.1007724, 0.6395113, 0, 0.9882353, 1, 1,
0.0635736, 0.4000841, -1.281448, 0, 0.9803922, 1, 1,
0.06411979, 0.7077516, 0.8371829, 0, 0.9764706, 1, 1,
0.07344056, 1.767869, -0.1659107, 0, 0.9686275, 1, 1,
0.07381853, -1.033462, 2.775129, 0, 0.9647059, 1, 1,
0.07547314, 0.1921388, -0.3603641, 0, 0.9568627, 1, 1,
0.07916222, 0.9781641, -1.249472, 0, 0.9529412, 1, 1,
0.07975534, -2.101525, 3.478197, 0, 0.945098, 1, 1,
0.0800749, -0.4108476, 2.347892, 0, 0.9411765, 1, 1,
0.08935179, 0.1182651, 1.222558, 0, 0.9333333, 1, 1,
0.1020995, -0.6020808, 1.535608, 0, 0.9294118, 1, 1,
0.1043294, -0.9981507, 4.586791, 0, 0.9215686, 1, 1,
0.1055509, -0.09477951, 2.178909, 0, 0.9176471, 1, 1,
0.1055859, -1.706446, 3.530771, 0, 0.9098039, 1, 1,
0.1085854, -1.132819, 3.732426, 0, 0.9058824, 1, 1,
0.1093784, -0.5203611, 4.264284, 0, 0.8980392, 1, 1,
0.1123706, -2.303718, 2.911929, 0, 0.8901961, 1, 1,
0.1135354, -1.00762, 3.908736, 0, 0.8862745, 1, 1,
0.1137736, -1.661246, 2.414535, 0, 0.8784314, 1, 1,
0.1144681, 0.1470897, 0.7443386, 0, 0.8745098, 1, 1,
0.1150525, -0.03546823, 1.740611, 0, 0.8666667, 1, 1,
0.1150888, -1.892011, 2.156932, 0, 0.8627451, 1, 1,
0.1154728, -0.1700843, 1.872466, 0, 0.854902, 1, 1,
0.1192637, 0.6255352, -1.216049, 0, 0.8509804, 1, 1,
0.1197406, 0.4332157, 1.156502, 0, 0.8431373, 1, 1,
0.1202149, 0.5823905, -1.140782, 0, 0.8392157, 1, 1,
0.1211552, 0.7382637, -0.2638941, 0, 0.8313726, 1, 1,
0.1222563, 0.7348428, -1.91308, 0, 0.827451, 1, 1,
0.1227186, -0.1313159, 1.378084, 0, 0.8196079, 1, 1,
0.1243068, 0.5127571, 0.7071616, 0, 0.8156863, 1, 1,
0.1267859, 0.9025971, -1.854246, 0, 0.8078431, 1, 1,
0.1300569, 2.729078, 1.044628, 0, 0.8039216, 1, 1,
0.1328591, -0.3908173, 2.704803, 0, 0.7960784, 1, 1,
0.1347494, 0.3309884, -0.2499293, 0, 0.7882353, 1, 1,
0.1348033, -0.6176087, 2.568859, 0, 0.7843137, 1, 1,
0.1392234, 1.074555, 0.04049723, 0, 0.7764706, 1, 1,
0.1397032, -0.6144214, 4.105391, 0, 0.772549, 1, 1,
0.1405075, 1.107322, 0.8805727, 0, 0.7647059, 1, 1,
0.1405828, 2.547783, -0.4035686, 0, 0.7607843, 1, 1,
0.142446, -1.217505, 1.938279, 0, 0.7529412, 1, 1,
0.1445726, 0.3243288, 1.457619, 0, 0.7490196, 1, 1,
0.1469701, 1.267803, 0.5980465, 0, 0.7411765, 1, 1,
0.1557391, -0.4425722, 3.650826, 0, 0.7372549, 1, 1,
0.1570811, -2.063429, 3.157602, 0, 0.7294118, 1, 1,
0.1575535, 0.3796594, 1.041215, 0, 0.7254902, 1, 1,
0.1597838, -1.474698, 2.537105, 0, 0.7176471, 1, 1,
0.1601214, -1.637174, 3.651247, 0, 0.7137255, 1, 1,
0.1624713, 0.2674217, -0.05839635, 0, 0.7058824, 1, 1,
0.1650261, 0.6411442, 0.4458866, 0, 0.6980392, 1, 1,
0.1679649, -0.3008817, 2.273242, 0, 0.6941177, 1, 1,
0.1723129, -1.752741, 1.680996, 0, 0.6862745, 1, 1,
0.1728921, -1.028456, 3.204959, 0, 0.682353, 1, 1,
0.1751361, 0.6239138, -0.1667968, 0, 0.6745098, 1, 1,
0.1772625, 1.621283, -0.2760297, 0, 0.6705883, 1, 1,
0.1807181, 0.7336866, -0.8495601, 0, 0.6627451, 1, 1,
0.1828039, 0.9082147, 0.9293901, 0, 0.6588235, 1, 1,
0.1873191, -0.7626195, 1.653474, 0, 0.6509804, 1, 1,
0.1875865, -0.1418436, 2.688946, 0, 0.6470588, 1, 1,
0.1882841, -1.613505, 3.707009, 0, 0.6392157, 1, 1,
0.1890235, -0.8827082, 2.956208, 0, 0.6352941, 1, 1,
0.1894635, 1.596678, -0.1434494, 0, 0.627451, 1, 1,
0.1902498, -1.220989, 3.55308, 0, 0.6235294, 1, 1,
0.1948598, -0.6343329, 3.597123, 0, 0.6156863, 1, 1,
0.1959074, -1.296634, 4.700073, 0, 0.6117647, 1, 1,
0.1962359, -1.347695, 2.765139, 0, 0.6039216, 1, 1,
0.201478, 0.8173559, -1.754128, 0, 0.5960785, 1, 1,
0.2053406, 0.6054595, 0.9294523, 0, 0.5921569, 1, 1,
0.2059018, 1.009139, 0.9983565, 0, 0.5843138, 1, 1,
0.2080463, -0.1611444, 1.83129, 0, 0.5803922, 1, 1,
0.2099312, -0.9284796, 1.765767, 0, 0.572549, 1, 1,
0.2118013, 3.497526, -0.5302144, 0, 0.5686275, 1, 1,
0.2130859, 0.9688173, 1.699411, 0, 0.5607843, 1, 1,
0.2136253, 0.7869959, 0.1299492, 0, 0.5568628, 1, 1,
0.2138829, 0.4401174, -0.1902765, 0, 0.5490196, 1, 1,
0.2154645, 0.3104466, 0.4404065, 0, 0.5450981, 1, 1,
0.217753, -0.6055112, 3.738256, 0, 0.5372549, 1, 1,
0.2203781, -0.05955264, 2.495507, 0, 0.5333334, 1, 1,
0.2211867, 0.1016592, 1.627975, 0, 0.5254902, 1, 1,
0.2230644, 0.551497, -1.426623, 0, 0.5215687, 1, 1,
0.2232917, -1.303835, 4.999779, 0, 0.5137255, 1, 1,
0.2258716, -0.03292671, 2.123536, 0, 0.509804, 1, 1,
0.2271584, -0.07723149, 2.197981, 0, 0.5019608, 1, 1,
0.2289546, 0.5823402, 0.2020355, 0, 0.4941176, 1, 1,
0.2310379, -1.249568, 2.067537, 0, 0.4901961, 1, 1,
0.2312333, 1.827372, 1.079556, 0, 0.4823529, 1, 1,
0.231702, 0.9808331, -0.005775497, 0, 0.4784314, 1, 1,
0.2338665, 0.5089249, -0.5186868, 0, 0.4705882, 1, 1,
0.2349775, 0.8330653, -1.198115, 0, 0.4666667, 1, 1,
0.2373041, 0.3355549, -1.164653, 0, 0.4588235, 1, 1,
0.241144, -0.6656638, 3.286256, 0, 0.454902, 1, 1,
0.2427859, -1.056512, 2.028057, 0, 0.4470588, 1, 1,
0.2438586, -1.218483, 3.368701, 0, 0.4431373, 1, 1,
0.2467935, -1.599461, 4.388947, 0, 0.4352941, 1, 1,
0.2469248, 0.117672, 1.609866, 0, 0.4313726, 1, 1,
0.2469495, 1.065901, 1.067768, 0, 0.4235294, 1, 1,
0.2499022, 1.116338, 1.65846, 0, 0.4196078, 1, 1,
0.2531361, -0.1334794, 1.809607, 0, 0.4117647, 1, 1,
0.2567365, 0.1905148, -0.1080382, 0, 0.4078431, 1, 1,
0.2592333, -1.362001, 3.653224, 0, 0.4, 1, 1,
0.2601173, -0.1574275, 3.781726, 0, 0.3921569, 1, 1,
0.2695327, -0.7372792, 4.429192, 0, 0.3882353, 1, 1,
0.2705851, -0.1568953, 3.056645, 0, 0.3803922, 1, 1,
0.2708428, -0.3621799, 3.252406, 0, 0.3764706, 1, 1,
0.2735622, 1.243303, 0.4999358, 0, 0.3686275, 1, 1,
0.276773, -1.457471, 3.345888, 0, 0.3647059, 1, 1,
0.2789244, -0.389004, 1.827399, 0, 0.3568628, 1, 1,
0.2870028, -0.5931305, 2.339277, 0, 0.3529412, 1, 1,
0.3006789, -1.272013, 3.913175, 0, 0.345098, 1, 1,
0.3030075, 0.1586464, 0.6838812, 0, 0.3411765, 1, 1,
0.3054694, 1.534147, -0.175168, 0, 0.3333333, 1, 1,
0.3139559, 1.182703, 0.4189732, 0, 0.3294118, 1, 1,
0.3139588, -0.7377586, 3.230925, 0, 0.3215686, 1, 1,
0.3151407, 2.129779, -1.286765, 0, 0.3176471, 1, 1,
0.315144, -0.5207032, 2.47216, 0, 0.3098039, 1, 1,
0.3167504, 1.08536, -0.642374, 0, 0.3058824, 1, 1,
0.3172461, -1.171843, 1.167879, 0, 0.2980392, 1, 1,
0.3250848, -0.8442839, 1.626246, 0, 0.2901961, 1, 1,
0.3267364, -2.094741, 3.347733, 0, 0.2862745, 1, 1,
0.333875, -0.3040619, 1.573743, 0, 0.2784314, 1, 1,
0.3352565, 1.197021, -0.1095719, 0, 0.2745098, 1, 1,
0.3396118, 0.02492521, 0.7107205, 0, 0.2666667, 1, 1,
0.3410158, -1.712728, 3.128699, 0, 0.2627451, 1, 1,
0.3418716, 0.1108127, 2.850173, 0, 0.254902, 1, 1,
0.3513067, -1.283242, 3.126234, 0, 0.2509804, 1, 1,
0.3543424, 0.4744008, 1.698002, 0, 0.2431373, 1, 1,
0.3570285, 0.2158639, 0.320541, 0, 0.2392157, 1, 1,
0.3600887, -0.9269095, 1.993882, 0, 0.2313726, 1, 1,
0.3613122, -0.5164467, 2.562463, 0, 0.227451, 1, 1,
0.3669502, 0.4944065, -0.1804602, 0, 0.2196078, 1, 1,
0.3688684, 0.3426366, 0.8166698, 0, 0.2156863, 1, 1,
0.3688794, 0.7882185, 1.881943, 0, 0.2078431, 1, 1,
0.3746018, 0.2982717, 1.736433, 0, 0.2039216, 1, 1,
0.383053, -1.299012, 3.570975, 0, 0.1960784, 1, 1,
0.385534, 0.2600541, 1.075319, 0, 0.1882353, 1, 1,
0.3855505, -0.6908882, 1.589158, 0, 0.1843137, 1, 1,
0.3925874, 1.150183, 0.5741974, 0, 0.1764706, 1, 1,
0.3933967, -1.69047, 2.383226, 0, 0.172549, 1, 1,
0.3949063, 0.7580069, 0.2770796, 0, 0.1647059, 1, 1,
0.3957005, 1.070286, 1.258695, 0, 0.1607843, 1, 1,
0.3981262, 1.900332, 0.3055037, 0, 0.1529412, 1, 1,
0.4000323, 0.2441802, 0.9175239, 0, 0.1490196, 1, 1,
0.4026612, 2.00819, 0.3952546, 0, 0.1411765, 1, 1,
0.4051173, 2.322682, -0.1039858, 0, 0.1372549, 1, 1,
0.4054707, 0.5134056, -0.2273388, 0, 0.1294118, 1, 1,
0.4055867, 1.902117, 3.535557, 0, 0.1254902, 1, 1,
0.4112447, 1.063883, -0.2914936, 0, 0.1176471, 1, 1,
0.4119049, 1.671067, 1.090168, 0, 0.1137255, 1, 1,
0.4141916, 2.147504, 1.255927, 0, 0.1058824, 1, 1,
0.4147108, -2.013134, 4.452088, 0, 0.09803922, 1, 1,
0.4190347, 2.411077, -0.01927687, 0, 0.09411765, 1, 1,
0.4217319, -0.1080991, 2.033486, 0, 0.08627451, 1, 1,
0.4266139, -0.4653387, 1.648482, 0, 0.08235294, 1, 1,
0.4268671, 0.3600275, -0.4609373, 0, 0.07450981, 1, 1,
0.4351289, -0.6339759, 3.363416, 0, 0.07058824, 1, 1,
0.43623, 0.7442608, 2.401968, 0, 0.0627451, 1, 1,
0.4399783, 0.8769199, -1.098039, 0, 0.05882353, 1, 1,
0.4445362, -0.4509097, 2.347759, 0, 0.05098039, 1, 1,
0.445015, -0.1598956, 2.657731, 0, 0.04705882, 1, 1,
0.4459495, 2.437685, -1.11463, 0, 0.03921569, 1, 1,
0.4460311, 2.063277, -0.03526166, 0, 0.03529412, 1, 1,
0.449175, -0.6479744, 3.105301, 0, 0.02745098, 1, 1,
0.4594462, -0.06944616, 0.8430086, 0, 0.02352941, 1, 1,
0.4622043, 0.2842752, 2.246216, 0, 0.01568628, 1, 1,
0.4691044, -1.139204, 1.107948, 0, 0.01176471, 1, 1,
0.4710059, 0.9899542, 0.01274411, 0, 0.003921569, 1, 1,
0.4713278, 0.6158635, 0.7086402, 0.003921569, 0, 1, 1,
0.4738984, -0.04442424, 1.904199, 0.007843138, 0, 1, 1,
0.4796601, 1.186899, 2.138839, 0.01568628, 0, 1, 1,
0.481567, -0.2671045, 2.485326, 0.01960784, 0, 1, 1,
0.483575, 0.1086695, 1.362516, 0.02745098, 0, 1, 1,
0.4879152, -0.3168245, 1.351, 0.03137255, 0, 1, 1,
0.4931974, 0.5677453, 0.3231897, 0.03921569, 0, 1, 1,
0.4933432, 0.2054184, 1.820356, 0.04313726, 0, 1, 1,
0.4956993, -0.538786, 1.367097, 0.05098039, 0, 1, 1,
0.4993306, 1.286126, 0.4956178, 0.05490196, 0, 1, 1,
0.5021645, -1.168261, 3.803833, 0.0627451, 0, 1, 1,
0.5089389, -0.06359983, 1.780884, 0.06666667, 0, 1, 1,
0.5105143, -0.546806, 1.718922, 0.07450981, 0, 1, 1,
0.5138658, -1.726358, 3.333006, 0.07843138, 0, 1, 1,
0.5173934, -0.001119396, 1.706275, 0.08627451, 0, 1, 1,
0.5184612, -0.7425717, 2.097796, 0.09019608, 0, 1, 1,
0.5192678, 0.4498407, 1.723586, 0.09803922, 0, 1, 1,
0.5196441, 1.655638, 0.8453761, 0.1058824, 0, 1, 1,
0.5203192, 1.088327, 0.04474168, 0.1098039, 0, 1, 1,
0.5205589, 0.5267981, -0.4215792, 0.1176471, 0, 1, 1,
0.5234122, -0.9170863, 2.999215, 0.1215686, 0, 1, 1,
0.528806, 0.003888003, 1.891492, 0.1294118, 0, 1, 1,
0.5309955, 0.01313664, 0.6179205, 0.1333333, 0, 1, 1,
0.5362293, 1.21038, 0.5084921, 0.1411765, 0, 1, 1,
0.5395076, 0.3294134, 0.0138496, 0.145098, 0, 1, 1,
0.5401492, -1.025189, 2.001867, 0.1529412, 0, 1, 1,
0.5428535, -0.4130308, 4.542942, 0.1568628, 0, 1, 1,
0.5438069, 1.55139, -0.2742838, 0.1647059, 0, 1, 1,
0.5457416, -0.289575, 2.020729, 0.1686275, 0, 1, 1,
0.5462471, 0.7397221, -0.2913695, 0.1764706, 0, 1, 1,
0.5476089, 0.9903509, 2.084585, 0.1803922, 0, 1, 1,
0.5490975, 0.940143, 0.9338771, 0.1882353, 0, 1, 1,
0.5531937, 1.030127, -0.193266, 0.1921569, 0, 1, 1,
0.5570546, -0.3074456, 0.1576801, 0.2, 0, 1, 1,
0.5604724, 0.132385, 2.04459, 0.2078431, 0, 1, 1,
0.5645042, 0.3400055, 3.271307, 0.2117647, 0, 1, 1,
0.565999, -0.03160286, 3.444006, 0.2196078, 0, 1, 1,
0.567525, -0.3454983, 3.732835, 0.2235294, 0, 1, 1,
0.5704665, -1.013183, 4.386967, 0.2313726, 0, 1, 1,
0.5753917, -0.2091648, 2.476338, 0.2352941, 0, 1, 1,
0.5761538, 0.5830756, -0.4173281, 0.2431373, 0, 1, 1,
0.5843031, -1.743529, 2.805892, 0.2470588, 0, 1, 1,
0.5843456, -0.4077137, 2.051692, 0.254902, 0, 1, 1,
0.5849575, -1.544552, 2.682984, 0.2588235, 0, 1, 1,
0.5876412, 1.053004, 2.328467, 0.2666667, 0, 1, 1,
0.5909149, -0.7242164, 2.729779, 0.2705882, 0, 1, 1,
0.5946141, 0.1653487, 1.609165, 0.2784314, 0, 1, 1,
0.5949622, -0.08236855, 0.8612752, 0.282353, 0, 1, 1,
0.5979334, -0.9264255, 2.927892, 0.2901961, 0, 1, 1,
0.598396, -0.1743796, 0.7864172, 0.2941177, 0, 1, 1,
0.5992843, -1.440845, 2.618009, 0.3019608, 0, 1, 1,
0.6006908, -1.008311, 1.515803, 0.3098039, 0, 1, 1,
0.6068857, -1.247631, 3.068779, 0.3137255, 0, 1, 1,
0.6144968, -0.834732, 1.935571, 0.3215686, 0, 1, 1,
0.6150473, 0.066396, 0.6929348, 0.3254902, 0, 1, 1,
0.6150684, 0.8138779, 0.6699478, 0.3333333, 0, 1, 1,
0.6162815, 0.7732624, -0.5085014, 0.3372549, 0, 1, 1,
0.6194143, -0.08710633, 0.1708409, 0.345098, 0, 1, 1,
0.621589, 0.3915911, 1.214797, 0.3490196, 0, 1, 1,
0.6217603, -0.05268632, 2.396238, 0.3568628, 0, 1, 1,
0.6218871, 0.4959222, 0.1700045, 0.3607843, 0, 1, 1,
0.6242439, -1.251292, 4.593697, 0.3686275, 0, 1, 1,
0.62514, 2.655617, 0.4134061, 0.372549, 0, 1, 1,
0.6310716, -0.196649, 2.743181, 0.3803922, 0, 1, 1,
0.6334204, -0.3780487, 1.700263, 0.3843137, 0, 1, 1,
0.6425452, 1.054407, 0.5003486, 0.3921569, 0, 1, 1,
0.6435878, 0.8992705, 0.5414139, 0.3960784, 0, 1, 1,
0.6460263, -0.8198548, 2.22983, 0.4039216, 0, 1, 1,
0.6467954, 1.470098, -0.7843499, 0.4117647, 0, 1, 1,
0.6487674, 0.6741325, 1.623662, 0.4156863, 0, 1, 1,
0.6561037, 2.236921, -0.1207825, 0.4235294, 0, 1, 1,
0.6622096, -0.5097913, 2.767649, 0.427451, 0, 1, 1,
0.6690767, 0.9417573, 0.8900478, 0.4352941, 0, 1, 1,
0.6771607, -1.871304, 2.273722, 0.4392157, 0, 1, 1,
0.6785821, -0.6071442, 3.046401, 0.4470588, 0, 1, 1,
0.680425, 0.7154041, 0.7060977, 0.4509804, 0, 1, 1,
0.6818366, 0.6376908, -0.08045433, 0.4588235, 0, 1, 1,
0.6821283, 1.508485, 0.06558429, 0.4627451, 0, 1, 1,
0.6821358, 2.368789, -0.702182, 0.4705882, 0, 1, 1,
0.6924495, -0.9096738, 2.232846, 0.4745098, 0, 1, 1,
0.7029087, -1.462302, 2.638351, 0.4823529, 0, 1, 1,
0.7053781, 0.8796861, -0.5760784, 0.4862745, 0, 1, 1,
0.711145, 0.6484194, 0.7951466, 0.4941176, 0, 1, 1,
0.7139017, 1.196401, 0.812502, 0.5019608, 0, 1, 1,
0.7180368, 0.9879351, 0.4910915, 0.5058824, 0, 1, 1,
0.7190503, 0.3173374, 2.141262, 0.5137255, 0, 1, 1,
0.7273071, -2.157161, 1.16479, 0.5176471, 0, 1, 1,
0.7282782, 1.474132, -0.229941, 0.5254902, 0, 1, 1,
0.7333584, 0.6857626, -0.3836704, 0.5294118, 0, 1, 1,
0.7338218, 0.5714448, 0.6446543, 0.5372549, 0, 1, 1,
0.7347612, 0.1106227, 3.567763, 0.5411765, 0, 1, 1,
0.7371323, 1.155133, -1.410637, 0.5490196, 0, 1, 1,
0.757542, 1.02788, 1.369792, 0.5529412, 0, 1, 1,
0.75795, -0.1852251, -0.1124549, 0.5607843, 0, 1, 1,
0.7680271, -0.5290418, 3.969373, 0.5647059, 0, 1, 1,
0.7689643, 1.477968, 0.8850738, 0.572549, 0, 1, 1,
0.7705587, 0.6512973, 1.468586, 0.5764706, 0, 1, 1,
0.777676, 2.196614, 1.265969, 0.5843138, 0, 1, 1,
0.7784048, 1.489533, 0.249473, 0.5882353, 0, 1, 1,
0.7795079, -0.04553261, 3.034618, 0.5960785, 0, 1, 1,
0.787017, 1.687405, -0.1001365, 0.6039216, 0, 1, 1,
0.7894459, -1.28809, 3.878658, 0.6078432, 0, 1, 1,
0.7923841, -0.09164374, 0.87354, 0.6156863, 0, 1, 1,
0.7978674, -0.0591431, 2.703876, 0.6196079, 0, 1, 1,
0.8011557, 0.9848962, 0.1723474, 0.627451, 0, 1, 1,
0.8063132, 0.792663, 0.2332887, 0.6313726, 0, 1, 1,
0.8120948, 0.4081165, 2.390802, 0.6392157, 0, 1, 1,
0.81402, 0.3844618, -0.09744354, 0.6431373, 0, 1, 1,
0.8194979, 0.2472256, 1.255136, 0.6509804, 0, 1, 1,
0.8199736, 0.2309155, 0.09840857, 0.654902, 0, 1, 1,
0.8301664, 0.9536408, 1.052612, 0.6627451, 0, 1, 1,
0.8317998, -1.371459, 1.19925, 0.6666667, 0, 1, 1,
0.8318058, -0.3082114, 3.313326, 0.6745098, 0, 1, 1,
0.8346606, 0.62922, 2.210317, 0.6784314, 0, 1, 1,
0.8364592, -1.353809, 3.167241, 0.6862745, 0, 1, 1,
0.8383958, 1.355038, 0.9671317, 0.6901961, 0, 1, 1,
0.8389415, -0.7265729, 2.587924, 0.6980392, 0, 1, 1,
0.8390464, 0.2115779, 2.368545, 0.7058824, 0, 1, 1,
0.8396928, 0.3475172, 0.2865464, 0.7098039, 0, 1, 1,
0.8407171, -1.399153, 2.038672, 0.7176471, 0, 1, 1,
0.8409779, -0.3908468, 2.824269, 0.7215686, 0, 1, 1,
0.8429738, 1.914634, -0.8919513, 0.7294118, 0, 1, 1,
0.8449317, -0.1094582, -0.06384373, 0.7333333, 0, 1, 1,
0.8508467, 0.3421729, 0.4764984, 0.7411765, 0, 1, 1,
0.8584649, 1.633129, 0.7477998, 0.7450981, 0, 1, 1,
0.8604571, 0.08167268, 1.328582, 0.7529412, 0, 1, 1,
0.8661005, -0.6352625, 1.190703, 0.7568628, 0, 1, 1,
0.8738886, 0.08253849, 0.05894226, 0.7647059, 0, 1, 1,
0.875856, 1.68733, 1.728023, 0.7686275, 0, 1, 1,
0.8821107, -0.7588148, 2.608558, 0.7764706, 0, 1, 1,
0.8852192, 1.618894, 1.91266, 0.7803922, 0, 1, 1,
0.8854455, 0.968751, 0.8818218, 0.7882353, 0, 1, 1,
0.8926132, 0.2455606, 0.4276491, 0.7921569, 0, 1, 1,
0.8937982, 0.17871, 1.602261, 0.8, 0, 1, 1,
0.899693, -0.947404, 2.842083, 0.8078431, 0, 1, 1,
0.9043595, -1.034843, 3.087227, 0.8117647, 0, 1, 1,
0.9074624, -0.5057493, 1.557991, 0.8196079, 0, 1, 1,
0.9074649, -1.281514, 2.366828, 0.8235294, 0, 1, 1,
0.9099262, 1.236777, -0.4855465, 0.8313726, 0, 1, 1,
0.9150456, 1.063136, 0.99754, 0.8352941, 0, 1, 1,
0.9184476, 0.4784462, 1.589005, 0.8431373, 0, 1, 1,
0.9194722, -0.5651855, 3.730721, 0.8470588, 0, 1, 1,
0.9227381, -0.4421473, 0.7849745, 0.854902, 0, 1, 1,
0.9284241, 0.06840172, 3.115635, 0.8588235, 0, 1, 1,
0.931115, 0.5958827, 0.2943835, 0.8666667, 0, 1, 1,
0.9338949, 2.704422, 0.634405, 0.8705882, 0, 1, 1,
0.938765, 0.5557274, 0.658354, 0.8784314, 0, 1, 1,
0.9405854, 0.2855675, 1.611785, 0.8823529, 0, 1, 1,
0.947216, 2.194214, -0.2612281, 0.8901961, 0, 1, 1,
0.9473543, 0.491813, 2.704619, 0.8941177, 0, 1, 1,
0.9524045, 1.019957, -1.787872, 0.9019608, 0, 1, 1,
0.9549056, -0.004985104, 2.12003, 0.9098039, 0, 1, 1,
0.9602869, 1.726445, -0.4021835, 0.9137255, 0, 1, 1,
0.9616826, -1.484895, 2.4313, 0.9215686, 0, 1, 1,
0.9655846, 0.7757827, 1.996454, 0.9254902, 0, 1, 1,
0.9671114, 0.2978495, 1.337007, 0.9333333, 0, 1, 1,
0.97078, 0.3446236, 2.993664, 0.9372549, 0, 1, 1,
0.9749461, 0.6252601, 1.025247, 0.945098, 0, 1, 1,
0.9810655, -2.074422, 2.785501, 0.9490196, 0, 1, 1,
0.9835975, -1.191993, 1.799293, 0.9568627, 0, 1, 1,
0.9876515, 0.3662279, 1.450837, 0.9607843, 0, 1, 1,
0.9905447, 1.262166, 0.7067315, 0.9686275, 0, 1, 1,
1.002242, -1.110159, 2.91663, 0.972549, 0, 1, 1,
1.006366, 0.243747, 1.242586, 0.9803922, 0, 1, 1,
1.007939, 1.248109, -1.321848, 0.9843137, 0, 1, 1,
1.019264, -1.489592, 1.655083, 0.9921569, 0, 1, 1,
1.020773, 1.883055, -1.480088, 0.9960784, 0, 1, 1,
1.023946, -0.03789692, -0.9815035, 1, 0, 0.9960784, 1,
1.037567, 1.387574, -0.4594195, 1, 0, 0.9882353, 1,
1.045265, 0.1838398, 2.45505, 1, 0, 0.9843137, 1,
1.048242, 0.9420109, 1.137783, 1, 0, 0.9764706, 1,
1.05471, 0.864923, 0.9813689, 1, 0, 0.972549, 1,
1.055441, -0.7817411, 0.0214653, 1, 0, 0.9647059, 1,
1.059308, 0.1967161, 0.216463, 1, 0, 0.9607843, 1,
1.059447, -0.7592284, 2.5652, 1, 0, 0.9529412, 1,
1.06426, -1.122059, 0.7063701, 1, 0, 0.9490196, 1,
1.065409, 0.858153, 0.6866518, 1, 0, 0.9411765, 1,
1.066529, 0.8345338, 1.251772, 1, 0, 0.9372549, 1,
1.067504, 0.140135, 0.263816, 1, 0, 0.9294118, 1,
1.070886, -0.3901318, 1.467073, 1, 0, 0.9254902, 1,
1.070975, 0.7334474, 1.007275, 1, 0, 0.9176471, 1,
1.072103, -0.8532284, 2.36364, 1, 0, 0.9137255, 1,
1.074911, 0.1217195, 0.8605557, 1, 0, 0.9058824, 1,
1.076619, -0.160033, 2.77584, 1, 0, 0.9019608, 1,
1.080378, -2.17413, 3.690037, 1, 0, 0.8941177, 1,
1.080993, 0.1188179, 2.257584, 1, 0, 0.8862745, 1,
1.083092, 0.8574499, -0.2789018, 1, 0, 0.8823529, 1,
1.083383, 0.7202744, 0.2218172, 1, 0, 0.8745098, 1,
1.095016, 1.243731, 0.9840612, 1, 0, 0.8705882, 1,
1.105246, -0.5486354, 2.587759, 1, 0, 0.8627451, 1,
1.10931, 0.04913003, 0.7916806, 1, 0, 0.8588235, 1,
1.110964, -0.7670923, 2.26792, 1, 0, 0.8509804, 1,
1.119191, 0.5397987, 3.370835, 1, 0, 0.8470588, 1,
1.119789, 0.7920377, 1.586381, 1, 0, 0.8392157, 1,
1.127075, 0.7720624, 0.2943194, 1, 0, 0.8352941, 1,
1.128353, 0.2307316, 2.148568, 1, 0, 0.827451, 1,
1.129164, -0.5909778, 3.422753, 1, 0, 0.8235294, 1,
1.129536, 0.2200242, 1.589624, 1, 0, 0.8156863, 1,
1.13116, 0.08485517, 2.203276, 1, 0, 0.8117647, 1,
1.138867, 0.9231145, 1.409368, 1, 0, 0.8039216, 1,
1.139864, -0.3162365, 2.620151, 1, 0, 0.7960784, 1,
1.156282, 0.5937552, 1.636717, 1, 0, 0.7921569, 1,
1.158268, 0.6705049, 1.431639, 1, 0, 0.7843137, 1,
1.164879, -0.2364465, 0.03046049, 1, 0, 0.7803922, 1,
1.173925, -0.7736905, 2.538074, 1, 0, 0.772549, 1,
1.174108, -0.5204489, 4.95747, 1, 0, 0.7686275, 1,
1.174922, -0.109284, 1.459111, 1, 0, 0.7607843, 1,
1.182712, -1.817856, 4.019886, 1, 0, 0.7568628, 1,
1.184407, 1.749048, -0.5584986, 1, 0, 0.7490196, 1,
1.185923, 0.7303586, 0.4901308, 1, 0, 0.7450981, 1,
1.187055, 1.647704, 0.6961623, 1, 0, 0.7372549, 1,
1.192492, 0.7285382, -1.005291, 1, 0, 0.7333333, 1,
1.192688, 1.094552, 0.5568266, 1, 0, 0.7254902, 1,
1.193056, -0.383693, 0.9780105, 1, 0, 0.7215686, 1,
1.193389, 0.9851536, 0.3237128, 1, 0, 0.7137255, 1,
1.194651, 0.2879342, 2.923468, 1, 0, 0.7098039, 1,
1.195403, 0.8882086, 2.337541, 1, 0, 0.7019608, 1,
1.196305, 1.746105, 1.08785, 1, 0, 0.6941177, 1,
1.196699, -0.3066087, 1.608801, 1, 0, 0.6901961, 1,
1.20021, 1.900746, 2.090919, 1, 0, 0.682353, 1,
1.205741, -1.195708, 2.249942, 1, 0, 0.6784314, 1,
1.208763, -0.8009205, 0.3441059, 1, 0, 0.6705883, 1,
1.214675, -0.1142322, 1.504555, 1, 0, 0.6666667, 1,
1.21482, 0.5667913, 0.2184124, 1, 0, 0.6588235, 1,
1.215401, -1.359651, 0.9340173, 1, 0, 0.654902, 1,
1.224335, 0.0721467, 2.120245, 1, 0, 0.6470588, 1,
1.240601, -0.07438891, 0.5258498, 1, 0, 0.6431373, 1,
1.243664, 0.1255622, 1.543826, 1, 0, 0.6352941, 1,
1.246436, -1.095505, 0.739646, 1, 0, 0.6313726, 1,
1.248687, -0.8883333, 1.136419, 1, 0, 0.6235294, 1,
1.260807, 0.5155496, 1.997373, 1, 0, 0.6196079, 1,
1.269577, 0.3220639, 0.5830802, 1, 0, 0.6117647, 1,
1.287861, 1.606116, 0.02449964, 1, 0, 0.6078432, 1,
1.293545, -0.6182404, 1.642083, 1, 0, 0.6, 1,
1.299392, -1.925763, 2.583792, 1, 0, 0.5921569, 1,
1.301642, 0.3190301, 0.9716489, 1, 0, 0.5882353, 1,
1.309125, 0.3061246, 0.6572844, 1, 0, 0.5803922, 1,
1.315117, 0.1778531, 2.863105, 1, 0, 0.5764706, 1,
1.331875, -1.130266, 1.320168, 1, 0, 0.5686275, 1,
1.34072, 0.4059337, 1.385432, 1, 0, 0.5647059, 1,
1.343068, -1.257033, 3.52064, 1, 0, 0.5568628, 1,
1.345818, 1.030026, 1.10133, 1, 0, 0.5529412, 1,
1.351073, -0.3562067, 0.9072648, 1, 0, 0.5450981, 1,
1.364091, -0.8831711, 2.716363, 1, 0, 0.5411765, 1,
1.365154, -2.932267, 1.777159, 1, 0, 0.5333334, 1,
1.375059, -0.6551214, 2.865616, 1, 0, 0.5294118, 1,
1.376067, 1.201619, 2.423847, 1, 0, 0.5215687, 1,
1.377101, 1.640589, 0.1865004, 1, 0, 0.5176471, 1,
1.379074, -0.1043617, 2.575979, 1, 0, 0.509804, 1,
1.396094, -0.5005892, 0.6752049, 1, 0, 0.5058824, 1,
1.403388, -1.441064, 1.025591, 1, 0, 0.4980392, 1,
1.413625, 0.362388, 1.070333, 1, 0, 0.4901961, 1,
1.415418, -0.772554, 0.8131844, 1, 0, 0.4862745, 1,
1.432725, -0.2176023, 2.253884, 1, 0, 0.4784314, 1,
1.442935, -1.060933, 1.734554, 1, 0, 0.4745098, 1,
1.454142, 0.4798423, 1.270714, 1, 0, 0.4666667, 1,
1.456944, 0.7959208, 0.7134635, 1, 0, 0.4627451, 1,
1.474144, -0.1243351, 2.014041, 1, 0, 0.454902, 1,
1.484021, -1.696306, 1.96149, 1, 0, 0.4509804, 1,
1.49008, 0.5910794, 0.08729056, 1, 0, 0.4431373, 1,
1.492695, 1.488711, 1.298629, 1, 0, 0.4392157, 1,
1.504211, -0.6289176, 1.744481, 1, 0, 0.4313726, 1,
1.504913, -0.7709062, 2.650577, 1, 0, 0.427451, 1,
1.537541, 1.473044, 2.116385, 1, 0, 0.4196078, 1,
1.539878, 1.723787, -0.2735825, 1, 0, 0.4156863, 1,
1.549736, -0.02133646, 2.876367, 1, 0, 0.4078431, 1,
1.590475, 1.316002, 2.421205, 1, 0, 0.4039216, 1,
1.606252, 0.2412442, 2.255474, 1, 0, 0.3960784, 1,
1.614199, -2.134901, 1.326754, 1, 0, 0.3882353, 1,
1.619501, -1.664388, 3.079887, 1, 0, 0.3843137, 1,
1.629838, 0.7975269, -0.01970673, 1, 0, 0.3764706, 1,
1.632066, -1.325879, 2.613841, 1, 0, 0.372549, 1,
1.642919, -1.824279, 2.982348, 1, 0, 0.3647059, 1,
1.65043, 1.12355, -0.2497113, 1, 0, 0.3607843, 1,
1.675016, -0.4703038, 1.204484, 1, 0, 0.3529412, 1,
1.684594, -0.4105714, 1.875778, 1, 0, 0.3490196, 1,
1.68507, 0.1465093, 1.944491, 1, 0, 0.3411765, 1,
1.713803, 0.9547644, -0.405541, 1, 0, 0.3372549, 1,
1.71484, -0.1338102, 2.423279, 1, 0, 0.3294118, 1,
1.715418, 1.309654, 1.046598, 1, 0, 0.3254902, 1,
1.716475, 0.6665999, 0.1242805, 1, 0, 0.3176471, 1,
1.723207, -0.07453413, 2.942806, 1, 0, 0.3137255, 1,
1.743625, 0.07035922, 0.3589896, 1, 0, 0.3058824, 1,
1.747661, -1.832809, 3.451609, 1, 0, 0.2980392, 1,
1.748627, -0.9138178, 3.835909, 1, 0, 0.2941177, 1,
1.767304, 0.1397688, 0.1551671, 1, 0, 0.2862745, 1,
1.777135, -0.09987859, 1.028986, 1, 0, 0.282353, 1,
1.782786, 1.293952, 1.75308, 1, 0, 0.2745098, 1,
1.797414, -0.0829498, 0.5980955, 1, 0, 0.2705882, 1,
1.810606, -0.1478009, 2.369224, 1, 0, 0.2627451, 1,
1.818126, 0.7304839, 1.186542, 1, 0, 0.2588235, 1,
1.821401, -0.1839132, 0.7449767, 1, 0, 0.2509804, 1,
1.823323, -1.593738, 1.665786, 1, 0, 0.2470588, 1,
1.829233, 0.941691, 2.85476, 1, 0, 0.2392157, 1,
1.83013, 0.8785438, -0.1214209, 1, 0, 0.2352941, 1,
1.835154, -0.5457847, 1.763122, 1, 0, 0.227451, 1,
1.843539, 0.4152574, 2.404086, 1, 0, 0.2235294, 1,
1.851261, 0.8458768, 0.3027481, 1, 0, 0.2156863, 1,
1.854648, -0.5982063, 3.030029, 1, 0, 0.2117647, 1,
1.857821, -1.368747, 3.138787, 1, 0, 0.2039216, 1,
1.904926, -1.687131, 3.287325, 1, 0, 0.1960784, 1,
1.946892, -0.1521093, 0.5708607, 1, 0, 0.1921569, 1,
1.972459, 0.9870394, 1.239895, 1, 0, 0.1843137, 1,
1.976313, 0.6109649, 0.5657165, 1, 0, 0.1803922, 1,
1.978373, 0.2526138, 2.922599, 1, 0, 0.172549, 1,
1.979498, -0.1600607, 0.249711, 1, 0, 0.1686275, 1,
1.985993, -0.9427686, 3.784196, 1, 0, 0.1607843, 1,
1.986421, 0.2229812, -0.5553297, 1, 0, 0.1568628, 1,
2.001989, -0.8951181, 3.297449, 1, 0, 0.1490196, 1,
2.011923, 0.391804, 3.213169, 1, 0, 0.145098, 1,
2.032886, 0.6849, 1.356117, 1, 0, 0.1372549, 1,
2.038263, 1.865998, 0.6736174, 1, 0, 0.1333333, 1,
2.039841, -0.3420202, 0.5709328, 1, 0, 0.1254902, 1,
2.054929, -0.1350397, 3.392576, 1, 0, 0.1215686, 1,
2.091466, 0.3719013, 2.20084, 1, 0, 0.1137255, 1,
2.093348, -0.3407901, 1.589092, 1, 0, 0.1098039, 1,
2.131019, -0.7930757, 0.8599824, 1, 0, 0.1019608, 1,
2.1329, 0.1433264, 2.516965, 1, 0, 0.09411765, 1,
2.159203, 1.232981, 0.4915644, 1, 0, 0.09019608, 1,
2.191819, -0.03108964, 1.425543, 1, 0, 0.08235294, 1,
2.192907, 1.308178, 0.9057023, 1, 0, 0.07843138, 1,
2.22269, 1.962152, 3.151898, 1, 0, 0.07058824, 1,
2.438507, -0.1090848, 3.572839, 1, 0, 0.06666667, 1,
2.454609, 1.751681, 1.126482, 1, 0, 0.05882353, 1,
2.487634, 0.3955534, 2.315549, 1, 0, 0.05490196, 1,
2.516653, -0.1178024, -0.3607891, 1, 0, 0.04705882, 1,
2.518084, 0.1551602, 0.5877327, 1, 0, 0.04313726, 1,
2.765699, -1.62627, 1.955725, 1, 0, 0.03529412, 1,
2.862309, -0.3277297, 1.484539, 1, 0, 0.03137255, 1,
3.01024, 1.978312, 0.8384371, 1, 0, 0.02352941, 1,
3.013622, -0.6396042, 2.475335, 1, 0, 0.01960784, 1,
3.083521, 0.2276071, -0.798377, 1, 0, 0.01176471, 1,
3.273079, -0.002894576, 3.0467, 1, 0, 0.007843138, 1
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
-0.1741781, -4.022117, -6.835385, 0, -0.5, 0.5, 0.5,
-0.1741781, -4.022117, -6.835385, 1, -0.5, 0.5, 0.5,
-0.1741781, -4.022117, -6.835385, 1, 1.5, 0.5, 0.5,
-0.1741781, -4.022117, -6.835385, 0, 1.5, 0.5, 0.5
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
-4.790056, 0.2826295, -6.835385, 0, -0.5, 0.5, 0.5,
-4.790056, 0.2826295, -6.835385, 1, -0.5, 0.5, 0.5,
-4.790056, 0.2826295, -6.835385, 1, 1.5, 0.5, 0.5,
-4.790056, 0.2826295, -6.835385, 0, 1.5, 0.5, 0.5
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
-4.790056, -4.022117, 0.06278205, 0, -0.5, 0.5, 0.5,
-4.790056, -4.022117, 0.06278205, 1, -0.5, 0.5, 0.5,
-4.790056, -4.022117, 0.06278205, 1, 1.5, 0.5, 0.5,
-4.790056, -4.022117, 0.06278205, 0, 1.5, 0.5, 0.5
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
-3, -3.028714, -5.243501,
3, -3.028714, -5.243501,
-3, -3.028714, -5.243501,
-3, -3.194281, -5.508815,
-2, -3.028714, -5.243501,
-2, -3.194281, -5.508815,
-1, -3.028714, -5.243501,
-1, -3.194281, -5.508815,
0, -3.028714, -5.243501,
0, -3.194281, -5.508815,
1, -3.028714, -5.243501,
1, -3.194281, -5.508815,
2, -3.028714, -5.243501,
2, -3.194281, -5.508815,
3, -3.028714, -5.243501,
3, -3.194281, -5.508815
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
-3, -3.525415, -6.039443, 0, -0.5, 0.5, 0.5,
-3, -3.525415, -6.039443, 1, -0.5, 0.5, 0.5,
-3, -3.525415, -6.039443, 1, 1.5, 0.5, 0.5,
-3, -3.525415, -6.039443, 0, 1.5, 0.5, 0.5,
-2, -3.525415, -6.039443, 0, -0.5, 0.5, 0.5,
-2, -3.525415, -6.039443, 1, -0.5, 0.5, 0.5,
-2, -3.525415, -6.039443, 1, 1.5, 0.5, 0.5,
-2, -3.525415, -6.039443, 0, 1.5, 0.5, 0.5,
-1, -3.525415, -6.039443, 0, -0.5, 0.5, 0.5,
-1, -3.525415, -6.039443, 1, -0.5, 0.5, 0.5,
-1, -3.525415, -6.039443, 1, 1.5, 0.5, 0.5,
-1, -3.525415, -6.039443, 0, 1.5, 0.5, 0.5,
0, -3.525415, -6.039443, 0, -0.5, 0.5, 0.5,
0, -3.525415, -6.039443, 1, -0.5, 0.5, 0.5,
0, -3.525415, -6.039443, 1, 1.5, 0.5, 0.5,
0, -3.525415, -6.039443, 0, 1.5, 0.5, 0.5,
1, -3.525415, -6.039443, 0, -0.5, 0.5, 0.5,
1, -3.525415, -6.039443, 1, -0.5, 0.5, 0.5,
1, -3.525415, -6.039443, 1, 1.5, 0.5, 0.5,
1, -3.525415, -6.039443, 0, 1.5, 0.5, 0.5,
2, -3.525415, -6.039443, 0, -0.5, 0.5, 0.5,
2, -3.525415, -6.039443, 1, -0.5, 0.5, 0.5,
2, -3.525415, -6.039443, 1, 1.5, 0.5, 0.5,
2, -3.525415, -6.039443, 0, 1.5, 0.5, 0.5,
3, -3.525415, -6.039443, 0, -0.5, 0.5, 0.5,
3, -3.525415, -6.039443, 1, -0.5, 0.5, 0.5,
3, -3.525415, -6.039443, 1, 1.5, 0.5, 0.5,
3, -3.525415, -6.039443, 0, 1.5, 0.5, 0.5
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
-3.724853, -2, -5.243501,
-3.724853, 3, -5.243501,
-3.724853, -2, -5.243501,
-3.902387, -2, -5.508815,
-3.724853, -1, -5.243501,
-3.902387, -1, -5.508815,
-3.724853, 0, -5.243501,
-3.902387, 0, -5.508815,
-3.724853, 1, -5.243501,
-3.902387, 1, -5.508815,
-3.724853, 2, -5.243501,
-3.902387, 2, -5.508815,
-3.724853, 3, -5.243501,
-3.902387, 3, -5.508815
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
-4.257454, -2, -6.039443, 0, -0.5, 0.5, 0.5,
-4.257454, -2, -6.039443, 1, -0.5, 0.5, 0.5,
-4.257454, -2, -6.039443, 1, 1.5, 0.5, 0.5,
-4.257454, -2, -6.039443, 0, 1.5, 0.5, 0.5,
-4.257454, -1, -6.039443, 0, -0.5, 0.5, 0.5,
-4.257454, -1, -6.039443, 1, -0.5, 0.5, 0.5,
-4.257454, -1, -6.039443, 1, 1.5, 0.5, 0.5,
-4.257454, -1, -6.039443, 0, 1.5, 0.5, 0.5,
-4.257454, 0, -6.039443, 0, -0.5, 0.5, 0.5,
-4.257454, 0, -6.039443, 1, -0.5, 0.5, 0.5,
-4.257454, 0, -6.039443, 1, 1.5, 0.5, 0.5,
-4.257454, 0, -6.039443, 0, 1.5, 0.5, 0.5,
-4.257454, 1, -6.039443, 0, -0.5, 0.5, 0.5,
-4.257454, 1, -6.039443, 1, -0.5, 0.5, 0.5,
-4.257454, 1, -6.039443, 1, 1.5, 0.5, 0.5,
-4.257454, 1, -6.039443, 0, 1.5, 0.5, 0.5,
-4.257454, 2, -6.039443, 0, -0.5, 0.5, 0.5,
-4.257454, 2, -6.039443, 1, -0.5, 0.5, 0.5,
-4.257454, 2, -6.039443, 1, 1.5, 0.5, 0.5,
-4.257454, 2, -6.039443, 0, 1.5, 0.5, 0.5,
-4.257454, 3, -6.039443, 0, -0.5, 0.5, 0.5,
-4.257454, 3, -6.039443, 1, -0.5, 0.5, 0.5,
-4.257454, 3, -6.039443, 1, 1.5, 0.5, 0.5,
-4.257454, 3, -6.039443, 0, 1.5, 0.5, 0.5
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
-3.724853, -3.028714, -4,
-3.724853, -3.028714, 4,
-3.724853, -3.028714, -4,
-3.902387, -3.194281, -4,
-3.724853, -3.028714, -2,
-3.902387, -3.194281, -2,
-3.724853, -3.028714, 0,
-3.902387, -3.194281, 0,
-3.724853, -3.028714, 2,
-3.902387, -3.194281, 2,
-3.724853, -3.028714, 4,
-3.902387, -3.194281, 4
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
-4.257454, -3.525415, -4, 0, -0.5, 0.5, 0.5,
-4.257454, -3.525415, -4, 1, -0.5, 0.5, 0.5,
-4.257454, -3.525415, -4, 1, 1.5, 0.5, 0.5,
-4.257454, -3.525415, -4, 0, 1.5, 0.5, 0.5,
-4.257454, -3.525415, -2, 0, -0.5, 0.5, 0.5,
-4.257454, -3.525415, -2, 1, -0.5, 0.5, 0.5,
-4.257454, -3.525415, -2, 1, 1.5, 0.5, 0.5,
-4.257454, -3.525415, -2, 0, 1.5, 0.5, 0.5,
-4.257454, -3.525415, 0, 0, -0.5, 0.5, 0.5,
-4.257454, -3.525415, 0, 1, -0.5, 0.5, 0.5,
-4.257454, -3.525415, 0, 1, 1.5, 0.5, 0.5,
-4.257454, -3.525415, 0, 0, 1.5, 0.5, 0.5,
-4.257454, -3.525415, 2, 0, -0.5, 0.5, 0.5,
-4.257454, -3.525415, 2, 1, -0.5, 0.5, 0.5,
-4.257454, -3.525415, 2, 1, 1.5, 0.5, 0.5,
-4.257454, -3.525415, 2, 0, 1.5, 0.5, 0.5,
-4.257454, -3.525415, 4, 0, -0.5, 0.5, 0.5,
-4.257454, -3.525415, 4, 1, -0.5, 0.5, 0.5,
-4.257454, -3.525415, 4, 1, 1.5, 0.5, 0.5,
-4.257454, -3.525415, 4, 0, 1.5, 0.5, 0.5
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
-3.724853, -3.028714, -5.243501,
-3.724853, 3.593973, -5.243501,
-3.724853, -3.028714, 5.369065,
-3.724853, 3.593973, 5.369065,
-3.724853, -3.028714, -5.243501,
-3.724853, -3.028714, 5.369065,
-3.724853, 3.593973, -5.243501,
-3.724853, 3.593973, 5.369065,
-3.724853, -3.028714, -5.243501,
3.376497, -3.028714, -5.243501,
-3.724853, -3.028714, 5.369065,
3.376497, -3.028714, 5.369065,
-3.724853, 3.593973, -5.243501,
3.376497, 3.593973, -5.243501,
-3.724853, 3.593973, 5.369065,
3.376497, 3.593973, 5.369065,
3.376497, -3.028714, -5.243501,
3.376497, 3.593973, -5.243501,
3.376497, -3.028714, 5.369065,
3.376497, 3.593973, 5.369065,
3.376497, -3.028714, -5.243501,
3.376497, -3.028714, 5.369065,
3.376497, 3.593973, -5.243501,
3.376497, 3.593973, 5.369065
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
var radius = 7.681078;
var distance = 34.17398;
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
mvMatrix.translate( 0.1741781, -0.2826295, -0.06278205 );
mvMatrix.scale( 1.169486, 1.254013, 0.7825565 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.17398);
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
indanofan<-read.table("indanofan.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-indanofan$V2
```

```
## Error in eval(expr, envir, enclos): object 'indanofan' not found
```

```r
y<-indanofan$V3
```

```
## Error in eval(expr, envir, enclos): object 'indanofan' not found
```

```r
z<-indanofan$V4
```

```
## Error in eval(expr, envir, enclos): object 'indanofan' not found
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
-3.621435, -0.985733, -2.952361, 0, 0, 1, 1, 1,
-3.039097, 0.2705239, -1.428086, 1, 0, 0, 1, 1,
-2.949695, -1.193864, -4.669153, 1, 0, 0, 1, 1,
-2.837854, 0.8578408, -1.139412, 1, 0, 0, 1, 1,
-2.801888, 1.531568, -1.394737, 1, 0, 0, 1, 1,
-2.752073, 1.676653, -0.9564427, 1, 0, 0, 1, 1,
-2.668958, 0.2478671, -1.722871, 0, 0, 0, 1, 1,
-2.668212, -0.811029, -2.125447, 0, 0, 0, 1, 1,
-2.443279, 0.4010685, -1.599226, 0, 0, 0, 1, 1,
-2.414983, 0.871648, -1.40027, 0, 0, 0, 1, 1,
-2.368801, 0.05548498, -1.540951, 0, 0, 0, 1, 1,
-2.318061, 1.164351, -1.625723, 0, 0, 0, 1, 1,
-2.307466, -0.6844184, -0.4449314, 0, 0, 0, 1, 1,
-2.289895, -1.427261, -3.874159, 1, 1, 1, 1, 1,
-2.282155, -0.06158498, -2.172168, 1, 1, 1, 1, 1,
-2.273421, 2.285423, -0.3597179, 1, 1, 1, 1, 1,
-2.271891, 1.086391, -1.917348, 1, 1, 1, 1, 1,
-2.269309, -1.377861, -2.06608, 1, 1, 1, 1, 1,
-2.246336, -0.9766656, -2.966786, 1, 1, 1, 1, 1,
-2.224953, 0.7300424, -2.020987, 1, 1, 1, 1, 1,
-2.193182, -0.6016062, -0.3099031, 1, 1, 1, 1, 1,
-2.149504, -0.5463509, -1.387448, 1, 1, 1, 1, 1,
-2.083702, -0.6911222, -2.650084, 1, 1, 1, 1, 1,
-2.075845, -1.588912, -3.083452, 1, 1, 1, 1, 1,
-2.069092, -0.5256631, -1.613961, 1, 1, 1, 1, 1,
-2.049799, 0.1548048, -0.6971644, 1, 1, 1, 1, 1,
-2.036021, 1.062453, -1.568673, 1, 1, 1, 1, 1,
-2.033097, -0.5195421, -1.252709, 1, 1, 1, 1, 1,
-1.994122, 1.528182, -0.4803901, 0, 0, 1, 1, 1,
-1.98333, -0.5754884, -2.288872, 1, 0, 0, 1, 1,
-1.972659, 1.40008, -0.3091749, 1, 0, 0, 1, 1,
-1.969, -0.3047897, -2.364095, 1, 0, 0, 1, 1,
-1.953229, -0.1148483, -1.285692, 1, 0, 0, 1, 1,
-1.932069, 1.110541, -1.789754, 1, 0, 0, 1, 1,
-1.894466, -0.9215744, -2.399588, 0, 0, 0, 1, 1,
-1.863869, -1.082435, -1.274214, 0, 0, 0, 1, 1,
-1.809887, 0.7334339, -2.07413, 0, 0, 0, 1, 1,
-1.802147, -2.176506, -0.7051131, 0, 0, 0, 1, 1,
-1.797737, 1.023444, -1.487807, 0, 0, 0, 1, 1,
-1.787694, 0.853317, -1.257731, 0, 0, 0, 1, 1,
-1.778661, -1.230277, -3.811687, 0, 0, 0, 1, 1,
-1.764921, -1.793111, -2.71351, 1, 1, 1, 1, 1,
-1.764102, 0.1925159, -1.238842, 1, 1, 1, 1, 1,
-1.763175, 0.09986555, -1.718173, 1, 1, 1, 1, 1,
-1.722621, 1.706977, 0.4691547, 1, 1, 1, 1, 1,
-1.71616, 2.224388, -1.354027, 1, 1, 1, 1, 1,
-1.709772, 0.7777894, -0.9866384, 1, 1, 1, 1, 1,
-1.698752, -0.03916145, -0.1282985, 1, 1, 1, 1, 1,
-1.691695, -0.7309311, -4.372524, 1, 1, 1, 1, 1,
-1.691527, -0.0843079, -1.197789, 1, 1, 1, 1, 1,
-1.655895, 1.395881, -0.02992537, 1, 1, 1, 1, 1,
-1.643691, -1.262596, -0.3587206, 1, 1, 1, 1, 1,
-1.640687, 0.2010572, -2.479149, 1, 1, 1, 1, 1,
-1.610474, -2.614683, -3.329412, 1, 1, 1, 1, 1,
-1.602501, -0.5340326, -2.707115, 1, 1, 1, 1, 1,
-1.60067, 1.380923, -0.3828725, 1, 1, 1, 1, 1,
-1.595789, 0.3263538, -1.493913, 0, 0, 1, 1, 1,
-1.569442, 1.644051, -1.943185, 1, 0, 0, 1, 1,
-1.567569, -0.4149103, -2.982151, 1, 0, 0, 1, 1,
-1.566211, -1.687047, -0.4868377, 1, 0, 0, 1, 1,
-1.565874, 0.04063367, -0.8104346, 1, 0, 0, 1, 1,
-1.561665, -1.470996, -2.583385, 1, 0, 0, 1, 1,
-1.559114, -0.3918484, -1.857707, 0, 0, 0, 1, 1,
-1.549984, 0.01112703, -4.070706, 0, 0, 0, 1, 1,
-1.548121, -0.9623965, -2.621319, 0, 0, 0, 1, 1,
-1.545347, -0.8091398, -1.729215, 0, 0, 0, 1, 1,
-1.53879, 0.5142321, -1.117428, 0, 0, 0, 1, 1,
-1.521519, -0.375026, -1.06569, 0, 0, 0, 1, 1,
-1.519861, -0.07354946, -2.286561, 0, 0, 0, 1, 1,
-1.516238, 1.167153, -0.3640403, 1, 1, 1, 1, 1,
-1.515686, 1.500197, -0.2737126, 1, 1, 1, 1, 1,
-1.511877, -0.2297716, -1.73488, 1, 1, 1, 1, 1,
-1.502069, -0.6800289, -0.7849669, 1, 1, 1, 1, 1,
-1.501382, -0.1813087, -2.459948, 1, 1, 1, 1, 1,
-1.485632, -2.029002, -1.975343, 1, 1, 1, 1, 1,
-1.483533, -0.1598956, -1.830503, 1, 1, 1, 1, 1,
-1.479223, -1.362285, -1.712826, 1, 1, 1, 1, 1,
-1.478271, -2.365143, -3.114776, 1, 1, 1, 1, 1,
-1.468206, 0.5424012, -0.361705, 1, 1, 1, 1, 1,
-1.461937, 0.5829602, -3.259835, 1, 1, 1, 1, 1,
-1.446186, 0.1483779, -0.8178226, 1, 1, 1, 1, 1,
-1.441626, -0.217205, -1.186671, 1, 1, 1, 1, 1,
-1.436979, -0.5558612, -2.922237, 1, 1, 1, 1, 1,
-1.436809, 1.528274, -1.361753, 1, 1, 1, 1, 1,
-1.434972, 1.553617, -0.2239398, 0, 0, 1, 1, 1,
-1.429177, 0.5716887, -0.2645503, 1, 0, 0, 1, 1,
-1.4282, 0.8253394, -1.172923, 1, 0, 0, 1, 1,
-1.418307, -0.5972058, -3.031955, 1, 0, 0, 1, 1,
-1.396125, 0.4784715, -0.2723562, 1, 0, 0, 1, 1,
-1.390766, 1.222088, -0.2887122, 1, 0, 0, 1, 1,
-1.387351, 1.311839, 0.5876785, 0, 0, 0, 1, 1,
-1.372615, -1.640038, -4.590705, 0, 0, 0, 1, 1,
-1.367207, -0.4564725, -2.256363, 0, 0, 0, 1, 1,
-1.359515, -0.4865173, -1.998565, 0, 0, 0, 1, 1,
-1.358585, 0.4336064, -0.7370587, 0, 0, 0, 1, 1,
-1.355844, 0.7200261, -1.674103, 0, 0, 0, 1, 1,
-1.354838, -0.9374337, -2.825704, 0, 0, 0, 1, 1,
-1.328518, -0.742008, -2.933194, 1, 1, 1, 1, 1,
-1.3252, -0.3455985, -2.864618, 1, 1, 1, 1, 1,
-1.318777, 0.1609395, -2.568569, 1, 1, 1, 1, 1,
-1.313815, 0.2735274, -4.345707, 1, 1, 1, 1, 1,
-1.313271, 1.617396, -2.644552, 1, 1, 1, 1, 1,
-1.31281, 0.9753132, -2.522614, 1, 1, 1, 1, 1,
-1.307538, -1.102647, -3.282685, 1, 1, 1, 1, 1,
-1.302901, 0.1746423, -0.3323933, 1, 1, 1, 1, 1,
-1.293831, 0.5300705, -1.074283, 1, 1, 1, 1, 1,
-1.288926, -0.1758178, -1.892222, 1, 1, 1, 1, 1,
-1.274945, 1.184083, -1.055574, 1, 1, 1, 1, 1,
-1.263841, 2.653119, 1.647892, 1, 1, 1, 1, 1,
-1.259937, -0.1144075, -4.017746, 1, 1, 1, 1, 1,
-1.251832, -0.4240887, 1.008697, 1, 1, 1, 1, 1,
-1.232403, -2.106715, -3.979441, 1, 1, 1, 1, 1,
-1.23166, -0.8364291, -1.141481, 0, 0, 1, 1, 1,
-1.22604, -1.940603, -2.888553, 1, 0, 0, 1, 1,
-1.218065, 0.9636999, -0.2767249, 1, 0, 0, 1, 1,
-1.213383, -0.6969841, -2.126613, 1, 0, 0, 1, 1,
-1.211383, 0.6836585, -0.3241912, 1, 0, 0, 1, 1,
-1.206881, 0.5290481, -0.1720383, 1, 0, 0, 1, 1,
-1.192799, -0.5178832, -1.686361, 0, 0, 0, 1, 1,
-1.17833, 1.923415, -1.333868, 0, 0, 0, 1, 1,
-1.174134, -1.38157, -2.973272, 0, 0, 0, 1, 1,
-1.167256, 0.2876562, -1.564078, 0, 0, 0, 1, 1,
-1.155909, 1.773809, -2.765738, 0, 0, 0, 1, 1,
-1.152903, 0.6069636, -1.425875, 0, 0, 0, 1, 1,
-1.151123, 0.8971775, -2.191064, 0, 0, 0, 1, 1,
-1.142207, -0.5673748, -2.642231, 1, 1, 1, 1, 1,
-1.13434, -0.1325799, -1.560658, 1, 1, 1, 1, 1,
-1.134101, 0.2319012, -3.518619, 1, 1, 1, 1, 1,
-1.131054, 0.811685, -0.7712614, 1, 1, 1, 1, 1,
-1.127278, 0.2875785, -2.480232, 1, 1, 1, 1, 1,
-1.119612, 0.975442, 0.1941784, 1, 1, 1, 1, 1,
-1.11523, 0.8576002, -0.1503811, 1, 1, 1, 1, 1,
-1.113944, 0.3713793, -2.00393, 1, 1, 1, 1, 1,
-1.108996, 1.205636, 1.384405, 1, 1, 1, 1, 1,
-1.108667, 0.5545486, -2.22211, 1, 1, 1, 1, 1,
-1.106018, -1.370777, -1.553431, 1, 1, 1, 1, 1,
-1.105908, 0.9176955, -2.333581, 1, 1, 1, 1, 1,
-1.105825, -0.05889361, -3.057001, 1, 1, 1, 1, 1,
-1.103508, -0.06765246, -1.069628, 1, 1, 1, 1, 1,
-1.101109, -0.6201035, -0.7994512, 1, 1, 1, 1, 1,
-1.091767, -0.9622278, -2.909427, 0, 0, 1, 1, 1,
-1.090945, -0.09597429, -0.8275909, 1, 0, 0, 1, 1,
-1.089324, 0.1297133, -0.9792266, 1, 0, 0, 1, 1,
-1.08879, -0.2934669, -2.328282, 1, 0, 0, 1, 1,
-1.086653, -1.288068, -3.426982, 1, 0, 0, 1, 1,
-1.084664, 0.3553127, -2.132315, 1, 0, 0, 1, 1,
-1.074626, -2.147087, -3.698032, 0, 0, 0, 1, 1,
-1.073277, -1.199062, -3.382702, 0, 0, 0, 1, 1,
-1.067429, -0.3574951, -2.712327, 0, 0, 0, 1, 1,
-1.065885, -0.6023068, -0.9239396, 0, 0, 0, 1, 1,
-1.064253, -0.508439, -0.7682492, 0, 0, 0, 1, 1,
-1.062557, 0.07780685, -0.7705615, 0, 0, 0, 1, 1,
-1.05895, -0.2279273, -1.769266, 0, 0, 0, 1, 1,
-1.054332, 0.1767079, -2.234523, 1, 1, 1, 1, 1,
-1.044959, -0.3363627, -1.221701, 1, 1, 1, 1, 1,
-1.044909, -0.1217104, -0.9602149, 1, 1, 1, 1, 1,
-1.043206, -0.6330453, -3.331058, 1, 1, 1, 1, 1,
-1.038127, -0.05664014, -1.803058, 1, 1, 1, 1, 1,
-1.029979, 0.3101055, 1.621144, 1, 1, 1, 1, 1,
-1.017462, 0.2226816, -2.612051, 1, 1, 1, 1, 1,
-1.014536, 0.3406628, -1.569552, 1, 1, 1, 1, 1,
-1.012207, 1.027887, -1.762794, 1, 1, 1, 1, 1,
-0.9996657, 1.252342, -0.4148009, 1, 1, 1, 1, 1,
-0.9953046, -0.2721368, -1.55628, 1, 1, 1, 1, 1,
-0.98641, 0.384644, -2.30299, 1, 1, 1, 1, 1,
-0.985852, -0.03350009, -2.416761, 1, 1, 1, 1, 1,
-0.9854897, -1.024258, -0.3091057, 1, 1, 1, 1, 1,
-0.9796586, -0.9197441, -2.593176, 1, 1, 1, 1, 1,
-0.9725153, -0.3524315, -2.71096, 0, 0, 1, 1, 1,
-0.9689876, 0.3598454, 0.1378505, 1, 0, 0, 1, 1,
-0.9659866, -0.04097014, -0.6785454, 1, 0, 0, 1, 1,
-0.9645337, -1.334478, -2.371221, 1, 0, 0, 1, 1,
-0.9588095, 1.329469, -0.6540407, 1, 0, 0, 1, 1,
-0.9572731, -0.2502043, -1.14309, 1, 0, 0, 1, 1,
-0.955142, -0.2231638, -1.826008, 0, 0, 0, 1, 1,
-0.9549086, 0.2482602, 0.3012885, 0, 0, 0, 1, 1,
-0.9538513, 1.104999, -0.9341397, 0, 0, 0, 1, 1,
-0.9533496, -1.246891, -2.844197, 0, 0, 0, 1, 1,
-0.9453635, 0.4846102, -0.2267262, 0, 0, 0, 1, 1,
-0.9378119, 1.070957, -1.233212, 0, 0, 0, 1, 1,
-0.9209192, 0.9508617, -0.6511339, 0, 0, 0, 1, 1,
-0.9182523, 0.4196919, -2.725869, 1, 1, 1, 1, 1,
-0.9140421, 0.3002702, 0.7430353, 1, 1, 1, 1, 1,
-0.9120008, -0.6883878, -3.65986, 1, 1, 1, 1, 1,
-0.9092575, 0.231795, -0.1898975, 1, 1, 1, 1, 1,
-0.9029907, 0.9468347, -1.358297, 1, 1, 1, 1, 1,
-0.88789, 1.81973, -0.05533835, 1, 1, 1, 1, 1,
-0.8828716, -0.7514221, -1.432214, 1, 1, 1, 1, 1,
-0.8809388, 1.866717, -2.517838, 1, 1, 1, 1, 1,
-0.8730032, -1.279448, -2.537085, 1, 1, 1, 1, 1,
-0.8695861, -0.4458577, -0.9766704, 1, 1, 1, 1, 1,
-0.8608158, 1.854064, -0.5786383, 1, 1, 1, 1, 1,
-0.8466715, -0.4599318, -2.91997, 1, 1, 1, 1, 1,
-0.8466272, -0.2947589, -0.3483893, 1, 1, 1, 1, 1,
-0.8455418, -0.6472144, -2.625835, 1, 1, 1, 1, 1,
-0.8415251, 2.732391, -1.669338, 1, 1, 1, 1, 1,
-0.8407879, -0.4026904, -1.272412, 0, 0, 1, 1, 1,
-0.8371315, -1.442291, -3.719512, 1, 0, 0, 1, 1,
-0.8354503, -1.528598, -1.106024, 1, 0, 0, 1, 1,
-0.8303627, 0.09231722, -1.483817, 1, 0, 0, 1, 1,
-0.8294044, -0.5315424, -3.367358, 1, 0, 0, 1, 1,
-0.823599, -0.3438843, -2.136598, 1, 0, 0, 1, 1,
-0.8134474, 1.212454, -0.850765, 0, 0, 0, 1, 1,
-0.8104395, 1.160253, -0.3328615, 0, 0, 0, 1, 1,
-0.8068028, 1.364991, -1.03306, 0, 0, 0, 1, 1,
-0.7995488, -0.3481277, -0.5058177, 0, 0, 0, 1, 1,
-0.79909, -0.2825072, -2.078547, 0, 0, 0, 1, 1,
-0.7990136, 1.159785, -1.002723, 0, 0, 0, 1, 1,
-0.7917238, -0.4026492, -2.914233, 0, 0, 0, 1, 1,
-0.7860786, -0.09306356, -1.124337, 1, 1, 1, 1, 1,
-0.7805938, -0.5510191, -4.315797, 1, 1, 1, 1, 1,
-0.7778742, 1.022496, -0.8295673, 1, 1, 1, 1, 1,
-0.7721142, 0.2529494, -1.750507, 1, 1, 1, 1, 1,
-0.7718374, 1.554546, -0.3194267, 1, 1, 1, 1, 1,
-0.7631796, -0.9030079, -2.395998, 1, 1, 1, 1, 1,
-0.7612194, 0.03505204, -3.252935, 1, 1, 1, 1, 1,
-0.7604311, -0.9244913, -0.532319, 1, 1, 1, 1, 1,
-0.758912, 0.4469825, -0.192608, 1, 1, 1, 1, 1,
-0.7573952, 0.02842441, -2.362234, 1, 1, 1, 1, 1,
-0.7545035, -0.8254367, -2.059744, 1, 1, 1, 1, 1,
-0.7535696, -0.3613512, -1.198786, 1, 1, 1, 1, 1,
-0.7527716, -1.401015, -0.7523004, 1, 1, 1, 1, 1,
-0.7496622, 1.654466, 1.159058, 1, 1, 1, 1, 1,
-0.7456185, 1.330136, -1.207438, 1, 1, 1, 1, 1,
-0.7414723, -0.688063, -3.678346, 0, 0, 1, 1, 1,
-0.7334245, -1.02342, -3.406017, 1, 0, 0, 1, 1,
-0.7323821, 1.806187, 0.03452925, 1, 0, 0, 1, 1,
-0.7310536, 0.1232363, -0.6910101, 1, 0, 0, 1, 1,
-0.7263902, -0.6803229, -2.358364, 1, 0, 0, 1, 1,
-0.7175156, 2.723923, -2.053159, 1, 0, 0, 1, 1,
-0.6989272, -0.08511584, -2.482193, 0, 0, 0, 1, 1,
-0.6953944, -0.3216404, -1.524028, 0, 0, 0, 1, 1,
-0.6898227, -0.00482594, -1.774485, 0, 0, 0, 1, 1,
-0.6850544, 0.03587209, -1.736112, 0, 0, 0, 1, 1,
-0.6849571, 1.136038, 0.7462986, 0, 0, 0, 1, 1,
-0.684072, 0.5007842, -1.792796, 0, 0, 0, 1, 1,
-0.6807692, -0.4582894, -1.424287, 0, 0, 0, 1, 1,
-0.6793476, 0.8527527, -1.306999, 1, 1, 1, 1, 1,
-0.6792658, 0.911303, -2.758801, 1, 1, 1, 1, 1,
-0.678277, 0.9462131, -1.834501, 1, 1, 1, 1, 1,
-0.6755483, -0.4062135, -2.065381, 1, 1, 1, 1, 1,
-0.6742287, -0.3360921, -2.872032, 1, 1, 1, 1, 1,
-0.6726142, 0.14057, -1.716298, 1, 1, 1, 1, 1,
-0.6716905, -1.156148, -2.902193, 1, 1, 1, 1, 1,
-0.6643468, -0.8988186, -2.348477, 1, 1, 1, 1, 1,
-0.6629463, -1.758373, -1.018757, 1, 1, 1, 1, 1,
-0.661048, -0.2162671, -2.21647, 1, 1, 1, 1, 1,
-0.6568404, -0.8016927, -1.643641, 1, 1, 1, 1, 1,
-0.6539914, 1.66431, -0.2808377, 1, 1, 1, 1, 1,
-0.6493307, -1.956282, -2.484877, 1, 1, 1, 1, 1,
-0.6426226, 0.2273561, -2.925868, 1, 1, 1, 1, 1,
-0.6375713, 1.002739, -0.9695622, 1, 1, 1, 1, 1,
-0.6327839, 1.638711, 0.009718549, 0, 0, 1, 1, 1,
-0.6276933, 0.0666917, -1.995306, 1, 0, 0, 1, 1,
-0.6207342, -0.5476119, -1.107082, 1, 0, 0, 1, 1,
-0.6190892, 0.3349092, -0.7535699, 1, 0, 0, 1, 1,
-0.6174152, -0.8187479, -3.058524, 1, 0, 0, 1, 1,
-0.6162705, -0.07917276, -1.970114, 1, 0, 0, 1, 1,
-0.6155358, 0.2957919, -0.8850477, 0, 0, 0, 1, 1,
-0.6152708, -0.5398583, -1.506211, 0, 0, 0, 1, 1,
-0.6130694, -0.0626358, -0.6109415, 0, 0, 0, 1, 1,
-0.6115577, 0.4344953, -2.11127, 0, 0, 0, 1, 1,
-0.6019898, 0.3282766, -0.3344359, 0, 0, 0, 1, 1,
-0.597768, 2.277857, -0.05371111, 0, 0, 0, 1, 1,
-0.5912827, -0.7541799, -3.200497, 0, 0, 0, 1, 1,
-0.5904298, -0.5640652, -3.651285, 1, 1, 1, 1, 1,
-0.5853939, -0.205044, -2.618875, 1, 1, 1, 1, 1,
-0.5837739, -0.06582143, -1.06339, 1, 1, 1, 1, 1,
-0.5816914, -0.07450497, -1.528371, 1, 1, 1, 1, 1,
-0.5805486, -1.758957, -2.522196, 1, 1, 1, 1, 1,
-0.5726088, 0.5828086, -1.007962, 1, 1, 1, 1, 1,
-0.568619, -1.372888, -1.910849, 1, 1, 1, 1, 1,
-0.5671147, -0.1903293, -0.2805835, 1, 1, 1, 1, 1,
-0.5669516, 1.71232, -1.194003, 1, 1, 1, 1, 1,
-0.564186, 0.1926298, -2.014382, 1, 1, 1, 1, 1,
-0.5554571, -0.2905045, -1.24599, 1, 1, 1, 1, 1,
-0.5545766, -1.382205, -4.152414, 1, 1, 1, 1, 1,
-0.5516495, 0.9915735, 0.3111232, 1, 1, 1, 1, 1,
-0.5515703, 1.297439, -0.6321257, 1, 1, 1, 1, 1,
-0.5512007, 1.275483, 0.4696635, 1, 1, 1, 1, 1,
-0.5477101, -0.604482, -2.702445, 0, 0, 1, 1, 1,
-0.5454051, 2.770431, -0.8609733, 1, 0, 0, 1, 1,
-0.5448229, -0.5763204, -1.900692, 1, 0, 0, 1, 1,
-0.543502, 0.04100772, -2.324797, 1, 0, 0, 1, 1,
-0.5414694, -0.2559527, -2.871997, 1, 0, 0, 1, 1,
-0.538047, 0.3305661, -2.41261, 1, 0, 0, 1, 1,
-0.5342778, 1.311383, 0.1230845, 0, 0, 0, 1, 1,
-0.5341657, -0.4607529, -1.319622, 0, 0, 0, 1, 1,
-0.528293, 1.159292, -1.473903, 0, 0, 0, 1, 1,
-0.5276052, 0.3900879, -1.115278, 0, 0, 0, 1, 1,
-0.5255026, -1.054151, -2.390955, 0, 0, 0, 1, 1,
-0.5246184, -1.0221, -0.783137, 0, 0, 0, 1, 1,
-0.5234002, 1.397073, -1.371475, 0, 0, 0, 1, 1,
-0.5203951, -0.4190351, -3.210069, 1, 1, 1, 1, 1,
-0.5200102, 0.06635571, -1.23351, 1, 1, 1, 1, 1,
-0.5196921, 0.3942684, -0.07279679, 1, 1, 1, 1, 1,
-0.5175208, -0.6078156, -2.031153, 1, 1, 1, 1, 1,
-0.5120072, -0.72307, -2.203806, 1, 1, 1, 1, 1,
-0.5096085, 0.4554616, 0.5501384, 1, 1, 1, 1, 1,
-0.5090667, 1.156193, -0.6433942, 1, 1, 1, 1, 1,
-0.5083717, -0.8163604, -1.635766, 1, 1, 1, 1, 1,
-0.4983819, -1.101213, -2.672232, 1, 1, 1, 1, 1,
-0.4973635, -0.9943638, -2.840631, 1, 1, 1, 1, 1,
-0.4957258, -0.6782191, -2.018596, 1, 1, 1, 1, 1,
-0.4839574, 0.1250539, -0.6368531, 1, 1, 1, 1, 1,
-0.4799077, 0.895889, -3.146282, 1, 1, 1, 1, 1,
-0.479501, -0.3752692, -1.748056, 1, 1, 1, 1, 1,
-0.4787426, 0.3706522, -1.428563, 1, 1, 1, 1, 1,
-0.4738111, -0.8928863, -1.925723, 0, 0, 1, 1, 1,
-0.4724645, -0.6419791, -3.389629, 1, 0, 0, 1, 1,
-0.4720942, -0.2664353, -1.24378, 1, 0, 0, 1, 1,
-0.4717949, 1.217527, -1.575679, 1, 0, 0, 1, 1,
-0.4684782, 0.1569669, -2.762892, 1, 0, 0, 1, 1,
-0.4653692, -0.6280656, -2.739766, 1, 0, 0, 1, 1,
-0.4612283, 0.5740255, -0.4659747, 0, 0, 0, 1, 1,
-0.4588075, 0.778218, -0.9124561, 0, 0, 0, 1, 1,
-0.4466611, 0.6329833, -1.965865, 0, 0, 0, 1, 1,
-0.4429236, -1.176575, -1.842535, 0, 0, 0, 1, 1,
-0.4421566, -0.7723012, -3.709341, 0, 0, 0, 1, 1,
-0.4382041, -0.9690899, -2.757821, 0, 0, 0, 1, 1,
-0.4343249, 0.6782328, -0.6921898, 0, 0, 0, 1, 1,
-0.4277844, 0.04682923, 0.4039713, 1, 1, 1, 1, 1,
-0.4268244, 1.394064, 1.062127, 1, 1, 1, 1, 1,
-0.4261836, 1.177265, -1.026326, 1, 1, 1, 1, 1,
-0.424262, -0.9727682, -2.626112, 1, 1, 1, 1, 1,
-0.414827, -0.2843569, -4.381761, 1, 1, 1, 1, 1,
-0.4097686, -0.7926388, -4.176491, 1, 1, 1, 1, 1,
-0.4064154, 0.4298314, -2.879897, 1, 1, 1, 1, 1,
-0.4021088, 1.089686, -0.6204916, 1, 1, 1, 1, 1,
-0.3977258, 0.6695669, -1.493049, 1, 1, 1, 1, 1,
-0.397509, -1.051966, -2.643958, 1, 1, 1, 1, 1,
-0.3933077, -0.003568818, -0.5765215, 1, 1, 1, 1, 1,
-0.390662, 0.09913021, -2.654951, 1, 1, 1, 1, 1,
-0.3903618, -0.9544847, -2.719598, 1, 1, 1, 1, 1,
-0.3865301, -1.263249, -3.751158, 1, 1, 1, 1, 1,
-0.3829749, 0.5112925, -1.1212, 1, 1, 1, 1, 1,
-0.3794684, -0.2104913, -1.48012, 0, 0, 1, 1, 1,
-0.3793581, 1.487401, 0.4563378, 1, 0, 0, 1, 1,
-0.3734433, 0.5116158, 0.6760396, 1, 0, 0, 1, 1,
-0.3715952, 0.01874841, -2.45344, 1, 0, 0, 1, 1,
-0.3685525, -0.602161, -0.1267713, 1, 0, 0, 1, 1,
-0.366662, 0.5546196, 0.6681008, 1, 0, 0, 1, 1,
-0.3643861, -0.04092912, -2.082346, 0, 0, 0, 1, 1,
-0.3608735, -1.194089, -3.972888, 0, 0, 0, 1, 1,
-0.3596777, 1.545671, -0.7941341, 0, 0, 0, 1, 1,
-0.3563499, -0.30978, -1.693396, 0, 0, 0, 1, 1,
-0.3531253, 0.6301798, -0.1540689, 0, 0, 0, 1, 1,
-0.3524201, -1.549257, -2.746697, 0, 0, 0, 1, 1,
-0.3522992, 0.2073747, -0.5947983, 0, 0, 0, 1, 1,
-0.3497273, -2.267596, -4.090909, 1, 1, 1, 1, 1,
-0.3494234, -0.6788385, -4.042423, 1, 1, 1, 1, 1,
-0.3477623, -0.113778, -1.776989, 1, 1, 1, 1, 1,
-0.3384855, 0.8952206, 3.146616, 1, 1, 1, 1, 1,
-0.3359499, 0.1358338, -1.810744, 1, 1, 1, 1, 1,
-0.3316278, -1.513392, -0.9113142, 1, 1, 1, 1, 1,
-0.3305579, -0.2774149, -2.154525, 1, 1, 1, 1, 1,
-0.3293906, -0.5579684, -2.02121, 1, 1, 1, 1, 1,
-0.3282121, -0.8501998, -2.057703, 1, 1, 1, 1, 1,
-0.3269811, -1.582751, -5.088949, 1, 1, 1, 1, 1,
-0.318568, -0.596545, -1.851363, 1, 1, 1, 1, 1,
-0.3183029, -1.78624, -3.039816, 1, 1, 1, 1, 1,
-0.3153347, 0.5256514, 0.822145, 1, 1, 1, 1, 1,
-0.3137701, 1.036704, 2.186992, 1, 1, 1, 1, 1,
-0.3098885, 0.01769261, -2.631489, 1, 1, 1, 1, 1,
-0.299828, -0.8925792, -2.152031, 0, 0, 1, 1, 1,
-0.2926272, 0.704273, -0.2102547, 1, 0, 0, 1, 1,
-0.2875734, 0.5998737, -1.681408, 1, 0, 0, 1, 1,
-0.2798001, 0.3055506, -0.0905531, 1, 0, 0, 1, 1,
-0.2775668, 0.228265, -1.952989, 1, 0, 0, 1, 1,
-0.2765653, -1.929767, -4.002457, 1, 0, 0, 1, 1,
-0.2763375, 0.443275, -1.21549, 0, 0, 0, 1, 1,
-0.2720013, -0.685322, -1.343309, 0, 0, 0, 1, 1,
-0.2714255, 0.3917137, -0.8684197, 0, 0, 0, 1, 1,
-0.2713921, 0.8280436, -0.4180703, 0, 0, 0, 1, 1,
-0.2710414, -0.8271875, -2.073657, 0, 0, 0, 1, 1,
-0.2710402, -0.1332608, -1.48958, 0, 0, 0, 1, 1,
-0.2709242, 0.2463455, -0.3630533, 0, 0, 0, 1, 1,
-0.2671646, -1.83342, -3.312912, 1, 1, 1, 1, 1,
-0.2640384, 1.315119, -0.1070061, 1, 1, 1, 1, 1,
-0.2591427, 0.6678607, -1.920242, 1, 1, 1, 1, 1,
-0.258067, -1.020213, -2.341574, 1, 1, 1, 1, 1,
-0.2565337, 0.6480957, -0.6571702, 1, 1, 1, 1, 1,
-0.2559231, -0.6871293, -2.721113, 1, 1, 1, 1, 1,
-0.2555824, 0.2697574, 0.8582885, 1, 1, 1, 1, 1,
-0.2512773, 0.3865635, 0.04043834, 1, 1, 1, 1, 1,
-0.24895, 0.1616093, -1.182716, 1, 1, 1, 1, 1,
-0.2462102, 0.781179, -0.2763103, 1, 1, 1, 1, 1,
-0.2443522, -1.408107, -2.128072, 1, 1, 1, 1, 1,
-0.2408922, -0.3841064, -1.348136, 1, 1, 1, 1, 1,
-0.2364806, 0.2004326, -2.085895, 1, 1, 1, 1, 1,
-0.2341966, 0.6324092, -1.651297, 1, 1, 1, 1, 1,
-0.2246674, -0.9243994, -1.801344, 1, 1, 1, 1, 1,
-0.2207013, -0.1137263, -1.087336, 0, 0, 1, 1, 1,
-0.2200975, 2.075183, 0.4505102, 1, 0, 0, 1, 1,
-0.2183195, 0.2175713, -1.182942, 1, 0, 0, 1, 1,
-0.2182712, -1.691599, -3.606776, 1, 0, 0, 1, 1,
-0.2063896, -0.5883256, -3.111889, 1, 0, 0, 1, 1,
-0.1978475, -0.009417189, -4.223419, 1, 0, 0, 1, 1,
-0.1978202, 0.3173699, 0.6477395, 0, 0, 0, 1, 1,
-0.1916388, 0.01864829, -1.372865, 0, 0, 0, 1, 1,
-0.1916329, -0.8001402, -2.424431, 0, 0, 0, 1, 1,
-0.1905023, 0.177765, -2.680408, 0, 0, 0, 1, 1,
-0.1866551, -0.7819372, -2.262378, 0, 0, 0, 1, 1,
-0.1809617, -0.3639911, -1.627281, 0, 0, 0, 1, 1,
-0.1808968, 0.8490389, -0.515646, 0, 0, 0, 1, 1,
-0.1808966, 0.921763, -1.772908, 1, 1, 1, 1, 1,
-0.1798493, 0.8151712, 0.7177523, 1, 1, 1, 1, 1,
-0.1741834, 0.5698231, 1.778286, 1, 1, 1, 1, 1,
-0.173714, -1.02839, -2.756268, 1, 1, 1, 1, 1,
-0.1693473, -0.01674735, -1.798354, 1, 1, 1, 1, 1,
-0.1661627, 0.4175478, -2.018772, 1, 1, 1, 1, 1,
-0.1648747, 1.205301, -0.7906559, 1, 1, 1, 1, 1,
-0.1643156, -0.2167967, -1.946348, 1, 1, 1, 1, 1,
-0.1615497, -0.7261236, -4.749319, 1, 1, 1, 1, 1,
-0.160385, 2.04907, -0.5345144, 1, 1, 1, 1, 1,
-0.15967, -1.011237, -3.294888, 1, 1, 1, 1, 1,
-0.1590379, 0.2562693, -0.1692833, 1, 1, 1, 1, 1,
-0.1582453, 0.9758851, 0.7985487, 1, 1, 1, 1, 1,
-0.1479763, 0.1495052, -0.9490634, 1, 1, 1, 1, 1,
-0.1458105, 0.1047962, 0.04313737, 1, 1, 1, 1, 1,
-0.1446197, 0.1709592, -0.4476919, 0, 0, 1, 1, 1,
-0.1406962, -0.5562626, -4.849684, 1, 0, 0, 1, 1,
-0.1402217, 0.08586664, -0.02580802, 1, 0, 0, 1, 1,
-0.1386095, 1.619371, -0.5610787, 1, 0, 0, 1, 1,
-0.1362778, 0.5246857, -0.4225594, 1, 0, 0, 1, 1,
-0.1266212, 1.297702, -0.01260706, 1, 0, 0, 1, 1,
-0.1260497, -0.9499745, -2.544532, 0, 0, 0, 1, 1,
-0.1224895, 0.8790175, -0.9097195, 0, 0, 0, 1, 1,
-0.1220343, 0.5691182, -0.7244504, 0, 0, 0, 1, 1,
-0.1189021, -1.015661, -2.642339, 0, 0, 0, 1, 1,
-0.117605, 0.5478988, -0.6332257, 0, 0, 0, 1, 1,
-0.1163803, -0.8708905, -2.586223, 0, 0, 0, 1, 1,
-0.1140328, 0.9513316, 0.436089, 0, 0, 0, 1, 1,
-0.1118282, -1.571954, -3.129149, 1, 1, 1, 1, 1,
-0.1113179, -2.65597, -4.662905, 1, 1, 1, 1, 1,
-0.1093173, 0.3055674, -1.515714, 1, 1, 1, 1, 1,
-0.1068946, 0.8662107, -0.3649218, 1, 1, 1, 1, 1,
-0.1057059, -0.5757788, -1.894879, 1, 1, 1, 1, 1,
-0.1043873, 0.5556415, 0.4850441, 1, 1, 1, 1, 1,
-0.1043215, -0.6167613, -2.588979, 1, 1, 1, 1, 1,
-0.1025311, 0.7946113, 1.121481, 1, 1, 1, 1, 1,
-0.09865345, 2.220816, 0.3478851, 1, 1, 1, 1, 1,
-0.09803841, -0.50327, -2.870254, 1, 1, 1, 1, 1,
-0.09693502, 0.4535072, -1.070815, 1, 1, 1, 1, 1,
-0.09303708, -1.641553, -3.081129, 1, 1, 1, 1, 1,
-0.08990048, -0.6433016, -4.188825, 1, 1, 1, 1, 1,
-0.08936146, -1.249949, -3.236271, 1, 1, 1, 1, 1,
-0.08821561, 0.694589, -1.68557, 1, 1, 1, 1, 1,
-0.08647963, -1.776384, -4.201375, 0, 0, 1, 1, 1,
-0.08572253, -1.998754, -2.938364, 1, 0, 0, 1, 1,
-0.08190463, -0.8690819, -1.587867, 1, 0, 0, 1, 1,
-0.07444779, 0.3119005, -0.1320621, 1, 0, 0, 1, 1,
-0.07429779, -0.04136311, -1.589645, 1, 0, 0, 1, 1,
-0.07290006, -0.08771337, -2.011118, 1, 0, 0, 1, 1,
-0.06785131, 0.3916007, 0.07031592, 0, 0, 0, 1, 1,
-0.06693543, 1.322626, -1.542565, 0, 0, 0, 1, 1,
-0.06660806, -0.07728031, -4.631275, 0, 0, 0, 1, 1,
-0.0643611, -1.879204, -3.018312, 0, 0, 0, 1, 1,
-0.06243488, 0.111545, -2.050748, 0, 0, 0, 1, 1,
-0.05920022, -0.4122846, -2.190646, 0, 0, 0, 1, 1,
-0.05897231, 0.9422184, -0.6148715, 0, 0, 0, 1, 1,
-0.05599198, 0.328641, -1.706505, 1, 1, 1, 1, 1,
-0.05019672, -1.110416, -4.688923, 1, 1, 1, 1, 1,
-0.04973672, 1.199894, -1.543687, 1, 1, 1, 1, 1,
-0.04929928, 0.8553328, 0.07947213, 1, 1, 1, 1, 1,
-0.04821714, 0.01475425, -0.5362384, 1, 1, 1, 1, 1,
-0.04102626, -0.5915195, -2.957637, 1, 1, 1, 1, 1,
-0.04014035, 0.3233829, -0.6940471, 1, 1, 1, 1, 1,
-0.03499365, -0.1900181, -0.6937482, 1, 1, 1, 1, 1,
-0.02910791, 0.5044545, 2.488629, 1, 1, 1, 1, 1,
-0.02169487, -0.8439407, -2.863062, 1, 1, 1, 1, 1,
-0.01940688, 0.815048, 0.4289909, 1, 1, 1, 1, 1,
-0.01908146, -0.6858968, -4.084777, 1, 1, 1, 1, 1,
-0.01837285, -1.04197, -3.631826, 1, 1, 1, 1, 1,
-0.01753059, -0.5981535, -2.928418, 1, 1, 1, 1, 1,
-0.01742414, -0.5325788, -3.243073, 1, 1, 1, 1, 1,
-0.01348494, -0.2410037, -3.050507, 0, 0, 1, 1, 1,
-0.0113087, -1.414229, -2.461479, 1, 0, 0, 1, 1,
-0.005074925, 1.619283, -1.086103, 1, 0, 0, 1, 1,
-0.005052787, -0.3257277, -4.121543, 1, 0, 0, 1, 1,
-0.004046324, 0.5398655, 0.5212328, 1, 0, 0, 1, 1,
-0.00393129, 1.233325, -0.1450605, 1, 0, 0, 1, 1,
-0.002481631, -0.772823, -2.143508, 0, 0, 0, 1, 1,
-0.002008297, 1.200516, -0.3317634, 0, 0, 0, 1, 1,
0.007511912, -0.5066189, 5.214513, 0, 0, 0, 1, 1,
0.01357403, 1.155147, -0.00739638, 0, 0, 0, 1, 1,
0.01579838, 0.007961974, 0.6029614, 0, 0, 0, 1, 1,
0.01645762, 1.136361, 0.2958364, 0, 0, 0, 1, 1,
0.02119453, -0.09409537, 4.452416, 0, 0, 0, 1, 1,
0.03342083, -2.016566, 2.96172, 1, 1, 1, 1, 1,
0.03362467, -0.01420635, 1.877664, 1, 1, 1, 1, 1,
0.03518175, 0.0630624, -0.1954326, 1, 1, 1, 1, 1,
0.03635274, 0.6961768, 0.3929186, 1, 1, 1, 1, 1,
0.03676108, -0.3105415, 3.622985, 1, 1, 1, 1, 1,
0.04416049, -0.8331655, 2.447397, 1, 1, 1, 1, 1,
0.05054506, -1.909174, 2.383548, 1, 1, 1, 1, 1,
0.05208747, 0.5622429, -0.01582545, 1, 1, 1, 1, 1,
0.05460029, -0.4365865, 3.029694, 1, 1, 1, 1, 1,
0.05608167, -0.1303793, 0.8448961, 1, 1, 1, 1, 1,
0.05794102, -0.02078104, 1.108069, 1, 1, 1, 1, 1,
0.05903683, -0.3052147, 1.723901, 1, 1, 1, 1, 1,
0.0591821, 0.003539313, 1.436874, 1, 1, 1, 1, 1,
0.05957888, 0.1007724, 0.6395113, 1, 1, 1, 1, 1,
0.0635736, 0.4000841, -1.281448, 1, 1, 1, 1, 1,
0.06411979, 0.7077516, 0.8371829, 0, 0, 1, 1, 1,
0.07344056, 1.767869, -0.1659107, 1, 0, 0, 1, 1,
0.07381853, -1.033462, 2.775129, 1, 0, 0, 1, 1,
0.07547314, 0.1921388, -0.3603641, 1, 0, 0, 1, 1,
0.07916222, 0.9781641, -1.249472, 1, 0, 0, 1, 1,
0.07975534, -2.101525, 3.478197, 1, 0, 0, 1, 1,
0.0800749, -0.4108476, 2.347892, 0, 0, 0, 1, 1,
0.08935179, 0.1182651, 1.222558, 0, 0, 0, 1, 1,
0.1020995, -0.6020808, 1.535608, 0, 0, 0, 1, 1,
0.1043294, -0.9981507, 4.586791, 0, 0, 0, 1, 1,
0.1055509, -0.09477951, 2.178909, 0, 0, 0, 1, 1,
0.1055859, -1.706446, 3.530771, 0, 0, 0, 1, 1,
0.1085854, -1.132819, 3.732426, 0, 0, 0, 1, 1,
0.1093784, -0.5203611, 4.264284, 1, 1, 1, 1, 1,
0.1123706, -2.303718, 2.911929, 1, 1, 1, 1, 1,
0.1135354, -1.00762, 3.908736, 1, 1, 1, 1, 1,
0.1137736, -1.661246, 2.414535, 1, 1, 1, 1, 1,
0.1144681, 0.1470897, 0.7443386, 1, 1, 1, 1, 1,
0.1150525, -0.03546823, 1.740611, 1, 1, 1, 1, 1,
0.1150888, -1.892011, 2.156932, 1, 1, 1, 1, 1,
0.1154728, -0.1700843, 1.872466, 1, 1, 1, 1, 1,
0.1192637, 0.6255352, -1.216049, 1, 1, 1, 1, 1,
0.1197406, 0.4332157, 1.156502, 1, 1, 1, 1, 1,
0.1202149, 0.5823905, -1.140782, 1, 1, 1, 1, 1,
0.1211552, 0.7382637, -0.2638941, 1, 1, 1, 1, 1,
0.1222563, 0.7348428, -1.91308, 1, 1, 1, 1, 1,
0.1227186, -0.1313159, 1.378084, 1, 1, 1, 1, 1,
0.1243068, 0.5127571, 0.7071616, 1, 1, 1, 1, 1,
0.1267859, 0.9025971, -1.854246, 0, 0, 1, 1, 1,
0.1300569, 2.729078, 1.044628, 1, 0, 0, 1, 1,
0.1328591, -0.3908173, 2.704803, 1, 0, 0, 1, 1,
0.1347494, 0.3309884, -0.2499293, 1, 0, 0, 1, 1,
0.1348033, -0.6176087, 2.568859, 1, 0, 0, 1, 1,
0.1392234, 1.074555, 0.04049723, 1, 0, 0, 1, 1,
0.1397032, -0.6144214, 4.105391, 0, 0, 0, 1, 1,
0.1405075, 1.107322, 0.8805727, 0, 0, 0, 1, 1,
0.1405828, 2.547783, -0.4035686, 0, 0, 0, 1, 1,
0.142446, -1.217505, 1.938279, 0, 0, 0, 1, 1,
0.1445726, 0.3243288, 1.457619, 0, 0, 0, 1, 1,
0.1469701, 1.267803, 0.5980465, 0, 0, 0, 1, 1,
0.1557391, -0.4425722, 3.650826, 0, 0, 0, 1, 1,
0.1570811, -2.063429, 3.157602, 1, 1, 1, 1, 1,
0.1575535, 0.3796594, 1.041215, 1, 1, 1, 1, 1,
0.1597838, -1.474698, 2.537105, 1, 1, 1, 1, 1,
0.1601214, -1.637174, 3.651247, 1, 1, 1, 1, 1,
0.1624713, 0.2674217, -0.05839635, 1, 1, 1, 1, 1,
0.1650261, 0.6411442, 0.4458866, 1, 1, 1, 1, 1,
0.1679649, -0.3008817, 2.273242, 1, 1, 1, 1, 1,
0.1723129, -1.752741, 1.680996, 1, 1, 1, 1, 1,
0.1728921, -1.028456, 3.204959, 1, 1, 1, 1, 1,
0.1751361, 0.6239138, -0.1667968, 1, 1, 1, 1, 1,
0.1772625, 1.621283, -0.2760297, 1, 1, 1, 1, 1,
0.1807181, 0.7336866, -0.8495601, 1, 1, 1, 1, 1,
0.1828039, 0.9082147, 0.9293901, 1, 1, 1, 1, 1,
0.1873191, -0.7626195, 1.653474, 1, 1, 1, 1, 1,
0.1875865, -0.1418436, 2.688946, 1, 1, 1, 1, 1,
0.1882841, -1.613505, 3.707009, 0, 0, 1, 1, 1,
0.1890235, -0.8827082, 2.956208, 1, 0, 0, 1, 1,
0.1894635, 1.596678, -0.1434494, 1, 0, 0, 1, 1,
0.1902498, -1.220989, 3.55308, 1, 0, 0, 1, 1,
0.1948598, -0.6343329, 3.597123, 1, 0, 0, 1, 1,
0.1959074, -1.296634, 4.700073, 1, 0, 0, 1, 1,
0.1962359, -1.347695, 2.765139, 0, 0, 0, 1, 1,
0.201478, 0.8173559, -1.754128, 0, 0, 0, 1, 1,
0.2053406, 0.6054595, 0.9294523, 0, 0, 0, 1, 1,
0.2059018, 1.009139, 0.9983565, 0, 0, 0, 1, 1,
0.2080463, -0.1611444, 1.83129, 0, 0, 0, 1, 1,
0.2099312, -0.9284796, 1.765767, 0, 0, 0, 1, 1,
0.2118013, 3.497526, -0.5302144, 0, 0, 0, 1, 1,
0.2130859, 0.9688173, 1.699411, 1, 1, 1, 1, 1,
0.2136253, 0.7869959, 0.1299492, 1, 1, 1, 1, 1,
0.2138829, 0.4401174, -0.1902765, 1, 1, 1, 1, 1,
0.2154645, 0.3104466, 0.4404065, 1, 1, 1, 1, 1,
0.217753, -0.6055112, 3.738256, 1, 1, 1, 1, 1,
0.2203781, -0.05955264, 2.495507, 1, 1, 1, 1, 1,
0.2211867, 0.1016592, 1.627975, 1, 1, 1, 1, 1,
0.2230644, 0.551497, -1.426623, 1, 1, 1, 1, 1,
0.2232917, -1.303835, 4.999779, 1, 1, 1, 1, 1,
0.2258716, -0.03292671, 2.123536, 1, 1, 1, 1, 1,
0.2271584, -0.07723149, 2.197981, 1, 1, 1, 1, 1,
0.2289546, 0.5823402, 0.2020355, 1, 1, 1, 1, 1,
0.2310379, -1.249568, 2.067537, 1, 1, 1, 1, 1,
0.2312333, 1.827372, 1.079556, 1, 1, 1, 1, 1,
0.231702, 0.9808331, -0.005775497, 1, 1, 1, 1, 1,
0.2338665, 0.5089249, -0.5186868, 0, 0, 1, 1, 1,
0.2349775, 0.8330653, -1.198115, 1, 0, 0, 1, 1,
0.2373041, 0.3355549, -1.164653, 1, 0, 0, 1, 1,
0.241144, -0.6656638, 3.286256, 1, 0, 0, 1, 1,
0.2427859, -1.056512, 2.028057, 1, 0, 0, 1, 1,
0.2438586, -1.218483, 3.368701, 1, 0, 0, 1, 1,
0.2467935, -1.599461, 4.388947, 0, 0, 0, 1, 1,
0.2469248, 0.117672, 1.609866, 0, 0, 0, 1, 1,
0.2469495, 1.065901, 1.067768, 0, 0, 0, 1, 1,
0.2499022, 1.116338, 1.65846, 0, 0, 0, 1, 1,
0.2531361, -0.1334794, 1.809607, 0, 0, 0, 1, 1,
0.2567365, 0.1905148, -0.1080382, 0, 0, 0, 1, 1,
0.2592333, -1.362001, 3.653224, 0, 0, 0, 1, 1,
0.2601173, -0.1574275, 3.781726, 1, 1, 1, 1, 1,
0.2695327, -0.7372792, 4.429192, 1, 1, 1, 1, 1,
0.2705851, -0.1568953, 3.056645, 1, 1, 1, 1, 1,
0.2708428, -0.3621799, 3.252406, 1, 1, 1, 1, 1,
0.2735622, 1.243303, 0.4999358, 1, 1, 1, 1, 1,
0.276773, -1.457471, 3.345888, 1, 1, 1, 1, 1,
0.2789244, -0.389004, 1.827399, 1, 1, 1, 1, 1,
0.2870028, -0.5931305, 2.339277, 1, 1, 1, 1, 1,
0.3006789, -1.272013, 3.913175, 1, 1, 1, 1, 1,
0.3030075, 0.1586464, 0.6838812, 1, 1, 1, 1, 1,
0.3054694, 1.534147, -0.175168, 1, 1, 1, 1, 1,
0.3139559, 1.182703, 0.4189732, 1, 1, 1, 1, 1,
0.3139588, -0.7377586, 3.230925, 1, 1, 1, 1, 1,
0.3151407, 2.129779, -1.286765, 1, 1, 1, 1, 1,
0.315144, -0.5207032, 2.47216, 1, 1, 1, 1, 1,
0.3167504, 1.08536, -0.642374, 0, 0, 1, 1, 1,
0.3172461, -1.171843, 1.167879, 1, 0, 0, 1, 1,
0.3250848, -0.8442839, 1.626246, 1, 0, 0, 1, 1,
0.3267364, -2.094741, 3.347733, 1, 0, 0, 1, 1,
0.333875, -0.3040619, 1.573743, 1, 0, 0, 1, 1,
0.3352565, 1.197021, -0.1095719, 1, 0, 0, 1, 1,
0.3396118, 0.02492521, 0.7107205, 0, 0, 0, 1, 1,
0.3410158, -1.712728, 3.128699, 0, 0, 0, 1, 1,
0.3418716, 0.1108127, 2.850173, 0, 0, 0, 1, 1,
0.3513067, -1.283242, 3.126234, 0, 0, 0, 1, 1,
0.3543424, 0.4744008, 1.698002, 0, 0, 0, 1, 1,
0.3570285, 0.2158639, 0.320541, 0, 0, 0, 1, 1,
0.3600887, -0.9269095, 1.993882, 0, 0, 0, 1, 1,
0.3613122, -0.5164467, 2.562463, 1, 1, 1, 1, 1,
0.3669502, 0.4944065, -0.1804602, 1, 1, 1, 1, 1,
0.3688684, 0.3426366, 0.8166698, 1, 1, 1, 1, 1,
0.3688794, 0.7882185, 1.881943, 1, 1, 1, 1, 1,
0.3746018, 0.2982717, 1.736433, 1, 1, 1, 1, 1,
0.383053, -1.299012, 3.570975, 1, 1, 1, 1, 1,
0.385534, 0.2600541, 1.075319, 1, 1, 1, 1, 1,
0.3855505, -0.6908882, 1.589158, 1, 1, 1, 1, 1,
0.3925874, 1.150183, 0.5741974, 1, 1, 1, 1, 1,
0.3933967, -1.69047, 2.383226, 1, 1, 1, 1, 1,
0.3949063, 0.7580069, 0.2770796, 1, 1, 1, 1, 1,
0.3957005, 1.070286, 1.258695, 1, 1, 1, 1, 1,
0.3981262, 1.900332, 0.3055037, 1, 1, 1, 1, 1,
0.4000323, 0.2441802, 0.9175239, 1, 1, 1, 1, 1,
0.4026612, 2.00819, 0.3952546, 1, 1, 1, 1, 1,
0.4051173, 2.322682, -0.1039858, 0, 0, 1, 1, 1,
0.4054707, 0.5134056, -0.2273388, 1, 0, 0, 1, 1,
0.4055867, 1.902117, 3.535557, 1, 0, 0, 1, 1,
0.4112447, 1.063883, -0.2914936, 1, 0, 0, 1, 1,
0.4119049, 1.671067, 1.090168, 1, 0, 0, 1, 1,
0.4141916, 2.147504, 1.255927, 1, 0, 0, 1, 1,
0.4147108, -2.013134, 4.452088, 0, 0, 0, 1, 1,
0.4190347, 2.411077, -0.01927687, 0, 0, 0, 1, 1,
0.4217319, -0.1080991, 2.033486, 0, 0, 0, 1, 1,
0.4266139, -0.4653387, 1.648482, 0, 0, 0, 1, 1,
0.4268671, 0.3600275, -0.4609373, 0, 0, 0, 1, 1,
0.4351289, -0.6339759, 3.363416, 0, 0, 0, 1, 1,
0.43623, 0.7442608, 2.401968, 0, 0, 0, 1, 1,
0.4399783, 0.8769199, -1.098039, 1, 1, 1, 1, 1,
0.4445362, -0.4509097, 2.347759, 1, 1, 1, 1, 1,
0.445015, -0.1598956, 2.657731, 1, 1, 1, 1, 1,
0.4459495, 2.437685, -1.11463, 1, 1, 1, 1, 1,
0.4460311, 2.063277, -0.03526166, 1, 1, 1, 1, 1,
0.449175, -0.6479744, 3.105301, 1, 1, 1, 1, 1,
0.4594462, -0.06944616, 0.8430086, 1, 1, 1, 1, 1,
0.4622043, 0.2842752, 2.246216, 1, 1, 1, 1, 1,
0.4691044, -1.139204, 1.107948, 1, 1, 1, 1, 1,
0.4710059, 0.9899542, 0.01274411, 1, 1, 1, 1, 1,
0.4713278, 0.6158635, 0.7086402, 1, 1, 1, 1, 1,
0.4738984, -0.04442424, 1.904199, 1, 1, 1, 1, 1,
0.4796601, 1.186899, 2.138839, 1, 1, 1, 1, 1,
0.481567, -0.2671045, 2.485326, 1, 1, 1, 1, 1,
0.483575, 0.1086695, 1.362516, 1, 1, 1, 1, 1,
0.4879152, -0.3168245, 1.351, 0, 0, 1, 1, 1,
0.4931974, 0.5677453, 0.3231897, 1, 0, 0, 1, 1,
0.4933432, 0.2054184, 1.820356, 1, 0, 0, 1, 1,
0.4956993, -0.538786, 1.367097, 1, 0, 0, 1, 1,
0.4993306, 1.286126, 0.4956178, 1, 0, 0, 1, 1,
0.5021645, -1.168261, 3.803833, 1, 0, 0, 1, 1,
0.5089389, -0.06359983, 1.780884, 0, 0, 0, 1, 1,
0.5105143, -0.546806, 1.718922, 0, 0, 0, 1, 1,
0.5138658, -1.726358, 3.333006, 0, 0, 0, 1, 1,
0.5173934, -0.001119396, 1.706275, 0, 0, 0, 1, 1,
0.5184612, -0.7425717, 2.097796, 0, 0, 0, 1, 1,
0.5192678, 0.4498407, 1.723586, 0, 0, 0, 1, 1,
0.5196441, 1.655638, 0.8453761, 0, 0, 0, 1, 1,
0.5203192, 1.088327, 0.04474168, 1, 1, 1, 1, 1,
0.5205589, 0.5267981, -0.4215792, 1, 1, 1, 1, 1,
0.5234122, -0.9170863, 2.999215, 1, 1, 1, 1, 1,
0.528806, 0.003888003, 1.891492, 1, 1, 1, 1, 1,
0.5309955, 0.01313664, 0.6179205, 1, 1, 1, 1, 1,
0.5362293, 1.21038, 0.5084921, 1, 1, 1, 1, 1,
0.5395076, 0.3294134, 0.0138496, 1, 1, 1, 1, 1,
0.5401492, -1.025189, 2.001867, 1, 1, 1, 1, 1,
0.5428535, -0.4130308, 4.542942, 1, 1, 1, 1, 1,
0.5438069, 1.55139, -0.2742838, 1, 1, 1, 1, 1,
0.5457416, -0.289575, 2.020729, 1, 1, 1, 1, 1,
0.5462471, 0.7397221, -0.2913695, 1, 1, 1, 1, 1,
0.5476089, 0.9903509, 2.084585, 1, 1, 1, 1, 1,
0.5490975, 0.940143, 0.9338771, 1, 1, 1, 1, 1,
0.5531937, 1.030127, -0.193266, 1, 1, 1, 1, 1,
0.5570546, -0.3074456, 0.1576801, 0, 0, 1, 1, 1,
0.5604724, 0.132385, 2.04459, 1, 0, 0, 1, 1,
0.5645042, 0.3400055, 3.271307, 1, 0, 0, 1, 1,
0.565999, -0.03160286, 3.444006, 1, 0, 0, 1, 1,
0.567525, -0.3454983, 3.732835, 1, 0, 0, 1, 1,
0.5704665, -1.013183, 4.386967, 1, 0, 0, 1, 1,
0.5753917, -0.2091648, 2.476338, 0, 0, 0, 1, 1,
0.5761538, 0.5830756, -0.4173281, 0, 0, 0, 1, 1,
0.5843031, -1.743529, 2.805892, 0, 0, 0, 1, 1,
0.5843456, -0.4077137, 2.051692, 0, 0, 0, 1, 1,
0.5849575, -1.544552, 2.682984, 0, 0, 0, 1, 1,
0.5876412, 1.053004, 2.328467, 0, 0, 0, 1, 1,
0.5909149, -0.7242164, 2.729779, 0, 0, 0, 1, 1,
0.5946141, 0.1653487, 1.609165, 1, 1, 1, 1, 1,
0.5949622, -0.08236855, 0.8612752, 1, 1, 1, 1, 1,
0.5979334, -0.9264255, 2.927892, 1, 1, 1, 1, 1,
0.598396, -0.1743796, 0.7864172, 1, 1, 1, 1, 1,
0.5992843, -1.440845, 2.618009, 1, 1, 1, 1, 1,
0.6006908, -1.008311, 1.515803, 1, 1, 1, 1, 1,
0.6068857, -1.247631, 3.068779, 1, 1, 1, 1, 1,
0.6144968, -0.834732, 1.935571, 1, 1, 1, 1, 1,
0.6150473, 0.066396, 0.6929348, 1, 1, 1, 1, 1,
0.6150684, 0.8138779, 0.6699478, 1, 1, 1, 1, 1,
0.6162815, 0.7732624, -0.5085014, 1, 1, 1, 1, 1,
0.6194143, -0.08710633, 0.1708409, 1, 1, 1, 1, 1,
0.621589, 0.3915911, 1.214797, 1, 1, 1, 1, 1,
0.6217603, -0.05268632, 2.396238, 1, 1, 1, 1, 1,
0.6218871, 0.4959222, 0.1700045, 1, 1, 1, 1, 1,
0.6242439, -1.251292, 4.593697, 0, 0, 1, 1, 1,
0.62514, 2.655617, 0.4134061, 1, 0, 0, 1, 1,
0.6310716, -0.196649, 2.743181, 1, 0, 0, 1, 1,
0.6334204, -0.3780487, 1.700263, 1, 0, 0, 1, 1,
0.6425452, 1.054407, 0.5003486, 1, 0, 0, 1, 1,
0.6435878, 0.8992705, 0.5414139, 1, 0, 0, 1, 1,
0.6460263, -0.8198548, 2.22983, 0, 0, 0, 1, 1,
0.6467954, 1.470098, -0.7843499, 0, 0, 0, 1, 1,
0.6487674, 0.6741325, 1.623662, 0, 0, 0, 1, 1,
0.6561037, 2.236921, -0.1207825, 0, 0, 0, 1, 1,
0.6622096, -0.5097913, 2.767649, 0, 0, 0, 1, 1,
0.6690767, 0.9417573, 0.8900478, 0, 0, 0, 1, 1,
0.6771607, -1.871304, 2.273722, 0, 0, 0, 1, 1,
0.6785821, -0.6071442, 3.046401, 1, 1, 1, 1, 1,
0.680425, 0.7154041, 0.7060977, 1, 1, 1, 1, 1,
0.6818366, 0.6376908, -0.08045433, 1, 1, 1, 1, 1,
0.6821283, 1.508485, 0.06558429, 1, 1, 1, 1, 1,
0.6821358, 2.368789, -0.702182, 1, 1, 1, 1, 1,
0.6924495, -0.9096738, 2.232846, 1, 1, 1, 1, 1,
0.7029087, -1.462302, 2.638351, 1, 1, 1, 1, 1,
0.7053781, 0.8796861, -0.5760784, 1, 1, 1, 1, 1,
0.711145, 0.6484194, 0.7951466, 1, 1, 1, 1, 1,
0.7139017, 1.196401, 0.812502, 1, 1, 1, 1, 1,
0.7180368, 0.9879351, 0.4910915, 1, 1, 1, 1, 1,
0.7190503, 0.3173374, 2.141262, 1, 1, 1, 1, 1,
0.7273071, -2.157161, 1.16479, 1, 1, 1, 1, 1,
0.7282782, 1.474132, -0.229941, 1, 1, 1, 1, 1,
0.7333584, 0.6857626, -0.3836704, 1, 1, 1, 1, 1,
0.7338218, 0.5714448, 0.6446543, 0, 0, 1, 1, 1,
0.7347612, 0.1106227, 3.567763, 1, 0, 0, 1, 1,
0.7371323, 1.155133, -1.410637, 1, 0, 0, 1, 1,
0.757542, 1.02788, 1.369792, 1, 0, 0, 1, 1,
0.75795, -0.1852251, -0.1124549, 1, 0, 0, 1, 1,
0.7680271, -0.5290418, 3.969373, 1, 0, 0, 1, 1,
0.7689643, 1.477968, 0.8850738, 0, 0, 0, 1, 1,
0.7705587, 0.6512973, 1.468586, 0, 0, 0, 1, 1,
0.777676, 2.196614, 1.265969, 0, 0, 0, 1, 1,
0.7784048, 1.489533, 0.249473, 0, 0, 0, 1, 1,
0.7795079, -0.04553261, 3.034618, 0, 0, 0, 1, 1,
0.787017, 1.687405, -0.1001365, 0, 0, 0, 1, 1,
0.7894459, -1.28809, 3.878658, 0, 0, 0, 1, 1,
0.7923841, -0.09164374, 0.87354, 1, 1, 1, 1, 1,
0.7978674, -0.0591431, 2.703876, 1, 1, 1, 1, 1,
0.8011557, 0.9848962, 0.1723474, 1, 1, 1, 1, 1,
0.8063132, 0.792663, 0.2332887, 1, 1, 1, 1, 1,
0.8120948, 0.4081165, 2.390802, 1, 1, 1, 1, 1,
0.81402, 0.3844618, -0.09744354, 1, 1, 1, 1, 1,
0.8194979, 0.2472256, 1.255136, 1, 1, 1, 1, 1,
0.8199736, 0.2309155, 0.09840857, 1, 1, 1, 1, 1,
0.8301664, 0.9536408, 1.052612, 1, 1, 1, 1, 1,
0.8317998, -1.371459, 1.19925, 1, 1, 1, 1, 1,
0.8318058, -0.3082114, 3.313326, 1, 1, 1, 1, 1,
0.8346606, 0.62922, 2.210317, 1, 1, 1, 1, 1,
0.8364592, -1.353809, 3.167241, 1, 1, 1, 1, 1,
0.8383958, 1.355038, 0.9671317, 1, 1, 1, 1, 1,
0.8389415, -0.7265729, 2.587924, 1, 1, 1, 1, 1,
0.8390464, 0.2115779, 2.368545, 0, 0, 1, 1, 1,
0.8396928, 0.3475172, 0.2865464, 1, 0, 0, 1, 1,
0.8407171, -1.399153, 2.038672, 1, 0, 0, 1, 1,
0.8409779, -0.3908468, 2.824269, 1, 0, 0, 1, 1,
0.8429738, 1.914634, -0.8919513, 1, 0, 0, 1, 1,
0.8449317, -0.1094582, -0.06384373, 1, 0, 0, 1, 1,
0.8508467, 0.3421729, 0.4764984, 0, 0, 0, 1, 1,
0.8584649, 1.633129, 0.7477998, 0, 0, 0, 1, 1,
0.8604571, 0.08167268, 1.328582, 0, 0, 0, 1, 1,
0.8661005, -0.6352625, 1.190703, 0, 0, 0, 1, 1,
0.8738886, 0.08253849, 0.05894226, 0, 0, 0, 1, 1,
0.875856, 1.68733, 1.728023, 0, 0, 0, 1, 1,
0.8821107, -0.7588148, 2.608558, 0, 0, 0, 1, 1,
0.8852192, 1.618894, 1.91266, 1, 1, 1, 1, 1,
0.8854455, 0.968751, 0.8818218, 1, 1, 1, 1, 1,
0.8926132, 0.2455606, 0.4276491, 1, 1, 1, 1, 1,
0.8937982, 0.17871, 1.602261, 1, 1, 1, 1, 1,
0.899693, -0.947404, 2.842083, 1, 1, 1, 1, 1,
0.9043595, -1.034843, 3.087227, 1, 1, 1, 1, 1,
0.9074624, -0.5057493, 1.557991, 1, 1, 1, 1, 1,
0.9074649, -1.281514, 2.366828, 1, 1, 1, 1, 1,
0.9099262, 1.236777, -0.4855465, 1, 1, 1, 1, 1,
0.9150456, 1.063136, 0.99754, 1, 1, 1, 1, 1,
0.9184476, 0.4784462, 1.589005, 1, 1, 1, 1, 1,
0.9194722, -0.5651855, 3.730721, 1, 1, 1, 1, 1,
0.9227381, -0.4421473, 0.7849745, 1, 1, 1, 1, 1,
0.9284241, 0.06840172, 3.115635, 1, 1, 1, 1, 1,
0.931115, 0.5958827, 0.2943835, 1, 1, 1, 1, 1,
0.9338949, 2.704422, 0.634405, 0, 0, 1, 1, 1,
0.938765, 0.5557274, 0.658354, 1, 0, 0, 1, 1,
0.9405854, 0.2855675, 1.611785, 1, 0, 0, 1, 1,
0.947216, 2.194214, -0.2612281, 1, 0, 0, 1, 1,
0.9473543, 0.491813, 2.704619, 1, 0, 0, 1, 1,
0.9524045, 1.019957, -1.787872, 1, 0, 0, 1, 1,
0.9549056, -0.004985104, 2.12003, 0, 0, 0, 1, 1,
0.9602869, 1.726445, -0.4021835, 0, 0, 0, 1, 1,
0.9616826, -1.484895, 2.4313, 0, 0, 0, 1, 1,
0.9655846, 0.7757827, 1.996454, 0, 0, 0, 1, 1,
0.9671114, 0.2978495, 1.337007, 0, 0, 0, 1, 1,
0.97078, 0.3446236, 2.993664, 0, 0, 0, 1, 1,
0.9749461, 0.6252601, 1.025247, 0, 0, 0, 1, 1,
0.9810655, -2.074422, 2.785501, 1, 1, 1, 1, 1,
0.9835975, -1.191993, 1.799293, 1, 1, 1, 1, 1,
0.9876515, 0.3662279, 1.450837, 1, 1, 1, 1, 1,
0.9905447, 1.262166, 0.7067315, 1, 1, 1, 1, 1,
1.002242, -1.110159, 2.91663, 1, 1, 1, 1, 1,
1.006366, 0.243747, 1.242586, 1, 1, 1, 1, 1,
1.007939, 1.248109, -1.321848, 1, 1, 1, 1, 1,
1.019264, -1.489592, 1.655083, 1, 1, 1, 1, 1,
1.020773, 1.883055, -1.480088, 1, 1, 1, 1, 1,
1.023946, -0.03789692, -0.9815035, 1, 1, 1, 1, 1,
1.037567, 1.387574, -0.4594195, 1, 1, 1, 1, 1,
1.045265, 0.1838398, 2.45505, 1, 1, 1, 1, 1,
1.048242, 0.9420109, 1.137783, 1, 1, 1, 1, 1,
1.05471, 0.864923, 0.9813689, 1, 1, 1, 1, 1,
1.055441, -0.7817411, 0.0214653, 1, 1, 1, 1, 1,
1.059308, 0.1967161, 0.216463, 0, 0, 1, 1, 1,
1.059447, -0.7592284, 2.5652, 1, 0, 0, 1, 1,
1.06426, -1.122059, 0.7063701, 1, 0, 0, 1, 1,
1.065409, 0.858153, 0.6866518, 1, 0, 0, 1, 1,
1.066529, 0.8345338, 1.251772, 1, 0, 0, 1, 1,
1.067504, 0.140135, 0.263816, 1, 0, 0, 1, 1,
1.070886, -0.3901318, 1.467073, 0, 0, 0, 1, 1,
1.070975, 0.7334474, 1.007275, 0, 0, 0, 1, 1,
1.072103, -0.8532284, 2.36364, 0, 0, 0, 1, 1,
1.074911, 0.1217195, 0.8605557, 0, 0, 0, 1, 1,
1.076619, -0.160033, 2.77584, 0, 0, 0, 1, 1,
1.080378, -2.17413, 3.690037, 0, 0, 0, 1, 1,
1.080993, 0.1188179, 2.257584, 0, 0, 0, 1, 1,
1.083092, 0.8574499, -0.2789018, 1, 1, 1, 1, 1,
1.083383, 0.7202744, 0.2218172, 1, 1, 1, 1, 1,
1.095016, 1.243731, 0.9840612, 1, 1, 1, 1, 1,
1.105246, -0.5486354, 2.587759, 1, 1, 1, 1, 1,
1.10931, 0.04913003, 0.7916806, 1, 1, 1, 1, 1,
1.110964, -0.7670923, 2.26792, 1, 1, 1, 1, 1,
1.119191, 0.5397987, 3.370835, 1, 1, 1, 1, 1,
1.119789, 0.7920377, 1.586381, 1, 1, 1, 1, 1,
1.127075, 0.7720624, 0.2943194, 1, 1, 1, 1, 1,
1.128353, 0.2307316, 2.148568, 1, 1, 1, 1, 1,
1.129164, -0.5909778, 3.422753, 1, 1, 1, 1, 1,
1.129536, 0.2200242, 1.589624, 1, 1, 1, 1, 1,
1.13116, 0.08485517, 2.203276, 1, 1, 1, 1, 1,
1.138867, 0.9231145, 1.409368, 1, 1, 1, 1, 1,
1.139864, -0.3162365, 2.620151, 1, 1, 1, 1, 1,
1.156282, 0.5937552, 1.636717, 0, 0, 1, 1, 1,
1.158268, 0.6705049, 1.431639, 1, 0, 0, 1, 1,
1.164879, -0.2364465, 0.03046049, 1, 0, 0, 1, 1,
1.173925, -0.7736905, 2.538074, 1, 0, 0, 1, 1,
1.174108, -0.5204489, 4.95747, 1, 0, 0, 1, 1,
1.174922, -0.109284, 1.459111, 1, 0, 0, 1, 1,
1.182712, -1.817856, 4.019886, 0, 0, 0, 1, 1,
1.184407, 1.749048, -0.5584986, 0, 0, 0, 1, 1,
1.185923, 0.7303586, 0.4901308, 0, 0, 0, 1, 1,
1.187055, 1.647704, 0.6961623, 0, 0, 0, 1, 1,
1.192492, 0.7285382, -1.005291, 0, 0, 0, 1, 1,
1.192688, 1.094552, 0.5568266, 0, 0, 0, 1, 1,
1.193056, -0.383693, 0.9780105, 0, 0, 0, 1, 1,
1.193389, 0.9851536, 0.3237128, 1, 1, 1, 1, 1,
1.194651, 0.2879342, 2.923468, 1, 1, 1, 1, 1,
1.195403, 0.8882086, 2.337541, 1, 1, 1, 1, 1,
1.196305, 1.746105, 1.08785, 1, 1, 1, 1, 1,
1.196699, -0.3066087, 1.608801, 1, 1, 1, 1, 1,
1.20021, 1.900746, 2.090919, 1, 1, 1, 1, 1,
1.205741, -1.195708, 2.249942, 1, 1, 1, 1, 1,
1.208763, -0.8009205, 0.3441059, 1, 1, 1, 1, 1,
1.214675, -0.1142322, 1.504555, 1, 1, 1, 1, 1,
1.21482, 0.5667913, 0.2184124, 1, 1, 1, 1, 1,
1.215401, -1.359651, 0.9340173, 1, 1, 1, 1, 1,
1.224335, 0.0721467, 2.120245, 1, 1, 1, 1, 1,
1.240601, -0.07438891, 0.5258498, 1, 1, 1, 1, 1,
1.243664, 0.1255622, 1.543826, 1, 1, 1, 1, 1,
1.246436, -1.095505, 0.739646, 1, 1, 1, 1, 1,
1.248687, -0.8883333, 1.136419, 0, 0, 1, 1, 1,
1.260807, 0.5155496, 1.997373, 1, 0, 0, 1, 1,
1.269577, 0.3220639, 0.5830802, 1, 0, 0, 1, 1,
1.287861, 1.606116, 0.02449964, 1, 0, 0, 1, 1,
1.293545, -0.6182404, 1.642083, 1, 0, 0, 1, 1,
1.299392, -1.925763, 2.583792, 1, 0, 0, 1, 1,
1.301642, 0.3190301, 0.9716489, 0, 0, 0, 1, 1,
1.309125, 0.3061246, 0.6572844, 0, 0, 0, 1, 1,
1.315117, 0.1778531, 2.863105, 0, 0, 0, 1, 1,
1.331875, -1.130266, 1.320168, 0, 0, 0, 1, 1,
1.34072, 0.4059337, 1.385432, 0, 0, 0, 1, 1,
1.343068, -1.257033, 3.52064, 0, 0, 0, 1, 1,
1.345818, 1.030026, 1.10133, 0, 0, 0, 1, 1,
1.351073, -0.3562067, 0.9072648, 1, 1, 1, 1, 1,
1.364091, -0.8831711, 2.716363, 1, 1, 1, 1, 1,
1.365154, -2.932267, 1.777159, 1, 1, 1, 1, 1,
1.375059, -0.6551214, 2.865616, 1, 1, 1, 1, 1,
1.376067, 1.201619, 2.423847, 1, 1, 1, 1, 1,
1.377101, 1.640589, 0.1865004, 1, 1, 1, 1, 1,
1.379074, -0.1043617, 2.575979, 1, 1, 1, 1, 1,
1.396094, -0.5005892, 0.6752049, 1, 1, 1, 1, 1,
1.403388, -1.441064, 1.025591, 1, 1, 1, 1, 1,
1.413625, 0.362388, 1.070333, 1, 1, 1, 1, 1,
1.415418, -0.772554, 0.8131844, 1, 1, 1, 1, 1,
1.432725, -0.2176023, 2.253884, 1, 1, 1, 1, 1,
1.442935, -1.060933, 1.734554, 1, 1, 1, 1, 1,
1.454142, 0.4798423, 1.270714, 1, 1, 1, 1, 1,
1.456944, 0.7959208, 0.7134635, 1, 1, 1, 1, 1,
1.474144, -0.1243351, 2.014041, 0, 0, 1, 1, 1,
1.484021, -1.696306, 1.96149, 1, 0, 0, 1, 1,
1.49008, 0.5910794, 0.08729056, 1, 0, 0, 1, 1,
1.492695, 1.488711, 1.298629, 1, 0, 0, 1, 1,
1.504211, -0.6289176, 1.744481, 1, 0, 0, 1, 1,
1.504913, -0.7709062, 2.650577, 1, 0, 0, 1, 1,
1.537541, 1.473044, 2.116385, 0, 0, 0, 1, 1,
1.539878, 1.723787, -0.2735825, 0, 0, 0, 1, 1,
1.549736, -0.02133646, 2.876367, 0, 0, 0, 1, 1,
1.590475, 1.316002, 2.421205, 0, 0, 0, 1, 1,
1.606252, 0.2412442, 2.255474, 0, 0, 0, 1, 1,
1.614199, -2.134901, 1.326754, 0, 0, 0, 1, 1,
1.619501, -1.664388, 3.079887, 0, 0, 0, 1, 1,
1.629838, 0.7975269, -0.01970673, 1, 1, 1, 1, 1,
1.632066, -1.325879, 2.613841, 1, 1, 1, 1, 1,
1.642919, -1.824279, 2.982348, 1, 1, 1, 1, 1,
1.65043, 1.12355, -0.2497113, 1, 1, 1, 1, 1,
1.675016, -0.4703038, 1.204484, 1, 1, 1, 1, 1,
1.684594, -0.4105714, 1.875778, 1, 1, 1, 1, 1,
1.68507, 0.1465093, 1.944491, 1, 1, 1, 1, 1,
1.713803, 0.9547644, -0.405541, 1, 1, 1, 1, 1,
1.71484, -0.1338102, 2.423279, 1, 1, 1, 1, 1,
1.715418, 1.309654, 1.046598, 1, 1, 1, 1, 1,
1.716475, 0.6665999, 0.1242805, 1, 1, 1, 1, 1,
1.723207, -0.07453413, 2.942806, 1, 1, 1, 1, 1,
1.743625, 0.07035922, 0.3589896, 1, 1, 1, 1, 1,
1.747661, -1.832809, 3.451609, 1, 1, 1, 1, 1,
1.748627, -0.9138178, 3.835909, 1, 1, 1, 1, 1,
1.767304, 0.1397688, 0.1551671, 0, 0, 1, 1, 1,
1.777135, -0.09987859, 1.028986, 1, 0, 0, 1, 1,
1.782786, 1.293952, 1.75308, 1, 0, 0, 1, 1,
1.797414, -0.0829498, 0.5980955, 1, 0, 0, 1, 1,
1.810606, -0.1478009, 2.369224, 1, 0, 0, 1, 1,
1.818126, 0.7304839, 1.186542, 1, 0, 0, 1, 1,
1.821401, -0.1839132, 0.7449767, 0, 0, 0, 1, 1,
1.823323, -1.593738, 1.665786, 0, 0, 0, 1, 1,
1.829233, 0.941691, 2.85476, 0, 0, 0, 1, 1,
1.83013, 0.8785438, -0.1214209, 0, 0, 0, 1, 1,
1.835154, -0.5457847, 1.763122, 0, 0, 0, 1, 1,
1.843539, 0.4152574, 2.404086, 0, 0, 0, 1, 1,
1.851261, 0.8458768, 0.3027481, 0, 0, 0, 1, 1,
1.854648, -0.5982063, 3.030029, 1, 1, 1, 1, 1,
1.857821, -1.368747, 3.138787, 1, 1, 1, 1, 1,
1.904926, -1.687131, 3.287325, 1, 1, 1, 1, 1,
1.946892, -0.1521093, 0.5708607, 1, 1, 1, 1, 1,
1.972459, 0.9870394, 1.239895, 1, 1, 1, 1, 1,
1.976313, 0.6109649, 0.5657165, 1, 1, 1, 1, 1,
1.978373, 0.2526138, 2.922599, 1, 1, 1, 1, 1,
1.979498, -0.1600607, 0.249711, 1, 1, 1, 1, 1,
1.985993, -0.9427686, 3.784196, 1, 1, 1, 1, 1,
1.986421, 0.2229812, -0.5553297, 1, 1, 1, 1, 1,
2.001989, -0.8951181, 3.297449, 1, 1, 1, 1, 1,
2.011923, 0.391804, 3.213169, 1, 1, 1, 1, 1,
2.032886, 0.6849, 1.356117, 1, 1, 1, 1, 1,
2.038263, 1.865998, 0.6736174, 1, 1, 1, 1, 1,
2.039841, -0.3420202, 0.5709328, 1, 1, 1, 1, 1,
2.054929, -0.1350397, 3.392576, 0, 0, 1, 1, 1,
2.091466, 0.3719013, 2.20084, 1, 0, 0, 1, 1,
2.093348, -0.3407901, 1.589092, 1, 0, 0, 1, 1,
2.131019, -0.7930757, 0.8599824, 1, 0, 0, 1, 1,
2.1329, 0.1433264, 2.516965, 1, 0, 0, 1, 1,
2.159203, 1.232981, 0.4915644, 1, 0, 0, 1, 1,
2.191819, -0.03108964, 1.425543, 0, 0, 0, 1, 1,
2.192907, 1.308178, 0.9057023, 0, 0, 0, 1, 1,
2.22269, 1.962152, 3.151898, 0, 0, 0, 1, 1,
2.438507, -0.1090848, 3.572839, 0, 0, 0, 1, 1,
2.454609, 1.751681, 1.126482, 0, 0, 0, 1, 1,
2.487634, 0.3955534, 2.315549, 0, 0, 0, 1, 1,
2.516653, -0.1178024, -0.3607891, 0, 0, 0, 1, 1,
2.518084, 0.1551602, 0.5877327, 1, 1, 1, 1, 1,
2.765699, -1.62627, 1.955725, 1, 1, 1, 1, 1,
2.862309, -0.3277297, 1.484539, 1, 1, 1, 1, 1,
3.01024, 1.978312, 0.8384371, 1, 1, 1, 1, 1,
3.013622, -0.6396042, 2.475335, 1, 1, 1, 1, 1,
3.083521, 0.2276071, -0.798377, 1, 1, 1, 1, 1,
3.273079, -0.002894576, 3.0467, 1, 1, 1, 1, 1
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
var radius = 9.550841;
var distance = 33.54692;
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
mvMatrix.translate( 0.1741781, -0.2826295, -0.06278205 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.54692);
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
