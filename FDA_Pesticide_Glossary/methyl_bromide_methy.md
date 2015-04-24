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
-2.771511, 1.248441, 0.08070645, 1, 0, 0, 1,
-2.621144, -0.9014693, -1.486941, 1, 0.007843138, 0, 1,
-2.61404, -0.530301, -2.412333, 1, 0.01176471, 0, 1,
-2.611889, -0.3609537, -1.587597, 1, 0.01960784, 0, 1,
-2.49438, 0.8146262, -2.351326, 1, 0.02352941, 0, 1,
-2.42576, 1.451868, -0.7014651, 1, 0.03137255, 0, 1,
-2.362589, -0.8889237, -4.666896, 1, 0.03529412, 0, 1,
-2.348924, 1.533413, -1.323251, 1, 0.04313726, 0, 1,
-2.342421, -1.131301, -3.153935, 1, 0.04705882, 0, 1,
-2.34231, 1.586849, -0.7196434, 1, 0.05490196, 0, 1,
-2.335453, -0.6426331, -3.020849, 1, 0.05882353, 0, 1,
-2.270588, -0.7343926, -1.269223, 1, 0.06666667, 0, 1,
-2.232684, -0.7552317, -3.419121, 1, 0.07058824, 0, 1,
-2.225401, 0.9497106, -1.43347, 1, 0.07843138, 0, 1,
-2.145477, -1.463339, -3.082453, 1, 0.08235294, 0, 1,
-2.138459, 2.163914, 0.2253752, 1, 0.09019608, 0, 1,
-2.135702, -0.298025, -2.208293, 1, 0.09411765, 0, 1,
-2.134406, -0.8664006, -2.895449, 1, 0.1019608, 0, 1,
-2.134186, 0.4944616, -2.069637, 1, 0.1098039, 0, 1,
-2.108591, -0.303481, -2.593136, 1, 0.1137255, 0, 1,
-2.052117, -0.6084974, 0.05086402, 1, 0.1215686, 0, 1,
-2.017039, 0.3122264, -1.238514, 1, 0.1254902, 0, 1,
-2.000735, 1.912487, -0.8520497, 1, 0.1333333, 0, 1,
-1.998122, -1.696637, -3.175006, 1, 0.1372549, 0, 1,
-1.956452, -1.625246, -2.774036, 1, 0.145098, 0, 1,
-1.955504, 0.4336281, -1.065441, 1, 0.1490196, 0, 1,
-1.94479, 1.383181, -2.200702, 1, 0.1568628, 0, 1,
-1.931545, -0.09493558, -0.9017953, 1, 0.1607843, 0, 1,
-1.917375, 0.4441288, -2.519498, 1, 0.1686275, 0, 1,
-1.904466, 0.485517, -0.9191853, 1, 0.172549, 0, 1,
-1.903491, 1.735097, 0.1772068, 1, 0.1803922, 0, 1,
-1.861467, 0.7915019, -1.253626, 1, 0.1843137, 0, 1,
-1.857887, 2.142767, -1.247972, 1, 0.1921569, 0, 1,
-1.83418, -0.3476326, -1.590962, 1, 0.1960784, 0, 1,
-1.824664, 1.455619, -0.7618356, 1, 0.2039216, 0, 1,
-1.803742, -1.085459, -1.938305, 1, 0.2117647, 0, 1,
-1.796267, 1.226971, -1.901423, 1, 0.2156863, 0, 1,
-1.789371, -0.05169519, -1.578962, 1, 0.2235294, 0, 1,
-1.778037, -0.4109143, -2.118719, 1, 0.227451, 0, 1,
-1.768207, 0.2356025, -1.518907, 1, 0.2352941, 0, 1,
-1.759369, 2.084081, -0.1869231, 1, 0.2392157, 0, 1,
-1.752043, 0.6765749, -2.390265, 1, 0.2470588, 0, 1,
-1.747454, 0.5779747, -2.711391, 1, 0.2509804, 0, 1,
-1.745057, -0.1650616, -2.061726, 1, 0.2588235, 0, 1,
-1.74491, -0.6716489, -2.407234, 1, 0.2627451, 0, 1,
-1.732237, 0.4562529, -1.662797, 1, 0.2705882, 0, 1,
-1.72806, 0.9803193, -1.440256, 1, 0.2745098, 0, 1,
-1.724326, -0.2807239, 0.3967316, 1, 0.282353, 0, 1,
-1.72365, -2.537947, -2.748257, 1, 0.2862745, 0, 1,
-1.722049, 0.1849327, -1.720202, 1, 0.2941177, 0, 1,
-1.716597, 0.6313614, -0.6088737, 1, 0.3019608, 0, 1,
-1.702975, -2.145609, -2.650484, 1, 0.3058824, 0, 1,
-1.693088, -1.549199, -1.541426, 1, 0.3137255, 0, 1,
-1.679088, 1.837394, -2.133093, 1, 0.3176471, 0, 1,
-1.672444, -0.9074686, -2.452888, 1, 0.3254902, 0, 1,
-1.668669, -0.01870768, -1.131562, 1, 0.3294118, 0, 1,
-1.663621, 0.3330652, -0.9330527, 1, 0.3372549, 0, 1,
-1.66361, -1.257138, -4.361256, 1, 0.3411765, 0, 1,
-1.64509, -0.4224587, -0.7806533, 1, 0.3490196, 0, 1,
-1.639823, 0.9483592, -0.9722234, 1, 0.3529412, 0, 1,
-1.630223, 0.4085405, -1.937086, 1, 0.3607843, 0, 1,
-1.621661, 0.321038, -1.161554, 1, 0.3647059, 0, 1,
-1.61807, 1.736073, 0.006370986, 1, 0.372549, 0, 1,
-1.614863, 2.373088, -1.654041, 1, 0.3764706, 0, 1,
-1.612997, 2.008847, 0.7668329, 1, 0.3843137, 0, 1,
-1.612646, 0.7313256, 0.007774303, 1, 0.3882353, 0, 1,
-1.608013, 0.838764, -2.567898, 1, 0.3960784, 0, 1,
-1.603298, -1.975115, -1.598745, 1, 0.4039216, 0, 1,
-1.599096, -0.9058439, -3.645548, 1, 0.4078431, 0, 1,
-1.590715, -0.1551175, -1.243271, 1, 0.4156863, 0, 1,
-1.586107, -0.1334299, 0.9625914, 1, 0.4196078, 0, 1,
-1.577609, 1.35157, 0.1673796, 1, 0.427451, 0, 1,
-1.5773, -2.173424, -2.01185, 1, 0.4313726, 0, 1,
-1.577133, 0.6608112, -0.2997115, 1, 0.4392157, 0, 1,
-1.573912, 0.8791727, -1.635999, 1, 0.4431373, 0, 1,
-1.568337, 1.967587, 0.1274892, 1, 0.4509804, 0, 1,
-1.5548, 0.9240717, -0.8834809, 1, 0.454902, 0, 1,
-1.554744, 0.5863035, 0.3829156, 1, 0.4627451, 0, 1,
-1.552191, 0.8283069, -1.18829, 1, 0.4666667, 0, 1,
-1.540994, 0.6613005, -1.66791, 1, 0.4745098, 0, 1,
-1.540137, -1.524114, -1.980808, 1, 0.4784314, 0, 1,
-1.539693, -0.7057469, -2.47858, 1, 0.4862745, 0, 1,
-1.521583, 1.345015, 0.8384381, 1, 0.4901961, 0, 1,
-1.518614, 0.8689792, -1.397979, 1, 0.4980392, 0, 1,
-1.497419, -0.3755505, -1.51532, 1, 0.5058824, 0, 1,
-1.491963, 0.3526621, -0.5172941, 1, 0.509804, 0, 1,
-1.488825, -0.0944525, -1.486927, 1, 0.5176471, 0, 1,
-1.486882, -0.6243524, -3.001633, 1, 0.5215687, 0, 1,
-1.482506, 0.005937138, -1.005399, 1, 0.5294118, 0, 1,
-1.479141, -0.5843202, -0.9308128, 1, 0.5333334, 0, 1,
-1.472851, 1.884812, 1.073757, 1, 0.5411765, 0, 1,
-1.468649, -0.4309697, -1.102093, 1, 0.5450981, 0, 1,
-1.462137, -0.6489471, -1.060589, 1, 0.5529412, 0, 1,
-1.453242, 0.9225986, -0.8404218, 1, 0.5568628, 0, 1,
-1.44986, 0.339334, -1.420314, 1, 0.5647059, 0, 1,
-1.445222, -0.8278313, -1.600897, 1, 0.5686275, 0, 1,
-1.438347, 0.1669839, -1.814057, 1, 0.5764706, 0, 1,
-1.433193, 1.383512, -1.959696, 1, 0.5803922, 0, 1,
-1.43182, -1.372253, -0.7914249, 1, 0.5882353, 0, 1,
-1.419544, -0.6949621, -2.628921, 1, 0.5921569, 0, 1,
-1.415455, -0.797561, -2.647381, 1, 0.6, 0, 1,
-1.397213, 0.101453, -1.690488, 1, 0.6078432, 0, 1,
-1.383691, 1.279453, -1.959496, 1, 0.6117647, 0, 1,
-1.376201, 0.8817455, -0.09017792, 1, 0.6196079, 0, 1,
-1.368082, -0.1103637, -0.841341, 1, 0.6235294, 0, 1,
-1.365561, 0.1077815, -0.7655823, 1, 0.6313726, 0, 1,
-1.358952, -1.253362, -1.68522, 1, 0.6352941, 0, 1,
-1.354444, 2.044034, -0.6385058, 1, 0.6431373, 0, 1,
-1.317365, -3.306779, -3.150113, 1, 0.6470588, 0, 1,
-1.313552, -0.1724038, -1.55822, 1, 0.654902, 0, 1,
-1.305556, -0.7576033, -4.444187, 1, 0.6588235, 0, 1,
-1.302124, 0.18822, -2.613472, 1, 0.6666667, 0, 1,
-1.30106, -0.3759806, -1.129858, 1, 0.6705883, 0, 1,
-1.296246, -0.9596245, -2.71284, 1, 0.6784314, 0, 1,
-1.291114, -0.1114576, -1.139945, 1, 0.682353, 0, 1,
-1.276122, 1.93131, -2.546676, 1, 0.6901961, 0, 1,
-1.272233, -0.7372597, -2.287534, 1, 0.6941177, 0, 1,
-1.271616, 0.7791926, 0.1696806, 1, 0.7019608, 0, 1,
-1.268191, 0.8987127, -1.142416, 1, 0.7098039, 0, 1,
-1.260945, 0.1984092, -1.889073, 1, 0.7137255, 0, 1,
-1.259864, -0.01394599, -1.895892, 1, 0.7215686, 0, 1,
-1.259209, -0.3352226, -1.146131, 1, 0.7254902, 0, 1,
-1.255918, -0.619965, -2.512016, 1, 0.7333333, 0, 1,
-1.249147, -0.2452577, -0.7608013, 1, 0.7372549, 0, 1,
-1.241668, -0.6853318, -2.087615, 1, 0.7450981, 0, 1,
-1.241324, -0.2292586, -3.50052, 1, 0.7490196, 0, 1,
-1.230812, 0.1011449, 0.5780756, 1, 0.7568628, 0, 1,
-1.228559, -0.1566339, -3.422265, 1, 0.7607843, 0, 1,
-1.220612, -0.06792609, -2.26914, 1, 0.7686275, 0, 1,
-1.155697, -1.364978, -3.530166, 1, 0.772549, 0, 1,
-1.153376, 0.4807028, -2.13361, 1, 0.7803922, 0, 1,
-1.13972, -0.3384283, -1.309979, 1, 0.7843137, 0, 1,
-1.139472, -0.6453912, -2.364753, 1, 0.7921569, 0, 1,
-1.137915, -0.8955355, -1.865823, 1, 0.7960784, 0, 1,
-1.137329, 0.6058462, -0.4561042, 1, 0.8039216, 0, 1,
-1.135984, -1.63262, -3.985815, 1, 0.8117647, 0, 1,
-1.134939, 0.9950299, -0.6804315, 1, 0.8156863, 0, 1,
-1.125, -0.298631, -2.99192, 1, 0.8235294, 0, 1,
-1.12318, 1.320021, -0.8033931, 1, 0.827451, 0, 1,
-1.120608, 1.154862, -1.307659, 1, 0.8352941, 0, 1,
-1.118594, 1.394196, 0.3560355, 1, 0.8392157, 0, 1,
-1.111425, 0.742677, -0.08698048, 1, 0.8470588, 0, 1,
-1.104105, 0.1020767, 0.6834482, 1, 0.8509804, 0, 1,
-1.096462, -0.4939852, -0.842014, 1, 0.8588235, 0, 1,
-1.096035, 0.6979082, -1.462079, 1, 0.8627451, 0, 1,
-1.088165, -0.9666417, -2.472448, 1, 0.8705882, 0, 1,
-1.087411, 2.547563, -1.605811, 1, 0.8745098, 0, 1,
-1.084789, 1.251649, -2.146115, 1, 0.8823529, 0, 1,
-1.068944, -1.27105, -2.850185, 1, 0.8862745, 0, 1,
-1.063548, 2.323891, 0.08963514, 1, 0.8941177, 0, 1,
-1.057967, -0.3389427, -2.588963, 1, 0.8980392, 0, 1,
-1.057087, 0.5840984, -0.3030739, 1, 0.9058824, 0, 1,
-1.051487, -2.182621, -2.285273, 1, 0.9137255, 0, 1,
-1.045015, -1.189182, -3.266902, 1, 0.9176471, 0, 1,
-1.040887, -0.6786907, -2.187969, 1, 0.9254902, 0, 1,
-1.037806, 1.195822, 0.9534707, 1, 0.9294118, 0, 1,
-1.03468, -0.2665089, -2.222486, 1, 0.9372549, 0, 1,
-1.034472, -0.2520618, -1.470162, 1, 0.9411765, 0, 1,
-1.03066, -2.224034, -3.790998, 1, 0.9490196, 0, 1,
-1.014759, 0.068662, -1.661977, 1, 0.9529412, 0, 1,
-1.007074, 1.236433, -2.006181, 1, 0.9607843, 0, 1,
-1.003579, -0.3456243, -1.479598, 1, 0.9647059, 0, 1,
-1.002565, 0.6799091, -1.979965, 1, 0.972549, 0, 1,
-0.9925256, 0.08069145, -3.032395, 1, 0.9764706, 0, 1,
-0.9915467, -0.6182378, -2.716972, 1, 0.9843137, 0, 1,
-0.9848021, 1.103748, -0.09991238, 1, 0.9882353, 0, 1,
-0.9845554, 0.6616477, -0.9977719, 1, 0.9960784, 0, 1,
-0.9756103, -0.2263721, -0.4720535, 0.9960784, 1, 0, 1,
-0.9726643, -0.1985704, -2.72554, 0.9921569, 1, 0, 1,
-0.9629902, 0.9707012, 0.2487692, 0.9843137, 1, 0, 1,
-0.9615291, -0.8420888, -2.727284, 0.9803922, 1, 0, 1,
-0.9516389, 0.2334757, -1.483649, 0.972549, 1, 0, 1,
-0.9486893, 2.457545, 0.5319721, 0.9686275, 1, 0, 1,
-0.9472197, -0.9385697, -2.676973, 0.9607843, 1, 0, 1,
-0.9450382, 0.5942778, -1.553226, 0.9568627, 1, 0, 1,
-0.9434994, 1.356924, -0.64472, 0.9490196, 1, 0, 1,
-0.9377931, -0.2022192, -2.249839, 0.945098, 1, 0, 1,
-0.9354044, 3.156166, -0.5622764, 0.9372549, 1, 0, 1,
-0.9346727, -1.256084, -1.272788, 0.9333333, 1, 0, 1,
-0.9333953, 0.9307757, 0.07321704, 0.9254902, 1, 0, 1,
-0.9331812, 1.250775, 0.3858279, 0.9215686, 1, 0, 1,
-0.9176041, 2.138071, -0.8836547, 0.9137255, 1, 0, 1,
-0.9169323, -0.425389, -2.814043, 0.9098039, 1, 0, 1,
-0.9040036, -2.187546, -1.563457, 0.9019608, 1, 0, 1,
-0.8854731, 0.3877755, -1.212033, 0.8941177, 1, 0, 1,
-0.8806607, 1.549258, -0.6985067, 0.8901961, 1, 0, 1,
-0.8800741, -0.0646304, -4.062114, 0.8823529, 1, 0, 1,
-0.8795833, -0.5648142, -0.9899444, 0.8784314, 1, 0, 1,
-0.8755611, -0.1691241, -1.54243, 0.8705882, 1, 0, 1,
-0.8746832, -1.189224, -4.565876, 0.8666667, 1, 0, 1,
-0.8741646, -1.381075, -3.032939, 0.8588235, 1, 0, 1,
-0.8738002, -0.09144622, -0.583371, 0.854902, 1, 0, 1,
-0.8712441, -0.8884689, -1.083319, 0.8470588, 1, 0, 1,
-0.8693945, -0.2343698, -3.435578, 0.8431373, 1, 0, 1,
-0.8689277, 2.746917, 0.9386723, 0.8352941, 1, 0, 1,
-0.8656453, -0.8311251, -1.134373, 0.8313726, 1, 0, 1,
-0.8611568, 0.5909135, -2.109474, 0.8235294, 1, 0, 1,
-0.8550531, 1.749495, -2.264102, 0.8196079, 1, 0, 1,
-0.8545839, -0.470276, -1.58366, 0.8117647, 1, 0, 1,
-0.8527327, 0.1995123, -0.9796302, 0.8078431, 1, 0, 1,
-0.8525738, 1.114936, -0.4962043, 0.8, 1, 0, 1,
-0.8512692, 1.624081, 0.7968974, 0.7921569, 1, 0, 1,
-0.8486804, 0.5792965, -0.1379321, 0.7882353, 1, 0, 1,
-0.8449966, 0.06516998, -2.689439, 0.7803922, 1, 0, 1,
-0.843577, -2.623408, -1.210374, 0.7764706, 1, 0, 1,
-0.8422421, -0.1157203, -1.097557, 0.7686275, 1, 0, 1,
-0.839691, 0.6334917, -0.6300788, 0.7647059, 1, 0, 1,
-0.8395029, -0.4853974, -0.2406346, 0.7568628, 1, 0, 1,
-0.8383768, 0.4575221, -1.824836, 0.7529412, 1, 0, 1,
-0.8326266, -0.07750058, -2.282748, 0.7450981, 1, 0, 1,
-0.8299113, -0.2989661, -1.859135, 0.7411765, 1, 0, 1,
-0.8262606, 2.373844, -0.8112331, 0.7333333, 1, 0, 1,
-0.8249205, 0.3691553, -1.169195, 0.7294118, 1, 0, 1,
-0.8237456, 1.283125, -0.9263337, 0.7215686, 1, 0, 1,
-0.8223622, 0.8535085, -0.7564555, 0.7176471, 1, 0, 1,
-0.8147746, 0.5217195, -1.43656, 0.7098039, 1, 0, 1,
-0.8099372, -1.38013, -2.64148, 0.7058824, 1, 0, 1,
-0.8037786, -2.189724, -3.075119, 0.6980392, 1, 0, 1,
-0.7981218, 0.3720345, -1.437405, 0.6901961, 1, 0, 1,
-0.7955394, 0.5667161, -1.495435, 0.6862745, 1, 0, 1,
-0.7943302, -0.2627011, -1.453032, 0.6784314, 1, 0, 1,
-0.7921197, -0.663245, -2.359421, 0.6745098, 1, 0, 1,
-0.7912772, -0.1850963, -3.016613, 0.6666667, 1, 0, 1,
-0.7814834, 1.591463, -0.4562389, 0.6627451, 1, 0, 1,
-0.7808462, 0.5278679, -2.776717, 0.654902, 1, 0, 1,
-0.7794185, 0.06975238, 0.187067, 0.6509804, 1, 0, 1,
-0.7775124, -0.9355303, -2.213548, 0.6431373, 1, 0, 1,
-0.7758991, 0.555244, 0.6385154, 0.6392157, 1, 0, 1,
-0.7753966, -0.05959479, -1.409007, 0.6313726, 1, 0, 1,
-0.7747249, 0.6411792, 0.5003651, 0.627451, 1, 0, 1,
-0.7741481, -0.01085117, -1.21041, 0.6196079, 1, 0, 1,
-0.7734204, -0.9578261, -2.455571, 0.6156863, 1, 0, 1,
-0.7731879, 1.597675, -0.0811591, 0.6078432, 1, 0, 1,
-0.7707328, 0.511971, -2.505129, 0.6039216, 1, 0, 1,
-0.768971, 1.133893, -1.560426, 0.5960785, 1, 0, 1,
-0.7633502, 1.130195, -1.805585, 0.5882353, 1, 0, 1,
-0.7589116, -0.5157445, -3.310477, 0.5843138, 1, 0, 1,
-0.7588488, 1.03503, 0.2509435, 0.5764706, 1, 0, 1,
-0.7555292, -0.01081489, 0.04889336, 0.572549, 1, 0, 1,
-0.750913, 0.1947635, -2.565531, 0.5647059, 1, 0, 1,
-0.7457284, -0.4191085, -2.510177, 0.5607843, 1, 0, 1,
-0.744565, -1.276679, -1.672708, 0.5529412, 1, 0, 1,
-0.743452, 1.105703, -1.456006, 0.5490196, 1, 0, 1,
-0.7366257, -1.427328, -2.623076, 0.5411765, 1, 0, 1,
-0.7296305, 1.670483, -1.369993, 0.5372549, 1, 0, 1,
-0.7285594, 0.3385679, -2.818194, 0.5294118, 1, 0, 1,
-0.7261341, 0.468865, 0.2512986, 0.5254902, 1, 0, 1,
-0.7253708, -0.1839384, -1.914233, 0.5176471, 1, 0, 1,
-0.7241078, 0.06657228, -0.7386757, 0.5137255, 1, 0, 1,
-0.7202878, -1.118708, -2.159093, 0.5058824, 1, 0, 1,
-0.7168448, -0.3920621, -2.702751, 0.5019608, 1, 0, 1,
-0.7162933, -1.068238, -3.398169, 0.4941176, 1, 0, 1,
-0.713985, 1.704658, -0.1998208, 0.4862745, 1, 0, 1,
-0.7110019, -0.1471107, -2.000549, 0.4823529, 1, 0, 1,
-0.7069232, 1.036995, -1.629024, 0.4745098, 1, 0, 1,
-0.7051432, -0.2019106, -1.014633, 0.4705882, 1, 0, 1,
-0.7013357, 0.7777662, -1.150469, 0.4627451, 1, 0, 1,
-0.7011777, -0.1465638, -2.628914, 0.4588235, 1, 0, 1,
-0.6998249, -0.5573083, -2.093592, 0.4509804, 1, 0, 1,
-0.6966689, -0.9625933, -3.974073, 0.4470588, 1, 0, 1,
-0.6950991, -0.2279983, -2.584633, 0.4392157, 1, 0, 1,
-0.6924752, -0.6022087, -2.585799, 0.4352941, 1, 0, 1,
-0.6870477, -0.7794225, -3.686846, 0.427451, 1, 0, 1,
-0.6830017, 0.1448626, -1.497049, 0.4235294, 1, 0, 1,
-0.6797314, -1.011058, -1.915523, 0.4156863, 1, 0, 1,
-0.6796221, 1.159668, -0.07150251, 0.4117647, 1, 0, 1,
-0.6729139, 0.8914659, -0.8576066, 0.4039216, 1, 0, 1,
-0.6723846, -1.345478, -1.757773, 0.3960784, 1, 0, 1,
-0.6715646, -0.3709813, -2.610573, 0.3921569, 1, 0, 1,
-0.6695836, -0.6543803, -2.791698, 0.3843137, 1, 0, 1,
-0.6634709, 0.8994623, 0.85677, 0.3803922, 1, 0, 1,
-0.6622561, -1.797806, -3.881748, 0.372549, 1, 0, 1,
-0.6597519, 1.68168, -1.334075, 0.3686275, 1, 0, 1,
-0.6511717, 0.3403494, -1.409504, 0.3607843, 1, 0, 1,
-0.6438507, -0.2653708, -1.735661, 0.3568628, 1, 0, 1,
-0.6423926, 0.9551973, -0.5388491, 0.3490196, 1, 0, 1,
-0.6384773, -0.155475, -2.853747, 0.345098, 1, 0, 1,
-0.6361722, -1.038073, -1.449939, 0.3372549, 1, 0, 1,
-0.6278377, -0.3642041, -1.024453, 0.3333333, 1, 0, 1,
-0.6276488, 0.9645011, 1.475057, 0.3254902, 1, 0, 1,
-0.6207835, -0.9410359, -4.405402, 0.3215686, 1, 0, 1,
-0.6196914, -0.1902676, -0.7130913, 0.3137255, 1, 0, 1,
-0.6195077, -0.8710298, -4.63591, 0.3098039, 1, 0, 1,
-0.618565, 0.09217314, -0.6993688, 0.3019608, 1, 0, 1,
-0.6184688, -0.1525261, -2.169038, 0.2941177, 1, 0, 1,
-0.6166238, -0.4427497, -3.2707, 0.2901961, 1, 0, 1,
-0.6155488, -1.069828, -2.989308, 0.282353, 1, 0, 1,
-0.6068563, 0.4066491, -1.324097, 0.2784314, 1, 0, 1,
-0.6047839, 0.4285732, -0.08557932, 0.2705882, 1, 0, 1,
-0.5956782, -0.9922838, -4.515796, 0.2666667, 1, 0, 1,
-0.5929717, -1.495179, -1.120029, 0.2588235, 1, 0, 1,
-0.5880145, 3.10896, -0.9000617, 0.254902, 1, 0, 1,
-0.5879809, -0.1400344, -2.548167, 0.2470588, 1, 0, 1,
-0.5841275, -0.6520663, -2.213457, 0.2431373, 1, 0, 1,
-0.5835773, -0.6530532, -1.48147, 0.2352941, 1, 0, 1,
-0.5811808, 0.5608567, -0.3448042, 0.2313726, 1, 0, 1,
-0.57804, -0.2123612, -0.5569251, 0.2235294, 1, 0, 1,
-0.5764583, 1.146356, -0.8777477, 0.2196078, 1, 0, 1,
-0.5744263, -0.8482093, -3.627765, 0.2117647, 1, 0, 1,
-0.5708998, -0.4803152, -2.480419, 0.2078431, 1, 0, 1,
-0.5702226, -1.314874, -3.188449, 0.2, 1, 0, 1,
-0.5700268, 0.6820954, -1.19179, 0.1921569, 1, 0, 1,
-0.568305, -2.427447, -1.710765, 0.1882353, 1, 0, 1,
-0.5620838, 0.1715392, -2.485859, 0.1803922, 1, 0, 1,
-0.5577816, -0.7601208, -3.212793, 0.1764706, 1, 0, 1,
-0.5544679, 1.728243, -0.2154936, 0.1686275, 1, 0, 1,
-0.5510656, -0.7588759, -1.861022, 0.1647059, 1, 0, 1,
-0.5484311, -0.9587885, -1.845512, 0.1568628, 1, 0, 1,
-0.5451567, 0.4403167, -1.566826, 0.1529412, 1, 0, 1,
-0.5438092, 0.1286123, -2.89732, 0.145098, 1, 0, 1,
-0.5400415, -0.5639641, -1.860409, 0.1411765, 1, 0, 1,
-0.5379152, -1.998302, -2.410907, 0.1333333, 1, 0, 1,
-0.5287783, 0.3901288, 0.7647303, 0.1294118, 1, 0, 1,
-0.5219854, 0.9971455, -2.49336, 0.1215686, 1, 0, 1,
-0.5168729, -1.86324, -0.79835, 0.1176471, 1, 0, 1,
-0.5144216, -0.2296154, -1.284939, 0.1098039, 1, 0, 1,
-0.5140616, -0.7559009, -3.319909, 0.1058824, 1, 0, 1,
-0.509489, 0.6201032, -0.5003679, 0.09803922, 1, 0, 1,
-0.5090405, 2.18436, -1.545605, 0.09019608, 1, 0, 1,
-0.5083391, -1.17904, -2.184569, 0.08627451, 1, 0, 1,
-0.4957665, -1.517806, -3.047438, 0.07843138, 1, 0, 1,
-0.4947441, 2.326925, -1.770591, 0.07450981, 1, 0, 1,
-0.4938909, -0.1618621, -1.282853, 0.06666667, 1, 0, 1,
-0.4929214, 1.07806, 1.522727, 0.0627451, 1, 0, 1,
-0.4892527, -0.07239182, -3.760201, 0.05490196, 1, 0, 1,
-0.4879704, -0.8603978, -3.352969, 0.05098039, 1, 0, 1,
-0.4877172, 0.07582267, -1.767963, 0.04313726, 1, 0, 1,
-0.4819546, -1.640534, -3.827058, 0.03921569, 1, 0, 1,
-0.4814304, -0.3193573, -2.674209, 0.03137255, 1, 0, 1,
-0.4803362, -0.1954985, -2.417114, 0.02745098, 1, 0, 1,
-0.4797055, 0.2454507, 0.4227736, 0.01960784, 1, 0, 1,
-0.47787, -0.1012994, -4.278014, 0.01568628, 1, 0, 1,
-0.4753543, -0.4442398, -2.36656, 0.007843138, 1, 0, 1,
-0.4731515, -0.5018814, -0.6520774, 0.003921569, 1, 0, 1,
-0.4729379, 1.044716, 0.08745752, 0, 1, 0.003921569, 1,
-0.4671524, 1.218777, 0.9377309, 0, 1, 0.01176471, 1,
-0.4624873, 2.574488, -1.565081, 0, 1, 0.01568628, 1,
-0.459986, -0.8523856, -2.550804, 0, 1, 0.02352941, 1,
-0.4568915, -0.01950239, -1.501706, 0, 1, 0.02745098, 1,
-0.4565756, -0.368146, -2.986252, 0, 1, 0.03529412, 1,
-0.4553065, 0.2784597, -1.139457, 0, 1, 0.03921569, 1,
-0.4535074, -1.092382, -2.321908, 0, 1, 0.04705882, 1,
-0.450271, -0.4866037, -1.77078, 0, 1, 0.05098039, 1,
-0.4433567, 0.7047789, 0.1153032, 0, 1, 0.05882353, 1,
-0.4431753, -1.337839, -2.894063, 0, 1, 0.0627451, 1,
-0.4404767, -0.9807691, -2.252909, 0, 1, 0.07058824, 1,
-0.4376955, 0.5861973, -0.4312747, 0, 1, 0.07450981, 1,
-0.4352621, -1.258421, -2.125601, 0, 1, 0.08235294, 1,
-0.4339756, -3.091066, -3.545921, 0, 1, 0.08627451, 1,
-0.432147, 1.07559, -0.08940917, 0, 1, 0.09411765, 1,
-0.4316396, -0.4467413, -2.181386, 0, 1, 0.1019608, 1,
-0.4285329, 1.00773, -0.257515, 0, 1, 0.1058824, 1,
-0.4214195, -0.7921855, -0.5791652, 0, 1, 0.1137255, 1,
-0.4182674, 0.5404373, -0.7137296, 0, 1, 0.1176471, 1,
-0.4170673, -0.2450505, -1.45618, 0, 1, 0.1254902, 1,
-0.4160023, 1.301529, -1.724374, 0, 1, 0.1294118, 1,
-0.4128703, 1.260424, -1.754562, 0, 1, 0.1372549, 1,
-0.4104409, 0.8021898, 0.7057265, 0, 1, 0.1411765, 1,
-0.4081798, 2.294432, -1.460067, 0, 1, 0.1490196, 1,
-0.4078845, -0.2594234, -1.66499, 0, 1, 0.1529412, 1,
-0.4038659, 1.034499, -0.2886561, 0, 1, 0.1607843, 1,
-0.402581, -1.982055, -2.618348, 0, 1, 0.1647059, 1,
-0.4025539, -0.2082677, -2.764709, 0, 1, 0.172549, 1,
-0.402015, 1.994763, -2.162584, 0, 1, 0.1764706, 1,
-0.4004261, -2.205831, -2.746715, 0, 1, 0.1843137, 1,
-0.397202, 0.166018, -0.4185787, 0, 1, 0.1882353, 1,
-0.3946798, -0.1581899, -1.626311, 0, 1, 0.1960784, 1,
-0.394299, 0.1431596, -0.2945572, 0, 1, 0.2039216, 1,
-0.3902643, 2.303906, -1.08031, 0, 1, 0.2078431, 1,
-0.3781961, 1.4775, 1.134752, 0, 1, 0.2156863, 1,
-0.3776985, -0.3408382, -2.197471, 0, 1, 0.2196078, 1,
-0.3762917, 0.6155534, -1.03318, 0, 1, 0.227451, 1,
-0.3747369, 0.7574736, -0.6211907, 0, 1, 0.2313726, 1,
-0.3693354, 0.8619245, 0.1080426, 0, 1, 0.2392157, 1,
-0.3679371, -2.381017, -2.94133, 0, 1, 0.2431373, 1,
-0.363041, -0.04440943, -3.227939, 0, 1, 0.2509804, 1,
-0.3584787, -0.6288326, -4.661327, 0, 1, 0.254902, 1,
-0.3578117, 0.02126017, -0.8129241, 0, 1, 0.2627451, 1,
-0.3551579, -0.3644915, -1.654483, 0, 1, 0.2666667, 1,
-0.3541116, -0.2354502, -1.734547, 0, 1, 0.2745098, 1,
-0.3450874, -1.697165, -1.064053, 0, 1, 0.2784314, 1,
-0.3444952, -1.492167, -4.589212, 0, 1, 0.2862745, 1,
-0.3444186, -0.6091655, -3.137944, 0, 1, 0.2901961, 1,
-0.3441089, 0.2435008, -2.277291, 0, 1, 0.2980392, 1,
-0.3422758, 0.09786259, -2.603825, 0, 1, 0.3058824, 1,
-0.3393846, 0.4331234, 0.808765, 0, 1, 0.3098039, 1,
-0.3389514, -0.4816732, -4.454233, 0, 1, 0.3176471, 1,
-0.3381352, -0.2592533, -2.042572, 0, 1, 0.3215686, 1,
-0.33586, 0.7392253, -1.19758, 0, 1, 0.3294118, 1,
-0.3278522, -0.3188827, -1.06372, 0, 1, 0.3333333, 1,
-0.3272589, 0.5739296, -0.9105095, 0, 1, 0.3411765, 1,
-0.325494, -0.8172552, -0.8321105, 0, 1, 0.345098, 1,
-0.3228812, 0.2112997, 0.2907562, 0, 1, 0.3529412, 1,
-0.3202468, 0.6078998, -1.562759, 0, 1, 0.3568628, 1,
-0.3193614, -1.728696, -2.921849, 0, 1, 0.3647059, 1,
-0.3191128, -0.9705604, -2.529538, 0, 1, 0.3686275, 1,
-0.3181277, -0.9758642, -3.306415, 0, 1, 0.3764706, 1,
-0.3104318, -0.6450295, -4.345088, 0, 1, 0.3803922, 1,
-0.3088661, 0.4991433, -0.2264088, 0, 1, 0.3882353, 1,
-0.3077184, 2.553764, -0.5969192, 0, 1, 0.3921569, 1,
-0.3050771, 0.03183023, -1.561238, 0, 1, 0.4, 1,
-0.3035527, 0.3738805, -1.851338, 0, 1, 0.4078431, 1,
-0.3012612, 1.129565, -0.08178896, 0, 1, 0.4117647, 1,
-0.3006645, -0.009599898, -1.028479, 0, 1, 0.4196078, 1,
-0.3005783, -1.060828, -4.098958, 0, 1, 0.4235294, 1,
-0.2971892, -1.077431, -1.523491, 0, 1, 0.4313726, 1,
-0.2967061, 1.445995, -1.754908, 0, 1, 0.4352941, 1,
-0.2940792, 1.01791, 0.4469512, 0, 1, 0.4431373, 1,
-0.285171, -0.3901061, -3.085677, 0, 1, 0.4470588, 1,
-0.2811253, -0.4633276, -2.368618, 0, 1, 0.454902, 1,
-0.2779841, 0.1082503, -1.840395, 0, 1, 0.4588235, 1,
-0.2772282, -0.3181178, 0.01046295, 0, 1, 0.4666667, 1,
-0.2732631, -0.2098088, -1.43183, 0, 1, 0.4705882, 1,
-0.2730398, -0.01523197, -1.334541, 0, 1, 0.4784314, 1,
-0.2722827, 2.091054, 1.373058, 0, 1, 0.4823529, 1,
-0.2716586, -1.220927, -2.932697, 0, 1, 0.4901961, 1,
-0.2659269, -0.1200267, -3.818543, 0, 1, 0.4941176, 1,
-0.2597093, -1.318765, -1.615443, 0, 1, 0.5019608, 1,
-0.2584175, -0.2189321, -1.92772, 0, 1, 0.509804, 1,
-0.2549998, -1.861429, -3.497738, 0, 1, 0.5137255, 1,
-0.2531571, -0.409043, -1.94354, 0, 1, 0.5215687, 1,
-0.2516688, -0.998705, -1.130906, 0, 1, 0.5254902, 1,
-0.2433576, 2.456399, -0.04269489, 0, 1, 0.5333334, 1,
-0.2300469, -0.6584769, -3.93229, 0, 1, 0.5372549, 1,
-0.2263083, 0.3353535, -0.306843, 0, 1, 0.5450981, 1,
-0.2251593, 0.08792532, -0.334814, 0, 1, 0.5490196, 1,
-0.2215403, 1.904955, -0.8650178, 0, 1, 0.5568628, 1,
-0.2168549, 1.123015, -1.070476, 0, 1, 0.5607843, 1,
-0.2159108, -0.9206985, -2.751224, 0, 1, 0.5686275, 1,
-0.2147703, -0.8528429, -3.091217, 0, 1, 0.572549, 1,
-0.2123972, -0.889023, -3.289874, 0, 1, 0.5803922, 1,
-0.2081722, 0.3354387, -0.990161, 0, 1, 0.5843138, 1,
-0.2045438, -0.1828606, -2.199071, 0, 1, 0.5921569, 1,
-0.20347, 1.735312, -0.4667012, 0, 1, 0.5960785, 1,
-0.2023203, 0.3516736, 0.1491535, 0, 1, 0.6039216, 1,
-0.1984064, -2.179571, -2.567487, 0, 1, 0.6117647, 1,
-0.1963537, 0.2835506, -1.491579, 0, 1, 0.6156863, 1,
-0.1955773, 0.01625074, -1.049499, 0, 1, 0.6235294, 1,
-0.1931393, -1.000092, -3.868981, 0, 1, 0.627451, 1,
-0.1921975, 0.8234594, 0.9336726, 0, 1, 0.6352941, 1,
-0.186242, -0.5466279, -1.268783, 0, 1, 0.6392157, 1,
-0.1840571, -1.797241, -1.93051, 0, 1, 0.6470588, 1,
-0.1764253, 0.6312668, 0.015134, 0, 1, 0.6509804, 1,
-0.1751269, 2.650772, 1.171054, 0, 1, 0.6588235, 1,
-0.1748232, 0.6214085, -0.2934479, 0, 1, 0.6627451, 1,
-0.1732032, -0.4570175, -1.327116, 0, 1, 0.6705883, 1,
-0.1726394, 0.251432, 0.1072082, 0, 1, 0.6745098, 1,
-0.1682001, 1.130872, -1.202565, 0, 1, 0.682353, 1,
-0.1632059, 0.2254199, -2.19501, 0, 1, 0.6862745, 1,
-0.1622078, 2.25648, -0.4483422, 0, 1, 0.6941177, 1,
-0.161466, -0.271433, -2.277696, 0, 1, 0.7019608, 1,
-0.1608684, 0.6080306, 0.1375366, 0, 1, 0.7058824, 1,
-0.1602272, -1.252325, -2.499133, 0, 1, 0.7137255, 1,
-0.1572146, 0.5698207, 0.699154, 0, 1, 0.7176471, 1,
-0.1565479, -0.9721406, -2.223843, 0, 1, 0.7254902, 1,
-0.1534492, -0.5164225, -3.360977, 0, 1, 0.7294118, 1,
-0.1525892, 0.1466807, -0.03063342, 0, 1, 0.7372549, 1,
-0.148811, -0.208865, -1.365308, 0, 1, 0.7411765, 1,
-0.1462481, 0.09725698, 1.05027, 0, 1, 0.7490196, 1,
-0.1435941, 0.8721722, 0.9359248, 0, 1, 0.7529412, 1,
-0.1431601, 1.066978, 0.04852835, 0, 1, 0.7607843, 1,
-0.1430837, -0.8900906, -2.209308, 0, 1, 0.7647059, 1,
-0.1387196, -1.243643, -2.478892, 0, 1, 0.772549, 1,
-0.1377339, -0.0379077, -2.823931, 0, 1, 0.7764706, 1,
-0.1374367, 0.007338163, -1.646464, 0, 1, 0.7843137, 1,
-0.1256559, 1.764989, -0.8263228, 0, 1, 0.7882353, 1,
-0.1249767, 1.261167, -0.6439177, 0, 1, 0.7960784, 1,
-0.124042, -0.5285338, -2.636303, 0, 1, 0.8039216, 1,
-0.1218669, -0.05290622, -2.697457, 0, 1, 0.8078431, 1,
-0.1216187, -0.2287376, -2.290805, 0, 1, 0.8156863, 1,
-0.121571, -0.4591272, -1.751496, 0, 1, 0.8196079, 1,
-0.1212327, 0.3003002, -0.7535602, 0, 1, 0.827451, 1,
-0.1209615, -1.0879, -2.208518, 0, 1, 0.8313726, 1,
-0.114252, 0.3367638, 1.018937, 0, 1, 0.8392157, 1,
-0.1130982, -1.209443, -1.991385, 0, 1, 0.8431373, 1,
-0.1049031, 0.6364725, 1.077112, 0, 1, 0.8509804, 1,
-0.09771289, 0.346008, -0.07805429, 0, 1, 0.854902, 1,
-0.09738924, 1.628374, -0.3108503, 0, 1, 0.8627451, 1,
-0.09286217, 0.2023917, -1.214543, 0, 1, 0.8666667, 1,
-0.09131742, 0.4954293, 0.4211361, 0, 1, 0.8745098, 1,
-0.08919957, -0.312004, -1.808887, 0, 1, 0.8784314, 1,
-0.08746627, -1.167775, -3.45587, 0, 1, 0.8862745, 1,
-0.08435825, 0.5921971, 1.28258, 0, 1, 0.8901961, 1,
-0.06714049, -1.549749, -3.755512, 0, 1, 0.8980392, 1,
-0.06098586, 1.243048, -0.778482, 0, 1, 0.9058824, 1,
-0.06003473, 1.074951, -0.1883626, 0, 1, 0.9098039, 1,
-0.05924626, -2.753727, -0.9003229, 0, 1, 0.9176471, 1,
-0.05817513, 0.5301113, -0.2871944, 0, 1, 0.9215686, 1,
-0.05766646, -1.192738, -3.759099, 0, 1, 0.9294118, 1,
-0.05499168, -0.7623588, -3.626709, 0, 1, 0.9333333, 1,
-0.05143558, 0.5450203, -0.9935521, 0, 1, 0.9411765, 1,
-0.05059052, 0.7508234, -0.02800637, 0, 1, 0.945098, 1,
-0.04959981, -0.06853254, -1.622744, 0, 1, 0.9529412, 1,
-0.04634839, 0.7426727, 0.8972089, 0, 1, 0.9568627, 1,
-0.04499814, -2.100889, -3.071595, 0, 1, 0.9647059, 1,
-0.0431464, -0.9429899, -4.582325, 0, 1, 0.9686275, 1,
-0.0427919, 1.511163, -0.6289276, 0, 1, 0.9764706, 1,
-0.04108777, 0.2971826, 0.2110924, 0, 1, 0.9803922, 1,
-0.03560746, 0.5152885, 0.6932871, 0, 1, 0.9882353, 1,
-0.03193004, 0.6685737, 0.6279882, 0, 1, 0.9921569, 1,
-0.03129887, 0.4053682, -0.02528424, 0, 1, 1, 1,
-0.02988604, 0.9094796, -0.7715859, 0, 0.9921569, 1, 1,
-0.02617346, 1.129696, 2.34815, 0, 0.9882353, 1, 1,
-0.02612744, -1.606095, -4.281124, 0, 0.9803922, 1, 1,
-0.02592548, 0.4531929, 2.845086, 0, 0.9764706, 1, 1,
-0.02052674, 0.3535004, -1.298548, 0, 0.9686275, 1, 1,
-0.0179246, 0.7646806, -0.4708515, 0, 0.9647059, 1, 1,
-0.01315813, 0.7948207, -1.785586, 0, 0.9568627, 1, 1,
-0.0130697, 1.52627, 0.3604046, 0, 0.9529412, 1, 1,
-0.009595849, 0.7832428, 0.2165695, 0, 0.945098, 1, 1,
-0.00459314, 1.141, 0.01742789, 0, 0.9411765, 1, 1,
-0.002438603, 1.355762, -1.91755, 0, 0.9333333, 1, 1,
0.005399671, 1.439949, -1.517797, 0, 0.9294118, 1, 1,
0.01281278, 1.89358, 0.8338039, 0, 0.9215686, 1, 1,
0.01966768, 0.9690285, -0.5054423, 0, 0.9176471, 1, 1,
0.019734, -1.112609, 2.849206, 0, 0.9098039, 1, 1,
0.02190572, 0.7401334, 0.5855639, 0, 0.9058824, 1, 1,
0.02192692, 1.55626, 0.2480316, 0, 0.8980392, 1, 1,
0.0225617, -0.1609123, 1.690013, 0, 0.8901961, 1, 1,
0.02459804, -1.238607, 2.443527, 0, 0.8862745, 1, 1,
0.02719699, -0.04866481, 2.222197, 0, 0.8784314, 1, 1,
0.02839626, 1.372516, -0.1879168, 0, 0.8745098, 1, 1,
0.03230006, -1.901375, 0.9026017, 0, 0.8666667, 1, 1,
0.03373057, -0.7649471, 3.693657, 0, 0.8627451, 1, 1,
0.04076901, -0.0448223, 2.071577, 0, 0.854902, 1, 1,
0.04079107, 0.01833185, 1.379071, 0, 0.8509804, 1, 1,
0.04640925, -0.692584, 2.861231, 0, 0.8431373, 1, 1,
0.04822305, 0.09023965, 0.4092877, 0, 0.8392157, 1, 1,
0.04875315, 0.949306, -0.4963234, 0, 0.8313726, 1, 1,
0.0501778, -0.2866072, 1.622642, 0, 0.827451, 1, 1,
0.05295667, 0.6410661, -1.143839, 0, 0.8196079, 1, 1,
0.05323315, -0.4990432, 4.524537, 0, 0.8156863, 1, 1,
0.0534271, 1.814732, 0.9094747, 0, 0.8078431, 1, 1,
0.05354618, 0.4717717, -0.1533166, 0, 0.8039216, 1, 1,
0.05506415, 1.842038, -1.621322, 0, 0.7960784, 1, 1,
0.05824498, -0.3282173, 1.153761, 0, 0.7882353, 1, 1,
0.06318684, 1.722023, -0.2499821, 0, 0.7843137, 1, 1,
0.06370884, 1.352346, -0.06201188, 0, 0.7764706, 1, 1,
0.06681278, -0.8229489, 4.824976, 0, 0.772549, 1, 1,
0.06824713, -0.1672419, 5.501776, 0, 0.7647059, 1, 1,
0.06840644, 0.4431908, 0.1163893, 0, 0.7607843, 1, 1,
0.06884357, 1.785195, -1.061876, 0, 0.7529412, 1, 1,
0.06943849, 0.5922589, -0.2871886, 0, 0.7490196, 1, 1,
0.06979012, 0.5970451, -0.8812912, 0, 0.7411765, 1, 1,
0.07378776, 0.2129212, 1.760025, 0, 0.7372549, 1, 1,
0.08115656, -1.652292, 3.072885, 0, 0.7294118, 1, 1,
0.08401555, 0.7825012, -0.03488883, 0, 0.7254902, 1, 1,
0.08478262, -0.2717173, 3.064047, 0, 0.7176471, 1, 1,
0.08552555, 0.8026754, 0.6149282, 0, 0.7137255, 1, 1,
0.08779154, -2.258013, 2.580579, 0, 0.7058824, 1, 1,
0.0936923, -0.3018915, 2.417323, 0, 0.6980392, 1, 1,
0.09713553, 1.085696, 0.7666969, 0, 0.6941177, 1, 1,
0.1044811, -0.456084, 3.724001, 0, 0.6862745, 1, 1,
0.1047197, 1.176484, -0.5985376, 0, 0.682353, 1, 1,
0.1057477, -0.2515471, 2.340543, 0, 0.6745098, 1, 1,
0.1088766, 0.2581404, -0.3788553, 0, 0.6705883, 1, 1,
0.1090529, 0.1230485, 1.734721, 0, 0.6627451, 1, 1,
0.1124184, -0.6016777, 2.141004, 0, 0.6588235, 1, 1,
0.1140414, 0.6780637, 0.1690222, 0, 0.6509804, 1, 1,
0.1194379, -0.2320117, 2.840998, 0, 0.6470588, 1, 1,
0.1261461, 0.2527995, 2.882564, 0, 0.6392157, 1, 1,
0.1264401, -0.00165823, 2.246732, 0, 0.6352941, 1, 1,
0.1267857, -0.644866, 1.822411, 0, 0.627451, 1, 1,
0.1269129, -0.4045138, 3.815221, 0, 0.6235294, 1, 1,
0.1275402, 0.01125593, 1.184746, 0, 0.6156863, 1, 1,
0.1295073, -0.9578893, 3.264434, 0, 0.6117647, 1, 1,
0.1304029, 1.218772, 0.5757933, 0, 0.6039216, 1, 1,
0.1307081, -1.253358, 4.657977, 0, 0.5960785, 1, 1,
0.132048, -1.303782, 3.479699, 0, 0.5921569, 1, 1,
0.1366666, -0.6321056, 3.310292, 0, 0.5843138, 1, 1,
0.1378333, -0.1999817, 2.02593, 0, 0.5803922, 1, 1,
0.1383193, -1.926813, 4.492897, 0, 0.572549, 1, 1,
0.1408622, -0.4602715, 4.196074, 0, 0.5686275, 1, 1,
0.1416912, 0.3621819, 1.038932, 0, 0.5607843, 1, 1,
0.1417596, 1.552228, -0.8414977, 0, 0.5568628, 1, 1,
0.1474847, 0.1148388, 0.6669887, 0, 0.5490196, 1, 1,
0.1479152, 0.8710463, 0.1708937, 0, 0.5450981, 1, 1,
0.1497285, 0.1482398, 0.8018374, 0, 0.5372549, 1, 1,
0.152473, 0.3787669, 1.780673, 0, 0.5333334, 1, 1,
0.1550643, -1.106989, 2.307048, 0, 0.5254902, 1, 1,
0.1554959, 0.6700961, -0.1602125, 0, 0.5215687, 1, 1,
0.1575654, -2.241434, 2.987402, 0, 0.5137255, 1, 1,
0.1600215, 1.497736, -0.1051977, 0, 0.509804, 1, 1,
0.160945, -0.7439929, 3.671923, 0, 0.5019608, 1, 1,
0.1626045, -0.7012427, 0.9142234, 0, 0.4941176, 1, 1,
0.1631918, 0.5824084, -0.3660109, 0, 0.4901961, 1, 1,
0.1678032, 1.131105, -0.3548379, 0, 0.4823529, 1, 1,
0.1690505, -1.096281, 4.495027, 0, 0.4784314, 1, 1,
0.1777095, 0.7607558, 1.165636, 0, 0.4705882, 1, 1,
0.1861842, -0.5754785, 3.147417, 0, 0.4666667, 1, 1,
0.1864927, 1.580382, -0.2440668, 0, 0.4588235, 1, 1,
0.1966968, -0.8575311, 2.955412, 0, 0.454902, 1, 1,
0.2016454, -1.31143, 4.157586, 0, 0.4470588, 1, 1,
0.2031746, 0.5739033, -1.408666, 0, 0.4431373, 1, 1,
0.2067185, 0.8000656, 3.60342, 0, 0.4352941, 1, 1,
0.2072222, 0.3988799, -0.4432967, 0, 0.4313726, 1, 1,
0.2124855, 1.952593, -0.2468782, 0, 0.4235294, 1, 1,
0.2133712, 0.5509231, 0.8425288, 0, 0.4196078, 1, 1,
0.2181021, 2.148046, -0.9176827, 0, 0.4117647, 1, 1,
0.2188425, 1.31033, -1.606438, 0, 0.4078431, 1, 1,
0.2190274, -0.4931784, 3.016395, 0, 0.4, 1, 1,
0.2228598, 0.1066488, 0.5052527, 0, 0.3921569, 1, 1,
0.2304147, -0.06197699, 1.755063, 0, 0.3882353, 1, 1,
0.2357473, 1.11672, -0.3848606, 0, 0.3803922, 1, 1,
0.2367813, -0.3617036, 1.721071, 0, 0.3764706, 1, 1,
0.2398339, -0.1650029, 1.687292, 0, 0.3686275, 1, 1,
0.2409999, 0.9721754, 2.069305, 0, 0.3647059, 1, 1,
0.2415317, -0.4571124, 2.111429, 0, 0.3568628, 1, 1,
0.2420433, 0.005235167, 0.8190555, 0, 0.3529412, 1, 1,
0.2440836, -0.7875981, 4.694424, 0, 0.345098, 1, 1,
0.2444543, 0.8077573, 1.02622, 0, 0.3411765, 1, 1,
0.2445446, 0.8762483, 0.942412, 0, 0.3333333, 1, 1,
0.2458384, -0.93936, 2.527358, 0, 0.3294118, 1, 1,
0.2461689, 0.04696492, 0.3343913, 0, 0.3215686, 1, 1,
0.248927, -0.3366161, 3.634137, 0, 0.3176471, 1, 1,
0.2511003, -0.08960586, 2.054701, 0, 0.3098039, 1, 1,
0.2516266, -1.394965, 1.94046, 0, 0.3058824, 1, 1,
0.2576534, -1.298691, 3.222617, 0, 0.2980392, 1, 1,
0.2582132, 0.601541, -0.4108874, 0, 0.2901961, 1, 1,
0.2584468, 1.951501, 1.334672, 0, 0.2862745, 1, 1,
0.2592691, -0.4964234, 2.762237, 0, 0.2784314, 1, 1,
0.2611567, 0.2960804, 0.7913895, 0, 0.2745098, 1, 1,
0.2627383, -1.259872, 3.924211, 0, 0.2666667, 1, 1,
0.2628231, -0.3881068, 1.973033, 0, 0.2627451, 1, 1,
0.2655904, 0.2523961, 1.2076, 0, 0.254902, 1, 1,
0.2658636, -0.07158698, 2.266595, 0, 0.2509804, 1, 1,
0.2665785, 1.300613, -1.582709, 0, 0.2431373, 1, 1,
0.2678671, 0.08304254, 0.5029411, 0, 0.2392157, 1, 1,
0.2685405, -0.4775401, 3.075711, 0, 0.2313726, 1, 1,
0.2695326, 0.8128139, -0.6008598, 0, 0.227451, 1, 1,
0.2790154, 0.05306403, 0.4685644, 0, 0.2196078, 1, 1,
0.283256, 1.140546, -1.165927, 0, 0.2156863, 1, 1,
0.2865647, -0.2601054, 1.349723, 0, 0.2078431, 1, 1,
0.2889395, 1.562404, -0.5769816, 0, 0.2039216, 1, 1,
0.2889476, -0.7675126, 4.207099, 0, 0.1960784, 1, 1,
0.2933532, -0.04556896, 3.054227, 0, 0.1882353, 1, 1,
0.2936787, -1.357531, 3.988816, 0, 0.1843137, 1, 1,
0.2946125, 1.291283, 2.259091, 0, 0.1764706, 1, 1,
0.2946231, -0.781706, 3.380462, 0, 0.172549, 1, 1,
0.296399, 0.4588536, 0.4763582, 0, 0.1647059, 1, 1,
0.2969246, 0.6175444, -0.6921738, 0, 0.1607843, 1, 1,
0.2971626, 0.2291677, 0.6203902, 0, 0.1529412, 1, 1,
0.3004885, 1.823171, -1.397453, 0, 0.1490196, 1, 1,
0.3036959, 0.05044624, 0.8051906, 0, 0.1411765, 1, 1,
0.3063894, -0.3625833, 2.302572, 0, 0.1372549, 1, 1,
0.3088067, -0.2700776, 2.614345, 0, 0.1294118, 1, 1,
0.3104666, 0.9219196, 1.926155, 0, 0.1254902, 1, 1,
0.3139934, -0.3850159, 3.634843, 0, 0.1176471, 1, 1,
0.3161928, 0.4078546, -0.961553, 0, 0.1137255, 1, 1,
0.3199654, -2.17234, 1.888155, 0, 0.1058824, 1, 1,
0.3201869, -1.296471, 2.850198, 0, 0.09803922, 1, 1,
0.3212782, 1.11702, -0.3567087, 0, 0.09411765, 1, 1,
0.3221033, -0.6992269, 3.893094, 0, 0.08627451, 1, 1,
0.3240917, -0.6381202, 3.419417, 0, 0.08235294, 1, 1,
0.3277177, -0.9793033, 4.928005, 0, 0.07450981, 1, 1,
0.3290122, -0.8698801, 0.1321986, 0, 0.07058824, 1, 1,
0.3303739, 0.1137786, 0.6841057, 0, 0.0627451, 1, 1,
0.3356467, 1.098169, -2.575844, 0, 0.05882353, 1, 1,
0.3428495, 1.330119, -0.8390446, 0, 0.05098039, 1, 1,
0.3447116, -0.5524236, 2.812923, 0, 0.04705882, 1, 1,
0.346576, -0.07454148, 1.830776, 0, 0.03921569, 1, 1,
0.3499578, 0.4064392, 1.86872, 0, 0.03529412, 1, 1,
0.3504842, 2.631492, -1.457401, 0, 0.02745098, 1, 1,
0.3509313, -0.3151302, 2.362893, 0, 0.02352941, 1, 1,
0.3529136, -0.2457285, 3.069325, 0, 0.01568628, 1, 1,
0.353259, 0.9069567, 2.220429, 0, 0.01176471, 1, 1,
0.3591402, 1.030726, -0.7378526, 0, 0.003921569, 1, 1,
0.3598771, -0.2912978, 2.293684, 0.003921569, 0, 1, 1,
0.3600568, 1.958645, -0.7290287, 0.007843138, 0, 1, 1,
0.3612521, 0.3533803, 2.127761, 0.01568628, 0, 1, 1,
0.3615251, 0.6702328, 0.9247408, 0.01960784, 0, 1, 1,
0.3621951, 0.2813316, 1.226296, 0.02745098, 0, 1, 1,
0.366941, -0.431264, 1.5194, 0.03137255, 0, 1, 1,
0.3682609, 0.1726127, 1.470163, 0.03921569, 0, 1, 1,
0.3701141, 0.5000803, -0.6708844, 0.04313726, 0, 1, 1,
0.3710287, -1.166145, 0.325571, 0.05098039, 0, 1, 1,
0.3715226, 0.3750126, 0.2061735, 0.05490196, 0, 1, 1,
0.3745191, 0.4190967, 0.357969, 0.0627451, 0, 1, 1,
0.3752744, 0.8694902, 0.7248734, 0.06666667, 0, 1, 1,
0.3766094, -0.6016983, 2.701621, 0.07450981, 0, 1, 1,
0.3776156, 0.3705941, 0.7034435, 0.07843138, 0, 1, 1,
0.3788429, -1.197335, 3.478185, 0.08627451, 0, 1, 1,
0.3791526, 0.6548964, 2.484306, 0.09019608, 0, 1, 1,
0.3844089, 2.161366, -0.4397821, 0.09803922, 0, 1, 1,
0.384892, 0.8766754, 0.8127228, 0.1058824, 0, 1, 1,
0.3852162, 0.7604792, 0.988986, 0.1098039, 0, 1, 1,
0.3917007, -0.1646432, 1.473025, 0.1176471, 0, 1, 1,
0.3965865, -0.5904869, 3.366656, 0.1215686, 0, 1, 1,
0.4026256, -0.8974392, 1.59069, 0.1294118, 0, 1, 1,
0.4077127, -0.1015581, 4.194728, 0.1333333, 0, 1, 1,
0.4099662, 0.1759107, 2.244676, 0.1411765, 0, 1, 1,
0.4112832, -0.7314064, 2.736059, 0.145098, 0, 1, 1,
0.4168933, -0.26086, 0.3033835, 0.1529412, 0, 1, 1,
0.4228937, 0.4421664, 0.4849856, 0.1568628, 0, 1, 1,
0.424468, 0.4338945, 0.3391436, 0.1647059, 0, 1, 1,
0.4272727, -1.022212, 4.528049, 0.1686275, 0, 1, 1,
0.4331972, -0.7303163, 3.05042, 0.1764706, 0, 1, 1,
0.435357, -0.4025423, 1.50606, 0.1803922, 0, 1, 1,
0.4371246, -1.082764, 3.252194, 0.1882353, 0, 1, 1,
0.4406313, 0.7587673, -0.1125093, 0.1921569, 0, 1, 1,
0.4412809, 0.01196247, 3.735487, 0.2, 0, 1, 1,
0.4415524, 0.6185238, -0.09147521, 0.2078431, 0, 1, 1,
0.4475843, -0.7192632, 2.156378, 0.2117647, 0, 1, 1,
0.4489079, 0.6121704, 0.525997, 0.2196078, 0, 1, 1,
0.4542793, -1.125335, 1.651419, 0.2235294, 0, 1, 1,
0.4543947, -0.01432699, 1.447226, 0.2313726, 0, 1, 1,
0.4640115, -0.08130705, 0.1236331, 0.2352941, 0, 1, 1,
0.4677244, -0.7957464, 2.887072, 0.2431373, 0, 1, 1,
0.4697798, 0.9124894, -0.1770528, 0.2470588, 0, 1, 1,
0.471024, -0.6187166, 1.183324, 0.254902, 0, 1, 1,
0.4791414, 0.5762327, 0.7511413, 0.2588235, 0, 1, 1,
0.4805284, 1.475576, 1.304024, 0.2666667, 0, 1, 1,
0.4861118, -0.1530501, -0.1081601, 0.2705882, 0, 1, 1,
0.4939529, 0.1331265, 0.937436, 0.2784314, 0, 1, 1,
0.4939673, 2.157034, -0.7759988, 0.282353, 0, 1, 1,
0.4960159, 0.1751759, 0.2482824, 0.2901961, 0, 1, 1,
0.5005233, 0.8180878, 1.03371, 0.2941177, 0, 1, 1,
0.5006996, -0.2040776, 2.685656, 0.3019608, 0, 1, 1,
0.5040604, 0.8271056, 0.04084888, 0.3098039, 0, 1, 1,
0.5209346, -0.04725727, 0.1648765, 0.3137255, 0, 1, 1,
0.5232336, -1.191554, 3.443873, 0.3215686, 0, 1, 1,
0.523731, 1.170962, -0.9766441, 0.3254902, 0, 1, 1,
0.5274514, 1.704236, -0.2930152, 0.3333333, 0, 1, 1,
0.5349382, -1.344105, 2.706347, 0.3372549, 0, 1, 1,
0.5430508, 0.8380057, 0.4620019, 0.345098, 0, 1, 1,
0.5466112, -0.6860742, 2.308241, 0.3490196, 0, 1, 1,
0.5526722, -0.601536, 2.669842, 0.3568628, 0, 1, 1,
0.5562562, 0.9907911, -0.1744547, 0.3607843, 0, 1, 1,
0.5567778, -1.396942, 2.960482, 0.3686275, 0, 1, 1,
0.5589698, 0.7612032, 1.480195, 0.372549, 0, 1, 1,
0.5657333, -0.4250972, 1.922119, 0.3803922, 0, 1, 1,
0.5678573, 1.434261, 1.204058, 0.3843137, 0, 1, 1,
0.576369, -0.3422188, 0.1541726, 0.3921569, 0, 1, 1,
0.5767477, -0.08195255, 0.8520086, 0.3960784, 0, 1, 1,
0.5768374, 0.6821846, 0.5509197, 0.4039216, 0, 1, 1,
0.5809711, -1.460677, 3.655071, 0.4117647, 0, 1, 1,
0.5820779, 0.5872783, 0.07676332, 0.4156863, 0, 1, 1,
0.5838651, -0.5734809, 2.154903, 0.4235294, 0, 1, 1,
0.5877497, 0.5762133, 2.269557, 0.427451, 0, 1, 1,
0.5902306, 0.752948, 0.5542036, 0.4352941, 0, 1, 1,
0.5978031, 0.1504692, 2.435374, 0.4392157, 0, 1, 1,
0.6008759, -0.398327, 1.426868, 0.4470588, 0, 1, 1,
0.6025101, -1.735716, 2.715818, 0.4509804, 0, 1, 1,
0.6029306, 0.5917553, 0.4881081, 0.4588235, 0, 1, 1,
0.6075924, 0.09785545, 1.434733, 0.4627451, 0, 1, 1,
0.6078058, -0.1118853, 1.443635, 0.4705882, 0, 1, 1,
0.6088742, 0.561484, 1.860279, 0.4745098, 0, 1, 1,
0.6124092, 0.6345472, 1.51935, 0.4823529, 0, 1, 1,
0.6160122, -0.4235348, 2.366921, 0.4862745, 0, 1, 1,
0.6186444, -0.4780528, 1.636495, 0.4941176, 0, 1, 1,
0.6276829, 0.07557729, 0.8531154, 0.5019608, 0, 1, 1,
0.6277617, -0.07640538, 1.456717, 0.5058824, 0, 1, 1,
0.6286617, 1.17571, 0.6798807, 0.5137255, 0, 1, 1,
0.6298875, -1.881008, 4.304661, 0.5176471, 0, 1, 1,
0.6307604, 0.911822, 0.9783046, 0.5254902, 0, 1, 1,
0.6310751, -1.593631, 2.59902, 0.5294118, 0, 1, 1,
0.6382016, 1.066538, -1.079883, 0.5372549, 0, 1, 1,
0.6452769, -0.4999954, 2.299105, 0.5411765, 0, 1, 1,
0.6474828, 0.5678768, -0.07676008, 0.5490196, 0, 1, 1,
0.6563697, 2.110586, -1.501003, 0.5529412, 0, 1, 1,
0.6604363, 0.2549599, 0.7997296, 0.5607843, 0, 1, 1,
0.6627681, 0.3918072, -0.02876841, 0.5647059, 0, 1, 1,
0.6689401, 0.1207198, 1.646585, 0.572549, 0, 1, 1,
0.6765391, -1.322732, 2.724754, 0.5764706, 0, 1, 1,
0.6785951, 0.286349, -0.00879592, 0.5843138, 0, 1, 1,
0.6791998, 0.07359114, 1.135575, 0.5882353, 0, 1, 1,
0.6806347, 0.4652159, 1.759368, 0.5960785, 0, 1, 1,
0.6822417, 0.7488328, 2.022919, 0.6039216, 0, 1, 1,
0.6945765, -0.1649791, 3.185311, 0.6078432, 0, 1, 1,
0.6982988, 0.2748668, 1.62504, 0.6156863, 0, 1, 1,
0.6993648, 0.3852776, 0.07243047, 0.6196079, 0, 1, 1,
0.7019671, 0.9401324, 0.4989314, 0.627451, 0, 1, 1,
0.7043846, 1.545065, -2.29197, 0.6313726, 0, 1, 1,
0.7095231, -0.5766286, 1.728367, 0.6392157, 0, 1, 1,
0.7180157, -0.2823837, 3.366107, 0.6431373, 0, 1, 1,
0.720078, -1.168195, 2.765936, 0.6509804, 0, 1, 1,
0.7249071, 1.841953, 1.524741, 0.654902, 0, 1, 1,
0.7254354, -0.1327891, 1.078592, 0.6627451, 0, 1, 1,
0.7272683, -0.1405229, 1.264358, 0.6666667, 0, 1, 1,
0.7297933, 0.2151367, 0.6612315, 0.6745098, 0, 1, 1,
0.7329344, -0.935474, 2.207669, 0.6784314, 0, 1, 1,
0.738035, 0.5271227, 2.32944, 0.6862745, 0, 1, 1,
0.7417887, 0.2001942, 2.609532, 0.6901961, 0, 1, 1,
0.7450275, -0.9510296, 2.779519, 0.6980392, 0, 1, 1,
0.7465591, 1.244592, -0.1379641, 0.7058824, 0, 1, 1,
0.7657471, 1.651553, 0.1580572, 0.7098039, 0, 1, 1,
0.7704781, 1.732069, 0.2814027, 0.7176471, 0, 1, 1,
0.7812383, 1.209161, -0.5660207, 0.7215686, 0, 1, 1,
0.7823315, 0.1861928, 3.30369, 0.7294118, 0, 1, 1,
0.7836174, 0.9700129, 1.085536, 0.7333333, 0, 1, 1,
0.7854637, 0.198268, 1.015187, 0.7411765, 0, 1, 1,
0.7902711, 1.863291, 0.6157168, 0.7450981, 0, 1, 1,
0.7950481, -1.066861, 2.313499, 0.7529412, 0, 1, 1,
0.797151, 0.7168135, 0.3663345, 0.7568628, 0, 1, 1,
0.8006285, -0.5020394, 3.884077, 0.7647059, 0, 1, 1,
0.8009999, -0.7630127, 4.522189, 0.7686275, 0, 1, 1,
0.8031041, 0.9515476, 1.564074, 0.7764706, 0, 1, 1,
0.8052191, -0.6173826, 1.470587, 0.7803922, 0, 1, 1,
0.8087029, 2.236593, -0.8439289, 0.7882353, 0, 1, 1,
0.818118, 0.2746899, 1.236323, 0.7921569, 0, 1, 1,
0.8229058, 0.955221, 0.5507169, 0.8, 0, 1, 1,
0.8231792, -1.431211, 1.3205, 0.8078431, 0, 1, 1,
0.823656, -0.4297696, 2.228089, 0.8117647, 0, 1, 1,
0.8254442, -0.1822417, 1.282129, 0.8196079, 0, 1, 1,
0.8257334, -0.8311145, 2.397847, 0.8235294, 0, 1, 1,
0.8279489, -1.136004, 3.0817, 0.8313726, 0, 1, 1,
0.8283237, 0.9219848, 1.158207, 0.8352941, 0, 1, 1,
0.8300803, 0.652914, 1.299699, 0.8431373, 0, 1, 1,
0.8336358, 1.576415, -0.2879691, 0.8470588, 0, 1, 1,
0.8402871, 0.1548889, 4.094622, 0.854902, 0, 1, 1,
0.8431093, -0.8566492, 0.8436899, 0.8588235, 0, 1, 1,
0.8448422, 0.3532256, 1.932995, 0.8666667, 0, 1, 1,
0.8478794, 1.376396, 1.782944, 0.8705882, 0, 1, 1,
0.8516835, 0.8928306, 0.2624563, 0.8784314, 0, 1, 1,
0.8541945, 0.811642, 1.068093, 0.8823529, 0, 1, 1,
0.8544462, 2.306158, 2.039586, 0.8901961, 0, 1, 1,
0.8597183, -0.9525305, 1.737821, 0.8941177, 0, 1, 1,
0.8602377, 0.8886728, -0.9743986, 0.9019608, 0, 1, 1,
0.8624038, 0.4339581, 0.3913754, 0.9098039, 0, 1, 1,
0.8625109, -2.814368, 1.87326, 0.9137255, 0, 1, 1,
0.8631216, 0.1842079, 1.364076, 0.9215686, 0, 1, 1,
0.86381, -0.931437, 1.646833, 0.9254902, 0, 1, 1,
0.8679851, 0.5833479, -0.4703953, 0.9333333, 0, 1, 1,
0.8697386, -0.4948368, 1.97533, 0.9372549, 0, 1, 1,
0.8737745, 0.3910894, 1.842593, 0.945098, 0, 1, 1,
0.8778752, 0.03884197, 3.112478, 0.9490196, 0, 1, 1,
0.8832107, 0.9570675, 0.934621, 0.9568627, 0, 1, 1,
0.8858231, 0.6692463, 2.085815, 0.9607843, 0, 1, 1,
0.8899411, 0.1343772, 1.706195, 0.9686275, 0, 1, 1,
0.8905787, -0.899972, 1.097963, 0.972549, 0, 1, 1,
0.8907101, -0.07020512, 2.521715, 0.9803922, 0, 1, 1,
0.891109, 0.4116728, 0.8380916, 0.9843137, 0, 1, 1,
0.8974092, 1.59017, 1.205128, 0.9921569, 0, 1, 1,
0.8994099, 0.7583464, 1.935247, 0.9960784, 0, 1, 1,
0.9001803, -0.5821926, 1.827017, 1, 0, 0.9960784, 1,
0.903074, -0.3796749, 2.487044, 1, 0, 0.9882353, 1,
0.9064628, -1.324026, 3.332749, 1, 0, 0.9843137, 1,
0.9154873, 0.3999223, 0.9781767, 1, 0, 0.9764706, 1,
0.9215659, 1.288689, -0.6396541, 1, 0, 0.972549, 1,
0.9249032, -1.744996, 1.015956, 1, 0, 0.9647059, 1,
0.9249657, -1.888989, 2.125777, 1, 0, 0.9607843, 1,
0.925925, 1.094671, 0.665159, 1, 0, 0.9529412, 1,
0.9360835, 0.2126997, 1.244816, 1, 0, 0.9490196, 1,
0.9391503, -0.5435166, 2.630294, 1, 0, 0.9411765, 1,
0.9424206, 0.01398088, 0.7498336, 1, 0, 0.9372549, 1,
0.9619344, -0.8682704, 3.148977, 1, 0, 0.9294118, 1,
0.9629235, 0.1367791, 2.224685, 1, 0, 0.9254902, 1,
0.9630395, -1.744911, 2.237767, 1, 0, 0.9176471, 1,
0.9660079, 1.295017, -0.6719642, 1, 0, 0.9137255, 1,
0.9678185, -0.8278912, 0.8780637, 1, 0, 0.9058824, 1,
0.9694101, 0.4130921, 1.625257, 1, 0, 0.9019608, 1,
0.9792065, -1.804653, 1.585896, 1, 0, 0.8941177, 1,
0.985873, -0.8694499, 3.949827, 1, 0, 0.8862745, 1,
0.9861334, 0.4123548, 1.321682, 1, 0, 0.8823529, 1,
0.9918171, 2.343049, -0.09702578, 1, 0, 0.8745098, 1,
1.001742, -1.462814, 1.213982, 1, 0, 0.8705882, 1,
1.008493, 1.203819, 1.610824, 1, 0, 0.8627451, 1,
1.015757, 0.0764004, 0.5803617, 1, 0, 0.8588235, 1,
1.016319, -0.2085555, 2.222379, 1, 0, 0.8509804, 1,
1.016583, 0.8084404, 2.424227, 1, 0, 0.8470588, 1,
1.023778, 0.8532203, 0.166256, 1, 0, 0.8392157, 1,
1.033137, 0.6167971, 0.6787343, 1, 0, 0.8352941, 1,
1.03528, 0.2901498, 2.223858, 1, 0, 0.827451, 1,
1.040885, 0.9084615, 2.168081, 1, 0, 0.8235294, 1,
1.04329, 0.3531304, 2.430245, 1, 0, 0.8156863, 1,
1.048399, 1.891717, 2.689181, 1, 0, 0.8117647, 1,
1.051724, 0.3549042, 3.058953, 1, 0, 0.8039216, 1,
1.066978, -2.040867, 1.382813, 1, 0, 0.7960784, 1,
1.069927, 0.5057724, 2.159835, 1, 0, 0.7921569, 1,
1.075386, 1.339821, 1.04345, 1, 0, 0.7843137, 1,
1.078257, -0.005973588, 1.141339, 1, 0, 0.7803922, 1,
1.080375, -0.8517631, 1.025584, 1, 0, 0.772549, 1,
1.0951, 0.142254, 0.004014627, 1, 0, 0.7686275, 1,
1.105159, 0.5987273, 1.84755, 1, 0, 0.7607843, 1,
1.107232, 0.4763402, 0.1076817, 1, 0, 0.7568628, 1,
1.108893, 2.080132, 0.4675682, 1, 0, 0.7490196, 1,
1.116332, -2.020232, 2.605922, 1, 0, 0.7450981, 1,
1.137214, 0.1424909, 1.79183, 1, 0, 0.7372549, 1,
1.139938, 1.159126, 1.454071, 1, 0, 0.7333333, 1,
1.141734, -1.939276, 4.09507, 1, 0, 0.7254902, 1,
1.149512, 0.4029895, 0.2405804, 1, 0, 0.7215686, 1,
1.15646, 0.3178728, 1.326481, 1, 0, 0.7137255, 1,
1.158582, 1.427601, 0.3486605, 1, 0, 0.7098039, 1,
1.167601, -0.4183855, 0.6589369, 1, 0, 0.7019608, 1,
1.168196, -0.8466594, 4.370822, 1, 0, 0.6941177, 1,
1.172259, -0.1623001, 3.042338, 1, 0, 0.6901961, 1,
1.176984, 0.8477083, 0.2719776, 1, 0, 0.682353, 1,
1.179635, -1.013825, 2.72747, 1, 0, 0.6784314, 1,
1.18039, -1.149472, 2.279575, 1, 0, 0.6705883, 1,
1.188935, 1.139627, -0.8995346, 1, 0, 0.6666667, 1,
1.190614, 1.041951, 0.5228386, 1, 0, 0.6588235, 1,
1.202496, 0.3640978, 2.106394, 1, 0, 0.654902, 1,
1.2165, 0.7897517, 0.6562204, 1, 0, 0.6470588, 1,
1.217145, 1.058198, 1.454735, 1, 0, 0.6431373, 1,
1.219059, 0.1049498, 1.017269, 1, 0, 0.6352941, 1,
1.241293, -0.762902, 1.827924, 1, 0, 0.6313726, 1,
1.243897, -0.2086276, 1.214385, 1, 0, 0.6235294, 1,
1.249977, -0.547969, 0.3551227, 1, 0, 0.6196079, 1,
1.254933, 1.750939, 0.3878515, 1, 0, 0.6117647, 1,
1.257818, -0.2525308, 1.281501, 1, 0, 0.6078432, 1,
1.262499, 0.9498957, 1.946142, 1, 0, 0.6, 1,
1.264435, 1.257445, -0.06755215, 1, 0, 0.5921569, 1,
1.269997, 0.3941846, -0.1227706, 1, 0, 0.5882353, 1,
1.275662, 0.6880909, -0.174209, 1, 0, 0.5803922, 1,
1.281381, -0.180312, -0.5358806, 1, 0, 0.5764706, 1,
1.284243, -0.2200656, 1.177816, 1, 0, 0.5686275, 1,
1.313967, -1.940548, 2.197213, 1, 0, 0.5647059, 1,
1.314428, -2.736605, 2.902776, 1, 0, 0.5568628, 1,
1.321575, 1.352536, 1.870839, 1, 0, 0.5529412, 1,
1.340264, -0.3462778, 0.9008884, 1, 0, 0.5450981, 1,
1.341666, 0.3968532, 1.408935, 1, 0, 0.5411765, 1,
1.343405, -0.3880409, 0.4274041, 1, 0, 0.5333334, 1,
1.345076, 2.198737, 2.388565, 1, 0, 0.5294118, 1,
1.348688, 1.318844, -0.1240756, 1, 0, 0.5215687, 1,
1.365631, -0.1608795, 0.6570741, 1, 0, 0.5176471, 1,
1.366276, 0.7539887, -0.6589499, 1, 0, 0.509804, 1,
1.376204, -0.9417293, -1.154399, 1, 0, 0.5058824, 1,
1.37624, -0.5174996, 1.941712, 1, 0, 0.4980392, 1,
1.378638, 0.6385965, -1.216574, 1, 0, 0.4901961, 1,
1.379146, 2.267937, 2.459437, 1, 0, 0.4862745, 1,
1.381393, 0.3434587, 0.92797, 1, 0, 0.4784314, 1,
1.383111, 0.2984383, 0.1547741, 1, 0, 0.4745098, 1,
1.399715, 1.817186, 0.4860918, 1, 0, 0.4666667, 1,
1.40476, -0.05086052, 0.09231355, 1, 0, 0.4627451, 1,
1.40959, 1.353878, -0.7294501, 1, 0, 0.454902, 1,
1.410832, 0.521533, 1.099822, 1, 0, 0.4509804, 1,
1.427453, 0.08769964, 2.278713, 1, 0, 0.4431373, 1,
1.433787, -1.538916, 2.487667, 1, 0, 0.4392157, 1,
1.44601, -1.139639, 2.801142, 1, 0, 0.4313726, 1,
1.451425, -0.07941092, -0.4185833, 1, 0, 0.427451, 1,
1.45498, 0.9813054, 0.7943787, 1, 0, 0.4196078, 1,
1.465105, 2.175302, 0.2493175, 1, 0, 0.4156863, 1,
1.465748, 0.3469332, 2.148446, 1, 0, 0.4078431, 1,
1.472998, -0.1551825, 2.960939, 1, 0, 0.4039216, 1,
1.493348, -0.3181608, 0.4907511, 1, 0, 0.3960784, 1,
1.495661, -1.472621, 1.118575, 1, 0, 0.3882353, 1,
1.496974, 0.9908258, 0.8511646, 1, 0, 0.3843137, 1,
1.498891, -1.125533, 1.686795, 1, 0, 0.3764706, 1,
1.517819, -0.08092646, 1.675023, 1, 0, 0.372549, 1,
1.56273, 0.4696509, 0.7938126, 1, 0, 0.3647059, 1,
1.570756, -0.1036734, 1.142571, 1, 0, 0.3607843, 1,
1.57182, -0.0638774, 3.229209, 1, 0, 0.3529412, 1,
1.578085, 0.674427, 0.9410048, 1, 0, 0.3490196, 1,
1.583801, -0.3119493, 1.472646, 1, 0, 0.3411765, 1,
1.586618, -1.868878, 0.7496253, 1, 0, 0.3372549, 1,
1.587974, 0.7991076, 1.526201, 1, 0, 0.3294118, 1,
1.615456, 0.06330109, 2.119466, 1, 0, 0.3254902, 1,
1.615717, -0.3277466, 2.816354, 1, 0, 0.3176471, 1,
1.621436, -1.444266, 1.965988, 1, 0, 0.3137255, 1,
1.636138, 1.925089, 1.248144, 1, 0, 0.3058824, 1,
1.640463, -0.7671926, 3.245612, 1, 0, 0.2980392, 1,
1.659187, -1.748427, 0.6718737, 1, 0, 0.2941177, 1,
1.665186, -0.4299775, 1.24496, 1, 0, 0.2862745, 1,
1.672094, 0.7786123, 0.1348824, 1, 0, 0.282353, 1,
1.686313, 0.3530053, 0.3596981, 1, 0, 0.2745098, 1,
1.699442, 0.08161466, 1.371841, 1, 0, 0.2705882, 1,
1.70081, -0.3219631, 1.946747, 1, 0, 0.2627451, 1,
1.703069, 2.401285, 2.981535, 1, 0, 0.2588235, 1,
1.713603, 1.339853, 0.0308962, 1, 0, 0.2509804, 1,
1.731513, 0.8607938, -0.1178666, 1, 0, 0.2470588, 1,
1.748765, -0.703337, 1.435105, 1, 0, 0.2392157, 1,
1.755004, 1.013311, -0.0361714, 1, 0, 0.2352941, 1,
1.756536, 0.8413222, 0.171227, 1, 0, 0.227451, 1,
1.762087, -1.192109, 2.27363, 1, 0, 0.2235294, 1,
1.764593, -0.2031011, 1.717134, 1, 0, 0.2156863, 1,
1.770874, 1.013002, 2.377762, 1, 0, 0.2117647, 1,
1.773625, 0.6687407, -0.1382618, 1, 0, 0.2039216, 1,
1.820497, 1.418283, 0.8520503, 1, 0, 0.1960784, 1,
1.821176, 1.183648, -0.03841325, 1, 0, 0.1921569, 1,
1.835193, 0.8712021, 0.05445702, 1, 0, 0.1843137, 1,
1.838723, 1.529379, 1.65781, 1, 0, 0.1803922, 1,
1.856318, -1.077472, 1.183766, 1, 0, 0.172549, 1,
1.867303, 0.4267527, 2.118323, 1, 0, 0.1686275, 1,
1.882617, 0.3405322, 2.002892, 1, 0, 0.1607843, 1,
1.903372, 0.01269357, 1.033759, 1, 0, 0.1568628, 1,
1.903595, -0.1194411, 2.258622, 1, 0, 0.1490196, 1,
1.929989, -1.832129, 2.774469, 1, 0, 0.145098, 1,
1.932641, -1.284475, 1.965586, 1, 0, 0.1372549, 1,
1.934754, -0.1005773, 1.495156, 1, 0, 0.1333333, 1,
1.937831, 0.5112811, 0.6855822, 1, 0, 0.1254902, 1,
1.945118, 0.9722739, 0.5999606, 1, 0, 0.1215686, 1,
1.97248, 0.4090516, 3.208532, 1, 0, 0.1137255, 1,
2.005816, -0.4196198, 2.753172, 1, 0, 0.1098039, 1,
2.011196, -1.033829, 2.325824, 1, 0, 0.1019608, 1,
2.017294, -0.5434299, 1.724711, 1, 0, 0.09411765, 1,
2.133478, -0.6502693, 1.127725, 1, 0, 0.09019608, 1,
2.179468, -1.25771, 3.081565, 1, 0, 0.08235294, 1,
2.187813, -0.3561062, 1.412435, 1, 0, 0.07843138, 1,
2.210706, -1.533943, 3.040355, 1, 0, 0.07058824, 1,
2.262844, -0.2096476, 1.955147, 1, 0, 0.06666667, 1,
2.311813, 2.755141, -0.3313605, 1, 0, 0.05882353, 1,
2.340216, -0.8643382, -0.05832561, 1, 0, 0.05490196, 1,
2.354264, 0.3495904, 2.409622, 1, 0, 0.04705882, 1,
2.358554, 0.4351321, -0.7945332, 1, 0, 0.04313726, 1,
2.369471, -0.2948353, 2.907326, 1, 0, 0.03529412, 1,
2.511961, 0.3972386, 0.0255531, 1, 0, 0.03137255, 1,
2.539986, 0.4087354, 0.6706294, 1, 0, 0.02352941, 1,
2.615377, 0.2121751, 1.2028, 1, 0, 0.01960784, 1,
2.617302, -0.3130623, 2.795541, 1, 0, 0.01176471, 1,
3.515134, -0.05714136, 3.771506, 1, 0, 0.007843138, 1
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
0.3718115, -4.402248, -6.390486, 0, -0.5, 0.5, 0.5,
0.3718115, -4.402248, -6.390486, 1, -0.5, 0.5, 0.5,
0.3718115, -4.402248, -6.390486, 1, 1.5, 0.5, 0.5,
0.3718115, -4.402248, -6.390486, 0, 1.5, 0.5, 0.5
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
-3.837097, -0.0753063, -6.390486, 0, -0.5, 0.5, 0.5,
-3.837097, -0.0753063, -6.390486, 1, -0.5, 0.5, 0.5,
-3.837097, -0.0753063, -6.390486, 1, 1.5, 0.5, 0.5,
-3.837097, -0.0753063, -6.390486, 0, 1.5, 0.5, 0.5
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
-3.837097, -4.402248, 0.4174399, 0, -0.5, 0.5, 0.5,
-3.837097, -4.402248, 0.4174399, 1, -0.5, 0.5, 0.5,
-3.837097, -4.402248, 0.4174399, 1, 1.5, 0.5, 0.5,
-3.837097, -4.402248, 0.4174399, 0, 1.5, 0.5, 0.5
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
-2, -3.403723, -4.819426,
3, -3.403723, -4.819426,
-2, -3.403723, -4.819426,
-2, -3.570144, -5.081269,
-1, -3.403723, -4.819426,
-1, -3.570144, -5.081269,
0, -3.403723, -4.819426,
0, -3.570144, -5.081269,
1, -3.403723, -4.819426,
1, -3.570144, -5.081269,
2, -3.403723, -4.819426,
2, -3.570144, -5.081269,
3, -3.403723, -4.819426,
3, -3.570144, -5.081269
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
-2, -3.902986, -5.604956, 0, -0.5, 0.5, 0.5,
-2, -3.902986, -5.604956, 1, -0.5, 0.5, 0.5,
-2, -3.902986, -5.604956, 1, 1.5, 0.5, 0.5,
-2, -3.902986, -5.604956, 0, 1.5, 0.5, 0.5,
-1, -3.902986, -5.604956, 0, -0.5, 0.5, 0.5,
-1, -3.902986, -5.604956, 1, -0.5, 0.5, 0.5,
-1, -3.902986, -5.604956, 1, 1.5, 0.5, 0.5,
-1, -3.902986, -5.604956, 0, 1.5, 0.5, 0.5,
0, -3.902986, -5.604956, 0, -0.5, 0.5, 0.5,
0, -3.902986, -5.604956, 1, -0.5, 0.5, 0.5,
0, -3.902986, -5.604956, 1, 1.5, 0.5, 0.5,
0, -3.902986, -5.604956, 0, 1.5, 0.5, 0.5,
1, -3.902986, -5.604956, 0, -0.5, 0.5, 0.5,
1, -3.902986, -5.604956, 1, -0.5, 0.5, 0.5,
1, -3.902986, -5.604956, 1, 1.5, 0.5, 0.5,
1, -3.902986, -5.604956, 0, 1.5, 0.5, 0.5,
2, -3.902986, -5.604956, 0, -0.5, 0.5, 0.5,
2, -3.902986, -5.604956, 1, -0.5, 0.5, 0.5,
2, -3.902986, -5.604956, 1, 1.5, 0.5, 0.5,
2, -3.902986, -5.604956, 0, 1.5, 0.5, 0.5,
3, -3.902986, -5.604956, 0, -0.5, 0.5, 0.5,
3, -3.902986, -5.604956, 1, -0.5, 0.5, 0.5,
3, -3.902986, -5.604956, 1, 1.5, 0.5, 0.5,
3, -3.902986, -5.604956, 0, 1.5, 0.5, 0.5
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
-2.865811, -3, -4.819426,
-2.865811, 3, -4.819426,
-2.865811, -3, -4.819426,
-3.027692, -3, -5.081269,
-2.865811, -2, -4.819426,
-3.027692, -2, -5.081269,
-2.865811, -1, -4.819426,
-3.027692, -1, -5.081269,
-2.865811, 0, -4.819426,
-3.027692, 0, -5.081269,
-2.865811, 1, -4.819426,
-3.027692, 1, -5.081269,
-2.865811, 2, -4.819426,
-3.027692, 2, -5.081269,
-2.865811, 3, -4.819426,
-3.027692, 3, -5.081269
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
-3.351454, -3, -5.604956, 0, -0.5, 0.5, 0.5,
-3.351454, -3, -5.604956, 1, -0.5, 0.5, 0.5,
-3.351454, -3, -5.604956, 1, 1.5, 0.5, 0.5,
-3.351454, -3, -5.604956, 0, 1.5, 0.5, 0.5,
-3.351454, -2, -5.604956, 0, -0.5, 0.5, 0.5,
-3.351454, -2, -5.604956, 1, -0.5, 0.5, 0.5,
-3.351454, -2, -5.604956, 1, 1.5, 0.5, 0.5,
-3.351454, -2, -5.604956, 0, 1.5, 0.5, 0.5,
-3.351454, -1, -5.604956, 0, -0.5, 0.5, 0.5,
-3.351454, -1, -5.604956, 1, -0.5, 0.5, 0.5,
-3.351454, -1, -5.604956, 1, 1.5, 0.5, 0.5,
-3.351454, -1, -5.604956, 0, 1.5, 0.5, 0.5,
-3.351454, 0, -5.604956, 0, -0.5, 0.5, 0.5,
-3.351454, 0, -5.604956, 1, -0.5, 0.5, 0.5,
-3.351454, 0, -5.604956, 1, 1.5, 0.5, 0.5,
-3.351454, 0, -5.604956, 0, 1.5, 0.5, 0.5,
-3.351454, 1, -5.604956, 0, -0.5, 0.5, 0.5,
-3.351454, 1, -5.604956, 1, -0.5, 0.5, 0.5,
-3.351454, 1, -5.604956, 1, 1.5, 0.5, 0.5,
-3.351454, 1, -5.604956, 0, 1.5, 0.5, 0.5,
-3.351454, 2, -5.604956, 0, -0.5, 0.5, 0.5,
-3.351454, 2, -5.604956, 1, -0.5, 0.5, 0.5,
-3.351454, 2, -5.604956, 1, 1.5, 0.5, 0.5,
-3.351454, 2, -5.604956, 0, 1.5, 0.5, 0.5,
-3.351454, 3, -5.604956, 0, -0.5, 0.5, 0.5,
-3.351454, 3, -5.604956, 1, -0.5, 0.5, 0.5,
-3.351454, 3, -5.604956, 1, 1.5, 0.5, 0.5,
-3.351454, 3, -5.604956, 0, 1.5, 0.5, 0.5
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
-2.865811, -3.403723, -4,
-2.865811, -3.403723, 4,
-2.865811, -3.403723, -4,
-3.027692, -3.570144, -4,
-2.865811, -3.403723, -2,
-3.027692, -3.570144, -2,
-2.865811, -3.403723, 0,
-3.027692, -3.570144, 0,
-2.865811, -3.403723, 2,
-3.027692, -3.570144, 2,
-2.865811, -3.403723, 4,
-3.027692, -3.570144, 4
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
-3.351454, -3.902986, -4, 0, -0.5, 0.5, 0.5,
-3.351454, -3.902986, -4, 1, -0.5, 0.5, 0.5,
-3.351454, -3.902986, -4, 1, 1.5, 0.5, 0.5,
-3.351454, -3.902986, -4, 0, 1.5, 0.5, 0.5,
-3.351454, -3.902986, -2, 0, -0.5, 0.5, 0.5,
-3.351454, -3.902986, -2, 1, -0.5, 0.5, 0.5,
-3.351454, -3.902986, -2, 1, 1.5, 0.5, 0.5,
-3.351454, -3.902986, -2, 0, 1.5, 0.5, 0.5,
-3.351454, -3.902986, 0, 0, -0.5, 0.5, 0.5,
-3.351454, -3.902986, 0, 1, -0.5, 0.5, 0.5,
-3.351454, -3.902986, 0, 1, 1.5, 0.5, 0.5,
-3.351454, -3.902986, 0, 0, 1.5, 0.5, 0.5,
-3.351454, -3.902986, 2, 0, -0.5, 0.5, 0.5,
-3.351454, -3.902986, 2, 1, -0.5, 0.5, 0.5,
-3.351454, -3.902986, 2, 1, 1.5, 0.5, 0.5,
-3.351454, -3.902986, 2, 0, 1.5, 0.5, 0.5,
-3.351454, -3.902986, 4, 0, -0.5, 0.5, 0.5,
-3.351454, -3.902986, 4, 1, -0.5, 0.5, 0.5,
-3.351454, -3.902986, 4, 1, 1.5, 0.5, 0.5,
-3.351454, -3.902986, 4, 0, 1.5, 0.5, 0.5
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
-2.865811, -3.403723, -4.819426,
-2.865811, 3.25311, -4.819426,
-2.865811, -3.403723, 5.654306,
-2.865811, 3.25311, 5.654306,
-2.865811, -3.403723, -4.819426,
-2.865811, -3.403723, 5.654306,
-2.865811, 3.25311, -4.819426,
-2.865811, 3.25311, 5.654306,
-2.865811, -3.403723, -4.819426,
3.609434, -3.403723, -4.819426,
-2.865811, -3.403723, 5.654306,
3.609434, -3.403723, 5.654306,
-2.865811, 3.25311, -4.819426,
3.609434, 3.25311, -4.819426,
-2.865811, 3.25311, 5.654306,
3.609434, 3.25311, 5.654306,
3.609434, -3.403723, -4.819426,
3.609434, 3.25311, -4.819426,
3.609434, -3.403723, 5.654306,
3.609434, 3.25311, 5.654306,
3.609434, -3.403723, -4.819426,
3.609434, -3.403723, 5.654306,
3.609434, 3.25311, -4.819426,
3.609434, 3.25311, 5.654306
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
var radius = 7.474608;
var distance = 33.25537;
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
mvMatrix.translate( -0.3718115, 0.0753063, -0.4174399 );
mvMatrix.scale( 1.248091, 1.214045, 0.7716154 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.25537);
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
methyl_bromide_methy<-read.table("methyl_bromide_methy.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-methyl_bromide_methy$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyl_bromide_methy' not found
```

```r
y<-methyl_bromide_methy$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyl_bromide_methy' not found
```

```r
z<-methyl_bromide_methy$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyl_bromide_methy' not found
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
-2.771511, 1.248441, 0.08070645, 0, 0, 1, 1, 1,
-2.621144, -0.9014693, -1.486941, 1, 0, 0, 1, 1,
-2.61404, -0.530301, -2.412333, 1, 0, 0, 1, 1,
-2.611889, -0.3609537, -1.587597, 1, 0, 0, 1, 1,
-2.49438, 0.8146262, -2.351326, 1, 0, 0, 1, 1,
-2.42576, 1.451868, -0.7014651, 1, 0, 0, 1, 1,
-2.362589, -0.8889237, -4.666896, 0, 0, 0, 1, 1,
-2.348924, 1.533413, -1.323251, 0, 0, 0, 1, 1,
-2.342421, -1.131301, -3.153935, 0, 0, 0, 1, 1,
-2.34231, 1.586849, -0.7196434, 0, 0, 0, 1, 1,
-2.335453, -0.6426331, -3.020849, 0, 0, 0, 1, 1,
-2.270588, -0.7343926, -1.269223, 0, 0, 0, 1, 1,
-2.232684, -0.7552317, -3.419121, 0, 0, 0, 1, 1,
-2.225401, 0.9497106, -1.43347, 1, 1, 1, 1, 1,
-2.145477, -1.463339, -3.082453, 1, 1, 1, 1, 1,
-2.138459, 2.163914, 0.2253752, 1, 1, 1, 1, 1,
-2.135702, -0.298025, -2.208293, 1, 1, 1, 1, 1,
-2.134406, -0.8664006, -2.895449, 1, 1, 1, 1, 1,
-2.134186, 0.4944616, -2.069637, 1, 1, 1, 1, 1,
-2.108591, -0.303481, -2.593136, 1, 1, 1, 1, 1,
-2.052117, -0.6084974, 0.05086402, 1, 1, 1, 1, 1,
-2.017039, 0.3122264, -1.238514, 1, 1, 1, 1, 1,
-2.000735, 1.912487, -0.8520497, 1, 1, 1, 1, 1,
-1.998122, -1.696637, -3.175006, 1, 1, 1, 1, 1,
-1.956452, -1.625246, -2.774036, 1, 1, 1, 1, 1,
-1.955504, 0.4336281, -1.065441, 1, 1, 1, 1, 1,
-1.94479, 1.383181, -2.200702, 1, 1, 1, 1, 1,
-1.931545, -0.09493558, -0.9017953, 1, 1, 1, 1, 1,
-1.917375, 0.4441288, -2.519498, 0, 0, 1, 1, 1,
-1.904466, 0.485517, -0.9191853, 1, 0, 0, 1, 1,
-1.903491, 1.735097, 0.1772068, 1, 0, 0, 1, 1,
-1.861467, 0.7915019, -1.253626, 1, 0, 0, 1, 1,
-1.857887, 2.142767, -1.247972, 1, 0, 0, 1, 1,
-1.83418, -0.3476326, -1.590962, 1, 0, 0, 1, 1,
-1.824664, 1.455619, -0.7618356, 0, 0, 0, 1, 1,
-1.803742, -1.085459, -1.938305, 0, 0, 0, 1, 1,
-1.796267, 1.226971, -1.901423, 0, 0, 0, 1, 1,
-1.789371, -0.05169519, -1.578962, 0, 0, 0, 1, 1,
-1.778037, -0.4109143, -2.118719, 0, 0, 0, 1, 1,
-1.768207, 0.2356025, -1.518907, 0, 0, 0, 1, 1,
-1.759369, 2.084081, -0.1869231, 0, 0, 0, 1, 1,
-1.752043, 0.6765749, -2.390265, 1, 1, 1, 1, 1,
-1.747454, 0.5779747, -2.711391, 1, 1, 1, 1, 1,
-1.745057, -0.1650616, -2.061726, 1, 1, 1, 1, 1,
-1.74491, -0.6716489, -2.407234, 1, 1, 1, 1, 1,
-1.732237, 0.4562529, -1.662797, 1, 1, 1, 1, 1,
-1.72806, 0.9803193, -1.440256, 1, 1, 1, 1, 1,
-1.724326, -0.2807239, 0.3967316, 1, 1, 1, 1, 1,
-1.72365, -2.537947, -2.748257, 1, 1, 1, 1, 1,
-1.722049, 0.1849327, -1.720202, 1, 1, 1, 1, 1,
-1.716597, 0.6313614, -0.6088737, 1, 1, 1, 1, 1,
-1.702975, -2.145609, -2.650484, 1, 1, 1, 1, 1,
-1.693088, -1.549199, -1.541426, 1, 1, 1, 1, 1,
-1.679088, 1.837394, -2.133093, 1, 1, 1, 1, 1,
-1.672444, -0.9074686, -2.452888, 1, 1, 1, 1, 1,
-1.668669, -0.01870768, -1.131562, 1, 1, 1, 1, 1,
-1.663621, 0.3330652, -0.9330527, 0, 0, 1, 1, 1,
-1.66361, -1.257138, -4.361256, 1, 0, 0, 1, 1,
-1.64509, -0.4224587, -0.7806533, 1, 0, 0, 1, 1,
-1.639823, 0.9483592, -0.9722234, 1, 0, 0, 1, 1,
-1.630223, 0.4085405, -1.937086, 1, 0, 0, 1, 1,
-1.621661, 0.321038, -1.161554, 1, 0, 0, 1, 1,
-1.61807, 1.736073, 0.006370986, 0, 0, 0, 1, 1,
-1.614863, 2.373088, -1.654041, 0, 0, 0, 1, 1,
-1.612997, 2.008847, 0.7668329, 0, 0, 0, 1, 1,
-1.612646, 0.7313256, 0.007774303, 0, 0, 0, 1, 1,
-1.608013, 0.838764, -2.567898, 0, 0, 0, 1, 1,
-1.603298, -1.975115, -1.598745, 0, 0, 0, 1, 1,
-1.599096, -0.9058439, -3.645548, 0, 0, 0, 1, 1,
-1.590715, -0.1551175, -1.243271, 1, 1, 1, 1, 1,
-1.586107, -0.1334299, 0.9625914, 1, 1, 1, 1, 1,
-1.577609, 1.35157, 0.1673796, 1, 1, 1, 1, 1,
-1.5773, -2.173424, -2.01185, 1, 1, 1, 1, 1,
-1.577133, 0.6608112, -0.2997115, 1, 1, 1, 1, 1,
-1.573912, 0.8791727, -1.635999, 1, 1, 1, 1, 1,
-1.568337, 1.967587, 0.1274892, 1, 1, 1, 1, 1,
-1.5548, 0.9240717, -0.8834809, 1, 1, 1, 1, 1,
-1.554744, 0.5863035, 0.3829156, 1, 1, 1, 1, 1,
-1.552191, 0.8283069, -1.18829, 1, 1, 1, 1, 1,
-1.540994, 0.6613005, -1.66791, 1, 1, 1, 1, 1,
-1.540137, -1.524114, -1.980808, 1, 1, 1, 1, 1,
-1.539693, -0.7057469, -2.47858, 1, 1, 1, 1, 1,
-1.521583, 1.345015, 0.8384381, 1, 1, 1, 1, 1,
-1.518614, 0.8689792, -1.397979, 1, 1, 1, 1, 1,
-1.497419, -0.3755505, -1.51532, 0, 0, 1, 1, 1,
-1.491963, 0.3526621, -0.5172941, 1, 0, 0, 1, 1,
-1.488825, -0.0944525, -1.486927, 1, 0, 0, 1, 1,
-1.486882, -0.6243524, -3.001633, 1, 0, 0, 1, 1,
-1.482506, 0.005937138, -1.005399, 1, 0, 0, 1, 1,
-1.479141, -0.5843202, -0.9308128, 1, 0, 0, 1, 1,
-1.472851, 1.884812, 1.073757, 0, 0, 0, 1, 1,
-1.468649, -0.4309697, -1.102093, 0, 0, 0, 1, 1,
-1.462137, -0.6489471, -1.060589, 0, 0, 0, 1, 1,
-1.453242, 0.9225986, -0.8404218, 0, 0, 0, 1, 1,
-1.44986, 0.339334, -1.420314, 0, 0, 0, 1, 1,
-1.445222, -0.8278313, -1.600897, 0, 0, 0, 1, 1,
-1.438347, 0.1669839, -1.814057, 0, 0, 0, 1, 1,
-1.433193, 1.383512, -1.959696, 1, 1, 1, 1, 1,
-1.43182, -1.372253, -0.7914249, 1, 1, 1, 1, 1,
-1.419544, -0.6949621, -2.628921, 1, 1, 1, 1, 1,
-1.415455, -0.797561, -2.647381, 1, 1, 1, 1, 1,
-1.397213, 0.101453, -1.690488, 1, 1, 1, 1, 1,
-1.383691, 1.279453, -1.959496, 1, 1, 1, 1, 1,
-1.376201, 0.8817455, -0.09017792, 1, 1, 1, 1, 1,
-1.368082, -0.1103637, -0.841341, 1, 1, 1, 1, 1,
-1.365561, 0.1077815, -0.7655823, 1, 1, 1, 1, 1,
-1.358952, -1.253362, -1.68522, 1, 1, 1, 1, 1,
-1.354444, 2.044034, -0.6385058, 1, 1, 1, 1, 1,
-1.317365, -3.306779, -3.150113, 1, 1, 1, 1, 1,
-1.313552, -0.1724038, -1.55822, 1, 1, 1, 1, 1,
-1.305556, -0.7576033, -4.444187, 1, 1, 1, 1, 1,
-1.302124, 0.18822, -2.613472, 1, 1, 1, 1, 1,
-1.30106, -0.3759806, -1.129858, 0, 0, 1, 1, 1,
-1.296246, -0.9596245, -2.71284, 1, 0, 0, 1, 1,
-1.291114, -0.1114576, -1.139945, 1, 0, 0, 1, 1,
-1.276122, 1.93131, -2.546676, 1, 0, 0, 1, 1,
-1.272233, -0.7372597, -2.287534, 1, 0, 0, 1, 1,
-1.271616, 0.7791926, 0.1696806, 1, 0, 0, 1, 1,
-1.268191, 0.8987127, -1.142416, 0, 0, 0, 1, 1,
-1.260945, 0.1984092, -1.889073, 0, 0, 0, 1, 1,
-1.259864, -0.01394599, -1.895892, 0, 0, 0, 1, 1,
-1.259209, -0.3352226, -1.146131, 0, 0, 0, 1, 1,
-1.255918, -0.619965, -2.512016, 0, 0, 0, 1, 1,
-1.249147, -0.2452577, -0.7608013, 0, 0, 0, 1, 1,
-1.241668, -0.6853318, -2.087615, 0, 0, 0, 1, 1,
-1.241324, -0.2292586, -3.50052, 1, 1, 1, 1, 1,
-1.230812, 0.1011449, 0.5780756, 1, 1, 1, 1, 1,
-1.228559, -0.1566339, -3.422265, 1, 1, 1, 1, 1,
-1.220612, -0.06792609, -2.26914, 1, 1, 1, 1, 1,
-1.155697, -1.364978, -3.530166, 1, 1, 1, 1, 1,
-1.153376, 0.4807028, -2.13361, 1, 1, 1, 1, 1,
-1.13972, -0.3384283, -1.309979, 1, 1, 1, 1, 1,
-1.139472, -0.6453912, -2.364753, 1, 1, 1, 1, 1,
-1.137915, -0.8955355, -1.865823, 1, 1, 1, 1, 1,
-1.137329, 0.6058462, -0.4561042, 1, 1, 1, 1, 1,
-1.135984, -1.63262, -3.985815, 1, 1, 1, 1, 1,
-1.134939, 0.9950299, -0.6804315, 1, 1, 1, 1, 1,
-1.125, -0.298631, -2.99192, 1, 1, 1, 1, 1,
-1.12318, 1.320021, -0.8033931, 1, 1, 1, 1, 1,
-1.120608, 1.154862, -1.307659, 1, 1, 1, 1, 1,
-1.118594, 1.394196, 0.3560355, 0, 0, 1, 1, 1,
-1.111425, 0.742677, -0.08698048, 1, 0, 0, 1, 1,
-1.104105, 0.1020767, 0.6834482, 1, 0, 0, 1, 1,
-1.096462, -0.4939852, -0.842014, 1, 0, 0, 1, 1,
-1.096035, 0.6979082, -1.462079, 1, 0, 0, 1, 1,
-1.088165, -0.9666417, -2.472448, 1, 0, 0, 1, 1,
-1.087411, 2.547563, -1.605811, 0, 0, 0, 1, 1,
-1.084789, 1.251649, -2.146115, 0, 0, 0, 1, 1,
-1.068944, -1.27105, -2.850185, 0, 0, 0, 1, 1,
-1.063548, 2.323891, 0.08963514, 0, 0, 0, 1, 1,
-1.057967, -0.3389427, -2.588963, 0, 0, 0, 1, 1,
-1.057087, 0.5840984, -0.3030739, 0, 0, 0, 1, 1,
-1.051487, -2.182621, -2.285273, 0, 0, 0, 1, 1,
-1.045015, -1.189182, -3.266902, 1, 1, 1, 1, 1,
-1.040887, -0.6786907, -2.187969, 1, 1, 1, 1, 1,
-1.037806, 1.195822, 0.9534707, 1, 1, 1, 1, 1,
-1.03468, -0.2665089, -2.222486, 1, 1, 1, 1, 1,
-1.034472, -0.2520618, -1.470162, 1, 1, 1, 1, 1,
-1.03066, -2.224034, -3.790998, 1, 1, 1, 1, 1,
-1.014759, 0.068662, -1.661977, 1, 1, 1, 1, 1,
-1.007074, 1.236433, -2.006181, 1, 1, 1, 1, 1,
-1.003579, -0.3456243, -1.479598, 1, 1, 1, 1, 1,
-1.002565, 0.6799091, -1.979965, 1, 1, 1, 1, 1,
-0.9925256, 0.08069145, -3.032395, 1, 1, 1, 1, 1,
-0.9915467, -0.6182378, -2.716972, 1, 1, 1, 1, 1,
-0.9848021, 1.103748, -0.09991238, 1, 1, 1, 1, 1,
-0.9845554, 0.6616477, -0.9977719, 1, 1, 1, 1, 1,
-0.9756103, -0.2263721, -0.4720535, 1, 1, 1, 1, 1,
-0.9726643, -0.1985704, -2.72554, 0, 0, 1, 1, 1,
-0.9629902, 0.9707012, 0.2487692, 1, 0, 0, 1, 1,
-0.9615291, -0.8420888, -2.727284, 1, 0, 0, 1, 1,
-0.9516389, 0.2334757, -1.483649, 1, 0, 0, 1, 1,
-0.9486893, 2.457545, 0.5319721, 1, 0, 0, 1, 1,
-0.9472197, -0.9385697, -2.676973, 1, 0, 0, 1, 1,
-0.9450382, 0.5942778, -1.553226, 0, 0, 0, 1, 1,
-0.9434994, 1.356924, -0.64472, 0, 0, 0, 1, 1,
-0.9377931, -0.2022192, -2.249839, 0, 0, 0, 1, 1,
-0.9354044, 3.156166, -0.5622764, 0, 0, 0, 1, 1,
-0.9346727, -1.256084, -1.272788, 0, 0, 0, 1, 1,
-0.9333953, 0.9307757, 0.07321704, 0, 0, 0, 1, 1,
-0.9331812, 1.250775, 0.3858279, 0, 0, 0, 1, 1,
-0.9176041, 2.138071, -0.8836547, 1, 1, 1, 1, 1,
-0.9169323, -0.425389, -2.814043, 1, 1, 1, 1, 1,
-0.9040036, -2.187546, -1.563457, 1, 1, 1, 1, 1,
-0.8854731, 0.3877755, -1.212033, 1, 1, 1, 1, 1,
-0.8806607, 1.549258, -0.6985067, 1, 1, 1, 1, 1,
-0.8800741, -0.0646304, -4.062114, 1, 1, 1, 1, 1,
-0.8795833, -0.5648142, -0.9899444, 1, 1, 1, 1, 1,
-0.8755611, -0.1691241, -1.54243, 1, 1, 1, 1, 1,
-0.8746832, -1.189224, -4.565876, 1, 1, 1, 1, 1,
-0.8741646, -1.381075, -3.032939, 1, 1, 1, 1, 1,
-0.8738002, -0.09144622, -0.583371, 1, 1, 1, 1, 1,
-0.8712441, -0.8884689, -1.083319, 1, 1, 1, 1, 1,
-0.8693945, -0.2343698, -3.435578, 1, 1, 1, 1, 1,
-0.8689277, 2.746917, 0.9386723, 1, 1, 1, 1, 1,
-0.8656453, -0.8311251, -1.134373, 1, 1, 1, 1, 1,
-0.8611568, 0.5909135, -2.109474, 0, 0, 1, 1, 1,
-0.8550531, 1.749495, -2.264102, 1, 0, 0, 1, 1,
-0.8545839, -0.470276, -1.58366, 1, 0, 0, 1, 1,
-0.8527327, 0.1995123, -0.9796302, 1, 0, 0, 1, 1,
-0.8525738, 1.114936, -0.4962043, 1, 0, 0, 1, 1,
-0.8512692, 1.624081, 0.7968974, 1, 0, 0, 1, 1,
-0.8486804, 0.5792965, -0.1379321, 0, 0, 0, 1, 1,
-0.8449966, 0.06516998, -2.689439, 0, 0, 0, 1, 1,
-0.843577, -2.623408, -1.210374, 0, 0, 0, 1, 1,
-0.8422421, -0.1157203, -1.097557, 0, 0, 0, 1, 1,
-0.839691, 0.6334917, -0.6300788, 0, 0, 0, 1, 1,
-0.8395029, -0.4853974, -0.2406346, 0, 0, 0, 1, 1,
-0.8383768, 0.4575221, -1.824836, 0, 0, 0, 1, 1,
-0.8326266, -0.07750058, -2.282748, 1, 1, 1, 1, 1,
-0.8299113, -0.2989661, -1.859135, 1, 1, 1, 1, 1,
-0.8262606, 2.373844, -0.8112331, 1, 1, 1, 1, 1,
-0.8249205, 0.3691553, -1.169195, 1, 1, 1, 1, 1,
-0.8237456, 1.283125, -0.9263337, 1, 1, 1, 1, 1,
-0.8223622, 0.8535085, -0.7564555, 1, 1, 1, 1, 1,
-0.8147746, 0.5217195, -1.43656, 1, 1, 1, 1, 1,
-0.8099372, -1.38013, -2.64148, 1, 1, 1, 1, 1,
-0.8037786, -2.189724, -3.075119, 1, 1, 1, 1, 1,
-0.7981218, 0.3720345, -1.437405, 1, 1, 1, 1, 1,
-0.7955394, 0.5667161, -1.495435, 1, 1, 1, 1, 1,
-0.7943302, -0.2627011, -1.453032, 1, 1, 1, 1, 1,
-0.7921197, -0.663245, -2.359421, 1, 1, 1, 1, 1,
-0.7912772, -0.1850963, -3.016613, 1, 1, 1, 1, 1,
-0.7814834, 1.591463, -0.4562389, 1, 1, 1, 1, 1,
-0.7808462, 0.5278679, -2.776717, 0, 0, 1, 1, 1,
-0.7794185, 0.06975238, 0.187067, 1, 0, 0, 1, 1,
-0.7775124, -0.9355303, -2.213548, 1, 0, 0, 1, 1,
-0.7758991, 0.555244, 0.6385154, 1, 0, 0, 1, 1,
-0.7753966, -0.05959479, -1.409007, 1, 0, 0, 1, 1,
-0.7747249, 0.6411792, 0.5003651, 1, 0, 0, 1, 1,
-0.7741481, -0.01085117, -1.21041, 0, 0, 0, 1, 1,
-0.7734204, -0.9578261, -2.455571, 0, 0, 0, 1, 1,
-0.7731879, 1.597675, -0.0811591, 0, 0, 0, 1, 1,
-0.7707328, 0.511971, -2.505129, 0, 0, 0, 1, 1,
-0.768971, 1.133893, -1.560426, 0, 0, 0, 1, 1,
-0.7633502, 1.130195, -1.805585, 0, 0, 0, 1, 1,
-0.7589116, -0.5157445, -3.310477, 0, 0, 0, 1, 1,
-0.7588488, 1.03503, 0.2509435, 1, 1, 1, 1, 1,
-0.7555292, -0.01081489, 0.04889336, 1, 1, 1, 1, 1,
-0.750913, 0.1947635, -2.565531, 1, 1, 1, 1, 1,
-0.7457284, -0.4191085, -2.510177, 1, 1, 1, 1, 1,
-0.744565, -1.276679, -1.672708, 1, 1, 1, 1, 1,
-0.743452, 1.105703, -1.456006, 1, 1, 1, 1, 1,
-0.7366257, -1.427328, -2.623076, 1, 1, 1, 1, 1,
-0.7296305, 1.670483, -1.369993, 1, 1, 1, 1, 1,
-0.7285594, 0.3385679, -2.818194, 1, 1, 1, 1, 1,
-0.7261341, 0.468865, 0.2512986, 1, 1, 1, 1, 1,
-0.7253708, -0.1839384, -1.914233, 1, 1, 1, 1, 1,
-0.7241078, 0.06657228, -0.7386757, 1, 1, 1, 1, 1,
-0.7202878, -1.118708, -2.159093, 1, 1, 1, 1, 1,
-0.7168448, -0.3920621, -2.702751, 1, 1, 1, 1, 1,
-0.7162933, -1.068238, -3.398169, 1, 1, 1, 1, 1,
-0.713985, 1.704658, -0.1998208, 0, 0, 1, 1, 1,
-0.7110019, -0.1471107, -2.000549, 1, 0, 0, 1, 1,
-0.7069232, 1.036995, -1.629024, 1, 0, 0, 1, 1,
-0.7051432, -0.2019106, -1.014633, 1, 0, 0, 1, 1,
-0.7013357, 0.7777662, -1.150469, 1, 0, 0, 1, 1,
-0.7011777, -0.1465638, -2.628914, 1, 0, 0, 1, 1,
-0.6998249, -0.5573083, -2.093592, 0, 0, 0, 1, 1,
-0.6966689, -0.9625933, -3.974073, 0, 0, 0, 1, 1,
-0.6950991, -0.2279983, -2.584633, 0, 0, 0, 1, 1,
-0.6924752, -0.6022087, -2.585799, 0, 0, 0, 1, 1,
-0.6870477, -0.7794225, -3.686846, 0, 0, 0, 1, 1,
-0.6830017, 0.1448626, -1.497049, 0, 0, 0, 1, 1,
-0.6797314, -1.011058, -1.915523, 0, 0, 0, 1, 1,
-0.6796221, 1.159668, -0.07150251, 1, 1, 1, 1, 1,
-0.6729139, 0.8914659, -0.8576066, 1, 1, 1, 1, 1,
-0.6723846, -1.345478, -1.757773, 1, 1, 1, 1, 1,
-0.6715646, -0.3709813, -2.610573, 1, 1, 1, 1, 1,
-0.6695836, -0.6543803, -2.791698, 1, 1, 1, 1, 1,
-0.6634709, 0.8994623, 0.85677, 1, 1, 1, 1, 1,
-0.6622561, -1.797806, -3.881748, 1, 1, 1, 1, 1,
-0.6597519, 1.68168, -1.334075, 1, 1, 1, 1, 1,
-0.6511717, 0.3403494, -1.409504, 1, 1, 1, 1, 1,
-0.6438507, -0.2653708, -1.735661, 1, 1, 1, 1, 1,
-0.6423926, 0.9551973, -0.5388491, 1, 1, 1, 1, 1,
-0.6384773, -0.155475, -2.853747, 1, 1, 1, 1, 1,
-0.6361722, -1.038073, -1.449939, 1, 1, 1, 1, 1,
-0.6278377, -0.3642041, -1.024453, 1, 1, 1, 1, 1,
-0.6276488, 0.9645011, 1.475057, 1, 1, 1, 1, 1,
-0.6207835, -0.9410359, -4.405402, 0, 0, 1, 1, 1,
-0.6196914, -0.1902676, -0.7130913, 1, 0, 0, 1, 1,
-0.6195077, -0.8710298, -4.63591, 1, 0, 0, 1, 1,
-0.618565, 0.09217314, -0.6993688, 1, 0, 0, 1, 1,
-0.6184688, -0.1525261, -2.169038, 1, 0, 0, 1, 1,
-0.6166238, -0.4427497, -3.2707, 1, 0, 0, 1, 1,
-0.6155488, -1.069828, -2.989308, 0, 0, 0, 1, 1,
-0.6068563, 0.4066491, -1.324097, 0, 0, 0, 1, 1,
-0.6047839, 0.4285732, -0.08557932, 0, 0, 0, 1, 1,
-0.5956782, -0.9922838, -4.515796, 0, 0, 0, 1, 1,
-0.5929717, -1.495179, -1.120029, 0, 0, 0, 1, 1,
-0.5880145, 3.10896, -0.9000617, 0, 0, 0, 1, 1,
-0.5879809, -0.1400344, -2.548167, 0, 0, 0, 1, 1,
-0.5841275, -0.6520663, -2.213457, 1, 1, 1, 1, 1,
-0.5835773, -0.6530532, -1.48147, 1, 1, 1, 1, 1,
-0.5811808, 0.5608567, -0.3448042, 1, 1, 1, 1, 1,
-0.57804, -0.2123612, -0.5569251, 1, 1, 1, 1, 1,
-0.5764583, 1.146356, -0.8777477, 1, 1, 1, 1, 1,
-0.5744263, -0.8482093, -3.627765, 1, 1, 1, 1, 1,
-0.5708998, -0.4803152, -2.480419, 1, 1, 1, 1, 1,
-0.5702226, -1.314874, -3.188449, 1, 1, 1, 1, 1,
-0.5700268, 0.6820954, -1.19179, 1, 1, 1, 1, 1,
-0.568305, -2.427447, -1.710765, 1, 1, 1, 1, 1,
-0.5620838, 0.1715392, -2.485859, 1, 1, 1, 1, 1,
-0.5577816, -0.7601208, -3.212793, 1, 1, 1, 1, 1,
-0.5544679, 1.728243, -0.2154936, 1, 1, 1, 1, 1,
-0.5510656, -0.7588759, -1.861022, 1, 1, 1, 1, 1,
-0.5484311, -0.9587885, -1.845512, 1, 1, 1, 1, 1,
-0.5451567, 0.4403167, -1.566826, 0, 0, 1, 1, 1,
-0.5438092, 0.1286123, -2.89732, 1, 0, 0, 1, 1,
-0.5400415, -0.5639641, -1.860409, 1, 0, 0, 1, 1,
-0.5379152, -1.998302, -2.410907, 1, 0, 0, 1, 1,
-0.5287783, 0.3901288, 0.7647303, 1, 0, 0, 1, 1,
-0.5219854, 0.9971455, -2.49336, 1, 0, 0, 1, 1,
-0.5168729, -1.86324, -0.79835, 0, 0, 0, 1, 1,
-0.5144216, -0.2296154, -1.284939, 0, 0, 0, 1, 1,
-0.5140616, -0.7559009, -3.319909, 0, 0, 0, 1, 1,
-0.509489, 0.6201032, -0.5003679, 0, 0, 0, 1, 1,
-0.5090405, 2.18436, -1.545605, 0, 0, 0, 1, 1,
-0.5083391, -1.17904, -2.184569, 0, 0, 0, 1, 1,
-0.4957665, -1.517806, -3.047438, 0, 0, 0, 1, 1,
-0.4947441, 2.326925, -1.770591, 1, 1, 1, 1, 1,
-0.4938909, -0.1618621, -1.282853, 1, 1, 1, 1, 1,
-0.4929214, 1.07806, 1.522727, 1, 1, 1, 1, 1,
-0.4892527, -0.07239182, -3.760201, 1, 1, 1, 1, 1,
-0.4879704, -0.8603978, -3.352969, 1, 1, 1, 1, 1,
-0.4877172, 0.07582267, -1.767963, 1, 1, 1, 1, 1,
-0.4819546, -1.640534, -3.827058, 1, 1, 1, 1, 1,
-0.4814304, -0.3193573, -2.674209, 1, 1, 1, 1, 1,
-0.4803362, -0.1954985, -2.417114, 1, 1, 1, 1, 1,
-0.4797055, 0.2454507, 0.4227736, 1, 1, 1, 1, 1,
-0.47787, -0.1012994, -4.278014, 1, 1, 1, 1, 1,
-0.4753543, -0.4442398, -2.36656, 1, 1, 1, 1, 1,
-0.4731515, -0.5018814, -0.6520774, 1, 1, 1, 1, 1,
-0.4729379, 1.044716, 0.08745752, 1, 1, 1, 1, 1,
-0.4671524, 1.218777, 0.9377309, 1, 1, 1, 1, 1,
-0.4624873, 2.574488, -1.565081, 0, 0, 1, 1, 1,
-0.459986, -0.8523856, -2.550804, 1, 0, 0, 1, 1,
-0.4568915, -0.01950239, -1.501706, 1, 0, 0, 1, 1,
-0.4565756, -0.368146, -2.986252, 1, 0, 0, 1, 1,
-0.4553065, 0.2784597, -1.139457, 1, 0, 0, 1, 1,
-0.4535074, -1.092382, -2.321908, 1, 0, 0, 1, 1,
-0.450271, -0.4866037, -1.77078, 0, 0, 0, 1, 1,
-0.4433567, 0.7047789, 0.1153032, 0, 0, 0, 1, 1,
-0.4431753, -1.337839, -2.894063, 0, 0, 0, 1, 1,
-0.4404767, -0.9807691, -2.252909, 0, 0, 0, 1, 1,
-0.4376955, 0.5861973, -0.4312747, 0, 0, 0, 1, 1,
-0.4352621, -1.258421, -2.125601, 0, 0, 0, 1, 1,
-0.4339756, -3.091066, -3.545921, 0, 0, 0, 1, 1,
-0.432147, 1.07559, -0.08940917, 1, 1, 1, 1, 1,
-0.4316396, -0.4467413, -2.181386, 1, 1, 1, 1, 1,
-0.4285329, 1.00773, -0.257515, 1, 1, 1, 1, 1,
-0.4214195, -0.7921855, -0.5791652, 1, 1, 1, 1, 1,
-0.4182674, 0.5404373, -0.7137296, 1, 1, 1, 1, 1,
-0.4170673, -0.2450505, -1.45618, 1, 1, 1, 1, 1,
-0.4160023, 1.301529, -1.724374, 1, 1, 1, 1, 1,
-0.4128703, 1.260424, -1.754562, 1, 1, 1, 1, 1,
-0.4104409, 0.8021898, 0.7057265, 1, 1, 1, 1, 1,
-0.4081798, 2.294432, -1.460067, 1, 1, 1, 1, 1,
-0.4078845, -0.2594234, -1.66499, 1, 1, 1, 1, 1,
-0.4038659, 1.034499, -0.2886561, 1, 1, 1, 1, 1,
-0.402581, -1.982055, -2.618348, 1, 1, 1, 1, 1,
-0.4025539, -0.2082677, -2.764709, 1, 1, 1, 1, 1,
-0.402015, 1.994763, -2.162584, 1, 1, 1, 1, 1,
-0.4004261, -2.205831, -2.746715, 0, 0, 1, 1, 1,
-0.397202, 0.166018, -0.4185787, 1, 0, 0, 1, 1,
-0.3946798, -0.1581899, -1.626311, 1, 0, 0, 1, 1,
-0.394299, 0.1431596, -0.2945572, 1, 0, 0, 1, 1,
-0.3902643, 2.303906, -1.08031, 1, 0, 0, 1, 1,
-0.3781961, 1.4775, 1.134752, 1, 0, 0, 1, 1,
-0.3776985, -0.3408382, -2.197471, 0, 0, 0, 1, 1,
-0.3762917, 0.6155534, -1.03318, 0, 0, 0, 1, 1,
-0.3747369, 0.7574736, -0.6211907, 0, 0, 0, 1, 1,
-0.3693354, 0.8619245, 0.1080426, 0, 0, 0, 1, 1,
-0.3679371, -2.381017, -2.94133, 0, 0, 0, 1, 1,
-0.363041, -0.04440943, -3.227939, 0, 0, 0, 1, 1,
-0.3584787, -0.6288326, -4.661327, 0, 0, 0, 1, 1,
-0.3578117, 0.02126017, -0.8129241, 1, 1, 1, 1, 1,
-0.3551579, -0.3644915, -1.654483, 1, 1, 1, 1, 1,
-0.3541116, -0.2354502, -1.734547, 1, 1, 1, 1, 1,
-0.3450874, -1.697165, -1.064053, 1, 1, 1, 1, 1,
-0.3444952, -1.492167, -4.589212, 1, 1, 1, 1, 1,
-0.3444186, -0.6091655, -3.137944, 1, 1, 1, 1, 1,
-0.3441089, 0.2435008, -2.277291, 1, 1, 1, 1, 1,
-0.3422758, 0.09786259, -2.603825, 1, 1, 1, 1, 1,
-0.3393846, 0.4331234, 0.808765, 1, 1, 1, 1, 1,
-0.3389514, -0.4816732, -4.454233, 1, 1, 1, 1, 1,
-0.3381352, -0.2592533, -2.042572, 1, 1, 1, 1, 1,
-0.33586, 0.7392253, -1.19758, 1, 1, 1, 1, 1,
-0.3278522, -0.3188827, -1.06372, 1, 1, 1, 1, 1,
-0.3272589, 0.5739296, -0.9105095, 1, 1, 1, 1, 1,
-0.325494, -0.8172552, -0.8321105, 1, 1, 1, 1, 1,
-0.3228812, 0.2112997, 0.2907562, 0, 0, 1, 1, 1,
-0.3202468, 0.6078998, -1.562759, 1, 0, 0, 1, 1,
-0.3193614, -1.728696, -2.921849, 1, 0, 0, 1, 1,
-0.3191128, -0.9705604, -2.529538, 1, 0, 0, 1, 1,
-0.3181277, -0.9758642, -3.306415, 1, 0, 0, 1, 1,
-0.3104318, -0.6450295, -4.345088, 1, 0, 0, 1, 1,
-0.3088661, 0.4991433, -0.2264088, 0, 0, 0, 1, 1,
-0.3077184, 2.553764, -0.5969192, 0, 0, 0, 1, 1,
-0.3050771, 0.03183023, -1.561238, 0, 0, 0, 1, 1,
-0.3035527, 0.3738805, -1.851338, 0, 0, 0, 1, 1,
-0.3012612, 1.129565, -0.08178896, 0, 0, 0, 1, 1,
-0.3006645, -0.009599898, -1.028479, 0, 0, 0, 1, 1,
-0.3005783, -1.060828, -4.098958, 0, 0, 0, 1, 1,
-0.2971892, -1.077431, -1.523491, 1, 1, 1, 1, 1,
-0.2967061, 1.445995, -1.754908, 1, 1, 1, 1, 1,
-0.2940792, 1.01791, 0.4469512, 1, 1, 1, 1, 1,
-0.285171, -0.3901061, -3.085677, 1, 1, 1, 1, 1,
-0.2811253, -0.4633276, -2.368618, 1, 1, 1, 1, 1,
-0.2779841, 0.1082503, -1.840395, 1, 1, 1, 1, 1,
-0.2772282, -0.3181178, 0.01046295, 1, 1, 1, 1, 1,
-0.2732631, -0.2098088, -1.43183, 1, 1, 1, 1, 1,
-0.2730398, -0.01523197, -1.334541, 1, 1, 1, 1, 1,
-0.2722827, 2.091054, 1.373058, 1, 1, 1, 1, 1,
-0.2716586, -1.220927, -2.932697, 1, 1, 1, 1, 1,
-0.2659269, -0.1200267, -3.818543, 1, 1, 1, 1, 1,
-0.2597093, -1.318765, -1.615443, 1, 1, 1, 1, 1,
-0.2584175, -0.2189321, -1.92772, 1, 1, 1, 1, 1,
-0.2549998, -1.861429, -3.497738, 1, 1, 1, 1, 1,
-0.2531571, -0.409043, -1.94354, 0, 0, 1, 1, 1,
-0.2516688, -0.998705, -1.130906, 1, 0, 0, 1, 1,
-0.2433576, 2.456399, -0.04269489, 1, 0, 0, 1, 1,
-0.2300469, -0.6584769, -3.93229, 1, 0, 0, 1, 1,
-0.2263083, 0.3353535, -0.306843, 1, 0, 0, 1, 1,
-0.2251593, 0.08792532, -0.334814, 1, 0, 0, 1, 1,
-0.2215403, 1.904955, -0.8650178, 0, 0, 0, 1, 1,
-0.2168549, 1.123015, -1.070476, 0, 0, 0, 1, 1,
-0.2159108, -0.9206985, -2.751224, 0, 0, 0, 1, 1,
-0.2147703, -0.8528429, -3.091217, 0, 0, 0, 1, 1,
-0.2123972, -0.889023, -3.289874, 0, 0, 0, 1, 1,
-0.2081722, 0.3354387, -0.990161, 0, 0, 0, 1, 1,
-0.2045438, -0.1828606, -2.199071, 0, 0, 0, 1, 1,
-0.20347, 1.735312, -0.4667012, 1, 1, 1, 1, 1,
-0.2023203, 0.3516736, 0.1491535, 1, 1, 1, 1, 1,
-0.1984064, -2.179571, -2.567487, 1, 1, 1, 1, 1,
-0.1963537, 0.2835506, -1.491579, 1, 1, 1, 1, 1,
-0.1955773, 0.01625074, -1.049499, 1, 1, 1, 1, 1,
-0.1931393, -1.000092, -3.868981, 1, 1, 1, 1, 1,
-0.1921975, 0.8234594, 0.9336726, 1, 1, 1, 1, 1,
-0.186242, -0.5466279, -1.268783, 1, 1, 1, 1, 1,
-0.1840571, -1.797241, -1.93051, 1, 1, 1, 1, 1,
-0.1764253, 0.6312668, 0.015134, 1, 1, 1, 1, 1,
-0.1751269, 2.650772, 1.171054, 1, 1, 1, 1, 1,
-0.1748232, 0.6214085, -0.2934479, 1, 1, 1, 1, 1,
-0.1732032, -0.4570175, -1.327116, 1, 1, 1, 1, 1,
-0.1726394, 0.251432, 0.1072082, 1, 1, 1, 1, 1,
-0.1682001, 1.130872, -1.202565, 1, 1, 1, 1, 1,
-0.1632059, 0.2254199, -2.19501, 0, 0, 1, 1, 1,
-0.1622078, 2.25648, -0.4483422, 1, 0, 0, 1, 1,
-0.161466, -0.271433, -2.277696, 1, 0, 0, 1, 1,
-0.1608684, 0.6080306, 0.1375366, 1, 0, 0, 1, 1,
-0.1602272, -1.252325, -2.499133, 1, 0, 0, 1, 1,
-0.1572146, 0.5698207, 0.699154, 1, 0, 0, 1, 1,
-0.1565479, -0.9721406, -2.223843, 0, 0, 0, 1, 1,
-0.1534492, -0.5164225, -3.360977, 0, 0, 0, 1, 1,
-0.1525892, 0.1466807, -0.03063342, 0, 0, 0, 1, 1,
-0.148811, -0.208865, -1.365308, 0, 0, 0, 1, 1,
-0.1462481, 0.09725698, 1.05027, 0, 0, 0, 1, 1,
-0.1435941, 0.8721722, 0.9359248, 0, 0, 0, 1, 1,
-0.1431601, 1.066978, 0.04852835, 0, 0, 0, 1, 1,
-0.1430837, -0.8900906, -2.209308, 1, 1, 1, 1, 1,
-0.1387196, -1.243643, -2.478892, 1, 1, 1, 1, 1,
-0.1377339, -0.0379077, -2.823931, 1, 1, 1, 1, 1,
-0.1374367, 0.007338163, -1.646464, 1, 1, 1, 1, 1,
-0.1256559, 1.764989, -0.8263228, 1, 1, 1, 1, 1,
-0.1249767, 1.261167, -0.6439177, 1, 1, 1, 1, 1,
-0.124042, -0.5285338, -2.636303, 1, 1, 1, 1, 1,
-0.1218669, -0.05290622, -2.697457, 1, 1, 1, 1, 1,
-0.1216187, -0.2287376, -2.290805, 1, 1, 1, 1, 1,
-0.121571, -0.4591272, -1.751496, 1, 1, 1, 1, 1,
-0.1212327, 0.3003002, -0.7535602, 1, 1, 1, 1, 1,
-0.1209615, -1.0879, -2.208518, 1, 1, 1, 1, 1,
-0.114252, 0.3367638, 1.018937, 1, 1, 1, 1, 1,
-0.1130982, -1.209443, -1.991385, 1, 1, 1, 1, 1,
-0.1049031, 0.6364725, 1.077112, 1, 1, 1, 1, 1,
-0.09771289, 0.346008, -0.07805429, 0, 0, 1, 1, 1,
-0.09738924, 1.628374, -0.3108503, 1, 0, 0, 1, 1,
-0.09286217, 0.2023917, -1.214543, 1, 0, 0, 1, 1,
-0.09131742, 0.4954293, 0.4211361, 1, 0, 0, 1, 1,
-0.08919957, -0.312004, -1.808887, 1, 0, 0, 1, 1,
-0.08746627, -1.167775, -3.45587, 1, 0, 0, 1, 1,
-0.08435825, 0.5921971, 1.28258, 0, 0, 0, 1, 1,
-0.06714049, -1.549749, -3.755512, 0, 0, 0, 1, 1,
-0.06098586, 1.243048, -0.778482, 0, 0, 0, 1, 1,
-0.06003473, 1.074951, -0.1883626, 0, 0, 0, 1, 1,
-0.05924626, -2.753727, -0.9003229, 0, 0, 0, 1, 1,
-0.05817513, 0.5301113, -0.2871944, 0, 0, 0, 1, 1,
-0.05766646, -1.192738, -3.759099, 0, 0, 0, 1, 1,
-0.05499168, -0.7623588, -3.626709, 1, 1, 1, 1, 1,
-0.05143558, 0.5450203, -0.9935521, 1, 1, 1, 1, 1,
-0.05059052, 0.7508234, -0.02800637, 1, 1, 1, 1, 1,
-0.04959981, -0.06853254, -1.622744, 1, 1, 1, 1, 1,
-0.04634839, 0.7426727, 0.8972089, 1, 1, 1, 1, 1,
-0.04499814, -2.100889, -3.071595, 1, 1, 1, 1, 1,
-0.0431464, -0.9429899, -4.582325, 1, 1, 1, 1, 1,
-0.0427919, 1.511163, -0.6289276, 1, 1, 1, 1, 1,
-0.04108777, 0.2971826, 0.2110924, 1, 1, 1, 1, 1,
-0.03560746, 0.5152885, 0.6932871, 1, 1, 1, 1, 1,
-0.03193004, 0.6685737, 0.6279882, 1, 1, 1, 1, 1,
-0.03129887, 0.4053682, -0.02528424, 1, 1, 1, 1, 1,
-0.02988604, 0.9094796, -0.7715859, 1, 1, 1, 1, 1,
-0.02617346, 1.129696, 2.34815, 1, 1, 1, 1, 1,
-0.02612744, -1.606095, -4.281124, 1, 1, 1, 1, 1,
-0.02592548, 0.4531929, 2.845086, 0, 0, 1, 1, 1,
-0.02052674, 0.3535004, -1.298548, 1, 0, 0, 1, 1,
-0.0179246, 0.7646806, -0.4708515, 1, 0, 0, 1, 1,
-0.01315813, 0.7948207, -1.785586, 1, 0, 0, 1, 1,
-0.0130697, 1.52627, 0.3604046, 1, 0, 0, 1, 1,
-0.009595849, 0.7832428, 0.2165695, 1, 0, 0, 1, 1,
-0.00459314, 1.141, 0.01742789, 0, 0, 0, 1, 1,
-0.002438603, 1.355762, -1.91755, 0, 0, 0, 1, 1,
0.005399671, 1.439949, -1.517797, 0, 0, 0, 1, 1,
0.01281278, 1.89358, 0.8338039, 0, 0, 0, 1, 1,
0.01966768, 0.9690285, -0.5054423, 0, 0, 0, 1, 1,
0.019734, -1.112609, 2.849206, 0, 0, 0, 1, 1,
0.02190572, 0.7401334, 0.5855639, 0, 0, 0, 1, 1,
0.02192692, 1.55626, 0.2480316, 1, 1, 1, 1, 1,
0.0225617, -0.1609123, 1.690013, 1, 1, 1, 1, 1,
0.02459804, -1.238607, 2.443527, 1, 1, 1, 1, 1,
0.02719699, -0.04866481, 2.222197, 1, 1, 1, 1, 1,
0.02839626, 1.372516, -0.1879168, 1, 1, 1, 1, 1,
0.03230006, -1.901375, 0.9026017, 1, 1, 1, 1, 1,
0.03373057, -0.7649471, 3.693657, 1, 1, 1, 1, 1,
0.04076901, -0.0448223, 2.071577, 1, 1, 1, 1, 1,
0.04079107, 0.01833185, 1.379071, 1, 1, 1, 1, 1,
0.04640925, -0.692584, 2.861231, 1, 1, 1, 1, 1,
0.04822305, 0.09023965, 0.4092877, 1, 1, 1, 1, 1,
0.04875315, 0.949306, -0.4963234, 1, 1, 1, 1, 1,
0.0501778, -0.2866072, 1.622642, 1, 1, 1, 1, 1,
0.05295667, 0.6410661, -1.143839, 1, 1, 1, 1, 1,
0.05323315, -0.4990432, 4.524537, 1, 1, 1, 1, 1,
0.0534271, 1.814732, 0.9094747, 0, 0, 1, 1, 1,
0.05354618, 0.4717717, -0.1533166, 1, 0, 0, 1, 1,
0.05506415, 1.842038, -1.621322, 1, 0, 0, 1, 1,
0.05824498, -0.3282173, 1.153761, 1, 0, 0, 1, 1,
0.06318684, 1.722023, -0.2499821, 1, 0, 0, 1, 1,
0.06370884, 1.352346, -0.06201188, 1, 0, 0, 1, 1,
0.06681278, -0.8229489, 4.824976, 0, 0, 0, 1, 1,
0.06824713, -0.1672419, 5.501776, 0, 0, 0, 1, 1,
0.06840644, 0.4431908, 0.1163893, 0, 0, 0, 1, 1,
0.06884357, 1.785195, -1.061876, 0, 0, 0, 1, 1,
0.06943849, 0.5922589, -0.2871886, 0, 0, 0, 1, 1,
0.06979012, 0.5970451, -0.8812912, 0, 0, 0, 1, 1,
0.07378776, 0.2129212, 1.760025, 0, 0, 0, 1, 1,
0.08115656, -1.652292, 3.072885, 1, 1, 1, 1, 1,
0.08401555, 0.7825012, -0.03488883, 1, 1, 1, 1, 1,
0.08478262, -0.2717173, 3.064047, 1, 1, 1, 1, 1,
0.08552555, 0.8026754, 0.6149282, 1, 1, 1, 1, 1,
0.08779154, -2.258013, 2.580579, 1, 1, 1, 1, 1,
0.0936923, -0.3018915, 2.417323, 1, 1, 1, 1, 1,
0.09713553, 1.085696, 0.7666969, 1, 1, 1, 1, 1,
0.1044811, -0.456084, 3.724001, 1, 1, 1, 1, 1,
0.1047197, 1.176484, -0.5985376, 1, 1, 1, 1, 1,
0.1057477, -0.2515471, 2.340543, 1, 1, 1, 1, 1,
0.1088766, 0.2581404, -0.3788553, 1, 1, 1, 1, 1,
0.1090529, 0.1230485, 1.734721, 1, 1, 1, 1, 1,
0.1124184, -0.6016777, 2.141004, 1, 1, 1, 1, 1,
0.1140414, 0.6780637, 0.1690222, 1, 1, 1, 1, 1,
0.1194379, -0.2320117, 2.840998, 1, 1, 1, 1, 1,
0.1261461, 0.2527995, 2.882564, 0, 0, 1, 1, 1,
0.1264401, -0.00165823, 2.246732, 1, 0, 0, 1, 1,
0.1267857, -0.644866, 1.822411, 1, 0, 0, 1, 1,
0.1269129, -0.4045138, 3.815221, 1, 0, 0, 1, 1,
0.1275402, 0.01125593, 1.184746, 1, 0, 0, 1, 1,
0.1295073, -0.9578893, 3.264434, 1, 0, 0, 1, 1,
0.1304029, 1.218772, 0.5757933, 0, 0, 0, 1, 1,
0.1307081, -1.253358, 4.657977, 0, 0, 0, 1, 1,
0.132048, -1.303782, 3.479699, 0, 0, 0, 1, 1,
0.1366666, -0.6321056, 3.310292, 0, 0, 0, 1, 1,
0.1378333, -0.1999817, 2.02593, 0, 0, 0, 1, 1,
0.1383193, -1.926813, 4.492897, 0, 0, 0, 1, 1,
0.1408622, -0.4602715, 4.196074, 0, 0, 0, 1, 1,
0.1416912, 0.3621819, 1.038932, 1, 1, 1, 1, 1,
0.1417596, 1.552228, -0.8414977, 1, 1, 1, 1, 1,
0.1474847, 0.1148388, 0.6669887, 1, 1, 1, 1, 1,
0.1479152, 0.8710463, 0.1708937, 1, 1, 1, 1, 1,
0.1497285, 0.1482398, 0.8018374, 1, 1, 1, 1, 1,
0.152473, 0.3787669, 1.780673, 1, 1, 1, 1, 1,
0.1550643, -1.106989, 2.307048, 1, 1, 1, 1, 1,
0.1554959, 0.6700961, -0.1602125, 1, 1, 1, 1, 1,
0.1575654, -2.241434, 2.987402, 1, 1, 1, 1, 1,
0.1600215, 1.497736, -0.1051977, 1, 1, 1, 1, 1,
0.160945, -0.7439929, 3.671923, 1, 1, 1, 1, 1,
0.1626045, -0.7012427, 0.9142234, 1, 1, 1, 1, 1,
0.1631918, 0.5824084, -0.3660109, 1, 1, 1, 1, 1,
0.1678032, 1.131105, -0.3548379, 1, 1, 1, 1, 1,
0.1690505, -1.096281, 4.495027, 1, 1, 1, 1, 1,
0.1777095, 0.7607558, 1.165636, 0, 0, 1, 1, 1,
0.1861842, -0.5754785, 3.147417, 1, 0, 0, 1, 1,
0.1864927, 1.580382, -0.2440668, 1, 0, 0, 1, 1,
0.1966968, -0.8575311, 2.955412, 1, 0, 0, 1, 1,
0.2016454, -1.31143, 4.157586, 1, 0, 0, 1, 1,
0.2031746, 0.5739033, -1.408666, 1, 0, 0, 1, 1,
0.2067185, 0.8000656, 3.60342, 0, 0, 0, 1, 1,
0.2072222, 0.3988799, -0.4432967, 0, 0, 0, 1, 1,
0.2124855, 1.952593, -0.2468782, 0, 0, 0, 1, 1,
0.2133712, 0.5509231, 0.8425288, 0, 0, 0, 1, 1,
0.2181021, 2.148046, -0.9176827, 0, 0, 0, 1, 1,
0.2188425, 1.31033, -1.606438, 0, 0, 0, 1, 1,
0.2190274, -0.4931784, 3.016395, 0, 0, 0, 1, 1,
0.2228598, 0.1066488, 0.5052527, 1, 1, 1, 1, 1,
0.2304147, -0.06197699, 1.755063, 1, 1, 1, 1, 1,
0.2357473, 1.11672, -0.3848606, 1, 1, 1, 1, 1,
0.2367813, -0.3617036, 1.721071, 1, 1, 1, 1, 1,
0.2398339, -0.1650029, 1.687292, 1, 1, 1, 1, 1,
0.2409999, 0.9721754, 2.069305, 1, 1, 1, 1, 1,
0.2415317, -0.4571124, 2.111429, 1, 1, 1, 1, 1,
0.2420433, 0.005235167, 0.8190555, 1, 1, 1, 1, 1,
0.2440836, -0.7875981, 4.694424, 1, 1, 1, 1, 1,
0.2444543, 0.8077573, 1.02622, 1, 1, 1, 1, 1,
0.2445446, 0.8762483, 0.942412, 1, 1, 1, 1, 1,
0.2458384, -0.93936, 2.527358, 1, 1, 1, 1, 1,
0.2461689, 0.04696492, 0.3343913, 1, 1, 1, 1, 1,
0.248927, -0.3366161, 3.634137, 1, 1, 1, 1, 1,
0.2511003, -0.08960586, 2.054701, 1, 1, 1, 1, 1,
0.2516266, -1.394965, 1.94046, 0, 0, 1, 1, 1,
0.2576534, -1.298691, 3.222617, 1, 0, 0, 1, 1,
0.2582132, 0.601541, -0.4108874, 1, 0, 0, 1, 1,
0.2584468, 1.951501, 1.334672, 1, 0, 0, 1, 1,
0.2592691, -0.4964234, 2.762237, 1, 0, 0, 1, 1,
0.2611567, 0.2960804, 0.7913895, 1, 0, 0, 1, 1,
0.2627383, -1.259872, 3.924211, 0, 0, 0, 1, 1,
0.2628231, -0.3881068, 1.973033, 0, 0, 0, 1, 1,
0.2655904, 0.2523961, 1.2076, 0, 0, 0, 1, 1,
0.2658636, -0.07158698, 2.266595, 0, 0, 0, 1, 1,
0.2665785, 1.300613, -1.582709, 0, 0, 0, 1, 1,
0.2678671, 0.08304254, 0.5029411, 0, 0, 0, 1, 1,
0.2685405, -0.4775401, 3.075711, 0, 0, 0, 1, 1,
0.2695326, 0.8128139, -0.6008598, 1, 1, 1, 1, 1,
0.2790154, 0.05306403, 0.4685644, 1, 1, 1, 1, 1,
0.283256, 1.140546, -1.165927, 1, 1, 1, 1, 1,
0.2865647, -0.2601054, 1.349723, 1, 1, 1, 1, 1,
0.2889395, 1.562404, -0.5769816, 1, 1, 1, 1, 1,
0.2889476, -0.7675126, 4.207099, 1, 1, 1, 1, 1,
0.2933532, -0.04556896, 3.054227, 1, 1, 1, 1, 1,
0.2936787, -1.357531, 3.988816, 1, 1, 1, 1, 1,
0.2946125, 1.291283, 2.259091, 1, 1, 1, 1, 1,
0.2946231, -0.781706, 3.380462, 1, 1, 1, 1, 1,
0.296399, 0.4588536, 0.4763582, 1, 1, 1, 1, 1,
0.2969246, 0.6175444, -0.6921738, 1, 1, 1, 1, 1,
0.2971626, 0.2291677, 0.6203902, 1, 1, 1, 1, 1,
0.3004885, 1.823171, -1.397453, 1, 1, 1, 1, 1,
0.3036959, 0.05044624, 0.8051906, 1, 1, 1, 1, 1,
0.3063894, -0.3625833, 2.302572, 0, 0, 1, 1, 1,
0.3088067, -0.2700776, 2.614345, 1, 0, 0, 1, 1,
0.3104666, 0.9219196, 1.926155, 1, 0, 0, 1, 1,
0.3139934, -0.3850159, 3.634843, 1, 0, 0, 1, 1,
0.3161928, 0.4078546, -0.961553, 1, 0, 0, 1, 1,
0.3199654, -2.17234, 1.888155, 1, 0, 0, 1, 1,
0.3201869, -1.296471, 2.850198, 0, 0, 0, 1, 1,
0.3212782, 1.11702, -0.3567087, 0, 0, 0, 1, 1,
0.3221033, -0.6992269, 3.893094, 0, 0, 0, 1, 1,
0.3240917, -0.6381202, 3.419417, 0, 0, 0, 1, 1,
0.3277177, -0.9793033, 4.928005, 0, 0, 0, 1, 1,
0.3290122, -0.8698801, 0.1321986, 0, 0, 0, 1, 1,
0.3303739, 0.1137786, 0.6841057, 0, 0, 0, 1, 1,
0.3356467, 1.098169, -2.575844, 1, 1, 1, 1, 1,
0.3428495, 1.330119, -0.8390446, 1, 1, 1, 1, 1,
0.3447116, -0.5524236, 2.812923, 1, 1, 1, 1, 1,
0.346576, -0.07454148, 1.830776, 1, 1, 1, 1, 1,
0.3499578, 0.4064392, 1.86872, 1, 1, 1, 1, 1,
0.3504842, 2.631492, -1.457401, 1, 1, 1, 1, 1,
0.3509313, -0.3151302, 2.362893, 1, 1, 1, 1, 1,
0.3529136, -0.2457285, 3.069325, 1, 1, 1, 1, 1,
0.353259, 0.9069567, 2.220429, 1, 1, 1, 1, 1,
0.3591402, 1.030726, -0.7378526, 1, 1, 1, 1, 1,
0.3598771, -0.2912978, 2.293684, 1, 1, 1, 1, 1,
0.3600568, 1.958645, -0.7290287, 1, 1, 1, 1, 1,
0.3612521, 0.3533803, 2.127761, 1, 1, 1, 1, 1,
0.3615251, 0.6702328, 0.9247408, 1, 1, 1, 1, 1,
0.3621951, 0.2813316, 1.226296, 1, 1, 1, 1, 1,
0.366941, -0.431264, 1.5194, 0, 0, 1, 1, 1,
0.3682609, 0.1726127, 1.470163, 1, 0, 0, 1, 1,
0.3701141, 0.5000803, -0.6708844, 1, 0, 0, 1, 1,
0.3710287, -1.166145, 0.325571, 1, 0, 0, 1, 1,
0.3715226, 0.3750126, 0.2061735, 1, 0, 0, 1, 1,
0.3745191, 0.4190967, 0.357969, 1, 0, 0, 1, 1,
0.3752744, 0.8694902, 0.7248734, 0, 0, 0, 1, 1,
0.3766094, -0.6016983, 2.701621, 0, 0, 0, 1, 1,
0.3776156, 0.3705941, 0.7034435, 0, 0, 0, 1, 1,
0.3788429, -1.197335, 3.478185, 0, 0, 0, 1, 1,
0.3791526, 0.6548964, 2.484306, 0, 0, 0, 1, 1,
0.3844089, 2.161366, -0.4397821, 0, 0, 0, 1, 1,
0.384892, 0.8766754, 0.8127228, 0, 0, 0, 1, 1,
0.3852162, 0.7604792, 0.988986, 1, 1, 1, 1, 1,
0.3917007, -0.1646432, 1.473025, 1, 1, 1, 1, 1,
0.3965865, -0.5904869, 3.366656, 1, 1, 1, 1, 1,
0.4026256, -0.8974392, 1.59069, 1, 1, 1, 1, 1,
0.4077127, -0.1015581, 4.194728, 1, 1, 1, 1, 1,
0.4099662, 0.1759107, 2.244676, 1, 1, 1, 1, 1,
0.4112832, -0.7314064, 2.736059, 1, 1, 1, 1, 1,
0.4168933, -0.26086, 0.3033835, 1, 1, 1, 1, 1,
0.4228937, 0.4421664, 0.4849856, 1, 1, 1, 1, 1,
0.424468, 0.4338945, 0.3391436, 1, 1, 1, 1, 1,
0.4272727, -1.022212, 4.528049, 1, 1, 1, 1, 1,
0.4331972, -0.7303163, 3.05042, 1, 1, 1, 1, 1,
0.435357, -0.4025423, 1.50606, 1, 1, 1, 1, 1,
0.4371246, -1.082764, 3.252194, 1, 1, 1, 1, 1,
0.4406313, 0.7587673, -0.1125093, 1, 1, 1, 1, 1,
0.4412809, 0.01196247, 3.735487, 0, 0, 1, 1, 1,
0.4415524, 0.6185238, -0.09147521, 1, 0, 0, 1, 1,
0.4475843, -0.7192632, 2.156378, 1, 0, 0, 1, 1,
0.4489079, 0.6121704, 0.525997, 1, 0, 0, 1, 1,
0.4542793, -1.125335, 1.651419, 1, 0, 0, 1, 1,
0.4543947, -0.01432699, 1.447226, 1, 0, 0, 1, 1,
0.4640115, -0.08130705, 0.1236331, 0, 0, 0, 1, 1,
0.4677244, -0.7957464, 2.887072, 0, 0, 0, 1, 1,
0.4697798, 0.9124894, -0.1770528, 0, 0, 0, 1, 1,
0.471024, -0.6187166, 1.183324, 0, 0, 0, 1, 1,
0.4791414, 0.5762327, 0.7511413, 0, 0, 0, 1, 1,
0.4805284, 1.475576, 1.304024, 0, 0, 0, 1, 1,
0.4861118, -0.1530501, -0.1081601, 0, 0, 0, 1, 1,
0.4939529, 0.1331265, 0.937436, 1, 1, 1, 1, 1,
0.4939673, 2.157034, -0.7759988, 1, 1, 1, 1, 1,
0.4960159, 0.1751759, 0.2482824, 1, 1, 1, 1, 1,
0.5005233, 0.8180878, 1.03371, 1, 1, 1, 1, 1,
0.5006996, -0.2040776, 2.685656, 1, 1, 1, 1, 1,
0.5040604, 0.8271056, 0.04084888, 1, 1, 1, 1, 1,
0.5209346, -0.04725727, 0.1648765, 1, 1, 1, 1, 1,
0.5232336, -1.191554, 3.443873, 1, 1, 1, 1, 1,
0.523731, 1.170962, -0.9766441, 1, 1, 1, 1, 1,
0.5274514, 1.704236, -0.2930152, 1, 1, 1, 1, 1,
0.5349382, -1.344105, 2.706347, 1, 1, 1, 1, 1,
0.5430508, 0.8380057, 0.4620019, 1, 1, 1, 1, 1,
0.5466112, -0.6860742, 2.308241, 1, 1, 1, 1, 1,
0.5526722, -0.601536, 2.669842, 1, 1, 1, 1, 1,
0.5562562, 0.9907911, -0.1744547, 1, 1, 1, 1, 1,
0.5567778, -1.396942, 2.960482, 0, 0, 1, 1, 1,
0.5589698, 0.7612032, 1.480195, 1, 0, 0, 1, 1,
0.5657333, -0.4250972, 1.922119, 1, 0, 0, 1, 1,
0.5678573, 1.434261, 1.204058, 1, 0, 0, 1, 1,
0.576369, -0.3422188, 0.1541726, 1, 0, 0, 1, 1,
0.5767477, -0.08195255, 0.8520086, 1, 0, 0, 1, 1,
0.5768374, 0.6821846, 0.5509197, 0, 0, 0, 1, 1,
0.5809711, -1.460677, 3.655071, 0, 0, 0, 1, 1,
0.5820779, 0.5872783, 0.07676332, 0, 0, 0, 1, 1,
0.5838651, -0.5734809, 2.154903, 0, 0, 0, 1, 1,
0.5877497, 0.5762133, 2.269557, 0, 0, 0, 1, 1,
0.5902306, 0.752948, 0.5542036, 0, 0, 0, 1, 1,
0.5978031, 0.1504692, 2.435374, 0, 0, 0, 1, 1,
0.6008759, -0.398327, 1.426868, 1, 1, 1, 1, 1,
0.6025101, -1.735716, 2.715818, 1, 1, 1, 1, 1,
0.6029306, 0.5917553, 0.4881081, 1, 1, 1, 1, 1,
0.6075924, 0.09785545, 1.434733, 1, 1, 1, 1, 1,
0.6078058, -0.1118853, 1.443635, 1, 1, 1, 1, 1,
0.6088742, 0.561484, 1.860279, 1, 1, 1, 1, 1,
0.6124092, 0.6345472, 1.51935, 1, 1, 1, 1, 1,
0.6160122, -0.4235348, 2.366921, 1, 1, 1, 1, 1,
0.6186444, -0.4780528, 1.636495, 1, 1, 1, 1, 1,
0.6276829, 0.07557729, 0.8531154, 1, 1, 1, 1, 1,
0.6277617, -0.07640538, 1.456717, 1, 1, 1, 1, 1,
0.6286617, 1.17571, 0.6798807, 1, 1, 1, 1, 1,
0.6298875, -1.881008, 4.304661, 1, 1, 1, 1, 1,
0.6307604, 0.911822, 0.9783046, 1, 1, 1, 1, 1,
0.6310751, -1.593631, 2.59902, 1, 1, 1, 1, 1,
0.6382016, 1.066538, -1.079883, 0, 0, 1, 1, 1,
0.6452769, -0.4999954, 2.299105, 1, 0, 0, 1, 1,
0.6474828, 0.5678768, -0.07676008, 1, 0, 0, 1, 1,
0.6563697, 2.110586, -1.501003, 1, 0, 0, 1, 1,
0.6604363, 0.2549599, 0.7997296, 1, 0, 0, 1, 1,
0.6627681, 0.3918072, -0.02876841, 1, 0, 0, 1, 1,
0.6689401, 0.1207198, 1.646585, 0, 0, 0, 1, 1,
0.6765391, -1.322732, 2.724754, 0, 0, 0, 1, 1,
0.6785951, 0.286349, -0.00879592, 0, 0, 0, 1, 1,
0.6791998, 0.07359114, 1.135575, 0, 0, 0, 1, 1,
0.6806347, 0.4652159, 1.759368, 0, 0, 0, 1, 1,
0.6822417, 0.7488328, 2.022919, 0, 0, 0, 1, 1,
0.6945765, -0.1649791, 3.185311, 0, 0, 0, 1, 1,
0.6982988, 0.2748668, 1.62504, 1, 1, 1, 1, 1,
0.6993648, 0.3852776, 0.07243047, 1, 1, 1, 1, 1,
0.7019671, 0.9401324, 0.4989314, 1, 1, 1, 1, 1,
0.7043846, 1.545065, -2.29197, 1, 1, 1, 1, 1,
0.7095231, -0.5766286, 1.728367, 1, 1, 1, 1, 1,
0.7180157, -0.2823837, 3.366107, 1, 1, 1, 1, 1,
0.720078, -1.168195, 2.765936, 1, 1, 1, 1, 1,
0.7249071, 1.841953, 1.524741, 1, 1, 1, 1, 1,
0.7254354, -0.1327891, 1.078592, 1, 1, 1, 1, 1,
0.7272683, -0.1405229, 1.264358, 1, 1, 1, 1, 1,
0.7297933, 0.2151367, 0.6612315, 1, 1, 1, 1, 1,
0.7329344, -0.935474, 2.207669, 1, 1, 1, 1, 1,
0.738035, 0.5271227, 2.32944, 1, 1, 1, 1, 1,
0.7417887, 0.2001942, 2.609532, 1, 1, 1, 1, 1,
0.7450275, -0.9510296, 2.779519, 1, 1, 1, 1, 1,
0.7465591, 1.244592, -0.1379641, 0, 0, 1, 1, 1,
0.7657471, 1.651553, 0.1580572, 1, 0, 0, 1, 1,
0.7704781, 1.732069, 0.2814027, 1, 0, 0, 1, 1,
0.7812383, 1.209161, -0.5660207, 1, 0, 0, 1, 1,
0.7823315, 0.1861928, 3.30369, 1, 0, 0, 1, 1,
0.7836174, 0.9700129, 1.085536, 1, 0, 0, 1, 1,
0.7854637, 0.198268, 1.015187, 0, 0, 0, 1, 1,
0.7902711, 1.863291, 0.6157168, 0, 0, 0, 1, 1,
0.7950481, -1.066861, 2.313499, 0, 0, 0, 1, 1,
0.797151, 0.7168135, 0.3663345, 0, 0, 0, 1, 1,
0.8006285, -0.5020394, 3.884077, 0, 0, 0, 1, 1,
0.8009999, -0.7630127, 4.522189, 0, 0, 0, 1, 1,
0.8031041, 0.9515476, 1.564074, 0, 0, 0, 1, 1,
0.8052191, -0.6173826, 1.470587, 1, 1, 1, 1, 1,
0.8087029, 2.236593, -0.8439289, 1, 1, 1, 1, 1,
0.818118, 0.2746899, 1.236323, 1, 1, 1, 1, 1,
0.8229058, 0.955221, 0.5507169, 1, 1, 1, 1, 1,
0.8231792, -1.431211, 1.3205, 1, 1, 1, 1, 1,
0.823656, -0.4297696, 2.228089, 1, 1, 1, 1, 1,
0.8254442, -0.1822417, 1.282129, 1, 1, 1, 1, 1,
0.8257334, -0.8311145, 2.397847, 1, 1, 1, 1, 1,
0.8279489, -1.136004, 3.0817, 1, 1, 1, 1, 1,
0.8283237, 0.9219848, 1.158207, 1, 1, 1, 1, 1,
0.8300803, 0.652914, 1.299699, 1, 1, 1, 1, 1,
0.8336358, 1.576415, -0.2879691, 1, 1, 1, 1, 1,
0.8402871, 0.1548889, 4.094622, 1, 1, 1, 1, 1,
0.8431093, -0.8566492, 0.8436899, 1, 1, 1, 1, 1,
0.8448422, 0.3532256, 1.932995, 1, 1, 1, 1, 1,
0.8478794, 1.376396, 1.782944, 0, 0, 1, 1, 1,
0.8516835, 0.8928306, 0.2624563, 1, 0, 0, 1, 1,
0.8541945, 0.811642, 1.068093, 1, 0, 0, 1, 1,
0.8544462, 2.306158, 2.039586, 1, 0, 0, 1, 1,
0.8597183, -0.9525305, 1.737821, 1, 0, 0, 1, 1,
0.8602377, 0.8886728, -0.9743986, 1, 0, 0, 1, 1,
0.8624038, 0.4339581, 0.3913754, 0, 0, 0, 1, 1,
0.8625109, -2.814368, 1.87326, 0, 0, 0, 1, 1,
0.8631216, 0.1842079, 1.364076, 0, 0, 0, 1, 1,
0.86381, -0.931437, 1.646833, 0, 0, 0, 1, 1,
0.8679851, 0.5833479, -0.4703953, 0, 0, 0, 1, 1,
0.8697386, -0.4948368, 1.97533, 0, 0, 0, 1, 1,
0.8737745, 0.3910894, 1.842593, 0, 0, 0, 1, 1,
0.8778752, 0.03884197, 3.112478, 1, 1, 1, 1, 1,
0.8832107, 0.9570675, 0.934621, 1, 1, 1, 1, 1,
0.8858231, 0.6692463, 2.085815, 1, 1, 1, 1, 1,
0.8899411, 0.1343772, 1.706195, 1, 1, 1, 1, 1,
0.8905787, -0.899972, 1.097963, 1, 1, 1, 1, 1,
0.8907101, -0.07020512, 2.521715, 1, 1, 1, 1, 1,
0.891109, 0.4116728, 0.8380916, 1, 1, 1, 1, 1,
0.8974092, 1.59017, 1.205128, 1, 1, 1, 1, 1,
0.8994099, 0.7583464, 1.935247, 1, 1, 1, 1, 1,
0.9001803, -0.5821926, 1.827017, 1, 1, 1, 1, 1,
0.903074, -0.3796749, 2.487044, 1, 1, 1, 1, 1,
0.9064628, -1.324026, 3.332749, 1, 1, 1, 1, 1,
0.9154873, 0.3999223, 0.9781767, 1, 1, 1, 1, 1,
0.9215659, 1.288689, -0.6396541, 1, 1, 1, 1, 1,
0.9249032, -1.744996, 1.015956, 1, 1, 1, 1, 1,
0.9249657, -1.888989, 2.125777, 0, 0, 1, 1, 1,
0.925925, 1.094671, 0.665159, 1, 0, 0, 1, 1,
0.9360835, 0.2126997, 1.244816, 1, 0, 0, 1, 1,
0.9391503, -0.5435166, 2.630294, 1, 0, 0, 1, 1,
0.9424206, 0.01398088, 0.7498336, 1, 0, 0, 1, 1,
0.9619344, -0.8682704, 3.148977, 1, 0, 0, 1, 1,
0.9629235, 0.1367791, 2.224685, 0, 0, 0, 1, 1,
0.9630395, -1.744911, 2.237767, 0, 0, 0, 1, 1,
0.9660079, 1.295017, -0.6719642, 0, 0, 0, 1, 1,
0.9678185, -0.8278912, 0.8780637, 0, 0, 0, 1, 1,
0.9694101, 0.4130921, 1.625257, 0, 0, 0, 1, 1,
0.9792065, -1.804653, 1.585896, 0, 0, 0, 1, 1,
0.985873, -0.8694499, 3.949827, 0, 0, 0, 1, 1,
0.9861334, 0.4123548, 1.321682, 1, 1, 1, 1, 1,
0.9918171, 2.343049, -0.09702578, 1, 1, 1, 1, 1,
1.001742, -1.462814, 1.213982, 1, 1, 1, 1, 1,
1.008493, 1.203819, 1.610824, 1, 1, 1, 1, 1,
1.015757, 0.0764004, 0.5803617, 1, 1, 1, 1, 1,
1.016319, -0.2085555, 2.222379, 1, 1, 1, 1, 1,
1.016583, 0.8084404, 2.424227, 1, 1, 1, 1, 1,
1.023778, 0.8532203, 0.166256, 1, 1, 1, 1, 1,
1.033137, 0.6167971, 0.6787343, 1, 1, 1, 1, 1,
1.03528, 0.2901498, 2.223858, 1, 1, 1, 1, 1,
1.040885, 0.9084615, 2.168081, 1, 1, 1, 1, 1,
1.04329, 0.3531304, 2.430245, 1, 1, 1, 1, 1,
1.048399, 1.891717, 2.689181, 1, 1, 1, 1, 1,
1.051724, 0.3549042, 3.058953, 1, 1, 1, 1, 1,
1.066978, -2.040867, 1.382813, 1, 1, 1, 1, 1,
1.069927, 0.5057724, 2.159835, 0, 0, 1, 1, 1,
1.075386, 1.339821, 1.04345, 1, 0, 0, 1, 1,
1.078257, -0.005973588, 1.141339, 1, 0, 0, 1, 1,
1.080375, -0.8517631, 1.025584, 1, 0, 0, 1, 1,
1.0951, 0.142254, 0.004014627, 1, 0, 0, 1, 1,
1.105159, 0.5987273, 1.84755, 1, 0, 0, 1, 1,
1.107232, 0.4763402, 0.1076817, 0, 0, 0, 1, 1,
1.108893, 2.080132, 0.4675682, 0, 0, 0, 1, 1,
1.116332, -2.020232, 2.605922, 0, 0, 0, 1, 1,
1.137214, 0.1424909, 1.79183, 0, 0, 0, 1, 1,
1.139938, 1.159126, 1.454071, 0, 0, 0, 1, 1,
1.141734, -1.939276, 4.09507, 0, 0, 0, 1, 1,
1.149512, 0.4029895, 0.2405804, 0, 0, 0, 1, 1,
1.15646, 0.3178728, 1.326481, 1, 1, 1, 1, 1,
1.158582, 1.427601, 0.3486605, 1, 1, 1, 1, 1,
1.167601, -0.4183855, 0.6589369, 1, 1, 1, 1, 1,
1.168196, -0.8466594, 4.370822, 1, 1, 1, 1, 1,
1.172259, -0.1623001, 3.042338, 1, 1, 1, 1, 1,
1.176984, 0.8477083, 0.2719776, 1, 1, 1, 1, 1,
1.179635, -1.013825, 2.72747, 1, 1, 1, 1, 1,
1.18039, -1.149472, 2.279575, 1, 1, 1, 1, 1,
1.188935, 1.139627, -0.8995346, 1, 1, 1, 1, 1,
1.190614, 1.041951, 0.5228386, 1, 1, 1, 1, 1,
1.202496, 0.3640978, 2.106394, 1, 1, 1, 1, 1,
1.2165, 0.7897517, 0.6562204, 1, 1, 1, 1, 1,
1.217145, 1.058198, 1.454735, 1, 1, 1, 1, 1,
1.219059, 0.1049498, 1.017269, 1, 1, 1, 1, 1,
1.241293, -0.762902, 1.827924, 1, 1, 1, 1, 1,
1.243897, -0.2086276, 1.214385, 0, 0, 1, 1, 1,
1.249977, -0.547969, 0.3551227, 1, 0, 0, 1, 1,
1.254933, 1.750939, 0.3878515, 1, 0, 0, 1, 1,
1.257818, -0.2525308, 1.281501, 1, 0, 0, 1, 1,
1.262499, 0.9498957, 1.946142, 1, 0, 0, 1, 1,
1.264435, 1.257445, -0.06755215, 1, 0, 0, 1, 1,
1.269997, 0.3941846, -0.1227706, 0, 0, 0, 1, 1,
1.275662, 0.6880909, -0.174209, 0, 0, 0, 1, 1,
1.281381, -0.180312, -0.5358806, 0, 0, 0, 1, 1,
1.284243, -0.2200656, 1.177816, 0, 0, 0, 1, 1,
1.313967, -1.940548, 2.197213, 0, 0, 0, 1, 1,
1.314428, -2.736605, 2.902776, 0, 0, 0, 1, 1,
1.321575, 1.352536, 1.870839, 0, 0, 0, 1, 1,
1.340264, -0.3462778, 0.9008884, 1, 1, 1, 1, 1,
1.341666, 0.3968532, 1.408935, 1, 1, 1, 1, 1,
1.343405, -0.3880409, 0.4274041, 1, 1, 1, 1, 1,
1.345076, 2.198737, 2.388565, 1, 1, 1, 1, 1,
1.348688, 1.318844, -0.1240756, 1, 1, 1, 1, 1,
1.365631, -0.1608795, 0.6570741, 1, 1, 1, 1, 1,
1.366276, 0.7539887, -0.6589499, 1, 1, 1, 1, 1,
1.376204, -0.9417293, -1.154399, 1, 1, 1, 1, 1,
1.37624, -0.5174996, 1.941712, 1, 1, 1, 1, 1,
1.378638, 0.6385965, -1.216574, 1, 1, 1, 1, 1,
1.379146, 2.267937, 2.459437, 1, 1, 1, 1, 1,
1.381393, 0.3434587, 0.92797, 1, 1, 1, 1, 1,
1.383111, 0.2984383, 0.1547741, 1, 1, 1, 1, 1,
1.399715, 1.817186, 0.4860918, 1, 1, 1, 1, 1,
1.40476, -0.05086052, 0.09231355, 1, 1, 1, 1, 1,
1.40959, 1.353878, -0.7294501, 0, 0, 1, 1, 1,
1.410832, 0.521533, 1.099822, 1, 0, 0, 1, 1,
1.427453, 0.08769964, 2.278713, 1, 0, 0, 1, 1,
1.433787, -1.538916, 2.487667, 1, 0, 0, 1, 1,
1.44601, -1.139639, 2.801142, 1, 0, 0, 1, 1,
1.451425, -0.07941092, -0.4185833, 1, 0, 0, 1, 1,
1.45498, 0.9813054, 0.7943787, 0, 0, 0, 1, 1,
1.465105, 2.175302, 0.2493175, 0, 0, 0, 1, 1,
1.465748, 0.3469332, 2.148446, 0, 0, 0, 1, 1,
1.472998, -0.1551825, 2.960939, 0, 0, 0, 1, 1,
1.493348, -0.3181608, 0.4907511, 0, 0, 0, 1, 1,
1.495661, -1.472621, 1.118575, 0, 0, 0, 1, 1,
1.496974, 0.9908258, 0.8511646, 0, 0, 0, 1, 1,
1.498891, -1.125533, 1.686795, 1, 1, 1, 1, 1,
1.517819, -0.08092646, 1.675023, 1, 1, 1, 1, 1,
1.56273, 0.4696509, 0.7938126, 1, 1, 1, 1, 1,
1.570756, -0.1036734, 1.142571, 1, 1, 1, 1, 1,
1.57182, -0.0638774, 3.229209, 1, 1, 1, 1, 1,
1.578085, 0.674427, 0.9410048, 1, 1, 1, 1, 1,
1.583801, -0.3119493, 1.472646, 1, 1, 1, 1, 1,
1.586618, -1.868878, 0.7496253, 1, 1, 1, 1, 1,
1.587974, 0.7991076, 1.526201, 1, 1, 1, 1, 1,
1.615456, 0.06330109, 2.119466, 1, 1, 1, 1, 1,
1.615717, -0.3277466, 2.816354, 1, 1, 1, 1, 1,
1.621436, -1.444266, 1.965988, 1, 1, 1, 1, 1,
1.636138, 1.925089, 1.248144, 1, 1, 1, 1, 1,
1.640463, -0.7671926, 3.245612, 1, 1, 1, 1, 1,
1.659187, -1.748427, 0.6718737, 1, 1, 1, 1, 1,
1.665186, -0.4299775, 1.24496, 0, 0, 1, 1, 1,
1.672094, 0.7786123, 0.1348824, 1, 0, 0, 1, 1,
1.686313, 0.3530053, 0.3596981, 1, 0, 0, 1, 1,
1.699442, 0.08161466, 1.371841, 1, 0, 0, 1, 1,
1.70081, -0.3219631, 1.946747, 1, 0, 0, 1, 1,
1.703069, 2.401285, 2.981535, 1, 0, 0, 1, 1,
1.713603, 1.339853, 0.0308962, 0, 0, 0, 1, 1,
1.731513, 0.8607938, -0.1178666, 0, 0, 0, 1, 1,
1.748765, -0.703337, 1.435105, 0, 0, 0, 1, 1,
1.755004, 1.013311, -0.0361714, 0, 0, 0, 1, 1,
1.756536, 0.8413222, 0.171227, 0, 0, 0, 1, 1,
1.762087, -1.192109, 2.27363, 0, 0, 0, 1, 1,
1.764593, -0.2031011, 1.717134, 0, 0, 0, 1, 1,
1.770874, 1.013002, 2.377762, 1, 1, 1, 1, 1,
1.773625, 0.6687407, -0.1382618, 1, 1, 1, 1, 1,
1.820497, 1.418283, 0.8520503, 1, 1, 1, 1, 1,
1.821176, 1.183648, -0.03841325, 1, 1, 1, 1, 1,
1.835193, 0.8712021, 0.05445702, 1, 1, 1, 1, 1,
1.838723, 1.529379, 1.65781, 1, 1, 1, 1, 1,
1.856318, -1.077472, 1.183766, 1, 1, 1, 1, 1,
1.867303, 0.4267527, 2.118323, 1, 1, 1, 1, 1,
1.882617, 0.3405322, 2.002892, 1, 1, 1, 1, 1,
1.903372, 0.01269357, 1.033759, 1, 1, 1, 1, 1,
1.903595, -0.1194411, 2.258622, 1, 1, 1, 1, 1,
1.929989, -1.832129, 2.774469, 1, 1, 1, 1, 1,
1.932641, -1.284475, 1.965586, 1, 1, 1, 1, 1,
1.934754, -0.1005773, 1.495156, 1, 1, 1, 1, 1,
1.937831, 0.5112811, 0.6855822, 1, 1, 1, 1, 1,
1.945118, 0.9722739, 0.5999606, 0, 0, 1, 1, 1,
1.97248, 0.4090516, 3.208532, 1, 0, 0, 1, 1,
2.005816, -0.4196198, 2.753172, 1, 0, 0, 1, 1,
2.011196, -1.033829, 2.325824, 1, 0, 0, 1, 1,
2.017294, -0.5434299, 1.724711, 1, 0, 0, 1, 1,
2.133478, -0.6502693, 1.127725, 1, 0, 0, 1, 1,
2.179468, -1.25771, 3.081565, 0, 0, 0, 1, 1,
2.187813, -0.3561062, 1.412435, 0, 0, 0, 1, 1,
2.210706, -1.533943, 3.040355, 0, 0, 0, 1, 1,
2.262844, -0.2096476, 1.955147, 0, 0, 0, 1, 1,
2.311813, 2.755141, -0.3313605, 0, 0, 0, 1, 1,
2.340216, -0.8643382, -0.05832561, 0, 0, 0, 1, 1,
2.354264, 0.3495904, 2.409622, 0, 0, 0, 1, 1,
2.358554, 0.4351321, -0.7945332, 1, 1, 1, 1, 1,
2.369471, -0.2948353, 2.907326, 1, 1, 1, 1, 1,
2.511961, 0.3972386, 0.0255531, 1, 1, 1, 1, 1,
2.539986, 0.4087354, 0.6706294, 1, 1, 1, 1, 1,
2.615377, 0.2121751, 1.2028, 1, 1, 1, 1, 1,
2.617302, -0.3130623, 2.795541, 1, 1, 1, 1, 1,
3.515134, -0.05714136, 3.771506, 1, 1, 1, 1, 1
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
var radius = 9.339746;
var distance = 32.80547;
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
mvMatrix.translate( -0.3718114, 0.07530642, -0.4174399 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.80547);
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