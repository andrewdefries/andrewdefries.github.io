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
-3.398041, -0.7726876, -0.4346341, 1, 0, 0, 1,
-3.190583, -0.6906621, -1.193558, 1, 0.007843138, 0, 1,
-3.071733, 0.2439963, -2.5329, 1, 0.01176471, 0, 1,
-3.048462, -0.1806509, -0.01172643, 1, 0.01960784, 0, 1,
-2.741028, 2.728925, 0.5715092, 1, 0.02352941, 0, 1,
-2.53226, 0.8658042, -1.472643, 1, 0.03137255, 0, 1,
-2.488949, -0.4157652, -2.053291, 1, 0.03529412, 0, 1,
-2.471948, 0.5481075, -2.076168, 1, 0.04313726, 0, 1,
-2.470973, -2.148406, -3.202774, 1, 0.04705882, 0, 1,
-2.246971, 0.08795219, -1.536408, 1, 0.05490196, 0, 1,
-2.204205, -0.5104525, -2.063897, 1, 0.05882353, 0, 1,
-2.181234, -0.271598, -1.839512, 1, 0.06666667, 0, 1,
-2.178776, 0.3353251, -1.237321, 1, 0.07058824, 0, 1,
-2.16214, -0.1507437, -1.449383, 1, 0.07843138, 0, 1,
-2.16171, 0.6677021, -3.16269, 1, 0.08235294, 0, 1,
-2.145162, -1.688824, -5.163975, 1, 0.09019608, 0, 1,
-2.13955, -0.6502101, -1.477443, 1, 0.09411765, 0, 1,
-2.117952, 0.4377915, -0.6454629, 1, 0.1019608, 0, 1,
-2.11591, -0.3068978, -1.92435, 1, 0.1098039, 0, 1,
-2.100166, 0.5157453, -1.759749, 1, 0.1137255, 0, 1,
-2.067262, -0.8953913, -1.484088, 1, 0.1215686, 0, 1,
-2.048109, -1.601568, -2.944291, 1, 0.1254902, 0, 1,
-2.04565, 0.4276516, -0.1763876, 1, 0.1333333, 0, 1,
-2.042085, 0.9553944, 0.0488558, 1, 0.1372549, 0, 1,
-2.039078, 0.9521855, -0.7096399, 1, 0.145098, 0, 1,
-2.031485, -0.819147, 0.1574845, 1, 0.1490196, 0, 1,
-2.030037, -1.723511, -2.693008, 1, 0.1568628, 0, 1,
-2.025674, 0.6339789, -0.4543838, 1, 0.1607843, 0, 1,
-2.023664, 0.1474093, -2.330209, 1, 0.1686275, 0, 1,
-2.002039, 0.09512421, -0.9264911, 1, 0.172549, 0, 1,
-1.985724, -0.4986782, -0.2510538, 1, 0.1803922, 0, 1,
-1.981442, 0.4519097, -1.897793, 1, 0.1843137, 0, 1,
-1.973183, 0.9740816, -1.970708, 1, 0.1921569, 0, 1,
-1.921307, 0.3046774, -0.8723641, 1, 0.1960784, 0, 1,
-1.915453, -0.9434041, -2.55015, 1, 0.2039216, 0, 1,
-1.886616, 0.7410091, -2.260982, 1, 0.2117647, 0, 1,
-1.882382, 1.033423, -0.08963563, 1, 0.2156863, 0, 1,
-1.824525, -0.04386625, -0.6480002, 1, 0.2235294, 0, 1,
-1.813922, -1.107442, -0.5345563, 1, 0.227451, 0, 1,
-1.793268, 0.4800176, -2.313345, 1, 0.2352941, 0, 1,
-1.788811, -0.8253059, -3.821637, 1, 0.2392157, 0, 1,
-1.782068, -1.596529, -2.656148, 1, 0.2470588, 0, 1,
-1.772384, -0.3460584, -1.591978, 1, 0.2509804, 0, 1,
-1.772206, -0.3301086, -2.738266, 1, 0.2588235, 0, 1,
-1.766459, 1.452988, -2.802642, 1, 0.2627451, 0, 1,
-1.752682, -0.2134086, -2.435144, 1, 0.2705882, 0, 1,
-1.743774, 0.8870891, 0.5399255, 1, 0.2745098, 0, 1,
-1.73338, 0.4240961, -2.110423, 1, 0.282353, 0, 1,
-1.724293, -0.005387618, -1.353279, 1, 0.2862745, 0, 1,
-1.714771, 1.344574, -1.15301, 1, 0.2941177, 0, 1,
-1.68159, -1.016757, -3.845662, 1, 0.3019608, 0, 1,
-1.668878, -0.709129, -3.043179, 1, 0.3058824, 0, 1,
-1.664131, -0.08922289, -2.543033, 1, 0.3137255, 0, 1,
-1.6066, 0.2741411, -1.065196, 1, 0.3176471, 0, 1,
-1.590709, -1.444299, -0.8117303, 1, 0.3254902, 0, 1,
-1.587353, -0.621582, -0.1195019, 1, 0.3294118, 0, 1,
-1.58113, -0.5852077, -1.689254, 1, 0.3372549, 0, 1,
-1.565682, 0.6574029, -0.9469348, 1, 0.3411765, 0, 1,
-1.565447, 0.6144731, -1.068705, 1, 0.3490196, 0, 1,
-1.554008, -1.010866, -2.522627, 1, 0.3529412, 0, 1,
-1.552911, 1.458883, 0.07439028, 1, 0.3607843, 0, 1,
-1.551749, -0.5476245, -4.405799, 1, 0.3647059, 0, 1,
-1.548984, 0.5363327, -1.411597, 1, 0.372549, 0, 1,
-1.547276, -0.1720399, -2.739451, 1, 0.3764706, 0, 1,
-1.530326, -0.746512, -1.085491, 1, 0.3843137, 0, 1,
-1.529893, -0.2868293, -2.301635, 1, 0.3882353, 0, 1,
-1.527315, -2.579952, -3.013488, 1, 0.3960784, 0, 1,
-1.522239, -0.31742, -1.524435, 1, 0.4039216, 0, 1,
-1.516065, -0.5586733, -2.200131, 1, 0.4078431, 0, 1,
-1.50242, 0.4981308, -1.508297, 1, 0.4156863, 0, 1,
-1.489951, 1.390964, -1.580249, 1, 0.4196078, 0, 1,
-1.485961, 0.2844703, -0.6416838, 1, 0.427451, 0, 1,
-1.477094, 0.3722861, -1.174362, 1, 0.4313726, 0, 1,
-1.438228, 1.106655, 0.344827, 1, 0.4392157, 0, 1,
-1.437846, -0.5870154, -1.021287, 1, 0.4431373, 0, 1,
-1.432931, -0.9128875, -1.548124, 1, 0.4509804, 0, 1,
-1.421542, 1.438311, -1.958795, 1, 0.454902, 0, 1,
-1.417212, 0.6207488, 0.0173587, 1, 0.4627451, 0, 1,
-1.410333, -0.6713889, -1.580464, 1, 0.4666667, 0, 1,
-1.408698, 2.251809, -1.708517, 1, 0.4745098, 0, 1,
-1.406482, 0.5397635, -0.09845118, 1, 0.4784314, 0, 1,
-1.390988, 1.744603, -0.2059663, 1, 0.4862745, 0, 1,
-1.390619, 0.4747552, -1.243715, 1, 0.4901961, 0, 1,
-1.384368, 0.5539005, -0.2530809, 1, 0.4980392, 0, 1,
-1.374746, -0.2319819, -1.626258, 1, 0.5058824, 0, 1,
-1.370325, -0.8988795, -3.377835, 1, 0.509804, 0, 1,
-1.36217, -2.104678, -3.876033, 1, 0.5176471, 0, 1,
-1.343102, -1.081566, -1.934796, 1, 0.5215687, 0, 1,
-1.340568, -0.8237184, -1.024662, 1, 0.5294118, 0, 1,
-1.337774, 1.20214, -1.078547, 1, 0.5333334, 0, 1,
-1.324018, 1.201398, -0.9801725, 1, 0.5411765, 0, 1,
-1.315224, 0.9302326, -0.1464935, 1, 0.5450981, 0, 1,
-1.30506, -0.8734753, -0.177005, 1, 0.5529412, 0, 1,
-1.303903, -1.075466, -4.150037, 1, 0.5568628, 0, 1,
-1.299532, 0.7231992, -0.6436344, 1, 0.5647059, 0, 1,
-1.297826, -0.676842, -1.327428, 1, 0.5686275, 0, 1,
-1.297572, 1.221664, -2.279862, 1, 0.5764706, 0, 1,
-1.286847, 0.8729867, -1.197505, 1, 0.5803922, 0, 1,
-1.285844, 0.760207, 1.341496, 1, 0.5882353, 0, 1,
-1.263625, -1.466612, -2.59957, 1, 0.5921569, 0, 1,
-1.259832, 0.06960361, -2.364931, 1, 0.6, 0, 1,
-1.250946, -1.758349, -2.929914, 1, 0.6078432, 0, 1,
-1.237644, 1.566698, 0.2044631, 1, 0.6117647, 0, 1,
-1.234625, -1.046661, -2.953929, 1, 0.6196079, 0, 1,
-1.230414, 0.02030593, -0.4901659, 1, 0.6235294, 0, 1,
-1.224632, 1.17561, -0.9135346, 1, 0.6313726, 0, 1,
-1.219063, 0.9110364, -0.06829506, 1, 0.6352941, 0, 1,
-1.19645, -1.19828, -1.263299, 1, 0.6431373, 0, 1,
-1.193494, -0.3337648, -2.748288, 1, 0.6470588, 0, 1,
-1.182905, -0.5235528, 0.6524852, 1, 0.654902, 0, 1,
-1.181368, -1.163588, -0.4981134, 1, 0.6588235, 0, 1,
-1.180227, -0.6721202, -1.95058, 1, 0.6666667, 0, 1,
-1.162971, 0.6870225, -1.496808, 1, 0.6705883, 0, 1,
-1.156515, -0.8135882, -1.707827, 1, 0.6784314, 0, 1,
-1.15512, -0.5799842, -1.470382, 1, 0.682353, 0, 1,
-1.150756, 1.508123, -0.1086237, 1, 0.6901961, 0, 1,
-1.14021, -0.7097126, -2.554365, 1, 0.6941177, 0, 1,
-1.134805, -1.532311, -3.426321, 1, 0.7019608, 0, 1,
-1.131195, 1.684763, -0.5475647, 1, 0.7098039, 0, 1,
-1.122274, 0.2591797, -0.7669634, 1, 0.7137255, 0, 1,
-1.106967, 0.3770154, -1.155635, 1, 0.7215686, 0, 1,
-1.094446, 0.7459622, -0.9697368, 1, 0.7254902, 0, 1,
-1.094379, -0.3986258, -1.744659, 1, 0.7333333, 0, 1,
-1.087083, -0.5525554, -1.365791, 1, 0.7372549, 0, 1,
-1.082217, -0.7200485, -1.672842, 1, 0.7450981, 0, 1,
-1.067474, 0.2004427, -3.138117, 1, 0.7490196, 0, 1,
-1.066622, 0.1019351, -0.2733299, 1, 0.7568628, 0, 1,
-1.065633, 2.59812, 0.4352758, 1, 0.7607843, 0, 1,
-1.064203, -0.26486, -3.509445, 1, 0.7686275, 0, 1,
-1.061484, 0.7675932, 0.01437387, 1, 0.772549, 0, 1,
-1.057128, 0.5011972, -1.150938, 1, 0.7803922, 0, 1,
-1.055267, -0.3735022, -1.289538, 1, 0.7843137, 0, 1,
-1.052638, 1.386348, -1.642163, 1, 0.7921569, 0, 1,
-1.051702, -0.07216994, -3.235274, 1, 0.7960784, 0, 1,
-1.048434, -0.8079514, -1.759559, 1, 0.8039216, 0, 1,
-1.043006, 1.254519, -0.6285573, 1, 0.8117647, 0, 1,
-1.030532, -0.2412518, -2.409715, 1, 0.8156863, 0, 1,
-1.025154, 0.3370743, -2.063506, 1, 0.8235294, 0, 1,
-1.023945, 0.3089602, -1.416041, 1, 0.827451, 0, 1,
-1.020266, -2.383464, -3.12156, 1, 0.8352941, 0, 1,
-1.012973, -0.2013139, -2.267599, 1, 0.8392157, 0, 1,
-1.010934, -0.3335827, -3.464139, 1, 0.8470588, 0, 1,
-1.007739, 0.1525414, -1.325089, 1, 0.8509804, 0, 1,
-1.004071, 0.07623326, 0.793551, 1, 0.8588235, 0, 1,
-0.9998299, -1.028997, -2.943424, 1, 0.8627451, 0, 1,
-0.9873647, -0.7680346, -1.026064, 1, 0.8705882, 0, 1,
-0.9860099, 0.155852, -1.940396, 1, 0.8745098, 0, 1,
-0.9805101, 0.584953, -2.368504, 1, 0.8823529, 0, 1,
-0.9794552, 0.2002092, 0.06896152, 1, 0.8862745, 0, 1,
-0.9770265, 0.05624589, -1.20556, 1, 0.8941177, 0, 1,
-0.969445, 1.451223, 1.022959, 1, 0.8980392, 0, 1,
-0.9691001, -1.082847, -1.768495, 1, 0.9058824, 0, 1,
-0.9683257, -0.5622599, -0.7030653, 1, 0.9137255, 0, 1,
-0.9538567, 1.876439, -0.490793, 1, 0.9176471, 0, 1,
-0.9479323, -0.6773457, -1.65819, 1, 0.9254902, 0, 1,
-0.9469101, 1.177605, -0.1067786, 1, 0.9294118, 0, 1,
-0.9409961, -0.3906482, -1.040682, 1, 0.9372549, 0, 1,
-0.9400724, 1.088673, -0.3202152, 1, 0.9411765, 0, 1,
-0.9400255, 0.6051006, -1.966048, 1, 0.9490196, 0, 1,
-0.9396208, 1.783266, -0.07367545, 1, 0.9529412, 0, 1,
-0.9363177, 0.06648607, -3.451626, 1, 0.9607843, 0, 1,
-0.9348083, 1.269371, -1.211265, 1, 0.9647059, 0, 1,
-0.9274926, 1.060207, -1.741815, 1, 0.972549, 0, 1,
-0.9252633, -0.3516107, -0.4117547, 1, 0.9764706, 0, 1,
-0.9237595, 0.5272807, -1.01842, 1, 0.9843137, 0, 1,
-0.9235946, 0.4057669, 0.9202995, 1, 0.9882353, 0, 1,
-0.9228972, 0.2938714, 0.1651126, 1, 0.9960784, 0, 1,
-0.9220893, 0.4775488, -1.722532, 0.9960784, 1, 0, 1,
-0.9146037, 0.07961384, -1.585315, 0.9921569, 1, 0, 1,
-0.9054398, -1.038873, -3.176543, 0.9843137, 1, 0, 1,
-0.9031474, -0.4857476, -4.064995, 0.9803922, 1, 0, 1,
-0.9018743, 0.5471052, -0.2969196, 0.972549, 1, 0, 1,
-0.8966839, 0.3732943, 0.813188, 0.9686275, 1, 0, 1,
-0.8955821, -0.2743267, -1.742505, 0.9607843, 1, 0, 1,
-0.8911532, 0.09842296, 0.0775086, 0.9568627, 1, 0, 1,
-0.8838021, -0.6005938, -2.795226, 0.9490196, 1, 0, 1,
-0.878805, -0.3302185, -0.7518294, 0.945098, 1, 0, 1,
-0.8763643, 1.7686, 0.9240526, 0.9372549, 1, 0, 1,
-0.8707734, -0.6158252, -2.418244, 0.9333333, 1, 0, 1,
-0.8627456, -0.3197709, -0.4709349, 0.9254902, 1, 0, 1,
-0.8588216, -2.467089, -2.81591, 0.9215686, 1, 0, 1,
-0.8571185, -0.1486502, -0.1213998, 0.9137255, 1, 0, 1,
-0.8543761, 0.04796836, 0.5311145, 0.9098039, 1, 0, 1,
-0.85364, 1.120749, -1.228502, 0.9019608, 1, 0, 1,
-0.8450677, -0.08280431, -1.65436, 0.8941177, 1, 0, 1,
-0.8341666, 1.481373, -0.4705465, 0.8901961, 1, 0, 1,
-0.8324788, -0.08579382, -3.616875, 0.8823529, 1, 0, 1,
-0.8297992, 1.580246, -0.8921463, 0.8784314, 1, 0, 1,
-0.8222765, -0.06894498, -2.631274, 0.8705882, 1, 0, 1,
-0.8162664, -0.8119897, -3.396771, 0.8666667, 1, 0, 1,
-0.8159247, 0.6159039, -2.580905, 0.8588235, 1, 0, 1,
-0.8111848, -0.3328849, -1.298504, 0.854902, 1, 0, 1,
-0.8106309, 0.9332538, -1.187011, 0.8470588, 1, 0, 1,
-0.8078406, 1.744741, -1.972981, 0.8431373, 1, 0, 1,
-0.8061984, 1.304093, 0.4678488, 0.8352941, 1, 0, 1,
-0.805532, 2.355909, -0.6281995, 0.8313726, 1, 0, 1,
-0.8044215, 0.5478774, -1.228422, 0.8235294, 1, 0, 1,
-0.7885163, 0.2498143, -1.666756, 0.8196079, 1, 0, 1,
-0.7848524, 1.856377, -0.5088168, 0.8117647, 1, 0, 1,
-0.783619, -0.3733527, -1.500103, 0.8078431, 1, 0, 1,
-0.7776812, -0.857645, -2.45031, 0.8, 1, 0, 1,
-0.773534, -0.5355104, -1.599684, 0.7921569, 1, 0, 1,
-0.7705941, 1.291375, -1.552821, 0.7882353, 1, 0, 1,
-0.7681892, 0.8749204, 0.5140071, 0.7803922, 1, 0, 1,
-0.7626504, -2.082066, -1.660671, 0.7764706, 1, 0, 1,
-0.7591423, -0.8848484, -3.156655, 0.7686275, 1, 0, 1,
-0.7537296, -0.2766331, -1.75011, 0.7647059, 1, 0, 1,
-0.7488103, -0.40407, -1.498309, 0.7568628, 1, 0, 1,
-0.7475882, 2.501978, -0.9049021, 0.7529412, 1, 0, 1,
-0.7427238, 0.1315883, -2.062219, 0.7450981, 1, 0, 1,
-0.7414747, 0.495346, -0.5167983, 0.7411765, 1, 0, 1,
-0.732602, -1.034615, -2.831375, 0.7333333, 1, 0, 1,
-0.7315502, 0.3157966, -0.9574305, 0.7294118, 1, 0, 1,
-0.7304029, -0.7035783, -3.169861, 0.7215686, 1, 0, 1,
-0.7276228, 0.6150635, -1.915001, 0.7176471, 1, 0, 1,
-0.7244753, -0.4695666, -1.558825, 0.7098039, 1, 0, 1,
-0.7239195, -0.3812417, -3.145791, 0.7058824, 1, 0, 1,
-0.721302, -0.3990437, -1.436931, 0.6980392, 1, 0, 1,
-0.7196843, -0.2469288, -2.116977, 0.6901961, 1, 0, 1,
-0.7181047, 0.05474257, -1.14083, 0.6862745, 1, 0, 1,
-0.7148509, -0.7776345, -0.9250208, 0.6784314, 1, 0, 1,
-0.7134119, 0.4911656, -0.7591509, 0.6745098, 1, 0, 1,
-0.7101412, 1.233632, 0.6041548, 0.6666667, 1, 0, 1,
-0.706533, 3.00877, 0.775239, 0.6627451, 1, 0, 1,
-0.7051398, -0.0741961, -0.952017, 0.654902, 1, 0, 1,
-0.6996896, 1.47427, -0.3017211, 0.6509804, 1, 0, 1,
-0.6850684, -0.3238342, -3.392483, 0.6431373, 1, 0, 1,
-0.6847099, -1.889236, -3.013068, 0.6392157, 1, 0, 1,
-0.6833536, 1.654629, 0.07792063, 0.6313726, 1, 0, 1,
-0.6833387, -0.2477495, -3.035015, 0.627451, 1, 0, 1,
-0.6735696, -0.8932067, -2.107244, 0.6196079, 1, 0, 1,
-0.6676149, 1.304643, 0.2338723, 0.6156863, 1, 0, 1,
-0.66597, -0.9845214, -2.297353, 0.6078432, 1, 0, 1,
-0.6656228, 0.3787747, -1.77143, 0.6039216, 1, 0, 1,
-0.6635872, 0.8759839, -0.7070445, 0.5960785, 1, 0, 1,
-0.6625094, -1.508834, -4.638359, 0.5882353, 1, 0, 1,
-0.6588026, 0.7135817, -1.325741, 0.5843138, 1, 0, 1,
-0.6530179, -0.5209001, -2.20271, 0.5764706, 1, 0, 1,
-0.6520793, 0.5610752, 0.7539032, 0.572549, 1, 0, 1,
-0.651529, -0.693248, -3.515843, 0.5647059, 1, 0, 1,
-0.6505402, 0.1588014, -1.978575, 0.5607843, 1, 0, 1,
-0.6474444, 2.39293, 1.05568, 0.5529412, 1, 0, 1,
-0.647433, -0.5616031, -2.074578, 0.5490196, 1, 0, 1,
-0.6416652, 0.172992, -2.08285, 0.5411765, 1, 0, 1,
-0.6405916, 0.7905454, 0.3951358, 0.5372549, 1, 0, 1,
-0.6387072, -1.467319, -3.32121, 0.5294118, 1, 0, 1,
-0.6373228, 1.375603, 1.065813, 0.5254902, 1, 0, 1,
-0.6331033, 0.6487705, -2.261021, 0.5176471, 1, 0, 1,
-0.627911, 1.520828, 0.3501548, 0.5137255, 1, 0, 1,
-0.6271052, -0.804661, -3.630701, 0.5058824, 1, 0, 1,
-0.6259176, 0.3728169, -0.2349085, 0.5019608, 1, 0, 1,
-0.6244268, 0.4201485, -1.067669, 0.4941176, 1, 0, 1,
-0.617376, 0.5124108, -0.4680411, 0.4862745, 1, 0, 1,
-0.6140472, 0.4426365, 0.4684179, 0.4823529, 1, 0, 1,
-0.6134619, -0.006272296, -1.846011, 0.4745098, 1, 0, 1,
-0.6128004, -0.5334205, -2.602514, 0.4705882, 1, 0, 1,
-0.6079326, -0.2107597, -0.1600677, 0.4627451, 1, 0, 1,
-0.6075457, -0.1233831, -0.8241869, 0.4588235, 1, 0, 1,
-0.6070601, -1.162346, -2.445918, 0.4509804, 1, 0, 1,
-0.6047747, -0.6043999, -3.487037, 0.4470588, 1, 0, 1,
-0.6040418, -1.026921, -2.900109, 0.4392157, 1, 0, 1,
-0.6035832, 1.015035, -1.274149, 0.4352941, 1, 0, 1,
-0.6029404, -0.7613089, -2.868752, 0.427451, 1, 0, 1,
-0.5965269, 0.4007269, -0.4928333, 0.4235294, 1, 0, 1,
-0.5901649, -0.29772, -2.47604, 0.4156863, 1, 0, 1,
-0.5852639, -0.3718368, -2.322324, 0.4117647, 1, 0, 1,
-0.5845557, 0.2158072, -0.3057686, 0.4039216, 1, 0, 1,
-0.5825135, 0.5050746, -0.3616326, 0.3960784, 1, 0, 1,
-0.5809585, 0.8415236, -1.661342, 0.3921569, 1, 0, 1,
-0.5715968, -1.461411, -3.72616, 0.3843137, 1, 0, 1,
-0.566219, -0.1557747, -0.1802568, 0.3803922, 1, 0, 1,
-0.5597773, -2.433787, -2.433165, 0.372549, 1, 0, 1,
-0.5470631, 0.5917633, -0.6916812, 0.3686275, 1, 0, 1,
-0.544901, -1.384607, -2.172681, 0.3607843, 1, 0, 1,
-0.5431519, 1.260438, -0.4587221, 0.3568628, 1, 0, 1,
-0.5389244, -1.219195, -1.865381, 0.3490196, 1, 0, 1,
-0.5349022, 1.556412, 1.508113, 0.345098, 1, 0, 1,
-0.5289212, 1.554484, -0.9328774, 0.3372549, 1, 0, 1,
-0.5229108, -0.6568136, -2.987066, 0.3333333, 1, 0, 1,
-0.5219188, -0.1653565, -2.675566, 0.3254902, 1, 0, 1,
-0.5207329, -0.380407, -0.901415, 0.3215686, 1, 0, 1,
-0.5206693, -1.689601, -4.124086, 0.3137255, 1, 0, 1,
-0.5197904, -0.9801203, -2.636705, 0.3098039, 1, 0, 1,
-0.5190921, 1.304956, -0.909212, 0.3019608, 1, 0, 1,
-0.5166954, -0.9285012, -2.280753, 0.2941177, 1, 0, 1,
-0.514257, -0.2892939, -1.236439, 0.2901961, 1, 0, 1,
-0.51325, 0.4485989, -1.073445, 0.282353, 1, 0, 1,
-0.5113094, -0.472609, -3.248267, 0.2784314, 1, 0, 1,
-0.5111418, 0.5579969, 0.06360311, 0.2705882, 1, 0, 1,
-0.5038571, -0.2626588, -1.902765, 0.2666667, 1, 0, 1,
-0.5017576, -0.4754472, -3.018103, 0.2588235, 1, 0, 1,
-0.5002674, -2.035182, -3.541308, 0.254902, 1, 0, 1,
-0.4991749, 0.7160639, -1.493795, 0.2470588, 1, 0, 1,
-0.4978281, -1.672018, -1.470303, 0.2431373, 1, 0, 1,
-0.495663, 1.34139, -0.8625286, 0.2352941, 1, 0, 1,
-0.4891751, -0.4352379, -0.8348184, 0.2313726, 1, 0, 1,
-0.4881044, 1.842369, -1.113694, 0.2235294, 1, 0, 1,
-0.4877569, -0.5562851, -3.574794, 0.2196078, 1, 0, 1,
-0.4862969, 0.2652906, -1.11835, 0.2117647, 1, 0, 1,
-0.4860857, 0.6906495, 0.8955513, 0.2078431, 1, 0, 1,
-0.4837486, 0.1520221, -2.859708, 0.2, 1, 0, 1,
-0.4775905, -0.5450323, -3.984979, 0.1921569, 1, 0, 1,
-0.4770958, 2.043723, -1.825192, 0.1882353, 1, 0, 1,
-0.4727165, -1.564945, -4.943953, 0.1803922, 1, 0, 1,
-0.4721068, -2.122119, -3.557149, 0.1764706, 1, 0, 1,
-0.4702686, 1.173752, -0.580485, 0.1686275, 1, 0, 1,
-0.4697064, 0.5714372, 0.8838714, 0.1647059, 1, 0, 1,
-0.4692842, 2.643964, -0.1980125, 0.1568628, 1, 0, 1,
-0.4655934, 0.2300406, -0.5275382, 0.1529412, 1, 0, 1,
-0.4642937, 1.527514, -0.3129093, 0.145098, 1, 0, 1,
-0.4602327, 0.203963, -0.8532044, 0.1411765, 1, 0, 1,
-0.4579026, 1.034314, -0.2505007, 0.1333333, 1, 0, 1,
-0.4569666, 0.9747737, -1.061938, 0.1294118, 1, 0, 1,
-0.4542843, 0.8645687, -0.8030344, 0.1215686, 1, 0, 1,
-0.4509264, 1.266188, -0.8065086, 0.1176471, 1, 0, 1,
-0.4479811, 0.05804028, -2.035053, 0.1098039, 1, 0, 1,
-0.4479105, 1.164908, -0.02353108, 0.1058824, 1, 0, 1,
-0.4435336, 0.04840731, -1.868922, 0.09803922, 1, 0, 1,
-0.4410987, 1.54147, -0.0877858, 0.09019608, 1, 0, 1,
-0.4404692, 2.254945, -0.6106981, 0.08627451, 1, 0, 1,
-0.4401639, -0.3343703, -2.952534, 0.07843138, 1, 0, 1,
-0.4397969, -0.4063301, -1.403164, 0.07450981, 1, 0, 1,
-0.4393618, 1.863213, 0.8891909, 0.06666667, 1, 0, 1,
-0.4381085, 2.588581, -0.223083, 0.0627451, 1, 0, 1,
-0.4353096, 0.2139594, -1.20601, 0.05490196, 1, 0, 1,
-0.4307332, -1.469504, -3.010868, 0.05098039, 1, 0, 1,
-0.4275433, 0.12114, -2.340983, 0.04313726, 1, 0, 1,
-0.4275272, 0.1239459, -0.7748564, 0.03921569, 1, 0, 1,
-0.4264051, 0.4451206, -0.4743209, 0.03137255, 1, 0, 1,
-0.4059427, -0.09864877, -0.5742863, 0.02745098, 1, 0, 1,
-0.4045301, -2.121979, -2.626534, 0.01960784, 1, 0, 1,
-0.4031862, -0.2406661, -0.5089937, 0.01568628, 1, 0, 1,
-0.3990876, 0.2878583, -4.040061, 0.007843138, 1, 0, 1,
-0.3914418, 0.8171443, -0.3865663, 0.003921569, 1, 0, 1,
-0.3885405, 0.1652421, -0.1081788, 0, 1, 0.003921569, 1,
-0.3871408, 0.7299144, -1.813711, 0, 1, 0.01176471, 1,
-0.380159, -2.054642, -2.92948, 0, 1, 0.01568628, 1,
-0.3784278, 0.344897, -2.279394, 0, 1, 0.02352941, 1,
-0.3767774, 1.274897, -0.2090667, 0, 1, 0.02745098, 1,
-0.3745973, 1.074984, 0.4753401, 0, 1, 0.03529412, 1,
-0.3704844, 0.2927843, -2.112957, 0, 1, 0.03921569, 1,
-0.3693292, 1.296744, -0.7861172, 0, 1, 0.04705882, 1,
-0.3680647, -0.2712654, -2.339441, 0, 1, 0.05098039, 1,
-0.3677519, -1.163654, -3.318649, 0, 1, 0.05882353, 1,
-0.3668413, -0.7874647, -1.311664, 0, 1, 0.0627451, 1,
-0.3638617, 0.7893393, -1.246488, 0, 1, 0.07058824, 1,
-0.360015, -1.312008, -0.9800467, 0, 1, 0.07450981, 1,
-0.3588042, -0.3961139, -0.6710485, 0, 1, 0.08235294, 1,
-0.3570586, -0.52139, -1.997018, 0, 1, 0.08627451, 1,
-0.3569917, -1.117409, -1.011793, 0, 1, 0.09411765, 1,
-0.3539244, 0.1657504, -1.783288, 0, 1, 0.1019608, 1,
-0.3534894, -1.933805, -3.667486, 0, 1, 0.1058824, 1,
-0.3522005, -1.639862, -3.560903, 0, 1, 0.1137255, 1,
-0.352025, 0.7499334, 1.004871, 0, 1, 0.1176471, 1,
-0.3495602, -1.253958, -4.143837, 0, 1, 0.1254902, 1,
-0.3484373, 0.2159375, -0.8648867, 0, 1, 0.1294118, 1,
-0.3472897, 2.928484, -0.7729489, 0, 1, 0.1372549, 1,
-0.3456038, -0.5084502, -2.704071, 0, 1, 0.1411765, 1,
-0.3440244, -0.0527708, -2.051726, 0, 1, 0.1490196, 1,
-0.3352382, 0.7288306, -1.552106, 0, 1, 0.1529412, 1,
-0.3293069, -0.2963726, -2.624522, 0, 1, 0.1607843, 1,
-0.3244404, 1.625232, 0.5165446, 0, 1, 0.1647059, 1,
-0.3236909, 0.2305928, 1.183523, 0, 1, 0.172549, 1,
-0.321247, -0.4350361, -2.085781, 0, 1, 0.1764706, 1,
-0.3209941, -0.1396174, -1.73475, 0, 1, 0.1843137, 1,
-0.3167703, 1.245919, -0.757051, 0, 1, 0.1882353, 1,
-0.3114183, -0.5561264, -2.572491, 0, 1, 0.1960784, 1,
-0.3089264, -0.1827087, -1.709695, 0, 1, 0.2039216, 1,
-0.298783, 0.4147342, -1.137911, 0, 1, 0.2078431, 1,
-0.2975483, 0.8553471, -3.073076, 0, 1, 0.2156863, 1,
-0.2936397, -1.29591, -1.623541, 0, 1, 0.2196078, 1,
-0.2921086, -0.229404, -3.194058, 0, 1, 0.227451, 1,
-0.2825083, 0.4940944, 0.006664371, 0, 1, 0.2313726, 1,
-0.2820184, 2.039945, -1.146185, 0, 1, 0.2392157, 1,
-0.2804113, -0.5440594, -3.48658, 0, 1, 0.2431373, 1,
-0.2732807, 0.1715367, 0.1136188, 0, 1, 0.2509804, 1,
-0.2721981, -0.8605048, -1.563544, 0, 1, 0.254902, 1,
-0.2705968, -0.5603736, -3.675327, 0, 1, 0.2627451, 1,
-0.2704087, -0.4013362, -2.711339, 0, 1, 0.2666667, 1,
-0.2677276, 0.761142, 0.6809748, 0, 1, 0.2745098, 1,
-0.2660744, -0.00154239, -1.492687, 0, 1, 0.2784314, 1,
-0.2605908, 0.6098081, -0.05950222, 0, 1, 0.2862745, 1,
-0.2600182, -1.546882, -4.034105, 0, 1, 0.2901961, 1,
-0.2571021, -1.682312, -1.420852, 0, 1, 0.2980392, 1,
-0.2544737, -1.055489, -3.763055, 0, 1, 0.3058824, 1,
-0.2541782, 1.904411, -0.9324817, 0, 1, 0.3098039, 1,
-0.253663, -0.5406963, -3.284753, 0, 1, 0.3176471, 1,
-0.2523889, -1.316589, -2.891138, 0, 1, 0.3215686, 1,
-0.2471211, 1.225811, -0.3935497, 0, 1, 0.3294118, 1,
-0.244827, -1.369025, -2.493035, 0, 1, 0.3333333, 1,
-0.2434034, 0.5649607, -0.6839007, 0, 1, 0.3411765, 1,
-0.2390935, -0.2969514, -2.220743, 0, 1, 0.345098, 1,
-0.2360511, -1.186893, -2.870053, 0, 1, 0.3529412, 1,
-0.2338777, -2.026091, -5.320217, 0, 1, 0.3568628, 1,
-0.2325365, -1.83671, -2.14019, 0, 1, 0.3647059, 1,
-0.2283801, -0.7903644, -3.268665, 0, 1, 0.3686275, 1,
-0.2236193, -2.130738, -3.063943, 0, 1, 0.3764706, 1,
-0.2210536, -0.08873895, -1.654581, 0, 1, 0.3803922, 1,
-0.2198202, 0.04307044, -1.313544, 0, 1, 0.3882353, 1,
-0.2182758, -0.1343013, -2.860614, 0, 1, 0.3921569, 1,
-0.2135998, -0.03047585, -0.831372, 0, 1, 0.4, 1,
-0.2120117, 1.401458, 0.2851346, 0, 1, 0.4078431, 1,
-0.2118059, 0.5384518, -0.2994971, 0, 1, 0.4117647, 1,
-0.2115642, 0.06383394, 1.413927, 0, 1, 0.4196078, 1,
-0.2044133, 0.3780092, -1.028442, 0, 1, 0.4235294, 1,
-0.2001351, -1.150367, -2.625112, 0, 1, 0.4313726, 1,
-0.1966216, 1.787356, -1.461382, 0, 1, 0.4352941, 1,
-0.1965352, 1.076573, -1.542863, 0, 1, 0.4431373, 1,
-0.1954027, 1.648607, -0.2482446, 0, 1, 0.4470588, 1,
-0.1866263, 1.469601, 0.626038, 0, 1, 0.454902, 1,
-0.1864365, -0.2202022, -2.494374, 0, 1, 0.4588235, 1,
-0.1855907, -0.4222409, -1.426037, 0, 1, 0.4666667, 1,
-0.1769299, 1.471515, 0.5810528, 0, 1, 0.4705882, 1,
-0.1746427, -1.254839, -3.502347, 0, 1, 0.4784314, 1,
-0.173847, -1.090547, -4.122911, 0, 1, 0.4823529, 1,
-0.1680683, 0.8704903, -0.6740158, 0, 1, 0.4901961, 1,
-0.1672158, 0.5663009, -0.7855501, 0, 1, 0.4941176, 1,
-0.164612, -0.9410756, -4.276766, 0, 1, 0.5019608, 1,
-0.1623566, 1.497595, 0.4365815, 0, 1, 0.509804, 1,
-0.1593275, -1.112946, -2.936055, 0, 1, 0.5137255, 1,
-0.1483205, -0.5946192, -3.431697, 0, 1, 0.5215687, 1,
-0.1465199, -0.2773774, -3.995039, 0, 1, 0.5254902, 1,
-0.1430276, -0.8326791, -4.701405, 0, 1, 0.5333334, 1,
-0.1426921, 0.4883505, -0.9768302, 0, 1, 0.5372549, 1,
-0.1423662, 0.3444836, -1.268613, 0, 1, 0.5450981, 1,
-0.1390243, 1.568194, 0.7270116, 0, 1, 0.5490196, 1,
-0.1387849, 2.512347, -0.008322154, 0, 1, 0.5568628, 1,
-0.1375951, -0.5077311, -4.915952, 0, 1, 0.5607843, 1,
-0.1341385, -0.2844886, -3.020785, 0, 1, 0.5686275, 1,
-0.134023, 0.572621, -0.3638248, 0, 1, 0.572549, 1,
-0.1315927, -0.8645236, -2.016006, 0, 1, 0.5803922, 1,
-0.1272436, -1.44591, -4.108774, 0, 1, 0.5843138, 1,
-0.1230562, 0.4400083, -1.892764, 0, 1, 0.5921569, 1,
-0.1204882, -0.8205372, -3.399634, 0, 1, 0.5960785, 1,
-0.1179833, -0.9551798, -2.228157, 0, 1, 0.6039216, 1,
-0.1160345, -0.006119158, -1.485129, 0, 1, 0.6117647, 1,
-0.1157281, -0.03125967, -2.007435, 0, 1, 0.6156863, 1,
-0.1152477, 0.3654853, -0.9948397, 0, 1, 0.6235294, 1,
-0.1108239, 0.1269194, -0.3640997, 0, 1, 0.627451, 1,
-0.1084578, -0.2428233, -3.36972, 0, 1, 0.6352941, 1,
-0.1080357, 0.3888699, 0.4912824, 0, 1, 0.6392157, 1,
-0.1078024, 2.652278, 1.330215, 0, 1, 0.6470588, 1,
-0.1020865, 0.1286686, 0.1585642, 0, 1, 0.6509804, 1,
-0.1012224, 0.8329036, 0.2788261, 0, 1, 0.6588235, 1,
-0.1008132, 1.584864, 0.09467214, 0, 1, 0.6627451, 1,
-0.09793332, 0.0636071, 0.2419275, 0, 1, 0.6705883, 1,
-0.09612598, -0.08556537, -3.498215, 0, 1, 0.6745098, 1,
-0.09558152, 0.770683, 0.9946535, 0, 1, 0.682353, 1,
-0.09185201, -0.2104921, -4.189555, 0, 1, 0.6862745, 1,
-0.08098711, 1.241256, -0.3727044, 0, 1, 0.6941177, 1,
-0.07872845, 1.688009, -0.7278746, 0, 1, 0.7019608, 1,
-0.07747743, -1.538904, -3.553542, 0, 1, 0.7058824, 1,
-0.0763459, -0.242039, -2.690194, 0, 1, 0.7137255, 1,
-0.07548224, 0.04814598, -0.4801314, 0, 1, 0.7176471, 1,
-0.06318945, -0.5672452, -0.820834, 0, 1, 0.7254902, 1,
-0.05737455, -1.374829, -3.945204, 0, 1, 0.7294118, 1,
-0.05383441, 0.4129397, -0.6181196, 0, 1, 0.7372549, 1,
-0.04937625, -0.2643915, -3.819473, 0, 1, 0.7411765, 1,
-0.04802579, 1.072936, -1.637404, 0, 1, 0.7490196, 1,
-0.04171829, 2.043674, -0.5376628, 0, 1, 0.7529412, 1,
-0.03708412, 1.763049, 0.5162776, 0, 1, 0.7607843, 1,
-0.03485004, 0.9617065, -0.2492007, 0, 1, 0.7647059, 1,
-0.03358221, -0.5454166, -2.554911, 0, 1, 0.772549, 1,
-0.03357602, -1.14853, -2.963267, 0, 1, 0.7764706, 1,
-0.0308712, 0.3225493, -1.439362, 0, 1, 0.7843137, 1,
-0.03063647, 0.02363685, -0.4730336, 0, 1, 0.7882353, 1,
-0.0255012, 1.218148, 0.4345426, 0, 1, 0.7960784, 1,
-0.02513786, 0.2258077, -1.123574, 0, 1, 0.8039216, 1,
-0.02084803, -0.01869014, -4.163901, 0, 1, 0.8078431, 1,
-0.02039033, -1.065411, -2.625052, 0, 1, 0.8156863, 1,
-0.01978191, 1.231778, -0.3819116, 0, 1, 0.8196079, 1,
-0.0197089, 1.649362, 0.1015237, 0, 1, 0.827451, 1,
-0.01883063, -1.768643, -5.819643, 0, 1, 0.8313726, 1,
-0.01782267, 1.156829, -0.1476041, 0, 1, 0.8392157, 1,
-0.01726197, 0.54807, -1.194661, 0, 1, 0.8431373, 1,
-0.01504302, 0.01233159, -0.4676799, 0, 1, 0.8509804, 1,
-0.009061301, -1.022586, -2.927598, 0, 1, 0.854902, 1,
0.001681345, -0.1803342, 3.67527, 0, 1, 0.8627451, 1,
0.002370445, 0.1554729, -2.060611, 0, 1, 0.8666667, 1,
0.002423369, -0.2530901, 3.440385, 0, 1, 0.8745098, 1,
0.002657617, 0.3207437, -1.238302, 0, 1, 0.8784314, 1,
0.005403852, -0.4942931, 3.518234, 0, 1, 0.8862745, 1,
0.009113361, -0.7563329, 3.146679, 0, 1, 0.8901961, 1,
0.009787953, 0.001469816, 0.3924753, 0, 1, 0.8980392, 1,
0.009841872, -1.546764, 3.624665, 0, 1, 0.9058824, 1,
0.01266325, 1.327266, -1.354285, 0, 1, 0.9098039, 1,
0.01496049, -0.9533743, 2.445581, 0, 1, 0.9176471, 1,
0.01609834, 3.106537, 0.2521725, 0, 1, 0.9215686, 1,
0.01960132, 1.913807, 1.087012, 0, 1, 0.9294118, 1,
0.0233625, -1.527298, 4.652122, 0, 1, 0.9333333, 1,
0.02452664, -1.649397, 2.886034, 0, 1, 0.9411765, 1,
0.02736839, -0.3853936, 4.043034, 0, 1, 0.945098, 1,
0.02789743, -0.4481315, 4.171465, 0, 1, 0.9529412, 1,
0.02906769, 0.3977785, -0.5033368, 0, 1, 0.9568627, 1,
0.0300672, -0.7509873, 3.373703, 0, 1, 0.9647059, 1,
0.03074579, 1.221483, 0.8208711, 0, 1, 0.9686275, 1,
0.03226617, -0.1121246, 3.718714, 0, 1, 0.9764706, 1,
0.03304475, -0.546379, 1.722749, 0, 1, 0.9803922, 1,
0.03340887, -0.4829466, 2.455768, 0, 1, 0.9882353, 1,
0.03534322, 1.222368, 0.8226346, 0, 1, 0.9921569, 1,
0.03739033, -0.1662446, 2.529743, 0, 1, 1, 1,
0.03896815, 0.7774699, 0.2787615, 0, 0.9921569, 1, 1,
0.03921746, 1.155211, -1.194461, 0, 0.9882353, 1, 1,
0.04097526, 1.886786, -0.4807275, 0, 0.9803922, 1, 1,
0.04318666, 0.9313279, 0.806327, 0, 0.9764706, 1, 1,
0.04568118, -0.120632, 1.201874, 0, 0.9686275, 1, 1,
0.04702646, 1.475159, 0.4751814, 0, 0.9647059, 1, 1,
0.04753299, 0.5228537, 1.431482, 0, 0.9568627, 1, 1,
0.04823109, -1.889558, 3.05145, 0, 0.9529412, 1, 1,
0.05158146, 2.143277, -0.1015968, 0, 0.945098, 1, 1,
0.05958638, -1.465581, 2.598892, 0, 0.9411765, 1, 1,
0.06015739, 0.1752507, -2.166644, 0, 0.9333333, 1, 1,
0.06082655, -0.2063047, 3.66626, 0, 0.9294118, 1, 1,
0.0631193, -0.2890374, 5.101131, 0, 0.9215686, 1, 1,
0.06623244, -0.2705223, 4.016545, 0, 0.9176471, 1, 1,
0.07505295, 0.4548257, 1.713805, 0, 0.9098039, 1, 1,
0.07680143, 1.755763, 0.684651, 0, 0.9058824, 1, 1,
0.08244018, -0.2646415, 2.734853, 0, 0.8980392, 1, 1,
0.08374599, -1.191518, 3.808497, 0, 0.8901961, 1, 1,
0.08582386, -0.6120032, 4.596376, 0, 0.8862745, 1, 1,
0.08628549, -0.7898399, 3.350859, 0, 0.8784314, 1, 1,
0.09086131, 0.8720522, -1.050369, 0, 0.8745098, 1, 1,
0.09136299, -0.9913266, 0.4674609, 0, 0.8666667, 1, 1,
0.09530596, 0.5226349, -0.2881389, 0, 0.8627451, 1, 1,
0.09781498, -0.01677073, 1.211837, 0, 0.854902, 1, 1,
0.09928861, -0.7390991, 1.684723, 0, 0.8509804, 1, 1,
0.1005813, 0.3901141, 0.09894291, 0, 0.8431373, 1, 1,
0.1036843, -0.1968586, 3.180687, 0, 0.8392157, 1, 1,
0.1042492, -0.4970694, 3.858526, 0, 0.8313726, 1, 1,
0.1061586, -0.2345411, 2.687838, 0, 0.827451, 1, 1,
0.1130597, 0.09096513, 0.8820674, 0, 0.8196079, 1, 1,
0.1148877, 1.633556, -0.7934227, 0, 0.8156863, 1, 1,
0.1150582, 0.7215195, -0.3339032, 0, 0.8078431, 1, 1,
0.1222287, 0.6691973, -0.0476563, 0, 0.8039216, 1, 1,
0.1294235, -0.05634652, 2.346821, 0, 0.7960784, 1, 1,
0.1326794, -0.00343903, -0.04710343, 0, 0.7882353, 1, 1,
0.1328635, -1.267825, 2.823094, 0, 0.7843137, 1, 1,
0.1344587, 1.331121, 2.455653, 0, 0.7764706, 1, 1,
0.1355159, 0.06512925, 0.3314571, 0, 0.772549, 1, 1,
0.1371731, -0.09124829, 4.816951, 0, 0.7647059, 1, 1,
0.1407134, 0.4432554, 1.469502, 0, 0.7607843, 1, 1,
0.141397, 1.478309, -0.02616169, 0, 0.7529412, 1, 1,
0.1442393, -1.17431, 2.616238, 0, 0.7490196, 1, 1,
0.1467909, -1.064431, 1.333995, 0, 0.7411765, 1, 1,
0.1500103, -0.5235522, 2.801487, 0, 0.7372549, 1, 1,
0.153692, 0.06092109, 1.424614, 0, 0.7294118, 1, 1,
0.1554123, -0.6488722, 2.198976, 0, 0.7254902, 1, 1,
0.1557062, 0.4020632, -0.01315976, 0, 0.7176471, 1, 1,
0.1592391, 0.7319195, -0.0605983, 0, 0.7137255, 1, 1,
0.1607674, -0.1067256, 3.15725, 0, 0.7058824, 1, 1,
0.1615694, 0.7204785, -0.3656928, 0, 0.6980392, 1, 1,
0.1622135, 1.168525, 0.05353158, 0, 0.6941177, 1, 1,
0.1669773, 0.1751109, 2.406245, 0, 0.6862745, 1, 1,
0.1693721, -1.622675, 3.502931, 0, 0.682353, 1, 1,
0.1791542, 1.414627, 0.8128771, 0, 0.6745098, 1, 1,
0.1809295, 0.2498021, -0.02610765, 0, 0.6705883, 1, 1,
0.1823713, 0.09988584, 1.887454, 0, 0.6627451, 1, 1,
0.183961, 0.7588494, -1.025059, 0, 0.6588235, 1, 1,
0.1858269, 1.536869, -0.6589925, 0, 0.6509804, 1, 1,
0.1883699, 0.7679745, 1.782091, 0, 0.6470588, 1, 1,
0.19027, 1.573422, -0.1584595, 0, 0.6392157, 1, 1,
0.1965214, 0.2498058, 1.379777, 0, 0.6352941, 1, 1,
0.1984787, -1.266038, 3.228345, 0, 0.627451, 1, 1,
0.2013176, -0.8258959, 2.535188, 0, 0.6235294, 1, 1,
0.2054654, -1.278855, 3.040862, 0, 0.6156863, 1, 1,
0.2106615, -0.1129308, 1.032976, 0, 0.6117647, 1, 1,
0.2110641, 1.692729, -0.680567, 0, 0.6039216, 1, 1,
0.2140026, 1.11894, -0.3432972, 0, 0.5960785, 1, 1,
0.2144757, 0.4863586, 1.36131, 0, 0.5921569, 1, 1,
0.2152477, -2.104461, 1.563807, 0, 0.5843138, 1, 1,
0.2156339, 1.655074, -0.8708392, 0, 0.5803922, 1, 1,
0.2185609, 2.125201, -1.652353, 0, 0.572549, 1, 1,
0.2261805, 1.154874, 1.072472, 0, 0.5686275, 1, 1,
0.2315265, 1.607106, 0.1824979, 0, 0.5607843, 1, 1,
0.234232, 0.377782, 1.834673, 0, 0.5568628, 1, 1,
0.2343277, -1.390484, 2.902689, 0, 0.5490196, 1, 1,
0.2534688, -0.5388427, 3.245255, 0, 0.5450981, 1, 1,
0.2546523, -0.5249069, 3.107892, 0, 0.5372549, 1, 1,
0.2593151, 0.9072595, 0.5395386, 0, 0.5333334, 1, 1,
0.2655478, -0.859173, 3.34917, 0, 0.5254902, 1, 1,
0.267624, 0.8682911, -0.6484621, 0, 0.5215687, 1, 1,
0.2755585, 0.2025849, -0.8175997, 0, 0.5137255, 1, 1,
0.2768672, 1.447236, 1.742, 0, 0.509804, 1, 1,
0.2785347, 1.212152, -0.4772486, 0, 0.5019608, 1, 1,
0.2794742, 0.5631669, 1.787078, 0, 0.4941176, 1, 1,
0.281104, -0.02575577, 1.542155, 0, 0.4901961, 1, 1,
0.285014, -1.076979, 1.794772, 0, 0.4823529, 1, 1,
0.2916804, -0.8512288, 3.616715, 0, 0.4784314, 1, 1,
0.2936715, -2.216508, 2.631962, 0, 0.4705882, 1, 1,
0.2951893, 0.4300188, 0.04452543, 0, 0.4666667, 1, 1,
0.2967798, -1.461724, 3.06798, 0, 0.4588235, 1, 1,
0.3042616, -0.7420266, 5.407761, 0, 0.454902, 1, 1,
0.3052205, -0.4682615, 1.908391, 0, 0.4470588, 1, 1,
0.3102751, 1.446572, 2.079222, 0, 0.4431373, 1, 1,
0.3227232, 0.1930704, 0.07442385, 0, 0.4352941, 1, 1,
0.323124, -0.8396217, 2.98315, 0, 0.4313726, 1, 1,
0.326724, 0.01018095, 2.657846, 0, 0.4235294, 1, 1,
0.3270505, -0.9345133, 4.388062, 0, 0.4196078, 1, 1,
0.3273841, 0.2236364, -0.5650373, 0, 0.4117647, 1, 1,
0.3281907, -0.1519773, 0.4480162, 0, 0.4078431, 1, 1,
0.3334037, 0.5275611, 0.852934, 0, 0.4, 1, 1,
0.3356703, -0.9722868, 1.563355, 0, 0.3921569, 1, 1,
0.3369548, -1.688221, 3.565154, 0, 0.3882353, 1, 1,
0.3392271, 2.52914, -1.115825, 0, 0.3803922, 1, 1,
0.3445691, 0.6506692, 0.1162071, 0, 0.3764706, 1, 1,
0.3450912, 0.5358776, -1.074976, 0, 0.3686275, 1, 1,
0.3468384, 0.1085712, 1.856883, 0, 0.3647059, 1, 1,
0.3480906, -0.9720881, 3.768282, 0, 0.3568628, 1, 1,
0.3491031, 0.5547085, 0.4401148, 0, 0.3529412, 1, 1,
0.3494119, -1.510626, 0.9946144, 0, 0.345098, 1, 1,
0.3505668, 2.152468, -1.792667, 0, 0.3411765, 1, 1,
0.3509357, 1.72246, -1.428615, 0, 0.3333333, 1, 1,
0.3585424, 1.401815, -0.619749, 0, 0.3294118, 1, 1,
0.3604242, -1.014663, 4.288229, 0, 0.3215686, 1, 1,
0.3612635, 0.7745452, -0.6186857, 0, 0.3176471, 1, 1,
0.3616527, -0.9150389, 3.030489, 0, 0.3098039, 1, 1,
0.3639773, 0.5544655, 1.661694, 0, 0.3058824, 1, 1,
0.367835, -0.9163794, 3.419357, 0, 0.2980392, 1, 1,
0.3685553, 1.499068, -0.3316759, 0, 0.2901961, 1, 1,
0.3762583, -1.349415, 3.712345, 0, 0.2862745, 1, 1,
0.376314, 1.925698, 1.277138, 0, 0.2784314, 1, 1,
0.3763758, 1.778344, 0.5885141, 0, 0.2745098, 1, 1,
0.3806999, -0.1670395, 2.256423, 0, 0.2666667, 1, 1,
0.3814226, 0.5800846, 1.246945, 0, 0.2627451, 1, 1,
0.3824958, -0.6873185, 2.76811, 0, 0.254902, 1, 1,
0.3830931, 0.7944525, 0.7350274, 0, 0.2509804, 1, 1,
0.383284, -0.7927901, 2.572371, 0, 0.2431373, 1, 1,
0.3857087, 1.770093, -1.267253, 0, 0.2392157, 1, 1,
0.3917322, 0.131951, 3.237663, 0, 0.2313726, 1, 1,
0.3975075, -0.2016734, 1.27563, 0, 0.227451, 1, 1,
0.3981427, 0.678546, 0.1539123, 0, 0.2196078, 1, 1,
0.3983186, -1.366854, 3.163291, 0, 0.2156863, 1, 1,
0.4056608, 0.7797129, 0.471006, 0, 0.2078431, 1, 1,
0.4095673, 0.1040211, 2.095749, 0, 0.2039216, 1, 1,
0.416601, -0.3109286, -0.6107965, 0, 0.1960784, 1, 1,
0.417376, 0.8310108, 0.08590446, 0, 0.1882353, 1, 1,
0.4189548, 0.3099958, 0.5441452, 0, 0.1843137, 1, 1,
0.4206526, 0.1879649, 2.512953, 0, 0.1764706, 1, 1,
0.4209816, -0.2567316, 1.344768, 0, 0.172549, 1, 1,
0.4220848, -2.194536, 3.941853, 0, 0.1647059, 1, 1,
0.4227327, -2.470666, 1.574902, 0, 0.1607843, 1, 1,
0.4246242, -2.504879, 1.835716, 0, 0.1529412, 1, 1,
0.429074, 1.173749, -0.8232888, 0, 0.1490196, 1, 1,
0.431504, -0.3367015, 1.057943, 0, 0.1411765, 1, 1,
0.4328857, -0.6253586, 1.89847, 0, 0.1372549, 1, 1,
0.4328942, 0.3700767, -1.887883, 0, 0.1294118, 1, 1,
0.4336775, 0.6921851, -0.1197875, 0, 0.1254902, 1, 1,
0.4371748, 0.187691, 2.945678, 0, 0.1176471, 1, 1,
0.4393683, -1.06895, 3.30837, 0, 0.1137255, 1, 1,
0.4415576, 1.31798, -0.07819907, 0, 0.1058824, 1, 1,
0.4444535, 0.02779691, 1.319318, 0, 0.09803922, 1, 1,
0.4503276, -1.840814, 3.397892, 0, 0.09411765, 1, 1,
0.4521489, 1.359355, -1.409362, 0, 0.08627451, 1, 1,
0.4568971, -0.1012293, 1.446277, 0, 0.08235294, 1, 1,
0.4625812, 0.6617203, 1.102232, 0, 0.07450981, 1, 1,
0.4676258, 1.43873, -0.01655282, 0, 0.07058824, 1, 1,
0.4689235, 0.1821651, -1.381025, 0, 0.0627451, 1, 1,
0.4698157, -0.3591838, 1.635959, 0, 0.05882353, 1, 1,
0.4741725, -0.2553599, 2.923559, 0, 0.05098039, 1, 1,
0.4859416, -1.351145, 1.547366, 0, 0.04705882, 1, 1,
0.4871118, 1.023959, 0.7662625, 0, 0.03921569, 1, 1,
0.4915873, -0.749908, 2.591021, 0, 0.03529412, 1, 1,
0.5077983, -0.5610493, 3.890796, 0, 0.02745098, 1, 1,
0.5084581, -1.458132, 3.231449, 0, 0.02352941, 1, 1,
0.5089638, -0.03332846, 1.592202, 0, 0.01568628, 1, 1,
0.5109948, 0.2291758, 0.6419466, 0, 0.01176471, 1, 1,
0.5138276, 1.493164, 0.801057, 0, 0.003921569, 1, 1,
0.5145112, 0.8668357, -0.5949522, 0.003921569, 0, 1, 1,
0.5153481, -1.366915, 2.912177, 0.007843138, 0, 1, 1,
0.5182897, 0.3629859, 1.631087, 0.01568628, 0, 1, 1,
0.5186899, -0.934209, 2.346394, 0.01960784, 0, 1, 1,
0.5193283, -0.3821976, 1.713847, 0.02745098, 0, 1, 1,
0.5208982, -0.9411313, 3.517539, 0.03137255, 0, 1, 1,
0.5212318, 0.5103225, -0.6017633, 0.03921569, 0, 1, 1,
0.5284945, 0.9494545, 1.160855, 0.04313726, 0, 1, 1,
0.5322496, 1.414225, -0.455, 0.05098039, 0, 1, 1,
0.5333158, 0.6797814, 0.2381238, 0.05490196, 0, 1, 1,
0.5349372, -0.5461593, 2.545772, 0.0627451, 0, 1, 1,
0.5363918, 0.4858126, -1.155326, 0.06666667, 0, 1, 1,
0.5373836, -0.4381095, 1.470423, 0.07450981, 0, 1, 1,
0.5378138, 0.9890183, 0.9221714, 0.07843138, 0, 1, 1,
0.5438316, 0.896397, -1.363138, 0.08627451, 0, 1, 1,
0.5563217, 0.6802703, 1.730351, 0.09019608, 0, 1, 1,
0.5610989, -0.3267325, 2.36411, 0.09803922, 0, 1, 1,
0.5643167, -0.3697778, 2.47153, 0.1058824, 0, 1, 1,
0.568377, 1.297824, 0.5603197, 0.1098039, 0, 1, 1,
0.5728279, -1.468524, 2.024102, 0.1176471, 0, 1, 1,
0.5768199, 0.4188006, 1.443683, 0.1215686, 0, 1, 1,
0.5771568, 1.444137, 0.7659633, 0.1294118, 0, 1, 1,
0.5805608, 0.2573844, 1.377367, 0.1333333, 0, 1, 1,
0.5810893, 1.817003, 1.471437, 0.1411765, 0, 1, 1,
0.5814115, -0.5918965, 0.9624538, 0.145098, 0, 1, 1,
0.5838854, 0.8119031, 1.16894, 0.1529412, 0, 1, 1,
0.5971368, 0.5418613, 0.3806569, 0.1568628, 0, 1, 1,
0.598317, 0.2462478, 1.742999, 0.1647059, 0, 1, 1,
0.6040612, 2.251495, 1.605222, 0.1686275, 0, 1, 1,
0.6052494, 0.117128, 1.317312, 0.1764706, 0, 1, 1,
0.6084862, -0.1129488, 0.7365435, 0.1803922, 0, 1, 1,
0.6098639, 0.1971201, 0.7306869, 0.1882353, 0, 1, 1,
0.6103373, -0.6597467, 3.776982, 0.1921569, 0, 1, 1,
0.616771, 1.513685, 0.273743, 0.2, 0, 1, 1,
0.6183293, -0.5367435, 2.141429, 0.2078431, 0, 1, 1,
0.6200528, 0.5530502, 1.600705, 0.2117647, 0, 1, 1,
0.620182, 0.08328027, 1.007639, 0.2196078, 0, 1, 1,
0.6212885, -1.767563, 3.253466, 0.2235294, 0, 1, 1,
0.6241143, 0.8957195, 2.129659, 0.2313726, 0, 1, 1,
0.6292263, -0.4188015, 3.788779, 0.2352941, 0, 1, 1,
0.6304325, 0.4500111, -0.7614279, 0.2431373, 0, 1, 1,
0.6338993, 0.5045521, 2.165701, 0.2470588, 0, 1, 1,
0.6374501, 0.05734266, 0.2924988, 0.254902, 0, 1, 1,
0.638827, -0.002297021, 0.6826348, 0.2588235, 0, 1, 1,
0.6390725, -1.5823, 1.28949, 0.2666667, 0, 1, 1,
0.6395047, 0.4498683, 2.256503, 0.2705882, 0, 1, 1,
0.6483743, 1.73126, 2.024395, 0.2784314, 0, 1, 1,
0.6517666, -0.5037435, 2.359976, 0.282353, 0, 1, 1,
0.6562619, 0.29365, -0.08112969, 0.2901961, 0, 1, 1,
0.6565006, -0.7601087, 2.948846, 0.2941177, 0, 1, 1,
0.6590041, -0.06834101, -0.06405038, 0.3019608, 0, 1, 1,
0.6641065, 0.5936899, 0.9627292, 0.3098039, 0, 1, 1,
0.669808, -0.1395583, 2.337344, 0.3137255, 0, 1, 1,
0.671228, 0.4867083, 2.075627, 0.3215686, 0, 1, 1,
0.6712296, 0.7773638, -0.05348741, 0.3254902, 0, 1, 1,
0.6755111, 1.208355, 0.9715693, 0.3333333, 0, 1, 1,
0.6769713, 0.3519172, 2.172924, 0.3372549, 0, 1, 1,
0.67843, -1.217568, 0.7988132, 0.345098, 0, 1, 1,
0.6839446, 1.335729, 1.090019, 0.3490196, 0, 1, 1,
0.6869292, 0.9697319, 1.402219, 0.3568628, 0, 1, 1,
0.6882163, 0.05534219, 0.8989247, 0.3607843, 0, 1, 1,
0.6925665, 0.1669785, 3.009859, 0.3686275, 0, 1, 1,
0.6929959, -0.2898161, 0.8381624, 0.372549, 0, 1, 1,
0.6947155, 0.2153225, 0.827504, 0.3803922, 0, 1, 1,
0.6954335, 0.353509, 1.643778, 0.3843137, 0, 1, 1,
0.6960387, 0.3338585, 1.663307, 0.3921569, 0, 1, 1,
0.6970342, -0.0391671, 1.310233, 0.3960784, 0, 1, 1,
0.7016351, -1.524878, 1.084701, 0.4039216, 0, 1, 1,
0.7058911, -0.6890915, 1.424024, 0.4117647, 0, 1, 1,
0.7061158, -0.21758, 1.922744, 0.4156863, 0, 1, 1,
0.7165489, 0.1061741, 1.333278, 0.4235294, 0, 1, 1,
0.7167311, -1.552698, 3.07884, 0.427451, 0, 1, 1,
0.716763, 0.4321523, -1.379753, 0.4352941, 0, 1, 1,
0.7177324, -0.6680034, 3.012908, 0.4392157, 0, 1, 1,
0.7192551, 0.714009, 0.6379957, 0.4470588, 0, 1, 1,
0.7254776, -0.1792639, 2.697099, 0.4509804, 0, 1, 1,
0.7319932, -0.3657675, 2.135734, 0.4588235, 0, 1, 1,
0.7320122, -0.5525146, 1.23018, 0.4627451, 0, 1, 1,
0.7362027, 0.230642, 0.9815518, 0.4705882, 0, 1, 1,
0.7423403, -2.24066, 4.117258, 0.4745098, 0, 1, 1,
0.7441639, -0.8863679, 2.813396, 0.4823529, 0, 1, 1,
0.7468219, 1.017394, 0.8637412, 0.4862745, 0, 1, 1,
0.748493, -1.512035, 2.01895, 0.4941176, 0, 1, 1,
0.7500638, 1.562443, -0.0308219, 0.5019608, 0, 1, 1,
0.7681391, 1.416907, -0.8607191, 0.5058824, 0, 1, 1,
0.7763066, -1.259748, 2.394472, 0.5137255, 0, 1, 1,
0.7766086, 1.458284, 1.422414, 0.5176471, 0, 1, 1,
0.7801188, -0.1477576, 4.029956, 0.5254902, 0, 1, 1,
0.7840186, 0.5327411, 0.8703459, 0.5294118, 0, 1, 1,
0.7867757, -1.112408, 1.811909, 0.5372549, 0, 1, 1,
0.7935874, 0.7391191, 2.074192, 0.5411765, 0, 1, 1,
0.8052205, -1.291248, 1.530408, 0.5490196, 0, 1, 1,
0.8120962, 0.1193875, 2.668209, 0.5529412, 0, 1, 1,
0.8121254, -1.219289, 1.375941, 0.5607843, 0, 1, 1,
0.8148429, 0.1785291, 1.470433, 0.5647059, 0, 1, 1,
0.8161675, 0.1069257, 2.30899, 0.572549, 0, 1, 1,
0.8171685, -0.5571307, 2.196988, 0.5764706, 0, 1, 1,
0.821255, 1.948427, 0.6159071, 0.5843138, 0, 1, 1,
0.8224925, 0.7922979, -1.276404, 0.5882353, 0, 1, 1,
0.8236715, -0.4589365, 1.664543, 0.5960785, 0, 1, 1,
0.8357565, -0.4511204, 1.785388, 0.6039216, 0, 1, 1,
0.8377631, 0.4365918, 2.002172, 0.6078432, 0, 1, 1,
0.8382479, -0.2983229, 2.422671, 0.6156863, 0, 1, 1,
0.8384202, -1.595104, 2.236743, 0.6196079, 0, 1, 1,
0.8405731, 1.307888, 0.8856383, 0.627451, 0, 1, 1,
0.8428999, 0.7414635, 1.247769, 0.6313726, 0, 1, 1,
0.8491583, -0.6149816, 2.673275, 0.6392157, 0, 1, 1,
0.8523734, 0.4044573, 2.764856, 0.6431373, 0, 1, 1,
0.8537291, 1.247963, -0.7547, 0.6509804, 0, 1, 1,
0.8562719, -1.362958, 3.828426, 0.654902, 0, 1, 1,
0.8608091, 0.6341693, 2.436667, 0.6627451, 0, 1, 1,
0.8639048, 0.9412326, -0.03738638, 0.6666667, 0, 1, 1,
0.8646427, 1.081073, -0.03834196, 0.6745098, 0, 1, 1,
0.8656484, 1.459801, 0.8234919, 0.6784314, 0, 1, 1,
0.8659112, 0.356834, 0.3814178, 0.6862745, 0, 1, 1,
0.8659639, 0.9930195, 1.644344, 0.6901961, 0, 1, 1,
0.8731914, -0.2525425, 1.439651, 0.6980392, 0, 1, 1,
0.8745281, 1.367548, 3.007839, 0.7058824, 0, 1, 1,
0.8775553, 1.511596, 1.677745, 0.7098039, 0, 1, 1,
0.8778389, 1.412707, 1.257459, 0.7176471, 0, 1, 1,
0.8848409, 0.5127378, 0.1488602, 0.7215686, 0, 1, 1,
0.8885508, -0.9183527, 1.939009, 0.7294118, 0, 1, 1,
0.8908188, -1.392083, 1.505994, 0.7333333, 0, 1, 1,
0.8929643, 0.7739122, 0.3013728, 0.7411765, 0, 1, 1,
0.8943509, 0.3879146, 1.033031, 0.7450981, 0, 1, 1,
0.8951672, -0.01347655, 3.123705, 0.7529412, 0, 1, 1,
0.8976741, -0.650932, 2.596581, 0.7568628, 0, 1, 1,
0.8981424, -1.07418, 2.123703, 0.7647059, 0, 1, 1,
0.8984497, -1.029854, 3.213228, 0.7686275, 0, 1, 1,
0.9000573, -0.9849328, 3.674607, 0.7764706, 0, 1, 1,
0.9001685, 1.489008, -0.2433678, 0.7803922, 0, 1, 1,
0.9006274, 0.6152915, 2.571987, 0.7882353, 0, 1, 1,
0.9012342, 1.613579, -1.462671, 0.7921569, 0, 1, 1,
0.9026777, 0.3846245, 1.581244, 0.8, 0, 1, 1,
0.9038939, -0.4757279, 1.851663, 0.8078431, 0, 1, 1,
0.9055772, 1.265718, 0.7839072, 0.8117647, 0, 1, 1,
0.9061655, -0.5458768, 2.177354, 0.8196079, 0, 1, 1,
0.9083636, 1.41345, 1.221795, 0.8235294, 0, 1, 1,
0.908554, -0.147722, 1.95223, 0.8313726, 0, 1, 1,
0.9104708, -1.673619, 2.636818, 0.8352941, 0, 1, 1,
0.9118173, -0.09215286, 1.757031, 0.8431373, 0, 1, 1,
0.9151473, -0.7800491, 2.673543, 0.8470588, 0, 1, 1,
0.9316561, 0.6457073, 1.245544, 0.854902, 0, 1, 1,
0.93577, -0.1277869, 3.084531, 0.8588235, 0, 1, 1,
0.9417772, 0.2148507, 1.275987, 0.8666667, 0, 1, 1,
0.9451348, 1.48517, 1.261046, 0.8705882, 0, 1, 1,
0.9467593, -0.1942919, 2.173459, 0.8784314, 0, 1, 1,
0.9471246, 0.6258284, 0.3994106, 0.8823529, 0, 1, 1,
0.9512984, -0.1381477, 4.53048, 0.8901961, 0, 1, 1,
0.9671568, 0.7969533, -0.280539, 0.8941177, 0, 1, 1,
0.9688524, 1.266308, 1.18895, 0.9019608, 0, 1, 1,
0.9740802, 0.1714646, 2.288862, 0.9098039, 0, 1, 1,
0.9782853, -0.3738399, 3.737092, 0.9137255, 0, 1, 1,
0.9795557, -0.4765401, 0.655139, 0.9215686, 0, 1, 1,
0.9809755, 0.5504562, 0.4804694, 0.9254902, 0, 1, 1,
0.9858869, -0.3443992, 3.742419, 0.9333333, 0, 1, 1,
0.9887484, -0.6503487, 3.148794, 0.9372549, 0, 1, 1,
0.9901453, 2.267349, 0.5992373, 0.945098, 0, 1, 1,
0.9916787, -0.1414297, 3.309511, 0.9490196, 0, 1, 1,
1.015244, 1.610719, 0.5899374, 0.9568627, 0, 1, 1,
1.017243, 1.489249, 0.5824763, 0.9607843, 0, 1, 1,
1.021736, 0.8399105, 0.5742793, 0.9686275, 0, 1, 1,
1.024307, 0.5488279, 0.8685204, 0.972549, 0, 1, 1,
1.029766, 1.020337, 1.915364, 0.9803922, 0, 1, 1,
1.032626, -1.164844, 1.990224, 0.9843137, 0, 1, 1,
1.033468, 1.56152, -0.5688486, 0.9921569, 0, 1, 1,
1.038984, -0.1306929, 1.783901, 0.9960784, 0, 1, 1,
1.044794, 1.668978, -0.3790841, 1, 0, 0.9960784, 1,
1.046542, 0.4341078, 1.075821, 1, 0, 0.9882353, 1,
1.068183, 0.3797893, 3.69908, 1, 0, 0.9843137, 1,
1.068352, -2.167762, 3.565356, 1, 0, 0.9764706, 1,
1.08078, 0.06347223, 1.696498, 1, 0, 0.972549, 1,
1.089336, -0.5064563, 4.533299, 1, 0, 0.9647059, 1,
1.092756, -1.001453, 1.74404, 1, 0, 0.9607843, 1,
1.097535, -0.07497629, 2.221398, 1, 0, 0.9529412, 1,
1.102132, -0.1090242, 1.37019, 1, 0, 0.9490196, 1,
1.112052, 0.09908798, 2.173794, 1, 0, 0.9411765, 1,
1.11244, -0.6083253, 2.108788, 1, 0, 0.9372549, 1,
1.11326, -0.2970447, 3.012242, 1, 0, 0.9294118, 1,
1.123523, 0.6086041, 0.1596601, 1, 0, 0.9254902, 1,
1.124311, 1.148086, 0.9630505, 1, 0, 0.9176471, 1,
1.124407, -0.7908812, 4.624331, 1, 0, 0.9137255, 1,
1.125609, 0.0668994, 0.3553902, 1, 0, 0.9058824, 1,
1.135578, 2.365947, 0.3309276, 1, 0, 0.9019608, 1,
1.136095, -0.3886791, 2.268886, 1, 0, 0.8941177, 1,
1.136608, -0.1363194, 1.438085, 1, 0, 0.8862745, 1,
1.136854, -0.4375652, 1.610756, 1, 0, 0.8823529, 1,
1.143034, -0.5261707, 2.131626, 1, 0, 0.8745098, 1,
1.146402, 0.5725797, 2.090592, 1, 0, 0.8705882, 1,
1.147273, 1.686025, 0.4224456, 1, 0, 0.8627451, 1,
1.148994, 0.5866267, 0.7562377, 1, 0, 0.8588235, 1,
1.160189, 1.302898, 2.557971, 1, 0, 0.8509804, 1,
1.160706, 1.47231, 1.337018, 1, 0, 0.8470588, 1,
1.167107, -0.4638844, 2.418528, 1, 0, 0.8392157, 1,
1.168686, -0.4584433, 0.6311238, 1, 0, 0.8352941, 1,
1.174191, -1.232954, 1.581146, 1, 0, 0.827451, 1,
1.179087, -0.03916183, 1.778021, 1, 0, 0.8235294, 1,
1.183974, 0.08797368, 2.971676, 1, 0, 0.8156863, 1,
1.18801, 0.7816331, 0.8234974, 1, 0, 0.8117647, 1,
1.188325, 0.03541732, 3.53225, 1, 0, 0.8039216, 1,
1.194055, -0.083907, 2.518754, 1, 0, 0.7960784, 1,
1.19597, -1.338805, 4.159485, 1, 0, 0.7921569, 1,
1.201812, -0.8873262, 2.203047, 1, 0, 0.7843137, 1,
1.210973, -0.433668, 1.200897, 1, 0, 0.7803922, 1,
1.213492, 0.7175441, 1.532843, 1, 0, 0.772549, 1,
1.224639, -0.4383451, -0.1356812, 1, 0, 0.7686275, 1,
1.226484, -1.175745, 3.156326, 1, 0, 0.7607843, 1,
1.234874, -0.4738763, 1.206904, 1, 0, 0.7568628, 1,
1.248386, 1.441452, -1.878439, 1, 0, 0.7490196, 1,
1.24857, 0.3839771, 1.903391, 1, 0, 0.7450981, 1,
1.248807, 1.292855, 2.075024, 1, 0, 0.7372549, 1,
1.249181, -1.330228, 1.95186, 1, 0, 0.7333333, 1,
1.250149, -0.4451961, 2.557447, 1, 0, 0.7254902, 1,
1.252115, -1.689195, 2.950189, 1, 0, 0.7215686, 1,
1.252683, 1.034494, -0.3979498, 1, 0, 0.7137255, 1,
1.261485, -0.5669227, 1.309639, 1, 0, 0.7098039, 1,
1.280664, 0.1070631, 1.560869, 1, 0, 0.7019608, 1,
1.28193, 1.791521, 0.9373096, 1, 0, 0.6941177, 1,
1.28626, -0.7186839, 3.136547, 1, 0, 0.6901961, 1,
1.292337, 0.4989792, 1.145017, 1, 0, 0.682353, 1,
1.294179, -0.1109444, -0.613447, 1, 0, 0.6784314, 1,
1.304341, -0.5243052, 0.4828837, 1, 0, 0.6705883, 1,
1.304924, 1.423516, 2.044704, 1, 0, 0.6666667, 1,
1.311444, -1.402087, 1.876587, 1, 0, 0.6588235, 1,
1.313316, -1.081194, 2.660786, 1, 0, 0.654902, 1,
1.315941, -0.2630562, 1.545345, 1, 0, 0.6470588, 1,
1.317107, 0.05186365, 1.075525, 1, 0, 0.6431373, 1,
1.322119, -0.8828433, -0.0779364, 1, 0, 0.6352941, 1,
1.323057, -0.20867, 2.775763, 1, 0, 0.6313726, 1,
1.329478, -1.207469, 0.8302202, 1, 0, 0.6235294, 1,
1.329702, 1.107019, 1.612276, 1, 0, 0.6196079, 1,
1.329926, -0.1230352, 1.717889, 1, 0, 0.6117647, 1,
1.335409, 1.245122, 1.272695, 1, 0, 0.6078432, 1,
1.335452, 0.6239995, 1.528296, 1, 0, 0.6, 1,
1.344293, -0.1258833, 2.579499, 1, 0, 0.5921569, 1,
1.344634, -1.308251, 3.290437, 1, 0, 0.5882353, 1,
1.346091, 0.7880104, 1.115437, 1, 0, 0.5803922, 1,
1.348325, 0.1177686, 0.4564643, 1, 0, 0.5764706, 1,
1.34968, 0.5386638, 0.361757, 1, 0, 0.5686275, 1,
1.35826, 1.504245, 0.8270092, 1, 0, 0.5647059, 1,
1.361269, 1.340673, 2.776851, 1, 0, 0.5568628, 1,
1.361479, -0.577321, 1.590775, 1, 0, 0.5529412, 1,
1.362149, -0.7943766, 1.306702, 1, 0, 0.5450981, 1,
1.365375, -0.01254501, -0.029881, 1, 0, 0.5411765, 1,
1.365856, 0.8305386, 0.2340907, 1, 0, 0.5333334, 1,
1.368545, -0.4920281, 1.180732, 1, 0, 0.5294118, 1,
1.375143, 0.1473736, 1.728011, 1, 0, 0.5215687, 1,
1.376165, 1.495982, 1.014214, 1, 0, 0.5176471, 1,
1.399578, 0.9985808, 0.7966486, 1, 0, 0.509804, 1,
1.40798, -0.2481763, 0.8793252, 1, 0, 0.5058824, 1,
1.415716, -0.09478711, 2.320798, 1, 0, 0.4980392, 1,
1.429572, 0.1122946, 1.470047, 1, 0, 0.4901961, 1,
1.439291, -0.5391552, 2.359291, 1, 0, 0.4862745, 1,
1.44831, -0.9384404, 2.327334, 1, 0, 0.4784314, 1,
1.449317, -2.170915, 3.006978, 1, 0, 0.4745098, 1,
1.457011, 0.2955576, 0.9645419, 1, 0, 0.4666667, 1,
1.484288, 0.2844851, 2.772969, 1, 0, 0.4627451, 1,
1.502518, -0.02406443, 1.22239, 1, 0, 0.454902, 1,
1.506578, -0.4117657, 0.852733, 1, 0, 0.4509804, 1,
1.507199, -0.9713274, 3.935951, 1, 0, 0.4431373, 1,
1.507534, -1.35875, 3.613163, 1, 0, 0.4392157, 1,
1.508524, 0.3700699, 0.180189, 1, 0, 0.4313726, 1,
1.508813, 0.669497, 1.245864, 1, 0, 0.427451, 1,
1.520736, 0.5853863, 0.8645831, 1, 0, 0.4196078, 1,
1.521084, 1.089747, 0.7038689, 1, 0, 0.4156863, 1,
1.539892, -0.8847393, 1.797955, 1, 0, 0.4078431, 1,
1.544934, 0.4807516, 2.626874, 1, 0, 0.4039216, 1,
1.550961, 0.2733494, 0.4697819, 1, 0, 0.3960784, 1,
1.554164, 1.769323, 1.279621, 1, 0, 0.3882353, 1,
1.554405, 2.593063, 1.051955, 1, 0, 0.3843137, 1,
1.558147, 0.697939, 1.834438, 1, 0, 0.3764706, 1,
1.577745, -1.544471, 1.784969, 1, 0, 0.372549, 1,
1.590207, 0.5359358, 0.3552135, 1, 0, 0.3647059, 1,
1.593473, 0.3744275, -0.2485435, 1, 0, 0.3607843, 1,
1.595742, 0.5505558, 1.27452, 1, 0, 0.3529412, 1,
1.604014, -0.09322188, 3.085575, 1, 0, 0.3490196, 1,
1.620516, -1.088461, 2.451924, 1, 0, 0.3411765, 1,
1.651124, 2.560322, 0.3760487, 1, 0, 0.3372549, 1,
1.6679, 1.233227, 2.388116, 1, 0, 0.3294118, 1,
1.670228, -0.4018627, 2.27846, 1, 0, 0.3254902, 1,
1.673516, -1.653998, 1.863357, 1, 0, 0.3176471, 1,
1.717567, 0.6036826, 2.528484, 1, 0, 0.3137255, 1,
1.718267, -0.3769987, 0.1613128, 1, 0, 0.3058824, 1,
1.719338, 0.3885555, 0.8909924, 1, 0, 0.2980392, 1,
1.745703, 0.5301934, 3.399297, 1, 0, 0.2941177, 1,
1.748831, -1.251446, 2.430772, 1, 0, 0.2862745, 1,
1.752377, 2.075894, -0.921896, 1, 0, 0.282353, 1,
1.753118, 1.964417, -0.002266301, 1, 0, 0.2745098, 1,
1.761699, -0.791621, 3.601683, 1, 0, 0.2705882, 1,
1.767236, 0.5988768, 1.831552, 1, 0, 0.2627451, 1,
1.773485, -0.3741044, 2.82449, 1, 0, 0.2588235, 1,
1.779692, -0.6477202, 1.525655, 1, 0, 0.2509804, 1,
1.792545, 1.355101, 0.3141333, 1, 0, 0.2470588, 1,
1.799042, 1.671312, -0.3174704, 1, 0, 0.2392157, 1,
1.801823, 0.5984669, 1.408942, 1, 0, 0.2352941, 1,
1.809592, 2.956939, 0.5659947, 1, 0, 0.227451, 1,
1.811752, 0.5425803, 1.673449, 1, 0, 0.2235294, 1,
1.823382, -1.862399, 2.343497, 1, 0, 0.2156863, 1,
1.842884, -0.01883489, 0.1717409, 1, 0, 0.2117647, 1,
1.858862, 0.04252274, -0.08223341, 1, 0, 0.2039216, 1,
1.863479, 0.278188, 2.218886, 1, 0, 0.1960784, 1,
1.868014, 1.184428, 1.916099, 1, 0, 0.1921569, 1,
1.872393, -0.1721271, 2.936465, 1, 0, 0.1843137, 1,
1.87481, -0.9979685, 3.785423, 1, 0, 0.1803922, 1,
1.903689, 1.843879, 1.114249, 1, 0, 0.172549, 1,
1.913999, -0.142128, 2.700106, 1, 0, 0.1686275, 1,
1.927906, 0.5430508, 0.05288516, 1, 0, 0.1607843, 1,
1.936648, 1.625502, -0.6701045, 1, 0, 0.1568628, 1,
1.936798, 0.1297081, 3.078116, 1, 0, 0.1490196, 1,
1.959745, 0.6941268, 1.79371, 1, 0, 0.145098, 1,
1.982015, 1.180597, 1.835566, 1, 0, 0.1372549, 1,
2.019424, -0.7427834, 2.834154, 1, 0, 0.1333333, 1,
2.035312, 0.5806966, 0.5016028, 1, 0, 0.1254902, 1,
2.048709, -0.7044352, 3.632466, 1, 0, 0.1215686, 1,
2.108043, -0.9115614, 1.586107, 1, 0, 0.1137255, 1,
2.116912, -0.5486141, 1.747324, 1, 0, 0.1098039, 1,
2.124038, 0.06230578, 1.340521, 1, 0, 0.1019608, 1,
2.16189, 0.5470597, 3.067545, 1, 0, 0.09411765, 1,
2.186475, -1.361046, 1.259597, 1, 0, 0.09019608, 1,
2.212962, -0.07578625, 2.081727, 1, 0, 0.08235294, 1,
2.236778, 0.2137928, 1.126701, 1, 0, 0.07843138, 1,
2.250575, 0.1566575, 0.762863, 1, 0, 0.07058824, 1,
2.256387, -1.087149, 1.290019, 1, 0, 0.06666667, 1,
2.256656, 0.8721763, 1.048529, 1, 0, 0.05882353, 1,
2.299879, 0.3957143, 2.296253, 1, 0, 0.05490196, 1,
2.317524, -0.91722, 2.266481, 1, 0, 0.04705882, 1,
2.391987, -1.765391, 2.418959, 1, 0, 0.04313726, 1,
2.399585, 1.381105, 1.648921, 1, 0, 0.03529412, 1,
2.404439, 0.5896578, 0.7998602, 1, 0, 0.03137255, 1,
2.609438, -0.8708363, 0.8425413, 1, 0, 0.02352941, 1,
2.628944, 1.200522, 0.6325577, 1, 0, 0.01960784, 1,
2.865368, 0.1146734, 1.275177, 1, 0, 0.01176471, 1,
3.070599, -0.5464593, 1.057132, 1, 0, 0.007843138, 1
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
-0.1637208, -3.543812, -7.722688, 0, -0.5, 0.5, 0.5,
-0.1637208, -3.543812, -7.722688, 1, -0.5, 0.5, 0.5,
-0.1637208, -3.543812, -7.722688, 1, 1.5, 0.5, 0.5,
-0.1637208, -3.543812, -7.722688, 0, 1.5, 0.5, 0.5
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
-4.494475, 0.2632924, -7.722688, 0, -0.5, 0.5, 0.5,
-4.494475, 0.2632924, -7.722688, 1, -0.5, 0.5, 0.5,
-4.494475, 0.2632924, -7.722688, 1, 1.5, 0.5, 0.5,
-4.494475, 0.2632924, -7.722688, 0, 1.5, 0.5, 0.5
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
-4.494475, -3.543812, -0.2059412, 0, -0.5, 0.5, 0.5,
-4.494475, -3.543812, -0.2059412, 1, -0.5, 0.5, 0.5,
-4.494475, -3.543812, -0.2059412, 1, 1.5, 0.5, 0.5,
-4.494475, -3.543812, -0.2059412, 0, 1.5, 0.5, 0.5
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
-3, -2.66525, -5.988054,
3, -2.66525, -5.988054,
-3, -2.66525, -5.988054,
-3, -2.811677, -6.27716,
-2, -2.66525, -5.988054,
-2, -2.811677, -6.27716,
-1, -2.66525, -5.988054,
-1, -2.811677, -6.27716,
0, -2.66525, -5.988054,
0, -2.811677, -6.27716,
1, -2.66525, -5.988054,
1, -2.811677, -6.27716,
2, -2.66525, -5.988054,
2, -2.811677, -6.27716,
3, -2.66525, -5.988054,
3, -2.811677, -6.27716
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
-3, -3.104531, -6.855371, 0, -0.5, 0.5, 0.5,
-3, -3.104531, -6.855371, 1, -0.5, 0.5, 0.5,
-3, -3.104531, -6.855371, 1, 1.5, 0.5, 0.5,
-3, -3.104531, -6.855371, 0, 1.5, 0.5, 0.5,
-2, -3.104531, -6.855371, 0, -0.5, 0.5, 0.5,
-2, -3.104531, -6.855371, 1, -0.5, 0.5, 0.5,
-2, -3.104531, -6.855371, 1, 1.5, 0.5, 0.5,
-2, -3.104531, -6.855371, 0, 1.5, 0.5, 0.5,
-1, -3.104531, -6.855371, 0, -0.5, 0.5, 0.5,
-1, -3.104531, -6.855371, 1, -0.5, 0.5, 0.5,
-1, -3.104531, -6.855371, 1, 1.5, 0.5, 0.5,
-1, -3.104531, -6.855371, 0, 1.5, 0.5, 0.5,
0, -3.104531, -6.855371, 0, -0.5, 0.5, 0.5,
0, -3.104531, -6.855371, 1, -0.5, 0.5, 0.5,
0, -3.104531, -6.855371, 1, 1.5, 0.5, 0.5,
0, -3.104531, -6.855371, 0, 1.5, 0.5, 0.5,
1, -3.104531, -6.855371, 0, -0.5, 0.5, 0.5,
1, -3.104531, -6.855371, 1, -0.5, 0.5, 0.5,
1, -3.104531, -6.855371, 1, 1.5, 0.5, 0.5,
1, -3.104531, -6.855371, 0, 1.5, 0.5, 0.5,
2, -3.104531, -6.855371, 0, -0.5, 0.5, 0.5,
2, -3.104531, -6.855371, 1, -0.5, 0.5, 0.5,
2, -3.104531, -6.855371, 1, 1.5, 0.5, 0.5,
2, -3.104531, -6.855371, 0, 1.5, 0.5, 0.5,
3, -3.104531, -6.855371, 0, -0.5, 0.5, 0.5,
3, -3.104531, -6.855371, 1, -0.5, 0.5, 0.5,
3, -3.104531, -6.855371, 1, 1.5, 0.5, 0.5,
3, -3.104531, -6.855371, 0, 1.5, 0.5, 0.5
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
-3.495071, -2, -5.988054,
-3.495071, 3, -5.988054,
-3.495071, -2, -5.988054,
-3.661638, -2, -6.27716,
-3.495071, -1, -5.988054,
-3.661638, -1, -6.27716,
-3.495071, 0, -5.988054,
-3.661638, 0, -6.27716,
-3.495071, 1, -5.988054,
-3.661638, 1, -6.27716,
-3.495071, 2, -5.988054,
-3.661638, 2, -6.27716,
-3.495071, 3, -5.988054,
-3.661638, 3, -6.27716
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
-3.994773, -2, -6.855371, 0, -0.5, 0.5, 0.5,
-3.994773, -2, -6.855371, 1, -0.5, 0.5, 0.5,
-3.994773, -2, -6.855371, 1, 1.5, 0.5, 0.5,
-3.994773, -2, -6.855371, 0, 1.5, 0.5, 0.5,
-3.994773, -1, -6.855371, 0, -0.5, 0.5, 0.5,
-3.994773, -1, -6.855371, 1, -0.5, 0.5, 0.5,
-3.994773, -1, -6.855371, 1, 1.5, 0.5, 0.5,
-3.994773, -1, -6.855371, 0, 1.5, 0.5, 0.5,
-3.994773, 0, -6.855371, 0, -0.5, 0.5, 0.5,
-3.994773, 0, -6.855371, 1, -0.5, 0.5, 0.5,
-3.994773, 0, -6.855371, 1, 1.5, 0.5, 0.5,
-3.994773, 0, -6.855371, 0, 1.5, 0.5, 0.5,
-3.994773, 1, -6.855371, 0, -0.5, 0.5, 0.5,
-3.994773, 1, -6.855371, 1, -0.5, 0.5, 0.5,
-3.994773, 1, -6.855371, 1, 1.5, 0.5, 0.5,
-3.994773, 1, -6.855371, 0, 1.5, 0.5, 0.5,
-3.994773, 2, -6.855371, 0, -0.5, 0.5, 0.5,
-3.994773, 2, -6.855371, 1, -0.5, 0.5, 0.5,
-3.994773, 2, -6.855371, 1, 1.5, 0.5, 0.5,
-3.994773, 2, -6.855371, 0, 1.5, 0.5, 0.5,
-3.994773, 3, -6.855371, 0, -0.5, 0.5, 0.5,
-3.994773, 3, -6.855371, 1, -0.5, 0.5, 0.5,
-3.994773, 3, -6.855371, 1, 1.5, 0.5, 0.5,
-3.994773, 3, -6.855371, 0, 1.5, 0.5, 0.5
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
-3.495071, -2.66525, -4,
-3.495071, -2.66525, 4,
-3.495071, -2.66525, -4,
-3.661638, -2.811677, -4,
-3.495071, -2.66525, -2,
-3.661638, -2.811677, -2,
-3.495071, -2.66525, 0,
-3.661638, -2.811677, 0,
-3.495071, -2.66525, 2,
-3.661638, -2.811677, 2,
-3.495071, -2.66525, 4,
-3.661638, -2.811677, 4
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
-3.994773, -3.104531, -4, 0, -0.5, 0.5, 0.5,
-3.994773, -3.104531, -4, 1, -0.5, 0.5, 0.5,
-3.994773, -3.104531, -4, 1, 1.5, 0.5, 0.5,
-3.994773, -3.104531, -4, 0, 1.5, 0.5, 0.5,
-3.994773, -3.104531, -2, 0, -0.5, 0.5, 0.5,
-3.994773, -3.104531, -2, 1, -0.5, 0.5, 0.5,
-3.994773, -3.104531, -2, 1, 1.5, 0.5, 0.5,
-3.994773, -3.104531, -2, 0, 1.5, 0.5, 0.5,
-3.994773, -3.104531, 0, 0, -0.5, 0.5, 0.5,
-3.994773, -3.104531, 0, 1, -0.5, 0.5, 0.5,
-3.994773, -3.104531, 0, 1, 1.5, 0.5, 0.5,
-3.994773, -3.104531, 0, 0, 1.5, 0.5, 0.5,
-3.994773, -3.104531, 2, 0, -0.5, 0.5, 0.5,
-3.994773, -3.104531, 2, 1, -0.5, 0.5, 0.5,
-3.994773, -3.104531, 2, 1, 1.5, 0.5, 0.5,
-3.994773, -3.104531, 2, 0, 1.5, 0.5, 0.5,
-3.994773, -3.104531, 4, 0, -0.5, 0.5, 0.5,
-3.994773, -3.104531, 4, 1, -0.5, 0.5, 0.5,
-3.994773, -3.104531, 4, 1, 1.5, 0.5, 0.5,
-3.994773, -3.104531, 4, 0, 1.5, 0.5, 0.5
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
-3.495071, -2.66525, -5.988054,
-3.495071, 3.191834, -5.988054,
-3.495071, -2.66525, 5.576172,
-3.495071, 3.191834, 5.576172,
-3.495071, -2.66525, -5.988054,
-3.495071, -2.66525, 5.576172,
-3.495071, 3.191834, -5.988054,
-3.495071, 3.191834, 5.576172,
-3.495071, -2.66525, -5.988054,
3.167629, -2.66525, -5.988054,
-3.495071, -2.66525, 5.576172,
3.167629, -2.66525, 5.576172,
-3.495071, 3.191834, -5.988054,
3.167629, 3.191834, -5.988054,
-3.495071, 3.191834, 5.576172,
3.167629, 3.191834, 5.576172,
3.167629, -2.66525, -5.988054,
3.167629, 3.191834, -5.988054,
3.167629, -2.66525, 5.576172,
3.167629, 3.191834, 5.576172,
3.167629, -2.66525, -5.988054,
3.167629, -2.66525, 5.576172,
3.167629, 3.191834, -5.988054,
3.167629, 3.191834, 5.576172
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
var radius = 7.782725;
var distance = 34.62622;
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
mvMatrix.translate( 0.1637208, -0.2632924, 0.2059412 );
mvMatrix.scale( 1.262977, 1.436693, 0.7276608 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.62622);
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
metosulam<-read.table("metosulam.xyz")
```

```
## Error in read.table("metosulam.xyz"): no lines available in input
```

```r
x<-metosulam$V2
```

```
## Error in eval(expr, envir, enclos): object 'metosulam' not found
```

```r
y<-metosulam$V3
```

```
## Error in eval(expr, envir, enclos): object 'metosulam' not found
```

```r
z<-metosulam$V4
```

```
## Error in eval(expr, envir, enclos): object 'metosulam' not found
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
-3.398041, -0.7726876, -0.4346341, 0, 0, 1, 1, 1,
-3.190583, -0.6906621, -1.193558, 1, 0, 0, 1, 1,
-3.071733, 0.2439963, -2.5329, 1, 0, 0, 1, 1,
-3.048462, -0.1806509, -0.01172643, 1, 0, 0, 1, 1,
-2.741028, 2.728925, 0.5715092, 1, 0, 0, 1, 1,
-2.53226, 0.8658042, -1.472643, 1, 0, 0, 1, 1,
-2.488949, -0.4157652, -2.053291, 0, 0, 0, 1, 1,
-2.471948, 0.5481075, -2.076168, 0, 0, 0, 1, 1,
-2.470973, -2.148406, -3.202774, 0, 0, 0, 1, 1,
-2.246971, 0.08795219, -1.536408, 0, 0, 0, 1, 1,
-2.204205, -0.5104525, -2.063897, 0, 0, 0, 1, 1,
-2.181234, -0.271598, -1.839512, 0, 0, 0, 1, 1,
-2.178776, 0.3353251, -1.237321, 0, 0, 0, 1, 1,
-2.16214, -0.1507437, -1.449383, 1, 1, 1, 1, 1,
-2.16171, 0.6677021, -3.16269, 1, 1, 1, 1, 1,
-2.145162, -1.688824, -5.163975, 1, 1, 1, 1, 1,
-2.13955, -0.6502101, -1.477443, 1, 1, 1, 1, 1,
-2.117952, 0.4377915, -0.6454629, 1, 1, 1, 1, 1,
-2.11591, -0.3068978, -1.92435, 1, 1, 1, 1, 1,
-2.100166, 0.5157453, -1.759749, 1, 1, 1, 1, 1,
-2.067262, -0.8953913, -1.484088, 1, 1, 1, 1, 1,
-2.048109, -1.601568, -2.944291, 1, 1, 1, 1, 1,
-2.04565, 0.4276516, -0.1763876, 1, 1, 1, 1, 1,
-2.042085, 0.9553944, 0.0488558, 1, 1, 1, 1, 1,
-2.039078, 0.9521855, -0.7096399, 1, 1, 1, 1, 1,
-2.031485, -0.819147, 0.1574845, 1, 1, 1, 1, 1,
-2.030037, -1.723511, -2.693008, 1, 1, 1, 1, 1,
-2.025674, 0.6339789, -0.4543838, 1, 1, 1, 1, 1,
-2.023664, 0.1474093, -2.330209, 0, 0, 1, 1, 1,
-2.002039, 0.09512421, -0.9264911, 1, 0, 0, 1, 1,
-1.985724, -0.4986782, -0.2510538, 1, 0, 0, 1, 1,
-1.981442, 0.4519097, -1.897793, 1, 0, 0, 1, 1,
-1.973183, 0.9740816, -1.970708, 1, 0, 0, 1, 1,
-1.921307, 0.3046774, -0.8723641, 1, 0, 0, 1, 1,
-1.915453, -0.9434041, -2.55015, 0, 0, 0, 1, 1,
-1.886616, 0.7410091, -2.260982, 0, 0, 0, 1, 1,
-1.882382, 1.033423, -0.08963563, 0, 0, 0, 1, 1,
-1.824525, -0.04386625, -0.6480002, 0, 0, 0, 1, 1,
-1.813922, -1.107442, -0.5345563, 0, 0, 0, 1, 1,
-1.793268, 0.4800176, -2.313345, 0, 0, 0, 1, 1,
-1.788811, -0.8253059, -3.821637, 0, 0, 0, 1, 1,
-1.782068, -1.596529, -2.656148, 1, 1, 1, 1, 1,
-1.772384, -0.3460584, -1.591978, 1, 1, 1, 1, 1,
-1.772206, -0.3301086, -2.738266, 1, 1, 1, 1, 1,
-1.766459, 1.452988, -2.802642, 1, 1, 1, 1, 1,
-1.752682, -0.2134086, -2.435144, 1, 1, 1, 1, 1,
-1.743774, 0.8870891, 0.5399255, 1, 1, 1, 1, 1,
-1.73338, 0.4240961, -2.110423, 1, 1, 1, 1, 1,
-1.724293, -0.005387618, -1.353279, 1, 1, 1, 1, 1,
-1.714771, 1.344574, -1.15301, 1, 1, 1, 1, 1,
-1.68159, -1.016757, -3.845662, 1, 1, 1, 1, 1,
-1.668878, -0.709129, -3.043179, 1, 1, 1, 1, 1,
-1.664131, -0.08922289, -2.543033, 1, 1, 1, 1, 1,
-1.6066, 0.2741411, -1.065196, 1, 1, 1, 1, 1,
-1.590709, -1.444299, -0.8117303, 1, 1, 1, 1, 1,
-1.587353, -0.621582, -0.1195019, 1, 1, 1, 1, 1,
-1.58113, -0.5852077, -1.689254, 0, 0, 1, 1, 1,
-1.565682, 0.6574029, -0.9469348, 1, 0, 0, 1, 1,
-1.565447, 0.6144731, -1.068705, 1, 0, 0, 1, 1,
-1.554008, -1.010866, -2.522627, 1, 0, 0, 1, 1,
-1.552911, 1.458883, 0.07439028, 1, 0, 0, 1, 1,
-1.551749, -0.5476245, -4.405799, 1, 0, 0, 1, 1,
-1.548984, 0.5363327, -1.411597, 0, 0, 0, 1, 1,
-1.547276, -0.1720399, -2.739451, 0, 0, 0, 1, 1,
-1.530326, -0.746512, -1.085491, 0, 0, 0, 1, 1,
-1.529893, -0.2868293, -2.301635, 0, 0, 0, 1, 1,
-1.527315, -2.579952, -3.013488, 0, 0, 0, 1, 1,
-1.522239, -0.31742, -1.524435, 0, 0, 0, 1, 1,
-1.516065, -0.5586733, -2.200131, 0, 0, 0, 1, 1,
-1.50242, 0.4981308, -1.508297, 1, 1, 1, 1, 1,
-1.489951, 1.390964, -1.580249, 1, 1, 1, 1, 1,
-1.485961, 0.2844703, -0.6416838, 1, 1, 1, 1, 1,
-1.477094, 0.3722861, -1.174362, 1, 1, 1, 1, 1,
-1.438228, 1.106655, 0.344827, 1, 1, 1, 1, 1,
-1.437846, -0.5870154, -1.021287, 1, 1, 1, 1, 1,
-1.432931, -0.9128875, -1.548124, 1, 1, 1, 1, 1,
-1.421542, 1.438311, -1.958795, 1, 1, 1, 1, 1,
-1.417212, 0.6207488, 0.0173587, 1, 1, 1, 1, 1,
-1.410333, -0.6713889, -1.580464, 1, 1, 1, 1, 1,
-1.408698, 2.251809, -1.708517, 1, 1, 1, 1, 1,
-1.406482, 0.5397635, -0.09845118, 1, 1, 1, 1, 1,
-1.390988, 1.744603, -0.2059663, 1, 1, 1, 1, 1,
-1.390619, 0.4747552, -1.243715, 1, 1, 1, 1, 1,
-1.384368, 0.5539005, -0.2530809, 1, 1, 1, 1, 1,
-1.374746, -0.2319819, -1.626258, 0, 0, 1, 1, 1,
-1.370325, -0.8988795, -3.377835, 1, 0, 0, 1, 1,
-1.36217, -2.104678, -3.876033, 1, 0, 0, 1, 1,
-1.343102, -1.081566, -1.934796, 1, 0, 0, 1, 1,
-1.340568, -0.8237184, -1.024662, 1, 0, 0, 1, 1,
-1.337774, 1.20214, -1.078547, 1, 0, 0, 1, 1,
-1.324018, 1.201398, -0.9801725, 0, 0, 0, 1, 1,
-1.315224, 0.9302326, -0.1464935, 0, 0, 0, 1, 1,
-1.30506, -0.8734753, -0.177005, 0, 0, 0, 1, 1,
-1.303903, -1.075466, -4.150037, 0, 0, 0, 1, 1,
-1.299532, 0.7231992, -0.6436344, 0, 0, 0, 1, 1,
-1.297826, -0.676842, -1.327428, 0, 0, 0, 1, 1,
-1.297572, 1.221664, -2.279862, 0, 0, 0, 1, 1,
-1.286847, 0.8729867, -1.197505, 1, 1, 1, 1, 1,
-1.285844, 0.760207, 1.341496, 1, 1, 1, 1, 1,
-1.263625, -1.466612, -2.59957, 1, 1, 1, 1, 1,
-1.259832, 0.06960361, -2.364931, 1, 1, 1, 1, 1,
-1.250946, -1.758349, -2.929914, 1, 1, 1, 1, 1,
-1.237644, 1.566698, 0.2044631, 1, 1, 1, 1, 1,
-1.234625, -1.046661, -2.953929, 1, 1, 1, 1, 1,
-1.230414, 0.02030593, -0.4901659, 1, 1, 1, 1, 1,
-1.224632, 1.17561, -0.9135346, 1, 1, 1, 1, 1,
-1.219063, 0.9110364, -0.06829506, 1, 1, 1, 1, 1,
-1.19645, -1.19828, -1.263299, 1, 1, 1, 1, 1,
-1.193494, -0.3337648, -2.748288, 1, 1, 1, 1, 1,
-1.182905, -0.5235528, 0.6524852, 1, 1, 1, 1, 1,
-1.181368, -1.163588, -0.4981134, 1, 1, 1, 1, 1,
-1.180227, -0.6721202, -1.95058, 1, 1, 1, 1, 1,
-1.162971, 0.6870225, -1.496808, 0, 0, 1, 1, 1,
-1.156515, -0.8135882, -1.707827, 1, 0, 0, 1, 1,
-1.15512, -0.5799842, -1.470382, 1, 0, 0, 1, 1,
-1.150756, 1.508123, -0.1086237, 1, 0, 0, 1, 1,
-1.14021, -0.7097126, -2.554365, 1, 0, 0, 1, 1,
-1.134805, -1.532311, -3.426321, 1, 0, 0, 1, 1,
-1.131195, 1.684763, -0.5475647, 0, 0, 0, 1, 1,
-1.122274, 0.2591797, -0.7669634, 0, 0, 0, 1, 1,
-1.106967, 0.3770154, -1.155635, 0, 0, 0, 1, 1,
-1.094446, 0.7459622, -0.9697368, 0, 0, 0, 1, 1,
-1.094379, -0.3986258, -1.744659, 0, 0, 0, 1, 1,
-1.087083, -0.5525554, -1.365791, 0, 0, 0, 1, 1,
-1.082217, -0.7200485, -1.672842, 0, 0, 0, 1, 1,
-1.067474, 0.2004427, -3.138117, 1, 1, 1, 1, 1,
-1.066622, 0.1019351, -0.2733299, 1, 1, 1, 1, 1,
-1.065633, 2.59812, 0.4352758, 1, 1, 1, 1, 1,
-1.064203, -0.26486, -3.509445, 1, 1, 1, 1, 1,
-1.061484, 0.7675932, 0.01437387, 1, 1, 1, 1, 1,
-1.057128, 0.5011972, -1.150938, 1, 1, 1, 1, 1,
-1.055267, -0.3735022, -1.289538, 1, 1, 1, 1, 1,
-1.052638, 1.386348, -1.642163, 1, 1, 1, 1, 1,
-1.051702, -0.07216994, -3.235274, 1, 1, 1, 1, 1,
-1.048434, -0.8079514, -1.759559, 1, 1, 1, 1, 1,
-1.043006, 1.254519, -0.6285573, 1, 1, 1, 1, 1,
-1.030532, -0.2412518, -2.409715, 1, 1, 1, 1, 1,
-1.025154, 0.3370743, -2.063506, 1, 1, 1, 1, 1,
-1.023945, 0.3089602, -1.416041, 1, 1, 1, 1, 1,
-1.020266, -2.383464, -3.12156, 1, 1, 1, 1, 1,
-1.012973, -0.2013139, -2.267599, 0, 0, 1, 1, 1,
-1.010934, -0.3335827, -3.464139, 1, 0, 0, 1, 1,
-1.007739, 0.1525414, -1.325089, 1, 0, 0, 1, 1,
-1.004071, 0.07623326, 0.793551, 1, 0, 0, 1, 1,
-0.9998299, -1.028997, -2.943424, 1, 0, 0, 1, 1,
-0.9873647, -0.7680346, -1.026064, 1, 0, 0, 1, 1,
-0.9860099, 0.155852, -1.940396, 0, 0, 0, 1, 1,
-0.9805101, 0.584953, -2.368504, 0, 0, 0, 1, 1,
-0.9794552, 0.2002092, 0.06896152, 0, 0, 0, 1, 1,
-0.9770265, 0.05624589, -1.20556, 0, 0, 0, 1, 1,
-0.969445, 1.451223, 1.022959, 0, 0, 0, 1, 1,
-0.9691001, -1.082847, -1.768495, 0, 0, 0, 1, 1,
-0.9683257, -0.5622599, -0.7030653, 0, 0, 0, 1, 1,
-0.9538567, 1.876439, -0.490793, 1, 1, 1, 1, 1,
-0.9479323, -0.6773457, -1.65819, 1, 1, 1, 1, 1,
-0.9469101, 1.177605, -0.1067786, 1, 1, 1, 1, 1,
-0.9409961, -0.3906482, -1.040682, 1, 1, 1, 1, 1,
-0.9400724, 1.088673, -0.3202152, 1, 1, 1, 1, 1,
-0.9400255, 0.6051006, -1.966048, 1, 1, 1, 1, 1,
-0.9396208, 1.783266, -0.07367545, 1, 1, 1, 1, 1,
-0.9363177, 0.06648607, -3.451626, 1, 1, 1, 1, 1,
-0.9348083, 1.269371, -1.211265, 1, 1, 1, 1, 1,
-0.9274926, 1.060207, -1.741815, 1, 1, 1, 1, 1,
-0.9252633, -0.3516107, -0.4117547, 1, 1, 1, 1, 1,
-0.9237595, 0.5272807, -1.01842, 1, 1, 1, 1, 1,
-0.9235946, 0.4057669, 0.9202995, 1, 1, 1, 1, 1,
-0.9228972, 0.2938714, 0.1651126, 1, 1, 1, 1, 1,
-0.9220893, 0.4775488, -1.722532, 1, 1, 1, 1, 1,
-0.9146037, 0.07961384, -1.585315, 0, 0, 1, 1, 1,
-0.9054398, -1.038873, -3.176543, 1, 0, 0, 1, 1,
-0.9031474, -0.4857476, -4.064995, 1, 0, 0, 1, 1,
-0.9018743, 0.5471052, -0.2969196, 1, 0, 0, 1, 1,
-0.8966839, 0.3732943, 0.813188, 1, 0, 0, 1, 1,
-0.8955821, -0.2743267, -1.742505, 1, 0, 0, 1, 1,
-0.8911532, 0.09842296, 0.0775086, 0, 0, 0, 1, 1,
-0.8838021, -0.6005938, -2.795226, 0, 0, 0, 1, 1,
-0.878805, -0.3302185, -0.7518294, 0, 0, 0, 1, 1,
-0.8763643, 1.7686, 0.9240526, 0, 0, 0, 1, 1,
-0.8707734, -0.6158252, -2.418244, 0, 0, 0, 1, 1,
-0.8627456, -0.3197709, -0.4709349, 0, 0, 0, 1, 1,
-0.8588216, -2.467089, -2.81591, 0, 0, 0, 1, 1,
-0.8571185, -0.1486502, -0.1213998, 1, 1, 1, 1, 1,
-0.8543761, 0.04796836, 0.5311145, 1, 1, 1, 1, 1,
-0.85364, 1.120749, -1.228502, 1, 1, 1, 1, 1,
-0.8450677, -0.08280431, -1.65436, 1, 1, 1, 1, 1,
-0.8341666, 1.481373, -0.4705465, 1, 1, 1, 1, 1,
-0.8324788, -0.08579382, -3.616875, 1, 1, 1, 1, 1,
-0.8297992, 1.580246, -0.8921463, 1, 1, 1, 1, 1,
-0.8222765, -0.06894498, -2.631274, 1, 1, 1, 1, 1,
-0.8162664, -0.8119897, -3.396771, 1, 1, 1, 1, 1,
-0.8159247, 0.6159039, -2.580905, 1, 1, 1, 1, 1,
-0.8111848, -0.3328849, -1.298504, 1, 1, 1, 1, 1,
-0.8106309, 0.9332538, -1.187011, 1, 1, 1, 1, 1,
-0.8078406, 1.744741, -1.972981, 1, 1, 1, 1, 1,
-0.8061984, 1.304093, 0.4678488, 1, 1, 1, 1, 1,
-0.805532, 2.355909, -0.6281995, 1, 1, 1, 1, 1,
-0.8044215, 0.5478774, -1.228422, 0, 0, 1, 1, 1,
-0.7885163, 0.2498143, -1.666756, 1, 0, 0, 1, 1,
-0.7848524, 1.856377, -0.5088168, 1, 0, 0, 1, 1,
-0.783619, -0.3733527, -1.500103, 1, 0, 0, 1, 1,
-0.7776812, -0.857645, -2.45031, 1, 0, 0, 1, 1,
-0.773534, -0.5355104, -1.599684, 1, 0, 0, 1, 1,
-0.7705941, 1.291375, -1.552821, 0, 0, 0, 1, 1,
-0.7681892, 0.8749204, 0.5140071, 0, 0, 0, 1, 1,
-0.7626504, -2.082066, -1.660671, 0, 0, 0, 1, 1,
-0.7591423, -0.8848484, -3.156655, 0, 0, 0, 1, 1,
-0.7537296, -0.2766331, -1.75011, 0, 0, 0, 1, 1,
-0.7488103, -0.40407, -1.498309, 0, 0, 0, 1, 1,
-0.7475882, 2.501978, -0.9049021, 0, 0, 0, 1, 1,
-0.7427238, 0.1315883, -2.062219, 1, 1, 1, 1, 1,
-0.7414747, 0.495346, -0.5167983, 1, 1, 1, 1, 1,
-0.732602, -1.034615, -2.831375, 1, 1, 1, 1, 1,
-0.7315502, 0.3157966, -0.9574305, 1, 1, 1, 1, 1,
-0.7304029, -0.7035783, -3.169861, 1, 1, 1, 1, 1,
-0.7276228, 0.6150635, -1.915001, 1, 1, 1, 1, 1,
-0.7244753, -0.4695666, -1.558825, 1, 1, 1, 1, 1,
-0.7239195, -0.3812417, -3.145791, 1, 1, 1, 1, 1,
-0.721302, -0.3990437, -1.436931, 1, 1, 1, 1, 1,
-0.7196843, -0.2469288, -2.116977, 1, 1, 1, 1, 1,
-0.7181047, 0.05474257, -1.14083, 1, 1, 1, 1, 1,
-0.7148509, -0.7776345, -0.9250208, 1, 1, 1, 1, 1,
-0.7134119, 0.4911656, -0.7591509, 1, 1, 1, 1, 1,
-0.7101412, 1.233632, 0.6041548, 1, 1, 1, 1, 1,
-0.706533, 3.00877, 0.775239, 1, 1, 1, 1, 1,
-0.7051398, -0.0741961, -0.952017, 0, 0, 1, 1, 1,
-0.6996896, 1.47427, -0.3017211, 1, 0, 0, 1, 1,
-0.6850684, -0.3238342, -3.392483, 1, 0, 0, 1, 1,
-0.6847099, -1.889236, -3.013068, 1, 0, 0, 1, 1,
-0.6833536, 1.654629, 0.07792063, 1, 0, 0, 1, 1,
-0.6833387, -0.2477495, -3.035015, 1, 0, 0, 1, 1,
-0.6735696, -0.8932067, -2.107244, 0, 0, 0, 1, 1,
-0.6676149, 1.304643, 0.2338723, 0, 0, 0, 1, 1,
-0.66597, -0.9845214, -2.297353, 0, 0, 0, 1, 1,
-0.6656228, 0.3787747, -1.77143, 0, 0, 0, 1, 1,
-0.6635872, 0.8759839, -0.7070445, 0, 0, 0, 1, 1,
-0.6625094, -1.508834, -4.638359, 0, 0, 0, 1, 1,
-0.6588026, 0.7135817, -1.325741, 0, 0, 0, 1, 1,
-0.6530179, -0.5209001, -2.20271, 1, 1, 1, 1, 1,
-0.6520793, 0.5610752, 0.7539032, 1, 1, 1, 1, 1,
-0.651529, -0.693248, -3.515843, 1, 1, 1, 1, 1,
-0.6505402, 0.1588014, -1.978575, 1, 1, 1, 1, 1,
-0.6474444, 2.39293, 1.05568, 1, 1, 1, 1, 1,
-0.647433, -0.5616031, -2.074578, 1, 1, 1, 1, 1,
-0.6416652, 0.172992, -2.08285, 1, 1, 1, 1, 1,
-0.6405916, 0.7905454, 0.3951358, 1, 1, 1, 1, 1,
-0.6387072, -1.467319, -3.32121, 1, 1, 1, 1, 1,
-0.6373228, 1.375603, 1.065813, 1, 1, 1, 1, 1,
-0.6331033, 0.6487705, -2.261021, 1, 1, 1, 1, 1,
-0.627911, 1.520828, 0.3501548, 1, 1, 1, 1, 1,
-0.6271052, -0.804661, -3.630701, 1, 1, 1, 1, 1,
-0.6259176, 0.3728169, -0.2349085, 1, 1, 1, 1, 1,
-0.6244268, 0.4201485, -1.067669, 1, 1, 1, 1, 1,
-0.617376, 0.5124108, -0.4680411, 0, 0, 1, 1, 1,
-0.6140472, 0.4426365, 0.4684179, 1, 0, 0, 1, 1,
-0.6134619, -0.006272296, -1.846011, 1, 0, 0, 1, 1,
-0.6128004, -0.5334205, -2.602514, 1, 0, 0, 1, 1,
-0.6079326, -0.2107597, -0.1600677, 1, 0, 0, 1, 1,
-0.6075457, -0.1233831, -0.8241869, 1, 0, 0, 1, 1,
-0.6070601, -1.162346, -2.445918, 0, 0, 0, 1, 1,
-0.6047747, -0.6043999, -3.487037, 0, 0, 0, 1, 1,
-0.6040418, -1.026921, -2.900109, 0, 0, 0, 1, 1,
-0.6035832, 1.015035, -1.274149, 0, 0, 0, 1, 1,
-0.6029404, -0.7613089, -2.868752, 0, 0, 0, 1, 1,
-0.5965269, 0.4007269, -0.4928333, 0, 0, 0, 1, 1,
-0.5901649, -0.29772, -2.47604, 0, 0, 0, 1, 1,
-0.5852639, -0.3718368, -2.322324, 1, 1, 1, 1, 1,
-0.5845557, 0.2158072, -0.3057686, 1, 1, 1, 1, 1,
-0.5825135, 0.5050746, -0.3616326, 1, 1, 1, 1, 1,
-0.5809585, 0.8415236, -1.661342, 1, 1, 1, 1, 1,
-0.5715968, -1.461411, -3.72616, 1, 1, 1, 1, 1,
-0.566219, -0.1557747, -0.1802568, 1, 1, 1, 1, 1,
-0.5597773, -2.433787, -2.433165, 1, 1, 1, 1, 1,
-0.5470631, 0.5917633, -0.6916812, 1, 1, 1, 1, 1,
-0.544901, -1.384607, -2.172681, 1, 1, 1, 1, 1,
-0.5431519, 1.260438, -0.4587221, 1, 1, 1, 1, 1,
-0.5389244, -1.219195, -1.865381, 1, 1, 1, 1, 1,
-0.5349022, 1.556412, 1.508113, 1, 1, 1, 1, 1,
-0.5289212, 1.554484, -0.9328774, 1, 1, 1, 1, 1,
-0.5229108, -0.6568136, -2.987066, 1, 1, 1, 1, 1,
-0.5219188, -0.1653565, -2.675566, 1, 1, 1, 1, 1,
-0.5207329, -0.380407, -0.901415, 0, 0, 1, 1, 1,
-0.5206693, -1.689601, -4.124086, 1, 0, 0, 1, 1,
-0.5197904, -0.9801203, -2.636705, 1, 0, 0, 1, 1,
-0.5190921, 1.304956, -0.909212, 1, 0, 0, 1, 1,
-0.5166954, -0.9285012, -2.280753, 1, 0, 0, 1, 1,
-0.514257, -0.2892939, -1.236439, 1, 0, 0, 1, 1,
-0.51325, 0.4485989, -1.073445, 0, 0, 0, 1, 1,
-0.5113094, -0.472609, -3.248267, 0, 0, 0, 1, 1,
-0.5111418, 0.5579969, 0.06360311, 0, 0, 0, 1, 1,
-0.5038571, -0.2626588, -1.902765, 0, 0, 0, 1, 1,
-0.5017576, -0.4754472, -3.018103, 0, 0, 0, 1, 1,
-0.5002674, -2.035182, -3.541308, 0, 0, 0, 1, 1,
-0.4991749, 0.7160639, -1.493795, 0, 0, 0, 1, 1,
-0.4978281, -1.672018, -1.470303, 1, 1, 1, 1, 1,
-0.495663, 1.34139, -0.8625286, 1, 1, 1, 1, 1,
-0.4891751, -0.4352379, -0.8348184, 1, 1, 1, 1, 1,
-0.4881044, 1.842369, -1.113694, 1, 1, 1, 1, 1,
-0.4877569, -0.5562851, -3.574794, 1, 1, 1, 1, 1,
-0.4862969, 0.2652906, -1.11835, 1, 1, 1, 1, 1,
-0.4860857, 0.6906495, 0.8955513, 1, 1, 1, 1, 1,
-0.4837486, 0.1520221, -2.859708, 1, 1, 1, 1, 1,
-0.4775905, -0.5450323, -3.984979, 1, 1, 1, 1, 1,
-0.4770958, 2.043723, -1.825192, 1, 1, 1, 1, 1,
-0.4727165, -1.564945, -4.943953, 1, 1, 1, 1, 1,
-0.4721068, -2.122119, -3.557149, 1, 1, 1, 1, 1,
-0.4702686, 1.173752, -0.580485, 1, 1, 1, 1, 1,
-0.4697064, 0.5714372, 0.8838714, 1, 1, 1, 1, 1,
-0.4692842, 2.643964, -0.1980125, 1, 1, 1, 1, 1,
-0.4655934, 0.2300406, -0.5275382, 0, 0, 1, 1, 1,
-0.4642937, 1.527514, -0.3129093, 1, 0, 0, 1, 1,
-0.4602327, 0.203963, -0.8532044, 1, 0, 0, 1, 1,
-0.4579026, 1.034314, -0.2505007, 1, 0, 0, 1, 1,
-0.4569666, 0.9747737, -1.061938, 1, 0, 0, 1, 1,
-0.4542843, 0.8645687, -0.8030344, 1, 0, 0, 1, 1,
-0.4509264, 1.266188, -0.8065086, 0, 0, 0, 1, 1,
-0.4479811, 0.05804028, -2.035053, 0, 0, 0, 1, 1,
-0.4479105, 1.164908, -0.02353108, 0, 0, 0, 1, 1,
-0.4435336, 0.04840731, -1.868922, 0, 0, 0, 1, 1,
-0.4410987, 1.54147, -0.0877858, 0, 0, 0, 1, 1,
-0.4404692, 2.254945, -0.6106981, 0, 0, 0, 1, 1,
-0.4401639, -0.3343703, -2.952534, 0, 0, 0, 1, 1,
-0.4397969, -0.4063301, -1.403164, 1, 1, 1, 1, 1,
-0.4393618, 1.863213, 0.8891909, 1, 1, 1, 1, 1,
-0.4381085, 2.588581, -0.223083, 1, 1, 1, 1, 1,
-0.4353096, 0.2139594, -1.20601, 1, 1, 1, 1, 1,
-0.4307332, -1.469504, -3.010868, 1, 1, 1, 1, 1,
-0.4275433, 0.12114, -2.340983, 1, 1, 1, 1, 1,
-0.4275272, 0.1239459, -0.7748564, 1, 1, 1, 1, 1,
-0.4264051, 0.4451206, -0.4743209, 1, 1, 1, 1, 1,
-0.4059427, -0.09864877, -0.5742863, 1, 1, 1, 1, 1,
-0.4045301, -2.121979, -2.626534, 1, 1, 1, 1, 1,
-0.4031862, -0.2406661, -0.5089937, 1, 1, 1, 1, 1,
-0.3990876, 0.2878583, -4.040061, 1, 1, 1, 1, 1,
-0.3914418, 0.8171443, -0.3865663, 1, 1, 1, 1, 1,
-0.3885405, 0.1652421, -0.1081788, 1, 1, 1, 1, 1,
-0.3871408, 0.7299144, -1.813711, 1, 1, 1, 1, 1,
-0.380159, -2.054642, -2.92948, 0, 0, 1, 1, 1,
-0.3784278, 0.344897, -2.279394, 1, 0, 0, 1, 1,
-0.3767774, 1.274897, -0.2090667, 1, 0, 0, 1, 1,
-0.3745973, 1.074984, 0.4753401, 1, 0, 0, 1, 1,
-0.3704844, 0.2927843, -2.112957, 1, 0, 0, 1, 1,
-0.3693292, 1.296744, -0.7861172, 1, 0, 0, 1, 1,
-0.3680647, -0.2712654, -2.339441, 0, 0, 0, 1, 1,
-0.3677519, -1.163654, -3.318649, 0, 0, 0, 1, 1,
-0.3668413, -0.7874647, -1.311664, 0, 0, 0, 1, 1,
-0.3638617, 0.7893393, -1.246488, 0, 0, 0, 1, 1,
-0.360015, -1.312008, -0.9800467, 0, 0, 0, 1, 1,
-0.3588042, -0.3961139, -0.6710485, 0, 0, 0, 1, 1,
-0.3570586, -0.52139, -1.997018, 0, 0, 0, 1, 1,
-0.3569917, -1.117409, -1.011793, 1, 1, 1, 1, 1,
-0.3539244, 0.1657504, -1.783288, 1, 1, 1, 1, 1,
-0.3534894, -1.933805, -3.667486, 1, 1, 1, 1, 1,
-0.3522005, -1.639862, -3.560903, 1, 1, 1, 1, 1,
-0.352025, 0.7499334, 1.004871, 1, 1, 1, 1, 1,
-0.3495602, -1.253958, -4.143837, 1, 1, 1, 1, 1,
-0.3484373, 0.2159375, -0.8648867, 1, 1, 1, 1, 1,
-0.3472897, 2.928484, -0.7729489, 1, 1, 1, 1, 1,
-0.3456038, -0.5084502, -2.704071, 1, 1, 1, 1, 1,
-0.3440244, -0.0527708, -2.051726, 1, 1, 1, 1, 1,
-0.3352382, 0.7288306, -1.552106, 1, 1, 1, 1, 1,
-0.3293069, -0.2963726, -2.624522, 1, 1, 1, 1, 1,
-0.3244404, 1.625232, 0.5165446, 1, 1, 1, 1, 1,
-0.3236909, 0.2305928, 1.183523, 1, 1, 1, 1, 1,
-0.321247, -0.4350361, -2.085781, 1, 1, 1, 1, 1,
-0.3209941, -0.1396174, -1.73475, 0, 0, 1, 1, 1,
-0.3167703, 1.245919, -0.757051, 1, 0, 0, 1, 1,
-0.3114183, -0.5561264, -2.572491, 1, 0, 0, 1, 1,
-0.3089264, -0.1827087, -1.709695, 1, 0, 0, 1, 1,
-0.298783, 0.4147342, -1.137911, 1, 0, 0, 1, 1,
-0.2975483, 0.8553471, -3.073076, 1, 0, 0, 1, 1,
-0.2936397, -1.29591, -1.623541, 0, 0, 0, 1, 1,
-0.2921086, -0.229404, -3.194058, 0, 0, 0, 1, 1,
-0.2825083, 0.4940944, 0.006664371, 0, 0, 0, 1, 1,
-0.2820184, 2.039945, -1.146185, 0, 0, 0, 1, 1,
-0.2804113, -0.5440594, -3.48658, 0, 0, 0, 1, 1,
-0.2732807, 0.1715367, 0.1136188, 0, 0, 0, 1, 1,
-0.2721981, -0.8605048, -1.563544, 0, 0, 0, 1, 1,
-0.2705968, -0.5603736, -3.675327, 1, 1, 1, 1, 1,
-0.2704087, -0.4013362, -2.711339, 1, 1, 1, 1, 1,
-0.2677276, 0.761142, 0.6809748, 1, 1, 1, 1, 1,
-0.2660744, -0.00154239, -1.492687, 1, 1, 1, 1, 1,
-0.2605908, 0.6098081, -0.05950222, 1, 1, 1, 1, 1,
-0.2600182, -1.546882, -4.034105, 1, 1, 1, 1, 1,
-0.2571021, -1.682312, -1.420852, 1, 1, 1, 1, 1,
-0.2544737, -1.055489, -3.763055, 1, 1, 1, 1, 1,
-0.2541782, 1.904411, -0.9324817, 1, 1, 1, 1, 1,
-0.253663, -0.5406963, -3.284753, 1, 1, 1, 1, 1,
-0.2523889, -1.316589, -2.891138, 1, 1, 1, 1, 1,
-0.2471211, 1.225811, -0.3935497, 1, 1, 1, 1, 1,
-0.244827, -1.369025, -2.493035, 1, 1, 1, 1, 1,
-0.2434034, 0.5649607, -0.6839007, 1, 1, 1, 1, 1,
-0.2390935, -0.2969514, -2.220743, 1, 1, 1, 1, 1,
-0.2360511, -1.186893, -2.870053, 0, 0, 1, 1, 1,
-0.2338777, -2.026091, -5.320217, 1, 0, 0, 1, 1,
-0.2325365, -1.83671, -2.14019, 1, 0, 0, 1, 1,
-0.2283801, -0.7903644, -3.268665, 1, 0, 0, 1, 1,
-0.2236193, -2.130738, -3.063943, 1, 0, 0, 1, 1,
-0.2210536, -0.08873895, -1.654581, 1, 0, 0, 1, 1,
-0.2198202, 0.04307044, -1.313544, 0, 0, 0, 1, 1,
-0.2182758, -0.1343013, -2.860614, 0, 0, 0, 1, 1,
-0.2135998, -0.03047585, -0.831372, 0, 0, 0, 1, 1,
-0.2120117, 1.401458, 0.2851346, 0, 0, 0, 1, 1,
-0.2118059, 0.5384518, -0.2994971, 0, 0, 0, 1, 1,
-0.2115642, 0.06383394, 1.413927, 0, 0, 0, 1, 1,
-0.2044133, 0.3780092, -1.028442, 0, 0, 0, 1, 1,
-0.2001351, -1.150367, -2.625112, 1, 1, 1, 1, 1,
-0.1966216, 1.787356, -1.461382, 1, 1, 1, 1, 1,
-0.1965352, 1.076573, -1.542863, 1, 1, 1, 1, 1,
-0.1954027, 1.648607, -0.2482446, 1, 1, 1, 1, 1,
-0.1866263, 1.469601, 0.626038, 1, 1, 1, 1, 1,
-0.1864365, -0.2202022, -2.494374, 1, 1, 1, 1, 1,
-0.1855907, -0.4222409, -1.426037, 1, 1, 1, 1, 1,
-0.1769299, 1.471515, 0.5810528, 1, 1, 1, 1, 1,
-0.1746427, -1.254839, -3.502347, 1, 1, 1, 1, 1,
-0.173847, -1.090547, -4.122911, 1, 1, 1, 1, 1,
-0.1680683, 0.8704903, -0.6740158, 1, 1, 1, 1, 1,
-0.1672158, 0.5663009, -0.7855501, 1, 1, 1, 1, 1,
-0.164612, -0.9410756, -4.276766, 1, 1, 1, 1, 1,
-0.1623566, 1.497595, 0.4365815, 1, 1, 1, 1, 1,
-0.1593275, -1.112946, -2.936055, 1, 1, 1, 1, 1,
-0.1483205, -0.5946192, -3.431697, 0, 0, 1, 1, 1,
-0.1465199, -0.2773774, -3.995039, 1, 0, 0, 1, 1,
-0.1430276, -0.8326791, -4.701405, 1, 0, 0, 1, 1,
-0.1426921, 0.4883505, -0.9768302, 1, 0, 0, 1, 1,
-0.1423662, 0.3444836, -1.268613, 1, 0, 0, 1, 1,
-0.1390243, 1.568194, 0.7270116, 1, 0, 0, 1, 1,
-0.1387849, 2.512347, -0.008322154, 0, 0, 0, 1, 1,
-0.1375951, -0.5077311, -4.915952, 0, 0, 0, 1, 1,
-0.1341385, -0.2844886, -3.020785, 0, 0, 0, 1, 1,
-0.134023, 0.572621, -0.3638248, 0, 0, 0, 1, 1,
-0.1315927, -0.8645236, -2.016006, 0, 0, 0, 1, 1,
-0.1272436, -1.44591, -4.108774, 0, 0, 0, 1, 1,
-0.1230562, 0.4400083, -1.892764, 0, 0, 0, 1, 1,
-0.1204882, -0.8205372, -3.399634, 1, 1, 1, 1, 1,
-0.1179833, -0.9551798, -2.228157, 1, 1, 1, 1, 1,
-0.1160345, -0.006119158, -1.485129, 1, 1, 1, 1, 1,
-0.1157281, -0.03125967, -2.007435, 1, 1, 1, 1, 1,
-0.1152477, 0.3654853, -0.9948397, 1, 1, 1, 1, 1,
-0.1108239, 0.1269194, -0.3640997, 1, 1, 1, 1, 1,
-0.1084578, -0.2428233, -3.36972, 1, 1, 1, 1, 1,
-0.1080357, 0.3888699, 0.4912824, 1, 1, 1, 1, 1,
-0.1078024, 2.652278, 1.330215, 1, 1, 1, 1, 1,
-0.1020865, 0.1286686, 0.1585642, 1, 1, 1, 1, 1,
-0.1012224, 0.8329036, 0.2788261, 1, 1, 1, 1, 1,
-0.1008132, 1.584864, 0.09467214, 1, 1, 1, 1, 1,
-0.09793332, 0.0636071, 0.2419275, 1, 1, 1, 1, 1,
-0.09612598, -0.08556537, -3.498215, 1, 1, 1, 1, 1,
-0.09558152, 0.770683, 0.9946535, 1, 1, 1, 1, 1,
-0.09185201, -0.2104921, -4.189555, 0, 0, 1, 1, 1,
-0.08098711, 1.241256, -0.3727044, 1, 0, 0, 1, 1,
-0.07872845, 1.688009, -0.7278746, 1, 0, 0, 1, 1,
-0.07747743, -1.538904, -3.553542, 1, 0, 0, 1, 1,
-0.0763459, -0.242039, -2.690194, 1, 0, 0, 1, 1,
-0.07548224, 0.04814598, -0.4801314, 1, 0, 0, 1, 1,
-0.06318945, -0.5672452, -0.820834, 0, 0, 0, 1, 1,
-0.05737455, -1.374829, -3.945204, 0, 0, 0, 1, 1,
-0.05383441, 0.4129397, -0.6181196, 0, 0, 0, 1, 1,
-0.04937625, -0.2643915, -3.819473, 0, 0, 0, 1, 1,
-0.04802579, 1.072936, -1.637404, 0, 0, 0, 1, 1,
-0.04171829, 2.043674, -0.5376628, 0, 0, 0, 1, 1,
-0.03708412, 1.763049, 0.5162776, 0, 0, 0, 1, 1,
-0.03485004, 0.9617065, -0.2492007, 1, 1, 1, 1, 1,
-0.03358221, -0.5454166, -2.554911, 1, 1, 1, 1, 1,
-0.03357602, -1.14853, -2.963267, 1, 1, 1, 1, 1,
-0.0308712, 0.3225493, -1.439362, 1, 1, 1, 1, 1,
-0.03063647, 0.02363685, -0.4730336, 1, 1, 1, 1, 1,
-0.0255012, 1.218148, 0.4345426, 1, 1, 1, 1, 1,
-0.02513786, 0.2258077, -1.123574, 1, 1, 1, 1, 1,
-0.02084803, -0.01869014, -4.163901, 1, 1, 1, 1, 1,
-0.02039033, -1.065411, -2.625052, 1, 1, 1, 1, 1,
-0.01978191, 1.231778, -0.3819116, 1, 1, 1, 1, 1,
-0.0197089, 1.649362, 0.1015237, 1, 1, 1, 1, 1,
-0.01883063, -1.768643, -5.819643, 1, 1, 1, 1, 1,
-0.01782267, 1.156829, -0.1476041, 1, 1, 1, 1, 1,
-0.01726197, 0.54807, -1.194661, 1, 1, 1, 1, 1,
-0.01504302, 0.01233159, -0.4676799, 1, 1, 1, 1, 1,
-0.009061301, -1.022586, -2.927598, 0, 0, 1, 1, 1,
0.001681345, -0.1803342, 3.67527, 1, 0, 0, 1, 1,
0.002370445, 0.1554729, -2.060611, 1, 0, 0, 1, 1,
0.002423369, -0.2530901, 3.440385, 1, 0, 0, 1, 1,
0.002657617, 0.3207437, -1.238302, 1, 0, 0, 1, 1,
0.005403852, -0.4942931, 3.518234, 1, 0, 0, 1, 1,
0.009113361, -0.7563329, 3.146679, 0, 0, 0, 1, 1,
0.009787953, 0.001469816, 0.3924753, 0, 0, 0, 1, 1,
0.009841872, -1.546764, 3.624665, 0, 0, 0, 1, 1,
0.01266325, 1.327266, -1.354285, 0, 0, 0, 1, 1,
0.01496049, -0.9533743, 2.445581, 0, 0, 0, 1, 1,
0.01609834, 3.106537, 0.2521725, 0, 0, 0, 1, 1,
0.01960132, 1.913807, 1.087012, 0, 0, 0, 1, 1,
0.0233625, -1.527298, 4.652122, 1, 1, 1, 1, 1,
0.02452664, -1.649397, 2.886034, 1, 1, 1, 1, 1,
0.02736839, -0.3853936, 4.043034, 1, 1, 1, 1, 1,
0.02789743, -0.4481315, 4.171465, 1, 1, 1, 1, 1,
0.02906769, 0.3977785, -0.5033368, 1, 1, 1, 1, 1,
0.0300672, -0.7509873, 3.373703, 1, 1, 1, 1, 1,
0.03074579, 1.221483, 0.8208711, 1, 1, 1, 1, 1,
0.03226617, -0.1121246, 3.718714, 1, 1, 1, 1, 1,
0.03304475, -0.546379, 1.722749, 1, 1, 1, 1, 1,
0.03340887, -0.4829466, 2.455768, 1, 1, 1, 1, 1,
0.03534322, 1.222368, 0.8226346, 1, 1, 1, 1, 1,
0.03739033, -0.1662446, 2.529743, 1, 1, 1, 1, 1,
0.03896815, 0.7774699, 0.2787615, 1, 1, 1, 1, 1,
0.03921746, 1.155211, -1.194461, 1, 1, 1, 1, 1,
0.04097526, 1.886786, -0.4807275, 1, 1, 1, 1, 1,
0.04318666, 0.9313279, 0.806327, 0, 0, 1, 1, 1,
0.04568118, -0.120632, 1.201874, 1, 0, 0, 1, 1,
0.04702646, 1.475159, 0.4751814, 1, 0, 0, 1, 1,
0.04753299, 0.5228537, 1.431482, 1, 0, 0, 1, 1,
0.04823109, -1.889558, 3.05145, 1, 0, 0, 1, 1,
0.05158146, 2.143277, -0.1015968, 1, 0, 0, 1, 1,
0.05958638, -1.465581, 2.598892, 0, 0, 0, 1, 1,
0.06015739, 0.1752507, -2.166644, 0, 0, 0, 1, 1,
0.06082655, -0.2063047, 3.66626, 0, 0, 0, 1, 1,
0.0631193, -0.2890374, 5.101131, 0, 0, 0, 1, 1,
0.06623244, -0.2705223, 4.016545, 0, 0, 0, 1, 1,
0.07505295, 0.4548257, 1.713805, 0, 0, 0, 1, 1,
0.07680143, 1.755763, 0.684651, 0, 0, 0, 1, 1,
0.08244018, -0.2646415, 2.734853, 1, 1, 1, 1, 1,
0.08374599, -1.191518, 3.808497, 1, 1, 1, 1, 1,
0.08582386, -0.6120032, 4.596376, 1, 1, 1, 1, 1,
0.08628549, -0.7898399, 3.350859, 1, 1, 1, 1, 1,
0.09086131, 0.8720522, -1.050369, 1, 1, 1, 1, 1,
0.09136299, -0.9913266, 0.4674609, 1, 1, 1, 1, 1,
0.09530596, 0.5226349, -0.2881389, 1, 1, 1, 1, 1,
0.09781498, -0.01677073, 1.211837, 1, 1, 1, 1, 1,
0.09928861, -0.7390991, 1.684723, 1, 1, 1, 1, 1,
0.1005813, 0.3901141, 0.09894291, 1, 1, 1, 1, 1,
0.1036843, -0.1968586, 3.180687, 1, 1, 1, 1, 1,
0.1042492, -0.4970694, 3.858526, 1, 1, 1, 1, 1,
0.1061586, -0.2345411, 2.687838, 1, 1, 1, 1, 1,
0.1130597, 0.09096513, 0.8820674, 1, 1, 1, 1, 1,
0.1148877, 1.633556, -0.7934227, 1, 1, 1, 1, 1,
0.1150582, 0.7215195, -0.3339032, 0, 0, 1, 1, 1,
0.1222287, 0.6691973, -0.0476563, 1, 0, 0, 1, 1,
0.1294235, -0.05634652, 2.346821, 1, 0, 0, 1, 1,
0.1326794, -0.00343903, -0.04710343, 1, 0, 0, 1, 1,
0.1328635, -1.267825, 2.823094, 1, 0, 0, 1, 1,
0.1344587, 1.331121, 2.455653, 1, 0, 0, 1, 1,
0.1355159, 0.06512925, 0.3314571, 0, 0, 0, 1, 1,
0.1371731, -0.09124829, 4.816951, 0, 0, 0, 1, 1,
0.1407134, 0.4432554, 1.469502, 0, 0, 0, 1, 1,
0.141397, 1.478309, -0.02616169, 0, 0, 0, 1, 1,
0.1442393, -1.17431, 2.616238, 0, 0, 0, 1, 1,
0.1467909, -1.064431, 1.333995, 0, 0, 0, 1, 1,
0.1500103, -0.5235522, 2.801487, 0, 0, 0, 1, 1,
0.153692, 0.06092109, 1.424614, 1, 1, 1, 1, 1,
0.1554123, -0.6488722, 2.198976, 1, 1, 1, 1, 1,
0.1557062, 0.4020632, -0.01315976, 1, 1, 1, 1, 1,
0.1592391, 0.7319195, -0.0605983, 1, 1, 1, 1, 1,
0.1607674, -0.1067256, 3.15725, 1, 1, 1, 1, 1,
0.1615694, 0.7204785, -0.3656928, 1, 1, 1, 1, 1,
0.1622135, 1.168525, 0.05353158, 1, 1, 1, 1, 1,
0.1669773, 0.1751109, 2.406245, 1, 1, 1, 1, 1,
0.1693721, -1.622675, 3.502931, 1, 1, 1, 1, 1,
0.1791542, 1.414627, 0.8128771, 1, 1, 1, 1, 1,
0.1809295, 0.2498021, -0.02610765, 1, 1, 1, 1, 1,
0.1823713, 0.09988584, 1.887454, 1, 1, 1, 1, 1,
0.183961, 0.7588494, -1.025059, 1, 1, 1, 1, 1,
0.1858269, 1.536869, -0.6589925, 1, 1, 1, 1, 1,
0.1883699, 0.7679745, 1.782091, 1, 1, 1, 1, 1,
0.19027, 1.573422, -0.1584595, 0, 0, 1, 1, 1,
0.1965214, 0.2498058, 1.379777, 1, 0, 0, 1, 1,
0.1984787, -1.266038, 3.228345, 1, 0, 0, 1, 1,
0.2013176, -0.8258959, 2.535188, 1, 0, 0, 1, 1,
0.2054654, -1.278855, 3.040862, 1, 0, 0, 1, 1,
0.2106615, -0.1129308, 1.032976, 1, 0, 0, 1, 1,
0.2110641, 1.692729, -0.680567, 0, 0, 0, 1, 1,
0.2140026, 1.11894, -0.3432972, 0, 0, 0, 1, 1,
0.2144757, 0.4863586, 1.36131, 0, 0, 0, 1, 1,
0.2152477, -2.104461, 1.563807, 0, 0, 0, 1, 1,
0.2156339, 1.655074, -0.8708392, 0, 0, 0, 1, 1,
0.2185609, 2.125201, -1.652353, 0, 0, 0, 1, 1,
0.2261805, 1.154874, 1.072472, 0, 0, 0, 1, 1,
0.2315265, 1.607106, 0.1824979, 1, 1, 1, 1, 1,
0.234232, 0.377782, 1.834673, 1, 1, 1, 1, 1,
0.2343277, -1.390484, 2.902689, 1, 1, 1, 1, 1,
0.2534688, -0.5388427, 3.245255, 1, 1, 1, 1, 1,
0.2546523, -0.5249069, 3.107892, 1, 1, 1, 1, 1,
0.2593151, 0.9072595, 0.5395386, 1, 1, 1, 1, 1,
0.2655478, -0.859173, 3.34917, 1, 1, 1, 1, 1,
0.267624, 0.8682911, -0.6484621, 1, 1, 1, 1, 1,
0.2755585, 0.2025849, -0.8175997, 1, 1, 1, 1, 1,
0.2768672, 1.447236, 1.742, 1, 1, 1, 1, 1,
0.2785347, 1.212152, -0.4772486, 1, 1, 1, 1, 1,
0.2794742, 0.5631669, 1.787078, 1, 1, 1, 1, 1,
0.281104, -0.02575577, 1.542155, 1, 1, 1, 1, 1,
0.285014, -1.076979, 1.794772, 1, 1, 1, 1, 1,
0.2916804, -0.8512288, 3.616715, 1, 1, 1, 1, 1,
0.2936715, -2.216508, 2.631962, 0, 0, 1, 1, 1,
0.2951893, 0.4300188, 0.04452543, 1, 0, 0, 1, 1,
0.2967798, -1.461724, 3.06798, 1, 0, 0, 1, 1,
0.3042616, -0.7420266, 5.407761, 1, 0, 0, 1, 1,
0.3052205, -0.4682615, 1.908391, 1, 0, 0, 1, 1,
0.3102751, 1.446572, 2.079222, 1, 0, 0, 1, 1,
0.3227232, 0.1930704, 0.07442385, 0, 0, 0, 1, 1,
0.323124, -0.8396217, 2.98315, 0, 0, 0, 1, 1,
0.326724, 0.01018095, 2.657846, 0, 0, 0, 1, 1,
0.3270505, -0.9345133, 4.388062, 0, 0, 0, 1, 1,
0.3273841, 0.2236364, -0.5650373, 0, 0, 0, 1, 1,
0.3281907, -0.1519773, 0.4480162, 0, 0, 0, 1, 1,
0.3334037, 0.5275611, 0.852934, 0, 0, 0, 1, 1,
0.3356703, -0.9722868, 1.563355, 1, 1, 1, 1, 1,
0.3369548, -1.688221, 3.565154, 1, 1, 1, 1, 1,
0.3392271, 2.52914, -1.115825, 1, 1, 1, 1, 1,
0.3445691, 0.6506692, 0.1162071, 1, 1, 1, 1, 1,
0.3450912, 0.5358776, -1.074976, 1, 1, 1, 1, 1,
0.3468384, 0.1085712, 1.856883, 1, 1, 1, 1, 1,
0.3480906, -0.9720881, 3.768282, 1, 1, 1, 1, 1,
0.3491031, 0.5547085, 0.4401148, 1, 1, 1, 1, 1,
0.3494119, -1.510626, 0.9946144, 1, 1, 1, 1, 1,
0.3505668, 2.152468, -1.792667, 1, 1, 1, 1, 1,
0.3509357, 1.72246, -1.428615, 1, 1, 1, 1, 1,
0.3585424, 1.401815, -0.619749, 1, 1, 1, 1, 1,
0.3604242, -1.014663, 4.288229, 1, 1, 1, 1, 1,
0.3612635, 0.7745452, -0.6186857, 1, 1, 1, 1, 1,
0.3616527, -0.9150389, 3.030489, 1, 1, 1, 1, 1,
0.3639773, 0.5544655, 1.661694, 0, 0, 1, 1, 1,
0.367835, -0.9163794, 3.419357, 1, 0, 0, 1, 1,
0.3685553, 1.499068, -0.3316759, 1, 0, 0, 1, 1,
0.3762583, -1.349415, 3.712345, 1, 0, 0, 1, 1,
0.376314, 1.925698, 1.277138, 1, 0, 0, 1, 1,
0.3763758, 1.778344, 0.5885141, 1, 0, 0, 1, 1,
0.3806999, -0.1670395, 2.256423, 0, 0, 0, 1, 1,
0.3814226, 0.5800846, 1.246945, 0, 0, 0, 1, 1,
0.3824958, -0.6873185, 2.76811, 0, 0, 0, 1, 1,
0.3830931, 0.7944525, 0.7350274, 0, 0, 0, 1, 1,
0.383284, -0.7927901, 2.572371, 0, 0, 0, 1, 1,
0.3857087, 1.770093, -1.267253, 0, 0, 0, 1, 1,
0.3917322, 0.131951, 3.237663, 0, 0, 0, 1, 1,
0.3975075, -0.2016734, 1.27563, 1, 1, 1, 1, 1,
0.3981427, 0.678546, 0.1539123, 1, 1, 1, 1, 1,
0.3983186, -1.366854, 3.163291, 1, 1, 1, 1, 1,
0.4056608, 0.7797129, 0.471006, 1, 1, 1, 1, 1,
0.4095673, 0.1040211, 2.095749, 1, 1, 1, 1, 1,
0.416601, -0.3109286, -0.6107965, 1, 1, 1, 1, 1,
0.417376, 0.8310108, 0.08590446, 1, 1, 1, 1, 1,
0.4189548, 0.3099958, 0.5441452, 1, 1, 1, 1, 1,
0.4206526, 0.1879649, 2.512953, 1, 1, 1, 1, 1,
0.4209816, -0.2567316, 1.344768, 1, 1, 1, 1, 1,
0.4220848, -2.194536, 3.941853, 1, 1, 1, 1, 1,
0.4227327, -2.470666, 1.574902, 1, 1, 1, 1, 1,
0.4246242, -2.504879, 1.835716, 1, 1, 1, 1, 1,
0.429074, 1.173749, -0.8232888, 1, 1, 1, 1, 1,
0.431504, -0.3367015, 1.057943, 1, 1, 1, 1, 1,
0.4328857, -0.6253586, 1.89847, 0, 0, 1, 1, 1,
0.4328942, 0.3700767, -1.887883, 1, 0, 0, 1, 1,
0.4336775, 0.6921851, -0.1197875, 1, 0, 0, 1, 1,
0.4371748, 0.187691, 2.945678, 1, 0, 0, 1, 1,
0.4393683, -1.06895, 3.30837, 1, 0, 0, 1, 1,
0.4415576, 1.31798, -0.07819907, 1, 0, 0, 1, 1,
0.4444535, 0.02779691, 1.319318, 0, 0, 0, 1, 1,
0.4503276, -1.840814, 3.397892, 0, 0, 0, 1, 1,
0.4521489, 1.359355, -1.409362, 0, 0, 0, 1, 1,
0.4568971, -0.1012293, 1.446277, 0, 0, 0, 1, 1,
0.4625812, 0.6617203, 1.102232, 0, 0, 0, 1, 1,
0.4676258, 1.43873, -0.01655282, 0, 0, 0, 1, 1,
0.4689235, 0.1821651, -1.381025, 0, 0, 0, 1, 1,
0.4698157, -0.3591838, 1.635959, 1, 1, 1, 1, 1,
0.4741725, -0.2553599, 2.923559, 1, 1, 1, 1, 1,
0.4859416, -1.351145, 1.547366, 1, 1, 1, 1, 1,
0.4871118, 1.023959, 0.7662625, 1, 1, 1, 1, 1,
0.4915873, -0.749908, 2.591021, 1, 1, 1, 1, 1,
0.5077983, -0.5610493, 3.890796, 1, 1, 1, 1, 1,
0.5084581, -1.458132, 3.231449, 1, 1, 1, 1, 1,
0.5089638, -0.03332846, 1.592202, 1, 1, 1, 1, 1,
0.5109948, 0.2291758, 0.6419466, 1, 1, 1, 1, 1,
0.5138276, 1.493164, 0.801057, 1, 1, 1, 1, 1,
0.5145112, 0.8668357, -0.5949522, 1, 1, 1, 1, 1,
0.5153481, -1.366915, 2.912177, 1, 1, 1, 1, 1,
0.5182897, 0.3629859, 1.631087, 1, 1, 1, 1, 1,
0.5186899, -0.934209, 2.346394, 1, 1, 1, 1, 1,
0.5193283, -0.3821976, 1.713847, 1, 1, 1, 1, 1,
0.5208982, -0.9411313, 3.517539, 0, 0, 1, 1, 1,
0.5212318, 0.5103225, -0.6017633, 1, 0, 0, 1, 1,
0.5284945, 0.9494545, 1.160855, 1, 0, 0, 1, 1,
0.5322496, 1.414225, -0.455, 1, 0, 0, 1, 1,
0.5333158, 0.6797814, 0.2381238, 1, 0, 0, 1, 1,
0.5349372, -0.5461593, 2.545772, 1, 0, 0, 1, 1,
0.5363918, 0.4858126, -1.155326, 0, 0, 0, 1, 1,
0.5373836, -0.4381095, 1.470423, 0, 0, 0, 1, 1,
0.5378138, 0.9890183, 0.9221714, 0, 0, 0, 1, 1,
0.5438316, 0.896397, -1.363138, 0, 0, 0, 1, 1,
0.5563217, 0.6802703, 1.730351, 0, 0, 0, 1, 1,
0.5610989, -0.3267325, 2.36411, 0, 0, 0, 1, 1,
0.5643167, -0.3697778, 2.47153, 0, 0, 0, 1, 1,
0.568377, 1.297824, 0.5603197, 1, 1, 1, 1, 1,
0.5728279, -1.468524, 2.024102, 1, 1, 1, 1, 1,
0.5768199, 0.4188006, 1.443683, 1, 1, 1, 1, 1,
0.5771568, 1.444137, 0.7659633, 1, 1, 1, 1, 1,
0.5805608, 0.2573844, 1.377367, 1, 1, 1, 1, 1,
0.5810893, 1.817003, 1.471437, 1, 1, 1, 1, 1,
0.5814115, -0.5918965, 0.9624538, 1, 1, 1, 1, 1,
0.5838854, 0.8119031, 1.16894, 1, 1, 1, 1, 1,
0.5971368, 0.5418613, 0.3806569, 1, 1, 1, 1, 1,
0.598317, 0.2462478, 1.742999, 1, 1, 1, 1, 1,
0.6040612, 2.251495, 1.605222, 1, 1, 1, 1, 1,
0.6052494, 0.117128, 1.317312, 1, 1, 1, 1, 1,
0.6084862, -0.1129488, 0.7365435, 1, 1, 1, 1, 1,
0.6098639, 0.1971201, 0.7306869, 1, 1, 1, 1, 1,
0.6103373, -0.6597467, 3.776982, 1, 1, 1, 1, 1,
0.616771, 1.513685, 0.273743, 0, 0, 1, 1, 1,
0.6183293, -0.5367435, 2.141429, 1, 0, 0, 1, 1,
0.6200528, 0.5530502, 1.600705, 1, 0, 0, 1, 1,
0.620182, 0.08328027, 1.007639, 1, 0, 0, 1, 1,
0.6212885, -1.767563, 3.253466, 1, 0, 0, 1, 1,
0.6241143, 0.8957195, 2.129659, 1, 0, 0, 1, 1,
0.6292263, -0.4188015, 3.788779, 0, 0, 0, 1, 1,
0.6304325, 0.4500111, -0.7614279, 0, 0, 0, 1, 1,
0.6338993, 0.5045521, 2.165701, 0, 0, 0, 1, 1,
0.6374501, 0.05734266, 0.2924988, 0, 0, 0, 1, 1,
0.638827, -0.002297021, 0.6826348, 0, 0, 0, 1, 1,
0.6390725, -1.5823, 1.28949, 0, 0, 0, 1, 1,
0.6395047, 0.4498683, 2.256503, 0, 0, 0, 1, 1,
0.6483743, 1.73126, 2.024395, 1, 1, 1, 1, 1,
0.6517666, -0.5037435, 2.359976, 1, 1, 1, 1, 1,
0.6562619, 0.29365, -0.08112969, 1, 1, 1, 1, 1,
0.6565006, -0.7601087, 2.948846, 1, 1, 1, 1, 1,
0.6590041, -0.06834101, -0.06405038, 1, 1, 1, 1, 1,
0.6641065, 0.5936899, 0.9627292, 1, 1, 1, 1, 1,
0.669808, -0.1395583, 2.337344, 1, 1, 1, 1, 1,
0.671228, 0.4867083, 2.075627, 1, 1, 1, 1, 1,
0.6712296, 0.7773638, -0.05348741, 1, 1, 1, 1, 1,
0.6755111, 1.208355, 0.9715693, 1, 1, 1, 1, 1,
0.6769713, 0.3519172, 2.172924, 1, 1, 1, 1, 1,
0.67843, -1.217568, 0.7988132, 1, 1, 1, 1, 1,
0.6839446, 1.335729, 1.090019, 1, 1, 1, 1, 1,
0.6869292, 0.9697319, 1.402219, 1, 1, 1, 1, 1,
0.6882163, 0.05534219, 0.8989247, 1, 1, 1, 1, 1,
0.6925665, 0.1669785, 3.009859, 0, 0, 1, 1, 1,
0.6929959, -0.2898161, 0.8381624, 1, 0, 0, 1, 1,
0.6947155, 0.2153225, 0.827504, 1, 0, 0, 1, 1,
0.6954335, 0.353509, 1.643778, 1, 0, 0, 1, 1,
0.6960387, 0.3338585, 1.663307, 1, 0, 0, 1, 1,
0.6970342, -0.0391671, 1.310233, 1, 0, 0, 1, 1,
0.7016351, -1.524878, 1.084701, 0, 0, 0, 1, 1,
0.7058911, -0.6890915, 1.424024, 0, 0, 0, 1, 1,
0.7061158, -0.21758, 1.922744, 0, 0, 0, 1, 1,
0.7165489, 0.1061741, 1.333278, 0, 0, 0, 1, 1,
0.7167311, -1.552698, 3.07884, 0, 0, 0, 1, 1,
0.716763, 0.4321523, -1.379753, 0, 0, 0, 1, 1,
0.7177324, -0.6680034, 3.012908, 0, 0, 0, 1, 1,
0.7192551, 0.714009, 0.6379957, 1, 1, 1, 1, 1,
0.7254776, -0.1792639, 2.697099, 1, 1, 1, 1, 1,
0.7319932, -0.3657675, 2.135734, 1, 1, 1, 1, 1,
0.7320122, -0.5525146, 1.23018, 1, 1, 1, 1, 1,
0.7362027, 0.230642, 0.9815518, 1, 1, 1, 1, 1,
0.7423403, -2.24066, 4.117258, 1, 1, 1, 1, 1,
0.7441639, -0.8863679, 2.813396, 1, 1, 1, 1, 1,
0.7468219, 1.017394, 0.8637412, 1, 1, 1, 1, 1,
0.748493, -1.512035, 2.01895, 1, 1, 1, 1, 1,
0.7500638, 1.562443, -0.0308219, 1, 1, 1, 1, 1,
0.7681391, 1.416907, -0.8607191, 1, 1, 1, 1, 1,
0.7763066, -1.259748, 2.394472, 1, 1, 1, 1, 1,
0.7766086, 1.458284, 1.422414, 1, 1, 1, 1, 1,
0.7801188, -0.1477576, 4.029956, 1, 1, 1, 1, 1,
0.7840186, 0.5327411, 0.8703459, 1, 1, 1, 1, 1,
0.7867757, -1.112408, 1.811909, 0, 0, 1, 1, 1,
0.7935874, 0.7391191, 2.074192, 1, 0, 0, 1, 1,
0.8052205, -1.291248, 1.530408, 1, 0, 0, 1, 1,
0.8120962, 0.1193875, 2.668209, 1, 0, 0, 1, 1,
0.8121254, -1.219289, 1.375941, 1, 0, 0, 1, 1,
0.8148429, 0.1785291, 1.470433, 1, 0, 0, 1, 1,
0.8161675, 0.1069257, 2.30899, 0, 0, 0, 1, 1,
0.8171685, -0.5571307, 2.196988, 0, 0, 0, 1, 1,
0.821255, 1.948427, 0.6159071, 0, 0, 0, 1, 1,
0.8224925, 0.7922979, -1.276404, 0, 0, 0, 1, 1,
0.8236715, -0.4589365, 1.664543, 0, 0, 0, 1, 1,
0.8357565, -0.4511204, 1.785388, 0, 0, 0, 1, 1,
0.8377631, 0.4365918, 2.002172, 0, 0, 0, 1, 1,
0.8382479, -0.2983229, 2.422671, 1, 1, 1, 1, 1,
0.8384202, -1.595104, 2.236743, 1, 1, 1, 1, 1,
0.8405731, 1.307888, 0.8856383, 1, 1, 1, 1, 1,
0.8428999, 0.7414635, 1.247769, 1, 1, 1, 1, 1,
0.8491583, -0.6149816, 2.673275, 1, 1, 1, 1, 1,
0.8523734, 0.4044573, 2.764856, 1, 1, 1, 1, 1,
0.8537291, 1.247963, -0.7547, 1, 1, 1, 1, 1,
0.8562719, -1.362958, 3.828426, 1, 1, 1, 1, 1,
0.8608091, 0.6341693, 2.436667, 1, 1, 1, 1, 1,
0.8639048, 0.9412326, -0.03738638, 1, 1, 1, 1, 1,
0.8646427, 1.081073, -0.03834196, 1, 1, 1, 1, 1,
0.8656484, 1.459801, 0.8234919, 1, 1, 1, 1, 1,
0.8659112, 0.356834, 0.3814178, 1, 1, 1, 1, 1,
0.8659639, 0.9930195, 1.644344, 1, 1, 1, 1, 1,
0.8731914, -0.2525425, 1.439651, 1, 1, 1, 1, 1,
0.8745281, 1.367548, 3.007839, 0, 0, 1, 1, 1,
0.8775553, 1.511596, 1.677745, 1, 0, 0, 1, 1,
0.8778389, 1.412707, 1.257459, 1, 0, 0, 1, 1,
0.8848409, 0.5127378, 0.1488602, 1, 0, 0, 1, 1,
0.8885508, -0.9183527, 1.939009, 1, 0, 0, 1, 1,
0.8908188, -1.392083, 1.505994, 1, 0, 0, 1, 1,
0.8929643, 0.7739122, 0.3013728, 0, 0, 0, 1, 1,
0.8943509, 0.3879146, 1.033031, 0, 0, 0, 1, 1,
0.8951672, -0.01347655, 3.123705, 0, 0, 0, 1, 1,
0.8976741, -0.650932, 2.596581, 0, 0, 0, 1, 1,
0.8981424, -1.07418, 2.123703, 0, 0, 0, 1, 1,
0.8984497, -1.029854, 3.213228, 0, 0, 0, 1, 1,
0.9000573, -0.9849328, 3.674607, 0, 0, 0, 1, 1,
0.9001685, 1.489008, -0.2433678, 1, 1, 1, 1, 1,
0.9006274, 0.6152915, 2.571987, 1, 1, 1, 1, 1,
0.9012342, 1.613579, -1.462671, 1, 1, 1, 1, 1,
0.9026777, 0.3846245, 1.581244, 1, 1, 1, 1, 1,
0.9038939, -0.4757279, 1.851663, 1, 1, 1, 1, 1,
0.9055772, 1.265718, 0.7839072, 1, 1, 1, 1, 1,
0.9061655, -0.5458768, 2.177354, 1, 1, 1, 1, 1,
0.9083636, 1.41345, 1.221795, 1, 1, 1, 1, 1,
0.908554, -0.147722, 1.95223, 1, 1, 1, 1, 1,
0.9104708, -1.673619, 2.636818, 1, 1, 1, 1, 1,
0.9118173, -0.09215286, 1.757031, 1, 1, 1, 1, 1,
0.9151473, -0.7800491, 2.673543, 1, 1, 1, 1, 1,
0.9316561, 0.6457073, 1.245544, 1, 1, 1, 1, 1,
0.93577, -0.1277869, 3.084531, 1, 1, 1, 1, 1,
0.9417772, 0.2148507, 1.275987, 1, 1, 1, 1, 1,
0.9451348, 1.48517, 1.261046, 0, 0, 1, 1, 1,
0.9467593, -0.1942919, 2.173459, 1, 0, 0, 1, 1,
0.9471246, 0.6258284, 0.3994106, 1, 0, 0, 1, 1,
0.9512984, -0.1381477, 4.53048, 1, 0, 0, 1, 1,
0.9671568, 0.7969533, -0.280539, 1, 0, 0, 1, 1,
0.9688524, 1.266308, 1.18895, 1, 0, 0, 1, 1,
0.9740802, 0.1714646, 2.288862, 0, 0, 0, 1, 1,
0.9782853, -0.3738399, 3.737092, 0, 0, 0, 1, 1,
0.9795557, -0.4765401, 0.655139, 0, 0, 0, 1, 1,
0.9809755, 0.5504562, 0.4804694, 0, 0, 0, 1, 1,
0.9858869, -0.3443992, 3.742419, 0, 0, 0, 1, 1,
0.9887484, -0.6503487, 3.148794, 0, 0, 0, 1, 1,
0.9901453, 2.267349, 0.5992373, 0, 0, 0, 1, 1,
0.9916787, -0.1414297, 3.309511, 1, 1, 1, 1, 1,
1.015244, 1.610719, 0.5899374, 1, 1, 1, 1, 1,
1.017243, 1.489249, 0.5824763, 1, 1, 1, 1, 1,
1.021736, 0.8399105, 0.5742793, 1, 1, 1, 1, 1,
1.024307, 0.5488279, 0.8685204, 1, 1, 1, 1, 1,
1.029766, 1.020337, 1.915364, 1, 1, 1, 1, 1,
1.032626, -1.164844, 1.990224, 1, 1, 1, 1, 1,
1.033468, 1.56152, -0.5688486, 1, 1, 1, 1, 1,
1.038984, -0.1306929, 1.783901, 1, 1, 1, 1, 1,
1.044794, 1.668978, -0.3790841, 1, 1, 1, 1, 1,
1.046542, 0.4341078, 1.075821, 1, 1, 1, 1, 1,
1.068183, 0.3797893, 3.69908, 1, 1, 1, 1, 1,
1.068352, -2.167762, 3.565356, 1, 1, 1, 1, 1,
1.08078, 0.06347223, 1.696498, 1, 1, 1, 1, 1,
1.089336, -0.5064563, 4.533299, 1, 1, 1, 1, 1,
1.092756, -1.001453, 1.74404, 0, 0, 1, 1, 1,
1.097535, -0.07497629, 2.221398, 1, 0, 0, 1, 1,
1.102132, -0.1090242, 1.37019, 1, 0, 0, 1, 1,
1.112052, 0.09908798, 2.173794, 1, 0, 0, 1, 1,
1.11244, -0.6083253, 2.108788, 1, 0, 0, 1, 1,
1.11326, -0.2970447, 3.012242, 1, 0, 0, 1, 1,
1.123523, 0.6086041, 0.1596601, 0, 0, 0, 1, 1,
1.124311, 1.148086, 0.9630505, 0, 0, 0, 1, 1,
1.124407, -0.7908812, 4.624331, 0, 0, 0, 1, 1,
1.125609, 0.0668994, 0.3553902, 0, 0, 0, 1, 1,
1.135578, 2.365947, 0.3309276, 0, 0, 0, 1, 1,
1.136095, -0.3886791, 2.268886, 0, 0, 0, 1, 1,
1.136608, -0.1363194, 1.438085, 0, 0, 0, 1, 1,
1.136854, -0.4375652, 1.610756, 1, 1, 1, 1, 1,
1.143034, -0.5261707, 2.131626, 1, 1, 1, 1, 1,
1.146402, 0.5725797, 2.090592, 1, 1, 1, 1, 1,
1.147273, 1.686025, 0.4224456, 1, 1, 1, 1, 1,
1.148994, 0.5866267, 0.7562377, 1, 1, 1, 1, 1,
1.160189, 1.302898, 2.557971, 1, 1, 1, 1, 1,
1.160706, 1.47231, 1.337018, 1, 1, 1, 1, 1,
1.167107, -0.4638844, 2.418528, 1, 1, 1, 1, 1,
1.168686, -0.4584433, 0.6311238, 1, 1, 1, 1, 1,
1.174191, -1.232954, 1.581146, 1, 1, 1, 1, 1,
1.179087, -0.03916183, 1.778021, 1, 1, 1, 1, 1,
1.183974, 0.08797368, 2.971676, 1, 1, 1, 1, 1,
1.18801, 0.7816331, 0.8234974, 1, 1, 1, 1, 1,
1.188325, 0.03541732, 3.53225, 1, 1, 1, 1, 1,
1.194055, -0.083907, 2.518754, 1, 1, 1, 1, 1,
1.19597, -1.338805, 4.159485, 0, 0, 1, 1, 1,
1.201812, -0.8873262, 2.203047, 1, 0, 0, 1, 1,
1.210973, -0.433668, 1.200897, 1, 0, 0, 1, 1,
1.213492, 0.7175441, 1.532843, 1, 0, 0, 1, 1,
1.224639, -0.4383451, -0.1356812, 1, 0, 0, 1, 1,
1.226484, -1.175745, 3.156326, 1, 0, 0, 1, 1,
1.234874, -0.4738763, 1.206904, 0, 0, 0, 1, 1,
1.248386, 1.441452, -1.878439, 0, 0, 0, 1, 1,
1.24857, 0.3839771, 1.903391, 0, 0, 0, 1, 1,
1.248807, 1.292855, 2.075024, 0, 0, 0, 1, 1,
1.249181, -1.330228, 1.95186, 0, 0, 0, 1, 1,
1.250149, -0.4451961, 2.557447, 0, 0, 0, 1, 1,
1.252115, -1.689195, 2.950189, 0, 0, 0, 1, 1,
1.252683, 1.034494, -0.3979498, 1, 1, 1, 1, 1,
1.261485, -0.5669227, 1.309639, 1, 1, 1, 1, 1,
1.280664, 0.1070631, 1.560869, 1, 1, 1, 1, 1,
1.28193, 1.791521, 0.9373096, 1, 1, 1, 1, 1,
1.28626, -0.7186839, 3.136547, 1, 1, 1, 1, 1,
1.292337, 0.4989792, 1.145017, 1, 1, 1, 1, 1,
1.294179, -0.1109444, -0.613447, 1, 1, 1, 1, 1,
1.304341, -0.5243052, 0.4828837, 1, 1, 1, 1, 1,
1.304924, 1.423516, 2.044704, 1, 1, 1, 1, 1,
1.311444, -1.402087, 1.876587, 1, 1, 1, 1, 1,
1.313316, -1.081194, 2.660786, 1, 1, 1, 1, 1,
1.315941, -0.2630562, 1.545345, 1, 1, 1, 1, 1,
1.317107, 0.05186365, 1.075525, 1, 1, 1, 1, 1,
1.322119, -0.8828433, -0.0779364, 1, 1, 1, 1, 1,
1.323057, -0.20867, 2.775763, 1, 1, 1, 1, 1,
1.329478, -1.207469, 0.8302202, 0, 0, 1, 1, 1,
1.329702, 1.107019, 1.612276, 1, 0, 0, 1, 1,
1.329926, -0.1230352, 1.717889, 1, 0, 0, 1, 1,
1.335409, 1.245122, 1.272695, 1, 0, 0, 1, 1,
1.335452, 0.6239995, 1.528296, 1, 0, 0, 1, 1,
1.344293, -0.1258833, 2.579499, 1, 0, 0, 1, 1,
1.344634, -1.308251, 3.290437, 0, 0, 0, 1, 1,
1.346091, 0.7880104, 1.115437, 0, 0, 0, 1, 1,
1.348325, 0.1177686, 0.4564643, 0, 0, 0, 1, 1,
1.34968, 0.5386638, 0.361757, 0, 0, 0, 1, 1,
1.35826, 1.504245, 0.8270092, 0, 0, 0, 1, 1,
1.361269, 1.340673, 2.776851, 0, 0, 0, 1, 1,
1.361479, -0.577321, 1.590775, 0, 0, 0, 1, 1,
1.362149, -0.7943766, 1.306702, 1, 1, 1, 1, 1,
1.365375, -0.01254501, -0.029881, 1, 1, 1, 1, 1,
1.365856, 0.8305386, 0.2340907, 1, 1, 1, 1, 1,
1.368545, -0.4920281, 1.180732, 1, 1, 1, 1, 1,
1.375143, 0.1473736, 1.728011, 1, 1, 1, 1, 1,
1.376165, 1.495982, 1.014214, 1, 1, 1, 1, 1,
1.399578, 0.9985808, 0.7966486, 1, 1, 1, 1, 1,
1.40798, -0.2481763, 0.8793252, 1, 1, 1, 1, 1,
1.415716, -0.09478711, 2.320798, 1, 1, 1, 1, 1,
1.429572, 0.1122946, 1.470047, 1, 1, 1, 1, 1,
1.439291, -0.5391552, 2.359291, 1, 1, 1, 1, 1,
1.44831, -0.9384404, 2.327334, 1, 1, 1, 1, 1,
1.449317, -2.170915, 3.006978, 1, 1, 1, 1, 1,
1.457011, 0.2955576, 0.9645419, 1, 1, 1, 1, 1,
1.484288, 0.2844851, 2.772969, 1, 1, 1, 1, 1,
1.502518, -0.02406443, 1.22239, 0, 0, 1, 1, 1,
1.506578, -0.4117657, 0.852733, 1, 0, 0, 1, 1,
1.507199, -0.9713274, 3.935951, 1, 0, 0, 1, 1,
1.507534, -1.35875, 3.613163, 1, 0, 0, 1, 1,
1.508524, 0.3700699, 0.180189, 1, 0, 0, 1, 1,
1.508813, 0.669497, 1.245864, 1, 0, 0, 1, 1,
1.520736, 0.5853863, 0.8645831, 0, 0, 0, 1, 1,
1.521084, 1.089747, 0.7038689, 0, 0, 0, 1, 1,
1.539892, -0.8847393, 1.797955, 0, 0, 0, 1, 1,
1.544934, 0.4807516, 2.626874, 0, 0, 0, 1, 1,
1.550961, 0.2733494, 0.4697819, 0, 0, 0, 1, 1,
1.554164, 1.769323, 1.279621, 0, 0, 0, 1, 1,
1.554405, 2.593063, 1.051955, 0, 0, 0, 1, 1,
1.558147, 0.697939, 1.834438, 1, 1, 1, 1, 1,
1.577745, -1.544471, 1.784969, 1, 1, 1, 1, 1,
1.590207, 0.5359358, 0.3552135, 1, 1, 1, 1, 1,
1.593473, 0.3744275, -0.2485435, 1, 1, 1, 1, 1,
1.595742, 0.5505558, 1.27452, 1, 1, 1, 1, 1,
1.604014, -0.09322188, 3.085575, 1, 1, 1, 1, 1,
1.620516, -1.088461, 2.451924, 1, 1, 1, 1, 1,
1.651124, 2.560322, 0.3760487, 1, 1, 1, 1, 1,
1.6679, 1.233227, 2.388116, 1, 1, 1, 1, 1,
1.670228, -0.4018627, 2.27846, 1, 1, 1, 1, 1,
1.673516, -1.653998, 1.863357, 1, 1, 1, 1, 1,
1.717567, 0.6036826, 2.528484, 1, 1, 1, 1, 1,
1.718267, -0.3769987, 0.1613128, 1, 1, 1, 1, 1,
1.719338, 0.3885555, 0.8909924, 1, 1, 1, 1, 1,
1.745703, 0.5301934, 3.399297, 1, 1, 1, 1, 1,
1.748831, -1.251446, 2.430772, 0, 0, 1, 1, 1,
1.752377, 2.075894, -0.921896, 1, 0, 0, 1, 1,
1.753118, 1.964417, -0.002266301, 1, 0, 0, 1, 1,
1.761699, -0.791621, 3.601683, 1, 0, 0, 1, 1,
1.767236, 0.5988768, 1.831552, 1, 0, 0, 1, 1,
1.773485, -0.3741044, 2.82449, 1, 0, 0, 1, 1,
1.779692, -0.6477202, 1.525655, 0, 0, 0, 1, 1,
1.792545, 1.355101, 0.3141333, 0, 0, 0, 1, 1,
1.799042, 1.671312, -0.3174704, 0, 0, 0, 1, 1,
1.801823, 0.5984669, 1.408942, 0, 0, 0, 1, 1,
1.809592, 2.956939, 0.5659947, 0, 0, 0, 1, 1,
1.811752, 0.5425803, 1.673449, 0, 0, 0, 1, 1,
1.823382, -1.862399, 2.343497, 0, 0, 0, 1, 1,
1.842884, -0.01883489, 0.1717409, 1, 1, 1, 1, 1,
1.858862, 0.04252274, -0.08223341, 1, 1, 1, 1, 1,
1.863479, 0.278188, 2.218886, 1, 1, 1, 1, 1,
1.868014, 1.184428, 1.916099, 1, 1, 1, 1, 1,
1.872393, -0.1721271, 2.936465, 1, 1, 1, 1, 1,
1.87481, -0.9979685, 3.785423, 1, 1, 1, 1, 1,
1.903689, 1.843879, 1.114249, 1, 1, 1, 1, 1,
1.913999, -0.142128, 2.700106, 1, 1, 1, 1, 1,
1.927906, 0.5430508, 0.05288516, 1, 1, 1, 1, 1,
1.936648, 1.625502, -0.6701045, 1, 1, 1, 1, 1,
1.936798, 0.1297081, 3.078116, 1, 1, 1, 1, 1,
1.959745, 0.6941268, 1.79371, 1, 1, 1, 1, 1,
1.982015, 1.180597, 1.835566, 1, 1, 1, 1, 1,
2.019424, -0.7427834, 2.834154, 1, 1, 1, 1, 1,
2.035312, 0.5806966, 0.5016028, 1, 1, 1, 1, 1,
2.048709, -0.7044352, 3.632466, 0, 0, 1, 1, 1,
2.108043, -0.9115614, 1.586107, 1, 0, 0, 1, 1,
2.116912, -0.5486141, 1.747324, 1, 0, 0, 1, 1,
2.124038, 0.06230578, 1.340521, 1, 0, 0, 1, 1,
2.16189, 0.5470597, 3.067545, 1, 0, 0, 1, 1,
2.186475, -1.361046, 1.259597, 1, 0, 0, 1, 1,
2.212962, -0.07578625, 2.081727, 0, 0, 0, 1, 1,
2.236778, 0.2137928, 1.126701, 0, 0, 0, 1, 1,
2.250575, 0.1566575, 0.762863, 0, 0, 0, 1, 1,
2.256387, -1.087149, 1.290019, 0, 0, 0, 1, 1,
2.256656, 0.8721763, 1.048529, 0, 0, 0, 1, 1,
2.299879, 0.3957143, 2.296253, 0, 0, 0, 1, 1,
2.317524, -0.91722, 2.266481, 0, 0, 0, 1, 1,
2.391987, -1.765391, 2.418959, 1, 1, 1, 1, 1,
2.399585, 1.381105, 1.648921, 1, 1, 1, 1, 1,
2.404439, 0.5896578, 0.7998602, 1, 1, 1, 1, 1,
2.609438, -0.8708363, 0.8425413, 1, 1, 1, 1, 1,
2.628944, 1.200522, 0.6325577, 1, 1, 1, 1, 1,
2.865368, 0.1146734, 1.275177, 1, 1, 1, 1, 1,
3.070599, -0.5464593, 1.057132, 1, 1, 1, 1, 1
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
var radius = 9.617363;
var distance = 33.78058;
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
mvMatrix.translate( 0.1637206, -0.2632923, 0.2059412 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.78058);
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
