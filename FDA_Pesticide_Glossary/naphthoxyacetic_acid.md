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
-3.461247, 1.321206, -1.00477, 1, 0, 0, 1,
-2.60981, 0.3987587, 0.824514, 1, 0.007843138, 0, 1,
-2.523475, 0.7398232, -0.7220742, 1, 0.01176471, 0, 1,
-2.442881, 0.05785495, -1.36949, 1, 0.01960784, 0, 1,
-2.423715, 0.2408302, -2.304415, 1, 0.02352941, 0, 1,
-2.405499, -0.567367, -3.962365, 1, 0.03137255, 0, 1,
-2.404978, -0.5106128, -2.274264, 1, 0.03529412, 0, 1,
-2.361786, 0.28903, -2.053846, 1, 0.04313726, 0, 1,
-2.347427, -1.032591, -2.446228, 1, 0.04705882, 0, 1,
-2.307137, 0.4621921, -0.8525261, 1, 0.05490196, 0, 1,
-2.233003, -0.9490417, -2.155412, 1, 0.05882353, 0, 1,
-2.207111, 1.245698, -1.115891, 1, 0.06666667, 0, 1,
-2.188864, -1.102446, -3.519866, 1, 0.07058824, 0, 1,
-2.126273, -0.1651827, -2.824993, 1, 0.07843138, 0, 1,
-2.066424, -0.4049042, 0.1001287, 1, 0.08235294, 0, 1,
-2.057301, -0.7863181, -1.701516, 1, 0.09019608, 0, 1,
-2.003943, -0.7929305, -0.9272444, 1, 0.09411765, 0, 1,
-1.99379, 0.05569381, -0.5564302, 1, 0.1019608, 0, 1,
-1.980217, 1.535558, 0.2777345, 1, 0.1098039, 0, 1,
-1.954913, 0.3723354, -2.427154, 1, 0.1137255, 0, 1,
-1.929977, 0.759737, -1.398216, 1, 0.1215686, 0, 1,
-1.912975, 0.4150012, -1.400535, 1, 0.1254902, 0, 1,
-1.909357, 2.196358, -0.1833217, 1, 0.1333333, 0, 1,
-1.908476, 0.03963896, -1.537932, 1, 0.1372549, 0, 1,
-1.899647, 0.8524694, -1.78976, 1, 0.145098, 0, 1,
-1.881284, 2.765127, 0.2228415, 1, 0.1490196, 0, 1,
-1.851972, 0.5486686, -2.066011, 1, 0.1568628, 0, 1,
-1.834589, -0.8002883, -3.653778, 1, 0.1607843, 0, 1,
-1.810143, 1.337369, -2.298555, 1, 0.1686275, 0, 1,
-1.809305, 0.9554421, -1.055988, 1, 0.172549, 0, 1,
-1.807979, 0.7979377, -0.4688776, 1, 0.1803922, 0, 1,
-1.79151, 0.09601281, -1.037472, 1, 0.1843137, 0, 1,
-1.789281, -0.4581169, 1.099423, 1, 0.1921569, 0, 1,
-1.784034, 0.2048239, -3.997483, 1, 0.1960784, 0, 1,
-1.781689, 1.188367, -0.7997909, 1, 0.2039216, 0, 1,
-1.775665, 0.07175128, -0.417761, 1, 0.2117647, 0, 1,
-1.767743, -0.4363863, -1.30474, 1, 0.2156863, 0, 1,
-1.767264, -0.09696341, -1.771972, 1, 0.2235294, 0, 1,
-1.748548, -0.1453884, -2.077725, 1, 0.227451, 0, 1,
-1.7481, -1.12516, -2.927038, 1, 0.2352941, 0, 1,
-1.747499, -0.8005877, -2.941722, 1, 0.2392157, 0, 1,
-1.74702, -1.104109, -2.469877, 1, 0.2470588, 0, 1,
-1.742663, 0.06307432, -2.512376, 1, 0.2509804, 0, 1,
-1.735535, 0.7679476, -0.5402308, 1, 0.2588235, 0, 1,
-1.723696, -0.3598873, -3.332237, 1, 0.2627451, 0, 1,
-1.711802, -1.00123, -2.236565, 1, 0.2705882, 0, 1,
-1.701458, -0.5324817, -1.09662, 1, 0.2745098, 0, 1,
-1.669523, -1.344761, -2.439883, 1, 0.282353, 0, 1,
-1.663364, 1.203064, -0.02158348, 1, 0.2862745, 0, 1,
-1.659184, -1.661547, -1.931032, 1, 0.2941177, 0, 1,
-1.637869, -1.592964, -2.600863, 1, 0.3019608, 0, 1,
-1.620807, -1.027456, -1.820864, 1, 0.3058824, 0, 1,
-1.581448, -0.1939626, -0.8303815, 1, 0.3137255, 0, 1,
-1.559895, 1.699567, 0.2942626, 1, 0.3176471, 0, 1,
-1.559767, 0.2904478, -2.992697, 1, 0.3254902, 0, 1,
-1.547373, 1.647402, -0.4911249, 1, 0.3294118, 0, 1,
-1.546071, 0.7142102, -0.7723674, 1, 0.3372549, 0, 1,
-1.541053, 0.2079263, -1.224709, 1, 0.3411765, 0, 1,
-1.538822, -0.899914, -0.6979574, 1, 0.3490196, 0, 1,
-1.531354, 0.3636923, -0.8321002, 1, 0.3529412, 0, 1,
-1.492488, 0.4833042, -1.046419, 1, 0.3607843, 0, 1,
-1.492461, 0.03515463, -3.764883, 1, 0.3647059, 0, 1,
-1.483024, 1.126936, 0.04549319, 1, 0.372549, 0, 1,
-1.458793, -0.6372874, -0.2586647, 1, 0.3764706, 0, 1,
-1.458426, 0.02992971, -1.539991, 1, 0.3843137, 0, 1,
-1.456402, -0.5149436, -2.204829, 1, 0.3882353, 0, 1,
-1.45489, 0.5872766, -0.7819596, 1, 0.3960784, 0, 1,
-1.453949, -0.2279597, -1.007732, 1, 0.4039216, 0, 1,
-1.445294, 0.7561196, -1.042699, 1, 0.4078431, 0, 1,
-1.438838, -1.382171, -4.848371, 1, 0.4156863, 0, 1,
-1.434539, 1.165081, -0.5120518, 1, 0.4196078, 0, 1,
-1.430363, 0.3468913, -1.23277, 1, 0.427451, 0, 1,
-1.42112, -0.3004046, -2.796757, 1, 0.4313726, 0, 1,
-1.40448, 0.7437086, -0.3143947, 1, 0.4392157, 0, 1,
-1.404472, -0.1126212, -1.980985, 1, 0.4431373, 0, 1,
-1.402115, 0.4796128, -0.3569774, 1, 0.4509804, 0, 1,
-1.399772, 0.08544289, -2.855087, 1, 0.454902, 0, 1,
-1.397383, -1.610617, -3.66496, 1, 0.4627451, 0, 1,
-1.393486, 0.2983397, -0.8418092, 1, 0.4666667, 0, 1,
-1.392777, 0.8132635, -2.027039, 1, 0.4745098, 0, 1,
-1.379753, -0.6897936, -0.8779122, 1, 0.4784314, 0, 1,
-1.378011, 0.4404888, -2.087405, 1, 0.4862745, 0, 1,
-1.373671, 0.1830164, -1.575268, 1, 0.4901961, 0, 1,
-1.373186, -0.1972117, -2.804782, 1, 0.4980392, 0, 1,
-1.369207, 0.6931233, -0.3515007, 1, 0.5058824, 0, 1,
-1.369046, -0.7001542, -1.607494, 1, 0.509804, 0, 1,
-1.36314, 0.2303628, -2.415264, 1, 0.5176471, 0, 1,
-1.340304, -0.5044709, -1.235049, 1, 0.5215687, 0, 1,
-1.336073, -0.01378884, -0.61094, 1, 0.5294118, 0, 1,
-1.335121, -1.356278, -2.060181, 1, 0.5333334, 0, 1,
-1.325204, 0.9491974, -0.8217042, 1, 0.5411765, 0, 1,
-1.324703, -0.562728, -0.3306156, 1, 0.5450981, 0, 1,
-1.320404, 0.3815241, -1.712034, 1, 0.5529412, 0, 1,
-1.292736, 0.09647633, -2.749616, 1, 0.5568628, 0, 1,
-1.283659, -0.2227073, -0.7441362, 1, 0.5647059, 0, 1,
-1.279953, 0.905419, 0.9680629, 1, 0.5686275, 0, 1,
-1.277645, -0.6563146, -2.13613, 1, 0.5764706, 0, 1,
-1.27647, -1.63004, -4.081306, 1, 0.5803922, 0, 1,
-1.275078, -0.4951613, -2.602639, 1, 0.5882353, 0, 1,
-1.274703, -1.067408, -3.003171, 1, 0.5921569, 0, 1,
-1.273477, 1.128576, 1.127267, 1, 0.6, 0, 1,
-1.269909, -1.514947, -1.308222, 1, 0.6078432, 0, 1,
-1.269469, -0.04240848, -1.492638, 1, 0.6117647, 0, 1,
-1.266892, -0.8986456, -2.418223, 1, 0.6196079, 0, 1,
-1.265215, 0.6614634, -2.19883, 1, 0.6235294, 0, 1,
-1.262914, -2.151531, -3.036341, 1, 0.6313726, 0, 1,
-1.245734, -0.4622934, -2.816607, 1, 0.6352941, 0, 1,
-1.244179, -0.8883119, 0.9805623, 1, 0.6431373, 0, 1,
-1.243319, 2.197177, -1.578873, 1, 0.6470588, 0, 1,
-1.236212, 2.128193, -2.063981, 1, 0.654902, 0, 1,
-1.23139, -0.2178746, -0.3801077, 1, 0.6588235, 0, 1,
-1.227842, -1.309217, -4.155437, 1, 0.6666667, 0, 1,
-1.225172, 0.3535289, -1.722091, 1, 0.6705883, 0, 1,
-1.217556, 0.3885943, -0.9558588, 1, 0.6784314, 0, 1,
-1.215051, -0.5608571, -3.389002, 1, 0.682353, 0, 1,
-1.213426, 0.305052, -2.093903, 1, 0.6901961, 0, 1,
-1.208968, 0.1541648, -1.175418, 1, 0.6941177, 0, 1,
-1.208881, 0.395098, -1.162919, 1, 0.7019608, 0, 1,
-1.199722, 1.325395, -0.1226575, 1, 0.7098039, 0, 1,
-1.186162, -0.9623814, -3.802461, 1, 0.7137255, 0, 1,
-1.184956, 1.223713, -1.584692, 1, 0.7215686, 0, 1,
-1.175068, 0.01392096, -0.7892198, 1, 0.7254902, 0, 1,
-1.166604, 0.2959803, -1.012703, 1, 0.7333333, 0, 1,
-1.151839, 1.303942, -1.902367, 1, 0.7372549, 0, 1,
-1.149029, 0.08888602, -0.6865122, 1, 0.7450981, 0, 1,
-1.14358, -1.200031, -1.769892, 1, 0.7490196, 0, 1,
-1.138414, 1.381385, -0.1479698, 1, 0.7568628, 0, 1,
-1.136077, 2.142629, 0.06119874, 1, 0.7607843, 0, 1,
-1.128388, -0.3939271, -2.194525, 1, 0.7686275, 0, 1,
-1.126175, 0.1807359, -0.05929225, 1, 0.772549, 0, 1,
-1.124654, 0.6126089, -0.5336683, 1, 0.7803922, 0, 1,
-1.11591, -0.9415921, -1.955409, 1, 0.7843137, 0, 1,
-1.112537, 0.4618738, -0.2264004, 1, 0.7921569, 0, 1,
-1.109391, -0.9954542, -5.606887, 1, 0.7960784, 0, 1,
-1.109258, 0.3065028, -0.9153341, 1, 0.8039216, 0, 1,
-1.102072, -0.8829002, -2.060334, 1, 0.8117647, 0, 1,
-1.099756, 0.9839068, 0.7764481, 1, 0.8156863, 0, 1,
-1.089719, 1.107342, -0.4111742, 1, 0.8235294, 0, 1,
-1.081502, 1.509512, 0.5506765, 1, 0.827451, 0, 1,
-1.07216, -1.464283, -1.245602, 1, 0.8352941, 0, 1,
-1.070169, 1.271762, -1.178913, 1, 0.8392157, 0, 1,
-1.069882, -1.06203, -1.119057, 1, 0.8470588, 0, 1,
-1.066588, -0.7892219, -2.998797, 1, 0.8509804, 0, 1,
-1.063766, 0.194489, -2.199537, 1, 0.8588235, 0, 1,
-1.049418, 0.8994052, -1.250139, 1, 0.8627451, 0, 1,
-1.048367, 0.4041858, -0.2613655, 1, 0.8705882, 0, 1,
-1.046461, 0.8409663, -2.024302, 1, 0.8745098, 0, 1,
-1.036422, -1.300769, -2.185791, 1, 0.8823529, 0, 1,
-1.035058, -1.863024, -2.457561, 1, 0.8862745, 0, 1,
-1.031081, -1.263457, -2.826685, 1, 0.8941177, 0, 1,
-1.03058, -1.725708, -3.682962, 1, 0.8980392, 0, 1,
-1.028904, 1.02049, -0.7162181, 1, 0.9058824, 0, 1,
-1.027176, -1.627326, -1.575914, 1, 0.9137255, 0, 1,
-1.019991, 0.9964229, -1.356046, 1, 0.9176471, 0, 1,
-1.011725, -0.7846618, -1.035119, 1, 0.9254902, 0, 1,
-1.011119, -1.640936, -1.915188, 1, 0.9294118, 0, 1,
-1.003597, 2.329282, 0.05887753, 1, 0.9372549, 0, 1,
-1.000014, 1.24624, 0.3238045, 1, 0.9411765, 0, 1,
-0.9956176, -0.8931051, -1.270208, 1, 0.9490196, 0, 1,
-0.9954765, -0.6335532, -1.725876, 1, 0.9529412, 0, 1,
-0.9925815, -0.7855057, -2.24419, 1, 0.9607843, 0, 1,
-0.991303, -0.7699558, -1.130319, 1, 0.9647059, 0, 1,
-0.9901176, 1.386239, -0.7139987, 1, 0.972549, 0, 1,
-0.9857031, -0.3613684, -1.040982, 1, 0.9764706, 0, 1,
-0.9841142, 0.629342, -1.900856, 1, 0.9843137, 0, 1,
-0.9824378, 0.1337979, 0.7300476, 1, 0.9882353, 0, 1,
-0.9795926, -0.03534711, -1.662727, 1, 0.9960784, 0, 1,
-0.9756688, 2.679085, 0.4140873, 0.9960784, 1, 0, 1,
-0.9738687, 0.1690744, -1.239508, 0.9921569, 1, 0, 1,
-0.9715929, -1.093343, -2.820945, 0.9843137, 1, 0, 1,
-0.9708219, 0.4980796, -2.328685, 0.9803922, 1, 0, 1,
-0.968154, -0.6933237, -1.835063, 0.972549, 1, 0, 1,
-0.9604627, -1.043341, -4.143096, 0.9686275, 1, 0, 1,
-0.9599423, -0.383949, -1.519084, 0.9607843, 1, 0, 1,
-0.9581612, 0.3568945, -1.738026, 0.9568627, 1, 0, 1,
-0.9443788, 1.692585, -1.716846, 0.9490196, 1, 0, 1,
-0.9429103, -0.6683673, -2.361092, 0.945098, 1, 0, 1,
-0.9385257, 0.8518276, 0.006678194, 0.9372549, 1, 0, 1,
-0.9373237, -0.07809103, -1.01264, 0.9333333, 1, 0, 1,
-0.9320147, -0.1785269, -2.349984, 0.9254902, 1, 0, 1,
-0.9276255, 1.74804, -1.293425, 0.9215686, 1, 0, 1,
-0.9254171, -0.3481012, -1.669714, 0.9137255, 1, 0, 1,
-0.9235697, -0.1321291, -2.684786, 0.9098039, 1, 0, 1,
-0.9222769, 1.198737, -3.095658, 0.9019608, 1, 0, 1,
-0.9202017, 0.02032514, -2.064632, 0.8941177, 1, 0, 1,
-0.9201054, 1.706475, -1.289549, 0.8901961, 1, 0, 1,
-0.9178042, -0.5295807, -3.312274, 0.8823529, 1, 0, 1,
-0.9164637, 0.9783166, -0.6586178, 0.8784314, 1, 0, 1,
-0.9155523, -0.7804239, -0.6537081, 0.8705882, 1, 0, 1,
-0.9080601, -0.7153627, -2.057024, 0.8666667, 1, 0, 1,
-0.9025792, 0.6890319, -1.630288, 0.8588235, 1, 0, 1,
-0.8950558, 0.03798562, -2.593345, 0.854902, 1, 0, 1,
-0.8904169, 0.5990943, -0.4526054, 0.8470588, 1, 0, 1,
-0.8861473, -1.52482, -2.731575, 0.8431373, 1, 0, 1,
-0.8740072, 0.4548129, -0.1063206, 0.8352941, 1, 0, 1,
-0.8739236, -0.8953265, -3.624068, 0.8313726, 1, 0, 1,
-0.8663081, 0.5762078, 0.5447938, 0.8235294, 1, 0, 1,
-0.8600659, -0.4178807, -3.416357, 0.8196079, 1, 0, 1,
-0.8548667, 0.9881045, -0.06354123, 0.8117647, 1, 0, 1,
-0.8500412, -0.3440498, -1.245497, 0.8078431, 1, 0, 1,
-0.8478876, -0.2265341, -3.626737, 0.8, 1, 0, 1,
-0.8474007, 0.5896764, -0.7955282, 0.7921569, 1, 0, 1,
-0.8359179, -0.9108059, -3.164232, 0.7882353, 1, 0, 1,
-0.8298612, -1.208188, -1.220805, 0.7803922, 1, 0, 1,
-0.825221, -0.6767129, -2.867443, 0.7764706, 1, 0, 1,
-0.8246579, -0.9556853, -3.556544, 0.7686275, 1, 0, 1,
-0.821185, 0.008077374, -0.8456857, 0.7647059, 1, 0, 1,
-0.8160823, -1.481676, -0.3120602, 0.7568628, 1, 0, 1,
-0.8129276, 0.05058585, -1.910801, 0.7529412, 1, 0, 1,
-0.8088772, -0.8818552, -2.265445, 0.7450981, 1, 0, 1,
-0.8076343, -0.3558751, -2.77174, 0.7411765, 1, 0, 1,
-0.8007712, 0.9592869, -0.5327916, 0.7333333, 1, 0, 1,
-0.7899761, -0.5421446, -4.628691, 0.7294118, 1, 0, 1,
-0.7898775, 1.054908, 0.1124435, 0.7215686, 1, 0, 1,
-0.7779961, 0.4657579, -0.7643579, 0.7176471, 1, 0, 1,
-0.7760038, -0.968416, -2.107403, 0.7098039, 1, 0, 1,
-0.7754766, 1.394723, -0.6092929, 0.7058824, 1, 0, 1,
-0.7737355, -0.3917978, -1.327495, 0.6980392, 1, 0, 1,
-0.7731433, 0.5964109, -0.5625021, 0.6901961, 1, 0, 1,
-0.7723125, -0.523981, -3.319649, 0.6862745, 1, 0, 1,
-0.7700845, 1.791055, -0.6271805, 0.6784314, 1, 0, 1,
-0.7689687, -0.4047169, -1.598555, 0.6745098, 1, 0, 1,
-0.7601635, 0.844333, -2.576902, 0.6666667, 1, 0, 1,
-0.7600765, 0.01705113, -1.441131, 0.6627451, 1, 0, 1,
-0.7580415, -0.927011, -4.773697, 0.654902, 1, 0, 1,
-0.7527344, 0.007229948, -3.253867, 0.6509804, 1, 0, 1,
-0.7517383, 1.12332, 0.1783795, 0.6431373, 1, 0, 1,
-0.7505202, -0.4793878, -1.107181, 0.6392157, 1, 0, 1,
-0.7482471, -1.041292, -1.033719, 0.6313726, 1, 0, 1,
-0.7415708, -0.05324874, -1.543301, 0.627451, 1, 0, 1,
-0.7403117, 1.387224, 0.3840748, 0.6196079, 1, 0, 1,
-0.7401844, -0.1555096, -2.894907, 0.6156863, 1, 0, 1,
-0.7395488, 2.412128, 1.087392, 0.6078432, 1, 0, 1,
-0.733171, -0.3165129, -0.5460675, 0.6039216, 1, 0, 1,
-0.7325369, 0.5292664, -0.1711734, 0.5960785, 1, 0, 1,
-0.728521, 0.8424523, -0.1346608, 0.5882353, 1, 0, 1,
-0.721792, 0.6819079, -0.8980188, 0.5843138, 1, 0, 1,
-0.7212284, 0.7912946, -0.09466574, 0.5764706, 1, 0, 1,
-0.7188726, -1.318467, -2.749312, 0.572549, 1, 0, 1,
-0.7188525, -1.415322, -3.530219, 0.5647059, 1, 0, 1,
-0.7181185, -0.09693181, -2.535869, 0.5607843, 1, 0, 1,
-0.7167963, 0.02874227, -1.783898, 0.5529412, 1, 0, 1,
-0.7158222, -0.7902771, -1.358829, 0.5490196, 1, 0, 1,
-0.7143798, -0.0009852207, 0.07133517, 0.5411765, 1, 0, 1,
-0.7139191, -0.284876, -1.706564, 0.5372549, 1, 0, 1,
-0.712671, -0.4803956, -2.270746, 0.5294118, 1, 0, 1,
-0.7086862, -0.2203735, -0.6223882, 0.5254902, 1, 0, 1,
-0.7040988, 0.2668762, -0.3969268, 0.5176471, 1, 0, 1,
-0.7011164, -2.079172, -0.6897027, 0.5137255, 1, 0, 1,
-0.7005578, -0.8202674, -2.094447, 0.5058824, 1, 0, 1,
-0.6986316, -0.5602762, -1.240455, 0.5019608, 1, 0, 1,
-0.6976312, -1.125806, -1.572018, 0.4941176, 1, 0, 1,
-0.6968223, 0.5737532, -1.988809, 0.4862745, 1, 0, 1,
-0.6964083, 1.335659, -1.677788, 0.4823529, 1, 0, 1,
-0.6952451, 0.2778685, -1.779935, 0.4745098, 1, 0, 1,
-0.6947101, -0.3939351, -2.945025, 0.4705882, 1, 0, 1,
-0.6933208, 1.072087, -0.4400038, 0.4627451, 1, 0, 1,
-0.6929793, -1.145836, -3.080824, 0.4588235, 1, 0, 1,
-0.6863829, 0.3198735, -0.7787538, 0.4509804, 1, 0, 1,
-0.6831822, -0.742489, -2.436474, 0.4470588, 1, 0, 1,
-0.6820601, 0.378994, -1.412092, 0.4392157, 1, 0, 1,
-0.6772618, -0.2058928, -0.7388149, 0.4352941, 1, 0, 1,
-0.6741986, -0.639228, -3.59069, 0.427451, 1, 0, 1,
-0.6689379, -0.7503784, -3.366037, 0.4235294, 1, 0, 1,
-0.6679732, -1.24064, -1.083252, 0.4156863, 1, 0, 1,
-0.6660221, 1.69831, -0.7982311, 0.4117647, 1, 0, 1,
-0.6554399, -0.2782373, -2.215757, 0.4039216, 1, 0, 1,
-0.6520433, -0.1645472, -2.380557, 0.3960784, 1, 0, 1,
-0.6500334, -0.0857187, -1.892066, 0.3921569, 1, 0, 1,
-0.6434383, 2.575624, -1.527902, 0.3843137, 1, 0, 1,
-0.6400832, 0.2687624, -1.136876, 0.3803922, 1, 0, 1,
-0.6390485, 1.677677, -1.173465, 0.372549, 1, 0, 1,
-0.6378383, 0.9296066, -0.7772549, 0.3686275, 1, 0, 1,
-0.6300379, -1.304597, -1.354937, 0.3607843, 1, 0, 1,
-0.6280459, 1.244392, -1.416633, 0.3568628, 1, 0, 1,
-0.6270132, 0.6649729, -0.0795629, 0.3490196, 1, 0, 1,
-0.6248903, 0.9723238, -0.7142057, 0.345098, 1, 0, 1,
-0.6239156, -2.494933, -2.653447, 0.3372549, 1, 0, 1,
-0.6231765, 0.05115399, -0.7880346, 0.3333333, 1, 0, 1,
-0.6228969, 0.4668418, -1.01119, 0.3254902, 1, 0, 1,
-0.6204936, -0.4390031, -0.5112633, 0.3215686, 1, 0, 1,
-0.6195605, 0.3383164, -0.02683248, 0.3137255, 1, 0, 1,
-0.616343, 1.081536, 0.02047067, 0.3098039, 1, 0, 1,
-0.6116639, 0.83679, -0.05318071, 0.3019608, 1, 0, 1,
-0.6008217, 0.4100344, -1.194932, 0.2941177, 1, 0, 1,
-0.6001801, -1.655072, -0.9265447, 0.2901961, 1, 0, 1,
-0.5972151, -0.7408102, -1.637827, 0.282353, 1, 0, 1,
-0.5939772, -0.6916803, -4.391575, 0.2784314, 1, 0, 1,
-0.5927414, -1.126846, -3.559994, 0.2705882, 1, 0, 1,
-0.591298, -1.656741, -1.142444, 0.2666667, 1, 0, 1,
-0.5886937, 2.258466, 0.07233631, 0.2588235, 1, 0, 1,
-0.5873253, 1.58569, -1.613541, 0.254902, 1, 0, 1,
-0.5869141, -0.7016774, -2.414578, 0.2470588, 1, 0, 1,
-0.5859596, 0.2359975, -2.842038, 0.2431373, 1, 0, 1,
-0.5820498, 0.6794015, -1.451877, 0.2352941, 1, 0, 1,
-0.5782632, -0.8180416, -1.865677, 0.2313726, 1, 0, 1,
-0.5693378, -1.079633, -2.834501, 0.2235294, 1, 0, 1,
-0.5690063, -1.172653, -3.859139, 0.2196078, 1, 0, 1,
-0.5688619, 0.7756607, -1.814847, 0.2117647, 1, 0, 1,
-0.5670905, 1.450763, -0.4301232, 0.2078431, 1, 0, 1,
-0.5666717, -0.4025119, -2.793418, 0.2, 1, 0, 1,
-0.5647195, 1.086544, -1.290246, 0.1921569, 1, 0, 1,
-0.5622116, -1.756573, -4.565884, 0.1882353, 1, 0, 1,
-0.5576062, -0.05326898, -3.003664, 0.1803922, 1, 0, 1,
-0.5575208, -1.336319, -3.625048, 0.1764706, 1, 0, 1,
-0.5520731, -0.01962079, -0.8474749, 0.1686275, 1, 0, 1,
-0.5469452, 1.156101, 0.7027893, 0.1647059, 1, 0, 1,
-0.5469114, -0.789582, -4.304625, 0.1568628, 1, 0, 1,
-0.5464584, 0.2156438, -1.099478, 0.1529412, 1, 0, 1,
-0.5444867, -1.961686, -3.674058, 0.145098, 1, 0, 1,
-0.5441936, 1.491817, -0.4482982, 0.1411765, 1, 0, 1,
-0.5413547, 0.9524547, 0.4326448, 0.1333333, 1, 0, 1,
-0.5399176, -1.526085, -2.014063, 0.1294118, 1, 0, 1,
-0.5287603, -0.3037582, -2.884391, 0.1215686, 1, 0, 1,
-0.5267803, -0.4235343, -2.109627, 0.1176471, 1, 0, 1,
-0.5246455, 1.242664, -0.9698969, 0.1098039, 1, 0, 1,
-0.5224653, -0.5335126, -2.373216, 0.1058824, 1, 0, 1,
-0.5157027, -1.532241, -2.347487, 0.09803922, 1, 0, 1,
-0.5149912, -0.4817175, -3.692539, 0.09019608, 1, 0, 1,
-0.5130172, 1.922201, -1.17506, 0.08627451, 1, 0, 1,
-0.5114589, 0.3524074, 0.04688447, 0.07843138, 1, 0, 1,
-0.5054367, -1.312406, -3.882807, 0.07450981, 1, 0, 1,
-0.5027445, 1.615018, 0.8878655, 0.06666667, 1, 0, 1,
-0.4998068, 0.04818192, -1.549675, 0.0627451, 1, 0, 1,
-0.4890532, -0.4839596, -1.384026, 0.05490196, 1, 0, 1,
-0.4887857, 1.791948, 0.1404643, 0.05098039, 1, 0, 1,
-0.488022, 1.379289, -0.8664989, 0.04313726, 1, 0, 1,
-0.4875173, 0.1319799, -0.1550217, 0.03921569, 1, 0, 1,
-0.4870958, -1.221431, -3.975484, 0.03137255, 1, 0, 1,
-0.4818836, -0.365225, -1.744702, 0.02745098, 1, 0, 1,
-0.4809502, 1.361036, -1.317049, 0.01960784, 1, 0, 1,
-0.4792027, -0.2902196, -2.634287, 0.01568628, 1, 0, 1,
-0.4734452, 1.692787, -0.1330254, 0.007843138, 1, 0, 1,
-0.4693507, 1.019797, -1.348776, 0.003921569, 1, 0, 1,
-0.4641395, 0.1883127, -0.2695448, 0, 1, 0.003921569, 1,
-0.4575028, -1.285515, -2.500674, 0, 1, 0.01176471, 1,
-0.4541934, 0.3615055, -0.4061132, 0, 1, 0.01568628, 1,
-0.4503291, -1.117009, -4.054508, 0, 1, 0.02352941, 1,
-0.4484408, -1.811803, -1.885907, 0, 1, 0.02745098, 1,
-0.4462039, 1.236238, 1.413984, 0, 1, 0.03529412, 1,
-0.4441865, 0.203725, 0.7562246, 0, 1, 0.03921569, 1,
-0.4398127, 0.2166353, 0.2807428, 0, 1, 0.04705882, 1,
-0.4367279, 0.002676687, -3.11974, 0, 1, 0.05098039, 1,
-0.435455, -1.416052, -1.900282, 0, 1, 0.05882353, 1,
-0.4336961, -0.2190055, -2.582168, 0, 1, 0.0627451, 1,
-0.4327165, 1.018583, -0.49065, 0, 1, 0.07058824, 1,
-0.4319008, -0.8848022, -2.215604, 0, 1, 0.07450981, 1,
-0.4287087, 0.86271, 1.656046, 0, 1, 0.08235294, 1,
-0.4263779, -0.6901824, -3.222257, 0, 1, 0.08627451, 1,
-0.4240084, 0.5819409, -2.264242, 0, 1, 0.09411765, 1,
-0.4194811, -1.196196, -0.2335694, 0, 1, 0.1019608, 1,
-0.4191109, 0.14912, -1.528403, 0, 1, 0.1058824, 1,
-0.4181482, -0.9948168, -3.380203, 0, 1, 0.1137255, 1,
-0.4169107, 1.356718, -0.05086857, 0, 1, 0.1176471, 1,
-0.4163343, 0.8744534, -0.736973, 0, 1, 0.1254902, 1,
-0.4140054, -0.8908747, -2.310634, 0, 1, 0.1294118, 1,
-0.4128076, -0.2930829, -0.4939096, 0, 1, 0.1372549, 1,
-0.4116029, 1.765207, -1.291883, 0, 1, 0.1411765, 1,
-0.4109296, 0.6261194, 0.1030219, 0, 1, 0.1490196, 1,
-0.4097613, 0.8989009, -2.835733, 0, 1, 0.1529412, 1,
-0.4050798, 1.33749, -0.8243579, 0, 1, 0.1607843, 1,
-0.4041148, 1.223401, -0.7099819, 0, 1, 0.1647059, 1,
-0.4020056, 0.2655424, -0.2725625, 0, 1, 0.172549, 1,
-0.4014479, -0.4056297, -2.173009, 0, 1, 0.1764706, 1,
-0.4005718, -1.073438, -2.028832, 0, 1, 0.1843137, 1,
-0.3995798, 1.722843, -0.9577546, 0, 1, 0.1882353, 1,
-0.3988756, 0.3250965, -0.9267858, 0, 1, 0.1960784, 1,
-0.3955667, 1.793535, -0.8704521, 0, 1, 0.2039216, 1,
-0.3921048, 0.1173107, 0.8318899, 0, 1, 0.2078431, 1,
-0.3920567, 1.186308, -2.194874, 0, 1, 0.2156863, 1,
-0.3903626, -1.911858, -2.22827, 0, 1, 0.2196078, 1,
-0.3856928, -0.8051482, -2.160607, 0, 1, 0.227451, 1,
-0.3841575, 0.7049578, -1.387145, 0, 1, 0.2313726, 1,
-0.3810082, -1.4736, -4.005489, 0, 1, 0.2392157, 1,
-0.3788627, -0.7213898, -3.29649, 0, 1, 0.2431373, 1,
-0.3731514, 1.319937, 0.6128691, 0, 1, 0.2509804, 1,
-0.3711637, 0.5542899, 1.317502, 0, 1, 0.254902, 1,
-0.3664358, -1.10097, -2.146185, 0, 1, 0.2627451, 1,
-0.3607414, -0.7039727, -2.353662, 0, 1, 0.2666667, 1,
-0.3579075, 0.18435, -0.4752191, 0, 1, 0.2745098, 1,
-0.3543464, 0.1214193, -1.765021, 0, 1, 0.2784314, 1,
-0.3525687, 0.9376292, 0.43919, 0, 1, 0.2862745, 1,
-0.3520959, -0.06361353, -0.9967271, 0, 1, 0.2901961, 1,
-0.3492593, 0.5709795, 0.1668102, 0, 1, 0.2980392, 1,
-0.3487901, -0.3690237, -0.9726951, 0, 1, 0.3058824, 1,
-0.3477883, 0.5669363, -0.6263453, 0, 1, 0.3098039, 1,
-0.3466541, -0.7386215, -3.325428, 0, 1, 0.3176471, 1,
-0.3461564, -1.192612, -3.612967, 0, 1, 0.3215686, 1,
-0.345863, -0.6439745, -3.197096, 0, 1, 0.3294118, 1,
-0.3410223, -1.452986, -3.373004, 0, 1, 0.3333333, 1,
-0.3363058, 1.062123, 0.3925366, 0, 1, 0.3411765, 1,
-0.3327166, -0.4313527, -2.500012, 0, 1, 0.345098, 1,
-0.3304478, -2.11464, -2.141057, 0, 1, 0.3529412, 1,
-0.3295809, 0.3689889, 0.5032216, 0, 1, 0.3568628, 1,
-0.3291128, -0.06474997, -2.774803, 0, 1, 0.3647059, 1,
-0.3277182, 0.4518747, -2.303617, 0, 1, 0.3686275, 1,
-0.3252148, -0.5252272, -2.532604, 0, 1, 0.3764706, 1,
-0.3243123, 0.9859177, 0.2234378, 0, 1, 0.3803922, 1,
-0.3233055, 1.909533, 1.736364, 0, 1, 0.3882353, 1,
-0.3200268, -0.9135058, -3.182755, 0, 1, 0.3921569, 1,
-0.3182231, -0.6455786, -4.28539, 0, 1, 0.4, 1,
-0.3146565, 0.4192214, 1.209799, 0, 1, 0.4078431, 1,
-0.3119327, -0.4889836, -2.63337, 0, 1, 0.4117647, 1,
-0.3119312, -0.7104574, -2.621906, 0, 1, 0.4196078, 1,
-0.3091878, -3.295831, -2.359601, 0, 1, 0.4235294, 1,
-0.3086953, -0.4075696, -3.614318, 0, 1, 0.4313726, 1,
-0.3084885, 1.241699, 0.5137398, 0, 1, 0.4352941, 1,
-0.307343, -1.367517, -1.446942, 0, 1, 0.4431373, 1,
-0.3053142, -0.8977143, -3.650223, 0, 1, 0.4470588, 1,
-0.3036389, 0.9762155, 0.833118, 0, 1, 0.454902, 1,
-0.2982926, -0.3831009, -1.822492, 0, 1, 0.4588235, 1,
-0.2976997, 0.4770078, 0.05519861, 0, 1, 0.4666667, 1,
-0.2976021, 1.268531, 0.2057324, 0, 1, 0.4705882, 1,
-0.2961585, 0.1570922, -1.813884, 0, 1, 0.4784314, 1,
-0.2946261, 0.5236902, -1.514559, 0, 1, 0.4823529, 1,
-0.2937514, -0.9837297, -1.95503, 0, 1, 0.4901961, 1,
-0.2929558, -0.1662644, -3.649942, 0, 1, 0.4941176, 1,
-0.2918102, 0.4897036, -0.8447683, 0, 1, 0.5019608, 1,
-0.2916047, 0.6974007, -1.047369, 0, 1, 0.509804, 1,
-0.2903295, -0.2799187, -5.198373, 0, 1, 0.5137255, 1,
-0.2900602, 1.439242, -0.4022444, 0, 1, 0.5215687, 1,
-0.2883259, 0.9363983, 0.82389, 0, 1, 0.5254902, 1,
-0.2856262, 0.4081108, -0.2213282, 0, 1, 0.5333334, 1,
-0.2821921, 1.020409, -0.9210718, 0, 1, 0.5372549, 1,
-0.281622, -0.2528605, -0.8159721, 0, 1, 0.5450981, 1,
-0.2747446, -0.256787, -1.438995, 0, 1, 0.5490196, 1,
-0.2733273, 1.493798, 0.2243063, 0, 1, 0.5568628, 1,
-0.2716036, -0.1898884, -1.142504, 0, 1, 0.5607843, 1,
-0.2706853, -0.216957, -2.671882, 0, 1, 0.5686275, 1,
-0.2680558, -0.345894, -2.329849, 0, 1, 0.572549, 1,
-0.2677418, 2.027215, 0.8137142, 0, 1, 0.5803922, 1,
-0.2646702, -1.470349, -2.680516, 0, 1, 0.5843138, 1,
-0.2633716, -0.5194198, -3.486132, 0, 1, 0.5921569, 1,
-0.2632529, -0.5622875, -1.874864, 0, 1, 0.5960785, 1,
-0.2620344, 1.532238, -1.070142, 0, 1, 0.6039216, 1,
-0.2600572, -0.5759077, -2.411381, 0, 1, 0.6117647, 1,
-0.2580333, -0.1977235, -1.30479, 0, 1, 0.6156863, 1,
-0.251562, -1.834493, -3.572325, 0, 1, 0.6235294, 1,
-0.2474717, -1.624033, -1.567005, 0, 1, 0.627451, 1,
-0.2464701, 0.5833834, -1.071429, 0, 1, 0.6352941, 1,
-0.2341831, -0.537183, -2.469375, 0, 1, 0.6392157, 1,
-0.2337219, 1.181768, -0.006273595, 0, 1, 0.6470588, 1,
-0.2336822, 0.431256, 0.09262254, 0, 1, 0.6509804, 1,
-0.2316723, -0.9364274, -1.001868, 0, 1, 0.6588235, 1,
-0.2274349, 0.0918351, -2.136661, 0, 1, 0.6627451, 1,
-0.2135339, 0.1587353, -1.726962, 0, 1, 0.6705883, 1,
-0.2131907, 1.157323, -0.3069859, 0, 1, 0.6745098, 1,
-0.2103901, 0.8938636, -0.2275686, 0, 1, 0.682353, 1,
-0.2079511, 0.7059766, -1.598122, 0, 1, 0.6862745, 1,
-0.2074511, 0.5535036, -0.2352704, 0, 1, 0.6941177, 1,
-0.2072355, -0.05270153, -1.787309, 0, 1, 0.7019608, 1,
-0.2054352, 0.5252825, 0.5600632, 0, 1, 0.7058824, 1,
-0.202977, 0.2328966, -1.12799, 0, 1, 0.7137255, 1,
-0.2026135, -0.1319053, -2.325624, 0, 1, 0.7176471, 1,
-0.2019891, -0.3096821, -2.565491, 0, 1, 0.7254902, 1,
-0.2017703, 0.299913, 0.1382542, 0, 1, 0.7294118, 1,
-0.1984634, 0.2128152, -1.347741, 0, 1, 0.7372549, 1,
-0.1927874, -1.463445, -2.549743, 0, 1, 0.7411765, 1,
-0.186639, 0.4063458, 1.718679, 0, 1, 0.7490196, 1,
-0.1843928, 1.157432, 0.856286, 0, 1, 0.7529412, 1,
-0.1825877, -1.68681, -3.690801, 0, 1, 0.7607843, 1,
-0.1812295, 0.5088043, -1.425152, 0, 1, 0.7647059, 1,
-0.1756285, 1.066237, 0.4397342, 0, 1, 0.772549, 1,
-0.175504, 0.7564885, -1.118242, 0, 1, 0.7764706, 1,
-0.1747723, 0.5649496, -0.5968287, 0, 1, 0.7843137, 1,
-0.1745068, 0.109312, -0.8015542, 0, 1, 0.7882353, 1,
-0.1726914, -0.6012573, -2.166027, 0, 1, 0.7960784, 1,
-0.1721664, 0.72883, -1.358054, 0, 1, 0.8039216, 1,
-0.1661177, 0.916994, -0.2831748, 0, 1, 0.8078431, 1,
-0.1635113, 0.2560376, 0.4413284, 0, 1, 0.8156863, 1,
-0.1627947, 1.772015, -1.449766, 0, 1, 0.8196079, 1,
-0.1615266, -0.7245193, -5.64346, 0, 1, 0.827451, 1,
-0.1595504, 0.09104314, -0.5330216, 0, 1, 0.8313726, 1,
-0.1587691, -1.308599, -1.724393, 0, 1, 0.8392157, 1,
-0.1586834, -0.09396527, -1.193401, 0, 1, 0.8431373, 1,
-0.1530237, 1.254754, -1.061623, 0, 1, 0.8509804, 1,
-0.1523222, 0.2327902, -1.817443, 0, 1, 0.854902, 1,
-0.148919, -0.2621393, -2.340859, 0, 1, 0.8627451, 1,
-0.1439988, 0.232988, -0.1205348, 0, 1, 0.8666667, 1,
-0.1394819, -0.1226805, -0.4716522, 0, 1, 0.8745098, 1,
-0.1319806, 0.02740904, -1.408432, 0, 1, 0.8784314, 1,
-0.1309759, 0.6285686, -0.09851608, 0, 1, 0.8862745, 1,
-0.13046, -0.2583578, -3.06326, 0, 1, 0.8901961, 1,
-0.1272063, 0.4004354, -0.3442586, 0, 1, 0.8980392, 1,
-0.1271608, 0.7862802, -0.6295989, 0, 1, 0.9058824, 1,
-0.1259379, 1.805565, 1.312127, 0, 1, 0.9098039, 1,
-0.1234496, 0.4826047, 1.304157, 0, 1, 0.9176471, 1,
-0.1201962, -0.1967624, -3.880414, 0, 1, 0.9215686, 1,
-0.1200923, -0.599862, -1.915015, 0, 1, 0.9294118, 1,
-0.1176979, 0.9855807, 0.3301276, 0, 1, 0.9333333, 1,
-0.1158396, -0.3445177, -3.055139, 0, 1, 0.9411765, 1,
-0.1135587, 0.907248, -1.059295, 0, 1, 0.945098, 1,
-0.1090912, -0.9262719, -2.892447, 0, 1, 0.9529412, 1,
-0.103968, -0.8929672, -1.491966, 0, 1, 0.9568627, 1,
-0.1028688, -0.5122411, -1.843817, 0, 1, 0.9647059, 1,
-0.09974057, 0.9909742, -0.7542148, 0, 1, 0.9686275, 1,
-0.09173201, -2.404374, -2.404839, 0, 1, 0.9764706, 1,
-0.09046726, 0.4275399, -0.0644915, 0, 1, 0.9803922, 1,
-0.08943301, -0.9827324, -3.514045, 0, 1, 0.9882353, 1,
-0.08891524, -0.05193159, -2.963969, 0, 1, 0.9921569, 1,
-0.08055165, 0.5486763, -0.9214411, 0, 1, 1, 1,
-0.08004592, 1.386744, 2.044761, 0, 0.9921569, 1, 1,
-0.07990857, -0.7629646, -2.737959, 0, 0.9882353, 1, 1,
-0.07739136, 1.234319, -0.289729, 0, 0.9803922, 1, 1,
-0.07590144, 0.254502, -3.221443, 0, 0.9764706, 1, 1,
-0.07364984, 1.143752, -1.943866, 0, 0.9686275, 1, 1,
-0.06898241, -0.398417, -1.508456, 0, 0.9647059, 1, 1,
-0.06876756, -1.525584, -1.407329, 0, 0.9568627, 1, 1,
-0.06820177, -0.6210739, -2.606175, 0, 0.9529412, 1, 1,
-0.06708475, -0.2933185, -4.465134, 0, 0.945098, 1, 1,
-0.06668588, 0.944545, -0.3454579, 0, 0.9411765, 1, 1,
-0.06527264, -0.2531849, -2.927691, 0, 0.9333333, 1, 1,
-0.06389739, -0.3312038, -3.058274, 0, 0.9294118, 1, 1,
-0.06125531, 0.216806, -1.546288, 0, 0.9215686, 1, 1,
-0.05520235, 0.2495466, -0.3864846, 0, 0.9176471, 1, 1,
-0.05458961, -0.5664987, -5.4054, 0, 0.9098039, 1, 1,
-0.05415605, 0.003326313, -1.094176, 0, 0.9058824, 1, 1,
-0.05366865, -0.2962404, -3.078992, 0, 0.8980392, 1, 1,
-0.05082577, -0.03854439, -0.7308901, 0, 0.8901961, 1, 1,
-0.04859097, -0.7773739, -2.668378, 0, 0.8862745, 1, 1,
-0.04824539, -0.7411991, -3.255289, 0, 0.8784314, 1, 1,
-0.04436047, 0.1463836, -0.4758734, 0, 0.8745098, 1, 1,
-0.04312943, -0.3178529, -1.653926, 0, 0.8666667, 1, 1,
-0.04140373, -1.915427, -2.520194, 0, 0.8627451, 1, 1,
-0.02482595, -0.7789801, -0.3041357, 0, 0.854902, 1, 1,
-0.0243416, -1.066308, -4.375154, 0, 0.8509804, 1, 1,
-0.02408441, -2.379574, -3.11362, 0, 0.8431373, 1, 1,
-0.02348173, 0.3453792, -1.138972, 0, 0.8392157, 1, 1,
-0.02223768, 0.5740095, 0.7095027, 0, 0.8313726, 1, 1,
-0.01999734, 0.3853825, 0.1761187, 0, 0.827451, 1, 1,
-0.01948704, 0.4616062, 0.9639421, 0, 0.8196079, 1, 1,
-0.01819124, 0.6434746, 0.752584, 0, 0.8156863, 1, 1,
-0.01499078, 2.258085, 0.7400754, 0, 0.8078431, 1, 1,
-0.01453037, -1.578892, -3.214266, 0, 0.8039216, 1, 1,
-0.01277064, 0.09379007, 0.08058858, 0, 0.7960784, 1, 1,
-0.01007402, 2.50687, -0.4050119, 0, 0.7882353, 1, 1,
-0.006085663, 0.9502704, 0.5626697, 0, 0.7843137, 1, 1,
-0.005319025, -1.488566, -1.876332, 0, 0.7764706, 1, 1,
0.0006552596, -0.4194347, 3.215547, 0, 0.772549, 1, 1,
0.001909591, -0.2622684, 2.308279, 0, 0.7647059, 1, 1,
0.002610286, -0.2426447, 3.224688, 0, 0.7607843, 1, 1,
0.01427433, -0.6022446, 4.296031, 0, 0.7529412, 1, 1,
0.01694762, -0.3789073, 3.015222, 0, 0.7490196, 1, 1,
0.01910879, -0.01225365, 2.098387, 0, 0.7411765, 1, 1,
0.02495532, 0.04023686, 1.669672, 0, 0.7372549, 1, 1,
0.02729103, -2.411986, 2.886474, 0, 0.7294118, 1, 1,
0.02736858, -1.016423, 3.528493, 0, 0.7254902, 1, 1,
0.04190122, 1.48449, 0.2231183, 0, 0.7176471, 1, 1,
0.04214701, -1.934201, 3.260623, 0, 0.7137255, 1, 1,
0.04274174, -1.387748, 4.418223, 0, 0.7058824, 1, 1,
0.04335369, -0.6760598, 2.026904, 0, 0.6980392, 1, 1,
0.0458266, -1.601886, 4.943145, 0, 0.6941177, 1, 1,
0.04916235, -0.3954166, 3.90651, 0, 0.6862745, 1, 1,
0.05154933, 1.152345, 1.016379, 0, 0.682353, 1, 1,
0.05404145, -0.2085791, 2.257195, 0, 0.6745098, 1, 1,
0.05670623, -0.1395086, 2.579476, 0, 0.6705883, 1, 1,
0.05908686, 0.885721, 0.7224147, 0, 0.6627451, 1, 1,
0.06012312, 1.591535, 0.6541399, 0, 0.6588235, 1, 1,
0.06303408, 0.3476109, -1.30142, 0, 0.6509804, 1, 1,
0.06535091, 0.007158984, 1.34119, 0, 0.6470588, 1, 1,
0.06587891, -0.0700794, 2.716429, 0, 0.6392157, 1, 1,
0.06823756, 1.321538, -0.3104063, 0, 0.6352941, 1, 1,
0.07152572, -0.4629976, 3.886551, 0, 0.627451, 1, 1,
0.07668459, -0.009942783, 2.463701, 0, 0.6235294, 1, 1,
0.07731926, -2.162928, 2.862573, 0, 0.6156863, 1, 1,
0.07823582, -1.04776, 3.715009, 0, 0.6117647, 1, 1,
0.07979652, -1.599076, 2.52905, 0, 0.6039216, 1, 1,
0.08056507, 1.969151, -0.3252825, 0, 0.5960785, 1, 1,
0.08163078, -1.487695, 3.240495, 0, 0.5921569, 1, 1,
0.0844764, 0.4861187, -1.067653, 0, 0.5843138, 1, 1,
0.09340144, -0.01524484, 0.2655399, 0, 0.5803922, 1, 1,
0.0949365, -0.7279314, 2.134753, 0, 0.572549, 1, 1,
0.09671844, 0.8595294, -0.682797, 0, 0.5686275, 1, 1,
0.1010942, -0.3229397, 2.140668, 0, 0.5607843, 1, 1,
0.1094183, 0.8252173, 1.085368, 0, 0.5568628, 1, 1,
0.111221, 0.5702959, -1.568083, 0, 0.5490196, 1, 1,
0.1135072, 1.140501, -1.251799, 0, 0.5450981, 1, 1,
0.1139906, 1.068019, 0.3450121, 0, 0.5372549, 1, 1,
0.1146893, 0.051598, -0.4648976, 0, 0.5333334, 1, 1,
0.1170977, -0.6161317, 2.552037, 0, 0.5254902, 1, 1,
0.1230053, 0.9510586, 1.829272, 0, 0.5215687, 1, 1,
0.1230894, 0.4190566, -0.4587077, 0, 0.5137255, 1, 1,
0.1283427, -0.1746678, 1.717804, 0, 0.509804, 1, 1,
0.1293827, 0.4031376, 0.3834318, 0, 0.5019608, 1, 1,
0.1546742, -0.2415085, 2.005697, 0, 0.4941176, 1, 1,
0.1639524, 1.06655, -1.229094, 0, 0.4901961, 1, 1,
0.1665632, -0.5219811, 2.7453, 0, 0.4823529, 1, 1,
0.1722936, 0.1809178, 1.126849, 0, 0.4784314, 1, 1,
0.1726325, 0.2504206, 1.343988, 0, 0.4705882, 1, 1,
0.1727129, 1.577557, 0.5779735, 0, 0.4666667, 1, 1,
0.1809029, -0.7723987, 2.546676, 0, 0.4588235, 1, 1,
0.1811672, 0.1441547, 1.629783, 0, 0.454902, 1, 1,
0.1817088, -1.022673, 4.148685, 0, 0.4470588, 1, 1,
0.1817804, 1.056683, -0.2160379, 0, 0.4431373, 1, 1,
0.1845347, 0.3558335, 0.9992754, 0, 0.4352941, 1, 1,
0.1848265, 0.07182605, 1.017582, 0, 0.4313726, 1, 1,
0.1942924, -1.210442, 5.453288, 0, 0.4235294, 1, 1,
0.1951119, 0.7880716, 0.3223385, 0, 0.4196078, 1, 1,
0.1962215, -0.4804112, 0.7572144, 0, 0.4117647, 1, 1,
0.1969621, -0.2015231, 3.043984, 0, 0.4078431, 1, 1,
0.2012667, -0.7612496, 2.833408, 0, 0.4, 1, 1,
0.2058939, -0.4624641, 1.501902, 0, 0.3921569, 1, 1,
0.2063649, 0.9842589, 0.0357707, 0, 0.3882353, 1, 1,
0.2088765, 0.877242, 0.3783713, 0, 0.3803922, 1, 1,
0.2158305, 0.09968415, 2.332541, 0, 0.3764706, 1, 1,
0.216088, 0.6076878, -0.444629, 0, 0.3686275, 1, 1,
0.2167622, -0.478625, 3.915349, 0, 0.3647059, 1, 1,
0.2172768, -0.3497026, 3.58556, 0, 0.3568628, 1, 1,
0.2201525, 1.488196, -0.2521543, 0, 0.3529412, 1, 1,
0.2225204, -0.10256, 2.753186, 0, 0.345098, 1, 1,
0.2282835, 0.2381106, 2.684491, 0, 0.3411765, 1, 1,
0.2366317, -0.2176172, 1.157547, 0, 0.3333333, 1, 1,
0.242023, 0.7901558, 0.6324455, 0, 0.3294118, 1, 1,
0.2420327, -0.737456, 3.820385, 0, 0.3215686, 1, 1,
0.2435325, 0.4609299, -0.1203662, 0, 0.3176471, 1, 1,
0.2436933, 1.450148, 1.492462, 0, 0.3098039, 1, 1,
0.2481005, 0.9470906, -2.042461, 0, 0.3058824, 1, 1,
0.2510661, -0.4579739, 3.859624, 0, 0.2980392, 1, 1,
0.2523424, 1.574894, -0.4492595, 0, 0.2901961, 1, 1,
0.2523889, 1.563929, -0.4554817, 0, 0.2862745, 1, 1,
0.2565249, 1.171668, -0.9639915, 0, 0.2784314, 1, 1,
0.2569781, -0.1413713, 4.003702, 0, 0.2745098, 1, 1,
0.2606645, 0.2302531, 1.163851, 0, 0.2666667, 1, 1,
0.2646528, 1.226705, 0.1701149, 0, 0.2627451, 1, 1,
0.2650336, 0.8158726, -0.6254347, 0, 0.254902, 1, 1,
0.2679187, 0.8427213, -0.1361477, 0, 0.2509804, 1, 1,
0.275871, -0.07759348, 1.953347, 0, 0.2431373, 1, 1,
0.2772784, -0.9950608, 1.444599, 0, 0.2392157, 1, 1,
0.2800897, 0.555205, 0.7916901, 0, 0.2313726, 1, 1,
0.2822568, -1.284968, 1.428933, 0, 0.227451, 1, 1,
0.2909927, 1.195128, 0.3520377, 0, 0.2196078, 1, 1,
0.2923684, 0.4118321, 0.741111, 0, 0.2156863, 1, 1,
0.3015358, 1.223016, 0.398867, 0, 0.2078431, 1, 1,
0.3032975, 0.7753654, 0.8263342, 0, 0.2039216, 1, 1,
0.3072524, 0.3948444, 0.2616761, 0, 0.1960784, 1, 1,
0.3112623, -0.3448115, 2.974418, 0, 0.1882353, 1, 1,
0.3122282, 0.01191593, 0.3010712, 0, 0.1843137, 1, 1,
0.314783, 0.2641694, -0.4884343, 0, 0.1764706, 1, 1,
0.3164036, 0.8827605, -0.8342088, 0, 0.172549, 1, 1,
0.3188674, 0.3465034, -2.026984, 0, 0.1647059, 1, 1,
0.3208071, -0.4177188, 2.897029, 0, 0.1607843, 1, 1,
0.3281716, 0.5796249, -0.5603079, 0, 0.1529412, 1, 1,
0.3287301, -0.9492106, 5.429016, 0, 0.1490196, 1, 1,
0.3289526, -0.03953125, 3.077003, 0, 0.1411765, 1, 1,
0.3371334, -2.10645, 3.377639, 0, 0.1372549, 1, 1,
0.3388534, -2.203588, 3.58322, 0, 0.1294118, 1, 1,
0.3466133, -1.412808, 3.027297, 0, 0.1254902, 1, 1,
0.34694, 0.4348457, 0.5845127, 0, 0.1176471, 1, 1,
0.3482485, -0.4046306, 1.365842, 0, 0.1137255, 1, 1,
0.3483063, -1.647764, 3.622736, 0, 0.1058824, 1, 1,
0.3489981, 0.5750149, 1.81547, 0, 0.09803922, 1, 1,
0.355051, 0.951547, 0.2122582, 0, 0.09411765, 1, 1,
0.3552614, -0.3538893, 2.335852, 0, 0.08627451, 1, 1,
0.3581159, 0.5733698, 0.1892625, 0, 0.08235294, 1, 1,
0.3617699, 0.2409663, -0.1122233, 0, 0.07450981, 1, 1,
0.3619559, -0.245169, 2.937713, 0, 0.07058824, 1, 1,
0.3782502, 0.1049439, 1.529229, 0, 0.0627451, 1, 1,
0.3809787, -0.01887323, 1.212794, 0, 0.05882353, 1, 1,
0.3810482, -0.03871198, 2.350553, 0, 0.05098039, 1, 1,
0.3817753, -1.850874, 3.715812, 0, 0.04705882, 1, 1,
0.3817919, 0.7741227, 2.708049, 0, 0.03921569, 1, 1,
0.3964016, 0.1513811, 0.0504722, 0, 0.03529412, 1, 1,
0.4007594, -1.099534, 2.820348, 0, 0.02745098, 1, 1,
0.4012088, -0.3851739, 2.819949, 0, 0.02352941, 1, 1,
0.4070081, -0.6614998, 4.615631, 0, 0.01568628, 1, 1,
0.4077177, -0.5339822, 1.61776, 0, 0.01176471, 1, 1,
0.4116617, -0.6677821, 2.42132, 0, 0.003921569, 1, 1,
0.4123876, -0.6846968, 2.991486, 0.003921569, 0, 1, 1,
0.4124213, 0.4767383, 0.2362196, 0.007843138, 0, 1, 1,
0.4139041, -0.06884743, 2.855613, 0.01568628, 0, 1, 1,
0.4139684, 0.2465291, 0.7530045, 0.01960784, 0, 1, 1,
0.4201066, 0.5313722, 0.4096434, 0.02745098, 0, 1, 1,
0.4282416, 0.3944619, 0.9133855, 0.03137255, 0, 1, 1,
0.4319598, -0.08133018, 3.831619, 0.03921569, 0, 1, 1,
0.4332414, 0.3094639, 1.68584, 0.04313726, 0, 1, 1,
0.4357347, -0.5317347, 2.516113, 0.05098039, 0, 1, 1,
0.4357798, 1.608015, 0.6135671, 0.05490196, 0, 1, 1,
0.4361548, 2.34919, 0.4986127, 0.0627451, 0, 1, 1,
0.4424381, -0.9384493, 2.934135, 0.06666667, 0, 1, 1,
0.4447437, 1.369594, -0.6226133, 0.07450981, 0, 1, 1,
0.4455008, 1.415386, 0.8343129, 0.07843138, 0, 1, 1,
0.4458145, -0.09022756, 2.246789, 0.08627451, 0, 1, 1,
0.4463146, -1.402996, 3.686243, 0.09019608, 0, 1, 1,
0.4467305, -1.272889, 4.902137, 0.09803922, 0, 1, 1,
0.4485278, -0.7195073, 1.421598, 0.1058824, 0, 1, 1,
0.450686, 2.194413, -0.3831101, 0.1098039, 0, 1, 1,
0.4523149, 0.3570872, 0.5288696, 0.1176471, 0, 1, 1,
0.4529536, 0.6933699, 0.6193327, 0.1215686, 0, 1, 1,
0.4541128, 0.8014494, 0.2794299, 0.1294118, 0, 1, 1,
0.4598984, -0.6975022, 2.709551, 0.1333333, 0, 1, 1,
0.462381, 0.6437127, -0.5259268, 0.1411765, 0, 1, 1,
0.4636216, -1.030278, 1.895138, 0.145098, 0, 1, 1,
0.4641638, -0.9121085, 0.1299121, 0.1529412, 0, 1, 1,
0.4643053, 0.2138947, 2.192111, 0.1568628, 0, 1, 1,
0.468438, 0.7250391, 0.09372716, 0.1647059, 0, 1, 1,
0.4739029, -1.583055, 2.428338, 0.1686275, 0, 1, 1,
0.4798181, -2.216263, 4.644824, 0.1764706, 0, 1, 1,
0.4799304, 0.09546667, 2.789934, 0.1803922, 0, 1, 1,
0.4817493, 0.5191057, 0.09923243, 0.1882353, 0, 1, 1,
0.481855, 1.213751, 0.1436606, 0.1921569, 0, 1, 1,
0.4823322, 1.596226, 1.006705, 0.2, 0, 1, 1,
0.4828682, -0.9922333, 2.294053, 0.2078431, 0, 1, 1,
0.4867668, -0.6212538, 3.726351, 0.2117647, 0, 1, 1,
0.4868506, -0.2529046, 3.595857, 0.2196078, 0, 1, 1,
0.4876618, -0.8105214, 0.7087324, 0.2235294, 0, 1, 1,
0.4895603, -0.09244493, 2.700866, 0.2313726, 0, 1, 1,
0.4968018, -1.570539, 2.801808, 0.2352941, 0, 1, 1,
0.4986468, 0.1546656, -0.1898573, 0.2431373, 0, 1, 1,
0.4988356, -0.4064989, 3.344548, 0.2470588, 0, 1, 1,
0.5038845, 1.49052, -1.27806, 0.254902, 0, 1, 1,
0.5057338, -1.14909, 1.489883, 0.2588235, 0, 1, 1,
0.509681, 0.7815533, 0.8313534, 0.2666667, 0, 1, 1,
0.5113323, -0.42877, 2.698251, 0.2705882, 0, 1, 1,
0.5122084, 0.9703062, 2.461826, 0.2784314, 0, 1, 1,
0.5137452, -0.5260611, 2.275729, 0.282353, 0, 1, 1,
0.5159395, 0.1559404, 3.755183, 0.2901961, 0, 1, 1,
0.5189862, -2.759014, 2.108118, 0.2941177, 0, 1, 1,
0.529175, 0.3955687, 1.503775, 0.3019608, 0, 1, 1,
0.5381292, 1.523215, -0.6156585, 0.3098039, 0, 1, 1,
0.5531901, -1.024173, 1.040396, 0.3137255, 0, 1, 1,
0.5533295, 0.02335943, 0.7976415, 0.3215686, 0, 1, 1,
0.5573395, 0.4899012, 1.252712, 0.3254902, 0, 1, 1,
0.5631314, 0.383755, 1.655724, 0.3333333, 0, 1, 1,
0.5656778, -1.062887, 1.457402, 0.3372549, 0, 1, 1,
0.5710794, -0.11733, 2.443955, 0.345098, 0, 1, 1,
0.5729271, -0.4319736, 3.544086, 0.3490196, 0, 1, 1,
0.5871542, -0.5064055, 2.238332, 0.3568628, 0, 1, 1,
0.5907477, 2.567589, 0.2159721, 0.3607843, 0, 1, 1,
0.5941897, -0.3672695, 1.369196, 0.3686275, 0, 1, 1,
0.5982691, -0.04353232, 2.640265, 0.372549, 0, 1, 1,
0.6056593, -0.9585602, 2.004379, 0.3803922, 0, 1, 1,
0.6124603, 0.6455767, 1.126547, 0.3843137, 0, 1, 1,
0.6157591, 0.177733, 1.860074, 0.3921569, 0, 1, 1,
0.6161592, 0.3704862, 0.5063251, 0.3960784, 0, 1, 1,
0.6165554, 0.7827393, -0.3061038, 0.4039216, 0, 1, 1,
0.621775, 1.716955, -0.1935419, 0.4117647, 0, 1, 1,
0.6249284, -0.4366017, 1.93441, 0.4156863, 0, 1, 1,
0.6249789, -0.5274999, 2.768008, 0.4235294, 0, 1, 1,
0.6268683, 0.5448701, -1.006279, 0.427451, 0, 1, 1,
0.6292898, -0.02421058, 2.069676, 0.4352941, 0, 1, 1,
0.6303129, 1.060014, 0.7654788, 0.4392157, 0, 1, 1,
0.6355273, -0.08017414, 1.256231, 0.4470588, 0, 1, 1,
0.6386304, 0.08866549, 0.6446168, 0.4509804, 0, 1, 1,
0.6414993, -1.579898, 2.225944, 0.4588235, 0, 1, 1,
0.6477894, 0.06280062, 1.400708, 0.4627451, 0, 1, 1,
0.6478508, 1.838574, -0.7156766, 0.4705882, 0, 1, 1,
0.6481076, -0.5497164, 1.67459, 0.4745098, 0, 1, 1,
0.6552914, 0.8265241, 1.309191, 0.4823529, 0, 1, 1,
0.6608802, 1.449915, 1.245359, 0.4862745, 0, 1, 1,
0.6635378, -0.108714, 1.63261, 0.4941176, 0, 1, 1,
0.6659098, 0.003968825, 0.8885359, 0.5019608, 0, 1, 1,
0.6664035, 0.128383, -0.402728, 0.5058824, 0, 1, 1,
0.6667479, 0.7078061, 2.789228, 0.5137255, 0, 1, 1,
0.6672927, -0.7412863, 3.084979, 0.5176471, 0, 1, 1,
0.6681168, -0.8912493, 3.011734, 0.5254902, 0, 1, 1,
0.6701395, 2.194048, 0.6012169, 0.5294118, 0, 1, 1,
0.6754342, -0.6416858, 2.79502, 0.5372549, 0, 1, 1,
0.6762337, -2.098732, 2.621799, 0.5411765, 0, 1, 1,
0.6796343, 1.453318, -0.5045698, 0.5490196, 0, 1, 1,
0.6828597, -0.8747625, 3.912973, 0.5529412, 0, 1, 1,
0.684226, 1.190982, 0.4020593, 0.5607843, 0, 1, 1,
0.6947194, 1.808556, 1.344537, 0.5647059, 0, 1, 1,
0.6955322, -1.678068, 4.194754, 0.572549, 0, 1, 1,
0.707376, 1.37456, 0.2876569, 0.5764706, 0, 1, 1,
0.7102742, 0.1098403, 1.653531, 0.5843138, 0, 1, 1,
0.7105249, -0.2401465, 1.21541, 0.5882353, 0, 1, 1,
0.7117882, 0.659078, 1.043656, 0.5960785, 0, 1, 1,
0.7118367, 1.306015, 0.02278764, 0.6039216, 0, 1, 1,
0.7122147, 0.17299, 1.164549, 0.6078432, 0, 1, 1,
0.7128366, -0.5734499, 1.72645, 0.6156863, 0, 1, 1,
0.7199759, 0.7754457, 0.5563471, 0.6196079, 0, 1, 1,
0.7282102, -0.1083598, 2.784311, 0.627451, 0, 1, 1,
0.7292297, -0.2126493, 1.54176, 0.6313726, 0, 1, 1,
0.7323092, -1.134997, 3.380611, 0.6392157, 0, 1, 1,
0.7337766, 0.8150661, 0.6864128, 0.6431373, 0, 1, 1,
0.7359481, -0.1949547, 2.113491, 0.6509804, 0, 1, 1,
0.7364489, -0.7736832, 2.680917, 0.654902, 0, 1, 1,
0.7378694, -0.1778168, 3.69427, 0.6627451, 0, 1, 1,
0.7438781, -0.8876197, 3.660343, 0.6666667, 0, 1, 1,
0.7471852, 1.281496, -0.4313192, 0.6745098, 0, 1, 1,
0.7493998, -1.14748, 4.107804, 0.6784314, 0, 1, 1,
0.7517117, 0.1215658, 1.017723, 0.6862745, 0, 1, 1,
0.7593288, 0.00666431, 0.8536941, 0.6901961, 0, 1, 1,
0.7596048, -0.9397213, 0.3170807, 0.6980392, 0, 1, 1,
0.7605766, 0.9747202, 0.6225078, 0.7058824, 0, 1, 1,
0.7621768, -0.7512973, 2.094536, 0.7098039, 0, 1, 1,
0.7650943, -0.673219, 3.962499, 0.7176471, 0, 1, 1,
0.7706602, 1.078152, -0.4314788, 0.7215686, 0, 1, 1,
0.7797984, -1.174169, 4.196333, 0.7294118, 0, 1, 1,
0.7805681, 0.1971184, 2.273549, 0.7333333, 0, 1, 1,
0.7807442, 1.219289, 0.272858, 0.7411765, 0, 1, 1,
0.7869106, -0.6421438, 0.8735078, 0.7450981, 0, 1, 1,
0.7874811, 1.497964, 0.8733819, 0.7529412, 0, 1, 1,
0.7894974, 0.8629971, -0.4376529, 0.7568628, 0, 1, 1,
0.7997902, 0.7113711, 0.8846828, 0.7647059, 0, 1, 1,
0.8005381, 1.654146, 0.242451, 0.7686275, 0, 1, 1,
0.8023678, 2.593566, 1.361578, 0.7764706, 0, 1, 1,
0.8024009, -1.663783, 3.229739, 0.7803922, 0, 1, 1,
0.8062387, 1.566359, 0.3069971, 0.7882353, 0, 1, 1,
0.8080375, 0.5719935, 0.3714722, 0.7921569, 0, 1, 1,
0.815883, 0.1469723, 0.5018125, 0.8, 0, 1, 1,
0.8182048, -0.5983425, 1.252859, 0.8078431, 0, 1, 1,
0.8221425, 0.1211171, -1.583441, 0.8117647, 0, 1, 1,
0.8236304, 0.1878193, 3.283496, 0.8196079, 0, 1, 1,
0.8256758, -0.2862876, 2.668848, 0.8235294, 0, 1, 1,
0.8279808, -1.012505, 2.30671, 0.8313726, 0, 1, 1,
0.828691, -0.1275936, 1.226884, 0.8352941, 0, 1, 1,
0.8297785, 0.6481495, 2.371262, 0.8431373, 0, 1, 1,
0.8379583, -0.3993496, 2.203418, 0.8470588, 0, 1, 1,
0.8541033, 0.6160169, 0.8539158, 0.854902, 0, 1, 1,
0.8582621, -1.083435, 4.128665, 0.8588235, 0, 1, 1,
0.8717327, 1.086017, 0.7546411, 0.8666667, 0, 1, 1,
0.8718075, 0.9797146, 0.8251129, 0.8705882, 0, 1, 1,
0.8723481, -0.4441172, 2.847494, 0.8784314, 0, 1, 1,
0.8752661, -0.8723915, 3.730517, 0.8823529, 0, 1, 1,
0.8843878, 0.9283819, 2.174783, 0.8901961, 0, 1, 1,
0.8889314, -0.8907555, 2.524155, 0.8941177, 0, 1, 1,
0.8904529, 0.8594471, 0.6742308, 0.9019608, 0, 1, 1,
0.892379, -0.5367612, 5.058066, 0.9098039, 0, 1, 1,
0.8960345, -0.2234404, -1.519749, 0.9137255, 0, 1, 1,
0.8989076, 1.827637, 2.135019, 0.9215686, 0, 1, 1,
0.9051417, 0.1134393, 0.4671776, 0.9254902, 0, 1, 1,
0.9134463, 1.283086, 1.699565, 0.9333333, 0, 1, 1,
0.9141378, 0.7766612, -1.402008, 0.9372549, 0, 1, 1,
0.9160297, -0.1519985, 2.771984, 0.945098, 0, 1, 1,
0.9169042, -0.2182963, 2.507687, 0.9490196, 0, 1, 1,
0.9187557, 0.9620915, 3.050086, 0.9568627, 0, 1, 1,
0.9211979, 0.1950711, -1.480008, 0.9607843, 0, 1, 1,
0.9214067, 0.1267409, 1.522021, 0.9686275, 0, 1, 1,
0.922192, 0.1796995, 1.886313, 0.972549, 0, 1, 1,
0.9256706, -0.06425974, 3.111665, 0.9803922, 0, 1, 1,
0.9292653, 1.29708, 0.4245088, 0.9843137, 0, 1, 1,
0.9334673, -2.079212, 1.43828, 0.9921569, 0, 1, 1,
0.9349049, 2.647749, -0.0315938, 0.9960784, 0, 1, 1,
0.9358884, -0.476388, 3.002496, 1, 0, 0.9960784, 1,
0.9451656, 1.090763, 1.017677, 1, 0, 0.9882353, 1,
0.9466059, -0.1785446, 2.563501, 1, 0, 0.9843137, 1,
0.9551915, 1.929274, -1.217502, 1, 0, 0.9764706, 1,
0.956884, -1.970165, 2.014298, 1, 0, 0.972549, 1,
0.9578958, -0.9225265, 3.335397, 1, 0, 0.9647059, 1,
0.9611069, 0.6109204, 1.883932, 1, 0, 0.9607843, 1,
0.969677, -1.088521, 2.666483, 1, 0, 0.9529412, 1,
0.9700323, 0.5375632, 1.011991, 1, 0, 0.9490196, 1,
0.982234, -1.221316, 3.233452, 1, 0, 0.9411765, 1,
0.982594, 1.718431, 0.4371222, 1, 0, 0.9372549, 1,
0.986132, 0.7559245, 1.697951, 1, 0, 0.9294118, 1,
0.9870121, -0.777856, 2.996894, 1, 0, 0.9254902, 1,
0.9872925, -0.6764383, 2.478161, 1, 0, 0.9176471, 1,
0.9974067, 0.1594268, 2.42876, 1, 0, 0.9137255, 1,
1.000395, 0.1497349, 2.323645, 1, 0, 0.9058824, 1,
1.00058, -1.297391, 1.886404, 1, 0, 0.9019608, 1,
1.00128, 1.464563, 0.3532263, 1, 0, 0.8941177, 1,
1.001992, 1.222316, 0.5145637, 1, 0, 0.8862745, 1,
1.004875, -0.02447768, 3.716734, 1, 0, 0.8823529, 1,
1.016139, -0.003744376, 2.679776, 1, 0, 0.8745098, 1,
1.019413, 0.1165851, 1.28081, 1, 0, 0.8705882, 1,
1.025287, 1.052363, 0.3935634, 1, 0, 0.8627451, 1,
1.029995, 1.650502, -1.306656, 1, 0, 0.8588235, 1,
1.041011, -0.3820656, 1.516156, 1, 0, 0.8509804, 1,
1.050923, 0.02997067, 3.683946, 1, 0, 0.8470588, 1,
1.066939, -1.483363, 3.965449, 1, 0, 0.8392157, 1,
1.073316, -0.6589868, 3.500485, 1, 0, 0.8352941, 1,
1.076921, 0.6137332, 0.6310865, 1, 0, 0.827451, 1,
1.077354, 1.79341, 2.592962, 1, 0, 0.8235294, 1,
1.081265, 0.8484184, 0.7401304, 1, 0, 0.8156863, 1,
1.085583, -0.4065842, 1.61791, 1, 0, 0.8117647, 1,
1.089406, -0.01487979, 2.285661, 1, 0, 0.8039216, 1,
1.093556, 1.418666, 1.954449, 1, 0, 0.7960784, 1,
1.09397, 0.4441516, 1.453423, 1, 0, 0.7921569, 1,
1.099712, 0.5117469, -0.3232212, 1, 0, 0.7843137, 1,
1.105828, 1.326533, 2.00604, 1, 0, 0.7803922, 1,
1.105844, -1.200169, 3.595067, 1, 0, 0.772549, 1,
1.106006, 0.1060133, 0.8296918, 1, 0, 0.7686275, 1,
1.108066, 1.020026, 1.15445, 1, 0, 0.7607843, 1,
1.115062, -0.4722624, 1.696754, 1, 0, 0.7568628, 1,
1.117094, -0.1133095, 3.667585, 1, 0, 0.7490196, 1,
1.118883, -1.69431, 2.222921, 1, 0, 0.7450981, 1,
1.121093, -1.347293, 4.166946, 1, 0, 0.7372549, 1,
1.124829, 0.0063609, 0.3644125, 1, 0, 0.7333333, 1,
1.126757, -1.194954, 3.452152, 1, 0, 0.7254902, 1,
1.132814, -2.045129, 2.780914, 1, 0, 0.7215686, 1,
1.134856, 0.2498227, 1.460725, 1, 0, 0.7137255, 1,
1.139615, 2.946417, 0.3255628, 1, 0, 0.7098039, 1,
1.140572, 0.4453436, 1.71649, 1, 0, 0.7019608, 1,
1.141348, 0.2104169, 0.7866005, 1, 0, 0.6941177, 1,
1.141864, 0.5428663, 0.6587924, 1, 0, 0.6901961, 1,
1.147933, -0.3609605, 2.691269, 1, 0, 0.682353, 1,
1.14874, -1.376104, 2.29688, 1, 0, 0.6784314, 1,
1.151387, 0.5266172, 1.609712, 1, 0, 0.6705883, 1,
1.154516, -1.132275, 2.562087, 1, 0, 0.6666667, 1,
1.162757, 0.228117, 2.403281, 1, 0, 0.6588235, 1,
1.167787, 0.7692155, 0.1720211, 1, 0, 0.654902, 1,
1.189692, 0.3327944, 0.3107195, 1, 0, 0.6470588, 1,
1.207124, -1.91959, 3.061454, 1, 0, 0.6431373, 1,
1.226193, 0.9709348, 0.4144798, 1, 0, 0.6352941, 1,
1.228711, -0.3598686, 1.074447, 1, 0, 0.6313726, 1,
1.229835, -2.332664, 4.497091, 1, 0, 0.6235294, 1,
1.23142, 0.6437933, 2.566056, 1, 0, 0.6196079, 1,
1.231847, 0.9925861, 1.368448, 1, 0, 0.6117647, 1,
1.245129, 0.1003756, 0.9728428, 1, 0, 0.6078432, 1,
1.245762, -0.424222, 3.072998, 1, 0, 0.6, 1,
1.249739, -1.059294, 2.828469, 1, 0, 0.5921569, 1,
1.250029, 1.142341, 0.5249625, 1, 0, 0.5882353, 1,
1.254557, 0.05118272, -0.4960131, 1, 0, 0.5803922, 1,
1.257797, -1.047749, 2.839777, 1, 0, 0.5764706, 1,
1.257994, 0.441431, 0.7109197, 1, 0, 0.5686275, 1,
1.26037, -1.114132, 3.727736, 1, 0, 0.5647059, 1,
1.266863, 0.001673255, 3.036222, 1, 0, 0.5568628, 1,
1.266967, 1.358634, 1.252854, 1, 0, 0.5529412, 1,
1.275101, 0.5341604, 1.221123, 1, 0, 0.5450981, 1,
1.275379, -0.6442891, 0.5567448, 1, 0, 0.5411765, 1,
1.276076, 1.081893, 0.8408509, 1, 0, 0.5333334, 1,
1.285676, 0.1405748, 0.2788432, 1, 0, 0.5294118, 1,
1.286878, 1.295568, 1.541983, 1, 0, 0.5215687, 1,
1.290297, 0.803579, 0.08524397, 1, 0, 0.5176471, 1,
1.298558, 0.5790246, 0.429523, 1, 0, 0.509804, 1,
1.299925, 0.5795868, 0.2532251, 1, 0, 0.5058824, 1,
1.304152, -0.09887636, -0.4570775, 1, 0, 0.4980392, 1,
1.310734, -1.077884, 3.55064, 1, 0, 0.4901961, 1,
1.328856, 0.4689455, 1.215929, 1, 0, 0.4862745, 1,
1.333313, 0.4842592, 1.868794, 1, 0, 0.4784314, 1,
1.358997, 0.193367, 2.03861, 1, 0, 0.4745098, 1,
1.368592, 0.1210777, 0.5805198, 1, 0, 0.4666667, 1,
1.370209, 1.207439, 0.6891841, 1, 0, 0.4627451, 1,
1.374504, -0.09501292, 0.8133407, 1, 0, 0.454902, 1,
1.374779, 1.20924, 2.436154, 1, 0, 0.4509804, 1,
1.378505, 0.1810647, 1.402276, 1, 0, 0.4431373, 1,
1.393914, -1.15468, 2.621738, 1, 0, 0.4392157, 1,
1.395525, -0.6687381, 2.373946, 1, 0, 0.4313726, 1,
1.403329, -1.641245, 2.725546, 1, 0, 0.427451, 1,
1.423571, 1.89677, 0.8556688, 1, 0, 0.4196078, 1,
1.433121, 1.157158, 1.915823, 1, 0, 0.4156863, 1,
1.43508, 1.948701, 1.271587, 1, 0, 0.4078431, 1,
1.440584, 0.7058125, 1.213782, 1, 0, 0.4039216, 1,
1.444925, 0.9080994, 1.113298, 1, 0, 0.3960784, 1,
1.447873, 0.2357075, 1.541677, 1, 0, 0.3882353, 1,
1.451486, -0.3033956, 0.640791, 1, 0, 0.3843137, 1,
1.456706, -0.3767836, 0.8264682, 1, 0, 0.3764706, 1,
1.464402, 0.647882, 2.224549, 1, 0, 0.372549, 1,
1.464549, 0.9225835, 0.09261513, 1, 0, 0.3647059, 1,
1.487612, -0.3156973, 2.066739, 1, 0, 0.3607843, 1,
1.506836, 0.3048276, 3.76981, 1, 0, 0.3529412, 1,
1.507632, -1.077954, 3.346812, 1, 0, 0.3490196, 1,
1.523725, 0.1568907, 1.539553, 1, 0, 0.3411765, 1,
1.538854, 0.5062892, 0.7939783, 1, 0, 0.3372549, 1,
1.568492, -0.997973, 1.988409, 1, 0, 0.3294118, 1,
1.580702, 0.4581104, 1.444815, 1, 0, 0.3254902, 1,
1.594563, 0.6524267, 1.590824, 1, 0, 0.3176471, 1,
1.595162, -0.1233395, 1.851992, 1, 0, 0.3137255, 1,
1.603823, -0.06358901, 1.345113, 1, 0, 0.3058824, 1,
1.609369, 0.4223823, 1.460446, 1, 0, 0.2980392, 1,
1.624485, -0.08799459, 3.013952, 1, 0, 0.2941177, 1,
1.634579, -0.3374407, 1.191303, 1, 0, 0.2862745, 1,
1.641051, -1.053079, -0.4228341, 1, 0, 0.282353, 1,
1.641302, -0.7302903, 1.989993, 1, 0, 0.2745098, 1,
1.661312, 0.27015, 1.118028, 1, 0, 0.2705882, 1,
1.676307, -0.2665809, 1.092305, 1, 0, 0.2627451, 1,
1.698668, 0.5624418, 1.301366, 1, 0, 0.2588235, 1,
1.700435, -1.801211, 2.115737, 1, 0, 0.2509804, 1,
1.713713, 1.630425, 1.054982, 1, 0, 0.2470588, 1,
1.717198, 2.09245, 2.722638, 1, 0, 0.2392157, 1,
1.719439, 1.630126, 0.8089954, 1, 0, 0.2352941, 1,
1.724414, -0.4045824, 0.7962507, 1, 0, 0.227451, 1,
1.737704, -0.01617129, 0.9719244, 1, 0, 0.2235294, 1,
1.764402, 0.3193433, 1.102524, 1, 0, 0.2156863, 1,
1.765341, 2.25864, -0.06056927, 1, 0, 0.2117647, 1,
1.775469, -0.03884434, 2.248844, 1, 0, 0.2039216, 1,
1.777278, 0.2452136, 0.3605524, 1, 0, 0.1960784, 1,
1.777647, 0.2779557, 2.150311, 1, 0, 0.1921569, 1,
1.788943, -1.313102, 1.847505, 1, 0, 0.1843137, 1,
1.792581, 0.3460515, 0.5757791, 1, 0, 0.1803922, 1,
1.824906, 0.3703617, -0.4706889, 1, 0, 0.172549, 1,
1.830998, -1.127615, -0.128166, 1, 0, 0.1686275, 1,
1.896109, -0.9128278, 1.048944, 1, 0, 0.1607843, 1,
1.900492, 0.1393788, 2.453846, 1, 0, 0.1568628, 1,
1.90324, -1.182185, 1.594503, 1, 0, 0.1490196, 1,
1.907867, -0.3111839, 3.787056, 1, 0, 0.145098, 1,
1.916285, 1.533243, 3.094725, 1, 0, 0.1372549, 1,
1.918145, 0.3122875, 1.323911, 1, 0, 0.1333333, 1,
1.91934, 1.005675, 0.8423145, 1, 0, 0.1254902, 1,
1.953441, 1.432317, 2.161617, 1, 0, 0.1215686, 1,
1.960479, -1.731082, 4.065497, 1, 0, 0.1137255, 1,
1.962696, 0.9519407, 0.2989179, 1, 0, 0.1098039, 1,
1.974992, -0.7444829, 1.517981, 1, 0, 0.1019608, 1,
2.010123, -0.9592671, 2.015177, 1, 0, 0.09411765, 1,
2.010135, -0.4264127, 2.710086, 1, 0, 0.09019608, 1,
2.027789, 0.3493634, 4.34387, 1, 0, 0.08235294, 1,
2.094863, -0.3738472, 1.196217, 1, 0, 0.07843138, 1,
2.145549, -0.5438761, 2.157716, 1, 0, 0.07058824, 1,
2.16041, 0.6084524, 2.207492, 1, 0, 0.06666667, 1,
2.164875, -1.319345, 2.181144, 1, 0, 0.05882353, 1,
2.28159, 1.089696, 0.01811515, 1, 0, 0.05490196, 1,
2.329811, 0.6722759, -0.6684767, 1, 0, 0.04705882, 1,
2.375034, -0.6765928, 3.752273, 1, 0, 0.04313726, 1,
2.447756, -0.1837845, 1.348514, 1, 0, 0.03529412, 1,
2.52917, 1.979031, 0.4811691, 1, 0, 0.03137255, 1,
2.767954, 0.8407786, 0.6883646, 1, 0, 0.02352941, 1,
2.776773, -0.8377497, 3.630968, 1, 0, 0.01960784, 1,
3.009643, 0.9437777, -0.03460754, 1, 0, 0.01176471, 1,
3.139848, -1.088879, 1.790648, 1, 0, 0.007843138, 1
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
-0.1606994, -4.353892, -7.524359, 0, -0.5, 0.5, 0.5,
-0.1606994, -4.353892, -7.524359, 1, -0.5, 0.5, 0.5,
-0.1606994, -4.353892, -7.524359, 1, 1.5, 0.5, 0.5,
-0.1606994, -4.353892, -7.524359, 0, 1.5, 0.5, 0.5
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
-4.580132, -0.1747072, -7.524359, 0, -0.5, 0.5, 0.5,
-4.580132, -0.1747072, -7.524359, 1, -0.5, 0.5, 0.5,
-4.580132, -0.1747072, -7.524359, 1, 1.5, 0.5, 0.5,
-4.580132, -0.1747072, -7.524359, 0, 1.5, 0.5, 0.5
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
-4.580132, -4.353892, -0.09508586, 0, -0.5, 0.5, 0.5,
-4.580132, -4.353892, -0.09508586, 1, -0.5, 0.5, 0.5,
-4.580132, -4.353892, -0.09508586, 1, 1.5, 0.5, 0.5,
-4.580132, -4.353892, -0.09508586, 0, 1.5, 0.5, 0.5
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
-3, -3.389465, -5.809911,
3, -3.389465, -5.809911,
-3, -3.389465, -5.809911,
-3, -3.550203, -6.095652,
-2, -3.389465, -5.809911,
-2, -3.550203, -6.095652,
-1, -3.389465, -5.809911,
-1, -3.550203, -6.095652,
0, -3.389465, -5.809911,
0, -3.550203, -6.095652,
1, -3.389465, -5.809911,
1, -3.550203, -6.095652,
2, -3.389465, -5.809911,
2, -3.550203, -6.095652,
3, -3.389465, -5.809911,
3, -3.550203, -6.095652
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
-3, -3.871679, -6.667135, 0, -0.5, 0.5, 0.5,
-3, -3.871679, -6.667135, 1, -0.5, 0.5, 0.5,
-3, -3.871679, -6.667135, 1, 1.5, 0.5, 0.5,
-3, -3.871679, -6.667135, 0, 1.5, 0.5, 0.5,
-2, -3.871679, -6.667135, 0, -0.5, 0.5, 0.5,
-2, -3.871679, -6.667135, 1, -0.5, 0.5, 0.5,
-2, -3.871679, -6.667135, 1, 1.5, 0.5, 0.5,
-2, -3.871679, -6.667135, 0, 1.5, 0.5, 0.5,
-1, -3.871679, -6.667135, 0, -0.5, 0.5, 0.5,
-1, -3.871679, -6.667135, 1, -0.5, 0.5, 0.5,
-1, -3.871679, -6.667135, 1, 1.5, 0.5, 0.5,
-1, -3.871679, -6.667135, 0, 1.5, 0.5, 0.5,
0, -3.871679, -6.667135, 0, -0.5, 0.5, 0.5,
0, -3.871679, -6.667135, 1, -0.5, 0.5, 0.5,
0, -3.871679, -6.667135, 1, 1.5, 0.5, 0.5,
0, -3.871679, -6.667135, 0, 1.5, 0.5, 0.5,
1, -3.871679, -6.667135, 0, -0.5, 0.5, 0.5,
1, -3.871679, -6.667135, 1, -0.5, 0.5, 0.5,
1, -3.871679, -6.667135, 1, 1.5, 0.5, 0.5,
1, -3.871679, -6.667135, 0, 1.5, 0.5, 0.5,
2, -3.871679, -6.667135, 0, -0.5, 0.5, 0.5,
2, -3.871679, -6.667135, 1, -0.5, 0.5, 0.5,
2, -3.871679, -6.667135, 1, 1.5, 0.5, 0.5,
2, -3.871679, -6.667135, 0, 1.5, 0.5, 0.5,
3, -3.871679, -6.667135, 0, -0.5, 0.5, 0.5,
3, -3.871679, -6.667135, 1, -0.5, 0.5, 0.5,
3, -3.871679, -6.667135, 1, 1.5, 0.5, 0.5,
3, -3.871679, -6.667135, 0, 1.5, 0.5, 0.5
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
-3.560263, -3, -5.809911,
-3.560263, 2, -5.809911,
-3.560263, -3, -5.809911,
-3.730241, -3, -6.095652,
-3.560263, -2, -5.809911,
-3.730241, -2, -6.095652,
-3.560263, -1, -5.809911,
-3.730241, -1, -6.095652,
-3.560263, 0, -5.809911,
-3.730241, 0, -6.095652,
-3.560263, 1, -5.809911,
-3.730241, 1, -6.095652,
-3.560263, 2, -5.809911,
-3.730241, 2, -6.095652
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
-4.070198, -3, -6.667135, 0, -0.5, 0.5, 0.5,
-4.070198, -3, -6.667135, 1, -0.5, 0.5, 0.5,
-4.070198, -3, -6.667135, 1, 1.5, 0.5, 0.5,
-4.070198, -3, -6.667135, 0, 1.5, 0.5, 0.5,
-4.070198, -2, -6.667135, 0, -0.5, 0.5, 0.5,
-4.070198, -2, -6.667135, 1, -0.5, 0.5, 0.5,
-4.070198, -2, -6.667135, 1, 1.5, 0.5, 0.5,
-4.070198, -2, -6.667135, 0, 1.5, 0.5, 0.5,
-4.070198, -1, -6.667135, 0, -0.5, 0.5, 0.5,
-4.070198, -1, -6.667135, 1, -0.5, 0.5, 0.5,
-4.070198, -1, -6.667135, 1, 1.5, 0.5, 0.5,
-4.070198, -1, -6.667135, 0, 1.5, 0.5, 0.5,
-4.070198, 0, -6.667135, 0, -0.5, 0.5, 0.5,
-4.070198, 0, -6.667135, 1, -0.5, 0.5, 0.5,
-4.070198, 0, -6.667135, 1, 1.5, 0.5, 0.5,
-4.070198, 0, -6.667135, 0, 1.5, 0.5, 0.5,
-4.070198, 1, -6.667135, 0, -0.5, 0.5, 0.5,
-4.070198, 1, -6.667135, 1, -0.5, 0.5, 0.5,
-4.070198, 1, -6.667135, 1, 1.5, 0.5, 0.5,
-4.070198, 1, -6.667135, 0, 1.5, 0.5, 0.5,
-4.070198, 2, -6.667135, 0, -0.5, 0.5, 0.5,
-4.070198, 2, -6.667135, 1, -0.5, 0.5, 0.5,
-4.070198, 2, -6.667135, 1, 1.5, 0.5, 0.5,
-4.070198, 2, -6.667135, 0, 1.5, 0.5, 0.5
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
-3.560263, -3.389465, -4,
-3.560263, -3.389465, 4,
-3.560263, -3.389465, -4,
-3.730241, -3.550203, -4,
-3.560263, -3.389465, -2,
-3.730241, -3.550203, -2,
-3.560263, -3.389465, 0,
-3.730241, -3.550203, 0,
-3.560263, -3.389465, 2,
-3.730241, -3.550203, 2,
-3.560263, -3.389465, 4,
-3.730241, -3.550203, 4
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
-4.070198, -3.871679, -4, 0, -0.5, 0.5, 0.5,
-4.070198, -3.871679, -4, 1, -0.5, 0.5, 0.5,
-4.070198, -3.871679, -4, 1, 1.5, 0.5, 0.5,
-4.070198, -3.871679, -4, 0, 1.5, 0.5, 0.5,
-4.070198, -3.871679, -2, 0, -0.5, 0.5, 0.5,
-4.070198, -3.871679, -2, 1, -0.5, 0.5, 0.5,
-4.070198, -3.871679, -2, 1, 1.5, 0.5, 0.5,
-4.070198, -3.871679, -2, 0, 1.5, 0.5, 0.5,
-4.070198, -3.871679, 0, 0, -0.5, 0.5, 0.5,
-4.070198, -3.871679, 0, 1, -0.5, 0.5, 0.5,
-4.070198, -3.871679, 0, 1, 1.5, 0.5, 0.5,
-4.070198, -3.871679, 0, 0, 1.5, 0.5, 0.5,
-4.070198, -3.871679, 2, 0, -0.5, 0.5, 0.5,
-4.070198, -3.871679, 2, 1, -0.5, 0.5, 0.5,
-4.070198, -3.871679, 2, 1, 1.5, 0.5, 0.5,
-4.070198, -3.871679, 2, 0, 1.5, 0.5, 0.5,
-4.070198, -3.871679, 4, 0, -0.5, 0.5, 0.5,
-4.070198, -3.871679, 4, 1, -0.5, 0.5, 0.5,
-4.070198, -3.871679, 4, 1, 1.5, 0.5, 0.5,
-4.070198, -3.871679, 4, 0, 1.5, 0.5, 0.5
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
-3.560263, -3.389465, -5.809911,
-3.560263, 3.040051, -5.809911,
-3.560263, -3.389465, 5.61974,
-3.560263, 3.040051, 5.61974,
-3.560263, -3.389465, -5.809911,
-3.560263, -3.389465, 5.61974,
-3.560263, 3.040051, -5.809911,
-3.560263, 3.040051, 5.61974,
-3.560263, -3.389465, -5.809911,
3.238864, -3.389465, -5.809911,
-3.560263, -3.389465, 5.61974,
3.238864, -3.389465, 5.61974,
-3.560263, 3.040051, -5.809911,
3.238864, 3.040051, -5.809911,
-3.560263, 3.040051, 5.61974,
3.238864, 3.040051, 5.61974,
3.238864, -3.389465, -5.809911,
3.238864, 3.040051, -5.809911,
3.238864, -3.389465, 5.61974,
3.238864, 3.040051, 5.61974,
3.238864, -3.389465, -5.809911,
3.238864, -3.389465, 5.61974,
3.238864, 3.040051, -5.809911,
3.238864, 3.040051, 5.61974
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
var radius = 7.887812;
var distance = 35.09377;
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
mvMatrix.translate( 0.1606994, 0.1747072, 0.09508586 );
mvMatrix.scale( 1.254346, 1.326454, 0.7461695 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.09377);
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
naphthoxyacetic_acid<-read.table("naphthoxyacetic_acid.xyz", skip=1)
x<-naphthoxyacetic_acid$V2
y<-naphthoxyacetic_acid$V3
z<-naphthoxyacetic_acid$V4
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
10, 9, 2, 0, 0, 1, 1, 1,
3, 6, 1, 1, 0, 0, 1, 1,
3, 7, 1, 1, 0, 0, 1, 1,
1, 8, 1, 1, 0, 0, 1, 1,
4, 8, 1, 1, 0, 0, 1, 1,
4, 5, 1, 1, 0, 0, 1, 1,
2, 3, 1, 0, 0, 0, 1, 1,
1, 4, 1, 0, 0, 0, 1, 1,
3, 3, 1, 0, 0, 0, 1, 1,
3, 2, 1, 0, 0, 0, 1, 1,
1, 1, 1, 0, 0, 0, 1, 1,
2, 2, 1, 0, 0, 0, 1, 1,
4, 1, 1, 0, 0, 0, 1, 1,
5, 2, 1, 1, 1, 1, 1, 1,
5, 3, 1, 1, 1, 1, 1, 1,
4, 4, 1, 1, 1, 1, 1, 1,
6, 4, 1, 1, 1, 1, 1, 1,
7, 3, 1, 1, 1, 1, 1, 1,
8, 4, 1, 1, 1, 1, 1, 1,
8, 5, 1, 1, 1, 1, 1, 1,
7, 6, 1, 1, 1, 1, 1, 1,
6, 5, 1, 1, 1, 1, 1, 1,
9, 6, 1, 1, 1, 1, 1, 1
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
var radius = 8.341163;
var distance = 29.29798;
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
mvMatrix.translate( -5.5, -5, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -29.29798);
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
for (var i = 0; i < 23; i++) {
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
