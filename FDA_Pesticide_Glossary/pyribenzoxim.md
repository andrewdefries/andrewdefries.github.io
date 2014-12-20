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
-3.207819, 0.5457649, -2.439061, 1, 0, 0, 1,
-2.858297, 0.6950659, -1.573615, 1, 0.007843138, 0, 1,
-2.763791, 0.1331907, -0.1340067, 1, 0.01176471, 0, 1,
-2.735988, 1.438462, -1.45156, 1, 0.01960784, 0, 1,
-2.609007, -0.1360597, -2.610533, 1, 0.02352941, 0, 1,
-2.491519, 2.570162, -1.492879, 1, 0.03137255, 0, 1,
-2.478232, -0.4956132, -1.550557, 1, 0.03529412, 0, 1,
-2.469909, 1.766679, 0.1381211, 1, 0.04313726, 0, 1,
-2.401752, 0.4855138, -0.1726839, 1, 0.04705882, 0, 1,
-2.231674, 1.155297, -2.556625, 1, 0.05490196, 0, 1,
-2.226102, -0.9273783, -2.097804, 1, 0.05882353, 0, 1,
-2.221425, 0.3441063, -1.370694, 1, 0.06666667, 0, 1,
-2.21104, -0.4728239, -2.406905, 1, 0.07058824, 0, 1,
-2.191282, -1.030174, -2.730025, 1, 0.07843138, 0, 1,
-2.185645, 0.2106378, -2.972164, 1, 0.08235294, 0, 1,
-2.180285, -0.09245822, -0.3844055, 1, 0.09019608, 0, 1,
-2.16495, -0.4430671, -2.560303, 1, 0.09411765, 0, 1,
-2.157243, -0.3769934, -0.9732958, 1, 0.1019608, 0, 1,
-2.135004, -0.4988282, -1.823768, 1, 0.1098039, 0, 1,
-2.124619, -0.6703393, -1.885522, 1, 0.1137255, 0, 1,
-2.083493, -0.6783456, -2.753515, 1, 0.1215686, 0, 1,
-2.080143, 0.5159717, -0.00822535, 1, 0.1254902, 0, 1,
-2.070206, 0.4052154, -1.378341, 1, 0.1333333, 0, 1,
-2.051282, 0.04020889, -1.880459, 1, 0.1372549, 0, 1,
-2.033383, 1.057388, -1.113532, 1, 0.145098, 0, 1,
-2.009612, 0.9761486, -0.3619234, 1, 0.1490196, 0, 1,
-1.984861, 0.0108198, -0.5266396, 1, 0.1568628, 0, 1,
-1.978734, -0.6731746, -1.343112, 1, 0.1607843, 0, 1,
-1.976893, 2.410339, -0.259778, 1, 0.1686275, 0, 1,
-1.95876, 0.4801655, 0.3482676, 1, 0.172549, 0, 1,
-1.948579, -1.255388, -1.14698, 1, 0.1803922, 0, 1,
-1.928145, -0.9134941, -2.279651, 1, 0.1843137, 0, 1,
-1.911889, 0.01579287, -1.889569, 1, 0.1921569, 0, 1,
-1.886581, 0.7504231, -1.389637, 1, 0.1960784, 0, 1,
-1.876888, -0.769047, -1.693674, 1, 0.2039216, 0, 1,
-1.863949, 0.6336596, -2.403385, 1, 0.2117647, 0, 1,
-1.861169, 0.275192, -1.080685, 1, 0.2156863, 0, 1,
-1.860803, 1.062925, -2.197381, 1, 0.2235294, 0, 1,
-1.860128, 0.6726423, -1.548229, 1, 0.227451, 0, 1,
-1.843495, -0.6900743, -3.026218, 1, 0.2352941, 0, 1,
-1.842266, 0.09716651, 1.026071, 1, 0.2392157, 0, 1,
-1.815427, 0.4313538, -2.16044, 1, 0.2470588, 0, 1,
-1.814402, 1.851935, -1.248752, 1, 0.2509804, 0, 1,
-1.812876, 0.2901811, -2.255822, 1, 0.2588235, 0, 1,
-1.798577, -0.1725771, -0.4761797, 1, 0.2627451, 0, 1,
-1.794085, -0.479487, -2.320914, 1, 0.2705882, 0, 1,
-1.765452, -0.6051728, -2.784011, 1, 0.2745098, 0, 1,
-1.757415, 1.723903, -0.9713256, 1, 0.282353, 0, 1,
-1.752706, -0.3830129, -2.285972, 1, 0.2862745, 0, 1,
-1.708643, -0.3404811, -0.2465798, 1, 0.2941177, 0, 1,
-1.698726, -0.1234028, -0.9441636, 1, 0.3019608, 0, 1,
-1.688495, 0.3130518, -1.549453, 1, 0.3058824, 0, 1,
-1.681961, 1.170661, -1.809635, 1, 0.3137255, 0, 1,
-1.681121, -0.4974497, -0.204136, 1, 0.3176471, 0, 1,
-1.67855, -1.010055, -0.9996139, 1, 0.3254902, 0, 1,
-1.669946, 0.5263223, -3.210288, 1, 0.3294118, 0, 1,
-1.669476, 1.779052, -2.103276, 1, 0.3372549, 0, 1,
-1.642071, 0.8682266, -0.8107849, 1, 0.3411765, 0, 1,
-1.624879, -0.1408949, -2.373148, 1, 0.3490196, 0, 1,
-1.616453, 0.6505454, -0.6234694, 1, 0.3529412, 0, 1,
-1.608499, 0.499915, -0.263849, 1, 0.3607843, 0, 1,
-1.598076, 2.23657, -1.23489, 1, 0.3647059, 0, 1,
-1.593712, 0.4273975, -2.086798, 1, 0.372549, 0, 1,
-1.591844, -0.6092018, -1.689657, 1, 0.3764706, 0, 1,
-1.573697, 1.587541, -2.629328, 1, 0.3843137, 0, 1,
-1.572152, -1.035347, -2.438627, 1, 0.3882353, 0, 1,
-1.566597, -0.2732856, -1.022899, 1, 0.3960784, 0, 1,
-1.564587, -0.3675279, -1.650622, 1, 0.4039216, 0, 1,
-1.555119, 0.4889946, -0.7208216, 1, 0.4078431, 0, 1,
-1.550751, -1.093009, -1.43207, 1, 0.4156863, 0, 1,
-1.545991, -0.6926764, -3.104983, 1, 0.4196078, 0, 1,
-1.528752, 1.273573, -0.4260685, 1, 0.427451, 0, 1,
-1.514835, -0.1130653, -1.103822, 1, 0.4313726, 0, 1,
-1.511633, 0.4845141, -0.8579527, 1, 0.4392157, 0, 1,
-1.509601, -1.510432, -2.65748, 1, 0.4431373, 0, 1,
-1.508234, -1.015776, -3.583669, 1, 0.4509804, 0, 1,
-1.505563, 1.489931, -1.680671, 1, 0.454902, 0, 1,
-1.505188, -0.02846741, -2.37266, 1, 0.4627451, 0, 1,
-1.500353, -0.8514653, -1.237176, 1, 0.4666667, 0, 1,
-1.497437, 0.681905, -0.288101, 1, 0.4745098, 0, 1,
-1.496879, 1.04827, -0.8440788, 1, 0.4784314, 0, 1,
-1.479881, 0.4805558, -0.4569636, 1, 0.4862745, 0, 1,
-1.470326, -0.4097981, -2.339355, 1, 0.4901961, 0, 1,
-1.462896, -0.4561811, -1.577417, 1, 0.4980392, 0, 1,
-1.45394, -1.537714, -1.764429, 1, 0.5058824, 0, 1,
-1.450732, 2.072926, 0.3465939, 1, 0.509804, 0, 1,
-1.445688, 0.1409812, 0.8706674, 1, 0.5176471, 0, 1,
-1.429927, 1.527707, -0.4585494, 1, 0.5215687, 0, 1,
-1.416197, -0.6709774, -0.7649762, 1, 0.5294118, 0, 1,
-1.414866, -0.5524732, -2.17066, 1, 0.5333334, 0, 1,
-1.413756, -0.411324, -1.872343, 1, 0.5411765, 0, 1,
-1.413117, -1.716865, -3.24945, 1, 0.5450981, 0, 1,
-1.39875, 0.981675, -1.544639, 1, 0.5529412, 0, 1,
-1.389001, -0.8397605, -3.357364, 1, 0.5568628, 0, 1,
-1.388835, 0.4762459, -0.4196625, 1, 0.5647059, 0, 1,
-1.384206, -0.8222986, -1.372856, 1, 0.5686275, 0, 1,
-1.380232, -0.1017955, -0.5485196, 1, 0.5764706, 0, 1,
-1.377132, -0.3469619, -1.880175, 1, 0.5803922, 0, 1,
-1.376683, -2.42521, -0.7355921, 1, 0.5882353, 0, 1,
-1.375838, 0.1237949, -0.2161531, 1, 0.5921569, 0, 1,
-1.346338, 1.266269, -0.3951329, 1, 0.6, 0, 1,
-1.344174, 0.1050868, -2.794322, 1, 0.6078432, 0, 1,
-1.339072, 0.1223093, -0.8283854, 1, 0.6117647, 0, 1,
-1.331757, 1.724892, -1.11699, 1, 0.6196079, 0, 1,
-1.323898, -0.3761235, -0.8938335, 1, 0.6235294, 0, 1,
-1.318307, -1.378473, -4.217376, 1, 0.6313726, 0, 1,
-1.306447, -1.458271, -3.391535, 1, 0.6352941, 0, 1,
-1.303813, -0.01014123, -1.712449, 1, 0.6431373, 0, 1,
-1.302338, -0.2032033, -2.140396, 1, 0.6470588, 0, 1,
-1.284711, -1.080355, -3.872395, 1, 0.654902, 0, 1,
-1.273683, -0.5273179, -2.055186, 1, 0.6588235, 0, 1,
-1.271665, -1.7017, -2.832613, 1, 0.6666667, 0, 1,
-1.268173, 0.6342606, -0.4004174, 1, 0.6705883, 0, 1,
-1.263609, -0.1907963, -2.713511, 1, 0.6784314, 0, 1,
-1.262926, 0.8140123, 1.726619, 1, 0.682353, 0, 1,
-1.259536, 0.03436299, -0.7327779, 1, 0.6901961, 0, 1,
-1.254106, 0.5359253, -0.5153517, 1, 0.6941177, 0, 1,
-1.251411, 1.826981, -0.2091027, 1, 0.7019608, 0, 1,
-1.250362, -0.3390227, -0.9323661, 1, 0.7098039, 0, 1,
-1.249873, -0.4634655, -0.675186, 1, 0.7137255, 0, 1,
-1.247599, -0.300212, -1.239367, 1, 0.7215686, 0, 1,
-1.247417, -3.032377, -2.087754, 1, 0.7254902, 0, 1,
-1.245665, 0.002317996, -0.9370748, 1, 0.7333333, 0, 1,
-1.238786, -1.739405, -3.277255, 1, 0.7372549, 0, 1,
-1.237618, 1.214598, -1.434011, 1, 0.7450981, 0, 1,
-1.231681, -1.558885, -2.032702, 1, 0.7490196, 0, 1,
-1.230144, 1.306444, -0.9644427, 1, 0.7568628, 0, 1,
-1.228748, -1.14831, -2.431802, 1, 0.7607843, 0, 1,
-1.226932, -0.7636999, -1.233288, 1, 0.7686275, 0, 1,
-1.213981, 0.1043452, -0.4971548, 1, 0.772549, 0, 1,
-1.213569, -0.1702244, -1.093418, 1, 0.7803922, 0, 1,
-1.210449, -0.286754, -0.3227398, 1, 0.7843137, 0, 1,
-1.20505, 0.7200168, -1.856792, 1, 0.7921569, 0, 1,
-1.20259, 0.2229977, -1.528737, 1, 0.7960784, 0, 1,
-1.20111, 0.947948, -0.8829697, 1, 0.8039216, 0, 1,
-1.200309, -1.854171, -2.891, 1, 0.8117647, 0, 1,
-1.199161, -0.9600644, -1.575751, 1, 0.8156863, 0, 1,
-1.199008, 0.0178281, -1.262533, 1, 0.8235294, 0, 1,
-1.198202, 0.2585768, -1.38678, 1, 0.827451, 0, 1,
-1.193454, -1.074806, -2.306252, 1, 0.8352941, 0, 1,
-1.189306, 0.6606957, -1.421168, 1, 0.8392157, 0, 1,
-1.181925, 0.7068957, -0.6637359, 1, 0.8470588, 0, 1,
-1.174375, -0.8329688, -1.029214, 1, 0.8509804, 0, 1,
-1.172436, -1.396025, -3.140877, 1, 0.8588235, 0, 1,
-1.172091, -0.7168999, -0.630003, 1, 0.8627451, 0, 1,
-1.169895, 0.3058204, -1.784753, 1, 0.8705882, 0, 1,
-1.164937, -1.084991, -1.964493, 1, 0.8745098, 0, 1,
-1.160997, 1.344973, -0.1403425, 1, 0.8823529, 0, 1,
-1.160743, 0.9336922, -0.6175634, 1, 0.8862745, 0, 1,
-1.144243, -0.6298948, -2.309185, 1, 0.8941177, 0, 1,
-1.124725, 0.407379, 0.5069318, 1, 0.8980392, 0, 1,
-1.120656, -1.330605, -2.035339, 1, 0.9058824, 0, 1,
-1.114673, 1.010189, -0.007123212, 1, 0.9137255, 0, 1,
-1.111178, 0.3790391, -1.202882, 1, 0.9176471, 0, 1,
-1.107825, -0.01189759, -3.43659, 1, 0.9254902, 0, 1,
-1.10719, -1.594539, -2.62822, 1, 0.9294118, 0, 1,
-1.106695, -1.220255, -3.130967, 1, 0.9372549, 0, 1,
-1.091805, 0.1879746, 0.1366188, 1, 0.9411765, 0, 1,
-1.088121, 0.3907947, -1.152258, 1, 0.9490196, 0, 1,
-1.086369, -0.8123641, -1.086805, 1, 0.9529412, 0, 1,
-1.083746, 1.280941, 1.212748, 1, 0.9607843, 0, 1,
-1.078563, -1.696081, -4.750034, 1, 0.9647059, 0, 1,
-1.077678, -1.772714, -2.707947, 1, 0.972549, 0, 1,
-1.077429, -0.5621718, -1.693931, 1, 0.9764706, 0, 1,
-1.073247, -0.6927705, -2.231878, 1, 0.9843137, 0, 1,
-1.062032, 1.98495, -0.3719982, 1, 0.9882353, 0, 1,
-1.060964, 0.3484113, -1.199608, 1, 0.9960784, 0, 1,
-1.050144, 0.2648394, -2.443802, 0.9960784, 1, 0, 1,
-1.048508, 0.08702578, -1.033693, 0.9921569, 1, 0, 1,
-1.048049, 0.4019045, -0.3830235, 0.9843137, 1, 0, 1,
-1.039839, 2.076653, -0.571041, 0.9803922, 1, 0, 1,
-1.026821, 0.169438, -0.8206713, 0.972549, 1, 0, 1,
-1.015133, -0.9231932, -0.9638948, 0.9686275, 1, 0, 1,
-1.013625, -1.805251, -4.096882, 0.9607843, 1, 0, 1,
-1.011989, -0.7371954, -1.402725, 0.9568627, 1, 0, 1,
-1.008184, 1.355888, -0.9346573, 0.9490196, 1, 0, 1,
-1.006937, -1.460966, -3.915719, 0.945098, 1, 0, 1,
-1.002607, 1.377854, 0.4445455, 0.9372549, 1, 0, 1,
-0.9977228, 0.1937018, 0.01429057, 0.9333333, 1, 0, 1,
-0.9911107, 0.4941473, -2.649287, 0.9254902, 1, 0, 1,
-0.9889668, 1.585254, -1.135364, 0.9215686, 1, 0, 1,
-0.9846657, -0.5859319, -2.078256, 0.9137255, 1, 0, 1,
-0.9755545, 0.008918951, -2.18937, 0.9098039, 1, 0, 1,
-0.9736085, -1.073576, -2.556175, 0.9019608, 1, 0, 1,
-0.9657387, 1.873303, -2.791472, 0.8941177, 1, 0, 1,
-0.9628998, 0.1871976, -1.63726, 0.8901961, 1, 0, 1,
-0.9627773, -0.8617196, -2.682648, 0.8823529, 1, 0, 1,
-0.9543303, 0.7773406, -0.7177563, 0.8784314, 1, 0, 1,
-0.9542809, 0.3611246, -2.563719, 0.8705882, 1, 0, 1,
-0.9525774, 1.422857, 0.4526561, 0.8666667, 1, 0, 1,
-0.9445986, 1.255941, -1.426232, 0.8588235, 1, 0, 1,
-0.9440336, -0.5002437, -1.570286, 0.854902, 1, 0, 1,
-0.9422171, -0.926432, -1.339656, 0.8470588, 1, 0, 1,
-0.9417094, 0.02795117, -0.5745928, 0.8431373, 1, 0, 1,
-0.9384258, -0.1350564, -2.044848, 0.8352941, 1, 0, 1,
-0.9384074, -0.4432622, -1.154277, 0.8313726, 1, 0, 1,
-0.9339152, 1.022464, -1.558828, 0.8235294, 1, 0, 1,
-0.9282436, -1.498192, -2.230806, 0.8196079, 1, 0, 1,
-0.9226243, 0.03713978, -1.340336, 0.8117647, 1, 0, 1,
-0.9185774, 0.1114015, -2.012654, 0.8078431, 1, 0, 1,
-0.9170837, 0.3460905, -1.799589, 0.8, 1, 0, 1,
-0.9170775, -0.1808099, -0.02500946, 0.7921569, 1, 0, 1,
-0.903286, 1.841197, -0.4683759, 0.7882353, 1, 0, 1,
-0.8991463, -1.427405, -1.763327, 0.7803922, 1, 0, 1,
-0.896534, -0.147544, -3.050209, 0.7764706, 1, 0, 1,
-0.8918457, -1.497862, -1.896002, 0.7686275, 1, 0, 1,
-0.8844485, -0.8492454, -2.377419, 0.7647059, 1, 0, 1,
-0.8837909, 1.517563, -1.28981, 0.7568628, 1, 0, 1,
-0.8834019, 0.002157767, -1.145117, 0.7529412, 1, 0, 1,
-0.8802515, 1.465869, 0.8917341, 0.7450981, 1, 0, 1,
-0.8762442, 0.3414512, 1.160226, 0.7411765, 1, 0, 1,
-0.8738621, 0.3997658, -2.653654, 0.7333333, 1, 0, 1,
-0.8677956, 0.3588956, 1.384241, 0.7294118, 1, 0, 1,
-0.8581827, 0.5650444, -0.9273988, 0.7215686, 1, 0, 1,
-0.8536195, 0.1195409, -0.7501274, 0.7176471, 1, 0, 1,
-0.8462698, -0.2833143, -1.150006, 0.7098039, 1, 0, 1,
-0.8421929, -0.1184952, -0.9458783, 0.7058824, 1, 0, 1,
-0.8402237, 0.1477726, -0.9045594, 0.6980392, 1, 0, 1,
-0.8305719, -0.05482697, -3.241636, 0.6901961, 1, 0, 1,
-0.8256053, -2.047625, -2.656873, 0.6862745, 1, 0, 1,
-0.8233227, -0.7619207, -1.819701, 0.6784314, 1, 0, 1,
-0.8183978, -0.03982145, -2.560223, 0.6745098, 1, 0, 1,
-0.8040657, 1.221222, -0.5883119, 0.6666667, 1, 0, 1,
-0.8028966, 0.51741, -1.409331, 0.6627451, 1, 0, 1,
-0.8008779, 0.8980268, -0.5075829, 0.654902, 1, 0, 1,
-0.7952218, -0.9831104, -2.308563, 0.6509804, 1, 0, 1,
-0.78908, -0.9454901, -2.868528, 0.6431373, 1, 0, 1,
-0.7872083, -0.1877041, -1.881682, 0.6392157, 1, 0, 1,
-0.7838573, 0.6015146, -1.308765, 0.6313726, 1, 0, 1,
-0.7809576, 0.05967361, 0.363427, 0.627451, 1, 0, 1,
-0.7751044, -0.4003709, -1.739681, 0.6196079, 1, 0, 1,
-0.7691786, -1.386354, -2.315496, 0.6156863, 1, 0, 1,
-0.7659742, 1.054872, -1.803129, 0.6078432, 1, 0, 1,
-0.7649048, -0.8986878, -3.189116, 0.6039216, 1, 0, 1,
-0.76233, 1.23097, 0.8381357, 0.5960785, 1, 0, 1,
-0.7621237, -0.1996027, -1.880851, 0.5882353, 1, 0, 1,
-0.7620566, 1.687988, -1.197268, 0.5843138, 1, 0, 1,
-0.7618741, 1.567919, 0.5182065, 0.5764706, 1, 0, 1,
-0.7602208, -1.889741, -2.687764, 0.572549, 1, 0, 1,
-0.7572716, 1.207512, -0.645337, 0.5647059, 1, 0, 1,
-0.7528499, -0.2126059, -3.263619, 0.5607843, 1, 0, 1,
-0.7412165, -0.5185168, -2.626081, 0.5529412, 1, 0, 1,
-0.7405567, 0.5291626, -0.7959068, 0.5490196, 1, 0, 1,
-0.7253312, 0.7701339, -0.4809858, 0.5411765, 1, 0, 1,
-0.7219084, -1.100456, -4.169738, 0.5372549, 1, 0, 1,
-0.7209951, 0.3381791, -2.682467, 0.5294118, 1, 0, 1,
-0.7187811, 1.537341, -2.48055, 0.5254902, 1, 0, 1,
-0.7116492, -1.320928, -2.810909, 0.5176471, 1, 0, 1,
-0.7086088, 0.9976463, 1.111336, 0.5137255, 1, 0, 1,
-0.7054801, 0.5636852, -1.663549, 0.5058824, 1, 0, 1,
-0.7037765, -1.053255, -4.385585, 0.5019608, 1, 0, 1,
-0.7000387, -0.4434334, -2.255131, 0.4941176, 1, 0, 1,
-0.6969845, -0.2724538, -1.527226, 0.4862745, 1, 0, 1,
-0.6947331, 2.004022, 0.001867842, 0.4823529, 1, 0, 1,
-0.6908087, -0.9006813, -3.177316, 0.4745098, 1, 0, 1,
-0.6821099, -1.003769, -0.2599408, 0.4705882, 1, 0, 1,
-0.6728953, 0.5227824, 0.6881399, 0.4627451, 1, 0, 1,
-0.6684538, -1.02507, -2.589489, 0.4588235, 1, 0, 1,
-0.6614285, -1.270012, -1.267406, 0.4509804, 1, 0, 1,
-0.655156, -0.4426424, -2.720162, 0.4470588, 1, 0, 1,
-0.65224, 2.163939, 0.1024376, 0.4392157, 1, 0, 1,
-0.6508493, -1.526184, -2.494645, 0.4352941, 1, 0, 1,
-0.6455725, 1.772715, 0.1851879, 0.427451, 1, 0, 1,
-0.6450331, 1.257618, 0.1885937, 0.4235294, 1, 0, 1,
-0.6400065, -2.54637, -2.172581, 0.4156863, 1, 0, 1,
-0.6354612, 0.707462, -2.027934, 0.4117647, 1, 0, 1,
-0.633334, 0.5734311, -0.4895611, 0.4039216, 1, 0, 1,
-0.6315685, -0.8952355, -1.478086, 0.3960784, 1, 0, 1,
-0.628419, -0.1296734, -2.583879, 0.3921569, 1, 0, 1,
-0.626882, 1.013478, -0.169947, 0.3843137, 1, 0, 1,
-0.6200455, 0.4351949, -0.7243596, 0.3803922, 1, 0, 1,
-0.6151131, 0.04475254, -1.764146, 0.372549, 1, 0, 1,
-0.613077, -0.4912126, -3.541318, 0.3686275, 1, 0, 1,
-0.6115125, 1.205297, -0.5039321, 0.3607843, 1, 0, 1,
-0.6106196, -0.2480139, -1.415343, 0.3568628, 1, 0, 1,
-0.6093804, -0.09104105, -4.070908, 0.3490196, 1, 0, 1,
-0.6022443, -0.8126936, -4.462907, 0.345098, 1, 0, 1,
-0.601343, 1.224806, 0.03795023, 0.3372549, 1, 0, 1,
-0.5977368, -0.03783579, -2.444034, 0.3333333, 1, 0, 1,
-0.5952666, 0.7423404, -1.295517, 0.3254902, 1, 0, 1,
-0.5903734, -0.3233695, -0.8131034, 0.3215686, 1, 0, 1,
-0.5866873, -0.1357674, -3.223523, 0.3137255, 1, 0, 1,
-0.5849941, -0.6234612, -2.08602, 0.3098039, 1, 0, 1,
-0.5787463, -0.8142015, -5.359549, 0.3019608, 1, 0, 1,
-0.5742049, -1.658051, -2.719332, 0.2941177, 1, 0, 1,
-0.5673978, 1.503959, -1.300598, 0.2901961, 1, 0, 1,
-0.5663555, 0.1503216, -1.575915, 0.282353, 1, 0, 1,
-0.564831, 1.231248, -0.3911298, 0.2784314, 1, 0, 1,
-0.5612944, -0.5137404, -2.127413, 0.2705882, 1, 0, 1,
-0.5569187, -1.096387, -2.730016, 0.2666667, 1, 0, 1,
-0.5534164, -1.567361, -1.725825, 0.2588235, 1, 0, 1,
-0.5525084, 0.06361768, -0.8692697, 0.254902, 1, 0, 1,
-0.5516925, -0.3159603, -2.118838, 0.2470588, 1, 0, 1,
-0.5513134, -1.32903, -2.935255, 0.2431373, 1, 0, 1,
-0.5465747, 1.722409, -1.642445, 0.2352941, 1, 0, 1,
-0.545618, 1.054655, -0.1475881, 0.2313726, 1, 0, 1,
-0.5449769, 2.254986, -0.9177469, 0.2235294, 1, 0, 1,
-0.5444226, 0.0335899, 0.5113564, 0.2196078, 1, 0, 1,
-0.5437066, 2.17722, 0.7966776, 0.2117647, 1, 0, 1,
-0.5423837, 0.04341644, -2.524447, 0.2078431, 1, 0, 1,
-0.5416548, 0.594674, -0.2445249, 0.2, 1, 0, 1,
-0.5410493, 0.06295666, -1.265862, 0.1921569, 1, 0, 1,
-0.5363689, -1.001157, -4.031502, 0.1882353, 1, 0, 1,
-0.5339372, -0.2659862, -2.295288, 0.1803922, 1, 0, 1,
-0.5314528, -1.15522, -3.40391, 0.1764706, 1, 0, 1,
-0.5241172, 0.7369749, -1.334463, 0.1686275, 1, 0, 1,
-0.5199761, -0.05828096, -0.9176001, 0.1647059, 1, 0, 1,
-0.5174071, 0.08906788, -0.7001226, 0.1568628, 1, 0, 1,
-0.5142359, 0.3000908, -1.09981, 0.1529412, 1, 0, 1,
-0.5097401, -0.6129375, -2.284705, 0.145098, 1, 0, 1,
-0.5078032, -0.514105, -1.967695, 0.1411765, 1, 0, 1,
-0.5055693, 1.479686, 0.9471764, 0.1333333, 1, 0, 1,
-0.5039121, 0.6254307, -1.71704, 0.1294118, 1, 0, 1,
-0.5037096, -0.5421972, -0.9497058, 0.1215686, 1, 0, 1,
-0.5002407, 1.70383, -0.3981296, 0.1176471, 1, 0, 1,
-0.4993427, 0.7221508, -0.01045864, 0.1098039, 1, 0, 1,
-0.496993, -0.8619205, -2.591763, 0.1058824, 1, 0, 1,
-0.4935736, -0.1172785, -2.755617, 0.09803922, 1, 0, 1,
-0.4792445, -1.348242, -3.988114, 0.09019608, 1, 0, 1,
-0.4723801, 0.5804546, -0.8457817, 0.08627451, 1, 0, 1,
-0.4631261, 0.5620998, 0.01577047, 0.07843138, 1, 0, 1,
-0.4621837, -1.0217, -2.20497, 0.07450981, 1, 0, 1,
-0.4601403, 1.508648, 0.5591887, 0.06666667, 1, 0, 1,
-0.45975, -0.5588973, -2.754359, 0.0627451, 1, 0, 1,
-0.4565555, -0.4729322, -1.52818, 0.05490196, 1, 0, 1,
-0.4564341, 0.4684355, -1.979469, 0.05098039, 1, 0, 1,
-0.4522623, -0.3710103, -1.650252, 0.04313726, 1, 0, 1,
-0.4472235, 0.821506, -0.2631033, 0.03921569, 1, 0, 1,
-0.4458742, -1.44887, -1.653345, 0.03137255, 1, 0, 1,
-0.4454905, 1.362087, 0.1557812, 0.02745098, 1, 0, 1,
-0.4449096, 0.6355976, -0.7657629, 0.01960784, 1, 0, 1,
-0.4437328, 0.0636313, -2.260873, 0.01568628, 1, 0, 1,
-0.4373733, -0.2680333, -3.452379, 0.007843138, 1, 0, 1,
-0.4333836, 0.6439341, -1.226557, 0.003921569, 1, 0, 1,
-0.4324849, -0.5729671, -1.709333, 0, 1, 0.003921569, 1,
-0.4283012, 1.144007, -0.4387786, 0, 1, 0.01176471, 1,
-0.4282982, 0.1364436, -1.214455, 0, 1, 0.01568628, 1,
-0.4263082, 2.668046, -1.112907, 0, 1, 0.02352941, 1,
-0.4258983, 2.053184, 1.296212, 0, 1, 0.02745098, 1,
-0.4227902, 0.8687518, -3.31046, 0, 1, 0.03529412, 1,
-0.4220381, 0.05217319, -2.497527, 0, 1, 0.03921569, 1,
-0.4180667, -0.7949473, -3.505899, 0, 1, 0.04705882, 1,
-0.4168006, 0.3318541, -0.5889744, 0, 1, 0.05098039, 1,
-0.4106845, 0.8877124, 0.7440765, 0, 1, 0.05882353, 1,
-0.4091103, 0.2379278, 0.01481424, 0, 1, 0.0627451, 1,
-0.4053823, 0.2646016, -0.8052575, 0, 1, 0.07058824, 1,
-0.4050162, 0.002329405, -0.8406055, 0, 1, 0.07450981, 1,
-0.403883, -0.9359272, -2.442119, 0, 1, 0.08235294, 1,
-0.4027719, 0.06963616, -1.75482, 0, 1, 0.08627451, 1,
-0.4004603, 0.6284239, 0.601196, 0, 1, 0.09411765, 1,
-0.3994896, -0.9582517, -2.19294, 0, 1, 0.1019608, 1,
-0.3987257, -0.8178239, -1.454213, 0, 1, 0.1058824, 1,
-0.3986974, 0.9471892, -1.060547, 0, 1, 0.1137255, 1,
-0.392172, 0.1720171, -1.861572, 0, 1, 0.1176471, 1,
-0.3918973, -1.563337, -5.612089, 0, 1, 0.1254902, 1,
-0.3890015, -0.7744572, -3.169019, 0, 1, 0.1294118, 1,
-0.3844136, -0.5901617, -4.760353, 0, 1, 0.1372549, 1,
-0.3814724, 1.857702, 0.8566059, 0, 1, 0.1411765, 1,
-0.3813314, -1.0238, -2.776168, 0, 1, 0.1490196, 1,
-0.3798072, 0.1144367, -1.475078, 0, 1, 0.1529412, 1,
-0.378956, 0.9982372, 0.1105506, 0, 1, 0.1607843, 1,
-0.3759263, -0.5835685, -3.10523, 0, 1, 0.1647059, 1,
-0.3750806, 0.8727338, -2.055355, 0, 1, 0.172549, 1,
-0.3635661, 1.008513, -0.9820618, 0, 1, 0.1764706, 1,
-0.357747, 0.1011865, -1.546595, 0, 1, 0.1843137, 1,
-0.3545839, 0.1624892, -1.557677, 0, 1, 0.1882353, 1,
-0.3531042, 1.162265, 0.3066148, 0, 1, 0.1960784, 1,
-0.3528919, -0.8930304, -1.96238, 0, 1, 0.2039216, 1,
-0.3508019, -0.5214868, -2.829733, 0, 1, 0.2078431, 1,
-0.3403084, 1.530492, 0.4538255, 0, 1, 0.2156863, 1,
-0.3368081, 0.03499627, -1.441954, 0, 1, 0.2196078, 1,
-0.3360239, -0.3979059, -1.069728, 0, 1, 0.227451, 1,
-0.3320937, -0.4003364, -2.477757, 0, 1, 0.2313726, 1,
-0.332083, -1.376854, -2.905015, 0, 1, 0.2392157, 1,
-0.3292894, 0.2268167, -1.474227, 0, 1, 0.2431373, 1,
-0.3266114, -0.7519196, -2.545878, 0, 1, 0.2509804, 1,
-0.3252283, 0.5988997, -1.338565, 0, 1, 0.254902, 1,
-0.3233676, 1.024955, -0.5447569, 0, 1, 0.2627451, 1,
-0.3197756, -0.5168158, -2.626258, 0, 1, 0.2666667, 1,
-0.3193872, -0.005614207, -1.058545, 0, 1, 0.2745098, 1,
-0.3152492, -0.1799078, -2.980262, 0, 1, 0.2784314, 1,
-0.3123612, 0.2302145, -2.339192, 0, 1, 0.2862745, 1,
-0.3049136, -0.3151001, -0.2428668, 0, 1, 0.2901961, 1,
-0.3000845, -1.91426, -3.370203, 0, 1, 0.2980392, 1,
-0.2948627, 0.7069045, -0.07879321, 0, 1, 0.3058824, 1,
-0.2935177, 0.7846292, -0.02301783, 0, 1, 0.3098039, 1,
-0.2887203, 0.584623, -0.5116408, 0, 1, 0.3176471, 1,
-0.2859809, 0.5998175, -0.7301906, 0, 1, 0.3215686, 1,
-0.2815981, -0.6594736, -3.851477, 0, 1, 0.3294118, 1,
-0.2810927, -0.07700974, -2.447212, 0, 1, 0.3333333, 1,
-0.2798617, -0.834068, -2.728468, 0, 1, 0.3411765, 1,
-0.2774732, 0.2536962, -0.6321183, 0, 1, 0.345098, 1,
-0.2763416, -1.007945, -2.214364, 0, 1, 0.3529412, 1,
-0.2736158, 1.245976, 0.3674969, 0, 1, 0.3568628, 1,
-0.2732066, -0.9377417, -4.697503, 0, 1, 0.3647059, 1,
-0.2727677, 0.9344164, -1.200231, 0, 1, 0.3686275, 1,
-0.2712356, 0.2881236, 0.8648169, 0, 1, 0.3764706, 1,
-0.2694853, -1.541041, -2.219577, 0, 1, 0.3803922, 1,
-0.2676834, 0.8633095, 0.5115263, 0, 1, 0.3882353, 1,
-0.2672481, 0.4816986, 0.05504109, 0, 1, 0.3921569, 1,
-0.2638331, -0.9583764, -4.262728, 0, 1, 0.4, 1,
-0.262596, -1.310032, -2.277283, 0, 1, 0.4078431, 1,
-0.2593347, 1.353569, 0.3901059, 0, 1, 0.4117647, 1,
-0.2535578, 0.525382, 1.081436, 0, 1, 0.4196078, 1,
-0.2504606, 0.7549219, -0.07688528, 0, 1, 0.4235294, 1,
-0.244899, 0.04072261, -0.6688436, 0, 1, 0.4313726, 1,
-0.2437456, -1.099052, -0.9440871, 0, 1, 0.4352941, 1,
-0.2420192, 0.2080198, -0.3015944, 0, 1, 0.4431373, 1,
-0.2397161, -0.7956821, -2.57859, 0, 1, 0.4470588, 1,
-0.2394587, -1.622847, -2.117967, 0, 1, 0.454902, 1,
-0.2373504, 0.5319726, 0.652208, 0, 1, 0.4588235, 1,
-0.2360554, -0.4928149, -0.8780841, 0, 1, 0.4666667, 1,
-0.232627, -0.9871876, -3.669027, 0, 1, 0.4705882, 1,
-0.2297995, -0.2420591, -4.223554, 0, 1, 0.4784314, 1,
-0.2286856, 0.6945452, 1.194231, 0, 1, 0.4823529, 1,
-0.2282666, -0.793716, -2.712071, 0, 1, 0.4901961, 1,
-0.2208352, 0.7511758, -0.6135535, 0, 1, 0.4941176, 1,
-0.2204406, -0.8843365, -3.035894, 0, 1, 0.5019608, 1,
-0.2200594, -0.4748754, -1.457137, 0, 1, 0.509804, 1,
-0.2174911, 0.9141371, 0.005111048, 0, 1, 0.5137255, 1,
-0.2165183, -1.575747, -2.239761, 0, 1, 0.5215687, 1,
-0.2152735, -0.3267468, -1.974792, 0, 1, 0.5254902, 1,
-0.2149237, 0.8906422, 1.841572, 0, 1, 0.5333334, 1,
-0.2129072, -1.800002, -2.178094, 0, 1, 0.5372549, 1,
-0.2125133, -1.30014, -4.595145, 0, 1, 0.5450981, 1,
-0.2110642, -1.402087, -4.720512, 0, 1, 0.5490196, 1,
-0.2072302, 0.7072197, -1.669726, 0, 1, 0.5568628, 1,
-0.2055054, 0.321819, -1.276658, 0, 1, 0.5607843, 1,
-0.2048173, 0.05098097, -3.247273, 0, 1, 0.5686275, 1,
-0.2022105, 0.02748304, -0.4923364, 0, 1, 0.572549, 1,
-0.2007094, 1.502606, 0.3758728, 0, 1, 0.5803922, 1,
-0.1988636, -0.3949031, -2.332371, 0, 1, 0.5843138, 1,
-0.1984505, -0.05475067, -3.566985, 0, 1, 0.5921569, 1,
-0.1972307, -1.654225, -3.180801, 0, 1, 0.5960785, 1,
-0.195054, -1.607166, -2.08333, 0, 1, 0.6039216, 1,
-0.1948069, 0.9387431, 1.522342, 0, 1, 0.6117647, 1,
-0.1909136, 0.8417796, -1.153336, 0, 1, 0.6156863, 1,
-0.1905309, -0.4717311, -3.239176, 0, 1, 0.6235294, 1,
-0.1898603, -0.2239601, -0.9506286, 0, 1, 0.627451, 1,
-0.1870082, 0.2082277, -2.082673, 0, 1, 0.6352941, 1,
-0.1842647, -1.886402, -3.274027, 0, 1, 0.6392157, 1,
-0.1804724, -1.289026, -1.455998, 0, 1, 0.6470588, 1,
-0.1774001, 0.2671438, -1.107125, 0, 1, 0.6509804, 1,
-0.1761952, 1.046444, -0.9532028, 0, 1, 0.6588235, 1,
-0.1758308, 0.09226732, -1.118624, 0, 1, 0.6627451, 1,
-0.1743553, -0.6291533, -4.075499, 0, 1, 0.6705883, 1,
-0.1701382, -1.247831, -3.314523, 0, 1, 0.6745098, 1,
-0.1679579, -0.4471789, -4.088075, 0, 1, 0.682353, 1,
-0.1654831, -1.405252, -3.002767, 0, 1, 0.6862745, 1,
-0.1651228, 0.9978728, 1.503918, 0, 1, 0.6941177, 1,
-0.1636496, -1.674132, -4.140028, 0, 1, 0.7019608, 1,
-0.1631879, 0.1482467, 0.3368252, 0, 1, 0.7058824, 1,
-0.1609736, -1.270663, -2.622664, 0, 1, 0.7137255, 1,
-0.1606811, 0.589123, -1.344272, 0, 1, 0.7176471, 1,
-0.1605004, 2.109789, 1.913613, 0, 1, 0.7254902, 1,
-0.1571801, 1.298663, 0.9215719, 0, 1, 0.7294118, 1,
-0.1531124, -0.9484625, -2.008007, 0, 1, 0.7372549, 1,
-0.1503059, 0.06282635, -0.4731223, 0, 1, 0.7411765, 1,
-0.1481888, 0.2694917, -0.3658803, 0, 1, 0.7490196, 1,
-0.1412049, 0.774423, 2.091862, 0, 1, 0.7529412, 1,
-0.1396636, 1.006254, -0.747293, 0, 1, 0.7607843, 1,
-0.1368572, 0.1217456, -2.051393, 0, 1, 0.7647059, 1,
-0.1361582, 0.6499066, -0.8243825, 0, 1, 0.772549, 1,
-0.1349291, -0.9324753, -2.613747, 0, 1, 0.7764706, 1,
-0.1304029, 0.1958354, 0.1157993, 0, 1, 0.7843137, 1,
-0.1303388, 2.505335, -0.8358448, 0, 1, 0.7882353, 1,
-0.1296635, 0.5519896, 0.551844, 0, 1, 0.7960784, 1,
-0.1291233, 1.351298, -0.4186789, 0, 1, 0.8039216, 1,
-0.1287173, -1.44355, -2.300215, 0, 1, 0.8078431, 1,
-0.1264138, 1.229818, -0.5553543, 0, 1, 0.8156863, 1,
-0.1250148, -1.251132, -1.260045, 0, 1, 0.8196079, 1,
-0.1213927, -0.5492335, -1.762815, 0, 1, 0.827451, 1,
-0.1143058, 0.6616663, -0.5898717, 0, 1, 0.8313726, 1,
-0.1136594, -0.803978, -2.54869, 0, 1, 0.8392157, 1,
-0.1056489, 0.2557473, 1.05543, 0, 1, 0.8431373, 1,
-0.1050128, 0.1961592, -1.373153, 0, 1, 0.8509804, 1,
-0.1022262, -1.878457, -3.749129, 0, 1, 0.854902, 1,
-0.1009794, 1.585991, 0.5060546, 0, 1, 0.8627451, 1,
-0.1004333, 0.1221648, -1.019499, 0, 1, 0.8666667, 1,
-0.09990107, 1.353085, -0.6634826, 0, 1, 0.8745098, 1,
-0.09878635, -1.26989, -4.040092, 0, 1, 0.8784314, 1,
-0.09616011, 0.2105695, -0.654394, 0, 1, 0.8862745, 1,
-0.09519277, -0.7878432, -3.005949, 0, 1, 0.8901961, 1,
-0.08001897, 0.6663164, -0.08279537, 0, 1, 0.8980392, 1,
-0.07829866, 0.2648008, -0.06498821, 0, 1, 0.9058824, 1,
-0.07805064, 1.024704, 0.4077451, 0, 1, 0.9098039, 1,
-0.07749391, 0.6662522, 1.271513, 0, 1, 0.9176471, 1,
-0.0724779, 0.5127002, 0.0001398152, 0, 1, 0.9215686, 1,
-0.06998143, 0.1506778, -0.1258201, 0, 1, 0.9294118, 1,
-0.068153, -0.8007478, -1.710892, 0, 1, 0.9333333, 1,
-0.06556035, -0.1331209, -1.346508, 0, 1, 0.9411765, 1,
-0.06475828, -1.202567, -1.597663, 0, 1, 0.945098, 1,
-0.06386341, 0.7559248, 0.253519, 0, 1, 0.9529412, 1,
-0.06375471, 0.5188482, -0.2047866, 0, 1, 0.9568627, 1,
-0.06357505, 2.47112, 0.7900802, 0, 1, 0.9647059, 1,
-0.06221655, 1.153606, 0.9167794, 0, 1, 0.9686275, 1,
-0.06139217, 0.1196759, -0.7816766, 0, 1, 0.9764706, 1,
-0.06022584, -0.2344523, -2.744743, 0, 1, 0.9803922, 1,
-0.0595219, 0.2441538, -0.3194901, 0, 1, 0.9882353, 1,
-0.05098737, 1.189812, -0.1980622, 0, 1, 0.9921569, 1,
-0.04823761, 0.3130935, 0.1508288, 0, 1, 1, 1,
-0.04568153, -1.938865, -2.571929, 0, 0.9921569, 1, 1,
-0.0441378, -0.7520091, -2.871608, 0, 0.9882353, 1, 1,
-0.04351223, 1.904364, 1.019003, 0, 0.9803922, 1, 1,
-0.04296212, 0.8691096, -0.7475282, 0, 0.9764706, 1, 1,
-0.04294236, -0.4621609, -2.532122, 0, 0.9686275, 1, 1,
-0.04274512, -1.300852, -3.114557, 0, 0.9647059, 1, 1,
-0.04128344, -0.6175419, -3.500282, 0, 0.9568627, 1, 1,
-0.0352462, 1.303265, 1.512879, 0, 0.9529412, 1, 1,
-0.03431158, 1.197853, -0.2268182, 0, 0.945098, 1, 1,
-0.03268852, 2.684267, 1.245083, 0, 0.9411765, 1, 1,
-0.03048867, 0.9101444, -0.4114277, 0, 0.9333333, 1, 1,
-0.02584937, 1.666537, -0.2609907, 0, 0.9294118, 1, 1,
-0.0199041, -1.5453, -3.925097, 0, 0.9215686, 1, 1,
-0.01877666, -1.470836, -4.118309, 0, 0.9176471, 1, 1,
-0.007946427, -0.2273609, -4.725339, 0, 0.9098039, 1, 1,
-0.004164173, 0.5275033, 1.560524, 0, 0.9058824, 1, 1,
-0.001790686, -0.3543094, -3.107045, 0, 0.8980392, 1, 1,
0.0009468507, -0.007528124, 4.533117, 0, 0.8901961, 1, 1,
0.006221979, -0.1344661, 3.205721, 0, 0.8862745, 1, 1,
0.007894273, 1.490109, -0.1404928, 0, 0.8784314, 1, 1,
0.009537988, -1.282691, 2.824527, 0, 0.8745098, 1, 1,
0.01209701, 0.5430538, -0.9616483, 0, 0.8666667, 1, 1,
0.01655851, 0.8799189, -0.08989, 0, 0.8627451, 1, 1,
0.01737613, -2.433223, 5.02837, 0, 0.854902, 1, 1,
0.01780535, -0.0544706, 3.99292, 0, 0.8509804, 1, 1,
0.02208794, 0.3262294, -1.239008, 0, 0.8431373, 1, 1,
0.025938, 0.339231, 0.2118236, 0, 0.8392157, 1, 1,
0.02671811, 0.6422653, -0.9115783, 0, 0.8313726, 1, 1,
0.030664, -0.8664368, 2.899834, 0, 0.827451, 1, 1,
0.03109334, -0.6051511, 2.819327, 0, 0.8196079, 1, 1,
0.03124227, -0.03523161, 0.5415018, 0, 0.8156863, 1, 1,
0.03963286, 0.2569697, 1.989497, 0, 0.8078431, 1, 1,
0.04081602, -0.4179485, 3.102765, 0, 0.8039216, 1, 1,
0.04111726, -2.597231, 2.597172, 0, 0.7960784, 1, 1,
0.04455724, -1.740359, 2.432553, 0, 0.7882353, 1, 1,
0.04974629, 0.9824383, -0.5054582, 0, 0.7843137, 1, 1,
0.05016676, -0.07958269, 2.86252, 0, 0.7764706, 1, 1,
0.05029561, -2.082544, 2.11211, 0, 0.772549, 1, 1,
0.05951356, -0.855104, 4.137682, 0, 0.7647059, 1, 1,
0.06157226, -1.823357, 3.667713, 0, 0.7607843, 1, 1,
0.06294398, -0.5544787, 3.508008, 0, 0.7529412, 1, 1,
0.06379966, -0.9826567, 2.752542, 0, 0.7490196, 1, 1,
0.06944191, -0.6501386, 2.118343, 0, 0.7411765, 1, 1,
0.06972574, -0.6011701, 2.464899, 0, 0.7372549, 1, 1,
0.06997182, 0.801528, 0.7632434, 0, 0.7294118, 1, 1,
0.07384327, 1.973055, -1.228619, 0, 0.7254902, 1, 1,
0.07993507, 0.3647382, 0.878939, 0, 0.7176471, 1, 1,
0.08134854, 0.9172655, -0.03555881, 0, 0.7137255, 1, 1,
0.08313362, -1.016218, 1.572133, 0, 0.7058824, 1, 1,
0.08480911, -0.06291807, 1.29841, 0, 0.6980392, 1, 1,
0.08867745, -0.7145585, 3.980568, 0, 0.6941177, 1, 1,
0.08956567, -1.355423, 2.251764, 0, 0.6862745, 1, 1,
0.09298125, 0.1209254, 0.2966276, 0, 0.682353, 1, 1,
0.09346449, -0.5903332, 2.866386, 0, 0.6745098, 1, 1,
0.09860269, 0.5808586, 0.7757432, 0, 0.6705883, 1, 1,
0.1022916, 1.005976, -1.08848, 0, 0.6627451, 1, 1,
0.1027505, -0.1718888, 2.204353, 0, 0.6588235, 1, 1,
0.1042154, 2.252988, -0.3340163, 0, 0.6509804, 1, 1,
0.1156476, 1.821465, -0.1537001, 0, 0.6470588, 1, 1,
0.1159534, 0.8478931, 0.5593996, 0, 0.6392157, 1, 1,
0.1182633, -0.257463, 1.975278, 0, 0.6352941, 1, 1,
0.1196302, -0.2391571, 2.83441, 0, 0.627451, 1, 1,
0.1222973, -0.6656467, 3.237552, 0, 0.6235294, 1, 1,
0.1228552, -0.4906943, 2.373592, 0, 0.6156863, 1, 1,
0.1228894, -1.028722, 1.774549, 0, 0.6117647, 1, 1,
0.1238775, 0.2620929, 1.852935, 0, 0.6039216, 1, 1,
0.1352385, -0.1829218, 2.887369, 0, 0.5960785, 1, 1,
0.1355902, -1.496425, 3.648637, 0, 0.5921569, 1, 1,
0.1383334, -2.339733, 1.821263, 0, 0.5843138, 1, 1,
0.1485784, 0.3661319, -0.4696864, 0, 0.5803922, 1, 1,
0.1488582, -0.9089406, 3.227434, 0, 0.572549, 1, 1,
0.1497341, 2.361545, 0.7347549, 0, 0.5686275, 1, 1,
0.1499837, -0.2098411, 3.57954, 0, 0.5607843, 1, 1,
0.1512409, -1.292758, 4.375731, 0, 0.5568628, 1, 1,
0.1514662, -1.056255, 2.594254, 0, 0.5490196, 1, 1,
0.1527669, -0.9103283, 1.953223, 0, 0.5450981, 1, 1,
0.154428, 0.04414896, -0.2628351, 0, 0.5372549, 1, 1,
0.1559067, -0.3412975, 3.140558, 0, 0.5333334, 1, 1,
0.156514, 1.240456, 0.09489001, 0, 0.5254902, 1, 1,
0.1590106, 1.009194, -0.02207784, 0, 0.5215687, 1, 1,
0.1615667, 0.2729228, 0.3949773, 0, 0.5137255, 1, 1,
0.1646293, 0.5014302, 0.2024656, 0, 0.509804, 1, 1,
0.1649912, -0.07359252, 3.142705, 0, 0.5019608, 1, 1,
0.1674625, 0.6827585, 0.2645288, 0, 0.4941176, 1, 1,
0.1674758, 1.394784, -0.5692334, 0, 0.4901961, 1, 1,
0.1719564, 1.344674, -0.7896711, 0, 0.4823529, 1, 1,
0.1729013, 0.006703889, 2.7377, 0, 0.4784314, 1, 1,
0.1736826, 1.654304, -0.210366, 0, 0.4705882, 1, 1,
0.178762, -0.4623865, 3.061942, 0, 0.4666667, 1, 1,
0.1821764, 1.120084, 1.001282, 0, 0.4588235, 1, 1,
0.1827167, 1.152982, 0.2166608, 0, 0.454902, 1, 1,
0.1840224, -0.03446946, 0.7542546, 0, 0.4470588, 1, 1,
0.1859661, -0.01375241, 1.115574, 0, 0.4431373, 1, 1,
0.1883676, -0.5507332, 3.718574, 0, 0.4352941, 1, 1,
0.1889247, -0.06758273, 1.058823, 0, 0.4313726, 1, 1,
0.1894643, -1.834052, 3.060225, 0, 0.4235294, 1, 1,
0.1910818, -1.475793, 3.82477, 0, 0.4196078, 1, 1,
0.1914569, -0.673982, 2.094666, 0, 0.4117647, 1, 1,
0.1928733, 0.1938109, -0.691945, 0, 0.4078431, 1, 1,
0.1946557, -0.02542225, -0.6166683, 0, 0.4, 1, 1,
0.196048, 0.6116915, -0.2744845, 0, 0.3921569, 1, 1,
0.2031168, 2.108178, -0.5646124, 0, 0.3882353, 1, 1,
0.204156, 0.6117768, -1.140669, 0, 0.3803922, 1, 1,
0.205026, 1.442022, -0.2146715, 0, 0.3764706, 1, 1,
0.2065959, -0.4961093, 3.751629, 0, 0.3686275, 1, 1,
0.2105324, 0.5948678, 0.4150091, 0, 0.3647059, 1, 1,
0.211205, 0.5880545, 1.901555, 0, 0.3568628, 1, 1,
0.2124768, -1.223599, 2.299851, 0, 0.3529412, 1, 1,
0.2154809, 0.09787147, 0.7731577, 0, 0.345098, 1, 1,
0.216341, -0.1215904, 3.494753, 0, 0.3411765, 1, 1,
0.2206627, 0.6244283, 1.507174, 0, 0.3333333, 1, 1,
0.224647, -0.002567778, 1.390072, 0, 0.3294118, 1, 1,
0.2255607, 1.199592, -0.9408427, 0, 0.3215686, 1, 1,
0.2257221, -1.322152, 0.393972, 0, 0.3176471, 1, 1,
0.2259009, -0.9737456, 2.982695, 0, 0.3098039, 1, 1,
0.2267074, -1.492868, 3.906577, 0, 0.3058824, 1, 1,
0.229638, -1.924158, 3.728606, 0, 0.2980392, 1, 1,
0.230145, -0.7104601, 1.430388, 0, 0.2901961, 1, 1,
0.2352715, -0.138296, 1.469112, 0, 0.2862745, 1, 1,
0.2357806, -0.9834018, 5.173672, 0, 0.2784314, 1, 1,
0.2369123, 0.4384491, -0.7559785, 0, 0.2745098, 1, 1,
0.2388369, -1.36463, 2.587604, 0, 0.2666667, 1, 1,
0.2389942, -2.517644, 3.391216, 0, 0.2627451, 1, 1,
0.2431572, -0.6134272, 3.393837, 0, 0.254902, 1, 1,
0.2477822, 1.602014, 0.7170386, 0, 0.2509804, 1, 1,
0.2533931, -0.30089, 2.971829, 0, 0.2431373, 1, 1,
0.2539309, -0.01912321, 1.15683, 0, 0.2392157, 1, 1,
0.259024, 0.8087006, -0.3479894, 0, 0.2313726, 1, 1,
0.2624929, 0.6978567, -0.6433028, 0, 0.227451, 1, 1,
0.2633129, 0.241332, -1.005049, 0, 0.2196078, 1, 1,
0.2640219, -0.2419413, 0.818995, 0, 0.2156863, 1, 1,
0.2668905, -0.7543142, 3.18368, 0, 0.2078431, 1, 1,
0.2681251, -1.007093, 1.990271, 0, 0.2039216, 1, 1,
0.2715261, 0.824529, -1.250489, 0, 0.1960784, 1, 1,
0.2726398, 0.4529594, 2.466755, 0, 0.1882353, 1, 1,
0.2753416, -0.2850581, 1.912495, 0, 0.1843137, 1, 1,
0.2766619, -1.07757, 3.019256, 0, 0.1764706, 1, 1,
0.2825533, -0.8075514, 4.704786, 0, 0.172549, 1, 1,
0.2862177, -0.09223884, 1.449175, 0, 0.1647059, 1, 1,
0.2878495, -1.040131, 3.866856, 0, 0.1607843, 1, 1,
0.2878571, 0.4480805, -0.02105478, 0, 0.1529412, 1, 1,
0.2880437, 0.1991585, 2.33255, 0, 0.1490196, 1, 1,
0.2898538, 1.329661, 0.5557455, 0, 0.1411765, 1, 1,
0.2914492, -0.390538, 3.485475, 0, 0.1372549, 1, 1,
0.2981359, -0.4511206, 3.621382, 0, 0.1294118, 1, 1,
0.3007722, 0.07197877, 1.928693, 0, 0.1254902, 1, 1,
0.3044014, -0.0952841, 2.153386, 0, 0.1176471, 1, 1,
0.3156051, 0.2749595, -0.8814122, 0, 0.1137255, 1, 1,
0.3168846, 0.8398713, 0.5159755, 0, 0.1058824, 1, 1,
0.3198126, -0.5125384, 3.366824, 0, 0.09803922, 1, 1,
0.3206734, -0.9686286, 4.116731, 0, 0.09411765, 1, 1,
0.3259096, -0.4946507, 2.696553, 0, 0.08627451, 1, 1,
0.3293144, 0.8334538, 0.8921058, 0, 0.08235294, 1, 1,
0.329553, -0.1341777, 0.1009942, 0, 0.07450981, 1, 1,
0.3313679, 0.2304212, 2.303953, 0, 0.07058824, 1, 1,
0.3341147, -1.053305, 1.87427, 0, 0.0627451, 1, 1,
0.3346452, 0.7822056, 0.0121687, 0, 0.05882353, 1, 1,
0.3352055, -0.9976172, 2.313534, 0, 0.05098039, 1, 1,
0.3412304, -0.01454256, 1.398736, 0, 0.04705882, 1, 1,
0.3416619, 0.3508461, 0.7794192, 0, 0.03921569, 1, 1,
0.3470904, -1.548272, 2.489899, 0, 0.03529412, 1, 1,
0.3516092, -0.7204053, 3.827614, 0, 0.02745098, 1, 1,
0.3529258, 1.27422, 0.6376976, 0, 0.02352941, 1, 1,
0.3537144, -0.428006, 5.0873, 0, 0.01568628, 1, 1,
0.3551117, -1.316702, 3.808469, 0, 0.01176471, 1, 1,
0.3615004, -0.1634768, 3.86182, 0, 0.003921569, 1, 1,
0.3669744, -0.3632155, 2.668681, 0.003921569, 0, 1, 1,
0.3712516, -1.511799, 2.891733, 0.007843138, 0, 1, 1,
0.371818, 0.7926495, 1.068164, 0.01568628, 0, 1, 1,
0.3719168, 1.082203, -0.06491725, 0.01960784, 0, 1, 1,
0.3733837, -1.457189, 1.457548, 0.02745098, 0, 1, 1,
0.3763474, 0.3639291, 1.102864, 0.03137255, 0, 1, 1,
0.3767457, 0.7264836, -0.05309452, 0.03921569, 0, 1, 1,
0.3799712, 0.7927241, 0.6706936, 0.04313726, 0, 1, 1,
0.3805155, -0.884461, 4.02253, 0.05098039, 0, 1, 1,
0.3824358, -1.794239, 4.271605, 0.05490196, 0, 1, 1,
0.3848862, 0.06545144, -1.069892, 0.0627451, 0, 1, 1,
0.386894, 0.1477005, 0.217408, 0.06666667, 0, 1, 1,
0.3898839, 0.6971908, 0.2558123, 0.07450981, 0, 1, 1,
0.3947146, 0.4324814, -0.1015566, 0.07843138, 0, 1, 1,
0.3956595, -0.5903012, 2.84476, 0.08627451, 0, 1, 1,
0.395671, -0.398117, 3.233419, 0.09019608, 0, 1, 1,
0.3969455, 0.7733854, 3.00771, 0.09803922, 0, 1, 1,
0.3987301, 0.2828732, 2.877239, 0.1058824, 0, 1, 1,
0.401313, -1.478818, 3.534126, 0.1098039, 0, 1, 1,
0.4026835, -0.5957032, -0.2341484, 0.1176471, 0, 1, 1,
0.4072083, -1.064821, 3.387594, 0.1215686, 0, 1, 1,
0.4076526, -1.312346, 4.814527, 0.1294118, 0, 1, 1,
0.4088493, 0.7780858, 0.2135867, 0.1333333, 0, 1, 1,
0.4105517, -0.3642991, 1.047815, 0.1411765, 0, 1, 1,
0.4152164, -0.6480647, 4.107623, 0.145098, 0, 1, 1,
0.4152966, -0.2492827, 2.160119, 0.1529412, 0, 1, 1,
0.419686, -0.2328368, 2.217407, 0.1568628, 0, 1, 1,
0.4214118, 0.1736628, 1.658966, 0.1647059, 0, 1, 1,
0.4239413, 0.1781411, -1.29681, 0.1686275, 0, 1, 1,
0.4239974, -1.238701, 2.845583, 0.1764706, 0, 1, 1,
0.4250993, -1.547463, 2.740313, 0.1803922, 0, 1, 1,
0.4255649, 0.9183815, 0.5419319, 0.1882353, 0, 1, 1,
0.4263694, -1.797328, 4.016512, 0.1921569, 0, 1, 1,
0.4308901, 0.751991, 0.1481674, 0.2, 0, 1, 1,
0.4313076, 1.097557, -0.7251357, 0.2078431, 0, 1, 1,
0.4377299, -1.532506, 2.854687, 0.2117647, 0, 1, 1,
0.4381528, -0.7938463, 1.715066, 0.2196078, 0, 1, 1,
0.4467465, -0.6004231, 3.08763, 0.2235294, 0, 1, 1,
0.451352, -0.4324011, 2.459166, 0.2313726, 0, 1, 1,
0.4516813, -1.222134, 4.056201, 0.2352941, 0, 1, 1,
0.4603657, 1.17425, -1.277744, 0.2431373, 0, 1, 1,
0.4617425, 0.09433974, 1.318659, 0.2470588, 0, 1, 1,
0.4652838, -1.643617, 4.622782, 0.254902, 0, 1, 1,
0.4664877, -0.2281265, 4.787939, 0.2588235, 0, 1, 1,
0.4727794, -0.05203638, 2.167116, 0.2666667, 0, 1, 1,
0.4740466, -1.032781, 3.490511, 0.2705882, 0, 1, 1,
0.4753109, -1.172789, 2.41907, 0.2784314, 0, 1, 1,
0.4760264, 0.3735299, 1.993209, 0.282353, 0, 1, 1,
0.4788458, -0.5622296, 2.202855, 0.2901961, 0, 1, 1,
0.4813527, -0.317626, 2.419435, 0.2941177, 0, 1, 1,
0.4832161, 0.01142474, 0.6323241, 0.3019608, 0, 1, 1,
0.4856198, 0.7481412, 2.024129, 0.3098039, 0, 1, 1,
0.4885421, 0.5711201, -0.2942387, 0.3137255, 0, 1, 1,
0.4909231, -1.519849, 3.530403, 0.3215686, 0, 1, 1,
0.4949114, -0.3823353, 1.049099, 0.3254902, 0, 1, 1,
0.5018278, -0.1470694, 2.053638, 0.3333333, 0, 1, 1,
0.5106422, 1.144348, -0.4938345, 0.3372549, 0, 1, 1,
0.5182258, 0.8287843, 0.9517246, 0.345098, 0, 1, 1,
0.5206495, -1.207293, 4.246367, 0.3490196, 0, 1, 1,
0.5248848, -0.2934645, 2.87944, 0.3568628, 0, 1, 1,
0.524887, -0.7125377, 3.898858, 0.3607843, 0, 1, 1,
0.5252367, -0.6459613, 4.44692, 0.3686275, 0, 1, 1,
0.5267119, -1.126182, 1.962116, 0.372549, 0, 1, 1,
0.5277399, 1.372628, 0.5693421, 0.3803922, 0, 1, 1,
0.5282655, -0.6668485, 4.011164, 0.3843137, 0, 1, 1,
0.5300307, 0.2344388, 0.7094015, 0.3921569, 0, 1, 1,
0.5362775, -1.008792, 3.088156, 0.3960784, 0, 1, 1,
0.53978, 0.2588983, -0.0288424, 0.4039216, 0, 1, 1,
0.5436977, -1.728715, 3.167578, 0.4117647, 0, 1, 1,
0.5444553, 0.5398386, -0.5978426, 0.4156863, 0, 1, 1,
0.5470958, -0.1974614, 2.333103, 0.4235294, 0, 1, 1,
0.5517777, -1.012579, 3.809221, 0.427451, 0, 1, 1,
0.5596963, -0.1231034, 3.884901, 0.4352941, 0, 1, 1,
0.5616265, -0.8356234, 2.60615, 0.4392157, 0, 1, 1,
0.5694772, 0.1317968, 1.09551, 0.4470588, 0, 1, 1,
0.5795872, 0.6764074, -0.4115632, 0.4509804, 0, 1, 1,
0.5825255, -0.4377829, 2.543991, 0.4588235, 0, 1, 1,
0.5847967, -0.7000943, 2.043879, 0.4627451, 0, 1, 1,
0.5906599, -1.124525, 1.756867, 0.4705882, 0, 1, 1,
0.5913918, -0.646914, 2.94833, 0.4745098, 0, 1, 1,
0.5937927, -0.997337, 3.31708, 0.4823529, 0, 1, 1,
0.5955516, -0.5585482, 1.744952, 0.4862745, 0, 1, 1,
0.595622, 1.6256, -0.2014138, 0.4941176, 0, 1, 1,
0.6028454, 0.5861343, -0.3116284, 0.5019608, 0, 1, 1,
0.6063153, 0.727282, 2.627848, 0.5058824, 0, 1, 1,
0.6122165, -1.278301, 2.747736, 0.5137255, 0, 1, 1,
0.6132877, 0.3253695, 0.539729, 0.5176471, 0, 1, 1,
0.6153397, -2.201262, 3.35202, 0.5254902, 0, 1, 1,
0.6178238, -0.6378649, 4.218154, 0.5294118, 0, 1, 1,
0.6245051, 0.4173928, 0.6578357, 0.5372549, 0, 1, 1,
0.6270017, 0.8473842, 2.579044, 0.5411765, 0, 1, 1,
0.627782, 0.5271277, 0.9081396, 0.5490196, 0, 1, 1,
0.6278201, -1.71489, 2.991019, 0.5529412, 0, 1, 1,
0.6299156, -0.960421, 1.569712, 0.5607843, 0, 1, 1,
0.630771, -0.3521798, 3.559723, 0.5647059, 0, 1, 1,
0.6365359, 1.285506, 0.5337338, 0.572549, 0, 1, 1,
0.63879, -0.4794966, 3.408545, 0.5764706, 0, 1, 1,
0.6407432, 1.393658, 0.8134702, 0.5843138, 0, 1, 1,
0.6425788, 0.5601391, 2.859074, 0.5882353, 0, 1, 1,
0.6452573, 1.409176, -0.6105577, 0.5960785, 0, 1, 1,
0.6467227, -1.630781, 2.221871, 0.6039216, 0, 1, 1,
0.6614702, 0.520488, 0.909694, 0.6078432, 0, 1, 1,
0.6784791, 0.7763923, 0.1904635, 0.6156863, 0, 1, 1,
0.6792424, -0.3056597, 2.766202, 0.6196079, 0, 1, 1,
0.684777, 0.7006696, 0.2310942, 0.627451, 0, 1, 1,
0.6851463, 0.6567391, 1.373746, 0.6313726, 0, 1, 1,
0.6906516, 0.2175828, 0.8452861, 0.6392157, 0, 1, 1,
0.6918612, -0.3139366, 2.351419, 0.6431373, 0, 1, 1,
0.693647, -2.232038, 2.311432, 0.6509804, 0, 1, 1,
0.6939443, -1.588337, 1.774696, 0.654902, 0, 1, 1,
0.6968629, 0.9032359, -0.8202828, 0.6627451, 0, 1, 1,
0.7047763, 0.0660771, 1.764108, 0.6666667, 0, 1, 1,
0.7055689, -1.066522, 2.040491, 0.6745098, 0, 1, 1,
0.707177, -0.9788292, 3.20525, 0.6784314, 0, 1, 1,
0.7074534, 1.54881, 0.4843644, 0.6862745, 0, 1, 1,
0.707657, 1.505213, -0.3073187, 0.6901961, 0, 1, 1,
0.7143334, -0.6568447, 3.450572, 0.6980392, 0, 1, 1,
0.7151259, 2.047143, 1.584801, 0.7058824, 0, 1, 1,
0.7153866, 0.9176701, 1.578135, 0.7098039, 0, 1, 1,
0.7174284, -0.3209665, 3.284123, 0.7176471, 0, 1, 1,
0.7210252, 0.8662445, 0.966934, 0.7215686, 0, 1, 1,
0.7277232, -2.090272, 2.837678, 0.7294118, 0, 1, 1,
0.737559, 0.1452571, -0.2879452, 0.7333333, 0, 1, 1,
0.7427755, -1.204082, 2.903904, 0.7411765, 0, 1, 1,
0.7443129, 0.2624349, 1.983168, 0.7450981, 0, 1, 1,
0.7471986, -0.07596666, 1.629555, 0.7529412, 0, 1, 1,
0.7486227, -0.6878189, 3.648366, 0.7568628, 0, 1, 1,
0.7561708, 0.1208229, 1.232494, 0.7647059, 0, 1, 1,
0.7636423, -1.16565, 1.658772, 0.7686275, 0, 1, 1,
0.7639801, -1.07602, 3.612768, 0.7764706, 0, 1, 1,
0.7647196, 1.049151, 0.2413855, 0.7803922, 0, 1, 1,
0.7673199, 1.649037, 0.3337264, 0.7882353, 0, 1, 1,
0.7681051, -0.1919731, 1.843659, 0.7921569, 0, 1, 1,
0.7688001, 0.3912492, 1.092028, 0.8, 0, 1, 1,
0.7705913, -0.8474783, 3.062926, 0.8078431, 0, 1, 1,
0.7719061, 0.1049872, 1.653414, 0.8117647, 0, 1, 1,
0.7755812, -0.6637592, 2.134026, 0.8196079, 0, 1, 1,
0.7773913, -0.6361985, 4.951795, 0.8235294, 0, 1, 1,
0.7779334, 0.9053277, -0.3738817, 0.8313726, 0, 1, 1,
0.7798127, -0.5583417, 1.680037, 0.8352941, 0, 1, 1,
0.7875155, 0.8492161, 2.050361, 0.8431373, 0, 1, 1,
0.7879473, -1.104799, 3.746417, 0.8470588, 0, 1, 1,
0.7883886, 0.9287929, 0.6754157, 0.854902, 0, 1, 1,
0.7890792, 1.271238, 0.8856833, 0.8588235, 0, 1, 1,
0.7892212, 0.4040107, 0.8644625, 0.8666667, 0, 1, 1,
0.7975194, -1.126921, 1.199356, 0.8705882, 0, 1, 1,
0.806795, -0.9621262, 2.18093, 0.8784314, 0, 1, 1,
0.8076658, 1.868934, 1.036424, 0.8823529, 0, 1, 1,
0.8208896, 0.3631053, 2.013364, 0.8901961, 0, 1, 1,
0.841508, -0.3918181, 1.334375, 0.8941177, 0, 1, 1,
0.8461559, 1.643441, 0.4182969, 0.9019608, 0, 1, 1,
0.8466697, -0.7380923, 1.726276, 0.9098039, 0, 1, 1,
0.8495966, 0.02826742, 0.5728912, 0.9137255, 0, 1, 1,
0.8509108, 0.7187906, 0.9545974, 0.9215686, 0, 1, 1,
0.8525776, -0.3865907, 1.474406, 0.9254902, 0, 1, 1,
0.8612444, 2.602764, 1.046494, 0.9333333, 0, 1, 1,
0.8643757, 1.69701, 1.338948, 0.9372549, 0, 1, 1,
0.8659497, 0.9288591, -0.7750642, 0.945098, 0, 1, 1,
0.869058, -0.4806575, 4.542781, 0.9490196, 0, 1, 1,
0.8705643, -0.7521339, 1.818783, 0.9568627, 0, 1, 1,
0.8742951, 0.4474315, 3.475405, 0.9607843, 0, 1, 1,
0.8775281, 1.791312, 0.2482027, 0.9686275, 0, 1, 1,
0.877993, 0.2494999, 1.900005, 0.972549, 0, 1, 1,
0.8834715, 1.019414, 1.005332, 0.9803922, 0, 1, 1,
0.8884478, 0.2039878, 0.07750278, 0.9843137, 0, 1, 1,
0.889621, -1.492854, 3.02389, 0.9921569, 0, 1, 1,
0.8901516, -0.03763356, 2.198191, 0.9960784, 0, 1, 1,
0.8913211, -1.123894, 2.166273, 1, 0, 0.9960784, 1,
0.9033484, -0.4666272, 1.829279, 1, 0, 0.9882353, 1,
0.9081414, -0.8312, 4.132173, 1, 0, 0.9843137, 1,
0.9082353, -0.2005253, 4.56354, 1, 0, 0.9764706, 1,
0.9087076, 0.3480017, -0.3720932, 1, 0, 0.972549, 1,
0.9150695, 2.826797, 0.5513394, 1, 0, 0.9647059, 1,
0.9203636, -1.165038, 1.745924, 1, 0, 0.9607843, 1,
0.9266906, -0.7155327, 2.818766, 1, 0, 0.9529412, 1,
0.9369115, 0.6308333, 2.607943, 1, 0, 0.9490196, 1,
0.9385284, -1.230963, 1.718125, 1, 0, 0.9411765, 1,
0.9396066, -0.1728136, 1.792641, 1, 0, 0.9372549, 1,
0.9487268, 0.06853468, 1.169015, 1, 0, 0.9294118, 1,
0.9562252, 0.2820415, -0.3355231, 1, 0, 0.9254902, 1,
0.9589936, -0.8156582, 2.905108, 1, 0, 0.9176471, 1,
0.9593042, -1.682038, 1.510571, 1, 0, 0.9137255, 1,
0.9617404, -1.078894, 3.57982, 1, 0, 0.9058824, 1,
0.9630827, -0.09935354, 2.843494, 1, 0, 0.9019608, 1,
0.9752428, 1.270529, 1.757068, 1, 0, 0.8941177, 1,
0.9856069, -0.6107762, 2.630408, 1, 0, 0.8862745, 1,
0.9888468, 0.01536381, 0.7315541, 1, 0, 0.8823529, 1,
0.9919672, 1.200671, 0.6406041, 1, 0, 0.8745098, 1,
0.9994917, -0.04235803, 0.9329942, 1, 0, 0.8705882, 1,
1.002751, 0.8328089, 1.798785, 1, 0, 0.8627451, 1,
1.003664, 0.0503576, 2.65839, 1, 0, 0.8588235, 1,
1.011396, -1.226777, 3.344818, 1, 0, 0.8509804, 1,
1.020646, 0.187394, 0.4777884, 1, 0, 0.8470588, 1,
1.025756, 0.5480068, 1.574968, 1, 0, 0.8392157, 1,
1.033207, 0.2212545, -0.292293, 1, 0, 0.8352941, 1,
1.035791, 0.6641607, 1.754449, 1, 0, 0.827451, 1,
1.037909, -1.196257, 3.140468, 1, 0, 0.8235294, 1,
1.038147, 0.2577145, 1.27764, 1, 0, 0.8156863, 1,
1.03976, -1.213999, 3.691864, 1, 0, 0.8117647, 1,
1.047599, -1.204185, 2.825207, 1, 0, 0.8039216, 1,
1.053933, 1.319227, 1.942726, 1, 0, 0.7960784, 1,
1.063823, 1.676814, -1.640416, 1, 0, 0.7921569, 1,
1.075832, -0.2939854, 2.367516, 1, 0, 0.7843137, 1,
1.079928, 1.05921, 0.7830628, 1, 0, 0.7803922, 1,
1.083271, -0.8354418, 1.620013, 1, 0, 0.772549, 1,
1.085836, -1.387849, 2.540135, 1, 0, 0.7686275, 1,
1.088538, 2.043138, -0.03387582, 1, 0, 0.7607843, 1,
1.088991, -1.547395, 3.016974, 1, 0, 0.7568628, 1,
1.101068, 0.8536805, 0.8341225, 1, 0, 0.7490196, 1,
1.102754, 1.729752, -0.1556857, 1, 0, 0.7450981, 1,
1.103236, -1.005145, 1.589826, 1, 0, 0.7372549, 1,
1.110551, 0.2769336, 1.179071, 1, 0, 0.7333333, 1,
1.110667, -2.376534, 1.423032, 1, 0, 0.7254902, 1,
1.113712, -0.0214266, 1.733047, 1, 0, 0.7215686, 1,
1.133798, -1.726636, 4.114787, 1, 0, 0.7137255, 1,
1.135075, 1.156687, 0.4716214, 1, 0, 0.7098039, 1,
1.136555, -0.7850654, 3.426341, 1, 0, 0.7019608, 1,
1.138817, 0.1858435, 1.127795, 1, 0, 0.6941177, 1,
1.147902, 0.533991, 0.09465237, 1, 0, 0.6901961, 1,
1.151942, 1.046858, -0.006116649, 1, 0, 0.682353, 1,
1.153957, 1.274119, 0.9402787, 1, 0, 0.6784314, 1,
1.165885, -0.6865897, 2.048969, 1, 0, 0.6705883, 1,
1.173127, 0.2020673, 2.452112, 1, 0, 0.6666667, 1,
1.173458, 0.792853, 2.076792, 1, 0, 0.6588235, 1,
1.184579, 0.306992, 0.9212099, 1, 0, 0.654902, 1,
1.19479, 0.1952697, 1.382097, 1, 0, 0.6470588, 1,
1.200725, 0.4474292, 2.121577, 1, 0, 0.6431373, 1,
1.202598, 2.315245, 1.530206, 1, 0, 0.6352941, 1,
1.206186, -0.04400009, 1.956259, 1, 0, 0.6313726, 1,
1.208992, 0.6118589, -0.7816466, 1, 0, 0.6235294, 1,
1.209709, 0.5454337, 0.7663664, 1, 0, 0.6196079, 1,
1.210679, 1.119134, -0.3289304, 1, 0, 0.6117647, 1,
1.220775, -0.8457152, 2.369661, 1, 0, 0.6078432, 1,
1.225022, 1.199011, -0.6758938, 1, 0, 0.6, 1,
1.229051, 1.285645, 0.7618681, 1, 0, 0.5921569, 1,
1.233906, 1.532333, 0.2331971, 1, 0, 0.5882353, 1,
1.247289, 1.371936, 1.249063, 1, 0, 0.5803922, 1,
1.259039, -2.335426, 2.515793, 1, 0, 0.5764706, 1,
1.265167, 0.4399939, 2.210824, 1, 0, 0.5686275, 1,
1.275567, -0.6527506, 1.951429, 1, 0, 0.5647059, 1,
1.285198, -0.6376475, 1.362879, 1, 0, 0.5568628, 1,
1.287001, 1.063253, 0.5895675, 1, 0, 0.5529412, 1,
1.303595, -0.6860734, 2.167021, 1, 0, 0.5450981, 1,
1.303696, 0.9970927, 0.8393595, 1, 0, 0.5411765, 1,
1.309634, -1.449823, 2.48541, 1, 0, 0.5333334, 1,
1.353668, -0.3987445, 2.90695, 1, 0, 0.5294118, 1,
1.357242, 0.206682, 1.171761, 1, 0, 0.5215687, 1,
1.364911, 2.198419, -0.5535012, 1, 0, 0.5176471, 1,
1.372702, -0.7831492, 1.011792, 1, 0, 0.509804, 1,
1.373063, 0.7351199, 2.654705, 1, 0, 0.5058824, 1,
1.378902, -2.587234, 1.864184, 1, 0, 0.4980392, 1,
1.387027, -0.7062418, 2.249778, 1, 0, 0.4901961, 1,
1.387942, -0.5259489, 2.977519, 1, 0, 0.4862745, 1,
1.400699, 0.5011507, 0.5302615, 1, 0, 0.4784314, 1,
1.40478, -0.2719449, 2.13529, 1, 0, 0.4745098, 1,
1.418487, -0.1633883, 1.574217, 1, 0, 0.4666667, 1,
1.418671, 0.5036902, 2.064591, 1, 0, 0.4627451, 1,
1.418728, 0.4459836, 1.807691, 1, 0, 0.454902, 1,
1.42934, -1.361962, 2.448959, 1, 0, 0.4509804, 1,
1.431233, -0.09898634, 2.334284, 1, 0, 0.4431373, 1,
1.438739, 0.7620952, -0.5332808, 1, 0, 0.4392157, 1,
1.446604, 0.221831, 2.102061, 1, 0, 0.4313726, 1,
1.456902, -0.07316235, 1.722699, 1, 0, 0.427451, 1,
1.458287, 1.366458, -0.4017289, 1, 0, 0.4196078, 1,
1.463799, -0.4314924, 2.467638, 1, 0, 0.4156863, 1,
1.464137, -0.949347, 2.473566, 1, 0, 0.4078431, 1,
1.464561, 0.7012212, 2.903549, 1, 0, 0.4039216, 1,
1.47337, -0.2444736, 0.9360026, 1, 0, 0.3960784, 1,
1.479415, 1.241876, 0.3929822, 1, 0, 0.3882353, 1,
1.481018, 2.137556, 2.087704, 1, 0, 0.3843137, 1,
1.496899, 0.6082906, 0.2300694, 1, 0, 0.3764706, 1,
1.516285, 1.126239, 1.57851, 1, 0, 0.372549, 1,
1.516659, 0.641934, 2.581341, 1, 0, 0.3647059, 1,
1.526524, 0.7478861, -0.5609617, 1, 0, 0.3607843, 1,
1.527812, -0.09636752, 0.728337, 1, 0, 0.3529412, 1,
1.536672, 1.051762, -0.4206161, 1, 0, 0.3490196, 1,
1.537421, -0.1736329, 0.7805797, 1, 0, 0.3411765, 1,
1.541051, 0.7286456, 0.546973, 1, 0, 0.3372549, 1,
1.550492, -1.147131, 2.153632, 1, 0, 0.3294118, 1,
1.571499, 0.6666409, 0.2903637, 1, 0, 0.3254902, 1,
1.579911, -0.2960122, 2.929136, 1, 0, 0.3176471, 1,
1.591749, 0.5799952, 0.851705, 1, 0, 0.3137255, 1,
1.598292, 0.5027668, 2.943568, 1, 0, 0.3058824, 1,
1.60069, 0.6784993, 0.6501412, 1, 0, 0.2980392, 1,
1.607806, 0.6087102, 1.245807, 1, 0, 0.2941177, 1,
1.609216, -0.1931372, -0.2064073, 1, 0, 0.2862745, 1,
1.646013, 1.558568, 1.073241, 1, 0, 0.282353, 1,
1.675859, 0.003917303, 3.977176, 1, 0, 0.2745098, 1,
1.682502, 0.9487289, 1.3128, 1, 0, 0.2705882, 1,
1.688791, 1.035669, 1.315324, 1, 0, 0.2627451, 1,
1.694826, -0.7771789, 2.827402, 1, 0, 0.2588235, 1,
1.702099, 0.5659744, 0.2646921, 1, 0, 0.2509804, 1,
1.703842, 1.530339, -0.1105458, 1, 0, 0.2470588, 1,
1.710858, -0.4807394, 1.94774, 1, 0, 0.2392157, 1,
1.716262, 1.850697, 1.392668, 1, 0, 0.2352941, 1,
1.728465, 0.9887494, 1.786029, 1, 0, 0.227451, 1,
1.734982, 0.4361616, 1.90657, 1, 0, 0.2235294, 1,
1.755449, 2.120775, 1.065067, 1, 0, 0.2156863, 1,
1.768665, -0.3243258, 2.307975, 1, 0, 0.2117647, 1,
1.769304, 0.743548, 0.2482474, 1, 0, 0.2039216, 1,
1.808075, -0.8744136, 2.738887, 1, 0, 0.1960784, 1,
1.811023, -2.005955, 4.633058, 1, 0, 0.1921569, 1,
1.817839, -0.2383364, 3.596766, 1, 0, 0.1843137, 1,
1.833249, -0.4808941, 0.505933, 1, 0, 0.1803922, 1,
1.83563, 2.179507, 1.614484, 1, 0, 0.172549, 1,
1.84032, -1.730942, 3.017276, 1, 0, 0.1686275, 1,
1.884492, 0.5911592, 2.466309, 1, 0, 0.1607843, 1,
1.890673, -0.3411394, 2.827884, 1, 0, 0.1568628, 1,
1.914044, 1.255525, 0.8920475, 1, 0, 0.1490196, 1,
1.921761, 0.6304648, 3.051411, 1, 0, 0.145098, 1,
1.928666, -0.2289292, 1.175709, 1, 0, 0.1372549, 1,
1.931453, -0.7587736, 3.153464, 1, 0, 0.1333333, 1,
1.963274, 0.2012074, 1.961831, 1, 0, 0.1254902, 1,
2.00369, 0.2424769, 2.787492, 1, 0, 0.1215686, 1,
2.006999, -0.2930267, -0.04624041, 1, 0, 0.1137255, 1,
2.008952, 0.3909414, 2.34886, 1, 0, 0.1098039, 1,
2.073851, 0.8693316, 0.3013391, 1, 0, 0.1019608, 1,
2.093327, 0.4786126, 2.584378, 1, 0, 0.09411765, 1,
2.132007, -2.845627, 3.239679, 1, 0, 0.09019608, 1,
2.148788, -0.3310091, 1.189068, 1, 0, 0.08235294, 1,
2.153684, -0.7872749, 0.4300848, 1, 0, 0.07843138, 1,
2.160471, -0.07464727, 0.2759891, 1, 0, 0.07058824, 1,
2.1753, -0.7906796, 3.761482, 1, 0, 0.06666667, 1,
2.295026, 0.678019, 0.7058607, 1, 0, 0.05882353, 1,
2.3494, 1.14044, 1.359034, 1, 0, 0.05490196, 1,
2.432732, -0.1687144, -0.8354313, 1, 0, 0.04705882, 1,
2.464078, -0.4250539, 1.748523, 1, 0, 0.04313726, 1,
2.494308, 0.02521048, 2.229201, 1, 0, 0.03529412, 1,
2.51172, -0.1632729, 1.870717, 1, 0, 0.03137255, 1,
2.584488, -1.005302, 1.797207, 1, 0, 0.02352941, 1,
2.608056, -2.218028, -0.2814253, 1, 0, 0.01960784, 1,
2.995378, -0.6874402, 0.7528056, 1, 0, 0.01176471, 1,
3.57247, -0.6514449, 2.369495, 1, 0, 0.007843138, 1
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
0.1823252, -4.025507, -7.440275, 0, -0.5, 0.5, 0.5,
0.1823252, -4.025507, -7.440275, 1, -0.5, 0.5, 0.5,
0.1823252, -4.025507, -7.440275, 1, 1.5, 0.5, 0.5,
0.1823252, -4.025507, -7.440275, 0, 1.5, 0.5, 0.5
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
-4.357079, -0.1027901, -7.440275, 0, -0.5, 0.5, 0.5,
-4.357079, -0.1027901, -7.440275, 1, -0.5, 0.5, 0.5,
-4.357079, -0.1027901, -7.440275, 1, 1.5, 0.5, 0.5,
-4.357079, -0.1027901, -7.440275, 0, 1.5, 0.5, 0.5
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
-4.357079, -4.025507, -0.2192082, 0, -0.5, 0.5, 0.5,
-4.357079, -4.025507, -0.2192082, 1, -0.5, 0.5, 0.5,
-4.357079, -4.025507, -0.2192082, 1, 1.5, 0.5, 0.5,
-4.357079, -4.025507, -0.2192082, 0, 1.5, 0.5, 0.5
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
-3, -3.120265, -5.773875,
3, -3.120265, -5.773875,
-3, -3.120265, -5.773875,
-3, -3.271139, -6.051609,
-2, -3.120265, -5.773875,
-2, -3.271139, -6.051609,
-1, -3.120265, -5.773875,
-1, -3.271139, -6.051609,
0, -3.120265, -5.773875,
0, -3.271139, -6.051609,
1, -3.120265, -5.773875,
1, -3.271139, -6.051609,
2, -3.120265, -5.773875,
2, -3.271139, -6.051609,
3, -3.120265, -5.773875,
3, -3.271139, -6.051609
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
-3, -3.572886, -6.607075, 0, -0.5, 0.5, 0.5,
-3, -3.572886, -6.607075, 1, -0.5, 0.5, 0.5,
-3, -3.572886, -6.607075, 1, 1.5, 0.5, 0.5,
-3, -3.572886, -6.607075, 0, 1.5, 0.5, 0.5,
-2, -3.572886, -6.607075, 0, -0.5, 0.5, 0.5,
-2, -3.572886, -6.607075, 1, -0.5, 0.5, 0.5,
-2, -3.572886, -6.607075, 1, 1.5, 0.5, 0.5,
-2, -3.572886, -6.607075, 0, 1.5, 0.5, 0.5,
-1, -3.572886, -6.607075, 0, -0.5, 0.5, 0.5,
-1, -3.572886, -6.607075, 1, -0.5, 0.5, 0.5,
-1, -3.572886, -6.607075, 1, 1.5, 0.5, 0.5,
-1, -3.572886, -6.607075, 0, 1.5, 0.5, 0.5,
0, -3.572886, -6.607075, 0, -0.5, 0.5, 0.5,
0, -3.572886, -6.607075, 1, -0.5, 0.5, 0.5,
0, -3.572886, -6.607075, 1, 1.5, 0.5, 0.5,
0, -3.572886, -6.607075, 0, 1.5, 0.5, 0.5,
1, -3.572886, -6.607075, 0, -0.5, 0.5, 0.5,
1, -3.572886, -6.607075, 1, -0.5, 0.5, 0.5,
1, -3.572886, -6.607075, 1, 1.5, 0.5, 0.5,
1, -3.572886, -6.607075, 0, 1.5, 0.5, 0.5,
2, -3.572886, -6.607075, 0, -0.5, 0.5, 0.5,
2, -3.572886, -6.607075, 1, -0.5, 0.5, 0.5,
2, -3.572886, -6.607075, 1, 1.5, 0.5, 0.5,
2, -3.572886, -6.607075, 0, 1.5, 0.5, 0.5,
3, -3.572886, -6.607075, 0, -0.5, 0.5, 0.5,
3, -3.572886, -6.607075, 1, -0.5, 0.5, 0.5,
3, -3.572886, -6.607075, 1, 1.5, 0.5, 0.5,
3, -3.572886, -6.607075, 0, 1.5, 0.5, 0.5
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
-3.309524, -3, -5.773875,
-3.309524, 2, -5.773875,
-3.309524, -3, -5.773875,
-3.484116, -3, -6.051609,
-3.309524, -2, -5.773875,
-3.484116, -2, -6.051609,
-3.309524, -1, -5.773875,
-3.484116, -1, -6.051609,
-3.309524, 0, -5.773875,
-3.484116, 0, -6.051609,
-3.309524, 1, -5.773875,
-3.484116, 1, -6.051609,
-3.309524, 2, -5.773875,
-3.484116, 2, -6.051609
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
-3.833301, -3, -6.607075, 0, -0.5, 0.5, 0.5,
-3.833301, -3, -6.607075, 1, -0.5, 0.5, 0.5,
-3.833301, -3, -6.607075, 1, 1.5, 0.5, 0.5,
-3.833301, -3, -6.607075, 0, 1.5, 0.5, 0.5,
-3.833301, -2, -6.607075, 0, -0.5, 0.5, 0.5,
-3.833301, -2, -6.607075, 1, -0.5, 0.5, 0.5,
-3.833301, -2, -6.607075, 1, 1.5, 0.5, 0.5,
-3.833301, -2, -6.607075, 0, 1.5, 0.5, 0.5,
-3.833301, -1, -6.607075, 0, -0.5, 0.5, 0.5,
-3.833301, -1, -6.607075, 1, -0.5, 0.5, 0.5,
-3.833301, -1, -6.607075, 1, 1.5, 0.5, 0.5,
-3.833301, -1, -6.607075, 0, 1.5, 0.5, 0.5,
-3.833301, 0, -6.607075, 0, -0.5, 0.5, 0.5,
-3.833301, 0, -6.607075, 1, -0.5, 0.5, 0.5,
-3.833301, 0, -6.607075, 1, 1.5, 0.5, 0.5,
-3.833301, 0, -6.607075, 0, 1.5, 0.5, 0.5,
-3.833301, 1, -6.607075, 0, -0.5, 0.5, 0.5,
-3.833301, 1, -6.607075, 1, -0.5, 0.5, 0.5,
-3.833301, 1, -6.607075, 1, 1.5, 0.5, 0.5,
-3.833301, 1, -6.607075, 0, 1.5, 0.5, 0.5,
-3.833301, 2, -6.607075, 0, -0.5, 0.5, 0.5,
-3.833301, 2, -6.607075, 1, -0.5, 0.5, 0.5,
-3.833301, 2, -6.607075, 1, 1.5, 0.5, 0.5,
-3.833301, 2, -6.607075, 0, 1.5, 0.5, 0.5
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
-3.309524, -3.120265, -4,
-3.309524, -3.120265, 4,
-3.309524, -3.120265, -4,
-3.484116, -3.271139, -4,
-3.309524, -3.120265, -2,
-3.484116, -3.271139, -2,
-3.309524, -3.120265, 0,
-3.484116, -3.271139, 0,
-3.309524, -3.120265, 2,
-3.484116, -3.271139, 2,
-3.309524, -3.120265, 4,
-3.484116, -3.271139, 4
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
-3.833301, -3.572886, -4, 0, -0.5, 0.5, 0.5,
-3.833301, -3.572886, -4, 1, -0.5, 0.5, 0.5,
-3.833301, -3.572886, -4, 1, 1.5, 0.5, 0.5,
-3.833301, -3.572886, -4, 0, 1.5, 0.5, 0.5,
-3.833301, -3.572886, -2, 0, -0.5, 0.5, 0.5,
-3.833301, -3.572886, -2, 1, -0.5, 0.5, 0.5,
-3.833301, -3.572886, -2, 1, 1.5, 0.5, 0.5,
-3.833301, -3.572886, -2, 0, 1.5, 0.5, 0.5,
-3.833301, -3.572886, 0, 0, -0.5, 0.5, 0.5,
-3.833301, -3.572886, 0, 1, -0.5, 0.5, 0.5,
-3.833301, -3.572886, 0, 1, 1.5, 0.5, 0.5,
-3.833301, -3.572886, 0, 0, 1.5, 0.5, 0.5,
-3.833301, -3.572886, 2, 0, -0.5, 0.5, 0.5,
-3.833301, -3.572886, 2, 1, -0.5, 0.5, 0.5,
-3.833301, -3.572886, 2, 1, 1.5, 0.5, 0.5,
-3.833301, -3.572886, 2, 0, 1.5, 0.5, 0.5,
-3.833301, -3.572886, 4, 0, -0.5, 0.5, 0.5,
-3.833301, -3.572886, 4, 1, -0.5, 0.5, 0.5,
-3.833301, -3.572886, 4, 1, 1.5, 0.5, 0.5,
-3.833301, -3.572886, 4, 0, 1.5, 0.5, 0.5
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
-3.309524, -3.120265, -5.773875,
-3.309524, 2.914685, -5.773875,
-3.309524, -3.120265, 5.335459,
-3.309524, 2.914685, 5.335459,
-3.309524, -3.120265, -5.773875,
-3.309524, -3.120265, 5.335459,
-3.309524, 2.914685, -5.773875,
-3.309524, 2.914685, 5.335459,
-3.309524, -3.120265, -5.773875,
3.674174, -3.120265, -5.773875,
-3.309524, -3.120265, 5.335459,
3.674174, -3.120265, 5.335459,
-3.309524, 2.914685, -5.773875,
3.674174, 2.914685, -5.773875,
-3.309524, 2.914685, 5.335459,
3.674174, 2.914685, 5.335459,
3.674174, -3.120265, -5.773875,
3.674174, 2.914685, -5.773875,
3.674174, -3.120265, 5.335459,
3.674174, 2.914685, 5.335459,
3.674174, -3.120265, -5.773875,
3.674174, -3.120265, 5.335459,
3.674174, 2.914685, -5.773875,
3.674174, 2.914685, 5.335459
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
var radius = 7.712461;
var distance = 34.31361;
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
mvMatrix.translate( -0.1823252, 0.1027901, 0.2192082 );
mvMatrix.scale( 1.194047, 1.381762, 0.7506178 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.31361);
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
pyribenzoxim<-read.table("pyribenzoxim.xyz")
```

```
## Error in read.table("pyribenzoxim.xyz"): no lines available in input
```

```r
x<-pyribenzoxim$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyribenzoxim' not found
```

```r
y<-pyribenzoxim$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyribenzoxim' not found
```

```r
z<-pyribenzoxim$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyribenzoxim' not found
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
-3.207819, 0.5457649, -2.439061, 0, 0, 1, 1, 1,
-2.858297, 0.6950659, -1.573615, 1, 0, 0, 1, 1,
-2.763791, 0.1331907, -0.1340067, 1, 0, 0, 1, 1,
-2.735988, 1.438462, -1.45156, 1, 0, 0, 1, 1,
-2.609007, -0.1360597, -2.610533, 1, 0, 0, 1, 1,
-2.491519, 2.570162, -1.492879, 1, 0, 0, 1, 1,
-2.478232, -0.4956132, -1.550557, 0, 0, 0, 1, 1,
-2.469909, 1.766679, 0.1381211, 0, 0, 0, 1, 1,
-2.401752, 0.4855138, -0.1726839, 0, 0, 0, 1, 1,
-2.231674, 1.155297, -2.556625, 0, 0, 0, 1, 1,
-2.226102, -0.9273783, -2.097804, 0, 0, 0, 1, 1,
-2.221425, 0.3441063, -1.370694, 0, 0, 0, 1, 1,
-2.21104, -0.4728239, -2.406905, 0, 0, 0, 1, 1,
-2.191282, -1.030174, -2.730025, 1, 1, 1, 1, 1,
-2.185645, 0.2106378, -2.972164, 1, 1, 1, 1, 1,
-2.180285, -0.09245822, -0.3844055, 1, 1, 1, 1, 1,
-2.16495, -0.4430671, -2.560303, 1, 1, 1, 1, 1,
-2.157243, -0.3769934, -0.9732958, 1, 1, 1, 1, 1,
-2.135004, -0.4988282, -1.823768, 1, 1, 1, 1, 1,
-2.124619, -0.6703393, -1.885522, 1, 1, 1, 1, 1,
-2.083493, -0.6783456, -2.753515, 1, 1, 1, 1, 1,
-2.080143, 0.5159717, -0.00822535, 1, 1, 1, 1, 1,
-2.070206, 0.4052154, -1.378341, 1, 1, 1, 1, 1,
-2.051282, 0.04020889, -1.880459, 1, 1, 1, 1, 1,
-2.033383, 1.057388, -1.113532, 1, 1, 1, 1, 1,
-2.009612, 0.9761486, -0.3619234, 1, 1, 1, 1, 1,
-1.984861, 0.0108198, -0.5266396, 1, 1, 1, 1, 1,
-1.978734, -0.6731746, -1.343112, 1, 1, 1, 1, 1,
-1.976893, 2.410339, -0.259778, 0, 0, 1, 1, 1,
-1.95876, 0.4801655, 0.3482676, 1, 0, 0, 1, 1,
-1.948579, -1.255388, -1.14698, 1, 0, 0, 1, 1,
-1.928145, -0.9134941, -2.279651, 1, 0, 0, 1, 1,
-1.911889, 0.01579287, -1.889569, 1, 0, 0, 1, 1,
-1.886581, 0.7504231, -1.389637, 1, 0, 0, 1, 1,
-1.876888, -0.769047, -1.693674, 0, 0, 0, 1, 1,
-1.863949, 0.6336596, -2.403385, 0, 0, 0, 1, 1,
-1.861169, 0.275192, -1.080685, 0, 0, 0, 1, 1,
-1.860803, 1.062925, -2.197381, 0, 0, 0, 1, 1,
-1.860128, 0.6726423, -1.548229, 0, 0, 0, 1, 1,
-1.843495, -0.6900743, -3.026218, 0, 0, 0, 1, 1,
-1.842266, 0.09716651, 1.026071, 0, 0, 0, 1, 1,
-1.815427, 0.4313538, -2.16044, 1, 1, 1, 1, 1,
-1.814402, 1.851935, -1.248752, 1, 1, 1, 1, 1,
-1.812876, 0.2901811, -2.255822, 1, 1, 1, 1, 1,
-1.798577, -0.1725771, -0.4761797, 1, 1, 1, 1, 1,
-1.794085, -0.479487, -2.320914, 1, 1, 1, 1, 1,
-1.765452, -0.6051728, -2.784011, 1, 1, 1, 1, 1,
-1.757415, 1.723903, -0.9713256, 1, 1, 1, 1, 1,
-1.752706, -0.3830129, -2.285972, 1, 1, 1, 1, 1,
-1.708643, -0.3404811, -0.2465798, 1, 1, 1, 1, 1,
-1.698726, -0.1234028, -0.9441636, 1, 1, 1, 1, 1,
-1.688495, 0.3130518, -1.549453, 1, 1, 1, 1, 1,
-1.681961, 1.170661, -1.809635, 1, 1, 1, 1, 1,
-1.681121, -0.4974497, -0.204136, 1, 1, 1, 1, 1,
-1.67855, -1.010055, -0.9996139, 1, 1, 1, 1, 1,
-1.669946, 0.5263223, -3.210288, 1, 1, 1, 1, 1,
-1.669476, 1.779052, -2.103276, 0, 0, 1, 1, 1,
-1.642071, 0.8682266, -0.8107849, 1, 0, 0, 1, 1,
-1.624879, -0.1408949, -2.373148, 1, 0, 0, 1, 1,
-1.616453, 0.6505454, -0.6234694, 1, 0, 0, 1, 1,
-1.608499, 0.499915, -0.263849, 1, 0, 0, 1, 1,
-1.598076, 2.23657, -1.23489, 1, 0, 0, 1, 1,
-1.593712, 0.4273975, -2.086798, 0, 0, 0, 1, 1,
-1.591844, -0.6092018, -1.689657, 0, 0, 0, 1, 1,
-1.573697, 1.587541, -2.629328, 0, 0, 0, 1, 1,
-1.572152, -1.035347, -2.438627, 0, 0, 0, 1, 1,
-1.566597, -0.2732856, -1.022899, 0, 0, 0, 1, 1,
-1.564587, -0.3675279, -1.650622, 0, 0, 0, 1, 1,
-1.555119, 0.4889946, -0.7208216, 0, 0, 0, 1, 1,
-1.550751, -1.093009, -1.43207, 1, 1, 1, 1, 1,
-1.545991, -0.6926764, -3.104983, 1, 1, 1, 1, 1,
-1.528752, 1.273573, -0.4260685, 1, 1, 1, 1, 1,
-1.514835, -0.1130653, -1.103822, 1, 1, 1, 1, 1,
-1.511633, 0.4845141, -0.8579527, 1, 1, 1, 1, 1,
-1.509601, -1.510432, -2.65748, 1, 1, 1, 1, 1,
-1.508234, -1.015776, -3.583669, 1, 1, 1, 1, 1,
-1.505563, 1.489931, -1.680671, 1, 1, 1, 1, 1,
-1.505188, -0.02846741, -2.37266, 1, 1, 1, 1, 1,
-1.500353, -0.8514653, -1.237176, 1, 1, 1, 1, 1,
-1.497437, 0.681905, -0.288101, 1, 1, 1, 1, 1,
-1.496879, 1.04827, -0.8440788, 1, 1, 1, 1, 1,
-1.479881, 0.4805558, -0.4569636, 1, 1, 1, 1, 1,
-1.470326, -0.4097981, -2.339355, 1, 1, 1, 1, 1,
-1.462896, -0.4561811, -1.577417, 1, 1, 1, 1, 1,
-1.45394, -1.537714, -1.764429, 0, 0, 1, 1, 1,
-1.450732, 2.072926, 0.3465939, 1, 0, 0, 1, 1,
-1.445688, 0.1409812, 0.8706674, 1, 0, 0, 1, 1,
-1.429927, 1.527707, -0.4585494, 1, 0, 0, 1, 1,
-1.416197, -0.6709774, -0.7649762, 1, 0, 0, 1, 1,
-1.414866, -0.5524732, -2.17066, 1, 0, 0, 1, 1,
-1.413756, -0.411324, -1.872343, 0, 0, 0, 1, 1,
-1.413117, -1.716865, -3.24945, 0, 0, 0, 1, 1,
-1.39875, 0.981675, -1.544639, 0, 0, 0, 1, 1,
-1.389001, -0.8397605, -3.357364, 0, 0, 0, 1, 1,
-1.388835, 0.4762459, -0.4196625, 0, 0, 0, 1, 1,
-1.384206, -0.8222986, -1.372856, 0, 0, 0, 1, 1,
-1.380232, -0.1017955, -0.5485196, 0, 0, 0, 1, 1,
-1.377132, -0.3469619, -1.880175, 1, 1, 1, 1, 1,
-1.376683, -2.42521, -0.7355921, 1, 1, 1, 1, 1,
-1.375838, 0.1237949, -0.2161531, 1, 1, 1, 1, 1,
-1.346338, 1.266269, -0.3951329, 1, 1, 1, 1, 1,
-1.344174, 0.1050868, -2.794322, 1, 1, 1, 1, 1,
-1.339072, 0.1223093, -0.8283854, 1, 1, 1, 1, 1,
-1.331757, 1.724892, -1.11699, 1, 1, 1, 1, 1,
-1.323898, -0.3761235, -0.8938335, 1, 1, 1, 1, 1,
-1.318307, -1.378473, -4.217376, 1, 1, 1, 1, 1,
-1.306447, -1.458271, -3.391535, 1, 1, 1, 1, 1,
-1.303813, -0.01014123, -1.712449, 1, 1, 1, 1, 1,
-1.302338, -0.2032033, -2.140396, 1, 1, 1, 1, 1,
-1.284711, -1.080355, -3.872395, 1, 1, 1, 1, 1,
-1.273683, -0.5273179, -2.055186, 1, 1, 1, 1, 1,
-1.271665, -1.7017, -2.832613, 1, 1, 1, 1, 1,
-1.268173, 0.6342606, -0.4004174, 0, 0, 1, 1, 1,
-1.263609, -0.1907963, -2.713511, 1, 0, 0, 1, 1,
-1.262926, 0.8140123, 1.726619, 1, 0, 0, 1, 1,
-1.259536, 0.03436299, -0.7327779, 1, 0, 0, 1, 1,
-1.254106, 0.5359253, -0.5153517, 1, 0, 0, 1, 1,
-1.251411, 1.826981, -0.2091027, 1, 0, 0, 1, 1,
-1.250362, -0.3390227, -0.9323661, 0, 0, 0, 1, 1,
-1.249873, -0.4634655, -0.675186, 0, 0, 0, 1, 1,
-1.247599, -0.300212, -1.239367, 0, 0, 0, 1, 1,
-1.247417, -3.032377, -2.087754, 0, 0, 0, 1, 1,
-1.245665, 0.002317996, -0.9370748, 0, 0, 0, 1, 1,
-1.238786, -1.739405, -3.277255, 0, 0, 0, 1, 1,
-1.237618, 1.214598, -1.434011, 0, 0, 0, 1, 1,
-1.231681, -1.558885, -2.032702, 1, 1, 1, 1, 1,
-1.230144, 1.306444, -0.9644427, 1, 1, 1, 1, 1,
-1.228748, -1.14831, -2.431802, 1, 1, 1, 1, 1,
-1.226932, -0.7636999, -1.233288, 1, 1, 1, 1, 1,
-1.213981, 0.1043452, -0.4971548, 1, 1, 1, 1, 1,
-1.213569, -0.1702244, -1.093418, 1, 1, 1, 1, 1,
-1.210449, -0.286754, -0.3227398, 1, 1, 1, 1, 1,
-1.20505, 0.7200168, -1.856792, 1, 1, 1, 1, 1,
-1.20259, 0.2229977, -1.528737, 1, 1, 1, 1, 1,
-1.20111, 0.947948, -0.8829697, 1, 1, 1, 1, 1,
-1.200309, -1.854171, -2.891, 1, 1, 1, 1, 1,
-1.199161, -0.9600644, -1.575751, 1, 1, 1, 1, 1,
-1.199008, 0.0178281, -1.262533, 1, 1, 1, 1, 1,
-1.198202, 0.2585768, -1.38678, 1, 1, 1, 1, 1,
-1.193454, -1.074806, -2.306252, 1, 1, 1, 1, 1,
-1.189306, 0.6606957, -1.421168, 0, 0, 1, 1, 1,
-1.181925, 0.7068957, -0.6637359, 1, 0, 0, 1, 1,
-1.174375, -0.8329688, -1.029214, 1, 0, 0, 1, 1,
-1.172436, -1.396025, -3.140877, 1, 0, 0, 1, 1,
-1.172091, -0.7168999, -0.630003, 1, 0, 0, 1, 1,
-1.169895, 0.3058204, -1.784753, 1, 0, 0, 1, 1,
-1.164937, -1.084991, -1.964493, 0, 0, 0, 1, 1,
-1.160997, 1.344973, -0.1403425, 0, 0, 0, 1, 1,
-1.160743, 0.9336922, -0.6175634, 0, 0, 0, 1, 1,
-1.144243, -0.6298948, -2.309185, 0, 0, 0, 1, 1,
-1.124725, 0.407379, 0.5069318, 0, 0, 0, 1, 1,
-1.120656, -1.330605, -2.035339, 0, 0, 0, 1, 1,
-1.114673, 1.010189, -0.007123212, 0, 0, 0, 1, 1,
-1.111178, 0.3790391, -1.202882, 1, 1, 1, 1, 1,
-1.107825, -0.01189759, -3.43659, 1, 1, 1, 1, 1,
-1.10719, -1.594539, -2.62822, 1, 1, 1, 1, 1,
-1.106695, -1.220255, -3.130967, 1, 1, 1, 1, 1,
-1.091805, 0.1879746, 0.1366188, 1, 1, 1, 1, 1,
-1.088121, 0.3907947, -1.152258, 1, 1, 1, 1, 1,
-1.086369, -0.8123641, -1.086805, 1, 1, 1, 1, 1,
-1.083746, 1.280941, 1.212748, 1, 1, 1, 1, 1,
-1.078563, -1.696081, -4.750034, 1, 1, 1, 1, 1,
-1.077678, -1.772714, -2.707947, 1, 1, 1, 1, 1,
-1.077429, -0.5621718, -1.693931, 1, 1, 1, 1, 1,
-1.073247, -0.6927705, -2.231878, 1, 1, 1, 1, 1,
-1.062032, 1.98495, -0.3719982, 1, 1, 1, 1, 1,
-1.060964, 0.3484113, -1.199608, 1, 1, 1, 1, 1,
-1.050144, 0.2648394, -2.443802, 1, 1, 1, 1, 1,
-1.048508, 0.08702578, -1.033693, 0, 0, 1, 1, 1,
-1.048049, 0.4019045, -0.3830235, 1, 0, 0, 1, 1,
-1.039839, 2.076653, -0.571041, 1, 0, 0, 1, 1,
-1.026821, 0.169438, -0.8206713, 1, 0, 0, 1, 1,
-1.015133, -0.9231932, -0.9638948, 1, 0, 0, 1, 1,
-1.013625, -1.805251, -4.096882, 1, 0, 0, 1, 1,
-1.011989, -0.7371954, -1.402725, 0, 0, 0, 1, 1,
-1.008184, 1.355888, -0.9346573, 0, 0, 0, 1, 1,
-1.006937, -1.460966, -3.915719, 0, 0, 0, 1, 1,
-1.002607, 1.377854, 0.4445455, 0, 0, 0, 1, 1,
-0.9977228, 0.1937018, 0.01429057, 0, 0, 0, 1, 1,
-0.9911107, 0.4941473, -2.649287, 0, 0, 0, 1, 1,
-0.9889668, 1.585254, -1.135364, 0, 0, 0, 1, 1,
-0.9846657, -0.5859319, -2.078256, 1, 1, 1, 1, 1,
-0.9755545, 0.008918951, -2.18937, 1, 1, 1, 1, 1,
-0.9736085, -1.073576, -2.556175, 1, 1, 1, 1, 1,
-0.9657387, 1.873303, -2.791472, 1, 1, 1, 1, 1,
-0.9628998, 0.1871976, -1.63726, 1, 1, 1, 1, 1,
-0.9627773, -0.8617196, -2.682648, 1, 1, 1, 1, 1,
-0.9543303, 0.7773406, -0.7177563, 1, 1, 1, 1, 1,
-0.9542809, 0.3611246, -2.563719, 1, 1, 1, 1, 1,
-0.9525774, 1.422857, 0.4526561, 1, 1, 1, 1, 1,
-0.9445986, 1.255941, -1.426232, 1, 1, 1, 1, 1,
-0.9440336, -0.5002437, -1.570286, 1, 1, 1, 1, 1,
-0.9422171, -0.926432, -1.339656, 1, 1, 1, 1, 1,
-0.9417094, 0.02795117, -0.5745928, 1, 1, 1, 1, 1,
-0.9384258, -0.1350564, -2.044848, 1, 1, 1, 1, 1,
-0.9384074, -0.4432622, -1.154277, 1, 1, 1, 1, 1,
-0.9339152, 1.022464, -1.558828, 0, 0, 1, 1, 1,
-0.9282436, -1.498192, -2.230806, 1, 0, 0, 1, 1,
-0.9226243, 0.03713978, -1.340336, 1, 0, 0, 1, 1,
-0.9185774, 0.1114015, -2.012654, 1, 0, 0, 1, 1,
-0.9170837, 0.3460905, -1.799589, 1, 0, 0, 1, 1,
-0.9170775, -0.1808099, -0.02500946, 1, 0, 0, 1, 1,
-0.903286, 1.841197, -0.4683759, 0, 0, 0, 1, 1,
-0.8991463, -1.427405, -1.763327, 0, 0, 0, 1, 1,
-0.896534, -0.147544, -3.050209, 0, 0, 0, 1, 1,
-0.8918457, -1.497862, -1.896002, 0, 0, 0, 1, 1,
-0.8844485, -0.8492454, -2.377419, 0, 0, 0, 1, 1,
-0.8837909, 1.517563, -1.28981, 0, 0, 0, 1, 1,
-0.8834019, 0.002157767, -1.145117, 0, 0, 0, 1, 1,
-0.8802515, 1.465869, 0.8917341, 1, 1, 1, 1, 1,
-0.8762442, 0.3414512, 1.160226, 1, 1, 1, 1, 1,
-0.8738621, 0.3997658, -2.653654, 1, 1, 1, 1, 1,
-0.8677956, 0.3588956, 1.384241, 1, 1, 1, 1, 1,
-0.8581827, 0.5650444, -0.9273988, 1, 1, 1, 1, 1,
-0.8536195, 0.1195409, -0.7501274, 1, 1, 1, 1, 1,
-0.8462698, -0.2833143, -1.150006, 1, 1, 1, 1, 1,
-0.8421929, -0.1184952, -0.9458783, 1, 1, 1, 1, 1,
-0.8402237, 0.1477726, -0.9045594, 1, 1, 1, 1, 1,
-0.8305719, -0.05482697, -3.241636, 1, 1, 1, 1, 1,
-0.8256053, -2.047625, -2.656873, 1, 1, 1, 1, 1,
-0.8233227, -0.7619207, -1.819701, 1, 1, 1, 1, 1,
-0.8183978, -0.03982145, -2.560223, 1, 1, 1, 1, 1,
-0.8040657, 1.221222, -0.5883119, 1, 1, 1, 1, 1,
-0.8028966, 0.51741, -1.409331, 1, 1, 1, 1, 1,
-0.8008779, 0.8980268, -0.5075829, 0, 0, 1, 1, 1,
-0.7952218, -0.9831104, -2.308563, 1, 0, 0, 1, 1,
-0.78908, -0.9454901, -2.868528, 1, 0, 0, 1, 1,
-0.7872083, -0.1877041, -1.881682, 1, 0, 0, 1, 1,
-0.7838573, 0.6015146, -1.308765, 1, 0, 0, 1, 1,
-0.7809576, 0.05967361, 0.363427, 1, 0, 0, 1, 1,
-0.7751044, -0.4003709, -1.739681, 0, 0, 0, 1, 1,
-0.7691786, -1.386354, -2.315496, 0, 0, 0, 1, 1,
-0.7659742, 1.054872, -1.803129, 0, 0, 0, 1, 1,
-0.7649048, -0.8986878, -3.189116, 0, 0, 0, 1, 1,
-0.76233, 1.23097, 0.8381357, 0, 0, 0, 1, 1,
-0.7621237, -0.1996027, -1.880851, 0, 0, 0, 1, 1,
-0.7620566, 1.687988, -1.197268, 0, 0, 0, 1, 1,
-0.7618741, 1.567919, 0.5182065, 1, 1, 1, 1, 1,
-0.7602208, -1.889741, -2.687764, 1, 1, 1, 1, 1,
-0.7572716, 1.207512, -0.645337, 1, 1, 1, 1, 1,
-0.7528499, -0.2126059, -3.263619, 1, 1, 1, 1, 1,
-0.7412165, -0.5185168, -2.626081, 1, 1, 1, 1, 1,
-0.7405567, 0.5291626, -0.7959068, 1, 1, 1, 1, 1,
-0.7253312, 0.7701339, -0.4809858, 1, 1, 1, 1, 1,
-0.7219084, -1.100456, -4.169738, 1, 1, 1, 1, 1,
-0.7209951, 0.3381791, -2.682467, 1, 1, 1, 1, 1,
-0.7187811, 1.537341, -2.48055, 1, 1, 1, 1, 1,
-0.7116492, -1.320928, -2.810909, 1, 1, 1, 1, 1,
-0.7086088, 0.9976463, 1.111336, 1, 1, 1, 1, 1,
-0.7054801, 0.5636852, -1.663549, 1, 1, 1, 1, 1,
-0.7037765, -1.053255, -4.385585, 1, 1, 1, 1, 1,
-0.7000387, -0.4434334, -2.255131, 1, 1, 1, 1, 1,
-0.6969845, -0.2724538, -1.527226, 0, 0, 1, 1, 1,
-0.6947331, 2.004022, 0.001867842, 1, 0, 0, 1, 1,
-0.6908087, -0.9006813, -3.177316, 1, 0, 0, 1, 1,
-0.6821099, -1.003769, -0.2599408, 1, 0, 0, 1, 1,
-0.6728953, 0.5227824, 0.6881399, 1, 0, 0, 1, 1,
-0.6684538, -1.02507, -2.589489, 1, 0, 0, 1, 1,
-0.6614285, -1.270012, -1.267406, 0, 0, 0, 1, 1,
-0.655156, -0.4426424, -2.720162, 0, 0, 0, 1, 1,
-0.65224, 2.163939, 0.1024376, 0, 0, 0, 1, 1,
-0.6508493, -1.526184, -2.494645, 0, 0, 0, 1, 1,
-0.6455725, 1.772715, 0.1851879, 0, 0, 0, 1, 1,
-0.6450331, 1.257618, 0.1885937, 0, 0, 0, 1, 1,
-0.6400065, -2.54637, -2.172581, 0, 0, 0, 1, 1,
-0.6354612, 0.707462, -2.027934, 1, 1, 1, 1, 1,
-0.633334, 0.5734311, -0.4895611, 1, 1, 1, 1, 1,
-0.6315685, -0.8952355, -1.478086, 1, 1, 1, 1, 1,
-0.628419, -0.1296734, -2.583879, 1, 1, 1, 1, 1,
-0.626882, 1.013478, -0.169947, 1, 1, 1, 1, 1,
-0.6200455, 0.4351949, -0.7243596, 1, 1, 1, 1, 1,
-0.6151131, 0.04475254, -1.764146, 1, 1, 1, 1, 1,
-0.613077, -0.4912126, -3.541318, 1, 1, 1, 1, 1,
-0.6115125, 1.205297, -0.5039321, 1, 1, 1, 1, 1,
-0.6106196, -0.2480139, -1.415343, 1, 1, 1, 1, 1,
-0.6093804, -0.09104105, -4.070908, 1, 1, 1, 1, 1,
-0.6022443, -0.8126936, -4.462907, 1, 1, 1, 1, 1,
-0.601343, 1.224806, 0.03795023, 1, 1, 1, 1, 1,
-0.5977368, -0.03783579, -2.444034, 1, 1, 1, 1, 1,
-0.5952666, 0.7423404, -1.295517, 1, 1, 1, 1, 1,
-0.5903734, -0.3233695, -0.8131034, 0, 0, 1, 1, 1,
-0.5866873, -0.1357674, -3.223523, 1, 0, 0, 1, 1,
-0.5849941, -0.6234612, -2.08602, 1, 0, 0, 1, 1,
-0.5787463, -0.8142015, -5.359549, 1, 0, 0, 1, 1,
-0.5742049, -1.658051, -2.719332, 1, 0, 0, 1, 1,
-0.5673978, 1.503959, -1.300598, 1, 0, 0, 1, 1,
-0.5663555, 0.1503216, -1.575915, 0, 0, 0, 1, 1,
-0.564831, 1.231248, -0.3911298, 0, 0, 0, 1, 1,
-0.5612944, -0.5137404, -2.127413, 0, 0, 0, 1, 1,
-0.5569187, -1.096387, -2.730016, 0, 0, 0, 1, 1,
-0.5534164, -1.567361, -1.725825, 0, 0, 0, 1, 1,
-0.5525084, 0.06361768, -0.8692697, 0, 0, 0, 1, 1,
-0.5516925, -0.3159603, -2.118838, 0, 0, 0, 1, 1,
-0.5513134, -1.32903, -2.935255, 1, 1, 1, 1, 1,
-0.5465747, 1.722409, -1.642445, 1, 1, 1, 1, 1,
-0.545618, 1.054655, -0.1475881, 1, 1, 1, 1, 1,
-0.5449769, 2.254986, -0.9177469, 1, 1, 1, 1, 1,
-0.5444226, 0.0335899, 0.5113564, 1, 1, 1, 1, 1,
-0.5437066, 2.17722, 0.7966776, 1, 1, 1, 1, 1,
-0.5423837, 0.04341644, -2.524447, 1, 1, 1, 1, 1,
-0.5416548, 0.594674, -0.2445249, 1, 1, 1, 1, 1,
-0.5410493, 0.06295666, -1.265862, 1, 1, 1, 1, 1,
-0.5363689, -1.001157, -4.031502, 1, 1, 1, 1, 1,
-0.5339372, -0.2659862, -2.295288, 1, 1, 1, 1, 1,
-0.5314528, -1.15522, -3.40391, 1, 1, 1, 1, 1,
-0.5241172, 0.7369749, -1.334463, 1, 1, 1, 1, 1,
-0.5199761, -0.05828096, -0.9176001, 1, 1, 1, 1, 1,
-0.5174071, 0.08906788, -0.7001226, 1, 1, 1, 1, 1,
-0.5142359, 0.3000908, -1.09981, 0, 0, 1, 1, 1,
-0.5097401, -0.6129375, -2.284705, 1, 0, 0, 1, 1,
-0.5078032, -0.514105, -1.967695, 1, 0, 0, 1, 1,
-0.5055693, 1.479686, 0.9471764, 1, 0, 0, 1, 1,
-0.5039121, 0.6254307, -1.71704, 1, 0, 0, 1, 1,
-0.5037096, -0.5421972, -0.9497058, 1, 0, 0, 1, 1,
-0.5002407, 1.70383, -0.3981296, 0, 0, 0, 1, 1,
-0.4993427, 0.7221508, -0.01045864, 0, 0, 0, 1, 1,
-0.496993, -0.8619205, -2.591763, 0, 0, 0, 1, 1,
-0.4935736, -0.1172785, -2.755617, 0, 0, 0, 1, 1,
-0.4792445, -1.348242, -3.988114, 0, 0, 0, 1, 1,
-0.4723801, 0.5804546, -0.8457817, 0, 0, 0, 1, 1,
-0.4631261, 0.5620998, 0.01577047, 0, 0, 0, 1, 1,
-0.4621837, -1.0217, -2.20497, 1, 1, 1, 1, 1,
-0.4601403, 1.508648, 0.5591887, 1, 1, 1, 1, 1,
-0.45975, -0.5588973, -2.754359, 1, 1, 1, 1, 1,
-0.4565555, -0.4729322, -1.52818, 1, 1, 1, 1, 1,
-0.4564341, 0.4684355, -1.979469, 1, 1, 1, 1, 1,
-0.4522623, -0.3710103, -1.650252, 1, 1, 1, 1, 1,
-0.4472235, 0.821506, -0.2631033, 1, 1, 1, 1, 1,
-0.4458742, -1.44887, -1.653345, 1, 1, 1, 1, 1,
-0.4454905, 1.362087, 0.1557812, 1, 1, 1, 1, 1,
-0.4449096, 0.6355976, -0.7657629, 1, 1, 1, 1, 1,
-0.4437328, 0.0636313, -2.260873, 1, 1, 1, 1, 1,
-0.4373733, -0.2680333, -3.452379, 1, 1, 1, 1, 1,
-0.4333836, 0.6439341, -1.226557, 1, 1, 1, 1, 1,
-0.4324849, -0.5729671, -1.709333, 1, 1, 1, 1, 1,
-0.4283012, 1.144007, -0.4387786, 1, 1, 1, 1, 1,
-0.4282982, 0.1364436, -1.214455, 0, 0, 1, 1, 1,
-0.4263082, 2.668046, -1.112907, 1, 0, 0, 1, 1,
-0.4258983, 2.053184, 1.296212, 1, 0, 0, 1, 1,
-0.4227902, 0.8687518, -3.31046, 1, 0, 0, 1, 1,
-0.4220381, 0.05217319, -2.497527, 1, 0, 0, 1, 1,
-0.4180667, -0.7949473, -3.505899, 1, 0, 0, 1, 1,
-0.4168006, 0.3318541, -0.5889744, 0, 0, 0, 1, 1,
-0.4106845, 0.8877124, 0.7440765, 0, 0, 0, 1, 1,
-0.4091103, 0.2379278, 0.01481424, 0, 0, 0, 1, 1,
-0.4053823, 0.2646016, -0.8052575, 0, 0, 0, 1, 1,
-0.4050162, 0.002329405, -0.8406055, 0, 0, 0, 1, 1,
-0.403883, -0.9359272, -2.442119, 0, 0, 0, 1, 1,
-0.4027719, 0.06963616, -1.75482, 0, 0, 0, 1, 1,
-0.4004603, 0.6284239, 0.601196, 1, 1, 1, 1, 1,
-0.3994896, -0.9582517, -2.19294, 1, 1, 1, 1, 1,
-0.3987257, -0.8178239, -1.454213, 1, 1, 1, 1, 1,
-0.3986974, 0.9471892, -1.060547, 1, 1, 1, 1, 1,
-0.392172, 0.1720171, -1.861572, 1, 1, 1, 1, 1,
-0.3918973, -1.563337, -5.612089, 1, 1, 1, 1, 1,
-0.3890015, -0.7744572, -3.169019, 1, 1, 1, 1, 1,
-0.3844136, -0.5901617, -4.760353, 1, 1, 1, 1, 1,
-0.3814724, 1.857702, 0.8566059, 1, 1, 1, 1, 1,
-0.3813314, -1.0238, -2.776168, 1, 1, 1, 1, 1,
-0.3798072, 0.1144367, -1.475078, 1, 1, 1, 1, 1,
-0.378956, 0.9982372, 0.1105506, 1, 1, 1, 1, 1,
-0.3759263, -0.5835685, -3.10523, 1, 1, 1, 1, 1,
-0.3750806, 0.8727338, -2.055355, 1, 1, 1, 1, 1,
-0.3635661, 1.008513, -0.9820618, 1, 1, 1, 1, 1,
-0.357747, 0.1011865, -1.546595, 0, 0, 1, 1, 1,
-0.3545839, 0.1624892, -1.557677, 1, 0, 0, 1, 1,
-0.3531042, 1.162265, 0.3066148, 1, 0, 0, 1, 1,
-0.3528919, -0.8930304, -1.96238, 1, 0, 0, 1, 1,
-0.3508019, -0.5214868, -2.829733, 1, 0, 0, 1, 1,
-0.3403084, 1.530492, 0.4538255, 1, 0, 0, 1, 1,
-0.3368081, 0.03499627, -1.441954, 0, 0, 0, 1, 1,
-0.3360239, -0.3979059, -1.069728, 0, 0, 0, 1, 1,
-0.3320937, -0.4003364, -2.477757, 0, 0, 0, 1, 1,
-0.332083, -1.376854, -2.905015, 0, 0, 0, 1, 1,
-0.3292894, 0.2268167, -1.474227, 0, 0, 0, 1, 1,
-0.3266114, -0.7519196, -2.545878, 0, 0, 0, 1, 1,
-0.3252283, 0.5988997, -1.338565, 0, 0, 0, 1, 1,
-0.3233676, 1.024955, -0.5447569, 1, 1, 1, 1, 1,
-0.3197756, -0.5168158, -2.626258, 1, 1, 1, 1, 1,
-0.3193872, -0.005614207, -1.058545, 1, 1, 1, 1, 1,
-0.3152492, -0.1799078, -2.980262, 1, 1, 1, 1, 1,
-0.3123612, 0.2302145, -2.339192, 1, 1, 1, 1, 1,
-0.3049136, -0.3151001, -0.2428668, 1, 1, 1, 1, 1,
-0.3000845, -1.91426, -3.370203, 1, 1, 1, 1, 1,
-0.2948627, 0.7069045, -0.07879321, 1, 1, 1, 1, 1,
-0.2935177, 0.7846292, -0.02301783, 1, 1, 1, 1, 1,
-0.2887203, 0.584623, -0.5116408, 1, 1, 1, 1, 1,
-0.2859809, 0.5998175, -0.7301906, 1, 1, 1, 1, 1,
-0.2815981, -0.6594736, -3.851477, 1, 1, 1, 1, 1,
-0.2810927, -0.07700974, -2.447212, 1, 1, 1, 1, 1,
-0.2798617, -0.834068, -2.728468, 1, 1, 1, 1, 1,
-0.2774732, 0.2536962, -0.6321183, 1, 1, 1, 1, 1,
-0.2763416, -1.007945, -2.214364, 0, 0, 1, 1, 1,
-0.2736158, 1.245976, 0.3674969, 1, 0, 0, 1, 1,
-0.2732066, -0.9377417, -4.697503, 1, 0, 0, 1, 1,
-0.2727677, 0.9344164, -1.200231, 1, 0, 0, 1, 1,
-0.2712356, 0.2881236, 0.8648169, 1, 0, 0, 1, 1,
-0.2694853, -1.541041, -2.219577, 1, 0, 0, 1, 1,
-0.2676834, 0.8633095, 0.5115263, 0, 0, 0, 1, 1,
-0.2672481, 0.4816986, 0.05504109, 0, 0, 0, 1, 1,
-0.2638331, -0.9583764, -4.262728, 0, 0, 0, 1, 1,
-0.262596, -1.310032, -2.277283, 0, 0, 0, 1, 1,
-0.2593347, 1.353569, 0.3901059, 0, 0, 0, 1, 1,
-0.2535578, 0.525382, 1.081436, 0, 0, 0, 1, 1,
-0.2504606, 0.7549219, -0.07688528, 0, 0, 0, 1, 1,
-0.244899, 0.04072261, -0.6688436, 1, 1, 1, 1, 1,
-0.2437456, -1.099052, -0.9440871, 1, 1, 1, 1, 1,
-0.2420192, 0.2080198, -0.3015944, 1, 1, 1, 1, 1,
-0.2397161, -0.7956821, -2.57859, 1, 1, 1, 1, 1,
-0.2394587, -1.622847, -2.117967, 1, 1, 1, 1, 1,
-0.2373504, 0.5319726, 0.652208, 1, 1, 1, 1, 1,
-0.2360554, -0.4928149, -0.8780841, 1, 1, 1, 1, 1,
-0.232627, -0.9871876, -3.669027, 1, 1, 1, 1, 1,
-0.2297995, -0.2420591, -4.223554, 1, 1, 1, 1, 1,
-0.2286856, 0.6945452, 1.194231, 1, 1, 1, 1, 1,
-0.2282666, -0.793716, -2.712071, 1, 1, 1, 1, 1,
-0.2208352, 0.7511758, -0.6135535, 1, 1, 1, 1, 1,
-0.2204406, -0.8843365, -3.035894, 1, 1, 1, 1, 1,
-0.2200594, -0.4748754, -1.457137, 1, 1, 1, 1, 1,
-0.2174911, 0.9141371, 0.005111048, 1, 1, 1, 1, 1,
-0.2165183, -1.575747, -2.239761, 0, 0, 1, 1, 1,
-0.2152735, -0.3267468, -1.974792, 1, 0, 0, 1, 1,
-0.2149237, 0.8906422, 1.841572, 1, 0, 0, 1, 1,
-0.2129072, -1.800002, -2.178094, 1, 0, 0, 1, 1,
-0.2125133, -1.30014, -4.595145, 1, 0, 0, 1, 1,
-0.2110642, -1.402087, -4.720512, 1, 0, 0, 1, 1,
-0.2072302, 0.7072197, -1.669726, 0, 0, 0, 1, 1,
-0.2055054, 0.321819, -1.276658, 0, 0, 0, 1, 1,
-0.2048173, 0.05098097, -3.247273, 0, 0, 0, 1, 1,
-0.2022105, 0.02748304, -0.4923364, 0, 0, 0, 1, 1,
-0.2007094, 1.502606, 0.3758728, 0, 0, 0, 1, 1,
-0.1988636, -0.3949031, -2.332371, 0, 0, 0, 1, 1,
-0.1984505, -0.05475067, -3.566985, 0, 0, 0, 1, 1,
-0.1972307, -1.654225, -3.180801, 1, 1, 1, 1, 1,
-0.195054, -1.607166, -2.08333, 1, 1, 1, 1, 1,
-0.1948069, 0.9387431, 1.522342, 1, 1, 1, 1, 1,
-0.1909136, 0.8417796, -1.153336, 1, 1, 1, 1, 1,
-0.1905309, -0.4717311, -3.239176, 1, 1, 1, 1, 1,
-0.1898603, -0.2239601, -0.9506286, 1, 1, 1, 1, 1,
-0.1870082, 0.2082277, -2.082673, 1, 1, 1, 1, 1,
-0.1842647, -1.886402, -3.274027, 1, 1, 1, 1, 1,
-0.1804724, -1.289026, -1.455998, 1, 1, 1, 1, 1,
-0.1774001, 0.2671438, -1.107125, 1, 1, 1, 1, 1,
-0.1761952, 1.046444, -0.9532028, 1, 1, 1, 1, 1,
-0.1758308, 0.09226732, -1.118624, 1, 1, 1, 1, 1,
-0.1743553, -0.6291533, -4.075499, 1, 1, 1, 1, 1,
-0.1701382, -1.247831, -3.314523, 1, 1, 1, 1, 1,
-0.1679579, -0.4471789, -4.088075, 1, 1, 1, 1, 1,
-0.1654831, -1.405252, -3.002767, 0, 0, 1, 1, 1,
-0.1651228, 0.9978728, 1.503918, 1, 0, 0, 1, 1,
-0.1636496, -1.674132, -4.140028, 1, 0, 0, 1, 1,
-0.1631879, 0.1482467, 0.3368252, 1, 0, 0, 1, 1,
-0.1609736, -1.270663, -2.622664, 1, 0, 0, 1, 1,
-0.1606811, 0.589123, -1.344272, 1, 0, 0, 1, 1,
-0.1605004, 2.109789, 1.913613, 0, 0, 0, 1, 1,
-0.1571801, 1.298663, 0.9215719, 0, 0, 0, 1, 1,
-0.1531124, -0.9484625, -2.008007, 0, 0, 0, 1, 1,
-0.1503059, 0.06282635, -0.4731223, 0, 0, 0, 1, 1,
-0.1481888, 0.2694917, -0.3658803, 0, 0, 0, 1, 1,
-0.1412049, 0.774423, 2.091862, 0, 0, 0, 1, 1,
-0.1396636, 1.006254, -0.747293, 0, 0, 0, 1, 1,
-0.1368572, 0.1217456, -2.051393, 1, 1, 1, 1, 1,
-0.1361582, 0.6499066, -0.8243825, 1, 1, 1, 1, 1,
-0.1349291, -0.9324753, -2.613747, 1, 1, 1, 1, 1,
-0.1304029, 0.1958354, 0.1157993, 1, 1, 1, 1, 1,
-0.1303388, 2.505335, -0.8358448, 1, 1, 1, 1, 1,
-0.1296635, 0.5519896, 0.551844, 1, 1, 1, 1, 1,
-0.1291233, 1.351298, -0.4186789, 1, 1, 1, 1, 1,
-0.1287173, -1.44355, -2.300215, 1, 1, 1, 1, 1,
-0.1264138, 1.229818, -0.5553543, 1, 1, 1, 1, 1,
-0.1250148, -1.251132, -1.260045, 1, 1, 1, 1, 1,
-0.1213927, -0.5492335, -1.762815, 1, 1, 1, 1, 1,
-0.1143058, 0.6616663, -0.5898717, 1, 1, 1, 1, 1,
-0.1136594, -0.803978, -2.54869, 1, 1, 1, 1, 1,
-0.1056489, 0.2557473, 1.05543, 1, 1, 1, 1, 1,
-0.1050128, 0.1961592, -1.373153, 1, 1, 1, 1, 1,
-0.1022262, -1.878457, -3.749129, 0, 0, 1, 1, 1,
-0.1009794, 1.585991, 0.5060546, 1, 0, 0, 1, 1,
-0.1004333, 0.1221648, -1.019499, 1, 0, 0, 1, 1,
-0.09990107, 1.353085, -0.6634826, 1, 0, 0, 1, 1,
-0.09878635, -1.26989, -4.040092, 1, 0, 0, 1, 1,
-0.09616011, 0.2105695, -0.654394, 1, 0, 0, 1, 1,
-0.09519277, -0.7878432, -3.005949, 0, 0, 0, 1, 1,
-0.08001897, 0.6663164, -0.08279537, 0, 0, 0, 1, 1,
-0.07829866, 0.2648008, -0.06498821, 0, 0, 0, 1, 1,
-0.07805064, 1.024704, 0.4077451, 0, 0, 0, 1, 1,
-0.07749391, 0.6662522, 1.271513, 0, 0, 0, 1, 1,
-0.0724779, 0.5127002, 0.0001398152, 0, 0, 0, 1, 1,
-0.06998143, 0.1506778, -0.1258201, 0, 0, 0, 1, 1,
-0.068153, -0.8007478, -1.710892, 1, 1, 1, 1, 1,
-0.06556035, -0.1331209, -1.346508, 1, 1, 1, 1, 1,
-0.06475828, -1.202567, -1.597663, 1, 1, 1, 1, 1,
-0.06386341, 0.7559248, 0.253519, 1, 1, 1, 1, 1,
-0.06375471, 0.5188482, -0.2047866, 1, 1, 1, 1, 1,
-0.06357505, 2.47112, 0.7900802, 1, 1, 1, 1, 1,
-0.06221655, 1.153606, 0.9167794, 1, 1, 1, 1, 1,
-0.06139217, 0.1196759, -0.7816766, 1, 1, 1, 1, 1,
-0.06022584, -0.2344523, -2.744743, 1, 1, 1, 1, 1,
-0.0595219, 0.2441538, -0.3194901, 1, 1, 1, 1, 1,
-0.05098737, 1.189812, -0.1980622, 1, 1, 1, 1, 1,
-0.04823761, 0.3130935, 0.1508288, 1, 1, 1, 1, 1,
-0.04568153, -1.938865, -2.571929, 1, 1, 1, 1, 1,
-0.0441378, -0.7520091, -2.871608, 1, 1, 1, 1, 1,
-0.04351223, 1.904364, 1.019003, 1, 1, 1, 1, 1,
-0.04296212, 0.8691096, -0.7475282, 0, 0, 1, 1, 1,
-0.04294236, -0.4621609, -2.532122, 1, 0, 0, 1, 1,
-0.04274512, -1.300852, -3.114557, 1, 0, 0, 1, 1,
-0.04128344, -0.6175419, -3.500282, 1, 0, 0, 1, 1,
-0.0352462, 1.303265, 1.512879, 1, 0, 0, 1, 1,
-0.03431158, 1.197853, -0.2268182, 1, 0, 0, 1, 1,
-0.03268852, 2.684267, 1.245083, 0, 0, 0, 1, 1,
-0.03048867, 0.9101444, -0.4114277, 0, 0, 0, 1, 1,
-0.02584937, 1.666537, -0.2609907, 0, 0, 0, 1, 1,
-0.0199041, -1.5453, -3.925097, 0, 0, 0, 1, 1,
-0.01877666, -1.470836, -4.118309, 0, 0, 0, 1, 1,
-0.007946427, -0.2273609, -4.725339, 0, 0, 0, 1, 1,
-0.004164173, 0.5275033, 1.560524, 0, 0, 0, 1, 1,
-0.001790686, -0.3543094, -3.107045, 1, 1, 1, 1, 1,
0.0009468507, -0.007528124, 4.533117, 1, 1, 1, 1, 1,
0.006221979, -0.1344661, 3.205721, 1, 1, 1, 1, 1,
0.007894273, 1.490109, -0.1404928, 1, 1, 1, 1, 1,
0.009537988, -1.282691, 2.824527, 1, 1, 1, 1, 1,
0.01209701, 0.5430538, -0.9616483, 1, 1, 1, 1, 1,
0.01655851, 0.8799189, -0.08989, 1, 1, 1, 1, 1,
0.01737613, -2.433223, 5.02837, 1, 1, 1, 1, 1,
0.01780535, -0.0544706, 3.99292, 1, 1, 1, 1, 1,
0.02208794, 0.3262294, -1.239008, 1, 1, 1, 1, 1,
0.025938, 0.339231, 0.2118236, 1, 1, 1, 1, 1,
0.02671811, 0.6422653, -0.9115783, 1, 1, 1, 1, 1,
0.030664, -0.8664368, 2.899834, 1, 1, 1, 1, 1,
0.03109334, -0.6051511, 2.819327, 1, 1, 1, 1, 1,
0.03124227, -0.03523161, 0.5415018, 1, 1, 1, 1, 1,
0.03963286, 0.2569697, 1.989497, 0, 0, 1, 1, 1,
0.04081602, -0.4179485, 3.102765, 1, 0, 0, 1, 1,
0.04111726, -2.597231, 2.597172, 1, 0, 0, 1, 1,
0.04455724, -1.740359, 2.432553, 1, 0, 0, 1, 1,
0.04974629, 0.9824383, -0.5054582, 1, 0, 0, 1, 1,
0.05016676, -0.07958269, 2.86252, 1, 0, 0, 1, 1,
0.05029561, -2.082544, 2.11211, 0, 0, 0, 1, 1,
0.05951356, -0.855104, 4.137682, 0, 0, 0, 1, 1,
0.06157226, -1.823357, 3.667713, 0, 0, 0, 1, 1,
0.06294398, -0.5544787, 3.508008, 0, 0, 0, 1, 1,
0.06379966, -0.9826567, 2.752542, 0, 0, 0, 1, 1,
0.06944191, -0.6501386, 2.118343, 0, 0, 0, 1, 1,
0.06972574, -0.6011701, 2.464899, 0, 0, 0, 1, 1,
0.06997182, 0.801528, 0.7632434, 1, 1, 1, 1, 1,
0.07384327, 1.973055, -1.228619, 1, 1, 1, 1, 1,
0.07993507, 0.3647382, 0.878939, 1, 1, 1, 1, 1,
0.08134854, 0.9172655, -0.03555881, 1, 1, 1, 1, 1,
0.08313362, -1.016218, 1.572133, 1, 1, 1, 1, 1,
0.08480911, -0.06291807, 1.29841, 1, 1, 1, 1, 1,
0.08867745, -0.7145585, 3.980568, 1, 1, 1, 1, 1,
0.08956567, -1.355423, 2.251764, 1, 1, 1, 1, 1,
0.09298125, 0.1209254, 0.2966276, 1, 1, 1, 1, 1,
0.09346449, -0.5903332, 2.866386, 1, 1, 1, 1, 1,
0.09860269, 0.5808586, 0.7757432, 1, 1, 1, 1, 1,
0.1022916, 1.005976, -1.08848, 1, 1, 1, 1, 1,
0.1027505, -0.1718888, 2.204353, 1, 1, 1, 1, 1,
0.1042154, 2.252988, -0.3340163, 1, 1, 1, 1, 1,
0.1156476, 1.821465, -0.1537001, 1, 1, 1, 1, 1,
0.1159534, 0.8478931, 0.5593996, 0, 0, 1, 1, 1,
0.1182633, -0.257463, 1.975278, 1, 0, 0, 1, 1,
0.1196302, -0.2391571, 2.83441, 1, 0, 0, 1, 1,
0.1222973, -0.6656467, 3.237552, 1, 0, 0, 1, 1,
0.1228552, -0.4906943, 2.373592, 1, 0, 0, 1, 1,
0.1228894, -1.028722, 1.774549, 1, 0, 0, 1, 1,
0.1238775, 0.2620929, 1.852935, 0, 0, 0, 1, 1,
0.1352385, -0.1829218, 2.887369, 0, 0, 0, 1, 1,
0.1355902, -1.496425, 3.648637, 0, 0, 0, 1, 1,
0.1383334, -2.339733, 1.821263, 0, 0, 0, 1, 1,
0.1485784, 0.3661319, -0.4696864, 0, 0, 0, 1, 1,
0.1488582, -0.9089406, 3.227434, 0, 0, 0, 1, 1,
0.1497341, 2.361545, 0.7347549, 0, 0, 0, 1, 1,
0.1499837, -0.2098411, 3.57954, 1, 1, 1, 1, 1,
0.1512409, -1.292758, 4.375731, 1, 1, 1, 1, 1,
0.1514662, -1.056255, 2.594254, 1, 1, 1, 1, 1,
0.1527669, -0.9103283, 1.953223, 1, 1, 1, 1, 1,
0.154428, 0.04414896, -0.2628351, 1, 1, 1, 1, 1,
0.1559067, -0.3412975, 3.140558, 1, 1, 1, 1, 1,
0.156514, 1.240456, 0.09489001, 1, 1, 1, 1, 1,
0.1590106, 1.009194, -0.02207784, 1, 1, 1, 1, 1,
0.1615667, 0.2729228, 0.3949773, 1, 1, 1, 1, 1,
0.1646293, 0.5014302, 0.2024656, 1, 1, 1, 1, 1,
0.1649912, -0.07359252, 3.142705, 1, 1, 1, 1, 1,
0.1674625, 0.6827585, 0.2645288, 1, 1, 1, 1, 1,
0.1674758, 1.394784, -0.5692334, 1, 1, 1, 1, 1,
0.1719564, 1.344674, -0.7896711, 1, 1, 1, 1, 1,
0.1729013, 0.006703889, 2.7377, 1, 1, 1, 1, 1,
0.1736826, 1.654304, -0.210366, 0, 0, 1, 1, 1,
0.178762, -0.4623865, 3.061942, 1, 0, 0, 1, 1,
0.1821764, 1.120084, 1.001282, 1, 0, 0, 1, 1,
0.1827167, 1.152982, 0.2166608, 1, 0, 0, 1, 1,
0.1840224, -0.03446946, 0.7542546, 1, 0, 0, 1, 1,
0.1859661, -0.01375241, 1.115574, 1, 0, 0, 1, 1,
0.1883676, -0.5507332, 3.718574, 0, 0, 0, 1, 1,
0.1889247, -0.06758273, 1.058823, 0, 0, 0, 1, 1,
0.1894643, -1.834052, 3.060225, 0, 0, 0, 1, 1,
0.1910818, -1.475793, 3.82477, 0, 0, 0, 1, 1,
0.1914569, -0.673982, 2.094666, 0, 0, 0, 1, 1,
0.1928733, 0.1938109, -0.691945, 0, 0, 0, 1, 1,
0.1946557, -0.02542225, -0.6166683, 0, 0, 0, 1, 1,
0.196048, 0.6116915, -0.2744845, 1, 1, 1, 1, 1,
0.2031168, 2.108178, -0.5646124, 1, 1, 1, 1, 1,
0.204156, 0.6117768, -1.140669, 1, 1, 1, 1, 1,
0.205026, 1.442022, -0.2146715, 1, 1, 1, 1, 1,
0.2065959, -0.4961093, 3.751629, 1, 1, 1, 1, 1,
0.2105324, 0.5948678, 0.4150091, 1, 1, 1, 1, 1,
0.211205, 0.5880545, 1.901555, 1, 1, 1, 1, 1,
0.2124768, -1.223599, 2.299851, 1, 1, 1, 1, 1,
0.2154809, 0.09787147, 0.7731577, 1, 1, 1, 1, 1,
0.216341, -0.1215904, 3.494753, 1, 1, 1, 1, 1,
0.2206627, 0.6244283, 1.507174, 1, 1, 1, 1, 1,
0.224647, -0.002567778, 1.390072, 1, 1, 1, 1, 1,
0.2255607, 1.199592, -0.9408427, 1, 1, 1, 1, 1,
0.2257221, -1.322152, 0.393972, 1, 1, 1, 1, 1,
0.2259009, -0.9737456, 2.982695, 1, 1, 1, 1, 1,
0.2267074, -1.492868, 3.906577, 0, 0, 1, 1, 1,
0.229638, -1.924158, 3.728606, 1, 0, 0, 1, 1,
0.230145, -0.7104601, 1.430388, 1, 0, 0, 1, 1,
0.2352715, -0.138296, 1.469112, 1, 0, 0, 1, 1,
0.2357806, -0.9834018, 5.173672, 1, 0, 0, 1, 1,
0.2369123, 0.4384491, -0.7559785, 1, 0, 0, 1, 1,
0.2388369, -1.36463, 2.587604, 0, 0, 0, 1, 1,
0.2389942, -2.517644, 3.391216, 0, 0, 0, 1, 1,
0.2431572, -0.6134272, 3.393837, 0, 0, 0, 1, 1,
0.2477822, 1.602014, 0.7170386, 0, 0, 0, 1, 1,
0.2533931, -0.30089, 2.971829, 0, 0, 0, 1, 1,
0.2539309, -0.01912321, 1.15683, 0, 0, 0, 1, 1,
0.259024, 0.8087006, -0.3479894, 0, 0, 0, 1, 1,
0.2624929, 0.6978567, -0.6433028, 1, 1, 1, 1, 1,
0.2633129, 0.241332, -1.005049, 1, 1, 1, 1, 1,
0.2640219, -0.2419413, 0.818995, 1, 1, 1, 1, 1,
0.2668905, -0.7543142, 3.18368, 1, 1, 1, 1, 1,
0.2681251, -1.007093, 1.990271, 1, 1, 1, 1, 1,
0.2715261, 0.824529, -1.250489, 1, 1, 1, 1, 1,
0.2726398, 0.4529594, 2.466755, 1, 1, 1, 1, 1,
0.2753416, -0.2850581, 1.912495, 1, 1, 1, 1, 1,
0.2766619, -1.07757, 3.019256, 1, 1, 1, 1, 1,
0.2825533, -0.8075514, 4.704786, 1, 1, 1, 1, 1,
0.2862177, -0.09223884, 1.449175, 1, 1, 1, 1, 1,
0.2878495, -1.040131, 3.866856, 1, 1, 1, 1, 1,
0.2878571, 0.4480805, -0.02105478, 1, 1, 1, 1, 1,
0.2880437, 0.1991585, 2.33255, 1, 1, 1, 1, 1,
0.2898538, 1.329661, 0.5557455, 1, 1, 1, 1, 1,
0.2914492, -0.390538, 3.485475, 0, 0, 1, 1, 1,
0.2981359, -0.4511206, 3.621382, 1, 0, 0, 1, 1,
0.3007722, 0.07197877, 1.928693, 1, 0, 0, 1, 1,
0.3044014, -0.0952841, 2.153386, 1, 0, 0, 1, 1,
0.3156051, 0.2749595, -0.8814122, 1, 0, 0, 1, 1,
0.3168846, 0.8398713, 0.5159755, 1, 0, 0, 1, 1,
0.3198126, -0.5125384, 3.366824, 0, 0, 0, 1, 1,
0.3206734, -0.9686286, 4.116731, 0, 0, 0, 1, 1,
0.3259096, -0.4946507, 2.696553, 0, 0, 0, 1, 1,
0.3293144, 0.8334538, 0.8921058, 0, 0, 0, 1, 1,
0.329553, -0.1341777, 0.1009942, 0, 0, 0, 1, 1,
0.3313679, 0.2304212, 2.303953, 0, 0, 0, 1, 1,
0.3341147, -1.053305, 1.87427, 0, 0, 0, 1, 1,
0.3346452, 0.7822056, 0.0121687, 1, 1, 1, 1, 1,
0.3352055, -0.9976172, 2.313534, 1, 1, 1, 1, 1,
0.3412304, -0.01454256, 1.398736, 1, 1, 1, 1, 1,
0.3416619, 0.3508461, 0.7794192, 1, 1, 1, 1, 1,
0.3470904, -1.548272, 2.489899, 1, 1, 1, 1, 1,
0.3516092, -0.7204053, 3.827614, 1, 1, 1, 1, 1,
0.3529258, 1.27422, 0.6376976, 1, 1, 1, 1, 1,
0.3537144, -0.428006, 5.0873, 1, 1, 1, 1, 1,
0.3551117, -1.316702, 3.808469, 1, 1, 1, 1, 1,
0.3615004, -0.1634768, 3.86182, 1, 1, 1, 1, 1,
0.3669744, -0.3632155, 2.668681, 1, 1, 1, 1, 1,
0.3712516, -1.511799, 2.891733, 1, 1, 1, 1, 1,
0.371818, 0.7926495, 1.068164, 1, 1, 1, 1, 1,
0.3719168, 1.082203, -0.06491725, 1, 1, 1, 1, 1,
0.3733837, -1.457189, 1.457548, 1, 1, 1, 1, 1,
0.3763474, 0.3639291, 1.102864, 0, 0, 1, 1, 1,
0.3767457, 0.7264836, -0.05309452, 1, 0, 0, 1, 1,
0.3799712, 0.7927241, 0.6706936, 1, 0, 0, 1, 1,
0.3805155, -0.884461, 4.02253, 1, 0, 0, 1, 1,
0.3824358, -1.794239, 4.271605, 1, 0, 0, 1, 1,
0.3848862, 0.06545144, -1.069892, 1, 0, 0, 1, 1,
0.386894, 0.1477005, 0.217408, 0, 0, 0, 1, 1,
0.3898839, 0.6971908, 0.2558123, 0, 0, 0, 1, 1,
0.3947146, 0.4324814, -0.1015566, 0, 0, 0, 1, 1,
0.3956595, -0.5903012, 2.84476, 0, 0, 0, 1, 1,
0.395671, -0.398117, 3.233419, 0, 0, 0, 1, 1,
0.3969455, 0.7733854, 3.00771, 0, 0, 0, 1, 1,
0.3987301, 0.2828732, 2.877239, 0, 0, 0, 1, 1,
0.401313, -1.478818, 3.534126, 1, 1, 1, 1, 1,
0.4026835, -0.5957032, -0.2341484, 1, 1, 1, 1, 1,
0.4072083, -1.064821, 3.387594, 1, 1, 1, 1, 1,
0.4076526, -1.312346, 4.814527, 1, 1, 1, 1, 1,
0.4088493, 0.7780858, 0.2135867, 1, 1, 1, 1, 1,
0.4105517, -0.3642991, 1.047815, 1, 1, 1, 1, 1,
0.4152164, -0.6480647, 4.107623, 1, 1, 1, 1, 1,
0.4152966, -0.2492827, 2.160119, 1, 1, 1, 1, 1,
0.419686, -0.2328368, 2.217407, 1, 1, 1, 1, 1,
0.4214118, 0.1736628, 1.658966, 1, 1, 1, 1, 1,
0.4239413, 0.1781411, -1.29681, 1, 1, 1, 1, 1,
0.4239974, -1.238701, 2.845583, 1, 1, 1, 1, 1,
0.4250993, -1.547463, 2.740313, 1, 1, 1, 1, 1,
0.4255649, 0.9183815, 0.5419319, 1, 1, 1, 1, 1,
0.4263694, -1.797328, 4.016512, 1, 1, 1, 1, 1,
0.4308901, 0.751991, 0.1481674, 0, 0, 1, 1, 1,
0.4313076, 1.097557, -0.7251357, 1, 0, 0, 1, 1,
0.4377299, -1.532506, 2.854687, 1, 0, 0, 1, 1,
0.4381528, -0.7938463, 1.715066, 1, 0, 0, 1, 1,
0.4467465, -0.6004231, 3.08763, 1, 0, 0, 1, 1,
0.451352, -0.4324011, 2.459166, 1, 0, 0, 1, 1,
0.4516813, -1.222134, 4.056201, 0, 0, 0, 1, 1,
0.4603657, 1.17425, -1.277744, 0, 0, 0, 1, 1,
0.4617425, 0.09433974, 1.318659, 0, 0, 0, 1, 1,
0.4652838, -1.643617, 4.622782, 0, 0, 0, 1, 1,
0.4664877, -0.2281265, 4.787939, 0, 0, 0, 1, 1,
0.4727794, -0.05203638, 2.167116, 0, 0, 0, 1, 1,
0.4740466, -1.032781, 3.490511, 0, 0, 0, 1, 1,
0.4753109, -1.172789, 2.41907, 1, 1, 1, 1, 1,
0.4760264, 0.3735299, 1.993209, 1, 1, 1, 1, 1,
0.4788458, -0.5622296, 2.202855, 1, 1, 1, 1, 1,
0.4813527, -0.317626, 2.419435, 1, 1, 1, 1, 1,
0.4832161, 0.01142474, 0.6323241, 1, 1, 1, 1, 1,
0.4856198, 0.7481412, 2.024129, 1, 1, 1, 1, 1,
0.4885421, 0.5711201, -0.2942387, 1, 1, 1, 1, 1,
0.4909231, -1.519849, 3.530403, 1, 1, 1, 1, 1,
0.4949114, -0.3823353, 1.049099, 1, 1, 1, 1, 1,
0.5018278, -0.1470694, 2.053638, 1, 1, 1, 1, 1,
0.5106422, 1.144348, -0.4938345, 1, 1, 1, 1, 1,
0.5182258, 0.8287843, 0.9517246, 1, 1, 1, 1, 1,
0.5206495, -1.207293, 4.246367, 1, 1, 1, 1, 1,
0.5248848, -0.2934645, 2.87944, 1, 1, 1, 1, 1,
0.524887, -0.7125377, 3.898858, 1, 1, 1, 1, 1,
0.5252367, -0.6459613, 4.44692, 0, 0, 1, 1, 1,
0.5267119, -1.126182, 1.962116, 1, 0, 0, 1, 1,
0.5277399, 1.372628, 0.5693421, 1, 0, 0, 1, 1,
0.5282655, -0.6668485, 4.011164, 1, 0, 0, 1, 1,
0.5300307, 0.2344388, 0.7094015, 1, 0, 0, 1, 1,
0.5362775, -1.008792, 3.088156, 1, 0, 0, 1, 1,
0.53978, 0.2588983, -0.0288424, 0, 0, 0, 1, 1,
0.5436977, -1.728715, 3.167578, 0, 0, 0, 1, 1,
0.5444553, 0.5398386, -0.5978426, 0, 0, 0, 1, 1,
0.5470958, -0.1974614, 2.333103, 0, 0, 0, 1, 1,
0.5517777, -1.012579, 3.809221, 0, 0, 0, 1, 1,
0.5596963, -0.1231034, 3.884901, 0, 0, 0, 1, 1,
0.5616265, -0.8356234, 2.60615, 0, 0, 0, 1, 1,
0.5694772, 0.1317968, 1.09551, 1, 1, 1, 1, 1,
0.5795872, 0.6764074, -0.4115632, 1, 1, 1, 1, 1,
0.5825255, -0.4377829, 2.543991, 1, 1, 1, 1, 1,
0.5847967, -0.7000943, 2.043879, 1, 1, 1, 1, 1,
0.5906599, -1.124525, 1.756867, 1, 1, 1, 1, 1,
0.5913918, -0.646914, 2.94833, 1, 1, 1, 1, 1,
0.5937927, -0.997337, 3.31708, 1, 1, 1, 1, 1,
0.5955516, -0.5585482, 1.744952, 1, 1, 1, 1, 1,
0.595622, 1.6256, -0.2014138, 1, 1, 1, 1, 1,
0.6028454, 0.5861343, -0.3116284, 1, 1, 1, 1, 1,
0.6063153, 0.727282, 2.627848, 1, 1, 1, 1, 1,
0.6122165, -1.278301, 2.747736, 1, 1, 1, 1, 1,
0.6132877, 0.3253695, 0.539729, 1, 1, 1, 1, 1,
0.6153397, -2.201262, 3.35202, 1, 1, 1, 1, 1,
0.6178238, -0.6378649, 4.218154, 1, 1, 1, 1, 1,
0.6245051, 0.4173928, 0.6578357, 0, 0, 1, 1, 1,
0.6270017, 0.8473842, 2.579044, 1, 0, 0, 1, 1,
0.627782, 0.5271277, 0.9081396, 1, 0, 0, 1, 1,
0.6278201, -1.71489, 2.991019, 1, 0, 0, 1, 1,
0.6299156, -0.960421, 1.569712, 1, 0, 0, 1, 1,
0.630771, -0.3521798, 3.559723, 1, 0, 0, 1, 1,
0.6365359, 1.285506, 0.5337338, 0, 0, 0, 1, 1,
0.63879, -0.4794966, 3.408545, 0, 0, 0, 1, 1,
0.6407432, 1.393658, 0.8134702, 0, 0, 0, 1, 1,
0.6425788, 0.5601391, 2.859074, 0, 0, 0, 1, 1,
0.6452573, 1.409176, -0.6105577, 0, 0, 0, 1, 1,
0.6467227, -1.630781, 2.221871, 0, 0, 0, 1, 1,
0.6614702, 0.520488, 0.909694, 0, 0, 0, 1, 1,
0.6784791, 0.7763923, 0.1904635, 1, 1, 1, 1, 1,
0.6792424, -0.3056597, 2.766202, 1, 1, 1, 1, 1,
0.684777, 0.7006696, 0.2310942, 1, 1, 1, 1, 1,
0.6851463, 0.6567391, 1.373746, 1, 1, 1, 1, 1,
0.6906516, 0.2175828, 0.8452861, 1, 1, 1, 1, 1,
0.6918612, -0.3139366, 2.351419, 1, 1, 1, 1, 1,
0.693647, -2.232038, 2.311432, 1, 1, 1, 1, 1,
0.6939443, -1.588337, 1.774696, 1, 1, 1, 1, 1,
0.6968629, 0.9032359, -0.8202828, 1, 1, 1, 1, 1,
0.7047763, 0.0660771, 1.764108, 1, 1, 1, 1, 1,
0.7055689, -1.066522, 2.040491, 1, 1, 1, 1, 1,
0.707177, -0.9788292, 3.20525, 1, 1, 1, 1, 1,
0.7074534, 1.54881, 0.4843644, 1, 1, 1, 1, 1,
0.707657, 1.505213, -0.3073187, 1, 1, 1, 1, 1,
0.7143334, -0.6568447, 3.450572, 1, 1, 1, 1, 1,
0.7151259, 2.047143, 1.584801, 0, 0, 1, 1, 1,
0.7153866, 0.9176701, 1.578135, 1, 0, 0, 1, 1,
0.7174284, -0.3209665, 3.284123, 1, 0, 0, 1, 1,
0.7210252, 0.8662445, 0.966934, 1, 0, 0, 1, 1,
0.7277232, -2.090272, 2.837678, 1, 0, 0, 1, 1,
0.737559, 0.1452571, -0.2879452, 1, 0, 0, 1, 1,
0.7427755, -1.204082, 2.903904, 0, 0, 0, 1, 1,
0.7443129, 0.2624349, 1.983168, 0, 0, 0, 1, 1,
0.7471986, -0.07596666, 1.629555, 0, 0, 0, 1, 1,
0.7486227, -0.6878189, 3.648366, 0, 0, 0, 1, 1,
0.7561708, 0.1208229, 1.232494, 0, 0, 0, 1, 1,
0.7636423, -1.16565, 1.658772, 0, 0, 0, 1, 1,
0.7639801, -1.07602, 3.612768, 0, 0, 0, 1, 1,
0.7647196, 1.049151, 0.2413855, 1, 1, 1, 1, 1,
0.7673199, 1.649037, 0.3337264, 1, 1, 1, 1, 1,
0.7681051, -0.1919731, 1.843659, 1, 1, 1, 1, 1,
0.7688001, 0.3912492, 1.092028, 1, 1, 1, 1, 1,
0.7705913, -0.8474783, 3.062926, 1, 1, 1, 1, 1,
0.7719061, 0.1049872, 1.653414, 1, 1, 1, 1, 1,
0.7755812, -0.6637592, 2.134026, 1, 1, 1, 1, 1,
0.7773913, -0.6361985, 4.951795, 1, 1, 1, 1, 1,
0.7779334, 0.9053277, -0.3738817, 1, 1, 1, 1, 1,
0.7798127, -0.5583417, 1.680037, 1, 1, 1, 1, 1,
0.7875155, 0.8492161, 2.050361, 1, 1, 1, 1, 1,
0.7879473, -1.104799, 3.746417, 1, 1, 1, 1, 1,
0.7883886, 0.9287929, 0.6754157, 1, 1, 1, 1, 1,
0.7890792, 1.271238, 0.8856833, 1, 1, 1, 1, 1,
0.7892212, 0.4040107, 0.8644625, 1, 1, 1, 1, 1,
0.7975194, -1.126921, 1.199356, 0, 0, 1, 1, 1,
0.806795, -0.9621262, 2.18093, 1, 0, 0, 1, 1,
0.8076658, 1.868934, 1.036424, 1, 0, 0, 1, 1,
0.8208896, 0.3631053, 2.013364, 1, 0, 0, 1, 1,
0.841508, -0.3918181, 1.334375, 1, 0, 0, 1, 1,
0.8461559, 1.643441, 0.4182969, 1, 0, 0, 1, 1,
0.8466697, -0.7380923, 1.726276, 0, 0, 0, 1, 1,
0.8495966, 0.02826742, 0.5728912, 0, 0, 0, 1, 1,
0.8509108, 0.7187906, 0.9545974, 0, 0, 0, 1, 1,
0.8525776, -0.3865907, 1.474406, 0, 0, 0, 1, 1,
0.8612444, 2.602764, 1.046494, 0, 0, 0, 1, 1,
0.8643757, 1.69701, 1.338948, 0, 0, 0, 1, 1,
0.8659497, 0.9288591, -0.7750642, 0, 0, 0, 1, 1,
0.869058, -0.4806575, 4.542781, 1, 1, 1, 1, 1,
0.8705643, -0.7521339, 1.818783, 1, 1, 1, 1, 1,
0.8742951, 0.4474315, 3.475405, 1, 1, 1, 1, 1,
0.8775281, 1.791312, 0.2482027, 1, 1, 1, 1, 1,
0.877993, 0.2494999, 1.900005, 1, 1, 1, 1, 1,
0.8834715, 1.019414, 1.005332, 1, 1, 1, 1, 1,
0.8884478, 0.2039878, 0.07750278, 1, 1, 1, 1, 1,
0.889621, -1.492854, 3.02389, 1, 1, 1, 1, 1,
0.8901516, -0.03763356, 2.198191, 1, 1, 1, 1, 1,
0.8913211, -1.123894, 2.166273, 1, 1, 1, 1, 1,
0.9033484, -0.4666272, 1.829279, 1, 1, 1, 1, 1,
0.9081414, -0.8312, 4.132173, 1, 1, 1, 1, 1,
0.9082353, -0.2005253, 4.56354, 1, 1, 1, 1, 1,
0.9087076, 0.3480017, -0.3720932, 1, 1, 1, 1, 1,
0.9150695, 2.826797, 0.5513394, 1, 1, 1, 1, 1,
0.9203636, -1.165038, 1.745924, 0, 0, 1, 1, 1,
0.9266906, -0.7155327, 2.818766, 1, 0, 0, 1, 1,
0.9369115, 0.6308333, 2.607943, 1, 0, 0, 1, 1,
0.9385284, -1.230963, 1.718125, 1, 0, 0, 1, 1,
0.9396066, -0.1728136, 1.792641, 1, 0, 0, 1, 1,
0.9487268, 0.06853468, 1.169015, 1, 0, 0, 1, 1,
0.9562252, 0.2820415, -0.3355231, 0, 0, 0, 1, 1,
0.9589936, -0.8156582, 2.905108, 0, 0, 0, 1, 1,
0.9593042, -1.682038, 1.510571, 0, 0, 0, 1, 1,
0.9617404, -1.078894, 3.57982, 0, 0, 0, 1, 1,
0.9630827, -0.09935354, 2.843494, 0, 0, 0, 1, 1,
0.9752428, 1.270529, 1.757068, 0, 0, 0, 1, 1,
0.9856069, -0.6107762, 2.630408, 0, 0, 0, 1, 1,
0.9888468, 0.01536381, 0.7315541, 1, 1, 1, 1, 1,
0.9919672, 1.200671, 0.6406041, 1, 1, 1, 1, 1,
0.9994917, -0.04235803, 0.9329942, 1, 1, 1, 1, 1,
1.002751, 0.8328089, 1.798785, 1, 1, 1, 1, 1,
1.003664, 0.0503576, 2.65839, 1, 1, 1, 1, 1,
1.011396, -1.226777, 3.344818, 1, 1, 1, 1, 1,
1.020646, 0.187394, 0.4777884, 1, 1, 1, 1, 1,
1.025756, 0.5480068, 1.574968, 1, 1, 1, 1, 1,
1.033207, 0.2212545, -0.292293, 1, 1, 1, 1, 1,
1.035791, 0.6641607, 1.754449, 1, 1, 1, 1, 1,
1.037909, -1.196257, 3.140468, 1, 1, 1, 1, 1,
1.038147, 0.2577145, 1.27764, 1, 1, 1, 1, 1,
1.03976, -1.213999, 3.691864, 1, 1, 1, 1, 1,
1.047599, -1.204185, 2.825207, 1, 1, 1, 1, 1,
1.053933, 1.319227, 1.942726, 1, 1, 1, 1, 1,
1.063823, 1.676814, -1.640416, 0, 0, 1, 1, 1,
1.075832, -0.2939854, 2.367516, 1, 0, 0, 1, 1,
1.079928, 1.05921, 0.7830628, 1, 0, 0, 1, 1,
1.083271, -0.8354418, 1.620013, 1, 0, 0, 1, 1,
1.085836, -1.387849, 2.540135, 1, 0, 0, 1, 1,
1.088538, 2.043138, -0.03387582, 1, 0, 0, 1, 1,
1.088991, -1.547395, 3.016974, 0, 0, 0, 1, 1,
1.101068, 0.8536805, 0.8341225, 0, 0, 0, 1, 1,
1.102754, 1.729752, -0.1556857, 0, 0, 0, 1, 1,
1.103236, -1.005145, 1.589826, 0, 0, 0, 1, 1,
1.110551, 0.2769336, 1.179071, 0, 0, 0, 1, 1,
1.110667, -2.376534, 1.423032, 0, 0, 0, 1, 1,
1.113712, -0.0214266, 1.733047, 0, 0, 0, 1, 1,
1.133798, -1.726636, 4.114787, 1, 1, 1, 1, 1,
1.135075, 1.156687, 0.4716214, 1, 1, 1, 1, 1,
1.136555, -0.7850654, 3.426341, 1, 1, 1, 1, 1,
1.138817, 0.1858435, 1.127795, 1, 1, 1, 1, 1,
1.147902, 0.533991, 0.09465237, 1, 1, 1, 1, 1,
1.151942, 1.046858, -0.006116649, 1, 1, 1, 1, 1,
1.153957, 1.274119, 0.9402787, 1, 1, 1, 1, 1,
1.165885, -0.6865897, 2.048969, 1, 1, 1, 1, 1,
1.173127, 0.2020673, 2.452112, 1, 1, 1, 1, 1,
1.173458, 0.792853, 2.076792, 1, 1, 1, 1, 1,
1.184579, 0.306992, 0.9212099, 1, 1, 1, 1, 1,
1.19479, 0.1952697, 1.382097, 1, 1, 1, 1, 1,
1.200725, 0.4474292, 2.121577, 1, 1, 1, 1, 1,
1.202598, 2.315245, 1.530206, 1, 1, 1, 1, 1,
1.206186, -0.04400009, 1.956259, 1, 1, 1, 1, 1,
1.208992, 0.6118589, -0.7816466, 0, 0, 1, 1, 1,
1.209709, 0.5454337, 0.7663664, 1, 0, 0, 1, 1,
1.210679, 1.119134, -0.3289304, 1, 0, 0, 1, 1,
1.220775, -0.8457152, 2.369661, 1, 0, 0, 1, 1,
1.225022, 1.199011, -0.6758938, 1, 0, 0, 1, 1,
1.229051, 1.285645, 0.7618681, 1, 0, 0, 1, 1,
1.233906, 1.532333, 0.2331971, 0, 0, 0, 1, 1,
1.247289, 1.371936, 1.249063, 0, 0, 0, 1, 1,
1.259039, -2.335426, 2.515793, 0, 0, 0, 1, 1,
1.265167, 0.4399939, 2.210824, 0, 0, 0, 1, 1,
1.275567, -0.6527506, 1.951429, 0, 0, 0, 1, 1,
1.285198, -0.6376475, 1.362879, 0, 0, 0, 1, 1,
1.287001, 1.063253, 0.5895675, 0, 0, 0, 1, 1,
1.303595, -0.6860734, 2.167021, 1, 1, 1, 1, 1,
1.303696, 0.9970927, 0.8393595, 1, 1, 1, 1, 1,
1.309634, -1.449823, 2.48541, 1, 1, 1, 1, 1,
1.353668, -0.3987445, 2.90695, 1, 1, 1, 1, 1,
1.357242, 0.206682, 1.171761, 1, 1, 1, 1, 1,
1.364911, 2.198419, -0.5535012, 1, 1, 1, 1, 1,
1.372702, -0.7831492, 1.011792, 1, 1, 1, 1, 1,
1.373063, 0.7351199, 2.654705, 1, 1, 1, 1, 1,
1.378902, -2.587234, 1.864184, 1, 1, 1, 1, 1,
1.387027, -0.7062418, 2.249778, 1, 1, 1, 1, 1,
1.387942, -0.5259489, 2.977519, 1, 1, 1, 1, 1,
1.400699, 0.5011507, 0.5302615, 1, 1, 1, 1, 1,
1.40478, -0.2719449, 2.13529, 1, 1, 1, 1, 1,
1.418487, -0.1633883, 1.574217, 1, 1, 1, 1, 1,
1.418671, 0.5036902, 2.064591, 1, 1, 1, 1, 1,
1.418728, 0.4459836, 1.807691, 0, 0, 1, 1, 1,
1.42934, -1.361962, 2.448959, 1, 0, 0, 1, 1,
1.431233, -0.09898634, 2.334284, 1, 0, 0, 1, 1,
1.438739, 0.7620952, -0.5332808, 1, 0, 0, 1, 1,
1.446604, 0.221831, 2.102061, 1, 0, 0, 1, 1,
1.456902, -0.07316235, 1.722699, 1, 0, 0, 1, 1,
1.458287, 1.366458, -0.4017289, 0, 0, 0, 1, 1,
1.463799, -0.4314924, 2.467638, 0, 0, 0, 1, 1,
1.464137, -0.949347, 2.473566, 0, 0, 0, 1, 1,
1.464561, 0.7012212, 2.903549, 0, 0, 0, 1, 1,
1.47337, -0.2444736, 0.9360026, 0, 0, 0, 1, 1,
1.479415, 1.241876, 0.3929822, 0, 0, 0, 1, 1,
1.481018, 2.137556, 2.087704, 0, 0, 0, 1, 1,
1.496899, 0.6082906, 0.2300694, 1, 1, 1, 1, 1,
1.516285, 1.126239, 1.57851, 1, 1, 1, 1, 1,
1.516659, 0.641934, 2.581341, 1, 1, 1, 1, 1,
1.526524, 0.7478861, -0.5609617, 1, 1, 1, 1, 1,
1.527812, -0.09636752, 0.728337, 1, 1, 1, 1, 1,
1.536672, 1.051762, -0.4206161, 1, 1, 1, 1, 1,
1.537421, -0.1736329, 0.7805797, 1, 1, 1, 1, 1,
1.541051, 0.7286456, 0.546973, 1, 1, 1, 1, 1,
1.550492, -1.147131, 2.153632, 1, 1, 1, 1, 1,
1.571499, 0.6666409, 0.2903637, 1, 1, 1, 1, 1,
1.579911, -0.2960122, 2.929136, 1, 1, 1, 1, 1,
1.591749, 0.5799952, 0.851705, 1, 1, 1, 1, 1,
1.598292, 0.5027668, 2.943568, 1, 1, 1, 1, 1,
1.60069, 0.6784993, 0.6501412, 1, 1, 1, 1, 1,
1.607806, 0.6087102, 1.245807, 1, 1, 1, 1, 1,
1.609216, -0.1931372, -0.2064073, 0, 0, 1, 1, 1,
1.646013, 1.558568, 1.073241, 1, 0, 0, 1, 1,
1.675859, 0.003917303, 3.977176, 1, 0, 0, 1, 1,
1.682502, 0.9487289, 1.3128, 1, 0, 0, 1, 1,
1.688791, 1.035669, 1.315324, 1, 0, 0, 1, 1,
1.694826, -0.7771789, 2.827402, 1, 0, 0, 1, 1,
1.702099, 0.5659744, 0.2646921, 0, 0, 0, 1, 1,
1.703842, 1.530339, -0.1105458, 0, 0, 0, 1, 1,
1.710858, -0.4807394, 1.94774, 0, 0, 0, 1, 1,
1.716262, 1.850697, 1.392668, 0, 0, 0, 1, 1,
1.728465, 0.9887494, 1.786029, 0, 0, 0, 1, 1,
1.734982, 0.4361616, 1.90657, 0, 0, 0, 1, 1,
1.755449, 2.120775, 1.065067, 0, 0, 0, 1, 1,
1.768665, -0.3243258, 2.307975, 1, 1, 1, 1, 1,
1.769304, 0.743548, 0.2482474, 1, 1, 1, 1, 1,
1.808075, -0.8744136, 2.738887, 1, 1, 1, 1, 1,
1.811023, -2.005955, 4.633058, 1, 1, 1, 1, 1,
1.817839, -0.2383364, 3.596766, 1, 1, 1, 1, 1,
1.833249, -0.4808941, 0.505933, 1, 1, 1, 1, 1,
1.83563, 2.179507, 1.614484, 1, 1, 1, 1, 1,
1.84032, -1.730942, 3.017276, 1, 1, 1, 1, 1,
1.884492, 0.5911592, 2.466309, 1, 1, 1, 1, 1,
1.890673, -0.3411394, 2.827884, 1, 1, 1, 1, 1,
1.914044, 1.255525, 0.8920475, 1, 1, 1, 1, 1,
1.921761, 0.6304648, 3.051411, 1, 1, 1, 1, 1,
1.928666, -0.2289292, 1.175709, 1, 1, 1, 1, 1,
1.931453, -0.7587736, 3.153464, 1, 1, 1, 1, 1,
1.963274, 0.2012074, 1.961831, 1, 1, 1, 1, 1,
2.00369, 0.2424769, 2.787492, 0, 0, 1, 1, 1,
2.006999, -0.2930267, -0.04624041, 1, 0, 0, 1, 1,
2.008952, 0.3909414, 2.34886, 1, 0, 0, 1, 1,
2.073851, 0.8693316, 0.3013391, 1, 0, 0, 1, 1,
2.093327, 0.4786126, 2.584378, 1, 0, 0, 1, 1,
2.132007, -2.845627, 3.239679, 1, 0, 0, 1, 1,
2.148788, -0.3310091, 1.189068, 0, 0, 0, 1, 1,
2.153684, -0.7872749, 0.4300848, 0, 0, 0, 1, 1,
2.160471, -0.07464727, 0.2759891, 0, 0, 0, 1, 1,
2.1753, -0.7906796, 3.761482, 0, 0, 0, 1, 1,
2.295026, 0.678019, 0.7058607, 0, 0, 0, 1, 1,
2.3494, 1.14044, 1.359034, 0, 0, 0, 1, 1,
2.432732, -0.1687144, -0.8354313, 0, 0, 0, 1, 1,
2.464078, -0.4250539, 1.748523, 1, 1, 1, 1, 1,
2.494308, 0.02521048, 2.229201, 1, 1, 1, 1, 1,
2.51172, -0.1632729, 1.870717, 1, 1, 1, 1, 1,
2.584488, -1.005302, 1.797207, 1, 1, 1, 1, 1,
2.608056, -2.218028, -0.2814253, 1, 1, 1, 1, 1,
2.995378, -0.6874402, 0.7528056, 1, 1, 1, 1, 1,
3.57247, -0.6514449, 2.369495, 1, 1, 1, 1, 1
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
var radius = 9.563293;
var distance = 33.59066;
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
mvMatrix.translate( -0.1823251, 0.1027901, 0.2192082 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.59066);
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
