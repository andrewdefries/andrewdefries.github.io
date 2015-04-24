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
-3.278685, 0.1356461, -2.55776, 1, 0, 0, 1,
-3.125817, 1.45719, 0.5552917, 1, 0.007843138, 0, 1,
-2.940997, -1.302488, -2.95906, 1, 0.01176471, 0, 1,
-2.863274, -0.5873899, -3.167456, 1, 0.01960784, 0, 1,
-2.817079, 0.6665601, -0.343287, 1, 0.02352941, 0, 1,
-2.792482, -0.110661, -2.010424, 1, 0.03137255, 0, 1,
-2.65461, 1.523842, -1.745727, 1, 0.03529412, 0, 1,
-2.625473, 1.11738, -2.268995, 1, 0.04313726, 0, 1,
-2.559024, 0.0485261, -1.988877, 1, 0.04705882, 0, 1,
-2.512141, -0.02031758, -1.830441, 1, 0.05490196, 0, 1,
-2.461247, -1.072709, -3.92615, 1, 0.05882353, 0, 1,
-2.422199, 0.36353, -1.25304, 1, 0.06666667, 0, 1,
-2.408401, -1.449845, -3.359482, 1, 0.07058824, 0, 1,
-2.405931, -0.3082972, -2.07923, 1, 0.07843138, 0, 1,
-2.379897, 1.705025, -2.166689, 1, 0.08235294, 0, 1,
-2.340928, 0.932705, 0.1474235, 1, 0.09019608, 0, 1,
-2.298436, -0.8276123, -0.8416981, 1, 0.09411765, 0, 1,
-2.273667, -0.2261313, -1.848761, 1, 0.1019608, 0, 1,
-2.271211, 2.475038, -1.878739, 1, 0.1098039, 0, 1,
-2.222341, -0.0971821, -2.597085, 1, 0.1137255, 0, 1,
-2.221461, -0.1735985, -2.891157, 1, 0.1215686, 0, 1,
-2.192345, -0.8319174, -1.921201, 1, 0.1254902, 0, 1,
-2.146178, -0.5103173, -3.723354, 1, 0.1333333, 0, 1,
-2.073673, -0.9397013, -1.959885, 1, 0.1372549, 0, 1,
-2.071623, 1.336302, -1.028134, 1, 0.145098, 0, 1,
-2.005831, 0.4912972, -2.053609, 1, 0.1490196, 0, 1,
-1.971578, -1.614824, -3.442973, 1, 0.1568628, 0, 1,
-1.96344, -0.9112453, -1.500111, 1, 0.1607843, 0, 1,
-1.953417, -1.122042, -2.551996, 1, 0.1686275, 0, 1,
-1.929883, -0.9604475, -0.7681273, 1, 0.172549, 0, 1,
-1.929045, -0.825406, -0.7292045, 1, 0.1803922, 0, 1,
-1.889673, 0.7934146, -2.508808, 1, 0.1843137, 0, 1,
-1.862809, 1.012397, -0.1588152, 1, 0.1921569, 0, 1,
-1.862298, -0.05690527, -0.7607555, 1, 0.1960784, 0, 1,
-1.823415, -0.6022204, -1.417625, 1, 0.2039216, 0, 1,
-1.810738, 2.386885, 0.1528393, 1, 0.2117647, 0, 1,
-1.802778, -1.356967, -0.7515898, 1, 0.2156863, 0, 1,
-1.796927, 0.743999, -0.5379962, 1, 0.2235294, 0, 1,
-1.771212, -0.02633036, -1.589912, 1, 0.227451, 0, 1,
-1.770919, -0.9484836, -1.675967, 1, 0.2352941, 0, 1,
-1.762399, 0.9504924, -1.586621, 1, 0.2392157, 0, 1,
-1.760499, 1.534169, -0.780513, 1, 0.2470588, 0, 1,
-1.759645, -0.1885719, -1.665159, 1, 0.2509804, 0, 1,
-1.755436, 1.256855, -1.768666, 1, 0.2588235, 0, 1,
-1.746925, 2.117429, 0.9055175, 1, 0.2627451, 0, 1,
-1.736657, -1.982882, -2.107971, 1, 0.2705882, 0, 1,
-1.685968, -0.492538, -3.38854, 1, 0.2745098, 0, 1,
-1.683326, 0.882651, 0.1403322, 1, 0.282353, 0, 1,
-1.680375, 0.6113224, -2.490231, 1, 0.2862745, 0, 1,
-1.663027, -0.3102447, -2.97248, 1, 0.2941177, 0, 1,
-1.661888, 0.8536693, -2.059237, 1, 0.3019608, 0, 1,
-1.646739, 0.3836407, -2.269522, 1, 0.3058824, 0, 1,
-1.639001, -0.672808, -1.028504, 1, 0.3137255, 0, 1,
-1.629936, 1.113032, 0.2846492, 1, 0.3176471, 0, 1,
-1.616171, -0.7388378, -1.555502, 1, 0.3254902, 0, 1,
-1.6111, 0.5145577, -0.5281577, 1, 0.3294118, 0, 1,
-1.608567, -1.209219, -4.563861, 1, 0.3372549, 0, 1,
-1.600788, -2.739147, -0.4630139, 1, 0.3411765, 0, 1,
-1.600282, 0.8811567, -1.558601, 1, 0.3490196, 0, 1,
-1.599877, -0.389158, -1.599754, 1, 0.3529412, 0, 1,
-1.595412, 0.3488842, -1.544862, 1, 0.3607843, 0, 1,
-1.567272, 0.5182767, -0.3860882, 1, 0.3647059, 0, 1,
-1.560498, -0.8659095, -3.026906, 1, 0.372549, 0, 1,
-1.554364, -0.2616471, -1.726652, 1, 0.3764706, 0, 1,
-1.547688, 1.372393, -1.879532, 1, 0.3843137, 0, 1,
-1.547627, -1.07794, -1.396622, 1, 0.3882353, 0, 1,
-1.542163, -0.3168418, -0.4179912, 1, 0.3960784, 0, 1,
-1.538717, -0.8397837, -2.303154, 1, 0.4039216, 0, 1,
-1.532513, 1.291264, -1.110687, 1, 0.4078431, 0, 1,
-1.526385, -0.3687777, -2.631759, 1, 0.4156863, 0, 1,
-1.519839, 1.343814, -0.490919, 1, 0.4196078, 0, 1,
-1.518011, 0.7201005, -0.1365124, 1, 0.427451, 0, 1,
-1.513626, -0.3096229, -1.13496, 1, 0.4313726, 0, 1,
-1.495264, 0.9324048, -1.271206, 1, 0.4392157, 0, 1,
-1.493656, 1.258105, -0.4009166, 1, 0.4431373, 0, 1,
-1.493386, 0.5674502, -3.674504, 1, 0.4509804, 0, 1,
-1.480994, 0.2614055, -1.658696, 1, 0.454902, 0, 1,
-1.460074, 0.2299088, -1.931424, 1, 0.4627451, 0, 1,
-1.45429, 0.7605894, -2.39257, 1, 0.4666667, 0, 1,
-1.445527, 0.8473299, -1.495744, 1, 0.4745098, 0, 1,
-1.441741, 0.7276175, -0.4918225, 1, 0.4784314, 0, 1,
-1.440838, -1.16393, -3.919334, 1, 0.4862745, 0, 1,
-1.437343, 0.45783, -0.136581, 1, 0.4901961, 0, 1,
-1.435388, 0.2340749, -1.393023, 1, 0.4980392, 0, 1,
-1.426868, 0.2786365, -0.3374813, 1, 0.5058824, 0, 1,
-1.417631, -1.178872, -2.256839, 1, 0.509804, 0, 1,
-1.416965, -0.02250995, -1.182296, 1, 0.5176471, 0, 1,
-1.415775, -0.6356996, -3.394935, 1, 0.5215687, 0, 1,
-1.412713, -0.7076082, -3.232663, 1, 0.5294118, 0, 1,
-1.396532, -2.523488, -1.175631, 1, 0.5333334, 0, 1,
-1.391912, 0.06834415, -0.5081475, 1, 0.5411765, 0, 1,
-1.37129, -0.2358098, 0.07892267, 1, 0.5450981, 0, 1,
-1.36438, 1.132486, -1.383432, 1, 0.5529412, 0, 1,
-1.363166, 0.5021526, -1.383872, 1, 0.5568628, 0, 1,
-1.362758, -0.4601993, -3.8402, 1, 0.5647059, 0, 1,
-1.348821, -0.3943458, -2.435564, 1, 0.5686275, 0, 1,
-1.345671, 0.3459377, 0.986964, 1, 0.5764706, 0, 1,
-1.334904, -2.239362, -1.592967, 1, 0.5803922, 0, 1,
-1.328812, -0.2117719, -0.578703, 1, 0.5882353, 0, 1,
-1.317089, -0.316366, -1.916988, 1, 0.5921569, 0, 1,
-1.316737, 0.1333866, -1.215678, 1, 0.6, 0, 1,
-1.316237, -0.0002462229, -2.514385, 1, 0.6078432, 0, 1,
-1.316118, -0.2358548, -3.007565, 1, 0.6117647, 0, 1,
-1.309703, -0.4952112, -2.666792, 1, 0.6196079, 0, 1,
-1.283759, 0.8301024, -0.7067919, 1, 0.6235294, 0, 1,
-1.282246, 0.9748488, -1.787852, 1, 0.6313726, 0, 1,
-1.281973, -2.944511, -2.262042, 1, 0.6352941, 0, 1,
-1.281134, -1.611309, -2.58937, 1, 0.6431373, 0, 1,
-1.278595, -0.4170887, 0.09324805, 1, 0.6470588, 0, 1,
-1.269505, 0.9178924, -2.067929, 1, 0.654902, 0, 1,
-1.2655, 0.06874241, -0.1809291, 1, 0.6588235, 0, 1,
-1.264793, -0.0947229, -1.566257, 1, 0.6666667, 0, 1,
-1.258817, -1.483545, -2.335405, 1, 0.6705883, 0, 1,
-1.257278, -0.08425041, -2.622229, 1, 0.6784314, 0, 1,
-1.250896, -0.1058047, -0.8549494, 1, 0.682353, 0, 1,
-1.250713, -1.545963, 0.3144612, 1, 0.6901961, 0, 1,
-1.24554, 0.2981478, -1.29076, 1, 0.6941177, 0, 1,
-1.236727, -0.2834644, -1.745334, 1, 0.7019608, 0, 1,
-1.230515, -0.2724559, -1.07516, 1, 0.7098039, 0, 1,
-1.226285, -0.4346528, -1.977148, 1, 0.7137255, 0, 1,
-1.219375, -0.2899151, -2.408556, 1, 0.7215686, 0, 1,
-1.200679, 1.993267, 0.9240192, 1, 0.7254902, 0, 1,
-1.19454, 1.547097, 0.5804871, 1, 0.7333333, 0, 1,
-1.190128, -0.08124633, -1.14233, 1, 0.7372549, 0, 1,
-1.181402, -0.5913442, -0.7015252, 1, 0.7450981, 0, 1,
-1.177371, -0.7198946, -4.240631, 1, 0.7490196, 0, 1,
-1.170484, 0.941252, -3.647616, 1, 0.7568628, 0, 1,
-1.167915, -0.0179201, -2.510867, 1, 0.7607843, 0, 1,
-1.159009, -1.079828, -1.248183, 1, 0.7686275, 0, 1,
-1.150274, 0.4418109, -2.410408, 1, 0.772549, 0, 1,
-1.144042, 2.062759, 1.021229, 1, 0.7803922, 0, 1,
-1.137803, 1.495749, 0.04336612, 1, 0.7843137, 0, 1,
-1.131338, 0.3402034, -2.066972, 1, 0.7921569, 0, 1,
-1.130352, -0.7466138, -1.13696, 1, 0.7960784, 0, 1,
-1.124236, -0.2940051, -2.832745, 1, 0.8039216, 0, 1,
-1.115598, -0.7277902, -2.482035, 1, 0.8117647, 0, 1,
-1.114186, -0.6780453, -2.362051, 1, 0.8156863, 0, 1,
-1.101379, -0.93857, -2.439759, 1, 0.8235294, 0, 1,
-1.098877, 0.03359443, -0.7597529, 1, 0.827451, 0, 1,
-1.086668, 0.4971884, -0.263529, 1, 0.8352941, 0, 1,
-1.084347, 0.6025956, -0.9719345, 1, 0.8392157, 0, 1,
-1.084204, 0.3742946, -0.6907964, 1, 0.8470588, 0, 1,
-1.079792, -0.19417, -1.352079, 1, 0.8509804, 0, 1,
-1.078943, 0.4161296, -0.6955834, 1, 0.8588235, 0, 1,
-1.07813, 0.2413002, -0.09799494, 1, 0.8627451, 0, 1,
-1.07598, -0.5697016, -2.767176, 1, 0.8705882, 0, 1,
-1.074348, -0.5971144, -3.709508, 1, 0.8745098, 0, 1,
-1.070201, -1.973994, -2.730799, 1, 0.8823529, 0, 1,
-1.065165, 0.182544, -2.946414, 1, 0.8862745, 0, 1,
-1.054977, 0.6611817, -0.7048439, 1, 0.8941177, 0, 1,
-1.044397, 0.04667101, -2.028522, 1, 0.8980392, 0, 1,
-1.032783, 0.7066805, -1.796124, 1, 0.9058824, 0, 1,
-1.026368, 0.7628519, -1.133494, 1, 0.9137255, 0, 1,
-1.020642, 0.3395192, -0.5818322, 1, 0.9176471, 0, 1,
-1.018925, -0.2949079, -3.856916, 1, 0.9254902, 0, 1,
-1.013451, 1.698918, -0.1641157, 1, 0.9294118, 0, 1,
-1.006572, -0.02663839, -0.1370365, 1, 0.9372549, 0, 1,
-1.005296, 1.672375, -1.59472, 1, 0.9411765, 0, 1,
-1.003045, 0.8514919, -1.113862, 1, 0.9490196, 0, 1,
-1.001779, 0.5646471, -0.5070414, 1, 0.9529412, 0, 1,
-0.9998672, 0.143745, -3.06876, 1, 0.9607843, 0, 1,
-0.9984494, -1.146152, -3.335639, 1, 0.9647059, 0, 1,
-0.9959748, -0.6194331, -1.175208, 1, 0.972549, 0, 1,
-0.9914699, 0.0664788, -0.6709005, 1, 0.9764706, 0, 1,
-0.9913406, -0.7899931, -3.028607, 1, 0.9843137, 0, 1,
-0.9897515, -0.07774811, -3.438961, 1, 0.9882353, 0, 1,
-0.9862286, 0.7816477, 0.9194943, 1, 0.9960784, 0, 1,
-0.9826419, 0.9330146, 1.372746, 0.9960784, 1, 0, 1,
-0.9793437, -0.03745355, -0.09630461, 0.9921569, 1, 0, 1,
-0.9586669, 1.504631, 0.4212798, 0.9843137, 1, 0, 1,
-0.9554071, -0.9770365, -1.92431, 0.9803922, 1, 0, 1,
-0.9540914, 0.7103032, -1.766103, 0.972549, 1, 0, 1,
-0.9506425, -0.4291731, -5.191444, 0.9686275, 1, 0, 1,
-0.9498809, -0.18815, -1.682053, 0.9607843, 1, 0, 1,
-0.9440157, -0.02664524, -2.255488, 0.9568627, 1, 0, 1,
-0.9310348, -0.5820481, -2.799056, 0.9490196, 1, 0, 1,
-0.9190267, 0.2391091, -1.310407, 0.945098, 1, 0, 1,
-0.9184807, -1.504834, -2.39868, 0.9372549, 1, 0, 1,
-0.9182853, -0.7835997, -2.129603, 0.9333333, 1, 0, 1,
-0.913972, 0.6346904, -0.9336045, 0.9254902, 1, 0, 1,
-0.9059276, -0.1386549, -1.625704, 0.9215686, 1, 0, 1,
-0.8946247, 1.643421, 0.650665, 0.9137255, 1, 0, 1,
-0.8933946, 0.627839, -1.544687, 0.9098039, 1, 0, 1,
-0.8920318, -0.4272603, -3.77888, 0.9019608, 1, 0, 1,
-0.8687354, 0.3977872, -2.139922, 0.8941177, 1, 0, 1,
-0.8599982, 2.139089, -0.8436741, 0.8901961, 1, 0, 1,
-0.854076, -0.6283059, -2.171828, 0.8823529, 1, 0, 1,
-0.853267, -0.06008535, -1.671937, 0.8784314, 1, 0, 1,
-0.8510654, 0.5209577, -0.4709278, 0.8705882, 1, 0, 1,
-0.8505935, -1.027078, -2.184397, 0.8666667, 1, 0, 1,
-0.8485234, 0.3876818, -2.115899, 0.8588235, 1, 0, 1,
-0.8398692, -0.9670237, -3.973037, 0.854902, 1, 0, 1,
-0.8397201, 0.4720275, -0.3151399, 0.8470588, 1, 0, 1,
-0.8365735, -0.6569005, -1.717733, 0.8431373, 1, 0, 1,
-0.8307762, 0.7833571, -1.082943, 0.8352941, 1, 0, 1,
-0.8262143, 0.7631755, -1.574459, 0.8313726, 1, 0, 1,
-0.825208, -0.5659015, -3.020659, 0.8235294, 1, 0, 1,
-0.8227502, 0.1155308, -1.481185, 0.8196079, 1, 0, 1,
-0.821566, -0.190364, -3.55804, 0.8117647, 1, 0, 1,
-0.8187511, -1.499477, -2.063828, 0.8078431, 1, 0, 1,
-0.8173661, -0.001390435, -2.279288, 0.8, 1, 0, 1,
-0.817071, -0.4546136, -1.839554, 0.7921569, 1, 0, 1,
-0.817014, -0.3404998, -2.219034, 0.7882353, 1, 0, 1,
-0.8140128, -0.9350902, -3.493073, 0.7803922, 1, 0, 1,
-0.809011, 1.973577, -0.1105209, 0.7764706, 1, 0, 1,
-0.8076388, 1.323913, -2.437822, 0.7686275, 1, 0, 1,
-0.8061289, -1.049827, -2.145724, 0.7647059, 1, 0, 1,
-0.8052058, 0.8240898, -0.5781835, 0.7568628, 1, 0, 1,
-0.7900668, 0.8300075, -1.947697, 0.7529412, 1, 0, 1,
-0.7893143, -0.6762441, -3.300084, 0.7450981, 1, 0, 1,
-0.7884412, 1.085664, 0.0113755, 0.7411765, 1, 0, 1,
-0.7843714, -0.2140631, -3.141367, 0.7333333, 1, 0, 1,
-0.7827466, 0.09498302, -3.273769, 0.7294118, 1, 0, 1,
-0.7810177, 0.1987396, -1.437016, 0.7215686, 1, 0, 1,
-0.7792793, -0.3984421, -1.860149, 0.7176471, 1, 0, 1,
-0.775088, 1.14902, 1.083894, 0.7098039, 1, 0, 1,
-0.7682366, -0.1078023, -1.51044, 0.7058824, 1, 0, 1,
-0.7664689, -0.3473628, -3.1786, 0.6980392, 1, 0, 1,
-0.7616401, 1.746849, 0.1713497, 0.6901961, 1, 0, 1,
-0.7578189, 1.528164, -0.4431317, 0.6862745, 1, 0, 1,
-0.7564142, -0.3845156, -2.443893, 0.6784314, 1, 0, 1,
-0.7548965, 1.160873, -1.975902, 0.6745098, 1, 0, 1,
-0.7506511, 1.794666, -0.08103224, 0.6666667, 1, 0, 1,
-0.7504333, 1.585869, -1.533663, 0.6627451, 1, 0, 1,
-0.7468158, -0.4385991, -1.64378, 0.654902, 1, 0, 1,
-0.7467713, -0.7034076, -3.109087, 0.6509804, 1, 0, 1,
-0.7466405, -0.9400893, -3.358752, 0.6431373, 1, 0, 1,
-0.7356258, -1.162068, -3.022155, 0.6392157, 1, 0, 1,
-0.7342755, 1.120548, -0.4956069, 0.6313726, 1, 0, 1,
-0.733281, -0.1602915, 0.1753358, 0.627451, 1, 0, 1,
-0.7314585, -0.4214149, -0.5140414, 0.6196079, 1, 0, 1,
-0.7303925, 0.3055397, -0.238895, 0.6156863, 1, 0, 1,
-0.7217218, -2.151058, -3.277242, 0.6078432, 1, 0, 1,
-0.7201856, 0.239808, -2.08285, 0.6039216, 1, 0, 1,
-0.7169443, -0.763285, -2.517647, 0.5960785, 1, 0, 1,
-0.7165121, -0.7053522, -3.963418, 0.5882353, 1, 0, 1,
-0.7144686, 0.515826, -1.037825, 0.5843138, 1, 0, 1,
-0.7133764, -0.1633287, -0.4940969, 0.5764706, 1, 0, 1,
-0.709369, -0.2892374, -3.988042, 0.572549, 1, 0, 1,
-0.7077973, 0.1902077, -1.284029, 0.5647059, 1, 0, 1,
-0.7069347, 0.3273064, -0.9667624, 0.5607843, 1, 0, 1,
-0.7031597, 0.8746932, -0.09239335, 0.5529412, 1, 0, 1,
-0.701, -0.7837777, -2.494838, 0.5490196, 1, 0, 1,
-0.7002268, 0.7647056, -1.318638, 0.5411765, 1, 0, 1,
-0.6989136, -1.278943, -0.5695031, 0.5372549, 1, 0, 1,
-0.6985614, 0.2700295, -1.085864, 0.5294118, 1, 0, 1,
-0.6973025, 1.7647, -0.5466642, 0.5254902, 1, 0, 1,
-0.6970001, 1.441644, 0.09447508, 0.5176471, 1, 0, 1,
-0.6931562, -0.2309172, -2.227922, 0.5137255, 1, 0, 1,
-0.6897312, 0.7171292, -1.277189, 0.5058824, 1, 0, 1,
-0.6890409, -0.8093168, -3.702945, 0.5019608, 1, 0, 1,
-0.6878352, -1.580638, -0.09144549, 0.4941176, 1, 0, 1,
-0.6873981, -0.2064883, -2.488371, 0.4862745, 1, 0, 1,
-0.6869063, 1.319681, 0.09531916, 0.4823529, 1, 0, 1,
-0.6836438, 0.0513527, -2.174014, 0.4745098, 1, 0, 1,
-0.6833209, 1.112561, -0.2923843, 0.4705882, 1, 0, 1,
-0.6829334, -0.02731058, -2.525538, 0.4627451, 1, 0, 1,
-0.679528, -1.101812, -1.399667, 0.4588235, 1, 0, 1,
-0.6779981, -0.3303117, -0.7698083, 0.4509804, 1, 0, 1,
-0.6776596, 0.3310294, -2.332961, 0.4470588, 1, 0, 1,
-0.6723375, 1.064843, -1.252641, 0.4392157, 1, 0, 1,
-0.6705543, 0.7267386, -1.287144, 0.4352941, 1, 0, 1,
-0.6698411, 0.6057734, -0.4760808, 0.427451, 1, 0, 1,
-0.6681514, 0.1666568, 0.1021046, 0.4235294, 1, 0, 1,
-0.665445, -0.9227166, -2.666768, 0.4156863, 1, 0, 1,
-0.6650622, 0.01587126, -2.05055, 0.4117647, 1, 0, 1,
-0.6621875, 0.8189849, -0.7560636, 0.4039216, 1, 0, 1,
-0.6597096, 0.8248777, -1.187661, 0.3960784, 1, 0, 1,
-0.6591979, 0.7989851, -0.9757013, 0.3921569, 1, 0, 1,
-0.6475384, 0.629087, 0.5980148, 0.3843137, 1, 0, 1,
-0.6473776, -0.8412356, -1.904228, 0.3803922, 1, 0, 1,
-0.6424938, -0.6660293, -0.9835781, 0.372549, 1, 0, 1,
-0.6384076, -1.044005, -3.50445, 0.3686275, 1, 0, 1,
-0.6317176, -0.7129138, -2.154465, 0.3607843, 1, 0, 1,
-0.6310071, 0.7724094, -1.302396, 0.3568628, 1, 0, 1,
-0.6268464, 1.630677, -0.3398725, 0.3490196, 1, 0, 1,
-0.6173683, -0.05074754, -0.476684, 0.345098, 1, 0, 1,
-0.6163141, 0.0638513, -2.502985, 0.3372549, 1, 0, 1,
-0.6103225, 1.402024, -1.376544, 0.3333333, 1, 0, 1,
-0.6017304, 1.059403, -0.04172728, 0.3254902, 1, 0, 1,
-0.596728, -1.555716, -1.806804, 0.3215686, 1, 0, 1,
-0.5956029, -0.4704123, -1.430272, 0.3137255, 1, 0, 1,
-0.5911689, -0.07438815, -0.8386585, 0.3098039, 1, 0, 1,
-0.5911614, 0.152813, -2.483599, 0.3019608, 1, 0, 1,
-0.5856385, 0.3938719, -1.56521, 0.2941177, 1, 0, 1,
-0.5841758, -1.02795, -1.472868, 0.2901961, 1, 0, 1,
-0.5814002, -0.7302466, -3.247449, 0.282353, 1, 0, 1,
-0.5748621, 1.099985, 0.30529, 0.2784314, 1, 0, 1,
-0.5659894, 0.5288066, -0.5532039, 0.2705882, 1, 0, 1,
-0.5653911, -1.616281, -4.730781, 0.2666667, 1, 0, 1,
-0.56264, 1.301557, 0.9782375, 0.2588235, 1, 0, 1,
-0.5625248, -0.7604818, -2.079917, 0.254902, 1, 0, 1,
-0.5610104, 0.923141, -0.182836, 0.2470588, 1, 0, 1,
-0.5567009, -1.513618, -3.410218, 0.2431373, 1, 0, 1,
-0.5524218, -0.5449524, -2.062668, 0.2352941, 1, 0, 1,
-0.5516694, -0.3838675, -3.199236, 0.2313726, 1, 0, 1,
-0.5490397, 1.145231, -1.404389, 0.2235294, 1, 0, 1,
-0.5429227, 1.679517, 0.6977278, 0.2196078, 1, 0, 1,
-0.5410432, 2.059155, -0.2738251, 0.2117647, 1, 0, 1,
-0.5388112, -0.8014534, -2.548184, 0.2078431, 1, 0, 1,
-0.5358554, -1.58639, -2.398096, 0.2, 1, 0, 1,
-0.5317081, -2.083322, -3.583288, 0.1921569, 1, 0, 1,
-0.5294723, -1.182936, -3.011396, 0.1882353, 1, 0, 1,
-0.5289331, 0.3497149, -0.9738988, 0.1803922, 1, 0, 1,
-0.5270562, 0.1976213, 0.07377159, 0.1764706, 1, 0, 1,
-0.5266368, 0.4438335, -1.267101, 0.1686275, 1, 0, 1,
-0.5225358, 2.200141, 1.286494, 0.1647059, 1, 0, 1,
-0.5216662, 0.3805826, -0.6592924, 0.1568628, 1, 0, 1,
-0.5202733, 0.6634951, 0.8517801, 0.1529412, 1, 0, 1,
-0.5188681, 0.6825902, -0.7178445, 0.145098, 1, 0, 1,
-0.5175443, 1.261436, -2.05862, 0.1411765, 1, 0, 1,
-0.514747, 0.4622549, -0.6590291, 0.1333333, 1, 0, 1,
-0.5134421, 0.3380674, -0.7470655, 0.1294118, 1, 0, 1,
-0.5043337, 1.439307, 0.009307646, 0.1215686, 1, 0, 1,
-0.5040516, -0.8349699, -4.293836, 0.1176471, 1, 0, 1,
-0.501219, -0.1073591, -3.946462, 0.1098039, 1, 0, 1,
-0.5009184, -0.6786211, -3.896733, 0.1058824, 1, 0, 1,
-0.4994602, -1.450806, -3.759279, 0.09803922, 1, 0, 1,
-0.4930755, 0.519456, -0.4438127, 0.09019608, 1, 0, 1,
-0.4878175, -0.5556462, -1.857397, 0.08627451, 1, 0, 1,
-0.4864152, -0.5009773, -2.851722, 0.07843138, 1, 0, 1,
-0.4861016, 0.6197395, -0.7917864, 0.07450981, 1, 0, 1,
-0.4802061, -1.334959, -2.655471, 0.06666667, 1, 0, 1,
-0.4792584, 0.1183288, -0.5340695, 0.0627451, 1, 0, 1,
-0.4778974, -1.983268, -4.253911, 0.05490196, 1, 0, 1,
-0.4748182, 1.572343, -1.335739, 0.05098039, 1, 0, 1,
-0.4745654, -0.4591762, -3.05429, 0.04313726, 1, 0, 1,
-0.4722008, 0.8244639, -0.7546745, 0.03921569, 1, 0, 1,
-0.4675553, -0.6107224, -3.011697, 0.03137255, 1, 0, 1,
-0.462905, 0.4810956, -0.6289358, 0.02745098, 1, 0, 1,
-0.4590029, 0.1886666, -2.103765, 0.01960784, 1, 0, 1,
-0.4567125, -0.117499, -0.170208, 0.01568628, 1, 0, 1,
-0.454767, -0.08548348, -2.46591, 0.007843138, 1, 0, 1,
-0.4539334, -1.32627, -3.40755, 0.003921569, 1, 0, 1,
-0.4525461, 0.09330868, -1.270795, 0, 1, 0.003921569, 1,
-0.4512686, 1.400454, -0.1469885, 0, 1, 0.01176471, 1,
-0.4498779, -0.2142888, -2.820735, 0, 1, 0.01568628, 1,
-0.446813, -0.4354645, -1.7272, 0, 1, 0.02352941, 1,
-0.4460698, 0.006508961, -1.893098, 0, 1, 0.02745098, 1,
-0.4453671, 1.238194, -1.823675, 0, 1, 0.03529412, 1,
-0.4363611, -0.07130645, -1.085498, 0, 1, 0.03921569, 1,
-0.4352978, -0.002296282, -1.144412, 0, 1, 0.04705882, 1,
-0.4334275, -0.8298611, -2.388172, 0, 1, 0.05098039, 1,
-0.4333515, -0.6523746, -2.784828, 0, 1, 0.05882353, 1,
-0.4322279, -0.8537007, -1.808475, 0, 1, 0.0627451, 1,
-0.429664, 1.617842, -1.106349, 0, 1, 0.07058824, 1,
-0.4266983, -0.02837747, -1.004735, 0, 1, 0.07450981, 1,
-0.426531, 0.1289776, -0.2497025, 0, 1, 0.08235294, 1,
-0.4262571, -0.2655072, -1.733743, 0, 1, 0.08627451, 1,
-0.4192268, 0.1088588, 0.5393818, 0, 1, 0.09411765, 1,
-0.4185812, 1.465799, -0.6808799, 0, 1, 0.1019608, 1,
-0.4163712, -0.115135, -1.788037, 0, 1, 0.1058824, 1,
-0.4131284, 1.198344, 1.741323, 0, 1, 0.1137255, 1,
-0.4123107, 0.1586198, -0.06206098, 0, 1, 0.1176471, 1,
-0.4073283, -0.3535002, -3.951021, 0, 1, 0.1254902, 1,
-0.4072104, 0.2001475, 0.1009841, 0, 1, 0.1294118, 1,
-0.40583, -0.07339597, -3.330769, 0, 1, 0.1372549, 1,
-0.4055316, -0.4073405, -1.850921, 0, 1, 0.1411765, 1,
-0.3909687, -0.05300646, -1.348001, 0, 1, 0.1490196, 1,
-0.3885568, 0.5822802, -0.007829905, 0, 1, 0.1529412, 1,
-0.386872, 1.764356, -0.4052103, 0, 1, 0.1607843, 1,
-0.3833532, 0.5606692, -1.90984, 0, 1, 0.1647059, 1,
-0.3799788, 1.559393, -1.148556, 0, 1, 0.172549, 1,
-0.3785269, -0.1781087, -2.424726, 0, 1, 0.1764706, 1,
-0.377547, -0.1125745, -1.421432, 0, 1, 0.1843137, 1,
-0.3729286, -0.7396778, -1.6735, 0, 1, 0.1882353, 1,
-0.3717126, -0.1703556, -2.959848, 0, 1, 0.1960784, 1,
-0.3716043, 1.092163, -1.140155, 0, 1, 0.2039216, 1,
-0.3693823, -0.5250453, -2.588038, 0, 1, 0.2078431, 1,
-0.3637325, 0.1729382, -0.7775656, 0, 1, 0.2156863, 1,
-0.3623021, -0.3154047, -2.627017, 0, 1, 0.2196078, 1,
-0.3616455, -0.4656691, -1.758663, 0, 1, 0.227451, 1,
-0.3610196, -0.01108101, -1.618333, 0, 1, 0.2313726, 1,
-0.3574817, -0.7114623, -2.154144, 0, 1, 0.2392157, 1,
-0.3560153, 0.6065127, 0.4697553, 0, 1, 0.2431373, 1,
-0.3517542, -0.6095189, -4.487591, 0, 1, 0.2509804, 1,
-0.3493085, 1.622601, -0.6587266, 0, 1, 0.254902, 1,
-0.3458395, 1.308942, -0.3467223, 0, 1, 0.2627451, 1,
-0.3445047, 1.110152, 0.5095408, 0, 1, 0.2666667, 1,
-0.343175, 0.1302636, -0.01305805, 0, 1, 0.2745098, 1,
-0.3404216, 0.9342937, -0.5007606, 0, 1, 0.2784314, 1,
-0.3366279, -1.165179, -2.966121, 0, 1, 0.2862745, 1,
-0.3312978, 0.5077696, -0.4758423, 0, 1, 0.2901961, 1,
-0.3290425, 1.534639, -1.320617, 0, 1, 0.2980392, 1,
-0.3267812, -1.316426, -3.261775, 0, 1, 0.3058824, 1,
-0.3259274, -0.8563877, -2.318738, 0, 1, 0.3098039, 1,
-0.3233528, 0.2462448, -1.760554, 0, 1, 0.3176471, 1,
-0.3182476, 0.2675571, -2.028006, 0, 1, 0.3215686, 1,
-0.3179196, -0.3893764, -2.81987, 0, 1, 0.3294118, 1,
-0.3169573, -2.260509, -1.988981, 0, 1, 0.3333333, 1,
-0.3163288, -1.181767, -2.541454, 0, 1, 0.3411765, 1,
-0.3151632, -0.3786148, -3.60675, 0, 1, 0.345098, 1,
-0.312603, 0.1619186, 0.02545824, 0, 1, 0.3529412, 1,
-0.3122833, -0.02160714, -1.161964, 0, 1, 0.3568628, 1,
-0.310184, -1.208626, -3.790615, 0, 1, 0.3647059, 1,
-0.3069977, -0.9611815, -1.79081, 0, 1, 0.3686275, 1,
-0.3044848, -0.580816, -4.424157, 0, 1, 0.3764706, 1,
-0.3043792, -0.7837561, -3.276939, 0, 1, 0.3803922, 1,
-0.3003435, -1.375451, -4.663172, 0, 1, 0.3882353, 1,
-0.2987446, -1.468027, -2.909887, 0, 1, 0.3921569, 1,
-0.2985554, -0.5751077, -2.742797, 0, 1, 0.4, 1,
-0.297119, -0.4278336, -2.869215, 0, 1, 0.4078431, 1,
-0.2963833, -0.8287847, -2.623907, 0, 1, 0.4117647, 1,
-0.2959169, -1.293862, -1.130061, 0, 1, 0.4196078, 1,
-0.2955373, -1.167079, -2.686801, 0, 1, 0.4235294, 1,
-0.2939777, -1.839255, -3.062641, 0, 1, 0.4313726, 1,
-0.2894575, 2.799553, -1.157261, 0, 1, 0.4352941, 1,
-0.2874258, 1.442111, -1.26999, 0, 1, 0.4431373, 1,
-0.2855569, -1.965383, -3.708496, 0, 1, 0.4470588, 1,
-0.2849724, -0.6894428, -2.718111, 0, 1, 0.454902, 1,
-0.2835277, 0.6524397, 1.191914, 0, 1, 0.4588235, 1,
-0.2822396, 2.41421, 1.34474, 0, 1, 0.4666667, 1,
-0.2796991, 0.2173147, -1.530728, 0, 1, 0.4705882, 1,
-0.2789594, 0.1752932, -0.2596348, 0, 1, 0.4784314, 1,
-0.2748677, 0.690051, -0.9877733, 0, 1, 0.4823529, 1,
-0.2732589, 0.4494154, 0.462946, 0, 1, 0.4901961, 1,
-0.2646561, -0.1286899, -2.343597, 0, 1, 0.4941176, 1,
-0.2597403, -0.9869629, -2.806387, 0, 1, 0.5019608, 1,
-0.2582858, 0.8245081, -0.1448489, 0, 1, 0.509804, 1,
-0.2545563, -0.185685, -1.543543, 0, 1, 0.5137255, 1,
-0.252271, -0.9498901, -2.948082, 0, 1, 0.5215687, 1,
-0.2483685, -0.8768447, -1.615643, 0, 1, 0.5254902, 1,
-0.2470614, 1.827951, -0.8528768, 0, 1, 0.5333334, 1,
-0.2448256, 1.960384, -2.182845, 0, 1, 0.5372549, 1,
-0.2426392, 0.3731131, 0.3086113, 0, 1, 0.5450981, 1,
-0.2406653, -1.16693, -2.37219, 0, 1, 0.5490196, 1,
-0.2398464, 0.2897765, -1.068413, 0, 1, 0.5568628, 1,
-0.2392702, -1.76245, -0.8098015, 0, 1, 0.5607843, 1,
-0.2390535, -0.2675222, -4.162436, 0, 1, 0.5686275, 1,
-0.2358028, 0.2533326, 1.629116, 0, 1, 0.572549, 1,
-0.2337922, 1.553871, -0.7329203, 0, 1, 0.5803922, 1,
-0.2328691, 0.8329059, 0.1056229, 0, 1, 0.5843138, 1,
-0.2297914, 0.2342407, -2.405549, 0, 1, 0.5921569, 1,
-0.2294046, -0.09043079, -1.582505, 0, 1, 0.5960785, 1,
-0.2256849, -0.4908156, -1.67026, 0, 1, 0.6039216, 1,
-0.2226423, 0.3394698, 0.3065087, 0, 1, 0.6117647, 1,
-0.2226369, 0.6186913, 1.13569, 0, 1, 0.6156863, 1,
-0.2183971, 0.8400953, 0.2620861, 0, 1, 0.6235294, 1,
-0.2168616, 2.354128, -0.4245483, 0, 1, 0.627451, 1,
-0.2167766, -0.8519781, -3.065121, 0, 1, 0.6352941, 1,
-0.2165781, 0.7717835, -2.746443, 0, 1, 0.6392157, 1,
-0.2028421, 0.760756, 0.8090262, 0, 1, 0.6470588, 1,
-0.2009128, 0.6191586, -0.01017845, 0, 1, 0.6509804, 1,
-0.1984349, -1.433363, -3.670584, 0, 1, 0.6588235, 1,
-0.1982639, 0.1772438, -1.302915, 0, 1, 0.6627451, 1,
-0.1974699, -1.084615, -3.575524, 0, 1, 0.6705883, 1,
-0.1942952, 1.111, 0.2338529, 0, 1, 0.6745098, 1,
-0.1900932, -0.9353675, -3.188281, 0, 1, 0.682353, 1,
-0.1890732, 1.382799, -0.7377211, 0, 1, 0.6862745, 1,
-0.1877813, -1.093281, -1.012453, 0, 1, 0.6941177, 1,
-0.1827599, 1.274748, -0.230842, 0, 1, 0.7019608, 1,
-0.1810649, 0.2961582, -0.5914025, 0, 1, 0.7058824, 1,
-0.1748106, -0.8232967, -3.537769, 0, 1, 0.7137255, 1,
-0.1698507, 0.4427516, 0.8791168, 0, 1, 0.7176471, 1,
-0.1676134, 0.4085902, -0.7385811, 0, 1, 0.7254902, 1,
-0.1611954, 0.09586614, -1.278949, 0, 1, 0.7294118, 1,
-0.1601685, 0.06831398, -0.6543899, 0, 1, 0.7372549, 1,
-0.1590611, 0.2403646, -1.116075, 0, 1, 0.7411765, 1,
-0.1558205, -0.3329035, -2.585529, 0, 1, 0.7490196, 1,
-0.1536529, -0.4348085, -2.504719, 0, 1, 0.7529412, 1,
-0.1528393, -0.5973644, -2.761899, 0, 1, 0.7607843, 1,
-0.1518681, -0.3753275, -1.688479, 0, 1, 0.7647059, 1,
-0.1449888, -0.4343061, -3.602304, 0, 1, 0.772549, 1,
-0.1427364, 1.992489, 1.651673, 0, 1, 0.7764706, 1,
-0.1419135, -0.9185548, -1.876502, 0, 1, 0.7843137, 1,
-0.1414463, -0.1433066, -3.447777, 0, 1, 0.7882353, 1,
-0.1408773, 0.8232056, -0.137303, 0, 1, 0.7960784, 1,
-0.1401873, -0.0984811, -3.99932, 0, 1, 0.8039216, 1,
-0.1363923, 0.316403, -1.188586, 0, 1, 0.8078431, 1,
-0.1332779, -0.2906826, -2.4076, 0, 1, 0.8156863, 1,
-0.1290562, 0.6648005, 1.43037, 0, 1, 0.8196079, 1,
-0.1268854, -0.7392018, -2.501068, 0, 1, 0.827451, 1,
-0.1235958, 0.4158471, 0.1864816, 0, 1, 0.8313726, 1,
-0.1172921, -1.43498, -3.521097, 0, 1, 0.8392157, 1,
-0.1141911, -0.4811566, -2.622508, 0, 1, 0.8431373, 1,
-0.1107798, 1.304217, -0.1261917, 0, 1, 0.8509804, 1,
-0.1022586, -1.090665, -2.222923, 0, 1, 0.854902, 1,
-0.09048565, -2.610348, -1.158866, 0, 1, 0.8627451, 1,
-0.09023188, 0.8058673, -0.9152646, 0, 1, 0.8666667, 1,
-0.08072795, -0.9204757, -3.685658, 0, 1, 0.8745098, 1,
-0.07968914, 0.1791807, -0.7358813, 0, 1, 0.8784314, 1,
-0.07550831, 1.306272, -2.487638, 0, 1, 0.8862745, 1,
-0.07509311, 0.03389573, -1.629475, 0, 1, 0.8901961, 1,
-0.07113434, 1.51584, -0.9829469, 0, 1, 0.8980392, 1,
-0.0702553, 0.8470717, -0.6334779, 0, 1, 0.9058824, 1,
-0.06737082, 0.5141939, -1.258404, 0, 1, 0.9098039, 1,
-0.06267649, -1.351032, -1.821826, 0, 1, 0.9176471, 1,
-0.0613872, 0.3306604, -0.09865872, 0, 1, 0.9215686, 1,
-0.0597316, 1.804176, 1.165571, 0, 1, 0.9294118, 1,
-0.0499532, -0.275413, -1.848088, 0, 1, 0.9333333, 1,
-0.04677637, 0.3381431, -1.699221, 0, 1, 0.9411765, 1,
-0.04570055, -1.830337, -3.697046, 0, 1, 0.945098, 1,
-0.03853092, -0.4508865, -3.642476, 0, 1, 0.9529412, 1,
-0.03440838, 0.06142364, 0.3281175, 0, 1, 0.9568627, 1,
-0.03191403, 1.404229, 0.7291905, 0, 1, 0.9647059, 1,
-0.03116465, -0.04325069, -2.633317, 0, 1, 0.9686275, 1,
-0.03035834, -0.7273062, -2.385859, 0, 1, 0.9764706, 1,
-0.02561754, -1.40461, -3.062994, 0, 1, 0.9803922, 1,
-0.018864, -1.089836, -2.748758, 0, 1, 0.9882353, 1,
-0.01523446, 0.5776026, -1.711965, 0, 1, 0.9921569, 1,
-0.01501251, -0.744712, -2.890963, 0, 1, 1, 1,
-0.008407041, -0.7920956, -2.90148, 0, 0.9921569, 1, 1,
-0.008119639, -0.03519315, -3.247168, 0, 0.9882353, 1, 1,
-0.003523356, 2.194726, 1.100836, 0, 0.9803922, 1, 1,
-0.002831911, 2.065624, 0.05244903, 0, 0.9764706, 1, 1,
-0.001360739, 1.046653, 0.1401678, 0, 0.9686275, 1, 1,
0.005994917, -1.395086, 1.365833, 0, 0.9647059, 1, 1,
0.006815731, -0.6051735, 5.465644, 0, 0.9568627, 1, 1,
0.00904215, -0.3980475, 2.714028, 0, 0.9529412, 1, 1,
0.01501303, 1.010349, -0.8340815, 0, 0.945098, 1, 1,
0.02549531, -1.230805, 4.231882, 0, 0.9411765, 1, 1,
0.0275588, 0.7267359, 0.1499757, 0, 0.9333333, 1, 1,
0.03093326, 1.576205, -0.03556034, 0, 0.9294118, 1, 1,
0.03182267, -1.618179, 2.292964, 0, 0.9215686, 1, 1,
0.03491673, -0.8250426, 5.402119, 0, 0.9176471, 1, 1,
0.03619404, -0.8183725, 2.860783, 0, 0.9098039, 1, 1,
0.03732256, -0.4563235, 1.173879, 0, 0.9058824, 1, 1,
0.03738464, 1.593366, -2.358799, 0, 0.8980392, 1, 1,
0.03773567, -0.6165364, 4.662458, 0, 0.8901961, 1, 1,
0.04357434, 1.725328, 0.1852392, 0, 0.8862745, 1, 1,
0.04706826, -1.028294, 1.7482, 0, 0.8784314, 1, 1,
0.04904994, 0.7854233, -0.8294995, 0, 0.8745098, 1, 1,
0.05138505, -0.05611478, 1.344072, 0, 0.8666667, 1, 1,
0.0529861, -0.1591439, 2.302463, 0, 0.8627451, 1, 1,
0.05355321, -0.7103329, 4.044488, 0, 0.854902, 1, 1,
0.06088134, 2.082345, -0.07033786, 0, 0.8509804, 1, 1,
0.06221309, -0.3285942, 1.41864, 0, 0.8431373, 1, 1,
0.06932428, -1.432643, 2.833796, 0, 0.8392157, 1, 1,
0.07119798, -0.5085383, 4.111711, 0, 0.8313726, 1, 1,
0.07464801, 0.9433048, 1.293067, 0, 0.827451, 1, 1,
0.07738306, 0.9726304, 0.1778179, 0, 0.8196079, 1, 1,
0.08044459, 0.3578397, -1.667283, 0, 0.8156863, 1, 1,
0.08100037, 0.9443946, -0.4218293, 0, 0.8078431, 1, 1,
0.08108884, -2.737171, 4.195043, 0, 0.8039216, 1, 1,
0.08580157, 0.3285717, -0.6054088, 0, 0.7960784, 1, 1,
0.08591054, -0.225373, 1.893205, 0, 0.7882353, 1, 1,
0.0861351, 0.4710304, 2.337793, 0, 0.7843137, 1, 1,
0.09505723, 0.3168218, 1.182069, 0, 0.7764706, 1, 1,
0.09777341, -0.2752378, 1.482674, 0, 0.772549, 1, 1,
0.1011161, -0.1427629, 1.289244, 0, 0.7647059, 1, 1,
0.1023126, -0.6506206, 2.822939, 0, 0.7607843, 1, 1,
0.103124, -1.00048, 1.721452, 0, 0.7529412, 1, 1,
0.1031744, 0.63493, 0.4665583, 0, 0.7490196, 1, 1,
0.1067159, -1.202347, 3.651824, 0, 0.7411765, 1, 1,
0.1089627, -1.637611, 1.573047, 0, 0.7372549, 1, 1,
0.1128534, 0.9675246, 0.5478211, 0, 0.7294118, 1, 1,
0.1140081, 0.8015317, -0.5658384, 0, 0.7254902, 1, 1,
0.1159883, -0.4825497, 1.457512, 0, 0.7176471, 1, 1,
0.1208902, 0.5970866, -0.5026553, 0, 0.7137255, 1, 1,
0.1212634, 0.02922904, 0.5330783, 0, 0.7058824, 1, 1,
0.1233123, -1.867979, 2.234631, 0, 0.6980392, 1, 1,
0.1250911, 0.4328582, 0.5942483, 0, 0.6941177, 1, 1,
0.1253681, 0.2345151, 2.468909, 0, 0.6862745, 1, 1,
0.1276715, 0.262335, 1.078334, 0, 0.682353, 1, 1,
0.1295202, -0.7264861, 1.942392, 0, 0.6745098, 1, 1,
0.1361653, 0.3420866, -0.3637834, 0, 0.6705883, 1, 1,
0.1389829, 1.433701, 1.81555, 0, 0.6627451, 1, 1,
0.1394981, -1.231323, 2.091484, 0, 0.6588235, 1, 1,
0.1421238, -1.352715, 2.066109, 0, 0.6509804, 1, 1,
0.1461559, -0.852031, 1.54278, 0, 0.6470588, 1, 1,
0.1463736, 0.1146292, 0.828137, 0, 0.6392157, 1, 1,
0.1484773, -0.8795907, 1.15775, 0, 0.6352941, 1, 1,
0.14976, 0.4778769, -1.351055, 0, 0.627451, 1, 1,
0.1524519, -0.7780462, 1.789688, 0, 0.6235294, 1, 1,
0.1555364, 1.378873, 0.4032617, 0, 0.6156863, 1, 1,
0.1568701, -1.084256, 2.750566, 0, 0.6117647, 1, 1,
0.1585112, 1.504036, -0.4453198, 0, 0.6039216, 1, 1,
0.1600992, 0.03605232, -0.7009323, 0, 0.5960785, 1, 1,
0.1605057, 0.2352441, 2.290382, 0, 0.5921569, 1, 1,
0.1659209, 0.8872197, 1.473317, 0, 0.5843138, 1, 1,
0.1690471, 0.3305791, 2.17803, 0, 0.5803922, 1, 1,
0.1696127, -0.985297, 3.698896, 0, 0.572549, 1, 1,
0.1696413, -0.006042089, 2.431857, 0, 0.5686275, 1, 1,
0.1701712, 0.1941815, 1.069404, 0, 0.5607843, 1, 1,
0.1771471, 0.6486023, -0.0877047, 0, 0.5568628, 1, 1,
0.182152, -0.7481057, 4.648211, 0, 0.5490196, 1, 1,
0.1834076, -0.7621688, 4.736695, 0, 0.5450981, 1, 1,
0.1843633, -0.6674948, 1.910702, 0, 0.5372549, 1, 1,
0.1886632, 0.1032449, 1.203684, 0, 0.5333334, 1, 1,
0.196134, -0.7034338, 3.067363, 0, 0.5254902, 1, 1,
0.1966102, 0.4342077, -0.7896312, 0, 0.5215687, 1, 1,
0.1982023, 0.6047543, -0.6163496, 0, 0.5137255, 1, 1,
0.1983002, -0.7113868, 4.421292, 0, 0.509804, 1, 1,
0.1988351, -2.102806, 1.160003, 0, 0.5019608, 1, 1,
0.2007958, 1.534683, -0.944814, 0, 0.4941176, 1, 1,
0.2019016, -0.0262215, 3.118255, 0, 0.4901961, 1, 1,
0.2021214, -0.05486433, 0.942646, 0, 0.4823529, 1, 1,
0.2024816, 0.9017891, -0.6016763, 0, 0.4784314, 1, 1,
0.2066522, -0.4871053, 2.682176, 0, 0.4705882, 1, 1,
0.2070476, 0.07125053, 2.587682, 0, 0.4666667, 1, 1,
0.2137906, -1.751656, 2.10574, 0, 0.4588235, 1, 1,
0.2145067, 0.3687195, 1.864772, 0, 0.454902, 1, 1,
0.2154499, -1.29202, 4.559877, 0, 0.4470588, 1, 1,
0.2214202, -0.07877471, 1.316672, 0, 0.4431373, 1, 1,
0.2215155, 0.186774, 0.3403071, 0, 0.4352941, 1, 1,
0.2219559, 0.0689821, 2.332927, 0, 0.4313726, 1, 1,
0.2224881, -0.5837353, 1.996394, 0, 0.4235294, 1, 1,
0.2300604, 0.8286977, 0.0690588, 0, 0.4196078, 1, 1,
0.2303316, -1.335719, 2.639755, 0, 0.4117647, 1, 1,
0.2392493, 0.2108031, 1.406766, 0, 0.4078431, 1, 1,
0.2408497, 0.08680403, 1.283037, 0, 0.4, 1, 1,
0.2417251, -1.121436, 4.37753, 0, 0.3921569, 1, 1,
0.2420401, 0.7908237, 1.296876, 0, 0.3882353, 1, 1,
0.2424662, -0.6271426, 2.299439, 0, 0.3803922, 1, 1,
0.243402, 0.1787667, 1.16588, 0, 0.3764706, 1, 1,
0.243998, -0.03551833, 0.1434619, 0, 0.3686275, 1, 1,
0.2441227, 2.593148, 0.1758626, 0, 0.3647059, 1, 1,
0.2498203, 0.9359361, 1.606144, 0, 0.3568628, 1, 1,
0.2520464, -0.1918828, 2.153022, 0, 0.3529412, 1, 1,
0.2520547, -0.5805832, 2.33876, 0, 0.345098, 1, 1,
0.256156, 1.356845, -0.8306288, 0, 0.3411765, 1, 1,
0.2596754, 0.01548045, 1.175673, 0, 0.3333333, 1, 1,
0.2658889, 1.345815, 1.423029, 0, 0.3294118, 1, 1,
0.2665188, 0.8108776, -1.724099, 0, 0.3215686, 1, 1,
0.2683167, -1.190727, 2.620037, 0, 0.3176471, 1, 1,
0.2684461, -0.6727935, 3.268342, 0, 0.3098039, 1, 1,
0.2695018, 0.6092383, -0.1245461, 0, 0.3058824, 1, 1,
0.2701526, 0.7798845, 0.02969081, 0, 0.2980392, 1, 1,
0.2708912, 0.09641201, 2.587821, 0, 0.2901961, 1, 1,
0.2713635, 0.5331076, -0.3285211, 0, 0.2862745, 1, 1,
0.272779, 1.17908, -0.1284973, 0, 0.2784314, 1, 1,
0.2728163, -0.4197017, 3.570389, 0, 0.2745098, 1, 1,
0.2745973, 0.5501663, 0.2100997, 0, 0.2666667, 1, 1,
0.2750922, 1.219401, 0.2919476, 0, 0.2627451, 1, 1,
0.2787752, 2.5434, 0.2246247, 0, 0.254902, 1, 1,
0.2815775, -1.238141, 2.896707, 0, 0.2509804, 1, 1,
0.2866848, 0.234438, 1.385515, 0, 0.2431373, 1, 1,
0.29243, -0.588267, 1.570902, 0, 0.2392157, 1, 1,
0.297499, -0.7994348, 3.174389, 0, 0.2313726, 1, 1,
0.3007661, -1.352584, 4.276259, 0, 0.227451, 1, 1,
0.3012446, -0.06604403, 2.190348, 0, 0.2196078, 1, 1,
0.3168715, 1.21425, -0.659175, 0, 0.2156863, 1, 1,
0.3180957, 0.2403787, 2.262526, 0, 0.2078431, 1, 1,
0.3207424, -0.01551708, 2.73116, 0, 0.2039216, 1, 1,
0.3245625, 0.7507344, -1.484107, 0, 0.1960784, 1, 1,
0.325821, 0.02023028, 2.415921, 0, 0.1882353, 1, 1,
0.3259843, 0.2544209, 2.008489, 0, 0.1843137, 1, 1,
0.3298505, -0.7834042, 1.679469, 0, 0.1764706, 1, 1,
0.3319649, 0.2161003, -0.7897949, 0, 0.172549, 1, 1,
0.3322598, -1.308872, 3.162369, 0, 0.1647059, 1, 1,
0.3323266, 0.2904386, -0.6415104, 0, 0.1607843, 1, 1,
0.3356832, 0.7436864, -0.5619369, 0, 0.1529412, 1, 1,
0.3379008, -0.7622138, 3.034601, 0, 0.1490196, 1, 1,
0.3396414, -0.6428429, 1.521867, 0, 0.1411765, 1, 1,
0.3398956, -1.897034, 2.632932, 0, 0.1372549, 1, 1,
0.3415099, 0.1358293, 0.6153511, 0, 0.1294118, 1, 1,
0.3422275, 0.03810531, 0.2024194, 0, 0.1254902, 1, 1,
0.3443419, -1.017568, 2.051955, 0, 0.1176471, 1, 1,
0.3449709, 1.728488, 1.303304, 0, 0.1137255, 1, 1,
0.3458693, 0.1827771, 1.005566, 0, 0.1058824, 1, 1,
0.3498473, 1.016421, 0.01064288, 0, 0.09803922, 1, 1,
0.3524813, 0.61683, 0.2854303, 0, 0.09411765, 1, 1,
0.3540182, -0.4314282, 1.185968, 0, 0.08627451, 1, 1,
0.3557252, -0.9798845, 0.9699053, 0, 0.08235294, 1, 1,
0.3560196, -0.2898198, 1.972017, 0, 0.07450981, 1, 1,
0.3578198, -0.5666543, 1.003635, 0, 0.07058824, 1, 1,
0.3601461, 0.3140531, 0.07771509, 0, 0.0627451, 1, 1,
0.367206, -0.6883074, 2.431828, 0, 0.05882353, 1, 1,
0.3685666, -0.4677552, 1.205227, 0, 0.05098039, 1, 1,
0.3754939, 0.2910446, -1.036896, 0, 0.04705882, 1, 1,
0.376278, 0.1346606, 0.5587699, 0, 0.03921569, 1, 1,
0.3775233, 2.006237, -3.135289, 0, 0.03529412, 1, 1,
0.3792641, 0.8887368, 0.19533, 0, 0.02745098, 1, 1,
0.381832, 0.3326055, -0.3448398, 0, 0.02352941, 1, 1,
0.3830617, -0.6488554, 5.60921, 0, 0.01568628, 1, 1,
0.3834261, -0.645771, 2.059706, 0, 0.01176471, 1, 1,
0.3849945, -0.6209816, 3.420629, 0, 0.003921569, 1, 1,
0.3860525, -2.530981, 2.14969, 0.003921569, 0, 1, 1,
0.3867998, -1.274043, 1.731307, 0.007843138, 0, 1, 1,
0.3879672, 0.9637401, 0.5732519, 0.01568628, 0, 1, 1,
0.3907199, -1.433622, 2.762385, 0.01960784, 0, 1, 1,
0.3960778, -0.9221219, 3.921973, 0.02745098, 0, 1, 1,
0.4043763, 0.1661981, -0.07927463, 0.03137255, 0, 1, 1,
0.4065979, 0.439873, 1.767367, 0.03921569, 0, 1, 1,
0.4099523, 0.880795, -1.291508, 0.04313726, 0, 1, 1,
0.4106209, 0.1720039, 0.8436779, 0.05098039, 0, 1, 1,
0.4184977, 0.8820463, 1.616811, 0.05490196, 0, 1, 1,
0.4189992, 0.3291036, 1.937428, 0.0627451, 0, 1, 1,
0.4208035, -0.02744891, 2.173491, 0.06666667, 0, 1, 1,
0.4217865, -2.014462, 3.811883, 0.07450981, 0, 1, 1,
0.4225863, 0.4389549, 0.02413043, 0.07843138, 0, 1, 1,
0.4235165, -1.122241, 1.24913, 0.08627451, 0, 1, 1,
0.4271715, 1.801682, -1.553157, 0.09019608, 0, 1, 1,
0.4329481, 1.133249, 0.1400714, 0.09803922, 0, 1, 1,
0.4339201, 1.377056, 0.3903342, 0.1058824, 0, 1, 1,
0.4377094, 0.5038484, -0.04972023, 0.1098039, 0, 1, 1,
0.4401959, 1.138044, 0.3898542, 0.1176471, 0, 1, 1,
0.4428302, -0.1536781, 2.41222, 0.1215686, 0, 1, 1,
0.4433618, -1.22007, 1.909551, 0.1294118, 0, 1, 1,
0.4443423, -0.113231, -0.8094459, 0.1333333, 0, 1, 1,
0.4449392, 0.839668, -0.1011522, 0.1411765, 0, 1, 1,
0.445695, -0.3819508, 3.356631, 0.145098, 0, 1, 1,
0.4475971, -1.724861, 1.85165, 0.1529412, 0, 1, 1,
0.4525189, 1.649542, 0.261824, 0.1568628, 0, 1, 1,
0.4533181, -0.5061217, 3.11135, 0.1647059, 0, 1, 1,
0.4562961, 1.712846, 0.6955947, 0.1686275, 0, 1, 1,
0.4618723, -1.15454, 2.616996, 0.1764706, 0, 1, 1,
0.4642738, 1.52374, 0.5681098, 0.1803922, 0, 1, 1,
0.4664152, 1.282532, 0.2621847, 0.1882353, 0, 1, 1,
0.4699301, 0.7177678, 0.1967443, 0.1921569, 0, 1, 1,
0.4720605, 0.358342, 2.351616, 0.2, 0, 1, 1,
0.4768334, 0.3769159, 1.202146, 0.2078431, 0, 1, 1,
0.4808079, 1.019371, 0.8742055, 0.2117647, 0, 1, 1,
0.4833402, -1.686167, 2.93696, 0.2196078, 0, 1, 1,
0.4848098, 1.021655, 1.810739, 0.2235294, 0, 1, 1,
0.485146, 1.44889, 0.5448462, 0.2313726, 0, 1, 1,
0.491192, -1.286655, 5.12221, 0.2352941, 0, 1, 1,
0.4946972, -1.495669, 3.033673, 0.2431373, 0, 1, 1,
0.497469, 0.9599297, -0.7342595, 0.2470588, 0, 1, 1,
0.498474, -0.5001646, 3.319772, 0.254902, 0, 1, 1,
0.5000952, -1.028638, 1.247701, 0.2588235, 0, 1, 1,
0.5015075, -0.08145627, 2.011873, 0.2666667, 0, 1, 1,
0.5064051, -1.191766, 2.704753, 0.2705882, 0, 1, 1,
0.5067689, -0.3650647, 1.885518, 0.2784314, 0, 1, 1,
0.5080233, -1.025332, 1.288307, 0.282353, 0, 1, 1,
0.5177115, -0.4528867, 1.713825, 0.2901961, 0, 1, 1,
0.5202155, -0.06785612, 2.02963, 0.2941177, 0, 1, 1,
0.5207256, 1.791807, 0.3023562, 0.3019608, 0, 1, 1,
0.5228015, 1.081606, 0.5168085, 0.3098039, 0, 1, 1,
0.5234987, -0.8389477, 1.508149, 0.3137255, 0, 1, 1,
0.5322081, 0.9979481, 0.3994961, 0.3215686, 0, 1, 1,
0.534457, -0.7355582, 3.178521, 0.3254902, 0, 1, 1,
0.5356671, -0.1549126, 2.760921, 0.3333333, 0, 1, 1,
0.5368541, -1.742989, 3.603222, 0.3372549, 0, 1, 1,
0.5382168, -0.3268285, 2.560799, 0.345098, 0, 1, 1,
0.539183, 1.586308, -2.831602, 0.3490196, 0, 1, 1,
0.5450085, -1.35842, 3.347219, 0.3568628, 0, 1, 1,
0.5514834, -0.5345083, 1.771665, 0.3607843, 0, 1, 1,
0.5565152, -1.524166, 3.290389, 0.3686275, 0, 1, 1,
0.55869, -0.7366406, 1.797554, 0.372549, 0, 1, 1,
0.5623975, -0.8696942, 1.641457, 0.3803922, 0, 1, 1,
0.5625156, 2.169623, -0.9766126, 0.3843137, 0, 1, 1,
0.5627978, -1.735149, 1.570543, 0.3921569, 0, 1, 1,
0.588546, 0.4410576, 0.837014, 0.3960784, 0, 1, 1,
0.5942364, -1.159878, 3.33569, 0.4039216, 0, 1, 1,
0.5952527, 0.9404956, -0.1912701, 0.4117647, 0, 1, 1,
0.5956422, 0.9419202, 1.904079, 0.4156863, 0, 1, 1,
0.597105, -0.2845624, 3.519345, 0.4235294, 0, 1, 1,
0.5995443, 0.772054, -1.242507, 0.427451, 0, 1, 1,
0.6004785, 0.8128584, 0.6400172, 0.4352941, 0, 1, 1,
0.6100658, -0.4920813, 2.211687, 0.4392157, 0, 1, 1,
0.6153605, 0.5555651, 2.142346, 0.4470588, 0, 1, 1,
0.6190472, 0.1648761, -0.2617748, 0.4509804, 0, 1, 1,
0.6199374, -1.805034, 3.621553, 0.4588235, 0, 1, 1,
0.6214561, 2.045139, 0.7355112, 0.4627451, 0, 1, 1,
0.6220248, 0.6233093, 0.2060514, 0.4705882, 0, 1, 1,
0.6226917, -1.417473, 2.080257, 0.4745098, 0, 1, 1,
0.6261379, -0.3839469, 1.731182, 0.4823529, 0, 1, 1,
0.6269911, -0.3485122, 1.620436, 0.4862745, 0, 1, 1,
0.6353977, 0.5602939, -0.8364209, 0.4941176, 0, 1, 1,
0.6359909, -0.4334283, 2.330636, 0.5019608, 0, 1, 1,
0.6384897, 0.4724661, 1.566669, 0.5058824, 0, 1, 1,
0.6433695, 1.56158, 0.7206475, 0.5137255, 0, 1, 1,
0.6456048, 1.125956, 0.1427773, 0.5176471, 0, 1, 1,
0.6552615, -0.6394344, 0.9601126, 0.5254902, 0, 1, 1,
0.6557529, -0.5299664, 2.816944, 0.5294118, 0, 1, 1,
0.6572916, 0.6715788, 0.07086981, 0.5372549, 0, 1, 1,
0.6580632, -0.2933388, 1.844129, 0.5411765, 0, 1, 1,
0.6582146, -0.1669351, 1.102031, 0.5490196, 0, 1, 1,
0.6586586, 2.14031, 1.69083, 0.5529412, 0, 1, 1,
0.6596823, 0.8289633, 0.6792184, 0.5607843, 0, 1, 1,
0.6605743, -0.7194229, 1.66498, 0.5647059, 0, 1, 1,
0.6617437, 0.4621097, -0.08040301, 0.572549, 0, 1, 1,
0.662456, 0.9592364, 0.504541, 0.5764706, 0, 1, 1,
0.6724612, 0.3610588, -0.469451, 0.5843138, 0, 1, 1,
0.6745391, 0.4288549, 2.547867, 0.5882353, 0, 1, 1,
0.6823457, 0.3971968, 1.58634, 0.5960785, 0, 1, 1,
0.6828263, -0.6943414, 3.442345, 0.6039216, 0, 1, 1,
0.6842471, -1.992808, 3.088207, 0.6078432, 0, 1, 1,
0.685927, -0.4035109, 3.208307, 0.6156863, 0, 1, 1,
0.6876183, 0.3054639, 2.934328, 0.6196079, 0, 1, 1,
0.6876771, 1.233508, -0.3840968, 0.627451, 0, 1, 1,
0.6889875, -0.1623462, 1.862967, 0.6313726, 0, 1, 1,
0.6897916, 1.497011, -1.298405, 0.6392157, 0, 1, 1,
0.690154, -0.4984117, 2.274453, 0.6431373, 0, 1, 1,
0.692514, -1.046017, 1.004162, 0.6509804, 0, 1, 1,
0.6972238, -0.6080356, 0.5158029, 0.654902, 0, 1, 1,
0.6980891, -0.8519319, 0.62183, 0.6627451, 0, 1, 1,
0.7036838, 1.84003, -2.038594, 0.6666667, 0, 1, 1,
0.7038228, 1.619588, -0.1361191, 0.6745098, 0, 1, 1,
0.7040572, -0.0403888, 1.258952, 0.6784314, 0, 1, 1,
0.711014, -0.7856889, 1.864082, 0.6862745, 0, 1, 1,
0.7224323, 0.6415397, -0.005142819, 0.6901961, 0, 1, 1,
0.7280827, -1.593869, 3.192164, 0.6980392, 0, 1, 1,
0.7327828, -1.609891, 0.4729811, 0.7058824, 0, 1, 1,
0.7332276, -0.2929277, 2.275061, 0.7098039, 0, 1, 1,
0.7365707, -2.377623, 1.897105, 0.7176471, 0, 1, 1,
0.7380546, 1.648684, 0.6432108, 0.7215686, 0, 1, 1,
0.7456955, -1.188453, 1.721324, 0.7294118, 0, 1, 1,
0.7584819, 0.1402961, 1.019292, 0.7333333, 0, 1, 1,
0.7603582, -0.009956772, 1.872075, 0.7411765, 0, 1, 1,
0.7702754, 0.4044255, 1.532414, 0.7450981, 0, 1, 1,
0.7719192, -0.06275773, 2.325473, 0.7529412, 0, 1, 1,
0.7736459, -1.089701, 1.515839, 0.7568628, 0, 1, 1,
0.7752022, 0.08659836, 1.023879, 0.7647059, 0, 1, 1,
0.7778419, 0.1798705, 3.67765, 0.7686275, 0, 1, 1,
0.7803559, 0.3198047, -0.7505777, 0.7764706, 0, 1, 1,
0.7816128, -0.4754438, 2.660048, 0.7803922, 0, 1, 1,
0.7841817, 2.2365, -0.37049, 0.7882353, 0, 1, 1,
0.7849319, -0.8360534, 2.967496, 0.7921569, 0, 1, 1,
0.7862422, 0.4589446, 0.8990268, 0.8, 0, 1, 1,
0.7907544, 0.409758, 2.487555, 0.8078431, 0, 1, 1,
0.7942818, 0.6933053, 1.092837, 0.8117647, 0, 1, 1,
0.7978296, -1.078218, 2.817944, 0.8196079, 0, 1, 1,
0.7982078, 1.107868, 2.121328, 0.8235294, 0, 1, 1,
0.7999653, -1.322425, 2.405375, 0.8313726, 0, 1, 1,
0.8025012, 1.801665, 2.489836, 0.8352941, 0, 1, 1,
0.8036858, 1.641767, -0.05696309, 0.8431373, 0, 1, 1,
0.8230828, -0.2295048, 1.583877, 0.8470588, 0, 1, 1,
0.8278659, -0.5532212, 3.112726, 0.854902, 0, 1, 1,
0.8332973, -0.6972368, 1.203046, 0.8588235, 0, 1, 1,
0.8354589, 0.5852798, 0.6730753, 0.8666667, 0, 1, 1,
0.8360484, 1.108756, 0.414515, 0.8705882, 0, 1, 1,
0.8409414, 1.032093, 0.3893919, 0.8784314, 0, 1, 1,
0.8414519, 0.5191884, 3.095769, 0.8823529, 0, 1, 1,
0.8417602, -0.3036196, 3.516841, 0.8901961, 0, 1, 1,
0.8515686, -0.5269297, 0.865533, 0.8941177, 0, 1, 1,
0.8519273, 0.2287971, 1.867446, 0.9019608, 0, 1, 1,
0.8565728, 0.2257097, 2.03688, 0.9098039, 0, 1, 1,
0.868737, -0.2755649, 2.468115, 0.9137255, 0, 1, 1,
0.8718813, 0.2704182, 0.1608166, 0.9215686, 0, 1, 1,
0.8760798, 1.555861, 1.291671, 0.9254902, 0, 1, 1,
0.8805941, 0.6378867, 1.558562, 0.9333333, 0, 1, 1,
0.8857807, 0.129614, 2.591472, 0.9372549, 0, 1, 1,
0.8865795, 1.174777, 1.935672, 0.945098, 0, 1, 1,
0.8866324, -0.04791558, 2.405992, 0.9490196, 0, 1, 1,
0.8875465, 0.3694296, 1.392007, 0.9568627, 0, 1, 1,
0.8895504, 0.7724923, -0.3926315, 0.9607843, 0, 1, 1,
0.8898502, -0.7365124, 2.911825, 0.9686275, 0, 1, 1,
0.8899507, 1.47137, 0.8154008, 0.972549, 0, 1, 1,
0.897236, 0.2648349, 1.061369, 0.9803922, 0, 1, 1,
0.9030738, 1.503041, 1.556975, 0.9843137, 0, 1, 1,
0.905486, -1.405359, 2.338488, 0.9921569, 0, 1, 1,
0.9081234, 0.3517727, 2.417042, 0.9960784, 0, 1, 1,
0.9083618, 1.772699, 0.2364271, 1, 0, 0.9960784, 1,
0.9103784, 0.4253375, 1.504992, 1, 0, 0.9882353, 1,
0.9124467, 0.5474669, 2.027981, 1, 0, 0.9843137, 1,
0.9185529, -0.8548313, 1.4108, 1, 0, 0.9764706, 1,
0.931614, 0.4225491, 0.8707753, 1, 0, 0.972549, 1,
0.9327382, -1.182297, 1.857953, 1, 0, 0.9647059, 1,
0.9350101, 2.038695, 1.989634, 1, 0, 0.9607843, 1,
0.9383725, 0.658977, 0.251016, 1, 0, 0.9529412, 1,
0.939384, -0.01704235, 0.5980719, 1, 0, 0.9490196, 1,
0.9401772, -0.0002268589, 3.572744, 1, 0, 0.9411765, 1,
0.9404665, 1.103276, 0.2161406, 1, 0, 0.9372549, 1,
0.9404919, -0.8323727, 3.242808, 1, 0, 0.9294118, 1,
0.9415855, 0.005319775, 2.063416, 1, 0, 0.9254902, 1,
0.9489539, 0.2078445, 1.359108, 1, 0, 0.9176471, 1,
0.9575862, 0.09422618, 2.970529, 1, 0, 0.9137255, 1,
0.9671339, -0.7078949, 2.688529, 1, 0, 0.9058824, 1,
0.9809282, -0.1091723, 1.701342, 1, 0, 0.9019608, 1,
0.9819345, -0.4125279, 1.813559, 1, 0, 0.8941177, 1,
0.9828773, 0.5825958, 1.499917, 1, 0, 0.8862745, 1,
0.9831077, 0.8840665, 1.690014, 1, 0, 0.8823529, 1,
0.9844676, 0.0009962881, 1.9555, 1, 0, 0.8745098, 1,
0.9938031, 0.4757403, 1.140762, 1, 0, 0.8705882, 1,
1.000922, 0.7653989, 0.7009776, 1, 0, 0.8627451, 1,
1.003206, 0.5235862, 1.131728, 1, 0, 0.8588235, 1,
1.005427, -1.399692, 2.874891, 1, 0, 0.8509804, 1,
1.010883, 1.11604, 3.103189, 1, 0, 0.8470588, 1,
1.011716, -1.353506, 4.523405, 1, 0, 0.8392157, 1,
1.013585, 1.035479, 0.08055476, 1, 0, 0.8352941, 1,
1.02532, 1.141239, 2.777503, 1, 0, 0.827451, 1,
1.032032, 1.646383, 1.114037, 1, 0, 0.8235294, 1,
1.033381, -0.6232459, 3.591875, 1, 0, 0.8156863, 1,
1.054665, 1.645431, -0.03097967, 1, 0, 0.8117647, 1,
1.055986, 0.07050732, 1.101743, 1, 0, 0.8039216, 1,
1.080097, 0.02319542, 0.9566121, 1, 0, 0.7960784, 1,
1.082132, 0.435829, 1.122915, 1, 0, 0.7921569, 1,
1.082637, -0.04375108, 2.482459, 1, 0, 0.7843137, 1,
1.086606, -2.042183, 2.856736, 1, 0, 0.7803922, 1,
1.087132, 1.482191, 0.3702157, 1, 0, 0.772549, 1,
1.090332, -0.8270269, 2.775859, 1, 0, 0.7686275, 1,
1.091917, 0.7884802, 1.188442, 1, 0, 0.7607843, 1,
1.091924, -0.5989351, 1.425085, 1, 0, 0.7568628, 1,
1.095547, -0.07863793, 1.046191, 1, 0, 0.7490196, 1,
1.097466, -0.1148797, 1.133702, 1, 0, 0.7450981, 1,
1.099123, -0.09570847, 0.5066106, 1, 0, 0.7372549, 1,
1.099856, -2.165677, 2.974899, 1, 0, 0.7333333, 1,
1.100503, -0.9466787, 1.062406, 1, 0, 0.7254902, 1,
1.10793, -1.695775, 3.349854, 1, 0, 0.7215686, 1,
1.117482, -0.4446219, 0.673952, 1, 0, 0.7137255, 1,
1.122796, -0.6547493, 0.3711272, 1, 0, 0.7098039, 1,
1.127069, -0.7018496, 2.542881, 1, 0, 0.7019608, 1,
1.128471, -1.102846, 3.716314, 1, 0, 0.6941177, 1,
1.142943, 0.5527843, 1.188119, 1, 0, 0.6901961, 1,
1.155968, -0.1944091, 1.826844, 1, 0, 0.682353, 1,
1.163264, -0.05830564, 1.579442, 1, 0, 0.6784314, 1,
1.177301, -1.300689, 2.751229, 1, 0, 0.6705883, 1,
1.17878, 1.357425, 0.660702, 1, 0, 0.6666667, 1,
1.180964, -1.370602, 2.149646, 1, 0, 0.6588235, 1,
1.182814, -1.878668, 3.987507, 1, 0, 0.654902, 1,
1.186983, 0.4069287, 0.7834484, 1, 0, 0.6470588, 1,
1.192877, -0.06323846, 2.95531, 1, 0, 0.6431373, 1,
1.198891, -0.3220489, 2.093548, 1, 0, 0.6352941, 1,
1.20015, 2.6356, 0.7694392, 1, 0, 0.6313726, 1,
1.208418, 0.2621079, 2.730116, 1, 0, 0.6235294, 1,
1.210443, 0.09656866, 2.657933, 1, 0, 0.6196079, 1,
1.22157, -2.968991, 2.163342, 1, 0, 0.6117647, 1,
1.226873, -1.211401, 2.452008, 1, 0, 0.6078432, 1,
1.235621, 1.163548, -0.5726737, 1, 0, 0.6, 1,
1.241281, 0.3502981, -0.7371567, 1, 0, 0.5921569, 1,
1.244217, -0.3442133, 1.99323, 1, 0, 0.5882353, 1,
1.245867, 0.7084209, 2.371671, 1, 0, 0.5803922, 1,
1.249082, 0.3108412, 2.059698, 1, 0, 0.5764706, 1,
1.254734, 1.159301, 1.063926, 1, 0, 0.5686275, 1,
1.254825, 1.053166, 1.625736, 1, 0, 0.5647059, 1,
1.264485, 2.4349, -1.417795, 1, 0, 0.5568628, 1,
1.286968, 1.289097, 1.126836, 1, 0, 0.5529412, 1,
1.289369, 0.3787256, 1.127121, 1, 0, 0.5450981, 1,
1.290377, -0.9230041, 2.801013, 1, 0, 0.5411765, 1,
1.309364, 2.093549, 1.161378, 1, 0, 0.5333334, 1,
1.316238, -0.7005712, 1.744213, 1, 0, 0.5294118, 1,
1.333071, 0.4211899, 2.119122, 1, 0, 0.5215687, 1,
1.334338, -0.3909197, 2.974038, 1, 0, 0.5176471, 1,
1.344112, -0.9663516, 1.528077, 1, 0, 0.509804, 1,
1.357475, 1.449369, 0.9030768, 1, 0, 0.5058824, 1,
1.364171, -1.214353, 2.835779, 1, 0, 0.4980392, 1,
1.375561, -0.6217408, 3.313005, 1, 0, 0.4901961, 1,
1.379019, 0.9168953, 0.6552423, 1, 0, 0.4862745, 1,
1.387833, -0.8809921, 4.107396, 1, 0, 0.4784314, 1,
1.403351, -0.4962438, 0.8249041, 1, 0, 0.4745098, 1,
1.403647, -0.8190246, 3.422659, 1, 0, 0.4666667, 1,
1.406909, -0.5589021, 2.064205, 1, 0, 0.4627451, 1,
1.415128, -0.8271066, 2.857717, 1, 0, 0.454902, 1,
1.432727, -0.2616704, 0.9904516, 1, 0, 0.4509804, 1,
1.437889, 0.7633538, 0.5303145, 1, 0, 0.4431373, 1,
1.447925, 1.386466, 0.6352066, 1, 0, 0.4392157, 1,
1.449599, -0.9130856, 2.952455, 1, 0, 0.4313726, 1,
1.450994, 0.09861372, 0.5061622, 1, 0, 0.427451, 1,
1.455912, 1.939989, 0.1764191, 1, 0, 0.4196078, 1,
1.460488, 0.2703255, 1.218698, 1, 0, 0.4156863, 1,
1.472693, 1.166494, 0.4278136, 1, 0, 0.4078431, 1,
1.479864, -0.3687941, 1.271421, 1, 0, 0.4039216, 1,
1.484523, 0.7556342, 0.6640586, 1, 0, 0.3960784, 1,
1.486068, 0.7476162, 0.3541191, 1, 0, 0.3882353, 1,
1.490815, -0.2688876, 1.137078, 1, 0, 0.3843137, 1,
1.49323, -1.169833, 3.211954, 1, 0, 0.3764706, 1,
1.501477, 0.2989038, 0.662032, 1, 0, 0.372549, 1,
1.51854, 0.179346, 0.4861231, 1, 0, 0.3647059, 1,
1.558725, -0.8603581, 3.209822, 1, 0, 0.3607843, 1,
1.565441, 0.1690823, 0.5502017, 1, 0, 0.3529412, 1,
1.572803, 1.656713, 0.416211, 1, 0, 0.3490196, 1,
1.57965, 0.712303, 2.317906, 1, 0, 0.3411765, 1,
1.580846, -0.8155033, 0.8352329, 1, 0, 0.3372549, 1,
1.590854, -1.004416, 1.733748, 1, 0, 0.3294118, 1,
1.598303, -0.7059661, 1.806368, 1, 0, 0.3254902, 1,
1.599075, -1.774332, 3.275217, 1, 0, 0.3176471, 1,
1.607329, -0.08642013, 1.216913, 1, 0, 0.3137255, 1,
1.612023, 0.1190865, -0.7971172, 1, 0, 0.3058824, 1,
1.621726, -0.07424834, 1.056144, 1, 0, 0.2980392, 1,
1.627579, -2.010088, 0.9415554, 1, 0, 0.2941177, 1,
1.627809, -0.08790659, 3.671559, 1, 0, 0.2862745, 1,
1.634238, 0.9126485, 2.696855, 1, 0, 0.282353, 1,
1.647583, 1.013383, 0.3181825, 1, 0, 0.2745098, 1,
1.650395, 0.6421874, -0.000775627, 1, 0, 0.2705882, 1,
1.658256, -1.722555, 2.724004, 1, 0, 0.2627451, 1,
1.662768, 0.5785928, 1.310935, 1, 0, 0.2588235, 1,
1.669779, 0.08688353, 2.150253, 1, 0, 0.2509804, 1,
1.678532, 1.118711, 1.720221, 1, 0, 0.2470588, 1,
1.688551, -0.126929, 2.32922, 1, 0, 0.2392157, 1,
1.690579, -0.002075545, 1.306759, 1, 0, 0.2352941, 1,
1.736312, -1.101847, 3.048011, 1, 0, 0.227451, 1,
1.754536, -0.003609176, 2.06919, 1, 0, 0.2235294, 1,
1.758983, 0.6946196, 0.3870859, 1, 0, 0.2156863, 1,
1.762821, 0.4281716, 2.512022, 1, 0, 0.2117647, 1,
1.778857, -1.05926, 2.163782, 1, 0, 0.2039216, 1,
1.799625, 1.288739, 0.3950579, 1, 0, 0.1960784, 1,
1.824744, 0.1259721, 0.241733, 1, 0, 0.1921569, 1,
1.833245, 0.1305167, 2.678879, 1, 0, 0.1843137, 1,
1.857261, -0.9261951, 1.618559, 1, 0, 0.1803922, 1,
1.928814, -0.575327, 3.079971, 1, 0, 0.172549, 1,
1.935914, 1.481329, -0.7780761, 1, 0, 0.1686275, 1,
1.950853, -0.127646, 2.402201, 1, 0, 0.1607843, 1,
1.950859, -0.2372144, 0.7303938, 1, 0, 0.1568628, 1,
1.957221, -0.4688216, 2.024877, 1, 0, 0.1490196, 1,
1.999913, 0.4536396, 0.6881137, 1, 0, 0.145098, 1,
2.017505, -0.234323, 1.618467, 1, 0, 0.1372549, 1,
2.029687, 0.295836, 1.957883, 1, 0, 0.1333333, 1,
2.034636, 0.7293101, 1.287816, 1, 0, 0.1254902, 1,
2.055801, 1.554835, -1.425367, 1, 0, 0.1215686, 1,
2.078499, -0.7954759, 3.04318, 1, 0, 0.1137255, 1,
2.099131, 1.359644, 1.010656, 1, 0, 0.1098039, 1,
2.116628, 0.01591819, 2.491475, 1, 0, 0.1019608, 1,
2.128463, -0.6153482, 1.184184, 1, 0, 0.09411765, 1,
2.16387, -1.551567, 3.67736, 1, 0, 0.09019608, 1,
2.216571, 2.197685, 0.06589636, 1, 0, 0.08235294, 1,
2.228012, 1.447406, 1.008257, 1, 0, 0.07843138, 1,
2.229177, 0.5182371, 1.21584, 1, 0, 0.07058824, 1,
2.240822, 1.794969, -0.2893379, 1, 0, 0.06666667, 1,
2.287405, -1.920976, 2.442867, 1, 0, 0.05882353, 1,
2.300685, -0.9089444, 2.266562, 1, 0, 0.05490196, 1,
2.350668, 0.6151376, 0.4395886, 1, 0, 0.04705882, 1,
2.376325, -1.283763, 2.11245, 1, 0, 0.04313726, 1,
2.445318, -0.9307591, 2.057743, 1, 0, 0.03529412, 1,
2.549474, 0.4278159, 0.8800429, 1, 0, 0.03137255, 1,
2.682751, 1.981227, 1.785119, 1, 0, 0.02352941, 1,
2.760628, 0.2727115, 1.683732, 1, 0, 0.01960784, 1,
2.763185, -0.8795159, 2.553858, 1, 0, 0.01176471, 1,
3.117938, 0.04999941, 2.031725, 1, 0, 0.007843138, 1
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
-0.08037388, -3.94676, -7.022155, 0, -0.5, 0.5, 0.5,
-0.08037388, -3.94676, -7.022155, 1, -0.5, 0.5, 0.5,
-0.08037388, -3.94676, -7.022155, 1, 1.5, 0.5, 0.5,
-0.08037388, -3.94676, -7.022155, 0, 1.5, 0.5, 0.5
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
-4.362913, -0.08471894, -7.022155, 0, -0.5, 0.5, 0.5,
-4.362913, -0.08471894, -7.022155, 1, -0.5, 0.5, 0.5,
-4.362913, -0.08471894, -7.022155, 1, 1.5, 0.5, 0.5,
-4.362913, -0.08471894, -7.022155, 0, 1.5, 0.5, 0.5
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
-4.362913, -3.94676, 0.208883, 0, -0.5, 0.5, 0.5,
-4.362913, -3.94676, 0.208883, 1, -0.5, 0.5, 0.5,
-4.362913, -3.94676, 0.208883, 1, 1.5, 0.5, 0.5,
-4.362913, -3.94676, 0.208883, 0, 1.5, 0.5, 0.5
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
-3, -3.055519, -5.353454,
3, -3.055519, -5.353454,
-3, -3.055519, -5.353454,
-3, -3.204059, -5.631571,
-2, -3.055519, -5.353454,
-2, -3.204059, -5.631571,
-1, -3.055519, -5.353454,
-1, -3.204059, -5.631571,
0, -3.055519, -5.353454,
0, -3.204059, -5.631571,
1, -3.055519, -5.353454,
1, -3.204059, -5.631571,
2, -3.055519, -5.353454,
2, -3.204059, -5.631571,
3, -3.055519, -5.353454,
3, -3.204059, -5.631571
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
-3, -3.50114, -6.187805, 0, -0.5, 0.5, 0.5,
-3, -3.50114, -6.187805, 1, -0.5, 0.5, 0.5,
-3, -3.50114, -6.187805, 1, 1.5, 0.5, 0.5,
-3, -3.50114, -6.187805, 0, 1.5, 0.5, 0.5,
-2, -3.50114, -6.187805, 0, -0.5, 0.5, 0.5,
-2, -3.50114, -6.187805, 1, -0.5, 0.5, 0.5,
-2, -3.50114, -6.187805, 1, 1.5, 0.5, 0.5,
-2, -3.50114, -6.187805, 0, 1.5, 0.5, 0.5,
-1, -3.50114, -6.187805, 0, -0.5, 0.5, 0.5,
-1, -3.50114, -6.187805, 1, -0.5, 0.5, 0.5,
-1, -3.50114, -6.187805, 1, 1.5, 0.5, 0.5,
-1, -3.50114, -6.187805, 0, 1.5, 0.5, 0.5,
0, -3.50114, -6.187805, 0, -0.5, 0.5, 0.5,
0, -3.50114, -6.187805, 1, -0.5, 0.5, 0.5,
0, -3.50114, -6.187805, 1, 1.5, 0.5, 0.5,
0, -3.50114, -6.187805, 0, 1.5, 0.5, 0.5,
1, -3.50114, -6.187805, 0, -0.5, 0.5, 0.5,
1, -3.50114, -6.187805, 1, -0.5, 0.5, 0.5,
1, -3.50114, -6.187805, 1, 1.5, 0.5, 0.5,
1, -3.50114, -6.187805, 0, 1.5, 0.5, 0.5,
2, -3.50114, -6.187805, 0, -0.5, 0.5, 0.5,
2, -3.50114, -6.187805, 1, -0.5, 0.5, 0.5,
2, -3.50114, -6.187805, 1, 1.5, 0.5, 0.5,
2, -3.50114, -6.187805, 0, 1.5, 0.5, 0.5,
3, -3.50114, -6.187805, 0, -0.5, 0.5, 0.5,
3, -3.50114, -6.187805, 1, -0.5, 0.5, 0.5,
3, -3.50114, -6.187805, 1, 1.5, 0.5, 0.5,
3, -3.50114, -6.187805, 0, 1.5, 0.5, 0.5
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
-3.374635, -2, -5.353454,
-3.374635, 2, -5.353454,
-3.374635, -2, -5.353454,
-3.539348, -2, -5.631571,
-3.374635, -1, -5.353454,
-3.539348, -1, -5.631571,
-3.374635, 0, -5.353454,
-3.539348, 0, -5.631571,
-3.374635, 1, -5.353454,
-3.539348, 1, -5.631571,
-3.374635, 2, -5.353454,
-3.539348, 2, -5.631571
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
-3.868774, -2, -6.187805, 0, -0.5, 0.5, 0.5,
-3.868774, -2, -6.187805, 1, -0.5, 0.5, 0.5,
-3.868774, -2, -6.187805, 1, 1.5, 0.5, 0.5,
-3.868774, -2, -6.187805, 0, 1.5, 0.5, 0.5,
-3.868774, -1, -6.187805, 0, -0.5, 0.5, 0.5,
-3.868774, -1, -6.187805, 1, -0.5, 0.5, 0.5,
-3.868774, -1, -6.187805, 1, 1.5, 0.5, 0.5,
-3.868774, -1, -6.187805, 0, 1.5, 0.5, 0.5,
-3.868774, 0, -6.187805, 0, -0.5, 0.5, 0.5,
-3.868774, 0, -6.187805, 1, -0.5, 0.5, 0.5,
-3.868774, 0, -6.187805, 1, 1.5, 0.5, 0.5,
-3.868774, 0, -6.187805, 0, 1.5, 0.5, 0.5,
-3.868774, 1, -6.187805, 0, -0.5, 0.5, 0.5,
-3.868774, 1, -6.187805, 1, -0.5, 0.5, 0.5,
-3.868774, 1, -6.187805, 1, 1.5, 0.5, 0.5,
-3.868774, 1, -6.187805, 0, 1.5, 0.5, 0.5,
-3.868774, 2, -6.187805, 0, -0.5, 0.5, 0.5,
-3.868774, 2, -6.187805, 1, -0.5, 0.5, 0.5,
-3.868774, 2, -6.187805, 1, 1.5, 0.5, 0.5,
-3.868774, 2, -6.187805, 0, 1.5, 0.5, 0.5
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
-3.374635, -3.055519, -4,
-3.374635, -3.055519, 4,
-3.374635, -3.055519, -4,
-3.539348, -3.204059, -4,
-3.374635, -3.055519, -2,
-3.539348, -3.204059, -2,
-3.374635, -3.055519, 0,
-3.539348, -3.204059, 0,
-3.374635, -3.055519, 2,
-3.539348, -3.204059, 2,
-3.374635, -3.055519, 4,
-3.539348, -3.204059, 4
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
-3.868774, -3.50114, -4, 0, -0.5, 0.5, 0.5,
-3.868774, -3.50114, -4, 1, -0.5, 0.5, 0.5,
-3.868774, -3.50114, -4, 1, 1.5, 0.5, 0.5,
-3.868774, -3.50114, -4, 0, 1.5, 0.5, 0.5,
-3.868774, -3.50114, -2, 0, -0.5, 0.5, 0.5,
-3.868774, -3.50114, -2, 1, -0.5, 0.5, 0.5,
-3.868774, -3.50114, -2, 1, 1.5, 0.5, 0.5,
-3.868774, -3.50114, -2, 0, 1.5, 0.5, 0.5,
-3.868774, -3.50114, 0, 0, -0.5, 0.5, 0.5,
-3.868774, -3.50114, 0, 1, -0.5, 0.5, 0.5,
-3.868774, -3.50114, 0, 1, 1.5, 0.5, 0.5,
-3.868774, -3.50114, 0, 0, 1.5, 0.5, 0.5,
-3.868774, -3.50114, 2, 0, -0.5, 0.5, 0.5,
-3.868774, -3.50114, 2, 1, -0.5, 0.5, 0.5,
-3.868774, -3.50114, 2, 1, 1.5, 0.5, 0.5,
-3.868774, -3.50114, 2, 0, 1.5, 0.5, 0.5,
-3.868774, -3.50114, 4, 0, -0.5, 0.5, 0.5,
-3.868774, -3.50114, 4, 1, -0.5, 0.5, 0.5,
-3.868774, -3.50114, 4, 1, 1.5, 0.5, 0.5,
-3.868774, -3.50114, 4, 0, 1.5, 0.5, 0.5
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
-3.374635, -3.055519, -5.353454,
-3.374635, 2.886081, -5.353454,
-3.374635, -3.055519, 5.77122,
-3.374635, 2.886081, 5.77122,
-3.374635, -3.055519, -5.353454,
-3.374635, -3.055519, 5.77122,
-3.374635, 2.886081, -5.353454,
-3.374635, 2.886081, 5.77122,
-3.374635, -3.055519, -5.353454,
3.213887, -3.055519, -5.353454,
-3.374635, -3.055519, 5.77122,
3.213887, -3.055519, 5.77122,
-3.374635, 2.886081, -5.353454,
3.213887, 2.886081, -5.353454,
-3.374635, 2.886081, 5.77122,
3.213887, 2.886081, 5.77122,
3.213887, -3.055519, -5.353454,
3.213887, 2.886081, -5.353454,
3.213887, -3.055519, 5.77122,
3.213887, 2.886081, 5.77122,
3.213887, -3.055519, -5.353454,
3.213887, -3.055519, 5.77122,
3.213887, 2.886081, -5.353454,
3.213887, 2.886081, 5.77122
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
var radius = 7.598107;
var distance = 33.80484;
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
mvMatrix.translate( 0.08037388, 0.08471894, -0.208883 );
mvMatrix.scale( 1.246899, 1.382661, 0.7384685 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.80484);
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
sec-butylamine_2-but<-read.table("sec-butylamine_2-but.xyz", skip=1)
```

```
## Error in sec - butylamine_2 - but <- read.table("sec-butylamine_2-but.xyz", : object 'sec' not found
```

```r
x<-sec-butylamine_2-but$V2
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
y<-sec-butylamine_2-but$V3
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
z<-sec-butylamine_2-but$V4
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
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
-3.278685, 0.1356461, -2.55776, 0, 0, 1, 1, 1,
-3.125817, 1.45719, 0.5552917, 1, 0, 0, 1, 1,
-2.940997, -1.302488, -2.95906, 1, 0, 0, 1, 1,
-2.863274, -0.5873899, -3.167456, 1, 0, 0, 1, 1,
-2.817079, 0.6665601, -0.343287, 1, 0, 0, 1, 1,
-2.792482, -0.110661, -2.010424, 1, 0, 0, 1, 1,
-2.65461, 1.523842, -1.745727, 0, 0, 0, 1, 1,
-2.625473, 1.11738, -2.268995, 0, 0, 0, 1, 1,
-2.559024, 0.0485261, -1.988877, 0, 0, 0, 1, 1,
-2.512141, -0.02031758, -1.830441, 0, 0, 0, 1, 1,
-2.461247, -1.072709, -3.92615, 0, 0, 0, 1, 1,
-2.422199, 0.36353, -1.25304, 0, 0, 0, 1, 1,
-2.408401, -1.449845, -3.359482, 0, 0, 0, 1, 1,
-2.405931, -0.3082972, -2.07923, 1, 1, 1, 1, 1,
-2.379897, 1.705025, -2.166689, 1, 1, 1, 1, 1,
-2.340928, 0.932705, 0.1474235, 1, 1, 1, 1, 1,
-2.298436, -0.8276123, -0.8416981, 1, 1, 1, 1, 1,
-2.273667, -0.2261313, -1.848761, 1, 1, 1, 1, 1,
-2.271211, 2.475038, -1.878739, 1, 1, 1, 1, 1,
-2.222341, -0.0971821, -2.597085, 1, 1, 1, 1, 1,
-2.221461, -0.1735985, -2.891157, 1, 1, 1, 1, 1,
-2.192345, -0.8319174, -1.921201, 1, 1, 1, 1, 1,
-2.146178, -0.5103173, -3.723354, 1, 1, 1, 1, 1,
-2.073673, -0.9397013, -1.959885, 1, 1, 1, 1, 1,
-2.071623, 1.336302, -1.028134, 1, 1, 1, 1, 1,
-2.005831, 0.4912972, -2.053609, 1, 1, 1, 1, 1,
-1.971578, -1.614824, -3.442973, 1, 1, 1, 1, 1,
-1.96344, -0.9112453, -1.500111, 1, 1, 1, 1, 1,
-1.953417, -1.122042, -2.551996, 0, 0, 1, 1, 1,
-1.929883, -0.9604475, -0.7681273, 1, 0, 0, 1, 1,
-1.929045, -0.825406, -0.7292045, 1, 0, 0, 1, 1,
-1.889673, 0.7934146, -2.508808, 1, 0, 0, 1, 1,
-1.862809, 1.012397, -0.1588152, 1, 0, 0, 1, 1,
-1.862298, -0.05690527, -0.7607555, 1, 0, 0, 1, 1,
-1.823415, -0.6022204, -1.417625, 0, 0, 0, 1, 1,
-1.810738, 2.386885, 0.1528393, 0, 0, 0, 1, 1,
-1.802778, -1.356967, -0.7515898, 0, 0, 0, 1, 1,
-1.796927, 0.743999, -0.5379962, 0, 0, 0, 1, 1,
-1.771212, -0.02633036, -1.589912, 0, 0, 0, 1, 1,
-1.770919, -0.9484836, -1.675967, 0, 0, 0, 1, 1,
-1.762399, 0.9504924, -1.586621, 0, 0, 0, 1, 1,
-1.760499, 1.534169, -0.780513, 1, 1, 1, 1, 1,
-1.759645, -0.1885719, -1.665159, 1, 1, 1, 1, 1,
-1.755436, 1.256855, -1.768666, 1, 1, 1, 1, 1,
-1.746925, 2.117429, 0.9055175, 1, 1, 1, 1, 1,
-1.736657, -1.982882, -2.107971, 1, 1, 1, 1, 1,
-1.685968, -0.492538, -3.38854, 1, 1, 1, 1, 1,
-1.683326, 0.882651, 0.1403322, 1, 1, 1, 1, 1,
-1.680375, 0.6113224, -2.490231, 1, 1, 1, 1, 1,
-1.663027, -0.3102447, -2.97248, 1, 1, 1, 1, 1,
-1.661888, 0.8536693, -2.059237, 1, 1, 1, 1, 1,
-1.646739, 0.3836407, -2.269522, 1, 1, 1, 1, 1,
-1.639001, -0.672808, -1.028504, 1, 1, 1, 1, 1,
-1.629936, 1.113032, 0.2846492, 1, 1, 1, 1, 1,
-1.616171, -0.7388378, -1.555502, 1, 1, 1, 1, 1,
-1.6111, 0.5145577, -0.5281577, 1, 1, 1, 1, 1,
-1.608567, -1.209219, -4.563861, 0, 0, 1, 1, 1,
-1.600788, -2.739147, -0.4630139, 1, 0, 0, 1, 1,
-1.600282, 0.8811567, -1.558601, 1, 0, 0, 1, 1,
-1.599877, -0.389158, -1.599754, 1, 0, 0, 1, 1,
-1.595412, 0.3488842, -1.544862, 1, 0, 0, 1, 1,
-1.567272, 0.5182767, -0.3860882, 1, 0, 0, 1, 1,
-1.560498, -0.8659095, -3.026906, 0, 0, 0, 1, 1,
-1.554364, -0.2616471, -1.726652, 0, 0, 0, 1, 1,
-1.547688, 1.372393, -1.879532, 0, 0, 0, 1, 1,
-1.547627, -1.07794, -1.396622, 0, 0, 0, 1, 1,
-1.542163, -0.3168418, -0.4179912, 0, 0, 0, 1, 1,
-1.538717, -0.8397837, -2.303154, 0, 0, 0, 1, 1,
-1.532513, 1.291264, -1.110687, 0, 0, 0, 1, 1,
-1.526385, -0.3687777, -2.631759, 1, 1, 1, 1, 1,
-1.519839, 1.343814, -0.490919, 1, 1, 1, 1, 1,
-1.518011, 0.7201005, -0.1365124, 1, 1, 1, 1, 1,
-1.513626, -0.3096229, -1.13496, 1, 1, 1, 1, 1,
-1.495264, 0.9324048, -1.271206, 1, 1, 1, 1, 1,
-1.493656, 1.258105, -0.4009166, 1, 1, 1, 1, 1,
-1.493386, 0.5674502, -3.674504, 1, 1, 1, 1, 1,
-1.480994, 0.2614055, -1.658696, 1, 1, 1, 1, 1,
-1.460074, 0.2299088, -1.931424, 1, 1, 1, 1, 1,
-1.45429, 0.7605894, -2.39257, 1, 1, 1, 1, 1,
-1.445527, 0.8473299, -1.495744, 1, 1, 1, 1, 1,
-1.441741, 0.7276175, -0.4918225, 1, 1, 1, 1, 1,
-1.440838, -1.16393, -3.919334, 1, 1, 1, 1, 1,
-1.437343, 0.45783, -0.136581, 1, 1, 1, 1, 1,
-1.435388, 0.2340749, -1.393023, 1, 1, 1, 1, 1,
-1.426868, 0.2786365, -0.3374813, 0, 0, 1, 1, 1,
-1.417631, -1.178872, -2.256839, 1, 0, 0, 1, 1,
-1.416965, -0.02250995, -1.182296, 1, 0, 0, 1, 1,
-1.415775, -0.6356996, -3.394935, 1, 0, 0, 1, 1,
-1.412713, -0.7076082, -3.232663, 1, 0, 0, 1, 1,
-1.396532, -2.523488, -1.175631, 1, 0, 0, 1, 1,
-1.391912, 0.06834415, -0.5081475, 0, 0, 0, 1, 1,
-1.37129, -0.2358098, 0.07892267, 0, 0, 0, 1, 1,
-1.36438, 1.132486, -1.383432, 0, 0, 0, 1, 1,
-1.363166, 0.5021526, -1.383872, 0, 0, 0, 1, 1,
-1.362758, -0.4601993, -3.8402, 0, 0, 0, 1, 1,
-1.348821, -0.3943458, -2.435564, 0, 0, 0, 1, 1,
-1.345671, 0.3459377, 0.986964, 0, 0, 0, 1, 1,
-1.334904, -2.239362, -1.592967, 1, 1, 1, 1, 1,
-1.328812, -0.2117719, -0.578703, 1, 1, 1, 1, 1,
-1.317089, -0.316366, -1.916988, 1, 1, 1, 1, 1,
-1.316737, 0.1333866, -1.215678, 1, 1, 1, 1, 1,
-1.316237, -0.0002462229, -2.514385, 1, 1, 1, 1, 1,
-1.316118, -0.2358548, -3.007565, 1, 1, 1, 1, 1,
-1.309703, -0.4952112, -2.666792, 1, 1, 1, 1, 1,
-1.283759, 0.8301024, -0.7067919, 1, 1, 1, 1, 1,
-1.282246, 0.9748488, -1.787852, 1, 1, 1, 1, 1,
-1.281973, -2.944511, -2.262042, 1, 1, 1, 1, 1,
-1.281134, -1.611309, -2.58937, 1, 1, 1, 1, 1,
-1.278595, -0.4170887, 0.09324805, 1, 1, 1, 1, 1,
-1.269505, 0.9178924, -2.067929, 1, 1, 1, 1, 1,
-1.2655, 0.06874241, -0.1809291, 1, 1, 1, 1, 1,
-1.264793, -0.0947229, -1.566257, 1, 1, 1, 1, 1,
-1.258817, -1.483545, -2.335405, 0, 0, 1, 1, 1,
-1.257278, -0.08425041, -2.622229, 1, 0, 0, 1, 1,
-1.250896, -0.1058047, -0.8549494, 1, 0, 0, 1, 1,
-1.250713, -1.545963, 0.3144612, 1, 0, 0, 1, 1,
-1.24554, 0.2981478, -1.29076, 1, 0, 0, 1, 1,
-1.236727, -0.2834644, -1.745334, 1, 0, 0, 1, 1,
-1.230515, -0.2724559, -1.07516, 0, 0, 0, 1, 1,
-1.226285, -0.4346528, -1.977148, 0, 0, 0, 1, 1,
-1.219375, -0.2899151, -2.408556, 0, 0, 0, 1, 1,
-1.200679, 1.993267, 0.9240192, 0, 0, 0, 1, 1,
-1.19454, 1.547097, 0.5804871, 0, 0, 0, 1, 1,
-1.190128, -0.08124633, -1.14233, 0, 0, 0, 1, 1,
-1.181402, -0.5913442, -0.7015252, 0, 0, 0, 1, 1,
-1.177371, -0.7198946, -4.240631, 1, 1, 1, 1, 1,
-1.170484, 0.941252, -3.647616, 1, 1, 1, 1, 1,
-1.167915, -0.0179201, -2.510867, 1, 1, 1, 1, 1,
-1.159009, -1.079828, -1.248183, 1, 1, 1, 1, 1,
-1.150274, 0.4418109, -2.410408, 1, 1, 1, 1, 1,
-1.144042, 2.062759, 1.021229, 1, 1, 1, 1, 1,
-1.137803, 1.495749, 0.04336612, 1, 1, 1, 1, 1,
-1.131338, 0.3402034, -2.066972, 1, 1, 1, 1, 1,
-1.130352, -0.7466138, -1.13696, 1, 1, 1, 1, 1,
-1.124236, -0.2940051, -2.832745, 1, 1, 1, 1, 1,
-1.115598, -0.7277902, -2.482035, 1, 1, 1, 1, 1,
-1.114186, -0.6780453, -2.362051, 1, 1, 1, 1, 1,
-1.101379, -0.93857, -2.439759, 1, 1, 1, 1, 1,
-1.098877, 0.03359443, -0.7597529, 1, 1, 1, 1, 1,
-1.086668, 0.4971884, -0.263529, 1, 1, 1, 1, 1,
-1.084347, 0.6025956, -0.9719345, 0, 0, 1, 1, 1,
-1.084204, 0.3742946, -0.6907964, 1, 0, 0, 1, 1,
-1.079792, -0.19417, -1.352079, 1, 0, 0, 1, 1,
-1.078943, 0.4161296, -0.6955834, 1, 0, 0, 1, 1,
-1.07813, 0.2413002, -0.09799494, 1, 0, 0, 1, 1,
-1.07598, -0.5697016, -2.767176, 1, 0, 0, 1, 1,
-1.074348, -0.5971144, -3.709508, 0, 0, 0, 1, 1,
-1.070201, -1.973994, -2.730799, 0, 0, 0, 1, 1,
-1.065165, 0.182544, -2.946414, 0, 0, 0, 1, 1,
-1.054977, 0.6611817, -0.7048439, 0, 0, 0, 1, 1,
-1.044397, 0.04667101, -2.028522, 0, 0, 0, 1, 1,
-1.032783, 0.7066805, -1.796124, 0, 0, 0, 1, 1,
-1.026368, 0.7628519, -1.133494, 0, 0, 0, 1, 1,
-1.020642, 0.3395192, -0.5818322, 1, 1, 1, 1, 1,
-1.018925, -0.2949079, -3.856916, 1, 1, 1, 1, 1,
-1.013451, 1.698918, -0.1641157, 1, 1, 1, 1, 1,
-1.006572, -0.02663839, -0.1370365, 1, 1, 1, 1, 1,
-1.005296, 1.672375, -1.59472, 1, 1, 1, 1, 1,
-1.003045, 0.8514919, -1.113862, 1, 1, 1, 1, 1,
-1.001779, 0.5646471, -0.5070414, 1, 1, 1, 1, 1,
-0.9998672, 0.143745, -3.06876, 1, 1, 1, 1, 1,
-0.9984494, -1.146152, -3.335639, 1, 1, 1, 1, 1,
-0.9959748, -0.6194331, -1.175208, 1, 1, 1, 1, 1,
-0.9914699, 0.0664788, -0.6709005, 1, 1, 1, 1, 1,
-0.9913406, -0.7899931, -3.028607, 1, 1, 1, 1, 1,
-0.9897515, -0.07774811, -3.438961, 1, 1, 1, 1, 1,
-0.9862286, 0.7816477, 0.9194943, 1, 1, 1, 1, 1,
-0.9826419, 0.9330146, 1.372746, 1, 1, 1, 1, 1,
-0.9793437, -0.03745355, -0.09630461, 0, 0, 1, 1, 1,
-0.9586669, 1.504631, 0.4212798, 1, 0, 0, 1, 1,
-0.9554071, -0.9770365, -1.92431, 1, 0, 0, 1, 1,
-0.9540914, 0.7103032, -1.766103, 1, 0, 0, 1, 1,
-0.9506425, -0.4291731, -5.191444, 1, 0, 0, 1, 1,
-0.9498809, -0.18815, -1.682053, 1, 0, 0, 1, 1,
-0.9440157, -0.02664524, -2.255488, 0, 0, 0, 1, 1,
-0.9310348, -0.5820481, -2.799056, 0, 0, 0, 1, 1,
-0.9190267, 0.2391091, -1.310407, 0, 0, 0, 1, 1,
-0.9184807, -1.504834, -2.39868, 0, 0, 0, 1, 1,
-0.9182853, -0.7835997, -2.129603, 0, 0, 0, 1, 1,
-0.913972, 0.6346904, -0.9336045, 0, 0, 0, 1, 1,
-0.9059276, -0.1386549, -1.625704, 0, 0, 0, 1, 1,
-0.8946247, 1.643421, 0.650665, 1, 1, 1, 1, 1,
-0.8933946, 0.627839, -1.544687, 1, 1, 1, 1, 1,
-0.8920318, -0.4272603, -3.77888, 1, 1, 1, 1, 1,
-0.8687354, 0.3977872, -2.139922, 1, 1, 1, 1, 1,
-0.8599982, 2.139089, -0.8436741, 1, 1, 1, 1, 1,
-0.854076, -0.6283059, -2.171828, 1, 1, 1, 1, 1,
-0.853267, -0.06008535, -1.671937, 1, 1, 1, 1, 1,
-0.8510654, 0.5209577, -0.4709278, 1, 1, 1, 1, 1,
-0.8505935, -1.027078, -2.184397, 1, 1, 1, 1, 1,
-0.8485234, 0.3876818, -2.115899, 1, 1, 1, 1, 1,
-0.8398692, -0.9670237, -3.973037, 1, 1, 1, 1, 1,
-0.8397201, 0.4720275, -0.3151399, 1, 1, 1, 1, 1,
-0.8365735, -0.6569005, -1.717733, 1, 1, 1, 1, 1,
-0.8307762, 0.7833571, -1.082943, 1, 1, 1, 1, 1,
-0.8262143, 0.7631755, -1.574459, 1, 1, 1, 1, 1,
-0.825208, -0.5659015, -3.020659, 0, 0, 1, 1, 1,
-0.8227502, 0.1155308, -1.481185, 1, 0, 0, 1, 1,
-0.821566, -0.190364, -3.55804, 1, 0, 0, 1, 1,
-0.8187511, -1.499477, -2.063828, 1, 0, 0, 1, 1,
-0.8173661, -0.001390435, -2.279288, 1, 0, 0, 1, 1,
-0.817071, -0.4546136, -1.839554, 1, 0, 0, 1, 1,
-0.817014, -0.3404998, -2.219034, 0, 0, 0, 1, 1,
-0.8140128, -0.9350902, -3.493073, 0, 0, 0, 1, 1,
-0.809011, 1.973577, -0.1105209, 0, 0, 0, 1, 1,
-0.8076388, 1.323913, -2.437822, 0, 0, 0, 1, 1,
-0.8061289, -1.049827, -2.145724, 0, 0, 0, 1, 1,
-0.8052058, 0.8240898, -0.5781835, 0, 0, 0, 1, 1,
-0.7900668, 0.8300075, -1.947697, 0, 0, 0, 1, 1,
-0.7893143, -0.6762441, -3.300084, 1, 1, 1, 1, 1,
-0.7884412, 1.085664, 0.0113755, 1, 1, 1, 1, 1,
-0.7843714, -0.2140631, -3.141367, 1, 1, 1, 1, 1,
-0.7827466, 0.09498302, -3.273769, 1, 1, 1, 1, 1,
-0.7810177, 0.1987396, -1.437016, 1, 1, 1, 1, 1,
-0.7792793, -0.3984421, -1.860149, 1, 1, 1, 1, 1,
-0.775088, 1.14902, 1.083894, 1, 1, 1, 1, 1,
-0.7682366, -0.1078023, -1.51044, 1, 1, 1, 1, 1,
-0.7664689, -0.3473628, -3.1786, 1, 1, 1, 1, 1,
-0.7616401, 1.746849, 0.1713497, 1, 1, 1, 1, 1,
-0.7578189, 1.528164, -0.4431317, 1, 1, 1, 1, 1,
-0.7564142, -0.3845156, -2.443893, 1, 1, 1, 1, 1,
-0.7548965, 1.160873, -1.975902, 1, 1, 1, 1, 1,
-0.7506511, 1.794666, -0.08103224, 1, 1, 1, 1, 1,
-0.7504333, 1.585869, -1.533663, 1, 1, 1, 1, 1,
-0.7468158, -0.4385991, -1.64378, 0, 0, 1, 1, 1,
-0.7467713, -0.7034076, -3.109087, 1, 0, 0, 1, 1,
-0.7466405, -0.9400893, -3.358752, 1, 0, 0, 1, 1,
-0.7356258, -1.162068, -3.022155, 1, 0, 0, 1, 1,
-0.7342755, 1.120548, -0.4956069, 1, 0, 0, 1, 1,
-0.733281, -0.1602915, 0.1753358, 1, 0, 0, 1, 1,
-0.7314585, -0.4214149, -0.5140414, 0, 0, 0, 1, 1,
-0.7303925, 0.3055397, -0.238895, 0, 0, 0, 1, 1,
-0.7217218, -2.151058, -3.277242, 0, 0, 0, 1, 1,
-0.7201856, 0.239808, -2.08285, 0, 0, 0, 1, 1,
-0.7169443, -0.763285, -2.517647, 0, 0, 0, 1, 1,
-0.7165121, -0.7053522, -3.963418, 0, 0, 0, 1, 1,
-0.7144686, 0.515826, -1.037825, 0, 0, 0, 1, 1,
-0.7133764, -0.1633287, -0.4940969, 1, 1, 1, 1, 1,
-0.709369, -0.2892374, -3.988042, 1, 1, 1, 1, 1,
-0.7077973, 0.1902077, -1.284029, 1, 1, 1, 1, 1,
-0.7069347, 0.3273064, -0.9667624, 1, 1, 1, 1, 1,
-0.7031597, 0.8746932, -0.09239335, 1, 1, 1, 1, 1,
-0.701, -0.7837777, -2.494838, 1, 1, 1, 1, 1,
-0.7002268, 0.7647056, -1.318638, 1, 1, 1, 1, 1,
-0.6989136, -1.278943, -0.5695031, 1, 1, 1, 1, 1,
-0.6985614, 0.2700295, -1.085864, 1, 1, 1, 1, 1,
-0.6973025, 1.7647, -0.5466642, 1, 1, 1, 1, 1,
-0.6970001, 1.441644, 0.09447508, 1, 1, 1, 1, 1,
-0.6931562, -0.2309172, -2.227922, 1, 1, 1, 1, 1,
-0.6897312, 0.7171292, -1.277189, 1, 1, 1, 1, 1,
-0.6890409, -0.8093168, -3.702945, 1, 1, 1, 1, 1,
-0.6878352, -1.580638, -0.09144549, 1, 1, 1, 1, 1,
-0.6873981, -0.2064883, -2.488371, 0, 0, 1, 1, 1,
-0.6869063, 1.319681, 0.09531916, 1, 0, 0, 1, 1,
-0.6836438, 0.0513527, -2.174014, 1, 0, 0, 1, 1,
-0.6833209, 1.112561, -0.2923843, 1, 0, 0, 1, 1,
-0.6829334, -0.02731058, -2.525538, 1, 0, 0, 1, 1,
-0.679528, -1.101812, -1.399667, 1, 0, 0, 1, 1,
-0.6779981, -0.3303117, -0.7698083, 0, 0, 0, 1, 1,
-0.6776596, 0.3310294, -2.332961, 0, 0, 0, 1, 1,
-0.6723375, 1.064843, -1.252641, 0, 0, 0, 1, 1,
-0.6705543, 0.7267386, -1.287144, 0, 0, 0, 1, 1,
-0.6698411, 0.6057734, -0.4760808, 0, 0, 0, 1, 1,
-0.6681514, 0.1666568, 0.1021046, 0, 0, 0, 1, 1,
-0.665445, -0.9227166, -2.666768, 0, 0, 0, 1, 1,
-0.6650622, 0.01587126, -2.05055, 1, 1, 1, 1, 1,
-0.6621875, 0.8189849, -0.7560636, 1, 1, 1, 1, 1,
-0.6597096, 0.8248777, -1.187661, 1, 1, 1, 1, 1,
-0.6591979, 0.7989851, -0.9757013, 1, 1, 1, 1, 1,
-0.6475384, 0.629087, 0.5980148, 1, 1, 1, 1, 1,
-0.6473776, -0.8412356, -1.904228, 1, 1, 1, 1, 1,
-0.6424938, -0.6660293, -0.9835781, 1, 1, 1, 1, 1,
-0.6384076, -1.044005, -3.50445, 1, 1, 1, 1, 1,
-0.6317176, -0.7129138, -2.154465, 1, 1, 1, 1, 1,
-0.6310071, 0.7724094, -1.302396, 1, 1, 1, 1, 1,
-0.6268464, 1.630677, -0.3398725, 1, 1, 1, 1, 1,
-0.6173683, -0.05074754, -0.476684, 1, 1, 1, 1, 1,
-0.6163141, 0.0638513, -2.502985, 1, 1, 1, 1, 1,
-0.6103225, 1.402024, -1.376544, 1, 1, 1, 1, 1,
-0.6017304, 1.059403, -0.04172728, 1, 1, 1, 1, 1,
-0.596728, -1.555716, -1.806804, 0, 0, 1, 1, 1,
-0.5956029, -0.4704123, -1.430272, 1, 0, 0, 1, 1,
-0.5911689, -0.07438815, -0.8386585, 1, 0, 0, 1, 1,
-0.5911614, 0.152813, -2.483599, 1, 0, 0, 1, 1,
-0.5856385, 0.3938719, -1.56521, 1, 0, 0, 1, 1,
-0.5841758, -1.02795, -1.472868, 1, 0, 0, 1, 1,
-0.5814002, -0.7302466, -3.247449, 0, 0, 0, 1, 1,
-0.5748621, 1.099985, 0.30529, 0, 0, 0, 1, 1,
-0.5659894, 0.5288066, -0.5532039, 0, 0, 0, 1, 1,
-0.5653911, -1.616281, -4.730781, 0, 0, 0, 1, 1,
-0.56264, 1.301557, 0.9782375, 0, 0, 0, 1, 1,
-0.5625248, -0.7604818, -2.079917, 0, 0, 0, 1, 1,
-0.5610104, 0.923141, -0.182836, 0, 0, 0, 1, 1,
-0.5567009, -1.513618, -3.410218, 1, 1, 1, 1, 1,
-0.5524218, -0.5449524, -2.062668, 1, 1, 1, 1, 1,
-0.5516694, -0.3838675, -3.199236, 1, 1, 1, 1, 1,
-0.5490397, 1.145231, -1.404389, 1, 1, 1, 1, 1,
-0.5429227, 1.679517, 0.6977278, 1, 1, 1, 1, 1,
-0.5410432, 2.059155, -0.2738251, 1, 1, 1, 1, 1,
-0.5388112, -0.8014534, -2.548184, 1, 1, 1, 1, 1,
-0.5358554, -1.58639, -2.398096, 1, 1, 1, 1, 1,
-0.5317081, -2.083322, -3.583288, 1, 1, 1, 1, 1,
-0.5294723, -1.182936, -3.011396, 1, 1, 1, 1, 1,
-0.5289331, 0.3497149, -0.9738988, 1, 1, 1, 1, 1,
-0.5270562, 0.1976213, 0.07377159, 1, 1, 1, 1, 1,
-0.5266368, 0.4438335, -1.267101, 1, 1, 1, 1, 1,
-0.5225358, 2.200141, 1.286494, 1, 1, 1, 1, 1,
-0.5216662, 0.3805826, -0.6592924, 1, 1, 1, 1, 1,
-0.5202733, 0.6634951, 0.8517801, 0, 0, 1, 1, 1,
-0.5188681, 0.6825902, -0.7178445, 1, 0, 0, 1, 1,
-0.5175443, 1.261436, -2.05862, 1, 0, 0, 1, 1,
-0.514747, 0.4622549, -0.6590291, 1, 0, 0, 1, 1,
-0.5134421, 0.3380674, -0.7470655, 1, 0, 0, 1, 1,
-0.5043337, 1.439307, 0.009307646, 1, 0, 0, 1, 1,
-0.5040516, -0.8349699, -4.293836, 0, 0, 0, 1, 1,
-0.501219, -0.1073591, -3.946462, 0, 0, 0, 1, 1,
-0.5009184, -0.6786211, -3.896733, 0, 0, 0, 1, 1,
-0.4994602, -1.450806, -3.759279, 0, 0, 0, 1, 1,
-0.4930755, 0.519456, -0.4438127, 0, 0, 0, 1, 1,
-0.4878175, -0.5556462, -1.857397, 0, 0, 0, 1, 1,
-0.4864152, -0.5009773, -2.851722, 0, 0, 0, 1, 1,
-0.4861016, 0.6197395, -0.7917864, 1, 1, 1, 1, 1,
-0.4802061, -1.334959, -2.655471, 1, 1, 1, 1, 1,
-0.4792584, 0.1183288, -0.5340695, 1, 1, 1, 1, 1,
-0.4778974, -1.983268, -4.253911, 1, 1, 1, 1, 1,
-0.4748182, 1.572343, -1.335739, 1, 1, 1, 1, 1,
-0.4745654, -0.4591762, -3.05429, 1, 1, 1, 1, 1,
-0.4722008, 0.8244639, -0.7546745, 1, 1, 1, 1, 1,
-0.4675553, -0.6107224, -3.011697, 1, 1, 1, 1, 1,
-0.462905, 0.4810956, -0.6289358, 1, 1, 1, 1, 1,
-0.4590029, 0.1886666, -2.103765, 1, 1, 1, 1, 1,
-0.4567125, -0.117499, -0.170208, 1, 1, 1, 1, 1,
-0.454767, -0.08548348, -2.46591, 1, 1, 1, 1, 1,
-0.4539334, -1.32627, -3.40755, 1, 1, 1, 1, 1,
-0.4525461, 0.09330868, -1.270795, 1, 1, 1, 1, 1,
-0.4512686, 1.400454, -0.1469885, 1, 1, 1, 1, 1,
-0.4498779, -0.2142888, -2.820735, 0, 0, 1, 1, 1,
-0.446813, -0.4354645, -1.7272, 1, 0, 0, 1, 1,
-0.4460698, 0.006508961, -1.893098, 1, 0, 0, 1, 1,
-0.4453671, 1.238194, -1.823675, 1, 0, 0, 1, 1,
-0.4363611, -0.07130645, -1.085498, 1, 0, 0, 1, 1,
-0.4352978, -0.002296282, -1.144412, 1, 0, 0, 1, 1,
-0.4334275, -0.8298611, -2.388172, 0, 0, 0, 1, 1,
-0.4333515, -0.6523746, -2.784828, 0, 0, 0, 1, 1,
-0.4322279, -0.8537007, -1.808475, 0, 0, 0, 1, 1,
-0.429664, 1.617842, -1.106349, 0, 0, 0, 1, 1,
-0.4266983, -0.02837747, -1.004735, 0, 0, 0, 1, 1,
-0.426531, 0.1289776, -0.2497025, 0, 0, 0, 1, 1,
-0.4262571, -0.2655072, -1.733743, 0, 0, 0, 1, 1,
-0.4192268, 0.1088588, 0.5393818, 1, 1, 1, 1, 1,
-0.4185812, 1.465799, -0.6808799, 1, 1, 1, 1, 1,
-0.4163712, -0.115135, -1.788037, 1, 1, 1, 1, 1,
-0.4131284, 1.198344, 1.741323, 1, 1, 1, 1, 1,
-0.4123107, 0.1586198, -0.06206098, 1, 1, 1, 1, 1,
-0.4073283, -0.3535002, -3.951021, 1, 1, 1, 1, 1,
-0.4072104, 0.2001475, 0.1009841, 1, 1, 1, 1, 1,
-0.40583, -0.07339597, -3.330769, 1, 1, 1, 1, 1,
-0.4055316, -0.4073405, -1.850921, 1, 1, 1, 1, 1,
-0.3909687, -0.05300646, -1.348001, 1, 1, 1, 1, 1,
-0.3885568, 0.5822802, -0.007829905, 1, 1, 1, 1, 1,
-0.386872, 1.764356, -0.4052103, 1, 1, 1, 1, 1,
-0.3833532, 0.5606692, -1.90984, 1, 1, 1, 1, 1,
-0.3799788, 1.559393, -1.148556, 1, 1, 1, 1, 1,
-0.3785269, -0.1781087, -2.424726, 1, 1, 1, 1, 1,
-0.377547, -0.1125745, -1.421432, 0, 0, 1, 1, 1,
-0.3729286, -0.7396778, -1.6735, 1, 0, 0, 1, 1,
-0.3717126, -0.1703556, -2.959848, 1, 0, 0, 1, 1,
-0.3716043, 1.092163, -1.140155, 1, 0, 0, 1, 1,
-0.3693823, -0.5250453, -2.588038, 1, 0, 0, 1, 1,
-0.3637325, 0.1729382, -0.7775656, 1, 0, 0, 1, 1,
-0.3623021, -0.3154047, -2.627017, 0, 0, 0, 1, 1,
-0.3616455, -0.4656691, -1.758663, 0, 0, 0, 1, 1,
-0.3610196, -0.01108101, -1.618333, 0, 0, 0, 1, 1,
-0.3574817, -0.7114623, -2.154144, 0, 0, 0, 1, 1,
-0.3560153, 0.6065127, 0.4697553, 0, 0, 0, 1, 1,
-0.3517542, -0.6095189, -4.487591, 0, 0, 0, 1, 1,
-0.3493085, 1.622601, -0.6587266, 0, 0, 0, 1, 1,
-0.3458395, 1.308942, -0.3467223, 1, 1, 1, 1, 1,
-0.3445047, 1.110152, 0.5095408, 1, 1, 1, 1, 1,
-0.343175, 0.1302636, -0.01305805, 1, 1, 1, 1, 1,
-0.3404216, 0.9342937, -0.5007606, 1, 1, 1, 1, 1,
-0.3366279, -1.165179, -2.966121, 1, 1, 1, 1, 1,
-0.3312978, 0.5077696, -0.4758423, 1, 1, 1, 1, 1,
-0.3290425, 1.534639, -1.320617, 1, 1, 1, 1, 1,
-0.3267812, -1.316426, -3.261775, 1, 1, 1, 1, 1,
-0.3259274, -0.8563877, -2.318738, 1, 1, 1, 1, 1,
-0.3233528, 0.2462448, -1.760554, 1, 1, 1, 1, 1,
-0.3182476, 0.2675571, -2.028006, 1, 1, 1, 1, 1,
-0.3179196, -0.3893764, -2.81987, 1, 1, 1, 1, 1,
-0.3169573, -2.260509, -1.988981, 1, 1, 1, 1, 1,
-0.3163288, -1.181767, -2.541454, 1, 1, 1, 1, 1,
-0.3151632, -0.3786148, -3.60675, 1, 1, 1, 1, 1,
-0.312603, 0.1619186, 0.02545824, 0, 0, 1, 1, 1,
-0.3122833, -0.02160714, -1.161964, 1, 0, 0, 1, 1,
-0.310184, -1.208626, -3.790615, 1, 0, 0, 1, 1,
-0.3069977, -0.9611815, -1.79081, 1, 0, 0, 1, 1,
-0.3044848, -0.580816, -4.424157, 1, 0, 0, 1, 1,
-0.3043792, -0.7837561, -3.276939, 1, 0, 0, 1, 1,
-0.3003435, -1.375451, -4.663172, 0, 0, 0, 1, 1,
-0.2987446, -1.468027, -2.909887, 0, 0, 0, 1, 1,
-0.2985554, -0.5751077, -2.742797, 0, 0, 0, 1, 1,
-0.297119, -0.4278336, -2.869215, 0, 0, 0, 1, 1,
-0.2963833, -0.8287847, -2.623907, 0, 0, 0, 1, 1,
-0.2959169, -1.293862, -1.130061, 0, 0, 0, 1, 1,
-0.2955373, -1.167079, -2.686801, 0, 0, 0, 1, 1,
-0.2939777, -1.839255, -3.062641, 1, 1, 1, 1, 1,
-0.2894575, 2.799553, -1.157261, 1, 1, 1, 1, 1,
-0.2874258, 1.442111, -1.26999, 1, 1, 1, 1, 1,
-0.2855569, -1.965383, -3.708496, 1, 1, 1, 1, 1,
-0.2849724, -0.6894428, -2.718111, 1, 1, 1, 1, 1,
-0.2835277, 0.6524397, 1.191914, 1, 1, 1, 1, 1,
-0.2822396, 2.41421, 1.34474, 1, 1, 1, 1, 1,
-0.2796991, 0.2173147, -1.530728, 1, 1, 1, 1, 1,
-0.2789594, 0.1752932, -0.2596348, 1, 1, 1, 1, 1,
-0.2748677, 0.690051, -0.9877733, 1, 1, 1, 1, 1,
-0.2732589, 0.4494154, 0.462946, 1, 1, 1, 1, 1,
-0.2646561, -0.1286899, -2.343597, 1, 1, 1, 1, 1,
-0.2597403, -0.9869629, -2.806387, 1, 1, 1, 1, 1,
-0.2582858, 0.8245081, -0.1448489, 1, 1, 1, 1, 1,
-0.2545563, -0.185685, -1.543543, 1, 1, 1, 1, 1,
-0.252271, -0.9498901, -2.948082, 0, 0, 1, 1, 1,
-0.2483685, -0.8768447, -1.615643, 1, 0, 0, 1, 1,
-0.2470614, 1.827951, -0.8528768, 1, 0, 0, 1, 1,
-0.2448256, 1.960384, -2.182845, 1, 0, 0, 1, 1,
-0.2426392, 0.3731131, 0.3086113, 1, 0, 0, 1, 1,
-0.2406653, -1.16693, -2.37219, 1, 0, 0, 1, 1,
-0.2398464, 0.2897765, -1.068413, 0, 0, 0, 1, 1,
-0.2392702, -1.76245, -0.8098015, 0, 0, 0, 1, 1,
-0.2390535, -0.2675222, -4.162436, 0, 0, 0, 1, 1,
-0.2358028, 0.2533326, 1.629116, 0, 0, 0, 1, 1,
-0.2337922, 1.553871, -0.7329203, 0, 0, 0, 1, 1,
-0.2328691, 0.8329059, 0.1056229, 0, 0, 0, 1, 1,
-0.2297914, 0.2342407, -2.405549, 0, 0, 0, 1, 1,
-0.2294046, -0.09043079, -1.582505, 1, 1, 1, 1, 1,
-0.2256849, -0.4908156, -1.67026, 1, 1, 1, 1, 1,
-0.2226423, 0.3394698, 0.3065087, 1, 1, 1, 1, 1,
-0.2226369, 0.6186913, 1.13569, 1, 1, 1, 1, 1,
-0.2183971, 0.8400953, 0.2620861, 1, 1, 1, 1, 1,
-0.2168616, 2.354128, -0.4245483, 1, 1, 1, 1, 1,
-0.2167766, -0.8519781, -3.065121, 1, 1, 1, 1, 1,
-0.2165781, 0.7717835, -2.746443, 1, 1, 1, 1, 1,
-0.2028421, 0.760756, 0.8090262, 1, 1, 1, 1, 1,
-0.2009128, 0.6191586, -0.01017845, 1, 1, 1, 1, 1,
-0.1984349, -1.433363, -3.670584, 1, 1, 1, 1, 1,
-0.1982639, 0.1772438, -1.302915, 1, 1, 1, 1, 1,
-0.1974699, -1.084615, -3.575524, 1, 1, 1, 1, 1,
-0.1942952, 1.111, 0.2338529, 1, 1, 1, 1, 1,
-0.1900932, -0.9353675, -3.188281, 1, 1, 1, 1, 1,
-0.1890732, 1.382799, -0.7377211, 0, 0, 1, 1, 1,
-0.1877813, -1.093281, -1.012453, 1, 0, 0, 1, 1,
-0.1827599, 1.274748, -0.230842, 1, 0, 0, 1, 1,
-0.1810649, 0.2961582, -0.5914025, 1, 0, 0, 1, 1,
-0.1748106, -0.8232967, -3.537769, 1, 0, 0, 1, 1,
-0.1698507, 0.4427516, 0.8791168, 1, 0, 0, 1, 1,
-0.1676134, 0.4085902, -0.7385811, 0, 0, 0, 1, 1,
-0.1611954, 0.09586614, -1.278949, 0, 0, 0, 1, 1,
-0.1601685, 0.06831398, -0.6543899, 0, 0, 0, 1, 1,
-0.1590611, 0.2403646, -1.116075, 0, 0, 0, 1, 1,
-0.1558205, -0.3329035, -2.585529, 0, 0, 0, 1, 1,
-0.1536529, -0.4348085, -2.504719, 0, 0, 0, 1, 1,
-0.1528393, -0.5973644, -2.761899, 0, 0, 0, 1, 1,
-0.1518681, -0.3753275, -1.688479, 1, 1, 1, 1, 1,
-0.1449888, -0.4343061, -3.602304, 1, 1, 1, 1, 1,
-0.1427364, 1.992489, 1.651673, 1, 1, 1, 1, 1,
-0.1419135, -0.9185548, -1.876502, 1, 1, 1, 1, 1,
-0.1414463, -0.1433066, -3.447777, 1, 1, 1, 1, 1,
-0.1408773, 0.8232056, -0.137303, 1, 1, 1, 1, 1,
-0.1401873, -0.0984811, -3.99932, 1, 1, 1, 1, 1,
-0.1363923, 0.316403, -1.188586, 1, 1, 1, 1, 1,
-0.1332779, -0.2906826, -2.4076, 1, 1, 1, 1, 1,
-0.1290562, 0.6648005, 1.43037, 1, 1, 1, 1, 1,
-0.1268854, -0.7392018, -2.501068, 1, 1, 1, 1, 1,
-0.1235958, 0.4158471, 0.1864816, 1, 1, 1, 1, 1,
-0.1172921, -1.43498, -3.521097, 1, 1, 1, 1, 1,
-0.1141911, -0.4811566, -2.622508, 1, 1, 1, 1, 1,
-0.1107798, 1.304217, -0.1261917, 1, 1, 1, 1, 1,
-0.1022586, -1.090665, -2.222923, 0, 0, 1, 1, 1,
-0.09048565, -2.610348, -1.158866, 1, 0, 0, 1, 1,
-0.09023188, 0.8058673, -0.9152646, 1, 0, 0, 1, 1,
-0.08072795, -0.9204757, -3.685658, 1, 0, 0, 1, 1,
-0.07968914, 0.1791807, -0.7358813, 1, 0, 0, 1, 1,
-0.07550831, 1.306272, -2.487638, 1, 0, 0, 1, 1,
-0.07509311, 0.03389573, -1.629475, 0, 0, 0, 1, 1,
-0.07113434, 1.51584, -0.9829469, 0, 0, 0, 1, 1,
-0.0702553, 0.8470717, -0.6334779, 0, 0, 0, 1, 1,
-0.06737082, 0.5141939, -1.258404, 0, 0, 0, 1, 1,
-0.06267649, -1.351032, -1.821826, 0, 0, 0, 1, 1,
-0.0613872, 0.3306604, -0.09865872, 0, 0, 0, 1, 1,
-0.0597316, 1.804176, 1.165571, 0, 0, 0, 1, 1,
-0.0499532, -0.275413, -1.848088, 1, 1, 1, 1, 1,
-0.04677637, 0.3381431, -1.699221, 1, 1, 1, 1, 1,
-0.04570055, -1.830337, -3.697046, 1, 1, 1, 1, 1,
-0.03853092, -0.4508865, -3.642476, 1, 1, 1, 1, 1,
-0.03440838, 0.06142364, 0.3281175, 1, 1, 1, 1, 1,
-0.03191403, 1.404229, 0.7291905, 1, 1, 1, 1, 1,
-0.03116465, -0.04325069, -2.633317, 1, 1, 1, 1, 1,
-0.03035834, -0.7273062, -2.385859, 1, 1, 1, 1, 1,
-0.02561754, -1.40461, -3.062994, 1, 1, 1, 1, 1,
-0.018864, -1.089836, -2.748758, 1, 1, 1, 1, 1,
-0.01523446, 0.5776026, -1.711965, 1, 1, 1, 1, 1,
-0.01501251, -0.744712, -2.890963, 1, 1, 1, 1, 1,
-0.008407041, -0.7920956, -2.90148, 1, 1, 1, 1, 1,
-0.008119639, -0.03519315, -3.247168, 1, 1, 1, 1, 1,
-0.003523356, 2.194726, 1.100836, 1, 1, 1, 1, 1,
-0.002831911, 2.065624, 0.05244903, 0, 0, 1, 1, 1,
-0.001360739, 1.046653, 0.1401678, 1, 0, 0, 1, 1,
0.005994917, -1.395086, 1.365833, 1, 0, 0, 1, 1,
0.006815731, -0.6051735, 5.465644, 1, 0, 0, 1, 1,
0.00904215, -0.3980475, 2.714028, 1, 0, 0, 1, 1,
0.01501303, 1.010349, -0.8340815, 1, 0, 0, 1, 1,
0.02549531, -1.230805, 4.231882, 0, 0, 0, 1, 1,
0.0275588, 0.7267359, 0.1499757, 0, 0, 0, 1, 1,
0.03093326, 1.576205, -0.03556034, 0, 0, 0, 1, 1,
0.03182267, -1.618179, 2.292964, 0, 0, 0, 1, 1,
0.03491673, -0.8250426, 5.402119, 0, 0, 0, 1, 1,
0.03619404, -0.8183725, 2.860783, 0, 0, 0, 1, 1,
0.03732256, -0.4563235, 1.173879, 0, 0, 0, 1, 1,
0.03738464, 1.593366, -2.358799, 1, 1, 1, 1, 1,
0.03773567, -0.6165364, 4.662458, 1, 1, 1, 1, 1,
0.04357434, 1.725328, 0.1852392, 1, 1, 1, 1, 1,
0.04706826, -1.028294, 1.7482, 1, 1, 1, 1, 1,
0.04904994, 0.7854233, -0.8294995, 1, 1, 1, 1, 1,
0.05138505, -0.05611478, 1.344072, 1, 1, 1, 1, 1,
0.0529861, -0.1591439, 2.302463, 1, 1, 1, 1, 1,
0.05355321, -0.7103329, 4.044488, 1, 1, 1, 1, 1,
0.06088134, 2.082345, -0.07033786, 1, 1, 1, 1, 1,
0.06221309, -0.3285942, 1.41864, 1, 1, 1, 1, 1,
0.06932428, -1.432643, 2.833796, 1, 1, 1, 1, 1,
0.07119798, -0.5085383, 4.111711, 1, 1, 1, 1, 1,
0.07464801, 0.9433048, 1.293067, 1, 1, 1, 1, 1,
0.07738306, 0.9726304, 0.1778179, 1, 1, 1, 1, 1,
0.08044459, 0.3578397, -1.667283, 1, 1, 1, 1, 1,
0.08100037, 0.9443946, -0.4218293, 0, 0, 1, 1, 1,
0.08108884, -2.737171, 4.195043, 1, 0, 0, 1, 1,
0.08580157, 0.3285717, -0.6054088, 1, 0, 0, 1, 1,
0.08591054, -0.225373, 1.893205, 1, 0, 0, 1, 1,
0.0861351, 0.4710304, 2.337793, 1, 0, 0, 1, 1,
0.09505723, 0.3168218, 1.182069, 1, 0, 0, 1, 1,
0.09777341, -0.2752378, 1.482674, 0, 0, 0, 1, 1,
0.1011161, -0.1427629, 1.289244, 0, 0, 0, 1, 1,
0.1023126, -0.6506206, 2.822939, 0, 0, 0, 1, 1,
0.103124, -1.00048, 1.721452, 0, 0, 0, 1, 1,
0.1031744, 0.63493, 0.4665583, 0, 0, 0, 1, 1,
0.1067159, -1.202347, 3.651824, 0, 0, 0, 1, 1,
0.1089627, -1.637611, 1.573047, 0, 0, 0, 1, 1,
0.1128534, 0.9675246, 0.5478211, 1, 1, 1, 1, 1,
0.1140081, 0.8015317, -0.5658384, 1, 1, 1, 1, 1,
0.1159883, -0.4825497, 1.457512, 1, 1, 1, 1, 1,
0.1208902, 0.5970866, -0.5026553, 1, 1, 1, 1, 1,
0.1212634, 0.02922904, 0.5330783, 1, 1, 1, 1, 1,
0.1233123, -1.867979, 2.234631, 1, 1, 1, 1, 1,
0.1250911, 0.4328582, 0.5942483, 1, 1, 1, 1, 1,
0.1253681, 0.2345151, 2.468909, 1, 1, 1, 1, 1,
0.1276715, 0.262335, 1.078334, 1, 1, 1, 1, 1,
0.1295202, -0.7264861, 1.942392, 1, 1, 1, 1, 1,
0.1361653, 0.3420866, -0.3637834, 1, 1, 1, 1, 1,
0.1389829, 1.433701, 1.81555, 1, 1, 1, 1, 1,
0.1394981, -1.231323, 2.091484, 1, 1, 1, 1, 1,
0.1421238, -1.352715, 2.066109, 1, 1, 1, 1, 1,
0.1461559, -0.852031, 1.54278, 1, 1, 1, 1, 1,
0.1463736, 0.1146292, 0.828137, 0, 0, 1, 1, 1,
0.1484773, -0.8795907, 1.15775, 1, 0, 0, 1, 1,
0.14976, 0.4778769, -1.351055, 1, 0, 0, 1, 1,
0.1524519, -0.7780462, 1.789688, 1, 0, 0, 1, 1,
0.1555364, 1.378873, 0.4032617, 1, 0, 0, 1, 1,
0.1568701, -1.084256, 2.750566, 1, 0, 0, 1, 1,
0.1585112, 1.504036, -0.4453198, 0, 0, 0, 1, 1,
0.1600992, 0.03605232, -0.7009323, 0, 0, 0, 1, 1,
0.1605057, 0.2352441, 2.290382, 0, 0, 0, 1, 1,
0.1659209, 0.8872197, 1.473317, 0, 0, 0, 1, 1,
0.1690471, 0.3305791, 2.17803, 0, 0, 0, 1, 1,
0.1696127, -0.985297, 3.698896, 0, 0, 0, 1, 1,
0.1696413, -0.006042089, 2.431857, 0, 0, 0, 1, 1,
0.1701712, 0.1941815, 1.069404, 1, 1, 1, 1, 1,
0.1771471, 0.6486023, -0.0877047, 1, 1, 1, 1, 1,
0.182152, -0.7481057, 4.648211, 1, 1, 1, 1, 1,
0.1834076, -0.7621688, 4.736695, 1, 1, 1, 1, 1,
0.1843633, -0.6674948, 1.910702, 1, 1, 1, 1, 1,
0.1886632, 0.1032449, 1.203684, 1, 1, 1, 1, 1,
0.196134, -0.7034338, 3.067363, 1, 1, 1, 1, 1,
0.1966102, 0.4342077, -0.7896312, 1, 1, 1, 1, 1,
0.1982023, 0.6047543, -0.6163496, 1, 1, 1, 1, 1,
0.1983002, -0.7113868, 4.421292, 1, 1, 1, 1, 1,
0.1988351, -2.102806, 1.160003, 1, 1, 1, 1, 1,
0.2007958, 1.534683, -0.944814, 1, 1, 1, 1, 1,
0.2019016, -0.0262215, 3.118255, 1, 1, 1, 1, 1,
0.2021214, -0.05486433, 0.942646, 1, 1, 1, 1, 1,
0.2024816, 0.9017891, -0.6016763, 1, 1, 1, 1, 1,
0.2066522, -0.4871053, 2.682176, 0, 0, 1, 1, 1,
0.2070476, 0.07125053, 2.587682, 1, 0, 0, 1, 1,
0.2137906, -1.751656, 2.10574, 1, 0, 0, 1, 1,
0.2145067, 0.3687195, 1.864772, 1, 0, 0, 1, 1,
0.2154499, -1.29202, 4.559877, 1, 0, 0, 1, 1,
0.2214202, -0.07877471, 1.316672, 1, 0, 0, 1, 1,
0.2215155, 0.186774, 0.3403071, 0, 0, 0, 1, 1,
0.2219559, 0.0689821, 2.332927, 0, 0, 0, 1, 1,
0.2224881, -0.5837353, 1.996394, 0, 0, 0, 1, 1,
0.2300604, 0.8286977, 0.0690588, 0, 0, 0, 1, 1,
0.2303316, -1.335719, 2.639755, 0, 0, 0, 1, 1,
0.2392493, 0.2108031, 1.406766, 0, 0, 0, 1, 1,
0.2408497, 0.08680403, 1.283037, 0, 0, 0, 1, 1,
0.2417251, -1.121436, 4.37753, 1, 1, 1, 1, 1,
0.2420401, 0.7908237, 1.296876, 1, 1, 1, 1, 1,
0.2424662, -0.6271426, 2.299439, 1, 1, 1, 1, 1,
0.243402, 0.1787667, 1.16588, 1, 1, 1, 1, 1,
0.243998, -0.03551833, 0.1434619, 1, 1, 1, 1, 1,
0.2441227, 2.593148, 0.1758626, 1, 1, 1, 1, 1,
0.2498203, 0.9359361, 1.606144, 1, 1, 1, 1, 1,
0.2520464, -0.1918828, 2.153022, 1, 1, 1, 1, 1,
0.2520547, -0.5805832, 2.33876, 1, 1, 1, 1, 1,
0.256156, 1.356845, -0.8306288, 1, 1, 1, 1, 1,
0.2596754, 0.01548045, 1.175673, 1, 1, 1, 1, 1,
0.2658889, 1.345815, 1.423029, 1, 1, 1, 1, 1,
0.2665188, 0.8108776, -1.724099, 1, 1, 1, 1, 1,
0.2683167, -1.190727, 2.620037, 1, 1, 1, 1, 1,
0.2684461, -0.6727935, 3.268342, 1, 1, 1, 1, 1,
0.2695018, 0.6092383, -0.1245461, 0, 0, 1, 1, 1,
0.2701526, 0.7798845, 0.02969081, 1, 0, 0, 1, 1,
0.2708912, 0.09641201, 2.587821, 1, 0, 0, 1, 1,
0.2713635, 0.5331076, -0.3285211, 1, 0, 0, 1, 1,
0.272779, 1.17908, -0.1284973, 1, 0, 0, 1, 1,
0.2728163, -0.4197017, 3.570389, 1, 0, 0, 1, 1,
0.2745973, 0.5501663, 0.2100997, 0, 0, 0, 1, 1,
0.2750922, 1.219401, 0.2919476, 0, 0, 0, 1, 1,
0.2787752, 2.5434, 0.2246247, 0, 0, 0, 1, 1,
0.2815775, -1.238141, 2.896707, 0, 0, 0, 1, 1,
0.2866848, 0.234438, 1.385515, 0, 0, 0, 1, 1,
0.29243, -0.588267, 1.570902, 0, 0, 0, 1, 1,
0.297499, -0.7994348, 3.174389, 0, 0, 0, 1, 1,
0.3007661, -1.352584, 4.276259, 1, 1, 1, 1, 1,
0.3012446, -0.06604403, 2.190348, 1, 1, 1, 1, 1,
0.3168715, 1.21425, -0.659175, 1, 1, 1, 1, 1,
0.3180957, 0.2403787, 2.262526, 1, 1, 1, 1, 1,
0.3207424, -0.01551708, 2.73116, 1, 1, 1, 1, 1,
0.3245625, 0.7507344, -1.484107, 1, 1, 1, 1, 1,
0.325821, 0.02023028, 2.415921, 1, 1, 1, 1, 1,
0.3259843, 0.2544209, 2.008489, 1, 1, 1, 1, 1,
0.3298505, -0.7834042, 1.679469, 1, 1, 1, 1, 1,
0.3319649, 0.2161003, -0.7897949, 1, 1, 1, 1, 1,
0.3322598, -1.308872, 3.162369, 1, 1, 1, 1, 1,
0.3323266, 0.2904386, -0.6415104, 1, 1, 1, 1, 1,
0.3356832, 0.7436864, -0.5619369, 1, 1, 1, 1, 1,
0.3379008, -0.7622138, 3.034601, 1, 1, 1, 1, 1,
0.3396414, -0.6428429, 1.521867, 1, 1, 1, 1, 1,
0.3398956, -1.897034, 2.632932, 0, 0, 1, 1, 1,
0.3415099, 0.1358293, 0.6153511, 1, 0, 0, 1, 1,
0.3422275, 0.03810531, 0.2024194, 1, 0, 0, 1, 1,
0.3443419, -1.017568, 2.051955, 1, 0, 0, 1, 1,
0.3449709, 1.728488, 1.303304, 1, 0, 0, 1, 1,
0.3458693, 0.1827771, 1.005566, 1, 0, 0, 1, 1,
0.3498473, 1.016421, 0.01064288, 0, 0, 0, 1, 1,
0.3524813, 0.61683, 0.2854303, 0, 0, 0, 1, 1,
0.3540182, -0.4314282, 1.185968, 0, 0, 0, 1, 1,
0.3557252, -0.9798845, 0.9699053, 0, 0, 0, 1, 1,
0.3560196, -0.2898198, 1.972017, 0, 0, 0, 1, 1,
0.3578198, -0.5666543, 1.003635, 0, 0, 0, 1, 1,
0.3601461, 0.3140531, 0.07771509, 0, 0, 0, 1, 1,
0.367206, -0.6883074, 2.431828, 1, 1, 1, 1, 1,
0.3685666, -0.4677552, 1.205227, 1, 1, 1, 1, 1,
0.3754939, 0.2910446, -1.036896, 1, 1, 1, 1, 1,
0.376278, 0.1346606, 0.5587699, 1, 1, 1, 1, 1,
0.3775233, 2.006237, -3.135289, 1, 1, 1, 1, 1,
0.3792641, 0.8887368, 0.19533, 1, 1, 1, 1, 1,
0.381832, 0.3326055, -0.3448398, 1, 1, 1, 1, 1,
0.3830617, -0.6488554, 5.60921, 1, 1, 1, 1, 1,
0.3834261, -0.645771, 2.059706, 1, 1, 1, 1, 1,
0.3849945, -0.6209816, 3.420629, 1, 1, 1, 1, 1,
0.3860525, -2.530981, 2.14969, 1, 1, 1, 1, 1,
0.3867998, -1.274043, 1.731307, 1, 1, 1, 1, 1,
0.3879672, 0.9637401, 0.5732519, 1, 1, 1, 1, 1,
0.3907199, -1.433622, 2.762385, 1, 1, 1, 1, 1,
0.3960778, -0.9221219, 3.921973, 1, 1, 1, 1, 1,
0.4043763, 0.1661981, -0.07927463, 0, 0, 1, 1, 1,
0.4065979, 0.439873, 1.767367, 1, 0, 0, 1, 1,
0.4099523, 0.880795, -1.291508, 1, 0, 0, 1, 1,
0.4106209, 0.1720039, 0.8436779, 1, 0, 0, 1, 1,
0.4184977, 0.8820463, 1.616811, 1, 0, 0, 1, 1,
0.4189992, 0.3291036, 1.937428, 1, 0, 0, 1, 1,
0.4208035, -0.02744891, 2.173491, 0, 0, 0, 1, 1,
0.4217865, -2.014462, 3.811883, 0, 0, 0, 1, 1,
0.4225863, 0.4389549, 0.02413043, 0, 0, 0, 1, 1,
0.4235165, -1.122241, 1.24913, 0, 0, 0, 1, 1,
0.4271715, 1.801682, -1.553157, 0, 0, 0, 1, 1,
0.4329481, 1.133249, 0.1400714, 0, 0, 0, 1, 1,
0.4339201, 1.377056, 0.3903342, 0, 0, 0, 1, 1,
0.4377094, 0.5038484, -0.04972023, 1, 1, 1, 1, 1,
0.4401959, 1.138044, 0.3898542, 1, 1, 1, 1, 1,
0.4428302, -0.1536781, 2.41222, 1, 1, 1, 1, 1,
0.4433618, -1.22007, 1.909551, 1, 1, 1, 1, 1,
0.4443423, -0.113231, -0.8094459, 1, 1, 1, 1, 1,
0.4449392, 0.839668, -0.1011522, 1, 1, 1, 1, 1,
0.445695, -0.3819508, 3.356631, 1, 1, 1, 1, 1,
0.4475971, -1.724861, 1.85165, 1, 1, 1, 1, 1,
0.4525189, 1.649542, 0.261824, 1, 1, 1, 1, 1,
0.4533181, -0.5061217, 3.11135, 1, 1, 1, 1, 1,
0.4562961, 1.712846, 0.6955947, 1, 1, 1, 1, 1,
0.4618723, -1.15454, 2.616996, 1, 1, 1, 1, 1,
0.4642738, 1.52374, 0.5681098, 1, 1, 1, 1, 1,
0.4664152, 1.282532, 0.2621847, 1, 1, 1, 1, 1,
0.4699301, 0.7177678, 0.1967443, 1, 1, 1, 1, 1,
0.4720605, 0.358342, 2.351616, 0, 0, 1, 1, 1,
0.4768334, 0.3769159, 1.202146, 1, 0, 0, 1, 1,
0.4808079, 1.019371, 0.8742055, 1, 0, 0, 1, 1,
0.4833402, -1.686167, 2.93696, 1, 0, 0, 1, 1,
0.4848098, 1.021655, 1.810739, 1, 0, 0, 1, 1,
0.485146, 1.44889, 0.5448462, 1, 0, 0, 1, 1,
0.491192, -1.286655, 5.12221, 0, 0, 0, 1, 1,
0.4946972, -1.495669, 3.033673, 0, 0, 0, 1, 1,
0.497469, 0.9599297, -0.7342595, 0, 0, 0, 1, 1,
0.498474, -0.5001646, 3.319772, 0, 0, 0, 1, 1,
0.5000952, -1.028638, 1.247701, 0, 0, 0, 1, 1,
0.5015075, -0.08145627, 2.011873, 0, 0, 0, 1, 1,
0.5064051, -1.191766, 2.704753, 0, 0, 0, 1, 1,
0.5067689, -0.3650647, 1.885518, 1, 1, 1, 1, 1,
0.5080233, -1.025332, 1.288307, 1, 1, 1, 1, 1,
0.5177115, -0.4528867, 1.713825, 1, 1, 1, 1, 1,
0.5202155, -0.06785612, 2.02963, 1, 1, 1, 1, 1,
0.5207256, 1.791807, 0.3023562, 1, 1, 1, 1, 1,
0.5228015, 1.081606, 0.5168085, 1, 1, 1, 1, 1,
0.5234987, -0.8389477, 1.508149, 1, 1, 1, 1, 1,
0.5322081, 0.9979481, 0.3994961, 1, 1, 1, 1, 1,
0.534457, -0.7355582, 3.178521, 1, 1, 1, 1, 1,
0.5356671, -0.1549126, 2.760921, 1, 1, 1, 1, 1,
0.5368541, -1.742989, 3.603222, 1, 1, 1, 1, 1,
0.5382168, -0.3268285, 2.560799, 1, 1, 1, 1, 1,
0.539183, 1.586308, -2.831602, 1, 1, 1, 1, 1,
0.5450085, -1.35842, 3.347219, 1, 1, 1, 1, 1,
0.5514834, -0.5345083, 1.771665, 1, 1, 1, 1, 1,
0.5565152, -1.524166, 3.290389, 0, 0, 1, 1, 1,
0.55869, -0.7366406, 1.797554, 1, 0, 0, 1, 1,
0.5623975, -0.8696942, 1.641457, 1, 0, 0, 1, 1,
0.5625156, 2.169623, -0.9766126, 1, 0, 0, 1, 1,
0.5627978, -1.735149, 1.570543, 1, 0, 0, 1, 1,
0.588546, 0.4410576, 0.837014, 1, 0, 0, 1, 1,
0.5942364, -1.159878, 3.33569, 0, 0, 0, 1, 1,
0.5952527, 0.9404956, -0.1912701, 0, 0, 0, 1, 1,
0.5956422, 0.9419202, 1.904079, 0, 0, 0, 1, 1,
0.597105, -0.2845624, 3.519345, 0, 0, 0, 1, 1,
0.5995443, 0.772054, -1.242507, 0, 0, 0, 1, 1,
0.6004785, 0.8128584, 0.6400172, 0, 0, 0, 1, 1,
0.6100658, -0.4920813, 2.211687, 0, 0, 0, 1, 1,
0.6153605, 0.5555651, 2.142346, 1, 1, 1, 1, 1,
0.6190472, 0.1648761, -0.2617748, 1, 1, 1, 1, 1,
0.6199374, -1.805034, 3.621553, 1, 1, 1, 1, 1,
0.6214561, 2.045139, 0.7355112, 1, 1, 1, 1, 1,
0.6220248, 0.6233093, 0.2060514, 1, 1, 1, 1, 1,
0.6226917, -1.417473, 2.080257, 1, 1, 1, 1, 1,
0.6261379, -0.3839469, 1.731182, 1, 1, 1, 1, 1,
0.6269911, -0.3485122, 1.620436, 1, 1, 1, 1, 1,
0.6353977, 0.5602939, -0.8364209, 1, 1, 1, 1, 1,
0.6359909, -0.4334283, 2.330636, 1, 1, 1, 1, 1,
0.6384897, 0.4724661, 1.566669, 1, 1, 1, 1, 1,
0.6433695, 1.56158, 0.7206475, 1, 1, 1, 1, 1,
0.6456048, 1.125956, 0.1427773, 1, 1, 1, 1, 1,
0.6552615, -0.6394344, 0.9601126, 1, 1, 1, 1, 1,
0.6557529, -0.5299664, 2.816944, 1, 1, 1, 1, 1,
0.6572916, 0.6715788, 0.07086981, 0, 0, 1, 1, 1,
0.6580632, -0.2933388, 1.844129, 1, 0, 0, 1, 1,
0.6582146, -0.1669351, 1.102031, 1, 0, 0, 1, 1,
0.6586586, 2.14031, 1.69083, 1, 0, 0, 1, 1,
0.6596823, 0.8289633, 0.6792184, 1, 0, 0, 1, 1,
0.6605743, -0.7194229, 1.66498, 1, 0, 0, 1, 1,
0.6617437, 0.4621097, -0.08040301, 0, 0, 0, 1, 1,
0.662456, 0.9592364, 0.504541, 0, 0, 0, 1, 1,
0.6724612, 0.3610588, -0.469451, 0, 0, 0, 1, 1,
0.6745391, 0.4288549, 2.547867, 0, 0, 0, 1, 1,
0.6823457, 0.3971968, 1.58634, 0, 0, 0, 1, 1,
0.6828263, -0.6943414, 3.442345, 0, 0, 0, 1, 1,
0.6842471, -1.992808, 3.088207, 0, 0, 0, 1, 1,
0.685927, -0.4035109, 3.208307, 1, 1, 1, 1, 1,
0.6876183, 0.3054639, 2.934328, 1, 1, 1, 1, 1,
0.6876771, 1.233508, -0.3840968, 1, 1, 1, 1, 1,
0.6889875, -0.1623462, 1.862967, 1, 1, 1, 1, 1,
0.6897916, 1.497011, -1.298405, 1, 1, 1, 1, 1,
0.690154, -0.4984117, 2.274453, 1, 1, 1, 1, 1,
0.692514, -1.046017, 1.004162, 1, 1, 1, 1, 1,
0.6972238, -0.6080356, 0.5158029, 1, 1, 1, 1, 1,
0.6980891, -0.8519319, 0.62183, 1, 1, 1, 1, 1,
0.7036838, 1.84003, -2.038594, 1, 1, 1, 1, 1,
0.7038228, 1.619588, -0.1361191, 1, 1, 1, 1, 1,
0.7040572, -0.0403888, 1.258952, 1, 1, 1, 1, 1,
0.711014, -0.7856889, 1.864082, 1, 1, 1, 1, 1,
0.7224323, 0.6415397, -0.005142819, 1, 1, 1, 1, 1,
0.7280827, -1.593869, 3.192164, 1, 1, 1, 1, 1,
0.7327828, -1.609891, 0.4729811, 0, 0, 1, 1, 1,
0.7332276, -0.2929277, 2.275061, 1, 0, 0, 1, 1,
0.7365707, -2.377623, 1.897105, 1, 0, 0, 1, 1,
0.7380546, 1.648684, 0.6432108, 1, 0, 0, 1, 1,
0.7456955, -1.188453, 1.721324, 1, 0, 0, 1, 1,
0.7584819, 0.1402961, 1.019292, 1, 0, 0, 1, 1,
0.7603582, -0.009956772, 1.872075, 0, 0, 0, 1, 1,
0.7702754, 0.4044255, 1.532414, 0, 0, 0, 1, 1,
0.7719192, -0.06275773, 2.325473, 0, 0, 0, 1, 1,
0.7736459, -1.089701, 1.515839, 0, 0, 0, 1, 1,
0.7752022, 0.08659836, 1.023879, 0, 0, 0, 1, 1,
0.7778419, 0.1798705, 3.67765, 0, 0, 0, 1, 1,
0.7803559, 0.3198047, -0.7505777, 0, 0, 0, 1, 1,
0.7816128, -0.4754438, 2.660048, 1, 1, 1, 1, 1,
0.7841817, 2.2365, -0.37049, 1, 1, 1, 1, 1,
0.7849319, -0.8360534, 2.967496, 1, 1, 1, 1, 1,
0.7862422, 0.4589446, 0.8990268, 1, 1, 1, 1, 1,
0.7907544, 0.409758, 2.487555, 1, 1, 1, 1, 1,
0.7942818, 0.6933053, 1.092837, 1, 1, 1, 1, 1,
0.7978296, -1.078218, 2.817944, 1, 1, 1, 1, 1,
0.7982078, 1.107868, 2.121328, 1, 1, 1, 1, 1,
0.7999653, -1.322425, 2.405375, 1, 1, 1, 1, 1,
0.8025012, 1.801665, 2.489836, 1, 1, 1, 1, 1,
0.8036858, 1.641767, -0.05696309, 1, 1, 1, 1, 1,
0.8230828, -0.2295048, 1.583877, 1, 1, 1, 1, 1,
0.8278659, -0.5532212, 3.112726, 1, 1, 1, 1, 1,
0.8332973, -0.6972368, 1.203046, 1, 1, 1, 1, 1,
0.8354589, 0.5852798, 0.6730753, 1, 1, 1, 1, 1,
0.8360484, 1.108756, 0.414515, 0, 0, 1, 1, 1,
0.8409414, 1.032093, 0.3893919, 1, 0, 0, 1, 1,
0.8414519, 0.5191884, 3.095769, 1, 0, 0, 1, 1,
0.8417602, -0.3036196, 3.516841, 1, 0, 0, 1, 1,
0.8515686, -0.5269297, 0.865533, 1, 0, 0, 1, 1,
0.8519273, 0.2287971, 1.867446, 1, 0, 0, 1, 1,
0.8565728, 0.2257097, 2.03688, 0, 0, 0, 1, 1,
0.868737, -0.2755649, 2.468115, 0, 0, 0, 1, 1,
0.8718813, 0.2704182, 0.1608166, 0, 0, 0, 1, 1,
0.8760798, 1.555861, 1.291671, 0, 0, 0, 1, 1,
0.8805941, 0.6378867, 1.558562, 0, 0, 0, 1, 1,
0.8857807, 0.129614, 2.591472, 0, 0, 0, 1, 1,
0.8865795, 1.174777, 1.935672, 0, 0, 0, 1, 1,
0.8866324, -0.04791558, 2.405992, 1, 1, 1, 1, 1,
0.8875465, 0.3694296, 1.392007, 1, 1, 1, 1, 1,
0.8895504, 0.7724923, -0.3926315, 1, 1, 1, 1, 1,
0.8898502, -0.7365124, 2.911825, 1, 1, 1, 1, 1,
0.8899507, 1.47137, 0.8154008, 1, 1, 1, 1, 1,
0.897236, 0.2648349, 1.061369, 1, 1, 1, 1, 1,
0.9030738, 1.503041, 1.556975, 1, 1, 1, 1, 1,
0.905486, -1.405359, 2.338488, 1, 1, 1, 1, 1,
0.9081234, 0.3517727, 2.417042, 1, 1, 1, 1, 1,
0.9083618, 1.772699, 0.2364271, 1, 1, 1, 1, 1,
0.9103784, 0.4253375, 1.504992, 1, 1, 1, 1, 1,
0.9124467, 0.5474669, 2.027981, 1, 1, 1, 1, 1,
0.9185529, -0.8548313, 1.4108, 1, 1, 1, 1, 1,
0.931614, 0.4225491, 0.8707753, 1, 1, 1, 1, 1,
0.9327382, -1.182297, 1.857953, 1, 1, 1, 1, 1,
0.9350101, 2.038695, 1.989634, 0, 0, 1, 1, 1,
0.9383725, 0.658977, 0.251016, 1, 0, 0, 1, 1,
0.939384, -0.01704235, 0.5980719, 1, 0, 0, 1, 1,
0.9401772, -0.0002268589, 3.572744, 1, 0, 0, 1, 1,
0.9404665, 1.103276, 0.2161406, 1, 0, 0, 1, 1,
0.9404919, -0.8323727, 3.242808, 1, 0, 0, 1, 1,
0.9415855, 0.005319775, 2.063416, 0, 0, 0, 1, 1,
0.9489539, 0.2078445, 1.359108, 0, 0, 0, 1, 1,
0.9575862, 0.09422618, 2.970529, 0, 0, 0, 1, 1,
0.9671339, -0.7078949, 2.688529, 0, 0, 0, 1, 1,
0.9809282, -0.1091723, 1.701342, 0, 0, 0, 1, 1,
0.9819345, -0.4125279, 1.813559, 0, 0, 0, 1, 1,
0.9828773, 0.5825958, 1.499917, 0, 0, 0, 1, 1,
0.9831077, 0.8840665, 1.690014, 1, 1, 1, 1, 1,
0.9844676, 0.0009962881, 1.9555, 1, 1, 1, 1, 1,
0.9938031, 0.4757403, 1.140762, 1, 1, 1, 1, 1,
1.000922, 0.7653989, 0.7009776, 1, 1, 1, 1, 1,
1.003206, 0.5235862, 1.131728, 1, 1, 1, 1, 1,
1.005427, -1.399692, 2.874891, 1, 1, 1, 1, 1,
1.010883, 1.11604, 3.103189, 1, 1, 1, 1, 1,
1.011716, -1.353506, 4.523405, 1, 1, 1, 1, 1,
1.013585, 1.035479, 0.08055476, 1, 1, 1, 1, 1,
1.02532, 1.141239, 2.777503, 1, 1, 1, 1, 1,
1.032032, 1.646383, 1.114037, 1, 1, 1, 1, 1,
1.033381, -0.6232459, 3.591875, 1, 1, 1, 1, 1,
1.054665, 1.645431, -0.03097967, 1, 1, 1, 1, 1,
1.055986, 0.07050732, 1.101743, 1, 1, 1, 1, 1,
1.080097, 0.02319542, 0.9566121, 1, 1, 1, 1, 1,
1.082132, 0.435829, 1.122915, 0, 0, 1, 1, 1,
1.082637, -0.04375108, 2.482459, 1, 0, 0, 1, 1,
1.086606, -2.042183, 2.856736, 1, 0, 0, 1, 1,
1.087132, 1.482191, 0.3702157, 1, 0, 0, 1, 1,
1.090332, -0.8270269, 2.775859, 1, 0, 0, 1, 1,
1.091917, 0.7884802, 1.188442, 1, 0, 0, 1, 1,
1.091924, -0.5989351, 1.425085, 0, 0, 0, 1, 1,
1.095547, -0.07863793, 1.046191, 0, 0, 0, 1, 1,
1.097466, -0.1148797, 1.133702, 0, 0, 0, 1, 1,
1.099123, -0.09570847, 0.5066106, 0, 0, 0, 1, 1,
1.099856, -2.165677, 2.974899, 0, 0, 0, 1, 1,
1.100503, -0.9466787, 1.062406, 0, 0, 0, 1, 1,
1.10793, -1.695775, 3.349854, 0, 0, 0, 1, 1,
1.117482, -0.4446219, 0.673952, 1, 1, 1, 1, 1,
1.122796, -0.6547493, 0.3711272, 1, 1, 1, 1, 1,
1.127069, -0.7018496, 2.542881, 1, 1, 1, 1, 1,
1.128471, -1.102846, 3.716314, 1, 1, 1, 1, 1,
1.142943, 0.5527843, 1.188119, 1, 1, 1, 1, 1,
1.155968, -0.1944091, 1.826844, 1, 1, 1, 1, 1,
1.163264, -0.05830564, 1.579442, 1, 1, 1, 1, 1,
1.177301, -1.300689, 2.751229, 1, 1, 1, 1, 1,
1.17878, 1.357425, 0.660702, 1, 1, 1, 1, 1,
1.180964, -1.370602, 2.149646, 1, 1, 1, 1, 1,
1.182814, -1.878668, 3.987507, 1, 1, 1, 1, 1,
1.186983, 0.4069287, 0.7834484, 1, 1, 1, 1, 1,
1.192877, -0.06323846, 2.95531, 1, 1, 1, 1, 1,
1.198891, -0.3220489, 2.093548, 1, 1, 1, 1, 1,
1.20015, 2.6356, 0.7694392, 1, 1, 1, 1, 1,
1.208418, 0.2621079, 2.730116, 0, 0, 1, 1, 1,
1.210443, 0.09656866, 2.657933, 1, 0, 0, 1, 1,
1.22157, -2.968991, 2.163342, 1, 0, 0, 1, 1,
1.226873, -1.211401, 2.452008, 1, 0, 0, 1, 1,
1.235621, 1.163548, -0.5726737, 1, 0, 0, 1, 1,
1.241281, 0.3502981, -0.7371567, 1, 0, 0, 1, 1,
1.244217, -0.3442133, 1.99323, 0, 0, 0, 1, 1,
1.245867, 0.7084209, 2.371671, 0, 0, 0, 1, 1,
1.249082, 0.3108412, 2.059698, 0, 0, 0, 1, 1,
1.254734, 1.159301, 1.063926, 0, 0, 0, 1, 1,
1.254825, 1.053166, 1.625736, 0, 0, 0, 1, 1,
1.264485, 2.4349, -1.417795, 0, 0, 0, 1, 1,
1.286968, 1.289097, 1.126836, 0, 0, 0, 1, 1,
1.289369, 0.3787256, 1.127121, 1, 1, 1, 1, 1,
1.290377, -0.9230041, 2.801013, 1, 1, 1, 1, 1,
1.309364, 2.093549, 1.161378, 1, 1, 1, 1, 1,
1.316238, -0.7005712, 1.744213, 1, 1, 1, 1, 1,
1.333071, 0.4211899, 2.119122, 1, 1, 1, 1, 1,
1.334338, -0.3909197, 2.974038, 1, 1, 1, 1, 1,
1.344112, -0.9663516, 1.528077, 1, 1, 1, 1, 1,
1.357475, 1.449369, 0.9030768, 1, 1, 1, 1, 1,
1.364171, -1.214353, 2.835779, 1, 1, 1, 1, 1,
1.375561, -0.6217408, 3.313005, 1, 1, 1, 1, 1,
1.379019, 0.9168953, 0.6552423, 1, 1, 1, 1, 1,
1.387833, -0.8809921, 4.107396, 1, 1, 1, 1, 1,
1.403351, -0.4962438, 0.8249041, 1, 1, 1, 1, 1,
1.403647, -0.8190246, 3.422659, 1, 1, 1, 1, 1,
1.406909, -0.5589021, 2.064205, 1, 1, 1, 1, 1,
1.415128, -0.8271066, 2.857717, 0, 0, 1, 1, 1,
1.432727, -0.2616704, 0.9904516, 1, 0, 0, 1, 1,
1.437889, 0.7633538, 0.5303145, 1, 0, 0, 1, 1,
1.447925, 1.386466, 0.6352066, 1, 0, 0, 1, 1,
1.449599, -0.9130856, 2.952455, 1, 0, 0, 1, 1,
1.450994, 0.09861372, 0.5061622, 1, 0, 0, 1, 1,
1.455912, 1.939989, 0.1764191, 0, 0, 0, 1, 1,
1.460488, 0.2703255, 1.218698, 0, 0, 0, 1, 1,
1.472693, 1.166494, 0.4278136, 0, 0, 0, 1, 1,
1.479864, -0.3687941, 1.271421, 0, 0, 0, 1, 1,
1.484523, 0.7556342, 0.6640586, 0, 0, 0, 1, 1,
1.486068, 0.7476162, 0.3541191, 0, 0, 0, 1, 1,
1.490815, -0.2688876, 1.137078, 0, 0, 0, 1, 1,
1.49323, -1.169833, 3.211954, 1, 1, 1, 1, 1,
1.501477, 0.2989038, 0.662032, 1, 1, 1, 1, 1,
1.51854, 0.179346, 0.4861231, 1, 1, 1, 1, 1,
1.558725, -0.8603581, 3.209822, 1, 1, 1, 1, 1,
1.565441, 0.1690823, 0.5502017, 1, 1, 1, 1, 1,
1.572803, 1.656713, 0.416211, 1, 1, 1, 1, 1,
1.57965, 0.712303, 2.317906, 1, 1, 1, 1, 1,
1.580846, -0.8155033, 0.8352329, 1, 1, 1, 1, 1,
1.590854, -1.004416, 1.733748, 1, 1, 1, 1, 1,
1.598303, -0.7059661, 1.806368, 1, 1, 1, 1, 1,
1.599075, -1.774332, 3.275217, 1, 1, 1, 1, 1,
1.607329, -0.08642013, 1.216913, 1, 1, 1, 1, 1,
1.612023, 0.1190865, -0.7971172, 1, 1, 1, 1, 1,
1.621726, -0.07424834, 1.056144, 1, 1, 1, 1, 1,
1.627579, -2.010088, 0.9415554, 1, 1, 1, 1, 1,
1.627809, -0.08790659, 3.671559, 0, 0, 1, 1, 1,
1.634238, 0.9126485, 2.696855, 1, 0, 0, 1, 1,
1.647583, 1.013383, 0.3181825, 1, 0, 0, 1, 1,
1.650395, 0.6421874, -0.000775627, 1, 0, 0, 1, 1,
1.658256, -1.722555, 2.724004, 1, 0, 0, 1, 1,
1.662768, 0.5785928, 1.310935, 1, 0, 0, 1, 1,
1.669779, 0.08688353, 2.150253, 0, 0, 0, 1, 1,
1.678532, 1.118711, 1.720221, 0, 0, 0, 1, 1,
1.688551, -0.126929, 2.32922, 0, 0, 0, 1, 1,
1.690579, -0.002075545, 1.306759, 0, 0, 0, 1, 1,
1.736312, -1.101847, 3.048011, 0, 0, 0, 1, 1,
1.754536, -0.003609176, 2.06919, 0, 0, 0, 1, 1,
1.758983, 0.6946196, 0.3870859, 0, 0, 0, 1, 1,
1.762821, 0.4281716, 2.512022, 1, 1, 1, 1, 1,
1.778857, -1.05926, 2.163782, 1, 1, 1, 1, 1,
1.799625, 1.288739, 0.3950579, 1, 1, 1, 1, 1,
1.824744, 0.1259721, 0.241733, 1, 1, 1, 1, 1,
1.833245, 0.1305167, 2.678879, 1, 1, 1, 1, 1,
1.857261, -0.9261951, 1.618559, 1, 1, 1, 1, 1,
1.928814, -0.575327, 3.079971, 1, 1, 1, 1, 1,
1.935914, 1.481329, -0.7780761, 1, 1, 1, 1, 1,
1.950853, -0.127646, 2.402201, 1, 1, 1, 1, 1,
1.950859, -0.2372144, 0.7303938, 1, 1, 1, 1, 1,
1.957221, -0.4688216, 2.024877, 1, 1, 1, 1, 1,
1.999913, 0.4536396, 0.6881137, 1, 1, 1, 1, 1,
2.017505, -0.234323, 1.618467, 1, 1, 1, 1, 1,
2.029687, 0.295836, 1.957883, 1, 1, 1, 1, 1,
2.034636, 0.7293101, 1.287816, 1, 1, 1, 1, 1,
2.055801, 1.554835, -1.425367, 0, 0, 1, 1, 1,
2.078499, -0.7954759, 3.04318, 1, 0, 0, 1, 1,
2.099131, 1.359644, 1.010656, 1, 0, 0, 1, 1,
2.116628, 0.01591819, 2.491475, 1, 0, 0, 1, 1,
2.128463, -0.6153482, 1.184184, 1, 0, 0, 1, 1,
2.16387, -1.551567, 3.67736, 1, 0, 0, 1, 1,
2.216571, 2.197685, 0.06589636, 0, 0, 0, 1, 1,
2.228012, 1.447406, 1.008257, 0, 0, 0, 1, 1,
2.229177, 0.5182371, 1.21584, 0, 0, 0, 1, 1,
2.240822, 1.794969, -0.2893379, 0, 0, 0, 1, 1,
2.287405, -1.920976, 2.442867, 0, 0, 0, 1, 1,
2.300685, -0.9089444, 2.266562, 0, 0, 0, 1, 1,
2.350668, 0.6151376, 0.4395886, 0, 0, 0, 1, 1,
2.376325, -1.283763, 2.11245, 1, 1, 1, 1, 1,
2.445318, -0.9307591, 2.057743, 1, 1, 1, 1, 1,
2.549474, 0.4278159, 0.8800429, 1, 1, 1, 1, 1,
2.682751, 1.981227, 1.785119, 1, 1, 1, 1, 1,
2.760628, 0.2727115, 1.683732, 1, 1, 1, 1, 1,
2.763185, -0.8795159, 2.553858, 1, 1, 1, 1, 1,
3.117938, 0.04999941, 2.031725, 1, 1, 1, 1, 1
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
var radius = 9.441921;
var distance = 33.16435;
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
mvMatrix.translate( 0.080374, 0.08471894, -0.208883 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16435);
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