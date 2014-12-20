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
-3.224749, 0.1378557, -2.302329, 1, 0, 0, 1,
-2.869438, -0.3984696, -0.347764, 1, 0.007843138, 0, 1,
-2.829561, -0.8964677, -1.264164, 1, 0.01176471, 0, 1,
-2.76451, -0.8137617, -0.6525092, 1, 0.01960784, 0, 1,
-2.705943, 0.09156949, -1.850718, 1, 0.02352941, 0, 1,
-2.700736, -0.7177156, -2.216505, 1, 0.03137255, 0, 1,
-2.594292, 0.3695582, -1.606618, 1, 0.03529412, 0, 1,
-2.535078, -0.03847073, -0.7850879, 1, 0.04313726, 0, 1,
-2.513844, 1.006735, -3.301713, 1, 0.04705882, 0, 1,
-2.422305, -0.5424517, -3.465563, 1, 0.05490196, 0, 1,
-2.317913, 0.6038017, -1.637895, 1, 0.05882353, 0, 1,
-2.295363, 1.609244, -1.458593, 1, 0.06666667, 0, 1,
-2.256455, -1.540775, -1.064701, 1, 0.07058824, 0, 1,
-2.250708, 1.489833, -1.686856, 1, 0.07843138, 0, 1,
-2.201611, 0.05103821, -0.8934884, 1, 0.08235294, 0, 1,
-2.196301, -0.4725754, -2.986789, 1, 0.09019608, 0, 1,
-2.18977, 1.18592, 0.4218569, 1, 0.09411765, 0, 1,
-2.178523, 2.074652, -2.807236, 1, 0.1019608, 0, 1,
-2.172976, -0.4526036, -2.802559, 1, 0.1098039, 0, 1,
-2.152126, 0.5504533, -0.2806091, 1, 0.1137255, 0, 1,
-2.114905, -0.6124092, -0.2283207, 1, 0.1215686, 0, 1,
-2.113394, -0.5955088, -1.030241, 1, 0.1254902, 0, 1,
-2.097192, 2.139224, 0.1031903, 1, 0.1333333, 0, 1,
-2.084712, -0.1419769, -1.332345, 1, 0.1372549, 0, 1,
-2.063355, -0.9051931, 0.2830725, 1, 0.145098, 0, 1,
-2.007421, 0.7100973, -0.8851746, 1, 0.1490196, 0, 1,
-2.0066, 0.3961637, -0.3632358, 1, 0.1568628, 0, 1,
-2.006021, -1.057898, -1.816347, 1, 0.1607843, 0, 1,
-2.002773, -0.06776623, -2.417181, 1, 0.1686275, 0, 1,
-1.964692, 0.5546364, -1.867048, 1, 0.172549, 0, 1,
-1.963888, 1.271687, -0.4855395, 1, 0.1803922, 0, 1,
-1.915942, -0.8543282, -0.9151485, 1, 0.1843137, 0, 1,
-1.908301, 0.66568, -1.059474, 1, 0.1921569, 0, 1,
-1.906409, -0.9026728, -3.07853, 1, 0.1960784, 0, 1,
-1.867978, -0.4389839, -2.172899, 1, 0.2039216, 0, 1,
-1.864103, -0.5586044, -2.700358, 1, 0.2117647, 0, 1,
-1.859009, 0.3973701, -2.262626, 1, 0.2156863, 0, 1,
-1.858664, 0.835348, -1.986584, 1, 0.2235294, 0, 1,
-1.849688, -0.8873253, 0.5354372, 1, 0.227451, 0, 1,
-1.837954, -0.5666547, -3.610698, 1, 0.2352941, 0, 1,
-1.804533, -2.2682, -2.66953, 1, 0.2392157, 0, 1,
-1.801461, -0.2457283, -2.385489, 1, 0.2470588, 0, 1,
-1.794048, 1.25962, -1.627602, 1, 0.2509804, 0, 1,
-1.725534, -1.246971, -2.311426, 1, 0.2588235, 0, 1,
-1.714035, -0.4141646, -2.110293, 1, 0.2627451, 0, 1,
-1.696896, -0.004489614, -1.84472, 1, 0.2705882, 0, 1,
-1.692261, -0.6929865, -2.365425, 1, 0.2745098, 0, 1,
-1.674783, 0.01926736, -2.792386, 1, 0.282353, 0, 1,
-1.653938, 0.1659686, -1.859194, 1, 0.2862745, 0, 1,
-1.64607, 0.9050196, -2.419203, 1, 0.2941177, 0, 1,
-1.642171, 0.02969434, -1.840802, 1, 0.3019608, 0, 1,
-1.636338, -0.3836255, -1.289729, 1, 0.3058824, 0, 1,
-1.625071, -0.4095429, -0.2558629, 1, 0.3137255, 0, 1,
-1.614897, 0.009521022, -1.074824, 1, 0.3176471, 0, 1,
-1.610809, 0.173075, -1.403598, 1, 0.3254902, 0, 1,
-1.58121, -1.111337, -2.959386, 1, 0.3294118, 0, 1,
-1.579956, 0.2909107, -2.092501, 1, 0.3372549, 0, 1,
-1.552, -0.7694297, -1.109742, 1, 0.3411765, 0, 1,
-1.546012, -0.2214574, -0.9310274, 1, 0.3490196, 0, 1,
-1.543944, -0.1450139, -1.533972, 1, 0.3529412, 0, 1,
-1.528915, 0.7855548, -0.4458907, 1, 0.3607843, 0, 1,
-1.524913, -1.202063, -3.128274, 1, 0.3647059, 0, 1,
-1.51628, -0.6987864, -3.918755, 1, 0.372549, 0, 1,
-1.514405, 1.187559, -0.8693033, 1, 0.3764706, 0, 1,
-1.511236, -0.6118029, -1.38538, 1, 0.3843137, 0, 1,
-1.510391, -0.9552785, -1.970864, 1, 0.3882353, 0, 1,
-1.495588, 0.5810262, 0.09067399, 1, 0.3960784, 0, 1,
-1.48898, -0.5050207, -0.4463459, 1, 0.4039216, 0, 1,
-1.488354, -0.4370821, -1.81452, 1, 0.4078431, 0, 1,
-1.466216, -0.3209323, -3.307014, 1, 0.4156863, 0, 1,
-1.4636, 0.03505499, -0.6733367, 1, 0.4196078, 0, 1,
-1.446085, -0.355523, -0.8714355, 1, 0.427451, 0, 1,
-1.440123, 0.1334623, -1.735866, 1, 0.4313726, 0, 1,
-1.440073, -0.7915125, -1.380009, 1, 0.4392157, 0, 1,
-1.427441, 0.7135225, -1.497848, 1, 0.4431373, 0, 1,
-1.425318, -0.7351818, -1.748467, 1, 0.4509804, 0, 1,
-1.412659, -0.5201786, -1.821213, 1, 0.454902, 0, 1,
-1.406231, -0.607417, -3.409442, 1, 0.4627451, 0, 1,
-1.396844, 0.1900478, -0.6148234, 1, 0.4666667, 0, 1,
-1.389432, 0.4889345, 0.0646233, 1, 0.4745098, 0, 1,
-1.388271, 0.3683749, -1.212425, 1, 0.4784314, 0, 1,
-1.384416, 1.18118, -0.5972789, 1, 0.4862745, 0, 1,
-1.382212, 0.2278001, -3.025088, 1, 0.4901961, 0, 1,
-1.378912, -1.043692, -3.364427, 1, 0.4980392, 0, 1,
-1.369867, 1.188465, -1.33122, 1, 0.5058824, 0, 1,
-1.369269, -1.364506, -2.716511, 1, 0.509804, 0, 1,
-1.3338, 1.511034, -1.29959, 1, 0.5176471, 0, 1,
-1.33044, -0.9078313, -2.173449, 1, 0.5215687, 0, 1,
-1.329007, 0.7200698, -1.958201, 1, 0.5294118, 0, 1,
-1.324528, 0.4451398, -1.924044, 1, 0.5333334, 0, 1,
-1.313201, -0.5941037, -2.115069, 1, 0.5411765, 0, 1,
-1.313027, -0.556031, -1.918268, 1, 0.5450981, 0, 1,
-1.304302, 0.9786348, -0.4783311, 1, 0.5529412, 0, 1,
-1.303177, 0.594286, -1.426411, 1, 0.5568628, 0, 1,
-1.282678, 0.210458, -0.1988196, 1, 0.5647059, 0, 1,
-1.269598, -0.1739658, -1.817681, 1, 0.5686275, 0, 1,
-1.263515, 0.7083407, -0.09540688, 1, 0.5764706, 0, 1,
-1.253054, 0.8548019, -1.654307, 1, 0.5803922, 0, 1,
-1.250842, -0.4240128, -2.835611, 1, 0.5882353, 0, 1,
-1.249135, 2.193092, 0.01079618, 1, 0.5921569, 0, 1,
-1.246649, -1.740592, -2.883976, 1, 0.6, 0, 1,
-1.243916, -1.621491, -2.30016, 1, 0.6078432, 0, 1,
-1.239022, 0.898839, -1.138843, 1, 0.6117647, 0, 1,
-1.234186, -0.1705145, -1.538232, 1, 0.6196079, 0, 1,
-1.223024, 0.9348934, -2.314456, 1, 0.6235294, 0, 1,
-1.222447, 2.260981, -0.05822834, 1, 0.6313726, 0, 1,
-1.218237, -1.067076, -1.486992, 1, 0.6352941, 0, 1,
-1.201323, 0.559258, -0.8702556, 1, 0.6431373, 0, 1,
-1.200344, 1.620602, -1.11608, 1, 0.6470588, 0, 1,
-1.197777, -0.4388605, -2.524806, 1, 0.654902, 0, 1,
-1.193512, 1.713666, -0.7553964, 1, 0.6588235, 0, 1,
-1.184161, -1.227591, -1.405739, 1, 0.6666667, 0, 1,
-1.183776, 1.322034, -1.43389, 1, 0.6705883, 0, 1,
-1.173871, -0.3514532, -0.1202648, 1, 0.6784314, 0, 1,
-1.160986, 1.967249, 0.925483, 1, 0.682353, 0, 1,
-1.159934, 0.4290683, 0.2913523, 1, 0.6901961, 0, 1,
-1.158353, -1.990724, -2.946147, 1, 0.6941177, 0, 1,
-1.152721, -1.267913, -2.893175, 1, 0.7019608, 0, 1,
-1.145957, -0.3110706, -3.177013, 1, 0.7098039, 0, 1,
-1.140484, -1.231687, -1.951833, 1, 0.7137255, 0, 1,
-1.139272, 0.9078668, -0.9323094, 1, 0.7215686, 0, 1,
-1.137771, -0.2248436, -0.133575, 1, 0.7254902, 0, 1,
-1.134928, -0.1843114, -1.907416, 1, 0.7333333, 0, 1,
-1.128413, -0.4482258, -2.106305, 1, 0.7372549, 0, 1,
-1.128203, -0.7903479, -2.969057, 1, 0.7450981, 0, 1,
-1.127334, 1.148908, 0.789361, 1, 0.7490196, 0, 1,
-1.122159, 0.5872723, -2.349271, 1, 0.7568628, 0, 1,
-1.116892, 0.8121409, -1.76546, 1, 0.7607843, 0, 1,
-1.111259, -0.317113, -2.225389, 1, 0.7686275, 0, 1,
-1.111237, -0.08594155, -2.308191, 1, 0.772549, 0, 1,
-1.106568, -1.419968, -1.824281, 1, 0.7803922, 0, 1,
-1.104817, 0.3142493, -2.169886, 1, 0.7843137, 0, 1,
-1.100087, 0.3051689, -0.9835574, 1, 0.7921569, 0, 1,
-1.097068, -1.689507, -1.432746, 1, 0.7960784, 0, 1,
-1.094984, -0.1588989, -0.885757, 1, 0.8039216, 0, 1,
-1.088958, 0.1764639, -1.626723, 1, 0.8117647, 0, 1,
-1.073505, 1.398829, 1.176049, 1, 0.8156863, 0, 1,
-1.069586, 0.02503005, -0.7014552, 1, 0.8235294, 0, 1,
-1.067692, 0.04095326, -3.749902, 1, 0.827451, 0, 1,
-1.063516, 0.1563738, 0.3027849, 1, 0.8352941, 0, 1,
-1.061795, -0.1218368, 0.04312285, 1, 0.8392157, 0, 1,
-1.04865, -0.4826303, -4.010212, 1, 0.8470588, 0, 1,
-1.044593, -0.8912632, -1.589107, 1, 0.8509804, 0, 1,
-1.039144, 0.6078827, 0.4004657, 1, 0.8588235, 0, 1,
-1.037483, -0.9165732, -1.002961, 1, 0.8627451, 0, 1,
-1.026923, -0.9321159, -2.834599, 1, 0.8705882, 0, 1,
-1.024847, 0.2922004, -3.024955, 1, 0.8745098, 0, 1,
-1.022835, 1.090555, -0.9154037, 1, 0.8823529, 0, 1,
-1.019392, -0.2062877, -3.168612, 1, 0.8862745, 0, 1,
-1.017272, 0.8228807, 1.513659, 1, 0.8941177, 0, 1,
-1.014271, 0.03520676, -2.470333, 1, 0.8980392, 0, 1,
-1.010641, 0.5934893, -1.307073, 1, 0.9058824, 0, 1,
-1.010415, 0.7004734, -0.4548562, 1, 0.9137255, 0, 1,
-1.005281, 2.283501, 0.2004482, 1, 0.9176471, 0, 1,
-0.9941845, 0.5268406, -1.278173, 1, 0.9254902, 0, 1,
-0.9941483, 0.4658385, -0.6241159, 1, 0.9294118, 0, 1,
-0.9852504, -0.7111071, -3.03238, 1, 0.9372549, 0, 1,
-0.9777173, 0.7443467, -1.596729, 1, 0.9411765, 0, 1,
-0.9679611, -0.1022089, -2.336192, 1, 0.9490196, 0, 1,
-0.9526002, 1.065925, -1.141779, 1, 0.9529412, 0, 1,
-0.9460745, 0.6109056, -1.166809, 1, 0.9607843, 0, 1,
-0.9444564, 0.6284768, -0.4493072, 1, 0.9647059, 0, 1,
-0.9439647, 0.5752282, -2.026508, 1, 0.972549, 0, 1,
-0.9414849, 0.7735413, -1.613743, 1, 0.9764706, 0, 1,
-0.9411396, 0.1139463, -0.3710001, 1, 0.9843137, 0, 1,
-0.9404046, 0.7606658, 1.033855, 1, 0.9882353, 0, 1,
-0.9382927, -0.2460676, -1.637023, 1, 0.9960784, 0, 1,
-0.9370504, -0.3211248, -1.266272, 0.9960784, 1, 0, 1,
-0.9365106, 2.225514, 0.4495017, 0.9921569, 1, 0, 1,
-0.9358118, -0.01983519, -2.074899, 0.9843137, 1, 0, 1,
-0.9339585, 0.2283208, 0.6638808, 0.9803922, 1, 0, 1,
-0.929888, 0.1806325, -0.994716, 0.972549, 1, 0, 1,
-0.9291044, -1.709509, -2.095165, 0.9686275, 1, 0, 1,
-0.9279144, 1.386722, -0.8525309, 0.9607843, 1, 0, 1,
-0.9269237, 1.545403, 0.4482432, 0.9568627, 1, 0, 1,
-0.9209019, -1.370044, -0.4328345, 0.9490196, 1, 0, 1,
-0.9185798, 0.04807203, -1.529772, 0.945098, 1, 0, 1,
-0.9184759, -0.4754601, -0.5684535, 0.9372549, 1, 0, 1,
-0.916958, 0.5357054, 0.27422, 0.9333333, 1, 0, 1,
-0.9107999, 2.072548, -0.3285427, 0.9254902, 1, 0, 1,
-0.9000401, -0.4768992, -1.698694, 0.9215686, 1, 0, 1,
-0.8953303, -1.689759, -1.920624, 0.9137255, 1, 0, 1,
-0.8892066, -1.562508, -0.8673384, 0.9098039, 1, 0, 1,
-0.8824046, 0.6613678, -0.4907678, 0.9019608, 1, 0, 1,
-0.8806342, -1.209879, -3.054233, 0.8941177, 1, 0, 1,
-0.8787938, 2.333016, -0.9424645, 0.8901961, 1, 0, 1,
-0.8760084, 0.2384706, -0.02900198, 0.8823529, 1, 0, 1,
-0.8658683, 1.032117, -1.44095, 0.8784314, 1, 0, 1,
-0.8658049, -0.1266555, 0.07882626, 0.8705882, 1, 0, 1,
-0.861883, 0.6777646, -1.413119, 0.8666667, 1, 0, 1,
-0.8605908, 0.5737112, -2.031439, 0.8588235, 1, 0, 1,
-0.8562246, 0.6128879, -1.103624, 0.854902, 1, 0, 1,
-0.8541908, 1.009392, -1.464192, 0.8470588, 1, 0, 1,
-0.8525895, 0.3279642, -1.056558, 0.8431373, 1, 0, 1,
-0.8445063, -0.5790042, -0.995646, 0.8352941, 1, 0, 1,
-0.8375912, -0.2981786, -0.2701145, 0.8313726, 1, 0, 1,
-0.8371493, -0.449034, -1.327564, 0.8235294, 1, 0, 1,
-0.8347136, -0.8925176, -1.907192, 0.8196079, 1, 0, 1,
-0.827567, -1.248425, -2.782367, 0.8117647, 1, 0, 1,
-0.8199206, 0.2930475, -2.066756, 0.8078431, 1, 0, 1,
-0.8186085, 0.4389665, -1.106684, 0.8, 1, 0, 1,
-0.8027682, 1.465095, 0.06205636, 0.7921569, 1, 0, 1,
-0.7992474, -0.2558015, -1.394789, 0.7882353, 1, 0, 1,
-0.7988346, 0.7397754, -0.6544936, 0.7803922, 1, 0, 1,
-0.7927698, -0.2296802, -1.409207, 0.7764706, 1, 0, 1,
-0.7912937, 0.6403489, -3.852127, 0.7686275, 1, 0, 1,
-0.7887803, -1.094751, -3.341551, 0.7647059, 1, 0, 1,
-0.786938, 0.7952178, -1.179059, 0.7568628, 1, 0, 1,
-0.7807781, -0.5972104, -2.557188, 0.7529412, 1, 0, 1,
-0.7791088, 1.00488, -0.283792, 0.7450981, 1, 0, 1,
-0.7765504, -0.1751616, -2.773906, 0.7411765, 1, 0, 1,
-0.775701, -1.548847, 0.011458, 0.7333333, 1, 0, 1,
-0.7741417, -1.042411, -1.980549, 0.7294118, 1, 0, 1,
-0.7739546, -0.3486722, -2.009134, 0.7215686, 1, 0, 1,
-0.764706, 1.656041, -0.8133751, 0.7176471, 1, 0, 1,
-0.7611342, -1.589139, -2.521083, 0.7098039, 1, 0, 1,
-0.7592015, 0.2806957, -2.39363, 0.7058824, 1, 0, 1,
-0.758208, 0.006804285, -0.1626528, 0.6980392, 1, 0, 1,
-0.755518, -0.001429306, -0.03532336, 0.6901961, 1, 0, 1,
-0.7547289, -0.07587843, -2.104141, 0.6862745, 1, 0, 1,
-0.7542254, -1.838439, -1.616261, 0.6784314, 1, 0, 1,
-0.7468807, -0.8651692, -1.092114, 0.6745098, 1, 0, 1,
-0.7389212, -0.8608729, -2.988003, 0.6666667, 1, 0, 1,
-0.7371672, -0.1511485, -3.534398, 0.6627451, 1, 0, 1,
-0.7338285, 0.8222827, -0.06980834, 0.654902, 1, 0, 1,
-0.7291589, -0.5682296, -4.538675, 0.6509804, 1, 0, 1,
-0.7283812, -0.03247669, -0.7006549, 0.6431373, 1, 0, 1,
-0.7260038, 0.3936618, -0.5511374, 0.6392157, 1, 0, 1,
-0.7241623, -0.03919206, 0.2769077, 0.6313726, 1, 0, 1,
-0.7219504, 0.7509953, -1.608988, 0.627451, 1, 0, 1,
-0.7206966, 0.02177237, -1.127326, 0.6196079, 1, 0, 1,
-0.7200732, -1.394659, -4.26791, 0.6156863, 1, 0, 1,
-0.7175319, -1.239369, -0.5596923, 0.6078432, 1, 0, 1,
-0.7168669, -0.5116503, -2.272372, 0.6039216, 1, 0, 1,
-0.7164526, -1.412005, -2.684402, 0.5960785, 1, 0, 1,
-0.715991, 0.6244641, -1.704655, 0.5882353, 1, 0, 1,
-0.7154603, -0.00404391, -2.356157, 0.5843138, 1, 0, 1,
-0.7104012, 0.5932012, -2.250674, 0.5764706, 1, 0, 1,
-0.7101189, 1.054504, -0.06405525, 0.572549, 1, 0, 1,
-0.7002419, 1.163309, 0.4198943, 0.5647059, 1, 0, 1,
-0.6997043, -0.09397669, -0.7004707, 0.5607843, 1, 0, 1,
-0.6982567, -0.379426, -1.716799, 0.5529412, 1, 0, 1,
-0.6967832, -0.1418824, -3.137865, 0.5490196, 1, 0, 1,
-0.6945657, 0.6937567, -0.3143958, 0.5411765, 1, 0, 1,
-0.6937886, 1.017689, -0.4530271, 0.5372549, 1, 0, 1,
-0.691181, 0.6270329, -0.4942973, 0.5294118, 1, 0, 1,
-0.6910859, 1.558565, -2.126835, 0.5254902, 1, 0, 1,
-0.6898132, -0.03988958, -3.226246, 0.5176471, 1, 0, 1,
-0.6888022, 1.091979, -0.4625773, 0.5137255, 1, 0, 1,
-0.684258, 0.1394384, -1.240155, 0.5058824, 1, 0, 1,
-0.6815344, 0.6584334, -2.497704, 0.5019608, 1, 0, 1,
-0.6778228, 0.4737571, 0.0645444, 0.4941176, 1, 0, 1,
-0.6766555, -0.5028985, -3.657915, 0.4862745, 1, 0, 1,
-0.6665546, 0.7509925, -1.362649, 0.4823529, 1, 0, 1,
-0.6576044, 0.2144205, -1.005751, 0.4745098, 1, 0, 1,
-0.6552539, 0.7907774, -0.142868, 0.4705882, 1, 0, 1,
-0.6549442, -3.004593, -4.220375, 0.4627451, 1, 0, 1,
-0.6539327, 0.1278726, -2.070127, 0.4588235, 1, 0, 1,
-0.6519645, 0.2561821, -1.439327, 0.4509804, 1, 0, 1,
-0.6508337, -0.206711, -2.448483, 0.4470588, 1, 0, 1,
-0.6438358, -0.2039604, -1.931079, 0.4392157, 1, 0, 1,
-0.6423609, -0.2255662, -0.5811528, 0.4352941, 1, 0, 1,
-0.6407775, -1.222926, -0.6621209, 0.427451, 1, 0, 1,
-0.6397218, -0.6840345, -3.389842, 0.4235294, 1, 0, 1,
-0.6310909, -0.5215465, -1.581051, 0.4156863, 1, 0, 1,
-0.6299993, -0.8528144, -2.73506, 0.4117647, 1, 0, 1,
-0.6295385, -0.3749599, -2.386651, 0.4039216, 1, 0, 1,
-0.6275239, -1.704965, -2.832926, 0.3960784, 1, 0, 1,
-0.62266, 1.31504, 0.1280432, 0.3921569, 1, 0, 1,
-0.6195087, -0.4735099, -2.002509, 0.3843137, 1, 0, 1,
-0.6164314, -1.932611, -3.640177, 0.3803922, 1, 0, 1,
-0.6113548, -0.8870004, -3.02949, 0.372549, 1, 0, 1,
-0.6032942, -0.3977564, -2.715009, 0.3686275, 1, 0, 1,
-0.601525, 0.4277094, -0.7099231, 0.3607843, 1, 0, 1,
-0.5993235, 0.07819481, -0.9159105, 0.3568628, 1, 0, 1,
-0.5991594, 1.652934, 1.163449, 0.3490196, 1, 0, 1,
-0.5990586, 0.4406929, -3.104721, 0.345098, 1, 0, 1,
-0.5863357, -1.137683, -1.826079, 0.3372549, 1, 0, 1,
-0.5832329, 0.6043456, -1.865974, 0.3333333, 1, 0, 1,
-0.5827808, -0.1934304, -1.884194, 0.3254902, 1, 0, 1,
-0.5816758, -0.8355359, -1.896396, 0.3215686, 1, 0, 1,
-0.5767235, -0.0936849, -3.209398, 0.3137255, 1, 0, 1,
-0.5748408, -0.7174067, -3.950016, 0.3098039, 1, 0, 1,
-0.5727121, 0.2197354, -1.767579, 0.3019608, 1, 0, 1,
-0.5714945, -0.4829503, -2.35871, 0.2941177, 1, 0, 1,
-0.5701861, 1.443925, -1.358942, 0.2901961, 1, 0, 1,
-0.5695353, -1.578917, -2.931224, 0.282353, 1, 0, 1,
-0.5687877, 0.6156398, -0.7005173, 0.2784314, 1, 0, 1,
-0.5667266, 0.5551654, -1.010794, 0.2705882, 1, 0, 1,
-0.5655043, 0.5780156, -1.885148, 0.2666667, 1, 0, 1,
-0.5577489, -1.309334, -5.873765, 0.2588235, 1, 0, 1,
-0.5570536, 0.7576864, -0.4935955, 0.254902, 1, 0, 1,
-0.5567026, 0.1440002, -2.59469, 0.2470588, 1, 0, 1,
-0.5566442, 0.02458942, -1.93605, 0.2431373, 1, 0, 1,
-0.5566281, 0.7541539, -1.460137, 0.2352941, 1, 0, 1,
-0.5547959, -0.4289038, -1.679219, 0.2313726, 1, 0, 1,
-0.5522063, -0.5293862, -3.122049, 0.2235294, 1, 0, 1,
-0.5516188, 1.703224, 0.1537567, 0.2196078, 1, 0, 1,
-0.5470031, 1.22227, -0.1843624, 0.2117647, 1, 0, 1,
-0.5457337, 0.7128329, -0.01391475, 0.2078431, 1, 0, 1,
-0.5451744, -1.83166, -4.218094, 0.2, 1, 0, 1,
-0.5438803, -1.070188, -2.422219, 0.1921569, 1, 0, 1,
-0.5428205, -0.3502347, -2.615016, 0.1882353, 1, 0, 1,
-0.5320379, -0.340788, -3.374841, 0.1803922, 1, 0, 1,
-0.5320358, 1.18179, 0.6381229, 0.1764706, 1, 0, 1,
-0.5312813, 0.5538594, 0.3835956, 0.1686275, 1, 0, 1,
-0.5264906, -0.433062, -1.414515, 0.1647059, 1, 0, 1,
-0.5240715, -1.00404, -3.037872, 0.1568628, 1, 0, 1,
-0.5208354, -0.7674351, -1.267915, 0.1529412, 1, 0, 1,
-0.5203189, 0.04922529, 0.03147532, 0.145098, 1, 0, 1,
-0.5202692, 0.09500097, 0.01971049, 0.1411765, 1, 0, 1,
-0.5199198, 0.5217214, 0.6522601, 0.1333333, 1, 0, 1,
-0.5167757, -1.072738, -3.395046, 0.1294118, 1, 0, 1,
-0.5161009, -1.365025, -3.434739, 0.1215686, 1, 0, 1,
-0.5006216, -1.334922, -4.15921, 0.1176471, 1, 0, 1,
-0.5000902, 0.1684997, -1.322896, 0.1098039, 1, 0, 1,
-0.4987206, -1.620322, -3.856544, 0.1058824, 1, 0, 1,
-0.4971845, 0.3929362, 0.0997998, 0.09803922, 1, 0, 1,
-0.4891824, 1.911222, -0.3818855, 0.09019608, 1, 0, 1,
-0.4815615, -0.2365339, -2.301231, 0.08627451, 1, 0, 1,
-0.477827, -0.6872681, -2.669682, 0.07843138, 1, 0, 1,
-0.471382, -1.112896, -4.21139, 0.07450981, 1, 0, 1,
-0.4693232, -2.777282, -2.915557, 0.06666667, 1, 0, 1,
-0.4634849, -0.45086, -1.865353, 0.0627451, 1, 0, 1,
-0.4627222, 0.1823534, -0.06915027, 0.05490196, 1, 0, 1,
-0.4588881, 0.6687616, -0.7193927, 0.05098039, 1, 0, 1,
-0.4555979, 0.296718, 0.2211298, 0.04313726, 1, 0, 1,
-0.4552667, 0.03102119, -0.4726549, 0.03921569, 1, 0, 1,
-0.4531485, -0.5659958, -0.5379565, 0.03137255, 1, 0, 1,
-0.444155, -0.2028399, -0.9948989, 0.02745098, 1, 0, 1,
-0.4423012, 2.396189, -0.2644378, 0.01960784, 1, 0, 1,
-0.4404355, 0.1225372, -0.3864107, 0.01568628, 1, 0, 1,
-0.4402919, 0.9254982, 0.4751129, 0.007843138, 1, 0, 1,
-0.4376051, 1.637279, -0.04988039, 0.003921569, 1, 0, 1,
-0.4358679, 0.8715135, -0.8052685, 0, 1, 0.003921569, 1,
-0.435697, 0.8150116, -0.980824, 0, 1, 0.01176471, 1,
-0.4323527, -0.6512891, -2.764633, 0, 1, 0.01568628, 1,
-0.4306166, 0.5104802, -0.2038253, 0, 1, 0.02352941, 1,
-0.4298714, 1.152683, 0.03608911, 0, 1, 0.02745098, 1,
-0.4288568, 0.08095506, -1.115409, 0, 1, 0.03529412, 1,
-0.428788, 1.292045, 1.385347, 0, 1, 0.03921569, 1,
-0.4273304, 0.7758072, 0.5748084, 0, 1, 0.04705882, 1,
-0.4240193, -0.4955908, -2.39688, 0, 1, 0.05098039, 1,
-0.422071, -0.989485, -4.459525, 0, 1, 0.05882353, 1,
-0.421828, -0.2830874, -0.2329864, 0, 1, 0.0627451, 1,
-0.419315, -0.4319523, -2.178376, 0, 1, 0.07058824, 1,
-0.4181888, -0.3536134, -3.385661, 0, 1, 0.07450981, 1,
-0.4116852, 0.6700881, 1.204632, 0, 1, 0.08235294, 1,
-0.4109415, 0.274666, -1.395785, 0, 1, 0.08627451, 1,
-0.4093557, 0.1967687, -1.205248, 0, 1, 0.09411765, 1,
-0.4045146, 0.5351931, 0.1039284, 0, 1, 0.1019608, 1,
-0.4038187, -1.739446, -3.663269, 0, 1, 0.1058824, 1,
-0.401219, -0.5069007, -1.809661, 0, 1, 0.1137255, 1,
-0.398594, -1.718516, -1.765039, 0, 1, 0.1176471, 1,
-0.3899066, 1.379341, -0.2833933, 0, 1, 0.1254902, 1,
-0.3896834, 0.1049589, -1.334217, 0, 1, 0.1294118, 1,
-0.3892718, -0.8027449, -3.451655, 0, 1, 0.1372549, 1,
-0.3885437, 1.229997, -0.5600802, 0, 1, 0.1411765, 1,
-0.3884315, -0.2551588, -2.329702, 0, 1, 0.1490196, 1,
-0.3857845, -0.07821323, -2.221694, 0, 1, 0.1529412, 1,
-0.3851805, -0.7338545, -2.765756, 0, 1, 0.1607843, 1,
-0.3851505, -0.8067279, -2.247504, 0, 1, 0.1647059, 1,
-0.3806753, 0.02915831, -0.5076007, 0, 1, 0.172549, 1,
-0.3778983, 0.2743479, -1.994463, 0, 1, 0.1764706, 1,
-0.3772981, -0.7068557, -2.584018, 0, 1, 0.1843137, 1,
-0.3761006, 0.7528299, 0.3990082, 0, 1, 0.1882353, 1,
-0.3745169, 0.6628246, -0.4740779, 0, 1, 0.1960784, 1,
-0.3721298, 0.2676601, -1.824838, 0, 1, 0.2039216, 1,
-0.3680733, -1.106686, -3.040749, 0, 1, 0.2078431, 1,
-0.3673672, 1.127233, -0.4123673, 0, 1, 0.2156863, 1,
-0.3668461, -1.382098, -3.436654, 0, 1, 0.2196078, 1,
-0.361632, 1.758043, 0.6245255, 0, 1, 0.227451, 1,
-0.3602827, 0.8067106, -1.898155, 0, 1, 0.2313726, 1,
-0.3558083, 0.01712479, -0.9556701, 0, 1, 0.2392157, 1,
-0.3512087, -0.1862926, -1.830956, 0, 1, 0.2431373, 1,
-0.3498279, -1.476929, -2.298087, 0, 1, 0.2509804, 1,
-0.3497311, 0.01281265, -0.1120767, 0, 1, 0.254902, 1,
-0.3452609, 0.434636, -0.4971314, 0, 1, 0.2627451, 1,
-0.3429342, 0.02774167, -1.147552, 0, 1, 0.2666667, 1,
-0.3419823, -1.73374, -3.946097, 0, 1, 0.2745098, 1,
-0.3408656, -0.0365961, -1.278093, 0, 1, 0.2784314, 1,
-0.3365096, 0.2532328, -2.431416, 0, 1, 0.2862745, 1,
-0.329929, -0.04429664, -0.4174891, 0, 1, 0.2901961, 1,
-0.3273035, 1.193781, -2.069206, 0, 1, 0.2980392, 1,
-0.3271056, 1.734052, -1.213436, 0, 1, 0.3058824, 1,
-0.325792, -0.4945852, -3.432039, 0, 1, 0.3098039, 1,
-0.3230819, -0.06593027, -1.085758, 0, 1, 0.3176471, 1,
-0.3229609, -1.487317, -3.715254, 0, 1, 0.3215686, 1,
-0.3146909, -1.178943, -2.891437, 0, 1, 0.3294118, 1,
-0.3135098, 1.421591, 0.6995541, 0, 1, 0.3333333, 1,
-0.3121903, 0.577632, -0.7237043, 0, 1, 0.3411765, 1,
-0.3025007, -0.2022154, -1.428945, 0, 1, 0.345098, 1,
-0.3011103, 0.4692454, 1.407794, 0, 1, 0.3529412, 1,
-0.2947862, -0.09811191, -2.110537, 0, 1, 0.3568628, 1,
-0.2933975, 0.9488837, 1.32999, 0, 1, 0.3647059, 1,
-0.2930734, 0.4960738, -1.302182, 0, 1, 0.3686275, 1,
-0.2914789, 0.3735954, -1.406695, 0, 1, 0.3764706, 1,
-0.291153, 0.08914532, -1.49341, 0, 1, 0.3803922, 1,
-0.2901497, 1.169353, -0.4912393, 0, 1, 0.3882353, 1,
-0.289179, -0.432265, -2.804306, 0, 1, 0.3921569, 1,
-0.2856088, -0.8009156, -0.346739, 0, 1, 0.4, 1,
-0.2855163, -0.3690056, -4.39613, 0, 1, 0.4078431, 1,
-0.2777462, 1.032215, 0.1227244, 0, 1, 0.4117647, 1,
-0.2755749, -0.6772542, -2.291509, 0, 1, 0.4196078, 1,
-0.2740135, 0.4238445, -0.6200696, 0, 1, 0.4235294, 1,
-0.2702968, 0.3543696, -2.050999, 0, 1, 0.4313726, 1,
-0.2639415, 1.427652, -0.08590286, 0, 1, 0.4352941, 1,
-0.2606243, -0.4292529, -4.371769, 0, 1, 0.4431373, 1,
-0.2592769, 0.2172407, -1.399567, 0, 1, 0.4470588, 1,
-0.2554342, 0.890175, 1.926371, 0, 1, 0.454902, 1,
-0.2538106, -1.535958, -2.455602, 0, 1, 0.4588235, 1,
-0.2487346, -0.5032681, -2.020304, 0, 1, 0.4666667, 1,
-0.2486395, 0.1622212, -1.500184, 0, 1, 0.4705882, 1,
-0.2472457, 0.4368496, -1.095094, 0, 1, 0.4784314, 1,
-0.2410991, -1.18209, -4.444106, 0, 1, 0.4823529, 1,
-0.2382971, 0.01018738, -0.5223769, 0, 1, 0.4901961, 1,
-0.2331059, -0.6528004, -4.165352, 0, 1, 0.4941176, 1,
-0.2284468, -0.4349234, -2.784294, 0, 1, 0.5019608, 1,
-0.2242246, -0.8622007, -3.47439, 0, 1, 0.509804, 1,
-0.2227544, -1.638146, -3.342077, 0, 1, 0.5137255, 1,
-0.2201529, -0.2623391, 0.2012536, 0, 1, 0.5215687, 1,
-0.218307, 1.863888, 0.6034964, 0, 1, 0.5254902, 1,
-0.2159362, -1.901923, -1.70513, 0, 1, 0.5333334, 1,
-0.2120756, 0.512826, -0.1654289, 0, 1, 0.5372549, 1,
-0.2063029, -0.1594947, -3.081515, 0, 1, 0.5450981, 1,
-0.2040478, 0.2583612, -0.1127847, 0, 1, 0.5490196, 1,
-0.2040205, -0.95899, -3.488722, 0, 1, 0.5568628, 1,
-0.2022791, -0.687586, -3.418874, 0, 1, 0.5607843, 1,
-0.2022265, 0.403154, -1.399263, 0, 1, 0.5686275, 1,
-0.2021198, -1.952159, -2.782637, 0, 1, 0.572549, 1,
-0.1989908, 1.119156, 0.03972104, 0, 1, 0.5803922, 1,
-0.1949404, 1.448389, -1.23951, 0, 1, 0.5843138, 1,
-0.1936617, -0.3812273, -3.28103, 0, 1, 0.5921569, 1,
-0.1888803, 1.386425, -0.1282463, 0, 1, 0.5960785, 1,
-0.1882051, 1.625695, 1.620202, 0, 1, 0.6039216, 1,
-0.1853158, -0.9269485, -2.543841, 0, 1, 0.6117647, 1,
-0.1831752, 0.1733739, -2.125165, 0, 1, 0.6156863, 1,
-0.1813971, -1.054275, -1.763042, 0, 1, 0.6235294, 1,
-0.1813355, 0.006308791, -0.9680652, 0, 1, 0.627451, 1,
-0.1785815, 0.1376592, -0.2114944, 0, 1, 0.6352941, 1,
-0.1774926, -1.106451, -3.658975, 0, 1, 0.6392157, 1,
-0.1728157, 0.8203153, -0.238523, 0, 1, 0.6470588, 1,
-0.1708993, -0.7912883, -1.222116, 0, 1, 0.6509804, 1,
-0.1682, -0.5272829, -2.251956, 0, 1, 0.6588235, 1,
-0.1657565, 0.2607726, 0.8911142, 0, 1, 0.6627451, 1,
-0.1610747, -0.6301764, -3.33, 0, 1, 0.6705883, 1,
-0.1550029, -1.586146, -2.460505, 0, 1, 0.6745098, 1,
-0.1545956, -0.7569577, -1.36356, 0, 1, 0.682353, 1,
-0.154092, 2.486953, 1.771955, 0, 1, 0.6862745, 1,
-0.1540619, 0.1133442, -2.031203, 0, 1, 0.6941177, 1,
-0.1535235, -0.0510417, -1.194475, 0, 1, 0.7019608, 1,
-0.1481856, 0.4776312, 0.7259584, 0, 1, 0.7058824, 1,
-0.1447069, -0.3106748, -2.134221, 0, 1, 0.7137255, 1,
-0.1430808, -1.464435, -2.911189, 0, 1, 0.7176471, 1,
-0.1414184, -0.2575184, -3.850576, 0, 1, 0.7254902, 1,
-0.1333622, -1.203517, -2.364484, 0, 1, 0.7294118, 1,
-0.1323974, -0.3069281, -3.248535, 0, 1, 0.7372549, 1,
-0.1318175, 0.1373112, -0.2919073, 0, 1, 0.7411765, 1,
-0.1300485, -0.3540748, -3.863188, 0, 1, 0.7490196, 1,
-0.1284742, -0.2019588, -1.549745, 0, 1, 0.7529412, 1,
-0.1272816, 0.2171014, -1.550478, 0, 1, 0.7607843, 1,
-0.1270211, -0.8943911, -2.8476, 0, 1, 0.7647059, 1,
-0.1256278, -0.6497602, -2.203083, 0, 1, 0.772549, 1,
-0.1247092, -1.401716, -0.8493299, 0, 1, 0.7764706, 1,
-0.1244986, 0.02884695, -0.8942876, 0, 1, 0.7843137, 1,
-0.1227822, 1.257996, -0.03551816, 0, 1, 0.7882353, 1,
-0.1224723, -1.264236, -4.222172, 0, 1, 0.7960784, 1,
-0.120092, 0.1125121, -0.2358082, 0, 1, 0.8039216, 1,
-0.1200259, 0.2937503, -1.271686, 0, 1, 0.8078431, 1,
-0.1182598, 1.344262, 0.271246, 0, 1, 0.8156863, 1,
-0.1147471, 0.02592539, 0.9396356, 0, 1, 0.8196079, 1,
-0.1133038, 1.349031, -0.6110889, 0, 1, 0.827451, 1,
-0.1113416, -0.6726639, -3.718067, 0, 1, 0.8313726, 1,
-0.110937, 0.05986398, -0.1758107, 0, 1, 0.8392157, 1,
-0.1102245, -1.516073, -2.004232, 0, 1, 0.8431373, 1,
-0.1082781, -0.7705826, -2.360687, 0, 1, 0.8509804, 1,
-0.1047489, 0.4647124, -1.597909, 0, 1, 0.854902, 1,
-0.1042898, 1.794189, -1.685466, 0, 1, 0.8627451, 1,
-0.1032551, 1.307095, -0.7222674, 0, 1, 0.8666667, 1,
-0.1021716, -1.180732, -4.215107, 0, 1, 0.8745098, 1,
-0.09797033, 0.7914691, -0.7360556, 0, 1, 0.8784314, 1,
-0.09715902, 1.024422, 1.071933, 0, 1, 0.8862745, 1,
-0.09565146, -0.7191427, -1.939171, 0, 1, 0.8901961, 1,
-0.0919342, 0.6545025, 1.256853, 0, 1, 0.8980392, 1,
-0.0912255, 0.5198008, -1.672762, 0, 1, 0.9058824, 1,
-0.09012489, 1.194056, -0.5718802, 0, 1, 0.9098039, 1,
-0.08796104, 1.311007, 0.03729491, 0, 1, 0.9176471, 1,
-0.08361345, -0.6248875, -2.284963, 0, 1, 0.9215686, 1,
-0.08054499, -0.9530337, -2.334772, 0, 1, 0.9294118, 1,
-0.07910509, -1.12394, -3.293823, 0, 1, 0.9333333, 1,
-0.07641609, -0.4465359, -2.871748, 0, 1, 0.9411765, 1,
-0.07239372, 0.3905225, -0.6140577, 0, 1, 0.945098, 1,
-0.07029799, -1.088152, -1.361683, 0, 1, 0.9529412, 1,
-0.06558527, -0.6228259, -2.29905, 0, 1, 0.9568627, 1,
-0.06444431, -0.8264796, -2.963849, 0, 1, 0.9647059, 1,
-0.06018528, 1.63363, -1.843389, 0, 1, 0.9686275, 1,
-0.05962426, 0.8014792, -0.6811914, 0, 1, 0.9764706, 1,
-0.05400171, -0.9298167, -1.785588, 0, 1, 0.9803922, 1,
-0.05223903, -1.145689, -1.340089, 0, 1, 0.9882353, 1,
-0.05143019, 1.788717, -0.3295645, 0, 1, 0.9921569, 1,
-0.04332894, 0.9485775, -0.2307822, 0, 1, 1, 1,
-0.04046923, 0.1860673, -0.9420927, 0, 0.9921569, 1, 1,
-0.04033066, -1.655818, -2.35511, 0, 0.9882353, 1, 1,
-0.03948253, 0.7011734, 1.479017, 0, 0.9803922, 1, 1,
-0.037105, -1.750429, -2.110789, 0, 0.9764706, 1, 1,
-0.03562222, -0.5135803, -3.614082, 0, 0.9686275, 1, 1,
-0.03524179, 0.5397227, 0.714632, 0, 0.9647059, 1, 1,
-0.03344436, 1.960731, 0.8943735, 0, 0.9568627, 1, 1,
-0.02895874, 0.1856173, 0.0008897812, 0, 0.9529412, 1, 1,
-0.02465878, 0.646741, -1.673983, 0, 0.945098, 1, 1,
-0.0241212, -0.5111732, -1.786949, 0, 0.9411765, 1, 1,
-0.02060369, -1.038198, -1.385323, 0, 0.9333333, 1, 1,
-0.01961948, 1.073298, -0.692384, 0, 0.9294118, 1, 1,
-0.01588239, 1.099035, -0.3597528, 0, 0.9215686, 1, 1,
-0.0152056, 0.6537139, 0.08757439, 0, 0.9176471, 1, 1,
-0.01297463, 2.099875, -0.8296809, 0, 0.9098039, 1, 1,
-0.01127812, 1.194071, 0.9574059, 0, 0.9058824, 1, 1,
-0.004536546, -1.338753, -2.442082, 0, 0.8980392, 1, 1,
-0.0031604, -0.3356939, -3.86867, 0, 0.8901961, 1, 1,
-0.000705026, -0.8958548, -2.778922, 0, 0.8862745, 1, 1,
0.004018479, 0.7305867, -0.06125502, 0, 0.8784314, 1, 1,
0.004818972, -0.582705, 1.693712, 0, 0.8745098, 1, 1,
0.007435508, 1.342848, 0.16213, 0, 0.8666667, 1, 1,
0.01415549, -0.6548102, 2.564172, 0, 0.8627451, 1, 1,
0.01484821, -0.09710418, 2.239623, 0, 0.854902, 1, 1,
0.02225626, 1.031112, -2.001415, 0, 0.8509804, 1, 1,
0.02310578, -1.149433, 2.777091, 0, 0.8431373, 1, 1,
0.02476806, -1.038488, 3.763112, 0, 0.8392157, 1, 1,
0.02946482, -0.1161508, 2.691667, 0, 0.8313726, 1, 1,
0.02982457, -1.25045, 3.264573, 0, 0.827451, 1, 1,
0.02983449, 0.1867578, 0.7009178, 0, 0.8196079, 1, 1,
0.03126984, 0.145732, -0.05488759, 0, 0.8156863, 1, 1,
0.03371958, -0.3454814, 3.081558, 0, 0.8078431, 1, 1,
0.03538277, -0.4120615, 1.344352, 0, 0.8039216, 1, 1,
0.04363554, 1.818339, -1.354641, 0, 0.7960784, 1, 1,
0.04364304, -1.506, 3.688057, 0, 0.7882353, 1, 1,
0.04666957, 0.1517942, 0.8781429, 0, 0.7843137, 1, 1,
0.04680335, 1.95598, 0.3448619, 0, 0.7764706, 1, 1,
0.04712648, 0.7204272, 0.3720444, 0, 0.772549, 1, 1,
0.04781233, -1.02329, 2.908147, 0, 0.7647059, 1, 1,
0.0523365, -0.0762463, 2.686045, 0, 0.7607843, 1, 1,
0.05281625, -0.01126004, 1.070449, 0, 0.7529412, 1, 1,
0.05350798, 0.4438249, -1.859214, 0, 0.7490196, 1, 1,
0.05486275, -0.7204044, 2.541707, 0, 0.7411765, 1, 1,
0.05629968, -1.334116, 2.018451, 0, 0.7372549, 1, 1,
0.06256056, 1.014108, -0.5778758, 0, 0.7294118, 1, 1,
0.06472205, 0.6083295, -0.3866795, 0, 0.7254902, 1, 1,
0.06711946, -0.5550988, 3.193732, 0, 0.7176471, 1, 1,
0.07030126, 1.107524, 0.9565576, 0, 0.7137255, 1, 1,
0.074211, 0.7261738, 0.4877554, 0, 0.7058824, 1, 1,
0.07436243, -0.2064317, 1.028343, 0, 0.6980392, 1, 1,
0.07438054, -1.408886, 2.101865, 0, 0.6941177, 1, 1,
0.07580867, 0.48537, 0.1436725, 0, 0.6862745, 1, 1,
0.07675588, 1.211327, 1.549669, 0, 0.682353, 1, 1,
0.08242934, -0.4310429, 4.411273, 0, 0.6745098, 1, 1,
0.08379769, 0.7623532, -0.3418299, 0, 0.6705883, 1, 1,
0.08414019, -2.003239, 3.405954, 0, 0.6627451, 1, 1,
0.08555165, -0.1884876, 2.819604, 0, 0.6588235, 1, 1,
0.08557498, -2.018409, 3.881196, 0, 0.6509804, 1, 1,
0.08652803, -0.2991855, 3.871944, 0, 0.6470588, 1, 1,
0.08943796, -0.1293164, 3.302384, 0, 0.6392157, 1, 1,
0.09323263, 0.7107664, 1.526319, 0, 0.6352941, 1, 1,
0.09324412, 0.2693067, 0.7165806, 0, 0.627451, 1, 1,
0.1000345, -0.8106743, 4.328341, 0, 0.6235294, 1, 1,
0.1008099, -2.875291, 3.44184, 0, 0.6156863, 1, 1,
0.1029194, 1.106974, 0.563611, 0, 0.6117647, 1, 1,
0.1056442, 0.7536811, 0.0372825, 0, 0.6039216, 1, 1,
0.1148852, 0.3881219, -1.388281, 0, 0.5960785, 1, 1,
0.1156908, 1.053766, -0.2047676, 0, 0.5921569, 1, 1,
0.1168713, -0.117624, 1.880171, 0, 0.5843138, 1, 1,
0.1197328, 0.04468728, 1.825968, 0, 0.5803922, 1, 1,
0.1201831, 1.029008, -1.136041, 0, 0.572549, 1, 1,
0.1206107, 0.29013, 0.2031049, 0, 0.5686275, 1, 1,
0.1224211, -0.4637594, 2.537189, 0, 0.5607843, 1, 1,
0.1278851, 0.4477398, 1.329995, 0, 0.5568628, 1, 1,
0.1289381, 1.095305, -0.1340193, 0, 0.5490196, 1, 1,
0.1408671, 1.141114, 2.223199, 0, 0.5450981, 1, 1,
0.1426476, -0.8647426, 3.883421, 0, 0.5372549, 1, 1,
0.1429007, 0.04509525, 1.547553, 0, 0.5333334, 1, 1,
0.1452523, -0.1420377, 1.529716, 0, 0.5254902, 1, 1,
0.1455882, -0.130545, 1.303613, 0, 0.5215687, 1, 1,
0.1462408, -0.400871, 4.875152, 0, 0.5137255, 1, 1,
0.1481502, 0.1707415, 1.121751, 0, 0.509804, 1, 1,
0.1557181, -0.4657795, 2.657647, 0, 0.5019608, 1, 1,
0.1580558, -0.1785608, 2.025293, 0, 0.4941176, 1, 1,
0.1603619, 0.6630481, 0.4756393, 0, 0.4901961, 1, 1,
0.1608264, 0.1070278, 1.606889, 0, 0.4823529, 1, 1,
0.1610601, -0.7245296, 2.063314, 0, 0.4784314, 1, 1,
0.1661426, -0.9535347, 4.259293, 0, 0.4705882, 1, 1,
0.1667717, -1.287696, 3.392656, 0, 0.4666667, 1, 1,
0.1711618, 0.6745428, 1.788002, 0, 0.4588235, 1, 1,
0.1719227, 1.591334, 0.7861398, 0, 0.454902, 1, 1,
0.1739416, 0.8107529, 3.09534, 0, 0.4470588, 1, 1,
0.1741838, 0.3566101, 0.3092652, 0, 0.4431373, 1, 1,
0.1767364, -1.193027, 1.920047, 0, 0.4352941, 1, 1,
0.1767808, 0.3500417, 1.127844, 0, 0.4313726, 1, 1,
0.1833603, 0.0610075, 2.135073, 0, 0.4235294, 1, 1,
0.1881122, 1.006532, -0.1192819, 0, 0.4196078, 1, 1,
0.1910062, -1.552021, 2.084576, 0, 0.4117647, 1, 1,
0.1950038, 1.062521, 1.777111, 0, 0.4078431, 1, 1,
0.2035494, 0.2535343, 1.012139, 0, 0.4, 1, 1,
0.2042657, -0.8113654, 3.793028, 0, 0.3921569, 1, 1,
0.2046316, 0.4645853, -0.5963982, 0, 0.3882353, 1, 1,
0.2090981, 0.3785458, 0.3502814, 0, 0.3803922, 1, 1,
0.2141024, -0.984104, 2.559435, 0, 0.3764706, 1, 1,
0.2173776, -0.6506083, 2.459447, 0, 0.3686275, 1, 1,
0.2176869, 0.7018027, -0.6866466, 0, 0.3647059, 1, 1,
0.2180843, -0.3089338, 2.419293, 0, 0.3568628, 1, 1,
0.2190152, 1.725083, -1.911239, 0, 0.3529412, 1, 1,
0.2213864, -1.404385, 2.637131, 0, 0.345098, 1, 1,
0.2259379, 0.2586377, 1.232591, 0, 0.3411765, 1, 1,
0.2259524, -1.553304, 4.478888, 0, 0.3333333, 1, 1,
0.2270164, -0.7023004, 4.120215, 0, 0.3294118, 1, 1,
0.2271866, -0.1925212, 1.897289, 0, 0.3215686, 1, 1,
0.2294928, -2.55542, 1.631659, 0, 0.3176471, 1, 1,
0.2337218, 0.293425, 1.442209, 0, 0.3098039, 1, 1,
0.2342514, -1.555654, 2.395528, 0, 0.3058824, 1, 1,
0.2396283, 0.7381987, 0.4056493, 0, 0.2980392, 1, 1,
0.2428625, 0.3367916, -0.5019559, 0, 0.2901961, 1, 1,
0.2449474, -0.03955109, 0.5437114, 0, 0.2862745, 1, 1,
0.2476266, -0.4712279, 2.460646, 0, 0.2784314, 1, 1,
0.2498596, -1.607431, 3.617507, 0, 0.2745098, 1, 1,
0.2515904, 0.14893, 0.7143807, 0, 0.2666667, 1, 1,
0.2517073, -0.4594592, 2.885387, 0, 0.2627451, 1, 1,
0.2517627, 0.1456223, 1.848198, 0, 0.254902, 1, 1,
0.2562228, 1.304619, -0.9219465, 0, 0.2509804, 1, 1,
0.2618795, -0.2226229, 0.9292675, 0, 0.2431373, 1, 1,
0.2654166, -0.1086765, 1.060511, 0, 0.2392157, 1, 1,
0.2781876, 0.06674454, 0.4405434, 0, 0.2313726, 1, 1,
0.280412, 0.4003825, 0.3354316, 0, 0.227451, 1, 1,
0.2804421, 1.025451, -0.8231691, 0, 0.2196078, 1, 1,
0.2817371, -1.185606, 1.650478, 0, 0.2156863, 1, 1,
0.282412, 0.21414, 1.449688, 0, 0.2078431, 1, 1,
0.2836847, -1.093817, 2.880849, 0, 0.2039216, 1, 1,
0.2884418, -0.6108322, 2.65501, 0, 0.1960784, 1, 1,
0.2964203, 0.8426183, -0.08548377, 0, 0.1882353, 1, 1,
0.2967654, 0.7234073, 0.6076251, 0, 0.1843137, 1, 1,
0.3015023, -1.729594, 1.341642, 0, 0.1764706, 1, 1,
0.3052901, 0.8987458, 0.4415448, 0, 0.172549, 1, 1,
0.30747, -0.01004373, 0.6020011, 0, 0.1647059, 1, 1,
0.3091806, 0.09490412, 1.845159, 0, 0.1607843, 1, 1,
0.3133495, -0.4283741, 2.645876, 0, 0.1529412, 1, 1,
0.3144139, -0.1671518, 1.867625, 0, 0.1490196, 1, 1,
0.3150991, -0.3616425, 2.685979, 0, 0.1411765, 1, 1,
0.3174381, 1.234056, -2.316425, 0, 0.1372549, 1, 1,
0.3187751, 0.5780216, 1.540224, 0, 0.1294118, 1, 1,
0.3199811, -0.1504541, 0.8126292, 0, 0.1254902, 1, 1,
0.3200149, -0.9295453, 3.166933, 0, 0.1176471, 1, 1,
0.3200437, 0.2730972, 1.355597, 0, 0.1137255, 1, 1,
0.3211973, 0.553755, -0.5109383, 0, 0.1058824, 1, 1,
0.3242726, 0.3874236, 0.9812862, 0, 0.09803922, 1, 1,
0.3256784, -0.3735929, 2.739974, 0, 0.09411765, 1, 1,
0.3319214, 0.7276301, 0.4559847, 0, 0.08627451, 1, 1,
0.3324876, 0.7837692, -0.5608828, 0, 0.08235294, 1, 1,
0.3364966, 0.993645, -0.1592074, 0, 0.07450981, 1, 1,
0.3394473, -0.7680303, 1.987806, 0, 0.07058824, 1, 1,
0.3396035, 1.099906, 0.5965331, 0, 0.0627451, 1, 1,
0.3410472, -0.4717673, 4.72734, 0, 0.05882353, 1, 1,
0.3415415, -0.9494554, 3.777826, 0, 0.05098039, 1, 1,
0.34241, 0.4316855, 0.2685268, 0, 0.04705882, 1, 1,
0.3445479, 0.2732258, 0.311357, 0, 0.03921569, 1, 1,
0.3484394, 0.0783283, 1.22809, 0, 0.03529412, 1, 1,
0.3507821, -0.4006652, 1.395816, 0, 0.02745098, 1, 1,
0.3543501, 3.012224, 0.1244391, 0, 0.02352941, 1, 1,
0.3552749, -0.9985235, 3.406094, 0, 0.01568628, 1, 1,
0.363408, -0.2294211, 2.903836, 0, 0.01176471, 1, 1,
0.3654266, -0.19567, 2.763209, 0, 0.003921569, 1, 1,
0.3659012, 0.8887517, -0.8366165, 0.003921569, 0, 1, 1,
0.3683005, -1.857294, 2.162261, 0.007843138, 0, 1, 1,
0.3722251, -0.7756044, 3.342459, 0.01568628, 0, 1, 1,
0.3799915, -1.328036, 5.046844, 0.01960784, 0, 1, 1,
0.3802373, -0.6760988, 1.765438, 0.02745098, 0, 1, 1,
0.3842668, 0.1002721, 1.522191, 0.03137255, 0, 1, 1,
0.3844428, -0.9292102, 2.288383, 0.03921569, 0, 1, 1,
0.3857905, 0.7055498, 0.2298323, 0.04313726, 0, 1, 1,
0.3890786, 0.6724548, 0.5154343, 0.05098039, 0, 1, 1,
0.3904534, 0.5772559, 2.110787, 0.05490196, 0, 1, 1,
0.3979883, 0.2664602, -0.4204629, 0.0627451, 0, 1, 1,
0.4039996, -0.3509378, 2.223343, 0.06666667, 0, 1, 1,
0.4069376, 0.7875597, 0.2106836, 0.07450981, 0, 1, 1,
0.4095423, 0.581933, -0.004191688, 0.07843138, 0, 1, 1,
0.4131765, 0.5753956, -0.9271649, 0.08627451, 0, 1, 1,
0.4154924, -1.249352, 2.028197, 0.09019608, 0, 1, 1,
0.4223194, -1.238206, 5.04973, 0.09803922, 0, 1, 1,
0.4233544, 0.002533871, 0.08025315, 0.1058824, 0, 1, 1,
0.4237317, -0.6880443, 2.516174, 0.1098039, 0, 1, 1,
0.4262986, -1.24164, 3.080969, 0.1176471, 0, 1, 1,
0.4265004, 1.457013, -0.9981301, 0.1215686, 0, 1, 1,
0.427237, -0.3629289, 1.853803, 0.1294118, 0, 1, 1,
0.4299904, 0.6523634, 1.879399, 0.1333333, 0, 1, 1,
0.4342127, -0.5246322, 3.325263, 0.1411765, 0, 1, 1,
0.4422074, 1.242381, -0.2173606, 0.145098, 0, 1, 1,
0.4502303, 0.8427377, 1.989798, 0.1529412, 0, 1, 1,
0.451713, -1.078217, 3.836761, 0.1568628, 0, 1, 1,
0.4541532, 1.061968, 1.187326, 0.1647059, 0, 1, 1,
0.4597027, -0.5292514, 2.616227, 0.1686275, 0, 1, 1,
0.4781001, -2.817705, 1.022089, 0.1764706, 0, 1, 1,
0.4823368, 0.3745805, 2.283623, 0.1803922, 0, 1, 1,
0.4843454, 1.842531, -0.07301663, 0.1882353, 0, 1, 1,
0.4911093, -0.3485525, 0.8151029, 0.1921569, 0, 1, 1,
0.4931757, -0.7903674, 3.086562, 0.2, 0, 1, 1,
0.493644, -0.0349112, 0.4226324, 0.2078431, 0, 1, 1,
0.4961242, -0.8485678, 1.407838, 0.2117647, 0, 1, 1,
0.5103765, 0.4882813, 2.029129, 0.2196078, 0, 1, 1,
0.5144717, -0.8433762, 4.775055, 0.2235294, 0, 1, 1,
0.5171782, -0.03205774, 0.8252745, 0.2313726, 0, 1, 1,
0.5255302, 0.4138511, 0.7873008, 0.2352941, 0, 1, 1,
0.5298771, -0.4434043, 1.949896, 0.2431373, 0, 1, 1,
0.5322287, -0.9697816, 2.964621, 0.2470588, 0, 1, 1,
0.5338743, 0.4030784, 1.254941, 0.254902, 0, 1, 1,
0.5373141, 0.0595585, 1.288579, 0.2588235, 0, 1, 1,
0.5392016, 2.696084, 0.3919772, 0.2666667, 0, 1, 1,
0.5408866, -1.011867, 1.346337, 0.2705882, 0, 1, 1,
0.5419551, 0.008426797, 2.189986, 0.2784314, 0, 1, 1,
0.5422105, -0.2983008, 1.410176, 0.282353, 0, 1, 1,
0.5429862, 0.1901415, 2.717121, 0.2901961, 0, 1, 1,
0.5479479, 0.01186586, 1.240253, 0.2941177, 0, 1, 1,
0.5513228, 0.3530293, 2.974462, 0.3019608, 0, 1, 1,
0.5552989, -0.7101189, 3.149092, 0.3098039, 0, 1, 1,
0.5570839, 1.724894, 1.026679, 0.3137255, 0, 1, 1,
0.5571589, -1.698128, 2.101933, 0.3215686, 0, 1, 1,
0.5643904, -1.268097, 4.080428, 0.3254902, 0, 1, 1,
0.5651988, -0.6487391, 1.557164, 0.3333333, 0, 1, 1,
0.5664994, 1.245803, 1.012183, 0.3372549, 0, 1, 1,
0.5669993, 1.352551, -0.5693352, 0.345098, 0, 1, 1,
0.5673445, 0.5346186, 1.236556, 0.3490196, 0, 1, 1,
0.5698301, -0.4421426, 1.907501, 0.3568628, 0, 1, 1,
0.5741541, -0.8943509, 0.262386, 0.3607843, 0, 1, 1,
0.5805959, 0.09823576, 0.3319652, 0.3686275, 0, 1, 1,
0.5906348, 1.070932, 0.3004582, 0.372549, 0, 1, 1,
0.5922294, 1.021213, 1.18142, 0.3803922, 0, 1, 1,
0.5968848, 0.1155544, 0.1423941, 0.3843137, 0, 1, 1,
0.5985845, -1.481271, 2.785364, 0.3921569, 0, 1, 1,
0.6004549, -0.83284, 3.731422, 0.3960784, 0, 1, 1,
0.601107, 1.088497, -1.012767, 0.4039216, 0, 1, 1,
0.6039928, -2.004483, 3.240374, 0.4117647, 0, 1, 1,
0.6067612, 0.1598797, 2.082127, 0.4156863, 0, 1, 1,
0.6142648, 0.2439862, 2.553889, 0.4235294, 0, 1, 1,
0.615741, 0.3530604, 0.155675, 0.427451, 0, 1, 1,
0.620743, 1.90127, 1.319964, 0.4352941, 0, 1, 1,
0.6242321, 1.013629, 1.022054, 0.4392157, 0, 1, 1,
0.6248875, -0.7474718, 1.549045, 0.4470588, 0, 1, 1,
0.6251518, -0.2230154, 1.149119, 0.4509804, 0, 1, 1,
0.6331593, -0.6488882, 0.5592197, 0.4588235, 0, 1, 1,
0.6346079, 0.7892194, 1.046616, 0.4627451, 0, 1, 1,
0.642297, 1.386538, 1.291063, 0.4705882, 0, 1, 1,
0.6451979, 0.7968511, 1.181501, 0.4745098, 0, 1, 1,
0.6507805, 0.2201438, 0.4827628, 0.4823529, 0, 1, 1,
0.6590313, -1.478876, 2.141853, 0.4862745, 0, 1, 1,
0.6629041, -1.048626, 2.999135, 0.4941176, 0, 1, 1,
0.6648417, 0.9753554, 0.5493041, 0.5019608, 0, 1, 1,
0.6658669, 1.409509, 0.552471, 0.5058824, 0, 1, 1,
0.6664522, -0.1110124, -0.03905531, 0.5137255, 0, 1, 1,
0.6681882, 0.6965594, 0.5947579, 0.5176471, 0, 1, 1,
0.6746756, -1.026033, 0.027668, 0.5254902, 0, 1, 1,
0.6795864, -0.3423437, 0.8854575, 0.5294118, 0, 1, 1,
0.6867585, 0.66076, 1.087133, 0.5372549, 0, 1, 1,
0.6871125, -2.276297, 2.911298, 0.5411765, 0, 1, 1,
0.6873059, 0.705933, 0.2176093, 0.5490196, 0, 1, 1,
0.6957312, 0.1282985, 1.365219, 0.5529412, 0, 1, 1,
0.6984047, -1.518583, 3.551483, 0.5607843, 0, 1, 1,
0.6987635, -0.1347167, 2.271497, 0.5647059, 0, 1, 1,
0.7065369, 1.173106, 2.231977, 0.572549, 0, 1, 1,
0.7075105, 0.4452412, -0.1800214, 0.5764706, 0, 1, 1,
0.7151735, 0.471229, 2.159784, 0.5843138, 0, 1, 1,
0.7167596, -1.353895, 1.601581, 0.5882353, 0, 1, 1,
0.7193385, -0.01998591, 2.739371, 0.5960785, 0, 1, 1,
0.7198122, -0.6491548, 2.56465, 0.6039216, 0, 1, 1,
0.7222511, -1.536893, -0.3739708, 0.6078432, 0, 1, 1,
0.7255402, 0.3568754, 0.9191362, 0.6156863, 0, 1, 1,
0.7276629, 0.5579849, 0.7815307, 0.6196079, 0, 1, 1,
0.728422, 0.1647591, 1.729737, 0.627451, 0, 1, 1,
0.7376112, -0.5145907, 2.085527, 0.6313726, 0, 1, 1,
0.7391829, 0.1444858, -0.4543578, 0.6392157, 0, 1, 1,
0.7422676, -0.431905, 3.131469, 0.6431373, 0, 1, 1,
0.7424282, -1.448847, 1.967466, 0.6509804, 0, 1, 1,
0.7465845, 0.3457988, 3.836912, 0.654902, 0, 1, 1,
0.7474824, 0.8467646, 1.5386, 0.6627451, 0, 1, 1,
0.7512614, 0.8595685, -0.1972112, 0.6666667, 0, 1, 1,
0.7627776, -0.3883966, 3.820472, 0.6745098, 0, 1, 1,
0.7765273, 0.2266921, 0.859116, 0.6784314, 0, 1, 1,
0.7793944, -0.2563849, 4.223398, 0.6862745, 0, 1, 1,
0.7798232, -0.9419805, 1.725426, 0.6901961, 0, 1, 1,
0.7822165, 1.441993, 0.382021, 0.6980392, 0, 1, 1,
0.7870194, -1.560571, 4.344206, 0.7058824, 0, 1, 1,
0.7929462, 0.6901358, 0.01441378, 0.7098039, 0, 1, 1,
0.7932302, -1.262302, 2.093136, 0.7176471, 0, 1, 1,
0.7962907, -1.749601, 2.928606, 0.7215686, 0, 1, 1,
0.7974049, -1.396512, 3.331798, 0.7294118, 0, 1, 1,
0.7997469, 0.5801821, -0.5316017, 0.7333333, 0, 1, 1,
0.8011552, -1.221987, 1.538298, 0.7411765, 0, 1, 1,
0.8020663, -0.0365248, 1.144919, 0.7450981, 0, 1, 1,
0.8097999, -1.167261, 2.040372, 0.7529412, 0, 1, 1,
0.8122547, -0.14935, 0.9634255, 0.7568628, 0, 1, 1,
0.8180015, 0.01231038, 0.6392211, 0.7647059, 0, 1, 1,
0.823393, -0.2793292, 2.272732, 0.7686275, 0, 1, 1,
0.8277397, -1.562389, 2.974542, 0.7764706, 0, 1, 1,
0.8288973, -1.864888, 2.953089, 0.7803922, 0, 1, 1,
0.8321655, -0.6868259, 2.644108, 0.7882353, 0, 1, 1,
0.8332388, 0.7091911, 0.5735804, 0.7921569, 0, 1, 1,
0.8451173, 1.022149, 0.5203098, 0.8, 0, 1, 1,
0.8478602, -1.104273, 2.206969, 0.8078431, 0, 1, 1,
0.8648495, 1.529602, 3.230648, 0.8117647, 0, 1, 1,
0.8679935, -0.1340657, 1.553869, 0.8196079, 0, 1, 1,
0.8765689, 1.756044, 1.718853, 0.8235294, 0, 1, 1,
0.8777892, 0.7302982, 0.4675998, 0.8313726, 0, 1, 1,
0.8796698, 0.3036971, 1.192617, 0.8352941, 0, 1, 1,
0.8812751, 0.7308307, 1.715644, 0.8431373, 0, 1, 1,
0.8877207, -1.374145, 1.9195, 0.8470588, 0, 1, 1,
0.8962699, -1.378782, 0.8799429, 0.854902, 0, 1, 1,
0.8972135, 0.1083432, 1.08059, 0.8588235, 0, 1, 1,
0.8997188, 0.725437, -2.02942, 0.8666667, 0, 1, 1,
0.902896, -0.2809257, 3.559399, 0.8705882, 0, 1, 1,
0.904282, 2.6511, 0.3728213, 0.8784314, 0, 1, 1,
0.9076225, -1.893003, 1.627645, 0.8823529, 0, 1, 1,
0.9077916, -0.5284887, 2.110944, 0.8901961, 0, 1, 1,
0.9085272, 0.1866889, 2.063195, 0.8941177, 0, 1, 1,
0.9215838, -1.22583, 2.282734, 0.9019608, 0, 1, 1,
0.9224029, 1.34162, 0.03614764, 0.9098039, 0, 1, 1,
0.937016, -0.5116808, 2.479416, 0.9137255, 0, 1, 1,
0.9389022, -0.9543228, 2.102192, 0.9215686, 0, 1, 1,
0.9428395, 1.063188, 1.878142, 0.9254902, 0, 1, 1,
0.9432224, -1.332581, 1.968283, 0.9333333, 0, 1, 1,
0.9439328, -0.4572675, 0.8268497, 0.9372549, 0, 1, 1,
0.9444492, -0.3704517, 0.9430527, 0.945098, 0, 1, 1,
0.9470413, 1.372834, 0.7573426, 0.9490196, 0, 1, 1,
0.9507965, 1.720921, 0.2624754, 0.9568627, 0, 1, 1,
0.9560664, -0.4226984, 2.081943, 0.9607843, 0, 1, 1,
0.9570367, -0.7419313, 2.253422, 0.9686275, 0, 1, 1,
0.9598988, -1.63856, 2.946819, 0.972549, 0, 1, 1,
0.9609013, -0.7045073, 2.271322, 0.9803922, 0, 1, 1,
0.9627001, 1.538107, 0.489952, 0.9843137, 0, 1, 1,
0.9655544, -1.00512, 4.133834, 0.9921569, 0, 1, 1,
0.9659865, -0.7775406, 2.406174, 0.9960784, 0, 1, 1,
0.9748639, 1.168822, 1.891086, 1, 0, 0.9960784, 1,
0.9765763, 0.4590092, -0.5468286, 1, 0, 0.9882353, 1,
0.9802665, -2.136307, 3.929532, 1, 0, 0.9843137, 1,
0.9978371, -2.076866, 1.893432, 1, 0, 0.9764706, 1,
1.006635, -0.05857731, 2.128674, 1, 0, 0.972549, 1,
1.00776, -0.5747066, 3.060423, 1, 0, 0.9647059, 1,
1.008122, 0.7977057, 2.219441, 1, 0, 0.9607843, 1,
1.008821, -0.2940395, 2.873022, 1, 0, 0.9529412, 1,
1.030054, 0.4488885, 0.7853975, 1, 0, 0.9490196, 1,
1.031461, 1.39985, -0.5272394, 1, 0, 0.9411765, 1,
1.039059, -0.6677606, -0.4121624, 1, 0, 0.9372549, 1,
1.040508, 0.1071548, 3.305002, 1, 0, 0.9294118, 1,
1.042844, -1.317853, 1.914392, 1, 0, 0.9254902, 1,
1.054404, -1.679379, 2.150466, 1, 0, 0.9176471, 1,
1.057926, 0.9055301, 1.012425, 1, 0, 0.9137255, 1,
1.061199, -1.044899, 0.7867, 1, 0, 0.9058824, 1,
1.062478, 1.640065, 0.8506452, 1, 0, 0.9019608, 1,
1.063407, -0.2515902, 2.510483, 1, 0, 0.8941177, 1,
1.064038, -1.088401, 2.295218, 1, 0, 0.8862745, 1,
1.066529, 1.295276, -1.111565, 1, 0, 0.8823529, 1,
1.069746, -0.3333932, 2.495551, 1, 0, 0.8745098, 1,
1.077638, 1.934504, 0.2008259, 1, 0, 0.8705882, 1,
1.077844, -0.7102622, 1.796968, 1, 0, 0.8627451, 1,
1.083405, -1.555748, 2.21934, 1, 0, 0.8588235, 1,
1.083927, -0.5634052, 0.2817194, 1, 0, 0.8509804, 1,
1.087502, -0.6314586, 2.468853, 1, 0, 0.8470588, 1,
1.091436, 0.1711526, 0.9711781, 1, 0, 0.8392157, 1,
1.091574, 0.4708741, 0.955686, 1, 0, 0.8352941, 1,
1.093284, -0.8428294, 1.586182, 1, 0, 0.827451, 1,
1.096284, 0.9599966, 2.507898, 1, 0, 0.8235294, 1,
1.103431, -1.002408, 1.304341, 1, 0, 0.8156863, 1,
1.106522, 0.1056055, 1.472472, 1, 0, 0.8117647, 1,
1.111899, -1.09245, 1.855356, 1, 0, 0.8039216, 1,
1.124122, 0.7919526, 1.410171, 1, 0, 0.7960784, 1,
1.126022, 0.3123691, 2.949867, 1, 0, 0.7921569, 1,
1.130345, -0.06429141, 2.450192, 1, 0, 0.7843137, 1,
1.1566, -1.556349, 5.458761, 1, 0, 0.7803922, 1,
1.158254, -1.097663, 0.7406146, 1, 0, 0.772549, 1,
1.160067, 1.278251, 1.16441, 1, 0, 0.7686275, 1,
1.16497, 0.6258162, 2.178892, 1, 0, 0.7607843, 1,
1.168192, 1.241474, 0.7393824, 1, 0, 0.7568628, 1,
1.169711, 0.4511282, 2.861934, 1, 0, 0.7490196, 1,
1.180726, -1.698582, 2.975001, 1, 0, 0.7450981, 1,
1.183095, 0.4470714, 2.21508, 1, 0, 0.7372549, 1,
1.191409, 0.272429, -0.1053407, 1, 0, 0.7333333, 1,
1.195571, -0.8822979, 2.657382, 1, 0, 0.7254902, 1,
1.220993, 1.156558, 0.5453706, 1, 0, 0.7215686, 1,
1.221656, -0.3284043, 0.8771657, 1, 0, 0.7137255, 1,
1.222409, -2.946316, 3.294705, 1, 0, 0.7098039, 1,
1.226726, -0.4101994, 1.830986, 1, 0, 0.7019608, 1,
1.231804, 1.173446, 1.766924, 1, 0, 0.6941177, 1,
1.237396, -0.2980249, 1.112235, 1, 0, 0.6901961, 1,
1.238016, 0.6695088, -0.9673491, 1, 0, 0.682353, 1,
1.247859, -1.029157, 3.1534, 1, 0, 0.6784314, 1,
1.249779, -0.5426007, 2.654315, 1, 0, 0.6705883, 1,
1.250511, 0.3352827, 0.2136748, 1, 0, 0.6666667, 1,
1.253107, 1.635831, 1.015685, 1, 0, 0.6588235, 1,
1.254836, -0.2516405, 0.05684109, 1, 0, 0.654902, 1,
1.25946, -2.379517, 0.9252124, 1, 0, 0.6470588, 1,
1.264723, 0.006734473, 2.340735, 1, 0, 0.6431373, 1,
1.266272, -1.344139, 4.056134, 1, 0, 0.6352941, 1,
1.276486, 1.61053, 0.9595362, 1, 0, 0.6313726, 1,
1.28218, -0.2185689, 1.294563, 1, 0, 0.6235294, 1,
1.283814, -0.4294896, 1.752903, 1, 0, 0.6196079, 1,
1.284363, -1.49964, 2.7993, 1, 0, 0.6117647, 1,
1.28482, 0.4655701, 0.48305, 1, 0, 0.6078432, 1,
1.288844, 0.1835485, -0.5155534, 1, 0, 0.6, 1,
1.289151, -0.8018046, 1.618456, 1, 0, 0.5921569, 1,
1.29396, 0.1034582, 2.220701, 1, 0, 0.5882353, 1,
1.300106, -0.1519369, -0.08838056, 1, 0, 0.5803922, 1,
1.307605, 0.21754, 2.139579, 1, 0, 0.5764706, 1,
1.315258, 0.3499224, -1.490396, 1, 0, 0.5686275, 1,
1.315562, 0.6601003, 0.460706, 1, 0, 0.5647059, 1,
1.31841, 2.115088, -0.8427684, 1, 0, 0.5568628, 1,
1.326931, -1.141836, 4.590194, 1, 0, 0.5529412, 1,
1.330767, -0.822881, 2.940258, 1, 0, 0.5450981, 1,
1.333258, -1.754579, 2.106909, 1, 0, 0.5411765, 1,
1.336947, -1.445833, 2.445693, 1, 0, 0.5333334, 1,
1.340796, -0.1776746, 0.1053095, 1, 0, 0.5294118, 1,
1.344516, -1.040228, 1.022723, 1, 0, 0.5215687, 1,
1.348334, 0.4820606, 2.575885, 1, 0, 0.5176471, 1,
1.354152, 1.482977, 2.980637, 1, 0, 0.509804, 1,
1.362487, -1.736682, 2.506728, 1, 0, 0.5058824, 1,
1.380177, -0.3675918, 1.792683, 1, 0, 0.4980392, 1,
1.381552, 1.474485, 1.741978, 1, 0, 0.4901961, 1,
1.392745, -0.4018895, 1.039272, 1, 0, 0.4862745, 1,
1.395782, 0.8385072, 2.171629, 1, 0, 0.4784314, 1,
1.401612, -0.1654001, 2.515645, 1, 0, 0.4745098, 1,
1.407262, -2.701429, 3.000302, 1, 0, 0.4666667, 1,
1.409029, 2.055293, 0.9602374, 1, 0, 0.4627451, 1,
1.416202, -1.065318, 2.381395, 1, 0, 0.454902, 1,
1.427254, -0.2076574, 1.56499, 1, 0, 0.4509804, 1,
1.435041, 0.2631306, 1.730822, 1, 0, 0.4431373, 1,
1.440018, -0.9924939, 1.808555, 1, 0, 0.4392157, 1,
1.442641, 1.332399, 2.041814, 1, 0, 0.4313726, 1,
1.44674, 2.768631, 0.6394132, 1, 0, 0.427451, 1,
1.453021, -0.4131172, 1.872977, 1, 0, 0.4196078, 1,
1.455246, -0.3878378, 2.585378, 1, 0, 0.4156863, 1,
1.457442, -2.150691, 1.943165, 1, 0, 0.4078431, 1,
1.45896, -0.01754207, 0.07863985, 1, 0, 0.4039216, 1,
1.459323, -0.4741604, -0.7219168, 1, 0, 0.3960784, 1,
1.463741, 0.3255134, 1.44459, 1, 0, 0.3882353, 1,
1.466623, 0.2151652, 1.987057, 1, 0, 0.3843137, 1,
1.468714, 1.210979, 0.4545294, 1, 0, 0.3764706, 1,
1.476894, -1.381556, 1.292393, 1, 0, 0.372549, 1,
1.484783, -0.4920264, 3.674527, 1, 0, 0.3647059, 1,
1.511177, 0.5552547, 1.082582, 1, 0, 0.3607843, 1,
1.513983, -1.534652, -0.04207402, 1, 0, 0.3529412, 1,
1.523855, -0.5261713, 3.170118, 1, 0, 0.3490196, 1,
1.526753, -0.4099613, 3.106287, 1, 0, 0.3411765, 1,
1.528572, -0.8369418, 1.73763, 1, 0, 0.3372549, 1,
1.529719, -0.5233575, 1.816139, 1, 0, 0.3294118, 1,
1.535506, -0.2822936, 2.876258, 1, 0, 0.3254902, 1,
1.545946, -0.2634124, 2.848832, 1, 0, 0.3176471, 1,
1.554332, 0.2815324, -0.9964163, 1, 0, 0.3137255, 1,
1.600791, -0.6071485, 2.177931, 1, 0, 0.3058824, 1,
1.60896, 0.05669323, 1.995718, 1, 0, 0.2980392, 1,
1.61405, 0.9749064, 1.631653, 1, 0, 0.2941177, 1,
1.625834, 1.32021, 1.940741, 1, 0, 0.2862745, 1,
1.644692, 0.7418686, 2.50623, 1, 0, 0.282353, 1,
1.655379, 0.9749627, 1.579686, 1, 0, 0.2745098, 1,
1.658124, -0.08342963, 0.6732454, 1, 0, 0.2705882, 1,
1.666395, -1.755417, 2.097443, 1, 0, 0.2627451, 1,
1.698879, -1.018958, 1.897375, 1, 0, 0.2588235, 1,
1.716822, -0.5792975, -0.7415581, 1, 0, 0.2509804, 1,
1.736073, -0.1753816, 1.997962, 1, 0, 0.2470588, 1,
1.746412, 2.091561, 1.876648, 1, 0, 0.2392157, 1,
1.747856, -1.093597, 2.218488, 1, 0, 0.2352941, 1,
1.751224, -0.5480309, 1.203475, 1, 0, 0.227451, 1,
1.764144, -1.280462, 1.358795, 1, 0, 0.2235294, 1,
1.776259, 0.1045891, 3.039707, 1, 0, 0.2156863, 1,
1.78554, 0.1425872, 0.814368, 1, 0, 0.2117647, 1,
1.785761, 0.1263882, 1.610216, 1, 0, 0.2039216, 1,
1.796865, 0.7645738, 0.7425404, 1, 0, 0.1960784, 1,
1.801382, -0.5873517, 1.989216, 1, 0, 0.1921569, 1,
1.818311, -0.04246809, 2.312655, 1, 0, 0.1843137, 1,
1.819975, -0.373633, 1.031032, 1, 0, 0.1803922, 1,
1.833636, -0.6513517, 0.5715497, 1, 0, 0.172549, 1,
1.84434, -1.981415, 2.219273, 1, 0, 0.1686275, 1,
1.848574, 0.2827114, 2.111504, 1, 0, 0.1607843, 1,
1.871017, 0.4654286, 0.5031983, 1, 0, 0.1568628, 1,
1.881845, 0.3033577, -1.310707, 1, 0, 0.1490196, 1,
1.892842, -2.542309, 2.63939, 1, 0, 0.145098, 1,
1.902308, 0.5651114, 2.220847, 1, 0, 0.1372549, 1,
1.904312, -0.2548408, 1.507186, 1, 0, 0.1333333, 1,
1.911564, 1.102134, 0.450783, 1, 0, 0.1254902, 1,
1.941898, -0.9256636, 0.4243684, 1, 0, 0.1215686, 1,
1.976991, 0.8622084, 1.463567, 1, 0, 0.1137255, 1,
1.98208, 1.336221, 0.9520191, 1, 0, 0.1098039, 1,
1.991491, -0.4680119, 4.012177, 1, 0, 0.1019608, 1,
1.997641, 0.8842176, 0.7823952, 1, 0, 0.09411765, 1,
2.025444, -0.685649, 2.354528, 1, 0, 0.09019608, 1,
2.041158, 1.175133, 1.489182, 1, 0, 0.08235294, 1,
2.052919, 1.061917, 2.156689, 1, 0, 0.07843138, 1,
2.095633, 0.7930048, 1.751235, 1, 0, 0.07058824, 1,
2.134182, -0.4175327, 2.177099, 1, 0, 0.06666667, 1,
2.178977, 0.6222851, 1.146822, 1, 0, 0.05882353, 1,
2.209685, 0.9245057, 0.6410203, 1, 0, 0.05490196, 1,
2.253389, -2.274229, 1.62101, 1, 0, 0.04705882, 1,
2.261244, 0.5753658, 1.329532, 1, 0, 0.04313726, 1,
2.318347, -1.150096, 1.805979, 1, 0, 0.03529412, 1,
2.477814, 0.2871926, -0.2685162, 1, 0, 0.03137255, 1,
2.524137, 0.9771165, 1.864953, 1, 0, 0.02352941, 1,
2.775481, 0.7291555, 2.540797, 1, 0, 0.01960784, 1,
3.419728, 0.9610436, 1.697304, 1, 0, 0.01176471, 1,
3.931205, 0.349549, 0.8582449, 1, 0, 0.007843138, 1
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
0.3532281, -4.024444, -7.794629, 0, -0.5, 0.5, 0.5,
0.3532281, -4.024444, -7.794629, 1, -0.5, 0.5, 0.5,
0.3532281, -4.024444, -7.794629, 1, 1.5, 0.5, 0.5,
0.3532281, -4.024444, -7.794629, 0, 1.5, 0.5, 0.5
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
-4.437684, 0.003815293, -7.794629, 0, -0.5, 0.5, 0.5,
-4.437684, 0.003815293, -7.794629, 1, -0.5, 0.5, 0.5,
-4.437684, 0.003815293, -7.794629, 1, 1.5, 0.5, 0.5,
-4.437684, 0.003815293, -7.794629, 0, 1.5, 0.5, 0.5
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
-4.437684, -4.024444, -0.2075024, 0, -0.5, 0.5, 0.5,
-4.437684, -4.024444, -0.2075024, 1, -0.5, 0.5, 0.5,
-4.437684, -4.024444, -0.2075024, 1, 1.5, 0.5, 0.5,
-4.437684, -4.024444, -0.2075024, 0, 1.5, 0.5, 0.5
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
-2, -3.094845, -6.043753,
2, -3.094845, -6.043753,
-2, -3.094845, -6.043753,
-2, -3.249779, -6.335566,
0, -3.094845, -6.043753,
0, -3.249779, -6.335566,
2, -3.094845, -6.043753,
2, -3.249779, -6.335566
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
"0",
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
-2, -3.559644, -6.919191, 0, -0.5, 0.5, 0.5,
-2, -3.559644, -6.919191, 1, -0.5, 0.5, 0.5,
-2, -3.559644, -6.919191, 1, 1.5, 0.5, 0.5,
-2, -3.559644, -6.919191, 0, 1.5, 0.5, 0.5,
0, -3.559644, -6.919191, 0, -0.5, 0.5, 0.5,
0, -3.559644, -6.919191, 1, -0.5, 0.5, 0.5,
0, -3.559644, -6.919191, 1, 1.5, 0.5, 0.5,
0, -3.559644, -6.919191, 0, 1.5, 0.5, 0.5,
2, -3.559644, -6.919191, 0, -0.5, 0.5, 0.5,
2, -3.559644, -6.919191, 1, -0.5, 0.5, 0.5,
2, -3.559644, -6.919191, 1, 1.5, 0.5, 0.5,
2, -3.559644, -6.919191, 0, 1.5, 0.5, 0.5
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
-3.332088, -3, -6.043753,
-3.332088, 3, -6.043753,
-3.332088, -3, -6.043753,
-3.516354, -3, -6.335566,
-3.332088, -2, -6.043753,
-3.516354, -2, -6.335566,
-3.332088, -1, -6.043753,
-3.516354, -1, -6.335566,
-3.332088, 0, -6.043753,
-3.516354, 0, -6.335566,
-3.332088, 1, -6.043753,
-3.516354, 1, -6.335566,
-3.332088, 2, -6.043753,
-3.516354, 2, -6.335566,
-3.332088, 3, -6.043753,
-3.516354, 3, -6.335566
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
-3.884886, -3, -6.919191, 0, -0.5, 0.5, 0.5,
-3.884886, -3, -6.919191, 1, -0.5, 0.5, 0.5,
-3.884886, -3, -6.919191, 1, 1.5, 0.5, 0.5,
-3.884886, -3, -6.919191, 0, 1.5, 0.5, 0.5,
-3.884886, -2, -6.919191, 0, -0.5, 0.5, 0.5,
-3.884886, -2, -6.919191, 1, -0.5, 0.5, 0.5,
-3.884886, -2, -6.919191, 1, 1.5, 0.5, 0.5,
-3.884886, -2, -6.919191, 0, 1.5, 0.5, 0.5,
-3.884886, -1, -6.919191, 0, -0.5, 0.5, 0.5,
-3.884886, -1, -6.919191, 1, -0.5, 0.5, 0.5,
-3.884886, -1, -6.919191, 1, 1.5, 0.5, 0.5,
-3.884886, -1, -6.919191, 0, 1.5, 0.5, 0.5,
-3.884886, 0, -6.919191, 0, -0.5, 0.5, 0.5,
-3.884886, 0, -6.919191, 1, -0.5, 0.5, 0.5,
-3.884886, 0, -6.919191, 1, 1.5, 0.5, 0.5,
-3.884886, 0, -6.919191, 0, 1.5, 0.5, 0.5,
-3.884886, 1, -6.919191, 0, -0.5, 0.5, 0.5,
-3.884886, 1, -6.919191, 1, -0.5, 0.5, 0.5,
-3.884886, 1, -6.919191, 1, 1.5, 0.5, 0.5,
-3.884886, 1, -6.919191, 0, 1.5, 0.5, 0.5,
-3.884886, 2, -6.919191, 0, -0.5, 0.5, 0.5,
-3.884886, 2, -6.919191, 1, -0.5, 0.5, 0.5,
-3.884886, 2, -6.919191, 1, 1.5, 0.5, 0.5,
-3.884886, 2, -6.919191, 0, 1.5, 0.5, 0.5,
-3.884886, 3, -6.919191, 0, -0.5, 0.5, 0.5,
-3.884886, 3, -6.919191, 1, -0.5, 0.5, 0.5,
-3.884886, 3, -6.919191, 1, 1.5, 0.5, 0.5,
-3.884886, 3, -6.919191, 0, 1.5, 0.5, 0.5
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
-3.332088, -3.094845, -4,
-3.332088, -3.094845, 4,
-3.332088, -3.094845, -4,
-3.516354, -3.249779, -4,
-3.332088, -3.094845, -2,
-3.516354, -3.249779, -2,
-3.332088, -3.094845, 0,
-3.516354, -3.249779, 0,
-3.332088, -3.094845, 2,
-3.516354, -3.249779, 2,
-3.332088, -3.094845, 4,
-3.516354, -3.249779, 4
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
-3.884886, -3.559644, -4, 0, -0.5, 0.5, 0.5,
-3.884886, -3.559644, -4, 1, -0.5, 0.5, 0.5,
-3.884886, -3.559644, -4, 1, 1.5, 0.5, 0.5,
-3.884886, -3.559644, -4, 0, 1.5, 0.5, 0.5,
-3.884886, -3.559644, -2, 0, -0.5, 0.5, 0.5,
-3.884886, -3.559644, -2, 1, -0.5, 0.5, 0.5,
-3.884886, -3.559644, -2, 1, 1.5, 0.5, 0.5,
-3.884886, -3.559644, -2, 0, 1.5, 0.5, 0.5,
-3.884886, -3.559644, 0, 0, -0.5, 0.5, 0.5,
-3.884886, -3.559644, 0, 1, -0.5, 0.5, 0.5,
-3.884886, -3.559644, 0, 1, 1.5, 0.5, 0.5,
-3.884886, -3.559644, 0, 0, 1.5, 0.5, 0.5,
-3.884886, -3.559644, 2, 0, -0.5, 0.5, 0.5,
-3.884886, -3.559644, 2, 1, -0.5, 0.5, 0.5,
-3.884886, -3.559644, 2, 1, 1.5, 0.5, 0.5,
-3.884886, -3.559644, 2, 0, 1.5, 0.5, 0.5,
-3.884886, -3.559644, 4, 0, -0.5, 0.5, 0.5,
-3.884886, -3.559644, 4, 1, -0.5, 0.5, 0.5,
-3.884886, -3.559644, 4, 1, 1.5, 0.5, 0.5,
-3.884886, -3.559644, 4, 0, 1.5, 0.5, 0.5
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
-3.332088, -3.094845, -6.043753,
-3.332088, 3.102476, -6.043753,
-3.332088, -3.094845, 5.628748,
-3.332088, 3.102476, 5.628748,
-3.332088, -3.094845, -6.043753,
-3.332088, -3.094845, 5.628748,
-3.332088, 3.102476, -6.043753,
-3.332088, 3.102476, 5.628748,
-3.332088, -3.094845, -6.043753,
4.038545, -3.094845, -6.043753,
-3.332088, -3.094845, 5.628748,
4.038545, -3.094845, 5.628748,
-3.332088, 3.102476, -6.043753,
4.038545, 3.102476, -6.043753,
-3.332088, 3.102476, 5.628748,
4.038545, 3.102476, 5.628748,
4.038545, -3.094845, -6.043753,
4.038545, 3.102476, -6.043753,
4.038545, -3.094845, 5.628748,
4.038545, 3.102476, 5.628748,
4.038545, -3.094845, -6.043753,
4.038545, -3.094845, 5.628748,
4.038545, 3.102476, -6.043753,
4.038545, 3.102476, 5.628748
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
var radius = 8.080245;
var distance = 35.94992;
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
mvMatrix.translate( -0.3532281, -0.003815293, 0.2075024 );
mvMatrix.scale( 1.185315, 1.409725, 0.7484702 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.94992);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
pyrophosphate<-read.table("pyrophosphate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrophosphate$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrophosphate' not found
```

```r
y<-pyrophosphate$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrophosphate' not found
```

```r
z<-pyrophosphate$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrophosphate' not found
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
-3.224749, 0.1378557, -2.302329, 0, 0, 1, 1, 1,
-2.869438, -0.3984696, -0.347764, 1, 0, 0, 1, 1,
-2.829561, -0.8964677, -1.264164, 1, 0, 0, 1, 1,
-2.76451, -0.8137617, -0.6525092, 1, 0, 0, 1, 1,
-2.705943, 0.09156949, -1.850718, 1, 0, 0, 1, 1,
-2.700736, -0.7177156, -2.216505, 1, 0, 0, 1, 1,
-2.594292, 0.3695582, -1.606618, 0, 0, 0, 1, 1,
-2.535078, -0.03847073, -0.7850879, 0, 0, 0, 1, 1,
-2.513844, 1.006735, -3.301713, 0, 0, 0, 1, 1,
-2.422305, -0.5424517, -3.465563, 0, 0, 0, 1, 1,
-2.317913, 0.6038017, -1.637895, 0, 0, 0, 1, 1,
-2.295363, 1.609244, -1.458593, 0, 0, 0, 1, 1,
-2.256455, -1.540775, -1.064701, 0, 0, 0, 1, 1,
-2.250708, 1.489833, -1.686856, 1, 1, 1, 1, 1,
-2.201611, 0.05103821, -0.8934884, 1, 1, 1, 1, 1,
-2.196301, -0.4725754, -2.986789, 1, 1, 1, 1, 1,
-2.18977, 1.18592, 0.4218569, 1, 1, 1, 1, 1,
-2.178523, 2.074652, -2.807236, 1, 1, 1, 1, 1,
-2.172976, -0.4526036, -2.802559, 1, 1, 1, 1, 1,
-2.152126, 0.5504533, -0.2806091, 1, 1, 1, 1, 1,
-2.114905, -0.6124092, -0.2283207, 1, 1, 1, 1, 1,
-2.113394, -0.5955088, -1.030241, 1, 1, 1, 1, 1,
-2.097192, 2.139224, 0.1031903, 1, 1, 1, 1, 1,
-2.084712, -0.1419769, -1.332345, 1, 1, 1, 1, 1,
-2.063355, -0.9051931, 0.2830725, 1, 1, 1, 1, 1,
-2.007421, 0.7100973, -0.8851746, 1, 1, 1, 1, 1,
-2.0066, 0.3961637, -0.3632358, 1, 1, 1, 1, 1,
-2.006021, -1.057898, -1.816347, 1, 1, 1, 1, 1,
-2.002773, -0.06776623, -2.417181, 0, 0, 1, 1, 1,
-1.964692, 0.5546364, -1.867048, 1, 0, 0, 1, 1,
-1.963888, 1.271687, -0.4855395, 1, 0, 0, 1, 1,
-1.915942, -0.8543282, -0.9151485, 1, 0, 0, 1, 1,
-1.908301, 0.66568, -1.059474, 1, 0, 0, 1, 1,
-1.906409, -0.9026728, -3.07853, 1, 0, 0, 1, 1,
-1.867978, -0.4389839, -2.172899, 0, 0, 0, 1, 1,
-1.864103, -0.5586044, -2.700358, 0, 0, 0, 1, 1,
-1.859009, 0.3973701, -2.262626, 0, 0, 0, 1, 1,
-1.858664, 0.835348, -1.986584, 0, 0, 0, 1, 1,
-1.849688, -0.8873253, 0.5354372, 0, 0, 0, 1, 1,
-1.837954, -0.5666547, -3.610698, 0, 0, 0, 1, 1,
-1.804533, -2.2682, -2.66953, 0, 0, 0, 1, 1,
-1.801461, -0.2457283, -2.385489, 1, 1, 1, 1, 1,
-1.794048, 1.25962, -1.627602, 1, 1, 1, 1, 1,
-1.725534, -1.246971, -2.311426, 1, 1, 1, 1, 1,
-1.714035, -0.4141646, -2.110293, 1, 1, 1, 1, 1,
-1.696896, -0.004489614, -1.84472, 1, 1, 1, 1, 1,
-1.692261, -0.6929865, -2.365425, 1, 1, 1, 1, 1,
-1.674783, 0.01926736, -2.792386, 1, 1, 1, 1, 1,
-1.653938, 0.1659686, -1.859194, 1, 1, 1, 1, 1,
-1.64607, 0.9050196, -2.419203, 1, 1, 1, 1, 1,
-1.642171, 0.02969434, -1.840802, 1, 1, 1, 1, 1,
-1.636338, -0.3836255, -1.289729, 1, 1, 1, 1, 1,
-1.625071, -0.4095429, -0.2558629, 1, 1, 1, 1, 1,
-1.614897, 0.009521022, -1.074824, 1, 1, 1, 1, 1,
-1.610809, 0.173075, -1.403598, 1, 1, 1, 1, 1,
-1.58121, -1.111337, -2.959386, 1, 1, 1, 1, 1,
-1.579956, 0.2909107, -2.092501, 0, 0, 1, 1, 1,
-1.552, -0.7694297, -1.109742, 1, 0, 0, 1, 1,
-1.546012, -0.2214574, -0.9310274, 1, 0, 0, 1, 1,
-1.543944, -0.1450139, -1.533972, 1, 0, 0, 1, 1,
-1.528915, 0.7855548, -0.4458907, 1, 0, 0, 1, 1,
-1.524913, -1.202063, -3.128274, 1, 0, 0, 1, 1,
-1.51628, -0.6987864, -3.918755, 0, 0, 0, 1, 1,
-1.514405, 1.187559, -0.8693033, 0, 0, 0, 1, 1,
-1.511236, -0.6118029, -1.38538, 0, 0, 0, 1, 1,
-1.510391, -0.9552785, -1.970864, 0, 0, 0, 1, 1,
-1.495588, 0.5810262, 0.09067399, 0, 0, 0, 1, 1,
-1.48898, -0.5050207, -0.4463459, 0, 0, 0, 1, 1,
-1.488354, -0.4370821, -1.81452, 0, 0, 0, 1, 1,
-1.466216, -0.3209323, -3.307014, 1, 1, 1, 1, 1,
-1.4636, 0.03505499, -0.6733367, 1, 1, 1, 1, 1,
-1.446085, -0.355523, -0.8714355, 1, 1, 1, 1, 1,
-1.440123, 0.1334623, -1.735866, 1, 1, 1, 1, 1,
-1.440073, -0.7915125, -1.380009, 1, 1, 1, 1, 1,
-1.427441, 0.7135225, -1.497848, 1, 1, 1, 1, 1,
-1.425318, -0.7351818, -1.748467, 1, 1, 1, 1, 1,
-1.412659, -0.5201786, -1.821213, 1, 1, 1, 1, 1,
-1.406231, -0.607417, -3.409442, 1, 1, 1, 1, 1,
-1.396844, 0.1900478, -0.6148234, 1, 1, 1, 1, 1,
-1.389432, 0.4889345, 0.0646233, 1, 1, 1, 1, 1,
-1.388271, 0.3683749, -1.212425, 1, 1, 1, 1, 1,
-1.384416, 1.18118, -0.5972789, 1, 1, 1, 1, 1,
-1.382212, 0.2278001, -3.025088, 1, 1, 1, 1, 1,
-1.378912, -1.043692, -3.364427, 1, 1, 1, 1, 1,
-1.369867, 1.188465, -1.33122, 0, 0, 1, 1, 1,
-1.369269, -1.364506, -2.716511, 1, 0, 0, 1, 1,
-1.3338, 1.511034, -1.29959, 1, 0, 0, 1, 1,
-1.33044, -0.9078313, -2.173449, 1, 0, 0, 1, 1,
-1.329007, 0.7200698, -1.958201, 1, 0, 0, 1, 1,
-1.324528, 0.4451398, -1.924044, 1, 0, 0, 1, 1,
-1.313201, -0.5941037, -2.115069, 0, 0, 0, 1, 1,
-1.313027, -0.556031, -1.918268, 0, 0, 0, 1, 1,
-1.304302, 0.9786348, -0.4783311, 0, 0, 0, 1, 1,
-1.303177, 0.594286, -1.426411, 0, 0, 0, 1, 1,
-1.282678, 0.210458, -0.1988196, 0, 0, 0, 1, 1,
-1.269598, -0.1739658, -1.817681, 0, 0, 0, 1, 1,
-1.263515, 0.7083407, -0.09540688, 0, 0, 0, 1, 1,
-1.253054, 0.8548019, -1.654307, 1, 1, 1, 1, 1,
-1.250842, -0.4240128, -2.835611, 1, 1, 1, 1, 1,
-1.249135, 2.193092, 0.01079618, 1, 1, 1, 1, 1,
-1.246649, -1.740592, -2.883976, 1, 1, 1, 1, 1,
-1.243916, -1.621491, -2.30016, 1, 1, 1, 1, 1,
-1.239022, 0.898839, -1.138843, 1, 1, 1, 1, 1,
-1.234186, -0.1705145, -1.538232, 1, 1, 1, 1, 1,
-1.223024, 0.9348934, -2.314456, 1, 1, 1, 1, 1,
-1.222447, 2.260981, -0.05822834, 1, 1, 1, 1, 1,
-1.218237, -1.067076, -1.486992, 1, 1, 1, 1, 1,
-1.201323, 0.559258, -0.8702556, 1, 1, 1, 1, 1,
-1.200344, 1.620602, -1.11608, 1, 1, 1, 1, 1,
-1.197777, -0.4388605, -2.524806, 1, 1, 1, 1, 1,
-1.193512, 1.713666, -0.7553964, 1, 1, 1, 1, 1,
-1.184161, -1.227591, -1.405739, 1, 1, 1, 1, 1,
-1.183776, 1.322034, -1.43389, 0, 0, 1, 1, 1,
-1.173871, -0.3514532, -0.1202648, 1, 0, 0, 1, 1,
-1.160986, 1.967249, 0.925483, 1, 0, 0, 1, 1,
-1.159934, 0.4290683, 0.2913523, 1, 0, 0, 1, 1,
-1.158353, -1.990724, -2.946147, 1, 0, 0, 1, 1,
-1.152721, -1.267913, -2.893175, 1, 0, 0, 1, 1,
-1.145957, -0.3110706, -3.177013, 0, 0, 0, 1, 1,
-1.140484, -1.231687, -1.951833, 0, 0, 0, 1, 1,
-1.139272, 0.9078668, -0.9323094, 0, 0, 0, 1, 1,
-1.137771, -0.2248436, -0.133575, 0, 0, 0, 1, 1,
-1.134928, -0.1843114, -1.907416, 0, 0, 0, 1, 1,
-1.128413, -0.4482258, -2.106305, 0, 0, 0, 1, 1,
-1.128203, -0.7903479, -2.969057, 0, 0, 0, 1, 1,
-1.127334, 1.148908, 0.789361, 1, 1, 1, 1, 1,
-1.122159, 0.5872723, -2.349271, 1, 1, 1, 1, 1,
-1.116892, 0.8121409, -1.76546, 1, 1, 1, 1, 1,
-1.111259, -0.317113, -2.225389, 1, 1, 1, 1, 1,
-1.111237, -0.08594155, -2.308191, 1, 1, 1, 1, 1,
-1.106568, -1.419968, -1.824281, 1, 1, 1, 1, 1,
-1.104817, 0.3142493, -2.169886, 1, 1, 1, 1, 1,
-1.100087, 0.3051689, -0.9835574, 1, 1, 1, 1, 1,
-1.097068, -1.689507, -1.432746, 1, 1, 1, 1, 1,
-1.094984, -0.1588989, -0.885757, 1, 1, 1, 1, 1,
-1.088958, 0.1764639, -1.626723, 1, 1, 1, 1, 1,
-1.073505, 1.398829, 1.176049, 1, 1, 1, 1, 1,
-1.069586, 0.02503005, -0.7014552, 1, 1, 1, 1, 1,
-1.067692, 0.04095326, -3.749902, 1, 1, 1, 1, 1,
-1.063516, 0.1563738, 0.3027849, 1, 1, 1, 1, 1,
-1.061795, -0.1218368, 0.04312285, 0, 0, 1, 1, 1,
-1.04865, -0.4826303, -4.010212, 1, 0, 0, 1, 1,
-1.044593, -0.8912632, -1.589107, 1, 0, 0, 1, 1,
-1.039144, 0.6078827, 0.4004657, 1, 0, 0, 1, 1,
-1.037483, -0.9165732, -1.002961, 1, 0, 0, 1, 1,
-1.026923, -0.9321159, -2.834599, 1, 0, 0, 1, 1,
-1.024847, 0.2922004, -3.024955, 0, 0, 0, 1, 1,
-1.022835, 1.090555, -0.9154037, 0, 0, 0, 1, 1,
-1.019392, -0.2062877, -3.168612, 0, 0, 0, 1, 1,
-1.017272, 0.8228807, 1.513659, 0, 0, 0, 1, 1,
-1.014271, 0.03520676, -2.470333, 0, 0, 0, 1, 1,
-1.010641, 0.5934893, -1.307073, 0, 0, 0, 1, 1,
-1.010415, 0.7004734, -0.4548562, 0, 0, 0, 1, 1,
-1.005281, 2.283501, 0.2004482, 1, 1, 1, 1, 1,
-0.9941845, 0.5268406, -1.278173, 1, 1, 1, 1, 1,
-0.9941483, 0.4658385, -0.6241159, 1, 1, 1, 1, 1,
-0.9852504, -0.7111071, -3.03238, 1, 1, 1, 1, 1,
-0.9777173, 0.7443467, -1.596729, 1, 1, 1, 1, 1,
-0.9679611, -0.1022089, -2.336192, 1, 1, 1, 1, 1,
-0.9526002, 1.065925, -1.141779, 1, 1, 1, 1, 1,
-0.9460745, 0.6109056, -1.166809, 1, 1, 1, 1, 1,
-0.9444564, 0.6284768, -0.4493072, 1, 1, 1, 1, 1,
-0.9439647, 0.5752282, -2.026508, 1, 1, 1, 1, 1,
-0.9414849, 0.7735413, -1.613743, 1, 1, 1, 1, 1,
-0.9411396, 0.1139463, -0.3710001, 1, 1, 1, 1, 1,
-0.9404046, 0.7606658, 1.033855, 1, 1, 1, 1, 1,
-0.9382927, -0.2460676, -1.637023, 1, 1, 1, 1, 1,
-0.9370504, -0.3211248, -1.266272, 1, 1, 1, 1, 1,
-0.9365106, 2.225514, 0.4495017, 0, 0, 1, 1, 1,
-0.9358118, -0.01983519, -2.074899, 1, 0, 0, 1, 1,
-0.9339585, 0.2283208, 0.6638808, 1, 0, 0, 1, 1,
-0.929888, 0.1806325, -0.994716, 1, 0, 0, 1, 1,
-0.9291044, -1.709509, -2.095165, 1, 0, 0, 1, 1,
-0.9279144, 1.386722, -0.8525309, 1, 0, 0, 1, 1,
-0.9269237, 1.545403, 0.4482432, 0, 0, 0, 1, 1,
-0.9209019, -1.370044, -0.4328345, 0, 0, 0, 1, 1,
-0.9185798, 0.04807203, -1.529772, 0, 0, 0, 1, 1,
-0.9184759, -0.4754601, -0.5684535, 0, 0, 0, 1, 1,
-0.916958, 0.5357054, 0.27422, 0, 0, 0, 1, 1,
-0.9107999, 2.072548, -0.3285427, 0, 0, 0, 1, 1,
-0.9000401, -0.4768992, -1.698694, 0, 0, 0, 1, 1,
-0.8953303, -1.689759, -1.920624, 1, 1, 1, 1, 1,
-0.8892066, -1.562508, -0.8673384, 1, 1, 1, 1, 1,
-0.8824046, 0.6613678, -0.4907678, 1, 1, 1, 1, 1,
-0.8806342, -1.209879, -3.054233, 1, 1, 1, 1, 1,
-0.8787938, 2.333016, -0.9424645, 1, 1, 1, 1, 1,
-0.8760084, 0.2384706, -0.02900198, 1, 1, 1, 1, 1,
-0.8658683, 1.032117, -1.44095, 1, 1, 1, 1, 1,
-0.8658049, -0.1266555, 0.07882626, 1, 1, 1, 1, 1,
-0.861883, 0.6777646, -1.413119, 1, 1, 1, 1, 1,
-0.8605908, 0.5737112, -2.031439, 1, 1, 1, 1, 1,
-0.8562246, 0.6128879, -1.103624, 1, 1, 1, 1, 1,
-0.8541908, 1.009392, -1.464192, 1, 1, 1, 1, 1,
-0.8525895, 0.3279642, -1.056558, 1, 1, 1, 1, 1,
-0.8445063, -0.5790042, -0.995646, 1, 1, 1, 1, 1,
-0.8375912, -0.2981786, -0.2701145, 1, 1, 1, 1, 1,
-0.8371493, -0.449034, -1.327564, 0, 0, 1, 1, 1,
-0.8347136, -0.8925176, -1.907192, 1, 0, 0, 1, 1,
-0.827567, -1.248425, -2.782367, 1, 0, 0, 1, 1,
-0.8199206, 0.2930475, -2.066756, 1, 0, 0, 1, 1,
-0.8186085, 0.4389665, -1.106684, 1, 0, 0, 1, 1,
-0.8027682, 1.465095, 0.06205636, 1, 0, 0, 1, 1,
-0.7992474, -0.2558015, -1.394789, 0, 0, 0, 1, 1,
-0.7988346, 0.7397754, -0.6544936, 0, 0, 0, 1, 1,
-0.7927698, -0.2296802, -1.409207, 0, 0, 0, 1, 1,
-0.7912937, 0.6403489, -3.852127, 0, 0, 0, 1, 1,
-0.7887803, -1.094751, -3.341551, 0, 0, 0, 1, 1,
-0.786938, 0.7952178, -1.179059, 0, 0, 0, 1, 1,
-0.7807781, -0.5972104, -2.557188, 0, 0, 0, 1, 1,
-0.7791088, 1.00488, -0.283792, 1, 1, 1, 1, 1,
-0.7765504, -0.1751616, -2.773906, 1, 1, 1, 1, 1,
-0.775701, -1.548847, 0.011458, 1, 1, 1, 1, 1,
-0.7741417, -1.042411, -1.980549, 1, 1, 1, 1, 1,
-0.7739546, -0.3486722, -2.009134, 1, 1, 1, 1, 1,
-0.764706, 1.656041, -0.8133751, 1, 1, 1, 1, 1,
-0.7611342, -1.589139, -2.521083, 1, 1, 1, 1, 1,
-0.7592015, 0.2806957, -2.39363, 1, 1, 1, 1, 1,
-0.758208, 0.006804285, -0.1626528, 1, 1, 1, 1, 1,
-0.755518, -0.001429306, -0.03532336, 1, 1, 1, 1, 1,
-0.7547289, -0.07587843, -2.104141, 1, 1, 1, 1, 1,
-0.7542254, -1.838439, -1.616261, 1, 1, 1, 1, 1,
-0.7468807, -0.8651692, -1.092114, 1, 1, 1, 1, 1,
-0.7389212, -0.8608729, -2.988003, 1, 1, 1, 1, 1,
-0.7371672, -0.1511485, -3.534398, 1, 1, 1, 1, 1,
-0.7338285, 0.8222827, -0.06980834, 0, 0, 1, 1, 1,
-0.7291589, -0.5682296, -4.538675, 1, 0, 0, 1, 1,
-0.7283812, -0.03247669, -0.7006549, 1, 0, 0, 1, 1,
-0.7260038, 0.3936618, -0.5511374, 1, 0, 0, 1, 1,
-0.7241623, -0.03919206, 0.2769077, 1, 0, 0, 1, 1,
-0.7219504, 0.7509953, -1.608988, 1, 0, 0, 1, 1,
-0.7206966, 0.02177237, -1.127326, 0, 0, 0, 1, 1,
-0.7200732, -1.394659, -4.26791, 0, 0, 0, 1, 1,
-0.7175319, -1.239369, -0.5596923, 0, 0, 0, 1, 1,
-0.7168669, -0.5116503, -2.272372, 0, 0, 0, 1, 1,
-0.7164526, -1.412005, -2.684402, 0, 0, 0, 1, 1,
-0.715991, 0.6244641, -1.704655, 0, 0, 0, 1, 1,
-0.7154603, -0.00404391, -2.356157, 0, 0, 0, 1, 1,
-0.7104012, 0.5932012, -2.250674, 1, 1, 1, 1, 1,
-0.7101189, 1.054504, -0.06405525, 1, 1, 1, 1, 1,
-0.7002419, 1.163309, 0.4198943, 1, 1, 1, 1, 1,
-0.6997043, -0.09397669, -0.7004707, 1, 1, 1, 1, 1,
-0.6982567, -0.379426, -1.716799, 1, 1, 1, 1, 1,
-0.6967832, -0.1418824, -3.137865, 1, 1, 1, 1, 1,
-0.6945657, 0.6937567, -0.3143958, 1, 1, 1, 1, 1,
-0.6937886, 1.017689, -0.4530271, 1, 1, 1, 1, 1,
-0.691181, 0.6270329, -0.4942973, 1, 1, 1, 1, 1,
-0.6910859, 1.558565, -2.126835, 1, 1, 1, 1, 1,
-0.6898132, -0.03988958, -3.226246, 1, 1, 1, 1, 1,
-0.6888022, 1.091979, -0.4625773, 1, 1, 1, 1, 1,
-0.684258, 0.1394384, -1.240155, 1, 1, 1, 1, 1,
-0.6815344, 0.6584334, -2.497704, 1, 1, 1, 1, 1,
-0.6778228, 0.4737571, 0.0645444, 1, 1, 1, 1, 1,
-0.6766555, -0.5028985, -3.657915, 0, 0, 1, 1, 1,
-0.6665546, 0.7509925, -1.362649, 1, 0, 0, 1, 1,
-0.6576044, 0.2144205, -1.005751, 1, 0, 0, 1, 1,
-0.6552539, 0.7907774, -0.142868, 1, 0, 0, 1, 1,
-0.6549442, -3.004593, -4.220375, 1, 0, 0, 1, 1,
-0.6539327, 0.1278726, -2.070127, 1, 0, 0, 1, 1,
-0.6519645, 0.2561821, -1.439327, 0, 0, 0, 1, 1,
-0.6508337, -0.206711, -2.448483, 0, 0, 0, 1, 1,
-0.6438358, -0.2039604, -1.931079, 0, 0, 0, 1, 1,
-0.6423609, -0.2255662, -0.5811528, 0, 0, 0, 1, 1,
-0.6407775, -1.222926, -0.6621209, 0, 0, 0, 1, 1,
-0.6397218, -0.6840345, -3.389842, 0, 0, 0, 1, 1,
-0.6310909, -0.5215465, -1.581051, 0, 0, 0, 1, 1,
-0.6299993, -0.8528144, -2.73506, 1, 1, 1, 1, 1,
-0.6295385, -0.3749599, -2.386651, 1, 1, 1, 1, 1,
-0.6275239, -1.704965, -2.832926, 1, 1, 1, 1, 1,
-0.62266, 1.31504, 0.1280432, 1, 1, 1, 1, 1,
-0.6195087, -0.4735099, -2.002509, 1, 1, 1, 1, 1,
-0.6164314, -1.932611, -3.640177, 1, 1, 1, 1, 1,
-0.6113548, -0.8870004, -3.02949, 1, 1, 1, 1, 1,
-0.6032942, -0.3977564, -2.715009, 1, 1, 1, 1, 1,
-0.601525, 0.4277094, -0.7099231, 1, 1, 1, 1, 1,
-0.5993235, 0.07819481, -0.9159105, 1, 1, 1, 1, 1,
-0.5991594, 1.652934, 1.163449, 1, 1, 1, 1, 1,
-0.5990586, 0.4406929, -3.104721, 1, 1, 1, 1, 1,
-0.5863357, -1.137683, -1.826079, 1, 1, 1, 1, 1,
-0.5832329, 0.6043456, -1.865974, 1, 1, 1, 1, 1,
-0.5827808, -0.1934304, -1.884194, 1, 1, 1, 1, 1,
-0.5816758, -0.8355359, -1.896396, 0, 0, 1, 1, 1,
-0.5767235, -0.0936849, -3.209398, 1, 0, 0, 1, 1,
-0.5748408, -0.7174067, -3.950016, 1, 0, 0, 1, 1,
-0.5727121, 0.2197354, -1.767579, 1, 0, 0, 1, 1,
-0.5714945, -0.4829503, -2.35871, 1, 0, 0, 1, 1,
-0.5701861, 1.443925, -1.358942, 1, 0, 0, 1, 1,
-0.5695353, -1.578917, -2.931224, 0, 0, 0, 1, 1,
-0.5687877, 0.6156398, -0.7005173, 0, 0, 0, 1, 1,
-0.5667266, 0.5551654, -1.010794, 0, 0, 0, 1, 1,
-0.5655043, 0.5780156, -1.885148, 0, 0, 0, 1, 1,
-0.5577489, -1.309334, -5.873765, 0, 0, 0, 1, 1,
-0.5570536, 0.7576864, -0.4935955, 0, 0, 0, 1, 1,
-0.5567026, 0.1440002, -2.59469, 0, 0, 0, 1, 1,
-0.5566442, 0.02458942, -1.93605, 1, 1, 1, 1, 1,
-0.5566281, 0.7541539, -1.460137, 1, 1, 1, 1, 1,
-0.5547959, -0.4289038, -1.679219, 1, 1, 1, 1, 1,
-0.5522063, -0.5293862, -3.122049, 1, 1, 1, 1, 1,
-0.5516188, 1.703224, 0.1537567, 1, 1, 1, 1, 1,
-0.5470031, 1.22227, -0.1843624, 1, 1, 1, 1, 1,
-0.5457337, 0.7128329, -0.01391475, 1, 1, 1, 1, 1,
-0.5451744, -1.83166, -4.218094, 1, 1, 1, 1, 1,
-0.5438803, -1.070188, -2.422219, 1, 1, 1, 1, 1,
-0.5428205, -0.3502347, -2.615016, 1, 1, 1, 1, 1,
-0.5320379, -0.340788, -3.374841, 1, 1, 1, 1, 1,
-0.5320358, 1.18179, 0.6381229, 1, 1, 1, 1, 1,
-0.5312813, 0.5538594, 0.3835956, 1, 1, 1, 1, 1,
-0.5264906, -0.433062, -1.414515, 1, 1, 1, 1, 1,
-0.5240715, -1.00404, -3.037872, 1, 1, 1, 1, 1,
-0.5208354, -0.7674351, -1.267915, 0, 0, 1, 1, 1,
-0.5203189, 0.04922529, 0.03147532, 1, 0, 0, 1, 1,
-0.5202692, 0.09500097, 0.01971049, 1, 0, 0, 1, 1,
-0.5199198, 0.5217214, 0.6522601, 1, 0, 0, 1, 1,
-0.5167757, -1.072738, -3.395046, 1, 0, 0, 1, 1,
-0.5161009, -1.365025, -3.434739, 1, 0, 0, 1, 1,
-0.5006216, -1.334922, -4.15921, 0, 0, 0, 1, 1,
-0.5000902, 0.1684997, -1.322896, 0, 0, 0, 1, 1,
-0.4987206, -1.620322, -3.856544, 0, 0, 0, 1, 1,
-0.4971845, 0.3929362, 0.0997998, 0, 0, 0, 1, 1,
-0.4891824, 1.911222, -0.3818855, 0, 0, 0, 1, 1,
-0.4815615, -0.2365339, -2.301231, 0, 0, 0, 1, 1,
-0.477827, -0.6872681, -2.669682, 0, 0, 0, 1, 1,
-0.471382, -1.112896, -4.21139, 1, 1, 1, 1, 1,
-0.4693232, -2.777282, -2.915557, 1, 1, 1, 1, 1,
-0.4634849, -0.45086, -1.865353, 1, 1, 1, 1, 1,
-0.4627222, 0.1823534, -0.06915027, 1, 1, 1, 1, 1,
-0.4588881, 0.6687616, -0.7193927, 1, 1, 1, 1, 1,
-0.4555979, 0.296718, 0.2211298, 1, 1, 1, 1, 1,
-0.4552667, 0.03102119, -0.4726549, 1, 1, 1, 1, 1,
-0.4531485, -0.5659958, -0.5379565, 1, 1, 1, 1, 1,
-0.444155, -0.2028399, -0.9948989, 1, 1, 1, 1, 1,
-0.4423012, 2.396189, -0.2644378, 1, 1, 1, 1, 1,
-0.4404355, 0.1225372, -0.3864107, 1, 1, 1, 1, 1,
-0.4402919, 0.9254982, 0.4751129, 1, 1, 1, 1, 1,
-0.4376051, 1.637279, -0.04988039, 1, 1, 1, 1, 1,
-0.4358679, 0.8715135, -0.8052685, 1, 1, 1, 1, 1,
-0.435697, 0.8150116, -0.980824, 1, 1, 1, 1, 1,
-0.4323527, -0.6512891, -2.764633, 0, 0, 1, 1, 1,
-0.4306166, 0.5104802, -0.2038253, 1, 0, 0, 1, 1,
-0.4298714, 1.152683, 0.03608911, 1, 0, 0, 1, 1,
-0.4288568, 0.08095506, -1.115409, 1, 0, 0, 1, 1,
-0.428788, 1.292045, 1.385347, 1, 0, 0, 1, 1,
-0.4273304, 0.7758072, 0.5748084, 1, 0, 0, 1, 1,
-0.4240193, -0.4955908, -2.39688, 0, 0, 0, 1, 1,
-0.422071, -0.989485, -4.459525, 0, 0, 0, 1, 1,
-0.421828, -0.2830874, -0.2329864, 0, 0, 0, 1, 1,
-0.419315, -0.4319523, -2.178376, 0, 0, 0, 1, 1,
-0.4181888, -0.3536134, -3.385661, 0, 0, 0, 1, 1,
-0.4116852, 0.6700881, 1.204632, 0, 0, 0, 1, 1,
-0.4109415, 0.274666, -1.395785, 0, 0, 0, 1, 1,
-0.4093557, 0.1967687, -1.205248, 1, 1, 1, 1, 1,
-0.4045146, 0.5351931, 0.1039284, 1, 1, 1, 1, 1,
-0.4038187, -1.739446, -3.663269, 1, 1, 1, 1, 1,
-0.401219, -0.5069007, -1.809661, 1, 1, 1, 1, 1,
-0.398594, -1.718516, -1.765039, 1, 1, 1, 1, 1,
-0.3899066, 1.379341, -0.2833933, 1, 1, 1, 1, 1,
-0.3896834, 0.1049589, -1.334217, 1, 1, 1, 1, 1,
-0.3892718, -0.8027449, -3.451655, 1, 1, 1, 1, 1,
-0.3885437, 1.229997, -0.5600802, 1, 1, 1, 1, 1,
-0.3884315, -0.2551588, -2.329702, 1, 1, 1, 1, 1,
-0.3857845, -0.07821323, -2.221694, 1, 1, 1, 1, 1,
-0.3851805, -0.7338545, -2.765756, 1, 1, 1, 1, 1,
-0.3851505, -0.8067279, -2.247504, 1, 1, 1, 1, 1,
-0.3806753, 0.02915831, -0.5076007, 1, 1, 1, 1, 1,
-0.3778983, 0.2743479, -1.994463, 1, 1, 1, 1, 1,
-0.3772981, -0.7068557, -2.584018, 0, 0, 1, 1, 1,
-0.3761006, 0.7528299, 0.3990082, 1, 0, 0, 1, 1,
-0.3745169, 0.6628246, -0.4740779, 1, 0, 0, 1, 1,
-0.3721298, 0.2676601, -1.824838, 1, 0, 0, 1, 1,
-0.3680733, -1.106686, -3.040749, 1, 0, 0, 1, 1,
-0.3673672, 1.127233, -0.4123673, 1, 0, 0, 1, 1,
-0.3668461, -1.382098, -3.436654, 0, 0, 0, 1, 1,
-0.361632, 1.758043, 0.6245255, 0, 0, 0, 1, 1,
-0.3602827, 0.8067106, -1.898155, 0, 0, 0, 1, 1,
-0.3558083, 0.01712479, -0.9556701, 0, 0, 0, 1, 1,
-0.3512087, -0.1862926, -1.830956, 0, 0, 0, 1, 1,
-0.3498279, -1.476929, -2.298087, 0, 0, 0, 1, 1,
-0.3497311, 0.01281265, -0.1120767, 0, 0, 0, 1, 1,
-0.3452609, 0.434636, -0.4971314, 1, 1, 1, 1, 1,
-0.3429342, 0.02774167, -1.147552, 1, 1, 1, 1, 1,
-0.3419823, -1.73374, -3.946097, 1, 1, 1, 1, 1,
-0.3408656, -0.0365961, -1.278093, 1, 1, 1, 1, 1,
-0.3365096, 0.2532328, -2.431416, 1, 1, 1, 1, 1,
-0.329929, -0.04429664, -0.4174891, 1, 1, 1, 1, 1,
-0.3273035, 1.193781, -2.069206, 1, 1, 1, 1, 1,
-0.3271056, 1.734052, -1.213436, 1, 1, 1, 1, 1,
-0.325792, -0.4945852, -3.432039, 1, 1, 1, 1, 1,
-0.3230819, -0.06593027, -1.085758, 1, 1, 1, 1, 1,
-0.3229609, -1.487317, -3.715254, 1, 1, 1, 1, 1,
-0.3146909, -1.178943, -2.891437, 1, 1, 1, 1, 1,
-0.3135098, 1.421591, 0.6995541, 1, 1, 1, 1, 1,
-0.3121903, 0.577632, -0.7237043, 1, 1, 1, 1, 1,
-0.3025007, -0.2022154, -1.428945, 1, 1, 1, 1, 1,
-0.3011103, 0.4692454, 1.407794, 0, 0, 1, 1, 1,
-0.2947862, -0.09811191, -2.110537, 1, 0, 0, 1, 1,
-0.2933975, 0.9488837, 1.32999, 1, 0, 0, 1, 1,
-0.2930734, 0.4960738, -1.302182, 1, 0, 0, 1, 1,
-0.2914789, 0.3735954, -1.406695, 1, 0, 0, 1, 1,
-0.291153, 0.08914532, -1.49341, 1, 0, 0, 1, 1,
-0.2901497, 1.169353, -0.4912393, 0, 0, 0, 1, 1,
-0.289179, -0.432265, -2.804306, 0, 0, 0, 1, 1,
-0.2856088, -0.8009156, -0.346739, 0, 0, 0, 1, 1,
-0.2855163, -0.3690056, -4.39613, 0, 0, 0, 1, 1,
-0.2777462, 1.032215, 0.1227244, 0, 0, 0, 1, 1,
-0.2755749, -0.6772542, -2.291509, 0, 0, 0, 1, 1,
-0.2740135, 0.4238445, -0.6200696, 0, 0, 0, 1, 1,
-0.2702968, 0.3543696, -2.050999, 1, 1, 1, 1, 1,
-0.2639415, 1.427652, -0.08590286, 1, 1, 1, 1, 1,
-0.2606243, -0.4292529, -4.371769, 1, 1, 1, 1, 1,
-0.2592769, 0.2172407, -1.399567, 1, 1, 1, 1, 1,
-0.2554342, 0.890175, 1.926371, 1, 1, 1, 1, 1,
-0.2538106, -1.535958, -2.455602, 1, 1, 1, 1, 1,
-0.2487346, -0.5032681, -2.020304, 1, 1, 1, 1, 1,
-0.2486395, 0.1622212, -1.500184, 1, 1, 1, 1, 1,
-0.2472457, 0.4368496, -1.095094, 1, 1, 1, 1, 1,
-0.2410991, -1.18209, -4.444106, 1, 1, 1, 1, 1,
-0.2382971, 0.01018738, -0.5223769, 1, 1, 1, 1, 1,
-0.2331059, -0.6528004, -4.165352, 1, 1, 1, 1, 1,
-0.2284468, -0.4349234, -2.784294, 1, 1, 1, 1, 1,
-0.2242246, -0.8622007, -3.47439, 1, 1, 1, 1, 1,
-0.2227544, -1.638146, -3.342077, 1, 1, 1, 1, 1,
-0.2201529, -0.2623391, 0.2012536, 0, 0, 1, 1, 1,
-0.218307, 1.863888, 0.6034964, 1, 0, 0, 1, 1,
-0.2159362, -1.901923, -1.70513, 1, 0, 0, 1, 1,
-0.2120756, 0.512826, -0.1654289, 1, 0, 0, 1, 1,
-0.2063029, -0.1594947, -3.081515, 1, 0, 0, 1, 1,
-0.2040478, 0.2583612, -0.1127847, 1, 0, 0, 1, 1,
-0.2040205, -0.95899, -3.488722, 0, 0, 0, 1, 1,
-0.2022791, -0.687586, -3.418874, 0, 0, 0, 1, 1,
-0.2022265, 0.403154, -1.399263, 0, 0, 0, 1, 1,
-0.2021198, -1.952159, -2.782637, 0, 0, 0, 1, 1,
-0.1989908, 1.119156, 0.03972104, 0, 0, 0, 1, 1,
-0.1949404, 1.448389, -1.23951, 0, 0, 0, 1, 1,
-0.1936617, -0.3812273, -3.28103, 0, 0, 0, 1, 1,
-0.1888803, 1.386425, -0.1282463, 1, 1, 1, 1, 1,
-0.1882051, 1.625695, 1.620202, 1, 1, 1, 1, 1,
-0.1853158, -0.9269485, -2.543841, 1, 1, 1, 1, 1,
-0.1831752, 0.1733739, -2.125165, 1, 1, 1, 1, 1,
-0.1813971, -1.054275, -1.763042, 1, 1, 1, 1, 1,
-0.1813355, 0.006308791, -0.9680652, 1, 1, 1, 1, 1,
-0.1785815, 0.1376592, -0.2114944, 1, 1, 1, 1, 1,
-0.1774926, -1.106451, -3.658975, 1, 1, 1, 1, 1,
-0.1728157, 0.8203153, -0.238523, 1, 1, 1, 1, 1,
-0.1708993, -0.7912883, -1.222116, 1, 1, 1, 1, 1,
-0.1682, -0.5272829, -2.251956, 1, 1, 1, 1, 1,
-0.1657565, 0.2607726, 0.8911142, 1, 1, 1, 1, 1,
-0.1610747, -0.6301764, -3.33, 1, 1, 1, 1, 1,
-0.1550029, -1.586146, -2.460505, 1, 1, 1, 1, 1,
-0.1545956, -0.7569577, -1.36356, 1, 1, 1, 1, 1,
-0.154092, 2.486953, 1.771955, 0, 0, 1, 1, 1,
-0.1540619, 0.1133442, -2.031203, 1, 0, 0, 1, 1,
-0.1535235, -0.0510417, -1.194475, 1, 0, 0, 1, 1,
-0.1481856, 0.4776312, 0.7259584, 1, 0, 0, 1, 1,
-0.1447069, -0.3106748, -2.134221, 1, 0, 0, 1, 1,
-0.1430808, -1.464435, -2.911189, 1, 0, 0, 1, 1,
-0.1414184, -0.2575184, -3.850576, 0, 0, 0, 1, 1,
-0.1333622, -1.203517, -2.364484, 0, 0, 0, 1, 1,
-0.1323974, -0.3069281, -3.248535, 0, 0, 0, 1, 1,
-0.1318175, 0.1373112, -0.2919073, 0, 0, 0, 1, 1,
-0.1300485, -0.3540748, -3.863188, 0, 0, 0, 1, 1,
-0.1284742, -0.2019588, -1.549745, 0, 0, 0, 1, 1,
-0.1272816, 0.2171014, -1.550478, 0, 0, 0, 1, 1,
-0.1270211, -0.8943911, -2.8476, 1, 1, 1, 1, 1,
-0.1256278, -0.6497602, -2.203083, 1, 1, 1, 1, 1,
-0.1247092, -1.401716, -0.8493299, 1, 1, 1, 1, 1,
-0.1244986, 0.02884695, -0.8942876, 1, 1, 1, 1, 1,
-0.1227822, 1.257996, -0.03551816, 1, 1, 1, 1, 1,
-0.1224723, -1.264236, -4.222172, 1, 1, 1, 1, 1,
-0.120092, 0.1125121, -0.2358082, 1, 1, 1, 1, 1,
-0.1200259, 0.2937503, -1.271686, 1, 1, 1, 1, 1,
-0.1182598, 1.344262, 0.271246, 1, 1, 1, 1, 1,
-0.1147471, 0.02592539, 0.9396356, 1, 1, 1, 1, 1,
-0.1133038, 1.349031, -0.6110889, 1, 1, 1, 1, 1,
-0.1113416, -0.6726639, -3.718067, 1, 1, 1, 1, 1,
-0.110937, 0.05986398, -0.1758107, 1, 1, 1, 1, 1,
-0.1102245, -1.516073, -2.004232, 1, 1, 1, 1, 1,
-0.1082781, -0.7705826, -2.360687, 1, 1, 1, 1, 1,
-0.1047489, 0.4647124, -1.597909, 0, 0, 1, 1, 1,
-0.1042898, 1.794189, -1.685466, 1, 0, 0, 1, 1,
-0.1032551, 1.307095, -0.7222674, 1, 0, 0, 1, 1,
-0.1021716, -1.180732, -4.215107, 1, 0, 0, 1, 1,
-0.09797033, 0.7914691, -0.7360556, 1, 0, 0, 1, 1,
-0.09715902, 1.024422, 1.071933, 1, 0, 0, 1, 1,
-0.09565146, -0.7191427, -1.939171, 0, 0, 0, 1, 1,
-0.0919342, 0.6545025, 1.256853, 0, 0, 0, 1, 1,
-0.0912255, 0.5198008, -1.672762, 0, 0, 0, 1, 1,
-0.09012489, 1.194056, -0.5718802, 0, 0, 0, 1, 1,
-0.08796104, 1.311007, 0.03729491, 0, 0, 0, 1, 1,
-0.08361345, -0.6248875, -2.284963, 0, 0, 0, 1, 1,
-0.08054499, -0.9530337, -2.334772, 0, 0, 0, 1, 1,
-0.07910509, -1.12394, -3.293823, 1, 1, 1, 1, 1,
-0.07641609, -0.4465359, -2.871748, 1, 1, 1, 1, 1,
-0.07239372, 0.3905225, -0.6140577, 1, 1, 1, 1, 1,
-0.07029799, -1.088152, -1.361683, 1, 1, 1, 1, 1,
-0.06558527, -0.6228259, -2.29905, 1, 1, 1, 1, 1,
-0.06444431, -0.8264796, -2.963849, 1, 1, 1, 1, 1,
-0.06018528, 1.63363, -1.843389, 1, 1, 1, 1, 1,
-0.05962426, 0.8014792, -0.6811914, 1, 1, 1, 1, 1,
-0.05400171, -0.9298167, -1.785588, 1, 1, 1, 1, 1,
-0.05223903, -1.145689, -1.340089, 1, 1, 1, 1, 1,
-0.05143019, 1.788717, -0.3295645, 1, 1, 1, 1, 1,
-0.04332894, 0.9485775, -0.2307822, 1, 1, 1, 1, 1,
-0.04046923, 0.1860673, -0.9420927, 1, 1, 1, 1, 1,
-0.04033066, -1.655818, -2.35511, 1, 1, 1, 1, 1,
-0.03948253, 0.7011734, 1.479017, 1, 1, 1, 1, 1,
-0.037105, -1.750429, -2.110789, 0, 0, 1, 1, 1,
-0.03562222, -0.5135803, -3.614082, 1, 0, 0, 1, 1,
-0.03524179, 0.5397227, 0.714632, 1, 0, 0, 1, 1,
-0.03344436, 1.960731, 0.8943735, 1, 0, 0, 1, 1,
-0.02895874, 0.1856173, 0.0008897812, 1, 0, 0, 1, 1,
-0.02465878, 0.646741, -1.673983, 1, 0, 0, 1, 1,
-0.0241212, -0.5111732, -1.786949, 0, 0, 0, 1, 1,
-0.02060369, -1.038198, -1.385323, 0, 0, 0, 1, 1,
-0.01961948, 1.073298, -0.692384, 0, 0, 0, 1, 1,
-0.01588239, 1.099035, -0.3597528, 0, 0, 0, 1, 1,
-0.0152056, 0.6537139, 0.08757439, 0, 0, 0, 1, 1,
-0.01297463, 2.099875, -0.8296809, 0, 0, 0, 1, 1,
-0.01127812, 1.194071, 0.9574059, 0, 0, 0, 1, 1,
-0.004536546, -1.338753, -2.442082, 1, 1, 1, 1, 1,
-0.0031604, -0.3356939, -3.86867, 1, 1, 1, 1, 1,
-0.000705026, -0.8958548, -2.778922, 1, 1, 1, 1, 1,
0.004018479, 0.7305867, -0.06125502, 1, 1, 1, 1, 1,
0.004818972, -0.582705, 1.693712, 1, 1, 1, 1, 1,
0.007435508, 1.342848, 0.16213, 1, 1, 1, 1, 1,
0.01415549, -0.6548102, 2.564172, 1, 1, 1, 1, 1,
0.01484821, -0.09710418, 2.239623, 1, 1, 1, 1, 1,
0.02225626, 1.031112, -2.001415, 1, 1, 1, 1, 1,
0.02310578, -1.149433, 2.777091, 1, 1, 1, 1, 1,
0.02476806, -1.038488, 3.763112, 1, 1, 1, 1, 1,
0.02946482, -0.1161508, 2.691667, 1, 1, 1, 1, 1,
0.02982457, -1.25045, 3.264573, 1, 1, 1, 1, 1,
0.02983449, 0.1867578, 0.7009178, 1, 1, 1, 1, 1,
0.03126984, 0.145732, -0.05488759, 1, 1, 1, 1, 1,
0.03371958, -0.3454814, 3.081558, 0, 0, 1, 1, 1,
0.03538277, -0.4120615, 1.344352, 1, 0, 0, 1, 1,
0.04363554, 1.818339, -1.354641, 1, 0, 0, 1, 1,
0.04364304, -1.506, 3.688057, 1, 0, 0, 1, 1,
0.04666957, 0.1517942, 0.8781429, 1, 0, 0, 1, 1,
0.04680335, 1.95598, 0.3448619, 1, 0, 0, 1, 1,
0.04712648, 0.7204272, 0.3720444, 0, 0, 0, 1, 1,
0.04781233, -1.02329, 2.908147, 0, 0, 0, 1, 1,
0.0523365, -0.0762463, 2.686045, 0, 0, 0, 1, 1,
0.05281625, -0.01126004, 1.070449, 0, 0, 0, 1, 1,
0.05350798, 0.4438249, -1.859214, 0, 0, 0, 1, 1,
0.05486275, -0.7204044, 2.541707, 0, 0, 0, 1, 1,
0.05629968, -1.334116, 2.018451, 0, 0, 0, 1, 1,
0.06256056, 1.014108, -0.5778758, 1, 1, 1, 1, 1,
0.06472205, 0.6083295, -0.3866795, 1, 1, 1, 1, 1,
0.06711946, -0.5550988, 3.193732, 1, 1, 1, 1, 1,
0.07030126, 1.107524, 0.9565576, 1, 1, 1, 1, 1,
0.074211, 0.7261738, 0.4877554, 1, 1, 1, 1, 1,
0.07436243, -0.2064317, 1.028343, 1, 1, 1, 1, 1,
0.07438054, -1.408886, 2.101865, 1, 1, 1, 1, 1,
0.07580867, 0.48537, 0.1436725, 1, 1, 1, 1, 1,
0.07675588, 1.211327, 1.549669, 1, 1, 1, 1, 1,
0.08242934, -0.4310429, 4.411273, 1, 1, 1, 1, 1,
0.08379769, 0.7623532, -0.3418299, 1, 1, 1, 1, 1,
0.08414019, -2.003239, 3.405954, 1, 1, 1, 1, 1,
0.08555165, -0.1884876, 2.819604, 1, 1, 1, 1, 1,
0.08557498, -2.018409, 3.881196, 1, 1, 1, 1, 1,
0.08652803, -0.2991855, 3.871944, 1, 1, 1, 1, 1,
0.08943796, -0.1293164, 3.302384, 0, 0, 1, 1, 1,
0.09323263, 0.7107664, 1.526319, 1, 0, 0, 1, 1,
0.09324412, 0.2693067, 0.7165806, 1, 0, 0, 1, 1,
0.1000345, -0.8106743, 4.328341, 1, 0, 0, 1, 1,
0.1008099, -2.875291, 3.44184, 1, 0, 0, 1, 1,
0.1029194, 1.106974, 0.563611, 1, 0, 0, 1, 1,
0.1056442, 0.7536811, 0.0372825, 0, 0, 0, 1, 1,
0.1148852, 0.3881219, -1.388281, 0, 0, 0, 1, 1,
0.1156908, 1.053766, -0.2047676, 0, 0, 0, 1, 1,
0.1168713, -0.117624, 1.880171, 0, 0, 0, 1, 1,
0.1197328, 0.04468728, 1.825968, 0, 0, 0, 1, 1,
0.1201831, 1.029008, -1.136041, 0, 0, 0, 1, 1,
0.1206107, 0.29013, 0.2031049, 0, 0, 0, 1, 1,
0.1224211, -0.4637594, 2.537189, 1, 1, 1, 1, 1,
0.1278851, 0.4477398, 1.329995, 1, 1, 1, 1, 1,
0.1289381, 1.095305, -0.1340193, 1, 1, 1, 1, 1,
0.1408671, 1.141114, 2.223199, 1, 1, 1, 1, 1,
0.1426476, -0.8647426, 3.883421, 1, 1, 1, 1, 1,
0.1429007, 0.04509525, 1.547553, 1, 1, 1, 1, 1,
0.1452523, -0.1420377, 1.529716, 1, 1, 1, 1, 1,
0.1455882, -0.130545, 1.303613, 1, 1, 1, 1, 1,
0.1462408, -0.400871, 4.875152, 1, 1, 1, 1, 1,
0.1481502, 0.1707415, 1.121751, 1, 1, 1, 1, 1,
0.1557181, -0.4657795, 2.657647, 1, 1, 1, 1, 1,
0.1580558, -0.1785608, 2.025293, 1, 1, 1, 1, 1,
0.1603619, 0.6630481, 0.4756393, 1, 1, 1, 1, 1,
0.1608264, 0.1070278, 1.606889, 1, 1, 1, 1, 1,
0.1610601, -0.7245296, 2.063314, 1, 1, 1, 1, 1,
0.1661426, -0.9535347, 4.259293, 0, 0, 1, 1, 1,
0.1667717, -1.287696, 3.392656, 1, 0, 0, 1, 1,
0.1711618, 0.6745428, 1.788002, 1, 0, 0, 1, 1,
0.1719227, 1.591334, 0.7861398, 1, 0, 0, 1, 1,
0.1739416, 0.8107529, 3.09534, 1, 0, 0, 1, 1,
0.1741838, 0.3566101, 0.3092652, 1, 0, 0, 1, 1,
0.1767364, -1.193027, 1.920047, 0, 0, 0, 1, 1,
0.1767808, 0.3500417, 1.127844, 0, 0, 0, 1, 1,
0.1833603, 0.0610075, 2.135073, 0, 0, 0, 1, 1,
0.1881122, 1.006532, -0.1192819, 0, 0, 0, 1, 1,
0.1910062, -1.552021, 2.084576, 0, 0, 0, 1, 1,
0.1950038, 1.062521, 1.777111, 0, 0, 0, 1, 1,
0.2035494, 0.2535343, 1.012139, 0, 0, 0, 1, 1,
0.2042657, -0.8113654, 3.793028, 1, 1, 1, 1, 1,
0.2046316, 0.4645853, -0.5963982, 1, 1, 1, 1, 1,
0.2090981, 0.3785458, 0.3502814, 1, 1, 1, 1, 1,
0.2141024, -0.984104, 2.559435, 1, 1, 1, 1, 1,
0.2173776, -0.6506083, 2.459447, 1, 1, 1, 1, 1,
0.2176869, 0.7018027, -0.6866466, 1, 1, 1, 1, 1,
0.2180843, -0.3089338, 2.419293, 1, 1, 1, 1, 1,
0.2190152, 1.725083, -1.911239, 1, 1, 1, 1, 1,
0.2213864, -1.404385, 2.637131, 1, 1, 1, 1, 1,
0.2259379, 0.2586377, 1.232591, 1, 1, 1, 1, 1,
0.2259524, -1.553304, 4.478888, 1, 1, 1, 1, 1,
0.2270164, -0.7023004, 4.120215, 1, 1, 1, 1, 1,
0.2271866, -0.1925212, 1.897289, 1, 1, 1, 1, 1,
0.2294928, -2.55542, 1.631659, 1, 1, 1, 1, 1,
0.2337218, 0.293425, 1.442209, 1, 1, 1, 1, 1,
0.2342514, -1.555654, 2.395528, 0, 0, 1, 1, 1,
0.2396283, 0.7381987, 0.4056493, 1, 0, 0, 1, 1,
0.2428625, 0.3367916, -0.5019559, 1, 0, 0, 1, 1,
0.2449474, -0.03955109, 0.5437114, 1, 0, 0, 1, 1,
0.2476266, -0.4712279, 2.460646, 1, 0, 0, 1, 1,
0.2498596, -1.607431, 3.617507, 1, 0, 0, 1, 1,
0.2515904, 0.14893, 0.7143807, 0, 0, 0, 1, 1,
0.2517073, -0.4594592, 2.885387, 0, 0, 0, 1, 1,
0.2517627, 0.1456223, 1.848198, 0, 0, 0, 1, 1,
0.2562228, 1.304619, -0.9219465, 0, 0, 0, 1, 1,
0.2618795, -0.2226229, 0.9292675, 0, 0, 0, 1, 1,
0.2654166, -0.1086765, 1.060511, 0, 0, 0, 1, 1,
0.2781876, 0.06674454, 0.4405434, 0, 0, 0, 1, 1,
0.280412, 0.4003825, 0.3354316, 1, 1, 1, 1, 1,
0.2804421, 1.025451, -0.8231691, 1, 1, 1, 1, 1,
0.2817371, -1.185606, 1.650478, 1, 1, 1, 1, 1,
0.282412, 0.21414, 1.449688, 1, 1, 1, 1, 1,
0.2836847, -1.093817, 2.880849, 1, 1, 1, 1, 1,
0.2884418, -0.6108322, 2.65501, 1, 1, 1, 1, 1,
0.2964203, 0.8426183, -0.08548377, 1, 1, 1, 1, 1,
0.2967654, 0.7234073, 0.6076251, 1, 1, 1, 1, 1,
0.3015023, -1.729594, 1.341642, 1, 1, 1, 1, 1,
0.3052901, 0.8987458, 0.4415448, 1, 1, 1, 1, 1,
0.30747, -0.01004373, 0.6020011, 1, 1, 1, 1, 1,
0.3091806, 0.09490412, 1.845159, 1, 1, 1, 1, 1,
0.3133495, -0.4283741, 2.645876, 1, 1, 1, 1, 1,
0.3144139, -0.1671518, 1.867625, 1, 1, 1, 1, 1,
0.3150991, -0.3616425, 2.685979, 1, 1, 1, 1, 1,
0.3174381, 1.234056, -2.316425, 0, 0, 1, 1, 1,
0.3187751, 0.5780216, 1.540224, 1, 0, 0, 1, 1,
0.3199811, -0.1504541, 0.8126292, 1, 0, 0, 1, 1,
0.3200149, -0.9295453, 3.166933, 1, 0, 0, 1, 1,
0.3200437, 0.2730972, 1.355597, 1, 0, 0, 1, 1,
0.3211973, 0.553755, -0.5109383, 1, 0, 0, 1, 1,
0.3242726, 0.3874236, 0.9812862, 0, 0, 0, 1, 1,
0.3256784, -0.3735929, 2.739974, 0, 0, 0, 1, 1,
0.3319214, 0.7276301, 0.4559847, 0, 0, 0, 1, 1,
0.3324876, 0.7837692, -0.5608828, 0, 0, 0, 1, 1,
0.3364966, 0.993645, -0.1592074, 0, 0, 0, 1, 1,
0.3394473, -0.7680303, 1.987806, 0, 0, 0, 1, 1,
0.3396035, 1.099906, 0.5965331, 0, 0, 0, 1, 1,
0.3410472, -0.4717673, 4.72734, 1, 1, 1, 1, 1,
0.3415415, -0.9494554, 3.777826, 1, 1, 1, 1, 1,
0.34241, 0.4316855, 0.2685268, 1, 1, 1, 1, 1,
0.3445479, 0.2732258, 0.311357, 1, 1, 1, 1, 1,
0.3484394, 0.0783283, 1.22809, 1, 1, 1, 1, 1,
0.3507821, -0.4006652, 1.395816, 1, 1, 1, 1, 1,
0.3543501, 3.012224, 0.1244391, 1, 1, 1, 1, 1,
0.3552749, -0.9985235, 3.406094, 1, 1, 1, 1, 1,
0.363408, -0.2294211, 2.903836, 1, 1, 1, 1, 1,
0.3654266, -0.19567, 2.763209, 1, 1, 1, 1, 1,
0.3659012, 0.8887517, -0.8366165, 1, 1, 1, 1, 1,
0.3683005, -1.857294, 2.162261, 1, 1, 1, 1, 1,
0.3722251, -0.7756044, 3.342459, 1, 1, 1, 1, 1,
0.3799915, -1.328036, 5.046844, 1, 1, 1, 1, 1,
0.3802373, -0.6760988, 1.765438, 1, 1, 1, 1, 1,
0.3842668, 0.1002721, 1.522191, 0, 0, 1, 1, 1,
0.3844428, -0.9292102, 2.288383, 1, 0, 0, 1, 1,
0.3857905, 0.7055498, 0.2298323, 1, 0, 0, 1, 1,
0.3890786, 0.6724548, 0.5154343, 1, 0, 0, 1, 1,
0.3904534, 0.5772559, 2.110787, 1, 0, 0, 1, 1,
0.3979883, 0.2664602, -0.4204629, 1, 0, 0, 1, 1,
0.4039996, -0.3509378, 2.223343, 0, 0, 0, 1, 1,
0.4069376, 0.7875597, 0.2106836, 0, 0, 0, 1, 1,
0.4095423, 0.581933, -0.004191688, 0, 0, 0, 1, 1,
0.4131765, 0.5753956, -0.9271649, 0, 0, 0, 1, 1,
0.4154924, -1.249352, 2.028197, 0, 0, 0, 1, 1,
0.4223194, -1.238206, 5.04973, 0, 0, 0, 1, 1,
0.4233544, 0.002533871, 0.08025315, 0, 0, 0, 1, 1,
0.4237317, -0.6880443, 2.516174, 1, 1, 1, 1, 1,
0.4262986, -1.24164, 3.080969, 1, 1, 1, 1, 1,
0.4265004, 1.457013, -0.9981301, 1, 1, 1, 1, 1,
0.427237, -0.3629289, 1.853803, 1, 1, 1, 1, 1,
0.4299904, 0.6523634, 1.879399, 1, 1, 1, 1, 1,
0.4342127, -0.5246322, 3.325263, 1, 1, 1, 1, 1,
0.4422074, 1.242381, -0.2173606, 1, 1, 1, 1, 1,
0.4502303, 0.8427377, 1.989798, 1, 1, 1, 1, 1,
0.451713, -1.078217, 3.836761, 1, 1, 1, 1, 1,
0.4541532, 1.061968, 1.187326, 1, 1, 1, 1, 1,
0.4597027, -0.5292514, 2.616227, 1, 1, 1, 1, 1,
0.4781001, -2.817705, 1.022089, 1, 1, 1, 1, 1,
0.4823368, 0.3745805, 2.283623, 1, 1, 1, 1, 1,
0.4843454, 1.842531, -0.07301663, 1, 1, 1, 1, 1,
0.4911093, -0.3485525, 0.8151029, 1, 1, 1, 1, 1,
0.4931757, -0.7903674, 3.086562, 0, 0, 1, 1, 1,
0.493644, -0.0349112, 0.4226324, 1, 0, 0, 1, 1,
0.4961242, -0.8485678, 1.407838, 1, 0, 0, 1, 1,
0.5103765, 0.4882813, 2.029129, 1, 0, 0, 1, 1,
0.5144717, -0.8433762, 4.775055, 1, 0, 0, 1, 1,
0.5171782, -0.03205774, 0.8252745, 1, 0, 0, 1, 1,
0.5255302, 0.4138511, 0.7873008, 0, 0, 0, 1, 1,
0.5298771, -0.4434043, 1.949896, 0, 0, 0, 1, 1,
0.5322287, -0.9697816, 2.964621, 0, 0, 0, 1, 1,
0.5338743, 0.4030784, 1.254941, 0, 0, 0, 1, 1,
0.5373141, 0.0595585, 1.288579, 0, 0, 0, 1, 1,
0.5392016, 2.696084, 0.3919772, 0, 0, 0, 1, 1,
0.5408866, -1.011867, 1.346337, 0, 0, 0, 1, 1,
0.5419551, 0.008426797, 2.189986, 1, 1, 1, 1, 1,
0.5422105, -0.2983008, 1.410176, 1, 1, 1, 1, 1,
0.5429862, 0.1901415, 2.717121, 1, 1, 1, 1, 1,
0.5479479, 0.01186586, 1.240253, 1, 1, 1, 1, 1,
0.5513228, 0.3530293, 2.974462, 1, 1, 1, 1, 1,
0.5552989, -0.7101189, 3.149092, 1, 1, 1, 1, 1,
0.5570839, 1.724894, 1.026679, 1, 1, 1, 1, 1,
0.5571589, -1.698128, 2.101933, 1, 1, 1, 1, 1,
0.5643904, -1.268097, 4.080428, 1, 1, 1, 1, 1,
0.5651988, -0.6487391, 1.557164, 1, 1, 1, 1, 1,
0.5664994, 1.245803, 1.012183, 1, 1, 1, 1, 1,
0.5669993, 1.352551, -0.5693352, 1, 1, 1, 1, 1,
0.5673445, 0.5346186, 1.236556, 1, 1, 1, 1, 1,
0.5698301, -0.4421426, 1.907501, 1, 1, 1, 1, 1,
0.5741541, -0.8943509, 0.262386, 1, 1, 1, 1, 1,
0.5805959, 0.09823576, 0.3319652, 0, 0, 1, 1, 1,
0.5906348, 1.070932, 0.3004582, 1, 0, 0, 1, 1,
0.5922294, 1.021213, 1.18142, 1, 0, 0, 1, 1,
0.5968848, 0.1155544, 0.1423941, 1, 0, 0, 1, 1,
0.5985845, -1.481271, 2.785364, 1, 0, 0, 1, 1,
0.6004549, -0.83284, 3.731422, 1, 0, 0, 1, 1,
0.601107, 1.088497, -1.012767, 0, 0, 0, 1, 1,
0.6039928, -2.004483, 3.240374, 0, 0, 0, 1, 1,
0.6067612, 0.1598797, 2.082127, 0, 0, 0, 1, 1,
0.6142648, 0.2439862, 2.553889, 0, 0, 0, 1, 1,
0.615741, 0.3530604, 0.155675, 0, 0, 0, 1, 1,
0.620743, 1.90127, 1.319964, 0, 0, 0, 1, 1,
0.6242321, 1.013629, 1.022054, 0, 0, 0, 1, 1,
0.6248875, -0.7474718, 1.549045, 1, 1, 1, 1, 1,
0.6251518, -0.2230154, 1.149119, 1, 1, 1, 1, 1,
0.6331593, -0.6488882, 0.5592197, 1, 1, 1, 1, 1,
0.6346079, 0.7892194, 1.046616, 1, 1, 1, 1, 1,
0.642297, 1.386538, 1.291063, 1, 1, 1, 1, 1,
0.6451979, 0.7968511, 1.181501, 1, 1, 1, 1, 1,
0.6507805, 0.2201438, 0.4827628, 1, 1, 1, 1, 1,
0.6590313, -1.478876, 2.141853, 1, 1, 1, 1, 1,
0.6629041, -1.048626, 2.999135, 1, 1, 1, 1, 1,
0.6648417, 0.9753554, 0.5493041, 1, 1, 1, 1, 1,
0.6658669, 1.409509, 0.552471, 1, 1, 1, 1, 1,
0.6664522, -0.1110124, -0.03905531, 1, 1, 1, 1, 1,
0.6681882, 0.6965594, 0.5947579, 1, 1, 1, 1, 1,
0.6746756, -1.026033, 0.027668, 1, 1, 1, 1, 1,
0.6795864, -0.3423437, 0.8854575, 1, 1, 1, 1, 1,
0.6867585, 0.66076, 1.087133, 0, 0, 1, 1, 1,
0.6871125, -2.276297, 2.911298, 1, 0, 0, 1, 1,
0.6873059, 0.705933, 0.2176093, 1, 0, 0, 1, 1,
0.6957312, 0.1282985, 1.365219, 1, 0, 0, 1, 1,
0.6984047, -1.518583, 3.551483, 1, 0, 0, 1, 1,
0.6987635, -0.1347167, 2.271497, 1, 0, 0, 1, 1,
0.7065369, 1.173106, 2.231977, 0, 0, 0, 1, 1,
0.7075105, 0.4452412, -0.1800214, 0, 0, 0, 1, 1,
0.7151735, 0.471229, 2.159784, 0, 0, 0, 1, 1,
0.7167596, -1.353895, 1.601581, 0, 0, 0, 1, 1,
0.7193385, -0.01998591, 2.739371, 0, 0, 0, 1, 1,
0.7198122, -0.6491548, 2.56465, 0, 0, 0, 1, 1,
0.7222511, -1.536893, -0.3739708, 0, 0, 0, 1, 1,
0.7255402, 0.3568754, 0.9191362, 1, 1, 1, 1, 1,
0.7276629, 0.5579849, 0.7815307, 1, 1, 1, 1, 1,
0.728422, 0.1647591, 1.729737, 1, 1, 1, 1, 1,
0.7376112, -0.5145907, 2.085527, 1, 1, 1, 1, 1,
0.7391829, 0.1444858, -0.4543578, 1, 1, 1, 1, 1,
0.7422676, -0.431905, 3.131469, 1, 1, 1, 1, 1,
0.7424282, -1.448847, 1.967466, 1, 1, 1, 1, 1,
0.7465845, 0.3457988, 3.836912, 1, 1, 1, 1, 1,
0.7474824, 0.8467646, 1.5386, 1, 1, 1, 1, 1,
0.7512614, 0.8595685, -0.1972112, 1, 1, 1, 1, 1,
0.7627776, -0.3883966, 3.820472, 1, 1, 1, 1, 1,
0.7765273, 0.2266921, 0.859116, 1, 1, 1, 1, 1,
0.7793944, -0.2563849, 4.223398, 1, 1, 1, 1, 1,
0.7798232, -0.9419805, 1.725426, 1, 1, 1, 1, 1,
0.7822165, 1.441993, 0.382021, 1, 1, 1, 1, 1,
0.7870194, -1.560571, 4.344206, 0, 0, 1, 1, 1,
0.7929462, 0.6901358, 0.01441378, 1, 0, 0, 1, 1,
0.7932302, -1.262302, 2.093136, 1, 0, 0, 1, 1,
0.7962907, -1.749601, 2.928606, 1, 0, 0, 1, 1,
0.7974049, -1.396512, 3.331798, 1, 0, 0, 1, 1,
0.7997469, 0.5801821, -0.5316017, 1, 0, 0, 1, 1,
0.8011552, -1.221987, 1.538298, 0, 0, 0, 1, 1,
0.8020663, -0.0365248, 1.144919, 0, 0, 0, 1, 1,
0.8097999, -1.167261, 2.040372, 0, 0, 0, 1, 1,
0.8122547, -0.14935, 0.9634255, 0, 0, 0, 1, 1,
0.8180015, 0.01231038, 0.6392211, 0, 0, 0, 1, 1,
0.823393, -0.2793292, 2.272732, 0, 0, 0, 1, 1,
0.8277397, -1.562389, 2.974542, 0, 0, 0, 1, 1,
0.8288973, -1.864888, 2.953089, 1, 1, 1, 1, 1,
0.8321655, -0.6868259, 2.644108, 1, 1, 1, 1, 1,
0.8332388, 0.7091911, 0.5735804, 1, 1, 1, 1, 1,
0.8451173, 1.022149, 0.5203098, 1, 1, 1, 1, 1,
0.8478602, -1.104273, 2.206969, 1, 1, 1, 1, 1,
0.8648495, 1.529602, 3.230648, 1, 1, 1, 1, 1,
0.8679935, -0.1340657, 1.553869, 1, 1, 1, 1, 1,
0.8765689, 1.756044, 1.718853, 1, 1, 1, 1, 1,
0.8777892, 0.7302982, 0.4675998, 1, 1, 1, 1, 1,
0.8796698, 0.3036971, 1.192617, 1, 1, 1, 1, 1,
0.8812751, 0.7308307, 1.715644, 1, 1, 1, 1, 1,
0.8877207, -1.374145, 1.9195, 1, 1, 1, 1, 1,
0.8962699, -1.378782, 0.8799429, 1, 1, 1, 1, 1,
0.8972135, 0.1083432, 1.08059, 1, 1, 1, 1, 1,
0.8997188, 0.725437, -2.02942, 1, 1, 1, 1, 1,
0.902896, -0.2809257, 3.559399, 0, 0, 1, 1, 1,
0.904282, 2.6511, 0.3728213, 1, 0, 0, 1, 1,
0.9076225, -1.893003, 1.627645, 1, 0, 0, 1, 1,
0.9077916, -0.5284887, 2.110944, 1, 0, 0, 1, 1,
0.9085272, 0.1866889, 2.063195, 1, 0, 0, 1, 1,
0.9215838, -1.22583, 2.282734, 1, 0, 0, 1, 1,
0.9224029, 1.34162, 0.03614764, 0, 0, 0, 1, 1,
0.937016, -0.5116808, 2.479416, 0, 0, 0, 1, 1,
0.9389022, -0.9543228, 2.102192, 0, 0, 0, 1, 1,
0.9428395, 1.063188, 1.878142, 0, 0, 0, 1, 1,
0.9432224, -1.332581, 1.968283, 0, 0, 0, 1, 1,
0.9439328, -0.4572675, 0.8268497, 0, 0, 0, 1, 1,
0.9444492, -0.3704517, 0.9430527, 0, 0, 0, 1, 1,
0.9470413, 1.372834, 0.7573426, 1, 1, 1, 1, 1,
0.9507965, 1.720921, 0.2624754, 1, 1, 1, 1, 1,
0.9560664, -0.4226984, 2.081943, 1, 1, 1, 1, 1,
0.9570367, -0.7419313, 2.253422, 1, 1, 1, 1, 1,
0.9598988, -1.63856, 2.946819, 1, 1, 1, 1, 1,
0.9609013, -0.7045073, 2.271322, 1, 1, 1, 1, 1,
0.9627001, 1.538107, 0.489952, 1, 1, 1, 1, 1,
0.9655544, -1.00512, 4.133834, 1, 1, 1, 1, 1,
0.9659865, -0.7775406, 2.406174, 1, 1, 1, 1, 1,
0.9748639, 1.168822, 1.891086, 1, 1, 1, 1, 1,
0.9765763, 0.4590092, -0.5468286, 1, 1, 1, 1, 1,
0.9802665, -2.136307, 3.929532, 1, 1, 1, 1, 1,
0.9978371, -2.076866, 1.893432, 1, 1, 1, 1, 1,
1.006635, -0.05857731, 2.128674, 1, 1, 1, 1, 1,
1.00776, -0.5747066, 3.060423, 1, 1, 1, 1, 1,
1.008122, 0.7977057, 2.219441, 0, 0, 1, 1, 1,
1.008821, -0.2940395, 2.873022, 1, 0, 0, 1, 1,
1.030054, 0.4488885, 0.7853975, 1, 0, 0, 1, 1,
1.031461, 1.39985, -0.5272394, 1, 0, 0, 1, 1,
1.039059, -0.6677606, -0.4121624, 1, 0, 0, 1, 1,
1.040508, 0.1071548, 3.305002, 1, 0, 0, 1, 1,
1.042844, -1.317853, 1.914392, 0, 0, 0, 1, 1,
1.054404, -1.679379, 2.150466, 0, 0, 0, 1, 1,
1.057926, 0.9055301, 1.012425, 0, 0, 0, 1, 1,
1.061199, -1.044899, 0.7867, 0, 0, 0, 1, 1,
1.062478, 1.640065, 0.8506452, 0, 0, 0, 1, 1,
1.063407, -0.2515902, 2.510483, 0, 0, 0, 1, 1,
1.064038, -1.088401, 2.295218, 0, 0, 0, 1, 1,
1.066529, 1.295276, -1.111565, 1, 1, 1, 1, 1,
1.069746, -0.3333932, 2.495551, 1, 1, 1, 1, 1,
1.077638, 1.934504, 0.2008259, 1, 1, 1, 1, 1,
1.077844, -0.7102622, 1.796968, 1, 1, 1, 1, 1,
1.083405, -1.555748, 2.21934, 1, 1, 1, 1, 1,
1.083927, -0.5634052, 0.2817194, 1, 1, 1, 1, 1,
1.087502, -0.6314586, 2.468853, 1, 1, 1, 1, 1,
1.091436, 0.1711526, 0.9711781, 1, 1, 1, 1, 1,
1.091574, 0.4708741, 0.955686, 1, 1, 1, 1, 1,
1.093284, -0.8428294, 1.586182, 1, 1, 1, 1, 1,
1.096284, 0.9599966, 2.507898, 1, 1, 1, 1, 1,
1.103431, -1.002408, 1.304341, 1, 1, 1, 1, 1,
1.106522, 0.1056055, 1.472472, 1, 1, 1, 1, 1,
1.111899, -1.09245, 1.855356, 1, 1, 1, 1, 1,
1.124122, 0.7919526, 1.410171, 1, 1, 1, 1, 1,
1.126022, 0.3123691, 2.949867, 0, 0, 1, 1, 1,
1.130345, -0.06429141, 2.450192, 1, 0, 0, 1, 1,
1.1566, -1.556349, 5.458761, 1, 0, 0, 1, 1,
1.158254, -1.097663, 0.7406146, 1, 0, 0, 1, 1,
1.160067, 1.278251, 1.16441, 1, 0, 0, 1, 1,
1.16497, 0.6258162, 2.178892, 1, 0, 0, 1, 1,
1.168192, 1.241474, 0.7393824, 0, 0, 0, 1, 1,
1.169711, 0.4511282, 2.861934, 0, 0, 0, 1, 1,
1.180726, -1.698582, 2.975001, 0, 0, 0, 1, 1,
1.183095, 0.4470714, 2.21508, 0, 0, 0, 1, 1,
1.191409, 0.272429, -0.1053407, 0, 0, 0, 1, 1,
1.195571, -0.8822979, 2.657382, 0, 0, 0, 1, 1,
1.220993, 1.156558, 0.5453706, 0, 0, 0, 1, 1,
1.221656, -0.3284043, 0.8771657, 1, 1, 1, 1, 1,
1.222409, -2.946316, 3.294705, 1, 1, 1, 1, 1,
1.226726, -0.4101994, 1.830986, 1, 1, 1, 1, 1,
1.231804, 1.173446, 1.766924, 1, 1, 1, 1, 1,
1.237396, -0.2980249, 1.112235, 1, 1, 1, 1, 1,
1.238016, 0.6695088, -0.9673491, 1, 1, 1, 1, 1,
1.247859, -1.029157, 3.1534, 1, 1, 1, 1, 1,
1.249779, -0.5426007, 2.654315, 1, 1, 1, 1, 1,
1.250511, 0.3352827, 0.2136748, 1, 1, 1, 1, 1,
1.253107, 1.635831, 1.015685, 1, 1, 1, 1, 1,
1.254836, -0.2516405, 0.05684109, 1, 1, 1, 1, 1,
1.25946, -2.379517, 0.9252124, 1, 1, 1, 1, 1,
1.264723, 0.006734473, 2.340735, 1, 1, 1, 1, 1,
1.266272, -1.344139, 4.056134, 1, 1, 1, 1, 1,
1.276486, 1.61053, 0.9595362, 1, 1, 1, 1, 1,
1.28218, -0.2185689, 1.294563, 0, 0, 1, 1, 1,
1.283814, -0.4294896, 1.752903, 1, 0, 0, 1, 1,
1.284363, -1.49964, 2.7993, 1, 0, 0, 1, 1,
1.28482, 0.4655701, 0.48305, 1, 0, 0, 1, 1,
1.288844, 0.1835485, -0.5155534, 1, 0, 0, 1, 1,
1.289151, -0.8018046, 1.618456, 1, 0, 0, 1, 1,
1.29396, 0.1034582, 2.220701, 0, 0, 0, 1, 1,
1.300106, -0.1519369, -0.08838056, 0, 0, 0, 1, 1,
1.307605, 0.21754, 2.139579, 0, 0, 0, 1, 1,
1.315258, 0.3499224, -1.490396, 0, 0, 0, 1, 1,
1.315562, 0.6601003, 0.460706, 0, 0, 0, 1, 1,
1.31841, 2.115088, -0.8427684, 0, 0, 0, 1, 1,
1.326931, -1.141836, 4.590194, 0, 0, 0, 1, 1,
1.330767, -0.822881, 2.940258, 1, 1, 1, 1, 1,
1.333258, -1.754579, 2.106909, 1, 1, 1, 1, 1,
1.336947, -1.445833, 2.445693, 1, 1, 1, 1, 1,
1.340796, -0.1776746, 0.1053095, 1, 1, 1, 1, 1,
1.344516, -1.040228, 1.022723, 1, 1, 1, 1, 1,
1.348334, 0.4820606, 2.575885, 1, 1, 1, 1, 1,
1.354152, 1.482977, 2.980637, 1, 1, 1, 1, 1,
1.362487, -1.736682, 2.506728, 1, 1, 1, 1, 1,
1.380177, -0.3675918, 1.792683, 1, 1, 1, 1, 1,
1.381552, 1.474485, 1.741978, 1, 1, 1, 1, 1,
1.392745, -0.4018895, 1.039272, 1, 1, 1, 1, 1,
1.395782, 0.8385072, 2.171629, 1, 1, 1, 1, 1,
1.401612, -0.1654001, 2.515645, 1, 1, 1, 1, 1,
1.407262, -2.701429, 3.000302, 1, 1, 1, 1, 1,
1.409029, 2.055293, 0.9602374, 1, 1, 1, 1, 1,
1.416202, -1.065318, 2.381395, 0, 0, 1, 1, 1,
1.427254, -0.2076574, 1.56499, 1, 0, 0, 1, 1,
1.435041, 0.2631306, 1.730822, 1, 0, 0, 1, 1,
1.440018, -0.9924939, 1.808555, 1, 0, 0, 1, 1,
1.442641, 1.332399, 2.041814, 1, 0, 0, 1, 1,
1.44674, 2.768631, 0.6394132, 1, 0, 0, 1, 1,
1.453021, -0.4131172, 1.872977, 0, 0, 0, 1, 1,
1.455246, -0.3878378, 2.585378, 0, 0, 0, 1, 1,
1.457442, -2.150691, 1.943165, 0, 0, 0, 1, 1,
1.45896, -0.01754207, 0.07863985, 0, 0, 0, 1, 1,
1.459323, -0.4741604, -0.7219168, 0, 0, 0, 1, 1,
1.463741, 0.3255134, 1.44459, 0, 0, 0, 1, 1,
1.466623, 0.2151652, 1.987057, 0, 0, 0, 1, 1,
1.468714, 1.210979, 0.4545294, 1, 1, 1, 1, 1,
1.476894, -1.381556, 1.292393, 1, 1, 1, 1, 1,
1.484783, -0.4920264, 3.674527, 1, 1, 1, 1, 1,
1.511177, 0.5552547, 1.082582, 1, 1, 1, 1, 1,
1.513983, -1.534652, -0.04207402, 1, 1, 1, 1, 1,
1.523855, -0.5261713, 3.170118, 1, 1, 1, 1, 1,
1.526753, -0.4099613, 3.106287, 1, 1, 1, 1, 1,
1.528572, -0.8369418, 1.73763, 1, 1, 1, 1, 1,
1.529719, -0.5233575, 1.816139, 1, 1, 1, 1, 1,
1.535506, -0.2822936, 2.876258, 1, 1, 1, 1, 1,
1.545946, -0.2634124, 2.848832, 1, 1, 1, 1, 1,
1.554332, 0.2815324, -0.9964163, 1, 1, 1, 1, 1,
1.600791, -0.6071485, 2.177931, 1, 1, 1, 1, 1,
1.60896, 0.05669323, 1.995718, 1, 1, 1, 1, 1,
1.61405, 0.9749064, 1.631653, 1, 1, 1, 1, 1,
1.625834, 1.32021, 1.940741, 0, 0, 1, 1, 1,
1.644692, 0.7418686, 2.50623, 1, 0, 0, 1, 1,
1.655379, 0.9749627, 1.579686, 1, 0, 0, 1, 1,
1.658124, -0.08342963, 0.6732454, 1, 0, 0, 1, 1,
1.666395, -1.755417, 2.097443, 1, 0, 0, 1, 1,
1.698879, -1.018958, 1.897375, 1, 0, 0, 1, 1,
1.716822, -0.5792975, -0.7415581, 0, 0, 0, 1, 1,
1.736073, -0.1753816, 1.997962, 0, 0, 0, 1, 1,
1.746412, 2.091561, 1.876648, 0, 0, 0, 1, 1,
1.747856, -1.093597, 2.218488, 0, 0, 0, 1, 1,
1.751224, -0.5480309, 1.203475, 0, 0, 0, 1, 1,
1.764144, -1.280462, 1.358795, 0, 0, 0, 1, 1,
1.776259, 0.1045891, 3.039707, 0, 0, 0, 1, 1,
1.78554, 0.1425872, 0.814368, 1, 1, 1, 1, 1,
1.785761, 0.1263882, 1.610216, 1, 1, 1, 1, 1,
1.796865, 0.7645738, 0.7425404, 1, 1, 1, 1, 1,
1.801382, -0.5873517, 1.989216, 1, 1, 1, 1, 1,
1.818311, -0.04246809, 2.312655, 1, 1, 1, 1, 1,
1.819975, -0.373633, 1.031032, 1, 1, 1, 1, 1,
1.833636, -0.6513517, 0.5715497, 1, 1, 1, 1, 1,
1.84434, -1.981415, 2.219273, 1, 1, 1, 1, 1,
1.848574, 0.2827114, 2.111504, 1, 1, 1, 1, 1,
1.871017, 0.4654286, 0.5031983, 1, 1, 1, 1, 1,
1.881845, 0.3033577, -1.310707, 1, 1, 1, 1, 1,
1.892842, -2.542309, 2.63939, 1, 1, 1, 1, 1,
1.902308, 0.5651114, 2.220847, 1, 1, 1, 1, 1,
1.904312, -0.2548408, 1.507186, 1, 1, 1, 1, 1,
1.911564, 1.102134, 0.450783, 1, 1, 1, 1, 1,
1.941898, -0.9256636, 0.4243684, 0, 0, 1, 1, 1,
1.976991, 0.8622084, 1.463567, 1, 0, 0, 1, 1,
1.98208, 1.336221, 0.9520191, 1, 0, 0, 1, 1,
1.991491, -0.4680119, 4.012177, 1, 0, 0, 1, 1,
1.997641, 0.8842176, 0.7823952, 1, 0, 0, 1, 1,
2.025444, -0.685649, 2.354528, 1, 0, 0, 1, 1,
2.041158, 1.175133, 1.489182, 0, 0, 0, 1, 1,
2.052919, 1.061917, 2.156689, 0, 0, 0, 1, 1,
2.095633, 0.7930048, 1.751235, 0, 0, 0, 1, 1,
2.134182, -0.4175327, 2.177099, 0, 0, 0, 1, 1,
2.178977, 0.6222851, 1.146822, 0, 0, 0, 1, 1,
2.209685, 0.9245057, 0.6410203, 0, 0, 0, 1, 1,
2.253389, -2.274229, 1.62101, 0, 0, 0, 1, 1,
2.261244, 0.5753658, 1.329532, 1, 1, 1, 1, 1,
2.318347, -1.150096, 1.805979, 1, 1, 1, 1, 1,
2.477814, 0.2871926, -0.2685162, 1, 1, 1, 1, 1,
2.524137, 0.9771165, 1.864953, 1, 1, 1, 1, 1,
2.775481, 0.7291555, 2.540797, 1, 1, 1, 1, 1,
3.419728, 0.9610436, 1.697304, 1, 1, 1, 1, 1,
3.931205, 0.349549, 0.8582449, 1, 1, 1, 1, 1
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
var radius = 9.928332;
var distance = 34.87285;
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
mvMatrix.translate( -0.3532281, -0.003815413, 0.2075024 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.87285);
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
