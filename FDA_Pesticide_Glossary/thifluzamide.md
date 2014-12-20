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
-3.286501, 0.1089209, -2.451952, 1, 0, 0, 1,
-3.060452, 1.270957, -0.5105042, 1, 0.007843138, 0, 1,
-2.784576, 1.303476, -0.9684398, 1, 0.01176471, 0, 1,
-2.719119, 0.8815055, -1.919926, 1, 0.01960784, 0, 1,
-2.507922, 1.417586, -1.673824, 1, 0.02352941, 0, 1,
-2.487706, 0.7420548, -0.6613151, 1, 0.03137255, 0, 1,
-2.385398, -0.5543306, -1.14989, 1, 0.03529412, 0, 1,
-2.319122, -1.207222, -1.123952, 1, 0.04313726, 0, 1,
-2.297341, 0.7397295, -0.60391, 1, 0.04705882, 0, 1,
-2.296398, -0.493166, -0.72462, 1, 0.05490196, 0, 1,
-2.256133, -2.395327, -1.488047, 1, 0.05882353, 0, 1,
-2.248957, -1.720538, -2.742016, 1, 0.06666667, 0, 1,
-2.239481, -0.4456163, -3.004201, 1, 0.07058824, 0, 1,
-2.217301, -1.672641, -1.090177, 1, 0.07843138, 0, 1,
-2.149134, 1.764896, 0.8812025, 1, 0.08235294, 0, 1,
-2.123489, 0.03222903, -2.339233, 1, 0.09019608, 0, 1,
-2.102783, -0.05121945, -1.581572, 1, 0.09411765, 0, 1,
-2.010866, 0.8979287, 0.7762724, 1, 0.1019608, 0, 1,
-2.000256, 0.04387552, -0.2541265, 1, 0.1098039, 0, 1,
-1.989886, 1.80293, 1.039803, 1, 0.1137255, 0, 1,
-1.982378, 0.1698723, -1.500473, 1, 0.1215686, 0, 1,
-1.978176, 1.042013, 0.5683733, 1, 0.1254902, 0, 1,
-1.976174, 0.1545224, -1.4598, 1, 0.1333333, 0, 1,
-1.956779, 0.5798944, -1.377702, 1, 0.1372549, 0, 1,
-1.950223, 0.6371298, -1.659598, 1, 0.145098, 0, 1,
-1.940983, 0.4069632, -1.800409, 1, 0.1490196, 0, 1,
-1.926752, 1.260253, 0.100977, 1, 0.1568628, 0, 1,
-1.869099, 1.925489, -0.6657205, 1, 0.1607843, 0, 1,
-1.855693, 0.04897913, -1.529469, 1, 0.1686275, 0, 1,
-1.848705, 0.8811296, -0.9940205, 1, 0.172549, 0, 1,
-1.838941, 0.7105548, -0.3138774, 1, 0.1803922, 0, 1,
-1.819762, 0.9030018, 1.027989, 1, 0.1843137, 0, 1,
-1.817926, -1.627451, -1.240757, 1, 0.1921569, 0, 1,
-1.81761, -3.081158, -2.950541, 1, 0.1960784, 0, 1,
-1.817504, -0.04083114, -1.914505, 1, 0.2039216, 0, 1,
-1.794663, -1.915496, -2.505784, 1, 0.2117647, 0, 1,
-1.788284, 1.09588, -1.777987, 1, 0.2156863, 0, 1,
-1.783398, 2.28486, -0.7227584, 1, 0.2235294, 0, 1,
-1.764007, -2.888398, -3.522439, 1, 0.227451, 0, 1,
-1.757224, -0.537666, -2.057969, 1, 0.2352941, 0, 1,
-1.738501, -0.7237577, -2.450446, 1, 0.2392157, 0, 1,
-1.706939, -0.08210845, 0.01359975, 1, 0.2470588, 0, 1,
-1.695919, 1.562336, 0.2463562, 1, 0.2509804, 0, 1,
-1.671154, 0.1502267, 0.9313468, 1, 0.2588235, 0, 1,
-1.651321, 1.492249, -0.508023, 1, 0.2627451, 0, 1,
-1.638269, 1.224046, -0.6033697, 1, 0.2705882, 0, 1,
-1.637138, 0.6793403, -1.618913, 1, 0.2745098, 0, 1,
-1.631267, 0.2302168, -1.038301, 1, 0.282353, 0, 1,
-1.629553, -0.6709623, -2.787349, 1, 0.2862745, 0, 1,
-1.621362, 0.1649844, -2.47597, 1, 0.2941177, 0, 1,
-1.59205, -0.03691407, -1.143113, 1, 0.3019608, 0, 1,
-1.58737, 0.0109695, -1.058533, 1, 0.3058824, 0, 1,
-1.586283, -0.7886652, -0.5521661, 1, 0.3137255, 0, 1,
-1.578576, 1.476641, -1.445541, 1, 0.3176471, 0, 1,
-1.574687, 0.5805568, -0.8748249, 1, 0.3254902, 0, 1,
-1.565539, -1.7123, -2.025902, 1, 0.3294118, 0, 1,
-1.555919, 1.303377, 0.7351314, 1, 0.3372549, 0, 1,
-1.552643, -2.891375, -1.944768, 1, 0.3411765, 0, 1,
-1.540382, 0.7088677, -1.46278, 1, 0.3490196, 0, 1,
-1.53651, -0.3399594, -2.056341, 1, 0.3529412, 0, 1,
-1.526412, 1.131531, -0.0925933, 1, 0.3607843, 0, 1,
-1.519191, 0.02146971, -1.828478, 1, 0.3647059, 0, 1,
-1.513939, -0.5853909, -2.333752, 1, 0.372549, 0, 1,
-1.512475, -0.6661288, -3.459782, 1, 0.3764706, 0, 1,
-1.506578, 0.05308193, -2.039086, 1, 0.3843137, 0, 1,
-1.501586, 0.8573276, -0.06264067, 1, 0.3882353, 0, 1,
-1.499507, 0.6894343, -0.3475929, 1, 0.3960784, 0, 1,
-1.497811, 0.2933773, -0.8163366, 1, 0.4039216, 0, 1,
-1.492262, 0.7006943, -1.178193, 1, 0.4078431, 0, 1,
-1.492054, 0.02688574, -0.7963632, 1, 0.4156863, 0, 1,
-1.47832, 1.404922, -0.9921146, 1, 0.4196078, 0, 1,
-1.477482, 0.6097487, -2.364903, 1, 0.427451, 0, 1,
-1.464931, -0.4802865, -1.84502, 1, 0.4313726, 0, 1,
-1.458158, -1.230941, -3.377974, 1, 0.4392157, 0, 1,
-1.449261, 0.2062772, -1.75486, 1, 0.4431373, 0, 1,
-1.442496, -0.9819722, -2.658476, 1, 0.4509804, 0, 1,
-1.43897, 0.4280259, -0.0939656, 1, 0.454902, 0, 1,
-1.424126, -1.069367, -1.735673, 1, 0.4627451, 0, 1,
-1.397883, 1.161225, 0.1398425, 1, 0.4666667, 0, 1,
-1.382676, 0.2518177, -3.335977, 1, 0.4745098, 0, 1,
-1.378731, -0.0232719, -2.941401, 1, 0.4784314, 0, 1,
-1.375515, 1.571256, 0.3684103, 1, 0.4862745, 0, 1,
-1.372513, 0.7831993, 0.5578548, 1, 0.4901961, 0, 1,
-1.372325, 1.6368, 0.4590269, 1, 0.4980392, 0, 1,
-1.363976, 0.7656541, -0.9352866, 1, 0.5058824, 0, 1,
-1.362914, 0.6754664, -0.7082916, 1, 0.509804, 0, 1,
-1.359982, 0.2779829, 0.742137, 1, 0.5176471, 0, 1,
-1.354255, -0.6286649, -3.049806, 1, 0.5215687, 0, 1,
-1.339962, -0.945751, -1.888636, 1, 0.5294118, 0, 1,
-1.336336, -0.3329368, -0.547327, 1, 0.5333334, 0, 1,
-1.324797, 0.7847833, -0.6025249, 1, 0.5411765, 0, 1,
-1.311429, -0.6761956, -1.67176, 1, 0.5450981, 0, 1,
-1.306421, -1.512982, -3.202793, 1, 0.5529412, 0, 1,
-1.300546, -0.1654224, -2.599395, 1, 0.5568628, 0, 1,
-1.292788, -0.7204726, -3.041276, 1, 0.5647059, 0, 1,
-1.27266, 0.4003996, -2.243518, 1, 0.5686275, 0, 1,
-1.271827, -0.8088275, -2.187455, 1, 0.5764706, 0, 1,
-1.26901, -0.5529163, -3.736965, 1, 0.5803922, 0, 1,
-1.268343, 2.605457, -0.9249642, 1, 0.5882353, 0, 1,
-1.266057, -1.209154, -1.459437, 1, 0.5921569, 0, 1,
-1.265561, 0.5309954, 0.7137409, 1, 0.6, 0, 1,
-1.259781, -1.114298, -2.374342, 1, 0.6078432, 0, 1,
-1.249262, 1.550475, 1.2653, 1, 0.6117647, 0, 1,
-1.241997, -0.8143989, -1.788414, 1, 0.6196079, 0, 1,
-1.235562, -1.616883, -1.707333, 1, 0.6235294, 0, 1,
-1.227268, 0.328005, -2.373492, 1, 0.6313726, 0, 1,
-1.223649, 0.2863315, -1.455086, 1, 0.6352941, 0, 1,
-1.217413, 0.5799646, -0.4802922, 1, 0.6431373, 0, 1,
-1.216182, -1.378111, -2.913035, 1, 0.6470588, 0, 1,
-1.213923, 0.3472788, -1.187404, 1, 0.654902, 0, 1,
-1.20863, 1.009303, -0.7930436, 1, 0.6588235, 0, 1,
-1.206427, -0.2253798, -0.8345661, 1, 0.6666667, 0, 1,
-1.206074, -0.8865233, -1.046878, 1, 0.6705883, 0, 1,
-1.196708, -0.003795505, -2.135239, 1, 0.6784314, 0, 1,
-1.191335, -0.2295016, -2.488762, 1, 0.682353, 0, 1,
-1.186933, 1.364143, -1.252429, 1, 0.6901961, 0, 1,
-1.175544, -1.530701, -2.756336, 1, 0.6941177, 0, 1,
-1.167539, -0.7180527, -1.13246, 1, 0.7019608, 0, 1,
-1.158278, -0.435625, -1.148584, 1, 0.7098039, 0, 1,
-1.158159, -1.208274, -1.395078, 1, 0.7137255, 0, 1,
-1.142101, -1.253662, -4.306482, 1, 0.7215686, 0, 1,
-1.141513, -1.341354, -4.012387, 1, 0.7254902, 0, 1,
-1.139866, -0.5594592, -3.032002, 1, 0.7333333, 0, 1,
-1.138977, -1.620815, -3.142641, 1, 0.7372549, 0, 1,
-1.13044, 1.416103, -1.269837, 1, 0.7450981, 0, 1,
-1.121969, -0.6515456, 0.1524225, 1, 0.7490196, 0, 1,
-1.119361, 2.576864, -0.2707441, 1, 0.7568628, 0, 1,
-1.112626, -0.4421574, -0.9840887, 1, 0.7607843, 0, 1,
-1.110167, -1.565731, -2.005427, 1, 0.7686275, 0, 1,
-1.098709, -0.1110371, -2.252838, 1, 0.772549, 0, 1,
-1.094383, -2.288601, -0.4541468, 1, 0.7803922, 0, 1,
-1.093425, 0.4384589, -2.01827, 1, 0.7843137, 0, 1,
-1.093258, 0.7021527, 1.467811, 1, 0.7921569, 0, 1,
-1.085622, -0.9155186, -1.326873, 1, 0.7960784, 0, 1,
-1.084359, -0.9213592, -2.891694, 1, 0.8039216, 0, 1,
-1.080273, -0.5210662, -2.741544, 1, 0.8117647, 0, 1,
-1.08009, -1.255061, -3.78191, 1, 0.8156863, 0, 1,
-1.073404, -1.017103, -1.876766, 1, 0.8235294, 0, 1,
-1.070924, -0.3800805, -1.514495, 1, 0.827451, 0, 1,
-1.060943, 0.1887071, -0.1727961, 1, 0.8352941, 0, 1,
-1.056627, -0.991743, -2.20199, 1, 0.8392157, 0, 1,
-1.054693, -0.6829413, -2.878277, 1, 0.8470588, 0, 1,
-1.047686, 0.9716076, -1.530247, 1, 0.8509804, 0, 1,
-1.042727, -0.9828829, -2.593922, 1, 0.8588235, 0, 1,
-1.042297, 0.7813222, 0.5337668, 1, 0.8627451, 0, 1,
-1.038718, 0.8614923, -1.115031, 1, 0.8705882, 0, 1,
-1.035268, -0.8562828, -2.6942, 1, 0.8745098, 0, 1,
-1.030439, 0.02517121, -1.817461, 1, 0.8823529, 0, 1,
-1.029788, 0.5412746, -4.139031e-05, 1, 0.8862745, 0, 1,
-1.021175, 1.663289, 0.3313049, 1, 0.8941177, 0, 1,
-1.019381, -0.1960289, -1.48958, 1, 0.8980392, 0, 1,
-1.007852, 0.03058268, -3.311356, 1, 0.9058824, 0, 1,
-0.9861031, 1.166809, -0.1217173, 1, 0.9137255, 0, 1,
-0.9811147, 1.642974, -0.8909215, 1, 0.9176471, 0, 1,
-0.978029, 1.555732, -2.119896, 1, 0.9254902, 0, 1,
-0.9716799, -1.425457, -2.662433, 1, 0.9294118, 0, 1,
-0.9715961, 0.3173579, 0.7557824, 1, 0.9372549, 0, 1,
-0.9551615, -0.3559312, -1.03416, 1, 0.9411765, 0, 1,
-0.9543018, -1.969694, -2.826469, 1, 0.9490196, 0, 1,
-0.9529124, -0.8555216, -3.296083, 1, 0.9529412, 0, 1,
-0.9484481, 0.2221018, -2.353419, 1, 0.9607843, 0, 1,
-0.9456894, -2.283017, -1.455905, 1, 0.9647059, 0, 1,
-0.9454138, -0.8655625, -0.3347394, 1, 0.972549, 0, 1,
-0.9400604, 0.4784881, -0.4537349, 1, 0.9764706, 0, 1,
-0.9382389, -1.348668, -0.506835, 1, 0.9843137, 0, 1,
-0.93733, 0.2568172, -0.9780787, 1, 0.9882353, 0, 1,
-0.9356399, 1.211758, -0.1121703, 1, 0.9960784, 0, 1,
-0.9280966, -1.530185, -2.501837, 0.9960784, 1, 0, 1,
-0.923459, 0.262697, -1.954193, 0.9921569, 1, 0, 1,
-0.9231399, 1.220627, -2.096958, 0.9843137, 1, 0, 1,
-0.9194442, -2.245288, -2.954947, 0.9803922, 1, 0, 1,
-0.9163877, -1.630356, -4.702483, 0.972549, 1, 0, 1,
-0.9156646, -0.3788312, -2.159082, 0.9686275, 1, 0, 1,
-0.9149303, -0.4895282, -0.6145805, 0.9607843, 1, 0, 1,
-0.9112778, -1.375244, -0.2890579, 0.9568627, 1, 0, 1,
-0.9077331, 0.4692589, -1.173691, 0.9490196, 1, 0, 1,
-0.9021667, 0.6733093, -2.205598, 0.945098, 1, 0, 1,
-0.8960251, -0.13459, -1.553949, 0.9372549, 1, 0, 1,
-0.8922475, -0.02094583, -1.228855, 0.9333333, 1, 0, 1,
-0.8886824, 0.4743082, -1.422793, 0.9254902, 1, 0, 1,
-0.8882315, 0.1559181, -2.880577, 0.9215686, 1, 0, 1,
-0.8794349, -0.8683416, -3.820487, 0.9137255, 1, 0, 1,
-0.8696325, -0.6223135, -2.859747, 0.9098039, 1, 0, 1,
-0.8660365, -0.5669013, -3.576082, 0.9019608, 1, 0, 1,
-0.8594093, -0.4813333, -0.7256677, 0.8941177, 1, 0, 1,
-0.8569297, 0.7996477, -0.6071528, 0.8901961, 1, 0, 1,
-0.855864, -0.7132336, -2.417669, 0.8823529, 1, 0, 1,
-0.8551433, 0.2168474, -1.018561, 0.8784314, 1, 0, 1,
-0.8548065, -1.520305, -4.742387, 0.8705882, 1, 0, 1,
-0.8500738, -1.054823, -0.1424929, 0.8666667, 1, 0, 1,
-0.847942, -0.04404303, -2.329446, 0.8588235, 1, 0, 1,
-0.8457142, 0.2550668, -0.02614097, 0.854902, 1, 0, 1,
-0.8408048, 1.428417, 0.2991055, 0.8470588, 1, 0, 1,
-0.8368923, -1.636569, -2.300004, 0.8431373, 1, 0, 1,
-0.8335333, 1.132259, -0.803484, 0.8352941, 1, 0, 1,
-0.8333645, -0.8584083, -2.32194, 0.8313726, 1, 0, 1,
-0.8319892, 0.7818766, -1.284868, 0.8235294, 1, 0, 1,
-0.8278226, -2.263003, -2.7074, 0.8196079, 1, 0, 1,
-0.8220599, -2.079837, -2.781699, 0.8117647, 1, 0, 1,
-0.8177747, 0.4999408, -1.767402, 0.8078431, 1, 0, 1,
-0.8174292, -0.7900953, -1.639342, 0.8, 1, 0, 1,
-0.8149476, 0.6652829, -0.2400146, 0.7921569, 1, 0, 1,
-0.8138182, 0.03430747, -2.962944, 0.7882353, 1, 0, 1,
-0.8105536, -0.7211348, -2.373416, 0.7803922, 1, 0, 1,
-0.810411, -2.176328, -2.715694, 0.7764706, 1, 0, 1,
-0.8056805, -1.176393, -3.715207, 0.7686275, 1, 0, 1,
-0.8049759, 1.307685, 0.3630532, 0.7647059, 1, 0, 1,
-0.8016173, -1.745309, -1.853378, 0.7568628, 1, 0, 1,
-0.7977492, -1.110758, -3.136044, 0.7529412, 1, 0, 1,
-0.7963293, 0.8554332, -1.616534, 0.7450981, 1, 0, 1,
-0.7940271, 0.63056, -1.150937, 0.7411765, 1, 0, 1,
-0.7926075, 0.4525326, -1.417015, 0.7333333, 1, 0, 1,
-0.7906644, -1.524233, -3.555083, 0.7294118, 1, 0, 1,
-0.7868307, -0.7775508, -2.586889, 0.7215686, 1, 0, 1,
-0.7817499, 0.1827734, -2.279629, 0.7176471, 1, 0, 1,
-0.781432, 2.744214, 0.105529, 0.7098039, 1, 0, 1,
-0.7729719, -1.227188, -0.9864317, 0.7058824, 1, 0, 1,
-0.7721135, -0.4074291, -1.269374, 0.6980392, 1, 0, 1,
-0.7676294, 0.005017763, -2.110425, 0.6901961, 1, 0, 1,
-0.7614905, 0.853996, 0.1586936, 0.6862745, 1, 0, 1,
-0.7583786, -0.8875664, -0.9218128, 0.6784314, 1, 0, 1,
-0.7574185, -0.6068161, -2.024066, 0.6745098, 1, 0, 1,
-0.7527012, -0.9644027, -2.806112, 0.6666667, 1, 0, 1,
-0.7491723, 1.025326, 0.6031058, 0.6627451, 1, 0, 1,
-0.7491103, -0.3280578, -1.493678, 0.654902, 1, 0, 1,
-0.7467587, -0.2914067, -1.358119, 0.6509804, 1, 0, 1,
-0.7401044, -0.7017075, -2.628869, 0.6431373, 1, 0, 1,
-0.7395753, 1.504865, 0.147788, 0.6392157, 1, 0, 1,
-0.7386162, -0.2403144, -0.6818609, 0.6313726, 1, 0, 1,
-0.7380342, -0.1347271, -1.633187, 0.627451, 1, 0, 1,
-0.7334107, 0.6282808, -0.8730813, 0.6196079, 1, 0, 1,
-0.7273871, 0.3439658, -0.3911152, 0.6156863, 1, 0, 1,
-0.7272792, 0.7033347, -0.921032, 0.6078432, 1, 0, 1,
-0.7235886, 0.3167091, -1.803872, 0.6039216, 1, 0, 1,
-0.7202108, -0.8801143, -3.428806, 0.5960785, 1, 0, 1,
-0.7190278, -0.1822086, -0.2954029, 0.5882353, 1, 0, 1,
-0.7189863, 0.7461934, -0.1519675, 0.5843138, 1, 0, 1,
-0.7173329, 0.3812032, -0.7485873, 0.5764706, 1, 0, 1,
-0.7172109, 0.5029816, -0.4234866, 0.572549, 1, 0, 1,
-0.7161952, -1.14043, -2.641795, 0.5647059, 1, 0, 1,
-0.7137767, -0.7997693, -2.418984, 0.5607843, 1, 0, 1,
-0.7132766, 0.5850819, -2.132388, 0.5529412, 1, 0, 1,
-0.7108696, -0.8688856, -3.295785, 0.5490196, 1, 0, 1,
-0.7103376, 0.1373414, -2.256701, 0.5411765, 1, 0, 1,
-0.7082252, 1.337466, 0.4964777, 0.5372549, 1, 0, 1,
-0.7060499, -2.203655, -2.216721, 0.5294118, 1, 0, 1,
-0.7010105, 1.885716, -0.659799, 0.5254902, 1, 0, 1,
-0.6987981, 0.2033252, -0.956498, 0.5176471, 1, 0, 1,
-0.6986557, 0.5288581, -1.857124, 0.5137255, 1, 0, 1,
-0.6976086, 0.2558167, -2.178974, 0.5058824, 1, 0, 1,
-0.6975296, -0.2583885, -1.222074, 0.5019608, 1, 0, 1,
-0.6959248, -1.172656, -5.109201, 0.4941176, 1, 0, 1,
-0.6904981, 0.208349, -0.5378883, 0.4862745, 1, 0, 1,
-0.6901329, 1.246285, 0.7283288, 0.4823529, 1, 0, 1,
-0.6785422, -0.8686436, -1.606114, 0.4745098, 1, 0, 1,
-0.6780505, -0.5015201, -2.624774, 0.4705882, 1, 0, 1,
-0.6752903, 1.011896, -0.6641216, 0.4627451, 1, 0, 1,
-0.6736137, -0.8570038, -2.91355, 0.4588235, 1, 0, 1,
-0.6717887, -0.8607477, -4.121892, 0.4509804, 1, 0, 1,
-0.6699542, -2.36035, -3.420638, 0.4470588, 1, 0, 1,
-0.6676579, -0.9788077, -0.9668111, 0.4392157, 1, 0, 1,
-0.6608948, 0.8605726, 0.05509191, 0.4352941, 1, 0, 1,
-0.6536452, 0.07687344, -3.668982, 0.427451, 1, 0, 1,
-0.6509324, 1.195513, -2.090622, 0.4235294, 1, 0, 1,
-0.6467881, 0.7050974, 1.785733, 0.4156863, 1, 0, 1,
-0.6441086, 0.5303978, 0.6500402, 0.4117647, 1, 0, 1,
-0.6426134, -1.204636, -1.73189, 0.4039216, 1, 0, 1,
-0.6393117, -1.221416, -2.66252, 0.3960784, 1, 0, 1,
-0.6315106, -0.6033373, -2.674589, 0.3921569, 1, 0, 1,
-0.6289712, 0.08698022, -1.612863, 0.3843137, 1, 0, 1,
-0.623692, 1.168661, -0.6377183, 0.3803922, 1, 0, 1,
-0.6186785, 0.3310615, -0.7926295, 0.372549, 1, 0, 1,
-0.6186557, 1.361696, -1.001444, 0.3686275, 1, 0, 1,
-0.6184561, 1.429977, -0.1143428, 0.3607843, 1, 0, 1,
-0.6179834, 0.3761284, -0.01233278, 0.3568628, 1, 0, 1,
-0.6171771, -0.8344935, -3.730063, 0.3490196, 1, 0, 1,
-0.6165766, 0.1225072, -0.6652717, 0.345098, 1, 0, 1,
-0.6136314, -0.2514755, -3.132122, 0.3372549, 1, 0, 1,
-0.6126455, 0.4213575, -1.478293, 0.3333333, 1, 0, 1,
-0.6081293, -1.045569, -2.81741, 0.3254902, 1, 0, 1,
-0.608104, 1.45312, -0.4276437, 0.3215686, 1, 0, 1,
-0.6069072, 0.2196496, -1.152757, 0.3137255, 1, 0, 1,
-0.6017733, 1.377549, -2.007722, 0.3098039, 1, 0, 1,
-0.5998614, -1.631286, -2.375125, 0.3019608, 1, 0, 1,
-0.5906612, -1.069897, -4.241054, 0.2941177, 1, 0, 1,
-0.5898746, 0.3179411, -2.42078, 0.2901961, 1, 0, 1,
-0.5879102, -1.486093, -2.480019, 0.282353, 1, 0, 1,
-0.5869271, 0.654384, 0.1185727, 0.2784314, 1, 0, 1,
-0.5812876, -0.597426, -2.543637, 0.2705882, 1, 0, 1,
-0.5808955, -0.7742237, -2.426456, 0.2666667, 1, 0, 1,
-0.5802758, -0.7723237, -1.589908, 0.2588235, 1, 0, 1,
-0.5798059, 1.149038, -0.7289535, 0.254902, 1, 0, 1,
-0.5790927, 0.3236639, 0.5271314, 0.2470588, 1, 0, 1,
-0.5776067, -0.7723628, -1.964257, 0.2431373, 1, 0, 1,
-0.5769188, -0.09214326, -1.778633, 0.2352941, 1, 0, 1,
-0.5757245, 2.160575, -1.043291, 0.2313726, 1, 0, 1,
-0.5749414, 0.1961639, -1.600243, 0.2235294, 1, 0, 1,
-0.5733657, 0.4502873, -0.3298763, 0.2196078, 1, 0, 1,
-0.5724661, 1.93311, -0.2329178, 0.2117647, 1, 0, 1,
-0.5712278, 2.46952, -0.3541987, 0.2078431, 1, 0, 1,
-0.5705389, -0.8332633, -2.601812, 0.2, 1, 0, 1,
-0.5693413, 0.9530162, -1.163328, 0.1921569, 1, 0, 1,
-0.5685103, -0.6178041, -4.181458, 0.1882353, 1, 0, 1,
-0.567592, -0.6064628, -1.721104, 0.1803922, 1, 0, 1,
-0.5665551, -1.743801, -2.509877, 0.1764706, 1, 0, 1,
-0.56129, 1.801103, 1.056046, 0.1686275, 1, 0, 1,
-0.5604951, 0.07056411, -2.226728, 0.1647059, 1, 0, 1,
-0.5594922, 1.66318, -1.199808, 0.1568628, 1, 0, 1,
-0.5592704, 0.8389747, -0.3711599, 0.1529412, 1, 0, 1,
-0.5561574, 0.977796, -0.2791763, 0.145098, 1, 0, 1,
-0.5443324, 0.9361163, -1.643084, 0.1411765, 1, 0, 1,
-0.5406204, 1.409779, -1.82865, 0.1333333, 1, 0, 1,
-0.538577, -0.7830386, -3.084667, 0.1294118, 1, 0, 1,
-0.5344632, 0.7713526, -0.583717, 0.1215686, 1, 0, 1,
-0.5328284, -1.030868, -1.689614, 0.1176471, 1, 0, 1,
-0.5281542, -0.4162584, -0.02254593, 0.1098039, 1, 0, 1,
-0.5191765, -0.00660736, -1.456901, 0.1058824, 1, 0, 1,
-0.5183777, -1.040587, -3.244526, 0.09803922, 1, 0, 1,
-0.5137668, 0.2579407, -1.188474, 0.09019608, 1, 0, 1,
-0.5136423, 0.16203, -2.019422, 0.08627451, 1, 0, 1,
-0.5088218, 0.1195134, -0.3518572, 0.07843138, 1, 0, 1,
-0.505012, -2.235239, -2.839875, 0.07450981, 1, 0, 1,
-0.5038943, 0.3440081, -2.018119, 0.06666667, 1, 0, 1,
-0.5003158, 0.09865572, -0.2729389, 0.0627451, 1, 0, 1,
-0.4995863, 0.00802472, -1.698006, 0.05490196, 1, 0, 1,
-0.4946179, 1.442279, 0.2002465, 0.05098039, 1, 0, 1,
-0.4897976, -0.8719221, -0.7559378, 0.04313726, 1, 0, 1,
-0.4856815, -1.282838, -2.285943, 0.03921569, 1, 0, 1,
-0.4819131, 0.3232001, -0.1505277, 0.03137255, 1, 0, 1,
-0.4703533, -0.1727251, -2.801102, 0.02745098, 1, 0, 1,
-0.467602, -0.01738196, -3.151751, 0.01960784, 1, 0, 1,
-0.4655038, -1.626243, -3.50933, 0.01568628, 1, 0, 1,
-0.4568052, -0.4918292, -1.930792, 0.007843138, 1, 0, 1,
-0.4532087, 1.505576, -1.17358, 0.003921569, 1, 0, 1,
-0.451251, 0.1917062, -1.80187, 0, 1, 0.003921569, 1,
-0.4448613, 1.286767, -0.307957, 0, 1, 0.01176471, 1,
-0.4421886, -2.190193, -3.903524, 0, 1, 0.01568628, 1,
-0.4406194, 1.083012, -0.8086993, 0, 1, 0.02352941, 1,
-0.439153, -0.1596184, -1.897466, 0, 1, 0.02745098, 1,
-0.4311071, 1.566, -0.6724804, 0, 1, 0.03529412, 1,
-0.4289164, 0.4150917, 0.3605551, 0, 1, 0.03921569, 1,
-0.425874, -1.208674, -3.345104, 0, 1, 0.04705882, 1,
-0.4245256, 0.3799635, -1.670265, 0, 1, 0.05098039, 1,
-0.4226215, 1.287155, 0.4769717, 0, 1, 0.05882353, 1,
-0.4212018, 1.286953, -2.189117, 0, 1, 0.0627451, 1,
-0.4151649, -0.02654894, -3.297569, 0, 1, 0.07058824, 1,
-0.4060062, 2.487976, 0.5820753, 0, 1, 0.07450981, 1,
-0.4045947, -0.1159239, -1.985793, 0, 1, 0.08235294, 1,
-0.4018469, -0.3763814, -0.03532451, 0, 1, 0.08627451, 1,
-0.4015985, 0.2360286, -2.345266, 0, 1, 0.09411765, 1,
-0.3994817, 1.177746, 0.1394059, 0, 1, 0.1019608, 1,
-0.3989196, -1.015114, -3.792817, 0, 1, 0.1058824, 1,
-0.3980694, -0.2180995, -1.386661, 0, 1, 0.1137255, 1,
-0.3937812, 0.08857369, -1.282875, 0, 1, 0.1176471, 1,
-0.390294, 0.1399748, -0.2904208, 0, 1, 0.1254902, 1,
-0.3902257, -2.941013, -3.857913, 0, 1, 0.1294118, 1,
-0.3881457, 0.1397415, -1.055392, 0, 1, 0.1372549, 1,
-0.3864465, -0.3341495, -3.531022, 0, 1, 0.1411765, 1,
-0.3837183, -1.53932, -3.283348, 0, 1, 0.1490196, 1,
-0.3813387, 0.4300005, -0.1891118, 0, 1, 0.1529412, 1,
-0.3795792, -0.9155484, -4.014153, 0, 1, 0.1607843, 1,
-0.3790576, 0.7166589, 0.4657819, 0, 1, 0.1647059, 1,
-0.3785165, 0.4957753, -2.605717, 0, 1, 0.172549, 1,
-0.3771786, -1.216925, -3.638343, 0, 1, 0.1764706, 1,
-0.3770599, 0.6683838, 0.6994817, 0, 1, 0.1843137, 1,
-0.376877, -0.8057808, -4.03583, 0, 1, 0.1882353, 1,
-0.3752648, -1.399576, -2.694024, 0, 1, 0.1960784, 1,
-0.3727771, -0.02025817, -0.9612036, 0, 1, 0.2039216, 1,
-0.3703342, 0.5113795, -0.5553222, 0, 1, 0.2078431, 1,
-0.3657418, -0.1033379, -2.665551, 0, 1, 0.2156863, 1,
-0.3620439, 0.6387978, -2.626498, 0, 1, 0.2196078, 1,
-0.3578481, 0.4998646, -0.2260169, 0, 1, 0.227451, 1,
-0.3463784, -1.32456, -3.102812, 0, 1, 0.2313726, 1,
-0.344497, 0.3717272, -0.2002033, 0, 1, 0.2392157, 1,
-0.340561, -0.460278, -2.180837, 0, 1, 0.2431373, 1,
-0.339784, -0.3895258, -2.340654, 0, 1, 0.2509804, 1,
-0.3391094, 1.385916, -0.9366016, 0, 1, 0.254902, 1,
-0.339043, -1.09807, -1.492772, 0, 1, 0.2627451, 1,
-0.3378082, 3.309248, 0.1102695, 0, 1, 0.2666667, 1,
-0.3355208, -0.2494989, -3.549916, 0, 1, 0.2745098, 1,
-0.3339346, 1.152444, -0.5411137, 0, 1, 0.2784314, 1,
-0.3330781, 0.4683299, -0.4806155, 0, 1, 0.2862745, 1,
-0.3303704, -1.199362, -2.996119, 0, 1, 0.2901961, 1,
-0.3270622, -0.05569186, -0.8059246, 0, 1, 0.2980392, 1,
-0.3228028, -0.1302778, -0.7068138, 0, 1, 0.3058824, 1,
-0.3211064, -0.2507579, -3.048419, 0, 1, 0.3098039, 1,
-0.3210466, -0.0008512366, -2.627292, 0, 1, 0.3176471, 1,
-0.3204791, 0.7727489, -0.6808594, 0, 1, 0.3215686, 1,
-0.3203829, -1.958778, -2.013406, 0, 1, 0.3294118, 1,
-0.318523, 0.7803239, 0.02902456, 0, 1, 0.3333333, 1,
-0.3153241, -2.001962, -2.290773, 0, 1, 0.3411765, 1,
-0.3140787, 1.262802, 0.01475256, 0, 1, 0.345098, 1,
-0.3113998, -0.1158806, -1.347011, 0, 1, 0.3529412, 1,
-0.3084258, 0.3970106, -1.16651, 0, 1, 0.3568628, 1,
-0.3063556, 0.07922497, -1.423958, 0, 1, 0.3647059, 1,
-0.3038807, 0.1990452, -0.8258217, 0, 1, 0.3686275, 1,
-0.3019159, -0.9397935, -2.507878, 0, 1, 0.3764706, 1,
-0.3005546, -2.008404, -2.171007, 0, 1, 0.3803922, 1,
-0.2918744, 0.8748211, -0.9523928, 0, 1, 0.3882353, 1,
-0.2892591, -0.1139961, -2.543113, 0, 1, 0.3921569, 1,
-0.288537, 0.2872666, -1.379382, 0, 1, 0.4, 1,
-0.2870638, 0.5215665, 0.5084634, 0, 1, 0.4078431, 1,
-0.286223, 1.065439, 0.9073994, 0, 1, 0.4117647, 1,
-0.2862096, -0.8803629, -3.150157, 0, 1, 0.4196078, 1,
-0.2839072, 1.787091, -2.928803, 0, 1, 0.4235294, 1,
-0.2748152, 1.06504, 0.6114636, 0, 1, 0.4313726, 1,
-0.273349, 1.530027, 0.2032563, 0, 1, 0.4352941, 1,
-0.2715927, 0.4950931, 0.01645366, 0, 1, 0.4431373, 1,
-0.2713176, -1.561278, -3.412281, 0, 1, 0.4470588, 1,
-0.2651011, 0.7240289, 1.062172, 0, 1, 0.454902, 1,
-0.2607246, -1.160959, -2.110773, 0, 1, 0.4588235, 1,
-0.260403, 0.8290647, -0.3304147, 0, 1, 0.4666667, 1,
-0.2583585, -0.4903303, -2.578565, 0, 1, 0.4705882, 1,
-0.2518901, 2.022012, -1.416077, 0, 1, 0.4784314, 1,
-0.2481916, -2.215059, -1.919564, 0, 1, 0.4823529, 1,
-0.2431862, -0.2422905, -2.050294, 0, 1, 0.4901961, 1,
-0.2422865, 2.132778, -0.5913727, 0, 1, 0.4941176, 1,
-0.2418803, 2.34417, -0.7032338, 0, 1, 0.5019608, 1,
-0.2409363, 0.8178413, 0.9500853, 0, 1, 0.509804, 1,
-0.2400255, 0.5954508, -0.358438, 0, 1, 0.5137255, 1,
-0.2364782, 0.2294213, 0.4607537, 0, 1, 0.5215687, 1,
-0.2341451, -0.7351901, -4.808593, 0, 1, 0.5254902, 1,
-0.2328298, -1.074213, -3.015062, 0, 1, 0.5333334, 1,
-0.231215, -0.07607953, -2.024526, 0, 1, 0.5372549, 1,
-0.2282281, -0.8682825, -0.3004406, 0, 1, 0.5450981, 1,
-0.2272517, 1.758616, -0.450516, 0, 1, 0.5490196, 1,
-0.2266717, 0.3526582, -1.670144, 0, 1, 0.5568628, 1,
-0.2263321, 1.925413, -0.4530913, 0, 1, 0.5607843, 1,
-0.2228679, -0.8891652, -2.744083, 0, 1, 0.5686275, 1,
-0.2217931, 0.999678, 2.230524, 0, 1, 0.572549, 1,
-0.2216712, -0.1629444, -2.45096, 0, 1, 0.5803922, 1,
-0.2196393, 0.9850859, -0.5966223, 0, 1, 0.5843138, 1,
-0.2140727, 0.2204914, -0.1526884, 0, 1, 0.5921569, 1,
-0.210693, -2.554947, -3.95651, 0, 1, 0.5960785, 1,
-0.2104403, -0.5193111, -1.505445, 0, 1, 0.6039216, 1,
-0.2075406, -0.1043774, -2.492935, 0, 1, 0.6117647, 1,
-0.2066521, 0.6185401, -0.6174798, 0, 1, 0.6156863, 1,
-0.2057103, 0.3169922, -1.706761, 0, 1, 0.6235294, 1,
-0.2051769, 0.9564682, -1.851665, 0, 1, 0.627451, 1,
-0.2042291, -1.403009, -4.202443, 0, 1, 0.6352941, 1,
-0.1999337, -0.3881902, -2.175395, 0, 1, 0.6392157, 1,
-0.1959537, -1.314319, -2.473407, 0, 1, 0.6470588, 1,
-0.1958424, -1.494427, -2.308408, 0, 1, 0.6509804, 1,
-0.1923831, -0.4988002, -2.45647, 0, 1, 0.6588235, 1,
-0.1908083, -0.4595261, -3.199284, 0, 1, 0.6627451, 1,
-0.1826575, 1.723398, 1.413794, 0, 1, 0.6705883, 1,
-0.1810988, -0.712783, -3.314715, 0, 1, 0.6745098, 1,
-0.179705, -0.7764677, -2.808425, 0, 1, 0.682353, 1,
-0.1768705, 0.1698319, -0.6641328, 0, 1, 0.6862745, 1,
-0.1760353, -0.7121188, -3.281901, 0, 1, 0.6941177, 1,
-0.1714295, -1.949179, -2.932533, 0, 1, 0.7019608, 1,
-0.1706991, 0.2919685, -0.5319964, 0, 1, 0.7058824, 1,
-0.1626479, -1.897259, -2.237187, 0, 1, 0.7137255, 1,
-0.1623389, -1.341741, -2.850779, 0, 1, 0.7176471, 1,
-0.1535882, 0.2451506, 1.604056, 0, 1, 0.7254902, 1,
-0.1528874, 0.431927, -0.2591562, 0, 1, 0.7294118, 1,
-0.1478376, 0.07413411, 0.9754512, 0, 1, 0.7372549, 1,
-0.1450998, 0.4371887, 1.273105, 0, 1, 0.7411765, 1,
-0.1403317, 1.007667, 0.598346, 0, 1, 0.7490196, 1,
-0.1350412, -1.136835, -3.80114, 0, 1, 0.7529412, 1,
-0.1320135, 1.123226, -2.080815, 0, 1, 0.7607843, 1,
-0.1315377, -1.066499, -2.595646, 0, 1, 0.7647059, 1,
-0.128177, 0.2040311, -1.214843, 0, 1, 0.772549, 1,
-0.1199459, -1.256899, -3.955078, 0, 1, 0.7764706, 1,
-0.1191887, -0.7439639, -1.342785, 0, 1, 0.7843137, 1,
-0.1145934, 0.3148795, 0.6930816, 0, 1, 0.7882353, 1,
-0.114192, 1.11146, -1.370586, 0, 1, 0.7960784, 1,
-0.1123414, 0.4836312, 0.8741218, 0, 1, 0.8039216, 1,
-0.1119741, -1.222, -2.551992, 0, 1, 0.8078431, 1,
-0.110146, 0.0001012981, -1.655123, 0, 1, 0.8156863, 1,
-0.1082141, 1.694813, -1.919592, 0, 1, 0.8196079, 1,
-0.09735687, -1.931562, -3.649444, 0, 1, 0.827451, 1,
-0.09499797, -0.08526896, -3.154984, 0, 1, 0.8313726, 1,
-0.09272072, 1.624936, -0.1221586, 0, 1, 0.8392157, 1,
-0.09042417, -1.415004, -2.092146, 0, 1, 0.8431373, 1,
-0.08849457, -1.592416, -4.348078, 0, 1, 0.8509804, 1,
-0.08298522, -1.444668, -2.32777, 0, 1, 0.854902, 1,
-0.0807562, 0.7508709, 1.916078, 0, 1, 0.8627451, 1,
-0.07943695, -2.077723, -4.343357, 0, 1, 0.8666667, 1,
-0.07746969, -1.643687, -3.738345, 0, 1, 0.8745098, 1,
-0.07655632, 1.291489, 1.057343, 0, 1, 0.8784314, 1,
-0.07540221, -0.8169168, -2.458236, 0, 1, 0.8862745, 1,
-0.07444061, -0.3822488, -5.112552, 0, 1, 0.8901961, 1,
-0.07291702, 1.547938, 0.9833432, 0, 1, 0.8980392, 1,
-0.07268213, 0.2237634, -0.7670117, 0, 1, 0.9058824, 1,
-0.07171806, 1.295269, -1.085711, 0, 1, 0.9098039, 1,
-0.07106605, 0.4090219, 0.5342231, 0, 1, 0.9176471, 1,
-0.06719711, -0.3801349, -3.745829, 0, 1, 0.9215686, 1,
-0.06701799, 0.7072606, 0.5562204, 0, 1, 0.9294118, 1,
-0.06695425, -0.1657752, -4.156327, 0, 1, 0.9333333, 1,
-0.06635629, 0.4258909, -0.5582357, 0, 1, 0.9411765, 1,
-0.06303618, -0.1471507, -3.066113, 0, 1, 0.945098, 1,
-0.06171101, 0.7689307, -0.5770331, 0, 1, 0.9529412, 1,
-0.06078508, -0.9345928, -3.723937, 0, 1, 0.9568627, 1,
-0.05855983, 1.081606, 0.1047301, 0, 1, 0.9647059, 1,
-0.05779528, 0.9983391, -0.5477211, 0, 1, 0.9686275, 1,
-0.05295394, 1.306854, 0.360633, 0, 1, 0.9764706, 1,
-0.05085983, -0.9073822, -3.012381, 0, 1, 0.9803922, 1,
-0.04780922, -0.6421741, -2.568004, 0, 1, 0.9882353, 1,
-0.04597687, -0.4351255, -4.319747, 0, 1, 0.9921569, 1,
-0.03531582, -0.1479922, -2.471447, 0, 1, 1, 1,
-0.03088837, 1.901252, 1.199048, 0, 0.9921569, 1, 1,
-0.02586945, -0.8033811, -4.571182, 0, 0.9882353, 1, 1,
-0.02532691, -0.791711, -3.648162, 0, 0.9803922, 1, 1,
-0.02274066, -0.7245522, -1.528888, 0, 0.9764706, 1, 1,
-0.0197184, -1.413325, -1.66528, 0, 0.9686275, 1, 1,
-0.01356311, -0.5372993, -3.706643, 0, 0.9647059, 1, 1,
-0.0135416, 0.3275239, -0.8238678, 0, 0.9568627, 1, 1,
-0.01259086, -0.0358124, -1.958836, 0, 0.9529412, 1, 1,
-0.01118141, -0.6864877, -2.58191, 0, 0.945098, 1, 1,
-0.005480542, -2.205645, -2.613671, 0, 0.9411765, 1, 1,
-0.005455935, 0.9839455, 0.288865, 0, 0.9333333, 1, 1,
-0.002201207, 0.9419419, 0.3838488, 0, 0.9294118, 1, 1,
-0.001428809, -1.31399, -2.940825, 0, 0.9215686, 1, 1,
0.001434458, 0.5205728, -0.7373015, 0, 0.9176471, 1, 1,
0.001659344, 1.344476, 1.015347, 0, 0.9098039, 1, 1,
0.01045174, 0.5390067, 1.007824, 0, 0.9058824, 1, 1,
0.01451089, 0.2580484, 0.9333852, 0, 0.8980392, 1, 1,
0.01996318, -0.3082306, 2.93003, 0, 0.8901961, 1, 1,
0.02303363, 1.190747, 1.185606, 0, 0.8862745, 1, 1,
0.02472504, -0.6487907, 4.091557, 0, 0.8784314, 1, 1,
0.02839798, 2.089042, -0.7168187, 0, 0.8745098, 1, 1,
0.02877696, 0.2961655, 0.7433394, 0, 0.8666667, 1, 1,
0.03116627, -0.08785691, 2.539839, 0, 0.8627451, 1, 1,
0.03136366, 1.543227, -1.175261, 0, 0.854902, 1, 1,
0.03159002, 0.07429764, 1.688468, 0, 0.8509804, 1, 1,
0.03231652, 1.627703, 0.2392166, 0, 0.8431373, 1, 1,
0.03590858, -0.7272467, 3.052096, 0, 0.8392157, 1, 1,
0.03726917, 0.1550532, -0.3363992, 0, 0.8313726, 1, 1,
0.03741229, -1.216549, 0.9882098, 0, 0.827451, 1, 1,
0.03971814, 1.884732, -0.9612026, 0, 0.8196079, 1, 1,
0.04625474, -0.0120281, 2.621876, 0, 0.8156863, 1, 1,
0.04711833, -2.041432, 2.494704, 0, 0.8078431, 1, 1,
0.05227016, -0.3659195, 4.050464, 0, 0.8039216, 1, 1,
0.05378453, 0.2418206, -1.744579, 0, 0.7960784, 1, 1,
0.05772986, 1.564122, 0.9546912, 0, 0.7882353, 1, 1,
0.05869015, -0.611458, 3.864052, 0, 0.7843137, 1, 1,
0.05925953, -1.509525, 4.067695, 0, 0.7764706, 1, 1,
0.06288446, 0.01677703, 1.62115, 0, 0.772549, 1, 1,
0.06461051, 0.1224534, -0.05046991, 0, 0.7647059, 1, 1,
0.06573752, 1.136748, -0.9192365, 0, 0.7607843, 1, 1,
0.06973295, -0.4356597, 2.442612, 0, 0.7529412, 1, 1,
0.07442345, 1.317169, 0.7555294, 0, 0.7490196, 1, 1,
0.07589767, -0.2334744, 4.262961, 0, 0.7411765, 1, 1,
0.08238668, 0.6209368, 1.637099, 0, 0.7372549, 1, 1,
0.082749, 0.3819327, 0.425752, 0, 0.7294118, 1, 1,
0.08688801, -0.260103, 1.401414, 0, 0.7254902, 1, 1,
0.09144349, -0.2894537, 2.768389, 0, 0.7176471, 1, 1,
0.09210198, -0.0008228435, 2.83925, 0, 0.7137255, 1, 1,
0.09412504, 0.1693542, 0.5691233, 0, 0.7058824, 1, 1,
0.09439933, 2.758343, -0.5581472, 0, 0.6980392, 1, 1,
0.09624086, -0.5280586, 3.455433, 0, 0.6941177, 1, 1,
0.0962521, -0.3142611, 4.39896, 0, 0.6862745, 1, 1,
0.09845715, 0.5275511, -0.3234674, 0, 0.682353, 1, 1,
0.1020853, 1.03199, 0.2609664, 0, 0.6745098, 1, 1,
0.1033027, -1.718078, 3.111048, 0, 0.6705883, 1, 1,
0.1044262, -2.817899, 2.959271, 0, 0.6627451, 1, 1,
0.1103692, 0.9512721, 0.7996217, 0, 0.6588235, 1, 1,
0.1127055, 0.252042, 0.5221147, 0, 0.6509804, 1, 1,
0.1177772, -0.3990425, 1.766933, 0, 0.6470588, 1, 1,
0.1191587, 1.731163, -0.9962589, 0, 0.6392157, 1, 1,
0.120617, 0.9318383, 0.1709872, 0, 0.6352941, 1, 1,
0.1230674, -2.201178, 3.508241, 0, 0.627451, 1, 1,
0.1232535, 1.746562, 0.03696645, 0, 0.6235294, 1, 1,
0.1238436, 1.186485, 0.2689831, 0, 0.6156863, 1, 1,
0.1250186, -0.9568565, 3.272394, 0, 0.6117647, 1, 1,
0.130122, -0.2430927, 2.729968, 0, 0.6039216, 1, 1,
0.1306422, 1.111796, 1.117457, 0, 0.5960785, 1, 1,
0.1320592, 1.856684, -1.247666, 0, 0.5921569, 1, 1,
0.1346823, 1.786224, 0.3030404, 0, 0.5843138, 1, 1,
0.1371142, 0.1155784, 1.022547, 0, 0.5803922, 1, 1,
0.1411478, -1.12838, 2.797135, 0, 0.572549, 1, 1,
0.1448455, 0.3131708, -0.254047, 0, 0.5686275, 1, 1,
0.1450605, -0.5504045, 3.956099, 0, 0.5607843, 1, 1,
0.1498672, -0.1779506, 1.032307, 0, 0.5568628, 1, 1,
0.1502529, -2.012626, 1.364839, 0, 0.5490196, 1, 1,
0.1516227, 0.3526648, -1.421746, 0, 0.5450981, 1, 1,
0.1529398, -2.724557, 2.652143, 0, 0.5372549, 1, 1,
0.1549667, 0.9913231, -0.6122038, 0, 0.5333334, 1, 1,
0.1556545, -0.382839, 2.9478, 0, 0.5254902, 1, 1,
0.1580628, -0.08664542, 3.05646, 0, 0.5215687, 1, 1,
0.1609775, 0.462913, 0.8617611, 0, 0.5137255, 1, 1,
0.161976, 0.6409035, 0.4126703, 0, 0.509804, 1, 1,
0.1650336, 0.1487082, -1.261991, 0, 0.5019608, 1, 1,
0.16656, -0.2238266, 4.54096, 0, 0.4941176, 1, 1,
0.1672634, 0.5925702, 0.1972864, 0, 0.4901961, 1, 1,
0.169821, 0.09971473, 0.6489273, 0, 0.4823529, 1, 1,
0.1698588, 0.2291401, 0.4713655, 0, 0.4784314, 1, 1,
0.1719155, -0.8757356, 0.5358866, 0, 0.4705882, 1, 1,
0.173253, 0.5053955, -1.356754, 0, 0.4666667, 1, 1,
0.1818862, -0.08249823, 2.593838, 0, 0.4588235, 1, 1,
0.182355, 1.322026, -0.6508657, 0, 0.454902, 1, 1,
0.1825169, 0.5830128, 0.9757061, 0, 0.4470588, 1, 1,
0.1833505, -1.219417, 4.084994, 0, 0.4431373, 1, 1,
0.1867077, 0.8527092, 2.181719, 0, 0.4352941, 1, 1,
0.1889031, -0.3484865, 2.388746, 0, 0.4313726, 1, 1,
0.188929, -0.6357697, 2.522321, 0, 0.4235294, 1, 1,
0.1899301, 0.02909724, 0.5099878, 0, 0.4196078, 1, 1,
0.1913713, -0.5707123, 0.8252788, 0, 0.4117647, 1, 1,
0.1922225, -0.39252, 2.70412, 0, 0.4078431, 1, 1,
0.1924647, 0.1808432, 0.4175126, 0, 0.4, 1, 1,
0.1926214, 1.397855, 0.8719102, 0, 0.3921569, 1, 1,
0.19338, -0.09435755, 1.738514, 0, 0.3882353, 1, 1,
0.1950548, -0.1572895, 2.543231, 0, 0.3803922, 1, 1,
0.1984885, 0.3153762, 0.3758482, 0, 0.3764706, 1, 1,
0.2030919, -0.7736797, 5.335769, 0, 0.3686275, 1, 1,
0.2131821, 0.7055424, 1.669345, 0, 0.3647059, 1, 1,
0.2206766, 0.1112809, 0.09506844, 0, 0.3568628, 1, 1,
0.2222471, -0.02929011, 2.174299, 0, 0.3529412, 1, 1,
0.2235823, 0.9922437, -0.2423417, 0, 0.345098, 1, 1,
0.2261893, 0.1729639, 1.451014, 0, 0.3411765, 1, 1,
0.2268197, -0.260819, 3.672539, 0, 0.3333333, 1, 1,
0.2301609, 0.1713431, 0.1610487, 0, 0.3294118, 1, 1,
0.2303466, 1.427894, 0.3701772, 0, 0.3215686, 1, 1,
0.2358889, 1.050835, -0.9120392, 0, 0.3176471, 1, 1,
0.236829, 1.461433, -1.082557, 0, 0.3098039, 1, 1,
0.2404436, -0.3238725, 3.023557, 0, 0.3058824, 1, 1,
0.240555, -0.1280385, 2.389199, 0, 0.2980392, 1, 1,
0.249794, 0.7764564, -0.2108123, 0, 0.2901961, 1, 1,
0.2546466, -1.284809, 2.151803, 0, 0.2862745, 1, 1,
0.2559136, 0.3710784, 2.172448, 0, 0.2784314, 1, 1,
0.2560035, 0.5764405, 1.077777, 0, 0.2745098, 1, 1,
0.2569416, -2.25757, 3.830975, 0, 0.2666667, 1, 1,
0.2606772, -1.265821, 2.513119, 0, 0.2627451, 1, 1,
0.2628401, -0.2188284, 1.21834, 0, 0.254902, 1, 1,
0.2629237, -0.2949517, 0.235309, 0, 0.2509804, 1, 1,
0.2655344, 0.303192, 1.157953, 0, 0.2431373, 1, 1,
0.2657177, 1.213979, 1.156717, 0, 0.2392157, 1, 1,
0.2673429, -0.7787544, 3.149981, 0, 0.2313726, 1, 1,
0.2695977, 0.2984281, 1.212957, 0, 0.227451, 1, 1,
0.2715812, -0.009449941, 0.9915302, 0, 0.2196078, 1, 1,
0.2833564, 1.177203, 1.583407, 0, 0.2156863, 1, 1,
0.2857937, -0.02049105, 2.057966, 0, 0.2078431, 1, 1,
0.2859357, 1.155881, -0.8839482, 0, 0.2039216, 1, 1,
0.2945554, 0.5746759, 1.171629, 0, 0.1960784, 1, 1,
0.3013449, -1.237409, 3.622021, 0, 0.1882353, 1, 1,
0.3033868, 0.7830821, 0.6416504, 0, 0.1843137, 1, 1,
0.3047138, -0.3664624, 2.565712, 0, 0.1764706, 1, 1,
0.3050117, 0.5053271, 0.221911, 0, 0.172549, 1, 1,
0.3078026, 0.5743679, 1.012054, 0, 0.1647059, 1, 1,
0.3083081, -0.3042513, 0.7207081, 0, 0.1607843, 1, 1,
0.3121498, 0.0480576, 1.264323, 0, 0.1529412, 1, 1,
0.3309687, -0.3918775, 1.725828, 0, 0.1490196, 1, 1,
0.333129, -0.364995, 2.068874, 0, 0.1411765, 1, 1,
0.3334632, 0.9182175, 0.120154, 0, 0.1372549, 1, 1,
0.3340634, -1.063902, 2.880055, 0, 0.1294118, 1, 1,
0.3354801, 1.639258, 1.885693, 0, 0.1254902, 1, 1,
0.33559, 0.448975, 1.785183, 0, 0.1176471, 1, 1,
0.3374003, 1.89667, -0.6983286, 0, 0.1137255, 1, 1,
0.3418988, -0.7699158, 3.257266, 0, 0.1058824, 1, 1,
0.3462484, -0.6833019, 2.437356, 0, 0.09803922, 1, 1,
0.3480297, 0.911207, 1.636462, 0, 0.09411765, 1, 1,
0.352643, 1.304853, 0.6647938, 0, 0.08627451, 1, 1,
0.3533557, -0.6576163, 2.823792, 0, 0.08235294, 1, 1,
0.355737, 1.278377, 0.1074787, 0, 0.07450981, 1, 1,
0.3592079, -0.1409702, 0.4722584, 0, 0.07058824, 1, 1,
0.3614075, 0.736648, 0.3156782, 0, 0.0627451, 1, 1,
0.369736, -1.985808, 4.109513, 0, 0.05882353, 1, 1,
0.3704432, 0.738123, 0.4903728, 0, 0.05098039, 1, 1,
0.3726423, 0.6507164, 2.359737, 0, 0.04705882, 1, 1,
0.375193, -0.02858933, -0.5864317, 0, 0.03921569, 1, 1,
0.3783502, 1.598867, 0.7594754, 0, 0.03529412, 1, 1,
0.3833218, 1.749305, -0.6392109, 0, 0.02745098, 1, 1,
0.3855815, -0.3175702, 2.897151, 0, 0.02352941, 1, 1,
0.3886596, 0.5144659, 0.7105207, 0, 0.01568628, 1, 1,
0.3887942, -0.05090699, 1.115807, 0, 0.01176471, 1, 1,
0.3906273, -1.021444, 2.32561, 0, 0.003921569, 1, 1,
0.3991012, -0.03048598, 1.132363, 0.003921569, 0, 1, 1,
0.4009469, -1.746738, 1.687953, 0.007843138, 0, 1, 1,
0.4011687, 3.065644, 0.4225329, 0.01568628, 0, 1, 1,
0.4046186, -1.165167, 3.141146, 0.01960784, 0, 1, 1,
0.4069946, 0.2723533, 0.2978748, 0.02745098, 0, 1, 1,
0.4125542, 1.353686, -0.300361, 0.03137255, 0, 1, 1,
0.4198724, 0.002506436, 0.1357376, 0.03921569, 0, 1, 1,
0.4206225, 0.08368202, 0.6076488, 0.04313726, 0, 1, 1,
0.4209644, -1.508422, 1.435114, 0.05098039, 0, 1, 1,
0.4253041, -0.5413816, 3.258153, 0.05490196, 0, 1, 1,
0.4271336, 0.8387381, 1.779989, 0.0627451, 0, 1, 1,
0.4293744, 0.4263942, 1.609719, 0.06666667, 0, 1, 1,
0.4308002, -1.839157, 4.053739, 0.07450981, 0, 1, 1,
0.4312525, 1.084985, -0.1929826, 0.07843138, 0, 1, 1,
0.4314583, 0.6985507, 1.434221, 0.08627451, 0, 1, 1,
0.4314698, -0.07669202, 2.772975, 0.09019608, 0, 1, 1,
0.4320852, -0.1033726, 1.535897, 0.09803922, 0, 1, 1,
0.437791, 0.5771311, 0.8835454, 0.1058824, 0, 1, 1,
0.4385614, 0.6324991, 0.1070331, 0.1098039, 0, 1, 1,
0.4395416, 0.2491261, 1.882074, 0.1176471, 0, 1, 1,
0.440911, 1.036939, -1.48192, 0.1215686, 0, 1, 1,
0.4419873, -0.8473458, 4.289981, 0.1294118, 0, 1, 1,
0.4444318, 0.05721523, 1.242744, 0.1333333, 0, 1, 1,
0.4560523, 0.4772681, 0.919883, 0.1411765, 0, 1, 1,
0.4564508, -1.606014, 2.915125, 0.145098, 0, 1, 1,
0.4656579, 0.103115, 0.6987579, 0.1529412, 0, 1, 1,
0.4669487, -0.03684002, 1.271477, 0.1568628, 0, 1, 1,
0.4713241, 2.614938, -0.5141155, 0.1647059, 0, 1, 1,
0.4716656, -0.4390027, 1.89514, 0.1686275, 0, 1, 1,
0.473151, 0.03700863, 0.5349329, 0.1764706, 0, 1, 1,
0.474746, -0.4509422, 1.902287, 0.1803922, 0, 1, 1,
0.4795654, -0.1262051, 0.4895262, 0.1882353, 0, 1, 1,
0.4813034, -0.6821187, 1.620182, 0.1921569, 0, 1, 1,
0.4830585, -1.807138, 2.93612, 0.2, 0, 1, 1,
0.4838575, -0.03323566, 0.8310474, 0.2078431, 0, 1, 1,
0.4905707, 0.09013925, 3.418591, 0.2117647, 0, 1, 1,
0.4926519, 1.014491, -0.1388145, 0.2196078, 0, 1, 1,
0.4927962, -0.3702525, 2.609576, 0.2235294, 0, 1, 1,
0.4940014, -0.8859981, 4.373256, 0.2313726, 0, 1, 1,
0.4951655, 1.467944, 0.08124082, 0.2352941, 0, 1, 1,
0.4962498, 1.061228, 1.064222, 0.2431373, 0, 1, 1,
0.4979994, -0.8517907, 2.465461, 0.2470588, 0, 1, 1,
0.4982352, 0.9439141, -0.05868183, 0.254902, 0, 1, 1,
0.5003678, -0.9846774, 4.505779, 0.2588235, 0, 1, 1,
0.5017464, 0.3174849, 2.313107, 0.2666667, 0, 1, 1,
0.5034148, -0.4826093, 1.863676, 0.2705882, 0, 1, 1,
0.5048947, 1.311227, 1.612158, 0.2784314, 0, 1, 1,
0.505074, -1.05249, 1.107424, 0.282353, 0, 1, 1,
0.5051905, -1.114903, 2.697619, 0.2901961, 0, 1, 1,
0.5073991, -0.002727771, 1.798637, 0.2941177, 0, 1, 1,
0.5091387, -0.3033772, 1.262215, 0.3019608, 0, 1, 1,
0.5118798, -0.1216962, 2.179512, 0.3098039, 0, 1, 1,
0.5123523, 1.674808, 1.001028, 0.3137255, 0, 1, 1,
0.5169361, -0.3755035, 3.485512, 0.3215686, 0, 1, 1,
0.5186189, 0.7797434, 0.8593144, 0.3254902, 0, 1, 1,
0.5243248, -0.05787625, 1.409157, 0.3333333, 0, 1, 1,
0.52527, 1.116266, 0.7449463, 0.3372549, 0, 1, 1,
0.5268081, -0.5441432, 3.103643, 0.345098, 0, 1, 1,
0.5279452, 1.504455, 0.4414128, 0.3490196, 0, 1, 1,
0.5297044, -1.742028, 2.933163, 0.3568628, 0, 1, 1,
0.536791, -1.190807, 3.877381, 0.3607843, 0, 1, 1,
0.5434389, 1.09509, 1.907118, 0.3686275, 0, 1, 1,
0.5434992, -0.4438782, 0.6949787, 0.372549, 0, 1, 1,
0.5499873, 0.3775377, 1.807983, 0.3803922, 0, 1, 1,
0.5518052, -0.6171402, 0.8312613, 0.3843137, 0, 1, 1,
0.5522284, 1.429291, -0.4320398, 0.3921569, 0, 1, 1,
0.5536534, -1.229007, 3.822289, 0.3960784, 0, 1, 1,
0.5585809, 0.7790378, 0.7935374, 0.4039216, 0, 1, 1,
0.560431, -0.4253108, 0.9676893, 0.4117647, 0, 1, 1,
0.5623282, 0.3334419, 1.991998, 0.4156863, 0, 1, 1,
0.5651755, 0.4160435, 1.050475, 0.4235294, 0, 1, 1,
0.5652364, 1.354798, 0.6491003, 0.427451, 0, 1, 1,
0.5652626, -1.186729, 2.60649, 0.4352941, 0, 1, 1,
0.5712559, 1.286669, 0.08999678, 0.4392157, 0, 1, 1,
0.5726894, -1.260989, 3.523905, 0.4470588, 0, 1, 1,
0.5825248, -0.4528308, 0.1235924, 0.4509804, 0, 1, 1,
0.5833807, -0.623223, 1.626959, 0.4588235, 0, 1, 1,
0.58738, -0.9603974, 2.413461, 0.4627451, 0, 1, 1,
0.5874295, 1.045167, 0.2533483, 0.4705882, 0, 1, 1,
0.5900545, 0.03040247, 2.166411, 0.4745098, 0, 1, 1,
0.5905348, -1.123727, 2.604738, 0.4823529, 0, 1, 1,
0.5916473, 1.333763, 1.116875, 0.4862745, 0, 1, 1,
0.5921624, 1.12412, 1.049774, 0.4941176, 0, 1, 1,
0.5940798, -0.1649493, 2.821903, 0.5019608, 0, 1, 1,
0.595466, 2.043362, -0.7426586, 0.5058824, 0, 1, 1,
0.5978726, -2.537402, 3.498643, 0.5137255, 0, 1, 1,
0.6036777, -0.7244724, 4.779944, 0.5176471, 0, 1, 1,
0.604294, 0.3145695, 1.398706, 0.5254902, 0, 1, 1,
0.6066805, 0.2353146, 0.1009855, 0.5294118, 0, 1, 1,
0.6091841, -0.1313256, 3.001488, 0.5372549, 0, 1, 1,
0.6130115, -0.2284222, 2.76476, 0.5411765, 0, 1, 1,
0.6165277, 1.449878, -0.3600442, 0.5490196, 0, 1, 1,
0.625809, 0.1419628, 2.072026, 0.5529412, 0, 1, 1,
0.6312631, 0.001110844, 1.931505, 0.5607843, 0, 1, 1,
0.6387779, 0.3529425, 1.609921, 0.5647059, 0, 1, 1,
0.639504, -0.327886, 1.86056, 0.572549, 0, 1, 1,
0.6400356, 0.1187764, 2.383182, 0.5764706, 0, 1, 1,
0.6428007, -0.2242943, 0.9855711, 0.5843138, 0, 1, 1,
0.6477545, -0.09119467, 2.135195, 0.5882353, 0, 1, 1,
0.6503078, 1.075475, 0.8554922, 0.5960785, 0, 1, 1,
0.6525277, 0.8660642, 0.5185441, 0.6039216, 0, 1, 1,
0.6549773, 1.749368, 1.963776, 0.6078432, 0, 1, 1,
0.6589066, -0.4736044, 2.254865, 0.6156863, 0, 1, 1,
0.661692, 0.2719994, 1.178189, 0.6196079, 0, 1, 1,
0.6635317, -1.116173, 2.170973, 0.627451, 0, 1, 1,
0.6676382, -1.341268, 5.290451, 0.6313726, 0, 1, 1,
0.6695652, -0.1151558, 1.915137, 0.6392157, 0, 1, 1,
0.67231, -0.4142844, 3.601501, 0.6431373, 0, 1, 1,
0.6742771, 0.8495881, 2.144786, 0.6509804, 0, 1, 1,
0.6746382, 1.677851, 2.218387, 0.654902, 0, 1, 1,
0.6757122, 0.3055174, 0.1007525, 0.6627451, 0, 1, 1,
0.6849708, -0.02992398, 1.821645, 0.6666667, 0, 1, 1,
0.6919794, 0.6602644, 1.036914, 0.6745098, 0, 1, 1,
0.6929852, 0.175403, 1.199952, 0.6784314, 0, 1, 1,
0.6998093, 0.9412038, 0.3056656, 0.6862745, 0, 1, 1,
0.7078582, 1.962199, 0.009682547, 0.6901961, 0, 1, 1,
0.7102379, 0.2617671, 1.627845, 0.6980392, 0, 1, 1,
0.7102434, 1.06642, 1.549386, 0.7058824, 0, 1, 1,
0.7107165, -1.545743, 2.526121, 0.7098039, 0, 1, 1,
0.7132234, 0.1810272, 1.767458, 0.7176471, 0, 1, 1,
0.7143775, -0.7867092, 1.278402, 0.7215686, 0, 1, 1,
0.7146499, -0.5707942, 3.07674, 0.7294118, 0, 1, 1,
0.7208707, 0.04598512, 0.4850053, 0.7333333, 0, 1, 1,
0.7224504, -0.2683939, -0.2140814, 0.7411765, 0, 1, 1,
0.7239718, 0.8398589, -0.5622808, 0.7450981, 0, 1, 1,
0.7346511, -0.5599992, 4.105428, 0.7529412, 0, 1, 1,
0.7401623, 0.1436689, 1.149304, 0.7568628, 0, 1, 1,
0.7410946, 1.659823, 0.9924902, 0.7647059, 0, 1, 1,
0.7453429, -0.7926667, 3.429742, 0.7686275, 0, 1, 1,
0.7499613, -0.3172873, 1.147584, 0.7764706, 0, 1, 1,
0.7520434, 0.8168393, 0.2862552, 0.7803922, 0, 1, 1,
0.7540961, 0.9836054, -0.1824119, 0.7882353, 0, 1, 1,
0.7545751, -1.556898, 0.6164302, 0.7921569, 0, 1, 1,
0.7554014, 0.3867597, 3.313247, 0.8, 0, 1, 1,
0.76174, 0.1724655, 0.3780405, 0.8078431, 0, 1, 1,
0.7667423, 1.996585, 0.6621693, 0.8117647, 0, 1, 1,
0.767957, -0.8218902, 3.400867, 0.8196079, 0, 1, 1,
0.7775825, -0.2035396, 3.946357, 0.8235294, 0, 1, 1,
0.7792345, 0.5798413, 2.748319, 0.8313726, 0, 1, 1,
0.7804561, -0.9302633, 2.195322, 0.8352941, 0, 1, 1,
0.7807033, -1.265787, 3.603336, 0.8431373, 0, 1, 1,
0.7815068, -0.8255361, 2.246965, 0.8470588, 0, 1, 1,
0.7828239, -0.3084899, 2.131496, 0.854902, 0, 1, 1,
0.7849266, -0.9769843, 2.592632, 0.8588235, 0, 1, 1,
0.7905664, -0.47709, 1.073079, 0.8666667, 0, 1, 1,
0.7985476, 0.002836705, 2.523851, 0.8705882, 0, 1, 1,
0.8044551, -1.832288, 2.85962, 0.8784314, 0, 1, 1,
0.809087, -0.8222124, 3.480655, 0.8823529, 0, 1, 1,
0.8114154, 0.08336446, 1.643214, 0.8901961, 0, 1, 1,
0.8137375, -0.03318911, 1.414601, 0.8941177, 0, 1, 1,
0.8144935, -0.05087779, 1.191265, 0.9019608, 0, 1, 1,
0.820566, 0.2276729, 0.371419, 0.9098039, 0, 1, 1,
0.8223332, -0.6068293, 3.077464, 0.9137255, 0, 1, 1,
0.8329273, -1.176558, 2.20667, 0.9215686, 0, 1, 1,
0.8337817, -0.2214101, 3.093694, 0.9254902, 0, 1, 1,
0.8342271, -0.1302714, 3.320889, 0.9333333, 0, 1, 1,
0.8497761, -0.5719119, 1.7925, 0.9372549, 0, 1, 1,
0.8566161, -1.081337, 2.509793, 0.945098, 0, 1, 1,
0.8605842, 0.3474395, 0.741298, 0.9490196, 0, 1, 1,
0.8676222, 1.332038, 0.1853353, 0.9568627, 0, 1, 1,
0.8684743, -0.7510984, 2.993708, 0.9607843, 0, 1, 1,
0.8686433, -0.05660945, 2.259458, 0.9686275, 0, 1, 1,
0.8691712, 1.939083, 1.672824, 0.972549, 0, 1, 1,
0.8718892, -0.8647687, 1.663296, 0.9803922, 0, 1, 1,
0.8796826, 1.346343, 0.1107598, 0.9843137, 0, 1, 1,
0.8797882, -0.495926, 1.432891, 0.9921569, 0, 1, 1,
0.8816069, -0.1927284, 1.550071, 0.9960784, 0, 1, 1,
0.8824316, 0.5727459, 0.6228788, 1, 0, 0.9960784, 1,
0.8849376, -0.7225505, 3.081893, 1, 0, 0.9882353, 1,
0.8884085, -1.161212, 2.482704, 1, 0, 0.9843137, 1,
0.8888029, -2.270197, 3.092598, 1, 0, 0.9764706, 1,
0.8963774, -0.2663494, 2.888659, 1, 0, 0.972549, 1,
0.9054557, -0.06547191, 0.3114269, 1, 0, 0.9647059, 1,
0.9090829, -0.3774223, -0.6701808, 1, 0, 0.9607843, 1,
0.914526, -0.5409878, 1.951439, 1, 0, 0.9529412, 1,
0.9171088, 1.518183, 1.998384, 1, 0, 0.9490196, 1,
0.9178108, -0.2453376, 0.8749849, 1, 0, 0.9411765, 1,
0.9206493, 0.1365328, 1.542107, 1, 0, 0.9372549, 1,
0.931418, -0.7924705, 1.336999, 1, 0, 0.9294118, 1,
0.9366199, -0.1711659, 0.8200285, 1, 0, 0.9254902, 1,
0.9420751, 0.9762748, -0.1130064, 1, 0, 0.9176471, 1,
0.9441653, -1.100443, 2.080072, 1, 0, 0.9137255, 1,
0.9457455, 0.5636415, 1.312439, 1, 0, 0.9058824, 1,
0.9518747, 0.8771145, 1.135623, 1, 0, 0.9019608, 1,
0.9527549, -1.754817, 4.521245, 1, 0, 0.8941177, 1,
0.9536282, -0.4425746, 2.382876, 1, 0, 0.8862745, 1,
0.9586285, 0.2306322, 2.032756, 1, 0, 0.8823529, 1,
0.9678053, 1.461265, 0.2694234, 1, 0, 0.8745098, 1,
0.9736138, -1.205612, 1.695114, 1, 0, 0.8705882, 1,
0.978977, -0.05118536, 0.8462268, 1, 0, 0.8627451, 1,
0.9795308, -0.5197135, 2.536754, 1, 0, 0.8588235, 1,
0.9825069, 0.4627629, 1.819921, 1, 0, 0.8509804, 1,
0.9923651, -0.9444117, 3.108971, 1, 0, 0.8470588, 1,
0.9928532, -0.1536597, 1.837568, 1, 0, 0.8392157, 1,
1.002238, -2.215212, 3.015246, 1, 0, 0.8352941, 1,
1.006673, 1.087643, 0.7764522, 1, 0, 0.827451, 1,
1.011475, 1.526209, 1.358132, 1, 0, 0.8235294, 1,
1.015594, 1.077492, 0.4236142, 1, 0, 0.8156863, 1,
1.026456, -1.331486, 1.51466, 1, 0, 0.8117647, 1,
1.026652, -0.0485804, 2.953789, 1, 0, 0.8039216, 1,
1.033071, -1.369602, 2.362782, 1, 0, 0.7960784, 1,
1.039837, -0.3094202, 1.820233, 1, 0, 0.7921569, 1,
1.046817, 0.3177025, 0.2979439, 1, 0, 0.7843137, 1,
1.057732, -0.6492957, 1.821545, 1, 0, 0.7803922, 1,
1.064686, -0.2353009, -0.3774748, 1, 0, 0.772549, 1,
1.065553, 1.22073, 2.759869, 1, 0, 0.7686275, 1,
1.065681, -0.1906131, 1.584729, 1, 0, 0.7607843, 1,
1.070181, 0.1889408, 1.935969, 1, 0, 0.7568628, 1,
1.070665, -1.31016, 1.573812, 1, 0, 0.7490196, 1,
1.08695, 2.989503, 2.143737, 1, 0, 0.7450981, 1,
1.094238, -0.8894868, 2.633785, 1, 0, 0.7372549, 1,
1.10085, 0.03852394, 0.7066549, 1, 0, 0.7333333, 1,
1.118969, 1.123527, 1.604978, 1, 0, 0.7254902, 1,
1.128853, 0.4632979, 2.291807, 1, 0, 0.7215686, 1,
1.131107, -0.6611574, 2.629009, 1, 0, 0.7137255, 1,
1.133254, -1.254959, 1.353454, 1, 0, 0.7098039, 1,
1.142965, 0.7031323, 0.5499231, 1, 0, 0.7019608, 1,
1.149112, 1.24911, 1.209791, 1, 0, 0.6941177, 1,
1.150449, 0.09691838, 1.350444, 1, 0, 0.6901961, 1,
1.153683, -0.2774545, 2.130038, 1, 0, 0.682353, 1,
1.158986, -1.264572, 4.221353, 1, 0, 0.6784314, 1,
1.17971, 0.8386818, 0.5231345, 1, 0, 0.6705883, 1,
1.212209, 0.6491582, -0.4198678, 1, 0, 0.6666667, 1,
1.21676, 0.1980038, 0.3095474, 1, 0, 0.6588235, 1,
1.218287, 0.1852905, 3.142367, 1, 0, 0.654902, 1,
1.223258, -1.120651, 1.871725, 1, 0, 0.6470588, 1,
1.224578, -0.583508, 2.018383, 1, 0, 0.6431373, 1,
1.23744, 1.532835, 1.545051, 1, 0, 0.6352941, 1,
1.248689, 0.4670301, 2.221853, 1, 0, 0.6313726, 1,
1.250856, -0.07296284, 2.389704, 1, 0, 0.6235294, 1,
1.253168, -2.097534, 3.112135, 1, 0, 0.6196079, 1,
1.253185, -0.7867487, 3.807147, 1, 0, 0.6117647, 1,
1.256768, -0.4790817, 2.255498, 1, 0, 0.6078432, 1,
1.261154, -0.7530403, 2.831486, 1, 0, 0.6, 1,
1.261387, -0.8690643, 2.223528, 1, 0, 0.5921569, 1,
1.267313, 1.149447, 1.715898, 1, 0, 0.5882353, 1,
1.273094, -1.629387, 1.817106, 1, 0, 0.5803922, 1,
1.279422, -0.7042816, 2.101806, 1, 0, 0.5764706, 1,
1.282448, 0.4962137, 2.833672, 1, 0, 0.5686275, 1,
1.28246, 0.8609319, 0.9138564, 1, 0, 0.5647059, 1,
1.283803, -2.330239, 2.929821, 1, 0, 0.5568628, 1,
1.286471, -1.161302, 1.616336, 1, 0, 0.5529412, 1,
1.286675, -1.726847, 3.417975, 1, 0, 0.5450981, 1,
1.287359, 0.237858, -0.9211639, 1, 0, 0.5411765, 1,
1.29689, 0.1023204, 0.9748122, 1, 0, 0.5333334, 1,
1.297505, -1.410483, 1.347783, 1, 0, 0.5294118, 1,
1.305814, 0.8285273, 0.8027239, 1, 0, 0.5215687, 1,
1.306534, 0.006888294, 1.501514, 1, 0, 0.5176471, 1,
1.309503, -0.2794183, 2.041477, 1, 0, 0.509804, 1,
1.310025, -1.238061, 3.179661, 1, 0, 0.5058824, 1,
1.310579, 0.6517291, 1.218805, 1, 0, 0.4980392, 1,
1.311394, 0.4910282, -0.0297649, 1, 0, 0.4901961, 1,
1.338119, -0.9365265, 1.339563, 1, 0, 0.4862745, 1,
1.347372, 0.185696, 1.613604, 1, 0, 0.4784314, 1,
1.349217, 0.7982694, 1.813781, 1, 0, 0.4745098, 1,
1.378568, -0.350096, -0.1142246, 1, 0, 0.4666667, 1,
1.381584, 0.762475, -0.8385502, 1, 0, 0.4627451, 1,
1.383977, -0.1380099, 1.13039, 1, 0, 0.454902, 1,
1.392986, -2.069443, 4.22579, 1, 0, 0.4509804, 1,
1.394538, 0.1979997, 2.03158, 1, 0, 0.4431373, 1,
1.40566, -1.129695, 1.819567, 1, 0, 0.4392157, 1,
1.413668, 0.3731384, 2.942739, 1, 0, 0.4313726, 1,
1.421011, -1.538728, 2.73856, 1, 0, 0.427451, 1,
1.430141, 0.344937, 0.4777237, 1, 0, 0.4196078, 1,
1.430802, -0.9652071, 1.610711, 1, 0, 0.4156863, 1,
1.431507, 0.4266106, 2.001553, 1, 0, 0.4078431, 1,
1.436968, 0.2612369, 4.133637, 1, 0, 0.4039216, 1,
1.437241, -1.21464, 2.195689, 1, 0, 0.3960784, 1,
1.447532, -0.455743, 1.805485, 1, 0, 0.3882353, 1,
1.448483, 0.1203074, -0.8700014, 1, 0, 0.3843137, 1,
1.459967, 0.6396963, 1.912374, 1, 0, 0.3764706, 1,
1.461309, -0.4991596, 2.282294, 1, 0, 0.372549, 1,
1.468409, -0.7237806, 3.992359, 1, 0, 0.3647059, 1,
1.473986, -0.5618724, 3.80641, 1, 0, 0.3607843, 1,
1.483621, -0.9326907, 3.882744, 1, 0, 0.3529412, 1,
1.48586, -0.09535068, 0.580193, 1, 0, 0.3490196, 1,
1.494931, -1.433144, 2.706322, 1, 0, 0.3411765, 1,
1.498477, -1.450149, 1.656932, 1, 0, 0.3372549, 1,
1.503986, 0.4047032, 2.590038, 1, 0, 0.3294118, 1,
1.506168, 0.07888185, 0.8106487, 1, 0, 0.3254902, 1,
1.509489, -0.5144928, 3.211891, 1, 0, 0.3176471, 1,
1.521529, -0.0319781, 3.23163, 1, 0, 0.3137255, 1,
1.52273, 0.03916703, 0.8061088, 1, 0, 0.3058824, 1,
1.524761, 0.8136994, 2.058656, 1, 0, 0.2980392, 1,
1.531639, -0.1542571, 2.018401, 1, 0, 0.2941177, 1,
1.535471, -0.08889857, 0.2582006, 1, 0, 0.2862745, 1,
1.550626, -0.6464925, 2.2153, 1, 0, 0.282353, 1,
1.566872, -0.07176801, 1.889223, 1, 0, 0.2745098, 1,
1.571262, 0.8268666, 1.172868, 1, 0, 0.2705882, 1,
1.593501, -0.4626404, 2.926393, 1, 0, 0.2627451, 1,
1.597914, -0.4029464, 1.83762, 1, 0, 0.2588235, 1,
1.599213, 1.870516, -0.4262086, 1, 0, 0.2509804, 1,
1.619634, 1.163745, 0.1525676, 1, 0, 0.2470588, 1,
1.622741, -0.05134255, 2.351048, 1, 0, 0.2392157, 1,
1.629083, -0.2676306, 2.295897, 1, 0, 0.2352941, 1,
1.635485, -1.624143, 2.146461, 1, 0, 0.227451, 1,
1.636106, 0.9032348, 1.03959, 1, 0, 0.2235294, 1,
1.663509, -2.63459, 1.416787, 1, 0, 0.2156863, 1,
1.664138, -0.7796099, 2.061654, 1, 0, 0.2117647, 1,
1.721302, -0.969767, 0.7551479, 1, 0, 0.2039216, 1,
1.760996, -0.8806902, 2.050912, 1, 0, 0.1960784, 1,
1.782068, 0.3435273, 0.5228968, 1, 0, 0.1921569, 1,
1.799183, -0.5884004, 1.869018, 1, 0, 0.1843137, 1,
1.819149, -0.1852203, 1.480337, 1, 0, 0.1803922, 1,
1.822034, 0.4830875, 0.6138595, 1, 0, 0.172549, 1,
1.909354, 0.008793738, 0.323471, 1, 0, 0.1686275, 1,
1.941976, 0.8549451, -0.1202756, 1, 0, 0.1607843, 1,
1.945457, 0.7450047, 1.860331, 1, 0, 0.1568628, 1,
1.958588, -0.6905428, 2.497473, 1, 0, 0.1490196, 1,
1.966146, -0.4256759, 2.089692, 1, 0, 0.145098, 1,
1.968564, -0.3434379, 1.110196, 1, 0, 0.1372549, 1,
2.005988, -4.427101, 3.845732, 1, 0, 0.1333333, 1,
2.019047, 0.4639055, 1.308583, 1, 0, 0.1254902, 1,
2.026985, 0.8020824, 1.16294, 1, 0, 0.1215686, 1,
2.049229, -1.68786, 2.529802, 1, 0, 0.1137255, 1,
2.075092, 0.1664397, 1.669712, 1, 0, 0.1098039, 1,
2.100428, -1.175754, 1.547726, 1, 0, 0.1019608, 1,
2.121548, 0.5113028, 1.718117, 1, 0, 0.09411765, 1,
2.138257, 0.7654356, 3.506783, 1, 0, 0.09019608, 1,
2.185719, 0.6255718, -0.7509114, 1, 0, 0.08235294, 1,
2.199365, 1.200146, 0.4541629, 1, 0, 0.07843138, 1,
2.252651, 2.422449, 0.5130906, 1, 0, 0.07058824, 1,
2.25664, 0.3254777, -0.3302177, 1, 0, 0.06666667, 1,
2.280805, -0.6187012, 0.8560556, 1, 0, 0.05882353, 1,
2.358874, 0.9768323, 1.890715, 1, 0, 0.05490196, 1,
2.378103, 1.564527, 2.364521, 1, 0, 0.04705882, 1,
2.418221, 0.5253655, 2.31998, 1, 0, 0.04313726, 1,
2.455141, 0.4323177, 1.943975, 1, 0, 0.03529412, 1,
2.509108, -0.9873884, 2.196948, 1, 0, 0.03137255, 1,
2.674581, -1.570132, 4.361571, 1, 0, 0.02352941, 1,
2.699252, 0.1863867, 1.640858, 1, 0, 0.01960784, 1,
2.732915, 0.6461971, 1.712353, 1, 0, 0.01176471, 1,
2.807654, -1.577992, 1.458058, 1, 0, 0.007843138, 1
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
-0.2394234, -5.738412, -6.883542, 0, -0.5, 0.5, 0.5,
-0.2394234, -5.738412, -6.883542, 1, -0.5, 0.5, 0.5,
-0.2394234, -5.738412, -6.883542, 1, 1.5, 0.5, 0.5,
-0.2394234, -5.738412, -6.883542, 0, 1.5, 0.5, 0.5
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
-4.31946, -0.5589267, -6.883542, 0, -0.5, 0.5, 0.5,
-4.31946, -0.5589267, -6.883542, 1, -0.5, 0.5, 0.5,
-4.31946, -0.5589267, -6.883542, 1, 1.5, 0.5, 0.5,
-4.31946, -0.5589267, -6.883542, 0, 1.5, 0.5, 0.5
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
-4.31946, -5.738412, 0.1116085, 0, -0.5, 0.5, 0.5,
-4.31946, -5.738412, 0.1116085, 1, -0.5, 0.5, 0.5,
-4.31946, -5.738412, 0.1116085, 1, 1.5, 0.5, 0.5,
-4.31946, -5.738412, 0.1116085, 0, 1.5, 0.5, 0.5
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
-3, -4.543146, -5.269277,
2, -4.543146, -5.269277,
-3, -4.543146, -5.269277,
-3, -4.742357, -5.538321,
-2, -4.543146, -5.269277,
-2, -4.742357, -5.538321,
-1, -4.543146, -5.269277,
-1, -4.742357, -5.538321,
0, -4.543146, -5.269277,
0, -4.742357, -5.538321,
1, -4.543146, -5.269277,
1, -4.742357, -5.538321,
2, -4.543146, -5.269277,
2, -4.742357, -5.538321
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
-3, -5.140779, -6.076409, 0, -0.5, 0.5, 0.5,
-3, -5.140779, -6.076409, 1, -0.5, 0.5, 0.5,
-3, -5.140779, -6.076409, 1, 1.5, 0.5, 0.5,
-3, -5.140779, -6.076409, 0, 1.5, 0.5, 0.5,
-2, -5.140779, -6.076409, 0, -0.5, 0.5, 0.5,
-2, -5.140779, -6.076409, 1, -0.5, 0.5, 0.5,
-2, -5.140779, -6.076409, 1, 1.5, 0.5, 0.5,
-2, -5.140779, -6.076409, 0, 1.5, 0.5, 0.5,
-1, -5.140779, -6.076409, 0, -0.5, 0.5, 0.5,
-1, -5.140779, -6.076409, 1, -0.5, 0.5, 0.5,
-1, -5.140779, -6.076409, 1, 1.5, 0.5, 0.5,
-1, -5.140779, -6.076409, 0, 1.5, 0.5, 0.5,
0, -5.140779, -6.076409, 0, -0.5, 0.5, 0.5,
0, -5.140779, -6.076409, 1, -0.5, 0.5, 0.5,
0, -5.140779, -6.076409, 1, 1.5, 0.5, 0.5,
0, -5.140779, -6.076409, 0, 1.5, 0.5, 0.5,
1, -5.140779, -6.076409, 0, -0.5, 0.5, 0.5,
1, -5.140779, -6.076409, 1, -0.5, 0.5, 0.5,
1, -5.140779, -6.076409, 1, 1.5, 0.5, 0.5,
1, -5.140779, -6.076409, 0, 1.5, 0.5, 0.5,
2, -5.140779, -6.076409, 0, -0.5, 0.5, 0.5,
2, -5.140779, -6.076409, 1, -0.5, 0.5, 0.5,
2, -5.140779, -6.076409, 1, 1.5, 0.5, 0.5,
2, -5.140779, -6.076409, 0, 1.5, 0.5, 0.5
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
-3.377913, -4, -5.269277,
-3.377913, 2, -5.269277,
-3.377913, -4, -5.269277,
-3.534837, -4, -5.538321,
-3.377913, -2, -5.269277,
-3.534837, -2, -5.538321,
-3.377913, 0, -5.269277,
-3.534837, 0, -5.538321,
-3.377913, 2, -5.269277,
-3.534837, 2, -5.538321
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
-3.848686, -4, -6.076409, 0, -0.5, 0.5, 0.5,
-3.848686, -4, -6.076409, 1, -0.5, 0.5, 0.5,
-3.848686, -4, -6.076409, 1, 1.5, 0.5, 0.5,
-3.848686, -4, -6.076409, 0, 1.5, 0.5, 0.5,
-3.848686, -2, -6.076409, 0, -0.5, 0.5, 0.5,
-3.848686, -2, -6.076409, 1, -0.5, 0.5, 0.5,
-3.848686, -2, -6.076409, 1, 1.5, 0.5, 0.5,
-3.848686, -2, -6.076409, 0, 1.5, 0.5, 0.5,
-3.848686, 0, -6.076409, 0, -0.5, 0.5, 0.5,
-3.848686, 0, -6.076409, 1, -0.5, 0.5, 0.5,
-3.848686, 0, -6.076409, 1, 1.5, 0.5, 0.5,
-3.848686, 0, -6.076409, 0, 1.5, 0.5, 0.5,
-3.848686, 2, -6.076409, 0, -0.5, 0.5, 0.5,
-3.848686, 2, -6.076409, 1, -0.5, 0.5, 0.5,
-3.848686, 2, -6.076409, 1, 1.5, 0.5, 0.5,
-3.848686, 2, -6.076409, 0, 1.5, 0.5, 0.5
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
-3.377913, -4.543146, -4,
-3.377913, -4.543146, 4,
-3.377913, -4.543146, -4,
-3.534837, -4.742357, -4,
-3.377913, -4.543146, -2,
-3.534837, -4.742357, -2,
-3.377913, -4.543146, 0,
-3.534837, -4.742357, 0,
-3.377913, -4.543146, 2,
-3.534837, -4.742357, 2,
-3.377913, -4.543146, 4,
-3.534837, -4.742357, 4
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
-3.848686, -5.140779, -4, 0, -0.5, 0.5, 0.5,
-3.848686, -5.140779, -4, 1, -0.5, 0.5, 0.5,
-3.848686, -5.140779, -4, 1, 1.5, 0.5, 0.5,
-3.848686, -5.140779, -4, 0, 1.5, 0.5, 0.5,
-3.848686, -5.140779, -2, 0, -0.5, 0.5, 0.5,
-3.848686, -5.140779, -2, 1, -0.5, 0.5, 0.5,
-3.848686, -5.140779, -2, 1, 1.5, 0.5, 0.5,
-3.848686, -5.140779, -2, 0, 1.5, 0.5, 0.5,
-3.848686, -5.140779, 0, 0, -0.5, 0.5, 0.5,
-3.848686, -5.140779, 0, 1, -0.5, 0.5, 0.5,
-3.848686, -5.140779, 0, 1, 1.5, 0.5, 0.5,
-3.848686, -5.140779, 0, 0, 1.5, 0.5, 0.5,
-3.848686, -5.140779, 2, 0, -0.5, 0.5, 0.5,
-3.848686, -5.140779, 2, 1, -0.5, 0.5, 0.5,
-3.848686, -5.140779, 2, 1, 1.5, 0.5, 0.5,
-3.848686, -5.140779, 2, 0, 1.5, 0.5, 0.5,
-3.848686, -5.140779, 4, 0, -0.5, 0.5, 0.5,
-3.848686, -5.140779, 4, 1, -0.5, 0.5, 0.5,
-3.848686, -5.140779, 4, 1, 1.5, 0.5, 0.5,
-3.848686, -5.140779, 4, 0, 1.5, 0.5, 0.5
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
-3.377913, -4.543146, -5.269277,
-3.377913, 3.425293, -5.269277,
-3.377913, -4.543146, 5.492494,
-3.377913, 3.425293, 5.492494,
-3.377913, -4.543146, -5.269277,
-3.377913, -4.543146, 5.492494,
-3.377913, 3.425293, -5.269277,
-3.377913, 3.425293, 5.492494,
-3.377913, -4.543146, -5.269277,
2.899066, -4.543146, -5.269277,
-3.377913, -4.543146, 5.492494,
2.899066, -4.543146, 5.492494,
-3.377913, 3.425293, -5.269277,
2.899066, 3.425293, -5.269277,
-3.377913, 3.425293, 5.492494,
2.899066, 3.425293, 5.492494,
2.899066, -4.543146, -5.269277,
2.899066, 3.425293, -5.269277,
2.899066, -4.543146, 5.492494,
2.899066, 3.425293, 5.492494,
2.899066, -4.543146, -5.269277,
2.899066, -4.543146, 5.492494,
2.899066, 3.425293, -5.269277,
2.899066, 3.425293, 5.492494
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
var radius = 7.896997;
var distance = 35.13463;
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
mvMatrix.translate( 0.2394234, 0.5589267, -0.1116085 );
mvMatrix.scale( 1.36027, 1.071526, 0.7933999 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.13463);
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
thifluzamide<-read.table("thifluzamide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thifluzamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'thifluzamide' not found
```

```r
y<-thifluzamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'thifluzamide' not found
```

```r
z<-thifluzamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'thifluzamide' not found
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
-3.286501, 0.1089209, -2.451952, 0, 0, 1, 1, 1,
-3.060452, 1.270957, -0.5105042, 1, 0, 0, 1, 1,
-2.784576, 1.303476, -0.9684398, 1, 0, 0, 1, 1,
-2.719119, 0.8815055, -1.919926, 1, 0, 0, 1, 1,
-2.507922, 1.417586, -1.673824, 1, 0, 0, 1, 1,
-2.487706, 0.7420548, -0.6613151, 1, 0, 0, 1, 1,
-2.385398, -0.5543306, -1.14989, 0, 0, 0, 1, 1,
-2.319122, -1.207222, -1.123952, 0, 0, 0, 1, 1,
-2.297341, 0.7397295, -0.60391, 0, 0, 0, 1, 1,
-2.296398, -0.493166, -0.72462, 0, 0, 0, 1, 1,
-2.256133, -2.395327, -1.488047, 0, 0, 0, 1, 1,
-2.248957, -1.720538, -2.742016, 0, 0, 0, 1, 1,
-2.239481, -0.4456163, -3.004201, 0, 0, 0, 1, 1,
-2.217301, -1.672641, -1.090177, 1, 1, 1, 1, 1,
-2.149134, 1.764896, 0.8812025, 1, 1, 1, 1, 1,
-2.123489, 0.03222903, -2.339233, 1, 1, 1, 1, 1,
-2.102783, -0.05121945, -1.581572, 1, 1, 1, 1, 1,
-2.010866, 0.8979287, 0.7762724, 1, 1, 1, 1, 1,
-2.000256, 0.04387552, -0.2541265, 1, 1, 1, 1, 1,
-1.989886, 1.80293, 1.039803, 1, 1, 1, 1, 1,
-1.982378, 0.1698723, -1.500473, 1, 1, 1, 1, 1,
-1.978176, 1.042013, 0.5683733, 1, 1, 1, 1, 1,
-1.976174, 0.1545224, -1.4598, 1, 1, 1, 1, 1,
-1.956779, 0.5798944, -1.377702, 1, 1, 1, 1, 1,
-1.950223, 0.6371298, -1.659598, 1, 1, 1, 1, 1,
-1.940983, 0.4069632, -1.800409, 1, 1, 1, 1, 1,
-1.926752, 1.260253, 0.100977, 1, 1, 1, 1, 1,
-1.869099, 1.925489, -0.6657205, 1, 1, 1, 1, 1,
-1.855693, 0.04897913, -1.529469, 0, 0, 1, 1, 1,
-1.848705, 0.8811296, -0.9940205, 1, 0, 0, 1, 1,
-1.838941, 0.7105548, -0.3138774, 1, 0, 0, 1, 1,
-1.819762, 0.9030018, 1.027989, 1, 0, 0, 1, 1,
-1.817926, -1.627451, -1.240757, 1, 0, 0, 1, 1,
-1.81761, -3.081158, -2.950541, 1, 0, 0, 1, 1,
-1.817504, -0.04083114, -1.914505, 0, 0, 0, 1, 1,
-1.794663, -1.915496, -2.505784, 0, 0, 0, 1, 1,
-1.788284, 1.09588, -1.777987, 0, 0, 0, 1, 1,
-1.783398, 2.28486, -0.7227584, 0, 0, 0, 1, 1,
-1.764007, -2.888398, -3.522439, 0, 0, 0, 1, 1,
-1.757224, -0.537666, -2.057969, 0, 0, 0, 1, 1,
-1.738501, -0.7237577, -2.450446, 0, 0, 0, 1, 1,
-1.706939, -0.08210845, 0.01359975, 1, 1, 1, 1, 1,
-1.695919, 1.562336, 0.2463562, 1, 1, 1, 1, 1,
-1.671154, 0.1502267, 0.9313468, 1, 1, 1, 1, 1,
-1.651321, 1.492249, -0.508023, 1, 1, 1, 1, 1,
-1.638269, 1.224046, -0.6033697, 1, 1, 1, 1, 1,
-1.637138, 0.6793403, -1.618913, 1, 1, 1, 1, 1,
-1.631267, 0.2302168, -1.038301, 1, 1, 1, 1, 1,
-1.629553, -0.6709623, -2.787349, 1, 1, 1, 1, 1,
-1.621362, 0.1649844, -2.47597, 1, 1, 1, 1, 1,
-1.59205, -0.03691407, -1.143113, 1, 1, 1, 1, 1,
-1.58737, 0.0109695, -1.058533, 1, 1, 1, 1, 1,
-1.586283, -0.7886652, -0.5521661, 1, 1, 1, 1, 1,
-1.578576, 1.476641, -1.445541, 1, 1, 1, 1, 1,
-1.574687, 0.5805568, -0.8748249, 1, 1, 1, 1, 1,
-1.565539, -1.7123, -2.025902, 1, 1, 1, 1, 1,
-1.555919, 1.303377, 0.7351314, 0, 0, 1, 1, 1,
-1.552643, -2.891375, -1.944768, 1, 0, 0, 1, 1,
-1.540382, 0.7088677, -1.46278, 1, 0, 0, 1, 1,
-1.53651, -0.3399594, -2.056341, 1, 0, 0, 1, 1,
-1.526412, 1.131531, -0.0925933, 1, 0, 0, 1, 1,
-1.519191, 0.02146971, -1.828478, 1, 0, 0, 1, 1,
-1.513939, -0.5853909, -2.333752, 0, 0, 0, 1, 1,
-1.512475, -0.6661288, -3.459782, 0, 0, 0, 1, 1,
-1.506578, 0.05308193, -2.039086, 0, 0, 0, 1, 1,
-1.501586, 0.8573276, -0.06264067, 0, 0, 0, 1, 1,
-1.499507, 0.6894343, -0.3475929, 0, 0, 0, 1, 1,
-1.497811, 0.2933773, -0.8163366, 0, 0, 0, 1, 1,
-1.492262, 0.7006943, -1.178193, 0, 0, 0, 1, 1,
-1.492054, 0.02688574, -0.7963632, 1, 1, 1, 1, 1,
-1.47832, 1.404922, -0.9921146, 1, 1, 1, 1, 1,
-1.477482, 0.6097487, -2.364903, 1, 1, 1, 1, 1,
-1.464931, -0.4802865, -1.84502, 1, 1, 1, 1, 1,
-1.458158, -1.230941, -3.377974, 1, 1, 1, 1, 1,
-1.449261, 0.2062772, -1.75486, 1, 1, 1, 1, 1,
-1.442496, -0.9819722, -2.658476, 1, 1, 1, 1, 1,
-1.43897, 0.4280259, -0.0939656, 1, 1, 1, 1, 1,
-1.424126, -1.069367, -1.735673, 1, 1, 1, 1, 1,
-1.397883, 1.161225, 0.1398425, 1, 1, 1, 1, 1,
-1.382676, 0.2518177, -3.335977, 1, 1, 1, 1, 1,
-1.378731, -0.0232719, -2.941401, 1, 1, 1, 1, 1,
-1.375515, 1.571256, 0.3684103, 1, 1, 1, 1, 1,
-1.372513, 0.7831993, 0.5578548, 1, 1, 1, 1, 1,
-1.372325, 1.6368, 0.4590269, 1, 1, 1, 1, 1,
-1.363976, 0.7656541, -0.9352866, 0, 0, 1, 1, 1,
-1.362914, 0.6754664, -0.7082916, 1, 0, 0, 1, 1,
-1.359982, 0.2779829, 0.742137, 1, 0, 0, 1, 1,
-1.354255, -0.6286649, -3.049806, 1, 0, 0, 1, 1,
-1.339962, -0.945751, -1.888636, 1, 0, 0, 1, 1,
-1.336336, -0.3329368, -0.547327, 1, 0, 0, 1, 1,
-1.324797, 0.7847833, -0.6025249, 0, 0, 0, 1, 1,
-1.311429, -0.6761956, -1.67176, 0, 0, 0, 1, 1,
-1.306421, -1.512982, -3.202793, 0, 0, 0, 1, 1,
-1.300546, -0.1654224, -2.599395, 0, 0, 0, 1, 1,
-1.292788, -0.7204726, -3.041276, 0, 0, 0, 1, 1,
-1.27266, 0.4003996, -2.243518, 0, 0, 0, 1, 1,
-1.271827, -0.8088275, -2.187455, 0, 0, 0, 1, 1,
-1.26901, -0.5529163, -3.736965, 1, 1, 1, 1, 1,
-1.268343, 2.605457, -0.9249642, 1, 1, 1, 1, 1,
-1.266057, -1.209154, -1.459437, 1, 1, 1, 1, 1,
-1.265561, 0.5309954, 0.7137409, 1, 1, 1, 1, 1,
-1.259781, -1.114298, -2.374342, 1, 1, 1, 1, 1,
-1.249262, 1.550475, 1.2653, 1, 1, 1, 1, 1,
-1.241997, -0.8143989, -1.788414, 1, 1, 1, 1, 1,
-1.235562, -1.616883, -1.707333, 1, 1, 1, 1, 1,
-1.227268, 0.328005, -2.373492, 1, 1, 1, 1, 1,
-1.223649, 0.2863315, -1.455086, 1, 1, 1, 1, 1,
-1.217413, 0.5799646, -0.4802922, 1, 1, 1, 1, 1,
-1.216182, -1.378111, -2.913035, 1, 1, 1, 1, 1,
-1.213923, 0.3472788, -1.187404, 1, 1, 1, 1, 1,
-1.20863, 1.009303, -0.7930436, 1, 1, 1, 1, 1,
-1.206427, -0.2253798, -0.8345661, 1, 1, 1, 1, 1,
-1.206074, -0.8865233, -1.046878, 0, 0, 1, 1, 1,
-1.196708, -0.003795505, -2.135239, 1, 0, 0, 1, 1,
-1.191335, -0.2295016, -2.488762, 1, 0, 0, 1, 1,
-1.186933, 1.364143, -1.252429, 1, 0, 0, 1, 1,
-1.175544, -1.530701, -2.756336, 1, 0, 0, 1, 1,
-1.167539, -0.7180527, -1.13246, 1, 0, 0, 1, 1,
-1.158278, -0.435625, -1.148584, 0, 0, 0, 1, 1,
-1.158159, -1.208274, -1.395078, 0, 0, 0, 1, 1,
-1.142101, -1.253662, -4.306482, 0, 0, 0, 1, 1,
-1.141513, -1.341354, -4.012387, 0, 0, 0, 1, 1,
-1.139866, -0.5594592, -3.032002, 0, 0, 0, 1, 1,
-1.138977, -1.620815, -3.142641, 0, 0, 0, 1, 1,
-1.13044, 1.416103, -1.269837, 0, 0, 0, 1, 1,
-1.121969, -0.6515456, 0.1524225, 1, 1, 1, 1, 1,
-1.119361, 2.576864, -0.2707441, 1, 1, 1, 1, 1,
-1.112626, -0.4421574, -0.9840887, 1, 1, 1, 1, 1,
-1.110167, -1.565731, -2.005427, 1, 1, 1, 1, 1,
-1.098709, -0.1110371, -2.252838, 1, 1, 1, 1, 1,
-1.094383, -2.288601, -0.4541468, 1, 1, 1, 1, 1,
-1.093425, 0.4384589, -2.01827, 1, 1, 1, 1, 1,
-1.093258, 0.7021527, 1.467811, 1, 1, 1, 1, 1,
-1.085622, -0.9155186, -1.326873, 1, 1, 1, 1, 1,
-1.084359, -0.9213592, -2.891694, 1, 1, 1, 1, 1,
-1.080273, -0.5210662, -2.741544, 1, 1, 1, 1, 1,
-1.08009, -1.255061, -3.78191, 1, 1, 1, 1, 1,
-1.073404, -1.017103, -1.876766, 1, 1, 1, 1, 1,
-1.070924, -0.3800805, -1.514495, 1, 1, 1, 1, 1,
-1.060943, 0.1887071, -0.1727961, 1, 1, 1, 1, 1,
-1.056627, -0.991743, -2.20199, 0, 0, 1, 1, 1,
-1.054693, -0.6829413, -2.878277, 1, 0, 0, 1, 1,
-1.047686, 0.9716076, -1.530247, 1, 0, 0, 1, 1,
-1.042727, -0.9828829, -2.593922, 1, 0, 0, 1, 1,
-1.042297, 0.7813222, 0.5337668, 1, 0, 0, 1, 1,
-1.038718, 0.8614923, -1.115031, 1, 0, 0, 1, 1,
-1.035268, -0.8562828, -2.6942, 0, 0, 0, 1, 1,
-1.030439, 0.02517121, -1.817461, 0, 0, 0, 1, 1,
-1.029788, 0.5412746, -4.139031e-05, 0, 0, 0, 1, 1,
-1.021175, 1.663289, 0.3313049, 0, 0, 0, 1, 1,
-1.019381, -0.1960289, -1.48958, 0, 0, 0, 1, 1,
-1.007852, 0.03058268, -3.311356, 0, 0, 0, 1, 1,
-0.9861031, 1.166809, -0.1217173, 0, 0, 0, 1, 1,
-0.9811147, 1.642974, -0.8909215, 1, 1, 1, 1, 1,
-0.978029, 1.555732, -2.119896, 1, 1, 1, 1, 1,
-0.9716799, -1.425457, -2.662433, 1, 1, 1, 1, 1,
-0.9715961, 0.3173579, 0.7557824, 1, 1, 1, 1, 1,
-0.9551615, -0.3559312, -1.03416, 1, 1, 1, 1, 1,
-0.9543018, -1.969694, -2.826469, 1, 1, 1, 1, 1,
-0.9529124, -0.8555216, -3.296083, 1, 1, 1, 1, 1,
-0.9484481, 0.2221018, -2.353419, 1, 1, 1, 1, 1,
-0.9456894, -2.283017, -1.455905, 1, 1, 1, 1, 1,
-0.9454138, -0.8655625, -0.3347394, 1, 1, 1, 1, 1,
-0.9400604, 0.4784881, -0.4537349, 1, 1, 1, 1, 1,
-0.9382389, -1.348668, -0.506835, 1, 1, 1, 1, 1,
-0.93733, 0.2568172, -0.9780787, 1, 1, 1, 1, 1,
-0.9356399, 1.211758, -0.1121703, 1, 1, 1, 1, 1,
-0.9280966, -1.530185, -2.501837, 1, 1, 1, 1, 1,
-0.923459, 0.262697, -1.954193, 0, 0, 1, 1, 1,
-0.9231399, 1.220627, -2.096958, 1, 0, 0, 1, 1,
-0.9194442, -2.245288, -2.954947, 1, 0, 0, 1, 1,
-0.9163877, -1.630356, -4.702483, 1, 0, 0, 1, 1,
-0.9156646, -0.3788312, -2.159082, 1, 0, 0, 1, 1,
-0.9149303, -0.4895282, -0.6145805, 1, 0, 0, 1, 1,
-0.9112778, -1.375244, -0.2890579, 0, 0, 0, 1, 1,
-0.9077331, 0.4692589, -1.173691, 0, 0, 0, 1, 1,
-0.9021667, 0.6733093, -2.205598, 0, 0, 0, 1, 1,
-0.8960251, -0.13459, -1.553949, 0, 0, 0, 1, 1,
-0.8922475, -0.02094583, -1.228855, 0, 0, 0, 1, 1,
-0.8886824, 0.4743082, -1.422793, 0, 0, 0, 1, 1,
-0.8882315, 0.1559181, -2.880577, 0, 0, 0, 1, 1,
-0.8794349, -0.8683416, -3.820487, 1, 1, 1, 1, 1,
-0.8696325, -0.6223135, -2.859747, 1, 1, 1, 1, 1,
-0.8660365, -0.5669013, -3.576082, 1, 1, 1, 1, 1,
-0.8594093, -0.4813333, -0.7256677, 1, 1, 1, 1, 1,
-0.8569297, 0.7996477, -0.6071528, 1, 1, 1, 1, 1,
-0.855864, -0.7132336, -2.417669, 1, 1, 1, 1, 1,
-0.8551433, 0.2168474, -1.018561, 1, 1, 1, 1, 1,
-0.8548065, -1.520305, -4.742387, 1, 1, 1, 1, 1,
-0.8500738, -1.054823, -0.1424929, 1, 1, 1, 1, 1,
-0.847942, -0.04404303, -2.329446, 1, 1, 1, 1, 1,
-0.8457142, 0.2550668, -0.02614097, 1, 1, 1, 1, 1,
-0.8408048, 1.428417, 0.2991055, 1, 1, 1, 1, 1,
-0.8368923, -1.636569, -2.300004, 1, 1, 1, 1, 1,
-0.8335333, 1.132259, -0.803484, 1, 1, 1, 1, 1,
-0.8333645, -0.8584083, -2.32194, 1, 1, 1, 1, 1,
-0.8319892, 0.7818766, -1.284868, 0, 0, 1, 1, 1,
-0.8278226, -2.263003, -2.7074, 1, 0, 0, 1, 1,
-0.8220599, -2.079837, -2.781699, 1, 0, 0, 1, 1,
-0.8177747, 0.4999408, -1.767402, 1, 0, 0, 1, 1,
-0.8174292, -0.7900953, -1.639342, 1, 0, 0, 1, 1,
-0.8149476, 0.6652829, -0.2400146, 1, 0, 0, 1, 1,
-0.8138182, 0.03430747, -2.962944, 0, 0, 0, 1, 1,
-0.8105536, -0.7211348, -2.373416, 0, 0, 0, 1, 1,
-0.810411, -2.176328, -2.715694, 0, 0, 0, 1, 1,
-0.8056805, -1.176393, -3.715207, 0, 0, 0, 1, 1,
-0.8049759, 1.307685, 0.3630532, 0, 0, 0, 1, 1,
-0.8016173, -1.745309, -1.853378, 0, 0, 0, 1, 1,
-0.7977492, -1.110758, -3.136044, 0, 0, 0, 1, 1,
-0.7963293, 0.8554332, -1.616534, 1, 1, 1, 1, 1,
-0.7940271, 0.63056, -1.150937, 1, 1, 1, 1, 1,
-0.7926075, 0.4525326, -1.417015, 1, 1, 1, 1, 1,
-0.7906644, -1.524233, -3.555083, 1, 1, 1, 1, 1,
-0.7868307, -0.7775508, -2.586889, 1, 1, 1, 1, 1,
-0.7817499, 0.1827734, -2.279629, 1, 1, 1, 1, 1,
-0.781432, 2.744214, 0.105529, 1, 1, 1, 1, 1,
-0.7729719, -1.227188, -0.9864317, 1, 1, 1, 1, 1,
-0.7721135, -0.4074291, -1.269374, 1, 1, 1, 1, 1,
-0.7676294, 0.005017763, -2.110425, 1, 1, 1, 1, 1,
-0.7614905, 0.853996, 0.1586936, 1, 1, 1, 1, 1,
-0.7583786, -0.8875664, -0.9218128, 1, 1, 1, 1, 1,
-0.7574185, -0.6068161, -2.024066, 1, 1, 1, 1, 1,
-0.7527012, -0.9644027, -2.806112, 1, 1, 1, 1, 1,
-0.7491723, 1.025326, 0.6031058, 1, 1, 1, 1, 1,
-0.7491103, -0.3280578, -1.493678, 0, 0, 1, 1, 1,
-0.7467587, -0.2914067, -1.358119, 1, 0, 0, 1, 1,
-0.7401044, -0.7017075, -2.628869, 1, 0, 0, 1, 1,
-0.7395753, 1.504865, 0.147788, 1, 0, 0, 1, 1,
-0.7386162, -0.2403144, -0.6818609, 1, 0, 0, 1, 1,
-0.7380342, -0.1347271, -1.633187, 1, 0, 0, 1, 1,
-0.7334107, 0.6282808, -0.8730813, 0, 0, 0, 1, 1,
-0.7273871, 0.3439658, -0.3911152, 0, 0, 0, 1, 1,
-0.7272792, 0.7033347, -0.921032, 0, 0, 0, 1, 1,
-0.7235886, 0.3167091, -1.803872, 0, 0, 0, 1, 1,
-0.7202108, -0.8801143, -3.428806, 0, 0, 0, 1, 1,
-0.7190278, -0.1822086, -0.2954029, 0, 0, 0, 1, 1,
-0.7189863, 0.7461934, -0.1519675, 0, 0, 0, 1, 1,
-0.7173329, 0.3812032, -0.7485873, 1, 1, 1, 1, 1,
-0.7172109, 0.5029816, -0.4234866, 1, 1, 1, 1, 1,
-0.7161952, -1.14043, -2.641795, 1, 1, 1, 1, 1,
-0.7137767, -0.7997693, -2.418984, 1, 1, 1, 1, 1,
-0.7132766, 0.5850819, -2.132388, 1, 1, 1, 1, 1,
-0.7108696, -0.8688856, -3.295785, 1, 1, 1, 1, 1,
-0.7103376, 0.1373414, -2.256701, 1, 1, 1, 1, 1,
-0.7082252, 1.337466, 0.4964777, 1, 1, 1, 1, 1,
-0.7060499, -2.203655, -2.216721, 1, 1, 1, 1, 1,
-0.7010105, 1.885716, -0.659799, 1, 1, 1, 1, 1,
-0.6987981, 0.2033252, -0.956498, 1, 1, 1, 1, 1,
-0.6986557, 0.5288581, -1.857124, 1, 1, 1, 1, 1,
-0.6976086, 0.2558167, -2.178974, 1, 1, 1, 1, 1,
-0.6975296, -0.2583885, -1.222074, 1, 1, 1, 1, 1,
-0.6959248, -1.172656, -5.109201, 1, 1, 1, 1, 1,
-0.6904981, 0.208349, -0.5378883, 0, 0, 1, 1, 1,
-0.6901329, 1.246285, 0.7283288, 1, 0, 0, 1, 1,
-0.6785422, -0.8686436, -1.606114, 1, 0, 0, 1, 1,
-0.6780505, -0.5015201, -2.624774, 1, 0, 0, 1, 1,
-0.6752903, 1.011896, -0.6641216, 1, 0, 0, 1, 1,
-0.6736137, -0.8570038, -2.91355, 1, 0, 0, 1, 1,
-0.6717887, -0.8607477, -4.121892, 0, 0, 0, 1, 1,
-0.6699542, -2.36035, -3.420638, 0, 0, 0, 1, 1,
-0.6676579, -0.9788077, -0.9668111, 0, 0, 0, 1, 1,
-0.6608948, 0.8605726, 0.05509191, 0, 0, 0, 1, 1,
-0.6536452, 0.07687344, -3.668982, 0, 0, 0, 1, 1,
-0.6509324, 1.195513, -2.090622, 0, 0, 0, 1, 1,
-0.6467881, 0.7050974, 1.785733, 0, 0, 0, 1, 1,
-0.6441086, 0.5303978, 0.6500402, 1, 1, 1, 1, 1,
-0.6426134, -1.204636, -1.73189, 1, 1, 1, 1, 1,
-0.6393117, -1.221416, -2.66252, 1, 1, 1, 1, 1,
-0.6315106, -0.6033373, -2.674589, 1, 1, 1, 1, 1,
-0.6289712, 0.08698022, -1.612863, 1, 1, 1, 1, 1,
-0.623692, 1.168661, -0.6377183, 1, 1, 1, 1, 1,
-0.6186785, 0.3310615, -0.7926295, 1, 1, 1, 1, 1,
-0.6186557, 1.361696, -1.001444, 1, 1, 1, 1, 1,
-0.6184561, 1.429977, -0.1143428, 1, 1, 1, 1, 1,
-0.6179834, 0.3761284, -0.01233278, 1, 1, 1, 1, 1,
-0.6171771, -0.8344935, -3.730063, 1, 1, 1, 1, 1,
-0.6165766, 0.1225072, -0.6652717, 1, 1, 1, 1, 1,
-0.6136314, -0.2514755, -3.132122, 1, 1, 1, 1, 1,
-0.6126455, 0.4213575, -1.478293, 1, 1, 1, 1, 1,
-0.6081293, -1.045569, -2.81741, 1, 1, 1, 1, 1,
-0.608104, 1.45312, -0.4276437, 0, 0, 1, 1, 1,
-0.6069072, 0.2196496, -1.152757, 1, 0, 0, 1, 1,
-0.6017733, 1.377549, -2.007722, 1, 0, 0, 1, 1,
-0.5998614, -1.631286, -2.375125, 1, 0, 0, 1, 1,
-0.5906612, -1.069897, -4.241054, 1, 0, 0, 1, 1,
-0.5898746, 0.3179411, -2.42078, 1, 0, 0, 1, 1,
-0.5879102, -1.486093, -2.480019, 0, 0, 0, 1, 1,
-0.5869271, 0.654384, 0.1185727, 0, 0, 0, 1, 1,
-0.5812876, -0.597426, -2.543637, 0, 0, 0, 1, 1,
-0.5808955, -0.7742237, -2.426456, 0, 0, 0, 1, 1,
-0.5802758, -0.7723237, -1.589908, 0, 0, 0, 1, 1,
-0.5798059, 1.149038, -0.7289535, 0, 0, 0, 1, 1,
-0.5790927, 0.3236639, 0.5271314, 0, 0, 0, 1, 1,
-0.5776067, -0.7723628, -1.964257, 1, 1, 1, 1, 1,
-0.5769188, -0.09214326, -1.778633, 1, 1, 1, 1, 1,
-0.5757245, 2.160575, -1.043291, 1, 1, 1, 1, 1,
-0.5749414, 0.1961639, -1.600243, 1, 1, 1, 1, 1,
-0.5733657, 0.4502873, -0.3298763, 1, 1, 1, 1, 1,
-0.5724661, 1.93311, -0.2329178, 1, 1, 1, 1, 1,
-0.5712278, 2.46952, -0.3541987, 1, 1, 1, 1, 1,
-0.5705389, -0.8332633, -2.601812, 1, 1, 1, 1, 1,
-0.5693413, 0.9530162, -1.163328, 1, 1, 1, 1, 1,
-0.5685103, -0.6178041, -4.181458, 1, 1, 1, 1, 1,
-0.567592, -0.6064628, -1.721104, 1, 1, 1, 1, 1,
-0.5665551, -1.743801, -2.509877, 1, 1, 1, 1, 1,
-0.56129, 1.801103, 1.056046, 1, 1, 1, 1, 1,
-0.5604951, 0.07056411, -2.226728, 1, 1, 1, 1, 1,
-0.5594922, 1.66318, -1.199808, 1, 1, 1, 1, 1,
-0.5592704, 0.8389747, -0.3711599, 0, 0, 1, 1, 1,
-0.5561574, 0.977796, -0.2791763, 1, 0, 0, 1, 1,
-0.5443324, 0.9361163, -1.643084, 1, 0, 0, 1, 1,
-0.5406204, 1.409779, -1.82865, 1, 0, 0, 1, 1,
-0.538577, -0.7830386, -3.084667, 1, 0, 0, 1, 1,
-0.5344632, 0.7713526, -0.583717, 1, 0, 0, 1, 1,
-0.5328284, -1.030868, -1.689614, 0, 0, 0, 1, 1,
-0.5281542, -0.4162584, -0.02254593, 0, 0, 0, 1, 1,
-0.5191765, -0.00660736, -1.456901, 0, 0, 0, 1, 1,
-0.5183777, -1.040587, -3.244526, 0, 0, 0, 1, 1,
-0.5137668, 0.2579407, -1.188474, 0, 0, 0, 1, 1,
-0.5136423, 0.16203, -2.019422, 0, 0, 0, 1, 1,
-0.5088218, 0.1195134, -0.3518572, 0, 0, 0, 1, 1,
-0.505012, -2.235239, -2.839875, 1, 1, 1, 1, 1,
-0.5038943, 0.3440081, -2.018119, 1, 1, 1, 1, 1,
-0.5003158, 0.09865572, -0.2729389, 1, 1, 1, 1, 1,
-0.4995863, 0.00802472, -1.698006, 1, 1, 1, 1, 1,
-0.4946179, 1.442279, 0.2002465, 1, 1, 1, 1, 1,
-0.4897976, -0.8719221, -0.7559378, 1, 1, 1, 1, 1,
-0.4856815, -1.282838, -2.285943, 1, 1, 1, 1, 1,
-0.4819131, 0.3232001, -0.1505277, 1, 1, 1, 1, 1,
-0.4703533, -0.1727251, -2.801102, 1, 1, 1, 1, 1,
-0.467602, -0.01738196, -3.151751, 1, 1, 1, 1, 1,
-0.4655038, -1.626243, -3.50933, 1, 1, 1, 1, 1,
-0.4568052, -0.4918292, -1.930792, 1, 1, 1, 1, 1,
-0.4532087, 1.505576, -1.17358, 1, 1, 1, 1, 1,
-0.451251, 0.1917062, -1.80187, 1, 1, 1, 1, 1,
-0.4448613, 1.286767, -0.307957, 1, 1, 1, 1, 1,
-0.4421886, -2.190193, -3.903524, 0, 0, 1, 1, 1,
-0.4406194, 1.083012, -0.8086993, 1, 0, 0, 1, 1,
-0.439153, -0.1596184, -1.897466, 1, 0, 0, 1, 1,
-0.4311071, 1.566, -0.6724804, 1, 0, 0, 1, 1,
-0.4289164, 0.4150917, 0.3605551, 1, 0, 0, 1, 1,
-0.425874, -1.208674, -3.345104, 1, 0, 0, 1, 1,
-0.4245256, 0.3799635, -1.670265, 0, 0, 0, 1, 1,
-0.4226215, 1.287155, 0.4769717, 0, 0, 0, 1, 1,
-0.4212018, 1.286953, -2.189117, 0, 0, 0, 1, 1,
-0.4151649, -0.02654894, -3.297569, 0, 0, 0, 1, 1,
-0.4060062, 2.487976, 0.5820753, 0, 0, 0, 1, 1,
-0.4045947, -0.1159239, -1.985793, 0, 0, 0, 1, 1,
-0.4018469, -0.3763814, -0.03532451, 0, 0, 0, 1, 1,
-0.4015985, 0.2360286, -2.345266, 1, 1, 1, 1, 1,
-0.3994817, 1.177746, 0.1394059, 1, 1, 1, 1, 1,
-0.3989196, -1.015114, -3.792817, 1, 1, 1, 1, 1,
-0.3980694, -0.2180995, -1.386661, 1, 1, 1, 1, 1,
-0.3937812, 0.08857369, -1.282875, 1, 1, 1, 1, 1,
-0.390294, 0.1399748, -0.2904208, 1, 1, 1, 1, 1,
-0.3902257, -2.941013, -3.857913, 1, 1, 1, 1, 1,
-0.3881457, 0.1397415, -1.055392, 1, 1, 1, 1, 1,
-0.3864465, -0.3341495, -3.531022, 1, 1, 1, 1, 1,
-0.3837183, -1.53932, -3.283348, 1, 1, 1, 1, 1,
-0.3813387, 0.4300005, -0.1891118, 1, 1, 1, 1, 1,
-0.3795792, -0.9155484, -4.014153, 1, 1, 1, 1, 1,
-0.3790576, 0.7166589, 0.4657819, 1, 1, 1, 1, 1,
-0.3785165, 0.4957753, -2.605717, 1, 1, 1, 1, 1,
-0.3771786, -1.216925, -3.638343, 1, 1, 1, 1, 1,
-0.3770599, 0.6683838, 0.6994817, 0, 0, 1, 1, 1,
-0.376877, -0.8057808, -4.03583, 1, 0, 0, 1, 1,
-0.3752648, -1.399576, -2.694024, 1, 0, 0, 1, 1,
-0.3727771, -0.02025817, -0.9612036, 1, 0, 0, 1, 1,
-0.3703342, 0.5113795, -0.5553222, 1, 0, 0, 1, 1,
-0.3657418, -0.1033379, -2.665551, 1, 0, 0, 1, 1,
-0.3620439, 0.6387978, -2.626498, 0, 0, 0, 1, 1,
-0.3578481, 0.4998646, -0.2260169, 0, 0, 0, 1, 1,
-0.3463784, -1.32456, -3.102812, 0, 0, 0, 1, 1,
-0.344497, 0.3717272, -0.2002033, 0, 0, 0, 1, 1,
-0.340561, -0.460278, -2.180837, 0, 0, 0, 1, 1,
-0.339784, -0.3895258, -2.340654, 0, 0, 0, 1, 1,
-0.3391094, 1.385916, -0.9366016, 0, 0, 0, 1, 1,
-0.339043, -1.09807, -1.492772, 1, 1, 1, 1, 1,
-0.3378082, 3.309248, 0.1102695, 1, 1, 1, 1, 1,
-0.3355208, -0.2494989, -3.549916, 1, 1, 1, 1, 1,
-0.3339346, 1.152444, -0.5411137, 1, 1, 1, 1, 1,
-0.3330781, 0.4683299, -0.4806155, 1, 1, 1, 1, 1,
-0.3303704, -1.199362, -2.996119, 1, 1, 1, 1, 1,
-0.3270622, -0.05569186, -0.8059246, 1, 1, 1, 1, 1,
-0.3228028, -0.1302778, -0.7068138, 1, 1, 1, 1, 1,
-0.3211064, -0.2507579, -3.048419, 1, 1, 1, 1, 1,
-0.3210466, -0.0008512366, -2.627292, 1, 1, 1, 1, 1,
-0.3204791, 0.7727489, -0.6808594, 1, 1, 1, 1, 1,
-0.3203829, -1.958778, -2.013406, 1, 1, 1, 1, 1,
-0.318523, 0.7803239, 0.02902456, 1, 1, 1, 1, 1,
-0.3153241, -2.001962, -2.290773, 1, 1, 1, 1, 1,
-0.3140787, 1.262802, 0.01475256, 1, 1, 1, 1, 1,
-0.3113998, -0.1158806, -1.347011, 0, 0, 1, 1, 1,
-0.3084258, 0.3970106, -1.16651, 1, 0, 0, 1, 1,
-0.3063556, 0.07922497, -1.423958, 1, 0, 0, 1, 1,
-0.3038807, 0.1990452, -0.8258217, 1, 0, 0, 1, 1,
-0.3019159, -0.9397935, -2.507878, 1, 0, 0, 1, 1,
-0.3005546, -2.008404, -2.171007, 1, 0, 0, 1, 1,
-0.2918744, 0.8748211, -0.9523928, 0, 0, 0, 1, 1,
-0.2892591, -0.1139961, -2.543113, 0, 0, 0, 1, 1,
-0.288537, 0.2872666, -1.379382, 0, 0, 0, 1, 1,
-0.2870638, 0.5215665, 0.5084634, 0, 0, 0, 1, 1,
-0.286223, 1.065439, 0.9073994, 0, 0, 0, 1, 1,
-0.2862096, -0.8803629, -3.150157, 0, 0, 0, 1, 1,
-0.2839072, 1.787091, -2.928803, 0, 0, 0, 1, 1,
-0.2748152, 1.06504, 0.6114636, 1, 1, 1, 1, 1,
-0.273349, 1.530027, 0.2032563, 1, 1, 1, 1, 1,
-0.2715927, 0.4950931, 0.01645366, 1, 1, 1, 1, 1,
-0.2713176, -1.561278, -3.412281, 1, 1, 1, 1, 1,
-0.2651011, 0.7240289, 1.062172, 1, 1, 1, 1, 1,
-0.2607246, -1.160959, -2.110773, 1, 1, 1, 1, 1,
-0.260403, 0.8290647, -0.3304147, 1, 1, 1, 1, 1,
-0.2583585, -0.4903303, -2.578565, 1, 1, 1, 1, 1,
-0.2518901, 2.022012, -1.416077, 1, 1, 1, 1, 1,
-0.2481916, -2.215059, -1.919564, 1, 1, 1, 1, 1,
-0.2431862, -0.2422905, -2.050294, 1, 1, 1, 1, 1,
-0.2422865, 2.132778, -0.5913727, 1, 1, 1, 1, 1,
-0.2418803, 2.34417, -0.7032338, 1, 1, 1, 1, 1,
-0.2409363, 0.8178413, 0.9500853, 1, 1, 1, 1, 1,
-0.2400255, 0.5954508, -0.358438, 1, 1, 1, 1, 1,
-0.2364782, 0.2294213, 0.4607537, 0, 0, 1, 1, 1,
-0.2341451, -0.7351901, -4.808593, 1, 0, 0, 1, 1,
-0.2328298, -1.074213, -3.015062, 1, 0, 0, 1, 1,
-0.231215, -0.07607953, -2.024526, 1, 0, 0, 1, 1,
-0.2282281, -0.8682825, -0.3004406, 1, 0, 0, 1, 1,
-0.2272517, 1.758616, -0.450516, 1, 0, 0, 1, 1,
-0.2266717, 0.3526582, -1.670144, 0, 0, 0, 1, 1,
-0.2263321, 1.925413, -0.4530913, 0, 0, 0, 1, 1,
-0.2228679, -0.8891652, -2.744083, 0, 0, 0, 1, 1,
-0.2217931, 0.999678, 2.230524, 0, 0, 0, 1, 1,
-0.2216712, -0.1629444, -2.45096, 0, 0, 0, 1, 1,
-0.2196393, 0.9850859, -0.5966223, 0, 0, 0, 1, 1,
-0.2140727, 0.2204914, -0.1526884, 0, 0, 0, 1, 1,
-0.210693, -2.554947, -3.95651, 1, 1, 1, 1, 1,
-0.2104403, -0.5193111, -1.505445, 1, 1, 1, 1, 1,
-0.2075406, -0.1043774, -2.492935, 1, 1, 1, 1, 1,
-0.2066521, 0.6185401, -0.6174798, 1, 1, 1, 1, 1,
-0.2057103, 0.3169922, -1.706761, 1, 1, 1, 1, 1,
-0.2051769, 0.9564682, -1.851665, 1, 1, 1, 1, 1,
-0.2042291, -1.403009, -4.202443, 1, 1, 1, 1, 1,
-0.1999337, -0.3881902, -2.175395, 1, 1, 1, 1, 1,
-0.1959537, -1.314319, -2.473407, 1, 1, 1, 1, 1,
-0.1958424, -1.494427, -2.308408, 1, 1, 1, 1, 1,
-0.1923831, -0.4988002, -2.45647, 1, 1, 1, 1, 1,
-0.1908083, -0.4595261, -3.199284, 1, 1, 1, 1, 1,
-0.1826575, 1.723398, 1.413794, 1, 1, 1, 1, 1,
-0.1810988, -0.712783, -3.314715, 1, 1, 1, 1, 1,
-0.179705, -0.7764677, -2.808425, 1, 1, 1, 1, 1,
-0.1768705, 0.1698319, -0.6641328, 0, 0, 1, 1, 1,
-0.1760353, -0.7121188, -3.281901, 1, 0, 0, 1, 1,
-0.1714295, -1.949179, -2.932533, 1, 0, 0, 1, 1,
-0.1706991, 0.2919685, -0.5319964, 1, 0, 0, 1, 1,
-0.1626479, -1.897259, -2.237187, 1, 0, 0, 1, 1,
-0.1623389, -1.341741, -2.850779, 1, 0, 0, 1, 1,
-0.1535882, 0.2451506, 1.604056, 0, 0, 0, 1, 1,
-0.1528874, 0.431927, -0.2591562, 0, 0, 0, 1, 1,
-0.1478376, 0.07413411, 0.9754512, 0, 0, 0, 1, 1,
-0.1450998, 0.4371887, 1.273105, 0, 0, 0, 1, 1,
-0.1403317, 1.007667, 0.598346, 0, 0, 0, 1, 1,
-0.1350412, -1.136835, -3.80114, 0, 0, 0, 1, 1,
-0.1320135, 1.123226, -2.080815, 0, 0, 0, 1, 1,
-0.1315377, -1.066499, -2.595646, 1, 1, 1, 1, 1,
-0.128177, 0.2040311, -1.214843, 1, 1, 1, 1, 1,
-0.1199459, -1.256899, -3.955078, 1, 1, 1, 1, 1,
-0.1191887, -0.7439639, -1.342785, 1, 1, 1, 1, 1,
-0.1145934, 0.3148795, 0.6930816, 1, 1, 1, 1, 1,
-0.114192, 1.11146, -1.370586, 1, 1, 1, 1, 1,
-0.1123414, 0.4836312, 0.8741218, 1, 1, 1, 1, 1,
-0.1119741, -1.222, -2.551992, 1, 1, 1, 1, 1,
-0.110146, 0.0001012981, -1.655123, 1, 1, 1, 1, 1,
-0.1082141, 1.694813, -1.919592, 1, 1, 1, 1, 1,
-0.09735687, -1.931562, -3.649444, 1, 1, 1, 1, 1,
-0.09499797, -0.08526896, -3.154984, 1, 1, 1, 1, 1,
-0.09272072, 1.624936, -0.1221586, 1, 1, 1, 1, 1,
-0.09042417, -1.415004, -2.092146, 1, 1, 1, 1, 1,
-0.08849457, -1.592416, -4.348078, 1, 1, 1, 1, 1,
-0.08298522, -1.444668, -2.32777, 0, 0, 1, 1, 1,
-0.0807562, 0.7508709, 1.916078, 1, 0, 0, 1, 1,
-0.07943695, -2.077723, -4.343357, 1, 0, 0, 1, 1,
-0.07746969, -1.643687, -3.738345, 1, 0, 0, 1, 1,
-0.07655632, 1.291489, 1.057343, 1, 0, 0, 1, 1,
-0.07540221, -0.8169168, -2.458236, 1, 0, 0, 1, 1,
-0.07444061, -0.3822488, -5.112552, 0, 0, 0, 1, 1,
-0.07291702, 1.547938, 0.9833432, 0, 0, 0, 1, 1,
-0.07268213, 0.2237634, -0.7670117, 0, 0, 0, 1, 1,
-0.07171806, 1.295269, -1.085711, 0, 0, 0, 1, 1,
-0.07106605, 0.4090219, 0.5342231, 0, 0, 0, 1, 1,
-0.06719711, -0.3801349, -3.745829, 0, 0, 0, 1, 1,
-0.06701799, 0.7072606, 0.5562204, 0, 0, 0, 1, 1,
-0.06695425, -0.1657752, -4.156327, 1, 1, 1, 1, 1,
-0.06635629, 0.4258909, -0.5582357, 1, 1, 1, 1, 1,
-0.06303618, -0.1471507, -3.066113, 1, 1, 1, 1, 1,
-0.06171101, 0.7689307, -0.5770331, 1, 1, 1, 1, 1,
-0.06078508, -0.9345928, -3.723937, 1, 1, 1, 1, 1,
-0.05855983, 1.081606, 0.1047301, 1, 1, 1, 1, 1,
-0.05779528, 0.9983391, -0.5477211, 1, 1, 1, 1, 1,
-0.05295394, 1.306854, 0.360633, 1, 1, 1, 1, 1,
-0.05085983, -0.9073822, -3.012381, 1, 1, 1, 1, 1,
-0.04780922, -0.6421741, -2.568004, 1, 1, 1, 1, 1,
-0.04597687, -0.4351255, -4.319747, 1, 1, 1, 1, 1,
-0.03531582, -0.1479922, -2.471447, 1, 1, 1, 1, 1,
-0.03088837, 1.901252, 1.199048, 1, 1, 1, 1, 1,
-0.02586945, -0.8033811, -4.571182, 1, 1, 1, 1, 1,
-0.02532691, -0.791711, -3.648162, 1, 1, 1, 1, 1,
-0.02274066, -0.7245522, -1.528888, 0, 0, 1, 1, 1,
-0.0197184, -1.413325, -1.66528, 1, 0, 0, 1, 1,
-0.01356311, -0.5372993, -3.706643, 1, 0, 0, 1, 1,
-0.0135416, 0.3275239, -0.8238678, 1, 0, 0, 1, 1,
-0.01259086, -0.0358124, -1.958836, 1, 0, 0, 1, 1,
-0.01118141, -0.6864877, -2.58191, 1, 0, 0, 1, 1,
-0.005480542, -2.205645, -2.613671, 0, 0, 0, 1, 1,
-0.005455935, 0.9839455, 0.288865, 0, 0, 0, 1, 1,
-0.002201207, 0.9419419, 0.3838488, 0, 0, 0, 1, 1,
-0.001428809, -1.31399, -2.940825, 0, 0, 0, 1, 1,
0.001434458, 0.5205728, -0.7373015, 0, 0, 0, 1, 1,
0.001659344, 1.344476, 1.015347, 0, 0, 0, 1, 1,
0.01045174, 0.5390067, 1.007824, 0, 0, 0, 1, 1,
0.01451089, 0.2580484, 0.9333852, 1, 1, 1, 1, 1,
0.01996318, -0.3082306, 2.93003, 1, 1, 1, 1, 1,
0.02303363, 1.190747, 1.185606, 1, 1, 1, 1, 1,
0.02472504, -0.6487907, 4.091557, 1, 1, 1, 1, 1,
0.02839798, 2.089042, -0.7168187, 1, 1, 1, 1, 1,
0.02877696, 0.2961655, 0.7433394, 1, 1, 1, 1, 1,
0.03116627, -0.08785691, 2.539839, 1, 1, 1, 1, 1,
0.03136366, 1.543227, -1.175261, 1, 1, 1, 1, 1,
0.03159002, 0.07429764, 1.688468, 1, 1, 1, 1, 1,
0.03231652, 1.627703, 0.2392166, 1, 1, 1, 1, 1,
0.03590858, -0.7272467, 3.052096, 1, 1, 1, 1, 1,
0.03726917, 0.1550532, -0.3363992, 1, 1, 1, 1, 1,
0.03741229, -1.216549, 0.9882098, 1, 1, 1, 1, 1,
0.03971814, 1.884732, -0.9612026, 1, 1, 1, 1, 1,
0.04625474, -0.0120281, 2.621876, 1, 1, 1, 1, 1,
0.04711833, -2.041432, 2.494704, 0, 0, 1, 1, 1,
0.05227016, -0.3659195, 4.050464, 1, 0, 0, 1, 1,
0.05378453, 0.2418206, -1.744579, 1, 0, 0, 1, 1,
0.05772986, 1.564122, 0.9546912, 1, 0, 0, 1, 1,
0.05869015, -0.611458, 3.864052, 1, 0, 0, 1, 1,
0.05925953, -1.509525, 4.067695, 1, 0, 0, 1, 1,
0.06288446, 0.01677703, 1.62115, 0, 0, 0, 1, 1,
0.06461051, 0.1224534, -0.05046991, 0, 0, 0, 1, 1,
0.06573752, 1.136748, -0.9192365, 0, 0, 0, 1, 1,
0.06973295, -0.4356597, 2.442612, 0, 0, 0, 1, 1,
0.07442345, 1.317169, 0.7555294, 0, 0, 0, 1, 1,
0.07589767, -0.2334744, 4.262961, 0, 0, 0, 1, 1,
0.08238668, 0.6209368, 1.637099, 0, 0, 0, 1, 1,
0.082749, 0.3819327, 0.425752, 1, 1, 1, 1, 1,
0.08688801, -0.260103, 1.401414, 1, 1, 1, 1, 1,
0.09144349, -0.2894537, 2.768389, 1, 1, 1, 1, 1,
0.09210198, -0.0008228435, 2.83925, 1, 1, 1, 1, 1,
0.09412504, 0.1693542, 0.5691233, 1, 1, 1, 1, 1,
0.09439933, 2.758343, -0.5581472, 1, 1, 1, 1, 1,
0.09624086, -0.5280586, 3.455433, 1, 1, 1, 1, 1,
0.0962521, -0.3142611, 4.39896, 1, 1, 1, 1, 1,
0.09845715, 0.5275511, -0.3234674, 1, 1, 1, 1, 1,
0.1020853, 1.03199, 0.2609664, 1, 1, 1, 1, 1,
0.1033027, -1.718078, 3.111048, 1, 1, 1, 1, 1,
0.1044262, -2.817899, 2.959271, 1, 1, 1, 1, 1,
0.1103692, 0.9512721, 0.7996217, 1, 1, 1, 1, 1,
0.1127055, 0.252042, 0.5221147, 1, 1, 1, 1, 1,
0.1177772, -0.3990425, 1.766933, 1, 1, 1, 1, 1,
0.1191587, 1.731163, -0.9962589, 0, 0, 1, 1, 1,
0.120617, 0.9318383, 0.1709872, 1, 0, 0, 1, 1,
0.1230674, -2.201178, 3.508241, 1, 0, 0, 1, 1,
0.1232535, 1.746562, 0.03696645, 1, 0, 0, 1, 1,
0.1238436, 1.186485, 0.2689831, 1, 0, 0, 1, 1,
0.1250186, -0.9568565, 3.272394, 1, 0, 0, 1, 1,
0.130122, -0.2430927, 2.729968, 0, 0, 0, 1, 1,
0.1306422, 1.111796, 1.117457, 0, 0, 0, 1, 1,
0.1320592, 1.856684, -1.247666, 0, 0, 0, 1, 1,
0.1346823, 1.786224, 0.3030404, 0, 0, 0, 1, 1,
0.1371142, 0.1155784, 1.022547, 0, 0, 0, 1, 1,
0.1411478, -1.12838, 2.797135, 0, 0, 0, 1, 1,
0.1448455, 0.3131708, -0.254047, 0, 0, 0, 1, 1,
0.1450605, -0.5504045, 3.956099, 1, 1, 1, 1, 1,
0.1498672, -0.1779506, 1.032307, 1, 1, 1, 1, 1,
0.1502529, -2.012626, 1.364839, 1, 1, 1, 1, 1,
0.1516227, 0.3526648, -1.421746, 1, 1, 1, 1, 1,
0.1529398, -2.724557, 2.652143, 1, 1, 1, 1, 1,
0.1549667, 0.9913231, -0.6122038, 1, 1, 1, 1, 1,
0.1556545, -0.382839, 2.9478, 1, 1, 1, 1, 1,
0.1580628, -0.08664542, 3.05646, 1, 1, 1, 1, 1,
0.1609775, 0.462913, 0.8617611, 1, 1, 1, 1, 1,
0.161976, 0.6409035, 0.4126703, 1, 1, 1, 1, 1,
0.1650336, 0.1487082, -1.261991, 1, 1, 1, 1, 1,
0.16656, -0.2238266, 4.54096, 1, 1, 1, 1, 1,
0.1672634, 0.5925702, 0.1972864, 1, 1, 1, 1, 1,
0.169821, 0.09971473, 0.6489273, 1, 1, 1, 1, 1,
0.1698588, 0.2291401, 0.4713655, 1, 1, 1, 1, 1,
0.1719155, -0.8757356, 0.5358866, 0, 0, 1, 1, 1,
0.173253, 0.5053955, -1.356754, 1, 0, 0, 1, 1,
0.1818862, -0.08249823, 2.593838, 1, 0, 0, 1, 1,
0.182355, 1.322026, -0.6508657, 1, 0, 0, 1, 1,
0.1825169, 0.5830128, 0.9757061, 1, 0, 0, 1, 1,
0.1833505, -1.219417, 4.084994, 1, 0, 0, 1, 1,
0.1867077, 0.8527092, 2.181719, 0, 0, 0, 1, 1,
0.1889031, -0.3484865, 2.388746, 0, 0, 0, 1, 1,
0.188929, -0.6357697, 2.522321, 0, 0, 0, 1, 1,
0.1899301, 0.02909724, 0.5099878, 0, 0, 0, 1, 1,
0.1913713, -0.5707123, 0.8252788, 0, 0, 0, 1, 1,
0.1922225, -0.39252, 2.70412, 0, 0, 0, 1, 1,
0.1924647, 0.1808432, 0.4175126, 0, 0, 0, 1, 1,
0.1926214, 1.397855, 0.8719102, 1, 1, 1, 1, 1,
0.19338, -0.09435755, 1.738514, 1, 1, 1, 1, 1,
0.1950548, -0.1572895, 2.543231, 1, 1, 1, 1, 1,
0.1984885, 0.3153762, 0.3758482, 1, 1, 1, 1, 1,
0.2030919, -0.7736797, 5.335769, 1, 1, 1, 1, 1,
0.2131821, 0.7055424, 1.669345, 1, 1, 1, 1, 1,
0.2206766, 0.1112809, 0.09506844, 1, 1, 1, 1, 1,
0.2222471, -0.02929011, 2.174299, 1, 1, 1, 1, 1,
0.2235823, 0.9922437, -0.2423417, 1, 1, 1, 1, 1,
0.2261893, 0.1729639, 1.451014, 1, 1, 1, 1, 1,
0.2268197, -0.260819, 3.672539, 1, 1, 1, 1, 1,
0.2301609, 0.1713431, 0.1610487, 1, 1, 1, 1, 1,
0.2303466, 1.427894, 0.3701772, 1, 1, 1, 1, 1,
0.2358889, 1.050835, -0.9120392, 1, 1, 1, 1, 1,
0.236829, 1.461433, -1.082557, 1, 1, 1, 1, 1,
0.2404436, -0.3238725, 3.023557, 0, 0, 1, 1, 1,
0.240555, -0.1280385, 2.389199, 1, 0, 0, 1, 1,
0.249794, 0.7764564, -0.2108123, 1, 0, 0, 1, 1,
0.2546466, -1.284809, 2.151803, 1, 0, 0, 1, 1,
0.2559136, 0.3710784, 2.172448, 1, 0, 0, 1, 1,
0.2560035, 0.5764405, 1.077777, 1, 0, 0, 1, 1,
0.2569416, -2.25757, 3.830975, 0, 0, 0, 1, 1,
0.2606772, -1.265821, 2.513119, 0, 0, 0, 1, 1,
0.2628401, -0.2188284, 1.21834, 0, 0, 0, 1, 1,
0.2629237, -0.2949517, 0.235309, 0, 0, 0, 1, 1,
0.2655344, 0.303192, 1.157953, 0, 0, 0, 1, 1,
0.2657177, 1.213979, 1.156717, 0, 0, 0, 1, 1,
0.2673429, -0.7787544, 3.149981, 0, 0, 0, 1, 1,
0.2695977, 0.2984281, 1.212957, 1, 1, 1, 1, 1,
0.2715812, -0.009449941, 0.9915302, 1, 1, 1, 1, 1,
0.2833564, 1.177203, 1.583407, 1, 1, 1, 1, 1,
0.2857937, -0.02049105, 2.057966, 1, 1, 1, 1, 1,
0.2859357, 1.155881, -0.8839482, 1, 1, 1, 1, 1,
0.2945554, 0.5746759, 1.171629, 1, 1, 1, 1, 1,
0.3013449, -1.237409, 3.622021, 1, 1, 1, 1, 1,
0.3033868, 0.7830821, 0.6416504, 1, 1, 1, 1, 1,
0.3047138, -0.3664624, 2.565712, 1, 1, 1, 1, 1,
0.3050117, 0.5053271, 0.221911, 1, 1, 1, 1, 1,
0.3078026, 0.5743679, 1.012054, 1, 1, 1, 1, 1,
0.3083081, -0.3042513, 0.7207081, 1, 1, 1, 1, 1,
0.3121498, 0.0480576, 1.264323, 1, 1, 1, 1, 1,
0.3309687, -0.3918775, 1.725828, 1, 1, 1, 1, 1,
0.333129, -0.364995, 2.068874, 1, 1, 1, 1, 1,
0.3334632, 0.9182175, 0.120154, 0, 0, 1, 1, 1,
0.3340634, -1.063902, 2.880055, 1, 0, 0, 1, 1,
0.3354801, 1.639258, 1.885693, 1, 0, 0, 1, 1,
0.33559, 0.448975, 1.785183, 1, 0, 0, 1, 1,
0.3374003, 1.89667, -0.6983286, 1, 0, 0, 1, 1,
0.3418988, -0.7699158, 3.257266, 1, 0, 0, 1, 1,
0.3462484, -0.6833019, 2.437356, 0, 0, 0, 1, 1,
0.3480297, 0.911207, 1.636462, 0, 0, 0, 1, 1,
0.352643, 1.304853, 0.6647938, 0, 0, 0, 1, 1,
0.3533557, -0.6576163, 2.823792, 0, 0, 0, 1, 1,
0.355737, 1.278377, 0.1074787, 0, 0, 0, 1, 1,
0.3592079, -0.1409702, 0.4722584, 0, 0, 0, 1, 1,
0.3614075, 0.736648, 0.3156782, 0, 0, 0, 1, 1,
0.369736, -1.985808, 4.109513, 1, 1, 1, 1, 1,
0.3704432, 0.738123, 0.4903728, 1, 1, 1, 1, 1,
0.3726423, 0.6507164, 2.359737, 1, 1, 1, 1, 1,
0.375193, -0.02858933, -0.5864317, 1, 1, 1, 1, 1,
0.3783502, 1.598867, 0.7594754, 1, 1, 1, 1, 1,
0.3833218, 1.749305, -0.6392109, 1, 1, 1, 1, 1,
0.3855815, -0.3175702, 2.897151, 1, 1, 1, 1, 1,
0.3886596, 0.5144659, 0.7105207, 1, 1, 1, 1, 1,
0.3887942, -0.05090699, 1.115807, 1, 1, 1, 1, 1,
0.3906273, -1.021444, 2.32561, 1, 1, 1, 1, 1,
0.3991012, -0.03048598, 1.132363, 1, 1, 1, 1, 1,
0.4009469, -1.746738, 1.687953, 1, 1, 1, 1, 1,
0.4011687, 3.065644, 0.4225329, 1, 1, 1, 1, 1,
0.4046186, -1.165167, 3.141146, 1, 1, 1, 1, 1,
0.4069946, 0.2723533, 0.2978748, 1, 1, 1, 1, 1,
0.4125542, 1.353686, -0.300361, 0, 0, 1, 1, 1,
0.4198724, 0.002506436, 0.1357376, 1, 0, 0, 1, 1,
0.4206225, 0.08368202, 0.6076488, 1, 0, 0, 1, 1,
0.4209644, -1.508422, 1.435114, 1, 0, 0, 1, 1,
0.4253041, -0.5413816, 3.258153, 1, 0, 0, 1, 1,
0.4271336, 0.8387381, 1.779989, 1, 0, 0, 1, 1,
0.4293744, 0.4263942, 1.609719, 0, 0, 0, 1, 1,
0.4308002, -1.839157, 4.053739, 0, 0, 0, 1, 1,
0.4312525, 1.084985, -0.1929826, 0, 0, 0, 1, 1,
0.4314583, 0.6985507, 1.434221, 0, 0, 0, 1, 1,
0.4314698, -0.07669202, 2.772975, 0, 0, 0, 1, 1,
0.4320852, -0.1033726, 1.535897, 0, 0, 0, 1, 1,
0.437791, 0.5771311, 0.8835454, 0, 0, 0, 1, 1,
0.4385614, 0.6324991, 0.1070331, 1, 1, 1, 1, 1,
0.4395416, 0.2491261, 1.882074, 1, 1, 1, 1, 1,
0.440911, 1.036939, -1.48192, 1, 1, 1, 1, 1,
0.4419873, -0.8473458, 4.289981, 1, 1, 1, 1, 1,
0.4444318, 0.05721523, 1.242744, 1, 1, 1, 1, 1,
0.4560523, 0.4772681, 0.919883, 1, 1, 1, 1, 1,
0.4564508, -1.606014, 2.915125, 1, 1, 1, 1, 1,
0.4656579, 0.103115, 0.6987579, 1, 1, 1, 1, 1,
0.4669487, -0.03684002, 1.271477, 1, 1, 1, 1, 1,
0.4713241, 2.614938, -0.5141155, 1, 1, 1, 1, 1,
0.4716656, -0.4390027, 1.89514, 1, 1, 1, 1, 1,
0.473151, 0.03700863, 0.5349329, 1, 1, 1, 1, 1,
0.474746, -0.4509422, 1.902287, 1, 1, 1, 1, 1,
0.4795654, -0.1262051, 0.4895262, 1, 1, 1, 1, 1,
0.4813034, -0.6821187, 1.620182, 1, 1, 1, 1, 1,
0.4830585, -1.807138, 2.93612, 0, 0, 1, 1, 1,
0.4838575, -0.03323566, 0.8310474, 1, 0, 0, 1, 1,
0.4905707, 0.09013925, 3.418591, 1, 0, 0, 1, 1,
0.4926519, 1.014491, -0.1388145, 1, 0, 0, 1, 1,
0.4927962, -0.3702525, 2.609576, 1, 0, 0, 1, 1,
0.4940014, -0.8859981, 4.373256, 1, 0, 0, 1, 1,
0.4951655, 1.467944, 0.08124082, 0, 0, 0, 1, 1,
0.4962498, 1.061228, 1.064222, 0, 0, 0, 1, 1,
0.4979994, -0.8517907, 2.465461, 0, 0, 0, 1, 1,
0.4982352, 0.9439141, -0.05868183, 0, 0, 0, 1, 1,
0.5003678, -0.9846774, 4.505779, 0, 0, 0, 1, 1,
0.5017464, 0.3174849, 2.313107, 0, 0, 0, 1, 1,
0.5034148, -0.4826093, 1.863676, 0, 0, 0, 1, 1,
0.5048947, 1.311227, 1.612158, 1, 1, 1, 1, 1,
0.505074, -1.05249, 1.107424, 1, 1, 1, 1, 1,
0.5051905, -1.114903, 2.697619, 1, 1, 1, 1, 1,
0.5073991, -0.002727771, 1.798637, 1, 1, 1, 1, 1,
0.5091387, -0.3033772, 1.262215, 1, 1, 1, 1, 1,
0.5118798, -0.1216962, 2.179512, 1, 1, 1, 1, 1,
0.5123523, 1.674808, 1.001028, 1, 1, 1, 1, 1,
0.5169361, -0.3755035, 3.485512, 1, 1, 1, 1, 1,
0.5186189, 0.7797434, 0.8593144, 1, 1, 1, 1, 1,
0.5243248, -0.05787625, 1.409157, 1, 1, 1, 1, 1,
0.52527, 1.116266, 0.7449463, 1, 1, 1, 1, 1,
0.5268081, -0.5441432, 3.103643, 1, 1, 1, 1, 1,
0.5279452, 1.504455, 0.4414128, 1, 1, 1, 1, 1,
0.5297044, -1.742028, 2.933163, 1, 1, 1, 1, 1,
0.536791, -1.190807, 3.877381, 1, 1, 1, 1, 1,
0.5434389, 1.09509, 1.907118, 0, 0, 1, 1, 1,
0.5434992, -0.4438782, 0.6949787, 1, 0, 0, 1, 1,
0.5499873, 0.3775377, 1.807983, 1, 0, 0, 1, 1,
0.5518052, -0.6171402, 0.8312613, 1, 0, 0, 1, 1,
0.5522284, 1.429291, -0.4320398, 1, 0, 0, 1, 1,
0.5536534, -1.229007, 3.822289, 1, 0, 0, 1, 1,
0.5585809, 0.7790378, 0.7935374, 0, 0, 0, 1, 1,
0.560431, -0.4253108, 0.9676893, 0, 0, 0, 1, 1,
0.5623282, 0.3334419, 1.991998, 0, 0, 0, 1, 1,
0.5651755, 0.4160435, 1.050475, 0, 0, 0, 1, 1,
0.5652364, 1.354798, 0.6491003, 0, 0, 0, 1, 1,
0.5652626, -1.186729, 2.60649, 0, 0, 0, 1, 1,
0.5712559, 1.286669, 0.08999678, 0, 0, 0, 1, 1,
0.5726894, -1.260989, 3.523905, 1, 1, 1, 1, 1,
0.5825248, -0.4528308, 0.1235924, 1, 1, 1, 1, 1,
0.5833807, -0.623223, 1.626959, 1, 1, 1, 1, 1,
0.58738, -0.9603974, 2.413461, 1, 1, 1, 1, 1,
0.5874295, 1.045167, 0.2533483, 1, 1, 1, 1, 1,
0.5900545, 0.03040247, 2.166411, 1, 1, 1, 1, 1,
0.5905348, -1.123727, 2.604738, 1, 1, 1, 1, 1,
0.5916473, 1.333763, 1.116875, 1, 1, 1, 1, 1,
0.5921624, 1.12412, 1.049774, 1, 1, 1, 1, 1,
0.5940798, -0.1649493, 2.821903, 1, 1, 1, 1, 1,
0.595466, 2.043362, -0.7426586, 1, 1, 1, 1, 1,
0.5978726, -2.537402, 3.498643, 1, 1, 1, 1, 1,
0.6036777, -0.7244724, 4.779944, 1, 1, 1, 1, 1,
0.604294, 0.3145695, 1.398706, 1, 1, 1, 1, 1,
0.6066805, 0.2353146, 0.1009855, 1, 1, 1, 1, 1,
0.6091841, -0.1313256, 3.001488, 0, 0, 1, 1, 1,
0.6130115, -0.2284222, 2.76476, 1, 0, 0, 1, 1,
0.6165277, 1.449878, -0.3600442, 1, 0, 0, 1, 1,
0.625809, 0.1419628, 2.072026, 1, 0, 0, 1, 1,
0.6312631, 0.001110844, 1.931505, 1, 0, 0, 1, 1,
0.6387779, 0.3529425, 1.609921, 1, 0, 0, 1, 1,
0.639504, -0.327886, 1.86056, 0, 0, 0, 1, 1,
0.6400356, 0.1187764, 2.383182, 0, 0, 0, 1, 1,
0.6428007, -0.2242943, 0.9855711, 0, 0, 0, 1, 1,
0.6477545, -0.09119467, 2.135195, 0, 0, 0, 1, 1,
0.6503078, 1.075475, 0.8554922, 0, 0, 0, 1, 1,
0.6525277, 0.8660642, 0.5185441, 0, 0, 0, 1, 1,
0.6549773, 1.749368, 1.963776, 0, 0, 0, 1, 1,
0.6589066, -0.4736044, 2.254865, 1, 1, 1, 1, 1,
0.661692, 0.2719994, 1.178189, 1, 1, 1, 1, 1,
0.6635317, -1.116173, 2.170973, 1, 1, 1, 1, 1,
0.6676382, -1.341268, 5.290451, 1, 1, 1, 1, 1,
0.6695652, -0.1151558, 1.915137, 1, 1, 1, 1, 1,
0.67231, -0.4142844, 3.601501, 1, 1, 1, 1, 1,
0.6742771, 0.8495881, 2.144786, 1, 1, 1, 1, 1,
0.6746382, 1.677851, 2.218387, 1, 1, 1, 1, 1,
0.6757122, 0.3055174, 0.1007525, 1, 1, 1, 1, 1,
0.6849708, -0.02992398, 1.821645, 1, 1, 1, 1, 1,
0.6919794, 0.6602644, 1.036914, 1, 1, 1, 1, 1,
0.6929852, 0.175403, 1.199952, 1, 1, 1, 1, 1,
0.6998093, 0.9412038, 0.3056656, 1, 1, 1, 1, 1,
0.7078582, 1.962199, 0.009682547, 1, 1, 1, 1, 1,
0.7102379, 0.2617671, 1.627845, 1, 1, 1, 1, 1,
0.7102434, 1.06642, 1.549386, 0, 0, 1, 1, 1,
0.7107165, -1.545743, 2.526121, 1, 0, 0, 1, 1,
0.7132234, 0.1810272, 1.767458, 1, 0, 0, 1, 1,
0.7143775, -0.7867092, 1.278402, 1, 0, 0, 1, 1,
0.7146499, -0.5707942, 3.07674, 1, 0, 0, 1, 1,
0.7208707, 0.04598512, 0.4850053, 1, 0, 0, 1, 1,
0.7224504, -0.2683939, -0.2140814, 0, 0, 0, 1, 1,
0.7239718, 0.8398589, -0.5622808, 0, 0, 0, 1, 1,
0.7346511, -0.5599992, 4.105428, 0, 0, 0, 1, 1,
0.7401623, 0.1436689, 1.149304, 0, 0, 0, 1, 1,
0.7410946, 1.659823, 0.9924902, 0, 0, 0, 1, 1,
0.7453429, -0.7926667, 3.429742, 0, 0, 0, 1, 1,
0.7499613, -0.3172873, 1.147584, 0, 0, 0, 1, 1,
0.7520434, 0.8168393, 0.2862552, 1, 1, 1, 1, 1,
0.7540961, 0.9836054, -0.1824119, 1, 1, 1, 1, 1,
0.7545751, -1.556898, 0.6164302, 1, 1, 1, 1, 1,
0.7554014, 0.3867597, 3.313247, 1, 1, 1, 1, 1,
0.76174, 0.1724655, 0.3780405, 1, 1, 1, 1, 1,
0.7667423, 1.996585, 0.6621693, 1, 1, 1, 1, 1,
0.767957, -0.8218902, 3.400867, 1, 1, 1, 1, 1,
0.7775825, -0.2035396, 3.946357, 1, 1, 1, 1, 1,
0.7792345, 0.5798413, 2.748319, 1, 1, 1, 1, 1,
0.7804561, -0.9302633, 2.195322, 1, 1, 1, 1, 1,
0.7807033, -1.265787, 3.603336, 1, 1, 1, 1, 1,
0.7815068, -0.8255361, 2.246965, 1, 1, 1, 1, 1,
0.7828239, -0.3084899, 2.131496, 1, 1, 1, 1, 1,
0.7849266, -0.9769843, 2.592632, 1, 1, 1, 1, 1,
0.7905664, -0.47709, 1.073079, 1, 1, 1, 1, 1,
0.7985476, 0.002836705, 2.523851, 0, 0, 1, 1, 1,
0.8044551, -1.832288, 2.85962, 1, 0, 0, 1, 1,
0.809087, -0.8222124, 3.480655, 1, 0, 0, 1, 1,
0.8114154, 0.08336446, 1.643214, 1, 0, 0, 1, 1,
0.8137375, -0.03318911, 1.414601, 1, 0, 0, 1, 1,
0.8144935, -0.05087779, 1.191265, 1, 0, 0, 1, 1,
0.820566, 0.2276729, 0.371419, 0, 0, 0, 1, 1,
0.8223332, -0.6068293, 3.077464, 0, 0, 0, 1, 1,
0.8329273, -1.176558, 2.20667, 0, 0, 0, 1, 1,
0.8337817, -0.2214101, 3.093694, 0, 0, 0, 1, 1,
0.8342271, -0.1302714, 3.320889, 0, 0, 0, 1, 1,
0.8497761, -0.5719119, 1.7925, 0, 0, 0, 1, 1,
0.8566161, -1.081337, 2.509793, 0, 0, 0, 1, 1,
0.8605842, 0.3474395, 0.741298, 1, 1, 1, 1, 1,
0.8676222, 1.332038, 0.1853353, 1, 1, 1, 1, 1,
0.8684743, -0.7510984, 2.993708, 1, 1, 1, 1, 1,
0.8686433, -0.05660945, 2.259458, 1, 1, 1, 1, 1,
0.8691712, 1.939083, 1.672824, 1, 1, 1, 1, 1,
0.8718892, -0.8647687, 1.663296, 1, 1, 1, 1, 1,
0.8796826, 1.346343, 0.1107598, 1, 1, 1, 1, 1,
0.8797882, -0.495926, 1.432891, 1, 1, 1, 1, 1,
0.8816069, -0.1927284, 1.550071, 1, 1, 1, 1, 1,
0.8824316, 0.5727459, 0.6228788, 1, 1, 1, 1, 1,
0.8849376, -0.7225505, 3.081893, 1, 1, 1, 1, 1,
0.8884085, -1.161212, 2.482704, 1, 1, 1, 1, 1,
0.8888029, -2.270197, 3.092598, 1, 1, 1, 1, 1,
0.8963774, -0.2663494, 2.888659, 1, 1, 1, 1, 1,
0.9054557, -0.06547191, 0.3114269, 1, 1, 1, 1, 1,
0.9090829, -0.3774223, -0.6701808, 0, 0, 1, 1, 1,
0.914526, -0.5409878, 1.951439, 1, 0, 0, 1, 1,
0.9171088, 1.518183, 1.998384, 1, 0, 0, 1, 1,
0.9178108, -0.2453376, 0.8749849, 1, 0, 0, 1, 1,
0.9206493, 0.1365328, 1.542107, 1, 0, 0, 1, 1,
0.931418, -0.7924705, 1.336999, 1, 0, 0, 1, 1,
0.9366199, -0.1711659, 0.8200285, 0, 0, 0, 1, 1,
0.9420751, 0.9762748, -0.1130064, 0, 0, 0, 1, 1,
0.9441653, -1.100443, 2.080072, 0, 0, 0, 1, 1,
0.9457455, 0.5636415, 1.312439, 0, 0, 0, 1, 1,
0.9518747, 0.8771145, 1.135623, 0, 0, 0, 1, 1,
0.9527549, -1.754817, 4.521245, 0, 0, 0, 1, 1,
0.9536282, -0.4425746, 2.382876, 0, 0, 0, 1, 1,
0.9586285, 0.2306322, 2.032756, 1, 1, 1, 1, 1,
0.9678053, 1.461265, 0.2694234, 1, 1, 1, 1, 1,
0.9736138, -1.205612, 1.695114, 1, 1, 1, 1, 1,
0.978977, -0.05118536, 0.8462268, 1, 1, 1, 1, 1,
0.9795308, -0.5197135, 2.536754, 1, 1, 1, 1, 1,
0.9825069, 0.4627629, 1.819921, 1, 1, 1, 1, 1,
0.9923651, -0.9444117, 3.108971, 1, 1, 1, 1, 1,
0.9928532, -0.1536597, 1.837568, 1, 1, 1, 1, 1,
1.002238, -2.215212, 3.015246, 1, 1, 1, 1, 1,
1.006673, 1.087643, 0.7764522, 1, 1, 1, 1, 1,
1.011475, 1.526209, 1.358132, 1, 1, 1, 1, 1,
1.015594, 1.077492, 0.4236142, 1, 1, 1, 1, 1,
1.026456, -1.331486, 1.51466, 1, 1, 1, 1, 1,
1.026652, -0.0485804, 2.953789, 1, 1, 1, 1, 1,
1.033071, -1.369602, 2.362782, 1, 1, 1, 1, 1,
1.039837, -0.3094202, 1.820233, 0, 0, 1, 1, 1,
1.046817, 0.3177025, 0.2979439, 1, 0, 0, 1, 1,
1.057732, -0.6492957, 1.821545, 1, 0, 0, 1, 1,
1.064686, -0.2353009, -0.3774748, 1, 0, 0, 1, 1,
1.065553, 1.22073, 2.759869, 1, 0, 0, 1, 1,
1.065681, -0.1906131, 1.584729, 1, 0, 0, 1, 1,
1.070181, 0.1889408, 1.935969, 0, 0, 0, 1, 1,
1.070665, -1.31016, 1.573812, 0, 0, 0, 1, 1,
1.08695, 2.989503, 2.143737, 0, 0, 0, 1, 1,
1.094238, -0.8894868, 2.633785, 0, 0, 0, 1, 1,
1.10085, 0.03852394, 0.7066549, 0, 0, 0, 1, 1,
1.118969, 1.123527, 1.604978, 0, 0, 0, 1, 1,
1.128853, 0.4632979, 2.291807, 0, 0, 0, 1, 1,
1.131107, -0.6611574, 2.629009, 1, 1, 1, 1, 1,
1.133254, -1.254959, 1.353454, 1, 1, 1, 1, 1,
1.142965, 0.7031323, 0.5499231, 1, 1, 1, 1, 1,
1.149112, 1.24911, 1.209791, 1, 1, 1, 1, 1,
1.150449, 0.09691838, 1.350444, 1, 1, 1, 1, 1,
1.153683, -0.2774545, 2.130038, 1, 1, 1, 1, 1,
1.158986, -1.264572, 4.221353, 1, 1, 1, 1, 1,
1.17971, 0.8386818, 0.5231345, 1, 1, 1, 1, 1,
1.212209, 0.6491582, -0.4198678, 1, 1, 1, 1, 1,
1.21676, 0.1980038, 0.3095474, 1, 1, 1, 1, 1,
1.218287, 0.1852905, 3.142367, 1, 1, 1, 1, 1,
1.223258, -1.120651, 1.871725, 1, 1, 1, 1, 1,
1.224578, -0.583508, 2.018383, 1, 1, 1, 1, 1,
1.23744, 1.532835, 1.545051, 1, 1, 1, 1, 1,
1.248689, 0.4670301, 2.221853, 1, 1, 1, 1, 1,
1.250856, -0.07296284, 2.389704, 0, 0, 1, 1, 1,
1.253168, -2.097534, 3.112135, 1, 0, 0, 1, 1,
1.253185, -0.7867487, 3.807147, 1, 0, 0, 1, 1,
1.256768, -0.4790817, 2.255498, 1, 0, 0, 1, 1,
1.261154, -0.7530403, 2.831486, 1, 0, 0, 1, 1,
1.261387, -0.8690643, 2.223528, 1, 0, 0, 1, 1,
1.267313, 1.149447, 1.715898, 0, 0, 0, 1, 1,
1.273094, -1.629387, 1.817106, 0, 0, 0, 1, 1,
1.279422, -0.7042816, 2.101806, 0, 0, 0, 1, 1,
1.282448, 0.4962137, 2.833672, 0, 0, 0, 1, 1,
1.28246, 0.8609319, 0.9138564, 0, 0, 0, 1, 1,
1.283803, -2.330239, 2.929821, 0, 0, 0, 1, 1,
1.286471, -1.161302, 1.616336, 0, 0, 0, 1, 1,
1.286675, -1.726847, 3.417975, 1, 1, 1, 1, 1,
1.287359, 0.237858, -0.9211639, 1, 1, 1, 1, 1,
1.29689, 0.1023204, 0.9748122, 1, 1, 1, 1, 1,
1.297505, -1.410483, 1.347783, 1, 1, 1, 1, 1,
1.305814, 0.8285273, 0.8027239, 1, 1, 1, 1, 1,
1.306534, 0.006888294, 1.501514, 1, 1, 1, 1, 1,
1.309503, -0.2794183, 2.041477, 1, 1, 1, 1, 1,
1.310025, -1.238061, 3.179661, 1, 1, 1, 1, 1,
1.310579, 0.6517291, 1.218805, 1, 1, 1, 1, 1,
1.311394, 0.4910282, -0.0297649, 1, 1, 1, 1, 1,
1.338119, -0.9365265, 1.339563, 1, 1, 1, 1, 1,
1.347372, 0.185696, 1.613604, 1, 1, 1, 1, 1,
1.349217, 0.7982694, 1.813781, 1, 1, 1, 1, 1,
1.378568, -0.350096, -0.1142246, 1, 1, 1, 1, 1,
1.381584, 0.762475, -0.8385502, 1, 1, 1, 1, 1,
1.383977, -0.1380099, 1.13039, 0, 0, 1, 1, 1,
1.392986, -2.069443, 4.22579, 1, 0, 0, 1, 1,
1.394538, 0.1979997, 2.03158, 1, 0, 0, 1, 1,
1.40566, -1.129695, 1.819567, 1, 0, 0, 1, 1,
1.413668, 0.3731384, 2.942739, 1, 0, 0, 1, 1,
1.421011, -1.538728, 2.73856, 1, 0, 0, 1, 1,
1.430141, 0.344937, 0.4777237, 0, 0, 0, 1, 1,
1.430802, -0.9652071, 1.610711, 0, 0, 0, 1, 1,
1.431507, 0.4266106, 2.001553, 0, 0, 0, 1, 1,
1.436968, 0.2612369, 4.133637, 0, 0, 0, 1, 1,
1.437241, -1.21464, 2.195689, 0, 0, 0, 1, 1,
1.447532, -0.455743, 1.805485, 0, 0, 0, 1, 1,
1.448483, 0.1203074, -0.8700014, 0, 0, 0, 1, 1,
1.459967, 0.6396963, 1.912374, 1, 1, 1, 1, 1,
1.461309, -0.4991596, 2.282294, 1, 1, 1, 1, 1,
1.468409, -0.7237806, 3.992359, 1, 1, 1, 1, 1,
1.473986, -0.5618724, 3.80641, 1, 1, 1, 1, 1,
1.483621, -0.9326907, 3.882744, 1, 1, 1, 1, 1,
1.48586, -0.09535068, 0.580193, 1, 1, 1, 1, 1,
1.494931, -1.433144, 2.706322, 1, 1, 1, 1, 1,
1.498477, -1.450149, 1.656932, 1, 1, 1, 1, 1,
1.503986, 0.4047032, 2.590038, 1, 1, 1, 1, 1,
1.506168, 0.07888185, 0.8106487, 1, 1, 1, 1, 1,
1.509489, -0.5144928, 3.211891, 1, 1, 1, 1, 1,
1.521529, -0.0319781, 3.23163, 1, 1, 1, 1, 1,
1.52273, 0.03916703, 0.8061088, 1, 1, 1, 1, 1,
1.524761, 0.8136994, 2.058656, 1, 1, 1, 1, 1,
1.531639, -0.1542571, 2.018401, 1, 1, 1, 1, 1,
1.535471, -0.08889857, 0.2582006, 0, 0, 1, 1, 1,
1.550626, -0.6464925, 2.2153, 1, 0, 0, 1, 1,
1.566872, -0.07176801, 1.889223, 1, 0, 0, 1, 1,
1.571262, 0.8268666, 1.172868, 1, 0, 0, 1, 1,
1.593501, -0.4626404, 2.926393, 1, 0, 0, 1, 1,
1.597914, -0.4029464, 1.83762, 1, 0, 0, 1, 1,
1.599213, 1.870516, -0.4262086, 0, 0, 0, 1, 1,
1.619634, 1.163745, 0.1525676, 0, 0, 0, 1, 1,
1.622741, -0.05134255, 2.351048, 0, 0, 0, 1, 1,
1.629083, -0.2676306, 2.295897, 0, 0, 0, 1, 1,
1.635485, -1.624143, 2.146461, 0, 0, 0, 1, 1,
1.636106, 0.9032348, 1.03959, 0, 0, 0, 1, 1,
1.663509, -2.63459, 1.416787, 0, 0, 0, 1, 1,
1.664138, -0.7796099, 2.061654, 1, 1, 1, 1, 1,
1.721302, -0.969767, 0.7551479, 1, 1, 1, 1, 1,
1.760996, -0.8806902, 2.050912, 1, 1, 1, 1, 1,
1.782068, 0.3435273, 0.5228968, 1, 1, 1, 1, 1,
1.799183, -0.5884004, 1.869018, 1, 1, 1, 1, 1,
1.819149, -0.1852203, 1.480337, 1, 1, 1, 1, 1,
1.822034, 0.4830875, 0.6138595, 1, 1, 1, 1, 1,
1.909354, 0.008793738, 0.323471, 1, 1, 1, 1, 1,
1.941976, 0.8549451, -0.1202756, 1, 1, 1, 1, 1,
1.945457, 0.7450047, 1.860331, 1, 1, 1, 1, 1,
1.958588, -0.6905428, 2.497473, 1, 1, 1, 1, 1,
1.966146, -0.4256759, 2.089692, 1, 1, 1, 1, 1,
1.968564, -0.3434379, 1.110196, 1, 1, 1, 1, 1,
2.005988, -4.427101, 3.845732, 1, 1, 1, 1, 1,
2.019047, 0.4639055, 1.308583, 1, 1, 1, 1, 1,
2.026985, 0.8020824, 1.16294, 0, 0, 1, 1, 1,
2.049229, -1.68786, 2.529802, 1, 0, 0, 1, 1,
2.075092, 0.1664397, 1.669712, 1, 0, 0, 1, 1,
2.100428, -1.175754, 1.547726, 1, 0, 0, 1, 1,
2.121548, 0.5113028, 1.718117, 1, 0, 0, 1, 1,
2.138257, 0.7654356, 3.506783, 1, 0, 0, 1, 1,
2.185719, 0.6255718, -0.7509114, 0, 0, 0, 1, 1,
2.199365, 1.200146, 0.4541629, 0, 0, 0, 1, 1,
2.252651, 2.422449, 0.5130906, 0, 0, 0, 1, 1,
2.25664, 0.3254777, -0.3302177, 0, 0, 0, 1, 1,
2.280805, -0.6187012, 0.8560556, 0, 0, 0, 1, 1,
2.358874, 0.9768323, 1.890715, 0, 0, 0, 1, 1,
2.378103, 1.564527, 2.364521, 0, 0, 0, 1, 1,
2.418221, 0.5253655, 2.31998, 1, 1, 1, 1, 1,
2.455141, 0.4323177, 1.943975, 1, 1, 1, 1, 1,
2.509108, -0.9873884, 2.196948, 1, 1, 1, 1, 1,
2.674581, -1.570132, 4.361571, 1, 1, 1, 1, 1,
2.699252, 0.1863867, 1.640858, 1, 1, 1, 1, 1,
2.732915, 0.6461971, 1.712353, 1, 1, 1, 1, 1,
2.807654, -1.577992, 1.458058, 1, 1, 1, 1, 1
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
var radius = 9.765753;
var distance = 34.30179;
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
mvMatrix.translate( 0.2394235, 0.5589266, -0.1116085 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.30179);
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
