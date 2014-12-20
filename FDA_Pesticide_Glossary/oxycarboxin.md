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
-3.245723, -0.2803133, -2.154774, 1, 0, 0, 1,
-2.948518, 1.910553, -1.438676, 1, 0.007843138, 0, 1,
-2.893979, 0.6273545, -0.4737794, 1, 0.01176471, 0, 1,
-2.779276, 0.7084587, -1.953549, 1, 0.01960784, 0, 1,
-2.702, 0.979797, -0.5770301, 1, 0.02352941, 0, 1,
-2.529195, 0.6152243, -0.3818296, 1, 0.03137255, 0, 1,
-2.52699, 0.3157667, -0.491647, 1, 0.03529412, 0, 1,
-2.412941, -1.551071, -2.580096, 1, 0.04313726, 0, 1,
-2.39948, 0.6207027, -0.9592196, 1, 0.04705882, 0, 1,
-2.358569, -1.102545, -1.796647, 1, 0.05490196, 0, 1,
-2.351029, 0.5408298, -2.48203, 1, 0.05882353, 0, 1,
-2.315902, -0.8113984, -2.64408, 1, 0.06666667, 0, 1,
-2.297737, -1.169538, -4.378777, 1, 0.07058824, 0, 1,
-2.231605, 0.4248055, -1.187305, 1, 0.07843138, 0, 1,
-2.206773, 0.924383, -1.481772, 1, 0.08235294, 0, 1,
-2.206282, -0.4246204, -2.60068, 1, 0.09019608, 0, 1,
-2.188096, -0.9431079, 0.3486477, 1, 0.09411765, 0, 1,
-2.145356, -0.1106558, -0.6561781, 1, 0.1019608, 0, 1,
-2.142925, -0.5519838, -2.1057, 1, 0.1098039, 0, 1,
-2.134187, 0.7586466, -0.3317176, 1, 0.1137255, 0, 1,
-2.111304, -1.467896, -1.432647, 1, 0.1215686, 0, 1,
-2.099034, -0.4558919, -2.046959, 1, 0.1254902, 0, 1,
-2.085984, 0.3218817, -0.7368445, 1, 0.1333333, 0, 1,
-2.078608, 1.617491, -0.5158039, 1, 0.1372549, 0, 1,
-2.053312, -0.5394862, -0.01871941, 1, 0.145098, 0, 1,
-1.967464, -0.5375519, -0.3911398, 1, 0.1490196, 0, 1,
-1.941207, -2.236256, -3.661214, 1, 0.1568628, 0, 1,
-1.898969, -0.6795237, -2.563699, 1, 0.1607843, 0, 1,
-1.882795, 0.9973436, 0.2961586, 1, 0.1686275, 0, 1,
-1.873483, -2.659588, -2.073083, 1, 0.172549, 0, 1,
-1.845518, -0.9892596, -1.217629, 1, 0.1803922, 0, 1,
-1.831221, 1.169909, -0.005917442, 1, 0.1843137, 0, 1,
-1.81969, -1.156144, -2.816786, 1, 0.1921569, 0, 1,
-1.819659, 0.6893922, -1.497714, 1, 0.1960784, 0, 1,
-1.77884, -0.2126525, 1.098473, 1, 0.2039216, 0, 1,
-1.769044, 0.184999, 0.3888962, 1, 0.2117647, 0, 1,
-1.760245, 0.2618238, -1.901512, 1, 0.2156863, 0, 1,
-1.756467, -0.8213078, -1.718629, 1, 0.2235294, 0, 1,
-1.755936, 0.04133339, -0.2840037, 1, 0.227451, 0, 1,
-1.754084, -0.9955233, -3.651628, 1, 0.2352941, 0, 1,
-1.753989, 0.2822255, -1.681309, 1, 0.2392157, 0, 1,
-1.737598, 0.6573872, -0.4597303, 1, 0.2470588, 0, 1,
-1.736866, -0.2881284, -1.985018, 1, 0.2509804, 0, 1,
-1.6825, 0.003551777, 0.005043432, 1, 0.2588235, 0, 1,
-1.671024, -0.6124849, -1.706961, 1, 0.2627451, 0, 1,
-1.666345, -0.7900364, -1.912524, 1, 0.2705882, 0, 1,
-1.660578, 0.9208476, 0.2822944, 1, 0.2745098, 0, 1,
-1.652407, 1.205335, -0.4958172, 1, 0.282353, 0, 1,
-1.64842, -0.5248125, -2.312774, 1, 0.2862745, 0, 1,
-1.645839, -0.1360763, -1.494726, 1, 0.2941177, 0, 1,
-1.63833, -1.835523, -3.303366, 1, 0.3019608, 0, 1,
-1.637003, -0.6103771, -2.344971, 1, 0.3058824, 0, 1,
-1.633308, 0.07146684, -1.495028, 1, 0.3137255, 0, 1,
-1.611944, -0.136753, -0.1456965, 1, 0.3176471, 0, 1,
-1.606512, -1.000019, -2.614433, 1, 0.3254902, 0, 1,
-1.604374, 0.2263234, -0.1621417, 1, 0.3294118, 0, 1,
-1.602986, -1.134579, -1.574612, 1, 0.3372549, 0, 1,
-1.598675, 0.5630668, -2.694129, 1, 0.3411765, 0, 1,
-1.58431, 2.706276, -0.5794727, 1, 0.3490196, 0, 1,
-1.578933, -0.308794, 0.3524154, 1, 0.3529412, 0, 1,
-1.569142, -0.2609316, 1.024994, 1, 0.3607843, 0, 1,
-1.559033, -0.3070402, -0.8780876, 1, 0.3647059, 0, 1,
-1.555917, -1.74301, -1.212787, 1, 0.372549, 0, 1,
-1.542186, 0.1374374, -2.54151, 1, 0.3764706, 0, 1,
-1.540244, 1.42414, -0.49915, 1, 0.3843137, 0, 1,
-1.540239, -0.8193421, -2.621139, 1, 0.3882353, 0, 1,
-1.530643, 1.257484, -1.515014, 1, 0.3960784, 0, 1,
-1.516889, -1.357064, -3.073954, 1, 0.4039216, 0, 1,
-1.513231, 0.2787445, -2.038877, 1, 0.4078431, 0, 1,
-1.511269, -1.167893, -3.086241, 1, 0.4156863, 0, 1,
-1.503151, -0.1784219, -4.651846, 1, 0.4196078, 0, 1,
-1.500125, 0.8005385, -2.278392, 1, 0.427451, 0, 1,
-1.495993, 0.3488701, -0.1730206, 1, 0.4313726, 0, 1,
-1.491352, 0.4655909, -1.190443, 1, 0.4392157, 0, 1,
-1.48834, -1.420771, -1.996153, 1, 0.4431373, 0, 1,
-1.487732, -0.7983429, 0.08538774, 1, 0.4509804, 0, 1,
-1.487092, 0.8411004, -3.244422, 1, 0.454902, 0, 1,
-1.482169, 0.1105955, -0.890952, 1, 0.4627451, 0, 1,
-1.481415, 0.58525, -2.824061, 1, 0.4666667, 0, 1,
-1.437216, -1.123863, -1.674114, 1, 0.4745098, 0, 1,
-1.422886, 0.139965, -3.447186, 1, 0.4784314, 0, 1,
-1.408531, -0.6279294, -2.028528, 1, 0.4862745, 0, 1,
-1.407488, 1.451221, 0.3171172, 1, 0.4901961, 0, 1,
-1.407387, 0.6370559, -1.587518, 1, 0.4980392, 0, 1,
-1.405584, -1.446996, -4.580122, 1, 0.5058824, 0, 1,
-1.397156, 0.8925405, -1.505132, 1, 0.509804, 0, 1,
-1.391698, -0.3489737, -1.345053, 1, 0.5176471, 0, 1,
-1.381978, 0.6565636, -1.424943, 1, 0.5215687, 0, 1,
-1.379217, 0.5707675, -0.671442, 1, 0.5294118, 0, 1,
-1.379031, 0.5704809, -0.9755727, 1, 0.5333334, 0, 1,
-1.368855, -0.3906342, -3.361519, 1, 0.5411765, 0, 1,
-1.363193, -0.6552952, -1.92438, 1, 0.5450981, 0, 1,
-1.360468, 0.3546093, -0.4979471, 1, 0.5529412, 0, 1,
-1.355342, -0.8917586, -2.922106, 1, 0.5568628, 0, 1,
-1.345909, -0.8813328, -2.585212, 1, 0.5647059, 0, 1,
-1.340929, -1.237012, -2.49458, 1, 0.5686275, 0, 1,
-1.33654, -0.4669364, -3.841733, 1, 0.5764706, 0, 1,
-1.330006, -0.9366325, -2.467705, 1, 0.5803922, 0, 1,
-1.327151, -0.1832427, -0.9173572, 1, 0.5882353, 0, 1,
-1.326051, 0.5743092, -2.18706, 1, 0.5921569, 0, 1,
-1.320958, -0.6432163, -2.473654, 1, 0.6, 0, 1,
-1.316806, -0.7719997, -3.078329, 1, 0.6078432, 0, 1,
-1.307436, 0.1043394, -1.967601, 1, 0.6117647, 0, 1,
-1.307152, 0.979777, -1.611108, 1, 0.6196079, 0, 1,
-1.305879, -1.44179, -0.7496395, 1, 0.6235294, 0, 1,
-1.295358, 0.07693046, -0.9804327, 1, 0.6313726, 0, 1,
-1.290421, -0.8396451, -1.908704, 1, 0.6352941, 0, 1,
-1.290225, -0.4735276, -2.020145, 1, 0.6431373, 0, 1,
-1.284893, -0.3855753, -1.564373, 1, 0.6470588, 0, 1,
-1.275579, -1.737517, -1.424712, 1, 0.654902, 0, 1,
-1.257455, 1.176115, -1.708132, 1, 0.6588235, 0, 1,
-1.253141, -0.7671726, -2.587155, 1, 0.6666667, 0, 1,
-1.245333, 1.091474, -3.515354, 1, 0.6705883, 0, 1,
-1.243857, -0.1473304, 0.3344727, 1, 0.6784314, 0, 1,
-1.242775, 0.3396269, -0.9609917, 1, 0.682353, 0, 1,
-1.242401, -0.4628188, -0.2096601, 1, 0.6901961, 0, 1,
-1.241695, 0.04609975, -1.68383, 1, 0.6941177, 0, 1,
-1.239733, -0.1779057, -2.687441, 1, 0.7019608, 0, 1,
-1.237177, -0.5266575, 0.2870904, 1, 0.7098039, 0, 1,
-1.231922, -0.0150077, -1.112406, 1, 0.7137255, 0, 1,
-1.219162, 0.6273773, -1.917618, 1, 0.7215686, 0, 1,
-1.217635, -1.113008, -4.156136, 1, 0.7254902, 0, 1,
-1.204224, 1.906334, -0.2131634, 1, 0.7333333, 0, 1,
-1.203142, 1.390697, -2.626724, 1, 0.7372549, 0, 1,
-1.199772, -0.5328541, -0.9463301, 1, 0.7450981, 0, 1,
-1.196019, 0.1017379, -2.738411, 1, 0.7490196, 0, 1,
-1.189774, 0.3261016, -1.067233, 1, 0.7568628, 0, 1,
-1.175977, -0.4698636, -2.388203, 1, 0.7607843, 0, 1,
-1.163795, 1.105587, 0.1712978, 1, 0.7686275, 0, 1,
-1.161856, 1.257451, -2.920237, 1, 0.772549, 0, 1,
-1.156354, 1.79032, 0.2493243, 1, 0.7803922, 0, 1,
-1.152409, 1.860774, 2.243173, 1, 0.7843137, 0, 1,
-1.144665, 2.200685, -0.519219, 1, 0.7921569, 0, 1,
-1.1375, 0.212939, -2.115472, 1, 0.7960784, 0, 1,
-1.135576, 0.08757228, 0.183721, 1, 0.8039216, 0, 1,
-1.131468, 0.4802894, -1.609015, 1, 0.8117647, 0, 1,
-1.118375, -0.4687832, -2.319197, 1, 0.8156863, 0, 1,
-1.117323, 0.4201727, -0.4148302, 1, 0.8235294, 0, 1,
-1.108694, 0.4993489, -0.9331143, 1, 0.827451, 0, 1,
-1.106382, 0.7159944, -2.909583, 1, 0.8352941, 0, 1,
-1.094771, 0.8032829, -2.285369, 1, 0.8392157, 0, 1,
-1.094179, -1.172252, -1.739166, 1, 0.8470588, 0, 1,
-1.090016, -1.157603, -3.650066, 1, 0.8509804, 0, 1,
-1.089485, -1.030337, -2.338089, 1, 0.8588235, 0, 1,
-1.088174, -1.478896, -1.910191, 1, 0.8627451, 0, 1,
-1.088117, -0.06806947, -1.620924, 1, 0.8705882, 0, 1,
-1.087493, 2.193648, 0.8164498, 1, 0.8745098, 0, 1,
-1.086841, -1.666264, 0.1211826, 1, 0.8823529, 0, 1,
-1.08062, 0.419132, -2.846993, 1, 0.8862745, 0, 1,
-1.076733, -0.1913177, -1.876894, 1, 0.8941177, 0, 1,
-1.067485, -1.154189, -2.264429, 1, 0.8980392, 0, 1,
-1.065668, 0.3357794, -1.833756, 1, 0.9058824, 0, 1,
-1.064275, 2.27798, -0.7134225, 1, 0.9137255, 0, 1,
-1.062508, 0.03822579, -2.420113, 1, 0.9176471, 0, 1,
-1.062295, 0.5318698, -2.160181, 1, 0.9254902, 0, 1,
-1.061269, -0.3152548, -3.277521, 1, 0.9294118, 0, 1,
-1.058002, -0.4480041, -0.8913756, 1, 0.9372549, 0, 1,
-1.053588, 0.8948448, -1.167713, 1, 0.9411765, 0, 1,
-1.053482, 0.7264927, -0.9912124, 1, 0.9490196, 0, 1,
-1.050701, 0.7502312, -1.822485, 1, 0.9529412, 0, 1,
-1.047095, 2.196848, -0.9168524, 1, 0.9607843, 0, 1,
-1.045735, -0.860095, -2.495806, 1, 0.9647059, 0, 1,
-1.040237, 0.2593483, -4.020868, 1, 0.972549, 0, 1,
-1.032288, -0.5648007, -1.52294, 1, 0.9764706, 0, 1,
-1.028286, -0.1944646, -2.382919, 1, 0.9843137, 0, 1,
-1.025305, -0.3179987, -1.947247, 1, 0.9882353, 0, 1,
-1.022795, 2.065322, 1.298115, 1, 0.9960784, 0, 1,
-1.02117, -1.402017, -2.681871, 0.9960784, 1, 0, 1,
-1.018324, 2.586997, -0.9445373, 0.9921569, 1, 0, 1,
-1.015476, -0.0485833, -1.489132, 0.9843137, 1, 0, 1,
-1.014633, -0.161785, -1.041739, 0.9803922, 1, 0, 1,
-1.011941, 2.168808, -0.1592948, 0.972549, 1, 0, 1,
-1.008242, 0.1978842, -2.396343, 0.9686275, 1, 0, 1,
-1.007619, 0.6042606, -1.519304, 0.9607843, 1, 0, 1,
-1.00493, 0.02050679, -2.591033, 0.9568627, 1, 0, 1,
-1.004783, -0.4344937, -1.768572, 0.9490196, 1, 0, 1,
-1.000882, -0.2585913, -2.470531, 0.945098, 1, 0, 1,
-0.987982, -0.9692794, -2.645553, 0.9372549, 1, 0, 1,
-0.9853595, 2.28038, 0.9959448, 0.9333333, 1, 0, 1,
-0.9838755, 0.2062182, -1.129957, 0.9254902, 1, 0, 1,
-0.9752328, 0.4149998, -1.40958, 0.9215686, 1, 0, 1,
-0.970266, 1.215697, -0.5697531, 0.9137255, 1, 0, 1,
-0.9611497, 0.7092722, 0.2727456, 0.9098039, 1, 0, 1,
-0.9500808, -1.428805, -3.075578, 0.9019608, 1, 0, 1,
-0.9480422, -0.3471251, -2.257102, 0.8941177, 1, 0, 1,
-0.9359483, -0.7794458, -1.6257, 0.8901961, 1, 0, 1,
-0.9350558, 0.00850381, -2.007941, 0.8823529, 1, 0, 1,
-0.9321823, -0.8950438, -1.540135, 0.8784314, 1, 0, 1,
-0.9273998, -0.02832542, -1.134487, 0.8705882, 1, 0, 1,
-0.9208929, -0.5910436, -3.1986, 0.8666667, 1, 0, 1,
-0.9180763, -0.8629193, -1.477924, 0.8588235, 1, 0, 1,
-0.9179426, 0.3410278, 0.7768877, 0.854902, 1, 0, 1,
-0.9174126, -0.1238701, -1.114026, 0.8470588, 1, 0, 1,
-0.9118541, 1.625692, -0.178446, 0.8431373, 1, 0, 1,
-0.9085232, -1.207529, -3.816088, 0.8352941, 1, 0, 1,
-0.9069088, -0.5517029, -2.59742, 0.8313726, 1, 0, 1,
-0.9003205, 0.07966681, -2.045716, 0.8235294, 1, 0, 1,
-0.8949973, 0.443013, 0.2684848, 0.8196079, 1, 0, 1,
-0.8759349, -0.8852899, -3.440045, 0.8117647, 1, 0, 1,
-0.8708119, -0.02461483, -1.513021, 0.8078431, 1, 0, 1,
-0.8703122, -0.1178358, -2.349442, 0.8, 1, 0, 1,
-0.8691502, 1.851557, -0.5881075, 0.7921569, 1, 0, 1,
-0.8643498, -0.232483, -4.30867, 0.7882353, 1, 0, 1,
-0.8618022, 0.7489451, -0.3775159, 0.7803922, 1, 0, 1,
-0.8617296, 1.09527, -1.026149, 0.7764706, 1, 0, 1,
-0.8590285, 1.813241, -0.8851475, 0.7686275, 1, 0, 1,
-0.8588215, 0.1956277, 1.054918, 0.7647059, 1, 0, 1,
-0.8578736, 0.6220936, -2.029716, 0.7568628, 1, 0, 1,
-0.8562347, 0.502444, -1.069064, 0.7529412, 1, 0, 1,
-0.8558394, 0.1932009, -2.052888, 0.7450981, 1, 0, 1,
-0.8550194, -0.1009682, -2.163548, 0.7411765, 1, 0, 1,
-0.85443, -0.3730536, -2.361464, 0.7333333, 1, 0, 1,
-0.8509898, 0.0314736, -2.787985, 0.7294118, 1, 0, 1,
-0.8509783, -0.4065398, -2.114128, 0.7215686, 1, 0, 1,
-0.8504223, 1.454984, 1.436467, 0.7176471, 1, 0, 1,
-0.8447747, -2.797027, -1.680384, 0.7098039, 1, 0, 1,
-0.8422347, -0.1495309, -1.610152, 0.7058824, 1, 0, 1,
-0.8416302, 0.4662846, -3.015756, 0.6980392, 1, 0, 1,
-0.8412607, -1.067766, -4.620464, 0.6901961, 1, 0, 1,
-0.83952, -0.9307776, -2.992064, 0.6862745, 1, 0, 1,
-0.8357441, -0.4030972, -1.728394, 0.6784314, 1, 0, 1,
-0.8346161, -0.3345534, -1.843832, 0.6745098, 1, 0, 1,
-0.8333918, 0.1794629, 0.2633447, 0.6666667, 1, 0, 1,
-0.8311659, 1.778415, 0.7914569, 0.6627451, 1, 0, 1,
-0.8130829, 0.2084161, -1.618041, 0.654902, 1, 0, 1,
-0.8093577, 1.137765, -1.222564, 0.6509804, 1, 0, 1,
-0.8080602, -2.853494, -1.970232, 0.6431373, 1, 0, 1,
-0.8042999, -0.1946547, -0.8316103, 0.6392157, 1, 0, 1,
-0.800714, -1.967904, -0.8774899, 0.6313726, 1, 0, 1,
-0.8005825, 1.756083, 0.7090963, 0.627451, 1, 0, 1,
-0.796221, 1.606187, 0.276646, 0.6196079, 1, 0, 1,
-0.79383, 0.3328947, -1.442688, 0.6156863, 1, 0, 1,
-0.7888744, 1.851763, -0.6464493, 0.6078432, 1, 0, 1,
-0.7732013, -0.5083099, -0.4687852, 0.6039216, 1, 0, 1,
-0.766399, 1.484839, -1.899485, 0.5960785, 1, 0, 1,
-0.7659145, -1.583325, -2.541122, 0.5882353, 1, 0, 1,
-0.7651758, -1.177746, -2.765717, 0.5843138, 1, 0, 1,
-0.7643953, 0.118956, -0.003604377, 0.5764706, 1, 0, 1,
-0.7573231, -0.89034, -1.551488, 0.572549, 1, 0, 1,
-0.7573035, -0.6067994, -3.289926, 0.5647059, 1, 0, 1,
-0.7552891, 0.04856726, -0.3958903, 0.5607843, 1, 0, 1,
-0.7540252, 0.1192732, -2.427398, 0.5529412, 1, 0, 1,
-0.7295518, -0.1213578, -1.641064, 0.5490196, 1, 0, 1,
-0.7260014, 0.3461112, -0.5772818, 0.5411765, 1, 0, 1,
-0.7253979, 1.934069, -1.221899, 0.5372549, 1, 0, 1,
-0.7237, -0.8274896, -2.428622, 0.5294118, 1, 0, 1,
-0.7222258, -1.114454, -1.040661, 0.5254902, 1, 0, 1,
-0.7187476, -0.9659725, -0.1104719, 0.5176471, 1, 0, 1,
-0.7155313, -1.577457, -0.6165539, 0.5137255, 1, 0, 1,
-0.7153272, 0.02227513, -0.9753059, 0.5058824, 1, 0, 1,
-0.7131654, -0.7756508, -2.700977, 0.5019608, 1, 0, 1,
-0.7120269, -0.4827844, -1.270791, 0.4941176, 1, 0, 1,
-0.7062648, 1.19816, -1.491697, 0.4862745, 1, 0, 1,
-0.7006357, 0.6843134, -1.549536, 0.4823529, 1, 0, 1,
-0.6976441, -0.6828656, -2.612917, 0.4745098, 1, 0, 1,
-0.6970356, 0.4615398, -1.79218, 0.4705882, 1, 0, 1,
-0.6961036, 0.5871922, -3.465547, 0.4627451, 1, 0, 1,
-0.6885866, 2.028812, -0.9870575, 0.4588235, 1, 0, 1,
-0.6667398, 0.8276122, 0.2495596, 0.4509804, 1, 0, 1,
-0.6648732, 0.1667173, -0.3126557, 0.4470588, 1, 0, 1,
-0.6634179, 1.714619, -0.3822108, 0.4392157, 1, 0, 1,
-0.6564426, 0.3436481, -0.3167942, 0.4352941, 1, 0, 1,
-0.6559796, 2.314008, -0.9293648, 0.427451, 1, 0, 1,
-0.6484604, 0.3226859, -3.284082, 0.4235294, 1, 0, 1,
-0.6483212, 0.4563063, -0.231124, 0.4156863, 1, 0, 1,
-0.6458625, 0.7517566, -1.205549, 0.4117647, 1, 0, 1,
-0.6454593, -0.1623733, -2.592418, 0.4039216, 1, 0, 1,
-0.6411675, 0.1740438, -2.226691, 0.3960784, 1, 0, 1,
-0.6411669, -0.1732983, -0.6572096, 0.3921569, 1, 0, 1,
-0.639421, -0.4259345, -2.510525, 0.3843137, 1, 0, 1,
-0.6380878, 0.3599255, -1.672384, 0.3803922, 1, 0, 1,
-0.6339368, 2.84658, 1.016688, 0.372549, 1, 0, 1,
-0.6325545, -0.7541408, -3.171452, 0.3686275, 1, 0, 1,
-0.629134, -0.589973, -1.51688, 0.3607843, 1, 0, 1,
-0.6284127, 1.242208, 0.3070276, 0.3568628, 1, 0, 1,
-0.6237914, 0.4275537, -1.31333, 0.3490196, 1, 0, 1,
-0.6232072, -0.511363, -0.8122082, 0.345098, 1, 0, 1,
-0.6197305, -0.5548913, -2.632342, 0.3372549, 1, 0, 1,
-0.6187872, -1.480096, -3.257658, 0.3333333, 1, 0, 1,
-0.6118879, -1.449211, -2.708068, 0.3254902, 1, 0, 1,
-0.6096624, -1.49667, -2.516645, 0.3215686, 1, 0, 1,
-0.609152, 0.4108045, -1.699725, 0.3137255, 1, 0, 1,
-0.6085247, 0.5461179, -1.738145, 0.3098039, 1, 0, 1,
-0.6059768, -0.4376357, -1.351437, 0.3019608, 1, 0, 1,
-0.6058798, 1.276663, -0.01583025, 0.2941177, 1, 0, 1,
-0.6046811, -0.5255511, -1.859829, 0.2901961, 1, 0, 1,
-0.5978814, 0.09195872, -0.4866806, 0.282353, 1, 0, 1,
-0.596435, 1.271897, -1.502884, 0.2784314, 1, 0, 1,
-0.591753, -0.6597338, -2.546781, 0.2705882, 1, 0, 1,
-0.5890372, -1.430773, -3.287243, 0.2666667, 1, 0, 1,
-0.5873753, 0.5902464, 0.03985545, 0.2588235, 1, 0, 1,
-0.5847102, 1.030338, -0.812301, 0.254902, 1, 0, 1,
-0.5845047, 1.155102, -1.912758, 0.2470588, 1, 0, 1,
-0.5832296, -1.490737, -2.75801, 0.2431373, 1, 0, 1,
-0.5812686, -2.343366, -0.428394, 0.2352941, 1, 0, 1,
-0.5777704, 2.237517, -0.6582609, 0.2313726, 1, 0, 1,
-0.5776258, 1.326893, -1.867598, 0.2235294, 1, 0, 1,
-0.5776219, 0.6478777, -0.7743279, 0.2196078, 1, 0, 1,
-0.5751352, 1.20689, -0.4380499, 0.2117647, 1, 0, 1,
-0.5719845, 0.7764907, 2.584532, 0.2078431, 1, 0, 1,
-0.5701637, -0.5705717, -2.155427, 0.2, 1, 0, 1,
-0.5629516, -2.172498, -5.350647, 0.1921569, 1, 0, 1,
-0.5619209, -2.761179, -2.955056, 0.1882353, 1, 0, 1,
-0.5577884, -0.9677104, -2.750115, 0.1803922, 1, 0, 1,
-0.556987, -0.886997, -1.263695, 0.1764706, 1, 0, 1,
-0.5567619, -0.2536712, -1.419506, 0.1686275, 1, 0, 1,
-0.5487757, -0.1940217, -3.031535, 0.1647059, 1, 0, 1,
-0.5480589, -1.370638, -2.221682, 0.1568628, 1, 0, 1,
-0.5474572, -0.1761889, -2.623719, 0.1529412, 1, 0, 1,
-0.5425855, 0.1616356, -0.7318, 0.145098, 1, 0, 1,
-0.541592, 0.9188134, -2.100182, 0.1411765, 1, 0, 1,
-0.5389774, 0.2592657, -1.842579, 0.1333333, 1, 0, 1,
-0.5358903, -0.3221137, -2.984104, 0.1294118, 1, 0, 1,
-0.534875, -1.342522, -2.058165, 0.1215686, 1, 0, 1,
-0.5310882, 0.5402039, 0.8739722, 0.1176471, 1, 0, 1,
-0.5306191, 0.2686434, -0.9323248, 0.1098039, 1, 0, 1,
-0.5278204, 0.5515575, -0.07188064, 0.1058824, 1, 0, 1,
-0.5242136, 1.219513, -0.4907978, 0.09803922, 1, 0, 1,
-0.5238646, 1.665653, 1.183684, 0.09019608, 1, 0, 1,
-0.5234873, 0.269751, -0.190871, 0.08627451, 1, 0, 1,
-0.5190128, -1.279539, -1.647874, 0.07843138, 1, 0, 1,
-0.5178001, 0.4571461, 0.07481276, 0.07450981, 1, 0, 1,
-0.5175251, 0.7844759, -1.524318, 0.06666667, 1, 0, 1,
-0.5150173, 0.4335864, 0.7079493, 0.0627451, 1, 0, 1,
-0.5087047, 1.28055, -1.578481, 0.05490196, 1, 0, 1,
-0.5040572, 0.6923738, -1.226615, 0.05098039, 1, 0, 1,
-0.5011975, -0.1446509, -0.3811061, 0.04313726, 1, 0, 1,
-0.497507, 1.169945, -2.083233, 0.03921569, 1, 0, 1,
-0.4964341, -1.810966, -3.379709, 0.03137255, 1, 0, 1,
-0.4946335, 0.9456023, 0.1145819, 0.02745098, 1, 0, 1,
-0.4903658, -2.605649, -2.593318, 0.01960784, 1, 0, 1,
-0.4882413, -0.3644136, -1.818068, 0.01568628, 1, 0, 1,
-0.4880876, -1.06999, -3.331646, 0.007843138, 1, 0, 1,
-0.481372, -0.07769044, -1.593867, 0.003921569, 1, 0, 1,
-0.4762116, 0.4854001, -2.228326, 0, 1, 0.003921569, 1,
-0.4756546, -0.2684425, -3.880597, 0, 1, 0.01176471, 1,
-0.4716235, 0.8083241, -0.2431313, 0, 1, 0.01568628, 1,
-0.4702919, -1.832964, -4.096908, 0, 1, 0.02352941, 1,
-0.4679609, -0.242683, -2.906947, 0, 1, 0.02745098, 1,
-0.4619318, -0.5489807, -4.378237, 0, 1, 0.03529412, 1,
-0.4536934, -1.81987, -3.29997, 0, 1, 0.03921569, 1,
-0.4519963, 0.9226356, -0.6354088, 0, 1, 0.04705882, 1,
-0.4502158, -0.5664217, -3.945432, 0, 1, 0.05098039, 1,
-0.4418331, -0.7461956, -2.645055, 0, 1, 0.05882353, 1,
-0.4391217, -1.100247, -2.860209, 0, 1, 0.0627451, 1,
-0.4338973, 0.5801588, -1.550322, 0, 1, 0.07058824, 1,
-0.4293234, -0.6882013, -0.8746032, 0, 1, 0.07450981, 1,
-0.4273109, 1.106254, 0.001842834, 0, 1, 0.08235294, 1,
-0.4255648, 0.2855465, -0.8618256, 0, 1, 0.08627451, 1,
-0.4208646, -0.6363246, -1.460636, 0, 1, 0.09411765, 1,
-0.4174725, 0.8319139, -1.176735, 0, 1, 0.1019608, 1,
-0.4171167, -0.259227, -1.877825, 0, 1, 0.1058824, 1,
-0.4147986, 1.162557, -2.21467, 0, 1, 0.1137255, 1,
-0.4120767, -0.2690684, -0.6872101, 0, 1, 0.1176471, 1,
-0.4098478, 0.6469285, -1.264007, 0, 1, 0.1254902, 1,
-0.4089967, -1.190793, -1.709697, 0, 1, 0.1294118, 1,
-0.4075114, 0.4099458, -1.935105, 0, 1, 0.1372549, 1,
-0.4045109, -0.6881407, -2.206907, 0, 1, 0.1411765, 1,
-0.4042248, -1.09308, -1.52133, 0, 1, 0.1490196, 1,
-0.3981313, -0.8101228, -0.5528447, 0, 1, 0.1529412, 1,
-0.3952341, -0.6162188, -3.156579, 0, 1, 0.1607843, 1,
-0.3914448, 1.421835, -1.49968, 0, 1, 0.1647059, 1,
-0.3865697, 0.603301, -1.970205, 0, 1, 0.172549, 1,
-0.3860089, -1.734449, -1.837059, 0, 1, 0.1764706, 1,
-0.380352, -0.421229, -2.586954, 0, 1, 0.1843137, 1,
-0.3763916, 1.158269, -2.123843, 0, 1, 0.1882353, 1,
-0.3625704, -0.8182125, -0.5463171, 0, 1, 0.1960784, 1,
-0.3620009, 1.151827, 0.01214496, 0, 1, 0.2039216, 1,
-0.3619577, 0.5944813, -0.9045875, 0, 1, 0.2078431, 1,
-0.3601578, 0.9342166, 0.3350349, 0, 1, 0.2156863, 1,
-0.3585546, 2.235254, 0.178607, 0, 1, 0.2196078, 1,
-0.3568785, -1.736091, -2.88782, 0, 1, 0.227451, 1,
-0.3552201, 0.02459347, -0.8611019, 0, 1, 0.2313726, 1,
-0.3549283, 1.218935, -0.08945575, 0, 1, 0.2392157, 1,
-0.3521183, 1.843491, 2.141511, 0, 1, 0.2431373, 1,
-0.3518756, -0.5681646, -2.080956, 0, 1, 0.2509804, 1,
-0.343982, 0.1514553, -0.5484096, 0, 1, 0.254902, 1,
-0.3432534, -1.012865, -2.992506, 0, 1, 0.2627451, 1,
-0.3347716, -0.210803, -0.7278324, 0, 1, 0.2666667, 1,
-0.3317849, 0.565207, 0.1676912, 0, 1, 0.2745098, 1,
-0.3310427, 0.6971056, 0.391418, 0, 1, 0.2784314, 1,
-0.3240111, -0.5989047, -3.732437, 0, 1, 0.2862745, 1,
-0.3207438, -0.1194154, -0.6108573, 0, 1, 0.2901961, 1,
-0.3199137, 0.6398411, -0.9505896, 0, 1, 0.2980392, 1,
-0.3188669, -1.776489, -2.946849, 0, 1, 0.3058824, 1,
-0.3173606, 0.07861987, -2.672536, 0, 1, 0.3098039, 1,
-0.3136998, -0.1521194, -1.323524, 0, 1, 0.3176471, 1,
-0.3131523, 0.6977515, 0.7013028, 0, 1, 0.3215686, 1,
-0.3091932, 0.05827381, -1.354809, 0, 1, 0.3294118, 1,
-0.3088812, -0.03544677, -0.6174561, 0, 1, 0.3333333, 1,
-0.3085867, -1.500918, -3.571017, 0, 1, 0.3411765, 1,
-0.3051534, -0.07884621, -0.1398828, 0, 1, 0.345098, 1,
-0.3047416, -0.1936597, -2.773375, 0, 1, 0.3529412, 1,
-0.3023582, -0.4981249, -0.9629656, 0, 1, 0.3568628, 1,
-0.3022131, -0.2245362, -4.068766, 0, 1, 0.3647059, 1,
-0.3003236, -0.01284206, -1.254452, 0, 1, 0.3686275, 1,
-0.2995734, -0.5756506, -3.496869, 0, 1, 0.3764706, 1,
-0.2993806, 1.094092, 0.8918151, 0, 1, 0.3803922, 1,
-0.2978103, -0.2222728, -1.406269, 0, 1, 0.3882353, 1,
-0.2966056, 0.03818996, -0.8511875, 0, 1, 0.3921569, 1,
-0.2954778, 0.1769466, -0.8391677, 0, 1, 0.4, 1,
-0.2949463, -0.1994803, -1.378595, 0, 1, 0.4078431, 1,
-0.2884212, -1.649343, -2.748204, 0, 1, 0.4117647, 1,
-0.2836873, -1.121422, -3.023521, 0, 1, 0.4196078, 1,
-0.2835338, -1.154744, -3.599547, 0, 1, 0.4235294, 1,
-0.2821087, -0.4069503, -2.380699, 0, 1, 0.4313726, 1,
-0.2813683, -1.272511, -3.247854, 0, 1, 0.4352941, 1,
-0.2801169, 0.5299147, -0.05257766, 0, 1, 0.4431373, 1,
-0.2691932, 0.04120529, -0.9889472, 0, 1, 0.4470588, 1,
-0.2675037, 0.3397381, 0.3136674, 0, 1, 0.454902, 1,
-0.2674769, -0.05475753, -1.645601, 0, 1, 0.4588235, 1,
-0.263196, 0.2220003, -1.063645, 0, 1, 0.4666667, 1,
-0.2567382, 1.654084, -1.667534, 0, 1, 0.4705882, 1,
-0.2550229, -0.206236, -1.472206, 0, 1, 0.4784314, 1,
-0.2540901, 0.6743088, -0.8531745, 0, 1, 0.4823529, 1,
-0.2537731, -2.416515, -3.021497, 0, 1, 0.4901961, 1,
-0.2524751, -0.5926431, -0.6777477, 0, 1, 0.4941176, 1,
-0.2425316, -0.4846908, -2.690446, 0, 1, 0.5019608, 1,
-0.2422546, 1.280365, 0.5818902, 0, 1, 0.509804, 1,
-0.2391308, -1.006602, -1.944941, 0, 1, 0.5137255, 1,
-0.2389907, 0.7132376, 1.580609, 0, 1, 0.5215687, 1,
-0.2383214, -1.082871, -3.468823, 0, 1, 0.5254902, 1,
-0.2297089, -1.525958, -3.69315, 0, 1, 0.5333334, 1,
-0.2257277, -0.7020566, -3.493939, 0, 1, 0.5372549, 1,
-0.2231771, -0.1462556, -2.488628, 0, 1, 0.5450981, 1,
-0.2196679, -0.5172445, -3.683945, 0, 1, 0.5490196, 1,
-0.2139012, -0.9647388, -2.818363, 0, 1, 0.5568628, 1,
-0.2132902, -0.9334983, -1.788236, 0, 1, 0.5607843, 1,
-0.210854, -1.106847, -2.469147, 0, 1, 0.5686275, 1,
-0.2086608, 1.071418, -1.197494, 0, 1, 0.572549, 1,
-0.20651, -0.00936241, -1.973512, 0, 1, 0.5803922, 1,
-0.2061513, -1.452463, -2.902177, 0, 1, 0.5843138, 1,
-0.2048819, 1.015636, 0.2021895, 0, 1, 0.5921569, 1,
-0.1930052, 0.7018886, 0.3255779, 0, 1, 0.5960785, 1,
-0.1925902, -2.142233, -1.362337, 0, 1, 0.6039216, 1,
-0.1921632, 1.242465, 0.5664839, 0, 1, 0.6117647, 1,
-0.1916373, 0.3945978, -0.2277947, 0, 1, 0.6156863, 1,
-0.1863982, -0.6066242, -2.431884, 0, 1, 0.6235294, 1,
-0.1849356, 0.2423858, -0.8811163, 0, 1, 0.627451, 1,
-0.1831121, 0.5481156, -0.3070872, 0, 1, 0.6352941, 1,
-0.1820076, -0.7513412, -1.859848, 0, 1, 0.6392157, 1,
-0.1819364, -0.3781503, -2.98919, 0, 1, 0.6470588, 1,
-0.1779049, -0.1005256, -2.8693, 0, 1, 0.6509804, 1,
-0.1758374, 0.6358079, 0.2805596, 0, 1, 0.6588235, 1,
-0.1744096, 0.121199, -1.36344, 0, 1, 0.6627451, 1,
-0.1731297, 0.1242732, -0.6084279, 0, 1, 0.6705883, 1,
-0.1693464, 0.01044767, -1.249247, 0, 1, 0.6745098, 1,
-0.1658159, 0.7077647, -0.8391625, 0, 1, 0.682353, 1,
-0.1611573, 0.291195, -1.257834, 0, 1, 0.6862745, 1,
-0.1589502, -1.433451, -1.507144, 0, 1, 0.6941177, 1,
-0.1555826, 0.5789638, 1.808042, 0, 1, 0.7019608, 1,
-0.1549386, -1.007379, -1.938528, 0, 1, 0.7058824, 1,
-0.1546953, 1.848756, 0.8069004, 0, 1, 0.7137255, 1,
-0.154391, -0.952238, -4.907559, 0, 1, 0.7176471, 1,
-0.1513709, 1.455178, -0.3731286, 0, 1, 0.7254902, 1,
-0.1512257, -0.2020357, -3.788209, 0, 1, 0.7294118, 1,
-0.1467564, 0.4328651, 0.31605, 0, 1, 0.7372549, 1,
-0.1430259, -0.8438942, -2.655506, 0, 1, 0.7411765, 1,
-0.138945, -0.66804, -2.363674, 0, 1, 0.7490196, 1,
-0.1358842, 0.05418843, -0.4214839, 0, 1, 0.7529412, 1,
-0.1309536, -0.8010809, -3.748517, 0, 1, 0.7607843, 1,
-0.1304976, 0.681271, -0.7271224, 0, 1, 0.7647059, 1,
-0.1282026, 0.2517534, 1.752391, 0, 1, 0.772549, 1,
-0.1273557, 0.6992221, -0.5560361, 0, 1, 0.7764706, 1,
-0.1169466, -2.039809, -2.208375, 0, 1, 0.7843137, 1,
-0.1167576, 1.161096, -2.156399, 0, 1, 0.7882353, 1,
-0.1155997, -0.3871497, -1.966642, 0, 1, 0.7960784, 1,
-0.1151292, 0.5426998, -0.2570227, 0, 1, 0.8039216, 1,
-0.1136394, -1.686711, -3.604145, 0, 1, 0.8078431, 1,
-0.1117205, 0.8495585, -0.719, 0, 1, 0.8156863, 1,
-0.1092524, -1.66103, -3.637604, 0, 1, 0.8196079, 1,
-0.1046268, -0.7815727, -2.987075, 0, 1, 0.827451, 1,
-0.1001911, 0.5647465, 1.110731, 0, 1, 0.8313726, 1,
-0.09713928, -0.01723247, -2.155385, 0, 1, 0.8392157, 1,
-0.096867, 1.710726, -0.3811139, 0, 1, 0.8431373, 1,
-0.09660014, 2.682458, -0.08630001, 0, 1, 0.8509804, 1,
-0.08307906, 0.5112211, -0.2806391, 0, 1, 0.854902, 1,
-0.07909559, -0.9748498, -2.353625, 0, 1, 0.8627451, 1,
-0.07121956, 0.1946182, -0.6442712, 0, 1, 0.8666667, 1,
-0.07110997, -0.8046378, -3.301862, 0, 1, 0.8745098, 1,
-0.06952721, 0.3331855, -1.352021, 0, 1, 0.8784314, 1,
-0.0672919, -0.4049352, -2.333907, 0, 1, 0.8862745, 1,
-0.06628186, -0.3583811, -1.984273, 0, 1, 0.8901961, 1,
-0.06464738, -2.308564, -2.393871, 0, 1, 0.8980392, 1,
-0.06377171, 0.8725834, 1.767936, 0, 1, 0.9058824, 1,
-0.06172685, -0.2513494, -2.718369, 0, 1, 0.9098039, 1,
-0.05903791, 1.397951, -1.665955, 0, 1, 0.9176471, 1,
-0.05409925, -0.5454654, -3.156597, 0, 1, 0.9215686, 1,
-0.0504474, 0.7052544, -0.8022568, 0, 1, 0.9294118, 1,
-0.04962975, 0.5636228, -1.199509, 0, 1, 0.9333333, 1,
-0.04910211, 0.6364582, -1.012693, 0, 1, 0.9411765, 1,
-0.04820909, 1.119767, -0.3923484, 0, 1, 0.945098, 1,
-0.04626518, -0.2348574, -3.453365, 0, 1, 0.9529412, 1,
-0.04457237, -0.4186132, -1.380038, 0, 1, 0.9568627, 1,
-0.04331093, -1.407825, -1.272893, 0, 1, 0.9647059, 1,
-0.04160353, -1.236423, -2.860622, 0, 1, 0.9686275, 1,
-0.03686953, 0.2035641, 0.3313927, 0, 1, 0.9764706, 1,
-0.03478422, -0.3668449, -2.121171, 0, 1, 0.9803922, 1,
-0.03099153, 1.04877, 0.6869125, 0, 1, 0.9882353, 1,
-0.02737893, -0.1427168, -2.071643, 0, 1, 0.9921569, 1,
-0.02486802, 0.9704795, 0.558752, 0, 1, 1, 1,
-0.02446102, -0.3206586, -4.698956, 0, 0.9921569, 1, 1,
-0.02165013, 0.7163846, 0.1265792, 0, 0.9882353, 1, 1,
-0.01831436, -0.5545684, -4.556379, 0, 0.9803922, 1, 1,
-0.006588089, -0.3968551, -3.879801, 0, 0.9764706, 1, 1,
-0.0003501161, -2.289819, -1.797113, 0, 0.9686275, 1, 1,
0.003581169, -2.000539, 3.491128, 0, 0.9647059, 1, 1,
0.004269811, -0.1928606, 1.738769, 0, 0.9568627, 1, 1,
0.006963389, 1.688636, -0.7549161, 0, 0.9529412, 1, 1,
0.01418954, 0.2717307, -0.8939229, 0, 0.945098, 1, 1,
0.01483677, -1.202638, 2.828429, 0, 0.9411765, 1, 1,
0.0156701, 0.3387389, -0.134786, 0, 0.9333333, 1, 1,
0.02066292, -0.007827289, 1.020017, 0, 0.9294118, 1, 1,
0.02338875, -0.4604038, 2.086843, 0, 0.9215686, 1, 1,
0.02552483, -1.214935, 0.896193, 0, 0.9176471, 1, 1,
0.02592673, -1.855307, 2.962663, 0, 0.9098039, 1, 1,
0.03055407, 0.1197969, -0.8103642, 0, 0.9058824, 1, 1,
0.03492429, -0.02899248, 2.591608, 0, 0.8980392, 1, 1,
0.03575512, -0.2906905, 3.071004, 0, 0.8901961, 1, 1,
0.03622911, -0.06155251, 3.017578, 0, 0.8862745, 1, 1,
0.03716528, -0.4884976, 2.123381, 0, 0.8784314, 1, 1,
0.03756283, 0.8855658, -0.7977642, 0, 0.8745098, 1, 1,
0.03812931, 2.748157, -0.8173713, 0, 0.8666667, 1, 1,
0.03846495, 0.06714766, -0.08144437, 0, 0.8627451, 1, 1,
0.0426264, -0.9701668, 2.729243, 0, 0.854902, 1, 1,
0.05076731, 1.823804, 0.4082909, 0, 0.8509804, 1, 1,
0.06311534, -1.260936, 3.497034, 0, 0.8431373, 1, 1,
0.07114453, 0.4423236, 1.246213, 0, 0.8392157, 1, 1,
0.07147677, -0.07872904, 0.8529599, 0, 0.8313726, 1, 1,
0.07297039, 0.8228833, -0.2786878, 0, 0.827451, 1, 1,
0.07323441, 2.715718, -0.7418227, 0, 0.8196079, 1, 1,
0.07401232, 0.4422685, -0.1371824, 0, 0.8156863, 1, 1,
0.0758912, 0.9283006, -2.115377, 0, 0.8078431, 1, 1,
0.07689863, 0.6075719, 0.3357506, 0, 0.8039216, 1, 1,
0.0786621, 1.873286, -0.7020242, 0, 0.7960784, 1, 1,
0.08322178, 0.28555, 0.01133816, 0, 0.7882353, 1, 1,
0.08449809, -0.3784064, 3.366816, 0, 0.7843137, 1, 1,
0.08747771, -0.291593, 2.466133, 0, 0.7764706, 1, 1,
0.09512429, -0.05112927, 1.062014, 0, 0.772549, 1, 1,
0.106314, -1.069605, 3.519208, 0, 0.7647059, 1, 1,
0.110267, -1.895281, 3.510897, 0, 0.7607843, 1, 1,
0.1105408, 1.778698, 1.021923, 0, 0.7529412, 1, 1,
0.1110711, -1.339196, 2.498095, 0, 0.7490196, 1, 1,
0.1130822, -1.032336, 2.950321, 0, 0.7411765, 1, 1,
0.1181606, 1.82634, -0.3554023, 0, 0.7372549, 1, 1,
0.1183791, 0.8750189, -1.427346, 0, 0.7294118, 1, 1,
0.118662, 1.59805, -1.168409, 0, 0.7254902, 1, 1,
0.1187124, -0.2513323, 3.34685, 0, 0.7176471, 1, 1,
0.1216347, -1.939068, 3.172873, 0, 0.7137255, 1, 1,
0.1231528, 0.8330873, -0.8826775, 0, 0.7058824, 1, 1,
0.1283106, 1.347247, -0.7210659, 0, 0.6980392, 1, 1,
0.1320694, 1.34493, 0.1093136, 0, 0.6941177, 1, 1,
0.1321572, 1.079797, 0.8595423, 0, 0.6862745, 1, 1,
0.1355071, 1.912219, 0.347182, 0, 0.682353, 1, 1,
0.1404824, -0.01462504, 2.296875, 0, 0.6745098, 1, 1,
0.1412038, -0.05987201, 1.131835, 0, 0.6705883, 1, 1,
0.1438289, -0.9147991, 2.595326, 0, 0.6627451, 1, 1,
0.1455889, -2.117965, 1.218769, 0, 0.6588235, 1, 1,
0.1457542, -0.5904363, 1.181024, 0, 0.6509804, 1, 1,
0.1495732, -2.18045, 3.870908, 0, 0.6470588, 1, 1,
0.1501516, -0.1108123, 0.5867159, 0, 0.6392157, 1, 1,
0.1505801, 1.553721, -1.323715, 0, 0.6352941, 1, 1,
0.1521134, -0.6205009, 1.652872, 0, 0.627451, 1, 1,
0.1535167, 1.180744, 1.094409, 0, 0.6235294, 1, 1,
0.1535843, 0.7130012, -0.3815344, 0, 0.6156863, 1, 1,
0.1563598, 1.038812, 0.09654932, 0, 0.6117647, 1, 1,
0.1572693, -0.2665745, 2.734713, 0, 0.6039216, 1, 1,
0.1587982, 1.057041, -0.3884923, 0, 0.5960785, 1, 1,
0.1601254, 1.172984, 1.28834, 0, 0.5921569, 1, 1,
0.1609682, -0.3503523, 3.78992, 0, 0.5843138, 1, 1,
0.1641043, -0.52552, 3.636882, 0, 0.5803922, 1, 1,
0.1646714, -0.03248726, 1.387897, 0, 0.572549, 1, 1,
0.1704974, 2.054729, 0.5592104, 0, 0.5686275, 1, 1,
0.1715212, 0.7616594, -0.1424456, 0, 0.5607843, 1, 1,
0.1777694, -1.416414, 2.705066, 0, 0.5568628, 1, 1,
0.1822273, -1.028985, 1.179491, 0, 0.5490196, 1, 1,
0.1822858, 0.4386992, 0.1901179, 0, 0.5450981, 1, 1,
0.1843664, 0.1930182, 0.2128951, 0, 0.5372549, 1, 1,
0.1849859, -1.611108, 3.146134, 0, 0.5333334, 1, 1,
0.185627, 0.3301256, 2.638228, 0, 0.5254902, 1, 1,
0.1916604, 1.752881, -0.8117273, 0, 0.5215687, 1, 1,
0.195724, 0.4130469, 2.51665, 0, 0.5137255, 1, 1,
0.1988268, 1.487589, 0.6827182, 0, 0.509804, 1, 1,
0.1992945, 1.485114, 0.1693105, 0, 0.5019608, 1, 1,
0.2008298, -2.052286, 3.46973, 0, 0.4941176, 1, 1,
0.2015692, 0.5245537, 0.4509924, 0, 0.4901961, 1, 1,
0.2023341, 0.3860766, 1.109029, 0, 0.4823529, 1, 1,
0.2029036, -0.2286456, 0.5190701, 0, 0.4784314, 1, 1,
0.2051015, -1.885662, 3.484262, 0, 0.4705882, 1, 1,
0.2067277, 0.8215702, -0.7349795, 0, 0.4666667, 1, 1,
0.2098252, 0.7550563, 1.066421, 0, 0.4588235, 1, 1,
0.2172076, -1.129621, 3.050043, 0, 0.454902, 1, 1,
0.2203769, -2.156982, 3.942029, 0, 0.4470588, 1, 1,
0.2229024, 1.394127, 0.3126598, 0, 0.4431373, 1, 1,
0.2244007, -0.560118, 3.032283, 0, 0.4352941, 1, 1,
0.2270004, -2.140878, 2.663702, 0, 0.4313726, 1, 1,
0.2272941, 0.6251195, 2.283703, 0, 0.4235294, 1, 1,
0.2333984, -1.36689, 3.771277, 0, 0.4196078, 1, 1,
0.2349679, 1.29492, 0.5715384, 0, 0.4117647, 1, 1,
0.240311, -0.8717768, 1.288894, 0, 0.4078431, 1, 1,
0.2404962, -1.91034, 3.42926, 0, 0.4, 1, 1,
0.243952, 0.7032377, -0.012928, 0, 0.3921569, 1, 1,
0.244048, -1.123691, 2.304714, 0, 0.3882353, 1, 1,
0.2475206, 0.3571943, 0.3669305, 0, 0.3803922, 1, 1,
0.2487531, -0.8171368, 2.992612, 0, 0.3764706, 1, 1,
0.2523645, -1.351551, 2.171086, 0, 0.3686275, 1, 1,
0.2580939, -0.3996206, 2.442837, 0, 0.3647059, 1, 1,
0.2618167, -1.764062, 3.008008, 0, 0.3568628, 1, 1,
0.263165, -2.122167, 3.531696, 0, 0.3529412, 1, 1,
0.2632581, -0.5038102, 4.065922, 0, 0.345098, 1, 1,
0.2659155, -0.2700722, 3.085762, 0, 0.3411765, 1, 1,
0.2708566, 0.2393752, 1.53489, 0, 0.3333333, 1, 1,
0.2712263, 0.263665, 0.5727827, 0, 0.3294118, 1, 1,
0.2730197, -1.041614, 4.03021, 0, 0.3215686, 1, 1,
0.2741133, 0.3734472, 1.185498, 0, 0.3176471, 1, 1,
0.2777026, -1.958796, 3.391693, 0, 0.3098039, 1, 1,
0.2791426, 0.8724805, 1.683091, 0, 0.3058824, 1, 1,
0.2815221, -0.8926899, 2.810442, 0, 0.2980392, 1, 1,
0.2829321, 1.412303, 0.1676382, 0, 0.2901961, 1, 1,
0.2835453, 0.1822881, -0.8820285, 0, 0.2862745, 1, 1,
0.2867011, -0.3084672, 0.8871888, 0, 0.2784314, 1, 1,
0.2876358, 0.1120036, 2.201624, 0, 0.2745098, 1, 1,
0.2906292, 0.8323652, -0.2956805, 0, 0.2666667, 1, 1,
0.2962239, -0.0772026, 1.160854, 0, 0.2627451, 1, 1,
0.3078838, 0.9582006, 0.8578366, 0, 0.254902, 1, 1,
0.3080409, 1.330511, -0.3326341, 0, 0.2509804, 1, 1,
0.3090885, -0.6767237, 3.159382, 0, 0.2431373, 1, 1,
0.3093105, 1.367726, -0.1004549, 0, 0.2392157, 1, 1,
0.3100618, -0.4581341, 2.832249, 0, 0.2313726, 1, 1,
0.3107192, 1.415196, -0.5402436, 0, 0.227451, 1, 1,
0.3136906, 1.243269, 0.9688529, 0, 0.2196078, 1, 1,
0.3176309, 2.312112, -1.519894, 0, 0.2156863, 1, 1,
0.3192645, 0.5094098, 0.4594119, 0, 0.2078431, 1, 1,
0.3307867, 0.9742886, 0.7946882, 0, 0.2039216, 1, 1,
0.338329, 0.1950638, 2.053657, 0, 0.1960784, 1, 1,
0.3383547, 0.4430338, 1.471764, 0, 0.1882353, 1, 1,
0.3453078, 0.2372449, 0.8573292, 0, 0.1843137, 1, 1,
0.3459231, -0.08845977, 3.219484, 0, 0.1764706, 1, 1,
0.3469233, -0.3730958, 1.819528, 0, 0.172549, 1, 1,
0.3473956, 0.6466246, -0.3970543, 0, 0.1647059, 1, 1,
0.3479083, 0.5792093, 1.206714, 0, 0.1607843, 1, 1,
0.348845, 0.4675719, 0.7573178, 0, 0.1529412, 1, 1,
0.3509924, -0.02982714, 2.693003, 0, 0.1490196, 1, 1,
0.3523574, -0.1203331, 2.852806, 0, 0.1411765, 1, 1,
0.3560406, -0.4035945, 3.074037, 0, 0.1372549, 1, 1,
0.3594292, 0.7089521, 0.1676348, 0, 0.1294118, 1, 1,
0.3633581, 0.2578481, -0.07007484, 0, 0.1254902, 1, 1,
0.3668224, -0.8733429, 1.404065, 0, 0.1176471, 1, 1,
0.3685088, -1.183884, 2.139402, 0, 0.1137255, 1, 1,
0.3689011, 1.201847, 0.6533127, 0, 0.1058824, 1, 1,
0.3734227, 0.4598294, 0.6120375, 0, 0.09803922, 1, 1,
0.3786504, 1.044084, -0.3885015, 0, 0.09411765, 1, 1,
0.3797231, -0.3593455, 2.080221, 0, 0.08627451, 1, 1,
0.3825407, 0.5247487, -0.5602305, 0, 0.08235294, 1, 1,
0.3856579, -1.352085, 3.105972, 0, 0.07450981, 1, 1,
0.3875076, 0.2994108, -1.254572, 0, 0.07058824, 1, 1,
0.3906772, 2.184982, 1.816162, 0, 0.0627451, 1, 1,
0.3927607, 0.7504245, 0.6031567, 0, 0.05882353, 1, 1,
0.3941165, 0.4483606, -0.2127623, 0, 0.05098039, 1, 1,
0.3956601, 0.9901928, 0.225372, 0, 0.04705882, 1, 1,
0.3993951, 1.978505, -1.125238, 0, 0.03921569, 1, 1,
0.4059153, -1.290823, 2.293249, 0, 0.03529412, 1, 1,
0.4091944, 0.3014792, 1.11548, 0, 0.02745098, 1, 1,
0.4095319, 1.702077, 0.3919197, 0, 0.02352941, 1, 1,
0.4149785, 1.669594, -0.7260331, 0, 0.01568628, 1, 1,
0.419185, 2.220012, 0.3275276, 0, 0.01176471, 1, 1,
0.4194859, -0.1410116, 2.134563, 0, 0.003921569, 1, 1,
0.4343024, 0.6863625, 0.8902103, 0.003921569, 0, 1, 1,
0.4352281, 0.410923, 0.4766345, 0.007843138, 0, 1, 1,
0.4370717, -0.1138327, 1.42785, 0.01568628, 0, 1, 1,
0.4371064, -0.784883, 1.705174, 0.01960784, 0, 1, 1,
0.4489964, 0.4274416, -0.296268, 0.02745098, 0, 1, 1,
0.4561595, -0.4138633, 3.813647, 0.03137255, 0, 1, 1,
0.4614948, 0.8763567, 1.107575, 0.03921569, 0, 1, 1,
0.4615561, 0.5709893, 0.3095419, 0.04313726, 0, 1, 1,
0.4647728, -0.4408006, 0.2365782, 0.05098039, 0, 1, 1,
0.4675041, 0.4673173, 1.418869, 0.05490196, 0, 1, 1,
0.4704442, -1.359092, 2.533552, 0.0627451, 0, 1, 1,
0.4718903, -2.299983, 3.055642, 0.06666667, 0, 1, 1,
0.473186, 1.212234, -0.140676, 0.07450981, 0, 1, 1,
0.4740689, -0.2877418, 0.7544602, 0.07843138, 0, 1, 1,
0.4768418, -1.001436, 3.189695, 0.08627451, 0, 1, 1,
0.4790529, 0.4074636, 1.459062, 0.09019608, 0, 1, 1,
0.4931729, -1.161307, 5.817279, 0.09803922, 0, 1, 1,
0.4956337, -0.4658808, 1.488414, 0.1058824, 0, 1, 1,
0.4995783, -0.2148136, 3.370268, 0.1098039, 0, 1, 1,
0.5002738, -0.8474301, 0.9624657, 0.1176471, 0, 1, 1,
0.5029485, -0.3470744, 2.222179, 0.1215686, 0, 1, 1,
0.510516, -0.1378422, 3.622296, 0.1294118, 0, 1, 1,
0.5130886, -0.620766, 2.478619, 0.1333333, 0, 1, 1,
0.5136325, 1.558211, -0.435913, 0.1411765, 0, 1, 1,
0.5178739, -0.1399511, 3.15511, 0.145098, 0, 1, 1,
0.5197977, 0.2628608, 0.5533087, 0.1529412, 0, 1, 1,
0.5200437, -0.1824639, 1.724257, 0.1568628, 0, 1, 1,
0.5223473, -0.8575816, 0.5820258, 0.1647059, 0, 1, 1,
0.5234205, -0.5067101, 2.863518, 0.1686275, 0, 1, 1,
0.5301135, -0.4549321, 2.068035, 0.1764706, 0, 1, 1,
0.5328284, -0.1230662, 1.696572, 0.1803922, 0, 1, 1,
0.5344976, 1.430989, 0.6285521, 0.1882353, 0, 1, 1,
0.5352985, 0.2263383, 2.835751, 0.1921569, 0, 1, 1,
0.5367413, 3.584974, 0.7684969, 0.2, 0, 1, 1,
0.5408545, -0.8984718, 4.177362, 0.2078431, 0, 1, 1,
0.543744, 0.9344732, -0.7394168, 0.2117647, 0, 1, 1,
0.547282, 0.09404925, 0.5347238, 0.2196078, 0, 1, 1,
0.547927, 0.522396, -0.9146254, 0.2235294, 0, 1, 1,
0.5565639, 0.5746755, 1.130201, 0.2313726, 0, 1, 1,
0.5585401, -1.05849, 3.054521, 0.2352941, 0, 1, 1,
0.5663587, -1.532591, 3.543905, 0.2431373, 0, 1, 1,
0.5670833, -1.847205, 5.429223, 0.2470588, 0, 1, 1,
0.5719222, 1.071985, 1.23806, 0.254902, 0, 1, 1,
0.5722831, -0.2478341, 3.236677, 0.2588235, 0, 1, 1,
0.5734733, -0.1858548, 1.109395, 0.2666667, 0, 1, 1,
0.5750195, 0.5450774, 0.3121315, 0.2705882, 0, 1, 1,
0.5751927, 0.7170886, 0.756714, 0.2784314, 0, 1, 1,
0.5785311, -1.076408, 2.986669, 0.282353, 0, 1, 1,
0.5785495, -0.01716648, 1.33754, 0.2901961, 0, 1, 1,
0.5814075, -0.03740389, 1.517595, 0.2941177, 0, 1, 1,
0.5825468, 2.078137, 0.2980661, 0.3019608, 0, 1, 1,
0.5913445, 1.850163, 2.212311, 0.3098039, 0, 1, 1,
0.5920866, 0.2645624, 0.8433806, 0.3137255, 0, 1, 1,
0.5953559, 1.381217, 0.1524013, 0.3215686, 0, 1, 1,
0.5969317, 0.3479885, 1.68537, 0.3254902, 0, 1, 1,
0.5986322, -0.4694032, 2.289717, 0.3333333, 0, 1, 1,
0.5989877, 0.1336328, -1.143157, 0.3372549, 0, 1, 1,
0.6001576, -1.271468, 1.796391, 0.345098, 0, 1, 1,
0.6031634, 0.412428, -0.6552022, 0.3490196, 0, 1, 1,
0.603368, 0.1057317, 1.609937, 0.3568628, 0, 1, 1,
0.6053508, -0.1337513, 2.605257, 0.3607843, 0, 1, 1,
0.6087607, -0.8072022, 3.205584, 0.3686275, 0, 1, 1,
0.6103737, 1.147786, 1.008323, 0.372549, 0, 1, 1,
0.6120851, -1.412602, 1.648349, 0.3803922, 0, 1, 1,
0.6236115, 1.264473, -0.5897865, 0.3843137, 0, 1, 1,
0.6289315, -0.3611359, 2.162213, 0.3921569, 0, 1, 1,
0.6304988, 1.62567, 2.503982, 0.3960784, 0, 1, 1,
0.6393043, -1.235105, 3.547132, 0.4039216, 0, 1, 1,
0.6410683, -0.1194788, 1.773723, 0.4117647, 0, 1, 1,
0.6422647, -0.05520244, 0.672154, 0.4156863, 0, 1, 1,
0.6440676, -0.1364417, 1.701846, 0.4235294, 0, 1, 1,
0.6446396, -0.6628449, 3.766419, 0.427451, 0, 1, 1,
0.6488614, -0.3683049, 0.5223283, 0.4352941, 0, 1, 1,
0.6579723, -0.6468796, 1.504275, 0.4392157, 0, 1, 1,
0.6620483, 0.02109461, 1.334202, 0.4470588, 0, 1, 1,
0.6649039, 1.126722, 1.942477, 0.4509804, 0, 1, 1,
0.6746876, -1.481822, 3.358817, 0.4588235, 0, 1, 1,
0.6814994, 1.781159, 0.73246, 0.4627451, 0, 1, 1,
0.6820824, -0.4883094, 2.022465, 0.4705882, 0, 1, 1,
0.6853348, 0.3531902, 1.232557, 0.4745098, 0, 1, 1,
0.6870985, -0.3735789, 3.20095, 0.4823529, 0, 1, 1,
0.6926832, -2.121933, 3.348352, 0.4862745, 0, 1, 1,
0.6965789, 0.1780755, 0.08082239, 0.4941176, 0, 1, 1,
0.7011374, -1.664393, 3.566552, 0.5019608, 0, 1, 1,
0.7042337, -3.828948, 2.642685, 0.5058824, 0, 1, 1,
0.707783, -2.075307, 2.443783, 0.5137255, 0, 1, 1,
0.7161897, 1.607253, -0.2594067, 0.5176471, 0, 1, 1,
0.7196484, -0.5880184, 3.119397, 0.5254902, 0, 1, 1,
0.7202711, -0.8705633, -0.2544481, 0.5294118, 0, 1, 1,
0.721248, -0.9135591, 0.6779229, 0.5372549, 0, 1, 1,
0.7259631, 2.523148, 0.2091729, 0.5411765, 0, 1, 1,
0.7283565, 0.6383626, 3.434509, 0.5490196, 0, 1, 1,
0.7370967, -0.1448403, 2.586993, 0.5529412, 0, 1, 1,
0.7385131, 1.513681, 0.3733383, 0.5607843, 0, 1, 1,
0.740279, 1.795963, 0.9477172, 0.5647059, 0, 1, 1,
0.7403121, -0.2306837, 2.475073, 0.572549, 0, 1, 1,
0.7406194, -1.617878, 3.429252, 0.5764706, 0, 1, 1,
0.7434283, 2.40742, 0.3201757, 0.5843138, 0, 1, 1,
0.7445561, 0.3651055, 1.042549, 0.5882353, 0, 1, 1,
0.7490951, -0.9608056, 2.334695, 0.5960785, 0, 1, 1,
0.7518071, 0.8332259, 0.3181959, 0.6039216, 0, 1, 1,
0.7651891, 0.7956089, 0.826878, 0.6078432, 0, 1, 1,
0.7672532, 1.272793, -0.4003962, 0.6156863, 0, 1, 1,
0.7696311, -0.4828453, 2.375473, 0.6196079, 0, 1, 1,
0.7712624, 1.097411, 0.6614689, 0.627451, 0, 1, 1,
0.7755716, -1.172188, 1.280838, 0.6313726, 0, 1, 1,
0.7832654, 1.251632, 1.796853, 0.6392157, 0, 1, 1,
0.7837096, -0.09159672, 2.746529, 0.6431373, 0, 1, 1,
0.7927099, -0.9980836, 3.509963, 0.6509804, 0, 1, 1,
0.7954919, 1.037863, 0.5611691, 0.654902, 0, 1, 1,
0.8009545, 0.4185033, 2.564585, 0.6627451, 0, 1, 1,
0.8034167, 1.388082, -0.4165767, 0.6666667, 0, 1, 1,
0.8074167, 0.9252974, 0.7544637, 0.6745098, 0, 1, 1,
0.8098462, -1.501554, 2.652334, 0.6784314, 0, 1, 1,
0.8117998, 2.027851, 0.1570252, 0.6862745, 0, 1, 1,
0.8148965, 0.8171762, 1.139562, 0.6901961, 0, 1, 1,
0.8158364, 0.5599731, -0.5278537, 0.6980392, 0, 1, 1,
0.8160257, -0.05678056, 0.6056796, 0.7058824, 0, 1, 1,
0.8183317, -0.5376505, 1.109555, 0.7098039, 0, 1, 1,
0.8202648, 0.1451991, 1.676459, 0.7176471, 0, 1, 1,
0.8207397, -0.3229957, 1.472576, 0.7215686, 0, 1, 1,
0.8232312, -1.103573, 2.915399, 0.7294118, 0, 1, 1,
0.8241954, 0.7245647, 0.8162518, 0.7333333, 0, 1, 1,
0.8242087, -0.1741617, 1.288925, 0.7411765, 0, 1, 1,
0.8262153, 0.6646869, 1.435971, 0.7450981, 0, 1, 1,
0.8285455, 1.018867, 1.070956, 0.7529412, 0, 1, 1,
0.8294966, 0.8927691, 1.926681, 0.7568628, 0, 1, 1,
0.8302108, 0.07322881, 1.544027, 0.7647059, 0, 1, 1,
0.8304368, 0.7024592, 0.1487653, 0.7686275, 0, 1, 1,
0.8333057, 0.8378986, 0.3813788, 0.7764706, 0, 1, 1,
0.8353678, -0.993873, 3.554455, 0.7803922, 0, 1, 1,
0.8387049, 0.2368592, -0.3190421, 0.7882353, 0, 1, 1,
0.8438733, -0.4931996, 4.024149, 0.7921569, 0, 1, 1,
0.8554804, -0.9809936, 1.93758, 0.8, 0, 1, 1,
0.8620818, 0.1227231, 1.406658, 0.8078431, 0, 1, 1,
0.8632185, 0.2316449, 2.705072, 0.8117647, 0, 1, 1,
0.8642181, -0.202424, 0.4434893, 0.8196079, 0, 1, 1,
0.8648882, 0.5142785, 2.089207, 0.8235294, 0, 1, 1,
0.8706709, 0.3409544, 0.3680822, 0.8313726, 0, 1, 1,
0.8730918, 0.2240099, 0.7649317, 0.8352941, 0, 1, 1,
0.8743317, 1.105409, 0.2338921, 0.8431373, 0, 1, 1,
0.8768662, 0.140995, 1.790095, 0.8470588, 0, 1, 1,
0.8818293, -0.6997064, 1.580114, 0.854902, 0, 1, 1,
0.8821571, 1.064196, -0.3696233, 0.8588235, 0, 1, 1,
0.8829625, -0.4146511, 2.088295, 0.8666667, 0, 1, 1,
0.8872143, 1.244392, 2.237435, 0.8705882, 0, 1, 1,
0.895192, -0.3134483, 0.9326279, 0.8784314, 0, 1, 1,
0.8967385, -1.266945, 3.562523, 0.8823529, 0, 1, 1,
0.9011745, -1.053041, 3.136356, 0.8901961, 0, 1, 1,
0.9090854, 0.4924176, -1.086071, 0.8941177, 0, 1, 1,
0.9104921, 1.258759, 1.065145, 0.9019608, 0, 1, 1,
0.9108758, 0.110767, 0.83848, 0.9098039, 0, 1, 1,
0.9167251, -1.349268, 3.282312, 0.9137255, 0, 1, 1,
0.9205859, -1.89295, 2.631387, 0.9215686, 0, 1, 1,
0.9251333, -0.6180453, 1.746948, 0.9254902, 0, 1, 1,
0.9290949, 0.4997835, 1.40408, 0.9333333, 0, 1, 1,
0.938364, -0.3077212, 1.973378, 0.9372549, 0, 1, 1,
0.9410194, -0.5352839, 3.459662, 0.945098, 0, 1, 1,
0.9427625, 1.644099, 1.023546, 0.9490196, 0, 1, 1,
0.9443261, 0.2984484, 0.3915072, 0.9568627, 0, 1, 1,
0.9450737, 1.437968, 0.4298129, 0.9607843, 0, 1, 1,
0.9561964, 0.9357458, 0.1857089, 0.9686275, 0, 1, 1,
0.958939, 0.873641, 1.632452, 0.972549, 0, 1, 1,
0.9613427, 0.5396696, 0.7526149, 0.9803922, 0, 1, 1,
0.9615362, 0.02264217, 2.694448, 0.9843137, 0, 1, 1,
0.9633993, 0.7099103, -0.2938914, 0.9921569, 0, 1, 1,
0.9688112, 0.1092124, 2.669189, 0.9960784, 0, 1, 1,
0.9718004, 1.524319, -0.54693, 1, 0, 0.9960784, 1,
0.975506, 0.04478529, 1.026628, 1, 0, 0.9882353, 1,
0.9776685, 0.4615296, 1.838439, 1, 0, 0.9843137, 1,
0.9832649, 2.463, -0.7001565, 1, 0, 0.9764706, 1,
0.9928135, -0.4109906, 0.5191352, 1, 0, 0.972549, 1,
0.9945678, -0.3245675, 2.545961, 1, 0, 0.9647059, 1,
0.9954538, 0.6185925, 0.657917, 1, 0, 0.9607843, 1,
0.9986007, -0.458696, 4.732421, 1, 0, 0.9529412, 1,
1.001422, -0.1081298, -1.191679, 1, 0, 0.9490196, 1,
1.001756, -0.9799643, 0.4844441, 1, 0, 0.9411765, 1,
1.002269, -1.20023, 1.731388, 1, 0, 0.9372549, 1,
1.00527, 0.8917615, 2.557071, 1, 0, 0.9294118, 1,
1.006574, 1.0358, 0.6430247, 1, 0, 0.9254902, 1,
1.007627, 0.1341339, 1.105947, 1, 0, 0.9176471, 1,
1.013382, -0.1391631, 1.967923, 1, 0, 0.9137255, 1,
1.019021, -2.206902, 2.11003, 1, 0, 0.9058824, 1,
1.022573, -0.7608027, 3.760972, 1, 0, 0.9019608, 1,
1.023307, 0.4672602, 1.624019, 1, 0, 0.8941177, 1,
1.0236, -0.1626086, 3.251955, 1, 0, 0.8862745, 1,
1.024529, 0.2448977, 1.212272, 1, 0, 0.8823529, 1,
1.037582, -0.6763271, 1.505893, 1, 0, 0.8745098, 1,
1.051446, -1.357067, 2.019901, 1, 0, 0.8705882, 1,
1.052519, -0.4004645, 3.502112, 1, 0, 0.8627451, 1,
1.058864, -0.997761, 2.871526, 1, 0, 0.8588235, 1,
1.059074, 1.18489, -1.255815, 1, 0, 0.8509804, 1,
1.062767, 0.2765319, 2.273926, 1, 0, 0.8470588, 1,
1.063378, -0.3614398, 1.109068, 1, 0, 0.8392157, 1,
1.064842, -0.4398538, 2.289971, 1, 0, 0.8352941, 1,
1.067028, -0.8974786, 2.943605, 1, 0, 0.827451, 1,
1.070039, -0.174142, 1.305195, 1, 0, 0.8235294, 1,
1.07157, 0.3405303, 1.770146, 1, 0, 0.8156863, 1,
1.073419, -1.086151, 1.701349, 1, 0, 0.8117647, 1,
1.081972, -0.8376442, 4.048651, 1, 0, 0.8039216, 1,
1.083123, -0.4943266, 1.246445, 1, 0, 0.7960784, 1,
1.096635, 2.043837, -0.3662406, 1, 0, 0.7921569, 1,
1.100256, -0.06102408, 2.245857, 1, 0, 0.7843137, 1,
1.102608, -0.06918201, 2.689568, 1, 0, 0.7803922, 1,
1.108258, 0.8015218, 0.6215369, 1, 0, 0.772549, 1,
1.108534, -0.2822354, 4.319515, 1, 0, 0.7686275, 1,
1.115405, -2.644429, 1.744962, 1, 0, 0.7607843, 1,
1.12366, -0.2269804, 1.62499, 1, 0, 0.7568628, 1,
1.128014, -0.7157652, 1.198183, 1, 0, 0.7490196, 1,
1.130121, -0.2966919, 1.963955, 1, 0, 0.7450981, 1,
1.130714, 1.351996, 0.6246406, 1, 0, 0.7372549, 1,
1.135746, -1.192483, 4.200252, 1, 0, 0.7333333, 1,
1.144102, 0.6864291, 1.686171, 1, 0, 0.7254902, 1,
1.145028, 1.307073, 1.637904, 1, 0, 0.7215686, 1,
1.164899, -0.3752085, 1.663544, 1, 0, 0.7137255, 1,
1.168118, 0.3556559, 3.089955, 1, 0, 0.7098039, 1,
1.171722, 1.427875, -0.4332059, 1, 0, 0.7019608, 1,
1.171961, 0.8807619, 0.2631001, 1, 0, 0.6941177, 1,
1.173253, 1.303944, 0.7772014, 1, 0, 0.6901961, 1,
1.174856, -0.05736772, 1.861409, 1, 0, 0.682353, 1,
1.178033, 0.8021416, 1.522734, 1, 0, 0.6784314, 1,
1.201825, 0.03159484, 0.6531078, 1, 0, 0.6705883, 1,
1.205865, 1.369459, 0.5669783, 1, 0, 0.6666667, 1,
1.209161, 0.6645517, 0.7503687, 1, 0, 0.6588235, 1,
1.20998, 0.5409515, -0.04673215, 1, 0, 0.654902, 1,
1.21468, -0.03561598, 0.6845222, 1, 0, 0.6470588, 1,
1.215157, 1.907183, 0.2261614, 1, 0, 0.6431373, 1,
1.221853, 1.136112, 0.1479709, 1, 0, 0.6352941, 1,
1.235329, 0.6553092, -0.7353845, 1, 0, 0.6313726, 1,
1.238472, 1.241568, 1.549949, 1, 0, 0.6235294, 1,
1.242084, -0.3720532, 2.262842, 1, 0, 0.6196079, 1,
1.249112, -0.1265243, 2.921104, 1, 0, 0.6117647, 1,
1.249618, 0.1297275, 0.6620434, 1, 0, 0.6078432, 1,
1.254923, -1.237533, 3.543498, 1, 0, 0.6, 1,
1.270608, 0.4883985, 1.420913, 1, 0, 0.5921569, 1,
1.276737, -0.8353245, 2.098475, 1, 0, 0.5882353, 1,
1.278572, 0.6459728, -0.7203318, 1, 0, 0.5803922, 1,
1.288153, -1.0997, 2.373292, 1, 0, 0.5764706, 1,
1.293361, -1.55594, 2.203081, 1, 0, 0.5686275, 1,
1.311051, -0.02479397, 1.822203, 1, 0, 0.5647059, 1,
1.320905, 2.155586, 1.935927, 1, 0, 0.5568628, 1,
1.321363, 0.6203602, 1.781664, 1, 0, 0.5529412, 1,
1.324168, -1.643974, 2.917954, 1, 0, 0.5450981, 1,
1.331223, -0.794241, 2.527505, 1, 0, 0.5411765, 1,
1.333923, 0.8392199, 1.617565, 1, 0, 0.5333334, 1,
1.344856, -0.6950581, 3.441317, 1, 0, 0.5294118, 1,
1.358081, 0.2859455, 1.452092, 1, 0, 0.5215687, 1,
1.372173, 0.06473619, 0.2697507, 1, 0, 0.5176471, 1,
1.37592, -1.304537, 2.279152, 1, 0, 0.509804, 1,
1.385027, -0.9693409, 2.007064, 1, 0, 0.5058824, 1,
1.386303, 0.8087828, 1.280808, 1, 0, 0.4980392, 1,
1.390486, -0.4441764, 1.941634, 1, 0, 0.4901961, 1,
1.395616, -1.400843, 3.599426, 1, 0, 0.4862745, 1,
1.397221, -0.7210754, 3.343733, 1, 0, 0.4784314, 1,
1.409295, -0.4771048, 3.024171, 1, 0, 0.4745098, 1,
1.418462, -0.557338, 1.005407, 1, 0, 0.4666667, 1,
1.424522, -0.7674367, 1.054907, 1, 0, 0.4627451, 1,
1.428774, 0.2192681, 1.433725, 1, 0, 0.454902, 1,
1.435485, 0.02110073, 3.458189, 1, 0, 0.4509804, 1,
1.437077, -0.9898024, 0.9218081, 1, 0, 0.4431373, 1,
1.448267, -0.6866312, 2.785956, 1, 0, 0.4392157, 1,
1.450186, 0.2816922, 2.432525, 1, 0, 0.4313726, 1,
1.476056, 0.9643074, 0.8389483, 1, 0, 0.427451, 1,
1.480663, 0.1686086, 2.25521, 1, 0, 0.4196078, 1,
1.482506, 1.409191, 0.6668299, 1, 0, 0.4156863, 1,
1.488123, 1.421352, 0.3849731, 1, 0, 0.4078431, 1,
1.489057, -0.1378415, 2.423698, 1, 0, 0.4039216, 1,
1.513487, 0.109925, 1.752914, 1, 0, 0.3960784, 1,
1.521514, 0.5285076, 1.310405, 1, 0, 0.3882353, 1,
1.53295, -0.3414026, 2.528136, 1, 0, 0.3843137, 1,
1.534529, 0.8896354, -0.02661007, 1, 0, 0.3764706, 1,
1.539102, -0.7367652, -1.247917, 1, 0, 0.372549, 1,
1.539439, 1.024646, 1.725758, 1, 0, 0.3647059, 1,
1.567563, -1.157107, 1.29214, 1, 0, 0.3607843, 1,
1.575148, -1.341345, 2.101846, 1, 0, 0.3529412, 1,
1.576885, 0.008675591, 1.499331, 1, 0, 0.3490196, 1,
1.577991, -1.221248, 2.286318, 1, 0, 0.3411765, 1,
1.588716, 0.008891937, 1.344291, 1, 0, 0.3372549, 1,
1.598075, 0.4087396, 2.746536, 1, 0, 0.3294118, 1,
1.618165, -2.286546, 2.079649, 1, 0, 0.3254902, 1,
1.619029, -1.54867, 1.654219, 1, 0, 0.3176471, 1,
1.627107, -0.08228263, 1.535826, 1, 0, 0.3137255, 1,
1.631886, 1.777406, 0.03408968, 1, 0, 0.3058824, 1,
1.634979, 0.5923402, 1.003797, 1, 0, 0.2980392, 1,
1.638826, 0.6720313, 1.684525, 1, 0, 0.2941177, 1,
1.645443, 1.837626, 0.07142708, 1, 0, 0.2862745, 1,
1.647628, 0.9327539, -0.6405299, 1, 0, 0.282353, 1,
1.656427, -0.7137559, 1.441366, 1, 0, 0.2745098, 1,
1.661804, -0.9081978, 1.846772, 1, 0, 0.2705882, 1,
1.672745, 0.4860266, 3.169525, 1, 0, 0.2627451, 1,
1.698731, 1.022246, 0.05210066, 1, 0, 0.2588235, 1,
1.705956, 2.483731, 1.42445, 1, 0, 0.2509804, 1,
1.733966, -0.2257859, 3.217374, 1, 0, 0.2470588, 1,
1.740561, -0.8708188, 2.257689, 1, 0, 0.2392157, 1,
1.748964, -1.36139, 1.206948, 1, 0, 0.2352941, 1,
1.764493, 0.5174087, 1.703233, 1, 0, 0.227451, 1,
1.776957, 0.8964059, -0.3331563, 1, 0, 0.2235294, 1,
1.804757, -1.043174, 0.5680313, 1, 0, 0.2156863, 1,
1.81712, 0.4225227, 0.741242, 1, 0, 0.2117647, 1,
1.819679, -0.1131415, 2.087198, 1, 0, 0.2039216, 1,
1.837339, -0.0732048, 2.098779, 1, 0, 0.1960784, 1,
1.84843, -0.9815922, 2.032537, 1, 0, 0.1921569, 1,
1.866231, -0.1732224, 0.2501604, 1, 0, 0.1843137, 1,
1.89681, -0.2192377, 1.546495, 1, 0, 0.1803922, 1,
1.911706, 0.188371, 0.3783586, 1, 0, 0.172549, 1,
1.943224, -1.563184, 1.983895, 1, 0, 0.1686275, 1,
1.956709, -1.58221, 2.993648, 1, 0, 0.1607843, 1,
1.957656, 0.9253244, 0.9777963, 1, 0, 0.1568628, 1,
2.023533, 1.151422, 0.8748436, 1, 0, 0.1490196, 1,
2.025548, -0.3853267, 0.904348, 1, 0, 0.145098, 1,
2.02821, 1.697604, 0.6069129, 1, 0, 0.1372549, 1,
2.033949, -0.7493551, 3.310979, 1, 0, 0.1333333, 1,
2.037409, -0.7391077, 1.527317, 1, 0, 0.1254902, 1,
2.085176, 0.3313006, 1.735034, 1, 0, 0.1215686, 1,
2.144026, -0.2467282, 1.748817, 1, 0, 0.1137255, 1,
2.184323, -0.1857716, 1.532291, 1, 0, 0.1098039, 1,
2.240902, 0.1274812, 1.830375, 1, 0, 0.1019608, 1,
2.309678, 1.687153, -0.156276, 1, 0, 0.09411765, 1,
2.310037, -1.461926, 1.062792, 1, 0, 0.09019608, 1,
2.348895, 2.809968, 1.10923, 1, 0, 0.08235294, 1,
2.38541, -1.611237, 1.435589, 1, 0, 0.07843138, 1,
2.38585, 0.4857727, -0.4467829, 1, 0, 0.07058824, 1,
2.461453, -0.2749421, 0.4269557, 1, 0, 0.06666667, 1,
2.478979, -0.8601804, 2.36957, 1, 0, 0.05882353, 1,
2.651462, -0.8486812, 1.705165, 1, 0, 0.05490196, 1,
2.651533, -0.3479999, 2.913175, 1, 0, 0.04705882, 1,
2.664783, -2.018811, 1.997348, 1, 0, 0.04313726, 1,
2.676651, -1.433625, 3.24417, 1, 0, 0.03529412, 1,
2.743486, 0.09507225, 2.368257, 1, 0, 0.03137255, 1,
2.839794, -0.4158714, 2.516627, 1, 0, 0.02352941, 1,
2.889808, -1.156825, 0.9162207, 1, 0, 0.01960784, 1,
2.933171, -0.5072752, 3.42515, 1, 0, 0.01176471, 1,
3.528918, -0.3290722, 0.4447691, 1, 0, 0.007843138, 1
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
0.1415974, -5.085608, -7.243611, 0, -0.5, 0.5, 0.5,
0.1415974, -5.085608, -7.243611, 1, -0.5, 0.5, 0.5,
0.1415974, -5.085608, -7.243611, 1, 1.5, 0.5, 0.5,
0.1415974, -5.085608, -7.243611, 0, 1.5, 0.5, 0.5
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
-4.394025, -0.121987, -7.243611, 0, -0.5, 0.5, 0.5,
-4.394025, -0.121987, -7.243611, 1, -0.5, 0.5, 0.5,
-4.394025, -0.121987, -7.243611, 1, 1.5, 0.5, 0.5,
-4.394025, -0.121987, -7.243611, 0, 1.5, 0.5, 0.5
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
-4.394025, -5.085608, 0.2333157, 0, -0.5, 0.5, 0.5,
-4.394025, -5.085608, 0.2333157, 1, -0.5, 0.5, 0.5,
-4.394025, -5.085608, 0.2333157, 1, 1.5, 0.5, 0.5,
-4.394025, -5.085608, 0.2333157, 0, 1.5, 0.5, 0.5
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
-3, -3.940157, -5.518167,
3, -3.940157, -5.518167,
-3, -3.940157, -5.518167,
-3, -4.131065, -5.80574,
-2, -3.940157, -5.518167,
-2, -4.131065, -5.80574,
-1, -3.940157, -5.518167,
-1, -4.131065, -5.80574,
0, -3.940157, -5.518167,
0, -4.131065, -5.80574,
1, -3.940157, -5.518167,
1, -4.131065, -5.80574,
2, -3.940157, -5.518167,
2, -4.131065, -5.80574,
3, -3.940157, -5.518167,
3, -4.131065, -5.80574
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
-3, -4.512883, -6.380888, 0, -0.5, 0.5, 0.5,
-3, -4.512883, -6.380888, 1, -0.5, 0.5, 0.5,
-3, -4.512883, -6.380888, 1, 1.5, 0.5, 0.5,
-3, -4.512883, -6.380888, 0, 1.5, 0.5, 0.5,
-2, -4.512883, -6.380888, 0, -0.5, 0.5, 0.5,
-2, -4.512883, -6.380888, 1, -0.5, 0.5, 0.5,
-2, -4.512883, -6.380888, 1, 1.5, 0.5, 0.5,
-2, -4.512883, -6.380888, 0, 1.5, 0.5, 0.5,
-1, -4.512883, -6.380888, 0, -0.5, 0.5, 0.5,
-1, -4.512883, -6.380888, 1, -0.5, 0.5, 0.5,
-1, -4.512883, -6.380888, 1, 1.5, 0.5, 0.5,
-1, -4.512883, -6.380888, 0, 1.5, 0.5, 0.5,
0, -4.512883, -6.380888, 0, -0.5, 0.5, 0.5,
0, -4.512883, -6.380888, 1, -0.5, 0.5, 0.5,
0, -4.512883, -6.380888, 1, 1.5, 0.5, 0.5,
0, -4.512883, -6.380888, 0, 1.5, 0.5, 0.5,
1, -4.512883, -6.380888, 0, -0.5, 0.5, 0.5,
1, -4.512883, -6.380888, 1, -0.5, 0.5, 0.5,
1, -4.512883, -6.380888, 1, 1.5, 0.5, 0.5,
1, -4.512883, -6.380888, 0, 1.5, 0.5, 0.5,
2, -4.512883, -6.380888, 0, -0.5, 0.5, 0.5,
2, -4.512883, -6.380888, 1, -0.5, 0.5, 0.5,
2, -4.512883, -6.380888, 1, 1.5, 0.5, 0.5,
2, -4.512883, -6.380888, 0, 1.5, 0.5, 0.5,
3, -4.512883, -6.380888, 0, -0.5, 0.5, 0.5,
3, -4.512883, -6.380888, 1, -0.5, 0.5, 0.5,
3, -4.512883, -6.380888, 1, 1.5, 0.5, 0.5,
3, -4.512883, -6.380888, 0, 1.5, 0.5, 0.5
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
-3.347343, -2, -5.518167,
-3.347343, 2, -5.518167,
-3.347343, -2, -5.518167,
-3.52179, -2, -5.80574,
-3.347343, 0, -5.518167,
-3.52179, 0, -5.80574,
-3.347343, 2, -5.518167,
-3.52179, 2, -5.80574
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
-3.870684, -2, -6.380888, 0, -0.5, 0.5, 0.5,
-3.870684, -2, -6.380888, 1, -0.5, 0.5, 0.5,
-3.870684, -2, -6.380888, 1, 1.5, 0.5, 0.5,
-3.870684, -2, -6.380888, 0, 1.5, 0.5, 0.5,
-3.870684, 0, -6.380888, 0, -0.5, 0.5, 0.5,
-3.870684, 0, -6.380888, 1, -0.5, 0.5, 0.5,
-3.870684, 0, -6.380888, 1, 1.5, 0.5, 0.5,
-3.870684, 0, -6.380888, 0, 1.5, 0.5, 0.5,
-3.870684, 2, -6.380888, 0, -0.5, 0.5, 0.5,
-3.870684, 2, -6.380888, 1, -0.5, 0.5, 0.5,
-3.870684, 2, -6.380888, 1, 1.5, 0.5, 0.5,
-3.870684, 2, -6.380888, 0, 1.5, 0.5, 0.5
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
-3.347343, -3.940157, -4,
-3.347343, -3.940157, 4,
-3.347343, -3.940157, -4,
-3.52179, -4.131065, -4,
-3.347343, -3.940157, -2,
-3.52179, -4.131065, -2,
-3.347343, -3.940157, 0,
-3.52179, -4.131065, 0,
-3.347343, -3.940157, 2,
-3.52179, -4.131065, 2,
-3.347343, -3.940157, 4,
-3.52179, -4.131065, 4
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
-3.870684, -4.512883, -4, 0, -0.5, 0.5, 0.5,
-3.870684, -4.512883, -4, 1, -0.5, 0.5, 0.5,
-3.870684, -4.512883, -4, 1, 1.5, 0.5, 0.5,
-3.870684, -4.512883, -4, 0, 1.5, 0.5, 0.5,
-3.870684, -4.512883, -2, 0, -0.5, 0.5, 0.5,
-3.870684, -4.512883, -2, 1, -0.5, 0.5, 0.5,
-3.870684, -4.512883, -2, 1, 1.5, 0.5, 0.5,
-3.870684, -4.512883, -2, 0, 1.5, 0.5, 0.5,
-3.870684, -4.512883, 0, 0, -0.5, 0.5, 0.5,
-3.870684, -4.512883, 0, 1, -0.5, 0.5, 0.5,
-3.870684, -4.512883, 0, 1, 1.5, 0.5, 0.5,
-3.870684, -4.512883, 0, 0, 1.5, 0.5, 0.5,
-3.870684, -4.512883, 2, 0, -0.5, 0.5, 0.5,
-3.870684, -4.512883, 2, 1, -0.5, 0.5, 0.5,
-3.870684, -4.512883, 2, 1, 1.5, 0.5, 0.5,
-3.870684, -4.512883, 2, 0, 1.5, 0.5, 0.5,
-3.870684, -4.512883, 4, 0, -0.5, 0.5, 0.5,
-3.870684, -4.512883, 4, 1, -0.5, 0.5, 0.5,
-3.870684, -4.512883, 4, 1, 1.5, 0.5, 0.5,
-3.870684, -4.512883, 4, 0, 1.5, 0.5, 0.5
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
-3.347343, -3.940157, -5.518167,
-3.347343, 3.696183, -5.518167,
-3.347343, -3.940157, 5.984798,
-3.347343, 3.696183, 5.984798,
-3.347343, -3.940157, -5.518167,
-3.347343, -3.940157, 5.984798,
-3.347343, 3.696183, -5.518167,
-3.347343, 3.696183, 5.984798,
-3.347343, -3.940157, -5.518167,
3.630538, -3.940157, -5.518167,
-3.347343, -3.940157, 5.984798,
3.630538, -3.940157, 5.984798,
-3.347343, 3.696183, -5.518167,
3.630538, 3.696183, -5.518167,
-3.347343, 3.696183, 5.984798,
3.630538, 3.696183, 5.984798,
3.630538, -3.940157, -5.518167,
3.630538, 3.696183, -5.518167,
3.630538, -3.940157, 5.984798,
3.630538, 3.696183, 5.984798,
3.630538, -3.940157, -5.518167,
3.630538, -3.940157, 5.984798,
3.630538, 3.696183, -5.518167,
3.630538, 3.696183, 5.984798
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
var radius = 8.260711;
var distance = 36.75283;
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
mvMatrix.translate( -0.1415974, 0.121987, -0.2333157 );
mvMatrix.scale( 1.279994, 1.169623, 0.7764644 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.75283);
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
oxycarboxin<-read.table("oxycarboxin.xyz")
```

```
## Error in read.table("oxycarboxin.xyz"): no lines available in input
```

```r
x<-oxycarboxin$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxycarboxin' not found
```

```r
y<-oxycarboxin$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxycarboxin' not found
```

```r
z<-oxycarboxin$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxycarboxin' not found
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
-3.245723, -0.2803133, -2.154774, 0, 0, 1, 1, 1,
-2.948518, 1.910553, -1.438676, 1, 0, 0, 1, 1,
-2.893979, 0.6273545, -0.4737794, 1, 0, 0, 1, 1,
-2.779276, 0.7084587, -1.953549, 1, 0, 0, 1, 1,
-2.702, 0.979797, -0.5770301, 1, 0, 0, 1, 1,
-2.529195, 0.6152243, -0.3818296, 1, 0, 0, 1, 1,
-2.52699, 0.3157667, -0.491647, 0, 0, 0, 1, 1,
-2.412941, -1.551071, -2.580096, 0, 0, 0, 1, 1,
-2.39948, 0.6207027, -0.9592196, 0, 0, 0, 1, 1,
-2.358569, -1.102545, -1.796647, 0, 0, 0, 1, 1,
-2.351029, 0.5408298, -2.48203, 0, 0, 0, 1, 1,
-2.315902, -0.8113984, -2.64408, 0, 0, 0, 1, 1,
-2.297737, -1.169538, -4.378777, 0, 0, 0, 1, 1,
-2.231605, 0.4248055, -1.187305, 1, 1, 1, 1, 1,
-2.206773, 0.924383, -1.481772, 1, 1, 1, 1, 1,
-2.206282, -0.4246204, -2.60068, 1, 1, 1, 1, 1,
-2.188096, -0.9431079, 0.3486477, 1, 1, 1, 1, 1,
-2.145356, -0.1106558, -0.6561781, 1, 1, 1, 1, 1,
-2.142925, -0.5519838, -2.1057, 1, 1, 1, 1, 1,
-2.134187, 0.7586466, -0.3317176, 1, 1, 1, 1, 1,
-2.111304, -1.467896, -1.432647, 1, 1, 1, 1, 1,
-2.099034, -0.4558919, -2.046959, 1, 1, 1, 1, 1,
-2.085984, 0.3218817, -0.7368445, 1, 1, 1, 1, 1,
-2.078608, 1.617491, -0.5158039, 1, 1, 1, 1, 1,
-2.053312, -0.5394862, -0.01871941, 1, 1, 1, 1, 1,
-1.967464, -0.5375519, -0.3911398, 1, 1, 1, 1, 1,
-1.941207, -2.236256, -3.661214, 1, 1, 1, 1, 1,
-1.898969, -0.6795237, -2.563699, 1, 1, 1, 1, 1,
-1.882795, 0.9973436, 0.2961586, 0, 0, 1, 1, 1,
-1.873483, -2.659588, -2.073083, 1, 0, 0, 1, 1,
-1.845518, -0.9892596, -1.217629, 1, 0, 0, 1, 1,
-1.831221, 1.169909, -0.005917442, 1, 0, 0, 1, 1,
-1.81969, -1.156144, -2.816786, 1, 0, 0, 1, 1,
-1.819659, 0.6893922, -1.497714, 1, 0, 0, 1, 1,
-1.77884, -0.2126525, 1.098473, 0, 0, 0, 1, 1,
-1.769044, 0.184999, 0.3888962, 0, 0, 0, 1, 1,
-1.760245, 0.2618238, -1.901512, 0, 0, 0, 1, 1,
-1.756467, -0.8213078, -1.718629, 0, 0, 0, 1, 1,
-1.755936, 0.04133339, -0.2840037, 0, 0, 0, 1, 1,
-1.754084, -0.9955233, -3.651628, 0, 0, 0, 1, 1,
-1.753989, 0.2822255, -1.681309, 0, 0, 0, 1, 1,
-1.737598, 0.6573872, -0.4597303, 1, 1, 1, 1, 1,
-1.736866, -0.2881284, -1.985018, 1, 1, 1, 1, 1,
-1.6825, 0.003551777, 0.005043432, 1, 1, 1, 1, 1,
-1.671024, -0.6124849, -1.706961, 1, 1, 1, 1, 1,
-1.666345, -0.7900364, -1.912524, 1, 1, 1, 1, 1,
-1.660578, 0.9208476, 0.2822944, 1, 1, 1, 1, 1,
-1.652407, 1.205335, -0.4958172, 1, 1, 1, 1, 1,
-1.64842, -0.5248125, -2.312774, 1, 1, 1, 1, 1,
-1.645839, -0.1360763, -1.494726, 1, 1, 1, 1, 1,
-1.63833, -1.835523, -3.303366, 1, 1, 1, 1, 1,
-1.637003, -0.6103771, -2.344971, 1, 1, 1, 1, 1,
-1.633308, 0.07146684, -1.495028, 1, 1, 1, 1, 1,
-1.611944, -0.136753, -0.1456965, 1, 1, 1, 1, 1,
-1.606512, -1.000019, -2.614433, 1, 1, 1, 1, 1,
-1.604374, 0.2263234, -0.1621417, 1, 1, 1, 1, 1,
-1.602986, -1.134579, -1.574612, 0, 0, 1, 1, 1,
-1.598675, 0.5630668, -2.694129, 1, 0, 0, 1, 1,
-1.58431, 2.706276, -0.5794727, 1, 0, 0, 1, 1,
-1.578933, -0.308794, 0.3524154, 1, 0, 0, 1, 1,
-1.569142, -0.2609316, 1.024994, 1, 0, 0, 1, 1,
-1.559033, -0.3070402, -0.8780876, 1, 0, 0, 1, 1,
-1.555917, -1.74301, -1.212787, 0, 0, 0, 1, 1,
-1.542186, 0.1374374, -2.54151, 0, 0, 0, 1, 1,
-1.540244, 1.42414, -0.49915, 0, 0, 0, 1, 1,
-1.540239, -0.8193421, -2.621139, 0, 0, 0, 1, 1,
-1.530643, 1.257484, -1.515014, 0, 0, 0, 1, 1,
-1.516889, -1.357064, -3.073954, 0, 0, 0, 1, 1,
-1.513231, 0.2787445, -2.038877, 0, 0, 0, 1, 1,
-1.511269, -1.167893, -3.086241, 1, 1, 1, 1, 1,
-1.503151, -0.1784219, -4.651846, 1, 1, 1, 1, 1,
-1.500125, 0.8005385, -2.278392, 1, 1, 1, 1, 1,
-1.495993, 0.3488701, -0.1730206, 1, 1, 1, 1, 1,
-1.491352, 0.4655909, -1.190443, 1, 1, 1, 1, 1,
-1.48834, -1.420771, -1.996153, 1, 1, 1, 1, 1,
-1.487732, -0.7983429, 0.08538774, 1, 1, 1, 1, 1,
-1.487092, 0.8411004, -3.244422, 1, 1, 1, 1, 1,
-1.482169, 0.1105955, -0.890952, 1, 1, 1, 1, 1,
-1.481415, 0.58525, -2.824061, 1, 1, 1, 1, 1,
-1.437216, -1.123863, -1.674114, 1, 1, 1, 1, 1,
-1.422886, 0.139965, -3.447186, 1, 1, 1, 1, 1,
-1.408531, -0.6279294, -2.028528, 1, 1, 1, 1, 1,
-1.407488, 1.451221, 0.3171172, 1, 1, 1, 1, 1,
-1.407387, 0.6370559, -1.587518, 1, 1, 1, 1, 1,
-1.405584, -1.446996, -4.580122, 0, 0, 1, 1, 1,
-1.397156, 0.8925405, -1.505132, 1, 0, 0, 1, 1,
-1.391698, -0.3489737, -1.345053, 1, 0, 0, 1, 1,
-1.381978, 0.6565636, -1.424943, 1, 0, 0, 1, 1,
-1.379217, 0.5707675, -0.671442, 1, 0, 0, 1, 1,
-1.379031, 0.5704809, -0.9755727, 1, 0, 0, 1, 1,
-1.368855, -0.3906342, -3.361519, 0, 0, 0, 1, 1,
-1.363193, -0.6552952, -1.92438, 0, 0, 0, 1, 1,
-1.360468, 0.3546093, -0.4979471, 0, 0, 0, 1, 1,
-1.355342, -0.8917586, -2.922106, 0, 0, 0, 1, 1,
-1.345909, -0.8813328, -2.585212, 0, 0, 0, 1, 1,
-1.340929, -1.237012, -2.49458, 0, 0, 0, 1, 1,
-1.33654, -0.4669364, -3.841733, 0, 0, 0, 1, 1,
-1.330006, -0.9366325, -2.467705, 1, 1, 1, 1, 1,
-1.327151, -0.1832427, -0.9173572, 1, 1, 1, 1, 1,
-1.326051, 0.5743092, -2.18706, 1, 1, 1, 1, 1,
-1.320958, -0.6432163, -2.473654, 1, 1, 1, 1, 1,
-1.316806, -0.7719997, -3.078329, 1, 1, 1, 1, 1,
-1.307436, 0.1043394, -1.967601, 1, 1, 1, 1, 1,
-1.307152, 0.979777, -1.611108, 1, 1, 1, 1, 1,
-1.305879, -1.44179, -0.7496395, 1, 1, 1, 1, 1,
-1.295358, 0.07693046, -0.9804327, 1, 1, 1, 1, 1,
-1.290421, -0.8396451, -1.908704, 1, 1, 1, 1, 1,
-1.290225, -0.4735276, -2.020145, 1, 1, 1, 1, 1,
-1.284893, -0.3855753, -1.564373, 1, 1, 1, 1, 1,
-1.275579, -1.737517, -1.424712, 1, 1, 1, 1, 1,
-1.257455, 1.176115, -1.708132, 1, 1, 1, 1, 1,
-1.253141, -0.7671726, -2.587155, 1, 1, 1, 1, 1,
-1.245333, 1.091474, -3.515354, 0, 0, 1, 1, 1,
-1.243857, -0.1473304, 0.3344727, 1, 0, 0, 1, 1,
-1.242775, 0.3396269, -0.9609917, 1, 0, 0, 1, 1,
-1.242401, -0.4628188, -0.2096601, 1, 0, 0, 1, 1,
-1.241695, 0.04609975, -1.68383, 1, 0, 0, 1, 1,
-1.239733, -0.1779057, -2.687441, 1, 0, 0, 1, 1,
-1.237177, -0.5266575, 0.2870904, 0, 0, 0, 1, 1,
-1.231922, -0.0150077, -1.112406, 0, 0, 0, 1, 1,
-1.219162, 0.6273773, -1.917618, 0, 0, 0, 1, 1,
-1.217635, -1.113008, -4.156136, 0, 0, 0, 1, 1,
-1.204224, 1.906334, -0.2131634, 0, 0, 0, 1, 1,
-1.203142, 1.390697, -2.626724, 0, 0, 0, 1, 1,
-1.199772, -0.5328541, -0.9463301, 0, 0, 0, 1, 1,
-1.196019, 0.1017379, -2.738411, 1, 1, 1, 1, 1,
-1.189774, 0.3261016, -1.067233, 1, 1, 1, 1, 1,
-1.175977, -0.4698636, -2.388203, 1, 1, 1, 1, 1,
-1.163795, 1.105587, 0.1712978, 1, 1, 1, 1, 1,
-1.161856, 1.257451, -2.920237, 1, 1, 1, 1, 1,
-1.156354, 1.79032, 0.2493243, 1, 1, 1, 1, 1,
-1.152409, 1.860774, 2.243173, 1, 1, 1, 1, 1,
-1.144665, 2.200685, -0.519219, 1, 1, 1, 1, 1,
-1.1375, 0.212939, -2.115472, 1, 1, 1, 1, 1,
-1.135576, 0.08757228, 0.183721, 1, 1, 1, 1, 1,
-1.131468, 0.4802894, -1.609015, 1, 1, 1, 1, 1,
-1.118375, -0.4687832, -2.319197, 1, 1, 1, 1, 1,
-1.117323, 0.4201727, -0.4148302, 1, 1, 1, 1, 1,
-1.108694, 0.4993489, -0.9331143, 1, 1, 1, 1, 1,
-1.106382, 0.7159944, -2.909583, 1, 1, 1, 1, 1,
-1.094771, 0.8032829, -2.285369, 0, 0, 1, 1, 1,
-1.094179, -1.172252, -1.739166, 1, 0, 0, 1, 1,
-1.090016, -1.157603, -3.650066, 1, 0, 0, 1, 1,
-1.089485, -1.030337, -2.338089, 1, 0, 0, 1, 1,
-1.088174, -1.478896, -1.910191, 1, 0, 0, 1, 1,
-1.088117, -0.06806947, -1.620924, 1, 0, 0, 1, 1,
-1.087493, 2.193648, 0.8164498, 0, 0, 0, 1, 1,
-1.086841, -1.666264, 0.1211826, 0, 0, 0, 1, 1,
-1.08062, 0.419132, -2.846993, 0, 0, 0, 1, 1,
-1.076733, -0.1913177, -1.876894, 0, 0, 0, 1, 1,
-1.067485, -1.154189, -2.264429, 0, 0, 0, 1, 1,
-1.065668, 0.3357794, -1.833756, 0, 0, 0, 1, 1,
-1.064275, 2.27798, -0.7134225, 0, 0, 0, 1, 1,
-1.062508, 0.03822579, -2.420113, 1, 1, 1, 1, 1,
-1.062295, 0.5318698, -2.160181, 1, 1, 1, 1, 1,
-1.061269, -0.3152548, -3.277521, 1, 1, 1, 1, 1,
-1.058002, -0.4480041, -0.8913756, 1, 1, 1, 1, 1,
-1.053588, 0.8948448, -1.167713, 1, 1, 1, 1, 1,
-1.053482, 0.7264927, -0.9912124, 1, 1, 1, 1, 1,
-1.050701, 0.7502312, -1.822485, 1, 1, 1, 1, 1,
-1.047095, 2.196848, -0.9168524, 1, 1, 1, 1, 1,
-1.045735, -0.860095, -2.495806, 1, 1, 1, 1, 1,
-1.040237, 0.2593483, -4.020868, 1, 1, 1, 1, 1,
-1.032288, -0.5648007, -1.52294, 1, 1, 1, 1, 1,
-1.028286, -0.1944646, -2.382919, 1, 1, 1, 1, 1,
-1.025305, -0.3179987, -1.947247, 1, 1, 1, 1, 1,
-1.022795, 2.065322, 1.298115, 1, 1, 1, 1, 1,
-1.02117, -1.402017, -2.681871, 1, 1, 1, 1, 1,
-1.018324, 2.586997, -0.9445373, 0, 0, 1, 1, 1,
-1.015476, -0.0485833, -1.489132, 1, 0, 0, 1, 1,
-1.014633, -0.161785, -1.041739, 1, 0, 0, 1, 1,
-1.011941, 2.168808, -0.1592948, 1, 0, 0, 1, 1,
-1.008242, 0.1978842, -2.396343, 1, 0, 0, 1, 1,
-1.007619, 0.6042606, -1.519304, 1, 0, 0, 1, 1,
-1.00493, 0.02050679, -2.591033, 0, 0, 0, 1, 1,
-1.004783, -0.4344937, -1.768572, 0, 0, 0, 1, 1,
-1.000882, -0.2585913, -2.470531, 0, 0, 0, 1, 1,
-0.987982, -0.9692794, -2.645553, 0, 0, 0, 1, 1,
-0.9853595, 2.28038, 0.9959448, 0, 0, 0, 1, 1,
-0.9838755, 0.2062182, -1.129957, 0, 0, 0, 1, 1,
-0.9752328, 0.4149998, -1.40958, 0, 0, 0, 1, 1,
-0.970266, 1.215697, -0.5697531, 1, 1, 1, 1, 1,
-0.9611497, 0.7092722, 0.2727456, 1, 1, 1, 1, 1,
-0.9500808, -1.428805, -3.075578, 1, 1, 1, 1, 1,
-0.9480422, -0.3471251, -2.257102, 1, 1, 1, 1, 1,
-0.9359483, -0.7794458, -1.6257, 1, 1, 1, 1, 1,
-0.9350558, 0.00850381, -2.007941, 1, 1, 1, 1, 1,
-0.9321823, -0.8950438, -1.540135, 1, 1, 1, 1, 1,
-0.9273998, -0.02832542, -1.134487, 1, 1, 1, 1, 1,
-0.9208929, -0.5910436, -3.1986, 1, 1, 1, 1, 1,
-0.9180763, -0.8629193, -1.477924, 1, 1, 1, 1, 1,
-0.9179426, 0.3410278, 0.7768877, 1, 1, 1, 1, 1,
-0.9174126, -0.1238701, -1.114026, 1, 1, 1, 1, 1,
-0.9118541, 1.625692, -0.178446, 1, 1, 1, 1, 1,
-0.9085232, -1.207529, -3.816088, 1, 1, 1, 1, 1,
-0.9069088, -0.5517029, -2.59742, 1, 1, 1, 1, 1,
-0.9003205, 0.07966681, -2.045716, 0, 0, 1, 1, 1,
-0.8949973, 0.443013, 0.2684848, 1, 0, 0, 1, 1,
-0.8759349, -0.8852899, -3.440045, 1, 0, 0, 1, 1,
-0.8708119, -0.02461483, -1.513021, 1, 0, 0, 1, 1,
-0.8703122, -0.1178358, -2.349442, 1, 0, 0, 1, 1,
-0.8691502, 1.851557, -0.5881075, 1, 0, 0, 1, 1,
-0.8643498, -0.232483, -4.30867, 0, 0, 0, 1, 1,
-0.8618022, 0.7489451, -0.3775159, 0, 0, 0, 1, 1,
-0.8617296, 1.09527, -1.026149, 0, 0, 0, 1, 1,
-0.8590285, 1.813241, -0.8851475, 0, 0, 0, 1, 1,
-0.8588215, 0.1956277, 1.054918, 0, 0, 0, 1, 1,
-0.8578736, 0.6220936, -2.029716, 0, 0, 0, 1, 1,
-0.8562347, 0.502444, -1.069064, 0, 0, 0, 1, 1,
-0.8558394, 0.1932009, -2.052888, 1, 1, 1, 1, 1,
-0.8550194, -0.1009682, -2.163548, 1, 1, 1, 1, 1,
-0.85443, -0.3730536, -2.361464, 1, 1, 1, 1, 1,
-0.8509898, 0.0314736, -2.787985, 1, 1, 1, 1, 1,
-0.8509783, -0.4065398, -2.114128, 1, 1, 1, 1, 1,
-0.8504223, 1.454984, 1.436467, 1, 1, 1, 1, 1,
-0.8447747, -2.797027, -1.680384, 1, 1, 1, 1, 1,
-0.8422347, -0.1495309, -1.610152, 1, 1, 1, 1, 1,
-0.8416302, 0.4662846, -3.015756, 1, 1, 1, 1, 1,
-0.8412607, -1.067766, -4.620464, 1, 1, 1, 1, 1,
-0.83952, -0.9307776, -2.992064, 1, 1, 1, 1, 1,
-0.8357441, -0.4030972, -1.728394, 1, 1, 1, 1, 1,
-0.8346161, -0.3345534, -1.843832, 1, 1, 1, 1, 1,
-0.8333918, 0.1794629, 0.2633447, 1, 1, 1, 1, 1,
-0.8311659, 1.778415, 0.7914569, 1, 1, 1, 1, 1,
-0.8130829, 0.2084161, -1.618041, 0, 0, 1, 1, 1,
-0.8093577, 1.137765, -1.222564, 1, 0, 0, 1, 1,
-0.8080602, -2.853494, -1.970232, 1, 0, 0, 1, 1,
-0.8042999, -0.1946547, -0.8316103, 1, 0, 0, 1, 1,
-0.800714, -1.967904, -0.8774899, 1, 0, 0, 1, 1,
-0.8005825, 1.756083, 0.7090963, 1, 0, 0, 1, 1,
-0.796221, 1.606187, 0.276646, 0, 0, 0, 1, 1,
-0.79383, 0.3328947, -1.442688, 0, 0, 0, 1, 1,
-0.7888744, 1.851763, -0.6464493, 0, 0, 0, 1, 1,
-0.7732013, -0.5083099, -0.4687852, 0, 0, 0, 1, 1,
-0.766399, 1.484839, -1.899485, 0, 0, 0, 1, 1,
-0.7659145, -1.583325, -2.541122, 0, 0, 0, 1, 1,
-0.7651758, -1.177746, -2.765717, 0, 0, 0, 1, 1,
-0.7643953, 0.118956, -0.003604377, 1, 1, 1, 1, 1,
-0.7573231, -0.89034, -1.551488, 1, 1, 1, 1, 1,
-0.7573035, -0.6067994, -3.289926, 1, 1, 1, 1, 1,
-0.7552891, 0.04856726, -0.3958903, 1, 1, 1, 1, 1,
-0.7540252, 0.1192732, -2.427398, 1, 1, 1, 1, 1,
-0.7295518, -0.1213578, -1.641064, 1, 1, 1, 1, 1,
-0.7260014, 0.3461112, -0.5772818, 1, 1, 1, 1, 1,
-0.7253979, 1.934069, -1.221899, 1, 1, 1, 1, 1,
-0.7237, -0.8274896, -2.428622, 1, 1, 1, 1, 1,
-0.7222258, -1.114454, -1.040661, 1, 1, 1, 1, 1,
-0.7187476, -0.9659725, -0.1104719, 1, 1, 1, 1, 1,
-0.7155313, -1.577457, -0.6165539, 1, 1, 1, 1, 1,
-0.7153272, 0.02227513, -0.9753059, 1, 1, 1, 1, 1,
-0.7131654, -0.7756508, -2.700977, 1, 1, 1, 1, 1,
-0.7120269, -0.4827844, -1.270791, 1, 1, 1, 1, 1,
-0.7062648, 1.19816, -1.491697, 0, 0, 1, 1, 1,
-0.7006357, 0.6843134, -1.549536, 1, 0, 0, 1, 1,
-0.6976441, -0.6828656, -2.612917, 1, 0, 0, 1, 1,
-0.6970356, 0.4615398, -1.79218, 1, 0, 0, 1, 1,
-0.6961036, 0.5871922, -3.465547, 1, 0, 0, 1, 1,
-0.6885866, 2.028812, -0.9870575, 1, 0, 0, 1, 1,
-0.6667398, 0.8276122, 0.2495596, 0, 0, 0, 1, 1,
-0.6648732, 0.1667173, -0.3126557, 0, 0, 0, 1, 1,
-0.6634179, 1.714619, -0.3822108, 0, 0, 0, 1, 1,
-0.6564426, 0.3436481, -0.3167942, 0, 0, 0, 1, 1,
-0.6559796, 2.314008, -0.9293648, 0, 0, 0, 1, 1,
-0.6484604, 0.3226859, -3.284082, 0, 0, 0, 1, 1,
-0.6483212, 0.4563063, -0.231124, 0, 0, 0, 1, 1,
-0.6458625, 0.7517566, -1.205549, 1, 1, 1, 1, 1,
-0.6454593, -0.1623733, -2.592418, 1, 1, 1, 1, 1,
-0.6411675, 0.1740438, -2.226691, 1, 1, 1, 1, 1,
-0.6411669, -0.1732983, -0.6572096, 1, 1, 1, 1, 1,
-0.639421, -0.4259345, -2.510525, 1, 1, 1, 1, 1,
-0.6380878, 0.3599255, -1.672384, 1, 1, 1, 1, 1,
-0.6339368, 2.84658, 1.016688, 1, 1, 1, 1, 1,
-0.6325545, -0.7541408, -3.171452, 1, 1, 1, 1, 1,
-0.629134, -0.589973, -1.51688, 1, 1, 1, 1, 1,
-0.6284127, 1.242208, 0.3070276, 1, 1, 1, 1, 1,
-0.6237914, 0.4275537, -1.31333, 1, 1, 1, 1, 1,
-0.6232072, -0.511363, -0.8122082, 1, 1, 1, 1, 1,
-0.6197305, -0.5548913, -2.632342, 1, 1, 1, 1, 1,
-0.6187872, -1.480096, -3.257658, 1, 1, 1, 1, 1,
-0.6118879, -1.449211, -2.708068, 1, 1, 1, 1, 1,
-0.6096624, -1.49667, -2.516645, 0, 0, 1, 1, 1,
-0.609152, 0.4108045, -1.699725, 1, 0, 0, 1, 1,
-0.6085247, 0.5461179, -1.738145, 1, 0, 0, 1, 1,
-0.6059768, -0.4376357, -1.351437, 1, 0, 0, 1, 1,
-0.6058798, 1.276663, -0.01583025, 1, 0, 0, 1, 1,
-0.6046811, -0.5255511, -1.859829, 1, 0, 0, 1, 1,
-0.5978814, 0.09195872, -0.4866806, 0, 0, 0, 1, 1,
-0.596435, 1.271897, -1.502884, 0, 0, 0, 1, 1,
-0.591753, -0.6597338, -2.546781, 0, 0, 0, 1, 1,
-0.5890372, -1.430773, -3.287243, 0, 0, 0, 1, 1,
-0.5873753, 0.5902464, 0.03985545, 0, 0, 0, 1, 1,
-0.5847102, 1.030338, -0.812301, 0, 0, 0, 1, 1,
-0.5845047, 1.155102, -1.912758, 0, 0, 0, 1, 1,
-0.5832296, -1.490737, -2.75801, 1, 1, 1, 1, 1,
-0.5812686, -2.343366, -0.428394, 1, 1, 1, 1, 1,
-0.5777704, 2.237517, -0.6582609, 1, 1, 1, 1, 1,
-0.5776258, 1.326893, -1.867598, 1, 1, 1, 1, 1,
-0.5776219, 0.6478777, -0.7743279, 1, 1, 1, 1, 1,
-0.5751352, 1.20689, -0.4380499, 1, 1, 1, 1, 1,
-0.5719845, 0.7764907, 2.584532, 1, 1, 1, 1, 1,
-0.5701637, -0.5705717, -2.155427, 1, 1, 1, 1, 1,
-0.5629516, -2.172498, -5.350647, 1, 1, 1, 1, 1,
-0.5619209, -2.761179, -2.955056, 1, 1, 1, 1, 1,
-0.5577884, -0.9677104, -2.750115, 1, 1, 1, 1, 1,
-0.556987, -0.886997, -1.263695, 1, 1, 1, 1, 1,
-0.5567619, -0.2536712, -1.419506, 1, 1, 1, 1, 1,
-0.5487757, -0.1940217, -3.031535, 1, 1, 1, 1, 1,
-0.5480589, -1.370638, -2.221682, 1, 1, 1, 1, 1,
-0.5474572, -0.1761889, -2.623719, 0, 0, 1, 1, 1,
-0.5425855, 0.1616356, -0.7318, 1, 0, 0, 1, 1,
-0.541592, 0.9188134, -2.100182, 1, 0, 0, 1, 1,
-0.5389774, 0.2592657, -1.842579, 1, 0, 0, 1, 1,
-0.5358903, -0.3221137, -2.984104, 1, 0, 0, 1, 1,
-0.534875, -1.342522, -2.058165, 1, 0, 0, 1, 1,
-0.5310882, 0.5402039, 0.8739722, 0, 0, 0, 1, 1,
-0.5306191, 0.2686434, -0.9323248, 0, 0, 0, 1, 1,
-0.5278204, 0.5515575, -0.07188064, 0, 0, 0, 1, 1,
-0.5242136, 1.219513, -0.4907978, 0, 0, 0, 1, 1,
-0.5238646, 1.665653, 1.183684, 0, 0, 0, 1, 1,
-0.5234873, 0.269751, -0.190871, 0, 0, 0, 1, 1,
-0.5190128, -1.279539, -1.647874, 0, 0, 0, 1, 1,
-0.5178001, 0.4571461, 0.07481276, 1, 1, 1, 1, 1,
-0.5175251, 0.7844759, -1.524318, 1, 1, 1, 1, 1,
-0.5150173, 0.4335864, 0.7079493, 1, 1, 1, 1, 1,
-0.5087047, 1.28055, -1.578481, 1, 1, 1, 1, 1,
-0.5040572, 0.6923738, -1.226615, 1, 1, 1, 1, 1,
-0.5011975, -0.1446509, -0.3811061, 1, 1, 1, 1, 1,
-0.497507, 1.169945, -2.083233, 1, 1, 1, 1, 1,
-0.4964341, -1.810966, -3.379709, 1, 1, 1, 1, 1,
-0.4946335, 0.9456023, 0.1145819, 1, 1, 1, 1, 1,
-0.4903658, -2.605649, -2.593318, 1, 1, 1, 1, 1,
-0.4882413, -0.3644136, -1.818068, 1, 1, 1, 1, 1,
-0.4880876, -1.06999, -3.331646, 1, 1, 1, 1, 1,
-0.481372, -0.07769044, -1.593867, 1, 1, 1, 1, 1,
-0.4762116, 0.4854001, -2.228326, 1, 1, 1, 1, 1,
-0.4756546, -0.2684425, -3.880597, 1, 1, 1, 1, 1,
-0.4716235, 0.8083241, -0.2431313, 0, 0, 1, 1, 1,
-0.4702919, -1.832964, -4.096908, 1, 0, 0, 1, 1,
-0.4679609, -0.242683, -2.906947, 1, 0, 0, 1, 1,
-0.4619318, -0.5489807, -4.378237, 1, 0, 0, 1, 1,
-0.4536934, -1.81987, -3.29997, 1, 0, 0, 1, 1,
-0.4519963, 0.9226356, -0.6354088, 1, 0, 0, 1, 1,
-0.4502158, -0.5664217, -3.945432, 0, 0, 0, 1, 1,
-0.4418331, -0.7461956, -2.645055, 0, 0, 0, 1, 1,
-0.4391217, -1.100247, -2.860209, 0, 0, 0, 1, 1,
-0.4338973, 0.5801588, -1.550322, 0, 0, 0, 1, 1,
-0.4293234, -0.6882013, -0.8746032, 0, 0, 0, 1, 1,
-0.4273109, 1.106254, 0.001842834, 0, 0, 0, 1, 1,
-0.4255648, 0.2855465, -0.8618256, 0, 0, 0, 1, 1,
-0.4208646, -0.6363246, -1.460636, 1, 1, 1, 1, 1,
-0.4174725, 0.8319139, -1.176735, 1, 1, 1, 1, 1,
-0.4171167, -0.259227, -1.877825, 1, 1, 1, 1, 1,
-0.4147986, 1.162557, -2.21467, 1, 1, 1, 1, 1,
-0.4120767, -0.2690684, -0.6872101, 1, 1, 1, 1, 1,
-0.4098478, 0.6469285, -1.264007, 1, 1, 1, 1, 1,
-0.4089967, -1.190793, -1.709697, 1, 1, 1, 1, 1,
-0.4075114, 0.4099458, -1.935105, 1, 1, 1, 1, 1,
-0.4045109, -0.6881407, -2.206907, 1, 1, 1, 1, 1,
-0.4042248, -1.09308, -1.52133, 1, 1, 1, 1, 1,
-0.3981313, -0.8101228, -0.5528447, 1, 1, 1, 1, 1,
-0.3952341, -0.6162188, -3.156579, 1, 1, 1, 1, 1,
-0.3914448, 1.421835, -1.49968, 1, 1, 1, 1, 1,
-0.3865697, 0.603301, -1.970205, 1, 1, 1, 1, 1,
-0.3860089, -1.734449, -1.837059, 1, 1, 1, 1, 1,
-0.380352, -0.421229, -2.586954, 0, 0, 1, 1, 1,
-0.3763916, 1.158269, -2.123843, 1, 0, 0, 1, 1,
-0.3625704, -0.8182125, -0.5463171, 1, 0, 0, 1, 1,
-0.3620009, 1.151827, 0.01214496, 1, 0, 0, 1, 1,
-0.3619577, 0.5944813, -0.9045875, 1, 0, 0, 1, 1,
-0.3601578, 0.9342166, 0.3350349, 1, 0, 0, 1, 1,
-0.3585546, 2.235254, 0.178607, 0, 0, 0, 1, 1,
-0.3568785, -1.736091, -2.88782, 0, 0, 0, 1, 1,
-0.3552201, 0.02459347, -0.8611019, 0, 0, 0, 1, 1,
-0.3549283, 1.218935, -0.08945575, 0, 0, 0, 1, 1,
-0.3521183, 1.843491, 2.141511, 0, 0, 0, 1, 1,
-0.3518756, -0.5681646, -2.080956, 0, 0, 0, 1, 1,
-0.343982, 0.1514553, -0.5484096, 0, 0, 0, 1, 1,
-0.3432534, -1.012865, -2.992506, 1, 1, 1, 1, 1,
-0.3347716, -0.210803, -0.7278324, 1, 1, 1, 1, 1,
-0.3317849, 0.565207, 0.1676912, 1, 1, 1, 1, 1,
-0.3310427, 0.6971056, 0.391418, 1, 1, 1, 1, 1,
-0.3240111, -0.5989047, -3.732437, 1, 1, 1, 1, 1,
-0.3207438, -0.1194154, -0.6108573, 1, 1, 1, 1, 1,
-0.3199137, 0.6398411, -0.9505896, 1, 1, 1, 1, 1,
-0.3188669, -1.776489, -2.946849, 1, 1, 1, 1, 1,
-0.3173606, 0.07861987, -2.672536, 1, 1, 1, 1, 1,
-0.3136998, -0.1521194, -1.323524, 1, 1, 1, 1, 1,
-0.3131523, 0.6977515, 0.7013028, 1, 1, 1, 1, 1,
-0.3091932, 0.05827381, -1.354809, 1, 1, 1, 1, 1,
-0.3088812, -0.03544677, -0.6174561, 1, 1, 1, 1, 1,
-0.3085867, -1.500918, -3.571017, 1, 1, 1, 1, 1,
-0.3051534, -0.07884621, -0.1398828, 1, 1, 1, 1, 1,
-0.3047416, -0.1936597, -2.773375, 0, 0, 1, 1, 1,
-0.3023582, -0.4981249, -0.9629656, 1, 0, 0, 1, 1,
-0.3022131, -0.2245362, -4.068766, 1, 0, 0, 1, 1,
-0.3003236, -0.01284206, -1.254452, 1, 0, 0, 1, 1,
-0.2995734, -0.5756506, -3.496869, 1, 0, 0, 1, 1,
-0.2993806, 1.094092, 0.8918151, 1, 0, 0, 1, 1,
-0.2978103, -0.2222728, -1.406269, 0, 0, 0, 1, 1,
-0.2966056, 0.03818996, -0.8511875, 0, 0, 0, 1, 1,
-0.2954778, 0.1769466, -0.8391677, 0, 0, 0, 1, 1,
-0.2949463, -0.1994803, -1.378595, 0, 0, 0, 1, 1,
-0.2884212, -1.649343, -2.748204, 0, 0, 0, 1, 1,
-0.2836873, -1.121422, -3.023521, 0, 0, 0, 1, 1,
-0.2835338, -1.154744, -3.599547, 0, 0, 0, 1, 1,
-0.2821087, -0.4069503, -2.380699, 1, 1, 1, 1, 1,
-0.2813683, -1.272511, -3.247854, 1, 1, 1, 1, 1,
-0.2801169, 0.5299147, -0.05257766, 1, 1, 1, 1, 1,
-0.2691932, 0.04120529, -0.9889472, 1, 1, 1, 1, 1,
-0.2675037, 0.3397381, 0.3136674, 1, 1, 1, 1, 1,
-0.2674769, -0.05475753, -1.645601, 1, 1, 1, 1, 1,
-0.263196, 0.2220003, -1.063645, 1, 1, 1, 1, 1,
-0.2567382, 1.654084, -1.667534, 1, 1, 1, 1, 1,
-0.2550229, -0.206236, -1.472206, 1, 1, 1, 1, 1,
-0.2540901, 0.6743088, -0.8531745, 1, 1, 1, 1, 1,
-0.2537731, -2.416515, -3.021497, 1, 1, 1, 1, 1,
-0.2524751, -0.5926431, -0.6777477, 1, 1, 1, 1, 1,
-0.2425316, -0.4846908, -2.690446, 1, 1, 1, 1, 1,
-0.2422546, 1.280365, 0.5818902, 1, 1, 1, 1, 1,
-0.2391308, -1.006602, -1.944941, 1, 1, 1, 1, 1,
-0.2389907, 0.7132376, 1.580609, 0, 0, 1, 1, 1,
-0.2383214, -1.082871, -3.468823, 1, 0, 0, 1, 1,
-0.2297089, -1.525958, -3.69315, 1, 0, 0, 1, 1,
-0.2257277, -0.7020566, -3.493939, 1, 0, 0, 1, 1,
-0.2231771, -0.1462556, -2.488628, 1, 0, 0, 1, 1,
-0.2196679, -0.5172445, -3.683945, 1, 0, 0, 1, 1,
-0.2139012, -0.9647388, -2.818363, 0, 0, 0, 1, 1,
-0.2132902, -0.9334983, -1.788236, 0, 0, 0, 1, 1,
-0.210854, -1.106847, -2.469147, 0, 0, 0, 1, 1,
-0.2086608, 1.071418, -1.197494, 0, 0, 0, 1, 1,
-0.20651, -0.00936241, -1.973512, 0, 0, 0, 1, 1,
-0.2061513, -1.452463, -2.902177, 0, 0, 0, 1, 1,
-0.2048819, 1.015636, 0.2021895, 0, 0, 0, 1, 1,
-0.1930052, 0.7018886, 0.3255779, 1, 1, 1, 1, 1,
-0.1925902, -2.142233, -1.362337, 1, 1, 1, 1, 1,
-0.1921632, 1.242465, 0.5664839, 1, 1, 1, 1, 1,
-0.1916373, 0.3945978, -0.2277947, 1, 1, 1, 1, 1,
-0.1863982, -0.6066242, -2.431884, 1, 1, 1, 1, 1,
-0.1849356, 0.2423858, -0.8811163, 1, 1, 1, 1, 1,
-0.1831121, 0.5481156, -0.3070872, 1, 1, 1, 1, 1,
-0.1820076, -0.7513412, -1.859848, 1, 1, 1, 1, 1,
-0.1819364, -0.3781503, -2.98919, 1, 1, 1, 1, 1,
-0.1779049, -0.1005256, -2.8693, 1, 1, 1, 1, 1,
-0.1758374, 0.6358079, 0.2805596, 1, 1, 1, 1, 1,
-0.1744096, 0.121199, -1.36344, 1, 1, 1, 1, 1,
-0.1731297, 0.1242732, -0.6084279, 1, 1, 1, 1, 1,
-0.1693464, 0.01044767, -1.249247, 1, 1, 1, 1, 1,
-0.1658159, 0.7077647, -0.8391625, 1, 1, 1, 1, 1,
-0.1611573, 0.291195, -1.257834, 0, 0, 1, 1, 1,
-0.1589502, -1.433451, -1.507144, 1, 0, 0, 1, 1,
-0.1555826, 0.5789638, 1.808042, 1, 0, 0, 1, 1,
-0.1549386, -1.007379, -1.938528, 1, 0, 0, 1, 1,
-0.1546953, 1.848756, 0.8069004, 1, 0, 0, 1, 1,
-0.154391, -0.952238, -4.907559, 1, 0, 0, 1, 1,
-0.1513709, 1.455178, -0.3731286, 0, 0, 0, 1, 1,
-0.1512257, -0.2020357, -3.788209, 0, 0, 0, 1, 1,
-0.1467564, 0.4328651, 0.31605, 0, 0, 0, 1, 1,
-0.1430259, -0.8438942, -2.655506, 0, 0, 0, 1, 1,
-0.138945, -0.66804, -2.363674, 0, 0, 0, 1, 1,
-0.1358842, 0.05418843, -0.4214839, 0, 0, 0, 1, 1,
-0.1309536, -0.8010809, -3.748517, 0, 0, 0, 1, 1,
-0.1304976, 0.681271, -0.7271224, 1, 1, 1, 1, 1,
-0.1282026, 0.2517534, 1.752391, 1, 1, 1, 1, 1,
-0.1273557, 0.6992221, -0.5560361, 1, 1, 1, 1, 1,
-0.1169466, -2.039809, -2.208375, 1, 1, 1, 1, 1,
-0.1167576, 1.161096, -2.156399, 1, 1, 1, 1, 1,
-0.1155997, -0.3871497, -1.966642, 1, 1, 1, 1, 1,
-0.1151292, 0.5426998, -0.2570227, 1, 1, 1, 1, 1,
-0.1136394, -1.686711, -3.604145, 1, 1, 1, 1, 1,
-0.1117205, 0.8495585, -0.719, 1, 1, 1, 1, 1,
-0.1092524, -1.66103, -3.637604, 1, 1, 1, 1, 1,
-0.1046268, -0.7815727, -2.987075, 1, 1, 1, 1, 1,
-0.1001911, 0.5647465, 1.110731, 1, 1, 1, 1, 1,
-0.09713928, -0.01723247, -2.155385, 1, 1, 1, 1, 1,
-0.096867, 1.710726, -0.3811139, 1, 1, 1, 1, 1,
-0.09660014, 2.682458, -0.08630001, 1, 1, 1, 1, 1,
-0.08307906, 0.5112211, -0.2806391, 0, 0, 1, 1, 1,
-0.07909559, -0.9748498, -2.353625, 1, 0, 0, 1, 1,
-0.07121956, 0.1946182, -0.6442712, 1, 0, 0, 1, 1,
-0.07110997, -0.8046378, -3.301862, 1, 0, 0, 1, 1,
-0.06952721, 0.3331855, -1.352021, 1, 0, 0, 1, 1,
-0.0672919, -0.4049352, -2.333907, 1, 0, 0, 1, 1,
-0.06628186, -0.3583811, -1.984273, 0, 0, 0, 1, 1,
-0.06464738, -2.308564, -2.393871, 0, 0, 0, 1, 1,
-0.06377171, 0.8725834, 1.767936, 0, 0, 0, 1, 1,
-0.06172685, -0.2513494, -2.718369, 0, 0, 0, 1, 1,
-0.05903791, 1.397951, -1.665955, 0, 0, 0, 1, 1,
-0.05409925, -0.5454654, -3.156597, 0, 0, 0, 1, 1,
-0.0504474, 0.7052544, -0.8022568, 0, 0, 0, 1, 1,
-0.04962975, 0.5636228, -1.199509, 1, 1, 1, 1, 1,
-0.04910211, 0.6364582, -1.012693, 1, 1, 1, 1, 1,
-0.04820909, 1.119767, -0.3923484, 1, 1, 1, 1, 1,
-0.04626518, -0.2348574, -3.453365, 1, 1, 1, 1, 1,
-0.04457237, -0.4186132, -1.380038, 1, 1, 1, 1, 1,
-0.04331093, -1.407825, -1.272893, 1, 1, 1, 1, 1,
-0.04160353, -1.236423, -2.860622, 1, 1, 1, 1, 1,
-0.03686953, 0.2035641, 0.3313927, 1, 1, 1, 1, 1,
-0.03478422, -0.3668449, -2.121171, 1, 1, 1, 1, 1,
-0.03099153, 1.04877, 0.6869125, 1, 1, 1, 1, 1,
-0.02737893, -0.1427168, -2.071643, 1, 1, 1, 1, 1,
-0.02486802, 0.9704795, 0.558752, 1, 1, 1, 1, 1,
-0.02446102, -0.3206586, -4.698956, 1, 1, 1, 1, 1,
-0.02165013, 0.7163846, 0.1265792, 1, 1, 1, 1, 1,
-0.01831436, -0.5545684, -4.556379, 1, 1, 1, 1, 1,
-0.006588089, -0.3968551, -3.879801, 0, 0, 1, 1, 1,
-0.0003501161, -2.289819, -1.797113, 1, 0, 0, 1, 1,
0.003581169, -2.000539, 3.491128, 1, 0, 0, 1, 1,
0.004269811, -0.1928606, 1.738769, 1, 0, 0, 1, 1,
0.006963389, 1.688636, -0.7549161, 1, 0, 0, 1, 1,
0.01418954, 0.2717307, -0.8939229, 1, 0, 0, 1, 1,
0.01483677, -1.202638, 2.828429, 0, 0, 0, 1, 1,
0.0156701, 0.3387389, -0.134786, 0, 0, 0, 1, 1,
0.02066292, -0.007827289, 1.020017, 0, 0, 0, 1, 1,
0.02338875, -0.4604038, 2.086843, 0, 0, 0, 1, 1,
0.02552483, -1.214935, 0.896193, 0, 0, 0, 1, 1,
0.02592673, -1.855307, 2.962663, 0, 0, 0, 1, 1,
0.03055407, 0.1197969, -0.8103642, 0, 0, 0, 1, 1,
0.03492429, -0.02899248, 2.591608, 1, 1, 1, 1, 1,
0.03575512, -0.2906905, 3.071004, 1, 1, 1, 1, 1,
0.03622911, -0.06155251, 3.017578, 1, 1, 1, 1, 1,
0.03716528, -0.4884976, 2.123381, 1, 1, 1, 1, 1,
0.03756283, 0.8855658, -0.7977642, 1, 1, 1, 1, 1,
0.03812931, 2.748157, -0.8173713, 1, 1, 1, 1, 1,
0.03846495, 0.06714766, -0.08144437, 1, 1, 1, 1, 1,
0.0426264, -0.9701668, 2.729243, 1, 1, 1, 1, 1,
0.05076731, 1.823804, 0.4082909, 1, 1, 1, 1, 1,
0.06311534, -1.260936, 3.497034, 1, 1, 1, 1, 1,
0.07114453, 0.4423236, 1.246213, 1, 1, 1, 1, 1,
0.07147677, -0.07872904, 0.8529599, 1, 1, 1, 1, 1,
0.07297039, 0.8228833, -0.2786878, 1, 1, 1, 1, 1,
0.07323441, 2.715718, -0.7418227, 1, 1, 1, 1, 1,
0.07401232, 0.4422685, -0.1371824, 1, 1, 1, 1, 1,
0.0758912, 0.9283006, -2.115377, 0, 0, 1, 1, 1,
0.07689863, 0.6075719, 0.3357506, 1, 0, 0, 1, 1,
0.0786621, 1.873286, -0.7020242, 1, 0, 0, 1, 1,
0.08322178, 0.28555, 0.01133816, 1, 0, 0, 1, 1,
0.08449809, -0.3784064, 3.366816, 1, 0, 0, 1, 1,
0.08747771, -0.291593, 2.466133, 1, 0, 0, 1, 1,
0.09512429, -0.05112927, 1.062014, 0, 0, 0, 1, 1,
0.106314, -1.069605, 3.519208, 0, 0, 0, 1, 1,
0.110267, -1.895281, 3.510897, 0, 0, 0, 1, 1,
0.1105408, 1.778698, 1.021923, 0, 0, 0, 1, 1,
0.1110711, -1.339196, 2.498095, 0, 0, 0, 1, 1,
0.1130822, -1.032336, 2.950321, 0, 0, 0, 1, 1,
0.1181606, 1.82634, -0.3554023, 0, 0, 0, 1, 1,
0.1183791, 0.8750189, -1.427346, 1, 1, 1, 1, 1,
0.118662, 1.59805, -1.168409, 1, 1, 1, 1, 1,
0.1187124, -0.2513323, 3.34685, 1, 1, 1, 1, 1,
0.1216347, -1.939068, 3.172873, 1, 1, 1, 1, 1,
0.1231528, 0.8330873, -0.8826775, 1, 1, 1, 1, 1,
0.1283106, 1.347247, -0.7210659, 1, 1, 1, 1, 1,
0.1320694, 1.34493, 0.1093136, 1, 1, 1, 1, 1,
0.1321572, 1.079797, 0.8595423, 1, 1, 1, 1, 1,
0.1355071, 1.912219, 0.347182, 1, 1, 1, 1, 1,
0.1404824, -0.01462504, 2.296875, 1, 1, 1, 1, 1,
0.1412038, -0.05987201, 1.131835, 1, 1, 1, 1, 1,
0.1438289, -0.9147991, 2.595326, 1, 1, 1, 1, 1,
0.1455889, -2.117965, 1.218769, 1, 1, 1, 1, 1,
0.1457542, -0.5904363, 1.181024, 1, 1, 1, 1, 1,
0.1495732, -2.18045, 3.870908, 1, 1, 1, 1, 1,
0.1501516, -0.1108123, 0.5867159, 0, 0, 1, 1, 1,
0.1505801, 1.553721, -1.323715, 1, 0, 0, 1, 1,
0.1521134, -0.6205009, 1.652872, 1, 0, 0, 1, 1,
0.1535167, 1.180744, 1.094409, 1, 0, 0, 1, 1,
0.1535843, 0.7130012, -0.3815344, 1, 0, 0, 1, 1,
0.1563598, 1.038812, 0.09654932, 1, 0, 0, 1, 1,
0.1572693, -0.2665745, 2.734713, 0, 0, 0, 1, 1,
0.1587982, 1.057041, -0.3884923, 0, 0, 0, 1, 1,
0.1601254, 1.172984, 1.28834, 0, 0, 0, 1, 1,
0.1609682, -0.3503523, 3.78992, 0, 0, 0, 1, 1,
0.1641043, -0.52552, 3.636882, 0, 0, 0, 1, 1,
0.1646714, -0.03248726, 1.387897, 0, 0, 0, 1, 1,
0.1704974, 2.054729, 0.5592104, 0, 0, 0, 1, 1,
0.1715212, 0.7616594, -0.1424456, 1, 1, 1, 1, 1,
0.1777694, -1.416414, 2.705066, 1, 1, 1, 1, 1,
0.1822273, -1.028985, 1.179491, 1, 1, 1, 1, 1,
0.1822858, 0.4386992, 0.1901179, 1, 1, 1, 1, 1,
0.1843664, 0.1930182, 0.2128951, 1, 1, 1, 1, 1,
0.1849859, -1.611108, 3.146134, 1, 1, 1, 1, 1,
0.185627, 0.3301256, 2.638228, 1, 1, 1, 1, 1,
0.1916604, 1.752881, -0.8117273, 1, 1, 1, 1, 1,
0.195724, 0.4130469, 2.51665, 1, 1, 1, 1, 1,
0.1988268, 1.487589, 0.6827182, 1, 1, 1, 1, 1,
0.1992945, 1.485114, 0.1693105, 1, 1, 1, 1, 1,
0.2008298, -2.052286, 3.46973, 1, 1, 1, 1, 1,
0.2015692, 0.5245537, 0.4509924, 1, 1, 1, 1, 1,
0.2023341, 0.3860766, 1.109029, 1, 1, 1, 1, 1,
0.2029036, -0.2286456, 0.5190701, 1, 1, 1, 1, 1,
0.2051015, -1.885662, 3.484262, 0, 0, 1, 1, 1,
0.2067277, 0.8215702, -0.7349795, 1, 0, 0, 1, 1,
0.2098252, 0.7550563, 1.066421, 1, 0, 0, 1, 1,
0.2172076, -1.129621, 3.050043, 1, 0, 0, 1, 1,
0.2203769, -2.156982, 3.942029, 1, 0, 0, 1, 1,
0.2229024, 1.394127, 0.3126598, 1, 0, 0, 1, 1,
0.2244007, -0.560118, 3.032283, 0, 0, 0, 1, 1,
0.2270004, -2.140878, 2.663702, 0, 0, 0, 1, 1,
0.2272941, 0.6251195, 2.283703, 0, 0, 0, 1, 1,
0.2333984, -1.36689, 3.771277, 0, 0, 0, 1, 1,
0.2349679, 1.29492, 0.5715384, 0, 0, 0, 1, 1,
0.240311, -0.8717768, 1.288894, 0, 0, 0, 1, 1,
0.2404962, -1.91034, 3.42926, 0, 0, 0, 1, 1,
0.243952, 0.7032377, -0.012928, 1, 1, 1, 1, 1,
0.244048, -1.123691, 2.304714, 1, 1, 1, 1, 1,
0.2475206, 0.3571943, 0.3669305, 1, 1, 1, 1, 1,
0.2487531, -0.8171368, 2.992612, 1, 1, 1, 1, 1,
0.2523645, -1.351551, 2.171086, 1, 1, 1, 1, 1,
0.2580939, -0.3996206, 2.442837, 1, 1, 1, 1, 1,
0.2618167, -1.764062, 3.008008, 1, 1, 1, 1, 1,
0.263165, -2.122167, 3.531696, 1, 1, 1, 1, 1,
0.2632581, -0.5038102, 4.065922, 1, 1, 1, 1, 1,
0.2659155, -0.2700722, 3.085762, 1, 1, 1, 1, 1,
0.2708566, 0.2393752, 1.53489, 1, 1, 1, 1, 1,
0.2712263, 0.263665, 0.5727827, 1, 1, 1, 1, 1,
0.2730197, -1.041614, 4.03021, 1, 1, 1, 1, 1,
0.2741133, 0.3734472, 1.185498, 1, 1, 1, 1, 1,
0.2777026, -1.958796, 3.391693, 1, 1, 1, 1, 1,
0.2791426, 0.8724805, 1.683091, 0, 0, 1, 1, 1,
0.2815221, -0.8926899, 2.810442, 1, 0, 0, 1, 1,
0.2829321, 1.412303, 0.1676382, 1, 0, 0, 1, 1,
0.2835453, 0.1822881, -0.8820285, 1, 0, 0, 1, 1,
0.2867011, -0.3084672, 0.8871888, 1, 0, 0, 1, 1,
0.2876358, 0.1120036, 2.201624, 1, 0, 0, 1, 1,
0.2906292, 0.8323652, -0.2956805, 0, 0, 0, 1, 1,
0.2962239, -0.0772026, 1.160854, 0, 0, 0, 1, 1,
0.3078838, 0.9582006, 0.8578366, 0, 0, 0, 1, 1,
0.3080409, 1.330511, -0.3326341, 0, 0, 0, 1, 1,
0.3090885, -0.6767237, 3.159382, 0, 0, 0, 1, 1,
0.3093105, 1.367726, -0.1004549, 0, 0, 0, 1, 1,
0.3100618, -0.4581341, 2.832249, 0, 0, 0, 1, 1,
0.3107192, 1.415196, -0.5402436, 1, 1, 1, 1, 1,
0.3136906, 1.243269, 0.9688529, 1, 1, 1, 1, 1,
0.3176309, 2.312112, -1.519894, 1, 1, 1, 1, 1,
0.3192645, 0.5094098, 0.4594119, 1, 1, 1, 1, 1,
0.3307867, 0.9742886, 0.7946882, 1, 1, 1, 1, 1,
0.338329, 0.1950638, 2.053657, 1, 1, 1, 1, 1,
0.3383547, 0.4430338, 1.471764, 1, 1, 1, 1, 1,
0.3453078, 0.2372449, 0.8573292, 1, 1, 1, 1, 1,
0.3459231, -0.08845977, 3.219484, 1, 1, 1, 1, 1,
0.3469233, -0.3730958, 1.819528, 1, 1, 1, 1, 1,
0.3473956, 0.6466246, -0.3970543, 1, 1, 1, 1, 1,
0.3479083, 0.5792093, 1.206714, 1, 1, 1, 1, 1,
0.348845, 0.4675719, 0.7573178, 1, 1, 1, 1, 1,
0.3509924, -0.02982714, 2.693003, 1, 1, 1, 1, 1,
0.3523574, -0.1203331, 2.852806, 1, 1, 1, 1, 1,
0.3560406, -0.4035945, 3.074037, 0, 0, 1, 1, 1,
0.3594292, 0.7089521, 0.1676348, 1, 0, 0, 1, 1,
0.3633581, 0.2578481, -0.07007484, 1, 0, 0, 1, 1,
0.3668224, -0.8733429, 1.404065, 1, 0, 0, 1, 1,
0.3685088, -1.183884, 2.139402, 1, 0, 0, 1, 1,
0.3689011, 1.201847, 0.6533127, 1, 0, 0, 1, 1,
0.3734227, 0.4598294, 0.6120375, 0, 0, 0, 1, 1,
0.3786504, 1.044084, -0.3885015, 0, 0, 0, 1, 1,
0.3797231, -0.3593455, 2.080221, 0, 0, 0, 1, 1,
0.3825407, 0.5247487, -0.5602305, 0, 0, 0, 1, 1,
0.3856579, -1.352085, 3.105972, 0, 0, 0, 1, 1,
0.3875076, 0.2994108, -1.254572, 0, 0, 0, 1, 1,
0.3906772, 2.184982, 1.816162, 0, 0, 0, 1, 1,
0.3927607, 0.7504245, 0.6031567, 1, 1, 1, 1, 1,
0.3941165, 0.4483606, -0.2127623, 1, 1, 1, 1, 1,
0.3956601, 0.9901928, 0.225372, 1, 1, 1, 1, 1,
0.3993951, 1.978505, -1.125238, 1, 1, 1, 1, 1,
0.4059153, -1.290823, 2.293249, 1, 1, 1, 1, 1,
0.4091944, 0.3014792, 1.11548, 1, 1, 1, 1, 1,
0.4095319, 1.702077, 0.3919197, 1, 1, 1, 1, 1,
0.4149785, 1.669594, -0.7260331, 1, 1, 1, 1, 1,
0.419185, 2.220012, 0.3275276, 1, 1, 1, 1, 1,
0.4194859, -0.1410116, 2.134563, 1, 1, 1, 1, 1,
0.4343024, 0.6863625, 0.8902103, 1, 1, 1, 1, 1,
0.4352281, 0.410923, 0.4766345, 1, 1, 1, 1, 1,
0.4370717, -0.1138327, 1.42785, 1, 1, 1, 1, 1,
0.4371064, -0.784883, 1.705174, 1, 1, 1, 1, 1,
0.4489964, 0.4274416, -0.296268, 1, 1, 1, 1, 1,
0.4561595, -0.4138633, 3.813647, 0, 0, 1, 1, 1,
0.4614948, 0.8763567, 1.107575, 1, 0, 0, 1, 1,
0.4615561, 0.5709893, 0.3095419, 1, 0, 0, 1, 1,
0.4647728, -0.4408006, 0.2365782, 1, 0, 0, 1, 1,
0.4675041, 0.4673173, 1.418869, 1, 0, 0, 1, 1,
0.4704442, -1.359092, 2.533552, 1, 0, 0, 1, 1,
0.4718903, -2.299983, 3.055642, 0, 0, 0, 1, 1,
0.473186, 1.212234, -0.140676, 0, 0, 0, 1, 1,
0.4740689, -0.2877418, 0.7544602, 0, 0, 0, 1, 1,
0.4768418, -1.001436, 3.189695, 0, 0, 0, 1, 1,
0.4790529, 0.4074636, 1.459062, 0, 0, 0, 1, 1,
0.4931729, -1.161307, 5.817279, 0, 0, 0, 1, 1,
0.4956337, -0.4658808, 1.488414, 0, 0, 0, 1, 1,
0.4995783, -0.2148136, 3.370268, 1, 1, 1, 1, 1,
0.5002738, -0.8474301, 0.9624657, 1, 1, 1, 1, 1,
0.5029485, -0.3470744, 2.222179, 1, 1, 1, 1, 1,
0.510516, -0.1378422, 3.622296, 1, 1, 1, 1, 1,
0.5130886, -0.620766, 2.478619, 1, 1, 1, 1, 1,
0.5136325, 1.558211, -0.435913, 1, 1, 1, 1, 1,
0.5178739, -0.1399511, 3.15511, 1, 1, 1, 1, 1,
0.5197977, 0.2628608, 0.5533087, 1, 1, 1, 1, 1,
0.5200437, -0.1824639, 1.724257, 1, 1, 1, 1, 1,
0.5223473, -0.8575816, 0.5820258, 1, 1, 1, 1, 1,
0.5234205, -0.5067101, 2.863518, 1, 1, 1, 1, 1,
0.5301135, -0.4549321, 2.068035, 1, 1, 1, 1, 1,
0.5328284, -0.1230662, 1.696572, 1, 1, 1, 1, 1,
0.5344976, 1.430989, 0.6285521, 1, 1, 1, 1, 1,
0.5352985, 0.2263383, 2.835751, 1, 1, 1, 1, 1,
0.5367413, 3.584974, 0.7684969, 0, 0, 1, 1, 1,
0.5408545, -0.8984718, 4.177362, 1, 0, 0, 1, 1,
0.543744, 0.9344732, -0.7394168, 1, 0, 0, 1, 1,
0.547282, 0.09404925, 0.5347238, 1, 0, 0, 1, 1,
0.547927, 0.522396, -0.9146254, 1, 0, 0, 1, 1,
0.5565639, 0.5746755, 1.130201, 1, 0, 0, 1, 1,
0.5585401, -1.05849, 3.054521, 0, 0, 0, 1, 1,
0.5663587, -1.532591, 3.543905, 0, 0, 0, 1, 1,
0.5670833, -1.847205, 5.429223, 0, 0, 0, 1, 1,
0.5719222, 1.071985, 1.23806, 0, 0, 0, 1, 1,
0.5722831, -0.2478341, 3.236677, 0, 0, 0, 1, 1,
0.5734733, -0.1858548, 1.109395, 0, 0, 0, 1, 1,
0.5750195, 0.5450774, 0.3121315, 0, 0, 0, 1, 1,
0.5751927, 0.7170886, 0.756714, 1, 1, 1, 1, 1,
0.5785311, -1.076408, 2.986669, 1, 1, 1, 1, 1,
0.5785495, -0.01716648, 1.33754, 1, 1, 1, 1, 1,
0.5814075, -0.03740389, 1.517595, 1, 1, 1, 1, 1,
0.5825468, 2.078137, 0.2980661, 1, 1, 1, 1, 1,
0.5913445, 1.850163, 2.212311, 1, 1, 1, 1, 1,
0.5920866, 0.2645624, 0.8433806, 1, 1, 1, 1, 1,
0.5953559, 1.381217, 0.1524013, 1, 1, 1, 1, 1,
0.5969317, 0.3479885, 1.68537, 1, 1, 1, 1, 1,
0.5986322, -0.4694032, 2.289717, 1, 1, 1, 1, 1,
0.5989877, 0.1336328, -1.143157, 1, 1, 1, 1, 1,
0.6001576, -1.271468, 1.796391, 1, 1, 1, 1, 1,
0.6031634, 0.412428, -0.6552022, 1, 1, 1, 1, 1,
0.603368, 0.1057317, 1.609937, 1, 1, 1, 1, 1,
0.6053508, -0.1337513, 2.605257, 1, 1, 1, 1, 1,
0.6087607, -0.8072022, 3.205584, 0, 0, 1, 1, 1,
0.6103737, 1.147786, 1.008323, 1, 0, 0, 1, 1,
0.6120851, -1.412602, 1.648349, 1, 0, 0, 1, 1,
0.6236115, 1.264473, -0.5897865, 1, 0, 0, 1, 1,
0.6289315, -0.3611359, 2.162213, 1, 0, 0, 1, 1,
0.6304988, 1.62567, 2.503982, 1, 0, 0, 1, 1,
0.6393043, -1.235105, 3.547132, 0, 0, 0, 1, 1,
0.6410683, -0.1194788, 1.773723, 0, 0, 0, 1, 1,
0.6422647, -0.05520244, 0.672154, 0, 0, 0, 1, 1,
0.6440676, -0.1364417, 1.701846, 0, 0, 0, 1, 1,
0.6446396, -0.6628449, 3.766419, 0, 0, 0, 1, 1,
0.6488614, -0.3683049, 0.5223283, 0, 0, 0, 1, 1,
0.6579723, -0.6468796, 1.504275, 0, 0, 0, 1, 1,
0.6620483, 0.02109461, 1.334202, 1, 1, 1, 1, 1,
0.6649039, 1.126722, 1.942477, 1, 1, 1, 1, 1,
0.6746876, -1.481822, 3.358817, 1, 1, 1, 1, 1,
0.6814994, 1.781159, 0.73246, 1, 1, 1, 1, 1,
0.6820824, -0.4883094, 2.022465, 1, 1, 1, 1, 1,
0.6853348, 0.3531902, 1.232557, 1, 1, 1, 1, 1,
0.6870985, -0.3735789, 3.20095, 1, 1, 1, 1, 1,
0.6926832, -2.121933, 3.348352, 1, 1, 1, 1, 1,
0.6965789, 0.1780755, 0.08082239, 1, 1, 1, 1, 1,
0.7011374, -1.664393, 3.566552, 1, 1, 1, 1, 1,
0.7042337, -3.828948, 2.642685, 1, 1, 1, 1, 1,
0.707783, -2.075307, 2.443783, 1, 1, 1, 1, 1,
0.7161897, 1.607253, -0.2594067, 1, 1, 1, 1, 1,
0.7196484, -0.5880184, 3.119397, 1, 1, 1, 1, 1,
0.7202711, -0.8705633, -0.2544481, 1, 1, 1, 1, 1,
0.721248, -0.9135591, 0.6779229, 0, 0, 1, 1, 1,
0.7259631, 2.523148, 0.2091729, 1, 0, 0, 1, 1,
0.7283565, 0.6383626, 3.434509, 1, 0, 0, 1, 1,
0.7370967, -0.1448403, 2.586993, 1, 0, 0, 1, 1,
0.7385131, 1.513681, 0.3733383, 1, 0, 0, 1, 1,
0.740279, 1.795963, 0.9477172, 1, 0, 0, 1, 1,
0.7403121, -0.2306837, 2.475073, 0, 0, 0, 1, 1,
0.7406194, -1.617878, 3.429252, 0, 0, 0, 1, 1,
0.7434283, 2.40742, 0.3201757, 0, 0, 0, 1, 1,
0.7445561, 0.3651055, 1.042549, 0, 0, 0, 1, 1,
0.7490951, -0.9608056, 2.334695, 0, 0, 0, 1, 1,
0.7518071, 0.8332259, 0.3181959, 0, 0, 0, 1, 1,
0.7651891, 0.7956089, 0.826878, 0, 0, 0, 1, 1,
0.7672532, 1.272793, -0.4003962, 1, 1, 1, 1, 1,
0.7696311, -0.4828453, 2.375473, 1, 1, 1, 1, 1,
0.7712624, 1.097411, 0.6614689, 1, 1, 1, 1, 1,
0.7755716, -1.172188, 1.280838, 1, 1, 1, 1, 1,
0.7832654, 1.251632, 1.796853, 1, 1, 1, 1, 1,
0.7837096, -0.09159672, 2.746529, 1, 1, 1, 1, 1,
0.7927099, -0.9980836, 3.509963, 1, 1, 1, 1, 1,
0.7954919, 1.037863, 0.5611691, 1, 1, 1, 1, 1,
0.8009545, 0.4185033, 2.564585, 1, 1, 1, 1, 1,
0.8034167, 1.388082, -0.4165767, 1, 1, 1, 1, 1,
0.8074167, 0.9252974, 0.7544637, 1, 1, 1, 1, 1,
0.8098462, -1.501554, 2.652334, 1, 1, 1, 1, 1,
0.8117998, 2.027851, 0.1570252, 1, 1, 1, 1, 1,
0.8148965, 0.8171762, 1.139562, 1, 1, 1, 1, 1,
0.8158364, 0.5599731, -0.5278537, 1, 1, 1, 1, 1,
0.8160257, -0.05678056, 0.6056796, 0, 0, 1, 1, 1,
0.8183317, -0.5376505, 1.109555, 1, 0, 0, 1, 1,
0.8202648, 0.1451991, 1.676459, 1, 0, 0, 1, 1,
0.8207397, -0.3229957, 1.472576, 1, 0, 0, 1, 1,
0.8232312, -1.103573, 2.915399, 1, 0, 0, 1, 1,
0.8241954, 0.7245647, 0.8162518, 1, 0, 0, 1, 1,
0.8242087, -0.1741617, 1.288925, 0, 0, 0, 1, 1,
0.8262153, 0.6646869, 1.435971, 0, 0, 0, 1, 1,
0.8285455, 1.018867, 1.070956, 0, 0, 0, 1, 1,
0.8294966, 0.8927691, 1.926681, 0, 0, 0, 1, 1,
0.8302108, 0.07322881, 1.544027, 0, 0, 0, 1, 1,
0.8304368, 0.7024592, 0.1487653, 0, 0, 0, 1, 1,
0.8333057, 0.8378986, 0.3813788, 0, 0, 0, 1, 1,
0.8353678, -0.993873, 3.554455, 1, 1, 1, 1, 1,
0.8387049, 0.2368592, -0.3190421, 1, 1, 1, 1, 1,
0.8438733, -0.4931996, 4.024149, 1, 1, 1, 1, 1,
0.8554804, -0.9809936, 1.93758, 1, 1, 1, 1, 1,
0.8620818, 0.1227231, 1.406658, 1, 1, 1, 1, 1,
0.8632185, 0.2316449, 2.705072, 1, 1, 1, 1, 1,
0.8642181, -0.202424, 0.4434893, 1, 1, 1, 1, 1,
0.8648882, 0.5142785, 2.089207, 1, 1, 1, 1, 1,
0.8706709, 0.3409544, 0.3680822, 1, 1, 1, 1, 1,
0.8730918, 0.2240099, 0.7649317, 1, 1, 1, 1, 1,
0.8743317, 1.105409, 0.2338921, 1, 1, 1, 1, 1,
0.8768662, 0.140995, 1.790095, 1, 1, 1, 1, 1,
0.8818293, -0.6997064, 1.580114, 1, 1, 1, 1, 1,
0.8821571, 1.064196, -0.3696233, 1, 1, 1, 1, 1,
0.8829625, -0.4146511, 2.088295, 1, 1, 1, 1, 1,
0.8872143, 1.244392, 2.237435, 0, 0, 1, 1, 1,
0.895192, -0.3134483, 0.9326279, 1, 0, 0, 1, 1,
0.8967385, -1.266945, 3.562523, 1, 0, 0, 1, 1,
0.9011745, -1.053041, 3.136356, 1, 0, 0, 1, 1,
0.9090854, 0.4924176, -1.086071, 1, 0, 0, 1, 1,
0.9104921, 1.258759, 1.065145, 1, 0, 0, 1, 1,
0.9108758, 0.110767, 0.83848, 0, 0, 0, 1, 1,
0.9167251, -1.349268, 3.282312, 0, 0, 0, 1, 1,
0.9205859, -1.89295, 2.631387, 0, 0, 0, 1, 1,
0.9251333, -0.6180453, 1.746948, 0, 0, 0, 1, 1,
0.9290949, 0.4997835, 1.40408, 0, 0, 0, 1, 1,
0.938364, -0.3077212, 1.973378, 0, 0, 0, 1, 1,
0.9410194, -0.5352839, 3.459662, 0, 0, 0, 1, 1,
0.9427625, 1.644099, 1.023546, 1, 1, 1, 1, 1,
0.9443261, 0.2984484, 0.3915072, 1, 1, 1, 1, 1,
0.9450737, 1.437968, 0.4298129, 1, 1, 1, 1, 1,
0.9561964, 0.9357458, 0.1857089, 1, 1, 1, 1, 1,
0.958939, 0.873641, 1.632452, 1, 1, 1, 1, 1,
0.9613427, 0.5396696, 0.7526149, 1, 1, 1, 1, 1,
0.9615362, 0.02264217, 2.694448, 1, 1, 1, 1, 1,
0.9633993, 0.7099103, -0.2938914, 1, 1, 1, 1, 1,
0.9688112, 0.1092124, 2.669189, 1, 1, 1, 1, 1,
0.9718004, 1.524319, -0.54693, 1, 1, 1, 1, 1,
0.975506, 0.04478529, 1.026628, 1, 1, 1, 1, 1,
0.9776685, 0.4615296, 1.838439, 1, 1, 1, 1, 1,
0.9832649, 2.463, -0.7001565, 1, 1, 1, 1, 1,
0.9928135, -0.4109906, 0.5191352, 1, 1, 1, 1, 1,
0.9945678, -0.3245675, 2.545961, 1, 1, 1, 1, 1,
0.9954538, 0.6185925, 0.657917, 0, 0, 1, 1, 1,
0.9986007, -0.458696, 4.732421, 1, 0, 0, 1, 1,
1.001422, -0.1081298, -1.191679, 1, 0, 0, 1, 1,
1.001756, -0.9799643, 0.4844441, 1, 0, 0, 1, 1,
1.002269, -1.20023, 1.731388, 1, 0, 0, 1, 1,
1.00527, 0.8917615, 2.557071, 1, 0, 0, 1, 1,
1.006574, 1.0358, 0.6430247, 0, 0, 0, 1, 1,
1.007627, 0.1341339, 1.105947, 0, 0, 0, 1, 1,
1.013382, -0.1391631, 1.967923, 0, 0, 0, 1, 1,
1.019021, -2.206902, 2.11003, 0, 0, 0, 1, 1,
1.022573, -0.7608027, 3.760972, 0, 0, 0, 1, 1,
1.023307, 0.4672602, 1.624019, 0, 0, 0, 1, 1,
1.0236, -0.1626086, 3.251955, 0, 0, 0, 1, 1,
1.024529, 0.2448977, 1.212272, 1, 1, 1, 1, 1,
1.037582, -0.6763271, 1.505893, 1, 1, 1, 1, 1,
1.051446, -1.357067, 2.019901, 1, 1, 1, 1, 1,
1.052519, -0.4004645, 3.502112, 1, 1, 1, 1, 1,
1.058864, -0.997761, 2.871526, 1, 1, 1, 1, 1,
1.059074, 1.18489, -1.255815, 1, 1, 1, 1, 1,
1.062767, 0.2765319, 2.273926, 1, 1, 1, 1, 1,
1.063378, -0.3614398, 1.109068, 1, 1, 1, 1, 1,
1.064842, -0.4398538, 2.289971, 1, 1, 1, 1, 1,
1.067028, -0.8974786, 2.943605, 1, 1, 1, 1, 1,
1.070039, -0.174142, 1.305195, 1, 1, 1, 1, 1,
1.07157, 0.3405303, 1.770146, 1, 1, 1, 1, 1,
1.073419, -1.086151, 1.701349, 1, 1, 1, 1, 1,
1.081972, -0.8376442, 4.048651, 1, 1, 1, 1, 1,
1.083123, -0.4943266, 1.246445, 1, 1, 1, 1, 1,
1.096635, 2.043837, -0.3662406, 0, 0, 1, 1, 1,
1.100256, -0.06102408, 2.245857, 1, 0, 0, 1, 1,
1.102608, -0.06918201, 2.689568, 1, 0, 0, 1, 1,
1.108258, 0.8015218, 0.6215369, 1, 0, 0, 1, 1,
1.108534, -0.2822354, 4.319515, 1, 0, 0, 1, 1,
1.115405, -2.644429, 1.744962, 1, 0, 0, 1, 1,
1.12366, -0.2269804, 1.62499, 0, 0, 0, 1, 1,
1.128014, -0.7157652, 1.198183, 0, 0, 0, 1, 1,
1.130121, -0.2966919, 1.963955, 0, 0, 0, 1, 1,
1.130714, 1.351996, 0.6246406, 0, 0, 0, 1, 1,
1.135746, -1.192483, 4.200252, 0, 0, 0, 1, 1,
1.144102, 0.6864291, 1.686171, 0, 0, 0, 1, 1,
1.145028, 1.307073, 1.637904, 0, 0, 0, 1, 1,
1.164899, -0.3752085, 1.663544, 1, 1, 1, 1, 1,
1.168118, 0.3556559, 3.089955, 1, 1, 1, 1, 1,
1.171722, 1.427875, -0.4332059, 1, 1, 1, 1, 1,
1.171961, 0.8807619, 0.2631001, 1, 1, 1, 1, 1,
1.173253, 1.303944, 0.7772014, 1, 1, 1, 1, 1,
1.174856, -0.05736772, 1.861409, 1, 1, 1, 1, 1,
1.178033, 0.8021416, 1.522734, 1, 1, 1, 1, 1,
1.201825, 0.03159484, 0.6531078, 1, 1, 1, 1, 1,
1.205865, 1.369459, 0.5669783, 1, 1, 1, 1, 1,
1.209161, 0.6645517, 0.7503687, 1, 1, 1, 1, 1,
1.20998, 0.5409515, -0.04673215, 1, 1, 1, 1, 1,
1.21468, -0.03561598, 0.6845222, 1, 1, 1, 1, 1,
1.215157, 1.907183, 0.2261614, 1, 1, 1, 1, 1,
1.221853, 1.136112, 0.1479709, 1, 1, 1, 1, 1,
1.235329, 0.6553092, -0.7353845, 1, 1, 1, 1, 1,
1.238472, 1.241568, 1.549949, 0, 0, 1, 1, 1,
1.242084, -0.3720532, 2.262842, 1, 0, 0, 1, 1,
1.249112, -0.1265243, 2.921104, 1, 0, 0, 1, 1,
1.249618, 0.1297275, 0.6620434, 1, 0, 0, 1, 1,
1.254923, -1.237533, 3.543498, 1, 0, 0, 1, 1,
1.270608, 0.4883985, 1.420913, 1, 0, 0, 1, 1,
1.276737, -0.8353245, 2.098475, 0, 0, 0, 1, 1,
1.278572, 0.6459728, -0.7203318, 0, 0, 0, 1, 1,
1.288153, -1.0997, 2.373292, 0, 0, 0, 1, 1,
1.293361, -1.55594, 2.203081, 0, 0, 0, 1, 1,
1.311051, -0.02479397, 1.822203, 0, 0, 0, 1, 1,
1.320905, 2.155586, 1.935927, 0, 0, 0, 1, 1,
1.321363, 0.6203602, 1.781664, 0, 0, 0, 1, 1,
1.324168, -1.643974, 2.917954, 1, 1, 1, 1, 1,
1.331223, -0.794241, 2.527505, 1, 1, 1, 1, 1,
1.333923, 0.8392199, 1.617565, 1, 1, 1, 1, 1,
1.344856, -0.6950581, 3.441317, 1, 1, 1, 1, 1,
1.358081, 0.2859455, 1.452092, 1, 1, 1, 1, 1,
1.372173, 0.06473619, 0.2697507, 1, 1, 1, 1, 1,
1.37592, -1.304537, 2.279152, 1, 1, 1, 1, 1,
1.385027, -0.9693409, 2.007064, 1, 1, 1, 1, 1,
1.386303, 0.8087828, 1.280808, 1, 1, 1, 1, 1,
1.390486, -0.4441764, 1.941634, 1, 1, 1, 1, 1,
1.395616, -1.400843, 3.599426, 1, 1, 1, 1, 1,
1.397221, -0.7210754, 3.343733, 1, 1, 1, 1, 1,
1.409295, -0.4771048, 3.024171, 1, 1, 1, 1, 1,
1.418462, -0.557338, 1.005407, 1, 1, 1, 1, 1,
1.424522, -0.7674367, 1.054907, 1, 1, 1, 1, 1,
1.428774, 0.2192681, 1.433725, 0, 0, 1, 1, 1,
1.435485, 0.02110073, 3.458189, 1, 0, 0, 1, 1,
1.437077, -0.9898024, 0.9218081, 1, 0, 0, 1, 1,
1.448267, -0.6866312, 2.785956, 1, 0, 0, 1, 1,
1.450186, 0.2816922, 2.432525, 1, 0, 0, 1, 1,
1.476056, 0.9643074, 0.8389483, 1, 0, 0, 1, 1,
1.480663, 0.1686086, 2.25521, 0, 0, 0, 1, 1,
1.482506, 1.409191, 0.6668299, 0, 0, 0, 1, 1,
1.488123, 1.421352, 0.3849731, 0, 0, 0, 1, 1,
1.489057, -0.1378415, 2.423698, 0, 0, 0, 1, 1,
1.513487, 0.109925, 1.752914, 0, 0, 0, 1, 1,
1.521514, 0.5285076, 1.310405, 0, 0, 0, 1, 1,
1.53295, -0.3414026, 2.528136, 0, 0, 0, 1, 1,
1.534529, 0.8896354, -0.02661007, 1, 1, 1, 1, 1,
1.539102, -0.7367652, -1.247917, 1, 1, 1, 1, 1,
1.539439, 1.024646, 1.725758, 1, 1, 1, 1, 1,
1.567563, -1.157107, 1.29214, 1, 1, 1, 1, 1,
1.575148, -1.341345, 2.101846, 1, 1, 1, 1, 1,
1.576885, 0.008675591, 1.499331, 1, 1, 1, 1, 1,
1.577991, -1.221248, 2.286318, 1, 1, 1, 1, 1,
1.588716, 0.008891937, 1.344291, 1, 1, 1, 1, 1,
1.598075, 0.4087396, 2.746536, 1, 1, 1, 1, 1,
1.618165, -2.286546, 2.079649, 1, 1, 1, 1, 1,
1.619029, -1.54867, 1.654219, 1, 1, 1, 1, 1,
1.627107, -0.08228263, 1.535826, 1, 1, 1, 1, 1,
1.631886, 1.777406, 0.03408968, 1, 1, 1, 1, 1,
1.634979, 0.5923402, 1.003797, 1, 1, 1, 1, 1,
1.638826, 0.6720313, 1.684525, 1, 1, 1, 1, 1,
1.645443, 1.837626, 0.07142708, 0, 0, 1, 1, 1,
1.647628, 0.9327539, -0.6405299, 1, 0, 0, 1, 1,
1.656427, -0.7137559, 1.441366, 1, 0, 0, 1, 1,
1.661804, -0.9081978, 1.846772, 1, 0, 0, 1, 1,
1.672745, 0.4860266, 3.169525, 1, 0, 0, 1, 1,
1.698731, 1.022246, 0.05210066, 1, 0, 0, 1, 1,
1.705956, 2.483731, 1.42445, 0, 0, 0, 1, 1,
1.733966, -0.2257859, 3.217374, 0, 0, 0, 1, 1,
1.740561, -0.8708188, 2.257689, 0, 0, 0, 1, 1,
1.748964, -1.36139, 1.206948, 0, 0, 0, 1, 1,
1.764493, 0.5174087, 1.703233, 0, 0, 0, 1, 1,
1.776957, 0.8964059, -0.3331563, 0, 0, 0, 1, 1,
1.804757, -1.043174, 0.5680313, 0, 0, 0, 1, 1,
1.81712, 0.4225227, 0.741242, 1, 1, 1, 1, 1,
1.819679, -0.1131415, 2.087198, 1, 1, 1, 1, 1,
1.837339, -0.0732048, 2.098779, 1, 1, 1, 1, 1,
1.84843, -0.9815922, 2.032537, 1, 1, 1, 1, 1,
1.866231, -0.1732224, 0.2501604, 1, 1, 1, 1, 1,
1.89681, -0.2192377, 1.546495, 1, 1, 1, 1, 1,
1.911706, 0.188371, 0.3783586, 1, 1, 1, 1, 1,
1.943224, -1.563184, 1.983895, 1, 1, 1, 1, 1,
1.956709, -1.58221, 2.993648, 1, 1, 1, 1, 1,
1.957656, 0.9253244, 0.9777963, 1, 1, 1, 1, 1,
2.023533, 1.151422, 0.8748436, 1, 1, 1, 1, 1,
2.025548, -0.3853267, 0.904348, 1, 1, 1, 1, 1,
2.02821, 1.697604, 0.6069129, 1, 1, 1, 1, 1,
2.033949, -0.7493551, 3.310979, 1, 1, 1, 1, 1,
2.037409, -0.7391077, 1.527317, 1, 1, 1, 1, 1,
2.085176, 0.3313006, 1.735034, 0, 0, 1, 1, 1,
2.144026, -0.2467282, 1.748817, 1, 0, 0, 1, 1,
2.184323, -0.1857716, 1.532291, 1, 0, 0, 1, 1,
2.240902, 0.1274812, 1.830375, 1, 0, 0, 1, 1,
2.309678, 1.687153, -0.156276, 1, 0, 0, 1, 1,
2.310037, -1.461926, 1.062792, 1, 0, 0, 1, 1,
2.348895, 2.809968, 1.10923, 0, 0, 0, 1, 1,
2.38541, -1.611237, 1.435589, 0, 0, 0, 1, 1,
2.38585, 0.4857727, -0.4467829, 0, 0, 0, 1, 1,
2.461453, -0.2749421, 0.4269557, 0, 0, 0, 1, 1,
2.478979, -0.8601804, 2.36957, 0, 0, 0, 1, 1,
2.651462, -0.8486812, 1.705165, 0, 0, 0, 1, 1,
2.651533, -0.3479999, 2.913175, 0, 0, 0, 1, 1,
2.664783, -2.018811, 1.997348, 1, 1, 1, 1, 1,
2.676651, -1.433625, 3.24417, 1, 1, 1, 1, 1,
2.743486, 0.09507225, 2.368257, 1, 1, 1, 1, 1,
2.839794, -0.4158714, 2.516627, 1, 1, 1, 1, 1,
2.889808, -1.156825, 0.9162207, 1, 1, 1, 1, 1,
2.933171, -0.5072752, 3.42515, 1, 1, 1, 1, 1,
3.528918, -0.3290722, 0.4447691, 1, 1, 1, 1, 1
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
var radius = 10.12673;
var distance = 35.56971;
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
mvMatrix.translate( -0.1415973, 0.1219869, -0.2333157 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.56971);
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
