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
-3.545491, -2.631276, -1.245078, 1, 0, 0, 1,
-3.200547, -0.5353361, -0.4924261, 1, 0.007843138, 0, 1,
-3.163638, 0.7600798, -2.116087, 1, 0.01176471, 0, 1,
-3.149123, -0.4617324, -1.217246, 1, 0.01960784, 0, 1,
-3.07994, 0.2104935, -2.84291, 1, 0.02352941, 0, 1,
-3.01467, 0.2318012, -0.7102587, 1, 0.03137255, 0, 1,
-2.676164, -0.3835134, -0.7190971, 1, 0.03529412, 0, 1,
-2.56478, -0.469259, -1.404965, 1, 0.04313726, 0, 1,
-2.455631, -0.6993774, -1.543256, 1, 0.04705882, 0, 1,
-2.414347, -0.09268587, -2.475964, 1, 0.05490196, 0, 1,
-2.37852, -0.2267546, -1.182309, 1, 0.05882353, 0, 1,
-2.315019, 1.429809, -1.301852, 1, 0.06666667, 0, 1,
-2.305161, -0.6403815, -3.643906, 1, 0.07058824, 0, 1,
-2.303484, 0.253891, -0.5509838, 1, 0.07843138, 0, 1,
-2.302423, -2.385987, -2.499172, 1, 0.08235294, 0, 1,
-2.30002, -0.2608673, 0.1893046, 1, 0.09019608, 0, 1,
-2.247281, 0.1128206, -3.50597, 1, 0.09411765, 0, 1,
-2.243704, 1.491254, -1.417251, 1, 0.1019608, 0, 1,
-2.218997, -0.7497768, -3.016948, 1, 0.1098039, 0, 1,
-2.196007, 0.542217, -3.717615, 1, 0.1137255, 0, 1,
-2.176765, -0.6475719, -1.824502, 1, 0.1215686, 0, 1,
-2.166437, -0.463547, -2.423614, 1, 0.1254902, 0, 1,
-2.16377, -1.569314, -1.348122, 1, 0.1333333, 0, 1,
-2.146309, 1.519213, -0.601088, 1, 0.1372549, 0, 1,
-2.121728, -0.7437036, -1.914435, 1, 0.145098, 0, 1,
-2.120283, 1.186623, -0.7735738, 1, 0.1490196, 0, 1,
-2.110512, -1.602677, -2.018205, 1, 0.1568628, 0, 1,
-2.103492, -0.9570971, -2.480138, 1, 0.1607843, 0, 1,
-2.103282, 0.5620501, -1.661914, 1, 0.1686275, 0, 1,
-2.099402, -1.608982, -2.438483, 1, 0.172549, 0, 1,
-2.096993, -1.350709, -3.200355, 1, 0.1803922, 0, 1,
-2.074833, 0.7945535, -2.61252, 1, 0.1843137, 0, 1,
-2.061578, -0.2789161, -2.004129, 1, 0.1921569, 0, 1,
-2.043605, 1.27818, -1.740892, 1, 0.1960784, 0, 1,
-2.03035, 0.4812588, -0.5257581, 1, 0.2039216, 0, 1,
-2.019565, -0.2098403, -1.164426, 1, 0.2117647, 0, 1,
-2.002372, -2.066349, -0.9179354, 1, 0.2156863, 0, 1,
-1.996667, -0.2155966, -0.1646075, 1, 0.2235294, 0, 1,
-1.992346, -0.2655386, -2.879327, 1, 0.227451, 0, 1,
-1.992223, -1.163028, -1.90317, 1, 0.2352941, 0, 1,
-1.978519, -0.07148395, -2.022621, 1, 0.2392157, 0, 1,
-1.952582, 0.0991198, -0.7649074, 1, 0.2470588, 0, 1,
-1.943779, 0.3890484, -1.511509, 1, 0.2509804, 0, 1,
-1.93442, -0.5611951, -1.184101, 1, 0.2588235, 0, 1,
-1.932958, 0.8079161, -0.6860694, 1, 0.2627451, 0, 1,
-1.839244, -1.667715, -2.890975, 1, 0.2705882, 0, 1,
-1.813815, 1.088904, -1.159922, 1, 0.2745098, 0, 1,
-1.805316, 0.698081, -0.7382831, 1, 0.282353, 0, 1,
-1.799809, 0.5780002, -2.936821, 1, 0.2862745, 0, 1,
-1.787789, 2.908268, -0.7791806, 1, 0.2941177, 0, 1,
-1.773934, 0.5902865, -2.932029, 1, 0.3019608, 0, 1,
-1.756048, 1.048661, -1.827794, 1, 0.3058824, 0, 1,
-1.742202, 0.4876261, -1.68233, 1, 0.3137255, 0, 1,
-1.707737, 0.04346108, -2.100106, 1, 0.3176471, 0, 1,
-1.706095, 2.784922, -0.1408821, 1, 0.3254902, 0, 1,
-1.705607, 0.701413, -1.934303, 1, 0.3294118, 0, 1,
-1.699852, 1.702434, -0.5419049, 1, 0.3372549, 0, 1,
-1.685266, 0.5751082, -1.329266, 1, 0.3411765, 0, 1,
-1.664716, 0.8169326, -0.8832695, 1, 0.3490196, 0, 1,
-1.650771, -0.0265593, -1.979444, 1, 0.3529412, 0, 1,
-1.646214, 0.2222181, -0.2379728, 1, 0.3607843, 0, 1,
-1.632521, 2.069064, 0.1169733, 1, 0.3647059, 0, 1,
-1.601392, 0.5663848, -2.41537, 1, 0.372549, 0, 1,
-1.596106, -0.8739234, -2.114565, 1, 0.3764706, 0, 1,
-1.594167, -0.6369278, -3.856261, 1, 0.3843137, 0, 1,
-1.59189, 1.065528, -0.4525546, 1, 0.3882353, 0, 1,
-1.590094, -0.2323297, -1.366912, 1, 0.3960784, 0, 1,
-1.583708, 1.474434, 0.4296024, 1, 0.4039216, 0, 1,
-1.581166, -1.361651, -1.301007, 1, 0.4078431, 0, 1,
-1.574301, -0.9254113, -0.8574235, 1, 0.4156863, 0, 1,
-1.573324, 0.5218853, -1.43183, 1, 0.4196078, 0, 1,
-1.558802, -0.851556, -4.593685, 1, 0.427451, 0, 1,
-1.546914, 0.6973242, -0.09987973, 1, 0.4313726, 0, 1,
-1.544856, 2.33122, -0.2069766, 1, 0.4392157, 0, 1,
-1.536706, -1.43496, -1.340173, 1, 0.4431373, 0, 1,
-1.534343, -0.5927378, -2.011571, 1, 0.4509804, 0, 1,
-1.526473, 0.1583636, -3.624901, 1, 0.454902, 0, 1,
-1.518953, 0.8827835, -2.025498, 1, 0.4627451, 0, 1,
-1.508291, -0.07473017, 0.6348963, 1, 0.4666667, 0, 1,
-1.500587, -1.330343, -3.12601, 1, 0.4745098, 0, 1,
-1.497158, 0.0334263, -3.05455, 1, 0.4784314, 0, 1,
-1.494591, -0.9123424, -2.477307, 1, 0.4862745, 0, 1,
-1.492608, 1.025546, -1.551628, 1, 0.4901961, 0, 1,
-1.487486, -0.2465726, -1.434271, 1, 0.4980392, 0, 1,
-1.484422, -0.4608487, -1.300961, 1, 0.5058824, 0, 1,
-1.481825, -0.3626539, -1.034533, 1, 0.509804, 0, 1,
-1.47851, 0.4779008, -1.513196, 1, 0.5176471, 0, 1,
-1.466105, 1.797222, -2.430283, 1, 0.5215687, 0, 1,
-1.426279, -0.5349003, -2.668274, 1, 0.5294118, 0, 1,
-1.413456, -1.108178, -3.471991, 1, 0.5333334, 0, 1,
-1.407608, 0.6757023, -1.712113, 1, 0.5411765, 0, 1,
-1.406923, -0.7913224, -1.679301, 1, 0.5450981, 0, 1,
-1.400625, 0.8881034, 0.359981, 1, 0.5529412, 0, 1,
-1.393632, -1.466541, -2.643334, 1, 0.5568628, 0, 1,
-1.391815, -0.6087382, -2.546535, 1, 0.5647059, 0, 1,
-1.385811, -0.7010207, -1.766679, 1, 0.5686275, 0, 1,
-1.385352, 1.43025, -1.245727, 1, 0.5764706, 0, 1,
-1.384563, -0.3460284, -2.176254, 1, 0.5803922, 0, 1,
-1.370839, -0.4072894, -2.448361, 1, 0.5882353, 0, 1,
-1.370653, 1.220469, -1.582096, 1, 0.5921569, 0, 1,
-1.368023, 0.1463068, -2.830832, 1, 0.6, 0, 1,
-1.367028, -0.1026996, -1.693986, 1, 0.6078432, 0, 1,
-1.362031, 0.173189, -2.578362, 1, 0.6117647, 0, 1,
-1.354983, -0.3604838, -1.941, 1, 0.6196079, 0, 1,
-1.347351, 0.4562248, -1.707379, 1, 0.6235294, 0, 1,
-1.33845, -0.08498967, -0.771574, 1, 0.6313726, 0, 1,
-1.336484, 2.064356, -1.633167, 1, 0.6352941, 0, 1,
-1.333488, -0.7292776, -2.011872, 1, 0.6431373, 0, 1,
-1.329523, -0.05093683, -3.324295, 1, 0.6470588, 0, 1,
-1.319421, -0.4376041, -1.109446, 1, 0.654902, 0, 1,
-1.311266, 0.7525333, 0.2843452, 1, 0.6588235, 0, 1,
-1.30647, 1.527137, 0.2443432, 1, 0.6666667, 0, 1,
-1.302809, -1.712273, -2.550701, 1, 0.6705883, 0, 1,
-1.293449, -0.8572832, -3.251479, 1, 0.6784314, 0, 1,
-1.291538, 0.3853788, -0.02903452, 1, 0.682353, 0, 1,
-1.287099, 1.832958, -0.4356153, 1, 0.6901961, 0, 1,
-1.283514, 1.009554, -1.086925, 1, 0.6941177, 0, 1,
-1.27941, 1.328974, -1.039653, 1, 0.7019608, 0, 1,
-1.277689, 0.02344814, -1.326548, 1, 0.7098039, 0, 1,
-1.269894, -0.3002234, -1.150474, 1, 0.7137255, 0, 1,
-1.269397, 0.8579773, -3.025687, 1, 0.7215686, 0, 1,
-1.26665, 0.8064902, 1.034481, 1, 0.7254902, 0, 1,
-1.263733, 0.5285748, -0.9048977, 1, 0.7333333, 0, 1,
-1.256801, -0.8418756, -1.886854, 1, 0.7372549, 0, 1,
-1.252369, 0.458147, -3.071206, 1, 0.7450981, 0, 1,
-1.243783, 0.2924681, -1.298707, 1, 0.7490196, 0, 1,
-1.239198, 0.1842554, -0.7187537, 1, 0.7568628, 0, 1,
-1.238602, -1.034673, -2.026031, 1, 0.7607843, 0, 1,
-1.225543, 0.4009712, -0.6123615, 1, 0.7686275, 0, 1,
-1.222828, -0.6785553, -2.782446, 1, 0.772549, 0, 1,
-1.221979, 1.854117, 0.2531284, 1, 0.7803922, 0, 1,
-1.215008, 0.1468957, 0.3152551, 1, 0.7843137, 0, 1,
-1.20389, -0.4974268, -1.782763, 1, 0.7921569, 0, 1,
-1.199186, -0.8190588, -0.8354769, 1, 0.7960784, 0, 1,
-1.198062, 1.35131, 1.046138, 1, 0.8039216, 0, 1,
-1.197921, 1.288036, -1.598009, 1, 0.8117647, 0, 1,
-1.190123, 0.7841298, -1.20226, 1, 0.8156863, 0, 1,
-1.177492, 0.8924183, -1.280426, 1, 0.8235294, 0, 1,
-1.162499, 1.103222, -1.549698, 1, 0.827451, 0, 1,
-1.154791, -1.888472, -2.524163, 1, 0.8352941, 0, 1,
-1.147183, -0.3388945, -0.9440646, 1, 0.8392157, 0, 1,
-1.144067, -1.113128, -1.17192, 1, 0.8470588, 0, 1,
-1.12457, -1.298292, -1.277122, 1, 0.8509804, 0, 1,
-1.123707, -0.3113712, -0.5684954, 1, 0.8588235, 0, 1,
-1.123166, -1.381034, -3.40857, 1, 0.8627451, 0, 1,
-1.120731, -0.1709352, -0.5084551, 1, 0.8705882, 0, 1,
-1.120403, -0.3847478, -1.767057, 1, 0.8745098, 0, 1,
-1.118686, 0.9256144, -0.8513258, 1, 0.8823529, 0, 1,
-1.111675, -0.2445972, -2.785713, 1, 0.8862745, 0, 1,
-1.110878, -0.6953201, -1.705381, 1, 0.8941177, 0, 1,
-1.108511, 0.6527249, -0.6784402, 1, 0.8980392, 0, 1,
-1.099593, -0.7511681, -1.866185, 1, 0.9058824, 0, 1,
-1.085757, 0.1276148, -3.790097, 1, 0.9137255, 0, 1,
-1.079684, -1.408574, -1.876758, 1, 0.9176471, 0, 1,
-1.079176, 1.062829, -1.260115, 1, 0.9254902, 0, 1,
-1.0743, -1.45384, -2.617596, 1, 0.9294118, 0, 1,
-1.052545, -0.3769178, -3.150383, 1, 0.9372549, 0, 1,
-1.048012, 0.3387067, 0.1732816, 1, 0.9411765, 0, 1,
-1.043404, 0.2652555, -0.7603609, 1, 0.9490196, 0, 1,
-1.033918, 0.371193, -0.9893261, 1, 0.9529412, 0, 1,
-1.027356, -0.01950992, -0.6792403, 1, 0.9607843, 0, 1,
-1.023643, -0.3942287, 0.2106983, 1, 0.9647059, 0, 1,
-1.017197, 1.489873, -0.4003565, 1, 0.972549, 0, 1,
-1.014012, -0.003030408, -1.508625, 1, 0.9764706, 0, 1,
-1.010744, 1.129983, -0.7336986, 1, 0.9843137, 0, 1,
-1.008753, 1.724997, -1.371156, 1, 0.9882353, 0, 1,
-0.9939975, -0.369562, -3.004732, 1, 0.9960784, 0, 1,
-0.9938738, -0.03351325, -2.822121, 0.9960784, 1, 0, 1,
-0.988425, 1.598726, 1.025748, 0.9921569, 1, 0, 1,
-0.9864132, -0.5783763, -2.996693, 0.9843137, 1, 0, 1,
-0.9863539, -0.5909384, -4.407718, 0.9803922, 1, 0, 1,
-0.9863206, -1.211915, -2.429353, 0.972549, 1, 0, 1,
-0.9814771, 1.674481, -2.015713, 0.9686275, 1, 0, 1,
-0.977607, 2.036933, -0.08771239, 0.9607843, 1, 0, 1,
-0.9739509, -0.7949489, -2.951941, 0.9568627, 1, 0, 1,
-0.9679991, 0.2802843, -2.080701, 0.9490196, 1, 0, 1,
-0.9593347, 1.169902, 0.3575887, 0.945098, 1, 0, 1,
-0.9554979, 0.02474354, -1.965093, 0.9372549, 1, 0, 1,
-0.9545767, 0.294252, -1.822562, 0.9333333, 1, 0, 1,
-0.9404291, 2.540797, -0.8526242, 0.9254902, 1, 0, 1,
-0.9394071, 1.563161, 0.8146448, 0.9215686, 1, 0, 1,
-0.9353057, -0.04257853, -0.864603, 0.9137255, 1, 0, 1,
-0.9348377, -1.381727, -3.926875, 0.9098039, 1, 0, 1,
-0.9330813, -1.240485, -2.745468, 0.9019608, 1, 0, 1,
-0.9231842, -0.1115344, 0.8898432, 0.8941177, 1, 0, 1,
-0.9230406, 1.623094, -1.699586, 0.8901961, 1, 0, 1,
-0.9226269, -0.4067251, -3.920723, 0.8823529, 1, 0, 1,
-0.9220579, 0.3039489, -0.974748, 0.8784314, 1, 0, 1,
-0.9196277, 0.180647, -2.879454, 0.8705882, 1, 0, 1,
-0.9178585, 0.4667184, -1.144801, 0.8666667, 1, 0, 1,
-0.9088094, 0.6001303, -2.191416, 0.8588235, 1, 0, 1,
-0.9046082, 0.8524777, -0.07523392, 0.854902, 1, 0, 1,
-0.9037791, -1.274965, -2.290875, 0.8470588, 1, 0, 1,
-0.9026068, 1.18858, 1.076064, 0.8431373, 1, 0, 1,
-0.9012648, 0.5757652, 0.7439466, 0.8352941, 1, 0, 1,
-0.8969771, -0.7608047, -1.985916, 0.8313726, 1, 0, 1,
-0.8950829, -0.4544754, -4.624507, 0.8235294, 1, 0, 1,
-0.8930601, -0.4974299, -1.794995, 0.8196079, 1, 0, 1,
-0.8844352, -0.6589547, -1.439979, 0.8117647, 1, 0, 1,
-0.8799016, -0.07656915, -1.945604, 0.8078431, 1, 0, 1,
-0.8677539, 0.2115076, -1.173107, 0.8, 1, 0, 1,
-0.859081, 0.3535197, -0.4157613, 0.7921569, 1, 0, 1,
-0.8573691, 0.2124892, 0.3475071, 0.7882353, 1, 0, 1,
-0.851424, 0.9145976, -2.239328, 0.7803922, 1, 0, 1,
-0.8483849, -3.315142, -1.691061, 0.7764706, 1, 0, 1,
-0.8470907, -1.503138, -3.36103, 0.7686275, 1, 0, 1,
-0.8432763, -1.165916, -3.256045, 0.7647059, 1, 0, 1,
-0.8425191, 1.475442, 0.5634742, 0.7568628, 1, 0, 1,
-0.8407252, -1.669898, -2.754878, 0.7529412, 1, 0, 1,
-0.8386472, 0.5594162, -1.419285, 0.7450981, 1, 0, 1,
-0.8384999, 0.3162679, -1.333746, 0.7411765, 1, 0, 1,
-0.8378646, -0.04887427, -2.797917, 0.7333333, 1, 0, 1,
-0.8293644, 0.09623602, -3.070916, 0.7294118, 1, 0, 1,
-0.8285039, 0.9130361, 1.967809, 0.7215686, 1, 0, 1,
-0.8280277, 1.004487, -0.04713751, 0.7176471, 1, 0, 1,
-0.8258269, 0.2581635, -1.79363, 0.7098039, 1, 0, 1,
-0.8231781, 0.1401831, -2.731179, 0.7058824, 1, 0, 1,
-0.8222072, 0.1498291, -0.9225823, 0.6980392, 1, 0, 1,
-0.8190475, -1.869374, -3.359792, 0.6901961, 1, 0, 1,
-0.8146333, 0.3365741, -0.07846434, 0.6862745, 1, 0, 1,
-0.8137993, -0.7766656, -2.765781, 0.6784314, 1, 0, 1,
-0.812087, 0.1883251, -1.6682, 0.6745098, 1, 0, 1,
-0.8118172, -0.02448768, -1.791198, 0.6666667, 1, 0, 1,
-0.7992644, 2.416365, -1.7098, 0.6627451, 1, 0, 1,
-0.7922754, 1.437951, 1.485305, 0.654902, 1, 0, 1,
-0.7918705, 0.4122202, -1.182584, 0.6509804, 1, 0, 1,
-0.7916749, 0.6889209, 0.02534182, 0.6431373, 1, 0, 1,
-0.7873821, 0.6131885, 1.823421, 0.6392157, 1, 0, 1,
-0.785796, -0.4862785, -2.077613, 0.6313726, 1, 0, 1,
-0.7821578, -0.2258219, -2.875473, 0.627451, 1, 0, 1,
-0.7817044, -0.3649307, -1.968117, 0.6196079, 1, 0, 1,
-0.7785929, -0.5878936, -2.647642, 0.6156863, 1, 0, 1,
-0.7720708, -0.1185835, -2.565773, 0.6078432, 1, 0, 1,
-0.7659454, -0.09121826, -4.330284, 0.6039216, 1, 0, 1,
-0.7656341, -1.676637, -3.030999, 0.5960785, 1, 0, 1,
-0.7651131, -0.3864856, -1.800113, 0.5882353, 1, 0, 1,
-0.763588, 0.3846453, -1.895444, 0.5843138, 1, 0, 1,
-0.7608193, 1.193876, -1.188992, 0.5764706, 1, 0, 1,
-0.759693, 0.775791, -0.6334248, 0.572549, 1, 0, 1,
-0.7575562, 0.549117, -0.8709351, 0.5647059, 1, 0, 1,
-0.7472063, -0.2878529, -1.98174, 0.5607843, 1, 0, 1,
-0.7460508, 0.7304562, -0.0621491, 0.5529412, 1, 0, 1,
-0.7459397, 0.1777318, -2.756626, 0.5490196, 1, 0, 1,
-0.7454416, -0.1921551, -0.7345463, 0.5411765, 1, 0, 1,
-0.743097, -0.6313952, -1.844617, 0.5372549, 1, 0, 1,
-0.7317849, -1.343611, -2.473279, 0.5294118, 1, 0, 1,
-0.72966, -1.01016, -3.224557, 0.5254902, 1, 0, 1,
-0.7270951, 1.43228, -0.9051745, 0.5176471, 1, 0, 1,
-0.7218733, -0.3428225, -1.377072, 0.5137255, 1, 0, 1,
-0.7214297, -1.335549, -1.745618, 0.5058824, 1, 0, 1,
-0.7204199, -1.018225, -2.252267, 0.5019608, 1, 0, 1,
-0.7175199, -1.209492, -3.63905, 0.4941176, 1, 0, 1,
-0.7148229, -1.039859, -3.388361, 0.4862745, 1, 0, 1,
-0.7113652, -0.3034579, -2.706879, 0.4823529, 1, 0, 1,
-0.7093979, -1.584689, -2.209422, 0.4745098, 1, 0, 1,
-0.7085024, 0.7102714, -2.09594, 0.4705882, 1, 0, 1,
-0.7060515, -1.674829, -2.562202, 0.4627451, 1, 0, 1,
-0.7016119, 1.348732, 0.4962966, 0.4588235, 1, 0, 1,
-0.6979523, 0.7225898, -1.619844, 0.4509804, 1, 0, 1,
-0.6970496, -1.077757, -2.332352, 0.4470588, 1, 0, 1,
-0.696982, -0.3294519, -1.092255, 0.4392157, 1, 0, 1,
-0.6942387, 0.4957153, -1.197433, 0.4352941, 1, 0, 1,
-0.6922045, 1.085939, -1.130918, 0.427451, 1, 0, 1,
-0.6887532, 1.239256, -1.943628, 0.4235294, 1, 0, 1,
-0.6828378, 1.036129, 0.9894506, 0.4156863, 1, 0, 1,
-0.6815253, 0.3854693, 0.08940788, 0.4117647, 1, 0, 1,
-0.6781523, 0.3813022, -1.217906, 0.4039216, 1, 0, 1,
-0.6774682, -0.09801696, -1.540013, 0.3960784, 1, 0, 1,
-0.6734168, 1.255321, -1.093386, 0.3921569, 1, 0, 1,
-0.6680571, 0.7888369, 0.4032655, 0.3843137, 1, 0, 1,
-0.6680173, -0.3050982, 0.1046381, 0.3803922, 1, 0, 1,
-0.6669351, -0.6467751, -2.570674, 0.372549, 1, 0, 1,
-0.6621314, 0.3533635, -0.9097746, 0.3686275, 1, 0, 1,
-0.6614195, 0.3192424, -1.689809, 0.3607843, 1, 0, 1,
-0.6601501, -1.624672, -3.398178, 0.3568628, 1, 0, 1,
-0.6498034, -0.7633602, -2.435845, 0.3490196, 1, 0, 1,
-0.6421111, -1.578679, -4.873826, 0.345098, 1, 0, 1,
-0.6403689, 1.728266, -0.9641966, 0.3372549, 1, 0, 1,
-0.6391194, 0.2716216, -1.366877, 0.3333333, 1, 0, 1,
-0.6372228, -1.617066, -3.768646, 0.3254902, 1, 0, 1,
-0.6367853, 0.1307492, -1.259482, 0.3215686, 1, 0, 1,
-0.6312529, 2.363294, 0.6424446, 0.3137255, 1, 0, 1,
-0.6265197, 1.864913, 0.3466696, 0.3098039, 1, 0, 1,
-0.6248899, 0.4373302, -0.4294945, 0.3019608, 1, 0, 1,
-0.6211603, 0.5735274, -0.362365, 0.2941177, 1, 0, 1,
-0.6165404, 0.9320579, 0.4772232, 0.2901961, 1, 0, 1,
-0.6119838, 1.189301, 0.08953147, 0.282353, 1, 0, 1,
-0.6085728, -0.08977322, -1.244224, 0.2784314, 1, 0, 1,
-0.6072252, 1.491381, 0.5643963, 0.2705882, 1, 0, 1,
-0.6068325, 0.2712313, -2.073711, 0.2666667, 1, 0, 1,
-0.6066868, -1.612438, -2.71088, 0.2588235, 1, 0, 1,
-0.6051162, -0.4137715, -3.101227, 0.254902, 1, 0, 1,
-0.6030248, -0.9736178, -3.103889, 0.2470588, 1, 0, 1,
-0.6028859, -1.02681, -4.020443, 0.2431373, 1, 0, 1,
-0.596595, -0.4541385, -1.693834, 0.2352941, 1, 0, 1,
-0.5921947, 0.9445961, -0.1914944, 0.2313726, 1, 0, 1,
-0.591686, 1.11985, 0.1591764, 0.2235294, 1, 0, 1,
-0.5892382, 1.027758, 0.09287049, 0.2196078, 1, 0, 1,
-0.5891873, -1.972384, -1.953881, 0.2117647, 1, 0, 1,
-0.5857717, -0.04138176, -0.7475361, 0.2078431, 1, 0, 1,
-0.5802169, 0.7121022, 0.6326662, 0.2, 1, 0, 1,
-0.5701881, -0.8450845, -0.5642874, 0.1921569, 1, 0, 1,
-0.5654574, 0.00766823, -1.962867, 0.1882353, 1, 0, 1,
-0.5647503, -1.209461, -2.636562, 0.1803922, 1, 0, 1,
-0.5604336, 0.9607242, -1.232288, 0.1764706, 1, 0, 1,
-0.5516157, 2.473321, -0.3771593, 0.1686275, 1, 0, 1,
-0.5484698, 2.384886, -0.3695315, 0.1647059, 1, 0, 1,
-0.5430665, -0.4095259, -2.22358, 0.1568628, 1, 0, 1,
-0.5334649, 2.395513, 0.4056082, 0.1529412, 1, 0, 1,
-0.5292771, -1.13095, -3.795468, 0.145098, 1, 0, 1,
-0.5277995, -1.351452, -3.543364, 0.1411765, 1, 0, 1,
-0.5264559, 0.546691, -0.07898554, 0.1333333, 1, 0, 1,
-0.5254145, -0.8888339, -2.711609, 0.1294118, 1, 0, 1,
-0.5244055, 0.5494817, -0.7557765, 0.1215686, 1, 0, 1,
-0.5216396, 2.74103, 0.9211211, 0.1176471, 1, 0, 1,
-0.5216283, 0.1285292, -2.869603, 0.1098039, 1, 0, 1,
-0.5209657, 0.5767425, -1.436639, 0.1058824, 1, 0, 1,
-0.51858, -1.113508, -3.323169, 0.09803922, 1, 0, 1,
-0.5168149, -0.6530138, -0.5767348, 0.09019608, 1, 0, 1,
-0.5155942, -0.08600328, -1.656595, 0.08627451, 1, 0, 1,
-0.5146301, 0.02846409, -2.4404, 0.07843138, 1, 0, 1,
-0.512614, -0.9473359, -3.281925, 0.07450981, 1, 0, 1,
-0.5118736, -0.3482626, -2.005878, 0.06666667, 1, 0, 1,
-0.5099479, 0.7989229, -0.3640425, 0.0627451, 1, 0, 1,
-0.5084029, 0.6304603, -0.3859333, 0.05490196, 1, 0, 1,
-0.5039958, 0.5180091, -1.801124, 0.05098039, 1, 0, 1,
-0.49057, 2.502834, 0.05454038, 0.04313726, 1, 0, 1,
-0.4788667, -0.06456509, -1.5725, 0.03921569, 1, 0, 1,
-0.4778144, 0.2999361, 0.1187589, 0.03137255, 1, 0, 1,
-0.4762792, -0.4144666, -4.121305, 0.02745098, 1, 0, 1,
-0.4725317, -0.4545833, -2.83583, 0.01960784, 1, 0, 1,
-0.4724464, -0.5603889, -1.7935, 0.01568628, 1, 0, 1,
-0.4689886, 1.614039, -1.142136, 0.007843138, 1, 0, 1,
-0.4667252, -0.04049009, -1.934333, 0.003921569, 1, 0, 1,
-0.4648733, 0.5763524, -1.980702, 0, 1, 0.003921569, 1,
-0.4597524, 1.145543, -0.4419521, 0, 1, 0.01176471, 1,
-0.4526174, -1.242129, -1.60803, 0, 1, 0.01568628, 1,
-0.4510358, -0.3048631, -1.079629, 0, 1, 0.02352941, 1,
-0.4483748, 0.03472025, 0.06742821, 0, 1, 0.02745098, 1,
-0.4482703, 0.1556457, -1.198541, 0, 1, 0.03529412, 1,
-0.4467124, 1.085096, 0.6724945, 0, 1, 0.03921569, 1,
-0.4439347, 0.1246468, -1.846051, 0, 1, 0.04705882, 1,
-0.4434048, 0.2165837, -1.551659, 0, 1, 0.05098039, 1,
-0.4384957, 2.046514, 1.518224, 0, 1, 0.05882353, 1,
-0.4382753, -1.125475, -3.805825, 0, 1, 0.0627451, 1,
-0.4363891, 0.3051646, 0.004771588, 0, 1, 0.07058824, 1,
-0.435753, -0.005632605, -3.010236, 0, 1, 0.07450981, 1,
-0.4310741, 1.546761, -0.7667256, 0, 1, 0.08235294, 1,
-0.4303658, -1.067819, -2.7951, 0, 1, 0.08627451, 1,
-0.4252123, 0.9087356, -2.095011, 0, 1, 0.09411765, 1,
-0.4234107, -0.3654306, -1.43299, 0, 1, 0.1019608, 1,
-0.4179284, 0.6967076, -0.4138919, 0, 1, 0.1058824, 1,
-0.4177506, 0.4559777, -1.943799, 0, 1, 0.1137255, 1,
-0.4169974, -0.2255707, -1.489728, 0, 1, 0.1176471, 1,
-0.4137137, 1.697729, -0.3142745, 0, 1, 0.1254902, 1,
-0.4116128, 0.7547764, -0.7860321, 0, 1, 0.1294118, 1,
-0.410924, -0.9998182, -1.692467, 0, 1, 0.1372549, 1,
-0.4098837, 0.395974, 0.207284, 0, 1, 0.1411765, 1,
-0.4056959, -0.2709021, -2.056652, 0, 1, 0.1490196, 1,
-0.4042469, -1.318686, -1.150396, 0, 1, 0.1529412, 1,
-0.4027833, 0.4540524, -0.3519197, 0, 1, 0.1607843, 1,
-0.401432, 1.964328, -1.872569, 0, 1, 0.1647059, 1,
-0.3971724, -0.4554795, -2.192974, 0, 1, 0.172549, 1,
-0.3968987, -2.891814, -4.025718, 0, 1, 0.1764706, 1,
-0.3951339, -0.5307284, -3.309088, 0, 1, 0.1843137, 1,
-0.3946132, -2.164681, -3.44506, 0, 1, 0.1882353, 1,
-0.3906056, 0.2866126, -3.217889, 0, 1, 0.1960784, 1,
-0.3875629, 0.3143133, -2.251882, 0, 1, 0.2039216, 1,
-0.3822789, 0.3677559, -1.651618, 0, 1, 0.2078431, 1,
-0.3817923, 0.205039, -1.443154, 0, 1, 0.2156863, 1,
-0.3804869, -0.04010252, -2.811843, 0, 1, 0.2196078, 1,
-0.3799638, -1.163237, -2.098128, 0, 1, 0.227451, 1,
-0.3767892, 0.3397076, -4.563481, 0, 1, 0.2313726, 1,
-0.3763184, -0.4894362, -4.109393, 0, 1, 0.2392157, 1,
-0.3747956, 0.007677902, -2.112873, 0, 1, 0.2431373, 1,
-0.3732489, -0.3861795, -2.019786, 0, 1, 0.2509804, 1,
-0.3716051, 1.732124, -1.296804, 0, 1, 0.254902, 1,
-0.3715232, 2.315671, -0.7080333, 0, 1, 0.2627451, 1,
-0.3588028, -0.5835772, -2.817209, 0, 1, 0.2666667, 1,
-0.3563731, 0.3456059, 0.4820116, 0, 1, 0.2745098, 1,
-0.3550741, -0.143485, -2.601575, 0, 1, 0.2784314, 1,
-0.3524326, -0.2310891, -2.116881, 0, 1, 0.2862745, 1,
-0.3515205, 1.870407, -2.609369, 0, 1, 0.2901961, 1,
-0.3474638, -0.43822, -2.795416, 0, 1, 0.2980392, 1,
-0.3334619, -1.63926, -4.846547, 0, 1, 0.3058824, 1,
-0.3329432, 0.2337617, -1.53906, 0, 1, 0.3098039, 1,
-0.3201644, -0.9744715, -3.113678, 0, 1, 0.3176471, 1,
-0.3178896, -1.152766, -3.798727, 0, 1, 0.3215686, 1,
-0.3169948, -1.099532, -3.631047, 0, 1, 0.3294118, 1,
-0.316305, -0.05717767, -3.679707, 0, 1, 0.3333333, 1,
-0.3144279, -1.550572, -1.499398, 0, 1, 0.3411765, 1,
-0.3049518, 1.712757, -0.5680093, 0, 1, 0.345098, 1,
-0.3039452, -0.2987948, -2.570279, 0, 1, 0.3529412, 1,
-0.2993257, 1.142391, -0.2068987, 0, 1, 0.3568628, 1,
-0.2992471, 0.7312475, -1.176979, 0, 1, 0.3647059, 1,
-0.2971168, 1.866531, 0.4455685, 0, 1, 0.3686275, 1,
-0.2928803, -1.604731, -2.284226, 0, 1, 0.3764706, 1,
-0.291264, -0.8392804, -3.090132, 0, 1, 0.3803922, 1,
-0.2893592, 0.01333089, -1.257648, 0, 1, 0.3882353, 1,
-0.2812002, -1.244543, -4.43557, 0, 1, 0.3921569, 1,
-0.2799402, 0.6169633, -0.2052681, 0, 1, 0.4, 1,
-0.2788432, -0.6843123, -2.718872, 0, 1, 0.4078431, 1,
-0.2776506, -0.4833458, -3.582347, 0, 1, 0.4117647, 1,
-0.2727052, 1.598596, -0.3701649, 0, 1, 0.4196078, 1,
-0.2722199, -1.273917, -2.115786, 0, 1, 0.4235294, 1,
-0.2688899, -0.4745522, -3.679311, 0, 1, 0.4313726, 1,
-0.2683373, 1.055267, 0.366997, 0, 1, 0.4352941, 1,
-0.2682125, 0.7284528, -1.224725, 0, 1, 0.4431373, 1,
-0.2663972, -0.1250195, -0.1231738, 0, 1, 0.4470588, 1,
-0.2652578, 1.212322, 0.8448643, 0, 1, 0.454902, 1,
-0.2649128, -0.05187527, -2.482484, 0, 1, 0.4588235, 1,
-0.2643323, -0.5592842, -2.545063, 0, 1, 0.4666667, 1,
-0.260015, -0.6677541, -1.664046, 0, 1, 0.4705882, 1,
-0.2582115, -0.6911831, -1.465772, 0, 1, 0.4784314, 1,
-0.2581779, -0.1704835, -0.8996284, 0, 1, 0.4823529, 1,
-0.2524004, 0.3620229, -0.02924417, 0, 1, 0.4901961, 1,
-0.2496463, 0.6267183, 0.4891079, 0, 1, 0.4941176, 1,
-0.24841, 1.786434, -1.092272, 0, 1, 0.5019608, 1,
-0.2479775, 1.17029, 0.01730736, 0, 1, 0.509804, 1,
-0.2432751, -0.0175482, -1.508208, 0, 1, 0.5137255, 1,
-0.2425862, -2.303464, -1.345974, 0, 1, 0.5215687, 1,
-0.2369047, 1.646796, 0.542652, 0, 1, 0.5254902, 1,
-0.2359128, -1.35014, -3.825633, 0, 1, 0.5333334, 1,
-0.2192349, -0.2291382, -2.865278, 0, 1, 0.5372549, 1,
-0.2165132, 1.3899, -1.371864, 0, 1, 0.5450981, 1,
-0.2140224, -0.09043605, -2.539988, 0, 1, 0.5490196, 1,
-0.2138372, -0.08165937, -2.202586, 0, 1, 0.5568628, 1,
-0.2124357, 1.662249, -1.812583, 0, 1, 0.5607843, 1,
-0.2117245, -1.621444, -4.026353, 0, 1, 0.5686275, 1,
-0.2079864, 0.187436, -0.6982685, 0, 1, 0.572549, 1,
-0.2038906, -1.562902, -3.417002, 0, 1, 0.5803922, 1,
-0.2038014, -0.4430917, -1.903892, 0, 1, 0.5843138, 1,
-0.203627, 1.121219, -1.820786, 0, 1, 0.5921569, 1,
-0.1970442, 0.3212581, -2.00546, 0, 1, 0.5960785, 1,
-0.1948794, -0.7347198, -1.679974, 0, 1, 0.6039216, 1,
-0.189289, -0.05207874, -0.4745235, 0, 1, 0.6117647, 1,
-0.1871122, 3.200075, 0.2978885, 0, 1, 0.6156863, 1,
-0.180446, -1.760607, -3.960614, 0, 1, 0.6235294, 1,
-0.1797409, -0.7616799, -4.918821, 0, 1, 0.627451, 1,
-0.1786382, -1.804538, -4.011708, 0, 1, 0.6352941, 1,
-0.1681853, 1.656437, -0.06495747, 0, 1, 0.6392157, 1,
-0.1676063, -0.4421336, -1.050498, 0, 1, 0.6470588, 1,
-0.1674817, 0.4443147, -1.143888, 0, 1, 0.6509804, 1,
-0.16441, -0.4472415, -4.131169, 0, 1, 0.6588235, 1,
-0.1621021, 0.1149824, -1.862027, 0, 1, 0.6627451, 1,
-0.1606923, 0.1500794, -0.5622236, 0, 1, 0.6705883, 1,
-0.1591159, -0.3007235, -2.020061, 0, 1, 0.6745098, 1,
-0.1587056, 1.494142, -0.5211806, 0, 1, 0.682353, 1,
-0.1583293, -1.573341, -3.170704, 0, 1, 0.6862745, 1,
-0.1555787, -0.2710705, -0.6934897, 0, 1, 0.6941177, 1,
-0.1530013, 1.363238, -2.278458, 0, 1, 0.7019608, 1,
-0.1465122, 1.207336, -0.615288, 0, 1, 0.7058824, 1,
-0.1447, -0.7907769, -3.447386, 0, 1, 0.7137255, 1,
-0.1441169, 1.191121, -1.550792, 0, 1, 0.7176471, 1,
-0.1400707, 1.236622, -1.773245, 0, 1, 0.7254902, 1,
-0.1395366, 1.126367, -1.476606, 0, 1, 0.7294118, 1,
-0.1386124, 0.2461559, -1.902836, 0, 1, 0.7372549, 1,
-0.1344653, -0.1625544, -1.213846, 0, 1, 0.7411765, 1,
-0.125985, 0.4097299, 0.6495479, 0, 1, 0.7490196, 1,
-0.123847, -0.1663842, -2.606121, 0, 1, 0.7529412, 1,
-0.1201701, -1.002366, -4.411796, 0, 1, 0.7607843, 1,
-0.1187904, 0.8096566, 0.5041931, 0, 1, 0.7647059, 1,
-0.1186349, -2.466003, -2.55308, 0, 1, 0.772549, 1,
-0.1156367, -0.7610723, -3.950207, 0, 1, 0.7764706, 1,
-0.1134101, -1.164512, -3.338134, 0, 1, 0.7843137, 1,
-0.1122394, -1.379568, -3.593812, 0, 1, 0.7882353, 1,
-0.1093377, -0.2867814, -3.41982, 0, 1, 0.7960784, 1,
-0.1075559, 0.6661208, 0.6751669, 0, 1, 0.8039216, 1,
-0.1010339, 0.558147, 0.7895104, 0, 1, 0.8078431, 1,
-0.09982064, 1.689616, 0.8345114, 0, 1, 0.8156863, 1,
-0.09728914, -1.857231, -3.400882, 0, 1, 0.8196079, 1,
-0.09458622, -3.235196, -3.081079, 0, 1, 0.827451, 1,
-0.09197004, 0.2720624, -0.04492714, 0, 1, 0.8313726, 1,
-0.08882141, -2.655688, -2.385916, 0, 1, 0.8392157, 1,
-0.08717596, -0.3202852, -3.24179, 0, 1, 0.8431373, 1,
-0.08442757, 0.31853, 0.03793725, 0, 1, 0.8509804, 1,
-0.08118439, -1.107334, -2.831799, 0, 1, 0.854902, 1,
-0.08058272, -0.9910941, -2.945923, 0, 1, 0.8627451, 1,
-0.07794493, 0.2135373, 0.6019439, 0, 1, 0.8666667, 1,
-0.07737728, -0.9833096, -3.533019, 0, 1, 0.8745098, 1,
-0.07597908, -0.1711884, -3.546594, 0, 1, 0.8784314, 1,
-0.07543582, -0.866107, -2.964858, 0, 1, 0.8862745, 1,
-0.07374144, -1.127792, -4.337253, 0, 1, 0.8901961, 1,
-0.0733695, -0.9763424, -3.514061, 0, 1, 0.8980392, 1,
-0.071413, 1.264871, 0.08171716, 0, 1, 0.9058824, 1,
-0.07058767, 0.3577678, -1.333235, 0, 1, 0.9098039, 1,
-0.07050174, 0.7623408, -0.2466519, 0, 1, 0.9176471, 1,
-0.06550715, 0.711818, -1.558152, 0, 1, 0.9215686, 1,
-0.06527221, -0.7746125, -1.941621, 0, 1, 0.9294118, 1,
-0.05963354, -1.406739, -2.635828, 0, 1, 0.9333333, 1,
-0.05818036, 0.04964882, 0.4982722, 0, 1, 0.9411765, 1,
-0.05690109, -0.9554084, -3.812836, 0, 1, 0.945098, 1,
-0.04149995, -0.1071422, -2.627607, 0, 1, 0.9529412, 1,
-0.04096328, -1.869775, -2.827168, 0, 1, 0.9568627, 1,
-0.0395317, 0.7575916, 0.6301593, 0, 1, 0.9647059, 1,
-0.03825236, -2.253201, -3.962091, 0, 1, 0.9686275, 1,
-0.03660585, 0.5190038, 0.04523818, 0, 1, 0.9764706, 1,
-0.03632865, -0.7754408, -0.9861086, 0, 1, 0.9803922, 1,
-0.0304884, -0.9124976, -3.028176, 0, 1, 0.9882353, 1,
-0.02846259, -0.8871862, -4.085534, 0, 1, 0.9921569, 1,
-0.0271909, 0.346898, 0.8608725, 0, 1, 1, 1,
-0.0243223, -0.3848897, -4.602396, 0, 0.9921569, 1, 1,
-0.02293888, 0.5443403, -0.5923352, 0, 0.9882353, 1, 1,
-0.02235172, 0.05543656, -1.622064, 0, 0.9803922, 1, 1,
-0.02206578, 0.5694329, -0.7988904, 0, 0.9764706, 1, 1,
-0.01897666, -0.5954915, -3.361403, 0, 0.9686275, 1, 1,
-0.01813835, -0.2911048, -1.475391, 0, 0.9647059, 1, 1,
-0.01224411, 0.3755298, -0.9715336, 0, 0.9568627, 1, 1,
-0.008769354, 1.050501, -0.3172041, 0, 0.9529412, 1, 1,
-0.00812986, -0.7511264, -4.243231, 0, 0.945098, 1, 1,
-0.008074729, -2.039895, -1.684824, 0, 0.9411765, 1, 1,
-0.00533695, -0.3422513, -3.072743, 0, 0.9333333, 1, 1,
-0.002832195, -0.2483755, -4.420036, 0, 0.9294118, 1, 1,
-0.001440024, -0.09542091, -3.610621, 0, 0.9215686, 1, 1,
-0.0009048496, 1.041463, -1.506612, 0, 0.9176471, 1, 1,
0.0001322056, -0.8200842, 3.449285, 0, 0.9098039, 1, 1,
0.00255456, 1.335607, -0.1921367, 0, 0.9058824, 1, 1,
0.003948958, 1.145836, 0.8953296, 0, 0.8980392, 1, 1,
0.007001595, 0.1691223, -0.9436299, 0, 0.8901961, 1, 1,
0.01056654, -0.8557189, 4.221653, 0, 0.8862745, 1, 1,
0.01813528, -1.718036, 1.779375, 0, 0.8784314, 1, 1,
0.01979582, 0.4478087, 0.1155419, 0, 0.8745098, 1, 1,
0.02086546, 0.01450429, 0.6195313, 0, 0.8666667, 1, 1,
0.02130244, -1.446226, 3.069818, 0, 0.8627451, 1, 1,
0.02526605, -2.449334, 5.014659, 0, 0.854902, 1, 1,
0.02661981, 1.7042, -1.634326, 0, 0.8509804, 1, 1,
0.03186984, -0.7368642, 2.317488, 0, 0.8431373, 1, 1,
0.03341995, 0.1076661, 1.746938, 0, 0.8392157, 1, 1,
0.03414214, -1.004216, 4.721257, 0, 0.8313726, 1, 1,
0.03553639, 0.5890915, 1.303746, 0, 0.827451, 1, 1,
0.03610833, -0.5434846, 3.473969, 0, 0.8196079, 1, 1,
0.03663031, 0.3495133, -0.4801603, 0, 0.8156863, 1, 1,
0.03716178, -0.5838501, 2.958061, 0, 0.8078431, 1, 1,
0.0391085, -0.8106092, 3.723275, 0, 0.8039216, 1, 1,
0.03920384, 0.8849329, 3.155069, 0, 0.7960784, 1, 1,
0.03974804, -0.6296746, 1.562379, 0, 0.7882353, 1, 1,
0.04067118, 0.3140197, 0.4667557, 0, 0.7843137, 1, 1,
0.04214117, 0.6475736, -0.1743158, 0, 0.7764706, 1, 1,
0.04305889, -0.1455769, 1.278296, 0, 0.772549, 1, 1,
0.04579686, -1.591232, 4.330978, 0, 0.7647059, 1, 1,
0.05016059, -0.005932986, 1.463829, 0, 0.7607843, 1, 1,
0.0513633, -0.402136, 4.035765, 0, 0.7529412, 1, 1,
0.0540343, -1.834754, 3.071219, 0, 0.7490196, 1, 1,
0.05429652, 1.693935, -0.04606677, 0, 0.7411765, 1, 1,
0.06801098, -0.1460631, 4.976339, 0, 0.7372549, 1, 1,
0.0683962, -0.513795, 3.798151, 0, 0.7294118, 1, 1,
0.06996635, 0.5665997, 0.7044023, 0, 0.7254902, 1, 1,
0.07019386, -0.6641153, 2.546521, 0, 0.7176471, 1, 1,
0.0729404, -0.2308629, 3.488524, 0, 0.7137255, 1, 1,
0.07337005, -0.4040583, 3.978481, 0, 0.7058824, 1, 1,
0.07680982, 1.161166, -1.539889, 0, 0.6980392, 1, 1,
0.07971172, 0.8181574, 1.13588, 0, 0.6941177, 1, 1,
0.08032452, 0.3671047, 0.6148747, 0, 0.6862745, 1, 1,
0.0830444, 0.5763218, 0.09332881, 0, 0.682353, 1, 1,
0.08615187, -1.125761, 1.763328, 0, 0.6745098, 1, 1,
0.08840289, -0.07242204, 0.9463459, 0, 0.6705883, 1, 1,
0.09207416, 0.8334209, 0.4197637, 0, 0.6627451, 1, 1,
0.09703603, -0.4885779, 2.168999, 0, 0.6588235, 1, 1,
0.09864267, -0.8515465, 2.818497, 0, 0.6509804, 1, 1,
0.09878648, 0.2691254, 0.1940064, 0, 0.6470588, 1, 1,
0.09892657, 0.049883, 0.2469403, 0, 0.6392157, 1, 1,
0.09939983, 0.7365482, -1.202163, 0, 0.6352941, 1, 1,
0.101369, -1.00272, 3.706648, 0, 0.627451, 1, 1,
0.1017258, 2.06983, 0.3285688, 0, 0.6235294, 1, 1,
0.1039371, 0.6117224, -0.5655144, 0, 0.6156863, 1, 1,
0.1059035, -0.5254275, 4.702664, 0, 0.6117647, 1, 1,
0.1064624, -0.1663994, 2.237284, 0, 0.6039216, 1, 1,
0.1094644, -0.5113091, 4.534481, 0, 0.5960785, 1, 1,
0.113075, -1.38363, 2.789869, 0, 0.5921569, 1, 1,
0.1175203, 0.7486339, 1.287784, 0, 0.5843138, 1, 1,
0.1182438, 0.7422881, -0.3628795, 0, 0.5803922, 1, 1,
0.1185323, 0.7085233, 0.7065083, 0, 0.572549, 1, 1,
0.1193528, 0.7319413, 0.07084637, 0, 0.5686275, 1, 1,
0.126371, -0.6339719, 2.280916, 0, 0.5607843, 1, 1,
0.128932, -1.136854, 4.408861, 0, 0.5568628, 1, 1,
0.1298139, 0.3403893, -0.2094257, 0, 0.5490196, 1, 1,
0.1313804, -0.8991439, 3.717637, 0, 0.5450981, 1, 1,
0.1318612, -2.315122, 3.851056, 0, 0.5372549, 1, 1,
0.1347477, 0.1856704, 1.148734, 0, 0.5333334, 1, 1,
0.1357347, -0.2507924, 3.146382, 0, 0.5254902, 1, 1,
0.135786, 1.580351, -1.221348, 0, 0.5215687, 1, 1,
0.1379246, 0.6163648, 1.755538, 0, 0.5137255, 1, 1,
0.1392059, 0.9691091, 0.3923903, 0, 0.509804, 1, 1,
0.1392744, 0.4909311, -0.996647, 0, 0.5019608, 1, 1,
0.1462483, -0.5550843, 3.431196, 0, 0.4941176, 1, 1,
0.1490031, 0.7104973, 0.9391118, 0, 0.4901961, 1, 1,
0.1491012, 0.008164342, 1.542226, 0, 0.4823529, 1, 1,
0.1579963, 0.2957915, 1.377187, 0, 0.4784314, 1, 1,
0.1591978, -0.1829261, 1.929664, 0, 0.4705882, 1, 1,
0.1597882, 0.1016692, 0.7827429, 0, 0.4666667, 1, 1,
0.161904, 1.751206, 0.09605337, 0, 0.4588235, 1, 1,
0.1619902, 0.3580024, 1.388934, 0, 0.454902, 1, 1,
0.1664004, -0.2329632, 1.015458, 0, 0.4470588, 1, 1,
0.1664759, 0.4066167, 1.372039, 0, 0.4431373, 1, 1,
0.1679521, 1.564949, 0.01778217, 0, 0.4352941, 1, 1,
0.1694433, 0.1082998, 1.380149, 0, 0.4313726, 1, 1,
0.1709504, 0.3366302, 1.300868, 0, 0.4235294, 1, 1,
0.1712016, -0.7778175, 2.451131, 0, 0.4196078, 1, 1,
0.1801104, 1.565566, -0.7887807, 0, 0.4117647, 1, 1,
0.1828919, 0.7184135, 2.18537, 0, 0.4078431, 1, 1,
0.1840191, -1.149597, 3.960755, 0, 0.4, 1, 1,
0.1856625, 0.8125581, -1.034039, 0, 0.3921569, 1, 1,
0.1865993, 1.619677, 0.4295652, 0, 0.3882353, 1, 1,
0.1866469, -0.7481156, 1.336708, 0, 0.3803922, 1, 1,
0.1874094, -0.5474722, 3.403421, 0, 0.3764706, 1, 1,
0.1897545, -0.2691338, 2.236264, 0, 0.3686275, 1, 1,
0.1920655, 0.8306406, 0.6834797, 0, 0.3647059, 1, 1,
0.1928945, 0.3163529, -1.80721, 0, 0.3568628, 1, 1,
0.1973455, -2.218452, 2.90005, 0, 0.3529412, 1, 1,
0.1988379, -0.2274587, 4.288757, 0, 0.345098, 1, 1,
0.2012547, 1.061553, 2.157471, 0, 0.3411765, 1, 1,
0.2027747, 0.9877979, 0.1188335, 0, 0.3333333, 1, 1,
0.2085685, -1.02168, 3.149496, 0, 0.3294118, 1, 1,
0.2115204, 0.9013368, 0.2298775, 0, 0.3215686, 1, 1,
0.2164364, 0.655811, 1.339875, 0, 0.3176471, 1, 1,
0.2173051, 0.2242421, 0.1309105, 0, 0.3098039, 1, 1,
0.2209491, 0.4531411, 0.9579617, 0, 0.3058824, 1, 1,
0.22257, -0.4117833, 2.698681, 0, 0.2980392, 1, 1,
0.2274932, 1.862073, 0.5916883, 0, 0.2901961, 1, 1,
0.2288011, 1.306257, -0.3741485, 0, 0.2862745, 1, 1,
0.2337794, -0.2067766, 0.9422308, 0, 0.2784314, 1, 1,
0.2338745, -1.310753, 3.619895, 0, 0.2745098, 1, 1,
0.2339583, -1.338233, 2.626359, 0, 0.2666667, 1, 1,
0.2348886, -0.2449103, 3.391706, 0, 0.2627451, 1, 1,
0.2357406, -0.2078772, 1.730833, 0, 0.254902, 1, 1,
0.2357666, -0.1318203, 2.600746, 0, 0.2509804, 1, 1,
0.2366017, -0.266703, 3.735423, 0, 0.2431373, 1, 1,
0.2374795, -1.602111, 3.480609, 0, 0.2392157, 1, 1,
0.2410309, -0.9927089, 2.938274, 0, 0.2313726, 1, 1,
0.2444979, -0.1302784, 1.227363, 0, 0.227451, 1, 1,
0.247829, 1.568005, -0.801474, 0, 0.2196078, 1, 1,
0.2507793, -0.08870768, 2.626717, 0, 0.2156863, 1, 1,
0.250905, 0.8753785, 0.03629577, 0, 0.2078431, 1, 1,
0.2545631, 1.689312, -0.03785394, 0, 0.2039216, 1, 1,
0.2546144, 0.1178825, 1.42034, 0, 0.1960784, 1, 1,
0.2554142, -0.7389208, 3.461943, 0, 0.1882353, 1, 1,
0.2607903, -0.5467835, 3.168998, 0, 0.1843137, 1, 1,
0.2656942, -0.4231145, 1.432801, 0, 0.1764706, 1, 1,
0.2671745, 1.181725, -1.036994, 0, 0.172549, 1, 1,
0.2674575, -1.304627, 3.505763, 0, 0.1647059, 1, 1,
0.2776389, 1.895311, 0.4867312, 0, 0.1607843, 1, 1,
0.2800932, -0.3656306, 1.987206, 0, 0.1529412, 1, 1,
0.2831056, -0.1404797, 2.840462, 0, 0.1490196, 1, 1,
0.2873849, 1.289221, 0.068835, 0, 0.1411765, 1, 1,
0.287646, -2.244589, 2.136979, 0, 0.1372549, 1, 1,
0.2887482, -0.7057611, 4.835909, 0, 0.1294118, 1, 1,
0.2918624, 0.2985868, 0.722958, 0, 0.1254902, 1, 1,
0.2919302, 0.6127257, 1.409525, 0, 0.1176471, 1, 1,
0.2919695, -0.5482883, 3.256006, 0, 0.1137255, 1, 1,
0.2924011, 0.8848637, 0.2531521, 0, 0.1058824, 1, 1,
0.2938853, -0.02008818, 2.452355, 0, 0.09803922, 1, 1,
0.2985129, -0.4248593, 2.394382, 0, 0.09411765, 1, 1,
0.3023575, 0.2610289, 1.078153, 0, 0.08627451, 1, 1,
0.3044896, 0.2236907, 1.230211, 0, 0.08235294, 1, 1,
0.310781, 0.9222347, 0.4032951, 0, 0.07450981, 1, 1,
0.3113191, 0.2648594, 1.672311, 0, 0.07058824, 1, 1,
0.3113542, -0.9794784, 3.2059, 0, 0.0627451, 1, 1,
0.31408, -1.226013, 1.05715, 0, 0.05882353, 1, 1,
0.3155712, 1.408759, 0.8151295, 0, 0.05098039, 1, 1,
0.3193, 0.894696, 0.4661244, 0, 0.04705882, 1, 1,
0.3228793, 0.4170889, -0.1209989, 0, 0.03921569, 1, 1,
0.3229341, 0.1501205, 1.029191, 0, 0.03529412, 1, 1,
0.323835, -0.5398431, 2.279605, 0, 0.02745098, 1, 1,
0.3254002, -0.1317932, 0.9931281, 0, 0.02352941, 1, 1,
0.3267222, -0.0672827, -0.0931147, 0, 0.01568628, 1, 1,
0.3296491, -0.3009946, 2.841558, 0, 0.01176471, 1, 1,
0.3307476, 1.220522, -0.2219582, 0, 0.003921569, 1, 1,
0.3327413, 0.1185966, 1.685642, 0.003921569, 0, 1, 1,
0.3346134, 1.390307, -0.206118, 0.007843138, 0, 1, 1,
0.3405305, -1.286379, 3.777374, 0.01568628, 0, 1, 1,
0.3416212, 0.751852, -0.2416264, 0.01960784, 0, 1, 1,
0.3457813, -0.3886313, 2.675432, 0.02745098, 0, 1, 1,
0.3538035, 1.117095, 1.327789, 0.03137255, 0, 1, 1,
0.3563716, -1.115057, 4.141801, 0.03921569, 0, 1, 1,
0.3570415, 1.817376, 0.8217871, 0.04313726, 0, 1, 1,
0.3583094, 0.06741538, 0.3816068, 0.05098039, 0, 1, 1,
0.3757383, -0.5507051, 2.705706, 0.05490196, 0, 1, 1,
0.3776216, 2.204729, 1.664766, 0.0627451, 0, 1, 1,
0.3790155, -0.206342, 1.124778, 0.06666667, 0, 1, 1,
0.3847743, -1.035627, 2.960706, 0.07450981, 0, 1, 1,
0.3870117, -0.368234, 2.414675, 0.07843138, 0, 1, 1,
0.3905411, 0.345596, 0.9696776, 0.08627451, 0, 1, 1,
0.3924644, -0.9009088, 2.693693, 0.09019608, 0, 1, 1,
0.3946049, 0.9164615, 0.726335, 0.09803922, 0, 1, 1,
0.4005975, -1.467866, 4.515162, 0.1058824, 0, 1, 1,
0.4008096, -1.939615, 3.480999, 0.1098039, 0, 1, 1,
0.4038935, -0.8807025, 1.47, 0.1176471, 0, 1, 1,
0.4040982, -0.5636668, 2.555933, 0.1215686, 0, 1, 1,
0.4074988, -0.4620814, 2.057691, 0.1294118, 0, 1, 1,
0.4111861, 1.383639, 1.420157, 0.1333333, 0, 1, 1,
0.4153514, -1.142631, 4.14597, 0.1411765, 0, 1, 1,
0.4192958, -0.805294, 1.962695, 0.145098, 0, 1, 1,
0.420251, -0.6485513, 2.336659, 0.1529412, 0, 1, 1,
0.4211935, 1.312519, 0.3397817, 0.1568628, 0, 1, 1,
0.4224524, 0.4605681, 0.8548737, 0.1647059, 0, 1, 1,
0.4225923, -0.8529929, 2.254533, 0.1686275, 0, 1, 1,
0.4266858, 0.1569164, 2.007913, 0.1764706, 0, 1, 1,
0.4283611, 0.6603686, 0.7877234, 0.1803922, 0, 1, 1,
0.4310995, -0.4596346, 1.929601, 0.1882353, 0, 1, 1,
0.437811, 0.7261984, -0.3404833, 0.1921569, 0, 1, 1,
0.4392662, 1.406533, 0.9774876, 0.2, 0, 1, 1,
0.4407885, -1.218821, 2.97737, 0.2078431, 0, 1, 1,
0.4425469, 2.281058, 0.4412383, 0.2117647, 0, 1, 1,
0.4486932, 0.3982256, 1.57854, 0.2196078, 0, 1, 1,
0.4495251, -1.112191, 2.969537, 0.2235294, 0, 1, 1,
0.4538091, 0.7925783, 1.08438, 0.2313726, 0, 1, 1,
0.4548371, -0.586123, 4.344011, 0.2352941, 0, 1, 1,
0.4553182, 0.826965, -1.283544, 0.2431373, 0, 1, 1,
0.4581335, 1.073501, -0.1183469, 0.2470588, 0, 1, 1,
0.4656636, 0.001384145, -0.004947448, 0.254902, 0, 1, 1,
0.4689164, 0.03166494, 2.589621, 0.2588235, 0, 1, 1,
0.4697169, 0.03605605, 0.6962569, 0.2666667, 0, 1, 1,
0.4732173, 0.3609559, -0.0200969, 0.2705882, 0, 1, 1,
0.4903062, 0.1127148, 1.656852, 0.2784314, 0, 1, 1,
0.4910955, -1.053682, 1.827774, 0.282353, 0, 1, 1,
0.4914121, -1.732608, 3.503229, 0.2901961, 0, 1, 1,
0.49386, 1.976252, -0.9680244, 0.2941177, 0, 1, 1,
0.4961286, 0.2412186, 0.7184089, 0.3019608, 0, 1, 1,
0.5051094, -0.128134, 1.668944, 0.3098039, 0, 1, 1,
0.5051481, 1.589871, 1.294431, 0.3137255, 0, 1, 1,
0.5112635, -0.3951623, 2.09875, 0.3215686, 0, 1, 1,
0.5151907, 1.654675, 0.01571439, 0.3254902, 0, 1, 1,
0.5167592, 1.838609, -2.092203, 0.3333333, 0, 1, 1,
0.5190723, -2.160002, 2.002171, 0.3372549, 0, 1, 1,
0.5240334, -1.25053, 2.648456, 0.345098, 0, 1, 1,
0.5240749, 0.8887253, -0.3231443, 0.3490196, 0, 1, 1,
0.5279971, 0.9357404, -1.15617, 0.3568628, 0, 1, 1,
0.5301823, 0.2598157, -0.04180964, 0.3607843, 0, 1, 1,
0.5303109, 0.5844599, 0.6333049, 0.3686275, 0, 1, 1,
0.5316048, 2.083325, -0.2138157, 0.372549, 0, 1, 1,
0.531967, 0.2921571, 1.142284, 0.3803922, 0, 1, 1,
0.5326609, -1.321417, 2.08759, 0.3843137, 0, 1, 1,
0.5339347, 0.3453363, 0.8849854, 0.3921569, 0, 1, 1,
0.5380126, -0.2197767, 1.884548, 0.3960784, 0, 1, 1,
0.5394082, -1.228008, 1.31262, 0.4039216, 0, 1, 1,
0.5449876, 1.481557, -0.7605423, 0.4117647, 0, 1, 1,
0.5486971, -0.7230489, 0.6567842, 0.4156863, 0, 1, 1,
0.5494254, -0.667418, 3.285995, 0.4235294, 0, 1, 1,
0.5508811, 2.180181, -1.527133, 0.427451, 0, 1, 1,
0.5512414, -0.5056516, 2.776466, 0.4352941, 0, 1, 1,
0.5557114, -1.402525, 2.133031, 0.4392157, 0, 1, 1,
0.5595158, -0.3925104, 1.509786, 0.4470588, 0, 1, 1,
0.5619659, -1.55392, 5.55964, 0.4509804, 0, 1, 1,
0.5668304, 0.1023833, 1.103628, 0.4588235, 0, 1, 1,
0.5842022, 1.366425, 2.028173, 0.4627451, 0, 1, 1,
0.5891681, 2.297709, 0.09726957, 0.4705882, 0, 1, 1,
0.5946949, 0.4962577, 0.4211143, 0.4745098, 0, 1, 1,
0.5947484, 1.302447, -0.134829, 0.4823529, 0, 1, 1,
0.5958276, -0.2030539, 1.563443, 0.4862745, 0, 1, 1,
0.5961467, -0.2267007, 0.8570869, 0.4941176, 0, 1, 1,
0.5964478, 1.430079, 1.477933, 0.5019608, 0, 1, 1,
0.597822, -1.278337, 3.336368, 0.5058824, 0, 1, 1,
0.5980348, -0.6962306, 1.062826, 0.5137255, 0, 1, 1,
0.602494, 0.2586511, 1.6021, 0.5176471, 0, 1, 1,
0.6025349, -0.1385926, 1.829039, 0.5254902, 0, 1, 1,
0.604228, 0.5694548, -1.04989, 0.5294118, 0, 1, 1,
0.6215845, 0.01582728, 2.149814, 0.5372549, 0, 1, 1,
0.6244702, -0.6044459, 2.233174, 0.5411765, 0, 1, 1,
0.6252828, -0.8077875, 2.92186, 0.5490196, 0, 1, 1,
0.6274142, 0.3898408, 1.403742, 0.5529412, 0, 1, 1,
0.6302538, 0.6784487, 0.5148117, 0.5607843, 0, 1, 1,
0.6526345, 1.806619, 0.4193663, 0.5647059, 0, 1, 1,
0.6536166, 1.981811, -0.6548015, 0.572549, 0, 1, 1,
0.6611977, 0.2207254, 1.411779, 0.5764706, 0, 1, 1,
0.663652, 0.3603281, 0.6778123, 0.5843138, 0, 1, 1,
0.6688182, -2.001468, 2.123254, 0.5882353, 0, 1, 1,
0.6715754, 1.580081, 1.104142, 0.5960785, 0, 1, 1,
0.6739255, 1.622671, 1.080075, 0.6039216, 0, 1, 1,
0.6746178, 0.07498185, 0.9503005, 0.6078432, 0, 1, 1,
0.6850618, -1.333291, 1.666826, 0.6156863, 0, 1, 1,
0.6892911, 1.376256, 0.9370541, 0.6196079, 0, 1, 1,
0.6911841, -0.1832735, 1.767215, 0.627451, 0, 1, 1,
0.6974125, -2.046317, 1.874015, 0.6313726, 0, 1, 1,
0.698655, -2.55494, 2.712416, 0.6392157, 0, 1, 1,
0.7087715, -0.3396837, 1.362934, 0.6431373, 0, 1, 1,
0.7130287, 1.496768, 0.1826791, 0.6509804, 0, 1, 1,
0.7182345, -0.3492636, 3.376635, 0.654902, 0, 1, 1,
0.7246541, 0.0227612, 1.085431, 0.6627451, 0, 1, 1,
0.72509, -0.377385, 2.031118, 0.6666667, 0, 1, 1,
0.7348325, 0.2405015, 1.964644, 0.6745098, 0, 1, 1,
0.7396029, -1.314036, 0.8989093, 0.6784314, 0, 1, 1,
0.7446031, -0.4941481, 1.298144, 0.6862745, 0, 1, 1,
0.7451684, -0.5542461, -0.2419457, 0.6901961, 0, 1, 1,
0.7466815, 0.7577833, 1.581987, 0.6980392, 0, 1, 1,
0.7482744, -0.3631949, 2.747503, 0.7058824, 0, 1, 1,
0.7492364, -0.5099304, 2.941198, 0.7098039, 0, 1, 1,
0.7555804, -1.393195, 1.097902, 0.7176471, 0, 1, 1,
0.7574545, 0.461435, 0.6736928, 0.7215686, 0, 1, 1,
0.7596996, -0.2152264, 2.899779, 0.7294118, 0, 1, 1,
0.760119, -0.3397832, 0.1666394, 0.7333333, 0, 1, 1,
0.7623156, -0.2910129, 3.458893, 0.7411765, 0, 1, 1,
0.7638056, -1.224982, 2.177981, 0.7450981, 0, 1, 1,
0.7722844, -0.2732997, -1.29333, 0.7529412, 0, 1, 1,
0.773755, -0.3128875, 1.436181, 0.7568628, 0, 1, 1,
0.7767468, -0.8673002, 3.030043, 0.7647059, 0, 1, 1,
0.7805579, 0.3848564, 2.128973, 0.7686275, 0, 1, 1,
0.7813939, -0.9347931, 2.403468, 0.7764706, 0, 1, 1,
0.7817428, -0.4492089, 4.129654, 0.7803922, 0, 1, 1,
0.7840187, 0.2435705, 1.281611, 0.7882353, 0, 1, 1,
0.7842616, -0.3485144, 3.467682, 0.7921569, 0, 1, 1,
0.7899644, 0.04010192, 1.57987, 0.8, 0, 1, 1,
0.792744, -1.383394, 1.879733, 0.8078431, 0, 1, 1,
0.7951002, 1.233221, 1.51452, 0.8117647, 0, 1, 1,
0.7956493, 1.671423, -0.1389419, 0.8196079, 0, 1, 1,
0.7981768, 1.245138, -0.8091807, 0.8235294, 0, 1, 1,
0.7997716, 0.7308818, 1.558602, 0.8313726, 0, 1, 1,
0.7999721, -0.4354631, 1.419601, 0.8352941, 0, 1, 1,
0.8011708, -0.4157309, 3.352186, 0.8431373, 0, 1, 1,
0.8018132, -1.048775, 2.373587, 0.8470588, 0, 1, 1,
0.8022676, 0.5389279, 1.199323, 0.854902, 0, 1, 1,
0.807816, 0.3175826, 1.252903, 0.8588235, 0, 1, 1,
0.812694, -0.1076734, 0.3126852, 0.8666667, 0, 1, 1,
0.8130907, 0.3322175, 0.5424323, 0.8705882, 0, 1, 1,
0.8259773, 1.121255, 2.122475, 0.8784314, 0, 1, 1,
0.8268645, 0.987255, -0.1276424, 0.8823529, 0, 1, 1,
0.8270988, 1.065508, 0.2341794, 0.8901961, 0, 1, 1,
0.8320603, -1.664333, 1.80496, 0.8941177, 0, 1, 1,
0.8389894, 1.282797, 1.688816, 0.9019608, 0, 1, 1,
0.8421423, 1.124725, 0.9218313, 0.9098039, 0, 1, 1,
0.8441955, -0.3196126, 0.8340638, 0.9137255, 0, 1, 1,
0.8482309, -0.9952806, 1.41106, 0.9215686, 0, 1, 1,
0.8523302, 0.09823511, 1.627513, 0.9254902, 0, 1, 1,
0.8539104, -0.9965459, 2.493612, 0.9333333, 0, 1, 1,
0.8556141, -0.999674, 3.742482, 0.9372549, 0, 1, 1,
0.8628663, 0.2106027, 1.644978, 0.945098, 0, 1, 1,
0.8635224, -0.1829005, 3.583458, 0.9490196, 0, 1, 1,
0.8637627, 1.976081, 1.599634, 0.9568627, 0, 1, 1,
0.871527, 0.654248, 1.19504, 0.9607843, 0, 1, 1,
0.87462, 1.189454, -0.6390004, 0.9686275, 0, 1, 1,
0.8807154, -1.72384, 1.927047, 0.972549, 0, 1, 1,
0.8820624, -0.202213, 1.561212, 0.9803922, 0, 1, 1,
0.884172, 1.990562, 0.1078596, 0.9843137, 0, 1, 1,
0.8846284, 0.3839908, 1.159605, 0.9921569, 0, 1, 1,
0.8871966, -1.336513, 1.96986, 0.9960784, 0, 1, 1,
0.8901268, -0.05794213, 2.223716, 1, 0, 0.9960784, 1,
0.8913847, -1.070968, 2.775926, 1, 0, 0.9882353, 1,
0.8938603, -0.811468, 1.2179, 1, 0, 0.9843137, 1,
0.8982662, 1.295277, 1.596173, 1, 0, 0.9764706, 1,
0.9002575, -0.8288895, 3.703768, 1, 0, 0.972549, 1,
0.9073756, -0.6953273, 1.536965, 1, 0, 0.9647059, 1,
0.9127569, -0.263787, 3.351222, 1, 0, 0.9607843, 1,
0.9489157, -0.2593079, 3.05848, 1, 0, 0.9529412, 1,
0.9492999, 0.0890673, 1.186701, 1, 0, 0.9490196, 1,
0.9523258, 0.2028421, 1.766733, 1, 0, 0.9411765, 1,
0.9562965, -0.4007401, 3.104138, 1, 0, 0.9372549, 1,
0.9577482, -0.8683698, 2.969289, 1, 0, 0.9294118, 1,
0.9673213, -0.762388, 2.445997, 1, 0, 0.9254902, 1,
0.9681167, 2.176877, 1.570563, 1, 0, 0.9176471, 1,
0.9746326, 0.8708179, 0.5821484, 1, 0, 0.9137255, 1,
0.9749255, 0.6469977, 0.465314, 1, 0, 0.9058824, 1,
0.9782474, -1.310219, 3.771512, 1, 0, 0.9019608, 1,
0.9800531, 0.8294535, -0.1249191, 1, 0, 0.8941177, 1,
0.9858967, -0.5610824, 1.376149, 1, 0, 0.8862745, 1,
0.98802, 0.3613415, 0.6907191, 1, 0, 0.8823529, 1,
0.9900934, 1.602945, -1.472278, 1, 0, 0.8745098, 1,
0.9927993, -0.4255607, 1.817613, 1, 0, 0.8705882, 1,
0.9932871, -0.235073, 3.655662, 1, 0, 0.8627451, 1,
0.9985231, 2.138842, 0.169543, 1, 0, 0.8588235, 1,
1.002744, -0.7110878, -0.08073016, 1, 0, 0.8509804, 1,
1.007841, -1.592675, 2.336639, 1, 0, 0.8470588, 1,
1.018533, 0.477209, 0.4736501, 1, 0, 0.8392157, 1,
1.024244, -0.2067625, 3.83625, 1, 0, 0.8352941, 1,
1.034595, 0.4669769, 2.510327, 1, 0, 0.827451, 1,
1.03695, 0.7388131, 1.583548, 1, 0, 0.8235294, 1,
1.042359, 0.8932825, 1.774538, 1, 0, 0.8156863, 1,
1.04527, -0.003553902, 0.5506333, 1, 0, 0.8117647, 1,
1.053099, -0.9028794, 1.171391, 1, 0, 0.8039216, 1,
1.059832, 0.4503327, 1.338084, 1, 0, 0.7960784, 1,
1.060416, 1.377879, 0.5827038, 1, 0, 0.7921569, 1,
1.074823, 0.3181576, 0.09109774, 1, 0, 0.7843137, 1,
1.080379, 1.505237, 0.1932213, 1, 0, 0.7803922, 1,
1.093274, 1.278439, 1.273782, 1, 0, 0.772549, 1,
1.09489, -0.4448071, 2.435719, 1, 0, 0.7686275, 1,
1.109305, 1.666436, -0.02612821, 1, 0, 0.7607843, 1,
1.109573, -0.2659319, 2.007639, 1, 0, 0.7568628, 1,
1.113827, 0.3642292, 1.832363, 1, 0, 0.7490196, 1,
1.1258, 0.3929033, 1.178384, 1, 0, 0.7450981, 1,
1.133819, -1.995293, 2.600558, 1, 0, 0.7372549, 1,
1.135932, 1.196859, 3.152724, 1, 0, 0.7333333, 1,
1.146618, 0.4868542, 0.9824452, 1, 0, 0.7254902, 1,
1.151357, -0.8568184, 2.038663, 1, 0, 0.7215686, 1,
1.157356, -1.150393, 2.650774, 1, 0, 0.7137255, 1,
1.164321, -1.250924, 4.431715, 1, 0, 0.7098039, 1,
1.174336, 0.5786672, 0.2638519, 1, 0, 0.7019608, 1,
1.182983, -0.1197194, 1.865476, 1, 0, 0.6941177, 1,
1.190599, 0.2158447, 1.319165, 1, 0, 0.6901961, 1,
1.199407, -3.015751, 3.877434, 1, 0, 0.682353, 1,
1.208943, 0.607207, 0.4314796, 1, 0, 0.6784314, 1,
1.209852, -0.03554543, 1.563066, 1, 0, 0.6705883, 1,
1.211215, -1.197319, 2.278736, 1, 0, 0.6666667, 1,
1.21147, -0.4904258, 3.17796, 1, 0, 0.6588235, 1,
1.223325, -0.4096393, 2.355175, 1, 0, 0.654902, 1,
1.224632, 0.1107392, 1.09513, 1, 0, 0.6470588, 1,
1.227285, 0.09083288, 0.3498436, 1, 0, 0.6431373, 1,
1.228395, -0.3187432, 1.611713, 1, 0, 0.6352941, 1,
1.228481, -0.6098371, 3.901207, 1, 0, 0.6313726, 1,
1.229778, 1.064042, 1.860373, 1, 0, 0.6235294, 1,
1.238705, 0.3854833, 1.590956, 1, 0, 0.6196079, 1,
1.244446, -0.2949585, 1.941728, 1, 0, 0.6117647, 1,
1.252604, 0.676604, 1.144889, 1, 0, 0.6078432, 1,
1.264847, -0.2960898, 1.827851, 1, 0, 0.6, 1,
1.265403, 0.4761547, 0.4332378, 1, 0, 0.5921569, 1,
1.278422, -0.4179397, 2.727091, 1, 0, 0.5882353, 1,
1.287959, -0.3185498, 0.5454788, 1, 0, 0.5803922, 1,
1.294535, -0.1681449, 1.813552, 1, 0, 0.5764706, 1,
1.307019, 0.5360172, 1.00191, 1, 0, 0.5686275, 1,
1.334428, 1.144912, 0.6510237, 1, 0, 0.5647059, 1,
1.355528, 0.358293, 1.111421, 1, 0, 0.5568628, 1,
1.357784, 0.6989508, 0.9085867, 1, 0, 0.5529412, 1,
1.361477, 0.1324431, 1.753201, 1, 0, 0.5450981, 1,
1.365628, 1.046707, -0.1641994, 1, 0, 0.5411765, 1,
1.381827, 2.191485, 2.029308, 1, 0, 0.5333334, 1,
1.386621, -0.6234048, 1.589005, 1, 0, 0.5294118, 1,
1.421462, 0.1317129, 1.874669, 1, 0, 0.5215687, 1,
1.430164, 0.557843, 2.52859, 1, 0, 0.5176471, 1,
1.43063, 0.7645009, 1.208191, 1, 0, 0.509804, 1,
1.437809, 0.7244233, 2.36951, 1, 0, 0.5058824, 1,
1.438956, 0.1971766, 1.280722, 1, 0, 0.4980392, 1,
1.445635, -1.586167, 2.279093, 1, 0, 0.4901961, 1,
1.448518, -0.3065409, 0.8310224, 1, 0, 0.4862745, 1,
1.449049, -0.5763644, 2.451129, 1, 0, 0.4784314, 1,
1.450421, 0.03248858, 3.397629, 1, 0, 0.4745098, 1,
1.451478, -1.357999, 1.182507, 1, 0, 0.4666667, 1,
1.465852, 0.09434852, 0.8392283, 1, 0, 0.4627451, 1,
1.467063, 1.364455, 1.027254, 1, 0, 0.454902, 1,
1.474926, 0.2137978, 2.221471, 1, 0, 0.4509804, 1,
1.476462, -0.7928165, 2.753822, 1, 0, 0.4431373, 1,
1.501317, 0.6199497, 1.750505, 1, 0, 0.4392157, 1,
1.504078, 0.6751071, 0.3397759, 1, 0, 0.4313726, 1,
1.51719, 0.2818025, 1.293506, 1, 0, 0.427451, 1,
1.519721, -0.9579487, 2.322224, 1, 0, 0.4196078, 1,
1.53577, -0.3678215, 2.873683, 1, 0, 0.4156863, 1,
1.548635, 1.382028, 1.318487, 1, 0, 0.4078431, 1,
1.55055, -0.6557342, 3.595085, 1, 0, 0.4039216, 1,
1.56728, 1.242127, 0.9305044, 1, 0, 0.3960784, 1,
1.570935, -0.4489949, 1.546363, 1, 0, 0.3882353, 1,
1.571229, 1.253555, -0.01063991, 1, 0, 0.3843137, 1,
1.572432, 0.2558981, 3.208445, 1, 0, 0.3764706, 1,
1.574934, -0.2434476, 2.290391, 1, 0, 0.372549, 1,
1.604432, -0.8144978, 2.091489, 1, 0, 0.3647059, 1,
1.60471, -0.4982188, 4.13707, 1, 0, 0.3607843, 1,
1.605639, 0.6365482, -0.1244728, 1, 0, 0.3529412, 1,
1.613913, -3.044477, 2.809728, 1, 0, 0.3490196, 1,
1.620486, -0.9804063, 2.807787, 1, 0, 0.3411765, 1,
1.627425, 0.04079931, 1.195393, 1, 0, 0.3372549, 1,
1.640923, -1.263948, 0.8308308, 1, 0, 0.3294118, 1,
1.64195, 1.307655, 0.7806348, 1, 0, 0.3254902, 1,
1.668638, 0.2835042, 0.1792336, 1, 0, 0.3176471, 1,
1.687879, 1.231104, 1.380723, 1, 0, 0.3137255, 1,
1.688251, -1.332993, 1.903538, 1, 0, 0.3058824, 1,
1.694898, -0.06785557, 1.263019, 1, 0, 0.2980392, 1,
1.714713, -1.085107, 3.843577, 1, 0, 0.2941177, 1,
1.718499, -0.8678685, 1.709156, 1, 0, 0.2862745, 1,
1.721144, 2.090151, 1.190002, 1, 0, 0.282353, 1,
1.731659, -2.092131, 3.599635, 1, 0, 0.2745098, 1,
1.73761, 1.183899, 2.125946, 1, 0, 0.2705882, 1,
1.743804, 0.6415704, 2.035736, 1, 0, 0.2627451, 1,
1.749327, 0.1086349, -0.5054492, 1, 0, 0.2588235, 1,
1.758033, -1.899451, 3.31265, 1, 0, 0.2509804, 1,
1.782134, 0.6104017, 1.701639, 1, 0, 0.2470588, 1,
1.782778, 1.122354, 2.961914, 1, 0, 0.2392157, 1,
1.784742, 0.06502847, 0.4680765, 1, 0, 0.2352941, 1,
1.798112, 0.6357799, 0.9824734, 1, 0, 0.227451, 1,
1.820423, -0.1015338, 1.996604, 1, 0, 0.2235294, 1,
1.848587, 0.1380267, 1.404955, 1, 0, 0.2156863, 1,
1.852817, 0.1292291, 2.010035, 1, 0, 0.2117647, 1,
1.884998, -1.783466, 0.7484198, 1, 0, 0.2039216, 1,
1.886429, -0.6775916, 0.7841558, 1, 0, 0.1960784, 1,
1.926253, 0.5399466, -0.2016965, 1, 0, 0.1921569, 1,
1.93635, 1.734887, 1.636717, 1, 0, 0.1843137, 1,
1.940981, 0.3503731, 1.058536, 1, 0, 0.1803922, 1,
1.951597, -0.5054046, 0.8367639, 1, 0, 0.172549, 1,
1.955297, -0.4057349, 1.753408, 1, 0, 0.1686275, 1,
1.987462, 0.9113756, 1.36609, 1, 0, 0.1607843, 1,
1.987921, 0.403702, 0.6074068, 1, 0, 0.1568628, 1,
2.001873, -0.1430887, 3.151263, 1, 0, 0.1490196, 1,
2.011035, 0.1572816, 0.4233462, 1, 0, 0.145098, 1,
2.013515, -1.594712, 3.348589, 1, 0, 0.1372549, 1,
2.015017, -0.1052407, 0.8317079, 1, 0, 0.1333333, 1,
2.043886, 0.1326025, 1.194241, 1, 0, 0.1254902, 1,
2.167834, 0.8409839, 2.179518, 1, 0, 0.1215686, 1,
2.200552, 3.118931, 1.734099, 1, 0, 0.1137255, 1,
2.278889, 1.687465, 2.354378, 1, 0, 0.1098039, 1,
2.304584, -0.6691688, 3.031433, 1, 0, 0.1019608, 1,
2.306485, -0.173842, 3.39914, 1, 0, 0.09411765, 1,
2.31145, -0.04900825, 2.199297, 1, 0, 0.09019608, 1,
2.318686, 0.06195075, 1.377735, 1, 0, 0.08235294, 1,
2.337045, -0.8501621, 2.341202, 1, 0, 0.07843138, 1,
2.357533, -0.03187474, 3.95211, 1, 0, 0.07058824, 1,
2.380895, -0.3063617, 2.135831, 1, 0, 0.06666667, 1,
2.384503, 0.973621, 1.991516, 1, 0, 0.05882353, 1,
2.419086, 1.360772, 0.7749707, 1, 0, 0.05490196, 1,
2.451947, 1.219875, 2.138219, 1, 0, 0.04705882, 1,
2.580226, -0.9617623, 2.163898, 1, 0, 0.04313726, 1,
2.618483, 1.074158, 0.7032658, 1, 0, 0.03529412, 1,
2.651278, -1.007379, 2.126312, 1, 0, 0.03137255, 1,
2.851079, -0.9601918, 1.240221, 1, 0, 0.02352941, 1,
3.189037, -0.4442635, 2.405296, 1, 0, 0.01960784, 1,
3.210711, -0.3756604, 1.398867, 1, 0, 0.01176471, 1,
3.229292, -0.3974467, 1.214489, 1, 0, 0.007843138, 1
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
-0.1580994, -4.419472, -6.694921, 0, -0.5, 0.5, 0.5,
-0.1580994, -4.419472, -6.694921, 1, -0.5, 0.5, 0.5,
-0.1580994, -4.419472, -6.694921, 1, 1.5, 0.5, 0.5,
-0.1580994, -4.419472, -6.694921, 0, 1.5, 0.5, 0.5
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
-4.693817, -0.0575335, -6.694921, 0, -0.5, 0.5, 0.5,
-4.693817, -0.0575335, -6.694921, 1, -0.5, 0.5, 0.5,
-4.693817, -0.0575335, -6.694921, 1, 1.5, 0.5, 0.5,
-4.693817, -0.0575335, -6.694921, 0, 1.5, 0.5, 0.5
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
-4.693817, -4.419472, 0.3204093, 0, -0.5, 0.5, 0.5,
-4.693817, -4.419472, 0.3204093, 1, -0.5, 0.5, 0.5,
-4.693817, -4.419472, 0.3204093, 1, 1.5, 0.5, 0.5,
-4.693817, -4.419472, 0.3204093, 0, 1.5, 0.5, 0.5
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
-3, -3.412871, -5.075998,
3, -3.412871, -5.075998,
-3, -3.412871, -5.075998,
-3, -3.580637, -5.345819,
-2, -3.412871, -5.075998,
-2, -3.580637, -5.345819,
-1, -3.412871, -5.075998,
-1, -3.580637, -5.345819,
0, -3.412871, -5.075998,
0, -3.580637, -5.345819,
1, -3.412871, -5.075998,
1, -3.580637, -5.345819,
2, -3.412871, -5.075998,
2, -3.580637, -5.345819,
3, -3.412871, -5.075998,
3, -3.580637, -5.345819
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
-3, -3.916171, -5.885459, 0, -0.5, 0.5, 0.5,
-3, -3.916171, -5.885459, 1, -0.5, 0.5, 0.5,
-3, -3.916171, -5.885459, 1, 1.5, 0.5, 0.5,
-3, -3.916171, -5.885459, 0, 1.5, 0.5, 0.5,
-2, -3.916171, -5.885459, 0, -0.5, 0.5, 0.5,
-2, -3.916171, -5.885459, 1, -0.5, 0.5, 0.5,
-2, -3.916171, -5.885459, 1, 1.5, 0.5, 0.5,
-2, -3.916171, -5.885459, 0, 1.5, 0.5, 0.5,
-1, -3.916171, -5.885459, 0, -0.5, 0.5, 0.5,
-1, -3.916171, -5.885459, 1, -0.5, 0.5, 0.5,
-1, -3.916171, -5.885459, 1, 1.5, 0.5, 0.5,
-1, -3.916171, -5.885459, 0, 1.5, 0.5, 0.5,
0, -3.916171, -5.885459, 0, -0.5, 0.5, 0.5,
0, -3.916171, -5.885459, 1, -0.5, 0.5, 0.5,
0, -3.916171, -5.885459, 1, 1.5, 0.5, 0.5,
0, -3.916171, -5.885459, 0, 1.5, 0.5, 0.5,
1, -3.916171, -5.885459, 0, -0.5, 0.5, 0.5,
1, -3.916171, -5.885459, 1, -0.5, 0.5, 0.5,
1, -3.916171, -5.885459, 1, 1.5, 0.5, 0.5,
1, -3.916171, -5.885459, 0, 1.5, 0.5, 0.5,
2, -3.916171, -5.885459, 0, -0.5, 0.5, 0.5,
2, -3.916171, -5.885459, 1, -0.5, 0.5, 0.5,
2, -3.916171, -5.885459, 1, 1.5, 0.5, 0.5,
2, -3.916171, -5.885459, 0, 1.5, 0.5, 0.5,
3, -3.916171, -5.885459, 0, -0.5, 0.5, 0.5,
3, -3.916171, -5.885459, 1, -0.5, 0.5, 0.5,
3, -3.916171, -5.885459, 1, 1.5, 0.5, 0.5,
3, -3.916171, -5.885459, 0, 1.5, 0.5, 0.5
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
-3.647113, -3, -5.075998,
-3.647113, 3, -5.075998,
-3.647113, -3, -5.075998,
-3.821563, -3, -5.345819,
-3.647113, -2, -5.075998,
-3.821563, -2, -5.345819,
-3.647113, -1, -5.075998,
-3.821563, -1, -5.345819,
-3.647113, 0, -5.075998,
-3.821563, 0, -5.345819,
-3.647113, 1, -5.075998,
-3.821563, 1, -5.345819,
-3.647113, 2, -5.075998,
-3.821563, 2, -5.345819,
-3.647113, 3, -5.075998,
-3.821563, 3, -5.345819
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
-4.170465, -3, -5.885459, 0, -0.5, 0.5, 0.5,
-4.170465, -3, -5.885459, 1, -0.5, 0.5, 0.5,
-4.170465, -3, -5.885459, 1, 1.5, 0.5, 0.5,
-4.170465, -3, -5.885459, 0, 1.5, 0.5, 0.5,
-4.170465, -2, -5.885459, 0, -0.5, 0.5, 0.5,
-4.170465, -2, -5.885459, 1, -0.5, 0.5, 0.5,
-4.170465, -2, -5.885459, 1, 1.5, 0.5, 0.5,
-4.170465, -2, -5.885459, 0, 1.5, 0.5, 0.5,
-4.170465, -1, -5.885459, 0, -0.5, 0.5, 0.5,
-4.170465, -1, -5.885459, 1, -0.5, 0.5, 0.5,
-4.170465, -1, -5.885459, 1, 1.5, 0.5, 0.5,
-4.170465, -1, -5.885459, 0, 1.5, 0.5, 0.5,
-4.170465, 0, -5.885459, 0, -0.5, 0.5, 0.5,
-4.170465, 0, -5.885459, 1, -0.5, 0.5, 0.5,
-4.170465, 0, -5.885459, 1, 1.5, 0.5, 0.5,
-4.170465, 0, -5.885459, 0, 1.5, 0.5, 0.5,
-4.170465, 1, -5.885459, 0, -0.5, 0.5, 0.5,
-4.170465, 1, -5.885459, 1, -0.5, 0.5, 0.5,
-4.170465, 1, -5.885459, 1, 1.5, 0.5, 0.5,
-4.170465, 1, -5.885459, 0, 1.5, 0.5, 0.5,
-4.170465, 2, -5.885459, 0, -0.5, 0.5, 0.5,
-4.170465, 2, -5.885459, 1, -0.5, 0.5, 0.5,
-4.170465, 2, -5.885459, 1, 1.5, 0.5, 0.5,
-4.170465, 2, -5.885459, 0, 1.5, 0.5, 0.5,
-4.170465, 3, -5.885459, 0, -0.5, 0.5, 0.5,
-4.170465, 3, -5.885459, 1, -0.5, 0.5, 0.5,
-4.170465, 3, -5.885459, 1, 1.5, 0.5, 0.5,
-4.170465, 3, -5.885459, 0, 1.5, 0.5, 0.5
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
-3.647113, -3.412871, -4,
-3.647113, -3.412871, 4,
-3.647113, -3.412871, -4,
-3.821563, -3.580637, -4,
-3.647113, -3.412871, -2,
-3.821563, -3.580637, -2,
-3.647113, -3.412871, 0,
-3.821563, -3.580637, 0,
-3.647113, -3.412871, 2,
-3.821563, -3.580637, 2,
-3.647113, -3.412871, 4,
-3.821563, -3.580637, 4
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
-4.170465, -3.916171, -4, 0, -0.5, 0.5, 0.5,
-4.170465, -3.916171, -4, 1, -0.5, 0.5, 0.5,
-4.170465, -3.916171, -4, 1, 1.5, 0.5, 0.5,
-4.170465, -3.916171, -4, 0, 1.5, 0.5, 0.5,
-4.170465, -3.916171, -2, 0, -0.5, 0.5, 0.5,
-4.170465, -3.916171, -2, 1, -0.5, 0.5, 0.5,
-4.170465, -3.916171, -2, 1, 1.5, 0.5, 0.5,
-4.170465, -3.916171, -2, 0, 1.5, 0.5, 0.5,
-4.170465, -3.916171, 0, 0, -0.5, 0.5, 0.5,
-4.170465, -3.916171, 0, 1, -0.5, 0.5, 0.5,
-4.170465, -3.916171, 0, 1, 1.5, 0.5, 0.5,
-4.170465, -3.916171, 0, 0, 1.5, 0.5, 0.5,
-4.170465, -3.916171, 2, 0, -0.5, 0.5, 0.5,
-4.170465, -3.916171, 2, 1, -0.5, 0.5, 0.5,
-4.170465, -3.916171, 2, 1, 1.5, 0.5, 0.5,
-4.170465, -3.916171, 2, 0, 1.5, 0.5, 0.5,
-4.170465, -3.916171, 4, 0, -0.5, 0.5, 0.5,
-4.170465, -3.916171, 4, 1, -0.5, 0.5, 0.5,
-4.170465, -3.916171, 4, 1, 1.5, 0.5, 0.5,
-4.170465, -3.916171, 4, 0, 1.5, 0.5, 0.5
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
-3.647113, -3.412871, -5.075998,
-3.647113, 3.297804, -5.075998,
-3.647113, -3.412871, 5.716817,
-3.647113, 3.297804, 5.716817,
-3.647113, -3.412871, -5.075998,
-3.647113, -3.412871, 5.716817,
-3.647113, 3.297804, -5.075998,
-3.647113, 3.297804, 5.716817,
-3.647113, -3.412871, -5.075998,
3.330914, -3.412871, -5.075998,
-3.647113, -3.412871, 5.716817,
3.330914, -3.412871, 5.716817,
-3.647113, 3.297804, -5.075998,
3.330914, 3.297804, -5.075998,
-3.647113, 3.297804, 5.716817,
3.330914, 3.297804, 5.716817,
3.330914, -3.412871, -5.075998,
3.330914, 3.297804, -5.075998,
3.330914, -3.412871, 5.716817,
3.330914, 3.297804, 5.716817,
3.330914, -3.412871, -5.075998,
3.330914, -3.412871, 5.716817,
3.330914, 3.297804, -5.075998,
3.330914, 3.297804, 5.716817
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
var radius = 7.741998;
var distance = 34.44502;
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
mvMatrix.translate( 0.1580994, 0.0575335, -0.3204093 );
mvMatrix.scale( 1.199594, 1.247386, 0.77559 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.44502);
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
tetradifon<-read.table("tetradifon.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tetradifon$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetradifon' not found
```

```r
y<-tetradifon$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetradifon' not found
```

```r
z<-tetradifon$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetradifon' not found
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
-3.545491, -2.631276, -1.245078, 0, 0, 1, 1, 1,
-3.200547, -0.5353361, -0.4924261, 1, 0, 0, 1, 1,
-3.163638, 0.7600798, -2.116087, 1, 0, 0, 1, 1,
-3.149123, -0.4617324, -1.217246, 1, 0, 0, 1, 1,
-3.07994, 0.2104935, -2.84291, 1, 0, 0, 1, 1,
-3.01467, 0.2318012, -0.7102587, 1, 0, 0, 1, 1,
-2.676164, -0.3835134, -0.7190971, 0, 0, 0, 1, 1,
-2.56478, -0.469259, -1.404965, 0, 0, 0, 1, 1,
-2.455631, -0.6993774, -1.543256, 0, 0, 0, 1, 1,
-2.414347, -0.09268587, -2.475964, 0, 0, 0, 1, 1,
-2.37852, -0.2267546, -1.182309, 0, 0, 0, 1, 1,
-2.315019, 1.429809, -1.301852, 0, 0, 0, 1, 1,
-2.305161, -0.6403815, -3.643906, 0, 0, 0, 1, 1,
-2.303484, 0.253891, -0.5509838, 1, 1, 1, 1, 1,
-2.302423, -2.385987, -2.499172, 1, 1, 1, 1, 1,
-2.30002, -0.2608673, 0.1893046, 1, 1, 1, 1, 1,
-2.247281, 0.1128206, -3.50597, 1, 1, 1, 1, 1,
-2.243704, 1.491254, -1.417251, 1, 1, 1, 1, 1,
-2.218997, -0.7497768, -3.016948, 1, 1, 1, 1, 1,
-2.196007, 0.542217, -3.717615, 1, 1, 1, 1, 1,
-2.176765, -0.6475719, -1.824502, 1, 1, 1, 1, 1,
-2.166437, -0.463547, -2.423614, 1, 1, 1, 1, 1,
-2.16377, -1.569314, -1.348122, 1, 1, 1, 1, 1,
-2.146309, 1.519213, -0.601088, 1, 1, 1, 1, 1,
-2.121728, -0.7437036, -1.914435, 1, 1, 1, 1, 1,
-2.120283, 1.186623, -0.7735738, 1, 1, 1, 1, 1,
-2.110512, -1.602677, -2.018205, 1, 1, 1, 1, 1,
-2.103492, -0.9570971, -2.480138, 1, 1, 1, 1, 1,
-2.103282, 0.5620501, -1.661914, 0, 0, 1, 1, 1,
-2.099402, -1.608982, -2.438483, 1, 0, 0, 1, 1,
-2.096993, -1.350709, -3.200355, 1, 0, 0, 1, 1,
-2.074833, 0.7945535, -2.61252, 1, 0, 0, 1, 1,
-2.061578, -0.2789161, -2.004129, 1, 0, 0, 1, 1,
-2.043605, 1.27818, -1.740892, 1, 0, 0, 1, 1,
-2.03035, 0.4812588, -0.5257581, 0, 0, 0, 1, 1,
-2.019565, -0.2098403, -1.164426, 0, 0, 0, 1, 1,
-2.002372, -2.066349, -0.9179354, 0, 0, 0, 1, 1,
-1.996667, -0.2155966, -0.1646075, 0, 0, 0, 1, 1,
-1.992346, -0.2655386, -2.879327, 0, 0, 0, 1, 1,
-1.992223, -1.163028, -1.90317, 0, 0, 0, 1, 1,
-1.978519, -0.07148395, -2.022621, 0, 0, 0, 1, 1,
-1.952582, 0.0991198, -0.7649074, 1, 1, 1, 1, 1,
-1.943779, 0.3890484, -1.511509, 1, 1, 1, 1, 1,
-1.93442, -0.5611951, -1.184101, 1, 1, 1, 1, 1,
-1.932958, 0.8079161, -0.6860694, 1, 1, 1, 1, 1,
-1.839244, -1.667715, -2.890975, 1, 1, 1, 1, 1,
-1.813815, 1.088904, -1.159922, 1, 1, 1, 1, 1,
-1.805316, 0.698081, -0.7382831, 1, 1, 1, 1, 1,
-1.799809, 0.5780002, -2.936821, 1, 1, 1, 1, 1,
-1.787789, 2.908268, -0.7791806, 1, 1, 1, 1, 1,
-1.773934, 0.5902865, -2.932029, 1, 1, 1, 1, 1,
-1.756048, 1.048661, -1.827794, 1, 1, 1, 1, 1,
-1.742202, 0.4876261, -1.68233, 1, 1, 1, 1, 1,
-1.707737, 0.04346108, -2.100106, 1, 1, 1, 1, 1,
-1.706095, 2.784922, -0.1408821, 1, 1, 1, 1, 1,
-1.705607, 0.701413, -1.934303, 1, 1, 1, 1, 1,
-1.699852, 1.702434, -0.5419049, 0, 0, 1, 1, 1,
-1.685266, 0.5751082, -1.329266, 1, 0, 0, 1, 1,
-1.664716, 0.8169326, -0.8832695, 1, 0, 0, 1, 1,
-1.650771, -0.0265593, -1.979444, 1, 0, 0, 1, 1,
-1.646214, 0.2222181, -0.2379728, 1, 0, 0, 1, 1,
-1.632521, 2.069064, 0.1169733, 1, 0, 0, 1, 1,
-1.601392, 0.5663848, -2.41537, 0, 0, 0, 1, 1,
-1.596106, -0.8739234, -2.114565, 0, 0, 0, 1, 1,
-1.594167, -0.6369278, -3.856261, 0, 0, 0, 1, 1,
-1.59189, 1.065528, -0.4525546, 0, 0, 0, 1, 1,
-1.590094, -0.2323297, -1.366912, 0, 0, 0, 1, 1,
-1.583708, 1.474434, 0.4296024, 0, 0, 0, 1, 1,
-1.581166, -1.361651, -1.301007, 0, 0, 0, 1, 1,
-1.574301, -0.9254113, -0.8574235, 1, 1, 1, 1, 1,
-1.573324, 0.5218853, -1.43183, 1, 1, 1, 1, 1,
-1.558802, -0.851556, -4.593685, 1, 1, 1, 1, 1,
-1.546914, 0.6973242, -0.09987973, 1, 1, 1, 1, 1,
-1.544856, 2.33122, -0.2069766, 1, 1, 1, 1, 1,
-1.536706, -1.43496, -1.340173, 1, 1, 1, 1, 1,
-1.534343, -0.5927378, -2.011571, 1, 1, 1, 1, 1,
-1.526473, 0.1583636, -3.624901, 1, 1, 1, 1, 1,
-1.518953, 0.8827835, -2.025498, 1, 1, 1, 1, 1,
-1.508291, -0.07473017, 0.6348963, 1, 1, 1, 1, 1,
-1.500587, -1.330343, -3.12601, 1, 1, 1, 1, 1,
-1.497158, 0.0334263, -3.05455, 1, 1, 1, 1, 1,
-1.494591, -0.9123424, -2.477307, 1, 1, 1, 1, 1,
-1.492608, 1.025546, -1.551628, 1, 1, 1, 1, 1,
-1.487486, -0.2465726, -1.434271, 1, 1, 1, 1, 1,
-1.484422, -0.4608487, -1.300961, 0, 0, 1, 1, 1,
-1.481825, -0.3626539, -1.034533, 1, 0, 0, 1, 1,
-1.47851, 0.4779008, -1.513196, 1, 0, 0, 1, 1,
-1.466105, 1.797222, -2.430283, 1, 0, 0, 1, 1,
-1.426279, -0.5349003, -2.668274, 1, 0, 0, 1, 1,
-1.413456, -1.108178, -3.471991, 1, 0, 0, 1, 1,
-1.407608, 0.6757023, -1.712113, 0, 0, 0, 1, 1,
-1.406923, -0.7913224, -1.679301, 0, 0, 0, 1, 1,
-1.400625, 0.8881034, 0.359981, 0, 0, 0, 1, 1,
-1.393632, -1.466541, -2.643334, 0, 0, 0, 1, 1,
-1.391815, -0.6087382, -2.546535, 0, 0, 0, 1, 1,
-1.385811, -0.7010207, -1.766679, 0, 0, 0, 1, 1,
-1.385352, 1.43025, -1.245727, 0, 0, 0, 1, 1,
-1.384563, -0.3460284, -2.176254, 1, 1, 1, 1, 1,
-1.370839, -0.4072894, -2.448361, 1, 1, 1, 1, 1,
-1.370653, 1.220469, -1.582096, 1, 1, 1, 1, 1,
-1.368023, 0.1463068, -2.830832, 1, 1, 1, 1, 1,
-1.367028, -0.1026996, -1.693986, 1, 1, 1, 1, 1,
-1.362031, 0.173189, -2.578362, 1, 1, 1, 1, 1,
-1.354983, -0.3604838, -1.941, 1, 1, 1, 1, 1,
-1.347351, 0.4562248, -1.707379, 1, 1, 1, 1, 1,
-1.33845, -0.08498967, -0.771574, 1, 1, 1, 1, 1,
-1.336484, 2.064356, -1.633167, 1, 1, 1, 1, 1,
-1.333488, -0.7292776, -2.011872, 1, 1, 1, 1, 1,
-1.329523, -0.05093683, -3.324295, 1, 1, 1, 1, 1,
-1.319421, -0.4376041, -1.109446, 1, 1, 1, 1, 1,
-1.311266, 0.7525333, 0.2843452, 1, 1, 1, 1, 1,
-1.30647, 1.527137, 0.2443432, 1, 1, 1, 1, 1,
-1.302809, -1.712273, -2.550701, 0, 0, 1, 1, 1,
-1.293449, -0.8572832, -3.251479, 1, 0, 0, 1, 1,
-1.291538, 0.3853788, -0.02903452, 1, 0, 0, 1, 1,
-1.287099, 1.832958, -0.4356153, 1, 0, 0, 1, 1,
-1.283514, 1.009554, -1.086925, 1, 0, 0, 1, 1,
-1.27941, 1.328974, -1.039653, 1, 0, 0, 1, 1,
-1.277689, 0.02344814, -1.326548, 0, 0, 0, 1, 1,
-1.269894, -0.3002234, -1.150474, 0, 0, 0, 1, 1,
-1.269397, 0.8579773, -3.025687, 0, 0, 0, 1, 1,
-1.26665, 0.8064902, 1.034481, 0, 0, 0, 1, 1,
-1.263733, 0.5285748, -0.9048977, 0, 0, 0, 1, 1,
-1.256801, -0.8418756, -1.886854, 0, 0, 0, 1, 1,
-1.252369, 0.458147, -3.071206, 0, 0, 0, 1, 1,
-1.243783, 0.2924681, -1.298707, 1, 1, 1, 1, 1,
-1.239198, 0.1842554, -0.7187537, 1, 1, 1, 1, 1,
-1.238602, -1.034673, -2.026031, 1, 1, 1, 1, 1,
-1.225543, 0.4009712, -0.6123615, 1, 1, 1, 1, 1,
-1.222828, -0.6785553, -2.782446, 1, 1, 1, 1, 1,
-1.221979, 1.854117, 0.2531284, 1, 1, 1, 1, 1,
-1.215008, 0.1468957, 0.3152551, 1, 1, 1, 1, 1,
-1.20389, -0.4974268, -1.782763, 1, 1, 1, 1, 1,
-1.199186, -0.8190588, -0.8354769, 1, 1, 1, 1, 1,
-1.198062, 1.35131, 1.046138, 1, 1, 1, 1, 1,
-1.197921, 1.288036, -1.598009, 1, 1, 1, 1, 1,
-1.190123, 0.7841298, -1.20226, 1, 1, 1, 1, 1,
-1.177492, 0.8924183, -1.280426, 1, 1, 1, 1, 1,
-1.162499, 1.103222, -1.549698, 1, 1, 1, 1, 1,
-1.154791, -1.888472, -2.524163, 1, 1, 1, 1, 1,
-1.147183, -0.3388945, -0.9440646, 0, 0, 1, 1, 1,
-1.144067, -1.113128, -1.17192, 1, 0, 0, 1, 1,
-1.12457, -1.298292, -1.277122, 1, 0, 0, 1, 1,
-1.123707, -0.3113712, -0.5684954, 1, 0, 0, 1, 1,
-1.123166, -1.381034, -3.40857, 1, 0, 0, 1, 1,
-1.120731, -0.1709352, -0.5084551, 1, 0, 0, 1, 1,
-1.120403, -0.3847478, -1.767057, 0, 0, 0, 1, 1,
-1.118686, 0.9256144, -0.8513258, 0, 0, 0, 1, 1,
-1.111675, -0.2445972, -2.785713, 0, 0, 0, 1, 1,
-1.110878, -0.6953201, -1.705381, 0, 0, 0, 1, 1,
-1.108511, 0.6527249, -0.6784402, 0, 0, 0, 1, 1,
-1.099593, -0.7511681, -1.866185, 0, 0, 0, 1, 1,
-1.085757, 0.1276148, -3.790097, 0, 0, 0, 1, 1,
-1.079684, -1.408574, -1.876758, 1, 1, 1, 1, 1,
-1.079176, 1.062829, -1.260115, 1, 1, 1, 1, 1,
-1.0743, -1.45384, -2.617596, 1, 1, 1, 1, 1,
-1.052545, -0.3769178, -3.150383, 1, 1, 1, 1, 1,
-1.048012, 0.3387067, 0.1732816, 1, 1, 1, 1, 1,
-1.043404, 0.2652555, -0.7603609, 1, 1, 1, 1, 1,
-1.033918, 0.371193, -0.9893261, 1, 1, 1, 1, 1,
-1.027356, -0.01950992, -0.6792403, 1, 1, 1, 1, 1,
-1.023643, -0.3942287, 0.2106983, 1, 1, 1, 1, 1,
-1.017197, 1.489873, -0.4003565, 1, 1, 1, 1, 1,
-1.014012, -0.003030408, -1.508625, 1, 1, 1, 1, 1,
-1.010744, 1.129983, -0.7336986, 1, 1, 1, 1, 1,
-1.008753, 1.724997, -1.371156, 1, 1, 1, 1, 1,
-0.9939975, -0.369562, -3.004732, 1, 1, 1, 1, 1,
-0.9938738, -0.03351325, -2.822121, 1, 1, 1, 1, 1,
-0.988425, 1.598726, 1.025748, 0, 0, 1, 1, 1,
-0.9864132, -0.5783763, -2.996693, 1, 0, 0, 1, 1,
-0.9863539, -0.5909384, -4.407718, 1, 0, 0, 1, 1,
-0.9863206, -1.211915, -2.429353, 1, 0, 0, 1, 1,
-0.9814771, 1.674481, -2.015713, 1, 0, 0, 1, 1,
-0.977607, 2.036933, -0.08771239, 1, 0, 0, 1, 1,
-0.9739509, -0.7949489, -2.951941, 0, 0, 0, 1, 1,
-0.9679991, 0.2802843, -2.080701, 0, 0, 0, 1, 1,
-0.9593347, 1.169902, 0.3575887, 0, 0, 0, 1, 1,
-0.9554979, 0.02474354, -1.965093, 0, 0, 0, 1, 1,
-0.9545767, 0.294252, -1.822562, 0, 0, 0, 1, 1,
-0.9404291, 2.540797, -0.8526242, 0, 0, 0, 1, 1,
-0.9394071, 1.563161, 0.8146448, 0, 0, 0, 1, 1,
-0.9353057, -0.04257853, -0.864603, 1, 1, 1, 1, 1,
-0.9348377, -1.381727, -3.926875, 1, 1, 1, 1, 1,
-0.9330813, -1.240485, -2.745468, 1, 1, 1, 1, 1,
-0.9231842, -0.1115344, 0.8898432, 1, 1, 1, 1, 1,
-0.9230406, 1.623094, -1.699586, 1, 1, 1, 1, 1,
-0.9226269, -0.4067251, -3.920723, 1, 1, 1, 1, 1,
-0.9220579, 0.3039489, -0.974748, 1, 1, 1, 1, 1,
-0.9196277, 0.180647, -2.879454, 1, 1, 1, 1, 1,
-0.9178585, 0.4667184, -1.144801, 1, 1, 1, 1, 1,
-0.9088094, 0.6001303, -2.191416, 1, 1, 1, 1, 1,
-0.9046082, 0.8524777, -0.07523392, 1, 1, 1, 1, 1,
-0.9037791, -1.274965, -2.290875, 1, 1, 1, 1, 1,
-0.9026068, 1.18858, 1.076064, 1, 1, 1, 1, 1,
-0.9012648, 0.5757652, 0.7439466, 1, 1, 1, 1, 1,
-0.8969771, -0.7608047, -1.985916, 1, 1, 1, 1, 1,
-0.8950829, -0.4544754, -4.624507, 0, 0, 1, 1, 1,
-0.8930601, -0.4974299, -1.794995, 1, 0, 0, 1, 1,
-0.8844352, -0.6589547, -1.439979, 1, 0, 0, 1, 1,
-0.8799016, -0.07656915, -1.945604, 1, 0, 0, 1, 1,
-0.8677539, 0.2115076, -1.173107, 1, 0, 0, 1, 1,
-0.859081, 0.3535197, -0.4157613, 1, 0, 0, 1, 1,
-0.8573691, 0.2124892, 0.3475071, 0, 0, 0, 1, 1,
-0.851424, 0.9145976, -2.239328, 0, 0, 0, 1, 1,
-0.8483849, -3.315142, -1.691061, 0, 0, 0, 1, 1,
-0.8470907, -1.503138, -3.36103, 0, 0, 0, 1, 1,
-0.8432763, -1.165916, -3.256045, 0, 0, 0, 1, 1,
-0.8425191, 1.475442, 0.5634742, 0, 0, 0, 1, 1,
-0.8407252, -1.669898, -2.754878, 0, 0, 0, 1, 1,
-0.8386472, 0.5594162, -1.419285, 1, 1, 1, 1, 1,
-0.8384999, 0.3162679, -1.333746, 1, 1, 1, 1, 1,
-0.8378646, -0.04887427, -2.797917, 1, 1, 1, 1, 1,
-0.8293644, 0.09623602, -3.070916, 1, 1, 1, 1, 1,
-0.8285039, 0.9130361, 1.967809, 1, 1, 1, 1, 1,
-0.8280277, 1.004487, -0.04713751, 1, 1, 1, 1, 1,
-0.8258269, 0.2581635, -1.79363, 1, 1, 1, 1, 1,
-0.8231781, 0.1401831, -2.731179, 1, 1, 1, 1, 1,
-0.8222072, 0.1498291, -0.9225823, 1, 1, 1, 1, 1,
-0.8190475, -1.869374, -3.359792, 1, 1, 1, 1, 1,
-0.8146333, 0.3365741, -0.07846434, 1, 1, 1, 1, 1,
-0.8137993, -0.7766656, -2.765781, 1, 1, 1, 1, 1,
-0.812087, 0.1883251, -1.6682, 1, 1, 1, 1, 1,
-0.8118172, -0.02448768, -1.791198, 1, 1, 1, 1, 1,
-0.7992644, 2.416365, -1.7098, 1, 1, 1, 1, 1,
-0.7922754, 1.437951, 1.485305, 0, 0, 1, 1, 1,
-0.7918705, 0.4122202, -1.182584, 1, 0, 0, 1, 1,
-0.7916749, 0.6889209, 0.02534182, 1, 0, 0, 1, 1,
-0.7873821, 0.6131885, 1.823421, 1, 0, 0, 1, 1,
-0.785796, -0.4862785, -2.077613, 1, 0, 0, 1, 1,
-0.7821578, -0.2258219, -2.875473, 1, 0, 0, 1, 1,
-0.7817044, -0.3649307, -1.968117, 0, 0, 0, 1, 1,
-0.7785929, -0.5878936, -2.647642, 0, 0, 0, 1, 1,
-0.7720708, -0.1185835, -2.565773, 0, 0, 0, 1, 1,
-0.7659454, -0.09121826, -4.330284, 0, 0, 0, 1, 1,
-0.7656341, -1.676637, -3.030999, 0, 0, 0, 1, 1,
-0.7651131, -0.3864856, -1.800113, 0, 0, 0, 1, 1,
-0.763588, 0.3846453, -1.895444, 0, 0, 0, 1, 1,
-0.7608193, 1.193876, -1.188992, 1, 1, 1, 1, 1,
-0.759693, 0.775791, -0.6334248, 1, 1, 1, 1, 1,
-0.7575562, 0.549117, -0.8709351, 1, 1, 1, 1, 1,
-0.7472063, -0.2878529, -1.98174, 1, 1, 1, 1, 1,
-0.7460508, 0.7304562, -0.0621491, 1, 1, 1, 1, 1,
-0.7459397, 0.1777318, -2.756626, 1, 1, 1, 1, 1,
-0.7454416, -0.1921551, -0.7345463, 1, 1, 1, 1, 1,
-0.743097, -0.6313952, -1.844617, 1, 1, 1, 1, 1,
-0.7317849, -1.343611, -2.473279, 1, 1, 1, 1, 1,
-0.72966, -1.01016, -3.224557, 1, 1, 1, 1, 1,
-0.7270951, 1.43228, -0.9051745, 1, 1, 1, 1, 1,
-0.7218733, -0.3428225, -1.377072, 1, 1, 1, 1, 1,
-0.7214297, -1.335549, -1.745618, 1, 1, 1, 1, 1,
-0.7204199, -1.018225, -2.252267, 1, 1, 1, 1, 1,
-0.7175199, -1.209492, -3.63905, 1, 1, 1, 1, 1,
-0.7148229, -1.039859, -3.388361, 0, 0, 1, 1, 1,
-0.7113652, -0.3034579, -2.706879, 1, 0, 0, 1, 1,
-0.7093979, -1.584689, -2.209422, 1, 0, 0, 1, 1,
-0.7085024, 0.7102714, -2.09594, 1, 0, 0, 1, 1,
-0.7060515, -1.674829, -2.562202, 1, 0, 0, 1, 1,
-0.7016119, 1.348732, 0.4962966, 1, 0, 0, 1, 1,
-0.6979523, 0.7225898, -1.619844, 0, 0, 0, 1, 1,
-0.6970496, -1.077757, -2.332352, 0, 0, 0, 1, 1,
-0.696982, -0.3294519, -1.092255, 0, 0, 0, 1, 1,
-0.6942387, 0.4957153, -1.197433, 0, 0, 0, 1, 1,
-0.6922045, 1.085939, -1.130918, 0, 0, 0, 1, 1,
-0.6887532, 1.239256, -1.943628, 0, 0, 0, 1, 1,
-0.6828378, 1.036129, 0.9894506, 0, 0, 0, 1, 1,
-0.6815253, 0.3854693, 0.08940788, 1, 1, 1, 1, 1,
-0.6781523, 0.3813022, -1.217906, 1, 1, 1, 1, 1,
-0.6774682, -0.09801696, -1.540013, 1, 1, 1, 1, 1,
-0.6734168, 1.255321, -1.093386, 1, 1, 1, 1, 1,
-0.6680571, 0.7888369, 0.4032655, 1, 1, 1, 1, 1,
-0.6680173, -0.3050982, 0.1046381, 1, 1, 1, 1, 1,
-0.6669351, -0.6467751, -2.570674, 1, 1, 1, 1, 1,
-0.6621314, 0.3533635, -0.9097746, 1, 1, 1, 1, 1,
-0.6614195, 0.3192424, -1.689809, 1, 1, 1, 1, 1,
-0.6601501, -1.624672, -3.398178, 1, 1, 1, 1, 1,
-0.6498034, -0.7633602, -2.435845, 1, 1, 1, 1, 1,
-0.6421111, -1.578679, -4.873826, 1, 1, 1, 1, 1,
-0.6403689, 1.728266, -0.9641966, 1, 1, 1, 1, 1,
-0.6391194, 0.2716216, -1.366877, 1, 1, 1, 1, 1,
-0.6372228, -1.617066, -3.768646, 1, 1, 1, 1, 1,
-0.6367853, 0.1307492, -1.259482, 0, 0, 1, 1, 1,
-0.6312529, 2.363294, 0.6424446, 1, 0, 0, 1, 1,
-0.6265197, 1.864913, 0.3466696, 1, 0, 0, 1, 1,
-0.6248899, 0.4373302, -0.4294945, 1, 0, 0, 1, 1,
-0.6211603, 0.5735274, -0.362365, 1, 0, 0, 1, 1,
-0.6165404, 0.9320579, 0.4772232, 1, 0, 0, 1, 1,
-0.6119838, 1.189301, 0.08953147, 0, 0, 0, 1, 1,
-0.6085728, -0.08977322, -1.244224, 0, 0, 0, 1, 1,
-0.6072252, 1.491381, 0.5643963, 0, 0, 0, 1, 1,
-0.6068325, 0.2712313, -2.073711, 0, 0, 0, 1, 1,
-0.6066868, -1.612438, -2.71088, 0, 0, 0, 1, 1,
-0.6051162, -0.4137715, -3.101227, 0, 0, 0, 1, 1,
-0.6030248, -0.9736178, -3.103889, 0, 0, 0, 1, 1,
-0.6028859, -1.02681, -4.020443, 1, 1, 1, 1, 1,
-0.596595, -0.4541385, -1.693834, 1, 1, 1, 1, 1,
-0.5921947, 0.9445961, -0.1914944, 1, 1, 1, 1, 1,
-0.591686, 1.11985, 0.1591764, 1, 1, 1, 1, 1,
-0.5892382, 1.027758, 0.09287049, 1, 1, 1, 1, 1,
-0.5891873, -1.972384, -1.953881, 1, 1, 1, 1, 1,
-0.5857717, -0.04138176, -0.7475361, 1, 1, 1, 1, 1,
-0.5802169, 0.7121022, 0.6326662, 1, 1, 1, 1, 1,
-0.5701881, -0.8450845, -0.5642874, 1, 1, 1, 1, 1,
-0.5654574, 0.00766823, -1.962867, 1, 1, 1, 1, 1,
-0.5647503, -1.209461, -2.636562, 1, 1, 1, 1, 1,
-0.5604336, 0.9607242, -1.232288, 1, 1, 1, 1, 1,
-0.5516157, 2.473321, -0.3771593, 1, 1, 1, 1, 1,
-0.5484698, 2.384886, -0.3695315, 1, 1, 1, 1, 1,
-0.5430665, -0.4095259, -2.22358, 1, 1, 1, 1, 1,
-0.5334649, 2.395513, 0.4056082, 0, 0, 1, 1, 1,
-0.5292771, -1.13095, -3.795468, 1, 0, 0, 1, 1,
-0.5277995, -1.351452, -3.543364, 1, 0, 0, 1, 1,
-0.5264559, 0.546691, -0.07898554, 1, 0, 0, 1, 1,
-0.5254145, -0.8888339, -2.711609, 1, 0, 0, 1, 1,
-0.5244055, 0.5494817, -0.7557765, 1, 0, 0, 1, 1,
-0.5216396, 2.74103, 0.9211211, 0, 0, 0, 1, 1,
-0.5216283, 0.1285292, -2.869603, 0, 0, 0, 1, 1,
-0.5209657, 0.5767425, -1.436639, 0, 0, 0, 1, 1,
-0.51858, -1.113508, -3.323169, 0, 0, 0, 1, 1,
-0.5168149, -0.6530138, -0.5767348, 0, 0, 0, 1, 1,
-0.5155942, -0.08600328, -1.656595, 0, 0, 0, 1, 1,
-0.5146301, 0.02846409, -2.4404, 0, 0, 0, 1, 1,
-0.512614, -0.9473359, -3.281925, 1, 1, 1, 1, 1,
-0.5118736, -0.3482626, -2.005878, 1, 1, 1, 1, 1,
-0.5099479, 0.7989229, -0.3640425, 1, 1, 1, 1, 1,
-0.5084029, 0.6304603, -0.3859333, 1, 1, 1, 1, 1,
-0.5039958, 0.5180091, -1.801124, 1, 1, 1, 1, 1,
-0.49057, 2.502834, 0.05454038, 1, 1, 1, 1, 1,
-0.4788667, -0.06456509, -1.5725, 1, 1, 1, 1, 1,
-0.4778144, 0.2999361, 0.1187589, 1, 1, 1, 1, 1,
-0.4762792, -0.4144666, -4.121305, 1, 1, 1, 1, 1,
-0.4725317, -0.4545833, -2.83583, 1, 1, 1, 1, 1,
-0.4724464, -0.5603889, -1.7935, 1, 1, 1, 1, 1,
-0.4689886, 1.614039, -1.142136, 1, 1, 1, 1, 1,
-0.4667252, -0.04049009, -1.934333, 1, 1, 1, 1, 1,
-0.4648733, 0.5763524, -1.980702, 1, 1, 1, 1, 1,
-0.4597524, 1.145543, -0.4419521, 1, 1, 1, 1, 1,
-0.4526174, -1.242129, -1.60803, 0, 0, 1, 1, 1,
-0.4510358, -0.3048631, -1.079629, 1, 0, 0, 1, 1,
-0.4483748, 0.03472025, 0.06742821, 1, 0, 0, 1, 1,
-0.4482703, 0.1556457, -1.198541, 1, 0, 0, 1, 1,
-0.4467124, 1.085096, 0.6724945, 1, 0, 0, 1, 1,
-0.4439347, 0.1246468, -1.846051, 1, 0, 0, 1, 1,
-0.4434048, 0.2165837, -1.551659, 0, 0, 0, 1, 1,
-0.4384957, 2.046514, 1.518224, 0, 0, 0, 1, 1,
-0.4382753, -1.125475, -3.805825, 0, 0, 0, 1, 1,
-0.4363891, 0.3051646, 0.004771588, 0, 0, 0, 1, 1,
-0.435753, -0.005632605, -3.010236, 0, 0, 0, 1, 1,
-0.4310741, 1.546761, -0.7667256, 0, 0, 0, 1, 1,
-0.4303658, -1.067819, -2.7951, 0, 0, 0, 1, 1,
-0.4252123, 0.9087356, -2.095011, 1, 1, 1, 1, 1,
-0.4234107, -0.3654306, -1.43299, 1, 1, 1, 1, 1,
-0.4179284, 0.6967076, -0.4138919, 1, 1, 1, 1, 1,
-0.4177506, 0.4559777, -1.943799, 1, 1, 1, 1, 1,
-0.4169974, -0.2255707, -1.489728, 1, 1, 1, 1, 1,
-0.4137137, 1.697729, -0.3142745, 1, 1, 1, 1, 1,
-0.4116128, 0.7547764, -0.7860321, 1, 1, 1, 1, 1,
-0.410924, -0.9998182, -1.692467, 1, 1, 1, 1, 1,
-0.4098837, 0.395974, 0.207284, 1, 1, 1, 1, 1,
-0.4056959, -0.2709021, -2.056652, 1, 1, 1, 1, 1,
-0.4042469, -1.318686, -1.150396, 1, 1, 1, 1, 1,
-0.4027833, 0.4540524, -0.3519197, 1, 1, 1, 1, 1,
-0.401432, 1.964328, -1.872569, 1, 1, 1, 1, 1,
-0.3971724, -0.4554795, -2.192974, 1, 1, 1, 1, 1,
-0.3968987, -2.891814, -4.025718, 1, 1, 1, 1, 1,
-0.3951339, -0.5307284, -3.309088, 0, 0, 1, 1, 1,
-0.3946132, -2.164681, -3.44506, 1, 0, 0, 1, 1,
-0.3906056, 0.2866126, -3.217889, 1, 0, 0, 1, 1,
-0.3875629, 0.3143133, -2.251882, 1, 0, 0, 1, 1,
-0.3822789, 0.3677559, -1.651618, 1, 0, 0, 1, 1,
-0.3817923, 0.205039, -1.443154, 1, 0, 0, 1, 1,
-0.3804869, -0.04010252, -2.811843, 0, 0, 0, 1, 1,
-0.3799638, -1.163237, -2.098128, 0, 0, 0, 1, 1,
-0.3767892, 0.3397076, -4.563481, 0, 0, 0, 1, 1,
-0.3763184, -0.4894362, -4.109393, 0, 0, 0, 1, 1,
-0.3747956, 0.007677902, -2.112873, 0, 0, 0, 1, 1,
-0.3732489, -0.3861795, -2.019786, 0, 0, 0, 1, 1,
-0.3716051, 1.732124, -1.296804, 0, 0, 0, 1, 1,
-0.3715232, 2.315671, -0.7080333, 1, 1, 1, 1, 1,
-0.3588028, -0.5835772, -2.817209, 1, 1, 1, 1, 1,
-0.3563731, 0.3456059, 0.4820116, 1, 1, 1, 1, 1,
-0.3550741, -0.143485, -2.601575, 1, 1, 1, 1, 1,
-0.3524326, -0.2310891, -2.116881, 1, 1, 1, 1, 1,
-0.3515205, 1.870407, -2.609369, 1, 1, 1, 1, 1,
-0.3474638, -0.43822, -2.795416, 1, 1, 1, 1, 1,
-0.3334619, -1.63926, -4.846547, 1, 1, 1, 1, 1,
-0.3329432, 0.2337617, -1.53906, 1, 1, 1, 1, 1,
-0.3201644, -0.9744715, -3.113678, 1, 1, 1, 1, 1,
-0.3178896, -1.152766, -3.798727, 1, 1, 1, 1, 1,
-0.3169948, -1.099532, -3.631047, 1, 1, 1, 1, 1,
-0.316305, -0.05717767, -3.679707, 1, 1, 1, 1, 1,
-0.3144279, -1.550572, -1.499398, 1, 1, 1, 1, 1,
-0.3049518, 1.712757, -0.5680093, 1, 1, 1, 1, 1,
-0.3039452, -0.2987948, -2.570279, 0, 0, 1, 1, 1,
-0.2993257, 1.142391, -0.2068987, 1, 0, 0, 1, 1,
-0.2992471, 0.7312475, -1.176979, 1, 0, 0, 1, 1,
-0.2971168, 1.866531, 0.4455685, 1, 0, 0, 1, 1,
-0.2928803, -1.604731, -2.284226, 1, 0, 0, 1, 1,
-0.291264, -0.8392804, -3.090132, 1, 0, 0, 1, 1,
-0.2893592, 0.01333089, -1.257648, 0, 0, 0, 1, 1,
-0.2812002, -1.244543, -4.43557, 0, 0, 0, 1, 1,
-0.2799402, 0.6169633, -0.2052681, 0, 0, 0, 1, 1,
-0.2788432, -0.6843123, -2.718872, 0, 0, 0, 1, 1,
-0.2776506, -0.4833458, -3.582347, 0, 0, 0, 1, 1,
-0.2727052, 1.598596, -0.3701649, 0, 0, 0, 1, 1,
-0.2722199, -1.273917, -2.115786, 0, 0, 0, 1, 1,
-0.2688899, -0.4745522, -3.679311, 1, 1, 1, 1, 1,
-0.2683373, 1.055267, 0.366997, 1, 1, 1, 1, 1,
-0.2682125, 0.7284528, -1.224725, 1, 1, 1, 1, 1,
-0.2663972, -0.1250195, -0.1231738, 1, 1, 1, 1, 1,
-0.2652578, 1.212322, 0.8448643, 1, 1, 1, 1, 1,
-0.2649128, -0.05187527, -2.482484, 1, 1, 1, 1, 1,
-0.2643323, -0.5592842, -2.545063, 1, 1, 1, 1, 1,
-0.260015, -0.6677541, -1.664046, 1, 1, 1, 1, 1,
-0.2582115, -0.6911831, -1.465772, 1, 1, 1, 1, 1,
-0.2581779, -0.1704835, -0.8996284, 1, 1, 1, 1, 1,
-0.2524004, 0.3620229, -0.02924417, 1, 1, 1, 1, 1,
-0.2496463, 0.6267183, 0.4891079, 1, 1, 1, 1, 1,
-0.24841, 1.786434, -1.092272, 1, 1, 1, 1, 1,
-0.2479775, 1.17029, 0.01730736, 1, 1, 1, 1, 1,
-0.2432751, -0.0175482, -1.508208, 1, 1, 1, 1, 1,
-0.2425862, -2.303464, -1.345974, 0, 0, 1, 1, 1,
-0.2369047, 1.646796, 0.542652, 1, 0, 0, 1, 1,
-0.2359128, -1.35014, -3.825633, 1, 0, 0, 1, 1,
-0.2192349, -0.2291382, -2.865278, 1, 0, 0, 1, 1,
-0.2165132, 1.3899, -1.371864, 1, 0, 0, 1, 1,
-0.2140224, -0.09043605, -2.539988, 1, 0, 0, 1, 1,
-0.2138372, -0.08165937, -2.202586, 0, 0, 0, 1, 1,
-0.2124357, 1.662249, -1.812583, 0, 0, 0, 1, 1,
-0.2117245, -1.621444, -4.026353, 0, 0, 0, 1, 1,
-0.2079864, 0.187436, -0.6982685, 0, 0, 0, 1, 1,
-0.2038906, -1.562902, -3.417002, 0, 0, 0, 1, 1,
-0.2038014, -0.4430917, -1.903892, 0, 0, 0, 1, 1,
-0.203627, 1.121219, -1.820786, 0, 0, 0, 1, 1,
-0.1970442, 0.3212581, -2.00546, 1, 1, 1, 1, 1,
-0.1948794, -0.7347198, -1.679974, 1, 1, 1, 1, 1,
-0.189289, -0.05207874, -0.4745235, 1, 1, 1, 1, 1,
-0.1871122, 3.200075, 0.2978885, 1, 1, 1, 1, 1,
-0.180446, -1.760607, -3.960614, 1, 1, 1, 1, 1,
-0.1797409, -0.7616799, -4.918821, 1, 1, 1, 1, 1,
-0.1786382, -1.804538, -4.011708, 1, 1, 1, 1, 1,
-0.1681853, 1.656437, -0.06495747, 1, 1, 1, 1, 1,
-0.1676063, -0.4421336, -1.050498, 1, 1, 1, 1, 1,
-0.1674817, 0.4443147, -1.143888, 1, 1, 1, 1, 1,
-0.16441, -0.4472415, -4.131169, 1, 1, 1, 1, 1,
-0.1621021, 0.1149824, -1.862027, 1, 1, 1, 1, 1,
-0.1606923, 0.1500794, -0.5622236, 1, 1, 1, 1, 1,
-0.1591159, -0.3007235, -2.020061, 1, 1, 1, 1, 1,
-0.1587056, 1.494142, -0.5211806, 1, 1, 1, 1, 1,
-0.1583293, -1.573341, -3.170704, 0, 0, 1, 1, 1,
-0.1555787, -0.2710705, -0.6934897, 1, 0, 0, 1, 1,
-0.1530013, 1.363238, -2.278458, 1, 0, 0, 1, 1,
-0.1465122, 1.207336, -0.615288, 1, 0, 0, 1, 1,
-0.1447, -0.7907769, -3.447386, 1, 0, 0, 1, 1,
-0.1441169, 1.191121, -1.550792, 1, 0, 0, 1, 1,
-0.1400707, 1.236622, -1.773245, 0, 0, 0, 1, 1,
-0.1395366, 1.126367, -1.476606, 0, 0, 0, 1, 1,
-0.1386124, 0.2461559, -1.902836, 0, 0, 0, 1, 1,
-0.1344653, -0.1625544, -1.213846, 0, 0, 0, 1, 1,
-0.125985, 0.4097299, 0.6495479, 0, 0, 0, 1, 1,
-0.123847, -0.1663842, -2.606121, 0, 0, 0, 1, 1,
-0.1201701, -1.002366, -4.411796, 0, 0, 0, 1, 1,
-0.1187904, 0.8096566, 0.5041931, 1, 1, 1, 1, 1,
-0.1186349, -2.466003, -2.55308, 1, 1, 1, 1, 1,
-0.1156367, -0.7610723, -3.950207, 1, 1, 1, 1, 1,
-0.1134101, -1.164512, -3.338134, 1, 1, 1, 1, 1,
-0.1122394, -1.379568, -3.593812, 1, 1, 1, 1, 1,
-0.1093377, -0.2867814, -3.41982, 1, 1, 1, 1, 1,
-0.1075559, 0.6661208, 0.6751669, 1, 1, 1, 1, 1,
-0.1010339, 0.558147, 0.7895104, 1, 1, 1, 1, 1,
-0.09982064, 1.689616, 0.8345114, 1, 1, 1, 1, 1,
-0.09728914, -1.857231, -3.400882, 1, 1, 1, 1, 1,
-0.09458622, -3.235196, -3.081079, 1, 1, 1, 1, 1,
-0.09197004, 0.2720624, -0.04492714, 1, 1, 1, 1, 1,
-0.08882141, -2.655688, -2.385916, 1, 1, 1, 1, 1,
-0.08717596, -0.3202852, -3.24179, 1, 1, 1, 1, 1,
-0.08442757, 0.31853, 0.03793725, 1, 1, 1, 1, 1,
-0.08118439, -1.107334, -2.831799, 0, 0, 1, 1, 1,
-0.08058272, -0.9910941, -2.945923, 1, 0, 0, 1, 1,
-0.07794493, 0.2135373, 0.6019439, 1, 0, 0, 1, 1,
-0.07737728, -0.9833096, -3.533019, 1, 0, 0, 1, 1,
-0.07597908, -0.1711884, -3.546594, 1, 0, 0, 1, 1,
-0.07543582, -0.866107, -2.964858, 1, 0, 0, 1, 1,
-0.07374144, -1.127792, -4.337253, 0, 0, 0, 1, 1,
-0.0733695, -0.9763424, -3.514061, 0, 0, 0, 1, 1,
-0.071413, 1.264871, 0.08171716, 0, 0, 0, 1, 1,
-0.07058767, 0.3577678, -1.333235, 0, 0, 0, 1, 1,
-0.07050174, 0.7623408, -0.2466519, 0, 0, 0, 1, 1,
-0.06550715, 0.711818, -1.558152, 0, 0, 0, 1, 1,
-0.06527221, -0.7746125, -1.941621, 0, 0, 0, 1, 1,
-0.05963354, -1.406739, -2.635828, 1, 1, 1, 1, 1,
-0.05818036, 0.04964882, 0.4982722, 1, 1, 1, 1, 1,
-0.05690109, -0.9554084, -3.812836, 1, 1, 1, 1, 1,
-0.04149995, -0.1071422, -2.627607, 1, 1, 1, 1, 1,
-0.04096328, -1.869775, -2.827168, 1, 1, 1, 1, 1,
-0.0395317, 0.7575916, 0.6301593, 1, 1, 1, 1, 1,
-0.03825236, -2.253201, -3.962091, 1, 1, 1, 1, 1,
-0.03660585, 0.5190038, 0.04523818, 1, 1, 1, 1, 1,
-0.03632865, -0.7754408, -0.9861086, 1, 1, 1, 1, 1,
-0.0304884, -0.9124976, -3.028176, 1, 1, 1, 1, 1,
-0.02846259, -0.8871862, -4.085534, 1, 1, 1, 1, 1,
-0.0271909, 0.346898, 0.8608725, 1, 1, 1, 1, 1,
-0.0243223, -0.3848897, -4.602396, 1, 1, 1, 1, 1,
-0.02293888, 0.5443403, -0.5923352, 1, 1, 1, 1, 1,
-0.02235172, 0.05543656, -1.622064, 1, 1, 1, 1, 1,
-0.02206578, 0.5694329, -0.7988904, 0, 0, 1, 1, 1,
-0.01897666, -0.5954915, -3.361403, 1, 0, 0, 1, 1,
-0.01813835, -0.2911048, -1.475391, 1, 0, 0, 1, 1,
-0.01224411, 0.3755298, -0.9715336, 1, 0, 0, 1, 1,
-0.008769354, 1.050501, -0.3172041, 1, 0, 0, 1, 1,
-0.00812986, -0.7511264, -4.243231, 1, 0, 0, 1, 1,
-0.008074729, -2.039895, -1.684824, 0, 0, 0, 1, 1,
-0.00533695, -0.3422513, -3.072743, 0, 0, 0, 1, 1,
-0.002832195, -0.2483755, -4.420036, 0, 0, 0, 1, 1,
-0.001440024, -0.09542091, -3.610621, 0, 0, 0, 1, 1,
-0.0009048496, 1.041463, -1.506612, 0, 0, 0, 1, 1,
0.0001322056, -0.8200842, 3.449285, 0, 0, 0, 1, 1,
0.00255456, 1.335607, -0.1921367, 0, 0, 0, 1, 1,
0.003948958, 1.145836, 0.8953296, 1, 1, 1, 1, 1,
0.007001595, 0.1691223, -0.9436299, 1, 1, 1, 1, 1,
0.01056654, -0.8557189, 4.221653, 1, 1, 1, 1, 1,
0.01813528, -1.718036, 1.779375, 1, 1, 1, 1, 1,
0.01979582, 0.4478087, 0.1155419, 1, 1, 1, 1, 1,
0.02086546, 0.01450429, 0.6195313, 1, 1, 1, 1, 1,
0.02130244, -1.446226, 3.069818, 1, 1, 1, 1, 1,
0.02526605, -2.449334, 5.014659, 1, 1, 1, 1, 1,
0.02661981, 1.7042, -1.634326, 1, 1, 1, 1, 1,
0.03186984, -0.7368642, 2.317488, 1, 1, 1, 1, 1,
0.03341995, 0.1076661, 1.746938, 1, 1, 1, 1, 1,
0.03414214, -1.004216, 4.721257, 1, 1, 1, 1, 1,
0.03553639, 0.5890915, 1.303746, 1, 1, 1, 1, 1,
0.03610833, -0.5434846, 3.473969, 1, 1, 1, 1, 1,
0.03663031, 0.3495133, -0.4801603, 1, 1, 1, 1, 1,
0.03716178, -0.5838501, 2.958061, 0, 0, 1, 1, 1,
0.0391085, -0.8106092, 3.723275, 1, 0, 0, 1, 1,
0.03920384, 0.8849329, 3.155069, 1, 0, 0, 1, 1,
0.03974804, -0.6296746, 1.562379, 1, 0, 0, 1, 1,
0.04067118, 0.3140197, 0.4667557, 1, 0, 0, 1, 1,
0.04214117, 0.6475736, -0.1743158, 1, 0, 0, 1, 1,
0.04305889, -0.1455769, 1.278296, 0, 0, 0, 1, 1,
0.04579686, -1.591232, 4.330978, 0, 0, 0, 1, 1,
0.05016059, -0.005932986, 1.463829, 0, 0, 0, 1, 1,
0.0513633, -0.402136, 4.035765, 0, 0, 0, 1, 1,
0.0540343, -1.834754, 3.071219, 0, 0, 0, 1, 1,
0.05429652, 1.693935, -0.04606677, 0, 0, 0, 1, 1,
0.06801098, -0.1460631, 4.976339, 0, 0, 0, 1, 1,
0.0683962, -0.513795, 3.798151, 1, 1, 1, 1, 1,
0.06996635, 0.5665997, 0.7044023, 1, 1, 1, 1, 1,
0.07019386, -0.6641153, 2.546521, 1, 1, 1, 1, 1,
0.0729404, -0.2308629, 3.488524, 1, 1, 1, 1, 1,
0.07337005, -0.4040583, 3.978481, 1, 1, 1, 1, 1,
0.07680982, 1.161166, -1.539889, 1, 1, 1, 1, 1,
0.07971172, 0.8181574, 1.13588, 1, 1, 1, 1, 1,
0.08032452, 0.3671047, 0.6148747, 1, 1, 1, 1, 1,
0.0830444, 0.5763218, 0.09332881, 1, 1, 1, 1, 1,
0.08615187, -1.125761, 1.763328, 1, 1, 1, 1, 1,
0.08840289, -0.07242204, 0.9463459, 1, 1, 1, 1, 1,
0.09207416, 0.8334209, 0.4197637, 1, 1, 1, 1, 1,
0.09703603, -0.4885779, 2.168999, 1, 1, 1, 1, 1,
0.09864267, -0.8515465, 2.818497, 1, 1, 1, 1, 1,
0.09878648, 0.2691254, 0.1940064, 1, 1, 1, 1, 1,
0.09892657, 0.049883, 0.2469403, 0, 0, 1, 1, 1,
0.09939983, 0.7365482, -1.202163, 1, 0, 0, 1, 1,
0.101369, -1.00272, 3.706648, 1, 0, 0, 1, 1,
0.1017258, 2.06983, 0.3285688, 1, 0, 0, 1, 1,
0.1039371, 0.6117224, -0.5655144, 1, 0, 0, 1, 1,
0.1059035, -0.5254275, 4.702664, 1, 0, 0, 1, 1,
0.1064624, -0.1663994, 2.237284, 0, 0, 0, 1, 1,
0.1094644, -0.5113091, 4.534481, 0, 0, 0, 1, 1,
0.113075, -1.38363, 2.789869, 0, 0, 0, 1, 1,
0.1175203, 0.7486339, 1.287784, 0, 0, 0, 1, 1,
0.1182438, 0.7422881, -0.3628795, 0, 0, 0, 1, 1,
0.1185323, 0.7085233, 0.7065083, 0, 0, 0, 1, 1,
0.1193528, 0.7319413, 0.07084637, 0, 0, 0, 1, 1,
0.126371, -0.6339719, 2.280916, 1, 1, 1, 1, 1,
0.128932, -1.136854, 4.408861, 1, 1, 1, 1, 1,
0.1298139, 0.3403893, -0.2094257, 1, 1, 1, 1, 1,
0.1313804, -0.8991439, 3.717637, 1, 1, 1, 1, 1,
0.1318612, -2.315122, 3.851056, 1, 1, 1, 1, 1,
0.1347477, 0.1856704, 1.148734, 1, 1, 1, 1, 1,
0.1357347, -0.2507924, 3.146382, 1, 1, 1, 1, 1,
0.135786, 1.580351, -1.221348, 1, 1, 1, 1, 1,
0.1379246, 0.6163648, 1.755538, 1, 1, 1, 1, 1,
0.1392059, 0.9691091, 0.3923903, 1, 1, 1, 1, 1,
0.1392744, 0.4909311, -0.996647, 1, 1, 1, 1, 1,
0.1462483, -0.5550843, 3.431196, 1, 1, 1, 1, 1,
0.1490031, 0.7104973, 0.9391118, 1, 1, 1, 1, 1,
0.1491012, 0.008164342, 1.542226, 1, 1, 1, 1, 1,
0.1579963, 0.2957915, 1.377187, 1, 1, 1, 1, 1,
0.1591978, -0.1829261, 1.929664, 0, 0, 1, 1, 1,
0.1597882, 0.1016692, 0.7827429, 1, 0, 0, 1, 1,
0.161904, 1.751206, 0.09605337, 1, 0, 0, 1, 1,
0.1619902, 0.3580024, 1.388934, 1, 0, 0, 1, 1,
0.1664004, -0.2329632, 1.015458, 1, 0, 0, 1, 1,
0.1664759, 0.4066167, 1.372039, 1, 0, 0, 1, 1,
0.1679521, 1.564949, 0.01778217, 0, 0, 0, 1, 1,
0.1694433, 0.1082998, 1.380149, 0, 0, 0, 1, 1,
0.1709504, 0.3366302, 1.300868, 0, 0, 0, 1, 1,
0.1712016, -0.7778175, 2.451131, 0, 0, 0, 1, 1,
0.1801104, 1.565566, -0.7887807, 0, 0, 0, 1, 1,
0.1828919, 0.7184135, 2.18537, 0, 0, 0, 1, 1,
0.1840191, -1.149597, 3.960755, 0, 0, 0, 1, 1,
0.1856625, 0.8125581, -1.034039, 1, 1, 1, 1, 1,
0.1865993, 1.619677, 0.4295652, 1, 1, 1, 1, 1,
0.1866469, -0.7481156, 1.336708, 1, 1, 1, 1, 1,
0.1874094, -0.5474722, 3.403421, 1, 1, 1, 1, 1,
0.1897545, -0.2691338, 2.236264, 1, 1, 1, 1, 1,
0.1920655, 0.8306406, 0.6834797, 1, 1, 1, 1, 1,
0.1928945, 0.3163529, -1.80721, 1, 1, 1, 1, 1,
0.1973455, -2.218452, 2.90005, 1, 1, 1, 1, 1,
0.1988379, -0.2274587, 4.288757, 1, 1, 1, 1, 1,
0.2012547, 1.061553, 2.157471, 1, 1, 1, 1, 1,
0.2027747, 0.9877979, 0.1188335, 1, 1, 1, 1, 1,
0.2085685, -1.02168, 3.149496, 1, 1, 1, 1, 1,
0.2115204, 0.9013368, 0.2298775, 1, 1, 1, 1, 1,
0.2164364, 0.655811, 1.339875, 1, 1, 1, 1, 1,
0.2173051, 0.2242421, 0.1309105, 1, 1, 1, 1, 1,
0.2209491, 0.4531411, 0.9579617, 0, 0, 1, 1, 1,
0.22257, -0.4117833, 2.698681, 1, 0, 0, 1, 1,
0.2274932, 1.862073, 0.5916883, 1, 0, 0, 1, 1,
0.2288011, 1.306257, -0.3741485, 1, 0, 0, 1, 1,
0.2337794, -0.2067766, 0.9422308, 1, 0, 0, 1, 1,
0.2338745, -1.310753, 3.619895, 1, 0, 0, 1, 1,
0.2339583, -1.338233, 2.626359, 0, 0, 0, 1, 1,
0.2348886, -0.2449103, 3.391706, 0, 0, 0, 1, 1,
0.2357406, -0.2078772, 1.730833, 0, 0, 0, 1, 1,
0.2357666, -0.1318203, 2.600746, 0, 0, 0, 1, 1,
0.2366017, -0.266703, 3.735423, 0, 0, 0, 1, 1,
0.2374795, -1.602111, 3.480609, 0, 0, 0, 1, 1,
0.2410309, -0.9927089, 2.938274, 0, 0, 0, 1, 1,
0.2444979, -0.1302784, 1.227363, 1, 1, 1, 1, 1,
0.247829, 1.568005, -0.801474, 1, 1, 1, 1, 1,
0.2507793, -0.08870768, 2.626717, 1, 1, 1, 1, 1,
0.250905, 0.8753785, 0.03629577, 1, 1, 1, 1, 1,
0.2545631, 1.689312, -0.03785394, 1, 1, 1, 1, 1,
0.2546144, 0.1178825, 1.42034, 1, 1, 1, 1, 1,
0.2554142, -0.7389208, 3.461943, 1, 1, 1, 1, 1,
0.2607903, -0.5467835, 3.168998, 1, 1, 1, 1, 1,
0.2656942, -0.4231145, 1.432801, 1, 1, 1, 1, 1,
0.2671745, 1.181725, -1.036994, 1, 1, 1, 1, 1,
0.2674575, -1.304627, 3.505763, 1, 1, 1, 1, 1,
0.2776389, 1.895311, 0.4867312, 1, 1, 1, 1, 1,
0.2800932, -0.3656306, 1.987206, 1, 1, 1, 1, 1,
0.2831056, -0.1404797, 2.840462, 1, 1, 1, 1, 1,
0.2873849, 1.289221, 0.068835, 1, 1, 1, 1, 1,
0.287646, -2.244589, 2.136979, 0, 0, 1, 1, 1,
0.2887482, -0.7057611, 4.835909, 1, 0, 0, 1, 1,
0.2918624, 0.2985868, 0.722958, 1, 0, 0, 1, 1,
0.2919302, 0.6127257, 1.409525, 1, 0, 0, 1, 1,
0.2919695, -0.5482883, 3.256006, 1, 0, 0, 1, 1,
0.2924011, 0.8848637, 0.2531521, 1, 0, 0, 1, 1,
0.2938853, -0.02008818, 2.452355, 0, 0, 0, 1, 1,
0.2985129, -0.4248593, 2.394382, 0, 0, 0, 1, 1,
0.3023575, 0.2610289, 1.078153, 0, 0, 0, 1, 1,
0.3044896, 0.2236907, 1.230211, 0, 0, 0, 1, 1,
0.310781, 0.9222347, 0.4032951, 0, 0, 0, 1, 1,
0.3113191, 0.2648594, 1.672311, 0, 0, 0, 1, 1,
0.3113542, -0.9794784, 3.2059, 0, 0, 0, 1, 1,
0.31408, -1.226013, 1.05715, 1, 1, 1, 1, 1,
0.3155712, 1.408759, 0.8151295, 1, 1, 1, 1, 1,
0.3193, 0.894696, 0.4661244, 1, 1, 1, 1, 1,
0.3228793, 0.4170889, -0.1209989, 1, 1, 1, 1, 1,
0.3229341, 0.1501205, 1.029191, 1, 1, 1, 1, 1,
0.323835, -0.5398431, 2.279605, 1, 1, 1, 1, 1,
0.3254002, -0.1317932, 0.9931281, 1, 1, 1, 1, 1,
0.3267222, -0.0672827, -0.0931147, 1, 1, 1, 1, 1,
0.3296491, -0.3009946, 2.841558, 1, 1, 1, 1, 1,
0.3307476, 1.220522, -0.2219582, 1, 1, 1, 1, 1,
0.3327413, 0.1185966, 1.685642, 1, 1, 1, 1, 1,
0.3346134, 1.390307, -0.206118, 1, 1, 1, 1, 1,
0.3405305, -1.286379, 3.777374, 1, 1, 1, 1, 1,
0.3416212, 0.751852, -0.2416264, 1, 1, 1, 1, 1,
0.3457813, -0.3886313, 2.675432, 1, 1, 1, 1, 1,
0.3538035, 1.117095, 1.327789, 0, 0, 1, 1, 1,
0.3563716, -1.115057, 4.141801, 1, 0, 0, 1, 1,
0.3570415, 1.817376, 0.8217871, 1, 0, 0, 1, 1,
0.3583094, 0.06741538, 0.3816068, 1, 0, 0, 1, 1,
0.3757383, -0.5507051, 2.705706, 1, 0, 0, 1, 1,
0.3776216, 2.204729, 1.664766, 1, 0, 0, 1, 1,
0.3790155, -0.206342, 1.124778, 0, 0, 0, 1, 1,
0.3847743, -1.035627, 2.960706, 0, 0, 0, 1, 1,
0.3870117, -0.368234, 2.414675, 0, 0, 0, 1, 1,
0.3905411, 0.345596, 0.9696776, 0, 0, 0, 1, 1,
0.3924644, -0.9009088, 2.693693, 0, 0, 0, 1, 1,
0.3946049, 0.9164615, 0.726335, 0, 0, 0, 1, 1,
0.4005975, -1.467866, 4.515162, 0, 0, 0, 1, 1,
0.4008096, -1.939615, 3.480999, 1, 1, 1, 1, 1,
0.4038935, -0.8807025, 1.47, 1, 1, 1, 1, 1,
0.4040982, -0.5636668, 2.555933, 1, 1, 1, 1, 1,
0.4074988, -0.4620814, 2.057691, 1, 1, 1, 1, 1,
0.4111861, 1.383639, 1.420157, 1, 1, 1, 1, 1,
0.4153514, -1.142631, 4.14597, 1, 1, 1, 1, 1,
0.4192958, -0.805294, 1.962695, 1, 1, 1, 1, 1,
0.420251, -0.6485513, 2.336659, 1, 1, 1, 1, 1,
0.4211935, 1.312519, 0.3397817, 1, 1, 1, 1, 1,
0.4224524, 0.4605681, 0.8548737, 1, 1, 1, 1, 1,
0.4225923, -0.8529929, 2.254533, 1, 1, 1, 1, 1,
0.4266858, 0.1569164, 2.007913, 1, 1, 1, 1, 1,
0.4283611, 0.6603686, 0.7877234, 1, 1, 1, 1, 1,
0.4310995, -0.4596346, 1.929601, 1, 1, 1, 1, 1,
0.437811, 0.7261984, -0.3404833, 1, 1, 1, 1, 1,
0.4392662, 1.406533, 0.9774876, 0, 0, 1, 1, 1,
0.4407885, -1.218821, 2.97737, 1, 0, 0, 1, 1,
0.4425469, 2.281058, 0.4412383, 1, 0, 0, 1, 1,
0.4486932, 0.3982256, 1.57854, 1, 0, 0, 1, 1,
0.4495251, -1.112191, 2.969537, 1, 0, 0, 1, 1,
0.4538091, 0.7925783, 1.08438, 1, 0, 0, 1, 1,
0.4548371, -0.586123, 4.344011, 0, 0, 0, 1, 1,
0.4553182, 0.826965, -1.283544, 0, 0, 0, 1, 1,
0.4581335, 1.073501, -0.1183469, 0, 0, 0, 1, 1,
0.4656636, 0.001384145, -0.004947448, 0, 0, 0, 1, 1,
0.4689164, 0.03166494, 2.589621, 0, 0, 0, 1, 1,
0.4697169, 0.03605605, 0.6962569, 0, 0, 0, 1, 1,
0.4732173, 0.3609559, -0.0200969, 0, 0, 0, 1, 1,
0.4903062, 0.1127148, 1.656852, 1, 1, 1, 1, 1,
0.4910955, -1.053682, 1.827774, 1, 1, 1, 1, 1,
0.4914121, -1.732608, 3.503229, 1, 1, 1, 1, 1,
0.49386, 1.976252, -0.9680244, 1, 1, 1, 1, 1,
0.4961286, 0.2412186, 0.7184089, 1, 1, 1, 1, 1,
0.5051094, -0.128134, 1.668944, 1, 1, 1, 1, 1,
0.5051481, 1.589871, 1.294431, 1, 1, 1, 1, 1,
0.5112635, -0.3951623, 2.09875, 1, 1, 1, 1, 1,
0.5151907, 1.654675, 0.01571439, 1, 1, 1, 1, 1,
0.5167592, 1.838609, -2.092203, 1, 1, 1, 1, 1,
0.5190723, -2.160002, 2.002171, 1, 1, 1, 1, 1,
0.5240334, -1.25053, 2.648456, 1, 1, 1, 1, 1,
0.5240749, 0.8887253, -0.3231443, 1, 1, 1, 1, 1,
0.5279971, 0.9357404, -1.15617, 1, 1, 1, 1, 1,
0.5301823, 0.2598157, -0.04180964, 1, 1, 1, 1, 1,
0.5303109, 0.5844599, 0.6333049, 0, 0, 1, 1, 1,
0.5316048, 2.083325, -0.2138157, 1, 0, 0, 1, 1,
0.531967, 0.2921571, 1.142284, 1, 0, 0, 1, 1,
0.5326609, -1.321417, 2.08759, 1, 0, 0, 1, 1,
0.5339347, 0.3453363, 0.8849854, 1, 0, 0, 1, 1,
0.5380126, -0.2197767, 1.884548, 1, 0, 0, 1, 1,
0.5394082, -1.228008, 1.31262, 0, 0, 0, 1, 1,
0.5449876, 1.481557, -0.7605423, 0, 0, 0, 1, 1,
0.5486971, -0.7230489, 0.6567842, 0, 0, 0, 1, 1,
0.5494254, -0.667418, 3.285995, 0, 0, 0, 1, 1,
0.5508811, 2.180181, -1.527133, 0, 0, 0, 1, 1,
0.5512414, -0.5056516, 2.776466, 0, 0, 0, 1, 1,
0.5557114, -1.402525, 2.133031, 0, 0, 0, 1, 1,
0.5595158, -0.3925104, 1.509786, 1, 1, 1, 1, 1,
0.5619659, -1.55392, 5.55964, 1, 1, 1, 1, 1,
0.5668304, 0.1023833, 1.103628, 1, 1, 1, 1, 1,
0.5842022, 1.366425, 2.028173, 1, 1, 1, 1, 1,
0.5891681, 2.297709, 0.09726957, 1, 1, 1, 1, 1,
0.5946949, 0.4962577, 0.4211143, 1, 1, 1, 1, 1,
0.5947484, 1.302447, -0.134829, 1, 1, 1, 1, 1,
0.5958276, -0.2030539, 1.563443, 1, 1, 1, 1, 1,
0.5961467, -0.2267007, 0.8570869, 1, 1, 1, 1, 1,
0.5964478, 1.430079, 1.477933, 1, 1, 1, 1, 1,
0.597822, -1.278337, 3.336368, 1, 1, 1, 1, 1,
0.5980348, -0.6962306, 1.062826, 1, 1, 1, 1, 1,
0.602494, 0.2586511, 1.6021, 1, 1, 1, 1, 1,
0.6025349, -0.1385926, 1.829039, 1, 1, 1, 1, 1,
0.604228, 0.5694548, -1.04989, 1, 1, 1, 1, 1,
0.6215845, 0.01582728, 2.149814, 0, 0, 1, 1, 1,
0.6244702, -0.6044459, 2.233174, 1, 0, 0, 1, 1,
0.6252828, -0.8077875, 2.92186, 1, 0, 0, 1, 1,
0.6274142, 0.3898408, 1.403742, 1, 0, 0, 1, 1,
0.6302538, 0.6784487, 0.5148117, 1, 0, 0, 1, 1,
0.6526345, 1.806619, 0.4193663, 1, 0, 0, 1, 1,
0.6536166, 1.981811, -0.6548015, 0, 0, 0, 1, 1,
0.6611977, 0.2207254, 1.411779, 0, 0, 0, 1, 1,
0.663652, 0.3603281, 0.6778123, 0, 0, 0, 1, 1,
0.6688182, -2.001468, 2.123254, 0, 0, 0, 1, 1,
0.6715754, 1.580081, 1.104142, 0, 0, 0, 1, 1,
0.6739255, 1.622671, 1.080075, 0, 0, 0, 1, 1,
0.6746178, 0.07498185, 0.9503005, 0, 0, 0, 1, 1,
0.6850618, -1.333291, 1.666826, 1, 1, 1, 1, 1,
0.6892911, 1.376256, 0.9370541, 1, 1, 1, 1, 1,
0.6911841, -0.1832735, 1.767215, 1, 1, 1, 1, 1,
0.6974125, -2.046317, 1.874015, 1, 1, 1, 1, 1,
0.698655, -2.55494, 2.712416, 1, 1, 1, 1, 1,
0.7087715, -0.3396837, 1.362934, 1, 1, 1, 1, 1,
0.7130287, 1.496768, 0.1826791, 1, 1, 1, 1, 1,
0.7182345, -0.3492636, 3.376635, 1, 1, 1, 1, 1,
0.7246541, 0.0227612, 1.085431, 1, 1, 1, 1, 1,
0.72509, -0.377385, 2.031118, 1, 1, 1, 1, 1,
0.7348325, 0.2405015, 1.964644, 1, 1, 1, 1, 1,
0.7396029, -1.314036, 0.8989093, 1, 1, 1, 1, 1,
0.7446031, -0.4941481, 1.298144, 1, 1, 1, 1, 1,
0.7451684, -0.5542461, -0.2419457, 1, 1, 1, 1, 1,
0.7466815, 0.7577833, 1.581987, 1, 1, 1, 1, 1,
0.7482744, -0.3631949, 2.747503, 0, 0, 1, 1, 1,
0.7492364, -0.5099304, 2.941198, 1, 0, 0, 1, 1,
0.7555804, -1.393195, 1.097902, 1, 0, 0, 1, 1,
0.7574545, 0.461435, 0.6736928, 1, 0, 0, 1, 1,
0.7596996, -0.2152264, 2.899779, 1, 0, 0, 1, 1,
0.760119, -0.3397832, 0.1666394, 1, 0, 0, 1, 1,
0.7623156, -0.2910129, 3.458893, 0, 0, 0, 1, 1,
0.7638056, -1.224982, 2.177981, 0, 0, 0, 1, 1,
0.7722844, -0.2732997, -1.29333, 0, 0, 0, 1, 1,
0.773755, -0.3128875, 1.436181, 0, 0, 0, 1, 1,
0.7767468, -0.8673002, 3.030043, 0, 0, 0, 1, 1,
0.7805579, 0.3848564, 2.128973, 0, 0, 0, 1, 1,
0.7813939, -0.9347931, 2.403468, 0, 0, 0, 1, 1,
0.7817428, -0.4492089, 4.129654, 1, 1, 1, 1, 1,
0.7840187, 0.2435705, 1.281611, 1, 1, 1, 1, 1,
0.7842616, -0.3485144, 3.467682, 1, 1, 1, 1, 1,
0.7899644, 0.04010192, 1.57987, 1, 1, 1, 1, 1,
0.792744, -1.383394, 1.879733, 1, 1, 1, 1, 1,
0.7951002, 1.233221, 1.51452, 1, 1, 1, 1, 1,
0.7956493, 1.671423, -0.1389419, 1, 1, 1, 1, 1,
0.7981768, 1.245138, -0.8091807, 1, 1, 1, 1, 1,
0.7997716, 0.7308818, 1.558602, 1, 1, 1, 1, 1,
0.7999721, -0.4354631, 1.419601, 1, 1, 1, 1, 1,
0.8011708, -0.4157309, 3.352186, 1, 1, 1, 1, 1,
0.8018132, -1.048775, 2.373587, 1, 1, 1, 1, 1,
0.8022676, 0.5389279, 1.199323, 1, 1, 1, 1, 1,
0.807816, 0.3175826, 1.252903, 1, 1, 1, 1, 1,
0.812694, -0.1076734, 0.3126852, 1, 1, 1, 1, 1,
0.8130907, 0.3322175, 0.5424323, 0, 0, 1, 1, 1,
0.8259773, 1.121255, 2.122475, 1, 0, 0, 1, 1,
0.8268645, 0.987255, -0.1276424, 1, 0, 0, 1, 1,
0.8270988, 1.065508, 0.2341794, 1, 0, 0, 1, 1,
0.8320603, -1.664333, 1.80496, 1, 0, 0, 1, 1,
0.8389894, 1.282797, 1.688816, 1, 0, 0, 1, 1,
0.8421423, 1.124725, 0.9218313, 0, 0, 0, 1, 1,
0.8441955, -0.3196126, 0.8340638, 0, 0, 0, 1, 1,
0.8482309, -0.9952806, 1.41106, 0, 0, 0, 1, 1,
0.8523302, 0.09823511, 1.627513, 0, 0, 0, 1, 1,
0.8539104, -0.9965459, 2.493612, 0, 0, 0, 1, 1,
0.8556141, -0.999674, 3.742482, 0, 0, 0, 1, 1,
0.8628663, 0.2106027, 1.644978, 0, 0, 0, 1, 1,
0.8635224, -0.1829005, 3.583458, 1, 1, 1, 1, 1,
0.8637627, 1.976081, 1.599634, 1, 1, 1, 1, 1,
0.871527, 0.654248, 1.19504, 1, 1, 1, 1, 1,
0.87462, 1.189454, -0.6390004, 1, 1, 1, 1, 1,
0.8807154, -1.72384, 1.927047, 1, 1, 1, 1, 1,
0.8820624, -0.202213, 1.561212, 1, 1, 1, 1, 1,
0.884172, 1.990562, 0.1078596, 1, 1, 1, 1, 1,
0.8846284, 0.3839908, 1.159605, 1, 1, 1, 1, 1,
0.8871966, -1.336513, 1.96986, 1, 1, 1, 1, 1,
0.8901268, -0.05794213, 2.223716, 1, 1, 1, 1, 1,
0.8913847, -1.070968, 2.775926, 1, 1, 1, 1, 1,
0.8938603, -0.811468, 1.2179, 1, 1, 1, 1, 1,
0.8982662, 1.295277, 1.596173, 1, 1, 1, 1, 1,
0.9002575, -0.8288895, 3.703768, 1, 1, 1, 1, 1,
0.9073756, -0.6953273, 1.536965, 1, 1, 1, 1, 1,
0.9127569, -0.263787, 3.351222, 0, 0, 1, 1, 1,
0.9489157, -0.2593079, 3.05848, 1, 0, 0, 1, 1,
0.9492999, 0.0890673, 1.186701, 1, 0, 0, 1, 1,
0.9523258, 0.2028421, 1.766733, 1, 0, 0, 1, 1,
0.9562965, -0.4007401, 3.104138, 1, 0, 0, 1, 1,
0.9577482, -0.8683698, 2.969289, 1, 0, 0, 1, 1,
0.9673213, -0.762388, 2.445997, 0, 0, 0, 1, 1,
0.9681167, 2.176877, 1.570563, 0, 0, 0, 1, 1,
0.9746326, 0.8708179, 0.5821484, 0, 0, 0, 1, 1,
0.9749255, 0.6469977, 0.465314, 0, 0, 0, 1, 1,
0.9782474, -1.310219, 3.771512, 0, 0, 0, 1, 1,
0.9800531, 0.8294535, -0.1249191, 0, 0, 0, 1, 1,
0.9858967, -0.5610824, 1.376149, 0, 0, 0, 1, 1,
0.98802, 0.3613415, 0.6907191, 1, 1, 1, 1, 1,
0.9900934, 1.602945, -1.472278, 1, 1, 1, 1, 1,
0.9927993, -0.4255607, 1.817613, 1, 1, 1, 1, 1,
0.9932871, -0.235073, 3.655662, 1, 1, 1, 1, 1,
0.9985231, 2.138842, 0.169543, 1, 1, 1, 1, 1,
1.002744, -0.7110878, -0.08073016, 1, 1, 1, 1, 1,
1.007841, -1.592675, 2.336639, 1, 1, 1, 1, 1,
1.018533, 0.477209, 0.4736501, 1, 1, 1, 1, 1,
1.024244, -0.2067625, 3.83625, 1, 1, 1, 1, 1,
1.034595, 0.4669769, 2.510327, 1, 1, 1, 1, 1,
1.03695, 0.7388131, 1.583548, 1, 1, 1, 1, 1,
1.042359, 0.8932825, 1.774538, 1, 1, 1, 1, 1,
1.04527, -0.003553902, 0.5506333, 1, 1, 1, 1, 1,
1.053099, -0.9028794, 1.171391, 1, 1, 1, 1, 1,
1.059832, 0.4503327, 1.338084, 1, 1, 1, 1, 1,
1.060416, 1.377879, 0.5827038, 0, 0, 1, 1, 1,
1.074823, 0.3181576, 0.09109774, 1, 0, 0, 1, 1,
1.080379, 1.505237, 0.1932213, 1, 0, 0, 1, 1,
1.093274, 1.278439, 1.273782, 1, 0, 0, 1, 1,
1.09489, -0.4448071, 2.435719, 1, 0, 0, 1, 1,
1.109305, 1.666436, -0.02612821, 1, 0, 0, 1, 1,
1.109573, -0.2659319, 2.007639, 0, 0, 0, 1, 1,
1.113827, 0.3642292, 1.832363, 0, 0, 0, 1, 1,
1.1258, 0.3929033, 1.178384, 0, 0, 0, 1, 1,
1.133819, -1.995293, 2.600558, 0, 0, 0, 1, 1,
1.135932, 1.196859, 3.152724, 0, 0, 0, 1, 1,
1.146618, 0.4868542, 0.9824452, 0, 0, 0, 1, 1,
1.151357, -0.8568184, 2.038663, 0, 0, 0, 1, 1,
1.157356, -1.150393, 2.650774, 1, 1, 1, 1, 1,
1.164321, -1.250924, 4.431715, 1, 1, 1, 1, 1,
1.174336, 0.5786672, 0.2638519, 1, 1, 1, 1, 1,
1.182983, -0.1197194, 1.865476, 1, 1, 1, 1, 1,
1.190599, 0.2158447, 1.319165, 1, 1, 1, 1, 1,
1.199407, -3.015751, 3.877434, 1, 1, 1, 1, 1,
1.208943, 0.607207, 0.4314796, 1, 1, 1, 1, 1,
1.209852, -0.03554543, 1.563066, 1, 1, 1, 1, 1,
1.211215, -1.197319, 2.278736, 1, 1, 1, 1, 1,
1.21147, -0.4904258, 3.17796, 1, 1, 1, 1, 1,
1.223325, -0.4096393, 2.355175, 1, 1, 1, 1, 1,
1.224632, 0.1107392, 1.09513, 1, 1, 1, 1, 1,
1.227285, 0.09083288, 0.3498436, 1, 1, 1, 1, 1,
1.228395, -0.3187432, 1.611713, 1, 1, 1, 1, 1,
1.228481, -0.6098371, 3.901207, 1, 1, 1, 1, 1,
1.229778, 1.064042, 1.860373, 0, 0, 1, 1, 1,
1.238705, 0.3854833, 1.590956, 1, 0, 0, 1, 1,
1.244446, -0.2949585, 1.941728, 1, 0, 0, 1, 1,
1.252604, 0.676604, 1.144889, 1, 0, 0, 1, 1,
1.264847, -0.2960898, 1.827851, 1, 0, 0, 1, 1,
1.265403, 0.4761547, 0.4332378, 1, 0, 0, 1, 1,
1.278422, -0.4179397, 2.727091, 0, 0, 0, 1, 1,
1.287959, -0.3185498, 0.5454788, 0, 0, 0, 1, 1,
1.294535, -0.1681449, 1.813552, 0, 0, 0, 1, 1,
1.307019, 0.5360172, 1.00191, 0, 0, 0, 1, 1,
1.334428, 1.144912, 0.6510237, 0, 0, 0, 1, 1,
1.355528, 0.358293, 1.111421, 0, 0, 0, 1, 1,
1.357784, 0.6989508, 0.9085867, 0, 0, 0, 1, 1,
1.361477, 0.1324431, 1.753201, 1, 1, 1, 1, 1,
1.365628, 1.046707, -0.1641994, 1, 1, 1, 1, 1,
1.381827, 2.191485, 2.029308, 1, 1, 1, 1, 1,
1.386621, -0.6234048, 1.589005, 1, 1, 1, 1, 1,
1.421462, 0.1317129, 1.874669, 1, 1, 1, 1, 1,
1.430164, 0.557843, 2.52859, 1, 1, 1, 1, 1,
1.43063, 0.7645009, 1.208191, 1, 1, 1, 1, 1,
1.437809, 0.7244233, 2.36951, 1, 1, 1, 1, 1,
1.438956, 0.1971766, 1.280722, 1, 1, 1, 1, 1,
1.445635, -1.586167, 2.279093, 1, 1, 1, 1, 1,
1.448518, -0.3065409, 0.8310224, 1, 1, 1, 1, 1,
1.449049, -0.5763644, 2.451129, 1, 1, 1, 1, 1,
1.450421, 0.03248858, 3.397629, 1, 1, 1, 1, 1,
1.451478, -1.357999, 1.182507, 1, 1, 1, 1, 1,
1.465852, 0.09434852, 0.8392283, 1, 1, 1, 1, 1,
1.467063, 1.364455, 1.027254, 0, 0, 1, 1, 1,
1.474926, 0.2137978, 2.221471, 1, 0, 0, 1, 1,
1.476462, -0.7928165, 2.753822, 1, 0, 0, 1, 1,
1.501317, 0.6199497, 1.750505, 1, 0, 0, 1, 1,
1.504078, 0.6751071, 0.3397759, 1, 0, 0, 1, 1,
1.51719, 0.2818025, 1.293506, 1, 0, 0, 1, 1,
1.519721, -0.9579487, 2.322224, 0, 0, 0, 1, 1,
1.53577, -0.3678215, 2.873683, 0, 0, 0, 1, 1,
1.548635, 1.382028, 1.318487, 0, 0, 0, 1, 1,
1.55055, -0.6557342, 3.595085, 0, 0, 0, 1, 1,
1.56728, 1.242127, 0.9305044, 0, 0, 0, 1, 1,
1.570935, -0.4489949, 1.546363, 0, 0, 0, 1, 1,
1.571229, 1.253555, -0.01063991, 0, 0, 0, 1, 1,
1.572432, 0.2558981, 3.208445, 1, 1, 1, 1, 1,
1.574934, -0.2434476, 2.290391, 1, 1, 1, 1, 1,
1.604432, -0.8144978, 2.091489, 1, 1, 1, 1, 1,
1.60471, -0.4982188, 4.13707, 1, 1, 1, 1, 1,
1.605639, 0.6365482, -0.1244728, 1, 1, 1, 1, 1,
1.613913, -3.044477, 2.809728, 1, 1, 1, 1, 1,
1.620486, -0.9804063, 2.807787, 1, 1, 1, 1, 1,
1.627425, 0.04079931, 1.195393, 1, 1, 1, 1, 1,
1.640923, -1.263948, 0.8308308, 1, 1, 1, 1, 1,
1.64195, 1.307655, 0.7806348, 1, 1, 1, 1, 1,
1.668638, 0.2835042, 0.1792336, 1, 1, 1, 1, 1,
1.687879, 1.231104, 1.380723, 1, 1, 1, 1, 1,
1.688251, -1.332993, 1.903538, 1, 1, 1, 1, 1,
1.694898, -0.06785557, 1.263019, 1, 1, 1, 1, 1,
1.714713, -1.085107, 3.843577, 1, 1, 1, 1, 1,
1.718499, -0.8678685, 1.709156, 0, 0, 1, 1, 1,
1.721144, 2.090151, 1.190002, 1, 0, 0, 1, 1,
1.731659, -2.092131, 3.599635, 1, 0, 0, 1, 1,
1.73761, 1.183899, 2.125946, 1, 0, 0, 1, 1,
1.743804, 0.6415704, 2.035736, 1, 0, 0, 1, 1,
1.749327, 0.1086349, -0.5054492, 1, 0, 0, 1, 1,
1.758033, -1.899451, 3.31265, 0, 0, 0, 1, 1,
1.782134, 0.6104017, 1.701639, 0, 0, 0, 1, 1,
1.782778, 1.122354, 2.961914, 0, 0, 0, 1, 1,
1.784742, 0.06502847, 0.4680765, 0, 0, 0, 1, 1,
1.798112, 0.6357799, 0.9824734, 0, 0, 0, 1, 1,
1.820423, -0.1015338, 1.996604, 0, 0, 0, 1, 1,
1.848587, 0.1380267, 1.404955, 0, 0, 0, 1, 1,
1.852817, 0.1292291, 2.010035, 1, 1, 1, 1, 1,
1.884998, -1.783466, 0.7484198, 1, 1, 1, 1, 1,
1.886429, -0.6775916, 0.7841558, 1, 1, 1, 1, 1,
1.926253, 0.5399466, -0.2016965, 1, 1, 1, 1, 1,
1.93635, 1.734887, 1.636717, 1, 1, 1, 1, 1,
1.940981, 0.3503731, 1.058536, 1, 1, 1, 1, 1,
1.951597, -0.5054046, 0.8367639, 1, 1, 1, 1, 1,
1.955297, -0.4057349, 1.753408, 1, 1, 1, 1, 1,
1.987462, 0.9113756, 1.36609, 1, 1, 1, 1, 1,
1.987921, 0.403702, 0.6074068, 1, 1, 1, 1, 1,
2.001873, -0.1430887, 3.151263, 1, 1, 1, 1, 1,
2.011035, 0.1572816, 0.4233462, 1, 1, 1, 1, 1,
2.013515, -1.594712, 3.348589, 1, 1, 1, 1, 1,
2.015017, -0.1052407, 0.8317079, 1, 1, 1, 1, 1,
2.043886, 0.1326025, 1.194241, 1, 1, 1, 1, 1,
2.167834, 0.8409839, 2.179518, 0, 0, 1, 1, 1,
2.200552, 3.118931, 1.734099, 1, 0, 0, 1, 1,
2.278889, 1.687465, 2.354378, 1, 0, 0, 1, 1,
2.304584, -0.6691688, 3.031433, 1, 0, 0, 1, 1,
2.306485, -0.173842, 3.39914, 1, 0, 0, 1, 1,
2.31145, -0.04900825, 2.199297, 1, 0, 0, 1, 1,
2.318686, 0.06195075, 1.377735, 0, 0, 0, 1, 1,
2.337045, -0.8501621, 2.341202, 0, 0, 0, 1, 1,
2.357533, -0.03187474, 3.95211, 0, 0, 0, 1, 1,
2.380895, -0.3063617, 2.135831, 0, 0, 0, 1, 1,
2.384503, 0.973621, 1.991516, 0, 0, 0, 1, 1,
2.419086, 1.360772, 0.7749707, 0, 0, 0, 1, 1,
2.451947, 1.219875, 2.138219, 0, 0, 0, 1, 1,
2.580226, -0.9617623, 2.163898, 1, 1, 1, 1, 1,
2.618483, 1.074158, 0.7032658, 1, 1, 1, 1, 1,
2.651278, -1.007379, 2.126312, 1, 1, 1, 1, 1,
2.851079, -0.9601918, 1.240221, 1, 1, 1, 1, 1,
3.189037, -0.4442635, 2.405296, 1, 1, 1, 1, 1,
3.210711, -0.3756604, 1.398867, 1, 1, 1, 1, 1,
3.229292, -0.3974467, 1.214489, 1, 1, 1, 1, 1
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
var radius = 9.608765;
var distance = 33.75038;
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
mvMatrix.translate( 0.1580997, 0.05753374, -0.3204093 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.75038);
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
