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
-2.998289, 1.210067, -2.7272, 1, 0, 0, 1,
-2.915494, -1.206112, -2.792373, 1, 0.007843138, 0, 1,
-2.873634, 0.8930155, -2.137115, 1, 0.01176471, 0, 1,
-2.796121, -2.072942, -1.587814, 1, 0.01960784, 0, 1,
-2.691445, 0.630268, -0.7330742, 1, 0.02352941, 0, 1,
-2.620618, -1.665226, -1.726406, 1, 0.03137255, 0, 1,
-2.484756, -0.9267837, -1.077986, 1, 0.03529412, 0, 1,
-2.470504, -0.7536516, -0.6359211, 1, 0.04313726, 0, 1,
-2.274481, 1.283758, -1.140733, 1, 0.04705882, 0, 1,
-2.246876, 0.7418265, -1.711643, 1, 0.05490196, 0, 1,
-2.188179, -1.373816, -2.534325, 1, 0.05882353, 0, 1,
-2.162831, 0.1929878, -1.647912, 1, 0.06666667, 0, 1,
-2.158547, -0.01525217, -2.499824, 1, 0.07058824, 0, 1,
-2.131131, -1.540368, -2.676306, 1, 0.07843138, 0, 1,
-2.102072, 0.1431278, 0.7886726, 1, 0.08235294, 0, 1,
-2.100201, -1.04921, -1.808045, 1, 0.09019608, 0, 1,
-2.099518, 0.8155922, -1.816356, 1, 0.09411765, 0, 1,
-2.043689, -1.538802, -2.400886, 1, 0.1019608, 0, 1,
-2.033832, -0.4469544, -1.212821, 1, 0.1098039, 0, 1,
-1.988301, 1.300528, -1.544317, 1, 0.1137255, 0, 1,
-1.961641, -1.579505, -1.519736, 1, 0.1215686, 0, 1,
-1.959983, -1.528437, -3.548677, 1, 0.1254902, 0, 1,
-1.954141, -0.5134773, -2.20446, 1, 0.1333333, 0, 1,
-1.939921, 0.175678, -1.436886, 1, 0.1372549, 0, 1,
-1.928485, 0.9613364, 0.1672631, 1, 0.145098, 0, 1,
-1.896434, 0.7894613, -0.7000096, 1, 0.1490196, 0, 1,
-1.871671, -0.03389345, -1.918167, 1, 0.1568628, 0, 1,
-1.870825, -1.50425, -3.499575, 1, 0.1607843, 0, 1,
-1.857429, 0.1800815, -0.6086138, 1, 0.1686275, 0, 1,
-1.849811, 0.8104244, -0.1415261, 1, 0.172549, 0, 1,
-1.847077, 0.5024421, -2.268657, 1, 0.1803922, 0, 1,
-1.823283, -0.01869254, -1.845301, 1, 0.1843137, 0, 1,
-1.813489, 1.30762, 0.6193079, 1, 0.1921569, 0, 1,
-1.803078, 0.5646589, -2.370349, 1, 0.1960784, 0, 1,
-1.802391, 0.9847601, -0.8232291, 1, 0.2039216, 0, 1,
-1.780268, 0.9058232, 0.536794, 1, 0.2117647, 0, 1,
-1.723711, 0.6757648, -0.09785544, 1, 0.2156863, 0, 1,
-1.717736, 0.3677368, -1.771564, 1, 0.2235294, 0, 1,
-1.706588, 1.107745, -0.2763901, 1, 0.227451, 0, 1,
-1.703493, -1.602288, -1.813385, 1, 0.2352941, 0, 1,
-1.698904, 1.69839, -0.3947075, 1, 0.2392157, 0, 1,
-1.696353, 0.2009305, -2.844621, 1, 0.2470588, 0, 1,
-1.670153, -0.2194051, -0.630916, 1, 0.2509804, 0, 1,
-1.663058, 0.3289221, -1.250101, 1, 0.2588235, 0, 1,
-1.656486, -0.1519472, -2.73121, 1, 0.2627451, 0, 1,
-1.638201, 0.08490048, -1.106477, 1, 0.2705882, 0, 1,
-1.634907, 0.265682, -2.423365, 1, 0.2745098, 0, 1,
-1.632549, -0.2084163, -1.972674, 1, 0.282353, 0, 1,
-1.631678, 0.8371196, -2.128208, 1, 0.2862745, 0, 1,
-1.618447, 0.5054245, -2.42577, 1, 0.2941177, 0, 1,
-1.61688, -0.1397533, -1.672208, 1, 0.3019608, 0, 1,
-1.601912, 1.049631, -1.60491, 1, 0.3058824, 0, 1,
-1.58805, -0.5706109, -1.612623, 1, 0.3137255, 0, 1,
-1.588006, 0.7845799, -0.9855724, 1, 0.3176471, 0, 1,
-1.577508, 1.555995, 0.8656486, 1, 0.3254902, 0, 1,
-1.563964, 0.5998425, -1.183396, 1, 0.3294118, 0, 1,
-1.52472, -0.6502545, -0.5085605, 1, 0.3372549, 0, 1,
-1.521935, 0.1197658, -2.971618, 1, 0.3411765, 0, 1,
-1.513845, 1.40202, -1.643321, 1, 0.3490196, 0, 1,
-1.509368, 0.9323229, -1.217472, 1, 0.3529412, 0, 1,
-1.507924, -0.3766181, -1.812198, 1, 0.3607843, 0, 1,
-1.482568, -1.585403, -1.564093, 1, 0.3647059, 0, 1,
-1.481175, 0.423376, -2.668698, 1, 0.372549, 0, 1,
-1.477825, 1.762532, -1.067263, 1, 0.3764706, 0, 1,
-1.476443, -0.7767711, -1.598471, 1, 0.3843137, 0, 1,
-1.467869, -0.8261014, -3.628443, 1, 0.3882353, 0, 1,
-1.466245, 0.2388244, -0.885379, 1, 0.3960784, 0, 1,
-1.466021, -1.845912, -3.009345, 1, 0.4039216, 0, 1,
-1.465334, -0.7705059, -2.074699, 1, 0.4078431, 0, 1,
-1.465183, 0.760588, -2.098263, 1, 0.4156863, 0, 1,
-1.460102, -0.2274623, -1.281352, 1, 0.4196078, 0, 1,
-1.457016, 0.05971284, -1.199624, 1, 0.427451, 0, 1,
-1.456362, -1.126924, -1.297074, 1, 0.4313726, 0, 1,
-1.446612, 1.538558, -0.4130267, 1, 0.4392157, 0, 1,
-1.434931, 0.3934968, -2.493424, 1, 0.4431373, 0, 1,
-1.429246, 2.204483, -0.8403819, 1, 0.4509804, 0, 1,
-1.427403, -0.2525125, -0.9210476, 1, 0.454902, 0, 1,
-1.424783, -0.3377841, -2.068136, 1, 0.4627451, 0, 1,
-1.400919, 0.537663, -1.764698, 1, 0.4666667, 0, 1,
-1.400516, -1.661263, -1.025736, 1, 0.4745098, 0, 1,
-1.392782, -0.04869009, -2.604569, 1, 0.4784314, 0, 1,
-1.39214, -0.1895759, -1.495841, 1, 0.4862745, 0, 1,
-1.389059, -1.641552, -1.148307, 1, 0.4901961, 0, 1,
-1.38408, -0.1030605, -1.556893, 1, 0.4980392, 0, 1,
-1.372759, -1.034752, -2.108514, 1, 0.5058824, 0, 1,
-1.372499, -0.2621095, -1.998567, 1, 0.509804, 0, 1,
-1.355978, -1.112115, -3.292996, 1, 0.5176471, 0, 1,
-1.354423, 1.656509, -0.1323373, 1, 0.5215687, 0, 1,
-1.351262, 0.2424782, -2.740314, 1, 0.5294118, 0, 1,
-1.323485, -0.6047457, -3.17411, 1, 0.5333334, 0, 1,
-1.313421, -0.4380065, -1.762916, 1, 0.5411765, 0, 1,
-1.311395, 2.486521, 0.05606205, 1, 0.5450981, 0, 1,
-1.306131, -0.9838524, -2.390058, 1, 0.5529412, 0, 1,
-1.289665, -0.196646, -2.292108, 1, 0.5568628, 0, 1,
-1.279359, 1.06859, 0.07161998, 1, 0.5647059, 0, 1,
-1.268988, 1.136757, -0.8600354, 1, 0.5686275, 0, 1,
-1.265823, 0.9017116, -1.195995, 1, 0.5764706, 0, 1,
-1.261972, 1.475331, 0.1316411, 1, 0.5803922, 0, 1,
-1.248306, -0.6130995, -0.647632, 1, 0.5882353, 0, 1,
-1.244679, -0.9854434, -2.240527, 1, 0.5921569, 0, 1,
-1.237253, -1.434687, -2.308773, 1, 0.6, 0, 1,
-1.226132, -1.216884, -2.851201, 1, 0.6078432, 0, 1,
-1.22227, -1.894041, -3.220612, 1, 0.6117647, 0, 1,
-1.221181, -0.2279049, -1.814163, 1, 0.6196079, 0, 1,
-1.216831, 0.8687352, -2.307434, 1, 0.6235294, 0, 1,
-1.20146, 1.392303, -1.693879, 1, 0.6313726, 0, 1,
-1.191969, -1.751842, -3.975475, 1, 0.6352941, 0, 1,
-1.188767, -0.3914999, -0.3955972, 1, 0.6431373, 0, 1,
-1.188536, 0.4583187, -1.490681, 1, 0.6470588, 0, 1,
-1.178396, 0.2461869, -1.211986, 1, 0.654902, 0, 1,
-1.168694, 0.813142, 1.433842, 1, 0.6588235, 0, 1,
-1.166884, -0.3493492, -1.566499, 1, 0.6666667, 0, 1,
-1.163763, 1.19083, 0.1539964, 1, 0.6705883, 0, 1,
-1.16103, -1.270701, -0.546515, 1, 0.6784314, 0, 1,
-1.160903, 0.7471917, -2.439653, 1, 0.682353, 0, 1,
-1.160503, -0.7255403, -2.310199, 1, 0.6901961, 0, 1,
-1.151748, -0.4069441, -0.1958461, 1, 0.6941177, 0, 1,
-1.132036, 0.7330835, -2.129381, 1, 0.7019608, 0, 1,
-1.129153, -0.22784, -0.9100542, 1, 0.7098039, 0, 1,
-1.125614, -0.534802, -1.398898, 1, 0.7137255, 0, 1,
-1.10878, 0.6082967, -1.679955, 1, 0.7215686, 0, 1,
-1.107693, 0.1980975, -0.7391779, 1, 0.7254902, 0, 1,
-1.102582, -0.5381444, -2.771883, 1, 0.7333333, 0, 1,
-1.101421, 0.4522849, -1.025581, 1, 0.7372549, 0, 1,
-1.096552, 0.7672077, -1.254318, 1, 0.7450981, 0, 1,
-1.091137, -0.06081194, -1.002217, 1, 0.7490196, 0, 1,
-1.087952, 1.174757, 0.7473537, 1, 0.7568628, 0, 1,
-1.086628, -0.3669482, -1.909326, 1, 0.7607843, 0, 1,
-1.083181, -0.2527783, -1.884532, 1, 0.7686275, 0, 1,
-1.082699, 0.1465959, -1.902329, 1, 0.772549, 0, 1,
-1.077198, 0.4699464, -0.8811633, 1, 0.7803922, 0, 1,
-1.072447, 1.413863, -0.4322603, 1, 0.7843137, 0, 1,
-1.069278, -0.1680115, -2.808629, 1, 0.7921569, 0, 1,
-1.068621, 2.040337, 0.5583392, 1, 0.7960784, 0, 1,
-1.066311, 1.58349, 0.4014945, 1, 0.8039216, 0, 1,
-1.063384, -0.5621545, -0.8115278, 1, 0.8117647, 0, 1,
-1.062745, 0.03897926, -2.088638, 1, 0.8156863, 0, 1,
-1.056068, -0.6305363, -1.308561, 1, 0.8235294, 0, 1,
-1.055521, -0.6333353, -4.03645, 1, 0.827451, 0, 1,
-1.05478, 0.3170877, -1.930782, 1, 0.8352941, 0, 1,
-1.054547, -0.0921811, -2.522936, 1, 0.8392157, 0, 1,
-1.050567, -3.103773, -4.280591, 1, 0.8470588, 0, 1,
-1.046961, 0.1177572, -1.120084, 1, 0.8509804, 0, 1,
-1.044697, -0.1671941, -3.423387, 1, 0.8588235, 0, 1,
-1.04297, 1.006465, -1.425049, 1, 0.8627451, 0, 1,
-1.040835, -0.006117324, -1.430928, 1, 0.8705882, 0, 1,
-1.040209, 1.382989, -0.4101726, 1, 0.8745098, 0, 1,
-1.036963, 0.04153043, -3.98688, 1, 0.8823529, 0, 1,
-1.029217, -0.4231843, 0.3322195, 1, 0.8862745, 0, 1,
-1.021986, -0.006790455, -0.6431935, 1, 0.8941177, 0, 1,
-1.009911, -0.2911003, -2.431562, 1, 0.8980392, 0, 1,
-0.9976394, 0.4433983, -2.762151, 1, 0.9058824, 0, 1,
-0.9744441, -0.02270172, -0.410075, 1, 0.9137255, 0, 1,
-0.9739328, -1.29398, -1.209726, 1, 0.9176471, 0, 1,
-0.9706913, -1.200431, -2.472254, 1, 0.9254902, 0, 1,
-0.9655678, 0.8368613, -1.341013, 1, 0.9294118, 0, 1,
-0.9633434, 0.1885419, -2.200025, 1, 0.9372549, 0, 1,
-0.9617988, 1.028605, -1.002395, 1, 0.9411765, 0, 1,
-0.9575747, 1.241357, -1.743578, 1, 0.9490196, 0, 1,
-0.9496734, 0.4488146, -1.668765, 1, 0.9529412, 0, 1,
-0.9486728, -0.8349252, -0.01905442, 1, 0.9607843, 0, 1,
-0.9480183, -1.75455, -2.48764, 1, 0.9647059, 0, 1,
-0.9478517, 1.256737, -0.4838986, 1, 0.972549, 0, 1,
-0.9473215, 1.420605, -1.217467, 1, 0.9764706, 0, 1,
-0.9406199, 1.093081, -1.098856, 1, 0.9843137, 0, 1,
-0.9354001, 1.341418, -0.4254001, 1, 0.9882353, 0, 1,
-0.932292, 0.7894124, -0.9615166, 1, 0.9960784, 0, 1,
-0.9292411, -0.8455583, -4.323538, 0.9960784, 1, 0, 1,
-0.9231645, 0.4074044, -1.704941, 0.9921569, 1, 0, 1,
-0.9203699, -0.6841112, -1.933038, 0.9843137, 1, 0, 1,
-0.9183924, -0.1143852, -0.9835021, 0.9803922, 1, 0, 1,
-0.9115745, -0.859984, -2.723584, 0.972549, 1, 0, 1,
-0.8993355, 0.4100856, -1.315274, 0.9686275, 1, 0, 1,
-0.8975577, 2.924053, 0.6111836, 0.9607843, 1, 0, 1,
-0.897075, -0.2982925, -2.598149, 0.9568627, 1, 0, 1,
-0.8954294, 0.1230657, -2.44771, 0.9490196, 1, 0, 1,
-0.894439, 0.8113983, -0.2879882, 0.945098, 1, 0, 1,
-0.8936477, -0.7873194, -2.226613, 0.9372549, 1, 0, 1,
-0.8911821, 1.558208, -0.7013509, 0.9333333, 1, 0, 1,
-0.8880367, -0.3543111, -1.66887, 0.9254902, 1, 0, 1,
-0.8823585, 0.9982327, -1.820873, 0.9215686, 1, 0, 1,
-0.879274, -0.2100104, 0.679549, 0.9137255, 1, 0, 1,
-0.8792444, -0.1004393, -3.096478, 0.9098039, 1, 0, 1,
-0.8783973, -0.3374237, -2.226823, 0.9019608, 1, 0, 1,
-0.8768002, -2.435179, -2.886893, 0.8941177, 1, 0, 1,
-0.8747118, -1.11592, -1.719414, 0.8901961, 1, 0, 1,
-0.8731847, -0.5484814, -2.129774, 0.8823529, 1, 0, 1,
-0.8687122, -0.5557262, -3.040119, 0.8784314, 1, 0, 1,
-0.8650231, -0.4519667, -2.079172, 0.8705882, 1, 0, 1,
-0.8629798, 0.4157522, -1.790892, 0.8666667, 1, 0, 1,
-0.8603955, 1.079826, -1.429711, 0.8588235, 1, 0, 1,
-0.8567555, -1.234065, -2.460618, 0.854902, 1, 0, 1,
-0.8549584, -0.9251894, -2.353473, 0.8470588, 1, 0, 1,
-0.8481218, 0.8474537, 0.6903659, 0.8431373, 1, 0, 1,
-0.847738, 2.265448, -0.5421419, 0.8352941, 1, 0, 1,
-0.8470503, 1.729895, -0.5999641, 0.8313726, 1, 0, 1,
-0.8431736, -0.7723315, -0.9197845, 0.8235294, 1, 0, 1,
-0.8406616, -0.1071484, -0.8832916, 0.8196079, 1, 0, 1,
-0.8381662, -0.6806601, -5.36034, 0.8117647, 1, 0, 1,
-0.8337111, 1.307465, -0.4322107, 0.8078431, 1, 0, 1,
-0.8329239, -1.291908, -2.042286, 0.8, 1, 0, 1,
-0.8315302, -0.5855469, -1.969861, 0.7921569, 1, 0, 1,
-0.8270735, 0.2237152, -1.081556, 0.7882353, 1, 0, 1,
-0.8260562, 0.1964287, -0.3347329, 0.7803922, 1, 0, 1,
-0.8103049, -1.030622, -1.779876, 0.7764706, 1, 0, 1,
-0.8087956, 1.067919, -1.533402, 0.7686275, 1, 0, 1,
-0.800752, -0.4894726, -2.79379, 0.7647059, 1, 0, 1,
-0.8000748, 1.185124, -2.095725, 0.7568628, 1, 0, 1,
-0.796504, -2.293289, -2.961605, 0.7529412, 1, 0, 1,
-0.7952455, -0.03945357, -2.90616, 0.7450981, 1, 0, 1,
-0.7873486, -1.455194, -1.181691, 0.7411765, 1, 0, 1,
-0.7837885, -1.160036, -1.649977, 0.7333333, 1, 0, 1,
-0.7809211, -0.8123084, -1.166578, 0.7294118, 1, 0, 1,
-0.7768237, 1.342526, -1.996539, 0.7215686, 1, 0, 1,
-0.7764791, -0.4648686, -3.165162, 0.7176471, 1, 0, 1,
-0.7763134, 0.8420789, -0.4908272, 0.7098039, 1, 0, 1,
-0.7695371, -1.302594, -3.073852, 0.7058824, 1, 0, 1,
-0.765182, -0.6433864, -1.913523, 0.6980392, 1, 0, 1,
-0.764236, -1.610595, -3.830611, 0.6901961, 1, 0, 1,
-0.7641515, -0.1521188, -1.147583, 0.6862745, 1, 0, 1,
-0.7576048, -2.046071, -2.669114, 0.6784314, 1, 0, 1,
-0.7574242, -0.1097141, -1.687185, 0.6745098, 1, 0, 1,
-0.7519951, 1.660842, -0.4305281, 0.6666667, 1, 0, 1,
-0.7452238, -0.1530655, -1.409512, 0.6627451, 1, 0, 1,
-0.7448702, -0.9112626, -1.681051, 0.654902, 1, 0, 1,
-0.7429579, -0.4532756, -2.141113, 0.6509804, 1, 0, 1,
-0.7378613, -2.196806, -3.07222, 0.6431373, 1, 0, 1,
-0.7360002, 0.6146071, -1.343616, 0.6392157, 1, 0, 1,
-0.7340794, 0.2632339, -0.9536321, 0.6313726, 1, 0, 1,
-0.7300853, 0.6726549, -1.392859, 0.627451, 1, 0, 1,
-0.7271379, -0.4860374, -2.620258, 0.6196079, 1, 0, 1,
-0.7271364, -0.07133517, -0.7564219, 0.6156863, 1, 0, 1,
-0.7261173, -0.2199494, -3.533732, 0.6078432, 1, 0, 1,
-0.7210499, -2.12344, -1.15716, 0.6039216, 1, 0, 1,
-0.7148372, -1.005661, -3.854154, 0.5960785, 1, 0, 1,
-0.7125169, -1.400535, -0.7304112, 0.5882353, 1, 0, 1,
-0.7102088, -0.1738255, -2.042688, 0.5843138, 1, 0, 1,
-0.709926, -1.426811, -1.099262, 0.5764706, 1, 0, 1,
-0.6879428, 0.01375748, -3.713487, 0.572549, 1, 0, 1,
-0.6872016, 1.393818, 0.2901513, 0.5647059, 1, 0, 1,
-0.6799937, -0.2070499, -1.429599, 0.5607843, 1, 0, 1,
-0.6792265, 2.039096, 0.8113944, 0.5529412, 1, 0, 1,
-0.6748747, 1.97653, -1.136887, 0.5490196, 1, 0, 1,
-0.6739848, -2.238036, -2.634524, 0.5411765, 1, 0, 1,
-0.67264, -0.6105476, -1.527604, 0.5372549, 1, 0, 1,
-0.6698733, -1.076693, -4.989355, 0.5294118, 1, 0, 1,
-0.6690221, -0.7555168, -1.924941, 0.5254902, 1, 0, 1,
-0.6642424, -0.09602971, -1.927986, 0.5176471, 1, 0, 1,
-0.655866, -0.4803061, -1.65069, 0.5137255, 1, 0, 1,
-0.6474445, 0.1886808, -1.874466, 0.5058824, 1, 0, 1,
-0.645091, 1.105785, 0.003214971, 0.5019608, 1, 0, 1,
-0.6436078, -0.3821864, -1.883737, 0.4941176, 1, 0, 1,
-0.6392131, 0.4062513, -0.02543893, 0.4862745, 1, 0, 1,
-0.6386797, -1.452441, -2.211438, 0.4823529, 1, 0, 1,
-0.6349543, -0.3280993, -2.617844, 0.4745098, 1, 0, 1,
-0.6337662, 0.1256432, 0.6700752, 0.4705882, 1, 0, 1,
-0.633082, -1.288299, -0.7495303, 0.4627451, 1, 0, 1,
-0.6306271, 1.637994, -0.7726283, 0.4588235, 1, 0, 1,
-0.6261194, 0.1657432, -0.4431003, 0.4509804, 1, 0, 1,
-0.6246175, 0.6769807, -1.527827, 0.4470588, 1, 0, 1,
-0.6199048, 0.7722656, -1.701053, 0.4392157, 1, 0, 1,
-0.6096063, -0.384154, -2.658247, 0.4352941, 1, 0, 1,
-0.6090644, 1.278238, -0.4053297, 0.427451, 1, 0, 1,
-0.6051947, 0.1747254, -1.661716, 0.4235294, 1, 0, 1,
-0.6028611, -0.9541792, -2.509639, 0.4156863, 1, 0, 1,
-0.5908064, -0.1312873, 0.1228931, 0.4117647, 1, 0, 1,
-0.5880803, 1.978736, -1.56433, 0.4039216, 1, 0, 1,
-0.5861989, -0.7477694, -3.595022, 0.3960784, 1, 0, 1,
-0.5755169, 1.342168, -2.459621, 0.3921569, 1, 0, 1,
-0.572764, -0.9368762, -0.8341119, 0.3843137, 1, 0, 1,
-0.5648896, 1.155606, 0.005901249, 0.3803922, 1, 0, 1,
-0.5608755, 1.172827, -0.8705755, 0.372549, 1, 0, 1,
-0.5606771, 0.009175119, -1.567076, 0.3686275, 1, 0, 1,
-0.5590556, -2.228919, -2.587699, 0.3607843, 1, 0, 1,
-0.5570152, 0.8320888, -1.035217, 0.3568628, 1, 0, 1,
-0.5488799, -0.1552815, -2.282434, 0.3490196, 1, 0, 1,
-0.5468711, 0.6722597, -1.691836, 0.345098, 1, 0, 1,
-0.546828, 0.2023849, -1.533759, 0.3372549, 1, 0, 1,
-0.5464934, -0.001479047, -2.360813, 0.3333333, 1, 0, 1,
-0.542725, 0.5469678, -0.8913099, 0.3254902, 1, 0, 1,
-0.5396975, 0.9355439, -1.359155, 0.3215686, 1, 0, 1,
-0.5378048, -0.9592522, -3.070349, 0.3137255, 1, 0, 1,
-0.5375516, 1.437867, -1.63415, 0.3098039, 1, 0, 1,
-0.5360608, 0.5815166, -2.48517, 0.3019608, 1, 0, 1,
-0.5321269, -0.2235158, -1.553992, 0.2941177, 1, 0, 1,
-0.5294471, -0.587092, -3.542276, 0.2901961, 1, 0, 1,
-0.5286844, 0.1574944, -0.8019658, 0.282353, 1, 0, 1,
-0.526396, -0.3518386, -3.374675, 0.2784314, 1, 0, 1,
-0.5241109, -1.128996, -3.662428, 0.2705882, 1, 0, 1,
-0.5239536, 1.952431, 0.7264413, 0.2666667, 1, 0, 1,
-0.5163725, -0.3428414, -2.045825, 0.2588235, 1, 0, 1,
-0.5044935, 2.343161, -0.3945352, 0.254902, 1, 0, 1,
-0.5029376, 1.182286, -0.7038005, 0.2470588, 1, 0, 1,
-0.5021578, -1.311754, -2.201284, 0.2431373, 1, 0, 1,
-0.4993305, -1.308603, -2.697434, 0.2352941, 1, 0, 1,
-0.4970277, -1.682476, -3.504292, 0.2313726, 1, 0, 1,
-0.4965942, -0.3842327, -2.666933, 0.2235294, 1, 0, 1,
-0.4906654, 1.488785, -1.52634, 0.2196078, 1, 0, 1,
-0.489615, 0.1978251, -0.9756888, 0.2117647, 1, 0, 1,
-0.4850809, 0.3368238, 0.3089043, 0.2078431, 1, 0, 1,
-0.4822117, 0.6946598, -0.2342258, 0.2, 1, 0, 1,
-0.477924, -0.4534642, -3.502858, 0.1921569, 1, 0, 1,
-0.469766, 0.86926, -0.5615007, 0.1882353, 1, 0, 1,
-0.4528845, -0.6046033, -2.078437, 0.1803922, 1, 0, 1,
-0.4479201, -1.112335, -2.768285, 0.1764706, 1, 0, 1,
-0.446913, 0.9782016, 1.145755, 0.1686275, 1, 0, 1,
-0.4450786, 0.2180244, -2.360837, 0.1647059, 1, 0, 1,
-0.4434769, 0.08063685, -0.7156204, 0.1568628, 1, 0, 1,
-0.440647, -1.05649, -3.218026, 0.1529412, 1, 0, 1,
-0.4392735, 1.36528, -0.9574693, 0.145098, 1, 0, 1,
-0.4366366, 1.932118, -0.8427429, 0.1411765, 1, 0, 1,
-0.4297222, -0.0477347, -3.381491, 0.1333333, 1, 0, 1,
-0.4280551, -0.2212091, -0.1764587, 0.1294118, 1, 0, 1,
-0.4277203, 1.233023, 0.07547388, 0.1215686, 1, 0, 1,
-0.4251848, -0.5774692, -1.719688, 0.1176471, 1, 0, 1,
-0.4179892, 1.597181, -0.8591648, 0.1098039, 1, 0, 1,
-0.415626, 0.2993037, -0.6482382, 0.1058824, 1, 0, 1,
-0.4047376, 0.2015171, -2.635069, 0.09803922, 1, 0, 1,
-0.4010858, 0.6438377, -0.9319952, 0.09019608, 1, 0, 1,
-0.3993763, 0.1813229, -2.392649, 0.08627451, 1, 0, 1,
-0.3973621, -1.2793, -2.825787, 0.07843138, 1, 0, 1,
-0.3963112, 1.039738, -1.602511, 0.07450981, 1, 0, 1,
-0.3962351, -0.972635, -2.269239, 0.06666667, 1, 0, 1,
-0.3863945, -0.379012, -2.159698, 0.0627451, 1, 0, 1,
-0.3859067, 0.282697, -1.874614, 0.05490196, 1, 0, 1,
-0.3840111, 0.580682, 0.966079, 0.05098039, 1, 0, 1,
-0.3819147, -0.4250438, -2.793537, 0.04313726, 1, 0, 1,
-0.3794186, -0.2740543, -1.561627, 0.03921569, 1, 0, 1,
-0.3776973, -0.3720271, -3.27077, 0.03137255, 1, 0, 1,
-0.3764732, 0.2392801, -0.06827352, 0.02745098, 1, 0, 1,
-0.3732756, 0.4780124, -0.7118478, 0.01960784, 1, 0, 1,
-0.3674368, -0.6278135, -1.496521, 0.01568628, 1, 0, 1,
-0.3673655, 0.9017533, -0.886203, 0.007843138, 1, 0, 1,
-0.3646012, 0.3021408, 0.02127262, 0.003921569, 1, 0, 1,
-0.3603663, -0.5136878, -2.615895, 0, 1, 0.003921569, 1,
-0.3601858, 0.3932506, -0.4860985, 0, 1, 0.01176471, 1,
-0.3563668, -1.962042, -3.296821, 0, 1, 0.01568628, 1,
-0.3540532, -1.129739, -6.218601, 0, 1, 0.02352941, 1,
-0.3536023, -1.159926, -1.346322, 0, 1, 0.02745098, 1,
-0.3491587, 0.3318936, 1.129942, 0, 1, 0.03529412, 1,
-0.3474, -0.1126384, -1.532315, 0, 1, 0.03921569, 1,
-0.3470229, -0.2124754, -3.615152, 0, 1, 0.04705882, 1,
-0.3378635, -0.3396029, -3.009314, 0, 1, 0.05098039, 1,
-0.3371607, 0.5017629, -1.505616, 0, 1, 0.05882353, 1,
-0.3365262, -0.3407351, -1.351075, 0, 1, 0.0627451, 1,
-0.3315277, 0.1908429, -1.661572, 0, 1, 0.07058824, 1,
-0.3315106, 0.06865993, -1.179154, 0, 1, 0.07450981, 1,
-0.331454, 0.2045956, -0.01351675, 0, 1, 0.08235294, 1,
-0.3297613, -1.088239, -1.260086, 0, 1, 0.08627451, 1,
-0.3288202, 1.569478, 0.002550645, 0, 1, 0.09411765, 1,
-0.3229512, -0.02035731, -1.411083, 0, 1, 0.1019608, 1,
-0.3199593, 1.624676, -0.7626101, 0, 1, 0.1058824, 1,
-0.3190542, -0.7266477, -3.617984, 0, 1, 0.1137255, 1,
-0.3180408, 1.341603, 0.09244397, 0, 1, 0.1176471, 1,
-0.3169287, 0.03532824, -0.6755134, 0, 1, 0.1254902, 1,
-0.3162588, 0.4417903, -0.05721967, 0, 1, 0.1294118, 1,
-0.3136806, -0.8770457, -3.538575, 0, 1, 0.1372549, 1,
-0.3127649, -1.009416, -3.021049, 0, 1, 0.1411765, 1,
-0.3110906, 0.05798595, -2.241366, 0, 1, 0.1490196, 1,
-0.3092122, -0.8499941, -2.420303, 0, 1, 0.1529412, 1,
-0.3058918, 1.608386, 0.7557743, 0, 1, 0.1607843, 1,
-0.3056951, 1.141828, 0.7074004, 0, 1, 0.1647059, 1,
-0.3054228, -0.3729927, -2.690697, 0, 1, 0.172549, 1,
-0.2990329, 2.478341, -0.616216, 0, 1, 0.1764706, 1,
-0.2978311, -1.201272, -2.601753, 0, 1, 0.1843137, 1,
-0.2977891, 1.414407, -0.02882203, 0, 1, 0.1882353, 1,
-0.2972142, 1.725359, -0.07905497, 0, 1, 0.1960784, 1,
-0.2901199, 0.03127778, -2.504944, 0, 1, 0.2039216, 1,
-0.2821501, 0.09313168, -1.812003, 0, 1, 0.2078431, 1,
-0.2794477, -0.824402, -1.480604, 0, 1, 0.2156863, 1,
-0.274167, 0.4545227, -0.1243033, 0, 1, 0.2196078, 1,
-0.2739968, -2.677327, -5.216843, 0, 1, 0.227451, 1,
-0.2726168, -0.08842088, -2.346189, 0, 1, 0.2313726, 1,
-0.2725314, -0.8693965, -1.018545, 0, 1, 0.2392157, 1,
-0.271833, 0.5009734, 1.357726, 0, 1, 0.2431373, 1,
-0.2710055, -1.701755, -3.244848, 0, 1, 0.2509804, 1,
-0.2705809, 0.7960989, 0.7597553, 0, 1, 0.254902, 1,
-0.2657329, -0.7124541, -2.705561, 0, 1, 0.2627451, 1,
-0.2653381, -1.763271, -2.113416, 0, 1, 0.2666667, 1,
-0.2626765, -0.6622024, -2.148303, 0, 1, 0.2745098, 1,
-0.2618085, 0.9151475, -0.06486306, 0, 1, 0.2784314, 1,
-0.2573679, -0.01528208, 0.3893049, 0, 1, 0.2862745, 1,
-0.2558909, 1.55206, 0.8890817, 0, 1, 0.2901961, 1,
-0.2531597, 0.6324026, -0.8054357, 0, 1, 0.2980392, 1,
-0.2511711, -0.5605028, -2.470668, 0, 1, 0.3058824, 1,
-0.2412848, -0.9118612, -2.055035, 0, 1, 0.3098039, 1,
-0.237843, 0.728647, -0.490649, 0, 1, 0.3176471, 1,
-0.2316135, 1.428039, 1.03715, 0, 1, 0.3215686, 1,
-0.230777, -0.7081091, -1.725037, 0, 1, 0.3294118, 1,
-0.2296842, -0.07196524, -1.572969, 0, 1, 0.3333333, 1,
-0.2276487, 2.561651, 0.03689966, 0, 1, 0.3411765, 1,
-0.2261172, -0.06735348, -2.668981, 0, 1, 0.345098, 1,
-0.2058101, -2.159187, -3.991922, 0, 1, 0.3529412, 1,
-0.2050248, 0.4112176, -0.4846122, 0, 1, 0.3568628, 1,
-0.2023254, 1.46254, 0.9203308, 0, 1, 0.3647059, 1,
-0.2012536, 1.963184, -1.011261, 0, 1, 0.3686275, 1,
-0.2010719, 0.5243134, 0.6711728, 0, 1, 0.3764706, 1,
-0.1978535, 1.246771, 0.2604609, 0, 1, 0.3803922, 1,
-0.1970429, 1.015979, -0.5643142, 0, 1, 0.3882353, 1,
-0.196908, 0.5240326, 0.5926794, 0, 1, 0.3921569, 1,
-0.1903944, 1.077474, -0.9579173, 0, 1, 0.4, 1,
-0.1893261, 0.02190442, -2.734444, 0, 1, 0.4078431, 1,
-0.1885708, 1.227741, -0.3557732, 0, 1, 0.4117647, 1,
-0.1878788, -1.830551, -2.395809, 0, 1, 0.4196078, 1,
-0.1866805, 1.151314, 0.5965475, 0, 1, 0.4235294, 1,
-0.1853646, 0.7502851, 1.554838, 0, 1, 0.4313726, 1,
-0.1852732, -0.1145035, -3.690283, 0, 1, 0.4352941, 1,
-0.1849814, 0.5219901, -0.6081412, 0, 1, 0.4431373, 1,
-0.1849161, 0.2578307, -1.131472, 0, 1, 0.4470588, 1,
-0.1847705, 0.09301195, -1.187946, 0, 1, 0.454902, 1,
-0.1843782, -0.4916519, -3.156817, 0, 1, 0.4588235, 1,
-0.1781484, 1.068218, 0.4615658, 0, 1, 0.4666667, 1,
-0.1766089, 0.2307624, -0.103713, 0, 1, 0.4705882, 1,
-0.1755118, 0.011829, -2.21424, 0, 1, 0.4784314, 1,
-0.1718018, 0.4607595, -1.186024, 0, 1, 0.4823529, 1,
-0.1699973, -1.516096, -4.367889, 0, 1, 0.4901961, 1,
-0.1674995, 0.4873894, 0.2940248, 0, 1, 0.4941176, 1,
-0.1670562, -0.6287857, -3.700834, 0, 1, 0.5019608, 1,
-0.1651203, 1.068409, -0.2395516, 0, 1, 0.509804, 1,
-0.1618138, -0.3994164, -5.55503, 0, 1, 0.5137255, 1,
-0.1589865, -0.903792, -3.485892, 0, 1, 0.5215687, 1,
-0.1553081, 0.5394603, 1.786113, 0, 1, 0.5254902, 1,
-0.1481289, -0.02651481, -0.4043608, 0, 1, 0.5333334, 1,
-0.1425349, 0.5025538, -0.4931181, 0, 1, 0.5372549, 1,
-0.1400419, 0.1242731, -1.24922, 0, 1, 0.5450981, 1,
-0.1359738, 0.4765787, 1.364533, 0, 1, 0.5490196, 1,
-0.1311649, 0.6832942, 1.09368, 0, 1, 0.5568628, 1,
-0.1298703, 1.081247, -0.3241416, 0, 1, 0.5607843, 1,
-0.1297577, -1.282648, -3.069654, 0, 1, 0.5686275, 1,
-0.12849, -2.679064, -2.661416, 0, 1, 0.572549, 1,
-0.1252302, 0.8848776, -1.607625, 0, 1, 0.5803922, 1,
-0.1249511, 1.126515, -0.6070288, 0, 1, 0.5843138, 1,
-0.1241024, -0.6072083, -3.120344, 0, 1, 0.5921569, 1,
-0.1060054, -0.08788354, -3.0602, 0, 1, 0.5960785, 1,
-0.1009867, -1.483039, -2.654781, 0, 1, 0.6039216, 1,
-0.09842773, -0.9025887, -3.29107, 0, 1, 0.6117647, 1,
-0.09633251, -0.7076775, -4.728418, 0, 1, 0.6156863, 1,
-0.09188589, -1.953058, -2.00018, 0, 1, 0.6235294, 1,
-0.09179576, -0.8188646, -3.292257, 0, 1, 0.627451, 1,
-0.08759005, 0.5323243, 0.2232279, 0, 1, 0.6352941, 1,
-0.08113641, 1.420668, 1.590842, 0, 1, 0.6392157, 1,
-0.07681518, 0.4437328, -0.2908819, 0, 1, 0.6470588, 1,
-0.07498746, -0.3848507, -3.260811, 0, 1, 0.6509804, 1,
-0.07343435, 0.19855, -0.4434269, 0, 1, 0.6588235, 1,
-0.07034039, -0.02463794, -2.006988, 0, 1, 0.6627451, 1,
-0.06861175, -1.473947, -4.261183, 0, 1, 0.6705883, 1,
-0.06799547, 0.3452801, 0.9820329, 0, 1, 0.6745098, 1,
-0.06406009, 0.4842741, -0.5007151, 0, 1, 0.682353, 1,
-0.06360959, 0.7235914, 1.643861, 0, 1, 0.6862745, 1,
-0.05968931, -0.2440569, -3.079405, 0, 1, 0.6941177, 1,
-0.05513795, 0.2932789, -0.3106726, 0, 1, 0.7019608, 1,
-0.0503408, -0.9245626, -3.398374, 0, 1, 0.7058824, 1,
-0.04639231, -1.307081, -3.239529, 0, 1, 0.7137255, 1,
-0.04389339, -1.096624, -3.403954, 0, 1, 0.7176471, 1,
-0.04386284, -0.1140101, -3.607674, 0, 1, 0.7254902, 1,
-0.04308499, 1.849055, 0.3722245, 0, 1, 0.7294118, 1,
-0.04262505, -0.5608279, -3.437364, 0, 1, 0.7372549, 1,
-0.03987554, -1.555069, -2.787561, 0, 1, 0.7411765, 1,
-0.03870051, 0.4117309, -1.09415, 0, 1, 0.7490196, 1,
-0.03613504, -0.04962835, -4.94463, 0, 1, 0.7529412, 1,
-0.03592082, -0.915917, -2.008389, 0, 1, 0.7607843, 1,
-0.03262743, 1.821098, 1.142898, 0, 1, 0.7647059, 1,
-0.03098665, -0.3985535, -3.613392, 0, 1, 0.772549, 1,
-0.03047739, -0.5325208, -3.409421, 0, 1, 0.7764706, 1,
-0.02775817, 0.7487196, 1.228742, 0, 1, 0.7843137, 1,
-0.027313, -0.1983751, -4.637139, 0, 1, 0.7882353, 1,
-0.02671067, -0.269565, -3.077729, 0, 1, 0.7960784, 1,
-0.0241063, -0.02467259, -4.217914, 0, 1, 0.8039216, 1,
-0.02282984, -1.222886, -2.93192, 0, 1, 0.8078431, 1,
-0.02129933, 0.1177141, -1.166514, 0, 1, 0.8156863, 1,
-0.02049717, 0.02358872, 1.801188, 0, 1, 0.8196079, 1,
-0.02000835, -0.4117351, -3.481564, 0, 1, 0.827451, 1,
-0.01529986, 0.6102253, 1.543249, 0, 1, 0.8313726, 1,
-0.01036476, -0.1213146, -3.791476, 0, 1, 0.8392157, 1,
-0.002859973, -1.663168, -0.5561146, 0, 1, 0.8431373, 1,
0.003162686, 1.516024, -2.03147, 0, 1, 0.8509804, 1,
0.004243131, 0.95837, 1.289345, 0, 1, 0.854902, 1,
0.005670194, -0.9490179, 2.467704, 0, 1, 0.8627451, 1,
0.006829599, -2.003256, 2.706211, 0, 1, 0.8666667, 1,
0.007170685, 0.3043442, 0.3179108, 0, 1, 0.8745098, 1,
0.008613722, 0.7465335, 0.7093887, 0, 1, 0.8784314, 1,
0.01248431, 1.374995, 0.4359827, 0, 1, 0.8862745, 1,
0.01454518, 1.301996, -0.2679102, 0, 1, 0.8901961, 1,
0.01613232, -0.5044618, 2.615006, 0, 1, 0.8980392, 1,
0.0169459, -1.429118, 3.89849, 0, 1, 0.9058824, 1,
0.01853789, 0.1524297, 0.868169, 0, 1, 0.9098039, 1,
0.01951705, -0.03270664, 2.837165, 0, 1, 0.9176471, 1,
0.02208004, -0.1285538, 2.218276, 0, 1, 0.9215686, 1,
0.02615488, -0.6132573, 1.082504, 0, 1, 0.9294118, 1,
0.02671183, -0.1096962, 3.386276, 0, 1, 0.9333333, 1,
0.03849418, 1.016966, -0.03456812, 0, 1, 0.9411765, 1,
0.03919198, -1.59749, 1.514071, 0, 1, 0.945098, 1,
0.03953329, -1.573637, 4.831346, 0, 1, 0.9529412, 1,
0.04488762, 0.8292951, -0.6484194, 0, 1, 0.9568627, 1,
0.04634427, -0.3984535, 2.488123, 0, 1, 0.9647059, 1,
0.04832277, 0.4054425, -0.3743261, 0, 1, 0.9686275, 1,
0.05126703, -0.1148274, 3.425477, 0, 1, 0.9764706, 1,
0.05195671, 0.06667057, 1.972643, 0, 1, 0.9803922, 1,
0.05248884, 0.6021293, 1.645576, 0, 1, 0.9882353, 1,
0.05362642, 0.6948759, 0.09784172, 0, 1, 0.9921569, 1,
0.0549291, 1.177505, -0.7024775, 0, 1, 1, 1,
0.05866628, 0.5247064, 0.4755357, 0, 0.9921569, 1, 1,
0.05916047, -0.2116912, 1.505938, 0, 0.9882353, 1, 1,
0.06139265, 2.561805, 0.1536211, 0, 0.9803922, 1, 1,
0.06181264, 0.5922947, 1.25782, 0, 0.9764706, 1, 1,
0.06438256, -1.059792, 2.274111, 0, 0.9686275, 1, 1,
0.06556106, 0.09911682, -0.3620672, 0, 0.9647059, 1, 1,
0.0678267, -0.3577175, 3.537084, 0, 0.9568627, 1, 1,
0.07137263, 0.03091839, 0.9881687, 0, 0.9529412, 1, 1,
0.07160963, -0.7202007, 2.641679, 0, 0.945098, 1, 1,
0.07803039, 2.043447, -0.4987498, 0, 0.9411765, 1, 1,
0.08456177, 0.5301006, 1.229664, 0, 0.9333333, 1, 1,
0.08619314, -0.4311307, 2.482192, 0, 0.9294118, 1, 1,
0.08840976, 1.176067, 0.3557362, 0, 0.9215686, 1, 1,
0.08908772, 1.792502, -0.9675241, 0, 0.9176471, 1, 1,
0.0959566, -2.250854, 2.595198, 0, 0.9098039, 1, 1,
0.09751235, -0.6016526, 3.644104, 0, 0.9058824, 1, 1,
0.09793704, -0.5863843, 3.169253, 0, 0.8980392, 1, 1,
0.0991008, 1.528982, 0.9483427, 0, 0.8901961, 1, 1,
0.1002304, 0.262455, -0.5491943, 0, 0.8862745, 1, 1,
0.1020199, -0.1937084, 1.390322, 0, 0.8784314, 1, 1,
0.102799, -0.2506281, 2.414898, 0, 0.8745098, 1, 1,
0.1138317, -0.9496924, 3.498446, 0, 0.8666667, 1, 1,
0.114444, 0.8580858, 0.4010924, 0, 0.8627451, 1, 1,
0.1144913, 0.1094177, -0.0495254, 0, 0.854902, 1, 1,
0.1151754, 0.1106289, 0.6562436, 0, 0.8509804, 1, 1,
0.118804, -1.412462, 3.226434, 0, 0.8431373, 1, 1,
0.1196022, 1.549029, 0.04550532, 0, 0.8392157, 1, 1,
0.122677, 0.9360108, 1.78502, 0, 0.8313726, 1, 1,
0.1234554, -0.2671517, 3.515406, 0, 0.827451, 1, 1,
0.1255672, 0.8802493, -1.92609, 0, 0.8196079, 1, 1,
0.1286831, -1.32116, 3.929955, 0, 0.8156863, 1, 1,
0.1289082, -0.06147576, 4.83234, 0, 0.8078431, 1, 1,
0.1289833, -0.5400895, 3.935567, 0, 0.8039216, 1, 1,
0.1303354, 0.4917341, -0.7922578, 0, 0.7960784, 1, 1,
0.1407456, -0.8807666, 2.343219, 0, 0.7882353, 1, 1,
0.1434588, -0.7090576, 3.104491, 0, 0.7843137, 1, 1,
0.1474323, -0.196433, 3.509532, 0, 0.7764706, 1, 1,
0.1517914, -0.8986659, 2.028646, 0, 0.772549, 1, 1,
0.1543178, -0.5836504, 2.58336, 0, 0.7647059, 1, 1,
0.1566137, 0.364734, -0.06989507, 0, 0.7607843, 1, 1,
0.1578957, 2.279255, 0.22717, 0, 0.7529412, 1, 1,
0.1594549, 0.7043707, 0.9199753, 0, 0.7490196, 1, 1,
0.1607189, 0.8448544, 0.1105618, 0, 0.7411765, 1, 1,
0.1618433, 0.6110981, 0.7973304, 0, 0.7372549, 1, 1,
0.1654043, 3.314272, 2.643134, 0, 0.7294118, 1, 1,
0.1667184, -0.01118088, 2.061035, 0, 0.7254902, 1, 1,
0.1718742, 2.032439, -2.303491, 0, 0.7176471, 1, 1,
0.1734359, -0.3201501, 2.540233, 0, 0.7137255, 1, 1,
0.1765879, -0.8832283, 1.827478, 0, 0.7058824, 1, 1,
0.1773638, 0.2057581, -0.2504525, 0, 0.6980392, 1, 1,
0.1775189, 1.197699, 0.6857892, 0, 0.6941177, 1, 1,
0.1785441, 0.5491146, 0.140194, 0, 0.6862745, 1, 1,
0.1836552, 0.5680346, 0.4105036, 0, 0.682353, 1, 1,
0.1845134, -0.9330443, 1.699067, 0, 0.6745098, 1, 1,
0.185711, 0.3388995, 0.2780639, 0, 0.6705883, 1, 1,
0.1891344, 1.357305, -0.2611256, 0, 0.6627451, 1, 1,
0.1901215, 0.3033469, 0.9100801, 0, 0.6588235, 1, 1,
0.1933724, 0.7211146, 0.2816065, 0, 0.6509804, 1, 1,
0.2028501, -0.8958839, 2.143818, 0, 0.6470588, 1, 1,
0.2064639, -1.193192, 3.450675, 0, 0.6392157, 1, 1,
0.2068304, 0.932907, 1.571699, 0, 0.6352941, 1, 1,
0.2076388, -0.1393803, 1.422059, 0, 0.627451, 1, 1,
0.2088743, -0.6828839, 3.109077, 0, 0.6235294, 1, 1,
0.2090226, -1.067083, 1.317793, 0, 0.6156863, 1, 1,
0.2091814, -0.2706787, 0.8856368, 0, 0.6117647, 1, 1,
0.2107592, -0.7934137, 2.838723, 0, 0.6039216, 1, 1,
0.2116952, 1.179215, -1.253337, 0, 0.5960785, 1, 1,
0.2118264, 0.1181588, 1.671713, 0, 0.5921569, 1, 1,
0.2129656, -1.374185, 2.224933, 0, 0.5843138, 1, 1,
0.2159155, 0.5542654, 1.804025, 0, 0.5803922, 1, 1,
0.2165358, -0.622206, 1.671213, 0, 0.572549, 1, 1,
0.222767, 0.5138535, 1.791089, 0, 0.5686275, 1, 1,
0.2266799, -1.281384, 3.040476, 0, 0.5607843, 1, 1,
0.2289337, 0.8360406, 0.6468171, 0, 0.5568628, 1, 1,
0.2294651, -0.477093, 2.530206, 0, 0.5490196, 1, 1,
0.2298601, -1.417298, 1.121789, 0, 0.5450981, 1, 1,
0.2305383, 0.2990644, 0.2060559, 0, 0.5372549, 1, 1,
0.2307678, -1.494697, 2.186393, 0, 0.5333334, 1, 1,
0.231599, 0.2441507, 0.3601705, 0, 0.5254902, 1, 1,
0.2323129, 1.283658, -0.3973714, 0, 0.5215687, 1, 1,
0.232543, -0.1533247, 1.466225, 0, 0.5137255, 1, 1,
0.241063, 1.577129, -0.1597141, 0, 0.509804, 1, 1,
0.2445554, 0.09661771, 0.3279224, 0, 0.5019608, 1, 1,
0.2463425, 1.563003, 1.385989, 0, 0.4941176, 1, 1,
0.2486439, -0.4305066, 2.813493, 0, 0.4901961, 1, 1,
0.2490391, -0.7444466, 3.759243, 0, 0.4823529, 1, 1,
0.2492621, 0.3478372, 0.07906721, 0, 0.4784314, 1, 1,
0.251578, 2.767532, -0.4061942, 0, 0.4705882, 1, 1,
0.2681617, -0.870055, 3.933966, 0, 0.4666667, 1, 1,
0.2691133, 0.4915197, 0.7588609, 0, 0.4588235, 1, 1,
0.2721939, 1.502606, 0.348204, 0, 0.454902, 1, 1,
0.2767719, 1.021907, 0.235511, 0, 0.4470588, 1, 1,
0.2772716, -0.09838304, 3.310255, 0, 0.4431373, 1, 1,
0.2825544, -0.8939956, 3.178561, 0, 0.4352941, 1, 1,
0.2881911, -0.01912827, 2.845958, 0, 0.4313726, 1, 1,
0.2886295, 1.70233, -0.4715929, 0, 0.4235294, 1, 1,
0.290868, -1.479449, 3.949296, 0, 0.4196078, 1, 1,
0.2909177, 0.4869107, -0.8606082, 0, 0.4117647, 1, 1,
0.2940946, 0.3184292, 1.971129, 0, 0.4078431, 1, 1,
0.2945561, 1.158996, 1.928208, 0, 0.4, 1, 1,
0.2948151, 0.0868917, 1.904571, 0, 0.3921569, 1, 1,
0.3023625, 1.079845, 1.097381, 0, 0.3882353, 1, 1,
0.3046597, -1.297372, 2.846304, 0, 0.3803922, 1, 1,
0.3093668, -0.1502328, 1.019955, 0, 0.3764706, 1, 1,
0.3110549, -1.343663, 2.399027, 0, 0.3686275, 1, 1,
0.3123254, 1.274136, -0.4892831, 0, 0.3647059, 1, 1,
0.3165192, 0.6124601, 1.745383, 0, 0.3568628, 1, 1,
0.3193076, 0.57888, -0.555783, 0, 0.3529412, 1, 1,
0.3216896, -0.5236087, 2.866261, 0, 0.345098, 1, 1,
0.3239568, -0.314061, 2.265372, 0, 0.3411765, 1, 1,
0.3257621, -0.03142013, 1.473488, 0, 0.3333333, 1, 1,
0.3274893, 0.9866793, 1.159391, 0, 0.3294118, 1, 1,
0.3328383, 1.430368, 0.1257434, 0, 0.3215686, 1, 1,
0.3355515, 1.347522, -0.1261767, 0, 0.3176471, 1, 1,
0.3355998, 0.07241562, 2.170182, 0, 0.3098039, 1, 1,
0.3366787, 0.9320297, -0.4746015, 0, 0.3058824, 1, 1,
0.3385422, -0.01404734, 2.093217, 0, 0.2980392, 1, 1,
0.3426927, -0.3918447, 3.00129, 0, 0.2901961, 1, 1,
0.3437974, -1.375455, 2.585464, 0, 0.2862745, 1, 1,
0.3459593, 1.062229, 0.5687971, 0, 0.2784314, 1, 1,
0.3466747, 0.5981197, 0.3600068, 0, 0.2745098, 1, 1,
0.3496912, 0.3136446, 1.393204, 0, 0.2666667, 1, 1,
0.3502705, 0.3386217, 2.045229, 0, 0.2627451, 1, 1,
0.350546, 0.528314, 2.51006, 0, 0.254902, 1, 1,
0.3510377, -1.313282, 2.616796, 0, 0.2509804, 1, 1,
0.3529023, 2.290884, -0.9172288, 0, 0.2431373, 1, 1,
0.357839, 0.05106103, 0.07399759, 0, 0.2392157, 1, 1,
0.3608246, 0.6324822, -0.8943563, 0, 0.2313726, 1, 1,
0.3777628, 1.274243, -0.3208813, 0, 0.227451, 1, 1,
0.3804592, 0.5812281, 1.9469, 0, 0.2196078, 1, 1,
0.3818521, -0.7643795, 0.3021143, 0, 0.2156863, 1, 1,
0.3832582, 1.657239, -1.288608, 0, 0.2078431, 1, 1,
0.3945031, -0.2189955, 1.01004, 0, 0.2039216, 1, 1,
0.3968319, 0.08003708, 2.961809, 0, 0.1960784, 1, 1,
0.3995817, -1.101514, 2.697104, 0, 0.1882353, 1, 1,
0.399709, 0.5196133, 1.836575, 0, 0.1843137, 1, 1,
0.4041943, 0.3722632, 1.125444, 0, 0.1764706, 1, 1,
0.4067738, 1.519654, -1.163525, 0, 0.172549, 1, 1,
0.4073464, 1.510925, -1.626708, 0, 0.1647059, 1, 1,
0.4086782, 0.7644877, 2.376021, 0, 0.1607843, 1, 1,
0.408704, -0.4853323, 2.465399, 0, 0.1529412, 1, 1,
0.4093653, 0.01145381, 2.427506, 0, 0.1490196, 1, 1,
0.4197998, -1.257097, 2.88622, 0, 0.1411765, 1, 1,
0.4204662, 1.49855, 1.243193, 0, 0.1372549, 1, 1,
0.4233996, -0.4337167, 3.490812, 0, 0.1294118, 1, 1,
0.423947, -0.660825, 1.458424, 0, 0.1254902, 1, 1,
0.4239552, -0.4310403, 5.667037, 0, 0.1176471, 1, 1,
0.4247335, 0.5250732, 1.310191, 0, 0.1137255, 1, 1,
0.4353793, 0.6963798, 1.235536, 0, 0.1058824, 1, 1,
0.4437735, -1.414515, 3.063134, 0, 0.09803922, 1, 1,
0.4483066, -1.04619, 2.682005, 0, 0.09411765, 1, 1,
0.4484236, -1.354467, 4.297435, 0, 0.08627451, 1, 1,
0.4486524, 0.09800388, 0.838679, 0, 0.08235294, 1, 1,
0.4487655, -0.6789209, 2.050883, 0, 0.07450981, 1, 1,
0.4507672, -0.5765369, 2.008796, 0, 0.07058824, 1, 1,
0.4528356, 0.3018118, -0.3984025, 0, 0.0627451, 1, 1,
0.4540277, 0.5334921, -0.1137381, 0, 0.05882353, 1, 1,
0.458904, -1.038682, 1.36616, 0, 0.05098039, 1, 1,
0.459833, -1.546013, 3.059493, 0, 0.04705882, 1, 1,
0.4669587, 1.005654, 0.6078202, 0, 0.03921569, 1, 1,
0.4676171, 0.5829102, 2.465189, 0, 0.03529412, 1, 1,
0.4693497, 0.3342102, -0.4868137, 0, 0.02745098, 1, 1,
0.4724428, -1.056217, 0.9688061, 0, 0.02352941, 1, 1,
0.4745058, 1.597053, 1.728819, 0, 0.01568628, 1, 1,
0.4749849, -0.4191813, 3.382005, 0, 0.01176471, 1, 1,
0.4757172, -0.1276915, 2.123917, 0, 0.003921569, 1, 1,
0.4782041, -1.544135, 3.296046, 0.003921569, 0, 1, 1,
0.478446, 0.9153916, 0.6480111, 0.007843138, 0, 1, 1,
0.4835233, 0.4093696, 0.755253, 0.01568628, 0, 1, 1,
0.4876882, 0.5137081, -1.623213, 0.01960784, 0, 1, 1,
0.490496, 1.941301, -0.4527087, 0.02745098, 0, 1, 1,
0.5052641, 1.021752, -0.08241272, 0.03137255, 0, 1, 1,
0.5064926, -0.03119015, 1.200808, 0.03921569, 0, 1, 1,
0.5087231, -0.1649189, 1.463246, 0.04313726, 0, 1, 1,
0.5118588, 1.253849, -0.5531939, 0.05098039, 0, 1, 1,
0.5145956, -2.402637, 2.965396, 0.05490196, 0, 1, 1,
0.5194463, -1.837332, 3.048147, 0.0627451, 0, 1, 1,
0.521903, 0.03424894, 1.027458, 0.06666667, 0, 1, 1,
0.522437, 0.2201344, 1.854188, 0.07450981, 0, 1, 1,
0.5229188, 0.9961111, 0.05810104, 0.07843138, 0, 1, 1,
0.5238156, 1.439427, -1.35608, 0.08627451, 0, 1, 1,
0.5274146, 0.1418678, 1.526543, 0.09019608, 0, 1, 1,
0.5283287, -0.4608259, 2.564565, 0.09803922, 0, 1, 1,
0.5309823, 0.4695292, 3.987789, 0.1058824, 0, 1, 1,
0.5310923, 0.9865644, -0.5487808, 0.1098039, 0, 1, 1,
0.5311301, -1.897088, 2.818014, 0.1176471, 0, 1, 1,
0.5324121, 1.614529, 0.9488086, 0.1215686, 0, 1, 1,
0.5334133, 0.2950362, 1.185773, 0.1294118, 0, 1, 1,
0.5360395, 0.1492941, 2.273084, 0.1333333, 0, 1, 1,
0.5393389, 0.04339275, -0.1598053, 0.1411765, 0, 1, 1,
0.543446, -0.2540848, 1.038854, 0.145098, 0, 1, 1,
0.5478687, -1.960224, 3.465138, 0.1529412, 0, 1, 1,
0.5504166, -0.7882364, 1.642492, 0.1568628, 0, 1, 1,
0.5520165, 0.5228262, 1.846154, 0.1647059, 0, 1, 1,
0.5559353, 0.4940987, 1.674162, 0.1686275, 0, 1, 1,
0.5589398, -0.9251866, 3.267504, 0.1764706, 0, 1, 1,
0.5624741, 0.7353783, 0.02881528, 0.1803922, 0, 1, 1,
0.5628088, 0.4858382, 0.3163534, 0.1882353, 0, 1, 1,
0.5686407, -1.619202, 3.20514, 0.1921569, 0, 1, 1,
0.5739337, -0.1273998, 2.590511, 0.2, 0, 1, 1,
0.5763937, -0.1166041, 0.5935367, 0.2078431, 0, 1, 1,
0.5801917, -0.9501857, 2.765417, 0.2117647, 0, 1, 1,
0.5826405, 0.2355777, 1.776374, 0.2196078, 0, 1, 1,
0.5837275, 0.6819178, 1.232168, 0.2235294, 0, 1, 1,
0.5858208, -0.679543, 3.468711, 0.2313726, 0, 1, 1,
0.5864107, 0.8136795, -0.1403131, 0.2352941, 0, 1, 1,
0.588008, -0.01244981, 0.9781673, 0.2431373, 0, 1, 1,
0.5890083, -0.06831215, 2.704276, 0.2470588, 0, 1, 1,
0.5894106, -1.136941, 1.995535, 0.254902, 0, 1, 1,
0.5895181, 0.475384, 0.6904052, 0.2588235, 0, 1, 1,
0.5901206, -1.321959, 3.095523, 0.2666667, 0, 1, 1,
0.5928347, -1.594813, 3.571639, 0.2705882, 0, 1, 1,
0.594445, -0.6686177, 2.351861, 0.2784314, 0, 1, 1,
0.5987475, -2.301543, 3.149296, 0.282353, 0, 1, 1,
0.6005203, 0.5905731, 0.5542198, 0.2901961, 0, 1, 1,
0.6051928, 1.368979, 1.633128, 0.2941177, 0, 1, 1,
0.6054779, 0.04152368, 1.968599, 0.3019608, 0, 1, 1,
0.6074455, 0.0187772, 1.25309, 0.3098039, 0, 1, 1,
0.6078699, -1.43954, 3.206948, 0.3137255, 0, 1, 1,
0.6097716, 1.108385, 0.7663015, 0.3215686, 0, 1, 1,
0.6118891, 0.3054107, -0.001181622, 0.3254902, 0, 1, 1,
0.6120806, -0.8095741, 3.912364, 0.3333333, 0, 1, 1,
0.6125386, -1.633792, 1.142439, 0.3372549, 0, 1, 1,
0.6128605, -1.882189, 2.427891, 0.345098, 0, 1, 1,
0.615791, 0.1648745, 3.166789, 0.3490196, 0, 1, 1,
0.6181655, -0.3077027, 2.371357, 0.3568628, 0, 1, 1,
0.6197792, 0.02230073, 1.857674, 0.3607843, 0, 1, 1,
0.6208671, 0.136011, 0.1883047, 0.3686275, 0, 1, 1,
0.6243574, -0.1104637, 3.719438, 0.372549, 0, 1, 1,
0.6253055, -1.569003, 2.1908, 0.3803922, 0, 1, 1,
0.6253771, 2.243349, 0.209998, 0.3843137, 0, 1, 1,
0.6318048, 0.3450564, 0.644179, 0.3921569, 0, 1, 1,
0.6423757, -1.598794, 1.700012, 0.3960784, 0, 1, 1,
0.6492803, -0.1557606, 2.612773, 0.4039216, 0, 1, 1,
0.6499225, 0.5798282, -0.9447744, 0.4117647, 0, 1, 1,
0.6557276, 1.638619, 0.9811503, 0.4156863, 0, 1, 1,
0.6592188, 0.9082286, 0.268986, 0.4235294, 0, 1, 1,
0.6612061, 0.7910449, -1.134368, 0.427451, 0, 1, 1,
0.6620176, 1.447789, -0.3935646, 0.4352941, 0, 1, 1,
0.6622615, 0.5530658, 2.099699, 0.4392157, 0, 1, 1,
0.6671022, -0.1741285, 0.1965667, 0.4470588, 0, 1, 1,
0.6714559, -0.2895339, 1.086473, 0.4509804, 0, 1, 1,
0.6739035, -0.9322019, 2.483577, 0.4588235, 0, 1, 1,
0.6769004, -0.9706447, 2.039069, 0.4627451, 0, 1, 1,
0.679596, -0.7199724, 1.928161, 0.4705882, 0, 1, 1,
0.6807872, 1.0829, 1.13552, 0.4745098, 0, 1, 1,
0.6811914, 1.048629, 0.2844941, 0.4823529, 0, 1, 1,
0.6821733, -0.7068224, 1.801977, 0.4862745, 0, 1, 1,
0.6826085, 0.5482467, 1.624415, 0.4941176, 0, 1, 1,
0.6828415, -1.539149, 2.164053, 0.5019608, 0, 1, 1,
0.6929664, -1.000084, 4.237106, 0.5058824, 0, 1, 1,
0.7029669, -0.5643751, 1.635045, 0.5137255, 0, 1, 1,
0.7114841, -0.2962982, 0.4525167, 0.5176471, 0, 1, 1,
0.718653, -0.4085737, 2.842267, 0.5254902, 0, 1, 1,
0.7199312, -1.156715, 2.616939, 0.5294118, 0, 1, 1,
0.7216575, 0.5995885, 0.5622986, 0.5372549, 0, 1, 1,
0.7243416, -0.560904, 2.230433, 0.5411765, 0, 1, 1,
0.7296568, 0.6083704, 1.104397, 0.5490196, 0, 1, 1,
0.7315834, -1.089846, 2.5647, 0.5529412, 0, 1, 1,
0.7329947, -0.2590192, 0.395966, 0.5607843, 0, 1, 1,
0.7345885, -0.5691639, 2.94357, 0.5647059, 0, 1, 1,
0.7367005, 0.95161, -1.736825, 0.572549, 0, 1, 1,
0.7416796, 0.8382685, 1.472766, 0.5764706, 0, 1, 1,
0.7538206, -2.004103, 0.9450585, 0.5843138, 0, 1, 1,
0.7656935, -0.6185035, 2.6769, 0.5882353, 0, 1, 1,
0.7665421, -1.758725, 3.577458, 0.5960785, 0, 1, 1,
0.7670954, -1.675215, 0.953327, 0.6039216, 0, 1, 1,
0.774698, -0.8556648, 2.805378, 0.6078432, 0, 1, 1,
0.779938, -1.822282, 4.064261, 0.6156863, 0, 1, 1,
0.7825529, 1.997854, 1.245162, 0.6196079, 0, 1, 1,
0.7840625, -1.283852, 2.400928, 0.627451, 0, 1, 1,
0.7855522, -1.967545, 2.332301, 0.6313726, 0, 1, 1,
0.8011234, -0.5812286, 2.851218, 0.6392157, 0, 1, 1,
0.8043192, 1.586991, 1.29954, 0.6431373, 0, 1, 1,
0.8057954, 0.7418128, 1.821974, 0.6509804, 0, 1, 1,
0.8087996, 0.4123647, 2.190782, 0.654902, 0, 1, 1,
0.8091584, -1.116483, 1.737189, 0.6627451, 0, 1, 1,
0.8097655, -0.06793098, 0.3904479, 0.6666667, 0, 1, 1,
0.8120481, -1.566746, 2.684503, 0.6745098, 0, 1, 1,
0.8148015, -0.9965963, -0.1048657, 0.6784314, 0, 1, 1,
0.8177025, 0.8774424, 0.404258, 0.6862745, 0, 1, 1,
0.8234394, 0.707694, 1.254911, 0.6901961, 0, 1, 1,
0.8256933, 0.1099065, 1.396466, 0.6980392, 0, 1, 1,
0.831265, -0.2145898, 2.191523, 0.7058824, 0, 1, 1,
0.8410491, -0.7360252, 2.603858, 0.7098039, 0, 1, 1,
0.8423754, 0.7295936, 2.105721, 0.7176471, 0, 1, 1,
0.8502194, -0.6264702, 3.765636, 0.7215686, 0, 1, 1,
0.8611112, 0.306758, 0.9387284, 0.7294118, 0, 1, 1,
0.8625907, 0.006203954, 1.395777, 0.7333333, 0, 1, 1,
0.8674054, 2.067728, 0.4581805, 0.7411765, 0, 1, 1,
0.8684036, -0.264678, 2.214596, 0.7450981, 0, 1, 1,
0.8715757, -0.7536623, 1.900756, 0.7529412, 0, 1, 1,
0.874537, -2.275307, 3.505992, 0.7568628, 0, 1, 1,
0.8771013, -0.9700977, 1.265593, 0.7647059, 0, 1, 1,
0.8791443, 0.5833421, 1.236061, 0.7686275, 0, 1, 1,
0.8836214, 1.134751, 1.080501, 0.7764706, 0, 1, 1,
0.8891677, -1.245701, 2.729349, 0.7803922, 0, 1, 1,
0.8911291, 1.061202, 0.6435673, 0.7882353, 0, 1, 1,
0.89786, -1.691906, 2.417701, 0.7921569, 0, 1, 1,
0.9016361, 0.7886667, 0.3474834, 0.8, 0, 1, 1,
0.9018492, 0.3473855, 0.7572753, 0.8078431, 0, 1, 1,
0.9082505, 3.208863, -0.9176112, 0.8117647, 0, 1, 1,
0.9083397, -0.4231331, 1.462442, 0.8196079, 0, 1, 1,
0.9145349, -0.4898259, 3.397626, 0.8235294, 0, 1, 1,
0.9195957, 0.6787006, 1.716968, 0.8313726, 0, 1, 1,
0.9214886, 0.569584, 0.5305043, 0.8352941, 0, 1, 1,
0.9225441, 1.330993, 2.257576, 0.8431373, 0, 1, 1,
0.9376032, 1.041511, 0.09861992, 0.8470588, 0, 1, 1,
0.9467033, 1.745511, 1.348594, 0.854902, 0, 1, 1,
0.9479344, -1.027637, 2.509572, 0.8588235, 0, 1, 1,
0.9506538, -0.7136322, 2.398474, 0.8666667, 0, 1, 1,
0.951126, -0.3811982, 1.234354, 0.8705882, 0, 1, 1,
0.9545856, 0.1174543, 0.7983438, 0.8784314, 0, 1, 1,
0.958426, -0.006914577, 1.667535, 0.8823529, 0, 1, 1,
0.9584796, 0.5856997, 2.063954, 0.8901961, 0, 1, 1,
0.960665, 0.320302, 1.387291, 0.8941177, 0, 1, 1,
0.9624168, 0.2797827, 1.674877, 0.9019608, 0, 1, 1,
0.9648498, 0.4668663, 0.4184801, 0.9098039, 0, 1, 1,
0.9667512, -0.6991119, 4.157092, 0.9137255, 0, 1, 1,
0.9674674, 1.479121, -1.872885, 0.9215686, 0, 1, 1,
0.9686528, 0.7361158, -0.387947, 0.9254902, 0, 1, 1,
0.9711248, 0.7875551, 1.901947, 0.9333333, 0, 1, 1,
0.9724536, -0.2421964, 2.468483, 0.9372549, 0, 1, 1,
0.974054, -1.544069, 1.642163, 0.945098, 0, 1, 1,
0.9772398, -0.1835273, 0.2408587, 0.9490196, 0, 1, 1,
0.9809632, -0.472152, 1.319496, 0.9568627, 0, 1, 1,
0.9951774, -0.09022719, 3.198668, 0.9607843, 0, 1, 1,
0.9972113, 1.8815, 0.7751056, 0.9686275, 0, 1, 1,
1.001348, 0.7065747, 1.48937, 0.972549, 0, 1, 1,
1.011053, 1.589696, -1.216312, 0.9803922, 0, 1, 1,
1.01455, 1.646343, 0.006019193, 0.9843137, 0, 1, 1,
1.022929, 0.8804262, 0.7189034, 0.9921569, 0, 1, 1,
1.025057, -0.971241, 2.291495, 0.9960784, 0, 1, 1,
1.025919, -1.15594, 1.76119, 1, 0, 0.9960784, 1,
1.030905, 0.6184086, 0.0897552, 1, 0, 0.9882353, 1,
1.038367, 1.514595, 1.754916, 1, 0, 0.9843137, 1,
1.039747, 1.25511, 2.874616, 1, 0, 0.9764706, 1,
1.047996, 0.6012488, 3.505043, 1, 0, 0.972549, 1,
1.054596, 0.5084968, 2.336514, 1, 0, 0.9647059, 1,
1.068548, -0.4679643, 3.197771, 1, 0, 0.9607843, 1,
1.085582, 1.046661, 0.3087995, 1, 0, 0.9529412, 1,
1.089612, 0.4242114, 1.418477, 1, 0, 0.9490196, 1,
1.100039, -1.24659, 2.73551, 1, 0, 0.9411765, 1,
1.104387, -1.612733, 0.6710051, 1, 0, 0.9372549, 1,
1.106524, -0.3504641, 1.323239, 1, 0, 0.9294118, 1,
1.109086, 0.322087, 0.8933107, 1, 0, 0.9254902, 1,
1.112724, -0.7830669, 2.625279, 1, 0, 0.9176471, 1,
1.123367, 0.1157707, 0.1100562, 1, 0, 0.9137255, 1,
1.125014, 0.3937508, 0.9041715, 1, 0, 0.9058824, 1,
1.125356, -0.1549451, 1.629757, 1, 0, 0.9019608, 1,
1.130387, -2.069913, 1.360823, 1, 0, 0.8941177, 1,
1.134672, 1.036952, 1.06164, 1, 0, 0.8862745, 1,
1.13757, -0.5436234, 1.859453, 1, 0, 0.8823529, 1,
1.143023, -0.2455613, 0.09179929, 1, 0, 0.8745098, 1,
1.146204, -1.403281, 2.434706, 1, 0, 0.8705882, 1,
1.150953, 0.7888021, 0.43713, 1, 0, 0.8627451, 1,
1.161522, -0.02708459, 1.550191, 1, 0, 0.8588235, 1,
1.161589, 1.093957, 1.324129, 1, 0, 0.8509804, 1,
1.162443, -1.229208, 3.195611, 1, 0, 0.8470588, 1,
1.173429, -0.473733, 2.723275, 1, 0, 0.8392157, 1,
1.175132, -0.9212491, 0.337814, 1, 0, 0.8352941, 1,
1.182375, 1.122624, 0.2063437, 1, 0, 0.827451, 1,
1.187524, 1.067588, 2.601976, 1, 0, 0.8235294, 1,
1.191827, 0.8339966, -0.5645456, 1, 0, 0.8156863, 1,
1.194632, 1.24862, 2.268911, 1, 0, 0.8117647, 1,
1.20603, 1.196304, 0.1831291, 1, 0, 0.8039216, 1,
1.206476, -0.3507339, 0.9980295, 1, 0, 0.7960784, 1,
1.20823, -0.855463, 2.27229, 1, 0, 0.7921569, 1,
1.20932, 1.581519, -1.026396, 1, 0, 0.7843137, 1,
1.210259, 1.208501, 1.311422, 1, 0, 0.7803922, 1,
1.212739, 1.733634, -0.1469075, 1, 0, 0.772549, 1,
1.212796, 1.524446, 2.419828, 1, 0, 0.7686275, 1,
1.218836, 0.5987402, 2.696776, 1, 0, 0.7607843, 1,
1.230344, -0.2669947, -0.2326829, 1, 0, 0.7568628, 1,
1.234954, 0.2713871, -0.6976681, 1, 0, 0.7490196, 1,
1.239971, 0.9927673, -0.1782093, 1, 0, 0.7450981, 1,
1.246837, 0.8551719, 0.2261855, 1, 0, 0.7372549, 1,
1.248932, 1.759861, 2.298753, 1, 0, 0.7333333, 1,
1.249651, -0.4848805, 2.346351, 1, 0, 0.7254902, 1,
1.25171, 0.3164313, 0.5969008, 1, 0, 0.7215686, 1,
1.260852, -0.1642879, 0.2442996, 1, 0, 0.7137255, 1,
1.261182, -0.06053442, 1.139404, 1, 0, 0.7098039, 1,
1.271888, 2.073926, -0.03544483, 1, 0, 0.7019608, 1,
1.277052, -1.022229, 2.882666, 1, 0, 0.6941177, 1,
1.281642, -0.2280936, 1.591439, 1, 0, 0.6901961, 1,
1.284413, -0.7786276, 2.733106, 1, 0, 0.682353, 1,
1.28668, -1.246832, 1.763309, 1, 0, 0.6784314, 1,
1.287337, -1.784784, 0.8040073, 1, 0, 0.6705883, 1,
1.28803, -0.2833577, 1.438956, 1, 0, 0.6666667, 1,
1.317955, -1.750829, 1.411901, 1, 0, 0.6588235, 1,
1.326757, 0.03642178, 2.378585, 1, 0, 0.654902, 1,
1.329421, 0.1034665, 1.611142, 1, 0, 0.6470588, 1,
1.338582, 0.6779047, 1.661485, 1, 0, 0.6431373, 1,
1.341759, -1.042406, 3.283604, 1, 0, 0.6352941, 1,
1.35837, -1.04666, 1.553911, 1, 0, 0.6313726, 1,
1.360733, 0.5315872, -0.04725661, 1, 0, 0.6235294, 1,
1.363491, 0.9157976, 1.312034, 1, 0, 0.6196079, 1,
1.374403, -0.8170634, 1.048946, 1, 0, 0.6117647, 1,
1.377877, -0.3596356, 1.169949, 1, 0, 0.6078432, 1,
1.383095, -0.03697559, 0.6871989, 1, 0, 0.6, 1,
1.38857, 1.166227, 0.3789887, 1, 0, 0.5921569, 1,
1.391736, 0.7413685, 1.564262, 1, 0, 0.5882353, 1,
1.394869, -0.4908718, 1.32519, 1, 0, 0.5803922, 1,
1.395244, -1.97353, 2.448045, 1, 0, 0.5764706, 1,
1.40009, -0.7121922, 1.969554, 1, 0, 0.5686275, 1,
1.400267, 0.7768586, 0.430144, 1, 0, 0.5647059, 1,
1.400456, -0.1171283, -0.03940491, 1, 0, 0.5568628, 1,
1.400515, 0.02303859, 0.2475917, 1, 0, 0.5529412, 1,
1.407863, -0.6618356, 1.960578, 1, 0, 0.5450981, 1,
1.418407, -1.034104, 3.143475, 1, 0, 0.5411765, 1,
1.421825, 0.5330206, 2.596993, 1, 0, 0.5333334, 1,
1.429028, 0.08602297, 1.661669, 1, 0, 0.5294118, 1,
1.4365, -0.2823757, 1.889526, 1, 0, 0.5215687, 1,
1.44007, -0.185744, 2.206837, 1, 0, 0.5176471, 1,
1.450236, 1.581759, 0.7361545, 1, 0, 0.509804, 1,
1.453426, -1.349731, 1.666267, 1, 0, 0.5058824, 1,
1.467048, 0.1436468, 1.733596, 1, 0, 0.4980392, 1,
1.50523, -0.2464308, 3.076201, 1, 0, 0.4901961, 1,
1.509986, -0.02712305, 2.43313, 1, 0, 0.4862745, 1,
1.509995, -1.048713, 1.929504, 1, 0, 0.4784314, 1,
1.52223, -1.160019, 3.674968, 1, 0, 0.4745098, 1,
1.524061, 0.3264406, 0.6420982, 1, 0, 0.4666667, 1,
1.52493, -0.03165454, 2.494836, 1, 0, 0.4627451, 1,
1.535992, -0.9996517, 2.293373, 1, 0, 0.454902, 1,
1.544804, -0.637575, 3.162832, 1, 0, 0.4509804, 1,
1.561438, -0.4190959, 1.900164, 1, 0, 0.4431373, 1,
1.563432, -0.4402863, 2.201086, 1, 0, 0.4392157, 1,
1.574452, 1.291514, 1.576488, 1, 0, 0.4313726, 1,
1.577355, -1.082699, 1.667252, 1, 0, 0.427451, 1,
1.577425, -1.453463, 3.109115, 1, 0, 0.4196078, 1,
1.578856, -0.1249212, 3.352822, 1, 0, 0.4156863, 1,
1.583285, -1.370154, 1.93426, 1, 0, 0.4078431, 1,
1.596967, -0.3972814, 0.4290788, 1, 0, 0.4039216, 1,
1.599148, 0.4562399, 1.080204, 1, 0, 0.3960784, 1,
1.604948, -0.7294421, 2.349214, 1, 0, 0.3882353, 1,
1.616721, 0.5618751, 0.7255937, 1, 0, 0.3843137, 1,
1.618262, -2.6227, 0.7808016, 1, 0, 0.3764706, 1,
1.624283, 0.5494267, 1.071092, 1, 0, 0.372549, 1,
1.624603, -0.5375961, 4.462358, 1, 0, 0.3647059, 1,
1.638825, 0.1820664, 1.841362, 1, 0, 0.3607843, 1,
1.641077, -2.932499, 2.649842, 1, 0, 0.3529412, 1,
1.648281, -0.9376832, 2.195515, 1, 0, 0.3490196, 1,
1.657489, 0.3278925, 1.994815, 1, 0, 0.3411765, 1,
1.664836, -0.01908788, 1.533108, 1, 0, 0.3372549, 1,
1.665272, 0.706715, 0.6001911, 1, 0, 0.3294118, 1,
1.667147, 0.2019005, 1.262988, 1, 0, 0.3254902, 1,
1.718804, -0.4056132, 2.026943, 1, 0, 0.3176471, 1,
1.728935, 0.9216807, 1.158252, 1, 0, 0.3137255, 1,
1.732045, -0.3602454, 1.785204, 1, 0, 0.3058824, 1,
1.739571, -0.4606898, 0.5887613, 1, 0, 0.2980392, 1,
1.741373, 0.4540946, 2.323147, 1, 0, 0.2941177, 1,
1.742249, 0.8879703, 0.9105922, 1, 0, 0.2862745, 1,
1.752752, 0.5691583, 0.6356833, 1, 0, 0.282353, 1,
1.76898, 0.3217707, 0.1340492, 1, 0, 0.2745098, 1,
1.769968, 1.344562, 2.055993, 1, 0, 0.2705882, 1,
1.78352, -1.078187, 3.751492, 1, 0, 0.2627451, 1,
1.787157, -0.3915268, 1.667508, 1, 0, 0.2588235, 1,
1.794704, -1.727901, 3.364667, 1, 0, 0.2509804, 1,
1.811028, 0.04445894, 2.354715, 1, 0, 0.2470588, 1,
1.826492, -0.190714, 2.039242, 1, 0, 0.2392157, 1,
1.846422, -0.2429999, 1.52365, 1, 0, 0.2352941, 1,
1.854573, -1.051588, 1.492601, 1, 0, 0.227451, 1,
1.860314, -0.245042, 2.638879, 1, 0, 0.2235294, 1,
1.878367, -0.04941599, 1.410728, 1, 0, 0.2156863, 1,
1.903596, -0.1151332, 0.7083328, 1, 0, 0.2117647, 1,
1.907395, 1.570117, 1.967744, 1, 0, 0.2039216, 1,
1.910184, 0.3663224, 1.439096, 1, 0, 0.1960784, 1,
1.913587, -0.6492646, -1.353175, 1, 0, 0.1921569, 1,
1.944651, -0.8015555, 0.9417419, 1, 0, 0.1843137, 1,
1.94509, 1.723706, 0.8911996, 1, 0, 0.1803922, 1,
1.947278, -1.778669, 2.175594, 1, 0, 0.172549, 1,
1.965139, 0.08259596, 0.7495156, 1, 0, 0.1686275, 1,
2.024644, 1.691884, 0.8434781, 1, 0, 0.1607843, 1,
2.027617, -1.221343, 3.697099, 1, 0, 0.1568628, 1,
2.031798, -0.04198907, 1.864594, 1, 0, 0.1490196, 1,
2.039925, 1.213965, 0.6122376, 1, 0, 0.145098, 1,
2.050558, -0.8547471, 2.430393, 1, 0, 0.1372549, 1,
2.079379, 0.2895464, 1.308074, 1, 0, 0.1333333, 1,
2.089389, 0.511626, 1.557621, 1, 0, 0.1254902, 1,
2.105858, -0.604564, 1.600346, 1, 0, 0.1215686, 1,
2.160311, -0.08161155, 0.3185593, 1, 0, 0.1137255, 1,
2.163702, 0.04311077, 1.34524, 1, 0, 0.1098039, 1,
2.182819, 0.9203376, 0.4587293, 1, 0, 0.1019608, 1,
2.210872, 1.149326, 0.6240528, 1, 0, 0.09411765, 1,
2.29365, 0.1007062, 2.156387, 1, 0, 0.09019608, 1,
2.353708, 1.073913, 0.9987178, 1, 0, 0.08235294, 1,
2.402581, 0.1390526, 1.004604, 1, 0, 0.07843138, 1,
2.403857, -1.618471, 2.544481, 1, 0, 0.07058824, 1,
2.428238, -0.3105094, -0.03447032, 1, 0, 0.06666667, 1,
2.507313, -1.630719, 2.80054, 1, 0, 0.05882353, 1,
2.508716, 0.1384246, 0.1154274, 1, 0, 0.05490196, 1,
2.561684, 0.5117882, 0.7510478, 1, 0, 0.04705882, 1,
2.699337, -0.6250881, 1.25015, 1, 0, 0.04313726, 1,
2.709847, 0.1561609, 2.670377, 1, 0, 0.03529412, 1,
2.817952, -1.047004, 2.373244, 1, 0, 0.03137255, 1,
3.060503, 0.6712618, 0.8666547, 1, 0, 0.02352941, 1,
3.144671, -0.6853675, 1.585961, 1, 0, 0.01960784, 1,
3.584429, -1.190359, 1.743868, 1, 0, 0.01176471, 1,
3.70044, -0.1409421, 1.055659, 1, 0, 0.007843138, 1
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
0.3510752, -4.191632, -8.233216, 0, -0.5, 0.5, 0.5,
0.3510752, -4.191632, -8.233216, 1, -0.5, 0.5, 0.5,
0.3510752, -4.191632, -8.233216, 1, 1.5, 0.5, 0.5,
0.3510752, -4.191632, -8.233216, 0, 1.5, 0.5, 0.5
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
-4.133724, 0.1052496, -8.233216, 0, -0.5, 0.5, 0.5,
-4.133724, 0.1052496, -8.233216, 1, -0.5, 0.5, 0.5,
-4.133724, 0.1052496, -8.233216, 1, 1.5, 0.5, 0.5,
-4.133724, 0.1052496, -8.233216, 0, 1.5, 0.5, 0.5
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
-4.133724, -4.191632, -0.2757819, 0, -0.5, 0.5, 0.5,
-4.133724, -4.191632, -0.2757819, 1, -0.5, 0.5, 0.5,
-4.133724, -4.191632, -0.2757819, 1, 1.5, 0.5, 0.5,
-4.133724, -4.191632, -0.2757819, 0, 1.5, 0.5, 0.5
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
-2, -3.200044, -6.396885,
3, -3.200044, -6.396885,
-2, -3.200044, -6.396885,
-2, -3.365309, -6.70294,
-1, -3.200044, -6.396885,
-1, -3.365309, -6.70294,
0, -3.200044, -6.396885,
0, -3.365309, -6.70294,
1, -3.200044, -6.396885,
1, -3.365309, -6.70294,
2, -3.200044, -6.396885,
2, -3.365309, -6.70294,
3, -3.200044, -6.396885,
3, -3.365309, -6.70294
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
-2, -3.695838, -7.315051, 0, -0.5, 0.5, 0.5,
-2, -3.695838, -7.315051, 1, -0.5, 0.5, 0.5,
-2, -3.695838, -7.315051, 1, 1.5, 0.5, 0.5,
-2, -3.695838, -7.315051, 0, 1.5, 0.5, 0.5,
-1, -3.695838, -7.315051, 0, -0.5, 0.5, 0.5,
-1, -3.695838, -7.315051, 1, -0.5, 0.5, 0.5,
-1, -3.695838, -7.315051, 1, 1.5, 0.5, 0.5,
-1, -3.695838, -7.315051, 0, 1.5, 0.5, 0.5,
0, -3.695838, -7.315051, 0, -0.5, 0.5, 0.5,
0, -3.695838, -7.315051, 1, -0.5, 0.5, 0.5,
0, -3.695838, -7.315051, 1, 1.5, 0.5, 0.5,
0, -3.695838, -7.315051, 0, 1.5, 0.5, 0.5,
1, -3.695838, -7.315051, 0, -0.5, 0.5, 0.5,
1, -3.695838, -7.315051, 1, -0.5, 0.5, 0.5,
1, -3.695838, -7.315051, 1, 1.5, 0.5, 0.5,
1, -3.695838, -7.315051, 0, 1.5, 0.5, 0.5,
2, -3.695838, -7.315051, 0, -0.5, 0.5, 0.5,
2, -3.695838, -7.315051, 1, -0.5, 0.5, 0.5,
2, -3.695838, -7.315051, 1, 1.5, 0.5, 0.5,
2, -3.695838, -7.315051, 0, 1.5, 0.5, 0.5,
3, -3.695838, -7.315051, 0, -0.5, 0.5, 0.5,
3, -3.695838, -7.315051, 1, -0.5, 0.5, 0.5,
3, -3.695838, -7.315051, 1, 1.5, 0.5, 0.5,
3, -3.695838, -7.315051, 0, 1.5, 0.5, 0.5
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
-3.09877, -3, -6.396885,
-3.09877, 3, -6.396885,
-3.09877, -3, -6.396885,
-3.271263, -3, -6.70294,
-3.09877, -2, -6.396885,
-3.271263, -2, -6.70294,
-3.09877, -1, -6.396885,
-3.271263, -1, -6.70294,
-3.09877, 0, -6.396885,
-3.271263, 0, -6.70294,
-3.09877, 1, -6.396885,
-3.271263, 1, -6.70294,
-3.09877, 2, -6.396885,
-3.271263, 2, -6.70294,
-3.09877, 3, -6.396885,
-3.271263, 3, -6.70294
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
-3.616247, -3, -7.315051, 0, -0.5, 0.5, 0.5,
-3.616247, -3, -7.315051, 1, -0.5, 0.5, 0.5,
-3.616247, -3, -7.315051, 1, 1.5, 0.5, 0.5,
-3.616247, -3, -7.315051, 0, 1.5, 0.5, 0.5,
-3.616247, -2, -7.315051, 0, -0.5, 0.5, 0.5,
-3.616247, -2, -7.315051, 1, -0.5, 0.5, 0.5,
-3.616247, -2, -7.315051, 1, 1.5, 0.5, 0.5,
-3.616247, -2, -7.315051, 0, 1.5, 0.5, 0.5,
-3.616247, -1, -7.315051, 0, -0.5, 0.5, 0.5,
-3.616247, -1, -7.315051, 1, -0.5, 0.5, 0.5,
-3.616247, -1, -7.315051, 1, 1.5, 0.5, 0.5,
-3.616247, -1, -7.315051, 0, 1.5, 0.5, 0.5,
-3.616247, 0, -7.315051, 0, -0.5, 0.5, 0.5,
-3.616247, 0, -7.315051, 1, -0.5, 0.5, 0.5,
-3.616247, 0, -7.315051, 1, 1.5, 0.5, 0.5,
-3.616247, 0, -7.315051, 0, 1.5, 0.5, 0.5,
-3.616247, 1, -7.315051, 0, -0.5, 0.5, 0.5,
-3.616247, 1, -7.315051, 1, -0.5, 0.5, 0.5,
-3.616247, 1, -7.315051, 1, 1.5, 0.5, 0.5,
-3.616247, 1, -7.315051, 0, 1.5, 0.5, 0.5,
-3.616247, 2, -7.315051, 0, -0.5, 0.5, 0.5,
-3.616247, 2, -7.315051, 1, -0.5, 0.5, 0.5,
-3.616247, 2, -7.315051, 1, 1.5, 0.5, 0.5,
-3.616247, 2, -7.315051, 0, 1.5, 0.5, 0.5,
-3.616247, 3, -7.315051, 0, -0.5, 0.5, 0.5,
-3.616247, 3, -7.315051, 1, -0.5, 0.5, 0.5,
-3.616247, 3, -7.315051, 1, 1.5, 0.5, 0.5,
-3.616247, 3, -7.315051, 0, 1.5, 0.5, 0.5
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
-3.09877, -3.200044, -6,
-3.09877, -3.200044, 4,
-3.09877, -3.200044, -6,
-3.271263, -3.365309, -6,
-3.09877, -3.200044, -4,
-3.271263, -3.365309, -4,
-3.09877, -3.200044, -2,
-3.271263, -3.365309, -2,
-3.09877, -3.200044, 0,
-3.271263, -3.365309, 0,
-3.09877, -3.200044, 2,
-3.271263, -3.365309, 2,
-3.09877, -3.200044, 4,
-3.271263, -3.365309, 4
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
"-6",
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
-3.616247, -3.695838, -6, 0, -0.5, 0.5, 0.5,
-3.616247, -3.695838, -6, 1, -0.5, 0.5, 0.5,
-3.616247, -3.695838, -6, 1, 1.5, 0.5, 0.5,
-3.616247, -3.695838, -6, 0, 1.5, 0.5, 0.5,
-3.616247, -3.695838, -4, 0, -0.5, 0.5, 0.5,
-3.616247, -3.695838, -4, 1, -0.5, 0.5, 0.5,
-3.616247, -3.695838, -4, 1, 1.5, 0.5, 0.5,
-3.616247, -3.695838, -4, 0, 1.5, 0.5, 0.5,
-3.616247, -3.695838, -2, 0, -0.5, 0.5, 0.5,
-3.616247, -3.695838, -2, 1, -0.5, 0.5, 0.5,
-3.616247, -3.695838, -2, 1, 1.5, 0.5, 0.5,
-3.616247, -3.695838, -2, 0, 1.5, 0.5, 0.5,
-3.616247, -3.695838, 0, 0, -0.5, 0.5, 0.5,
-3.616247, -3.695838, 0, 1, -0.5, 0.5, 0.5,
-3.616247, -3.695838, 0, 1, 1.5, 0.5, 0.5,
-3.616247, -3.695838, 0, 0, 1.5, 0.5, 0.5,
-3.616247, -3.695838, 2, 0, -0.5, 0.5, 0.5,
-3.616247, -3.695838, 2, 1, -0.5, 0.5, 0.5,
-3.616247, -3.695838, 2, 1, 1.5, 0.5, 0.5,
-3.616247, -3.695838, 2, 0, 1.5, 0.5, 0.5,
-3.616247, -3.695838, 4, 0, -0.5, 0.5, 0.5,
-3.616247, -3.695838, 4, 1, -0.5, 0.5, 0.5,
-3.616247, -3.695838, 4, 1, 1.5, 0.5, 0.5,
-3.616247, -3.695838, 4, 0, 1.5, 0.5, 0.5
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
-3.09877, -3.200044, -6.396885,
-3.09877, 3.410543, -6.396885,
-3.09877, -3.200044, 5.845322,
-3.09877, 3.410543, 5.845322,
-3.09877, -3.200044, -6.396885,
-3.09877, -3.200044, 5.845322,
-3.09877, 3.410543, -6.396885,
-3.09877, 3.410543, 5.845322,
-3.09877, -3.200044, -6.396885,
3.800921, -3.200044, -6.396885,
-3.09877, -3.200044, 5.845322,
3.800921, -3.200044, 5.845322,
-3.09877, 3.410543, -6.396885,
3.800921, 3.410543, -6.396885,
-3.09877, 3.410543, 5.845322,
3.800921, 3.410543, 5.845322,
3.800921, -3.200044, -6.396885,
3.800921, 3.410543, -6.396885,
3.800921, -3.200044, 5.845322,
3.800921, 3.410543, 5.845322,
3.800921, -3.200044, -6.396885,
3.800921, -3.200044, 5.845322,
3.800921, 3.410543, -6.396885,
3.800921, 3.410543, 5.845322
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
var radius = 8.292655;
var distance = 36.89496;
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
mvMatrix.translate( -0.3510752, -0.1052496, 0.2757819 );
mvMatrix.scale( 1.299505, 1.356337, 0.7323991 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.89496);
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
picolinate_potassium<-read.table("picolinate_potassium.xyz")
```

```
## Error in read.table("picolinate_potassium.xyz"): no lines available in input
```

```r
x<-picolinate_potassium$V2
```

```
## Error in eval(expr, envir, enclos): object 'picolinate_potassium' not found
```

```r
y<-picolinate_potassium$V3
```

```
## Error in eval(expr, envir, enclos): object 'picolinate_potassium' not found
```

```r
z<-picolinate_potassium$V4
```

```
## Error in eval(expr, envir, enclos): object 'picolinate_potassium' not found
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
-2.998289, 1.210067, -2.7272, 0, 0, 1, 1, 1,
-2.915494, -1.206112, -2.792373, 1, 0, 0, 1, 1,
-2.873634, 0.8930155, -2.137115, 1, 0, 0, 1, 1,
-2.796121, -2.072942, -1.587814, 1, 0, 0, 1, 1,
-2.691445, 0.630268, -0.7330742, 1, 0, 0, 1, 1,
-2.620618, -1.665226, -1.726406, 1, 0, 0, 1, 1,
-2.484756, -0.9267837, -1.077986, 0, 0, 0, 1, 1,
-2.470504, -0.7536516, -0.6359211, 0, 0, 0, 1, 1,
-2.274481, 1.283758, -1.140733, 0, 0, 0, 1, 1,
-2.246876, 0.7418265, -1.711643, 0, 0, 0, 1, 1,
-2.188179, -1.373816, -2.534325, 0, 0, 0, 1, 1,
-2.162831, 0.1929878, -1.647912, 0, 0, 0, 1, 1,
-2.158547, -0.01525217, -2.499824, 0, 0, 0, 1, 1,
-2.131131, -1.540368, -2.676306, 1, 1, 1, 1, 1,
-2.102072, 0.1431278, 0.7886726, 1, 1, 1, 1, 1,
-2.100201, -1.04921, -1.808045, 1, 1, 1, 1, 1,
-2.099518, 0.8155922, -1.816356, 1, 1, 1, 1, 1,
-2.043689, -1.538802, -2.400886, 1, 1, 1, 1, 1,
-2.033832, -0.4469544, -1.212821, 1, 1, 1, 1, 1,
-1.988301, 1.300528, -1.544317, 1, 1, 1, 1, 1,
-1.961641, -1.579505, -1.519736, 1, 1, 1, 1, 1,
-1.959983, -1.528437, -3.548677, 1, 1, 1, 1, 1,
-1.954141, -0.5134773, -2.20446, 1, 1, 1, 1, 1,
-1.939921, 0.175678, -1.436886, 1, 1, 1, 1, 1,
-1.928485, 0.9613364, 0.1672631, 1, 1, 1, 1, 1,
-1.896434, 0.7894613, -0.7000096, 1, 1, 1, 1, 1,
-1.871671, -0.03389345, -1.918167, 1, 1, 1, 1, 1,
-1.870825, -1.50425, -3.499575, 1, 1, 1, 1, 1,
-1.857429, 0.1800815, -0.6086138, 0, 0, 1, 1, 1,
-1.849811, 0.8104244, -0.1415261, 1, 0, 0, 1, 1,
-1.847077, 0.5024421, -2.268657, 1, 0, 0, 1, 1,
-1.823283, -0.01869254, -1.845301, 1, 0, 0, 1, 1,
-1.813489, 1.30762, 0.6193079, 1, 0, 0, 1, 1,
-1.803078, 0.5646589, -2.370349, 1, 0, 0, 1, 1,
-1.802391, 0.9847601, -0.8232291, 0, 0, 0, 1, 1,
-1.780268, 0.9058232, 0.536794, 0, 0, 0, 1, 1,
-1.723711, 0.6757648, -0.09785544, 0, 0, 0, 1, 1,
-1.717736, 0.3677368, -1.771564, 0, 0, 0, 1, 1,
-1.706588, 1.107745, -0.2763901, 0, 0, 0, 1, 1,
-1.703493, -1.602288, -1.813385, 0, 0, 0, 1, 1,
-1.698904, 1.69839, -0.3947075, 0, 0, 0, 1, 1,
-1.696353, 0.2009305, -2.844621, 1, 1, 1, 1, 1,
-1.670153, -0.2194051, -0.630916, 1, 1, 1, 1, 1,
-1.663058, 0.3289221, -1.250101, 1, 1, 1, 1, 1,
-1.656486, -0.1519472, -2.73121, 1, 1, 1, 1, 1,
-1.638201, 0.08490048, -1.106477, 1, 1, 1, 1, 1,
-1.634907, 0.265682, -2.423365, 1, 1, 1, 1, 1,
-1.632549, -0.2084163, -1.972674, 1, 1, 1, 1, 1,
-1.631678, 0.8371196, -2.128208, 1, 1, 1, 1, 1,
-1.618447, 0.5054245, -2.42577, 1, 1, 1, 1, 1,
-1.61688, -0.1397533, -1.672208, 1, 1, 1, 1, 1,
-1.601912, 1.049631, -1.60491, 1, 1, 1, 1, 1,
-1.58805, -0.5706109, -1.612623, 1, 1, 1, 1, 1,
-1.588006, 0.7845799, -0.9855724, 1, 1, 1, 1, 1,
-1.577508, 1.555995, 0.8656486, 1, 1, 1, 1, 1,
-1.563964, 0.5998425, -1.183396, 1, 1, 1, 1, 1,
-1.52472, -0.6502545, -0.5085605, 0, 0, 1, 1, 1,
-1.521935, 0.1197658, -2.971618, 1, 0, 0, 1, 1,
-1.513845, 1.40202, -1.643321, 1, 0, 0, 1, 1,
-1.509368, 0.9323229, -1.217472, 1, 0, 0, 1, 1,
-1.507924, -0.3766181, -1.812198, 1, 0, 0, 1, 1,
-1.482568, -1.585403, -1.564093, 1, 0, 0, 1, 1,
-1.481175, 0.423376, -2.668698, 0, 0, 0, 1, 1,
-1.477825, 1.762532, -1.067263, 0, 0, 0, 1, 1,
-1.476443, -0.7767711, -1.598471, 0, 0, 0, 1, 1,
-1.467869, -0.8261014, -3.628443, 0, 0, 0, 1, 1,
-1.466245, 0.2388244, -0.885379, 0, 0, 0, 1, 1,
-1.466021, -1.845912, -3.009345, 0, 0, 0, 1, 1,
-1.465334, -0.7705059, -2.074699, 0, 0, 0, 1, 1,
-1.465183, 0.760588, -2.098263, 1, 1, 1, 1, 1,
-1.460102, -0.2274623, -1.281352, 1, 1, 1, 1, 1,
-1.457016, 0.05971284, -1.199624, 1, 1, 1, 1, 1,
-1.456362, -1.126924, -1.297074, 1, 1, 1, 1, 1,
-1.446612, 1.538558, -0.4130267, 1, 1, 1, 1, 1,
-1.434931, 0.3934968, -2.493424, 1, 1, 1, 1, 1,
-1.429246, 2.204483, -0.8403819, 1, 1, 1, 1, 1,
-1.427403, -0.2525125, -0.9210476, 1, 1, 1, 1, 1,
-1.424783, -0.3377841, -2.068136, 1, 1, 1, 1, 1,
-1.400919, 0.537663, -1.764698, 1, 1, 1, 1, 1,
-1.400516, -1.661263, -1.025736, 1, 1, 1, 1, 1,
-1.392782, -0.04869009, -2.604569, 1, 1, 1, 1, 1,
-1.39214, -0.1895759, -1.495841, 1, 1, 1, 1, 1,
-1.389059, -1.641552, -1.148307, 1, 1, 1, 1, 1,
-1.38408, -0.1030605, -1.556893, 1, 1, 1, 1, 1,
-1.372759, -1.034752, -2.108514, 0, 0, 1, 1, 1,
-1.372499, -0.2621095, -1.998567, 1, 0, 0, 1, 1,
-1.355978, -1.112115, -3.292996, 1, 0, 0, 1, 1,
-1.354423, 1.656509, -0.1323373, 1, 0, 0, 1, 1,
-1.351262, 0.2424782, -2.740314, 1, 0, 0, 1, 1,
-1.323485, -0.6047457, -3.17411, 1, 0, 0, 1, 1,
-1.313421, -0.4380065, -1.762916, 0, 0, 0, 1, 1,
-1.311395, 2.486521, 0.05606205, 0, 0, 0, 1, 1,
-1.306131, -0.9838524, -2.390058, 0, 0, 0, 1, 1,
-1.289665, -0.196646, -2.292108, 0, 0, 0, 1, 1,
-1.279359, 1.06859, 0.07161998, 0, 0, 0, 1, 1,
-1.268988, 1.136757, -0.8600354, 0, 0, 0, 1, 1,
-1.265823, 0.9017116, -1.195995, 0, 0, 0, 1, 1,
-1.261972, 1.475331, 0.1316411, 1, 1, 1, 1, 1,
-1.248306, -0.6130995, -0.647632, 1, 1, 1, 1, 1,
-1.244679, -0.9854434, -2.240527, 1, 1, 1, 1, 1,
-1.237253, -1.434687, -2.308773, 1, 1, 1, 1, 1,
-1.226132, -1.216884, -2.851201, 1, 1, 1, 1, 1,
-1.22227, -1.894041, -3.220612, 1, 1, 1, 1, 1,
-1.221181, -0.2279049, -1.814163, 1, 1, 1, 1, 1,
-1.216831, 0.8687352, -2.307434, 1, 1, 1, 1, 1,
-1.20146, 1.392303, -1.693879, 1, 1, 1, 1, 1,
-1.191969, -1.751842, -3.975475, 1, 1, 1, 1, 1,
-1.188767, -0.3914999, -0.3955972, 1, 1, 1, 1, 1,
-1.188536, 0.4583187, -1.490681, 1, 1, 1, 1, 1,
-1.178396, 0.2461869, -1.211986, 1, 1, 1, 1, 1,
-1.168694, 0.813142, 1.433842, 1, 1, 1, 1, 1,
-1.166884, -0.3493492, -1.566499, 1, 1, 1, 1, 1,
-1.163763, 1.19083, 0.1539964, 0, 0, 1, 1, 1,
-1.16103, -1.270701, -0.546515, 1, 0, 0, 1, 1,
-1.160903, 0.7471917, -2.439653, 1, 0, 0, 1, 1,
-1.160503, -0.7255403, -2.310199, 1, 0, 0, 1, 1,
-1.151748, -0.4069441, -0.1958461, 1, 0, 0, 1, 1,
-1.132036, 0.7330835, -2.129381, 1, 0, 0, 1, 1,
-1.129153, -0.22784, -0.9100542, 0, 0, 0, 1, 1,
-1.125614, -0.534802, -1.398898, 0, 0, 0, 1, 1,
-1.10878, 0.6082967, -1.679955, 0, 0, 0, 1, 1,
-1.107693, 0.1980975, -0.7391779, 0, 0, 0, 1, 1,
-1.102582, -0.5381444, -2.771883, 0, 0, 0, 1, 1,
-1.101421, 0.4522849, -1.025581, 0, 0, 0, 1, 1,
-1.096552, 0.7672077, -1.254318, 0, 0, 0, 1, 1,
-1.091137, -0.06081194, -1.002217, 1, 1, 1, 1, 1,
-1.087952, 1.174757, 0.7473537, 1, 1, 1, 1, 1,
-1.086628, -0.3669482, -1.909326, 1, 1, 1, 1, 1,
-1.083181, -0.2527783, -1.884532, 1, 1, 1, 1, 1,
-1.082699, 0.1465959, -1.902329, 1, 1, 1, 1, 1,
-1.077198, 0.4699464, -0.8811633, 1, 1, 1, 1, 1,
-1.072447, 1.413863, -0.4322603, 1, 1, 1, 1, 1,
-1.069278, -0.1680115, -2.808629, 1, 1, 1, 1, 1,
-1.068621, 2.040337, 0.5583392, 1, 1, 1, 1, 1,
-1.066311, 1.58349, 0.4014945, 1, 1, 1, 1, 1,
-1.063384, -0.5621545, -0.8115278, 1, 1, 1, 1, 1,
-1.062745, 0.03897926, -2.088638, 1, 1, 1, 1, 1,
-1.056068, -0.6305363, -1.308561, 1, 1, 1, 1, 1,
-1.055521, -0.6333353, -4.03645, 1, 1, 1, 1, 1,
-1.05478, 0.3170877, -1.930782, 1, 1, 1, 1, 1,
-1.054547, -0.0921811, -2.522936, 0, 0, 1, 1, 1,
-1.050567, -3.103773, -4.280591, 1, 0, 0, 1, 1,
-1.046961, 0.1177572, -1.120084, 1, 0, 0, 1, 1,
-1.044697, -0.1671941, -3.423387, 1, 0, 0, 1, 1,
-1.04297, 1.006465, -1.425049, 1, 0, 0, 1, 1,
-1.040835, -0.006117324, -1.430928, 1, 0, 0, 1, 1,
-1.040209, 1.382989, -0.4101726, 0, 0, 0, 1, 1,
-1.036963, 0.04153043, -3.98688, 0, 0, 0, 1, 1,
-1.029217, -0.4231843, 0.3322195, 0, 0, 0, 1, 1,
-1.021986, -0.006790455, -0.6431935, 0, 0, 0, 1, 1,
-1.009911, -0.2911003, -2.431562, 0, 0, 0, 1, 1,
-0.9976394, 0.4433983, -2.762151, 0, 0, 0, 1, 1,
-0.9744441, -0.02270172, -0.410075, 0, 0, 0, 1, 1,
-0.9739328, -1.29398, -1.209726, 1, 1, 1, 1, 1,
-0.9706913, -1.200431, -2.472254, 1, 1, 1, 1, 1,
-0.9655678, 0.8368613, -1.341013, 1, 1, 1, 1, 1,
-0.9633434, 0.1885419, -2.200025, 1, 1, 1, 1, 1,
-0.9617988, 1.028605, -1.002395, 1, 1, 1, 1, 1,
-0.9575747, 1.241357, -1.743578, 1, 1, 1, 1, 1,
-0.9496734, 0.4488146, -1.668765, 1, 1, 1, 1, 1,
-0.9486728, -0.8349252, -0.01905442, 1, 1, 1, 1, 1,
-0.9480183, -1.75455, -2.48764, 1, 1, 1, 1, 1,
-0.9478517, 1.256737, -0.4838986, 1, 1, 1, 1, 1,
-0.9473215, 1.420605, -1.217467, 1, 1, 1, 1, 1,
-0.9406199, 1.093081, -1.098856, 1, 1, 1, 1, 1,
-0.9354001, 1.341418, -0.4254001, 1, 1, 1, 1, 1,
-0.932292, 0.7894124, -0.9615166, 1, 1, 1, 1, 1,
-0.9292411, -0.8455583, -4.323538, 1, 1, 1, 1, 1,
-0.9231645, 0.4074044, -1.704941, 0, 0, 1, 1, 1,
-0.9203699, -0.6841112, -1.933038, 1, 0, 0, 1, 1,
-0.9183924, -0.1143852, -0.9835021, 1, 0, 0, 1, 1,
-0.9115745, -0.859984, -2.723584, 1, 0, 0, 1, 1,
-0.8993355, 0.4100856, -1.315274, 1, 0, 0, 1, 1,
-0.8975577, 2.924053, 0.6111836, 1, 0, 0, 1, 1,
-0.897075, -0.2982925, -2.598149, 0, 0, 0, 1, 1,
-0.8954294, 0.1230657, -2.44771, 0, 0, 0, 1, 1,
-0.894439, 0.8113983, -0.2879882, 0, 0, 0, 1, 1,
-0.8936477, -0.7873194, -2.226613, 0, 0, 0, 1, 1,
-0.8911821, 1.558208, -0.7013509, 0, 0, 0, 1, 1,
-0.8880367, -0.3543111, -1.66887, 0, 0, 0, 1, 1,
-0.8823585, 0.9982327, -1.820873, 0, 0, 0, 1, 1,
-0.879274, -0.2100104, 0.679549, 1, 1, 1, 1, 1,
-0.8792444, -0.1004393, -3.096478, 1, 1, 1, 1, 1,
-0.8783973, -0.3374237, -2.226823, 1, 1, 1, 1, 1,
-0.8768002, -2.435179, -2.886893, 1, 1, 1, 1, 1,
-0.8747118, -1.11592, -1.719414, 1, 1, 1, 1, 1,
-0.8731847, -0.5484814, -2.129774, 1, 1, 1, 1, 1,
-0.8687122, -0.5557262, -3.040119, 1, 1, 1, 1, 1,
-0.8650231, -0.4519667, -2.079172, 1, 1, 1, 1, 1,
-0.8629798, 0.4157522, -1.790892, 1, 1, 1, 1, 1,
-0.8603955, 1.079826, -1.429711, 1, 1, 1, 1, 1,
-0.8567555, -1.234065, -2.460618, 1, 1, 1, 1, 1,
-0.8549584, -0.9251894, -2.353473, 1, 1, 1, 1, 1,
-0.8481218, 0.8474537, 0.6903659, 1, 1, 1, 1, 1,
-0.847738, 2.265448, -0.5421419, 1, 1, 1, 1, 1,
-0.8470503, 1.729895, -0.5999641, 1, 1, 1, 1, 1,
-0.8431736, -0.7723315, -0.9197845, 0, 0, 1, 1, 1,
-0.8406616, -0.1071484, -0.8832916, 1, 0, 0, 1, 1,
-0.8381662, -0.6806601, -5.36034, 1, 0, 0, 1, 1,
-0.8337111, 1.307465, -0.4322107, 1, 0, 0, 1, 1,
-0.8329239, -1.291908, -2.042286, 1, 0, 0, 1, 1,
-0.8315302, -0.5855469, -1.969861, 1, 0, 0, 1, 1,
-0.8270735, 0.2237152, -1.081556, 0, 0, 0, 1, 1,
-0.8260562, 0.1964287, -0.3347329, 0, 0, 0, 1, 1,
-0.8103049, -1.030622, -1.779876, 0, 0, 0, 1, 1,
-0.8087956, 1.067919, -1.533402, 0, 0, 0, 1, 1,
-0.800752, -0.4894726, -2.79379, 0, 0, 0, 1, 1,
-0.8000748, 1.185124, -2.095725, 0, 0, 0, 1, 1,
-0.796504, -2.293289, -2.961605, 0, 0, 0, 1, 1,
-0.7952455, -0.03945357, -2.90616, 1, 1, 1, 1, 1,
-0.7873486, -1.455194, -1.181691, 1, 1, 1, 1, 1,
-0.7837885, -1.160036, -1.649977, 1, 1, 1, 1, 1,
-0.7809211, -0.8123084, -1.166578, 1, 1, 1, 1, 1,
-0.7768237, 1.342526, -1.996539, 1, 1, 1, 1, 1,
-0.7764791, -0.4648686, -3.165162, 1, 1, 1, 1, 1,
-0.7763134, 0.8420789, -0.4908272, 1, 1, 1, 1, 1,
-0.7695371, -1.302594, -3.073852, 1, 1, 1, 1, 1,
-0.765182, -0.6433864, -1.913523, 1, 1, 1, 1, 1,
-0.764236, -1.610595, -3.830611, 1, 1, 1, 1, 1,
-0.7641515, -0.1521188, -1.147583, 1, 1, 1, 1, 1,
-0.7576048, -2.046071, -2.669114, 1, 1, 1, 1, 1,
-0.7574242, -0.1097141, -1.687185, 1, 1, 1, 1, 1,
-0.7519951, 1.660842, -0.4305281, 1, 1, 1, 1, 1,
-0.7452238, -0.1530655, -1.409512, 1, 1, 1, 1, 1,
-0.7448702, -0.9112626, -1.681051, 0, 0, 1, 1, 1,
-0.7429579, -0.4532756, -2.141113, 1, 0, 0, 1, 1,
-0.7378613, -2.196806, -3.07222, 1, 0, 0, 1, 1,
-0.7360002, 0.6146071, -1.343616, 1, 0, 0, 1, 1,
-0.7340794, 0.2632339, -0.9536321, 1, 0, 0, 1, 1,
-0.7300853, 0.6726549, -1.392859, 1, 0, 0, 1, 1,
-0.7271379, -0.4860374, -2.620258, 0, 0, 0, 1, 1,
-0.7271364, -0.07133517, -0.7564219, 0, 0, 0, 1, 1,
-0.7261173, -0.2199494, -3.533732, 0, 0, 0, 1, 1,
-0.7210499, -2.12344, -1.15716, 0, 0, 0, 1, 1,
-0.7148372, -1.005661, -3.854154, 0, 0, 0, 1, 1,
-0.7125169, -1.400535, -0.7304112, 0, 0, 0, 1, 1,
-0.7102088, -0.1738255, -2.042688, 0, 0, 0, 1, 1,
-0.709926, -1.426811, -1.099262, 1, 1, 1, 1, 1,
-0.6879428, 0.01375748, -3.713487, 1, 1, 1, 1, 1,
-0.6872016, 1.393818, 0.2901513, 1, 1, 1, 1, 1,
-0.6799937, -0.2070499, -1.429599, 1, 1, 1, 1, 1,
-0.6792265, 2.039096, 0.8113944, 1, 1, 1, 1, 1,
-0.6748747, 1.97653, -1.136887, 1, 1, 1, 1, 1,
-0.6739848, -2.238036, -2.634524, 1, 1, 1, 1, 1,
-0.67264, -0.6105476, -1.527604, 1, 1, 1, 1, 1,
-0.6698733, -1.076693, -4.989355, 1, 1, 1, 1, 1,
-0.6690221, -0.7555168, -1.924941, 1, 1, 1, 1, 1,
-0.6642424, -0.09602971, -1.927986, 1, 1, 1, 1, 1,
-0.655866, -0.4803061, -1.65069, 1, 1, 1, 1, 1,
-0.6474445, 0.1886808, -1.874466, 1, 1, 1, 1, 1,
-0.645091, 1.105785, 0.003214971, 1, 1, 1, 1, 1,
-0.6436078, -0.3821864, -1.883737, 1, 1, 1, 1, 1,
-0.6392131, 0.4062513, -0.02543893, 0, 0, 1, 1, 1,
-0.6386797, -1.452441, -2.211438, 1, 0, 0, 1, 1,
-0.6349543, -0.3280993, -2.617844, 1, 0, 0, 1, 1,
-0.6337662, 0.1256432, 0.6700752, 1, 0, 0, 1, 1,
-0.633082, -1.288299, -0.7495303, 1, 0, 0, 1, 1,
-0.6306271, 1.637994, -0.7726283, 1, 0, 0, 1, 1,
-0.6261194, 0.1657432, -0.4431003, 0, 0, 0, 1, 1,
-0.6246175, 0.6769807, -1.527827, 0, 0, 0, 1, 1,
-0.6199048, 0.7722656, -1.701053, 0, 0, 0, 1, 1,
-0.6096063, -0.384154, -2.658247, 0, 0, 0, 1, 1,
-0.6090644, 1.278238, -0.4053297, 0, 0, 0, 1, 1,
-0.6051947, 0.1747254, -1.661716, 0, 0, 0, 1, 1,
-0.6028611, -0.9541792, -2.509639, 0, 0, 0, 1, 1,
-0.5908064, -0.1312873, 0.1228931, 1, 1, 1, 1, 1,
-0.5880803, 1.978736, -1.56433, 1, 1, 1, 1, 1,
-0.5861989, -0.7477694, -3.595022, 1, 1, 1, 1, 1,
-0.5755169, 1.342168, -2.459621, 1, 1, 1, 1, 1,
-0.572764, -0.9368762, -0.8341119, 1, 1, 1, 1, 1,
-0.5648896, 1.155606, 0.005901249, 1, 1, 1, 1, 1,
-0.5608755, 1.172827, -0.8705755, 1, 1, 1, 1, 1,
-0.5606771, 0.009175119, -1.567076, 1, 1, 1, 1, 1,
-0.5590556, -2.228919, -2.587699, 1, 1, 1, 1, 1,
-0.5570152, 0.8320888, -1.035217, 1, 1, 1, 1, 1,
-0.5488799, -0.1552815, -2.282434, 1, 1, 1, 1, 1,
-0.5468711, 0.6722597, -1.691836, 1, 1, 1, 1, 1,
-0.546828, 0.2023849, -1.533759, 1, 1, 1, 1, 1,
-0.5464934, -0.001479047, -2.360813, 1, 1, 1, 1, 1,
-0.542725, 0.5469678, -0.8913099, 1, 1, 1, 1, 1,
-0.5396975, 0.9355439, -1.359155, 0, 0, 1, 1, 1,
-0.5378048, -0.9592522, -3.070349, 1, 0, 0, 1, 1,
-0.5375516, 1.437867, -1.63415, 1, 0, 0, 1, 1,
-0.5360608, 0.5815166, -2.48517, 1, 0, 0, 1, 1,
-0.5321269, -0.2235158, -1.553992, 1, 0, 0, 1, 1,
-0.5294471, -0.587092, -3.542276, 1, 0, 0, 1, 1,
-0.5286844, 0.1574944, -0.8019658, 0, 0, 0, 1, 1,
-0.526396, -0.3518386, -3.374675, 0, 0, 0, 1, 1,
-0.5241109, -1.128996, -3.662428, 0, 0, 0, 1, 1,
-0.5239536, 1.952431, 0.7264413, 0, 0, 0, 1, 1,
-0.5163725, -0.3428414, -2.045825, 0, 0, 0, 1, 1,
-0.5044935, 2.343161, -0.3945352, 0, 0, 0, 1, 1,
-0.5029376, 1.182286, -0.7038005, 0, 0, 0, 1, 1,
-0.5021578, -1.311754, -2.201284, 1, 1, 1, 1, 1,
-0.4993305, -1.308603, -2.697434, 1, 1, 1, 1, 1,
-0.4970277, -1.682476, -3.504292, 1, 1, 1, 1, 1,
-0.4965942, -0.3842327, -2.666933, 1, 1, 1, 1, 1,
-0.4906654, 1.488785, -1.52634, 1, 1, 1, 1, 1,
-0.489615, 0.1978251, -0.9756888, 1, 1, 1, 1, 1,
-0.4850809, 0.3368238, 0.3089043, 1, 1, 1, 1, 1,
-0.4822117, 0.6946598, -0.2342258, 1, 1, 1, 1, 1,
-0.477924, -0.4534642, -3.502858, 1, 1, 1, 1, 1,
-0.469766, 0.86926, -0.5615007, 1, 1, 1, 1, 1,
-0.4528845, -0.6046033, -2.078437, 1, 1, 1, 1, 1,
-0.4479201, -1.112335, -2.768285, 1, 1, 1, 1, 1,
-0.446913, 0.9782016, 1.145755, 1, 1, 1, 1, 1,
-0.4450786, 0.2180244, -2.360837, 1, 1, 1, 1, 1,
-0.4434769, 0.08063685, -0.7156204, 1, 1, 1, 1, 1,
-0.440647, -1.05649, -3.218026, 0, 0, 1, 1, 1,
-0.4392735, 1.36528, -0.9574693, 1, 0, 0, 1, 1,
-0.4366366, 1.932118, -0.8427429, 1, 0, 0, 1, 1,
-0.4297222, -0.0477347, -3.381491, 1, 0, 0, 1, 1,
-0.4280551, -0.2212091, -0.1764587, 1, 0, 0, 1, 1,
-0.4277203, 1.233023, 0.07547388, 1, 0, 0, 1, 1,
-0.4251848, -0.5774692, -1.719688, 0, 0, 0, 1, 1,
-0.4179892, 1.597181, -0.8591648, 0, 0, 0, 1, 1,
-0.415626, 0.2993037, -0.6482382, 0, 0, 0, 1, 1,
-0.4047376, 0.2015171, -2.635069, 0, 0, 0, 1, 1,
-0.4010858, 0.6438377, -0.9319952, 0, 0, 0, 1, 1,
-0.3993763, 0.1813229, -2.392649, 0, 0, 0, 1, 1,
-0.3973621, -1.2793, -2.825787, 0, 0, 0, 1, 1,
-0.3963112, 1.039738, -1.602511, 1, 1, 1, 1, 1,
-0.3962351, -0.972635, -2.269239, 1, 1, 1, 1, 1,
-0.3863945, -0.379012, -2.159698, 1, 1, 1, 1, 1,
-0.3859067, 0.282697, -1.874614, 1, 1, 1, 1, 1,
-0.3840111, 0.580682, 0.966079, 1, 1, 1, 1, 1,
-0.3819147, -0.4250438, -2.793537, 1, 1, 1, 1, 1,
-0.3794186, -0.2740543, -1.561627, 1, 1, 1, 1, 1,
-0.3776973, -0.3720271, -3.27077, 1, 1, 1, 1, 1,
-0.3764732, 0.2392801, -0.06827352, 1, 1, 1, 1, 1,
-0.3732756, 0.4780124, -0.7118478, 1, 1, 1, 1, 1,
-0.3674368, -0.6278135, -1.496521, 1, 1, 1, 1, 1,
-0.3673655, 0.9017533, -0.886203, 1, 1, 1, 1, 1,
-0.3646012, 0.3021408, 0.02127262, 1, 1, 1, 1, 1,
-0.3603663, -0.5136878, -2.615895, 1, 1, 1, 1, 1,
-0.3601858, 0.3932506, -0.4860985, 1, 1, 1, 1, 1,
-0.3563668, -1.962042, -3.296821, 0, 0, 1, 1, 1,
-0.3540532, -1.129739, -6.218601, 1, 0, 0, 1, 1,
-0.3536023, -1.159926, -1.346322, 1, 0, 0, 1, 1,
-0.3491587, 0.3318936, 1.129942, 1, 0, 0, 1, 1,
-0.3474, -0.1126384, -1.532315, 1, 0, 0, 1, 1,
-0.3470229, -0.2124754, -3.615152, 1, 0, 0, 1, 1,
-0.3378635, -0.3396029, -3.009314, 0, 0, 0, 1, 1,
-0.3371607, 0.5017629, -1.505616, 0, 0, 0, 1, 1,
-0.3365262, -0.3407351, -1.351075, 0, 0, 0, 1, 1,
-0.3315277, 0.1908429, -1.661572, 0, 0, 0, 1, 1,
-0.3315106, 0.06865993, -1.179154, 0, 0, 0, 1, 1,
-0.331454, 0.2045956, -0.01351675, 0, 0, 0, 1, 1,
-0.3297613, -1.088239, -1.260086, 0, 0, 0, 1, 1,
-0.3288202, 1.569478, 0.002550645, 1, 1, 1, 1, 1,
-0.3229512, -0.02035731, -1.411083, 1, 1, 1, 1, 1,
-0.3199593, 1.624676, -0.7626101, 1, 1, 1, 1, 1,
-0.3190542, -0.7266477, -3.617984, 1, 1, 1, 1, 1,
-0.3180408, 1.341603, 0.09244397, 1, 1, 1, 1, 1,
-0.3169287, 0.03532824, -0.6755134, 1, 1, 1, 1, 1,
-0.3162588, 0.4417903, -0.05721967, 1, 1, 1, 1, 1,
-0.3136806, -0.8770457, -3.538575, 1, 1, 1, 1, 1,
-0.3127649, -1.009416, -3.021049, 1, 1, 1, 1, 1,
-0.3110906, 0.05798595, -2.241366, 1, 1, 1, 1, 1,
-0.3092122, -0.8499941, -2.420303, 1, 1, 1, 1, 1,
-0.3058918, 1.608386, 0.7557743, 1, 1, 1, 1, 1,
-0.3056951, 1.141828, 0.7074004, 1, 1, 1, 1, 1,
-0.3054228, -0.3729927, -2.690697, 1, 1, 1, 1, 1,
-0.2990329, 2.478341, -0.616216, 1, 1, 1, 1, 1,
-0.2978311, -1.201272, -2.601753, 0, 0, 1, 1, 1,
-0.2977891, 1.414407, -0.02882203, 1, 0, 0, 1, 1,
-0.2972142, 1.725359, -0.07905497, 1, 0, 0, 1, 1,
-0.2901199, 0.03127778, -2.504944, 1, 0, 0, 1, 1,
-0.2821501, 0.09313168, -1.812003, 1, 0, 0, 1, 1,
-0.2794477, -0.824402, -1.480604, 1, 0, 0, 1, 1,
-0.274167, 0.4545227, -0.1243033, 0, 0, 0, 1, 1,
-0.2739968, -2.677327, -5.216843, 0, 0, 0, 1, 1,
-0.2726168, -0.08842088, -2.346189, 0, 0, 0, 1, 1,
-0.2725314, -0.8693965, -1.018545, 0, 0, 0, 1, 1,
-0.271833, 0.5009734, 1.357726, 0, 0, 0, 1, 1,
-0.2710055, -1.701755, -3.244848, 0, 0, 0, 1, 1,
-0.2705809, 0.7960989, 0.7597553, 0, 0, 0, 1, 1,
-0.2657329, -0.7124541, -2.705561, 1, 1, 1, 1, 1,
-0.2653381, -1.763271, -2.113416, 1, 1, 1, 1, 1,
-0.2626765, -0.6622024, -2.148303, 1, 1, 1, 1, 1,
-0.2618085, 0.9151475, -0.06486306, 1, 1, 1, 1, 1,
-0.2573679, -0.01528208, 0.3893049, 1, 1, 1, 1, 1,
-0.2558909, 1.55206, 0.8890817, 1, 1, 1, 1, 1,
-0.2531597, 0.6324026, -0.8054357, 1, 1, 1, 1, 1,
-0.2511711, -0.5605028, -2.470668, 1, 1, 1, 1, 1,
-0.2412848, -0.9118612, -2.055035, 1, 1, 1, 1, 1,
-0.237843, 0.728647, -0.490649, 1, 1, 1, 1, 1,
-0.2316135, 1.428039, 1.03715, 1, 1, 1, 1, 1,
-0.230777, -0.7081091, -1.725037, 1, 1, 1, 1, 1,
-0.2296842, -0.07196524, -1.572969, 1, 1, 1, 1, 1,
-0.2276487, 2.561651, 0.03689966, 1, 1, 1, 1, 1,
-0.2261172, -0.06735348, -2.668981, 1, 1, 1, 1, 1,
-0.2058101, -2.159187, -3.991922, 0, 0, 1, 1, 1,
-0.2050248, 0.4112176, -0.4846122, 1, 0, 0, 1, 1,
-0.2023254, 1.46254, 0.9203308, 1, 0, 0, 1, 1,
-0.2012536, 1.963184, -1.011261, 1, 0, 0, 1, 1,
-0.2010719, 0.5243134, 0.6711728, 1, 0, 0, 1, 1,
-0.1978535, 1.246771, 0.2604609, 1, 0, 0, 1, 1,
-0.1970429, 1.015979, -0.5643142, 0, 0, 0, 1, 1,
-0.196908, 0.5240326, 0.5926794, 0, 0, 0, 1, 1,
-0.1903944, 1.077474, -0.9579173, 0, 0, 0, 1, 1,
-0.1893261, 0.02190442, -2.734444, 0, 0, 0, 1, 1,
-0.1885708, 1.227741, -0.3557732, 0, 0, 0, 1, 1,
-0.1878788, -1.830551, -2.395809, 0, 0, 0, 1, 1,
-0.1866805, 1.151314, 0.5965475, 0, 0, 0, 1, 1,
-0.1853646, 0.7502851, 1.554838, 1, 1, 1, 1, 1,
-0.1852732, -0.1145035, -3.690283, 1, 1, 1, 1, 1,
-0.1849814, 0.5219901, -0.6081412, 1, 1, 1, 1, 1,
-0.1849161, 0.2578307, -1.131472, 1, 1, 1, 1, 1,
-0.1847705, 0.09301195, -1.187946, 1, 1, 1, 1, 1,
-0.1843782, -0.4916519, -3.156817, 1, 1, 1, 1, 1,
-0.1781484, 1.068218, 0.4615658, 1, 1, 1, 1, 1,
-0.1766089, 0.2307624, -0.103713, 1, 1, 1, 1, 1,
-0.1755118, 0.011829, -2.21424, 1, 1, 1, 1, 1,
-0.1718018, 0.4607595, -1.186024, 1, 1, 1, 1, 1,
-0.1699973, -1.516096, -4.367889, 1, 1, 1, 1, 1,
-0.1674995, 0.4873894, 0.2940248, 1, 1, 1, 1, 1,
-0.1670562, -0.6287857, -3.700834, 1, 1, 1, 1, 1,
-0.1651203, 1.068409, -0.2395516, 1, 1, 1, 1, 1,
-0.1618138, -0.3994164, -5.55503, 1, 1, 1, 1, 1,
-0.1589865, -0.903792, -3.485892, 0, 0, 1, 1, 1,
-0.1553081, 0.5394603, 1.786113, 1, 0, 0, 1, 1,
-0.1481289, -0.02651481, -0.4043608, 1, 0, 0, 1, 1,
-0.1425349, 0.5025538, -0.4931181, 1, 0, 0, 1, 1,
-0.1400419, 0.1242731, -1.24922, 1, 0, 0, 1, 1,
-0.1359738, 0.4765787, 1.364533, 1, 0, 0, 1, 1,
-0.1311649, 0.6832942, 1.09368, 0, 0, 0, 1, 1,
-0.1298703, 1.081247, -0.3241416, 0, 0, 0, 1, 1,
-0.1297577, -1.282648, -3.069654, 0, 0, 0, 1, 1,
-0.12849, -2.679064, -2.661416, 0, 0, 0, 1, 1,
-0.1252302, 0.8848776, -1.607625, 0, 0, 0, 1, 1,
-0.1249511, 1.126515, -0.6070288, 0, 0, 0, 1, 1,
-0.1241024, -0.6072083, -3.120344, 0, 0, 0, 1, 1,
-0.1060054, -0.08788354, -3.0602, 1, 1, 1, 1, 1,
-0.1009867, -1.483039, -2.654781, 1, 1, 1, 1, 1,
-0.09842773, -0.9025887, -3.29107, 1, 1, 1, 1, 1,
-0.09633251, -0.7076775, -4.728418, 1, 1, 1, 1, 1,
-0.09188589, -1.953058, -2.00018, 1, 1, 1, 1, 1,
-0.09179576, -0.8188646, -3.292257, 1, 1, 1, 1, 1,
-0.08759005, 0.5323243, 0.2232279, 1, 1, 1, 1, 1,
-0.08113641, 1.420668, 1.590842, 1, 1, 1, 1, 1,
-0.07681518, 0.4437328, -0.2908819, 1, 1, 1, 1, 1,
-0.07498746, -0.3848507, -3.260811, 1, 1, 1, 1, 1,
-0.07343435, 0.19855, -0.4434269, 1, 1, 1, 1, 1,
-0.07034039, -0.02463794, -2.006988, 1, 1, 1, 1, 1,
-0.06861175, -1.473947, -4.261183, 1, 1, 1, 1, 1,
-0.06799547, 0.3452801, 0.9820329, 1, 1, 1, 1, 1,
-0.06406009, 0.4842741, -0.5007151, 1, 1, 1, 1, 1,
-0.06360959, 0.7235914, 1.643861, 0, 0, 1, 1, 1,
-0.05968931, -0.2440569, -3.079405, 1, 0, 0, 1, 1,
-0.05513795, 0.2932789, -0.3106726, 1, 0, 0, 1, 1,
-0.0503408, -0.9245626, -3.398374, 1, 0, 0, 1, 1,
-0.04639231, -1.307081, -3.239529, 1, 0, 0, 1, 1,
-0.04389339, -1.096624, -3.403954, 1, 0, 0, 1, 1,
-0.04386284, -0.1140101, -3.607674, 0, 0, 0, 1, 1,
-0.04308499, 1.849055, 0.3722245, 0, 0, 0, 1, 1,
-0.04262505, -0.5608279, -3.437364, 0, 0, 0, 1, 1,
-0.03987554, -1.555069, -2.787561, 0, 0, 0, 1, 1,
-0.03870051, 0.4117309, -1.09415, 0, 0, 0, 1, 1,
-0.03613504, -0.04962835, -4.94463, 0, 0, 0, 1, 1,
-0.03592082, -0.915917, -2.008389, 0, 0, 0, 1, 1,
-0.03262743, 1.821098, 1.142898, 1, 1, 1, 1, 1,
-0.03098665, -0.3985535, -3.613392, 1, 1, 1, 1, 1,
-0.03047739, -0.5325208, -3.409421, 1, 1, 1, 1, 1,
-0.02775817, 0.7487196, 1.228742, 1, 1, 1, 1, 1,
-0.027313, -0.1983751, -4.637139, 1, 1, 1, 1, 1,
-0.02671067, -0.269565, -3.077729, 1, 1, 1, 1, 1,
-0.0241063, -0.02467259, -4.217914, 1, 1, 1, 1, 1,
-0.02282984, -1.222886, -2.93192, 1, 1, 1, 1, 1,
-0.02129933, 0.1177141, -1.166514, 1, 1, 1, 1, 1,
-0.02049717, 0.02358872, 1.801188, 1, 1, 1, 1, 1,
-0.02000835, -0.4117351, -3.481564, 1, 1, 1, 1, 1,
-0.01529986, 0.6102253, 1.543249, 1, 1, 1, 1, 1,
-0.01036476, -0.1213146, -3.791476, 1, 1, 1, 1, 1,
-0.002859973, -1.663168, -0.5561146, 1, 1, 1, 1, 1,
0.003162686, 1.516024, -2.03147, 1, 1, 1, 1, 1,
0.004243131, 0.95837, 1.289345, 0, 0, 1, 1, 1,
0.005670194, -0.9490179, 2.467704, 1, 0, 0, 1, 1,
0.006829599, -2.003256, 2.706211, 1, 0, 0, 1, 1,
0.007170685, 0.3043442, 0.3179108, 1, 0, 0, 1, 1,
0.008613722, 0.7465335, 0.7093887, 1, 0, 0, 1, 1,
0.01248431, 1.374995, 0.4359827, 1, 0, 0, 1, 1,
0.01454518, 1.301996, -0.2679102, 0, 0, 0, 1, 1,
0.01613232, -0.5044618, 2.615006, 0, 0, 0, 1, 1,
0.0169459, -1.429118, 3.89849, 0, 0, 0, 1, 1,
0.01853789, 0.1524297, 0.868169, 0, 0, 0, 1, 1,
0.01951705, -0.03270664, 2.837165, 0, 0, 0, 1, 1,
0.02208004, -0.1285538, 2.218276, 0, 0, 0, 1, 1,
0.02615488, -0.6132573, 1.082504, 0, 0, 0, 1, 1,
0.02671183, -0.1096962, 3.386276, 1, 1, 1, 1, 1,
0.03849418, 1.016966, -0.03456812, 1, 1, 1, 1, 1,
0.03919198, -1.59749, 1.514071, 1, 1, 1, 1, 1,
0.03953329, -1.573637, 4.831346, 1, 1, 1, 1, 1,
0.04488762, 0.8292951, -0.6484194, 1, 1, 1, 1, 1,
0.04634427, -0.3984535, 2.488123, 1, 1, 1, 1, 1,
0.04832277, 0.4054425, -0.3743261, 1, 1, 1, 1, 1,
0.05126703, -0.1148274, 3.425477, 1, 1, 1, 1, 1,
0.05195671, 0.06667057, 1.972643, 1, 1, 1, 1, 1,
0.05248884, 0.6021293, 1.645576, 1, 1, 1, 1, 1,
0.05362642, 0.6948759, 0.09784172, 1, 1, 1, 1, 1,
0.0549291, 1.177505, -0.7024775, 1, 1, 1, 1, 1,
0.05866628, 0.5247064, 0.4755357, 1, 1, 1, 1, 1,
0.05916047, -0.2116912, 1.505938, 1, 1, 1, 1, 1,
0.06139265, 2.561805, 0.1536211, 1, 1, 1, 1, 1,
0.06181264, 0.5922947, 1.25782, 0, 0, 1, 1, 1,
0.06438256, -1.059792, 2.274111, 1, 0, 0, 1, 1,
0.06556106, 0.09911682, -0.3620672, 1, 0, 0, 1, 1,
0.0678267, -0.3577175, 3.537084, 1, 0, 0, 1, 1,
0.07137263, 0.03091839, 0.9881687, 1, 0, 0, 1, 1,
0.07160963, -0.7202007, 2.641679, 1, 0, 0, 1, 1,
0.07803039, 2.043447, -0.4987498, 0, 0, 0, 1, 1,
0.08456177, 0.5301006, 1.229664, 0, 0, 0, 1, 1,
0.08619314, -0.4311307, 2.482192, 0, 0, 0, 1, 1,
0.08840976, 1.176067, 0.3557362, 0, 0, 0, 1, 1,
0.08908772, 1.792502, -0.9675241, 0, 0, 0, 1, 1,
0.0959566, -2.250854, 2.595198, 0, 0, 0, 1, 1,
0.09751235, -0.6016526, 3.644104, 0, 0, 0, 1, 1,
0.09793704, -0.5863843, 3.169253, 1, 1, 1, 1, 1,
0.0991008, 1.528982, 0.9483427, 1, 1, 1, 1, 1,
0.1002304, 0.262455, -0.5491943, 1, 1, 1, 1, 1,
0.1020199, -0.1937084, 1.390322, 1, 1, 1, 1, 1,
0.102799, -0.2506281, 2.414898, 1, 1, 1, 1, 1,
0.1138317, -0.9496924, 3.498446, 1, 1, 1, 1, 1,
0.114444, 0.8580858, 0.4010924, 1, 1, 1, 1, 1,
0.1144913, 0.1094177, -0.0495254, 1, 1, 1, 1, 1,
0.1151754, 0.1106289, 0.6562436, 1, 1, 1, 1, 1,
0.118804, -1.412462, 3.226434, 1, 1, 1, 1, 1,
0.1196022, 1.549029, 0.04550532, 1, 1, 1, 1, 1,
0.122677, 0.9360108, 1.78502, 1, 1, 1, 1, 1,
0.1234554, -0.2671517, 3.515406, 1, 1, 1, 1, 1,
0.1255672, 0.8802493, -1.92609, 1, 1, 1, 1, 1,
0.1286831, -1.32116, 3.929955, 1, 1, 1, 1, 1,
0.1289082, -0.06147576, 4.83234, 0, 0, 1, 1, 1,
0.1289833, -0.5400895, 3.935567, 1, 0, 0, 1, 1,
0.1303354, 0.4917341, -0.7922578, 1, 0, 0, 1, 1,
0.1407456, -0.8807666, 2.343219, 1, 0, 0, 1, 1,
0.1434588, -0.7090576, 3.104491, 1, 0, 0, 1, 1,
0.1474323, -0.196433, 3.509532, 1, 0, 0, 1, 1,
0.1517914, -0.8986659, 2.028646, 0, 0, 0, 1, 1,
0.1543178, -0.5836504, 2.58336, 0, 0, 0, 1, 1,
0.1566137, 0.364734, -0.06989507, 0, 0, 0, 1, 1,
0.1578957, 2.279255, 0.22717, 0, 0, 0, 1, 1,
0.1594549, 0.7043707, 0.9199753, 0, 0, 0, 1, 1,
0.1607189, 0.8448544, 0.1105618, 0, 0, 0, 1, 1,
0.1618433, 0.6110981, 0.7973304, 0, 0, 0, 1, 1,
0.1654043, 3.314272, 2.643134, 1, 1, 1, 1, 1,
0.1667184, -0.01118088, 2.061035, 1, 1, 1, 1, 1,
0.1718742, 2.032439, -2.303491, 1, 1, 1, 1, 1,
0.1734359, -0.3201501, 2.540233, 1, 1, 1, 1, 1,
0.1765879, -0.8832283, 1.827478, 1, 1, 1, 1, 1,
0.1773638, 0.2057581, -0.2504525, 1, 1, 1, 1, 1,
0.1775189, 1.197699, 0.6857892, 1, 1, 1, 1, 1,
0.1785441, 0.5491146, 0.140194, 1, 1, 1, 1, 1,
0.1836552, 0.5680346, 0.4105036, 1, 1, 1, 1, 1,
0.1845134, -0.9330443, 1.699067, 1, 1, 1, 1, 1,
0.185711, 0.3388995, 0.2780639, 1, 1, 1, 1, 1,
0.1891344, 1.357305, -0.2611256, 1, 1, 1, 1, 1,
0.1901215, 0.3033469, 0.9100801, 1, 1, 1, 1, 1,
0.1933724, 0.7211146, 0.2816065, 1, 1, 1, 1, 1,
0.2028501, -0.8958839, 2.143818, 1, 1, 1, 1, 1,
0.2064639, -1.193192, 3.450675, 0, 0, 1, 1, 1,
0.2068304, 0.932907, 1.571699, 1, 0, 0, 1, 1,
0.2076388, -0.1393803, 1.422059, 1, 0, 0, 1, 1,
0.2088743, -0.6828839, 3.109077, 1, 0, 0, 1, 1,
0.2090226, -1.067083, 1.317793, 1, 0, 0, 1, 1,
0.2091814, -0.2706787, 0.8856368, 1, 0, 0, 1, 1,
0.2107592, -0.7934137, 2.838723, 0, 0, 0, 1, 1,
0.2116952, 1.179215, -1.253337, 0, 0, 0, 1, 1,
0.2118264, 0.1181588, 1.671713, 0, 0, 0, 1, 1,
0.2129656, -1.374185, 2.224933, 0, 0, 0, 1, 1,
0.2159155, 0.5542654, 1.804025, 0, 0, 0, 1, 1,
0.2165358, -0.622206, 1.671213, 0, 0, 0, 1, 1,
0.222767, 0.5138535, 1.791089, 0, 0, 0, 1, 1,
0.2266799, -1.281384, 3.040476, 1, 1, 1, 1, 1,
0.2289337, 0.8360406, 0.6468171, 1, 1, 1, 1, 1,
0.2294651, -0.477093, 2.530206, 1, 1, 1, 1, 1,
0.2298601, -1.417298, 1.121789, 1, 1, 1, 1, 1,
0.2305383, 0.2990644, 0.2060559, 1, 1, 1, 1, 1,
0.2307678, -1.494697, 2.186393, 1, 1, 1, 1, 1,
0.231599, 0.2441507, 0.3601705, 1, 1, 1, 1, 1,
0.2323129, 1.283658, -0.3973714, 1, 1, 1, 1, 1,
0.232543, -0.1533247, 1.466225, 1, 1, 1, 1, 1,
0.241063, 1.577129, -0.1597141, 1, 1, 1, 1, 1,
0.2445554, 0.09661771, 0.3279224, 1, 1, 1, 1, 1,
0.2463425, 1.563003, 1.385989, 1, 1, 1, 1, 1,
0.2486439, -0.4305066, 2.813493, 1, 1, 1, 1, 1,
0.2490391, -0.7444466, 3.759243, 1, 1, 1, 1, 1,
0.2492621, 0.3478372, 0.07906721, 1, 1, 1, 1, 1,
0.251578, 2.767532, -0.4061942, 0, 0, 1, 1, 1,
0.2681617, -0.870055, 3.933966, 1, 0, 0, 1, 1,
0.2691133, 0.4915197, 0.7588609, 1, 0, 0, 1, 1,
0.2721939, 1.502606, 0.348204, 1, 0, 0, 1, 1,
0.2767719, 1.021907, 0.235511, 1, 0, 0, 1, 1,
0.2772716, -0.09838304, 3.310255, 1, 0, 0, 1, 1,
0.2825544, -0.8939956, 3.178561, 0, 0, 0, 1, 1,
0.2881911, -0.01912827, 2.845958, 0, 0, 0, 1, 1,
0.2886295, 1.70233, -0.4715929, 0, 0, 0, 1, 1,
0.290868, -1.479449, 3.949296, 0, 0, 0, 1, 1,
0.2909177, 0.4869107, -0.8606082, 0, 0, 0, 1, 1,
0.2940946, 0.3184292, 1.971129, 0, 0, 0, 1, 1,
0.2945561, 1.158996, 1.928208, 0, 0, 0, 1, 1,
0.2948151, 0.0868917, 1.904571, 1, 1, 1, 1, 1,
0.3023625, 1.079845, 1.097381, 1, 1, 1, 1, 1,
0.3046597, -1.297372, 2.846304, 1, 1, 1, 1, 1,
0.3093668, -0.1502328, 1.019955, 1, 1, 1, 1, 1,
0.3110549, -1.343663, 2.399027, 1, 1, 1, 1, 1,
0.3123254, 1.274136, -0.4892831, 1, 1, 1, 1, 1,
0.3165192, 0.6124601, 1.745383, 1, 1, 1, 1, 1,
0.3193076, 0.57888, -0.555783, 1, 1, 1, 1, 1,
0.3216896, -0.5236087, 2.866261, 1, 1, 1, 1, 1,
0.3239568, -0.314061, 2.265372, 1, 1, 1, 1, 1,
0.3257621, -0.03142013, 1.473488, 1, 1, 1, 1, 1,
0.3274893, 0.9866793, 1.159391, 1, 1, 1, 1, 1,
0.3328383, 1.430368, 0.1257434, 1, 1, 1, 1, 1,
0.3355515, 1.347522, -0.1261767, 1, 1, 1, 1, 1,
0.3355998, 0.07241562, 2.170182, 1, 1, 1, 1, 1,
0.3366787, 0.9320297, -0.4746015, 0, 0, 1, 1, 1,
0.3385422, -0.01404734, 2.093217, 1, 0, 0, 1, 1,
0.3426927, -0.3918447, 3.00129, 1, 0, 0, 1, 1,
0.3437974, -1.375455, 2.585464, 1, 0, 0, 1, 1,
0.3459593, 1.062229, 0.5687971, 1, 0, 0, 1, 1,
0.3466747, 0.5981197, 0.3600068, 1, 0, 0, 1, 1,
0.3496912, 0.3136446, 1.393204, 0, 0, 0, 1, 1,
0.3502705, 0.3386217, 2.045229, 0, 0, 0, 1, 1,
0.350546, 0.528314, 2.51006, 0, 0, 0, 1, 1,
0.3510377, -1.313282, 2.616796, 0, 0, 0, 1, 1,
0.3529023, 2.290884, -0.9172288, 0, 0, 0, 1, 1,
0.357839, 0.05106103, 0.07399759, 0, 0, 0, 1, 1,
0.3608246, 0.6324822, -0.8943563, 0, 0, 0, 1, 1,
0.3777628, 1.274243, -0.3208813, 1, 1, 1, 1, 1,
0.3804592, 0.5812281, 1.9469, 1, 1, 1, 1, 1,
0.3818521, -0.7643795, 0.3021143, 1, 1, 1, 1, 1,
0.3832582, 1.657239, -1.288608, 1, 1, 1, 1, 1,
0.3945031, -0.2189955, 1.01004, 1, 1, 1, 1, 1,
0.3968319, 0.08003708, 2.961809, 1, 1, 1, 1, 1,
0.3995817, -1.101514, 2.697104, 1, 1, 1, 1, 1,
0.399709, 0.5196133, 1.836575, 1, 1, 1, 1, 1,
0.4041943, 0.3722632, 1.125444, 1, 1, 1, 1, 1,
0.4067738, 1.519654, -1.163525, 1, 1, 1, 1, 1,
0.4073464, 1.510925, -1.626708, 1, 1, 1, 1, 1,
0.4086782, 0.7644877, 2.376021, 1, 1, 1, 1, 1,
0.408704, -0.4853323, 2.465399, 1, 1, 1, 1, 1,
0.4093653, 0.01145381, 2.427506, 1, 1, 1, 1, 1,
0.4197998, -1.257097, 2.88622, 1, 1, 1, 1, 1,
0.4204662, 1.49855, 1.243193, 0, 0, 1, 1, 1,
0.4233996, -0.4337167, 3.490812, 1, 0, 0, 1, 1,
0.423947, -0.660825, 1.458424, 1, 0, 0, 1, 1,
0.4239552, -0.4310403, 5.667037, 1, 0, 0, 1, 1,
0.4247335, 0.5250732, 1.310191, 1, 0, 0, 1, 1,
0.4353793, 0.6963798, 1.235536, 1, 0, 0, 1, 1,
0.4437735, -1.414515, 3.063134, 0, 0, 0, 1, 1,
0.4483066, -1.04619, 2.682005, 0, 0, 0, 1, 1,
0.4484236, -1.354467, 4.297435, 0, 0, 0, 1, 1,
0.4486524, 0.09800388, 0.838679, 0, 0, 0, 1, 1,
0.4487655, -0.6789209, 2.050883, 0, 0, 0, 1, 1,
0.4507672, -0.5765369, 2.008796, 0, 0, 0, 1, 1,
0.4528356, 0.3018118, -0.3984025, 0, 0, 0, 1, 1,
0.4540277, 0.5334921, -0.1137381, 1, 1, 1, 1, 1,
0.458904, -1.038682, 1.36616, 1, 1, 1, 1, 1,
0.459833, -1.546013, 3.059493, 1, 1, 1, 1, 1,
0.4669587, 1.005654, 0.6078202, 1, 1, 1, 1, 1,
0.4676171, 0.5829102, 2.465189, 1, 1, 1, 1, 1,
0.4693497, 0.3342102, -0.4868137, 1, 1, 1, 1, 1,
0.4724428, -1.056217, 0.9688061, 1, 1, 1, 1, 1,
0.4745058, 1.597053, 1.728819, 1, 1, 1, 1, 1,
0.4749849, -0.4191813, 3.382005, 1, 1, 1, 1, 1,
0.4757172, -0.1276915, 2.123917, 1, 1, 1, 1, 1,
0.4782041, -1.544135, 3.296046, 1, 1, 1, 1, 1,
0.478446, 0.9153916, 0.6480111, 1, 1, 1, 1, 1,
0.4835233, 0.4093696, 0.755253, 1, 1, 1, 1, 1,
0.4876882, 0.5137081, -1.623213, 1, 1, 1, 1, 1,
0.490496, 1.941301, -0.4527087, 1, 1, 1, 1, 1,
0.5052641, 1.021752, -0.08241272, 0, 0, 1, 1, 1,
0.5064926, -0.03119015, 1.200808, 1, 0, 0, 1, 1,
0.5087231, -0.1649189, 1.463246, 1, 0, 0, 1, 1,
0.5118588, 1.253849, -0.5531939, 1, 0, 0, 1, 1,
0.5145956, -2.402637, 2.965396, 1, 0, 0, 1, 1,
0.5194463, -1.837332, 3.048147, 1, 0, 0, 1, 1,
0.521903, 0.03424894, 1.027458, 0, 0, 0, 1, 1,
0.522437, 0.2201344, 1.854188, 0, 0, 0, 1, 1,
0.5229188, 0.9961111, 0.05810104, 0, 0, 0, 1, 1,
0.5238156, 1.439427, -1.35608, 0, 0, 0, 1, 1,
0.5274146, 0.1418678, 1.526543, 0, 0, 0, 1, 1,
0.5283287, -0.4608259, 2.564565, 0, 0, 0, 1, 1,
0.5309823, 0.4695292, 3.987789, 0, 0, 0, 1, 1,
0.5310923, 0.9865644, -0.5487808, 1, 1, 1, 1, 1,
0.5311301, -1.897088, 2.818014, 1, 1, 1, 1, 1,
0.5324121, 1.614529, 0.9488086, 1, 1, 1, 1, 1,
0.5334133, 0.2950362, 1.185773, 1, 1, 1, 1, 1,
0.5360395, 0.1492941, 2.273084, 1, 1, 1, 1, 1,
0.5393389, 0.04339275, -0.1598053, 1, 1, 1, 1, 1,
0.543446, -0.2540848, 1.038854, 1, 1, 1, 1, 1,
0.5478687, -1.960224, 3.465138, 1, 1, 1, 1, 1,
0.5504166, -0.7882364, 1.642492, 1, 1, 1, 1, 1,
0.5520165, 0.5228262, 1.846154, 1, 1, 1, 1, 1,
0.5559353, 0.4940987, 1.674162, 1, 1, 1, 1, 1,
0.5589398, -0.9251866, 3.267504, 1, 1, 1, 1, 1,
0.5624741, 0.7353783, 0.02881528, 1, 1, 1, 1, 1,
0.5628088, 0.4858382, 0.3163534, 1, 1, 1, 1, 1,
0.5686407, -1.619202, 3.20514, 1, 1, 1, 1, 1,
0.5739337, -0.1273998, 2.590511, 0, 0, 1, 1, 1,
0.5763937, -0.1166041, 0.5935367, 1, 0, 0, 1, 1,
0.5801917, -0.9501857, 2.765417, 1, 0, 0, 1, 1,
0.5826405, 0.2355777, 1.776374, 1, 0, 0, 1, 1,
0.5837275, 0.6819178, 1.232168, 1, 0, 0, 1, 1,
0.5858208, -0.679543, 3.468711, 1, 0, 0, 1, 1,
0.5864107, 0.8136795, -0.1403131, 0, 0, 0, 1, 1,
0.588008, -0.01244981, 0.9781673, 0, 0, 0, 1, 1,
0.5890083, -0.06831215, 2.704276, 0, 0, 0, 1, 1,
0.5894106, -1.136941, 1.995535, 0, 0, 0, 1, 1,
0.5895181, 0.475384, 0.6904052, 0, 0, 0, 1, 1,
0.5901206, -1.321959, 3.095523, 0, 0, 0, 1, 1,
0.5928347, -1.594813, 3.571639, 0, 0, 0, 1, 1,
0.594445, -0.6686177, 2.351861, 1, 1, 1, 1, 1,
0.5987475, -2.301543, 3.149296, 1, 1, 1, 1, 1,
0.6005203, 0.5905731, 0.5542198, 1, 1, 1, 1, 1,
0.6051928, 1.368979, 1.633128, 1, 1, 1, 1, 1,
0.6054779, 0.04152368, 1.968599, 1, 1, 1, 1, 1,
0.6074455, 0.0187772, 1.25309, 1, 1, 1, 1, 1,
0.6078699, -1.43954, 3.206948, 1, 1, 1, 1, 1,
0.6097716, 1.108385, 0.7663015, 1, 1, 1, 1, 1,
0.6118891, 0.3054107, -0.001181622, 1, 1, 1, 1, 1,
0.6120806, -0.8095741, 3.912364, 1, 1, 1, 1, 1,
0.6125386, -1.633792, 1.142439, 1, 1, 1, 1, 1,
0.6128605, -1.882189, 2.427891, 1, 1, 1, 1, 1,
0.615791, 0.1648745, 3.166789, 1, 1, 1, 1, 1,
0.6181655, -0.3077027, 2.371357, 1, 1, 1, 1, 1,
0.6197792, 0.02230073, 1.857674, 1, 1, 1, 1, 1,
0.6208671, 0.136011, 0.1883047, 0, 0, 1, 1, 1,
0.6243574, -0.1104637, 3.719438, 1, 0, 0, 1, 1,
0.6253055, -1.569003, 2.1908, 1, 0, 0, 1, 1,
0.6253771, 2.243349, 0.209998, 1, 0, 0, 1, 1,
0.6318048, 0.3450564, 0.644179, 1, 0, 0, 1, 1,
0.6423757, -1.598794, 1.700012, 1, 0, 0, 1, 1,
0.6492803, -0.1557606, 2.612773, 0, 0, 0, 1, 1,
0.6499225, 0.5798282, -0.9447744, 0, 0, 0, 1, 1,
0.6557276, 1.638619, 0.9811503, 0, 0, 0, 1, 1,
0.6592188, 0.9082286, 0.268986, 0, 0, 0, 1, 1,
0.6612061, 0.7910449, -1.134368, 0, 0, 0, 1, 1,
0.6620176, 1.447789, -0.3935646, 0, 0, 0, 1, 1,
0.6622615, 0.5530658, 2.099699, 0, 0, 0, 1, 1,
0.6671022, -0.1741285, 0.1965667, 1, 1, 1, 1, 1,
0.6714559, -0.2895339, 1.086473, 1, 1, 1, 1, 1,
0.6739035, -0.9322019, 2.483577, 1, 1, 1, 1, 1,
0.6769004, -0.9706447, 2.039069, 1, 1, 1, 1, 1,
0.679596, -0.7199724, 1.928161, 1, 1, 1, 1, 1,
0.6807872, 1.0829, 1.13552, 1, 1, 1, 1, 1,
0.6811914, 1.048629, 0.2844941, 1, 1, 1, 1, 1,
0.6821733, -0.7068224, 1.801977, 1, 1, 1, 1, 1,
0.6826085, 0.5482467, 1.624415, 1, 1, 1, 1, 1,
0.6828415, -1.539149, 2.164053, 1, 1, 1, 1, 1,
0.6929664, -1.000084, 4.237106, 1, 1, 1, 1, 1,
0.7029669, -0.5643751, 1.635045, 1, 1, 1, 1, 1,
0.7114841, -0.2962982, 0.4525167, 1, 1, 1, 1, 1,
0.718653, -0.4085737, 2.842267, 1, 1, 1, 1, 1,
0.7199312, -1.156715, 2.616939, 1, 1, 1, 1, 1,
0.7216575, 0.5995885, 0.5622986, 0, 0, 1, 1, 1,
0.7243416, -0.560904, 2.230433, 1, 0, 0, 1, 1,
0.7296568, 0.6083704, 1.104397, 1, 0, 0, 1, 1,
0.7315834, -1.089846, 2.5647, 1, 0, 0, 1, 1,
0.7329947, -0.2590192, 0.395966, 1, 0, 0, 1, 1,
0.7345885, -0.5691639, 2.94357, 1, 0, 0, 1, 1,
0.7367005, 0.95161, -1.736825, 0, 0, 0, 1, 1,
0.7416796, 0.8382685, 1.472766, 0, 0, 0, 1, 1,
0.7538206, -2.004103, 0.9450585, 0, 0, 0, 1, 1,
0.7656935, -0.6185035, 2.6769, 0, 0, 0, 1, 1,
0.7665421, -1.758725, 3.577458, 0, 0, 0, 1, 1,
0.7670954, -1.675215, 0.953327, 0, 0, 0, 1, 1,
0.774698, -0.8556648, 2.805378, 0, 0, 0, 1, 1,
0.779938, -1.822282, 4.064261, 1, 1, 1, 1, 1,
0.7825529, 1.997854, 1.245162, 1, 1, 1, 1, 1,
0.7840625, -1.283852, 2.400928, 1, 1, 1, 1, 1,
0.7855522, -1.967545, 2.332301, 1, 1, 1, 1, 1,
0.8011234, -0.5812286, 2.851218, 1, 1, 1, 1, 1,
0.8043192, 1.586991, 1.29954, 1, 1, 1, 1, 1,
0.8057954, 0.7418128, 1.821974, 1, 1, 1, 1, 1,
0.8087996, 0.4123647, 2.190782, 1, 1, 1, 1, 1,
0.8091584, -1.116483, 1.737189, 1, 1, 1, 1, 1,
0.8097655, -0.06793098, 0.3904479, 1, 1, 1, 1, 1,
0.8120481, -1.566746, 2.684503, 1, 1, 1, 1, 1,
0.8148015, -0.9965963, -0.1048657, 1, 1, 1, 1, 1,
0.8177025, 0.8774424, 0.404258, 1, 1, 1, 1, 1,
0.8234394, 0.707694, 1.254911, 1, 1, 1, 1, 1,
0.8256933, 0.1099065, 1.396466, 1, 1, 1, 1, 1,
0.831265, -0.2145898, 2.191523, 0, 0, 1, 1, 1,
0.8410491, -0.7360252, 2.603858, 1, 0, 0, 1, 1,
0.8423754, 0.7295936, 2.105721, 1, 0, 0, 1, 1,
0.8502194, -0.6264702, 3.765636, 1, 0, 0, 1, 1,
0.8611112, 0.306758, 0.9387284, 1, 0, 0, 1, 1,
0.8625907, 0.006203954, 1.395777, 1, 0, 0, 1, 1,
0.8674054, 2.067728, 0.4581805, 0, 0, 0, 1, 1,
0.8684036, -0.264678, 2.214596, 0, 0, 0, 1, 1,
0.8715757, -0.7536623, 1.900756, 0, 0, 0, 1, 1,
0.874537, -2.275307, 3.505992, 0, 0, 0, 1, 1,
0.8771013, -0.9700977, 1.265593, 0, 0, 0, 1, 1,
0.8791443, 0.5833421, 1.236061, 0, 0, 0, 1, 1,
0.8836214, 1.134751, 1.080501, 0, 0, 0, 1, 1,
0.8891677, -1.245701, 2.729349, 1, 1, 1, 1, 1,
0.8911291, 1.061202, 0.6435673, 1, 1, 1, 1, 1,
0.89786, -1.691906, 2.417701, 1, 1, 1, 1, 1,
0.9016361, 0.7886667, 0.3474834, 1, 1, 1, 1, 1,
0.9018492, 0.3473855, 0.7572753, 1, 1, 1, 1, 1,
0.9082505, 3.208863, -0.9176112, 1, 1, 1, 1, 1,
0.9083397, -0.4231331, 1.462442, 1, 1, 1, 1, 1,
0.9145349, -0.4898259, 3.397626, 1, 1, 1, 1, 1,
0.9195957, 0.6787006, 1.716968, 1, 1, 1, 1, 1,
0.9214886, 0.569584, 0.5305043, 1, 1, 1, 1, 1,
0.9225441, 1.330993, 2.257576, 1, 1, 1, 1, 1,
0.9376032, 1.041511, 0.09861992, 1, 1, 1, 1, 1,
0.9467033, 1.745511, 1.348594, 1, 1, 1, 1, 1,
0.9479344, -1.027637, 2.509572, 1, 1, 1, 1, 1,
0.9506538, -0.7136322, 2.398474, 1, 1, 1, 1, 1,
0.951126, -0.3811982, 1.234354, 0, 0, 1, 1, 1,
0.9545856, 0.1174543, 0.7983438, 1, 0, 0, 1, 1,
0.958426, -0.006914577, 1.667535, 1, 0, 0, 1, 1,
0.9584796, 0.5856997, 2.063954, 1, 0, 0, 1, 1,
0.960665, 0.320302, 1.387291, 1, 0, 0, 1, 1,
0.9624168, 0.2797827, 1.674877, 1, 0, 0, 1, 1,
0.9648498, 0.4668663, 0.4184801, 0, 0, 0, 1, 1,
0.9667512, -0.6991119, 4.157092, 0, 0, 0, 1, 1,
0.9674674, 1.479121, -1.872885, 0, 0, 0, 1, 1,
0.9686528, 0.7361158, -0.387947, 0, 0, 0, 1, 1,
0.9711248, 0.7875551, 1.901947, 0, 0, 0, 1, 1,
0.9724536, -0.2421964, 2.468483, 0, 0, 0, 1, 1,
0.974054, -1.544069, 1.642163, 0, 0, 0, 1, 1,
0.9772398, -0.1835273, 0.2408587, 1, 1, 1, 1, 1,
0.9809632, -0.472152, 1.319496, 1, 1, 1, 1, 1,
0.9951774, -0.09022719, 3.198668, 1, 1, 1, 1, 1,
0.9972113, 1.8815, 0.7751056, 1, 1, 1, 1, 1,
1.001348, 0.7065747, 1.48937, 1, 1, 1, 1, 1,
1.011053, 1.589696, -1.216312, 1, 1, 1, 1, 1,
1.01455, 1.646343, 0.006019193, 1, 1, 1, 1, 1,
1.022929, 0.8804262, 0.7189034, 1, 1, 1, 1, 1,
1.025057, -0.971241, 2.291495, 1, 1, 1, 1, 1,
1.025919, -1.15594, 1.76119, 1, 1, 1, 1, 1,
1.030905, 0.6184086, 0.0897552, 1, 1, 1, 1, 1,
1.038367, 1.514595, 1.754916, 1, 1, 1, 1, 1,
1.039747, 1.25511, 2.874616, 1, 1, 1, 1, 1,
1.047996, 0.6012488, 3.505043, 1, 1, 1, 1, 1,
1.054596, 0.5084968, 2.336514, 1, 1, 1, 1, 1,
1.068548, -0.4679643, 3.197771, 0, 0, 1, 1, 1,
1.085582, 1.046661, 0.3087995, 1, 0, 0, 1, 1,
1.089612, 0.4242114, 1.418477, 1, 0, 0, 1, 1,
1.100039, -1.24659, 2.73551, 1, 0, 0, 1, 1,
1.104387, -1.612733, 0.6710051, 1, 0, 0, 1, 1,
1.106524, -0.3504641, 1.323239, 1, 0, 0, 1, 1,
1.109086, 0.322087, 0.8933107, 0, 0, 0, 1, 1,
1.112724, -0.7830669, 2.625279, 0, 0, 0, 1, 1,
1.123367, 0.1157707, 0.1100562, 0, 0, 0, 1, 1,
1.125014, 0.3937508, 0.9041715, 0, 0, 0, 1, 1,
1.125356, -0.1549451, 1.629757, 0, 0, 0, 1, 1,
1.130387, -2.069913, 1.360823, 0, 0, 0, 1, 1,
1.134672, 1.036952, 1.06164, 0, 0, 0, 1, 1,
1.13757, -0.5436234, 1.859453, 1, 1, 1, 1, 1,
1.143023, -0.2455613, 0.09179929, 1, 1, 1, 1, 1,
1.146204, -1.403281, 2.434706, 1, 1, 1, 1, 1,
1.150953, 0.7888021, 0.43713, 1, 1, 1, 1, 1,
1.161522, -0.02708459, 1.550191, 1, 1, 1, 1, 1,
1.161589, 1.093957, 1.324129, 1, 1, 1, 1, 1,
1.162443, -1.229208, 3.195611, 1, 1, 1, 1, 1,
1.173429, -0.473733, 2.723275, 1, 1, 1, 1, 1,
1.175132, -0.9212491, 0.337814, 1, 1, 1, 1, 1,
1.182375, 1.122624, 0.2063437, 1, 1, 1, 1, 1,
1.187524, 1.067588, 2.601976, 1, 1, 1, 1, 1,
1.191827, 0.8339966, -0.5645456, 1, 1, 1, 1, 1,
1.194632, 1.24862, 2.268911, 1, 1, 1, 1, 1,
1.20603, 1.196304, 0.1831291, 1, 1, 1, 1, 1,
1.206476, -0.3507339, 0.9980295, 1, 1, 1, 1, 1,
1.20823, -0.855463, 2.27229, 0, 0, 1, 1, 1,
1.20932, 1.581519, -1.026396, 1, 0, 0, 1, 1,
1.210259, 1.208501, 1.311422, 1, 0, 0, 1, 1,
1.212739, 1.733634, -0.1469075, 1, 0, 0, 1, 1,
1.212796, 1.524446, 2.419828, 1, 0, 0, 1, 1,
1.218836, 0.5987402, 2.696776, 1, 0, 0, 1, 1,
1.230344, -0.2669947, -0.2326829, 0, 0, 0, 1, 1,
1.234954, 0.2713871, -0.6976681, 0, 0, 0, 1, 1,
1.239971, 0.9927673, -0.1782093, 0, 0, 0, 1, 1,
1.246837, 0.8551719, 0.2261855, 0, 0, 0, 1, 1,
1.248932, 1.759861, 2.298753, 0, 0, 0, 1, 1,
1.249651, -0.4848805, 2.346351, 0, 0, 0, 1, 1,
1.25171, 0.3164313, 0.5969008, 0, 0, 0, 1, 1,
1.260852, -0.1642879, 0.2442996, 1, 1, 1, 1, 1,
1.261182, -0.06053442, 1.139404, 1, 1, 1, 1, 1,
1.271888, 2.073926, -0.03544483, 1, 1, 1, 1, 1,
1.277052, -1.022229, 2.882666, 1, 1, 1, 1, 1,
1.281642, -0.2280936, 1.591439, 1, 1, 1, 1, 1,
1.284413, -0.7786276, 2.733106, 1, 1, 1, 1, 1,
1.28668, -1.246832, 1.763309, 1, 1, 1, 1, 1,
1.287337, -1.784784, 0.8040073, 1, 1, 1, 1, 1,
1.28803, -0.2833577, 1.438956, 1, 1, 1, 1, 1,
1.317955, -1.750829, 1.411901, 1, 1, 1, 1, 1,
1.326757, 0.03642178, 2.378585, 1, 1, 1, 1, 1,
1.329421, 0.1034665, 1.611142, 1, 1, 1, 1, 1,
1.338582, 0.6779047, 1.661485, 1, 1, 1, 1, 1,
1.341759, -1.042406, 3.283604, 1, 1, 1, 1, 1,
1.35837, -1.04666, 1.553911, 1, 1, 1, 1, 1,
1.360733, 0.5315872, -0.04725661, 0, 0, 1, 1, 1,
1.363491, 0.9157976, 1.312034, 1, 0, 0, 1, 1,
1.374403, -0.8170634, 1.048946, 1, 0, 0, 1, 1,
1.377877, -0.3596356, 1.169949, 1, 0, 0, 1, 1,
1.383095, -0.03697559, 0.6871989, 1, 0, 0, 1, 1,
1.38857, 1.166227, 0.3789887, 1, 0, 0, 1, 1,
1.391736, 0.7413685, 1.564262, 0, 0, 0, 1, 1,
1.394869, -0.4908718, 1.32519, 0, 0, 0, 1, 1,
1.395244, -1.97353, 2.448045, 0, 0, 0, 1, 1,
1.40009, -0.7121922, 1.969554, 0, 0, 0, 1, 1,
1.400267, 0.7768586, 0.430144, 0, 0, 0, 1, 1,
1.400456, -0.1171283, -0.03940491, 0, 0, 0, 1, 1,
1.400515, 0.02303859, 0.2475917, 0, 0, 0, 1, 1,
1.407863, -0.6618356, 1.960578, 1, 1, 1, 1, 1,
1.418407, -1.034104, 3.143475, 1, 1, 1, 1, 1,
1.421825, 0.5330206, 2.596993, 1, 1, 1, 1, 1,
1.429028, 0.08602297, 1.661669, 1, 1, 1, 1, 1,
1.4365, -0.2823757, 1.889526, 1, 1, 1, 1, 1,
1.44007, -0.185744, 2.206837, 1, 1, 1, 1, 1,
1.450236, 1.581759, 0.7361545, 1, 1, 1, 1, 1,
1.453426, -1.349731, 1.666267, 1, 1, 1, 1, 1,
1.467048, 0.1436468, 1.733596, 1, 1, 1, 1, 1,
1.50523, -0.2464308, 3.076201, 1, 1, 1, 1, 1,
1.509986, -0.02712305, 2.43313, 1, 1, 1, 1, 1,
1.509995, -1.048713, 1.929504, 1, 1, 1, 1, 1,
1.52223, -1.160019, 3.674968, 1, 1, 1, 1, 1,
1.524061, 0.3264406, 0.6420982, 1, 1, 1, 1, 1,
1.52493, -0.03165454, 2.494836, 1, 1, 1, 1, 1,
1.535992, -0.9996517, 2.293373, 0, 0, 1, 1, 1,
1.544804, -0.637575, 3.162832, 1, 0, 0, 1, 1,
1.561438, -0.4190959, 1.900164, 1, 0, 0, 1, 1,
1.563432, -0.4402863, 2.201086, 1, 0, 0, 1, 1,
1.574452, 1.291514, 1.576488, 1, 0, 0, 1, 1,
1.577355, -1.082699, 1.667252, 1, 0, 0, 1, 1,
1.577425, -1.453463, 3.109115, 0, 0, 0, 1, 1,
1.578856, -0.1249212, 3.352822, 0, 0, 0, 1, 1,
1.583285, -1.370154, 1.93426, 0, 0, 0, 1, 1,
1.596967, -0.3972814, 0.4290788, 0, 0, 0, 1, 1,
1.599148, 0.4562399, 1.080204, 0, 0, 0, 1, 1,
1.604948, -0.7294421, 2.349214, 0, 0, 0, 1, 1,
1.616721, 0.5618751, 0.7255937, 0, 0, 0, 1, 1,
1.618262, -2.6227, 0.7808016, 1, 1, 1, 1, 1,
1.624283, 0.5494267, 1.071092, 1, 1, 1, 1, 1,
1.624603, -0.5375961, 4.462358, 1, 1, 1, 1, 1,
1.638825, 0.1820664, 1.841362, 1, 1, 1, 1, 1,
1.641077, -2.932499, 2.649842, 1, 1, 1, 1, 1,
1.648281, -0.9376832, 2.195515, 1, 1, 1, 1, 1,
1.657489, 0.3278925, 1.994815, 1, 1, 1, 1, 1,
1.664836, -0.01908788, 1.533108, 1, 1, 1, 1, 1,
1.665272, 0.706715, 0.6001911, 1, 1, 1, 1, 1,
1.667147, 0.2019005, 1.262988, 1, 1, 1, 1, 1,
1.718804, -0.4056132, 2.026943, 1, 1, 1, 1, 1,
1.728935, 0.9216807, 1.158252, 1, 1, 1, 1, 1,
1.732045, -0.3602454, 1.785204, 1, 1, 1, 1, 1,
1.739571, -0.4606898, 0.5887613, 1, 1, 1, 1, 1,
1.741373, 0.4540946, 2.323147, 1, 1, 1, 1, 1,
1.742249, 0.8879703, 0.9105922, 0, 0, 1, 1, 1,
1.752752, 0.5691583, 0.6356833, 1, 0, 0, 1, 1,
1.76898, 0.3217707, 0.1340492, 1, 0, 0, 1, 1,
1.769968, 1.344562, 2.055993, 1, 0, 0, 1, 1,
1.78352, -1.078187, 3.751492, 1, 0, 0, 1, 1,
1.787157, -0.3915268, 1.667508, 1, 0, 0, 1, 1,
1.794704, -1.727901, 3.364667, 0, 0, 0, 1, 1,
1.811028, 0.04445894, 2.354715, 0, 0, 0, 1, 1,
1.826492, -0.190714, 2.039242, 0, 0, 0, 1, 1,
1.846422, -0.2429999, 1.52365, 0, 0, 0, 1, 1,
1.854573, -1.051588, 1.492601, 0, 0, 0, 1, 1,
1.860314, -0.245042, 2.638879, 0, 0, 0, 1, 1,
1.878367, -0.04941599, 1.410728, 0, 0, 0, 1, 1,
1.903596, -0.1151332, 0.7083328, 1, 1, 1, 1, 1,
1.907395, 1.570117, 1.967744, 1, 1, 1, 1, 1,
1.910184, 0.3663224, 1.439096, 1, 1, 1, 1, 1,
1.913587, -0.6492646, -1.353175, 1, 1, 1, 1, 1,
1.944651, -0.8015555, 0.9417419, 1, 1, 1, 1, 1,
1.94509, 1.723706, 0.8911996, 1, 1, 1, 1, 1,
1.947278, -1.778669, 2.175594, 1, 1, 1, 1, 1,
1.965139, 0.08259596, 0.7495156, 1, 1, 1, 1, 1,
2.024644, 1.691884, 0.8434781, 1, 1, 1, 1, 1,
2.027617, -1.221343, 3.697099, 1, 1, 1, 1, 1,
2.031798, -0.04198907, 1.864594, 1, 1, 1, 1, 1,
2.039925, 1.213965, 0.6122376, 1, 1, 1, 1, 1,
2.050558, -0.8547471, 2.430393, 1, 1, 1, 1, 1,
2.079379, 0.2895464, 1.308074, 1, 1, 1, 1, 1,
2.089389, 0.511626, 1.557621, 1, 1, 1, 1, 1,
2.105858, -0.604564, 1.600346, 0, 0, 1, 1, 1,
2.160311, -0.08161155, 0.3185593, 1, 0, 0, 1, 1,
2.163702, 0.04311077, 1.34524, 1, 0, 0, 1, 1,
2.182819, 0.9203376, 0.4587293, 1, 0, 0, 1, 1,
2.210872, 1.149326, 0.6240528, 1, 0, 0, 1, 1,
2.29365, 0.1007062, 2.156387, 1, 0, 0, 1, 1,
2.353708, 1.073913, 0.9987178, 0, 0, 0, 1, 1,
2.402581, 0.1390526, 1.004604, 0, 0, 0, 1, 1,
2.403857, -1.618471, 2.544481, 0, 0, 0, 1, 1,
2.428238, -0.3105094, -0.03447032, 0, 0, 0, 1, 1,
2.507313, -1.630719, 2.80054, 0, 0, 0, 1, 1,
2.508716, 0.1384246, 0.1154274, 0, 0, 0, 1, 1,
2.561684, 0.5117882, 0.7510478, 0, 0, 0, 1, 1,
2.699337, -0.6250881, 1.25015, 1, 1, 1, 1, 1,
2.709847, 0.1561609, 2.670377, 1, 1, 1, 1, 1,
2.817952, -1.047004, 2.373244, 1, 1, 1, 1, 1,
3.060503, 0.6712618, 0.8666547, 1, 1, 1, 1, 1,
3.144671, -0.6853675, 1.585961, 1, 1, 1, 1, 1,
3.584429, -1.190359, 1.743868, 1, 1, 1, 1, 1,
3.70044, -0.1409421, 1.055659, 1, 1, 1, 1, 1
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
var radius = 10.13169;
var distance = 35.58711;
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
mvMatrix.translate( -0.3510751, -0.1052496, 0.2757819 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.58711);
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
