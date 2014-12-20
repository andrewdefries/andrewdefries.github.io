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
-2.963031, 1.237502, -2.133755, 1, 0, 0, 1,
-2.824322, -2.311422, -3.724636, 1, 0.007843138, 0, 1,
-2.603876, 0.487216, -1.524638, 1, 0.01176471, 0, 1,
-2.590112, 0.04460255, -0.1067754, 1, 0.01960784, 0, 1,
-2.582901, 1.250601, -1.750136, 1, 0.02352941, 0, 1,
-2.567695, 0.9310796, -2.784425, 1, 0.03137255, 0, 1,
-2.52539, -0.887991, -2.730581, 1, 0.03529412, 0, 1,
-2.42213, -1.559, -1.600983, 1, 0.04313726, 0, 1,
-2.334654, -0.1696976, -0.3736541, 1, 0.04705882, 0, 1,
-2.307046, -0.185733, -1.413009, 1, 0.05490196, 0, 1,
-2.287251, -0.9846115, -3.316548, 1, 0.05882353, 0, 1,
-2.282662, -0.09629662, -0.6725891, 1, 0.06666667, 0, 1,
-2.216021, 1.913112, -0.3944065, 1, 0.07058824, 0, 1,
-2.213782, -1.999293, -4.165684, 1, 0.07843138, 0, 1,
-2.161833, 0.6058986, 0.5166516, 1, 0.08235294, 0, 1,
-2.161663, -0.2272639, -3.279512, 1, 0.09019608, 0, 1,
-2.14732, 0.7383393, -0.7717478, 1, 0.09411765, 0, 1,
-2.11581, -2.565231, -2.20523, 1, 0.1019608, 0, 1,
-2.097071, 0.09131005, -0.7820055, 1, 0.1098039, 0, 1,
-1.991257, -0.8240954, -1.184866, 1, 0.1137255, 0, 1,
-1.979645, -1.134222, -3.546702, 1, 0.1215686, 0, 1,
-1.97665, -1.252983, -2.023209, 1, 0.1254902, 0, 1,
-1.956006, 0.8897829, -0.5453115, 1, 0.1333333, 0, 1,
-1.94691, -0.1889403, -2.485877, 1, 0.1372549, 0, 1,
-1.938731, 0.02679638, -2.129338, 1, 0.145098, 0, 1,
-1.928703, -0.788385, -1.988032, 1, 0.1490196, 0, 1,
-1.903612, 0.06398063, -1.171809, 1, 0.1568628, 0, 1,
-1.90137, 0.3955571, -1.097651, 1, 0.1607843, 0, 1,
-1.881484, -0.08453331, -1.821969, 1, 0.1686275, 0, 1,
-1.879677, 0.0696383, -2.372628, 1, 0.172549, 0, 1,
-1.868735, -0.2321987, -2.495006, 1, 0.1803922, 0, 1,
-1.8672, -1.552418, -2.516325, 1, 0.1843137, 0, 1,
-1.865229, 3.094122, 0.1877173, 1, 0.1921569, 0, 1,
-1.858828, 0.9490157, 0.2439794, 1, 0.1960784, 0, 1,
-1.850417, 0.2811401, -2.882561, 1, 0.2039216, 0, 1,
-1.834502, 1.202574, -1.954613, 1, 0.2117647, 0, 1,
-1.825443, -0.8301101, -0.8098275, 1, 0.2156863, 0, 1,
-1.818243, -2.94823, -1.126147, 1, 0.2235294, 0, 1,
-1.801512, -0.2513422, -2.124286, 1, 0.227451, 0, 1,
-1.798089, -2.082497, -3.072456, 1, 0.2352941, 0, 1,
-1.786176, 1.036873, -2.58072, 1, 0.2392157, 0, 1,
-1.784848, 1.135527, -0.7218582, 1, 0.2470588, 0, 1,
-1.767953, -1.008895, -1.928469, 1, 0.2509804, 0, 1,
-1.767486, 0.5614009, -1.390049, 1, 0.2588235, 0, 1,
-1.754046, -0.7429295, -2.819944, 1, 0.2627451, 0, 1,
-1.712333, -0.6893041, -0.7202807, 1, 0.2705882, 0, 1,
-1.712206, 0.925053, 0.1716024, 1, 0.2745098, 0, 1,
-1.711449, 2.042215, -1.692, 1, 0.282353, 0, 1,
-1.700413, -0.5910271, -3.239015, 1, 0.2862745, 0, 1,
-1.700357, -0.6524737, -1.984993, 1, 0.2941177, 0, 1,
-1.70024, -1.721322, -2.072604, 1, 0.3019608, 0, 1,
-1.680268, 0.6419259, -2.987529, 1, 0.3058824, 0, 1,
-1.67973, 0.6008692, -2.053547, 1, 0.3137255, 0, 1,
-1.658185, 0.3625142, 0.2999054, 1, 0.3176471, 0, 1,
-1.656501, 1.206511, -1.213108, 1, 0.3254902, 0, 1,
-1.640934, 0.4383088, -1.208126, 1, 0.3294118, 0, 1,
-1.635314, -1.985692, -2.730391, 1, 0.3372549, 0, 1,
-1.600504, -0.2683298, -2.617903, 1, 0.3411765, 0, 1,
-1.56894, -0.7317942, -2.333069, 1, 0.3490196, 0, 1,
-1.514874, -0.9300931, -2.778934, 1, 0.3529412, 0, 1,
-1.511504, 0.1306529, -1.481168, 1, 0.3607843, 0, 1,
-1.47771, 0.163129, -2.543813, 1, 0.3647059, 0, 1,
-1.476082, 0.005919065, -3.089999, 1, 0.372549, 0, 1,
-1.465192, 1.38911, -0.6877837, 1, 0.3764706, 0, 1,
-1.457848, -1.462187, 0.1734552, 1, 0.3843137, 0, 1,
-1.455726, 0.6840197, -0.5167426, 1, 0.3882353, 0, 1,
-1.445085, 0.3314092, -2.117887, 1, 0.3960784, 0, 1,
-1.431772, 0.5589158, -1.384344, 1, 0.4039216, 0, 1,
-1.404205, 0.5660431, -2.844796, 1, 0.4078431, 0, 1,
-1.403112, 0.3024381, -2.308832, 1, 0.4156863, 0, 1,
-1.401579, -0.7502195, -1.192914, 1, 0.4196078, 0, 1,
-1.385274, -0.1200053, -1.579347, 1, 0.427451, 0, 1,
-1.378071, -0.7540742, -2.4563, 1, 0.4313726, 0, 1,
-1.378055, 0.7731661, -1.44824, 1, 0.4392157, 0, 1,
-1.371685, -0.8355902, -1.919695, 1, 0.4431373, 0, 1,
-1.366406, 1.261435, -1.354025, 1, 0.4509804, 0, 1,
-1.362148, 0.4654552, -3.343952, 1, 0.454902, 0, 1,
-1.350567, 0.01575347, -0.3981088, 1, 0.4627451, 0, 1,
-1.350456, -0.3390928, 0.04509168, 1, 0.4666667, 0, 1,
-1.3247, 1.189807, -0.8931995, 1, 0.4745098, 0, 1,
-1.308304, -0.632799, -1.899088, 1, 0.4784314, 0, 1,
-1.305128, 0.4835008, -0.8890983, 1, 0.4862745, 0, 1,
-1.297911, 0.01680612, -1.156196, 1, 0.4901961, 0, 1,
-1.287616, -2.184972, -0.6699899, 1, 0.4980392, 0, 1,
-1.287438, 0.02915068, -2.359154, 1, 0.5058824, 0, 1,
-1.285189, -0.2193396, -2.026224, 1, 0.509804, 0, 1,
-1.283156, -0.8573775, -2.147635, 1, 0.5176471, 0, 1,
-1.2827, -0.4489236, -2.849908, 1, 0.5215687, 0, 1,
-1.274147, 0.4240107, -1.282965, 1, 0.5294118, 0, 1,
-1.273795, -1.579795, -2.85898, 1, 0.5333334, 0, 1,
-1.261496, 1.498826, -0.3955526, 1, 0.5411765, 0, 1,
-1.26085, 0.9621226, -0.1909702, 1, 0.5450981, 0, 1,
-1.260559, 1.011362, 0.2604056, 1, 0.5529412, 0, 1,
-1.258012, 0.5773826, -2.169342, 1, 0.5568628, 0, 1,
-1.250307, -0.2432376, -3.056141, 1, 0.5647059, 0, 1,
-1.233149, -0.1950113, -3.416859, 1, 0.5686275, 0, 1,
-1.225994, 1.210499, -0.4983518, 1, 0.5764706, 0, 1,
-1.216305, -0.521185, -1.574808, 1, 0.5803922, 0, 1,
-1.193888, -0.135229, -2.186057, 1, 0.5882353, 0, 1,
-1.191144, 0.1300857, -3.516819, 1, 0.5921569, 0, 1,
-1.183245, 0.2004301, -1.825729, 1, 0.6, 0, 1,
-1.181967, -0.5951251, -0.970704, 1, 0.6078432, 0, 1,
-1.17638, -0.3700921, -3.263782, 1, 0.6117647, 0, 1,
-1.172522, 1.150116, -1.660921, 1, 0.6196079, 0, 1,
-1.159308, -0.1922922, -1.889676, 1, 0.6235294, 0, 1,
-1.145297, 0.1316648, -1.560611, 1, 0.6313726, 0, 1,
-1.138433, -1.791892, -3.201804, 1, 0.6352941, 0, 1,
-1.133529, -0.5239159, -2.121007, 1, 0.6431373, 0, 1,
-1.122455, -0.2205324, -1.058964, 1, 0.6470588, 0, 1,
-1.12224, 0.7444628, 0.8898556, 1, 0.654902, 0, 1,
-1.121216, 0.8600539, 0.03283123, 1, 0.6588235, 0, 1,
-1.117941, -1.128567, -0.8780071, 1, 0.6666667, 0, 1,
-1.108973, -0.3523591, -2.468696, 1, 0.6705883, 0, 1,
-1.100565, 0.1138555, -2.549496, 1, 0.6784314, 0, 1,
-1.087977, 0.6898604, -0.4288287, 1, 0.682353, 0, 1,
-1.086772, -2.071455, -1.395004, 1, 0.6901961, 0, 1,
-1.083825, 1.60582, -2.954423, 1, 0.6941177, 0, 1,
-1.072238, 0.6761018, -0.9415989, 1, 0.7019608, 0, 1,
-1.061871, -0.7139524, -1.214735, 1, 0.7098039, 0, 1,
-1.05989, -1.749172, -1.651757, 1, 0.7137255, 0, 1,
-1.058345, -1.081136, -2.86909, 1, 0.7215686, 0, 1,
-1.04465, -0.03951341, -1.200511, 1, 0.7254902, 0, 1,
-1.0438, -1.275912, -1.727744, 1, 0.7333333, 0, 1,
-1.040453, 0.4552236, 0.4446369, 1, 0.7372549, 0, 1,
-1.023782, -2.687693, -3.69336, 1, 0.7450981, 0, 1,
-1.021775, 0.4091369, 0.7653357, 1, 0.7490196, 0, 1,
-1.020815, -1.067672, -2.639575, 1, 0.7568628, 0, 1,
-1.020036, 0.302404, -1.397869, 1, 0.7607843, 0, 1,
-0.9991145, 0.2088362, -2.01851, 1, 0.7686275, 0, 1,
-0.9917326, -0.4000417, -3.241166, 1, 0.772549, 0, 1,
-0.99159, 1.272799, -2.574531, 1, 0.7803922, 0, 1,
-0.9856681, -0.8034277, -2.878987, 1, 0.7843137, 0, 1,
-0.9809732, 0.3551742, -3.425905, 1, 0.7921569, 0, 1,
-0.9775776, 0.435686, -0.3536455, 1, 0.7960784, 0, 1,
-0.9748273, 0.9447168, -1.307741, 1, 0.8039216, 0, 1,
-0.9736062, 1.368853, 0.2462411, 1, 0.8117647, 0, 1,
-0.9727267, -0.6492622, -2.136232, 1, 0.8156863, 0, 1,
-0.9721506, 1.135042, -1.143899, 1, 0.8235294, 0, 1,
-0.9663507, -0.1759641, -2.580338, 1, 0.827451, 0, 1,
-0.965549, 0.5979896, -1.070399, 1, 0.8352941, 0, 1,
-0.962104, -0.9418053, -1.606478, 1, 0.8392157, 0, 1,
-0.9591414, -0.4539489, -1.764593, 1, 0.8470588, 0, 1,
-0.9574034, -1.197269, -1.893335, 1, 0.8509804, 0, 1,
-0.953823, 0.7671753, 0.7661758, 1, 0.8588235, 0, 1,
-0.9457551, 1.454166, -1.28237, 1, 0.8627451, 0, 1,
-0.9423715, 0.5303946, -1.238336, 1, 0.8705882, 0, 1,
-0.9414964, -0.6928017, -2.339415, 1, 0.8745098, 0, 1,
-0.937898, -0.1586665, -2.162825, 1, 0.8823529, 0, 1,
-0.9371475, 0.1538003, 0.2905713, 1, 0.8862745, 0, 1,
-0.9354444, 0.6167986, -0.8641859, 1, 0.8941177, 0, 1,
-0.934404, -0.0002242178, -1.052475, 1, 0.8980392, 0, 1,
-0.9311646, 1.637201, -1.357148, 1, 0.9058824, 0, 1,
-0.9294332, 0.651163, -1.386389, 1, 0.9137255, 0, 1,
-0.9223392, 0.1517006, -3.705479, 1, 0.9176471, 0, 1,
-0.9061825, 2.081635, -1.620625, 1, 0.9254902, 0, 1,
-0.9035982, 2.038432, 1.310941, 1, 0.9294118, 0, 1,
-0.896311, -0.195074, 0.2270919, 1, 0.9372549, 0, 1,
-0.8960262, 2.01712, 0.8410542, 1, 0.9411765, 0, 1,
-0.8951355, 0.1237748, -1.293447, 1, 0.9490196, 0, 1,
-0.8939363, 0.8694483, 1.510404, 1, 0.9529412, 0, 1,
-0.8846421, -2.910768, -0.7174357, 1, 0.9607843, 0, 1,
-0.872008, 1.183329, 0.681293, 1, 0.9647059, 0, 1,
-0.8684323, 0.2211319, -1.724791, 1, 0.972549, 0, 1,
-0.8664045, 0.555365, -2.216348, 1, 0.9764706, 0, 1,
-0.8655142, -0.1346835, -2.042093, 1, 0.9843137, 0, 1,
-0.8560038, -0.1636235, -3.014255, 1, 0.9882353, 0, 1,
-0.8535204, 0.6144845, -1.926984, 1, 0.9960784, 0, 1,
-0.8506842, 0.1103721, -1.759924, 0.9960784, 1, 0, 1,
-0.8471996, 0.8495477, 1.029482, 0.9921569, 1, 0, 1,
-0.8402146, 0.01789523, -0.7242554, 0.9843137, 1, 0, 1,
-0.8394828, 1.166338, -2.741941, 0.9803922, 1, 0, 1,
-0.8345122, -0.4708358, -1.388769, 0.972549, 1, 0, 1,
-0.8338445, 0.5904347, -0.5249643, 0.9686275, 1, 0, 1,
-0.8334488, 0.06172763, -2.106018, 0.9607843, 1, 0, 1,
-0.8319634, -0.9692625, -2.94263, 0.9568627, 1, 0, 1,
-0.8305293, 0.5739893, -0.5294353, 0.9490196, 1, 0, 1,
-0.8275397, -0.423021, -3.285275, 0.945098, 1, 0, 1,
-0.8274891, 1.23553, -1.294416, 0.9372549, 1, 0, 1,
-0.8270052, 1.550736, -0.1187132, 0.9333333, 1, 0, 1,
-0.8239264, 0.7539849, -1.570501, 0.9254902, 1, 0, 1,
-0.8135735, -1.332976, -2.147034, 0.9215686, 1, 0, 1,
-0.8122038, 0.5705584, -0.2083707, 0.9137255, 1, 0, 1,
-0.8111851, -0.5499284, -3.716621, 0.9098039, 1, 0, 1,
-0.8100672, -0.9562035, -1.657612, 0.9019608, 1, 0, 1,
-0.8093476, -0.8932441, -2.656466, 0.8941177, 1, 0, 1,
-0.7984105, -0.1032568, -3.398448, 0.8901961, 1, 0, 1,
-0.7982793, 1.61742, 0.02823599, 0.8823529, 1, 0, 1,
-0.7975826, -0.899827, -2.511597, 0.8784314, 1, 0, 1,
-0.7908993, -1.331793, -2.161964, 0.8705882, 1, 0, 1,
-0.7897485, 0.9863963, -0.01105823, 0.8666667, 1, 0, 1,
-0.7871551, -0.3020244, -0.4357181, 0.8588235, 1, 0, 1,
-0.7840513, 1.882709, -0.6005328, 0.854902, 1, 0, 1,
-0.7829735, 2.239359, 0.09883792, 0.8470588, 1, 0, 1,
-0.7802398, 0.3542201, -0.4478001, 0.8431373, 1, 0, 1,
-0.7737491, 1.467416, -0.8805832, 0.8352941, 1, 0, 1,
-0.7664753, -0.1875134, -2.057392, 0.8313726, 1, 0, 1,
-0.7650536, 1.121037, 0.01197896, 0.8235294, 1, 0, 1,
-0.7621312, -1.208503, -2.364767, 0.8196079, 1, 0, 1,
-0.7591964, 0.6955981, -1.265426, 0.8117647, 1, 0, 1,
-0.7559701, 0.7396305, -1.434587, 0.8078431, 1, 0, 1,
-0.7519568, -0.1760401, -0.8925916, 0.8, 1, 0, 1,
-0.7512424, 0.6385373, -1.10165, 0.7921569, 1, 0, 1,
-0.7428453, -0.9448639, -2.722091, 0.7882353, 1, 0, 1,
-0.741681, -0.2727998, 0.5364322, 0.7803922, 1, 0, 1,
-0.741241, 1.06391, -1.686156, 0.7764706, 1, 0, 1,
-0.7364373, 0.3100512, -1.218225, 0.7686275, 1, 0, 1,
-0.7336063, 1.115316, -1.771614, 0.7647059, 1, 0, 1,
-0.7295562, -0.4130122, -0.9077529, 0.7568628, 1, 0, 1,
-0.7232473, 0.9984757, 1.264037, 0.7529412, 1, 0, 1,
-0.7209378, -0.5101189, -2.347563, 0.7450981, 1, 0, 1,
-0.7157686, 0.3504262, 0.5146466, 0.7411765, 1, 0, 1,
-0.715073, 0.870044, -1.716449, 0.7333333, 1, 0, 1,
-0.7125514, -0.2264832, -2.586771, 0.7294118, 1, 0, 1,
-0.7120662, 2.79379, -0.1044898, 0.7215686, 1, 0, 1,
-0.7082532, -0.609121, -1.583423, 0.7176471, 1, 0, 1,
-0.7063352, -0.9474701, -2.490484, 0.7098039, 1, 0, 1,
-0.7002509, -1.141281, -0.974938, 0.7058824, 1, 0, 1,
-0.6970508, 0.3394294, -1.364718, 0.6980392, 1, 0, 1,
-0.6962128, -1.423383, -4.042918, 0.6901961, 1, 0, 1,
-0.6951181, 0.3123522, -0.4641391, 0.6862745, 1, 0, 1,
-0.6949601, 0.03414302, -1.215972, 0.6784314, 1, 0, 1,
-0.6915096, 0.1444724, 0.05551545, 0.6745098, 1, 0, 1,
-0.6884974, 1.331471, -0.01184707, 0.6666667, 1, 0, 1,
-0.6784052, 0.9832472, -0.7565351, 0.6627451, 1, 0, 1,
-0.6780679, 0.1020242, -1.17435, 0.654902, 1, 0, 1,
-0.6728125, 0.2029142, 0.3567338, 0.6509804, 1, 0, 1,
-0.6705345, 0.1454227, -0.5089174, 0.6431373, 1, 0, 1,
-0.6693403, 0.8518847, -1.042225, 0.6392157, 1, 0, 1,
-0.6675485, -0.08675594, -2.063533, 0.6313726, 1, 0, 1,
-0.6674569, 1.63078, -1.052158, 0.627451, 1, 0, 1,
-0.6627758, -0.7368466, -1.864672, 0.6196079, 1, 0, 1,
-0.6497482, 0.01510658, -1.591254, 0.6156863, 1, 0, 1,
-0.6437739, 0.5911922, -0.5678692, 0.6078432, 1, 0, 1,
-0.640601, 0.1442114, -1.513313, 0.6039216, 1, 0, 1,
-0.6380863, 0.664518, -1.928433, 0.5960785, 1, 0, 1,
-0.6366752, -2.137628, -2.563781, 0.5882353, 1, 0, 1,
-0.6341878, 0.1340158, 0.2111859, 0.5843138, 1, 0, 1,
-0.6325799, -0.4127934, -3.429894, 0.5764706, 1, 0, 1,
-0.6314604, -0.1032352, -1.901179, 0.572549, 1, 0, 1,
-0.6258077, -0.6384305, -2.432162, 0.5647059, 1, 0, 1,
-0.6242185, 0.1384553, -2.001179, 0.5607843, 1, 0, 1,
-0.6241103, 1.007647, -0.796643, 0.5529412, 1, 0, 1,
-0.6227458, -0.05046348, -1.510697, 0.5490196, 1, 0, 1,
-0.6191407, -1.075591, -2.91763, 0.5411765, 1, 0, 1,
-0.6167709, 1.796636, 0.889222, 0.5372549, 1, 0, 1,
-0.6160967, 0.2668611, -1.868976, 0.5294118, 1, 0, 1,
-0.6150164, 0.7185609, 0.233135, 0.5254902, 1, 0, 1,
-0.5996374, 0.0322046, -1.260886, 0.5176471, 1, 0, 1,
-0.586466, 0.2653599, -1.755638, 0.5137255, 1, 0, 1,
-0.5838682, 1.301432, -1.663327, 0.5058824, 1, 0, 1,
-0.5835137, -1.232179, -2.101746, 0.5019608, 1, 0, 1,
-0.5789502, 0.5629701, -1.920245, 0.4941176, 1, 0, 1,
-0.5745192, 0.003313996, -0.6160229, 0.4862745, 1, 0, 1,
-0.5722387, 0.006936766, -0.2779905, 0.4823529, 1, 0, 1,
-0.5717741, 2.625323, 0.1486321, 0.4745098, 1, 0, 1,
-0.5713581, 0.8407949, -1.059818, 0.4705882, 1, 0, 1,
-0.5685155, 1.005129, 0.1418509, 0.4627451, 1, 0, 1,
-0.5637732, -0.1156651, -3.0376, 0.4588235, 1, 0, 1,
-0.5632625, -0.1657958, -3.320305, 0.4509804, 1, 0, 1,
-0.5572304, 0.8682128, 0.06928551, 0.4470588, 1, 0, 1,
-0.5557583, -2.060114, -2.875568, 0.4392157, 1, 0, 1,
-0.5502716, -1.18082, -4.221398, 0.4352941, 1, 0, 1,
-0.5448866, 1.662918, 0.18845, 0.427451, 1, 0, 1,
-0.5430266, -0.5386485, -2.19735, 0.4235294, 1, 0, 1,
-0.5429284, -2.267998, -1.973225, 0.4156863, 1, 0, 1,
-0.5396048, -1.780962, -4.644073, 0.4117647, 1, 0, 1,
-0.5380513, 0.2825157, -2.342003, 0.4039216, 1, 0, 1,
-0.5314448, 0.3697909, -0.7638006, 0.3960784, 1, 0, 1,
-0.5303779, 0.8175406, 0.8421084, 0.3921569, 1, 0, 1,
-0.5288271, -0.8814994, -2.604642, 0.3843137, 1, 0, 1,
-0.5198784, 0.8075113, -0.9289762, 0.3803922, 1, 0, 1,
-0.51908, -0.2688596, -2.741604, 0.372549, 1, 0, 1,
-0.5158121, -0.3203821, -0.8635727, 0.3686275, 1, 0, 1,
-0.5121073, 0.2005007, -0.4531451, 0.3607843, 1, 0, 1,
-0.5111916, -2.606773, -2.132865, 0.3568628, 1, 0, 1,
-0.5094088, 0.6057525, -1.451114, 0.3490196, 1, 0, 1,
-0.5090235, -0.5344215, -2.445853, 0.345098, 1, 0, 1,
-0.5022582, -0.2601646, -2.051109, 0.3372549, 1, 0, 1,
-0.5017589, 0.03952597, -1.673614, 0.3333333, 1, 0, 1,
-0.4995216, -0.559962, -4.66982, 0.3254902, 1, 0, 1,
-0.498307, -0.1895199, -1.062346, 0.3215686, 1, 0, 1,
-0.4951288, -1.114238, -0.8411674, 0.3137255, 1, 0, 1,
-0.4909678, -0.02607675, -2.198536, 0.3098039, 1, 0, 1,
-0.4893221, 0.5374387, -1.209158, 0.3019608, 1, 0, 1,
-0.4883486, -1.944741, -4.567013, 0.2941177, 1, 0, 1,
-0.4883432, 0.3006115, -0.08729219, 0.2901961, 1, 0, 1,
-0.4867384, 0.1009574, -3.542526, 0.282353, 1, 0, 1,
-0.4857261, 0.209257, -1.275106, 0.2784314, 1, 0, 1,
-0.4840042, 0.0990466, -1.499311, 0.2705882, 1, 0, 1,
-0.4837488, 0.3460625, -0.8686665, 0.2666667, 1, 0, 1,
-0.4769076, 1.162784, -0.6239703, 0.2588235, 1, 0, 1,
-0.4734257, 0.6781554, -2.404296, 0.254902, 1, 0, 1,
-0.4721251, 0.3324271, 1.236653, 0.2470588, 1, 0, 1,
-0.4689975, 0.4246629, -2.192016, 0.2431373, 1, 0, 1,
-0.4649266, 0.557788, 1.219312, 0.2352941, 1, 0, 1,
-0.462106, 1.888157, 0.1631212, 0.2313726, 1, 0, 1,
-0.4613675, -1.443829, -2.682758, 0.2235294, 1, 0, 1,
-0.4582403, -0.6227341, -0.1979136, 0.2196078, 1, 0, 1,
-0.4565195, -0.2446154, -2.583488, 0.2117647, 1, 0, 1,
-0.4545706, -0.4660565, -2.404325, 0.2078431, 1, 0, 1,
-0.4529021, 1.085124, -1.645873, 0.2, 1, 0, 1,
-0.452407, 0.7093341, -0.0226459, 0.1921569, 1, 0, 1,
-0.4471821, -0.2334302, -0.876087, 0.1882353, 1, 0, 1,
-0.4471801, 0.2131986, -2.555537, 0.1803922, 1, 0, 1,
-0.4416724, 0.2973067, -0.7442861, 0.1764706, 1, 0, 1,
-0.4303409, -1.823903, -2.871511, 0.1686275, 1, 0, 1,
-0.4247755, 2.367402, -0.432368, 0.1647059, 1, 0, 1,
-0.421101, -0.2734601, -1.093108, 0.1568628, 1, 0, 1,
-0.4170741, 0.3418684, 1.274817, 0.1529412, 1, 0, 1,
-0.4161597, 0.6626069, -0.2571444, 0.145098, 1, 0, 1,
-0.412235, -0.5451954, -1.714537, 0.1411765, 1, 0, 1,
-0.4115057, -0.8449597, -1.962436, 0.1333333, 1, 0, 1,
-0.4081712, -0.5690348, -0.6338101, 0.1294118, 1, 0, 1,
-0.4049582, 0.46837, 0.2260777, 0.1215686, 1, 0, 1,
-0.4029979, 0.8457834, -1.769935, 0.1176471, 1, 0, 1,
-0.4016157, -0.01533768, -2.84717, 0.1098039, 1, 0, 1,
-0.3982096, 1.439834, -1.010618, 0.1058824, 1, 0, 1,
-0.3977131, 0.8225913, 0.5300167, 0.09803922, 1, 0, 1,
-0.3941701, -0.9924687, -2.049459, 0.09019608, 1, 0, 1,
-0.3932897, -0.9222616, -1.190251, 0.08627451, 1, 0, 1,
-0.3930688, -0.2297132, -1.057712, 0.07843138, 1, 0, 1,
-0.3930198, -0.256094, -3.097769, 0.07450981, 1, 0, 1,
-0.3913365, -0.4377703, -2.909335, 0.06666667, 1, 0, 1,
-0.3876173, 0.2567335, -2.761215, 0.0627451, 1, 0, 1,
-0.3876072, 1.015378, 1.374224, 0.05490196, 1, 0, 1,
-0.3842697, 0.6787634, 0.8452531, 0.05098039, 1, 0, 1,
-0.3807299, 0.3317741, -1.605445, 0.04313726, 1, 0, 1,
-0.3779043, -1.052479, -1.642611, 0.03921569, 1, 0, 1,
-0.3752295, -0.2786202, -0.9571861, 0.03137255, 1, 0, 1,
-0.3750075, 0.3982029, 0.1164048, 0.02745098, 1, 0, 1,
-0.3731485, 2.803179, -0.7168514, 0.01960784, 1, 0, 1,
-0.372878, 1.225753, -0.5915129, 0.01568628, 1, 0, 1,
-0.3724339, 0.8062271, -0.1863304, 0.007843138, 1, 0, 1,
-0.3680531, -0.230894, -2.56408, 0.003921569, 1, 0, 1,
-0.3654709, 0.8982207, -1.238104, 0, 1, 0.003921569, 1,
-0.3650827, 0.5339099, -0.08652954, 0, 1, 0.01176471, 1,
-0.3650065, -0.4240323, -1.51436, 0, 1, 0.01568628, 1,
-0.3618236, -0.1357842, -1.825644, 0, 1, 0.02352941, 1,
-0.3575477, -1.668852, -1.934519, 0, 1, 0.02745098, 1,
-0.3483006, 1.674904, -1.109383, 0, 1, 0.03529412, 1,
-0.3435771, 0.04382697, -3.238766, 0, 1, 0.03921569, 1,
-0.3395594, -0.8485814, -2.998807, 0, 1, 0.04705882, 1,
-0.3347141, 1.0162, 0.1483741, 0, 1, 0.05098039, 1,
-0.332696, 1.366788, -0.8920321, 0, 1, 0.05882353, 1,
-0.3299526, 0.5598687, 0.575612, 0, 1, 0.0627451, 1,
-0.3290392, -1.902219, -3.840407, 0, 1, 0.07058824, 1,
-0.3245509, -0.3298026, -3.348033, 0, 1, 0.07450981, 1,
-0.3200493, 0.4428584, -0.9252968, 0, 1, 0.08235294, 1,
-0.3185235, -0.2417104, -0.6152993, 0, 1, 0.08627451, 1,
-0.3144732, -0.09645323, -2.797274, 0, 1, 0.09411765, 1,
-0.3139369, 1.505832, 0.5524418, 0, 1, 0.1019608, 1,
-0.3132745, 0.2737678, -1.32402, 0, 1, 0.1058824, 1,
-0.3130748, -1.514546, -2.681222, 0, 1, 0.1137255, 1,
-0.3118421, -1.965789, -4.973987, 0, 1, 0.1176471, 1,
-0.3106017, 0.8349835, 1.241126, 0, 1, 0.1254902, 1,
-0.3093031, -1.06167, -3.152857, 0, 1, 0.1294118, 1,
-0.3072658, 0.9120107, -0.3177392, 0, 1, 0.1372549, 1,
-0.3046561, -0.03838033, -1.597926, 0, 1, 0.1411765, 1,
-0.3028289, 0.6947607, -2.199491, 0, 1, 0.1490196, 1,
-0.3023778, -0.2697452, -2.20463, 0, 1, 0.1529412, 1,
-0.301324, 1.150587, -1.261783, 0, 1, 0.1607843, 1,
-0.2985039, 0.8487874, 0.6118915, 0, 1, 0.1647059, 1,
-0.2956239, -2.473996, -4.105582, 0, 1, 0.172549, 1,
-0.2920847, -0.6390158, -1.942336, 0, 1, 0.1764706, 1,
-0.2905773, -1.138513, -4.187296, 0, 1, 0.1843137, 1,
-0.2872317, 0.02229928, -2.381464, 0, 1, 0.1882353, 1,
-0.2863922, -1.34131, -1.86828, 0, 1, 0.1960784, 1,
-0.2863881, 0.1932098, 0.002509928, 0, 1, 0.2039216, 1,
-0.278612, 0.4155851, -0.6733528, 0, 1, 0.2078431, 1,
-0.2785296, -0.7167039, -0.9403076, 0, 1, 0.2156863, 1,
-0.2773894, 0.2926759, 0.5013053, 0, 1, 0.2196078, 1,
-0.2773019, -0.5665092, -2.268481, 0, 1, 0.227451, 1,
-0.2768036, -2.719983, -3.710695, 0, 1, 0.2313726, 1,
-0.2764115, -1.858782, -2.512357, 0, 1, 0.2392157, 1,
-0.2749538, -0.6989958, -2.793723, 0, 1, 0.2431373, 1,
-0.2730979, 0.1790073, -2.036857, 0, 1, 0.2509804, 1,
-0.2701879, 1.191223, 1.507404, 0, 1, 0.254902, 1,
-0.2603626, -0.06659111, -0.933158, 0, 1, 0.2627451, 1,
-0.2570842, 1.641987, -0.2650046, 0, 1, 0.2666667, 1,
-0.2552761, -0.8651709, -4.217457, 0, 1, 0.2745098, 1,
-0.2509693, -0.7177846, -4.731736, 0, 1, 0.2784314, 1,
-0.2488388, -0.7017733, -2.400577, 0, 1, 0.2862745, 1,
-0.2473426, 1.154335, 1.017595, 0, 1, 0.2901961, 1,
-0.2468457, -0.902528, -4.188697, 0, 1, 0.2980392, 1,
-0.2453802, -0.4738226, -2.039817, 0, 1, 0.3058824, 1,
-0.2452184, 2.003354, -1.103849, 0, 1, 0.3098039, 1,
-0.2420621, 2.054316, -0.8362831, 0, 1, 0.3176471, 1,
-0.2419373, 0.3864057, -2.072724, 0, 1, 0.3215686, 1,
-0.2398802, 0.5792666, -1.533559, 0, 1, 0.3294118, 1,
-0.2388342, 1.198898, -0.9514912, 0, 1, 0.3333333, 1,
-0.2365498, -0.6844969, -3.357453, 0, 1, 0.3411765, 1,
-0.2350332, -0.785341, -2.509019, 0, 1, 0.345098, 1,
-0.2303992, -0.2350868, -0.986663, 0, 1, 0.3529412, 1,
-0.2216296, 0.757359, 0.6310226, 0, 1, 0.3568628, 1,
-0.2201202, 0.5351, -2.180363, 0, 1, 0.3647059, 1,
-0.2194425, -0.6224924, -1.524184, 0, 1, 0.3686275, 1,
-0.2170793, 1.786483, -0.1967752, 0, 1, 0.3764706, 1,
-0.2148871, -0.9227543, -2.032784, 0, 1, 0.3803922, 1,
-0.2135277, -0.6084082, -2.772312, 0, 1, 0.3882353, 1,
-0.2128362, -0.1426922, -1.626282, 0, 1, 0.3921569, 1,
-0.2120829, -0.08148278, -0.02252515, 0, 1, 0.4, 1,
-0.2087776, 1.078967, -1.676082, 0, 1, 0.4078431, 1,
-0.2046038, -0.7017264, -1.604263, 0, 1, 0.4117647, 1,
-0.2000981, -1.043386, -2.227312, 0, 1, 0.4196078, 1,
-0.1998721, -0.03372781, -1.987057, 0, 1, 0.4235294, 1,
-0.1973767, -0.2470084, -3.042327, 0, 1, 0.4313726, 1,
-0.1965196, 0.9873148, -0.06291128, 0, 1, 0.4352941, 1,
-0.1936331, -0.2013603, -1.925255, 0, 1, 0.4431373, 1,
-0.1886788, 0.4010496, -0.5466465, 0, 1, 0.4470588, 1,
-0.1878405, -0.7025934, -3.95974, 0, 1, 0.454902, 1,
-0.1855986, 0.627938, 0.4412094, 0, 1, 0.4588235, 1,
-0.1841137, 0.373876, -0.1626956, 0, 1, 0.4666667, 1,
-0.179324, 0.3112674, -0.5206, 0, 1, 0.4705882, 1,
-0.179284, 0.6548989, -0.7361076, 0, 1, 0.4784314, 1,
-0.1786077, 1.166304, -0.8901796, 0, 1, 0.4823529, 1,
-0.1774448, -0.3379979, -3.053256, 0, 1, 0.4901961, 1,
-0.1686565, -0.7995408, -2.604583, 0, 1, 0.4941176, 1,
-0.16709, -0.2202349, -1.639999, 0, 1, 0.5019608, 1,
-0.1641512, 0.01885471, -1.175987, 0, 1, 0.509804, 1,
-0.1637601, 1.287135, 0.4881325, 0, 1, 0.5137255, 1,
-0.1594795, 1.117991, -1.058883, 0, 1, 0.5215687, 1,
-0.1563831, -2.29688, -3.079411, 0, 1, 0.5254902, 1,
-0.1527651, -0.4956055, -3.110734, 0, 1, 0.5333334, 1,
-0.1500533, -0.08358338, -2.622788, 0, 1, 0.5372549, 1,
-0.1469765, 0.0616692, -0.5232021, 0, 1, 0.5450981, 1,
-0.1466269, -0.6910935, -2.450621, 0, 1, 0.5490196, 1,
-0.1460202, -0.556961, -2.620921, 0, 1, 0.5568628, 1,
-0.1436501, 1.914202, -1.271304, 0, 1, 0.5607843, 1,
-0.1430081, 0.1371923, -0.4047202, 0, 1, 0.5686275, 1,
-0.1414002, 1.281808, -1.182045, 0, 1, 0.572549, 1,
-0.1374012, -0.7255179, -1.821018, 0, 1, 0.5803922, 1,
-0.1285111, 2.312304, -0.9100679, 0, 1, 0.5843138, 1,
-0.1261699, 0.5514796, -1.570939, 0, 1, 0.5921569, 1,
-0.1260309, -0.4297131, -2.231747, 0, 1, 0.5960785, 1,
-0.1253336, -1.522391, -3.273931, 0, 1, 0.6039216, 1,
-0.1248206, -0.01717318, -2.011231, 0, 1, 0.6117647, 1,
-0.1241986, 0.9327376, 1.656136, 0, 1, 0.6156863, 1,
-0.1232779, 0.06660452, -1.601036, 0, 1, 0.6235294, 1,
-0.1154769, -0.2507071, -3.82256, 0, 1, 0.627451, 1,
-0.113284, 0.5493284, 0.8396801, 0, 1, 0.6352941, 1,
-0.1121073, 0.6212912, 0.6320223, 0, 1, 0.6392157, 1,
-0.1114493, -0.649334, -1.669961, 0, 1, 0.6470588, 1,
-0.1108883, 0.8325098, 0.210244, 0, 1, 0.6509804, 1,
-0.1071367, -0.08600235, -1.444798, 0, 1, 0.6588235, 1,
-0.1042185, -0.5751169, -2.979843, 0, 1, 0.6627451, 1,
-0.10267, 0.4197691, 1.204169, 0, 1, 0.6705883, 1,
-0.1025559, 0.9464794, 0.3969871, 0, 1, 0.6745098, 1,
-0.1001871, 0.1397636, -2.232842, 0, 1, 0.682353, 1,
-0.09248534, 0.3928151, -0.6716983, 0, 1, 0.6862745, 1,
-0.09227008, 0.4250664, -0.1298149, 0, 1, 0.6941177, 1,
-0.09219627, 0.9627298, -0.9614764, 0, 1, 0.7019608, 1,
-0.08890897, 1.257971, -0.5804896, 0, 1, 0.7058824, 1,
-0.0843718, -0.3744318, -3.96736, 0, 1, 0.7137255, 1,
-0.08163659, 0.150475, -0.4962236, 0, 1, 0.7176471, 1,
-0.07751314, 0.4262092, -0.650135, 0, 1, 0.7254902, 1,
-0.07710008, 0.8933711, -0.2881606, 0, 1, 0.7294118, 1,
-0.07609305, 0.3833684, -0.8231115, 0, 1, 0.7372549, 1,
-0.07189489, 0.08472726, -1.958965, 0, 1, 0.7411765, 1,
-0.07070597, -1.023729, -3.39713, 0, 1, 0.7490196, 1,
-0.06925623, -0.6085255, -3.305687, 0, 1, 0.7529412, 1,
-0.06844484, 2.083221, 0.2128941, 0, 1, 0.7607843, 1,
-0.06651061, -0.4265202, -1.976257, 0, 1, 0.7647059, 1,
-0.06582803, -0.6372783, -4.28219, 0, 1, 0.772549, 1,
-0.05971425, -0.3387894, -2.389338, 0, 1, 0.7764706, 1,
-0.0588887, 1.509219, -0.4537255, 0, 1, 0.7843137, 1,
-0.05871145, -1.585546, -0.7930068, 0, 1, 0.7882353, 1,
-0.05863892, 0.6287087, 0.560648, 0, 1, 0.7960784, 1,
-0.05709716, -0.4462534, -4.464933, 0, 1, 0.8039216, 1,
-0.05653688, -1.274129, -3.515287, 0, 1, 0.8078431, 1,
-0.05574159, 1.261178, -0.8159307, 0, 1, 0.8156863, 1,
-0.05565907, -0.3010218, -2.090486, 0, 1, 0.8196079, 1,
-0.05540816, 0.1931814, 0.5210792, 0, 1, 0.827451, 1,
-0.05409338, 0.781337, 0.94062, 0, 1, 0.8313726, 1,
-0.05359155, -0.2331602, -1.309023, 0, 1, 0.8392157, 1,
-0.0503435, 1.06199, 0.870965, 0, 1, 0.8431373, 1,
-0.04538811, -0.732165, -3.008324, 0, 1, 0.8509804, 1,
-0.04341957, -1.351593, -3.233122, 0, 1, 0.854902, 1,
-0.04239843, -0.3271385, -2.304582, 0, 1, 0.8627451, 1,
-0.04085413, 0.9363779, 0.06032112, 0, 1, 0.8666667, 1,
-0.04061074, -0.1057341, -1.696167, 0, 1, 0.8745098, 1,
-0.03557254, -0.3404304, -3.160692, 0, 1, 0.8784314, 1,
-0.03390951, 2.258946, 0.6050361, 0, 1, 0.8862745, 1,
-0.03112521, -0.5666186, -2.735833, 0, 1, 0.8901961, 1,
-0.02928542, 0.1966413, -0.7497091, 0, 1, 0.8980392, 1,
-0.02366718, -0.6769636, -3.230327, 0, 1, 0.9058824, 1,
-0.0212035, -1.881127, -2.32115, 0, 1, 0.9098039, 1,
-0.02051365, 0.415485, -1.058122, 0, 1, 0.9176471, 1,
-0.018488, 0.3164095, -0.6645371, 0, 1, 0.9215686, 1,
-0.01619835, 0.3261414, -0.08081037, 0, 1, 0.9294118, 1,
-0.01590081, 1.149746, 0.63379, 0, 1, 0.9333333, 1,
-0.0149498, -0.4942541, -4.420525, 0, 1, 0.9411765, 1,
-0.00930116, -0.591482, -3.214089, 0, 1, 0.945098, 1,
-0.007634625, -0.8786485, -2.272992, 0, 1, 0.9529412, 1,
-0.006416691, 1.706763, 0.636832, 0, 1, 0.9568627, 1,
-0.005267046, 0.7180388, 0.6192741, 0, 1, 0.9647059, 1,
0.001209174, 2.444092, 0.1372398, 0, 1, 0.9686275, 1,
0.001665157, 0.7182913, -0.6128855, 0, 1, 0.9764706, 1,
0.01051187, 1.138041, -1.333477, 0, 1, 0.9803922, 1,
0.01235956, -0.1883747, 0.629236, 0, 1, 0.9882353, 1,
0.01481205, 0.01519691, -0.3015721, 0, 1, 0.9921569, 1,
0.01536261, -1.080029, 3.972654, 0, 1, 1, 1,
0.01827737, -1.00795, 2.908347, 0, 0.9921569, 1, 1,
0.02226195, -0.3256135, 5.18081, 0, 0.9882353, 1, 1,
0.02436413, 0.3729626, -0.02473002, 0, 0.9803922, 1, 1,
0.02502292, 0.1920746, 1.317282, 0, 0.9764706, 1, 1,
0.03389919, -2.490532, 2.137688, 0, 0.9686275, 1, 1,
0.03535119, -0.5521232, 4.269561, 0, 0.9647059, 1, 1,
0.03639861, -0.7791772, 3.648458, 0, 0.9568627, 1, 1,
0.03819204, -0.6179518, 4.210155, 0, 0.9529412, 1, 1,
0.03955768, 0.3214716, 0.171533, 0, 0.945098, 1, 1,
0.043071, -0.549916, 2.653416, 0, 0.9411765, 1, 1,
0.04442242, 0.5416583, -0.456764, 0, 0.9333333, 1, 1,
0.04629163, -1.704775, 3.409564, 0, 0.9294118, 1, 1,
0.04845734, 0.2695888, -0.9493948, 0, 0.9215686, 1, 1,
0.05528421, -0.8241199, 2.598254, 0, 0.9176471, 1, 1,
0.05567662, -1.291894, 3.869954, 0, 0.9098039, 1, 1,
0.0598598, 0.451333, -0.2488411, 0, 0.9058824, 1, 1,
0.06299665, 1.487465, 0.2142353, 0, 0.8980392, 1, 1,
0.06325586, 1.021857, 0.3539262, 0, 0.8901961, 1, 1,
0.06352212, 1.104728, -0.01924526, 0, 0.8862745, 1, 1,
0.06381691, 0.2945979, -0.1490748, 0, 0.8784314, 1, 1,
0.06391415, -0.1126148, 2.69908, 0, 0.8745098, 1, 1,
0.07303911, -0.481971, 3.069329, 0, 0.8666667, 1, 1,
0.0733973, 1.922953, 1.493943, 0, 0.8627451, 1, 1,
0.07373609, 0.6274664, 1.917032, 0, 0.854902, 1, 1,
0.07423382, -1.260448, 3.287494, 0, 0.8509804, 1, 1,
0.08449125, 0.1349387, 0.2944796, 0, 0.8431373, 1, 1,
0.08865244, -0.1233639, 2.573942, 0, 0.8392157, 1, 1,
0.08941658, 1.271698, 0.4716555, 0, 0.8313726, 1, 1,
0.09418399, 1.129286, -0.1625511, 0, 0.827451, 1, 1,
0.09580895, -0.9141205, 4.573931, 0, 0.8196079, 1, 1,
0.09898608, -0.8275439, 2.754352, 0, 0.8156863, 1, 1,
0.1052194, 0.1944971, -0.3442974, 0, 0.8078431, 1, 1,
0.1060315, -0.9887928, 1.740725, 0, 0.8039216, 1, 1,
0.1153533, 0.7441288, -0.8212433, 0, 0.7960784, 1, 1,
0.1157193, 0.4255997, 1.992682, 0, 0.7882353, 1, 1,
0.1178032, 0.1260087, -0.240943, 0, 0.7843137, 1, 1,
0.120251, 0.4189053, 1.622006, 0, 0.7764706, 1, 1,
0.1212887, -0.5296425, 4.66405, 0, 0.772549, 1, 1,
0.1223058, 1.232711, 0.3069717, 0, 0.7647059, 1, 1,
0.1233368, -0.4548351, 2.213109, 0, 0.7607843, 1, 1,
0.1235726, -0.980055, 4.070175, 0, 0.7529412, 1, 1,
0.1258981, 0.4203687, 1.795213, 0, 0.7490196, 1, 1,
0.1261033, 1.85967, -0.8789914, 0, 0.7411765, 1, 1,
0.1269895, 2.436253, 0.3532375, 0, 0.7372549, 1, 1,
0.1309646, -0.8899408, 5.750007, 0, 0.7294118, 1, 1,
0.1313818, 0.2796428, 0.692615, 0, 0.7254902, 1, 1,
0.1330117, -0.2934471, 1.775044, 0, 0.7176471, 1, 1,
0.133141, 1.024682, 0.2872114, 0, 0.7137255, 1, 1,
0.1356057, 0.5439146, 1.403882, 0, 0.7058824, 1, 1,
0.1366661, -0.6448916, 2.762708, 0, 0.6980392, 1, 1,
0.1374549, 0.4092377, 0.6572004, 0, 0.6941177, 1, 1,
0.1381575, 0.1685129, -0.8165436, 0, 0.6862745, 1, 1,
0.1421437, 0.36278, 1.739557, 0, 0.682353, 1, 1,
0.1428554, 2.177341, 0.298202, 0, 0.6745098, 1, 1,
0.1438194, 1.853141, -1.579944, 0, 0.6705883, 1, 1,
0.1483719, -0.004134615, 2.265037, 0, 0.6627451, 1, 1,
0.1488466, -1.512046, 2.669067, 0, 0.6588235, 1, 1,
0.1493922, 0.6778209, -0.1611221, 0, 0.6509804, 1, 1,
0.1528056, 1.077646, 0.5486422, 0, 0.6470588, 1, 1,
0.1533059, -0.9736457, 0.6350307, 0, 0.6392157, 1, 1,
0.1541455, 0.5825321, 0.6043517, 0, 0.6352941, 1, 1,
0.1553754, 0.8585984, 0.5748352, 0, 0.627451, 1, 1,
0.1561185, -1.477729, 2.259018, 0, 0.6235294, 1, 1,
0.1571514, 2.822527, -0.6170633, 0, 0.6156863, 1, 1,
0.1573069, 0.319271, -0.5087358, 0, 0.6117647, 1, 1,
0.1590512, 0.6959335, 1.387188, 0, 0.6039216, 1, 1,
0.1622671, -1.219495, 1.987737, 0, 0.5960785, 1, 1,
0.1642556, 0.01904363, 0.4940928, 0, 0.5921569, 1, 1,
0.1672297, -0.02789592, 1.923368, 0, 0.5843138, 1, 1,
0.1690671, 1.288131, 0.02842997, 0, 0.5803922, 1, 1,
0.1731081, 0.9068, 0.8449637, 0, 0.572549, 1, 1,
0.1734879, 0.2498185, 1.784942, 0, 0.5686275, 1, 1,
0.1771137, 0.6101465, 0.7603698, 0, 0.5607843, 1, 1,
0.1806319, 1.822802, 1.03946, 0, 0.5568628, 1, 1,
0.1869813, -0.6495419, 4.128353, 0, 0.5490196, 1, 1,
0.1871744, 0.04422551, 0.5186484, 0, 0.5450981, 1, 1,
0.1873553, 1.265224, 2.219044, 0, 0.5372549, 1, 1,
0.1900224, -1.307592, 2.446012, 0, 0.5333334, 1, 1,
0.1930546, -0.7729838, 2.480148, 0, 0.5254902, 1, 1,
0.193209, -2.261764, 2.1348, 0, 0.5215687, 1, 1,
0.1982567, -1.844345, 2.788558, 0, 0.5137255, 1, 1,
0.2004021, -0.3931029, 1.91332, 0, 0.509804, 1, 1,
0.2011829, -0.08111876, 2.338757, 0, 0.5019608, 1, 1,
0.204245, 1.156931, -1.19768, 0, 0.4941176, 1, 1,
0.2075553, -1.030101, 4.196352, 0, 0.4901961, 1, 1,
0.21036, -0.5210959, 1.733367, 0, 0.4823529, 1, 1,
0.2196138, 2.565863, 0.9873879, 0, 0.4784314, 1, 1,
0.2229802, -0.1018675, 1.01653, 0, 0.4705882, 1, 1,
0.2238624, -1.050808, 3.557776, 0, 0.4666667, 1, 1,
0.2244819, -2.215422, 4.922883, 0, 0.4588235, 1, 1,
0.2247445, 0.1441482, 0.4505358, 0, 0.454902, 1, 1,
0.2257887, 1.040816, -1.153985, 0, 0.4470588, 1, 1,
0.2285402, 2.174946, 0.1634085, 0, 0.4431373, 1, 1,
0.230186, 0.4839794, 3.187047, 0, 0.4352941, 1, 1,
0.231209, 0.414929, -0.0928413, 0, 0.4313726, 1, 1,
0.2355612, 1.332778, 0.5368434, 0, 0.4235294, 1, 1,
0.2386535, 1.050285, 0.9462557, 0, 0.4196078, 1, 1,
0.2403395, -2.6974, 3.392095, 0, 0.4117647, 1, 1,
0.2409508, -0.1475191, 3.019338, 0, 0.4078431, 1, 1,
0.2414625, -2.080639, 2.338964, 0, 0.4, 1, 1,
0.2434384, 1.470739, 0.2786863, 0, 0.3921569, 1, 1,
0.24901, -0.5202057, 1.97079, 0, 0.3882353, 1, 1,
0.2501876, -1.571506, 2.463488, 0, 0.3803922, 1, 1,
0.2515151, -0.4567961, 3.563483, 0, 0.3764706, 1, 1,
0.2549728, 1.044667, -1.380345, 0, 0.3686275, 1, 1,
0.2579409, 0.6555597, 0.6753986, 0, 0.3647059, 1, 1,
0.2581485, 0.6751345, 0.3807011, 0, 0.3568628, 1, 1,
0.2633191, 1.848813, -0.8230205, 0, 0.3529412, 1, 1,
0.2661189, 0.6755432, 1.56453, 0, 0.345098, 1, 1,
0.2711222, 0.2651845, 1.141074, 0, 0.3411765, 1, 1,
0.2727351, -0.1420449, 2.494976, 0, 0.3333333, 1, 1,
0.2758274, 0.8434126, 1.860993, 0, 0.3294118, 1, 1,
0.2769002, -0.9266975, 2.288913, 0, 0.3215686, 1, 1,
0.2784252, -0.4965452, 3.298703, 0, 0.3176471, 1, 1,
0.2792889, 0.8991892, 0.2223932, 0, 0.3098039, 1, 1,
0.2808377, 0.2604313, -0.3762889, 0, 0.3058824, 1, 1,
0.2853734, -2.248966, 1.91141, 0, 0.2980392, 1, 1,
0.2860136, 0.4376032, -0.3448243, 0, 0.2901961, 1, 1,
0.2882408, -0.7835092, 2.535623, 0, 0.2862745, 1, 1,
0.2900027, 1.739125, 1.569932, 0, 0.2784314, 1, 1,
0.2937072, -0.4820009, 2.152194, 0, 0.2745098, 1, 1,
0.3006506, -1.25664, 1.570305, 0, 0.2666667, 1, 1,
0.3012238, -1.81471, 2.811938, 0, 0.2627451, 1, 1,
0.3066436, -0.4286581, 1.383722, 0, 0.254902, 1, 1,
0.3069575, 0.2796528, 2.892941, 0, 0.2509804, 1, 1,
0.3077317, -0.740051, 4.497743, 0, 0.2431373, 1, 1,
0.3144579, 0.07558503, 1.867646, 0, 0.2392157, 1, 1,
0.3167595, -0.9320686, 2.461035, 0, 0.2313726, 1, 1,
0.3196047, -0.09923196, 3.589932, 0, 0.227451, 1, 1,
0.3220423, -1.105231, 2.49156, 0, 0.2196078, 1, 1,
0.325678, 2.331266, 0.6305816, 0, 0.2156863, 1, 1,
0.3288486, -0.1928719, 0.5661229, 0, 0.2078431, 1, 1,
0.3298517, -0.8298103, 2.024072, 0, 0.2039216, 1, 1,
0.3360768, 0.196842, 0.6607469, 0, 0.1960784, 1, 1,
0.3381542, 1.35486, 2.932994, 0, 0.1882353, 1, 1,
0.3397032, 0.04458005, 0.8668065, 0, 0.1843137, 1, 1,
0.3440953, -0.9979087, 3.344678, 0, 0.1764706, 1, 1,
0.3494129, -0.1684194, 1.895963, 0, 0.172549, 1, 1,
0.3523789, -1.42946, 2.386074, 0, 0.1647059, 1, 1,
0.3524605, -1.363791, 2.72128, 0, 0.1607843, 1, 1,
0.3549054, -0.4591032, 1.610279, 0, 0.1529412, 1, 1,
0.3549978, -0.5422659, 1.192518, 0, 0.1490196, 1, 1,
0.3573988, -0.3085722, 2.484109, 0, 0.1411765, 1, 1,
0.3682292, 1.278377, 0.1044639, 0, 0.1372549, 1, 1,
0.3716687, -0.3671531, 2.9553, 0, 0.1294118, 1, 1,
0.3770121, 0.9579121, 0.5294725, 0, 0.1254902, 1, 1,
0.3786103, -2.325773, 3.536483, 0, 0.1176471, 1, 1,
0.3788736, 0.9503787, 1.407363, 0, 0.1137255, 1, 1,
0.379597, 0.2794231, -0.9921447, 0, 0.1058824, 1, 1,
0.3873752, -0.7607737, 3.653121, 0, 0.09803922, 1, 1,
0.3889049, -0.2306081, -0.325024, 0, 0.09411765, 1, 1,
0.3903769, -0.9996831, 2.237062, 0, 0.08627451, 1, 1,
0.3954464, 0.1140529, 2.815026, 0, 0.08235294, 1, 1,
0.398819, 0.2500159, 0.5117137, 0, 0.07450981, 1, 1,
0.4055309, 0.2340618, 2.027914, 0, 0.07058824, 1, 1,
0.414159, -0.1559861, 2.381754, 0, 0.0627451, 1, 1,
0.4147233, 1.231232, 1.112131, 0, 0.05882353, 1, 1,
0.4175166, 0.4334496, 0.6045036, 0, 0.05098039, 1, 1,
0.4201741, -0.3167196, 1.958061, 0, 0.04705882, 1, 1,
0.4207897, 0.4260405, 0.5987917, 0, 0.03921569, 1, 1,
0.4223598, -0.5409043, 2.512446, 0, 0.03529412, 1, 1,
0.424377, 0.3212345, 1.867163, 0, 0.02745098, 1, 1,
0.4309782, -1.258764, 3.006952, 0, 0.02352941, 1, 1,
0.4323991, -0.9451219, 1.814285, 0, 0.01568628, 1, 1,
0.4325234, -0.3955176, 1.221845, 0, 0.01176471, 1, 1,
0.4347264, -0.4900524, 4.062162, 0, 0.003921569, 1, 1,
0.4392455, -0.8188158, 1.752684, 0.003921569, 0, 1, 1,
0.44054, 0.7375782, 0.06145401, 0.007843138, 0, 1, 1,
0.4418842, 0.9198194, 1.279602, 0.01568628, 0, 1, 1,
0.4430664, -0.6485831, 2.571494, 0.01960784, 0, 1, 1,
0.4459331, -1.680999, 2.214595, 0.02745098, 0, 1, 1,
0.4474183, -1.695624, 1.409159, 0.03137255, 0, 1, 1,
0.4479702, 1.415716, -0.5663055, 0.03921569, 0, 1, 1,
0.4482745, -0.1583886, 2.32707, 0.04313726, 0, 1, 1,
0.4490383, 1.745149, 0.7567011, 0.05098039, 0, 1, 1,
0.4515312, -0.9819819, 4.352564, 0.05490196, 0, 1, 1,
0.4541345, -1.300687, 3.198843, 0.0627451, 0, 1, 1,
0.4570608, -0.7719352, 2.246644, 0.06666667, 0, 1, 1,
0.4578562, -0.6730055, 1.645726, 0.07450981, 0, 1, 1,
0.4602626, -0.4072368, 2.782495, 0.07843138, 0, 1, 1,
0.4630052, 0.7968175, 0.6518078, 0.08627451, 0, 1, 1,
0.4652426, -0.9517659, 0.7074733, 0.09019608, 0, 1, 1,
0.4684982, -0.4834981, 2.564282, 0.09803922, 0, 1, 1,
0.4702016, 0.3084966, -0.5496603, 0.1058824, 0, 1, 1,
0.4715831, 0.5236071, 0.516644, 0.1098039, 0, 1, 1,
0.4757104, 0.7722017, -1.549426, 0.1176471, 0, 1, 1,
0.4805886, -0.2493762, 0.1262845, 0.1215686, 0, 1, 1,
0.4836834, -0.6802505, 2.758266, 0.1294118, 0, 1, 1,
0.4868203, -0.05901682, 2.64504, 0.1333333, 0, 1, 1,
0.4882174, 0.3053907, 1.173505, 0.1411765, 0, 1, 1,
0.5042076, -2.82855, 2.523562, 0.145098, 0, 1, 1,
0.5047714, 0.2099424, 1.783531, 0.1529412, 0, 1, 1,
0.506455, 0.1779926, 0.1192804, 0.1568628, 0, 1, 1,
0.5080947, 0.003538691, 2.19583, 0.1647059, 0, 1, 1,
0.5084929, 0.127592, 2.532232, 0.1686275, 0, 1, 1,
0.5145348, -0.4940607, 2.273385, 0.1764706, 0, 1, 1,
0.5149875, 0.814629, -1.981413, 0.1803922, 0, 1, 1,
0.5158827, 0.2926507, 0.9344557, 0.1882353, 0, 1, 1,
0.5252897, -0.8787462, 2.684255, 0.1921569, 0, 1, 1,
0.5292562, -1.001463, 1.843016, 0.2, 0, 1, 1,
0.531572, 0.07515986, 0.3244626, 0.2078431, 0, 1, 1,
0.5368664, -0.6344129, 2.857693, 0.2117647, 0, 1, 1,
0.5384493, 0.7998962, 0.9398064, 0.2196078, 0, 1, 1,
0.5384998, 0.9266863, 0.4510785, 0.2235294, 0, 1, 1,
0.5396307, 0.7366977, 0.9773629, 0.2313726, 0, 1, 1,
0.5400924, -1.069688, 3.400977, 0.2352941, 0, 1, 1,
0.5403752, 1.418979, 1.497442, 0.2431373, 0, 1, 1,
0.5430502, -0.3236553, 3.438632, 0.2470588, 0, 1, 1,
0.5502635, -1.710263, 1.457733, 0.254902, 0, 1, 1,
0.5504465, -0.4212693, 3.960974, 0.2588235, 0, 1, 1,
0.5506637, -0.153454, 4.099151, 0.2666667, 0, 1, 1,
0.5513566, -0.1468843, 1.768161, 0.2705882, 0, 1, 1,
0.5532167, -0.9621149, 4.249098, 0.2784314, 0, 1, 1,
0.555839, -1.180567, 2.984263, 0.282353, 0, 1, 1,
0.5659896, -0.4454696, 0.6114751, 0.2901961, 0, 1, 1,
0.5688602, -1.305291, 3.552034, 0.2941177, 0, 1, 1,
0.5706058, 1.364698, -0.06870178, 0.3019608, 0, 1, 1,
0.5727667, -1.909588, 3.397992, 0.3098039, 0, 1, 1,
0.5782965, -0.2762272, 2.978817, 0.3137255, 0, 1, 1,
0.5805765, -1.609939, 2.656339, 0.3215686, 0, 1, 1,
0.5826026, -1.384297, 1.327235, 0.3254902, 0, 1, 1,
0.582709, 1.460124, 0.9778825, 0.3333333, 0, 1, 1,
0.5842712, 0.5608884, 0.2407668, 0.3372549, 0, 1, 1,
0.5940906, -1.377882, 2.134924, 0.345098, 0, 1, 1,
0.5966287, 0.02241826, 0.1565711, 0.3490196, 0, 1, 1,
0.5980141, -0.7574773, 2.177809, 0.3568628, 0, 1, 1,
0.5996291, -0.2199243, 2.644453, 0.3607843, 0, 1, 1,
0.6021949, -1.982878, 2.043245, 0.3686275, 0, 1, 1,
0.6024302, 0.08799758, 1.306225, 0.372549, 0, 1, 1,
0.603, 1.510824, 1.125265, 0.3803922, 0, 1, 1,
0.6098322, 0.9553469, 0.8457478, 0.3843137, 0, 1, 1,
0.6099538, 0.0224287, 0.974226, 0.3921569, 0, 1, 1,
0.6128091, 2.80826, -1.047444, 0.3960784, 0, 1, 1,
0.614687, 0.6685714, 0.6029832, 0.4039216, 0, 1, 1,
0.6180785, 1.42331, 0.3892716, 0.4117647, 0, 1, 1,
0.6182129, -1.057936, 1.866527, 0.4156863, 0, 1, 1,
0.6188765, -0.8625551, 3.157552, 0.4235294, 0, 1, 1,
0.6195865, -0.3259851, 2.556801, 0.427451, 0, 1, 1,
0.6274638, 1.11034, -0.6985551, 0.4352941, 0, 1, 1,
0.6292518, 1.29071, 0.8841525, 0.4392157, 0, 1, 1,
0.6334697, 0.0526741, 1.316494, 0.4470588, 0, 1, 1,
0.6358056, -1.495819, 2.181122, 0.4509804, 0, 1, 1,
0.6362297, 0.338955, 1.252014, 0.4588235, 0, 1, 1,
0.636804, 2.551968, -2.195458, 0.4627451, 0, 1, 1,
0.6452278, 0.1523114, -0.2390559, 0.4705882, 0, 1, 1,
0.6453797, -2.062905, 2.427033, 0.4745098, 0, 1, 1,
0.6554362, -0.7801059, 3.198198, 0.4823529, 0, 1, 1,
0.6569784, 0.8485138, 1.447603, 0.4862745, 0, 1, 1,
0.6668179, 1.729964, 0.1940039, 0.4941176, 0, 1, 1,
0.6693083, -1.132391, 2.6647, 0.5019608, 0, 1, 1,
0.6779093, 0.591931, -1.11403, 0.5058824, 0, 1, 1,
0.6803543, -0.1031553, 1.49637, 0.5137255, 0, 1, 1,
0.6858444, 0.1994037, 0.2893405, 0.5176471, 0, 1, 1,
0.6860181, 0.2995591, -0.751504, 0.5254902, 0, 1, 1,
0.6867375, 0.1148374, 1.197833, 0.5294118, 0, 1, 1,
0.6868775, -1.038595, 2.214991, 0.5372549, 0, 1, 1,
0.6872911, -2.146008, 2.410593, 0.5411765, 0, 1, 1,
0.6921678, 1.927304, -0.568696, 0.5490196, 0, 1, 1,
0.6955834, 1.880289, -0.8793232, 0.5529412, 0, 1, 1,
0.7015576, -0.9473364, 1.909848, 0.5607843, 0, 1, 1,
0.7019464, -0.4778043, 2.33615, 0.5647059, 0, 1, 1,
0.7044223, 0.2828687, 0.1695576, 0.572549, 0, 1, 1,
0.716104, 0.4712802, -1.012126, 0.5764706, 0, 1, 1,
0.7163315, -0.5463418, 1.77026, 0.5843138, 0, 1, 1,
0.7255741, 1.735805, 0.8804315, 0.5882353, 0, 1, 1,
0.7300974, 1.244089, 0.2172602, 0.5960785, 0, 1, 1,
0.7321754, 0.6379176, -0.6429173, 0.6039216, 0, 1, 1,
0.7323968, 1.244482, 0.5048089, 0.6078432, 0, 1, 1,
0.7344795, -0.05827888, 1.451444, 0.6156863, 0, 1, 1,
0.7345061, 0.5832376, -0.1742324, 0.6196079, 0, 1, 1,
0.7360915, -0.004097553, 1.572406, 0.627451, 0, 1, 1,
0.7378671, -0.7102915, 1.353168, 0.6313726, 0, 1, 1,
0.7426301, -0.1770343, 2.847996, 0.6392157, 0, 1, 1,
0.7433315, 0.8424887, -0.3152357, 0.6431373, 0, 1, 1,
0.7443655, -0.5381874, 2.856429, 0.6509804, 0, 1, 1,
0.7485402, -1.752194, 2.95982, 0.654902, 0, 1, 1,
0.7488683, 2.024887, -0.7651076, 0.6627451, 0, 1, 1,
0.7503229, 1.149676, -0.632543, 0.6666667, 0, 1, 1,
0.7536667, -1.005872, 2.48455, 0.6745098, 0, 1, 1,
0.7639602, -0.702293, 3.035382, 0.6784314, 0, 1, 1,
0.7653298, 2.328955, -0.01825054, 0.6862745, 0, 1, 1,
0.7689291, -0.4066446, 2.491824, 0.6901961, 0, 1, 1,
0.7739006, 0.1398735, 0.2234115, 0.6980392, 0, 1, 1,
0.7745929, -0.2989797, 1.785833, 0.7058824, 0, 1, 1,
0.7746733, 0.6871586, 1.2613, 0.7098039, 0, 1, 1,
0.7753171, -0.7668204, 0.8422112, 0.7176471, 0, 1, 1,
0.7814778, -0.1334197, 2.149154, 0.7215686, 0, 1, 1,
0.7831134, 1.576257, -0.2058538, 0.7294118, 0, 1, 1,
0.7895906, 0.2480956, 1.706367, 0.7333333, 0, 1, 1,
0.7903783, 0.6819116, -0.2708273, 0.7411765, 0, 1, 1,
0.7914172, 1.847111, 2.411776, 0.7450981, 0, 1, 1,
0.8047631, -0.0737243, 1.111347, 0.7529412, 0, 1, 1,
0.8114523, 0.6140312, 0.2094863, 0.7568628, 0, 1, 1,
0.8122054, -0.321639, 1.307505, 0.7647059, 0, 1, 1,
0.8166208, 0.6649571, 2.011176, 0.7686275, 0, 1, 1,
0.8175215, 0.3336872, 0.3318934, 0.7764706, 0, 1, 1,
0.8202246, -1.602458, 3.270206, 0.7803922, 0, 1, 1,
0.8211747, 1.143219, 0.9507324, 0.7882353, 0, 1, 1,
0.8215888, -1.01026, 2.807335, 0.7921569, 0, 1, 1,
0.8232635, 0.06879155, 2.426758, 0.8, 0, 1, 1,
0.8274472, -0.6118363, 1.389522, 0.8078431, 0, 1, 1,
0.8300081, 1.494848, 2.265252, 0.8117647, 0, 1, 1,
0.842675, 0.9381182, 0.9035056, 0.8196079, 0, 1, 1,
0.8465031, 1.43184, -0.617107, 0.8235294, 0, 1, 1,
0.8618358, -0.3078322, 2.770809, 0.8313726, 0, 1, 1,
0.8680159, 0.8613433, 1.35556, 0.8352941, 0, 1, 1,
0.8722854, 0.168191, 2.645654, 0.8431373, 0, 1, 1,
0.8764009, 0.5784495, -1.451329, 0.8470588, 0, 1, 1,
0.8791561, -1.755369, 3.560939, 0.854902, 0, 1, 1,
0.8835814, -1.880956, 3.790703, 0.8588235, 0, 1, 1,
0.884544, 0.862097, 0.7384559, 0.8666667, 0, 1, 1,
0.8958378, -0.821716, 2.336806, 0.8705882, 0, 1, 1,
0.9062042, 1.039277, 0.02655456, 0.8784314, 0, 1, 1,
0.9078791, -0.4650078, 2.122705, 0.8823529, 0, 1, 1,
0.9122661, -1.476387, 2.504372, 0.8901961, 0, 1, 1,
0.9153669, 1.173305, 0.6073637, 0.8941177, 0, 1, 1,
0.9189216, 0.3148238, 1.528257, 0.9019608, 0, 1, 1,
0.9230246, -0.7262462, 3.257309, 0.9098039, 0, 1, 1,
0.9265236, -1.16018, 3.454008, 0.9137255, 0, 1, 1,
0.9276252, 0.927939, 0.8702669, 0.9215686, 0, 1, 1,
0.9294253, -0.4392238, 2.394932, 0.9254902, 0, 1, 1,
0.9319076, -0.353718, 1.975882, 0.9333333, 0, 1, 1,
0.9320343, 1.346287, 0.1039009, 0.9372549, 0, 1, 1,
0.9334671, -1.243932, 1.434416, 0.945098, 0, 1, 1,
0.9348534, -0.4701973, 3.117579, 0.9490196, 0, 1, 1,
0.9351436, 0.2747476, 2.865666, 0.9568627, 0, 1, 1,
0.9404156, 0.1470501, 1.773097, 0.9607843, 0, 1, 1,
0.9437084, 0.06856041, 3.638991, 0.9686275, 0, 1, 1,
0.946054, 0.5852664, 0.4097862, 0.972549, 0, 1, 1,
0.9491783, -0.5936387, 1.880059, 0.9803922, 0, 1, 1,
0.9494838, -0.9110722, 2.306953, 0.9843137, 0, 1, 1,
0.9566484, -0.5448613, 1.449759, 0.9921569, 0, 1, 1,
0.9573787, -0.3235999, 2.212988, 0.9960784, 0, 1, 1,
0.9635651, 0.8740676, 1.924013, 1, 0, 0.9960784, 1,
0.9640139, 0.7470275, 0.9800817, 1, 0, 0.9882353, 1,
0.9682295, -0.09662844, 2.019284, 1, 0, 0.9843137, 1,
0.969663, 0.06687754, 0.5600287, 1, 0, 0.9764706, 1,
0.9733291, 1.175844, -0.5325232, 1, 0, 0.972549, 1,
0.9748861, 0.4207993, -0.5248973, 1, 0, 0.9647059, 1,
0.9823902, 1.286294, -0.6726747, 1, 0, 0.9607843, 1,
0.9875973, -1.372953, 2.815883, 1, 0, 0.9529412, 1,
0.9888518, -0.8377269, 3.999404, 1, 0, 0.9490196, 1,
0.992371, 0.6987123, 2.737299, 1, 0, 0.9411765, 1,
0.9924473, -1.030158, 2.323677, 1, 0, 0.9372549, 1,
0.9952428, -0.4395951, 2.145804, 1, 0, 0.9294118, 1,
1.004373, -1.178901, 2.265589, 1, 0, 0.9254902, 1,
1.008521, -0.08073968, 3.263469, 1, 0, 0.9176471, 1,
1.012526, 0.6699963, 1.628893, 1, 0, 0.9137255, 1,
1.014691, -0.3709419, 2.228487, 1, 0, 0.9058824, 1,
1.015685, -0.06360027, 3.839253, 1, 0, 0.9019608, 1,
1.020965, -0.5996313, 2.191909, 1, 0, 0.8941177, 1,
1.0215, 0.9795731, 0.3790466, 1, 0, 0.8862745, 1,
1.023882, -1.461449, 2.347927, 1, 0, 0.8823529, 1,
1.031577, 1.706331, 0.7277531, 1, 0, 0.8745098, 1,
1.032135, 0.5718167, 0.3675262, 1, 0, 0.8705882, 1,
1.032609, -0.3683727, 2.811404, 1, 0, 0.8627451, 1,
1.04393, 0.2761319, 1.396873, 1, 0, 0.8588235, 1,
1.051793, 0.2825499, 0.7488387, 1, 0, 0.8509804, 1,
1.057309, 0.03057847, 2.795168, 1, 0, 0.8470588, 1,
1.068091, 1.825059, 1.593109, 1, 0, 0.8392157, 1,
1.073374, 1.974599, -0.07677698, 1, 0, 0.8352941, 1,
1.083585, -0.057478, 0.7187014, 1, 0, 0.827451, 1,
1.103136, 1.866482, 0.3602687, 1, 0, 0.8235294, 1,
1.106699, -1.45558, 3.320666, 1, 0, 0.8156863, 1,
1.107361, -0.7508405, 0.9556361, 1, 0, 0.8117647, 1,
1.111755, -0.3959006, 3.548981, 1, 0, 0.8039216, 1,
1.117485, 1.180261, 2.49991, 1, 0, 0.7960784, 1,
1.119543, 1.522682, 2.485271, 1, 0, 0.7921569, 1,
1.120225, -1.004893, 2.219417, 1, 0, 0.7843137, 1,
1.13017, -1.210819, 1.451407, 1, 0, 0.7803922, 1,
1.134594, 1.046711, 1.225764, 1, 0, 0.772549, 1,
1.136466, -0.9369141, 2.710656, 1, 0, 0.7686275, 1,
1.137055, 2.720292, 1.145443, 1, 0, 0.7607843, 1,
1.140624, 0.8458084, 2.183661, 1, 0, 0.7568628, 1,
1.145902, -1.30543, 4.355893, 1, 0, 0.7490196, 1,
1.159884, 0.4713082, 1.540605, 1, 0, 0.7450981, 1,
1.165693, 0.4862284, 1.930687, 1, 0, 0.7372549, 1,
1.166081, -0.2255141, 0.8187222, 1, 0, 0.7333333, 1,
1.174297, -0.02638403, 0.1362995, 1, 0, 0.7254902, 1,
1.18501, 1.419084, 1.121952, 1, 0, 0.7215686, 1,
1.185242, -0.2658813, 2.848624, 1, 0, 0.7137255, 1,
1.188814, -0.3701158, 4.09864, 1, 0, 0.7098039, 1,
1.192732, 0.563876, 1.372868, 1, 0, 0.7019608, 1,
1.193086, -1.244538, 2.598686, 1, 0, 0.6941177, 1,
1.199294, -1.126577, 3.537414, 1, 0, 0.6901961, 1,
1.205043, 0.4248736, 0.634286, 1, 0, 0.682353, 1,
1.211738, 0.8262704, -0.6191427, 1, 0, 0.6784314, 1,
1.217451, 2.295552, -0.5016726, 1, 0, 0.6705883, 1,
1.218262, -3.033837, 2.536764, 1, 0, 0.6666667, 1,
1.221834, 2.00215, 0.4431304, 1, 0, 0.6588235, 1,
1.237432, 0.267488, 0.2468964, 1, 0, 0.654902, 1,
1.239322, 0.683949, 1.543049, 1, 0, 0.6470588, 1,
1.245763, 0.1302134, 0.02021068, 1, 0, 0.6431373, 1,
1.251732, 2.602602, 0.2138616, 1, 0, 0.6352941, 1,
1.252967, -2.104123, 2.209913, 1, 0, 0.6313726, 1,
1.257942, 0.2104597, 1.182438, 1, 0, 0.6235294, 1,
1.26595, 0.7472169, 1.4001, 1, 0, 0.6196079, 1,
1.2757, -0.1608423, -0.8356742, 1, 0, 0.6117647, 1,
1.276026, -0.9482691, 1.639201, 1, 0, 0.6078432, 1,
1.283702, 0.6419869, 1.753703, 1, 0, 0.6, 1,
1.297514, -2.015123, 3.203736, 1, 0, 0.5921569, 1,
1.29992, 1.074932, 1.74383, 1, 0, 0.5882353, 1,
1.301046, -1.402378, 2.886436, 1, 0, 0.5803922, 1,
1.307283, -0.8419906, -0.04061476, 1, 0, 0.5764706, 1,
1.323051, -0.5967755, 2.421615, 1, 0, 0.5686275, 1,
1.345172, -0.2809119, 2.47168, 1, 0, 0.5647059, 1,
1.350073, 1.681767, 1.419166, 1, 0, 0.5568628, 1,
1.350147, 0.6785117, 0.8735715, 1, 0, 0.5529412, 1,
1.351382, -1.54963, 1.567076, 1, 0, 0.5450981, 1,
1.354212, 0.613002, 1.53027, 1, 0, 0.5411765, 1,
1.355883, -0.7354982, 1.753893, 1, 0, 0.5333334, 1,
1.357987, 0.08852816, 1.74812, 1, 0, 0.5294118, 1,
1.358416, 1.501195, 0.4932306, 1, 0, 0.5215687, 1,
1.363698, 1.344503, 0.842595, 1, 0, 0.5176471, 1,
1.371142, -0.4166312, 1.027503, 1, 0, 0.509804, 1,
1.371717, 0.7463895, 0.7272438, 1, 0, 0.5058824, 1,
1.379698, 0.4647385, 2.50296, 1, 0, 0.4980392, 1,
1.393033, -1.751383, 3.062652, 1, 0, 0.4901961, 1,
1.393051, -0.1727491, 1.09108, 1, 0, 0.4862745, 1,
1.396247, -0.164525, 1.855731, 1, 0, 0.4784314, 1,
1.402569, -0.9135896, 2.142891, 1, 0, 0.4745098, 1,
1.40554, 0.1800741, 0.8437996, 1, 0, 0.4666667, 1,
1.405999, 0.5373083, 0.5202991, 1, 0, 0.4627451, 1,
1.413722, -1.284541, 3.190258, 1, 0, 0.454902, 1,
1.422515, -0.716024, -0.472358, 1, 0, 0.4509804, 1,
1.44462, -0.1671368, 1.472776, 1, 0, 0.4431373, 1,
1.458671, 0.1329722, 2.03826, 1, 0, 0.4392157, 1,
1.462301, -0.3041395, -0.16563, 1, 0, 0.4313726, 1,
1.470101, 0.9198002, 0.6684015, 1, 0, 0.427451, 1,
1.475972, 0.6469538, -0.1471413, 1, 0, 0.4196078, 1,
1.495257, -0.706942, 1.920268, 1, 0, 0.4156863, 1,
1.498756, -0.5336246, 3.145024, 1, 0, 0.4078431, 1,
1.505149, 0.6146501, -0.3057165, 1, 0, 0.4039216, 1,
1.50568, 1.429716, 1.037423, 1, 0, 0.3960784, 1,
1.516595, -0.1368523, 1.114102, 1, 0, 0.3882353, 1,
1.52331, 0.8318482, 0.7516342, 1, 0, 0.3843137, 1,
1.536017, 1.435267, 2.52408, 1, 0, 0.3764706, 1,
1.551534, -1.614157, 2.667005, 1, 0, 0.372549, 1,
1.555631, -0.2144215, 2.00002, 1, 0, 0.3647059, 1,
1.555941, 0.4003996, 2.366179, 1, 0, 0.3607843, 1,
1.559069, -1.546646, 3.110891, 1, 0, 0.3529412, 1,
1.577873, -1.309828, 2.910266, 1, 0, 0.3490196, 1,
1.587792, -1.180021, 0.1585511, 1, 0, 0.3411765, 1,
1.591552, -1.043833, 2.839665, 1, 0, 0.3372549, 1,
1.593861, 0.4494965, 1.863808, 1, 0, 0.3294118, 1,
1.60721, 0.2559464, 1.546512, 1, 0, 0.3254902, 1,
1.607529, -0.3257, 1.164032, 1, 0, 0.3176471, 1,
1.607623, 0.6005528, 0.4672225, 1, 0, 0.3137255, 1,
1.617111, 1.064106, 1.069663, 1, 0, 0.3058824, 1,
1.629423, 0.2716444, 1.000225, 1, 0, 0.2980392, 1,
1.633802, -2.256938, 3.485779, 1, 0, 0.2941177, 1,
1.642209, -1.822093, 2.19227, 1, 0, 0.2862745, 1,
1.648821, 0.4371356, 1.613169, 1, 0, 0.282353, 1,
1.688333, -0.741917, 2.596755, 1, 0, 0.2745098, 1,
1.71225, 0.1255001, 1.2671, 1, 0, 0.2705882, 1,
1.726033, -0.8169108, 4.167901, 1, 0, 0.2627451, 1,
1.728875, 0.7598297, 0.3890792, 1, 0, 0.2588235, 1,
1.734026, 1.095909, 1.08253, 1, 0, 0.2509804, 1,
1.735734, -0.9627607, 0.9499264, 1, 0, 0.2470588, 1,
1.770803, 0.0009450702, 2.249816, 1, 0, 0.2392157, 1,
1.806361, 0.526323, 1.841552, 1, 0, 0.2352941, 1,
1.825849, 1.146769, -0.2336318, 1, 0, 0.227451, 1,
1.827478, 1.072155, 0.7251697, 1, 0, 0.2235294, 1,
1.843261, -1.015249, 3.279577, 1, 0, 0.2156863, 1,
1.852885, -1.01093, 3.948886, 1, 0, 0.2117647, 1,
1.876208, -0.04638427, 1.325581, 1, 0, 0.2039216, 1,
1.89839, 0.2934524, 0.1664819, 1, 0, 0.1960784, 1,
1.899068, -0.1987293, 2.664356, 1, 0, 0.1921569, 1,
1.909009, -1.684508, 0.1814883, 1, 0, 0.1843137, 1,
1.915455, -0.5253612, 2.70401, 1, 0, 0.1803922, 1,
1.932782, -0.8865094, 1.182074, 1, 0, 0.172549, 1,
1.942757, 1.216328, 1.993543, 1, 0, 0.1686275, 1,
1.962666, -0.6612872, 2.13419, 1, 0, 0.1607843, 1,
1.966557, 2.156113, -1.628078, 1, 0, 0.1568628, 1,
1.990397, -1.764608, -0.005799159, 1, 0, 0.1490196, 1,
1.995304, -0.5520065, 2.402949, 1, 0, 0.145098, 1,
2.026505, 0.2411618, 1.459387, 1, 0, 0.1372549, 1,
2.031212, 0.1046211, 0.7513328, 1, 0, 0.1333333, 1,
2.050701, -0.4023552, 1.893058, 1, 0, 0.1254902, 1,
2.053647, 0.4192782, 2.288406, 1, 0, 0.1215686, 1,
2.06411, 0.3626686, 2.841593, 1, 0, 0.1137255, 1,
2.068214, 1.493333, 1.13905, 1, 0, 0.1098039, 1,
2.083341, 0.2807355, 3.137968, 1, 0, 0.1019608, 1,
2.096089, -0.6759297, 0.8025859, 1, 0, 0.09411765, 1,
2.111133, -0.8718646, 0.2180417, 1, 0, 0.09019608, 1,
2.115054, -0.2294233, 1.090225, 1, 0, 0.08235294, 1,
2.131059, -0.7598603, 1.954743, 1, 0, 0.07843138, 1,
2.143198, 0.647234, -0.5431731, 1, 0, 0.07058824, 1,
2.144301, 1.931063, -0.07516314, 1, 0, 0.06666667, 1,
2.176015, 1.176812, 0.428073, 1, 0, 0.05882353, 1,
2.231748, -2.895492, 3.428121, 1, 0, 0.05490196, 1,
2.242648, -0.3782293, 3.447326, 1, 0, 0.04705882, 1,
2.263408, 2.537431, 1.484424, 1, 0, 0.04313726, 1,
2.338556, 3.504971, 1.89487, 1, 0, 0.03529412, 1,
2.370671, -0.6547713, 1.842012, 1, 0, 0.03137255, 1,
2.409633, -1.088605, 1.788478, 1, 0, 0.02352941, 1,
2.654187, 0.175318, 2.350946, 1, 0, 0.01960784, 1,
2.778541, -0.2711342, 3.107717, 1, 0, 0.01176471, 1,
2.782575, 0.3689646, 2.444365, 1, 0, 0.007843138, 1
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
-0.09022772, -4.142164, -6.791704, 0, -0.5, 0.5, 0.5,
-0.09022772, -4.142164, -6.791704, 1, -0.5, 0.5, 0.5,
-0.09022772, -4.142164, -6.791704, 1, 1.5, 0.5, 0.5,
-0.09022772, -4.142164, -6.791704, 0, 1.5, 0.5, 0.5
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
-3.936911, 0.2355671, -6.791704, 0, -0.5, 0.5, 0.5,
-3.936911, 0.2355671, -6.791704, 1, -0.5, 0.5, 0.5,
-3.936911, 0.2355671, -6.791704, 1, 1.5, 0.5, 0.5,
-3.936911, 0.2355671, -6.791704, 0, 1.5, 0.5, 0.5
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
-3.936911, -4.142164, 0.38801, 0, -0.5, 0.5, 0.5,
-3.936911, -4.142164, 0.38801, 1, -0.5, 0.5, 0.5,
-3.936911, -4.142164, 0.38801, 1, 1.5, 0.5, 0.5,
-3.936911, -4.142164, 0.38801, 0, 1.5, 0.5, 0.5
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
-2, -3.131919, -5.134847,
2, -3.131919, -5.134847,
-2, -3.131919, -5.134847,
-2, -3.300293, -5.41099,
-1, -3.131919, -5.134847,
-1, -3.300293, -5.41099,
0, -3.131919, -5.134847,
0, -3.300293, -5.41099,
1, -3.131919, -5.134847,
1, -3.300293, -5.41099,
2, -3.131919, -5.134847,
2, -3.300293, -5.41099
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
-2, -3.637042, -5.963275, 0, -0.5, 0.5, 0.5,
-2, -3.637042, -5.963275, 1, -0.5, 0.5, 0.5,
-2, -3.637042, -5.963275, 1, 1.5, 0.5, 0.5,
-2, -3.637042, -5.963275, 0, 1.5, 0.5, 0.5,
-1, -3.637042, -5.963275, 0, -0.5, 0.5, 0.5,
-1, -3.637042, -5.963275, 1, -0.5, 0.5, 0.5,
-1, -3.637042, -5.963275, 1, 1.5, 0.5, 0.5,
-1, -3.637042, -5.963275, 0, 1.5, 0.5, 0.5,
0, -3.637042, -5.963275, 0, -0.5, 0.5, 0.5,
0, -3.637042, -5.963275, 1, -0.5, 0.5, 0.5,
0, -3.637042, -5.963275, 1, 1.5, 0.5, 0.5,
0, -3.637042, -5.963275, 0, 1.5, 0.5, 0.5,
1, -3.637042, -5.963275, 0, -0.5, 0.5, 0.5,
1, -3.637042, -5.963275, 1, -0.5, 0.5, 0.5,
1, -3.637042, -5.963275, 1, 1.5, 0.5, 0.5,
1, -3.637042, -5.963275, 0, 1.5, 0.5, 0.5,
2, -3.637042, -5.963275, 0, -0.5, 0.5, 0.5,
2, -3.637042, -5.963275, 1, -0.5, 0.5, 0.5,
2, -3.637042, -5.963275, 1, 1.5, 0.5, 0.5,
2, -3.637042, -5.963275, 0, 1.5, 0.5, 0.5
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
-3.049215, -3, -5.134847,
-3.049215, 3, -5.134847,
-3.049215, -3, -5.134847,
-3.197164, -3, -5.41099,
-3.049215, -2, -5.134847,
-3.197164, -2, -5.41099,
-3.049215, -1, -5.134847,
-3.197164, -1, -5.41099,
-3.049215, 0, -5.134847,
-3.197164, 0, -5.41099,
-3.049215, 1, -5.134847,
-3.197164, 1, -5.41099,
-3.049215, 2, -5.134847,
-3.197164, 2, -5.41099,
-3.049215, 3, -5.134847,
-3.197164, 3, -5.41099
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
-3.493063, -3, -5.963275, 0, -0.5, 0.5, 0.5,
-3.493063, -3, -5.963275, 1, -0.5, 0.5, 0.5,
-3.493063, -3, -5.963275, 1, 1.5, 0.5, 0.5,
-3.493063, -3, -5.963275, 0, 1.5, 0.5, 0.5,
-3.493063, -2, -5.963275, 0, -0.5, 0.5, 0.5,
-3.493063, -2, -5.963275, 1, -0.5, 0.5, 0.5,
-3.493063, -2, -5.963275, 1, 1.5, 0.5, 0.5,
-3.493063, -2, -5.963275, 0, 1.5, 0.5, 0.5,
-3.493063, -1, -5.963275, 0, -0.5, 0.5, 0.5,
-3.493063, -1, -5.963275, 1, -0.5, 0.5, 0.5,
-3.493063, -1, -5.963275, 1, 1.5, 0.5, 0.5,
-3.493063, -1, -5.963275, 0, 1.5, 0.5, 0.5,
-3.493063, 0, -5.963275, 0, -0.5, 0.5, 0.5,
-3.493063, 0, -5.963275, 1, -0.5, 0.5, 0.5,
-3.493063, 0, -5.963275, 1, 1.5, 0.5, 0.5,
-3.493063, 0, -5.963275, 0, 1.5, 0.5, 0.5,
-3.493063, 1, -5.963275, 0, -0.5, 0.5, 0.5,
-3.493063, 1, -5.963275, 1, -0.5, 0.5, 0.5,
-3.493063, 1, -5.963275, 1, 1.5, 0.5, 0.5,
-3.493063, 1, -5.963275, 0, 1.5, 0.5, 0.5,
-3.493063, 2, -5.963275, 0, -0.5, 0.5, 0.5,
-3.493063, 2, -5.963275, 1, -0.5, 0.5, 0.5,
-3.493063, 2, -5.963275, 1, 1.5, 0.5, 0.5,
-3.493063, 2, -5.963275, 0, 1.5, 0.5, 0.5,
-3.493063, 3, -5.963275, 0, -0.5, 0.5, 0.5,
-3.493063, 3, -5.963275, 1, -0.5, 0.5, 0.5,
-3.493063, 3, -5.963275, 1, 1.5, 0.5, 0.5,
-3.493063, 3, -5.963275, 0, 1.5, 0.5, 0.5
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
-3.049215, -3.131919, -4,
-3.049215, -3.131919, 4,
-3.049215, -3.131919, -4,
-3.197164, -3.300293, -4,
-3.049215, -3.131919, -2,
-3.197164, -3.300293, -2,
-3.049215, -3.131919, 0,
-3.197164, -3.300293, 0,
-3.049215, -3.131919, 2,
-3.197164, -3.300293, 2,
-3.049215, -3.131919, 4,
-3.197164, -3.300293, 4
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
-3.493063, -3.637042, -4, 0, -0.5, 0.5, 0.5,
-3.493063, -3.637042, -4, 1, -0.5, 0.5, 0.5,
-3.493063, -3.637042, -4, 1, 1.5, 0.5, 0.5,
-3.493063, -3.637042, -4, 0, 1.5, 0.5, 0.5,
-3.493063, -3.637042, -2, 0, -0.5, 0.5, 0.5,
-3.493063, -3.637042, -2, 1, -0.5, 0.5, 0.5,
-3.493063, -3.637042, -2, 1, 1.5, 0.5, 0.5,
-3.493063, -3.637042, -2, 0, 1.5, 0.5, 0.5,
-3.493063, -3.637042, 0, 0, -0.5, 0.5, 0.5,
-3.493063, -3.637042, 0, 1, -0.5, 0.5, 0.5,
-3.493063, -3.637042, 0, 1, 1.5, 0.5, 0.5,
-3.493063, -3.637042, 0, 0, 1.5, 0.5, 0.5,
-3.493063, -3.637042, 2, 0, -0.5, 0.5, 0.5,
-3.493063, -3.637042, 2, 1, -0.5, 0.5, 0.5,
-3.493063, -3.637042, 2, 1, 1.5, 0.5, 0.5,
-3.493063, -3.637042, 2, 0, 1.5, 0.5, 0.5,
-3.493063, -3.637042, 4, 0, -0.5, 0.5, 0.5,
-3.493063, -3.637042, 4, 1, -0.5, 0.5, 0.5,
-3.493063, -3.637042, 4, 1, 1.5, 0.5, 0.5,
-3.493063, -3.637042, 4, 0, 1.5, 0.5, 0.5
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
-3.049215, -3.131919, -5.134847,
-3.049215, 3.603053, -5.134847,
-3.049215, -3.131919, 5.910867,
-3.049215, 3.603053, 5.910867,
-3.049215, -3.131919, -5.134847,
-3.049215, -3.131919, 5.910867,
-3.049215, 3.603053, -5.134847,
-3.049215, 3.603053, 5.910867,
-3.049215, -3.131919, -5.134847,
2.868759, -3.131919, -5.134847,
-3.049215, -3.131919, 5.910867,
2.868759, -3.131919, 5.910867,
-3.049215, 3.603053, -5.134847,
2.868759, 3.603053, -5.134847,
-3.049215, 3.603053, 5.910867,
2.868759, 3.603053, 5.910867,
2.868759, -3.131919, -5.134847,
2.868759, 3.603053, -5.134847,
2.868759, -3.131919, 5.910867,
2.868759, 3.603053, 5.910867,
2.868759, -3.131919, -5.134847,
2.868759, -3.131919, 5.910867,
2.868759, 3.603053, -5.134847,
2.868759, 3.603053, 5.910867
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
var radius = 7.596614;
var distance = 33.79819;
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
mvMatrix.translate( 0.09022772, -0.2355671, -0.38801 );
mvMatrix.scale( 1.387909, 1.219546, 0.7436013 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.79819);
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
orbencarb<-read.table("orbencarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-orbencarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'orbencarb' not found
```

```r
y<-orbencarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'orbencarb' not found
```

```r
z<-orbencarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'orbencarb' not found
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
-2.963031, 1.237502, -2.133755, 0, 0, 1, 1, 1,
-2.824322, -2.311422, -3.724636, 1, 0, 0, 1, 1,
-2.603876, 0.487216, -1.524638, 1, 0, 0, 1, 1,
-2.590112, 0.04460255, -0.1067754, 1, 0, 0, 1, 1,
-2.582901, 1.250601, -1.750136, 1, 0, 0, 1, 1,
-2.567695, 0.9310796, -2.784425, 1, 0, 0, 1, 1,
-2.52539, -0.887991, -2.730581, 0, 0, 0, 1, 1,
-2.42213, -1.559, -1.600983, 0, 0, 0, 1, 1,
-2.334654, -0.1696976, -0.3736541, 0, 0, 0, 1, 1,
-2.307046, -0.185733, -1.413009, 0, 0, 0, 1, 1,
-2.287251, -0.9846115, -3.316548, 0, 0, 0, 1, 1,
-2.282662, -0.09629662, -0.6725891, 0, 0, 0, 1, 1,
-2.216021, 1.913112, -0.3944065, 0, 0, 0, 1, 1,
-2.213782, -1.999293, -4.165684, 1, 1, 1, 1, 1,
-2.161833, 0.6058986, 0.5166516, 1, 1, 1, 1, 1,
-2.161663, -0.2272639, -3.279512, 1, 1, 1, 1, 1,
-2.14732, 0.7383393, -0.7717478, 1, 1, 1, 1, 1,
-2.11581, -2.565231, -2.20523, 1, 1, 1, 1, 1,
-2.097071, 0.09131005, -0.7820055, 1, 1, 1, 1, 1,
-1.991257, -0.8240954, -1.184866, 1, 1, 1, 1, 1,
-1.979645, -1.134222, -3.546702, 1, 1, 1, 1, 1,
-1.97665, -1.252983, -2.023209, 1, 1, 1, 1, 1,
-1.956006, 0.8897829, -0.5453115, 1, 1, 1, 1, 1,
-1.94691, -0.1889403, -2.485877, 1, 1, 1, 1, 1,
-1.938731, 0.02679638, -2.129338, 1, 1, 1, 1, 1,
-1.928703, -0.788385, -1.988032, 1, 1, 1, 1, 1,
-1.903612, 0.06398063, -1.171809, 1, 1, 1, 1, 1,
-1.90137, 0.3955571, -1.097651, 1, 1, 1, 1, 1,
-1.881484, -0.08453331, -1.821969, 0, 0, 1, 1, 1,
-1.879677, 0.0696383, -2.372628, 1, 0, 0, 1, 1,
-1.868735, -0.2321987, -2.495006, 1, 0, 0, 1, 1,
-1.8672, -1.552418, -2.516325, 1, 0, 0, 1, 1,
-1.865229, 3.094122, 0.1877173, 1, 0, 0, 1, 1,
-1.858828, 0.9490157, 0.2439794, 1, 0, 0, 1, 1,
-1.850417, 0.2811401, -2.882561, 0, 0, 0, 1, 1,
-1.834502, 1.202574, -1.954613, 0, 0, 0, 1, 1,
-1.825443, -0.8301101, -0.8098275, 0, 0, 0, 1, 1,
-1.818243, -2.94823, -1.126147, 0, 0, 0, 1, 1,
-1.801512, -0.2513422, -2.124286, 0, 0, 0, 1, 1,
-1.798089, -2.082497, -3.072456, 0, 0, 0, 1, 1,
-1.786176, 1.036873, -2.58072, 0, 0, 0, 1, 1,
-1.784848, 1.135527, -0.7218582, 1, 1, 1, 1, 1,
-1.767953, -1.008895, -1.928469, 1, 1, 1, 1, 1,
-1.767486, 0.5614009, -1.390049, 1, 1, 1, 1, 1,
-1.754046, -0.7429295, -2.819944, 1, 1, 1, 1, 1,
-1.712333, -0.6893041, -0.7202807, 1, 1, 1, 1, 1,
-1.712206, 0.925053, 0.1716024, 1, 1, 1, 1, 1,
-1.711449, 2.042215, -1.692, 1, 1, 1, 1, 1,
-1.700413, -0.5910271, -3.239015, 1, 1, 1, 1, 1,
-1.700357, -0.6524737, -1.984993, 1, 1, 1, 1, 1,
-1.70024, -1.721322, -2.072604, 1, 1, 1, 1, 1,
-1.680268, 0.6419259, -2.987529, 1, 1, 1, 1, 1,
-1.67973, 0.6008692, -2.053547, 1, 1, 1, 1, 1,
-1.658185, 0.3625142, 0.2999054, 1, 1, 1, 1, 1,
-1.656501, 1.206511, -1.213108, 1, 1, 1, 1, 1,
-1.640934, 0.4383088, -1.208126, 1, 1, 1, 1, 1,
-1.635314, -1.985692, -2.730391, 0, 0, 1, 1, 1,
-1.600504, -0.2683298, -2.617903, 1, 0, 0, 1, 1,
-1.56894, -0.7317942, -2.333069, 1, 0, 0, 1, 1,
-1.514874, -0.9300931, -2.778934, 1, 0, 0, 1, 1,
-1.511504, 0.1306529, -1.481168, 1, 0, 0, 1, 1,
-1.47771, 0.163129, -2.543813, 1, 0, 0, 1, 1,
-1.476082, 0.005919065, -3.089999, 0, 0, 0, 1, 1,
-1.465192, 1.38911, -0.6877837, 0, 0, 0, 1, 1,
-1.457848, -1.462187, 0.1734552, 0, 0, 0, 1, 1,
-1.455726, 0.6840197, -0.5167426, 0, 0, 0, 1, 1,
-1.445085, 0.3314092, -2.117887, 0, 0, 0, 1, 1,
-1.431772, 0.5589158, -1.384344, 0, 0, 0, 1, 1,
-1.404205, 0.5660431, -2.844796, 0, 0, 0, 1, 1,
-1.403112, 0.3024381, -2.308832, 1, 1, 1, 1, 1,
-1.401579, -0.7502195, -1.192914, 1, 1, 1, 1, 1,
-1.385274, -0.1200053, -1.579347, 1, 1, 1, 1, 1,
-1.378071, -0.7540742, -2.4563, 1, 1, 1, 1, 1,
-1.378055, 0.7731661, -1.44824, 1, 1, 1, 1, 1,
-1.371685, -0.8355902, -1.919695, 1, 1, 1, 1, 1,
-1.366406, 1.261435, -1.354025, 1, 1, 1, 1, 1,
-1.362148, 0.4654552, -3.343952, 1, 1, 1, 1, 1,
-1.350567, 0.01575347, -0.3981088, 1, 1, 1, 1, 1,
-1.350456, -0.3390928, 0.04509168, 1, 1, 1, 1, 1,
-1.3247, 1.189807, -0.8931995, 1, 1, 1, 1, 1,
-1.308304, -0.632799, -1.899088, 1, 1, 1, 1, 1,
-1.305128, 0.4835008, -0.8890983, 1, 1, 1, 1, 1,
-1.297911, 0.01680612, -1.156196, 1, 1, 1, 1, 1,
-1.287616, -2.184972, -0.6699899, 1, 1, 1, 1, 1,
-1.287438, 0.02915068, -2.359154, 0, 0, 1, 1, 1,
-1.285189, -0.2193396, -2.026224, 1, 0, 0, 1, 1,
-1.283156, -0.8573775, -2.147635, 1, 0, 0, 1, 1,
-1.2827, -0.4489236, -2.849908, 1, 0, 0, 1, 1,
-1.274147, 0.4240107, -1.282965, 1, 0, 0, 1, 1,
-1.273795, -1.579795, -2.85898, 1, 0, 0, 1, 1,
-1.261496, 1.498826, -0.3955526, 0, 0, 0, 1, 1,
-1.26085, 0.9621226, -0.1909702, 0, 0, 0, 1, 1,
-1.260559, 1.011362, 0.2604056, 0, 0, 0, 1, 1,
-1.258012, 0.5773826, -2.169342, 0, 0, 0, 1, 1,
-1.250307, -0.2432376, -3.056141, 0, 0, 0, 1, 1,
-1.233149, -0.1950113, -3.416859, 0, 0, 0, 1, 1,
-1.225994, 1.210499, -0.4983518, 0, 0, 0, 1, 1,
-1.216305, -0.521185, -1.574808, 1, 1, 1, 1, 1,
-1.193888, -0.135229, -2.186057, 1, 1, 1, 1, 1,
-1.191144, 0.1300857, -3.516819, 1, 1, 1, 1, 1,
-1.183245, 0.2004301, -1.825729, 1, 1, 1, 1, 1,
-1.181967, -0.5951251, -0.970704, 1, 1, 1, 1, 1,
-1.17638, -0.3700921, -3.263782, 1, 1, 1, 1, 1,
-1.172522, 1.150116, -1.660921, 1, 1, 1, 1, 1,
-1.159308, -0.1922922, -1.889676, 1, 1, 1, 1, 1,
-1.145297, 0.1316648, -1.560611, 1, 1, 1, 1, 1,
-1.138433, -1.791892, -3.201804, 1, 1, 1, 1, 1,
-1.133529, -0.5239159, -2.121007, 1, 1, 1, 1, 1,
-1.122455, -0.2205324, -1.058964, 1, 1, 1, 1, 1,
-1.12224, 0.7444628, 0.8898556, 1, 1, 1, 1, 1,
-1.121216, 0.8600539, 0.03283123, 1, 1, 1, 1, 1,
-1.117941, -1.128567, -0.8780071, 1, 1, 1, 1, 1,
-1.108973, -0.3523591, -2.468696, 0, 0, 1, 1, 1,
-1.100565, 0.1138555, -2.549496, 1, 0, 0, 1, 1,
-1.087977, 0.6898604, -0.4288287, 1, 0, 0, 1, 1,
-1.086772, -2.071455, -1.395004, 1, 0, 0, 1, 1,
-1.083825, 1.60582, -2.954423, 1, 0, 0, 1, 1,
-1.072238, 0.6761018, -0.9415989, 1, 0, 0, 1, 1,
-1.061871, -0.7139524, -1.214735, 0, 0, 0, 1, 1,
-1.05989, -1.749172, -1.651757, 0, 0, 0, 1, 1,
-1.058345, -1.081136, -2.86909, 0, 0, 0, 1, 1,
-1.04465, -0.03951341, -1.200511, 0, 0, 0, 1, 1,
-1.0438, -1.275912, -1.727744, 0, 0, 0, 1, 1,
-1.040453, 0.4552236, 0.4446369, 0, 0, 0, 1, 1,
-1.023782, -2.687693, -3.69336, 0, 0, 0, 1, 1,
-1.021775, 0.4091369, 0.7653357, 1, 1, 1, 1, 1,
-1.020815, -1.067672, -2.639575, 1, 1, 1, 1, 1,
-1.020036, 0.302404, -1.397869, 1, 1, 1, 1, 1,
-0.9991145, 0.2088362, -2.01851, 1, 1, 1, 1, 1,
-0.9917326, -0.4000417, -3.241166, 1, 1, 1, 1, 1,
-0.99159, 1.272799, -2.574531, 1, 1, 1, 1, 1,
-0.9856681, -0.8034277, -2.878987, 1, 1, 1, 1, 1,
-0.9809732, 0.3551742, -3.425905, 1, 1, 1, 1, 1,
-0.9775776, 0.435686, -0.3536455, 1, 1, 1, 1, 1,
-0.9748273, 0.9447168, -1.307741, 1, 1, 1, 1, 1,
-0.9736062, 1.368853, 0.2462411, 1, 1, 1, 1, 1,
-0.9727267, -0.6492622, -2.136232, 1, 1, 1, 1, 1,
-0.9721506, 1.135042, -1.143899, 1, 1, 1, 1, 1,
-0.9663507, -0.1759641, -2.580338, 1, 1, 1, 1, 1,
-0.965549, 0.5979896, -1.070399, 1, 1, 1, 1, 1,
-0.962104, -0.9418053, -1.606478, 0, 0, 1, 1, 1,
-0.9591414, -0.4539489, -1.764593, 1, 0, 0, 1, 1,
-0.9574034, -1.197269, -1.893335, 1, 0, 0, 1, 1,
-0.953823, 0.7671753, 0.7661758, 1, 0, 0, 1, 1,
-0.9457551, 1.454166, -1.28237, 1, 0, 0, 1, 1,
-0.9423715, 0.5303946, -1.238336, 1, 0, 0, 1, 1,
-0.9414964, -0.6928017, -2.339415, 0, 0, 0, 1, 1,
-0.937898, -0.1586665, -2.162825, 0, 0, 0, 1, 1,
-0.9371475, 0.1538003, 0.2905713, 0, 0, 0, 1, 1,
-0.9354444, 0.6167986, -0.8641859, 0, 0, 0, 1, 1,
-0.934404, -0.0002242178, -1.052475, 0, 0, 0, 1, 1,
-0.9311646, 1.637201, -1.357148, 0, 0, 0, 1, 1,
-0.9294332, 0.651163, -1.386389, 0, 0, 0, 1, 1,
-0.9223392, 0.1517006, -3.705479, 1, 1, 1, 1, 1,
-0.9061825, 2.081635, -1.620625, 1, 1, 1, 1, 1,
-0.9035982, 2.038432, 1.310941, 1, 1, 1, 1, 1,
-0.896311, -0.195074, 0.2270919, 1, 1, 1, 1, 1,
-0.8960262, 2.01712, 0.8410542, 1, 1, 1, 1, 1,
-0.8951355, 0.1237748, -1.293447, 1, 1, 1, 1, 1,
-0.8939363, 0.8694483, 1.510404, 1, 1, 1, 1, 1,
-0.8846421, -2.910768, -0.7174357, 1, 1, 1, 1, 1,
-0.872008, 1.183329, 0.681293, 1, 1, 1, 1, 1,
-0.8684323, 0.2211319, -1.724791, 1, 1, 1, 1, 1,
-0.8664045, 0.555365, -2.216348, 1, 1, 1, 1, 1,
-0.8655142, -0.1346835, -2.042093, 1, 1, 1, 1, 1,
-0.8560038, -0.1636235, -3.014255, 1, 1, 1, 1, 1,
-0.8535204, 0.6144845, -1.926984, 1, 1, 1, 1, 1,
-0.8506842, 0.1103721, -1.759924, 1, 1, 1, 1, 1,
-0.8471996, 0.8495477, 1.029482, 0, 0, 1, 1, 1,
-0.8402146, 0.01789523, -0.7242554, 1, 0, 0, 1, 1,
-0.8394828, 1.166338, -2.741941, 1, 0, 0, 1, 1,
-0.8345122, -0.4708358, -1.388769, 1, 0, 0, 1, 1,
-0.8338445, 0.5904347, -0.5249643, 1, 0, 0, 1, 1,
-0.8334488, 0.06172763, -2.106018, 1, 0, 0, 1, 1,
-0.8319634, -0.9692625, -2.94263, 0, 0, 0, 1, 1,
-0.8305293, 0.5739893, -0.5294353, 0, 0, 0, 1, 1,
-0.8275397, -0.423021, -3.285275, 0, 0, 0, 1, 1,
-0.8274891, 1.23553, -1.294416, 0, 0, 0, 1, 1,
-0.8270052, 1.550736, -0.1187132, 0, 0, 0, 1, 1,
-0.8239264, 0.7539849, -1.570501, 0, 0, 0, 1, 1,
-0.8135735, -1.332976, -2.147034, 0, 0, 0, 1, 1,
-0.8122038, 0.5705584, -0.2083707, 1, 1, 1, 1, 1,
-0.8111851, -0.5499284, -3.716621, 1, 1, 1, 1, 1,
-0.8100672, -0.9562035, -1.657612, 1, 1, 1, 1, 1,
-0.8093476, -0.8932441, -2.656466, 1, 1, 1, 1, 1,
-0.7984105, -0.1032568, -3.398448, 1, 1, 1, 1, 1,
-0.7982793, 1.61742, 0.02823599, 1, 1, 1, 1, 1,
-0.7975826, -0.899827, -2.511597, 1, 1, 1, 1, 1,
-0.7908993, -1.331793, -2.161964, 1, 1, 1, 1, 1,
-0.7897485, 0.9863963, -0.01105823, 1, 1, 1, 1, 1,
-0.7871551, -0.3020244, -0.4357181, 1, 1, 1, 1, 1,
-0.7840513, 1.882709, -0.6005328, 1, 1, 1, 1, 1,
-0.7829735, 2.239359, 0.09883792, 1, 1, 1, 1, 1,
-0.7802398, 0.3542201, -0.4478001, 1, 1, 1, 1, 1,
-0.7737491, 1.467416, -0.8805832, 1, 1, 1, 1, 1,
-0.7664753, -0.1875134, -2.057392, 1, 1, 1, 1, 1,
-0.7650536, 1.121037, 0.01197896, 0, 0, 1, 1, 1,
-0.7621312, -1.208503, -2.364767, 1, 0, 0, 1, 1,
-0.7591964, 0.6955981, -1.265426, 1, 0, 0, 1, 1,
-0.7559701, 0.7396305, -1.434587, 1, 0, 0, 1, 1,
-0.7519568, -0.1760401, -0.8925916, 1, 0, 0, 1, 1,
-0.7512424, 0.6385373, -1.10165, 1, 0, 0, 1, 1,
-0.7428453, -0.9448639, -2.722091, 0, 0, 0, 1, 1,
-0.741681, -0.2727998, 0.5364322, 0, 0, 0, 1, 1,
-0.741241, 1.06391, -1.686156, 0, 0, 0, 1, 1,
-0.7364373, 0.3100512, -1.218225, 0, 0, 0, 1, 1,
-0.7336063, 1.115316, -1.771614, 0, 0, 0, 1, 1,
-0.7295562, -0.4130122, -0.9077529, 0, 0, 0, 1, 1,
-0.7232473, 0.9984757, 1.264037, 0, 0, 0, 1, 1,
-0.7209378, -0.5101189, -2.347563, 1, 1, 1, 1, 1,
-0.7157686, 0.3504262, 0.5146466, 1, 1, 1, 1, 1,
-0.715073, 0.870044, -1.716449, 1, 1, 1, 1, 1,
-0.7125514, -0.2264832, -2.586771, 1, 1, 1, 1, 1,
-0.7120662, 2.79379, -0.1044898, 1, 1, 1, 1, 1,
-0.7082532, -0.609121, -1.583423, 1, 1, 1, 1, 1,
-0.7063352, -0.9474701, -2.490484, 1, 1, 1, 1, 1,
-0.7002509, -1.141281, -0.974938, 1, 1, 1, 1, 1,
-0.6970508, 0.3394294, -1.364718, 1, 1, 1, 1, 1,
-0.6962128, -1.423383, -4.042918, 1, 1, 1, 1, 1,
-0.6951181, 0.3123522, -0.4641391, 1, 1, 1, 1, 1,
-0.6949601, 0.03414302, -1.215972, 1, 1, 1, 1, 1,
-0.6915096, 0.1444724, 0.05551545, 1, 1, 1, 1, 1,
-0.6884974, 1.331471, -0.01184707, 1, 1, 1, 1, 1,
-0.6784052, 0.9832472, -0.7565351, 1, 1, 1, 1, 1,
-0.6780679, 0.1020242, -1.17435, 0, 0, 1, 1, 1,
-0.6728125, 0.2029142, 0.3567338, 1, 0, 0, 1, 1,
-0.6705345, 0.1454227, -0.5089174, 1, 0, 0, 1, 1,
-0.6693403, 0.8518847, -1.042225, 1, 0, 0, 1, 1,
-0.6675485, -0.08675594, -2.063533, 1, 0, 0, 1, 1,
-0.6674569, 1.63078, -1.052158, 1, 0, 0, 1, 1,
-0.6627758, -0.7368466, -1.864672, 0, 0, 0, 1, 1,
-0.6497482, 0.01510658, -1.591254, 0, 0, 0, 1, 1,
-0.6437739, 0.5911922, -0.5678692, 0, 0, 0, 1, 1,
-0.640601, 0.1442114, -1.513313, 0, 0, 0, 1, 1,
-0.6380863, 0.664518, -1.928433, 0, 0, 0, 1, 1,
-0.6366752, -2.137628, -2.563781, 0, 0, 0, 1, 1,
-0.6341878, 0.1340158, 0.2111859, 0, 0, 0, 1, 1,
-0.6325799, -0.4127934, -3.429894, 1, 1, 1, 1, 1,
-0.6314604, -0.1032352, -1.901179, 1, 1, 1, 1, 1,
-0.6258077, -0.6384305, -2.432162, 1, 1, 1, 1, 1,
-0.6242185, 0.1384553, -2.001179, 1, 1, 1, 1, 1,
-0.6241103, 1.007647, -0.796643, 1, 1, 1, 1, 1,
-0.6227458, -0.05046348, -1.510697, 1, 1, 1, 1, 1,
-0.6191407, -1.075591, -2.91763, 1, 1, 1, 1, 1,
-0.6167709, 1.796636, 0.889222, 1, 1, 1, 1, 1,
-0.6160967, 0.2668611, -1.868976, 1, 1, 1, 1, 1,
-0.6150164, 0.7185609, 0.233135, 1, 1, 1, 1, 1,
-0.5996374, 0.0322046, -1.260886, 1, 1, 1, 1, 1,
-0.586466, 0.2653599, -1.755638, 1, 1, 1, 1, 1,
-0.5838682, 1.301432, -1.663327, 1, 1, 1, 1, 1,
-0.5835137, -1.232179, -2.101746, 1, 1, 1, 1, 1,
-0.5789502, 0.5629701, -1.920245, 1, 1, 1, 1, 1,
-0.5745192, 0.003313996, -0.6160229, 0, 0, 1, 1, 1,
-0.5722387, 0.006936766, -0.2779905, 1, 0, 0, 1, 1,
-0.5717741, 2.625323, 0.1486321, 1, 0, 0, 1, 1,
-0.5713581, 0.8407949, -1.059818, 1, 0, 0, 1, 1,
-0.5685155, 1.005129, 0.1418509, 1, 0, 0, 1, 1,
-0.5637732, -0.1156651, -3.0376, 1, 0, 0, 1, 1,
-0.5632625, -0.1657958, -3.320305, 0, 0, 0, 1, 1,
-0.5572304, 0.8682128, 0.06928551, 0, 0, 0, 1, 1,
-0.5557583, -2.060114, -2.875568, 0, 0, 0, 1, 1,
-0.5502716, -1.18082, -4.221398, 0, 0, 0, 1, 1,
-0.5448866, 1.662918, 0.18845, 0, 0, 0, 1, 1,
-0.5430266, -0.5386485, -2.19735, 0, 0, 0, 1, 1,
-0.5429284, -2.267998, -1.973225, 0, 0, 0, 1, 1,
-0.5396048, -1.780962, -4.644073, 1, 1, 1, 1, 1,
-0.5380513, 0.2825157, -2.342003, 1, 1, 1, 1, 1,
-0.5314448, 0.3697909, -0.7638006, 1, 1, 1, 1, 1,
-0.5303779, 0.8175406, 0.8421084, 1, 1, 1, 1, 1,
-0.5288271, -0.8814994, -2.604642, 1, 1, 1, 1, 1,
-0.5198784, 0.8075113, -0.9289762, 1, 1, 1, 1, 1,
-0.51908, -0.2688596, -2.741604, 1, 1, 1, 1, 1,
-0.5158121, -0.3203821, -0.8635727, 1, 1, 1, 1, 1,
-0.5121073, 0.2005007, -0.4531451, 1, 1, 1, 1, 1,
-0.5111916, -2.606773, -2.132865, 1, 1, 1, 1, 1,
-0.5094088, 0.6057525, -1.451114, 1, 1, 1, 1, 1,
-0.5090235, -0.5344215, -2.445853, 1, 1, 1, 1, 1,
-0.5022582, -0.2601646, -2.051109, 1, 1, 1, 1, 1,
-0.5017589, 0.03952597, -1.673614, 1, 1, 1, 1, 1,
-0.4995216, -0.559962, -4.66982, 1, 1, 1, 1, 1,
-0.498307, -0.1895199, -1.062346, 0, 0, 1, 1, 1,
-0.4951288, -1.114238, -0.8411674, 1, 0, 0, 1, 1,
-0.4909678, -0.02607675, -2.198536, 1, 0, 0, 1, 1,
-0.4893221, 0.5374387, -1.209158, 1, 0, 0, 1, 1,
-0.4883486, -1.944741, -4.567013, 1, 0, 0, 1, 1,
-0.4883432, 0.3006115, -0.08729219, 1, 0, 0, 1, 1,
-0.4867384, 0.1009574, -3.542526, 0, 0, 0, 1, 1,
-0.4857261, 0.209257, -1.275106, 0, 0, 0, 1, 1,
-0.4840042, 0.0990466, -1.499311, 0, 0, 0, 1, 1,
-0.4837488, 0.3460625, -0.8686665, 0, 0, 0, 1, 1,
-0.4769076, 1.162784, -0.6239703, 0, 0, 0, 1, 1,
-0.4734257, 0.6781554, -2.404296, 0, 0, 0, 1, 1,
-0.4721251, 0.3324271, 1.236653, 0, 0, 0, 1, 1,
-0.4689975, 0.4246629, -2.192016, 1, 1, 1, 1, 1,
-0.4649266, 0.557788, 1.219312, 1, 1, 1, 1, 1,
-0.462106, 1.888157, 0.1631212, 1, 1, 1, 1, 1,
-0.4613675, -1.443829, -2.682758, 1, 1, 1, 1, 1,
-0.4582403, -0.6227341, -0.1979136, 1, 1, 1, 1, 1,
-0.4565195, -0.2446154, -2.583488, 1, 1, 1, 1, 1,
-0.4545706, -0.4660565, -2.404325, 1, 1, 1, 1, 1,
-0.4529021, 1.085124, -1.645873, 1, 1, 1, 1, 1,
-0.452407, 0.7093341, -0.0226459, 1, 1, 1, 1, 1,
-0.4471821, -0.2334302, -0.876087, 1, 1, 1, 1, 1,
-0.4471801, 0.2131986, -2.555537, 1, 1, 1, 1, 1,
-0.4416724, 0.2973067, -0.7442861, 1, 1, 1, 1, 1,
-0.4303409, -1.823903, -2.871511, 1, 1, 1, 1, 1,
-0.4247755, 2.367402, -0.432368, 1, 1, 1, 1, 1,
-0.421101, -0.2734601, -1.093108, 1, 1, 1, 1, 1,
-0.4170741, 0.3418684, 1.274817, 0, 0, 1, 1, 1,
-0.4161597, 0.6626069, -0.2571444, 1, 0, 0, 1, 1,
-0.412235, -0.5451954, -1.714537, 1, 0, 0, 1, 1,
-0.4115057, -0.8449597, -1.962436, 1, 0, 0, 1, 1,
-0.4081712, -0.5690348, -0.6338101, 1, 0, 0, 1, 1,
-0.4049582, 0.46837, 0.2260777, 1, 0, 0, 1, 1,
-0.4029979, 0.8457834, -1.769935, 0, 0, 0, 1, 1,
-0.4016157, -0.01533768, -2.84717, 0, 0, 0, 1, 1,
-0.3982096, 1.439834, -1.010618, 0, 0, 0, 1, 1,
-0.3977131, 0.8225913, 0.5300167, 0, 0, 0, 1, 1,
-0.3941701, -0.9924687, -2.049459, 0, 0, 0, 1, 1,
-0.3932897, -0.9222616, -1.190251, 0, 0, 0, 1, 1,
-0.3930688, -0.2297132, -1.057712, 0, 0, 0, 1, 1,
-0.3930198, -0.256094, -3.097769, 1, 1, 1, 1, 1,
-0.3913365, -0.4377703, -2.909335, 1, 1, 1, 1, 1,
-0.3876173, 0.2567335, -2.761215, 1, 1, 1, 1, 1,
-0.3876072, 1.015378, 1.374224, 1, 1, 1, 1, 1,
-0.3842697, 0.6787634, 0.8452531, 1, 1, 1, 1, 1,
-0.3807299, 0.3317741, -1.605445, 1, 1, 1, 1, 1,
-0.3779043, -1.052479, -1.642611, 1, 1, 1, 1, 1,
-0.3752295, -0.2786202, -0.9571861, 1, 1, 1, 1, 1,
-0.3750075, 0.3982029, 0.1164048, 1, 1, 1, 1, 1,
-0.3731485, 2.803179, -0.7168514, 1, 1, 1, 1, 1,
-0.372878, 1.225753, -0.5915129, 1, 1, 1, 1, 1,
-0.3724339, 0.8062271, -0.1863304, 1, 1, 1, 1, 1,
-0.3680531, -0.230894, -2.56408, 1, 1, 1, 1, 1,
-0.3654709, 0.8982207, -1.238104, 1, 1, 1, 1, 1,
-0.3650827, 0.5339099, -0.08652954, 1, 1, 1, 1, 1,
-0.3650065, -0.4240323, -1.51436, 0, 0, 1, 1, 1,
-0.3618236, -0.1357842, -1.825644, 1, 0, 0, 1, 1,
-0.3575477, -1.668852, -1.934519, 1, 0, 0, 1, 1,
-0.3483006, 1.674904, -1.109383, 1, 0, 0, 1, 1,
-0.3435771, 0.04382697, -3.238766, 1, 0, 0, 1, 1,
-0.3395594, -0.8485814, -2.998807, 1, 0, 0, 1, 1,
-0.3347141, 1.0162, 0.1483741, 0, 0, 0, 1, 1,
-0.332696, 1.366788, -0.8920321, 0, 0, 0, 1, 1,
-0.3299526, 0.5598687, 0.575612, 0, 0, 0, 1, 1,
-0.3290392, -1.902219, -3.840407, 0, 0, 0, 1, 1,
-0.3245509, -0.3298026, -3.348033, 0, 0, 0, 1, 1,
-0.3200493, 0.4428584, -0.9252968, 0, 0, 0, 1, 1,
-0.3185235, -0.2417104, -0.6152993, 0, 0, 0, 1, 1,
-0.3144732, -0.09645323, -2.797274, 1, 1, 1, 1, 1,
-0.3139369, 1.505832, 0.5524418, 1, 1, 1, 1, 1,
-0.3132745, 0.2737678, -1.32402, 1, 1, 1, 1, 1,
-0.3130748, -1.514546, -2.681222, 1, 1, 1, 1, 1,
-0.3118421, -1.965789, -4.973987, 1, 1, 1, 1, 1,
-0.3106017, 0.8349835, 1.241126, 1, 1, 1, 1, 1,
-0.3093031, -1.06167, -3.152857, 1, 1, 1, 1, 1,
-0.3072658, 0.9120107, -0.3177392, 1, 1, 1, 1, 1,
-0.3046561, -0.03838033, -1.597926, 1, 1, 1, 1, 1,
-0.3028289, 0.6947607, -2.199491, 1, 1, 1, 1, 1,
-0.3023778, -0.2697452, -2.20463, 1, 1, 1, 1, 1,
-0.301324, 1.150587, -1.261783, 1, 1, 1, 1, 1,
-0.2985039, 0.8487874, 0.6118915, 1, 1, 1, 1, 1,
-0.2956239, -2.473996, -4.105582, 1, 1, 1, 1, 1,
-0.2920847, -0.6390158, -1.942336, 1, 1, 1, 1, 1,
-0.2905773, -1.138513, -4.187296, 0, 0, 1, 1, 1,
-0.2872317, 0.02229928, -2.381464, 1, 0, 0, 1, 1,
-0.2863922, -1.34131, -1.86828, 1, 0, 0, 1, 1,
-0.2863881, 0.1932098, 0.002509928, 1, 0, 0, 1, 1,
-0.278612, 0.4155851, -0.6733528, 1, 0, 0, 1, 1,
-0.2785296, -0.7167039, -0.9403076, 1, 0, 0, 1, 1,
-0.2773894, 0.2926759, 0.5013053, 0, 0, 0, 1, 1,
-0.2773019, -0.5665092, -2.268481, 0, 0, 0, 1, 1,
-0.2768036, -2.719983, -3.710695, 0, 0, 0, 1, 1,
-0.2764115, -1.858782, -2.512357, 0, 0, 0, 1, 1,
-0.2749538, -0.6989958, -2.793723, 0, 0, 0, 1, 1,
-0.2730979, 0.1790073, -2.036857, 0, 0, 0, 1, 1,
-0.2701879, 1.191223, 1.507404, 0, 0, 0, 1, 1,
-0.2603626, -0.06659111, -0.933158, 1, 1, 1, 1, 1,
-0.2570842, 1.641987, -0.2650046, 1, 1, 1, 1, 1,
-0.2552761, -0.8651709, -4.217457, 1, 1, 1, 1, 1,
-0.2509693, -0.7177846, -4.731736, 1, 1, 1, 1, 1,
-0.2488388, -0.7017733, -2.400577, 1, 1, 1, 1, 1,
-0.2473426, 1.154335, 1.017595, 1, 1, 1, 1, 1,
-0.2468457, -0.902528, -4.188697, 1, 1, 1, 1, 1,
-0.2453802, -0.4738226, -2.039817, 1, 1, 1, 1, 1,
-0.2452184, 2.003354, -1.103849, 1, 1, 1, 1, 1,
-0.2420621, 2.054316, -0.8362831, 1, 1, 1, 1, 1,
-0.2419373, 0.3864057, -2.072724, 1, 1, 1, 1, 1,
-0.2398802, 0.5792666, -1.533559, 1, 1, 1, 1, 1,
-0.2388342, 1.198898, -0.9514912, 1, 1, 1, 1, 1,
-0.2365498, -0.6844969, -3.357453, 1, 1, 1, 1, 1,
-0.2350332, -0.785341, -2.509019, 1, 1, 1, 1, 1,
-0.2303992, -0.2350868, -0.986663, 0, 0, 1, 1, 1,
-0.2216296, 0.757359, 0.6310226, 1, 0, 0, 1, 1,
-0.2201202, 0.5351, -2.180363, 1, 0, 0, 1, 1,
-0.2194425, -0.6224924, -1.524184, 1, 0, 0, 1, 1,
-0.2170793, 1.786483, -0.1967752, 1, 0, 0, 1, 1,
-0.2148871, -0.9227543, -2.032784, 1, 0, 0, 1, 1,
-0.2135277, -0.6084082, -2.772312, 0, 0, 0, 1, 1,
-0.2128362, -0.1426922, -1.626282, 0, 0, 0, 1, 1,
-0.2120829, -0.08148278, -0.02252515, 0, 0, 0, 1, 1,
-0.2087776, 1.078967, -1.676082, 0, 0, 0, 1, 1,
-0.2046038, -0.7017264, -1.604263, 0, 0, 0, 1, 1,
-0.2000981, -1.043386, -2.227312, 0, 0, 0, 1, 1,
-0.1998721, -0.03372781, -1.987057, 0, 0, 0, 1, 1,
-0.1973767, -0.2470084, -3.042327, 1, 1, 1, 1, 1,
-0.1965196, 0.9873148, -0.06291128, 1, 1, 1, 1, 1,
-0.1936331, -0.2013603, -1.925255, 1, 1, 1, 1, 1,
-0.1886788, 0.4010496, -0.5466465, 1, 1, 1, 1, 1,
-0.1878405, -0.7025934, -3.95974, 1, 1, 1, 1, 1,
-0.1855986, 0.627938, 0.4412094, 1, 1, 1, 1, 1,
-0.1841137, 0.373876, -0.1626956, 1, 1, 1, 1, 1,
-0.179324, 0.3112674, -0.5206, 1, 1, 1, 1, 1,
-0.179284, 0.6548989, -0.7361076, 1, 1, 1, 1, 1,
-0.1786077, 1.166304, -0.8901796, 1, 1, 1, 1, 1,
-0.1774448, -0.3379979, -3.053256, 1, 1, 1, 1, 1,
-0.1686565, -0.7995408, -2.604583, 1, 1, 1, 1, 1,
-0.16709, -0.2202349, -1.639999, 1, 1, 1, 1, 1,
-0.1641512, 0.01885471, -1.175987, 1, 1, 1, 1, 1,
-0.1637601, 1.287135, 0.4881325, 1, 1, 1, 1, 1,
-0.1594795, 1.117991, -1.058883, 0, 0, 1, 1, 1,
-0.1563831, -2.29688, -3.079411, 1, 0, 0, 1, 1,
-0.1527651, -0.4956055, -3.110734, 1, 0, 0, 1, 1,
-0.1500533, -0.08358338, -2.622788, 1, 0, 0, 1, 1,
-0.1469765, 0.0616692, -0.5232021, 1, 0, 0, 1, 1,
-0.1466269, -0.6910935, -2.450621, 1, 0, 0, 1, 1,
-0.1460202, -0.556961, -2.620921, 0, 0, 0, 1, 1,
-0.1436501, 1.914202, -1.271304, 0, 0, 0, 1, 1,
-0.1430081, 0.1371923, -0.4047202, 0, 0, 0, 1, 1,
-0.1414002, 1.281808, -1.182045, 0, 0, 0, 1, 1,
-0.1374012, -0.7255179, -1.821018, 0, 0, 0, 1, 1,
-0.1285111, 2.312304, -0.9100679, 0, 0, 0, 1, 1,
-0.1261699, 0.5514796, -1.570939, 0, 0, 0, 1, 1,
-0.1260309, -0.4297131, -2.231747, 1, 1, 1, 1, 1,
-0.1253336, -1.522391, -3.273931, 1, 1, 1, 1, 1,
-0.1248206, -0.01717318, -2.011231, 1, 1, 1, 1, 1,
-0.1241986, 0.9327376, 1.656136, 1, 1, 1, 1, 1,
-0.1232779, 0.06660452, -1.601036, 1, 1, 1, 1, 1,
-0.1154769, -0.2507071, -3.82256, 1, 1, 1, 1, 1,
-0.113284, 0.5493284, 0.8396801, 1, 1, 1, 1, 1,
-0.1121073, 0.6212912, 0.6320223, 1, 1, 1, 1, 1,
-0.1114493, -0.649334, -1.669961, 1, 1, 1, 1, 1,
-0.1108883, 0.8325098, 0.210244, 1, 1, 1, 1, 1,
-0.1071367, -0.08600235, -1.444798, 1, 1, 1, 1, 1,
-0.1042185, -0.5751169, -2.979843, 1, 1, 1, 1, 1,
-0.10267, 0.4197691, 1.204169, 1, 1, 1, 1, 1,
-0.1025559, 0.9464794, 0.3969871, 1, 1, 1, 1, 1,
-0.1001871, 0.1397636, -2.232842, 1, 1, 1, 1, 1,
-0.09248534, 0.3928151, -0.6716983, 0, 0, 1, 1, 1,
-0.09227008, 0.4250664, -0.1298149, 1, 0, 0, 1, 1,
-0.09219627, 0.9627298, -0.9614764, 1, 0, 0, 1, 1,
-0.08890897, 1.257971, -0.5804896, 1, 0, 0, 1, 1,
-0.0843718, -0.3744318, -3.96736, 1, 0, 0, 1, 1,
-0.08163659, 0.150475, -0.4962236, 1, 0, 0, 1, 1,
-0.07751314, 0.4262092, -0.650135, 0, 0, 0, 1, 1,
-0.07710008, 0.8933711, -0.2881606, 0, 0, 0, 1, 1,
-0.07609305, 0.3833684, -0.8231115, 0, 0, 0, 1, 1,
-0.07189489, 0.08472726, -1.958965, 0, 0, 0, 1, 1,
-0.07070597, -1.023729, -3.39713, 0, 0, 0, 1, 1,
-0.06925623, -0.6085255, -3.305687, 0, 0, 0, 1, 1,
-0.06844484, 2.083221, 0.2128941, 0, 0, 0, 1, 1,
-0.06651061, -0.4265202, -1.976257, 1, 1, 1, 1, 1,
-0.06582803, -0.6372783, -4.28219, 1, 1, 1, 1, 1,
-0.05971425, -0.3387894, -2.389338, 1, 1, 1, 1, 1,
-0.0588887, 1.509219, -0.4537255, 1, 1, 1, 1, 1,
-0.05871145, -1.585546, -0.7930068, 1, 1, 1, 1, 1,
-0.05863892, 0.6287087, 0.560648, 1, 1, 1, 1, 1,
-0.05709716, -0.4462534, -4.464933, 1, 1, 1, 1, 1,
-0.05653688, -1.274129, -3.515287, 1, 1, 1, 1, 1,
-0.05574159, 1.261178, -0.8159307, 1, 1, 1, 1, 1,
-0.05565907, -0.3010218, -2.090486, 1, 1, 1, 1, 1,
-0.05540816, 0.1931814, 0.5210792, 1, 1, 1, 1, 1,
-0.05409338, 0.781337, 0.94062, 1, 1, 1, 1, 1,
-0.05359155, -0.2331602, -1.309023, 1, 1, 1, 1, 1,
-0.0503435, 1.06199, 0.870965, 1, 1, 1, 1, 1,
-0.04538811, -0.732165, -3.008324, 1, 1, 1, 1, 1,
-0.04341957, -1.351593, -3.233122, 0, 0, 1, 1, 1,
-0.04239843, -0.3271385, -2.304582, 1, 0, 0, 1, 1,
-0.04085413, 0.9363779, 0.06032112, 1, 0, 0, 1, 1,
-0.04061074, -0.1057341, -1.696167, 1, 0, 0, 1, 1,
-0.03557254, -0.3404304, -3.160692, 1, 0, 0, 1, 1,
-0.03390951, 2.258946, 0.6050361, 1, 0, 0, 1, 1,
-0.03112521, -0.5666186, -2.735833, 0, 0, 0, 1, 1,
-0.02928542, 0.1966413, -0.7497091, 0, 0, 0, 1, 1,
-0.02366718, -0.6769636, -3.230327, 0, 0, 0, 1, 1,
-0.0212035, -1.881127, -2.32115, 0, 0, 0, 1, 1,
-0.02051365, 0.415485, -1.058122, 0, 0, 0, 1, 1,
-0.018488, 0.3164095, -0.6645371, 0, 0, 0, 1, 1,
-0.01619835, 0.3261414, -0.08081037, 0, 0, 0, 1, 1,
-0.01590081, 1.149746, 0.63379, 1, 1, 1, 1, 1,
-0.0149498, -0.4942541, -4.420525, 1, 1, 1, 1, 1,
-0.00930116, -0.591482, -3.214089, 1, 1, 1, 1, 1,
-0.007634625, -0.8786485, -2.272992, 1, 1, 1, 1, 1,
-0.006416691, 1.706763, 0.636832, 1, 1, 1, 1, 1,
-0.005267046, 0.7180388, 0.6192741, 1, 1, 1, 1, 1,
0.001209174, 2.444092, 0.1372398, 1, 1, 1, 1, 1,
0.001665157, 0.7182913, -0.6128855, 1, 1, 1, 1, 1,
0.01051187, 1.138041, -1.333477, 1, 1, 1, 1, 1,
0.01235956, -0.1883747, 0.629236, 1, 1, 1, 1, 1,
0.01481205, 0.01519691, -0.3015721, 1, 1, 1, 1, 1,
0.01536261, -1.080029, 3.972654, 1, 1, 1, 1, 1,
0.01827737, -1.00795, 2.908347, 1, 1, 1, 1, 1,
0.02226195, -0.3256135, 5.18081, 1, 1, 1, 1, 1,
0.02436413, 0.3729626, -0.02473002, 1, 1, 1, 1, 1,
0.02502292, 0.1920746, 1.317282, 0, 0, 1, 1, 1,
0.03389919, -2.490532, 2.137688, 1, 0, 0, 1, 1,
0.03535119, -0.5521232, 4.269561, 1, 0, 0, 1, 1,
0.03639861, -0.7791772, 3.648458, 1, 0, 0, 1, 1,
0.03819204, -0.6179518, 4.210155, 1, 0, 0, 1, 1,
0.03955768, 0.3214716, 0.171533, 1, 0, 0, 1, 1,
0.043071, -0.549916, 2.653416, 0, 0, 0, 1, 1,
0.04442242, 0.5416583, -0.456764, 0, 0, 0, 1, 1,
0.04629163, -1.704775, 3.409564, 0, 0, 0, 1, 1,
0.04845734, 0.2695888, -0.9493948, 0, 0, 0, 1, 1,
0.05528421, -0.8241199, 2.598254, 0, 0, 0, 1, 1,
0.05567662, -1.291894, 3.869954, 0, 0, 0, 1, 1,
0.0598598, 0.451333, -0.2488411, 0, 0, 0, 1, 1,
0.06299665, 1.487465, 0.2142353, 1, 1, 1, 1, 1,
0.06325586, 1.021857, 0.3539262, 1, 1, 1, 1, 1,
0.06352212, 1.104728, -0.01924526, 1, 1, 1, 1, 1,
0.06381691, 0.2945979, -0.1490748, 1, 1, 1, 1, 1,
0.06391415, -0.1126148, 2.69908, 1, 1, 1, 1, 1,
0.07303911, -0.481971, 3.069329, 1, 1, 1, 1, 1,
0.0733973, 1.922953, 1.493943, 1, 1, 1, 1, 1,
0.07373609, 0.6274664, 1.917032, 1, 1, 1, 1, 1,
0.07423382, -1.260448, 3.287494, 1, 1, 1, 1, 1,
0.08449125, 0.1349387, 0.2944796, 1, 1, 1, 1, 1,
0.08865244, -0.1233639, 2.573942, 1, 1, 1, 1, 1,
0.08941658, 1.271698, 0.4716555, 1, 1, 1, 1, 1,
0.09418399, 1.129286, -0.1625511, 1, 1, 1, 1, 1,
0.09580895, -0.9141205, 4.573931, 1, 1, 1, 1, 1,
0.09898608, -0.8275439, 2.754352, 1, 1, 1, 1, 1,
0.1052194, 0.1944971, -0.3442974, 0, 0, 1, 1, 1,
0.1060315, -0.9887928, 1.740725, 1, 0, 0, 1, 1,
0.1153533, 0.7441288, -0.8212433, 1, 0, 0, 1, 1,
0.1157193, 0.4255997, 1.992682, 1, 0, 0, 1, 1,
0.1178032, 0.1260087, -0.240943, 1, 0, 0, 1, 1,
0.120251, 0.4189053, 1.622006, 1, 0, 0, 1, 1,
0.1212887, -0.5296425, 4.66405, 0, 0, 0, 1, 1,
0.1223058, 1.232711, 0.3069717, 0, 0, 0, 1, 1,
0.1233368, -0.4548351, 2.213109, 0, 0, 0, 1, 1,
0.1235726, -0.980055, 4.070175, 0, 0, 0, 1, 1,
0.1258981, 0.4203687, 1.795213, 0, 0, 0, 1, 1,
0.1261033, 1.85967, -0.8789914, 0, 0, 0, 1, 1,
0.1269895, 2.436253, 0.3532375, 0, 0, 0, 1, 1,
0.1309646, -0.8899408, 5.750007, 1, 1, 1, 1, 1,
0.1313818, 0.2796428, 0.692615, 1, 1, 1, 1, 1,
0.1330117, -0.2934471, 1.775044, 1, 1, 1, 1, 1,
0.133141, 1.024682, 0.2872114, 1, 1, 1, 1, 1,
0.1356057, 0.5439146, 1.403882, 1, 1, 1, 1, 1,
0.1366661, -0.6448916, 2.762708, 1, 1, 1, 1, 1,
0.1374549, 0.4092377, 0.6572004, 1, 1, 1, 1, 1,
0.1381575, 0.1685129, -0.8165436, 1, 1, 1, 1, 1,
0.1421437, 0.36278, 1.739557, 1, 1, 1, 1, 1,
0.1428554, 2.177341, 0.298202, 1, 1, 1, 1, 1,
0.1438194, 1.853141, -1.579944, 1, 1, 1, 1, 1,
0.1483719, -0.004134615, 2.265037, 1, 1, 1, 1, 1,
0.1488466, -1.512046, 2.669067, 1, 1, 1, 1, 1,
0.1493922, 0.6778209, -0.1611221, 1, 1, 1, 1, 1,
0.1528056, 1.077646, 0.5486422, 1, 1, 1, 1, 1,
0.1533059, -0.9736457, 0.6350307, 0, 0, 1, 1, 1,
0.1541455, 0.5825321, 0.6043517, 1, 0, 0, 1, 1,
0.1553754, 0.8585984, 0.5748352, 1, 0, 0, 1, 1,
0.1561185, -1.477729, 2.259018, 1, 0, 0, 1, 1,
0.1571514, 2.822527, -0.6170633, 1, 0, 0, 1, 1,
0.1573069, 0.319271, -0.5087358, 1, 0, 0, 1, 1,
0.1590512, 0.6959335, 1.387188, 0, 0, 0, 1, 1,
0.1622671, -1.219495, 1.987737, 0, 0, 0, 1, 1,
0.1642556, 0.01904363, 0.4940928, 0, 0, 0, 1, 1,
0.1672297, -0.02789592, 1.923368, 0, 0, 0, 1, 1,
0.1690671, 1.288131, 0.02842997, 0, 0, 0, 1, 1,
0.1731081, 0.9068, 0.8449637, 0, 0, 0, 1, 1,
0.1734879, 0.2498185, 1.784942, 0, 0, 0, 1, 1,
0.1771137, 0.6101465, 0.7603698, 1, 1, 1, 1, 1,
0.1806319, 1.822802, 1.03946, 1, 1, 1, 1, 1,
0.1869813, -0.6495419, 4.128353, 1, 1, 1, 1, 1,
0.1871744, 0.04422551, 0.5186484, 1, 1, 1, 1, 1,
0.1873553, 1.265224, 2.219044, 1, 1, 1, 1, 1,
0.1900224, -1.307592, 2.446012, 1, 1, 1, 1, 1,
0.1930546, -0.7729838, 2.480148, 1, 1, 1, 1, 1,
0.193209, -2.261764, 2.1348, 1, 1, 1, 1, 1,
0.1982567, -1.844345, 2.788558, 1, 1, 1, 1, 1,
0.2004021, -0.3931029, 1.91332, 1, 1, 1, 1, 1,
0.2011829, -0.08111876, 2.338757, 1, 1, 1, 1, 1,
0.204245, 1.156931, -1.19768, 1, 1, 1, 1, 1,
0.2075553, -1.030101, 4.196352, 1, 1, 1, 1, 1,
0.21036, -0.5210959, 1.733367, 1, 1, 1, 1, 1,
0.2196138, 2.565863, 0.9873879, 1, 1, 1, 1, 1,
0.2229802, -0.1018675, 1.01653, 0, 0, 1, 1, 1,
0.2238624, -1.050808, 3.557776, 1, 0, 0, 1, 1,
0.2244819, -2.215422, 4.922883, 1, 0, 0, 1, 1,
0.2247445, 0.1441482, 0.4505358, 1, 0, 0, 1, 1,
0.2257887, 1.040816, -1.153985, 1, 0, 0, 1, 1,
0.2285402, 2.174946, 0.1634085, 1, 0, 0, 1, 1,
0.230186, 0.4839794, 3.187047, 0, 0, 0, 1, 1,
0.231209, 0.414929, -0.0928413, 0, 0, 0, 1, 1,
0.2355612, 1.332778, 0.5368434, 0, 0, 0, 1, 1,
0.2386535, 1.050285, 0.9462557, 0, 0, 0, 1, 1,
0.2403395, -2.6974, 3.392095, 0, 0, 0, 1, 1,
0.2409508, -0.1475191, 3.019338, 0, 0, 0, 1, 1,
0.2414625, -2.080639, 2.338964, 0, 0, 0, 1, 1,
0.2434384, 1.470739, 0.2786863, 1, 1, 1, 1, 1,
0.24901, -0.5202057, 1.97079, 1, 1, 1, 1, 1,
0.2501876, -1.571506, 2.463488, 1, 1, 1, 1, 1,
0.2515151, -0.4567961, 3.563483, 1, 1, 1, 1, 1,
0.2549728, 1.044667, -1.380345, 1, 1, 1, 1, 1,
0.2579409, 0.6555597, 0.6753986, 1, 1, 1, 1, 1,
0.2581485, 0.6751345, 0.3807011, 1, 1, 1, 1, 1,
0.2633191, 1.848813, -0.8230205, 1, 1, 1, 1, 1,
0.2661189, 0.6755432, 1.56453, 1, 1, 1, 1, 1,
0.2711222, 0.2651845, 1.141074, 1, 1, 1, 1, 1,
0.2727351, -0.1420449, 2.494976, 1, 1, 1, 1, 1,
0.2758274, 0.8434126, 1.860993, 1, 1, 1, 1, 1,
0.2769002, -0.9266975, 2.288913, 1, 1, 1, 1, 1,
0.2784252, -0.4965452, 3.298703, 1, 1, 1, 1, 1,
0.2792889, 0.8991892, 0.2223932, 1, 1, 1, 1, 1,
0.2808377, 0.2604313, -0.3762889, 0, 0, 1, 1, 1,
0.2853734, -2.248966, 1.91141, 1, 0, 0, 1, 1,
0.2860136, 0.4376032, -0.3448243, 1, 0, 0, 1, 1,
0.2882408, -0.7835092, 2.535623, 1, 0, 0, 1, 1,
0.2900027, 1.739125, 1.569932, 1, 0, 0, 1, 1,
0.2937072, -0.4820009, 2.152194, 1, 0, 0, 1, 1,
0.3006506, -1.25664, 1.570305, 0, 0, 0, 1, 1,
0.3012238, -1.81471, 2.811938, 0, 0, 0, 1, 1,
0.3066436, -0.4286581, 1.383722, 0, 0, 0, 1, 1,
0.3069575, 0.2796528, 2.892941, 0, 0, 0, 1, 1,
0.3077317, -0.740051, 4.497743, 0, 0, 0, 1, 1,
0.3144579, 0.07558503, 1.867646, 0, 0, 0, 1, 1,
0.3167595, -0.9320686, 2.461035, 0, 0, 0, 1, 1,
0.3196047, -0.09923196, 3.589932, 1, 1, 1, 1, 1,
0.3220423, -1.105231, 2.49156, 1, 1, 1, 1, 1,
0.325678, 2.331266, 0.6305816, 1, 1, 1, 1, 1,
0.3288486, -0.1928719, 0.5661229, 1, 1, 1, 1, 1,
0.3298517, -0.8298103, 2.024072, 1, 1, 1, 1, 1,
0.3360768, 0.196842, 0.6607469, 1, 1, 1, 1, 1,
0.3381542, 1.35486, 2.932994, 1, 1, 1, 1, 1,
0.3397032, 0.04458005, 0.8668065, 1, 1, 1, 1, 1,
0.3440953, -0.9979087, 3.344678, 1, 1, 1, 1, 1,
0.3494129, -0.1684194, 1.895963, 1, 1, 1, 1, 1,
0.3523789, -1.42946, 2.386074, 1, 1, 1, 1, 1,
0.3524605, -1.363791, 2.72128, 1, 1, 1, 1, 1,
0.3549054, -0.4591032, 1.610279, 1, 1, 1, 1, 1,
0.3549978, -0.5422659, 1.192518, 1, 1, 1, 1, 1,
0.3573988, -0.3085722, 2.484109, 1, 1, 1, 1, 1,
0.3682292, 1.278377, 0.1044639, 0, 0, 1, 1, 1,
0.3716687, -0.3671531, 2.9553, 1, 0, 0, 1, 1,
0.3770121, 0.9579121, 0.5294725, 1, 0, 0, 1, 1,
0.3786103, -2.325773, 3.536483, 1, 0, 0, 1, 1,
0.3788736, 0.9503787, 1.407363, 1, 0, 0, 1, 1,
0.379597, 0.2794231, -0.9921447, 1, 0, 0, 1, 1,
0.3873752, -0.7607737, 3.653121, 0, 0, 0, 1, 1,
0.3889049, -0.2306081, -0.325024, 0, 0, 0, 1, 1,
0.3903769, -0.9996831, 2.237062, 0, 0, 0, 1, 1,
0.3954464, 0.1140529, 2.815026, 0, 0, 0, 1, 1,
0.398819, 0.2500159, 0.5117137, 0, 0, 0, 1, 1,
0.4055309, 0.2340618, 2.027914, 0, 0, 0, 1, 1,
0.414159, -0.1559861, 2.381754, 0, 0, 0, 1, 1,
0.4147233, 1.231232, 1.112131, 1, 1, 1, 1, 1,
0.4175166, 0.4334496, 0.6045036, 1, 1, 1, 1, 1,
0.4201741, -0.3167196, 1.958061, 1, 1, 1, 1, 1,
0.4207897, 0.4260405, 0.5987917, 1, 1, 1, 1, 1,
0.4223598, -0.5409043, 2.512446, 1, 1, 1, 1, 1,
0.424377, 0.3212345, 1.867163, 1, 1, 1, 1, 1,
0.4309782, -1.258764, 3.006952, 1, 1, 1, 1, 1,
0.4323991, -0.9451219, 1.814285, 1, 1, 1, 1, 1,
0.4325234, -0.3955176, 1.221845, 1, 1, 1, 1, 1,
0.4347264, -0.4900524, 4.062162, 1, 1, 1, 1, 1,
0.4392455, -0.8188158, 1.752684, 1, 1, 1, 1, 1,
0.44054, 0.7375782, 0.06145401, 1, 1, 1, 1, 1,
0.4418842, 0.9198194, 1.279602, 1, 1, 1, 1, 1,
0.4430664, -0.6485831, 2.571494, 1, 1, 1, 1, 1,
0.4459331, -1.680999, 2.214595, 1, 1, 1, 1, 1,
0.4474183, -1.695624, 1.409159, 0, 0, 1, 1, 1,
0.4479702, 1.415716, -0.5663055, 1, 0, 0, 1, 1,
0.4482745, -0.1583886, 2.32707, 1, 0, 0, 1, 1,
0.4490383, 1.745149, 0.7567011, 1, 0, 0, 1, 1,
0.4515312, -0.9819819, 4.352564, 1, 0, 0, 1, 1,
0.4541345, -1.300687, 3.198843, 1, 0, 0, 1, 1,
0.4570608, -0.7719352, 2.246644, 0, 0, 0, 1, 1,
0.4578562, -0.6730055, 1.645726, 0, 0, 0, 1, 1,
0.4602626, -0.4072368, 2.782495, 0, 0, 0, 1, 1,
0.4630052, 0.7968175, 0.6518078, 0, 0, 0, 1, 1,
0.4652426, -0.9517659, 0.7074733, 0, 0, 0, 1, 1,
0.4684982, -0.4834981, 2.564282, 0, 0, 0, 1, 1,
0.4702016, 0.3084966, -0.5496603, 0, 0, 0, 1, 1,
0.4715831, 0.5236071, 0.516644, 1, 1, 1, 1, 1,
0.4757104, 0.7722017, -1.549426, 1, 1, 1, 1, 1,
0.4805886, -0.2493762, 0.1262845, 1, 1, 1, 1, 1,
0.4836834, -0.6802505, 2.758266, 1, 1, 1, 1, 1,
0.4868203, -0.05901682, 2.64504, 1, 1, 1, 1, 1,
0.4882174, 0.3053907, 1.173505, 1, 1, 1, 1, 1,
0.5042076, -2.82855, 2.523562, 1, 1, 1, 1, 1,
0.5047714, 0.2099424, 1.783531, 1, 1, 1, 1, 1,
0.506455, 0.1779926, 0.1192804, 1, 1, 1, 1, 1,
0.5080947, 0.003538691, 2.19583, 1, 1, 1, 1, 1,
0.5084929, 0.127592, 2.532232, 1, 1, 1, 1, 1,
0.5145348, -0.4940607, 2.273385, 1, 1, 1, 1, 1,
0.5149875, 0.814629, -1.981413, 1, 1, 1, 1, 1,
0.5158827, 0.2926507, 0.9344557, 1, 1, 1, 1, 1,
0.5252897, -0.8787462, 2.684255, 1, 1, 1, 1, 1,
0.5292562, -1.001463, 1.843016, 0, 0, 1, 1, 1,
0.531572, 0.07515986, 0.3244626, 1, 0, 0, 1, 1,
0.5368664, -0.6344129, 2.857693, 1, 0, 0, 1, 1,
0.5384493, 0.7998962, 0.9398064, 1, 0, 0, 1, 1,
0.5384998, 0.9266863, 0.4510785, 1, 0, 0, 1, 1,
0.5396307, 0.7366977, 0.9773629, 1, 0, 0, 1, 1,
0.5400924, -1.069688, 3.400977, 0, 0, 0, 1, 1,
0.5403752, 1.418979, 1.497442, 0, 0, 0, 1, 1,
0.5430502, -0.3236553, 3.438632, 0, 0, 0, 1, 1,
0.5502635, -1.710263, 1.457733, 0, 0, 0, 1, 1,
0.5504465, -0.4212693, 3.960974, 0, 0, 0, 1, 1,
0.5506637, -0.153454, 4.099151, 0, 0, 0, 1, 1,
0.5513566, -0.1468843, 1.768161, 0, 0, 0, 1, 1,
0.5532167, -0.9621149, 4.249098, 1, 1, 1, 1, 1,
0.555839, -1.180567, 2.984263, 1, 1, 1, 1, 1,
0.5659896, -0.4454696, 0.6114751, 1, 1, 1, 1, 1,
0.5688602, -1.305291, 3.552034, 1, 1, 1, 1, 1,
0.5706058, 1.364698, -0.06870178, 1, 1, 1, 1, 1,
0.5727667, -1.909588, 3.397992, 1, 1, 1, 1, 1,
0.5782965, -0.2762272, 2.978817, 1, 1, 1, 1, 1,
0.5805765, -1.609939, 2.656339, 1, 1, 1, 1, 1,
0.5826026, -1.384297, 1.327235, 1, 1, 1, 1, 1,
0.582709, 1.460124, 0.9778825, 1, 1, 1, 1, 1,
0.5842712, 0.5608884, 0.2407668, 1, 1, 1, 1, 1,
0.5940906, -1.377882, 2.134924, 1, 1, 1, 1, 1,
0.5966287, 0.02241826, 0.1565711, 1, 1, 1, 1, 1,
0.5980141, -0.7574773, 2.177809, 1, 1, 1, 1, 1,
0.5996291, -0.2199243, 2.644453, 1, 1, 1, 1, 1,
0.6021949, -1.982878, 2.043245, 0, 0, 1, 1, 1,
0.6024302, 0.08799758, 1.306225, 1, 0, 0, 1, 1,
0.603, 1.510824, 1.125265, 1, 0, 0, 1, 1,
0.6098322, 0.9553469, 0.8457478, 1, 0, 0, 1, 1,
0.6099538, 0.0224287, 0.974226, 1, 0, 0, 1, 1,
0.6128091, 2.80826, -1.047444, 1, 0, 0, 1, 1,
0.614687, 0.6685714, 0.6029832, 0, 0, 0, 1, 1,
0.6180785, 1.42331, 0.3892716, 0, 0, 0, 1, 1,
0.6182129, -1.057936, 1.866527, 0, 0, 0, 1, 1,
0.6188765, -0.8625551, 3.157552, 0, 0, 0, 1, 1,
0.6195865, -0.3259851, 2.556801, 0, 0, 0, 1, 1,
0.6274638, 1.11034, -0.6985551, 0, 0, 0, 1, 1,
0.6292518, 1.29071, 0.8841525, 0, 0, 0, 1, 1,
0.6334697, 0.0526741, 1.316494, 1, 1, 1, 1, 1,
0.6358056, -1.495819, 2.181122, 1, 1, 1, 1, 1,
0.6362297, 0.338955, 1.252014, 1, 1, 1, 1, 1,
0.636804, 2.551968, -2.195458, 1, 1, 1, 1, 1,
0.6452278, 0.1523114, -0.2390559, 1, 1, 1, 1, 1,
0.6453797, -2.062905, 2.427033, 1, 1, 1, 1, 1,
0.6554362, -0.7801059, 3.198198, 1, 1, 1, 1, 1,
0.6569784, 0.8485138, 1.447603, 1, 1, 1, 1, 1,
0.6668179, 1.729964, 0.1940039, 1, 1, 1, 1, 1,
0.6693083, -1.132391, 2.6647, 1, 1, 1, 1, 1,
0.6779093, 0.591931, -1.11403, 1, 1, 1, 1, 1,
0.6803543, -0.1031553, 1.49637, 1, 1, 1, 1, 1,
0.6858444, 0.1994037, 0.2893405, 1, 1, 1, 1, 1,
0.6860181, 0.2995591, -0.751504, 1, 1, 1, 1, 1,
0.6867375, 0.1148374, 1.197833, 1, 1, 1, 1, 1,
0.6868775, -1.038595, 2.214991, 0, 0, 1, 1, 1,
0.6872911, -2.146008, 2.410593, 1, 0, 0, 1, 1,
0.6921678, 1.927304, -0.568696, 1, 0, 0, 1, 1,
0.6955834, 1.880289, -0.8793232, 1, 0, 0, 1, 1,
0.7015576, -0.9473364, 1.909848, 1, 0, 0, 1, 1,
0.7019464, -0.4778043, 2.33615, 1, 0, 0, 1, 1,
0.7044223, 0.2828687, 0.1695576, 0, 0, 0, 1, 1,
0.716104, 0.4712802, -1.012126, 0, 0, 0, 1, 1,
0.7163315, -0.5463418, 1.77026, 0, 0, 0, 1, 1,
0.7255741, 1.735805, 0.8804315, 0, 0, 0, 1, 1,
0.7300974, 1.244089, 0.2172602, 0, 0, 0, 1, 1,
0.7321754, 0.6379176, -0.6429173, 0, 0, 0, 1, 1,
0.7323968, 1.244482, 0.5048089, 0, 0, 0, 1, 1,
0.7344795, -0.05827888, 1.451444, 1, 1, 1, 1, 1,
0.7345061, 0.5832376, -0.1742324, 1, 1, 1, 1, 1,
0.7360915, -0.004097553, 1.572406, 1, 1, 1, 1, 1,
0.7378671, -0.7102915, 1.353168, 1, 1, 1, 1, 1,
0.7426301, -0.1770343, 2.847996, 1, 1, 1, 1, 1,
0.7433315, 0.8424887, -0.3152357, 1, 1, 1, 1, 1,
0.7443655, -0.5381874, 2.856429, 1, 1, 1, 1, 1,
0.7485402, -1.752194, 2.95982, 1, 1, 1, 1, 1,
0.7488683, 2.024887, -0.7651076, 1, 1, 1, 1, 1,
0.7503229, 1.149676, -0.632543, 1, 1, 1, 1, 1,
0.7536667, -1.005872, 2.48455, 1, 1, 1, 1, 1,
0.7639602, -0.702293, 3.035382, 1, 1, 1, 1, 1,
0.7653298, 2.328955, -0.01825054, 1, 1, 1, 1, 1,
0.7689291, -0.4066446, 2.491824, 1, 1, 1, 1, 1,
0.7739006, 0.1398735, 0.2234115, 1, 1, 1, 1, 1,
0.7745929, -0.2989797, 1.785833, 0, 0, 1, 1, 1,
0.7746733, 0.6871586, 1.2613, 1, 0, 0, 1, 1,
0.7753171, -0.7668204, 0.8422112, 1, 0, 0, 1, 1,
0.7814778, -0.1334197, 2.149154, 1, 0, 0, 1, 1,
0.7831134, 1.576257, -0.2058538, 1, 0, 0, 1, 1,
0.7895906, 0.2480956, 1.706367, 1, 0, 0, 1, 1,
0.7903783, 0.6819116, -0.2708273, 0, 0, 0, 1, 1,
0.7914172, 1.847111, 2.411776, 0, 0, 0, 1, 1,
0.8047631, -0.0737243, 1.111347, 0, 0, 0, 1, 1,
0.8114523, 0.6140312, 0.2094863, 0, 0, 0, 1, 1,
0.8122054, -0.321639, 1.307505, 0, 0, 0, 1, 1,
0.8166208, 0.6649571, 2.011176, 0, 0, 0, 1, 1,
0.8175215, 0.3336872, 0.3318934, 0, 0, 0, 1, 1,
0.8202246, -1.602458, 3.270206, 1, 1, 1, 1, 1,
0.8211747, 1.143219, 0.9507324, 1, 1, 1, 1, 1,
0.8215888, -1.01026, 2.807335, 1, 1, 1, 1, 1,
0.8232635, 0.06879155, 2.426758, 1, 1, 1, 1, 1,
0.8274472, -0.6118363, 1.389522, 1, 1, 1, 1, 1,
0.8300081, 1.494848, 2.265252, 1, 1, 1, 1, 1,
0.842675, 0.9381182, 0.9035056, 1, 1, 1, 1, 1,
0.8465031, 1.43184, -0.617107, 1, 1, 1, 1, 1,
0.8618358, -0.3078322, 2.770809, 1, 1, 1, 1, 1,
0.8680159, 0.8613433, 1.35556, 1, 1, 1, 1, 1,
0.8722854, 0.168191, 2.645654, 1, 1, 1, 1, 1,
0.8764009, 0.5784495, -1.451329, 1, 1, 1, 1, 1,
0.8791561, -1.755369, 3.560939, 1, 1, 1, 1, 1,
0.8835814, -1.880956, 3.790703, 1, 1, 1, 1, 1,
0.884544, 0.862097, 0.7384559, 1, 1, 1, 1, 1,
0.8958378, -0.821716, 2.336806, 0, 0, 1, 1, 1,
0.9062042, 1.039277, 0.02655456, 1, 0, 0, 1, 1,
0.9078791, -0.4650078, 2.122705, 1, 0, 0, 1, 1,
0.9122661, -1.476387, 2.504372, 1, 0, 0, 1, 1,
0.9153669, 1.173305, 0.6073637, 1, 0, 0, 1, 1,
0.9189216, 0.3148238, 1.528257, 1, 0, 0, 1, 1,
0.9230246, -0.7262462, 3.257309, 0, 0, 0, 1, 1,
0.9265236, -1.16018, 3.454008, 0, 0, 0, 1, 1,
0.9276252, 0.927939, 0.8702669, 0, 0, 0, 1, 1,
0.9294253, -0.4392238, 2.394932, 0, 0, 0, 1, 1,
0.9319076, -0.353718, 1.975882, 0, 0, 0, 1, 1,
0.9320343, 1.346287, 0.1039009, 0, 0, 0, 1, 1,
0.9334671, -1.243932, 1.434416, 0, 0, 0, 1, 1,
0.9348534, -0.4701973, 3.117579, 1, 1, 1, 1, 1,
0.9351436, 0.2747476, 2.865666, 1, 1, 1, 1, 1,
0.9404156, 0.1470501, 1.773097, 1, 1, 1, 1, 1,
0.9437084, 0.06856041, 3.638991, 1, 1, 1, 1, 1,
0.946054, 0.5852664, 0.4097862, 1, 1, 1, 1, 1,
0.9491783, -0.5936387, 1.880059, 1, 1, 1, 1, 1,
0.9494838, -0.9110722, 2.306953, 1, 1, 1, 1, 1,
0.9566484, -0.5448613, 1.449759, 1, 1, 1, 1, 1,
0.9573787, -0.3235999, 2.212988, 1, 1, 1, 1, 1,
0.9635651, 0.8740676, 1.924013, 1, 1, 1, 1, 1,
0.9640139, 0.7470275, 0.9800817, 1, 1, 1, 1, 1,
0.9682295, -0.09662844, 2.019284, 1, 1, 1, 1, 1,
0.969663, 0.06687754, 0.5600287, 1, 1, 1, 1, 1,
0.9733291, 1.175844, -0.5325232, 1, 1, 1, 1, 1,
0.9748861, 0.4207993, -0.5248973, 1, 1, 1, 1, 1,
0.9823902, 1.286294, -0.6726747, 0, 0, 1, 1, 1,
0.9875973, -1.372953, 2.815883, 1, 0, 0, 1, 1,
0.9888518, -0.8377269, 3.999404, 1, 0, 0, 1, 1,
0.992371, 0.6987123, 2.737299, 1, 0, 0, 1, 1,
0.9924473, -1.030158, 2.323677, 1, 0, 0, 1, 1,
0.9952428, -0.4395951, 2.145804, 1, 0, 0, 1, 1,
1.004373, -1.178901, 2.265589, 0, 0, 0, 1, 1,
1.008521, -0.08073968, 3.263469, 0, 0, 0, 1, 1,
1.012526, 0.6699963, 1.628893, 0, 0, 0, 1, 1,
1.014691, -0.3709419, 2.228487, 0, 0, 0, 1, 1,
1.015685, -0.06360027, 3.839253, 0, 0, 0, 1, 1,
1.020965, -0.5996313, 2.191909, 0, 0, 0, 1, 1,
1.0215, 0.9795731, 0.3790466, 0, 0, 0, 1, 1,
1.023882, -1.461449, 2.347927, 1, 1, 1, 1, 1,
1.031577, 1.706331, 0.7277531, 1, 1, 1, 1, 1,
1.032135, 0.5718167, 0.3675262, 1, 1, 1, 1, 1,
1.032609, -0.3683727, 2.811404, 1, 1, 1, 1, 1,
1.04393, 0.2761319, 1.396873, 1, 1, 1, 1, 1,
1.051793, 0.2825499, 0.7488387, 1, 1, 1, 1, 1,
1.057309, 0.03057847, 2.795168, 1, 1, 1, 1, 1,
1.068091, 1.825059, 1.593109, 1, 1, 1, 1, 1,
1.073374, 1.974599, -0.07677698, 1, 1, 1, 1, 1,
1.083585, -0.057478, 0.7187014, 1, 1, 1, 1, 1,
1.103136, 1.866482, 0.3602687, 1, 1, 1, 1, 1,
1.106699, -1.45558, 3.320666, 1, 1, 1, 1, 1,
1.107361, -0.7508405, 0.9556361, 1, 1, 1, 1, 1,
1.111755, -0.3959006, 3.548981, 1, 1, 1, 1, 1,
1.117485, 1.180261, 2.49991, 1, 1, 1, 1, 1,
1.119543, 1.522682, 2.485271, 0, 0, 1, 1, 1,
1.120225, -1.004893, 2.219417, 1, 0, 0, 1, 1,
1.13017, -1.210819, 1.451407, 1, 0, 0, 1, 1,
1.134594, 1.046711, 1.225764, 1, 0, 0, 1, 1,
1.136466, -0.9369141, 2.710656, 1, 0, 0, 1, 1,
1.137055, 2.720292, 1.145443, 1, 0, 0, 1, 1,
1.140624, 0.8458084, 2.183661, 0, 0, 0, 1, 1,
1.145902, -1.30543, 4.355893, 0, 0, 0, 1, 1,
1.159884, 0.4713082, 1.540605, 0, 0, 0, 1, 1,
1.165693, 0.4862284, 1.930687, 0, 0, 0, 1, 1,
1.166081, -0.2255141, 0.8187222, 0, 0, 0, 1, 1,
1.174297, -0.02638403, 0.1362995, 0, 0, 0, 1, 1,
1.18501, 1.419084, 1.121952, 0, 0, 0, 1, 1,
1.185242, -0.2658813, 2.848624, 1, 1, 1, 1, 1,
1.188814, -0.3701158, 4.09864, 1, 1, 1, 1, 1,
1.192732, 0.563876, 1.372868, 1, 1, 1, 1, 1,
1.193086, -1.244538, 2.598686, 1, 1, 1, 1, 1,
1.199294, -1.126577, 3.537414, 1, 1, 1, 1, 1,
1.205043, 0.4248736, 0.634286, 1, 1, 1, 1, 1,
1.211738, 0.8262704, -0.6191427, 1, 1, 1, 1, 1,
1.217451, 2.295552, -0.5016726, 1, 1, 1, 1, 1,
1.218262, -3.033837, 2.536764, 1, 1, 1, 1, 1,
1.221834, 2.00215, 0.4431304, 1, 1, 1, 1, 1,
1.237432, 0.267488, 0.2468964, 1, 1, 1, 1, 1,
1.239322, 0.683949, 1.543049, 1, 1, 1, 1, 1,
1.245763, 0.1302134, 0.02021068, 1, 1, 1, 1, 1,
1.251732, 2.602602, 0.2138616, 1, 1, 1, 1, 1,
1.252967, -2.104123, 2.209913, 1, 1, 1, 1, 1,
1.257942, 0.2104597, 1.182438, 0, 0, 1, 1, 1,
1.26595, 0.7472169, 1.4001, 1, 0, 0, 1, 1,
1.2757, -0.1608423, -0.8356742, 1, 0, 0, 1, 1,
1.276026, -0.9482691, 1.639201, 1, 0, 0, 1, 1,
1.283702, 0.6419869, 1.753703, 1, 0, 0, 1, 1,
1.297514, -2.015123, 3.203736, 1, 0, 0, 1, 1,
1.29992, 1.074932, 1.74383, 0, 0, 0, 1, 1,
1.301046, -1.402378, 2.886436, 0, 0, 0, 1, 1,
1.307283, -0.8419906, -0.04061476, 0, 0, 0, 1, 1,
1.323051, -0.5967755, 2.421615, 0, 0, 0, 1, 1,
1.345172, -0.2809119, 2.47168, 0, 0, 0, 1, 1,
1.350073, 1.681767, 1.419166, 0, 0, 0, 1, 1,
1.350147, 0.6785117, 0.8735715, 0, 0, 0, 1, 1,
1.351382, -1.54963, 1.567076, 1, 1, 1, 1, 1,
1.354212, 0.613002, 1.53027, 1, 1, 1, 1, 1,
1.355883, -0.7354982, 1.753893, 1, 1, 1, 1, 1,
1.357987, 0.08852816, 1.74812, 1, 1, 1, 1, 1,
1.358416, 1.501195, 0.4932306, 1, 1, 1, 1, 1,
1.363698, 1.344503, 0.842595, 1, 1, 1, 1, 1,
1.371142, -0.4166312, 1.027503, 1, 1, 1, 1, 1,
1.371717, 0.7463895, 0.7272438, 1, 1, 1, 1, 1,
1.379698, 0.4647385, 2.50296, 1, 1, 1, 1, 1,
1.393033, -1.751383, 3.062652, 1, 1, 1, 1, 1,
1.393051, -0.1727491, 1.09108, 1, 1, 1, 1, 1,
1.396247, -0.164525, 1.855731, 1, 1, 1, 1, 1,
1.402569, -0.9135896, 2.142891, 1, 1, 1, 1, 1,
1.40554, 0.1800741, 0.8437996, 1, 1, 1, 1, 1,
1.405999, 0.5373083, 0.5202991, 1, 1, 1, 1, 1,
1.413722, -1.284541, 3.190258, 0, 0, 1, 1, 1,
1.422515, -0.716024, -0.472358, 1, 0, 0, 1, 1,
1.44462, -0.1671368, 1.472776, 1, 0, 0, 1, 1,
1.458671, 0.1329722, 2.03826, 1, 0, 0, 1, 1,
1.462301, -0.3041395, -0.16563, 1, 0, 0, 1, 1,
1.470101, 0.9198002, 0.6684015, 1, 0, 0, 1, 1,
1.475972, 0.6469538, -0.1471413, 0, 0, 0, 1, 1,
1.495257, -0.706942, 1.920268, 0, 0, 0, 1, 1,
1.498756, -0.5336246, 3.145024, 0, 0, 0, 1, 1,
1.505149, 0.6146501, -0.3057165, 0, 0, 0, 1, 1,
1.50568, 1.429716, 1.037423, 0, 0, 0, 1, 1,
1.516595, -0.1368523, 1.114102, 0, 0, 0, 1, 1,
1.52331, 0.8318482, 0.7516342, 0, 0, 0, 1, 1,
1.536017, 1.435267, 2.52408, 1, 1, 1, 1, 1,
1.551534, -1.614157, 2.667005, 1, 1, 1, 1, 1,
1.555631, -0.2144215, 2.00002, 1, 1, 1, 1, 1,
1.555941, 0.4003996, 2.366179, 1, 1, 1, 1, 1,
1.559069, -1.546646, 3.110891, 1, 1, 1, 1, 1,
1.577873, -1.309828, 2.910266, 1, 1, 1, 1, 1,
1.587792, -1.180021, 0.1585511, 1, 1, 1, 1, 1,
1.591552, -1.043833, 2.839665, 1, 1, 1, 1, 1,
1.593861, 0.4494965, 1.863808, 1, 1, 1, 1, 1,
1.60721, 0.2559464, 1.546512, 1, 1, 1, 1, 1,
1.607529, -0.3257, 1.164032, 1, 1, 1, 1, 1,
1.607623, 0.6005528, 0.4672225, 1, 1, 1, 1, 1,
1.617111, 1.064106, 1.069663, 1, 1, 1, 1, 1,
1.629423, 0.2716444, 1.000225, 1, 1, 1, 1, 1,
1.633802, -2.256938, 3.485779, 1, 1, 1, 1, 1,
1.642209, -1.822093, 2.19227, 0, 0, 1, 1, 1,
1.648821, 0.4371356, 1.613169, 1, 0, 0, 1, 1,
1.688333, -0.741917, 2.596755, 1, 0, 0, 1, 1,
1.71225, 0.1255001, 1.2671, 1, 0, 0, 1, 1,
1.726033, -0.8169108, 4.167901, 1, 0, 0, 1, 1,
1.728875, 0.7598297, 0.3890792, 1, 0, 0, 1, 1,
1.734026, 1.095909, 1.08253, 0, 0, 0, 1, 1,
1.735734, -0.9627607, 0.9499264, 0, 0, 0, 1, 1,
1.770803, 0.0009450702, 2.249816, 0, 0, 0, 1, 1,
1.806361, 0.526323, 1.841552, 0, 0, 0, 1, 1,
1.825849, 1.146769, -0.2336318, 0, 0, 0, 1, 1,
1.827478, 1.072155, 0.7251697, 0, 0, 0, 1, 1,
1.843261, -1.015249, 3.279577, 0, 0, 0, 1, 1,
1.852885, -1.01093, 3.948886, 1, 1, 1, 1, 1,
1.876208, -0.04638427, 1.325581, 1, 1, 1, 1, 1,
1.89839, 0.2934524, 0.1664819, 1, 1, 1, 1, 1,
1.899068, -0.1987293, 2.664356, 1, 1, 1, 1, 1,
1.909009, -1.684508, 0.1814883, 1, 1, 1, 1, 1,
1.915455, -0.5253612, 2.70401, 1, 1, 1, 1, 1,
1.932782, -0.8865094, 1.182074, 1, 1, 1, 1, 1,
1.942757, 1.216328, 1.993543, 1, 1, 1, 1, 1,
1.962666, -0.6612872, 2.13419, 1, 1, 1, 1, 1,
1.966557, 2.156113, -1.628078, 1, 1, 1, 1, 1,
1.990397, -1.764608, -0.005799159, 1, 1, 1, 1, 1,
1.995304, -0.5520065, 2.402949, 1, 1, 1, 1, 1,
2.026505, 0.2411618, 1.459387, 1, 1, 1, 1, 1,
2.031212, 0.1046211, 0.7513328, 1, 1, 1, 1, 1,
2.050701, -0.4023552, 1.893058, 1, 1, 1, 1, 1,
2.053647, 0.4192782, 2.288406, 0, 0, 1, 1, 1,
2.06411, 0.3626686, 2.841593, 1, 0, 0, 1, 1,
2.068214, 1.493333, 1.13905, 1, 0, 0, 1, 1,
2.083341, 0.2807355, 3.137968, 1, 0, 0, 1, 1,
2.096089, -0.6759297, 0.8025859, 1, 0, 0, 1, 1,
2.111133, -0.8718646, 0.2180417, 1, 0, 0, 1, 1,
2.115054, -0.2294233, 1.090225, 0, 0, 0, 1, 1,
2.131059, -0.7598603, 1.954743, 0, 0, 0, 1, 1,
2.143198, 0.647234, -0.5431731, 0, 0, 0, 1, 1,
2.144301, 1.931063, -0.07516314, 0, 0, 0, 1, 1,
2.176015, 1.176812, 0.428073, 0, 0, 0, 1, 1,
2.231748, -2.895492, 3.428121, 0, 0, 0, 1, 1,
2.242648, -0.3782293, 3.447326, 0, 0, 0, 1, 1,
2.263408, 2.537431, 1.484424, 1, 1, 1, 1, 1,
2.338556, 3.504971, 1.89487, 1, 1, 1, 1, 1,
2.370671, -0.6547713, 1.842012, 1, 1, 1, 1, 1,
2.409633, -1.088605, 1.788478, 1, 1, 1, 1, 1,
2.654187, 0.175318, 2.350946, 1, 1, 1, 1, 1,
2.778541, -0.2711342, 3.107717, 1, 1, 1, 1, 1,
2.782575, 0.3689646, 2.444365, 1, 1, 1, 1, 1
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
var radius = 9.443448;
var distance = 33.16971;
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
mvMatrix.translate( 0.09022772, -0.2355671, -0.38801 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16971);
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
