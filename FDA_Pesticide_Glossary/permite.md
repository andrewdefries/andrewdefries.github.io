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
-3.114464, 1.107164, -1.240083, 1, 0, 0, 1,
-2.928298, 1.634109, -0.5020293, 1, 0.007843138, 0, 1,
-2.799659, 0.8657386, -3.485857, 1, 0.01176471, 0, 1,
-2.776805, -0.867977, 0.04309452, 1, 0.01960784, 0, 1,
-2.672978, -0.5484985, -1.413072, 1, 0.02352941, 0, 1,
-2.662143, 0.1439238, -2.724392, 1, 0.03137255, 0, 1,
-2.633762, 0.2755046, -2.941581, 1, 0.03529412, 0, 1,
-2.627735, -0.1865496, -1.742777, 1, 0.04313726, 0, 1,
-2.588002, -0.6169006, -2.197365, 1, 0.04705882, 0, 1,
-2.507897, -0.294511, -1.203973, 1, 0.05490196, 0, 1,
-2.488597, 0.7361937, -1.449883, 1, 0.05882353, 0, 1,
-2.425812, -0.01025466, -3.100034, 1, 0.06666667, 0, 1,
-2.424115, 1.096435, -2.203367, 1, 0.07058824, 0, 1,
-2.288573, 1.308586, -0.7635989, 1, 0.07843138, 0, 1,
-2.241724, 0.07448835, -0.1443499, 1, 0.08235294, 0, 1,
-2.164175, 0.2387578, -0.5484728, 1, 0.09019608, 0, 1,
-2.14061, 0.8939613, -0.9049284, 1, 0.09411765, 0, 1,
-2.126012, 1.255407, -0.9771624, 1, 0.1019608, 0, 1,
-2.113094, -0.7221247, -2.08647, 1, 0.1098039, 0, 1,
-2.106667, 0.1936399, -0.1854812, 1, 0.1137255, 0, 1,
-2.102239, -1.471197, -0.0504986, 1, 0.1215686, 0, 1,
-2.082104, -0.6094338, -1.640859, 1, 0.1254902, 0, 1,
-2.032006, 0.651465, -1.512099, 1, 0.1333333, 0, 1,
-2.030266, -1.021281, -3.514114, 1, 0.1372549, 0, 1,
-2.026825, -0.5167423, -0.744206, 1, 0.145098, 0, 1,
-2.015885, 1.489346, 1.520449, 1, 0.1490196, 0, 1,
-1.994289, -1.712565, -3.627831, 1, 0.1568628, 0, 1,
-1.983795, 1.928741, -2.051849, 1, 0.1607843, 0, 1,
-1.961047, -1.450123, -0.07794639, 1, 0.1686275, 0, 1,
-1.899096, 1.413573, -0.2267192, 1, 0.172549, 0, 1,
-1.864849, -0.08546282, -0.4517532, 1, 0.1803922, 0, 1,
-1.85069, 0.4853337, -2.786309, 1, 0.1843137, 0, 1,
-1.848272, 0.357001, -3.56165, 1, 0.1921569, 0, 1,
-1.828262, 0.2669257, -2.680883, 1, 0.1960784, 0, 1,
-1.808798, -0.168383, 1.162298, 1, 0.2039216, 0, 1,
-1.807281, 0.7871551, -1.409497, 1, 0.2117647, 0, 1,
-1.789186, -0.4687134, -1.278108, 1, 0.2156863, 0, 1,
-1.764936, 1.797019, -1.839813, 1, 0.2235294, 0, 1,
-1.764095, -0.8218419, -2.205901, 1, 0.227451, 0, 1,
-1.755389, -0.4428571, -2.127954, 1, 0.2352941, 0, 1,
-1.753646, 0.2535303, -1.513143, 1, 0.2392157, 0, 1,
-1.733289, 0.1622826, -0.7708184, 1, 0.2470588, 0, 1,
-1.728586, -0.7002832, -2.660245, 1, 0.2509804, 0, 1,
-1.710997, -1.090898, -2.842329, 1, 0.2588235, 0, 1,
-1.69627, 0.4125492, -1.735502, 1, 0.2627451, 0, 1,
-1.685228, 0.5962583, -0.9033527, 1, 0.2705882, 0, 1,
-1.668596, 0.7313668, -0.9397948, 1, 0.2745098, 0, 1,
-1.661826, 0.330491, -1.290693, 1, 0.282353, 0, 1,
-1.660545, -0.8532394, -2.634815, 1, 0.2862745, 0, 1,
-1.651071, -0.8344187, -2.721484, 1, 0.2941177, 0, 1,
-1.644, 0.7074542, -0.7123173, 1, 0.3019608, 0, 1,
-1.623991, -1.939976, -1.625645, 1, 0.3058824, 0, 1,
-1.617502, -0.8268687, -0.7966843, 1, 0.3137255, 0, 1,
-1.614614, 1.166824, -1.364387, 1, 0.3176471, 0, 1,
-1.612876, 0.8800032, -1.474582, 1, 0.3254902, 0, 1,
-1.611772, 0.1356548, -2.478304, 1, 0.3294118, 0, 1,
-1.608726, 0.5329797, -0.2295542, 1, 0.3372549, 0, 1,
-1.593111, 0.7485473, -1.125294, 1, 0.3411765, 0, 1,
-1.570657, -0.3194738, -2.147788, 1, 0.3490196, 0, 1,
-1.56643, 0.5133163, -2.408455, 1, 0.3529412, 0, 1,
-1.557454, 0.1433346, -1.565212, 1, 0.3607843, 0, 1,
-1.556525, -0.08619841, -2.047414, 1, 0.3647059, 0, 1,
-1.553778, 0.6898976, -1.430436, 1, 0.372549, 0, 1,
-1.550473, -0.02910912, -1.418633, 1, 0.3764706, 0, 1,
-1.5503, -1.527664, -1.539479, 1, 0.3843137, 0, 1,
-1.546612, -0.06079912, -1.157278, 1, 0.3882353, 0, 1,
-1.530681, 0.8720136, 2.061644, 1, 0.3960784, 0, 1,
-1.530087, 1.361499, -0.3029832, 1, 0.4039216, 0, 1,
-1.526929, 0.01064165, -2.319924, 1, 0.4078431, 0, 1,
-1.526437, -1.045939, -2.812816, 1, 0.4156863, 0, 1,
-1.51861, 0.3005582, -0.9363838, 1, 0.4196078, 0, 1,
-1.501755, 0.7064732, -1.573476, 1, 0.427451, 0, 1,
-1.499016, 1.704502, -1.717182, 1, 0.4313726, 0, 1,
-1.488828, 0.02181176, -0.911841, 1, 0.4392157, 0, 1,
-1.477474, 0.4668339, -2.680101, 1, 0.4431373, 0, 1,
-1.466262, 0.4098565, -0.682487, 1, 0.4509804, 0, 1,
-1.4615, 1.296735, -0.0007812759, 1, 0.454902, 0, 1,
-1.45078, 0.6078626, 0.5080597, 1, 0.4627451, 0, 1,
-1.449244, -0.783914, -4.293471, 1, 0.4666667, 0, 1,
-1.445726, 0.7913612, -2.05733, 1, 0.4745098, 0, 1,
-1.437221, 0.4031663, -2.607111, 1, 0.4784314, 0, 1,
-1.436501, -0.5823849, -2.985109, 1, 0.4862745, 0, 1,
-1.430911, -0.2781233, -0.9749604, 1, 0.4901961, 0, 1,
-1.418419, 0.1537202, -1.170737, 1, 0.4980392, 0, 1,
-1.41233, 0.01376253, -1.232449, 1, 0.5058824, 0, 1,
-1.401753, 1.006083, 1.201083, 1, 0.509804, 0, 1,
-1.396694, -1.214798, -1.282133, 1, 0.5176471, 0, 1,
-1.392699, -0.9418304, -2.54719, 1, 0.5215687, 0, 1,
-1.383535, -1.580518, -2.822064, 1, 0.5294118, 0, 1,
-1.382486, 0.8581015, 0.1715481, 1, 0.5333334, 0, 1,
-1.382269, 1.020767, -0.1942194, 1, 0.5411765, 0, 1,
-1.37258, 1.886505, -0.1802136, 1, 0.5450981, 0, 1,
-1.372212, -1.274468, -0.5405108, 1, 0.5529412, 0, 1,
-1.361835, -0.2685913, 0.7084556, 1, 0.5568628, 0, 1,
-1.359006, 0.5369244, 0.3786549, 1, 0.5647059, 0, 1,
-1.346369, -0.1201248, -2.236701, 1, 0.5686275, 0, 1,
-1.335449, -1.053299, -3.424471, 1, 0.5764706, 0, 1,
-1.328536, 1.940908, -2.7565, 1, 0.5803922, 0, 1,
-1.328261, -1.797387, -2.991738, 1, 0.5882353, 0, 1,
-1.32642, -1.806558, -1.302316, 1, 0.5921569, 0, 1,
-1.325732, -0.3514152, -0.5007429, 1, 0.6, 0, 1,
-1.322582, 1.150107, -1.023203, 1, 0.6078432, 0, 1,
-1.292529, 0.03069381, -3.229876, 1, 0.6117647, 0, 1,
-1.286356, 2.476918, 1.711459, 1, 0.6196079, 0, 1,
-1.273399, -0.5718436, -1.368543, 1, 0.6235294, 0, 1,
-1.270274, 1.437771, -0.8682046, 1, 0.6313726, 0, 1,
-1.257749, -0.2134174, -2.780524, 1, 0.6352941, 0, 1,
-1.254596, -0.04415458, -0.1967992, 1, 0.6431373, 0, 1,
-1.250606, 1.263685, -0.1225712, 1, 0.6470588, 0, 1,
-1.233737, -0.8791741, -1.564048, 1, 0.654902, 0, 1,
-1.231392, 0.1394735, -2.962447, 1, 0.6588235, 0, 1,
-1.224317, -0.9389047, -2.070767, 1, 0.6666667, 0, 1,
-1.198078, -1.373292, -1.65027, 1, 0.6705883, 0, 1,
-1.188196, 0.6694406, -0.5408567, 1, 0.6784314, 0, 1,
-1.187155, 0.9090111, -0.6900327, 1, 0.682353, 0, 1,
-1.184301, 1.02134, -0.3771416, 1, 0.6901961, 0, 1,
-1.182697, -0.3770916, -0.8061842, 1, 0.6941177, 0, 1,
-1.181122, -1.012828, -3.433984, 1, 0.7019608, 0, 1,
-1.174288, -0.3636892, -3.013247, 1, 0.7098039, 0, 1,
-1.172205, -0.5445109, -1.971563, 1, 0.7137255, 0, 1,
-1.166945, 1.976429, -2.663567, 1, 0.7215686, 0, 1,
-1.150347, 1.045061, -0.5588571, 1, 0.7254902, 0, 1,
-1.14202, 1.188596, 0.4340721, 1, 0.7333333, 0, 1,
-1.133514, -0.2279238, -2.773407, 1, 0.7372549, 0, 1,
-1.13069, -1.11832, -1.994557, 1, 0.7450981, 0, 1,
-1.125077, 0.5202683, 0.3738984, 1, 0.7490196, 0, 1,
-1.118471, 0.09133695, -2.178116, 1, 0.7568628, 0, 1,
-1.115005, 1.638243, -0.5562085, 1, 0.7607843, 0, 1,
-1.113527, -0.4071345, -4.827726, 1, 0.7686275, 0, 1,
-1.108763, -0.3859628, -1.581931, 1, 0.772549, 0, 1,
-1.105135, -0.3220607, -1.642868, 1, 0.7803922, 0, 1,
-1.102591, 0.8031475, -2.329486, 1, 0.7843137, 0, 1,
-1.101033, -1.332527, -3.018368, 1, 0.7921569, 0, 1,
-1.096607, -0.701555, -1.966507, 1, 0.7960784, 0, 1,
-1.091162, -0.2066486, -0.0529481, 1, 0.8039216, 0, 1,
-1.089261, -0.9175565, -3.163551, 1, 0.8117647, 0, 1,
-1.084952, 0.1350443, -2.06833, 1, 0.8156863, 0, 1,
-1.078773, 0.04730918, 0.0769903, 1, 0.8235294, 0, 1,
-1.073773, 0.05374893, -2.757053, 1, 0.827451, 0, 1,
-1.073264, -0.5859915, -1.415266, 1, 0.8352941, 0, 1,
-1.059106, -1.033177, -1.22153, 1, 0.8392157, 0, 1,
-1.057118, 0.5985017, -1.977315, 1, 0.8470588, 0, 1,
-1.051829, 0.6696281, -1.190309, 1, 0.8509804, 0, 1,
-1.051763, -0.3287122, 0.8309749, 1, 0.8588235, 0, 1,
-1.026321, 1.600587, -1.096743, 1, 0.8627451, 0, 1,
-1.026012, -1.358885, -2.182586, 1, 0.8705882, 0, 1,
-1.025327, -2.029148, -2.520124, 1, 0.8745098, 0, 1,
-1.021007, -1.909125, -2.462085, 1, 0.8823529, 0, 1,
-1.016755, 1.585935, -0.8917091, 1, 0.8862745, 0, 1,
-0.9992, -0.3499645, -1.649475, 1, 0.8941177, 0, 1,
-0.9931886, -0.2919219, -1.242253, 1, 0.8980392, 0, 1,
-0.9852285, -0.2820278, -4.030808, 1, 0.9058824, 0, 1,
-0.9845456, -0.1896349, -0.8383263, 1, 0.9137255, 0, 1,
-0.9839818, -0.6283284, -3.658987, 1, 0.9176471, 0, 1,
-0.9831185, 1.017519, -0.8146003, 1, 0.9254902, 0, 1,
-0.9824365, -0.1089321, -1.122931, 1, 0.9294118, 0, 1,
-0.9823228, -1.745093, -1.631808, 1, 0.9372549, 0, 1,
-0.9732584, 1.34699, -0.2709318, 1, 0.9411765, 0, 1,
-0.9653462, -1.026322, -2.801759, 1, 0.9490196, 0, 1,
-0.9649274, 1.048447, -0.04753102, 1, 0.9529412, 0, 1,
-0.9644356, 0.3342577, -0.1381587, 1, 0.9607843, 0, 1,
-0.9557065, 1.890723, -2.474517, 1, 0.9647059, 0, 1,
-0.9517533, 0.6123651, 0.2738041, 1, 0.972549, 0, 1,
-0.9500421, -0.9585274, -3.546624, 1, 0.9764706, 0, 1,
-0.9485057, 1.114244, 0.2456679, 1, 0.9843137, 0, 1,
-0.9451476, -0.3486062, -1.79513, 1, 0.9882353, 0, 1,
-0.9432432, -0.2286707, -1.745843, 1, 0.9960784, 0, 1,
-0.9417651, -0.3166369, -1.990365, 0.9960784, 1, 0, 1,
-0.9355528, 0.1818393, -0.8445746, 0.9921569, 1, 0, 1,
-0.9285175, -1.179801, -1.940909, 0.9843137, 1, 0, 1,
-0.9268824, -1.221582, -2.658165, 0.9803922, 1, 0, 1,
-0.9221708, 1.183822, -1.405208, 0.972549, 1, 0, 1,
-0.9154438, -2.650305, -4.047987, 0.9686275, 1, 0, 1,
-0.9014715, -0.6548867, -0.9327728, 0.9607843, 1, 0, 1,
-0.8965638, -0.1609526, -0.8676742, 0.9568627, 1, 0, 1,
-0.8963158, 1.015142, -1.492192, 0.9490196, 1, 0, 1,
-0.8913154, -0.5587661, -3.309274, 0.945098, 1, 0, 1,
-0.8886223, 0.1280423, -0.9141806, 0.9372549, 1, 0, 1,
-0.886126, -0.7189537, -1.303341, 0.9333333, 1, 0, 1,
-0.8858442, -0.5334514, -1.366153, 0.9254902, 1, 0, 1,
-0.8739924, 0.415231, -1.460713, 0.9215686, 1, 0, 1,
-0.872474, -0.01810016, -1.847769, 0.9137255, 1, 0, 1,
-0.8692928, 0.1780933, -2.374382, 0.9098039, 1, 0, 1,
-0.8555012, 0.2878217, -1.047642, 0.9019608, 1, 0, 1,
-0.8543019, -1.162053, -2.836003, 0.8941177, 1, 0, 1,
-0.8521276, -0.04511699, -1.88396, 0.8901961, 1, 0, 1,
-0.851817, 0.5943549, 0.1143843, 0.8823529, 1, 0, 1,
-0.8439578, -0.03520613, -2.097296, 0.8784314, 1, 0, 1,
-0.8415752, 0.04537571, -0.579796, 0.8705882, 1, 0, 1,
-0.8360249, -2.141549, -4.182983, 0.8666667, 1, 0, 1,
-0.8340282, -1.710633, -3.88049, 0.8588235, 1, 0, 1,
-0.8331691, 0.4812255, -1.544448, 0.854902, 1, 0, 1,
-0.824989, 0.118806, -2.816843, 0.8470588, 1, 0, 1,
-0.8249699, 0.0881457, -1.841056, 0.8431373, 1, 0, 1,
-0.8233323, 0.08460923, -1.636848, 0.8352941, 1, 0, 1,
-0.8227156, -1.215667, -1.473974, 0.8313726, 1, 0, 1,
-0.8151015, 1.132998, -0.2423024, 0.8235294, 1, 0, 1,
-0.8137891, 0.0798112, -1.094492, 0.8196079, 1, 0, 1,
-0.8121518, -0.1238409, -1.408659, 0.8117647, 1, 0, 1,
-0.7976344, -0.8203572, -2.503919, 0.8078431, 1, 0, 1,
-0.7910192, 0.2340564, -2.668321, 0.8, 1, 0, 1,
-0.7908016, 1.79983, 0.6028786, 0.7921569, 1, 0, 1,
-0.7835221, 1.149506, -1.609017, 0.7882353, 1, 0, 1,
-0.7827286, 1.19733, -0.6738825, 0.7803922, 1, 0, 1,
-0.7741387, -1.125724, -1.184344, 0.7764706, 1, 0, 1,
-0.7668545, -0.4659505, -1.853438, 0.7686275, 1, 0, 1,
-0.7612298, 0.08374247, -0.7717898, 0.7647059, 1, 0, 1,
-0.7511173, -0.2280155, -2.079433, 0.7568628, 1, 0, 1,
-0.749999, 0.7828463, -1.373466, 0.7529412, 1, 0, 1,
-0.7439754, 0.3731682, 0.05209452, 0.7450981, 1, 0, 1,
-0.7435337, 0.536822, -0.2266714, 0.7411765, 1, 0, 1,
-0.7423849, -1.040616, -1.671825, 0.7333333, 1, 0, 1,
-0.7400398, -1.260858, -2.86995, 0.7294118, 1, 0, 1,
-0.7391176, 0.5129901, -0.9923254, 0.7215686, 1, 0, 1,
-0.7386405, 0.7102108, -0.7490796, 0.7176471, 1, 0, 1,
-0.7360237, -1.214909, -1.531023, 0.7098039, 1, 0, 1,
-0.7315355, 0.1328426, -2.486704, 0.7058824, 1, 0, 1,
-0.7314218, -1.094805, -1.505805, 0.6980392, 1, 0, 1,
-0.7290389, 1.714854, 1.198964, 0.6901961, 1, 0, 1,
-0.7287496, 0.2539627, -2.291106, 0.6862745, 1, 0, 1,
-0.7280819, 0.08554185, -1.196727, 0.6784314, 1, 0, 1,
-0.7276406, 0.5965393, -0.4105003, 0.6745098, 1, 0, 1,
-0.7196068, 1.376329, 0.9235974, 0.6666667, 1, 0, 1,
-0.7178397, 0.7569247, -0.2295219, 0.6627451, 1, 0, 1,
-0.711496, 0.5562575, -0.997082, 0.654902, 1, 0, 1,
-0.7073519, 0.8104826, -1.075769, 0.6509804, 1, 0, 1,
-0.6985161, -0.253085, -3.313118, 0.6431373, 1, 0, 1,
-0.6964297, 0.3758582, -1.568153, 0.6392157, 1, 0, 1,
-0.6803029, 0.4918515, -0.9812458, 0.6313726, 1, 0, 1,
-0.6774145, 1.452801, -0.2878589, 0.627451, 1, 0, 1,
-0.6755238, 2.052744, 0.448164, 0.6196079, 1, 0, 1,
-0.6660332, 1.784063, -1.560318, 0.6156863, 1, 0, 1,
-0.6604505, 0.8567371, -1.17033, 0.6078432, 1, 0, 1,
-0.65999, 0.2435081, -1.575689, 0.6039216, 1, 0, 1,
-0.6497712, 0.06650326, -0.1162467, 0.5960785, 1, 0, 1,
-0.6450642, 1.358344, -1.227576, 0.5882353, 1, 0, 1,
-0.6388476, -0.7350645, -2.567149, 0.5843138, 1, 0, 1,
-0.6363375, 0.9765412, -1.121252, 0.5764706, 1, 0, 1,
-0.6359299, 0.3599269, 0.7752622, 0.572549, 1, 0, 1,
-0.6355042, -0.7935572, -1.573039, 0.5647059, 1, 0, 1,
-0.6350703, -1.036224, -2.797563, 0.5607843, 1, 0, 1,
-0.6348442, 1.026354, -0.41803, 0.5529412, 1, 0, 1,
-0.634684, -0.5148897, -0.4693051, 0.5490196, 1, 0, 1,
-0.6325929, 0.5845768, -0.9782471, 0.5411765, 1, 0, 1,
-0.6306347, -0.5129706, -2.975642, 0.5372549, 1, 0, 1,
-0.6300513, 1.331956, -1.0098, 0.5294118, 1, 0, 1,
-0.6249771, 0.1343306, -1.619397, 0.5254902, 1, 0, 1,
-0.6231117, -0.05301334, -1.794413, 0.5176471, 1, 0, 1,
-0.621373, 1.016189, 0.1968704, 0.5137255, 1, 0, 1,
-0.6188197, 1.006126, -0.5000653, 0.5058824, 1, 0, 1,
-0.6187963, 0.1723939, -1.087028, 0.5019608, 1, 0, 1,
-0.6085854, -0.03978518, -1.496982, 0.4941176, 1, 0, 1,
-0.6043857, 0.8417684, -1.781496, 0.4862745, 1, 0, 1,
-0.60164, 0.250186, -0.7382444, 0.4823529, 1, 0, 1,
-0.5989899, -2.211908, -1.912128, 0.4745098, 1, 0, 1,
-0.5956818, -0.5764018, -4.128358, 0.4705882, 1, 0, 1,
-0.5940849, 0.0240644, -0.7873462, 0.4627451, 1, 0, 1,
-0.5868832, 1.703299, -1.130552, 0.4588235, 1, 0, 1,
-0.5863337, 1.56376, 0.3612684, 0.4509804, 1, 0, 1,
-0.5857081, 1.797429, -1.671635, 0.4470588, 1, 0, 1,
-0.5852872, -1.010414, -3.98513, 0.4392157, 1, 0, 1,
-0.582504, -0.8994116, -2.221339, 0.4352941, 1, 0, 1,
-0.5809951, -0.5915861, -1.481317, 0.427451, 1, 0, 1,
-0.5794327, 0.8506362, -1.101732, 0.4235294, 1, 0, 1,
-0.5790772, -0.4104976, -2.312529, 0.4156863, 1, 0, 1,
-0.5776919, -0.5232607, -3.565455, 0.4117647, 1, 0, 1,
-0.5683319, 0.348414, 0.07155453, 0.4039216, 1, 0, 1,
-0.5675198, -1.28682, -2.075512, 0.3960784, 1, 0, 1,
-0.5667052, 1.088427, -0.9364774, 0.3921569, 1, 0, 1,
-0.5624207, -0.9517654, -2.418302, 0.3843137, 1, 0, 1,
-0.5614563, -0.1918416, -1.110421, 0.3803922, 1, 0, 1,
-0.5526332, -2.685417, -1.130184, 0.372549, 1, 0, 1,
-0.5488051, 0.9387482, -0.6018182, 0.3686275, 1, 0, 1,
-0.5465502, 1.609889, 1.666887, 0.3607843, 1, 0, 1,
-0.5462697, 1.778168, -0.5881126, 0.3568628, 1, 0, 1,
-0.5420123, 0.5036035, -1.091835, 0.3490196, 1, 0, 1,
-0.5408139, -0.3776949, -4.382215, 0.345098, 1, 0, 1,
-0.5363773, 1.049194, -0.5897406, 0.3372549, 1, 0, 1,
-0.5361472, -1.230681, -1.647553, 0.3333333, 1, 0, 1,
-0.5238634, -0.4915771, -1.494208, 0.3254902, 1, 0, 1,
-0.520895, -1.79726, -2.649641, 0.3215686, 1, 0, 1,
-0.5169874, -0.1857347, -2.4498, 0.3137255, 1, 0, 1,
-0.4989684, -0.1466843, -1.075627, 0.3098039, 1, 0, 1,
-0.4946691, 0.7314491, 1.010923, 0.3019608, 1, 0, 1,
-0.4934335, -0.05675504, -3.299058, 0.2941177, 1, 0, 1,
-0.4926565, 0.3434542, -1.260204, 0.2901961, 1, 0, 1,
-0.4913227, -0.4175175, -0.784339, 0.282353, 1, 0, 1,
-0.4815688, 0.03953028, -3.168942, 0.2784314, 1, 0, 1,
-0.4769942, 1.826074, -1.191494, 0.2705882, 1, 0, 1,
-0.475054, -0.9185107, -3.973673, 0.2666667, 1, 0, 1,
-0.4712198, 0.3977175, -1.71488, 0.2588235, 1, 0, 1,
-0.4709831, -1.518789, -3.485733, 0.254902, 1, 0, 1,
-0.4674846, 1.060598, -2.691413, 0.2470588, 1, 0, 1,
-0.4635007, 1.289583, -0.7543953, 0.2431373, 1, 0, 1,
-0.4617978, -1.136517, -5.245192, 0.2352941, 1, 0, 1,
-0.4607726, -0.2338458, -2.592306, 0.2313726, 1, 0, 1,
-0.4551998, 0.5904803, -1.519357, 0.2235294, 1, 0, 1,
-0.4547804, -0.7148019, -1.815094, 0.2196078, 1, 0, 1,
-0.454081, 0.6788667, -0.5350315, 0.2117647, 1, 0, 1,
-0.4532487, -0.7437123, -3.445321, 0.2078431, 1, 0, 1,
-0.4508189, -0.5848439, -3.053631, 0.2, 1, 0, 1,
-0.4390275, 0.0140907, -1.46214, 0.1921569, 1, 0, 1,
-0.4308235, -1.559091, -2.146859, 0.1882353, 1, 0, 1,
-0.4304367, 0.01539901, -1.300447, 0.1803922, 1, 0, 1,
-0.4251307, -0.008398119, 0.6722478, 0.1764706, 1, 0, 1,
-0.4235386, -0.2695993, -3.603227, 0.1686275, 1, 0, 1,
-0.4205767, -0.4319336, -0.7236018, 0.1647059, 1, 0, 1,
-0.4147088, 0.5836233, -1.242977, 0.1568628, 1, 0, 1,
-0.4146661, 1.796794, -0.7538953, 0.1529412, 1, 0, 1,
-0.4130465, -0.1948961, -0.8167018, 0.145098, 1, 0, 1,
-0.4119931, 0.5480762, -1.10543, 0.1411765, 1, 0, 1,
-0.4084851, 0.07278793, -3.744528, 0.1333333, 1, 0, 1,
-0.4072572, -0.5606037, -2.730103, 0.1294118, 1, 0, 1,
-0.406473, -0.1574071, -1.326617, 0.1215686, 1, 0, 1,
-0.4049552, -1.172924, -3.937454, 0.1176471, 1, 0, 1,
-0.3995645, -1.652937, -1.695086, 0.1098039, 1, 0, 1,
-0.398734, -1.084893, -2.685074, 0.1058824, 1, 0, 1,
-0.3914111, -1.64776, -2.544904, 0.09803922, 1, 0, 1,
-0.3908532, 0.3642516, -0.2453744, 0.09019608, 1, 0, 1,
-0.3856179, 0.3537429, 0.6424971, 0.08627451, 1, 0, 1,
-0.3836689, 0.7359875, 0.6461374, 0.07843138, 1, 0, 1,
-0.3819812, 0.4614045, -1.725607, 0.07450981, 1, 0, 1,
-0.3755808, -0.9711746, -3.31397, 0.06666667, 1, 0, 1,
-0.3754773, -0.2329559, -1.920858, 0.0627451, 1, 0, 1,
-0.3752392, -1.330655, -3.348144, 0.05490196, 1, 0, 1,
-0.3737782, 0.2879386, -3.472221, 0.05098039, 1, 0, 1,
-0.3572356, 0.2815408, -2.299278, 0.04313726, 1, 0, 1,
-0.3549863, -1.38052, -0.8436654, 0.03921569, 1, 0, 1,
-0.3549188, -0.09003093, -0.7594813, 0.03137255, 1, 0, 1,
-0.3540821, -2.183142, -2.181577, 0.02745098, 1, 0, 1,
-0.3493115, 1.092687, -0.1154493, 0.01960784, 1, 0, 1,
-0.3447721, 1.195494, -0.6934136, 0.01568628, 1, 0, 1,
-0.3434604, -0.08578198, -1.378333, 0.007843138, 1, 0, 1,
-0.3430111, 1.656167, -0.04826682, 0.003921569, 1, 0, 1,
-0.3423849, 0.1345902, -1.876045, 0, 1, 0.003921569, 1,
-0.3388007, -0.5258664, -1.73589, 0, 1, 0.01176471, 1,
-0.3357805, -1.326815, -1.93797, 0, 1, 0.01568628, 1,
-0.335141, -0.1278315, -1.260956, 0, 1, 0.02352941, 1,
-0.3340829, -0.1719782, -2.023971, 0, 1, 0.02745098, 1,
-0.3338094, -0.1422698, -1.502718, 0, 1, 0.03529412, 1,
-0.3327599, -1.028932, -1.560135, 0, 1, 0.03921569, 1,
-0.3309252, 1.363379, -0.3046677, 0, 1, 0.04705882, 1,
-0.3286427, -1.743878, -2.898557, 0, 1, 0.05098039, 1,
-0.3248065, 0.1238558, -1.032651, 0, 1, 0.05882353, 1,
-0.3194273, -0.8731404, -3.939415, 0, 1, 0.0627451, 1,
-0.315824, -0.8919373, -2.112073, 0, 1, 0.07058824, 1,
-0.3135886, 0.2053389, -1.881948, 0, 1, 0.07450981, 1,
-0.3127443, 0.9515674, -0.2163367, 0, 1, 0.08235294, 1,
-0.3122985, -1.411986, -2.072077, 0, 1, 0.08627451, 1,
-0.3115841, -1.413514, -1.971491, 0, 1, 0.09411765, 1,
-0.3099447, -0.5040894, -3.874754, 0, 1, 0.1019608, 1,
-0.3047604, -1.810891, -3.42201, 0, 1, 0.1058824, 1,
-0.3032907, 1.09562, 0.918714, 0, 1, 0.1137255, 1,
-0.294917, -0.1490428, 0.05225782, 0, 1, 0.1176471, 1,
-0.2946307, -1.859103, -3.382035, 0, 1, 0.1254902, 1,
-0.2920494, -2.151459, -2.492486, 0, 1, 0.1294118, 1,
-0.2896347, 0.8399581, 0.2593209, 0, 1, 0.1372549, 1,
-0.2815059, 0.7088825, 0.6288493, 0, 1, 0.1411765, 1,
-0.28126, 1.852694, 1.961972, 0, 1, 0.1490196, 1,
-0.278568, -0.05711377, -1.416613, 0, 1, 0.1529412, 1,
-0.277905, -0.1608308, -1.70301, 0, 1, 0.1607843, 1,
-0.2758804, 2.359263, -1.508734, 0, 1, 0.1647059, 1,
-0.2747029, 0.1289545, 0.5328024, 0, 1, 0.172549, 1,
-0.2716427, 0.171795, -1.109052, 0, 1, 0.1764706, 1,
-0.2705083, 1.549899, 0.1319228, 0, 1, 0.1843137, 1,
-0.2677202, 1.098634, -0.15466, 0, 1, 0.1882353, 1,
-0.2670771, -1.679747, -1.722774, 0, 1, 0.1960784, 1,
-0.2658154, 0.2792415, -1.164912, 0, 1, 0.2039216, 1,
-0.2641826, 0.4694704, -0.4944953, 0, 1, 0.2078431, 1,
-0.2628247, 0.5366203, -0.9931594, 0, 1, 0.2156863, 1,
-0.2619745, -0.9678214, -4.868649, 0, 1, 0.2196078, 1,
-0.2488382, -0.0311997, -1.335708, 0, 1, 0.227451, 1,
-0.2448125, -1.151694, -4.143035, 0, 1, 0.2313726, 1,
-0.2436023, 0.4861389, -2.873899, 0, 1, 0.2392157, 1,
-0.2360951, 2.323338, -0.5739097, 0, 1, 0.2431373, 1,
-0.2345242, 0.5402762, -1.035592, 0, 1, 0.2509804, 1,
-0.2336291, 2.17979, -0.02727402, 0, 1, 0.254902, 1,
-0.2335511, -0.1351042, -1.11999, 0, 1, 0.2627451, 1,
-0.2331771, 1.093635, 1.544713, 0, 1, 0.2666667, 1,
-0.2324017, -0.4791099, -3.951868, 0, 1, 0.2745098, 1,
-0.2275227, -0.7688692, -2.936003, 0, 1, 0.2784314, 1,
-0.2261036, 0.3282888, -0.6672662, 0, 1, 0.2862745, 1,
-0.225307, 1.176124, 0.4451897, 0, 1, 0.2901961, 1,
-0.2249635, 0.8393776, -1.156218, 0, 1, 0.2980392, 1,
-0.2231723, 1.162692, 0.1047146, 0, 1, 0.3058824, 1,
-0.2224127, 0.9836901, -2.071254, 0, 1, 0.3098039, 1,
-0.2076536, -1.332212, -0.2613668, 0, 1, 0.3176471, 1,
-0.2034844, -0.4775507, -2.502178, 0, 1, 0.3215686, 1,
-0.2009896, 0.1579575, -2.007499, 0, 1, 0.3294118, 1,
-0.1995463, -1.182798, -2.147702, 0, 1, 0.3333333, 1,
-0.1989421, 0.4460819, 0.4687856, 0, 1, 0.3411765, 1,
-0.1974212, 0.2954746, -0.9061552, 0, 1, 0.345098, 1,
-0.1965302, -0.03647956, -1.971017, 0, 1, 0.3529412, 1,
-0.1930941, -0.582647, -2.142952, 0, 1, 0.3568628, 1,
-0.191991, -0.893409, -1.958096, 0, 1, 0.3647059, 1,
-0.1898879, 1.508198, 0.6243945, 0, 1, 0.3686275, 1,
-0.1845984, -0.8926223, -4.376166, 0, 1, 0.3764706, 1,
-0.1841654, -0.903921, -3.597213, 0, 1, 0.3803922, 1,
-0.1835258, 1.626433, -0.04624338, 0, 1, 0.3882353, 1,
-0.1830098, -0.76814, -4.946717, 0, 1, 0.3921569, 1,
-0.1761094, 0.3432136, -2.149669, 0, 1, 0.4, 1,
-0.1755256, -0.5147009, -3.217453, 0, 1, 0.4078431, 1,
-0.1605076, 0.05764813, -1.966526, 0, 1, 0.4117647, 1,
-0.1597773, -1.563956, -3.375123, 0, 1, 0.4196078, 1,
-0.1583941, 0.3022623, -0.4538597, 0, 1, 0.4235294, 1,
-0.1568027, -0.1755968, -1.268502, 0, 1, 0.4313726, 1,
-0.1566699, 0.8876725, 0.2221587, 0, 1, 0.4352941, 1,
-0.1544631, 0.2273116, -1.272864, 0, 1, 0.4431373, 1,
-0.1528747, 0.661862, -0.2927803, 0, 1, 0.4470588, 1,
-0.1493617, 0.6723849, 0.1798306, 0, 1, 0.454902, 1,
-0.1481737, -1.584963, -3.242871, 0, 1, 0.4588235, 1,
-0.1455489, -0.8202962, -4.743395, 0, 1, 0.4666667, 1,
-0.1449563, 0.8158726, 0.9746282, 0, 1, 0.4705882, 1,
-0.142035, 0.009040483, -0.5334917, 0, 1, 0.4784314, 1,
-0.1405233, 1.911141, 0.3537374, 0, 1, 0.4823529, 1,
-0.1396792, -1.184671, -3.371666, 0, 1, 0.4901961, 1,
-0.1361691, 0.5855272, 0.1092862, 0, 1, 0.4941176, 1,
-0.1352781, -0.3074412, -2.357795, 0, 1, 0.5019608, 1,
-0.1337933, 0.7809547, 0.5162334, 0, 1, 0.509804, 1,
-0.1334964, -0.2154666, -1.670846, 0, 1, 0.5137255, 1,
-0.1334363, 0.3248134, -0.1045397, 0, 1, 0.5215687, 1,
-0.1333149, -1.531074, -5.122421, 0, 1, 0.5254902, 1,
-0.1268845, 1.391533, 1.167653, 0, 1, 0.5333334, 1,
-0.1255223, -0.6440167, -2.763375, 0, 1, 0.5372549, 1,
-0.1223821, -0.2072041, -1.713728, 0, 1, 0.5450981, 1,
-0.1183638, -0.02925523, 0.3152473, 0, 1, 0.5490196, 1,
-0.1180843, -0.2032673, -2.778804, 0, 1, 0.5568628, 1,
-0.1153868, 0.02521515, -2.81099, 0, 1, 0.5607843, 1,
-0.1130327, -0.6201697, -3.35818, 0, 1, 0.5686275, 1,
-0.111763, 0.4855838, 0.3230594, 0, 1, 0.572549, 1,
-0.1106975, 1.141693, 0.2681623, 0, 1, 0.5803922, 1,
-0.1066441, 1.979532, -0.6140361, 0, 1, 0.5843138, 1,
-0.1064912, -0.2349181, -2.489783, 0, 1, 0.5921569, 1,
-0.1049043, -1.4937, -3.027494, 0, 1, 0.5960785, 1,
-0.1040091, -1.035566, -3.109423, 0, 1, 0.6039216, 1,
-0.1038683, 0.6551794, -1.276063, 0, 1, 0.6117647, 1,
-0.1022331, -0.6747786, -1.98956, 0, 1, 0.6156863, 1,
-0.1019662, 0.9198348, 2.538332, 0, 1, 0.6235294, 1,
-0.09960678, -0.7271047, -3.833869, 0, 1, 0.627451, 1,
-0.09869057, 1.278364, 0.4967461, 0, 1, 0.6352941, 1,
-0.09726842, 0.1076287, -2.708239, 0, 1, 0.6392157, 1,
-0.09578355, -1.667621, -2.861707, 0, 1, 0.6470588, 1,
-0.09215843, -1.6103, -3.346878, 0, 1, 0.6509804, 1,
-0.08960313, 0.1580112, -3.621591, 0, 1, 0.6588235, 1,
-0.08708289, 1.506358, 1.252211, 0, 1, 0.6627451, 1,
-0.08672272, 1.078258, -1.106675, 0, 1, 0.6705883, 1,
-0.07944244, -0.04033311, -2.571787, 0, 1, 0.6745098, 1,
-0.07780347, 0.7109371, 0.4007149, 0, 1, 0.682353, 1,
-0.07520495, 0.3105819, 1.876152, 0, 1, 0.6862745, 1,
-0.0732263, -0.8747061, -3.667898, 0, 1, 0.6941177, 1,
-0.07320853, 0.0074224, 0.6207953, 0, 1, 0.7019608, 1,
-0.07230877, -0.1942074, -2.137854, 0, 1, 0.7058824, 1,
-0.0663332, -0.01008732, -2.449658, 0, 1, 0.7137255, 1,
-0.06345771, 0.08105056, -1.854417, 0, 1, 0.7176471, 1,
-0.0627674, -0.3003545, -2.473326, 0, 1, 0.7254902, 1,
-0.06196799, -1.06958, -1.017525, 0, 1, 0.7294118, 1,
-0.06022288, 0.470611, 0.4808806, 0, 1, 0.7372549, 1,
-0.0571124, -0.2478121, -2.340901, 0, 1, 0.7411765, 1,
-0.04666773, 1.141976, -0.4415056, 0, 1, 0.7490196, 1,
-0.03789353, -0.01101832, -1.511024, 0, 1, 0.7529412, 1,
-0.03759875, 1.848507, 0.6642156, 0, 1, 0.7607843, 1,
-0.03646623, 0.1347417, 0.2171344, 0, 1, 0.7647059, 1,
-0.03117795, 0.9041938, 0.03453268, 0, 1, 0.772549, 1,
-0.02531768, 0.3242727, -0.4439414, 0, 1, 0.7764706, 1,
-0.02505231, 0.6259532, 0.3627994, 0, 1, 0.7843137, 1,
-0.02226108, 1.255032, 0.6502362, 0, 1, 0.7882353, 1,
-0.02211653, 0.4879973, 1.254824, 0, 1, 0.7960784, 1,
-0.02134527, 0.4852506, 0.205099, 0, 1, 0.8039216, 1,
-0.01770338, 0.9868177, 0.1253979, 0, 1, 0.8078431, 1,
-0.01693152, -1.217023, -3.718549, 0, 1, 0.8156863, 1,
-0.01602932, 0.6599302, -0.4920895, 0, 1, 0.8196079, 1,
-0.01552809, -0.5436696, -3.131233, 0, 1, 0.827451, 1,
-0.007628287, 0.7897478, 0.7519038, 0, 1, 0.8313726, 1,
-0.007364767, 2.97663, 0.237717, 0, 1, 0.8392157, 1,
-0.007120483, -0.790573, -1.675409, 0, 1, 0.8431373, 1,
-0.006320433, 0.7788064, -0.7071978, 0, 1, 0.8509804, 1,
-0.003495355, -0.5141295, -3.226167, 0, 1, 0.854902, 1,
0.004003957, -1.381204, 1.55361, 0, 1, 0.8627451, 1,
0.006502177, -1.02684, 3.028119, 0, 1, 0.8666667, 1,
0.0083533, -0.6701197, 2.435405, 0, 1, 0.8745098, 1,
0.009313931, -1.570007, 2.987743, 0, 1, 0.8784314, 1,
0.009460963, -0.005696131, 1.148469, 0, 1, 0.8862745, 1,
0.01150907, -1.810993, 3.113257, 0, 1, 0.8901961, 1,
0.01299641, 0.4287435, -1.101377, 0, 1, 0.8980392, 1,
0.01374107, -1.360135, 3.360703, 0, 1, 0.9058824, 1,
0.01816332, -0.193467, 2.904008, 0, 1, 0.9098039, 1,
0.02612014, -0.1145628, 3.522036, 0, 1, 0.9176471, 1,
0.02782272, 1.065233, -0.0491077, 0, 1, 0.9215686, 1,
0.03298257, 1.399955, -0.5878654, 0, 1, 0.9294118, 1,
0.03997558, -1.927483, 4.053721, 0, 1, 0.9333333, 1,
0.04727295, 0.9880998, 0.07560329, 0, 1, 0.9411765, 1,
0.04793052, 0.3097106, 0.6546896, 0, 1, 0.945098, 1,
0.05005985, 0.3948056, 0.9107436, 0, 1, 0.9529412, 1,
0.05317109, 0.4284921, 1.278766, 0, 1, 0.9568627, 1,
0.05721286, -0.05464331, 1.866225, 0, 1, 0.9647059, 1,
0.0638111, 1.152582, -0.628717, 0, 1, 0.9686275, 1,
0.06738459, 0.002004607, 0.3366437, 0, 1, 0.9764706, 1,
0.07374956, -0.254565, 3.310091, 0, 1, 0.9803922, 1,
0.07734752, -0.394045, 2.796298, 0, 1, 0.9882353, 1,
0.07927214, 0.4871137, 1.760463, 0, 1, 0.9921569, 1,
0.08609273, -0.1507984, 3.38397, 0, 1, 1, 1,
0.08684669, -1.173747, 0.6039128, 0, 0.9921569, 1, 1,
0.08817532, 1.180422, -1.973294, 0, 0.9882353, 1, 1,
0.09015516, -0.5023814, 4.30171, 0, 0.9803922, 1, 1,
0.09029135, 0.01452887, 0.03804594, 0, 0.9764706, 1, 1,
0.09149427, 1.324928, 2.604533, 0, 0.9686275, 1, 1,
0.09201314, 0.3845547, -0.2964055, 0, 0.9647059, 1, 1,
0.09475285, -0.1353107, 1.420052, 0, 0.9568627, 1, 1,
0.09712442, -0.05534774, 1.415565, 0, 0.9529412, 1, 1,
0.09943739, 1.741864, -1.002807, 0, 0.945098, 1, 1,
0.1023246, 1.030391, 0.6744894, 0, 0.9411765, 1, 1,
0.1023857, -0.7100587, 2.091677, 0, 0.9333333, 1, 1,
0.1044679, 0.561722, 1.394383, 0, 0.9294118, 1, 1,
0.1071733, 0.1305026, -0.386667, 0, 0.9215686, 1, 1,
0.1080801, 0.4342335, -0.5604488, 0, 0.9176471, 1, 1,
0.1107929, -0.8368013, 3.254408, 0, 0.9098039, 1, 1,
0.1115689, -0.98666, 3.463864, 0, 0.9058824, 1, 1,
0.1123278, 1.129513, -0.5325251, 0, 0.8980392, 1, 1,
0.1135412, -0.6521451, 3.679887, 0, 0.8901961, 1, 1,
0.1150751, 1.695787, 1.703247, 0, 0.8862745, 1, 1,
0.1157499, -0.09794276, 4.440366, 0, 0.8784314, 1, 1,
0.1164738, -0.5481326, 2.792098, 0, 0.8745098, 1, 1,
0.1184479, -2.18528, 2.512215, 0, 0.8666667, 1, 1,
0.1241866, 1.348674, -0.7533724, 0, 0.8627451, 1, 1,
0.1243794, -1.61732, 1.690197, 0, 0.854902, 1, 1,
0.124719, -0.915312, 4.152714, 0, 0.8509804, 1, 1,
0.1301631, -1.196463, 2.394662, 0, 0.8431373, 1, 1,
0.1322625, 1.555612, -0.9413812, 0, 0.8392157, 1, 1,
0.136012, 0.4623894, 1.750556, 0, 0.8313726, 1, 1,
0.1402085, -0.1221694, 0.03710667, 0, 0.827451, 1, 1,
0.1428453, 1.526448, 0.5348979, 0, 0.8196079, 1, 1,
0.143408, 1.013221, 0.09377386, 0, 0.8156863, 1, 1,
0.1456206, 1.535938, 0.2249485, 0, 0.8078431, 1, 1,
0.1499507, -1.517841, 2.612038, 0, 0.8039216, 1, 1,
0.1544999, 0.3491542, 1.765472, 0, 0.7960784, 1, 1,
0.1566328, -0.1868549, 2.560296, 0, 0.7882353, 1, 1,
0.1568584, -0.03999023, 0.8415454, 0, 0.7843137, 1, 1,
0.1578985, 1.021099, -0.3566643, 0, 0.7764706, 1, 1,
0.1579375, 0.1333228, 1.700593, 0, 0.772549, 1, 1,
0.167306, -0.8735187, 2.361856, 0, 0.7647059, 1, 1,
0.1681451, -0.3462125, 1.096074, 0, 0.7607843, 1, 1,
0.1683947, -0.2036043, 2.711707, 0, 0.7529412, 1, 1,
0.1742435, 1.013, 0.4585385, 0, 0.7490196, 1, 1,
0.1750391, -1.011341, 3.033268, 0, 0.7411765, 1, 1,
0.1900958, 1.495454, 0.495508, 0, 0.7372549, 1, 1,
0.191341, -1.947002, 3.094829, 0, 0.7294118, 1, 1,
0.1925388, 1.488232, -2.319173, 0, 0.7254902, 1, 1,
0.1943015, 0.738007, 0.7408658, 0, 0.7176471, 1, 1,
0.2000412, 0.6025442, -1.054925, 0, 0.7137255, 1, 1,
0.2036466, -0.116476, 2.407411, 0, 0.7058824, 1, 1,
0.2059479, -1.00475, 5.366131, 0, 0.6980392, 1, 1,
0.2064277, -2.083516, 4.032869, 0, 0.6941177, 1, 1,
0.2071995, 0.3586785, -0.1080035, 0, 0.6862745, 1, 1,
0.2105294, 1.091079, -1.438192, 0, 0.682353, 1, 1,
0.2107786, 0.2251519, 1.086016, 0, 0.6745098, 1, 1,
0.2108934, -0.9772779, 2.961595, 0, 0.6705883, 1, 1,
0.2154581, 0.1220869, -0.3977591, 0, 0.6627451, 1, 1,
0.2159894, 0.430753, -1.216177, 0, 0.6588235, 1, 1,
0.2166926, -0.4642326, 2.872572, 0, 0.6509804, 1, 1,
0.2173318, 1.092088, 2.429907, 0, 0.6470588, 1, 1,
0.2239428, 0.8159349, -0.3134483, 0, 0.6392157, 1, 1,
0.2306608, 0.4012139, 0.3476268, 0, 0.6352941, 1, 1,
0.2310569, -0.181244, 1.784883, 0, 0.627451, 1, 1,
0.2323451, -0.1701151, 2.450333, 0, 0.6235294, 1, 1,
0.2369776, -0.7416727, 1.910241, 0, 0.6156863, 1, 1,
0.2396542, -1.329139, 1.919512, 0, 0.6117647, 1, 1,
0.2454095, -1.06586, 1.976652, 0, 0.6039216, 1, 1,
0.2462043, -0.7397129, 2.953368, 0, 0.5960785, 1, 1,
0.2536667, -0.263381, 2.472867, 0, 0.5921569, 1, 1,
0.2563181, 0.9172539, 1.213049, 0, 0.5843138, 1, 1,
0.2622997, 0.2150987, -0.5560879, 0, 0.5803922, 1, 1,
0.2633591, 0.158605, 0.7204472, 0, 0.572549, 1, 1,
0.2637247, 0.4298073, -0.1061896, 0, 0.5686275, 1, 1,
0.2642414, -1.586713, 4.244298, 0, 0.5607843, 1, 1,
0.2661085, 1.637503, -0.8886809, 0, 0.5568628, 1, 1,
0.2689496, -0.1689291, 2.529501, 0, 0.5490196, 1, 1,
0.2690704, -2.240237, 3.661695, 0, 0.5450981, 1, 1,
0.272092, -0.01369553, 3.626728, 0, 0.5372549, 1, 1,
0.2723289, -0.4337914, 3.324905, 0, 0.5333334, 1, 1,
0.2748026, 0.2370549, -0.7037274, 0, 0.5254902, 1, 1,
0.2797493, 1.597249, 0.5487598, 0, 0.5215687, 1, 1,
0.284162, 2.014705, 0.2893201, 0, 0.5137255, 1, 1,
0.288364, -0.3052796, 1.056612, 0, 0.509804, 1, 1,
0.2886283, -0.7250293, 1.130475, 0, 0.5019608, 1, 1,
0.2904887, 1.193472, 1.066896, 0, 0.4941176, 1, 1,
0.2933457, 1.672879, -0.7941868, 0, 0.4901961, 1, 1,
0.296863, 0.5336195, -1.13911, 0, 0.4823529, 1, 1,
0.2983295, 0.2776738, 1.449656, 0, 0.4784314, 1, 1,
0.3071575, -2.108783, 4.150706, 0, 0.4705882, 1, 1,
0.3097359, 0.09180345, -0.3303496, 0, 0.4666667, 1, 1,
0.3146108, -2.002553, 2.588012, 0, 0.4588235, 1, 1,
0.3184074, 0.1987959, 2.236107, 0, 0.454902, 1, 1,
0.3209091, 0.4036731, -0.1975444, 0, 0.4470588, 1, 1,
0.321324, -0.4959604, 2.081364, 0, 0.4431373, 1, 1,
0.3228159, -1.623184, 3.214237, 0, 0.4352941, 1, 1,
0.3282848, -0.6209966, 3.676076, 0, 0.4313726, 1, 1,
0.3285576, -0.4426783, 1.012926, 0, 0.4235294, 1, 1,
0.329345, 0.6931086, 0.695685, 0, 0.4196078, 1, 1,
0.3310731, 1.077691, 0.3923375, 0, 0.4117647, 1, 1,
0.3338293, -0.265151, 3.544894, 0, 0.4078431, 1, 1,
0.333954, -2.23499, 1.816436, 0, 0.4, 1, 1,
0.3341982, 0.8505734, -1.618373, 0, 0.3921569, 1, 1,
0.3364452, 0.532018, 1.831226, 0, 0.3882353, 1, 1,
0.33912, -0.3411854, 0.9659461, 0, 0.3803922, 1, 1,
0.3524638, -1.938537, 3.272537, 0, 0.3764706, 1, 1,
0.354054, 0.8090921, 1.741258, 0, 0.3686275, 1, 1,
0.355065, -1.262753, 3.160996, 0, 0.3647059, 1, 1,
0.3564563, 1.009044, -1.584613, 0, 0.3568628, 1, 1,
0.3564801, -1.656142, 3.235733, 0, 0.3529412, 1, 1,
0.3571501, -0.2586527, 1.20087, 0, 0.345098, 1, 1,
0.3574058, -1.350257, 3.823804, 0, 0.3411765, 1, 1,
0.3598038, -0.9918343, 3.343222, 0, 0.3333333, 1, 1,
0.3653544, -0.7680017, 2.683517, 0, 0.3294118, 1, 1,
0.3671428, 0.5917019, 1.636227, 0, 0.3215686, 1, 1,
0.3701309, 1.424423, 1.081079, 0, 0.3176471, 1, 1,
0.3768155, -1.953308, 3.197328, 0, 0.3098039, 1, 1,
0.3774922, 0.2588619, 0.5855089, 0, 0.3058824, 1, 1,
0.3810367, 0.3796736, -0.03362396, 0, 0.2980392, 1, 1,
0.3836523, 0.8892689, -0.720245, 0, 0.2901961, 1, 1,
0.3839817, -1.90638, 0.5579021, 0, 0.2862745, 1, 1,
0.3874624, -0.9632897, 1.616459, 0, 0.2784314, 1, 1,
0.395241, -0.6395277, 2.352425, 0, 0.2745098, 1, 1,
0.401677, -1.237532, 4.65439, 0, 0.2666667, 1, 1,
0.4021651, 0.8834645, 0.09383832, 0, 0.2627451, 1, 1,
0.4053346, 0.58252, 1.188435, 0, 0.254902, 1, 1,
0.4056835, 0.1042418, 1.098942, 0, 0.2509804, 1, 1,
0.4063698, 0.2531589, 1.256101, 0, 0.2431373, 1, 1,
0.4070275, 0.8758304, 1.275311, 0, 0.2392157, 1, 1,
0.4093665, 0.7225604, 1.335557, 0, 0.2313726, 1, 1,
0.410875, -0.1238702, 3.61597, 0, 0.227451, 1, 1,
0.411092, -0.1870055, 2.414385, 0, 0.2196078, 1, 1,
0.41204, 0.565779, 1.169447, 0, 0.2156863, 1, 1,
0.4191006, -0.7621658, 0.7892833, 0, 0.2078431, 1, 1,
0.4195836, 0.4351912, 0.3613716, 0, 0.2039216, 1, 1,
0.4198631, -0.8606406, 4.099894, 0, 0.1960784, 1, 1,
0.4324306, 0.2925704, 0.6856145, 0, 0.1882353, 1, 1,
0.4337279, 0.4162171, 0.8172057, 0, 0.1843137, 1, 1,
0.4337773, -0.8235321, 1.678179, 0, 0.1764706, 1, 1,
0.4343009, 0.7500995, 1.252242, 0, 0.172549, 1, 1,
0.4423972, 0.6732382, 0.5212169, 0, 0.1647059, 1, 1,
0.4474226, 0.9714329, -1.665037, 0, 0.1607843, 1, 1,
0.4477815, -1.600182, 2.705428, 0, 0.1529412, 1, 1,
0.448916, 0.9942534, 0.2225954, 0, 0.1490196, 1, 1,
0.4494252, 1.321713, 1.643762, 0, 0.1411765, 1, 1,
0.4520261, 1.015031, 0.8426294, 0, 0.1372549, 1, 1,
0.456009, 0.692352, 2.648367, 0, 0.1294118, 1, 1,
0.4625978, 0.4232499, 0.8431711, 0, 0.1254902, 1, 1,
0.4663204, 0.4145838, 1.073753, 0, 0.1176471, 1, 1,
0.4713403, 1.356865, 2.487644, 0, 0.1137255, 1, 1,
0.4736707, 0.5083495, 1.516538, 0, 0.1058824, 1, 1,
0.4738944, 1.841194, 0.276264, 0, 0.09803922, 1, 1,
0.4740368, -0.9092128, 3.442349, 0, 0.09411765, 1, 1,
0.4751706, -0.02500943, -0.0805841, 0, 0.08627451, 1, 1,
0.4759029, -0.4446687, 1.870595, 0, 0.08235294, 1, 1,
0.4841139, 0.1510072, 2.522763, 0, 0.07450981, 1, 1,
0.4841789, 0.4432093, 1.291132, 0, 0.07058824, 1, 1,
0.4845736, 0.03685772, 1.19572, 0, 0.0627451, 1, 1,
0.4847973, -1.894943, 3.60464, 0, 0.05882353, 1, 1,
0.4870429, -0.526215, 3.707361, 0, 0.05098039, 1, 1,
0.4906374, 0.3996091, 1.790323, 0, 0.04705882, 1, 1,
0.4959561, -0.5376624, 2.359695, 0, 0.03921569, 1, 1,
0.496549, -0.7879951, 1.852275, 0, 0.03529412, 1, 1,
0.4999224, -1.104298, 2.332309, 0, 0.02745098, 1, 1,
0.5010009, 0.3342644, 2.801451, 0, 0.02352941, 1, 1,
0.5011011, -0.6100773, 4.861116, 0, 0.01568628, 1, 1,
0.507188, 0.6331738, -0.498336, 0, 0.01176471, 1, 1,
0.5079858, -0.4452365, 2.413594, 0, 0.003921569, 1, 1,
0.5130529, 0.1930625, 1.482647, 0.003921569, 0, 1, 1,
0.5144479, -2.213077, 2.915621, 0.007843138, 0, 1, 1,
0.515748, 0.1394029, 0.8565302, 0.01568628, 0, 1, 1,
0.5196122, 0.7847046, 1.588164, 0.01960784, 0, 1, 1,
0.52019, -1.216499, 3.238944, 0.02745098, 0, 1, 1,
0.5209591, 0.3489561, 1.280502, 0.03137255, 0, 1, 1,
0.5216438, -1.979667, 3.677819, 0.03921569, 0, 1, 1,
0.5239236, 0.7687511, -0.2012203, 0.04313726, 0, 1, 1,
0.5243814, -0.1753137, 2.625864, 0.05098039, 0, 1, 1,
0.5301626, 0.1443254, 0.5340059, 0.05490196, 0, 1, 1,
0.533616, -0.5365832, 0.1122145, 0.0627451, 0, 1, 1,
0.534649, -0.4811368, 3.164898, 0.06666667, 0, 1, 1,
0.5363966, 1.573956, 0.7370905, 0.07450981, 0, 1, 1,
0.5365757, 0.3783139, 1.172902, 0.07843138, 0, 1, 1,
0.5424308, -1.331326, 3.80577, 0.08627451, 0, 1, 1,
0.5472712, 1.473024, 0.8785917, 0.09019608, 0, 1, 1,
0.5526812, -0.3541078, 2.738866, 0.09803922, 0, 1, 1,
0.5531302, -0.02618778, 1.954643, 0.1058824, 0, 1, 1,
0.557544, 0.7301186, 0.7522609, 0.1098039, 0, 1, 1,
0.5593234, 0.8254477, 0.3467059, 0.1176471, 0, 1, 1,
0.5616106, 2.405874, -0.9069757, 0.1215686, 0, 1, 1,
0.5629714, -1.148549, 2.405393, 0.1294118, 0, 1, 1,
0.5634567, -0.887481, 1.409763, 0.1333333, 0, 1, 1,
0.5638111, -1.372561, 1.526835, 0.1411765, 0, 1, 1,
0.5692613, 0.5363669, 0.9594764, 0.145098, 0, 1, 1,
0.5694268, 0.6018352, 0.9662533, 0.1529412, 0, 1, 1,
0.5710997, -0.02546629, 2.369277, 0.1568628, 0, 1, 1,
0.5753309, -0.4925004, 3.480329, 0.1647059, 0, 1, 1,
0.5783624, -0.3731152, 1.300339, 0.1686275, 0, 1, 1,
0.579994, -0.5534676, 1.813417, 0.1764706, 0, 1, 1,
0.5852118, 2.140678, 0.3221931, 0.1803922, 0, 1, 1,
0.5877112, -0.892222, 1.75289, 0.1882353, 0, 1, 1,
0.5937572, -0.2395985, 3.478408, 0.1921569, 0, 1, 1,
0.5942784, -1.513357, 4.772761, 0.2, 0, 1, 1,
0.5961662, 0.4954398, 0.9556526, 0.2078431, 0, 1, 1,
0.5980265, -1.401604, 1.41449, 0.2117647, 0, 1, 1,
0.5983868, -1.635802, 1.226721, 0.2196078, 0, 1, 1,
0.6056423, 0.672472, 1.345122, 0.2235294, 0, 1, 1,
0.6078236, 0.530925, 1.411269, 0.2313726, 0, 1, 1,
0.6098076, -1.987668, 1.773207, 0.2352941, 0, 1, 1,
0.6098558, -1.395317, 3.301808, 0.2431373, 0, 1, 1,
0.6165239, 0.1453366, 2.676042, 0.2470588, 0, 1, 1,
0.6169971, -1.013065, 3.088545, 0.254902, 0, 1, 1,
0.6192681, -1.012475, 1.936493, 0.2588235, 0, 1, 1,
0.6210086, -0.7192659, 2.623828, 0.2666667, 0, 1, 1,
0.625834, -0.3855423, 3.014226, 0.2705882, 0, 1, 1,
0.6295361, 0.4614651, 0.6956884, 0.2784314, 0, 1, 1,
0.6320716, 0.5298541, 0.696101, 0.282353, 0, 1, 1,
0.6391143, -1.262672, 3.540366, 0.2901961, 0, 1, 1,
0.649981, -1.401316, 4.717581, 0.2941177, 0, 1, 1,
0.6512858, 0.3596477, 0.5211136, 0.3019608, 0, 1, 1,
0.655496, 0.8109819, 1.350217, 0.3098039, 0, 1, 1,
0.6564854, -1.120209, 1.508135, 0.3137255, 0, 1, 1,
0.6567026, -1.096205, 3.798919, 0.3215686, 0, 1, 1,
0.6581377, 0.1903258, 3.071856, 0.3254902, 0, 1, 1,
0.6608785, -0.3179319, 2.754585, 0.3333333, 0, 1, 1,
0.6665463, -1.078121, 3.189432, 0.3372549, 0, 1, 1,
0.6692169, -0.7636795, 2.378126, 0.345098, 0, 1, 1,
0.6712115, -1.455702, 0.3909295, 0.3490196, 0, 1, 1,
0.6740162, 0.8919918, -0.5372689, 0.3568628, 0, 1, 1,
0.6778945, -2.080779, 1.788051, 0.3607843, 0, 1, 1,
0.6792066, -0.7280967, 4.128305, 0.3686275, 0, 1, 1,
0.6897885, -1.503219, 1.139646, 0.372549, 0, 1, 1,
0.6899445, 0.7830279, 2.695017, 0.3803922, 0, 1, 1,
0.6932724, 0.03823692, 0.7127188, 0.3843137, 0, 1, 1,
0.6942381, -0.245565, 0.8978569, 0.3921569, 0, 1, 1,
0.6975127, -0.1696423, 1.823055, 0.3960784, 0, 1, 1,
0.6975402, -0.979883, 2.239204, 0.4039216, 0, 1, 1,
0.6984688, 0.2221359, 1.958691, 0.4117647, 0, 1, 1,
0.6997972, 1.465883, 0.8629489, 0.4156863, 0, 1, 1,
0.7037569, 0.753695, -0.2917959, 0.4235294, 0, 1, 1,
0.7071081, -0.3336855, 3.321805, 0.427451, 0, 1, 1,
0.7074249, 0.4007818, -0.6263574, 0.4352941, 0, 1, 1,
0.7106752, -0.8218032, 3.753088, 0.4392157, 0, 1, 1,
0.7269625, -0.3553713, 2.713252, 0.4470588, 0, 1, 1,
0.7437328, 0.9550815, -0.894139, 0.4509804, 0, 1, 1,
0.7459696, -0.6206086, 2.192945, 0.4588235, 0, 1, 1,
0.7480568, 0.5047617, -0.2074011, 0.4627451, 0, 1, 1,
0.7485251, -0.518039, 0.6877899, 0.4705882, 0, 1, 1,
0.7498596, -0.5017815, 3.032554, 0.4745098, 0, 1, 1,
0.750082, -0.8607517, 2.064024, 0.4823529, 0, 1, 1,
0.7507536, -0.3032332, 2.980516, 0.4862745, 0, 1, 1,
0.7535141, -0.3257852, 1.230765, 0.4941176, 0, 1, 1,
0.7582058, -0.6738794, 2.849946, 0.5019608, 0, 1, 1,
0.7627738, 0.4439383, 0.8174379, 0.5058824, 0, 1, 1,
0.7642217, -1.175299, 3.798407, 0.5137255, 0, 1, 1,
0.7738277, -1.244467, 0.8309172, 0.5176471, 0, 1, 1,
0.7763144, 0.08310647, 1.023532, 0.5254902, 0, 1, 1,
0.7781409, -0.350117, 2.018116, 0.5294118, 0, 1, 1,
0.7788001, -1.488888, 1.768139, 0.5372549, 0, 1, 1,
0.7816426, -0.4326428, 1.20802, 0.5411765, 0, 1, 1,
0.7944263, 2.523605, -0.2735522, 0.5490196, 0, 1, 1,
0.7946906, 1.430146, 1.02449, 0.5529412, 0, 1, 1,
0.7971212, 0.2264154, 1.180746, 0.5607843, 0, 1, 1,
0.8037159, -1.336745, 3.318001, 0.5647059, 0, 1, 1,
0.8116471, 1.848813, -0.3461644, 0.572549, 0, 1, 1,
0.8128054, -1.11762, 4.030737, 0.5764706, 0, 1, 1,
0.8134683, 0.4193961, 0.5150383, 0.5843138, 0, 1, 1,
0.8152865, -0.5996776, 0.9421483, 0.5882353, 0, 1, 1,
0.8208494, 0.01927703, 3.16026, 0.5960785, 0, 1, 1,
0.8255127, 1.010326, 2.637549, 0.6039216, 0, 1, 1,
0.8330832, -0.3524216, 2.152006, 0.6078432, 0, 1, 1,
0.8418578, 0.262987, 2.788327, 0.6156863, 0, 1, 1,
0.8477583, 0.5680506, 0.6263361, 0.6196079, 0, 1, 1,
0.8484605, 1.754514, -0.3446312, 0.627451, 0, 1, 1,
0.8511778, -0.4684649, 1.862161, 0.6313726, 0, 1, 1,
0.8570544, -0.9357656, 1.475258, 0.6392157, 0, 1, 1,
0.8633935, -1.425197, 1.63564, 0.6431373, 0, 1, 1,
0.8635349, -1.301523, 3.848451, 0.6509804, 0, 1, 1,
0.8668787, -0.3695701, 3.066633, 0.654902, 0, 1, 1,
0.8681028, 0.2469782, 1.642596, 0.6627451, 0, 1, 1,
0.871166, 0.59577, 2.316134, 0.6666667, 0, 1, 1,
0.8751573, 0.2358319, 1.290244, 0.6745098, 0, 1, 1,
0.8774139, -0.3462678, 3.235039, 0.6784314, 0, 1, 1,
0.8788971, -1.997418, 2.77449, 0.6862745, 0, 1, 1,
0.8806217, -0.31389, 1.084154, 0.6901961, 0, 1, 1,
0.8818668, -1.415794, 3.099555, 0.6980392, 0, 1, 1,
0.8827682, -0.2724165, 3.538287, 0.7058824, 0, 1, 1,
0.8876343, 0.2174038, 1.99467, 0.7098039, 0, 1, 1,
0.8932456, 1.294837, -0.5128043, 0.7176471, 0, 1, 1,
0.8995883, 1.46612, -0.3448486, 0.7215686, 0, 1, 1,
0.9010308, -0.3448137, 2.818841, 0.7294118, 0, 1, 1,
0.9056079, 0.4303128, 0.5445693, 0.7333333, 0, 1, 1,
0.9068188, -1.28353, 1.983923, 0.7411765, 0, 1, 1,
0.9068522, 0.3392571, 0.4896219, 0.7450981, 0, 1, 1,
0.9073656, 0.6006947, 0.8087954, 0.7529412, 0, 1, 1,
0.9093387, 2.274989, -0.08634732, 0.7568628, 0, 1, 1,
0.9145954, 1.312086, 0.3840589, 0.7647059, 0, 1, 1,
0.9182063, 0.1052317, 2.037091, 0.7686275, 0, 1, 1,
0.9184042, 0.9321848, -0.8616115, 0.7764706, 0, 1, 1,
0.9198807, 1.157241, -0.08032672, 0.7803922, 0, 1, 1,
0.9204063, 1.038514, 0.4470503, 0.7882353, 0, 1, 1,
0.9240857, -0.9900326, 2.205271, 0.7921569, 0, 1, 1,
0.9278216, -0.7562824, 2.844502, 0.8, 0, 1, 1,
0.9326819, -0.7561687, 2.574379, 0.8078431, 0, 1, 1,
0.93398, -0.417671, 3.146047, 0.8117647, 0, 1, 1,
0.9355654, 1.3313, -1.20099, 0.8196079, 0, 1, 1,
0.9361182, -0.8273399, 1.321928, 0.8235294, 0, 1, 1,
0.9417554, 0.9155858, 0.6876712, 0.8313726, 0, 1, 1,
0.9440701, -0.9052562, 2.562481, 0.8352941, 0, 1, 1,
0.9473099, -0.5419164, 1.321295, 0.8431373, 0, 1, 1,
0.9610726, 0.1673633, 1.562392, 0.8470588, 0, 1, 1,
0.9620763, -0.5189295, 2.745634, 0.854902, 0, 1, 1,
0.9625653, 1.082034, 1.481369, 0.8588235, 0, 1, 1,
0.9627398, 0.8709835, -0.00881723, 0.8666667, 0, 1, 1,
0.9683407, 0.5490223, -0.4311399, 0.8705882, 0, 1, 1,
0.9710095, 1.534951, 0.517041, 0.8784314, 0, 1, 1,
0.9782333, -0.4941727, 0.4586805, 0.8823529, 0, 1, 1,
0.9840821, -0.2281395, 2.249827, 0.8901961, 0, 1, 1,
0.9856665, 0.4485176, 1.422053, 0.8941177, 0, 1, 1,
0.9893542, -1.061515, 1.925191, 0.9019608, 0, 1, 1,
0.9909602, -0.0666735, 1.955474, 0.9098039, 0, 1, 1,
0.9931815, -1.595883, 3.58163, 0.9137255, 0, 1, 1,
0.9939365, -0.6363279, 1.709363, 0.9215686, 0, 1, 1,
0.9950905, 0.002537715, 1.403779, 0.9254902, 0, 1, 1,
1.001265, 1.478136, 1.025036, 0.9333333, 0, 1, 1,
1.00579, -0.3647209, 0.7243613, 0.9372549, 0, 1, 1,
1.00905, -0.3599872, 1.432145, 0.945098, 0, 1, 1,
1.011164, -1.198188, 0.5566444, 0.9490196, 0, 1, 1,
1.017524, 0.3142239, 2.376862, 0.9568627, 0, 1, 1,
1.01784, -1.721489, 0.09705707, 0.9607843, 0, 1, 1,
1.019726, -2.414277, 1.745868, 0.9686275, 0, 1, 1,
1.020148, -0.8473169, 2.93667, 0.972549, 0, 1, 1,
1.02092, -0.4592376, 0.7664421, 0.9803922, 0, 1, 1,
1.021835, -1.077749, 2.501343, 0.9843137, 0, 1, 1,
1.032368, 1.035931, 0.7793553, 0.9921569, 0, 1, 1,
1.039117, 0.9251199, 0.2549441, 0.9960784, 0, 1, 1,
1.042982, 0.04550603, 1.678738, 1, 0, 0.9960784, 1,
1.045729, 0.8752737, 0.4089859, 1, 0, 0.9882353, 1,
1.045865, -1.353888, 2.191675, 1, 0, 0.9843137, 1,
1.048217, -0.6271706, 1.520307, 1, 0, 0.9764706, 1,
1.05406, -0.3332614, 1.686976, 1, 0, 0.972549, 1,
1.055996, 0.1979744, 0.341805, 1, 0, 0.9647059, 1,
1.056498, -0.1604538, 0.9117405, 1, 0, 0.9607843, 1,
1.057961, 2.419324, -0.3796983, 1, 0, 0.9529412, 1,
1.059513, 0.05045854, 0.5144587, 1, 0, 0.9490196, 1,
1.074486, 1.2691, -0.2462076, 1, 0, 0.9411765, 1,
1.075701, -1.927817, 2.31947, 1, 0, 0.9372549, 1,
1.076216, -0.6611596, 1.322201, 1, 0, 0.9294118, 1,
1.084203, -0.5201737, 2.251289, 1, 0, 0.9254902, 1,
1.084407, 0.8618971, 0.533084, 1, 0, 0.9176471, 1,
1.085703, -0.928597, 1.907783, 1, 0, 0.9137255, 1,
1.088623, -0.2835176, 0.7234136, 1, 0, 0.9058824, 1,
1.097146, 0.131771, -2.077737, 1, 0, 0.9019608, 1,
1.098791, -0.9057399, 1.192934, 1, 0, 0.8941177, 1,
1.104486, 1.735968, -0.5065342, 1, 0, 0.8862745, 1,
1.108166, 1.577495, 0.8431612, 1, 0, 0.8823529, 1,
1.110995, 0.5446252, 2.345456, 1, 0, 0.8745098, 1,
1.115895, -2.028703, 3.435048, 1, 0, 0.8705882, 1,
1.117161, 1.498063, -0.6056883, 1, 0, 0.8627451, 1,
1.128159, 0.1596493, 3.355133, 1, 0, 0.8588235, 1,
1.133226, -0.4476349, 2.909936, 1, 0, 0.8509804, 1,
1.137723, -2.053925, 3.13814, 1, 0, 0.8470588, 1,
1.142191, 0.1237705, 0.5293804, 1, 0, 0.8392157, 1,
1.144711, -0.3948033, 2.966464, 1, 0, 0.8352941, 1,
1.145779, 0.4389272, -0.3250387, 1, 0, 0.827451, 1,
1.148751, 2.333282, 1.611564, 1, 0, 0.8235294, 1,
1.14942, -0.4961314, 1.794491, 1, 0, 0.8156863, 1,
1.155439, -0.4121166, 1.057413, 1, 0, 0.8117647, 1,
1.181141, -0.5279486, 2.486297, 1, 0, 0.8039216, 1,
1.183209, -0.4806022, 3.404646, 1, 0, 0.7960784, 1,
1.190724, 0.3798015, 0.3974598, 1, 0, 0.7921569, 1,
1.191193, -0.966996, 1.880666, 1, 0, 0.7843137, 1,
1.194, -1.212017, 2.892726, 1, 0, 0.7803922, 1,
1.202628, -2.239929, 2.146478, 1, 0, 0.772549, 1,
1.211354, 1.678586, 0.4021807, 1, 0, 0.7686275, 1,
1.219774, 0.4907697, 1.648532, 1, 0, 0.7607843, 1,
1.221814, -2.115482, 3.565418, 1, 0, 0.7568628, 1,
1.222004, 0.7040771, 0.7907757, 1, 0, 0.7490196, 1,
1.226054, 1.436768, 0.1471312, 1, 0, 0.7450981, 1,
1.236167, 1.181467, -0.123055, 1, 0, 0.7372549, 1,
1.23644, 0.7118523, 0.5185314, 1, 0, 0.7333333, 1,
1.241951, -0.9262639, 1.496226, 1, 0, 0.7254902, 1,
1.246208, -0.5011261, 3.36925, 1, 0, 0.7215686, 1,
1.247839, 0.1680857, 2.987542, 1, 0, 0.7137255, 1,
1.257712, -1.392013, 1.731327, 1, 0, 0.7098039, 1,
1.259268, 0.1405711, 2.474795, 1, 0, 0.7019608, 1,
1.264846, -2.17105, 2.510821, 1, 0, 0.6941177, 1,
1.266338, -0.05863732, 0.4022953, 1, 0, 0.6901961, 1,
1.273096, -0.4990929, 3.064502, 1, 0, 0.682353, 1,
1.273852, -1.396516, 2.890168, 1, 0, 0.6784314, 1,
1.280183, -1.16554, 1.254679, 1, 0, 0.6705883, 1,
1.280257, 1.228304, -0.3245862, 1, 0, 0.6666667, 1,
1.280391, -0.0794583, 2.283383, 1, 0, 0.6588235, 1,
1.282389, -1.109426, 2.593443, 1, 0, 0.654902, 1,
1.287154, 0.1766282, 0.2278067, 1, 0, 0.6470588, 1,
1.288764, -0.05270881, 1.240137, 1, 0, 0.6431373, 1,
1.289376, 0.3900321, 0.21517, 1, 0, 0.6352941, 1,
1.29216, -0.3588087, 2.392737, 1, 0, 0.6313726, 1,
1.292211, 0.5485648, 2.997622, 1, 0, 0.6235294, 1,
1.293911, -0.4188804, 1.917184, 1, 0, 0.6196079, 1,
1.297543, -0.7605856, 0.6546866, 1, 0, 0.6117647, 1,
1.307744, -2.010567, 2.90497, 1, 0, 0.6078432, 1,
1.307968, -2.661159, 3.384276, 1, 0, 0.6, 1,
1.320072, -0.8705656, 2.106675, 1, 0, 0.5921569, 1,
1.331134, -0.6145081, 2.348926, 1, 0, 0.5882353, 1,
1.343083, -0.2547213, 0.5888909, 1, 0, 0.5803922, 1,
1.345942, -0.965835, 1.10566, 1, 0, 0.5764706, 1,
1.347265, 1.76918, -0.3831633, 1, 0, 0.5686275, 1,
1.349746, -0.6701373, 1.382302, 1, 0, 0.5647059, 1,
1.354958, -0.3802169, 0.9143242, 1, 0, 0.5568628, 1,
1.356402, -0.5841749, 2.730496, 1, 0, 0.5529412, 1,
1.371204, -0.8981066, 3.924476, 1, 0, 0.5450981, 1,
1.379022, -1.115087, 0.3977419, 1, 0, 0.5411765, 1,
1.385618, -0.3379152, 0.8606471, 1, 0, 0.5333334, 1,
1.402848, 0.5634589, -1.249877, 1, 0, 0.5294118, 1,
1.405053, 0.19854, -0.1035405, 1, 0, 0.5215687, 1,
1.417947, 0.7802945, 0.705446, 1, 0, 0.5176471, 1,
1.420346, 0.5856344, 3.360048, 1, 0, 0.509804, 1,
1.425534, 2.183037, 1.807946, 1, 0, 0.5058824, 1,
1.426117, 0.2186265, 1.146275, 1, 0, 0.4980392, 1,
1.451517, -0.5998656, 1.134467, 1, 0, 0.4901961, 1,
1.454844, 1.626288, 1.558622, 1, 0, 0.4862745, 1,
1.457911, 2.746931, 2.179268, 1, 0, 0.4784314, 1,
1.462975, 0.7695536, -0.07093933, 1, 0, 0.4745098, 1,
1.479908, -1.055235, 1.906453, 1, 0, 0.4666667, 1,
1.480452, 0.8876912, 1.170383, 1, 0, 0.4627451, 1,
1.488963, 1.643799, 0.2856621, 1, 0, 0.454902, 1,
1.491172, -0.5937, 1.21342, 1, 0, 0.4509804, 1,
1.493244, 1.90403, 0.3830512, 1, 0, 0.4431373, 1,
1.498881, -1.235083, 2.781697, 1, 0, 0.4392157, 1,
1.507558, -2.39234, 2.326509, 1, 0, 0.4313726, 1,
1.517564, -0.9067444, 2.496623, 1, 0, 0.427451, 1,
1.518922, -0.8702285, 0.2022475, 1, 0, 0.4196078, 1,
1.526376, 0.02277151, -0.1086605, 1, 0, 0.4156863, 1,
1.528642, -0.150465, 0.4327457, 1, 0, 0.4078431, 1,
1.548402, -0.1258266, 2.097997, 1, 0, 0.4039216, 1,
1.556323, 0.2806516, 1.440191, 1, 0, 0.3960784, 1,
1.579165, -1.373633, 3.06039, 1, 0, 0.3882353, 1,
1.604805, -0.2478973, 2.312828, 1, 0, 0.3843137, 1,
1.605715, -0.3990359, -0.6646436, 1, 0, 0.3764706, 1,
1.609742, -0.6757849, 1.776938, 1, 0, 0.372549, 1,
1.610464, 1.467697, 0.1277233, 1, 0, 0.3647059, 1,
1.612409, 0.8374632, 0.8795982, 1, 0, 0.3607843, 1,
1.61365, -0.8856968, 1.945446, 1, 0, 0.3529412, 1,
1.627452, 2.396979, -1.576029, 1, 0, 0.3490196, 1,
1.638741, 0.2921619, 2.471404, 1, 0, 0.3411765, 1,
1.651804, 0.8006839, -0.3767203, 1, 0, 0.3372549, 1,
1.65544, -0.5020067, 1.292243, 1, 0, 0.3294118, 1,
1.657707, 1.18217, 1.068964, 1, 0, 0.3254902, 1,
1.665481, -0.3612281, 1.490722, 1, 0, 0.3176471, 1,
1.669575, 1.809146, 0.8001223, 1, 0, 0.3137255, 1,
1.671319, 0.2705549, 1.707703, 1, 0, 0.3058824, 1,
1.694801, 0.1549722, 2.126344, 1, 0, 0.2980392, 1,
1.702124, -0.8498824, 0.7645361, 1, 0, 0.2941177, 1,
1.709186, 0.2280305, 0.8652016, 1, 0, 0.2862745, 1,
1.717939, -0.7180311, 2.485115, 1, 0, 0.282353, 1,
1.746881, 1.456658, 0.7058067, 1, 0, 0.2745098, 1,
1.765467, 0.01427121, 0.716572, 1, 0, 0.2705882, 1,
1.792544, 0.5947307, 0.5808145, 1, 0, 0.2627451, 1,
1.793949, -0.007398499, 0.6489053, 1, 0, 0.2588235, 1,
1.802877, -2.001878, 1.399687, 1, 0, 0.2509804, 1,
1.805756, 1.498316, -0.7758025, 1, 0, 0.2470588, 1,
1.806349, -0.5003499, 1.025638, 1, 0, 0.2392157, 1,
1.815884, -0.5952551, 3.508203, 1, 0, 0.2352941, 1,
1.817981, -0.07793777, 1.762157, 1, 0, 0.227451, 1,
1.824378, 0.9274364, 1.238946, 1, 0, 0.2235294, 1,
1.827592, 1.846953, 0.6156119, 1, 0, 0.2156863, 1,
1.842032, -0.1437637, 1.079221, 1, 0, 0.2117647, 1,
1.886652, -1.380344, 1.534271, 1, 0, 0.2039216, 1,
1.889227, 0.6973235, 1.112067, 1, 0, 0.1960784, 1,
1.893987, -1.747577, 1.381354, 1, 0, 0.1921569, 1,
1.897306, 0.4664449, 1.920742, 1, 0, 0.1843137, 1,
1.904336, -0.2464934, 3.094982, 1, 0, 0.1803922, 1,
1.905916, 0.1045132, 2.654167, 1, 0, 0.172549, 1,
1.920914, -1.991953, 2.756383, 1, 0, 0.1686275, 1,
1.947086, 0.2851066, 3.121726, 1, 0, 0.1607843, 1,
1.969249, -0.008436774, 1.50747, 1, 0, 0.1568628, 1,
2.002656, -1.079824, 3.561694, 1, 0, 0.1490196, 1,
2.019434, -1.156174, 2.207001, 1, 0, 0.145098, 1,
2.027934, 0.4844778, 2.05275, 1, 0, 0.1372549, 1,
2.055738, 1.226816, 1.928437, 1, 0, 0.1333333, 1,
2.05773, 0.7039855, 0.2816846, 1, 0, 0.1254902, 1,
2.065108, -0.515103, 1.885844, 1, 0, 0.1215686, 1,
2.067049, 0.4966177, 0.3710942, 1, 0, 0.1137255, 1,
2.081015, 0.4751071, 2.448953, 1, 0, 0.1098039, 1,
2.089453, 1.763344, -0.0256258, 1, 0, 0.1019608, 1,
2.119604, -0.6186909, 2.654245, 1, 0, 0.09411765, 1,
2.22048, 1.604614, 2.291582, 1, 0, 0.09019608, 1,
2.260668, -0.3529276, 2.725558, 1, 0, 0.08235294, 1,
2.3054, 0.9929129, 0.9029041, 1, 0, 0.07843138, 1,
2.341357, -0.7936209, 0.8884851, 1, 0, 0.07058824, 1,
2.427264, -0.8626705, 1.831759, 1, 0, 0.06666667, 1,
2.43418, 1.995517, 0.7442751, 1, 0, 0.05882353, 1,
2.50294, 0.5375555, 1.034314, 1, 0, 0.05490196, 1,
2.550162, 0.2223361, 0.1827681, 1, 0, 0.04705882, 1,
2.600744, -2.36895, 3.011334, 1, 0, 0.04313726, 1,
2.645913, 0.2037354, 1.749282, 1, 0, 0.03529412, 1,
2.652246, 0.4930332, 1.720237, 1, 0, 0.03137255, 1,
2.881748, 2.458008, 0.9159178, 1, 0, 0.02352941, 1,
2.91156, -1.052411, 1.267876, 1, 0, 0.01960784, 1,
2.982088, -1.368055, 3.179232, 1, 0, 0.01176471, 1,
3.857377, -2.039247, 2.0729, 1, 0, 0.007843138, 1
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
0.3714565, -3.645134, -7.043811, 0, -0.5, 0.5, 0.5,
0.3714565, -3.645134, -7.043811, 1, -0.5, 0.5, 0.5,
0.3714565, -3.645134, -7.043811, 1, 1.5, 0.5, 0.5,
0.3714565, -3.645134, -7.043811, 0, 1.5, 0.5, 0.5
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
-4.296191, 0.1456068, -7.043811, 0, -0.5, 0.5, 0.5,
-4.296191, 0.1456068, -7.043811, 1, -0.5, 0.5, 0.5,
-4.296191, 0.1456068, -7.043811, 1, 1.5, 0.5, 0.5,
-4.296191, 0.1456068, -7.043811, 0, 1.5, 0.5, 0.5
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
-4.296191, -3.645134, 0.06046987, 0, -0.5, 0.5, 0.5,
-4.296191, -3.645134, 0.06046987, 1, -0.5, 0.5, 0.5,
-4.296191, -3.645134, 0.06046987, 1, 1.5, 0.5, 0.5,
-4.296191, -3.645134, 0.06046987, 0, 1.5, 0.5, 0.5
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
-3, -2.770347, -5.404361,
3, -2.770347, -5.404361,
-3, -2.770347, -5.404361,
-3, -2.916145, -5.677603,
-2, -2.770347, -5.404361,
-2, -2.916145, -5.677603,
-1, -2.770347, -5.404361,
-1, -2.916145, -5.677603,
0, -2.770347, -5.404361,
0, -2.916145, -5.677603,
1, -2.770347, -5.404361,
1, -2.916145, -5.677603,
2, -2.770347, -5.404361,
2, -2.916145, -5.677603,
3, -2.770347, -5.404361,
3, -2.916145, -5.677603
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
-3, -3.207741, -6.224086, 0, -0.5, 0.5, 0.5,
-3, -3.207741, -6.224086, 1, -0.5, 0.5, 0.5,
-3, -3.207741, -6.224086, 1, 1.5, 0.5, 0.5,
-3, -3.207741, -6.224086, 0, 1.5, 0.5, 0.5,
-2, -3.207741, -6.224086, 0, -0.5, 0.5, 0.5,
-2, -3.207741, -6.224086, 1, -0.5, 0.5, 0.5,
-2, -3.207741, -6.224086, 1, 1.5, 0.5, 0.5,
-2, -3.207741, -6.224086, 0, 1.5, 0.5, 0.5,
-1, -3.207741, -6.224086, 0, -0.5, 0.5, 0.5,
-1, -3.207741, -6.224086, 1, -0.5, 0.5, 0.5,
-1, -3.207741, -6.224086, 1, 1.5, 0.5, 0.5,
-1, -3.207741, -6.224086, 0, 1.5, 0.5, 0.5,
0, -3.207741, -6.224086, 0, -0.5, 0.5, 0.5,
0, -3.207741, -6.224086, 1, -0.5, 0.5, 0.5,
0, -3.207741, -6.224086, 1, 1.5, 0.5, 0.5,
0, -3.207741, -6.224086, 0, 1.5, 0.5, 0.5,
1, -3.207741, -6.224086, 0, -0.5, 0.5, 0.5,
1, -3.207741, -6.224086, 1, -0.5, 0.5, 0.5,
1, -3.207741, -6.224086, 1, 1.5, 0.5, 0.5,
1, -3.207741, -6.224086, 0, 1.5, 0.5, 0.5,
2, -3.207741, -6.224086, 0, -0.5, 0.5, 0.5,
2, -3.207741, -6.224086, 1, -0.5, 0.5, 0.5,
2, -3.207741, -6.224086, 1, 1.5, 0.5, 0.5,
2, -3.207741, -6.224086, 0, 1.5, 0.5, 0.5,
3, -3.207741, -6.224086, 0, -0.5, 0.5, 0.5,
3, -3.207741, -6.224086, 1, -0.5, 0.5, 0.5,
3, -3.207741, -6.224086, 1, 1.5, 0.5, 0.5,
3, -3.207741, -6.224086, 0, 1.5, 0.5, 0.5
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
-3.219042, -2, -5.404361,
-3.219042, 2, -5.404361,
-3.219042, -2, -5.404361,
-3.398567, -2, -5.677603,
-3.219042, -1, -5.404361,
-3.398567, -1, -5.677603,
-3.219042, 0, -5.404361,
-3.398567, 0, -5.677603,
-3.219042, 1, -5.404361,
-3.398567, 1, -5.677603,
-3.219042, 2, -5.404361,
-3.398567, 2, -5.677603
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
-3.757617, -2, -6.224086, 0, -0.5, 0.5, 0.5,
-3.757617, -2, -6.224086, 1, -0.5, 0.5, 0.5,
-3.757617, -2, -6.224086, 1, 1.5, 0.5, 0.5,
-3.757617, -2, -6.224086, 0, 1.5, 0.5, 0.5,
-3.757617, -1, -6.224086, 0, -0.5, 0.5, 0.5,
-3.757617, -1, -6.224086, 1, -0.5, 0.5, 0.5,
-3.757617, -1, -6.224086, 1, 1.5, 0.5, 0.5,
-3.757617, -1, -6.224086, 0, 1.5, 0.5, 0.5,
-3.757617, 0, -6.224086, 0, -0.5, 0.5, 0.5,
-3.757617, 0, -6.224086, 1, -0.5, 0.5, 0.5,
-3.757617, 0, -6.224086, 1, 1.5, 0.5, 0.5,
-3.757617, 0, -6.224086, 0, 1.5, 0.5, 0.5,
-3.757617, 1, -6.224086, 0, -0.5, 0.5, 0.5,
-3.757617, 1, -6.224086, 1, -0.5, 0.5, 0.5,
-3.757617, 1, -6.224086, 1, 1.5, 0.5, 0.5,
-3.757617, 1, -6.224086, 0, 1.5, 0.5, 0.5,
-3.757617, 2, -6.224086, 0, -0.5, 0.5, 0.5,
-3.757617, 2, -6.224086, 1, -0.5, 0.5, 0.5,
-3.757617, 2, -6.224086, 1, 1.5, 0.5, 0.5,
-3.757617, 2, -6.224086, 0, 1.5, 0.5, 0.5
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
-3.219042, -2.770347, -4,
-3.219042, -2.770347, 4,
-3.219042, -2.770347, -4,
-3.398567, -2.916145, -4,
-3.219042, -2.770347, -2,
-3.398567, -2.916145, -2,
-3.219042, -2.770347, 0,
-3.398567, -2.916145, 0,
-3.219042, -2.770347, 2,
-3.398567, -2.916145, 2,
-3.219042, -2.770347, 4,
-3.398567, -2.916145, 4
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
-3.757617, -3.207741, -4, 0, -0.5, 0.5, 0.5,
-3.757617, -3.207741, -4, 1, -0.5, 0.5, 0.5,
-3.757617, -3.207741, -4, 1, 1.5, 0.5, 0.5,
-3.757617, -3.207741, -4, 0, 1.5, 0.5, 0.5,
-3.757617, -3.207741, -2, 0, -0.5, 0.5, 0.5,
-3.757617, -3.207741, -2, 1, -0.5, 0.5, 0.5,
-3.757617, -3.207741, -2, 1, 1.5, 0.5, 0.5,
-3.757617, -3.207741, -2, 0, 1.5, 0.5, 0.5,
-3.757617, -3.207741, 0, 0, -0.5, 0.5, 0.5,
-3.757617, -3.207741, 0, 1, -0.5, 0.5, 0.5,
-3.757617, -3.207741, 0, 1, 1.5, 0.5, 0.5,
-3.757617, -3.207741, 0, 0, 1.5, 0.5, 0.5,
-3.757617, -3.207741, 2, 0, -0.5, 0.5, 0.5,
-3.757617, -3.207741, 2, 1, -0.5, 0.5, 0.5,
-3.757617, -3.207741, 2, 1, 1.5, 0.5, 0.5,
-3.757617, -3.207741, 2, 0, 1.5, 0.5, 0.5,
-3.757617, -3.207741, 4, 0, -0.5, 0.5, 0.5,
-3.757617, -3.207741, 4, 1, -0.5, 0.5, 0.5,
-3.757617, -3.207741, 4, 1, 1.5, 0.5, 0.5,
-3.757617, -3.207741, 4, 0, 1.5, 0.5, 0.5
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
-3.219042, -2.770347, -5.404361,
-3.219042, 3.061561, -5.404361,
-3.219042, -2.770347, 5.525301,
-3.219042, 3.061561, 5.525301,
-3.219042, -2.770347, -5.404361,
-3.219042, -2.770347, 5.525301,
-3.219042, 3.061561, -5.404361,
-3.219042, 3.061561, 5.525301,
-3.219042, -2.770347, -5.404361,
3.961955, -2.770347, -5.404361,
-3.219042, -2.770347, 5.525301,
3.961955, -2.770347, 5.525301,
-3.219042, 3.061561, -5.404361,
3.961955, 3.061561, -5.404361,
-3.219042, 3.061561, 5.525301,
3.961955, 3.061561, 5.525301,
3.961955, -2.770347, -5.404361,
3.961955, 3.061561, -5.404361,
3.961955, -2.770347, 5.525301,
3.961955, 3.061561, 5.525301,
3.961955, -2.770347, -5.404361,
3.961955, -2.770347, 5.525301,
3.961955, 3.061561, -5.404361,
3.961955, 3.061561, 5.525301
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
var radius = 7.646098;
var distance = 34.01835;
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
mvMatrix.translate( -0.3714565, -0.1456068, -0.06046987 );
mvMatrix.scale( 1.151248, 1.417565, 0.7563922 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.01835);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
permite<-read.table("permite.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-permite$V2
```

```
## Error in eval(expr, envir, enclos): object 'permite' not found
```

```r
y<-permite$V3
```

```
## Error in eval(expr, envir, enclos): object 'permite' not found
```

```r
z<-permite$V4
```

```
## Error in eval(expr, envir, enclos): object 'permite' not found
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
-3.114464, 1.107164, -1.240083, 0, 0, 1, 1, 1,
-2.928298, 1.634109, -0.5020293, 1, 0, 0, 1, 1,
-2.799659, 0.8657386, -3.485857, 1, 0, 0, 1, 1,
-2.776805, -0.867977, 0.04309452, 1, 0, 0, 1, 1,
-2.672978, -0.5484985, -1.413072, 1, 0, 0, 1, 1,
-2.662143, 0.1439238, -2.724392, 1, 0, 0, 1, 1,
-2.633762, 0.2755046, -2.941581, 0, 0, 0, 1, 1,
-2.627735, -0.1865496, -1.742777, 0, 0, 0, 1, 1,
-2.588002, -0.6169006, -2.197365, 0, 0, 0, 1, 1,
-2.507897, -0.294511, -1.203973, 0, 0, 0, 1, 1,
-2.488597, 0.7361937, -1.449883, 0, 0, 0, 1, 1,
-2.425812, -0.01025466, -3.100034, 0, 0, 0, 1, 1,
-2.424115, 1.096435, -2.203367, 0, 0, 0, 1, 1,
-2.288573, 1.308586, -0.7635989, 1, 1, 1, 1, 1,
-2.241724, 0.07448835, -0.1443499, 1, 1, 1, 1, 1,
-2.164175, 0.2387578, -0.5484728, 1, 1, 1, 1, 1,
-2.14061, 0.8939613, -0.9049284, 1, 1, 1, 1, 1,
-2.126012, 1.255407, -0.9771624, 1, 1, 1, 1, 1,
-2.113094, -0.7221247, -2.08647, 1, 1, 1, 1, 1,
-2.106667, 0.1936399, -0.1854812, 1, 1, 1, 1, 1,
-2.102239, -1.471197, -0.0504986, 1, 1, 1, 1, 1,
-2.082104, -0.6094338, -1.640859, 1, 1, 1, 1, 1,
-2.032006, 0.651465, -1.512099, 1, 1, 1, 1, 1,
-2.030266, -1.021281, -3.514114, 1, 1, 1, 1, 1,
-2.026825, -0.5167423, -0.744206, 1, 1, 1, 1, 1,
-2.015885, 1.489346, 1.520449, 1, 1, 1, 1, 1,
-1.994289, -1.712565, -3.627831, 1, 1, 1, 1, 1,
-1.983795, 1.928741, -2.051849, 1, 1, 1, 1, 1,
-1.961047, -1.450123, -0.07794639, 0, 0, 1, 1, 1,
-1.899096, 1.413573, -0.2267192, 1, 0, 0, 1, 1,
-1.864849, -0.08546282, -0.4517532, 1, 0, 0, 1, 1,
-1.85069, 0.4853337, -2.786309, 1, 0, 0, 1, 1,
-1.848272, 0.357001, -3.56165, 1, 0, 0, 1, 1,
-1.828262, 0.2669257, -2.680883, 1, 0, 0, 1, 1,
-1.808798, -0.168383, 1.162298, 0, 0, 0, 1, 1,
-1.807281, 0.7871551, -1.409497, 0, 0, 0, 1, 1,
-1.789186, -0.4687134, -1.278108, 0, 0, 0, 1, 1,
-1.764936, 1.797019, -1.839813, 0, 0, 0, 1, 1,
-1.764095, -0.8218419, -2.205901, 0, 0, 0, 1, 1,
-1.755389, -0.4428571, -2.127954, 0, 0, 0, 1, 1,
-1.753646, 0.2535303, -1.513143, 0, 0, 0, 1, 1,
-1.733289, 0.1622826, -0.7708184, 1, 1, 1, 1, 1,
-1.728586, -0.7002832, -2.660245, 1, 1, 1, 1, 1,
-1.710997, -1.090898, -2.842329, 1, 1, 1, 1, 1,
-1.69627, 0.4125492, -1.735502, 1, 1, 1, 1, 1,
-1.685228, 0.5962583, -0.9033527, 1, 1, 1, 1, 1,
-1.668596, 0.7313668, -0.9397948, 1, 1, 1, 1, 1,
-1.661826, 0.330491, -1.290693, 1, 1, 1, 1, 1,
-1.660545, -0.8532394, -2.634815, 1, 1, 1, 1, 1,
-1.651071, -0.8344187, -2.721484, 1, 1, 1, 1, 1,
-1.644, 0.7074542, -0.7123173, 1, 1, 1, 1, 1,
-1.623991, -1.939976, -1.625645, 1, 1, 1, 1, 1,
-1.617502, -0.8268687, -0.7966843, 1, 1, 1, 1, 1,
-1.614614, 1.166824, -1.364387, 1, 1, 1, 1, 1,
-1.612876, 0.8800032, -1.474582, 1, 1, 1, 1, 1,
-1.611772, 0.1356548, -2.478304, 1, 1, 1, 1, 1,
-1.608726, 0.5329797, -0.2295542, 0, 0, 1, 1, 1,
-1.593111, 0.7485473, -1.125294, 1, 0, 0, 1, 1,
-1.570657, -0.3194738, -2.147788, 1, 0, 0, 1, 1,
-1.56643, 0.5133163, -2.408455, 1, 0, 0, 1, 1,
-1.557454, 0.1433346, -1.565212, 1, 0, 0, 1, 1,
-1.556525, -0.08619841, -2.047414, 1, 0, 0, 1, 1,
-1.553778, 0.6898976, -1.430436, 0, 0, 0, 1, 1,
-1.550473, -0.02910912, -1.418633, 0, 0, 0, 1, 1,
-1.5503, -1.527664, -1.539479, 0, 0, 0, 1, 1,
-1.546612, -0.06079912, -1.157278, 0, 0, 0, 1, 1,
-1.530681, 0.8720136, 2.061644, 0, 0, 0, 1, 1,
-1.530087, 1.361499, -0.3029832, 0, 0, 0, 1, 1,
-1.526929, 0.01064165, -2.319924, 0, 0, 0, 1, 1,
-1.526437, -1.045939, -2.812816, 1, 1, 1, 1, 1,
-1.51861, 0.3005582, -0.9363838, 1, 1, 1, 1, 1,
-1.501755, 0.7064732, -1.573476, 1, 1, 1, 1, 1,
-1.499016, 1.704502, -1.717182, 1, 1, 1, 1, 1,
-1.488828, 0.02181176, -0.911841, 1, 1, 1, 1, 1,
-1.477474, 0.4668339, -2.680101, 1, 1, 1, 1, 1,
-1.466262, 0.4098565, -0.682487, 1, 1, 1, 1, 1,
-1.4615, 1.296735, -0.0007812759, 1, 1, 1, 1, 1,
-1.45078, 0.6078626, 0.5080597, 1, 1, 1, 1, 1,
-1.449244, -0.783914, -4.293471, 1, 1, 1, 1, 1,
-1.445726, 0.7913612, -2.05733, 1, 1, 1, 1, 1,
-1.437221, 0.4031663, -2.607111, 1, 1, 1, 1, 1,
-1.436501, -0.5823849, -2.985109, 1, 1, 1, 1, 1,
-1.430911, -0.2781233, -0.9749604, 1, 1, 1, 1, 1,
-1.418419, 0.1537202, -1.170737, 1, 1, 1, 1, 1,
-1.41233, 0.01376253, -1.232449, 0, 0, 1, 1, 1,
-1.401753, 1.006083, 1.201083, 1, 0, 0, 1, 1,
-1.396694, -1.214798, -1.282133, 1, 0, 0, 1, 1,
-1.392699, -0.9418304, -2.54719, 1, 0, 0, 1, 1,
-1.383535, -1.580518, -2.822064, 1, 0, 0, 1, 1,
-1.382486, 0.8581015, 0.1715481, 1, 0, 0, 1, 1,
-1.382269, 1.020767, -0.1942194, 0, 0, 0, 1, 1,
-1.37258, 1.886505, -0.1802136, 0, 0, 0, 1, 1,
-1.372212, -1.274468, -0.5405108, 0, 0, 0, 1, 1,
-1.361835, -0.2685913, 0.7084556, 0, 0, 0, 1, 1,
-1.359006, 0.5369244, 0.3786549, 0, 0, 0, 1, 1,
-1.346369, -0.1201248, -2.236701, 0, 0, 0, 1, 1,
-1.335449, -1.053299, -3.424471, 0, 0, 0, 1, 1,
-1.328536, 1.940908, -2.7565, 1, 1, 1, 1, 1,
-1.328261, -1.797387, -2.991738, 1, 1, 1, 1, 1,
-1.32642, -1.806558, -1.302316, 1, 1, 1, 1, 1,
-1.325732, -0.3514152, -0.5007429, 1, 1, 1, 1, 1,
-1.322582, 1.150107, -1.023203, 1, 1, 1, 1, 1,
-1.292529, 0.03069381, -3.229876, 1, 1, 1, 1, 1,
-1.286356, 2.476918, 1.711459, 1, 1, 1, 1, 1,
-1.273399, -0.5718436, -1.368543, 1, 1, 1, 1, 1,
-1.270274, 1.437771, -0.8682046, 1, 1, 1, 1, 1,
-1.257749, -0.2134174, -2.780524, 1, 1, 1, 1, 1,
-1.254596, -0.04415458, -0.1967992, 1, 1, 1, 1, 1,
-1.250606, 1.263685, -0.1225712, 1, 1, 1, 1, 1,
-1.233737, -0.8791741, -1.564048, 1, 1, 1, 1, 1,
-1.231392, 0.1394735, -2.962447, 1, 1, 1, 1, 1,
-1.224317, -0.9389047, -2.070767, 1, 1, 1, 1, 1,
-1.198078, -1.373292, -1.65027, 0, 0, 1, 1, 1,
-1.188196, 0.6694406, -0.5408567, 1, 0, 0, 1, 1,
-1.187155, 0.9090111, -0.6900327, 1, 0, 0, 1, 1,
-1.184301, 1.02134, -0.3771416, 1, 0, 0, 1, 1,
-1.182697, -0.3770916, -0.8061842, 1, 0, 0, 1, 1,
-1.181122, -1.012828, -3.433984, 1, 0, 0, 1, 1,
-1.174288, -0.3636892, -3.013247, 0, 0, 0, 1, 1,
-1.172205, -0.5445109, -1.971563, 0, 0, 0, 1, 1,
-1.166945, 1.976429, -2.663567, 0, 0, 0, 1, 1,
-1.150347, 1.045061, -0.5588571, 0, 0, 0, 1, 1,
-1.14202, 1.188596, 0.4340721, 0, 0, 0, 1, 1,
-1.133514, -0.2279238, -2.773407, 0, 0, 0, 1, 1,
-1.13069, -1.11832, -1.994557, 0, 0, 0, 1, 1,
-1.125077, 0.5202683, 0.3738984, 1, 1, 1, 1, 1,
-1.118471, 0.09133695, -2.178116, 1, 1, 1, 1, 1,
-1.115005, 1.638243, -0.5562085, 1, 1, 1, 1, 1,
-1.113527, -0.4071345, -4.827726, 1, 1, 1, 1, 1,
-1.108763, -0.3859628, -1.581931, 1, 1, 1, 1, 1,
-1.105135, -0.3220607, -1.642868, 1, 1, 1, 1, 1,
-1.102591, 0.8031475, -2.329486, 1, 1, 1, 1, 1,
-1.101033, -1.332527, -3.018368, 1, 1, 1, 1, 1,
-1.096607, -0.701555, -1.966507, 1, 1, 1, 1, 1,
-1.091162, -0.2066486, -0.0529481, 1, 1, 1, 1, 1,
-1.089261, -0.9175565, -3.163551, 1, 1, 1, 1, 1,
-1.084952, 0.1350443, -2.06833, 1, 1, 1, 1, 1,
-1.078773, 0.04730918, 0.0769903, 1, 1, 1, 1, 1,
-1.073773, 0.05374893, -2.757053, 1, 1, 1, 1, 1,
-1.073264, -0.5859915, -1.415266, 1, 1, 1, 1, 1,
-1.059106, -1.033177, -1.22153, 0, 0, 1, 1, 1,
-1.057118, 0.5985017, -1.977315, 1, 0, 0, 1, 1,
-1.051829, 0.6696281, -1.190309, 1, 0, 0, 1, 1,
-1.051763, -0.3287122, 0.8309749, 1, 0, 0, 1, 1,
-1.026321, 1.600587, -1.096743, 1, 0, 0, 1, 1,
-1.026012, -1.358885, -2.182586, 1, 0, 0, 1, 1,
-1.025327, -2.029148, -2.520124, 0, 0, 0, 1, 1,
-1.021007, -1.909125, -2.462085, 0, 0, 0, 1, 1,
-1.016755, 1.585935, -0.8917091, 0, 0, 0, 1, 1,
-0.9992, -0.3499645, -1.649475, 0, 0, 0, 1, 1,
-0.9931886, -0.2919219, -1.242253, 0, 0, 0, 1, 1,
-0.9852285, -0.2820278, -4.030808, 0, 0, 0, 1, 1,
-0.9845456, -0.1896349, -0.8383263, 0, 0, 0, 1, 1,
-0.9839818, -0.6283284, -3.658987, 1, 1, 1, 1, 1,
-0.9831185, 1.017519, -0.8146003, 1, 1, 1, 1, 1,
-0.9824365, -0.1089321, -1.122931, 1, 1, 1, 1, 1,
-0.9823228, -1.745093, -1.631808, 1, 1, 1, 1, 1,
-0.9732584, 1.34699, -0.2709318, 1, 1, 1, 1, 1,
-0.9653462, -1.026322, -2.801759, 1, 1, 1, 1, 1,
-0.9649274, 1.048447, -0.04753102, 1, 1, 1, 1, 1,
-0.9644356, 0.3342577, -0.1381587, 1, 1, 1, 1, 1,
-0.9557065, 1.890723, -2.474517, 1, 1, 1, 1, 1,
-0.9517533, 0.6123651, 0.2738041, 1, 1, 1, 1, 1,
-0.9500421, -0.9585274, -3.546624, 1, 1, 1, 1, 1,
-0.9485057, 1.114244, 0.2456679, 1, 1, 1, 1, 1,
-0.9451476, -0.3486062, -1.79513, 1, 1, 1, 1, 1,
-0.9432432, -0.2286707, -1.745843, 1, 1, 1, 1, 1,
-0.9417651, -0.3166369, -1.990365, 1, 1, 1, 1, 1,
-0.9355528, 0.1818393, -0.8445746, 0, 0, 1, 1, 1,
-0.9285175, -1.179801, -1.940909, 1, 0, 0, 1, 1,
-0.9268824, -1.221582, -2.658165, 1, 0, 0, 1, 1,
-0.9221708, 1.183822, -1.405208, 1, 0, 0, 1, 1,
-0.9154438, -2.650305, -4.047987, 1, 0, 0, 1, 1,
-0.9014715, -0.6548867, -0.9327728, 1, 0, 0, 1, 1,
-0.8965638, -0.1609526, -0.8676742, 0, 0, 0, 1, 1,
-0.8963158, 1.015142, -1.492192, 0, 0, 0, 1, 1,
-0.8913154, -0.5587661, -3.309274, 0, 0, 0, 1, 1,
-0.8886223, 0.1280423, -0.9141806, 0, 0, 0, 1, 1,
-0.886126, -0.7189537, -1.303341, 0, 0, 0, 1, 1,
-0.8858442, -0.5334514, -1.366153, 0, 0, 0, 1, 1,
-0.8739924, 0.415231, -1.460713, 0, 0, 0, 1, 1,
-0.872474, -0.01810016, -1.847769, 1, 1, 1, 1, 1,
-0.8692928, 0.1780933, -2.374382, 1, 1, 1, 1, 1,
-0.8555012, 0.2878217, -1.047642, 1, 1, 1, 1, 1,
-0.8543019, -1.162053, -2.836003, 1, 1, 1, 1, 1,
-0.8521276, -0.04511699, -1.88396, 1, 1, 1, 1, 1,
-0.851817, 0.5943549, 0.1143843, 1, 1, 1, 1, 1,
-0.8439578, -0.03520613, -2.097296, 1, 1, 1, 1, 1,
-0.8415752, 0.04537571, -0.579796, 1, 1, 1, 1, 1,
-0.8360249, -2.141549, -4.182983, 1, 1, 1, 1, 1,
-0.8340282, -1.710633, -3.88049, 1, 1, 1, 1, 1,
-0.8331691, 0.4812255, -1.544448, 1, 1, 1, 1, 1,
-0.824989, 0.118806, -2.816843, 1, 1, 1, 1, 1,
-0.8249699, 0.0881457, -1.841056, 1, 1, 1, 1, 1,
-0.8233323, 0.08460923, -1.636848, 1, 1, 1, 1, 1,
-0.8227156, -1.215667, -1.473974, 1, 1, 1, 1, 1,
-0.8151015, 1.132998, -0.2423024, 0, 0, 1, 1, 1,
-0.8137891, 0.0798112, -1.094492, 1, 0, 0, 1, 1,
-0.8121518, -0.1238409, -1.408659, 1, 0, 0, 1, 1,
-0.7976344, -0.8203572, -2.503919, 1, 0, 0, 1, 1,
-0.7910192, 0.2340564, -2.668321, 1, 0, 0, 1, 1,
-0.7908016, 1.79983, 0.6028786, 1, 0, 0, 1, 1,
-0.7835221, 1.149506, -1.609017, 0, 0, 0, 1, 1,
-0.7827286, 1.19733, -0.6738825, 0, 0, 0, 1, 1,
-0.7741387, -1.125724, -1.184344, 0, 0, 0, 1, 1,
-0.7668545, -0.4659505, -1.853438, 0, 0, 0, 1, 1,
-0.7612298, 0.08374247, -0.7717898, 0, 0, 0, 1, 1,
-0.7511173, -0.2280155, -2.079433, 0, 0, 0, 1, 1,
-0.749999, 0.7828463, -1.373466, 0, 0, 0, 1, 1,
-0.7439754, 0.3731682, 0.05209452, 1, 1, 1, 1, 1,
-0.7435337, 0.536822, -0.2266714, 1, 1, 1, 1, 1,
-0.7423849, -1.040616, -1.671825, 1, 1, 1, 1, 1,
-0.7400398, -1.260858, -2.86995, 1, 1, 1, 1, 1,
-0.7391176, 0.5129901, -0.9923254, 1, 1, 1, 1, 1,
-0.7386405, 0.7102108, -0.7490796, 1, 1, 1, 1, 1,
-0.7360237, -1.214909, -1.531023, 1, 1, 1, 1, 1,
-0.7315355, 0.1328426, -2.486704, 1, 1, 1, 1, 1,
-0.7314218, -1.094805, -1.505805, 1, 1, 1, 1, 1,
-0.7290389, 1.714854, 1.198964, 1, 1, 1, 1, 1,
-0.7287496, 0.2539627, -2.291106, 1, 1, 1, 1, 1,
-0.7280819, 0.08554185, -1.196727, 1, 1, 1, 1, 1,
-0.7276406, 0.5965393, -0.4105003, 1, 1, 1, 1, 1,
-0.7196068, 1.376329, 0.9235974, 1, 1, 1, 1, 1,
-0.7178397, 0.7569247, -0.2295219, 1, 1, 1, 1, 1,
-0.711496, 0.5562575, -0.997082, 0, 0, 1, 1, 1,
-0.7073519, 0.8104826, -1.075769, 1, 0, 0, 1, 1,
-0.6985161, -0.253085, -3.313118, 1, 0, 0, 1, 1,
-0.6964297, 0.3758582, -1.568153, 1, 0, 0, 1, 1,
-0.6803029, 0.4918515, -0.9812458, 1, 0, 0, 1, 1,
-0.6774145, 1.452801, -0.2878589, 1, 0, 0, 1, 1,
-0.6755238, 2.052744, 0.448164, 0, 0, 0, 1, 1,
-0.6660332, 1.784063, -1.560318, 0, 0, 0, 1, 1,
-0.6604505, 0.8567371, -1.17033, 0, 0, 0, 1, 1,
-0.65999, 0.2435081, -1.575689, 0, 0, 0, 1, 1,
-0.6497712, 0.06650326, -0.1162467, 0, 0, 0, 1, 1,
-0.6450642, 1.358344, -1.227576, 0, 0, 0, 1, 1,
-0.6388476, -0.7350645, -2.567149, 0, 0, 0, 1, 1,
-0.6363375, 0.9765412, -1.121252, 1, 1, 1, 1, 1,
-0.6359299, 0.3599269, 0.7752622, 1, 1, 1, 1, 1,
-0.6355042, -0.7935572, -1.573039, 1, 1, 1, 1, 1,
-0.6350703, -1.036224, -2.797563, 1, 1, 1, 1, 1,
-0.6348442, 1.026354, -0.41803, 1, 1, 1, 1, 1,
-0.634684, -0.5148897, -0.4693051, 1, 1, 1, 1, 1,
-0.6325929, 0.5845768, -0.9782471, 1, 1, 1, 1, 1,
-0.6306347, -0.5129706, -2.975642, 1, 1, 1, 1, 1,
-0.6300513, 1.331956, -1.0098, 1, 1, 1, 1, 1,
-0.6249771, 0.1343306, -1.619397, 1, 1, 1, 1, 1,
-0.6231117, -0.05301334, -1.794413, 1, 1, 1, 1, 1,
-0.621373, 1.016189, 0.1968704, 1, 1, 1, 1, 1,
-0.6188197, 1.006126, -0.5000653, 1, 1, 1, 1, 1,
-0.6187963, 0.1723939, -1.087028, 1, 1, 1, 1, 1,
-0.6085854, -0.03978518, -1.496982, 1, 1, 1, 1, 1,
-0.6043857, 0.8417684, -1.781496, 0, 0, 1, 1, 1,
-0.60164, 0.250186, -0.7382444, 1, 0, 0, 1, 1,
-0.5989899, -2.211908, -1.912128, 1, 0, 0, 1, 1,
-0.5956818, -0.5764018, -4.128358, 1, 0, 0, 1, 1,
-0.5940849, 0.0240644, -0.7873462, 1, 0, 0, 1, 1,
-0.5868832, 1.703299, -1.130552, 1, 0, 0, 1, 1,
-0.5863337, 1.56376, 0.3612684, 0, 0, 0, 1, 1,
-0.5857081, 1.797429, -1.671635, 0, 0, 0, 1, 1,
-0.5852872, -1.010414, -3.98513, 0, 0, 0, 1, 1,
-0.582504, -0.8994116, -2.221339, 0, 0, 0, 1, 1,
-0.5809951, -0.5915861, -1.481317, 0, 0, 0, 1, 1,
-0.5794327, 0.8506362, -1.101732, 0, 0, 0, 1, 1,
-0.5790772, -0.4104976, -2.312529, 0, 0, 0, 1, 1,
-0.5776919, -0.5232607, -3.565455, 1, 1, 1, 1, 1,
-0.5683319, 0.348414, 0.07155453, 1, 1, 1, 1, 1,
-0.5675198, -1.28682, -2.075512, 1, 1, 1, 1, 1,
-0.5667052, 1.088427, -0.9364774, 1, 1, 1, 1, 1,
-0.5624207, -0.9517654, -2.418302, 1, 1, 1, 1, 1,
-0.5614563, -0.1918416, -1.110421, 1, 1, 1, 1, 1,
-0.5526332, -2.685417, -1.130184, 1, 1, 1, 1, 1,
-0.5488051, 0.9387482, -0.6018182, 1, 1, 1, 1, 1,
-0.5465502, 1.609889, 1.666887, 1, 1, 1, 1, 1,
-0.5462697, 1.778168, -0.5881126, 1, 1, 1, 1, 1,
-0.5420123, 0.5036035, -1.091835, 1, 1, 1, 1, 1,
-0.5408139, -0.3776949, -4.382215, 1, 1, 1, 1, 1,
-0.5363773, 1.049194, -0.5897406, 1, 1, 1, 1, 1,
-0.5361472, -1.230681, -1.647553, 1, 1, 1, 1, 1,
-0.5238634, -0.4915771, -1.494208, 1, 1, 1, 1, 1,
-0.520895, -1.79726, -2.649641, 0, 0, 1, 1, 1,
-0.5169874, -0.1857347, -2.4498, 1, 0, 0, 1, 1,
-0.4989684, -0.1466843, -1.075627, 1, 0, 0, 1, 1,
-0.4946691, 0.7314491, 1.010923, 1, 0, 0, 1, 1,
-0.4934335, -0.05675504, -3.299058, 1, 0, 0, 1, 1,
-0.4926565, 0.3434542, -1.260204, 1, 0, 0, 1, 1,
-0.4913227, -0.4175175, -0.784339, 0, 0, 0, 1, 1,
-0.4815688, 0.03953028, -3.168942, 0, 0, 0, 1, 1,
-0.4769942, 1.826074, -1.191494, 0, 0, 0, 1, 1,
-0.475054, -0.9185107, -3.973673, 0, 0, 0, 1, 1,
-0.4712198, 0.3977175, -1.71488, 0, 0, 0, 1, 1,
-0.4709831, -1.518789, -3.485733, 0, 0, 0, 1, 1,
-0.4674846, 1.060598, -2.691413, 0, 0, 0, 1, 1,
-0.4635007, 1.289583, -0.7543953, 1, 1, 1, 1, 1,
-0.4617978, -1.136517, -5.245192, 1, 1, 1, 1, 1,
-0.4607726, -0.2338458, -2.592306, 1, 1, 1, 1, 1,
-0.4551998, 0.5904803, -1.519357, 1, 1, 1, 1, 1,
-0.4547804, -0.7148019, -1.815094, 1, 1, 1, 1, 1,
-0.454081, 0.6788667, -0.5350315, 1, 1, 1, 1, 1,
-0.4532487, -0.7437123, -3.445321, 1, 1, 1, 1, 1,
-0.4508189, -0.5848439, -3.053631, 1, 1, 1, 1, 1,
-0.4390275, 0.0140907, -1.46214, 1, 1, 1, 1, 1,
-0.4308235, -1.559091, -2.146859, 1, 1, 1, 1, 1,
-0.4304367, 0.01539901, -1.300447, 1, 1, 1, 1, 1,
-0.4251307, -0.008398119, 0.6722478, 1, 1, 1, 1, 1,
-0.4235386, -0.2695993, -3.603227, 1, 1, 1, 1, 1,
-0.4205767, -0.4319336, -0.7236018, 1, 1, 1, 1, 1,
-0.4147088, 0.5836233, -1.242977, 1, 1, 1, 1, 1,
-0.4146661, 1.796794, -0.7538953, 0, 0, 1, 1, 1,
-0.4130465, -0.1948961, -0.8167018, 1, 0, 0, 1, 1,
-0.4119931, 0.5480762, -1.10543, 1, 0, 0, 1, 1,
-0.4084851, 0.07278793, -3.744528, 1, 0, 0, 1, 1,
-0.4072572, -0.5606037, -2.730103, 1, 0, 0, 1, 1,
-0.406473, -0.1574071, -1.326617, 1, 0, 0, 1, 1,
-0.4049552, -1.172924, -3.937454, 0, 0, 0, 1, 1,
-0.3995645, -1.652937, -1.695086, 0, 0, 0, 1, 1,
-0.398734, -1.084893, -2.685074, 0, 0, 0, 1, 1,
-0.3914111, -1.64776, -2.544904, 0, 0, 0, 1, 1,
-0.3908532, 0.3642516, -0.2453744, 0, 0, 0, 1, 1,
-0.3856179, 0.3537429, 0.6424971, 0, 0, 0, 1, 1,
-0.3836689, 0.7359875, 0.6461374, 0, 0, 0, 1, 1,
-0.3819812, 0.4614045, -1.725607, 1, 1, 1, 1, 1,
-0.3755808, -0.9711746, -3.31397, 1, 1, 1, 1, 1,
-0.3754773, -0.2329559, -1.920858, 1, 1, 1, 1, 1,
-0.3752392, -1.330655, -3.348144, 1, 1, 1, 1, 1,
-0.3737782, 0.2879386, -3.472221, 1, 1, 1, 1, 1,
-0.3572356, 0.2815408, -2.299278, 1, 1, 1, 1, 1,
-0.3549863, -1.38052, -0.8436654, 1, 1, 1, 1, 1,
-0.3549188, -0.09003093, -0.7594813, 1, 1, 1, 1, 1,
-0.3540821, -2.183142, -2.181577, 1, 1, 1, 1, 1,
-0.3493115, 1.092687, -0.1154493, 1, 1, 1, 1, 1,
-0.3447721, 1.195494, -0.6934136, 1, 1, 1, 1, 1,
-0.3434604, -0.08578198, -1.378333, 1, 1, 1, 1, 1,
-0.3430111, 1.656167, -0.04826682, 1, 1, 1, 1, 1,
-0.3423849, 0.1345902, -1.876045, 1, 1, 1, 1, 1,
-0.3388007, -0.5258664, -1.73589, 1, 1, 1, 1, 1,
-0.3357805, -1.326815, -1.93797, 0, 0, 1, 1, 1,
-0.335141, -0.1278315, -1.260956, 1, 0, 0, 1, 1,
-0.3340829, -0.1719782, -2.023971, 1, 0, 0, 1, 1,
-0.3338094, -0.1422698, -1.502718, 1, 0, 0, 1, 1,
-0.3327599, -1.028932, -1.560135, 1, 0, 0, 1, 1,
-0.3309252, 1.363379, -0.3046677, 1, 0, 0, 1, 1,
-0.3286427, -1.743878, -2.898557, 0, 0, 0, 1, 1,
-0.3248065, 0.1238558, -1.032651, 0, 0, 0, 1, 1,
-0.3194273, -0.8731404, -3.939415, 0, 0, 0, 1, 1,
-0.315824, -0.8919373, -2.112073, 0, 0, 0, 1, 1,
-0.3135886, 0.2053389, -1.881948, 0, 0, 0, 1, 1,
-0.3127443, 0.9515674, -0.2163367, 0, 0, 0, 1, 1,
-0.3122985, -1.411986, -2.072077, 0, 0, 0, 1, 1,
-0.3115841, -1.413514, -1.971491, 1, 1, 1, 1, 1,
-0.3099447, -0.5040894, -3.874754, 1, 1, 1, 1, 1,
-0.3047604, -1.810891, -3.42201, 1, 1, 1, 1, 1,
-0.3032907, 1.09562, 0.918714, 1, 1, 1, 1, 1,
-0.294917, -0.1490428, 0.05225782, 1, 1, 1, 1, 1,
-0.2946307, -1.859103, -3.382035, 1, 1, 1, 1, 1,
-0.2920494, -2.151459, -2.492486, 1, 1, 1, 1, 1,
-0.2896347, 0.8399581, 0.2593209, 1, 1, 1, 1, 1,
-0.2815059, 0.7088825, 0.6288493, 1, 1, 1, 1, 1,
-0.28126, 1.852694, 1.961972, 1, 1, 1, 1, 1,
-0.278568, -0.05711377, -1.416613, 1, 1, 1, 1, 1,
-0.277905, -0.1608308, -1.70301, 1, 1, 1, 1, 1,
-0.2758804, 2.359263, -1.508734, 1, 1, 1, 1, 1,
-0.2747029, 0.1289545, 0.5328024, 1, 1, 1, 1, 1,
-0.2716427, 0.171795, -1.109052, 1, 1, 1, 1, 1,
-0.2705083, 1.549899, 0.1319228, 0, 0, 1, 1, 1,
-0.2677202, 1.098634, -0.15466, 1, 0, 0, 1, 1,
-0.2670771, -1.679747, -1.722774, 1, 0, 0, 1, 1,
-0.2658154, 0.2792415, -1.164912, 1, 0, 0, 1, 1,
-0.2641826, 0.4694704, -0.4944953, 1, 0, 0, 1, 1,
-0.2628247, 0.5366203, -0.9931594, 1, 0, 0, 1, 1,
-0.2619745, -0.9678214, -4.868649, 0, 0, 0, 1, 1,
-0.2488382, -0.0311997, -1.335708, 0, 0, 0, 1, 1,
-0.2448125, -1.151694, -4.143035, 0, 0, 0, 1, 1,
-0.2436023, 0.4861389, -2.873899, 0, 0, 0, 1, 1,
-0.2360951, 2.323338, -0.5739097, 0, 0, 0, 1, 1,
-0.2345242, 0.5402762, -1.035592, 0, 0, 0, 1, 1,
-0.2336291, 2.17979, -0.02727402, 0, 0, 0, 1, 1,
-0.2335511, -0.1351042, -1.11999, 1, 1, 1, 1, 1,
-0.2331771, 1.093635, 1.544713, 1, 1, 1, 1, 1,
-0.2324017, -0.4791099, -3.951868, 1, 1, 1, 1, 1,
-0.2275227, -0.7688692, -2.936003, 1, 1, 1, 1, 1,
-0.2261036, 0.3282888, -0.6672662, 1, 1, 1, 1, 1,
-0.225307, 1.176124, 0.4451897, 1, 1, 1, 1, 1,
-0.2249635, 0.8393776, -1.156218, 1, 1, 1, 1, 1,
-0.2231723, 1.162692, 0.1047146, 1, 1, 1, 1, 1,
-0.2224127, 0.9836901, -2.071254, 1, 1, 1, 1, 1,
-0.2076536, -1.332212, -0.2613668, 1, 1, 1, 1, 1,
-0.2034844, -0.4775507, -2.502178, 1, 1, 1, 1, 1,
-0.2009896, 0.1579575, -2.007499, 1, 1, 1, 1, 1,
-0.1995463, -1.182798, -2.147702, 1, 1, 1, 1, 1,
-0.1989421, 0.4460819, 0.4687856, 1, 1, 1, 1, 1,
-0.1974212, 0.2954746, -0.9061552, 1, 1, 1, 1, 1,
-0.1965302, -0.03647956, -1.971017, 0, 0, 1, 1, 1,
-0.1930941, -0.582647, -2.142952, 1, 0, 0, 1, 1,
-0.191991, -0.893409, -1.958096, 1, 0, 0, 1, 1,
-0.1898879, 1.508198, 0.6243945, 1, 0, 0, 1, 1,
-0.1845984, -0.8926223, -4.376166, 1, 0, 0, 1, 1,
-0.1841654, -0.903921, -3.597213, 1, 0, 0, 1, 1,
-0.1835258, 1.626433, -0.04624338, 0, 0, 0, 1, 1,
-0.1830098, -0.76814, -4.946717, 0, 0, 0, 1, 1,
-0.1761094, 0.3432136, -2.149669, 0, 0, 0, 1, 1,
-0.1755256, -0.5147009, -3.217453, 0, 0, 0, 1, 1,
-0.1605076, 0.05764813, -1.966526, 0, 0, 0, 1, 1,
-0.1597773, -1.563956, -3.375123, 0, 0, 0, 1, 1,
-0.1583941, 0.3022623, -0.4538597, 0, 0, 0, 1, 1,
-0.1568027, -0.1755968, -1.268502, 1, 1, 1, 1, 1,
-0.1566699, 0.8876725, 0.2221587, 1, 1, 1, 1, 1,
-0.1544631, 0.2273116, -1.272864, 1, 1, 1, 1, 1,
-0.1528747, 0.661862, -0.2927803, 1, 1, 1, 1, 1,
-0.1493617, 0.6723849, 0.1798306, 1, 1, 1, 1, 1,
-0.1481737, -1.584963, -3.242871, 1, 1, 1, 1, 1,
-0.1455489, -0.8202962, -4.743395, 1, 1, 1, 1, 1,
-0.1449563, 0.8158726, 0.9746282, 1, 1, 1, 1, 1,
-0.142035, 0.009040483, -0.5334917, 1, 1, 1, 1, 1,
-0.1405233, 1.911141, 0.3537374, 1, 1, 1, 1, 1,
-0.1396792, -1.184671, -3.371666, 1, 1, 1, 1, 1,
-0.1361691, 0.5855272, 0.1092862, 1, 1, 1, 1, 1,
-0.1352781, -0.3074412, -2.357795, 1, 1, 1, 1, 1,
-0.1337933, 0.7809547, 0.5162334, 1, 1, 1, 1, 1,
-0.1334964, -0.2154666, -1.670846, 1, 1, 1, 1, 1,
-0.1334363, 0.3248134, -0.1045397, 0, 0, 1, 1, 1,
-0.1333149, -1.531074, -5.122421, 1, 0, 0, 1, 1,
-0.1268845, 1.391533, 1.167653, 1, 0, 0, 1, 1,
-0.1255223, -0.6440167, -2.763375, 1, 0, 0, 1, 1,
-0.1223821, -0.2072041, -1.713728, 1, 0, 0, 1, 1,
-0.1183638, -0.02925523, 0.3152473, 1, 0, 0, 1, 1,
-0.1180843, -0.2032673, -2.778804, 0, 0, 0, 1, 1,
-0.1153868, 0.02521515, -2.81099, 0, 0, 0, 1, 1,
-0.1130327, -0.6201697, -3.35818, 0, 0, 0, 1, 1,
-0.111763, 0.4855838, 0.3230594, 0, 0, 0, 1, 1,
-0.1106975, 1.141693, 0.2681623, 0, 0, 0, 1, 1,
-0.1066441, 1.979532, -0.6140361, 0, 0, 0, 1, 1,
-0.1064912, -0.2349181, -2.489783, 0, 0, 0, 1, 1,
-0.1049043, -1.4937, -3.027494, 1, 1, 1, 1, 1,
-0.1040091, -1.035566, -3.109423, 1, 1, 1, 1, 1,
-0.1038683, 0.6551794, -1.276063, 1, 1, 1, 1, 1,
-0.1022331, -0.6747786, -1.98956, 1, 1, 1, 1, 1,
-0.1019662, 0.9198348, 2.538332, 1, 1, 1, 1, 1,
-0.09960678, -0.7271047, -3.833869, 1, 1, 1, 1, 1,
-0.09869057, 1.278364, 0.4967461, 1, 1, 1, 1, 1,
-0.09726842, 0.1076287, -2.708239, 1, 1, 1, 1, 1,
-0.09578355, -1.667621, -2.861707, 1, 1, 1, 1, 1,
-0.09215843, -1.6103, -3.346878, 1, 1, 1, 1, 1,
-0.08960313, 0.1580112, -3.621591, 1, 1, 1, 1, 1,
-0.08708289, 1.506358, 1.252211, 1, 1, 1, 1, 1,
-0.08672272, 1.078258, -1.106675, 1, 1, 1, 1, 1,
-0.07944244, -0.04033311, -2.571787, 1, 1, 1, 1, 1,
-0.07780347, 0.7109371, 0.4007149, 1, 1, 1, 1, 1,
-0.07520495, 0.3105819, 1.876152, 0, 0, 1, 1, 1,
-0.0732263, -0.8747061, -3.667898, 1, 0, 0, 1, 1,
-0.07320853, 0.0074224, 0.6207953, 1, 0, 0, 1, 1,
-0.07230877, -0.1942074, -2.137854, 1, 0, 0, 1, 1,
-0.0663332, -0.01008732, -2.449658, 1, 0, 0, 1, 1,
-0.06345771, 0.08105056, -1.854417, 1, 0, 0, 1, 1,
-0.0627674, -0.3003545, -2.473326, 0, 0, 0, 1, 1,
-0.06196799, -1.06958, -1.017525, 0, 0, 0, 1, 1,
-0.06022288, 0.470611, 0.4808806, 0, 0, 0, 1, 1,
-0.0571124, -0.2478121, -2.340901, 0, 0, 0, 1, 1,
-0.04666773, 1.141976, -0.4415056, 0, 0, 0, 1, 1,
-0.03789353, -0.01101832, -1.511024, 0, 0, 0, 1, 1,
-0.03759875, 1.848507, 0.6642156, 0, 0, 0, 1, 1,
-0.03646623, 0.1347417, 0.2171344, 1, 1, 1, 1, 1,
-0.03117795, 0.9041938, 0.03453268, 1, 1, 1, 1, 1,
-0.02531768, 0.3242727, -0.4439414, 1, 1, 1, 1, 1,
-0.02505231, 0.6259532, 0.3627994, 1, 1, 1, 1, 1,
-0.02226108, 1.255032, 0.6502362, 1, 1, 1, 1, 1,
-0.02211653, 0.4879973, 1.254824, 1, 1, 1, 1, 1,
-0.02134527, 0.4852506, 0.205099, 1, 1, 1, 1, 1,
-0.01770338, 0.9868177, 0.1253979, 1, 1, 1, 1, 1,
-0.01693152, -1.217023, -3.718549, 1, 1, 1, 1, 1,
-0.01602932, 0.6599302, -0.4920895, 1, 1, 1, 1, 1,
-0.01552809, -0.5436696, -3.131233, 1, 1, 1, 1, 1,
-0.007628287, 0.7897478, 0.7519038, 1, 1, 1, 1, 1,
-0.007364767, 2.97663, 0.237717, 1, 1, 1, 1, 1,
-0.007120483, -0.790573, -1.675409, 1, 1, 1, 1, 1,
-0.006320433, 0.7788064, -0.7071978, 1, 1, 1, 1, 1,
-0.003495355, -0.5141295, -3.226167, 0, 0, 1, 1, 1,
0.004003957, -1.381204, 1.55361, 1, 0, 0, 1, 1,
0.006502177, -1.02684, 3.028119, 1, 0, 0, 1, 1,
0.0083533, -0.6701197, 2.435405, 1, 0, 0, 1, 1,
0.009313931, -1.570007, 2.987743, 1, 0, 0, 1, 1,
0.009460963, -0.005696131, 1.148469, 1, 0, 0, 1, 1,
0.01150907, -1.810993, 3.113257, 0, 0, 0, 1, 1,
0.01299641, 0.4287435, -1.101377, 0, 0, 0, 1, 1,
0.01374107, -1.360135, 3.360703, 0, 0, 0, 1, 1,
0.01816332, -0.193467, 2.904008, 0, 0, 0, 1, 1,
0.02612014, -0.1145628, 3.522036, 0, 0, 0, 1, 1,
0.02782272, 1.065233, -0.0491077, 0, 0, 0, 1, 1,
0.03298257, 1.399955, -0.5878654, 0, 0, 0, 1, 1,
0.03997558, -1.927483, 4.053721, 1, 1, 1, 1, 1,
0.04727295, 0.9880998, 0.07560329, 1, 1, 1, 1, 1,
0.04793052, 0.3097106, 0.6546896, 1, 1, 1, 1, 1,
0.05005985, 0.3948056, 0.9107436, 1, 1, 1, 1, 1,
0.05317109, 0.4284921, 1.278766, 1, 1, 1, 1, 1,
0.05721286, -0.05464331, 1.866225, 1, 1, 1, 1, 1,
0.0638111, 1.152582, -0.628717, 1, 1, 1, 1, 1,
0.06738459, 0.002004607, 0.3366437, 1, 1, 1, 1, 1,
0.07374956, -0.254565, 3.310091, 1, 1, 1, 1, 1,
0.07734752, -0.394045, 2.796298, 1, 1, 1, 1, 1,
0.07927214, 0.4871137, 1.760463, 1, 1, 1, 1, 1,
0.08609273, -0.1507984, 3.38397, 1, 1, 1, 1, 1,
0.08684669, -1.173747, 0.6039128, 1, 1, 1, 1, 1,
0.08817532, 1.180422, -1.973294, 1, 1, 1, 1, 1,
0.09015516, -0.5023814, 4.30171, 1, 1, 1, 1, 1,
0.09029135, 0.01452887, 0.03804594, 0, 0, 1, 1, 1,
0.09149427, 1.324928, 2.604533, 1, 0, 0, 1, 1,
0.09201314, 0.3845547, -0.2964055, 1, 0, 0, 1, 1,
0.09475285, -0.1353107, 1.420052, 1, 0, 0, 1, 1,
0.09712442, -0.05534774, 1.415565, 1, 0, 0, 1, 1,
0.09943739, 1.741864, -1.002807, 1, 0, 0, 1, 1,
0.1023246, 1.030391, 0.6744894, 0, 0, 0, 1, 1,
0.1023857, -0.7100587, 2.091677, 0, 0, 0, 1, 1,
0.1044679, 0.561722, 1.394383, 0, 0, 0, 1, 1,
0.1071733, 0.1305026, -0.386667, 0, 0, 0, 1, 1,
0.1080801, 0.4342335, -0.5604488, 0, 0, 0, 1, 1,
0.1107929, -0.8368013, 3.254408, 0, 0, 0, 1, 1,
0.1115689, -0.98666, 3.463864, 0, 0, 0, 1, 1,
0.1123278, 1.129513, -0.5325251, 1, 1, 1, 1, 1,
0.1135412, -0.6521451, 3.679887, 1, 1, 1, 1, 1,
0.1150751, 1.695787, 1.703247, 1, 1, 1, 1, 1,
0.1157499, -0.09794276, 4.440366, 1, 1, 1, 1, 1,
0.1164738, -0.5481326, 2.792098, 1, 1, 1, 1, 1,
0.1184479, -2.18528, 2.512215, 1, 1, 1, 1, 1,
0.1241866, 1.348674, -0.7533724, 1, 1, 1, 1, 1,
0.1243794, -1.61732, 1.690197, 1, 1, 1, 1, 1,
0.124719, -0.915312, 4.152714, 1, 1, 1, 1, 1,
0.1301631, -1.196463, 2.394662, 1, 1, 1, 1, 1,
0.1322625, 1.555612, -0.9413812, 1, 1, 1, 1, 1,
0.136012, 0.4623894, 1.750556, 1, 1, 1, 1, 1,
0.1402085, -0.1221694, 0.03710667, 1, 1, 1, 1, 1,
0.1428453, 1.526448, 0.5348979, 1, 1, 1, 1, 1,
0.143408, 1.013221, 0.09377386, 1, 1, 1, 1, 1,
0.1456206, 1.535938, 0.2249485, 0, 0, 1, 1, 1,
0.1499507, -1.517841, 2.612038, 1, 0, 0, 1, 1,
0.1544999, 0.3491542, 1.765472, 1, 0, 0, 1, 1,
0.1566328, -0.1868549, 2.560296, 1, 0, 0, 1, 1,
0.1568584, -0.03999023, 0.8415454, 1, 0, 0, 1, 1,
0.1578985, 1.021099, -0.3566643, 1, 0, 0, 1, 1,
0.1579375, 0.1333228, 1.700593, 0, 0, 0, 1, 1,
0.167306, -0.8735187, 2.361856, 0, 0, 0, 1, 1,
0.1681451, -0.3462125, 1.096074, 0, 0, 0, 1, 1,
0.1683947, -0.2036043, 2.711707, 0, 0, 0, 1, 1,
0.1742435, 1.013, 0.4585385, 0, 0, 0, 1, 1,
0.1750391, -1.011341, 3.033268, 0, 0, 0, 1, 1,
0.1900958, 1.495454, 0.495508, 0, 0, 0, 1, 1,
0.191341, -1.947002, 3.094829, 1, 1, 1, 1, 1,
0.1925388, 1.488232, -2.319173, 1, 1, 1, 1, 1,
0.1943015, 0.738007, 0.7408658, 1, 1, 1, 1, 1,
0.2000412, 0.6025442, -1.054925, 1, 1, 1, 1, 1,
0.2036466, -0.116476, 2.407411, 1, 1, 1, 1, 1,
0.2059479, -1.00475, 5.366131, 1, 1, 1, 1, 1,
0.2064277, -2.083516, 4.032869, 1, 1, 1, 1, 1,
0.2071995, 0.3586785, -0.1080035, 1, 1, 1, 1, 1,
0.2105294, 1.091079, -1.438192, 1, 1, 1, 1, 1,
0.2107786, 0.2251519, 1.086016, 1, 1, 1, 1, 1,
0.2108934, -0.9772779, 2.961595, 1, 1, 1, 1, 1,
0.2154581, 0.1220869, -0.3977591, 1, 1, 1, 1, 1,
0.2159894, 0.430753, -1.216177, 1, 1, 1, 1, 1,
0.2166926, -0.4642326, 2.872572, 1, 1, 1, 1, 1,
0.2173318, 1.092088, 2.429907, 1, 1, 1, 1, 1,
0.2239428, 0.8159349, -0.3134483, 0, 0, 1, 1, 1,
0.2306608, 0.4012139, 0.3476268, 1, 0, 0, 1, 1,
0.2310569, -0.181244, 1.784883, 1, 0, 0, 1, 1,
0.2323451, -0.1701151, 2.450333, 1, 0, 0, 1, 1,
0.2369776, -0.7416727, 1.910241, 1, 0, 0, 1, 1,
0.2396542, -1.329139, 1.919512, 1, 0, 0, 1, 1,
0.2454095, -1.06586, 1.976652, 0, 0, 0, 1, 1,
0.2462043, -0.7397129, 2.953368, 0, 0, 0, 1, 1,
0.2536667, -0.263381, 2.472867, 0, 0, 0, 1, 1,
0.2563181, 0.9172539, 1.213049, 0, 0, 0, 1, 1,
0.2622997, 0.2150987, -0.5560879, 0, 0, 0, 1, 1,
0.2633591, 0.158605, 0.7204472, 0, 0, 0, 1, 1,
0.2637247, 0.4298073, -0.1061896, 0, 0, 0, 1, 1,
0.2642414, -1.586713, 4.244298, 1, 1, 1, 1, 1,
0.2661085, 1.637503, -0.8886809, 1, 1, 1, 1, 1,
0.2689496, -0.1689291, 2.529501, 1, 1, 1, 1, 1,
0.2690704, -2.240237, 3.661695, 1, 1, 1, 1, 1,
0.272092, -0.01369553, 3.626728, 1, 1, 1, 1, 1,
0.2723289, -0.4337914, 3.324905, 1, 1, 1, 1, 1,
0.2748026, 0.2370549, -0.7037274, 1, 1, 1, 1, 1,
0.2797493, 1.597249, 0.5487598, 1, 1, 1, 1, 1,
0.284162, 2.014705, 0.2893201, 1, 1, 1, 1, 1,
0.288364, -0.3052796, 1.056612, 1, 1, 1, 1, 1,
0.2886283, -0.7250293, 1.130475, 1, 1, 1, 1, 1,
0.2904887, 1.193472, 1.066896, 1, 1, 1, 1, 1,
0.2933457, 1.672879, -0.7941868, 1, 1, 1, 1, 1,
0.296863, 0.5336195, -1.13911, 1, 1, 1, 1, 1,
0.2983295, 0.2776738, 1.449656, 1, 1, 1, 1, 1,
0.3071575, -2.108783, 4.150706, 0, 0, 1, 1, 1,
0.3097359, 0.09180345, -0.3303496, 1, 0, 0, 1, 1,
0.3146108, -2.002553, 2.588012, 1, 0, 0, 1, 1,
0.3184074, 0.1987959, 2.236107, 1, 0, 0, 1, 1,
0.3209091, 0.4036731, -0.1975444, 1, 0, 0, 1, 1,
0.321324, -0.4959604, 2.081364, 1, 0, 0, 1, 1,
0.3228159, -1.623184, 3.214237, 0, 0, 0, 1, 1,
0.3282848, -0.6209966, 3.676076, 0, 0, 0, 1, 1,
0.3285576, -0.4426783, 1.012926, 0, 0, 0, 1, 1,
0.329345, 0.6931086, 0.695685, 0, 0, 0, 1, 1,
0.3310731, 1.077691, 0.3923375, 0, 0, 0, 1, 1,
0.3338293, -0.265151, 3.544894, 0, 0, 0, 1, 1,
0.333954, -2.23499, 1.816436, 0, 0, 0, 1, 1,
0.3341982, 0.8505734, -1.618373, 1, 1, 1, 1, 1,
0.3364452, 0.532018, 1.831226, 1, 1, 1, 1, 1,
0.33912, -0.3411854, 0.9659461, 1, 1, 1, 1, 1,
0.3524638, -1.938537, 3.272537, 1, 1, 1, 1, 1,
0.354054, 0.8090921, 1.741258, 1, 1, 1, 1, 1,
0.355065, -1.262753, 3.160996, 1, 1, 1, 1, 1,
0.3564563, 1.009044, -1.584613, 1, 1, 1, 1, 1,
0.3564801, -1.656142, 3.235733, 1, 1, 1, 1, 1,
0.3571501, -0.2586527, 1.20087, 1, 1, 1, 1, 1,
0.3574058, -1.350257, 3.823804, 1, 1, 1, 1, 1,
0.3598038, -0.9918343, 3.343222, 1, 1, 1, 1, 1,
0.3653544, -0.7680017, 2.683517, 1, 1, 1, 1, 1,
0.3671428, 0.5917019, 1.636227, 1, 1, 1, 1, 1,
0.3701309, 1.424423, 1.081079, 1, 1, 1, 1, 1,
0.3768155, -1.953308, 3.197328, 1, 1, 1, 1, 1,
0.3774922, 0.2588619, 0.5855089, 0, 0, 1, 1, 1,
0.3810367, 0.3796736, -0.03362396, 1, 0, 0, 1, 1,
0.3836523, 0.8892689, -0.720245, 1, 0, 0, 1, 1,
0.3839817, -1.90638, 0.5579021, 1, 0, 0, 1, 1,
0.3874624, -0.9632897, 1.616459, 1, 0, 0, 1, 1,
0.395241, -0.6395277, 2.352425, 1, 0, 0, 1, 1,
0.401677, -1.237532, 4.65439, 0, 0, 0, 1, 1,
0.4021651, 0.8834645, 0.09383832, 0, 0, 0, 1, 1,
0.4053346, 0.58252, 1.188435, 0, 0, 0, 1, 1,
0.4056835, 0.1042418, 1.098942, 0, 0, 0, 1, 1,
0.4063698, 0.2531589, 1.256101, 0, 0, 0, 1, 1,
0.4070275, 0.8758304, 1.275311, 0, 0, 0, 1, 1,
0.4093665, 0.7225604, 1.335557, 0, 0, 0, 1, 1,
0.410875, -0.1238702, 3.61597, 1, 1, 1, 1, 1,
0.411092, -0.1870055, 2.414385, 1, 1, 1, 1, 1,
0.41204, 0.565779, 1.169447, 1, 1, 1, 1, 1,
0.4191006, -0.7621658, 0.7892833, 1, 1, 1, 1, 1,
0.4195836, 0.4351912, 0.3613716, 1, 1, 1, 1, 1,
0.4198631, -0.8606406, 4.099894, 1, 1, 1, 1, 1,
0.4324306, 0.2925704, 0.6856145, 1, 1, 1, 1, 1,
0.4337279, 0.4162171, 0.8172057, 1, 1, 1, 1, 1,
0.4337773, -0.8235321, 1.678179, 1, 1, 1, 1, 1,
0.4343009, 0.7500995, 1.252242, 1, 1, 1, 1, 1,
0.4423972, 0.6732382, 0.5212169, 1, 1, 1, 1, 1,
0.4474226, 0.9714329, -1.665037, 1, 1, 1, 1, 1,
0.4477815, -1.600182, 2.705428, 1, 1, 1, 1, 1,
0.448916, 0.9942534, 0.2225954, 1, 1, 1, 1, 1,
0.4494252, 1.321713, 1.643762, 1, 1, 1, 1, 1,
0.4520261, 1.015031, 0.8426294, 0, 0, 1, 1, 1,
0.456009, 0.692352, 2.648367, 1, 0, 0, 1, 1,
0.4625978, 0.4232499, 0.8431711, 1, 0, 0, 1, 1,
0.4663204, 0.4145838, 1.073753, 1, 0, 0, 1, 1,
0.4713403, 1.356865, 2.487644, 1, 0, 0, 1, 1,
0.4736707, 0.5083495, 1.516538, 1, 0, 0, 1, 1,
0.4738944, 1.841194, 0.276264, 0, 0, 0, 1, 1,
0.4740368, -0.9092128, 3.442349, 0, 0, 0, 1, 1,
0.4751706, -0.02500943, -0.0805841, 0, 0, 0, 1, 1,
0.4759029, -0.4446687, 1.870595, 0, 0, 0, 1, 1,
0.4841139, 0.1510072, 2.522763, 0, 0, 0, 1, 1,
0.4841789, 0.4432093, 1.291132, 0, 0, 0, 1, 1,
0.4845736, 0.03685772, 1.19572, 0, 0, 0, 1, 1,
0.4847973, -1.894943, 3.60464, 1, 1, 1, 1, 1,
0.4870429, -0.526215, 3.707361, 1, 1, 1, 1, 1,
0.4906374, 0.3996091, 1.790323, 1, 1, 1, 1, 1,
0.4959561, -0.5376624, 2.359695, 1, 1, 1, 1, 1,
0.496549, -0.7879951, 1.852275, 1, 1, 1, 1, 1,
0.4999224, -1.104298, 2.332309, 1, 1, 1, 1, 1,
0.5010009, 0.3342644, 2.801451, 1, 1, 1, 1, 1,
0.5011011, -0.6100773, 4.861116, 1, 1, 1, 1, 1,
0.507188, 0.6331738, -0.498336, 1, 1, 1, 1, 1,
0.5079858, -0.4452365, 2.413594, 1, 1, 1, 1, 1,
0.5130529, 0.1930625, 1.482647, 1, 1, 1, 1, 1,
0.5144479, -2.213077, 2.915621, 1, 1, 1, 1, 1,
0.515748, 0.1394029, 0.8565302, 1, 1, 1, 1, 1,
0.5196122, 0.7847046, 1.588164, 1, 1, 1, 1, 1,
0.52019, -1.216499, 3.238944, 1, 1, 1, 1, 1,
0.5209591, 0.3489561, 1.280502, 0, 0, 1, 1, 1,
0.5216438, -1.979667, 3.677819, 1, 0, 0, 1, 1,
0.5239236, 0.7687511, -0.2012203, 1, 0, 0, 1, 1,
0.5243814, -0.1753137, 2.625864, 1, 0, 0, 1, 1,
0.5301626, 0.1443254, 0.5340059, 1, 0, 0, 1, 1,
0.533616, -0.5365832, 0.1122145, 1, 0, 0, 1, 1,
0.534649, -0.4811368, 3.164898, 0, 0, 0, 1, 1,
0.5363966, 1.573956, 0.7370905, 0, 0, 0, 1, 1,
0.5365757, 0.3783139, 1.172902, 0, 0, 0, 1, 1,
0.5424308, -1.331326, 3.80577, 0, 0, 0, 1, 1,
0.5472712, 1.473024, 0.8785917, 0, 0, 0, 1, 1,
0.5526812, -0.3541078, 2.738866, 0, 0, 0, 1, 1,
0.5531302, -0.02618778, 1.954643, 0, 0, 0, 1, 1,
0.557544, 0.7301186, 0.7522609, 1, 1, 1, 1, 1,
0.5593234, 0.8254477, 0.3467059, 1, 1, 1, 1, 1,
0.5616106, 2.405874, -0.9069757, 1, 1, 1, 1, 1,
0.5629714, -1.148549, 2.405393, 1, 1, 1, 1, 1,
0.5634567, -0.887481, 1.409763, 1, 1, 1, 1, 1,
0.5638111, -1.372561, 1.526835, 1, 1, 1, 1, 1,
0.5692613, 0.5363669, 0.9594764, 1, 1, 1, 1, 1,
0.5694268, 0.6018352, 0.9662533, 1, 1, 1, 1, 1,
0.5710997, -0.02546629, 2.369277, 1, 1, 1, 1, 1,
0.5753309, -0.4925004, 3.480329, 1, 1, 1, 1, 1,
0.5783624, -0.3731152, 1.300339, 1, 1, 1, 1, 1,
0.579994, -0.5534676, 1.813417, 1, 1, 1, 1, 1,
0.5852118, 2.140678, 0.3221931, 1, 1, 1, 1, 1,
0.5877112, -0.892222, 1.75289, 1, 1, 1, 1, 1,
0.5937572, -0.2395985, 3.478408, 1, 1, 1, 1, 1,
0.5942784, -1.513357, 4.772761, 0, 0, 1, 1, 1,
0.5961662, 0.4954398, 0.9556526, 1, 0, 0, 1, 1,
0.5980265, -1.401604, 1.41449, 1, 0, 0, 1, 1,
0.5983868, -1.635802, 1.226721, 1, 0, 0, 1, 1,
0.6056423, 0.672472, 1.345122, 1, 0, 0, 1, 1,
0.6078236, 0.530925, 1.411269, 1, 0, 0, 1, 1,
0.6098076, -1.987668, 1.773207, 0, 0, 0, 1, 1,
0.6098558, -1.395317, 3.301808, 0, 0, 0, 1, 1,
0.6165239, 0.1453366, 2.676042, 0, 0, 0, 1, 1,
0.6169971, -1.013065, 3.088545, 0, 0, 0, 1, 1,
0.6192681, -1.012475, 1.936493, 0, 0, 0, 1, 1,
0.6210086, -0.7192659, 2.623828, 0, 0, 0, 1, 1,
0.625834, -0.3855423, 3.014226, 0, 0, 0, 1, 1,
0.6295361, 0.4614651, 0.6956884, 1, 1, 1, 1, 1,
0.6320716, 0.5298541, 0.696101, 1, 1, 1, 1, 1,
0.6391143, -1.262672, 3.540366, 1, 1, 1, 1, 1,
0.649981, -1.401316, 4.717581, 1, 1, 1, 1, 1,
0.6512858, 0.3596477, 0.5211136, 1, 1, 1, 1, 1,
0.655496, 0.8109819, 1.350217, 1, 1, 1, 1, 1,
0.6564854, -1.120209, 1.508135, 1, 1, 1, 1, 1,
0.6567026, -1.096205, 3.798919, 1, 1, 1, 1, 1,
0.6581377, 0.1903258, 3.071856, 1, 1, 1, 1, 1,
0.6608785, -0.3179319, 2.754585, 1, 1, 1, 1, 1,
0.6665463, -1.078121, 3.189432, 1, 1, 1, 1, 1,
0.6692169, -0.7636795, 2.378126, 1, 1, 1, 1, 1,
0.6712115, -1.455702, 0.3909295, 1, 1, 1, 1, 1,
0.6740162, 0.8919918, -0.5372689, 1, 1, 1, 1, 1,
0.6778945, -2.080779, 1.788051, 1, 1, 1, 1, 1,
0.6792066, -0.7280967, 4.128305, 0, 0, 1, 1, 1,
0.6897885, -1.503219, 1.139646, 1, 0, 0, 1, 1,
0.6899445, 0.7830279, 2.695017, 1, 0, 0, 1, 1,
0.6932724, 0.03823692, 0.7127188, 1, 0, 0, 1, 1,
0.6942381, -0.245565, 0.8978569, 1, 0, 0, 1, 1,
0.6975127, -0.1696423, 1.823055, 1, 0, 0, 1, 1,
0.6975402, -0.979883, 2.239204, 0, 0, 0, 1, 1,
0.6984688, 0.2221359, 1.958691, 0, 0, 0, 1, 1,
0.6997972, 1.465883, 0.8629489, 0, 0, 0, 1, 1,
0.7037569, 0.753695, -0.2917959, 0, 0, 0, 1, 1,
0.7071081, -0.3336855, 3.321805, 0, 0, 0, 1, 1,
0.7074249, 0.4007818, -0.6263574, 0, 0, 0, 1, 1,
0.7106752, -0.8218032, 3.753088, 0, 0, 0, 1, 1,
0.7269625, -0.3553713, 2.713252, 1, 1, 1, 1, 1,
0.7437328, 0.9550815, -0.894139, 1, 1, 1, 1, 1,
0.7459696, -0.6206086, 2.192945, 1, 1, 1, 1, 1,
0.7480568, 0.5047617, -0.2074011, 1, 1, 1, 1, 1,
0.7485251, -0.518039, 0.6877899, 1, 1, 1, 1, 1,
0.7498596, -0.5017815, 3.032554, 1, 1, 1, 1, 1,
0.750082, -0.8607517, 2.064024, 1, 1, 1, 1, 1,
0.7507536, -0.3032332, 2.980516, 1, 1, 1, 1, 1,
0.7535141, -0.3257852, 1.230765, 1, 1, 1, 1, 1,
0.7582058, -0.6738794, 2.849946, 1, 1, 1, 1, 1,
0.7627738, 0.4439383, 0.8174379, 1, 1, 1, 1, 1,
0.7642217, -1.175299, 3.798407, 1, 1, 1, 1, 1,
0.7738277, -1.244467, 0.8309172, 1, 1, 1, 1, 1,
0.7763144, 0.08310647, 1.023532, 1, 1, 1, 1, 1,
0.7781409, -0.350117, 2.018116, 1, 1, 1, 1, 1,
0.7788001, -1.488888, 1.768139, 0, 0, 1, 1, 1,
0.7816426, -0.4326428, 1.20802, 1, 0, 0, 1, 1,
0.7944263, 2.523605, -0.2735522, 1, 0, 0, 1, 1,
0.7946906, 1.430146, 1.02449, 1, 0, 0, 1, 1,
0.7971212, 0.2264154, 1.180746, 1, 0, 0, 1, 1,
0.8037159, -1.336745, 3.318001, 1, 0, 0, 1, 1,
0.8116471, 1.848813, -0.3461644, 0, 0, 0, 1, 1,
0.8128054, -1.11762, 4.030737, 0, 0, 0, 1, 1,
0.8134683, 0.4193961, 0.5150383, 0, 0, 0, 1, 1,
0.8152865, -0.5996776, 0.9421483, 0, 0, 0, 1, 1,
0.8208494, 0.01927703, 3.16026, 0, 0, 0, 1, 1,
0.8255127, 1.010326, 2.637549, 0, 0, 0, 1, 1,
0.8330832, -0.3524216, 2.152006, 0, 0, 0, 1, 1,
0.8418578, 0.262987, 2.788327, 1, 1, 1, 1, 1,
0.8477583, 0.5680506, 0.6263361, 1, 1, 1, 1, 1,
0.8484605, 1.754514, -0.3446312, 1, 1, 1, 1, 1,
0.8511778, -0.4684649, 1.862161, 1, 1, 1, 1, 1,
0.8570544, -0.9357656, 1.475258, 1, 1, 1, 1, 1,
0.8633935, -1.425197, 1.63564, 1, 1, 1, 1, 1,
0.8635349, -1.301523, 3.848451, 1, 1, 1, 1, 1,
0.8668787, -0.3695701, 3.066633, 1, 1, 1, 1, 1,
0.8681028, 0.2469782, 1.642596, 1, 1, 1, 1, 1,
0.871166, 0.59577, 2.316134, 1, 1, 1, 1, 1,
0.8751573, 0.2358319, 1.290244, 1, 1, 1, 1, 1,
0.8774139, -0.3462678, 3.235039, 1, 1, 1, 1, 1,
0.8788971, -1.997418, 2.77449, 1, 1, 1, 1, 1,
0.8806217, -0.31389, 1.084154, 1, 1, 1, 1, 1,
0.8818668, -1.415794, 3.099555, 1, 1, 1, 1, 1,
0.8827682, -0.2724165, 3.538287, 0, 0, 1, 1, 1,
0.8876343, 0.2174038, 1.99467, 1, 0, 0, 1, 1,
0.8932456, 1.294837, -0.5128043, 1, 0, 0, 1, 1,
0.8995883, 1.46612, -0.3448486, 1, 0, 0, 1, 1,
0.9010308, -0.3448137, 2.818841, 1, 0, 0, 1, 1,
0.9056079, 0.4303128, 0.5445693, 1, 0, 0, 1, 1,
0.9068188, -1.28353, 1.983923, 0, 0, 0, 1, 1,
0.9068522, 0.3392571, 0.4896219, 0, 0, 0, 1, 1,
0.9073656, 0.6006947, 0.8087954, 0, 0, 0, 1, 1,
0.9093387, 2.274989, -0.08634732, 0, 0, 0, 1, 1,
0.9145954, 1.312086, 0.3840589, 0, 0, 0, 1, 1,
0.9182063, 0.1052317, 2.037091, 0, 0, 0, 1, 1,
0.9184042, 0.9321848, -0.8616115, 0, 0, 0, 1, 1,
0.9198807, 1.157241, -0.08032672, 1, 1, 1, 1, 1,
0.9204063, 1.038514, 0.4470503, 1, 1, 1, 1, 1,
0.9240857, -0.9900326, 2.205271, 1, 1, 1, 1, 1,
0.9278216, -0.7562824, 2.844502, 1, 1, 1, 1, 1,
0.9326819, -0.7561687, 2.574379, 1, 1, 1, 1, 1,
0.93398, -0.417671, 3.146047, 1, 1, 1, 1, 1,
0.9355654, 1.3313, -1.20099, 1, 1, 1, 1, 1,
0.9361182, -0.8273399, 1.321928, 1, 1, 1, 1, 1,
0.9417554, 0.9155858, 0.6876712, 1, 1, 1, 1, 1,
0.9440701, -0.9052562, 2.562481, 1, 1, 1, 1, 1,
0.9473099, -0.5419164, 1.321295, 1, 1, 1, 1, 1,
0.9610726, 0.1673633, 1.562392, 1, 1, 1, 1, 1,
0.9620763, -0.5189295, 2.745634, 1, 1, 1, 1, 1,
0.9625653, 1.082034, 1.481369, 1, 1, 1, 1, 1,
0.9627398, 0.8709835, -0.00881723, 1, 1, 1, 1, 1,
0.9683407, 0.5490223, -0.4311399, 0, 0, 1, 1, 1,
0.9710095, 1.534951, 0.517041, 1, 0, 0, 1, 1,
0.9782333, -0.4941727, 0.4586805, 1, 0, 0, 1, 1,
0.9840821, -0.2281395, 2.249827, 1, 0, 0, 1, 1,
0.9856665, 0.4485176, 1.422053, 1, 0, 0, 1, 1,
0.9893542, -1.061515, 1.925191, 1, 0, 0, 1, 1,
0.9909602, -0.0666735, 1.955474, 0, 0, 0, 1, 1,
0.9931815, -1.595883, 3.58163, 0, 0, 0, 1, 1,
0.9939365, -0.6363279, 1.709363, 0, 0, 0, 1, 1,
0.9950905, 0.002537715, 1.403779, 0, 0, 0, 1, 1,
1.001265, 1.478136, 1.025036, 0, 0, 0, 1, 1,
1.00579, -0.3647209, 0.7243613, 0, 0, 0, 1, 1,
1.00905, -0.3599872, 1.432145, 0, 0, 0, 1, 1,
1.011164, -1.198188, 0.5566444, 1, 1, 1, 1, 1,
1.017524, 0.3142239, 2.376862, 1, 1, 1, 1, 1,
1.01784, -1.721489, 0.09705707, 1, 1, 1, 1, 1,
1.019726, -2.414277, 1.745868, 1, 1, 1, 1, 1,
1.020148, -0.8473169, 2.93667, 1, 1, 1, 1, 1,
1.02092, -0.4592376, 0.7664421, 1, 1, 1, 1, 1,
1.021835, -1.077749, 2.501343, 1, 1, 1, 1, 1,
1.032368, 1.035931, 0.7793553, 1, 1, 1, 1, 1,
1.039117, 0.9251199, 0.2549441, 1, 1, 1, 1, 1,
1.042982, 0.04550603, 1.678738, 1, 1, 1, 1, 1,
1.045729, 0.8752737, 0.4089859, 1, 1, 1, 1, 1,
1.045865, -1.353888, 2.191675, 1, 1, 1, 1, 1,
1.048217, -0.6271706, 1.520307, 1, 1, 1, 1, 1,
1.05406, -0.3332614, 1.686976, 1, 1, 1, 1, 1,
1.055996, 0.1979744, 0.341805, 1, 1, 1, 1, 1,
1.056498, -0.1604538, 0.9117405, 0, 0, 1, 1, 1,
1.057961, 2.419324, -0.3796983, 1, 0, 0, 1, 1,
1.059513, 0.05045854, 0.5144587, 1, 0, 0, 1, 1,
1.074486, 1.2691, -0.2462076, 1, 0, 0, 1, 1,
1.075701, -1.927817, 2.31947, 1, 0, 0, 1, 1,
1.076216, -0.6611596, 1.322201, 1, 0, 0, 1, 1,
1.084203, -0.5201737, 2.251289, 0, 0, 0, 1, 1,
1.084407, 0.8618971, 0.533084, 0, 0, 0, 1, 1,
1.085703, -0.928597, 1.907783, 0, 0, 0, 1, 1,
1.088623, -0.2835176, 0.7234136, 0, 0, 0, 1, 1,
1.097146, 0.131771, -2.077737, 0, 0, 0, 1, 1,
1.098791, -0.9057399, 1.192934, 0, 0, 0, 1, 1,
1.104486, 1.735968, -0.5065342, 0, 0, 0, 1, 1,
1.108166, 1.577495, 0.8431612, 1, 1, 1, 1, 1,
1.110995, 0.5446252, 2.345456, 1, 1, 1, 1, 1,
1.115895, -2.028703, 3.435048, 1, 1, 1, 1, 1,
1.117161, 1.498063, -0.6056883, 1, 1, 1, 1, 1,
1.128159, 0.1596493, 3.355133, 1, 1, 1, 1, 1,
1.133226, -0.4476349, 2.909936, 1, 1, 1, 1, 1,
1.137723, -2.053925, 3.13814, 1, 1, 1, 1, 1,
1.142191, 0.1237705, 0.5293804, 1, 1, 1, 1, 1,
1.144711, -0.3948033, 2.966464, 1, 1, 1, 1, 1,
1.145779, 0.4389272, -0.3250387, 1, 1, 1, 1, 1,
1.148751, 2.333282, 1.611564, 1, 1, 1, 1, 1,
1.14942, -0.4961314, 1.794491, 1, 1, 1, 1, 1,
1.155439, -0.4121166, 1.057413, 1, 1, 1, 1, 1,
1.181141, -0.5279486, 2.486297, 1, 1, 1, 1, 1,
1.183209, -0.4806022, 3.404646, 1, 1, 1, 1, 1,
1.190724, 0.3798015, 0.3974598, 0, 0, 1, 1, 1,
1.191193, -0.966996, 1.880666, 1, 0, 0, 1, 1,
1.194, -1.212017, 2.892726, 1, 0, 0, 1, 1,
1.202628, -2.239929, 2.146478, 1, 0, 0, 1, 1,
1.211354, 1.678586, 0.4021807, 1, 0, 0, 1, 1,
1.219774, 0.4907697, 1.648532, 1, 0, 0, 1, 1,
1.221814, -2.115482, 3.565418, 0, 0, 0, 1, 1,
1.222004, 0.7040771, 0.7907757, 0, 0, 0, 1, 1,
1.226054, 1.436768, 0.1471312, 0, 0, 0, 1, 1,
1.236167, 1.181467, -0.123055, 0, 0, 0, 1, 1,
1.23644, 0.7118523, 0.5185314, 0, 0, 0, 1, 1,
1.241951, -0.9262639, 1.496226, 0, 0, 0, 1, 1,
1.246208, -0.5011261, 3.36925, 0, 0, 0, 1, 1,
1.247839, 0.1680857, 2.987542, 1, 1, 1, 1, 1,
1.257712, -1.392013, 1.731327, 1, 1, 1, 1, 1,
1.259268, 0.1405711, 2.474795, 1, 1, 1, 1, 1,
1.264846, -2.17105, 2.510821, 1, 1, 1, 1, 1,
1.266338, -0.05863732, 0.4022953, 1, 1, 1, 1, 1,
1.273096, -0.4990929, 3.064502, 1, 1, 1, 1, 1,
1.273852, -1.396516, 2.890168, 1, 1, 1, 1, 1,
1.280183, -1.16554, 1.254679, 1, 1, 1, 1, 1,
1.280257, 1.228304, -0.3245862, 1, 1, 1, 1, 1,
1.280391, -0.0794583, 2.283383, 1, 1, 1, 1, 1,
1.282389, -1.109426, 2.593443, 1, 1, 1, 1, 1,
1.287154, 0.1766282, 0.2278067, 1, 1, 1, 1, 1,
1.288764, -0.05270881, 1.240137, 1, 1, 1, 1, 1,
1.289376, 0.3900321, 0.21517, 1, 1, 1, 1, 1,
1.29216, -0.3588087, 2.392737, 1, 1, 1, 1, 1,
1.292211, 0.5485648, 2.997622, 0, 0, 1, 1, 1,
1.293911, -0.4188804, 1.917184, 1, 0, 0, 1, 1,
1.297543, -0.7605856, 0.6546866, 1, 0, 0, 1, 1,
1.307744, -2.010567, 2.90497, 1, 0, 0, 1, 1,
1.307968, -2.661159, 3.384276, 1, 0, 0, 1, 1,
1.320072, -0.8705656, 2.106675, 1, 0, 0, 1, 1,
1.331134, -0.6145081, 2.348926, 0, 0, 0, 1, 1,
1.343083, -0.2547213, 0.5888909, 0, 0, 0, 1, 1,
1.345942, -0.965835, 1.10566, 0, 0, 0, 1, 1,
1.347265, 1.76918, -0.3831633, 0, 0, 0, 1, 1,
1.349746, -0.6701373, 1.382302, 0, 0, 0, 1, 1,
1.354958, -0.3802169, 0.9143242, 0, 0, 0, 1, 1,
1.356402, -0.5841749, 2.730496, 0, 0, 0, 1, 1,
1.371204, -0.8981066, 3.924476, 1, 1, 1, 1, 1,
1.379022, -1.115087, 0.3977419, 1, 1, 1, 1, 1,
1.385618, -0.3379152, 0.8606471, 1, 1, 1, 1, 1,
1.402848, 0.5634589, -1.249877, 1, 1, 1, 1, 1,
1.405053, 0.19854, -0.1035405, 1, 1, 1, 1, 1,
1.417947, 0.7802945, 0.705446, 1, 1, 1, 1, 1,
1.420346, 0.5856344, 3.360048, 1, 1, 1, 1, 1,
1.425534, 2.183037, 1.807946, 1, 1, 1, 1, 1,
1.426117, 0.2186265, 1.146275, 1, 1, 1, 1, 1,
1.451517, -0.5998656, 1.134467, 1, 1, 1, 1, 1,
1.454844, 1.626288, 1.558622, 1, 1, 1, 1, 1,
1.457911, 2.746931, 2.179268, 1, 1, 1, 1, 1,
1.462975, 0.7695536, -0.07093933, 1, 1, 1, 1, 1,
1.479908, -1.055235, 1.906453, 1, 1, 1, 1, 1,
1.480452, 0.8876912, 1.170383, 1, 1, 1, 1, 1,
1.488963, 1.643799, 0.2856621, 0, 0, 1, 1, 1,
1.491172, -0.5937, 1.21342, 1, 0, 0, 1, 1,
1.493244, 1.90403, 0.3830512, 1, 0, 0, 1, 1,
1.498881, -1.235083, 2.781697, 1, 0, 0, 1, 1,
1.507558, -2.39234, 2.326509, 1, 0, 0, 1, 1,
1.517564, -0.9067444, 2.496623, 1, 0, 0, 1, 1,
1.518922, -0.8702285, 0.2022475, 0, 0, 0, 1, 1,
1.526376, 0.02277151, -0.1086605, 0, 0, 0, 1, 1,
1.528642, -0.150465, 0.4327457, 0, 0, 0, 1, 1,
1.548402, -0.1258266, 2.097997, 0, 0, 0, 1, 1,
1.556323, 0.2806516, 1.440191, 0, 0, 0, 1, 1,
1.579165, -1.373633, 3.06039, 0, 0, 0, 1, 1,
1.604805, -0.2478973, 2.312828, 0, 0, 0, 1, 1,
1.605715, -0.3990359, -0.6646436, 1, 1, 1, 1, 1,
1.609742, -0.6757849, 1.776938, 1, 1, 1, 1, 1,
1.610464, 1.467697, 0.1277233, 1, 1, 1, 1, 1,
1.612409, 0.8374632, 0.8795982, 1, 1, 1, 1, 1,
1.61365, -0.8856968, 1.945446, 1, 1, 1, 1, 1,
1.627452, 2.396979, -1.576029, 1, 1, 1, 1, 1,
1.638741, 0.2921619, 2.471404, 1, 1, 1, 1, 1,
1.651804, 0.8006839, -0.3767203, 1, 1, 1, 1, 1,
1.65544, -0.5020067, 1.292243, 1, 1, 1, 1, 1,
1.657707, 1.18217, 1.068964, 1, 1, 1, 1, 1,
1.665481, -0.3612281, 1.490722, 1, 1, 1, 1, 1,
1.669575, 1.809146, 0.8001223, 1, 1, 1, 1, 1,
1.671319, 0.2705549, 1.707703, 1, 1, 1, 1, 1,
1.694801, 0.1549722, 2.126344, 1, 1, 1, 1, 1,
1.702124, -0.8498824, 0.7645361, 1, 1, 1, 1, 1,
1.709186, 0.2280305, 0.8652016, 0, 0, 1, 1, 1,
1.717939, -0.7180311, 2.485115, 1, 0, 0, 1, 1,
1.746881, 1.456658, 0.7058067, 1, 0, 0, 1, 1,
1.765467, 0.01427121, 0.716572, 1, 0, 0, 1, 1,
1.792544, 0.5947307, 0.5808145, 1, 0, 0, 1, 1,
1.793949, -0.007398499, 0.6489053, 1, 0, 0, 1, 1,
1.802877, -2.001878, 1.399687, 0, 0, 0, 1, 1,
1.805756, 1.498316, -0.7758025, 0, 0, 0, 1, 1,
1.806349, -0.5003499, 1.025638, 0, 0, 0, 1, 1,
1.815884, -0.5952551, 3.508203, 0, 0, 0, 1, 1,
1.817981, -0.07793777, 1.762157, 0, 0, 0, 1, 1,
1.824378, 0.9274364, 1.238946, 0, 0, 0, 1, 1,
1.827592, 1.846953, 0.6156119, 0, 0, 0, 1, 1,
1.842032, -0.1437637, 1.079221, 1, 1, 1, 1, 1,
1.886652, -1.380344, 1.534271, 1, 1, 1, 1, 1,
1.889227, 0.6973235, 1.112067, 1, 1, 1, 1, 1,
1.893987, -1.747577, 1.381354, 1, 1, 1, 1, 1,
1.897306, 0.4664449, 1.920742, 1, 1, 1, 1, 1,
1.904336, -0.2464934, 3.094982, 1, 1, 1, 1, 1,
1.905916, 0.1045132, 2.654167, 1, 1, 1, 1, 1,
1.920914, -1.991953, 2.756383, 1, 1, 1, 1, 1,
1.947086, 0.2851066, 3.121726, 1, 1, 1, 1, 1,
1.969249, -0.008436774, 1.50747, 1, 1, 1, 1, 1,
2.002656, -1.079824, 3.561694, 1, 1, 1, 1, 1,
2.019434, -1.156174, 2.207001, 1, 1, 1, 1, 1,
2.027934, 0.4844778, 2.05275, 1, 1, 1, 1, 1,
2.055738, 1.226816, 1.928437, 1, 1, 1, 1, 1,
2.05773, 0.7039855, 0.2816846, 1, 1, 1, 1, 1,
2.065108, -0.515103, 1.885844, 0, 0, 1, 1, 1,
2.067049, 0.4966177, 0.3710942, 1, 0, 0, 1, 1,
2.081015, 0.4751071, 2.448953, 1, 0, 0, 1, 1,
2.089453, 1.763344, -0.0256258, 1, 0, 0, 1, 1,
2.119604, -0.6186909, 2.654245, 1, 0, 0, 1, 1,
2.22048, 1.604614, 2.291582, 1, 0, 0, 1, 1,
2.260668, -0.3529276, 2.725558, 0, 0, 0, 1, 1,
2.3054, 0.9929129, 0.9029041, 0, 0, 0, 1, 1,
2.341357, -0.7936209, 0.8884851, 0, 0, 0, 1, 1,
2.427264, -0.8626705, 1.831759, 0, 0, 0, 1, 1,
2.43418, 1.995517, 0.7442751, 0, 0, 0, 1, 1,
2.50294, 0.5375555, 1.034314, 0, 0, 0, 1, 1,
2.550162, 0.2223361, 0.1827681, 0, 0, 0, 1, 1,
2.600744, -2.36895, 3.011334, 1, 1, 1, 1, 1,
2.645913, 0.2037354, 1.749282, 1, 1, 1, 1, 1,
2.652246, 0.4930332, 1.720237, 1, 1, 1, 1, 1,
2.881748, 2.458008, 0.9159178, 1, 1, 1, 1, 1,
2.91156, -1.052411, 1.267876, 1, 1, 1, 1, 1,
2.982088, -1.368055, 3.179232, 1, 1, 1, 1, 1,
3.857377, -2.039247, 2.0729, 1, 1, 1, 1, 1
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
var radius = 9.498396;
var distance = 33.36271;
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
mvMatrix.translate( -0.3714564, -0.1456068, -0.06046987 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.36271);
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
