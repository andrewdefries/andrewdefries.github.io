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
-2.814275, 0.1681155, -1.395131, 1, 0, 0, 1,
-2.804134, 2.436057, -1.850527, 1, 0.007843138, 0, 1,
-2.648591, -0.1651889, -1.951278, 1, 0.01176471, 0, 1,
-2.499904, -0.6531898, -1.232737, 1, 0.01960784, 0, 1,
-2.489493, -0.4014151, -2.027897, 1, 0.02352941, 0, 1,
-2.387945, -0.1547932, -1.544146, 1, 0.03137255, 0, 1,
-2.26725, 0.3155379, -4.244812, 1, 0.03529412, 0, 1,
-2.246972, -0.8061358, -1.914505, 1, 0.04313726, 0, 1,
-2.234141, -1.542166, -3.020181, 1, 0.04705882, 0, 1,
-2.199208, 0.9222867, 0.5188127, 1, 0.05490196, 0, 1,
-2.195549, 0.3807493, -0.778675, 1, 0.05882353, 0, 1,
-2.19486, 1.13746, -1.572355, 1, 0.06666667, 0, 1,
-2.190503, -0.5376245, -1.209991, 1, 0.07058824, 0, 1,
-2.167952, 0.7183272, -1.579641, 1, 0.07843138, 0, 1,
-2.166591, 1.138646, -0.140674, 1, 0.08235294, 0, 1,
-2.165126, -0.367081, -0.1021257, 1, 0.09019608, 0, 1,
-2.14332, 1.967595, -2.073024, 1, 0.09411765, 0, 1,
-2.140718, 0.3802997, -3.14343, 1, 0.1019608, 0, 1,
-2.137923, 0.4067634, -1.510252, 1, 0.1098039, 0, 1,
-2.112576, -0.7407141, -2.032111, 1, 0.1137255, 0, 1,
-2.10915, 0.2621225, -0.4079504, 1, 0.1215686, 0, 1,
-2.08252, -1.353615, -1.977613, 1, 0.1254902, 0, 1,
-2.080934, 0.1949494, -0.7484541, 1, 0.1333333, 0, 1,
-2.079939, 0.4773136, -0.8335955, 1, 0.1372549, 0, 1,
-2.015805, -0.7856076, -1.61256, 1, 0.145098, 0, 1,
-1.983279, 2.740874, -2.787377, 1, 0.1490196, 0, 1,
-1.914918, 0.399545, -1.338729, 1, 0.1568628, 0, 1,
-1.879705, 0.67246, -4.38945, 1, 0.1607843, 0, 1,
-1.871615, -0.4058305, -3.086868, 1, 0.1686275, 0, 1,
-1.85196, 1.352799, -0.4612135, 1, 0.172549, 0, 1,
-1.839267, -1.05738, -0.8779774, 1, 0.1803922, 0, 1,
-1.83435, -0.4865223, -3.626189, 1, 0.1843137, 0, 1,
-1.832887, 0.2512855, -0.8928428, 1, 0.1921569, 0, 1,
-1.813976, -1.415783, -3.084537, 1, 0.1960784, 0, 1,
-1.778012, 0.305088, -1.167022, 1, 0.2039216, 0, 1,
-1.769503, -0.3244036, -2.627622, 1, 0.2117647, 0, 1,
-1.7642, -0.130203, -1.457541, 1, 0.2156863, 0, 1,
-1.762394, 1.595281, -0.7138337, 1, 0.2235294, 0, 1,
-1.757069, -1.221147, -1.503297, 1, 0.227451, 0, 1,
-1.743641, 0.1072668, -1.518956, 1, 0.2352941, 0, 1,
-1.737392, -0.4015206, -0.6630223, 1, 0.2392157, 0, 1,
-1.734697, -1.191323, -3.201468, 1, 0.2470588, 0, 1,
-1.72146, 0.8837826, -0.07151463, 1, 0.2509804, 0, 1,
-1.708781, 0.1476245, 0.01310037, 1, 0.2588235, 0, 1,
-1.705235, 0.6876361, -0.4360216, 1, 0.2627451, 0, 1,
-1.684185, 0.8019985, -0.436528, 1, 0.2705882, 0, 1,
-1.68106, 1.174121, -1.287784, 1, 0.2745098, 0, 1,
-1.660864, 1.511206, -0.5127286, 1, 0.282353, 0, 1,
-1.657097, -0.003948172, -1.627347, 1, 0.2862745, 0, 1,
-1.641098, -0.8473099, -1.264438, 1, 0.2941177, 0, 1,
-1.630379, 0.4941429, -2.354908, 1, 0.3019608, 0, 1,
-1.629441, 0.3663112, -1.480189, 1, 0.3058824, 0, 1,
-1.606182, -0.4378754, -3.445122, 1, 0.3137255, 0, 1,
-1.598606, 1.141629, -1.346542, 1, 0.3176471, 0, 1,
-1.597694, -0.07759433, -2.681242, 1, 0.3254902, 0, 1,
-1.585658, 1.679914, -1.040929, 1, 0.3294118, 0, 1,
-1.582867, 0.02042759, -1.053009, 1, 0.3372549, 0, 1,
-1.57977, 0.1872518, -1.820797, 1, 0.3411765, 0, 1,
-1.572311, 1.402332, -1.221486, 1, 0.3490196, 0, 1,
-1.571051, 0.05341894, -1.836224, 1, 0.3529412, 0, 1,
-1.550025, -0.002227402, -1.223271, 1, 0.3607843, 0, 1,
-1.54047, 1.088243, -0.3201798, 1, 0.3647059, 0, 1,
-1.524129, -0.8954194, -3.525409, 1, 0.372549, 0, 1,
-1.522098, -0.3057321, -1.961666, 1, 0.3764706, 0, 1,
-1.498452, -1.023203, -2.45317, 1, 0.3843137, 0, 1,
-1.491558, -0.9097269, -2.009653, 1, 0.3882353, 0, 1,
-1.484059, -0.7357523, -3.30014, 1, 0.3960784, 0, 1,
-1.472925, -0.08643436, -1.160161, 1, 0.4039216, 0, 1,
-1.468234, 1.290823, 0.3689295, 1, 0.4078431, 0, 1,
-1.458183, 0.4716448, -1.277933, 1, 0.4156863, 0, 1,
-1.439743, -0.3409064, -2.863295, 1, 0.4196078, 0, 1,
-1.43674, 0.5839632, -1.657537, 1, 0.427451, 0, 1,
-1.429204, -0.317673, -2.59713, 1, 0.4313726, 0, 1,
-1.428889, 0.6197369, -0.2154726, 1, 0.4392157, 0, 1,
-1.420347, 1.190436, -0.07807305, 1, 0.4431373, 0, 1,
-1.419876, -1.256505, -0.2751516, 1, 0.4509804, 0, 1,
-1.417737, -1.427771, -0.5230874, 1, 0.454902, 0, 1,
-1.415733, -0.7294117, -2.40405, 1, 0.4627451, 0, 1,
-1.381369, -1.596815, -2.821983, 1, 0.4666667, 0, 1,
-1.378912, -0.2459284, -3.119609, 1, 0.4745098, 0, 1,
-1.376058, 1.325872, -1.322988, 1, 0.4784314, 0, 1,
-1.375114, -0.7268949, -1.964253, 1, 0.4862745, 0, 1,
-1.362921, 2.313653, 1.186927, 1, 0.4901961, 0, 1,
-1.359488, 0.3103219, -2.853122, 1, 0.4980392, 0, 1,
-1.355477, -0.3841766, -3.080119, 1, 0.5058824, 0, 1,
-1.348456, 1.691263, -1.503495, 1, 0.509804, 0, 1,
-1.335937, 0.3396792, -1.379979, 1, 0.5176471, 0, 1,
-1.325571, -0.8068782, -1.253926, 1, 0.5215687, 0, 1,
-1.321859, -0.9502885, -3.190114, 1, 0.5294118, 0, 1,
-1.308115, -2.278612, -2.372192, 1, 0.5333334, 0, 1,
-1.306401, -1.868102, -2.589145, 1, 0.5411765, 0, 1,
-1.306389, -0.7785431, -0.835263, 1, 0.5450981, 0, 1,
-1.293493, -0.2056252, -3.995573, 1, 0.5529412, 0, 1,
-1.260838, 0.1533383, 0.5011274, 1, 0.5568628, 0, 1,
-1.260144, 0.6057467, 0.5565108, 1, 0.5647059, 0, 1,
-1.250283, 0.7815936, -0.1423005, 1, 0.5686275, 0, 1,
-1.246679, -0.9377376, -1.142886, 1, 0.5764706, 0, 1,
-1.232695, 0.3073815, -0.958933, 1, 0.5803922, 0, 1,
-1.223427, -0.7306784, -1.483361, 1, 0.5882353, 0, 1,
-1.221569, -0.5662237, -2.241145, 1, 0.5921569, 0, 1,
-1.216229, 0.9101462, -1.498705, 1, 0.6, 0, 1,
-1.216093, 0.1668187, -0.3893888, 1, 0.6078432, 0, 1,
-1.215061, -0.870774, -2.946126, 1, 0.6117647, 0, 1,
-1.213503, 0.2150125, -2.625819, 1, 0.6196079, 0, 1,
-1.213029, -0.8369741, -2.119618, 1, 0.6235294, 0, 1,
-1.209621, -0.1130953, -2.160968, 1, 0.6313726, 0, 1,
-1.199968, -0.8361679, -1.812822, 1, 0.6352941, 0, 1,
-1.197951, -0.3650323, -0.145084, 1, 0.6431373, 0, 1,
-1.186691, -0.240546, -2.858932, 1, 0.6470588, 0, 1,
-1.168548, 0.6057495, 0.2173871, 1, 0.654902, 0, 1,
-1.16507, 1.597319, -1.292798, 1, 0.6588235, 0, 1,
-1.158591, 0.3156323, -1.163161, 1, 0.6666667, 0, 1,
-1.153496, 0.682827, -2.261563, 1, 0.6705883, 0, 1,
-1.148859, 0.5591162, -2.558301, 1, 0.6784314, 0, 1,
-1.148612, 0.5722928, -1.253942, 1, 0.682353, 0, 1,
-1.145296, -0.4178559, -2.155482, 1, 0.6901961, 0, 1,
-1.131325, 1.706019, -3.247759, 1, 0.6941177, 0, 1,
-1.124197, 0.1118916, -1.639621, 1, 0.7019608, 0, 1,
-1.118281, 0.02333415, -1.221754, 1, 0.7098039, 0, 1,
-1.117977, 0.7499741, -0.0008024206, 1, 0.7137255, 0, 1,
-1.107709, -0.7483926, -2.926548, 1, 0.7215686, 0, 1,
-1.105546, 1.798836, -0.6168967, 1, 0.7254902, 0, 1,
-1.101357, -1.285368, -2.652894, 1, 0.7333333, 0, 1,
-1.098263, 0.3934081, -0.9446059, 1, 0.7372549, 0, 1,
-1.098204, 0.6152508, -1.591202, 1, 0.7450981, 0, 1,
-1.08256, -0.4654223, -1.284027, 1, 0.7490196, 0, 1,
-1.08163, -0.3226976, -2.517677, 1, 0.7568628, 0, 1,
-1.066459, 1.138302, -0.1544447, 1, 0.7607843, 0, 1,
-1.066403, 1.112645, -2.767653, 1, 0.7686275, 0, 1,
-1.058941, -1.670547, -2.30702, 1, 0.772549, 0, 1,
-1.051657, 0.8360975, 0.456259, 1, 0.7803922, 0, 1,
-1.048969, 0.7353551, -0.5608664, 1, 0.7843137, 0, 1,
-1.038271, 1.700155, -0.9350331, 1, 0.7921569, 0, 1,
-1.036845, 1.295206, -0.9895657, 1, 0.7960784, 0, 1,
-1.032361, 0.6250776, -1.155165, 1, 0.8039216, 0, 1,
-1.027588, -2.016612, -2.588861, 1, 0.8117647, 0, 1,
-1.02401, 0.2844652, -1.156212, 1, 0.8156863, 0, 1,
-1.023718, 0.8866093, -1.304087, 1, 0.8235294, 0, 1,
-1.021583, -0.1538833, -2.587614, 1, 0.827451, 0, 1,
-1.013377, -0.6766794, -2.510773, 1, 0.8352941, 0, 1,
-1.009255, 0.3995287, -1.186424, 1, 0.8392157, 0, 1,
-1.009213, 0.1167576, -0.5851431, 1, 0.8470588, 0, 1,
-1.000775, 1.076512, 0.445362, 1, 0.8509804, 0, 1,
-0.999719, 1.28755, -2.276023, 1, 0.8588235, 0, 1,
-0.9946907, -0.8388823, -1.333715, 1, 0.8627451, 0, 1,
-0.9937845, 0.7936924, -0.7857016, 1, 0.8705882, 0, 1,
-0.9906563, -0.9300314, -1.76483, 1, 0.8745098, 0, 1,
-0.9878187, 1.857635, 0.4993467, 1, 0.8823529, 0, 1,
-0.9840184, 0.2036644, -0.3543878, 1, 0.8862745, 0, 1,
-0.98276, -1.602153, -2.058347, 1, 0.8941177, 0, 1,
-0.9812543, 0.7175028, -0.494207, 1, 0.8980392, 0, 1,
-0.9811254, 0.5102201, -2.467813, 1, 0.9058824, 0, 1,
-0.9781207, -0.2583162, -1.433133, 1, 0.9137255, 0, 1,
-0.9673491, -1.200677, -2.482813, 1, 0.9176471, 0, 1,
-0.9663308, 0.1053516, -0.9715582, 1, 0.9254902, 0, 1,
-0.9628227, 0.5835726, -0.7648929, 1, 0.9294118, 0, 1,
-0.9554497, -1.499094, -2.933508, 1, 0.9372549, 0, 1,
-0.9527918, -0.7701832, -1.85575, 1, 0.9411765, 0, 1,
-0.9515553, 0.607815, 0.311328, 1, 0.9490196, 0, 1,
-0.9466263, 0.6052762, -1.05052, 1, 0.9529412, 0, 1,
-0.9426308, 1.021926, -1.344723, 1, 0.9607843, 0, 1,
-0.9400313, -0.08098937, -1.691916, 1, 0.9647059, 0, 1,
-0.937463, 0.7078687, -2.006533, 1, 0.972549, 0, 1,
-0.9373455, -1.867386, -2.975802, 1, 0.9764706, 0, 1,
-0.9352399, -1.890119, -4.669357, 1, 0.9843137, 0, 1,
-0.9245347, -0.3985904, -0.5555393, 1, 0.9882353, 0, 1,
-0.9244902, -0.2237367, -1.653463, 1, 0.9960784, 0, 1,
-0.9244571, -0.242916, -3.111525, 0.9960784, 1, 0, 1,
-0.9238596, -0.1398905, -1.498468, 0.9921569, 1, 0, 1,
-0.9221823, -0.3756265, -2.529823, 0.9843137, 1, 0, 1,
-0.9193798, -0.04595546, -0.859893, 0.9803922, 1, 0, 1,
-0.914243, 0.297105, -2.451042, 0.972549, 1, 0, 1,
-0.9131346, -0.5076497, -1.632848, 0.9686275, 1, 0, 1,
-0.9128885, -0.2706779, -1.578956, 0.9607843, 1, 0, 1,
-0.9088008, 0.7428786, -0.5671668, 0.9568627, 1, 0, 1,
-0.9069998, 0.7812173, -0.4743013, 0.9490196, 1, 0, 1,
-0.8995398, -0.4715575, -0.6943368, 0.945098, 1, 0, 1,
-0.8988712, -0.9950989, -3.136781, 0.9372549, 1, 0, 1,
-0.8941987, -0.1711785, -1.849748, 0.9333333, 1, 0, 1,
-0.8920143, -2.711885, -3.431817, 0.9254902, 1, 0, 1,
-0.8905684, 0.09341743, -0.1303613, 0.9215686, 1, 0, 1,
-0.8862347, -1.979705, -3.225603, 0.9137255, 1, 0, 1,
-0.8830008, 0.6912335, -0.342119, 0.9098039, 1, 0, 1,
-0.8827983, 1.943774, 0.007144761, 0.9019608, 1, 0, 1,
-0.8807155, 1.80429, -0.774349, 0.8941177, 1, 0, 1,
-0.8757564, -0.3646802, -0.8059656, 0.8901961, 1, 0, 1,
-0.8756164, 0.365041, -2.109077, 0.8823529, 1, 0, 1,
-0.8752576, -0.3890389, -3.135094, 0.8784314, 1, 0, 1,
-0.870639, -1.466377, -2.724038, 0.8705882, 1, 0, 1,
-0.8678325, 0.1937851, -0.5468627, 0.8666667, 1, 0, 1,
-0.8662462, 0.6641619, -0.9696139, 0.8588235, 1, 0, 1,
-0.8655329, 0.8026357, -0.3214496, 0.854902, 1, 0, 1,
-0.8610963, 0.3119641, -3.616189, 0.8470588, 1, 0, 1,
-0.8579273, -1.979541, -1.384532, 0.8431373, 1, 0, 1,
-0.8548862, 1.563676, -0.173835, 0.8352941, 1, 0, 1,
-0.8501728, -1.166146, -2.81172, 0.8313726, 1, 0, 1,
-0.8497257, 0.05850114, -2.58556, 0.8235294, 1, 0, 1,
-0.8475464, 0.2796728, -0.5782787, 0.8196079, 1, 0, 1,
-0.8344799, 0.853047, -0.4454156, 0.8117647, 1, 0, 1,
-0.8253666, -0.7998452, -2.524223, 0.8078431, 1, 0, 1,
-0.824775, -0.0383616, -2.384416, 0.8, 1, 0, 1,
-0.823822, -2.426615, -3.297615, 0.7921569, 1, 0, 1,
-0.8229722, -0.06310777, -2.10274, 0.7882353, 1, 0, 1,
-0.8205386, -1.806262, -3.321465, 0.7803922, 1, 0, 1,
-0.8167476, -0.4335579, -3.238739, 0.7764706, 1, 0, 1,
-0.8155131, 0.56238, -0.5143438, 0.7686275, 1, 0, 1,
-0.8103506, 0.8499324, -3.279064, 0.7647059, 1, 0, 1,
-0.8063912, -0.5684315, -1.176985, 0.7568628, 1, 0, 1,
-0.7987232, 0.2174289, -0.05389423, 0.7529412, 1, 0, 1,
-0.7969592, 1.148204, -2.510517, 0.7450981, 1, 0, 1,
-0.7947908, 0.789519, -0.5805293, 0.7411765, 1, 0, 1,
-0.791004, -2.531294, -3.88062, 0.7333333, 1, 0, 1,
-0.787182, 0.5451736, -1.464735, 0.7294118, 1, 0, 1,
-0.7850369, -1.978083, -2.742222, 0.7215686, 1, 0, 1,
-0.7681605, -0.2685432, -2.241673, 0.7176471, 1, 0, 1,
-0.762152, 0.8165907, -0.7501816, 0.7098039, 1, 0, 1,
-0.7519946, 0.3046131, -0.9293641, 0.7058824, 1, 0, 1,
-0.7505974, 0.7011787, -1.730352, 0.6980392, 1, 0, 1,
-0.748183, 1.572381, -0.453034, 0.6901961, 1, 0, 1,
-0.7480188, -0.7246983, -2.71294, 0.6862745, 1, 0, 1,
-0.745901, -1.545085, -3.147262, 0.6784314, 1, 0, 1,
-0.7377198, -1.067784, -1.887687, 0.6745098, 1, 0, 1,
-0.7358184, -1.020329, -2.125352, 0.6666667, 1, 0, 1,
-0.733366, -0.337504, -4.384965, 0.6627451, 1, 0, 1,
-0.7317904, 1.427383, 0.4212112, 0.654902, 1, 0, 1,
-0.720349, 0.8413439, -0.6482844, 0.6509804, 1, 0, 1,
-0.7174638, -0.02543236, -1.280795, 0.6431373, 1, 0, 1,
-0.7157874, 0.7970911, -0.2657531, 0.6392157, 1, 0, 1,
-0.7132401, 0.2712986, -0.9670933, 0.6313726, 1, 0, 1,
-0.7126304, -0.0513381, -0.5880143, 0.627451, 1, 0, 1,
-0.7114669, -0.9171482, -5.795379, 0.6196079, 1, 0, 1,
-0.7110246, -0.9199574, -4.041586, 0.6156863, 1, 0, 1,
-0.7104224, -0.5907137, -1.68715, 0.6078432, 1, 0, 1,
-0.7070662, -0.6821294, -2.058445, 0.6039216, 1, 0, 1,
-0.7050767, -0.2270737, -2.065926, 0.5960785, 1, 0, 1,
-0.7038476, 0.9481254, -1.095414, 0.5882353, 1, 0, 1,
-0.6973959, 0.864577, -1.816229, 0.5843138, 1, 0, 1,
-0.6907852, -0.01966673, -3.069354, 0.5764706, 1, 0, 1,
-0.6897522, 2.212109, -0.9372045, 0.572549, 1, 0, 1,
-0.689751, 0.2130158, 1.005772, 0.5647059, 1, 0, 1,
-0.6706197, 0.2785963, 0.5860022, 0.5607843, 1, 0, 1,
-0.6701867, 0.9393234, -0.5189222, 0.5529412, 1, 0, 1,
-0.6621432, 0.2018182, -2.073865, 0.5490196, 1, 0, 1,
-0.6613569, -0.4883451, -1.616285, 0.5411765, 1, 0, 1,
-0.6567882, 2.412226, -1.174722, 0.5372549, 1, 0, 1,
-0.6500258, 0.8458272, -0.7347225, 0.5294118, 1, 0, 1,
-0.6480837, 0.1777803, -0.9879164, 0.5254902, 1, 0, 1,
-0.6420811, 1.620754, -1.255461, 0.5176471, 1, 0, 1,
-0.6398001, -0.4418312, -2.107143, 0.5137255, 1, 0, 1,
-0.6395431, -0.6855211, -3.094524, 0.5058824, 1, 0, 1,
-0.6393962, -2.753017, -3.715997, 0.5019608, 1, 0, 1,
-0.6388745, 0.1868223, 1.540491, 0.4941176, 1, 0, 1,
-0.6367136, -2.00722, -1.202333, 0.4862745, 1, 0, 1,
-0.6284567, -0.01153195, -1.382212, 0.4823529, 1, 0, 1,
-0.6261695, 1.408241, -1.123113, 0.4745098, 1, 0, 1,
-0.6212161, 0.3198407, -1.310289, 0.4705882, 1, 0, 1,
-0.6199724, 0.3616395, -2.222682, 0.4627451, 1, 0, 1,
-0.6177411, 1.162912, -0.5820186, 0.4588235, 1, 0, 1,
-0.6124552, 0.7450505, -0.304889, 0.4509804, 1, 0, 1,
-0.6116639, -0.05955217, -2.140471, 0.4470588, 1, 0, 1,
-0.6104172, -1.967388, -2.073617, 0.4392157, 1, 0, 1,
-0.6086817, -1.230332, -2.63383, 0.4352941, 1, 0, 1,
-0.6043874, 1.029466, 3.045987, 0.427451, 1, 0, 1,
-0.6035011, 0.7250797, -2.161978, 0.4235294, 1, 0, 1,
-0.6033323, 0.6658443, 1.789994, 0.4156863, 1, 0, 1,
-0.6008257, 1.87207, 1.083506, 0.4117647, 1, 0, 1,
-0.5978635, 0.4118966, -1.293315, 0.4039216, 1, 0, 1,
-0.5915254, -0.7143511, -2.970195, 0.3960784, 1, 0, 1,
-0.587136, 0.9215525, -0.1531997, 0.3921569, 1, 0, 1,
-0.5870846, 1.742482, 0.6706616, 0.3843137, 1, 0, 1,
-0.585218, -0.8323188, -3.098527, 0.3803922, 1, 0, 1,
-0.5707847, 0.8016073, -0.3581382, 0.372549, 1, 0, 1,
-0.5690852, -0.9067789, -1.551427, 0.3686275, 1, 0, 1,
-0.5646935, -1.738044, -3.975982, 0.3607843, 1, 0, 1,
-0.5621184, -0.1323505, -3.218052, 0.3568628, 1, 0, 1,
-0.559764, 0.07081501, -0.5492656, 0.3490196, 1, 0, 1,
-0.5576285, 0.930492, 0.1947764, 0.345098, 1, 0, 1,
-0.5562645, -0.06470923, -0.491831, 0.3372549, 1, 0, 1,
-0.5502155, 0.5875679, -0.9665287, 0.3333333, 1, 0, 1,
-0.5463752, -0.9512098, -3.849761, 0.3254902, 1, 0, 1,
-0.5456302, -0.2067332, -2.693833, 0.3215686, 1, 0, 1,
-0.5452739, 0.681579, -0.1738551, 0.3137255, 1, 0, 1,
-0.544707, -1.377033, -3.1601, 0.3098039, 1, 0, 1,
-0.5427054, -1.053555, -2.95927, 0.3019608, 1, 0, 1,
-0.5397716, 1.304483, 0.7226415, 0.2941177, 1, 0, 1,
-0.5351992, -0.7512874, -4.093634, 0.2901961, 1, 0, 1,
-0.5333157, -1.258383, -2.086318, 0.282353, 1, 0, 1,
-0.5288109, 0.1340685, -1.50333, 0.2784314, 1, 0, 1,
-0.5266597, 0.2075254, -0.8562112, 0.2705882, 1, 0, 1,
-0.5225914, 1.231371, -0.2706169, 0.2666667, 1, 0, 1,
-0.5190442, -0.1870067, -1.314882, 0.2588235, 1, 0, 1,
-0.5159272, -1.687281, -4.718481, 0.254902, 1, 0, 1,
-0.5050125, 0.8440365, -1.691435, 0.2470588, 1, 0, 1,
-0.496957, -1.272299, -2.418131, 0.2431373, 1, 0, 1,
-0.4936563, -1.158381, -1.871179, 0.2352941, 1, 0, 1,
-0.4917277, 2.164464, 0.9955229, 0.2313726, 1, 0, 1,
-0.4907723, -0.5619208, -1.565052, 0.2235294, 1, 0, 1,
-0.4900317, 0.8385717, -0.8118672, 0.2196078, 1, 0, 1,
-0.4899205, 0.3992018, -1.711988, 0.2117647, 1, 0, 1,
-0.4892641, -0.3316076, -2.059158, 0.2078431, 1, 0, 1,
-0.4889133, -0.9481691, -3.038506, 0.2, 1, 0, 1,
-0.4876681, -0.01644414, -4.999947, 0.1921569, 1, 0, 1,
-0.4872613, -0.1310857, -1.516997, 0.1882353, 1, 0, 1,
-0.4868609, 0.514631, -2.062872, 0.1803922, 1, 0, 1,
-0.4856986, 0.06007968, -0.6875901, 0.1764706, 1, 0, 1,
-0.4831463, 1.339641, -0.216363, 0.1686275, 1, 0, 1,
-0.4800633, -0.09175028, -2.374613, 0.1647059, 1, 0, 1,
-0.477814, -1.52935, -3.637723, 0.1568628, 1, 0, 1,
-0.4760848, -1.352101, -3.453774, 0.1529412, 1, 0, 1,
-0.4756245, -0.5614923, -2.245441, 0.145098, 1, 0, 1,
-0.4613642, -0.3885285, -3.126837, 0.1411765, 1, 0, 1,
-0.4604386, -1.189786, -2.991781, 0.1333333, 1, 0, 1,
-0.4577104, 0.9851275, 0.8438199, 0.1294118, 1, 0, 1,
-0.4541889, -0.9911241, -4.790206, 0.1215686, 1, 0, 1,
-0.4531929, 0.31052, -1.256967, 0.1176471, 1, 0, 1,
-0.4485402, -0.2431556, -4.468994, 0.1098039, 1, 0, 1,
-0.4483417, -1.199793, -2.374674, 0.1058824, 1, 0, 1,
-0.443155, -1.088045, -3.647295, 0.09803922, 1, 0, 1,
-0.4374483, -0.667199, -0.9538056, 0.09019608, 1, 0, 1,
-0.4372061, 0.1077198, -2.587534, 0.08627451, 1, 0, 1,
-0.4368925, 1.30908, 0.648802, 0.07843138, 1, 0, 1,
-0.4349942, 1.396588, -0.6519382, 0.07450981, 1, 0, 1,
-0.4316031, -0.9611833, -4.135336, 0.06666667, 1, 0, 1,
-0.4310178, -0.3460809, -1.494849, 0.0627451, 1, 0, 1,
-0.4306848, -0.5870912, -2.111619, 0.05490196, 1, 0, 1,
-0.4291378, 0.7615471, 0.2375562, 0.05098039, 1, 0, 1,
-0.4283229, -0.9112523, -2.197007, 0.04313726, 1, 0, 1,
-0.4257383, 0.2962748, -1.705415, 0.03921569, 1, 0, 1,
-0.4226515, -0.02377621, -0.8198006, 0.03137255, 1, 0, 1,
-0.4225331, 0.304285, -0.9053079, 0.02745098, 1, 0, 1,
-0.4197271, -0.6610274, -2.67349, 0.01960784, 1, 0, 1,
-0.4156026, 0.5046241, -1.202247, 0.01568628, 1, 0, 1,
-0.4105929, -0.6879678, -1.895898, 0.007843138, 1, 0, 1,
-0.4098881, -0.3022983, -0.9547735, 0.003921569, 1, 0, 1,
-0.4036023, -1.151817, -1.662954, 0, 1, 0.003921569, 1,
-0.3969296, -1.144419, -3.819385, 0, 1, 0.01176471, 1,
-0.3934529, 0.5240188, -2.152921, 0, 1, 0.01568628, 1,
-0.3873106, 0.8564093, 0.1223688, 0, 1, 0.02352941, 1,
-0.3846283, -0.906059, -1.418472, 0, 1, 0.02745098, 1,
-0.3815368, -0.2621624, -3.158949, 0, 1, 0.03529412, 1,
-0.3785219, 0.8704044, 1.073416, 0, 1, 0.03921569, 1,
-0.3773153, 0.2065764, -1.939661, 0, 1, 0.04705882, 1,
-0.3747064, -0.9492662, -1.991739, 0, 1, 0.05098039, 1,
-0.3716906, -0.6284881, -1.968111, 0, 1, 0.05882353, 1,
-0.370443, -1.664968, -1.558615, 0, 1, 0.0627451, 1,
-0.3681672, -1.170562, -3.625894, 0, 1, 0.07058824, 1,
-0.3657766, 1.363948, -0.4466488, 0, 1, 0.07450981, 1,
-0.3638581, 0.3640034, -2.318546, 0, 1, 0.08235294, 1,
-0.3633353, 0.2622493, 0.1221312, 0, 1, 0.08627451, 1,
-0.3568859, -0.3429546, -3.296596, 0, 1, 0.09411765, 1,
-0.3442127, 0.5598165, -1.44329, 0, 1, 0.1019608, 1,
-0.3425783, 0.5360507, -0.7351636, 0, 1, 0.1058824, 1,
-0.3423006, 0.4802631, -1.098488, 0, 1, 0.1137255, 1,
-0.3390262, 0.1238914, -0.7269269, 0, 1, 0.1176471, 1,
-0.3383479, -2.533018, -4.15143, 0, 1, 0.1254902, 1,
-0.3367995, -0.8013898, -1.660493, 0, 1, 0.1294118, 1,
-0.334277, -1.588877, -2.102281, 0, 1, 0.1372549, 1,
-0.329348, -1.82293, -2.431865, 0, 1, 0.1411765, 1,
-0.326965, 0.1880387, -3.342654, 0, 1, 0.1490196, 1,
-0.3246764, -0.2384861, -2.281207, 0, 1, 0.1529412, 1,
-0.3225748, 0.8184376, -0.4362003, 0, 1, 0.1607843, 1,
-0.3173347, -0.5423861, -2.277156, 0, 1, 0.1647059, 1,
-0.3162423, 0.4230607, 0.6674471, 0, 1, 0.172549, 1,
-0.3093833, 1.118221, -0.4269698, 0, 1, 0.1764706, 1,
-0.3038055, -1.622918, -2.857758, 0, 1, 0.1843137, 1,
-0.3024088, -1.61639, -3.611045, 0, 1, 0.1882353, 1,
-0.3005849, -0.2282252, -2.046481, 0, 1, 0.1960784, 1,
-0.2972242, -1.166989, -3.670164, 0, 1, 0.2039216, 1,
-0.2896492, -0.2519632, -0.7101071, 0, 1, 0.2078431, 1,
-0.2883919, -0.5867862, -2.818662, 0, 1, 0.2156863, 1,
-0.2877412, 0.5623839, -0.4004931, 0, 1, 0.2196078, 1,
-0.284504, 1.888803, -0.07509498, 0, 1, 0.227451, 1,
-0.2809393, -0.2388965, -1.34733, 0, 1, 0.2313726, 1,
-0.277623, -0.7697932, -3.178172, 0, 1, 0.2392157, 1,
-0.2776182, -0.3583609, -2.511053, 0, 1, 0.2431373, 1,
-0.2764671, -0.7505473, -2.329278, 0, 1, 0.2509804, 1,
-0.2758611, -0.4433524, -3.531699, 0, 1, 0.254902, 1,
-0.2722094, -0.114041, -0.6291895, 0, 1, 0.2627451, 1,
-0.2686225, 0.8713917, -0.08710361, 0, 1, 0.2666667, 1,
-0.2683955, -1.23285, -3.908222, 0, 1, 0.2745098, 1,
-0.2654792, -1.137166, -1.910783, 0, 1, 0.2784314, 1,
-0.2629592, -1.317779, -2.438619, 0, 1, 0.2862745, 1,
-0.2622999, 0.2660263, -0.7691172, 0, 1, 0.2901961, 1,
-0.2612847, 0.9241588, 0.3210587, 0, 1, 0.2980392, 1,
-0.2610359, -0.1984752, -2.460403, 0, 1, 0.3058824, 1,
-0.2592598, 2.025158, -0.3125508, 0, 1, 0.3098039, 1,
-0.2577652, -0.06702398, -0.8411374, 0, 1, 0.3176471, 1,
-0.2496853, 0.3125548, -0.1403046, 0, 1, 0.3215686, 1,
-0.2430964, -2.381536, -3.722193, 0, 1, 0.3294118, 1,
-0.2385458, 0.828903, -0.4270508, 0, 1, 0.3333333, 1,
-0.2365191, -0.5988042, -3.429535, 0, 1, 0.3411765, 1,
-0.2354272, 0.6283287, -0.6451185, 0, 1, 0.345098, 1,
-0.2327561, -1.278426, -2.764396, 0, 1, 0.3529412, 1,
-0.2302022, 0.850221, 1.227186, 0, 1, 0.3568628, 1,
-0.2300018, -0.7033084, -3.750352, 0, 1, 0.3647059, 1,
-0.2282159, 0.10271, -2.2967, 0, 1, 0.3686275, 1,
-0.2275062, 0.4941876, -1.329581, 0, 1, 0.3764706, 1,
-0.2267909, 2.543974, -0.2246587, 0, 1, 0.3803922, 1,
-0.2211829, -1.935118, -4.401999, 0, 1, 0.3882353, 1,
-0.2138948, 1.143869, -0.666587, 0, 1, 0.3921569, 1,
-0.2109171, -1.744479, -4.141476, 0, 1, 0.4, 1,
-0.2065019, 0.7600057, -0.2748595, 0, 1, 0.4078431, 1,
-0.2063771, -0.6937618, -4.220161, 0, 1, 0.4117647, 1,
-0.2054515, 0.9789839, 0.2389417, 0, 1, 0.4196078, 1,
-0.2023383, 1.732714, 1.830454, 0, 1, 0.4235294, 1,
-0.2016225, 0.5111923, -1.6137, 0, 1, 0.4313726, 1,
-0.2004757, 2.033761, -0.3155307, 0, 1, 0.4352941, 1,
-0.194957, -0.7727398, -3.064423, 0, 1, 0.4431373, 1,
-0.1912568, 0.9479082, 1.764974, 0, 1, 0.4470588, 1,
-0.1892981, -1.421928, -4.33796, 0, 1, 0.454902, 1,
-0.1834487, 0.0474718, -0.284558, 0, 1, 0.4588235, 1,
-0.1827871, 0.01846452, -0.3596563, 0, 1, 0.4666667, 1,
-0.1805256, 2.292725, 1.473207, 0, 1, 0.4705882, 1,
-0.1802486, -0.4301676, -3.150139, 0, 1, 0.4784314, 1,
-0.1795312, 0.9251353, 0.4904904, 0, 1, 0.4823529, 1,
-0.1773502, 0.9728259, 1.854829, 0, 1, 0.4901961, 1,
-0.1773145, 0.5254511, -1.013918, 0, 1, 0.4941176, 1,
-0.1706541, 0.1822255, -2.452935, 0, 1, 0.5019608, 1,
-0.1680942, 0.5478607, -0.5887995, 0, 1, 0.509804, 1,
-0.1680636, 0.228771, -0.5401791, 0, 1, 0.5137255, 1,
-0.1651936, 1.873446, 0.2123398, 0, 1, 0.5215687, 1,
-0.1647192, 0.05645948, -1.65002, 0, 1, 0.5254902, 1,
-0.1645441, 0.3642603, -1.530599, 0, 1, 0.5333334, 1,
-0.1617289, 0.02124572, -2.056133, 0, 1, 0.5372549, 1,
-0.1601349, 0.6250836, 0.1205764, 0, 1, 0.5450981, 1,
-0.1574616, 0.3713602, 0.2219927, 0, 1, 0.5490196, 1,
-0.1571301, -0.3345533, -3.09437, 0, 1, 0.5568628, 1,
-0.147046, -0.4051893, -2.395429, 0, 1, 0.5607843, 1,
-0.1463851, -0.1602035, -3.271976, 0, 1, 0.5686275, 1,
-0.145172, 0.04556286, 0.008159772, 0, 1, 0.572549, 1,
-0.1340695, -0.2564787, -3.765828, 0, 1, 0.5803922, 1,
-0.133299, 0.3590295, -0.3029532, 0, 1, 0.5843138, 1,
-0.1329392, 0.4267587, -2.75762, 0, 1, 0.5921569, 1,
-0.1299608, -1.088708, -3.237105, 0, 1, 0.5960785, 1,
-0.1285146, 0.8772426, -2.068398, 0, 1, 0.6039216, 1,
-0.1273814, 0.5670868, 0.8927262, 0, 1, 0.6117647, 1,
-0.1255811, 1.327088, -0.003157696, 0, 1, 0.6156863, 1,
-0.1168545, 0.1926263, -0.7959021, 0, 1, 0.6235294, 1,
-0.1159802, -0.6571252, -3.255103, 0, 1, 0.627451, 1,
-0.1137533, 0.3400282, -0.2209763, 0, 1, 0.6352941, 1,
-0.1120049, -2.050183, -4.031921, 0, 1, 0.6392157, 1,
-0.1094204, -1.430366, -2.325711, 0, 1, 0.6470588, 1,
-0.1078854, 1.716482, -0.03430646, 0, 1, 0.6509804, 1,
-0.107483, 0.6285138, -0.1996003, 0, 1, 0.6588235, 1,
-0.1047327, 0.6258274, 0.6956719, 0, 1, 0.6627451, 1,
-0.1014177, -0.3865979, -1.730133, 0, 1, 0.6705883, 1,
-0.09962692, 0.4298994, 0.7213945, 0, 1, 0.6745098, 1,
-0.09853954, -0.8127328, -1.911983, 0, 1, 0.682353, 1,
-0.0973533, 0.7673103, -0.6234, 0, 1, 0.6862745, 1,
-0.09451633, 0.03583985, -0.6245761, 0, 1, 0.6941177, 1,
-0.08774689, -0.1315207, -3.094386, 0, 1, 0.7019608, 1,
-0.08398516, -2.882194, -1.714197, 0, 1, 0.7058824, 1,
-0.0823213, -0.1835435, -2.2998, 0, 1, 0.7137255, 1,
-0.08094623, 0.3383433, -1.024235, 0, 1, 0.7176471, 1,
-0.07830306, 0.6877731, -0.322116, 0, 1, 0.7254902, 1,
-0.07702062, 0.4742979, -0.6408695, 0, 1, 0.7294118, 1,
-0.07404582, 1.007755, 1.867957, 0, 1, 0.7372549, 1,
-0.06957858, 0.6720229, -0.4765074, 0, 1, 0.7411765, 1,
-0.06749857, 0.178531, -1.66387, 0, 1, 0.7490196, 1,
-0.06739218, -0.1458322, -4.012722, 0, 1, 0.7529412, 1,
-0.06558514, -0.8158735, -1.222283, 0, 1, 0.7607843, 1,
-0.06516955, -0.7355629, -3.917826, 0, 1, 0.7647059, 1,
-0.06436775, -0.8348457, -2.137917, 0, 1, 0.772549, 1,
-0.06208029, -0.4559454, -4.302403, 0, 1, 0.7764706, 1,
-0.06191652, 0.4240125, -1.318793, 0, 1, 0.7843137, 1,
-0.06177257, 0.2685506, 0.1592434, 0, 1, 0.7882353, 1,
-0.06004923, -0.869275, -3.217283, 0, 1, 0.7960784, 1,
-0.0584044, -0.812842, -4.77586, 0, 1, 0.8039216, 1,
-0.05714261, 0.5199614, -0.8419774, 0, 1, 0.8078431, 1,
-0.05517888, 1.311704, 1.111529, 0, 1, 0.8156863, 1,
-0.05466389, -0.01240436, -0.6116274, 0, 1, 0.8196079, 1,
-0.04992048, -0.009929106, -1.86162, 0, 1, 0.827451, 1,
-0.04859208, 0.3689465, -1.99177, 0, 1, 0.8313726, 1,
-0.04668435, 0.5215995, 0.9461613, 0, 1, 0.8392157, 1,
-0.04659513, 0.1386911, 0.6950748, 0, 1, 0.8431373, 1,
-0.04638504, -2.336625, -3.090134, 0, 1, 0.8509804, 1,
-0.0423961, -1.0423, -2.555136, 0, 1, 0.854902, 1,
-0.04234472, -0.3518556, -4.539536, 0, 1, 0.8627451, 1,
-0.04060002, 0.6222272, 0.2358432, 0, 1, 0.8666667, 1,
-0.04056035, -0.07325259, -1.069699, 0, 1, 0.8745098, 1,
-0.04003896, 0.8818948, 0.6094446, 0, 1, 0.8784314, 1,
-0.03625255, 0.7607057, -0.717481, 0, 1, 0.8862745, 1,
-0.03503721, -0.6859586, -2.837217, 0, 1, 0.8901961, 1,
-0.02939833, 0.9075726, -2.449817, 0, 1, 0.8980392, 1,
-0.02568158, 0.6476262, -0.956398, 0, 1, 0.9058824, 1,
-0.02471162, 1.538194, -0.5523015, 0, 1, 0.9098039, 1,
-0.02291992, 1.22138, -1.289598, 0, 1, 0.9176471, 1,
-0.0222317, -0.06643988, -3.042293, 0, 1, 0.9215686, 1,
-0.01454189, -1.964484, -3.267858, 0, 1, 0.9294118, 1,
-0.009426584, -1.871893, -2.899264, 0, 1, 0.9333333, 1,
-0.005766989, -1.25563, -3.457003, 0, 1, 0.9411765, 1,
0.008331404, -0.37475, 3.209156, 0, 1, 0.945098, 1,
0.01221287, 0.5954073, -0.03478319, 0, 1, 0.9529412, 1,
0.01617899, -0.03584493, 1.785441, 0, 1, 0.9568627, 1,
0.01701858, -1.046978, 3.303679, 0, 1, 0.9647059, 1,
0.0196241, 0.275316, 1.222462, 0, 1, 0.9686275, 1,
0.02129898, -0.6210552, 1.297311, 0, 1, 0.9764706, 1,
0.02680072, -0.01453305, 2.986942, 0, 1, 0.9803922, 1,
0.03533686, 0.3846988, 1.027631, 0, 1, 0.9882353, 1,
0.03645886, -0.2144518, 3.746929, 0, 1, 0.9921569, 1,
0.03769114, -1.368045, 2.71995, 0, 1, 1, 1,
0.03854778, 0.3012251, -0.985688, 0, 0.9921569, 1, 1,
0.03856356, 0.2052097, -1.562637, 0, 0.9882353, 1, 1,
0.04017529, 1.255162, 0.3626416, 0, 0.9803922, 1, 1,
0.04450705, 0.4638445, 1.02411, 0, 0.9764706, 1, 1,
0.04573041, -0.5407842, 2.320982, 0, 0.9686275, 1, 1,
0.05168807, -1.020993, 2.134393, 0, 0.9647059, 1, 1,
0.05279528, 1.129972, -1.353559, 0, 0.9568627, 1, 1,
0.05309346, -1.323909, 1.909697, 0, 0.9529412, 1, 1,
0.06193729, 0.6502489, 0.4079132, 0, 0.945098, 1, 1,
0.06401654, -0.2333399, 3.983176, 0, 0.9411765, 1, 1,
0.06681071, 1.354963, 0.5910654, 0, 0.9333333, 1, 1,
0.0687193, 1.126905, 0.5093657, 0, 0.9294118, 1, 1,
0.07223529, 1.248834, -0.1133815, 0, 0.9215686, 1, 1,
0.07381133, 0.3774837, -0.4232829, 0, 0.9176471, 1, 1,
0.07939729, 2.321134, 1.724335, 0, 0.9098039, 1, 1,
0.08252398, -1.409715, 2.504718, 0, 0.9058824, 1, 1,
0.08509431, 0.2086079, 0.1000641, 0, 0.8980392, 1, 1,
0.08946717, -1.994157, 2.653118, 0, 0.8901961, 1, 1,
0.09117627, -1.264795, 4.328016, 0, 0.8862745, 1, 1,
0.09158733, 0.5807184, -0.0902515, 0, 0.8784314, 1, 1,
0.09800187, -1.310124, 2.173312, 0, 0.8745098, 1, 1,
0.1014998, -0.7297691, 3.085638, 0, 0.8666667, 1, 1,
0.1021093, 0.9288638, 1.191075, 0, 0.8627451, 1, 1,
0.105248, -0.04676457, 0.8774699, 0, 0.854902, 1, 1,
0.1086101, 2.160698, 1.633754, 0, 0.8509804, 1, 1,
0.1114564, 0.8748744, 0.9454944, 0, 0.8431373, 1, 1,
0.1117511, -1.168584, 4.210253, 0, 0.8392157, 1, 1,
0.1261454, 1.517617, -0.03786623, 0, 0.8313726, 1, 1,
0.127553, 0.4739114, -1.157563, 0, 0.827451, 1, 1,
0.1275931, -0.3181784, 2.793308, 0, 0.8196079, 1, 1,
0.1307335, 0.7119474, 2.111602, 0, 0.8156863, 1, 1,
0.1349974, 1.43793, -0.09542819, 0, 0.8078431, 1, 1,
0.1363719, 1.47101, 1.361249, 0, 0.8039216, 1, 1,
0.1395791, 1.935602, 0.4215894, 0, 0.7960784, 1, 1,
0.140556, -0.2081302, 0.2319621, 0, 0.7882353, 1, 1,
0.1444243, 0.6362469, 0.2401382, 0, 0.7843137, 1, 1,
0.1462082, 0.7898762, 1.330754, 0, 0.7764706, 1, 1,
0.147336, -1.316928, 4.000707, 0, 0.772549, 1, 1,
0.1504968, 0.6750814, 0.6955152, 0, 0.7647059, 1, 1,
0.1512447, -0.02511336, 1.349126, 0, 0.7607843, 1, 1,
0.1516536, -0.2725558, 4.686873, 0, 0.7529412, 1, 1,
0.1559805, -1.353224, 2.25587, 0, 0.7490196, 1, 1,
0.1569373, -0.5046326, 1.738491, 0, 0.7411765, 1, 1,
0.1570722, -0.1188591, 2.719527, 0, 0.7372549, 1, 1,
0.1642762, -0.02545894, 2.46722, 0, 0.7294118, 1, 1,
0.1667665, 0.1477768, 3.111388, 0, 0.7254902, 1, 1,
0.1692244, 1.426948, 1.420982, 0, 0.7176471, 1, 1,
0.1700865, -0.9090915, 2.329816, 0, 0.7137255, 1, 1,
0.1702077, 0.8906965, -0.6048126, 0, 0.7058824, 1, 1,
0.172888, -2.15717, 0.5294792, 0, 0.6980392, 1, 1,
0.1734562, -0.5300019, 2.717895, 0, 0.6941177, 1, 1,
0.1785482, 1.810384, -1.340809, 0, 0.6862745, 1, 1,
0.1853266, 0.1691514, 2.554176, 0, 0.682353, 1, 1,
0.1870752, 0.1539492, 0.4675998, 0, 0.6745098, 1, 1,
0.1950789, -0.02730935, 1.049482, 0, 0.6705883, 1, 1,
0.1953248, -0.5529441, 1.92904, 0, 0.6627451, 1, 1,
0.1979635, -0.5652859, 2.703783, 0, 0.6588235, 1, 1,
0.2011676, -0.78822, 1.805184, 0, 0.6509804, 1, 1,
0.2034419, 0.1631035, 0.3556974, 0, 0.6470588, 1, 1,
0.2038716, -0.2239363, 2.47108, 0, 0.6392157, 1, 1,
0.204312, -1.095834, 4.017933, 0, 0.6352941, 1, 1,
0.2106026, 1.548042, 0.1081804, 0, 0.627451, 1, 1,
0.2144893, -1.073928, 2.52808, 0, 0.6235294, 1, 1,
0.216948, -0.06092935, 1.242251, 0, 0.6156863, 1, 1,
0.2172491, -0.02734117, 1.719651, 0, 0.6117647, 1, 1,
0.2178159, -0.660754, 3.967896, 0, 0.6039216, 1, 1,
0.2240312, 0.9888909, 0.09890112, 0, 0.5960785, 1, 1,
0.2248699, 0.09823535, 0.5461187, 0, 0.5921569, 1, 1,
0.2253584, 0.7413428, -0.5764706, 0, 0.5843138, 1, 1,
0.2276003, -0.4784507, 2.820268, 0, 0.5803922, 1, 1,
0.2319955, -1.877576, 2.890342, 0, 0.572549, 1, 1,
0.2350348, 0.6758058, 0.9427139, 0, 0.5686275, 1, 1,
0.2355491, 1.124737, -1.332909, 0, 0.5607843, 1, 1,
0.2371972, -0.3901532, 2.735371, 0, 0.5568628, 1, 1,
0.2400327, 1.363765, 0.7342182, 0, 0.5490196, 1, 1,
0.2404332, 0.08128569, 1.14351, 0, 0.5450981, 1, 1,
0.2544107, -2.196246, 2.354831, 0, 0.5372549, 1, 1,
0.2613892, 0.2066781, 0.02149203, 0, 0.5333334, 1, 1,
0.2648181, 3.346109, 1.554311, 0, 0.5254902, 1, 1,
0.2661851, -0.4040967, 2.781308, 0, 0.5215687, 1, 1,
0.2671138, 3.024607, -1.422489, 0, 0.5137255, 1, 1,
0.2756607, -0.27742, 3.614752, 0, 0.509804, 1, 1,
0.277177, 0.9322916, 0.5606208, 0, 0.5019608, 1, 1,
0.2835142, -1.192552, 3.400392, 0, 0.4941176, 1, 1,
0.2861137, 1.559633, -0.4957156, 0, 0.4901961, 1, 1,
0.286297, -0.3933636, 3.431162, 0, 0.4823529, 1, 1,
0.2874196, -0.9413563, 3.39774, 0, 0.4784314, 1, 1,
0.2895288, -0.62762, 1.849577, 0, 0.4705882, 1, 1,
0.2900574, -0.4834762, 1.801296, 0, 0.4666667, 1, 1,
0.2909901, -0.95144, 3.108251, 0, 0.4588235, 1, 1,
0.2921909, -1.03165, 4.247403, 0, 0.454902, 1, 1,
0.292902, -0.6545789, 4.627273, 0, 0.4470588, 1, 1,
0.2944496, 0.7508155, 1.203576, 0, 0.4431373, 1, 1,
0.2949741, 0.7484536, -0.8082313, 0, 0.4352941, 1, 1,
0.2959922, -0.606888, 3.826649, 0, 0.4313726, 1, 1,
0.2975653, -0.5609974, 2.527278, 0, 0.4235294, 1, 1,
0.2979236, -1.458401, 2.895427, 0, 0.4196078, 1, 1,
0.2991454, 1.004611, 0.6876698, 0, 0.4117647, 1, 1,
0.2991972, 0.774568, 0.8112269, 0, 0.4078431, 1, 1,
0.3025908, -0.8394365, 1.823638, 0, 0.4, 1, 1,
0.3053897, 0.6442766, 0.7676179, 0, 0.3921569, 1, 1,
0.3057847, -1.16506, 4.450425, 0, 0.3882353, 1, 1,
0.3060667, -0.7029383, 2.588, 0, 0.3803922, 1, 1,
0.3085417, -0.7631441, 5.067037, 0, 0.3764706, 1, 1,
0.3133469, -1.388019, 1.037465, 0, 0.3686275, 1, 1,
0.3140067, 1.268476, 2.073765, 0, 0.3647059, 1, 1,
0.3144807, -0.8434024, 2.252773, 0, 0.3568628, 1, 1,
0.3154158, 0.6746352, -0.4799823, 0, 0.3529412, 1, 1,
0.3166108, 2.643624, 1.047513, 0, 0.345098, 1, 1,
0.3169246, -0.6434364, 4.436613, 0, 0.3411765, 1, 1,
0.3189026, 1.274277, 0.6862226, 0, 0.3333333, 1, 1,
0.322568, -0.2497523, 2.536683, 0, 0.3294118, 1, 1,
0.3226278, -1.807964, 3.732121, 0, 0.3215686, 1, 1,
0.3226565, 0.2643808, 1.32816, 0, 0.3176471, 1, 1,
0.3227647, 1.170695, 0.9513701, 0, 0.3098039, 1, 1,
0.3249316, 0.4437535, -0.5975229, 0, 0.3058824, 1, 1,
0.3252268, 2.033181, -0.2669941, 0, 0.2980392, 1, 1,
0.3263046, -0.5474747, 3.283767, 0, 0.2901961, 1, 1,
0.3306105, -1.761863, 2.147637, 0, 0.2862745, 1, 1,
0.3405715, 0.6109919, 1.218512, 0, 0.2784314, 1, 1,
0.3492754, -1.398018, 3.600573, 0, 0.2745098, 1, 1,
0.3532198, 0.2126719, 1.414772, 0, 0.2666667, 1, 1,
0.3552997, -0.5745171, 1.956328, 0, 0.2627451, 1, 1,
0.3610008, -1.678681, 2.030042, 0, 0.254902, 1, 1,
0.3625334, 0.02061344, 3.626104, 0, 0.2509804, 1, 1,
0.3682593, 0.1609522, 3.748643, 0, 0.2431373, 1, 1,
0.3683177, -0.5006673, 2.868948, 0, 0.2392157, 1, 1,
0.3687644, -1.3452, 3.968096, 0, 0.2313726, 1, 1,
0.3730807, 0.5707763, -2.126019, 0, 0.227451, 1, 1,
0.3768589, 0.2763771, 1.464834, 0, 0.2196078, 1, 1,
0.3771101, 1.278101, -0.4161183, 0, 0.2156863, 1, 1,
0.3787331, 1.90488, 0.9811368, 0, 0.2078431, 1, 1,
0.3795564, -0.576636, 2.660352, 0, 0.2039216, 1, 1,
0.3800049, -0.2127837, 2.141653, 0, 0.1960784, 1, 1,
0.3832701, -1.376725, 3.590456, 0, 0.1882353, 1, 1,
0.3849033, -0.5669047, 2.458325, 0, 0.1843137, 1, 1,
0.3900428, 0.9598551, 1.269717, 0, 0.1764706, 1, 1,
0.3900817, 0.7030783, 0.8192567, 0, 0.172549, 1, 1,
0.390894, 0.9425985, -0.08405642, 0, 0.1647059, 1, 1,
0.3926084, -1.640631, 3.252069, 0, 0.1607843, 1, 1,
0.396779, -0.91479, 1.422142, 0, 0.1529412, 1, 1,
0.4023511, 0.764755, 1.894344, 0, 0.1490196, 1, 1,
0.4027975, -0.3685944, 3.900087, 0, 0.1411765, 1, 1,
0.4042177, 0.8131664, 2.283571, 0, 0.1372549, 1, 1,
0.4048427, -0.6979787, 4.521188, 0, 0.1294118, 1, 1,
0.4074231, 0.1215227, 0.6044636, 0, 0.1254902, 1, 1,
0.4115996, -0.1192918, 1.530784, 0, 0.1176471, 1, 1,
0.4124712, 1.286099, 0.8915384, 0, 0.1137255, 1, 1,
0.4139326, 1.470558, 1.95182, 0, 0.1058824, 1, 1,
0.4182685, 0.4970281, 1.288994, 0, 0.09803922, 1, 1,
0.4188437, -0.4049729, 3.721659, 0, 0.09411765, 1, 1,
0.4201881, 0.5129552, 0.04627099, 0, 0.08627451, 1, 1,
0.4243146, 1.132576, -1.506445, 0, 0.08235294, 1, 1,
0.4261243, -0.02147056, 1.836687, 0, 0.07450981, 1, 1,
0.4279249, -0.1162384, 1.588728, 0, 0.07058824, 1, 1,
0.4283572, 0.8317052, 1.183259, 0, 0.0627451, 1, 1,
0.4306768, 2.21103, 1.151106, 0, 0.05882353, 1, 1,
0.4320622, 0.6230496, 1.718455, 0, 0.05098039, 1, 1,
0.4322143, -2.135971, 0.790386, 0, 0.04705882, 1, 1,
0.436375, -1.194676, 2.624652, 0, 0.03921569, 1, 1,
0.4371622, -2.743899, 3.310769, 0, 0.03529412, 1, 1,
0.4436567, -0.4674691, 4.163878, 0, 0.02745098, 1, 1,
0.4442376, -0.1498993, 2.31109, 0, 0.02352941, 1, 1,
0.4459886, -0.2497742, 3.890604, 0, 0.01568628, 1, 1,
0.4476492, -0.582909, 2.131915, 0, 0.01176471, 1, 1,
0.4516149, -1.421863, 2.714427, 0, 0.003921569, 1, 1,
0.4528777, -0.487302, 1.352343, 0.003921569, 0, 1, 1,
0.4633991, 0.5363896, 2.035588, 0.007843138, 0, 1, 1,
0.4657266, -0.7377322, 2.970236, 0.01568628, 0, 1, 1,
0.4666958, 1.408043, 1.655377, 0.01960784, 0, 1, 1,
0.4694331, 2.106672, 0.7002708, 0.02745098, 0, 1, 1,
0.4713353, 0.7068215, 1.668238, 0.03137255, 0, 1, 1,
0.4724682, -0.6879185, 2.327837, 0.03921569, 0, 1, 1,
0.4797776, -0.8608554, 2.13003, 0.04313726, 0, 1, 1,
0.4805972, 0.5768023, 0.2237655, 0.05098039, 0, 1, 1,
0.483317, 1.426916, -0.3373795, 0.05490196, 0, 1, 1,
0.4839876, -1.200244, 4.149838, 0.0627451, 0, 1, 1,
0.4904174, -0.6040379, 2.47123, 0.06666667, 0, 1, 1,
0.4945871, -0.08199051, 2.412812, 0.07450981, 0, 1, 1,
0.5140715, -0.2800965, 1.743098, 0.07843138, 0, 1, 1,
0.5142733, -1.006745, 1.626799, 0.08627451, 0, 1, 1,
0.5143946, 0.1928821, 1.76201, 0.09019608, 0, 1, 1,
0.5186369, 0.7486557, 2.31725, 0.09803922, 0, 1, 1,
0.5190252, -0.4522139, 2.910739, 0.1058824, 0, 1, 1,
0.526631, 1.778147, -1.172605, 0.1098039, 0, 1, 1,
0.5316157, 0.9523359, 1.112146, 0.1176471, 0, 1, 1,
0.5333201, -0.6316433, 1.518205, 0.1215686, 0, 1, 1,
0.5346158, -0.2049606, 1.372658, 0.1294118, 0, 1, 1,
0.5367669, -1.699997, 3.700668, 0.1333333, 0, 1, 1,
0.546645, -1.025746, 1.430689, 0.1411765, 0, 1, 1,
0.5485229, 0.5977436, -0.75269, 0.145098, 0, 1, 1,
0.5495745, 1.552394, -0.05927118, 0.1529412, 0, 1, 1,
0.5500139, -0.7276992, 3.48409, 0.1568628, 0, 1, 1,
0.5529737, 1.314786, -0.8034651, 0.1647059, 0, 1, 1,
0.5530649, 1.043283, 0.4218338, 0.1686275, 0, 1, 1,
0.5533381, -0.4218565, 2.268024, 0.1764706, 0, 1, 1,
0.5574068, 0.2592141, -0.6568452, 0.1803922, 0, 1, 1,
0.5646219, -0.1710839, 0.2575797, 0.1882353, 0, 1, 1,
0.5647742, -1.720268, 5.399346, 0.1921569, 0, 1, 1,
0.5668702, -1.303695, 0.7691669, 0.2, 0, 1, 1,
0.5677387, 1.556151, -0.3934081, 0.2078431, 0, 1, 1,
0.5788252, 0.179987, 1.094878, 0.2117647, 0, 1, 1,
0.5797929, -1.019143, 2.381694, 0.2196078, 0, 1, 1,
0.5803725, -0.2123604, 1.047887, 0.2235294, 0, 1, 1,
0.5808846, -0.09644805, 1.974659, 0.2313726, 0, 1, 1,
0.5816655, -0.6941607, 3.241339, 0.2352941, 0, 1, 1,
0.5856695, -1.354807, 3.147055, 0.2431373, 0, 1, 1,
0.5863493, 0.5275643, -2.053442, 0.2470588, 0, 1, 1,
0.5922865, -0.7849016, 3.825054, 0.254902, 0, 1, 1,
0.5935696, 1.526594, 0.7218873, 0.2588235, 0, 1, 1,
0.6008334, 0.9986202, 0.2355631, 0.2666667, 0, 1, 1,
0.6060184, -0.3449811, 1.548927, 0.2705882, 0, 1, 1,
0.6095494, 0.1084428, 2.377904, 0.2784314, 0, 1, 1,
0.6116348, -0.6489871, 2.214052, 0.282353, 0, 1, 1,
0.613995, -0.4647976, 1.657919, 0.2901961, 0, 1, 1,
0.6146252, -1.166957, 2.810393, 0.2941177, 0, 1, 1,
0.6324165, 1.044392, 0.9656394, 0.3019608, 0, 1, 1,
0.6331471, -1.53828, 3.08092, 0.3098039, 0, 1, 1,
0.6373988, 0.1688119, 3.463671, 0.3137255, 0, 1, 1,
0.6375195, -0.1332495, 2.568437, 0.3215686, 0, 1, 1,
0.6381727, 0.1890761, 1.813353, 0.3254902, 0, 1, 1,
0.6475584, 0.756052, 0.4305061, 0.3333333, 0, 1, 1,
0.6555569, -0.3039605, 3.097563, 0.3372549, 0, 1, 1,
0.6657044, -0.2503715, 2.254919, 0.345098, 0, 1, 1,
0.6686716, 2.126389, 0.1353559, 0.3490196, 0, 1, 1,
0.6760305, 0.3139963, 1.363738, 0.3568628, 0, 1, 1,
0.6821792, 0.321882, 0.8227282, 0.3607843, 0, 1, 1,
0.6882083, 0.2593324, 1.088316, 0.3686275, 0, 1, 1,
0.6891837, -0.5867413, 1.203813, 0.372549, 0, 1, 1,
0.6914361, 0.2093919, 2.04307, 0.3803922, 0, 1, 1,
0.7024835, 2.269614, -0.4142777, 0.3843137, 0, 1, 1,
0.7036675, 0.9774821, 0.9093391, 0.3921569, 0, 1, 1,
0.7090667, -1.393429, 3.302444, 0.3960784, 0, 1, 1,
0.7098998, 2.59281, 0.8234363, 0.4039216, 0, 1, 1,
0.7136794, -0.4770305, 0.7880973, 0.4117647, 0, 1, 1,
0.714905, -0.2186209, 3.012253, 0.4156863, 0, 1, 1,
0.7230039, -0.1665447, -0.08482385, 0.4235294, 0, 1, 1,
0.723473, -0.9085364, 2.100644, 0.427451, 0, 1, 1,
0.7314734, -0.01309787, 2.563828, 0.4352941, 0, 1, 1,
0.7315092, 0.8647846, 0.6335357, 0.4392157, 0, 1, 1,
0.735353, 0.5236228, 0.4558467, 0.4470588, 0, 1, 1,
0.7367789, 0.2102378, 2.842016, 0.4509804, 0, 1, 1,
0.7426346, -1.29159, 2.726668, 0.4588235, 0, 1, 1,
0.7437356, 0.07843196, 1.682309, 0.4627451, 0, 1, 1,
0.7482714, -0.5623611, 1.693275, 0.4705882, 0, 1, 1,
0.7508098, -0.888126, 2.819104, 0.4745098, 0, 1, 1,
0.7522063, 0.08643568, 0.9532723, 0.4823529, 0, 1, 1,
0.7527759, 1.517851, 0.5017896, 0.4862745, 0, 1, 1,
0.7543503, -0.4959102, 1.546538, 0.4941176, 0, 1, 1,
0.7581326, 1.236583, 2.292212, 0.5019608, 0, 1, 1,
0.7587731, 0.0629949, 0.05859334, 0.5058824, 0, 1, 1,
0.7621712, 0.4706485, 0.6184593, 0.5137255, 0, 1, 1,
0.7633026, 0.7165461, 1.32007, 0.5176471, 0, 1, 1,
0.7633731, 1.689838, 0.9512544, 0.5254902, 0, 1, 1,
0.7657561, 0.2328032, 0.5627718, 0.5294118, 0, 1, 1,
0.7660834, -0.8665712, 3.846575, 0.5372549, 0, 1, 1,
0.770267, -1.660113, 3.771889, 0.5411765, 0, 1, 1,
0.7705998, -0.6739703, 3.205336, 0.5490196, 0, 1, 1,
0.7743014, -0.1235473, 2.501808, 0.5529412, 0, 1, 1,
0.7764564, -0.0670968, 2.131322, 0.5607843, 0, 1, 1,
0.777832, 0.7646551, 1.661189, 0.5647059, 0, 1, 1,
0.7822689, 0.5046582, 0.2936282, 0.572549, 0, 1, 1,
0.7868544, 1.27817, -0.7308559, 0.5764706, 0, 1, 1,
0.7907689, 0.3755368, 1.308367, 0.5843138, 0, 1, 1,
0.7936962, 0.6177155, 0.232227, 0.5882353, 0, 1, 1,
0.7987428, 0.5275115, 2.521012, 0.5960785, 0, 1, 1,
0.7991304, -0.4540305, 2.172427, 0.6039216, 0, 1, 1,
0.801913, -0.7140662, 2.446461, 0.6078432, 0, 1, 1,
0.806443, -0.1354925, -0.5107531, 0.6156863, 0, 1, 1,
0.8105671, -2.596319, 4.038323, 0.6196079, 0, 1, 1,
0.8135325, -0.02990729, 0.8720651, 0.627451, 0, 1, 1,
0.8181072, 0.392891, -1.088749, 0.6313726, 0, 1, 1,
0.8216709, -1.42941, 2.190408, 0.6392157, 0, 1, 1,
0.82686, -1.073764, 2.470956, 0.6431373, 0, 1, 1,
0.828221, 0.1381763, 0.2454593, 0.6509804, 0, 1, 1,
0.8321744, 0.6193493, 1.66899, 0.654902, 0, 1, 1,
0.8385445, 1.617332, -1.03103, 0.6627451, 0, 1, 1,
0.8403134, -0.2350369, 2.228754, 0.6666667, 0, 1, 1,
0.841933, 0.4635159, 1.778689, 0.6745098, 0, 1, 1,
0.8431603, -1.181872, 1.949136, 0.6784314, 0, 1, 1,
0.8475515, -0.09408915, 3.145973, 0.6862745, 0, 1, 1,
0.8517382, -0.2293912, 1.83075, 0.6901961, 0, 1, 1,
0.8629954, 0.2680028, 1.702867, 0.6980392, 0, 1, 1,
0.8634989, -0.07314228, 2.655432, 0.7058824, 0, 1, 1,
0.8635997, 0.2574304, 1.165913, 0.7098039, 0, 1, 1,
0.8700098, 0.6715253, 1.880961, 0.7176471, 0, 1, 1,
0.8718492, -1.413339, 2.021938, 0.7215686, 0, 1, 1,
0.8734692, 0.7243072, 0.784602, 0.7294118, 0, 1, 1,
0.8740786, -0.2630192, 3.007774, 0.7333333, 0, 1, 1,
0.8781043, 0.03464427, 1.910055, 0.7411765, 0, 1, 1,
0.8807019, -2.965126, 3.262467, 0.7450981, 0, 1, 1,
0.8826739, -1.462369, 2.466365, 0.7529412, 0, 1, 1,
0.8851835, 0.8461208, 1.706619, 0.7568628, 0, 1, 1,
0.8852047, -0.2320997, 0.5586702, 0.7647059, 0, 1, 1,
0.8941848, 1.020974, -1.745739, 0.7686275, 0, 1, 1,
0.8943234, -0.8166923, 0.6505815, 0.7764706, 0, 1, 1,
0.8962205, -0.2402109, 1.593299, 0.7803922, 0, 1, 1,
0.89668, -0.2931959, 2.658167, 0.7882353, 0, 1, 1,
0.8976997, -0.5630759, 3.247075, 0.7921569, 0, 1, 1,
0.8997269, -0.1160623, 1.889898, 0.8, 0, 1, 1,
0.9066957, -0.0616899, 0.4936504, 0.8078431, 0, 1, 1,
0.9077058, -2.268446, 4.033193, 0.8117647, 0, 1, 1,
0.9170597, -0.5303817, 1.468535, 0.8196079, 0, 1, 1,
0.9342331, -0.914165, 2.540998, 0.8235294, 0, 1, 1,
0.9360262, -0.7177199, 2.385139, 0.8313726, 0, 1, 1,
0.9361579, 0.5779507, 2.353575, 0.8352941, 0, 1, 1,
0.938533, 0.9961258, 0.2190169, 0.8431373, 0, 1, 1,
0.939477, -0.2613037, 2.471526, 0.8470588, 0, 1, 1,
0.9407601, 0.1415362, 2.988662, 0.854902, 0, 1, 1,
0.9437137, -0.8565008, 2.410291, 0.8588235, 0, 1, 1,
0.9524866, -0.5843176, 1.923994, 0.8666667, 0, 1, 1,
0.9560516, 1.521722, 0.7353427, 0.8705882, 0, 1, 1,
0.9604659, -0.2948157, 0.8477989, 0.8784314, 0, 1, 1,
0.9617492, 0.3684814, 0.3458449, 0.8823529, 0, 1, 1,
0.9624634, -0.3232508, -0.2325157, 0.8901961, 0, 1, 1,
0.9664336, 0.0932486, 0.7286055, 0.8941177, 0, 1, 1,
0.9710571, 0.4002866, -0.4279676, 0.9019608, 0, 1, 1,
0.9716796, 0.9611226, 0.7199713, 0.9098039, 0, 1, 1,
0.9801158, -0.8897952, 3.387379, 0.9137255, 0, 1, 1,
0.9821013, 0.8164018, 1.252641, 0.9215686, 0, 1, 1,
0.9912992, -0.7079782, 1.271652, 0.9254902, 0, 1, 1,
0.9936087, -0.1573554, 3.111537, 0.9333333, 0, 1, 1,
0.9956002, -0.1426652, 2.160368, 0.9372549, 0, 1, 1,
0.9981458, -0.1399514, 0.8957931, 0.945098, 0, 1, 1,
1.000847, 1.471324, -0.9649202, 0.9490196, 0, 1, 1,
1.016916, 0.01092881, 1.769289, 0.9568627, 0, 1, 1,
1.021929, -0.687929, 3.508685, 0.9607843, 0, 1, 1,
1.032288, -1.097047, 1.668416, 0.9686275, 0, 1, 1,
1.034395, 0.280102, 1.51946, 0.972549, 0, 1, 1,
1.035094, 0.1847764, 1.869359, 0.9803922, 0, 1, 1,
1.040787, -0.9294322, 1.546638, 0.9843137, 0, 1, 1,
1.045504, -0.7122585, 2.772045, 0.9921569, 0, 1, 1,
1.049394, 2.141316, 0.8478707, 0.9960784, 0, 1, 1,
1.054715, -0.7191768, 1.791843, 1, 0, 0.9960784, 1,
1.057029, 0.06472986, 2.634253, 1, 0, 0.9882353, 1,
1.070131, 1.810074, 0.8953784, 1, 0, 0.9843137, 1,
1.072191, 1.813915, 0.3791151, 1, 0, 0.9764706, 1,
1.075747, -0.1343563, 1.739506, 1, 0, 0.972549, 1,
1.078159, -1.407803, 1.661595, 1, 0, 0.9647059, 1,
1.078213, -0.6477829, 1.7457, 1, 0, 0.9607843, 1,
1.080579, -0.3717974, 1.561484, 1, 0, 0.9529412, 1,
1.088604, 0.9249755, 1.608827, 1, 0, 0.9490196, 1,
1.088913, 0.291948, 1.033265, 1, 0, 0.9411765, 1,
1.091963, 0.4333588, 0.4049021, 1, 0, 0.9372549, 1,
1.094025, 0.3226616, 2.71873, 1, 0, 0.9294118, 1,
1.107671, -0.2814149, 0.3768431, 1, 0, 0.9254902, 1,
1.109075, -0.5850046, -0.3874753, 1, 0, 0.9176471, 1,
1.132579, 0.008295262, 1.582539, 1, 0, 0.9137255, 1,
1.133532, -0.8843434, 0.4972104, 1, 0, 0.9058824, 1,
1.135137, 0.7527721, 1.15725, 1, 0, 0.9019608, 1,
1.137858, -1.737592, 1.390395, 1, 0, 0.8941177, 1,
1.138412, 0.2138445, 0.3432104, 1, 0, 0.8862745, 1,
1.1408, -0.4337955, 3.394394, 1, 0, 0.8823529, 1,
1.145566, 0.8867887, 0.5269638, 1, 0, 0.8745098, 1,
1.145986, 0.8358207, 1.791671, 1, 0, 0.8705882, 1,
1.149914, 0.2853338, 1.232576, 1, 0, 0.8627451, 1,
1.154301, 1.088919, 0.9400199, 1, 0, 0.8588235, 1,
1.158229, 0.8644063, 2.026037, 1, 0, 0.8509804, 1,
1.161315, 0.6827778, 2.27037, 1, 0, 0.8470588, 1,
1.167138, -0.5302359, 3.213573, 1, 0, 0.8392157, 1,
1.170344, 1.350533, -0.05253903, 1, 0, 0.8352941, 1,
1.180641, -0.02187782, -0.009860829, 1, 0, 0.827451, 1,
1.184846, -0.6972466, 2.90164, 1, 0, 0.8235294, 1,
1.184917, -1.473649, 3.363713, 1, 0, 0.8156863, 1,
1.185155, -1.719519, 3.334124, 1, 0, 0.8117647, 1,
1.187149, -0.7690334, 3.835999, 1, 0, 0.8039216, 1,
1.190137, 0.4558838, 0.6921349, 1, 0, 0.7960784, 1,
1.201757, -0.5667638, 2.293025, 1, 0, 0.7921569, 1,
1.202087, 1.018346, 0.7322615, 1, 0, 0.7843137, 1,
1.208893, -0.2367241, 2.280059, 1, 0, 0.7803922, 1,
1.210045, -1.285001, 2.403152, 1, 0, 0.772549, 1,
1.218432, 0.7546572, -0.6188633, 1, 0, 0.7686275, 1,
1.225405, 1.47092, 0.8424711, 1, 0, 0.7607843, 1,
1.228216, -0.3162364, 3.017907, 1, 0, 0.7568628, 1,
1.228745, 0.7744675, 0.6698212, 1, 0, 0.7490196, 1,
1.231205, 0.1926637, 1.414273, 1, 0, 0.7450981, 1,
1.233062, -0.4772008, 0.2333924, 1, 0, 0.7372549, 1,
1.236407, -0.2876976, 1.480786, 1, 0, 0.7333333, 1,
1.23856, 0.1302121, 2.374332, 1, 0, 0.7254902, 1,
1.239769, -0.5240093, 4.023178, 1, 0, 0.7215686, 1,
1.243257, 0.2154884, 2.796133, 1, 0, 0.7137255, 1,
1.249478, 0.7746035, 1.324445, 1, 0, 0.7098039, 1,
1.25496, 0.4165071, 1.703177, 1, 0, 0.7019608, 1,
1.258931, 0.5899048, 0.5437195, 1, 0, 0.6941177, 1,
1.259995, -0.8493195, 2.126336, 1, 0, 0.6901961, 1,
1.260832, -0.8047367, 3.290276, 1, 0, 0.682353, 1,
1.265938, 0.1957098, 0.3854073, 1, 0, 0.6784314, 1,
1.276557, -0.7674658, 2.731694, 1, 0, 0.6705883, 1,
1.281917, -0.3003665, 2.364799, 1, 0, 0.6666667, 1,
1.283671, -1.403328, 1.730377, 1, 0, 0.6588235, 1,
1.285873, -1.520548, 1.320154, 1, 0, 0.654902, 1,
1.298818, -1.456729, 3.065363, 1, 0, 0.6470588, 1,
1.299171, 0.9902623, 2.822171, 1, 0, 0.6431373, 1,
1.305632, -1.542146, 3.370982, 1, 0, 0.6352941, 1,
1.309335, 0.1072613, 0.05238196, 1, 0, 0.6313726, 1,
1.309924, 0.9280121, 0.125125, 1, 0, 0.6235294, 1,
1.330547, -1.642423, 0.8214616, 1, 0, 0.6196079, 1,
1.333263, 1.025152, -0.7210982, 1, 0, 0.6117647, 1,
1.336062, 0.1056126, 2.516894, 1, 0, 0.6078432, 1,
1.344311, -1.008602, 2.892097, 1, 0, 0.6, 1,
1.349884, 0.7752751, 2.101405, 1, 0, 0.5921569, 1,
1.351761, -0.3083844, 0.9444745, 1, 0, 0.5882353, 1,
1.374419, 0.7769641, 0.822247, 1, 0, 0.5803922, 1,
1.396173, -1.417059, 3.84269, 1, 0, 0.5764706, 1,
1.398991, 0.02154727, 0.8401283, 1, 0, 0.5686275, 1,
1.400898, 0.3781453, 0.1793436, 1, 0, 0.5647059, 1,
1.410266, -0.9048218, 2.506969, 1, 0, 0.5568628, 1,
1.413215, 2.220778, 0.3819876, 1, 0, 0.5529412, 1,
1.426263, -1.114102, 2.689304, 1, 0, 0.5450981, 1,
1.427603, 0.6586477, 2.57661, 1, 0, 0.5411765, 1,
1.428443, -1.820085, 4.649639, 1, 0, 0.5333334, 1,
1.441441, 1.52214, -0.5196697, 1, 0, 0.5294118, 1,
1.448291, 0.5654071, 2.396205, 1, 0, 0.5215687, 1,
1.449481, -0.3394841, 1.729692, 1, 0, 0.5176471, 1,
1.449957, -0.1762079, 1.379406, 1, 0, 0.509804, 1,
1.455404, 0.2245499, 1.849988, 1, 0, 0.5058824, 1,
1.469242, 0.1097781, 0.8307392, 1, 0, 0.4980392, 1,
1.470689, 0.4723705, 0.9132086, 1, 0, 0.4901961, 1,
1.475065, -1.266402, 1.737466, 1, 0, 0.4862745, 1,
1.477114, -0.926915, 1.382318, 1, 0, 0.4784314, 1,
1.480551, -1.290027, 2.171381, 1, 0, 0.4745098, 1,
1.485877, 0.9758438, 1.24262, 1, 0, 0.4666667, 1,
1.486317, 1.931835, 1.942991, 1, 0, 0.4627451, 1,
1.489122, 0.5102288, 1.149244, 1, 0, 0.454902, 1,
1.494203, -0.8207212, 2.767889, 1, 0, 0.4509804, 1,
1.497936, 0.9742579, 1.487205, 1, 0, 0.4431373, 1,
1.50904, -0.1212583, 1.905154, 1, 0, 0.4392157, 1,
1.538564, 0.1490676, 1.52801, 1, 0, 0.4313726, 1,
1.550833, -0.01324488, 2.918306, 1, 0, 0.427451, 1,
1.563085, 1.990591, 2.069789, 1, 0, 0.4196078, 1,
1.565512, -0.1127801, 1.927969, 1, 0, 0.4156863, 1,
1.566057, -0.309027, 2.868683, 1, 0, 0.4078431, 1,
1.569942, 0.8923667, -0.8805214, 1, 0, 0.4039216, 1,
1.570939, 1.558369, 2.349304, 1, 0, 0.3960784, 1,
1.573409, 0.1616902, 1.141436, 1, 0, 0.3882353, 1,
1.582222, -0.6320623, 2.095853, 1, 0, 0.3843137, 1,
1.600601, -0.9215493, 2.26361, 1, 0, 0.3764706, 1,
1.614367, -0.4452673, 0.646226, 1, 0, 0.372549, 1,
1.616247, -0.368405, 3.579247, 1, 0, 0.3647059, 1,
1.633352, -2.09486, 1.899235, 1, 0, 0.3607843, 1,
1.646427, 0.47143, 2.743977, 1, 0, 0.3529412, 1,
1.649244, -0.1635709, 1.59694, 1, 0, 0.3490196, 1,
1.651688, -1.534761, 2.418271, 1, 0, 0.3411765, 1,
1.659606, -0.3478052, 3.409395, 1, 0, 0.3372549, 1,
1.6649, 0.3088742, 2.503891, 1, 0, 0.3294118, 1,
1.674653, -0.03821526, 3.345513, 1, 0, 0.3254902, 1,
1.684707, 0.1926107, 3.469548, 1, 0, 0.3176471, 1,
1.695934, -0.7837785, 2.074765, 1, 0, 0.3137255, 1,
1.697511, 1.006279, 1.042267, 1, 0, 0.3058824, 1,
1.700795, -0.5650454, 2.113438, 1, 0, 0.2980392, 1,
1.70231, 0.427299, 3.896951, 1, 0, 0.2941177, 1,
1.73001, -0.8128184, 4.297518, 1, 0, 0.2862745, 1,
1.73765, 0.6834677, 1.532184, 1, 0, 0.282353, 1,
1.73792, 0.2632114, -0.5043544, 1, 0, 0.2745098, 1,
1.75314, 0.4618176, 1.949753, 1, 0, 0.2705882, 1,
1.766334, -0.8809865, 1.035929, 1, 0, 0.2627451, 1,
1.772835, -0.5885462, 1.429314, 1, 0, 0.2588235, 1,
1.774552, -2.51642, 3.420385, 1, 0, 0.2509804, 1,
1.784577, -0.6931415, 2.670411, 1, 0, 0.2470588, 1,
1.803092, 0.381417, -0.3687333, 1, 0, 0.2392157, 1,
1.816096, -2.004266, 3.501025, 1, 0, 0.2352941, 1,
1.821903, 0.4233425, 1.092412, 1, 0, 0.227451, 1,
1.844202, -1.027935, 1.43175, 1, 0, 0.2235294, 1,
1.865305, -0.165136, 2.189282, 1, 0, 0.2156863, 1,
1.869042, -0.8704211, 3.188549, 1, 0, 0.2117647, 1,
1.883098, -1.146745, 0.9682523, 1, 0, 0.2039216, 1,
1.883161, 0.1984328, 0.9220196, 1, 0, 0.1960784, 1,
1.909604, 0.03581535, 1.557721, 1, 0, 0.1921569, 1,
1.923143, -0.8654339, 2.72024, 1, 0, 0.1843137, 1,
1.923423, 0.8062215, 1.642623, 1, 0, 0.1803922, 1,
1.959482, -0.7336559, 2.591496, 1, 0, 0.172549, 1,
1.977197, -0.9204015, 0.8510114, 1, 0, 0.1686275, 1,
1.986729, -2.516522, 5.045193, 1, 0, 0.1607843, 1,
2.005052, -1.231727, 0.7817963, 1, 0, 0.1568628, 1,
2.018526, 1.037699, 1.967331, 1, 0, 0.1490196, 1,
2.022874, -0.2687101, 1.490748, 1, 0, 0.145098, 1,
2.027831, 1.336664, 0.8518823, 1, 0, 0.1372549, 1,
2.046658, -0.8520373, 1.412316, 1, 0, 0.1333333, 1,
2.077691, -0.04797158, 1.00435, 1, 0, 0.1254902, 1,
2.084846, -1.782438, 0.8244676, 1, 0, 0.1215686, 1,
2.094083, 0.07052089, 1.051489, 1, 0, 0.1137255, 1,
2.109318, -0.1066203, 1.914142, 1, 0, 0.1098039, 1,
2.125576, -0.1772891, 2.028867, 1, 0, 0.1019608, 1,
2.138771, -1.891342, 2.741131, 1, 0, 0.09411765, 1,
2.154626, 0.7450091, 1.153702, 1, 0, 0.09019608, 1,
2.199806, -0.1950041, 1.198286, 1, 0, 0.08235294, 1,
2.208688, -0.7547591, 2.210261, 1, 0, 0.07843138, 1,
2.271232, 0.2922233, 1.083587, 1, 0, 0.07058824, 1,
2.321125, -1.342527, 1.467738, 1, 0, 0.06666667, 1,
2.32746, 0.03881527, 2.032612, 1, 0, 0.05882353, 1,
2.332589, -0.09918629, 2.542382, 1, 0, 0.05490196, 1,
2.358257, 1.109333, 2.385359, 1, 0, 0.04705882, 1,
2.416733, 1.230281, 0.2049147, 1, 0, 0.04313726, 1,
2.472454, 0.6127654, -1.170255, 1, 0, 0.03529412, 1,
2.477574, -0.1157916, 0.5827447, 1, 0, 0.03137255, 1,
2.635905, 0.5607798, 1.329128, 1, 0, 0.02352941, 1,
2.764405, -0.2971492, 2.068089, 1, 0, 0.01960784, 1,
2.867343, -0.896242, 3.205767, 1, 0, 0.01176471, 1,
3.283988, 0.8609176, 1.720206, 1, 0, 0.007843138, 1
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
0.2348565, -4.03488, -7.692885, 0, -0.5, 0.5, 0.5,
0.2348565, -4.03488, -7.692885, 1, -0.5, 0.5, 0.5,
0.2348565, -4.03488, -7.692885, 1, 1.5, 0.5, 0.5,
0.2348565, -4.03488, -7.692885, 0, 1.5, 0.5, 0.5
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
-3.84793, 0.1904918, -7.692885, 0, -0.5, 0.5, 0.5,
-3.84793, 0.1904918, -7.692885, 1, -0.5, 0.5, 0.5,
-3.84793, 0.1904918, -7.692885, 1, 1.5, 0.5, 0.5,
-3.84793, 0.1904918, -7.692885, 0, 1.5, 0.5, 0.5
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
-3.84793, -4.03488, -0.1980164, 0, -0.5, 0.5, 0.5,
-3.84793, -4.03488, -0.1980164, 1, -0.5, 0.5, 0.5,
-3.84793, -4.03488, -0.1980164, 1, 1.5, 0.5, 0.5,
-3.84793, -4.03488, -0.1980164, 0, 1.5, 0.5, 0.5
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
-2, -3.059794, -5.9633,
3, -3.059794, -5.9633,
-2, -3.059794, -5.9633,
-2, -3.222309, -6.251564,
-1, -3.059794, -5.9633,
-1, -3.222309, -6.251564,
0, -3.059794, -5.9633,
0, -3.222309, -6.251564,
1, -3.059794, -5.9633,
1, -3.222309, -6.251564,
2, -3.059794, -5.9633,
2, -3.222309, -6.251564,
3, -3.059794, -5.9633,
3, -3.222309, -6.251564
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
-2, -3.547337, -6.828093, 0, -0.5, 0.5, 0.5,
-2, -3.547337, -6.828093, 1, -0.5, 0.5, 0.5,
-2, -3.547337, -6.828093, 1, 1.5, 0.5, 0.5,
-2, -3.547337, -6.828093, 0, 1.5, 0.5, 0.5,
-1, -3.547337, -6.828093, 0, -0.5, 0.5, 0.5,
-1, -3.547337, -6.828093, 1, -0.5, 0.5, 0.5,
-1, -3.547337, -6.828093, 1, 1.5, 0.5, 0.5,
-1, -3.547337, -6.828093, 0, 1.5, 0.5, 0.5,
0, -3.547337, -6.828093, 0, -0.5, 0.5, 0.5,
0, -3.547337, -6.828093, 1, -0.5, 0.5, 0.5,
0, -3.547337, -6.828093, 1, 1.5, 0.5, 0.5,
0, -3.547337, -6.828093, 0, 1.5, 0.5, 0.5,
1, -3.547337, -6.828093, 0, -0.5, 0.5, 0.5,
1, -3.547337, -6.828093, 1, -0.5, 0.5, 0.5,
1, -3.547337, -6.828093, 1, 1.5, 0.5, 0.5,
1, -3.547337, -6.828093, 0, 1.5, 0.5, 0.5,
2, -3.547337, -6.828093, 0, -0.5, 0.5, 0.5,
2, -3.547337, -6.828093, 1, -0.5, 0.5, 0.5,
2, -3.547337, -6.828093, 1, 1.5, 0.5, 0.5,
2, -3.547337, -6.828093, 0, 1.5, 0.5, 0.5,
3, -3.547337, -6.828093, 0, -0.5, 0.5, 0.5,
3, -3.547337, -6.828093, 1, -0.5, 0.5, 0.5,
3, -3.547337, -6.828093, 1, 1.5, 0.5, 0.5,
3, -3.547337, -6.828093, 0, 1.5, 0.5, 0.5
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
-2.905748, -2, -5.9633,
-2.905748, 3, -5.9633,
-2.905748, -2, -5.9633,
-3.062779, -2, -6.251564,
-2.905748, -1, -5.9633,
-3.062779, -1, -6.251564,
-2.905748, 0, -5.9633,
-3.062779, 0, -6.251564,
-2.905748, 1, -5.9633,
-3.062779, 1, -6.251564,
-2.905748, 2, -5.9633,
-3.062779, 2, -6.251564,
-2.905748, 3, -5.9633,
-3.062779, 3, -6.251564
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
-3.376839, -2, -6.828093, 0, -0.5, 0.5, 0.5,
-3.376839, -2, -6.828093, 1, -0.5, 0.5, 0.5,
-3.376839, -2, -6.828093, 1, 1.5, 0.5, 0.5,
-3.376839, -2, -6.828093, 0, 1.5, 0.5, 0.5,
-3.376839, -1, -6.828093, 0, -0.5, 0.5, 0.5,
-3.376839, -1, -6.828093, 1, -0.5, 0.5, 0.5,
-3.376839, -1, -6.828093, 1, 1.5, 0.5, 0.5,
-3.376839, -1, -6.828093, 0, 1.5, 0.5, 0.5,
-3.376839, 0, -6.828093, 0, -0.5, 0.5, 0.5,
-3.376839, 0, -6.828093, 1, -0.5, 0.5, 0.5,
-3.376839, 0, -6.828093, 1, 1.5, 0.5, 0.5,
-3.376839, 0, -6.828093, 0, 1.5, 0.5, 0.5,
-3.376839, 1, -6.828093, 0, -0.5, 0.5, 0.5,
-3.376839, 1, -6.828093, 1, -0.5, 0.5, 0.5,
-3.376839, 1, -6.828093, 1, 1.5, 0.5, 0.5,
-3.376839, 1, -6.828093, 0, 1.5, 0.5, 0.5,
-3.376839, 2, -6.828093, 0, -0.5, 0.5, 0.5,
-3.376839, 2, -6.828093, 1, -0.5, 0.5, 0.5,
-3.376839, 2, -6.828093, 1, 1.5, 0.5, 0.5,
-3.376839, 2, -6.828093, 0, 1.5, 0.5, 0.5,
-3.376839, 3, -6.828093, 0, -0.5, 0.5, 0.5,
-3.376839, 3, -6.828093, 1, -0.5, 0.5, 0.5,
-3.376839, 3, -6.828093, 1, 1.5, 0.5, 0.5,
-3.376839, 3, -6.828093, 0, 1.5, 0.5, 0.5
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
-2.905748, -3.059794, -4,
-2.905748, -3.059794, 4,
-2.905748, -3.059794, -4,
-3.062779, -3.222309, -4,
-2.905748, -3.059794, -2,
-3.062779, -3.222309, -2,
-2.905748, -3.059794, 0,
-3.062779, -3.222309, 0,
-2.905748, -3.059794, 2,
-3.062779, -3.222309, 2,
-2.905748, -3.059794, 4,
-3.062779, -3.222309, 4
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
-3.376839, -3.547337, -4, 0, -0.5, 0.5, 0.5,
-3.376839, -3.547337, -4, 1, -0.5, 0.5, 0.5,
-3.376839, -3.547337, -4, 1, 1.5, 0.5, 0.5,
-3.376839, -3.547337, -4, 0, 1.5, 0.5, 0.5,
-3.376839, -3.547337, -2, 0, -0.5, 0.5, 0.5,
-3.376839, -3.547337, -2, 1, -0.5, 0.5, 0.5,
-3.376839, -3.547337, -2, 1, 1.5, 0.5, 0.5,
-3.376839, -3.547337, -2, 0, 1.5, 0.5, 0.5,
-3.376839, -3.547337, 0, 0, -0.5, 0.5, 0.5,
-3.376839, -3.547337, 0, 1, -0.5, 0.5, 0.5,
-3.376839, -3.547337, 0, 1, 1.5, 0.5, 0.5,
-3.376839, -3.547337, 0, 0, 1.5, 0.5, 0.5,
-3.376839, -3.547337, 2, 0, -0.5, 0.5, 0.5,
-3.376839, -3.547337, 2, 1, -0.5, 0.5, 0.5,
-3.376839, -3.547337, 2, 1, 1.5, 0.5, 0.5,
-3.376839, -3.547337, 2, 0, 1.5, 0.5, 0.5,
-3.376839, -3.547337, 4, 0, -0.5, 0.5, 0.5,
-3.376839, -3.547337, 4, 1, -0.5, 0.5, 0.5,
-3.376839, -3.547337, 4, 1, 1.5, 0.5, 0.5,
-3.376839, -3.547337, 4, 0, 1.5, 0.5, 0.5
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
-2.905748, -3.059794, -5.9633,
-2.905748, 3.440778, -5.9633,
-2.905748, -3.059794, 5.567267,
-2.905748, 3.440778, 5.567267,
-2.905748, -3.059794, -5.9633,
-2.905748, -3.059794, 5.567267,
-2.905748, 3.440778, -5.9633,
-2.905748, 3.440778, 5.567267,
-2.905748, -3.059794, -5.9633,
3.375461, -3.059794, -5.9633,
-2.905748, -3.059794, 5.567267,
3.375461, -3.059794, 5.567267,
-2.905748, 3.440778, -5.9633,
3.375461, 3.440778, -5.9633,
-2.905748, 3.440778, 5.567267,
3.375461, 3.440778, 5.567267,
3.375461, -3.059794, -5.9633,
3.375461, 3.440778, -5.9633,
3.375461, -3.059794, 5.567267,
3.375461, 3.440778, 5.567267,
3.375461, -3.059794, -5.9633,
3.375461, -3.059794, 5.567267,
3.375461, 3.440778, -5.9633,
3.375461, 3.440778, 5.567267
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
var radius = 7.82359;
var distance = 34.80804;
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
mvMatrix.translate( -0.2348565, -0.1904918, 0.1980164 );
mvMatrix.scale( 1.346718, 1.301273, 0.7336169 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.80804);
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
isoproturon<-read.table("isoproturon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isoproturon$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoproturon' not found
```

```r
y<-isoproturon$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoproturon' not found
```

```r
z<-isoproturon$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoproturon' not found
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
-2.814275, 0.1681155, -1.395131, 0, 0, 1, 1, 1,
-2.804134, 2.436057, -1.850527, 1, 0, 0, 1, 1,
-2.648591, -0.1651889, -1.951278, 1, 0, 0, 1, 1,
-2.499904, -0.6531898, -1.232737, 1, 0, 0, 1, 1,
-2.489493, -0.4014151, -2.027897, 1, 0, 0, 1, 1,
-2.387945, -0.1547932, -1.544146, 1, 0, 0, 1, 1,
-2.26725, 0.3155379, -4.244812, 0, 0, 0, 1, 1,
-2.246972, -0.8061358, -1.914505, 0, 0, 0, 1, 1,
-2.234141, -1.542166, -3.020181, 0, 0, 0, 1, 1,
-2.199208, 0.9222867, 0.5188127, 0, 0, 0, 1, 1,
-2.195549, 0.3807493, -0.778675, 0, 0, 0, 1, 1,
-2.19486, 1.13746, -1.572355, 0, 0, 0, 1, 1,
-2.190503, -0.5376245, -1.209991, 0, 0, 0, 1, 1,
-2.167952, 0.7183272, -1.579641, 1, 1, 1, 1, 1,
-2.166591, 1.138646, -0.140674, 1, 1, 1, 1, 1,
-2.165126, -0.367081, -0.1021257, 1, 1, 1, 1, 1,
-2.14332, 1.967595, -2.073024, 1, 1, 1, 1, 1,
-2.140718, 0.3802997, -3.14343, 1, 1, 1, 1, 1,
-2.137923, 0.4067634, -1.510252, 1, 1, 1, 1, 1,
-2.112576, -0.7407141, -2.032111, 1, 1, 1, 1, 1,
-2.10915, 0.2621225, -0.4079504, 1, 1, 1, 1, 1,
-2.08252, -1.353615, -1.977613, 1, 1, 1, 1, 1,
-2.080934, 0.1949494, -0.7484541, 1, 1, 1, 1, 1,
-2.079939, 0.4773136, -0.8335955, 1, 1, 1, 1, 1,
-2.015805, -0.7856076, -1.61256, 1, 1, 1, 1, 1,
-1.983279, 2.740874, -2.787377, 1, 1, 1, 1, 1,
-1.914918, 0.399545, -1.338729, 1, 1, 1, 1, 1,
-1.879705, 0.67246, -4.38945, 1, 1, 1, 1, 1,
-1.871615, -0.4058305, -3.086868, 0, 0, 1, 1, 1,
-1.85196, 1.352799, -0.4612135, 1, 0, 0, 1, 1,
-1.839267, -1.05738, -0.8779774, 1, 0, 0, 1, 1,
-1.83435, -0.4865223, -3.626189, 1, 0, 0, 1, 1,
-1.832887, 0.2512855, -0.8928428, 1, 0, 0, 1, 1,
-1.813976, -1.415783, -3.084537, 1, 0, 0, 1, 1,
-1.778012, 0.305088, -1.167022, 0, 0, 0, 1, 1,
-1.769503, -0.3244036, -2.627622, 0, 0, 0, 1, 1,
-1.7642, -0.130203, -1.457541, 0, 0, 0, 1, 1,
-1.762394, 1.595281, -0.7138337, 0, 0, 0, 1, 1,
-1.757069, -1.221147, -1.503297, 0, 0, 0, 1, 1,
-1.743641, 0.1072668, -1.518956, 0, 0, 0, 1, 1,
-1.737392, -0.4015206, -0.6630223, 0, 0, 0, 1, 1,
-1.734697, -1.191323, -3.201468, 1, 1, 1, 1, 1,
-1.72146, 0.8837826, -0.07151463, 1, 1, 1, 1, 1,
-1.708781, 0.1476245, 0.01310037, 1, 1, 1, 1, 1,
-1.705235, 0.6876361, -0.4360216, 1, 1, 1, 1, 1,
-1.684185, 0.8019985, -0.436528, 1, 1, 1, 1, 1,
-1.68106, 1.174121, -1.287784, 1, 1, 1, 1, 1,
-1.660864, 1.511206, -0.5127286, 1, 1, 1, 1, 1,
-1.657097, -0.003948172, -1.627347, 1, 1, 1, 1, 1,
-1.641098, -0.8473099, -1.264438, 1, 1, 1, 1, 1,
-1.630379, 0.4941429, -2.354908, 1, 1, 1, 1, 1,
-1.629441, 0.3663112, -1.480189, 1, 1, 1, 1, 1,
-1.606182, -0.4378754, -3.445122, 1, 1, 1, 1, 1,
-1.598606, 1.141629, -1.346542, 1, 1, 1, 1, 1,
-1.597694, -0.07759433, -2.681242, 1, 1, 1, 1, 1,
-1.585658, 1.679914, -1.040929, 1, 1, 1, 1, 1,
-1.582867, 0.02042759, -1.053009, 0, 0, 1, 1, 1,
-1.57977, 0.1872518, -1.820797, 1, 0, 0, 1, 1,
-1.572311, 1.402332, -1.221486, 1, 0, 0, 1, 1,
-1.571051, 0.05341894, -1.836224, 1, 0, 0, 1, 1,
-1.550025, -0.002227402, -1.223271, 1, 0, 0, 1, 1,
-1.54047, 1.088243, -0.3201798, 1, 0, 0, 1, 1,
-1.524129, -0.8954194, -3.525409, 0, 0, 0, 1, 1,
-1.522098, -0.3057321, -1.961666, 0, 0, 0, 1, 1,
-1.498452, -1.023203, -2.45317, 0, 0, 0, 1, 1,
-1.491558, -0.9097269, -2.009653, 0, 0, 0, 1, 1,
-1.484059, -0.7357523, -3.30014, 0, 0, 0, 1, 1,
-1.472925, -0.08643436, -1.160161, 0, 0, 0, 1, 1,
-1.468234, 1.290823, 0.3689295, 0, 0, 0, 1, 1,
-1.458183, 0.4716448, -1.277933, 1, 1, 1, 1, 1,
-1.439743, -0.3409064, -2.863295, 1, 1, 1, 1, 1,
-1.43674, 0.5839632, -1.657537, 1, 1, 1, 1, 1,
-1.429204, -0.317673, -2.59713, 1, 1, 1, 1, 1,
-1.428889, 0.6197369, -0.2154726, 1, 1, 1, 1, 1,
-1.420347, 1.190436, -0.07807305, 1, 1, 1, 1, 1,
-1.419876, -1.256505, -0.2751516, 1, 1, 1, 1, 1,
-1.417737, -1.427771, -0.5230874, 1, 1, 1, 1, 1,
-1.415733, -0.7294117, -2.40405, 1, 1, 1, 1, 1,
-1.381369, -1.596815, -2.821983, 1, 1, 1, 1, 1,
-1.378912, -0.2459284, -3.119609, 1, 1, 1, 1, 1,
-1.376058, 1.325872, -1.322988, 1, 1, 1, 1, 1,
-1.375114, -0.7268949, -1.964253, 1, 1, 1, 1, 1,
-1.362921, 2.313653, 1.186927, 1, 1, 1, 1, 1,
-1.359488, 0.3103219, -2.853122, 1, 1, 1, 1, 1,
-1.355477, -0.3841766, -3.080119, 0, 0, 1, 1, 1,
-1.348456, 1.691263, -1.503495, 1, 0, 0, 1, 1,
-1.335937, 0.3396792, -1.379979, 1, 0, 0, 1, 1,
-1.325571, -0.8068782, -1.253926, 1, 0, 0, 1, 1,
-1.321859, -0.9502885, -3.190114, 1, 0, 0, 1, 1,
-1.308115, -2.278612, -2.372192, 1, 0, 0, 1, 1,
-1.306401, -1.868102, -2.589145, 0, 0, 0, 1, 1,
-1.306389, -0.7785431, -0.835263, 0, 0, 0, 1, 1,
-1.293493, -0.2056252, -3.995573, 0, 0, 0, 1, 1,
-1.260838, 0.1533383, 0.5011274, 0, 0, 0, 1, 1,
-1.260144, 0.6057467, 0.5565108, 0, 0, 0, 1, 1,
-1.250283, 0.7815936, -0.1423005, 0, 0, 0, 1, 1,
-1.246679, -0.9377376, -1.142886, 0, 0, 0, 1, 1,
-1.232695, 0.3073815, -0.958933, 1, 1, 1, 1, 1,
-1.223427, -0.7306784, -1.483361, 1, 1, 1, 1, 1,
-1.221569, -0.5662237, -2.241145, 1, 1, 1, 1, 1,
-1.216229, 0.9101462, -1.498705, 1, 1, 1, 1, 1,
-1.216093, 0.1668187, -0.3893888, 1, 1, 1, 1, 1,
-1.215061, -0.870774, -2.946126, 1, 1, 1, 1, 1,
-1.213503, 0.2150125, -2.625819, 1, 1, 1, 1, 1,
-1.213029, -0.8369741, -2.119618, 1, 1, 1, 1, 1,
-1.209621, -0.1130953, -2.160968, 1, 1, 1, 1, 1,
-1.199968, -0.8361679, -1.812822, 1, 1, 1, 1, 1,
-1.197951, -0.3650323, -0.145084, 1, 1, 1, 1, 1,
-1.186691, -0.240546, -2.858932, 1, 1, 1, 1, 1,
-1.168548, 0.6057495, 0.2173871, 1, 1, 1, 1, 1,
-1.16507, 1.597319, -1.292798, 1, 1, 1, 1, 1,
-1.158591, 0.3156323, -1.163161, 1, 1, 1, 1, 1,
-1.153496, 0.682827, -2.261563, 0, 0, 1, 1, 1,
-1.148859, 0.5591162, -2.558301, 1, 0, 0, 1, 1,
-1.148612, 0.5722928, -1.253942, 1, 0, 0, 1, 1,
-1.145296, -0.4178559, -2.155482, 1, 0, 0, 1, 1,
-1.131325, 1.706019, -3.247759, 1, 0, 0, 1, 1,
-1.124197, 0.1118916, -1.639621, 1, 0, 0, 1, 1,
-1.118281, 0.02333415, -1.221754, 0, 0, 0, 1, 1,
-1.117977, 0.7499741, -0.0008024206, 0, 0, 0, 1, 1,
-1.107709, -0.7483926, -2.926548, 0, 0, 0, 1, 1,
-1.105546, 1.798836, -0.6168967, 0, 0, 0, 1, 1,
-1.101357, -1.285368, -2.652894, 0, 0, 0, 1, 1,
-1.098263, 0.3934081, -0.9446059, 0, 0, 0, 1, 1,
-1.098204, 0.6152508, -1.591202, 0, 0, 0, 1, 1,
-1.08256, -0.4654223, -1.284027, 1, 1, 1, 1, 1,
-1.08163, -0.3226976, -2.517677, 1, 1, 1, 1, 1,
-1.066459, 1.138302, -0.1544447, 1, 1, 1, 1, 1,
-1.066403, 1.112645, -2.767653, 1, 1, 1, 1, 1,
-1.058941, -1.670547, -2.30702, 1, 1, 1, 1, 1,
-1.051657, 0.8360975, 0.456259, 1, 1, 1, 1, 1,
-1.048969, 0.7353551, -0.5608664, 1, 1, 1, 1, 1,
-1.038271, 1.700155, -0.9350331, 1, 1, 1, 1, 1,
-1.036845, 1.295206, -0.9895657, 1, 1, 1, 1, 1,
-1.032361, 0.6250776, -1.155165, 1, 1, 1, 1, 1,
-1.027588, -2.016612, -2.588861, 1, 1, 1, 1, 1,
-1.02401, 0.2844652, -1.156212, 1, 1, 1, 1, 1,
-1.023718, 0.8866093, -1.304087, 1, 1, 1, 1, 1,
-1.021583, -0.1538833, -2.587614, 1, 1, 1, 1, 1,
-1.013377, -0.6766794, -2.510773, 1, 1, 1, 1, 1,
-1.009255, 0.3995287, -1.186424, 0, 0, 1, 1, 1,
-1.009213, 0.1167576, -0.5851431, 1, 0, 0, 1, 1,
-1.000775, 1.076512, 0.445362, 1, 0, 0, 1, 1,
-0.999719, 1.28755, -2.276023, 1, 0, 0, 1, 1,
-0.9946907, -0.8388823, -1.333715, 1, 0, 0, 1, 1,
-0.9937845, 0.7936924, -0.7857016, 1, 0, 0, 1, 1,
-0.9906563, -0.9300314, -1.76483, 0, 0, 0, 1, 1,
-0.9878187, 1.857635, 0.4993467, 0, 0, 0, 1, 1,
-0.9840184, 0.2036644, -0.3543878, 0, 0, 0, 1, 1,
-0.98276, -1.602153, -2.058347, 0, 0, 0, 1, 1,
-0.9812543, 0.7175028, -0.494207, 0, 0, 0, 1, 1,
-0.9811254, 0.5102201, -2.467813, 0, 0, 0, 1, 1,
-0.9781207, -0.2583162, -1.433133, 0, 0, 0, 1, 1,
-0.9673491, -1.200677, -2.482813, 1, 1, 1, 1, 1,
-0.9663308, 0.1053516, -0.9715582, 1, 1, 1, 1, 1,
-0.9628227, 0.5835726, -0.7648929, 1, 1, 1, 1, 1,
-0.9554497, -1.499094, -2.933508, 1, 1, 1, 1, 1,
-0.9527918, -0.7701832, -1.85575, 1, 1, 1, 1, 1,
-0.9515553, 0.607815, 0.311328, 1, 1, 1, 1, 1,
-0.9466263, 0.6052762, -1.05052, 1, 1, 1, 1, 1,
-0.9426308, 1.021926, -1.344723, 1, 1, 1, 1, 1,
-0.9400313, -0.08098937, -1.691916, 1, 1, 1, 1, 1,
-0.937463, 0.7078687, -2.006533, 1, 1, 1, 1, 1,
-0.9373455, -1.867386, -2.975802, 1, 1, 1, 1, 1,
-0.9352399, -1.890119, -4.669357, 1, 1, 1, 1, 1,
-0.9245347, -0.3985904, -0.5555393, 1, 1, 1, 1, 1,
-0.9244902, -0.2237367, -1.653463, 1, 1, 1, 1, 1,
-0.9244571, -0.242916, -3.111525, 1, 1, 1, 1, 1,
-0.9238596, -0.1398905, -1.498468, 0, 0, 1, 1, 1,
-0.9221823, -0.3756265, -2.529823, 1, 0, 0, 1, 1,
-0.9193798, -0.04595546, -0.859893, 1, 0, 0, 1, 1,
-0.914243, 0.297105, -2.451042, 1, 0, 0, 1, 1,
-0.9131346, -0.5076497, -1.632848, 1, 0, 0, 1, 1,
-0.9128885, -0.2706779, -1.578956, 1, 0, 0, 1, 1,
-0.9088008, 0.7428786, -0.5671668, 0, 0, 0, 1, 1,
-0.9069998, 0.7812173, -0.4743013, 0, 0, 0, 1, 1,
-0.8995398, -0.4715575, -0.6943368, 0, 0, 0, 1, 1,
-0.8988712, -0.9950989, -3.136781, 0, 0, 0, 1, 1,
-0.8941987, -0.1711785, -1.849748, 0, 0, 0, 1, 1,
-0.8920143, -2.711885, -3.431817, 0, 0, 0, 1, 1,
-0.8905684, 0.09341743, -0.1303613, 0, 0, 0, 1, 1,
-0.8862347, -1.979705, -3.225603, 1, 1, 1, 1, 1,
-0.8830008, 0.6912335, -0.342119, 1, 1, 1, 1, 1,
-0.8827983, 1.943774, 0.007144761, 1, 1, 1, 1, 1,
-0.8807155, 1.80429, -0.774349, 1, 1, 1, 1, 1,
-0.8757564, -0.3646802, -0.8059656, 1, 1, 1, 1, 1,
-0.8756164, 0.365041, -2.109077, 1, 1, 1, 1, 1,
-0.8752576, -0.3890389, -3.135094, 1, 1, 1, 1, 1,
-0.870639, -1.466377, -2.724038, 1, 1, 1, 1, 1,
-0.8678325, 0.1937851, -0.5468627, 1, 1, 1, 1, 1,
-0.8662462, 0.6641619, -0.9696139, 1, 1, 1, 1, 1,
-0.8655329, 0.8026357, -0.3214496, 1, 1, 1, 1, 1,
-0.8610963, 0.3119641, -3.616189, 1, 1, 1, 1, 1,
-0.8579273, -1.979541, -1.384532, 1, 1, 1, 1, 1,
-0.8548862, 1.563676, -0.173835, 1, 1, 1, 1, 1,
-0.8501728, -1.166146, -2.81172, 1, 1, 1, 1, 1,
-0.8497257, 0.05850114, -2.58556, 0, 0, 1, 1, 1,
-0.8475464, 0.2796728, -0.5782787, 1, 0, 0, 1, 1,
-0.8344799, 0.853047, -0.4454156, 1, 0, 0, 1, 1,
-0.8253666, -0.7998452, -2.524223, 1, 0, 0, 1, 1,
-0.824775, -0.0383616, -2.384416, 1, 0, 0, 1, 1,
-0.823822, -2.426615, -3.297615, 1, 0, 0, 1, 1,
-0.8229722, -0.06310777, -2.10274, 0, 0, 0, 1, 1,
-0.8205386, -1.806262, -3.321465, 0, 0, 0, 1, 1,
-0.8167476, -0.4335579, -3.238739, 0, 0, 0, 1, 1,
-0.8155131, 0.56238, -0.5143438, 0, 0, 0, 1, 1,
-0.8103506, 0.8499324, -3.279064, 0, 0, 0, 1, 1,
-0.8063912, -0.5684315, -1.176985, 0, 0, 0, 1, 1,
-0.7987232, 0.2174289, -0.05389423, 0, 0, 0, 1, 1,
-0.7969592, 1.148204, -2.510517, 1, 1, 1, 1, 1,
-0.7947908, 0.789519, -0.5805293, 1, 1, 1, 1, 1,
-0.791004, -2.531294, -3.88062, 1, 1, 1, 1, 1,
-0.787182, 0.5451736, -1.464735, 1, 1, 1, 1, 1,
-0.7850369, -1.978083, -2.742222, 1, 1, 1, 1, 1,
-0.7681605, -0.2685432, -2.241673, 1, 1, 1, 1, 1,
-0.762152, 0.8165907, -0.7501816, 1, 1, 1, 1, 1,
-0.7519946, 0.3046131, -0.9293641, 1, 1, 1, 1, 1,
-0.7505974, 0.7011787, -1.730352, 1, 1, 1, 1, 1,
-0.748183, 1.572381, -0.453034, 1, 1, 1, 1, 1,
-0.7480188, -0.7246983, -2.71294, 1, 1, 1, 1, 1,
-0.745901, -1.545085, -3.147262, 1, 1, 1, 1, 1,
-0.7377198, -1.067784, -1.887687, 1, 1, 1, 1, 1,
-0.7358184, -1.020329, -2.125352, 1, 1, 1, 1, 1,
-0.733366, -0.337504, -4.384965, 1, 1, 1, 1, 1,
-0.7317904, 1.427383, 0.4212112, 0, 0, 1, 1, 1,
-0.720349, 0.8413439, -0.6482844, 1, 0, 0, 1, 1,
-0.7174638, -0.02543236, -1.280795, 1, 0, 0, 1, 1,
-0.7157874, 0.7970911, -0.2657531, 1, 0, 0, 1, 1,
-0.7132401, 0.2712986, -0.9670933, 1, 0, 0, 1, 1,
-0.7126304, -0.0513381, -0.5880143, 1, 0, 0, 1, 1,
-0.7114669, -0.9171482, -5.795379, 0, 0, 0, 1, 1,
-0.7110246, -0.9199574, -4.041586, 0, 0, 0, 1, 1,
-0.7104224, -0.5907137, -1.68715, 0, 0, 0, 1, 1,
-0.7070662, -0.6821294, -2.058445, 0, 0, 0, 1, 1,
-0.7050767, -0.2270737, -2.065926, 0, 0, 0, 1, 1,
-0.7038476, 0.9481254, -1.095414, 0, 0, 0, 1, 1,
-0.6973959, 0.864577, -1.816229, 0, 0, 0, 1, 1,
-0.6907852, -0.01966673, -3.069354, 1, 1, 1, 1, 1,
-0.6897522, 2.212109, -0.9372045, 1, 1, 1, 1, 1,
-0.689751, 0.2130158, 1.005772, 1, 1, 1, 1, 1,
-0.6706197, 0.2785963, 0.5860022, 1, 1, 1, 1, 1,
-0.6701867, 0.9393234, -0.5189222, 1, 1, 1, 1, 1,
-0.6621432, 0.2018182, -2.073865, 1, 1, 1, 1, 1,
-0.6613569, -0.4883451, -1.616285, 1, 1, 1, 1, 1,
-0.6567882, 2.412226, -1.174722, 1, 1, 1, 1, 1,
-0.6500258, 0.8458272, -0.7347225, 1, 1, 1, 1, 1,
-0.6480837, 0.1777803, -0.9879164, 1, 1, 1, 1, 1,
-0.6420811, 1.620754, -1.255461, 1, 1, 1, 1, 1,
-0.6398001, -0.4418312, -2.107143, 1, 1, 1, 1, 1,
-0.6395431, -0.6855211, -3.094524, 1, 1, 1, 1, 1,
-0.6393962, -2.753017, -3.715997, 1, 1, 1, 1, 1,
-0.6388745, 0.1868223, 1.540491, 1, 1, 1, 1, 1,
-0.6367136, -2.00722, -1.202333, 0, 0, 1, 1, 1,
-0.6284567, -0.01153195, -1.382212, 1, 0, 0, 1, 1,
-0.6261695, 1.408241, -1.123113, 1, 0, 0, 1, 1,
-0.6212161, 0.3198407, -1.310289, 1, 0, 0, 1, 1,
-0.6199724, 0.3616395, -2.222682, 1, 0, 0, 1, 1,
-0.6177411, 1.162912, -0.5820186, 1, 0, 0, 1, 1,
-0.6124552, 0.7450505, -0.304889, 0, 0, 0, 1, 1,
-0.6116639, -0.05955217, -2.140471, 0, 0, 0, 1, 1,
-0.6104172, -1.967388, -2.073617, 0, 0, 0, 1, 1,
-0.6086817, -1.230332, -2.63383, 0, 0, 0, 1, 1,
-0.6043874, 1.029466, 3.045987, 0, 0, 0, 1, 1,
-0.6035011, 0.7250797, -2.161978, 0, 0, 0, 1, 1,
-0.6033323, 0.6658443, 1.789994, 0, 0, 0, 1, 1,
-0.6008257, 1.87207, 1.083506, 1, 1, 1, 1, 1,
-0.5978635, 0.4118966, -1.293315, 1, 1, 1, 1, 1,
-0.5915254, -0.7143511, -2.970195, 1, 1, 1, 1, 1,
-0.587136, 0.9215525, -0.1531997, 1, 1, 1, 1, 1,
-0.5870846, 1.742482, 0.6706616, 1, 1, 1, 1, 1,
-0.585218, -0.8323188, -3.098527, 1, 1, 1, 1, 1,
-0.5707847, 0.8016073, -0.3581382, 1, 1, 1, 1, 1,
-0.5690852, -0.9067789, -1.551427, 1, 1, 1, 1, 1,
-0.5646935, -1.738044, -3.975982, 1, 1, 1, 1, 1,
-0.5621184, -0.1323505, -3.218052, 1, 1, 1, 1, 1,
-0.559764, 0.07081501, -0.5492656, 1, 1, 1, 1, 1,
-0.5576285, 0.930492, 0.1947764, 1, 1, 1, 1, 1,
-0.5562645, -0.06470923, -0.491831, 1, 1, 1, 1, 1,
-0.5502155, 0.5875679, -0.9665287, 1, 1, 1, 1, 1,
-0.5463752, -0.9512098, -3.849761, 1, 1, 1, 1, 1,
-0.5456302, -0.2067332, -2.693833, 0, 0, 1, 1, 1,
-0.5452739, 0.681579, -0.1738551, 1, 0, 0, 1, 1,
-0.544707, -1.377033, -3.1601, 1, 0, 0, 1, 1,
-0.5427054, -1.053555, -2.95927, 1, 0, 0, 1, 1,
-0.5397716, 1.304483, 0.7226415, 1, 0, 0, 1, 1,
-0.5351992, -0.7512874, -4.093634, 1, 0, 0, 1, 1,
-0.5333157, -1.258383, -2.086318, 0, 0, 0, 1, 1,
-0.5288109, 0.1340685, -1.50333, 0, 0, 0, 1, 1,
-0.5266597, 0.2075254, -0.8562112, 0, 0, 0, 1, 1,
-0.5225914, 1.231371, -0.2706169, 0, 0, 0, 1, 1,
-0.5190442, -0.1870067, -1.314882, 0, 0, 0, 1, 1,
-0.5159272, -1.687281, -4.718481, 0, 0, 0, 1, 1,
-0.5050125, 0.8440365, -1.691435, 0, 0, 0, 1, 1,
-0.496957, -1.272299, -2.418131, 1, 1, 1, 1, 1,
-0.4936563, -1.158381, -1.871179, 1, 1, 1, 1, 1,
-0.4917277, 2.164464, 0.9955229, 1, 1, 1, 1, 1,
-0.4907723, -0.5619208, -1.565052, 1, 1, 1, 1, 1,
-0.4900317, 0.8385717, -0.8118672, 1, 1, 1, 1, 1,
-0.4899205, 0.3992018, -1.711988, 1, 1, 1, 1, 1,
-0.4892641, -0.3316076, -2.059158, 1, 1, 1, 1, 1,
-0.4889133, -0.9481691, -3.038506, 1, 1, 1, 1, 1,
-0.4876681, -0.01644414, -4.999947, 1, 1, 1, 1, 1,
-0.4872613, -0.1310857, -1.516997, 1, 1, 1, 1, 1,
-0.4868609, 0.514631, -2.062872, 1, 1, 1, 1, 1,
-0.4856986, 0.06007968, -0.6875901, 1, 1, 1, 1, 1,
-0.4831463, 1.339641, -0.216363, 1, 1, 1, 1, 1,
-0.4800633, -0.09175028, -2.374613, 1, 1, 1, 1, 1,
-0.477814, -1.52935, -3.637723, 1, 1, 1, 1, 1,
-0.4760848, -1.352101, -3.453774, 0, 0, 1, 1, 1,
-0.4756245, -0.5614923, -2.245441, 1, 0, 0, 1, 1,
-0.4613642, -0.3885285, -3.126837, 1, 0, 0, 1, 1,
-0.4604386, -1.189786, -2.991781, 1, 0, 0, 1, 1,
-0.4577104, 0.9851275, 0.8438199, 1, 0, 0, 1, 1,
-0.4541889, -0.9911241, -4.790206, 1, 0, 0, 1, 1,
-0.4531929, 0.31052, -1.256967, 0, 0, 0, 1, 1,
-0.4485402, -0.2431556, -4.468994, 0, 0, 0, 1, 1,
-0.4483417, -1.199793, -2.374674, 0, 0, 0, 1, 1,
-0.443155, -1.088045, -3.647295, 0, 0, 0, 1, 1,
-0.4374483, -0.667199, -0.9538056, 0, 0, 0, 1, 1,
-0.4372061, 0.1077198, -2.587534, 0, 0, 0, 1, 1,
-0.4368925, 1.30908, 0.648802, 0, 0, 0, 1, 1,
-0.4349942, 1.396588, -0.6519382, 1, 1, 1, 1, 1,
-0.4316031, -0.9611833, -4.135336, 1, 1, 1, 1, 1,
-0.4310178, -0.3460809, -1.494849, 1, 1, 1, 1, 1,
-0.4306848, -0.5870912, -2.111619, 1, 1, 1, 1, 1,
-0.4291378, 0.7615471, 0.2375562, 1, 1, 1, 1, 1,
-0.4283229, -0.9112523, -2.197007, 1, 1, 1, 1, 1,
-0.4257383, 0.2962748, -1.705415, 1, 1, 1, 1, 1,
-0.4226515, -0.02377621, -0.8198006, 1, 1, 1, 1, 1,
-0.4225331, 0.304285, -0.9053079, 1, 1, 1, 1, 1,
-0.4197271, -0.6610274, -2.67349, 1, 1, 1, 1, 1,
-0.4156026, 0.5046241, -1.202247, 1, 1, 1, 1, 1,
-0.4105929, -0.6879678, -1.895898, 1, 1, 1, 1, 1,
-0.4098881, -0.3022983, -0.9547735, 1, 1, 1, 1, 1,
-0.4036023, -1.151817, -1.662954, 1, 1, 1, 1, 1,
-0.3969296, -1.144419, -3.819385, 1, 1, 1, 1, 1,
-0.3934529, 0.5240188, -2.152921, 0, 0, 1, 1, 1,
-0.3873106, 0.8564093, 0.1223688, 1, 0, 0, 1, 1,
-0.3846283, -0.906059, -1.418472, 1, 0, 0, 1, 1,
-0.3815368, -0.2621624, -3.158949, 1, 0, 0, 1, 1,
-0.3785219, 0.8704044, 1.073416, 1, 0, 0, 1, 1,
-0.3773153, 0.2065764, -1.939661, 1, 0, 0, 1, 1,
-0.3747064, -0.9492662, -1.991739, 0, 0, 0, 1, 1,
-0.3716906, -0.6284881, -1.968111, 0, 0, 0, 1, 1,
-0.370443, -1.664968, -1.558615, 0, 0, 0, 1, 1,
-0.3681672, -1.170562, -3.625894, 0, 0, 0, 1, 1,
-0.3657766, 1.363948, -0.4466488, 0, 0, 0, 1, 1,
-0.3638581, 0.3640034, -2.318546, 0, 0, 0, 1, 1,
-0.3633353, 0.2622493, 0.1221312, 0, 0, 0, 1, 1,
-0.3568859, -0.3429546, -3.296596, 1, 1, 1, 1, 1,
-0.3442127, 0.5598165, -1.44329, 1, 1, 1, 1, 1,
-0.3425783, 0.5360507, -0.7351636, 1, 1, 1, 1, 1,
-0.3423006, 0.4802631, -1.098488, 1, 1, 1, 1, 1,
-0.3390262, 0.1238914, -0.7269269, 1, 1, 1, 1, 1,
-0.3383479, -2.533018, -4.15143, 1, 1, 1, 1, 1,
-0.3367995, -0.8013898, -1.660493, 1, 1, 1, 1, 1,
-0.334277, -1.588877, -2.102281, 1, 1, 1, 1, 1,
-0.329348, -1.82293, -2.431865, 1, 1, 1, 1, 1,
-0.326965, 0.1880387, -3.342654, 1, 1, 1, 1, 1,
-0.3246764, -0.2384861, -2.281207, 1, 1, 1, 1, 1,
-0.3225748, 0.8184376, -0.4362003, 1, 1, 1, 1, 1,
-0.3173347, -0.5423861, -2.277156, 1, 1, 1, 1, 1,
-0.3162423, 0.4230607, 0.6674471, 1, 1, 1, 1, 1,
-0.3093833, 1.118221, -0.4269698, 1, 1, 1, 1, 1,
-0.3038055, -1.622918, -2.857758, 0, 0, 1, 1, 1,
-0.3024088, -1.61639, -3.611045, 1, 0, 0, 1, 1,
-0.3005849, -0.2282252, -2.046481, 1, 0, 0, 1, 1,
-0.2972242, -1.166989, -3.670164, 1, 0, 0, 1, 1,
-0.2896492, -0.2519632, -0.7101071, 1, 0, 0, 1, 1,
-0.2883919, -0.5867862, -2.818662, 1, 0, 0, 1, 1,
-0.2877412, 0.5623839, -0.4004931, 0, 0, 0, 1, 1,
-0.284504, 1.888803, -0.07509498, 0, 0, 0, 1, 1,
-0.2809393, -0.2388965, -1.34733, 0, 0, 0, 1, 1,
-0.277623, -0.7697932, -3.178172, 0, 0, 0, 1, 1,
-0.2776182, -0.3583609, -2.511053, 0, 0, 0, 1, 1,
-0.2764671, -0.7505473, -2.329278, 0, 0, 0, 1, 1,
-0.2758611, -0.4433524, -3.531699, 0, 0, 0, 1, 1,
-0.2722094, -0.114041, -0.6291895, 1, 1, 1, 1, 1,
-0.2686225, 0.8713917, -0.08710361, 1, 1, 1, 1, 1,
-0.2683955, -1.23285, -3.908222, 1, 1, 1, 1, 1,
-0.2654792, -1.137166, -1.910783, 1, 1, 1, 1, 1,
-0.2629592, -1.317779, -2.438619, 1, 1, 1, 1, 1,
-0.2622999, 0.2660263, -0.7691172, 1, 1, 1, 1, 1,
-0.2612847, 0.9241588, 0.3210587, 1, 1, 1, 1, 1,
-0.2610359, -0.1984752, -2.460403, 1, 1, 1, 1, 1,
-0.2592598, 2.025158, -0.3125508, 1, 1, 1, 1, 1,
-0.2577652, -0.06702398, -0.8411374, 1, 1, 1, 1, 1,
-0.2496853, 0.3125548, -0.1403046, 1, 1, 1, 1, 1,
-0.2430964, -2.381536, -3.722193, 1, 1, 1, 1, 1,
-0.2385458, 0.828903, -0.4270508, 1, 1, 1, 1, 1,
-0.2365191, -0.5988042, -3.429535, 1, 1, 1, 1, 1,
-0.2354272, 0.6283287, -0.6451185, 1, 1, 1, 1, 1,
-0.2327561, -1.278426, -2.764396, 0, 0, 1, 1, 1,
-0.2302022, 0.850221, 1.227186, 1, 0, 0, 1, 1,
-0.2300018, -0.7033084, -3.750352, 1, 0, 0, 1, 1,
-0.2282159, 0.10271, -2.2967, 1, 0, 0, 1, 1,
-0.2275062, 0.4941876, -1.329581, 1, 0, 0, 1, 1,
-0.2267909, 2.543974, -0.2246587, 1, 0, 0, 1, 1,
-0.2211829, -1.935118, -4.401999, 0, 0, 0, 1, 1,
-0.2138948, 1.143869, -0.666587, 0, 0, 0, 1, 1,
-0.2109171, -1.744479, -4.141476, 0, 0, 0, 1, 1,
-0.2065019, 0.7600057, -0.2748595, 0, 0, 0, 1, 1,
-0.2063771, -0.6937618, -4.220161, 0, 0, 0, 1, 1,
-0.2054515, 0.9789839, 0.2389417, 0, 0, 0, 1, 1,
-0.2023383, 1.732714, 1.830454, 0, 0, 0, 1, 1,
-0.2016225, 0.5111923, -1.6137, 1, 1, 1, 1, 1,
-0.2004757, 2.033761, -0.3155307, 1, 1, 1, 1, 1,
-0.194957, -0.7727398, -3.064423, 1, 1, 1, 1, 1,
-0.1912568, 0.9479082, 1.764974, 1, 1, 1, 1, 1,
-0.1892981, -1.421928, -4.33796, 1, 1, 1, 1, 1,
-0.1834487, 0.0474718, -0.284558, 1, 1, 1, 1, 1,
-0.1827871, 0.01846452, -0.3596563, 1, 1, 1, 1, 1,
-0.1805256, 2.292725, 1.473207, 1, 1, 1, 1, 1,
-0.1802486, -0.4301676, -3.150139, 1, 1, 1, 1, 1,
-0.1795312, 0.9251353, 0.4904904, 1, 1, 1, 1, 1,
-0.1773502, 0.9728259, 1.854829, 1, 1, 1, 1, 1,
-0.1773145, 0.5254511, -1.013918, 1, 1, 1, 1, 1,
-0.1706541, 0.1822255, -2.452935, 1, 1, 1, 1, 1,
-0.1680942, 0.5478607, -0.5887995, 1, 1, 1, 1, 1,
-0.1680636, 0.228771, -0.5401791, 1, 1, 1, 1, 1,
-0.1651936, 1.873446, 0.2123398, 0, 0, 1, 1, 1,
-0.1647192, 0.05645948, -1.65002, 1, 0, 0, 1, 1,
-0.1645441, 0.3642603, -1.530599, 1, 0, 0, 1, 1,
-0.1617289, 0.02124572, -2.056133, 1, 0, 0, 1, 1,
-0.1601349, 0.6250836, 0.1205764, 1, 0, 0, 1, 1,
-0.1574616, 0.3713602, 0.2219927, 1, 0, 0, 1, 1,
-0.1571301, -0.3345533, -3.09437, 0, 0, 0, 1, 1,
-0.147046, -0.4051893, -2.395429, 0, 0, 0, 1, 1,
-0.1463851, -0.1602035, -3.271976, 0, 0, 0, 1, 1,
-0.145172, 0.04556286, 0.008159772, 0, 0, 0, 1, 1,
-0.1340695, -0.2564787, -3.765828, 0, 0, 0, 1, 1,
-0.133299, 0.3590295, -0.3029532, 0, 0, 0, 1, 1,
-0.1329392, 0.4267587, -2.75762, 0, 0, 0, 1, 1,
-0.1299608, -1.088708, -3.237105, 1, 1, 1, 1, 1,
-0.1285146, 0.8772426, -2.068398, 1, 1, 1, 1, 1,
-0.1273814, 0.5670868, 0.8927262, 1, 1, 1, 1, 1,
-0.1255811, 1.327088, -0.003157696, 1, 1, 1, 1, 1,
-0.1168545, 0.1926263, -0.7959021, 1, 1, 1, 1, 1,
-0.1159802, -0.6571252, -3.255103, 1, 1, 1, 1, 1,
-0.1137533, 0.3400282, -0.2209763, 1, 1, 1, 1, 1,
-0.1120049, -2.050183, -4.031921, 1, 1, 1, 1, 1,
-0.1094204, -1.430366, -2.325711, 1, 1, 1, 1, 1,
-0.1078854, 1.716482, -0.03430646, 1, 1, 1, 1, 1,
-0.107483, 0.6285138, -0.1996003, 1, 1, 1, 1, 1,
-0.1047327, 0.6258274, 0.6956719, 1, 1, 1, 1, 1,
-0.1014177, -0.3865979, -1.730133, 1, 1, 1, 1, 1,
-0.09962692, 0.4298994, 0.7213945, 1, 1, 1, 1, 1,
-0.09853954, -0.8127328, -1.911983, 1, 1, 1, 1, 1,
-0.0973533, 0.7673103, -0.6234, 0, 0, 1, 1, 1,
-0.09451633, 0.03583985, -0.6245761, 1, 0, 0, 1, 1,
-0.08774689, -0.1315207, -3.094386, 1, 0, 0, 1, 1,
-0.08398516, -2.882194, -1.714197, 1, 0, 0, 1, 1,
-0.0823213, -0.1835435, -2.2998, 1, 0, 0, 1, 1,
-0.08094623, 0.3383433, -1.024235, 1, 0, 0, 1, 1,
-0.07830306, 0.6877731, -0.322116, 0, 0, 0, 1, 1,
-0.07702062, 0.4742979, -0.6408695, 0, 0, 0, 1, 1,
-0.07404582, 1.007755, 1.867957, 0, 0, 0, 1, 1,
-0.06957858, 0.6720229, -0.4765074, 0, 0, 0, 1, 1,
-0.06749857, 0.178531, -1.66387, 0, 0, 0, 1, 1,
-0.06739218, -0.1458322, -4.012722, 0, 0, 0, 1, 1,
-0.06558514, -0.8158735, -1.222283, 0, 0, 0, 1, 1,
-0.06516955, -0.7355629, -3.917826, 1, 1, 1, 1, 1,
-0.06436775, -0.8348457, -2.137917, 1, 1, 1, 1, 1,
-0.06208029, -0.4559454, -4.302403, 1, 1, 1, 1, 1,
-0.06191652, 0.4240125, -1.318793, 1, 1, 1, 1, 1,
-0.06177257, 0.2685506, 0.1592434, 1, 1, 1, 1, 1,
-0.06004923, -0.869275, -3.217283, 1, 1, 1, 1, 1,
-0.0584044, -0.812842, -4.77586, 1, 1, 1, 1, 1,
-0.05714261, 0.5199614, -0.8419774, 1, 1, 1, 1, 1,
-0.05517888, 1.311704, 1.111529, 1, 1, 1, 1, 1,
-0.05466389, -0.01240436, -0.6116274, 1, 1, 1, 1, 1,
-0.04992048, -0.009929106, -1.86162, 1, 1, 1, 1, 1,
-0.04859208, 0.3689465, -1.99177, 1, 1, 1, 1, 1,
-0.04668435, 0.5215995, 0.9461613, 1, 1, 1, 1, 1,
-0.04659513, 0.1386911, 0.6950748, 1, 1, 1, 1, 1,
-0.04638504, -2.336625, -3.090134, 1, 1, 1, 1, 1,
-0.0423961, -1.0423, -2.555136, 0, 0, 1, 1, 1,
-0.04234472, -0.3518556, -4.539536, 1, 0, 0, 1, 1,
-0.04060002, 0.6222272, 0.2358432, 1, 0, 0, 1, 1,
-0.04056035, -0.07325259, -1.069699, 1, 0, 0, 1, 1,
-0.04003896, 0.8818948, 0.6094446, 1, 0, 0, 1, 1,
-0.03625255, 0.7607057, -0.717481, 1, 0, 0, 1, 1,
-0.03503721, -0.6859586, -2.837217, 0, 0, 0, 1, 1,
-0.02939833, 0.9075726, -2.449817, 0, 0, 0, 1, 1,
-0.02568158, 0.6476262, -0.956398, 0, 0, 0, 1, 1,
-0.02471162, 1.538194, -0.5523015, 0, 0, 0, 1, 1,
-0.02291992, 1.22138, -1.289598, 0, 0, 0, 1, 1,
-0.0222317, -0.06643988, -3.042293, 0, 0, 0, 1, 1,
-0.01454189, -1.964484, -3.267858, 0, 0, 0, 1, 1,
-0.009426584, -1.871893, -2.899264, 1, 1, 1, 1, 1,
-0.005766989, -1.25563, -3.457003, 1, 1, 1, 1, 1,
0.008331404, -0.37475, 3.209156, 1, 1, 1, 1, 1,
0.01221287, 0.5954073, -0.03478319, 1, 1, 1, 1, 1,
0.01617899, -0.03584493, 1.785441, 1, 1, 1, 1, 1,
0.01701858, -1.046978, 3.303679, 1, 1, 1, 1, 1,
0.0196241, 0.275316, 1.222462, 1, 1, 1, 1, 1,
0.02129898, -0.6210552, 1.297311, 1, 1, 1, 1, 1,
0.02680072, -0.01453305, 2.986942, 1, 1, 1, 1, 1,
0.03533686, 0.3846988, 1.027631, 1, 1, 1, 1, 1,
0.03645886, -0.2144518, 3.746929, 1, 1, 1, 1, 1,
0.03769114, -1.368045, 2.71995, 1, 1, 1, 1, 1,
0.03854778, 0.3012251, -0.985688, 1, 1, 1, 1, 1,
0.03856356, 0.2052097, -1.562637, 1, 1, 1, 1, 1,
0.04017529, 1.255162, 0.3626416, 1, 1, 1, 1, 1,
0.04450705, 0.4638445, 1.02411, 0, 0, 1, 1, 1,
0.04573041, -0.5407842, 2.320982, 1, 0, 0, 1, 1,
0.05168807, -1.020993, 2.134393, 1, 0, 0, 1, 1,
0.05279528, 1.129972, -1.353559, 1, 0, 0, 1, 1,
0.05309346, -1.323909, 1.909697, 1, 0, 0, 1, 1,
0.06193729, 0.6502489, 0.4079132, 1, 0, 0, 1, 1,
0.06401654, -0.2333399, 3.983176, 0, 0, 0, 1, 1,
0.06681071, 1.354963, 0.5910654, 0, 0, 0, 1, 1,
0.0687193, 1.126905, 0.5093657, 0, 0, 0, 1, 1,
0.07223529, 1.248834, -0.1133815, 0, 0, 0, 1, 1,
0.07381133, 0.3774837, -0.4232829, 0, 0, 0, 1, 1,
0.07939729, 2.321134, 1.724335, 0, 0, 0, 1, 1,
0.08252398, -1.409715, 2.504718, 0, 0, 0, 1, 1,
0.08509431, 0.2086079, 0.1000641, 1, 1, 1, 1, 1,
0.08946717, -1.994157, 2.653118, 1, 1, 1, 1, 1,
0.09117627, -1.264795, 4.328016, 1, 1, 1, 1, 1,
0.09158733, 0.5807184, -0.0902515, 1, 1, 1, 1, 1,
0.09800187, -1.310124, 2.173312, 1, 1, 1, 1, 1,
0.1014998, -0.7297691, 3.085638, 1, 1, 1, 1, 1,
0.1021093, 0.9288638, 1.191075, 1, 1, 1, 1, 1,
0.105248, -0.04676457, 0.8774699, 1, 1, 1, 1, 1,
0.1086101, 2.160698, 1.633754, 1, 1, 1, 1, 1,
0.1114564, 0.8748744, 0.9454944, 1, 1, 1, 1, 1,
0.1117511, -1.168584, 4.210253, 1, 1, 1, 1, 1,
0.1261454, 1.517617, -0.03786623, 1, 1, 1, 1, 1,
0.127553, 0.4739114, -1.157563, 1, 1, 1, 1, 1,
0.1275931, -0.3181784, 2.793308, 1, 1, 1, 1, 1,
0.1307335, 0.7119474, 2.111602, 1, 1, 1, 1, 1,
0.1349974, 1.43793, -0.09542819, 0, 0, 1, 1, 1,
0.1363719, 1.47101, 1.361249, 1, 0, 0, 1, 1,
0.1395791, 1.935602, 0.4215894, 1, 0, 0, 1, 1,
0.140556, -0.2081302, 0.2319621, 1, 0, 0, 1, 1,
0.1444243, 0.6362469, 0.2401382, 1, 0, 0, 1, 1,
0.1462082, 0.7898762, 1.330754, 1, 0, 0, 1, 1,
0.147336, -1.316928, 4.000707, 0, 0, 0, 1, 1,
0.1504968, 0.6750814, 0.6955152, 0, 0, 0, 1, 1,
0.1512447, -0.02511336, 1.349126, 0, 0, 0, 1, 1,
0.1516536, -0.2725558, 4.686873, 0, 0, 0, 1, 1,
0.1559805, -1.353224, 2.25587, 0, 0, 0, 1, 1,
0.1569373, -0.5046326, 1.738491, 0, 0, 0, 1, 1,
0.1570722, -0.1188591, 2.719527, 0, 0, 0, 1, 1,
0.1642762, -0.02545894, 2.46722, 1, 1, 1, 1, 1,
0.1667665, 0.1477768, 3.111388, 1, 1, 1, 1, 1,
0.1692244, 1.426948, 1.420982, 1, 1, 1, 1, 1,
0.1700865, -0.9090915, 2.329816, 1, 1, 1, 1, 1,
0.1702077, 0.8906965, -0.6048126, 1, 1, 1, 1, 1,
0.172888, -2.15717, 0.5294792, 1, 1, 1, 1, 1,
0.1734562, -0.5300019, 2.717895, 1, 1, 1, 1, 1,
0.1785482, 1.810384, -1.340809, 1, 1, 1, 1, 1,
0.1853266, 0.1691514, 2.554176, 1, 1, 1, 1, 1,
0.1870752, 0.1539492, 0.4675998, 1, 1, 1, 1, 1,
0.1950789, -0.02730935, 1.049482, 1, 1, 1, 1, 1,
0.1953248, -0.5529441, 1.92904, 1, 1, 1, 1, 1,
0.1979635, -0.5652859, 2.703783, 1, 1, 1, 1, 1,
0.2011676, -0.78822, 1.805184, 1, 1, 1, 1, 1,
0.2034419, 0.1631035, 0.3556974, 1, 1, 1, 1, 1,
0.2038716, -0.2239363, 2.47108, 0, 0, 1, 1, 1,
0.204312, -1.095834, 4.017933, 1, 0, 0, 1, 1,
0.2106026, 1.548042, 0.1081804, 1, 0, 0, 1, 1,
0.2144893, -1.073928, 2.52808, 1, 0, 0, 1, 1,
0.216948, -0.06092935, 1.242251, 1, 0, 0, 1, 1,
0.2172491, -0.02734117, 1.719651, 1, 0, 0, 1, 1,
0.2178159, -0.660754, 3.967896, 0, 0, 0, 1, 1,
0.2240312, 0.9888909, 0.09890112, 0, 0, 0, 1, 1,
0.2248699, 0.09823535, 0.5461187, 0, 0, 0, 1, 1,
0.2253584, 0.7413428, -0.5764706, 0, 0, 0, 1, 1,
0.2276003, -0.4784507, 2.820268, 0, 0, 0, 1, 1,
0.2319955, -1.877576, 2.890342, 0, 0, 0, 1, 1,
0.2350348, 0.6758058, 0.9427139, 0, 0, 0, 1, 1,
0.2355491, 1.124737, -1.332909, 1, 1, 1, 1, 1,
0.2371972, -0.3901532, 2.735371, 1, 1, 1, 1, 1,
0.2400327, 1.363765, 0.7342182, 1, 1, 1, 1, 1,
0.2404332, 0.08128569, 1.14351, 1, 1, 1, 1, 1,
0.2544107, -2.196246, 2.354831, 1, 1, 1, 1, 1,
0.2613892, 0.2066781, 0.02149203, 1, 1, 1, 1, 1,
0.2648181, 3.346109, 1.554311, 1, 1, 1, 1, 1,
0.2661851, -0.4040967, 2.781308, 1, 1, 1, 1, 1,
0.2671138, 3.024607, -1.422489, 1, 1, 1, 1, 1,
0.2756607, -0.27742, 3.614752, 1, 1, 1, 1, 1,
0.277177, 0.9322916, 0.5606208, 1, 1, 1, 1, 1,
0.2835142, -1.192552, 3.400392, 1, 1, 1, 1, 1,
0.2861137, 1.559633, -0.4957156, 1, 1, 1, 1, 1,
0.286297, -0.3933636, 3.431162, 1, 1, 1, 1, 1,
0.2874196, -0.9413563, 3.39774, 1, 1, 1, 1, 1,
0.2895288, -0.62762, 1.849577, 0, 0, 1, 1, 1,
0.2900574, -0.4834762, 1.801296, 1, 0, 0, 1, 1,
0.2909901, -0.95144, 3.108251, 1, 0, 0, 1, 1,
0.2921909, -1.03165, 4.247403, 1, 0, 0, 1, 1,
0.292902, -0.6545789, 4.627273, 1, 0, 0, 1, 1,
0.2944496, 0.7508155, 1.203576, 1, 0, 0, 1, 1,
0.2949741, 0.7484536, -0.8082313, 0, 0, 0, 1, 1,
0.2959922, -0.606888, 3.826649, 0, 0, 0, 1, 1,
0.2975653, -0.5609974, 2.527278, 0, 0, 0, 1, 1,
0.2979236, -1.458401, 2.895427, 0, 0, 0, 1, 1,
0.2991454, 1.004611, 0.6876698, 0, 0, 0, 1, 1,
0.2991972, 0.774568, 0.8112269, 0, 0, 0, 1, 1,
0.3025908, -0.8394365, 1.823638, 0, 0, 0, 1, 1,
0.3053897, 0.6442766, 0.7676179, 1, 1, 1, 1, 1,
0.3057847, -1.16506, 4.450425, 1, 1, 1, 1, 1,
0.3060667, -0.7029383, 2.588, 1, 1, 1, 1, 1,
0.3085417, -0.7631441, 5.067037, 1, 1, 1, 1, 1,
0.3133469, -1.388019, 1.037465, 1, 1, 1, 1, 1,
0.3140067, 1.268476, 2.073765, 1, 1, 1, 1, 1,
0.3144807, -0.8434024, 2.252773, 1, 1, 1, 1, 1,
0.3154158, 0.6746352, -0.4799823, 1, 1, 1, 1, 1,
0.3166108, 2.643624, 1.047513, 1, 1, 1, 1, 1,
0.3169246, -0.6434364, 4.436613, 1, 1, 1, 1, 1,
0.3189026, 1.274277, 0.6862226, 1, 1, 1, 1, 1,
0.322568, -0.2497523, 2.536683, 1, 1, 1, 1, 1,
0.3226278, -1.807964, 3.732121, 1, 1, 1, 1, 1,
0.3226565, 0.2643808, 1.32816, 1, 1, 1, 1, 1,
0.3227647, 1.170695, 0.9513701, 1, 1, 1, 1, 1,
0.3249316, 0.4437535, -0.5975229, 0, 0, 1, 1, 1,
0.3252268, 2.033181, -0.2669941, 1, 0, 0, 1, 1,
0.3263046, -0.5474747, 3.283767, 1, 0, 0, 1, 1,
0.3306105, -1.761863, 2.147637, 1, 0, 0, 1, 1,
0.3405715, 0.6109919, 1.218512, 1, 0, 0, 1, 1,
0.3492754, -1.398018, 3.600573, 1, 0, 0, 1, 1,
0.3532198, 0.2126719, 1.414772, 0, 0, 0, 1, 1,
0.3552997, -0.5745171, 1.956328, 0, 0, 0, 1, 1,
0.3610008, -1.678681, 2.030042, 0, 0, 0, 1, 1,
0.3625334, 0.02061344, 3.626104, 0, 0, 0, 1, 1,
0.3682593, 0.1609522, 3.748643, 0, 0, 0, 1, 1,
0.3683177, -0.5006673, 2.868948, 0, 0, 0, 1, 1,
0.3687644, -1.3452, 3.968096, 0, 0, 0, 1, 1,
0.3730807, 0.5707763, -2.126019, 1, 1, 1, 1, 1,
0.3768589, 0.2763771, 1.464834, 1, 1, 1, 1, 1,
0.3771101, 1.278101, -0.4161183, 1, 1, 1, 1, 1,
0.3787331, 1.90488, 0.9811368, 1, 1, 1, 1, 1,
0.3795564, -0.576636, 2.660352, 1, 1, 1, 1, 1,
0.3800049, -0.2127837, 2.141653, 1, 1, 1, 1, 1,
0.3832701, -1.376725, 3.590456, 1, 1, 1, 1, 1,
0.3849033, -0.5669047, 2.458325, 1, 1, 1, 1, 1,
0.3900428, 0.9598551, 1.269717, 1, 1, 1, 1, 1,
0.3900817, 0.7030783, 0.8192567, 1, 1, 1, 1, 1,
0.390894, 0.9425985, -0.08405642, 1, 1, 1, 1, 1,
0.3926084, -1.640631, 3.252069, 1, 1, 1, 1, 1,
0.396779, -0.91479, 1.422142, 1, 1, 1, 1, 1,
0.4023511, 0.764755, 1.894344, 1, 1, 1, 1, 1,
0.4027975, -0.3685944, 3.900087, 1, 1, 1, 1, 1,
0.4042177, 0.8131664, 2.283571, 0, 0, 1, 1, 1,
0.4048427, -0.6979787, 4.521188, 1, 0, 0, 1, 1,
0.4074231, 0.1215227, 0.6044636, 1, 0, 0, 1, 1,
0.4115996, -0.1192918, 1.530784, 1, 0, 0, 1, 1,
0.4124712, 1.286099, 0.8915384, 1, 0, 0, 1, 1,
0.4139326, 1.470558, 1.95182, 1, 0, 0, 1, 1,
0.4182685, 0.4970281, 1.288994, 0, 0, 0, 1, 1,
0.4188437, -0.4049729, 3.721659, 0, 0, 0, 1, 1,
0.4201881, 0.5129552, 0.04627099, 0, 0, 0, 1, 1,
0.4243146, 1.132576, -1.506445, 0, 0, 0, 1, 1,
0.4261243, -0.02147056, 1.836687, 0, 0, 0, 1, 1,
0.4279249, -0.1162384, 1.588728, 0, 0, 0, 1, 1,
0.4283572, 0.8317052, 1.183259, 0, 0, 0, 1, 1,
0.4306768, 2.21103, 1.151106, 1, 1, 1, 1, 1,
0.4320622, 0.6230496, 1.718455, 1, 1, 1, 1, 1,
0.4322143, -2.135971, 0.790386, 1, 1, 1, 1, 1,
0.436375, -1.194676, 2.624652, 1, 1, 1, 1, 1,
0.4371622, -2.743899, 3.310769, 1, 1, 1, 1, 1,
0.4436567, -0.4674691, 4.163878, 1, 1, 1, 1, 1,
0.4442376, -0.1498993, 2.31109, 1, 1, 1, 1, 1,
0.4459886, -0.2497742, 3.890604, 1, 1, 1, 1, 1,
0.4476492, -0.582909, 2.131915, 1, 1, 1, 1, 1,
0.4516149, -1.421863, 2.714427, 1, 1, 1, 1, 1,
0.4528777, -0.487302, 1.352343, 1, 1, 1, 1, 1,
0.4633991, 0.5363896, 2.035588, 1, 1, 1, 1, 1,
0.4657266, -0.7377322, 2.970236, 1, 1, 1, 1, 1,
0.4666958, 1.408043, 1.655377, 1, 1, 1, 1, 1,
0.4694331, 2.106672, 0.7002708, 1, 1, 1, 1, 1,
0.4713353, 0.7068215, 1.668238, 0, 0, 1, 1, 1,
0.4724682, -0.6879185, 2.327837, 1, 0, 0, 1, 1,
0.4797776, -0.8608554, 2.13003, 1, 0, 0, 1, 1,
0.4805972, 0.5768023, 0.2237655, 1, 0, 0, 1, 1,
0.483317, 1.426916, -0.3373795, 1, 0, 0, 1, 1,
0.4839876, -1.200244, 4.149838, 1, 0, 0, 1, 1,
0.4904174, -0.6040379, 2.47123, 0, 0, 0, 1, 1,
0.4945871, -0.08199051, 2.412812, 0, 0, 0, 1, 1,
0.5140715, -0.2800965, 1.743098, 0, 0, 0, 1, 1,
0.5142733, -1.006745, 1.626799, 0, 0, 0, 1, 1,
0.5143946, 0.1928821, 1.76201, 0, 0, 0, 1, 1,
0.5186369, 0.7486557, 2.31725, 0, 0, 0, 1, 1,
0.5190252, -0.4522139, 2.910739, 0, 0, 0, 1, 1,
0.526631, 1.778147, -1.172605, 1, 1, 1, 1, 1,
0.5316157, 0.9523359, 1.112146, 1, 1, 1, 1, 1,
0.5333201, -0.6316433, 1.518205, 1, 1, 1, 1, 1,
0.5346158, -0.2049606, 1.372658, 1, 1, 1, 1, 1,
0.5367669, -1.699997, 3.700668, 1, 1, 1, 1, 1,
0.546645, -1.025746, 1.430689, 1, 1, 1, 1, 1,
0.5485229, 0.5977436, -0.75269, 1, 1, 1, 1, 1,
0.5495745, 1.552394, -0.05927118, 1, 1, 1, 1, 1,
0.5500139, -0.7276992, 3.48409, 1, 1, 1, 1, 1,
0.5529737, 1.314786, -0.8034651, 1, 1, 1, 1, 1,
0.5530649, 1.043283, 0.4218338, 1, 1, 1, 1, 1,
0.5533381, -0.4218565, 2.268024, 1, 1, 1, 1, 1,
0.5574068, 0.2592141, -0.6568452, 1, 1, 1, 1, 1,
0.5646219, -0.1710839, 0.2575797, 1, 1, 1, 1, 1,
0.5647742, -1.720268, 5.399346, 1, 1, 1, 1, 1,
0.5668702, -1.303695, 0.7691669, 0, 0, 1, 1, 1,
0.5677387, 1.556151, -0.3934081, 1, 0, 0, 1, 1,
0.5788252, 0.179987, 1.094878, 1, 0, 0, 1, 1,
0.5797929, -1.019143, 2.381694, 1, 0, 0, 1, 1,
0.5803725, -0.2123604, 1.047887, 1, 0, 0, 1, 1,
0.5808846, -0.09644805, 1.974659, 1, 0, 0, 1, 1,
0.5816655, -0.6941607, 3.241339, 0, 0, 0, 1, 1,
0.5856695, -1.354807, 3.147055, 0, 0, 0, 1, 1,
0.5863493, 0.5275643, -2.053442, 0, 0, 0, 1, 1,
0.5922865, -0.7849016, 3.825054, 0, 0, 0, 1, 1,
0.5935696, 1.526594, 0.7218873, 0, 0, 0, 1, 1,
0.6008334, 0.9986202, 0.2355631, 0, 0, 0, 1, 1,
0.6060184, -0.3449811, 1.548927, 0, 0, 0, 1, 1,
0.6095494, 0.1084428, 2.377904, 1, 1, 1, 1, 1,
0.6116348, -0.6489871, 2.214052, 1, 1, 1, 1, 1,
0.613995, -0.4647976, 1.657919, 1, 1, 1, 1, 1,
0.6146252, -1.166957, 2.810393, 1, 1, 1, 1, 1,
0.6324165, 1.044392, 0.9656394, 1, 1, 1, 1, 1,
0.6331471, -1.53828, 3.08092, 1, 1, 1, 1, 1,
0.6373988, 0.1688119, 3.463671, 1, 1, 1, 1, 1,
0.6375195, -0.1332495, 2.568437, 1, 1, 1, 1, 1,
0.6381727, 0.1890761, 1.813353, 1, 1, 1, 1, 1,
0.6475584, 0.756052, 0.4305061, 1, 1, 1, 1, 1,
0.6555569, -0.3039605, 3.097563, 1, 1, 1, 1, 1,
0.6657044, -0.2503715, 2.254919, 1, 1, 1, 1, 1,
0.6686716, 2.126389, 0.1353559, 1, 1, 1, 1, 1,
0.6760305, 0.3139963, 1.363738, 1, 1, 1, 1, 1,
0.6821792, 0.321882, 0.8227282, 1, 1, 1, 1, 1,
0.6882083, 0.2593324, 1.088316, 0, 0, 1, 1, 1,
0.6891837, -0.5867413, 1.203813, 1, 0, 0, 1, 1,
0.6914361, 0.2093919, 2.04307, 1, 0, 0, 1, 1,
0.7024835, 2.269614, -0.4142777, 1, 0, 0, 1, 1,
0.7036675, 0.9774821, 0.9093391, 1, 0, 0, 1, 1,
0.7090667, -1.393429, 3.302444, 1, 0, 0, 1, 1,
0.7098998, 2.59281, 0.8234363, 0, 0, 0, 1, 1,
0.7136794, -0.4770305, 0.7880973, 0, 0, 0, 1, 1,
0.714905, -0.2186209, 3.012253, 0, 0, 0, 1, 1,
0.7230039, -0.1665447, -0.08482385, 0, 0, 0, 1, 1,
0.723473, -0.9085364, 2.100644, 0, 0, 0, 1, 1,
0.7314734, -0.01309787, 2.563828, 0, 0, 0, 1, 1,
0.7315092, 0.8647846, 0.6335357, 0, 0, 0, 1, 1,
0.735353, 0.5236228, 0.4558467, 1, 1, 1, 1, 1,
0.7367789, 0.2102378, 2.842016, 1, 1, 1, 1, 1,
0.7426346, -1.29159, 2.726668, 1, 1, 1, 1, 1,
0.7437356, 0.07843196, 1.682309, 1, 1, 1, 1, 1,
0.7482714, -0.5623611, 1.693275, 1, 1, 1, 1, 1,
0.7508098, -0.888126, 2.819104, 1, 1, 1, 1, 1,
0.7522063, 0.08643568, 0.9532723, 1, 1, 1, 1, 1,
0.7527759, 1.517851, 0.5017896, 1, 1, 1, 1, 1,
0.7543503, -0.4959102, 1.546538, 1, 1, 1, 1, 1,
0.7581326, 1.236583, 2.292212, 1, 1, 1, 1, 1,
0.7587731, 0.0629949, 0.05859334, 1, 1, 1, 1, 1,
0.7621712, 0.4706485, 0.6184593, 1, 1, 1, 1, 1,
0.7633026, 0.7165461, 1.32007, 1, 1, 1, 1, 1,
0.7633731, 1.689838, 0.9512544, 1, 1, 1, 1, 1,
0.7657561, 0.2328032, 0.5627718, 1, 1, 1, 1, 1,
0.7660834, -0.8665712, 3.846575, 0, 0, 1, 1, 1,
0.770267, -1.660113, 3.771889, 1, 0, 0, 1, 1,
0.7705998, -0.6739703, 3.205336, 1, 0, 0, 1, 1,
0.7743014, -0.1235473, 2.501808, 1, 0, 0, 1, 1,
0.7764564, -0.0670968, 2.131322, 1, 0, 0, 1, 1,
0.777832, 0.7646551, 1.661189, 1, 0, 0, 1, 1,
0.7822689, 0.5046582, 0.2936282, 0, 0, 0, 1, 1,
0.7868544, 1.27817, -0.7308559, 0, 0, 0, 1, 1,
0.7907689, 0.3755368, 1.308367, 0, 0, 0, 1, 1,
0.7936962, 0.6177155, 0.232227, 0, 0, 0, 1, 1,
0.7987428, 0.5275115, 2.521012, 0, 0, 0, 1, 1,
0.7991304, -0.4540305, 2.172427, 0, 0, 0, 1, 1,
0.801913, -0.7140662, 2.446461, 0, 0, 0, 1, 1,
0.806443, -0.1354925, -0.5107531, 1, 1, 1, 1, 1,
0.8105671, -2.596319, 4.038323, 1, 1, 1, 1, 1,
0.8135325, -0.02990729, 0.8720651, 1, 1, 1, 1, 1,
0.8181072, 0.392891, -1.088749, 1, 1, 1, 1, 1,
0.8216709, -1.42941, 2.190408, 1, 1, 1, 1, 1,
0.82686, -1.073764, 2.470956, 1, 1, 1, 1, 1,
0.828221, 0.1381763, 0.2454593, 1, 1, 1, 1, 1,
0.8321744, 0.6193493, 1.66899, 1, 1, 1, 1, 1,
0.8385445, 1.617332, -1.03103, 1, 1, 1, 1, 1,
0.8403134, -0.2350369, 2.228754, 1, 1, 1, 1, 1,
0.841933, 0.4635159, 1.778689, 1, 1, 1, 1, 1,
0.8431603, -1.181872, 1.949136, 1, 1, 1, 1, 1,
0.8475515, -0.09408915, 3.145973, 1, 1, 1, 1, 1,
0.8517382, -0.2293912, 1.83075, 1, 1, 1, 1, 1,
0.8629954, 0.2680028, 1.702867, 1, 1, 1, 1, 1,
0.8634989, -0.07314228, 2.655432, 0, 0, 1, 1, 1,
0.8635997, 0.2574304, 1.165913, 1, 0, 0, 1, 1,
0.8700098, 0.6715253, 1.880961, 1, 0, 0, 1, 1,
0.8718492, -1.413339, 2.021938, 1, 0, 0, 1, 1,
0.8734692, 0.7243072, 0.784602, 1, 0, 0, 1, 1,
0.8740786, -0.2630192, 3.007774, 1, 0, 0, 1, 1,
0.8781043, 0.03464427, 1.910055, 0, 0, 0, 1, 1,
0.8807019, -2.965126, 3.262467, 0, 0, 0, 1, 1,
0.8826739, -1.462369, 2.466365, 0, 0, 0, 1, 1,
0.8851835, 0.8461208, 1.706619, 0, 0, 0, 1, 1,
0.8852047, -0.2320997, 0.5586702, 0, 0, 0, 1, 1,
0.8941848, 1.020974, -1.745739, 0, 0, 0, 1, 1,
0.8943234, -0.8166923, 0.6505815, 0, 0, 0, 1, 1,
0.8962205, -0.2402109, 1.593299, 1, 1, 1, 1, 1,
0.89668, -0.2931959, 2.658167, 1, 1, 1, 1, 1,
0.8976997, -0.5630759, 3.247075, 1, 1, 1, 1, 1,
0.8997269, -0.1160623, 1.889898, 1, 1, 1, 1, 1,
0.9066957, -0.0616899, 0.4936504, 1, 1, 1, 1, 1,
0.9077058, -2.268446, 4.033193, 1, 1, 1, 1, 1,
0.9170597, -0.5303817, 1.468535, 1, 1, 1, 1, 1,
0.9342331, -0.914165, 2.540998, 1, 1, 1, 1, 1,
0.9360262, -0.7177199, 2.385139, 1, 1, 1, 1, 1,
0.9361579, 0.5779507, 2.353575, 1, 1, 1, 1, 1,
0.938533, 0.9961258, 0.2190169, 1, 1, 1, 1, 1,
0.939477, -0.2613037, 2.471526, 1, 1, 1, 1, 1,
0.9407601, 0.1415362, 2.988662, 1, 1, 1, 1, 1,
0.9437137, -0.8565008, 2.410291, 1, 1, 1, 1, 1,
0.9524866, -0.5843176, 1.923994, 1, 1, 1, 1, 1,
0.9560516, 1.521722, 0.7353427, 0, 0, 1, 1, 1,
0.9604659, -0.2948157, 0.8477989, 1, 0, 0, 1, 1,
0.9617492, 0.3684814, 0.3458449, 1, 0, 0, 1, 1,
0.9624634, -0.3232508, -0.2325157, 1, 0, 0, 1, 1,
0.9664336, 0.0932486, 0.7286055, 1, 0, 0, 1, 1,
0.9710571, 0.4002866, -0.4279676, 1, 0, 0, 1, 1,
0.9716796, 0.9611226, 0.7199713, 0, 0, 0, 1, 1,
0.9801158, -0.8897952, 3.387379, 0, 0, 0, 1, 1,
0.9821013, 0.8164018, 1.252641, 0, 0, 0, 1, 1,
0.9912992, -0.7079782, 1.271652, 0, 0, 0, 1, 1,
0.9936087, -0.1573554, 3.111537, 0, 0, 0, 1, 1,
0.9956002, -0.1426652, 2.160368, 0, 0, 0, 1, 1,
0.9981458, -0.1399514, 0.8957931, 0, 0, 0, 1, 1,
1.000847, 1.471324, -0.9649202, 1, 1, 1, 1, 1,
1.016916, 0.01092881, 1.769289, 1, 1, 1, 1, 1,
1.021929, -0.687929, 3.508685, 1, 1, 1, 1, 1,
1.032288, -1.097047, 1.668416, 1, 1, 1, 1, 1,
1.034395, 0.280102, 1.51946, 1, 1, 1, 1, 1,
1.035094, 0.1847764, 1.869359, 1, 1, 1, 1, 1,
1.040787, -0.9294322, 1.546638, 1, 1, 1, 1, 1,
1.045504, -0.7122585, 2.772045, 1, 1, 1, 1, 1,
1.049394, 2.141316, 0.8478707, 1, 1, 1, 1, 1,
1.054715, -0.7191768, 1.791843, 1, 1, 1, 1, 1,
1.057029, 0.06472986, 2.634253, 1, 1, 1, 1, 1,
1.070131, 1.810074, 0.8953784, 1, 1, 1, 1, 1,
1.072191, 1.813915, 0.3791151, 1, 1, 1, 1, 1,
1.075747, -0.1343563, 1.739506, 1, 1, 1, 1, 1,
1.078159, -1.407803, 1.661595, 1, 1, 1, 1, 1,
1.078213, -0.6477829, 1.7457, 0, 0, 1, 1, 1,
1.080579, -0.3717974, 1.561484, 1, 0, 0, 1, 1,
1.088604, 0.9249755, 1.608827, 1, 0, 0, 1, 1,
1.088913, 0.291948, 1.033265, 1, 0, 0, 1, 1,
1.091963, 0.4333588, 0.4049021, 1, 0, 0, 1, 1,
1.094025, 0.3226616, 2.71873, 1, 0, 0, 1, 1,
1.107671, -0.2814149, 0.3768431, 0, 0, 0, 1, 1,
1.109075, -0.5850046, -0.3874753, 0, 0, 0, 1, 1,
1.132579, 0.008295262, 1.582539, 0, 0, 0, 1, 1,
1.133532, -0.8843434, 0.4972104, 0, 0, 0, 1, 1,
1.135137, 0.7527721, 1.15725, 0, 0, 0, 1, 1,
1.137858, -1.737592, 1.390395, 0, 0, 0, 1, 1,
1.138412, 0.2138445, 0.3432104, 0, 0, 0, 1, 1,
1.1408, -0.4337955, 3.394394, 1, 1, 1, 1, 1,
1.145566, 0.8867887, 0.5269638, 1, 1, 1, 1, 1,
1.145986, 0.8358207, 1.791671, 1, 1, 1, 1, 1,
1.149914, 0.2853338, 1.232576, 1, 1, 1, 1, 1,
1.154301, 1.088919, 0.9400199, 1, 1, 1, 1, 1,
1.158229, 0.8644063, 2.026037, 1, 1, 1, 1, 1,
1.161315, 0.6827778, 2.27037, 1, 1, 1, 1, 1,
1.167138, -0.5302359, 3.213573, 1, 1, 1, 1, 1,
1.170344, 1.350533, -0.05253903, 1, 1, 1, 1, 1,
1.180641, -0.02187782, -0.009860829, 1, 1, 1, 1, 1,
1.184846, -0.6972466, 2.90164, 1, 1, 1, 1, 1,
1.184917, -1.473649, 3.363713, 1, 1, 1, 1, 1,
1.185155, -1.719519, 3.334124, 1, 1, 1, 1, 1,
1.187149, -0.7690334, 3.835999, 1, 1, 1, 1, 1,
1.190137, 0.4558838, 0.6921349, 1, 1, 1, 1, 1,
1.201757, -0.5667638, 2.293025, 0, 0, 1, 1, 1,
1.202087, 1.018346, 0.7322615, 1, 0, 0, 1, 1,
1.208893, -0.2367241, 2.280059, 1, 0, 0, 1, 1,
1.210045, -1.285001, 2.403152, 1, 0, 0, 1, 1,
1.218432, 0.7546572, -0.6188633, 1, 0, 0, 1, 1,
1.225405, 1.47092, 0.8424711, 1, 0, 0, 1, 1,
1.228216, -0.3162364, 3.017907, 0, 0, 0, 1, 1,
1.228745, 0.7744675, 0.6698212, 0, 0, 0, 1, 1,
1.231205, 0.1926637, 1.414273, 0, 0, 0, 1, 1,
1.233062, -0.4772008, 0.2333924, 0, 0, 0, 1, 1,
1.236407, -0.2876976, 1.480786, 0, 0, 0, 1, 1,
1.23856, 0.1302121, 2.374332, 0, 0, 0, 1, 1,
1.239769, -0.5240093, 4.023178, 0, 0, 0, 1, 1,
1.243257, 0.2154884, 2.796133, 1, 1, 1, 1, 1,
1.249478, 0.7746035, 1.324445, 1, 1, 1, 1, 1,
1.25496, 0.4165071, 1.703177, 1, 1, 1, 1, 1,
1.258931, 0.5899048, 0.5437195, 1, 1, 1, 1, 1,
1.259995, -0.8493195, 2.126336, 1, 1, 1, 1, 1,
1.260832, -0.8047367, 3.290276, 1, 1, 1, 1, 1,
1.265938, 0.1957098, 0.3854073, 1, 1, 1, 1, 1,
1.276557, -0.7674658, 2.731694, 1, 1, 1, 1, 1,
1.281917, -0.3003665, 2.364799, 1, 1, 1, 1, 1,
1.283671, -1.403328, 1.730377, 1, 1, 1, 1, 1,
1.285873, -1.520548, 1.320154, 1, 1, 1, 1, 1,
1.298818, -1.456729, 3.065363, 1, 1, 1, 1, 1,
1.299171, 0.9902623, 2.822171, 1, 1, 1, 1, 1,
1.305632, -1.542146, 3.370982, 1, 1, 1, 1, 1,
1.309335, 0.1072613, 0.05238196, 1, 1, 1, 1, 1,
1.309924, 0.9280121, 0.125125, 0, 0, 1, 1, 1,
1.330547, -1.642423, 0.8214616, 1, 0, 0, 1, 1,
1.333263, 1.025152, -0.7210982, 1, 0, 0, 1, 1,
1.336062, 0.1056126, 2.516894, 1, 0, 0, 1, 1,
1.344311, -1.008602, 2.892097, 1, 0, 0, 1, 1,
1.349884, 0.7752751, 2.101405, 1, 0, 0, 1, 1,
1.351761, -0.3083844, 0.9444745, 0, 0, 0, 1, 1,
1.374419, 0.7769641, 0.822247, 0, 0, 0, 1, 1,
1.396173, -1.417059, 3.84269, 0, 0, 0, 1, 1,
1.398991, 0.02154727, 0.8401283, 0, 0, 0, 1, 1,
1.400898, 0.3781453, 0.1793436, 0, 0, 0, 1, 1,
1.410266, -0.9048218, 2.506969, 0, 0, 0, 1, 1,
1.413215, 2.220778, 0.3819876, 0, 0, 0, 1, 1,
1.426263, -1.114102, 2.689304, 1, 1, 1, 1, 1,
1.427603, 0.6586477, 2.57661, 1, 1, 1, 1, 1,
1.428443, -1.820085, 4.649639, 1, 1, 1, 1, 1,
1.441441, 1.52214, -0.5196697, 1, 1, 1, 1, 1,
1.448291, 0.5654071, 2.396205, 1, 1, 1, 1, 1,
1.449481, -0.3394841, 1.729692, 1, 1, 1, 1, 1,
1.449957, -0.1762079, 1.379406, 1, 1, 1, 1, 1,
1.455404, 0.2245499, 1.849988, 1, 1, 1, 1, 1,
1.469242, 0.1097781, 0.8307392, 1, 1, 1, 1, 1,
1.470689, 0.4723705, 0.9132086, 1, 1, 1, 1, 1,
1.475065, -1.266402, 1.737466, 1, 1, 1, 1, 1,
1.477114, -0.926915, 1.382318, 1, 1, 1, 1, 1,
1.480551, -1.290027, 2.171381, 1, 1, 1, 1, 1,
1.485877, 0.9758438, 1.24262, 1, 1, 1, 1, 1,
1.486317, 1.931835, 1.942991, 1, 1, 1, 1, 1,
1.489122, 0.5102288, 1.149244, 0, 0, 1, 1, 1,
1.494203, -0.8207212, 2.767889, 1, 0, 0, 1, 1,
1.497936, 0.9742579, 1.487205, 1, 0, 0, 1, 1,
1.50904, -0.1212583, 1.905154, 1, 0, 0, 1, 1,
1.538564, 0.1490676, 1.52801, 1, 0, 0, 1, 1,
1.550833, -0.01324488, 2.918306, 1, 0, 0, 1, 1,
1.563085, 1.990591, 2.069789, 0, 0, 0, 1, 1,
1.565512, -0.1127801, 1.927969, 0, 0, 0, 1, 1,
1.566057, -0.309027, 2.868683, 0, 0, 0, 1, 1,
1.569942, 0.8923667, -0.8805214, 0, 0, 0, 1, 1,
1.570939, 1.558369, 2.349304, 0, 0, 0, 1, 1,
1.573409, 0.1616902, 1.141436, 0, 0, 0, 1, 1,
1.582222, -0.6320623, 2.095853, 0, 0, 0, 1, 1,
1.600601, -0.9215493, 2.26361, 1, 1, 1, 1, 1,
1.614367, -0.4452673, 0.646226, 1, 1, 1, 1, 1,
1.616247, -0.368405, 3.579247, 1, 1, 1, 1, 1,
1.633352, -2.09486, 1.899235, 1, 1, 1, 1, 1,
1.646427, 0.47143, 2.743977, 1, 1, 1, 1, 1,
1.649244, -0.1635709, 1.59694, 1, 1, 1, 1, 1,
1.651688, -1.534761, 2.418271, 1, 1, 1, 1, 1,
1.659606, -0.3478052, 3.409395, 1, 1, 1, 1, 1,
1.6649, 0.3088742, 2.503891, 1, 1, 1, 1, 1,
1.674653, -0.03821526, 3.345513, 1, 1, 1, 1, 1,
1.684707, 0.1926107, 3.469548, 1, 1, 1, 1, 1,
1.695934, -0.7837785, 2.074765, 1, 1, 1, 1, 1,
1.697511, 1.006279, 1.042267, 1, 1, 1, 1, 1,
1.700795, -0.5650454, 2.113438, 1, 1, 1, 1, 1,
1.70231, 0.427299, 3.896951, 1, 1, 1, 1, 1,
1.73001, -0.8128184, 4.297518, 0, 0, 1, 1, 1,
1.73765, 0.6834677, 1.532184, 1, 0, 0, 1, 1,
1.73792, 0.2632114, -0.5043544, 1, 0, 0, 1, 1,
1.75314, 0.4618176, 1.949753, 1, 0, 0, 1, 1,
1.766334, -0.8809865, 1.035929, 1, 0, 0, 1, 1,
1.772835, -0.5885462, 1.429314, 1, 0, 0, 1, 1,
1.774552, -2.51642, 3.420385, 0, 0, 0, 1, 1,
1.784577, -0.6931415, 2.670411, 0, 0, 0, 1, 1,
1.803092, 0.381417, -0.3687333, 0, 0, 0, 1, 1,
1.816096, -2.004266, 3.501025, 0, 0, 0, 1, 1,
1.821903, 0.4233425, 1.092412, 0, 0, 0, 1, 1,
1.844202, -1.027935, 1.43175, 0, 0, 0, 1, 1,
1.865305, -0.165136, 2.189282, 0, 0, 0, 1, 1,
1.869042, -0.8704211, 3.188549, 1, 1, 1, 1, 1,
1.883098, -1.146745, 0.9682523, 1, 1, 1, 1, 1,
1.883161, 0.1984328, 0.9220196, 1, 1, 1, 1, 1,
1.909604, 0.03581535, 1.557721, 1, 1, 1, 1, 1,
1.923143, -0.8654339, 2.72024, 1, 1, 1, 1, 1,
1.923423, 0.8062215, 1.642623, 1, 1, 1, 1, 1,
1.959482, -0.7336559, 2.591496, 1, 1, 1, 1, 1,
1.977197, -0.9204015, 0.8510114, 1, 1, 1, 1, 1,
1.986729, -2.516522, 5.045193, 1, 1, 1, 1, 1,
2.005052, -1.231727, 0.7817963, 1, 1, 1, 1, 1,
2.018526, 1.037699, 1.967331, 1, 1, 1, 1, 1,
2.022874, -0.2687101, 1.490748, 1, 1, 1, 1, 1,
2.027831, 1.336664, 0.8518823, 1, 1, 1, 1, 1,
2.046658, -0.8520373, 1.412316, 1, 1, 1, 1, 1,
2.077691, -0.04797158, 1.00435, 1, 1, 1, 1, 1,
2.084846, -1.782438, 0.8244676, 0, 0, 1, 1, 1,
2.094083, 0.07052089, 1.051489, 1, 0, 0, 1, 1,
2.109318, -0.1066203, 1.914142, 1, 0, 0, 1, 1,
2.125576, -0.1772891, 2.028867, 1, 0, 0, 1, 1,
2.138771, -1.891342, 2.741131, 1, 0, 0, 1, 1,
2.154626, 0.7450091, 1.153702, 1, 0, 0, 1, 1,
2.199806, -0.1950041, 1.198286, 0, 0, 0, 1, 1,
2.208688, -0.7547591, 2.210261, 0, 0, 0, 1, 1,
2.271232, 0.2922233, 1.083587, 0, 0, 0, 1, 1,
2.321125, -1.342527, 1.467738, 0, 0, 0, 1, 1,
2.32746, 0.03881527, 2.032612, 0, 0, 0, 1, 1,
2.332589, -0.09918629, 2.542382, 0, 0, 0, 1, 1,
2.358257, 1.109333, 2.385359, 0, 0, 0, 1, 1,
2.416733, 1.230281, 0.2049147, 1, 1, 1, 1, 1,
2.472454, 0.6127654, -1.170255, 1, 1, 1, 1, 1,
2.477574, -0.1157916, 0.5827447, 1, 1, 1, 1, 1,
2.635905, 0.5607798, 1.329128, 1, 1, 1, 1, 1,
2.764405, -0.2971492, 2.068089, 1, 1, 1, 1, 1,
2.867343, -0.896242, 3.205767, 1, 1, 1, 1, 1,
3.283988, 0.8609176, 1.720206, 1, 1, 1, 1, 1
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
var radius = 9.664351;
var distance = 33.94562;
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
mvMatrix.translate( -0.2348565, -0.1904918, 0.1980164 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.94562);
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
