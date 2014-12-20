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
-3.365893, -1.330582, -1.124734, 1, 0, 0, 1,
-3.267873, -1.020227, -2.32622, 1, 0.007843138, 0, 1,
-2.765439, -1.000412, -0.6675513, 1, 0.01176471, 0, 1,
-2.763143, -0.496524, -2.556265, 1, 0.01960784, 0, 1,
-2.671343, -1.207636, -2.111584, 1, 0.02352941, 0, 1,
-2.481894, 1.73061, -2.958261, 1, 0.03137255, 0, 1,
-2.446104, -0.3274687, -0.9363565, 1, 0.03529412, 0, 1,
-2.444446, 0.2306496, -2.84788, 1, 0.04313726, 0, 1,
-2.358929, 1.177298, -1.842112, 1, 0.04705882, 0, 1,
-2.317633, -0.9168039, 0.125706, 1, 0.05490196, 0, 1,
-2.295418, 1.611925, -1.588001, 1, 0.05882353, 0, 1,
-2.258494, -0.5278113, -1.769997, 1, 0.06666667, 0, 1,
-2.255316, -1.824463, -1.133776, 1, 0.07058824, 0, 1,
-2.233563, -0.1122579, -1.915347, 1, 0.07843138, 0, 1,
-2.232, 0.2068672, -1.007063, 1, 0.08235294, 0, 1,
-2.230609, 0.3028518, -2.169363, 1, 0.09019608, 0, 1,
-2.209158, 0.8764718, -0.187375, 1, 0.09411765, 0, 1,
-2.206962, -0.3704833, -0.1912104, 1, 0.1019608, 0, 1,
-2.197598, -1.64181, -0.5944714, 1, 0.1098039, 0, 1,
-2.143414, -0.3275986, -1.516063, 1, 0.1137255, 0, 1,
-2.114173, 0.1197587, -1.815521, 1, 0.1215686, 0, 1,
-2.09431, -0.6524461, -0.8873233, 1, 0.1254902, 0, 1,
-2.079776, 2.150382, -0.5729806, 1, 0.1333333, 0, 1,
-2.077131, 0.3664473, -1.271336, 1, 0.1372549, 0, 1,
-2.043367, 1.250132, -1.460138, 1, 0.145098, 0, 1,
-2.010027, 1.515365, 0.3247305, 1, 0.1490196, 0, 1,
-1.9774, 0.1846592, -2.581045, 1, 0.1568628, 0, 1,
-1.976452, 0.3394896, -1.108234, 1, 0.1607843, 0, 1,
-1.943023, -0.5744413, -0.1722773, 1, 0.1686275, 0, 1,
-1.916951, 0.5256283, -1.774553, 1, 0.172549, 0, 1,
-1.905447, -1.120078, -2.114165, 1, 0.1803922, 0, 1,
-1.872349, 1.302292, -0.6350001, 1, 0.1843137, 0, 1,
-1.867536, 0.3075176, -1.485245, 1, 0.1921569, 0, 1,
-1.866712, 0.9395915, 0.5718302, 1, 0.1960784, 0, 1,
-1.865316, -0.2512835, -2.649375, 1, 0.2039216, 0, 1,
-1.861366, -0.6029449, -1.836566, 1, 0.2117647, 0, 1,
-1.831797, -0.05858239, -2.650591, 1, 0.2156863, 0, 1,
-1.806434, 0.2064521, -3.277532, 1, 0.2235294, 0, 1,
-1.803211, -2.518498, -4.182017, 1, 0.227451, 0, 1,
-1.791399, 0.4859926, -2.000384, 1, 0.2352941, 0, 1,
-1.728096, 1.78767, 1.46461, 1, 0.2392157, 0, 1,
-1.696105, -0.4961143, -2.627524, 1, 0.2470588, 0, 1,
-1.687766, -1.003747, -0.447318, 1, 0.2509804, 0, 1,
-1.679497, 1.153874, -0.4998598, 1, 0.2588235, 0, 1,
-1.668136, 1.711632, -0.4168244, 1, 0.2627451, 0, 1,
-1.657654, 0.5440801, -1.069936, 1, 0.2705882, 0, 1,
-1.653384, -0.6898528, -3.141609, 1, 0.2745098, 0, 1,
-1.641164, -0.01376848, -0.3025374, 1, 0.282353, 0, 1,
-1.630052, 0.2284276, -1.127344, 1, 0.2862745, 0, 1,
-1.609047, -0.1357192, -2.297155, 1, 0.2941177, 0, 1,
-1.603771, 1.155599, -0.9936312, 1, 0.3019608, 0, 1,
-1.600447, 0.1658672, 0.5524174, 1, 0.3058824, 0, 1,
-1.596443, -0.4304065, -0.8708007, 1, 0.3137255, 0, 1,
-1.587814, 0.7169504, -0.7706357, 1, 0.3176471, 0, 1,
-1.581246, -0.4134691, -1.178711, 1, 0.3254902, 0, 1,
-1.576946, 1.579997, 0.10739, 1, 0.3294118, 0, 1,
-1.567583, -0.5863985, -2.14908, 1, 0.3372549, 0, 1,
-1.563689, 0.5512079, -0.8939795, 1, 0.3411765, 0, 1,
-1.560856, -1.982857, -2.777372, 1, 0.3490196, 0, 1,
-1.551157, -0.3003973, -3.113863, 1, 0.3529412, 0, 1,
-1.54985, 0.3694862, -1.127284, 1, 0.3607843, 0, 1,
-1.549518, -1.184933, -1.608764, 1, 0.3647059, 0, 1,
-1.540433, 0.364427, -2.560857, 1, 0.372549, 0, 1,
-1.534285, 0.4150096, -0.8944012, 1, 0.3764706, 0, 1,
-1.523949, -0.5057006, -1.415564, 1, 0.3843137, 0, 1,
-1.490407, -1.94861, -2.809363, 1, 0.3882353, 0, 1,
-1.490025, -2.034323, -2.606463, 1, 0.3960784, 0, 1,
-1.482425, -0.5215365, -1.04909, 1, 0.4039216, 0, 1,
-1.478675, 0.2072925, -2.024962, 1, 0.4078431, 0, 1,
-1.477411, -0.5845993, 0.6330171, 1, 0.4156863, 0, 1,
-1.472768, -0.3761827, -1.492244, 1, 0.4196078, 0, 1,
-1.461363, -0.7693844, -1.057711, 1, 0.427451, 0, 1,
-1.440361, 0.8740008, -1.294119, 1, 0.4313726, 0, 1,
-1.431961, -0.703483, -2.300759, 1, 0.4392157, 0, 1,
-1.425919, -1.627913, -2.314841, 1, 0.4431373, 0, 1,
-1.409293, -0.7047263, -2.484396, 1, 0.4509804, 0, 1,
-1.405583, 0.9045312, -0.2643825, 1, 0.454902, 0, 1,
-1.399758, 0.7308528, -0.8607764, 1, 0.4627451, 0, 1,
-1.392096, 0.2181918, -3.47158, 1, 0.4666667, 0, 1,
-1.386941, 0.9840589, -2.205124, 1, 0.4745098, 0, 1,
-1.384193, 1.108895, -0.8267038, 1, 0.4784314, 0, 1,
-1.379713, -0.3268297, -2.756766, 1, 0.4862745, 0, 1,
-1.376034, -0.6777992, -3.535879, 1, 0.4901961, 0, 1,
-1.375709, 0.8478223, -1.986389, 1, 0.4980392, 0, 1,
-1.365347, 0.03126423, -2.55402, 1, 0.5058824, 0, 1,
-1.362988, 0.3766052, -2.786715, 1, 0.509804, 0, 1,
-1.354181, -0.2002075, -1.281297, 1, 0.5176471, 0, 1,
-1.338773, -0.3232623, -2.335886, 1, 0.5215687, 0, 1,
-1.334904, 1.489959, -0.6085433, 1, 0.5294118, 0, 1,
-1.33136, -0.8689892, -1.620903, 1, 0.5333334, 0, 1,
-1.330371, -0.1832893, -2.300544, 1, 0.5411765, 0, 1,
-1.325204, -0.5134159, -2.314698, 1, 0.5450981, 0, 1,
-1.320204, 0.1008955, -1.896641, 1, 0.5529412, 0, 1,
-1.319854, -0.3393699, -2.059352, 1, 0.5568628, 0, 1,
-1.311101, -0.2895781, -1.502055, 1, 0.5647059, 0, 1,
-1.309016, -0.196841, -0.4296747, 1, 0.5686275, 0, 1,
-1.293872, -0.5408059, -0.718329, 1, 0.5764706, 0, 1,
-1.287509, -0.7237857, -0.7131717, 1, 0.5803922, 0, 1,
-1.286449, -0.01996695, -1.963415, 1, 0.5882353, 0, 1,
-1.267608, -0.1145228, -0.8701625, 1, 0.5921569, 0, 1,
-1.264537, 0.0508429, -0.6157144, 1, 0.6, 0, 1,
-1.261743, 1.387788, -0.9084353, 1, 0.6078432, 0, 1,
-1.259232, 1.65784, 0.2550077, 1, 0.6117647, 0, 1,
-1.258231, 0.06352908, -1.880567, 1, 0.6196079, 0, 1,
-1.24326, 0.03804966, 0.09894986, 1, 0.6235294, 0, 1,
-1.233556, -0.7735474, -4.568138, 1, 0.6313726, 0, 1,
-1.22489, 0.502057, 0.195228, 1, 0.6352941, 0, 1,
-1.21659, -0.7466015, -0.3544255, 1, 0.6431373, 0, 1,
-1.19865, 0.1707135, -0.9466683, 1, 0.6470588, 0, 1,
-1.195349, -0.275128, -1.491877, 1, 0.654902, 0, 1,
-1.19187, 0.348665, -1.020659, 1, 0.6588235, 0, 1,
-1.190681, -0.2570596, -0.5930302, 1, 0.6666667, 0, 1,
-1.177972, 0.5294689, -1.033835, 1, 0.6705883, 0, 1,
-1.175466, -0.7945614, -2.694094, 1, 0.6784314, 0, 1,
-1.172971, 1.255154, -1.162138, 1, 0.682353, 0, 1,
-1.170908, -0.4446461, -1.608906, 1, 0.6901961, 0, 1,
-1.160085, -1.31305, -3.058577, 1, 0.6941177, 0, 1,
-1.155609, -0.8048055, -1.8497, 1, 0.7019608, 0, 1,
-1.154015, 0.9313936, -0.0920628, 1, 0.7098039, 0, 1,
-1.146886, -0.6410639, -2.43069, 1, 0.7137255, 0, 1,
-1.146387, 0.09041812, -2.291609, 1, 0.7215686, 0, 1,
-1.141501, 0.07484622, -0.6683615, 1, 0.7254902, 0, 1,
-1.138096, 0.4273917, -1.167656, 1, 0.7333333, 0, 1,
-1.135871, 0.9755531, -0.9050032, 1, 0.7372549, 0, 1,
-1.135604, 0.424085, -0.6356633, 1, 0.7450981, 0, 1,
-1.130481, 1.214616, -0.3820155, 1, 0.7490196, 0, 1,
-1.128737, -0.4113907, -1.632003, 1, 0.7568628, 0, 1,
-1.125686, -0.9544759, -3.804687, 1, 0.7607843, 0, 1,
-1.123177, 2.589912, -0.9522157, 1, 0.7686275, 0, 1,
-1.122045, 0.9558278, -0.2487455, 1, 0.772549, 0, 1,
-1.121575, -0.2641642, -2.306654, 1, 0.7803922, 0, 1,
-1.116731, 1.008511, -2.257413, 1, 0.7843137, 0, 1,
-1.115996, 0.4335729, 0.569283, 1, 0.7921569, 0, 1,
-1.112784, 1.200887, -0.8622108, 1, 0.7960784, 0, 1,
-1.1126, -3.070563, -3.035247, 1, 0.8039216, 0, 1,
-1.105168, -0.7048451, -2.99502, 1, 0.8117647, 0, 1,
-1.104261, 0.3660028, -0.5981297, 1, 0.8156863, 0, 1,
-1.101282, -1.057719, -3.741018, 1, 0.8235294, 0, 1,
-1.094698, 0.483455, -1.566687, 1, 0.827451, 0, 1,
-1.0905, -1.717827, -4.523176, 1, 0.8352941, 0, 1,
-1.088766, -0.2838707, -1.931432, 1, 0.8392157, 0, 1,
-1.07838, -1.164411, -1.028319, 1, 0.8470588, 0, 1,
-1.070734, -1.322772, -3.61501, 1, 0.8509804, 0, 1,
-1.069374, -0.7165621, -1.874795, 1, 0.8588235, 0, 1,
-1.067916, 1.418581, -0.4185917, 1, 0.8627451, 0, 1,
-1.067416, 0.4085911, 0.4486266, 1, 0.8705882, 0, 1,
-1.067295, 1.857688, -0.4937173, 1, 0.8745098, 0, 1,
-1.064769, 1.571987, 0.1632217, 1, 0.8823529, 0, 1,
-1.063422, 0.1507469, -2.290827, 1, 0.8862745, 0, 1,
-1.060467, 0.3142922, -0.6425228, 1, 0.8941177, 0, 1,
-1.059958, 0.07674983, -1.098619, 1, 0.8980392, 0, 1,
-1.057622, -0.3292535, -2.9368, 1, 0.9058824, 0, 1,
-1.043336, 1.197315, -1.066697, 1, 0.9137255, 0, 1,
-1.040135, -0.1930982, -1.292716, 1, 0.9176471, 0, 1,
-1.035586, 0.1660648, -0.7220837, 1, 0.9254902, 0, 1,
-1.034518, 1.78814, 0.1976862, 1, 0.9294118, 0, 1,
-1.029501, -1.62643, -3.620817, 1, 0.9372549, 0, 1,
-1.029178, -0.1089967, -2.711657, 1, 0.9411765, 0, 1,
-1.026093, -1.255246, -2.231486, 1, 0.9490196, 0, 1,
-1.020042, 0.4876063, -0.5788746, 1, 0.9529412, 0, 1,
-1.018788, -0.1575668, -1.56816, 1, 0.9607843, 0, 1,
-1.014309, -0.07259949, -1.315097, 1, 0.9647059, 0, 1,
-1.010725, -1.571865, -4.584952, 1, 0.972549, 0, 1,
-1.007488, -1.25994, -2.685229, 1, 0.9764706, 0, 1,
-1.001091, 3.215115, -0.536065, 1, 0.9843137, 0, 1,
-0.9978896, 0.4477716, -0.668297, 1, 0.9882353, 0, 1,
-0.9948163, -2.43133, -2.286691, 1, 0.9960784, 0, 1,
-0.9866098, -1.44525, -3.576582, 0.9960784, 1, 0, 1,
-0.9767789, 1.538469, -0.2424883, 0.9921569, 1, 0, 1,
-0.9693044, -1.239642, -0.05628288, 0.9843137, 1, 0, 1,
-0.9688324, 0.003144698, -1.758823, 0.9803922, 1, 0, 1,
-0.9479549, 1.041296, -0.7512463, 0.972549, 1, 0, 1,
-0.9424848, -0.4994211, 0.5198298, 0.9686275, 1, 0, 1,
-0.9419961, -0.9171914, -1.288409, 0.9607843, 1, 0, 1,
-0.9377972, 1.17083, -2.258828, 0.9568627, 1, 0, 1,
-0.9357281, -0.7608521, -1.227599, 0.9490196, 1, 0, 1,
-0.9341639, 0.7016151, 1.40346, 0.945098, 1, 0, 1,
-0.9333445, 0.4286191, 0.6892592, 0.9372549, 1, 0, 1,
-0.9328527, 1.123193, 0.2471655, 0.9333333, 1, 0, 1,
-0.9323135, 1.112874, -1.415328, 0.9254902, 1, 0, 1,
-0.9322588, 0.6270055, -1.682334, 0.9215686, 1, 0, 1,
-0.9300692, 0.2876244, 0.4679289, 0.9137255, 1, 0, 1,
-0.925492, 0.3006536, -1.499476, 0.9098039, 1, 0, 1,
-0.9223644, -0.2391323, -3.416117, 0.9019608, 1, 0, 1,
-0.9209977, 0.4863951, -0.6985956, 0.8941177, 1, 0, 1,
-0.9209117, -0.2923091, -1.375619, 0.8901961, 1, 0, 1,
-0.9163472, -2.518953, -2.881253, 0.8823529, 1, 0, 1,
-0.9128335, -1.258991, -4.91071, 0.8784314, 1, 0, 1,
-0.9092084, -0.3326861, -1.637273, 0.8705882, 1, 0, 1,
-0.9088244, -0.9630978, -1.568722, 0.8666667, 1, 0, 1,
-0.9086192, -0.9407785, -3.873102, 0.8588235, 1, 0, 1,
-0.9068404, -0.04612532, -2.37565, 0.854902, 1, 0, 1,
-0.9035927, 1.026051, -0.8189136, 0.8470588, 1, 0, 1,
-0.9016747, 0.8553463, -2.371297, 0.8431373, 1, 0, 1,
-0.8889387, 0.5651769, -1.566898, 0.8352941, 1, 0, 1,
-0.8887625, 0.9711449, -0.3004216, 0.8313726, 1, 0, 1,
-0.8821949, -0.2207675, -1.416773, 0.8235294, 1, 0, 1,
-0.8820741, 1.154392, -0.8853276, 0.8196079, 1, 0, 1,
-0.8818647, 2.345502, -0.9092839, 0.8117647, 1, 0, 1,
-0.8788911, 0.6492185, -1.659536, 0.8078431, 1, 0, 1,
-0.8770954, -0.4606607, -1.215875, 0.8, 1, 0, 1,
-0.8643658, -0.5418708, -3.297484, 0.7921569, 1, 0, 1,
-0.863843, -0.4108809, -2.918344, 0.7882353, 1, 0, 1,
-0.8637288, -0.7444976, 0.05160761, 0.7803922, 1, 0, 1,
-0.860481, 0.5598769, -0.4976355, 0.7764706, 1, 0, 1,
-0.8597725, -0.01600016, -1.726241, 0.7686275, 1, 0, 1,
-0.8566447, -0.2573701, -1.775433, 0.7647059, 1, 0, 1,
-0.8529819, -0.3371191, -2.174929, 0.7568628, 1, 0, 1,
-0.8449774, -1.303789, -0.8571695, 0.7529412, 1, 0, 1,
-0.8439203, 0.7700187, -1.691122, 0.7450981, 1, 0, 1,
-0.843431, 1.778668, 0.5054111, 0.7411765, 1, 0, 1,
-0.8381898, -0.4050942, -2.393235, 0.7333333, 1, 0, 1,
-0.8215215, -0.6503832, -0.6881218, 0.7294118, 1, 0, 1,
-0.8165515, 0.7780659, -0.9297257, 0.7215686, 1, 0, 1,
-0.8086821, 0.08690968, -0.5472577, 0.7176471, 1, 0, 1,
-0.8083874, 2.052882, -0.9974972, 0.7098039, 1, 0, 1,
-0.7923143, -0.1464997, -2.857153, 0.7058824, 1, 0, 1,
-0.7868675, -0.6235262, -1.249138, 0.6980392, 1, 0, 1,
-0.7836646, 1.61263, -0.4531612, 0.6901961, 1, 0, 1,
-0.7767068, -0.1284015, -2.732338, 0.6862745, 1, 0, 1,
-0.7736019, -1.331711, -1.700186, 0.6784314, 1, 0, 1,
-0.7702786, -1.266518, -2.524013, 0.6745098, 1, 0, 1,
-0.7685038, -1.179124, -2.536717, 0.6666667, 1, 0, 1,
-0.762646, -0.4811403, -1.98213, 0.6627451, 1, 0, 1,
-0.762086, -0.07115608, -1.370994, 0.654902, 1, 0, 1,
-0.7615858, 0.368155, -1.551989, 0.6509804, 1, 0, 1,
-0.75724, 0.2095023, 0.3587864, 0.6431373, 1, 0, 1,
-0.7537847, -1.804016, -3.188687, 0.6392157, 1, 0, 1,
-0.7511847, -0.7612711, -3.126365, 0.6313726, 1, 0, 1,
-0.7486049, 0.004352774, -0.6597387, 0.627451, 1, 0, 1,
-0.7468263, -0.2546887, -2.815329, 0.6196079, 1, 0, 1,
-0.7459179, -0.1985348, -2.083714, 0.6156863, 1, 0, 1,
-0.7454866, -0.9138851, -1.091037, 0.6078432, 1, 0, 1,
-0.7431239, 0.3734931, -1.018731, 0.6039216, 1, 0, 1,
-0.7371002, -2.070066, -2.783962, 0.5960785, 1, 0, 1,
-0.7366585, -0.8329943, -2.319371, 0.5882353, 1, 0, 1,
-0.7354397, 0.1033867, -2.535629, 0.5843138, 1, 0, 1,
-0.7316296, 0.454715, -0.04170812, 0.5764706, 1, 0, 1,
-0.7304684, 0.2510356, -1.766525, 0.572549, 1, 0, 1,
-0.7302243, -0.3137805, -2.120673, 0.5647059, 1, 0, 1,
-0.7301858, 0.6291572, -1.572015, 0.5607843, 1, 0, 1,
-0.7290921, -0.1107585, -1.315585, 0.5529412, 1, 0, 1,
-0.7286423, -0.2019365, -0.1123168, 0.5490196, 1, 0, 1,
-0.7273519, 0.30845, -0.2668309, 0.5411765, 1, 0, 1,
-0.7253473, -0.5649382, -2.878158, 0.5372549, 1, 0, 1,
-0.7208428, -0.7706022, -3.310708, 0.5294118, 1, 0, 1,
-0.720216, 0.3188367, -2.344153, 0.5254902, 1, 0, 1,
-0.7180889, 1.164771, -0.7741722, 0.5176471, 1, 0, 1,
-0.7140848, -0.2933729, -2.237842, 0.5137255, 1, 0, 1,
-0.7048509, 1.197092, -0.8279092, 0.5058824, 1, 0, 1,
-0.7043348, -0.4817111, -2.099531, 0.5019608, 1, 0, 1,
-0.7039033, 0.7416066, -0.3298327, 0.4941176, 1, 0, 1,
-0.7025453, -0.5604149, -1.696217, 0.4862745, 1, 0, 1,
-0.6970074, 1.43607, -0.01480301, 0.4823529, 1, 0, 1,
-0.6953925, 2.134391, 1.003374, 0.4745098, 1, 0, 1,
-0.694537, -0.003954738, -0.489776, 0.4705882, 1, 0, 1,
-0.6936792, -0.7991515, -3.125023, 0.4627451, 1, 0, 1,
-0.6914604, 0.3412202, 0.9059517, 0.4588235, 1, 0, 1,
-0.6899164, 0.03279349, -0.2937243, 0.4509804, 1, 0, 1,
-0.6893542, 2.299455, 0.1277791, 0.4470588, 1, 0, 1,
-0.6881676, -0.9638005, -2.219892, 0.4392157, 1, 0, 1,
-0.6860169, -1.090224, -2.643219, 0.4352941, 1, 0, 1,
-0.6830033, 0.3433733, -1.873528, 0.427451, 1, 0, 1,
-0.6822306, -0.06307613, -1.41098, 0.4235294, 1, 0, 1,
-0.6819228, 1.292624, -0.1952307, 0.4156863, 1, 0, 1,
-0.6794149, 0.2362996, -1.647385, 0.4117647, 1, 0, 1,
-0.6764705, -0.8901097, -1.690825, 0.4039216, 1, 0, 1,
-0.6749607, -0.2460879, -1.78608, 0.3960784, 1, 0, 1,
-0.6710641, -0.7902167, -2.906046, 0.3921569, 1, 0, 1,
-0.6667868, -0.6447725, -1.761695, 0.3843137, 1, 0, 1,
-0.660397, -0.5200905, -2.744185, 0.3803922, 1, 0, 1,
-0.6581538, 0.6137043, -0.4176995, 0.372549, 1, 0, 1,
-0.6557383, -0.5639938, -1.199116, 0.3686275, 1, 0, 1,
-0.6457072, 1.053376, 1.377576, 0.3607843, 1, 0, 1,
-0.6331763, 1.290612, -1.124778, 0.3568628, 1, 0, 1,
-0.6315486, -1.613998, -3.879719, 0.3490196, 1, 0, 1,
-0.6303393, -0.2974054, -1.507668, 0.345098, 1, 0, 1,
-0.628634, -0.5691388, -4.048648, 0.3372549, 1, 0, 1,
-0.6270091, 0.087278, -1.588566, 0.3333333, 1, 0, 1,
-0.6157417, -0.1014009, -1.9034, 0.3254902, 1, 0, 1,
-0.6153788, -0.6286117, -2.762412, 0.3215686, 1, 0, 1,
-0.6136783, 0.08142015, -1.581538, 0.3137255, 1, 0, 1,
-0.612115, -0.1879021, -2.831001, 0.3098039, 1, 0, 1,
-0.611048, -0.06037706, -2.52627, 0.3019608, 1, 0, 1,
-0.607195, 0.1460711, -2.549259, 0.2941177, 1, 0, 1,
-0.606247, -2.537288, -4.66516, 0.2901961, 1, 0, 1,
-0.605789, 0.8752756, -2.078381, 0.282353, 1, 0, 1,
-0.6017119, -1.303411, -0.8958593, 0.2784314, 1, 0, 1,
-0.594276, 0.1949284, -2.17563, 0.2705882, 1, 0, 1,
-0.5941947, -0.2458279, -1.721278, 0.2666667, 1, 0, 1,
-0.5856996, 1.28404, -0.7562098, 0.2588235, 1, 0, 1,
-0.5821434, 1.27813, -0.6179385, 0.254902, 1, 0, 1,
-0.578431, 0.2428881, -2.352172, 0.2470588, 1, 0, 1,
-0.5718675, -0.1832393, -1.897836, 0.2431373, 1, 0, 1,
-0.5715491, -1.753841, -2.592441, 0.2352941, 1, 0, 1,
-0.5666508, 0.2319004, -2.283775, 0.2313726, 1, 0, 1,
-0.5646783, 0.4904733, -0.8687674, 0.2235294, 1, 0, 1,
-0.5634289, 0.8742847, -1.815147, 0.2196078, 1, 0, 1,
-0.5606208, -0.3823273, -2.616437, 0.2117647, 1, 0, 1,
-0.558165, 0.3106638, -2.078025, 0.2078431, 1, 0, 1,
-0.5574186, -0.3788389, -1.286549, 0.2, 1, 0, 1,
-0.5523313, -0.1989496, -1.861563, 0.1921569, 1, 0, 1,
-0.5390756, -0.580216, -1.785327, 0.1882353, 1, 0, 1,
-0.535016, -0.3236223, -2.986806, 0.1803922, 1, 0, 1,
-0.5318115, 0.5259246, 1.646661, 0.1764706, 1, 0, 1,
-0.5245017, 1.058711, -0.9241686, 0.1686275, 1, 0, 1,
-0.5241717, -0.8476139, -1.356317, 0.1647059, 1, 0, 1,
-0.5162407, 1.220854, -0.207401, 0.1568628, 1, 0, 1,
-0.510529, 0.2710294, 0.1030947, 0.1529412, 1, 0, 1,
-0.5037713, -0.9614463, -2.782499, 0.145098, 1, 0, 1,
-0.502955, 0.634687, 0.5122039, 0.1411765, 1, 0, 1,
-0.4988136, 0.05075729, -2.360055, 0.1333333, 1, 0, 1,
-0.4953089, -0.729641, -1.57248, 0.1294118, 1, 0, 1,
-0.4929804, -0.5372137, -2.930843, 0.1215686, 1, 0, 1,
-0.4925032, 0.8110596, 0.3043359, 0.1176471, 1, 0, 1,
-0.4888548, 1.363743, -0.6731854, 0.1098039, 1, 0, 1,
-0.4882405, -0.9835964, -3.215065, 0.1058824, 1, 0, 1,
-0.4857481, 0.9892781, -1.066739, 0.09803922, 1, 0, 1,
-0.4848458, -0.343656, -2.065574, 0.09019608, 1, 0, 1,
-0.4806171, 0.7930518, -0.6369541, 0.08627451, 1, 0, 1,
-0.4776994, 0.8209858, -2.128412, 0.07843138, 1, 0, 1,
-0.4744703, 0.784068, -0.1513649, 0.07450981, 1, 0, 1,
-0.4715695, 0.3622101, -0.6888193, 0.06666667, 1, 0, 1,
-0.4683398, -1.164339, -5.652349, 0.0627451, 1, 0, 1,
-0.4615608, -0.08226722, -0.7434773, 0.05490196, 1, 0, 1,
-0.4599041, -0.9294313, -2.573589, 0.05098039, 1, 0, 1,
-0.4588438, -0.5481216, -2.243907, 0.04313726, 1, 0, 1,
-0.451621, -1.114623, -4.343002, 0.03921569, 1, 0, 1,
-0.4471835, -3.221439, -5.028673, 0.03137255, 1, 0, 1,
-0.4446049, -0.4570412, -0.8655742, 0.02745098, 1, 0, 1,
-0.4401354, -0.1029379, 0.2631207, 0.01960784, 1, 0, 1,
-0.4362313, 0.3782493, -2.558338, 0.01568628, 1, 0, 1,
-0.4320843, -0.6876209, 0.00769311, 0.007843138, 1, 0, 1,
-0.4297062, -0.6956286, -1.339836, 0.003921569, 1, 0, 1,
-0.4280879, -0.7851245, -1.222463, 0, 1, 0.003921569, 1,
-0.4253229, -1.444006, -2.174406, 0, 1, 0.01176471, 1,
-0.4191303, 0.6950125, -1.767153, 0, 1, 0.01568628, 1,
-0.4189047, 0.8394778, -0.5403122, 0, 1, 0.02352941, 1,
-0.4178457, 0.9761716, -0.8557151, 0, 1, 0.02745098, 1,
-0.4160576, 0.506771, -1.229052, 0, 1, 0.03529412, 1,
-0.4158167, -1.193963, -4.209885, 0, 1, 0.03921569, 1,
-0.4153663, -1.132313, -4.444855, 0, 1, 0.04705882, 1,
-0.4151828, -0.6225091, -3.418806, 0, 1, 0.05098039, 1,
-0.4082682, 0.4454312, -2.119763, 0, 1, 0.05882353, 1,
-0.4049383, -0.372658, -3.857892, 0, 1, 0.0627451, 1,
-0.3940787, -1.116128, -4.426656, 0, 1, 0.07058824, 1,
-0.3804626, 0.5819948, -1.200734, 0, 1, 0.07450981, 1,
-0.3796721, -0.7613114, -3.317076, 0, 1, 0.08235294, 1,
-0.3786521, -0.9550275, -3.841179, 0, 1, 0.08627451, 1,
-0.3779494, -0.0573558, -2.026971, 0, 1, 0.09411765, 1,
-0.3768357, -0.1136611, -1.75291, 0, 1, 0.1019608, 1,
-0.3728895, -0.03142496, -3.521302, 0, 1, 0.1058824, 1,
-0.3709828, 0.5171866, -0.712825, 0, 1, 0.1137255, 1,
-0.3698756, -0.3994376, -2.59871, 0, 1, 0.1176471, 1,
-0.36716, 0.827093, 0.7220607, 0, 1, 0.1254902, 1,
-0.3665854, -0.1695644, -4.173911, 0, 1, 0.1294118, 1,
-0.3631203, -0.9721283, -1.715781, 0, 1, 0.1372549, 1,
-0.3592448, 0.7333506, -1.996563, 0, 1, 0.1411765, 1,
-0.3560134, 0.287805, -0.9137796, 0, 1, 0.1490196, 1,
-0.3484085, -1.254147, -1.911024, 0, 1, 0.1529412, 1,
-0.3477424, -0.8314034, -0.03009092, 0, 1, 0.1607843, 1,
-0.3450963, -0.168742, -1.0855, 0, 1, 0.1647059, 1,
-0.3426919, 0.3207001, -0.6125272, 0, 1, 0.172549, 1,
-0.3406876, 1.62268, -0.1778062, 0, 1, 0.1764706, 1,
-0.3397522, 1.048855, -0.3387083, 0, 1, 0.1843137, 1,
-0.3364914, -0.1038319, -2.15726, 0, 1, 0.1882353, 1,
-0.3339232, -0.7542077, -1.601804, 0, 1, 0.1960784, 1,
-0.3292467, 1.485194, 2.125684, 0, 1, 0.2039216, 1,
-0.3275121, -0.525376, -1.615143, 0, 1, 0.2078431, 1,
-0.326253, -0.1028139, -0.1919539, 0, 1, 0.2156863, 1,
-0.3261172, -0.4557904, -1.562183, 0, 1, 0.2196078, 1,
-0.3260316, -1.235633, -3.33922, 0, 1, 0.227451, 1,
-0.3247238, 0.6448162, 1.590178, 0, 1, 0.2313726, 1,
-0.3246135, 1.218166, 0.304855, 0, 1, 0.2392157, 1,
-0.3165701, -1.146838, -1.812463, 0, 1, 0.2431373, 1,
-0.3146791, -0.6534309, -2.771713, 0, 1, 0.2509804, 1,
-0.3145069, 0.2148998, -0.315031, 0, 1, 0.254902, 1,
-0.3083746, -2.35389, -2.634054, 0, 1, 0.2627451, 1,
-0.3081141, -1.69631, -2.289265, 0, 1, 0.2666667, 1,
-0.3080852, 1.444147, -0.3012801, 0, 1, 0.2745098, 1,
-0.3031725, 0.671227, -1.048647, 0, 1, 0.2784314, 1,
-0.3023174, -1.048726, -3.233779, 0, 1, 0.2862745, 1,
-0.2954597, 0.07153477, -0.7807526, 0, 1, 0.2901961, 1,
-0.2947834, -0.4688474, -2.746375, 0, 1, 0.2980392, 1,
-0.2879272, -1.702254, -1.637963, 0, 1, 0.3058824, 1,
-0.2867973, -0.1411063, -3.621453, 0, 1, 0.3098039, 1,
-0.2855377, -0.5906845, -2.542052, 0, 1, 0.3176471, 1,
-0.2852187, -0.7028502, -2.604194, 0, 1, 0.3215686, 1,
-0.2841173, -0.3954638, -2.265573, 0, 1, 0.3294118, 1,
-0.2839468, 1.767137, 0.3429218, 0, 1, 0.3333333, 1,
-0.282747, -0.7507513, -2.250121, 0, 1, 0.3411765, 1,
-0.2814125, -0.8745117, -3.086508, 0, 1, 0.345098, 1,
-0.2805975, 0.5999901, -2.0081, 0, 1, 0.3529412, 1,
-0.2791116, -0.1261636, 0.4438837, 0, 1, 0.3568628, 1,
-0.2733122, -1.183483, -4.865596, 0, 1, 0.3647059, 1,
-0.2729804, -0.4988359, -1.18127, 0, 1, 0.3686275, 1,
-0.2696545, -1.673849, -2.805628, 0, 1, 0.3764706, 1,
-0.2651139, 0.8217561, 0.08167428, 0, 1, 0.3803922, 1,
-0.262983, -1.666327, -2.90797, 0, 1, 0.3882353, 1,
-0.2585031, 0.4496968, -0.2740658, 0, 1, 0.3921569, 1,
-0.2541455, -0.9957493, -2.127997, 0, 1, 0.4, 1,
-0.2505106, -0.4765647, -2.800186, 0, 1, 0.4078431, 1,
-0.2463147, -1.42611, -3.838392, 0, 1, 0.4117647, 1,
-0.2446069, 0.9276614, 0.7656775, 0, 1, 0.4196078, 1,
-0.2424416, 0.09298998, -0.3135477, 0, 1, 0.4235294, 1,
-0.2365055, 1.404781, -1.304492, 0, 1, 0.4313726, 1,
-0.2332464, 0.007256477, -1.364816, 0, 1, 0.4352941, 1,
-0.229064, 1.13181, -0.8218498, 0, 1, 0.4431373, 1,
-0.2282395, 0.08965389, -1.024728, 0, 1, 0.4470588, 1,
-0.2274439, -1.947964, -2.443627, 0, 1, 0.454902, 1,
-0.2265615, -0.3393706, -2.109427, 0, 1, 0.4588235, 1,
-0.2236971, 0.8920905, -0.4202352, 0, 1, 0.4666667, 1,
-0.2201193, -0.5590156, -1.349347, 0, 1, 0.4705882, 1,
-0.2163877, 1.254041, 0.4875423, 0, 1, 0.4784314, 1,
-0.2141847, 0.1825042, -4.327179, 0, 1, 0.4823529, 1,
-0.2130845, 0.4720658, -0.1848262, 0, 1, 0.4901961, 1,
-0.2072767, 0.2565675, -0.6322173, 0, 1, 0.4941176, 1,
-0.2046149, -0.3919864, -1.863198, 0, 1, 0.5019608, 1,
-0.2037376, 0.5481924, -0.1221464, 0, 1, 0.509804, 1,
-0.2015008, 0.6442761, 1.038024, 0, 1, 0.5137255, 1,
-0.2002255, 1.390069, 0.8496714, 0, 1, 0.5215687, 1,
-0.2000125, 0.486355, -0.4078436, 0, 1, 0.5254902, 1,
-0.1912368, -0.5160831, -2.399163, 0, 1, 0.5333334, 1,
-0.1906825, 0.7945961, -0.7225918, 0, 1, 0.5372549, 1,
-0.1898031, -2.364573, -3.656401, 0, 1, 0.5450981, 1,
-0.1884175, 0.03076494, -0.8458399, 0, 1, 0.5490196, 1,
-0.184964, 0.9920336, -0.4420769, 0, 1, 0.5568628, 1,
-0.181045, -0.2939494, -3.952188, 0, 1, 0.5607843, 1,
-0.178654, 0.09751204, -0.4758462, 0, 1, 0.5686275, 1,
-0.1767018, -1.054949, -5.295269, 0, 1, 0.572549, 1,
-0.1765173, -0.1233264, -1.128932, 0, 1, 0.5803922, 1,
-0.1759268, -0.3211475, -2.024654, 0, 1, 0.5843138, 1,
-0.1737738, 0.1213493, 0.2923419, 0, 1, 0.5921569, 1,
-0.1698736, -0.3833204, -1.679769, 0, 1, 0.5960785, 1,
-0.1666912, -2.008574, -2.021579, 0, 1, 0.6039216, 1,
-0.165412, 0.490824, -0.6193498, 0, 1, 0.6117647, 1,
-0.1645978, -1.314168, -3.285885, 0, 1, 0.6156863, 1,
-0.1644018, 1.587583, -0.7126086, 0, 1, 0.6235294, 1,
-0.1643359, -0.003663392, -1.638241, 0, 1, 0.627451, 1,
-0.1619622, 0.8737534, 0.3275992, 0, 1, 0.6352941, 1,
-0.1587046, 0.2135848, -0.3283531, 0, 1, 0.6392157, 1,
-0.1578422, 1.116148, -1.759559, 0, 1, 0.6470588, 1,
-0.1572476, -0.2242127, -1.469832, 0, 1, 0.6509804, 1,
-0.1562985, -1.939957, -3.204493, 0, 1, 0.6588235, 1,
-0.1545966, 0.3368801, -0.0746795, 0, 1, 0.6627451, 1,
-0.1536778, 0.8187786, -0.4876329, 0, 1, 0.6705883, 1,
-0.1522641, -0.9317059, -3.096382, 0, 1, 0.6745098, 1,
-0.1370637, 0.1577496, -1.343204, 0, 1, 0.682353, 1,
-0.1349694, -1.350871, -2.307867, 0, 1, 0.6862745, 1,
-0.1327555, 2.594603, 0.9063687, 0, 1, 0.6941177, 1,
-0.1326284, -1.217472, -4.356772, 0, 1, 0.7019608, 1,
-0.1304582, -1.23135, -3.790206, 0, 1, 0.7058824, 1,
-0.1299332, -1.608683, -2.693835, 0, 1, 0.7137255, 1,
-0.1226498, -1.400403, -2.63306, 0, 1, 0.7176471, 1,
-0.1183125, -0.2537638, -2.620996, 0, 1, 0.7254902, 1,
-0.1120209, 0.3311797, -0.1293441, 0, 1, 0.7294118, 1,
-0.1082473, -0.07006998, -2.928236, 0, 1, 0.7372549, 1,
-0.1059689, 1.040692, 1.585811, 0, 1, 0.7411765, 1,
-0.1047726, 0.1549993, 1.067889, 0, 1, 0.7490196, 1,
-0.09879503, -0.4194229, -4.639572, 0, 1, 0.7529412, 1,
-0.09822963, -0.8602356, -2.583835, 0, 1, 0.7607843, 1,
-0.09822482, -0.07308272, -2.809967, 0, 1, 0.7647059, 1,
-0.09756684, 0.32998, -0.7784169, 0, 1, 0.772549, 1,
-0.09559276, 0.5146681, -0.1536588, 0, 1, 0.7764706, 1,
-0.09528172, -0.1470846, -2.440718, 0, 1, 0.7843137, 1,
-0.09082963, 0.7111519, 0.8248151, 0, 1, 0.7882353, 1,
-0.08960732, -0.3883343, -5.276416, 0, 1, 0.7960784, 1,
-0.08892129, -1.76939, -1.506891, 0, 1, 0.8039216, 1,
-0.08565651, 0.2803648, -0.09430803, 0, 1, 0.8078431, 1,
-0.08476243, -0.1824077, -2.640667, 0, 1, 0.8156863, 1,
-0.08268593, -0.1045203, -1.700723, 0, 1, 0.8196079, 1,
-0.0814086, 0.8677827, 0.914574, 0, 1, 0.827451, 1,
-0.07712889, 0.6161429, -1.935138, 0, 1, 0.8313726, 1,
-0.07518081, -0.750908, -4.610603, 0, 1, 0.8392157, 1,
-0.07380006, -0.130773, -0.2528023, 0, 1, 0.8431373, 1,
-0.07277398, -0.6712132, -2.695701, 0, 1, 0.8509804, 1,
-0.07069407, 0.02688302, -1.432652, 0, 1, 0.854902, 1,
-0.06779347, 0.2728688, 0.2233523, 0, 1, 0.8627451, 1,
-0.06397021, -1.33252, -2.746159, 0, 1, 0.8666667, 1,
-0.05783248, -0.2799154, -2.494077, 0, 1, 0.8745098, 1,
-0.05695483, 0.1936931, -0.9861552, 0, 1, 0.8784314, 1,
-0.05531557, 0.9444147, 0.207125, 0, 1, 0.8862745, 1,
-0.05014481, -0.2777645, -2.958603, 0, 1, 0.8901961, 1,
-0.04133254, -0.06933979, -2.229268, 0, 1, 0.8980392, 1,
-0.0344542, -0.8586416, -5.505986, 0, 1, 0.9058824, 1,
-0.02917518, 0.5558504, -0.07837687, 0, 1, 0.9098039, 1,
-0.02910019, -1.256501, -2.383619, 0, 1, 0.9176471, 1,
-0.02750128, 0.8632196, -2.159423, 0, 1, 0.9215686, 1,
-0.02179101, -0.5108166, -1.814844, 0, 1, 0.9294118, 1,
-0.02047331, -0.7835383, -4.400464, 0, 1, 0.9333333, 1,
-0.0189254, -1.014014, -4.310482, 0, 1, 0.9411765, 1,
-0.01869085, 0.6419992, -0.6061156, 0, 1, 0.945098, 1,
-0.0155946, 0.07761669, 1.827207, 0, 1, 0.9529412, 1,
-0.01511178, -0.6007585, -4.120002, 0, 1, 0.9568627, 1,
-0.01222183, -0.06405581, -3.264767, 0, 1, 0.9647059, 1,
-0.01149021, -0.6563686, -4.33874, 0, 1, 0.9686275, 1,
-0.0114832, 0.7656937, 0.3070577, 0, 1, 0.9764706, 1,
-0.009392626, 0.3772887, -0.6576986, 0, 1, 0.9803922, 1,
-0.008521909, -1.333155, -1.466839, 0, 1, 0.9882353, 1,
-0.006899402, -0.05566533, -2.903073, 0, 1, 0.9921569, 1,
0.0004606234, 0.5070322, 0.8761661, 0, 1, 1, 1,
0.001723213, -0.2741071, 2.9953, 0, 0.9921569, 1, 1,
0.009819943, 0.3654387, -1.033909, 0, 0.9882353, 1, 1,
0.01149483, -0.495517, 3.97901, 0, 0.9803922, 1, 1,
0.01157959, -1.60539, 2.491604, 0, 0.9764706, 1, 1,
0.01542337, 1.497863, -0.169008, 0, 0.9686275, 1, 1,
0.01558902, -1.54572, 1.40843, 0, 0.9647059, 1, 1,
0.02446954, 1.268277, 1.374264, 0, 0.9568627, 1, 1,
0.02674546, -0.6070181, 2.93316, 0, 0.9529412, 1, 1,
0.02710593, 0.4675652, 1.245144, 0, 0.945098, 1, 1,
0.02761064, -1.234694, 3.259418, 0, 0.9411765, 1, 1,
0.02856597, -2.224725, 4.443598, 0, 0.9333333, 1, 1,
0.03100907, -1.0084, 2.696215, 0, 0.9294118, 1, 1,
0.03137599, -0.5482184, 3.410956, 0, 0.9215686, 1, 1,
0.03157585, 0.09972673, -0.1967057, 0, 0.9176471, 1, 1,
0.03171185, 1.349201, -0.4615414, 0, 0.9098039, 1, 1,
0.03300283, 0.05803377, 1.422112, 0, 0.9058824, 1, 1,
0.03628738, -0.7470702, 2.662501, 0, 0.8980392, 1, 1,
0.03630062, -1.34305, 4.568989, 0, 0.8901961, 1, 1,
0.03635548, 0.5435493, -0.7079102, 0, 0.8862745, 1, 1,
0.03889146, 1.12423, -0.168051, 0, 0.8784314, 1, 1,
0.04014543, 1.058902, 1.407097, 0, 0.8745098, 1, 1,
0.04136578, 0.0349126, 0.09952654, 0, 0.8666667, 1, 1,
0.04215503, -0.114356, 2.12334, 0, 0.8627451, 1, 1,
0.04477866, 0.2617024, -1.213595, 0, 0.854902, 1, 1,
0.04495437, -1.571128, 2.374524, 0, 0.8509804, 1, 1,
0.04775703, -2.183912, 5.154774, 0, 0.8431373, 1, 1,
0.04908163, -0.01452568, 2.771738, 0, 0.8392157, 1, 1,
0.05095767, 0.9874151, 1.397841, 0, 0.8313726, 1, 1,
0.05213912, -1.473336, 1.937963, 0, 0.827451, 1, 1,
0.05434207, 1.097318, -1.397105, 0, 0.8196079, 1, 1,
0.05504108, -0.527846, 2.053065, 0, 0.8156863, 1, 1,
0.05788469, -0.03991186, 1.401797, 0, 0.8078431, 1, 1,
0.06995766, 0.06548373, 1.644675, 0, 0.8039216, 1, 1,
0.07194348, 1.552034, 0.2665415, 0, 0.7960784, 1, 1,
0.07363074, -0.06402063, 2.964268, 0, 0.7882353, 1, 1,
0.07845652, 1.316984, 1.98309, 0, 0.7843137, 1, 1,
0.08235499, 0.09141685, -1.88061, 0, 0.7764706, 1, 1,
0.08241666, 0.427509, -0.07625521, 0, 0.772549, 1, 1,
0.08457408, 0.02924014, 0.700178, 0, 0.7647059, 1, 1,
0.08839948, -0.3146076, 1.650697, 0, 0.7607843, 1, 1,
0.08856022, -0.6171927, 2.758335, 0, 0.7529412, 1, 1,
0.09113316, -1.86664, 3.419397, 0, 0.7490196, 1, 1,
0.0926287, 1.532179, -0.3390671, 0, 0.7411765, 1, 1,
0.09408154, -0.7514619, 1.827721, 0, 0.7372549, 1, 1,
0.09624495, -0.2096453, 3.602232, 0, 0.7294118, 1, 1,
0.09707388, 0.8953696, -1.126024, 0, 0.7254902, 1, 1,
0.09932618, -0.06020186, 4.176047, 0, 0.7176471, 1, 1,
0.1023532, 2.045823, 1.014926, 0, 0.7137255, 1, 1,
0.1072204, 0.2060486, -1.931804, 0, 0.7058824, 1, 1,
0.1073307, -0.8954586, 4.217808, 0, 0.6980392, 1, 1,
0.1073354, 0.6225336, -0.3758302, 0, 0.6941177, 1, 1,
0.1097955, 0.7501468, -0.4476765, 0, 0.6862745, 1, 1,
0.1109298, -1.156754, 1.55336, 0, 0.682353, 1, 1,
0.112986, 0.6085306, -0.3365093, 0, 0.6745098, 1, 1,
0.1143277, -1.43188, 3.538313, 0, 0.6705883, 1, 1,
0.1147413, 0.6266939, 0.2201211, 0, 0.6627451, 1, 1,
0.1173272, -0.4859824, 0.7775254, 0, 0.6588235, 1, 1,
0.1228146, -0.3886955, 1.58313, 0, 0.6509804, 1, 1,
0.124295, -1.219966, 4.015585, 0, 0.6470588, 1, 1,
0.1302709, -0.8054403, 2.44805, 0, 0.6392157, 1, 1,
0.1405021, -1.877576, 4.492938, 0, 0.6352941, 1, 1,
0.1465512, -0.4650903, 3.065606, 0, 0.627451, 1, 1,
0.1477288, -1.839957, 2.015028, 0, 0.6235294, 1, 1,
0.1479286, -0.07903701, 1.465722, 0, 0.6156863, 1, 1,
0.1484206, -0.573584, 3.686113, 0, 0.6117647, 1, 1,
0.1518921, -0.03606198, 2.282699, 0, 0.6039216, 1, 1,
0.1530285, -1.574643, 3.635673, 0, 0.5960785, 1, 1,
0.1584881, -1.130744, 3.937187, 0, 0.5921569, 1, 1,
0.1586297, 0.1448103, 1.934872, 0, 0.5843138, 1, 1,
0.1608849, -0.1574296, 1.547908, 0, 0.5803922, 1, 1,
0.1621922, 1.318133, 0.7132692, 0, 0.572549, 1, 1,
0.1654846, 0.2697356, 0.4909138, 0, 0.5686275, 1, 1,
0.1684782, 1.200666, 0.7122076, 0, 0.5607843, 1, 1,
0.1695174, 0.07491186, 0.6723851, 0, 0.5568628, 1, 1,
0.1712344, -0.1841791, 1.640548, 0, 0.5490196, 1, 1,
0.1720719, -0.9418132, 3.097543, 0, 0.5450981, 1, 1,
0.1741157, 0.3974053, 0.08043046, 0, 0.5372549, 1, 1,
0.1786533, 1.882962, 0.2102804, 0, 0.5333334, 1, 1,
0.1842687, 0.7724336, -0.638177, 0, 0.5254902, 1, 1,
0.1887019, 1.480557, 0.4620329, 0, 0.5215687, 1, 1,
0.1908042, -0.4364934, 3.264385, 0, 0.5137255, 1, 1,
0.1976822, 0.05670625, 1.617743, 0, 0.509804, 1, 1,
0.2026008, -0.598186, 3.189135, 0, 0.5019608, 1, 1,
0.2036576, -0.5571942, 2.789196, 0, 0.4941176, 1, 1,
0.2058257, 0.2188626, 1.634247, 0, 0.4901961, 1, 1,
0.2071999, 1.095195, -0.120889, 0, 0.4823529, 1, 1,
0.2076615, 0.3696819, 0.8915705, 0, 0.4784314, 1, 1,
0.2079296, 2.201046, -0.8975652, 0, 0.4705882, 1, 1,
0.2079488, -1.100134, 3.772013, 0, 0.4666667, 1, 1,
0.2085123, -1.064974, 4.087101, 0, 0.4588235, 1, 1,
0.2128636, 0.881, 0.3479337, 0, 0.454902, 1, 1,
0.2139426, 0.4397218, 0.8961027, 0, 0.4470588, 1, 1,
0.2212664, 0.601319, -0.5160444, 0, 0.4431373, 1, 1,
0.229559, 0.8623682, 0.03437798, 0, 0.4352941, 1, 1,
0.2303709, 1.477121, 0.6454296, 0, 0.4313726, 1, 1,
0.2322307, 0.1258013, 0.897827, 0, 0.4235294, 1, 1,
0.2356792, 0.8915359, 0.3577661, 0, 0.4196078, 1, 1,
0.2419934, -0.9136379, 2.138905, 0, 0.4117647, 1, 1,
0.2469061, 1.633157, -0.3765442, 0, 0.4078431, 1, 1,
0.2498279, -0.9615621, 3.388348, 0, 0.4, 1, 1,
0.2687293, 0.03588657, -0.05373444, 0, 0.3921569, 1, 1,
0.2711546, -1.122301, 3.705873, 0, 0.3882353, 1, 1,
0.2729497, -0.8817621, 3.274143, 0, 0.3803922, 1, 1,
0.2730869, 0.08390513, 1.271227, 0, 0.3764706, 1, 1,
0.2882292, -1.369527, 3.659758, 0, 0.3686275, 1, 1,
0.3013429, 0.7468662, 0.4339748, 0, 0.3647059, 1, 1,
0.3018767, -0.2797696, 1.698194, 0, 0.3568628, 1, 1,
0.3023863, 2.069519, -1.430244, 0, 0.3529412, 1, 1,
0.3031913, -1.464985, 3.17219, 0, 0.345098, 1, 1,
0.3041227, 0.8572146, 0.7988024, 0, 0.3411765, 1, 1,
0.3079052, -0.808804, 3.411089, 0, 0.3333333, 1, 1,
0.3106944, -0.8282059, 3.889382, 0, 0.3294118, 1, 1,
0.3109641, -0.2731209, -0.5182381, 0, 0.3215686, 1, 1,
0.3115894, -0.477874, 2.193608, 0, 0.3176471, 1, 1,
0.3197551, 2.137525, -0.254559, 0, 0.3098039, 1, 1,
0.3225684, -0.8067262, 3.268961, 0, 0.3058824, 1, 1,
0.3236135, -0.08988136, 0.6853045, 0, 0.2980392, 1, 1,
0.335712, -0.2828572, 2.067578, 0, 0.2901961, 1, 1,
0.337667, -0.8934865, 1.920441, 0, 0.2862745, 1, 1,
0.3403538, 0.001941261, 0.7812276, 0, 0.2784314, 1, 1,
0.3413214, -0.5475057, 3.089393, 0, 0.2745098, 1, 1,
0.3470902, -0.2286687, 0.3625574, 0, 0.2666667, 1, 1,
0.3479636, -1.317422, 2.448267, 0, 0.2627451, 1, 1,
0.350819, 1.355347, 0.2043996, 0, 0.254902, 1, 1,
0.351719, 1.293815, 0.3730882, 0, 0.2509804, 1, 1,
0.353097, -1.813131, 2.436553, 0, 0.2431373, 1, 1,
0.3558913, -0.6443436, 2.226345, 0, 0.2392157, 1, 1,
0.35735, 0.989985, -0.6033827, 0, 0.2313726, 1, 1,
0.3683882, -2.172079, 4.426623, 0, 0.227451, 1, 1,
0.3696093, -0.1956077, 2.084935, 0, 0.2196078, 1, 1,
0.372381, -0.2078105, 2.78504, 0, 0.2156863, 1, 1,
0.373716, -1.728091, 2.415063, 0, 0.2078431, 1, 1,
0.3772799, 1.29877, -0.8144311, 0, 0.2039216, 1, 1,
0.3818844, 0.1341792, 1.727909, 0, 0.1960784, 1, 1,
0.3820781, -0.2588419, 1.66413, 0, 0.1882353, 1, 1,
0.382677, 0.1076588, -0.05818581, 0, 0.1843137, 1, 1,
0.3844628, 0.6841805, 1.555833, 0, 0.1764706, 1, 1,
0.3846364, 0.7371281, 1.335162, 0, 0.172549, 1, 1,
0.3862219, 0.4432095, 1.132312, 0, 0.1647059, 1, 1,
0.3874185, -0.879059, 4.025276, 0, 0.1607843, 1, 1,
0.38919, 0.6635697, -0.3225666, 0, 0.1529412, 1, 1,
0.3922466, -0.5857158, 2.159552, 0, 0.1490196, 1, 1,
0.3956402, -1.064767, 3.948715, 0, 0.1411765, 1, 1,
0.3975155, -0.9666562, 3.946067, 0, 0.1372549, 1, 1,
0.3982539, -0.2502683, 1.951737, 0, 0.1294118, 1, 1,
0.3987249, 0.4721998, 1.131421, 0, 0.1254902, 1, 1,
0.4049577, -0.05116178, 0.04898227, 0, 0.1176471, 1, 1,
0.4061737, 0.9417937, -0.2479694, 0, 0.1137255, 1, 1,
0.4073028, -0.9012764, 3.560719, 0, 0.1058824, 1, 1,
0.4075047, -0.3337601, 2.533228, 0, 0.09803922, 1, 1,
0.4075542, 0.6468346, 1.420728, 0, 0.09411765, 1, 1,
0.408105, -0.7415481, 3.308866, 0, 0.08627451, 1, 1,
0.4087716, -0.7021657, 3.79393, 0, 0.08235294, 1, 1,
0.4105793, -0.3494262, 4.435049, 0, 0.07450981, 1, 1,
0.4111595, 0.3948437, 0.4094704, 0, 0.07058824, 1, 1,
0.4159091, -0.3295602, 2.824225, 0, 0.0627451, 1, 1,
0.4185691, -0.6992504, 3.12733, 0, 0.05882353, 1, 1,
0.4321957, 1.342829, 2.974567, 0, 0.05098039, 1, 1,
0.4340669, -0.2450769, 2.92711, 0, 0.04705882, 1, 1,
0.4387822, -2.253801, 3.25621, 0, 0.03921569, 1, 1,
0.439272, 1.272577, 0.9159103, 0, 0.03529412, 1, 1,
0.4461721, -1.711075, 2.740804, 0, 0.02745098, 1, 1,
0.4472653, 0.5493451, 1.646484, 0, 0.02352941, 1, 1,
0.4474649, 1.033441, -0.309065, 0, 0.01568628, 1, 1,
0.448612, 0.2493498, 1.555207, 0, 0.01176471, 1, 1,
0.4545614, -0.5700579, 2.099123, 0, 0.003921569, 1, 1,
0.4547763, -0.3400624, 1.396014, 0.003921569, 0, 1, 1,
0.4558123, -0.5028415, 3.197824, 0.007843138, 0, 1, 1,
0.45758, 0.2151947, 1.872272, 0.01568628, 0, 1, 1,
0.4581221, 0.01641841, 2.73806, 0.01960784, 0, 1, 1,
0.4602385, 2.415689, 0.417291, 0.02745098, 0, 1, 1,
0.46117, -0.4894532, 2.470996, 0.03137255, 0, 1, 1,
0.4661494, 0.3727839, -0.9078851, 0.03921569, 0, 1, 1,
0.4683893, 0.9129626, -0.9389531, 0.04313726, 0, 1, 1,
0.4712438, -0.65202, 2.958106, 0.05098039, 0, 1, 1,
0.4760636, -0.4067089, 0.8474448, 0.05490196, 0, 1, 1,
0.4777649, 1.040792, 2.628951, 0.0627451, 0, 1, 1,
0.4783156, 2.072577, -0.6522027, 0.06666667, 0, 1, 1,
0.4790239, -0.5471289, 3.661822, 0.07450981, 0, 1, 1,
0.4795858, -1.198077, 3.786781, 0.07843138, 0, 1, 1,
0.4842904, -0.3271049, 3.174367, 0.08627451, 0, 1, 1,
0.488587, -0.3436672, 1.613355, 0.09019608, 0, 1, 1,
0.4893834, -1.096, 2.097562, 0.09803922, 0, 1, 1,
0.4919446, 0.7443067, 1.295215, 0.1058824, 0, 1, 1,
0.5005386, 2.579529, 0.5011084, 0.1098039, 0, 1, 1,
0.5007503, -0.7023522, 2.556297, 0.1176471, 0, 1, 1,
0.5027007, -0.2135943, 0.09929074, 0.1215686, 0, 1, 1,
0.5047296, 1.691012, 2.539521, 0.1294118, 0, 1, 1,
0.5053321, -0.168473, 1.239967, 0.1333333, 0, 1, 1,
0.5066857, 0.1832056, 3.294099, 0.1411765, 0, 1, 1,
0.5082481, 1.476694, -0.5876632, 0.145098, 0, 1, 1,
0.511191, 0.6071412, 2.238603, 0.1529412, 0, 1, 1,
0.5115188, -0.9374332, 3.193961, 0.1568628, 0, 1, 1,
0.5142298, 0.8626198, 1.23549, 0.1647059, 0, 1, 1,
0.514983, -1.715593, 3.994372, 0.1686275, 0, 1, 1,
0.5170014, -1.302891, 2.358151, 0.1764706, 0, 1, 1,
0.5177957, -0.02637817, 1.205364, 0.1803922, 0, 1, 1,
0.5214202, -0.285098, 1.947831, 0.1882353, 0, 1, 1,
0.5233119, -0.8305133, 2.054088, 0.1921569, 0, 1, 1,
0.5238906, -0.907811, 3.160995, 0.2, 0, 1, 1,
0.5273532, 0.136017, 1.565947, 0.2078431, 0, 1, 1,
0.5282984, -0.4986517, 3.475409, 0.2117647, 0, 1, 1,
0.5313706, 2.399208, 0.301054, 0.2196078, 0, 1, 1,
0.5321649, 0.5346801, 0.7105128, 0.2235294, 0, 1, 1,
0.5420788, -1.373878, 3.180841, 0.2313726, 0, 1, 1,
0.5447173, 0.8475305, -0.5143199, 0.2352941, 0, 1, 1,
0.5447682, -0.6885116, 0.9810814, 0.2431373, 0, 1, 1,
0.5512798, 0.9685398, 0.777338, 0.2470588, 0, 1, 1,
0.5514702, -0.301517, 2.846643, 0.254902, 0, 1, 1,
0.5520751, -1.058346, 2.729805, 0.2588235, 0, 1, 1,
0.5528056, -0.7601721, 2.434489, 0.2666667, 0, 1, 1,
0.5548855, 0.1590514, 2.928754, 0.2705882, 0, 1, 1,
0.5558966, -1.981348, 3.831145, 0.2784314, 0, 1, 1,
0.557293, 0.4962578, 1.399544, 0.282353, 0, 1, 1,
0.5579584, -1.367206, 2.150865, 0.2901961, 0, 1, 1,
0.5596513, 0.9739212, 2.655402, 0.2941177, 0, 1, 1,
0.5610846, 2.183815, 0.2664933, 0.3019608, 0, 1, 1,
0.5655295, -0.3940176, 1.946536, 0.3098039, 0, 1, 1,
0.5721968, 0.3668985, 1.14868, 0.3137255, 0, 1, 1,
0.5742211, -0.4225252, 2.531818, 0.3215686, 0, 1, 1,
0.5836098, -0.5613887, 3.105454, 0.3254902, 0, 1, 1,
0.5859265, -0.4705512, 2.574412, 0.3333333, 0, 1, 1,
0.5863606, -0.689939, 2.046864, 0.3372549, 0, 1, 1,
0.591329, 1.258349, -0.5118991, 0.345098, 0, 1, 1,
0.5914993, 0.7538921, 1.21866, 0.3490196, 0, 1, 1,
0.5932186, -0.231364, 2.825376, 0.3568628, 0, 1, 1,
0.594433, -1.691295, 1.074669, 0.3607843, 0, 1, 1,
0.5976424, 0.6765419, 1.179739, 0.3686275, 0, 1, 1,
0.602096, -1.028524, 1.101801, 0.372549, 0, 1, 1,
0.602522, -0.5874617, 1.149189, 0.3803922, 0, 1, 1,
0.6028875, -0.8055403, 2.503027, 0.3843137, 0, 1, 1,
0.6057517, 0.1842971, 1.020505, 0.3921569, 0, 1, 1,
0.60752, -1.233164, 1.059292, 0.3960784, 0, 1, 1,
0.6112328, 0.5987386, -0.461191, 0.4039216, 0, 1, 1,
0.6190617, -0.9725344, 3.505671, 0.4117647, 0, 1, 1,
0.6193178, 2.025346, 1.662152, 0.4156863, 0, 1, 1,
0.6271383, 1.329617, -1.037437, 0.4235294, 0, 1, 1,
0.6299387, -0.6909134, 1.577311, 0.427451, 0, 1, 1,
0.6336545, 0.7540191, 1.882034, 0.4352941, 0, 1, 1,
0.633746, -0.04881183, 3.175226, 0.4392157, 0, 1, 1,
0.6351111, -1.477936, 2.077793, 0.4470588, 0, 1, 1,
0.6370912, 0.2896796, 0.07693646, 0.4509804, 0, 1, 1,
0.6377953, 0.08401671, 0.7436588, 0.4588235, 0, 1, 1,
0.639798, -1.270562, 2.445546, 0.4627451, 0, 1, 1,
0.6437609, 1.167656, -0.3945352, 0.4705882, 0, 1, 1,
0.6470137, -0.9017669, 1.22365, 0.4745098, 0, 1, 1,
0.6492521, 0.7275556, 0.3699979, 0.4823529, 0, 1, 1,
0.6493869, 1.532818, 1.802612, 0.4862745, 0, 1, 1,
0.6568467, 2.307749, -0.8731647, 0.4941176, 0, 1, 1,
0.6740823, -0.8816571, 2.214257, 0.5019608, 0, 1, 1,
0.6745141, -0.4734552, 1.039021, 0.5058824, 0, 1, 1,
0.6775594, 0.7542716, 0.4002809, 0.5137255, 0, 1, 1,
0.678651, -1.31967, 4.105264, 0.5176471, 0, 1, 1,
0.6826468, -0.4402614, 3.372025, 0.5254902, 0, 1, 1,
0.6850402, 1.048483, 0.7468718, 0.5294118, 0, 1, 1,
0.6875384, -0.144999, 3.369678, 0.5372549, 0, 1, 1,
0.6893524, 0.5814815, 0.3379923, 0.5411765, 0, 1, 1,
0.6894533, -1.617406, 4.071589, 0.5490196, 0, 1, 1,
0.6896867, -0.8148648, 2.065829, 0.5529412, 0, 1, 1,
0.6948363, 2.832503, -1.186407, 0.5607843, 0, 1, 1,
0.6979697, -1.44195, 4.107248, 0.5647059, 0, 1, 1,
0.6981548, 0.2183698, 2.831827, 0.572549, 0, 1, 1,
0.6982671, 0.1286133, 1.401064, 0.5764706, 0, 1, 1,
0.7056028, -0.2925575, 0.9467773, 0.5843138, 0, 1, 1,
0.7082024, -0.7357651, 4.204074, 0.5882353, 0, 1, 1,
0.7169407, -0.3785523, 2.307315, 0.5960785, 0, 1, 1,
0.7215751, -1.118323, 2.521984, 0.6039216, 0, 1, 1,
0.7329243, -0.6649961, 3.948263, 0.6078432, 0, 1, 1,
0.7350144, 0.09566414, 0.3689555, 0.6156863, 0, 1, 1,
0.7358018, 0.8855925, -0.3761575, 0.6196079, 0, 1, 1,
0.7440389, 0.957994, 0.6363814, 0.627451, 0, 1, 1,
0.7453792, 0.01378742, 1.166033, 0.6313726, 0, 1, 1,
0.7473701, -0.0178893, 3.070825, 0.6392157, 0, 1, 1,
0.7510947, 1.217843, 0.2985826, 0.6431373, 0, 1, 1,
0.7523102, -0.0760071, -0.05152062, 0.6509804, 0, 1, 1,
0.7589338, 0.328542, 1.554955, 0.654902, 0, 1, 1,
0.7599699, -0.1305536, 2.5567, 0.6627451, 0, 1, 1,
0.7644017, -2.680066, 2.005497, 0.6666667, 0, 1, 1,
0.7791792, 0.3782032, 0.7788517, 0.6745098, 0, 1, 1,
0.7801247, -1.696333, 2.485687, 0.6784314, 0, 1, 1,
0.7850705, 0.9773166, 0.3158836, 0.6862745, 0, 1, 1,
0.8023289, 0.5737708, 0.8219132, 0.6901961, 0, 1, 1,
0.8102451, -0.1309638, 2.5738, 0.6980392, 0, 1, 1,
0.8103935, -0.5388545, 2.912319, 0.7058824, 0, 1, 1,
0.8108726, 0.2413665, 1.078255, 0.7098039, 0, 1, 1,
0.816732, -0.07255306, 0.4698229, 0.7176471, 0, 1, 1,
0.8256965, -0.8926681, 1.804612, 0.7215686, 0, 1, 1,
0.8301148, 1.135819, -0.4011312, 0.7294118, 0, 1, 1,
0.8308178, 0.6691313, -0.7182236, 0.7333333, 0, 1, 1,
0.8346031, -0.3608204, 3.841084, 0.7411765, 0, 1, 1,
0.8361992, 0.9634814, 2.357017, 0.7450981, 0, 1, 1,
0.8369206, -0.2496725, 1.553298, 0.7529412, 0, 1, 1,
0.8405995, -0.905981, 3.205941, 0.7568628, 0, 1, 1,
0.8431863, 2.055286, -0.3148645, 0.7647059, 0, 1, 1,
0.8446787, 0.1359182, 1.763884, 0.7686275, 0, 1, 1,
0.8453612, -0.7303287, 2.521758, 0.7764706, 0, 1, 1,
0.8542415, -1.679854, 0.2137707, 0.7803922, 0, 1, 1,
0.8587679, 1.004084, 2.722991, 0.7882353, 0, 1, 1,
0.8613884, 0.5014479, 0.1895691, 0.7921569, 0, 1, 1,
0.8636218, -0.8298656, 2.08407, 0.8, 0, 1, 1,
0.865956, -0.2849728, 2.497405, 0.8078431, 0, 1, 1,
0.8672071, 0.4210288, 1.811526, 0.8117647, 0, 1, 1,
0.8716171, 0.522003, 1.315017, 0.8196079, 0, 1, 1,
0.8723092, -0.396086, 1.479915, 0.8235294, 0, 1, 1,
0.8723894, -4.157502, 2.90995, 0.8313726, 0, 1, 1,
0.8728299, -1.534901, 3.401811, 0.8352941, 0, 1, 1,
0.8734231, 1.83339, 2.674703, 0.8431373, 0, 1, 1,
0.8794976, 1.500321, 0.6297981, 0.8470588, 0, 1, 1,
0.880226, 0.2808812, 0.176113, 0.854902, 0, 1, 1,
0.8841939, 1.26658, 2.437325, 0.8588235, 0, 1, 1,
0.8891467, 0.4480782, 1.973924, 0.8666667, 0, 1, 1,
0.8892942, -0.5187582, 2.268814, 0.8705882, 0, 1, 1,
0.8895772, 0.4884563, 0.281359, 0.8784314, 0, 1, 1,
0.8896518, -0.3022535, 3.116214, 0.8823529, 0, 1, 1,
0.8919719, -0.1320657, 1.490444, 0.8901961, 0, 1, 1,
0.8955915, -0.3844968, 1.086038, 0.8941177, 0, 1, 1,
0.9027395, -2.071486, 1.724732, 0.9019608, 0, 1, 1,
0.9056544, 0.5437238, 0.6039314, 0.9098039, 0, 1, 1,
0.9115403, 0.4180457, 0.4542601, 0.9137255, 0, 1, 1,
0.9137682, -0.6560966, 3.685869, 0.9215686, 0, 1, 1,
0.9186303, 0.4889786, 0.8896114, 0.9254902, 0, 1, 1,
0.9223752, -1.419522, 2.483181, 0.9333333, 0, 1, 1,
0.9266717, -0.6636469, 4.02373, 0.9372549, 0, 1, 1,
0.929692, 0.4275814, -0.337499, 0.945098, 0, 1, 1,
0.9318401, -1.426288, 2.097409, 0.9490196, 0, 1, 1,
0.9346527, 0.4160009, 2.036433, 0.9568627, 0, 1, 1,
0.9357656, 0.6185278, 0.04723923, 0.9607843, 0, 1, 1,
0.942567, 0.2155884, 0.09882608, 0.9686275, 0, 1, 1,
0.9595101, 0.9868245, -0.4136555, 0.972549, 0, 1, 1,
0.9635718, 0.9256962, 1.244119, 0.9803922, 0, 1, 1,
0.9701236, -0.0608611, 1.771019, 0.9843137, 0, 1, 1,
0.9726696, -0.7767524, 2.327633, 0.9921569, 0, 1, 1,
0.9811143, 0.5278051, 1.017004, 0.9960784, 0, 1, 1,
0.9865963, -0.1785521, 3.121953, 1, 0, 0.9960784, 1,
0.9911735, 2.060018, -2.378408, 1, 0, 0.9882353, 1,
0.9914918, -0.8116027, 0.6132886, 1, 0, 0.9843137, 1,
0.9938669, 0.6878794, 0.9387287, 1, 0, 0.9764706, 1,
1.001371, -0.006362366, 1.745724, 1, 0, 0.972549, 1,
1.002086, -1.247701, 1.777729, 1, 0, 0.9647059, 1,
1.006515, -0.822489, 0.4118103, 1, 0, 0.9607843, 1,
1.015207, 2.014211, -0.1512183, 1, 0, 0.9529412, 1,
1.021978, 1.613983, 1.883042, 1, 0, 0.9490196, 1,
1.035403, 0.8898799, -0.4816687, 1, 0, 0.9411765, 1,
1.053271, -0.4766273, 2.276191, 1, 0, 0.9372549, 1,
1.060096, 0.839548, 1.698837, 1, 0, 0.9294118, 1,
1.071351, -0.898731, 2.489752, 1, 0, 0.9254902, 1,
1.076493, 1.390416, -0.9731776, 1, 0, 0.9176471, 1,
1.078553, -0.089357, 1.619438, 1, 0, 0.9137255, 1,
1.083047, -0.4269883, -0.08580362, 1, 0, 0.9058824, 1,
1.083258, -0.1552311, 1.909378, 1, 0, 0.9019608, 1,
1.098625, -1.194646, 1.239364, 1, 0, 0.8941177, 1,
1.105978, 0.6040155, 2.132564, 1, 0, 0.8862745, 1,
1.109348, 0.3684941, 0.8861462, 1, 0, 0.8823529, 1,
1.117105, 1.196842, 1.129849, 1, 0, 0.8745098, 1,
1.118868, -0.2782822, 2.711408, 1, 0, 0.8705882, 1,
1.123096, 0.6665198, 1.816924, 1, 0, 0.8627451, 1,
1.128102, 0.8450429, -0.006161282, 1, 0, 0.8588235, 1,
1.128518, -0.2472278, 1.593602, 1, 0, 0.8509804, 1,
1.135119, 0.07778703, 4.444874, 1, 0, 0.8470588, 1,
1.1354, 0.9030936, 0.2568807, 1, 0, 0.8392157, 1,
1.137619, -0.5760322, 2.111215, 1, 0, 0.8352941, 1,
1.138584, -0.08077428, 1.176385, 1, 0, 0.827451, 1,
1.139868, 0.7181107, 1.003396, 1, 0, 0.8235294, 1,
1.148685, -0.3263344, 1.496499, 1, 0, 0.8156863, 1,
1.155217, 1.227554, 2.449001, 1, 0, 0.8117647, 1,
1.162138, 1.030539, -0.06283487, 1, 0, 0.8039216, 1,
1.168072, -1.365581, 1.801936, 1, 0, 0.7960784, 1,
1.168859, 0.5173758, 2.418461, 1, 0, 0.7921569, 1,
1.169678, -0.8206373, 1.354431, 1, 0, 0.7843137, 1,
1.174975, 1.153305, 1.840524, 1, 0, 0.7803922, 1,
1.180148, 0.629399, 0.2374676, 1, 0, 0.772549, 1,
1.194873, -0.07484225, 1.796582, 1, 0, 0.7686275, 1,
1.197791, -0.04550283, 1.398862, 1, 0, 0.7607843, 1,
1.200332, 0.1514547, 1.861472, 1, 0, 0.7568628, 1,
1.204247, -0.1948051, 0.748796, 1, 0, 0.7490196, 1,
1.205216, -1.008624, 0.3662846, 1, 0, 0.7450981, 1,
1.205739, -0.2060758, 1.797454, 1, 0, 0.7372549, 1,
1.208442, 0.05996474, 2.926752, 1, 0, 0.7333333, 1,
1.211351, -1.741616, 1.67044, 1, 0, 0.7254902, 1,
1.212662, 0.2607845, 2.794102, 1, 0, 0.7215686, 1,
1.214741, -0.6144477, 1.099053, 1, 0, 0.7137255, 1,
1.217452, -0.3664511, 2.490915, 1, 0, 0.7098039, 1,
1.220709, -0.7581289, 0.6582921, 1, 0, 0.7019608, 1,
1.225764, -0.5579832, 2.253317, 1, 0, 0.6941177, 1,
1.24999, -0.4552776, 2.063744, 1, 0, 0.6901961, 1,
1.251004, -0.6419445, 2.131416, 1, 0, 0.682353, 1,
1.25355, 0.8865138, 3.014694, 1, 0, 0.6784314, 1,
1.267788, -0.05611355, 2.71259, 1, 0, 0.6705883, 1,
1.269091, -1.145312, 0.6387722, 1, 0, 0.6666667, 1,
1.271889, -0.5541745, 2.398217, 1, 0, 0.6588235, 1,
1.272353, 0.2889066, 1.877405, 1, 0, 0.654902, 1,
1.273122, 0.6776759, 1.796427, 1, 0, 0.6470588, 1,
1.290915, 1.223959, 1.91985, 1, 0, 0.6431373, 1,
1.291622, 1.712593, 1.4182, 1, 0, 0.6352941, 1,
1.29442, 1.309507, 0.2055352, 1, 0, 0.6313726, 1,
1.303645, 0.2621366, 0.8293724, 1, 0, 0.6235294, 1,
1.303798, 1.627021, 2.484915, 1, 0, 0.6196079, 1,
1.330627, -0.1887211, 2.029629, 1, 0, 0.6117647, 1,
1.332242, 0.1644396, 4.245435, 1, 0, 0.6078432, 1,
1.339551, -0.1220131, 2.158911, 1, 0, 0.6, 1,
1.343931, 0.2150165, 0.2503722, 1, 0, 0.5921569, 1,
1.350053, 1.000421, 1.534113, 1, 0, 0.5882353, 1,
1.35183, -0.07999468, 0.4324748, 1, 0, 0.5803922, 1,
1.355748, 0.3013943, 0.6919942, 1, 0, 0.5764706, 1,
1.361282, -0.788682, 2.292446, 1, 0, 0.5686275, 1,
1.363436, 0.7298683, 2.190163, 1, 0, 0.5647059, 1,
1.364176, -0.01920047, 2.046058, 1, 0, 0.5568628, 1,
1.36724, -2.208813, 1.721544, 1, 0, 0.5529412, 1,
1.381562, 0.9025974, 1.085296, 1, 0, 0.5450981, 1,
1.389005, -0.05874313, 1.250658, 1, 0, 0.5411765, 1,
1.397735, -1.647222, 1.117275, 1, 0, 0.5333334, 1,
1.3979, -0.1070114, 1.985378, 1, 0, 0.5294118, 1,
1.400298, -0.8266666, 0.9930243, 1, 0, 0.5215687, 1,
1.415012, -0.611538, 1.974357, 1, 0, 0.5176471, 1,
1.43093, 0.3011946, 1.490905, 1, 0, 0.509804, 1,
1.43267, 0.8165544, 0.2439779, 1, 0, 0.5058824, 1,
1.44187, 1.715544, 1.154531, 1, 0, 0.4980392, 1,
1.44408, -0.05527638, 0.2007776, 1, 0, 0.4901961, 1,
1.447525, -1.437147, 1.732158, 1, 0, 0.4862745, 1,
1.460812, 0.8869835, 0.6687019, 1, 0, 0.4784314, 1,
1.472204, -0.0156238, 1.010787, 1, 0, 0.4745098, 1,
1.478515, 1.404763, -0.2879626, 1, 0, 0.4666667, 1,
1.479565, 1.080185, 1.308789, 1, 0, 0.4627451, 1,
1.486703, 0.08526051, 0.657133, 1, 0, 0.454902, 1,
1.490461, -0.8229733, 0.6463735, 1, 0, 0.4509804, 1,
1.504783, -0.8463876, 2.401001, 1, 0, 0.4431373, 1,
1.521374, -0.4534758, 1.159023, 1, 0, 0.4392157, 1,
1.544555, 1.842875, 0.3634391, 1, 0, 0.4313726, 1,
1.555896, -0.1081832, 1.166618, 1, 0, 0.427451, 1,
1.564545, 0.7423316, 1.885109, 1, 0, 0.4196078, 1,
1.567482, -0.5200889, 1.934968, 1, 0, 0.4156863, 1,
1.568211, -0.2848944, 2.806989, 1, 0, 0.4078431, 1,
1.602168, 0.258708, 2.173833, 1, 0, 0.4039216, 1,
1.603616, 1.343475, 0.2979083, 1, 0, 0.3960784, 1,
1.61855, -0.1930335, 1.805638, 1, 0, 0.3882353, 1,
1.618832, -0.3607073, 2.319656, 1, 0, 0.3843137, 1,
1.622501, 2.82141, 0.3004228, 1, 0, 0.3764706, 1,
1.630197, 0.4278944, 0.5752832, 1, 0, 0.372549, 1,
1.6412, -0.8979757, 1.472733, 1, 0, 0.3647059, 1,
1.677949, 0.4357238, 1.062385, 1, 0, 0.3607843, 1,
1.682495, 1.352569, 1.689938, 1, 0, 0.3529412, 1,
1.683863, -0.3976374, 2.124937, 1, 0, 0.3490196, 1,
1.687172, -1.073734, 3.067149, 1, 0, 0.3411765, 1,
1.697667, 0.5474013, 0.5281302, 1, 0, 0.3372549, 1,
1.710536, 0.1505309, 2.665696, 1, 0, 0.3294118, 1,
1.711361, 1.070049, 0.9043073, 1, 0, 0.3254902, 1,
1.713235, 0.1739671, 1.359824, 1, 0, 0.3176471, 1,
1.72411, -0.8815159, 2.012453, 1, 0, 0.3137255, 1,
1.746322, 0.9646339, -0.05540148, 1, 0, 0.3058824, 1,
1.746642, 0.9835067, 1.507141, 1, 0, 0.2980392, 1,
1.750294, -0.5175665, 3.768425, 1, 0, 0.2941177, 1,
1.7641, -1.764395, 4.693473, 1, 0, 0.2862745, 1,
1.764592, -1.109092, 2.699086, 1, 0, 0.282353, 1,
1.774845, 0.7158023, 0.4124455, 1, 0, 0.2745098, 1,
1.788303, 0.5513566, -0.9177269, 1, 0, 0.2705882, 1,
1.790197, -0.4527361, 2.546061, 1, 0, 0.2627451, 1,
1.790911, -0.4506228, 0.5508711, 1, 0, 0.2588235, 1,
1.814553, 0.8657311, 1.213468, 1, 0, 0.2509804, 1,
1.81871, -0.5078668, 3.1238, 1, 0, 0.2470588, 1,
1.850572, 0.5507419, 1.586374, 1, 0, 0.2392157, 1,
1.862503, -1.766044, 2.692801, 1, 0, 0.2352941, 1,
1.894116, -0.8938253, 1.767624, 1, 0, 0.227451, 1,
1.905155, 0.5689598, -0.1258391, 1, 0, 0.2235294, 1,
1.906198, -0.4683287, 1.066734, 1, 0, 0.2156863, 1,
1.923654, 2.212478, -0.4585656, 1, 0, 0.2117647, 1,
1.937916, 0.3677313, 1.339288, 1, 0, 0.2039216, 1,
1.940873, -1.549479, 2.797307, 1, 0, 0.1960784, 1,
1.963179, -1.293075, 1.505752, 1, 0, 0.1921569, 1,
1.977207, 0.4946188, -1.27518, 1, 0, 0.1843137, 1,
1.997947, -0.05346499, 1.957879, 1, 0, 0.1803922, 1,
2.006228, -0.6531979, 1.046584, 1, 0, 0.172549, 1,
2.008445, 0.8728904, 2.364857, 1, 0, 0.1686275, 1,
2.029075, -0.9175973, 2.426822, 1, 0, 0.1607843, 1,
2.046132, 1.407541, 2.446771, 1, 0, 0.1568628, 1,
2.046428, -1.178915, 2.269507, 1, 0, 0.1490196, 1,
2.098419, 0.3950582, 1.671451, 1, 0, 0.145098, 1,
2.103076, 2.031807, -1.658557, 1, 0, 0.1372549, 1,
2.117807, 0.1919879, 0.3807153, 1, 0, 0.1333333, 1,
2.125813, -0.7528944, 3.729665, 1, 0, 0.1254902, 1,
2.131014, 0.6407391, 1.621499, 1, 0, 0.1215686, 1,
2.148071, -1.669569, 1.947027, 1, 0, 0.1137255, 1,
2.149902, 2.480879, 0.9922485, 1, 0, 0.1098039, 1,
2.205121, 1.421029, -1.262453, 1, 0, 0.1019608, 1,
2.225733, -1.333893, 3.012621, 1, 0, 0.09411765, 1,
2.233648, 1.26016, 2.482386, 1, 0, 0.09019608, 1,
2.256832, -1.075791, 0.9537398, 1, 0, 0.08235294, 1,
2.273673, 1.503601, 0.7985293, 1, 0, 0.07843138, 1,
2.282999, -0.0297198, 3.506003, 1, 0, 0.07058824, 1,
2.285744, 2.627524, 0.6268161, 1, 0, 0.06666667, 1,
2.353052, -0.1646521, 2.227458, 1, 0, 0.05882353, 1,
2.356943, -0.02134474, 2.811543, 1, 0, 0.05490196, 1,
2.371001, 0.2615353, 1.915234, 1, 0, 0.04705882, 1,
2.455762, 0.04215185, 2.440069, 1, 0, 0.04313726, 1,
2.67274, -1.005774, 1.473847, 1, 0, 0.03529412, 1,
2.684198, 0.6028739, 2.413771, 1, 0, 0.03137255, 1,
2.688144, -0.06500537, 2.761149, 1, 0, 0.02352941, 1,
2.711193, -0.0539703, 0.2241877, 1, 0, 0.01960784, 1,
2.864692, -0.293537, 2.255837, 1, 0, 0.01176471, 1,
3.099496, 0.06370763, 2.300803, 1, 0, 0.007843138, 1
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
-0.1331987, -5.40716, -7.484156, 0, -0.5, 0.5, 0.5,
-0.1331987, -5.40716, -7.484156, 1, -0.5, 0.5, 0.5,
-0.1331987, -5.40716, -7.484156, 1, 1.5, 0.5, 0.5,
-0.1331987, -5.40716, -7.484156, 0, 1.5, 0.5, 0.5
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
-4.461777, -0.4711932, -7.484156, 0, -0.5, 0.5, 0.5,
-4.461777, -0.4711932, -7.484156, 1, -0.5, 0.5, 0.5,
-4.461777, -0.4711932, -7.484156, 1, 1.5, 0.5, 0.5,
-4.461777, -0.4711932, -7.484156, 0, 1.5, 0.5, 0.5
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
-4.461777, -5.40716, -0.2487876, 0, -0.5, 0.5, 0.5,
-4.461777, -5.40716, -0.2487876, 1, -0.5, 0.5, 0.5,
-4.461777, -5.40716, -0.2487876, 1, 1.5, 0.5, 0.5,
-4.461777, -5.40716, -0.2487876, 0, 1.5, 0.5, 0.5
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
-3, -4.268091, -5.814456,
3, -4.268091, -5.814456,
-3, -4.268091, -5.814456,
-3, -4.457936, -6.092739,
-2, -4.268091, -5.814456,
-2, -4.457936, -6.092739,
-1, -4.268091, -5.814456,
-1, -4.457936, -6.092739,
0, -4.268091, -5.814456,
0, -4.457936, -6.092739,
1, -4.268091, -5.814456,
1, -4.457936, -6.092739,
2, -4.268091, -5.814456,
2, -4.457936, -6.092739,
3, -4.268091, -5.814456,
3, -4.457936, -6.092739
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
-3, -4.837626, -6.649306, 0, -0.5, 0.5, 0.5,
-3, -4.837626, -6.649306, 1, -0.5, 0.5, 0.5,
-3, -4.837626, -6.649306, 1, 1.5, 0.5, 0.5,
-3, -4.837626, -6.649306, 0, 1.5, 0.5, 0.5,
-2, -4.837626, -6.649306, 0, -0.5, 0.5, 0.5,
-2, -4.837626, -6.649306, 1, -0.5, 0.5, 0.5,
-2, -4.837626, -6.649306, 1, 1.5, 0.5, 0.5,
-2, -4.837626, -6.649306, 0, 1.5, 0.5, 0.5,
-1, -4.837626, -6.649306, 0, -0.5, 0.5, 0.5,
-1, -4.837626, -6.649306, 1, -0.5, 0.5, 0.5,
-1, -4.837626, -6.649306, 1, 1.5, 0.5, 0.5,
-1, -4.837626, -6.649306, 0, 1.5, 0.5, 0.5,
0, -4.837626, -6.649306, 0, -0.5, 0.5, 0.5,
0, -4.837626, -6.649306, 1, -0.5, 0.5, 0.5,
0, -4.837626, -6.649306, 1, 1.5, 0.5, 0.5,
0, -4.837626, -6.649306, 0, 1.5, 0.5, 0.5,
1, -4.837626, -6.649306, 0, -0.5, 0.5, 0.5,
1, -4.837626, -6.649306, 1, -0.5, 0.5, 0.5,
1, -4.837626, -6.649306, 1, 1.5, 0.5, 0.5,
1, -4.837626, -6.649306, 0, 1.5, 0.5, 0.5,
2, -4.837626, -6.649306, 0, -0.5, 0.5, 0.5,
2, -4.837626, -6.649306, 1, -0.5, 0.5, 0.5,
2, -4.837626, -6.649306, 1, 1.5, 0.5, 0.5,
2, -4.837626, -6.649306, 0, 1.5, 0.5, 0.5,
3, -4.837626, -6.649306, 0, -0.5, 0.5, 0.5,
3, -4.837626, -6.649306, 1, -0.5, 0.5, 0.5,
3, -4.837626, -6.649306, 1, 1.5, 0.5, 0.5,
3, -4.837626, -6.649306, 0, 1.5, 0.5, 0.5
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
-3.462874, -4, -5.814456,
-3.462874, 2, -5.814456,
-3.462874, -4, -5.814456,
-3.629358, -4, -6.092739,
-3.462874, -2, -5.814456,
-3.629358, -2, -6.092739,
-3.462874, 0, -5.814456,
-3.629358, 0, -6.092739,
-3.462874, 2, -5.814456,
-3.629358, 2, -6.092739
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
"-4",
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
-3.962325, -4, -6.649306, 0, -0.5, 0.5, 0.5,
-3.962325, -4, -6.649306, 1, -0.5, 0.5, 0.5,
-3.962325, -4, -6.649306, 1, 1.5, 0.5, 0.5,
-3.962325, -4, -6.649306, 0, 1.5, 0.5, 0.5,
-3.962325, -2, -6.649306, 0, -0.5, 0.5, 0.5,
-3.962325, -2, -6.649306, 1, -0.5, 0.5, 0.5,
-3.962325, -2, -6.649306, 1, 1.5, 0.5, 0.5,
-3.962325, -2, -6.649306, 0, 1.5, 0.5, 0.5,
-3.962325, 0, -6.649306, 0, -0.5, 0.5, 0.5,
-3.962325, 0, -6.649306, 1, -0.5, 0.5, 0.5,
-3.962325, 0, -6.649306, 1, 1.5, 0.5, 0.5,
-3.962325, 0, -6.649306, 0, 1.5, 0.5, 0.5,
-3.962325, 2, -6.649306, 0, -0.5, 0.5, 0.5,
-3.962325, 2, -6.649306, 1, -0.5, 0.5, 0.5,
-3.962325, 2, -6.649306, 1, 1.5, 0.5, 0.5,
-3.962325, 2, -6.649306, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.462874, -4.268091, -4,
-3.462874, -4.268091, 4,
-3.462874, -4.268091, -4,
-3.629358, -4.457936, -4,
-3.462874, -4.268091, -2,
-3.629358, -4.457936, -2,
-3.462874, -4.268091, 0,
-3.629358, -4.457936, 0,
-3.462874, -4.268091, 2,
-3.629358, -4.457936, 2,
-3.462874, -4.268091, 4,
-3.629358, -4.457936, 4
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
-3.962325, -4.837626, -4, 0, -0.5, 0.5, 0.5,
-3.962325, -4.837626, -4, 1, -0.5, 0.5, 0.5,
-3.962325, -4.837626, -4, 1, 1.5, 0.5, 0.5,
-3.962325, -4.837626, -4, 0, 1.5, 0.5, 0.5,
-3.962325, -4.837626, -2, 0, -0.5, 0.5, 0.5,
-3.962325, -4.837626, -2, 1, -0.5, 0.5, 0.5,
-3.962325, -4.837626, -2, 1, 1.5, 0.5, 0.5,
-3.962325, -4.837626, -2, 0, 1.5, 0.5, 0.5,
-3.962325, -4.837626, 0, 0, -0.5, 0.5, 0.5,
-3.962325, -4.837626, 0, 1, -0.5, 0.5, 0.5,
-3.962325, -4.837626, 0, 1, 1.5, 0.5, 0.5,
-3.962325, -4.837626, 0, 0, 1.5, 0.5, 0.5,
-3.962325, -4.837626, 2, 0, -0.5, 0.5, 0.5,
-3.962325, -4.837626, 2, 1, -0.5, 0.5, 0.5,
-3.962325, -4.837626, 2, 1, 1.5, 0.5, 0.5,
-3.962325, -4.837626, 2, 0, 1.5, 0.5, 0.5,
-3.962325, -4.837626, 4, 0, -0.5, 0.5, 0.5,
-3.962325, -4.837626, 4, 1, -0.5, 0.5, 0.5,
-3.962325, -4.837626, 4, 1, 1.5, 0.5, 0.5,
-3.962325, -4.837626, 4, 0, 1.5, 0.5, 0.5
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
-3.462874, -4.268091, -5.814456,
-3.462874, 3.325705, -5.814456,
-3.462874, -4.268091, 5.316881,
-3.462874, 3.325705, 5.316881,
-3.462874, -4.268091, -5.814456,
-3.462874, -4.268091, 5.316881,
-3.462874, 3.325705, -5.814456,
-3.462874, 3.325705, 5.316881,
-3.462874, -4.268091, -5.814456,
3.196476, -4.268091, -5.814456,
-3.462874, -4.268091, 5.316881,
3.196476, -4.268091, 5.316881,
-3.462874, 3.325705, -5.814456,
3.196476, 3.325705, -5.814456,
-3.462874, 3.325705, 5.316881,
3.196476, 3.325705, 5.316881,
3.196476, -4.268091, -5.814456,
3.196476, 3.325705, -5.814456,
3.196476, -4.268091, 5.316881,
3.196476, 3.325705, 5.316881,
3.196476, -4.268091, -5.814456,
3.196476, -4.268091, 5.316881,
3.196476, 3.325705, -5.814456,
3.196476, 3.325705, 5.316881
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
var radius = 8.026055;
var distance = 35.70882;
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
mvMatrix.translate( 0.1331987, 0.4711932, 0.2487876 );
mvMatrix.scale( 1.303119, 1.142766, 0.7795945 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.70882);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
sodium_azide<-read.table("sodium_azide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sodium_azide$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_azide' not found
```

```r
y<-sodium_azide$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_azide' not found
```

```r
z<-sodium_azide$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_azide' not found
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
-3.365893, -1.330582, -1.124734, 0, 0, 1, 1, 1,
-3.267873, -1.020227, -2.32622, 1, 0, 0, 1, 1,
-2.765439, -1.000412, -0.6675513, 1, 0, 0, 1, 1,
-2.763143, -0.496524, -2.556265, 1, 0, 0, 1, 1,
-2.671343, -1.207636, -2.111584, 1, 0, 0, 1, 1,
-2.481894, 1.73061, -2.958261, 1, 0, 0, 1, 1,
-2.446104, -0.3274687, -0.9363565, 0, 0, 0, 1, 1,
-2.444446, 0.2306496, -2.84788, 0, 0, 0, 1, 1,
-2.358929, 1.177298, -1.842112, 0, 0, 0, 1, 1,
-2.317633, -0.9168039, 0.125706, 0, 0, 0, 1, 1,
-2.295418, 1.611925, -1.588001, 0, 0, 0, 1, 1,
-2.258494, -0.5278113, -1.769997, 0, 0, 0, 1, 1,
-2.255316, -1.824463, -1.133776, 0, 0, 0, 1, 1,
-2.233563, -0.1122579, -1.915347, 1, 1, 1, 1, 1,
-2.232, 0.2068672, -1.007063, 1, 1, 1, 1, 1,
-2.230609, 0.3028518, -2.169363, 1, 1, 1, 1, 1,
-2.209158, 0.8764718, -0.187375, 1, 1, 1, 1, 1,
-2.206962, -0.3704833, -0.1912104, 1, 1, 1, 1, 1,
-2.197598, -1.64181, -0.5944714, 1, 1, 1, 1, 1,
-2.143414, -0.3275986, -1.516063, 1, 1, 1, 1, 1,
-2.114173, 0.1197587, -1.815521, 1, 1, 1, 1, 1,
-2.09431, -0.6524461, -0.8873233, 1, 1, 1, 1, 1,
-2.079776, 2.150382, -0.5729806, 1, 1, 1, 1, 1,
-2.077131, 0.3664473, -1.271336, 1, 1, 1, 1, 1,
-2.043367, 1.250132, -1.460138, 1, 1, 1, 1, 1,
-2.010027, 1.515365, 0.3247305, 1, 1, 1, 1, 1,
-1.9774, 0.1846592, -2.581045, 1, 1, 1, 1, 1,
-1.976452, 0.3394896, -1.108234, 1, 1, 1, 1, 1,
-1.943023, -0.5744413, -0.1722773, 0, 0, 1, 1, 1,
-1.916951, 0.5256283, -1.774553, 1, 0, 0, 1, 1,
-1.905447, -1.120078, -2.114165, 1, 0, 0, 1, 1,
-1.872349, 1.302292, -0.6350001, 1, 0, 0, 1, 1,
-1.867536, 0.3075176, -1.485245, 1, 0, 0, 1, 1,
-1.866712, 0.9395915, 0.5718302, 1, 0, 0, 1, 1,
-1.865316, -0.2512835, -2.649375, 0, 0, 0, 1, 1,
-1.861366, -0.6029449, -1.836566, 0, 0, 0, 1, 1,
-1.831797, -0.05858239, -2.650591, 0, 0, 0, 1, 1,
-1.806434, 0.2064521, -3.277532, 0, 0, 0, 1, 1,
-1.803211, -2.518498, -4.182017, 0, 0, 0, 1, 1,
-1.791399, 0.4859926, -2.000384, 0, 0, 0, 1, 1,
-1.728096, 1.78767, 1.46461, 0, 0, 0, 1, 1,
-1.696105, -0.4961143, -2.627524, 1, 1, 1, 1, 1,
-1.687766, -1.003747, -0.447318, 1, 1, 1, 1, 1,
-1.679497, 1.153874, -0.4998598, 1, 1, 1, 1, 1,
-1.668136, 1.711632, -0.4168244, 1, 1, 1, 1, 1,
-1.657654, 0.5440801, -1.069936, 1, 1, 1, 1, 1,
-1.653384, -0.6898528, -3.141609, 1, 1, 1, 1, 1,
-1.641164, -0.01376848, -0.3025374, 1, 1, 1, 1, 1,
-1.630052, 0.2284276, -1.127344, 1, 1, 1, 1, 1,
-1.609047, -0.1357192, -2.297155, 1, 1, 1, 1, 1,
-1.603771, 1.155599, -0.9936312, 1, 1, 1, 1, 1,
-1.600447, 0.1658672, 0.5524174, 1, 1, 1, 1, 1,
-1.596443, -0.4304065, -0.8708007, 1, 1, 1, 1, 1,
-1.587814, 0.7169504, -0.7706357, 1, 1, 1, 1, 1,
-1.581246, -0.4134691, -1.178711, 1, 1, 1, 1, 1,
-1.576946, 1.579997, 0.10739, 1, 1, 1, 1, 1,
-1.567583, -0.5863985, -2.14908, 0, 0, 1, 1, 1,
-1.563689, 0.5512079, -0.8939795, 1, 0, 0, 1, 1,
-1.560856, -1.982857, -2.777372, 1, 0, 0, 1, 1,
-1.551157, -0.3003973, -3.113863, 1, 0, 0, 1, 1,
-1.54985, 0.3694862, -1.127284, 1, 0, 0, 1, 1,
-1.549518, -1.184933, -1.608764, 1, 0, 0, 1, 1,
-1.540433, 0.364427, -2.560857, 0, 0, 0, 1, 1,
-1.534285, 0.4150096, -0.8944012, 0, 0, 0, 1, 1,
-1.523949, -0.5057006, -1.415564, 0, 0, 0, 1, 1,
-1.490407, -1.94861, -2.809363, 0, 0, 0, 1, 1,
-1.490025, -2.034323, -2.606463, 0, 0, 0, 1, 1,
-1.482425, -0.5215365, -1.04909, 0, 0, 0, 1, 1,
-1.478675, 0.2072925, -2.024962, 0, 0, 0, 1, 1,
-1.477411, -0.5845993, 0.6330171, 1, 1, 1, 1, 1,
-1.472768, -0.3761827, -1.492244, 1, 1, 1, 1, 1,
-1.461363, -0.7693844, -1.057711, 1, 1, 1, 1, 1,
-1.440361, 0.8740008, -1.294119, 1, 1, 1, 1, 1,
-1.431961, -0.703483, -2.300759, 1, 1, 1, 1, 1,
-1.425919, -1.627913, -2.314841, 1, 1, 1, 1, 1,
-1.409293, -0.7047263, -2.484396, 1, 1, 1, 1, 1,
-1.405583, 0.9045312, -0.2643825, 1, 1, 1, 1, 1,
-1.399758, 0.7308528, -0.8607764, 1, 1, 1, 1, 1,
-1.392096, 0.2181918, -3.47158, 1, 1, 1, 1, 1,
-1.386941, 0.9840589, -2.205124, 1, 1, 1, 1, 1,
-1.384193, 1.108895, -0.8267038, 1, 1, 1, 1, 1,
-1.379713, -0.3268297, -2.756766, 1, 1, 1, 1, 1,
-1.376034, -0.6777992, -3.535879, 1, 1, 1, 1, 1,
-1.375709, 0.8478223, -1.986389, 1, 1, 1, 1, 1,
-1.365347, 0.03126423, -2.55402, 0, 0, 1, 1, 1,
-1.362988, 0.3766052, -2.786715, 1, 0, 0, 1, 1,
-1.354181, -0.2002075, -1.281297, 1, 0, 0, 1, 1,
-1.338773, -0.3232623, -2.335886, 1, 0, 0, 1, 1,
-1.334904, 1.489959, -0.6085433, 1, 0, 0, 1, 1,
-1.33136, -0.8689892, -1.620903, 1, 0, 0, 1, 1,
-1.330371, -0.1832893, -2.300544, 0, 0, 0, 1, 1,
-1.325204, -0.5134159, -2.314698, 0, 0, 0, 1, 1,
-1.320204, 0.1008955, -1.896641, 0, 0, 0, 1, 1,
-1.319854, -0.3393699, -2.059352, 0, 0, 0, 1, 1,
-1.311101, -0.2895781, -1.502055, 0, 0, 0, 1, 1,
-1.309016, -0.196841, -0.4296747, 0, 0, 0, 1, 1,
-1.293872, -0.5408059, -0.718329, 0, 0, 0, 1, 1,
-1.287509, -0.7237857, -0.7131717, 1, 1, 1, 1, 1,
-1.286449, -0.01996695, -1.963415, 1, 1, 1, 1, 1,
-1.267608, -0.1145228, -0.8701625, 1, 1, 1, 1, 1,
-1.264537, 0.0508429, -0.6157144, 1, 1, 1, 1, 1,
-1.261743, 1.387788, -0.9084353, 1, 1, 1, 1, 1,
-1.259232, 1.65784, 0.2550077, 1, 1, 1, 1, 1,
-1.258231, 0.06352908, -1.880567, 1, 1, 1, 1, 1,
-1.24326, 0.03804966, 0.09894986, 1, 1, 1, 1, 1,
-1.233556, -0.7735474, -4.568138, 1, 1, 1, 1, 1,
-1.22489, 0.502057, 0.195228, 1, 1, 1, 1, 1,
-1.21659, -0.7466015, -0.3544255, 1, 1, 1, 1, 1,
-1.19865, 0.1707135, -0.9466683, 1, 1, 1, 1, 1,
-1.195349, -0.275128, -1.491877, 1, 1, 1, 1, 1,
-1.19187, 0.348665, -1.020659, 1, 1, 1, 1, 1,
-1.190681, -0.2570596, -0.5930302, 1, 1, 1, 1, 1,
-1.177972, 0.5294689, -1.033835, 0, 0, 1, 1, 1,
-1.175466, -0.7945614, -2.694094, 1, 0, 0, 1, 1,
-1.172971, 1.255154, -1.162138, 1, 0, 0, 1, 1,
-1.170908, -0.4446461, -1.608906, 1, 0, 0, 1, 1,
-1.160085, -1.31305, -3.058577, 1, 0, 0, 1, 1,
-1.155609, -0.8048055, -1.8497, 1, 0, 0, 1, 1,
-1.154015, 0.9313936, -0.0920628, 0, 0, 0, 1, 1,
-1.146886, -0.6410639, -2.43069, 0, 0, 0, 1, 1,
-1.146387, 0.09041812, -2.291609, 0, 0, 0, 1, 1,
-1.141501, 0.07484622, -0.6683615, 0, 0, 0, 1, 1,
-1.138096, 0.4273917, -1.167656, 0, 0, 0, 1, 1,
-1.135871, 0.9755531, -0.9050032, 0, 0, 0, 1, 1,
-1.135604, 0.424085, -0.6356633, 0, 0, 0, 1, 1,
-1.130481, 1.214616, -0.3820155, 1, 1, 1, 1, 1,
-1.128737, -0.4113907, -1.632003, 1, 1, 1, 1, 1,
-1.125686, -0.9544759, -3.804687, 1, 1, 1, 1, 1,
-1.123177, 2.589912, -0.9522157, 1, 1, 1, 1, 1,
-1.122045, 0.9558278, -0.2487455, 1, 1, 1, 1, 1,
-1.121575, -0.2641642, -2.306654, 1, 1, 1, 1, 1,
-1.116731, 1.008511, -2.257413, 1, 1, 1, 1, 1,
-1.115996, 0.4335729, 0.569283, 1, 1, 1, 1, 1,
-1.112784, 1.200887, -0.8622108, 1, 1, 1, 1, 1,
-1.1126, -3.070563, -3.035247, 1, 1, 1, 1, 1,
-1.105168, -0.7048451, -2.99502, 1, 1, 1, 1, 1,
-1.104261, 0.3660028, -0.5981297, 1, 1, 1, 1, 1,
-1.101282, -1.057719, -3.741018, 1, 1, 1, 1, 1,
-1.094698, 0.483455, -1.566687, 1, 1, 1, 1, 1,
-1.0905, -1.717827, -4.523176, 1, 1, 1, 1, 1,
-1.088766, -0.2838707, -1.931432, 0, 0, 1, 1, 1,
-1.07838, -1.164411, -1.028319, 1, 0, 0, 1, 1,
-1.070734, -1.322772, -3.61501, 1, 0, 0, 1, 1,
-1.069374, -0.7165621, -1.874795, 1, 0, 0, 1, 1,
-1.067916, 1.418581, -0.4185917, 1, 0, 0, 1, 1,
-1.067416, 0.4085911, 0.4486266, 1, 0, 0, 1, 1,
-1.067295, 1.857688, -0.4937173, 0, 0, 0, 1, 1,
-1.064769, 1.571987, 0.1632217, 0, 0, 0, 1, 1,
-1.063422, 0.1507469, -2.290827, 0, 0, 0, 1, 1,
-1.060467, 0.3142922, -0.6425228, 0, 0, 0, 1, 1,
-1.059958, 0.07674983, -1.098619, 0, 0, 0, 1, 1,
-1.057622, -0.3292535, -2.9368, 0, 0, 0, 1, 1,
-1.043336, 1.197315, -1.066697, 0, 0, 0, 1, 1,
-1.040135, -0.1930982, -1.292716, 1, 1, 1, 1, 1,
-1.035586, 0.1660648, -0.7220837, 1, 1, 1, 1, 1,
-1.034518, 1.78814, 0.1976862, 1, 1, 1, 1, 1,
-1.029501, -1.62643, -3.620817, 1, 1, 1, 1, 1,
-1.029178, -0.1089967, -2.711657, 1, 1, 1, 1, 1,
-1.026093, -1.255246, -2.231486, 1, 1, 1, 1, 1,
-1.020042, 0.4876063, -0.5788746, 1, 1, 1, 1, 1,
-1.018788, -0.1575668, -1.56816, 1, 1, 1, 1, 1,
-1.014309, -0.07259949, -1.315097, 1, 1, 1, 1, 1,
-1.010725, -1.571865, -4.584952, 1, 1, 1, 1, 1,
-1.007488, -1.25994, -2.685229, 1, 1, 1, 1, 1,
-1.001091, 3.215115, -0.536065, 1, 1, 1, 1, 1,
-0.9978896, 0.4477716, -0.668297, 1, 1, 1, 1, 1,
-0.9948163, -2.43133, -2.286691, 1, 1, 1, 1, 1,
-0.9866098, -1.44525, -3.576582, 1, 1, 1, 1, 1,
-0.9767789, 1.538469, -0.2424883, 0, 0, 1, 1, 1,
-0.9693044, -1.239642, -0.05628288, 1, 0, 0, 1, 1,
-0.9688324, 0.003144698, -1.758823, 1, 0, 0, 1, 1,
-0.9479549, 1.041296, -0.7512463, 1, 0, 0, 1, 1,
-0.9424848, -0.4994211, 0.5198298, 1, 0, 0, 1, 1,
-0.9419961, -0.9171914, -1.288409, 1, 0, 0, 1, 1,
-0.9377972, 1.17083, -2.258828, 0, 0, 0, 1, 1,
-0.9357281, -0.7608521, -1.227599, 0, 0, 0, 1, 1,
-0.9341639, 0.7016151, 1.40346, 0, 0, 0, 1, 1,
-0.9333445, 0.4286191, 0.6892592, 0, 0, 0, 1, 1,
-0.9328527, 1.123193, 0.2471655, 0, 0, 0, 1, 1,
-0.9323135, 1.112874, -1.415328, 0, 0, 0, 1, 1,
-0.9322588, 0.6270055, -1.682334, 0, 0, 0, 1, 1,
-0.9300692, 0.2876244, 0.4679289, 1, 1, 1, 1, 1,
-0.925492, 0.3006536, -1.499476, 1, 1, 1, 1, 1,
-0.9223644, -0.2391323, -3.416117, 1, 1, 1, 1, 1,
-0.9209977, 0.4863951, -0.6985956, 1, 1, 1, 1, 1,
-0.9209117, -0.2923091, -1.375619, 1, 1, 1, 1, 1,
-0.9163472, -2.518953, -2.881253, 1, 1, 1, 1, 1,
-0.9128335, -1.258991, -4.91071, 1, 1, 1, 1, 1,
-0.9092084, -0.3326861, -1.637273, 1, 1, 1, 1, 1,
-0.9088244, -0.9630978, -1.568722, 1, 1, 1, 1, 1,
-0.9086192, -0.9407785, -3.873102, 1, 1, 1, 1, 1,
-0.9068404, -0.04612532, -2.37565, 1, 1, 1, 1, 1,
-0.9035927, 1.026051, -0.8189136, 1, 1, 1, 1, 1,
-0.9016747, 0.8553463, -2.371297, 1, 1, 1, 1, 1,
-0.8889387, 0.5651769, -1.566898, 1, 1, 1, 1, 1,
-0.8887625, 0.9711449, -0.3004216, 1, 1, 1, 1, 1,
-0.8821949, -0.2207675, -1.416773, 0, 0, 1, 1, 1,
-0.8820741, 1.154392, -0.8853276, 1, 0, 0, 1, 1,
-0.8818647, 2.345502, -0.9092839, 1, 0, 0, 1, 1,
-0.8788911, 0.6492185, -1.659536, 1, 0, 0, 1, 1,
-0.8770954, -0.4606607, -1.215875, 1, 0, 0, 1, 1,
-0.8643658, -0.5418708, -3.297484, 1, 0, 0, 1, 1,
-0.863843, -0.4108809, -2.918344, 0, 0, 0, 1, 1,
-0.8637288, -0.7444976, 0.05160761, 0, 0, 0, 1, 1,
-0.860481, 0.5598769, -0.4976355, 0, 0, 0, 1, 1,
-0.8597725, -0.01600016, -1.726241, 0, 0, 0, 1, 1,
-0.8566447, -0.2573701, -1.775433, 0, 0, 0, 1, 1,
-0.8529819, -0.3371191, -2.174929, 0, 0, 0, 1, 1,
-0.8449774, -1.303789, -0.8571695, 0, 0, 0, 1, 1,
-0.8439203, 0.7700187, -1.691122, 1, 1, 1, 1, 1,
-0.843431, 1.778668, 0.5054111, 1, 1, 1, 1, 1,
-0.8381898, -0.4050942, -2.393235, 1, 1, 1, 1, 1,
-0.8215215, -0.6503832, -0.6881218, 1, 1, 1, 1, 1,
-0.8165515, 0.7780659, -0.9297257, 1, 1, 1, 1, 1,
-0.8086821, 0.08690968, -0.5472577, 1, 1, 1, 1, 1,
-0.8083874, 2.052882, -0.9974972, 1, 1, 1, 1, 1,
-0.7923143, -0.1464997, -2.857153, 1, 1, 1, 1, 1,
-0.7868675, -0.6235262, -1.249138, 1, 1, 1, 1, 1,
-0.7836646, 1.61263, -0.4531612, 1, 1, 1, 1, 1,
-0.7767068, -0.1284015, -2.732338, 1, 1, 1, 1, 1,
-0.7736019, -1.331711, -1.700186, 1, 1, 1, 1, 1,
-0.7702786, -1.266518, -2.524013, 1, 1, 1, 1, 1,
-0.7685038, -1.179124, -2.536717, 1, 1, 1, 1, 1,
-0.762646, -0.4811403, -1.98213, 1, 1, 1, 1, 1,
-0.762086, -0.07115608, -1.370994, 0, 0, 1, 1, 1,
-0.7615858, 0.368155, -1.551989, 1, 0, 0, 1, 1,
-0.75724, 0.2095023, 0.3587864, 1, 0, 0, 1, 1,
-0.7537847, -1.804016, -3.188687, 1, 0, 0, 1, 1,
-0.7511847, -0.7612711, -3.126365, 1, 0, 0, 1, 1,
-0.7486049, 0.004352774, -0.6597387, 1, 0, 0, 1, 1,
-0.7468263, -0.2546887, -2.815329, 0, 0, 0, 1, 1,
-0.7459179, -0.1985348, -2.083714, 0, 0, 0, 1, 1,
-0.7454866, -0.9138851, -1.091037, 0, 0, 0, 1, 1,
-0.7431239, 0.3734931, -1.018731, 0, 0, 0, 1, 1,
-0.7371002, -2.070066, -2.783962, 0, 0, 0, 1, 1,
-0.7366585, -0.8329943, -2.319371, 0, 0, 0, 1, 1,
-0.7354397, 0.1033867, -2.535629, 0, 0, 0, 1, 1,
-0.7316296, 0.454715, -0.04170812, 1, 1, 1, 1, 1,
-0.7304684, 0.2510356, -1.766525, 1, 1, 1, 1, 1,
-0.7302243, -0.3137805, -2.120673, 1, 1, 1, 1, 1,
-0.7301858, 0.6291572, -1.572015, 1, 1, 1, 1, 1,
-0.7290921, -0.1107585, -1.315585, 1, 1, 1, 1, 1,
-0.7286423, -0.2019365, -0.1123168, 1, 1, 1, 1, 1,
-0.7273519, 0.30845, -0.2668309, 1, 1, 1, 1, 1,
-0.7253473, -0.5649382, -2.878158, 1, 1, 1, 1, 1,
-0.7208428, -0.7706022, -3.310708, 1, 1, 1, 1, 1,
-0.720216, 0.3188367, -2.344153, 1, 1, 1, 1, 1,
-0.7180889, 1.164771, -0.7741722, 1, 1, 1, 1, 1,
-0.7140848, -0.2933729, -2.237842, 1, 1, 1, 1, 1,
-0.7048509, 1.197092, -0.8279092, 1, 1, 1, 1, 1,
-0.7043348, -0.4817111, -2.099531, 1, 1, 1, 1, 1,
-0.7039033, 0.7416066, -0.3298327, 1, 1, 1, 1, 1,
-0.7025453, -0.5604149, -1.696217, 0, 0, 1, 1, 1,
-0.6970074, 1.43607, -0.01480301, 1, 0, 0, 1, 1,
-0.6953925, 2.134391, 1.003374, 1, 0, 0, 1, 1,
-0.694537, -0.003954738, -0.489776, 1, 0, 0, 1, 1,
-0.6936792, -0.7991515, -3.125023, 1, 0, 0, 1, 1,
-0.6914604, 0.3412202, 0.9059517, 1, 0, 0, 1, 1,
-0.6899164, 0.03279349, -0.2937243, 0, 0, 0, 1, 1,
-0.6893542, 2.299455, 0.1277791, 0, 0, 0, 1, 1,
-0.6881676, -0.9638005, -2.219892, 0, 0, 0, 1, 1,
-0.6860169, -1.090224, -2.643219, 0, 0, 0, 1, 1,
-0.6830033, 0.3433733, -1.873528, 0, 0, 0, 1, 1,
-0.6822306, -0.06307613, -1.41098, 0, 0, 0, 1, 1,
-0.6819228, 1.292624, -0.1952307, 0, 0, 0, 1, 1,
-0.6794149, 0.2362996, -1.647385, 1, 1, 1, 1, 1,
-0.6764705, -0.8901097, -1.690825, 1, 1, 1, 1, 1,
-0.6749607, -0.2460879, -1.78608, 1, 1, 1, 1, 1,
-0.6710641, -0.7902167, -2.906046, 1, 1, 1, 1, 1,
-0.6667868, -0.6447725, -1.761695, 1, 1, 1, 1, 1,
-0.660397, -0.5200905, -2.744185, 1, 1, 1, 1, 1,
-0.6581538, 0.6137043, -0.4176995, 1, 1, 1, 1, 1,
-0.6557383, -0.5639938, -1.199116, 1, 1, 1, 1, 1,
-0.6457072, 1.053376, 1.377576, 1, 1, 1, 1, 1,
-0.6331763, 1.290612, -1.124778, 1, 1, 1, 1, 1,
-0.6315486, -1.613998, -3.879719, 1, 1, 1, 1, 1,
-0.6303393, -0.2974054, -1.507668, 1, 1, 1, 1, 1,
-0.628634, -0.5691388, -4.048648, 1, 1, 1, 1, 1,
-0.6270091, 0.087278, -1.588566, 1, 1, 1, 1, 1,
-0.6157417, -0.1014009, -1.9034, 1, 1, 1, 1, 1,
-0.6153788, -0.6286117, -2.762412, 0, 0, 1, 1, 1,
-0.6136783, 0.08142015, -1.581538, 1, 0, 0, 1, 1,
-0.612115, -0.1879021, -2.831001, 1, 0, 0, 1, 1,
-0.611048, -0.06037706, -2.52627, 1, 0, 0, 1, 1,
-0.607195, 0.1460711, -2.549259, 1, 0, 0, 1, 1,
-0.606247, -2.537288, -4.66516, 1, 0, 0, 1, 1,
-0.605789, 0.8752756, -2.078381, 0, 0, 0, 1, 1,
-0.6017119, -1.303411, -0.8958593, 0, 0, 0, 1, 1,
-0.594276, 0.1949284, -2.17563, 0, 0, 0, 1, 1,
-0.5941947, -0.2458279, -1.721278, 0, 0, 0, 1, 1,
-0.5856996, 1.28404, -0.7562098, 0, 0, 0, 1, 1,
-0.5821434, 1.27813, -0.6179385, 0, 0, 0, 1, 1,
-0.578431, 0.2428881, -2.352172, 0, 0, 0, 1, 1,
-0.5718675, -0.1832393, -1.897836, 1, 1, 1, 1, 1,
-0.5715491, -1.753841, -2.592441, 1, 1, 1, 1, 1,
-0.5666508, 0.2319004, -2.283775, 1, 1, 1, 1, 1,
-0.5646783, 0.4904733, -0.8687674, 1, 1, 1, 1, 1,
-0.5634289, 0.8742847, -1.815147, 1, 1, 1, 1, 1,
-0.5606208, -0.3823273, -2.616437, 1, 1, 1, 1, 1,
-0.558165, 0.3106638, -2.078025, 1, 1, 1, 1, 1,
-0.5574186, -0.3788389, -1.286549, 1, 1, 1, 1, 1,
-0.5523313, -0.1989496, -1.861563, 1, 1, 1, 1, 1,
-0.5390756, -0.580216, -1.785327, 1, 1, 1, 1, 1,
-0.535016, -0.3236223, -2.986806, 1, 1, 1, 1, 1,
-0.5318115, 0.5259246, 1.646661, 1, 1, 1, 1, 1,
-0.5245017, 1.058711, -0.9241686, 1, 1, 1, 1, 1,
-0.5241717, -0.8476139, -1.356317, 1, 1, 1, 1, 1,
-0.5162407, 1.220854, -0.207401, 1, 1, 1, 1, 1,
-0.510529, 0.2710294, 0.1030947, 0, 0, 1, 1, 1,
-0.5037713, -0.9614463, -2.782499, 1, 0, 0, 1, 1,
-0.502955, 0.634687, 0.5122039, 1, 0, 0, 1, 1,
-0.4988136, 0.05075729, -2.360055, 1, 0, 0, 1, 1,
-0.4953089, -0.729641, -1.57248, 1, 0, 0, 1, 1,
-0.4929804, -0.5372137, -2.930843, 1, 0, 0, 1, 1,
-0.4925032, 0.8110596, 0.3043359, 0, 0, 0, 1, 1,
-0.4888548, 1.363743, -0.6731854, 0, 0, 0, 1, 1,
-0.4882405, -0.9835964, -3.215065, 0, 0, 0, 1, 1,
-0.4857481, 0.9892781, -1.066739, 0, 0, 0, 1, 1,
-0.4848458, -0.343656, -2.065574, 0, 0, 0, 1, 1,
-0.4806171, 0.7930518, -0.6369541, 0, 0, 0, 1, 1,
-0.4776994, 0.8209858, -2.128412, 0, 0, 0, 1, 1,
-0.4744703, 0.784068, -0.1513649, 1, 1, 1, 1, 1,
-0.4715695, 0.3622101, -0.6888193, 1, 1, 1, 1, 1,
-0.4683398, -1.164339, -5.652349, 1, 1, 1, 1, 1,
-0.4615608, -0.08226722, -0.7434773, 1, 1, 1, 1, 1,
-0.4599041, -0.9294313, -2.573589, 1, 1, 1, 1, 1,
-0.4588438, -0.5481216, -2.243907, 1, 1, 1, 1, 1,
-0.451621, -1.114623, -4.343002, 1, 1, 1, 1, 1,
-0.4471835, -3.221439, -5.028673, 1, 1, 1, 1, 1,
-0.4446049, -0.4570412, -0.8655742, 1, 1, 1, 1, 1,
-0.4401354, -0.1029379, 0.2631207, 1, 1, 1, 1, 1,
-0.4362313, 0.3782493, -2.558338, 1, 1, 1, 1, 1,
-0.4320843, -0.6876209, 0.00769311, 1, 1, 1, 1, 1,
-0.4297062, -0.6956286, -1.339836, 1, 1, 1, 1, 1,
-0.4280879, -0.7851245, -1.222463, 1, 1, 1, 1, 1,
-0.4253229, -1.444006, -2.174406, 1, 1, 1, 1, 1,
-0.4191303, 0.6950125, -1.767153, 0, 0, 1, 1, 1,
-0.4189047, 0.8394778, -0.5403122, 1, 0, 0, 1, 1,
-0.4178457, 0.9761716, -0.8557151, 1, 0, 0, 1, 1,
-0.4160576, 0.506771, -1.229052, 1, 0, 0, 1, 1,
-0.4158167, -1.193963, -4.209885, 1, 0, 0, 1, 1,
-0.4153663, -1.132313, -4.444855, 1, 0, 0, 1, 1,
-0.4151828, -0.6225091, -3.418806, 0, 0, 0, 1, 1,
-0.4082682, 0.4454312, -2.119763, 0, 0, 0, 1, 1,
-0.4049383, -0.372658, -3.857892, 0, 0, 0, 1, 1,
-0.3940787, -1.116128, -4.426656, 0, 0, 0, 1, 1,
-0.3804626, 0.5819948, -1.200734, 0, 0, 0, 1, 1,
-0.3796721, -0.7613114, -3.317076, 0, 0, 0, 1, 1,
-0.3786521, -0.9550275, -3.841179, 0, 0, 0, 1, 1,
-0.3779494, -0.0573558, -2.026971, 1, 1, 1, 1, 1,
-0.3768357, -0.1136611, -1.75291, 1, 1, 1, 1, 1,
-0.3728895, -0.03142496, -3.521302, 1, 1, 1, 1, 1,
-0.3709828, 0.5171866, -0.712825, 1, 1, 1, 1, 1,
-0.3698756, -0.3994376, -2.59871, 1, 1, 1, 1, 1,
-0.36716, 0.827093, 0.7220607, 1, 1, 1, 1, 1,
-0.3665854, -0.1695644, -4.173911, 1, 1, 1, 1, 1,
-0.3631203, -0.9721283, -1.715781, 1, 1, 1, 1, 1,
-0.3592448, 0.7333506, -1.996563, 1, 1, 1, 1, 1,
-0.3560134, 0.287805, -0.9137796, 1, 1, 1, 1, 1,
-0.3484085, -1.254147, -1.911024, 1, 1, 1, 1, 1,
-0.3477424, -0.8314034, -0.03009092, 1, 1, 1, 1, 1,
-0.3450963, -0.168742, -1.0855, 1, 1, 1, 1, 1,
-0.3426919, 0.3207001, -0.6125272, 1, 1, 1, 1, 1,
-0.3406876, 1.62268, -0.1778062, 1, 1, 1, 1, 1,
-0.3397522, 1.048855, -0.3387083, 0, 0, 1, 1, 1,
-0.3364914, -0.1038319, -2.15726, 1, 0, 0, 1, 1,
-0.3339232, -0.7542077, -1.601804, 1, 0, 0, 1, 1,
-0.3292467, 1.485194, 2.125684, 1, 0, 0, 1, 1,
-0.3275121, -0.525376, -1.615143, 1, 0, 0, 1, 1,
-0.326253, -0.1028139, -0.1919539, 1, 0, 0, 1, 1,
-0.3261172, -0.4557904, -1.562183, 0, 0, 0, 1, 1,
-0.3260316, -1.235633, -3.33922, 0, 0, 0, 1, 1,
-0.3247238, 0.6448162, 1.590178, 0, 0, 0, 1, 1,
-0.3246135, 1.218166, 0.304855, 0, 0, 0, 1, 1,
-0.3165701, -1.146838, -1.812463, 0, 0, 0, 1, 1,
-0.3146791, -0.6534309, -2.771713, 0, 0, 0, 1, 1,
-0.3145069, 0.2148998, -0.315031, 0, 0, 0, 1, 1,
-0.3083746, -2.35389, -2.634054, 1, 1, 1, 1, 1,
-0.3081141, -1.69631, -2.289265, 1, 1, 1, 1, 1,
-0.3080852, 1.444147, -0.3012801, 1, 1, 1, 1, 1,
-0.3031725, 0.671227, -1.048647, 1, 1, 1, 1, 1,
-0.3023174, -1.048726, -3.233779, 1, 1, 1, 1, 1,
-0.2954597, 0.07153477, -0.7807526, 1, 1, 1, 1, 1,
-0.2947834, -0.4688474, -2.746375, 1, 1, 1, 1, 1,
-0.2879272, -1.702254, -1.637963, 1, 1, 1, 1, 1,
-0.2867973, -0.1411063, -3.621453, 1, 1, 1, 1, 1,
-0.2855377, -0.5906845, -2.542052, 1, 1, 1, 1, 1,
-0.2852187, -0.7028502, -2.604194, 1, 1, 1, 1, 1,
-0.2841173, -0.3954638, -2.265573, 1, 1, 1, 1, 1,
-0.2839468, 1.767137, 0.3429218, 1, 1, 1, 1, 1,
-0.282747, -0.7507513, -2.250121, 1, 1, 1, 1, 1,
-0.2814125, -0.8745117, -3.086508, 1, 1, 1, 1, 1,
-0.2805975, 0.5999901, -2.0081, 0, 0, 1, 1, 1,
-0.2791116, -0.1261636, 0.4438837, 1, 0, 0, 1, 1,
-0.2733122, -1.183483, -4.865596, 1, 0, 0, 1, 1,
-0.2729804, -0.4988359, -1.18127, 1, 0, 0, 1, 1,
-0.2696545, -1.673849, -2.805628, 1, 0, 0, 1, 1,
-0.2651139, 0.8217561, 0.08167428, 1, 0, 0, 1, 1,
-0.262983, -1.666327, -2.90797, 0, 0, 0, 1, 1,
-0.2585031, 0.4496968, -0.2740658, 0, 0, 0, 1, 1,
-0.2541455, -0.9957493, -2.127997, 0, 0, 0, 1, 1,
-0.2505106, -0.4765647, -2.800186, 0, 0, 0, 1, 1,
-0.2463147, -1.42611, -3.838392, 0, 0, 0, 1, 1,
-0.2446069, 0.9276614, 0.7656775, 0, 0, 0, 1, 1,
-0.2424416, 0.09298998, -0.3135477, 0, 0, 0, 1, 1,
-0.2365055, 1.404781, -1.304492, 1, 1, 1, 1, 1,
-0.2332464, 0.007256477, -1.364816, 1, 1, 1, 1, 1,
-0.229064, 1.13181, -0.8218498, 1, 1, 1, 1, 1,
-0.2282395, 0.08965389, -1.024728, 1, 1, 1, 1, 1,
-0.2274439, -1.947964, -2.443627, 1, 1, 1, 1, 1,
-0.2265615, -0.3393706, -2.109427, 1, 1, 1, 1, 1,
-0.2236971, 0.8920905, -0.4202352, 1, 1, 1, 1, 1,
-0.2201193, -0.5590156, -1.349347, 1, 1, 1, 1, 1,
-0.2163877, 1.254041, 0.4875423, 1, 1, 1, 1, 1,
-0.2141847, 0.1825042, -4.327179, 1, 1, 1, 1, 1,
-0.2130845, 0.4720658, -0.1848262, 1, 1, 1, 1, 1,
-0.2072767, 0.2565675, -0.6322173, 1, 1, 1, 1, 1,
-0.2046149, -0.3919864, -1.863198, 1, 1, 1, 1, 1,
-0.2037376, 0.5481924, -0.1221464, 1, 1, 1, 1, 1,
-0.2015008, 0.6442761, 1.038024, 1, 1, 1, 1, 1,
-0.2002255, 1.390069, 0.8496714, 0, 0, 1, 1, 1,
-0.2000125, 0.486355, -0.4078436, 1, 0, 0, 1, 1,
-0.1912368, -0.5160831, -2.399163, 1, 0, 0, 1, 1,
-0.1906825, 0.7945961, -0.7225918, 1, 0, 0, 1, 1,
-0.1898031, -2.364573, -3.656401, 1, 0, 0, 1, 1,
-0.1884175, 0.03076494, -0.8458399, 1, 0, 0, 1, 1,
-0.184964, 0.9920336, -0.4420769, 0, 0, 0, 1, 1,
-0.181045, -0.2939494, -3.952188, 0, 0, 0, 1, 1,
-0.178654, 0.09751204, -0.4758462, 0, 0, 0, 1, 1,
-0.1767018, -1.054949, -5.295269, 0, 0, 0, 1, 1,
-0.1765173, -0.1233264, -1.128932, 0, 0, 0, 1, 1,
-0.1759268, -0.3211475, -2.024654, 0, 0, 0, 1, 1,
-0.1737738, 0.1213493, 0.2923419, 0, 0, 0, 1, 1,
-0.1698736, -0.3833204, -1.679769, 1, 1, 1, 1, 1,
-0.1666912, -2.008574, -2.021579, 1, 1, 1, 1, 1,
-0.165412, 0.490824, -0.6193498, 1, 1, 1, 1, 1,
-0.1645978, -1.314168, -3.285885, 1, 1, 1, 1, 1,
-0.1644018, 1.587583, -0.7126086, 1, 1, 1, 1, 1,
-0.1643359, -0.003663392, -1.638241, 1, 1, 1, 1, 1,
-0.1619622, 0.8737534, 0.3275992, 1, 1, 1, 1, 1,
-0.1587046, 0.2135848, -0.3283531, 1, 1, 1, 1, 1,
-0.1578422, 1.116148, -1.759559, 1, 1, 1, 1, 1,
-0.1572476, -0.2242127, -1.469832, 1, 1, 1, 1, 1,
-0.1562985, -1.939957, -3.204493, 1, 1, 1, 1, 1,
-0.1545966, 0.3368801, -0.0746795, 1, 1, 1, 1, 1,
-0.1536778, 0.8187786, -0.4876329, 1, 1, 1, 1, 1,
-0.1522641, -0.9317059, -3.096382, 1, 1, 1, 1, 1,
-0.1370637, 0.1577496, -1.343204, 1, 1, 1, 1, 1,
-0.1349694, -1.350871, -2.307867, 0, 0, 1, 1, 1,
-0.1327555, 2.594603, 0.9063687, 1, 0, 0, 1, 1,
-0.1326284, -1.217472, -4.356772, 1, 0, 0, 1, 1,
-0.1304582, -1.23135, -3.790206, 1, 0, 0, 1, 1,
-0.1299332, -1.608683, -2.693835, 1, 0, 0, 1, 1,
-0.1226498, -1.400403, -2.63306, 1, 0, 0, 1, 1,
-0.1183125, -0.2537638, -2.620996, 0, 0, 0, 1, 1,
-0.1120209, 0.3311797, -0.1293441, 0, 0, 0, 1, 1,
-0.1082473, -0.07006998, -2.928236, 0, 0, 0, 1, 1,
-0.1059689, 1.040692, 1.585811, 0, 0, 0, 1, 1,
-0.1047726, 0.1549993, 1.067889, 0, 0, 0, 1, 1,
-0.09879503, -0.4194229, -4.639572, 0, 0, 0, 1, 1,
-0.09822963, -0.8602356, -2.583835, 0, 0, 0, 1, 1,
-0.09822482, -0.07308272, -2.809967, 1, 1, 1, 1, 1,
-0.09756684, 0.32998, -0.7784169, 1, 1, 1, 1, 1,
-0.09559276, 0.5146681, -0.1536588, 1, 1, 1, 1, 1,
-0.09528172, -0.1470846, -2.440718, 1, 1, 1, 1, 1,
-0.09082963, 0.7111519, 0.8248151, 1, 1, 1, 1, 1,
-0.08960732, -0.3883343, -5.276416, 1, 1, 1, 1, 1,
-0.08892129, -1.76939, -1.506891, 1, 1, 1, 1, 1,
-0.08565651, 0.2803648, -0.09430803, 1, 1, 1, 1, 1,
-0.08476243, -0.1824077, -2.640667, 1, 1, 1, 1, 1,
-0.08268593, -0.1045203, -1.700723, 1, 1, 1, 1, 1,
-0.0814086, 0.8677827, 0.914574, 1, 1, 1, 1, 1,
-0.07712889, 0.6161429, -1.935138, 1, 1, 1, 1, 1,
-0.07518081, -0.750908, -4.610603, 1, 1, 1, 1, 1,
-0.07380006, -0.130773, -0.2528023, 1, 1, 1, 1, 1,
-0.07277398, -0.6712132, -2.695701, 1, 1, 1, 1, 1,
-0.07069407, 0.02688302, -1.432652, 0, 0, 1, 1, 1,
-0.06779347, 0.2728688, 0.2233523, 1, 0, 0, 1, 1,
-0.06397021, -1.33252, -2.746159, 1, 0, 0, 1, 1,
-0.05783248, -0.2799154, -2.494077, 1, 0, 0, 1, 1,
-0.05695483, 0.1936931, -0.9861552, 1, 0, 0, 1, 1,
-0.05531557, 0.9444147, 0.207125, 1, 0, 0, 1, 1,
-0.05014481, -0.2777645, -2.958603, 0, 0, 0, 1, 1,
-0.04133254, -0.06933979, -2.229268, 0, 0, 0, 1, 1,
-0.0344542, -0.8586416, -5.505986, 0, 0, 0, 1, 1,
-0.02917518, 0.5558504, -0.07837687, 0, 0, 0, 1, 1,
-0.02910019, -1.256501, -2.383619, 0, 0, 0, 1, 1,
-0.02750128, 0.8632196, -2.159423, 0, 0, 0, 1, 1,
-0.02179101, -0.5108166, -1.814844, 0, 0, 0, 1, 1,
-0.02047331, -0.7835383, -4.400464, 1, 1, 1, 1, 1,
-0.0189254, -1.014014, -4.310482, 1, 1, 1, 1, 1,
-0.01869085, 0.6419992, -0.6061156, 1, 1, 1, 1, 1,
-0.0155946, 0.07761669, 1.827207, 1, 1, 1, 1, 1,
-0.01511178, -0.6007585, -4.120002, 1, 1, 1, 1, 1,
-0.01222183, -0.06405581, -3.264767, 1, 1, 1, 1, 1,
-0.01149021, -0.6563686, -4.33874, 1, 1, 1, 1, 1,
-0.0114832, 0.7656937, 0.3070577, 1, 1, 1, 1, 1,
-0.009392626, 0.3772887, -0.6576986, 1, 1, 1, 1, 1,
-0.008521909, -1.333155, -1.466839, 1, 1, 1, 1, 1,
-0.006899402, -0.05566533, -2.903073, 1, 1, 1, 1, 1,
0.0004606234, 0.5070322, 0.8761661, 1, 1, 1, 1, 1,
0.001723213, -0.2741071, 2.9953, 1, 1, 1, 1, 1,
0.009819943, 0.3654387, -1.033909, 1, 1, 1, 1, 1,
0.01149483, -0.495517, 3.97901, 1, 1, 1, 1, 1,
0.01157959, -1.60539, 2.491604, 0, 0, 1, 1, 1,
0.01542337, 1.497863, -0.169008, 1, 0, 0, 1, 1,
0.01558902, -1.54572, 1.40843, 1, 0, 0, 1, 1,
0.02446954, 1.268277, 1.374264, 1, 0, 0, 1, 1,
0.02674546, -0.6070181, 2.93316, 1, 0, 0, 1, 1,
0.02710593, 0.4675652, 1.245144, 1, 0, 0, 1, 1,
0.02761064, -1.234694, 3.259418, 0, 0, 0, 1, 1,
0.02856597, -2.224725, 4.443598, 0, 0, 0, 1, 1,
0.03100907, -1.0084, 2.696215, 0, 0, 0, 1, 1,
0.03137599, -0.5482184, 3.410956, 0, 0, 0, 1, 1,
0.03157585, 0.09972673, -0.1967057, 0, 0, 0, 1, 1,
0.03171185, 1.349201, -0.4615414, 0, 0, 0, 1, 1,
0.03300283, 0.05803377, 1.422112, 0, 0, 0, 1, 1,
0.03628738, -0.7470702, 2.662501, 1, 1, 1, 1, 1,
0.03630062, -1.34305, 4.568989, 1, 1, 1, 1, 1,
0.03635548, 0.5435493, -0.7079102, 1, 1, 1, 1, 1,
0.03889146, 1.12423, -0.168051, 1, 1, 1, 1, 1,
0.04014543, 1.058902, 1.407097, 1, 1, 1, 1, 1,
0.04136578, 0.0349126, 0.09952654, 1, 1, 1, 1, 1,
0.04215503, -0.114356, 2.12334, 1, 1, 1, 1, 1,
0.04477866, 0.2617024, -1.213595, 1, 1, 1, 1, 1,
0.04495437, -1.571128, 2.374524, 1, 1, 1, 1, 1,
0.04775703, -2.183912, 5.154774, 1, 1, 1, 1, 1,
0.04908163, -0.01452568, 2.771738, 1, 1, 1, 1, 1,
0.05095767, 0.9874151, 1.397841, 1, 1, 1, 1, 1,
0.05213912, -1.473336, 1.937963, 1, 1, 1, 1, 1,
0.05434207, 1.097318, -1.397105, 1, 1, 1, 1, 1,
0.05504108, -0.527846, 2.053065, 1, 1, 1, 1, 1,
0.05788469, -0.03991186, 1.401797, 0, 0, 1, 1, 1,
0.06995766, 0.06548373, 1.644675, 1, 0, 0, 1, 1,
0.07194348, 1.552034, 0.2665415, 1, 0, 0, 1, 1,
0.07363074, -0.06402063, 2.964268, 1, 0, 0, 1, 1,
0.07845652, 1.316984, 1.98309, 1, 0, 0, 1, 1,
0.08235499, 0.09141685, -1.88061, 1, 0, 0, 1, 1,
0.08241666, 0.427509, -0.07625521, 0, 0, 0, 1, 1,
0.08457408, 0.02924014, 0.700178, 0, 0, 0, 1, 1,
0.08839948, -0.3146076, 1.650697, 0, 0, 0, 1, 1,
0.08856022, -0.6171927, 2.758335, 0, 0, 0, 1, 1,
0.09113316, -1.86664, 3.419397, 0, 0, 0, 1, 1,
0.0926287, 1.532179, -0.3390671, 0, 0, 0, 1, 1,
0.09408154, -0.7514619, 1.827721, 0, 0, 0, 1, 1,
0.09624495, -0.2096453, 3.602232, 1, 1, 1, 1, 1,
0.09707388, 0.8953696, -1.126024, 1, 1, 1, 1, 1,
0.09932618, -0.06020186, 4.176047, 1, 1, 1, 1, 1,
0.1023532, 2.045823, 1.014926, 1, 1, 1, 1, 1,
0.1072204, 0.2060486, -1.931804, 1, 1, 1, 1, 1,
0.1073307, -0.8954586, 4.217808, 1, 1, 1, 1, 1,
0.1073354, 0.6225336, -0.3758302, 1, 1, 1, 1, 1,
0.1097955, 0.7501468, -0.4476765, 1, 1, 1, 1, 1,
0.1109298, -1.156754, 1.55336, 1, 1, 1, 1, 1,
0.112986, 0.6085306, -0.3365093, 1, 1, 1, 1, 1,
0.1143277, -1.43188, 3.538313, 1, 1, 1, 1, 1,
0.1147413, 0.6266939, 0.2201211, 1, 1, 1, 1, 1,
0.1173272, -0.4859824, 0.7775254, 1, 1, 1, 1, 1,
0.1228146, -0.3886955, 1.58313, 1, 1, 1, 1, 1,
0.124295, -1.219966, 4.015585, 1, 1, 1, 1, 1,
0.1302709, -0.8054403, 2.44805, 0, 0, 1, 1, 1,
0.1405021, -1.877576, 4.492938, 1, 0, 0, 1, 1,
0.1465512, -0.4650903, 3.065606, 1, 0, 0, 1, 1,
0.1477288, -1.839957, 2.015028, 1, 0, 0, 1, 1,
0.1479286, -0.07903701, 1.465722, 1, 0, 0, 1, 1,
0.1484206, -0.573584, 3.686113, 1, 0, 0, 1, 1,
0.1518921, -0.03606198, 2.282699, 0, 0, 0, 1, 1,
0.1530285, -1.574643, 3.635673, 0, 0, 0, 1, 1,
0.1584881, -1.130744, 3.937187, 0, 0, 0, 1, 1,
0.1586297, 0.1448103, 1.934872, 0, 0, 0, 1, 1,
0.1608849, -0.1574296, 1.547908, 0, 0, 0, 1, 1,
0.1621922, 1.318133, 0.7132692, 0, 0, 0, 1, 1,
0.1654846, 0.2697356, 0.4909138, 0, 0, 0, 1, 1,
0.1684782, 1.200666, 0.7122076, 1, 1, 1, 1, 1,
0.1695174, 0.07491186, 0.6723851, 1, 1, 1, 1, 1,
0.1712344, -0.1841791, 1.640548, 1, 1, 1, 1, 1,
0.1720719, -0.9418132, 3.097543, 1, 1, 1, 1, 1,
0.1741157, 0.3974053, 0.08043046, 1, 1, 1, 1, 1,
0.1786533, 1.882962, 0.2102804, 1, 1, 1, 1, 1,
0.1842687, 0.7724336, -0.638177, 1, 1, 1, 1, 1,
0.1887019, 1.480557, 0.4620329, 1, 1, 1, 1, 1,
0.1908042, -0.4364934, 3.264385, 1, 1, 1, 1, 1,
0.1976822, 0.05670625, 1.617743, 1, 1, 1, 1, 1,
0.2026008, -0.598186, 3.189135, 1, 1, 1, 1, 1,
0.2036576, -0.5571942, 2.789196, 1, 1, 1, 1, 1,
0.2058257, 0.2188626, 1.634247, 1, 1, 1, 1, 1,
0.2071999, 1.095195, -0.120889, 1, 1, 1, 1, 1,
0.2076615, 0.3696819, 0.8915705, 1, 1, 1, 1, 1,
0.2079296, 2.201046, -0.8975652, 0, 0, 1, 1, 1,
0.2079488, -1.100134, 3.772013, 1, 0, 0, 1, 1,
0.2085123, -1.064974, 4.087101, 1, 0, 0, 1, 1,
0.2128636, 0.881, 0.3479337, 1, 0, 0, 1, 1,
0.2139426, 0.4397218, 0.8961027, 1, 0, 0, 1, 1,
0.2212664, 0.601319, -0.5160444, 1, 0, 0, 1, 1,
0.229559, 0.8623682, 0.03437798, 0, 0, 0, 1, 1,
0.2303709, 1.477121, 0.6454296, 0, 0, 0, 1, 1,
0.2322307, 0.1258013, 0.897827, 0, 0, 0, 1, 1,
0.2356792, 0.8915359, 0.3577661, 0, 0, 0, 1, 1,
0.2419934, -0.9136379, 2.138905, 0, 0, 0, 1, 1,
0.2469061, 1.633157, -0.3765442, 0, 0, 0, 1, 1,
0.2498279, -0.9615621, 3.388348, 0, 0, 0, 1, 1,
0.2687293, 0.03588657, -0.05373444, 1, 1, 1, 1, 1,
0.2711546, -1.122301, 3.705873, 1, 1, 1, 1, 1,
0.2729497, -0.8817621, 3.274143, 1, 1, 1, 1, 1,
0.2730869, 0.08390513, 1.271227, 1, 1, 1, 1, 1,
0.2882292, -1.369527, 3.659758, 1, 1, 1, 1, 1,
0.3013429, 0.7468662, 0.4339748, 1, 1, 1, 1, 1,
0.3018767, -0.2797696, 1.698194, 1, 1, 1, 1, 1,
0.3023863, 2.069519, -1.430244, 1, 1, 1, 1, 1,
0.3031913, -1.464985, 3.17219, 1, 1, 1, 1, 1,
0.3041227, 0.8572146, 0.7988024, 1, 1, 1, 1, 1,
0.3079052, -0.808804, 3.411089, 1, 1, 1, 1, 1,
0.3106944, -0.8282059, 3.889382, 1, 1, 1, 1, 1,
0.3109641, -0.2731209, -0.5182381, 1, 1, 1, 1, 1,
0.3115894, -0.477874, 2.193608, 1, 1, 1, 1, 1,
0.3197551, 2.137525, -0.254559, 1, 1, 1, 1, 1,
0.3225684, -0.8067262, 3.268961, 0, 0, 1, 1, 1,
0.3236135, -0.08988136, 0.6853045, 1, 0, 0, 1, 1,
0.335712, -0.2828572, 2.067578, 1, 0, 0, 1, 1,
0.337667, -0.8934865, 1.920441, 1, 0, 0, 1, 1,
0.3403538, 0.001941261, 0.7812276, 1, 0, 0, 1, 1,
0.3413214, -0.5475057, 3.089393, 1, 0, 0, 1, 1,
0.3470902, -0.2286687, 0.3625574, 0, 0, 0, 1, 1,
0.3479636, -1.317422, 2.448267, 0, 0, 0, 1, 1,
0.350819, 1.355347, 0.2043996, 0, 0, 0, 1, 1,
0.351719, 1.293815, 0.3730882, 0, 0, 0, 1, 1,
0.353097, -1.813131, 2.436553, 0, 0, 0, 1, 1,
0.3558913, -0.6443436, 2.226345, 0, 0, 0, 1, 1,
0.35735, 0.989985, -0.6033827, 0, 0, 0, 1, 1,
0.3683882, -2.172079, 4.426623, 1, 1, 1, 1, 1,
0.3696093, -0.1956077, 2.084935, 1, 1, 1, 1, 1,
0.372381, -0.2078105, 2.78504, 1, 1, 1, 1, 1,
0.373716, -1.728091, 2.415063, 1, 1, 1, 1, 1,
0.3772799, 1.29877, -0.8144311, 1, 1, 1, 1, 1,
0.3818844, 0.1341792, 1.727909, 1, 1, 1, 1, 1,
0.3820781, -0.2588419, 1.66413, 1, 1, 1, 1, 1,
0.382677, 0.1076588, -0.05818581, 1, 1, 1, 1, 1,
0.3844628, 0.6841805, 1.555833, 1, 1, 1, 1, 1,
0.3846364, 0.7371281, 1.335162, 1, 1, 1, 1, 1,
0.3862219, 0.4432095, 1.132312, 1, 1, 1, 1, 1,
0.3874185, -0.879059, 4.025276, 1, 1, 1, 1, 1,
0.38919, 0.6635697, -0.3225666, 1, 1, 1, 1, 1,
0.3922466, -0.5857158, 2.159552, 1, 1, 1, 1, 1,
0.3956402, -1.064767, 3.948715, 1, 1, 1, 1, 1,
0.3975155, -0.9666562, 3.946067, 0, 0, 1, 1, 1,
0.3982539, -0.2502683, 1.951737, 1, 0, 0, 1, 1,
0.3987249, 0.4721998, 1.131421, 1, 0, 0, 1, 1,
0.4049577, -0.05116178, 0.04898227, 1, 0, 0, 1, 1,
0.4061737, 0.9417937, -0.2479694, 1, 0, 0, 1, 1,
0.4073028, -0.9012764, 3.560719, 1, 0, 0, 1, 1,
0.4075047, -0.3337601, 2.533228, 0, 0, 0, 1, 1,
0.4075542, 0.6468346, 1.420728, 0, 0, 0, 1, 1,
0.408105, -0.7415481, 3.308866, 0, 0, 0, 1, 1,
0.4087716, -0.7021657, 3.79393, 0, 0, 0, 1, 1,
0.4105793, -0.3494262, 4.435049, 0, 0, 0, 1, 1,
0.4111595, 0.3948437, 0.4094704, 0, 0, 0, 1, 1,
0.4159091, -0.3295602, 2.824225, 0, 0, 0, 1, 1,
0.4185691, -0.6992504, 3.12733, 1, 1, 1, 1, 1,
0.4321957, 1.342829, 2.974567, 1, 1, 1, 1, 1,
0.4340669, -0.2450769, 2.92711, 1, 1, 1, 1, 1,
0.4387822, -2.253801, 3.25621, 1, 1, 1, 1, 1,
0.439272, 1.272577, 0.9159103, 1, 1, 1, 1, 1,
0.4461721, -1.711075, 2.740804, 1, 1, 1, 1, 1,
0.4472653, 0.5493451, 1.646484, 1, 1, 1, 1, 1,
0.4474649, 1.033441, -0.309065, 1, 1, 1, 1, 1,
0.448612, 0.2493498, 1.555207, 1, 1, 1, 1, 1,
0.4545614, -0.5700579, 2.099123, 1, 1, 1, 1, 1,
0.4547763, -0.3400624, 1.396014, 1, 1, 1, 1, 1,
0.4558123, -0.5028415, 3.197824, 1, 1, 1, 1, 1,
0.45758, 0.2151947, 1.872272, 1, 1, 1, 1, 1,
0.4581221, 0.01641841, 2.73806, 1, 1, 1, 1, 1,
0.4602385, 2.415689, 0.417291, 1, 1, 1, 1, 1,
0.46117, -0.4894532, 2.470996, 0, 0, 1, 1, 1,
0.4661494, 0.3727839, -0.9078851, 1, 0, 0, 1, 1,
0.4683893, 0.9129626, -0.9389531, 1, 0, 0, 1, 1,
0.4712438, -0.65202, 2.958106, 1, 0, 0, 1, 1,
0.4760636, -0.4067089, 0.8474448, 1, 0, 0, 1, 1,
0.4777649, 1.040792, 2.628951, 1, 0, 0, 1, 1,
0.4783156, 2.072577, -0.6522027, 0, 0, 0, 1, 1,
0.4790239, -0.5471289, 3.661822, 0, 0, 0, 1, 1,
0.4795858, -1.198077, 3.786781, 0, 0, 0, 1, 1,
0.4842904, -0.3271049, 3.174367, 0, 0, 0, 1, 1,
0.488587, -0.3436672, 1.613355, 0, 0, 0, 1, 1,
0.4893834, -1.096, 2.097562, 0, 0, 0, 1, 1,
0.4919446, 0.7443067, 1.295215, 0, 0, 0, 1, 1,
0.5005386, 2.579529, 0.5011084, 1, 1, 1, 1, 1,
0.5007503, -0.7023522, 2.556297, 1, 1, 1, 1, 1,
0.5027007, -0.2135943, 0.09929074, 1, 1, 1, 1, 1,
0.5047296, 1.691012, 2.539521, 1, 1, 1, 1, 1,
0.5053321, -0.168473, 1.239967, 1, 1, 1, 1, 1,
0.5066857, 0.1832056, 3.294099, 1, 1, 1, 1, 1,
0.5082481, 1.476694, -0.5876632, 1, 1, 1, 1, 1,
0.511191, 0.6071412, 2.238603, 1, 1, 1, 1, 1,
0.5115188, -0.9374332, 3.193961, 1, 1, 1, 1, 1,
0.5142298, 0.8626198, 1.23549, 1, 1, 1, 1, 1,
0.514983, -1.715593, 3.994372, 1, 1, 1, 1, 1,
0.5170014, -1.302891, 2.358151, 1, 1, 1, 1, 1,
0.5177957, -0.02637817, 1.205364, 1, 1, 1, 1, 1,
0.5214202, -0.285098, 1.947831, 1, 1, 1, 1, 1,
0.5233119, -0.8305133, 2.054088, 1, 1, 1, 1, 1,
0.5238906, -0.907811, 3.160995, 0, 0, 1, 1, 1,
0.5273532, 0.136017, 1.565947, 1, 0, 0, 1, 1,
0.5282984, -0.4986517, 3.475409, 1, 0, 0, 1, 1,
0.5313706, 2.399208, 0.301054, 1, 0, 0, 1, 1,
0.5321649, 0.5346801, 0.7105128, 1, 0, 0, 1, 1,
0.5420788, -1.373878, 3.180841, 1, 0, 0, 1, 1,
0.5447173, 0.8475305, -0.5143199, 0, 0, 0, 1, 1,
0.5447682, -0.6885116, 0.9810814, 0, 0, 0, 1, 1,
0.5512798, 0.9685398, 0.777338, 0, 0, 0, 1, 1,
0.5514702, -0.301517, 2.846643, 0, 0, 0, 1, 1,
0.5520751, -1.058346, 2.729805, 0, 0, 0, 1, 1,
0.5528056, -0.7601721, 2.434489, 0, 0, 0, 1, 1,
0.5548855, 0.1590514, 2.928754, 0, 0, 0, 1, 1,
0.5558966, -1.981348, 3.831145, 1, 1, 1, 1, 1,
0.557293, 0.4962578, 1.399544, 1, 1, 1, 1, 1,
0.5579584, -1.367206, 2.150865, 1, 1, 1, 1, 1,
0.5596513, 0.9739212, 2.655402, 1, 1, 1, 1, 1,
0.5610846, 2.183815, 0.2664933, 1, 1, 1, 1, 1,
0.5655295, -0.3940176, 1.946536, 1, 1, 1, 1, 1,
0.5721968, 0.3668985, 1.14868, 1, 1, 1, 1, 1,
0.5742211, -0.4225252, 2.531818, 1, 1, 1, 1, 1,
0.5836098, -0.5613887, 3.105454, 1, 1, 1, 1, 1,
0.5859265, -0.4705512, 2.574412, 1, 1, 1, 1, 1,
0.5863606, -0.689939, 2.046864, 1, 1, 1, 1, 1,
0.591329, 1.258349, -0.5118991, 1, 1, 1, 1, 1,
0.5914993, 0.7538921, 1.21866, 1, 1, 1, 1, 1,
0.5932186, -0.231364, 2.825376, 1, 1, 1, 1, 1,
0.594433, -1.691295, 1.074669, 1, 1, 1, 1, 1,
0.5976424, 0.6765419, 1.179739, 0, 0, 1, 1, 1,
0.602096, -1.028524, 1.101801, 1, 0, 0, 1, 1,
0.602522, -0.5874617, 1.149189, 1, 0, 0, 1, 1,
0.6028875, -0.8055403, 2.503027, 1, 0, 0, 1, 1,
0.6057517, 0.1842971, 1.020505, 1, 0, 0, 1, 1,
0.60752, -1.233164, 1.059292, 1, 0, 0, 1, 1,
0.6112328, 0.5987386, -0.461191, 0, 0, 0, 1, 1,
0.6190617, -0.9725344, 3.505671, 0, 0, 0, 1, 1,
0.6193178, 2.025346, 1.662152, 0, 0, 0, 1, 1,
0.6271383, 1.329617, -1.037437, 0, 0, 0, 1, 1,
0.6299387, -0.6909134, 1.577311, 0, 0, 0, 1, 1,
0.6336545, 0.7540191, 1.882034, 0, 0, 0, 1, 1,
0.633746, -0.04881183, 3.175226, 0, 0, 0, 1, 1,
0.6351111, -1.477936, 2.077793, 1, 1, 1, 1, 1,
0.6370912, 0.2896796, 0.07693646, 1, 1, 1, 1, 1,
0.6377953, 0.08401671, 0.7436588, 1, 1, 1, 1, 1,
0.639798, -1.270562, 2.445546, 1, 1, 1, 1, 1,
0.6437609, 1.167656, -0.3945352, 1, 1, 1, 1, 1,
0.6470137, -0.9017669, 1.22365, 1, 1, 1, 1, 1,
0.6492521, 0.7275556, 0.3699979, 1, 1, 1, 1, 1,
0.6493869, 1.532818, 1.802612, 1, 1, 1, 1, 1,
0.6568467, 2.307749, -0.8731647, 1, 1, 1, 1, 1,
0.6740823, -0.8816571, 2.214257, 1, 1, 1, 1, 1,
0.6745141, -0.4734552, 1.039021, 1, 1, 1, 1, 1,
0.6775594, 0.7542716, 0.4002809, 1, 1, 1, 1, 1,
0.678651, -1.31967, 4.105264, 1, 1, 1, 1, 1,
0.6826468, -0.4402614, 3.372025, 1, 1, 1, 1, 1,
0.6850402, 1.048483, 0.7468718, 1, 1, 1, 1, 1,
0.6875384, -0.144999, 3.369678, 0, 0, 1, 1, 1,
0.6893524, 0.5814815, 0.3379923, 1, 0, 0, 1, 1,
0.6894533, -1.617406, 4.071589, 1, 0, 0, 1, 1,
0.6896867, -0.8148648, 2.065829, 1, 0, 0, 1, 1,
0.6948363, 2.832503, -1.186407, 1, 0, 0, 1, 1,
0.6979697, -1.44195, 4.107248, 1, 0, 0, 1, 1,
0.6981548, 0.2183698, 2.831827, 0, 0, 0, 1, 1,
0.6982671, 0.1286133, 1.401064, 0, 0, 0, 1, 1,
0.7056028, -0.2925575, 0.9467773, 0, 0, 0, 1, 1,
0.7082024, -0.7357651, 4.204074, 0, 0, 0, 1, 1,
0.7169407, -0.3785523, 2.307315, 0, 0, 0, 1, 1,
0.7215751, -1.118323, 2.521984, 0, 0, 0, 1, 1,
0.7329243, -0.6649961, 3.948263, 0, 0, 0, 1, 1,
0.7350144, 0.09566414, 0.3689555, 1, 1, 1, 1, 1,
0.7358018, 0.8855925, -0.3761575, 1, 1, 1, 1, 1,
0.7440389, 0.957994, 0.6363814, 1, 1, 1, 1, 1,
0.7453792, 0.01378742, 1.166033, 1, 1, 1, 1, 1,
0.7473701, -0.0178893, 3.070825, 1, 1, 1, 1, 1,
0.7510947, 1.217843, 0.2985826, 1, 1, 1, 1, 1,
0.7523102, -0.0760071, -0.05152062, 1, 1, 1, 1, 1,
0.7589338, 0.328542, 1.554955, 1, 1, 1, 1, 1,
0.7599699, -0.1305536, 2.5567, 1, 1, 1, 1, 1,
0.7644017, -2.680066, 2.005497, 1, 1, 1, 1, 1,
0.7791792, 0.3782032, 0.7788517, 1, 1, 1, 1, 1,
0.7801247, -1.696333, 2.485687, 1, 1, 1, 1, 1,
0.7850705, 0.9773166, 0.3158836, 1, 1, 1, 1, 1,
0.8023289, 0.5737708, 0.8219132, 1, 1, 1, 1, 1,
0.8102451, -0.1309638, 2.5738, 1, 1, 1, 1, 1,
0.8103935, -0.5388545, 2.912319, 0, 0, 1, 1, 1,
0.8108726, 0.2413665, 1.078255, 1, 0, 0, 1, 1,
0.816732, -0.07255306, 0.4698229, 1, 0, 0, 1, 1,
0.8256965, -0.8926681, 1.804612, 1, 0, 0, 1, 1,
0.8301148, 1.135819, -0.4011312, 1, 0, 0, 1, 1,
0.8308178, 0.6691313, -0.7182236, 1, 0, 0, 1, 1,
0.8346031, -0.3608204, 3.841084, 0, 0, 0, 1, 1,
0.8361992, 0.9634814, 2.357017, 0, 0, 0, 1, 1,
0.8369206, -0.2496725, 1.553298, 0, 0, 0, 1, 1,
0.8405995, -0.905981, 3.205941, 0, 0, 0, 1, 1,
0.8431863, 2.055286, -0.3148645, 0, 0, 0, 1, 1,
0.8446787, 0.1359182, 1.763884, 0, 0, 0, 1, 1,
0.8453612, -0.7303287, 2.521758, 0, 0, 0, 1, 1,
0.8542415, -1.679854, 0.2137707, 1, 1, 1, 1, 1,
0.8587679, 1.004084, 2.722991, 1, 1, 1, 1, 1,
0.8613884, 0.5014479, 0.1895691, 1, 1, 1, 1, 1,
0.8636218, -0.8298656, 2.08407, 1, 1, 1, 1, 1,
0.865956, -0.2849728, 2.497405, 1, 1, 1, 1, 1,
0.8672071, 0.4210288, 1.811526, 1, 1, 1, 1, 1,
0.8716171, 0.522003, 1.315017, 1, 1, 1, 1, 1,
0.8723092, -0.396086, 1.479915, 1, 1, 1, 1, 1,
0.8723894, -4.157502, 2.90995, 1, 1, 1, 1, 1,
0.8728299, -1.534901, 3.401811, 1, 1, 1, 1, 1,
0.8734231, 1.83339, 2.674703, 1, 1, 1, 1, 1,
0.8794976, 1.500321, 0.6297981, 1, 1, 1, 1, 1,
0.880226, 0.2808812, 0.176113, 1, 1, 1, 1, 1,
0.8841939, 1.26658, 2.437325, 1, 1, 1, 1, 1,
0.8891467, 0.4480782, 1.973924, 1, 1, 1, 1, 1,
0.8892942, -0.5187582, 2.268814, 0, 0, 1, 1, 1,
0.8895772, 0.4884563, 0.281359, 1, 0, 0, 1, 1,
0.8896518, -0.3022535, 3.116214, 1, 0, 0, 1, 1,
0.8919719, -0.1320657, 1.490444, 1, 0, 0, 1, 1,
0.8955915, -0.3844968, 1.086038, 1, 0, 0, 1, 1,
0.9027395, -2.071486, 1.724732, 1, 0, 0, 1, 1,
0.9056544, 0.5437238, 0.6039314, 0, 0, 0, 1, 1,
0.9115403, 0.4180457, 0.4542601, 0, 0, 0, 1, 1,
0.9137682, -0.6560966, 3.685869, 0, 0, 0, 1, 1,
0.9186303, 0.4889786, 0.8896114, 0, 0, 0, 1, 1,
0.9223752, -1.419522, 2.483181, 0, 0, 0, 1, 1,
0.9266717, -0.6636469, 4.02373, 0, 0, 0, 1, 1,
0.929692, 0.4275814, -0.337499, 0, 0, 0, 1, 1,
0.9318401, -1.426288, 2.097409, 1, 1, 1, 1, 1,
0.9346527, 0.4160009, 2.036433, 1, 1, 1, 1, 1,
0.9357656, 0.6185278, 0.04723923, 1, 1, 1, 1, 1,
0.942567, 0.2155884, 0.09882608, 1, 1, 1, 1, 1,
0.9595101, 0.9868245, -0.4136555, 1, 1, 1, 1, 1,
0.9635718, 0.9256962, 1.244119, 1, 1, 1, 1, 1,
0.9701236, -0.0608611, 1.771019, 1, 1, 1, 1, 1,
0.9726696, -0.7767524, 2.327633, 1, 1, 1, 1, 1,
0.9811143, 0.5278051, 1.017004, 1, 1, 1, 1, 1,
0.9865963, -0.1785521, 3.121953, 1, 1, 1, 1, 1,
0.9911735, 2.060018, -2.378408, 1, 1, 1, 1, 1,
0.9914918, -0.8116027, 0.6132886, 1, 1, 1, 1, 1,
0.9938669, 0.6878794, 0.9387287, 1, 1, 1, 1, 1,
1.001371, -0.006362366, 1.745724, 1, 1, 1, 1, 1,
1.002086, -1.247701, 1.777729, 1, 1, 1, 1, 1,
1.006515, -0.822489, 0.4118103, 0, 0, 1, 1, 1,
1.015207, 2.014211, -0.1512183, 1, 0, 0, 1, 1,
1.021978, 1.613983, 1.883042, 1, 0, 0, 1, 1,
1.035403, 0.8898799, -0.4816687, 1, 0, 0, 1, 1,
1.053271, -0.4766273, 2.276191, 1, 0, 0, 1, 1,
1.060096, 0.839548, 1.698837, 1, 0, 0, 1, 1,
1.071351, -0.898731, 2.489752, 0, 0, 0, 1, 1,
1.076493, 1.390416, -0.9731776, 0, 0, 0, 1, 1,
1.078553, -0.089357, 1.619438, 0, 0, 0, 1, 1,
1.083047, -0.4269883, -0.08580362, 0, 0, 0, 1, 1,
1.083258, -0.1552311, 1.909378, 0, 0, 0, 1, 1,
1.098625, -1.194646, 1.239364, 0, 0, 0, 1, 1,
1.105978, 0.6040155, 2.132564, 0, 0, 0, 1, 1,
1.109348, 0.3684941, 0.8861462, 1, 1, 1, 1, 1,
1.117105, 1.196842, 1.129849, 1, 1, 1, 1, 1,
1.118868, -0.2782822, 2.711408, 1, 1, 1, 1, 1,
1.123096, 0.6665198, 1.816924, 1, 1, 1, 1, 1,
1.128102, 0.8450429, -0.006161282, 1, 1, 1, 1, 1,
1.128518, -0.2472278, 1.593602, 1, 1, 1, 1, 1,
1.135119, 0.07778703, 4.444874, 1, 1, 1, 1, 1,
1.1354, 0.9030936, 0.2568807, 1, 1, 1, 1, 1,
1.137619, -0.5760322, 2.111215, 1, 1, 1, 1, 1,
1.138584, -0.08077428, 1.176385, 1, 1, 1, 1, 1,
1.139868, 0.7181107, 1.003396, 1, 1, 1, 1, 1,
1.148685, -0.3263344, 1.496499, 1, 1, 1, 1, 1,
1.155217, 1.227554, 2.449001, 1, 1, 1, 1, 1,
1.162138, 1.030539, -0.06283487, 1, 1, 1, 1, 1,
1.168072, -1.365581, 1.801936, 1, 1, 1, 1, 1,
1.168859, 0.5173758, 2.418461, 0, 0, 1, 1, 1,
1.169678, -0.8206373, 1.354431, 1, 0, 0, 1, 1,
1.174975, 1.153305, 1.840524, 1, 0, 0, 1, 1,
1.180148, 0.629399, 0.2374676, 1, 0, 0, 1, 1,
1.194873, -0.07484225, 1.796582, 1, 0, 0, 1, 1,
1.197791, -0.04550283, 1.398862, 1, 0, 0, 1, 1,
1.200332, 0.1514547, 1.861472, 0, 0, 0, 1, 1,
1.204247, -0.1948051, 0.748796, 0, 0, 0, 1, 1,
1.205216, -1.008624, 0.3662846, 0, 0, 0, 1, 1,
1.205739, -0.2060758, 1.797454, 0, 0, 0, 1, 1,
1.208442, 0.05996474, 2.926752, 0, 0, 0, 1, 1,
1.211351, -1.741616, 1.67044, 0, 0, 0, 1, 1,
1.212662, 0.2607845, 2.794102, 0, 0, 0, 1, 1,
1.214741, -0.6144477, 1.099053, 1, 1, 1, 1, 1,
1.217452, -0.3664511, 2.490915, 1, 1, 1, 1, 1,
1.220709, -0.7581289, 0.6582921, 1, 1, 1, 1, 1,
1.225764, -0.5579832, 2.253317, 1, 1, 1, 1, 1,
1.24999, -0.4552776, 2.063744, 1, 1, 1, 1, 1,
1.251004, -0.6419445, 2.131416, 1, 1, 1, 1, 1,
1.25355, 0.8865138, 3.014694, 1, 1, 1, 1, 1,
1.267788, -0.05611355, 2.71259, 1, 1, 1, 1, 1,
1.269091, -1.145312, 0.6387722, 1, 1, 1, 1, 1,
1.271889, -0.5541745, 2.398217, 1, 1, 1, 1, 1,
1.272353, 0.2889066, 1.877405, 1, 1, 1, 1, 1,
1.273122, 0.6776759, 1.796427, 1, 1, 1, 1, 1,
1.290915, 1.223959, 1.91985, 1, 1, 1, 1, 1,
1.291622, 1.712593, 1.4182, 1, 1, 1, 1, 1,
1.29442, 1.309507, 0.2055352, 1, 1, 1, 1, 1,
1.303645, 0.2621366, 0.8293724, 0, 0, 1, 1, 1,
1.303798, 1.627021, 2.484915, 1, 0, 0, 1, 1,
1.330627, -0.1887211, 2.029629, 1, 0, 0, 1, 1,
1.332242, 0.1644396, 4.245435, 1, 0, 0, 1, 1,
1.339551, -0.1220131, 2.158911, 1, 0, 0, 1, 1,
1.343931, 0.2150165, 0.2503722, 1, 0, 0, 1, 1,
1.350053, 1.000421, 1.534113, 0, 0, 0, 1, 1,
1.35183, -0.07999468, 0.4324748, 0, 0, 0, 1, 1,
1.355748, 0.3013943, 0.6919942, 0, 0, 0, 1, 1,
1.361282, -0.788682, 2.292446, 0, 0, 0, 1, 1,
1.363436, 0.7298683, 2.190163, 0, 0, 0, 1, 1,
1.364176, -0.01920047, 2.046058, 0, 0, 0, 1, 1,
1.36724, -2.208813, 1.721544, 0, 0, 0, 1, 1,
1.381562, 0.9025974, 1.085296, 1, 1, 1, 1, 1,
1.389005, -0.05874313, 1.250658, 1, 1, 1, 1, 1,
1.397735, -1.647222, 1.117275, 1, 1, 1, 1, 1,
1.3979, -0.1070114, 1.985378, 1, 1, 1, 1, 1,
1.400298, -0.8266666, 0.9930243, 1, 1, 1, 1, 1,
1.415012, -0.611538, 1.974357, 1, 1, 1, 1, 1,
1.43093, 0.3011946, 1.490905, 1, 1, 1, 1, 1,
1.43267, 0.8165544, 0.2439779, 1, 1, 1, 1, 1,
1.44187, 1.715544, 1.154531, 1, 1, 1, 1, 1,
1.44408, -0.05527638, 0.2007776, 1, 1, 1, 1, 1,
1.447525, -1.437147, 1.732158, 1, 1, 1, 1, 1,
1.460812, 0.8869835, 0.6687019, 1, 1, 1, 1, 1,
1.472204, -0.0156238, 1.010787, 1, 1, 1, 1, 1,
1.478515, 1.404763, -0.2879626, 1, 1, 1, 1, 1,
1.479565, 1.080185, 1.308789, 1, 1, 1, 1, 1,
1.486703, 0.08526051, 0.657133, 0, 0, 1, 1, 1,
1.490461, -0.8229733, 0.6463735, 1, 0, 0, 1, 1,
1.504783, -0.8463876, 2.401001, 1, 0, 0, 1, 1,
1.521374, -0.4534758, 1.159023, 1, 0, 0, 1, 1,
1.544555, 1.842875, 0.3634391, 1, 0, 0, 1, 1,
1.555896, -0.1081832, 1.166618, 1, 0, 0, 1, 1,
1.564545, 0.7423316, 1.885109, 0, 0, 0, 1, 1,
1.567482, -0.5200889, 1.934968, 0, 0, 0, 1, 1,
1.568211, -0.2848944, 2.806989, 0, 0, 0, 1, 1,
1.602168, 0.258708, 2.173833, 0, 0, 0, 1, 1,
1.603616, 1.343475, 0.2979083, 0, 0, 0, 1, 1,
1.61855, -0.1930335, 1.805638, 0, 0, 0, 1, 1,
1.618832, -0.3607073, 2.319656, 0, 0, 0, 1, 1,
1.622501, 2.82141, 0.3004228, 1, 1, 1, 1, 1,
1.630197, 0.4278944, 0.5752832, 1, 1, 1, 1, 1,
1.6412, -0.8979757, 1.472733, 1, 1, 1, 1, 1,
1.677949, 0.4357238, 1.062385, 1, 1, 1, 1, 1,
1.682495, 1.352569, 1.689938, 1, 1, 1, 1, 1,
1.683863, -0.3976374, 2.124937, 1, 1, 1, 1, 1,
1.687172, -1.073734, 3.067149, 1, 1, 1, 1, 1,
1.697667, 0.5474013, 0.5281302, 1, 1, 1, 1, 1,
1.710536, 0.1505309, 2.665696, 1, 1, 1, 1, 1,
1.711361, 1.070049, 0.9043073, 1, 1, 1, 1, 1,
1.713235, 0.1739671, 1.359824, 1, 1, 1, 1, 1,
1.72411, -0.8815159, 2.012453, 1, 1, 1, 1, 1,
1.746322, 0.9646339, -0.05540148, 1, 1, 1, 1, 1,
1.746642, 0.9835067, 1.507141, 1, 1, 1, 1, 1,
1.750294, -0.5175665, 3.768425, 1, 1, 1, 1, 1,
1.7641, -1.764395, 4.693473, 0, 0, 1, 1, 1,
1.764592, -1.109092, 2.699086, 1, 0, 0, 1, 1,
1.774845, 0.7158023, 0.4124455, 1, 0, 0, 1, 1,
1.788303, 0.5513566, -0.9177269, 1, 0, 0, 1, 1,
1.790197, -0.4527361, 2.546061, 1, 0, 0, 1, 1,
1.790911, -0.4506228, 0.5508711, 1, 0, 0, 1, 1,
1.814553, 0.8657311, 1.213468, 0, 0, 0, 1, 1,
1.81871, -0.5078668, 3.1238, 0, 0, 0, 1, 1,
1.850572, 0.5507419, 1.586374, 0, 0, 0, 1, 1,
1.862503, -1.766044, 2.692801, 0, 0, 0, 1, 1,
1.894116, -0.8938253, 1.767624, 0, 0, 0, 1, 1,
1.905155, 0.5689598, -0.1258391, 0, 0, 0, 1, 1,
1.906198, -0.4683287, 1.066734, 0, 0, 0, 1, 1,
1.923654, 2.212478, -0.4585656, 1, 1, 1, 1, 1,
1.937916, 0.3677313, 1.339288, 1, 1, 1, 1, 1,
1.940873, -1.549479, 2.797307, 1, 1, 1, 1, 1,
1.963179, -1.293075, 1.505752, 1, 1, 1, 1, 1,
1.977207, 0.4946188, -1.27518, 1, 1, 1, 1, 1,
1.997947, -0.05346499, 1.957879, 1, 1, 1, 1, 1,
2.006228, -0.6531979, 1.046584, 1, 1, 1, 1, 1,
2.008445, 0.8728904, 2.364857, 1, 1, 1, 1, 1,
2.029075, -0.9175973, 2.426822, 1, 1, 1, 1, 1,
2.046132, 1.407541, 2.446771, 1, 1, 1, 1, 1,
2.046428, -1.178915, 2.269507, 1, 1, 1, 1, 1,
2.098419, 0.3950582, 1.671451, 1, 1, 1, 1, 1,
2.103076, 2.031807, -1.658557, 1, 1, 1, 1, 1,
2.117807, 0.1919879, 0.3807153, 1, 1, 1, 1, 1,
2.125813, -0.7528944, 3.729665, 1, 1, 1, 1, 1,
2.131014, 0.6407391, 1.621499, 0, 0, 1, 1, 1,
2.148071, -1.669569, 1.947027, 1, 0, 0, 1, 1,
2.149902, 2.480879, 0.9922485, 1, 0, 0, 1, 1,
2.205121, 1.421029, -1.262453, 1, 0, 0, 1, 1,
2.225733, -1.333893, 3.012621, 1, 0, 0, 1, 1,
2.233648, 1.26016, 2.482386, 1, 0, 0, 1, 1,
2.256832, -1.075791, 0.9537398, 0, 0, 0, 1, 1,
2.273673, 1.503601, 0.7985293, 0, 0, 0, 1, 1,
2.282999, -0.0297198, 3.506003, 0, 0, 0, 1, 1,
2.285744, 2.627524, 0.6268161, 0, 0, 0, 1, 1,
2.353052, -0.1646521, 2.227458, 0, 0, 0, 1, 1,
2.356943, -0.02134474, 2.811543, 0, 0, 0, 1, 1,
2.371001, 0.2615353, 1.915234, 0, 0, 0, 1, 1,
2.455762, 0.04215185, 2.440069, 1, 1, 1, 1, 1,
2.67274, -1.005774, 1.473847, 1, 1, 1, 1, 1,
2.684198, 0.6028739, 2.413771, 1, 1, 1, 1, 1,
2.688144, -0.06500537, 2.761149, 1, 1, 1, 1, 1,
2.711193, -0.0539703, 0.2241877, 1, 1, 1, 1, 1,
2.864692, -0.293537, 2.255837, 1, 1, 1, 1, 1,
3.099496, 0.06370763, 2.300803, 1, 1, 1, 1, 1
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
var radius = 9.892835;
var distance = 34.74817;
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
mvMatrix.translate( 0.1331987, 0.4711931, 0.2487876 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.74817);
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
