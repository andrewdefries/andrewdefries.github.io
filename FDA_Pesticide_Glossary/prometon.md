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
-2.94828, 0.4894669, -1.419141, 1, 0, 0, 1,
-2.645073, -0.3489609, -0.3103174, 1, 0.007843138, 0, 1,
-2.63917, -2.537501, -1.439238, 1, 0.01176471, 0, 1,
-2.600808, 0.8840581, -0.7099453, 1, 0.01960784, 0, 1,
-2.562098, -0.3633125, -1.235295, 1, 0.02352941, 0, 1,
-2.526472, 0.6825902, -1.673311, 1, 0.03137255, 0, 1,
-2.520017, 2.231443, -1.955066, 1, 0.03529412, 0, 1,
-2.505668, 0.7756528, -2.838385, 1, 0.04313726, 0, 1,
-2.451808, 0.01258267, 0.3002547, 1, 0.04705882, 0, 1,
-2.384373, 1.145551, -1.639963, 1, 0.05490196, 0, 1,
-2.366615, 1.672816, 0.2312579, 1, 0.05882353, 0, 1,
-2.332062, 1.04859, -0.8389465, 1, 0.06666667, 0, 1,
-2.278141, 1.245966, -1.390579, 1, 0.07058824, 0, 1,
-2.272878, -1.774579, -1.464893, 1, 0.07843138, 0, 1,
-2.267489, 0.3468822, 1.11851, 1, 0.08235294, 0, 1,
-2.173229, 0.4741136, 0.7247134, 1, 0.09019608, 0, 1,
-2.161813, -0.3478077, -0.9983342, 1, 0.09411765, 0, 1,
-2.157825, 0.08231124, -2.669333, 1, 0.1019608, 0, 1,
-2.139199, 0.4833483, -0.6838419, 1, 0.1098039, 0, 1,
-2.116535, 0.4789219, -2.437293, 1, 0.1137255, 0, 1,
-2.029207, -1.693041, -3.439842, 1, 0.1215686, 0, 1,
-1.984311, -0.5404798, -1.052874, 1, 0.1254902, 0, 1,
-1.959576, 0.2709314, -1.958251, 1, 0.1333333, 0, 1,
-1.953975, -0.2286718, -0.901117, 1, 0.1372549, 0, 1,
-1.953589, 0.6070308, -0.2110293, 1, 0.145098, 0, 1,
-1.94612, -1.167084, -1.854971, 1, 0.1490196, 0, 1,
-1.942906, 0.7261816, -0.1227678, 1, 0.1568628, 0, 1,
-1.942199, -0.8502865, -2.004229, 1, 0.1607843, 0, 1,
-1.920525, -0.02964082, -0.4027968, 1, 0.1686275, 0, 1,
-1.901355, -1.079782, -0.6546923, 1, 0.172549, 0, 1,
-1.880573, 0.536911, -2.374596, 1, 0.1803922, 0, 1,
-1.877924, -2.17513, -1.275028, 1, 0.1843137, 0, 1,
-1.861516, 0.7296797, -1.441013, 1, 0.1921569, 0, 1,
-1.857893, 1.432769, -0.6358756, 1, 0.1960784, 0, 1,
-1.837659, -1.243553, -1.006665, 1, 0.2039216, 0, 1,
-1.828964, -0.3687822, -1.967018, 1, 0.2117647, 0, 1,
-1.817767, -0.03718456, -0.6779991, 1, 0.2156863, 0, 1,
-1.804479, 0.4926417, -0.2330332, 1, 0.2235294, 0, 1,
-1.77821, 0.5949423, -2.054256, 1, 0.227451, 0, 1,
-1.767002, 0.02874878, -1.325842, 1, 0.2352941, 0, 1,
-1.76263, 0.9112106, -0.08074806, 1, 0.2392157, 0, 1,
-1.761626, -0.6102201, -2.407122, 1, 0.2470588, 0, 1,
-1.749774, -0.9353895, -3.162724, 1, 0.2509804, 0, 1,
-1.735173, -0.4880229, -0.9332293, 1, 0.2588235, 0, 1,
-1.725453, -0.8842936, -0.006083514, 1, 0.2627451, 0, 1,
-1.725296, -0.6070285, -2.192612, 1, 0.2705882, 0, 1,
-1.722901, 1.800861, -0.8495066, 1, 0.2745098, 0, 1,
-1.720988, 0.7876508, 0.06653749, 1, 0.282353, 0, 1,
-1.696043, 0.7851512, -2.162793, 1, 0.2862745, 0, 1,
-1.693361, -0.4638194, -2.150364, 1, 0.2941177, 0, 1,
-1.686133, 0.6792851, -2.182421, 1, 0.3019608, 0, 1,
-1.678039, 0.2712388, -1.65352, 1, 0.3058824, 0, 1,
-1.677754, -0.7547448, -2.183233, 1, 0.3137255, 0, 1,
-1.658499, 0.3645152, -1.95266, 1, 0.3176471, 0, 1,
-1.656785, -0.3642478, -1.526323, 1, 0.3254902, 0, 1,
-1.648684, 0.7193027, -0.1735525, 1, 0.3294118, 0, 1,
-1.638328, 0.2707217, 0.394131, 1, 0.3372549, 0, 1,
-1.628467, -0.4878288, -1.455121, 1, 0.3411765, 0, 1,
-1.623061, 0.5916473, -0.6823528, 1, 0.3490196, 0, 1,
-1.607883, 0.8993019, -2.195487, 1, 0.3529412, 0, 1,
-1.604908, 0.8431791, -1.674461, 1, 0.3607843, 0, 1,
-1.600465, 0.7534775, 0.6961765, 1, 0.3647059, 0, 1,
-1.59028, -1.905136, -3.862375, 1, 0.372549, 0, 1,
-1.589556, -0.5835437, -2.997878, 1, 0.3764706, 0, 1,
-1.582761, 2.151533, 0.8032459, 1, 0.3843137, 0, 1,
-1.57771, 1.543198, -1.401204, 1, 0.3882353, 0, 1,
-1.564005, 0.2427042, -3.009083, 1, 0.3960784, 0, 1,
-1.561637, -0.3707488, -2.80022, 1, 0.4039216, 0, 1,
-1.532988, 1.57333, -1.688985, 1, 0.4078431, 0, 1,
-1.529397, 0.8507212, -0.2578459, 1, 0.4156863, 0, 1,
-1.521599, 0.5274503, -0.4820918, 1, 0.4196078, 0, 1,
-1.514251, -1.475539, -3.062814, 1, 0.427451, 0, 1,
-1.510706, -1.044526, -1.583874, 1, 0.4313726, 0, 1,
-1.506629, 0.5251787, -0.6106675, 1, 0.4392157, 0, 1,
-1.452307, -1.248851, -2.31693, 1, 0.4431373, 0, 1,
-1.442252, 0.4724958, -1.156865, 1, 0.4509804, 0, 1,
-1.426357, -0.5307119, -2.259879, 1, 0.454902, 0, 1,
-1.418236, -0.3384644, -2.480814, 1, 0.4627451, 0, 1,
-1.417432, 0.7916656, -0.8559787, 1, 0.4666667, 0, 1,
-1.403335, 0.8077201, -1.386126, 1, 0.4745098, 0, 1,
-1.395739, 0.4101584, -0.4944886, 1, 0.4784314, 0, 1,
-1.391392, -0.6613101, -1.856684, 1, 0.4862745, 0, 1,
-1.389586, 0.04931619, -1.603475, 1, 0.4901961, 0, 1,
-1.37348, 0.4047827, -2.60633, 1, 0.4980392, 0, 1,
-1.362429, 0.3014105, -2.10958, 1, 0.5058824, 0, 1,
-1.360209, 1.657126, -1.324942, 1, 0.509804, 0, 1,
-1.344775, 0.8912793, -0.6108179, 1, 0.5176471, 0, 1,
-1.342998, -0.7434624, -2.339162, 1, 0.5215687, 0, 1,
-1.341944, -0.05934469, -0.3643293, 1, 0.5294118, 0, 1,
-1.33492, -0.2279549, -2.047888, 1, 0.5333334, 0, 1,
-1.33274, -0.66961, -1.44076, 1, 0.5411765, 0, 1,
-1.33242, -0.7636328, -3.513169, 1, 0.5450981, 0, 1,
-1.33234, 0.8010463, -1.017501, 1, 0.5529412, 0, 1,
-1.3321, -1.203107, -2.35317, 1, 0.5568628, 0, 1,
-1.329712, -0.7627121, -3.209869, 1, 0.5647059, 0, 1,
-1.325231, 0.2922456, 0.402365, 1, 0.5686275, 0, 1,
-1.321675, -0.7325628, -0.8883662, 1, 0.5764706, 0, 1,
-1.319019, -0.007202259, 0.1430326, 1, 0.5803922, 0, 1,
-1.316637, -0.9165511, -2.405389, 1, 0.5882353, 0, 1,
-1.314968, 1.674352, 0.4142423, 1, 0.5921569, 0, 1,
-1.305922, 0.3198464, 0.151686, 1, 0.6, 0, 1,
-1.300592, 1.004734, -0.4559771, 1, 0.6078432, 0, 1,
-1.291526, -0.1150929, -1.68529, 1, 0.6117647, 0, 1,
-1.288823, 0.7786812, -1.651129, 1, 0.6196079, 0, 1,
-1.283216, 1.219967, -0.06564055, 1, 0.6235294, 0, 1,
-1.271865, 1.978148, -1.467523, 1, 0.6313726, 0, 1,
-1.270205, 1.10929, 0.8593405, 1, 0.6352941, 0, 1,
-1.2661, -0.2245333, -2.833583, 1, 0.6431373, 0, 1,
-1.265359, -0.304857, -1.40522, 1, 0.6470588, 0, 1,
-1.250794, 2.187019, -1.026376, 1, 0.654902, 0, 1,
-1.247503, 0.2082859, -2.200234, 1, 0.6588235, 0, 1,
-1.228459, -0.8040519, -1.14808, 1, 0.6666667, 0, 1,
-1.225077, -1.409323, -2.201607, 1, 0.6705883, 0, 1,
-1.221754, -0.1663479, -2.536502, 1, 0.6784314, 0, 1,
-1.220894, 0.9951971, -0.7485147, 1, 0.682353, 0, 1,
-1.219458, -0.1517761, -1.055657, 1, 0.6901961, 0, 1,
-1.216563, -0.9538578, -3.73176, 1, 0.6941177, 0, 1,
-1.215636, -1.348293, -3.570244, 1, 0.7019608, 0, 1,
-1.212186, -1.150459, -0.66294, 1, 0.7098039, 0, 1,
-1.201716, -1.568758, -0.6224032, 1, 0.7137255, 0, 1,
-1.19159, 0.9409211, -1.509714, 1, 0.7215686, 0, 1,
-1.184228, -0.6194708, -2.337129, 1, 0.7254902, 0, 1,
-1.183584, -0.9924629, -2.700963, 1, 0.7333333, 0, 1,
-1.181796, -0.8770366, -0.8437239, 1, 0.7372549, 0, 1,
-1.174976, 0.1651463, -0.3096078, 1, 0.7450981, 0, 1,
-1.171376, 1.287774, 0.3906785, 1, 0.7490196, 0, 1,
-1.15924, 0.4002935, -2.53009, 1, 0.7568628, 0, 1,
-1.158989, -0.5446392, -1.626799, 1, 0.7607843, 0, 1,
-1.151567, 0.8175424, -3.245997, 1, 0.7686275, 0, 1,
-1.145392, 0.3105077, -1.361301, 1, 0.772549, 0, 1,
-1.145227, -0.5762044, -0.3770908, 1, 0.7803922, 0, 1,
-1.141199, -0.2105455, -2.502029, 1, 0.7843137, 0, 1,
-1.129146, -0.6373488, -3.556626, 1, 0.7921569, 0, 1,
-1.124382, -0.4965664, -2.870119, 1, 0.7960784, 0, 1,
-1.123485, 0.4021398, -1.681266, 1, 0.8039216, 0, 1,
-1.116482, 1.35006, 0.808485, 1, 0.8117647, 0, 1,
-1.115788, 0.6608488, 0.2045742, 1, 0.8156863, 0, 1,
-1.089345, 1.664961, -0.1800573, 1, 0.8235294, 0, 1,
-1.088141, -0.2950868, -1.780709, 1, 0.827451, 0, 1,
-1.083475, -0.8280786, -1.343324, 1, 0.8352941, 0, 1,
-1.082797, -1.113891, -2.439718, 1, 0.8392157, 0, 1,
-1.081571, 0.2356604, -1.271326, 1, 0.8470588, 0, 1,
-1.080252, 0.7128161, -0.08084781, 1, 0.8509804, 0, 1,
-1.078844, -0.03721108, -1.777499, 1, 0.8588235, 0, 1,
-1.069771, 0.1932763, -1.303946, 1, 0.8627451, 0, 1,
-1.062174, -0.3292797, -1.47158, 1, 0.8705882, 0, 1,
-1.059846, -0.2512353, -1.120307, 1, 0.8745098, 0, 1,
-1.057478, -0.6293962, 0.4959542, 1, 0.8823529, 0, 1,
-1.056144, 1.010844, -1.646628, 1, 0.8862745, 0, 1,
-1.049404, 0.8780566, -2.389751, 1, 0.8941177, 0, 1,
-1.048565, 0.4262589, -0.9860534, 1, 0.8980392, 0, 1,
-1.047013, 0.5812479, -2.546281, 1, 0.9058824, 0, 1,
-1.045077, 0.178998, -2.461215, 1, 0.9137255, 0, 1,
-1.043589, 1.359465, -2.011931, 1, 0.9176471, 0, 1,
-1.029343, 0.3966962, -1.401306, 1, 0.9254902, 0, 1,
-1.029047, -0.2777543, -1.947013, 1, 0.9294118, 0, 1,
-1.026085, -1.18198, -1.76561, 1, 0.9372549, 0, 1,
-1.024792, 1.779024, 2.40385, 1, 0.9411765, 0, 1,
-1.020992, 0.2963537, -2.026968, 1, 0.9490196, 0, 1,
-1.017987, -0.2009178, -1.046832, 1, 0.9529412, 0, 1,
-1.004362, 1.435421, -0.782196, 1, 0.9607843, 0, 1,
-1.000862, -0.3170167, -2.368759, 1, 0.9647059, 0, 1,
-0.9945475, 1.923867, -0.2235749, 1, 0.972549, 0, 1,
-0.9903641, -0.02234438, -3.008044, 1, 0.9764706, 0, 1,
-0.9840736, 1.458817, 0.2677424, 1, 0.9843137, 0, 1,
-0.9839236, -0.2498439, -1.30699, 1, 0.9882353, 0, 1,
-0.9796894, 0.6033711, -1.019715, 1, 0.9960784, 0, 1,
-0.9775338, 1.150706, -2.899943, 0.9960784, 1, 0, 1,
-0.9756821, -0.5597449, -3.673429, 0.9921569, 1, 0, 1,
-0.9740194, -0.6805933, -2.761687, 0.9843137, 1, 0, 1,
-0.9684541, -0.2842366, -1.756722, 0.9803922, 1, 0, 1,
-0.96325, -1.610465, -2.979856, 0.972549, 1, 0, 1,
-0.9622775, -0.896021, -4.657252, 0.9686275, 1, 0, 1,
-0.9589892, -0.03063866, -2.944309, 0.9607843, 1, 0, 1,
-0.9531975, -1.413149, -4.165871, 0.9568627, 1, 0, 1,
-0.9485171, 1.487617, -2.372285, 0.9490196, 1, 0, 1,
-0.946303, -1.353863, -1.840547, 0.945098, 1, 0, 1,
-0.9435402, 0.1621308, -2.169509, 0.9372549, 1, 0, 1,
-0.9424551, -0.7341688, -2.660305, 0.9333333, 1, 0, 1,
-0.9328309, -0.6550872, -1.381873, 0.9254902, 1, 0, 1,
-0.9322217, 0.07767823, -1.396932, 0.9215686, 1, 0, 1,
-0.931937, 0.8324027, 0.1270094, 0.9137255, 1, 0, 1,
-0.9243244, -1.219712, -2.163195, 0.9098039, 1, 0, 1,
-0.9223614, -1.195688, -2.886625, 0.9019608, 1, 0, 1,
-0.9202824, -0.6645171, -1.940486, 0.8941177, 1, 0, 1,
-0.9190835, 0.8296017, -1.037311, 0.8901961, 1, 0, 1,
-0.9115111, -0.9672928, -1.237847, 0.8823529, 1, 0, 1,
-0.9002279, 1.872632, 0.2182404, 0.8784314, 1, 0, 1,
-0.900088, 2.412118, 0.5989978, 0.8705882, 1, 0, 1,
-0.8921373, -0.6106014, -2.586068, 0.8666667, 1, 0, 1,
-0.8686096, -1.106363, -3.101711, 0.8588235, 1, 0, 1,
-0.8678892, 1.898799, 0.380801, 0.854902, 1, 0, 1,
-0.8598304, -0.3198944, -2.275728, 0.8470588, 1, 0, 1,
-0.8559363, -0.2288797, -1.356445, 0.8431373, 1, 0, 1,
-0.8539521, -0.4917579, -1.100897, 0.8352941, 1, 0, 1,
-0.8539198, -2.880122, -2.393557, 0.8313726, 1, 0, 1,
-0.8476853, 1.445532, 0.4770603, 0.8235294, 1, 0, 1,
-0.8468979, 0.005419797, -2.970272, 0.8196079, 1, 0, 1,
-0.8453429, -1.041467, -0.9006442, 0.8117647, 1, 0, 1,
-0.8404049, 1.350104, -0.1608735, 0.8078431, 1, 0, 1,
-0.8403921, -1.109226, -3.113187, 0.8, 1, 0, 1,
-0.8379835, -0.1535543, -1.361631, 0.7921569, 1, 0, 1,
-0.8346199, 0.3512259, -1.233024, 0.7882353, 1, 0, 1,
-0.8343645, 0.5013791, -3.557811, 0.7803922, 1, 0, 1,
-0.8338598, -0.404874, -1.160838, 0.7764706, 1, 0, 1,
-0.8060222, 1.03748, -1.112108, 0.7686275, 1, 0, 1,
-0.8050838, 0.2790995, -1.265883, 0.7647059, 1, 0, 1,
-0.8017493, 0.8711431, -0.4523447, 0.7568628, 1, 0, 1,
-0.8016475, -0.2791417, -2.378324, 0.7529412, 1, 0, 1,
-0.8002846, 0.6051838, -2.520908, 0.7450981, 1, 0, 1,
-0.7980074, -0.8596348, -1.638098, 0.7411765, 1, 0, 1,
-0.7922925, -0.7305467, -1.420965, 0.7333333, 1, 0, 1,
-0.7840113, -1.743116, -2.092195, 0.7294118, 1, 0, 1,
-0.7828926, -0.1750512, -2.184853, 0.7215686, 1, 0, 1,
-0.7818754, 0.248293, -0.2387349, 0.7176471, 1, 0, 1,
-0.7793313, -1.439, -2.550943, 0.7098039, 1, 0, 1,
-0.7788389, -0.5170953, -1.491409, 0.7058824, 1, 0, 1,
-0.7714083, -0.2816993, -2.117571, 0.6980392, 1, 0, 1,
-0.7688142, 1.307491, 0.3672566, 0.6901961, 1, 0, 1,
-0.7684209, -0.4815993, -2.725431, 0.6862745, 1, 0, 1,
-0.7672751, -0.7612795, 0.4827041, 0.6784314, 1, 0, 1,
-0.7590123, 0.2261202, 0.4836405, 0.6745098, 1, 0, 1,
-0.7573074, 0.5439987, 0.5495594, 0.6666667, 1, 0, 1,
-0.7555798, 0.5433685, -1.374829, 0.6627451, 1, 0, 1,
-0.7488389, 2.10074, -1.759027, 0.654902, 1, 0, 1,
-0.7435725, -1.52186, -4.007223, 0.6509804, 1, 0, 1,
-0.7381839, -0.01213308, -1.51798, 0.6431373, 1, 0, 1,
-0.7326212, -1.169084, -4.638404, 0.6392157, 1, 0, 1,
-0.7270803, -1.676479, -3.230768, 0.6313726, 1, 0, 1,
-0.7265889, -1.469718, -1.217149, 0.627451, 1, 0, 1,
-0.7211484, 0.03951106, -1.670547, 0.6196079, 1, 0, 1,
-0.7194623, 0.3335079, -1.786682, 0.6156863, 1, 0, 1,
-0.7157198, 0.1310692, -1.535847, 0.6078432, 1, 0, 1,
-0.714166, -0.2429731, -1.60341, 0.6039216, 1, 0, 1,
-0.7135147, 0.01303514, -2.505419, 0.5960785, 1, 0, 1,
-0.7132503, 0.4553039, -0.4903526, 0.5882353, 1, 0, 1,
-0.707069, -0.3557515, -4.290036, 0.5843138, 1, 0, 1,
-0.7060947, -0.7594733, -3.586655, 0.5764706, 1, 0, 1,
-0.6989108, -0.05904058, -0.6111374, 0.572549, 1, 0, 1,
-0.6970433, -0.9696998, -3.679354, 0.5647059, 1, 0, 1,
-0.6961515, 0.9919235, -0.4031731, 0.5607843, 1, 0, 1,
-0.6956993, 0.3390921, 0.2073618, 0.5529412, 1, 0, 1,
-0.694996, -0.09325004, -2.531263, 0.5490196, 1, 0, 1,
-0.6940522, -1.138252, -1.5561, 0.5411765, 1, 0, 1,
-0.6880009, -0.4933155, 0.1979307, 0.5372549, 1, 0, 1,
-0.6863049, 1.547496, -1.365711, 0.5294118, 1, 0, 1,
-0.6835009, -0.2219638, -2.086271, 0.5254902, 1, 0, 1,
-0.682149, -1.211731, -3.091571, 0.5176471, 1, 0, 1,
-0.6755259, -0.8537788, -3.443134, 0.5137255, 1, 0, 1,
-0.6717283, -0.5872533, -1.469459, 0.5058824, 1, 0, 1,
-0.6654617, -1.201648, -2.170077, 0.5019608, 1, 0, 1,
-0.6654456, 2.090373, -0.8504241, 0.4941176, 1, 0, 1,
-0.6602916, 2.226227, 0.1574476, 0.4862745, 1, 0, 1,
-0.6562911, 1.458271, 2.430068, 0.4823529, 1, 0, 1,
-0.6469246, 0.12527, -2.3504, 0.4745098, 1, 0, 1,
-0.6444691, -0.6163244, -2.703067, 0.4705882, 1, 0, 1,
-0.6434717, -0.2720737, -2.167337, 0.4627451, 1, 0, 1,
-0.6391376, 0.4460242, -1.599449, 0.4588235, 1, 0, 1,
-0.6315319, -0.5359341, -1.108192, 0.4509804, 1, 0, 1,
-0.6306341, -0.7963335, -3.065207, 0.4470588, 1, 0, 1,
-0.626708, 0.7912419, 0.6819028, 0.4392157, 1, 0, 1,
-0.6266674, 0.2445327, -0.756627, 0.4352941, 1, 0, 1,
-0.6185315, -1.126104, -3.921333, 0.427451, 1, 0, 1,
-0.612087, 0.8147916, -1.372131, 0.4235294, 1, 0, 1,
-0.6036736, -0.2366543, -3.13794, 0.4156863, 1, 0, 1,
-0.5980158, 2.004291, 0.593661, 0.4117647, 1, 0, 1,
-0.5929187, -1.001657, -3.521311, 0.4039216, 1, 0, 1,
-0.5900047, 1.895726, -0.7833349, 0.3960784, 1, 0, 1,
-0.588465, -0.6743336, -2.92158, 0.3921569, 1, 0, 1,
-0.5862498, -3.338719, -3.478261, 0.3843137, 1, 0, 1,
-0.5816478, 0.107773, -1.703898, 0.3803922, 1, 0, 1,
-0.5773981, -0.2492455, -1.344456, 0.372549, 1, 0, 1,
-0.5758347, 0.6372564, -1.006212, 0.3686275, 1, 0, 1,
-0.5713901, -0.5467865, -2.602507, 0.3607843, 1, 0, 1,
-0.5664405, 0.6479971, 1.220804, 0.3568628, 1, 0, 1,
-0.5662593, 1.108015, -0.8052321, 0.3490196, 1, 0, 1,
-0.5656908, -0.4901798, -2.825078, 0.345098, 1, 0, 1,
-0.565585, -0.3080612, -3.535396, 0.3372549, 1, 0, 1,
-0.5636647, 1.020834, -2.572762, 0.3333333, 1, 0, 1,
-0.556132, 0.1592994, -0.6516361, 0.3254902, 1, 0, 1,
-0.555361, 2.792678, 0.1048974, 0.3215686, 1, 0, 1,
-0.5537095, 0.2739565, -2.323344, 0.3137255, 1, 0, 1,
-0.5510769, 1.769679, -0.07152636, 0.3098039, 1, 0, 1,
-0.5484724, -0.348967, -3.69504, 0.3019608, 1, 0, 1,
-0.5474148, -0.5001377, -3.193009, 0.2941177, 1, 0, 1,
-0.5469726, 0.1493385, -0.8757073, 0.2901961, 1, 0, 1,
-0.5456228, -0.02045323, -2.73627, 0.282353, 1, 0, 1,
-0.5437171, -0.5414336, -2.308988, 0.2784314, 1, 0, 1,
-0.5427305, 0.4672241, -1.142395, 0.2705882, 1, 0, 1,
-0.5391524, -0.3071514, -1.491593, 0.2666667, 1, 0, 1,
-0.5289017, 0.3837909, 0.7553608, 0.2588235, 1, 0, 1,
-0.5272246, 1.754047, 0.2433589, 0.254902, 1, 0, 1,
-0.5271074, -0.3193707, -3.149915, 0.2470588, 1, 0, 1,
-0.5258694, 0.1571529, -0.5188479, 0.2431373, 1, 0, 1,
-0.5257217, -0.9049779, -2.869509, 0.2352941, 1, 0, 1,
-0.5251363, 0.1902051, -1.798814, 0.2313726, 1, 0, 1,
-0.5192109, -1.293755, -3.793824, 0.2235294, 1, 0, 1,
-0.5190498, 0.8139184, -0.7134411, 0.2196078, 1, 0, 1,
-0.5155146, -0.2938077, -2.942148, 0.2117647, 1, 0, 1,
-0.507009, -0.7842439, -1.393739, 0.2078431, 1, 0, 1,
-0.5059762, 1.322978, 0.8273447, 0.2, 1, 0, 1,
-0.5016509, -0.1177431, -1.833436, 0.1921569, 1, 0, 1,
-0.5011089, 0.6549826, -0.4812947, 0.1882353, 1, 0, 1,
-0.4974973, -1.758881, -2.723311, 0.1803922, 1, 0, 1,
-0.4965115, -1.227618, -1.386521, 0.1764706, 1, 0, 1,
-0.4891878, 0.947454, -1.154529, 0.1686275, 1, 0, 1,
-0.4891085, 0.9014813, -0.7624645, 0.1647059, 1, 0, 1,
-0.4890818, -2.321273, -2.813231, 0.1568628, 1, 0, 1,
-0.4870449, 0.6700385, -0.01991363, 0.1529412, 1, 0, 1,
-0.4852858, -0.2371545, -1.835845, 0.145098, 1, 0, 1,
-0.4841146, 0.8975889, -1.29065, 0.1411765, 1, 0, 1,
-0.4822524, -0.02171627, -1.846154, 0.1333333, 1, 0, 1,
-0.4811231, 0.1911303, -1.785248, 0.1294118, 1, 0, 1,
-0.4781648, 1.081084, -0.1319267, 0.1215686, 1, 0, 1,
-0.4776122, 1.253623, 0.8589393, 0.1176471, 1, 0, 1,
-0.4767534, -1.489053, -4.319727, 0.1098039, 1, 0, 1,
-0.4722683, 1.581188, 0.6786553, 0.1058824, 1, 0, 1,
-0.4715934, 0.7567687, -1.001379, 0.09803922, 1, 0, 1,
-0.4689308, -0.9992419, -2.193983, 0.09019608, 1, 0, 1,
-0.46612, 1.313128, -0.6798796, 0.08627451, 1, 0, 1,
-0.4643089, 0.4013289, -0.70794, 0.07843138, 1, 0, 1,
-0.4628965, 1.362161, 1.247682, 0.07450981, 1, 0, 1,
-0.4576949, 0.7090082, -0.5521477, 0.06666667, 1, 0, 1,
-0.4549588, 0.4327774, -0.964523, 0.0627451, 1, 0, 1,
-0.4547873, -0.01828215, -1.19119, 0.05490196, 1, 0, 1,
-0.4544669, 0.8498781, -0.635288, 0.05098039, 1, 0, 1,
-0.4508252, 1.586408, 1.33293, 0.04313726, 1, 0, 1,
-0.4463172, -0.4128934, -2.053702, 0.03921569, 1, 0, 1,
-0.4441186, 1.080056, -0.6567652, 0.03137255, 1, 0, 1,
-0.4417871, 0.7399911, 0.6258008, 0.02745098, 1, 0, 1,
-0.4413337, -0.9836122, -2.568083, 0.01960784, 1, 0, 1,
-0.4369514, -1.338809, -2.880565, 0.01568628, 1, 0, 1,
-0.4355192, 0.4079589, 1.011214, 0.007843138, 1, 0, 1,
-0.4309826, 0.7237015, 0.2122233, 0.003921569, 1, 0, 1,
-0.4308852, 1.196437, 1.330751, 0, 1, 0.003921569, 1,
-0.4253651, 0.7884728, -0.5019639, 0, 1, 0.01176471, 1,
-0.421795, 0.8470404, 0.01244054, 0, 1, 0.01568628, 1,
-0.4215151, -0.4961136, -1.963552, 0, 1, 0.02352941, 1,
-0.4198427, 0.9291089, -1.075311, 0, 1, 0.02745098, 1,
-0.4180727, 0.3736925, -0.8712533, 0, 1, 0.03529412, 1,
-0.4122382, 1.599449, 0.2574015, 0, 1, 0.03921569, 1,
-0.4039488, -0.7164176, -2.103887, 0, 1, 0.04705882, 1,
-0.3979808, 0.7137478, -0.7445034, 0, 1, 0.05098039, 1,
-0.3971449, -0.3191078, -1.702246, 0, 1, 0.05882353, 1,
-0.3950904, 0.183598, -1.766886, 0, 1, 0.0627451, 1,
-0.3933499, 0.5611001, -0.6192221, 0, 1, 0.07058824, 1,
-0.3879025, -0.01374653, -1.396971, 0, 1, 0.07450981, 1,
-0.381916, 0.2828802, -0.7591575, 0, 1, 0.08235294, 1,
-0.378833, -0.7904982, -2.457402, 0, 1, 0.08627451, 1,
-0.3759245, -1.843029, -0.5169291, 0, 1, 0.09411765, 1,
-0.3757106, -1.698495, -2.815882, 0, 1, 0.1019608, 1,
-0.3736551, -0.9857554, -1.685044, 0, 1, 0.1058824, 1,
-0.3712904, -1.906754, -2.378421, 0, 1, 0.1137255, 1,
-0.369715, 1.12839, -1.211987, 0, 1, 0.1176471, 1,
-0.3626304, 1.456316, -0.5977716, 0, 1, 0.1254902, 1,
-0.3609715, -0.1532975, -3.686181, 0, 1, 0.1294118, 1,
-0.3599619, -1.553414, -1.018797, 0, 1, 0.1372549, 1,
-0.3522916, 1.807334, -0.5900217, 0, 1, 0.1411765, 1,
-0.3468845, -0.9090749, -2.826382, 0, 1, 0.1490196, 1,
-0.3451055, 1.452127, 1.179543, 0, 1, 0.1529412, 1,
-0.3438372, 0.3879777, -1.56719, 0, 1, 0.1607843, 1,
-0.3424219, -1.667557, -3.844366, 0, 1, 0.1647059, 1,
-0.3365346, -1.053337, -3.149248, 0, 1, 0.172549, 1,
-0.3338915, 0.6773531, 1.066188, 0, 1, 0.1764706, 1,
-0.3312976, -0.8117804, -2.312621, 0, 1, 0.1843137, 1,
-0.3299999, 1.619035, 1.113982, 0, 1, 0.1882353, 1,
-0.3284137, -1.90782, -2.733748, 0, 1, 0.1960784, 1,
-0.3254651, -0.5249431, -1.642785, 0, 1, 0.2039216, 1,
-0.3110023, 2.00784, 1.31617, 0, 1, 0.2078431, 1,
-0.3105081, -0.7754306, -1.504357, 0, 1, 0.2156863, 1,
-0.3099524, 1.349191, 0.2135314, 0, 1, 0.2196078, 1,
-0.3069349, -1.74839, -3.093934, 0, 1, 0.227451, 1,
-0.2950894, 1.35905, 1.380552, 0, 1, 0.2313726, 1,
-0.2946912, -0.5596782, -1.405779, 0, 1, 0.2392157, 1,
-0.2924485, 0.2569368, 0.2882024, 0, 1, 0.2431373, 1,
-0.2923065, -0.1605133, -1.427907, 0, 1, 0.2509804, 1,
-0.2922767, 0.02534088, -0.4135148, 0, 1, 0.254902, 1,
-0.2911319, -0.5787416, -2.165439, 0, 1, 0.2627451, 1,
-0.28944, 0.9607794, 0.2846623, 0, 1, 0.2666667, 1,
-0.2891965, -1.042081, -1.150889, 0, 1, 0.2745098, 1,
-0.2850541, 1.444677, -0.1602775, 0, 1, 0.2784314, 1,
-0.2841151, 1.167498, -1.843139, 0, 1, 0.2862745, 1,
-0.2785824, 0.4255672, -1.889593, 0, 1, 0.2901961, 1,
-0.2782086, -1.052936, -2.949295, 0, 1, 0.2980392, 1,
-0.276323, -0.6907273, -0.8722849, 0, 1, 0.3058824, 1,
-0.2741443, 0.4131475, -0.3676749, 0, 1, 0.3098039, 1,
-0.2710428, -1.32983, -3.394209, 0, 1, 0.3176471, 1,
-0.2704961, -0.6732558, -2.509271, 0, 1, 0.3215686, 1,
-0.2699043, -0.9732143, -2.385796, 0, 1, 0.3294118, 1,
-0.2681439, -1.429838, -2.856982, 0, 1, 0.3333333, 1,
-0.2667404, 0.8001381, 0.8383002, 0, 1, 0.3411765, 1,
-0.2651045, -0.2094495, -3.286626, 0, 1, 0.345098, 1,
-0.2641755, 0.4097452, -1.926343, 0, 1, 0.3529412, 1,
-0.2592582, -0.4998733, -2.955074, 0, 1, 0.3568628, 1,
-0.2578422, 1.485993, 0.6387865, 0, 1, 0.3647059, 1,
-0.2504996, 0.1051132, -0.9293664, 0, 1, 0.3686275, 1,
-0.2497059, -2.222723, -2.282923, 0, 1, 0.3764706, 1,
-0.2485737, 0.8662549, -1.178028, 0, 1, 0.3803922, 1,
-0.2478529, 0.7987577, -0.1397146, 0, 1, 0.3882353, 1,
-0.243684, 1.526358, 1.322795, 0, 1, 0.3921569, 1,
-0.2425066, 1.364601, -0.5132892, 0, 1, 0.4, 1,
-0.2414103, -0.4327314, -1.922518, 0, 1, 0.4078431, 1,
-0.2352329, -0.08524448, -0.6098304, 0, 1, 0.4117647, 1,
-0.2347599, -1.601793, -3.721509, 0, 1, 0.4196078, 1,
-0.2346603, 1.444321, -0.6812441, 0, 1, 0.4235294, 1,
-0.2298923, 1.580158, 1.664156, 0, 1, 0.4313726, 1,
-0.2279995, -0.3428745, -0.9843854, 0, 1, 0.4352941, 1,
-0.2261774, -0.3119121, -2.194083, 0, 1, 0.4431373, 1,
-0.2232944, -0.4504592, -3.223183, 0, 1, 0.4470588, 1,
-0.2210419, -0.9258304, -2.452493, 0, 1, 0.454902, 1,
-0.2207237, 1.852424, -1.043386, 0, 1, 0.4588235, 1,
-0.2188055, -0.056568, -1.895427, 0, 1, 0.4666667, 1,
-0.2173106, 0.08900373, 0.2086314, 0, 1, 0.4705882, 1,
-0.2144215, 0.173317, -1.409264, 0, 1, 0.4784314, 1,
-0.2103569, 0.5524851, -1.992075, 0, 1, 0.4823529, 1,
-0.209847, 0.6471549, 0.5421594, 0, 1, 0.4901961, 1,
-0.2062667, -1.074321, -3.188113, 0, 1, 0.4941176, 1,
-0.2062012, -0.7420483, -1.355747, 0, 1, 0.5019608, 1,
-0.2059525, 0.700895, -1.701838, 0, 1, 0.509804, 1,
-0.203817, -0.2466184, -1.674885, 0, 1, 0.5137255, 1,
-0.2026674, -0.1152442, -2.598526, 0, 1, 0.5215687, 1,
-0.2022245, 0.5857328, -1.354871, 0, 1, 0.5254902, 1,
-0.1981681, -0.4756002, -3.897343, 0, 1, 0.5333334, 1,
-0.1944593, 1.303294, 0.2488578, 0, 1, 0.5372549, 1,
-0.1944048, -0.4626681, -1.900386, 0, 1, 0.5450981, 1,
-0.1907515, 1.178357, 1.833, 0, 1, 0.5490196, 1,
-0.1836441, -0.3049553, -1.920878, 0, 1, 0.5568628, 1,
-0.1811468, -1.068574, -3.055551, 0, 1, 0.5607843, 1,
-0.1801035, -0.474312, -2.456588, 0, 1, 0.5686275, 1,
-0.1786426, 0.08986869, 0.6663858, 0, 1, 0.572549, 1,
-0.177518, 0.03959475, -1.243888, 0, 1, 0.5803922, 1,
-0.1754988, -0.2903574, -1.790728, 0, 1, 0.5843138, 1,
-0.1746071, -2.475953, -2.444504, 0, 1, 0.5921569, 1,
-0.1738743, -0.08952539, -1.335731, 0, 1, 0.5960785, 1,
-0.1719848, -0.4937261, -2.236708, 0, 1, 0.6039216, 1,
-0.1714554, -0.4646236, -2.071835, 0, 1, 0.6117647, 1,
-0.1634702, -1.476215, -2.518708, 0, 1, 0.6156863, 1,
-0.1631819, -1.778962, -2.548327, 0, 1, 0.6235294, 1,
-0.1617136, 0.3111498, -1.905641, 0, 1, 0.627451, 1,
-0.1591083, -1.674563, -3.199346, 0, 1, 0.6352941, 1,
-0.1579189, 0.6950686, 0.6614109, 0, 1, 0.6392157, 1,
-0.1544756, -1.138964, -2.735478, 0, 1, 0.6470588, 1,
-0.1538955, -1.142022, -2.58656, 0, 1, 0.6509804, 1,
-0.1524743, 1.5559, 1.77763, 0, 1, 0.6588235, 1,
-0.1523643, 1.669513, -0.568787, 0, 1, 0.6627451, 1,
-0.148976, -0.1679509, -3.306861, 0, 1, 0.6705883, 1,
-0.1427701, -0.449322, -3.76227, 0, 1, 0.6745098, 1,
-0.1403947, 0.7967075, -1.167996, 0, 1, 0.682353, 1,
-0.1399725, 1.174061, 0.3106731, 0, 1, 0.6862745, 1,
-0.1394708, -0.1043867, -3.687018, 0, 1, 0.6941177, 1,
-0.1388352, -0.4973028, -2.980391, 0, 1, 0.7019608, 1,
-0.1379659, 1.397502, -1.059237, 0, 1, 0.7058824, 1,
-0.1373524, 0.3422292, -1.084107, 0, 1, 0.7137255, 1,
-0.1361468, -0.9540648, -2.592629, 0, 1, 0.7176471, 1,
-0.1330141, -0.7158644, -1.058226, 0, 1, 0.7254902, 1,
-0.1320597, 0.8650662, 1.080862, 0, 1, 0.7294118, 1,
-0.1118094, -2.410442, -3.404834, 0, 1, 0.7372549, 1,
-0.1110338, -0.5074909, -2.376877, 0, 1, 0.7411765, 1,
-0.1108156, -0.5281433, -4.821309, 0, 1, 0.7490196, 1,
-0.1099993, -1.010638, -4.212697, 0, 1, 0.7529412, 1,
-0.1085442, 0.5225158, -1.782574, 0, 1, 0.7607843, 1,
-0.1051022, -1.055616, -5.418497, 0, 1, 0.7647059, 1,
-0.09879371, 1.695602, -0.01020589, 0, 1, 0.772549, 1,
-0.09809323, 1.010087, -0.3155649, 0, 1, 0.7764706, 1,
-0.09745531, 0.2590083, -0.2837804, 0, 1, 0.7843137, 1,
-0.09706327, 0.9591726, 0.9642785, 0, 1, 0.7882353, 1,
-0.09672742, 0.7975605, 0.6125759, 0, 1, 0.7960784, 1,
-0.09672561, 0.2197032, 0.6498421, 0, 1, 0.8039216, 1,
-0.09510315, 0.5458118, -0.2704256, 0, 1, 0.8078431, 1,
-0.09445341, -0.09343247, -1.42849, 0, 1, 0.8156863, 1,
-0.09066329, 0.579009, -1.140742, 0, 1, 0.8196079, 1,
-0.08445167, 0.8741411, 0.3500211, 0, 1, 0.827451, 1,
-0.08272532, -2.670366, -2.02047, 0, 1, 0.8313726, 1,
-0.08260517, -1.497019, -0.8280839, 0, 1, 0.8392157, 1,
-0.08023499, 1.016884, 1.645417, 0, 1, 0.8431373, 1,
-0.07695594, -0.3834255, -2.07816, 0, 1, 0.8509804, 1,
-0.07623366, 1.623641, 0.8434296, 0, 1, 0.854902, 1,
-0.07617573, 1.424301, 2.319626, 0, 1, 0.8627451, 1,
-0.07395971, -1.996276, -4.2032, 0, 1, 0.8666667, 1,
-0.07271075, 0.1535271, -1.784207, 0, 1, 0.8745098, 1,
-0.0727093, 0.515734, -0.3033837, 0, 1, 0.8784314, 1,
-0.06509374, 1.533693, -0.3105215, 0, 1, 0.8862745, 1,
-0.06276963, 0.7494664, 1.472623, 0, 1, 0.8901961, 1,
-0.06126226, 1.806821, -0.7131228, 0, 1, 0.8980392, 1,
-0.05981598, 0.7383959, 1.146356, 0, 1, 0.9058824, 1,
-0.05785664, -0.2517849, -2.224307, 0, 1, 0.9098039, 1,
-0.05708031, -0.5031684, -3.478717, 0, 1, 0.9176471, 1,
-0.05544386, 1.555656, -0.1524212, 0, 1, 0.9215686, 1,
-0.05390698, -0.5727063, -2.695243, 0, 1, 0.9294118, 1,
-0.05172215, -1.341607, -4.804763, 0, 1, 0.9333333, 1,
-0.05159101, -0.4107495, -3.054951, 0, 1, 0.9411765, 1,
-0.05150846, -0.128887, -2.55338, 0, 1, 0.945098, 1,
-0.04778219, 0.4695092, -0.3904831, 0, 1, 0.9529412, 1,
-0.04422943, -0.791785, -3.221938, 0, 1, 0.9568627, 1,
-0.04416753, -0.7968113, -2.152792, 0, 1, 0.9647059, 1,
-0.04257685, 0.4572333, 0.9278539, 0, 1, 0.9686275, 1,
-0.03927406, 0.4091544, 0.09655429, 0, 1, 0.9764706, 1,
-0.0343463, -0.5841315, -4.984297, 0, 1, 0.9803922, 1,
-0.03228572, 0.6208973, 0.05099232, 0, 1, 0.9882353, 1,
-0.03151076, 0.3122863, -1.898707, 0, 1, 0.9921569, 1,
-0.02848216, 0.2054776, -0.5295161, 0, 1, 1, 1,
-0.0257544, 1.798906, -0.09971791, 0, 0.9921569, 1, 1,
-0.0212389, 1.256537, 0.3080549, 0, 0.9882353, 1, 1,
-0.02067893, -1.180311, -4.21802, 0, 0.9803922, 1, 1,
-0.01905452, 2.034621, 1.268307, 0, 0.9764706, 1, 1,
-0.01477325, -0.1248984, -4.106351, 0, 0.9686275, 1, 1,
-0.01221603, 0.265512, -1.349396, 0, 0.9647059, 1, 1,
-0.01220923, -1.621801, -1.843962, 0, 0.9568627, 1, 1,
-0.007251723, 1.121375, -0.7920601, 0, 0.9529412, 1, 1,
-0.005775538, -0.2659035, -3.176423, 0, 0.945098, 1, 1,
-0.005679062, -0.5400237, -3.622797, 0, 0.9411765, 1, 1,
-0.002940467, 1.556566, -0.8713449, 0, 0.9333333, 1, 1,
-0.002029034, 0.5581522, 0.8007871, 0, 0.9294118, 1, 1,
-0.0005229342, -0.1728308, -3.921039, 0, 0.9215686, 1, 1,
0.0008544584, 0.671132, -0.177671, 0, 0.9176471, 1, 1,
0.001640752, 0.3206606, 1.103583, 0, 0.9098039, 1, 1,
0.006097025, -0.6290814, 3.397699, 0, 0.9058824, 1, 1,
0.00815092, -0.8125777, 2.216126, 0, 0.8980392, 1, 1,
0.01130509, 0.4907633, 1.634171, 0, 0.8901961, 1, 1,
0.01203087, -1.28871, 3.474749, 0, 0.8862745, 1, 1,
0.01391522, 0.449157, 0.2068175, 0, 0.8784314, 1, 1,
0.01445969, -0.4001062, 4.847347, 0, 0.8745098, 1, 1,
0.0160167, -1.182305, 2.037036, 0, 0.8666667, 1, 1,
0.02191189, 0.5939017, 0.1736359, 0, 0.8627451, 1, 1,
0.02205184, -0.1572215, 3.041476, 0, 0.854902, 1, 1,
0.02630539, 0.01814834, 0.9999291, 0, 0.8509804, 1, 1,
0.03756704, 0.1035041, -1.742433, 0, 0.8431373, 1, 1,
0.03776551, -0.7393709, 2.689216, 0, 0.8392157, 1, 1,
0.0444404, -0.6977451, 2.381606, 0, 0.8313726, 1, 1,
0.04467246, 0.7504665, 0.5821338, 0, 0.827451, 1, 1,
0.04652672, -0.652752, 2.605096, 0, 0.8196079, 1, 1,
0.04733174, 1.649698, 0.8961251, 0, 0.8156863, 1, 1,
0.05148583, -0.8858956, 4.278358, 0, 0.8078431, 1, 1,
0.05242613, 0.691656, 0.3998525, 0, 0.8039216, 1, 1,
0.05703593, 0.1422461, 0.6484709, 0, 0.7960784, 1, 1,
0.0652101, 0.6956561, -0.7000976, 0, 0.7882353, 1, 1,
0.06614781, 0.3449687, 0.1480848, 0, 0.7843137, 1, 1,
0.06986754, -0.4253114, 4.301258, 0, 0.7764706, 1, 1,
0.07104036, -0.4938431, 1.961241, 0, 0.772549, 1, 1,
0.07211258, -0.02425548, 1.542463, 0, 0.7647059, 1, 1,
0.07335695, -1.217493, 3.470934, 0, 0.7607843, 1, 1,
0.07889668, -0.1259212, 3.503427, 0, 0.7529412, 1, 1,
0.08348827, 0.008854648, 2.19234, 0, 0.7490196, 1, 1,
0.08440744, 0.5389007, 0.2932116, 0, 0.7411765, 1, 1,
0.08582349, -0.008203589, 2.511481, 0, 0.7372549, 1, 1,
0.0863499, -0.7672692, 2.625907, 0, 0.7294118, 1, 1,
0.08676188, 1.175084, -0.08345933, 0, 0.7254902, 1, 1,
0.08911604, -0.5782586, 3.080295, 0, 0.7176471, 1, 1,
0.08984536, 1.567143, 0.6540133, 0, 0.7137255, 1, 1,
0.09391392, 0.9194645, -0.2858209, 0, 0.7058824, 1, 1,
0.09484737, 0.1321006, 0.8982784, 0, 0.6980392, 1, 1,
0.09792009, 0.2503927, -0.5139275, 0, 0.6941177, 1, 1,
0.09956444, -1.241069, 3.714812, 0, 0.6862745, 1, 1,
0.09969796, 0.6124271, 1.499469, 0, 0.682353, 1, 1,
0.1000604, 0.785682, -0.521153, 0, 0.6745098, 1, 1,
0.1062229, 0.167924, 1.404912, 0, 0.6705883, 1, 1,
0.1069297, 1.612172, 0.7092167, 0, 0.6627451, 1, 1,
0.1121357, 2.602131, -0.01781163, 0, 0.6588235, 1, 1,
0.1140787, 0.2744986, -0.2463815, 0, 0.6509804, 1, 1,
0.1147951, -0.9516346, 3.547153, 0, 0.6470588, 1, 1,
0.1167999, -0.7617738, 5.301486, 0, 0.6392157, 1, 1,
0.1172597, 0.2976328, 1.444644, 0, 0.6352941, 1, 1,
0.1175264, 1.211997, -0.4868081, 0, 0.627451, 1, 1,
0.119774, -0.6385944, 2.609501, 0, 0.6235294, 1, 1,
0.1207242, 1.525508, 1.769481, 0, 0.6156863, 1, 1,
0.123957, 1.350556, -1.486198, 0, 0.6117647, 1, 1,
0.1386451, 1.805319, 0.8096226, 0, 0.6039216, 1, 1,
0.1429706, -0.3832689, 2.330878, 0, 0.5960785, 1, 1,
0.145208, 0.846562, -0.6597711, 0, 0.5921569, 1, 1,
0.1480042, 0.7776617, -0.1567995, 0, 0.5843138, 1, 1,
0.1480998, 0.1561175, 0.1039404, 0, 0.5803922, 1, 1,
0.1491167, 1.615542, 0.4374764, 0, 0.572549, 1, 1,
0.150979, 0.4337652, 0.7791963, 0, 0.5686275, 1, 1,
0.152413, 0.5748546, 0.2404496, 0, 0.5607843, 1, 1,
0.1570621, -0.5119649, 4.077913, 0, 0.5568628, 1, 1,
0.1599289, -0.7483022, 3.065289, 0, 0.5490196, 1, 1,
0.1618222, 0.6034699, 0.08888038, 0, 0.5450981, 1, 1,
0.1636729, 1.035481, 0.6853241, 0, 0.5372549, 1, 1,
0.1639616, -1.751048, 2.514289, 0, 0.5333334, 1, 1,
0.1643122, -0.04046632, 1.548725, 0, 0.5254902, 1, 1,
0.1687195, 0.9074199, -0.8503725, 0, 0.5215687, 1, 1,
0.1734648, 0.8809809, 1.316824, 0, 0.5137255, 1, 1,
0.1742174, -1.134433, 3.37585, 0, 0.509804, 1, 1,
0.1800705, -0.3846749, 1.44399, 0, 0.5019608, 1, 1,
0.1802564, -0.5311885, 3.010545, 0, 0.4941176, 1, 1,
0.1803088, 1.568947, 1.281982, 0, 0.4901961, 1, 1,
0.1810446, 0.4755151, 1.102192, 0, 0.4823529, 1, 1,
0.1812508, 1.503779, -0.6462252, 0, 0.4784314, 1, 1,
0.1857795, 1.459802, -1.153586, 0, 0.4705882, 1, 1,
0.1916641, -0.6450014, 1.524969, 0, 0.4666667, 1, 1,
0.1959483, -0.8356423, 3.602165, 0, 0.4588235, 1, 1,
0.1967188, -0.1726414, 1.775058, 0, 0.454902, 1, 1,
0.1974292, -2.034379, 1.853525, 0, 0.4470588, 1, 1,
0.1996694, 0.3823919, 1.002244, 0, 0.4431373, 1, 1,
0.2054447, -2.48983, 3.489351, 0, 0.4352941, 1, 1,
0.2066038, -1.22657, 3.349707, 0, 0.4313726, 1, 1,
0.208181, 0.8250747, -1.035031, 0, 0.4235294, 1, 1,
0.2086087, -0.6134276, 2.256613, 0, 0.4196078, 1, 1,
0.209088, 0.6412891, 0.6759591, 0, 0.4117647, 1, 1,
0.213287, -1.325526, 0.3789507, 0, 0.4078431, 1, 1,
0.2169423, -0.05105042, 0.7518151, 0, 0.4, 1, 1,
0.2193945, -1.14455, 3.421348, 0, 0.3921569, 1, 1,
0.2195747, -1.222643, 3.417984, 0, 0.3882353, 1, 1,
0.2207897, -0.05991522, 2.454288, 0, 0.3803922, 1, 1,
0.2235874, 0.7442095, -0.05645429, 0, 0.3764706, 1, 1,
0.2238767, -1.205062, 5.577979, 0, 0.3686275, 1, 1,
0.2317974, -0.082216, 2.447741, 0, 0.3647059, 1, 1,
0.2322781, 1.187767, 0.4581057, 0, 0.3568628, 1, 1,
0.23574, -1.806599, 3.337226, 0, 0.3529412, 1, 1,
0.236803, 0.8501753, 0.8695571, 0, 0.345098, 1, 1,
0.2378809, 1.988379, 0.3517641, 0, 0.3411765, 1, 1,
0.2433379, 1.099808, -1.155588, 0, 0.3333333, 1, 1,
0.2433454, 0.1321286, 0.5650669, 0, 0.3294118, 1, 1,
0.2446395, 0.4947409, 0.06188596, 0, 0.3215686, 1, 1,
0.2467251, -0.001793436, 1.673512, 0, 0.3176471, 1, 1,
0.2485203, -0.06971932, 1.046216, 0, 0.3098039, 1, 1,
0.248681, -0.3254106, 3.578435, 0, 0.3058824, 1, 1,
0.2531008, 0.03236456, 1.613467, 0, 0.2980392, 1, 1,
0.2540914, -0.0346726, 0.6053467, 0, 0.2901961, 1, 1,
0.254316, -0.9946108, 2.525831, 0, 0.2862745, 1, 1,
0.2552344, -0.8543983, 3.138323, 0, 0.2784314, 1, 1,
0.2580764, -0.8988547, 2.895877, 0, 0.2745098, 1, 1,
0.2586112, -0.6875151, 4.834975, 0, 0.2666667, 1, 1,
0.2617744, 0.7926571, -1.373008, 0, 0.2627451, 1, 1,
0.2723686, 0.6130014, -1.864458, 0, 0.254902, 1, 1,
0.2759238, -0.8768237, 2.352749, 0, 0.2509804, 1, 1,
0.278613, -0.2795116, 3.702464, 0, 0.2431373, 1, 1,
0.2797424, 0.396792, 2.1096, 0, 0.2392157, 1, 1,
0.2830265, 0.5858231, 1.811343, 0, 0.2313726, 1, 1,
0.2833392, -1.171136, 3.6274, 0, 0.227451, 1, 1,
0.284999, -0.4434279, 1.864912, 0, 0.2196078, 1, 1,
0.2851431, -1.150325, 3.654047, 0, 0.2156863, 1, 1,
0.2899854, -1.575128, 4.619123, 0, 0.2078431, 1, 1,
0.2986952, -1.687191, 3.010515, 0, 0.2039216, 1, 1,
0.3021462, 0.5422361, -0.8605732, 0, 0.1960784, 1, 1,
0.3076923, 0.2778864, -0.2770655, 0, 0.1882353, 1, 1,
0.3076946, 1.514605, 0.8121451, 0, 0.1843137, 1, 1,
0.3128173, 0.292181, -0.3992347, 0, 0.1764706, 1, 1,
0.3146973, -0.2042924, 1.518311, 0, 0.172549, 1, 1,
0.3166968, -2.190953, 0.9752604, 0, 0.1647059, 1, 1,
0.3239268, 0.6768553, -0.7985899, 0, 0.1607843, 1, 1,
0.3283139, 0.1563898, 3.510431, 0, 0.1529412, 1, 1,
0.328853, -0.1497614, 2.35078, 0, 0.1490196, 1, 1,
0.3343089, -0.2669567, 2.386974, 0, 0.1411765, 1, 1,
0.3350881, -0.06482417, 1.421557, 0, 0.1372549, 1, 1,
0.337567, 1.059568, 0.1902384, 0, 0.1294118, 1, 1,
0.3400884, 0.5813988, 1.414721, 0, 0.1254902, 1, 1,
0.3411708, 2.504198, 1.454244, 0, 0.1176471, 1, 1,
0.3457012, 0.06001626, 3.053499, 0, 0.1137255, 1, 1,
0.3462512, 0.3857448, -0.5666295, 0, 0.1058824, 1, 1,
0.3479594, -0.9398144, 2.292778, 0, 0.09803922, 1, 1,
0.3488145, -0.4277705, 6.3274, 0, 0.09411765, 1, 1,
0.3488367, 1.298472, 0.8784556, 0, 0.08627451, 1, 1,
0.3502192, -1.393598, 3.051408, 0, 0.08235294, 1, 1,
0.3541078, 1.032291, 1.357656, 0, 0.07450981, 1, 1,
0.3560664, 1.372873, -1.087927, 0, 0.07058824, 1, 1,
0.3577156, 1.656822, 0.009559906, 0, 0.0627451, 1, 1,
0.3651991, 0.7736527, 1.121241, 0, 0.05882353, 1, 1,
0.3669654, -0.6009599, 1.893825, 0, 0.05098039, 1, 1,
0.3672447, 1.708243, -0.401247, 0, 0.04705882, 1, 1,
0.3745869, 1.055507, -0.8067671, 0, 0.03921569, 1, 1,
0.3769283, 1.079162, -0.5786044, 0, 0.03529412, 1, 1,
0.3791111, 1.297382, -0.2162525, 0, 0.02745098, 1, 1,
0.3849956, 0.1199604, 0.6206989, 0, 0.02352941, 1, 1,
0.3875736, -0.02771014, 1.234686, 0, 0.01568628, 1, 1,
0.3900582, -0.6998051, 2.518746, 0, 0.01176471, 1, 1,
0.3929157, -0.3021798, 1.755112, 0, 0.003921569, 1, 1,
0.3999299, 0.7853461, 0.4755499, 0.003921569, 0, 1, 1,
0.4006435, -0.4956155, 3.063031, 0.007843138, 0, 1, 1,
0.406121, 0.8320219, -0.01109345, 0.01568628, 0, 1, 1,
0.4071345, -1.677879, 1.193505, 0.01960784, 0, 1, 1,
0.4079524, 1.405837, -0.735023, 0.02745098, 0, 1, 1,
0.4091721, -0.6821752, 1.625854, 0.03137255, 0, 1, 1,
0.4093497, -0.986999, 3.643816, 0.03921569, 0, 1, 1,
0.4159489, 0.641596, 1.603188, 0.04313726, 0, 1, 1,
0.4164018, 1.01113, -0.9942277, 0.05098039, 0, 1, 1,
0.4166988, 1.791879, 1.282784, 0.05490196, 0, 1, 1,
0.4193501, 1.153839, 0.3436625, 0.0627451, 0, 1, 1,
0.4222364, 0.6782209, 0.765699, 0.06666667, 0, 1, 1,
0.4315315, -0.5576445, 2.446553, 0.07450981, 0, 1, 1,
0.4380102, 0.5546231, 0.3816185, 0.07843138, 0, 1, 1,
0.4397902, 0.1614736, 2.906631, 0.08627451, 0, 1, 1,
0.4415002, 0.3370815, 1.525272, 0.09019608, 0, 1, 1,
0.4432699, 0.1234, 1.803537, 0.09803922, 0, 1, 1,
0.4477121, 0.1549481, 0.7044059, 0.1058824, 0, 1, 1,
0.4492849, 0.62757, -0.6098866, 0.1098039, 0, 1, 1,
0.4502248, -0.6415581, 1.367541, 0.1176471, 0, 1, 1,
0.4504458, -0.3153836, 1.917174, 0.1215686, 0, 1, 1,
0.450649, 0.09581411, 1.212609, 0.1294118, 0, 1, 1,
0.4543259, 0.3766274, -1.741348, 0.1333333, 0, 1, 1,
0.4543356, -0.8360736, 4.477889, 0.1411765, 0, 1, 1,
0.4550304, 0.4101484, -0.6484125, 0.145098, 0, 1, 1,
0.4556762, -0.308203, 2.042706, 0.1529412, 0, 1, 1,
0.4580603, 0.9595279, 1.358866, 0.1568628, 0, 1, 1,
0.4589335, 0.6936249, 0.4030224, 0.1647059, 0, 1, 1,
0.4636873, -0.1988555, 0.9634716, 0.1686275, 0, 1, 1,
0.4775241, -0.6741853, 3.335665, 0.1764706, 0, 1, 1,
0.4891222, -0.8747231, 1.272483, 0.1803922, 0, 1, 1,
0.4891566, -0.1693555, -0.2215466, 0.1882353, 0, 1, 1,
0.490247, 0.1140785, 0.9351623, 0.1921569, 0, 1, 1,
0.4917937, -1.574356, 2.00814, 0.2, 0, 1, 1,
0.4942274, 1.399474, -0.8112539, 0.2078431, 0, 1, 1,
0.4947869, -0.2295913, 2.07545, 0.2117647, 0, 1, 1,
0.4952976, 0.8364664, 1.075905, 0.2196078, 0, 1, 1,
0.4967189, 0.6227542, -1.276623, 0.2235294, 0, 1, 1,
0.4995843, -0.2991494, 2.714513, 0.2313726, 0, 1, 1,
0.5007017, 0.2426157, 1.390167, 0.2352941, 0, 1, 1,
0.5058418, 1.158465, 1.644713, 0.2431373, 0, 1, 1,
0.5111095, 0.4147349, 1.575642, 0.2470588, 0, 1, 1,
0.5116816, -0.9084716, 3.280959, 0.254902, 0, 1, 1,
0.5200245, -1.281897, 3.287988, 0.2588235, 0, 1, 1,
0.5219923, 0.5607969, -0.09113692, 0.2666667, 0, 1, 1,
0.5226105, 0.168309, 0.5212647, 0.2705882, 0, 1, 1,
0.5272322, 0.2009238, 1.685027, 0.2784314, 0, 1, 1,
0.529703, 0.2803954, 1.782647, 0.282353, 0, 1, 1,
0.5298281, -0.6117988, 4.589159, 0.2901961, 0, 1, 1,
0.5413219, -1.000192, 1.81139, 0.2941177, 0, 1, 1,
0.5438977, -0.5740727, 3.463886, 0.3019608, 0, 1, 1,
0.5452179, 0.5616541, 1.58026, 0.3098039, 0, 1, 1,
0.5493218, 1.305068, 0.05921264, 0.3137255, 0, 1, 1,
0.5522001, 0.3381052, 2.097133, 0.3215686, 0, 1, 1,
0.5546345, 2.06232, 0.8868138, 0.3254902, 0, 1, 1,
0.5567685, 1.143346, 0.7709396, 0.3333333, 0, 1, 1,
0.5596022, -0.4274341, 0.1026951, 0.3372549, 0, 1, 1,
0.5655461, -0.3757073, 4.134192, 0.345098, 0, 1, 1,
0.5664716, 0.1378, 1.475223, 0.3490196, 0, 1, 1,
0.5668691, 0.5655741, -2.062835, 0.3568628, 0, 1, 1,
0.5693103, 2.013412, 0.9376173, 0.3607843, 0, 1, 1,
0.5706716, -1.173852, 2.826768, 0.3686275, 0, 1, 1,
0.5708525, -0.6617345, 1.134718, 0.372549, 0, 1, 1,
0.5821674, 1.001469, 0.7973573, 0.3803922, 0, 1, 1,
0.5846226, -1.059653, 2.107625, 0.3843137, 0, 1, 1,
0.5858666, -1.815338, 1.163523, 0.3921569, 0, 1, 1,
0.5859645, 1.033363, -0.776524, 0.3960784, 0, 1, 1,
0.5885612, -0.8578157, 2.209495, 0.4039216, 0, 1, 1,
0.5980784, -0.3614763, 2.289136, 0.4117647, 0, 1, 1,
0.6021086, 0.1919686, 0.7852353, 0.4156863, 0, 1, 1,
0.6037551, -1.299679, 2.801059, 0.4235294, 0, 1, 1,
0.6067643, -0.801429, 3.68078, 0.427451, 0, 1, 1,
0.6084645, 1.260764, 0.3468855, 0.4352941, 0, 1, 1,
0.6090413, 1.269147, 0.2930777, 0.4392157, 0, 1, 1,
0.6109629, 1.103303, 1.998599, 0.4470588, 0, 1, 1,
0.6122645, -2.14375, 3.219698, 0.4509804, 0, 1, 1,
0.6213811, -0.6235377, 4.1897, 0.4588235, 0, 1, 1,
0.6222124, -0.05691563, 1.311358, 0.4627451, 0, 1, 1,
0.6249709, 1.354686, 0.9492183, 0.4705882, 0, 1, 1,
0.6271283, -1.510096, 1.574713, 0.4745098, 0, 1, 1,
0.6346253, -1.186672, 3.089195, 0.4823529, 0, 1, 1,
0.6350973, -2.897446, 2.17427, 0.4862745, 0, 1, 1,
0.636209, 0.2804456, 1.489366, 0.4941176, 0, 1, 1,
0.638853, -0.8766055, 2.782598, 0.5019608, 0, 1, 1,
0.6390006, 0.09647898, 2.002282, 0.5058824, 0, 1, 1,
0.6404251, 2.180633, 0.1934074, 0.5137255, 0, 1, 1,
0.6410199, -1.126997, 3.206678, 0.5176471, 0, 1, 1,
0.6434073, -1.558203, 0.7436185, 0.5254902, 0, 1, 1,
0.6456194, 0.06671423, 2.111772, 0.5294118, 0, 1, 1,
0.6471722, 1.153774, 0.8764896, 0.5372549, 0, 1, 1,
0.6481341, 1.168891, 1.618695, 0.5411765, 0, 1, 1,
0.6510839, -0.821569, 3.241666, 0.5490196, 0, 1, 1,
0.6534919, 1.066482, 2.123897, 0.5529412, 0, 1, 1,
0.654076, -1.453578, 1.778646, 0.5607843, 0, 1, 1,
0.6553214, 0.5823176, 0.54499, 0.5647059, 0, 1, 1,
0.6586764, -0.5464279, 2.962431, 0.572549, 0, 1, 1,
0.6624354, -0.7834283, 1.592381, 0.5764706, 0, 1, 1,
0.6683114, 0.04770524, 1.26723, 0.5843138, 0, 1, 1,
0.6691197, 0.2853951, 2.162946, 0.5882353, 0, 1, 1,
0.6692886, -0.4353872, 4.237464, 0.5960785, 0, 1, 1,
0.6702634, 0.3658753, 2.132923, 0.6039216, 0, 1, 1,
0.6750146, 0.014864, 2.713849, 0.6078432, 0, 1, 1,
0.6763307, -2.036001, 3.407698, 0.6156863, 0, 1, 1,
0.6768149, -0.6580064, 1.28062, 0.6196079, 0, 1, 1,
0.682252, -0.6087772, 2.89059, 0.627451, 0, 1, 1,
0.6837646, 0.2098618, 1.225719, 0.6313726, 0, 1, 1,
0.6873068, -0.4417205, 1.973263, 0.6392157, 0, 1, 1,
0.688777, 1.208139, 1.67203, 0.6431373, 0, 1, 1,
0.6891667, -0.3344404, 2.517284, 0.6509804, 0, 1, 1,
0.6903301, -0.5696134, 2.32032, 0.654902, 0, 1, 1,
0.7072626, -1.115503, 3.21439, 0.6627451, 0, 1, 1,
0.7073273, -0.4498762, 1.394149, 0.6666667, 0, 1, 1,
0.7087612, -0.9338807, 1.39112, 0.6745098, 0, 1, 1,
0.7107357, -1.8616, 1.682987, 0.6784314, 0, 1, 1,
0.7115037, 1.194842, 2.214592, 0.6862745, 0, 1, 1,
0.7154908, 0.9341362, 0.7030216, 0.6901961, 0, 1, 1,
0.717013, -0.05172198, 2.191935, 0.6980392, 0, 1, 1,
0.7253078, -0.7181086, 4.259697, 0.7058824, 0, 1, 1,
0.7272804, -0.8982663, 2.324265, 0.7098039, 0, 1, 1,
0.7289419, -0.3486815, 1.900752, 0.7176471, 0, 1, 1,
0.7310897, 0.638491, 1.34999, 0.7215686, 0, 1, 1,
0.7354152, 0.7968169, 1.476306, 0.7294118, 0, 1, 1,
0.7434906, 3.438075, -0.5368657, 0.7333333, 0, 1, 1,
0.7466799, -0.09055376, 1.951785, 0.7411765, 0, 1, 1,
0.7513504, 1.094307, 0.578896, 0.7450981, 0, 1, 1,
0.756804, 0.2449385, 0.04438864, 0.7529412, 0, 1, 1,
0.7578691, -0.5967482, 1.131435, 0.7568628, 0, 1, 1,
0.7588794, 0.6027662, 1.701423, 0.7647059, 0, 1, 1,
0.7674399, -0.2531878, 1.086205, 0.7686275, 0, 1, 1,
0.7694552, -0.1343571, 2.000443, 0.7764706, 0, 1, 1,
0.7720213, 0.2804678, 0.1083949, 0.7803922, 0, 1, 1,
0.7729627, 1.649749, 1.224788, 0.7882353, 0, 1, 1,
0.773039, -0.3696937, 1.87914, 0.7921569, 0, 1, 1,
0.7734304, -0.8948584, 2.069053, 0.8, 0, 1, 1,
0.7785929, 0.1762282, 1.02103, 0.8078431, 0, 1, 1,
0.7877561, -0.406499, -0.2051053, 0.8117647, 0, 1, 1,
0.7899307, -0.03844294, 0.3249968, 0.8196079, 0, 1, 1,
0.79038, 0.7657253, -0.4071701, 0.8235294, 0, 1, 1,
0.7964811, 1.371972, -0.1872698, 0.8313726, 0, 1, 1,
0.7975096, -0.3132374, 2.851201, 0.8352941, 0, 1, 1,
0.7995366, -0.006575746, 1.937123, 0.8431373, 0, 1, 1,
0.7999492, -0.2300083, 1.566865, 0.8470588, 0, 1, 1,
0.8003873, -0.03094402, 2.298283, 0.854902, 0, 1, 1,
0.8025656, -0.1073057, 4.852811, 0.8588235, 0, 1, 1,
0.8107303, 0.7851247, 0.363416, 0.8666667, 0, 1, 1,
0.8156741, 0.7548829, -0.4039707, 0.8705882, 0, 1, 1,
0.8305286, -0.3409777, 2.183212, 0.8784314, 0, 1, 1,
0.8308502, 0.09904628, 1.751883, 0.8823529, 0, 1, 1,
0.832597, 0.300669, -0.6302474, 0.8901961, 0, 1, 1,
0.8378831, 0.3022304, 0.2241834, 0.8941177, 0, 1, 1,
0.8413364, 1.794157, 1.092011, 0.9019608, 0, 1, 1,
0.8431888, -0.1784377, 2.135711, 0.9098039, 0, 1, 1,
0.8452994, 1.160773, 1.479662, 0.9137255, 0, 1, 1,
0.8493329, -0.1794582, 3.729853, 0.9215686, 0, 1, 1,
0.8520988, 0.2832314, 0.2449408, 0.9254902, 0, 1, 1,
0.8539199, 0.8458161, -0.2808424, 0.9333333, 0, 1, 1,
0.8543932, -0.5641899, 1.736378, 0.9372549, 0, 1, 1,
0.8554457, -1.724881, 2.731547, 0.945098, 0, 1, 1,
0.8555247, -1.240948, 1.600573, 0.9490196, 0, 1, 1,
0.8576204, -0.3507934, 2.967902, 0.9568627, 0, 1, 1,
0.860525, 0.8752766, -0.2708806, 0.9607843, 0, 1, 1,
0.8624578, 0.1773438, 1.655517, 0.9686275, 0, 1, 1,
0.8746716, -0.3451423, 1.378281, 0.972549, 0, 1, 1,
0.8776366, 1.158745, 1.7256, 0.9803922, 0, 1, 1,
0.8859465, 0.9389902, -0.3126231, 0.9843137, 0, 1, 1,
0.8882484, 0.02922131, 1.684758, 0.9921569, 0, 1, 1,
0.8898732, 0.9532855, -0.2426497, 0.9960784, 0, 1, 1,
0.8918242, -0.4133829, 1.891058, 1, 0, 0.9960784, 1,
0.8929561, -0.7825499, 1.992237, 1, 0, 0.9882353, 1,
0.8980353, 2.310956, 0.6800292, 1, 0, 0.9843137, 1,
0.9029319, 1.188685, 1.403592, 1, 0, 0.9764706, 1,
0.9035182, -0.08703379, 0.4629105, 1, 0, 0.972549, 1,
0.9089479, -0.9807572, 3.115167, 1, 0, 0.9647059, 1,
0.9099715, -0.8713112, 1.425376, 1, 0, 0.9607843, 1,
0.9171586, 1.531752, -0.1524554, 1, 0, 0.9529412, 1,
0.9210258, 1.018575, 2.515038, 1, 0, 0.9490196, 1,
0.9221947, -0.4549435, 4.113501, 1, 0, 0.9411765, 1,
0.9274567, -0.2835252, 2.902821, 1, 0, 0.9372549, 1,
0.9281307, 1.508074, 0.5879744, 1, 0, 0.9294118, 1,
0.9284756, -0.1277198, 2.833663, 1, 0, 0.9254902, 1,
0.9296589, -0.2231899, 2.672065, 1, 0, 0.9176471, 1,
0.9371496, -0.580026, 1.944443, 1, 0, 0.9137255, 1,
0.9379559, 1.456656, -0.2190493, 1, 0, 0.9058824, 1,
0.9411418, -0.8367494, 1.235892, 1, 0, 0.9019608, 1,
0.9506072, -0.6014708, 2.145594, 1, 0, 0.8941177, 1,
0.9520154, -0.6341728, 2.476303, 1, 0, 0.8862745, 1,
0.9535815, 0.5937452, 0.2669868, 1, 0, 0.8823529, 1,
0.9545134, 1.703525, -0.1102184, 1, 0, 0.8745098, 1,
0.9555869, 1.107894, 0.2088493, 1, 0, 0.8705882, 1,
0.9560863, -0.9093398, 3.205392, 1, 0, 0.8627451, 1,
0.9586455, 0.4153712, -0.6357632, 1, 0, 0.8588235, 1,
0.9601936, 0.4770209, 0.4654119, 1, 0, 0.8509804, 1,
0.9676266, 0.4082554, 1.431477, 1, 0, 0.8470588, 1,
0.9728194, -0.2070829, 2.410922, 1, 0, 0.8392157, 1,
0.9734694, -1.085197, 1.769855, 1, 0, 0.8352941, 1,
0.9780904, -1.238806, 1.714039, 1, 0, 0.827451, 1,
0.9873162, 0.255442, 0.8976038, 1, 0, 0.8235294, 1,
0.996076, 0.9430437, -0.2074907, 1, 0, 0.8156863, 1,
0.9993065, 0.2925702, 0.2132671, 1, 0, 0.8117647, 1,
1.004733, -1.200768, 2.02796, 1, 0, 0.8039216, 1,
1.00565, -1.470732, 1.271411, 1, 0, 0.7960784, 1,
1.006758, -0.3252383, 0.7181437, 1, 0, 0.7921569, 1,
1.008083, 1.784878, 1.623826, 1, 0, 0.7843137, 1,
1.016972, -0.007829932, 2.064448, 1, 0, 0.7803922, 1,
1.022794, -0.09889369, 1.74799, 1, 0, 0.772549, 1,
1.023653, -0.2034575, 1.412271, 1, 0, 0.7686275, 1,
1.030253, 0.6066396, 0.8622038, 1, 0, 0.7607843, 1,
1.031315, 0.02245525, 0.2379311, 1, 0, 0.7568628, 1,
1.032475, 1.367073, 0.7312331, 1, 0, 0.7490196, 1,
1.037142, 0.3201877, 0.8086212, 1, 0, 0.7450981, 1,
1.045839, -0.4635602, 0.4072789, 1, 0, 0.7372549, 1,
1.054059, -0.006103558, 1.79902, 1, 0, 0.7333333, 1,
1.066355, 0.9053288, 1.133918, 1, 0, 0.7254902, 1,
1.073396, 0.8937896, 1.662643, 1, 0, 0.7215686, 1,
1.080398, -0.8620197, 2.134198, 1, 0, 0.7137255, 1,
1.082305, -0.599466, 1.18763, 1, 0, 0.7098039, 1,
1.082627, -0.6080984, 2.931602, 1, 0, 0.7019608, 1,
1.090043, 0.4963416, 2.601107, 1, 0, 0.6941177, 1,
1.095939, -1.367095, 3.33628, 1, 0, 0.6901961, 1,
1.096019, 1.480273, 1.683696, 1, 0, 0.682353, 1,
1.101507, 0.3308983, 0.5963727, 1, 0, 0.6784314, 1,
1.109919, -0.6734254, 2.020251, 1, 0, 0.6705883, 1,
1.113181, 0.2699271, -0.2521813, 1, 0, 0.6666667, 1,
1.113875, -0.6911822, 2.121914, 1, 0, 0.6588235, 1,
1.119754, -0.04492739, 2.34233, 1, 0, 0.654902, 1,
1.123816, -0.1396876, 2.089541, 1, 0, 0.6470588, 1,
1.135827, 1.612481, 0.3691187, 1, 0, 0.6431373, 1,
1.143008, -1.648796, 1.820165, 1, 0, 0.6352941, 1,
1.150977, 0.127039, 3.336431, 1, 0, 0.6313726, 1,
1.153379, 0.1603045, 1.285182, 1, 0, 0.6235294, 1,
1.153786, 0.7022986, 0.5954316, 1, 0, 0.6196079, 1,
1.154913, 0.06925522, 2.345955, 1, 0, 0.6117647, 1,
1.157088, 0.2688933, 1.704562, 1, 0, 0.6078432, 1,
1.171786, 2.29368, 1.576783, 1, 0, 0.6, 1,
1.178093, 1.141256, 1.327715, 1, 0, 0.5921569, 1,
1.186403, -0.9945788, 2.24912, 1, 0, 0.5882353, 1,
1.188329, 1.364189, 2.330471, 1, 0, 0.5803922, 1,
1.195805, -1.381623, 1.579222, 1, 0, 0.5764706, 1,
1.206105, -1.193314, 3.861459, 1, 0, 0.5686275, 1,
1.206168, -0.04541649, 0.4767395, 1, 0, 0.5647059, 1,
1.213757, -0.1632526, 0.2977493, 1, 0, 0.5568628, 1,
1.216523, -0.3289978, 4.015925, 1, 0, 0.5529412, 1,
1.221049, -1.216096, 1.931447, 1, 0, 0.5450981, 1,
1.222203, 1.831046, 0.5066822, 1, 0, 0.5411765, 1,
1.229188, -0.07283705, 2.214579, 1, 0, 0.5333334, 1,
1.234604, 0.906882, 1.813161, 1, 0, 0.5294118, 1,
1.255005, -0.4623626, -0.7651019, 1, 0, 0.5215687, 1,
1.257621, -0.5334786, 4.370474, 1, 0, 0.5176471, 1,
1.259339, -1.477398, 1.800851, 1, 0, 0.509804, 1,
1.263012, -0.2464159, 0.3601426, 1, 0, 0.5058824, 1,
1.265982, 1.53452, 2.693817, 1, 0, 0.4980392, 1,
1.277488, 1.270392, 1.11525, 1, 0, 0.4901961, 1,
1.286949, 0.4343105, 0.5315924, 1, 0, 0.4862745, 1,
1.291024, -0.8416799, 2.13063, 1, 0, 0.4784314, 1,
1.291333, 2.922345, 0.02493839, 1, 0, 0.4745098, 1,
1.296998, 0.5836983, 2.334902, 1, 0, 0.4666667, 1,
1.298039, -0.2465819, 1.61734, 1, 0, 0.4627451, 1,
1.315521, -0.2099395, 1.438314, 1, 0, 0.454902, 1,
1.316571, -0.7093927, 3.704193, 1, 0, 0.4509804, 1,
1.317791, -0.02067431, 2.132869, 1, 0, 0.4431373, 1,
1.324172, -0.5923616, 1.354028, 1, 0, 0.4392157, 1,
1.325962, 0.6128599, -0.7547076, 1, 0, 0.4313726, 1,
1.338523, 0.7478999, 0.9409086, 1, 0, 0.427451, 1,
1.338949, -0.06816455, 2.479101, 1, 0, 0.4196078, 1,
1.34029, -0.836403, 2.889521, 1, 0, 0.4156863, 1,
1.344027, -0.7517318, 2.998704, 1, 0, 0.4078431, 1,
1.345632, -2.823957, 3.061159, 1, 0, 0.4039216, 1,
1.347026, 1.275254, -0.2915195, 1, 0, 0.3960784, 1,
1.379043, -0.04846632, 1.642622, 1, 0, 0.3882353, 1,
1.38756, -0.5617763, 1.300679, 1, 0, 0.3843137, 1,
1.391763, -2.2883, 2.632348, 1, 0, 0.3764706, 1,
1.395892, -0.9435839, 2.331505, 1, 0, 0.372549, 1,
1.404875, -0.8743044, 3.890019, 1, 0, 0.3647059, 1,
1.407899, -0.02251089, 0.7185709, 1, 0, 0.3607843, 1,
1.414699, 0.8113788, 1.377991, 1, 0, 0.3529412, 1,
1.415486, 1.233645, -0.221238, 1, 0, 0.3490196, 1,
1.417789, -1.282433, 2.428128, 1, 0, 0.3411765, 1,
1.423996, -1.063287, 1.771548, 1, 0, 0.3372549, 1,
1.430838, 0.8463226, 0.5242774, 1, 0, 0.3294118, 1,
1.448627, -0.8814139, 2.937389, 1, 0, 0.3254902, 1,
1.469124, 1.159812, 0.1247239, 1, 0, 0.3176471, 1,
1.482078, 0.3170333, 0.3117899, 1, 0, 0.3137255, 1,
1.494861, -0.6854082, 1.462832, 1, 0, 0.3058824, 1,
1.525717, -0.2723585, 3.98332, 1, 0, 0.2980392, 1,
1.526392, -1.700357, 2.064646, 1, 0, 0.2941177, 1,
1.538314, 0.07295256, 2.159671, 1, 0, 0.2862745, 1,
1.544705, -1.301035, 2.42981, 1, 0, 0.282353, 1,
1.548932, 0.8111927, 2.534624, 1, 0, 0.2745098, 1,
1.566481, -0.5947, 2.399967, 1, 0, 0.2705882, 1,
1.656106, 0.9054664, 1.437213, 1, 0, 0.2627451, 1,
1.676316, -0.06863873, 1.262648, 1, 0, 0.2588235, 1,
1.683718, 0.3936208, 1.900905, 1, 0, 0.2509804, 1,
1.70626, 0.08230756, 1.952542, 1, 0, 0.2470588, 1,
1.72475, -0.4254497, 3.712359, 1, 0, 0.2392157, 1,
1.736009, -0.6606274, 2.621501, 1, 0, 0.2352941, 1,
1.738208, -1.801311, 3.094922, 1, 0, 0.227451, 1,
1.74915, -0.8475754, 1.272753, 1, 0, 0.2235294, 1,
1.76309, 0.5815174, 2.352198, 1, 0, 0.2156863, 1,
1.773815, 0.8211153, 0.1984426, 1, 0, 0.2117647, 1,
1.78938, 1.515933, 1.821571, 1, 0, 0.2039216, 1,
1.802781, -0.3570037, 4.844989, 1, 0, 0.1960784, 1,
1.840836, 0.9619995, -0.7554995, 1, 0, 0.1921569, 1,
1.847617, 0.2098219, 1.029222, 1, 0, 0.1843137, 1,
1.856546, 0.3532776, 3.543861, 1, 0, 0.1803922, 1,
1.863393, -0.4590585, 0.5271428, 1, 0, 0.172549, 1,
1.866428, -0.5075272, 1.324377, 1, 0, 0.1686275, 1,
1.882429, -0.7310759, 1.185271, 1, 0, 0.1607843, 1,
1.91462, 1.322753, 0.5645568, 1, 0, 0.1568628, 1,
1.930417, 0.3649597, 0.7201787, 1, 0, 0.1490196, 1,
1.955738, 0.1388035, 1.224018, 1, 0, 0.145098, 1,
1.960676, -0.9941623, 4.772389, 1, 0, 0.1372549, 1,
1.961108, -2.361713, 3.435221, 1, 0, 0.1333333, 1,
1.962594, 0.2803123, 1.163189, 1, 0, 0.1254902, 1,
1.995042, -0.5650803, 2.483858, 1, 0, 0.1215686, 1,
2.006039, -0.7639634, 2.206918, 1, 0, 0.1137255, 1,
2.01319, -0.04139797, 3.581751, 1, 0, 0.1098039, 1,
2.020616, -0.4936298, 3.041036, 1, 0, 0.1019608, 1,
2.020703, -0.4080302, 2.830863, 1, 0, 0.09411765, 1,
2.072528, -1.010902, 2.946254, 1, 0, 0.09019608, 1,
2.08465, 0.8562178, 0.2790769, 1, 0, 0.08235294, 1,
2.101746, -0.7141472, 2.324251, 1, 0, 0.07843138, 1,
2.120121, -0.2404551, 2.329568, 1, 0, 0.07058824, 1,
2.166567, -0.9061136, 3.247781, 1, 0, 0.06666667, 1,
2.195094, 0.5589276, 2.09331, 1, 0, 0.05882353, 1,
2.242875, 0.5611187, 1.859835, 1, 0, 0.05490196, 1,
2.334149, 1.819118, 0.9917502, 1, 0, 0.04705882, 1,
2.347188, 0.607114, 2.430286, 1, 0, 0.04313726, 1,
2.358487, -0.4458556, 2.020692, 1, 0, 0.03529412, 1,
2.459846, -0.3340935, 0.9803249, 1, 0, 0.03137255, 1,
2.462521, 1.10207, 1.006397, 1, 0, 0.02352941, 1,
2.491639, 1.106899, 1.580025, 1, 0, 0.01960784, 1,
2.787547, -1.925602, 1.411998, 1, 0, 0.01176471, 1,
3.417028, 0.465422, 1.164064, 1, 0, 0.007843138, 1
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
0.2343738, -4.487385, -7.409426, 0, -0.5, 0.5, 0.5,
0.2343738, -4.487385, -7.409426, 1, -0.5, 0.5, 0.5,
0.2343738, -4.487385, -7.409426, 1, 1.5, 0.5, 0.5,
0.2343738, -4.487385, -7.409426, 0, 1.5, 0.5, 0.5
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
-4.0272, 0.04967821, -7.409426, 0, -0.5, 0.5, 0.5,
-4.0272, 0.04967821, -7.409426, 1, -0.5, 0.5, 0.5,
-4.0272, 0.04967821, -7.409426, 1, 1.5, 0.5, 0.5,
-4.0272, 0.04967821, -7.409426, 0, 1.5, 0.5, 0.5
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
-4.0272, -4.487385, 0.4544516, 0, -0.5, 0.5, 0.5,
-4.0272, -4.487385, 0.4544516, 1, -0.5, 0.5, 0.5,
-4.0272, -4.487385, 0.4544516, 1, 1.5, 0.5, 0.5,
-4.0272, -4.487385, 0.4544516, 0, 1.5, 0.5, 0.5
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
-2, -3.440371, -5.594685,
3, -3.440371, -5.594685,
-2, -3.440371, -5.594685,
-2, -3.614873, -5.897142,
-1, -3.440371, -5.594685,
-1, -3.614873, -5.897142,
0, -3.440371, -5.594685,
0, -3.614873, -5.897142,
1, -3.440371, -5.594685,
1, -3.614873, -5.897142,
2, -3.440371, -5.594685,
2, -3.614873, -5.897142,
3, -3.440371, -5.594685,
3, -3.614873, -5.897142
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
-2, -3.963878, -6.502056, 0, -0.5, 0.5, 0.5,
-2, -3.963878, -6.502056, 1, -0.5, 0.5, 0.5,
-2, -3.963878, -6.502056, 1, 1.5, 0.5, 0.5,
-2, -3.963878, -6.502056, 0, 1.5, 0.5, 0.5,
-1, -3.963878, -6.502056, 0, -0.5, 0.5, 0.5,
-1, -3.963878, -6.502056, 1, -0.5, 0.5, 0.5,
-1, -3.963878, -6.502056, 1, 1.5, 0.5, 0.5,
-1, -3.963878, -6.502056, 0, 1.5, 0.5, 0.5,
0, -3.963878, -6.502056, 0, -0.5, 0.5, 0.5,
0, -3.963878, -6.502056, 1, -0.5, 0.5, 0.5,
0, -3.963878, -6.502056, 1, 1.5, 0.5, 0.5,
0, -3.963878, -6.502056, 0, 1.5, 0.5, 0.5,
1, -3.963878, -6.502056, 0, -0.5, 0.5, 0.5,
1, -3.963878, -6.502056, 1, -0.5, 0.5, 0.5,
1, -3.963878, -6.502056, 1, 1.5, 0.5, 0.5,
1, -3.963878, -6.502056, 0, 1.5, 0.5, 0.5,
2, -3.963878, -6.502056, 0, -0.5, 0.5, 0.5,
2, -3.963878, -6.502056, 1, -0.5, 0.5, 0.5,
2, -3.963878, -6.502056, 1, 1.5, 0.5, 0.5,
2, -3.963878, -6.502056, 0, 1.5, 0.5, 0.5,
3, -3.963878, -6.502056, 0, -0.5, 0.5, 0.5,
3, -3.963878, -6.502056, 1, -0.5, 0.5, 0.5,
3, -3.963878, -6.502056, 1, 1.5, 0.5, 0.5,
3, -3.963878, -6.502056, 0, 1.5, 0.5, 0.5
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
-3.04376, -3, -5.594685,
-3.04376, 3, -5.594685,
-3.04376, -3, -5.594685,
-3.207666, -3, -5.897142,
-3.04376, -2, -5.594685,
-3.207666, -2, -5.897142,
-3.04376, -1, -5.594685,
-3.207666, -1, -5.897142,
-3.04376, 0, -5.594685,
-3.207666, 0, -5.897142,
-3.04376, 1, -5.594685,
-3.207666, 1, -5.897142,
-3.04376, 2, -5.594685,
-3.207666, 2, -5.897142,
-3.04376, 3, -5.594685,
-3.207666, 3, -5.897142
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
-3.53548, -3, -6.502056, 0, -0.5, 0.5, 0.5,
-3.53548, -3, -6.502056, 1, -0.5, 0.5, 0.5,
-3.53548, -3, -6.502056, 1, 1.5, 0.5, 0.5,
-3.53548, -3, -6.502056, 0, 1.5, 0.5, 0.5,
-3.53548, -2, -6.502056, 0, -0.5, 0.5, 0.5,
-3.53548, -2, -6.502056, 1, -0.5, 0.5, 0.5,
-3.53548, -2, -6.502056, 1, 1.5, 0.5, 0.5,
-3.53548, -2, -6.502056, 0, 1.5, 0.5, 0.5,
-3.53548, -1, -6.502056, 0, -0.5, 0.5, 0.5,
-3.53548, -1, -6.502056, 1, -0.5, 0.5, 0.5,
-3.53548, -1, -6.502056, 1, 1.5, 0.5, 0.5,
-3.53548, -1, -6.502056, 0, 1.5, 0.5, 0.5,
-3.53548, 0, -6.502056, 0, -0.5, 0.5, 0.5,
-3.53548, 0, -6.502056, 1, -0.5, 0.5, 0.5,
-3.53548, 0, -6.502056, 1, 1.5, 0.5, 0.5,
-3.53548, 0, -6.502056, 0, 1.5, 0.5, 0.5,
-3.53548, 1, -6.502056, 0, -0.5, 0.5, 0.5,
-3.53548, 1, -6.502056, 1, -0.5, 0.5, 0.5,
-3.53548, 1, -6.502056, 1, 1.5, 0.5, 0.5,
-3.53548, 1, -6.502056, 0, 1.5, 0.5, 0.5,
-3.53548, 2, -6.502056, 0, -0.5, 0.5, 0.5,
-3.53548, 2, -6.502056, 1, -0.5, 0.5, 0.5,
-3.53548, 2, -6.502056, 1, 1.5, 0.5, 0.5,
-3.53548, 2, -6.502056, 0, 1.5, 0.5, 0.5,
-3.53548, 3, -6.502056, 0, -0.5, 0.5, 0.5,
-3.53548, 3, -6.502056, 1, -0.5, 0.5, 0.5,
-3.53548, 3, -6.502056, 1, 1.5, 0.5, 0.5,
-3.53548, 3, -6.502056, 0, 1.5, 0.5, 0.5
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
-3.04376, -3.440371, -4,
-3.04376, -3.440371, 6,
-3.04376, -3.440371, -4,
-3.207666, -3.614873, -4,
-3.04376, -3.440371, -2,
-3.207666, -3.614873, -2,
-3.04376, -3.440371, 0,
-3.207666, -3.614873, 0,
-3.04376, -3.440371, 2,
-3.207666, -3.614873, 2,
-3.04376, -3.440371, 4,
-3.207666, -3.614873, 4,
-3.04376, -3.440371, 6,
-3.207666, -3.614873, 6
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
-3.53548, -3.963878, -4, 0, -0.5, 0.5, 0.5,
-3.53548, -3.963878, -4, 1, -0.5, 0.5, 0.5,
-3.53548, -3.963878, -4, 1, 1.5, 0.5, 0.5,
-3.53548, -3.963878, -4, 0, 1.5, 0.5, 0.5,
-3.53548, -3.963878, -2, 0, -0.5, 0.5, 0.5,
-3.53548, -3.963878, -2, 1, -0.5, 0.5, 0.5,
-3.53548, -3.963878, -2, 1, 1.5, 0.5, 0.5,
-3.53548, -3.963878, -2, 0, 1.5, 0.5, 0.5,
-3.53548, -3.963878, 0, 0, -0.5, 0.5, 0.5,
-3.53548, -3.963878, 0, 1, -0.5, 0.5, 0.5,
-3.53548, -3.963878, 0, 1, 1.5, 0.5, 0.5,
-3.53548, -3.963878, 0, 0, 1.5, 0.5, 0.5,
-3.53548, -3.963878, 2, 0, -0.5, 0.5, 0.5,
-3.53548, -3.963878, 2, 1, -0.5, 0.5, 0.5,
-3.53548, -3.963878, 2, 1, 1.5, 0.5, 0.5,
-3.53548, -3.963878, 2, 0, 1.5, 0.5, 0.5,
-3.53548, -3.963878, 4, 0, -0.5, 0.5, 0.5,
-3.53548, -3.963878, 4, 1, -0.5, 0.5, 0.5,
-3.53548, -3.963878, 4, 1, 1.5, 0.5, 0.5,
-3.53548, -3.963878, 4, 0, 1.5, 0.5, 0.5,
-3.53548, -3.963878, 6, 0, -0.5, 0.5, 0.5,
-3.53548, -3.963878, 6, 1, -0.5, 0.5, 0.5,
-3.53548, -3.963878, 6, 1, 1.5, 0.5, 0.5,
-3.53548, -3.963878, 6, 0, 1.5, 0.5, 0.5
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
-3.04376, -3.440371, -5.594685,
-3.04376, 3.539727, -5.594685,
-3.04376, -3.440371, 6.503588,
-3.04376, 3.539727, 6.503588,
-3.04376, -3.440371, -5.594685,
-3.04376, -3.440371, 6.503588,
-3.04376, 3.539727, -5.594685,
-3.04376, 3.539727, 6.503588,
-3.04376, -3.440371, -5.594685,
3.512507, -3.440371, -5.594685,
-3.04376, -3.440371, 6.503588,
3.512507, -3.440371, 6.503588,
-3.04376, 3.539727, -5.594685,
3.512507, 3.539727, -5.594685,
-3.04376, 3.539727, 6.503588,
3.512507, 3.539727, 6.503588,
3.512507, -3.440371, -5.594685,
3.512507, 3.539727, -5.594685,
3.512507, -3.440371, 6.503588,
3.512507, 3.539727, 6.503588,
3.512507, -3.440371, -5.594685,
3.512507, -3.440371, 6.503588,
3.512507, 3.539727, -5.594685,
3.512507, 3.539727, 6.503588
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
var radius = 8.239143;
var distance = 36.65688;
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
mvMatrix.translate( -0.2343738, -0.04967821, -0.4544516 );
mvMatrix.scale( 1.358749, 1.276246, 0.7363301 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.65688);
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
prometon<-read.table("prometon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prometon$V2
```

```
## Error in eval(expr, envir, enclos): object 'prometon' not found
```

```r
y<-prometon$V3
```

```
## Error in eval(expr, envir, enclos): object 'prometon' not found
```

```r
z<-prometon$V4
```

```
## Error in eval(expr, envir, enclos): object 'prometon' not found
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
-2.94828, 0.4894669, -1.419141, 0, 0, 1, 1, 1,
-2.645073, -0.3489609, -0.3103174, 1, 0, 0, 1, 1,
-2.63917, -2.537501, -1.439238, 1, 0, 0, 1, 1,
-2.600808, 0.8840581, -0.7099453, 1, 0, 0, 1, 1,
-2.562098, -0.3633125, -1.235295, 1, 0, 0, 1, 1,
-2.526472, 0.6825902, -1.673311, 1, 0, 0, 1, 1,
-2.520017, 2.231443, -1.955066, 0, 0, 0, 1, 1,
-2.505668, 0.7756528, -2.838385, 0, 0, 0, 1, 1,
-2.451808, 0.01258267, 0.3002547, 0, 0, 0, 1, 1,
-2.384373, 1.145551, -1.639963, 0, 0, 0, 1, 1,
-2.366615, 1.672816, 0.2312579, 0, 0, 0, 1, 1,
-2.332062, 1.04859, -0.8389465, 0, 0, 0, 1, 1,
-2.278141, 1.245966, -1.390579, 0, 0, 0, 1, 1,
-2.272878, -1.774579, -1.464893, 1, 1, 1, 1, 1,
-2.267489, 0.3468822, 1.11851, 1, 1, 1, 1, 1,
-2.173229, 0.4741136, 0.7247134, 1, 1, 1, 1, 1,
-2.161813, -0.3478077, -0.9983342, 1, 1, 1, 1, 1,
-2.157825, 0.08231124, -2.669333, 1, 1, 1, 1, 1,
-2.139199, 0.4833483, -0.6838419, 1, 1, 1, 1, 1,
-2.116535, 0.4789219, -2.437293, 1, 1, 1, 1, 1,
-2.029207, -1.693041, -3.439842, 1, 1, 1, 1, 1,
-1.984311, -0.5404798, -1.052874, 1, 1, 1, 1, 1,
-1.959576, 0.2709314, -1.958251, 1, 1, 1, 1, 1,
-1.953975, -0.2286718, -0.901117, 1, 1, 1, 1, 1,
-1.953589, 0.6070308, -0.2110293, 1, 1, 1, 1, 1,
-1.94612, -1.167084, -1.854971, 1, 1, 1, 1, 1,
-1.942906, 0.7261816, -0.1227678, 1, 1, 1, 1, 1,
-1.942199, -0.8502865, -2.004229, 1, 1, 1, 1, 1,
-1.920525, -0.02964082, -0.4027968, 0, 0, 1, 1, 1,
-1.901355, -1.079782, -0.6546923, 1, 0, 0, 1, 1,
-1.880573, 0.536911, -2.374596, 1, 0, 0, 1, 1,
-1.877924, -2.17513, -1.275028, 1, 0, 0, 1, 1,
-1.861516, 0.7296797, -1.441013, 1, 0, 0, 1, 1,
-1.857893, 1.432769, -0.6358756, 1, 0, 0, 1, 1,
-1.837659, -1.243553, -1.006665, 0, 0, 0, 1, 1,
-1.828964, -0.3687822, -1.967018, 0, 0, 0, 1, 1,
-1.817767, -0.03718456, -0.6779991, 0, 0, 0, 1, 1,
-1.804479, 0.4926417, -0.2330332, 0, 0, 0, 1, 1,
-1.77821, 0.5949423, -2.054256, 0, 0, 0, 1, 1,
-1.767002, 0.02874878, -1.325842, 0, 0, 0, 1, 1,
-1.76263, 0.9112106, -0.08074806, 0, 0, 0, 1, 1,
-1.761626, -0.6102201, -2.407122, 1, 1, 1, 1, 1,
-1.749774, -0.9353895, -3.162724, 1, 1, 1, 1, 1,
-1.735173, -0.4880229, -0.9332293, 1, 1, 1, 1, 1,
-1.725453, -0.8842936, -0.006083514, 1, 1, 1, 1, 1,
-1.725296, -0.6070285, -2.192612, 1, 1, 1, 1, 1,
-1.722901, 1.800861, -0.8495066, 1, 1, 1, 1, 1,
-1.720988, 0.7876508, 0.06653749, 1, 1, 1, 1, 1,
-1.696043, 0.7851512, -2.162793, 1, 1, 1, 1, 1,
-1.693361, -0.4638194, -2.150364, 1, 1, 1, 1, 1,
-1.686133, 0.6792851, -2.182421, 1, 1, 1, 1, 1,
-1.678039, 0.2712388, -1.65352, 1, 1, 1, 1, 1,
-1.677754, -0.7547448, -2.183233, 1, 1, 1, 1, 1,
-1.658499, 0.3645152, -1.95266, 1, 1, 1, 1, 1,
-1.656785, -0.3642478, -1.526323, 1, 1, 1, 1, 1,
-1.648684, 0.7193027, -0.1735525, 1, 1, 1, 1, 1,
-1.638328, 0.2707217, 0.394131, 0, 0, 1, 1, 1,
-1.628467, -0.4878288, -1.455121, 1, 0, 0, 1, 1,
-1.623061, 0.5916473, -0.6823528, 1, 0, 0, 1, 1,
-1.607883, 0.8993019, -2.195487, 1, 0, 0, 1, 1,
-1.604908, 0.8431791, -1.674461, 1, 0, 0, 1, 1,
-1.600465, 0.7534775, 0.6961765, 1, 0, 0, 1, 1,
-1.59028, -1.905136, -3.862375, 0, 0, 0, 1, 1,
-1.589556, -0.5835437, -2.997878, 0, 0, 0, 1, 1,
-1.582761, 2.151533, 0.8032459, 0, 0, 0, 1, 1,
-1.57771, 1.543198, -1.401204, 0, 0, 0, 1, 1,
-1.564005, 0.2427042, -3.009083, 0, 0, 0, 1, 1,
-1.561637, -0.3707488, -2.80022, 0, 0, 0, 1, 1,
-1.532988, 1.57333, -1.688985, 0, 0, 0, 1, 1,
-1.529397, 0.8507212, -0.2578459, 1, 1, 1, 1, 1,
-1.521599, 0.5274503, -0.4820918, 1, 1, 1, 1, 1,
-1.514251, -1.475539, -3.062814, 1, 1, 1, 1, 1,
-1.510706, -1.044526, -1.583874, 1, 1, 1, 1, 1,
-1.506629, 0.5251787, -0.6106675, 1, 1, 1, 1, 1,
-1.452307, -1.248851, -2.31693, 1, 1, 1, 1, 1,
-1.442252, 0.4724958, -1.156865, 1, 1, 1, 1, 1,
-1.426357, -0.5307119, -2.259879, 1, 1, 1, 1, 1,
-1.418236, -0.3384644, -2.480814, 1, 1, 1, 1, 1,
-1.417432, 0.7916656, -0.8559787, 1, 1, 1, 1, 1,
-1.403335, 0.8077201, -1.386126, 1, 1, 1, 1, 1,
-1.395739, 0.4101584, -0.4944886, 1, 1, 1, 1, 1,
-1.391392, -0.6613101, -1.856684, 1, 1, 1, 1, 1,
-1.389586, 0.04931619, -1.603475, 1, 1, 1, 1, 1,
-1.37348, 0.4047827, -2.60633, 1, 1, 1, 1, 1,
-1.362429, 0.3014105, -2.10958, 0, 0, 1, 1, 1,
-1.360209, 1.657126, -1.324942, 1, 0, 0, 1, 1,
-1.344775, 0.8912793, -0.6108179, 1, 0, 0, 1, 1,
-1.342998, -0.7434624, -2.339162, 1, 0, 0, 1, 1,
-1.341944, -0.05934469, -0.3643293, 1, 0, 0, 1, 1,
-1.33492, -0.2279549, -2.047888, 1, 0, 0, 1, 1,
-1.33274, -0.66961, -1.44076, 0, 0, 0, 1, 1,
-1.33242, -0.7636328, -3.513169, 0, 0, 0, 1, 1,
-1.33234, 0.8010463, -1.017501, 0, 0, 0, 1, 1,
-1.3321, -1.203107, -2.35317, 0, 0, 0, 1, 1,
-1.329712, -0.7627121, -3.209869, 0, 0, 0, 1, 1,
-1.325231, 0.2922456, 0.402365, 0, 0, 0, 1, 1,
-1.321675, -0.7325628, -0.8883662, 0, 0, 0, 1, 1,
-1.319019, -0.007202259, 0.1430326, 1, 1, 1, 1, 1,
-1.316637, -0.9165511, -2.405389, 1, 1, 1, 1, 1,
-1.314968, 1.674352, 0.4142423, 1, 1, 1, 1, 1,
-1.305922, 0.3198464, 0.151686, 1, 1, 1, 1, 1,
-1.300592, 1.004734, -0.4559771, 1, 1, 1, 1, 1,
-1.291526, -0.1150929, -1.68529, 1, 1, 1, 1, 1,
-1.288823, 0.7786812, -1.651129, 1, 1, 1, 1, 1,
-1.283216, 1.219967, -0.06564055, 1, 1, 1, 1, 1,
-1.271865, 1.978148, -1.467523, 1, 1, 1, 1, 1,
-1.270205, 1.10929, 0.8593405, 1, 1, 1, 1, 1,
-1.2661, -0.2245333, -2.833583, 1, 1, 1, 1, 1,
-1.265359, -0.304857, -1.40522, 1, 1, 1, 1, 1,
-1.250794, 2.187019, -1.026376, 1, 1, 1, 1, 1,
-1.247503, 0.2082859, -2.200234, 1, 1, 1, 1, 1,
-1.228459, -0.8040519, -1.14808, 1, 1, 1, 1, 1,
-1.225077, -1.409323, -2.201607, 0, 0, 1, 1, 1,
-1.221754, -0.1663479, -2.536502, 1, 0, 0, 1, 1,
-1.220894, 0.9951971, -0.7485147, 1, 0, 0, 1, 1,
-1.219458, -0.1517761, -1.055657, 1, 0, 0, 1, 1,
-1.216563, -0.9538578, -3.73176, 1, 0, 0, 1, 1,
-1.215636, -1.348293, -3.570244, 1, 0, 0, 1, 1,
-1.212186, -1.150459, -0.66294, 0, 0, 0, 1, 1,
-1.201716, -1.568758, -0.6224032, 0, 0, 0, 1, 1,
-1.19159, 0.9409211, -1.509714, 0, 0, 0, 1, 1,
-1.184228, -0.6194708, -2.337129, 0, 0, 0, 1, 1,
-1.183584, -0.9924629, -2.700963, 0, 0, 0, 1, 1,
-1.181796, -0.8770366, -0.8437239, 0, 0, 0, 1, 1,
-1.174976, 0.1651463, -0.3096078, 0, 0, 0, 1, 1,
-1.171376, 1.287774, 0.3906785, 1, 1, 1, 1, 1,
-1.15924, 0.4002935, -2.53009, 1, 1, 1, 1, 1,
-1.158989, -0.5446392, -1.626799, 1, 1, 1, 1, 1,
-1.151567, 0.8175424, -3.245997, 1, 1, 1, 1, 1,
-1.145392, 0.3105077, -1.361301, 1, 1, 1, 1, 1,
-1.145227, -0.5762044, -0.3770908, 1, 1, 1, 1, 1,
-1.141199, -0.2105455, -2.502029, 1, 1, 1, 1, 1,
-1.129146, -0.6373488, -3.556626, 1, 1, 1, 1, 1,
-1.124382, -0.4965664, -2.870119, 1, 1, 1, 1, 1,
-1.123485, 0.4021398, -1.681266, 1, 1, 1, 1, 1,
-1.116482, 1.35006, 0.808485, 1, 1, 1, 1, 1,
-1.115788, 0.6608488, 0.2045742, 1, 1, 1, 1, 1,
-1.089345, 1.664961, -0.1800573, 1, 1, 1, 1, 1,
-1.088141, -0.2950868, -1.780709, 1, 1, 1, 1, 1,
-1.083475, -0.8280786, -1.343324, 1, 1, 1, 1, 1,
-1.082797, -1.113891, -2.439718, 0, 0, 1, 1, 1,
-1.081571, 0.2356604, -1.271326, 1, 0, 0, 1, 1,
-1.080252, 0.7128161, -0.08084781, 1, 0, 0, 1, 1,
-1.078844, -0.03721108, -1.777499, 1, 0, 0, 1, 1,
-1.069771, 0.1932763, -1.303946, 1, 0, 0, 1, 1,
-1.062174, -0.3292797, -1.47158, 1, 0, 0, 1, 1,
-1.059846, -0.2512353, -1.120307, 0, 0, 0, 1, 1,
-1.057478, -0.6293962, 0.4959542, 0, 0, 0, 1, 1,
-1.056144, 1.010844, -1.646628, 0, 0, 0, 1, 1,
-1.049404, 0.8780566, -2.389751, 0, 0, 0, 1, 1,
-1.048565, 0.4262589, -0.9860534, 0, 0, 0, 1, 1,
-1.047013, 0.5812479, -2.546281, 0, 0, 0, 1, 1,
-1.045077, 0.178998, -2.461215, 0, 0, 0, 1, 1,
-1.043589, 1.359465, -2.011931, 1, 1, 1, 1, 1,
-1.029343, 0.3966962, -1.401306, 1, 1, 1, 1, 1,
-1.029047, -0.2777543, -1.947013, 1, 1, 1, 1, 1,
-1.026085, -1.18198, -1.76561, 1, 1, 1, 1, 1,
-1.024792, 1.779024, 2.40385, 1, 1, 1, 1, 1,
-1.020992, 0.2963537, -2.026968, 1, 1, 1, 1, 1,
-1.017987, -0.2009178, -1.046832, 1, 1, 1, 1, 1,
-1.004362, 1.435421, -0.782196, 1, 1, 1, 1, 1,
-1.000862, -0.3170167, -2.368759, 1, 1, 1, 1, 1,
-0.9945475, 1.923867, -0.2235749, 1, 1, 1, 1, 1,
-0.9903641, -0.02234438, -3.008044, 1, 1, 1, 1, 1,
-0.9840736, 1.458817, 0.2677424, 1, 1, 1, 1, 1,
-0.9839236, -0.2498439, -1.30699, 1, 1, 1, 1, 1,
-0.9796894, 0.6033711, -1.019715, 1, 1, 1, 1, 1,
-0.9775338, 1.150706, -2.899943, 1, 1, 1, 1, 1,
-0.9756821, -0.5597449, -3.673429, 0, 0, 1, 1, 1,
-0.9740194, -0.6805933, -2.761687, 1, 0, 0, 1, 1,
-0.9684541, -0.2842366, -1.756722, 1, 0, 0, 1, 1,
-0.96325, -1.610465, -2.979856, 1, 0, 0, 1, 1,
-0.9622775, -0.896021, -4.657252, 1, 0, 0, 1, 1,
-0.9589892, -0.03063866, -2.944309, 1, 0, 0, 1, 1,
-0.9531975, -1.413149, -4.165871, 0, 0, 0, 1, 1,
-0.9485171, 1.487617, -2.372285, 0, 0, 0, 1, 1,
-0.946303, -1.353863, -1.840547, 0, 0, 0, 1, 1,
-0.9435402, 0.1621308, -2.169509, 0, 0, 0, 1, 1,
-0.9424551, -0.7341688, -2.660305, 0, 0, 0, 1, 1,
-0.9328309, -0.6550872, -1.381873, 0, 0, 0, 1, 1,
-0.9322217, 0.07767823, -1.396932, 0, 0, 0, 1, 1,
-0.931937, 0.8324027, 0.1270094, 1, 1, 1, 1, 1,
-0.9243244, -1.219712, -2.163195, 1, 1, 1, 1, 1,
-0.9223614, -1.195688, -2.886625, 1, 1, 1, 1, 1,
-0.9202824, -0.6645171, -1.940486, 1, 1, 1, 1, 1,
-0.9190835, 0.8296017, -1.037311, 1, 1, 1, 1, 1,
-0.9115111, -0.9672928, -1.237847, 1, 1, 1, 1, 1,
-0.9002279, 1.872632, 0.2182404, 1, 1, 1, 1, 1,
-0.900088, 2.412118, 0.5989978, 1, 1, 1, 1, 1,
-0.8921373, -0.6106014, -2.586068, 1, 1, 1, 1, 1,
-0.8686096, -1.106363, -3.101711, 1, 1, 1, 1, 1,
-0.8678892, 1.898799, 0.380801, 1, 1, 1, 1, 1,
-0.8598304, -0.3198944, -2.275728, 1, 1, 1, 1, 1,
-0.8559363, -0.2288797, -1.356445, 1, 1, 1, 1, 1,
-0.8539521, -0.4917579, -1.100897, 1, 1, 1, 1, 1,
-0.8539198, -2.880122, -2.393557, 1, 1, 1, 1, 1,
-0.8476853, 1.445532, 0.4770603, 0, 0, 1, 1, 1,
-0.8468979, 0.005419797, -2.970272, 1, 0, 0, 1, 1,
-0.8453429, -1.041467, -0.9006442, 1, 0, 0, 1, 1,
-0.8404049, 1.350104, -0.1608735, 1, 0, 0, 1, 1,
-0.8403921, -1.109226, -3.113187, 1, 0, 0, 1, 1,
-0.8379835, -0.1535543, -1.361631, 1, 0, 0, 1, 1,
-0.8346199, 0.3512259, -1.233024, 0, 0, 0, 1, 1,
-0.8343645, 0.5013791, -3.557811, 0, 0, 0, 1, 1,
-0.8338598, -0.404874, -1.160838, 0, 0, 0, 1, 1,
-0.8060222, 1.03748, -1.112108, 0, 0, 0, 1, 1,
-0.8050838, 0.2790995, -1.265883, 0, 0, 0, 1, 1,
-0.8017493, 0.8711431, -0.4523447, 0, 0, 0, 1, 1,
-0.8016475, -0.2791417, -2.378324, 0, 0, 0, 1, 1,
-0.8002846, 0.6051838, -2.520908, 1, 1, 1, 1, 1,
-0.7980074, -0.8596348, -1.638098, 1, 1, 1, 1, 1,
-0.7922925, -0.7305467, -1.420965, 1, 1, 1, 1, 1,
-0.7840113, -1.743116, -2.092195, 1, 1, 1, 1, 1,
-0.7828926, -0.1750512, -2.184853, 1, 1, 1, 1, 1,
-0.7818754, 0.248293, -0.2387349, 1, 1, 1, 1, 1,
-0.7793313, -1.439, -2.550943, 1, 1, 1, 1, 1,
-0.7788389, -0.5170953, -1.491409, 1, 1, 1, 1, 1,
-0.7714083, -0.2816993, -2.117571, 1, 1, 1, 1, 1,
-0.7688142, 1.307491, 0.3672566, 1, 1, 1, 1, 1,
-0.7684209, -0.4815993, -2.725431, 1, 1, 1, 1, 1,
-0.7672751, -0.7612795, 0.4827041, 1, 1, 1, 1, 1,
-0.7590123, 0.2261202, 0.4836405, 1, 1, 1, 1, 1,
-0.7573074, 0.5439987, 0.5495594, 1, 1, 1, 1, 1,
-0.7555798, 0.5433685, -1.374829, 1, 1, 1, 1, 1,
-0.7488389, 2.10074, -1.759027, 0, 0, 1, 1, 1,
-0.7435725, -1.52186, -4.007223, 1, 0, 0, 1, 1,
-0.7381839, -0.01213308, -1.51798, 1, 0, 0, 1, 1,
-0.7326212, -1.169084, -4.638404, 1, 0, 0, 1, 1,
-0.7270803, -1.676479, -3.230768, 1, 0, 0, 1, 1,
-0.7265889, -1.469718, -1.217149, 1, 0, 0, 1, 1,
-0.7211484, 0.03951106, -1.670547, 0, 0, 0, 1, 1,
-0.7194623, 0.3335079, -1.786682, 0, 0, 0, 1, 1,
-0.7157198, 0.1310692, -1.535847, 0, 0, 0, 1, 1,
-0.714166, -0.2429731, -1.60341, 0, 0, 0, 1, 1,
-0.7135147, 0.01303514, -2.505419, 0, 0, 0, 1, 1,
-0.7132503, 0.4553039, -0.4903526, 0, 0, 0, 1, 1,
-0.707069, -0.3557515, -4.290036, 0, 0, 0, 1, 1,
-0.7060947, -0.7594733, -3.586655, 1, 1, 1, 1, 1,
-0.6989108, -0.05904058, -0.6111374, 1, 1, 1, 1, 1,
-0.6970433, -0.9696998, -3.679354, 1, 1, 1, 1, 1,
-0.6961515, 0.9919235, -0.4031731, 1, 1, 1, 1, 1,
-0.6956993, 0.3390921, 0.2073618, 1, 1, 1, 1, 1,
-0.694996, -0.09325004, -2.531263, 1, 1, 1, 1, 1,
-0.6940522, -1.138252, -1.5561, 1, 1, 1, 1, 1,
-0.6880009, -0.4933155, 0.1979307, 1, 1, 1, 1, 1,
-0.6863049, 1.547496, -1.365711, 1, 1, 1, 1, 1,
-0.6835009, -0.2219638, -2.086271, 1, 1, 1, 1, 1,
-0.682149, -1.211731, -3.091571, 1, 1, 1, 1, 1,
-0.6755259, -0.8537788, -3.443134, 1, 1, 1, 1, 1,
-0.6717283, -0.5872533, -1.469459, 1, 1, 1, 1, 1,
-0.6654617, -1.201648, -2.170077, 1, 1, 1, 1, 1,
-0.6654456, 2.090373, -0.8504241, 1, 1, 1, 1, 1,
-0.6602916, 2.226227, 0.1574476, 0, 0, 1, 1, 1,
-0.6562911, 1.458271, 2.430068, 1, 0, 0, 1, 1,
-0.6469246, 0.12527, -2.3504, 1, 0, 0, 1, 1,
-0.6444691, -0.6163244, -2.703067, 1, 0, 0, 1, 1,
-0.6434717, -0.2720737, -2.167337, 1, 0, 0, 1, 1,
-0.6391376, 0.4460242, -1.599449, 1, 0, 0, 1, 1,
-0.6315319, -0.5359341, -1.108192, 0, 0, 0, 1, 1,
-0.6306341, -0.7963335, -3.065207, 0, 0, 0, 1, 1,
-0.626708, 0.7912419, 0.6819028, 0, 0, 0, 1, 1,
-0.6266674, 0.2445327, -0.756627, 0, 0, 0, 1, 1,
-0.6185315, -1.126104, -3.921333, 0, 0, 0, 1, 1,
-0.612087, 0.8147916, -1.372131, 0, 0, 0, 1, 1,
-0.6036736, -0.2366543, -3.13794, 0, 0, 0, 1, 1,
-0.5980158, 2.004291, 0.593661, 1, 1, 1, 1, 1,
-0.5929187, -1.001657, -3.521311, 1, 1, 1, 1, 1,
-0.5900047, 1.895726, -0.7833349, 1, 1, 1, 1, 1,
-0.588465, -0.6743336, -2.92158, 1, 1, 1, 1, 1,
-0.5862498, -3.338719, -3.478261, 1, 1, 1, 1, 1,
-0.5816478, 0.107773, -1.703898, 1, 1, 1, 1, 1,
-0.5773981, -0.2492455, -1.344456, 1, 1, 1, 1, 1,
-0.5758347, 0.6372564, -1.006212, 1, 1, 1, 1, 1,
-0.5713901, -0.5467865, -2.602507, 1, 1, 1, 1, 1,
-0.5664405, 0.6479971, 1.220804, 1, 1, 1, 1, 1,
-0.5662593, 1.108015, -0.8052321, 1, 1, 1, 1, 1,
-0.5656908, -0.4901798, -2.825078, 1, 1, 1, 1, 1,
-0.565585, -0.3080612, -3.535396, 1, 1, 1, 1, 1,
-0.5636647, 1.020834, -2.572762, 1, 1, 1, 1, 1,
-0.556132, 0.1592994, -0.6516361, 1, 1, 1, 1, 1,
-0.555361, 2.792678, 0.1048974, 0, 0, 1, 1, 1,
-0.5537095, 0.2739565, -2.323344, 1, 0, 0, 1, 1,
-0.5510769, 1.769679, -0.07152636, 1, 0, 0, 1, 1,
-0.5484724, -0.348967, -3.69504, 1, 0, 0, 1, 1,
-0.5474148, -0.5001377, -3.193009, 1, 0, 0, 1, 1,
-0.5469726, 0.1493385, -0.8757073, 1, 0, 0, 1, 1,
-0.5456228, -0.02045323, -2.73627, 0, 0, 0, 1, 1,
-0.5437171, -0.5414336, -2.308988, 0, 0, 0, 1, 1,
-0.5427305, 0.4672241, -1.142395, 0, 0, 0, 1, 1,
-0.5391524, -0.3071514, -1.491593, 0, 0, 0, 1, 1,
-0.5289017, 0.3837909, 0.7553608, 0, 0, 0, 1, 1,
-0.5272246, 1.754047, 0.2433589, 0, 0, 0, 1, 1,
-0.5271074, -0.3193707, -3.149915, 0, 0, 0, 1, 1,
-0.5258694, 0.1571529, -0.5188479, 1, 1, 1, 1, 1,
-0.5257217, -0.9049779, -2.869509, 1, 1, 1, 1, 1,
-0.5251363, 0.1902051, -1.798814, 1, 1, 1, 1, 1,
-0.5192109, -1.293755, -3.793824, 1, 1, 1, 1, 1,
-0.5190498, 0.8139184, -0.7134411, 1, 1, 1, 1, 1,
-0.5155146, -0.2938077, -2.942148, 1, 1, 1, 1, 1,
-0.507009, -0.7842439, -1.393739, 1, 1, 1, 1, 1,
-0.5059762, 1.322978, 0.8273447, 1, 1, 1, 1, 1,
-0.5016509, -0.1177431, -1.833436, 1, 1, 1, 1, 1,
-0.5011089, 0.6549826, -0.4812947, 1, 1, 1, 1, 1,
-0.4974973, -1.758881, -2.723311, 1, 1, 1, 1, 1,
-0.4965115, -1.227618, -1.386521, 1, 1, 1, 1, 1,
-0.4891878, 0.947454, -1.154529, 1, 1, 1, 1, 1,
-0.4891085, 0.9014813, -0.7624645, 1, 1, 1, 1, 1,
-0.4890818, -2.321273, -2.813231, 1, 1, 1, 1, 1,
-0.4870449, 0.6700385, -0.01991363, 0, 0, 1, 1, 1,
-0.4852858, -0.2371545, -1.835845, 1, 0, 0, 1, 1,
-0.4841146, 0.8975889, -1.29065, 1, 0, 0, 1, 1,
-0.4822524, -0.02171627, -1.846154, 1, 0, 0, 1, 1,
-0.4811231, 0.1911303, -1.785248, 1, 0, 0, 1, 1,
-0.4781648, 1.081084, -0.1319267, 1, 0, 0, 1, 1,
-0.4776122, 1.253623, 0.8589393, 0, 0, 0, 1, 1,
-0.4767534, -1.489053, -4.319727, 0, 0, 0, 1, 1,
-0.4722683, 1.581188, 0.6786553, 0, 0, 0, 1, 1,
-0.4715934, 0.7567687, -1.001379, 0, 0, 0, 1, 1,
-0.4689308, -0.9992419, -2.193983, 0, 0, 0, 1, 1,
-0.46612, 1.313128, -0.6798796, 0, 0, 0, 1, 1,
-0.4643089, 0.4013289, -0.70794, 0, 0, 0, 1, 1,
-0.4628965, 1.362161, 1.247682, 1, 1, 1, 1, 1,
-0.4576949, 0.7090082, -0.5521477, 1, 1, 1, 1, 1,
-0.4549588, 0.4327774, -0.964523, 1, 1, 1, 1, 1,
-0.4547873, -0.01828215, -1.19119, 1, 1, 1, 1, 1,
-0.4544669, 0.8498781, -0.635288, 1, 1, 1, 1, 1,
-0.4508252, 1.586408, 1.33293, 1, 1, 1, 1, 1,
-0.4463172, -0.4128934, -2.053702, 1, 1, 1, 1, 1,
-0.4441186, 1.080056, -0.6567652, 1, 1, 1, 1, 1,
-0.4417871, 0.7399911, 0.6258008, 1, 1, 1, 1, 1,
-0.4413337, -0.9836122, -2.568083, 1, 1, 1, 1, 1,
-0.4369514, -1.338809, -2.880565, 1, 1, 1, 1, 1,
-0.4355192, 0.4079589, 1.011214, 1, 1, 1, 1, 1,
-0.4309826, 0.7237015, 0.2122233, 1, 1, 1, 1, 1,
-0.4308852, 1.196437, 1.330751, 1, 1, 1, 1, 1,
-0.4253651, 0.7884728, -0.5019639, 1, 1, 1, 1, 1,
-0.421795, 0.8470404, 0.01244054, 0, 0, 1, 1, 1,
-0.4215151, -0.4961136, -1.963552, 1, 0, 0, 1, 1,
-0.4198427, 0.9291089, -1.075311, 1, 0, 0, 1, 1,
-0.4180727, 0.3736925, -0.8712533, 1, 0, 0, 1, 1,
-0.4122382, 1.599449, 0.2574015, 1, 0, 0, 1, 1,
-0.4039488, -0.7164176, -2.103887, 1, 0, 0, 1, 1,
-0.3979808, 0.7137478, -0.7445034, 0, 0, 0, 1, 1,
-0.3971449, -0.3191078, -1.702246, 0, 0, 0, 1, 1,
-0.3950904, 0.183598, -1.766886, 0, 0, 0, 1, 1,
-0.3933499, 0.5611001, -0.6192221, 0, 0, 0, 1, 1,
-0.3879025, -0.01374653, -1.396971, 0, 0, 0, 1, 1,
-0.381916, 0.2828802, -0.7591575, 0, 0, 0, 1, 1,
-0.378833, -0.7904982, -2.457402, 0, 0, 0, 1, 1,
-0.3759245, -1.843029, -0.5169291, 1, 1, 1, 1, 1,
-0.3757106, -1.698495, -2.815882, 1, 1, 1, 1, 1,
-0.3736551, -0.9857554, -1.685044, 1, 1, 1, 1, 1,
-0.3712904, -1.906754, -2.378421, 1, 1, 1, 1, 1,
-0.369715, 1.12839, -1.211987, 1, 1, 1, 1, 1,
-0.3626304, 1.456316, -0.5977716, 1, 1, 1, 1, 1,
-0.3609715, -0.1532975, -3.686181, 1, 1, 1, 1, 1,
-0.3599619, -1.553414, -1.018797, 1, 1, 1, 1, 1,
-0.3522916, 1.807334, -0.5900217, 1, 1, 1, 1, 1,
-0.3468845, -0.9090749, -2.826382, 1, 1, 1, 1, 1,
-0.3451055, 1.452127, 1.179543, 1, 1, 1, 1, 1,
-0.3438372, 0.3879777, -1.56719, 1, 1, 1, 1, 1,
-0.3424219, -1.667557, -3.844366, 1, 1, 1, 1, 1,
-0.3365346, -1.053337, -3.149248, 1, 1, 1, 1, 1,
-0.3338915, 0.6773531, 1.066188, 1, 1, 1, 1, 1,
-0.3312976, -0.8117804, -2.312621, 0, 0, 1, 1, 1,
-0.3299999, 1.619035, 1.113982, 1, 0, 0, 1, 1,
-0.3284137, -1.90782, -2.733748, 1, 0, 0, 1, 1,
-0.3254651, -0.5249431, -1.642785, 1, 0, 0, 1, 1,
-0.3110023, 2.00784, 1.31617, 1, 0, 0, 1, 1,
-0.3105081, -0.7754306, -1.504357, 1, 0, 0, 1, 1,
-0.3099524, 1.349191, 0.2135314, 0, 0, 0, 1, 1,
-0.3069349, -1.74839, -3.093934, 0, 0, 0, 1, 1,
-0.2950894, 1.35905, 1.380552, 0, 0, 0, 1, 1,
-0.2946912, -0.5596782, -1.405779, 0, 0, 0, 1, 1,
-0.2924485, 0.2569368, 0.2882024, 0, 0, 0, 1, 1,
-0.2923065, -0.1605133, -1.427907, 0, 0, 0, 1, 1,
-0.2922767, 0.02534088, -0.4135148, 0, 0, 0, 1, 1,
-0.2911319, -0.5787416, -2.165439, 1, 1, 1, 1, 1,
-0.28944, 0.9607794, 0.2846623, 1, 1, 1, 1, 1,
-0.2891965, -1.042081, -1.150889, 1, 1, 1, 1, 1,
-0.2850541, 1.444677, -0.1602775, 1, 1, 1, 1, 1,
-0.2841151, 1.167498, -1.843139, 1, 1, 1, 1, 1,
-0.2785824, 0.4255672, -1.889593, 1, 1, 1, 1, 1,
-0.2782086, -1.052936, -2.949295, 1, 1, 1, 1, 1,
-0.276323, -0.6907273, -0.8722849, 1, 1, 1, 1, 1,
-0.2741443, 0.4131475, -0.3676749, 1, 1, 1, 1, 1,
-0.2710428, -1.32983, -3.394209, 1, 1, 1, 1, 1,
-0.2704961, -0.6732558, -2.509271, 1, 1, 1, 1, 1,
-0.2699043, -0.9732143, -2.385796, 1, 1, 1, 1, 1,
-0.2681439, -1.429838, -2.856982, 1, 1, 1, 1, 1,
-0.2667404, 0.8001381, 0.8383002, 1, 1, 1, 1, 1,
-0.2651045, -0.2094495, -3.286626, 1, 1, 1, 1, 1,
-0.2641755, 0.4097452, -1.926343, 0, 0, 1, 1, 1,
-0.2592582, -0.4998733, -2.955074, 1, 0, 0, 1, 1,
-0.2578422, 1.485993, 0.6387865, 1, 0, 0, 1, 1,
-0.2504996, 0.1051132, -0.9293664, 1, 0, 0, 1, 1,
-0.2497059, -2.222723, -2.282923, 1, 0, 0, 1, 1,
-0.2485737, 0.8662549, -1.178028, 1, 0, 0, 1, 1,
-0.2478529, 0.7987577, -0.1397146, 0, 0, 0, 1, 1,
-0.243684, 1.526358, 1.322795, 0, 0, 0, 1, 1,
-0.2425066, 1.364601, -0.5132892, 0, 0, 0, 1, 1,
-0.2414103, -0.4327314, -1.922518, 0, 0, 0, 1, 1,
-0.2352329, -0.08524448, -0.6098304, 0, 0, 0, 1, 1,
-0.2347599, -1.601793, -3.721509, 0, 0, 0, 1, 1,
-0.2346603, 1.444321, -0.6812441, 0, 0, 0, 1, 1,
-0.2298923, 1.580158, 1.664156, 1, 1, 1, 1, 1,
-0.2279995, -0.3428745, -0.9843854, 1, 1, 1, 1, 1,
-0.2261774, -0.3119121, -2.194083, 1, 1, 1, 1, 1,
-0.2232944, -0.4504592, -3.223183, 1, 1, 1, 1, 1,
-0.2210419, -0.9258304, -2.452493, 1, 1, 1, 1, 1,
-0.2207237, 1.852424, -1.043386, 1, 1, 1, 1, 1,
-0.2188055, -0.056568, -1.895427, 1, 1, 1, 1, 1,
-0.2173106, 0.08900373, 0.2086314, 1, 1, 1, 1, 1,
-0.2144215, 0.173317, -1.409264, 1, 1, 1, 1, 1,
-0.2103569, 0.5524851, -1.992075, 1, 1, 1, 1, 1,
-0.209847, 0.6471549, 0.5421594, 1, 1, 1, 1, 1,
-0.2062667, -1.074321, -3.188113, 1, 1, 1, 1, 1,
-0.2062012, -0.7420483, -1.355747, 1, 1, 1, 1, 1,
-0.2059525, 0.700895, -1.701838, 1, 1, 1, 1, 1,
-0.203817, -0.2466184, -1.674885, 1, 1, 1, 1, 1,
-0.2026674, -0.1152442, -2.598526, 0, 0, 1, 1, 1,
-0.2022245, 0.5857328, -1.354871, 1, 0, 0, 1, 1,
-0.1981681, -0.4756002, -3.897343, 1, 0, 0, 1, 1,
-0.1944593, 1.303294, 0.2488578, 1, 0, 0, 1, 1,
-0.1944048, -0.4626681, -1.900386, 1, 0, 0, 1, 1,
-0.1907515, 1.178357, 1.833, 1, 0, 0, 1, 1,
-0.1836441, -0.3049553, -1.920878, 0, 0, 0, 1, 1,
-0.1811468, -1.068574, -3.055551, 0, 0, 0, 1, 1,
-0.1801035, -0.474312, -2.456588, 0, 0, 0, 1, 1,
-0.1786426, 0.08986869, 0.6663858, 0, 0, 0, 1, 1,
-0.177518, 0.03959475, -1.243888, 0, 0, 0, 1, 1,
-0.1754988, -0.2903574, -1.790728, 0, 0, 0, 1, 1,
-0.1746071, -2.475953, -2.444504, 0, 0, 0, 1, 1,
-0.1738743, -0.08952539, -1.335731, 1, 1, 1, 1, 1,
-0.1719848, -0.4937261, -2.236708, 1, 1, 1, 1, 1,
-0.1714554, -0.4646236, -2.071835, 1, 1, 1, 1, 1,
-0.1634702, -1.476215, -2.518708, 1, 1, 1, 1, 1,
-0.1631819, -1.778962, -2.548327, 1, 1, 1, 1, 1,
-0.1617136, 0.3111498, -1.905641, 1, 1, 1, 1, 1,
-0.1591083, -1.674563, -3.199346, 1, 1, 1, 1, 1,
-0.1579189, 0.6950686, 0.6614109, 1, 1, 1, 1, 1,
-0.1544756, -1.138964, -2.735478, 1, 1, 1, 1, 1,
-0.1538955, -1.142022, -2.58656, 1, 1, 1, 1, 1,
-0.1524743, 1.5559, 1.77763, 1, 1, 1, 1, 1,
-0.1523643, 1.669513, -0.568787, 1, 1, 1, 1, 1,
-0.148976, -0.1679509, -3.306861, 1, 1, 1, 1, 1,
-0.1427701, -0.449322, -3.76227, 1, 1, 1, 1, 1,
-0.1403947, 0.7967075, -1.167996, 1, 1, 1, 1, 1,
-0.1399725, 1.174061, 0.3106731, 0, 0, 1, 1, 1,
-0.1394708, -0.1043867, -3.687018, 1, 0, 0, 1, 1,
-0.1388352, -0.4973028, -2.980391, 1, 0, 0, 1, 1,
-0.1379659, 1.397502, -1.059237, 1, 0, 0, 1, 1,
-0.1373524, 0.3422292, -1.084107, 1, 0, 0, 1, 1,
-0.1361468, -0.9540648, -2.592629, 1, 0, 0, 1, 1,
-0.1330141, -0.7158644, -1.058226, 0, 0, 0, 1, 1,
-0.1320597, 0.8650662, 1.080862, 0, 0, 0, 1, 1,
-0.1118094, -2.410442, -3.404834, 0, 0, 0, 1, 1,
-0.1110338, -0.5074909, -2.376877, 0, 0, 0, 1, 1,
-0.1108156, -0.5281433, -4.821309, 0, 0, 0, 1, 1,
-0.1099993, -1.010638, -4.212697, 0, 0, 0, 1, 1,
-0.1085442, 0.5225158, -1.782574, 0, 0, 0, 1, 1,
-0.1051022, -1.055616, -5.418497, 1, 1, 1, 1, 1,
-0.09879371, 1.695602, -0.01020589, 1, 1, 1, 1, 1,
-0.09809323, 1.010087, -0.3155649, 1, 1, 1, 1, 1,
-0.09745531, 0.2590083, -0.2837804, 1, 1, 1, 1, 1,
-0.09706327, 0.9591726, 0.9642785, 1, 1, 1, 1, 1,
-0.09672742, 0.7975605, 0.6125759, 1, 1, 1, 1, 1,
-0.09672561, 0.2197032, 0.6498421, 1, 1, 1, 1, 1,
-0.09510315, 0.5458118, -0.2704256, 1, 1, 1, 1, 1,
-0.09445341, -0.09343247, -1.42849, 1, 1, 1, 1, 1,
-0.09066329, 0.579009, -1.140742, 1, 1, 1, 1, 1,
-0.08445167, 0.8741411, 0.3500211, 1, 1, 1, 1, 1,
-0.08272532, -2.670366, -2.02047, 1, 1, 1, 1, 1,
-0.08260517, -1.497019, -0.8280839, 1, 1, 1, 1, 1,
-0.08023499, 1.016884, 1.645417, 1, 1, 1, 1, 1,
-0.07695594, -0.3834255, -2.07816, 1, 1, 1, 1, 1,
-0.07623366, 1.623641, 0.8434296, 0, 0, 1, 1, 1,
-0.07617573, 1.424301, 2.319626, 1, 0, 0, 1, 1,
-0.07395971, -1.996276, -4.2032, 1, 0, 0, 1, 1,
-0.07271075, 0.1535271, -1.784207, 1, 0, 0, 1, 1,
-0.0727093, 0.515734, -0.3033837, 1, 0, 0, 1, 1,
-0.06509374, 1.533693, -0.3105215, 1, 0, 0, 1, 1,
-0.06276963, 0.7494664, 1.472623, 0, 0, 0, 1, 1,
-0.06126226, 1.806821, -0.7131228, 0, 0, 0, 1, 1,
-0.05981598, 0.7383959, 1.146356, 0, 0, 0, 1, 1,
-0.05785664, -0.2517849, -2.224307, 0, 0, 0, 1, 1,
-0.05708031, -0.5031684, -3.478717, 0, 0, 0, 1, 1,
-0.05544386, 1.555656, -0.1524212, 0, 0, 0, 1, 1,
-0.05390698, -0.5727063, -2.695243, 0, 0, 0, 1, 1,
-0.05172215, -1.341607, -4.804763, 1, 1, 1, 1, 1,
-0.05159101, -0.4107495, -3.054951, 1, 1, 1, 1, 1,
-0.05150846, -0.128887, -2.55338, 1, 1, 1, 1, 1,
-0.04778219, 0.4695092, -0.3904831, 1, 1, 1, 1, 1,
-0.04422943, -0.791785, -3.221938, 1, 1, 1, 1, 1,
-0.04416753, -0.7968113, -2.152792, 1, 1, 1, 1, 1,
-0.04257685, 0.4572333, 0.9278539, 1, 1, 1, 1, 1,
-0.03927406, 0.4091544, 0.09655429, 1, 1, 1, 1, 1,
-0.0343463, -0.5841315, -4.984297, 1, 1, 1, 1, 1,
-0.03228572, 0.6208973, 0.05099232, 1, 1, 1, 1, 1,
-0.03151076, 0.3122863, -1.898707, 1, 1, 1, 1, 1,
-0.02848216, 0.2054776, -0.5295161, 1, 1, 1, 1, 1,
-0.0257544, 1.798906, -0.09971791, 1, 1, 1, 1, 1,
-0.0212389, 1.256537, 0.3080549, 1, 1, 1, 1, 1,
-0.02067893, -1.180311, -4.21802, 1, 1, 1, 1, 1,
-0.01905452, 2.034621, 1.268307, 0, 0, 1, 1, 1,
-0.01477325, -0.1248984, -4.106351, 1, 0, 0, 1, 1,
-0.01221603, 0.265512, -1.349396, 1, 0, 0, 1, 1,
-0.01220923, -1.621801, -1.843962, 1, 0, 0, 1, 1,
-0.007251723, 1.121375, -0.7920601, 1, 0, 0, 1, 1,
-0.005775538, -0.2659035, -3.176423, 1, 0, 0, 1, 1,
-0.005679062, -0.5400237, -3.622797, 0, 0, 0, 1, 1,
-0.002940467, 1.556566, -0.8713449, 0, 0, 0, 1, 1,
-0.002029034, 0.5581522, 0.8007871, 0, 0, 0, 1, 1,
-0.0005229342, -0.1728308, -3.921039, 0, 0, 0, 1, 1,
0.0008544584, 0.671132, -0.177671, 0, 0, 0, 1, 1,
0.001640752, 0.3206606, 1.103583, 0, 0, 0, 1, 1,
0.006097025, -0.6290814, 3.397699, 0, 0, 0, 1, 1,
0.00815092, -0.8125777, 2.216126, 1, 1, 1, 1, 1,
0.01130509, 0.4907633, 1.634171, 1, 1, 1, 1, 1,
0.01203087, -1.28871, 3.474749, 1, 1, 1, 1, 1,
0.01391522, 0.449157, 0.2068175, 1, 1, 1, 1, 1,
0.01445969, -0.4001062, 4.847347, 1, 1, 1, 1, 1,
0.0160167, -1.182305, 2.037036, 1, 1, 1, 1, 1,
0.02191189, 0.5939017, 0.1736359, 1, 1, 1, 1, 1,
0.02205184, -0.1572215, 3.041476, 1, 1, 1, 1, 1,
0.02630539, 0.01814834, 0.9999291, 1, 1, 1, 1, 1,
0.03756704, 0.1035041, -1.742433, 1, 1, 1, 1, 1,
0.03776551, -0.7393709, 2.689216, 1, 1, 1, 1, 1,
0.0444404, -0.6977451, 2.381606, 1, 1, 1, 1, 1,
0.04467246, 0.7504665, 0.5821338, 1, 1, 1, 1, 1,
0.04652672, -0.652752, 2.605096, 1, 1, 1, 1, 1,
0.04733174, 1.649698, 0.8961251, 1, 1, 1, 1, 1,
0.05148583, -0.8858956, 4.278358, 0, 0, 1, 1, 1,
0.05242613, 0.691656, 0.3998525, 1, 0, 0, 1, 1,
0.05703593, 0.1422461, 0.6484709, 1, 0, 0, 1, 1,
0.0652101, 0.6956561, -0.7000976, 1, 0, 0, 1, 1,
0.06614781, 0.3449687, 0.1480848, 1, 0, 0, 1, 1,
0.06986754, -0.4253114, 4.301258, 1, 0, 0, 1, 1,
0.07104036, -0.4938431, 1.961241, 0, 0, 0, 1, 1,
0.07211258, -0.02425548, 1.542463, 0, 0, 0, 1, 1,
0.07335695, -1.217493, 3.470934, 0, 0, 0, 1, 1,
0.07889668, -0.1259212, 3.503427, 0, 0, 0, 1, 1,
0.08348827, 0.008854648, 2.19234, 0, 0, 0, 1, 1,
0.08440744, 0.5389007, 0.2932116, 0, 0, 0, 1, 1,
0.08582349, -0.008203589, 2.511481, 0, 0, 0, 1, 1,
0.0863499, -0.7672692, 2.625907, 1, 1, 1, 1, 1,
0.08676188, 1.175084, -0.08345933, 1, 1, 1, 1, 1,
0.08911604, -0.5782586, 3.080295, 1, 1, 1, 1, 1,
0.08984536, 1.567143, 0.6540133, 1, 1, 1, 1, 1,
0.09391392, 0.9194645, -0.2858209, 1, 1, 1, 1, 1,
0.09484737, 0.1321006, 0.8982784, 1, 1, 1, 1, 1,
0.09792009, 0.2503927, -0.5139275, 1, 1, 1, 1, 1,
0.09956444, -1.241069, 3.714812, 1, 1, 1, 1, 1,
0.09969796, 0.6124271, 1.499469, 1, 1, 1, 1, 1,
0.1000604, 0.785682, -0.521153, 1, 1, 1, 1, 1,
0.1062229, 0.167924, 1.404912, 1, 1, 1, 1, 1,
0.1069297, 1.612172, 0.7092167, 1, 1, 1, 1, 1,
0.1121357, 2.602131, -0.01781163, 1, 1, 1, 1, 1,
0.1140787, 0.2744986, -0.2463815, 1, 1, 1, 1, 1,
0.1147951, -0.9516346, 3.547153, 1, 1, 1, 1, 1,
0.1167999, -0.7617738, 5.301486, 0, 0, 1, 1, 1,
0.1172597, 0.2976328, 1.444644, 1, 0, 0, 1, 1,
0.1175264, 1.211997, -0.4868081, 1, 0, 0, 1, 1,
0.119774, -0.6385944, 2.609501, 1, 0, 0, 1, 1,
0.1207242, 1.525508, 1.769481, 1, 0, 0, 1, 1,
0.123957, 1.350556, -1.486198, 1, 0, 0, 1, 1,
0.1386451, 1.805319, 0.8096226, 0, 0, 0, 1, 1,
0.1429706, -0.3832689, 2.330878, 0, 0, 0, 1, 1,
0.145208, 0.846562, -0.6597711, 0, 0, 0, 1, 1,
0.1480042, 0.7776617, -0.1567995, 0, 0, 0, 1, 1,
0.1480998, 0.1561175, 0.1039404, 0, 0, 0, 1, 1,
0.1491167, 1.615542, 0.4374764, 0, 0, 0, 1, 1,
0.150979, 0.4337652, 0.7791963, 0, 0, 0, 1, 1,
0.152413, 0.5748546, 0.2404496, 1, 1, 1, 1, 1,
0.1570621, -0.5119649, 4.077913, 1, 1, 1, 1, 1,
0.1599289, -0.7483022, 3.065289, 1, 1, 1, 1, 1,
0.1618222, 0.6034699, 0.08888038, 1, 1, 1, 1, 1,
0.1636729, 1.035481, 0.6853241, 1, 1, 1, 1, 1,
0.1639616, -1.751048, 2.514289, 1, 1, 1, 1, 1,
0.1643122, -0.04046632, 1.548725, 1, 1, 1, 1, 1,
0.1687195, 0.9074199, -0.8503725, 1, 1, 1, 1, 1,
0.1734648, 0.8809809, 1.316824, 1, 1, 1, 1, 1,
0.1742174, -1.134433, 3.37585, 1, 1, 1, 1, 1,
0.1800705, -0.3846749, 1.44399, 1, 1, 1, 1, 1,
0.1802564, -0.5311885, 3.010545, 1, 1, 1, 1, 1,
0.1803088, 1.568947, 1.281982, 1, 1, 1, 1, 1,
0.1810446, 0.4755151, 1.102192, 1, 1, 1, 1, 1,
0.1812508, 1.503779, -0.6462252, 1, 1, 1, 1, 1,
0.1857795, 1.459802, -1.153586, 0, 0, 1, 1, 1,
0.1916641, -0.6450014, 1.524969, 1, 0, 0, 1, 1,
0.1959483, -0.8356423, 3.602165, 1, 0, 0, 1, 1,
0.1967188, -0.1726414, 1.775058, 1, 0, 0, 1, 1,
0.1974292, -2.034379, 1.853525, 1, 0, 0, 1, 1,
0.1996694, 0.3823919, 1.002244, 1, 0, 0, 1, 1,
0.2054447, -2.48983, 3.489351, 0, 0, 0, 1, 1,
0.2066038, -1.22657, 3.349707, 0, 0, 0, 1, 1,
0.208181, 0.8250747, -1.035031, 0, 0, 0, 1, 1,
0.2086087, -0.6134276, 2.256613, 0, 0, 0, 1, 1,
0.209088, 0.6412891, 0.6759591, 0, 0, 0, 1, 1,
0.213287, -1.325526, 0.3789507, 0, 0, 0, 1, 1,
0.2169423, -0.05105042, 0.7518151, 0, 0, 0, 1, 1,
0.2193945, -1.14455, 3.421348, 1, 1, 1, 1, 1,
0.2195747, -1.222643, 3.417984, 1, 1, 1, 1, 1,
0.2207897, -0.05991522, 2.454288, 1, 1, 1, 1, 1,
0.2235874, 0.7442095, -0.05645429, 1, 1, 1, 1, 1,
0.2238767, -1.205062, 5.577979, 1, 1, 1, 1, 1,
0.2317974, -0.082216, 2.447741, 1, 1, 1, 1, 1,
0.2322781, 1.187767, 0.4581057, 1, 1, 1, 1, 1,
0.23574, -1.806599, 3.337226, 1, 1, 1, 1, 1,
0.236803, 0.8501753, 0.8695571, 1, 1, 1, 1, 1,
0.2378809, 1.988379, 0.3517641, 1, 1, 1, 1, 1,
0.2433379, 1.099808, -1.155588, 1, 1, 1, 1, 1,
0.2433454, 0.1321286, 0.5650669, 1, 1, 1, 1, 1,
0.2446395, 0.4947409, 0.06188596, 1, 1, 1, 1, 1,
0.2467251, -0.001793436, 1.673512, 1, 1, 1, 1, 1,
0.2485203, -0.06971932, 1.046216, 1, 1, 1, 1, 1,
0.248681, -0.3254106, 3.578435, 0, 0, 1, 1, 1,
0.2531008, 0.03236456, 1.613467, 1, 0, 0, 1, 1,
0.2540914, -0.0346726, 0.6053467, 1, 0, 0, 1, 1,
0.254316, -0.9946108, 2.525831, 1, 0, 0, 1, 1,
0.2552344, -0.8543983, 3.138323, 1, 0, 0, 1, 1,
0.2580764, -0.8988547, 2.895877, 1, 0, 0, 1, 1,
0.2586112, -0.6875151, 4.834975, 0, 0, 0, 1, 1,
0.2617744, 0.7926571, -1.373008, 0, 0, 0, 1, 1,
0.2723686, 0.6130014, -1.864458, 0, 0, 0, 1, 1,
0.2759238, -0.8768237, 2.352749, 0, 0, 0, 1, 1,
0.278613, -0.2795116, 3.702464, 0, 0, 0, 1, 1,
0.2797424, 0.396792, 2.1096, 0, 0, 0, 1, 1,
0.2830265, 0.5858231, 1.811343, 0, 0, 0, 1, 1,
0.2833392, -1.171136, 3.6274, 1, 1, 1, 1, 1,
0.284999, -0.4434279, 1.864912, 1, 1, 1, 1, 1,
0.2851431, -1.150325, 3.654047, 1, 1, 1, 1, 1,
0.2899854, -1.575128, 4.619123, 1, 1, 1, 1, 1,
0.2986952, -1.687191, 3.010515, 1, 1, 1, 1, 1,
0.3021462, 0.5422361, -0.8605732, 1, 1, 1, 1, 1,
0.3076923, 0.2778864, -0.2770655, 1, 1, 1, 1, 1,
0.3076946, 1.514605, 0.8121451, 1, 1, 1, 1, 1,
0.3128173, 0.292181, -0.3992347, 1, 1, 1, 1, 1,
0.3146973, -0.2042924, 1.518311, 1, 1, 1, 1, 1,
0.3166968, -2.190953, 0.9752604, 1, 1, 1, 1, 1,
0.3239268, 0.6768553, -0.7985899, 1, 1, 1, 1, 1,
0.3283139, 0.1563898, 3.510431, 1, 1, 1, 1, 1,
0.328853, -0.1497614, 2.35078, 1, 1, 1, 1, 1,
0.3343089, -0.2669567, 2.386974, 1, 1, 1, 1, 1,
0.3350881, -0.06482417, 1.421557, 0, 0, 1, 1, 1,
0.337567, 1.059568, 0.1902384, 1, 0, 0, 1, 1,
0.3400884, 0.5813988, 1.414721, 1, 0, 0, 1, 1,
0.3411708, 2.504198, 1.454244, 1, 0, 0, 1, 1,
0.3457012, 0.06001626, 3.053499, 1, 0, 0, 1, 1,
0.3462512, 0.3857448, -0.5666295, 1, 0, 0, 1, 1,
0.3479594, -0.9398144, 2.292778, 0, 0, 0, 1, 1,
0.3488145, -0.4277705, 6.3274, 0, 0, 0, 1, 1,
0.3488367, 1.298472, 0.8784556, 0, 0, 0, 1, 1,
0.3502192, -1.393598, 3.051408, 0, 0, 0, 1, 1,
0.3541078, 1.032291, 1.357656, 0, 0, 0, 1, 1,
0.3560664, 1.372873, -1.087927, 0, 0, 0, 1, 1,
0.3577156, 1.656822, 0.009559906, 0, 0, 0, 1, 1,
0.3651991, 0.7736527, 1.121241, 1, 1, 1, 1, 1,
0.3669654, -0.6009599, 1.893825, 1, 1, 1, 1, 1,
0.3672447, 1.708243, -0.401247, 1, 1, 1, 1, 1,
0.3745869, 1.055507, -0.8067671, 1, 1, 1, 1, 1,
0.3769283, 1.079162, -0.5786044, 1, 1, 1, 1, 1,
0.3791111, 1.297382, -0.2162525, 1, 1, 1, 1, 1,
0.3849956, 0.1199604, 0.6206989, 1, 1, 1, 1, 1,
0.3875736, -0.02771014, 1.234686, 1, 1, 1, 1, 1,
0.3900582, -0.6998051, 2.518746, 1, 1, 1, 1, 1,
0.3929157, -0.3021798, 1.755112, 1, 1, 1, 1, 1,
0.3999299, 0.7853461, 0.4755499, 1, 1, 1, 1, 1,
0.4006435, -0.4956155, 3.063031, 1, 1, 1, 1, 1,
0.406121, 0.8320219, -0.01109345, 1, 1, 1, 1, 1,
0.4071345, -1.677879, 1.193505, 1, 1, 1, 1, 1,
0.4079524, 1.405837, -0.735023, 1, 1, 1, 1, 1,
0.4091721, -0.6821752, 1.625854, 0, 0, 1, 1, 1,
0.4093497, -0.986999, 3.643816, 1, 0, 0, 1, 1,
0.4159489, 0.641596, 1.603188, 1, 0, 0, 1, 1,
0.4164018, 1.01113, -0.9942277, 1, 0, 0, 1, 1,
0.4166988, 1.791879, 1.282784, 1, 0, 0, 1, 1,
0.4193501, 1.153839, 0.3436625, 1, 0, 0, 1, 1,
0.4222364, 0.6782209, 0.765699, 0, 0, 0, 1, 1,
0.4315315, -0.5576445, 2.446553, 0, 0, 0, 1, 1,
0.4380102, 0.5546231, 0.3816185, 0, 0, 0, 1, 1,
0.4397902, 0.1614736, 2.906631, 0, 0, 0, 1, 1,
0.4415002, 0.3370815, 1.525272, 0, 0, 0, 1, 1,
0.4432699, 0.1234, 1.803537, 0, 0, 0, 1, 1,
0.4477121, 0.1549481, 0.7044059, 0, 0, 0, 1, 1,
0.4492849, 0.62757, -0.6098866, 1, 1, 1, 1, 1,
0.4502248, -0.6415581, 1.367541, 1, 1, 1, 1, 1,
0.4504458, -0.3153836, 1.917174, 1, 1, 1, 1, 1,
0.450649, 0.09581411, 1.212609, 1, 1, 1, 1, 1,
0.4543259, 0.3766274, -1.741348, 1, 1, 1, 1, 1,
0.4543356, -0.8360736, 4.477889, 1, 1, 1, 1, 1,
0.4550304, 0.4101484, -0.6484125, 1, 1, 1, 1, 1,
0.4556762, -0.308203, 2.042706, 1, 1, 1, 1, 1,
0.4580603, 0.9595279, 1.358866, 1, 1, 1, 1, 1,
0.4589335, 0.6936249, 0.4030224, 1, 1, 1, 1, 1,
0.4636873, -0.1988555, 0.9634716, 1, 1, 1, 1, 1,
0.4775241, -0.6741853, 3.335665, 1, 1, 1, 1, 1,
0.4891222, -0.8747231, 1.272483, 1, 1, 1, 1, 1,
0.4891566, -0.1693555, -0.2215466, 1, 1, 1, 1, 1,
0.490247, 0.1140785, 0.9351623, 1, 1, 1, 1, 1,
0.4917937, -1.574356, 2.00814, 0, 0, 1, 1, 1,
0.4942274, 1.399474, -0.8112539, 1, 0, 0, 1, 1,
0.4947869, -0.2295913, 2.07545, 1, 0, 0, 1, 1,
0.4952976, 0.8364664, 1.075905, 1, 0, 0, 1, 1,
0.4967189, 0.6227542, -1.276623, 1, 0, 0, 1, 1,
0.4995843, -0.2991494, 2.714513, 1, 0, 0, 1, 1,
0.5007017, 0.2426157, 1.390167, 0, 0, 0, 1, 1,
0.5058418, 1.158465, 1.644713, 0, 0, 0, 1, 1,
0.5111095, 0.4147349, 1.575642, 0, 0, 0, 1, 1,
0.5116816, -0.9084716, 3.280959, 0, 0, 0, 1, 1,
0.5200245, -1.281897, 3.287988, 0, 0, 0, 1, 1,
0.5219923, 0.5607969, -0.09113692, 0, 0, 0, 1, 1,
0.5226105, 0.168309, 0.5212647, 0, 0, 0, 1, 1,
0.5272322, 0.2009238, 1.685027, 1, 1, 1, 1, 1,
0.529703, 0.2803954, 1.782647, 1, 1, 1, 1, 1,
0.5298281, -0.6117988, 4.589159, 1, 1, 1, 1, 1,
0.5413219, -1.000192, 1.81139, 1, 1, 1, 1, 1,
0.5438977, -0.5740727, 3.463886, 1, 1, 1, 1, 1,
0.5452179, 0.5616541, 1.58026, 1, 1, 1, 1, 1,
0.5493218, 1.305068, 0.05921264, 1, 1, 1, 1, 1,
0.5522001, 0.3381052, 2.097133, 1, 1, 1, 1, 1,
0.5546345, 2.06232, 0.8868138, 1, 1, 1, 1, 1,
0.5567685, 1.143346, 0.7709396, 1, 1, 1, 1, 1,
0.5596022, -0.4274341, 0.1026951, 1, 1, 1, 1, 1,
0.5655461, -0.3757073, 4.134192, 1, 1, 1, 1, 1,
0.5664716, 0.1378, 1.475223, 1, 1, 1, 1, 1,
0.5668691, 0.5655741, -2.062835, 1, 1, 1, 1, 1,
0.5693103, 2.013412, 0.9376173, 1, 1, 1, 1, 1,
0.5706716, -1.173852, 2.826768, 0, 0, 1, 1, 1,
0.5708525, -0.6617345, 1.134718, 1, 0, 0, 1, 1,
0.5821674, 1.001469, 0.7973573, 1, 0, 0, 1, 1,
0.5846226, -1.059653, 2.107625, 1, 0, 0, 1, 1,
0.5858666, -1.815338, 1.163523, 1, 0, 0, 1, 1,
0.5859645, 1.033363, -0.776524, 1, 0, 0, 1, 1,
0.5885612, -0.8578157, 2.209495, 0, 0, 0, 1, 1,
0.5980784, -0.3614763, 2.289136, 0, 0, 0, 1, 1,
0.6021086, 0.1919686, 0.7852353, 0, 0, 0, 1, 1,
0.6037551, -1.299679, 2.801059, 0, 0, 0, 1, 1,
0.6067643, -0.801429, 3.68078, 0, 0, 0, 1, 1,
0.6084645, 1.260764, 0.3468855, 0, 0, 0, 1, 1,
0.6090413, 1.269147, 0.2930777, 0, 0, 0, 1, 1,
0.6109629, 1.103303, 1.998599, 1, 1, 1, 1, 1,
0.6122645, -2.14375, 3.219698, 1, 1, 1, 1, 1,
0.6213811, -0.6235377, 4.1897, 1, 1, 1, 1, 1,
0.6222124, -0.05691563, 1.311358, 1, 1, 1, 1, 1,
0.6249709, 1.354686, 0.9492183, 1, 1, 1, 1, 1,
0.6271283, -1.510096, 1.574713, 1, 1, 1, 1, 1,
0.6346253, -1.186672, 3.089195, 1, 1, 1, 1, 1,
0.6350973, -2.897446, 2.17427, 1, 1, 1, 1, 1,
0.636209, 0.2804456, 1.489366, 1, 1, 1, 1, 1,
0.638853, -0.8766055, 2.782598, 1, 1, 1, 1, 1,
0.6390006, 0.09647898, 2.002282, 1, 1, 1, 1, 1,
0.6404251, 2.180633, 0.1934074, 1, 1, 1, 1, 1,
0.6410199, -1.126997, 3.206678, 1, 1, 1, 1, 1,
0.6434073, -1.558203, 0.7436185, 1, 1, 1, 1, 1,
0.6456194, 0.06671423, 2.111772, 1, 1, 1, 1, 1,
0.6471722, 1.153774, 0.8764896, 0, 0, 1, 1, 1,
0.6481341, 1.168891, 1.618695, 1, 0, 0, 1, 1,
0.6510839, -0.821569, 3.241666, 1, 0, 0, 1, 1,
0.6534919, 1.066482, 2.123897, 1, 0, 0, 1, 1,
0.654076, -1.453578, 1.778646, 1, 0, 0, 1, 1,
0.6553214, 0.5823176, 0.54499, 1, 0, 0, 1, 1,
0.6586764, -0.5464279, 2.962431, 0, 0, 0, 1, 1,
0.6624354, -0.7834283, 1.592381, 0, 0, 0, 1, 1,
0.6683114, 0.04770524, 1.26723, 0, 0, 0, 1, 1,
0.6691197, 0.2853951, 2.162946, 0, 0, 0, 1, 1,
0.6692886, -0.4353872, 4.237464, 0, 0, 0, 1, 1,
0.6702634, 0.3658753, 2.132923, 0, 0, 0, 1, 1,
0.6750146, 0.014864, 2.713849, 0, 0, 0, 1, 1,
0.6763307, -2.036001, 3.407698, 1, 1, 1, 1, 1,
0.6768149, -0.6580064, 1.28062, 1, 1, 1, 1, 1,
0.682252, -0.6087772, 2.89059, 1, 1, 1, 1, 1,
0.6837646, 0.2098618, 1.225719, 1, 1, 1, 1, 1,
0.6873068, -0.4417205, 1.973263, 1, 1, 1, 1, 1,
0.688777, 1.208139, 1.67203, 1, 1, 1, 1, 1,
0.6891667, -0.3344404, 2.517284, 1, 1, 1, 1, 1,
0.6903301, -0.5696134, 2.32032, 1, 1, 1, 1, 1,
0.7072626, -1.115503, 3.21439, 1, 1, 1, 1, 1,
0.7073273, -0.4498762, 1.394149, 1, 1, 1, 1, 1,
0.7087612, -0.9338807, 1.39112, 1, 1, 1, 1, 1,
0.7107357, -1.8616, 1.682987, 1, 1, 1, 1, 1,
0.7115037, 1.194842, 2.214592, 1, 1, 1, 1, 1,
0.7154908, 0.9341362, 0.7030216, 1, 1, 1, 1, 1,
0.717013, -0.05172198, 2.191935, 1, 1, 1, 1, 1,
0.7253078, -0.7181086, 4.259697, 0, 0, 1, 1, 1,
0.7272804, -0.8982663, 2.324265, 1, 0, 0, 1, 1,
0.7289419, -0.3486815, 1.900752, 1, 0, 0, 1, 1,
0.7310897, 0.638491, 1.34999, 1, 0, 0, 1, 1,
0.7354152, 0.7968169, 1.476306, 1, 0, 0, 1, 1,
0.7434906, 3.438075, -0.5368657, 1, 0, 0, 1, 1,
0.7466799, -0.09055376, 1.951785, 0, 0, 0, 1, 1,
0.7513504, 1.094307, 0.578896, 0, 0, 0, 1, 1,
0.756804, 0.2449385, 0.04438864, 0, 0, 0, 1, 1,
0.7578691, -0.5967482, 1.131435, 0, 0, 0, 1, 1,
0.7588794, 0.6027662, 1.701423, 0, 0, 0, 1, 1,
0.7674399, -0.2531878, 1.086205, 0, 0, 0, 1, 1,
0.7694552, -0.1343571, 2.000443, 0, 0, 0, 1, 1,
0.7720213, 0.2804678, 0.1083949, 1, 1, 1, 1, 1,
0.7729627, 1.649749, 1.224788, 1, 1, 1, 1, 1,
0.773039, -0.3696937, 1.87914, 1, 1, 1, 1, 1,
0.7734304, -0.8948584, 2.069053, 1, 1, 1, 1, 1,
0.7785929, 0.1762282, 1.02103, 1, 1, 1, 1, 1,
0.7877561, -0.406499, -0.2051053, 1, 1, 1, 1, 1,
0.7899307, -0.03844294, 0.3249968, 1, 1, 1, 1, 1,
0.79038, 0.7657253, -0.4071701, 1, 1, 1, 1, 1,
0.7964811, 1.371972, -0.1872698, 1, 1, 1, 1, 1,
0.7975096, -0.3132374, 2.851201, 1, 1, 1, 1, 1,
0.7995366, -0.006575746, 1.937123, 1, 1, 1, 1, 1,
0.7999492, -0.2300083, 1.566865, 1, 1, 1, 1, 1,
0.8003873, -0.03094402, 2.298283, 1, 1, 1, 1, 1,
0.8025656, -0.1073057, 4.852811, 1, 1, 1, 1, 1,
0.8107303, 0.7851247, 0.363416, 1, 1, 1, 1, 1,
0.8156741, 0.7548829, -0.4039707, 0, 0, 1, 1, 1,
0.8305286, -0.3409777, 2.183212, 1, 0, 0, 1, 1,
0.8308502, 0.09904628, 1.751883, 1, 0, 0, 1, 1,
0.832597, 0.300669, -0.6302474, 1, 0, 0, 1, 1,
0.8378831, 0.3022304, 0.2241834, 1, 0, 0, 1, 1,
0.8413364, 1.794157, 1.092011, 1, 0, 0, 1, 1,
0.8431888, -0.1784377, 2.135711, 0, 0, 0, 1, 1,
0.8452994, 1.160773, 1.479662, 0, 0, 0, 1, 1,
0.8493329, -0.1794582, 3.729853, 0, 0, 0, 1, 1,
0.8520988, 0.2832314, 0.2449408, 0, 0, 0, 1, 1,
0.8539199, 0.8458161, -0.2808424, 0, 0, 0, 1, 1,
0.8543932, -0.5641899, 1.736378, 0, 0, 0, 1, 1,
0.8554457, -1.724881, 2.731547, 0, 0, 0, 1, 1,
0.8555247, -1.240948, 1.600573, 1, 1, 1, 1, 1,
0.8576204, -0.3507934, 2.967902, 1, 1, 1, 1, 1,
0.860525, 0.8752766, -0.2708806, 1, 1, 1, 1, 1,
0.8624578, 0.1773438, 1.655517, 1, 1, 1, 1, 1,
0.8746716, -0.3451423, 1.378281, 1, 1, 1, 1, 1,
0.8776366, 1.158745, 1.7256, 1, 1, 1, 1, 1,
0.8859465, 0.9389902, -0.3126231, 1, 1, 1, 1, 1,
0.8882484, 0.02922131, 1.684758, 1, 1, 1, 1, 1,
0.8898732, 0.9532855, -0.2426497, 1, 1, 1, 1, 1,
0.8918242, -0.4133829, 1.891058, 1, 1, 1, 1, 1,
0.8929561, -0.7825499, 1.992237, 1, 1, 1, 1, 1,
0.8980353, 2.310956, 0.6800292, 1, 1, 1, 1, 1,
0.9029319, 1.188685, 1.403592, 1, 1, 1, 1, 1,
0.9035182, -0.08703379, 0.4629105, 1, 1, 1, 1, 1,
0.9089479, -0.9807572, 3.115167, 1, 1, 1, 1, 1,
0.9099715, -0.8713112, 1.425376, 0, 0, 1, 1, 1,
0.9171586, 1.531752, -0.1524554, 1, 0, 0, 1, 1,
0.9210258, 1.018575, 2.515038, 1, 0, 0, 1, 1,
0.9221947, -0.4549435, 4.113501, 1, 0, 0, 1, 1,
0.9274567, -0.2835252, 2.902821, 1, 0, 0, 1, 1,
0.9281307, 1.508074, 0.5879744, 1, 0, 0, 1, 1,
0.9284756, -0.1277198, 2.833663, 0, 0, 0, 1, 1,
0.9296589, -0.2231899, 2.672065, 0, 0, 0, 1, 1,
0.9371496, -0.580026, 1.944443, 0, 0, 0, 1, 1,
0.9379559, 1.456656, -0.2190493, 0, 0, 0, 1, 1,
0.9411418, -0.8367494, 1.235892, 0, 0, 0, 1, 1,
0.9506072, -0.6014708, 2.145594, 0, 0, 0, 1, 1,
0.9520154, -0.6341728, 2.476303, 0, 0, 0, 1, 1,
0.9535815, 0.5937452, 0.2669868, 1, 1, 1, 1, 1,
0.9545134, 1.703525, -0.1102184, 1, 1, 1, 1, 1,
0.9555869, 1.107894, 0.2088493, 1, 1, 1, 1, 1,
0.9560863, -0.9093398, 3.205392, 1, 1, 1, 1, 1,
0.9586455, 0.4153712, -0.6357632, 1, 1, 1, 1, 1,
0.9601936, 0.4770209, 0.4654119, 1, 1, 1, 1, 1,
0.9676266, 0.4082554, 1.431477, 1, 1, 1, 1, 1,
0.9728194, -0.2070829, 2.410922, 1, 1, 1, 1, 1,
0.9734694, -1.085197, 1.769855, 1, 1, 1, 1, 1,
0.9780904, -1.238806, 1.714039, 1, 1, 1, 1, 1,
0.9873162, 0.255442, 0.8976038, 1, 1, 1, 1, 1,
0.996076, 0.9430437, -0.2074907, 1, 1, 1, 1, 1,
0.9993065, 0.2925702, 0.2132671, 1, 1, 1, 1, 1,
1.004733, -1.200768, 2.02796, 1, 1, 1, 1, 1,
1.00565, -1.470732, 1.271411, 1, 1, 1, 1, 1,
1.006758, -0.3252383, 0.7181437, 0, 0, 1, 1, 1,
1.008083, 1.784878, 1.623826, 1, 0, 0, 1, 1,
1.016972, -0.007829932, 2.064448, 1, 0, 0, 1, 1,
1.022794, -0.09889369, 1.74799, 1, 0, 0, 1, 1,
1.023653, -0.2034575, 1.412271, 1, 0, 0, 1, 1,
1.030253, 0.6066396, 0.8622038, 1, 0, 0, 1, 1,
1.031315, 0.02245525, 0.2379311, 0, 0, 0, 1, 1,
1.032475, 1.367073, 0.7312331, 0, 0, 0, 1, 1,
1.037142, 0.3201877, 0.8086212, 0, 0, 0, 1, 1,
1.045839, -0.4635602, 0.4072789, 0, 0, 0, 1, 1,
1.054059, -0.006103558, 1.79902, 0, 0, 0, 1, 1,
1.066355, 0.9053288, 1.133918, 0, 0, 0, 1, 1,
1.073396, 0.8937896, 1.662643, 0, 0, 0, 1, 1,
1.080398, -0.8620197, 2.134198, 1, 1, 1, 1, 1,
1.082305, -0.599466, 1.18763, 1, 1, 1, 1, 1,
1.082627, -0.6080984, 2.931602, 1, 1, 1, 1, 1,
1.090043, 0.4963416, 2.601107, 1, 1, 1, 1, 1,
1.095939, -1.367095, 3.33628, 1, 1, 1, 1, 1,
1.096019, 1.480273, 1.683696, 1, 1, 1, 1, 1,
1.101507, 0.3308983, 0.5963727, 1, 1, 1, 1, 1,
1.109919, -0.6734254, 2.020251, 1, 1, 1, 1, 1,
1.113181, 0.2699271, -0.2521813, 1, 1, 1, 1, 1,
1.113875, -0.6911822, 2.121914, 1, 1, 1, 1, 1,
1.119754, -0.04492739, 2.34233, 1, 1, 1, 1, 1,
1.123816, -0.1396876, 2.089541, 1, 1, 1, 1, 1,
1.135827, 1.612481, 0.3691187, 1, 1, 1, 1, 1,
1.143008, -1.648796, 1.820165, 1, 1, 1, 1, 1,
1.150977, 0.127039, 3.336431, 1, 1, 1, 1, 1,
1.153379, 0.1603045, 1.285182, 0, 0, 1, 1, 1,
1.153786, 0.7022986, 0.5954316, 1, 0, 0, 1, 1,
1.154913, 0.06925522, 2.345955, 1, 0, 0, 1, 1,
1.157088, 0.2688933, 1.704562, 1, 0, 0, 1, 1,
1.171786, 2.29368, 1.576783, 1, 0, 0, 1, 1,
1.178093, 1.141256, 1.327715, 1, 0, 0, 1, 1,
1.186403, -0.9945788, 2.24912, 0, 0, 0, 1, 1,
1.188329, 1.364189, 2.330471, 0, 0, 0, 1, 1,
1.195805, -1.381623, 1.579222, 0, 0, 0, 1, 1,
1.206105, -1.193314, 3.861459, 0, 0, 0, 1, 1,
1.206168, -0.04541649, 0.4767395, 0, 0, 0, 1, 1,
1.213757, -0.1632526, 0.2977493, 0, 0, 0, 1, 1,
1.216523, -0.3289978, 4.015925, 0, 0, 0, 1, 1,
1.221049, -1.216096, 1.931447, 1, 1, 1, 1, 1,
1.222203, 1.831046, 0.5066822, 1, 1, 1, 1, 1,
1.229188, -0.07283705, 2.214579, 1, 1, 1, 1, 1,
1.234604, 0.906882, 1.813161, 1, 1, 1, 1, 1,
1.255005, -0.4623626, -0.7651019, 1, 1, 1, 1, 1,
1.257621, -0.5334786, 4.370474, 1, 1, 1, 1, 1,
1.259339, -1.477398, 1.800851, 1, 1, 1, 1, 1,
1.263012, -0.2464159, 0.3601426, 1, 1, 1, 1, 1,
1.265982, 1.53452, 2.693817, 1, 1, 1, 1, 1,
1.277488, 1.270392, 1.11525, 1, 1, 1, 1, 1,
1.286949, 0.4343105, 0.5315924, 1, 1, 1, 1, 1,
1.291024, -0.8416799, 2.13063, 1, 1, 1, 1, 1,
1.291333, 2.922345, 0.02493839, 1, 1, 1, 1, 1,
1.296998, 0.5836983, 2.334902, 1, 1, 1, 1, 1,
1.298039, -0.2465819, 1.61734, 1, 1, 1, 1, 1,
1.315521, -0.2099395, 1.438314, 0, 0, 1, 1, 1,
1.316571, -0.7093927, 3.704193, 1, 0, 0, 1, 1,
1.317791, -0.02067431, 2.132869, 1, 0, 0, 1, 1,
1.324172, -0.5923616, 1.354028, 1, 0, 0, 1, 1,
1.325962, 0.6128599, -0.7547076, 1, 0, 0, 1, 1,
1.338523, 0.7478999, 0.9409086, 1, 0, 0, 1, 1,
1.338949, -0.06816455, 2.479101, 0, 0, 0, 1, 1,
1.34029, -0.836403, 2.889521, 0, 0, 0, 1, 1,
1.344027, -0.7517318, 2.998704, 0, 0, 0, 1, 1,
1.345632, -2.823957, 3.061159, 0, 0, 0, 1, 1,
1.347026, 1.275254, -0.2915195, 0, 0, 0, 1, 1,
1.379043, -0.04846632, 1.642622, 0, 0, 0, 1, 1,
1.38756, -0.5617763, 1.300679, 0, 0, 0, 1, 1,
1.391763, -2.2883, 2.632348, 1, 1, 1, 1, 1,
1.395892, -0.9435839, 2.331505, 1, 1, 1, 1, 1,
1.404875, -0.8743044, 3.890019, 1, 1, 1, 1, 1,
1.407899, -0.02251089, 0.7185709, 1, 1, 1, 1, 1,
1.414699, 0.8113788, 1.377991, 1, 1, 1, 1, 1,
1.415486, 1.233645, -0.221238, 1, 1, 1, 1, 1,
1.417789, -1.282433, 2.428128, 1, 1, 1, 1, 1,
1.423996, -1.063287, 1.771548, 1, 1, 1, 1, 1,
1.430838, 0.8463226, 0.5242774, 1, 1, 1, 1, 1,
1.448627, -0.8814139, 2.937389, 1, 1, 1, 1, 1,
1.469124, 1.159812, 0.1247239, 1, 1, 1, 1, 1,
1.482078, 0.3170333, 0.3117899, 1, 1, 1, 1, 1,
1.494861, -0.6854082, 1.462832, 1, 1, 1, 1, 1,
1.525717, -0.2723585, 3.98332, 1, 1, 1, 1, 1,
1.526392, -1.700357, 2.064646, 1, 1, 1, 1, 1,
1.538314, 0.07295256, 2.159671, 0, 0, 1, 1, 1,
1.544705, -1.301035, 2.42981, 1, 0, 0, 1, 1,
1.548932, 0.8111927, 2.534624, 1, 0, 0, 1, 1,
1.566481, -0.5947, 2.399967, 1, 0, 0, 1, 1,
1.656106, 0.9054664, 1.437213, 1, 0, 0, 1, 1,
1.676316, -0.06863873, 1.262648, 1, 0, 0, 1, 1,
1.683718, 0.3936208, 1.900905, 0, 0, 0, 1, 1,
1.70626, 0.08230756, 1.952542, 0, 0, 0, 1, 1,
1.72475, -0.4254497, 3.712359, 0, 0, 0, 1, 1,
1.736009, -0.6606274, 2.621501, 0, 0, 0, 1, 1,
1.738208, -1.801311, 3.094922, 0, 0, 0, 1, 1,
1.74915, -0.8475754, 1.272753, 0, 0, 0, 1, 1,
1.76309, 0.5815174, 2.352198, 0, 0, 0, 1, 1,
1.773815, 0.8211153, 0.1984426, 1, 1, 1, 1, 1,
1.78938, 1.515933, 1.821571, 1, 1, 1, 1, 1,
1.802781, -0.3570037, 4.844989, 1, 1, 1, 1, 1,
1.840836, 0.9619995, -0.7554995, 1, 1, 1, 1, 1,
1.847617, 0.2098219, 1.029222, 1, 1, 1, 1, 1,
1.856546, 0.3532776, 3.543861, 1, 1, 1, 1, 1,
1.863393, -0.4590585, 0.5271428, 1, 1, 1, 1, 1,
1.866428, -0.5075272, 1.324377, 1, 1, 1, 1, 1,
1.882429, -0.7310759, 1.185271, 1, 1, 1, 1, 1,
1.91462, 1.322753, 0.5645568, 1, 1, 1, 1, 1,
1.930417, 0.3649597, 0.7201787, 1, 1, 1, 1, 1,
1.955738, 0.1388035, 1.224018, 1, 1, 1, 1, 1,
1.960676, -0.9941623, 4.772389, 1, 1, 1, 1, 1,
1.961108, -2.361713, 3.435221, 1, 1, 1, 1, 1,
1.962594, 0.2803123, 1.163189, 1, 1, 1, 1, 1,
1.995042, -0.5650803, 2.483858, 0, 0, 1, 1, 1,
2.006039, -0.7639634, 2.206918, 1, 0, 0, 1, 1,
2.01319, -0.04139797, 3.581751, 1, 0, 0, 1, 1,
2.020616, -0.4936298, 3.041036, 1, 0, 0, 1, 1,
2.020703, -0.4080302, 2.830863, 1, 0, 0, 1, 1,
2.072528, -1.010902, 2.946254, 1, 0, 0, 1, 1,
2.08465, 0.8562178, 0.2790769, 0, 0, 0, 1, 1,
2.101746, -0.7141472, 2.324251, 0, 0, 0, 1, 1,
2.120121, -0.2404551, 2.329568, 0, 0, 0, 1, 1,
2.166567, -0.9061136, 3.247781, 0, 0, 0, 1, 1,
2.195094, 0.5589276, 2.09331, 0, 0, 0, 1, 1,
2.242875, 0.5611187, 1.859835, 0, 0, 0, 1, 1,
2.334149, 1.819118, 0.9917502, 0, 0, 0, 1, 1,
2.347188, 0.607114, 2.430286, 1, 1, 1, 1, 1,
2.358487, -0.4458556, 2.020692, 1, 1, 1, 1, 1,
2.459846, -0.3340935, 0.9803249, 1, 1, 1, 1, 1,
2.462521, 1.10207, 1.006397, 1, 1, 1, 1, 1,
2.491639, 1.106899, 1.580025, 1, 1, 1, 1, 1,
2.787547, -1.925602, 1.411998, 1, 1, 1, 1, 1,
3.417028, 0.465422, 1.164064, 1, 1, 1, 1, 1
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
var radius = 10.08107;
var distance = 35.40932;
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
mvMatrix.translate( -0.2343737, -0.04967809, -0.4544516 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.40932);
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