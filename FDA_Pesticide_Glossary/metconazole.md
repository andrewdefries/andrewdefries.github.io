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
-2.756562, 1.085289, -0.5257552, 1, 0, 0, 1,
-2.735405, 0.6638212, -1.365236, 1, 0.007843138, 0, 1,
-2.690765, -0.6143393, -0.778129, 1, 0.01176471, 0, 1,
-2.623265, -0.9502944, -0.6530867, 1, 0.01960784, 0, 1,
-2.587796, -0.6137699, -0.5135457, 1, 0.02352941, 0, 1,
-2.444727, 1.577056, -0.5576821, 1, 0.03137255, 0, 1,
-2.426239, 0.2195749, -2.665633, 1, 0.03529412, 0, 1,
-2.404479, 0.3582391, -0.6124057, 1, 0.04313726, 0, 1,
-2.393493, -0.24511, -2.695673, 1, 0.04705882, 0, 1,
-2.353322, 1.687617, -1.171644, 1, 0.05490196, 0, 1,
-2.317696, -0.3728245, -2.066714, 1, 0.05882353, 0, 1,
-2.268613, -0.02040977, -2.560431, 1, 0.06666667, 0, 1,
-2.252489, 0.5663336, -0.5627413, 1, 0.07058824, 0, 1,
-2.241294, -0.5072958, -0.08751939, 1, 0.07843138, 0, 1,
-2.195077, 1.480796, -0.9775719, 1, 0.08235294, 0, 1,
-2.172542, -1.529978, -0.3337346, 1, 0.09019608, 0, 1,
-2.145949, 0.1968814, -3.283108, 1, 0.09411765, 0, 1,
-2.003593, 1.433141, -0.5198627, 1, 0.1019608, 0, 1,
-1.978441, -0.806241, -1.140845, 1, 0.1098039, 0, 1,
-1.940138, -0.1371634, -1.681825, 1, 0.1137255, 0, 1,
-1.927568, -2.049077, -1.149381, 1, 0.1215686, 0, 1,
-1.925121, 0.2726107, -2.7085, 1, 0.1254902, 0, 1,
-1.900959, 1.290897, -1.196183, 1, 0.1333333, 0, 1,
-1.884706, -1.441231, -2.341991, 1, 0.1372549, 0, 1,
-1.878767, -1.979693, -1.253151, 1, 0.145098, 0, 1,
-1.863857, 0.08564934, -1.586503, 1, 0.1490196, 0, 1,
-1.844613, 0.05490211, -0.6530614, 1, 0.1568628, 0, 1,
-1.839345, 0.1991873, -1.57459, 1, 0.1607843, 0, 1,
-1.827646, -0.4993405, -3.410295, 1, 0.1686275, 0, 1,
-1.798564, 0.3726964, -1.146842, 1, 0.172549, 0, 1,
-1.798476, -0.6920855, -0.607847, 1, 0.1803922, 0, 1,
-1.794803, -0.4631299, -1.902726, 1, 0.1843137, 0, 1,
-1.78663, 1.10971, -1.522017, 1, 0.1921569, 0, 1,
-1.778316, -0.6673347, -1.708594, 1, 0.1960784, 0, 1,
-1.742593, 0.02588003, -1.010669, 1, 0.2039216, 0, 1,
-1.739461, 0.2768721, -0.77318, 1, 0.2117647, 0, 1,
-1.724679, -1.037879, -2.14573, 1, 0.2156863, 0, 1,
-1.724545, -0.6737829, -1.762412, 1, 0.2235294, 0, 1,
-1.702241, 0.1301242, -0.6379457, 1, 0.227451, 0, 1,
-1.670816, 0.1593609, -2.298788, 1, 0.2352941, 0, 1,
-1.660446, -0.4004425, -0.4896339, 1, 0.2392157, 0, 1,
-1.659885, 0.2627176, -1.010922, 1, 0.2470588, 0, 1,
-1.638448, 0.7272959, -0.3661803, 1, 0.2509804, 0, 1,
-1.628412, -0.7065644, -2.15291, 1, 0.2588235, 0, 1,
-1.625225, 0.001216324, -3.015111, 1, 0.2627451, 0, 1,
-1.621901, 0.5237509, -2.471365, 1, 0.2705882, 0, 1,
-1.610521, -0.6808044, -0.9241791, 1, 0.2745098, 0, 1,
-1.60676, 0.6160408, -0.6781367, 1, 0.282353, 0, 1,
-1.586444, 1.439028, -0.0812299, 1, 0.2862745, 0, 1,
-1.581659, -0.6789156, -1.776347, 1, 0.2941177, 0, 1,
-1.576358, 0.67308, -2.829998, 1, 0.3019608, 0, 1,
-1.566431, -0.9141234, -2.833937, 1, 0.3058824, 0, 1,
-1.562334, -0.6763824, -4.077085, 1, 0.3137255, 0, 1,
-1.560672, 0.9260707, -2.307158, 1, 0.3176471, 0, 1,
-1.542509, 0.5225958, 1.663967, 1, 0.3254902, 0, 1,
-1.524156, 0.1606104, -1.976085, 1, 0.3294118, 0, 1,
-1.511943, -0.4739664, -2.818765, 1, 0.3372549, 0, 1,
-1.507678, -0.7460998, -0.5312713, 1, 0.3411765, 0, 1,
-1.505494, -0.0227343, -1.180902, 1, 0.3490196, 0, 1,
-1.504904, 0.02715983, -1.100197, 1, 0.3529412, 0, 1,
-1.476683, 1.132578, -0.2413887, 1, 0.3607843, 0, 1,
-1.467351, 0.1759296, -2.290295, 1, 0.3647059, 0, 1,
-1.466707, -1.498336, -1.428034, 1, 0.372549, 0, 1,
-1.462038, 0.801434, -1.44116, 1, 0.3764706, 0, 1,
-1.441968, -0.9999355, -0.9660125, 1, 0.3843137, 0, 1,
-1.440876, 0.1688103, -2.939094, 1, 0.3882353, 0, 1,
-1.439935, 1.165171, -1.098628, 1, 0.3960784, 0, 1,
-1.417393, 1.185306, -2.450764, 1, 0.4039216, 0, 1,
-1.410178, -0.1305014, -2.702061, 1, 0.4078431, 0, 1,
-1.401702, 0.7009466, -2.113668, 1, 0.4156863, 0, 1,
-1.396279, 0.2275465, -0.578136, 1, 0.4196078, 0, 1,
-1.390553, 0.2334928, -1.043672, 1, 0.427451, 0, 1,
-1.38286, 0.2214549, -1.103874, 1, 0.4313726, 0, 1,
-1.367384, 0.4661305, -2.129044, 1, 0.4392157, 0, 1,
-1.365119, -0.9991837, -2.639054, 1, 0.4431373, 0, 1,
-1.334154, -0.2453893, -0.9026515, 1, 0.4509804, 0, 1,
-1.328512, 0.689396, -0.5166558, 1, 0.454902, 0, 1,
-1.323273, -0.1293261, -2.979964, 1, 0.4627451, 0, 1,
-1.318156, 0.802816, -1.127442, 1, 0.4666667, 0, 1,
-1.306586, 0.4913573, -1.243223, 1, 0.4745098, 0, 1,
-1.279306, 0.07379764, -1.441665, 1, 0.4784314, 0, 1,
-1.269266, -0.6326126, -0.7000663, 1, 0.4862745, 0, 1,
-1.265409, 0.7424088, -0.6117188, 1, 0.4901961, 0, 1,
-1.264363, -1.276976, -1.557118, 1, 0.4980392, 0, 1,
-1.264066, -0.4241497, -0.7076296, 1, 0.5058824, 0, 1,
-1.261155, -0.1903685, -0.4608232, 1, 0.509804, 0, 1,
-1.249271, -0.6976933, -1.766349, 1, 0.5176471, 0, 1,
-1.248095, -1.106552, -1.543539, 1, 0.5215687, 0, 1,
-1.241633, -0.5592276, -0.4346153, 1, 0.5294118, 0, 1,
-1.241271, 0.4081475, -0.3054569, 1, 0.5333334, 0, 1,
-1.234178, 1.027258, -1.122391, 1, 0.5411765, 0, 1,
-1.229715, -0.9583549, -0.8920903, 1, 0.5450981, 0, 1,
-1.228762, -0.3726858, 0.05126949, 1, 0.5529412, 0, 1,
-1.228682, 0.1985088, -0.9543335, 1, 0.5568628, 0, 1,
-1.227451, -1.085818, -1.886485, 1, 0.5647059, 0, 1,
-1.226867, 0.7016065, -2.229486, 1, 0.5686275, 0, 1,
-1.221822, -0.8106952, -0.674131, 1, 0.5764706, 0, 1,
-1.217373, -1.926698, -3.087948, 1, 0.5803922, 0, 1,
-1.187581, 0.8151587, -2.125632, 1, 0.5882353, 0, 1,
-1.186394, -1.087075, -2.749767, 1, 0.5921569, 0, 1,
-1.181725, -0.5569161, -2.677224, 1, 0.6, 0, 1,
-1.178949, -0.9313694, -1.649598, 1, 0.6078432, 0, 1,
-1.176523, 0.8285453, -0.6808552, 1, 0.6117647, 0, 1,
-1.174543, 0.5813971, -0.7841825, 1, 0.6196079, 0, 1,
-1.174479, -0.09010132, -2.161008, 1, 0.6235294, 0, 1,
-1.164295, 2.228603, 0.3193803, 1, 0.6313726, 0, 1,
-1.157206, -1.031647, -1.823424, 1, 0.6352941, 0, 1,
-1.150144, 1.536096, -0.6710069, 1, 0.6431373, 0, 1,
-1.149337, 1.675451, 0.1851491, 1, 0.6470588, 0, 1,
-1.149024, 0.2822243, -0.323437, 1, 0.654902, 0, 1,
-1.145843, 0.2972642, -0.4067825, 1, 0.6588235, 0, 1,
-1.143519, -0.8754965, -2.186524, 1, 0.6666667, 0, 1,
-1.134408, 0.606585, -1.762295, 1, 0.6705883, 0, 1,
-1.133026, 1.949738, 0.2261642, 1, 0.6784314, 0, 1,
-1.130609, 0.4642676, -1.812017, 1, 0.682353, 0, 1,
-1.127516, -1.258692, -3.518897, 1, 0.6901961, 0, 1,
-1.123636, -1.047742, -3.915032, 1, 0.6941177, 0, 1,
-1.113022, -0.6734973, -0.5735832, 1, 0.7019608, 0, 1,
-1.112046, 0.2244113, -0.5201505, 1, 0.7098039, 0, 1,
-1.110684, -2.04143, -1.167258, 1, 0.7137255, 0, 1,
-1.109266, -0.3135855, -1.400275, 1, 0.7215686, 0, 1,
-1.099809, 0.3572191, -0.3589452, 1, 0.7254902, 0, 1,
-1.099225, -1.100131, -1.884703, 1, 0.7333333, 0, 1,
-1.097295, 1.30776, -0.09356353, 1, 0.7372549, 0, 1,
-1.096614, 0.6549723, -0.2715668, 1, 0.7450981, 0, 1,
-1.095197, -0.1143645, -0.0583734, 1, 0.7490196, 0, 1,
-1.095093, 0.634909, -0.4304557, 1, 0.7568628, 0, 1,
-1.092523, -0.6669581, -0.4083582, 1, 0.7607843, 0, 1,
-1.089869, 1.062399, 0.2750717, 1, 0.7686275, 0, 1,
-1.088098, -1.276492, -3.768385, 1, 0.772549, 0, 1,
-1.08503, -0.3603271, -0.9183008, 1, 0.7803922, 0, 1,
-1.067099, -0.2054755, -2.327035, 1, 0.7843137, 0, 1,
-1.066875, 0.5854575, -1.415796, 1, 0.7921569, 0, 1,
-1.066664, -2.27762, -4.700388, 1, 0.7960784, 0, 1,
-1.064332, -0.7780269, -3.680238, 1, 0.8039216, 0, 1,
-1.063302, 1.32208, -2.419085, 1, 0.8117647, 0, 1,
-1.054817, -0.7824873, -0.835833, 1, 0.8156863, 0, 1,
-1.053249, 1.269057, 0.2530763, 1, 0.8235294, 0, 1,
-1.0511, -0.5516842, -2.234498, 1, 0.827451, 0, 1,
-1.044349, -0.8004408, -0.4031033, 1, 0.8352941, 0, 1,
-1.041884, -1.440374, -2.610378, 1, 0.8392157, 0, 1,
-1.0413, 1.515499, -1.75455, 1, 0.8470588, 0, 1,
-1.040463, 0.1044756, -1.77646, 1, 0.8509804, 0, 1,
-1.039359, 0.287849, -1.311943, 1, 0.8588235, 0, 1,
-1.031828, 0.7307554, -4.358725, 1, 0.8627451, 0, 1,
-1.028419, 1.501225, -0.6352068, 1, 0.8705882, 0, 1,
-1.0276, 1.043005, -0.02851175, 1, 0.8745098, 0, 1,
-1.025783, 0.9794809, 0.296027, 1, 0.8823529, 0, 1,
-1.023163, 0.5040835, -0.4347439, 1, 0.8862745, 0, 1,
-1.011734, -0.4911497, -2.110994, 1, 0.8941177, 0, 1,
-1.005591, 1.569763, 2.429267, 1, 0.8980392, 0, 1,
-1.004221, -0.9716535, -2.339628, 1, 0.9058824, 0, 1,
-0.9987546, 0.2717536, -0.4681593, 1, 0.9137255, 0, 1,
-0.9954475, -0.6955501, -3.794144, 1, 0.9176471, 0, 1,
-0.9924186, -0.6022112, -3.120309, 1, 0.9254902, 0, 1,
-0.9912319, 0.322162, -1.261407, 1, 0.9294118, 0, 1,
-0.990557, 1.740304, -0.2601618, 1, 0.9372549, 0, 1,
-0.9877745, -1.678436, -3.641483, 1, 0.9411765, 0, 1,
-0.9812641, -0.957978, -1.892599, 1, 0.9490196, 0, 1,
-0.9696736, -0.4819265, -1.808798, 1, 0.9529412, 0, 1,
-0.9573602, -0.9009038, -0.2077481, 1, 0.9607843, 0, 1,
-0.9570022, 1.578536, 0.08516889, 1, 0.9647059, 0, 1,
-0.950854, -0.3114553, -3.065301, 1, 0.972549, 0, 1,
-0.9487393, 0.4422638, -0.6700782, 1, 0.9764706, 0, 1,
-0.9403296, 0.6646909, -0.6099428, 1, 0.9843137, 0, 1,
-0.9363719, 1.147305, -1.938257, 1, 0.9882353, 0, 1,
-0.9345444, -0.6939018, -1.245147, 1, 0.9960784, 0, 1,
-0.9292907, 0.2525653, -0.2509047, 0.9960784, 1, 0, 1,
-0.9286905, -1.999032, -1.810017, 0.9921569, 1, 0, 1,
-0.9235504, -0.1194037, 0.106667, 0.9843137, 1, 0, 1,
-0.9122522, 0.1502655, -0.753309, 0.9803922, 1, 0, 1,
-0.9097448, 0.9068754, 1.754906, 0.972549, 1, 0, 1,
-0.9073685, -2.530634, -4.804678, 0.9686275, 1, 0, 1,
-0.9059559, 1.058714, -1.158453, 0.9607843, 1, 0, 1,
-0.8923426, -1.102795, -2.761261, 0.9568627, 1, 0, 1,
-0.8885895, 0.546362, -2.310377, 0.9490196, 1, 0, 1,
-0.8846318, -0.193603, -1.513494, 0.945098, 1, 0, 1,
-0.882858, 2.150865, -0.5535598, 0.9372549, 1, 0, 1,
-0.8788645, 0.1456015, -1.52466, 0.9333333, 1, 0, 1,
-0.8693425, 0.7382289, -0.5537015, 0.9254902, 1, 0, 1,
-0.8651835, -0.7179914, -2.718445, 0.9215686, 1, 0, 1,
-0.8593658, -0.460172, -2.704446, 0.9137255, 1, 0, 1,
-0.8592378, -0.05593903, -0.4657038, 0.9098039, 1, 0, 1,
-0.8582695, 0.2539091, -2.262967, 0.9019608, 1, 0, 1,
-0.8486845, -0.8903858, -1.343112, 0.8941177, 1, 0, 1,
-0.8391346, -0.2893415, -1.523354, 0.8901961, 1, 0, 1,
-0.8373788, -1.081451, -1.065895, 0.8823529, 1, 0, 1,
-0.8370251, -0.08312016, -3.551858, 0.8784314, 1, 0, 1,
-0.8368014, -0.1839208, -1.054526, 0.8705882, 1, 0, 1,
-0.8322763, -0.4651924, -1.210151, 0.8666667, 1, 0, 1,
-0.8320556, 1.261879, -0.1921697, 0.8588235, 1, 0, 1,
-0.8291252, -0.2383475, -2.108361, 0.854902, 1, 0, 1,
-0.8194319, -1.270199, -2.522138, 0.8470588, 1, 0, 1,
-0.8138527, -0.3042075, -0.946905, 0.8431373, 1, 0, 1,
-0.8115295, -0.06228496, -0.7021229, 0.8352941, 1, 0, 1,
-0.8076921, -0.2635892, -2.583102, 0.8313726, 1, 0, 1,
-0.8061916, -0.9819364, -3.445818, 0.8235294, 1, 0, 1,
-0.8036719, 0.3759023, -1.173674, 0.8196079, 1, 0, 1,
-0.801294, -1.283044, -1.999418, 0.8117647, 1, 0, 1,
-0.7986171, 1.762397, -0.7296358, 0.8078431, 1, 0, 1,
-0.798085, -1.045648, -1.124053, 0.8, 1, 0, 1,
-0.7934881, -0.6906163, -2.695858, 0.7921569, 1, 0, 1,
-0.7923069, 0.6888875, -1.345461, 0.7882353, 1, 0, 1,
-0.7870642, -1.753752, -2.172971, 0.7803922, 1, 0, 1,
-0.7847472, -1.211244, -2.339126, 0.7764706, 1, 0, 1,
-0.7835768, 0.7418144, 0.9103208, 0.7686275, 1, 0, 1,
-0.7804442, 0.8206681, -0.2351403, 0.7647059, 1, 0, 1,
-0.7801379, 0.4265456, -0.2320361, 0.7568628, 1, 0, 1,
-0.7797703, 2.185002, -0.9064541, 0.7529412, 1, 0, 1,
-0.7737646, 0.3397351, -0.5657, 0.7450981, 1, 0, 1,
-0.7678485, 0.2465571, -0.6607655, 0.7411765, 1, 0, 1,
-0.7640401, 1.519803, -0.6697807, 0.7333333, 1, 0, 1,
-0.7623555, -0.9155991, -2.492373, 0.7294118, 1, 0, 1,
-0.75938, 0.505559, 0.08481324, 0.7215686, 1, 0, 1,
-0.7572873, 1.991666, -0.6048771, 0.7176471, 1, 0, 1,
-0.7558926, 0.7028696, 0.01855507, 0.7098039, 1, 0, 1,
-0.7523133, 0.6463345, 0.4039728, 0.7058824, 1, 0, 1,
-0.7515152, 0.4914773, -2.461721, 0.6980392, 1, 0, 1,
-0.7443874, -0.6061592, -1.491784, 0.6901961, 1, 0, 1,
-0.7397249, -0.6939217, -3.013048, 0.6862745, 1, 0, 1,
-0.7288448, -0.3515797, -0.8263698, 0.6784314, 1, 0, 1,
-0.7262378, 1.72199, 0.10208, 0.6745098, 1, 0, 1,
-0.7216805, -1.255668, -1.925632, 0.6666667, 1, 0, 1,
-0.7210237, -1.257832, -2.93433, 0.6627451, 1, 0, 1,
-0.7184127, -1.621081, -2.676426, 0.654902, 1, 0, 1,
-0.7123615, -0.2070162, -2.609542, 0.6509804, 1, 0, 1,
-0.7077589, -0.1577563, -3.439206, 0.6431373, 1, 0, 1,
-0.707302, 1.377215, 1.397367, 0.6392157, 1, 0, 1,
-0.7032396, 1.82299, 1.547752, 0.6313726, 1, 0, 1,
-0.7008787, 0.1709799, -2.342116, 0.627451, 1, 0, 1,
-0.7003427, -0.7496143, -4.583671, 0.6196079, 1, 0, 1,
-0.7002236, 0.8159541, -1.782736, 0.6156863, 1, 0, 1,
-0.6972516, 0.1130727, -0.5673684, 0.6078432, 1, 0, 1,
-0.6962517, 1.781813, -0.6953846, 0.6039216, 1, 0, 1,
-0.6839385, -1.467883, -1.303563, 0.5960785, 1, 0, 1,
-0.6836821, 1.262975, 0.2580766, 0.5882353, 1, 0, 1,
-0.6797612, 0.5868497, -0.2978019, 0.5843138, 1, 0, 1,
-0.6796536, -0.4489226, -4.521041, 0.5764706, 1, 0, 1,
-0.6746854, -1.617372, -2.075452, 0.572549, 1, 0, 1,
-0.6735098, -1.486942, -3.171061, 0.5647059, 1, 0, 1,
-0.6708543, -0.2190221, -3.161324, 0.5607843, 1, 0, 1,
-0.6702368, -1.123229, -2.941653, 0.5529412, 1, 0, 1,
-0.6542344, 1.142902, 1.752311, 0.5490196, 1, 0, 1,
-0.6516424, -0.8785517, -2.006863, 0.5411765, 1, 0, 1,
-0.6478255, -0.7135163, -0.3980197, 0.5372549, 1, 0, 1,
-0.6435633, 0.1814565, -2.330491, 0.5294118, 1, 0, 1,
-0.6360277, -0.9443225, -1.497856, 0.5254902, 1, 0, 1,
-0.6321917, 0.3173035, -3.109885, 0.5176471, 1, 0, 1,
-0.6303536, -0.08649571, -0.8998293, 0.5137255, 1, 0, 1,
-0.6281368, -0.08397583, -1.115008, 0.5058824, 1, 0, 1,
-0.6179982, 0.5982552, -1.313635, 0.5019608, 1, 0, 1,
-0.6172545, -0.3307278, -3.519312, 0.4941176, 1, 0, 1,
-0.6067741, 0.02582099, -1.512623, 0.4862745, 1, 0, 1,
-0.6025918, 0.6607895, -0.959092, 0.4823529, 1, 0, 1,
-0.6023647, 0.8017397, -0.3612129, 0.4745098, 1, 0, 1,
-0.5963963, 1.242971, -0.4111317, 0.4705882, 1, 0, 1,
-0.5923905, 0.3019867, -2.153543, 0.4627451, 1, 0, 1,
-0.5912604, -1.186262, -3.776374, 0.4588235, 1, 0, 1,
-0.5879862, 0.3067887, 0.3518969, 0.4509804, 1, 0, 1,
-0.5842308, 2.154343, 0.06961714, 0.4470588, 1, 0, 1,
-0.5782464, -0.1437162, -1.018628, 0.4392157, 1, 0, 1,
-0.5732853, -1.122892, -4.010843, 0.4352941, 1, 0, 1,
-0.5696332, 0.3067944, -0.5596697, 0.427451, 1, 0, 1,
-0.5693637, 0.5966557, -1.374523, 0.4235294, 1, 0, 1,
-0.5690257, -0.3292768, -2.788762, 0.4156863, 1, 0, 1,
-0.5678723, -1.071216, -1.647633, 0.4117647, 1, 0, 1,
-0.5670686, -1.479994, -3.798496, 0.4039216, 1, 0, 1,
-0.5670144, 0.7651283, -0.7653735, 0.3960784, 1, 0, 1,
-0.5666342, 0.5621745, 0.2620257, 0.3921569, 1, 0, 1,
-0.5638182, -0.5457983, -3.348363, 0.3843137, 1, 0, 1,
-0.5626186, -0.2127235, -1.399759, 0.3803922, 1, 0, 1,
-0.5614693, -1.489091, -3.260798, 0.372549, 1, 0, 1,
-0.5602443, -1.12905, -3.123997, 0.3686275, 1, 0, 1,
-0.5588122, 0.09554493, -0.7199742, 0.3607843, 1, 0, 1,
-0.5553422, -1.205978, -2.556782, 0.3568628, 1, 0, 1,
-0.5538768, -0.4808304, -2.652589, 0.3490196, 1, 0, 1,
-0.5537146, -0.005271182, -1.559401, 0.345098, 1, 0, 1,
-0.5519167, -0.8740823, -1.707087, 0.3372549, 1, 0, 1,
-0.5474035, -0.4416106, -2.681757, 0.3333333, 1, 0, 1,
-0.5460993, -1.93146, -2.655434, 0.3254902, 1, 0, 1,
-0.5424031, 2.619881, -1.102381, 0.3215686, 1, 0, 1,
-0.5410157, 0.7164311, -1.966671, 0.3137255, 1, 0, 1,
-0.5388862, -0.1195658, -2.811868, 0.3098039, 1, 0, 1,
-0.5361805, 1.4759, -0.9437826, 0.3019608, 1, 0, 1,
-0.5347716, -0.3152268, -1.234447, 0.2941177, 1, 0, 1,
-0.5283471, -0.7227131, -2.03877, 0.2901961, 1, 0, 1,
-0.5240954, 0.1816486, -3.591391, 0.282353, 1, 0, 1,
-0.5228532, 1.281199, 0.3309188, 0.2784314, 1, 0, 1,
-0.5227651, -1.248855, -3.197143, 0.2705882, 1, 0, 1,
-0.5211268, 0.4326466, -0.3521415, 0.2666667, 1, 0, 1,
-0.5150141, 0.9929147, -0.1287495, 0.2588235, 1, 0, 1,
-0.5147611, 0.2358751, -1.056503, 0.254902, 1, 0, 1,
-0.5138056, -0.6064059, -2.74654, 0.2470588, 1, 0, 1,
-0.5110775, 1.162555, -0.858726, 0.2431373, 1, 0, 1,
-0.5101609, 0.6704212, -0.5627443, 0.2352941, 1, 0, 1,
-0.5099654, -0.5813736, -2.32181, 0.2313726, 1, 0, 1,
-0.5087489, 0.2480431, 0.3792622, 0.2235294, 1, 0, 1,
-0.5066955, -2.958554, -4.606844, 0.2196078, 1, 0, 1,
-0.501973, -1.573858, -4.278858, 0.2117647, 1, 0, 1,
-0.4993425, 0.2784469, -0.6563498, 0.2078431, 1, 0, 1,
-0.4976944, -0.59541, -3.852658, 0.2, 1, 0, 1,
-0.4924399, 1.665529, -1.227518, 0.1921569, 1, 0, 1,
-0.4877593, 0.475689, -1.324485, 0.1882353, 1, 0, 1,
-0.4852911, -0.211099, -0.4113553, 0.1803922, 1, 0, 1,
-0.4768317, 1.886315, 0.1838608, 0.1764706, 1, 0, 1,
-0.4762286, 2.739928, -0.9278604, 0.1686275, 1, 0, 1,
-0.4742926, 0.7860032, -0.5720238, 0.1647059, 1, 0, 1,
-0.4732727, 0.7008159, 0.1104419, 0.1568628, 1, 0, 1,
-0.4662336, -0.6543144, -2.195197, 0.1529412, 1, 0, 1,
-0.4621136, 2.204464, -0.2594763, 0.145098, 1, 0, 1,
-0.4608878, -0.03471494, 0.4778394, 0.1411765, 1, 0, 1,
-0.4600815, 0.7812094, -0.6156297, 0.1333333, 1, 0, 1,
-0.459129, 0.04679968, -0.4014632, 0.1294118, 1, 0, 1,
-0.4552416, -1.683059, -4.231434, 0.1215686, 1, 0, 1,
-0.4530236, 0.3313204, -2.094189, 0.1176471, 1, 0, 1,
-0.451744, 0.4481876, -1.982919, 0.1098039, 1, 0, 1,
-0.4506714, -0.5417781, -1.804025, 0.1058824, 1, 0, 1,
-0.4481528, 0.2771844, -1.720189, 0.09803922, 1, 0, 1,
-0.4476175, 0.3991615, -1.022729, 0.09019608, 1, 0, 1,
-0.4463406, -2.998653, -2.772364, 0.08627451, 1, 0, 1,
-0.4428859, -1.112839, -3.60057, 0.07843138, 1, 0, 1,
-0.441238, 1.697383, -0.9786886, 0.07450981, 1, 0, 1,
-0.4396762, -1.620723, -3.270029, 0.06666667, 1, 0, 1,
-0.4347119, -0.7969295, -2.969002, 0.0627451, 1, 0, 1,
-0.4334565, -1.058111, -4.038243, 0.05490196, 1, 0, 1,
-0.423744, 0.7356833, -1.068799, 0.05098039, 1, 0, 1,
-0.4225479, -1.051058, -2.412713, 0.04313726, 1, 0, 1,
-0.4209864, -0.7423748, -2.671577, 0.03921569, 1, 0, 1,
-0.4198588, -0.654578, -0.9490971, 0.03137255, 1, 0, 1,
-0.4194585, -0.0580007, -2.15623, 0.02745098, 1, 0, 1,
-0.4181055, -2.031646, -2.673515, 0.01960784, 1, 0, 1,
-0.416298, 0.6613533, -1.520284, 0.01568628, 1, 0, 1,
-0.4157096, -0.04399323, -2.046181, 0.007843138, 1, 0, 1,
-0.413083, -0.04747808, -1.437645, 0.003921569, 1, 0, 1,
-0.4111454, 1.166714, -0.189965, 0, 1, 0.003921569, 1,
-0.4102894, -0.9179764, -2.30836, 0, 1, 0.01176471, 1,
-0.4097989, 1.000036, 0.05050197, 0, 1, 0.01568628, 1,
-0.409527, 0.5395677, -2.347214, 0, 1, 0.02352941, 1,
-0.4044641, 0.7266045, 0.5603898, 0, 1, 0.02745098, 1,
-0.4031168, -0.4048819, -4.108558, 0, 1, 0.03529412, 1,
-0.3948034, 1.258666, -0.8010915, 0, 1, 0.03921569, 1,
-0.3940673, 0.4171105, -0.6862296, 0, 1, 0.04705882, 1,
-0.3908437, 1.35772, -0.344775, 0, 1, 0.05098039, 1,
-0.3892477, -0.5488662, -2.760501, 0, 1, 0.05882353, 1,
-0.3862092, -1.148443, -3.40221, 0, 1, 0.0627451, 1,
-0.3857007, -0.2058387, -2.879974, 0, 1, 0.07058824, 1,
-0.3831918, -1.537648, -4.414878, 0, 1, 0.07450981, 1,
-0.3805814, -0.7527966, -4.383566, 0, 1, 0.08235294, 1,
-0.3750873, 0.04124631, -3.553946, 0, 1, 0.08627451, 1,
-0.3742449, -0.5867154, -2.67092, 0, 1, 0.09411765, 1,
-0.3688727, -0.06413753, -1.342745, 0, 1, 0.1019608, 1,
-0.3654225, -0.2741455, -2.129566, 0, 1, 0.1058824, 1,
-0.3615887, 2.268183, -1.659164, 0, 1, 0.1137255, 1,
-0.3602199, 0.4271612, -1.185781, 0, 1, 0.1176471, 1,
-0.3590396, 0.5307017, -1.218889, 0, 1, 0.1254902, 1,
-0.3513166, 1.136045, -0.7605327, 0, 1, 0.1294118, 1,
-0.3447246, 0.1849837, -0.3892531, 0, 1, 0.1372549, 1,
-0.3442457, 0.04472346, -1.778979, 0, 1, 0.1411765, 1,
-0.3407454, -0.3049805, -2.804047, 0, 1, 0.1490196, 1,
-0.3335962, -0.1443839, -0.5305871, 0, 1, 0.1529412, 1,
-0.3312399, 1.301, -0.5977826, 0, 1, 0.1607843, 1,
-0.3303966, 0.303348, -1.495265, 0, 1, 0.1647059, 1,
-0.3302261, 1.396404, -0.2902929, 0, 1, 0.172549, 1,
-0.32144, -1.648069, -3.096358, 0, 1, 0.1764706, 1,
-0.321196, -0.01322711, -0.4999454, 0, 1, 0.1843137, 1,
-0.3195292, 0.2979486, -1.081319, 0, 1, 0.1882353, 1,
-0.3179884, -0.451918, -2.384647, 0, 1, 0.1960784, 1,
-0.3151924, -1.360857, -2.484704, 0, 1, 0.2039216, 1,
-0.3149365, 0.03088121, -2.733401, 0, 1, 0.2078431, 1,
-0.3139174, -0.2810805, -3.096723, 0, 1, 0.2156863, 1,
-0.3106718, 0.6473524, 1.557174, 0, 1, 0.2196078, 1,
-0.3053685, 1.579543, 0.4246611, 0, 1, 0.227451, 1,
-0.3034277, -1.003638, -3.098591, 0, 1, 0.2313726, 1,
-0.3025409, -0.5193644, -2.997748, 0, 1, 0.2392157, 1,
-0.2974161, -1.529951, -4.564629, 0, 1, 0.2431373, 1,
-0.2958333, 0.6130946, -2.226399, 0, 1, 0.2509804, 1,
-0.2955716, 0.8937806, -0.9126757, 0, 1, 0.254902, 1,
-0.2915832, 0.8965772, -0.1546617, 0, 1, 0.2627451, 1,
-0.2902074, -0.4640492, -3.962131, 0, 1, 0.2666667, 1,
-0.2888384, 0.8176244, 0.2150718, 0, 1, 0.2745098, 1,
-0.2886101, -0.4070284, -1.372463, 0, 1, 0.2784314, 1,
-0.2877483, 0.3660956, 0.1711441, 0, 1, 0.2862745, 1,
-0.2854667, 0.01712143, -1.178639, 0, 1, 0.2901961, 1,
-0.2846296, -0.5851118, -3.015677, 0, 1, 0.2980392, 1,
-0.2821477, -1.047606, -1.086402, 0, 1, 0.3058824, 1,
-0.2789362, -1.053422, -3.414926, 0, 1, 0.3098039, 1,
-0.2730173, -0.0995167, -2.009774, 0, 1, 0.3176471, 1,
-0.2726271, -0.4214314, -2.652606, 0, 1, 0.3215686, 1,
-0.2666596, -0.8268716, -2.954745, 0, 1, 0.3294118, 1,
-0.2627634, -0.3874635, -3.121852, 0, 1, 0.3333333, 1,
-0.2627595, -0.1940238, -3.343937, 0, 1, 0.3411765, 1,
-0.2576312, -0.3888013, -3.331683, 0, 1, 0.345098, 1,
-0.2552893, -1.635501, -3.233988, 0, 1, 0.3529412, 1,
-0.2530951, -0.8560326, -3.886885, 0, 1, 0.3568628, 1,
-0.2505413, -0.3609101, -3.002556, 0, 1, 0.3647059, 1,
-0.2476014, -0.5333306, -2.64291, 0, 1, 0.3686275, 1,
-0.2460054, -2.237776, -3.62594, 0, 1, 0.3764706, 1,
-0.2447928, -0.9275206, -3.056834, 0, 1, 0.3803922, 1,
-0.2432991, -0.3186532, -2.912221, 0, 1, 0.3882353, 1,
-0.2432395, 1.100609, 0.03793771, 0, 1, 0.3921569, 1,
-0.242524, 1.064081, -0.5148144, 0, 1, 0.4, 1,
-0.2371067, -1.552482, -3.576162, 0, 1, 0.4078431, 1,
-0.2306045, -0.16901, -1.983598, 0, 1, 0.4117647, 1,
-0.22647, -0.2800408, -1.9001, 0, 1, 0.4196078, 1,
-0.2252666, 0.1168335, -0.7174106, 0, 1, 0.4235294, 1,
-0.2250765, -0.2344784, -1.170805, 0, 1, 0.4313726, 1,
-0.2241812, -0.1030117, -0.5614649, 0, 1, 0.4352941, 1,
-0.2228951, -0.4642966, -2.151397, 0, 1, 0.4431373, 1,
-0.2227278, 0.9100675, 0.05519802, 0, 1, 0.4470588, 1,
-0.2161914, -0.2763953, -2.364262, 0, 1, 0.454902, 1,
-0.2153101, -0.7649964, -4.020736, 0, 1, 0.4588235, 1,
-0.2134352, 0.2943988, -1.262693, 0, 1, 0.4666667, 1,
-0.2078174, -0.5842245, -3.371787, 0, 1, 0.4705882, 1,
-0.2043205, 0.4919476, -1.124037, 0, 1, 0.4784314, 1,
-0.2017883, -1.563458, -3.267241, 0, 1, 0.4823529, 1,
-0.1976183, 0.006674622, -1.274004, 0, 1, 0.4901961, 1,
-0.1958482, 0.7233127, -1.080769, 0, 1, 0.4941176, 1,
-0.1870775, 0.3417733, -1.859415, 0, 1, 0.5019608, 1,
-0.1868065, 1.452221, -2.090394, 0, 1, 0.509804, 1,
-0.1847625, 0.6428397, 0.03413922, 0, 1, 0.5137255, 1,
-0.1821097, 0.2347346, -0.4873595, 0, 1, 0.5215687, 1,
-0.180646, -0.04927536, -2.106964, 0, 1, 0.5254902, 1,
-0.1798119, -0.7023174, -4.462013, 0, 1, 0.5333334, 1,
-0.1794204, 0.08851829, -1.27419, 0, 1, 0.5372549, 1,
-0.1790707, -0.01082599, -2.313291, 0, 1, 0.5450981, 1,
-0.1782951, -0.01983888, -3.454587, 0, 1, 0.5490196, 1,
-0.1778609, 0.8527936, 0.04681209, 0, 1, 0.5568628, 1,
-0.1748994, 1.20256, -0.7218933, 0, 1, 0.5607843, 1,
-0.1742691, 1.628765, 0.4794399, 0, 1, 0.5686275, 1,
-0.1737475, 0.02203323, -0.5213748, 0, 1, 0.572549, 1,
-0.1732948, -1.729057, -2.68428, 0, 1, 0.5803922, 1,
-0.1730393, 0.2383274, -0.1949243, 0, 1, 0.5843138, 1,
-0.1727138, -0.3670202, -2.072921, 0, 1, 0.5921569, 1,
-0.1697748, -1.475843, -2.582414, 0, 1, 0.5960785, 1,
-0.1646091, 1.282368, 1.095449, 0, 1, 0.6039216, 1,
-0.1621287, -0.3636663, -3.040325, 0, 1, 0.6117647, 1,
-0.1596164, 0.4499722, 0.8574312, 0, 1, 0.6156863, 1,
-0.1582229, -1.628586, -4.001523, 0, 1, 0.6235294, 1,
-0.1575379, -0.7241324, -2.736384, 0, 1, 0.627451, 1,
-0.1541278, -0.1904064, -2.54385, 0, 1, 0.6352941, 1,
-0.149859, -0.09774724, -1.767131, 0, 1, 0.6392157, 1,
-0.1472284, -1.783871, -3.479342, 0, 1, 0.6470588, 1,
-0.1414463, 0.9094686, -1.576806, 0, 1, 0.6509804, 1,
-0.1382863, 0.2505832, -0.736945, 0, 1, 0.6588235, 1,
-0.1357457, 1.25855, -0.7265578, 0, 1, 0.6627451, 1,
-0.1339103, -0.9243431, -2.884396, 0, 1, 0.6705883, 1,
-0.1338923, 1.078845, -0.3832007, 0, 1, 0.6745098, 1,
-0.1331476, -1.104152, -2.25304, 0, 1, 0.682353, 1,
-0.1317231, -0.3073293, -4.100476, 0, 1, 0.6862745, 1,
-0.1307994, -0.3003568, -2.600134, 0, 1, 0.6941177, 1,
-0.1275686, 0.5516243, -0.284154, 0, 1, 0.7019608, 1,
-0.1215818, -0.3231242, -4.045453, 0, 1, 0.7058824, 1,
-0.1208857, 0.08302671, 2.054029, 0, 1, 0.7137255, 1,
-0.1198334, -0.3032676, -2.12285, 0, 1, 0.7176471, 1,
-0.1147014, 0.3427121, -0.291518, 0, 1, 0.7254902, 1,
-0.1125645, 0.3562304, -0.8165483, 0, 1, 0.7294118, 1,
-0.1064477, 0.07964022, -0.7940037, 0, 1, 0.7372549, 1,
-0.1043825, -1.050934, -1.900578, 0, 1, 0.7411765, 1,
-0.09445587, -0.3112471, -3.293685, 0, 1, 0.7490196, 1,
-0.09380175, -0.5553975, -1.362132, 0, 1, 0.7529412, 1,
-0.09168538, -0.02638034, -3.134769, 0, 1, 0.7607843, 1,
-0.08983374, 1.391051, -0.6248225, 0, 1, 0.7647059, 1,
-0.0891992, 0.5439627, 0.9395463, 0, 1, 0.772549, 1,
-0.08765318, -1.248408, -3.655688, 0, 1, 0.7764706, 1,
-0.08634876, -0.2895126, -2.995492, 0, 1, 0.7843137, 1,
-0.08007959, -1.150778, -3.150994, 0, 1, 0.7882353, 1,
-0.07932816, 0.2688998, 0.2916761, 0, 1, 0.7960784, 1,
-0.07869472, 1.666333, -1.02831, 0, 1, 0.8039216, 1,
-0.076069, 0.05510163, -0.5554739, 0, 1, 0.8078431, 1,
-0.07406334, 0.312416, 0.4617907, 0, 1, 0.8156863, 1,
-0.07362424, 1.072801, 0.8962794, 0, 1, 0.8196079, 1,
-0.07213757, -1.775248, -3.501392, 0, 1, 0.827451, 1,
-0.0682044, -1.258355, -3.805994, 0, 1, 0.8313726, 1,
-0.06804735, -0.9134554, -3.200386, 0, 1, 0.8392157, 1,
-0.06718158, 0.9088826, -0.3830309, 0, 1, 0.8431373, 1,
-0.06601273, 1.500566, -0.6610187, 0, 1, 0.8509804, 1,
-0.05904826, 0.7241377, -0.6002387, 0, 1, 0.854902, 1,
-0.05585348, 3.316696, -0.5960233, 0, 1, 0.8627451, 1,
-0.05250603, -0.8696241, -4.458961, 0, 1, 0.8666667, 1,
-0.05216327, -0.5279084, -5.359598, 0, 1, 0.8745098, 1,
-0.04782687, -0.3617923, -2.868835, 0, 1, 0.8784314, 1,
-0.04084956, 0.175104, -1.872129, 0, 1, 0.8862745, 1,
-0.03498628, 0.7272087, -0.5430838, 0, 1, 0.8901961, 1,
-0.03137062, -1.291885, -2.373944, 0, 1, 0.8980392, 1,
-0.02731882, -0.3013949, -2.445746, 0, 1, 0.9058824, 1,
-0.0265903, 2.014764, -1.30577, 0, 1, 0.9098039, 1,
-0.02641795, 0.4710179, -0.4320556, 0, 1, 0.9176471, 1,
-0.02285497, 0.9577349, 1.947076, 0, 1, 0.9215686, 1,
-0.02263542, -0.6240326, -4.327576, 0, 1, 0.9294118, 1,
-0.02176627, 0.7329677, -0.4922225, 0, 1, 0.9333333, 1,
-0.02025902, 0.710077, 0.5456526, 0, 1, 0.9411765, 1,
-0.0181447, 0.5187747, 0.2453443, 0, 1, 0.945098, 1,
-0.01709893, -0.08500717, -3.385591, 0, 1, 0.9529412, 1,
-0.01597219, 1.201641, -0.2552464, 0, 1, 0.9568627, 1,
-0.01178571, 0.4292584, 0.2929289, 0, 1, 0.9647059, 1,
-0.01120325, 0.74633, 0.1223141, 0, 1, 0.9686275, 1,
-0.01013652, -0.04674296, -2.819312, 0, 1, 0.9764706, 1,
-0.007937203, -0.2508838, -2.332715, 0, 1, 0.9803922, 1,
-0.00676149, -0.8100998, -3.456818, 0, 1, 0.9882353, 1,
-0.004387688, -0.7642742, -3.0587, 0, 1, 0.9921569, 1,
-0.003650461, -1.749637, -3.001474, 0, 1, 1, 1,
-0.001661596, -0.6648344, -2.043579, 0, 0.9921569, 1, 1,
-0.0009298895, -1.577738, -4.045265, 0, 0.9882353, 1, 1,
0.001072634, 0.3810971, -0.1179454, 0, 0.9803922, 1, 1,
0.002587029, 0.3202966, 0.4906419, 0, 0.9764706, 1, 1,
0.005020165, 1.944935, -0.7866095, 0, 0.9686275, 1, 1,
0.005108898, 0.2606003, -1.204864, 0, 0.9647059, 1, 1,
0.005364161, 1.03155, -0.6889905, 0, 0.9568627, 1, 1,
0.01361126, 1.313338, 0.01627147, 0, 0.9529412, 1, 1,
0.01515437, 0.1586755, 0.9852953, 0, 0.945098, 1, 1,
0.01721857, -0.54404, 3.971321, 0, 0.9411765, 1, 1,
0.01845327, -0.5973638, 4.14819, 0, 0.9333333, 1, 1,
0.02131979, -0.6759472, 2.696421, 0, 0.9294118, 1, 1,
0.0226075, -0.8273711, 3.316473, 0, 0.9215686, 1, 1,
0.02313163, 0.06441262, -2.357289, 0, 0.9176471, 1, 1,
0.02438354, 1.772159, 0.5277634, 0, 0.9098039, 1, 1,
0.02496837, 1.643378, 1.941282, 0, 0.9058824, 1, 1,
0.04554832, -1.506548, 4.151115, 0, 0.8980392, 1, 1,
0.04779185, -0.04934048, 3.927659, 0, 0.8901961, 1, 1,
0.04818707, -2.305514, 2.785026, 0, 0.8862745, 1, 1,
0.04951407, -1.354886, 3.658315, 0, 0.8784314, 1, 1,
0.04966489, 1.387427, 0.9660566, 0, 0.8745098, 1, 1,
0.05462632, -1.600493, 2.978162, 0, 0.8666667, 1, 1,
0.06098038, 1.372494, -0.3250516, 0, 0.8627451, 1, 1,
0.06132951, 0.7198944, 1.87522, 0, 0.854902, 1, 1,
0.0650361, 0.7831808, 1.358437, 0, 0.8509804, 1, 1,
0.0666519, -0.649649, 0.8751285, 0, 0.8431373, 1, 1,
0.06711054, -1.140882, 3.67625, 0, 0.8392157, 1, 1,
0.06776311, 0.1617596, -0.3294277, 0, 0.8313726, 1, 1,
0.07035875, -2.30501, 3.539889, 0, 0.827451, 1, 1,
0.07123246, 1.789919, 0.3525511, 0, 0.8196079, 1, 1,
0.07347928, 0.2267176, 1.324812, 0, 0.8156863, 1, 1,
0.07621798, -1.143412, 2.98339, 0, 0.8078431, 1, 1,
0.07931586, 0.6816452, -1.028665, 0, 0.8039216, 1, 1,
0.08036242, 0.5441087, -0.8068192, 0, 0.7960784, 1, 1,
0.08115333, 0.497762, -0.06004696, 0, 0.7882353, 1, 1,
0.08206505, 0.565908, 0.09591209, 0, 0.7843137, 1, 1,
0.08374763, -1.375058, 1.993083, 0, 0.7764706, 1, 1,
0.08760353, 0.8858325, 0.7947819, 0, 0.772549, 1, 1,
0.09709452, -0.9477971, 1.145848, 0, 0.7647059, 1, 1,
0.09846194, -0.2902632, 3.289453, 0, 0.7607843, 1, 1,
0.09859499, -0.5340573, 4.007537, 0, 0.7529412, 1, 1,
0.09873797, 1.572391, 1.280143, 0, 0.7490196, 1, 1,
0.1028295, -0.6644686, 2.430646, 0, 0.7411765, 1, 1,
0.1042803, -1.454104, 4.714116, 0, 0.7372549, 1, 1,
0.1047791, 2.648574, -0.1835564, 0, 0.7294118, 1, 1,
0.1063157, -0.6228095, 2.688813, 0, 0.7254902, 1, 1,
0.1177602, 0.5381491, -0.8715378, 0, 0.7176471, 1, 1,
0.1239873, -0.6992224, 3.703928, 0, 0.7137255, 1, 1,
0.1250622, 0.9294017, 0.6464224, 0, 0.7058824, 1, 1,
0.1291026, -2.015338, 2.308847, 0, 0.6980392, 1, 1,
0.1293411, -0.02701115, 2.182981, 0, 0.6941177, 1, 1,
0.1297624, -1.776352, 3.592264, 0, 0.6862745, 1, 1,
0.1303743, -0.5567224, 3.638931, 0, 0.682353, 1, 1,
0.1322033, -1.056041, 1.0882, 0, 0.6745098, 1, 1,
0.1333363, 1.05301, 0.8390611, 0, 0.6705883, 1, 1,
0.1335899, 0.7412883, 0.7612737, 0, 0.6627451, 1, 1,
0.1378254, -0.8159588, 3.06979, 0, 0.6588235, 1, 1,
0.1388397, 1.675098, 1.619415, 0, 0.6509804, 1, 1,
0.140349, 0.87507, -0.004495274, 0, 0.6470588, 1, 1,
0.1405326, -0.6534324, 2.278697, 0, 0.6392157, 1, 1,
0.1503647, 0.05514763, 0.2810374, 0, 0.6352941, 1, 1,
0.1532178, 1.207417, 0.5214034, 0, 0.627451, 1, 1,
0.153793, -0.4743902, 0.8624855, 0, 0.6235294, 1, 1,
0.1554861, 1.151902, -0.6808242, 0, 0.6156863, 1, 1,
0.1589805, -0.4224022, 4.175787, 0, 0.6117647, 1, 1,
0.1604182, -0.292648, 1.979325, 0, 0.6039216, 1, 1,
0.1622801, 0.7551206, -1.006437, 0, 0.5960785, 1, 1,
0.1625303, 0.2170682, 0.8886334, 0, 0.5921569, 1, 1,
0.1628581, 1.146034, 2.021859, 0, 0.5843138, 1, 1,
0.168584, 0.4160264, 1.297006, 0, 0.5803922, 1, 1,
0.1720315, 0.8473333, 0.05228872, 0, 0.572549, 1, 1,
0.1771827, -1.162797, 4.753067, 0, 0.5686275, 1, 1,
0.1793577, -0.5005128, 0.9045338, 0, 0.5607843, 1, 1,
0.1798747, 0.5360926, 0.923178, 0, 0.5568628, 1, 1,
0.182859, 0.1023557, 2.07224, 0, 0.5490196, 1, 1,
0.1923933, 0.4150528, 0.6597027, 0, 0.5450981, 1, 1,
0.1954259, 1.24844, -0.4412965, 0, 0.5372549, 1, 1,
0.1982767, -1.023783, 3.555014, 0, 0.5333334, 1, 1,
0.1991699, -0.506366, 3.425443, 0, 0.5254902, 1, 1,
0.1995737, -0.7771288, 3.413149, 0, 0.5215687, 1, 1,
0.2029147, 0.9744108, 2.690892, 0, 0.5137255, 1, 1,
0.2049305, 0.9901898, -0.5779415, 0, 0.509804, 1, 1,
0.2065795, 1.465308, -0.9693018, 0, 0.5019608, 1, 1,
0.2135768, 0.8413939, -1.872826, 0, 0.4941176, 1, 1,
0.2137491, 1.074931, -1.328017, 0, 0.4901961, 1, 1,
0.2148262, 0.8640226, -0.516736, 0, 0.4823529, 1, 1,
0.2148704, -1.244956, 4.493898, 0, 0.4784314, 1, 1,
0.2149809, -1.592397, 3.057461, 0, 0.4705882, 1, 1,
0.2164953, 0.3173603, -1.425453, 0, 0.4666667, 1, 1,
0.2201252, 0.8095183, -0.04082749, 0, 0.4588235, 1, 1,
0.225499, 1.101794, 0.4947491, 0, 0.454902, 1, 1,
0.2348307, 0.442611, 0.1308191, 0, 0.4470588, 1, 1,
0.2396163, 1.008433, 0.125096, 0, 0.4431373, 1, 1,
0.2405072, 0.9665195, -0.1838576, 0, 0.4352941, 1, 1,
0.2442738, -0.7985891, 5.098467, 0, 0.4313726, 1, 1,
0.2448611, 0.9779431, -0.4966878, 0, 0.4235294, 1, 1,
0.2487955, -0.06900547, 0.5666612, 0, 0.4196078, 1, 1,
0.2519494, 0.09075315, 1.350638, 0, 0.4117647, 1, 1,
0.2520363, -0.8241196, 2.823386, 0, 0.4078431, 1, 1,
0.2593336, -1.748007, 4.214483, 0, 0.4, 1, 1,
0.263046, 0.6247767, 1.281068, 0, 0.3921569, 1, 1,
0.2657283, -0.7984292, 2.27465, 0, 0.3882353, 1, 1,
0.268712, -2.001527, 2.66946, 0, 0.3803922, 1, 1,
0.2706841, 0.9061646, 0.8995415, 0, 0.3764706, 1, 1,
0.2710808, 0.8212643, 1.86016, 0, 0.3686275, 1, 1,
0.2773144, 0.06548775, 0.9171606, 0, 0.3647059, 1, 1,
0.279531, -0.1627566, 1.365024, 0, 0.3568628, 1, 1,
0.2807623, 2.007779, 1.14282, 0, 0.3529412, 1, 1,
0.28717, -0.7867703, 1.70862, 0, 0.345098, 1, 1,
0.2887961, -0.4595507, 1.77336, 0, 0.3411765, 1, 1,
0.2902092, 0.3020729, 1.765953, 0, 0.3333333, 1, 1,
0.2936169, 0.6556439, 0.8630663, 0, 0.3294118, 1, 1,
0.2946123, -0.1851937, 1.039616, 0, 0.3215686, 1, 1,
0.297657, 1.15129, -0.9843999, 0, 0.3176471, 1, 1,
0.304142, -1.492554, 3.075878, 0, 0.3098039, 1, 1,
0.3088878, 2.330274, -0.1295627, 0, 0.3058824, 1, 1,
0.3101006, 0.1641194, 0.1415889, 0, 0.2980392, 1, 1,
0.3151966, 0.9257923, 0.6166534, 0, 0.2901961, 1, 1,
0.3189094, -0.1055796, 2.023907, 0, 0.2862745, 1, 1,
0.3201843, -0.3054686, 1.698138, 0, 0.2784314, 1, 1,
0.320856, 1.355392, 0.08602282, 0, 0.2745098, 1, 1,
0.3218057, 0.5844013, 3.417603, 0, 0.2666667, 1, 1,
0.3237606, 0.9477575, -0.01302942, 0, 0.2627451, 1, 1,
0.3249545, -0.8755359, 3.189691, 0, 0.254902, 1, 1,
0.3280033, 0.5283762, 1.06089, 0, 0.2509804, 1, 1,
0.3280654, -0.8143517, 3.000796, 0, 0.2431373, 1, 1,
0.3301308, -0.4613464, 2.640568, 0, 0.2392157, 1, 1,
0.3335577, -0.1051662, 1.567835, 0, 0.2313726, 1, 1,
0.3340698, 0.6199576, 0.280559, 0, 0.227451, 1, 1,
0.334868, 0.02432482, 1.411246, 0, 0.2196078, 1, 1,
0.3357019, -0.4192913, 4.178186, 0, 0.2156863, 1, 1,
0.3381416, -0.8163475, 3.000933, 0, 0.2078431, 1, 1,
0.3422211, 0.3981069, -0.6363351, 0, 0.2039216, 1, 1,
0.3445804, 0.3698784, 0.2178343, 0, 0.1960784, 1, 1,
0.3481771, 1.702884, 1.663088, 0, 0.1882353, 1, 1,
0.3490585, -0.3594125, 2.061, 0, 0.1843137, 1, 1,
0.3531078, -1.552272, 1.759118, 0, 0.1764706, 1, 1,
0.3537908, -0.4187526, 2.232707, 0, 0.172549, 1, 1,
0.3545271, -0.6890963, 2.225845, 0, 0.1647059, 1, 1,
0.3560689, -1.700242, 4.392744, 0, 0.1607843, 1, 1,
0.3567477, -0.9104757, 2.467116, 0, 0.1529412, 1, 1,
0.358112, 0.2781585, 2.582155, 0, 0.1490196, 1, 1,
0.3606765, -1.142913, 1.76881, 0, 0.1411765, 1, 1,
0.3635133, -1.003099, 1.895362, 0, 0.1372549, 1, 1,
0.3700965, -0.06303632, 0.1913531, 0, 0.1294118, 1, 1,
0.3717946, -0.9439953, 4.295244, 0, 0.1254902, 1, 1,
0.3791654, -1.867582, 3.56411, 0, 0.1176471, 1, 1,
0.3820598, -0.2350657, 1.396582, 0, 0.1137255, 1, 1,
0.3831219, 1.154228, 1.082298, 0, 0.1058824, 1, 1,
0.383754, 0.3245454, 2.216228, 0, 0.09803922, 1, 1,
0.3839357, 0.8137079, 1.079053, 0, 0.09411765, 1, 1,
0.3851445, 2.90133, -0.04130261, 0, 0.08627451, 1, 1,
0.3856514, -0.4464671, 1.616187, 0, 0.08235294, 1, 1,
0.3869083, 0.3332673, 1.638778, 0, 0.07450981, 1, 1,
0.3910508, -0.8424597, 2.072241, 0, 0.07058824, 1, 1,
0.391103, -1.243261, 3.893404, 0, 0.0627451, 1, 1,
0.3932767, -0.1370586, 2.792596, 0, 0.05882353, 1, 1,
0.3960238, 0.3354985, 1.094296, 0, 0.05098039, 1, 1,
0.4005934, -0.443765, 5.511976, 0, 0.04705882, 1, 1,
0.4010046, -1.642683, 3.391363, 0, 0.03921569, 1, 1,
0.4021092, 0.9928063, 2.996695, 0, 0.03529412, 1, 1,
0.404646, -0.6281, 1.536149, 0, 0.02745098, 1, 1,
0.4061224, -0.5723935, 2.417103, 0, 0.02352941, 1, 1,
0.4082077, 1.038945, 1.12229, 0, 0.01568628, 1, 1,
0.4097185, 2.193199, 0.1130845, 0, 0.01176471, 1, 1,
0.4141378, -1.427323, 1.343253, 0, 0.003921569, 1, 1,
0.4166161, 0.5518958, 1.730528, 0.003921569, 0, 1, 1,
0.4195923, 0.06153601, 1.843868, 0.007843138, 0, 1, 1,
0.4222316, 2.026604, -1.127364, 0.01568628, 0, 1, 1,
0.4246403, 0.3940854, 0.3079456, 0.01960784, 0, 1, 1,
0.4337999, 0.1039307, 4.656056, 0.02745098, 0, 1, 1,
0.4344222, -1.50457, 4.418697, 0.03137255, 0, 1, 1,
0.4356474, 0.4239757, 0.2226776, 0.03921569, 0, 1, 1,
0.4388976, 0.5268116, -0.4889418, 0.04313726, 0, 1, 1,
0.4520471, 1.257443, 0.1805908, 0.05098039, 0, 1, 1,
0.4553766, -1.298612, 0.434113, 0.05490196, 0, 1, 1,
0.4569572, 0.7443749, 1.047108, 0.0627451, 0, 1, 1,
0.4573566, 0.8045624, 1.552314, 0.06666667, 0, 1, 1,
0.4609615, -0.06614472, 1.32151, 0.07450981, 0, 1, 1,
0.4617757, -0.7216243, 2.419412, 0.07843138, 0, 1, 1,
0.4622094, -0.2890101, 3.416584, 0.08627451, 0, 1, 1,
0.4705362, -1.793735, 2.571977, 0.09019608, 0, 1, 1,
0.4853347, 1.247063, -0.5529507, 0.09803922, 0, 1, 1,
0.4876927, 0.6906664, 0.1617324, 0.1058824, 0, 1, 1,
0.4899349, -1.211253, 3.788769, 0.1098039, 0, 1, 1,
0.4932885, 0.003935822, 1.469198, 0.1176471, 0, 1, 1,
0.4980949, 0.2632928, 2.381051, 0.1215686, 0, 1, 1,
0.5013099, 0.3396907, -1.33095, 0.1294118, 0, 1, 1,
0.5028099, 0.07460999, 0.5105913, 0.1333333, 0, 1, 1,
0.5088342, 0.06579923, 2.775637, 0.1411765, 0, 1, 1,
0.5104865, 1.307175, -0.07766111, 0.145098, 0, 1, 1,
0.5137031, 0.4167062, 1.923473, 0.1529412, 0, 1, 1,
0.5150813, 0.8483062, -0.1438158, 0.1568628, 0, 1, 1,
0.5167745, -0.2621792, 1.153401, 0.1647059, 0, 1, 1,
0.5198253, 0.01663357, 1.380857, 0.1686275, 0, 1, 1,
0.5252767, 0.4586198, -0.1072677, 0.1764706, 0, 1, 1,
0.5302348, -0.59702, 1.03498, 0.1803922, 0, 1, 1,
0.5305173, -0.06833015, 2.072799, 0.1882353, 0, 1, 1,
0.5313337, 0.3210477, 2.817022, 0.1921569, 0, 1, 1,
0.5407851, -0.800015, 4.402944, 0.2, 0, 1, 1,
0.5416094, 1.8009, 1.075283, 0.2078431, 0, 1, 1,
0.5421147, 0.5194122, -0.6051707, 0.2117647, 0, 1, 1,
0.5442084, 0.0141271, 2.862277, 0.2196078, 0, 1, 1,
0.5503747, -0.2195532, 0.407333, 0.2235294, 0, 1, 1,
0.5509633, 0.9950796, 0.3937832, 0.2313726, 0, 1, 1,
0.5530072, 0.6360223, 0.8099319, 0.2352941, 0, 1, 1,
0.5557384, 0.3633019, -0.5636052, 0.2431373, 0, 1, 1,
0.5600616, 0.4862215, 0.4386052, 0.2470588, 0, 1, 1,
0.5695059, 1.926428, 0.866878, 0.254902, 0, 1, 1,
0.5732198, -1.903376, 1.421166, 0.2588235, 0, 1, 1,
0.5746142, 1.792057, 1.127954, 0.2666667, 0, 1, 1,
0.5835166, 0.1972184, 0.7336857, 0.2705882, 0, 1, 1,
0.588562, 0.1366492, 1.404717, 0.2784314, 0, 1, 1,
0.5888084, -0.08929674, 2.179953, 0.282353, 0, 1, 1,
0.5893991, -0.704046, 0.04884287, 0.2901961, 0, 1, 1,
0.592768, -1.026201, 1.657834, 0.2941177, 0, 1, 1,
0.5974652, -0.4299411, 2.600262, 0.3019608, 0, 1, 1,
0.6020709, 0.1964822, 0.494132, 0.3098039, 0, 1, 1,
0.6027871, -1.044243, 2.662583, 0.3137255, 0, 1, 1,
0.6051852, 0.6234686, 3.457962, 0.3215686, 0, 1, 1,
0.6052668, 0.1646152, 0.464716, 0.3254902, 0, 1, 1,
0.6057746, -1.228054, 1.703201, 0.3333333, 0, 1, 1,
0.6066062, -0.4269314, 4.029275, 0.3372549, 0, 1, 1,
0.6096632, -0.8520741, 1.626307, 0.345098, 0, 1, 1,
0.614006, 0.6427974, 1.023047, 0.3490196, 0, 1, 1,
0.6246462, -0.8162389, 0.5926083, 0.3568628, 0, 1, 1,
0.6265018, 1.824927, 0.403767, 0.3607843, 0, 1, 1,
0.6265984, 0.2680745, 1.317887, 0.3686275, 0, 1, 1,
0.6277404, -0.2223001, 2.394424, 0.372549, 0, 1, 1,
0.6295587, 0.1012432, 1.569206, 0.3803922, 0, 1, 1,
0.6344765, -0.8088627, 1.273311, 0.3843137, 0, 1, 1,
0.6389565, -0.5227924, 4.224075, 0.3921569, 0, 1, 1,
0.6416725, -1.278612, 2.371767, 0.3960784, 0, 1, 1,
0.6443093, 0.753673, 0.9956213, 0.4039216, 0, 1, 1,
0.6490207, 0.6644071, 1.28374, 0.4117647, 0, 1, 1,
0.6528525, -1.299808, 2.757425, 0.4156863, 0, 1, 1,
0.6549418, -1.053234, 3.409757, 0.4235294, 0, 1, 1,
0.6748105, -0.6677555, 2.985554, 0.427451, 0, 1, 1,
0.6767609, 1.029852, 1.565591, 0.4352941, 0, 1, 1,
0.6845276, -0.03253437, 1.522208, 0.4392157, 0, 1, 1,
0.690282, -0.2180036, 0.8788329, 0.4470588, 0, 1, 1,
0.6902862, -0.772323, 2.465849, 0.4509804, 0, 1, 1,
0.6981679, 0.1928416, 1.374745, 0.4588235, 0, 1, 1,
0.6997215, -1.093107, 2.751291, 0.4627451, 0, 1, 1,
0.7018087, 0.4456622, 1.656835, 0.4705882, 0, 1, 1,
0.702918, -0.6516159, 3.606552, 0.4745098, 0, 1, 1,
0.7089951, -0.3385257, 2.300321, 0.4823529, 0, 1, 1,
0.7116528, 1.518835, 0.4696421, 0.4862745, 0, 1, 1,
0.7145492, -1.218186, 1.742224, 0.4941176, 0, 1, 1,
0.7192917, 0.08846526, 1.155336, 0.5019608, 0, 1, 1,
0.7202725, 0.5596194, 0.767739, 0.5058824, 0, 1, 1,
0.7250916, -0.9853496, 4.189503, 0.5137255, 0, 1, 1,
0.7296872, -0.165012, 2.324165, 0.5176471, 0, 1, 1,
0.7298845, 0.9478069, 1.644231, 0.5254902, 0, 1, 1,
0.737073, 0.6195051, 0.6495431, 0.5294118, 0, 1, 1,
0.7373233, -0.01062064, 0.8119064, 0.5372549, 0, 1, 1,
0.7418663, -2.010636, 3.078789, 0.5411765, 0, 1, 1,
0.7432337, 0.6875512, 0.3468763, 0.5490196, 0, 1, 1,
0.7446238, 0.8525774, 2.330756, 0.5529412, 0, 1, 1,
0.751087, -0.4542171, 3.007572, 0.5607843, 0, 1, 1,
0.7526052, -0.3833492, 2.426433, 0.5647059, 0, 1, 1,
0.7536782, -1.874292, 2.783802, 0.572549, 0, 1, 1,
0.7547945, 0.4922613, -0.6293058, 0.5764706, 0, 1, 1,
0.7570817, 0.3717356, -0.0281689, 0.5843138, 0, 1, 1,
0.7621648, -0.34921, 1.394657, 0.5882353, 0, 1, 1,
0.7637225, -0.2599626, 1.671419, 0.5960785, 0, 1, 1,
0.7638512, -0.6709858, 2.293321, 0.6039216, 0, 1, 1,
0.7644567, -0.02200344, 2.462148, 0.6078432, 0, 1, 1,
0.7669918, 0.1284599, 1.147646, 0.6156863, 0, 1, 1,
0.7742824, -0.8535675, 2.12709, 0.6196079, 0, 1, 1,
0.7826301, 0.5841579, -0.1111763, 0.627451, 0, 1, 1,
0.7843887, 0.6868867, 2.323902, 0.6313726, 0, 1, 1,
0.7849511, -0.9125814, 0.8618826, 0.6392157, 0, 1, 1,
0.7868221, 0.419779, 1.669028, 0.6431373, 0, 1, 1,
0.7886273, 0.4255183, 0.4742445, 0.6509804, 0, 1, 1,
0.7902713, -0.547617, 1.244833, 0.654902, 0, 1, 1,
0.7909688, -0.4387065, 1.375212, 0.6627451, 0, 1, 1,
0.7913787, -0.7355489, 1.332862, 0.6666667, 0, 1, 1,
0.7981427, -0.1332609, 3.796755, 0.6745098, 0, 1, 1,
0.7993258, 0.2034135, 1.657533, 0.6784314, 0, 1, 1,
0.8012604, 0.02962361, 3.897564, 0.6862745, 0, 1, 1,
0.8020689, -0.5768457, 1.945496, 0.6901961, 0, 1, 1,
0.8171183, -0.3323391, 0.766261, 0.6980392, 0, 1, 1,
0.8200814, -0.4478868, 2.301423, 0.7058824, 0, 1, 1,
0.8239893, 0.1199069, 2.568115, 0.7098039, 0, 1, 1,
0.8272586, -1.763975, 2.355114, 0.7176471, 0, 1, 1,
0.8289897, -0.9024749, -0.1552028, 0.7215686, 0, 1, 1,
0.8290712, -1.933461, 3.293557, 0.7294118, 0, 1, 1,
0.8326301, -0.8357125, 1.532441, 0.7333333, 0, 1, 1,
0.8378859, -1.105686, 2.757393, 0.7411765, 0, 1, 1,
0.8415837, -0.1253482, 0.628837, 0.7450981, 0, 1, 1,
0.844337, 0.6619987, 0.6086845, 0.7529412, 0, 1, 1,
0.846498, -1.904103, 1.397604, 0.7568628, 0, 1, 1,
0.8506587, 0.06389535, 1.449735, 0.7647059, 0, 1, 1,
0.8509951, 0.02932145, 2.36613, 0.7686275, 0, 1, 1,
0.8530845, 0.841465, 0.5033362, 0.7764706, 0, 1, 1,
0.8543106, -1.086172, 3.571544, 0.7803922, 0, 1, 1,
0.8576866, 1.11399, 0.6654369, 0.7882353, 0, 1, 1,
0.8641711, 0.04638661, 1.474001, 0.7921569, 0, 1, 1,
0.8671488, -0.4955696, 2.445357, 0.8, 0, 1, 1,
0.8710456, 0.7240053, 1.175925, 0.8078431, 0, 1, 1,
0.8711104, 1.04182, 0.1962377, 0.8117647, 0, 1, 1,
0.8731775, -1.111519, 4.83413, 0.8196079, 0, 1, 1,
0.8753975, -0.2384508, 2.00296, 0.8235294, 0, 1, 1,
0.8789338, 0.8433266, 1.035572, 0.8313726, 0, 1, 1,
0.8792771, -0.2030766, 1.594843, 0.8352941, 0, 1, 1,
0.8819615, -1.036843, 3.124943, 0.8431373, 0, 1, 1,
0.8820037, -0.68335, 1.199368, 0.8470588, 0, 1, 1,
0.8896539, 0.6907679, -0.07808534, 0.854902, 0, 1, 1,
0.8941549, 0.09324356, 0.929678, 0.8588235, 0, 1, 1,
0.8948892, -0.53346, 0.7573686, 0.8666667, 0, 1, 1,
0.8997595, -0.5168679, 1.679658, 0.8705882, 0, 1, 1,
0.9094173, 0.911511, -0.5914401, 0.8784314, 0, 1, 1,
0.9095085, -0.4419712, 1.520393, 0.8823529, 0, 1, 1,
0.9100524, 0.7889199, 1.4419, 0.8901961, 0, 1, 1,
0.9119487, -0.1233244, 3.380667, 0.8941177, 0, 1, 1,
0.9146543, 1.056545, 1.595757, 0.9019608, 0, 1, 1,
0.924319, -0.5024435, 1.095328, 0.9098039, 0, 1, 1,
0.9321306, 0.4845643, -0.3664562, 0.9137255, 0, 1, 1,
0.9349415, 0.05104518, 1.696187, 0.9215686, 0, 1, 1,
0.9390694, -0.4221264, 3.364373, 0.9254902, 0, 1, 1,
0.9438398, 1.724209, -1.700429, 0.9333333, 0, 1, 1,
0.9454857, 0.6942225, 1.500983, 0.9372549, 0, 1, 1,
0.953883, 0.3353662, 1.360642, 0.945098, 0, 1, 1,
0.9544238, -0.6327628, 2.44688, 0.9490196, 0, 1, 1,
0.9565414, 1.963436, -1.943483, 0.9568627, 0, 1, 1,
0.9574272, 0.1203082, 2.118084, 0.9607843, 0, 1, 1,
0.9684194, -0.07456312, 0.8053412, 0.9686275, 0, 1, 1,
0.9709855, 1.026689, -0.3763062, 0.972549, 0, 1, 1,
0.9828187, -0.5318829, 1.818979, 0.9803922, 0, 1, 1,
0.9838302, -0.5398644, 1.745677, 0.9843137, 0, 1, 1,
0.9874752, 0.179068, 2.118152, 0.9921569, 0, 1, 1,
0.9882798, 0.3218324, 0.05192406, 0.9960784, 0, 1, 1,
0.9940423, 0.1341182, 1.433324, 1, 0, 0.9960784, 1,
0.9952125, -0.3411099, 1.58289, 1, 0, 0.9882353, 1,
0.9958493, -0.0555713, 1.713842, 1, 0, 0.9843137, 1,
0.996205, 0.01834036, 1.503272, 1, 0, 0.9764706, 1,
0.9965344, -1.348378, 3.692531, 1, 0, 0.972549, 1,
1.00131, -1.115726, 1.517734, 1, 0, 0.9647059, 1,
1.007517, 1.286372, -0.3057713, 1, 0, 0.9607843, 1,
1.011499, -0.1625381, 1.188603, 1, 0, 0.9529412, 1,
1.027523, -0.9211705, 0.8885952, 1, 0, 0.9490196, 1,
1.030974, -1.192079, 3.91664, 1, 0, 0.9411765, 1,
1.039628, -0.3219699, 1.283889, 1, 0, 0.9372549, 1,
1.042014, 0.5614754, -0.275751, 1, 0, 0.9294118, 1,
1.045627, 1.130376, 0.7839918, 1, 0, 0.9254902, 1,
1.055006, -0.8637565, 3.748173, 1, 0, 0.9176471, 1,
1.056434, -1.311879, 3.925585, 1, 0, 0.9137255, 1,
1.061707, 0.7610543, 1.252635, 1, 0, 0.9058824, 1,
1.066741, 1.896749, -0.9403315, 1, 0, 0.9019608, 1,
1.070555, 0.0571854, 1.945575, 1, 0, 0.8941177, 1,
1.070649, 0.6195804, 2.067797, 1, 0, 0.8862745, 1,
1.074162, -0.9613608, 1.75709, 1, 0, 0.8823529, 1,
1.075333, -1.407434, 2.023677, 1, 0, 0.8745098, 1,
1.079276, -0.9148409, 3.814253, 1, 0, 0.8705882, 1,
1.080661, 1.923707, 0.5744737, 1, 0, 0.8627451, 1,
1.083439, 1.2781, 0.5805411, 1, 0, 0.8588235, 1,
1.093294, 0.6356064, 1.512506, 1, 0, 0.8509804, 1,
1.095148, 0.8470067, 1.222281, 1, 0, 0.8470588, 1,
1.096385, 0.9736668, 1.155108, 1, 0, 0.8392157, 1,
1.099305, -0.2000962, 1.112638, 1, 0, 0.8352941, 1,
1.099847, -0.1423945, 1.284153, 1, 0, 0.827451, 1,
1.104997, -0.4095356, 3.601206, 1, 0, 0.8235294, 1,
1.122004, 1.235623, 1.551417, 1, 0, 0.8156863, 1,
1.124133, 0.757547, 0.4740629, 1, 0, 0.8117647, 1,
1.125532, 1.041933, 0.1027124, 1, 0, 0.8039216, 1,
1.13021, 1.388249, -0.6418856, 1, 0, 0.7960784, 1,
1.133467, 0.4592923, 3.323482, 1, 0, 0.7921569, 1,
1.135345, -0.1411354, 1.494514, 1, 0, 0.7843137, 1,
1.136741, -1.150221, 2.896273, 1, 0, 0.7803922, 1,
1.141906, -1.209711, 0.5986738, 1, 0, 0.772549, 1,
1.170464, -1.668838, 0.6960467, 1, 0, 0.7686275, 1,
1.171007, -1.672238, 1.683165, 1, 0, 0.7607843, 1,
1.174937, -0.6511345, 2.864888, 1, 0, 0.7568628, 1,
1.185006, 0.9726337, 0.4082176, 1, 0, 0.7490196, 1,
1.18572, 0.8112453, 1.582646, 1, 0, 0.7450981, 1,
1.186319, -0.3598057, 2.702506, 1, 0, 0.7372549, 1,
1.191375, 0.667748, 1.913228, 1, 0, 0.7333333, 1,
1.19525, 0.1463695, 1.328047, 1, 0, 0.7254902, 1,
1.199906, -0.8860521, 3.596434, 1, 0, 0.7215686, 1,
1.200116, -0.6713411, 1.997039, 1, 0, 0.7137255, 1,
1.201199, -0.05869326, 0.9312644, 1, 0, 0.7098039, 1,
1.205643, 0.6929013, 0.589896, 1, 0, 0.7019608, 1,
1.208166, -0.1119045, 1.815061, 1, 0, 0.6941177, 1,
1.2085, -1.083384, 3.25178, 1, 0, 0.6901961, 1,
1.211541, -1.927732, 0.8965641, 1, 0, 0.682353, 1,
1.213564, -1.089995, 3.749169, 1, 0, 0.6784314, 1,
1.218832, -0.2032932, 1.640736, 1, 0, 0.6705883, 1,
1.223467, -0.08340164, 2.098217, 1, 0, 0.6666667, 1,
1.231538, 0.7684635, -0.1410096, 1, 0, 0.6588235, 1,
1.242679, 0.08129872, 0.0657699, 1, 0, 0.654902, 1,
1.25066, -0.1953167, 1.150174, 1, 0, 0.6470588, 1,
1.258565, 0.5276943, 2.166283, 1, 0, 0.6431373, 1,
1.288663, -0.2024392, 1.143443, 1, 0, 0.6352941, 1,
1.290506, 0.3328344, -0.7682851, 1, 0, 0.6313726, 1,
1.294571, 0.8326564, 0.5347834, 1, 0, 0.6235294, 1,
1.303818, -1.028818, 2.365418, 1, 0, 0.6196079, 1,
1.304641, 0.1002957, 1.846335, 1, 0, 0.6117647, 1,
1.308714, -0.5310842, 3.044906, 1, 0, 0.6078432, 1,
1.315817, 0.4676245, 1.126687, 1, 0, 0.6, 1,
1.333379, 0.4904138, 1.122128, 1, 0, 0.5921569, 1,
1.336449, -0.8796534, 2.236797, 1, 0, 0.5882353, 1,
1.355419, -0.3754772, 0.8020133, 1, 0, 0.5803922, 1,
1.361841, -1.420779, 1.739138, 1, 0, 0.5764706, 1,
1.370175, 0.7271295, -0.7550548, 1, 0, 0.5686275, 1,
1.387593, 0.2945779, 2.035427, 1, 0, 0.5647059, 1,
1.38836, -2.445402, 3.686171, 1, 0, 0.5568628, 1,
1.390673, 0.005894728, 1.278542, 1, 0, 0.5529412, 1,
1.392339, -0.601734, 2.871818, 1, 0, 0.5450981, 1,
1.394073, -0.04946494, 1.689244, 1, 0, 0.5411765, 1,
1.396224, -0.4337092, -0.07272016, 1, 0, 0.5333334, 1,
1.396498, -0.5843424, 1.488325, 1, 0, 0.5294118, 1,
1.411221, 0.7906056, 1.455805, 1, 0, 0.5215687, 1,
1.41219, -0.5181952, 2.592804, 1, 0, 0.5176471, 1,
1.4187, -0.03605371, 2.727375, 1, 0, 0.509804, 1,
1.433001, -0.09643279, 2.035359, 1, 0, 0.5058824, 1,
1.43593, -0.2967343, 0.5164459, 1, 0, 0.4980392, 1,
1.4368, 1.521043, 0.6009641, 1, 0, 0.4901961, 1,
1.441349, -0.2433451, 2.540325, 1, 0, 0.4862745, 1,
1.445413, 0.3769463, 1.96006, 1, 0, 0.4784314, 1,
1.450682, -0.9040623, 2.123047, 1, 0, 0.4745098, 1,
1.460455, 0.3966078, 1.465794, 1, 0, 0.4666667, 1,
1.4778, -0.3201752, 1.720268, 1, 0, 0.4627451, 1,
1.479899, -0.6137856, 2.923793, 1, 0, 0.454902, 1,
1.480471, 0.4458169, 0.4267825, 1, 0, 0.4509804, 1,
1.486681, 0.2733274, 0.2086294, 1, 0, 0.4431373, 1,
1.488259, -1.189602, 2.564314, 1, 0, 0.4392157, 1,
1.489463, -1.185011, 2.549361, 1, 0, 0.4313726, 1,
1.500329, -1.40033, 1.17853, 1, 0, 0.427451, 1,
1.507743, 0.929284, 2.096345, 1, 0, 0.4196078, 1,
1.512437, -2.099287, 1.75631, 1, 0, 0.4156863, 1,
1.512546, 1.147011, 2.891799, 1, 0, 0.4078431, 1,
1.514169, 2.109334, 0.3141763, 1, 0, 0.4039216, 1,
1.535292, 1.462507, 0.2124632, 1, 0, 0.3960784, 1,
1.538301, -0.8789269, 0.09157055, 1, 0, 0.3882353, 1,
1.552023, 0.5765333, 2.449985, 1, 0, 0.3843137, 1,
1.552309, -0.8293509, 0.05163458, 1, 0, 0.3764706, 1,
1.558712, -0.5742964, 2.985364, 1, 0, 0.372549, 1,
1.559603, 0.1714596, 3.353092, 1, 0, 0.3647059, 1,
1.566792, 1.438596, 1.262314, 1, 0, 0.3607843, 1,
1.568264, 0.03051004, 0.5972255, 1, 0, 0.3529412, 1,
1.571764, 1.131226, -0.007365703, 1, 0, 0.3490196, 1,
1.584764, 0.901683, 0.4264096, 1, 0, 0.3411765, 1,
1.590353, -1.213774, 1.469792, 1, 0, 0.3372549, 1,
1.605851, -0.6799232, 2.653444, 1, 0, 0.3294118, 1,
1.631564, -1.048381, 1.721227, 1, 0, 0.3254902, 1,
1.633991, -0.4890683, 1.840746, 1, 0, 0.3176471, 1,
1.650262, 0.8448743, -2.63628, 1, 0, 0.3137255, 1,
1.652255, -0.256441, 1.971279, 1, 0, 0.3058824, 1,
1.666477, -0.2713947, 3.587803, 1, 0, 0.2980392, 1,
1.668981, -0.1255425, 2.058579, 1, 0, 0.2941177, 1,
1.697252, 0.001766214, 1.044855, 1, 0, 0.2862745, 1,
1.731265, -1.194665, 2.184794, 1, 0, 0.282353, 1,
1.744045, 0.2317254, 1.373237, 1, 0, 0.2745098, 1,
1.765379, 0.6329581, 2.092167, 1, 0, 0.2705882, 1,
1.774333, 1.280866, -0.7707995, 1, 0, 0.2627451, 1,
1.825981, 1.043776, 1.75254, 1, 0, 0.2588235, 1,
1.835608, 0.887565, 0.8074931, 1, 0, 0.2509804, 1,
1.876531, -0.6155477, 3.258081, 1, 0, 0.2470588, 1,
1.880968, 0.4456188, 1.148984, 1, 0, 0.2392157, 1,
1.920476, 0.1497159, 2.618726, 1, 0, 0.2352941, 1,
1.935746, -1.617016, 2.663897, 1, 0, 0.227451, 1,
1.944188, -0.2737523, 2.436493, 1, 0, 0.2235294, 1,
1.964341, -0.7680483, 0.9304407, 1, 0, 0.2156863, 1,
1.971868, 0.8052958, 0.4140128, 1, 0, 0.2117647, 1,
1.98297, -0.7537982, 0.7672902, 1, 0, 0.2039216, 1,
1.995802, 0.4417452, 0.6096151, 1, 0, 0.1960784, 1,
2.005043, -0.7634955, 1.493132, 1, 0, 0.1921569, 1,
2.010047, -0.7158961, 1.131348, 1, 0, 0.1843137, 1,
2.012331, 0.7230754, -0.08031214, 1, 0, 0.1803922, 1,
2.017107, 0.00467367, 0.5061161, 1, 0, 0.172549, 1,
2.028876, 0.5699649, 2.811394, 1, 0, 0.1686275, 1,
2.055901, 0.6297309, 0.767633, 1, 0, 0.1607843, 1,
2.057643, -0.7727067, 1.888899, 1, 0, 0.1568628, 1,
2.058463, 0.5720419, 0.6460024, 1, 0, 0.1490196, 1,
2.058691, 1.062367, -0.06315368, 1, 0, 0.145098, 1,
2.080129, 0.5310854, 0.9764774, 1, 0, 0.1372549, 1,
2.158086, -1.01121, 1.021828, 1, 0, 0.1333333, 1,
2.167603, 0.289193, 0.5304495, 1, 0, 0.1254902, 1,
2.17907, 0.5380448, 2.197755, 1, 0, 0.1215686, 1,
2.190852, -1.083965, 1.738967, 1, 0, 0.1137255, 1,
2.193669, -1.999552, 2.489366, 1, 0, 0.1098039, 1,
2.222621, -0.7523942, 3.253887, 1, 0, 0.1019608, 1,
2.24313, 1.259217, 1.869552, 1, 0, 0.09411765, 1,
2.277634, -0.1902694, 3.012543, 1, 0, 0.09019608, 1,
2.288125, 0.1296698, 2.464931, 1, 0, 0.08235294, 1,
2.316723, 0.5997826, 1.196371, 1, 0, 0.07843138, 1,
2.364065, -1.250331, 2.345057, 1, 0, 0.07058824, 1,
2.397008, 1.094875, 1.608552, 1, 0, 0.06666667, 1,
2.400948, -0.3848525, 1.837534, 1, 0, 0.05882353, 1,
2.420819, -1.10658, 2.17717, 1, 0, 0.05490196, 1,
2.428143, 1.619935, 0.9415214, 1, 0, 0.04705882, 1,
2.441255, -1.535461, 1.288799, 1, 0, 0.04313726, 1,
2.453802, 0.09575829, 2.403481, 1, 0, 0.03529412, 1,
2.457461, -0.7154058, 0.2599291, 1, 0, 0.03137255, 1,
2.471637, -1.842636, 1.031446, 1, 0, 0.02352941, 1,
2.534529, 0.5313855, 2.515987, 1, 0, 0.01960784, 1,
2.568179, -0.7473251, 1.021781, 1, 0, 0.01176471, 1,
2.608755, -0.04940371, 1.681413, 1, 0, 0.007843138, 1
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
-0.07390392, -4.069105, -7.20233, 0, -0.5, 0.5, 0.5,
-0.07390392, -4.069105, -7.20233, 1, -0.5, 0.5, 0.5,
-0.07390392, -4.069105, -7.20233, 1, 1.5, 0.5, 0.5,
-0.07390392, -4.069105, -7.20233, 0, 1.5, 0.5, 0.5
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
-3.665984, 0.1590216, -7.20233, 0, -0.5, 0.5, 0.5,
-3.665984, 0.1590216, -7.20233, 1, -0.5, 0.5, 0.5,
-3.665984, 0.1590216, -7.20233, 1, 1.5, 0.5, 0.5,
-3.665984, 0.1590216, -7.20233, 0, 1.5, 0.5, 0.5
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
-3.665984, -4.069105, 0.07618904, 0, -0.5, 0.5, 0.5,
-3.665984, -4.069105, 0.07618904, 1, -0.5, 0.5, 0.5,
-3.665984, -4.069105, 0.07618904, 1, 1.5, 0.5, 0.5,
-3.665984, -4.069105, 0.07618904, 0, 1.5, 0.5, 0.5
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
-2, -3.093383, -5.522672,
2, -3.093383, -5.522672,
-2, -3.093383, -5.522672,
-2, -3.256004, -5.802615,
-1, -3.093383, -5.522672,
-1, -3.256004, -5.802615,
0, -3.093383, -5.522672,
0, -3.256004, -5.802615,
1, -3.093383, -5.522672,
1, -3.256004, -5.802615,
2, -3.093383, -5.522672,
2, -3.256004, -5.802615
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
-2, -3.581244, -6.362501, 0, -0.5, 0.5, 0.5,
-2, -3.581244, -6.362501, 1, -0.5, 0.5, 0.5,
-2, -3.581244, -6.362501, 1, 1.5, 0.5, 0.5,
-2, -3.581244, -6.362501, 0, 1.5, 0.5, 0.5,
-1, -3.581244, -6.362501, 0, -0.5, 0.5, 0.5,
-1, -3.581244, -6.362501, 1, -0.5, 0.5, 0.5,
-1, -3.581244, -6.362501, 1, 1.5, 0.5, 0.5,
-1, -3.581244, -6.362501, 0, 1.5, 0.5, 0.5,
0, -3.581244, -6.362501, 0, -0.5, 0.5, 0.5,
0, -3.581244, -6.362501, 1, -0.5, 0.5, 0.5,
0, -3.581244, -6.362501, 1, 1.5, 0.5, 0.5,
0, -3.581244, -6.362501, 0, 1.5, 0.5, 0.5,
1, -3.581244, -6.362501, 0, -0.5, 0.5, 0.5,
1, -3.581244, -6.362501, 1, -0.5, 0.5, 0.5,
1, -3.581244, -6.362501, 1, 1.5, 0.5, 0.5,
1, -3.581244, -6.362501, 0, 1.5, 0.5, 0.5,
2, -3.581244, -6.362501, 0, -0.5, 0.5, 0.5,
2, -3.581244, -6.362501, 1, -0.5, 0.5, 0.5,
2, -3.581244, -6.362501, 1, 1.5, 0.5, 0.5,
2, -3.581244, -6.362501, 0, 1.5, 0.5, 0.5
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
-2.837042, -2, -5.522672,
-2.837042, 3, -5.522672,
-2.837042, -2, -5.522672,
-2.975199, -2, -5.802615,
-2.837042, -1, -5.522672,
-2.975199, -1, -5.802615,
-2.837042, 0, -5.522672,
-2.975199, 0, -5.802615,
-2.837042, 1, -5.522672,
-2.975199, 1, -5.802615,
-2.837042, 2, -5.522672,
-2.975199, 2, -5.802615,
-2.837042, 3, -5.522672,
-2.975199, 3, -5.802615
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
-3.251513, -2, -6.362501, 0, -0.5, 0.5, 0.5,
-3.251513, -2, -6.362501, 1, -0.5, 0.5, 0.5,
-3.251513, -2, -6.362501, 1, 1.5, 0.5, 0.5,
-3.251513, -2, -6.362501, 0, 1.5, 0.5, 0.5,
-3.251513, -1, -6.362501, 0, -0.5, 0.5, 0.5,
-3.251513, -1, -6.362501, 1, -0.5, 0.5, 0.5,
-3.251513, -1, -6.362501, 1, 1.5, 0.5, 0.5,
-3.251513, -1, -6.362501, 0, 1.5, 0.5, 0.5,
-3.251513, 0, -6.362501, 0, -0.5, 0.5, 0.5,
-3.251513, 0, -6.362501, 1, -0.5, 0.5, 0.5,
-3.251513, 0, -6.362501, 1, 1.5, 0.5, 0.5,
-3.251513, 0, -6.362501, 0, 1.5, 0.5, 0.5,
-3.251513, 1, -6.362501, 0, -0.5, 0.5, 0.5,
-3.251513, 1, -6.362501, 1, -0.5, 0.5, 0.5,
-3.251513, 1, -6.362501, 1, 1.5, 0.5, 0.5,
-3.251513, 1, -6.362501, 0, 1.5, 0.5, 0.5,
-3.251513, 2, -6.362501, 0, -0.5, 0.5, 0.5,
-3.251513, 2, -6.362501, 1, -0.5, 0.5, 0.5,
-3.251513, 2, -6.362501, 1, 1.5, 0.5, 0.5,
-3.251513, 2, -6.362501, 0, 1.5, 0.5, 0.5,
-3.251513, 3, -6.362501, 0, -0.5, 0.5, 0.5,
-3.251513, 3, -6.362501, 1, -0.5, 0.5, 0.5,
-3.251513, 3, -6.362501, 1, 1.5, 0.5, 0.5,
-3.251513, 3, -6.362501, 0, 1.5, 0.5, 0.5
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
-2.837042, -3.093383, -4,
-2.837042, -3.093383, 4,
-2.837042, -3.093383, -4,
-2.975199, -3.256004, -4,
-2.837042, -3.093383, -2,
-2.975199, -3.256004, -2,
-2.837042, -3.093383, 0,
-2.975199, -3.256004, 0,
-2.837042, -3.093383, 2,
-2.975199, -3.256004, 2,
-2.837042, -3.093383, 4,
-2.975199, -3.256004, 4
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
-3.251513, -3.581244, -4, 0, -0.5, 0.5, 0.5,
-3.251513, -3.581244, -4, 1, -0.5, 0.5, 0.5,
-3.251513, -3.581244, -4, 1, 1.5, 0.5, 0.5,
-3.251513, -3.581244, -4, 0, 1.5, 0.5, 0.5,
-3.251513, -3.581244, -2, 0, -0.5, 0.5, 0.5,
-3.251513, -3.581244, -2, 1, -0.5, 0.5, 0.5,
-3.251513, -3.581244, -2, 1, 1.5, 0.5, 0.5,
-3.251513, -3.581244, -2, 0, 1.5, 0.5, 0.5,
-3.251513, -3.581244, 0, 0, -0.5, 0.5, 0.5,
-3.251513, -3.581244, 0, 1, -0.5, 0.5, 0.5,
-3.251513, -3.581244, 0, 1, 1.5, 0.5, 0.5,
-3.251513, -3.581244, 0, 0, 1.5, 0.5, 0.5,
-3.251513, -3.581244, 2, 0, -0.5, 0.5, 0.5,
-3.251513, -3.581244, 2, 1, -0.5, 0.5, 0.5,
-3.251513, -3.581244, 2, 1, 1.5, 0.5, 0.5,
-3.251513, -3.581244, 2, 0, 1.5, 0.5, 0.5,
-3.251513, -3.581244, 4, 0, -0.5, 0.5, 0.5,
-3.251513, -3.581244, 4, 1, -0.5, 0.5, 0.5,
-3.251513, -3.581244, 4, 1, 1.5, 0.5, 0.5,
-3.251513, -3.581244, 4, 0, 1.5, 0.5, 0.5
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
-2.837042, -3.093383, -5.522672,
-2.837042, 3.411427, -5.522672,
-2.837042, -3.093383, 5.67505,
-2.837042, 3.411427, 5.67505,
-2.837042, -3.093383, -5.522672,
-2.837042, -3.093383, 5.67505,
-2.837042, 3.411427, -5.522672,
-2.837042, 3.411427, 5.67505,
-2.837042, -3.093383, -5.522672,
2.689234, -3.093383, -5.522672,
-2.837042, -3.093383, 5.67505,
2.689234, -3.093383, 5.67505,
-2.837042, 3.411427, -5.522672,
2.689234, 3.411427, -5.522672,
-2.837042, 3.411427, 5.67505,
2.689234, 3.411427, 5.67505,
2.689234, -3.093383, -5.522672,
2.689234, 3.411427, -5.522672,
2.689234, -3.093383, 5.67505,
2.689234, 3.411427, 5.67505,
2.689234, -3.093383, -5.522672,
2.689234, -3.093383, 5.67505,
2.689234, 3.411427, -5.522672,
2.689234, 3.411427, 5.67505
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
var radius = 7.518349;
var distance = 33.44998;
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
mvMatrix.translate( 0.07390392, -0.1590216, -0.07618904 );
mvMatrix.scale( 1.47097, 1.249689, 0.72595 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.44998);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
metconazole<-read.table("metconazole.xyz")
```

```
## Error in read.table("metconazole.xyz"): no lines available in input
```

```r
x<-metconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'metconazole' not found
```

```r
y<-metconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'metconazole' not found
```

```r
z<-metconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'metconazole' not found
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
-2.756562, 1.085289, -0.5257552, 0, 0, 1, 1, 1,
-2.735405, 0.6638212, -1.365236, 1, 0, 0, 1, 1,
-2.690765, -0.6143393, -0.778129, 1, 0, 0, 1, 1,
-2.623265, -0.9502944, -0.6530867, 1, 0, 0, 1, 1,
-2.587796, -0.6137699, -0.5135457, 1, 0, 0, 1, 1,
-2.444727, 1.577056, -0.5576821, 1, 0, 0, 1, 1,
-2.426239, 0.2195749, -2.665633, 0, 0, 0, 1, 1,
-2.404479, 0.3582391, -0.6124057, 0, 0, 0, 1, 1,
-2.393493, -0.24511, -2.695673, 0, 0, 0, 1, 1,
-2.353322, 1.687617, -1.171644, 0, 0, 0, 1, 1,
-2.317696, -0.3728245, -2.066714, 0, 0, 0, 1, 1,
-2.268613, -0.02040977, -2.560431, 0, 0, 0, 1, 1,
-2.252489, 0.5663336, -0.5627413, 0, 0, 0, 1, 1,
-2.241294, -0.5072958, -0.08751939, 1, 1, 1, 1, 1,
-2.195077, 1.480796, -0.9775719, 1, 1, 1, 1, 1,
-2.172542, -1.529978, -0.3337346, 1, 1, 1, 1, 1,
-2.145949, 0.1968814, -3.283108, 1, 1, 1, 1, 1,
-2.003593, 1.433141, -0.5198627, 1, 1, 1, 1, 1,
-1.978441, -0.806241, -1.140845, 1, 1, 1, 1, 1,
-1.940138, -0.1371634, -1.681825, 1, 1, 1, 1, 1,
-1.927568, -2.049077, -1.149381, 1, 1, 1, 1, 1,
-1.925121, 0.2726107, -2.7085, 1, 1, 1, 1, 1,
-1.900959, 1.290897, -1.196183, 1, 1, 1, 1, 1,
-1.884706, -1.441231, -2.341991, 1, 1, 1, 1, 1,
-1.878767, -1.979693, -1.253151, 1, 1, 1, 1, 1,
-1.863857, 0.08564934, -1.586503, 1, 1, 1, 1, 1,
-1.844613, 0.05490211, -0.6530614, 1, 1, 1, 1, 1,
-1.839345, 0.1991873, -1.57459, 1, 1, 1, 1, 1,
-1.827646, -0.4993405, -3.410295, 0, 0, 1, 1, 1,
-1.798564, 0.3726964, -1.146842, 1, 0, 0, 1, 1,
-1.798476, -0.6920855, -0.607847, 1, 0, 0, 1, 1,
-1.794803, -0.4631299, -1.902726, 1, 0, 0, 1, 1,
-1.78663, 1.10971, -1.522017, 1, 0, 0, 1, 1,
-1.778316, -0.6673347, -1.708594, 1, 0, 0, 1, 1,
-1.742593, 0.02588003, -1.010669, 0, 0, 0, 1, 1,
-1.739461, 0.2768721, -0.77318, 0, 0, 0, 1, 1,
-1.724679, -1.037879, -2.14573, 0, 0, 0, 1, 1,
-1.724545, -0.6737829, -1.762412, 0, 0, 0, 1, 1,
-1.702241, 0.1301242, -0.6379457, 0, 0, 0, 1, 1,
-1.670816, 0.1593609, -2.298788, 0, 0, 0, 1, 1,
-1.660446, -0.4004425, -0.4896339, 0, 0, 0, 1, 1,
-1.659885, 0.2627176, -1.010922, 1, 1, 1, 1, 1,
-1.638448, 0.7272959, -0.3661803, 1, 1, 1, 1, 1,
-1.628412, -0.7065644, -2.15291, 1, 1, 1, 1, 1,
-1.625225, 0.001216324, -3.015111, 1, 1, 1, 1, 1,
-1.621901, 0.5237509, -2.471365, 1, 1, 1, 1, 1,
-1.610521, -0.6808044, -0.9241791, 1, 1, 1, 1, 1,
-1.60676, 0.6160408, -0.6781367, 1, 1, 1, 1, 1,
-1.586444, 1.439028, -0.0812299, 1, 1, 1, 1, 1,
-1.581659, -0.6789156, -1.776347, 1, 1, 1, 1, 1,
-1.576358, 0.67308, -2.829998, 1, 1, 1, 1, 1,
-1.566431, -0.9141234, -2.833937, 1, 1, 1, 1, 1,
-1.562334, -0.6763824, -4.077085, 1, 1, 1, 1, 1,
-1.560672, 0.9260707, -2.307158, 1, 1, 1, 1, 1,
-1.542509, 0.5225958, 1.663967, 1, 1, 1, 1, 1,
-1.524156, 0.1606104, -1.976085, 1, 1, 1, 1, 1,
-1.511943, -0.4739664, -2.818765, 0, 0, 1, 1, 1,
-1.507678, -0.7460998, -0.5312713, 1, 0, 0, 1, 1,
-1.505494, -0.0227343, -1.180902, 1, 0, 0, 1, 1,
-1.504904, 0.02715983, -1.100197, 1, 0, 0, 1, 1,
-1.476683, 1.132578, -0.2413887, 1, 0, 0, 1, 1,
-1.467351, 0.1759296, -2.290295, 1, 0, 0, 1, 1,
-1.466707, -1.498336, -1.428034, 0, 0, 0, 1, 1,
-1.462038, 0.801434, -1.44116, 0, 0, 0, 1, 1,
-1.441968, -0.9999355, -0.9660125, 0, 0, 0, 1, 1,
-1.440876, 0.1688103, -2.939094, 0, 0, 0, 1, 1,
-1.439935, 1.165171, -1.098628, 0, 0, 0, 1, 1,
-1.417393, 1.185306, -2.450764, 0, 0, 0, 1, 1,
-1.410178, -0.1305014, -2.702061, 0, 0, 0, 1, 1,
-1.401702, 0.7009466, -2.113668, 1, 1, 1, 1, 1,
-1.396279, 0.2275465, -0.578136, 1, 1, 1, 1, 1,
-1.390553, 0.2334928, -1.043672, 1, 1, 1, 1, 1,
-1.38286, 0.2214549, -1.103874, 1, 1, 1, 1, 1,
-1.367384, 0.4661305, -2.129044, 1, 1, 1, 1, 1,
-1.365119, -0.9991837, -2.639054, 1, 1, 1, 1, 1,
-1.334154, -0.2453893, -0.9026515, 1, 1, 1, 1, 1,
-1.328512, 0.689396, -0.5166558, 1, 1, 1, 1, 1,
-1.323273, -0.1293261, -2.979964, 1, 1, 1, 1, 1,
-1.318156, 0.802816, -1.127442, 1, 1, 1, 1, 1,
-1.306586, 0.4913573, -1.243223, 1, 1, 1, 1, 1,
-1.279306, 0.07379764, -1.441665, 1, 1, 1, 1, 1,
-1.269266, -0.6326126, -0.7000663, 1, 1, 1, 1, 1,
-1.265409, 0.7424088, -0.6117188, 1, 1, 1, 1, 1,
-1.264363, -1.276976, -1.557118, 1, 1, 1, 1, 1,
-1.264066, -0.4241497, -0.7076296, 0, 0, 1, 1, 1,
-1.261155, -0.1903685, -0.4608232, 1, 0, 0, 1, 1,
-1.249271, -0.6976933, -1.766349, 1, 0, 0, 1, 1,
-1.248095, -1.106552, -1.543539, 1, 0, 0, 1, 1,
-1.241633, -0.5592276, -0.4346153, 1, 0, 0, 1, 1,
-1.241271, 0.4081475, -0.3054569, 1, 0, 0, 1, 1,
-1.234178, 1.027258, -1.122391, 0, 0, 0, 1, 1,
-1.229715, -0.9583549, -0.8920903, 0, 0, 0, 1, 1,
-1.228762, -0.3726858, 0.05126949, 0, 0, 0, 1, 1,
-1.228682, 0.1985088, -0.9543335, 0, 0, 0, 1, 1,
-1.227451, -1.085818, -1.886485, 0, 0, 0, 1, 1,
-1.226867, 0.7016065, -2.229486, 0, 0, 0, 1, 1,
-1.221822, -0.8106952, -0.674131, 0, 0, 0, 1, 1,
-1.217373, -1.926698, -3.087948, 1, 1, 1, 1, 1,
-1.187581, 0.8151587, -2.125632, 1, 1, 1, 1, 1,
-1.186394, -1.087075, -2.749767, 1, 1, 1, 1, 1,
-1.181725, -0.5569161, -2.677224, 1, 1, 1, 1, 1,
-1.178949, -0.9313694, -1.649598, 1, 1, 1, 1, 1,
-1.176523, 0.8285453, -0.6808552, 1, 1, 1, 1, 1,
-1.174543, 0.5813971, -0.7841825, 1, 1, 1, 1, 1,
-1.174479, -0.09010132, -2.161008, 1, 1, 1, 1, 1,
-1.164295, 2.228603, 0.3193803, 1, 1, 1, 1, 1,
-1.157206, -1.031647, -1.823424, 1, 1, 1, 1, 1,
-1.150144, 1.536096, -0.6710069, 1, 1, 1, 1, 1,
-1.149337, 1.675451, 0.1851491, 1, 1, 1, 1, 1,
-1.149024, 0.2822243, -0.323437, 1, 1, 1, 1, 1,
-1.145843, 0.2972642, -0.4067825, 1, 1, 1, 1, 1,
-1.143519, -0.8754965, -2.186524, 1, 1, 1, 1, 1,
-1.134408, 0.606585, -1.762295, 0, 0, 1, 1, 1,
-1.133026, 1.949738, 0.2261642, 1, 0, 0, 1, 1,
-1.130609, 0.4642676, -1.812017, 1, 0, 0, 1, 1,
-1.127516, -1.258692, -3.518897, 1, 0, 0, 1, 1,
-1.123636, -1.047742, -3.915032, 1, 0, 0, 1, 1,
-1.113022, -0.6734973, -0.5735832, 1, 0, 0, 1, 1,
-1.112046, 0.2244113, -0.5201505, 0, 0, 0, 1, 1,
-1.110684, -2.04143, -1.167258, 0, 0, 0, 1, 1,
-1.109266, -0.3135855, -1.400275, 0, 0, 0, 1, 1,
-1.099809, 0.3572191, -0.3589452, 0, 0, 0, 1, 1,
-1.099225, -1.100131, -1.884703, 0, 0, 0, 1, 1,
-1.097295, 1.30776, -0.09356353, 0, 0, 0, 1, 1,
-1.096614, 0.6549723, -0.2715668, 0, 0, 0, 1, 1,
-1.095197, -0.1143645, -0.0583734, 1, 1, 1, 1, 1,
-1.095093, 0.634909, -0.4304557, 1, 1, 1, 1, 1,
-1.092523, -0.6669581, -0.4083582, 1, 1, 1, 1, 1,
-1.089869, 1.062399, 0.2750717, 1, 1, 1, 1, 1,
-1.088098, -1.276492, -3.768385, 1, 1, 1, 1, 1,
-1.08503, -0.3603271, -0.9183008, 1, 1, 1, 1, 1,
-1.067099, -0.2054755, -2.327035, 1, 1, 1, 1, 1,
-1.066875, 0.5854575, -1.415796, 1, 1, 1, 1, 1,
-1.066664, -2.27762, -4.700388, 1, 1, 1, 1, 1,
-1.064332, -0.7780269, -3.680238, 1, 1, 1, 1, 1,
-1.063302, 1.32208, -2.419085, 1, 1, 1, 1, 1,
-1.054817, -0.7824873, -0.835833, 1, 1, 1, 1, 1,
-1.053249, 1.269057, 0.2530763, 1, 1, 1, 1, 1,
-1.0511, -0.5516842, -2.234498, 1, 1, 1, 1, 1,
-1.044349, -0.8004408, -0.4031033, 1, 1, 1, 1, 1,
-1.041884, -1.440374, -2.610378, 0, 0, 1, 1, 1,
-1.0413, 1.515499, -1.75455, 1, 0, 0, 1, 1,
-1.040463, 0.1044756, -1.77646, 1, 0, 0, 1, 1,
-1.039359, 0.287849, -1.311943, 1, 0, 0, 1, 1,
-1.031828, 0.7307554, -4.358725, 1, 0, 0, 1, 1,
-1.028419, 1.501225, -0.6352068, 1, 0, 0, 1, 1,
-1.0276, 1.043005, -0.02851175, 0, 0, 0, 1, 1,
-1.025783, 0.9794809, 0.296027, 0, 0, 0, 1, 1,
-1.023163, 0.5040835, -0.4347439, 0, 0, 0, 1, 1,
-1.011734, -0.4911497, -2.110994, 0, 0, 0, 1, 1,
-1.005591, 1.569763, 2.429267, 0, 0, 0, 1, 1,
-1.004221, -0.9716535, -2.339628, 0, 0, 0, 1, 1,
-0.9987546, 0.2717536, -0.4681593, 0, 0, 0, 1, 1,
-0.9954475, -0.6955501, -3.794144, 1, 1, 1, 1, 1,
-0.9924186, -0.6022112, -3.120309, 1, 1, 1, 1, 1,
-0.9912319, 0.322162, -1.261407, 1, 1, 1, 1, 1,
-0.990557, 1.740304, -0.2601618, 1, 1, 1, 1, 1,
-0.9877745, -1.678436, -3.641483, 1, 1, 1, 1, 1,
-0.9812641, -0.957978, -1.892599, 1, 1, 1, 1, 1,
-0.9696736, -0.4819265, -1.808798, 1, 1, 1, 1, 1,
-0.9573602, -0.9009038, -0.2077481, 1, 1, 1, 1, 1,
-0.9570022, 1.578536, 0.08516889, 1, 1, 1, 1, 1,
-0.950854, -0.3114553, -3.065301, 1, 1, 1, 1, 1,
-0.9487393, 0.4422638, -0.6700782, 1, 1, 1, 1, 1,
-0.9403296, 0.6646909, -0.6099428, 1, 1, 1, 1, 1,
-0.9363719, 1.147305, -1.938257, 1, 1, 1, 1, 1,
-0.9345444, -0.6939018, -1.245147, 1, 1, 1, 1, 1,
-0.9292907, 0.2525653, -0.2509047, 1, 1, 1, 1, 1,
-0.9286905, -1.999032, -1.810017, 0, 0, 1, 1, 1,
-0.9235504, -0.1194037, 0.106667, 1, 0, 0, 1, 1,
-0.9122522, 0.1502655, -0.753309, 1, 0, 0, 1, 1,
-0.9097448, 0.9068754, 1.754906, 1, 0, 0, 1, 1,
-0.9073685, -2.530634, -4.804678, 1, 0, 0, 1, 1,
-0.9059559, 1.058714, -1.158453, 1, 0, 0, 1, 1,
-0.8923426, -1.102795, -2.761261, 0, 0, 0, 1, 1,
-0.8885895, 0.546362, -2.310377, 0, 0, 0, 1, 1,
-0.8846318, -0.193603, -1.513494, 0, 0, 0, 1, 1,
-0.882858, 2.150865, -0.5535598, 0, 0, 0, 1, 1,
-0.8788645, 0.1456015, -1.52466, 0, 0, 0, 1, 1,
-0.8693425, 0.7382289, -0.5537015, 0, 0, 0, 1, 1,
-0.8651835, -0.7179914, -2.718445, 0, 0, 0, 1, 1,
-0.8593658, -0.460172, -2.704446, 1, 1, 1, 1, 1,
-0.8592378, -0.05593903, -0.4657038, 1, 1, 1, 1, 1,
-0.8582695, 0.2539091, -2.262967, 1, 1, 1, 1, 1,
-0.8486845, -0.8903858, -1.343112, 1, 1, 1, 1, 1,
-0.8391346, -0.2893415, -1.523354, 1, 1, 1, 1, 1,
-0.8373788, -1.081451, -1.065895, 1, 1, 1, 1, 1,
-0.8370251, -0.08312016, -3.551858, 1, 1, 1, 1, 1,
-0.8368014, -0.1839208, -1.054526, 1, 1, 1, 1, 1,
-0.8322763, -0.4651924, -1.210151, 1, 1, 1, 1, 1,
-0.8320556, 1.261879, -0.1921697, 1, 1, 1, 1, 1,
-0.8291252, -0.2383475, -2.108361, 1, 1, 1, 1, 1,
-0.8194319, -1.270199, -2.522138, 1, 1, 1, 1, 1,
-0.8138527, -0.3042075, -0.946905, 1, 1, 1, 1, 1,
-0.8115295, -0.06228496, -0.7021229, 1, 1, 1, 1, 1,
-0.8076921, -0.2635892, -2.583102, 1, 1, 1, 1, 1,
-0.8061916, -0.9819364, -3.445818, 0, 0, 1, 1, 1,
-0.8036719, 0.3759023, -1.173674, 1, 0, 0, 1, 1,
-0.801294, -1.283044, -1.999418, 1, 0, 0, 1, 1,
-0.7986171, 1.762397, -0.7296358, 1, 0, 0, 1, 1,
-0.798085, -1.045648, -1.124053, 1, 0, 0, 1, 1,
-0.7934881, -0.6906163, -2.695858, 1, 0, 0, 1, 1,
-0.7923069, 0.6888875, -1.345461, 0, 0, 0, 1, 1,
-0.7870642, -1.753752, -2.172971, 0, 0, 0, 1, 1,
-0.7847472, -1.211244, -2.339126, 0, 0, 0, 1, 1,
-0.7835768, 0.7418144, 0.9103208, 0, 0, 0, 1, 1,
-0.7804442, 0.8206681, -0.2351403, 0, 0, 0, 1, 1,
-0.7801379, 0.4265456, -0.2320361, 0, 0, 0, 1, 1,
-0.7797703, 2.185002, -0.9064541, 0, 0, 0, 1, 1,
-0.7737646, 0.3397351, -0.5657, 1, 1, 1, 1, 1,
-0.7678485, 0.2465571, -0.6607655, 1, 1, 1, 1, 1,
-0.7640401, 1.519803, -0.6697807, 1, 1, 1, 1, 1,
-0.7623555, -0.9155991, -2.492373, 1, 1, 1, 1, 1,
-0.75938, 0.505559, 0.08481324, 1, 1, 1, 1, 1,
-0.7572873, 1.991666, -0.6048771, 1, 1, 1, 1, 1,
-0.7558926, 0.7028696, 0.01855507, 1, 1, 1, 1, 1,
-0.7523133, 0.6463345, 0.4039728, 1, 1, 1, 1, 1,
-0.7515152, 0.4914773, -2.461721, 1, 1, 1, 1, 1,
-0.7443874, -0.6061592, -1.491784, 1, 1, 1, 1, 1,
-0.7397249, -0.6939217, -3.013048, 1, 1, 1, 1, 1,
-0.7288448, -0.3515797, -0.8263698, 1, 1, 1, 1, 1,
-0.7262378, 1.72199, 0.10208, 1, 1, 1, 1, 1,
-0.7216805, -1.255668, -1.925632, 1, 1, 1, 1, 1,
-0.7210237, -1.257832, -2.93433, 1, 1, 1, 1, 1,
-0.7184127, -1.621081, -2.676426, 0, 0, 1, 1, 1,
-0.7123615, -0.2070162, -2.609542, 1, 0, 0, 1, 1,
-0.7077589, -0.1577563, -3.439206, 1, 0, 0, 1, 1,
-0.707302, 1.377215, 1.397367, 1, 0, 0, 1, 1,
-0.7032396, 1.82299, 1.547752, 1, 0, 0, 1, 1,
-0.7008787, 0.1709799, -2.342116, 1, 0, 0, 1, 1,
-0.7003427, -0.7496143, -4.583671, 0, 0, 0, 1, 1,
-0.7002236, 0.8159541, -1.782736, 0, 0, 0, 1, 1,
-0.6972516, 0.1130727, -0.5673684, 0, 0, 0, 1, 1,
-0.6962517, 1.781813, -0.6953846, 0, 0, 0, 1, 1,
-0.6839385, -1.467883, -1.303563, 0, 0, 0, 1, 1,
-0.6836821, 1.262975, 0.2580766, 0, 0, 0, 1, 1,
-0.6797612, 0.5868497, -0.2978019, 0, 0, 0, 1, 1,
-0.6796536, -0.4489226, -4.521041, 1, 1, 1, 1, 1,
-0.6746854, -1.617372, -2.075452, 1, 1, 1, 1, 1,
-0.6735098, -1.486942, -3.171061, 1, 1, 1, 1, 1,
-0.6708543, -0.2190221, -3.161324, 1, 1, 1, 1, 1,
-0.6702368, -1.123229, -2.941653, 1, 1, 1, 1, 1,
-0.6542344, 1.142902, 1.752311, 1, 1, 1, 1, 1,
-0.6516424, -0.8785517, -2.006863, 1, 1, 1, 1, 1,
-0.6478255, -0.7135163, -0.3980197, 1, 1, 1, 1, 1,
-0.6435633, 0.1814565, -2.330491, 1, 1, 1, 1, 1,
-0.6360277, -0.9443225, -1.497856, 1, 1, 1, 1, 1,
-0.6321917, 0.3173035, -3.109885, 1, 1, 1, 1, 1,
-0.6303536, -0.08649571, -0.8998293, 1, 1, 1, 1, 1,
-0.6281368, -0.08397583, -1.115008, 1, 1, 1, 1, 1,
-0.6179982, 0.5982552, -1.313635, 1, 1, 1, 1, 1,
-0.6172545, -0.3307278, -3.519312, 1, 1, 1, 1, 1,
-0.6067741, 0.02582099, -1.512623, 0, 0, 1, 1, 1,
-0.6025918, 0.6607895, -0.959092, 1, 0, 0, 1, 1,
-0.6023647, 0.8017397, -0.3612129, 1, 0, 0, 1, 1,
-0.5963963, 1.242971, -0.4111317, 1, 0, 0, 1, 1,
-0.5923905, 0.3019867, -2.153543, 1, 0, 0, 1, 1,
-0.5912604, -1.186262, -3.776374, 1, 0, 0, 1, 1,
-0.5879862, 0.3067887, 0.3518969, 0, 0, 0, 1, 1,
-0.5842308, 2.154343, 0.06961714, 0, 0, 0, 1, 1,
-0.5782464, -0.1437162, -1.018628, 0, 0, 0, 1, 1,
-0.5732853, -1.122892, -4.010843, 0, 0, 0, 1, 1,
-0.5696332, 0.3067944, -0.5596697, 0, 0, 0, 1, 1,
-0.5693637, 0.5966557, -1.374523, 0, 0, 0, 1, 1,
-0.5690257, -0.3292768, -2.788762, 0, 0, 0, 1, 1,
-0.5678723, -1.071216, -1.647633, 1, 1, 1, 1, 1,
-0.5670686, -1.479994, -3.798496, 1, 1, 1, 1, 1,
-0.5670144, 0.7651283, -0.7653735, 1, 1, 1, 1, 1,
-0.5666342, 0.5621745, 0.2620257, 1, 1, 1, 1, 1,
-0.5638182, -0.5457983, -3.348363, 1, 1, 1, 1, 1,
-0.5626186, -0.2127235, -1.399759, 1, 1, 1, 1, 1,
-0.5614693, -1.489091, -3.260798, 1, 1, 1, 1, 1,
-0.5602443, -1.12905, -3.123997, 1, 1, 1, 1, 1,
-0.5588122, 0.09554493, -0.7199742, 1, 1, 1, 1, 1,
-0.5553422, -1.205978, -2.556782, 1, 1, 1, 1, 1,
-0.5538768, -0.4808304, -2.652589, 1, 1, 1, 1, 1,
-0.5537146, -0.005271182, -1.559401, 1, 1, 1, 1, 1,
-0.5519167, -0.8740823, -1.707087, 1, 1, 1, 1, 1,
-0.5474035, -0.4416106, -2.681757, 1, 1, 1, 1, 1,
-0.5460993, -1.93146, -2.655434, 1, 1, 1, 1, 1,
-0.5424031, 2.619881, -1.102381, 0, 0, 1, 1, 1,
-0.5410157, 0.7164311, -1.966671, 1, 0, 0, 1, 1,
-0.5388862, -0.1195658, -2.811868, 1, 0, 0, 1, 1,
-0.5361805, 1.4759, -0.9437826, 1, 0, 0, 1, 1,
-0.5347716, -0.3152268, -1.234447, 1, 0, 0, 1, 1,
-0.5283471, -0.7227131, -2.03877, 1, 0, 0, 1, 1,
-0.5240954, 0.1816486, -3.591391, 0, 0, 0, 1, 1,
-0.5228532, 1.281199, 0.3309188, 0, 0, 0, 1, 1,
-0.5227651, -1.248855, -3.197143, 0, 0, 0, 1, 1,
-0.5211268, 0.4326466, -0.3521415, 0, 0, 0, 1, 1,
-0.5150141, 0.9929147, -0.1287495, 0, 0, 0, 1, 1,
-0.5147611, 0.2358751, -1.056503, 0, 0, 0, 1, 1,
-0.5138056, -0.6064059, -2.74654, 0, 0, 0, 1, 1,
-0.5110775, 1.162555, -0.858726, 1, 1, 1, 1, 1,
-0.5101609, 0.6704212, -0.5627443, 1, 1, 1, 1, 1,
-0.5099654, -0.5813736, -2.32181, 1, 1, 1, 1, 1,
-0.5087489, 0.2480431, 0.3792622, 1, 1, 1, 1, 1,
-0.5066955, -2.958554, -4.606844, 1, 1, 1, 1, 1,
-0.501973, -1.573858, -4.278858, 1, 1, 1, 1, 1,
-0.4993425, 0.2784469, -0.6563498, 1, 1, 1, 1, 1,
-0.4976944, -0.59541, -3.852658, 1, 1, 1, 1, 1,
-0.4924399, 1.665529, -1.227518, 1, 1, 1, 1, 1,
-0.4877593, 0.475689, -1.324485, 1, 1, 1, 1, 1,
-0.4852911, -0.211099, -0.4113553, 1, 1, 1, 1, 1,
-0.4768317, 1.886315, 0.1838608, 1, 1, 1, 1, 1,
-0.4762286, 2.739928, -0.9278604, 1, 1, 1, 1, 1,
-0.4742926, 0.7860032, -0.5720238, 1, 1, 1, 1, 1,
-0.4732727, 0.7008159, 0.1104419, 1, 1, 1, 1, 1,
-0.4662336, -0.6543144, -2.195197, 0, 0, 1, 1, 1,
-0.4621136, 2.204464, -0.2594763, 1, 0, 0, 1, 1,
-0.4608878, -0.03471494, 0.4778394, 1, 0, 0, 1, 1,
-0.4600815, 0.7812094, -0.6156297, 1, 0, 0, 1, 1,
-0.459129, 0.04679968, -0.4014632, 1, 0, 0, 1, 1,
-0.4552416, -1.683059, -4.231434, 1, 0, 0, 1, 1,
-0.4530236, 0.3313204, -2.094189, 0, 0, 0, 1, 1,
-0.451744, 0.4481876, -1.982919, 0, 0, 0, 1, 1,
-0.4506714, -0.5417781, -1.804025, 0, 0, 0, 1, 1,
-0.4481528, 0.2771844, -1.720189, 0, 0, 0, 1, 1,
-0.4476175, 0.3991615, -1.022729, 0, 0, 0, 1, 1,
-0.4463406, -2.998653, -2.772364, 0, 0, 0, 1, 1,
-0.4428859, -1.112839, -3.60057, 0, 0, 0, 1, 1,
-0.441238, 1.697383, -0.9786886, 1, 1, 1, 1, 1,
-0.4396762, -1.620723, -3.270029, 1, 1, 1, 1, 1,
-0.4347119, -0.7969295, -2.969002, 1, 1, 1, 1, 1,
-0.4334565, -1.058111, -4.038243, 1, 1, 1, 1, 1,
-0.423744, 0.7356833, -1.068799, 1, 1, 1, 1, 1,
-0.4225479, -1.051058, -2.412713, 1, 1, 1, 1, 1,
-0.4209864, -0.7423748, -2.671577, 1, 1, 1, 1, 1,
-0.4198588, -0.654578, -0.9490971, 1, 1, 1, 1, 1,
-0.4194585, -0.0580007, -2.15623, 1, 1, 1, 1, 1,
-0.4181055, -2.031646, -2.673515, 1, 1, 1, 1, 1,
-0.416298, 0.6613533, -1.520284, 1, 1, 1, 1, 1,
-0.4157096, -0.04399323, -2.046181, 1, 1, 1, 1, 1,
-0.413083, -0.04747808, -1.437645, 1, 1, 1, 1, 1,
-0.4111454, 1.166714, -0.189965, 1, 1, 1, 1, 1,
-0.4102894, -0.9179764, -2.30836, 1, 1, 1, 1, 1,
-0.4097989, 1.000036, 0.05050197, 0, 0, 1, 1, 1,
-0.409527, 0.5395677, -2.347214, 1, 0, 0, 1, 1,
-0.4044641, 0.7266045, 0.5603898, 1, 0, 0, 1, 1,
-0.4031168, -0.4048819, -4.108558, 1, 0, 0, 1, 1,
-0.3948034, 1.258666, -0.8010915, 1, 0, 0, 1, 1,
-0.3940673, 0.4171105, -0.6862296, 1, 0, 0, 1, 1,
-0.3908437, 1.35772, -0.344775, 0, 0, 0, 1, 1,
-0.3892477, -0.5488662, -2.760501, 0, 0, 0, 1, 1,
-0.3862092, -1.148443, -3.40221, 0, 0, 0, 1, 1,
-0.3857007, -0.2058387, -2.879974, 0, 0, 0, 1, 1,
-0.3831918, -1.537648, -4.414878, 0, 0, 0, 1, 1,
-0.3805814, -0.7527966, -4.383566, 0, 0, 0, 1, 1,
-0.3750873, 0.04124631, -3.553946, 0, 0, 0, 1, 1,
-0.3742449, -0.5867154, -2.67092, 1, 1, 1, 1, 1,
-0.3688727, -0.06413753, -1.342745, 1, 1, 1, 1, 1,
-0.3654225, -0.2741455, -2.129566, 1, 1, 1, 1, 1,
-0.3615887, 2.268183, -1.659164, 1, 1, 1, 1, 1,
-0.3602199, 0.4271612, -1.185781, 1, 1, 1, 1, 1,
-0.3590396, 0.5307017, -1.218889, 1, 1, 1, 1, 1,
-0.3513166, 1.136045, -0.7605327, 1, 1, 1, 1, 1,
-0.3447246, 0.1849837, -0.3892531, 1, 1, 1, 1, 1,
-0.3442457, 0.04472346, -1.778979, 1, 1, 1, 1, 1,
-0.3407454, -0.3049805, -2.804047, 1, 1, 1, 1, 1,
-0.3335962, -0.1443839, -0.5305871, 1, 1, 1, 1, 1,
-0.3312399, 1.301, -0.5977826, 1, 1, 1, 1, 1,
-0.3303966, 0.303348, -1.495265, 1, 1, 1, 1, 1,
-0.3302261, 1.396404, -0.2902929, 1, 1, 1, 1, 1,
-0.32144, -1.648069, -3.096358, 1, 1, 1, 1, 1,
-0.321196, -0.01322711, -0.4999454, 0, 0, 1, 1, 1,
-0.3195292, 0.2979486, -1.081319, 1, 0, 0, 1, 1,
-0.3179884, -0.451918, -2.384647, 1, 0, 0, 1, 1,
-0.3151924, -1.360857, -2.484704, 1, 0, 0, 1, 1,
-0.3149365, 0.03088121, -2.733401, 1, 0, 0, 1, 1,
-0.3139174, -0.2810805, -3.096723, 1, 0, 0, 1, 1,
-0.3106718, 0.6473524, 1.557174, 0, 0, 0, 1, 1,
-0.3053685, 1.579543, 0.4246611, 0, 0, 0, 1, 1,
-0.3034277, -1.003638, -3.098591, 0, 0, 0, 1, 1,
-0.3025409, -0.5193644, -2.997748, 0, 0, 0, 1, 1,
-0.2974161, -1.529951, -4.564629, 0, 0, 0, 1, 1,
-0.2958333, 0.6130946, -2.226399, 0, 0, 0, 1, 1,
-0.2955716, 0.8937806, -0.9126757, 0, 0, 0, 1, 1,
-0.2915832, 0.8965772, -0.1546617, 1, 1, 1, 1, 1,
-0.2902074, -0.4640492, -3.962131, 1, 1, 1, 1, 1,
-0.2888384, 0.8176244, 0.2150718, 1, 1, 1, 1, 1,
-0.2886101, -0.4070284, -1.372463, 1, 1, 1, 1, 1,
-0.2877483, 0.3660956, 0.1711441, 1, 1, 1, 1, 1,
-0.2854667, 0.01712143, -1.178639, 1, 1, 1, 1, 1,
-0.2846296, -0.5851118, -3.015677, 1, 1, 1, 1, 1,
-0.2821477, -1.047606, -1.086402, 1, 1, 1, 1, 1,
-0.2789362, -1.053422, -3.414926, 1, 1, 1, 1, 1,
-0.2730173, -0.0995167, -2.009774, 1, 1, 1, 1, 1,
-0.2726271, -0.4214314, -2.652606, 1, 1, 1, 1, 1,
-0.2666596, -0.8268716, -2.954745, 1, 1, 1, 1, 1,
-0.2627634, -0.3874635, -3.121852, 1, 1, 1, 1, 1,
-0.2627595, -0.1940238, -3.343937, 1, 1, 1, 1, 1,
-0.2576312, -0.3888013, -3.331683, 1, 1, 1, 1, 1,
-0.2552893, -1.635501, -3.233988, 0, 0, 1, 1, 1,
-0.2530951, -0.8560326, -3.886885, 1, 0, 0, 1, 1,
-0.2505413, -0.3609101, -3.002556, 1, 0, 0, 1, 1,
-0.2476014, -0.5333306, -2.64291, 1, 0, 0, 1, 1,
-0.2460054, -2.237776, -3.62594, 1, 0, 0, 1, 1,
-0.2447928, -0.9275206, -3.056834, 1, 0, 0, 1, 1,
-0.2432991, -0.3186532, -2.912221, 0, 0, 0, 1, 1,
-0.2432395, 1.100609, 0.03793771, 0, 0, 0, 1, 1,
-0.242524, 1.064081, -0.5148144, 0, 0, 0, 1, 1,
-0.2371067, -1.552482, -3.576162, 0, 0, 0, 1, 1,
-0.2306045, -0.16901, -1.983598, 0, 0, 0, 1, 1,
-0.22647, -0.2800408, -1.9001, 0, 0, 0, 1, 1,
-0.2252666, 0.1168335, -0.7174106, 0, 0, 0, 1, 1,
-0.2250765, -0.2344784, -1.170805, 1, 1, 1, 1, 1,
-0.2241812, -0.1030117, -0.5614649, 1, 1, 1, 1, 1,
-0.2228951, -0.4642966, -2.151397, 1, 1, 1, 1, 1,
-0.2227278, 0.9100675, 0.05519802, 1, 1, 1, 1, 1,
-0.2161914, -0.2763953, -2.364262, 1, 1, 1, 1, 1,
-0.2153101, -0.7649964, -4.020736, 1, 1, 1, 1, 1,
-0.2134352, 0.2943988, -1.262693, 1, 1, 1, 1, 1,
-0.2078174, -0.5842245, -3.371787, 1, 1, 1, 1, 1,
-0.2043205, 0.4919476, -1.124037, 1, 1, 1, 1, 1,
-0.2017883, -1.563458, -3.267241, 1, 1, 1, 1, 1,
-0.1976183, 0.006674622, -1.274004, 1, 1, 1, 1, 1,
-0.1958482, 0.7233127, -1.080769, 1, 1, 1, 1, 1,
-0.1870775, 0.3417733, -1.859415, 1, 1, 1, 1, 1,
-0.1868065, 1.452221, -2.090394, 1, 1, 1, 1, 1,
-0.1847625, 0.6428397, 0.03413922, 1, 1, 1, 1, 1,
-0.1821097, 0.2347346, -0.4873595, 0, 0, 1, 1, 1,
-0.180646, -0.04927536, -2.106964, 1, 0, 0, 1, 1,
-0.1798119, -0.7023174, -4.462013, 1, 0, 0, 1, 1,
-0.1794204, 0.08851829, -1.27419, 1, 0, 0, 1, 1,
-0.1790707, -0.01082599, -2.313291, 1, 0, 0, 1, 1,
-0.1782951, -0.01983888, -3.454587, 1, 0, 0, 1, 1,
-0.1778609, 0.8527936, 0.04681209, 0, 0, 0, 1, 1,
-0.1748994, 1.20256, -0.7218933, 0, 0, 0, 1, 1,
-0.1742691, 1.628765, 0.4794399, 0, 0, 0, 1, 1,
-0.1737475, 0.02203323, -0.5213748, 0, 0, 0, 1, 1,
-0.1732948, -1.729057, -2.68428, 0, 0, 0, 1, 1,
-0.1730393, 0.2383274, -0.1949243, 0, 0, 0, 1, 1,
-0.1727138, -0.3670202, -2.072921, 0, 0, 0, 1, 1,
-0.1697748, -1.475843, -2.582414, 1, 1, 1, 1, 1,
-0.1646091, 1.282368, 1.095449, 1, 1, 1, 1, 1,
-0.1621287, -0.3636663, -3.040325, 1, 1, 1, 1, 1,
-0.1596164, 0.4499722, 0.8574312, 1, 1, 1, 1, 1,
-0.1582229, -1.628586, -4.001523, 1, 1, 1, 1, 1,
-0.1575379, -0.7241324, -2.736384, 1, 1, 1, 1, 1,
-0.1541278, -0.1904064, -2.54385, 1, 1, 1, 1, 1,
-0.149859, -0.09774724, -1.767131, 1, 1, 1, 1, 1,
-0.1472284, -1.783871, -3.479342, 1, 1, 1, 1, 1,
-0.1414463, 0.9094686, -1.576806, 1, 1, 1, 1, 1,
-0.1382863, 0.2505832, -0.736945, 1, 1, 1, 1, 1,
-0.1357457, 1.25855, -0.7265578, 1, 1, 1, 1, 1,
-0.1339103, -0.9243431, -2.884396, 1, 1, 1, 1, 1,
-0.1338923, 1.078845, -0.3832007, 1, 1, 1, 1, 1,
-0.1331476, -1.104152, -2.25304, 1, 1, 1, 1, 1,
-0.1317231, -0.3073293, -4.100476, 0, 0, 1, 1, 1,
-0.1307994, -0.3003568, -2.600134, 1, 0, 0, 1, 1,
-0.1275686, 0.5516243, -0.284154, 1, 0, 0, 1, 1,
-0.1215818, -0.3231242, -4.045453, 1, 0, 0, 1, 1,
-0.1208857, 0.08302671, 2.054029, 1, 0, 0, 1, 1,
-0.1198334, -0.3032676, -2.12285, 1, 0, 0, 1, 1,
-0.1147014, 0.3427121, -0.291518, 0, 0, 0, 1, 1,
-0.1125645, 0.3562304, -0.8165483, 0, 0, 0, 1, 1,
-0.1064477, 0.07964022, -0.7940037, 0, 0, 0, 1, 1,
-0.1043825, -1.050934, -1.900578, 0, 0, 0, 1, 1,
-0.09445587, -0.3112471, -3.293685, 0, 0, 0, 1, 1,
-0.09380175, -0.5553975, -1.362132, 0, 0, 0, 1, 1,
-0.09168538, -0.02638034, -3.134769, 0, 0, 0, 1, 1,
-0.08983374, 1.391051, -0.6248225, 1, 1, 1, 1, 1,
-0.0891992, 0.5439627, 0.9395463, 1, 1, 1, 1, 1,
-0.08765318, -1.248408, -3.655688, 1, 1, 1, 1, 1,
-0.08634876, -0.2895126, -2.995492, 1, 1, 1, 1, 1,
-0.08007959, -1.150778, -3.150994, 1, 1, 1, 1, 1,
-0.07932816, 0.2688998, 0.2916761, 1, 1, 1, 1, 1,
-0.07869472, 1.666333, -1.02831, 1, 1, 1, 1, 1,
-0.076069, 0.05510163, -0.5554739, 1, 1, 1, 1, 1,
-0.07406334, 0.312416, 0.4617907, 1, 1, 1, 1, 1,
-0.07362424, 1.072801, 0.8962794, 1, 1, 1, 1, 1,
-0.07213757, -1.775248, -3.501392, 1, 1, 1, 1, 1,
-0.0682044, -1.258355, -3.805994, 1, 1, 1, 1, 1,
-0.06804735, -0.9134554, -3.200386, 1, 1, 1, 1, 1,
-0.06718158, 0.9088826, -0.3830309, 1, 1, 1, 1, 1,
-0.06601273, 1.500566, -0.6610187, 1, 1, 1, 1, 1,
-0.05904826, 0.7241377, -0.6002387, 0, 0, 1, 1, 1,
-0.05585348, 3.316696, -0.5960233, 1, 0, 0, 1, 1,
-0.05250603, -0.8696241, -4.458961, 1, 0, 0, 1, 1,
-0.05216327, -0.5279084, -5.359598, 1, 0, 0, 1, 1,
-0.04782687, -0.3617923, -2.868835, 1, 0, 0, 1, 1,
-0.04084956, 0.175104, -1.872129, 1, 0, 0, 1, 1,
-0.03498628, 0.7272087, -0.5430838, 0, 0, 0, 1, 1,
-0.03137062, -1.291885, -2.373944, 0, 0, 0, 1, 1,
-0.02731882, -0.3013949, -2.445746, 0, 0, 0, 1, 1,
-0.0265903, 2.014764, -1.30577, 0, 0, 0, 1, 1,
-0.02641795, 0.4710179, -0.4320556, 0, 0, 0, 1, 1,
-0.02285497, 0.9577349, 1.947076, 0, 0, 0, 1, 1,
-0.02263542, -0.6240326, -4.327576, 0, 0, 0, 1, 1,
-0.02176627, 0.7329677, -0.4922225, 1, 1, 1, 1, 1,
-0.02025902, 0.710077, 0.5456526, 1, 1, 1, 1, 1,
-0.0181447, 0.5187747, 0.2453443, 1, 1, 1, 1, 1,
-0.01709893, -0.08500717, -3.385591, 1, 1, 1, 1, 1,
-0.01597219, 1.201641, -0.2552464, 1, 1, 1, 1, 1,
-0.01178571, 0.4292584, 0.2929289, 1, 1, 1, 1, 1,
-0.01120325, 0.74633, 0.1223141, 1, 1, 1, 1, 1,
-0.01013652, -0.04674296, -2.819312, 1, 1, 1, 1, 1,
-0.007937203, -0.2508838, -2.332715, 1, 1, 1, 1, 1,
-0.00676149, -0.8100998, -3.456818, 1, 1, 1, 1, 1,
-0.004387688, -0.7642742, -3.0587, 1, 1, 1, 1, 1,
-0.003650461, -1.749637, -3.001474, 1, 1, 1, 1, 1,
-0.001661596, -0.6648344, -2.043579, 1, 1, 1, 1, 1,
-0.0009298895, -1.577738, -4.045265, 1, 1, 1, 1, 1,
0.001072634, 0.3810971, -0.1179454, 1, 1, 1, 1, 1,
0.002587029, 0.3202966, 0.4906419, 0, 0, 1, 1, 1,
0.005020165, 1.944935, -0.7866095, 1, 0, 0, 1, 1,
0.005108898, 0.2606003, -1.204864, 1, 0, 0, 1, 1,
0.005364161, 1.03155, -0.6889905, 1, 0, 0, 1, 1,
0.01361126, 1.313338, 0.01627147, 1, 0, 0, 1, 1,
0.01515437, 0.1586755, 0.9852953, 1, 0, 0, 1, 1,
0.01721857, -0.54404, 3.971321, 0, 0, 0, 1, 1,
0.01845327, -0.5973638, 4.14819, 0, 0, 0, 1, 1,
0.02131979, -0.6759472, 2.696421, 0, 0, 0, 1, 1,
0.0226075, -0.8273711, 3.316473, 0, 0, 0, 1, 1,
0.02313163, 0.06441262, -2.357289, 0, 0, 0, 1, 1,
0.02438354, 1.772159, 0.5277634, 0, 0, 0, 1, 1,
0.02496837, 1.643378, 1.941282, 0, 0, 0, 1, 1,
0.04554832, -1.506548, 4.151115, 1, 1, 1, 1, 1,
0.04779185, -0.04934048, 3.927659, 1, 1, 1, 1, 1,
0.04818707, -2.305514, 2.785026, 1, 1, 1, 1, 1,
0.04951407, -1.354886, 3.658315, 1, 1, 1, 1, 1,
0.04966489, 1.387427, 0.9660566, 1, 1, 1, 1, 1,
0.05462632, -1.600493, 2.978162, 1, 1, 1, 1, 1,
0.06098038, 1.372494, -0.3250516, 1, 1, 1, 1, 1,
0.06132951, 0.7198944, 1.87522, 1, 1, 1, 1, 1,
0.0650361, 0.7831808, 1.358437, 1, 1, 1, 1, 1,
0.0666519, -0.649649, 0.8751285, 1, 1, 1, 1, 1,
0.06711054, -1.140882, 3.67625, 1, 1, 1, 1, 1,
0.06776311, 0.1617596, -0.3294277, 1, 1, 1, 1, 1,
0.07035875, -2.30501, 3.539889, 1, 1, 1, 1, 1,
0.07123246, 1.789919, 0.3525511, 1, 1, 1, 1, 1,
0.07347928, 0.2267176, 1.324812, 1, 1, 1, 1, 1,
0.07621798, -1.143412, 2.98339, 0, 0, 1, 1, 1,
0.07931586, 0.6816452, -1.028665, 1, 0, 0, 1, 1,
0.08036242, 0.5441087, -0.8068192, 1, 0, 0, 1, 1,
0.08115333, 0.497762, -0.06004696, 1, 0, 0, 1, 1,
0.08206505, 0.565908, 0.09591209, 1, 0, 0, 1, 1,
0.08374763, -1.375058, 1.993083, 1, 0, 0, 1, 1,
0.08760353, 0.8858325, 0.7947819, 0, 0, 0, 1, 1,
0.09709452, -0.9477971, 1.145848, 0, 0, 0, 1, 1,
0.09846194, -0.2902632, 3.289453, 0, 0, 0, 1, 1,
0.09859499, -0.5340573, 4.007537, 0, 0, 0, 1, 1,
0.09873797, 1.572391, 1.280143, 0, 0, 0, 1, 1,
0.1028295, -0.6644686, 2.430646, 0, 0, 0, 1, 1,
0.1042803, -1.454104, 4.714116, 0, 0, 0, 1, 1,
0.1047791, 2.648574, -0.1835564, 1, 1, 1, 1, 1,
0.1063157, -0.6228095, 2.688813, 1, 1, 1, 1, 1,
0.1177602, 0.5381491, -0.8715378, 1, 1, 1, 1, 1,
0.1239873, -0.6992224, 3.703928, 1, 1, 1, 1, 1,
0.1250622, 0.9294017, 0.6464224, 1, 1, 1, 1, 1,
0.1291026, -2.015338, 2.308847, 1, 1, 1, 1, 1,
0.1293411, -0.02701115, 2.182981, 1, 1, 1, 1, 1,
0.1297624, -1.776352, 3.592264, 1, 1, 1, 1, 1,
0.1303743, -0.5567224, 3.638931, 1, 1, 1, 1, 1,
0.1322033, -1.056041, 1.0882, 1, 1, 1, 1, 1,
0.1333363, 1.05301, 0.8390611, 1, 1, 1, 1, 1,
0.1335899, 0.7412883, 0.7612737, 1, 1, 1, 1, 1,
0.1378254, -0.8159588, 3.06979, 1, 1, 1, 1, 1,
0.1388397, 1.675098, 1.619415, 1, 1, 1, 1, 1,
0.140349, 0.87507, -0.004495274, 1, 1, 1, 1, 1,
0.1405326, -0.6534324, 2.278697, 0, 0, 1, 1, 1,
0.1503647, 0.05514763, 0.2810374, 1, 0, 0, 1, 1,
0.1532178, 1.207417, 0.5214034, 1, 0, 0, 1, 1,
0.153793, -0.4743902, 0.8624855, 1, 0, 0, 1, 1,
0.1554861, 1.151902, -0.6808242, 1, 0, 0, 1, 1,
0.1589805, -0.4224022, 4.175787, 1, 0, 0, 1, 1,
0.1604182, -0.292648, 1.979325, 0, 0, 0, 1, 1,
0.1622801, 0.7551206, -1.006437, 0, 0, 0, 1, 1,
0.1625303, 0.2170682, 0.8886334, 0, 0, 0, 1, 1,
0.1628581, 1.146034, 2.021859, 0, 0, 0, 1, 1,
0.168584, 0.4160264, 1.297006, 0, 0, 0, 1, 1,
0.1720315, 0.8473333, 0.05228872, 0, 0, 0, 1, 1,
0.1771827, -1.162797, 4.753067, 0, 0, 0, 1, 1,
0.1793577, -0.5005128, 0.9045338, 1, 1, 1, 1, 1,
0.1798747, 0.5360926, 0.923178, 1, 1, 1, 1, 1,
0.182859, 0.1023557, 2.07224, 1, 1, 1, 1, 1,
0.1923933, 0.4150528, 0.6597027, 1, 1, 1, 1, 1,
0.1954259, 1.24844, -0.4412965, 1, 1, 1, 1, 1,
0.1982767, -1.023783, 3.555014, 1, 1, 1, 1, 1,
0.1991699, -0.506366, 3.425443, 1, 1, 1, 1, 1,
0.1995737, -0.7771288, 3.413149, 1, 1, 1, 1, 1,
0.2029147, 0.9744108, 2.690892, 1, 1, 1, 1, 1,
0.2049305, 0.9901898, -0.5779415, 1, 1, 1, 1, 1,
0.2065795, 1.465308, -0.9693018, 1, 1, 1, 1, 1,
0.2135768, 0.8413939, -1.872826, 1, 1, 1, 1, 1,
0.2137491, 1.074931, -1.328017, 1, 1, 1, 1, 1,
0.2148262, 0.8640226, -0.516736, 1, 1, 1, 1, 1,
0.2148704, -1.244956, 4.493898, 1, 1, 1, 1, 1,
0.2149809, -1.592397, 3.057461, 0, 0, 1, 1, 1,
0.2164953, 0.3173603, -1.425453, 1, 0, 0, 1, 1,
0.2201252, 0.8095183, -0.04082749, 1, 0, 0, 1, 1,
0.225499, 1.101794, 0.4947491, 1, 0, 0, 1, 1,
0.2348307, 0.442611, 0.1308191, 1, 0, 0, 1, 1,
0.2396163, 1.008433, 0.125096, 1, 0, 0, 1, 1,
0.2405072, 0.9665195, -0.1838576, 0, 0, 0, 1, 1,
0.2442738, -0.7985891, 5.098467, 0, 0, 0, 1, 1,
0.2448611, 0.9779431, -0.4966878, 0, 0, 0, 1, 1,
0.2487955, -0.06900547, 0.5666612, 0, 0, 0, 1, 1,
0.2519494, 0.09075315, 1.350638, 0, 0, 0, 1, 1,
0.2520363, -0.8241196, 2.823386, 0, 0, 0, 1, 1,
0.2593336, -1.748007, 4.214483, 0, 0, 0, 1, 1,
0.263046, 0.6247767, 1.281068, 1, 1, 1, 1, 1,
0.2657283, -0.7984292, 2.27465, 1, 1, 1, 1, 1,
0.268712, -2.001527, 2.66946, 1, 1, 1, 1, 1,
0.2706841, 0.9061646, 0.8995415, 1, 1, 1, 1, 1,
0.2710808, 0.8212643, 1.86016, 1, 1, 1, 1, 1,
0.2773144, 0.06548775, 0.9171606, 1, 1, 1, 1, 1,
0.279531, -0.1627566, 1.365024, 1, 1, 1, 1, 1,
0.2807623, 2.007779, 1.14282, 1, 1, 1, 1, 1,
0.28717, -0.7867703, 1.70862, 1, 1, 1, 1, 1,
0.2887961, -0.4595507, 1.77336, 1, 1, 1, 1, 1,
0.2902092, 0.3020729, 1.765953, 1, 1, 1, 1, 1,
0.2936169, 0.6556439, 0.8630663, 1, 1, 1, 1, 1,
0.2946123, -0.1851937, 1.039616, 1, 1, 1, 1, 1,
0.297657, 1.15129, -0.9843999, 1, 1, 1, 1, 1,
0.304142, -1.492554, 3.075878, 1, 1, 1, 1, 1,
0.3088878, 2.330274, -0.1295627, 0, 0, 1, 1, 1,
0.3101006, 0.1641194, 0.1415889, 1, 0, 0, 1, 1,
0.3151966, 0.9257923, 0.6166534, 1, 0, 0, 1, 1,
0.3189094, -0.1055796, 2.023907, 1, 0, 0, 1, 1,
0.3201843, -0.3054686, 1.698138, 1, 0, 0, 1, 1,
0.320856, 1.355392, 0.08602282, 1, 0, 0, 1, 1,
0.3218057, 0.5844013, 3.417603, 0, 0, 0, 1, 1,
0.3237606, 0.9477575, -0.01302942, 0, 0, 0, 1, 1,
0.3249545, -0.8755359, 3.189691, 0, 0, 0, 1, 1,
0.3280033, 0.5283762, 1.06089, 0, 0, 0, 1, 1,
0.3280654, -0.8143517, 3.000796, 0, 0, 0, 1, 1,
0.3301308, -0.4613464, 2.640568, 0, 0, 0, 1, 1,
0.3335577, -0.1051662, 1.567835, 0, 0, 0, 1, 1,
0.3340698, 0.6199576, 0.280559, 1, 1, 1, 1, 1,
0.334868, 0.02432482, 1.411246, 1, 1, 1, 1, 1,
0.3357019, -0.4192913, 4.178186, 1, 1, 1, 1, 1,
0.3381416, -0.8163475, 3.000933, 1, 1, 1, 1, 1,
0.3422211, 0.3981069, -0.6363351, 1, 1, 1, 1, 1,
0.3445804, 0.3698784, 0.2178343, 1, 1, 1, 1, 1,
0.3481771, 1.702884, 1.663088, 1, 1, 1, 1, 1,
0.3490585, -0.3594125, 2.061, 1, 1, 1, 1, 1,
0.3531078, -1.552272, 1.759118, 1, 1, 1, 1, 1,
0.3537908, -0.4187526, 2.232707, 1, 1, 1, 1, 1,
0.3545271, -0.6890963, 2.225845, 1, 1, 1, 1, 1,
0.3560689, -1.700242, 4.392744, 1, 1, 1, 1, 1,
0.3567477, -0.9104757, 2.467116, 1, 1, 1, 1, 1,
0.358112, 0.2781585, 2.582155, 1, 1, 1, 1, 1,
0.3606765, -1.142913, 1.76881, 1, 1, 1, 1, 1,
0.3635133, -1.003099, 1.895362, 0, 0, 1, 1, 1,
0.3700965, -0.06303632, 0.1913531, 1, 0, 0, 1, 1,
0.3717946, -0.9439953, 4.295244, 1, 0, 0, 1, 1,
0.3791654, -1.867582, 3.56411, 1, 0, 0, 1, 1,
0.3820598, -0.2350657, 1.396582, 1, 0, 0, 1, 1,
0.3831219, 1.154228, 1.082298, 1, 0, 0, 1, 1,
0.383754, 0.3245454, 2.216228, 0, 0, 0, 1, 1,
0.3839357, 0.8137079, 1.079053, 0, 0, 0, 1, 1,
0.3851445, 2.90133, -0.04130261, 0, 0, 0, 1, 1,
0.3856514, -0.4464671, 1.616187, 0, 0, 0, 1, 1,
0.3869083, 0.3332673, 1.638778, 0, 0, 0, 1, 1,
0.3910508, -0.8424597, 2.072241, 0, 0, 0, 1, 1,
0.391103, -1.243261, 3.893404, 0, 0, 0, 1, 1,
0.3932767, -0.1370586, 2.792596, 1, 1, 1, 1, 1,
0.3960238, 0.3354985, 1.094296, 1, 1, 1, 1, 1,
0.4005934, -0.443765, 5.511976, 1, 1, 1, 1, 1,
0.4010046, -1.642683, 3.391363, 1, 1, 1, 1, 1,
0.4021092, 0.9928063, 2.996695, 1, 1, 1, 1, 1,
0.404646, -0.6281, 1.536149, 1, 1, 1, 1, 1,
0.4061224, -0.5723935, 2.417103, 1, 1, 1, 1, 1,
0.4082077, 1.038945, 1.12229, 1, 1, 1, 1, 1,
0.4097185, 2.193199, 0.1130845, 1, 1, 1, 1, 1,
0.4141378, -1.427323, 1.343253, 1, 1, 1, 1, 1,
0.4166161, 0.5518958, 1.730528, 1, 1, 1, 1, 1,
0.4195923, 0.06153601, 1.843868, 1, 1, 1, 1, 1,
0.4222316, 2.026604, -1.127364, 1, 1, 1, 1, 1,
0.4246403, 0.3940854, 0.3079456, 1, 1, 1, 1, 1,
0.4337999, 0.1039307, 4.656056, 1, 1, 1, 1, 1,
0.4344222, -1.50457, 4.418697, 0, 0, 1, 1, 1,
0.4356474, 0.4239757, 0.2226776, 1, 0, 0, 1, 1,
0.4388976, 0.5268116, -0.4889418, 1, 0, 0, 1, 1,
0.4520471, 1.257443, 0.1805908, 1, 0, 0, 1, 1,
0.4553766, -1.298612, 0.434113, 1, 0, 0, 1, 1,
0.4569572, 0.7443749, 1.047108, 1, 0, 0, 1, 1,
0.4573566, 0.8045624, 1.552314, 0, 0, 0, 1, 1,
0.4609615, -0.06614472, 1.32151, 0, 0, 0, 1, 1,
0.4617757, -0.7216243, 2.419412, 0, 0, 0, 1, 1,
0.4622094, -0.2890101, 3.416584, 0, 0, 0, 1, 1,
0.4705362, -1.793735, 2.571977, 0, 0, 0, 1, 1,
0.4853347, 1.247063, -0.5529507, 0, 0, 0, 1, 1,
0.4876927, 0.6906664, 0.1617324, 0, 0, 0, 1, 1,
0.4899349, -1.211253, 3.788769, 1, 1, 1, 1, 1,
0.4932885, 0.003935822, 1.469198, 1, 1, 1, 1, 1,
0.4980949, 0.2632928, 2.381051, 1, 1, 1, 1, 1,
0.5013099, 0.3396907, -1.33095, 1, 1, 1, 1, 1,
0.5028099, 0.07460999, 0.5105913, 1, 1, 1, 1, 1,
0.5088342, 0.06579923, 2.775637, 1, 1, 1, 1, 1,
0.5104865, 1.307175, -0.07766111, 1, 1, 1, 1, 1,
0.5137031, 0.4167062, 1.923473, 1, 1, 1, 1, 1,
0.5150813, 0.8483062, -0.1438158, 1, 1, 1, 1, 1,
0.5167745, -0.2621792, 1.153401, 1, 1, 1, 1, 1,
0.5198253, 0.01663357, 1.380857, 1, 1, 1, 1, 1,
0.5252767, 0.4586198, -0.1072677, 1, 1, 1, 1, 1,
0.5302348, -0.59702, 1.03498, 1, 1, 1, 1, 1,
0.5305173, -0.06833015, 2.072799, 1, 1, 1, 1, 1,
0.5313337, 0.3210477, 2.817022, 1, 1, 1, 1, 1,
0.5407851, -0.800015, 4.402944, 0, 0, 1, 1, 1,
0.5416094, 1.8009, 1.075283, 1, 0, 0, 1, 1,
0.5421147, 0.5194122, -0.6051707, 1, 0, 0, 1, 1,
0.5442084, 0.0141271, 2.862277, 1, 0, 0, 1, 1,
0.5503747, -0.2195532, 0.407333, 1, 0, 0, 1, 1,
0.5509633, 0.9950796, 0.3937832, 1, 0, 0, 1, 1,
0.5530072, 0.6360223, 0.8099319, 0, 0, 0, 1, 1,
0.5557384, 0.3633019, -0.5636052, 0, 0, 0, 1, 1,
0.5600616, 0.4862215, 0.4386052, 0, 0, 0, 1, 1,
0.5695059, 1.926428, 0.866878, 0, 0, 0, 1, 1,
0.5732198, -1.903376, 1.421166, 0, 0, 0, 1, 1,
0.5746142, 1.792057, 1.127954, 0, 0, 0, 1, 1,
0.5835166, 0.1972184, 0.7336857, 0, 0, 0, 1, 1,
0.588562, 0.1366492, 1.404717, 1, 1, 1, 1, 1,
0.5888084, -0.08929674, 2.179953, 1, 1, 1, 1, 1,
0.5893991, -0.704046, 0.04884287, 1, 1, 1, 1, 1,
0.592768, -1.026201, 1.657834, 1, 1, 1, 1, 1,
0.5974652, -0.4299411, 2.600262, 1, 1, 1, 1, 1,
0.6020709, 0.1964822, 0.494132, 1, 1, 1, 1, 1,
0.6027871, -1.044243, 2.662583, 1, 1, 1, 1, 1,
0.6051852, 0.6234686, 3.457962, 1, 1, 1, 1, 1,
0.6052668, 0.1646152, 0.464716, 1, 1, 1, 1, 1,
0.6057746, -1.228054, 1.703201, 1, 1, 1, 1, 1,
0.6066062, -0.4269314, 4.029275, 1, 1, 1, 1, 1,
0.6096632, -0.8520741, 1.626307, 1, 1, 1, 1, 1,
0.614006, 0.6427974, 1.023047, 1, 1, 1, 1, 1,
0.6246462, -0.8162389, 0.5926083, 1, 1, 1, 1, 1,
0.6265018, 1.824927, 0.403767, 1, 1, 1, 1, 1,
0.6265984, 0.2680745, 1.317887, 0, 0, 1, 1, 1,
0.6277404, -0.2223001, 2.394424, 1, 0, 0, 1, 1,
0.6295587, 0.1012432, 1.569206, 1, 0, 0, 1, 1,
0.6344765, -0.8088627, 1.273311, 1, 0, 0, 1, 1,
0.6389565, -0.5227924, 4.224075, 1, 0, 0, 1, 1,
0.6416725, -1.278612, 2.371767, 1, 0, 0, 1, 1,
0.6443093, 0.753673, 0.9956213, 0, 0, 0, 1, 1,
0.6490207, 0.6644071, 1.28374, 0, 0, 0, 1, 1,
0.6528525, -1.299808, 2.757425, 0, 0, 0, 1, 1,
0.6549418, -1.053234, 3.409757, 0, 0, 0, 1, 1,
0.6748105, -0.6677555, 2.985554, 0, 0, 0, 1, 1,
0.6767609, 1.029852, 1.565591, 0, 0, 0, 1, 1,
0.6845276, -0.03253437, 1.522208, 0, 0, 0, 1, 1,
0.690282, -0.2180036, 0.8788329, 1, 1, 1, 1, 1,
0.6902862, -0.772323, 2.465849, 1, 1, 1, 1, 1,
0.6981679, 0.1928416, 1.374745, 1, 1, 1, 1, 1,
0.6997215, -1.093107, 2.751291, 1, 1, 1, 1, 1,
0.7018087, 0.4456622, 1.656835, 1, 1, 1, 1, 1,
0.702918, -0.6516159, 3.606552, 1, 1, 1, 1, 1,
0.7089951, -0.3385257, 2.300321, 1, 1, 1, 1, 1,
0.7116528, 1.518835, 0.4696421, 1, 1, 1, 1, 1,
0.7145492, -1.218186, 1.742224, 1, 1, 1, 1, 1,
0.7192917, 0.08846526, 1.155336, 1, 1, 1, 1, 1,
0.7202725, 0.5596194, 0.767739, 1, 1, 1, 1, 1,
0.7250916, -0.9853496, 4.189503, 1, 1, 1, 1, 1,
0.7296872, -0.165012, 2.324165, 1, 1, 1, 1, 1,
0.7298845, 0.9478069, 1.644231, 1, 1, 1, 1, 1,
0.737073, 0.6195051, 0.6495431, 1, 1, 1, 1, 1,
0.7373233, -0.01062064, 0.8119064, 0, 0, 1, 1, 1,
0.7418663, -2.010636, 3.078789, 1, 0, 0, 1, 1,
0.7432337, 0.6875512, 0.3468763, 1, 0, 0, 1, 1,
0.7446238, 0.8525774, 2.330756, 1, 0, 0, 1, 1,
0.751087, -0.4542171, 3.007572, 1, 0, 0, 1, 1,
0.7526052, -0.3833492, 2.426433, 1, 0, 0, 1, 1,
0.7536782, -1.874292, 2.783802, 0, 0, 0, 1, 1,
0.7547945, 0.4922613, -0.6293058, 0, 0, 0, 1, 1,
0.7570817, 0.3717356, -0.0281689, 0, 0, 0, 1, 1,
0.7621648, -0.34921, 1.394657, 0, 0, 0, 1, 1,
0.7637225, -0.2599626, 1.671419, 0, 0, 0, 1, 1,
0.7638512, -0.6709858, 2.293321, 0, 0, 0, 1, 1,
0.7644567, -0.02200344, 2.462148, 0, 0, 0, 1, 1,
0.7669918, 0.1284599, 1.147646, 1, 1, 1, 1, 1,
0.7742824, -0.8535675, 2.12709, 1, 1, 1, 1, 1,
0.7826301, 0.5841579, -0.1111763, 1, 1, 1, 1, 1,
0.7843887, 0.6868867, 2.323902, 1, 1, 1, 1, 1,
0.7849511, -0.9125814, 0.8618826, 1, 1, 1, 1, 1,
0.7868221, 0.419779, 1.669028, 1, 1, 1, 1, 1,
0.7886273, 0.4255183, 0.4742445, 1, 1, 1, 1, 1,
0.7902713, -0.547617, 1.244833, 1, 1, 1, 1, 1,
0.7909688, -0.4387065, 1.375212, 1, 1, 1, 1, 1,
0.7913787, -0.7355489, 1.332862, 1, 1, 1, 1, 1,
0.7981427, -0.1332609, 3.796755, 1, 1, 1, 1, 1,
0.7993258, 0.2034135, 1.657533, 1, 1, 1, 1, 1,
0.8012604, 0.02962361, 3.897564, 1, 1, 1, 1, 1,
0.8020689, -0.5768457, 1.945496, 1, 1, 1, 1, 1,
0.8171183, -0.3323391, 0.766261, 1, 1, 1, 1, 1,
0.8200814, -0.4478868, 2.301423, 0, 0, 1, 1, 1,
0.8239893, 0.1199069, 2.568115, 1, 0, 0, 1, 1,
0.8272586, -1.763975, 2.355114, 1, 0, 0, 1, 1,
0.8289897, -0.9024749, -0.1552028, 1, 0, 0, 1, 1,
0.8290712, -1.933461, 3.293557, 1, 0, 0, 1, 1,
0.8326301, -0.8357125, 1.532441, 1, 0, 0, 1, 1,
0.8378859, -1.105686, 2.757393, 0, 0, 0, 1, 1,
0.8415837, -0.1253482, 0.628837, 0, 0, 0, 1, 1,
0.844337, 0.6619987, 0.6086845, 0, 0, 0, 1, 1,
0.846498, -1.904103, 1.397604, 0, 0, 0, 1, 1,
0.8506587, 0.06389535, 1.449735, 0, 0, 0, 1, 1,
0.8509951, 0.02932145, 2.36613, 0, 0, 0, 1, 1,
0.8530845, 0.841465, 0.5033362, 0, 0, 0, 1, 1,
0.8543106, -1.086172, 3.571544, 1, 1, 1, 1, 1,
0.8576866, 1.11399, 0.6654369, 1, 1, 1, 1, 1,
0.8641711, 0.04638661, 1.474001, 1, 1, 1, 1, 1,
0.8671488, -0.4955696, 2.445357, 1, 1, 1, 1, 1,
0.8710456, 0.7240053, 1.175925, 1, 1, 1, 1, 1,
0.8711104, 1.04182, 0.1962377, 1, 1, 1, 1, 1,
0.8731775, -1.111519, 4.83413, 1, 1, 1, 1, 1,
0.8753975, -0.2384508, 2.00296, 1, 1, 1, 1, 1,
0.8789338, 0.8433266, 1.035572, 1, 1, 1, 1, 1,
0.8792771, -0.2030766, 1.594843, 1, 1, 1, 1, 1,
0.8819615, -1.036843, 3.124943, 1, 1, 1, 1, 1,
0.8820037, -0.68335, 1.199368, 1, 1, 1, 1, 1,
0.8896539, 0.6907679, -0.07808534, 1, 1, 1, 1, 1,
0.8941549, 0.09324356, 0.929678, 1, 1, 1, 1, 1,
0.8948892, -0.53346, 0.7573686, 1, 1, 1, 1, 1,
0.8997595, -0.5168679, 1.679658, 0, 0, 1, 1, 1,
0.9094173, 0.911511, -0.5914401, 1, 0, 0, 1, 1,
0.9095085, -0.4419712, 1.520393, 1, 0, 0, 1, 1,
0.9100524, 0.7889199, 1.4419, 1, 0, 0, 1, 1,
0.9119487, -0.1233244, 3.380667, 1, 0, 0, 1, 1,
0.9146543, 1.056545, 1.595757, 1, 0, 0, 1, 1,
0.924319, -0.5024435, 1.095328, 0, 0, 0, 1, 1,
0.9321306, 0.4845643, -0.3664562, 0, 0, 0, 1, 1,
0.9349415, 0.05104518, 1.696187, 0, 0, 0, 1, 1,
0.9390694, -0.4221264, 3.364373, 0, 0, 0, 1, 1,
0.9438398, 1.724209, -1.700429, 0, 0, 0, 1, 1,
0.9454857, 0.6942225, 1.500983, 0, 0, 0, 1, 1,
0.953883, 0.3353662, 1.360642, 0, 0, 0, 1, 1,
0.9544238, -0.6327628, 2.44688, 1, 1, 1, 1, 1,
0.9565414, 1.963436, -1.943483, 1, 1, 1, 1, 1,
0.9574272, 0.1203082, 2.118084, 1, 1, 1, 1, 1,
0.9684194, -0.07456312, 0.8053412, 1, 1, 1, 1, 1,
0.9709855, 1.026689, -0.3763062, 1, 1, 1, 1, 1,
0.9828187, -0.5318829, 1.818979, 1, 1, 1, 1, 1,
0.9838302, -0.5398644, 1.745677, 1, 1, 1, 1, 1,
0.9874752, 0.179068, 2.118152, 1, 1, 1, 1, 1,
0.9882798, 0.3218324, 0.05192406, 1, 1, 1, 1, 1,
0.9940423, 0.1341182, 1.433324, 1, 1, 1, 1, 1,
0.9952125, -0.3411099, 1.58289, 1, 1, 1, 1, 1,
0.9958493, -0.0555713, 1.713842, 1, 1, 1, 1, 1,
0.996205, 0.01834036, 1.503272, 1, 1, 1, 1, 1,
0.9965344, -1.348378, 3.692531, 1, 1, 1, 1, 1,
1.00131, -1.115726, 1.517734, 1, 1, 1, 1, 1,
1.007517, 1.286372, -0.3057713, 0, 0, 1, 1, 1,
1.011499, -0.1625381, 1.188603, 1, 0, 0, 1, 1,
1.027523, -0.9211705, 0.8885952, 1, 0, 0, 1, 1,
1.030974, -1.192079, 3.91664, 1, 0, 0, 1, 1,
1.039628, -0.3219699, 1.283889, 1, 0, 0, 1, 1,
1.042014, 0.5614754, -0.275751, 1, 0, 0, 1, 1,
1.045627, 1.130376, 0.7839918, 0, 0, 0, 1, 1,
1.055006, -0.8637565, 3.748173, 0, 0, 0, 1, 1,
1.056434, -1.311879, 3.925585, 0, 0, 0, 1, 1,
1.061707, 0.7610543, 1.252635, 0, 0, 0, 1, 1,
1.066741, 1.896749, -0.9403315, 0, 0, 0, 1, 1,
1.070555, 0.0571854, 1.945575, 0, 0, 0, 1, 1,
1.070649, 0.6195804, 2.067797, 0, 0, 0, 1, 1,
1.074162, -0.9613608, 1.75709, 1, 1, 1, 1, 1,
1.075333, -1.407434, 2.023677, 1, 1, 1, 1, 1,
1.079276, -0.9148409, 3.814253, 1, 1, 1, 1, 1,
1.080661, 1.923707, 0.5744737, 1, 1, 1, 1, 1,
1.083439, 1.2781, 0.5805411, 1, 1, 1, 1, 1,
1.093294, 0.6356064, 1.512506, 1, 1, 1, 1, 1,
1.095148, 0.8470067, 1.222281, 1, 1, 1, 1, 1,
1.096385, 0.9736668, 1.155108, 1, 1, 1, 1, 1,
1.099305, -0.2000962, 1.112638, 1, 1, 1, 1, 1,
1.099847, -0.1423945, 1.284153, 1, 1, 1, 1, 1,
1.104997, -0.4095356, 3.601206, 1, 1, 1, 1, 1,
1.122004, 1.235623, 1.551417, 1, 1, 1, 1, 1,
1.124133, 0.757547, 0.4740629, 1, 1, 1, 1, 1,
1.125532, 1.041933, 0.1027124, 1, 1, 1, 1, 1,
1.13021, 1.388249, -0.6418856, 1, 1, 1, 1, 1,
1.133467, 0.4592923, 3.323482, 0, 0, 1, 1, 1,
1.135345, -0.1411354, 1.494514, 1, 0, 0, 1, 1,
1.136741, -1.150221, 2.896273, 1, 0, 0, 1, 1,
1.141906, -1.209711, 0.5986738, 1, 0, 0, 1, 1,
1.170464, -1.668838, 0.6960467, 1, 0, 0, 1, 1,
1.171007, -1.672238, 1.683165, 1, 0, 0, 1, 1,
1.174937, -0.6511345, 2.864888, 0, 0, 0, 1, 1,
1.185006, 0.9726337, 0.4082176, 0, 0, 0, 1, 1,
1.18572, 0.8112453, 1.582646, 0, 0, 0, 1, 1,
1.186319, -0.3598057, 2.702506, 0, 0, 0, 1, 1,
1.191375, 0.667748, 1.913228, 0, 0, 0, 1, 1,
1.19525, 0.1463695, 1.328047, 0, 0, 0, 1, 1,
1.199906, -0.8860521, 3.596434, 0, 0, 0, 1, 1,
1.200116, -0.6713411, 1.997039, 1, 1, 1, 1, 1,
1.201199, -0.05869326, 0.9312644, 1, 1, 1, 1, 1,
1.205643, 0.6929013, 0.589896, 1, 1, 1, 1, 1,
1.208166, -0.1119045, 1.815061, 1, 1, 1, 1, 1,
1.2085, -1.083384, 3.25178, 1, 1, 1, 1, 1,
1.211541, -1.927732, 0.8965641, 1, 1, 1, 1, 1,
1.213564, -1.089995, 3.749169, 1, 1, 1, 1, 1,
1.218832, -0.2032932, 1.640736, 1, 1, 1, 1, 1,
1.223467, -0.08340164, 2.098217, 1, 1, 1, 1, 1,
1.231538, 0.7684635, -0.1410096, 1, 1, 1, 1, 1,
1.242679, 0.08129872, 0.0657699, 1, 1, 1, 1, 1,
1.25066, -0.1953167, 1.150174, 1, 1, 1, 1, 1,
1.258565, 0.5276943, 2.166283, 1, 1, 1, 1, 1,
1.288663, -0.2024392, 1.143443, 1, 1, 1, 1, 1,
1.290506, 0.3328344, -0.7682851, 1, 1, 1, 1, 1,
1.294571, 0.8326564, 0.5347834, 0, 0, 1, 1, 1,
1.303818, -1.028818, 2.365418, 1, 0, 0, 1, 1,
1.304641, 0.1002957, 1.846335, 1, 0, 0, 1, 1,
1.308714, -0.5310842, 3.044906, 1, 0, 0, 1, 1,
1.315817, 0.4676245, 1.126687, 1, 0, 0, 1, 1,
1.333379, 0.4904138, 1.122128, 1, 0, 0, 1, 1,
1.336449, -0.8796534, 2.236797, 0, 0, 0, 1, 1,
1.355419, -0.3754772, 0.8020133, 0, 0, 0, 1, 1,
1.361841, -1.420779, 1.739138, 0, 0, 0, 1, 1,
1.370175, 0.7271295, -0.7550548, 0, 0, 0, 1, 1,
1.387593, 0.2945779, 2.035427, 0, 0, 0, 1, 1,
1.38836, -2.445402, 3.686171, 0, 0, 0, 1, 1,
1.390673, 0.005894728, 1.278542, 0, 0, 0, 1, 1,
1.392339, -0.601734, 2.871818, 1, 1, 1, 1, 1,
1.394073, -0.04946494, 1.689244, 1, 1, 1, 1, 1,
1.396224, -0.4337092, -0.07272016, 1, 1, 1, 1, 1,
1.396498, -0.5843424, 1.488325, 1, 1, 1, 1, 1,
1.411221, 0.7906056, 1.455805, 1, 1, 1, 1, 1,
1.41219, -0.5181952, 2.592804, 1, 1, 1, 1, 1,
1.4187, -0.03605371, 2.727375, 1, 1, 1, 1, 1,
1.433001, -0.09643279, 2.035359, 1, 1, 1, 1, 1,
1.43593, -0.2967343, 0.5164459, 1, 1, 1, 1, 1,
1.4368, 1.521043, 0.6009641, 1, 1, 1, 1, 1,
1.441349, -0.2433451, 2.540325, 1, 1, 1, 1, 1,
1.445413, 0.3769463, 1.96006, 1, 1, 1, 1, 1,
1.450682, -0.9040623, 2.123047, 1, 1, 1, 1, 1,
1.460455, 0.3966078, 1.465794, 1, 1, 1, 1, 1,
1.4778, -0.3201752, 1.720268, 1, 1, 1, 1, 1,
1.479899, -0.6137856, 2.923793, 0, 0, 1, 1, 1,
1.480471, 0.4458169, 0.4267825, 1, 0, 0, 1, 1,
1.486681, 0.2733274, 0.2086294, 1, 0, 0, 1, 1,
1.488259, -1.189602, 2.564314, 1, 0, 0, 1, 1,
1.489463, -1.185011, 2.549361, 1, 0, 0, 1, 1,
1.500329, -1.40033, 1.17853, 1, 0, 0, 1, 1,
1.507743, 0.929284, 2.096345, 0, 0, 0, 1, 1,
1.512437, -2.099287, 1.75631, 0, 0, 0, 1, 1,
1.512546, 1.147011, 2.891799, 0, 0, 0, 1, 1,
1.514169, 2.109334, 0.3141763, 0, 0, 0, 1, 1,
1.535292, 1.462507, 0.2124632, 0, 0, 0, 1, 1,
1.538301, -0.8789269, 0.09157055, 0, 0, 0, 1, 1,
1.552023, 0.5765333, 2.449985, 0, 0, 0, 1, 1,
1.552309, -0.8293509, 0.05163458, 1, 1, 1, 1, 1,
1.558712, -0.5742964, 2.985364, 1, 1, 1, 1, 1,
1.559603, 0.1714596, 3.353092, 1, 1, 1, 1, 1,
1.566792, 1.438596, 1.262314, 1, 1, 1, 1, 1,
1.568264, 0.03051004, 0.5972255, 1, 1, 1, 1, 1,
1.571764, 1.131226, -0.007365703, 1, 1, 1, 1, 1,
1.584764, 0.901683, 0.4264096, 1, 1, 1, 1, 1,
1.590353, -1.213774, 1.469792, 1, 1, 1, 1, 1,
1.605851, -0.6799232, 2.653444, 1, 1, 1, 1, 1,
1.631564, -1.048381, 1.721227, 1, 1, 1, 1, 1,
1.633991, -0.4890683, 1.840746, 1, 1, 1, 1, 1,
1.650262, 0.8448743, -2.63628, 1, 1, 1, 1, 1,
1.652255, -0.256441, 1.971279, 1, 1, 1, 1, 1,
1.666477, -0.2713947, 3.587803, 1, 1, 1, 1, 1,
1.668981, -0.1255425, 2.058579, 1, 1, 1, 1, 1,
1.697252, 0.001766214, 1.044855, 0, 0, 1, 1, 1,
1.731265, -1.194665, 2.184794, 1, 0, 0, 1, 1,
1.744045, 0.2317254, 1.373237, 1, 0, 0, 1, 1,
1.765379, 0.6329581, 2.092167, 1, 0, 0, 1, 1,
1.774333, 1.280866, -0.7707995, 1, 0, 0, 1, 1,
1.825981, 1.043776, 1.75254, 1, 0, 0, 1, 1,
1.835608, 0.887565, 0.8074931, 0, 0, 0, 1, 1,
1.876531, -0.6155477, 3.258081, 0, 0, 0, 1, 1,
1.880968, 0.4456188, 1.148984, 0, 0, 0, 1, 1,
1.920476, 0.1497159, 2.618726, 0, 0, 0, 1, 1,
1.935746, -1.617016, 2.663897, 0, 0, 0, 1, 1,
1.944188, -0.2737523, 2.436493, 0, 0, 0, 1, 1,
1.964341, -0.7680483, 0.9304407, 0, 0, 0, 1, 1,
1.971868, 0.8052958, 0.4140128, 1, 1, 1, 1, 1,
1.98297, -0.7537982, 0.7672902, 1, 1, 1, 1, 1,
1.995802, 0.4417452, 0.6096151, 1, 1, 1, 1, 1,
2.005043, -0.7634955, 1.493132, 1, 1, 1, 1, 1,
2.010047, -0.7158961, 1.131348, 1, 1, 1, 1, 1,
2.012331, 0.7230754, -0.08031214, 1, 1, 1, 1, 1,
2.017107, 0.00467367, 0.5061161, 1, 1, 1, 1, 1,
2.028876, 0.5699649, 2.811394, 1, 1, 1, 1, 1,
2.055901, 0.6297309, 0.767633, 1, 1, 1, 1, 1,
2.057643, -0.7727067, 1.888899, 1, 1, 1, 1, 1,
2.058463, 0.5720419, 0.6460024, 1, 1, 1, 1, 1,
2.058691, 1.062367, -0.06315368, 1, 1, 1, 1, 1,
2.080129, 0.5310854, 0.9764774, 1, 1, 1, 1, 1,
2.158086, -1.01121, 1.021828, 1, 1, 1, 1, 1,
2.167603, 0.289193, 0.5304495, 1, 1, 1, 1, 1,
2.17907, 0.5380448, 2.197755, 0, 0, 1, 1, 1,
2.190852, -1.083965, 1.738967, 1, 0, 0, 1, 1,
2.193669, -1.999552, 2.489366, 1, 0, 0, 1, 1,
2.222621, -0.7523942, 3.253887, 1, 0, 0, 1, 1,
2.24313, 1.259217, 1.869552, 1, 0, 0, 1, 1,
2.277634, -0.1902694, 3.012543, 1, 0, 0, 1, 1,
2.288125, 0.1296698, 2.464931, 0, 0, 0, 1, 1,
2.316723, 0.5997826, 1.196371, 0, 0, 0, 1, 1,
2.364065, -1.250331, 2.345057, 0, 0, 0, 1, 1,
2.397008, 1.094875, 1.608552, 0, 0, 0, 1, 1,
2.400948, -0.3848525, 1.837534, 0, 0, 0, 1, 1,
2.420819, -1.10658, 2.17717, 0, 0, 0, 1, 1,
2.428143, 1.619935, 0.9415214, 0, 0, 0, 1, 1,
2.441255, -1.535461, 1.288799, 1, 1, 1, 1, 1,
2.453802, 0.09575829, 2.403481, 1, 1, 1, 1, 1,
2.457461, -0.7154058, 0.2599291, 1, 1, 1, 1, 1,
2.471637, -1.842636, 1.031446, 1, 1, 1, 1, 1,
2.534529, 0.5313855, 2.515987, 1, 1, 1, 1, 1,
2.568179, -0.7473251, 1.021781, 1, 1, 1, 1, 1,
2.608755, -0.04940371, 1.681413, 1, 1, 1, 1, 1
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
var radius = 9.351138;
var distance = 32.84548;
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
mvMatrix.translate( 0.07390392, -0.1590215, -0.07618904 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.84548);
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
