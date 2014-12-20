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
-3.378725, -0.2284353, -2.548199, 1, 0, 0, 1,
-2.972041, -0.6292667, -1.176018, 1, 0.007843138, 0, 1,
-2.933235, 0.1106228, -1.743307, 1, 0.01176471, 0, 1,
-2.83947, -0.3339822, -0.5582236, 1, 0.01960784, 0, 1,
-2.799588, 0.3530929, -1.277462, 1, 0.02352941, 0, 1,
-2.664677, 0.1736424, -1.595055, 1, 0.03137255, 0, 1,
-2.538605, 1.218563, -0.1880993, 1, 0.03529412, 0, 1,
-2.50946, 2.036596, -0.6308293, 1, 0.04313726, 0, 1,
-2.474605, -0.220915, -3.187366, 1, 0.04705882, 0, 1,
-2.435119, -0.5293526, -3.65902, 1, 0.05490196, 0, 1,
-2.353068, 1.247237, -0.6758291, 1, 0.05882353, 0, 1,
-2.285703, 0.2864359, 0.536586, 1, 0.06666667, 0, 1,
-2.255372, 0.1888264, -0.5710779, 1, 0.07058824, 0, 1,
-2.25083, 1.258358, -3.279534, 1, 0.07843138, 0, 1,
-2.135889, 2.259425, -1.559394, 1, 0.08235294, 0, 1,
-2.079197, -0.3689148, -1.020885, 1, 0.09019608, 0, 1,
-2.04702, -0.6718614, -0.5155282, 1, 0.09411765, 0, 1,
-2.02923, 0.8399909, -0.2550724, 1, 0.1019608, 0, 1,
-2.01553, -0.9414645, -2.465288, 1, 0.1098039, 0, 1,
-1.97373, 0.1634236, -0.833463, 1, 0.1137255, 0, 1,
-1.951826, -2.16305, -3.399309, 1, 0.1215686, 0, 1,
-1.941723, -0.65263, -1.685002, 1, 0.1254902, 0, 1,
-1.927744, 1.723854, -0.6555496, 1, 0.1333333, 0, 1,
-1.911497, 1.007836, -1.177646, 1, 0.1372549, 0, 1,
-1.905467, -1.252787, -3.207533, 1, 0.145098, 0, 1,
-1.901247, 0.06147768, -2.567357, 1, 0.1490196, 0, 1,
-1.848766, -1.351803, -1.650682, 1, 0.1568628, 0, 1,
-1.829405, 0.2791241, -0.6034259, 1, 0.1607843, 0, 1,
-1.825287, -1.02635, -2.88499, 1, 0.1686275, 0, 1,
-1.818494, -0.576057, -1.284122, 1, 0.172549, 0, 1,
-1.807174, -0.07378699, -1.631163, 1, 0.1803922, 0, 1,
-1.80414, 0.7578731, -2.359437, 1, 0.1843137, 0, 1,
-1.774523, -2.345025, -3.324789, 1, 0.1921569, 0, 1,
-1.773798, 0.5064313, -1.64289, 1, 0.1960784, 0, 1,
-1.770312, -0.6790615, -3.53011, 1, 0.2039216, 0, 1,
-1.768385, -1.336493, -2.423693, 1, 0.2117647, 0, 1,
-1.755473, -0.3700292, -1.811243, 1, 0.2156863, 0, 1,
-1.741219, 0.3393908, -1.670015, 1, 0.2235294, 0, 1,
-1.736694, -0.8418725, -2.484083, 1, 0.227451, 0, 1,
-1.72958, 0.08751031, -1.296617, 1, 0.2352941, 0, 1,
-1.728833, 1.803662, -0.8580069, 1, 0.2392157, 0, 1,
-1.727196, -0.01128508, -1.471523, 1, 0.2470588, 0, 1,
-1.726402, 0.9371043, 0.0660485, 1, 0.2509804, 0, 1,
-1.712338, 0.3476905, -2.968618, 1, 0.2588235, 0, 1,
-1.694943, 0.9951087, -0.9656537, 1, 0.2627451, 0, 1,
-1.689472, 1.385886, -0.9777828, 1, 0.2705882, 0, 1,
-1.668183, -0.4664344, -0.2262571, 1, 0.2745098, 0, 1,
-1.662747, 1.122892, -0.7598695, 1, 0.282353, 0, 1,
-1.658958, 0.1588946, -1.027824, 1, 0.2862745, 0, 1,
-1.658798, -0.8335366, -1.465213, 1, 0.2941177, 0, 1,
-1.657293, 0.0988436, -0.4318552, 1, 0.3019608, 0, 1,
-1.63447, 0.5951157, -2.307963, 1, 0.3058824, 0, 1,
-1.624873, -0.3293076, -2.004099, 1, 0.3137255, 0, 1,
-1.624745, -0.1221876, 0.9651085, 1, 0.3176471, 0, 1,
-1.623948, -0.5614073, -3.215058, 1, 0.3254902, 0, 1,
-1.611603, -0.2357585, -2.404772, 1, 0.3294118, 0, 1,
-1.605024, 0.7765695, -1.047637, 1, 0.3372549, 0, 1,
-1.596492, -1.157363, -1.746912, 1, 0.3411765, 0, 1,
-1.590938, 0.1604162, -1.285586, 1, 0.3490196, 0, 1,
-1.585041, 0.3947323, -1.782175, 1, 0.3529412, 0, 1,
-1.573285, -0.825263, -1.966159, 1, 0.3607843, 0, 1,
-1.566896, 0.7359114, -1.604927, 1, 0.3647059, 0, 1,
-1.563684, -0.6324382, -2.743993, 1, 0.372549, 0, 1,
-1.553578, -0.2177897, -1.446762, 1, 0.3764706, 0, 1,
-1.52387, 0.7895831, -1.929499, 1, 0.3843137, 0, 1,
-1.5209, 1.730808, -0.4152255, 1, 0.3882353, 0, 1,
-1.512968, 2.008076, 0.5917327, 1, 0.3960784, 0, 1,
-1.504666, -0.2246563, -1.293533, 1, 0.4039216, 0, 1,
-1.484728, 0.7198624, -0.9614568, 1, 0.4078431, 0, 1,
-1.471302, 0.8977169, -0.3645247, 1, 0.4156863, 0, 1,
-1.471181, 1.422804, 0.5671126, 1, 0.4196078, 0, 1,
-1.465579, 0.783107, -2.673131, 1, 0.427451, 0, 1,
-1.464682, 1.482336, -0.7492182, 1, 0.4313726, 0, 1,
-1.462699, 0.3298993, -1.188415, 1, 0.4392157, 0, 1,
-1.461539, -0.4087702, -1.924938, 1, 0.4431373, 0, 1,
-1.458084, -0.1902692, -2.034636, 1, 0.4509804, 0, 1,
-1.428982, 1.018104, -2.050786, 1, 0.454902, 0, 1,
-1.418395, 0.6193967, 0.1431083, 1, 0.4627451, 0, 1,
-1.416779, -0.7152511, -2.572198, 1, 0.4666667, 0, 1,
-1.413113, -1.729808, -3.979017, 1, 0.4745098, 0, 1,
-1.41204, 0.4646758, 0.2746831, 1, 0.4784314, 0, 1,
-1.390767, -0.3417174, -1.046812, 1, 0.4862745, 0, 1,
-1.383472, 0.07365263, -1.852912, 1, 0.4901961, 0, 1,
-1.377567, 1.341557, 0.1225625, 1, 0.4980392, 0, 1,
-1.375699, -0.7948164, -4.67439, 1, 0.5058824, 0, 1,
-1.362616, -0.5219696, -2.24028, 1, 0.509804, 0, 1,
-1.362345, -1.358023, -2.396134, 1, 0.5176471, 0, 1,
-1.342107, 0.8643926, -2.226077, 1, 0.5215687, 0, 1,
-1.319144, 0.2063484, -3.318796, 1, 0.5294118, 0, 1,
-1.317897, 1.2828, 0.09592558, 1, 0.5333334, 0, 1,
-1.31258, 0.7183372, -0.0584623, 1, 0.5411765, 0, 1,
-1.307009, -1.382167, -1.629963, 1, 0.5450981, 0, 1,
-1.301024, -0.457154, -1.330235, 1, 0.5529412, 0, 1,
-1.294901, -1.109664, -3.740241, 1, 0.5568628, 0, 1,
-1.292496, 0.9180565, -1.309946, 1, 0.5647059, 0, 1,
-1.287969, -1.796874, -3.422937, 1, 0.5686275, 0, 1,
-1.2856, 2.14941, 2.12208, 1, 0.5764706, 0, 1,
-1.270581, 1.030914, -1.471249, 1, 0.5803922, 0, 1,
-1.267268, -1.410638, -2.889819, 1, 0.5882353, 0, 1,
-1.264827, 0.1971137, -2.030396, 1, 0.5921569, 0, 1,
-1.2605, 0.9988021, -1.421083, 1, 0.6, 0, 1,
-1.260038, 0.4395455, -1.588013, 1, 0.6078432, 0, 1,
-1.256307, 0.5666233, -0.6578593, 1, 0.6117647, 0, 1,
-1.248117, 1.785935, -0.5569835, 1, 0.6196079, 0, 1,
-1.243936, 0.8890397, -2.517002, 1, 0.6235294, 0, 1,
-1.231219, 1.721066, -1.952826, 1, 0.6313726, 0, 1,
-1.227648, -0.4617744, -1.900725, 1, 0.6352941, 0, 1,
-1.226693, 0.3214256, 0.3082926, 1, 0.6431373, 0, 1,
-1.224669, -0.7319195, -2.000769, 1, 0.6470588, 0, 1,
-1.223336, 0.3748454, -0.01227722, 1, 0.654902, 0, 1,
-1.221627, -1.252982, -3.064632, 1, 0.6588235, 0, 1,
-1.211954, -1.239507, -3.531259, 1, 0.6666667, 0, 1,
-1.202284, -0.9458207, -0.6113873, 1, 0.6705883, 0, 1,
-1.195196, 0.4931532, -1.124747, 1, 0.6784314, 0, 1,
-1.185357, -0.4765541, -0.6264576, 1, 0.682353, 0, 1,
-1.183638, 0.8432773, -1.584897, 1, 0.6901961, 0, 1,
-1.176447, 0.7926392, -0.3469142, 1, 0.6941177, 0, 1,
-1.175452, -1.665755, -2.231582, 1, 0.7019608, 0, 1,
-1.175105, -0.3280044, -1.190593, 1, 0.7098039, 0, 1,
-1.167051, 2.067877, -0.07546326, 1, 0.7137255, 0, 1,
-1.149262, 0.2827784, -1.738873, 1, 0.7215686, 0, 1,
-1.145518, 0.2170788, -1.091792, 1, 0.7254902, 0, 1,
-1.141283, -1.619845, -3.790687, 1, 0.7333333, 0, 1,
-1.130524, 0.1117708, -3.039172, 1, 0.7372549, 0, 1,
-1.128135, 0.5198184, -1.37624, 1, 0.7450981, 0, 1,
-1.11853, 0.5203834, -0.562925, 1, 0.7490196, 0, 1,
-1.107659, 0.1981637, -1.66505, 1, 0.7568628, 0, 1,
-1.104817, 0.2225986, -0.7345057, 1, 0.7607843, 0, 1,
-1.100947, -0.7999511, -3.723613, 1, 0.7686275, 0, 1,
-1.100258, 1.421092, 2.328292, 1, 0.772549, 0, 1,
-1.097678, -0.1860972, -1.366952, 1, 0.7803922, 0, 1,
-1.07268, -1.115946, -2.848238, 1, 0.7843137, 0, 1,
-1.067586, 0.1701918, -3.474007, 1, 0.7921569, 0, 1,
-1.061114, -1.039091, -2.936406, 1, 0.7960784, 0, 1,
-1.057722, 1.275974, -1.212253, 1, 0.8039216, 0, 1,
-1.047284, -1.232544, -2.498846, 1, 0.8117647, 0, 1,
-1.043339, 1.619025, -0.8606685, 1, 0.8156863, 0, 1,
-1.040424, 1.367078, -0.973415, 1, 0.8235294, 0, 1,
-1.036747, 0.1347103, -1.781437, 1, 0.827451, 0, 1,
-1.034701, -1.048374, -2.659486, 1, 0.8352941, 0, 1,
-1.034616, 1.969483, 0.377339, 1, 0.8392157, 0, 1,
-1.032172, 0.3755638, -1.019841, 1, 0.8470588, 0, 1,
-1.029913, -1.945955, -3.31785, 1, 0.8509804, 0, 1,
-1.027429, 0.8814914, -2.639583, 1, 0.8588235, 0, 1,
-1.021523, 0.2557857, -0.8444777, 1, 0.8627451, 0, 1,
-1.021043, 0.3052241, -0.8143505, 1, 0.8705882, 0, 1,
-1.019929, -0.6410588, -1.417762, 1, 0.8745098, 0, 1,
-1.009972, -0.4204471, -2.267008, 1, 0.8823529, 0, 1,
-1.004279, -1.336734, -2.203056, 1, 0.8862745, 0, 1,
-0.9960139, 1.614593, -1.064492, 1, 0.8941177, 0, 1,
-0.9918717, -0.2192709, -2.984578, 1, 0.8980392, 0, 1,
-0.9899777, -0.1275102, -2.588374, 1, 0.9058824, 0, 1,
-0.980844, -1.010555, -2.559095, 1, 0.9137255, 0, 1,
-0.9617934, 0.4925011, -2.656725, 1, 0.9176471, 0, 1,
-0.959842, -0.260619, -1.456553, 1, 0.9254902, 0, 1,
-0.9591454, -1.938232, -2.220742, 1, 0.9294118, 0, 1,
-0.9589544, -0.3882516, -1.154977, 1, 0.9372549, 0, 1,
-0.9556621, 0.06179437, -1.678329, 1, 0.9411765, 0, 1,
-0.9496739, 0.9545677, -1.041328, 1, 0.9490196, 0, 1,
-0.9451417, -0.2080907, -2.875939, 1, 0.9529412, 0, 1,
-0.9390869, -0.9651638, -1.344937, 1, 0.9607843, 0, 1,
-0.9386128, 0.5906122, -2.220818, 1, 0.9647059, 0, 1,
-0.938334, -0.8714793, -1.869272, 1, 0.972549, 0, 1,
-0.9290314, -0.7959829, -3.599254, 1, 0.9764706, 0, 1,
-0.9261667, 1.554171, 1.52352, 1, 0.9843137, 0, 1,
-0.922842, -0.1860962, -3.890343, 1, 0.9882353, 0, 1,
-0.9214759, -0.9846509, -4.019873, 1, 0.9960784, 0, 1,
-0.9167038, 1.51497, -0.7662632, 0.9960784, 1, 0, 1,
-0.9161879, -0.7725568, -2.976702, 0.9921569, 1, 0, 1,
-0.9155764, 0.6837721, -0.2158935, 0.9843137, 1, 0, 1,
-0.9002305, 0.4390873, -1.274758, 0.9803922, 1, 0, 1,
-0.8967251, -0.5271967, -2.301315, 0.972549, 1, 0, 1,
-0.8949037, -0.8779877, -3.30343, 0.9686275, 1, 0, 1,
-0.8939115, -0.5033175, -0.7888672, 0.9607843, 1, 0, 1,
-0.8867136, 0.1359966, -2.993182, 0.9568627, 1, 0, 1,
-0.8866534, -0.3869598, -1.510345, 0.9490196, 1, 0, 1,
-0.8853395, -0.851339, -1.079192, 0.945098, 1, 0, 1,
-0.879548, 0.3238876, -1.872932, 0.9372549, 1, 0, 1,
-0.8762517, -0.5806931, -0.6665779, 0.9333333, 1, 0, 1,
-0.8748465, 0.1099095, -0.9419788, 0.9254902, 1, 0, 1,
-0.870864, 0.5657296, -2.115668, 0.9215686, 1, 0, 1,
-0.866972, 0.02812136, -2.365514, 0.9137255, 1, 0, 1,
-0.8662936, -0.01399488, -0.7677686, 0.9098039, 1, 0, 1,
-0.8624723, -0.975299, -0.8318281, 0.9019608, 1, 0, 1,
-0.8524715, -0.739355, -2.722519, 0.8941177, 1, 0, 1,
-0.8517243, 0.2464009, -1.717001, 0.8901961, 1, 0, 1,
-0.8391153, 1.383474, -1.267789, 0.8823529, 1, 0, 1,
-0.8352397, 0.6300013, -2.225197, 0.8784314, 1, 0, 1,
-0.8341548, 1.295263, -1.386943, 0.8705882, 1, 0, 1,
-0.832734, 0.5793274, 0.4261448, 0.8666667, 1, 0, 1,
-0.832317, 0.6340736, -0.5611801, 0.8588235, 1, 0, 1,
-0.8211307, -1.402379, -1.624789, 0.854902, 1, 0, 1,
-0.8192579, -0.7923445, -3.907243, 0.8470588, 1, 0, 1,
-0.8179138, 1.493684, 0.1768503, 0.8431373, 1, 0, 1,
-0.8139116, 2.429354, 0.7055213, 0.8352941, 1, 0, 1,
-0.8011228, 0.2347879, -0.784247, 0.8313726, 1, 0, 1,
-0.7993215, 0.7289967, 0.2469118, 0.8235294, 1, 0, 1,
-0.7973387, 0.3114095, -2.986415, 0.8196079, 1, 0, 1,
-0.7951082, -0.2398659, -0.4000279, 0.8117647, 1, 0, 1,
-0.7927461, 0.008834901, -0.2283005, 0.8078431, 1, 0, 1,
-0.7889894, -0.647404, -3.298124, 0.8, 1, 0, 1,
-0.7870425, 0.1492055, -2.260927, 0.7921569, 1, 0, 1,
-0.7863085, 1.607325, -0.4310955, 0.7882353, 1, 0, 1,
-0.7855008, -1.036208, -1.155661, 0.7803922, 1, 0, 1,
-0.7785008, -1.528954, -2.488927, 0.7764706, 1, 0, 1,
-0.7762684, -0.2807553, -0.1549251, 0.7686275, 1, 0, 1,
-0.7706474, 0.3730074, -1.44261, 0.7647059, 1, 0, 1,
-0.7689386, -0.119114, -3.910844, 0.7568628, 1, 0, 1,
-0.7659788, 0.2069562, -1.174466, 0.7529412, 1, 0, 1,
-0.7634229, -0.2434908, -4.149772, 0.7450981, 1, 0, 1,
-0.7615879, -0.4378782, -2.593514, 0.7411765, 1, 0, 1,
-0.7582663, -0.1748209, -2.619185, 0.7333333, 1, 0, 1,
-0.7531025, -0.493974, -3.800957, 0.7294118, 1, 0, 1,
-0.7501962, 0.7241189, -0.2624794, 0.7215686, 1, 0, 1,
-0.7492977, -0.3005049, -2.838032, 0.7176471, 1, 0, 1,
-0.7447492, 0.267309, -2.35252, 0.7098039, 1, 0, 1,
-0.7436009, -0.9845074, -2.07233, 0.7058824, 1, 0, 1,
-0.7425745, -0.08809156, -0.7898683, 0.6980392, 1, 0, 1,
-0.7366135, 0.5515644, -0.7542202, 0.6901961, 1, 0, 1,
-0.7352489, 0.8048915, -0.1430857, 0.6862745, 1, 0, 1,
-0.7301134, -0.4174136, -0.9298139, 0.6784314, 1, 0, 1,
-0.7231618, -0.5789497, -2.317898, 0.6745098, 1, 0, 1,
-0.7155969, 0.9311271, 0.1475377, 0.6666667, 1, 0, 1,
-0.7105554, -0.1495925, -2.258251, 0.6627451, 1, 0, 1,
-0.7087551, -0.7871826, -2.878206, 0.654902, 1, 0, 1,
-0.7071447, -0.4162218, -1.745897, 0.6509804, 1, 0, 1,
-0.7041233, 0.07713664, -0.7957704, 0.6431373, 1, 0, 1,
-0.6995859, -0.2409837, -2.041815, 0.6392157, 1, 0, 1,
-0.6995141, -0.8420893, -0.5239325, 0.6313726, 1, 0, 1,
-0.6920236, 0.6095945, -0.8575447, 0.627451, 1, 0, 1,
-0.6888739, 0.1025239, -2.101571, 0.6196079, 1, 0, 1,
-0.6882985, 0.5218511, -2.151422, 0.6156863, 1, 0, 1,
-0.682062, -0.8847114, -2.971879, 0.6078432, 1, 0, 1,
-0.6810981, 1.486084, -0.6309169, 0.6039216, 1, 0, 1,
-0.6781757, -1.143389, -4.834289, 0.5960785, 1, 0, 1,
-0.6694926, -0.8087994, -1.343785, 0.5882353, 1, 0, 1,
-0.6693541, 1.049986, -0.4503222, 0.5843138, 1, 0, 1,
-0.6668623, -0.4547549, -3.27273, 0.5764706, 1, 0, 1,
-0.6617392, -2.118244, -0.5298266, 0.572549, 1, 0, 1,
-0.6572316, -1.564589, -3.187318, 0.5647059, 1, 0, 1,
-0.6513302, 1.021921, 0.2898505, 0.5607843, 1, 0, 1,
-0.6489252, -2.69586, -2.27158, 0.5529412, 1, 0, 1,
-0.6462929, -1.05797, -3.996184, 0.5490196, 1, 0, 1,
-0.6416666, 0.4708512, -2.292253, 0.5411765, 1, 0, 1,
-0.6408209, -1.981661, -2.658869, 0.5372549, 1, 0, 1,
-0.640368, 0.02781036, -2.196656, 0.5294118, 1, 0, 1,
-0.6356326, 0.5396992, -0.8122201, 0.5254902, 1, 0, 1,
-0.6274472, -0.1119547, -3.772868, 0.5176471, 1, 0, 1,
-0.625495, 0.744538, 0.1040528, 0.5137255, 1, 0, 1,
-0.6239647, -1.02944, -1.566608, 0.5058824, 1, 0, 1,
-0.6236885, -0.1040738, -2.917973, 0.5019608, 1, 0, 1,
-0.6083484, -0.2093945, -0.5355976, 0.4941176, 1, 0, 1,
-0.6076674, -0.6194989, -1.093892, 0.4862745, 1, 0, 1,
-0.6055818, -0.329948, -1.538541, 0.4823529, 1, 0, 1,
-0.602692, 2.443128, -1.324576, 0.4745098, 1, 0, 1,
-0.5989861, -0.8847121, -2.604509, 0.4705882, 1, 0, 1,
-0.5984766, -0.6512792, -2.348226, 0.4627451, 1, 0, 1,
-0.5970675, 0.310939, -2.291959, 0.4588235, 1, 0, 1,
-0.5901609, 1.701158, -2.638924, 0.4509804, 1, 0, 1,
-0.5882624, -0.9916393, -3.609764, 0.4470588, 1, 0, 1,
-0.5877351, -1.366634, -3.324618, 0.4392157, 1, 0, 1,
-0.5874361, -0.7622662, -5.26959, 0.4352941, 1, 0, 1,
-0.5866985, -2.229415, -3.739901, 0.427451, 1, 0, 1,
-0.5837107, -1.682952, -2.537674, 0.4235294, 1, 0, 1,
-0.5816681, 0.6607634, -0.5092915, 0.4156863, 1, 0, 1,
-0.5792905, -1.268957, -2.895292, 0.4117647, 1, 0, 1,
-0.5792427, 0.4008812, -0.6903226, 0.4039216, 1, 0, 1,
-0.5757806, -0.08401014, -1.130964, 0.3960784, 1, 0, 1,
-0.5746406, 0.5678554, -2.903986, 0.3921569, 1, 0, 1,
-0.5739366, -0.5214567, -0.8568299, 0.3843137, 1, 0, 1,
-0.570322, -0.2604063, -0.2458099, 0.3803922, 1, 0, 1,
-0.5639849, -0.3218671, -1.888399, 0.372549, 1, 0, 1,
-0.5606341, -0.9751453, -1.841064, 0.3686275, 1, 0, 1,
-0.5602147, 0.1787839, -3.520995, 0.3607843, 1, 0, 1,
-0.5588766, -0.0741841, -2.179515, 0.3568628, 1, 0, 1,
-0.5571533, 1.110003, -1.604408, 0.3490196, 1, 0, 1,
-0.5536594, -2.262715, -1.358486, 0.345098, 1, 0, 1,
-0.5443491, -0.1225634, -0.5651938, 0.3372549, 1, 0, 1,
-0.5386584, 0.01182304, -0.9895104, 0.3333333, 1, 0, 1,
-0.5386492, 1.31565, -0.05942928, 0.3254902, 1, 0, 1,
-0.5371895, 1.880354, -1.48789, 0.3215686, 1, 0, 1,
-0.533335, -0.5054885, -2.907825, 0.3137255, 1, 0, 1,
-0.5328795, 0.5727758, -1.289782, 0.3098039, 1, 0, 1,
-0.5302225, -0.01582423, -1.933946, 0.3019608, 1, 0, 1,
-0.5279728, -1.433787, -3.209625, 0.2941177, 1, 0, 1,
-0.5276555, 1.507064, -1.074203, 0.2901961, 1, 0, 1,
-0.5275758, 0.6363832, 1.271772, 0.282353, 1, 0, 1,
-0.5253798, -0.8261532, -3.025565, 0.2784314, 1, 0, 1,
-0.5250305, -0.05681064, -2.45087, 0.2705882, 1, 0, 1,
-0.5249844, -0.1363284, 1.049076, 0.2666667, 1, 0, 1,
-0.5246085, -0.1960237, -0.9626806, 0.2588235, 1, 0, 1,
-0.523784, 0.5565667, -1.224021, 0.254902, 1, 0, 1,
-0.5229297, -0.8993244, -1.200945, 0.2470588, 1, 0, 1,
-0.5190146, 0.3292443, 0.1820222, 0.2431373, 1, 0, 1,
-0.5172097, -0.5755948, -3.245525, 0.2352941, 1, 0, 1,
-0.5162311, -0.4625068, -1.502577, 0.2313726, 1, 0, 1,
-0.5135974, -0.5967025, -1.713174, 0.2235294, 1, 0, 1,
-0.5127599, 0.5033671, -1.985324, 0.2196078, 1, 0, 1,
-0.5108365, 0.2382773, -0.8539956, 0.2117647, 1, 0, 1,
-0.5092739, 0.2682065, -0.01909469, 0.2078431, 1, 0, 1,
-0.5086191, 0.7652385, 0.9853443, 0.2, 1, 0, 1,
-0.5081651, 1.153008, -0.4549851, 0.1921569, 1, 0, 1,
-0.4974634, 0.7705266, -0.9385925, 0.1882353, 1, 0, 1,
-0.4936105, -0.07558877, -1.645766, 0.1803922, 1, 0, 1,
-0.4904105, 0.5562173, -1.634796, 0.1764706, 1, 0, 1,
-0.4857138, 1.428849, -1.407804, 0.1686275, 1, 0, 1,
-0.4856069, 0.8990651, 0.4141333, 0.1647059, 1, 0, 1,
-0.4844674, -0.4880182, -1.843059, 0.1568628, 1, 0, 1,
-0.4821236, -0.8667011, -3.623672, 0.1529412, 1, 0, 1,
-0.4755193, 0.6572724, -1.143867, 0.145098, 1, 0, 1,
-0.4750552, -0.1399827, -1.735141, 0.1411765, 1, 0, 1,
-0.4746902, 0.7378217, 0.5265099, 0.1333333, 1, 0, 1,
-0.470401, 0.04819191, -1.945815, 0.1294118, 1, 0, 1,
-0.4678088, 0.8205712, 0.8945519, 0.1215686, 1, 0, 1,
-0.4629619, -1.804455, -3.274059, 0.1176471, 1, 0, 1,
-0.46089, -0.3319679, -2.726075, 0.1098039, 1, 0, 1,
-0.4578358, 2.151465, -0.6648107, 0.1058824, 1, 0, 1,
-0.4573956, -0.06673083, -2.462067, 0.09803922, 1, 0, 1,
-0.4560928, -0.1228805, -2.722944, 0.09019608, 1, 0, 1,
-0.4508569, -1.160999, -2.051827, 0.08627451, 1, 0, 1,
-0.4494425, -0.9043416, -3.725034, 0.07843138, 1, 0, 1,
-0.4475306, -2.42248, -1.757889, 0.07450981, 1, 0, 1,
-0.4461914, 0.1268333, -1.395561, 0.06666667, 1, 0, 1,
-0.4460599, -0.7493801, -2.121837, 0.0627451, 1, 0, 1,
-0.4435875, 1.440271, -0.3598863, 0.05490196, 1, 0, 1,
-0.4417609, 2.143835, -0.5379868, 0.05098039, 1, 0, 1,
-0.4331302, -0.8471869, -3.073888, 0.04313726, 1, 0, 1,
-0.4319447, 0.6692719, -0.09978104, 0.03921569, 1, 0, 1,
-0.4312918, -0.1312455, -2.442087, 0.03137255, 1, 0, 1,
-0.4290951, 0.2622005, -1.62006, 0.02745098, 1, 0, 1,
-0.4264605, 2.247265, -0.3818476, 0.01960784, 1, 0, 1,
-0.4260638, -0.1177632, -1.186948, 0.01568628, 1, 0, 1,
-0.424944, 1.39119, 0.06643298, 0.007843138, 1, 0, 1,
-0.4249337, 1.289498, -1.313724, 0.003921569, 1, 0, 1,
-0.4128979, -1.562049, -2.983046, 0, 1, 0.003921569, 1,
-0.4112737, 0.5303619, -1.10173, 0, 1, 0.01176471, 1,
-0.4022385, 0.7933728, -0.2020667, 0, 1, 0.01568628, 1,
-0.4019991, -0.6718138, -2.152467, 0, 1, 0.02352941, 1,
-0.3992668, 0.06583817, -2.797297, 0, 1, 0.02745098, 1,
-0.3960905, -1.319008, -2.084602, 0, 1, 0.03529412, 1,
-0.3949067, -0.3384068, -0.06297615, 0, 1, 0.03921569, 1,
-0.3943933, -1.08499, -2.161189, 0, 1, 0.04705882, 1,
-0.3857565, 0.8314051, -1.693869, 0, 1, 0.05098039, 1,
-0.3852066, 0.2599361, -1.272035, 0, 1, 0.05882353, 1,
-0.3752861, -0.07734809, -2.120921, 0, 1, 0.0627451, 1,
-0.3748721, 1.01272, -0.526977, 0, 1, 0.07058824, 1,
-0.372301, 0.1080779, -1.892376, 0, 1, 0.07450981, 1,
-0.3721076, -1.621575, -2.506288, 0, 1, 0.08235294, 1,
-0.3685176, -0.2536309, -2.661389, 0, 1, 0.08627451, 1,
-0.3658468, 1.155284, -0.9171633, 0, 1, 0.09411765, 1,
-0.3630445, 0.08934968, -2.508236, 0, 1, 0.1019608, 1,
-0.3621882, -0.4338463, -2.682674, 0, 1, 0.1058824, 1,
-0.3613619, -0.786991, -2.704575, 0, 1, 0.1137255, 1,
-0.3542943, 0.6501148, -0.4255031, 0, 1, 0.1176471, 1,
-0.3520818, -0.8725449, -2.912012, 0, 1, 0.1254902, 1,
-0.3512456, 1.77019, -0.6001833, 0, 1, 0.1294118, 1,
-0.3412637, -1.997551, -2.500112, 0, 1, 0.1372549, 1,
-0.3403026, 1.383659, 0.02946007, 0, 1, 0.1411765, 1,
-0.3401691, 1.507133, 1.238888, 0, 1, 0.1490196, 1,
-0.3392903, -1.038289, -1.944696, 0, 1, 0.1529412, 1,
-0.329907, -2.633454, -3.039271, 0, 1, 0.1607843, 1,
-0.3286005, 0.1469948, -0.7676631, 0, 1, 0.1647059, 1,
-0.3283459, -0.6437523, -2.227761, 0, 1, 0.172549, 1,
-0.3248862, 0.1419698, -0.8024611, 0, 1, 0.1764706, 1,
-0.3221265, -0.08897614, -2.723925, 0, 1, 0.1843137, 1,
-0.3209015, 0.261397, 0.2369308, 0, 1, 0.1882353, 1,
-0.3202331, -0.6590772, -1.29656, 0, 1, 0.1960784, 1,
-0.319269, 0.8699522, 0.3071613, 0, 1, 0.2039216, 1,
-0.3170042, -1.086009, -1.878998, 0, 1, 0.2078431, 1,
-0.3148683, 0.7607902, -0.0062469, 0, 1, 0.2156863, 1,
-0.3105088, 0.2326591, -0.4801095, 0, 1, 0.2196078, 1,
-0.3083171, -0.009583952, -2.066211, 0, 1, 0.227451, 1,
-0.3060034, -1.595926, -3.116381, 0, 1, 0.2313726, 1,
-0.3015505, 1.508063, -1.252034, 0, 1, 0.2392157, 1,
-0.2957744, -1.815766, -2.743609, 0, 1, 0.2431373, 1,
-0.2905504, 0.1372836, -2.891195, 0, 1, 0.2509804, 1,
-0.2902642, -0.2353582, -3.49634, 0, 1, 0.254902, 1,
-0.2893183, 0.5704079, -0.4393967, 0, 1, 0.2627451, 1,
-0.2874831, 0.6215653, -0.389782, 0, 1, 0.2666667, 1,
-0.284828, -1.11725, -5.215076, 0, 1, 0.2745098, 1,
-0.2815633, -0.8817197, -3.226846, 0, 1, 0.2784314, 1,
-0.278608, -0.7888294, -4.384654, 0, 1, 0.2862745, 1,
-0.2763684, -0.7721, -2.301259, 0, 1, 0.2901961, 1,
-0.2745685, -1.094723, -3.46, 0, 1, 0.2980392, 1,
-0.2700761, -0.9606284, -2.776233, 0, 1, 0.3058824, 1,
-0.2694098, -0.5455819, -3.262097, 0, 1, 0.3098039, 1,
-0.2680925, -0.7167005, -3.567089, 0, 1, 0.3176471, 1,
-0.2673057, -2.217992, -4.626911, 0, 1, 0.3215686, 1,
-0.2658552, 0.6197092, -0.2578654, 0, 1, 0.3294118, 1,
-0.2658043, 0.1139574, -2.012327, 0, 1, 0.3333333, 1,
-0.2596067, 0.133002, -0.6130587, 0, 1, 0.3411765, 1,
-0.2569448, 1.462298, -1.010887, 0, 1, 0.345098, 1,
-0.2557156, -0.68963, -2.695373, 0, 1, 0.3529412, 1,
-0.2555709, 0.7378828, 0.494743, 0, 1, 0.3568628, 1,
-0.2518119, -0.4662158, -1.852763, 0, 1, 0.3647059, 1,
-0.2496761, -1.062916, -2.902947, 0, 1, 0.3686275, 1,
-0.2486332, -0.6715886, -3.091456, 0, 1, 0.3764706, 1,
-0.2472062, 1.054313, -1.340446, 0, 1, 0.3803922, 1,
-0.2458722, 1.378209, -0.8782405, 0, 1, 0.3882353, 1,
-0.2455062, 0.2570338, -1.505699, 0, 1, 0.3921569, 1,
-0.2436198, -1.055511, -4.147154, 0, 1, 0.4, 1,
-0.2420221, -0.5489414, -3.369486, 0, 1, 0.4078431, 1,
-0.242002, 1.186005, 1.83614, 0, 1, 0.4117647, 1,
-0.2382898, -0.3852287, -0.8148357, 0, 1, 0.4196078, 1,
-0.2362435, 0.4571754, 0.6130541, 0, 1, 0.4235294, 1,
-0.2331866, 0.1522845, -2.500759, 0, 1, 0.4313726, 1,
-0.2321116, 0.563056, 0.3361945, 0, 1, 0.4352941, 1,
-0.2316455, 1.53082, 1.428907, 0, 1, 0.4431373, 1,
-0.2304071, 0.878864, 0.03725095, 0, 1, 0.4470588, 1,
-0.2261568, -0.5041074, -2.059494, 0, 1, 0.454902, 1,
-0.2258522, -1.101043, -2.129656, 0, 1, 0.4588235, 1,
-0.2232229, 0.7777767, 0.8330507, 0, 1, 0.4666667, 1,
-0.2223956, -1.300568, -1.99876, 0, 1, 0.4705882, 1,
-0.221472, -1.662623, -2.984799, 0, 1, 0.4784314, 1,
-0.2110268, 0.7999156, -0.5136179, 0, 1, 0.4823529, 1,
-0.2046479, 1.714761, 0.35237, 0, 1, 0.4901961, 1,
-0.2025775, -0.3480896, -1.847877, 0, 1, 0.4941176, 1,
-0.2011323, 1.85937, 0.5176758, 0, 1, 0.5019608, 1,
-0.2007189, 0.3181417, -1.153023, 0, 1, 0.509804, 1,
-0.1998941, 0.5080399, -1.172078, 0, 1, 0.5137255, 1,
-0.1996824, 0.9022763, 1.420957, 0, 1, 0.5215687, 1,
-0.1970572, -0.8417952, -2.9704, 0, 1, 0.5254902, 1,
-0.1949943, 0.4615957, -0.5271344, 0, 1, 0.5333334, 1,
-0.1926863, -0.03894563, -1.675815, 0, 1, 0.5372549, 1,
-0.1915744, -0.8487465, -5.01312, 0, 1, 0.5450981, 1,
-0.1907827, 0.9463893, 0.6988425, 0, 1, 0.5490196, 1,
-0.1893841, -1.363327, -2.872732, 0, 1, 0.5568628, 1,
-0.1844853, 0.671908, -0.4186108, 0, 1, 0.5607843, 1,
-0.1805316, 0.7771168, -0.7201407, 0, 1, 0.5686275, 1,
-0.1794727, -1.224283, -3.762213, 0, 1, 0.572549, 1,
-0.1785607, 0.3717749, -3.092976, 0, 1, 0.5803922, 1,
-0.1750144, -1.39618, -2.940042, 0, 1, 0.5843138, 1,
-0.1733073, -0.318213, -2.66883, 0, 1, 0.5921569, 1,
-0.1724432, 0.7458875, -1.532341, 0, 1, 0.5960785, 1,
-0.170267, 0.4947523, -0.3343078, 0, 1, 0.6039216, 1,
-0.1689467, -0.6855792, -1.837771, 0, 1, 0.6117647, 1,
-0.1681702, -1.052848, -2.334629, 0, 1, 0.6156863, 1,
-0.166521, -0.2213487, -2.369545, 0, 1, 0.6235294, 1,
-0.1635991, 0.4815615, 2.239188, 0, 1, 0.627451, 1,
-0.1609882, -1.345206, -1.704923, 0, 1, 0.6352941, 1,
-0.1603205, -1.6243, -2.045746, 0, 1, 0.6392157, 1,
-0.1595336, -0.3499811, -1.79059, 0, 1, 0.6470588, 1,
-0.1581173, 0.5919828, -0.02749093, 0, 1, 0.6509804, 1,
-0.1568875, 0.3826785, -1.221343, 0, 1, 0.6588235, 1,
-0.1559877, -1.441308, -2.991786, 0, 1, 0.6627451, 1,
-0.1552916, 1.503098, 0.6352998, 0, 1, 0.6705883, 1,
-0.1486656, 1.045371, -1.232078, 0, 1, 0.6745098, 1,
-0.1472991, -0.6634211, -3.260836, 0, 1, 0.682353, 1,
-0.1450153, -0.2013621, -1.449609, 0, 1, 0.6862745, 1,
-0.1437218, -1.364411, -3.444099, 0, 1, 0.6941177, 1,
-0.1403634, 0.4784605, -1.108073, 0, 1, 0.7019608, 1,
-0.1356107, 0.1413503, -2.072169, 0, 1, 0.7058824, 1,
-0.1354464, -0.5480117, -1.494217, 0, 1, 0.7137255, 1,
-0.1351646, 1.476639, -0.4014553, 0, 1, 0.7176471, 1,
-0.1304691, -0.3921449, -3.205464, 0, 1, 0.7254902, 1,
-0.1292577, -1.481427, -3.009585, 0, 1, 0.7294118, 1,
-0.1256195, -1.475925, -2.782575, 0, 1, 0.7372549, 1,
-0.121783, 1.727644, 2.68635, 0, 1, 0.7411765, 1,
-0.1098996, 0.8465533, -0.5964714, 0, 1, 0.7490196, 1,
-0.1094719, -0.06580799, -3.782045, 0, 1, 0.7529412, 1,
-0.1071124, -0.8439758, -2.592882, 0, 1, 0.7607843, 1,
-0.103886, 0.07211136, -2.863027, 0, 1, 0.7647059, 1,
-0.1009676, 0.3954251, -0.3380715, 0, 1, 0.772549, 1,
-0.09744631, 1.924513, -1.905049, 0, 1, 0.7764706, 1,
-0.09368099, -0.6628584, -3.199712, 0, 1, 0.7843137, 1,
-0.09095982, 1.462222, 0.315102, 0, 1, 0.7882353, 1,
-0.09081616, 0.4117598, -0.5170354, 0, 1, 0.7960784, 1,
-0.08933702, -0.2642584, -3.161127, 0, 1, 0.8039216, 1,
-0.08448761, 0.6689547, 2.261718, 0, 1, 0.8078431, 1,
-0.08291368, 0.008542572, -0.9989388, 0, 1, 0.8156863, 1,
-0.08254416, -0.5073782, -1.44073, 0, 1, 0.8196079, 1,
-0.08192606, -1.331717, -4.450565, 0, 1, 0.827451, 1,
-0.08114517, 1.282153, -0.1327428, 0, 1, 0.8313726, 1,
-0.08043813, -0.0941069, -2.061755, 0, 1, 0.8392157, 1,
-0.08042835, 1.791067, -2.012573, 0, 1, 0.8431373, 1,
-0.07938089, 1.764279, -0.3470987, 0, 1, 0.8509804, 1,
-0.07810729, 0.2584694, -0.04232995, 0, 1, 0.854902, 1,
-0.07252284, -0.7295884, -0.8715178, 0, 1, 0.8627451, 1,
-0.07137045, 1.816249, 0.3854429, 0, 1, 0.8666667, 1,
-0.06869934, 1.72035, -0.1644848, 0, 1, 0.8745098, 1,
-0.06830504, -0.9087914, -3.159827, 0, 1, 0.8784314, 1,
-0.06696972, -1.640955, -2.265105, 0, 1, 0.8862745, 1,
-0.06283002, 0.6066227, -0.7018863, 0, 1, 0.8901961, 1,
-0.06088381, -0.1835793, -3.723361, 0, 1, 0.8980392, 1,
-0.06086089, -0.8717189, -3.20838, 0, 1, 0.9058824, 1,
-0.06059727, -0.3308456, -3.32901, 0, 1, 0.9098039, 1,
-0.05713073, 0.6181925, -0.429746, 0, 1, 0.9176471, 1,
-0.05679739, -0.02521917, -5.194438, 0, 1, 0.9215686, 1,
-0.04950503, 0.7785413, 0.3217018, 0, 1, 0.9294118, 1,
-0.03594839, 0.8750297, 1.701821, 0, 1, 0.9333333, 1,
-0.02945998, 0.4786324, 0.402769, 0, 1, 0.9411765, 1,
-0.02900915, -0.3391735, -2.609066, 0, 1, 0.945098, 1,
-0.02447138, -0.1534149, -3.905071, 0, 1, 0.9529412, 1,
-0.02311637, -0.3951136, -2.851012, 0, 1, 0.9568627, 1,
-0.0199193, -1.416722, -4.14489, 0, 1, 0.9647059, 1,
-0.01988913, -0.5625706, -2.990889, 0, 1, 0.9686275, 1,
-0.01656352, 0.7339705, 1.389887, 0, 1, 0.9764706, 1,
-0.008535493, 0.07574461, -0.8592989, 0, 1, 0.9803922, 1,
-0.007404345, 0.5420147, -0.4388793, 0, 1, 0.9882353, 1,
-0.000275502, -2.629659, -2.948589, 0, 1, 0.9921569, 1,
0.003423169, -0.6479546, 1.366035, 0, 1, 1, 1,
0.003483227, 0.8505582, 0.6895494, 0, 0.9921569, 1, 1,
0.006569612, 0.3180715, 0.8483954, 0, 0.9882353, 1, 1,
0.007612577, 1.593675, 0.8083123, 0, 0.9803922, 1, 1,
0.008711159, -1.240388, 2.525168, 0, 0.9764706, 1, 1,
0.01150584, -0.7194862, 3.689677, 0, 0.9686275, 1, 1,
0.02887975, 0.8742845, 1.909828, 0, 0.9647059, 1, 1,
0.03133827, -1.208772, 5.473068, 0, 0.9568627, 1, 1,
0.03441421, 0.2403068, 1.91923, 0, 0.9529412, 1, 1,
0.03891288, -0.8140145, 3.878351, 0, 0.945098, 1, 1,
0.04059802, 1.158232, 1.356099, 0, 0.9411765, 1, 1,
0.04100311, 2.541348, -0.6886044, 0, 0.9333333, 1, 1,
0.04794846, -0.9832193, 3.041583, 0, 0.9294118, 1, 1,
0.05061176, -1.385107, 4.689352, 0, 0.9215686, 1, 1,
0.0510794, -0.6342302, 2.431635, 0, 0.9176471, 1, 1,
0.05145648, -2.546968, 2.858329, 0, 0.9098039, 1, 1,
0.05171754, 0.6898302, -1.120466, 0, 0.9058824, 1, 1,
0.05428295, 0.8924673, 0.2381587, 0, 0.8980392, 1, 1,
0.05706977, 0.6794184, -0.6148285, 0, 0.8901961, 1, 1,
0.05911386, 0.4477057, 0.3039222, 0, 0.8862745, 1, 1,
0.061837, -1.431943, 2.451829, 0, 0.8784314, 1, 1,
0.06263186, -0.6768464, 2.589074, 0, 0.8745098, 1, 1,
0.07308952, -0.5305924, 3.157781, 0, 0.8666667, 1, 1,
0.07969032, 0.2091293, 0.5447024, 0, 0.8627451, 1, 1,
0.07978992, -0.2811305, 2.559849, 0, 0.854902, 1, 1,
0.08099517, -0.7489375, 4.133279, 0, 0.8509804, 1, 1,
0.08337636, -0.8382824, 2.952853, 0, 0.8431373, 1, 1,
0.08699214, 0.6366535, 0.9696463, 0, 0.8392157, 1, 1,
0.08757156, -0.2748732, 3.595321, 0, 0.8313726, 1, 1,
0.08843974, 0.7012088, -0.8453593, 0, 0.827451, 1, 1,
0.09163935, 0.5163751, 0.5324509, 0, 0.8196079, 1, 1,
0.09402054, 1.228979, -0.1799481, 0, 0.8156863, 1, 1,
0.09571461, -0.9439563, 1.444869, 0, 0.8078431, 1, 1,
0.09641594, 0.5969803, 1.08076, 0, 0.8039216, 1, 1,
0.09752049, 0.7801943, 1.721144, 0, 0.7960784, 1, 1,
0.09777426, 0.6551057, 0.9703074, 0, 0.7882353, 1, 1,
0.09935274, 2.518969, 0.3123385, 0, 0.7843137, 1, 1,
0.09962999, 0.7141932, -0.9746349, 0, 0.7764706, 1, 1,
0.1024082, 0.3953242, -0.7514208, 0, 0.772549, 1, 1,
0.1055469, -0.1197423, 3.088531, 0, 0.7647059, 1, 1,
0.1058246, 0.8454354, 0.7504476, 0, 0.7607843, 1, 1,
0.1065362, 1.075526, 0.0578028, 0, 0.7529412, 1, 1,
0.1075745, 0.07769282, 0.5759909, 0, 0.7490196, 1, 1,
0.1085788, 2.328038, 1.361507, 0, 0.7411765, 1, 1,
0.1142521, -0.3190475, 3.05539, 0, 0.7372549, 1, 1,
0.1174281, 0.344005, 0.7389071, 0, 0.7294118, 1, 1,
0.12071, 0.573586, 0.9398822, 0, 0.7254902, 1, 1,
0.1212865, 1.24691, 1.006617, 0, 0.7176471, 1, 1,
0.1226824, -0.01744927, 1.078123, 0, 0.7137255, 1, 1,
0.1236312, 1.622484, -0.08381236, 0, 0.7058824, 1, 1,
0.1252791, -0.8330927, 4.395172, 0, 0.6980392, 1, 1,
0.1282807, -0.7740343, 1.610695, 0, 0.6941177, 1, 1,
0.1296667, 0.658518, -0.8468576, 0, 0.6862745, 1, 1,
0.1316981, 0.09336568, 0.2364464, 0, 0.682353, 1, 1,
0.1323379, 0.3650779, 1.285669, 0, 0.6745098, 1, 1,
0.1327273, -1.532949, 3.379467, 0, 0.6705883, 1, 1,
0.1331509, -2.578766, 3.52872, 0, 0.6627451, 1, 1,
0.1343856, 0.9252916, -0.07681165, 0, 0.6588235, 1, 1,
0.1353485, -0.3945626, 1.691046, 0, 0.6509804, 1, 1,
0.1356621, 1.743606, 0.470738, 0, 0.6470588, 1, 1,
0.1378686, -1.120196, 3.011257, 0, 0.6392157, 1, 1,
0.1395606, 0.7968004, -0.009292819, 0, 0.6352941, 1, 1,
0.1428353, -0.9481235, 1.987739, 0, 0.627451, 1, 1,
0.1442152, 0.5740491, 1.117264, 0, 0.6235294, 1, 1,
0.1445858, -0.06333779, 2.452856, 0, 0.6156863, 1, 1,
0.1446348, 0.3766055, 0.5605005, 0, 0.6117647, 1, 1,
0.1484172, 1.683609, 0.2739547, 0, 0.6039216, 1, 1,
0.1488732, 1.369515, -1.574244, 0, 0.5960785, 1, 1,
0.1508169, 0.03208676, 0.9287978, 0, 0.5921569, 1, 1,
0.1510854, -1.697993, 1.922832, 0, 0.5843138, 1, 1,
0.1530979, 1.598062, 0.9846229, 0, 0.5803922, 1, 1,
0.1546857, -0.6667857, 2.928028, 0, 0.572549, 1, 1,
0.1564794, -1.057202, 2.514544, 0, 0.5686275, 1, 1,
0.156603, 0.2151851, -0.4391378, 0, 0.5607843, 1, 1,
0.1594272, 0.6117349, 1.176525, 0, 0.5568628, 1, 1,
0.1619736, -0.2254375, 3.371743, 0, 0.5490196, 1, 1,
0.1646532, -0.1055365, 2.284576, 0, 0.5450981, 1, 1,
0.1679553, 0.8346851, -0.4737329, 0, 0.5372549, 1, 1,
0.1718776, 0.9259458, 0.05604428, 0, 0.5333334, 1, 1,
0.1723622, -1.362479, 1.393662, 0, 0.5254902, 1, 1,
0.1786183, -0.2157701, 4.861174, 0, 0.5215687, 1, 1,
0.1791267, 0.6735271, 0.8164799, 0, 0.5137255, 1, 1,
0.1800494, -0.6095502, 2.244201, 0, 0.509804, 1, 1,
0.1882607, 1.461261, -1.465707, 0, 0.5019608, 1, 1,
0.1901835, 1.422352, 0.06037876, 0, 0.4941176, 1, 1,
0.19122, 0.3211823, -0.315749, 0, 0.4901961, 1, 1,
0.1919563, -2.478907, 4.045661, 0, 0.4823529, 1, 1,
0.1936361, 0.8568726, 0.9599369, 0, 0.4784314, 1, 1,
0.1992226, -1.201299, 2.690548, 0, 0.4705882, 1, 1,
0.1994246, 0.1492155, 0.3441115, 0, 0.4666667, 1, 1,
0.204195, -0.3349694, 1.969742, 0, 0.4588235, 1, 1,
0.2073123, 1.037167, 1.545926, 0, 0.454902, 1, 1,
0.2082043, -0.1509717, 3.639735, 0, 0.4470588, 1, 1,
0.2099753, -0.0001806297, 2.509618, 0, 0.4431373, 1, 1,
0.218064, -0.4170348, 3.556767, 0, 0.4352941, 1, 1,
0.2235699, -0.5356532, 3.051123, 0, 0.4313726, 1, 1,
0.2237806, -0.5022415, 2.332293, 0, 0.4235294, 1, 1,
0.2244624, 0.2178934, 2.39939, 0, 0.4196078, 1, 1,
0.2271414, 1.09069, -0.7244343, 0, 0.4117647, 1, 1,
0.2272521, 0.5378089, 0.191983, 0, 0.4078431, 1, 1,
0.228156, -1.075959, 0.5756837, 0, 0.4, 1, 1,
0.2291775, -0.8419233, 3.480507, 0, 0.3921569, 1, 1,
0.2308928, 1.645698, 0.4824836, 0, 0.3882353, 1, 1,
0.235587, 0.7113577, 0.3341288, 0, 0.3803922, 1, 1,
0.2396233, 0.5484473, -0.3527344, 0, 0.3764706, 1, 1,
0.239746, 1.681096, -1.226688, 0, 0.3686275, 1, 1,
0.2401668, 0.7964692, 0.6050391, 0, 0.3647059, 1, 1,
0.2448841, 0.2674213, 0.550672, 0, 0.3568628, 1, 1,
0.2456597, -0.350992, 3.625671, 0, 0.3529412, 1, 1,
0.2473117, -0.4014736, 4.292367, 0, 0.345098, 1, 1,
0.2503421, 0.4821007, 1.682244, 0, 0.3411765, 1, 1,
0.2531404, -0.6475706, 2.77524, 0, 0.3333333, 1, 1,
0.2608566, -0.84476, 3.677074, 0, 0.3294118, 1, 1,
0.266497, 1.110503, 0.8193721, 0, 0.3215686, 1, 1,
0.2693407, -0.8040571, 1.778701, 0, 0.3176471, 1, 1,
0.272682, -0.003570272, 0.008402995, 0, 0.3098039, 1, 1,
0.2746723, 1.259893, -0.8148487, 0, 0.3058824, 1, 1,
0.2756408, 0.3875172, -1.302151, 0, 0.2980392, 1, 1,
0.278685, 0.1563668, 0.5454124, 0, 0.2901961, 1, 1,
0.2868091, 1.354888, 0.3995562, 0, 0.2862745, 1, 1,
0.2903878, -0.2611077, 2.573751, 0, 0.2784314, 1, 1,
0.2905916, -0.009449594, 0.510294, 0, 0.2745098, 1, 1,
0.2950058, -0.1765768, 4.437243, 0, 0.2666667, 1, 1,
0.2991831, 1.150278, -0.4602104, 0, 0.2627451, 1, 1,
0.3011301, -1.004964, 4.501335, 0, 0.254902, 1, 1,
0.3016471, 0.1926021, 2.26453, 0, 0.2509804, 1, 1,
0.3023396, 0.4989884, -0.4761645, 0, 0.2431373, 1, 1,
0.3044408, -0.1755943, 2.024375, 0, 0.2392157, 1, 1,
0.3062216, 1.442444, 0.4101456, 0, 0.2313726, 1, 1,
0.3067925, 0.1163702, -0.6688155, 0, 0.227451, 1, 1,
0.3189299, -0.7695419, 1.673201, 0, 0.2196078, 1, 1,
0.3205032, -0.9615912, 3.470764, 0, 0.2156863, 1, 1,
0.3208903, -0.9982694, 2.551329, 0, 0.2078431, 1, 1,
0.3211409, 1.298967, -0.3904963, 0, 0.2039216, 1, 1,
0.3228019, 0.2116954, -0.7289513, 0, 0.1960784, 1, 1,
0.3243723, 0.06976191, 1.711713, 0, 0.1882353, 1, 1,
0.3246085, -1.205531, 1.874151, 0, 0.1843137, 1, 1,
0.3252907, -0.3833597, 1.812745, 0, 0.1764706, 1, 1,
0.3253154, -0.3294392, 3.943049, 0, 0.172549, 1, 1,
0.3275515, -0.5555701, 4.22368, 0, 0.1647059, 1, 1,
0.327648, -0.188454, 0.3763779, 0, 0.1607843, 1, 1,
0.3290744, -0.9117604, 2.706102, 0, 0.1529412, 1, 1,
0.3316114, -0.4809282, 2.68869, 0, 0.1490196, 1, 1,
0.3334723, 0.05337065, 0.5982059, 0, 0.1411765, 1, 1,
0.3396097, -0.3378848, 1.28555, 0, 0.1372549, 1, 1,
0.3446937, 0.4820266, 0.4994695, 0, 0.1294118, 1, 1,
0.347568, 1.328227, 0.1136396, 0, 0.1254902, 1, 1,
0.3485804, -0.8655501, 2.985327, 0, 0.1176471, 1, 1,
0.3557931, -1.049932, 4.261961, 0, 0.1137255, 1, 1,
0.3579146, 0.4132984, 0.5427693, 0, 0.1058824, 1, 1,
0.3585419, -0.02796852, 1.832946, 0, 0.09803922, 1, 1,
0.3592555, 0.9845626, 2.280051, 0, 0.09411765, 1, 1,
0.3604476, 1.448665, -1.376158, 0, 0.08627451, 1, 1,
0.3645155, 1.276748, 0.2022378, 0, 0.08235294, 1, 1,
0.3669606, 0.6546876, 1.039012, 0, 0.07450981, 1, 1,
0.3679283, 0.4899924, 0.4949345, 0, 0.07058824, 1, 1,
0.3741642, 0.5525312, 1.756971, 0, 0.0627451, 1, 1,
0.3766236, 0.8594264, 1.413436, 0, 0.05882353, 1, 1,
0.3792461, 1.130256, 0.5087202, 0, 0.05098039, 1, 1,
0.3801588, 1.518404, -1.428484, 0, 0.04705882, 1, 1,
0.3815746, 0.07170086, 0.8018191, 0, 0.03921569, 1, 1,
0.3875151, 1.684179, 0.01395156, 0, 0.03529412, 1, 1,
0.3895993, 0.009860946, 0.8897318, 0, 0.02745098, 1, 1,
0.391908, 1.357535, 0.8835222, 0, 0.02352941, 1, 1,
0.393819, 0.9428003, 0.008917243, 0, 0.01568628, 1, 1,
0.4024146, -0.3931602, 3.914659, 0, 0.01176471, 1, 1,
0.4032343, 0.6527291, -0.5878417, 0, 0.003921569, 1, 1,
0.4099445, 2.201931, -1.105108, 0.003921569, 0, 1, 1,
0.418307, -0.5983111, 3.595273, 0.007843138, 0, 1, 1,
0.418853, 0.9080762, 1.215594, 0.01568628, 0, 1, 1,
0.4251961, -0.9411836, 1.962455, 0.01960784, 0, 1, 1,
0.4262452, 0.7844835, -0.2375804, 0.02745098, 0, 1, 1,
0.4292901, 0.4389035, 0.182244, 0.03137255, 0, 1, 1,
0.4329781, 0.2316723, 2.42763, 0.03921569, 0, 1, 1,
0.4461057, -0.106024, 2.424005, 0.04313726, 0, 1, 1,
0.4479032, -0.7859105, 3.898484, 0.05098039, 0, 1, 1,
0.4497935, -0.4423116, 2.900373, 0.05490196, 0, 1, 1,
0.4524398, -0.1747222, 0.8413747, 0.0627451, 0, 1, 1,
0.454409, 0.7057673, 0.06528148, 0.06666667, 0, 1, 1,
0.4587324, 1.024216, -0.6439649, 0.07450981, 0, 1, 1,
0.4634806, -0.9763637, 3.62639, 0.07843138, 0, 1, 1,
0.469431, 0.7284238, 0.6448721, 0.08627451, 0, 1, 1,
0.4703798, 2.326586, 0.2430568, 0.09019608, 0, 1, 1,
0.4722706, 1.495793, -0.1424838, 0.09803922, 0, 1, 1,
0.4738277, -0.8105114, 3.506651, 0.1058824, 0, 1, 1,
0.4740702, 2.320792, 0.1209576, 0.1098039, 0, 1, 1,
0.4745391, 0.007942004, 0.229516, 0.1176471, 0, 1, 1,
0.477796, -0.5004129, 2.418563, 0.1215686, 0, 1, 1,
0.4836572, -0.9806731, 3.407877, 0.1294118, 0, 1, 1,
0.4872283, 0.3537692, -0.2887823, 0.1333333, 0, 1, 1,
0.4916307, -0.4958727, 2.2393, 0.1411765, 0, 1, 1,
0.4926661, -0.7616069, 2.607888, 0.145098, 0, 1, 1,
0.4951467, -0.4804353, 1.93883, 0.1529412, 0, 1, 1,
0.4961755, -0.08057772, 2.587778, 0.1568628, 0, 1, 1,
0.5007038, -1.022926, 3.986761, 0.1647059, 0, 1, 1,
0.5088086, 0.3082236, 1.183467, 0.1686275, 0, 1, 1,
0.5091985, -1.340293, 2.469031, 0.1764706, 0, 1, 1,
0.5149831, 0.9300283, -0.7996892, 0.1803922, 0, 1, 1,
0.5169315, -0.7782569, 0.3599224, 0.1882353, 0, 1, 1,
0.5181654, -1.040946, 2.778831, 0.1921569, 0, 1, 1,
0.5215157, -0.09978123, 2.553827, 0.2, 0, 1, 1,
0.5286384, 0.8010402, -1.130887, 0.2078431, 0, 1, 1,
0.5290337, -0.6403078, 2.441712, 0.2117647, 0, 1, 1,
0.5297865, 0.6310053, 1.008966, 0.2196078, 0, 1, 1,
0.5309052, 1.212302, 0.9287955, 0.2235294, 0, 1, 1,
0.537021, 1.528357, -0.1179151, 0.2313726, 0, 1, 1,
0.542982, 0.07519794, 0.8472964, 0.2352941, 0, 1, 1,
0.5462122, 0.5296375, 1.043379, 0.2431373, 0, 1, 1,
0.5462361, -0.09567326, 2.257847, 0.2470588, 0, 1, 1,
0.5513173, -0.3538054, 2.289665, 0.254902, 0, 1, 1,
0.5566534, -1.021774, 2.6541, 0.2588235, 0, 1, 1,
0.5577097, -1.748328, 4.303052, 0.2666667, 0, 1, 1,
0.5578043, 0.08103311, 1.819907, 0.2705882, 0, 1, 1,
0.5639499, 2.263172, -1.557333, 0.2784314, 0, 1, 1,
0.5705252, -0.1437792, 0.9525304, 0.282353, 0, 1, 1,
0.5835856, 0.2005012, 1.606472, 0.2901961, 0, 1, 1,
0.5835861, 1.310293, -0.5156302, 0.2941177, 0, 1, 1,
0.5862001, -0.1984607, 2.205675, 0.3019608, 0, 1, 1,
0.5872771, 0.8138186, 1.707546, 0.3098039, 0, 1, 1,
0.5910179, 1.125093, -1.274702, 0.3137255, 0, 1, 1,
0.5927455, 1.041426, 1.202325, 0.3215686, 0, 1, 1,
0.5939599, -0.9190074, 2.682961, 0.3254902, 0, 1, 1,
0.5975957, 0.05328721, 1.564063, 0.3333333, 0, 1, 1,
0.5987171, -0.8446095, 4.446968, 0.3372549, 0, 1, 1,
0.6056271, 0.6317388, -0.1291026, 0.345098, 0, 1, 1,
0.6078408, -2.019271, 4.977972, 0.3490196, 0, 1, 1,
0.6078447, 2.546822, -0.6406838, 0.3568628, 0, 1, 1,
0.6085863, -0.8909076, 3.709465, 0.3607843, 0, 1, 1,
0.6096316, 1.053964, -1.00509, 0.3686275, 0, 1, 1,
0.6108685, 0.1496412, -0.517302, 0.372549, 0, 1, 1,
0.611038, -0.08704679, 3.279378, 0.3803922, 0, 1, 1,
0.6183363, 0.5925136, 1.435088, 0.3843137, 0, 1, 1,
0.6343901, 0.09550064, 0.9821137, 0.3921569, 0, 1, 1,
0.6351983, 0.4193447, 1.244132, 0.3960784, 0, 1, 1,
0.6354547, -2.226119, 3.100522, 0.4039216, 0, 1, 1,
0.641442, 0.4165865, 1.340802, 0.4117647, 0, 1, 1,
0.6430905, -0.4855422, 2.362218, 0.4156863, 0, 1, 1,
0.643346, 0.9822928, 0.7982345, 0.4235294, 0, 1, 1,
0.6436601, 1.295438, 0.4893357, 0.427451, 0, 1, 1,
0.6453491, -0.5173462, 2.270157, 0.4352941, 0, 1, 1,
0.646963, 1.290633, 2.135803, 0.4392157, 0, 1, 1,
0.6473417, -0.1228545, 1.324176, 0.4470588, 0, 1, 1,
0.6559023, -0.3365744, 2.313245, 0.4509804, 0, 1, 1,
0.6609516, -0.2896414, -0.7025266, 0.4588235, 0, 1, 1,
0.6643763, 2.239099, 1.435898, 0.4627451, 0, 1, 1,
0.6660973, 1.443525, 0.6614881, 0.4705882, 0, 1, 1,
0.6667923, 0.3449547, 2.464329, 0.4745098, 0, 1, 1,
0.6695337, -0.747568, 2.340524, 0.4823529, 0, 1, 1,
0.6709297, -2.620052, 3.235685, 0.4862745, 0, 1, 1,
0.6743365, -2.412805, 2.965011, 0.4941176, 0, 1, 1,
0.67592, -0.7564548, 3.647774, 0.5019608, 0, 1, 1,
0.6801842, 0.01572018, 0.5343959, 0.5058824, 0, 1, 1,
0.6845719, 0.8467036, 0.3412121, 0.5137255, 0, 1, 1,
0.6845893, 1.292848, 0.9828921, 0.5176471, 0, 1, 1,
0.6852202, 0.8647832, -0.05015272, 0.5254902, 0, 1, 1,
0.6875401, 0.2633812, 1.11945, 0.5294118, 0, 1, 1,
0.6897754, -0.5291069, 1.088905, 0.5372549, 0, 1, 1,
0.6950779, 1.09928, 1.427088, 0.5411765, 0, 1, 1,
0.6963518, -0.4941983, 1.984299, 0.5490196, 0, 1, 1,
0.6964811, -0.8791003, 1.190221, 0.5529412, 0, 1, 1,
0.7027287, 0.683929, -0.1253753, 0.5607843, 0, 1, 1,
0.7037018, 1.035203, -0.5981881, 0.5647059, 0, 1, 1,
0.7039916, 0.4325353, 1.09023, 0.572549, 0, 1, 1,
0.7049428, 0.5399883, 0.6657485, 0.5764706, 0, 1, 1,
0.715321, -1.288171, 2.582134, 0.5843138, 0, 1, 1,
0.7154827, 1.277326, -0.1074284, 0.5882353, 0, 1, 1,
0.7188513, 1.663125, 2.069646, 0.5960785, 0, 1, 1,
0.7216134, -0.6096383, 3.237512, 0.6039216, 0, 1, 1,
0.7235274, -1.285608, 3.60429, 0.6078432, 0, 1, 1,
0.7351484, -1.535082, 1.966704, 0.6156863, 0, 1, 1,
0.7372578, 2.053172, -0.3331641, 0.6196079, 0, 1, 1,
0.7397655, 0.05311932, 1.410579, 0.627451, 0, 1, 1,
0.7479625, -0.9152157, 1.809819, 0.6313726, 0, 1, 1,
0.7522576, 0.7888005, -0.1218887, 0.6392157, 0, 1, 1,
0.7526385, -0.6249152, 2.499684, 0.6431373, 0, 1, 1,
0.7544489, -1.442624, 1.445232, 0.6509804, 0, 1, 1,
0.7550073, -0.07115014, 1.943454, 0.654902, 0, 1, 1,
0.7550373, 0.2176293, 1.532393, 0.6627451, 0, 1, 1,
0.7587924, 0.8121353, 1.230418, 0.6666667, 0, 1, 1,
0.7596067, -0.933661, 2.562111, 0.6745098, 0, 1, 1,
0.7614688, 0.6278208, 3.616097, 0.6784314, 0, 1, 1,
0.7692077, 0.3403656, 1.5859, 0.6862745, 0, 1, 1,
0.7709541, -1.244769, 1.415774, 0.6901961, 0, 1, 1,
0.7726964, 0.3059485, 1.767936, 0.6980392, 0, 1, 1,
0.7871984, -0.4842812, 2.542857, 0.7058824, 0, 1, 1,
0.7918457, -0.220283, 2.071991, 0.7098039, 0, 1, 1,
0.7985184, 1.535166, 1.996202, 0.7176471, 0, 1, 1,
0.7994558, 0.1173524, -0.3908875, 0.7215686, 0, 1, 1,
0.8023508, 0.6024092, 1.23199, 0.7294118, 0, 1, 1,
0.8133023, 0.8196254, 2.444091, 0.7333333, 0, 1, 1,
0.8217238, -0.5789605, 0.1742319, 0.7411765, 0, 1, 1,
0.8270532, -0.2171452, 2.656433, 0.7450981, 0, 1, 1,
0.8293762, -0.2305112, 2.168763, 0.7529412, 0, 1, 1,
0.8315597, 0.5238483, 1.848543, 0.7568628, 0, 1, 1,
0.8334233, 0.3686908, 1.200422, 0.7647059, 0, 1, 1,
0.8392699, -0.2257347, 2.639223, 0.7686275, 0, 1, 1,
0.8464652, -0.7652929, 2.566593, 0.7764706, 0, 1, 1,
0.8480278, 0.9262906, -0.8148307, 0.7803922, 0, 1, 1,
0.8501437, -0.3549142, 0.9682233, 0.7882353, 0, 1, 1,
0.8519499, 1.085114, 1.542522, 0.7921569, 0, 1, 1,
0.8561796, 0.6772957, 0.08530272, 0.8, 0, 1, 1,
0.8597832, -0.3783661, 3.662696, 0.8078431, 0, 1, 1,
0.8640461, -0.3797868, 1.044672, 0.8117647, 0, 1, 1,
0.8694577, -0.6258587, 0.3754917, 0.8196079, 0, 1, 1,
0.870783, -1.744011, 2.381356, 0.8235294, 0, 1, 1,
0.871029, 0.1795349, 1.165004, 0.8313726, 0, 1, 1,
0.8728333, -0.5625826, 1.087921, 0.8352941, 0, 1, 1,
0.8761816, -0.4901603, 4.111259, 0.8431373, 0, 1, 1,
0.8954054, -2.380421, 3.053859, 0.8470588, 0, 1, 1,
0.8964605, -1.43286, 2.842139, 0.854902, 0, 1, 1,
0.8981745, -0.8642437, 1.904408, 0.8588235, 0, 1, 1,
0.898487, 0.2456708, 1.221458, 0.8666667, 0, 1, 1,
0.9004774, -0.590519, 4.362288, 0.8705882, 0, 1, 1,
0.9174211, -0.7871207, 2.076494, 0.8784314, 0, 1, 1,
0.9188056, 0.3496552, 0.345624, 0.8823529, 0, 1, 1,
0.9230096, 1.413047, 0.6053458, 0.8901961, 0, 1, 1,
0.9239774, 0.9438915, 0.3605351, 0.8941177, 0, 1, 1,
0.924616, 2.651501, 0.2341198, 0.9019608, 0, 1, 1,
0.9256942, -2.074319, 1.383859, 0.9098039, 0, 1, 1,
0.9259268, -1.634773, 1.88838, 0.9137255, 0, 1, 1,
0.9292662, -1.42059, 3.022087, 0.9215686, 0, 1, 1,
0.9314355, 0.5321067, -0.4331927, 0.9254902, 0, 1, 1,
0.9339062, 0.6411002, 1.740714, 0.9333333, 0, 1, 1,
0.9380001, -0.4385512, 2.393477, 0.9372549, 0, 1, 1,
0.9414306, 1.893916, 0.4340648, 0.945098, 0, 1, 1,
0.9428178, 1.327623, 1.840594, 0.9490196, 0, 1, 1,
0.9435903, -2.0262, 2.424382, 0.9568627, 0, 1, 1,
0.9452849, -0.05946578, 2.082968, 0.9607843, 0, 1, 1,
0.9477847, -0.191983, 1.673808, 0.9686275, 0, 1, 1,
0.9481214, -0.3697381, 0.5437803, 0.972549, 0, 1, 1,
0.950982, 0.2350955, 2.187804, 0.9803922, 0, 1, 1,
0.9541621, -0.8122767, 3.542546, 0.9843137, 0, 1, 1,
0.9641151, 0.2280445, 0.3623949, 0.9921569, 0, 1, 1,
0.9672621, -0.2318224, 1.604879, 0.9960784, 0, 1, 1,
0.9754522, 0.03158148, 0.1082464, 1, 0, 0.9960784, 1,
0.9774994, -0.5687407, 2.068199, 1, 0, 0.9882353, 1,
0.9819028, 0.375919, 1.062661, 1, 0, 0.9843137, 1,
0.9826254, 0.3256569, 1.542133, 1, 0, 0.9764706, 1,
0.982833, -0.9989579, 2.409388, 1, 0, 0.972549, 1,
0.9860595, 0.1601196, 2.066217, 1, 0, 0.9647059, 1,
0.9898933, 0.4160571, 2.423277, 1, 0, 0.9607843, 1,
1.001036, 0.113305, 1.481323, 1, 0, 0.9529412, 1,
1.017585, 0.009531084, 3.182617, 1, 0, 0.9490196, 1,
1.021087, -0.9801104, 3.959223, 1, 0, 0.9411765, 1,
1.031526, -1.286029, 1.539722, 1, 0, 0.9372549, 1,
1.033999, 1.245608, 0.4843858, 1, 0, 0.9294118, 1,
1.034174, -0.4491014, 1.206705, 1, 0, 0.9254902, 1,
1.034669, 0.360795, -0.2352738, 1, 0, 0.9176471, 1,
1.037719, -0.2476837, 1.360156, 1, 0, 0.9137255, 1,
1.043455, -0.2054454, 1.337579, 1, 0, 0.9058824, 1,
1.04598, 0.7081019, 0.9089527, 1, 0, 0.9019608, 1,
1.047421, 0.5638008, 0.04040274, 1, 0, 0.8941177, 1,
1.060221, 0.3728688, 1.72534, 1, 0, 0.8862745, 1,
1.063466, -0.1950808, 2.998772, 1, 0, 0.8823529, 1,
1.069023, -0.1200112, 2.654041, 1, 0, 0.8745098, 1,
1.075566, -0.2774068, 3.711841, 1, 0, 0.8705882, 1,
1.081804, -0.7418528, 1.448822, 1, 0, 0.8627451, 1,
1.089175, 0.6105867, 0.3195428, 1, 0, 0.8588235, 1,
1.098417, 0.3773639, 0.4793735, 1, 0, 0.8509804, 1,
1.107109, 1.501999, -0.2658293, 1, 0, 0.8470588, 1,
1.107775, -0.9686114, 2.749672, 1, 0, 0.8392157, 1,
1.111508, -0.4862961, 2.020979, 1, 0, 0.8352941, 1,
1.114267, -0.9829049, 2.583692, 1, 0, 0.827451, 1,
1.115664, -0.337902, 2.367934, 1, 0, 0.8235294, 1,
1.12246, 0.6923681, 1.657397, 1, 0, 0.8156863, 1,
1.12566, 0.1489271, 1.456559, 1, 0, 0.8117647, 1,
1.127228, 1.124447, 0.9515094, 1, 0, 0.8039216, 1,
1.128629, -0.1053258, 1.507594, 1, 0, 0.7960784, 1,
1.137824, 0.1749154, -0.1036256, 1, 0, 0.7921569, 1,
1.139542, 0.1037817, 1.68517, 1, 0, 0.7843137, 1,
1.146161, -0.06745351, 0.9824154, 1, 0, 0.7803922, 1,
1.149492, 0.7370377, -0.7446882, 1, 0, 0.772549, 1,
1.159128, -0.145872, 2.133938, 1, 0, 0.7686275, 1,
1.160187, 0.4675369, 1.53523, 1, 0, 0.7607843, 1,
1.164795, -0.07412142, 0.9079562, 1, 0, 0.7568628, 1,
1.167848, 0.4642732, 0.7671226, 1, 0, 0.7490196, 1,
1.170234, -0.5530834, 2.002102, 1, 0, 0.7450981, 1,
1.170694, -1.287549, 1.88107, 1, 0, 0.7372549, 1,
1.174821, 2.078304, -0.1961444, 1, 0, 0.7333333, 1,
1.181097, -0.5035352, 3.181534, 1, 0, 0.7254902, 1,
1.184801, -0.953176, 1.230092, 1, 0, 0.7215686, 1,
1.193011, 1.639056, -0.2952061, 1, 0, 0.7137255, 1,
1.198193, -0.06755389, 2.422749, 1, 0, 0.7098039, 1,
1.199349, 1.472314, 0.8078089, 1, 0, 0.7019608, 1,
1.21693, -0.03418277, 2.393281, 1, 0, 0.6941177, 1,
1.217854, 0.2716628, 0.7232577, 1, 0, 0.6901961, 1,
1.218185, -0.7106039, 2.970147, 1, 0, 0.682353, 1,
1.218279, 1.215159, -0.3787172, 1, 0, 0.6784314, 1,
1.218279, -0.381988, 1.825022, 1, 0, 0.6705883, 1,
1.229497, -0.2435171, 1.518138, 1, 0, 0.6666667, 1,
1.230235, -0.8774414, 3.029328, 1, 0, 0.6588235, 1,
1.239428, -0.8478922, 2.032627, 1, 0, 0.654902, 1,
1.25271, -0.1611976, 1.646846, 1, 0, 0.6470588, 1,
1.258703, 0.9949858, 1.322385, 1, 0, 0.6431373, 1,
1.258983, -0.08570912, 2.096307, 1, 0, 0.6352941, 1,
1.269362, 0.3199492, 1.311224, 1, 0, 0.6313726, 1,
1.270276, 0.7106832, 1.309406, 1, 0, 0.6235294, 1,
1.27578, -0.6506056, 3.519589, 1, 0, 0.6196079, 1,
1.281461, 0.2061339, 0.5809538, 1, 0, 0.6117647, 1,
1.286862, 1.274372, 0.4670173, 1, 0, 0.6078432, 1,
1.291073, 0.9788331, 2.560531, 1, 0, 0.6, 1,
1.302712, 2.159081, -0.9719299, 1, 0, 0.5921569, 1,
1.317836, -0.9830324, 2.716139, 1, 0, 0.5882353, 1,
1.330471, 0.2052337, 1.41993, 1, 0, 0.5803922, 1,
1.331784, -1.38053, 4.110492, 1, 0, 0.5764706, 1,
1.338265, -0.716156, 2.320123, 1, 0, 0.5686275, 1,
1.34089, 0.3283179, 2.106889, 1, 0, 0.5647059, 1,
1.341834, -0.006211211, 0.7329256, 1, 0, 0.5568628, 1,
1.359622, -1.548812, 0.3093878, 1, 0, 0.5529412, 1,
1.379692, -0.4590152, 1.410482, 1, 0, 0.5450981, 1,
1.380956, 0.2749032, 3.283707, 1, 0, 0.5411765, 1,
1.382114, -1.45413, 3.916258, 1, 0, 0.5333334, 1,
1.388947, 0.1975564, -0.4859337, 1, 0, 0.5294118, 1,
1.391443, -0.3208842, -0.3992143, 1, 0, 0.5215687, 1,
1.391855, 0.5985364, -0.1886504, 1, 0, 0.5176471, 1,
1.392158, -0.1118882, 1.337769, 1, 0, 0.509804, 1,
1.398161, -1.725461, 3.548343, 1, 0, 0.5058824, 1,
1.403834, 1.249538, 0.8751339, 1, 0, 0.4980392, 1,
1.425025, 1.305476, 0.05411917, 1, 0, 0.4901961, 1,
1.429024, -0.519368, 1.298994, 1, 0, 0.4862745, 1,
1.431399, 0.06850386, -0.1155677, 1, 0, 0.4784314, 1,
1.447547, -1.939292, 4.509253, 1, 0, 0.4745098, 1,
1.449063, -0.424881, 0.9260076, 1, 0, 0.4666667, 1,
1.453374, 0.7979141, 1.813864, 1, 0, 0.4627451, 1,
1.458436, -0.5908011, 2.122074, 1, 0, 0.454902, 1,
1.471364, -2.714245, 1.826101, 1, 0, 0.4509804, 1,
1.487282, -1.511804, 1.016947, 1, 0, 0.4431373, 1,
1.511936, -1.033927, 2.637492, 1, 0, 0.4392157, 1,
1.512494, 0.9948342, 0.07667781, 1, 0, 0.4313726, 1,
1.514884, -0.1307988, 1.330883, 1, 0, 0.427451, 1,
1.524565, 0.7485888, 0.4776553, 1, 0, 0.4196078, 1,
1.533319, 0.9447045, 1.431385, 1, 0, 0.4156863, 1,
1.535577, -0.285613, 1.866234, 1, 0, 0.4078431, 1,
1.544871, 0.4115853, 1.011672, 1, 0, 0.4039216, 1,
1.546175, -0.9589074, 3.720935, 1, 0, 0.3960784, 1,
1.549047, 0.0104734, 2.159497, 1, 0, 0.3882353, 1,
1.561512, 0.1960966, 1.393661, 1, 0, 0.3843137, 1,
1.564285, 0.5031518, 3.163553, 1, 0, 0.3764706, 1,
1.569621, 2.106716, 1.187859, 1, 0, 0.372549, 1,
1.574938, 0.06158594, 1.24911, 1, 0, 0.3647059, 1,
1.58023, -0.8590765, 1.499353, 1, 0, 0.3607843, 1,
1.585161, -1.897203, 3.137895, 1, 0, 0.3529412, 1,
1.586579, -0.3075517, 0.9556529, 1, 0, 0.3490196, 1,
1.590721, 0.07210065, 0.8756874, 1, 0, 0.3411765, 1,
1.6106, -0.4961579, 2.345567, 1, 0, 0.3372549, 1,
1.623778, -0.5259129, 2.32625, 1, 0, 0.3294118, 1,
1.627504, 0.5592787, 1.056834, 1, 0, 0.3254902, 1,
1.649955, -0.003034614, 0.4322571, 1, 0, 0.3176471, 1,
1.650154, -0.545482, 1.176235, 1, 0, 0.3137255, 1,
1.655677, -0.505766, 1.345658, 1, 0, 0.3058824, 1,
1.660744, -0.8475364, 1.56644, 1, 0, 0.2980392, 1,
1.662771, 1.674251, 0.8931715, 1, 0, 0.2941177, 1,
1.68047, -0.8375257, 1.586, 1, 0, 0.2862745, 1,
1.725552, 0.8193046, 1.303867, 1, 0, 0.282353, 1,
1.742619, -0.7038199, 4.310623, 1, 0, 0.2745098, 1,
1.744535, -0.7842737, 1.807852, 1, 0, 0.2705882, 1,
1.758128, 0.5794629, 2.110848, 1, 0, 0.2627451, 1,
1.799942, -0.7547514, 1.401999, 1, 0, 0.2588235, 1,
1.809801, 0.5468011, 0.2895212, 1, 0, 0.2509804, 1,
1.812237, -0.9152843, 2.254641, 1, 0, 0.2470588, 1,
1.822093, 0.2633976, 1.590401, 1, 0, 0.2392157, 1,
1.822806, 0.5120277, 2.403816, 1, 0, 0.2352941, 1,
1.829252, 0.612636, 2.501599, 1, 0, 0.227451, 1,
1.831018, -0.7507059, 3.097, 1, 0, 0.2235294, 1,
1.851084, 0.7730402, -1.098873, 1, 0, 0.2156863, 1,
1.859043, 1.68628, 0.7287442, 1, 0, 0.2117647, 1,
1.859593, 0.1965877, 4.353634, 1, 0, 0.2039216, 1,
1.864278, -1.684972, 1.859365, 1, 0, 0.1960784, 1,
1.893397, 0.931363, 1.427742, 1, 0, 0.1921569, 1,
1.913454, -0.3585065, 1.070216, 1, 0, 0.1843137, 1,
1.947844, 1.463792, 1.808555, 1, 0, 0.1803922, 1,
1.9518, -3.531969, 1.449422, 1, 0, 0.172549, 1,
1.954231, -0.05848194, 0.07442433, 1, 0, 0.1686275, 1,
1.960084, 0.02739915, 2.006658, 1, 0, 0.1607843, 1,
1.980736, -1.09436, 3.258296, 1, 0, 0.1568628, 1,
1.993497, -0.04363329, 1.443057, 1, 0, 0.1490196, 1,
2.017787, -0.5770655, 2.155708, 1, 0, 0.145098, 1,
2.018531, -1.818737, 3.427543, 1, 0, 0.1372549, 1,
2.019201, -0.3334369, 2.141686, 1, 0, 0.1333333, 1,
2.03503, 0.3847251, 1.683192, 1, 0, 0.1254902, 1,
2.040967, 0.3898477, 2.746865, 1, 0, 0.1215686, 1,
2.069325, 1.115553, 3.208604, 1, 0, 0.1137255, 1,
2.087238, 0.05698227, 1.053182, 1, 0, 0.1098039, 1,
2.093067, 1.203244, 0.9307273, 1, 0, 0.1019608, 1,
2.113403, -0.7974533, 3.036824, 1, 0, 0.09411765, 1,
2.138028, 0.4784175, 2.332124, 1, 0, 0.09019608, 1,
2.14456, -0.7137296, 3.107897, 1, 0, 0.08235294, 1,
2.155246, 0.2563093, 1.585138, 1, 0, 0.07843138, 1,
2.172607, 1.376325, 2.10305, 1, 0, 0.07058824, 1,
2.238912, -1.115212, 2.653456, 1, 0, 0.06666667, 1,
2.253996, 0.8503137, 1.999129, 1, 0, 0.05882353, 1,
2.519773, -1.182244, 3.132037, 1, 0, 0.05490196, 1,
2.594257, -0.3692158, 0.8185167, 1, 0, 0.04705882, 1,
2.631104, -1.811046, 3.575684, 1, 0, 0.04313726, 1,
2.640292, -0.3834713, 2.366697, 1, 0, 0.03529412, 1,
2.801225, -0.4254256, 1.988664, 1, 0, 0.03137255, 1,
2.919226, 1.548358, 0.7962292, 1, 0, 0.02352941, 1,
3.012437, -0.1797044, 3.559445, 1, 0, 0.01960784, 1,
3.072152, 0.08037633, 1.685963, 1, 0, 0.01176471, 1,
3.119688, 0.2816626, 1.045452, 1, 0, 0.007843138, 1
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
-0.1295185, -4.580068, -7.09047, 0, -0.5, 0.5, 0.5,
-0.1295185, -4.580068, -7.09047, 1, -0.5, 0.5, 0.5,
-0.1295185, -4.580068, -7.09047, 1, 1.5, 0.5, 0.5,
-0.1295185, -4.580068, -7.09047, 0, 1.5, 0.5, 0.5
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
-4.480206, -0.4402339, -7.09047, 0, -0.5, 0.5, 0.5,
-4.480206, -0.4402339, -7.09047, 1, -0.5, 0.5, 0.5,
-4.480206, -0.4402339, -7.09047, 1, 1.5, 0.5, 0.5,
-4.480206, -0.4402339, -7.09047, 0, 1.5, 0.5, 0.5
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
-4.480206, -4.580068, 0.1017389, 0, -0.5, 0.5, 0.5,
-4.480206, -4.580068, 0.1017389, 1, -0.5, 0.5, 0.5,
-4.480206, -4.580068, 0.1017389, 1, 1.5, 0.5, 0.5,
-4.480206, -4.580068, 0.1017389, 0, 1.5, 0.5, 0.5
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
-3, -3.624721, -5.43073,
3, -3.624721, -5.43073,
-3, -3.624721, -5.43073,
-3, -3.783946, -5.707353,
-2, -3.624721, -5.43073,
-2, -3.783946, -5.707353,
-1, -3.624721, -5.43073,
-1, -3.783946, -5.707353,
0, -3.624721, -5.43073,
0, -3.783946, -5.707353,
1, -3.624721, -5.43073,
1, -3.783946, -5.707353,
2, -3.624721, -5.43073,
2, -3.783946, -5.707353,
3, -3.624721, -5.43073,
3, -3.783946, -5.707353
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
-3, -4.102395, -6.2606, 0, -0.5, 0.5, 0.5,
-3, -4.102395, -6.2606, 1, -0.5, 0.5, 0.5,
-3, -4.102395, -6.2606, 1, 1.5, 0.5, 0.5,
-3, -4.102395, -6.2606, 0, 1.5, 0.5, 0.5,
-2, -4.102395, -6.2606, 0, -0.5, 0.5, 0.5,
-2, -4.102395, -6.2606, 1, -0.5, 0.5, 0.5,
-2, -4.102395, -6.2606, 1, 1.5, 0.5, 0.5,
-2, -4.102395, -6.2606, 0, 1.5, 0.5, 0.5,
-1, -4.102395, -6.2606, 0, -0.5, 0.5, 0.5,
-1, -4.102395, -6.2606, 1, -0.5, 0.5, 0.5,
-1, -4.102395, -6.2606, 1, 1.5, 0.5, 0.5,
-1, -4.102395, -6.2606, 0, 1.5, 0.5, 0.5,
0, -4.102395, -6.2606, 0, -0.5, 0.5, 0.5,
0, -4.102395, -6.2606, 1, -0.5, 0.5, 0.5,
0, -4.102395, -6.2606, 1, 1.5, 0.5, 0.5,
0, -4.102395, -6.2606, 0, 1.5, 0.5, 0.5,
1, -4.102395, -6.2606, 0, -0.5, 0.5, 0.5,
1, -4.102395, -6.2606, 1, -0.5, 0.5, 0.5,
1, -4.102395, -6.2606, 1, 1.5, 0.5, 0.5,
1, -4.102395, -6.2606, 0, 1.5, 0.5, 0.5,
2, -4.102395, -6.2606, 0, -0.5, 0.5, 0.5,
2, -4.102395, -6.2606, 1, -0.5, 0.5, 0.5,
2, -4.102395, -6.2606, 1, 1.5, 0.5, 0.5,
2, -4.102395, -6.2606, 0, 1.5, 0.5, 0.5,
3, -4.102395, -6.2606, 0, -0.5, 0.5, 0.5,
3, -4.102395, -6.2606, 1, -0.5, 0.5, 0.5,
3, -4.102395, -6.2606, 1, 1.5, 0.5, 0.5,
3, -4.102395, -6.2606, 0, 1.5, 0.5, 0.5
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
-3.476201, -3, -5.43073,
-3.476201, 2, -5.43073,
-3.476201, -3, -5.43073,
-3.643535, -3, -5.707353,
-3.476201, -2, -5.43073,
-3.643535, -2, -5.707353,
-3.476201, -1, -5.43073,
-3.643535, -1, -5.707353,
-3.476201, 0, -5.43073,
-3.643535, 0, -5.707353,
-3.476201, 1, -5.43073,
-3.643535, 1, -5.707353,
-3.476201, 2, -5.43073,
-3.643535, 2, -5.707353
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
-3.978203, -3, -6.2606, 0, -0.5, 0.5, 0.5,
-3.978203, -3, -6.2606, 1, -0.5, 0.5, 0.5,
-3.978203, -3, -6.2606, 1, 1.5, 0.5, 0.5,
-3.978203, -3, -6.2606, 0, 1.5, 0.5, 0.5,
-3.978203, -2, -6.2606, 0, -0.5, 0.5, 0.5,
-3.978203, -2, -6.2606, 1, -0.5, 0.5, 0.5,
-3.978203, -2, -6.2606, 1, 1.5, 0.5, 0.5,
-3.978203, -2, -6.2606, 0, 1.5, 0.5, 0.5,
-3.978203, -1, -6.2606, 0, -0.5, 0.5, 0.5,
-3.978203, -1, -6.2606, 1, -0.5, 0.5, 0.5,
-3.978203, -1, -6.2606, 1, 1.5, 0.5, 0.5,
-3.978203, -1, -6.2606, 0, 1.5, 0.5, 0.5,
-3.978203, 0, -6.2606, 0, -0.5, 0.5, 0.5,
-3.978203, 0, -6.2606, 1, -0.5, 0.5, 0.5,
-3.978203, 0, -6.2606, 1, 1.5, 0.5, 0.5,
-3.978203, 0, -6.2606, 0, 1.5, 0.5, 0.5,
-3.978203, 1, -6.2606, 0, -0.5, 0.5, 0.5,
-3.978203, 1, -6.2606, 1, -0.5, 0.5, 0.5,
-3.978203, 1, -6.2606, 1, 1.5, 0.5, 0.5,
-3.978203, 1, -6.2606, 0, 1.5, 0.5, 0.5,
-3.978203, 2, -6.2606, 0, -0.5, 0.5, 0.5,
-3.978203, 2, -6.2606, 1, -0.5, 0.5, 0.5,
-3.978203, 2, -6.2606, 1, 1.5, 0.5, 0.5,
-3.978203, 2, -6.2606, 0, 1.5, 0.5, 0.5
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
-3.476201, -3.624721, -4,
-3.476201, -3.624721, 4,
-3.476201, -3.624721, -4,
-3.643535, -3.783946, -4,
-3.476201, -3.624721, -2,
-3.643535, -3.783946, -2,
-3.476201, -3.624721, 0,
-3.643535, -3.783946, 0,
-3.476201, -3.624721, 2,
-3.643535, -3.783946, 2,
-3.476201, -3.624721, 4,
-3.643535, -3.783946, 4
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
-3.978203, -4.102395, -4, 0, -0.5, 0.5, 0.5,
-3.978203, -4.102395, -4, 1, -0.5, 0.5, 0.5,
-3.978203, -4.102395, -4, 1, 1.5, 0.5, 0.5,
-3.978203, -4.102395, -4, 0, 1.5, 0.5, 0.5,
-3.978203, -4.102395, -2, 0, -0.5, 0.5, 0.5,
-3.978203, -4.102395, -2, 1, -0.5, 0.5, 0.5,
-3.978203, -4.102395, -2, 1, 1.5, 0.5, 0.5,
-3.978203, -4.102395, -2, 0, 1.5, 0.5, 0.5,
-3.978203, -4.102395, 0, 0, -0.5, 0.5, 0.5,
-3.978203, -4.102395, 0, 1, -0.5, 0.5, 0.5,
-3.978203, -4.102395, 0, 1, 1.5, 0.5, 0.5,
-3.978203, -4.102395, 0, 0, 1.5, 0.5, 0.5,
-3.978203, -4.102395, 2, 0, -0.5, 0.5, 0.5,
-3.978203, -4.102395, 2, 1, -0.5, 0.5, 0.5,
-3.978203, -4.102395, 2, 1, 1.5, 0.5, 0.5,
-3.978203, -4.102395, 2, 0, 1.5, 0.5, 0.5,
-3.978203, -4.102395, 4, 0, -0.5, 0.5, 0.5,
-3.978203, -4.102395, 4, 1, -0.5, 0.5, 0.5,
-3.978203, -4.102395, 4, 1, 1.5, 0.5, 0.5,
-3.978203, -4.102395, 4, 0, 1.5, 0.5, 0.5
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
-3.476201, -3.624721, -5.43073,
-3.476201, 2.744253, -5.43073,
-3.476201, -3.624721, 5.634208,
-3.476201, 2.744253, 5.634208,
-3.476201, -3.624721, -5.43073,
-3.476201, -3.624721, 5.634208,
-3.476201, 2.744253, -5.43073,
-3.476201, 2.744253, 5.634208,
-3.476201, -3.624721, -5.43073,
3.217164, -3.624721, -5.43073,
-3.476201, -3.624721, 5.634208,
3.217164, -3.624721, 5.634208,
-3.476201, 2.744253, -5.43073,
3.217164, 2.744253, -5.43073,
-3.476201, 2.744253, 5.634208,
3.217164, 2.744253, 5.634208,
3.217164, -3.624721, -5.43073,
3.217164, 2.744253, -5.43073,
3.217164, -3.624721, 5.634208,
3.217164, 2.744253, 5.634208,
3.217164, -3.624721, -5.43073,
3.217164, -3.624721, 5.634208,
3.217164, 2.744253, -5.43073,
3.217164, 2.744253, 5.634208
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
var radius = 7.697434;
var distance = 34.24675;
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
mvMatrix.translate( 0.1295185, 0.4402339, -0.1017389 );
mvMatrix.scale( 1.243413, 1.306743, 0.7521611 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.24675);
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
prosulfocarb<-read.table("prosulfocarb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prosulfocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'prosulfocarb' not found
```

```r
y<-prosulfocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'prosulfocarb' not found
```

```r
z<-prosulfocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'prosulfocarb' not found
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
-3.378725, -0.2284353, -2.548199, 0, 0, 1, 1, 1,
-2.972041, -0.6292667, -1.176018, 1, 0, 0, 1, 1,
-2.933235, 0.1106228, -1.743307, 1, 0, 0, 1, 1,
-2.83947, -0.3339822, -0.5582236, 1, 0, 0, 1, 1,
-2.799588, 0.3530929, -1.277462, 1, 0, 0, 1, 1,
-2.664677, 0.1736424, -1.595055, 1, 0, 0, 1, 1,
-2.538605, 1.218563, -0.1880993, 0, 0, 0, 1, 1,
-2.50946, 2.036596, -0.6308293, 0, 0, 0, 1, 1,
-2.474605, -0.220915, -3.187366, 0, 0, 0, 1, 1,
-2.435119, -0.5293526, -3.65902, 0, 0, 0, 1, 1,
-2.353068, 1.247237, -0.6758291, 0, 0, 0, 1, 1,
-2.285703, 0.2864359, 0.536586, 0, 0, 0, 1, 1,
-2.255372, 0.1888264, -0.5710779, 0, 0, 0, 1, 1,
-2.25083, 1.258358, -3.279534, 1, 1, 1, 1, 1,
-2.135889, 2.259425, -1.559394, 1, 1, 1, 1, 1,
-2.079197, -0.3689148, -1.020885, 1, 1, 1, 1, 1,
-2.04702, -0.6718614, -0.5155282, 1, 1, 1, 1, 1,
-2.02923, 0.8399909, -0.2550724, 1, 1, 1, 1, 1,
-2.01553, -0.9414645, -2.465288, 1, 1, 1, 1, 1,
-1.97373, 0.1634236, -0.833463, 1, 1, 1, 1, 1,
-1.951826, -2.16305, -3.399309, 1, 1, 1, 1, 1,
-1.941723, -0.65263, -1.685002, 1, 1, 1, 1, 1,
-1.927744, 1.723854, -0.6555496, 1, 1, 1, 1, 1,
-1.911497, 1.007836, -1.177646, 1, 1, 1, 1, 1,
-1.905467, -1.252787, -3.207533, 1, 1, 1, 1, 1,
-1.901247, 0.06147768, -2.567357, 1, 1, 1, 1, 1,
-1.848766, -1.351803, -1.650682, 1, 1, 1, 1, 1,
-1.829405, 0.2791241, -0.6034259, 1, 1, 1, 1, 1,
-1.825287, -1.02635, -2.88499, 0, 0, 1, 1, 1,
-1.818494, -0.576057, -1.284122, 1, 0, 0, 1, 1,
-1.807174, -0.07378699, -1.631163, 1, 0, 0, 1, 1,
-1.80414, 0.7578731, -2.359437, 1, 0, 0, 1, 1,
-1.774523, -2.345025, -3.324789, 1, 0, 0, 1, 1,
-1.773798, 0.5064313, -1.64289, 1, 0, 0, 1, 1,
-1.770312, -0.6790615, -3.53011, 0, 0, 0, 1, 1,
-1.768385, -1.336493, -2.423693, 0, 0, 0, 1, 1,
-1.755473, -0.3700292, -1.811243, 0, 0, 0, 1, 1,
-1.741219, 0.3393908, -1.670015, 0, 0, 0, 1, 1,
-1.736694, -0.8418725, -2.484083, 0, 0, 0, 1, 1,
-1.72958, 0.08751031, -1.296617, 0, 0, 0, 1, 1,
-1.728833, 1.803662, -0.8580069, 0, 0, 0, 1, 1,
-1.727196, -0.01128508, -1.471523, 1, 1, 1, 1, 1,
-1.726402, 0.9371043, 0.0660485, 1, 1, 1, 1, 1,
-1.712338, 0.3476905, -2.968618, 1, 1, 1, 1, 1,
-1.694943, 0.9951087, -0.9656537, 1, 1, 1, 1, 1,
-1.689472, 1.385886, -0.9777828, 1, 1, 1, 1, 1,
-1.668183, -0.4664344, -0.2262571, 1, 1, 1, 1, 1,
-1.662747, 1.122892, -0.7598695, 1, 1, 1, 1, 1,
-1.658958, 0.1588946, -1.027824, 1, 1, 1, 1, 1,
-1.658798, -0.8335366, -1.465213, 1, 1, 1, 1, 1,
-1.657293, 0.0988436, -0.4318552, 1, 1, 1, 1, 1,
-1.63447, 0.5951157, -2.307963, 1, 1, 1, 1, 1,
-1.624873, -0.3293076, -2.004099, 1, 1, 1, 1, 1,
-1.624745, -0.1221876, 0.9651085, 1, 1, 1, 1, 1,
-1.623948, -0.5614073, -3.215058, 1, 1, 1, 1, 1,
-1.611603, -0.2357585, -2.404772, 1, 1, 1, 1, 1,
-1.605024, 0.7765695, -1.047637, 0, 0, 1, 1, 1,
-1.596492, -1.157363, -1.746912, 1, 0, 0, 1, 1,
-1.590938, 0.1604162, -1.285586, 1, 0, 0, 1, 1,
-1.585041, 0.3947323, -1.782175, 1, 0, 0, 1, 1,
-1.573285, -0.825263, -1.966159, 1, 0, 0, 1, 1,
-1.566896, 0.7359114, -1.604927, 1, 0, 0, 1, 1,
-1.563684, -0.6324382, -2.743993, 0, 0, 0, 1, 1,
-1.553578, -0.2177897, -1.446762, 0, 0, 0, 1, 1,
-1.52387, 0.7895831, -1.929499, 0, 0, 0, 1, 1,
-1.5209, 1.730808, -0.4152255, 0, 0, 0, 1, 1,
-1.512968, 2.008076, 0.5917327, 0, 0, 0, 1, 1,
-1.504666, -0.2246563, -1.293533, 0, 0, 0, 1, 1,
-1.484728, 0.7198624, -0.9614568, 0, 0, 0, 1, 1,
-1.471302, 0.8977169, -0.3645247, 1, 1, 1, 1, 1,
-1.471181, 1.422804, 0.5671126, 1, 1, 1, 1, 1,
-1.465579, 0.783107, -2.673131, 1, 1, 1, 1, 1,
-1.464682, 1.482336, -0.7492182, 1, 1, 1, 1, 1,
-1.462699, 0.3298993, -1.188415, 1, 1, 1, 1, 1,
-1.461539, -0.4087702, -1.924938, 1, 1, 1, 1, 1,
-1.458084, -0.1902692, -2.034636, 1, 1, 1, 1, 1,
-1.428982, 1.018104, -2.050786, 1, 1, 1, 1, 1,
-1.418395, 0.6193967, 0.1431083, 1, 1, 1, 1, 1,
-1.416779, -0.7152511, -2.572198, 1, 1, 1, 1, 1,
-1.413113, -1.729808, -3.979017, 1, 1, 1, 1, 1,
-1.41204, 0.4646758, 0.2746831, 1, 1, 1, 1, 1,
-1.390767, -0.3417174, -1.046812, 1, 1, 1, 1, 1,
-1.383472, 0.07365263, -1.852912, 1, 1, 1, 1, 1,
-1.377567, 1.341557, 0.1225625, 1, 1, 1, 1, 1,
-1.375699, -0.7948164, -4.67439, 0, 0, 1, 1, 1,
-1.362616, -0.5219696, -2.24028, 1, 0, 0, 1, 1,
-1.362345, -1.358023, -2.396134, 1, 0, 0, 1, 1,
-1.342107, 0.8643926, -2.226077, 1, 0, 0, 1, 1,
-1.319144, 0.2063484, -3.318796, 1, 0, 0, 1, 1,
-1.317897, 1.2828, 0.09592558, 1, 0, 0, 1, 1,
-1.31258, 0.7183372, -0.0584623, 0, 0, 0, 1, 1,
-1.307009, -1.382167, -1.629963, 0, 0, 0, 1, 1,
-1.301024, -0.457154, -1.330235, 0, 0, 0, 1, 1,
-1.294901, -1.109664, -3.740241, 0, 0, 0, 1, 1,
-1.292496, 0.9180565, -1.309946, 0, 0, 0, 1, 1,
-1.287969, -1.796874, -3.422937, 0, 0, 0, 1, 1,
-1.2856, 2.14941, 2.12208, 0, 0, 0, 1, 1,
-1.270581, 1.030914, -1.471249, 1, 1, 1, 1, 1,
-1.267268, -1.410638, -2.889819, 1, 1, 1, 1, 1,
-1.264827, 0.1971137, -2.030396, 1, 1, 1, 1, 1,
-1.2605, 0.9988021, -1.421083, 1, 1, 1, 1, 1,
-1.260038, 0.4395455, -1.588013, 1, 1, 1, 1, 1,
-1.256307, 0.5666233, -0.6578593, 1, 1, 1, 1, 1,
-1.248117, 1.785935, -0.5569835, 1, 1, 1, 1, 1,
-1.243936, 0.8890397, -2.517002, 1, 1, 1, 1, 1,
-1.231219, 1.721066, -1.952826, 1, 1, 1, 1, 1,
-1.227648, -0.4617744, -1.900725, 1, 1, 1, 1, 1,
-1.226693, 0.3214256, 0.3082926, 1, 1, 1, 1, 1,
-1.224669, -0.7319195, -2.000769, 1, 1, 1, 1, 1,
-1.223336, 0.3748454, -0.01227722, 1, 1, 1, 1, 1,
-1.221627, -1.252982, -3.064632, 1, 1, 1, 1, 1,
-1.211954, -1.239507, -3.531259, 1, 1, 1, 1, 1,
-1.202284, -0.9458207, -0.6113873, 0, 0, 1, 1, 1,
-1.195196, 0.4931532, -1.124747, 1, 0, 0, 1, 1,
-1.185357, -0.4765541, -0.6264576, 1, 0, 0, 1, 1,
-1.183638, 0.8432773, -1.584897, 1, 0, 0, 1, 1,
-1.176447, 0.7926392, -0.3469142, 1, 0, 0, 1, 1,
-1.175452, -1.665755, -2.231582, 1, 0, 0, 1, 1,
-1.175105, -0.3280044, -1.190593, 0, 0, 0, 1, 1,
-1.167051, 2.067877, -0.07546326, 0, 0, 0, 1, 1,
-1.149262, 0.2827784, -1.738873, 0, 0, 0, 1, 1,
-1.145518, 0.2170788, -1.091792, 0, 0, 0, 1, 1,
-1.141283, -1.619845, -3.790687, 0, 0, 0, 1, 1,
-1.130524, 0.1117708, -3.039172, 0, 0, 0, 1, 1,
-1.128135, 0.5198184, -1.37624, 0, 0, 0, 1, 1,
-1.11853, 0.5203834, -0.562925, 1, 1, 1, 1, 1,
-1.107659, 0.1981637, -1.66505, 1, 1, 1, 1, 1,
-1.104817, 0.2225986, -0.7345057, 1, 1, 1, 1, 1,
-1.100947, -0.7999511, -3.723613, 1, 1, 1, 1, 1,
-1.100258, 1.421092, 2.328292, 1, 1, 1, 1, 1,
-1.097678, -0.1860972, -1.366952, 1, 1, 1, 1, 1,
-1.07268, -1.115946, -2.848238, 1, 1, 1, 1, 1,
-1.067586, 0.1701918, -3.474007, 1, 1, 1, 1, 1,
-1.061114, -1.039091, -2.936406, 1, 1, 1, 1, 1,
-1.057722, 1.275974, -1.212253, 1, 1, 1, 1, 1,
-1.047284, -1.232544, -2.498846, 1, 1, 1, 1, 1,
-1.043339, 1.619025, -0.8606685, 1, 1, 1, 1, 1,
-1.040424, 1.367078, -0.973415, 1, 1, 1, 1, 1,
-1.036747, 0.1347103, -1.781437, 1, 1, 1, 1, 1,
-1.034701, -1.048374, -2.659486, 1, 1, 1, 1, 1,
-1.034616, 1.969483, 0.377339, 0, 0, 1, 1, 1,
-1.032172, 0.3755638, -1.019841, 1, 0, 0, 1, 1,
-1.029913, -1.945955, -3.31785, 1, 0, 0, 1, 1,
-1.027429, 0.8814914, -2.639583, 1, 0, 0, 1, 1,
-1.021523, 0.2557857, -0.8444777, 1, 0, 0, 1, 1,
-1.021043, 0.3052241, -0.8143505, 1, 0, 0, 1, 1,
-1.019929, -0.6410588, -1.417762, 0, 0, 0, 1, 1,
-1.009972, -0.4204471, -2.267008, 0, 0, 0, 1, 1,
-1.004279, -1.336734, -2.203056, 0, 0, 0, 1, 1,
-0.9960139, 1.614593, -1.064492, 0, 0, 0, 1, 1,
-0.9918717, -0.2192709, -2.984578, 0, 0, 0, 1, 1,
-0.9899777, -0.1275102, -2.588374, 0, 0, 0, 1, 1,
-0.980844, -1.010555, -2.559095, 0, 0, 0, 1, 1,
-0.9617934, 0.4925011, -2.656725, 1, 1, 1, 1, 1,
-0.959842, -0.260619, -1.456553, 1, 1, 1, 1, 1,
-0.9591454, -1.938232, -2.220742, 1, 1, 1, 1, 1,
-0.9589544, -0.3882516, -1.154977, 1, 1, 1, 1, 1,
-0.9556621, 0.06179437, -1.678329, 1, 1, 1, 1, 1,
-0.9496739, 0.9545677, -1.041328, 1, 1, 1, 1, 1,
-0.9451417, -0.2080907, -2.875939, 1, 1, 1, 1, 1,
-0.9390869, -0.9651638, -1.344937, 1, 1, 1, 1, 1,
-0.9386128, 0.5906122, -2.220818, 1, 1, 1, 1, 1,
-0.938334, -0.8714793, -1.869272, 1, 1, 1, 1, 1,
-0.9290314, -0.7959829, -3.599254, 1, 1, 1, 1, 1,
-0.9261667, 1.554171, 1.52352, 1, 1, 1, 1, 1,
-0.922842, -0.1860962, -3.890343, 1, 1, 1, 1, 1,
-0.9214759, -0.9846509, -4.019873, 1, 1, 1, 1, 1,
-0.9167038, 1.51497, -0.7662632, 1, 1, 1, 1, 1,
-0.9161879, -0.7725568, -2.976702, 0, 0, 1, 1, 1,
-0.9155764, 0.6837721, -0.2158935, 1, 0, 0, 1, 1,
-0.9002305, 0.4390873, -1.274758, 1, 0, 0, 1, 1,
-0.8967251, -0.5271967, -2.301315, 1, 0, 0, 1, 1,
-0.8949037, -0.8779877, -3.30343, 1, 0, 0, 1, 1,
-0.8939115, -0.5033175, -0.7888672, 1, 0, 0, 1, 1,
-0.8867136, 0.1359966, -2.993182, 0, 0, 0, 1, 1,
-0.8866534, -0.3869598, -1.510345, 0, 0, 0, 1, 1,
-0.8853395, -0.851339, -1.079192, 0, 0, 0, 1, 1,
-0.879548, 0.3238876, -1.872932, 0, 0, 0, 1, 1,
-0.8762517, -0.5806931, -0.6665779, 0, 0, 0, 1, 1,
-0.8748465, 0.1099095, -0.9419788, 0, 0, 0, 1, 1,
-0.870864, 0.5657296, -2.115668, 0, 0, 0, 1, 1,
-0.866972, 0.02812136, -2.365514, 1, 1, 1, 1, 1,
-0.8662936, -0.01399488, -0.7677686, 1, 1, 1, 1, 1,
-0.8624723, -0.975299, -0.8318281, 1, 1, 1, 1, 1,
-0.8524715, -0.739355, -2.722519, 1, 1, 1, 1, 1,
-0.8517243, 0.2464009, -1.717001, 1, 1, 1, 1, 1,
-0.8391153, 1.383474, -1.267789, 1, 1, 1, 1, 1,
-0.8352397, 0.6300013, -2.225197, 1, 1, 1, 1, 1,
-0.8341548, 1.295263, -1.386943, 1, 1, 1, 1, 1,
-0.832734, 0.5793274, 0.4261448, 1, 1, 1, 1, 1,
-0.832317, 0.6340736, -0.5611801, 1, 1, 1, 1, 1,
-0.8211307, -1.402379, -1.624789, 1, 1, 1, 1, 1,
-0.8192579, -0.7923445, -3.907243, 1, 1, 1, 1, 1,
-0.8179138, 1.493684, 0.1768503, 1, 1, 1, 1, 1,
-0.8139116, 2.429354, 0.7055213, 1, 1, 1, 1, 1,
-0.8011228, 0.2347879, -0.784247, 1, 1, 1, 1, 1,
-0.7993215, 0.7289967, 0.2469118, 0, 0, 1, 1, 1,
-0.7973387, 0.3114095, -2.986415, 1, 0, 0, 1, 1,
-0.7951082, -0.2398659, -0.4000279, 1, 0, 0, 1, 1,
-0.7927461, 0.008834901, -0.2283005, 1, 0, 0, 1, 1,
-0.7889894, -0.647404, -3.298124, 1, 0, 0, 1, 1,
-0.7870425, 0.1492055, -2.260927, 1, 0, 0, 1, 1,
-0.7863085, 1.607325, -0.4310955, 0, 0, 0, 1, 1,
-0.7855008, -1.036208, -1.155661, 0, 0, 0, 1, 1,
-0.7785008, -1.528954, -2.488927, 0, 0, 0, 1, 1,
-0.7762684, -0.2807553, -0.1549251, 0, 0, 0, 1, 1,
-0.7706474, 0.3730074, -1.44261, 0, 0, 0, 1, 1,
-0.7689386, -0.119114, -3.910844, 0, 0, 0, 1, 1,
-0.7659788, 0.2069562, -1.174466, 0, 0, 0, 1, 1,
-0.7634229, -0.2434908, -4.149772, 1, 1, 1, 1, 1,
-0.7615879, -0.4378782, -2.593514, 1, 1, 1, 1, 1,
-0.7582663, -0.1748209, -2.619185, 1, 1, 1, 1, 1,
-0.7531025, -0.493974, -3.800957, 1, 1, 1, 1, 1,
-0.7501962, 0.7241189, -0.2624794, 1, 1, 1, 1, 1,
-0.7492977, -0.3005049, -2.838032, 1, 1, 1, 1, 1,
-0.7447492, 0.267309, -2.35252, 1, 1, 1, 1, 1,
-0.7436009, -0.9845074, -2.07233, 1, 1, 1, 1, 1,
-0.7425745, -0.08809156, -0.7898683, 1, 1, 1, 1, 1,
-0.7366135, 0.5515644, -0.7542202, 1, 1, 1, 1, 1,
-0.7352489, 0.8048915, -0.1430857, 1, 1, 1, 1, 1,
-0.7301134, -0.4174136, -0.9298139, 1, 1, 1, 1, 1,
-0.7231618, -0.5789497, -2.317898, 1, 1, 1, 1, 1,
-0.7155969, 0.9311271, 0.1475377, 1, 1, 1, 1, 1,
-0.7105554, -0.1495925, -2.258251, 1, 1, 1, 1, 1,
-0.7087551, -0.7871826, -2.878206, 0, 0, 1, 1, 1,
-0.7071447, -0.4162218, -1.745897, 1, 0, 0, 1, 1,
-0.7041233, 0.07713664, -0.7957704, 1, 0, 0, 1, 1,
-0.6995859, -0.2409837, -2.041815, 1, 0, 0, 1, 1,
-0.6995141, -0.8420893, -0.5239325, 1, 0, 0, 1, 1,
-0.6920236, 0.6095945, -0.8575447, 1, 0, 0, 1, 1,
-0.6888739, 0.1025239, -2.101571, 0, 0, 0, 1, 1,
-0.6882985, 0.5218511, -2.151422, 0, 0, 0, 1, 1,
-0.682062, -0.8847114, -2.971879, 0, 0, 0, 1, 1,
-0.6810981, 1.486084, -0.6309169, 0, 0, 0, 1, 1,
-0.6781757, -1.143389, -4.834289, 0, 0, 0, 1, 1,
-0.6694926, -0.8087994, -1.343785, 0, 0, 0, 1, 1,
-0.6693541, 1.049986, -0.4503222, 0, 0, 0, 1, 1,
-0.6668623, -0.4547549, -3.27273, 1, 1, 1, 1, 1,
-0.6617392, -2.118244, -0.5298266, 1, 1, 1, 1, 1,
-0.6572316, -1.564589, -3.187318, 1, 1, 1, 1, 1,
-0.6513302, 1.021921, 0.2898505, 1, 1, 1, 1, 1,
-0.6489252, -2.69586, -2.27158, 1, 1, 1, 1, 1,
-0.6462929, -1.05797, -3.996184, 1, 1, 1, 1, 1,
-0.6416666, 0.4708512, -2.292253, 1, 1, 1, 1, 1,
-0.6408209, -1.981661, -2.658869, 1, 1, 1, 1, 1,
-0.640368, 0.02781036, -2.196656, 1, 1, 1, 1, 1,
-0.6356326, 0.5396992, -0.8122201, 1, 1, 1, 1, 1,
-0.6274472, -0.1119547, -3.772868, 1, 1, 1, 1, 1,
-0.625495, 0.744538, 0.1040528, 1, 1, 1, 1, 1,
-0.6239647, -1.02944, -1.566608, 1, 1, 1, 1, 1,
-0.6236885, -0.1040738, -2.917973, 1, 1, 1, 1, 1,
-0.6083484, -0.2093945, -0.5355976, 1, 1, 1, 1, 1,
-0.6076674, -0.6194989, -1.093892, 0, 0, 1, 1, 1,
-0.6055818, -0.329948, -1.538541, 1, 0, 0, 1, 1,
-0.602692, 2.443128, -1.324576, 1, 0, 0, 1, 1,
-0.5989861, -0.8847121, -2.604509, 1, 0, 0, 1, 1,
-0.5984766, -0.6512792, -2.348226, 1, 0, 0, 1, 1,
-0.5970675, 0.310939, -2.291959, 1, 0, 0, 1, 1,
-0.5901609, 1.701158, -2.638924, 0, 0, 0, 1, 1,
-0.5882624, -0.9916393, -3.609764, 0, 0, 0, 1, 1,
-0.5877351, -1.366634, -3.324618, 0, 0, 0, 1, 1,
-0.5874361, -0.7622662, -5.26959, 0, 0, 0, 1, 1,
-0.5866985, -2.229415, -3.739901, 0, 0, 0, 1, 1,
-0.5837107, -1.682952, -2.537674, 0, 0, 0, 1, 1,
-0.5816681, 0.6607634, -0.5092915, 0, 0, 0, 1, 1,
-0.5792905, -1.268957, -2.895292, 1, 1, 1, 1, 1,
-0.5792427, 0.4008812, -0.6903226, 1, 1, 1, 1, 1,
-0.5757806, -0.08401014, -1.130964, 1, 1, 1, 1, 1,
-0.5746406, 0.5678554, -2.903986, 1, 1, 1, 1, 1,
-0.5739366, -0.5214567, -0.8568299, 1, 1, 1, 1, 1,
-0.570322, -0.2604063, -0.2458099, 1, 1, 1, 1, 1,
-0.5639849, -0.3218671, -1.888399, 1, 1, 1, 1, 1,
-0.5606341, -0.9751453, -1.841064, 1, 1, 1, 1, 1,
-0.5602147, 0.1787839, -3.520995, 1, 1, 1, 1, 1,
-0.5588766, -0.0741841, -2.179515, 1, 1, 1, 1, 1,
-0.5571533, 1.110003, -1.604408, 1, 1, 1, 1, 1,
-0.5536594, -2.262715, -1.358486, 1, 1, 1, 1, 1,
-0.5443491, -0.1225634, -0.5651938, 1, 1, 1, 1, 1,
-0.5386584, 0.01182304, -0.9895104, 1, 1, 1, 1, 1,
-0.5386492, 1.31565, -0.05942928, 1, 1, 1, 1, 1,
-0.5371895, 1.880354, -1.48789, 0, 0, 1, 1, 1,
-0.533335, -0.5054885, -2.907825, 1, 0, 0, 1, 1,
-0.5328795, 0.5727758, -1.289782, 1, 0, 0, 1, 1,
-0.5302225, -0.01582423, -1.933946, 1, 0, 0, 1, 1,
-0.5279728, -1.433787, -3.209625, 1, 0, 0, 1, 1,
-0.5276555, 1.507064, -1.074203, 1, 0, 0, 1, 1,
-0.5275758, 0.6363832, 1.271772, 0, 0, 0, 1, 1,
-0.5253798, -0.8261532, -3.025565, 0, 0, 0, 1, 1,
-0.5250305, -0.05681064, -2.45087, 0, 0, 0, 1, 1,
-0.5249844, -0.1363284, 1.049076, 0, 0, 0, 1, 1,
-0.5246085, -0.1960237, -0.9626806, 0, 0, 0, 1, 1,
-0.523784, 0.5565667, -1.224021, 0, 0, 0, 1, 1,
-0.5229297, -0.8993244, -1.200945, 0, 0, 0, 1, 1,
-0.5190146, 0.3292443, 0.1820222, 1, 1, 1, 1, 1,
-0.5172097, -0.5755948, -3.245525, 1, 1, 1, 1, 1,
-0.5162311, -0.4625068, -1.502577, 1, 1, 1, 1, 1,
-0.5135974, -0.5967025, -1.713174, 1, 1, 1, 1, 1,
-0.5127599, 0.5033671, -1.985324, 1, 1, 1, 1, 1,
-0.5108365, 0.2382773, -0.8539956, 1, 1, 1, 1, 1,
-0.5092739, 0.2682065, -0.01909469, 1, 1, 1, 1, 1,
-0.5086191, 0.7652385, 0.9853443, 1, 1, 1, 1, 1,
-0.5081651, 1.153008, -0.4549851, 1, 1, 1, 1, 1,
-0.4974634, 0.7705266, -0.9385925, 1, 1, 1, 1, 1,
-0.4936105, -0.07558877, -1.645766, 1, 1, 1, 1, 1,
-0.4904105, 0.5562173, -1.634796, 1, 1, 1, 1, 1,
-0.4857138, 1.428849, -1.407804, 1, 1, 1, 1, 1,
-0.4856069, 0.8990651, 0.4141333, 1, 1, 1, 1, 1,
-0.4844674, -0.4880182, -1.843059, 1, 1, 1, 1, 1,
-0.4821236, -0.8667011, -3.623672, 0, 0, 1, 1, 1,
-0.4755193, 0.6572724, -1.143867, 1, 0, 0, 1, 1,
-0.4750552, -0.1399827, -1.735141, 1, 0, 0, 1, 1,
-0.4746902, 0.7378217, 0.5265099, 1, 0, 0, 1, 1,
-0.470401, 0.04819191, -1.945815, 1, 0, 0, 1, 1,
-0.4678088, 0.8205712, 0.8945519, 1, 0, 0, 1, 1,
-0.4629619, -1.804455, -3.274059, 0, 0, 0, 1, 1,
-0.46089, -0.3319679, -2.726075, 0, 0, 0, 1, 1,
-0.4578358, 2.151465, -0.6648107, 0, 0, 0, 1, 1,
-0.4573956, -0.06673083, -2.462067, 0, 0, 0, 1, 1,
-0.4560928, -0.1228805, -2.722944, 0, 0, 0, 1, 1,
-0.4508569, -1.160999, -2.051827, 0, 0, 0, 1, 1,
-0.4494425, -0.9043416, -3.725034, 0, 0, 0, 1, 1,
-0.4475306, -2.42248, -1.757889, 1, 1, 1, 1, 1,
-0.4461914, 0.1268333, -1.395561, 1, 1, 1, 1, 1,
-0.4460599, -0.7493801, -2.121837, 1, 1, 1, 1, 1,
-0.4435875, 1.440271, -0.3598863, 1, 1, 1, 1, 1,
-0.4417609, 2.143835, -0.5379868, 1, 1, 1, 1, 1,
-0.4331302, -0.8471869, -3.073888, 1, 1, 1, 1, 1,
-0.4319447, 0.6692719, -0.09978104, 1, 1, 1, 1, 1,
-0.4312918, -0.1312455, -2.442087, 1, 1, 1, 1, 1,
-0.4290951, 0.2622005, -1.62006, 1, 1, 1, 1, 1,
-0.4264605, 2.247265, -0.3818476, 1, 1, 1, 1, 1,
-0.4260638, -0.1177632, -1.186948, 1, 1, 1, 1, 1,
-0.424944, 1.39119, 0.06643298, 1, 1, 1, 1, 1,
-0.4249337, 1.289498, -1.313724, 1, 1, 1, 1, 1,
-0.4128979, -1.562049, -2.983046, 1, 1, 1, 1, 1,
-0.4112737, 0.5303619, -1.10173, 1, 1, 1, 1, 1,
-0.4022385, 0.7933728, -0.2020667, 0, 0, 1, 1, 1,
-0.4019991, -0.6718138, -2.152467, 1, 0, 0, 1, 1,
-0.3992668, 0.06583817, -2.797297, 1, 0, 0, 1, 1,
-0.3960905, -1.319008, -2.084602, 1, 0, 0, 1, 1,
-0.3949067, -0.3384068, -0.06297615, 1, 0, 0, 1, 1,
-0.3943933, -1.08499, -2.161189, 1, 0, 0, 1, 1,
-0.3857565, 0.8314051, -1.693869, 0, 0, 0, 1, 1,
-0.3852066, 0.2599361, -1.272035, 0, 0, 0, 1, 1,
-0.3752861, -0.07734809, -2.120921, 0, 0, 0, 1, 1,
-0.3748721, 1.01272, -0.526977, 0, 0, 0, 1, 1,
-0.372301, 0.1080779, -1.892376, 0, 0, 0, 1, 1,
-0.3721076, -1.621575, -2.506288, 0, 0, 0, 1, 1,
-0.3685176, -0.2536309, -2.661389, 0, 0, 0, 1, 1,
-0.3658468, 1.155284, -0.9171633, 1, 1, 1, 1, 1,
-0.3630445, 0.08934968, -2.508236, 1, 1, 1, 1, 1,
-0.3621882, -0.4338463, -2.682674, 1, 1, 1, 1, 1,
-0.3613619, -0.786991, -2.704575, 1, 1, 1, 1, 1,
-0.3542943, 0.6501148, -0.4255031, 1, 1, 1, 1, 1,
-0.3520818, -0.8725449, -2.912012, 1, 1, 1, 1, 1,
-0.3512456, 1.77019, -0.6001833, 1, 1, 1, 1, 1,
-0.3412637, -1.997551, -2.500112, 1, 1, 1, 1, 1,
-0.3403026, 1.383659, 0.02946007, 1, 1, 1, 1, 1,
-0.3401691, 1.507133, 1.238888, 1, 1, 1, 1, 1,
-0.3392903, -1.038289, -1.944696, 1, 1, 1, 1, 1,
-0.329907, -2.633454, -3.039271, 1, 1, 1, 1, 1,
-0.3286005, 0.1469948, -0.7676631, 1, 1, 1, 1, 1,
-0.3283459, -0.6437523, -2.227761, 1, 1, 1, 1, 1,
-0.3248862, 0.1419698, -0.8024611, 1, 1, 1, 1, 1,
-0.3221265, -0.08897614, -2.723925, 0, 0, 1, 1, 1,
-0.3209015, 0.261397, 0.2369308, 1, 0, 0, 1, 1,
-0.3202331, -0.6590772, -1.29656, 1, 0, 0, 1, 1,
-0.319269, 0.8699522, 0.3071613, 1, 0, 0, 1, 1,
-0.3170042, -1.086009, -1.878998, 1, 0, 0, 1, 1,
-0.3148683, 0.7607902, -0.0062469, 1, 0, 0, 1, 1,
-0.3105088, 0.2326591, -0.4801095, 0, 0, 0, 1, 1,
-0.3083171, -0.009583952, -2.066211, 0, 0, 0, 1, 1,
-0.3060034, -1.595926, -3.116381, 0, 0, 0, 1, 1,
-0.3015505, 1.508063, -1.252034, 0, 0, 0, 1, 1,
-0.2957744, -1.815766, -2.743609, 0, 0, 0, 1, 1,
-0.2905504, 0.1372836, -2.891195, 0, 0, 0, 1, 1,
-0.2902642, -0.2353582, -3.49634, 0, 0, 0, 1, 1,
-0.2893183, 0.5704079, -0.4393967, 1, 1, 1, 1, 1,
-0.2874831, 0.6215653, -0.389782, 1, 1, 1, 1, 1,
-0.284828, -1.11725, -5.215076, 1, 1, 1, 1, 1,
-0.2815633, -0.8817197, -3.226846, 1, 1, 1, 1, 1,
-0.278608, -0.7888294, -4.384654, 1, 1, 1, 1, 1,
-0.2763684, -0.7721, -2.301259, 1, 1, 1, 1, 1,
-0.2745685, -1.094723, -3.46, 1, 1, 1, 1, 1,
-0.2700761, -0.9606284, -2.776233, 1, 1, 1, 1, 1,
-0.2694098, -0.5455819, -3.262097, 1, 1, 1, 1, 1,
-0.2680925, -0.7167005, -3.567089, 1, 1, 1, 1, 1,
-0.2673057, -2.217992, -4.626911, 1, 1, 1, 1, 1,
-0.2658552, 0.6197092, -0.2578654, 1, 1, 1, 1, 1,
-0.2658043, 0.1139574, -2.012327, 1, 1, 1, 1, 1,
-0.2596067, 0.133002, -0.6130587, 1, 1, 1, 1, 1,
-0.2569448, 1.462298, -1.010887, 1, 1, 1, 1, 1,
-0.2557156, -0.68963, -2.695373, 0, 0, 1, 1, 1,
-0.2555709, 0.7378828, 0.494743, 1, 0, 0, 1, 1,
-0.2518119, -0.4662158, -1.852763, 1, 0, 0, 1, 1,
-0.2496761, -1.062916, -2.902947, 1, 0, 0, 1, 1,
-0.2486332, -0.6715886, -3.091456, 1, 0, 0, 1, 1,
-0.2472062, 1.054313, -1.340446, 1, 0, 0, 1, 1,
-0.2458722, 1.378209, -0.8782405, 0, 0, 0, 1, 1,
-0.2455062, 0.2570338, -1.505699, 0, 0, 0, 1, 1,
-0.2436198, -1.055511, -4.147154, 0, 0, 0, 1, 1,
-0.2420221, -0.5489414, -3.369486, 0, 0, 0, 1, 1,
-0.242002, 1.186005, 1.83614, 0, 0, 0, 1, 1,
-0.2382898, -0.3852287, -0.8148357, 0, 0, 0, 1, 1,
-0.2362435, 0.4571754, 0.6130541, 0, 0, 0, 1, 1,
-0.2331866, 0.1522845, -2.500759, 1, 1, 1, 1, 1,
-0.2321116, 0.563056, 0.3361945, 1, 1, 1, 1, 1,
-0.2316455, 1.53082, 1.428907, 1, 1, 1, 1, 1,
-0.2304071, 0.878864, 0.03725095, 1, 1, 1, 1, 1,
-0.2261568, -0.5041074, -2.059494, 1, 1, 1, 1, 1,
-0.2258522, -1.101043, -2.129656, 1, 1, 1, 1, 1,
-0.2232229, 0.7777767, 0.8330507, 1, 1, 1, 1, 1,
-0.2223956, -1.300568, -1.99876, 1, 1, 1, 1, 1,
-0.221472, -1.662623, -2.984799, 1, 1, 1, 1, 1,
-0.2110268, 0.7999156, -0.5136179, 1, 1, 1, 1, 1,
-0.2046479, 1.714761, 0.35237, 1, 1, 1, 1, 1,
-0.2025775, -0.3480896, -1.847877, 1, 1, 1, 1, 1,
-0.2011323, 1.85937, 0.5176758, 1, 1, 1, 1, 1,
-0.2007189, 0.3181417, -1.153023, 1, 1, 1, 1, 1,
-0.1998941, 0.5080399, -1.172078, 1, 1, 1, 1, 1,
-0.1996824, 0.9022763, 1.420957, 0, 0, 1, 1, 1,
-0.1970572, -0.8417952, -2.9704, 1, 0, 0, 1, 1,
-0.1949943, 0.4615957, -0.5271344, 1, 0, 0, 1, 1,
-0.1926863, -0.03894563, -1.675815, 1, 0, 0, 1, 1,
-0.1915744, -0.8487465, -5.01312, 1, 0, 0, 1, 1,
-0.1907827, 0.9463893, 0.6988425, 1, 0, 0, 1, 1,
-0.1893841, -1.363327, -2.872732, 0, 0, 0, 1, 1,
-0.1844853, 0.671908, -0.4186108, 0, 0, 0, 1, 1,
-0.1805316, 0.7771168, -0.7201407, 0, 0, 0, 1, 1,
-0.1794727, -1.224283, -3.762213, 0, 0, 0, 1, 1,
-0.1785607, 0.3717749, -3.092976, 0, 0, 0, 1, 1,
-0.1750144, -1.39618, -2.940042, 0, 0, 0, 1, 1,
-0.1733073, -0.318213, -2.66883, 0, 0, 0, 1, 1,
-0.1724432, 0.7458875, -1.532341, 1, 1, 1, 1, 1,
-0.170267, 0.4947523, -0.3343078, 1, 1, 1, 1, 1,
-0.1689467, -0.6855792, -1.837771, 1, 1, 1, 1, 1,
-0.1681702, -1.052848, -2.334629, 1, 1, 1, 1, 1,
-0.166521, -0.2213487, -2.369545, 1, 1, 1, 1, 1,
-0.1635991, 0.4815615, 2.239188, 1, 1, 1, 1, 1,
-0.1609882, -1.345206, -1.704923, 1, 1, 1, 1, 1,
-0.1603205, -1.6243, -2.045746, 1, 1, 1, 1, 1,
-0.1595336, -0.3499811, -1.79059, 1, 1, 1, 1, 1,
-0.1581173, 0.5919828, -0.02749093, 1, 1, 1, 1, 1,
-0.1568875, 0.3826785, -1.221343, 1, 1, 1, 1, 1,
-0.1559877, -1.441308, -2.991786, 1, 1, 1, 1, 1,
-0.1552916, 1.503098, 0.6352998, 1, 1, 1, 1, 1,
-0.1486656, 1.045371, -1.232078, 1, 1, 1, 1, 1,
-0.1472991, -0.6634211, -3.260836, 1, 1, 1, 1, 1,
-0.1450153, -0.2013621, -1.449609, 0, 0, 1, 1, 1,
-0.1437218, -1.364411, -3.444099, 1, 0, 0, 1, 1,
-0.1403634, 0.4784605, -1.108073, 1, 0, 0, 1, 1,
-0.1356107, 0.1413503, -2.072169, 1, 0, 0, 1, 1,
-0.1354464, -0.5480117, -1.494217, 1, 0, 0, 1, 1,
-0.1351646, 1.476639, -0.4014553, 1, 0, 0, 1, 1,
-0.1304691, -0.3921449, -3.205464, 0, 0, 0, 1, 1,
-0.1292577, -1.481427, -3.009585, 0, 0, 0, 1, 1,
-0.1256195, -1.475925, -2.782575, 0, 0, 0, 1, 1,
-0.121783, 1.727644, 2.68635, 0, 0, 0, 1, 1,
-0.1098996, 0.8465533, -0.5964714, 0, 0, 0, 1, 1,
-0.1094719, -0.06580799, -3.782045, 0, 0, 0, 1, 1,
-0.1071124, -0.8439758, -2.592882, 0, 0, 0, 1, 1,
-0.103886, 0.07211136, -2.863027, 1, 1, 1, 1, 1,
-0.1009676, 0.3954251, -0.3380715, 1, 1, 1, 1, 1,
-0.09744631, 1.924513, -1.905049, 1, 1, 1, 1, 1,
-0.09368099, -0.6628584, -3.199712, 1, 1, 1, 1, 1,
-0.09095982, 1.462222, 0.315102, 1, 1, 1, 1, 1,
-0.09081616, 0.4117598, -0.5170354, 1, 1, 1, 1, 1,
-0.08933702, -0.2642584, -3.161127, 1, 1, 1, 1, 1,
-0.08448761, 0.6689547, 2.261718, 1, 1, 1, 1, 1,
-0.08291368, 0.008542572, -0.9989388, 1, 1, 1, 1, 1,
-0.08254416, -0.5073782, -1.44073, 1, 1, 1, 1, 1,
-0.08192606, -1.331717, -4.450565, 1, 1, 1, 1, 1,
-0.08114517, 1.282153, -0.1327428, 1, 1, 1, 1, 1,
-0.08043813, -0.0941069, -2.061755, 1, 1, 1, 1, 1,
-0.08042835, 1.791067, -2.012573, 1, 1, 1, 1, 1,
-0.07938089, 1.764279, -0.3470987, 1, 1, 1, 1, 1,
-0.07810729, 0.2584694, -0.04232995, 0, 0, 1, 1, 1,
-0.07252284, -0.7295884, -0.8715178, 1, 0, 0, 1, 1,
-0.07137045, 1.816249, 0.3854429, 1, 0, 0, 1, 1,
-0.06869934, 1.72035, -0.1644848, 1, 0, 0, 1, 1,
-0.06830504, -0.9087914, -3.159827, 1, 0, 0, 1, 1,
-0.06696972, -1.640955, -2.265105, 1, 0, 0, 1, 1,
-0.06283002, 0.6066227, -0.7018863, 0, 0, 0, 1, 1,
-0.06088381, -0.1835793, -3.723361, 0, 0, 0, 1, 1,
-0.06086089, -0.8717189, -3.20838, 0, 0, 0, 1, 1,
-0.06059727, -0.3308456, -3.32901, 0, 0, 0, 1, 1,
-0.05713073, 0.6181925, -0.429746, 0, 0, 0, 1, 1,
-0.05679739, -0.02521917, -5.194438, 0, 0, 0, 1, 1,
-0.04950503, 0.7785413, 0.3217018, 0, 0, 0, 1, 1,
-0.03594839, 0.8750297, 1.701821, 1, 1, 1, 1, 1,
-0.02945998, 0.4786324, 0.402769, 1, 1, 1, 1, 1,
-0.02900915, -0.3391735, -2.609066, 1, 1, 1, 1, 1,
-0.02447138, -0.1534149, -3.905071, 1, 1, 1, 1, 1,
-0.02311637, -0.3951136, -2.851012, 1, 1, 1, 1, 1,
-0.0199193, -1.416722, -4.14489, 1, 1, 1, 1, 1,
-0.01988913, -0.5625706, -2.990889, 1, 1, 1, 1, 1,
-0.01656352, 0.7339705, 1.389887, 1, 1, 1, 1, 1,
-0.008535493, 0.07574461, -0.8592989, 1, 1, 1, 1, 1,
-0.007404345, 0.5420147, -0.4388793, 1, 1, 1, 1, 1,
-0.000275502, -2.629659, -2.948589, 1, 1, 1, 1, 1,
0.003423169, -0.6479546, 1.366035, 1, 1, 1, 1, 1,
0.003483227, 0.8505582, 0.6895494, 1, 1, 1, 1, 1,
0.006569612, 0.3180715, 0.8483954, 1, 1, 1, 1, 1,
0.007612577, 1.593675, 0.8083123, 1, 1, 1, 1, 1,
0.008711159, -1.240388, 2.525168, 0, 0, 1, 1, 1,
0.01150584, -0.7194862, 3.689677, 1, 0, 0, 1, 1,
0.02887975, 0.8742845, 1.909828, 1, 0, 0, 1, 1,
0.03133827, -1.208772, 5.473068, 1, 0, 0, 1, 1,
0.03441421, 0.2403068, 1.91923, 1, 0, 0, 1, 1,
0.03891288, -0.8140145, 3.878351, 1, 0, 0, 1, 1,
0.04059802, 1.158232, 1.356099, 0, 0, 0, 1, 1,
0.04100311, 2.541348, -0.6886044, 0, 0, 0, 1, 1,
0.04794846, -0.9832193, 3.041583, 0, 0, 0, 1, 1,
0.05061176, -1.385107, 4.689352, 0, 0, 0, 1, 1,
0.0510794, -0.6342302, 2.431635, 0, 0, 0, 1, 1,
0.05145648, -2.546968, 2.858329, 0, 0, 0, 1, 1,
0.05171754, 0.6898302, -1.120466, 0, 0, 0, 1, 1,
0.05428295, 0.8924673, 0.2381587, 1, 1, 1, 1, 1,
0.05706977, 0.6794184, -0.6148285, 1, 1, 1, 1, 1,
0.05911386, 0.4477057, 0.3039222, 1, 1, 1, 1, 1,
0.061837, -1.431943, 2.451829, 1, 1, 1, 1, 1,
0.06263186, -0.6768464, 2.589074, 1, 1, 1, 1, 1,
0.07308952, -0.5305924, 3.157781, 1, 1, 1, 1, 1,
0.07969032, 0.2091293, 0.5447024, 1, 1, 1, 1, 1,
0.07978992, -0.2811305, 2.559849, 1, 1, 1, 1, 1,
0.08099517, -0.7489375, 4.133279, 1, 1, 1, 1, 1,
0.08337636, -0.8382824, 2.952853, 1, 1, 1, 1, 1,
0.08699214, 0.6366535, 0.9696463, 1, 1, 1, 1, 1,
0.08757156, -0.2748732, 3.595321, 1, 1, 1, 1, 1,
0.08843974, 0.7012088, -0.8453593, 1, 1, 1, 1, 1,
0.09163935, 0.5163751, 0.5324509, 1, 1, 1, 1, 1,
0.09402054, 1.228979, -0.1799481, 1, 1, 1, 1, 1,
0.09571461, -0.9439563, 1.444869, 0, 0, 1, 1, 1,
0.09641594, 0.5969803, 1.08076, 1, 0, 0, 1, 1,
0.09752049, 0.7801943, 1.721144, 1, 0, 0, 1, 1,
0.09777426, 0.6551057, 0.9703074, 1, 0, 0, 1, 1,
0.09935274, 2.518969, 0.3123385, 1, 0, 0, 1, 1,
0.09962999, 0.7141932, -0.9746349, 1, 0, 0, 1, 1,
0.1024082, 0.3953242, -0.7514208, 0, 0, 0, 1, 1,
0.1055469, -0.1197423, 3.088531, 0, 0, 0, 1, 1,
0.1058246, 0.8454354, 0.7504476, 0, 0, 0, 1, 1,
0.1065362, 1.075526, 0.0578028, 0, 0, 0, 1, 1,
0.1075745, 0.07769282, 0.5759909, 0, 0, 0, 1, 1,
0.1085788, 2.328038, 1.361507, 0, 0, 0, 1, 1,
0.1142521, -0.3190475, 3.05539, 0, 0, 0, 1, 1,
0.1174281, 0.344005, 0.7389071, 1, 1, 1, 1, 1,
0.12071, 0.573586, 0.9398822, 1, 1, 1, 1, 1,
0.1212865, 1.24691, 1.006617, 1, 1, 1, 1, 1,
0.1226824, -0.01744927, 1.078123, 1, 1, 1, 1, 1,
0.1236312, 1.622484, -0.08381236, 1, 1, 1, 1, 1,
0.1252791, -0.8330927, 4.395172, 1, 1, 1, 1, 1,
0.1282807, -0.7740343, 1.610695, 1, 1, 1, 1, 1,
0.1296667, 0.658518, -0.8468576, 1, 1, 1, 1, 1,
0.1316981, 0.09336568, 0.2364464, 1, 1, 1, 1, 1,
0.1323379, 0.3650779, 1.285669, 1, 1, 1, 1, 1,
0.1327273, -1.532949, 3.379467, 1, 1, 1, 1, 1,
0.1331509, -2.578766, 3.52872, 1, 1, 1, 1, 1,
0.1343856, 0.9252916, -0.07681165, 1, 1, 1, 1, 1,
0.1353485, -0.3945626, 1.691046, 1, 1, 1, 1, 1,
0.1356621, 1.743606, 0.470738, 1, 1, 1, 1, 1,
0.1378686, -1.120196, 3.011257, 0, 0, 1, 1, 1,
0.1395606, 0.7968004, -0.009292819, 1, 0, 0, 1, 1,
0.1428353, -0.9481235, 1.987739, 1, 0, 0, 1, 1,
0.1442152, 0.5740491, 1.117264, 1, 0, 0, 1, 1,
0.1445858, -0.06333779, 2.452856, 1, 0, 0, 1, 1,
0.1446348, 0.3766055, 0.5605005, 1, 0, 0, 1, 1,
0.1484172, 1.683609, 0.2739547, 0, 0, 0, 1, 1,
0.1488732, 1.369515, -1.574244, 0, 0, 0, 1, 1,
0.1508169, 0.03208676, 0.9287978, 0, 0, 0, 1, 1,
0.1510854, -1.697993, 1.922832, 0, 0, 0, 1, 1,
0.1530979, 1.598062, 0.9846229, 0, 0, 0, 1, 1,
0.1546857, -0.6667857, 2.928028, 0, 0, 0, 1, 1,
0.1564794, -1.057202, 2.514544, 0, 0, 0, 1, 1,
0.156603, 0.2151851, -0.4391378, 1, 1, 1, 1, 1,
0.1594272, 0.6117349, 1.176525, 1, 1, 1, 1, 1,
0.1619736, -0.2254375, 3.371743, 1, 1, 1, 1, 1,
0.1646532, -0.1055365, 2.284576, 1, 1, 1, 1, 1,
0.1679553, 0.8346851, -0.4737329, 1, 1, 1, 1, 1,
0.1718776, 0.9259458, 0.05604428, 1, 1, 1, 1, 1,
0.1723622, -1.362479, 1.393662, 1, 1, 1, 1, 1,
0.1786183, -0.2157701, 4.861174, 1, 1, 1, 1, 1,
0.1791267, 0.6735271, 0.8164799, 1, 1, 1, 1, 1,
0.1800494, -0.6095502, 2.244201, 1, 1, 1, 1, 1,
0.1882607, 1.461261, -1.465707, 1, 1, 1, 1, 1,
0.1901835, 1.422352, 0.06037876, 1, 1, 1, 1, 1,
0.19122, 0.3211823, -0.315749, 1, 1, 1, 1, 1,
0.1919563, -2.478907, 4.045661, 1, 1, 1, 1, 1,
0.1936361, 0.8568726, 0.9599369, 1, 1, 1, 1, 1,
0.1992226, -1.201299, 2.690548, 0, 0, 1, 1, 1,
0.1994246, 0.1492155, 0.3441115, 1, 0, 0, 1, 1,
0.204195, -0.3349694, 1.969742, 1, 0, 0, 1, 1,
0.2073123, 1.037167, 1.545926, 1, 0, 0, 1, 1,
0.2082043, -0.1509717, 3.639735, 1, 0, 0, 1, 1,
0.2099753, -0.0001806297, 2.509618, 1, 0, 0, 1, 1,
0.218064, -0.4170348, 3.556767, 0, 0, 0, 1, 1,
0.2235699, -0.5356532, 3.051123, 0, 0, 0, 1, 1,
0.2237806, -0.5022415, 2.332293, 0, 0, 0, 1, 1,
0.2244624, 0.2178934, 2.39939, 0, 0, 0, 1, 1,
0.2271414, 1.09069, -0.7244343, 0, 0, 0, 1, 1,
0.2272521, 0.5378089, 0.191983, 0, 0, 0, 1, 1,
0.228156, -1.075959, 0.5756837, 0, 0, 0, 1, 1,
0.2291775, -0.8419233, 3.480507, 1, 1, 1, 1, 1,
0.2308928, 1.645698, 0.4824836, 1, 1, 1, 1, 1,
0.235587, 0.7113577, 0.3341288, 1, 1, 1, 1, 1,
0.2396233, 0.5484473, -0.3527344, 1, 1, 1, 1, 1,
0.239746, 1.681096, -1.226688, 1, 1, 1, 1, 1,
0.2401668, 0.7964692, 0.6050391, 1, 1, 1, 1, 1,
0.2448841, 0.2674213, 0.550672, 1, 1, 1, 1, 1,
0.2456597, -0.350992, 3.625671, 1, 1, 1, 1, 1,
0.2473117, -0.4014736, 4.292367, 1, 1, 1, 1, 1,
0.2503421, 0.4821007, 1.682244, 1, 1, 1, 1, 1,
0.2531404, -0.6475706, 2.77524, 1, 1, 1, 1, 1,
0.2608566, -0.84476, 3.677074, 1, 1, 1, 1, 1,
0.266497, 1.110503, 0.8193721, 1, 1, 1, 1, 1,
0.2693407, -0.8040571, 1.778701, 1, 1, 1, 1, 1,
0.272682, -0.003570272, 0.008402995, 1, 1, 1, 1, 1,
0.2746723, 1.259893, -0.8148487, 0, 0, 1, 1, 1,
0.2756408, 0.3875172, -1.302151, 1, 0, 0, 1, 1,
0.278685, 0.1563668, 0.5454124, 1, 0, 0, 1, 1,
0.2868091, 1.354888, 0.3995562, 1, 0, 0, 1, 1,
0.2903878, -0.2611077, 2.573751, 1, 0, 0, 1, 1,
0.2905916, -0.009449594, 0.510294, 1, 0, 0, 1, 1,
0.2950058, -0.1765768, 4.437243, 0, 0, 0, 1, 1,
0.2991831, 1.150278, -0.4602104, 0, 0, 0, 1, 1,
0.3011301, -1.004964, 4.501335, 0, 0, 0, 1, 1,
0.3016471, 0.1926021, 2.26453, 0, 0, 0, 1, 1,
0.3023396, 0.4989884, -0.4761645, 0, 0, 0, 1, 1,
0.3044408, -0.1755943, 2.024375, 0, 0, 0, 1, 1,
0.3062216, 1.442444, 0.4101456, 0, 0, 0, 1, 1,
0.3067925, 0.1163702, -0.6688155, 1, 1, 1, 1, 1,
0.3189299, -0.7695419, 1.673201, 1, 1, 1, 1, 1,
0.3205032, -0.9615912, 3.470764, 1, 1, 1, 1, 1,
0.3208903, -0.9982694, 2.551329, 1, 1, 1, 1, 1,
0.3211409, 1.298967, -0.3904963, 1, 1, 1, 1, 1,
0.3228019, 0.2116954, -0.7289513, 1, 1, 1, 1, 1,
0.3243723, 0.06976191, 1.711713, 1, 1, 1, 1, 1,
0.3246085, -1.205531, 1.874151, 1, 1, 1, 1, 1,
0.3252907, -0.3833597, 1.812745, 1, 1, 1, 1, 1,
0.3253154, -0.3294392, 3.943049, 1, 1, 1, 1, 1,
0.3275515, -0.5555701, 4.22368, 1, 1, 1, 1, 1,
0.327648, -0.188454, 0.3763779, 1, 1, 1, 1, 1,
0.3290744, -0.9117604, 2.706102, 1, 1, 1, 1, 1,
0.3316114, -0.4809282, 2.68869, 1, 1, 1, 1, 1,
0.3334723, 0.05337065, 0.5982059, 1, 1, 1, 1, 1,
0.3396097, -0.3378848, 1.28555, 0, 0, 1, 1, 1,
0.3446937, 0.4820266, 0.4994695, 1, 0, 0, 1, 1,
0.347568, 1.328227, 0.1136396, 1, 0, 0, 1, 1,
0.3485804, -0.8655501, 2.985327, 1, 0, 0, 1, 1,
0.3557931, -1.049932, 4.261961, 1, 0, 0, 1, 1,
0.3579146, 0.4132984, 0.5427693, 1, 0, 0, 1, 1,
0.3585419, -0.02796852, 1.832946, 0, 0, 0, 1, 1,
0.3592555, 0.9845626, 2.280051, 0, 0, 0, 1, 1,
0.3604476, 1.448665, -1.376158, 0, 0, 0, 1, 1,
0.3645155, 1.276748, 0.2022378, 0, 0, 0, 1, 1,
0.3669606, 0.6546876, 1.039012, 0, 0, 0, 1, 1,
0.3679283, 0.4899924, 0.4949345, 0, 0, 0, 1, 1,
0.3741642, 0.5525312, 1.756971, 0, 0, 0, 1, 1,
0.3766236, 0.8594264, 1.413436, 1, 1, 1, 1, 1,
0.3792461, 1.130256, 0.5087202, 1, 1, 1, 1, 1,
0.3801588, 1.518404, -1.428484, 1, 1, 1, 1, 1,
0.3815746, 0.07170086, 0.8018191, 1, 1, 1, 1, 1,
0.3875151, 1.684179, 0.01395156, 1, 1, 1, 1, 1,
0.3895993, 0.009860946, 0.8897318, 1, 1, 1, 1, 1,
0.391908, 1.357535, 0.8835222, 1, 1, 1, 1, 1,
0.393819, 0.9428003, 0.008917243, 1, 1, 1, 1, 1,
0.4024146, -0.3931602, 3.914659, 1, 1, 1, 1, 1,
0.4032343, 0.6527291, -0.5878417, 1, 1, 1, 1, 1,
0.4099445, 2.201931, -1.105108, 1, 1, 1, 1, 1,
0.418307, -0.5983111, 3.595273, 1, 1, 1, 1, 1,
0.418853, 0.9080762, 1.215594, 1, 1, 1, 1, 1,
0.4251961, -0.9411836, 1.962455, 1, 1, 1, 1, 1,
0.4262452, 0.7844835, -0.2375804, 1, 1, 1, 1, 1,
0.4292901, 0.4389035, 0.182244, 0, 0, 1, 1, 1,
0.4329781, 0.2316723, 2.42763, 1, 0, 0, 1, 1,
0.4461057, -0.106024, 2.424005, 1, 0, 0, 1, 1,
0.4479032, -0.7859105, 3.898484, 1, 0, 0, 1, 1,
0.4497935, -0.4423116, 2.900373, 1, 0, 0, 1, 1,
0.4524398, -0.1747222, 0.8413747, 1, 0, 0, 1, 1,
0.454409, 0.7057673, 0.06528148, 0, 0, 0, 1, 1,
0.4587324, 1.024216, -0.6439649, 0, 0, 0, 1, 1,
0.4634806, -0.9763637, 3.62639, 0, 0, 0, 1, 1,
0.469431, 0.7284238, 0.6448721, 0, 0, 0, 1, 1,
0.4703798, 2.326586, 0.2430568, 0, 0, 0, 1, 1,
0.4722706, 1.495793, -0.1424838, 0, 0, 0, 1, 1,
0.4738277, -0.8105114, 3.506651, 0, 0, 0, 1, 1,
0.4740702, 2.320792, 0.1209576, 1, 1, 1, 1, 1,
0.4745391, 0.007942004, 0.229516, 1, 1, 1, 1, 1,
0.477796, -0.5004129, 2.418563, 1, 1, 1, 1, 1,
0.4836572, -0.9806731, 3.407877, 1, 1, 1, 1, 1,
0.4872283, 0.3537692, -0.2887823, 1, 1, 1, 1, 1,
0.4916307, -0.4958727, 2.2393, 1, 1, 1, 1, 1,
0.4926661, -0.7616069, 2.607888, 1, 1, 1, 1, 1,
0.4951467, -0.4804353, 1.93883, 1, 1, 1, 1, 1,
0.4961755, -0.08057772, 2.587778, 1, 1, 1, 1, 1,
0.5007038, -1.022926, 3.986761, 1, 1, 1, 1, 1,
0.5088086, 0.3082236, 1.183467, 1, 1, 1, 1, 1,
0.5091985, -1.340293, 2.469031, 1, 1, 1, 1, 1,
0.5149831, 0.9300283, -0.7996892, 1, 1, 1, 1, 1,
0.5169315, -0.7782569, 0.3599224, 1, 1, 1, 1, 1,
0.5181654, -1.040946, 2.778831, 1, 1, 1, 1, 1,
0.5215157, -0.09978123, 2.553827, 0, 0, 1, 1, 1,
0.5286384, 0.8010402, -1.130887, 1, 0, 0, 1, 1,
0.5290337, -0.6403078, 2.441712, 1, 0, 0, 1, 1,
0.5297865, 0.6310053, 1.008966, 1, 0, 0, 1, 1,
0.5309052, 1.212302, 0.9287955, 1, 0, 0, 1, 1,
0.537021, 1.528357, -0.1179151, 1, 0, 0, 1, 1,
0.542982, 0.07519794, 0.8472964, 0, 0, 0, 1, 1,
0.5462122, 0.5296375, 1.043379, 0, 0, 0, 1, 1,
0.5462361, -0.09567326, 2.257847, 0, 0, 0, 1, 1,
0.5513173, -0.3538054, 2.289665, 0, 0, 0, 1, 1,
0.5566534, -1.021774, 2.6541, 0, 0, 0, 1, 1,
0.5577097, -1.748328, 4.303052, 0, 0, 0, 1, 1,
0.5578043, 0.08103311, 1.819907, 0, 0, 0, 1, 1,
0.5639499, 2.263172, -1.557333, 1, 1, 1, 1, 1,
0.5705252, -0.1437792, 0.9525304, 1, 1, 1, 1, 1,
0.5835856, 0.2005012, 1.606472, 1, 1, 1, 1, 1,
0.5835861, 1.310293, -0.5156302, 1, 1, 1, 1, 1,
0.5862001, -0.1984607, 2.205675, 1, 1, 1, 1, 1,
0.5872771, 0.8138186, 1.707546, 1, 1, 1, 1, 1,
0.5910179, 1.125093, -1.274702, 1, 1, 1, 1, 1,
0.5927455, 1.041426, 1.202325, 1, 1, 1, 1, 1,
0.5939599, -0.9190074, 2.682961, 1, 1, 1, 1, 1,
0.5975957, 0.05328721, 1.564063, 1, 1, 1, 1, 1,
0.5987171, -0.8446095, 4.446968, 1, 1, 1, 1, 1,
0.6056271, 0.6317388, -0.1291026, 1, 1, 1, 1, 1,
0.6078408, -2.019271, 4.977972, 1, 1, 1, 1, 1,
0.6078447, 2.546822, -0.6406838, 1, 1, 1, 1, 1,
0.6085863, -0.8909076, 3.709465, 1, 1, 1, 1, 1,
0.6096316, 1.053964, -1.00509, 0, 0, 1, 1, 1,
0.6108685, 0.1496412, -0.517302, 1, 0, 0, 1, 1,
0.611038, -0.08704679, 3.279378, 1, 0, 0, 1, 1,
0.6183363, 0.5925136, 1.435088, 1, 0, 0, 1, 1,
0.6343901, 0.09550064, 0.9821137, 1, 0, 0, 1, 1,
0.6351983, 0.4193447, 1.244132, 1, 0, 0, 1, 1,
0.6354547, -2.226119, 3.100522, 0, 0, 0, 1, 1,
0.641442, 0.4165865, 1.340802, 0, 0, 0, 1, 1,
0.6430905, -0.4855422, 2.362218, 0, 0, 0, 1, 1,
0.643346, 0.9822928, 0.7982345, 0, 0, 0, 1, 1,
0.6436601, 1.295438, 0.4893357, 0, 0, 0, 1, 1,
0.6453491, -0.5173462, 2.270157, 0, 0, 0, 1, 1,
0.646963, 1.290633, 2.135803, 0, 0, 0, 1, 1,
0.6473417, -0.1228545, 1.324176, 1, 1, 1, 1, 1,
0.6559023, -0.3365744, 2.313245, 1, 1, 1, 1, 1,
0.6609516, -0.2896414, -0.7025266, 1, 1, 1, 1, 1,
0.6643763, 2.239099, 1.435898, 1, 1, 1, 1, 1,
0.6660973, 1.443525, 0.6614881, 1, 1, 1, 1, 1,
0.6667923, 0.3449547, 2.464329, 1, 1, 1, 1, 1,
0.6695337, -0.747568, 2.340524, 1, 1, 1, 1, 1,
0.6709297, -2.620052, 3.235685, 1, 1, 1, 1, 1,
0.6743365, -2.412805, 2.965011, 1, 1, 1, 1, 1,
0.67592, -0.7564548, 3.647774, 1, 1, 1, 1, 1,
0.6801842, 0.01572018, 0.5343959, 1, 1, 1, 1, 1,
0.6845719, 0.8467036, 0.3412121, 1, 1, 1, 1, 1,
0.6845893, 1.292848, 0.9828921, 1, 1, 1, 1, 1,
0.6852202, 0.8647832, -0.05015272, 1, 1, 1, 1, 1,
0.6875401, 0.2633812, 1.11945, 1, 1, 1, 1, 1,
0.6897754, -0.5291069, 1.088905, 0, 0, 1, 1, 1,
0.6950779, 1.09928, 1.427088, 1, 0, 0, 1, 1,
0.6963518, -0.4941983, 1.984299, 1, 0, 0, 1, 1,
0.6964811, -0.8791003, 1.190221, 1, 0, 0, 1, 1,
0.7027287, 0.683929, -0.1253753, 1, 0, 0, 1, 1,
0.7037018, 1.035203, -0.5981881, 1, 0, 0, 1, 1,
0.7039916, 0.4325353, 1.09023, 0, 0, 0, 1, 1,
0.7049428, 0.5399883, 0.6657485, 0, 0, 0, 1, 1,
0.715321, -1.288171, 2.582134, 0, 0, 0, 1, 1,
0.7154827, 1.277326, -0.1074284, 0, 0, 0, 1, 1,
0.7188513, 1.663125, 2.069646, 0, 0, 0, 1, 1,
0.7216134, -0.6096383, 3.237512, 0, 0, 0, 1, 1,
0.7235274, -1.285608, 3.60429, 0, 0, 0, 1, 1,
0.7351484, -1.535082, 1.966704, 1, 1, 1, 1, 1,
0.7372578, 2.053172, -0.3331641, 1, 1, 1, 1, 1,
0.7397655, 0.05311932, 1.410579, 1, 1, 1, 1, 1,
0.7479625, -0.9152157, 1.809819, 1, 1, 1, 1, 1,
0.7522576, 0.7888005, -0.1218887, 1, 1, 1, 1, 1,
0.7526385, -0.6249152, 2.499684, 1, 1, 1, 1, 1,
0.7544489, -1.442624, 1.445232, 1, 1, 1, 1, 1,
0.7550073, -0.07115014, 1.943454, 1, 1, 1, 1, 1,
0.7550373, 0.2176293, 1.532393, 1, 1, 1, 1, 1,
0.7587924, 0.8121353, 1.230418, 1, 1, 1, 1, 1,
0.7596067, -0.933661, 2.562111, 1, 1, 1, 1, 1,
0.7614688, 0.6278208, 3.616097, 1, 1, 1, 1, 1,
0.7692077, 0.3403656, 1.5859, 1, 1, 1, 1, 1,
0.7709541, -1.244769, 1.415774, 1, 1, 1, 1, 1,
0.7726964, 0.3059485, 1.767936, 1, 1, 1, 1, 1,
0.7871984, -0.4842812, 2.542857, 0, 0, 1, 1, 1,
0.7918457, -0.220283, 2.071991, 1, 0, 0, 1, 1,
0.7985184, 1.535166, 1.996202, 1, 0, 0, 1, 1,
0.7994558, 0.1173524, -0.3908875, 1, 0, 0, 1, 1,
0.8023508, 0.6024092, 1.23199, 1, 0, 0, 1, 1,
0.8133023, 0.8196254, 2.444091, 1, 0, 0, 1, 1,
0.8217238, -0.5789605, 0.1742319, 0, 0, 0, 1, 1,
0.8270532, -0.2171452, 2.656433, 0, 0, 0, 1, 1,
0.8293762, -0.2305112, 2.168763, 0, 0, 0, 1, 1,
0.8315597, 0.5238483, 1.848543, 0, 0, 0, 1, 1,
0.8334233, 0.3686908, 1.200422, 0, 0, 0, 1, 1,
0.8392699, -0.2257347, 2.639223, 0, 0, 0, 1, 1,
0.8464652, -0.7652929, 2.566593, 0, 0, 0, 1, 1,
0.8480278, 0.9262906, -0.8148307, 1, 1, 1, 1, 1,
0.8501437, -0.3549142, 0.9682233, 1, 1, 1, 1, 1,
0.8519499, 1.085114, 1.542522, 1, 1, 1, 1, 1,
0.8561796, 0.6772957, 0.08530272, 1, 1, 1, 1, 1,
0.8597832, -0.3783661, 3.662696, 1, 1, 1, 1, 1,
0.8640461, -0.3797868, 1.044672, 1, 1, 1, 1, 1,
0.8694577, -0.6258587, 0.3754917, 1, 1, 1, 1, 1,
0.870783, -1.744011, 2.381356, 1, 1, 1, 1, 1,
0.871029, 0.1795349, 1.165004, 1, 1, 1, 1, 1,
0.8728333, -0.5625826, 1.087921, 1, 1, 1, 1, 1,
0.8761816, -0.4901603, 4.111259, 1, 1, 1, 1, 1,
0.8954054, -2.380421, 3.053859, 1, 1, 1, 1, 1,
0.8964605, -1.43286, 2.842139, 1, 1, 1, 1, 1,
0.8981745, -0.8642437, 1.904408, 1, 1, 1, 1, 1,
0.898487, 0.2456708, 1.221458, 1, 1, 1, 1, 1,
0.9004774, -0.590519, 4.362288, 0, 0, 1, 1, 1,
0.9174211, -0.7871207, 2.076494, 1, 0, 0, 1, 1,
0.9188056, 0.3496552, 0.345624, 1, 0, 0, 1, 1,
0.9230096, 1.413047, 0.6053458, 1, 0, 0, 1, 1,
0.9239774, 0.9438915, 0.3605351, 1, 0, 0, 1, 1,
0.924616, 2.651501, 0.2341198, 1, 0, 0, 1, 1,
0.9256942, -2.074319, 1.383859, 0, 0, 0, 1, 1,
0.9259268, -1.634773, 1.88838, 0, 0, 0, 1, 1,
0.9292662, -1.42059, 3.022087, 0, 0, 0, 1, 1,
0.9314355, 0.5321067, -0.4331927, 0, 0, 0, 1, 1,
0.9339062, 0.6411002, 1.740714, 0, 0, 0, 1, 1,
0.9380001, -0.4385512, 2.393477, 0, 0, 0, 1, 1,
0.9414306, 1.893916, 0.4340648, 0, 0, 0, 1, 1,
0.9428178, 1.327623, 1.840594, 1, 1, 1, 1, 1,
0.9435903, -2.0262, 2.424382, 1, 1, 1, 1, 1,
0.9452849, -0.05946578, 2.082968, 1, 1, 1, 1, 1,
0.9477847, -0.191983, 1.673808, 1, 1, 1, 1, 1,
0.9481214, -0.3697381, 0.5437803, 1, 1, 1, 1, 1,
0.950982, 0.2350955, 2.187804, 1, 1, 1, 1, 1,
0.9541621, -0.8122767, 3.542546, 1, 1, 1, 1, 1,
0.9641151, 0.2280445, 0.3623949, 1, 1, 1, 1, 1,
0.9672621, -0.2318224, 1.604879, 1, 1, 1, 1, 1,
0.9754522, 0.03158148, 0.1082464, 1, 1, 1, 1, 1,
0.9774994, -0.5687407, 2.068199, 1, 1, 1, 1, 1,
0.9819028, 0.375919, 1.062661, 1, 1, 1, 1, 1,
0.9826254, 0.3256569, 1.542133, 1, 1, 1, 1, 1,
0.982833, -0.9989579, 2.409388, 1, 1, 1, 1, 1,
0.9860595, 0.1601196, 2.066217, 1, 1, 1, 1, 1,
0.9898933, 0.4160571, 2.423277, 0, 0, 1, 1, 1,
1.001036, 0.113305, 1.481323, 1, 0, 0, 1, 1,
1.017585, 0.009531084, 3.182617, 1, 0, 0, 1, 1,
1.021087, -0.9801104, 3.959223, 1, 0, 0, 1, 1,
1.031526, -1.286029, 1.539722, 1, 0, 0, 1, 1,
1.033999, 1.245608, 0.4843858, 1, 0, 0, 1, 1,
1.034174, -0.4491014, 1.206705, 0, 0, 0, 1, 1,
1.034669, 0.360795, -0.2352738, 0, 0, 0, 1, 1,
1.037719, -0.2476837, 1.360156, 0, 0, 0, 1, 1,
1.043455, -0.2054454, 1.337579, 0, 0, 0, 1, 1,
1.04598, 0.7081019, 0.9089527, 0, 0, 0, 1, 1,
1.047421, 0.5638008, 0.04040274, 0, 0, 0, 1, 1,
1.060221, 0.3728688, 1.72534, 0, 0, 0, 1, 1,
1.063466, -0.1950808, 2.998772, 1, 1, 1, 1, 1,
1.069023, -0.1200112, 2.654041, 1, 1, 1, 1, 1,
1.075566, -0.2774068, 3.711841, 1, 1, 1, 1, 1,
1.081804, -0.7418528, 1.448822, 1, 1, 1, 1, 1,
1.089175, 0.6105867, 0.3195428, 1, 1, 1, 1, 1,
1.098417, 0.3773639, 0.4793735, 1, 1, 1, 1, 1,
1.107109, 1.501999, -0.2658293, 1, 1, 1, 1, 1,
1.107775, -0.9686114, 2.749672, 1, 1, 1, 1, 1,
1.111508, -0.4862961, 2.020979, 1, 1, 1, 1, 1,
1.114267, -0.9829049, 2.583692, 1, 1, 1, 1, 1,
1.115664, -0.337902, 2.367934, 1, 1, 1, 1, 1,
1.12246, 0.6923681, 1.657397, 1, 1, 1, 1, 1,
1.12566, 0.1489271, 1.456559, 1, 1, 1, 1, 1,
1.127228, 1.124447, 0.9515094, 1, 1, 1, 1, 1,
1.128629, -0.1053258, 1.507594, 1, 1, 1, 1, 1,
1.137824, 0.1749154, -0.1036256, 0, 0, 1, 1, 1,
1.139542, 0.1037817, 1.68517, 1, 0, 0, 1, 1,
1.146161, -0.06745351, 0.9824154, 1, 0, 0, 1, 1,
1.149492, 0.7370377, -0.7446882, 1, 0, 0, 1, 1,
1.159128, -0.145872, 2.133938, 1, 0, 0, 1, 1,
1.160187, 0.4675369, 1.53523, 1, 0, 0, 1, 1,
1.164795, -0.07412142, 0.9079562, 0, 0, 0, 1, 1,
1.167848, 0.4642732, 0.7671226, 0, 0, 0, 1, 1,
1.170234, -0.5530834, 2.002102, 0, 0, 0, 1, 1,
1.170694, -1.287549, 1.88107, 0, 0, 0, 1, 1,
1.174821, 2.078304, -0.1961444, 0, 0, 0, 1, 1,
1.181097, -0.5035352, 3.181534, 0, 0, 0, 1, 1,
1.184801, -0.953176, 1.230092, 0, 0, 0, 1, 1,
1.193011, 1.639056, -0.2952061, 1, 1, 1, 1, 1,
1.198193, -0.06755389, 2.422749, 1, 1, 1, 1, 1,
1.199349, 1.472314, 0.8078089, 1, 1, 1, 1, 1,
1.21693, -0.03418277, 2.393281, 1, 1, 1, 1, 1,
1.217854, 0.2716628, 0.7232577, 1, 1, 1, 1, 1,
1.218185, -0.7106039, 2.970147, 1, 1, 1, 1, 1,
1.218279, 1.215159, -0.3787172, 1, 1, 1, 1, 1,
1.218279, -0.381988, 1.825022, 1, 1, 1, 1, 1,
1.229497, -0.2435171, 1.518138, 1, 1, 1, 1, 1,
1.230235, -0.8774414, 3.029328, 1, 1, 1, 1, 1,
1.239428, -0.8478922, 2.032627, 1, 1, 1, 1, 1,
1.25271, -0.1611976, 1.646846, 1, 1, 1, 1, 1,
1.258703, 0.9949858, 1.322385, 1, 1, 1, 1, 1,
1.258983, -0.08570912, 2.096307, 1, 1, 1, 1, 1,
1.269362, 0.3199492, 1.311224, 1, 1, 1, 1, 1,
1.270276, 0.7106832, 1.309406, 0, 0, 1, 1, 1,
1.27578, -0.6506056, 3.519589, 1, 0, 0, 1, 1,
1.281461, 0.2061339, 0.5809538, 1, 0, 0, 1, 1,
1.286862, 1.274372, 0.4670173, 1, 0, 0, 1, 1,
1.291073, 0.9788331, 2.560531, 1, 0, 0, 1, 1,
1.302712, 2.159081, -0.9719299, 1, 0, 0, 1, 1,
1.317836, -0.9830324, 2.716139, 0, 0, 0, 1, 1,
1.330471, 0.2052337, 1.41993, 0, 0, 0, 1, 1,
1.331784, -1.38053, 4.110492, 0, 0, 0, 1, 1,
1.338265, -0.716156, 2.320123, 0, 0, 0, 1, 1,
1.34089, 0.3283179, 2.106889, 0, 0, 0, 1, 1,
1.341834, -0.006211211, 0.7329256, 0, 0, 0, 1, 1,
1.359622, -1.548812, 0.3093878, 0, 0, 0, 1, 1,
1.379692, -0.4590152, 1.410482, 1, 1, 1, 1, 1,
1.380956, 0.2749032, 3.283707, 1, 1, 1, 1, 1,
1.382114, -1.45413, 3.916258, 1, 1, 1, 1, 1,
1.388947, 0.1975564, -0.4859337, 1, 1, 1, 1, 1,
1.391443, -0.3208842, -0.3992143, 1, 1, 1, 1, 1,
1.391855, 0.5985364, -0.1886504, 1, 1, 1, 1, 1,
1.392158, -0.1118882, 1.337769, 1, 1, 1, 1, 1,
1.398161, -1.725461, 3.548343, 1, 1, 1, 1, 1,
1.403834, 1.249538, 0.8751339, 1, 1, 1, 1, 1,
1.425025, 1.305476, 0.05411917, 1, 1, 1, 1, 1,
1.429024, -0.519368, 1.298994, 1, 1, 1, 1, 1,
1.431399, 0.06850386, -0.1155677, 1, 1, 1, 1, 1,
1.447547, -1.939292, 4.509253, 1, 1, 1, 1, 1,
1.449063, -0.424881, 0.9260076, 1, 1, 1, 1, 1,
1.453374, 0.7979141, 1.813864, 1, 1, 1, 1, 1,
1.458436, -0.5908011, 2.122074, 0, 0, 1, 1, 1,
1.471364, -2.714245, 1.826101, 1, 0, 0, 1, 1,
1.487282, -1.511804, 1.016947, 1, 0, 0, 1, 1,
1.511936, -1.033927, 2.637492, 1, 0, 0, 1, 1,
1.512494, 0.9948342, 0.07667781, 1, 0, 0, 1, 1,
1.514884, -0.1307988, 1.330883, 1, 0, 0, 1, 1,
1.524565, 0.7485888, 0.4776553, 0, 0, 0, 1, 1,
1.533319, 0.9447045, 1.431385, 0, 0, 0, 1, 1,
1.535577, -0.285613, 1.866234, 0, 0, 0, 1, 1,
1.544871, 0.4115853, 1.011672, 0, 0, 0, 1, 1,
1.546175, -0.9589074, 3.720935, 0, 0, 0, 1, 1,
1.549047, 0.0104734, 2.159497, 0, 0, 0, 1, 1,
1.561512, 0.1960966, 1.393661, 0, 0, 0, 1, 1,
1.564285, 0.5031518, 3.163553, 1, 1, 1, 1, 1,
1.569621, 2.106716, 1.187859, 1, 1, 1, 1, 1,
1.574938, 0.06158594, 1.24911, 1, 1, 1, 1, 1,
1.58023, -0.8590765, 1.499353, 1, 1, 1, 1, 1,
1.585161, -1.897203, 3.137895, 1, 1, 1, 1, 1,
1.586579, -0.3075517, 0.9556529, 1, 1, 1, 1, 1,
1.590721, 0.07210065, 0.8756874, 1, 1, 1, 1, 1,
1.6106, -0.4961579, 2.345567, 1, 1, 1, 1, 1,
1.623778, -0.5259129, 2.32625, 1, 1, 1, 1, 1,
1.627504, 0.5592787, 1.056834, 1, 1, 1, 1, 1,
1.649955, -0.003034614, 0.4322571, 1, 1, 1, 1, 1,
1.650154, -0.545482, 1.176235, 1, 1, 1, 1, 1,
1.655677, -0.505766, 1.345658, 1, 1, 1, 1, 1,
1.660744, -0.8475364, 1.56644, 1, 1, 1, 1, 1,
1.662771, 1.674251, 0.8931715, 1, 1, 1, 1, 1,
1.68047, -0.8375257, 1.586, 0, 0, 1, 1, 1,
1.725552, 0.8193046, 1.303867, 1, 0, 0, 1, 1,
1.742619, -0.7038199, 4.310623, 1, 0, 0, 1, 1,
1.744535, -0.7842737, 1.807852, 1, 0, 0, 1, 1,
1.758128, 0.5794629, 2.110848, 1, 0, 0, 1, 1,
1.799942, -0.7547514, 1.401999, 1, 0, 0, 1, 1,
1.809801, 0.5468011, 0.2895212, 0, 0, 0, 1, 1,
1.812237, -0.9152843, 2.254641, 0, 0, 0, 1, 1,
1.822093, 0.2633976, 1.590401, 0, 0, 0, 1, 1,
1.822806, 0.5120277, 2.403816, 0, 0, 0, 1, 1,
1.829252, 0.612636, 2.501599, 0, 0, 0, 1, 1,
1.831018, -0.7507059, 3.097, 0, 0, 0, 1, 1,
1.851084, 0.7730402, -1.098873, 0, 0, 0, 1, 1,
1.859043, 1.68628, 0.7287442, 1, 1, 1, 1, 1,
1.859593, 0.1965877, 4.353634, 1, 1, 1, 1, 1,
1.864278, -1.684972, 1.859365, 1, 1, 1, 1, 1,
1.893397, 0.931363, 1.427742, 1, 1, 1, 1, 1,
1.913454, -0.3585065, 1.070216, 1, 1, 1, 1, 1,
1.947844, 1.463792, 1.808555, 1, 1, 1, 1, 1,
1.9518, -3.531969, 1.449422, 1, 1, 1, 1, 1,
1.954231, -0.05848194, 0.07442433, 1, 1, 1, 1, 1,
1.960084, 0.02739915, 2.006658, 1, 1, 1, 1, 1,
1.980736, -1.09436, 3.258296, 1, 1, 1, 1, 1,
1.993497, -0.04363329, 1.443057, 1, 1, 1, 1, 1,
2.017787, -0.5770655, 2.155708, 1, 1, 1, 1, 1,
2.018531, -1.818737, 3.427543, 1, 1, 1, 1, 1,
2.019201, -0.3334369, 2.141686, 1, 1, 1, 1, 1,
2.03503, 0.3847251, 1.683192, 1, 1, 1, 1, 1,
2.040967, 0.3898477, 2.746865, 0, 0, 1, 1, 1,
2.069325, 1.115553, 3.208604, 1, 0, 0, 1, 1,
2.087238, 0.05698227, 1.053182, 1, 0, 0, 1, 1,
2.093067, 1.203244, 0.9307273, 1, 0, 0, 1, 1,
2.113403, -0.7974533, 3.036824, 1, 0, 0, 1, 1,
2.138028, 0.4784175, 2.332124, 1, 0, 0, 1, 1,
2.14456, -0.7137296, 3.107897, 0, 0, 0, 1, 1,
2.155246, 0.2563093, 1.585138, 0, 0, 0, 1, 1,
2.172607, 1.376325, 2.10305, 0, 0, 0, 1, 1,
2.238912, -1.115212, 2.653456, 0, 0, 0, 1, 1,
2.253996, 0.8503137, 1.999129, 0, 0, 0, 1, 1,
2.519773, -1.182244, 3.132037, 0, 0, 0, 1, 1,
2.594257, -0.3692158, 0.8185167, 0, 0, 0, 1, 1,
2.631104, -1.811046, 3.575684, 1, 1, 1, 1, 1,
2.640292, -0.3834713, 2.366697, 1, 1, 1, 1, 1,
2.801225, -0.4254256, 1.988664, 1, 1, 1, 1, 1,
2.919226, 1.548358, 0.7962292, 1, 1, 1, 1, 1,
3.012437, -0.1797044, 3.559445, 1, 1, 1, 1, 1,
3.072152, 0.08037633, 1.685963, 1, 1, 1, 1, 1,
3.119688, 0.2816626, 1.045452, 1, 1, 1, 1, 1
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
var radius = 9.551135;
var distance = 33.54795;
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
mvMatrix.translate( 0.1295185, 0.4402338, -0.1017389 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.54795);
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
