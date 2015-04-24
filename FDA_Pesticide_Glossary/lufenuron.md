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
-3.537477, -0.05316035, -1.863542, 1, 0, 0, 1,
-2.820209, -0.6353126, -0.1071418, 1, 0.007843138, 0, 1,
-2.744123, -0.7948501, -2.962329, 1, 0.01176471, 0, 1,
-2.681437, 0.5449324, -1.970234, 1, 0.01960784, 0, 1,
-2.612249, -0.002297622, -2.447141, 1, 0.02352941, 0, 1,
-2.595348, 1.780055, -0.6996933, 1, 0.03137255, 0, 1,
-2.580587, -0.2113157, -0.7623539, 1, 0.03529412, 0, 1,
-2.482782, 1.482158, 0.3575945, 1, 0.04313726, 0, 1,
-2.476685, 1.363379, -0.2436017, 1, 0.04705882, 0, 1,
-2.462254, -1.210487, -2.204083, 1, 0.05490196, 0, 1,
-2.416455, -0.8792583, -1.180456, 1, 0.05882353, 0, 1,
-2.394368, 0.3188412, -0.8604757, 1, 0.06666667, 0, 1,
-2.369971, 1.802307, -0.2900768, 1, 0.07058824, 0, 1,
-2.357973, 0.4875513, -1.006735, 1, 0.07843138, 0, 1,
-2.355513, -1.130876, -2.051342, 1, 0.08235294, 0, 1,
-2.335755, 0.4044305, -1.009232, 1, 0.09019608, 0, 1,
-2.274659, 0.0253496, -3.278777, 1, 0.09411765, 0, 1,
-2.222313, 0.7407257, -3.130007, 1, 0.1019608, 0, 1,
-2.214683, -0.542814, -0.3898041, 1, 0.1098039, 0, 1,
-2.196296, 1.105955, -1.158515, 1, 0.1137255, 0, 1,
-2.183877, -0.8411334, -1.591342, 1, 0.1215686, 0, 1,
-2.178045, 1.749663, -1.653877, 1, 0.1254902, 0, 1,
-2.163278, 0.8745757, -1.258654, 1, 0.1333333, 0, 1,
-2.136201, -0.203035, -0.7703153, 1, 0.1372549, 0, 1,
-2.135533, 1.208995, -1.106059, 1, 0.145098, 0, 1,
-2.133632, -1.038692, -1.832082, 1, 0.1490196, 0, 1,
-2.133029, 2.066591, -1.332648, 1, 0.1568628, 0, 1,
-2.063086, 0.1305629, 0.1416727, 1, 0.1607843, 0, 1,
-2.050834, 1.127114, -1.0322, 1, 0.1686275, 0, 1,
-2.038712, 1.675333, 0.3452314, 1, 0.172549, 0, 1,
-2.031356, 1.225372, -3.149709, 1, 0.1803922, 0, 1,
-1.993109, 1.44216, -1.320979, 1, 0.1843137, 0, 1,
-1.986036, -1.393562, -3.039564, 1, 0.1921569, 0, 1,
-1.985624, -1.194053, -0.8463719, 1, 0.1960784, 0, 1,
-1.984198, 0.8711945, -1.534443, 1, 0.2039216, 0, 1,
-1.913746, -0.4076802, -2.117459, 1, 0.2117647, 0, 1,
-1.895205, 1.911988, -0.1476303, 1, 0.2156863, 0, 1,
-1.877925, 1.820676, 0.1729641, 1, 0.2235294, 0, 1,
-1.863654, 0.1102609, -0.9184711, 1, 0.227451, 0, 1,
-1.82236, -0.9987178, -2.211246, 1, 0.2352941, 0, 1,
-1.819378, -1.42354, -3.510075, 1, 0.2392157, 0, 1,
-1.800374, 0.07460934, -0.6426634, 1, 0.2470588, 0, 1,
-1.795035, -1.357653, -1.295301, 1, 0.2509804, 0, 1,
-1.783193, -0.9780087, -0.4502768, 1, 0.2588235, 0, 1,
-1.782943, -1.164085, -0.1065945, 1, 0.2627451, 0, 1,
-1.779413, 0.9857341, 1.54908, 1, 0.2705882, 0, 1,
-1.750823, -0.4241231, -0.4609163, 1, 0.2745098, 0, 1,
-1.747023, -1.952188, -1.857949, 1, 0.282353, 0, 1,
-1.743063, -0.1639806, -0.2428784, 1, 0.2862745, 0, 1,
-1.728598, -0.8208517, -2.247727, 1, 0.2941177, 0, 1,
-1.7112, 1.220159, -1.171717, 1, 0.3019608, 0, 1,
-1.707715, -0.5423918, -2.129585, 1, 0.3058824, 0, 1,
-1.705714, 0.3353377, -0.7360587, 1, 0.3137255, 0, 1,
-1.694588, 0.7989882, -1.720183, 1, 0.3176471, 0, 1,
-1.674554, 0.01696674, -1.758852, 1, 0.3254902, 0, 1,
-1.64418, 0.8217842, 0.3545209, 1, 0.3294118, 0, 1,
-1.64397, -1.582639, -2.241106, 1, 0.3372549, 0, 1,
-1.623747, -0.5407276, -0.9212252, 1, 0.3411765, 0, 1,
-1.577421, -0.8860003, -4.515612, 1, 0.3490196, 0, 1,
-1.577414, 0.442353, -0.9718903, 1, 0.3529412, 0, 1,
-1.576522, -0.1211008, -1.581101, 1, 0.3607843, 0, 1,
-1.572069, 0.3460982, -0.002908643, 1, 0.3647059, 0, 1,
-1.570924, 1.014612, -2.425066, 1, 0.372549, 0, 1,
-1.570326, -0.8580083, -4.585383, 1, 0.3764706, 0, 1,
-1.569919, -1.723812, -2.784509, 1, 0.3843137, 0, 1,
-1.564471, 0.607212, -2.311054, 1, 0.3882353, 0, 1,
-1.554588, -2.052624, -1.374288, 1, 0.3960784, 0, 1,
-1.54161, 0.1914772, -0.633885, 1, 0.4039216, 0, 1,
-1.521842, 1.631254, -0.3147635, 1, 0.4078431, 0, 1,
-1.517286, -1.341422, -2.983459, 1, 0.4156863, 0, 1,
-1.50734, -0.3487973, -2.675297, 1, 0.4196078, 0, 1,
-1.498622, -1.315964, 0.04406486, 1, 0.427451, 0, 1,
-1.497148, 0.3592302, -0.8974046, 1, 0.4313726, 0, 1,
-1.495725, -1.424463, -2.850714, 1, 0.4392157, 0, 1,
-1.476149, 1.86658, -2.16423, 1, 0.4431373, 0, 1,
-1.461753, -0.074809, -2.278225, 1, 0.4509804, 0, 1,
-1.461142, -0.3954282, -2.893161, 1, 0.454902, 0, 1,
-1.460829, -0.1438078, -0.8396406, 1, 0.4627451, 0, 1,
-1.460575, -0.1167876, -2.138343, 1, 0.4666667, 0, 1,
-1.448652, 0.5157046, -1.227271, 1, 0.4745098, 0, 1,
-1.444739, 1.242176, -1.056296, 1, 0.4784314, 0, 1,
-1.443949, -2.175995, -3.033536, 1, 0.4862745, 0, 1,
-1.420273, -1.679065, -3.543561, 1, 0.4901961, 0, 1,
-1.417733, 0.2101147, -1.006811, 1, 0.4980392, 0, 1,
-1.409982, -0.8319092, -2.318012, 1, 0.5058824, 0, 1,
-1.398722, -0.3723399, -1.279989, 1, 0.509804, 0, 1,
-1.389427, -3.778567, -1.859443, 1, 0.5176471, 0, 1,
-1.382909, 0.8098298, -0.1254422, 1, 0.5215687, 0, 1,
-1.377155, 0.1443132, 0.2212531, 1, 0.5294118, 0, 1,
-1.376377, 1.183612, -1.383831, 1, 0.5333334, 0, 1,
-1.361202, -0.8692297, -2.297223, 1, 0.5411765, 0, 1,
-1.357058, 0.08567905, -1.705444, 1, 0.5450981, 0, 1,
-1.344219, 0.2060207, -1.069656, 1, 0.5529412, 0, 1,
-1.338937, 0.4939218, -0.4355651, 1, 0.5568628, 0, 1,
-1.336986, 1.924788, -2.080262, 1, 0.5647059, 0, 1,
-1.33439, 2.116373, -0.62332, 1, 0.5686275, 0, 1,
-1.331809, 1.464394, 0.2292037, 1, 0.5764706, 0, 1,
-1.328346, 0.1868406, 0.09452878, 1, 0.5803922, 0, 1,
-1.317147, -1.468813, -0.9077289, 1, 0.5882353, 0, 1,
-1.31615, 0.5535856, -1.854861, 1, 0.5921569, 0, 1,
-1.309334, 0.5014259, -1.577453, 1, 0.6, 0, 1,
-1.3072, -0.4954805, -2.75604, 1, 0.6078432, 0, 1,
-1.304079, -0.04039059, -1.622086, 1, 0.6117647, 0, 1,
-1.299154, -0.7504179, -1.567727, 1, 0.6196079, 0, 1,
-1.298283, 0.133725, -1.358499, 1, 0.6235294, 0, 1,
-1.278536, 0.7831535, -2.08694, 1, 0.6313726, 0, 1,
-1.277713, 0.5554625, -1.384385, 1, 0.6352941, 0, 1,
-1.271694, -0.2930385, -2.739119, 1, 0.6431373, 0, 1,
-1.271219, 0.4101819, -0.1120393, 1, 0.6470588, 0, 1,
-1.262348, -2.33078, -3.349299, 1, 0.654902, 0, 1,
-1.257226, -1.434836, -2.970438, 1, 0.6588235, 0, 1,
-1.250887, 1.762932, -0.790594, 1, 0.6666667, 0, 1,
-1.232192, 1.332879, 0.3484625, 1, 0.6705883, 0, 1,
-1.229744, -0.648393, -2.75646, 1, 0.6784314, 0, 1,
-1.22758, -0.2952799, -0.9091952, 1, 0.682353, 0, 1,
-1.225599, 0.8160149, -0.9019133, 1, 0.6901961, 0, 1,
-1.224942, 0.2613008, -1.971296, 1, 0.6941177, 0, 1,
-1.217834, 0.3038236, -1.135816, 1, 0.7019608, 0, 1,
-1.200783, 0.01582371, -0.9890171, 1, 0.7098039, 0, 1,
-1.197907, -0.3410816, -0.4851351, 1, 0.7137255, 0, 1,
-1.192541, 1.382986, -1.808574, 1, 0.7215686, 0, 1,
-1.180023, -0.6565772, -2.312558, 1, 0.7254902, 0, 1,
-1.165147, 0.04039416, -2.634012, 1, 0.7333333, 0, 1,
-1.165069, 0.3627742, -3.056992, 1, 0.7372549, 0, 1,
-1.163593, 1.065155, -1.015762, 1, 0.7450981, 0, 1,
-1.161353, -0.5865346, -2.27236, 1, 0.7490196, 0, 1,
-1.153752, 1.209935, -1.295452, 1, 0.7568628, 0, 1,
-1.149662, 0.05287946, -2.497698, 1, 0.7607843, 0, 1,
-1.147734, 0.4551192, -0.9247537, 1, 0.7686275, 0, 1,
-1.143724, 1.456448, -1.548849, 1, 0.772549, 0, 1,
-1.140736, 1.635097, 0.1726923, 1, 0.7803922, 0, 1,
-1.138463, -0.01235497, -2.213315, 1, 0.7843137, 0, 1,
-1.132966, 0.2303814, -0.7296979, 1, 0.7921569, 0, 1,
-1.129862, -0.5420301, -1.271397, 1, 0.7960784, 0, 1,
-1.12788, -0.2122382, -2.545857, 1, 0.8039216, 0, 1,
-1.120979, 0.321969, 0.6899614, 1, 0.8117647, 0, 1,
-1.117075, 0.6124337, -1.773966, 1, 0.8156863, 0, 1,
-1.116171, -0.5135054, -1.496237, 1, 0.8235294, 0, 1,
-1.112532, -0.8628367, -1.288024, 1, 0.827451, 0, 1,
-1.106085, -1.923873, -2.938122, 1, 0.8352941, 0, 1,
-1.103041, -1.010695, -1.801758, 1, 0.8392157, 0, 1,
-1.10119, -0.2686452, -2.388065, 1, 0.8470588, 0, 1,
-1.097481, -1.469222, -0.5975834, 1, 0.8509804, 0, 1,
-1.09344, 1.236698, -2.046242, 1, 0.8588235, 0, 1,
-1.088202, 0.5598876, 0.2810371, 1, 0.8627451, 0, 1,
-1.087634, 0.4414313, -0.5178364, 1, 0.8705882, 0, 1,
-1.085527, 0.2404579, -0.7753258, 1, 0.8745098, 0, 1,
-1.082044, -0.08318603, -1.041039, 1, 0.8823529, 0, 1,
-1.081268, 0.7210984, -1.32893, 1, 0.8862745, 0, 1,
-1.078943, 0.6858678, -0.7499071, 1, 0.8941177, 0, 1,
-1.068048, 0.3800047, -0.5130093, 1, 0.8980392, 0, 1,
-1.064774, 1.160864, -1.122824, 1, 0.9058824, 0, 1,
-1.063885, -0.4176881, -3.74156, 1, 0.9137255, 0, 1,
-1.063489, 1.631413, 0.9980502, 1, 0.9176471, 0, 1,
-1.06068, 0.08650053, -0.8472999, 1, 0.9254902, 0, 1,
-1.057951, 0.5598891, -2.216926, 1, 0.9294118, 0, 1,
-1.056438, 0.7224634, 0.4638329, 1, 0.9372549, 0, 1,
-1.049755, -2.039497, -2.386894, 1, 0.9411765, 0, 1,
-1.044275, 0.3147222, -0.5374838, 1, 0.9490196, 0, 1,
-1.039486, 1.078811, -1.353715, 1, 0.9529412, 0, 1,
-1.039053, -1.900542, -2.925412, 1, 0.9607843, 0, 1,
-1.027431, -0.752111, -2.365402, 1, 0.9647059, 0, 1,
-1.007825, 0.7004166, -1.889233, 1, 0.972549, 0, 1,
-1.006625, -0.2400011, -1.598608, 1, 0.9764706, 0, 1,
-1.004319, -0.8648596, -0.4990996, 1, 0.9843137, 0, 1,
-1.001864, 1.325256, 1.36443, 1, 0.9882353, 0, 1,
-1.000668, -0.5216613, -4.204828, 1, 0.9960784, 0, 1,
-0.9948771, 1.169729, -1.492724, 0.9960784, 1, 0, 1,
-0.9923391, 0.4155931, -2.18776, 0.9921569, 1, 0, 1,
-0.9914294, -0.375412, -1.58871, 0.9843137, 1, 0, 1,
-0.9906946, 0.9660767, -3.130667, 0.9803922, 1, 0, 1,
-0.9863759, -1.273968, -3.819408, 0.972549, 1, 0, 1,
-0.9841961, -2.366056, -1.467813, 0.9686275, 1, 0, 1,
-0.9815177, -1.936357, -2.356739, 0.9607843, 1, 0, 1,
-0.9670266, 1.390695, -2.181685, 0.9568627, 1, 0, 1,
-0.9658777, 1.199829, -4.302005, 0.9490196, 1, 0, 1,
-0.9640384, -0.1129341, -3.165961, 0.945098, 1, 0, 1,
-0.9620058, -0.08100016, -0.901928, 0.9372549, 1, 0, 1,
-0.9619905, 1.850982, -0.294373, 0.9333333, 1, 0, 1,
-0.961895, 1.854344, -0.6004254, 0.9254902, 1, 0, 1,
-0.9602138, 1.85422, -0.8427551, 0.9215686, 1, 0, 1,
-0.9597275, 0.5133594, -0.3253875, 0.9137255, 1, 0, 1,
-0.9570872, -2.273476, -2.263032, 0.9098039, 1, 0, 1,
-0.9566311, -0.9619787, -1.410599, 0.9019608, 1, 0, 1,
-0.9550613, -0.2321565, -2.3693, 0.8941177, 1, 0, 1,
-0.953823, 0.3307033, -1.652321, 0.8901961, 1, 0, 1,
-0.9437139, 0.598381, 0.5959608, 0.8823529, 1, 0, 1,
-0.9419473, -2.255743, -3.435794, 0.8784314, 1, 0, 1,
-0.9417999, 1.019289, -1.154096, 0.8705882, 1, 0, 1,
-0.9375868, 0.7418333, -0.9434844, 0.8666667, 1, 0, 1,
-0.9317613, -0.3191311, -0.3071132, 0.8588235, 1, 0, 1,
-0.9306626, 0.3740822, -1.437526, 0.854902, 1, 0, 1,
-0.9286205, 2.644789, -0.1011805, 0.8470588, 1, 0, 1,
-0.9221659, -1.042678, -2.252988, 0.8431373, 1, 0, 1,
-0.9216647, -0.910065, -2.012555, 0.8352941, 1, 0, 1,
-0.9199516, 0.07596947, -3.7451, 0.8313726, 1, 0, 1,
-0.9196238, 1.29698, 0.7042922, 0.8235294, 1, 0, 1,
-0.912953, -0.4708674, -1.270143, 0.8196079, 1, 0, 1,
-0.9096453, -0.03389788, -0.6794634, 0.8117647, 1, 0, 1,
-0.9085847, -0.5000785, -2.405587, 0.8078431, 1, 0, 1,
-0.9029875, -0.152205, -3.541125, 0.8, 1, 0, 1,
-0.8981657, 0.5330692, -0.5583136, 0.7921569, 1, 0, 1,
-0.8943164, -1.160576, -2.363666, 0.7882353, 1, 0, 1,
-0.8941713, 0.380769, -0.693505, 0.7803922, 1, 0, 1,
-0.8909915, 1.321975, -0.8152058, 0.7764706, 1, 0, 1,
-0.8860843, -0.6352869, -3.68935, 0.7686275, 1, 0, 1,
-0.884102, 0.3942836, 0.1546157, 0.7647059, 1, 0, 1,
-0.8827038, 0.2754515, -2.928968, 0.7568628, 1, 0, 1,
-0.8795874, -1.371475, -1.330722, 0.7529412, 1, 0, 1,
-0.8789451, 0.3355683, -3.174258, 0.7450981, 1, 0, 1,
-0.8772737, 0.7400079, -0.8119199, 0.7411765, 1, 0, 1,
-0.8764976, 0.47282, -0.8510295, 0.7333333, 1, 0, 1,
-0.8745832, -0.2501073, -3.489439, 0.7294118, 1, 0, 1,
-0.8721272, 0.3738271, -0.5151345, 0.7215686, 1, 0, 1,
-0.8655636, 2.201089, 0.5415812, 0.7176471, 1, 0, 1,
-0.8631151, -0.8618599, -3.370662, 0.7098039, 1, 0, 1,
-0.8610312, -1.125792, -1.845823, 0.7058824, 1, 0, 1,
-0.8593287, -1.540587, -3.033788, 0.6980392, 1, 0, 1,
-0.857561, 1.311768, -0.5170311, 0.6901961, 1, 0, 1,
-0.8568013, 1.152773, -0.3580109, 0.6862745, 1, 0, 1,
-0.8557852, -0.4413391, -2.737814, 0.6784314, 1, 0, 1,
-0.8504329, 1.394915, -0.3224711, 0.6745098, 1, 0, 1,
-0.845112, -0.8919542, -0.6521707, 0.6666667, 1, 0, 1,
-0.8413951, 0.4265208, -0.5136206, 0.6627451, 1, 0, 1,
-0.837936, -1.156496, -0.6254979, 0.654902, 1, 0, 1,
-0.835711, -0.4663034, -3.445059, 0.6509804, 1, 0, 1,
-0.8356268, -0.4067431, -2.070184, 0.6431373, 1, 0, 1,
-0.8317447, -1.288889, -1.917758, 0.6392157, 1, 0, 1,
-0.8211553, 0.5834773, -1.76028, 0.6313726, 1, 0, 1,
-0.8110672, -0.7166389, -2.737368, 0.627451, 1, 0, 1,
-0.809486, 2.065235, -1.633713, 0.6196079, 1, 0, 1,
-0.7999131, -0.5973356, -3.376668, 0.6156863, 1, 0, 1,
-0.7998462, 0.03675408, -1.742313, 0.6078432, 1, 0, 1,
-0.7996867, -0.5611044, -2.198702, 0.6039216, 1, 0, 1,
-0.7976697, -0.3788973, -1.993235, 0.5960785, 1, 0, 1,
-0.7953035, 1.712296, -0.6974926, 0.5882353, 1, 0, 1,
-0.7936237, -0.4230289, -1.909204, 0.5843138, 1, 0, 1,
-0.7932392, 0.7239214, 0.04447031, 0.5764706, 1, 0, 1,
-0.7906835, -1.257721, -2.758685, 0.572549, 1, 0, 1,
-0.790318, -0.1073677, -1.188903, 0.5647059, 1, 0, 1,
-0.7856997, -0.4822917, -1.660989, 0.5607843, 1, 0, 1,
-0.7825086, -2.050281, -2.428281, 0.5529412, 1, 0, 1,
-0.777735, -1.514006, -4.010355, 0.5490196, 1, 0, 1,
-0.7744622, 1.188755, 0.7344466, 0.5411765, 1, 0, 1,
-0.7720216, -2.020089, -2.711589, 0.5372549, 1, 0, 1,
-0.7657702, -0.7712932, -3.117508, 0.5294118, 1, 0, 1,
-0.7586092, 1.983191, 0.009687583, 0.5254902, 1, 0, 1,
-0.7568399, 1.330492, -1.062718, 0.5176471, 1, 0, 1,
-0.752291, -0.2414903, -1.447368, 0.5137255, 1, 0, 1,
-0.7473767, -0.5325798, -2.475131, 0.5058824, 1, 0, 1,
-0.7436748, -1.060704, -1.577879, 0.5019608, 1, 0, 1,
-0.7397719, 0.06431353, -1.743182, 0.4941176, 1, 0, 1,
-0.7396318, -1.150792, -0.8676006, 0.4862745, 1, 0, 1,
-0.7381757, 0.3090431, -1.591023, 0.4823529, 1, 0, 1,
-0.7318352, -0.6822671, -1.734788, 0.4745098, 1, 0, 1,
-0.7239276, 0.01081734, -0.0442413, 0.4705882, 1, 0, 1,
-0.7176754, 1.136671, -0.6738651, 0.4627451, 1, 0, 1,
-0.7175893, -0.9376194, -2.651407, 0.4588235, 1, 0, 1,
-0.7153683, 0.10713, -0.9709636, 0.4509804, 1, 0, 1,
-0.7063603, -0.3950062, -2.502631, 0.4470588, 1, 0, 1,
-0.7053123, 0.2131455, -0.2750743, 0.4392157, 1, 0, 1,
-0.7044091, 0.3146485, -3.132645, 0.4352941, 1, 0, 1,
-0.7003565, 2.240333, 0.5921441, 0.427451, 1, 0, 1,
-0.6996307, -1.193704, -4.952989, 0.4235294, 1, 0, 1,
-0.6947851, 0.9961359, -0.7354923, 0.4156863, 1, 0, 1,
-0.694343, -0.5579051, -2.487561, 0.4117647, 1, 0, 1,
-0.6920137, 0.9312673, 0.4775757, 0.4039216, 1, 0, 1,
-0.691225, -0.2509851, -5.072909, 0.3960784, 1, 0, 1,
-0.6912109, 1.13349, -0.007151035, 0.3921569, 1, 0, 1,
-0.6909606, -0.3925468, -2.06015, 0.3843137, 1, 0, 1,
-0.6891247, -0.7594764, -2.120718, 0.3803922, 1, 0, 1,
-0.6840547, -0.5866856, -1.503222, 0.372549, 1, 0, 1,
-0.6831396, -0.9434729, -2.427009, 0.3686275, 1, 0, 1,
-0.6796446, -1.527493, -3.492573, 0.3607843, 1, 0, 1,
-0.6746705, -2.426732, -4.068513, 0.3568628, 1, 0, 1,
-0.6746588, 0.4618722, -1.627521, 0.3490196, 1, 0, 1,
-0.6723708, -0.5898803, -2.327112, 0.345098, 1, 0, 1,
-0.6625497, -1.620489, -2.182705, 0.3372549, 1, 0, 1,
-0.6611416, -1.510424, -3.147716, 0.3333333, 1, 0, 1,
-0.6577919, -0.4021401, -0.03403845, 0.3254902, 1, 0, 1,
-0.6521698, 1.152575, -0.8167844, 0.3215686, 1, 0, 1,
-0.649043, -1.169902, -1.432965, 0.3137255, 1, 0, 1,
-0.6458431, 0.7001265, 0.0204972, 0.3098039, 1, 0, 1,
-0.645529, 0.3311446, -0.6887139, 0.3019608, 1, 0, 1,
-0.6448652, -0.1526519, -2.57439, 0.2941177, 1, 0, 1,
-0.631475, -0.4857892, -0.9171664, 0.2901961, 1, 0, 1,
-0.6287305, -0.08310172, -0.8340832, 0.282353, 1, 0, 1,
-0.6276124, -0.1549941, -1.752364, 0.2784314, 1, 0, 1,
-0.6263246, 1.270748, 0.3792491, 0.2705882, 1, 0, 1,
-0.6259769, 0.7470076, -0.1040803, 0.2666667, 1, 0, 1,
-0.6215985, 1.521498, 0.9328393, 0.2588235, 1, 0, 1,
-0.62011, 0.2043448, -2.103596, 0.254902, 1, 0, 1,
-0.6168016, -0.5505555, -3.069792, 0.2470588, 1, 0, 1,
-0.6155321, 0.5026442, 0.08765067, 0.2431373, 1, 0, 1,
-0.6102337, 0.3285204, -1.762803, 0.2352941, 1, 0, 1,
-0.6095853, -0.3999383, -3.262271, 0.2313726, 1, 0, 1,
-0.6043534, 1.090839, 0.7781354, 0.2235294, 1, 0, 1,
-0.6040354, -0.204675, -1.021637, 0.2196078, 1, 0, 1,
-0.6027043, 1.639275, 0.3135371, 0.2117647, 1, 0, 1,
-0.5927252, -0.7835467, -2.105097, 0.2078431, 1, 0, 1,
-0.5859649, -0.8148733, -1.365248, 0.2, 1, 0, 1,
-0.5806965, -1.253318, -3.779939, 0.1921569, 1, 0, 1,
-0.5800594, -2.41553, -4.623571, 0.1882353, 1, 0, 1,
-0.5682451, -2.002964, -2.366948, 0.1803922, 1, 0, 1,
-0.5680673, 0.6556741, -1.688514, 0.1764706, 1, 0, 1,
-0.5660073, -0.7880663, -2.834351, 0.1686275, 1, 0, 1,
-0.5591908, 0.8095554, -2.441581, 0.1647059, 1, 0, 1,
-0.5583043, -1.209365, -3.935617, 0.1568628, 1, 0, 1,
-0.5527298, 0.01062116, 0.2889225, 0.1529412, 1, 0, 1,
-0.550581, 0.9628772, -0.644715, 0.145098, 1, 0, 1,
-0.5505005, 0.4751231, -1.134162, 0.1411765, 1, 0, 1,
-0.5424988, 0.3857191, -0.4705984, 0.1333333, 1, 0, 1,
-0.5415561, 1.386122, -0.8321246, 0.1294118, 1, 0, 1,
-0.5412028, 0.004794101, -0.9505978, 0.1215686, 1, 0, 1,
-0.5393556, 0.1073403, -2.136734, 0.1176471, 1, 0, 1,
-0.53196, -0.7296354, -3.999378, 0.1098039, 1, 0, 1,
-0.5268389, 0.1373041, -1.396163, 0.1058824, 1, 0, 1,
-0.5250745, -1.02231, -2.061164, 0.09803922, 1, 0, 1,
-0.5155298, -0.3664787, -2.829527, 0.09019608, 1, 0, 1,
-0.5136651, -1.742505, -2.658151, 0.08627451, 1, 0, 1,
-0.5119538, 1.298665, -0.3146428, 0.07843138, 1, 0, 1,
-0.511588, -1.058497, -2.275433, 0.07450981, 1, 0, 1,
-0.5112908, 1.600808, 1.213938, 0.06666667, 1, 0, 1,
-0.5095018, -0.296025, -0.6083198, 0.0627451, 1, 0, 1,
-0.5080487, -1.335791, -4.153275, 0.05490196, 1, 0, 1,
-0.5022376, 1.06727, -0.1486565, 0.05098039, 1, 0, 1,
-0.5021521, 0.4662736, -0.3841296, 0.04313726, 1, 0, 1,
-0.5018997, -2.288611, -1.245375, 0.03921569, 1, 0, 1,
-0.49938, 0.7933953, -2.404072, 0.03137255, 1, 0, 1,
-0.497788, 2.288014, -0.6319995, 0.02745098, 1, 0, 1,
-0.4923509, -0.7797219, -2.601803, 0.01960784, 1, 0, 1,
-0.4907117, 1.609142, -0.8192651, 0.01568628, 1, 0, 1,
-0.4866639, -0.4110423, -2.950355, 0.007843138, 1, 0, 1,
-0.485079, 0.9499313, -0.6310407, 0.003921569, 1, 0, 1,
-0.4811999, 0.9022473, -0.809887, 0, 1, 0.003921569, 1,
-0.4777354, -2.003258, -2.289934, 0, 1, 0.01176471, 1,
-0.4759385, 1.076197, -1.612232, 0, 1, 0.01568628, 1,
-0.4688177, 0.6446357, -1.444474, 0, 1, 0.02352941, 1,
-0.461741, -0.5238913, -1.899686, 0, 1, 0.02745098, 1,
-0.4616198, 1.135663, -0.2277774, 0, 1, 0.03529412, 1,
-0.4555987, 0.894487, -0.3977783, 0, 1, 0.03921569, 1,
-0.4541538, 0.8826057, 0.156415, 0, 1, 0.04705882, 1,
-0.4534396, -2.020844, -4.326337, 0, 1, 0.05098039, 1,
-0.4496165, 0.1237862, -0.3787973, 0, 1, 0.05882353, 1,
-0.4431, 3.187231, -0.8815377, 0, 1, 0.0627451, 1,
-0.4365325, 1.133582, 0.05120446, 0, 1, 0.07058824, 1,
-0.4360487, -1.644882, -3.383892, 0, 1, 0.07450981, 1,
-0.4319813, 1.253512, 0.01456624, 0, 1, 0.08235294, 1,
-0.4300024, -0.1647194, -2.867943, 0, 1, 0.08627451, 1,
-0.426846, -1.036224, -3.950089, 0, 1, 0.09411765, 1,
-0.4263375, 1.11036, 0.7725983, 0, 1, 0.1019608, 1,
-0.4238151, -1.244349, -3.839216, 0, 1, 0.1058824, 1,
-0.4223336, -1.337293, -2.159692, 0, 1, 0.1137255, 1,
-0.4162057, -0.1847632, -2.529275, 0, 1, 0.1176471, 1,
-0.4104632, 0.7246374, 2.074483, 0, 1, 0.1254902, 1,
-0.4059919, 1.058693, -1.015301, 0, 1, 0.1294118, 1,
-0.4055814, 1.502476, 0.6659433, 0, 1, 0.1372549, 1,
-0.4054811, 0.5044741, -0.3054512, 0, 1, 0.1411765, 1,
-0.4050633, 0.2125733, -1.576081, 0, 1, 0.1490196, 1,
-0.4011078, 0.4150171, -0.9037548, 0, 1, 0.1529412, 1,
-0.4002253, 0.3223029, -0.5929533, 0, 1, 0.1607843, 1,
-0.3994073, -0.2948976, -1.987487, 0, 1, 0.1647059, 1,
-0.393908, -1.086292, -3.326384, 0, 1, 0.172549, 1,
-0.3913119, -1.256096, -3.304307, 0, 1, 0.1764706, 1,
-0.3900473, 0.7877974, -1.960437, 0, 1, 0.1843137, 1,
-0.3898304, -0.007418768, -0.6824836, 0, 1, 0.1882353, 1,
-0.3866701, -0.7903863, 0.09850591, 0, 1, 0.1960784, 1,
-0.3817797, -0.03364521, -1.810915, 0, 1, 0.2039216, 1,
-0.3684234, 1.323845, 0.7937937, 0, 1, 0.2078431, 1,
-0.3677229, 0.9796186, 1.449827, 0, 1, 0.2156863, 1,
-0.3669262, 0.01694314, -1.759859, 0, 1, 0.2196078, 1,
-0.3650008, 1.268511, -1.22449, 0, 1, 0.227451, 1,
-0.3638391, 0.4954992, -0.04675281, 0, 1, 0.2313726, 1,
-0.3576572, 0.1590324, -2.116122, 0, 1, 0.2392157, 1,
-0.3520222, 0.6783577, 0.2791861, 0, 1, 0.2431373, 1,
-0.3519706, 0.1779315, 0.2858089, 0, 1, 0.2509804, 1,
-0.3466662, 0.5091925, -1.113729, 0, 1, 0.254902, 1,
-0.3458095, 1.47648, -1.739189, 0, 1, 0.2627451, 1,
-0.34335, -0.1393282, -1.945788, 0, 1, 0.2666667, 1,
-0.3432186, 1.555601, -0.001223175, 0, 1, 0.2745098, 1,
-0.3429571, -1.054433, -3.140079, 0, 1, 0.2784314, 1,
-0.3423693, 0.6432225, -1.628016, 0, 1, 0.2862745, 1,
-0.3380656, -0.04718153, -1.071997, 0, 1, 0.2901961, 1,
-0.3361993, -0.902599, -2.692001, 0, 1, 0.2980392, 1,
-0.3347628, -0.8734422, -3.000247, 0, 1, 0.3058824, 1,
-0.3338456, -0.919048, -3.414325, 0, 1, 0.3098039, 1,
-0.3315381, 0.1637007, -1.072106, 0, 1, 0.3176471, 1,
-0.3314661, -1.201034, -3.429164, 0, 1, 0.3215686, 1,
-0.3304442, 0.1809466, -0.7187729, 0, 1, 0.3294118, 1,
-0.3298281, -0.4000618, -3.84614, 0, 1, 0.3333333, 1,
-0.3286888, -1.949681, -5.245932, 0, 1, 0.3411765, 1,
-0.3245248, 0.2944108, -0.6642457, 0, 1, 0.345098, 1,
-0.3227058, -1.233525, -2.484741, 0, 1, 0.3529412, 1,
-0.3210235, 0.2868874, -1.084987, 0, 1, 0.3568628, 1,
-0.3209148, -0.2843451, -1.559813, 0, 1, 0.3647059, 1,
-0.3198233, -1.538586, -2.519634, 0, 1, 0.3686275, 1,
-0.318056, 1.802589, 2.115312, 0, 1, 0.3764706, 1,
-0.3165464, -0.1674594, -0.4949958, 0, 1, 0.3803922, 1,
-0.3138217, -2.29331, -4.184223, 0, 1, 0.3882353, 1,
-0.3123304, -0.4317879, -2.720105, 0, 1, 0.3921569, 1,
-0.3112686, -0.6026875, -3.28942, 0, 1, 0.4, 1,
-0.3100113, 0.8847624, 0.3570924, 0, 1, 0.4078431, 1,
-0.3015121, 0.1720367, -0.4631775, 0, 1, 0.4117647, 1,
-0.3003975, 0.6324909, -0.4611357, 0, 1, 0.4196078, 1,
-0.2989588, 1.128098, 0.7840396, 0, 1, 0.4235294, 1,
-0.2977238, 1.345005, -0.7335685, 0, 1, 0.4313726, 1,
-0.2960016, -0.1890958, -2.226763, 0, 1, 0.4352941, 1,
-0.2910902, 0.9310558, 0.0384687, 0, 1, 0.4431373, 1,
-0.2888679, 0.08538494, -1.472843, 0, 1, 0.4470588, 1,
-0.2884872, -0.01076587, -2.121679, 0, 1, 0.454902, 1,
-0.2860789, -0.7826649, -3.193658, 0, 1, 0.4588235, 1,
-0.285045, -0.8829015, -4.09122, 0, 1, 0.4666667, 1,
-0.2799095, 0.1988744, -0.4624377, 0, 1, 0.4705882, 1,
-0.2783043, 1.963457, -2.128338, 0, 1, 0.4784314, 1,
-0.2778744, -0.1611671, -1.535822, 0, 1, 0.4823529, 1,
-0.27628, -0.7960604, -2.280941, 0, 1, 0.4901961, 1,
-0.2738593, 0.3978262, -2.089352, 0, 1, 0.4941176, 1,
-0.2695122, 1.312914, -0.4604134, 0, 1, 0.5019608, 1,
-0.2687232, 0.08023152, -1.016165, 0, 1, 0.509804, 1,
-0.2650911, -1.321382, -4.236417, 0, 1, 0.5137255, 1,
-0.260911, -0.2506762, -4.34241, 0, 1, 0.5215687, 1,
-0.2583923, -1.054898, -4.78755, 0, 1, 0.5254902, 1,
-0.2548668, -0.1211369, -1.220269, 0, 1, 0.5333334, 1,
-0.2528572, 0.1959603, -0.8231049, 0, 1, 0.5372549, 1,
-0.2525071, 0.09335364, -1.396757, 0, 1, 0.5450981, 1,
-0.2461756, 0.5497113, -0.3083854, 0, 1, 0.5490196, 1,
-0.2310666, -0.4835137, -3.66154, 0, 1, 0.5568628, 1,
-0.2309554, -2.287208, -4.626042, 0, 1, 0.5607843, 1,
-0.2285601, -0.5226443, -2.780055, 0, 1, 0.5686275, 1,
-0.2273402, 0.4556799, -0.2947534, 0, 1, 0.572549, 1,
-0.2248372, 0.6140265, 0.179311, 0, 1, 0.5803922, 1,
-0.2234341, -0.4092155, -2.81242, 0, 1, 0.5843138, 1,
-0.2195537, 0.9969289, 0.4178582, 0, 1, 0.5921569, 1,
-0.2162682, -0.509151, -2.273603, 0, 1, 0.5960785, 1,
-0.2125606, 0.7783135, 0.8386059, 0, 1, 0.6039216, 1,
-0.2108595, 1.212008, 0.5669234, 0, 1, 0.6117647, 1,
-0.2097482, -0.2544822, -1.653735, 0, 1, 0.6156863, 1,
-0.2087603, 0.4630158, 0.1314222, 0, 1, 0.6235294, 1,
-0.2083185, 1.345795, -0.00444206, 0, 1, 0.627451, 1,
-0.208078, -0.5771797, -2.533749, 0, 1, 0.6352941, 1,
-0.207352, -1.40165, -2.098893, 0, 1, 0.6392157, 1,
-0.2000273, 0.1340444, 1.377922, 0, 1, 0.6470588, 1,
-0.1970017, -0.3909932, -4.466955, 0, 1, 0.6509804, 1,
-0.1958372, -0.3339982, -2.704038, 0, 1, 0.6588235, 1,
-0.1944457, 2.21659, 0.4364621, 0, 1, 0.6627451, 1,
-0.1915883, -0.7439395, -3.056273, 0, 1, 0.6705883, 1,
-0.1910895, -0.920665, -3.621386, 0, 1, 0.6745098, 1,
-0.1894773, 2.623465, -0.3842193, 0, 1, 0.682353, 1,
-0.1862315, 0.07732183, 0.3641712, 0, 1, 0.6862745, 1,
-0.1838228, 0.6616166, 0.7918481, 0, 1, 0.6941177, 1,
-0.1837959, 0.4579764, 0.9638042, 0, 1, 0.7019608, 1,
-0.1817354, -0.1666319, -3.500769, 0, 1, 0.7058824, 1,
-0.1789136, 1.463417, -0.1536588, 0, 1, 0.7137255, 1,
-0.1787406, -1.933354, -3.964848, 0, 1, 0.7176471, 1,
-0.1785115, 1.222971, 0.2534308, 0, 1, 0.7254902, 1,
-0.177576, -0.4031921, -3.749723, 0, 1, 0.7294118, 1,
-0.1774214, 1.079473, 0.2512131, 0, 1, 0.7372549, 1,
-0.1754115, 1.072859, -0.5432563, 0, 1, 0.7411765, 1,
-0.1718016, -0.24683, -2.354125, 0, 1, 0.7490196, 1,
-0.1665433, 1.493381, -1.343044, 0, 1, 0.7529412, 1,
-0.1633107, -1.29511, -4.213121, 0, 1, 0.7607843, 1,
-0.1632907, -0.7912162, -2.757067, 0, 1, 0.7647059, 1,
-0.1597481, -0.795404, 0.2158254, 0, 1, 0.772549, 1,
-0.1553665, 0.4629776, 1.148607, 0, 1, 0.7764706, 1,
-0.148722, -1.209649, -4.401868, 0, 1, 0.7843137, 1,
-0.1485898, 0.1573138, -0.2044706, 0, 1, 0.7882353, 1,
-0.1477599, 0.3474503, 0.6015871, 0, 1, 0.7960784, 1,
-0.1457004, -0.2396922, -5.040726, 0, 1, 0.8039216, 1,
-0.14355, -0.7359848, -2.571629, 0, 1, 0.8078431, 1,
-0.1410529, 0.0360814, -3.691599, 0, 1, 0.8156863, 1,
-0.1409034, 0.8394233, 0.4228682, 0, 1, 0.8196079, 1,
-0.1404842, -0.04688662, -1.950643, 0, 1, 0.827451, 1,
-0.1378598, -1.423134, -3.184381, 0, 1, 0.8313726, 1,
-0.1335723, 0.1683415, -1.315052, 0, 1, 0.8392157, 1,
-0.133453, 0.5144204, -0.01284853, 0, 1, 0.8431373, 1,
-0.1309699, 1.095695, -0.3233283, 0, 1, 0.8509804, 1,
-0.1306553, -1.001849, -1.910685, 0, 1, 0.854902, 1,
-0.1294686, 0.6353582, -0.5551822, 0, 1, 0.8627451, 1,
-0.1288215, 1.540018, -0.249037, 0, 1, 0.8666667, 1,
-0.1280437, -0.6188098, -3.392118, 0, 1, 0.8745098, 1,
-0.1155354, -1.089822, -4.90328, 0, 1, 0.8784314, 1,
-0.1147642, 0.08334536, 0.9855152, 0, 1, 0.8862745, 1,
-0.1131295, 1.269607, 0.2388513, 0, 1, 0.8901961, 1,
-0.111236, -1.876923, -2.921757, 0, 1, 0.8980392, 1,
-0.110493, -0.07871967, -0.7288019, 0, 1, 0.9058824, 1,
-0.1058517, -0.7233425, -4.123132, 0, 1, 0.9098039, 1,
-0.09739009, -0.5773996, -1.033388, 0, 1, 0.9176471, 1,
-0.0925625, -0.177917, -2.660671, 0, 1, 0.9215686, 1,
-0.08972228, 1.137302, 0.8237144, 0, 1, 0.9294118, 1,
-0.08948452, 0.9383151, -1.266198, 0, 1, 0.9333333, 1,
-0.08817763, -0.1459333, -3.485958, 0, 1, 0.9411765, 1,
-0.08391737, 1.348381, -2.301771, 0, 1, 0.945098, 1,
-0.0837078, -0.3348755, -2.592377, 0, 1, 0.9529412, 1,
-0.0835337, 0.5006154, -0.9321828, 0, 1, 0.9568627, 1,
-0.08000517, -1.303847, -2.784034, 0, 1, 0.9647059, 1,
-0.07606805, -1.412047, -2.907807, 0, 1, 0.9686275, 1,
-0.06050598, 1.22603, 0.5731066, 0, 1, 0.9764706, 1,
-0.05660649, -0.1474712, -3.892054, 0, 1, 0.9803922, 1,
-0.04873731, 1.729181, -0.7438776, 0, 1, 0.9882353, 1,
-0.04654323, 0.3564301, 0.3746889, 0, 1, 0.9921569, 1,
-0.04616067, 0.08984994, -2.187352, 0, 1, 1, 1,
-0.03978974, -0.7340976, -3.766795, 0, 0.9921569, 1, 1,
-0.03511381, 0.06846797, -0.436632, 0, 0.9882353, 1, 1,
-0.03422252, 0.6387956, -0.1756441, 0, 0.9803922, 1, 1,
-0.03260054, -0.985668, -4.322261, 0, 0.9764706, 1, 1,
-0.03171211, -1.117364, -1.429324, 0, 0.9686275, 1, 1,
-0.02973021, 0.4327589, -0.695591, 0, 0.9647059, 1, 1,
-0.02592224, 0.8427374, 0.3466579, 0, 0.9568627, 1, 1,
-0.02496061, 0.2059994, -0.8087042, 0, 0.9529412, 1, 1,
-0.02407553, 0.3520712, -1.049325, 0, 0.945098, 1, 1,
-0.02331237, 0.5708792, -1.563899, 0, 0.9411765, 1, 1,
-0.02016336, 1.504043, -0.2293654, 0, 0.9333333, 1, 1,
-0.02005046, -1.324947, -2.383788, 0, 0.9294118, 1, 1,
-0.009622111, -1.646349, -1.161605, 0, 0.9215686, 1, 1,
-0.008750902, 0.9524518, 2.547168, 0, 0.9176471, 1, 1,
-0.007950521, -0.9815376, -1.294992, 0, 0.9098039, 1, 1,
-0.005695034, -0.3871932, -3.141362, 0, 0.9058824, 1, 1,
-0.005150939, -0.391231, -4.901214, 0, 0.8980392, 1, 1,
-0.005132492, -1.259247, -2.881775, 0, 0.8901961, 1, 1,
-0.005076727, -0.2131944, -3.421473, 0, 0.8862745, 1, 1,
-0.003202198, 0.5992051, 1.174057, 0, 0.8784314, 1, 1,
0.000963658, -0.287157, 2.541959, 0, 0.8745098, 1, 1,
0.00113526, 0.7148933, -0.4721509, 0, 0.8666667, 1, 1,
0.005855629, 0.3964175, -0.7202833, 0, 0.8627451, 1, 1,
0.007465136, 0.4296556, 1.357671, 0, 0.854902, 1, 1,
0.00858608, -0.6800838, 1.731228, 0, 0.8509804, 1, 1,
0.008813981, 1.12408, -0.4636148, 0, 0.8431373, 1, 1,
0.01595064, -1.491497, 4.17371, 0, 0.8392157, 1, 1,
0.01712907, -0.7744389, 3.802694, 0, 0.8313726, 1, 1,
0.01795742, 1.082898, -1.341965, 0, 0.827451, 1, 1,
0.01981593, -1.289185, 6.043887, 0, 0.8196079, 1, 1,
0.02091802, 2.044669, -1.378019, 0, 0.8156863, 1, 1,
0.02332596, 1.095184, -1.617275, 0, 0.8078431, 1, 1,
0.03323999, 1.382905, 0.4611785, 0, 0.8039216, 1, 1,
0.03888814, -1.146887, 4.050264, 0, 0.7960784, 1, 1,
0.04371773, -0.1258308, 3.390323, 0, 0.7882353, 1, 1,
0.04950045, -0.1246287, 0.9403719, 0, 0.7843137, 1, 1,
0.05118259, 0.636867, 0.835493, 0, 0.7764706, 1, 1,
0.0601759, 0.7490333, 0.1983282, 0, 0.772549, 1, 1,
0.06529365, 1.203665, 0.5193799, 0, 0.7647059, 1, 1,
0.06983527, -0.7804505, 3.759146, 0, 0.7607843, 1, 1,
0.07018992, 0.2741579, -0.1636202, 0, 0.7529412, 1, 1,
0.07218117, -0.5445394, 1.95676, 0, 0.7490196, 1, 1,
0.08036245, -0.2508389, 2.816628, 0, 0.7411765, 1, 1,
0.08273354, -0.7999647, 1.725734, 0, 0.7372549, 1, 1,
0.08588263, 0.4569789, -1.414685, 0, 0.7294118, 1, 1,
0.08629283, -0.3607875, 1.72105, 0, 0.7254902, 1, 1,
0.08989532, 0.5647178, 0.3341789, 0, 0.7176471, 1, 1,
0.09656634, -1.072223, 1.076997, 0, 0.7137255, 1, 1,
0.0988036, -0.8431562, 2.1182, 0, 0.7058824, 1, 1,
0.09935647, -0.1157069, 2.798973, 0, 0.6980392, 1, 1,
0.09937013, -1.371371, 2.420527, 0, 0.6941177, 1, 1,
0.1024938, -0.6328695, 3.893658, 0, 0.6862745, 1, 1,
0.1078484, 0.7365673, -0.03978796, 0, 0.682353, 1, 1,
0.1108232, 2.488906, -0.4826075, 0, 0.6745098, 1, 1,
0.1121568, 0.5550337, -1.091851, 0, 0.6705883, 1, 1,
0.1132503, -0.9411533, 0.6910724, 0, 0.6627451, 1, 1,
0.1149023, -0.874652, 2.456357, 0, 0.6588235, 1, 1,
0.1232978, 0.792712, -1.463347, 0, 0.6509804, 1, 1,
0.1262324, 0.8976125, -0.9062141, 0, 0.6470588, 1, 1,
0.1284202, -0.2404044, 3.350205, 0, 0.6392157, 1, 1,
0.1337176, -0.7811207, 1.92257, 0, 0.6352941, 1, 1,
0.1342921, -0.4526053, 3.037243, 0, 0.627451, 1, 1,
0.1362682, -0.424303, 3.465852, 0, 0.6235294, 1, 1,
0.146235, -2.384948, 4.06191, 0, 0.6156863, 1, 1,
0.1466568, 1.508183, -1.177967, 0, 0.6117647, 1, 1,
0.1498822, 1.40048, 0.1454121, 0, 0.6039216, 1, 1,
0.1500882, -0.1244454, 0.2617995, 0, 0.5960785, 1, 1,
0.1505617, 0.8073903, 0.4900446, 0, 0.5921569, 1, 1,
0.1520185, -0.1086108, 1.621391, 0, 0.5843138, 1, 1,
0.1528695, -1.722066, 2.490875, 0, 0.5803922, 1, 1,
0.1541155, 0.7188378, 0.4819866, 0, 0.572549, 1, 1,
0.1626848, -1.300316, 3.989811, 0, 0.5686275, 1, 1,
0.1671363, 1.073131, -0.7477828, 0, 0.5607843, 1, 1,
0.1675846, 0.1937636, 1.047735, 0, 0.5568628, 1, 1,
0.1737899, 0.06773426, 0.8606304, 0, 0.5490196, 1, 1,
0.1743905, 0.5156629, -0.9093648, 0, 0.5450981, 1, 1,
0.1794473, -0.6983199, 0.5053677, 0, 0.5372549, 1, 1,
0.1805778, -0.9961089, 3.419071, 0, 0.5333334, 1, 1,
0.1824818, -0.2745304, 2.112087, 0, 0.5254902, 1, 1,
0.1871869, 0.582786, -1.332131, 0, 0.5215687, 1, 1,
0.1885174, -0.2630765, 2.562371, 0, 0.5137255, 1, 1,
0.1895308, -2.09066, 2.874149, 0, 0.509804, 1, 1,
0.1964363, -0.4208615, 3.346275, 0, 0.5019608, 1, 1,
0.1988576, -0.1220153, 0.4546935, 0, 0.4941176, 1, 1,
0.1995498, -0.8149659, 4.090465, 0, 0.4901961, 1, 1,
0.2091831, -1.246134, 2.933908, 0, 0.4823529, 1, 1,
0.2132471, 1.12102, 0.5156022, 0, 0.4784314, 1, 1,
0.2138154, 3.111804, -1.323765, 0, 0.4705882, 1, 1,
0.2142178, 1.018618, 0.2359169, 0, 0.4666667, 1, 1,
0.2147211, 0.5046363, -1.07387, 0, 0.4588235, 1, 1,
0.2173102, 0.1476458, 1.217295, 0, 0.454902, 1, 1,
0.2174498, -1.784426, 2.394803, 0, 0.4470588, 1, 1,
0.2238002, -0.3396705, 2.64809, 0, 0.4431373, 1, 1,
0.2240502, 0.9830009, 1.922539, 0, 0.4352941, 1, 1,
0.2271203, 1.09456, 0.218012, 0, 0.4313726, 1, 1,
0.2274466, -0.5748814, 1.604437, 0, 0.4235294, 1, 1,
0.2308253, -0.3119359, 2.811108, 0, 0.4196078, 1, 1,
0.2377856, -0.03771171, 0.4558024, 0, 0.4117647, 1, 1,
0.238608, 0.08357462, -0.440949, 0, 0.4078431, 1, 1,
0.246035, -0.3843222, 3.50616, 0, 0.4, 1, 1,
0.246123, 0.4488429, 0.3277782, 0, 0.3921569, 1, 1,
0.2469056, 0.5364081, -0.6158184, 0, 0.3882353, 1, 1,
0.2479591, -3.014031, 3.791532, 0, 0.3803922, 1, 1,
0.2481086, -0.5583698, 3.763665, 0, 0.3764706, 1, 1,
0.2496885, -0.4088633, 3.042424, 0, 0.3686275, 1, 1,
0.256319, -0.6233778, 3.022256, 0, 0.3647059, 1, 1,
0.2564172, -0.8567753, 4.296221, 0, 0.3568628, 1, 1,
0.2575226, -0.01293765, 2.727778, 0, 0.3529412, 1, 1,
0.2576158, -0.5669176, 1.82393, 0, 0.345098, 1, 1,
0.2597405, 0.6189477, -0.6264127, 0, 0.3411765, 1, 1,
0.2598337, 0.03011985, 0.3018415, 0, 0.3333333, 1, 1,
0.2605627, -2.240918, 3.843044, 0, 0.3294118, 1, 1,
0.2612808, -0.2240559, 3.610795, 0, 0.3215686, 1, 1,
0.2677293, 0.6816728, 0.8610101, 0, 0.3176471, 1, 1,
0.2732424, -0.847815, 1.429507, 0, 0.3098039, 1, 1,
0.2767629, 0.002695561, 3.580196, 0, 0.3058824, 1, 1,
0.2829544, 0.5086689, -1.957113, 0, 0.2980392, 1, 1,
0.284297, -0.6873663, 3.965592, 0, 0.2901961, 1, 1,
0.2945803, -0.747853, 2.467479, 0, 0.2862745, 1, 1,
0.3035528, -0.005798812, 3.217438, 0, 0.2784314, 1, 1,
0.3037142, 0.001288684, 0.5260659, 0, 0.2745098, 1, 1,
0.3086889, 0.2291189, 1.2464, 0, 0.2666667, 1, 1,
0.3165357, 0.009930232, 1.527817, 0, 0.2627451, 1, 1,
0.3173661, 0.1210689, 0.4424555, 0, 0.254902, 1, 1,
0.3203555, -0.9370928, 2.323357, 0, 0.2509804, 1, 1,
0.3205736, -0.8384773, 2.214232, 0, 0.2431373, 1, 1,
0.3207591, -0.09650625, 1.803454, 0, 0.2392157, 1, 1,
0.3240223, 0.6369392, 0.6221915, 0, 0.2313726, 1, 1,
0.3240615, -0.7927969, 2.757843, 0, 0.227451, 1, 1,
0.3247612, -0.854696, 3.108598, 0, 0.2196078, 1, 1,
0.3265748, -0.8268861, 1.205289, 0, 0.2156863, 1, 1,
0.3271637, -1.010652, 3.397077, 0, 0.2078431, 1, 1,
0.3344897, 2.392869, 0.193531, 0, 0.2039216, 1, 1,
0.3345807, -1.920672, 3.097745, 0, 0.1960784, 1, 1,
0.3349768, -1.767334, 3.086752, 0, 0.1882353, 1, 1,
0.3428469, -0.1825554, 2.048795, 0, 0.1843137, 1, 1,
0.3441404, 0.1992392, 1.022577, 0, 0.1764706, 1, 1,
0.3470239, -0.8106708, 1.057394, 0, 0.172549, 1, 1,
0.3501891, -0.3291175, 2.777937, 0, 0.1647059, 1, 1,
0.3527113, 0.3609629, 1.646869, 0, 0.1607843, 1, 1,
0.3528696, -0.4259433, 2.2216, 0, 0.1529412, 1, 1,
0.354779, -0.01001585, -0.1980861, 0, 0.1490196, 1, 1,
0.3613477, 0.424716, -0.8101315, 0, 0.1411765, 1, 1,
0.3669672, -0.4107983, 0.8446369, 0, 0.1372549, 1, 1,
0.3688916, -0.8410968, 2.376409, 0, 0.1294118, 1, 1,
0.3717358, 0.7823184, -0.8491126, 0, 0.1254902, 1, 1,
0.3718444, 0.3571047, 0.6170107, 0, 0.1176471, 1, 1,
0.3730458, 1.639914, -0.2506217, 0, 0.1137255, 1, 1,
0.3773558, 0.8623836, 0.07828348, 0, 0.1058824, 1, 1,
0.3828155, -0.1296085, 1.503834, 0, 0.09803922, 1, 1,
0.3871807, -0.7982306, 3.406734, 0, 0.09411765, 1, 1,
0.3885152, -0.6915154, 1.949312, 0, 0.08627451, 1, 1,
0.390234, 1.723966, -0.7272375, 0, 0.08235294, 1, 1,
0.3924281, -0.7313348, 3.495091, 0, 0.07450981, 1, 1,
0.3955211, -0.389656, 1.395206, 0, 0.07058824, 1, 1,
0.3973809, 1.487255, 0.4030396, 0, 0.0627451, 1, 1,
0.3975615, -0.0543001, 1.420683, 0, 0.05882353, 1, 1,
0.398085, -0.2833277, 1.126959, 0, 0.05098039, 1, 1,
0.3981646, -0.5764504, 2.199113, 0, 0.04705882, 1, 1,
0.3985727, 0.6828229, -0.9093812, 0, 0.03921569, 1, 1,
0.4012617, -0.3323582, 1.502033, 0, 0.03529412, 1, 1,
0.4024333, 0.1301304, 1.562874, 0, 0.02745098, 1, 1,
0.4046831, 2.190633, 0.3632566, 0, 0.02352941, 1, 1,
0.4111942, 0.1104141, 2.609581, 0, 0.01568628, 1, 1,
0.4113721, 0.3732203, 1.409639, 0, 0.01176471, 1, 1,
0.4114257, -1.542848, 2.350847, 0, 0.003921569, 1, 1,
0.4122951, 0.9815385, 0.7204769, 0.003921569, 0, 1, 1,
0.415836, 0.2451672, 1.832803, 0.007843138, 0, 1, 1,
0.4172131, -0.3656382, 4.061263, 0.01568628, 0, 1, 1,
0.4217235, 1.893745, -0.589593, 0.01960784, 0, 1, 1,
0.4380682, 1.021074, -1.148716, 0.02745098, 0, 1, 1,
0.4380994, -0.9100801, 2.199799, 0.03137255, 0, 1, 1,
0.4442576, -0.5247191, 2.951241, 0.03921569, 0, 1, 1,
0.4443342, 1.289349, 0.1791067, 0.04313726, 0, 1, 1,
0.4489207, 0.06815845, 2.209206, 0.05098039, 0, 1, 1,
0.4496756, -0.07744382, 0.2181621, 0.05490196, 0, 1, 1,
0.4504258, 0.6708411, 1.832694, 0.0627451, 0, 1, 1,
0.4586065, -0.5884387, 0.4328001, 0.06666667, 0, 1, 1,
0.4586714, -0.2931401, 3.312385, 0.07450981, 0, 1, 1,
0.4640141, -0.6723405, 4.557564, 0.07843138, 0, 1, 1,
0.4646278, -1.056872, 2.361651, 0.08627451, 0, 1, 1,
0.466165, 2.134009, 0.8365225, 0.09019608, 0, 1, 1,
0.4743908, -0.5160227, 2.455899, 0.09803922, 0, 1, 1,
0.4745865, -0.3379409, 1.255102, 0.1058824, 0, 1, 1,
0.4756876, -1.975705, 3.211174, 0.1098039, 0, 1, 1,
0.4761404, -0.1572493, 2.749019, 0.1176471, 0, 1, 1,
0.4782613, -1.076977, 3.175507, 0.1215686, 0, 1, 1,
0.4794455, -1.503732, 3.41842, 0.1294118, 0, 1, 1,
0.4918763, -1.827332, 1.308575, 0.1333333, 0, 1, 1,
0.4996772, 1.232166, -0.5522973, 0.1411765, 0, 1, 1,
0.5004303, -0.3634955, 1.490247, 0.145098, 0, 1, 1,
0.5006837, -1.243505, 2.255208, 0.1529412, 0, 1, 1,
0.5096142, 0.3355205, 0.9233844, 0.1568628, 0, 1, 1,
0.5112652, 0.03720957, 2.179448, 0.1647059, 0, 1, 1,
0.5115372, -2.227947, 2.367414, 0.1686275, 0, 1, 1,
0.5154188, -1.55055, 2.842934, 0.1764706, 0, 1, 1,
0.5157241, 0.1383472, 1.810338, 0.1803922, 0, 1, 1,
0.5165833, 1.379018, -0.1781659, 0.1882353, 0, 1, 1,
0.5202987, 0.08288018, 1.435044, 0.1921569, 0, 1, 1,
0.5219174, -1.160066, 4.674137, 0.2, 0, 1, 1,
0.5251058, 0.1452333, 1.329674, 0.2078431, 0, 1, 1,
0.525911, -1.202149, 2.277278, 0.2117647, 0, 1, 1,
0.5263299, -0.3747677, 3.686555, 0.2196078, 0, 1, 1,
0.5309464, 1.656202, -0.03209262, 0.2235294, 0, 1, 1,
0.5325964, -0.9154017, 1.571745, 0.2313726, 0, 1, 1,
0.5374532, 0.3322087, 1.370665, 0.2352941, 0, 1, 1,
0.537738, -0.4079804, 2.955035, 0.2431373, 0, 1, 1,
0.5423132, -0.5455446, 2.142389, 0.2470588, 0, 1, 1,
0.5430103, 0.8153501, 0.3187513, 0.254902, 0, 1, 1,
0.5473952, 0.09075014, 1.327615, 0.2588235, 0, 1, 1,
0.5484089, -0.6704878, 1.326499, 0.2666667, 0, 1, 1,
0.5506599, -0.4064697, 2.787084, 0.2705882, 0, 1, 1,
0.5521176, 0.4919619, 2.38836, 0.2784314, 0, 1, 1,
0.5526569, -1.861215, 3.850882, 0.282353, 0, 1, 1,
0.552828, -1.550142, 3.758739, 0.2901961, 0, 1, 1,
0.5545918, -0.2926502, 1.709659, 0.2941177, 0, 1, 1,
0.555474, -0.5080756, 1.065608, 0.3019608, 0, 1, 1,
0.5612517, 1.413416, 1.060349, 0.3098039, 0, 1, 1,
0.5671394, 0.04955123, 1.919147, 0.3137255, 0, 1, 1,
0.5710523, -0.9448552, 3.400271, 0.3215686, 0, 1, 1,
0.5723169, 0.1837863, 0.7366171, 0.3254902, 0, 1, 1,
0.5800725, 0.2384487, 1.711013, 0.3333333, 0, 1, 1,
0.5947704, -2.697407, 0.7196103, 0.3372549, 0, 1, 1,
0.5949989, 0.2958763, 1.16017, 0.345098, 0, 1, 1,
0.5986311, 1.204016, 1.498353, 0.3490196, 0, 1, 1,
0.5987051, 0.6672247, 0.652799, 0.3568628, 0, 1, 1,
0.609001, -1.043246, 0.2988006, 0.3607843, 0, 1, 1,
0.613724, 0.1336428, 1.064627, 0.3686275, 0, 1, 1,
0.6147137, 0.4203836, 0.3563372, 0.372549, 0, 1, 1,
0.6160759, 1.105708, -0.4438361, 0.3803922, 0, 1, 1,
0.6178371, -1.047376, 3.39349, 0.3843137, 0, 1, 1,
0.6195519, 1.26474, -0.4169917, 0.3921569, 0, 1, 1,
0.6204414, 1.362879, -0.4204288, 0.3960784, 0, 1, 1,
0.6234587, 0.9208139, 0.3373269, 0.4039216, 0, 1, 1,
0.6338801, -0.358695, 1.024949, 0.4117647, 0, 1, 1,
0.642555, 0.589306, 0.7536393, 0.4156863, 0, 1, 1,
0.6456866, -2.623703, 3.606831, 0.4235294, 0, 1, 1,
0.6473484, -0.1281218, 2.330921, 0.427451, 0, 1, 1,
0.6506909, -0.09360712, 1.105935, 0.4352941, 0, 1, 1,
0.6536838, 2.301094, -0.2933137, 0.4392157, 0, 1, 1,
0.6555684, -0.1982314, 2.680984, 0.4470588, 0, 1, 1,
0.6641255, 0.4212631, 2.623686, 0.4509804, 0, 1, 1,
0.6685194, -1.479892, 3.632907, 0.4588235, 0, 1, 1,
0.6686681, 1.418466, 0.952975, 0.4627451, 0, 1, 1,
0.6704075, -0.7027608, 4.35168, 0.4705882, 0, 1, 1,
0.6707017, 0.6693673, 0.110438, 0.4745098, 0, 1, 1,
0.6719421, -0.1697573, 2.615298, 0.4823529, 0, 1, 1,
0.6725765, -0.4604747, 2.643945, 0.4862745, 0, 1, 1,
0.6767887, 0.3078678, 1.49951, 0.4941176, 0, 1, 1,
0.6814689, -0.3403079, 1.635128, 0.5019608, 0, 1, 1,
0.6864774, 2.197036, 1.370885, 0.5058824, 0, 1, 1,
0.6914369, -0.7438297, 2.053928, 0.5137255, 0, 1, 1,
0.698922, 1.536618, 0.3486326, 0.5176471, 0, 1, 1,
0.7010856, 0.6261984, -0.2915242, 0.5254902, 0, 1, 1,
0.7057902, 1.133942, 0.3889256, 0.5294118, 0, 1, 1,
0.706256, -0.7384176, 2.878559, 0.5372549, 0, 1, 1,
0.7170893, -0.4115058, 2.048561, 0.5411765, 0, 1, 1,
0.7171884, 1.217789, -0.3022727, 0.5490196, 0, 1, 1,
0.7184266, -1.959183, 3.242045, 0.5529412, 0, 1, 1,
0.7234552, -0.03412177, 1.448058, 0.5607843, 0, 1, 1,
0.7242353, -0.3176523, 3.648685, 0.5647059, 0, 1, 1,
0.7242646, -1.413038, 2.593583, 0.572549, 0, 1, 1,
0.7325318, -0.5049061, 0.9633076, 0.5764706, 0, 1, 1,
0.7331682, -0.6076183, 2.995387, 0.5843138, 0, 1, 1,
0.7337449, -0.4061624, -0.3581392, 0.5882353, 0, 1, 1,
0.7370186, 1.420676, 1.402708, 0.5960785, 0, 1, 1,
0.7394897, 1.387548, 1.050759, 0.6039216, 0, 1, 1,
0.744241, -0.7717512, 1.706339, 0.6078432, 0, 1, 1,
0.7521158, 0.7401971, 0.7942665, 0.6156863, 0, 1, 1,
0.7533028, -1.152069, 2.129239, 0.6196079, 0, 1, 1,
0.7553617, 0.02515824, 1.080587, 0.627451, 0, 1, 1,
0.7568558, -0.1023812, 1.12413, 0.6313726, 0, 1, 1,
0.7599856, 0.1235499, 2.162324, 0.6392157, 0, 1, 1,
0.7626037, -0.04429607, 1.451641, 0.6431373, 0, 1, 1,
0.7639578, 0.08521099, 0.8545352, 0.6509804, 0, 1, 1,
0.7672918, -0.5506302, 3.365454, 0.654902, 0, 1, 1,
0.7683003, 0.7885311, 1.68246, 0.6627451, 0, 1, 1,
0.7723626, 0.1487843, -0.8546312, 0.6666667, 0, 1, 1,
0.7738441, -0.3697313, 3.314653, 0.6745098, 0, 1, 1,
0.7775245, 0.4603074, 1.080911, 0.6784314, 0, 1, 1,
0.7862036, -0.2505873, 1.186311, 0.6862745, 0, 1, 1,
0.7939492, -0.5124692, 2.0174, 0.6901961, 0, 1, 1,
0.7959937, -0.463466, 3.487098, 0.6980392, 0, 1, 1,
0.7963197, 0.00746174, 1.891832, 0.7058824, 0, 1, 1,
0.808621, 1.223212, 1.454877, 0.7098039, 0, 1, 1,
0.8115306, -0.2121843, 3.098237, 0.7176471, 0, 1, 1,
0.8135549, 0.1045315, 0.9536713, 0.7215686, 0, 1, 1,
0.8172889, -0.08145851, 1.865369, 0.7294118, 0, 1, 1,
0.8209305, -2.104044, 3.49368, 0.7333333, 0, 1, 1,
0.823587, 0.4783399, -0.3097255, 0.7411765, 0, 1, 1,
0.8238928, 2.8923, -1.302507, 0.7450981, 0, 1, 1,
0.8268441, 1.36671, -1.414638, 0.7529412, 0, 1, 1,
0.8301042, 0.9267121, 2.212395, 0.7568628, 0, 1, 1,
0.831311, -1.134726, 2.192011, 0.7647059, 0, 1, 1,
0.831648, -0.1641481, 1.873939, 0.7686275, 0, 1, 1,
0.8349714, -1.381279, 4.413994, 0.7764706, 0, 1, 1,
0.8417969, 0.01361563, 1.834378, 0.7803922, 0, 1, 1,
0.8454411, -0.05944996, 1.751366, 0.7882353, 0, 1, 1,
0.848462, 0.435018, 2.406574, 0.7921569, 0, 1, 1,
0.8490776, -0.5077221, 3.084095, 0.8, 0, 1, 1,
0.8513702, -0.6940621, 1.587994, 0.8078431, 0, 1, 1,
0.851782, 1.138925, 0.8354252, 0.8117647, 0, 1, 1,
0.8570271, -0.1565939, 0.3948711, 0.8196079, 0, 1, 1,
0.8574415, 0.5972274, -0.04689622, 0.8235294, 0, 1, 1,
0.863633, 0.6253646, -0.4682019, 0.8313726, 0, 1, 1,
0.8688685, 1.973217, 0.9242682, 0.8352941, 0, 1, 1,
0.871921, -0.2870411, 2.337457, 0.8431373, 0, 1, 1,
0.8748055, 1.205176, 0.1480697, 0.8470588, 0, 1, 1,
0.8778816, -0.141425, 1.330669, 0.854902, 0, 1, 1,
0.8809531, 0.6481849, 1.217811, 0.8588235, 0, 1, 1,
0.8846943, -1.846532, 3.356622, 0.8666667, 0, 1, 1,
0.8895144, 0.2786279, 0.05015088, 0.8705882, 0, 1, 1,
0.895698, -0.7558935, 0.6475347, 0.8784314, 0, 1, 1,
0.90262, -1.207705, 0.5549973, 0.8823529, 0, 1, 1,
0.9032554, 0.3646057, 1.103267, 0.8901961, 0, 1, 1,
0.9067628, -0.8074591, 2.776916, 0.8941177, 0, 1, 1,
0.9138593, -2.133785, 2.349778, 0.9019608, 0, 1, 1,
0.9152359, 1.007599, 1.548926, 0.9098039, 0, 1, 1,
0.918467, -0.4858527, 0.9049892, 0.9137255, 0, 1, 1,
0.9248583, 1.551603, 0.8456253, 0.9215686, 0, 1, 1,
0.9299404, 0.7754621, 1.746611, 0.9254902, 0, 1, 1,
0.9331034, -1.837878, 3.548353, 0.9333333, 0, 1, 1,
0.9374475, -1.484574, 1.47531, 0.9372549, 0, 1, 1,
0.9377253, -0.7837929, 1.559096, 0.945098, 0, 1, 1,
0.9427507, 0.363605, 0.478828, 0.9490196, 0, 1, 1,
0.945958, 1.034441, -0.2573877, 0.9568627, 0, 1, 1,
0.9469987, 0.0215215, 1.648962, 0.9607843, 0, 1, 1,
0.9535918, 0.8180999, 1.464098, 0.9686275, 0, 1, 1,
0.9545721, -3.161147, 5.688768, 0.972549, 0, 1, 1,
0.9618318, -0.8736018, 1.318779, 0.9803922, 0, 1, 1,
0.9647305, 0.6320941, 1.613938, 0.9843137, 0, 1, 1,
0.9748294, 0.271907, 1.05964, 0.9921569, 0, 1, 1,
0.9815031, -0.6939244, -0.4300084, 0.9960784, 0, 1, 1,
0.9822298, -1.628477, 1.935033, 1, 0, 0.9960784, 1,
0.9872328, 0.8356069, 0.6442378, 1, 0, 0.9882353, 1,
0.9894513, -1.115267, 2.530132, 1, 0, 0.9843137, 1,
0.9919809, -2.091041, 2.050454, 1, 0, 0.9764706, 1,
0.9930717, 0.08533222, 3.043367, 1, 0, 0.972549, 1,
0.9955097, 0.001277742, 1.463352, 1, 0, 0.9647059, 1,
0.996771, -0.2934576, 2.652099, 1, 0, 0.9607843, 1,
0.9967808, 1.949657, -0.850157, 1, 0, 0.9529412, 1,
0.9970189, -0.3061636, 2.143316, 1, 0, 0.9490196, 1,
1.000905, -0.1074122, 1.353621, 1, 0, 0.9411765, 1,
1.006821, 0.001168068, 1.94216, 1, 0, 0.9372549, 1,
1.008879, 0.7599772, 1.477646, 1, 0, 0.9294118, 1,
1.008985, 0.3091981, 2.1788, 1, 0, 0.9254902, 1,
1.009195, 0.5954761, 1.10325, 1, 0, 0.9176471, 1,
1.011403, -1.151419, 2.06052, 1, 0, 0.9137255, 1,
1.012934, 0.6877025, 2.408636, 1, 0, 0.9058824, 1,
1.013166, -1.06392, 1.432261, 1, 0, 0.9019608, 1,
1.024995, 0.6685849, 1.442328, 1, 0, 0.8941177, 1,
1.035777, 0.3240703, 0.01273967, 1, 0, 0.8862745, 1,
1.035904, -1.832813, 4.215508, 1, 0, 0.8823529, 1,
1.039482, -0.1372886, 2.381056, 1, 0, 0.8745098, 1,
1.047261, 0.1717177, 0.3292958, 1, 0, 0.8705882, 1,
1.053039, 0.9642034, -0.02594672, 1, 0, 0.8627451, 1,
1.055333, 0.04575837, 0.3434651, 1, 0, 0.8588235, 1,
1.057616, 0.8140228, 0.6217802, 1, 0, 0.8509804, 1,
1.067808, -0.2158516, 2.902275, 1, 0, 0.8470588, 1,
1.070599, -0.5591407, 1.729632, 1, 0, 0.8392157, 1,
1.075587, -0.759043, 1.400185, 1, 0, 0.8352941, 1,
1.078482, 1.434287, 0.6143345, 1, 0, 0.827451, 1,
1.079986, 0.9110491, 3.54521, 1, 0, 0.8235294, 1,
1.081887, -0.6821785, 2.843147, 1, 0, 0.8156863, 1,
1.083499, 1.582468, 1.134968, 1, 0, 0.8117647, 1,
1.085608, -0.02814889, 2.37345, 1, 0, 0.8039216, 1,
1.087778, -0.1280269, -0.3800893, 1, 0, 0.7960784, 1,
1.106412, 0.1192735, 1.346935, 1, 0, 0.7921569, 1,
1.106413, -0.03861661, 1.300503, 1, 0, 0.7843137, 1,
1.112803, -2.207387, 1.31367, 1, 0, 0.7803922, 1,
1.124014, 1.539333, -0.7525213, 1, 0, 0.772549, 1,
1.12633, -0.8569936, 1.322864, 1, 0, 0.7686275, 1,
1.128508, -1.209043, 3.660951, 1, 0, 0.7607843, 1,
1.12992, -2.420134, 4.310177, 1, 0, 0.7568628, 1,
1.131863, 0.4107741, 0.5656144, 1, 0, 0.7490196, 1,
1.133162, 0.1057589, 1.497326, 1, 0, 0.7450981, 1,
1.133321, -1.039549, 0.8974442, 1, 0, 0.7372549, 1,
1.133871, -0.1342809, 3.421839, 1, 0, 0.7333333, 1,
1.142497, 0.09900766, 1.441265, 1, 0, 0.7254902, 1,
1.146242, 3.166361, 1.219941, 1, 0, 0.7215686, 1,
1.146284, -0.865383, 3.566524, 1, 0, 0.7137255, 1,
1.146711, 0.05562928, 1.992265, 1, 0, 0.7098039, 1,
1.158193, 1.20743, 1.949802, 1, 0, 0.7019608, 1,
1.166105, -0.53816, 2.435288, 1, 0, 0.6941177, 1,
1.174399, -0.1764235, 1.772337, 1, 0, 0.6901961, 1,
1.174617, -0.812665, 2.601536, 1, 0, 0.682353, 1,
1.176471, 0.1332949, 0.8316337, 1, 0, 0.6784314, 1,
1.177412, -0.06594531, 0.3147689, 1, 0, 0.6705883, 1,
1.178071, 0.294727, 1.141201, 1, 0, 0.6666667, 1,
1.180877, 1.08923, 0.8450596, 1, 0, 0.6588235, 1,
1.18559, -0.1668507, 2.116037, 1, 0, 0.654902, 1,
1.189866, 0.2044807, 2.226642, 1, 0, 0.6470588, 1,
1.21681, -1.071093, 2.447796, 1, 0, 0.6431373, 1,
1.233054, -1.033484, 2.986716, 1, 0, 0.6352941, 1,
1.236717, -1.338293, 3.496742, 1, 0, 0.6313726, 1,
1.246071, -0.3006107, 1.425015, 1, 0, 0.6235294, 1,
1.248523, -0.1633338, 1.670305, 1, 0, 0.6196079, 1,
1.250713, 0.01488725, 1.068003, 1, 0, 0.6117647, 1,
1.255994, 2.381096, 0.3440937, 1, 0, 0.6078432, 1,
1.257668, -0.05464953, 1.657214, 1, 0, 0.6, 1,
1.274333, 1.104582, 1.837658, 1, 0, 0.5921569, 1,
1.277928, 1.61678, 2.756568, 1, 0, 0.5882353, 1,
1.278331, 0.7543204, 1.435207, 1, 0, 0.5803922, 1,
1.278495, 0.775452, 2.661003, 1, 0, 0.5764706, 1,
1.2802, 0.333783, 2.099627, 1, 0, 0.5686275, 1,
1.285854, 0.1065737, 0.6728181, 1, 0, 0.5647059, 1,
1.286791, 0.1146776, 2.075938, 1, 0, 0.5568628, 1,
1.296372, 0.7801411, 0.6471378, 1, 0, 0.5529412, 1,
1.296378, -0.6646422, 3.168098, 1, 0, 0.5450981, 1,
1.312966, 0.4232977, 1.137749, 1, 0, 0.5411765, 1,
1.313658, 0.8389035, 0.5868253, 1, 0, 0.5333334, 1,
1.318376, 0.6481471, 0.7534553, 1, 0, 0.5294118, 1,
1.328752, -0.7708622, 2.239753, 1, 0, 0.5215687, 1,
1.339196, 0.3554667, 1.034543, 1, 0, 0.5176471, 1,
1.35752, 0.8533252, 2.958862, 1, 0, 0.509804, 1,
1.361123, -0.3617066, 1.772352, 1, 0, 0.5058824, 1,
1.379194, 0.8217723, -0.03384487, 1, 0, 0.4980392, 1,
1.38162, -1.007608, 1.754153, 1, 0, 0.4901961, 1,
1.403214, 0.7056468, -0.4761722, 1, 0, 0.4862745, 1,
1.403848, 0.08461776, 1.868691, 1, 0, 0.4784314, 1,
1.406078, -0.8644022, -0.7116779, 1, 0, 0.4745098, 1,
1.411032, 1.895407, 0.3993748, 1, 0, 0.4666667, 1,
1.417446, -0.3558796, 0.6113036, 1, 0, 0.4627451, 1,
1.430129, -0.7375063, 1.177603, 1, 0, 0.454902, 1,
1.437005, -0.6802217, 3.275294, 1, 0, 0.4509804, 1,
1.439174, -1.52429, 1.611976, 1, 0, 0.4431373, 1,
1.445799, 0.6583676, 3.012884, 1, 0, 0.4392157, 1,
1.446088, 0.4559112, 1.708187, 1, 0, 0.4313726, 1,
1.452356, -0.696559, 2.420233, 1, 0, 0.427451, 1,
1.460729, 0.2134892, 2.463278, 1, 0, 0.4196078, 1,
1.465746, -0.5865005, 0.3729349, 1, 0, 0.4156863, 1,
1.473144, 0.00491508, 1.294332, 1, 0, 0.4078431, 1,
1.474518, 0.7341418, 1.44172, 1, 0, 0.4039216, 1,
1.476749, 1.273889, 1.802179, 1, 0, 0.3960784, 1,
1.498945, 0.7668439, 1.947817, 1, 0, 0.3882353, 1,
1.510275, -0.8806257, 0.8093854, 1, 0, 0.3843137, 1,
1.524577, -0.03257312, 3.316281, 1, 0, 0.3764706, 1,
1.531362, 0.6947163, 1.486781, 1, 0, 0.372549, 1,
1.546885, 0.8663967, 1.761979, 1, 0, 0.3647059, 1,
1.565284, 2.129797, 2.257347, 1, 0, 0.3607843, 1,
1.620296, -0.5104995, 3.569214, 1, 0, 0.3529412, 1,
1.628576, 3.025779, -0.3064698, 1, 0, 0.3490196, 1,
1.636221, 0.04028769, 0.4984914, 1, 0, 0.3411765, 1,
1.64147, -0.9321821, 3.064631, 1, 0, 0.3372549, 1,
1.657364, 0.04471815, 2.145345, 1, 0, 0.3294118, 1,
1.664732, -0.3716148, 0.9329807, 1, 0, 0.3254902, 1,
1.666005, 0.3558318, 0.9322751, 1, 0, 0.3176471, 1,
1.687352, -0.7946846, 2.490428, 1, 0, 0.3137255, 1,
1.695128, -0.27705, 1.149324, 1, 0, 0.3058824, 1,
1.70315, -1.160738, 2.136564, 1, 0, 0.2980392, 1,
1.710046, -0.5146785, 1.325531, 1, 0, 0.2941177, 1,
1.721992, -0.265693, 1.0028, 1, 0, 0.2862745, 1,
1.738971, -1.897452, 3.084233, 1, 0, 0.282353, 1,
1.753236, 0.1613855, 0.660661, 1, 0, 0.2745098, 1,
1.765369, -0.668248, 1.917624, 1, 0, 0.2705882, 1,
1.802032, -1.192201, 2.009392, 1, 0, 0.2627451, 1,
1.809887, 0.9244074, 1.451802, 1, 0, 0.2588235, 1,
1.811796, -1.503078, 4.215849, 1, 0, 0.2509804, 1,
1.819152, -1.440369, 3.174652, 1, 0, 0.2470588, 1,
1.840829, 0.05969024, 3.120627, 1, 0, 0.2392157, 1,
1.841442, -1.135406, 1.382745, 1, 0, 0.2352941, 1,
1.842466, 1.289297, -0.2631841, 1, 0, 0.227451, 1,
1.843668, -1.653972, 0.9579264, 1, 0, 0.2235294, 1,
1.848636, -1.175775, 3.354834, 1, 0, 0.2156863, 1,
1.881955, -1.515938, 2.029275, 1, 0, 0.2117647, 1,
1.914226, -1.198507, 4.132905, 1, 0, 0.2039216, 1,
1.932804, -0.8832451, 1.87307, 1, 0, 0.1960784, 1,
1.934812, 0.5527434, 1.442551, 1, 0, 0.1921569, 1,
1.941743, 0.1819706, 3.919321, 1, 0, 0.1843137, 1,
1.945391, 1.052274, 0.3850834, 1, 0, 0.1803922, 1,
1.963721, -2.345169, 3.100902, 1, 0, 0.172549, 1,
1.966023, -0.329621, 1.792852, 1, 0, 0.1686275, 1,
1.9725, 0.6318278, 2.047811, 1, 0, 0.1607843, 1,
1.983802, 0.305305, -0.3860664, 1, 0, 0.1568628, 1,
1.99955, 0.84492, 2.384975, 1, 0, 0.1490196, 1,
2.005898, -2.035761, 3.867332, 1, 0, 0.145098, 1,
2.007362, 1.802196, 1.374001, 1, 0, 0.1372549, 1,
2.009496, -0.1695721, 1.315214, 1, 0, 0.1333333, 1,
2.015512, -0.1641989, 2.209464, 1, 0, 0.1254902, 1,
2.026174, 0.7263547, 1.585818, 1, 0, 0.1215686, 1,
2.030126, -2.450787, 2.24132, 1, 0, 0.1137255, 1,
2.030614, 0.4204753, 1.652221, 1, 0, 0.1098039, 1,
2.048104, -0.3852426, 1.761651, 1, 0, 0.1019608, 1,
2.049592, 0.4668517, 0.7862774, 1, 0, 0.09411765, 1,
2.070144, 0.9015141, -0.1400771, 1, 0, 0.09019608, 1,
2.071269, 0.9056237, -1.367119, 1, 0, 0.08235294, 1,
2.090521, -1.328145, 2.499623, 1, 0, 0.07843138, 1,
2.140955, -0.5800806, 1.75394, 1, 0, 0.07058824, 1,
2.146736, 1.181001, 0.7793261, 1, 0, 0.06666667, 1,
2.154616, 0.2405578, 1.151711, 1, 0, 0.05882353, 1,
2.171428, -0.04015985, 3.148808, 1, 0, 0.05490196, 1,
2.183337, 1.024049, 1.696864, 1, 0, 0.04705882, 1,
2.267755, -0.2644377, 3.754859, 1, 0, 0.04313726, 1,
2.285153, 1.213989, 2.340938, 1, 0, 0.03529412, 1,
2.378757, -0.186878, 2.767351, 1, 0, 0.03137255, 1,
2.842472, -0.5659456, 1.430011, 1, 0, 0.02352941, 1,
2.938666, 0.5715114, 1.78506, 1, 0, 0.01960784, 1,
2.985956, 0.7708116, 2.883396, 1, 0, 0.01176471, 1,
3.504205, -0.4144342, 0.5610298, 1, 0, 0.007843138, 1
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
-0.01663578, -4.95927, -7.159556, 0, -0.5, 0.5, 0.5,
-0.01663578, -4.95927, -7.159556, 1, -0.5, 0.5, 0.5,
-0.01663578, -4.95927, -7.159556, 1, 1.5, 0.5, 0.5,
-0.01663578, -4.95927, -7.159556, 0, 1.5, 0.5, 0.5
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
-4.731041, -0.2956684, -7.159556, 0, -0.5, 0.5, 0.5,
-4.731041, -0.2956684, -7.159556, 1, -0.5, 0.5, 0.5,
-4.731041, -0.2956684, -7.159556, 1, 1.5, 0.5, 0.5,
-4.731041, -0.2956684, -7.159556, 0, 1.5, 0.5, 0.5
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
-4.731041, -4.95927, 0.3989775, 0, -0.5, 0.5, 0.5,
-4.731041, -4.95927, 0.3989775, 1, -0.5, 0.5, 0.5,
-4.731041, -4.95927, 0.3989775, 1, 1.5, 0.5, 0.5,
-4.731041, -4.95927, 0.3989775, 0, 1.5, 0.5, 0.5
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
-2, -3.883054, -5.415279,
2, -3.883054, -5.415279,
-2, -3.883054, -5.415279,
-2, -4.062424, -5.705992,
0, -3.883054, -5.415279,
0, -4.062424, -5.705992,
2, -3.883054, -5.415279,
2, -4.062424, -5.705992
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
-2, -4.421162, -6.287417, 0, -0.5, 0.5, 0.5,
-2, -4.421162, -6.287417, 1, -0.5, 0.5, 0.5,
-2, -4.421162, -6.287417, 1, 1.5, 0.5, 0.5,
-2, -4.421162, -6.287417, 0, 1.5, 0.5, 0.5,
0, -4.421162, -6.287417, 0, -0.5, 0.5, 0.5,
0, -4.421162, -6.287417, 1, -0.5, 0.5, 0.5,
0, -4.421162, -6.287417, 1, 1.5, 0.5, 0.5,
0, -4.421162, -6.287417, 0, 1.5, 0.5, 0.5,
2, -4.421162, -6.287417, 0, -0.5, 0.5, 0.5,
2, -4.421162, -6.287417, 1, -0.5, 0.5, 0.5,
2, -4.421162, -6.287417, 1, 1.5, 0.5, 0.5,
2, -4.421162, -6.287417, 0, 1.5, 0.5, 0.5
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
-3.643102, -3, -5.415279,
-3.643102, 3, -5.415279,
-3.643102, -3, -5.415279,
-3.824425, -3, -5.705992,
-3.643102, -2, -5.415279,
-3.824425, -2, -5.705992,
-3.643102, -1, -5.415279,
-3.824425, -1, -5.705992,
-3.643102, 0, -5.415279,
-3.824425, 0, -5.705992,
-3.643102, 1, -5.415279,
-3.824425, 1, -5.705992,
-3.643102, 2, -5.415279,
-3.824425, 2, -5.705992,
-3.643102, 3, -5.415279,
-3.824425, 3, -5.705992
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
-4.187072, -3, -6.287417, 0, -0.5, 0.5, 0.5,
-4.187072, -3, -6.287417, 1, -0.5, 0.5, 0.5,
-4.187072, -3, -6.287417, 1, 1.5, 0.5, 0.5,
-4.187072, -3, -6.287417, 0, 1.5, 0.5, 0.5,
-4.187072, -2, -6.287417, 0, -0.5, 0.5, 0.5,
-4.187072, -2, -6.287417, 1, -0.5, 0.5, 0.5,
-4.187072, -2, -6.287417, 1, 1.5, 0.5, 0.5,
-4.187072, -2, -6.287417, 0, 1.5, 0.5, 0.5,
-4.187072, -1, -6.287417, 0, -0.5, 0.5, 0.5,
-4.187072, -1, -6.287417, 1, -0.5, 0.5, 0.5,
-4.187072, -1, -6.287417, 1, 1.5, 0.5, 0.5,
-4.187072, -1, -6.287417, 0, 1.5, 0.5, 0.5,
-4.187072, 0, -6.287417, 0, -0.5, 0.5, 0.5,
-4.187072, 0, -6.287417, 1, -0.5, 0.5, 0.5,
-4.187072, 0, -6.287417, 1, 1.5, 0.5, 0.5,
-4.187072, 0, -6.287417, 0, 1.5, 0.5, 0.5,
-4.187072, 1, -6.287417, 0, -0.5, 0.5, 0.5,
-4.187072, 1, -6.287417, 1, -0.5, 0.5, 0.5,
-4.187072, 1, -6.287417, 1, 1.5, 0.5, 0.5,
-4.187072, 1, -6.287417, 0, 1.5, 0.5, 0.5,
-4.187072, 2, -6.287417, 0, -0.5, 0.5, 0.5,
-4.187072, 2, -6.287417, 1, -0.5, 0.5, 0.5,
-4.187072, 2, -6.287417, 1, 1.5, 0.5, 0.5,
-4.187072, 2, -6.287417, 0, 1.5, 0.5, 0.5,
-4.187072, 3, -6.287417, 0, -0.5, 0.5, 0.5,
-4.187072, 3, -6.287417, 1, -0.5, 0.5, 0.5,
-4.187072, 3, -6.287417, 1, 1.5, 0.5, 0.5,
-4.187072, 3, -6.287417, 0, 1.5, 0.5, 0.5
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
-3.643102, -3.883054, -4,
-3.643102, -3.883054, 6,
-3.643102, -3.883054, -4,
-3.824425, -4.062424, -4,
-3.643102, -3.883054, -2,
-3.824425, -4.062424, -2,
-3.643102, -3.883054, 0,
-3.824425, -4.062424, 0,
-3.643102, -3.883054, 2,
-3.824425, -4.062424, 2,
-3.643102, -3.883054, 4,
-3.824425, -4.062424, 4,
-3.643102, -3.883054, 6,
-3.824425, -4.062424, 6
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
-4.187072, -4.421162, -4, 0, -0.5, 0.5, 0.5,
-4.187072, -4.421162, -4, 1, -0.5, 0.5, 0.5,
-4.187072, -4.421162, -4, 1, 1.5, 0.5, 0.5,
-4.187072, -4.421162, -4, 0, 1.5, 0.5, 0.5,
-4.187072, -4.421162, -2, 0, -0.5, 0.5, 0.5,
-4.187072, -4.421162, -2, 1, -0.5, 0.5, 0.5,
-4.187072, -4.421162, -2, 1, 1.5, 0.5, 0.5,
-4.187072, -4.421162, -2, 0, 1.5, 0.5, 0.5,
-4.187072, -4.421162, 0, 0, -0.5, 0.5, 0.5,
-4.187072, -4.421162, 0, 1, -0.5, 0.5, 0.5,
-4.187072, -4.421162, 0, 1, 1.5, 0.5, 0.5,
-4.187072, -4.421162, 0, 0, 1.5, 0.5, 0.5,
-4.187072, -4.421162, 2, 0, -0.5, 0.5, 0.5,
-4.187072, -4.421162, 2, 1, -0.5, 0.5, 0.5,
-4.187072, -4.421162, 2, 1, 1.5, 0.5, 0.5,
-4.187072, -4.421162, 2, 0, 1.5, 0.5, 0.5,
-4.187072, -4.421162, 4, 0, -0.5, 0.5, 0.5,
-4.187072, -4.421162, 4, 1, -0.5, 0.5, 0.5,
-4.187072, -4.421162, 4, 1, 1.5, 0.5, 0.5,
-4.187072, -4.421162, 4, 0, 1.5, 0.5, 0.5,
-4.187072, -4.421162, 6, 0, -0.5, 0.5, 0.5,
-4.187072, -4.421162, 6, 1, -0.5, 0.5, 0.5,
-4.187072, -4.421162, 6, 1, 1.5, 0.5, 0.5,
-4.187072, -4.421162, 6, 0, 1.5, 0.5, 0.5
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
-3.643102, -3.883054, -5.415279,
-3.643102, 3.291718, -5.415279,
-3.643102, -3.883054, 6.213234,
-3.643102, 3.291718, 6.213234,
-3.643102, -3.883054, -5.415279,
-3.643102, -3.883054, 6.213234,
-3.643102, 3.291718, -5.415279,
-3.643102, 3.291718, 6.213234,
-3.643102, -3.883054, -5.415279,
3.60983, -3.883054, -5.415279,
-3.643102, -3.883054, 6.213234,
3.60983, -3.883054, 6.213234,
-3.643102, 3.291718, -5.415279,
3.60983, 3.291718, -5.415279,
-3.643102, 3.291718, 6.213234,
3.60983, 3.291718, 6.213234,
3.60983, -3.883054, -5.415279,
3.60983, 3.291718, -5.415279,
3.60983, -3.883054, 6.213234,
3.60983, 3.291718, 6.213234,
3.60983, -3.883054, -5.415279,
3.60983, -3.883054, 6.213234,
3.60983, 3.291718, -5.415279,
3.60983, 3.291718, 6.213234
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
var radius = 8.2604;
var distance = 36.75145;
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
mvMatrix.translate( 0.01663578, 0.2956684, -0.3989775 );
mvMatrix.scale( 1.231406, 1.244821, 0.7680523 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.75145);
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
lufenuron<-read.table("lufenuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-lufenuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'lufenuron' not found
```

```r
y<-lufenuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'lufenuron' not found
```

```r
z<-lufenuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'lufenuron' not found
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
-3.537477, -0.05316035, -1.863542, 0, 0, 1, 1, 1,
-2.820209, -0.6353126, -0.1071418, 1, 0, 0, 1, 1,
-2.744123, -0.7948501, -2.962329, 1, 0, 0, 1, 1,
-2.681437, 0.5449324, -1.970234, 1, 0, 0, 1, 1,
-2.612249, -0.002297622, -2.447141, 1, 0, 0, 1, 1,
-2.595348, 1.780055, -0.6996933, 1, 0, 0, 1, 1,
-2.580587, -0.2113157, -0.7623539, 0, 0, 0, 1, 1,
-2.482782, 1.482158, 0.3575945, 0, 0, 0, 1, 1,
-2.476685, 1.363379, -0.2436017, 0, 0, 0, 1, 1,
-2.462254, -1.210487, -2.204083, 0, 0, 0, 1, 1,
-2.416455, -0.8792583, -1.180456, 0, 0, 0, 1, 1,
-2.394368, 0.3188412, -0.8604757, 0, 0, 0, 1, 1,
-2.369971, 1.802307, -0.2900768, 0, 0, 0, 1, 1,
-2.357973, 0.4875513, -1.006735, 1, 1, 1, 1, 1,
-2.355513, -1.130876, -2.051342, 1, 1, 1, 1, 1,
-2.335755, 0.4044305, -1.009232, 1, 1, 1, 1, 1,
-2.274659, 0.0253496, -3.278777, 1, 1, 1, 1, 1,
-2.222313, 0.7407257, -3.130007, 1, 1, 1, 1, 1,
-2.214683, -0.542814, -0.3898041, 1, 1, 1, 1, 1,
-2.196296, 1.105955, -1.158515, 1, 1, 1, 1, 1,
-2.183877, -0.8411334, -1.591342, 1, 1, 1, 1, 1,
-2.178045, 1.749663, -1.653877, 1, 1, 1, 1, 1,
-2.163278, 0.8745757, -1.258654, 1, 1, 1, 1, 1,
-2.136201, -0.203035, -0.7703153, 1, 1, 1, 1, 1,
-2.135533, 1.208995, -1.106059, 1, 1, 1, 1, 1,
-2.133632, -1.038692, -1.832082, 1, 1, 1, 1, 1,
-2.133029, 2.066591, -1.332648, 1, 1, 1, 1, 1,
-2.063086, 0.1305629, 0.1416727, 1, 1, 1, 1, 1,
-2.050834, 1.127114, -1.0322, 0, 0, 1, 1, 1,
-2.038712, 1.675333, 0.3452314, 1, 0, 0, 1, 1,
-2.031356, 1.225372, -3.149709, 1, 0, 0, 1, 1,
-1.993109, 1.44216, -1.320979, 1, 0, 0, 1, 1,
-1.986036, -1.393562, -3.039564, 1, 0, 0, 1, 1,
-1.985624, -1.194053, -0.8463719, 1, 0, 0, 1, 1,
-1.984198, 0.8711945, -1.534443, 0, 0, 0, 1, 1,
-1.913746, -0.4076802, -2.117459, 0, 0, 0, 1, 1,
-1.895205, 1.911988, -0.1476303, 0, 0, 0, 1, 1,
-1.877925, 1.820676, 0.1729641, 0, 0, 0, 1, 1,
-1.863654, 0.1102609, -0.9184711, 0, 0, 0, 1, 1,
-1.82236, -0.9987178, -2.211246, 0, 0, 0, 1, 1,
-1.819378, -1.42354, -3.510075, 0, 0, 0, 1, 1,
-1.800374, 0.07460934, -0.6426634, 1, 1, 1, 1, 1,
-1.795035, -1.357653, -1.295301, 1, 1, 1, 1, 1,
-1.783193, -0.9780087, -0.4502768, 1, 1, 1, 1, 1,
-1.782943, -1.164085, -0.1065945, 1, 1, 1, 1, 1,
-1.779413, 0.9857341, 1.54908, 1, 1, 1, 1, 1,
-1.750823, -0.4241231, -0.4609163, 1, 1, 1, 1, 1,
-1.747023, -1.952188, -1.857949, 1, 1, 1, 1, 1,
-1.743063, -0.1639806, -0.2428784, 1, 1, 1, 1, 1,
-1.728598, -0.8208517, -2.247727, 1, 1, 1, 1, 1,
-1.7112, 1.220159, -1.171717, 1, 1, 1, 1, 1,
-1.707715, -0.5423918, -2.129585, 1, 1, 1, 1, 1,
-1.705714, 0.3353377, -0.7360587, 1, 1, 1, 1, 1,
-1.694588, 0.7989882, -1.720183, 1, 1, 1, 1, 1,
-1.674554, 0.01696674, -1.758852, 1, 1, 1, 1, 1,
-1.64418, 0.8217842, 0.3545209, 1, 1, 1, 1, 1,
-1.64397, -1.582639, -2.241106, 0, 0, 1, 1, 1,
-1.623747, -0.5407276, -0.9212252, 1, 0, 0, 1, 1,
-1.577421, -0.8860003, -4.515612, 1, 0, 0, 1, 1,
-1.577414, 0.442353, -0.9718903, 1, 0, 0, 1, 1,
-1.576522, -0.1211008, -1.581101, 1, 0, 0, 1, 1,
-1.572069, 0.3460982, -0.002908643, 1, 0, 0, 1, 1,
-1.570924, 1.014612, -2.425066, 0, 0, 0, 1, 1,
-1.570326, -0.8580083, -4.585383, 0, 0, 0, 1, 1,
-1.569919, -1.723812, -2.784509, 0, 0, 0, 1, 1,
-1.564471, 0.607212, -2.311054, 0, 0, 0, 1, 1,
-1.554588, -2.052624, -1.374288, 0, 0, 0, 1, 1,
-1.54161, 0.1914772, -0.633885, 0, 0, 0, 1, 1,
-1.521842, 1.631254, -0.3147635, 0, 0, 0, 1, 1,
-1.517286, -1.341422, -2.983459, 1, 1, 1, 1, 1,
-1.50734, -0.3487973, -2.675297, 1, 1, 1, 1, 1,
-1.498622, -1.315964, 0.04406486, 1, 1, 1, 1, 1,
-1.497148, 0.3592302, -0.8974046, 1, 1, 1, 1, 1,
-1.495725, -1.424463, -2.850714, 1, 1, 1, 1, 1,
-1.476149, 1.86658, -2.16423, 1, 1, 1, 1, 1,
-1.461753, -0.074809, -2.278225, 1, 1, 1, 1, 1,
-1.461142, -0.3954282, -2.893161, 1, 1, 1, 1, 1,
-1.460829, -0.1438078, -0.8396406, 1, 1, 1, 1, 1,
-1.460575, -0.1167876, -2.138343, 1, 1, 1, 1, 1,
-1.448652, 0.5157046, -1.227271, 1, 1, 1, 1, 1,
-1.444739, 1.242176, -1.056296, 1, 1, 1, 1, 1,
-1.443949, -2.175995, -3.033536, 1, 1, 1, 1, 1,
-1.420273, -1.679065, -3.543561, 1, 1, 1, 1, 1,
-1.417733, 0.2101147, -1.006811, 1, 1, 1, 1, 1,
-1.409982, -0.8319092, -2.318012, 0, 0, 1, 1, 1,
-1.398722, -0.3723399, -1.279989, 1, 0, 0, 1, 1,
-1.389427, -3.778567, -1.859443, 1, 0, 0, 1, 1,
-1.382909, 0.8098298, -0.1254422, 1, 0, 0, 1, 1,
-1.377155, 0.1443132, 0.2212531, 1, 0, 0, 1, 1,
-1.376377, 1.183612, -1.383831, 1, 0, 0, 1, 1,
-1.361202, -0.8692297, -2.297223, 0, 0, 0, 1, 1,
-1.357058, 0.08567905, -1.705444, 0, 0, 0, 1, 1,
-1.344219, 0.2060207, -1.069656, 0, 0, 0, 1, 1,
-1.338937, 0.4939218, -0.4355651, 0, 0, 0, 1, 1,
-1.336986, 1.924788, -2.080262, 0, 0, 0, 1, 1,
-1.33439, 2.116373, -0.62332, 0, 0, 0, 1, 1,
-1.331809, 1.464394, 0.2292037, 0, 0, 0, 1, 1,
-1.328346, 0.1868406, 0.09452878, 1, 1, 1, 1, 1,
-1.317147, -1.468813, -0.9077289, 1, 1, 1, 1, 1,
-1.31615, 0.5535856, -1.854861, 1, 1, 1, 1, 1,
-1.309334, 0.5014259, -1.577453, 1, 1, 1, 1, 1,
-1.3072, -0.4954805, -2.75604, 1, 1, 1, 1, 1,
-1.304079, -0.04039059, -1.622086, 1, 1, 1, 1, 1,
-1.299154, -0.7504179, -1.567727, 1, 1, 1, 1, 1,
-1.298283, 0.133725, -1.358499, 1, 1, 1, 1, 1,
-1.278536, 0.7831535, -2.08694, 1, 1, 1, 1, 1,
-1.277713, 0.5554625, -1.384385, 1, 1, 1, 1, 1,
-1.271694, -0.2930385, -2.739119, 1, 1, 1, 1, 1,
-1.271219, 0.4101819, -0.1120393, 1, 1, 1, 1, 1,
-1.262348, -2.33078, -3.349299, 1, 1, 1, 1, 1,
-1.257226, -1.434836, -2.970438, 1, 1, 1, 1, 1,
-1.250887, 1.762932, -0.790594, 1, 1, 1, 1, 1,
-1.232192, 1.332879, 0.3484625, 0, 0, 1, 1, 1,
-1.229744, -0.648393, -2.75646, 1, 0, 0, 1, 1,
-1.22758, -0.2952799, -0.9091952, 1, 0, 0, 1, 1,
-1.225599, 0.8160149, -0.9019133, 1, 0, 0, 1, 1,
-1.224942, 0.2613008, -1.971296, 1, 0, 0, 1, 1,
-1.217834, 0.3038236, -1.135816, 1, 0, 0, 1, 1,
-1.200783, 0.01582371, -0.9890171, 0, 0, 0, 1, 1,
-1.197907, -0.3410816, -0.4851351, 0, 0, 0, 1, 1,
-1.192541, 1.382986, -1.808574, 0, 0, 0, 1, 1,
-1.180023, -0.6565772, -2.312558, 0, 0, 0, 1, 1,
-1.165147, 0.04039416, -2.634012, 0, 0, 0, 1, 1,
-1.165069, 0.3627742, -3.056992, 0, 0, 0, 1, 1,
-1.163593, 1.065155, -1.015762, 0, 0, 0, 1, 1,
-1.161353, -0.5865346, -2.27236, 1, 1, 1, 1, 1,
-1.153752, 1.209935, -1.295452, 1, 1, 1, 1, 1,
-1.149662, 0.05287946, -2.497698, 1, 1, 1, 1, 1,
-1.147734, 0.4551192, -0.9247537, 1, 1, 1, 1, 1,
-1.143724, 1.456448, -1.548849, 1, 1, 1, 1, 1,
-1.140736, 1.635097, 0.1726923, 1, 1, 1, 1, 1,
-1.138463, -0.01235497, -2.213315, 1, 1, 1, 1, 1,
-1.132966, 0.2303814, -0.7296979, 1, 1, 1, 1, 1,
-1.129862, -0.5420301, -1.271397, 1, 1, 1, 1, 1,
-1.12788, -0.2122382, -2.545857, 1, 1, 1, 1, 1,
-1.120979, 0.321969, 0.6899614, 1, 1, 1, 1, 1,
-1.117075, 0.6124337, -1.773966, 1, 1, 1, 1, 1,
-1.116171, -0.5135054, -1.496237, 1, 1, 1, 1, 1,
-1.112532, -0.8628367, -1.288024, 1, 1, 1, 1, 1,
-1.106085, -1.923873, -2.938122, 1, 1, 1, 1, 1,
-1.103041, -1.010695, -1.801758, 0, 0, 1, 1, 1,
-1.10119, -0.2686452, -2.388065, 1, 0, 0, 1, 1,
-1.097481, -1.469222, -0.5975834, 1, 0, 0, 1, 1,
-1.09344, 1.236698, -2.046242, 1, 0, 0, 1, 1,
-1.088202, 0.5598876, 0.2810371, 1, 0, 0, 1, 1,
-1.087634, 0.4414313, -0.5178364, 1, 0, 0, 1, 1,
-1.085527, 0.2404579, -0.7753258, 0, 0, 0, 1, 1,
-1.082044, -0.08318603, -1.041039, 0, 0, 0, 1, 1,
-1.081268, 0.7210984, -1.32893, 0, 0, 0, 1, 1,
-1.078943, 0.6858678, -0.7499071, 0, 0, 0, 1, 1,
-1.068048, 0.3800047, -0.5130093, 0, 0, 0, 1, 1,
-1.064774, 1.160864, -1.122824, 0, 0, 0, 1, 1,
-1.063885, -0.4176881, -3.74156, 0, 0, 0, 1, 1,
-1.063489, 1.631413, 0.9980502, 1, 1, 1, 1, 1,
-1.06068, 0.08650053, -0.8472999, 1, 1, 1, 1, 1,
-1.057951, 0.5598891, -2.216926, 1, 1, 1, 1, 1,
-1.056438, 0.7224634, 0.4638329, 1, 1, 1, 1, 1,
-1.049755, -2.039497, -2.386894, 1, 1, 1, 1, 1,
-1.044275, 0.3147222, -0.5374838, 1, 1, 1, 1, 1,
-1.039486, 1.078811, -1.353715, 1, 1, 1, 1, 1,
-1.039053, -1.900542, -2.925412, 1, 1, 1, 1, 1,
-1.027431, -0.752111, -2.365402, 1, 1, 1, 1, 1,
-1.007825, 0.7004166, -1.889233, 1, 1, 1, 1, 1,
-1.006625, -0.2400011, -1.598608, 1, 1, 1, 1, 1,
-1.004319, -0.8648596, -0.4990996, 1, 1, 1, 1, 1,
-1.001864, 1.325256, 1.36443, 1, 1, 1, 1, 1,
-1.000668, -0.5216613, -4.204828, 1, 1, 1, 1, 1,
-0.9948771, 1.169729, -1.492724, 1, 1, 1, 1, 1,
-0.9923391, 0.4155931, -2.18776, 0, 0, 1, 1, 1,
-0.9914294, -0.375412, -1.58871, 1, 0, 0, 1, 1,
-0.9906946, 0.9660767, -3.130667, 1, 0, 0, 1, 1,
-0.9863759, -1.273968, -3.819408, 1, 0, 0, 1, 1,
-0.9841961, -2.366056, -1.467813, 1, 0, 0, 1, 1,
-0.9815177, -1.936357, -2.356739, 1, 0, 0, 1, 1,
-0.9670266, 1.390695, -2.181685, 0, 0, 0, 1, 1,
-0.9658777, 1.199829, -4.302005, 0, 0, 0, 1, 1,
-0.9640384, -0.1129341, -3.165961, 0, 0, 0, 1, 1,
-0.9620058, -0.08100016, -0.901928, 0, 0, 0, 1, 1,
-0.9619905, 1.850982, -0.294373, 0, 0, 0, 1, 1,
-0.961895, 1.854344, -0.6004254, 0, 0, 0, 1, 1,
-0.9602138, 1.85422, -0.8427551, 0, 0, 0, 1, 1,
-0.9597275, 0.5133594, -0.3253875, 1, 1, 1, 1, 1,
-0.9570872, -2.273476, -2.263032, 1, 1, 1, 1, 1,
-0.9566311, -0.9619787, -1.410599, 1, 1, 1, 1, 1,
-0.9550613, -0.2321565, -2.3693, 1, 1, 1, 1, 1,
-0.953823, 0.3307033, -1.652321, 1, 1, 1, 1, 1,
-0.9437139, 0.598381, 0.5959608, 1, 1, 1, 1, 1,
-0.9419473, -2.255743, -3.435794, 1, 1, 1, 1, 1,
-0.9417999, 1.019289, -1.154096, 1, 1, 1, 1, 1,
-0.9375868, 0.7418333, -0.9434844, 1, 1, 1, 1, 1,
-0.9317613, -0.3191311, -0.3071132, 1, 1, 1, 1, 1,
-0.9306626, 0.3740822, -1.437526, 1, 1, 1, 1, 1,
-0.9286205, 2.644789, -0.1011805, 1, 1, 1, 1, 1,
-0.9221659, -1.042678, -2.252988, 1, 1, 1, 1, 1,
-0.9216647, -0.910065, -2.012555, 1, 1, 1, 1, 1,
-0.9199516, 0.07596947, -3.7451, 1, 1, 1, 1, 1,
-0.9196238, 1.29698, 0.7042922, 0, 0, 1, 1, 1,
-0.912953, -0.4708674, -1.270143, 1, 0, 0, 1, 1,
-0.9096453, -0.03389788, -0.6794634, 1, 0, 0, 1, 1,
-0.9085847, -0.5000785, -2.405587, 1, 0, 0, 1, 1,
-0.9029875, -0.152205, -3.541125, 1, 0, 0, 1, 1,
-0.8981657, 0.5330692, -0.5583136, 1, 0, 0, 1, 1,
-0.8943164, -1.160576, -2.363666, 0, 0, 0, 1, 1,
-0.8941713, 0.380769, -0.693505, 0, 0, 0, 1, 1,
-0.8909915, 1.321975, -0.8152058, 0, 0, 0, 1, 1,
-0.8860843, -0.6352869, -3.68935, 0, 0, 0, 1, 1,
-0.884102, 0.3942836, 0.1546157, 0, 0, 0, 1, 1,
-0.8827038, 0.2754515, -2.928968, 0, 0, 0, 1, 1,
-0.8795874, -1.371475, -1.330722, 0, 0, 0, 1, 1,
-0.8789451, 0.3355683, -3.174258, 1, 1, 1, 1, 1,
-0.8772737, 0.7400079, -0.8119199, 1, 1, 1, 1, 1,
-0.8764976, 0.47282, -0.8510295, 1, 1, 1, 1, 1,
-0.8745832, -0.2501073, -3.489439, 1, 1, 1, 1, 1,
-0.8721272, 0.3738271, -0.5151345, 1, 1, 1, 1, 1,
-0.8655636, 2.201089, 0.5415812, 1, 1, 1, 1, 1,
-0.8631151, -0.8618599, -3.370662, 1, 1, 1, 1, 1,
-0.8610312, -1.125792, -1.845823, 1, 1, 1, 1, 1,
-0.8593287, -1.540587, -3.033788, 1, 1, 1, 1, 1,
-0.857561, 1.311768, -0.5170311, 1, 1, 1, 1, 1,
-0.8568013, 1.152773, -0.3580109, 1, 1, 1, 1, 1,
-0.8557852, -0.4413391, -2.737814, 1, 1, 1, 1, 1,
-0.8504329, 1.394915, -0.3224711, 1, 1, 1, 1, 1,
-0.845112, -0.8919542, -0.6521707, 1, 1, 1, 1, 1,
-0.8413951, 0.4265208, -0.5136206, 1, 1, 1, 1, 1,
-0.837936, -1.156496, -0.6254979, 0, 0, 1, 1, 1,
-0.835711, -0.4663034, -3.445059, 1, 0, 0, 1, 1,
-0.8356268, -0.4067431, -2.070184, 1, 0, 0, 1, 1,
-0.8317447, -1.288889, -1.917758, 1, 0, 0, 1, 1,
-0.8211553, 0.5834773, -1.76028, 1, 0, 0, 1, 1,
-0.8110672, -0.7166389, -2.737368, 1, 0, 0, 1, 1,
-0.809486, 2.065235, -1.633713, 0, 0, 0, 1, 1,
-0.7999131, -0.5973356, -3.376668, 0, 0, 0, 1, 1,
-0.7998462, 0.03675408, -1.742313, 0, 0, 0, 1, 1,
-0.7996867, -0.5611044, -2.198702, 0, 0, 0, 1, 1,
-0.7976697, -0.3788973, -1.993235, 0, 0, 0, 1, 1,
-0.7953035, 1.712296, -0.6974926, 0, 0, 0, 1, 1,
-0.7936237, -0.4230289, -1.909204, 0, 0, 0, 1, 1,
-0.7932392, 0.7239214, 0.04447031, 1, 1, 1, 1, 1,
-0.7906835, -1.257721, -2.758685, 1, 1, 1, 1, 1,
-0.790318, -0.1073677, -1.188903, 1, 1, 1, 1, 1,
-0.7856997, -0.4822917, -1.660989, 1, 1, 1, 1, 1,
-0.7825086, -2.050281, -2.428281, 1, 1, 1, 1, 1,
-0.777735, -1.514006, -4.010355, 1, 1, 1, 1, 1,
-0.7744622, 1.188755, 0.7344466, 1, 1, 1, 1, 1,
-0.7720216, -2.020089, -2.711589, 1, 1, 1, 1, 1,
-0.7657702, -0.7712932, -3.117508, 1, 1, 1, 1, 1,
-0.7586092, 1.983191, 0.009687583, 1, 1, 1, 1, 1,
-0.7568399, 1.330492, -1.062718, 1, 1, 1, 1, 1,
-0.752291, -0.2414903, -1.447368, 1, 1, 1, 1, 1,
-0.7473767, -0.5325798, -2.475131, 1, 1, 1, 1, 1,
-0.7436748, -1.060704, -1.577879, 1, 1, 1, 1, 1,
-0.7397719, 0.06431353, -1.743182, 1, 1, 1, 1, 1,
-0.7396318, -1.150792, -0.8676006, 0, 0, 1, 1, 1,
-0.7381757, 0.3090431, -1.591023, 1, 0, 0, 1, 1,
-0.7318352, -0.6822671, -1.734788, 1, 0, 0, 1, 1,
-0.7239276, 0.01081734, -0.0442413, 1, 0, 0, 1, 1,
-0.7176754, 1.136671, -0.6738651, 1, 0, 0, 1, 1,
-0.7175893, -0.9376194, -2.651407, 1, 0, 0, 1, 1,
-0.7153683, 0.10713, -0.9709636, 0, 0, 0, 1, 1,
-0.7063603, -0.3950062, -2.502631, 0, 0, 0, 1, 1,
-0.7053123, 0.2131455, -0.2750743, 0, 0, 0, 1, 1,
-0.7044091, 0.3146485, -3.132645, 0, 0, 0, 1, 1,
-0.7003565, 2.240333, 0.5921441, 0, 0, 0, 1, 1,
-0.6996307, -1.193704, -4.952989, 0, 0, 0, 1, 1,
-0.6947851, 0.9961359, -0.7354923, 0, 0, 0, 1, 1,
-0.694343, -0.5579051, -2.487561, 1, 1, 1, 1, 1,
-0.6920137, 0.9312673, 0.4775757, 1, 1, 1, 1, 1,
-0.691225, -0.2509851, -5.072909, 1, 1, 1, 1, 1,
-0.6912109, 1.13349, -0.007151035, 1, 1, 1, 1, 1,
-0.6909606, -0.3925468, -2.06015, 1, 1, 1, 1, 1,
-0.6891247, -0.7594764, -2.120718, 1, 1, 1, 1, 1,
-0.6840547, -0.5866856, -1.503222, 1, 1, 1, 1, 1,
-0.6831396, -0.9434729, -2.427009, 1, 1, 1, 1, 1,
-0.6796446, -1.527493, -3.492573, 1, 1, 1, 1, 1,
-0.6746705, -2.426732, -4.068513, 1, 1, 1, 1, 1,
-0.6746588, 0.4618722, -1.627521, 1, 1, 1, 1, 1,
-0.6723708, -0.5898803, -2.327112, 1, 1, 1, 1, 1,
-0.6625497, -1.620489, -2.182705, 1, 1, 1, 1, 1,
-0.6611416, -1.510424, -3.147716, 1, 1, 1, 1, 1,
-0.6577919, -0.4021401, -0.03403845, 1, 1, 1, 1, 1,
-0.6521698, 1.152575, -0.8167844, 0, 0, 1, 1, 1,
-0.649043, -1.169902, -1.432965, 1, 0, 0, 1, 1,
-0.6458431, 0.7001265, 0.0204972, 1, 0, 0, 1, 1,
-0.645529, 0.3311446, -0.6887139, 1, 0, 0, 1, 1,
-0.6448652, -0.1526519, -2.57439, 1, 0, 0, 1, 1,
-0.631475, -0.4857892, -0.9171664, 1, 0, 0, 1, 1,
-0.6287305, -0.08310172, -0.8340832, 0, 0, 0, 1, 1,
-0.6276124, -0.1549941, -1.752364, 0, 0, 0, 1, 1,
-0.6263246, 1.270748, 0.3792491, 0, 0, 0, 1, 1,
-0.6259769, 0.7470076, -0.1040803, 0, 0, 0, 1, 1,
-0.6215985, 1.521498, 0.9328393, 0, 0, 0, 1, 1,
-0.62011, 0.2043448, -2.103596, 0, 0, 0, 1, 1,
-0.6168016, -0.5505555, -3.069792, 0, 0, 0, 1, 1,
-0.6155321, 0.5026442, 0.08765067, 1, 1, 1, 1, 1,
-0.6102337, 0.3285204, -1.762803, 1, 1, 1, 1, 1,
-0.6095853, -0.3999383, -3.262271, 1, 1, 1, 1, 1,
-0.6043534, 1.090839, 0.7781354, 1, 1, 1, 1, 1,
-0.6040354, -0.204675, -1.021637, 1, 1, 1, 1, 1,
-0.6027043, 1.639275, 0.3135371, 1, 1, 1, 1, 1,
-0.5927252, -0.7835467, -2.105097, 1, 1, 1, 1, 1,
-0.5859649, -0.8148733, -1.365248, 1, 1, 1, 1, 1,
-0.5806965, -1.253318, -3.779939, 1, 1, 1, 1, 1,
-0.5800594, -2.41553, -4.623571, 1, 1, 1, 1, 1,
-0.5682451, -2.002964, -2.366948, 1, 1, 1, 1, 1,
-0.5680673, 0.6556741, -1.688514, 1, 1, 1, 1, 1,
-0.5660073, -0.7880663, -2.834351, 1, 1, 1, 1, 1,
-0.5591908, 0.8095554, -2.441581, 1, 1, 1, 1, 1,
-0.5583043, -1.209365, -3.935617, 1, 1, 1, 1, 1,
-0.5527298, 0.01062116, 0.2889225, 0, 0, 1, 1, 1,
-0.550581, 0.9628772, -0.644715, 1, 0, 0, 1, 1,
-0.5505005, 0.4751231, -1.134162, 1, 0, 0, 1, 1,
-0.5424988, 0.3857191, -0.4705984, 1, 0, 0, 1, 1,
-0.5415561, 1.386122, -0.8321246, 1, 0, 0, 1, 1,
-0.5412028, 0.004794101, -0.9505978, 1, 0, 0, 1, 1,
-0.5393556, 0.1073403, -2.136734, 0, 0, 0, 1, 1,
-0.53196, -0.7296354, -3.999378, 0, 0, 0, 1, 1,
-0.5268389, 0.1373041, -1.396163, 0, 0, 0, 1, 1,
-0.5250745, -1.02231, -2.061164, 0, 0, 0, 1, 1,
-0.5155298, -0.3664787, -2.829527, 0, 0, 0, 1, 1,
-0.5136651, -1.742505, -2.658151, 0, 0, 0, 1, 1,
-0.5119538, 1.298665, -0.3146428, 0, 0, 0, 1, 1,
-0.511588, -1.058497, -2.275433, 1, 1, 1, 1, 1,
-0.5112908, 1.600808, 1.213938, 1, 1, 1, 1, 1,
-0.5095018, -0.296025, -0.6083198, 1, 1, 1, 1, 1,
-0.5080487, -1.335791, -4.153275, 1, 1, 1, 1, 1,
-0.5022376, 1.06727, -0.1486565, 1, 1, 1, 1, 1,
-0.5021521, 0.4662736, -0.3841296, 1, 1, 1, 1, 1,
-0.5018997, -2.288611, -1.245375, 1, 1, 1, 1, 1,
-0.49938, 0.7933953, -2.404072, 1, 1, 1, 1, 1,
-0.497788, 2.288014, -0.6319995, 1, 1, 1, 1, 1,
-0.4923509, -0.7797219, -2.601803, 1, 1, 1, 1, 1,
-0.4907117, 1.609142, -0.8192651, 1, 1, 1, 1, 1,
-0.4866639, -0.4110423, -2.950355, 1, 1, 1, 1, 1,
-0.485079, 0.9499313, -0.6310407, 1, 1, 1, 1, 1,
-0.4811999, 0.9022473, -0.809887, 1, 1, 1, 1, 1,
-0.4777354, -2.003258, -2.289934, 1, 1, 1, 1, 1,
-0.4759385, 1.076197, -1.612232, 0, 0, 1, 1, 1,
-0.4688177, 0.6446357, -1.444474, 1, 0, 0, 1, 1,
-0.461741, -0.5238913, -1.899686, 1, 0, 0, 1, 1,
-0.4616198, 1.135663, -0.2277774, 1, 0, 0, 1, 1,
-0.4555987, 0.894487, -0.3977783, 1, 0, 0, 1, 1,
-0.4541538, 0.8826057, 0.156415, 1, 0, 0, 1, 1,
-0.4534396, -2.020844, -4.326337, 0, 0, 0, 1, 1,
-0.4496165, 0.1237862, -0.3787973, 0, 0, 0, 1, 1,
-0.4431, 3.187231, -0.8815377, 0, 0, 0, 1, 1,
-0.4365325, 1.133582, 0.05120446, 0, 0, 0, 1, 1,
-0.4360487, -1.644882, -3.383892, 0, 0, 0, 1, 1,
-0.4319813, 1.253512, 0.01456624, 0, 0, 0, 1, 1,
-0.4300024, -0.1647194, -2.867943, 0, 0, 0, 1, 1,
-0.426846, -1.036224, -3.950089, 1, 1, 1, 1, 1,
-0.4263375, 1.11036, 0.7725983, 1, 1, 1, 1, 1,
-0.4238151, -1.244349, -3.839216, 1, 1, 1, 1, 1,
-0.4223336, -1.337293, -2.159692, 1, 1, 1, 1, 1,
-0.4162057, -0.1847632, -2.529275, 1, 1, 1, 1, 1,
-0.4104632, 0.7246374, 2.074483, 1, 1, 1, 1, 1,
-0.4059919, 1.058693, -1.015301, 1, 1, 1, 1, 1,
-0.4055814, 1.502476, 0.6659433, 1, 1, 1, 1, 1,
-0.4054811, 0.5044741, -0.3054512, 1, 1, 1, 1, 1,
-0.4050633, 0.2125733, -1.576081, 1, 1, 1, 1, 1,
-0.4011078, 0.4150171, -0.9037548, 1, 1, 1, 1, 1,
-0.4002253, 0.3223029, -0.5929533, 1, 1, 1, 1, 1,
-0.3994073, -0.2948976, -1.987487, 1, 1, 1, 1, 1,
-0.393908, -1.086292, -3.326384, 1, 1, 1, 1, 1,
-0.3913119, -1.256096, -3.304307, 1, 1, 1, 1, 1,
-0.3900473, 0.7877974, -1.960437, 0, 0, 1, 1, 1,
-0.3898304, -0.007418768, -0.6824836, 1, 0, 0, 1, 1,
-0.3866701, -0.7903863, 0.09850591, 1, 0, 0, 1, 1,
-0.3817797, -0.03364521, -1.810915, 1, 0, 0, 1, 1,
-0.3684234, 1.323845, 0.7937937, 1, 0, 0, 1, 1,
-0.3677229, 0.9796186, 1.449827, 1, 0, 0, 1, 1,
-0.3669262, 0.01694314, -1.759859, 0, 0, 0, 1, 1,
-0.3650008, 1.268511, -1.22449, 0, 0, 0, 1, 1,
-0.3638391, 0.4954992, -0.04675281, 0, 0, 0, 1, 1,
-0.3576572, 0.1590324, -2.116122, 0, 0, 0, 1, 1,
-0.3520222, 0.6783577, 0.2791861, 0, 0, 0, 1, 1,
-0.3519706, 0.1779315, 0.2858089, 0, 0, 0, 1, 1,
-0.3466662, 0.5091925, -1.113729, 0, 0, 0, 1, 1,
-0.3458095, 1.47648, -1.739189, 1, 1, 1, 1, 1,
-0.34335, -0.1393282, -1.945788, 1, 1, 1, 1, 1,
-0.3432186, 1.555601, -0.001223175, 1, 1, 1, 1, 1,
-0.3429571, -1.054433, -3.140079, 1, 1, 1, 1, 1,
-0.3423693, 0.6432225, -1.628016, 1, 1, 1, 1, 1,
-0.3380656, -0.04718153, -1.071997, 1, 1, 1, 1, 1,
-0.3361993, -0.902599, -2.692001, 1, 1, 1, 1, 1,
-0.3347628, -0.8734422, -3.000247, 1, 1, 1, 1, 1,
-0.3338456, -0.919048, -3.414325, 1, 1, 1, 1, 1,
-0.3315381, 0.1637007, -1.072106, 1, 1, 1, 1, 1,
-0.3314661, -1.201034, -3.429164, 1, 1, 1, 1, 1,
-0.3304442, 0.1809466, -0.7187729, 1, 1, 1, 1, 1,
-0.3298281, -0.4000618, -3.84614, 1, 1, 1, 1, 1,
-0.3286888, -1.949681, -5.245932, 1, 1, 1, 1, 1,
-0.3245248, 0.2944108, -0.6642457, 1, 1, 1, 1, 1,
-0.3227058, -1.233525, -2.484741, 0, 0, 1, 1, 1,
-0.3210235, 0.2868874, -1.084987, 1, 0, 0, 1, 1,
-0.3209148, -0.2843451, -1.559813, 1, 0, 0, 1, 1,
-0.3198233, -1.538586, -2.519634, 1, 0, 0, 1, 1,
-0.318056, 1.802589, 2.115312, 1, 0, 0, 1, 1,
-0.3165464, -0.1674594, -0.4949958, 1, 0, 0, 1, 1,
-0.3138217, -2.29331, -4.184223, 0, 0, 0, 1, 1,
-0.3123304, -0.4317879, -2.720105, 0, 0, 0, 1, 1,
-0.3112686, -0.6026875, -3.28942, 0, 0, 0, 1, 1,
-0.3100113, 0.8847624, 0.3570924, 0, 0, 0, 1, 1,
-0.3015121, 0.1720367, -0.4631775, 0, 0, 0, 1, 1,
-0.3003975, 0.6324909, -0.4611357, 0, 0, 0, 1, 1,
-0.2989588, 1.128098, 0.7840396, 0, 0, 0, 1, 1,
-0.2977238, 1.345005, -0.7335685, 1, 1, 1, 1, 1,
-0.2960016, -0.1890958, -2.226763, 1, 1, 1, 1, 1,
-0.2910902, 0.9310558, 0.0384687, 1, 1, 1, 1, 1,
-0.2888679, 0.08538494, -1.472843, 1, 1, 1, 1, 1,
-0.2884872, -0.01076587, -2.121679, 1, 1, 1, 1, 1,
-0.2860789, -0.7826649, -3.193658, 1, 1, 1, 1, 1,
-0.285045, -0.8829015, -4.09122, 1, 1, 1, 1, 1,
-0.2799095, 0.1988744, -0.4624377, 1, 1, 1, 1, 1,
-0.2783043, 1.963457, -2.128338, 1, 1, 1, 1, 1,
-0.2778744, -0.1611671, -1.535822, 1, 1, 1, 1, 1,
-0.27628, -0.7960604, -2.280941, 1, 1, 1, 1, 1,
-0.2738593, 0.3978262, -2.089352, 1, 1, 1, 1, 1,
-0.2695122, 1.312914, -0.4604134, 1, 1, 1, 1, 1,
-0.2687232, 0.08023152, -1.016165, 1, 1, 1, 1, 1,
-0.2650911, -1.321382, -4.236417, 1, 1, 1, 1, 1,
-0.260911, -0.2506762, -4.34241, 0, 0, 1, 1, 1,
-0.2583923, -1.054898, -4.78755, 1, 0, 0, 1, 1,
-0.2548668, -0.1211369, -1.220269, 1, 0, 0, 1, 1,
-0.2528572, 0.1959603, -0.8231049, 1, 0, 0, 1, 1,
-0.2525071, 0.09335364, -1.396757, 1, 0, 0, 1, 1,
-0.2461756, 0.5497113, -0.3083854, 1, 0, 0, 1, 1,
-0.2310666, -0.4835137, -3.66154, 0, 0, 0, 1, 1,
-0.2309554, -2.287208, -4.626042, 0, 0, 0, 1, 1,
-0.2285601, -0.5226443, -2.780055, 0, 0, 0, 1, 1,
-0.2273402, 0.4556799, -0.2947534, 0, 0, 0, 1, 1,
-0.2248372, 0.6140265, 0.179311, 0, 0, 0, 1, 1,
-0.2234341, -0.4092155, -2.81242, 0, 0, 0, 1, 1,
-0.2195537, 0.9969289, 0.4178582, 0, 0, 0, 1, 1,
-0.2162682, -0.509151, -2.273603, 1, 1, 1, 1, 1,
-0.2125606, 0.7783135, 0.8386059, 1, 1, 1, 1, 1,
-0.2108595, 1.212008, 0.5669234, 1, 1, 1, 1, 1,
-0.2097482, -0.2544822, -1.653735, 1, 1, 1, 1, 1,
-0.2087603, 0.4630158, 0.1314222, 1, 1, 1, 1, 1,
-0.2083185, 1.345795, -0.00444206, 1, 1, 1, 1, 1,
-0.208078, -0.5771797, -2.533749, 1, 1, 1, 1, 1,
-0.207352, -1.40165, -2.098893, 1, 1, 1, 1, 1,
-0.2000273, 0.1340444, 1.377922, 1, 1, 1, 1, 1,
-0.1970017, -0.3909932, -4.466955, 1, 1, 1, 1, 1,
-0.1958372, -0.3339982, -2.704038, 1, 1, 1, 1, 1,
-0.1944457, 2.21659, 0.4364621, 1, 1, 1, 1, 1,
-0.1915883, -0.7439395, -3.056273, 1, 1, 1, 1, 1,
-0.1910895, -0.920665, -3.621386, 1, 1, 1, 1, 1,
-0.1894773, 2.623465, -0.3842193, 1, 1, 1, 1, 1,
-0.1862315, 0.07732183, 0.3641712, 0, 0, 1, 1, 1,
-0.1838228, 0.6616166, 0.7918481, 1, 0, 0, 1, 1,
-0.1837959, 0.4579764, 0.9638042, 1, 0, 0, 1, 1,
-0.1817354, -0.1666319, -3.500769, 1, 0, 0, 1, 1,
-0.1789136, 1.463417, -0.1536588, 1, 0, 0, 1, 1,
-0.1787406, -1.933354, -3.964848, 1, 0, 0, 1, 1,
-0.1785115, 1.222971, 0.2534308, 0, 0, 0, 1, 1,
-0.177576, -0.4031921, -3.749723, 0, 0, 0, 1, 1,
-0.1774214, 1.079473, 0.2512131, 0, 0, 0, 1, 1,
-0.1754115, 1.072859, -0.5432563, 0, 0, 0, 1, 1,
-0.1718016, -0.24683, -2.354125, 0, 0, 0, 1, 1,
-0.1665433, 1.493381, -1.343044, 0, 0, 0, 1, 1,
-0.1633107, -1.29511, -4.213121, 0, 0, 0, 1, 1,
-0.1632907, -0.7912162, -2.757067, 1, 1, 1, 1, 1,
-0.1597481, -0.795404, 0.2158254, 1, 1, 1, 1, 1,
-0.1553665, 0.4629776, 1.148607, 1, 1, 1, 1, 1,
-0.148722, -1.209649, -4.401868, 1, 1, 1, 1, 1,
-0.1485898, 0.1573138, -0.2044706, 1, 1, 1, 1, 1,
-0.1477599, 0.3474503, 0.6015871, 1, 1, 1, 1, 1,
-0.1457004, -0.2396922, -5.040726, 1, 1, 1, 1, 1,
-0.14355, -0.7359848, -2.571629, 1, 1, 1, 1, 1,
-0.1410529, 0.0360814, -3.691599, 1, 1, 1, 1, 1,
-0.1409034, 0.8394233, 0.4228682, 1, 1, 1, 1, 1,
-0.1404842, -0.04688662, -1.950643, 1, 1, 1, 1, 1,
-0.1378598, -1.423134, -3.184381, 1, 1, 1, 1, 1,
-0.1335723, 0.1683415, -1.315052, 1, 1, 1, 1, 1,
-0.133453, 0.5144204, -0.01284853, 1, 1, 1, 1, 1,
-0.1309699, 1.095695, -0.3233283, 1, 1, 1, 1, 1,
-0.1306553, -1.001849, -1.910685, 0, 0, 1, 1, 1,
-0.1294686, 0.6353582, -0.5551822, 1, 0, 0, 1, 1,
-0.1288215, 1.540018, -0.249037, 1, 0, 0, 1, 1,
-0.1280437, -0.6188098, -3.392118, 1, 0, 0, 1, 1,
-0.1155354, -1.089822, -4.90328, 1, 0, 0, 1, 1,
-0.1147642, 0.08334536, 0.9855152, 1, 0, 0, 1, 1,
-0.1131295, 1.269607, 0.2388513, 0, 0, 0, 1, 1,
-0.111236, -1.876923, -2.921757, 0, 0, 0, 1, 1,
-0.110493, -0.07871967, -0.7288019, 0, 0, 0, 1, 1,
-0.1058517, -0.7233425, -4.123132, 0, 0, 0, 1, 1,
-0.09739009, -0.5773996, -1.033388, 0, 0, 0, 1, 1,
-0.0925625, -0.177917, -2.660671, 0, 0, 0, 1, 1,
-0.08972228, 1.137302, 0.8237144, 0, 0, 0, 1, 1,
-0.08948452, 0.9383151, -1.266198, 1, 1, 1, 1, 1,
-0.08817763, -0.1459333, -3.485958, 1, 1, 1, 1, 1,
-0.08391737, 1.348381, -2.301771, 1, 1, 1, 1, 1,
-0.0837078, -0.3348755, -2.592377, 1, 1, 1, 1, 1,
-0.0835337, 0.5006154, -0.9321828, 1, 1, 1, 1, 1,
-0.08000517, -1.303847, -2.784034, 1, 1, 1, 1, 1,
-0.07606805, -1.412047, -2.907807, 1, 1, 1, 1, 1,
-0.06050598, 1.22603, 0.5731066, 1, 1, 1, 1, 1,
-0.05660649, -0.1474712, -3.892054, 1, 1, 1, 1, 1,
-0.04873731, 1.729181, -0.7438776, 1, 1, 1, 1, 1,
-0.04654323, 0.3564301, 0.3746889, 1, 1, 1, 1, 1,
-0.04616067, 0.08984994, -2.187352, 1, 1, 1, 1, 1,
-0.03978974, -0.7340976, -3.766795, 1, 1, 1, 1, 1,
-0.03511381, 0.06846797, -0.436632, 1, 1, 1, 1, 1,
-0.03422252, 0.6387956, -0.1756441, 1, 1, 1, 1, 1,
-0.03260054, -0.985668, -4.322261, 0, 0, 1, 1, 1,
-0.03171211, -1.117364, -1.429324, 1, 0, 0, 1, 1,
-0.02973021, 0.4327589, -0.695591, 1, 0, 0, 1, 1,
-0.02592224, 0.8427374, 0.3466579, 1, 0, 0, 1, 1,
-0.02496061, 0.2059994, -0.8087042, 1, 0, 0, 1, 1,
-0.02407553, 0.3520712, -1.049325, 1, 0, 0, 1, 1,
-0.02331237, 0.5708792, -1.563899, 0, 0, 0, 1, 1,
-0.02016336, 1.504043, -0.2293654, 0, 0, 0, 1, 1,
-0.02005046, -1.324947, -2.383788, 0, 0, 0, 1, 1,
-0.009622111, -1.646349, -1.161605, 0, 0, 0, 1, 1,
-0.008750902, 0.9524518, 2.547168, 0, 0, 0, 1, 1,
-0.007950521, -0.9815376, -1.294992, 0, 0, 0, 1, 1,
-0.005695034, -0.3871932, -3.141362, 0, 0, 0, 1, 1,
-0.005150939, -0.391231, -4.901214, 1, 1, 1, 1, 1,
-0.005132492, -1.259247, -2.881775, 1, 1, 1, 1, 1,
-0.005076727, -0.2131944, -3.421473, 1, 1, 1, 1, 1,
-0.003202198, 0.5992051, 1.174057, 1, 1, 1, 1, 1,
0.000963658, -0.287157, 2.541959, 1, 1, 1, 1, 1,
0.00113526, 0.7148933, -0.4721509, 1, 1, 1, 1, 1,
0.005855629, 0.3964175, -0.7202833, 1, 1, 1, 1, 1,
0.007465136, 0.4296556, 1.357671, 1, 1, 1, 1, 1,
0.00858608, -0.6800838, 1.731228, 1, 1, 1, 1, 1,
0.008813981, 1.12408, -0.4636148, 1, 1, 1, 1, 1,
0.01595064, -1.491497, 4.17371, 1, 1, 1, 1, 1,
0.01712907, -0.7744389, 3.802694, 1, 1, 1, 1, 1,
0.01795742, 1.082898, -1.341965, 1, 1, 1, 1, 1,
0.01981593, -1.289185, 6.043887, 1, 1, 1, 1, 1,
0.02091802, 2.044669, -1.378019, 1, 1, 1, 1, 1,
0.02332596, 1.095184, -1.617275, 0, 0, 1, 1, 1,
0.03323999, 1.382905, 0.4611785, 1, 0, 0, 1, 1,
0.03888814, -1.146887, 4.050264, 1, 0, 0, 1, 1,
0.04371773, -0.1258308, 3.390323, 1, 0, 0, 1, 1,
0.04950045, -0.1246287, 0.9403719, 1, 0, 0, 1, 1,
0.05118259, 0.636867, 0.835493, 1, 0, 0, 1, 1,
0.0601759, 0.7490333, 0.1983282, 0, 0, 0, 1, 1,
0.06529365, 1.203665, 0.5193799, 0, 0, 0, 1, 1,
0.06983527, -0.7804505, 3.759146, 0, 0, 0, 1, 1,
0.07018992, 0.2741579, -0.1636202, 0, 0, 0, 1, 1,
0.07218117, -0.5445394, 1.95676, 0, 0, 0, 1, 1,
0.08036245, -0.2508389, 2.816628, 0, 0, 0, 1, 1,
0.08273354, -0.7999647, 1.725734, 0, 0, 0, 1, 1,
0.08588263, 0.4569789, -1.414685, 1, 1, 1, 1, 1,
0.08629283, -0.3607875, 1.72105, 1, 1, 1, 1, 1,
0.08989532, 0.5647178, 0.3341789, 1, 1, 1, 1, 1,
0.09656634, -1.072223, 1.076997, 1, 1, 1, 1, 1,
0.0988036, -0.8431562, 2.1182, 1, 1, 1, 1, 1,
0.09935647, -0.1157069, 2.798973, 1, 1, 1, 1, 1,
0.09937013, -1.371371, 2.420527, 1, 1, 1, 1, 1,
0.1024938, -0.6328695, 3.893658, 1, 1, 1, 1, 1,
0.1078484, 0.7365673, -0.03978796, 1, 1, 1, 1, 1,
0.1108232, 2.488906, -0.4826075, 1, 1, 1, 1, 1,
0.1121568, 0.5550337, -1.091851, 1, 1, 1, 1, 1,
0.1132503, -0.9411533, 0.6910724, 1, 1, 1, 1, 1,
0.1149023, -0.874652, 2.456357, 1, 1, 1, 1, 1,
0.1232978, 0.792712, -1.463347, 1, 1, 1, 1, 1,
0.1262324, 0.8976125, -0.9062141, 1, 1, 1, 1, 1,
0.1284202, -0.2404044, 3.350205, 0, 0, 1, 1, 1,
0.1337176, -0.7811207, 1.92257, 1, 0, 0, 1, 1,
0.1342921, -0.4526053, 3.037243, 1, 0, 0, 1, 1,
0.1362682, -0.424303, 3.465852, 1, 0, 0, 1, 1,
0.146235, -2.384948, 4.06191, 1, 0, 0, 1, 1,
0.1466568, 1.508183, -1.177967, 1, 0, 0, 1, 1,
0.1498822, 1.40048, 0.1454121, 0, 0, 0, 1, 1,
0.1500882, -0.1244454, 0.2617995, 0, 0, 0, 1, 1,
0.1505617, 0.8073903, 0.4900446, 0, 0, 0, 1, 1,
0.1520185, -0.1086108, 1.621391, 0, 0, 0, 1, 1,
0.1528695, -1.722066, 2.490875, 0, 0, 0, 1, 1,
0.1541155, 0.7188378, 0.4819866, 0, 0, 0, 1, 1,
0.1626848, -1.300316, 3.989811, 0, 0, 0, 1, 1,
0.1671363, 1.073131, -0.7477828, 1, 1, 1, 1, 1,
0.1675846, 0.1937636, 1.047735, 1, 1, 1, 1, 1,
0.1737899, 0.06773426, 0.8606304, 1, 1, 1, 1, 1,
0.1743905, 0.5156629, -0.9093648, 1, 1, 1, 1, 1,
0.1794473, -0.6983199, 0.5053677, 1, 1, 1, 1, 1,
0.1805778, -0.9961089, 3.419071, 1, 1, 1, 1, 1,
0.1824818, -0.2745304, 2.112087, 1, 1, 1, 1, 1,
0.1871869, 0.582786, -1.332131, 1, 1, 1, 1, 1,
0.1885174, -0.2630765, 2.562371, 1, 1, 1, 1, 1,
0.1895308, -2.09066, 2.874149, 1, 1, 1, 1, 1,
0.1964363, -0.4208615, 3.346275, 1, 1, 1, 1, 1,
0.1988576, -0.1220153, 0.4546935, 1, 1, 1, 1, 1,
0.1995498, -0.8149659, 4.090465, 1, 1, 1, 1, 1,
0.2091831, -1.246134, 2.933908, 1, 1, 1, 1, 1,
0.2132471, 1.12102, 0.5156022, 1, 1, 1, 1, 1,
0.2138154, 3.111804, -1.323765, 0, 0, 1, 1, 1,
0.2142178, 1.018618, 0.2359169, 1, 0, 0, 1, 1,
0.2147211, 0.5046363, -1.07387, 1, 0, 0, 1, 1,
0.2173102, 0.1476458, 1.217295, 1, 0, 0, 1, 1,
0.2174498, -1.784426, 2.394803, 1, 0, 0, 1, 1,
0.2238002, -0.3396705, 2.64809, 1, 0, 0, 1, 1,
0.2240502, 0.9830009, 1.922539, 0, 0, 0, 1, 1,
0.2271203, 1.09456, 0.218012, 0, 0, 0, 1, 1,
0.2274466, -0.5748814, 1.604437, 0, 0, 0, 1, 1,
0.2308253, -0.3119359, 2.811108, 0, 0, 0, 1, 1,
0.2377856, -0.03771171, 0.4558024, 0, 0, 0, 1, 1,
0.238608, 0.08357462, -0.440949, 0, 0, 0, 1, 1,
0.246035, -0.3843222, 3.50616, 0, 0, 0, 1, 1,
0.246123, 0.4488429, 0.3277782, 1, 1, 1, 1, 1,
0.2469056, 0.5364081, -0.6158184, 1, 1, 1, 1, 1,
0.2479591, -3.014031, 3.791532, 1, 1, 1, 1, 1,
0.2481086, -0.5583698, 3.763665, 1, 1, 1, 1, 1,
0.2496885, -0.4088633, 3.042424, 1, 1, 1, 1, 1,
0.256319, -0.6233778, 3.022256, 1, 1, 1, 1, 1,
0.2564172, -0.8567753, 4.296221, 1, 1, 1, 1, 1,
0.2575226, -0.01293765, 2.727778, 1, 1, 1, 1, 1,
0.2576158, -0.5669176, 1.82393, 1, 1, 1, 1, 1,
0.2597405, 0.6189477, -0.6264127, 1, 1, 1, 1, 1,
0.2598337, 0.03011985, 0.3018415, 1, 1, 1, 1, 1,
0.2605627, -2.240918, 3.843044, 1, 1, 1, 1, 1,
0.2612808, -0.2240559, 3.610795, 1, 1, 1, 1, 1,
0.2677293, 0.6816728, 0.8610101, 1, 1, 1, 1, 1,
0.2732424, -0.847815, 1.429507, 1, 1, 1, 1, 1,
0.2767629, 0.002695561, 3.580196, 0, 0, 1, 1, 1,
0.2829544, 0.5086689, -1.957113, 1, 0, 0, 1, 1,
0.284297, -0.6873663, 3.965592, 1, 0, 0, 1, 1,
0.2945803, -0.747853, 2.467479, 1, 0, 0, 1, 1,
0.3035528, -0.005798812, 3.217438, 1, 0, 0, 1, 1,
0.3037142, 0.001288684, 0.5260659, 1, 0, 0, 1, 1,
0.3086889, 0.2291189, 1.2464, 0, 0, 0, 1, 1,
0.3165357, 0.009930232, 1.527817, 0, 0, 0, 1, 1,
0.3173661, 0.1210689, 0.4424555, 0, 0, 0, 1, 1,
0.3203555, -0.9370928, 2.323357, 0, 0, 0, 1, 1,
0.3205736, -0.8384773, 2.214232, 0, 0, 0, 1, 1,
0.3207591, -0.09650625, 1.803454, 0, 0, 0, 1, 1,
0.3240223, 0.6369392, 0.6221915, 0, 0, 0, 1, 1,
0.3240615, -0.7927969, 2.757843, 1, 1, 1, 1, 1,
0.3247612, -0.854696, 3.108598, 1, 1, 1, 1, 1,
0.3265748, -0.8268861, 1.205289, 1, 1, 1, 1, 1,
0.3271637, -1.010652, 3.397077, 1, 1, 1, 1, 1,
0.3344897, 2.392869, 0.193531, 1, 1, 1, 1, 1,
0.3345807, -1.920672, 3.097745, 1, 1, 1, 1, 1,
0.3349768, -1.767334, 3.086752, 1, 1, 1, 1, 1,
0.3428469, -0.1825554, 2.048795, 1, 1, 1, 1, 1,
0.3441404, 0.1992392, 1.022577, 1, 1, 1, 1, 1,
0.3470239, -0.8106708, 1.057394, 1, 1, 1, 1, 1,
0.3501891, -0.3291175, 2.777937, 1, 1, 1, 1, 1,
0.3527113, 0.3609629, 1.646869, 1, 1, 1, 1, 1,
0.3528696, -0.4259433, 2.2216, 1, 1, 1, 1, 1,
0.354779, -0.01001585, -0.1980861, 1, 1, 1, 1, 1,
0.3613477, 0.424716, -0.8101315, 1, 1, 1, 1, 1,
0.3669672, -0.4107983, 0.8446369, 0, 0, 1, 1, 1,
0.3688916, -0.8410968, 2.376409, 1, 0, 0, 1, 1,
0.3717358, 0.7823184, -0.8491126, 1, 0, 0, 1, 1,
0.3718444, 0.3571047, 0.6170107, 1, 0, 0, 1, 1,
0.3730458, 1.639914, -0.2506217, 1, 0, 0, 1, 1,
0.3773558, 0.8623836, 0.07828348, 1, 0, 0, 1, 1,
0.3828155, -0.1296085, 1.503834, 0, 0, 0, 1, 1,
0.3871807, -0.7982306, 3.406734, 0, 0, 0, 1, 1,
0.3885152, -0.6915154, 1.949312, 0, 0, 0, 1, 1,
0.390234, 1.723966, -0.7272375, 0, 0, 0, 1, 1,
0.3924281, -0.7313348, 3.495091, 0, 0, 0, 1, 1,
0.3955211, -0.389656, 1.395206, 0, 0, 0, 1, 1,
0.3973809, 1.487255, 0.4030396, 0, 0, 0, 1, 1,
0.3975615, -0.0543001, 1.420683, 1, 1, 1, 1, 1,
0.398085, -0.2833277, 1.126959, 1, 1, 1, 1, 1,
0.3981646, -0.5764504, 2.199113, 1, 1, 1, 1, 1,
0.3985727, 0.6828229, -0.9093812, 1, 1, 1, 1, 1,
0.4012617, -0.3323582, 1.502033, 1, 1, 1, 1, 1,
0.4024333, 0.1301304, 1.562874, 1, 1, 1, 1, 1,
0.4046831, 2.190633, 0.3632566, 1, 1, 1, 1, 1,
0.4111942, 0.1104141, 2.609581, 1, 1, 1, 1, 1,
0.4113721, 0.3732203, 1.409639, 1, 1, 1, 1, 1,
0.4114257, -1.542848, 2.350847, 1, 1, 1, 1, 1,
0.4122951, 0.9815385, 0.7204769, 1, 1, 1, 1, 1,
0.415836, 0.2451672, 1.832803, 1, 1, 1, 1, 1,
0.4172131, -0.3656382, 4.061263, 1, 1, 1, 1, 1,
0.4217235, 1.893745, -0.589593, 1, 1, 1, 1, 1,
0.4380682, 1.021074, -1.148716, 1, 1, 1, 1, 1,
0.4380994, -0.9100801, 2.199799, 0, 0, 1, 1, 1,
0.4442576, -0.5247191, 2.951241, 1, 0, 0, 1, 1,
0.4443342, 1.289349, 0.1791067, 1, 0, 0, 1, 1,
0.4489207, 0.06815845, 2.209206, 1, 0, 0, 1, 1,
0.4496756, -0.07744382, 0.2181621, 1, 0, 0, 1, 1,
0.4504258, 0.6708411, 1.832694, 1, 0, 0, 1, 1,
0.4586065, -0.5884387, 0.4328001, 0, 0, 0, 1, 1,
0.4586714, -0.2931401, 3.312385, 0, 0, 0, 1, 1,
0.4640141, -0.6723405, 4.557564, 0, 0, 0, 1, 1,
0.4646278, -1.056872, 2.361651, 0, 0, 0, 1, 1,
0.466165, 2.134009, 0.8365225, 0, 0, 0, 1, 1,
0.4743908, -0.5160227, 2.455899, 0, 0, 0, 1, 1,
0.4745865, -0.3379409, 1.255102, 0, 0, 0, 1, 1,
0.4756876, -1.975705, 3.211174, 1, 1, 1, 1, 1,
0.4761404, -0.1572493, 2.749019, 1, 1, 1, 1, 1,
0.4782613, -1.076977, 3.175507, 1, 1, 1, 1, 1,
0.4794455, -1.503732, 3.41842, 1, 1, 1, 1, 1,
0.4918763, -1.827332, 1.308575, 1, 1, 1, 1, 1,
0.4996772, 1.232166, -0.5522973, 1, 1, 1, 1, 1,
0.5004303, -0.3634955, 1.490247, 1, 1, 1, 1, 1,
0.5006837, -1.243505, 2.255208, 1, 1, 1, 1, 1,
0.5096142, 0.3355205, 0.9233844, 1, 1, 1, 1, 1,
0.5112652, 0.03720957, 2.179448, 1, 1, 1, 1, 1,
0.5115372, -2.227947, 2.367414, 1, 1, 1, 1, 1,
0.5154188, -1.55055, 2.842934, 1, 1, 1, 1, 1,
0.5157241, 0.1383472, 1.810338, 1, 1, 1, 1, 1,
0.5165833, 1.379018, -0.1781659, 1, 1, 1, 1, 1,
0.5202987, 0.08288018, 1.435044, 1, 1, 1, 1, 1,
0.5219174, -1.160066, 4.674137, 0, 0, 1, 1, 1,
0.5251058, 0.1452333, 1.329674, 1, 0, 0, 1, 1,
0.525911, -1.202149, 2.277278, 1, 0, 0, 1, 1,
0.5263299, -0.3747677, 3.686555, 1, 0, 0, 1, 1,
0.5309464, 1.656202, -0.03209262, 1, 0, 0, 1, 1,
0.5325964, -0.9154017, 1.571745, 1, 0, 0, 1, 1,
0.5374532, 0.3322087, 1.370665, 0, 0, 0, 1, 1,
0.537738, -0.4079804, 2.955035, 0, 0, 0, 1, 1,
0.5423132, -0.5455446, 2.142389, 0, 0, 0, 1, 1,
0.5430103, 0.8153501, 0.3187513, 0, 0, 0, 1, 1,
0.5473952, 0.09075014, 1.327615, 0, 0, 0, 1, 1,
0.5484089, -0.6704878, 1.326499, 0, 0, 0, 1, 1,
0.5506599, -0.4064697, 2.787084, 0, 0, 0, 1, 1,
0.5521176, 0.4919619, 2.38836, 1, 1, 1, 1, 1,
0.5526569, -1.861215, 3.850882, 1, 1, 1, 1, 1,
0.552828, -1.550142, 3.758739, 1, 1, 1, 1, 1,
0.5545918, -0.2926502, 1.709659, 1, 1, 1, 1, 1,
0.555474, -0.5080756, 1.065608, 1, 1, 1, 1, 1,
0.5612517, 1.413416, 1.060349, 1, 1, 1, 1, 1,
0.5671394, 0.04955123, 1.919147, 1, 1, 1, 1, 1,
0.5710523, -0.9448552, 3.400271, 1, 1, 1, 1, 1,
0.5723169, 0.1837863, 0.7366171, 1, 1, 1, 1, 1,
0.5800725, 0.2384487, 1.711013, 1, 1, 1, 1, 1,
0.5947704, -2.697407, 0.7196103, 1, 1, 1, 1, 1,
0.5949989, 0.2958763, 1.16017, 1, 1, 1, 1, 1,
0.5986311, 1.204016, 1.498353, 1, 1, 1, 1, 1,
0.5987051, 0.6672247, 0.652799, 1, 1, 1, 1, 1,
0.609001, -1.043246, 0.2988006, 1, 1, 1, 1, 1,
0.613724, 0.1336428, 1.064627, 0, 0, 1, 1, 1,
0.6147137, 0.4203836, 0.3563372, 1, 0, 0, 1, 1,
0.6160759, 1.105708, -0.4438361, 1, 0, 0, 1, 1,
0.6178371, -1.047376, 3.39349, 1, 0, 0, 1, 1,
0.6195519, 1.26474, -0.4169917, 1, 0, 0, 1, 1,
0.6204414, 1.362879, -0.4204288, 1, 0, 0, 1, 1,
0.6234587, 0.9208139, 0.3373269, 0, 0, 0, 1, 1,
0.6338801, -0.358695, 1.024949, 0, 0, 0, 1, 1,
0.642555, 0.589306, 0.7536393, 0, 0, 0, 1, 1,
0.6456866, -2.623703, 3.606831, 0, 0, 0, 1, 1,
0.6473484, -0.1281218, 2.330921, 0, 0, 0, 1, 1,
0.6506909, -0.09360712, 1.105935, 0, 0, 0, 1, 1,
0.6536838, 2.301094, -0.2933137, 0, 0, 0, 1, 1,
0.6555684, -0.1982314, 2.680984, 1, 1, 1, 1, 1,
0.6641255, 0.4212631, 2.623686, 1, 1, 1, 1, 1,
0.6685194, -1.479892, 3.632907, 1, 1, 1, 1, 1,
0.6686681, 1.418466, 0.952975, 1, 1, 1, 1, 1,
0.6704075, -0.7027608, 4.35168, 1, 1, 1, 1, 1,
0.6707017, 0.6693673, 0.110438, 1, 1, 1, 1, 1,
0.6719421, -0.1697573, 2.615298, 1, 1, 1, 1, 1,
0.6725765, -0.4604747, 2.643945, 1, 1, 1, 1, 1,
0.6767887, 0.3078678, 1.49951, 1, 1, 1, 1, 1,
0.6814689, -0.3403079, 1.635128, 1, 1, 1, 1, 1,
0.6864774, 2.197036, 1.370885, 1, 1, 1, 1, 1,
0.6914369, -0.7438297, 2.053928, 1, 1, 1, 1, 1,
0.698922, 1.536618, 0.3486326, 1, 1, 1, 1, 1,
0.7010856, 0.6261984, -0.2915242, 1, 1, 1, 1, 1,
0.7057902, 1.133942, 0.3889256, 1, 1, 1, 1, 1,
0.706256, -0.7384176, 2.878559, 0, 0, 1, 1, 1,
0.7170893, -0.4115058, 2.048561, 1, 0, 0, 1, 1,
0.7171884, 1.217789, -0.3022727, 1, 0, 0, 1, 1,
0.7184266, -1.959183, 3.242045, 1, 0, 0, 1, 1,
0.7234552, -0.03412177, 1.448058, 1, 0, 0, 1, 1,
0.7242353, -0.3176523, 3.648685, 1, 0, 0, 1, 1,
0.7242646, -1.413038, 2.593583, 0, 0, 0, 1, 1,
0.7325318, -0.5049061, 0.9633076, 0, 0, 0, 1, 1,
0.7331682, -0.6076183, 2.995387, 0, 0, 0, 1, 1,
0.7337449, -0.4061624, -0.3581392, 0, 0, 0, 1, 1,
0.7370186, 1.420676, 1.402708, 0, 0, 0, 1, 1,
0.7394897, 1.387548, 1.050759, 0, 0, 0, 1, 1,
0.744241, -0.7717512, 1.706339, 0, 0, 0, 1, 1,
0.7521158, 0.7401971, 0.7942665, 1, 1, 1, 1, 1,
0.7533028, -1.152069, 2.129239, 1, 1, 1, 1, 1,
0.7553617, 0.02515824, 1.080587, 1, 1, 1, 1, 1,
0.7568558, -0.1023812, 1.12413, 1, 1, 1, 1, 1,
0.7599856, 0.1235499, 2.162324, 1, 1, 1, 1, 1,
0.7626037, -0.04429607, 1.451641, 1, 1, 1, 1, 1,
0.7639578, 0.08521099, 0.8545352, 1, 1, 1, 1, 1,
0.7672918, -0.5506302, 3.365454, 1, 1, 1, 1, 1,
0.7683003, 0.7885311, 1.68246, 1, 1, 1, 1, 1,
0.7723626, 0.1487843, -0.8546312, 1, 1, 1, 1, 1,
0.7738441, -0.3697313, 3.314653, 1, 1, 1, 1, 1,
0.7775245, 0.4603074, 1.080911, 1, 1, 1, 1, 1,
0.7862036, -0.2505873, 1.186311, 1, 1, 1, 1, 1,
0.7939492, -0.5124692, 2.0174, 1, 1, 1, 1, 1,
0.7959937, -0.463466, 3.487098, 1, 1, 1, 1, 1,
0.7963197, 0.00746174, 1.891832, 0, 0, 1, 1, 1,
0.808621, 1.223212, 1.454877, 1, 0, 0, 1, 1,
0.8115306, -0.2121843, 3.098237, 1, 0, 0, 1, 1,
0.8135549, 0.1045315, 0.9536713, 1, 0, 0, 1, 1,
0.8172889, -0.08145851, 1.865369, 1, 0, 0, 1, 1,
0.8209305, -2.104044, 3.49368, 1, 0, 0, 1, 1,
0.823587, 0.4783399, -0.3097255, 0, 0, 0, 1, 1,
0.8238928, 2.8923, -1.302507, 0, 0, 0, 1, 1,
0.8268441, 1.36671, -1.414638, 0, 0, 0, 1, 1,
0.8301042, 0.9267121, 2.212395, 0, 0, 0, 1, 1,
0.831311, -1.134726, 2.192011, 0, 0, 0, 1, 1,
0.831648, -0.1641481, 1.873939, 0, 0, 0, 1, 1,
0.8349714, -1.381279, 4.413994, 0, 0, 0, 1, 1,
0.8417969, 0.01361563, 1.834378, 1, 1, 1, 1, 1,
0.8454411, -0.05944996, 1.751366, 1, 1, 1, 1, 1,
0.848462, 0.435018, 2.406574, 1, 1, 1, 1, 1,
0.8490776, -0.5077221, 3.084095, 1, 1, 1, 1, 1,
0.8513702, -0.6940621, 1.587994, 1, 1, 1, 1, 1,
0.851782, 1.138925, 0.8354252, 1, 1, 1, 1, 1,
0.8570271, -0.1565939, 0.3948711, 1, 1, 1, 1, 1,
0.8574415, 0.5972274, -0.04689622, 1, 1, 1, 1, 1,
0.863633, 0.6253646, -0.4682019, 1, 1, 1, 1, 1,
0.8688685, 1.973217, 0.9242682, 1, 1, 1, 1, 1,
0.871921, -0.2870411, 2.337457, 1, 1, 1, 1, 1,
0.8748055, 1.205176, 0.1480697, 1, 1, 1, 1, 1,
0.8778816, -0.141425, 1.330669, 1, 1, 1, 1, 1,
0.8809531, 0.6481849, 1.217811, 1, 1, 1, 1, 1,
0.8846943, -1.846532, 3.356622, 1, 1, 1, 1, 1,
0.8895144, 0.2786279, 0.05015088, 0, 0, 1, 1, 1,
0.895698, -0.7558935, 0.6475347, 1, 0, 0, 1, 1,
0.90262, -1.207705, 0.5549973, 1, 0, 0, 1, 1,
0.9032554, 0.3646057, 1.103267, 1, 0, 0, 1, 1,
0.9067628, -0.8074591, 2.776916, 1, 0, 0, 1, 1,
0.9138593, -2.133785, 2.349778, 1, 0, 0, 1, 1,
0.9152359, 1.007599, 1.548926, 0, 0, 0, 1, 1,
0.918467, -0.4858527, 0.9049892, 0, 0, 0, 1, 1,
0.9248583, 1.551603, 0.8456253, 0, 0, 0, 1, 1,
0.9299404, 0.7754621, 1.746611, 0, 0, 0, 1, 1,
0.9331034, -1.837878, 3.548353, 0, 0, 0, 1, 1,
0.9374475, -1.484574, 1.47531, 0, 0, 0, 1, 1,
0.9377253, -0.7837929, 1.559096, 0, 0, 0, 1, 1,
0.9427507, 0.363605, 0.478828, 1, 1, 1, 1, 1,
0.945958, 1.034441, -0.2573877, 1, 1, 1, 1, 1,
0.9469987, 0.0215215, 1.648962, 1, 1, 1, 1, 1,
0.9535918, 0.8180999, 1.464098, 1, 1, 1, 1, 1,
0.9545721, -3.161147, 5.688768, 1, 1, 1, 1, 1,
0.9618318, -0.8736018, 1.318779, 1, 1, 1, 1, 1,
0.9647305, 0.6320941, 1.613938, 1, 1, 1, 1, 1,
0.9748294, 0.271907, 1.05964, 1, 1, 1, 1, 1,
0.9815031, -0.6939244, -0.4300084, 1, 1, 1, 1, 1,
0.9822298, -1.628477, 1.935033, 1, 1, 1, 1, 1,
0.9872328, 0.8356069, 0.6442378, 1, 1, 1, 1, 1,
0.9894513, -1.115267, 2.530132, 1, 1, 1, 1, 1,
0.9919809, -2.091041, 2.050454, 1, 1, 1, 1, 1,
0.9930717, 0.08533222, 3.043367, 1, 1, 1, 1, 1,
0.9955097, 0.001277742, 1.463352, 1, 1, 1, 1, 1,
0.996771, -0.2934576, 2.652099, 0, 0, 1, 1, 1,
0.9967808, 1.949657, -0.850157, 1, 0, 0, 1, 1,
0.9970189, -0.3061636, 2.143316, 1, 0, 0, 1, 1,
1.000905, -0.1074122, 1.353621, 1, 0, 0, 1, 1,
1.006821, 0.001168068, 1.94216, 1, 0, 0, 1, 1,
1.008879, 0.7599772, 1.477646, 1, 0, 0, 1, 1,
1.008985, 0.3091981, 2.1788, 0, 0, 0, 1, 1,
1.009195, 0.5954761, 1.10325, 0, 0, 0, 1, 1,
1.011403, -1.151419, 2.06052, 0, 0, 0, 1, 1,
1.012934, 0.6877025, 2.408636, 0, 0, 0, 1, 1,
1.013166, -1.06392, 1.432261, 0, 0, 0, 1, 1,
1.024995, 0.6685849, 1.442328, 0, 0, 0, 1, 1,
1.035777, 0.3240703, 0.01273967, 0, 0, 0, 1, 1,
1.035904, -1.832813, 4.215508, 1, 1, 1, 1, 1,
1.039482, -0.1372886, 2.381056, 1, 1, 1, 1, 1,
1.047261, 0.1717177, 0.3292958, 1, 1, 1, 1, 1,
1.053039, 0.9642034, -0.02594672, 1, 1, 1, 1, 1,
1.055333, 0.04575837, 0.3434651, 1, 1, 1, 1, 1,
1.057616, 0.8140228, 0.6217802, 1, 1, 1, 1, 1,
1.067808, -0.2158516, 2.902275, 1, 1, 1, 1, 1,
1.070599, -0.5591407, 1.729632, 1, 1, 1, 1, 1,
1.075587, -0.759043, 1.400185, 1, 1, 1, 1, 1,
1.078482, 1.434287, 0.6143345, 1, 1, 1, 1, 1,
1.079986, 0.9110491, 3.54521, 1, 1, 1, 1, 1,
1.081887, -0.6821785, 2.843147, 1, 1, 1, 1, 1,
1.083499, 1.582468, 1.134968, 1, 1, 1, 1, 1,
1.085608, -0.02814889, 2.37345, 1, 1, 1, 1, 1,
1.087778, -0.1280269, -0.3800893, 1, 1, 1, 1, 1,
1.106412, 0.1192735, 1.346935, 0, 0, 1, 1, 1,
1.106413, -0.03861661, 1.300503, 1, 0, 0, 1, 1,
1.112803, -2.207387, 1.31367, 1, 0, 0, 1, 1,
1.124014, 1.539333, -0.7525213, 1, 0, 0, 1, 1,
1.12633, -0.8569936, 1.322864, 1, 0, 0, 1, 1,
1.128508, -1.209043, 3.660951, 1, 0, 0, 1, 1,
1.12992, -2.420134, 4.310177, 0, 0, 0, 1, 1,
1.131863, 0.4107741, 0.5656144, 0, 0, 0, 1, 1,
1.133162, 0.1057589, 1.497326, 0, 0, 0, 1, 1,
1.133321, -1.039549, 0.8974442, 0, 0, 0, 1, 1,
1.133871, -0.1342809, 3.421839, 0, 0, 0, 1, 1,
1.142497, 0.09900766, 1.441265, 0, 0, 0, 1, 1,
1.146242, 3.166361, 1.219941, 0, 0, 0, 1, 1,
1.146284, -0.865383, 3.566524, 1, 1, 1, 1, 1,
1.146711, 0.05562928, 1.992265, 1, 1, 1, 1, 1,
1.158193, 1.20743, 1.949802, 1, 1, 1, 1, 1,
1.166105, -0.53816, 2.435288, 1, 1, 1, 1, 1,
1.174399, -0.1764235, 1.772337, 1, 1, 1, 1, 1,
1.174617, -0.812665, 2.601536, 1, 1, 1, 1, 1,
1.176471, 0.1332949, 0.8316337, 1, 1, 1, 1, 1,
1.177412, -0.06594531, 0.3147689, 1, 1, 1, 1, 1,
1.178071, 0.294727, 1.141201, 1, 1, 1, 1, 1,
1.180877, 1.08923, 0.8450596, 1, 1, 1, 1, 1,
1.18559, -0.1668507, 2.116037, 1, 1, 1, 1, 1,
1.189866, 0.2044807, 2.226642, 1, 1, 1, 1, 1,
1.21681, -1.071093, 2.447796, 1, 1, 1, 1, 1,
1.233054, -1.033484, 2.986716, 1, 1, 1, 1, 1,
1.236717, -1.338293, 3.496742, 1, 1, 1, 1, 1,
1.246071, -0.3006107, 1.425015, 0, 0, 1, 1, 1,
1.248523, -0.1633338, 1.670305, 1, 0, 0, 1, 1,
1.250713, 0.01488725, 1.068003, 1, 0, 0, 1, 1,
1.255994, 2.381096, 0.3440937, 1, 0, 0, 1, 1,
1.257668, -0.05464953, 1.657214, 1, 0, 0, 1, 1,
1.274333, 1.104582, 1.837658, 1, 0, 0, 1, 1,
1.277928, 1.61678, 2.756568, 0, 0, 0, 1, 1,
1.278331, 0.7543204, 1.435207, 0, 0, 0, 1, 1,
1.278495, 0.775452, 2.661003, 0, 0, 0, 1, 1,
1.2802, 0.333783, 2.099627, 0, 0, 0, 1, 1,
1.285854, 0.1065737, 0.6728181, 0, 0, 0, 1, 1,
1.286791, 0.1146776, 2.075938, 0, 0, 0, 1, 1,
1.296372, 0.7801411, 0.6471378, 0, 0, 0, 1, 1,
1.296378, -0.6646422, 3.168098, 1, 1, 1, 1, 1,
1.312966, 0.4232977, 1.137749, 1, 1, 1, 1, 1,
1.313658, 0.8389035, 0.5868253, 1, 1, 1, 1, 1,
1.318376, 0.6481471, 0.7534553, 1, 1, 1, 1, 1,
1.328752, -0.7708622, 2.239753, 1, 1, 1, 1, 1,
1.339196, 0.3554667, 1.034543, 1, 1, 1, 1, 1,
1.35752, 0.8533252, 2.958862, 1, 1, 1, 1, 1,
1.361123, -0.3617066, 1.772352, 1, 1, 1, 1, 1,
1.379194, 0.8217723, -0.03384487, 1, 1, 1, 1, 1,
1.38162, -1.007608, 1.754153, 1, 1, 1, 1, 1,
1.403214, 0.7056468, -0.4761722, 1, 1, 1, 1, 1,
1.403848, 0.08461776, 1.868691, 1, 1, 1, 1, 1,
1.406078, -0.8644022, -0.7116779, 1, 1, 1, 1, 1,
1.411032, 1.895407, 0.3993748, 1, 1, 1, 1, 1,
1.417446, -0.3558796, 0.6113036, 1, 1, 1, 1, 1,
1.430129, -0.7375063, 1.177603, 0, 0, 1, 1, 1,
1.437005, -0.6802217, 3.275294, 1, 0, 0, 1, 1,
1.439174, -1.52429, 1.611976, 1, 0, 0, 1, 1,
1.445799, 0.6583676, 3.012884, 1, 0, 0, 1, 1,
1.446088, 0.4559112, 1.708187, 1, 0, 0, 1, 1,
1.452356, -0.696559, 2.420233, 1, 0, 0, 1, 1,
1.460729, 0.2134892, 2.463278, 0, 0, 0, 1, 1,
1.465746, -0.5865005, 0.3729349, 0, 0, 0, 1, 1,
1.473144, 0.00491508, 1.294332, 0, 0, 0, 1, 1,
1.474518, 0.7341418, 1.44172, 0, 0, 0, 1, 1,
1.476749, 1.273889, 1.802179, 0, 0, 0, 1, 1,
1.498945, 0.7668439, 1.947817, 0, 0, 0, 1, 1,
1.510275, -0.8806257, 0.8093854, 0, 0, 0, 1, 1,
1.524577, -0.03257312, 3.316281, 1, 1, 1, 1, 1,
1.531362, 0.6947163, 1.486781, 1, 1, 1, 1, 1,
1.546885, 0.8663967, 1.761979, 1, 1, 1, 1, 1,
1.565284, 2.129797, 2.257347, 1, 1, 1, 1, 1,
1.620296, -0.5104995, 3.569214, 1, 1, 1, 1, 1,
1.628576, 3.025779, -0.3064698, 1, 1, 1, 1, 1,
1.636221, 0.04028769, 0.4984914, 1, 1, 1, 1, 1,
1.64147, -0.9321821, 3.064631, 1, 1, 1, 1, 1,
1.657364, 0.04471815, 2.145345, 1, 1, 1, 1, 1,
1.664732, -0.3716148, 0.9329807, 1, 1, 1, 1, 1,
1.666005, 0.3558318, 0.9322751, 1, 1, 1, 1, 1,
1.687352, -0.7946846, 2.490428, 1, 1, 1, 1, 1,
1.695128, -0.27705, 1.149324, 1, 1, 1, 1, 1,
1.70315, -1.160738, 2.136564, 1, 1, 1, 1, 1,
1.710046, -0.5146785, 1.325531, 1, 1, 1, 1, 1,
1.721992, -0.265693, 1.0028, 0, 0, 1, 1, 1,
1.738971, -1.897452, 3.084233, 1, 0, 0, 1, 1,
1.753236, 0.1613855, 0.660661, 1, 0, 0, 1, 1,
1.765369, -0.668248, 1.917624, 1, 0, 0, 1, 1,
1.802032, -1.192201, 2.009392, 1, 0, 0, 1, 1,
1.809887, 0.9244074, 1.451802, 1, 0, 0, 1, 1,
1.811796, -1.503078, 4.215849, 0, 0, 0, 1, 1,
1.819152, -1.440369, 3.174652, 0, 0, 0, 1, 1,
1.840829, 0.05969024, 3.120627, 0, 0, 0, 1, 1,
1.841442, -1.135406, 1.382745, 0, 0, 0, 1, 1,
1.842466, 1.289297, -0.2631841, 0, 0, 0, 1, 1,
1.843668, -1.653972, 0.9579264, 0, 0, 0, 1, 1,
1.848636, -1.175775, 3.354834, 0, 0, 0, 1, 1,
1.881955, -1.515938, 2.029275, 1, 1, 1, 1, 1,
1.914226, -1.198507, 4.132905, 1, 1, 1, 1, 1,
1.932804, -0.8832451, 1.87307, 1, 1, 1, 1, 1,
1.934812, 0.5527434, 1.442551, 1, 1, 1, 1, 1,
1.941743, 0.1819706, 3.919321, 1, 1, 1, 1, 1,
1.945391, 1.052274, 0.3850834, 1, 1, 1, 1, 1,
1.963721, -2.345169, 3.100902, 1, 1, 1, 1, 1,
1.966023, -0.329621, 1.792852, 1, 1, 1, 1, 1,
1.9725, 0.6318278, 2.047811, 1, 1, 1, 1, 1,
1.983802, 0.305305, -0.3860664, 1, 1, 1, 1, 1,
1.99955, 0.84492, 2.384975, 1, 1, 1, 1, 1,
2.005898, -2.035761, 3.867332, 1, 1, 1, 1, 1,
2.007362, 1.802196, 1.374001, 1, 1, 1, 1, 1,
2.009496, -0.1695721, 1.315214, 1, 1, 1, 1, 1,
2.015512, -0.1641989, 2.209464, 1, 1, 1, 1, 1,
2.026174, 0.7263547, 1.585818, 0, 0, 1, 1, 1,
2.030126, -2.450787, 2.24132, 1, 0, 0, 1, 1,
2.030614, 0.4204753, 1.652221, 1, 0, 0, 1, 1,
2.048104, -0.3852426, 1.761651, 1, 0, 0, 1, 1,
2.049592, 0.4668517, 0.7862774, 1, 0, 0, 1, 1,
2.070144, 0.9015141, -0.1400771, 1, 0, 0, 1, 1,
2.071269, 0.9056237, -1.367119, 0, 0, 0, 1, 1,
2.090521, -1.328145, 2.499623, 0, 0, 0, 1, 1,
2.140955, -0.5800806, 1.75394, 0, 0, 0, 1, 1,
2.146736, 1.181001, 0.7793261, 0, 0, 0, 1, 1,
2.154616, 0.2405578, 1.151711, 0, 0, 0, 1, 1,
2.171428, -0.04015985, 3.148808, 0, 0, 0, 1, 1,
2.183337, 1.024049, 1.696864, 0, 0, 0, 1, 1,
2.267755, -0.2644377, 3.754859, 1, 1, 1, 1, 1,
2.285153, 1.213989, 2.340938, 1, 1, 1, 1, 1,
2.378757, -0.186878, 2.767351, 1, 1, 1, 1, 1,
2.842472, -0.5659456, 1.430011, 1, 1, 1, 1, 1,
2.938666, 0.5715114, 1.78506, 1, 1, 1, 1, 1,
2.985956, 0.7708116, 2.883396, 1, 1, 1, 1, 1,
3.504205, -0.4144342, 0.5610298, 1, 1, 1, 1, 1
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
var radius = 10.12294;
var distance = 35.5564;
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
mvMatrix.translate( 0.01663589, 0.2956684, -0.3989775 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.5564);
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