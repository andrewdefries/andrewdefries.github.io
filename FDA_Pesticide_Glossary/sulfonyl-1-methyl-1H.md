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
-3.156027, -0.3174801, -1.961828, 1, 0, 0, 1,
-2.993017, 0.6426133, -0.3883505, 1, 0.007843138, 0, 1,
-2.952923, 1.454532, -2.632847, 1, 0.01176471, 0, 1,
-2.871247, 0.4398493, -0.1609796, 1, 0.01960784, 0, 1,
-2.819182, 0.3239607, -0.7052885, 1, 0.02352941, 0, 1,
-2.803118, -0.5467433, -0.8466714, 1, 0.03137255, 0, 1,
-2.728206, 0.4039872, -1.096129, 1, 0.03529412, 0, 1,
-2.714089, -0.1332159, -1.422032, 1, 0.04313726, 0, 1,
-2.681108, -0.8912117, -1.396647, 1, 0.04705882, 0, 1,
-2.675159, -0.3329908, -2.858107, 1, 0.05490196, 0, 1,
-2.549871, -2.66213, -4.983389, 1, 0.05882353, 0, 1,
-2.458884, -1.341666, -1.293322, 1, 0.06666667, 0, 1,
-2.429561, 0.7755804, 0.9575524, 1, 0.07058824, 0, 1,
-2.327457, 1.436897, -0.4568521, 1, 0.07843138, 0, 1,
-2.196978, -1.214751, -3.133455, 1, 0.08235294, 0, 1,
-2.113927, 0.4840375, -1.241089, 1, 0.09019608, 0, 1,
-2.112733, 1.28766, -0.2766925, 1, 0.09411765, 0, 1,
-2.097406, 0.02249748, -1.911071, 1, 0.1019608, 0, 1,
-2.074825, -0.626337, -3.488564, 1, 0.1098039, 0, 1,
-2.058173, 0.6626878, -1.482056, 1, 0.1137255, 0, 1,
-2.044071, 1.000254, 1.904292, 1, 0.1215686, 0, 1,
-2.019366, -1.909239, -3.530575, 1, 0.1254902, 0, 1,
-2.013306, -1.147486, -1.463048, 1, 0.1333333, 0, 1,
-2.010028, -1.201781, -1.457494, 1, 0.1372549, 0, 1,
-1.98828, -0.9000567, -1.343469, 1, 0.145098, 0, 1,
-1.980101, -0.2156865, -1.788491, 1, 0.1490196, 0, 1,
-1.96213, -0.135909, -2.903195, 1, 0.1568628, 0, 1,
-1.954564, -1.030707, -1.715191, 1, 0.1607843, 0, 1,
-1.947883, 0.6215919, -3.686292, 1, 0.1686275, 0, 1,
-1.931938, -1.019519, -1.161456, 1, 0.172549, 0, 1,
-1.897552, -2.13389, -3.078549, 1, 0.1803922, 0, 1,
-1.897498, 1.188033, -0.9092242, 1, 0.1843137, 0, 1,
-1.897304, 1.178215, 0.9584916, 1, 0.1921569, 0, 1,
-1.889759, -0.7186814, -1.009787, 1, 0.1960784, 0, 1,
-1.877348, 1.866179, -0.9321352, 1, 0.2039216, 0, 1,
-1.865562, -2.032533, -3.766084, 1, 0.2117647, 0, 1,
-1.8539, -0.460688, -0.9483281, 1, 0.2156863, 0, 1,
-1.826667, -0.7678815, -0.8074717, 1, 0.2235294, 0, 1,
-1.819252, 1.411525, 0.03925549, 1, 0.227451, 0, 1,
-1.802658, 1.534533, -1.841238, 1, 0.2352941, 0, 1,
-1.788526, 0.7307476, -3.279268, 1, 0.2392157, 0, 1,
-1.763386, 1.542222, -1.555892, 1, 0.2470588, 0, 1,
-1.740022, 0.2765321, -0.7506208, 1, 0.2509804, 0, 1,
-1.739384, 0.4082239, -0.66805, 1, 0.2588235, 0, 1,
-1.730266, 0.6420857, -1.641849, 1, 0.2627451, 0, 1,
-1.724839, -0.9581286, -1.953555, 1, 0.2705882, 0, 1,
-1.716002, -1.7336, -3.314746, 1, 0.2745098, 0, 1,
-1.71332, 1.162284, 0.3024369, 1, 0.282353, 0, 1,
-1.707935, -0.629716, -1.406669, 1, 0.2862745, 0, 1,
-1.696654, 1.342824, -1.004113, 1, 0.2941177, 0, 1,
-1.675019, 0.3411855, -1.613687, 1, 0.3019608, 0, 1,
-1.672665, 0.5817976, 0.6941623, 1, 0.3058824, 0, 1,
-1.665955, 0.4311405, -0.9866899, 1, 0.3137255, 0, 1,
-1.663445, -0.4713345, -1.471579, 1, 0.3176471, 0, 1,
-1.658159, 0.3614195, 0.3208452, 1, 0.3254902, 0, 1,
-1.63334, -0.8975128, -2.396855, 1, 0.3294118, 0, 1,
-1.626232, -1.693836, -3.302358, 1, 0.3372549, 0, 1,
-1.617199, -0.9761156, -1.798538, 1, 0.3411765, 0, 1,
-1.61098, 0.8943292, 0.1331645, 1, 0.3490196, 0, 1,
-1.603158, 1.819839, -2.181145, 1, 0.3529412, 0, 1,
-1.597396, 0.5891881, -1.124912, 1, 0.3607843, 0, 1,
-1.590775, -0.5110481, -2.117252, 1, 0.3647059, 0, 1,
-1.579507, 0.1875433, -1.817297, 1, 0.372549, 0, 1,
-1.577271, 0.6550109, -2.797049, 1, 0.3764706, 0, 1,
-1.569454, 1.018046, -2.003016, 1, 0.3843137, 0, 1,
-1.559194, -0.2380784, -2.672171, 1, 0.3882353, 0, 1,
-1.553007, 0.06295332, -0.7194633, 1, 0.3960784, 0, 1,
-1.544018, 0.1089531, -2.008098, 1, 0.4039216, 0, 1,
-1.531041, 0.1693238, -0.3565477, 1, 0.4078431, 0, 1,
-1.513626, -2.360988, -2.624523, 1, 0.4156863, 0, 1,
-1.50962, 1.28856, 1.446235, 1, 0.4196078, 0, 1,
-1.504744, 0.3359785, 0.3252232, 1, 0.427451, 0, 1,
-1.501768, -0.4733937, -0.8208813, 1, 0.4313726, 0, 1,
-1.49511, 0.4371412, -1.454209, 1, 0.4392157, 0, 1,
-1.493337, 2.128853, -0.5790693, 1, 0.4431373, 0, 1,
-1.488307, 0.8878738, -1.905065, 1, 0.4509804, 0, 1,
-1.486781, -0.3914312, -1.656975, 1, 0.454902, 0, 1,
-1.483225, -0.08444996, -1.998776, 1, 0.4627451, 0, 1,
-1.470974, 0.6208733, -0.1194876, 1, 0.4666667, 0, 1,
-1.462478, 1.068036, -0.06104652, 1, 0.4745098, 0, 1,
-1.460581, 0.4203722, -1.572731, 1, 0.4784314, 0, 1,
-1.457062, -2.548891, -2.592526, 1, 0.4862745, 0, 1,
-1.445569, 0.9342133, -2.42615, 1, 0.4901961, 0, 1,
-1.442907, -1.324438, -2.753462, 1, 0.4980392, 0, 1,
-1.439795, 0.6651853, -0.5341397, 1, 0.5058824, 0, 1,
-1.433551, -0.6087862, -2.543468, 1, 0.509804, 0, 1,
-1.416942, -0.3496631, -1.61919, 1, 0.5176471, 0, 1,
-1.416576, -1.387194, -2.160356, 1, 0.5215687, 0, 1,
-1.415386, -0.6232096, -1.941243, 1, 0.5294118, 0, 1,
-1.407711, -1.936398, -2.841092, 1, 0.5333334, 0, 1,
-1.402962, -0.2591625, -2.692419, 1, 0.5411765, 0, 1,
-1.401527, -1.52225, -2.858847, 1, 0.5450981, 0, 1,
-1.396153, -2.569421, -3.391169, 1, 0.5529412, 0, 1,
-1.378758, 0.571523, -0.8607544, 1, 0.5568628, 0, 1,
-1.376856, -1.051413, -1.706727, 1, 0.5647059, 0, 1,
-1.36374, -1.157119, -2.770119, 1, 0.5686275, 0, 1,
-1.356292, -0.6448404, -1.754677, 1, 0.5764706, 0, 1,
-1.348998, -1.463197, -2.500387, 1, 0.5803922, 0, 1,
-1.335268, 0.2633484, -1.473348, 1, 0.5882353, 0, 1,
-1.32818, 0.9468488, -1.739558, 1, 0.5921569, 0, 1,
-1.312412, 0.6746143, -0.6161689, 1, 0.6, 0, 1,
-1.302769, -1.578206, -3.158916, 1, 0.6078432, 0, 1,
-1.3026, 0.4767039, 0.6575906, 1, 0.6117647, 0, 1,
-1.302043, -1.496193, -2.837101, 1, 0.6196079, 0, 1,
-1.295663, -1.763857, -0.9928036, 1, 0.6235294, 0, 1,
-1.285672, 1.277772, -1.167583, 1, 0.6313726, 0, 1,
-1.280259, 0.7294058, -1.321278, 1, 0.6352941, 0, 1,
-1.2754, -1.034932, -2.053716, 1, 0.6431373, 0, 1,
-1.273245, -1.142711, -2.607548, 1, 0.6470588, 0, 1,
-1.267685, -0.4401692, -2.182552, 1, 0.654902, 0, 1,
-1.266711, 1.777316, 0.05683316, 1, 0.6588235, 0, 1,
-1.260921, 0.1958568, -3.438457, 1, 0.6666667, 0, 1,
-1.256743, 0.3739639, -1.854343, 1, 0.6705883, 0, 1,
-1.254274, -0.6242604, -1.336098, 1, 0.6784314, 0, 1,
-1.245265, -1.274705, -3.685986, 1, 0.682353, 0, 1,
-1.22823, 0.3270624, -3.839525, 1, 0.6901961, 0, 1,
-1.227078, 0.5902368, -2.804245, 1, 0.6941177, 0, 1,
-1.226205, 0.3598981, -2.600878, 1, 0.7019608, 0, 1,
-1.222331, -1.385451, -0.6009085, 1, 0.7098039, 0, 1,
-1.217583, -0.04560088, -0.654118, 1, 0.7137255, 0, 1,
-1.215946, 0.564998, -0.6728498, 1, 0.7215686, 0, 1,
-1.215322, 2.697234, -0.3009286, 1, 0.7254902, 0, 1,
-1.207706, 1.243474, -1.179803, 1, 0.7333333, 0, 1,
-1.207378, -0.8534721, -1.372101, 1, 0.7372549, 0, 1,
-1.20574, 1.403126, -2.040812, 1, 0.7450981, 0, 1,
-1.191824, 1.825093, -0.6369848, 1, 0.7490196, 0, 1,
-1.183126, -1.410093, -3.801641, 1, 0.7568628, 0, 1,
-1.182619, -0.09958208, -2.175601, 1, 0.7607843, 0, 1,
-1.180341, -1.064804, -4.208862, 1, 0.7686275, 0, 1,
-1.177864, 0.7445328, -0.5775964, 1, 0.772549, 0, 1,
-1.175355, 0.1388851, -2.833739, 1, 0.7803922, 0, 1,
-1.170952, -0.4636376, -1.581352, 1, 0.7843137, 0, 1,
-1.149957, 0.1756504, -0.2271048, 1, 0.7921569, 0, 1,
-1.146039, 0.3238116, -0.1974081, 1, 0.7960784, 0, 1,
-1.143436, -0.3687188, -1.476293, 1, 0.8039216, 0, 1,
-1.141099, 0.1530943, -1.918512, 1, 0.8117647, 0, 1,
-1.134278, 0.1668241, -2.452446, 1, 0.8156863, 0, 1,
-1.129376, -0.9562393, -2.676121, 1, 0.8235294, 0, 1,
-1.124354, 0.7606462, -0.5896637, 1, 0.827451, 0, 1,
-1.109562, 0.1493462, -1.887714, 1, 0.8352941, 0, 1,
-1.088379, 2.609591, -2.014216, 1, 0.8392157, 0, 1,
-1.076712, -1.512208, -1.597522, 1, 0.8470588, 0, 1,
-1.072953, -0.01111819, -2.279266, 1, 0.8509804, 0, 1,
-1.067841, -1.845091, -3.693009, 1, 0.8588235, 0, 1,
-1.067281, 0.8963404, -2.614256, 1, 0.8627451, 0, 1,
-1.058724, -0.3749973, -3.844839, 1, 0.8705882, 0, 1,
-1.050689, -0.550069, -1.664878, 1, 0.8745098, 0, 1,
-1.04799, 2.160316, 0.09903347, 1, 0.8823529, 0, 1,
-1.046726, -1.566836, -2.87747, 1, 0.8862745, 0, 1,
-1.037556, -0.3416137, -1.128826, 1, 0.8941177, 0, 1,
-1.037547, 0.8802744, -0.7752708, 1, 0.8980392, 0, 1,
-1.035725, 0.4158973, -0.7120133, 1, 0.9058824, 0, 1,
-1.033718, 2.451517, 0.4552433, 1, 0.9137255, 0, 1,
-1.02988, 0.3249249, -2.435745, 1, 0.9176471, 0, 1,
-1.028548, -0.7622367, -2.652148, 1, 0.9254902, 0, 1,
-1.026983, 0.5073022, 0.6178356, 1, 0.9294118, 0, 1,
-1.019364, -0.7001594, -2.277612, 1, 0.9372549, 0, 1,
-1.018591, -1.734076, -2.712907, 1, 0.9411765, 0, 1,
-1.016273, 0.3044646, -1.419478, 1, 0.9490196, 0, 1,
-1.016041, -0.7218976, -1.786942, 1, 0.9529412, 0, 1,
-1.012699, 1.035418, -2.019913, 1, 0.9607843, 0, 1,
-1.001842, 0.0651518, -1.353863, 1, 0.9647059, 0, 1,
-0.9998177, -0.5539579, -1.774963, 1, 0.972549, 0, 1,
-0.996564, -1.489014, -0.8716959, 1, 0.9764706, 0, 1,
-0.9937611, 0.7015181, 0.09451378, 1, 0.9843137, 0, 1,
-0.9933451, -0.556698, -1.861186, 1, 0.9882353, 0, 1,
-0.9914162, 0.3295428, -1.358138, 1, 0.9960784, 0, 1,
-0.9887666, -0.1059925, -1.378017, 0.9960784, 1, 0, 1,
-0.9858258, -0.267117, -1.560728, 0.9921569, 1, 0, 1,
-0.9802064, 0.3097513, 0.05843772, 0.9843137, 1, 0, 1,
-0.9776117, -0.6148539, -2.561442, 0.9803922, 1, 0, 1,
-0.9769884, -0.7929682, -1.341425, 0.972549, 1, 0, 1,
-0.9738173, -0.8455768, -1.797166, 0.9686275, 1, 0, 1,
-0.9737545, 0.002330488, -1.669304, 0.9607843, 1, 0, 1,
-0.9710175, -0.5589889, -1.955153, 0.9568627, 1, 0, 1,
-0.9700629, -0.6397671, -1.571665, 0.9490196, 1, 0, 1,
-0.9647582, 0.40559, -0.3374252, 0.945098, 1, 0, 1,
-0.9591862, 1.609568, 1.903344, 0.9372549, 1, 0, 1,
-0.956848, 0.4431592, -1.963973, 0.9333333, 1, 0, 1,
-0.9535404, 0.6146102, -0.700214, 0.9254902, 1, 0, 1,
-0.9405418, 0.520804, -1.302503, 0.9215686, 1, 0, 1,
-0.9392573, -0.5079352, -2.503172, 0.9137255, 1, 0, 1,
-0.9350001, 0.3041175, -2.652714, 0.9098039, 1, 0, 1,
-0.9338599, 0.9247298, -0.6631327, 0.9019608, 1, 0, 1,
-0.9284434, -0.5596446, -2.262103, 0.8941177, 1, 0, 1,
-0.9230979, -0.3832766, -2.468541, 0.8901961, 1, 0, 1,
-0.917842, -0.5699036, -1.346506, 0.8823529, 1, 0, 1,
-0.9140892, -0.6701992, -1.339474, 0.8784314, 1, 0, 1,
-0.9124855, -0.1966785, -1.805151, 0.8705882, 1, 0, 1,
-0.9102718, -1.194272, -4.064238, 0.8666667, 1, 0, 1,
-0.9090539, -3.106911, -3.203229, 0.8588235, 1, 0, 1,
-0.9084063, -0.6181322, -0.4518368, 0.854902, 1, 0, 1,
-0.9042704, -1.072049, -3.181145, 0.8470588, 1, 0, 1,
-0.9003108, 0.03823929, -1.657042, 0.8431373, 1, 0, 1,
-0.8996936, -1.500361, -2.244545, 0.8352941, 1, 0, 1,
-0.8983843, -1.611116, -1.98809, 0.8313726, 1, 0, 1,
-0.8874763, 0.01567475, -3.089734, 0.8235294, 1, 0, 1,
-0.8863213, 0.5832857, -0.4432109, 0.8196079, 1, 0, 1,
-0.8768016, -0.5872377, -3.457615, 0.8117647, 1, 0, 1,
-0.8765511, -0.3031696, -2.533511, 0.8078431, 1, 0, 1,
-0.861686, -0.6374153, -1.913533, 0.8, 1, 0, 1,
-0.8511215, 0.9429104, -1.457582, 0.7921569, 1, 0, 1,
-0.8478838, 1.455501, -0.0463796, 0.7882353, 1, 0, 1,
-0.8471336, -0.1374954, -2.612739, 0.7803922, 1, 0, 1,
-0.8429175, 0.944626, -2.521784, 0.7764706, 1, 0, 1,
-0.8391759, 0.5284066, -0.642895, 0.7686275, 1, 0, 1,
-0.8363248, 0.4896862, -2.158364, 0.7647059, 1, 0, 1,
-0.8325238, -1.321049, -2.644842, 0.7568628, 1, 0, 1,
-0.8319981, 0.09482222, -3.1242, 0.7529412, 1, 0, 1,
-0.8317382, -0.420246, -0.6290178, 0.7450981, 1, 0, 1,
-0.8214781, 0.2084713, -0.9861665, 0.7411765, 1, 0, 1,
-0.8198054, 0.1907698, -1.932998, 0.7333333, 1, 0, 1,
-0.8140764, -0.465407, 0.2230106, 0.7294118, 1, 0, 1,
-0.8121101, -0.4779168, -2.581274, 0.7215686, 1, 0, 1,
-0.8119047, 0.9490058, -1.846943, 0.7176471, 1, 0, 1,
-0.8104554, -0.7199715, -1.891613, 0.7098039, 1, 0, 1,
-0.8100198, -1.319782, -2.752856, 0.7058824, 1, 0, 1,
-0.8010067, 0.7793092, -0.3122283, 0.6980392, 1, 0, 1,
-0.7999192, -0.908322, -1.268735, 0.6901961, 1, 0, 1,
-0.7984967, -0.6960698, -1.743422, 0.6862745, 1, 0, 1,
-0.7982165, -0.2621378, -0.6323333, 0.6784314, 1, 0, 1,
-0.7956628, 2.859742, -0.7094473, 0.6745098, 1, 0, 1,
-0.793685, -1.193258, -0.8625426, 0.6666667, 1, 0, 1,
-0.7920571, -0.8153582, -1.29036, 0.6627451, 1, 0, 1,
-0.789826, -2.124679, -1.644469, 0.654902, 1, 0, 1,
-0.7882872, 0.9762689, -1.831269, 0.6509804, 1, 0, 1,
-0.7809182, -1.03502, -2.190445, 0.6431373, 1, 0, 1,
-0.7713764, -1.762319, -3.961844, 0.6392157, 1, 0, 1,
-0.7703313, -0.5490136, -2.276847, 0.6313726, 1, 0, 1,
-0.77018, -1.067626, -2.787403, 0.627451, 1, 0, 1,
-0.7698829, -0.924202, -1.291745, 0.6196079, 1, 0, 1,
-0.7689348, -0.1751904, -1.925009, 0.6156863, 1, 0, 1,
-0.7587372, -1.936129, -2.453379, 0.6078432, 1, 0, 1,
-0.7469082, -0.1559659, -0.6940799, 0.6039216, 1, 0, 1,
-0.7466879, 0.8204442, -0.1278507, 0.5960785, 1, 0, 1,
-0.7437158, -1.613749, -2.791874, 0.5882353, 1, 0, 1,
-0.7419658, 0.7628274, 0.8008239, 0.5843138, 1, 0, 1,
-0.73643, -0.9974905, -4.467827, 0.5764706, 1, 0, 1,
-0.7351271, 1.811777, -2.575531, 0.572549, 1, 0, 1,
-0.7333989, 0.6136858, -0.967274, 0.5647059, 1, 0, 1,
-0.7326456, 0.1813464, -0.926221, 0.5607843, 1, 0, 1,
-0.731221, -3.14945, -4.244906, 0.5529412, 1, 0, 1,
-0.730124, -0.5981823, -2.453908, 0.5490196, 1, 0, 1,
-0.7279635, 2.447633, 1.95782, 0.5411765, 1, 0, 1,
-0.7271539, 1.75834, 0.7060792, 0.5372549, 1, 0, 1,
-0.7235928, -0.4079345, -2.217974, 0.5294118, 1, 0, 1,
-0.7178357, -0.8156883, -2.33596, 0.5254902, 1, 0, 1,
-0.7114186, -0.6237714, -3.700939, 0.5176471, 1, 0, 1,
-0.7047979, -1.325066, -3.996978, 0.5137255, 1, 0, 1,
-0.703864, -0.6357076, -2.649089, 0.5058824, 1, 0, 1,
-0.7023538, 0.2941785, -0.9003571, 0.5019608, 1, 0, 1,
-0.7022066, -0.714567, -0.8873538, 0.4941176, 1, 0, 1,
-0.7014872, -1.946131, -3.490838, 0.4862745, 1, 0, 1,
-0.6987812, -0.5986016, -2.251367, 0.4823529, 1, 0, 1,
-0.694925, -0.7277369, -0.7769174, 0.4745098, 1, 0, 1,
-0.6932186, -1.704688, -4.316332, 0.4705882, 1, 0, 1,
-0.6910513, -0.1826894, -1.70929, 0.4627451, 1, 0, 1,
-0.6753148, -0.4381398, -2.879368, 0.4588235, 1, 0, 1,
-0.673767, 0.1076592, -2.418304, 0.4509804, 1, 0, 1,
-0.6665372, -0.8457839, -2.935337, 0.4470588, 1, 0, 1,
-0.663852, 0.9778802, -0.06291854, 0.4392157, 1, 0, 1,
-0.6542701, -0.09915943, -2.987873, 0.4352941, 1, 0, 1,
-0.647323, 0.9872798, -0.5202421, 0.427451, 1, 0, 1,
-0.6440428, -0.2791104, -1.424631, 0.4235294, 1, 0, 1,
-0.6399372, 1.460185, -0.8604642, 0.4156863, 1, 0, 1,
-0.6341917, -1.316753, -1.079062, 0.4117647, 1, 0, 1,
-0.6330566, 0.1905888, -2.332936, 0.4039216, 1, 0, 1,
-0.6304637, -0.2484154, -1.081666, 0.3960784, 1, 0, 1,
-0.6271963, 0.454358, 0.9122949, 0.3921569, 1, 0, 1,
-0.6263486, -0.3644646, -1.368993, 0.3843137, 1, 0, 1,
-0.6124771, 0.1729848, -2.317549, 0.3803922, 1, 0, 1,
-0.6072578, -0.4200362, -0.6581523, 0.372549, 1, 0, 1,
-0.607098, 0.4234551, 0.3466602, 0.3686275, 1, 0, 1,
-0.6020503, -0.4133832, -2.040993, 0.3607843, 1, 0, 1,
-0.6009434, 0.3117391, -1.976063, 0.3568628, 1, 0, 1,
-0.5948846, 0.2770854, -0.589341, 0.3490196, 1, 0, 1,
-0.579303, -1.821222, -4.928582, 0.345098, 1, 0, 1,
-0.5675024, 1.151078, -1.253523, 0.3372549, 1, 0, 1,
-0.5594665, -1.357855, -1.827146, 0.3333333, 1, 0, 1,
-0.555903, 1.205184, -0.5173092, 0.3254902, 1, 0, 1,
-0.5557393, 0.1583975, -1.646958, 0.3215686, 1, 0, 1,
-0.553238, 1.455179, -0.3244693, 0.3137255, 1, 0, 1,
-0.5529615, 2.018289, 1.430931, 0.3098039, 1, 0, 1,
-0.5501237, -0.494476, -2.437193, 0.3019608, 1, 0, 1,
-0.5494055, 0.01639416, -0.2828862, 0.2941177, 1, 0, 1,
-0.5461933, -0.223989, -0.2999478, 0.2901961, 1, 0, 1,
-0.5424973, -0.5632719, -1.013838, 0.282353, 1, 0, 1,
-0.5419312, 1.200523, -0.9472866, 0.2784314, 1, 0, 1,
-0.5416374, -0.8535074, -1.446376, 0.2705882, 1, 0, 1,
-0.5372039, -0.9636762, -2.68554, 0.2666667, 1, 0, 1,
-0.5368478, -0.8248614, -2.055489, 0.2588235, 1, 0, 1,
-0.5267662, -0.7262165, -2.994867, 0.254902, 1, 0, 1,
-0.5240828, 0.07789642, -1.645019, 0.2470588, 1, 0, 1,
-0.5221538, -0.9093636, -2.49, 0.2431373, 1, 0, 1,
-0.5209403, -0.5888627, -1.555139, 0.2352941, 1, 0, 1,
-0.5173307, -0.6839881, -2.513254, 0.2313726, 1, 0, 1,
-0.5154396, -1.016783, -3.811685, 0.2235294, 1, 0, 1,
-0.5115204, 0.7580446, -0.7967981, 0.2196078, 1, 0, 1,
-0.5109552, 1.049146, 0.1398348, 0.2117647, 1, 0, 1,
-0.5062891, 0.5970094, -1.902453, 0.2078431, 1, 0, 1,
-0.503709, 2.172026, -0.2852939, 0.2, 1, 0, 1,
-0.5024725, -1.541098, -2.106604, 0.1921569, 1, 0, 1,
-0.5024688, -1.903952, -3.278522, 0.1882353, 1, 0, 1,
-0.501118, -0.1638066, -1.108288, 0.1803922, 1, 0, 1,
-0.4935394, -0.7889106, -3.668512, 0.1764706, 1, 0, 1,
-0.4858318, 0.5340194, -2.483816, 0.1686275, 1, 0, 1,
-0.4743843, 0.7537647, 0.02394756, 0.1647059, 1, 0, 1,
-0.4701163, 0.6990077, -0.5700335, 0.1568628, 1, 0, 1,
-0.4690301, -0.9963304, -3.166726, 0.1529412, 1, 0, 1,
-0.4640726, 0.8760774, -1.136685, 0.145098, 1, 0, 1,
-0.4610555, 0.003573901, -1.759195, 0.1411765, 1, 0, 1,
-0.4608088, -1.030736, -2.721092, 0.1333333, 1, 0, 1,
-0.4579608, -1.731467, -3.168237, 0.1294118, 1, 0, 1,
-0.4579445, -1.486749, -3.21541, 0.1215686, 1, 0, 1,
-0.455221, 0.699506, -1.391389, 0.1176471, 1, 0, 1,
-0.454814, 0.8591632, -0.7200455, 0.1098039, 1, 0, 1,
-0.451011, 1.084522, -1.266656, 0.1058824, 1, 0, 1,
-0.4500581, 0.5040734, 0.5061271, 0.09803922, 1, 0, 1,
-0.4462858, -1.03367, -2.553385, 0.09019608, 1, 0, 1,
-0.437553, 0.2712297, -0.374617, 0.08627451, 1, 0, 1,
-0.431369, 0.7150158, 1.902113, 0.07843138, 1, 0, 1,
-0.4297177, 1.205483, 0.3150967, 0.07450981, 1, 0, 1,
-0.4296663, -0.0953343, -0.9388206, 0.06666667, 1, 0, 1,
-0.428076, 1.374195, -0.640978, 0.0627451, 1, 0, 1,
-0.4276284, -0.3877217, -1.738862, 0.05490196, 1, 0, 1,
-0.4262511, 0.3599025, -0.4324665, 0.05098039, 1, 0, 1,
-0.4242308, -0.8431191, -3.943881, 0.04313726, 1, 0, 1,
-0.4230584, 0.06106121, -3.175446, 0.03921569, 1, 0, 1,
-0.4207673, -1.179695, -3.581932, 0.03137255, 1, 0, 1,
-0.420193, 0.8958194, -1.642713, 0.02745098, 1, 0, 1,
-0.4175306, -0.2114559, -2.285637, 0.01960784, 1, 0, 1,
-0.4151063, -0.9399983, -3.160369, 0.01568628, 1, 0, 1,
-0.412315, -0.0275884, -2.188187, 0.007843138, 1, 0, 1,
-0.4122885, -0.2998092, -3.727467, 0.003921569, 1, 0, 1,
-0.4118921, -1.67295, -1.180601, 0, 1, 0.003921569, 1,
-0.4036423, 0.1326867, 0.1565542, 0, 1, 0.01176471, 1,
-0.4020839, -0.9064311, -2.21812, 0, 1, 0.01568628, 1,
-0.3989542, -1.080049, -1.640065, 0, 1, 0.02352941, 1,
-0.3908602, -0.1291098, -0.5765067, 0, 1, 0.02745098, 1,
-0.3861157, -1.385625, -2.177345, 0, 1, 0.03529412, 1,
-0.382602, 0.9608701, -0.7147012, 0, 1, 0.03921569, 1,
-0.371781, -0.4501009, -3.582096, 0, 1, 0.04705882, 1,
-0.3678834, 0.135552, -0.9564766, 0, 1, 0.05098039, 1,
-0.3667967, -1.335524, -3.187423, 0, 1, 0.05882353, 1,
-0.3646793, 0.3569805, 0.427233, 0, 1, 0.0627451, 1,
-0.3589802, 0.09473527, -1.203511, 0, 1, 0.07058824, 1,
-0.35706, 0.9465316, -0.1949553, 0, 1, 0.07450981, 1,
-0.3549545, -0.7171142, -2.374474, 0, 1, 0.08235294, 1,
-0.3513411, 1.435295, -1.096549, 0, 1, 0.08627451, 1,
-0.3452735, 0.2567652, 0.02670195, 0, 1, 0.09411765, 1,
-0.3419741, -0.08659727, -0.3529339, 0, 1, 0.1019608, 1,
-0.340228, 1.479809, 1.456495, 0, 1, 0.1058824, 1,
-0.3379227, -1.193914, -4.688527, 0, 1, 0.1137255, 1,
-0.3377074, 1.325217, -0.6493517, 0, 1, 0.1176471, 1,
-0.336451, -0.7109987, -2.378715, 0, 1, 0.1254902, 1,
-0.3360939, 0.7087218, 0.06269915, 0, 1, 0.1294118, 1,
-0.3337415, 1.090153, -0.5776885, 0, 1, 0.1372549, 1,
-0.3329203, -0.7842624, -2.527897, 0, 1, 0.1411765, 1,
-0.3328198, 2.968301, 0.06278278, 0, 1, 0.1490196, 1,
-0.33197, -0.1182181, -4.142745, 0, 1, 0.1529412, 1,
-0.3285622, -0.8521276, -3.429748, 0, 1, 0.1607843, 1,
-0.3257666, -0.1478992, 0.0006959125, 0, 1, 0.1647059, 1,
-0.3249856, 0.4267291, 0.9053328, 0, 1, 0.172549, 1,
-0.3249524, -0.3784001, -2.627364, 0, 1, 0.1764706, 1,
-0.317545, -0.6069638, -2.379395, 0, 1, 0.1843137, 1,
-0.3172698, -0.06579014, -2.008557, 0, 1, 0.1882353, 1,
-0.3151877, 0.5298515, 0.3081861, 0, 1, 0.1960784, 1,
-0.311986, -0.8215198, -3.386177, 0, 1, 0.2039216, 1,
-0.3114578, 0.8600844, 0.1143257, 0, 1, 0.2078431, 1,
-0.3093907, -3.066952, -4.167733, 0, 1, 0.2156863, 1,
-0.3075503, -3.115291, -4.162991, 0, 1, 0.2196078, 1,
-0.3067058, 1.054624, -0.1251296, 0, 1, 0.227451, 1,
-0.3050589, 1.639957, -1.230108, 0, 1, 0.2313726, 1,
-0.3050413, 0.1199017, -3.039413, 0, 1, 0.2392157, 1,
-0.3030361, 0.7756461, -1.096657, 0, 1, 0.2431373, 1,
-0.3029981, -0.02137374, -1.03233, 0, 1, 0.2509804, 1,
-0.3013131, -0.3468242, -1.639917, 0, 1, 0.254902, 1,
-0.300898, -0.5036427, -3.623041, 0, 1, 0.2627451, 1,
-0.3002933, 1.014838, -1.674831, 0, 1, 0.2666667, 1,
-0.2972562, -0.4179657, -5.210109, 0, 1, 0.2745098, 1,
-0.2932132, 0.9163528, 0.7271413, 0, 1, 0.2784314, 1,
-0.2895227, 0.786243, 0.3831684, 0, 1, 0.2862745, 1,
-0.2844973, 1.215925, -1.828583, 0, 1, 0.2901961, 1,
-0.2820882, 1.521653, -0.835026, 0, 1, 0.2980392, 1,
-0.2808284, 1.367589, 0.3492247, 0, 1, 0.3058824, 1,
-0.2800213, 2.918337, -0.4707459, 0, 1, 0.3098039, 1,
-0.2791833, -0.8264731, -3.650935, 0, 1, 0.3176471, 1,
-0.2747161, -0.5901471, -1.713866, 0, 1, 0.3215686, 1,
-0.2742392, -0.7424563, -3.427639, 0, 1, 0.3294118, 1,
-0.268112, 1.440769, 1.414678, 0, 1, 0.3333333, 1,
-0.2648666, -0.725996, -4.560445, 0, 1, 0.3411765, 1,
-0.262752, 0.851896, -1.315313, 0, 1, 0.345098, 1,
-0.2598454, 0.8592906, -0.07958961, 0, 1, 0.3529412, 1,
-0.2572988, 1.758413, -0.8013106, 0, 1, 0.3568628, 1,
-0.254913, 1.371751, -1.818474, 0, 1, 0.3647059, 1,
-0.254238, 0.2280341, -1.488427, 0, 1, 0.3686275, 1,
-0.2511472, -0.6640502, -3.867276, 0, 1, 0.3764706, 1,
-0.2476761, 1.146528, 0.03417617, 0, 1, 0.3803922, 1,
-0.2430391, 1.512364, -2.766562, 0, 1, 0.3882353, 1,
-0.2426787, 1.222133, 0.494187, 0, 1, 0.3921569, 1,
-0.2426561, -0.5383779, -2.351156, 0, 1, 0.4, 1,
-0.2409849, 0.4110316, -1.797151, 0, 1, 0.4078431, 1,
-0.2254549, -0.3390943, -4.023849, 0, 1, 0.4117647, 1,
-0.2221169, -0.5396622, -2.58963, 0, 1, 0.4196078, 1,
-0.2209088, -1.058133, -3.661973, 0, 1, 0.4235294, 1,
-0.2195253, 0.4051463, -0.5999532, 0, 1, 0.4313726, 1,
-0.2157516, 0.8142762, 0.6066185, 0, 1, 0.4352941, 1,
-0.2132226, 0.4630707, -1.240638, 0, 1, 0.4431373, 1,
-0.2096972, -0.3446283, -1.647049, 0, 1, 0.4470588, 1,
-0.197192, 0.4272295, -0.8751497, 0, 1, 0.454902, 1,
-0.1946983, -0.8458423, -1.973387, 0, 1, 0.4588235, 1,
-0.1943775, 0.5418057, -1.362852, 0, 1, 0.4666667, 1,
-0.1919041, -0.008974387, -1.128615, 0, 1, 0.4705882, 1,
-0.1782759, -0.8163465, -1.599764, 0, 1, 0.4784314, 1,
-0.1781939, 0.3174154, 1.349754, 0, 1, 0.4823529, 1,
-0.1747163, -0.09747743, -1.149657, 0, 1, 0.4901961, 1,
-0.1722008, -0.499559, -2.973876, 0, 1, 0.4941176, 1,
-0.1705359, 0.09234193, -1.84452, 0, 1, 0.5019608, 1,
-0.1687246, -0.3995958, -4.040779, 0, 1, 0.509804, 1,
-0.1684305, 2.144946, 0.3256827, 0, 1, 0.5137255, 1,
-0.1661088, -0.8796153, -3.188273, 0, 1, 0.5215687, 1,
-0.1613665, 0.687602, 0.987767, 0, 1, 0.5254902, 1,
-0.1565033, 1.225579, 1.463794, 0, 1, 0.5333334, 1,
-0.1558759, -0.556495, -4.36601, 0, 1, 0.5372549, 1,
-0.1550431, 0.2111385, -0.3970961, 0, 1, 0.5450981, 1,
-0.1545669, -0.9037274, -2.960603, 0, 1, 0.5490196, 1,
-0.1543701, -1.814725, -1.487967, 0, 1, 0.5568628, 1,
-0.1510859, -2.598559, -3.576715, 0, 1, 0.5607843, 1,
-0.1477146, 0.2676684, -0.5705097, 0, 1, 0.5686275, 1,
-0.1473565, -0.05069323, -1.672369, 0, 1, 0.572549, 1,
-0.1429581, -1.546143, -3.765582, 0, 1, 0.5803922, 1,
-0.139532, -0.2256881, -2.674182, 0, 1, 0.5843138, 1,
-0.136548, -0.5626698, -2.115502, 0, 1, 0.5921569, 1,
-0.135411, -0.4997782, -4.213802, 0, 1, 0.5960785, 1,
-0.1346577, 0.557695, 0.2148011, 0, 1, 0.6039216, 1,
-0.133613, 1.003319, -0.3029253, 0, 1, 0.6117647, 1,
-0.1332247, -0.7092202, -1.742525, 0, 1, 0.6156863, 1,
-0.1261194, -1.896062, -1.75411, 0, 1, 0.6235294, 1,
-0.1245751, -0.5166743, -3.039957, 0, 1, 0.627451, 1,
-0.1227368, 1.555025, -0.8408574, 0, 1, 0.6352941, 1,
-0.1207233, 0.07011444, -1.056856, 0, 1, 0.6392157, 1,
-0.1169366, 0.8839153, -0.6327567, 0, 1, 0.6470588, 1,
-0.1139199, 1.693973, -0.2027957, 0, 1, 0.6509804, 1,
-0.1137907, -0.5934178, -4.298066, 0, 1, 0.6588235, 1,
-0.1122255, 1.669159, -0.7828827, 0, 1, 0.6627451, 1,
-0.1087712, -1.240172, -3.751604, 0, 1, 0.6705883, 1,
-0.1035096, -0.5578677, -4.195166, 0, 1, 0.6745098, 1,
-0.1030721, -0.468516, -1.913593, 0, 1, 0.682353, 1,
-0.09962544, -1.157488, -2.993448, 0, 1, 0.6862745, 1,
-0.09903031, 0.1393797, -1.841431, 0, 1, 0.6941177, 1,
-0.0926916, 0.4518999, -1.378324, 0, 1, 0.7019608, 1,
-0.09216394, -0.942108, -2.842793, 0, 1, 0.7058824, 1,
-0.09170096, -0.5767052, -4.543385, 0, 1, 0.7137255, 1,
-0.0900577, -0.1264604, -2.862788, 0, 1, 0.7176471, 1,
-0.08739271, 0.03645908, -1.203173, 0, 1, 0.7254902, 1,
-0.06842369, -0.8782621, -2.739572, 0, 1, 0.7294118, 1,
-0.05601597, -0.539407, -2.591767, 0, 1, 0.7372549, 1,
-0.05540139, 0.03425877, 0.8498284, 0, 1, 0.7411765, 1,
-0.05297556, -0.8911697, -5.918938, 0, 1, 0.7490196, 1,
-0.05074374, 1.817369, 0.5703178, 0, 1, 0.7529412, 1,
-0.05028196, 0.7759218, -1.059063, 0, 1, 0.7607843, 1,
-0.04710434, 1.761888, 0.5812858, 0, 1, 0.7647059, 1,
-0.04327231, -0.6631114, -4.090584, 0, 1, 0.772549, 1,
-0.04227854, 1.397902, -0.9997957, 0, 1, 0.7764706, 1,
-0.03990983, -1.895916, -3.063354, 0, 1, 0.7843137, 1,
-0.03838942, 0.8233082, -0.7002934, 0, 1, 0.7882353, 1,
-0.03710261, 1.88182, 0.8539936, 0, 1, 0.7960784, 1,
-0.03592839, 0.8204184, -0.05523882, 0, 1, 0.8039216, 1,
-0.03234057, -0.2062026, -2.441773, 0, 1, 0.8078431, 1,
-0.03087624, 0.2673359, 1.537268, 0, 1, 0.8156863, 1,
-0.02982918, 0.2585946, 0.9563659, 0, 1, 0.8196079, 1,
-0.02441328, 0.3008529, 1.483741, 0, 1, 0.827451, 1,
-0.008187199, -0.1593534, -3.280821, 0, 1, 0.8313726, 1,
-0.00593225, -0.6897458, -2.640385, 0, 1, 0.8392157, 1,
-0.005150423, -0.4305321, -3.467658, 0, 1, 0.8431373, 1,
-0.004932823, 0.2354356, 0.910375, 0, 1, 0.8509804, 1,
-0.002927669, -1.144847, -6.287507, 0, 1, 0.854902, 1,
0.001999712, -1.619587, 5.293732, 0, 1, 0.8627451, 1,
0.003026646, 0.6801662, 0.1618233, 0, 1, 0.8666667, 1,
0.004858689, 0.8257529, -0.5754086, 0, 1, 0.8745098, 1,
0.005662768, -1.536916, 1.537869, 0, 1, 0.8784314, 1,
0.007756206, 0.5374381, -1.896233, 0, 1, 0.8862745, 1,
0.009211755, 0.4681752, -0.3474208, 0, 1, 0.8901961, 1,
0.01003235, 0.05000556, -2.317233, 0, 1, 0.8980392, 1,
0.01299203, -0.7638512, 4.126869, 0, 1, 0.9058824, 1,
0.01362536, -0.5735837, 2.710407, 0, 1, 0.9098039, 1,
0.01656137, -0.1865473, 2.043712, 0, 1, 0.9176471, 1,
0.01720634, 2.778286, -1.212686, 0, 1, 0.9215686, 1,
0.0186547, -0.3436196, 2.338801, 0, 1, 0.9294118, 1,
0.01953785, -0.4087946, 4.760249, 0, 1, 0.9333333, 1,
0.02086329, 0.1598493, 0.8797453, 0, 1, 0.9411765, 1,
0.02204973, -0.4574451, 3.700447, 0, 1, 0.945098, 1,
0.02493224, -1.455336, 2.948245, 0, 1, 0.9529412, 1,
0.02646063, -1.507585, 3.246879, 0, 1, 0.9568627, 1,
0.0295077, -0.05563497, 1.773757, 0, 1, 0.9647059, 1,
0.03051446, -0.4572938, 3.457174, 0, 1, 0.9686275, 1,
0.0340068, 2.14888, 0.04099142, 0, 1, 0.9764706, 1,
0.03510201, 0.1243955, 1.051666, 0, 1, 0.9803922, 1,
0.03565853, 1.489528, -0.06931158, 0, 1, 0.9882353, 1,
0.03648383, 0.9218062, -0.6723088, 0, 1, 0.9921569, 1,
0.03933817, 0.2465766, 0.5611026, 0, 1, 1, 1,
0.03962729, -0.3974178, 2.857873, 0, 0.9921569, 1, 1,
0.04205197, 0.08456629, 1.315837, 0, 0.9882353, 1, 1,
0.04570032, 1.953909, 2.023403, 0, 0.9803922, 1, 1,
0.04839727, -0.4059585, 2.809142, 0, 0.9764706, 1, 1,
0.05248743, -0.6365813, 1.246051, 0, 0.9686275, 1, 1,
0.0551483, -0.5362538, 3.800347, 0, 0.9647059, 1, 1,
0.05623232, 0.9951255, -0.6708251, 0, 0.9568627, 1, 1,
0.05912191, -0.4569605, 4.311499, 0, 0.9529412, 1, 1,
0.05950018, 1.581352, -0.7575268, 0, 0.945098, 1, 1,
0.06511706, 0.3316583, 0.4017103, 0, 0.9411765, 1, 1,
0.06798088, -1.012694, 1.21832, 0, 0.9333333, 1, 1,
0.07286578, 1.30795, -1.717173, 0, 0.9294118, 1, 1,
0.07320585, 0.2568049, 0.1883321, 0, 0.9215686, 1, 1,
0.07829242, 1.186345, -0.03682836, 0, 0.9176471, 1, 1,
0.08762913, 1.262585, 0.7582055, 0, 0.9098039, 1, 1,
0.08766945, -0.5728589, 3.005474, 0, 0.9058824, 1, 1,
0.09546372, -1.91996, 2.939038, 0, 0.8980392, 1, 1,
0.09628687, 0.3595753, -0.6607006, 0, 0.8901961, 1, 1,
0.1035993, 0.6058668, -0.3386038, 0, 0.8862745, 1, 1,
0.1045022, 0.2394902, 0.4679912, 0, 0.8784314, 1, 1,
0.1048467, -0.01945819, 2.608816, 0, 0.8745098, 1, 1,
0.1052368, 1.432761, -0.09555588, 0, 0.8666667, 1, 1,
0.1052856, -0.2827628, 3.358582, 0, 0.8627451, 1, 1,
0.1155501, 1.313088, 1.104757, 0, 0.854902, 1, 1,
0.1195671, -0.2755713, 2.502213, 0, 0.8509804, 1, 1,
0.1228549, -0.8023272, 2.204688, 0, 0.8431373, 1, 1,
0.1234535, -0.08871081, 2.983799, 0, 0.8392157, 1, 1,
0.1248656, -0.6530106, 3.212076, 0, 0.8313726, 1, 1,
0.1281814, -0.2079752, 1.054279, 0, 0.827451, 1, 1,
0.1358578, -1.271852, 3.263967, 0, 0.8196079, 1, 1,
0.1409446, 1.698757, 0.7820457, 0, 0.8156863, 1, 1,
0.1458973, 0.5232962, 0.3765461, 0, 0.8078431, 1, 1,
0.1481868, 1.219919, -1.621804, 0, 0.8039216, 1, 1,
0.154439, 0.6011559, -1.140619, 0, 0.7960784, 1, 1,
0.1597856, -0.2774876, 1.145005, 0, 0.7882353, 1, 1,
0.160505, 0.9507095, -0.7200868, 0, 0.7843137, 1, 1,
0.1617451, -1.294953, 3.197299, 0, 0.7764706, 1, 1,
0.1623792, -0.8883989, 1.952408, 0, 0.772549, 1, 1,
0.1640909, -0.004478083, 3.025769, 0, 0.7647059, 1, 1,
0.1670573, 0.6112615, -0.368042, 0, 0.7607843, 1, 1,
0.1672011, -0.01805625, 1.018875, 0, 0.7529412, 1, 1,
0.1776203, -1.068186, 3.556115, 0, 0.7490196, 1, 1,
0.181315, 0.4905749, -0.2335014, 0, 0.7411765, 1, 1,
0.1864857, 0.03152012, 1.077669, 0, 0.7372549, 1, 1,
0.1869545, -2.077996, 2.720999, 0, 0.7294118, 1, 1,
0.18842, 0.09844159, 0.801918, 0, 0.7254902, 1, 1,
0.1931303, -1.439765, 2.953537, 0, 0.7176471, 1, 1,
0.1943217, 0.0005150096, 1.557094, 0, 0.7137255, 1, 1,
0.19697, 0.8321542, -0.2626474, 0, 0.7058824, 1, 1,
0.1995538, 0.0710972, 0.6729749, 0, 0.6980392, 1, 1,
0.2044694, 0.1575231, 0.3847062, 0, 0.6941177, 1, 1,
0.2048298, -0.4293117, 3.716094, 0, 0.6862745, 1, 1,
0.2061559, -0.3949238, 2.345757, 0, 0.682353, 1, 1,
0.20636, 0.01389132, 3.178158, 0, 0.6745098, 1, 1,
0.2102039, 1.243616, -1.263325, 0, 0.6705883, 1, 1,
0.2152511, 0.8477251, 1.008944, 0, 0.6627451, 1, 1,
0.2166191, -0.2555793, -0.04113372, 0, 0.6588235, 1, 1,
0.2193184, 0.8487477, -0.5518529, 0, 0.6509804, 1, 1,
0.2196057, 0.4564294, 0.8293772, 0, 0.6470588, 1, 1,
0.2211542, 0.768469, 0.4032954, 0, 0.6392157, 1, 1,
0.2226024, 1.428791, -0.02353857, 0, 0.6352941, 1, 1,
0.2241708, -0.2221038, 4.072187, 0, 0.627451, 1, 1,
0.2312068, -1.02234, 3.958934, 0, 0.6235294, 1, 1,
0.2325099, 0.4265935, -0.5209787, 0, 0.6156863, 1, 1,
0.2351961, -1.151784, 3.175466, 0, 0.6117647, 1, 1,
0.2362842, -2.007348, 2.797291, 0, 0.6039216, 1, 1,
0.2363652, 0.726462, 0.4598095, 0, 0.5960785, 1, 1,
0.2433337, -0.2521285, 1.469785, 0, 0.5921569, 1, 1,
0.2466754, -0.0785766, 1.786729, 0, 0.5843138, 1, 1,
0.2492284, 0.2768505, 2.541756, 0, 0.5803922, 1, 1,
0.2494911, 1.263142, 0.5473457, 0, 0.572549, 1, 1,
0.2506481, -0.167602, 2.220737, 0, 0.5686275, 1, 1,
0.2515211, 0.7829601, 0.129354, 0, 0.5607843, 1, 1,
0.251747, -0.3533427, 2.413485, 0, 0.5568628, 1, 1,
0.2519669, 0.5669425, 1.880451, 0, 0.5490196, 1, 1,
0.2523873, -0.2602884, 5.170815, 0, 0.5450981, 1, 1,
0.2526366, -0.2652324, 2.060202, 0, 0.5372549, 1, 1,
0.2679257, -1.681933, 3.666877, 0, 0.5333334, 1, 1,
0.2695078, 1.49945, -1.000346, 0, 0.5254902, 1, 1,
0.2763436, -2.512688, 3.933223, 0, 0.5215687, 1, 1,
0.2791716, 0.3159451, 0.9697917, 0, 0.5137255, 1, 1,
0.279218, -0.2556879, 1.45418, 0, 0.509804, 1, 1,
0.2796057, 0.4469385, 1.427942, 0, 0.5019608, 1, 1,
0.2810003, -1.060726, 3.57396, 0, 0.4941176, 1, 1,
0.2871733, -1.646616, 4.217674, 0, 0.4901961, 1, 1,
0.2880595, -0.01449593, 0.3401545, 0, 0.4823529, 1, 1,
0.288457, -0.5443997, 4.042373, 0, 0.4784314, 1, 1,
0.2968659, 0.3818496, 0.4145321, 0, 0.4705882, 1, 1,
0.3018527, -0.06690721, 1.84552, 0, 0.4666667, 1, 1,
0.3163462, -0.7885492, 2.435979, 0, 0.4588235, 1, 1,
0.3183638, 0.107577, 1.824522, 0, 0.454902, 1, 1,
0.3209012, -0.6870278, 4.423172, 0, 0.4470588, 1, 1,
0.320942, -1.509395, 2.971048, 0, 0.4431373, 1, 1,
0.321246, -0.3853205, 1.301287, 0, 0.4352941, 1, 1,
0.322151, 0.5884101, 1.316876, 0, 0.4313726, 1, 1,
0.3237964, -1.08468, 3.645371, 0, 0.4235294, 1, 1,
0.3310019, -1.291723, 3.307349, 0, 0.4196078, 1, 1,
0.3313643, 0.9684566, 0.5829743, 0, 0.4117647, 1, 1,
0.3343208, -1.160778, 2.915197, 0, 0.4078431, 1, 1,
0.3347975, 0.5827088, -0.05582371, 0, 0.4, 1, 1,
0.3409739, -3.708327, 2.655005, 0, 0.3921569, 1, 1,
0.3423592, 1.785524, -2.7146, 0, 0.3882353, 1, 1,
0.3440075, -1.310626, 2.413127, 0, 0.3803922, 1, 1,
0.344152, -0.9709637, 2.095437, 0, 0.3764706, 1, 1,
0.3482121, 0.04365391, 0.7146767, 0, 0.3686275, 1, 1,
0.3500982, -1.127667, 3.72313, 0, 0.3647059, 1, 1,
0.3506036, -0.2194042, 1.996472, 0, 0.3568628, 1, 1,
0.3519413, -1.425289, 3.432542, 0, 0.3529412, 1, 1,
0.352088, 0.1323831, 2.803689, 0, 0.345098, 1, 1,
0.3599138, -0.3636312, 1.448739, 0, 0.3411765, 1, 1,
0.3610108, -1.203565, 3.514419, 0, 0.3333333, 1, 1,
0.3618609, -0.5448089, 2.540357, 0, 0.3294118, 1, 1,
0.362411, -0.5323566, 2.994727, 0, 0.3215686, 1, 1,
0.3652512, 2.632618, -0.6737617, 0, 0.3176471, 1, 1,
0.3673211, -0.6898001, 2.944784, 0, 0.3098039, 1, 1,
0.36847, -0.8900357, 3.800025, 0, 0.3058824, 1, 1,
0.3691844, 0.6582323, 0.7853315, 0, 0.2980392, 1, 1,
0.3713545, 0.7893371, -1.520077, 0, 0.2901961, 1, 1,
0.372083, -0.4467418, 4.131532, 0, 0.2862745, 1, 1,
0.3726761, 0.6003529, 1.091252, 0, 0.2784314, 1, 1,
0.3737122, 0.795612, 1.783007, 0, 0.2745098, 1, 1,
0.377923, 0.6680183, 0.2106413, 0, 0.2666667, 1, 1,
0.3810065, -0.9096299, 3.929698, 0, 0.2627451, 1, 1,
0.383807, -0.0172606, 1.20306, 0, 0.254902, 1, 1,
0.3866647, 0.08068421, 1.118271, 0, 0.2509804, 1, 1,
0.386906, 1.007768, 1.320132, 0, 0.2431373, 1, 1,
0.388782, 1.441509, -0.6988993, 0, 0.2392157, 1, 1,
0.3893903, -0.6760761, 2.476102, 0, 0.2313726, 1, 1,
0.3897513, -0.7108949, 3.545075, 0, 0.227451, 1, 1,
0.3912206, 0.1118146, 3.032546, 0, 0.2196078, 1, 1,
0.3964333, 1.011342, 0.9507226, 0, 0.2156863, 1, 1,
0.399736, 0.8572472, -0.1238742, 0, 0.2078431, 1, 1,
0.4001505, -1.3505, 2.724537, 0, 0.2039216, 1, 1,
0.4010682, -0.7032264, 2.46771, 0, 0.1960784, 1, 1,
0.4023793, 1.52603, 0.06273358, 0, 0.1882353, 1, 1,
0.4110243, 1.286451, 1.218638, 0, 0.1843137, 1, 1,
0.4132114, 0.1299807, 3.182788, 0, 0.1764706, 1, 1,
0.416645, 1.075196, 0.9326026, 0, 0.172549, 1, 1,
0.418079, -0.1281933, 2.647492, 0, 0.1647059, 1, 1,
0.4184166, -0.9705315, 3.280039, 0, 0.1607843, 1, 1,
0.4199993, 0.3754037, 2.885621, 0, 0.1529412, 1, 1,
0.4205471, -0.477795, 1.380618, 0, 0.1490196, 1, 1,
0.4242338, -0.4838378, 2.727072, 0, 0.1411765, 1, 1,
0.427173, -1.19145, 3.776202, 0, 0.1372549, 1, 1,
0.4271835, -0.3030777, 2.950506, 0, 0.1294118, 1, 1,
0.4298101, -0.5698594, 2.294356, 0, 0.1254902, 1, 1,
0.4432091, -0.418816, 1.927704, 0, 0.1176471, 1, 1,
0.4464504, 0.6382593, 0.7778866, 0, 0.1137255, 1, 1,
0.450212, -2.209512, 5.565071, 0, 0.1058824, 1, 1,
0.4502597, -0.05249479, 1.42054, 0, 0.09803922, 1, 1,
0.452357, -0.6505299, 2.293123, 0, 0.09411765, 1, 1,
0.4601313, -0.5277119, 1.580285, 0, 0.08627451, 1, 1,
0.4620557, 0.08981236, -0.4712141, 0, 0.08235294, 1, 1,
0.4648094, -0.578236, 2.515146, 0, 0.07450981, 1, 1,
0.465646, 0.7184931, 0.2141276, 0, 0.07058824, 1, 1,
0.468162, -0.07682891, 2.078526, 0, 0.0627451, 1, 1,
0.4695608, -0.7802343, 4.319163, 0, 0.05882353, 1, 1,
0.4729084, 0.6674751, 2.00912, 0, 0.05098039, 1, 1,
0.4735465, 1.512343, 0.07369113, 0, 0.04705882, 1, 1,
0.4761247, 8.398654e-05, 3.538591, 0, 0.03921569, 1, 1,
0.4773445, 0.155243, 0.08855498, 0, 0.03529412, 1, 1,
0.4779554, 0.5114306, 1.70479, 0, 0.02745098, 1, 1,
0.4783842, 1.843823, 1.383679, 0, 0.02352941, 1, 1,
0.4793209, -0.3210308, 1.541175, 0, 0.01568628, 1, 1,
0.4795104, 0.248061, 1.414291, 0, 0.01176471, 1, 1,
0.4811468, -0.2680216, 1.458638, 0, 0.003921569, 1, 1,
0.4852388, 2.09987, -0.68533, 0.003921569, 0, 1, 1,
0.4886037, 0.9646297, -1.886811, 0.007843138, 0, 1, 1,
0.488809, -1.622009, 1.731198, 0.01568628, 0, 1, 1,
0.4913223, -0.01187411, 0.9779755, 0.01960784, 0, 1, 1,
0.492012, 0.2516234, 0.2689737, 0.02745098, 0, 1, 1,
0.4992033, -0.2633536, 1.27559, 0.03137255, 0, 1, 1,
0.5001038, 1.168385, 0.1783408, 0.03921569, 0, 1, 1,
0.5011193, 0.4074928, 1.875299, 0.04313726, 0, 1, 1,
0.5025945, 0.1312633, 0.7309046, 0.05098039, 0, 1, 1,
0.5119743, -0.9247825, 2.235874, 0.05490196, 0, 1, 1,
0.5121017, -0.3606986, 3.021224, 0.0627451, 0, 1, 1,
0.5151404, 2.372306, -0.00248929, 0.06666667, 0, 1, 1,
0.5157841, -1.31512, 1.285863, 0.07450981, 0, 1, 1,
0.5189272, -1.03837, 1.630028, 0.07843138, 0, 1, 1,
0.52214, 0.1356554, 1.963668, 0.08627451, 0, 1, 1,
0.5235935, -0.1468984, 3.280947, 0.09019608, 0, 1, 1,
0.5283513, -0.2020729, 2.348745, 0.09803922, 0, 1, 1,
0.5311123, 0.4026236, -0.3154435, 0.1058824, 0, 1, 1,
0.5363341, -0.5667669, 2.78461, 0.1098039, 0, 1, 1,
0.5401051, 0.6233377, 0.02579277, 0.1176471, 0, 1, 1,
0.5439676, -0.2664867, 2.828389, 0.1215686, 0, 1, 1,
0.5443704, 0.03548277, 1.243981, 0.1294118, 0, 1, 1,
0.5471883, 0.2135483, 2.676702, 0.1333333, 0, 1, 1,
0.5477123, 1.462326, 0.2142188, 0.1411765, 0, 1, 1,
0.5496001, -0.2189023, 2.708013, 0.145098, 0, 1, 1,
0.5519962, 1.223237, 0.3162641, 0.1529412, 0, 1, 1,
0.5529886, -1.181637, 4.299721, 0.1568628, 0, 1, 1,
0.5566604, 0.09755173, 0.9072925, 0.1647059, 0, 1, 1,
0.5583992, -0.6137313, 2.633766, 0.1686275, 0, 1, 1,
0.5635471, 1.481351, 0.6084743, 0.1764706, 0, 1, 1,
0.5641827, 0.3194508, 0.2228472, 0.1803922, 0, 1, 1,
0.5665816, -0.1917759, 2.901845, 0.1882353, 0, 1, 1,
0.5685556, 1.488464, -0.2425635, 0.1921569, 0, 1, 1,
0.5689086, 1.119845, -1.241062, 0.2, 0, 1, 1,
0.5718427, 0.2149111, 1.387553, 0.2078431, 0, 1, 1,
0.5721707, 0.2615033, 1.332692, 0.2117647, 0, 1, 1,
0.5728875, 0.5053443, -0.8280824, 0.2196078, 0, 1, 1,
0.5742807, -0.6615741, 3.378226, 0.2235294, 0, 1, 1,
0.5762702, 0.2765687, 1.314312, 0.2313726, 0, 1, 1,
0.5783744, 0.1808378, 2.047968, 0.2352941, 0, 1, 1,
0.5798218, 1.045195, -0.6635918, 0.2431373, 0, 1, 1,
0.5803056, 1.120086, -0.1615286, 0.2470588, 0, 1, 1,
0.5830454, 0.7313073, -0.4017047, 0.254902, 0, 1, 1,
0.5840954, 1.330075, -0.8848781, 0.2588235, 0, 1, 1,
0.5870093, -0.5410937, 1.682524, 0.2666667, 0, 1, 1,
0.592357, 0.3120188, 0.3367248, 0.2705882, 0, 1, 1,
0.5930043, 0.6749537, 1.593359, 0.2784314, 0, 1, 1,
0.6002284, -0.6324521, 1.659717, 0.282353, 0, 1, 1,
0.6003443, -1.205118, 3.025813, 0.2901961, 0, 1, 1,
0.6092212, 0.3136753, 2.317802, 0.2941177, 0, 1, 1,
0.6096414, 0.9464689, 0.5894483, 0.3019608, 0, 1, 1,
0.6151404, -0.7676884, 3.274702, 0.3098039, 0, 1, 1,
0.6151981, -0.4473861, 1.722363, 0.3137255, 0, 1, 1,
0.6184015, -0.6954164, 3.042078, 0.3215686, 0, 1, 1,
0.6371016, 0.2252351, 1.32869, 0.3254902, 0, 1, 1,
0.6374666, 2.046106, -0.002183845, 0.3333333, 0, 1, 1,
0.6383202, 0.04091619, 1.159455, 0.3372549, 0, 1, 1,
0.6415851, 0.9697122, 0.4977355, 0.345098, 0, 1, 1,
0.6416546, 0.7298279, 2.243261, 0.3490196, 0, 1, 1,
0.642662, -0.6410973, 1.486539, 0.3568628, 0, 1, 1,
0.6432158, -0.7339821, 1.271952, 0.3607843, 0, 1, 1,
0.649838, 1.44216, 0.5204221, 0.3686275, 0, 1, 1,
0.6504381, -0.7356117, 3.212428, 0.372549, 0, 1, 1,
0.65084, 1.427594, 0.8506247, 0.3803922, 0, 1, 1,
0.6535193, 1.3924, 1.087868, 0.3843137, 0, 1, 1,
0.6553188, -3.303179, 5.751441, 0.3921569, 0, 1, 1,
0.6571476, 0.8803312, 0.2563387, 0.3960784, 0, 1, 1,
0.6605546, 1.059039, 0.5166007, 0.4039216, 0, 1, 1,
0.6647066, 0.7485169, 0.8758073, 0.4117647, 0, 1, 1,
0.671818, -0.3484068, 1.486522, 0.4156863, 0, 1, 1,
0.6846144, -0.4072506, 4.444639, 0.4235294, 0, 1, 1,
0.691466, 0.730042, -0.1547644, 0.427451, 0, 1, 1,
0.69474, 1.538737, -1.324949, 0.4352941, 0, 1, 1,
0.6994396, 0.6055164, 0.4515221, 0.4392157, 0, 1, 1,
0.7004608, 1.956995, 0.2366148, 0.4470588, 0, 1, 1,
0.7008575, 0.2031881, 2.372098, 0.4509804, 0, 1, 1,
0.7009655, 1.017364, 0.7808356, 0.4588235, 0, 1, 1,
0.7032506, 0.6703849, -0.3204911, 0.4627451, 0, 1, 1,
0.7052026, 0.8249524, -0.7845262, 0.4705882, 0, 1, 1,
0.7054133, -1.876646, 4.228043, 0.4745098, 0, 1, 1,
0.7092139, -0.1843128, 3.092741, 0.4823529, 0, 1, 1,
0.7109796, 0.586075, 1.352902, 0.4862745, 0, 1, 1,
0.7137673, 1.67066, 0.195124, 0.4941176, 0, 1, 1,
0.714738, -0.5511864, 1.561491, 0.5019608, 0, 1, 1,
0.7222915, 0.3531609, 1.770744, 0.5058824, 0, 1, 1,
0.7304993, 0.02275017, 1.64912, 0.5137255, 0, 1, 1,
0.7339764, 0.2624894, 0.5189664, 0.5176471, 0, 1, 1,
0.7340614, 0.5175663, 1.566239, 0.5254902, 0, 1, 1,
0.7357744, -0.3106459, 1.21236, 0.5294118, 0, 1, 1,
0.739151, -1.729106, 3.209283, 0.5372549, 0, 1, 1,
0.7417109, -1.569111, 4.696998, 0.5411765, 0, 1, 1,
0.7423418, 0.8455738, 0.8311887, 0.5490196, 0, 1, 1,
0.7428724, 1.012927, 0.8054375, 0.5529412, 0, 1, 1,
0.7464993, 0.3792654, 2.196505, 0.5607843, 0, 1, 1,
0.7513359, 1.372486, -1.11912, 0.5647059, 0, 1, 1,
0.7537447, 1.0449, -0.3526646, 0.572549, 0, 1, 1,
0.7550594, -0.8169171, 3.672178, 0.5764706, 0, 1, 1,
0.755513, 0.4850197, 0.5238234, 0.5843138, 0, 1, 1,
0.7599173, -0.9469628, 2.46297, 0.5882353, 0, 1, 1,
0.7658187, 0.3135291, 3.147795, 0.5960785, 0, 1, 1,
0.7664617, 0.4086176, -0.8100327, 0.6039216, 0, 1, 1,
0.7720151, 1.788972, 0.06830517, 0.6078432, 0, 1, 1,
0.7770062, 0.7717334, 0.03805119, 0.6156863, 0, 1, 1,
0.7778281, -0.1942026, 1.907766, 0.6196079, 0, 1, 1,
0.7778333, -0.849783, 3.104902, 0.627451, 0, 1, 1,
0.7845422, 0.3496243, 1.978586, 0.6313726, 0, 1, 1,
0.7861579, -0.2387211, 1.991906, 0.6392157, 0, 1, 1,
0.787138, -0.8145354, 2.591005, 0.6431373, 0, 1, 1,
0.7896715, 0.9635361, 0.3544515, 0.6509804, 0, 1, 1,
0.792821, 0.3097675, 1.046859, 0.654902, 0, 1, 1,
0.7943234, -0.1487932, 1.994444, 0.6627451, 0, 1, 1,
0.7945933, -0.3742807, 1.807873, 0.6666667, 0, 1, 1,
0.7960349, 0.3542471, 1.01952, 0.6745098, 0, 1, 1,
0.797007, -1.647107, 2.798907, 0.6784314, 0, 1, 1,
0.7989521, 0.8391162, 2.136247, 0.6862745, 0, 1, 1,
0.8002377, -0.7771213, 3.675396, 0.6901961, 0, 1, 1,
0.803752, -0.8755768, 3.288177, 0.6980392, 0, 1, 1,
0.8111341, 0.5605535, 2.70535, 0.7058824, 0, 1, 1,
0.8131166, 0.349357, 1.575179, 0.7098039, 0, 1, 1,
0.8147146, -0.5728323, 1.873044, 0.7176471, 0, 1, 1,
0.8180798, 0.1061375, 2.908149, 0.7215686, 0, 1, 1,
0.8227051, -0.6201762, 1.061737, 0.7294118, 0, 1, 1,
0.8246076, 1.017424, 1.043173, 0.7333333, 0, 1, 1,
0.8296716, -1.458629, 2.685115, 0.7411765, 0, 1, 1,
0.8356899, -0.3760659, 1.556728, 0.7450981, 0, 1, 1,
0.8366031, -1.474028, 4.557437, 0.7529412, 0, 1, 1,
0.8379173, -1.414613, 3.015898, 0.7568628, 0, 1, 1,
0.8492939, 0.2081559, 2.013789, 0.7647059, 0, 1, 1,
0.851763, 0.4008723, 0.4727184, 0.7686275, 0, 1, 1,
0.8523774, -2.008512, 3.659256, 0.7764706, 0, 1, 1,
0.8532229, -0.9653678, 1.22233, 0.7803922, 0, 1, 1,
0.8634624, -0.535616, 3.354613, 0.7882353, 0, 1, 1,
0.8641423, -0.2625394, 2.11003, 0.7921569, 0, 1, 1,
0.8644815, 0.4375543, 1.269077, 0.8, 0, 1, 1,
0.8656914, -0.8970338, 1.723183, 0.8078431, 0, 1, 1,
0.8739539, -0.8653774, 2.865062, 0.8117647, 0, 1, 1,
0.8784559, 0.3868365, 1.424819, 0.8196079, 0, 1, 1,
0.8809026, 0.9500912, 0.2514817, 0.8235294, 0, 1, 1,
0.8848917, -0.4650682, 1.649139, 0.8313726, 0, 1, 1,
0.8874715, -0.6850673, 0.6157686, 0.8352941, 0, 1, 1,
0.8886934, -0.2158594, 1.669634, 0.8431373, 0, 1, 1,
0.8992167, -0.119738, 0.9012363, 0.8470588, 0, 1, 1,
0.9075674, -0.5140598, 1.290357, 0.854902, 0, 1, 1,
0.9084039, -0.1155217, 1.640737, 0.8588235, 0, 1, 1,
0.9093887, -0.08188917, 1.573989, 0.8666667, 0, 1, 1,
0.9122606, -0.2755445, 0.5413151, 0.8705882, 0, 1, 1,
0.9177774, -0.01070299, 2.592458, 0.8784314, 0, 1, 1,
0.9181299, 0.001120423, 4.126825, 0.8823529, 0, 1, 1,
0.923269, -1.028431, 3.507146, 0.8901961, 0, 1, 1,
0.9294183, 0.2092256, 1.204219, 0.8941177, 0, 1, 1,
0.9508636, 0.5809944, 1.264898, 0.9019608, 0, 1, 1,
0.9531822, 0.05395364, 1.040898, 0.9098039, 0, 1, 1,
0.9583004, -0.4730029, 3.277652, 0.9137255, 0, 1, 1,
0.9638413, -2.238451, 2.032406, 0.9215686, 0, 1, 1,
0.9654858, -2.162396, 2.670166, 0.9254902, 0, 1, 1,
0.9670265, 1.177864, 2.378728, 0.9333333, 0, 1, 1,
0.967652, -0.6263368, 1.406403, 0.9372549, 0, 1, 1,
0.9690993, -0.1856431, 2.024205, 0.945098, 0, 1, 1,
0.9731761, -0.993097, 2.837606, 0.9490196, 0, 1, 1,
0.9741024, -0.7367668, 3.567083, 0.9568627, 0, 1, 1,
0.9758205, -1.327299, 4.514136, 0.9607843, 0, 1, 1,
0.9765345, 2.26992, 1.862895, 0.9686275, 0, 1, 1,
0.9813911, 1.566517, 0.4869606, 0.972549, 0, 1, 1,
0.984621, -0.3607076, 1.288383, 0.9803922, 0, 1, 1,
0.9934659, 0.4818907, -0.2300585, 0.9843137, 0, 1, 1,
0.9964647, 0.03640136, 1.653291, 0.9921569, 0, 1, 1,
0.9974657, -2.211611, 2.80957, 0.9960784, 0, 1, 1,
1.00215, -1.324566, 3.176688, 1, 0, 0.9960784, 1,
1.005878, 0.7070985, 1.795102, 1, 0, 0.9882353, 1,
1.005957, 1.304406, 0.9544061, 1, 0, 0.9843137, 1,
1.006992, -1.003182, 3.062029, 1, 0, 0.9764706, 1,
1.008368, 2.004423, -0.08314551, 1, 0, 0.972549, 1,
1.00916, 0.9361101, 0.03927706, 1, 0, 0.9647059, 1,
1.009685, 2.002363, 2.184626, 1, 0, 0.9607843, 1,
1.015842, -0.6257481, 2.160546, 1, 0, 0.9529412, 1,
1.024039, 0.5692461, 0.500712, 1, 0, 0.9490196, 1,
1.029296, -0.2863157, 1.743693, 1, 0, 0.9411765, 1,
1.030461, -0.294918, 2.306856, 1, 0, 0.9372549, 1,
1.036756, -0.7750541, 1.984674, 1, 0, 0.9294118, 1,
1.038144, 1.286902, 0.7737817, 1, 0, 0.9254902, 1,
1.040375, 0.6376391, 0.06456921, 1, 0, 0.9176471, 1,
1.041077, -1.365241, 1.548725, 1, 0, 0.9137255, 1,
1.04376, -0.6699914, 1.6512, 1, 0, 0.9058824, 1,
1.047438, -0.03318163, 1.061548, 1, 0, 0.9019608, 1,
1.048404, 1.096522, -0.04200728, 1, 0, 0.8941177, 1,
1.05013, -1.065186, 2.657771, 1, 0, 0.8862745, 1,
1.050559, -0.1787444, 3.07161, 1, 0, 0.8823529, 1,
1.053792, 0.1048065, 2.4627, 1, 0, 0.8745098, 1,
1.069284, -0.2285543, 2.938797, 1, 0, 0.8705882, 1,
1.069353, -0.6928207, 1.741651, 1, 0, 0.8627451, 1,
1.074056, 0.3102401, 0.7972511, 1, 0, 0.8588235, 1,
1.089666, 0.8725256, 2.137038, 1, 0, 0.8509804, 1,
1.095755, 1.224047, 1.995276, 1, 0, 0.8470588, 1,
1.096953, -1.200905, 1.906036, 1, 0, 0.8392157, 1,
1.106396, 0.8027081, 1.281791, 1, 0, 0.8352941, 1,
1.1072, -1.656054, 2.711883, 1, 0, 0.827451, 1,
1.112918, 0.5526142, 1.185668, 1, 0, 0.8235294, 1,
1.11525, -1.042971, 0.8739287, 1, 0, 0.8156863, 1,
1.125319, 0.1201916, 2.002586, 1, 0, 0.8117647, 1,
1.133573, -1.381543, 0.8638518, 1, 0, 0.8039216, 1,
1.135267, 1.778937, -0.1481486, 1, 0, 0.7960784, 1,
1.152689, 0.4910905, -1.638475, 1, 0, 0.7921569, 1,
1.158397, 0.3919454, 1.833002, 1, 0, 0.7843137, 1,
1.158552, -1.379207, 1.659966, 1, 0, 0.7803922, 1,
1.160558, -0.4402066, 2.120967, 1, 0, 0.772549, 1,
1.173306, -0.01272914, 0.752365, 1, 0, 0.7686275, 1,
1.176352, -2.099607, 2.801101, 1, 0, 0.7607843, 1,
1.177188, 2.234073, 0.6351666, 1, 0, 0.7568628, 1,
1.190933, -1.079936, 1.188466, 1, 0, 0.7490196, 1,
1.196907, -0.7882994, 1.023161, 1, 0, 0.7450981, 1,
1.199707, -0.3801705, 2.803695, 1, 0, 0.7372549, 1,
1.203797, 0.8498853, -0.1685682, 1, 0, 0.7333333, 1,
1.211506, 1.384725, 1.111011, 1, 0, 0.7254902, 1,
1.214126, 1.789294, 0.3039307, 1, 0, 0.7215686, 1,
1.220987, -0.8195943, 2.356481, 1, 0, 0.7137255, 1,
1.223852, 0.119475, 1.35159, 1, 0, 0.7098039, 1,
1.22634, -1.678557, 2.872881, 1, 0, 0.7019608, 1,
1.233858, -0.2126298, 3.631024, 1, 0, 0.6941177, 1,
1.244865, -0.9694405, 3.877669, 1, 0, 0.6901961, 1,
1.249035, -0.2084743, 0.4937201, 1, 0, 0.682353, 1,
1.253337, 1.033183, 1.834596, 1, 0, 0.6784314, 1,
1.253671, 0.5883834, -0.2906779, 1, 0, 0.6705883, 1,
1.269398, 0.09035157, 2.75507, 1, 0, 0.6666667, 1,
1.269714, -0.1158627, 1.863453, 1, 0, 0.6588235, 1,
1.277203, -0.1027249, 0.8390957, 1, 0, 0.654902, 1,
1.278957, -0.05447551, 0.3162228, 1, 0, 0.6470588, 1,
1.281059, -2.158935, 1.57799, 1, 0, 0.6431373, 1,
1.287414, -1.357011, 2.31208, 1, 0, 0.6352941, 1,
1.288, -0.7434435, 1.047184, 1, 0, 0.6313726, 1,
1.289342, -1.345567, 1.882944, 1, 0, 0.6235294, 1,
1.291155, -0.004443491, 1.953981, 1, 0, 0.6196079, 1,
1.298762, -0.191577, 1.859606, 1, 0, 0.6117647, 1,
1.304838, -0.9779063, 1.694238, 1, 0, 0.6078432, 1,
1.31081, -0.8738729, 3.202519, 1, 0, 0.6, 1,
1.331057, -0.3776369, 3.139267, 1, 0, 0.5921569, 1,
1.334688, 0.03882962, 1.670959, 1, 0, 0.5882353, 1,
1.334983, 1.001906, 0.5599765, 1, 0, 0.5803922, 1,
1.344045, 0.0621509, 2.658339, 1, 0, 0.5764706, 1,
1.359616, 0.9466242, 1.572911, 1, 0, 0.5686275, 1,
1.360525, -1.857505, 2.549088, 1, 0, 0.5647059, 1,
1.377367, 0.6107143, 3.011345, 1, 0, 0.5568628, 1,
1.382343, 1.227324, 1.063746, 1, 0, 0.5529412, 1,
1.383299, 1.257099, 1.780996, 1, 0, 0.5450981, 1,
1.389534, 1.468976, 1.652695, 1, 0, 0.5411765, 1,
1.400734, -0.3386162, 1.102924, 1, 0, 0.5333334, 1,
1.401472, 1.930637, 0.2222525, 1, 0, 0.5294118, 1,
1.41269, 0.7167745, -0.6742484, 1, 0, 0.5215687, 1,
1.415873, 0.2745622, 1.512368, 1, 0, 0.5176471, 1,
1.41613, 0.7095371, 0.9504109, 1, 0, 0.509804, 1,
1.432603, 0.7161455, 0.4851574, 1, 0, 0.5058824, 1,
1.435018, 1.547129, 0.3562153, 1, 0, 0.4980392, 1,
1.436685, -1.029265, 2.162626, 1, 0, 0.4901961, 1,
1.438243, -1.773129, 2.814468, 1, 0, 0.4862745, 1,
1.444237, 0.7354157, 0.875171, 1, 0, 0.4784314, 1,
1.447108, -0.0629355, 2.592734, 1, 0, 0.4745098, 1,
1.450964, -0.270152, 1.083407, 1, 0, 0.4666667, 1,
1.451327, 0.6706552, 0.3415096, 1, 0, 0.4627451, 1,
1.481976, 0.7368972, 3.017311, 1, 0, 0.454902, 1,
1.482082, 0.1955541, 1.047598, 1, 0, 0.4509804, 1,
1.487646, -0.5476606, 3.476769, 1, 0, 0.4431373, 1,
1.499043, -1.475226, 4.644163, 1, 0, 0.4392157, 1,
1.506648, -0.1487225, 0.2172307, 1, 0, 0.4313726, 1,
1.508543, 2.025293, 0.9731352, 1, 0, 0.427451, 1,
1.520612, -1.561764, 2.066437, 1, 0, 0.4196078, 1,
1.520684, 1.024797, -1.348393, 1, 0, 0.4156863, 1,
1.522851, -0.5614301, 2.536105, 1, 0, 0.4078431, 1,
1.537731, -0.9141614, 1.643083, 1, 0, 0.4039216, 1,
1.544187, 1.668618, 1.427566, 1, 0, 0.3960784, 1,
1.550078, 0.3324297, 3.648142, 1, 0, 0.3882353, 1,
1.562047, 0.3265522, 1.841998, 1, 0, 0.3843137, 1,
1.562683, 0.1632918, 0.2483879, 1, 0, 0.3764706, 1,
1.574383, 0.397337, 0.5330572, 1, 0, 0.372549, 1,
1.574523, -0.1700182, 0.994853, 1, 0, 0.3647059, 1,
1.594712, -0.03253924, 2.104818, 1, 0, 0.3607843, 1,
1.599129, 0.09798495, -0.3439933, 1, 0, 0.3529412, 1,
1.61073, -2.64394, 1.735768, 1, 0, 0.3490196, 1,
1.626424, -0.6491404, 1.297387, 1, 0, 0.3411765, 1,
1.63482, 2.082385, 1.95488, 1, 0, 0.3372549, 1,
1.638191, 0.3082473, 0.05394705, 1, 0, 0.3294118, 1,
1.639582, -1.442454, 2.350116, 1, 0, 0.3254902, 1,
1.656222, -0.4784002, 2.444616, 1, 0, 0.3176471, 1,
1.672812, -0.3454927, 2.58294, 1, 0, 0.3137255, 1,
1.67902, 1.605598, 0.9558455, 1, 0, 0.3058824, 1,
1.687681, 1.407371, 2.482713, 1, 0, 0.2980392, 1,
1.695266, -1.127594, 2.358066, 1, 0, 0.2941177, 1,
1.703723, 1.142614, -1.13508, 1, 0, 0.2862745, 1,
1.711449, 0.4299143, 2.138652, 1, 0, 0.282353, 1,
1.724599, 0.1678255, 3.046395, 1, 0, 0.2745098, 1,
1.725883, -0.2350793, 1.665017, 1, 0, 0.2705882, 1,
1.731472, -0.1222903, 0.3020308, 1, 0, 0.2627451, 1,
1.754995, -0.9038415, 2.601153, 1, 0, 0.2588235, 1,
1.776365, -1.991367, 3.246947, 1, 0, 0.2509804, 1,
1.787548, -1.681119, 1.571223, 1, 0, 0.2470588, 1,
1.808285, 0.390521, 0.4809006, 1, 0, 0.2392157, 1,
1.834009, 1.639638, -0.8604444, 1, 0, 0.2352941, 1,
1.836594, -0.6818219, 2.310603, 1, 0, 0.227451, 1,
1.844775, -0.7894541, 2.624006, 1, 0, 0.2235294, 1,
1.85152, 0.5632881, 3.118705, 1, 0, 0.2156863, 1,
1.874986, -1.529045, 3.032887, 1, 0, 0.2117647, 1,
1.876418, 0.232488, 1.064643, 1, 0, 0.2039216, 1,
1.904697, -0.9205902, 3.073497, 1, 0, 0.1960784, 1,
1.914274, 0.6611592, 0.2088229, 1, 0, 0.1921569, 1,
1.942845, -0.02761762, 4.37759, 1, 0, 0.1843137, 1,
1.947299, -1.283177, 1.757783, 1, 0, 0.1803922, 1,
1.949255, -0.8234022, 1.356803, 1, 0, 0.172549, 1,
1.960012, 0.6167277, 1.630314, 1, 0, 0.1686275, 1,
1.980333, 1.557521, 1.066862, 1, 0, 0.1607843, 1,
1.985598, -1.490426, 1.960512, 1, 0, 0.1568628, 1,
2.003704, 0.7203229, 0.5438658, 1, 0, 0.1490196, 1,
2.025698, -0.9093958, 2.23838, 1, 0, 0.145098, 1,
2.031617, -0.02746371, 1.404923, 1, 0, 0.1372549, 1,
2.052613, 0.3246057, 2.102569, 1, 0, 0.1333333, 1,
2.061838, -1.180533, 0.7683781, 1, 0, 0.1254902, 1,
2.101001, -0.5692878, 2.357171, 1, 0, 0.1215686, 1,
2.13476, -0.08198243, 1.326741, 1, 0, 0.1137255, 1,
2.147296, -0.6268323, 1.860872, 1, 0, 0.1098039, 1,
2.192478, 2.399686, -0.1444912, 1, 0, 0.1019608, 1,
2.234167, 0.2976348, 0.5097616, 1, 0, 0.09411765, 1,
2.266489, -0.02203088, 1.46089, 1, 0, 0.09019608, 1,
2.30391, -2.183064, 1.508762, 1, 0, 0.08235294, 1,
2.310139, -0.5571914, 0.7068524, 1, 0, 0.07843138, 1,
2.317973, -0.5377922, 1.035636, 1, 0, 0.07058824, 1,
2.339624, -1.244802, 2.968828, 1, 0, 0.06666667, 1,
2.432407, -0.2569932, 1.743788, 1, 0, 0.05882353, 1,
2.441188, 1.045579, 0.8048995, 1, 0, 0.05490196, 1,
2.471184, -0.3171294, 1.931027, 1, 0, 0.04705882, 1,
2.491209, -1.660515, 2.314398, 1, 0, 0.04313726, 1,
2.503008, 1.170045, 0.9978476, 1, 0, 0.03529412, 1,
2.540369, -0.08179023, 1.782671, 1, 0, 0.03137255, 1,
2.805346, 0.8495743, 2.127906, 1, 0, 0.02352941, 1,
2.828822, 1.40214, 0.382245, 1, 0, 0.01960784, 1,
2.85807, -0.4192816, 0.6911311, 1, 0, 0.01176471, 1,
3.081101, 1.471059, -0.4810378, 1, 0, 0.007843138, 1
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
-0.03746259, -4.840015, -8.328109, 0, -0.5, 0.5, 0.5,
-0.03746259, -4.840015, -8.328109, 1, -0.5, 0.5, 0.5,
-0.03746259, -4.840015, -8.328109, 1, 1.5, 0.5, 0.5,
-0.03746259, -4.840015, -8.328109, 0, 1.5, 0.5, 0.5
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
-4.21322, -0.3700129, -8.328109, 0, -0.5, 0.5, 0.5,
-4.21322, -0.3700129, -8.328109, 1, -0.5, 0.5, 0.5,
-4.21322, -0.3700129, -8.328109, 1, 1.5, 0.5, 0.5,
-4.21322, -0.3700129, -8.328109, 0, 1.5, 0.5, 0.5
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
-4.21322, -4.840015, -0.268033, 0, -0.5, 0.5, 0.5,
-4.21322, -4.840015, -0.268033, 1, -0.5, 0.5, 0.5,
-4.21322, -4.840015, -0.268033, 1, 1.5, 0.5, 0.5,
-4.21322, -4.840015, -0.268033, 0, 1.5, 0.5, 0.5
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
-3, -3.808476, -6.468091,
3, -3.808476, -6.468091,
-3, -3.808476, -6.468091,
-3, -3.980399, -6.778094,
-2, -3.808476, -6.468091,
-2, -3.980399, -6.778094,
-1, -3.808476, -6.468091,
-1, -3.980399, -6.778094,
0, -3.808476, -6.468091,
0, -3.980399, -6.778094,
1, -3.808476, -6.468091,
1, -3.980399, -6.778094,
2, -3.808476, -6.468091,
2, -3.980399, -6.778094,
3, -3.808476, -6.468091,
3, -3.980399, -6.778094
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
-3, -4.324246, -7.3981, 0, -0.5, 0.5, 0.5,
-3, -4.324246, -7.3981, 1, -0.5, 0.5, 0.5,
-3, -4.324246, -7.3981, 1, 1.5, 0.5, 0.5,
-3, -4.324246, -7.3981, 0, 1.5, 0.5, 0.5,
-2, -4.324246, -7.3981, 0, -0.5, 0.5, 0.5,
-2, -4.324246, -7.3981, 1, -0.5, 0.5, 0.5,
-2, -4.324246, -7.3981, 1, 1.5, 0.5, 0.5,
-2, -4.324246, -7.3981, 0, 1.5, 0.5, 0.5,
-1, -4.324246, -7.3981, 0, -0.5, 0.5, 0.5,
-1, -4.324246, -7.3981, 1, -0.5, 0.5, 0.5,
-1, -4.324246, -7.3981, 1, 1.5, 0.5, 0.5,
-1, -4.324246, -7.3981, 0, 1.5, 0.5, 0.5,
0, -4.324246, -7.3981, 0, -0.5, 0.5, 0.5,
0, -4.324246, -7.3981, 1, -0.5, 0.5, 0.5,
0, -4.324246, -7.3981, 1, 1.5, 0.5, 0.5,
0, -4.324246, -7.3981, 0, 1.5, 0.5, 0.5,
1, -4.324246, -7.3981, 0, -0.5, 0.5, 0.5,
1, -4.324246, -7.3981, 1, -0.5, 0.5, 0.5,
1, -4.324246, -7.3981, 1, 1.5, 0.5, 0.5,
1, -4.324246, -7.3981, 0, 1.5, 0.5, 0.5,
2, -4.324246, -7.3981, 0, -0.5, 0.5, 0.5,
2, -4.324246, -7.3981, 1, -0.5, 0.5, 0.5,
2, -4.324246, -7.3981, 1, 1.5, 0.5, 0.5,
2, -4.324246, -7.3981, 0, 1.5, 0.5, 0.5,
3, -4.324246, -7.3981, 0, -0.5, 0.5, 0.5,
3, -4.324246, -7.3981, 1, -0.5, 0.5, 0.5,
3, -4.324246, -7.3981, 1, 1.5, 0.5, 0.5,
3, -4.324246, -7.3981, 0, 1.5, 0.5, 0.5
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
-3.249583, -3, -6.468091,
-3.249583, 2, -6.468091,
-3.249583, -3, -6.468091,
-3.41019, -3, -6.778094,
-3.249583, -2, -6.468091,
-3.41019, -2, -6.778094,
-3.249583, -1, -6.468091,
-3.41019, -1, -6.778094,
-3.249583, 0, -6.468091,
-3.41019, 0, -6.778094,
-3.249583, 1, -6.468091,
-3.41019, 1, -6.778094,
-3.249583, 2, -6.468091,
-3.41019, 2, -6.778094
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
-3.731402, -3, -7.3981, 0, -0.5, 0.5, 0.5,
-3.731402, -3, -7.3981, 1, -0.5, 0.5, 0.5,
-3.731402, -3, -7.3981, 1, 1.5, 0.5, 0.5,
-3.731402, -3, -7.3981, 0, 1.5, 0.5, 0.5,
-3.731402, -2, -7.3981, 0, -0.5, 0.5, 0.5,
-3.731402, -2, -7.3981, 1, -0.5, 0.5, 0.5,
-3.731402, -2, -7.3981, 1, 1.5, 0.5, 0.5,
-3.731402, -2, -7.3981, 0, 1.5, 0.5, 0.5,
-3.731402, -1, -7.3981, 0, -0.5, 0.5, 0.5,
-3.731402, -1, -7.3981, 1, -0.5, 0.5, 0.5,
-3.731402, -1, -7.3981, 1, 1.5, 0.5, 0.5,
-3.731402, -1, -7.3981, 0, 1.5, 0.5, 0.5,
-3.731402, 0, -7.3981, 0, -0.5, 0.5, 0.5,
-3.731402, 0, -7.3981, 1, -0.5, 0.5, 0.5,
-3.731402, 0, -7.3981, 1, 1.5, 0.5, 0.5,
-3.731402, 0, -7.3981, 0, 1.5, 0.5, 0.5,
-3.731402, 1, -7.3981, 0, -0.5, 0.5, 0.5,
-3.731402, 1, -7.3981, 1, -0.5, 0.5, 0.5,
-3.731402, 1, -7.3981, 1, 1.5, 0.5, 0.5,
-3.731402, 1, -7.3981, 0, 1.5, 0.5, 0.5,
-3.731402, 2, -7.3981, 0, -0.5, 0.5, 0.5,
-3.731402, 2, -7.3981, 1, -0.5, 0.5, 0.5,
-3.731402, 2, -7.3981, 1, 1.5, 0.5, 0.5,
-3.731402, 2, -7.3981, 0, 1.5, 0.5, 0.5
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
-3.249583, -3.808476, -6,
-3.249583, -3.808476, 4,
-3.249583, -3.808476, -6,
-3.41019, -3.980399, -6,
-3.249583, -3.808476, -4,
-3.41019, -3.980399, -4,
-3.249583, -3.808476, -2,
-3.41019, -3.980399, -2,
-3.249583, -3.808476, 0,
-3.41019, -3.980399, 0,
-3.249583, -3.808476, 2,
-3.41019, -3.980399, 2,
-3.249583, -3.808476, 4,
-3.41019, -3.980399, 4
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
-3.731402, -4.324246, -6, 0, -0.5, 0.5, 0.5,
-3.731402, -4.324246, -6, 1, -0.5, 0.5, 0.5,
-3.731402, -4.324246, -6, 1, 1.5, 0.5, 0.5,
-3.731402, -4.324246, -6, 0, 1.5, 0.5, 0.5,
-3.731402, -4.324246, -4, 0, -0.5, 0.5, 0.5,
-3.731402, -4.324246, -4, 1, -0.5, 0.5, 0.5,
-3.731402, -4.324246, -4, 1, 1.5, 0.5, 0.5,
-3.731402, -4.324246, -4, 0, 1.5, 0.5, 0.5,
-3.731402, -4.324246, -2, 0, -0.5, 0.5, 0.5,
-3.731402, -4.324246, -2, 1, -0.5, 0.5, 0.5,
-3.731402, -4.324246, -2, 1, 1.5, 0.5, 0.5,
-3.731402, -4.324246, -2, 0, 1.5, 0.5, 0.5,
-3.731402, -4.324246, 0, 0, -0.5, 0.5, 0.5,
-3.731402, -4.324246, 0, 1, -0.5, 0.5, 0.5,
-3.731402, -4.324246, 0, 1, 1.5, 0.5, 0.5,
-3.731402, -4.324246, 0, 0, 1.5, 0.5, 0.5,
-3.731402, -4.324246, 2, 0, -0.5, 0.5, 0.5,
-3.731402, -4.324246, 2, 1, -0.5, 0.5, 0.5,
-3.731402, -4.324246, 2, 1, 1.5, 0.5, 0.5,
-3.731402, -4.324246, 2, 0, 1.5, 0.5, 0.5,
-3.731402, -4.324246, 4, 0, -0.5, 0.5, 0.5,
-3.731402, -4.324246, 4, 1, -0.5, 0.5, 0.5,
-3.731402, -4.324246, 4, 1, 1.5, 0.5, 0.5,
-3.731402, -4.324246, 4, 0, 1.5, 0.5, 0.5
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
-3.249583, -3.808476, -6.468091,
-3.249583, 3.06845, -6.468091,
-3.249583, -3.808476, 5.932025,
-3.249583, 3.06845, 5.932025,
-3.249583, -3.808476, -6.468091,
-3.249583, -3.808476, 5.932025,
-3.249583, 3.06845, -6.468091,
-3.249583, 3.06845, 5.932025,
-3.249583, -3.808476, -6.468091,
3.174658, -3.808476, -6.468091,
-3.249583, -3.808476, 5.932025,
3.174658, -3.808476, 5.932025,
-3.249583, 3.06845, -6.468091,
3.174658, 3.06845, -6.468091,
-3.249583, 3.06845, 5.932025,
3.174658, 3.06845, 5.932025,
3.174658, -3.808476, -6.468091,
3.174658, 3.06845, -6.468091,
3.174658, -3.808476, 5.932025,
3.174658, 3.06845, 5.932025,
3.174658, -3.808476, -6.468091,
3.174658, -3.808476, 5.932025,
3.174658, 3.06845, -6.468091,
3.174658, 3.06845, 5.932025
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
var radius = 8.31238;
var distance = 36.98272;
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
mvMatrix.translate( 0.03746259, 0.3700129, 0.268033 );
mvMatrix.scale( 1.398999, 1.306908, 0.7247922 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.98272);
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


