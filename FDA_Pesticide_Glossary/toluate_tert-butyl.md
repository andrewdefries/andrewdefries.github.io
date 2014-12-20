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
-3.133083, 0.6355777, -1.128994, 1, 0, 0, 1,
-3.031923, 0.3659748, -0.1680449, 1, 0.007843138, 0, 1,
-2.735966, 1.060987, -0.8176886, 1, 0.01176471, 0, 1,
-2.615492, -0.9800919, -1.265771, 1, 0.01960784, 0, 1,
-2.472814, -0.1034758, -3.310829, 1, 0.02352941, 0, 1,
-2.471695, 1.074612, 0.8521528, 1, 0.03137255, 0, 1,
-2.439821, -0.4975063, -2.858535, 1, 0.03529412, 0, 1,
-2.430992, -0.3376248, -0.6845386, 1, 0.04313726, 0, 1,
-2.405164, -1.030798, -1.901198, 1, 0.04705882, 0, 1,
-2.365698, 0.6859963, -0.6519016, 1, 0.05490196, 0, 1,
-2.31985, 0.1263367, -1.413752, 1, 0.05882353, 0, 1,
-2.244885, 1.237051, -1.619009, 1, 0.06666667, 0, 1,
-2.237721, 0.505265, -2.338217, 1, 0.07058824, 0, 1,
-2.219397, 1.069495, -0.06569126, 1, 0.07843138, 0, 1,
-2.176041, 0.114494, -1.79389, 1, 0.08235294, 0, 1,
-2.16235, -1.098099, -0.1594315, 1, 0.09019608, 0, 1,
-2.141098, 0.9208108, -1.309989, 1, 0.09411765, 0, 1,
-2.126605, -0.007532929, -2.580226, 1, 0.1019608, 0, 1,
-2.123862, 0.7774861, -2.531403, 1, 0.1098039, 0, 1,
-2.085629, 0.5361871, -1.617287, 1, 0.1137255, 0, 1,
-2.049073, 0.9122466, -0.9967239, 1, 0.1215686, 0, 1,
-1.9519, 0.3005037, -1.46152, 1, 0.1254902, 0, 1,
-1.951551, -0.6466036, -1.732476, 1, 0.1333333, 0, 1,
-1.936722, -0.5740515, -2.540449, 1, 0.1372549, 0, 1,
-1.928769, -1.59825, -0.9324008, 1, 0.145098, 0, 1,
-1.912525, -0.002751253, -1.057451, 1, 0.1490196, 0, 1,
-1.880942, 0.9939196, -3.379387, 1, 0.1568628, 0, 1,
-1.864667, 1.820829, -1.801751, 1, 0.1607843, 0, 1,
-1.858168, 0.7360656, -1.159476, 1, 0.1686275, 0, 1,
-1.842186, -1.307361, -1.501663, 1, 0.172549, 0, 1,
-1.823905, -1.561554, -1.687314, 1, 0.1803922, 0, 1,
-1.821362, 1.530213, -2.57032, 1, 0.1843137, 0, 1,
-1.796515, -0.1290675, -2.088649, 1, 0.1921569, 0, 1,
-1.771691, 1.413779, 1.120199, 1, 0.1960784, 0, 1,
-1.76221, 0.4689463, -2.903124, 1, 0.2039216, 0, 1,
-1.761844, -0.8858916, -0.495177, 1, 0.2117647, 0, 1,
-1.759942, 1.267024, 0.5259856, 1, 0.2156863, 0, 1,
-1.758979, 2.793977, -0.64858, 1, 0.2235294, 0, 1,
-1.716116, 0.0699836, -2.210124, 1, 0.227451, 0, 1,
-1.707483, -0.6295379, -3.253769, 1, 0.2352941, 0, 1,
-1.702395, 1.465547, -1.431128, 1, 0.2392157, 0, 1,
-1.678779, 0.4322443, -1.56794, 1, 0.2470588, 0, 1,
-1.667174, 1.517665, 0.1735642, 1, 0.2509804, 0, 1,
-1.640682, -1.154647, -0.9627711, 1, 0.2588235, 0, 1,
-1.594716, -0.1307779, -2.179861, 1, 0.2627451, 0, 1,
-1.583444, -0.1956008, -0.104691, 1, 0.2705882, 0, 1,
-1.54204, -0.4432007, -3.541299, 1, 0.2745098, 0, 1,
-1.539894, 1.124917, -1.055709, 1, 0.282353, 0, 1,
-1.528382, 0.3495037, -0.7329774, 1, 0.2862745, 0, 1,
-1.496424, -0.02027145, 0.3685501, 1, 0.2941177, 0, 1,
-1.49107, 1.362496, 0.03716301, 1, 0.3019608, 0, 1,
-1.489538, -0.6893011, -1.702744, 1, 0.3058824, 0, 1,
-1.487424, 0.06963097, -0.5271312, 1, 0.3137255, 0, 1,
-1.487138, 1.388072, 0.375088, 1, 0.3176471, 0, 1,
-1.465778, 0.3112734, -0.7372018, 1, 0.3254902, 0, 1,
-1.45149, -0.2548466, -1.59036, 1, 0.3294118, 0, 1,
-1.440667, -0.9804347, -2.20875, 1, 0.3372549, 0, 1,
-1.426813, 0.7984095, -1.289221, 1, 0.3411765, 0, 1,
-1.425849, 0.4230817, -1.70089, 1, 0.3490196, 0, 1,
-1.417278, 1.750399, 0.9257778, 1, 0.3529412, 0, 1,
-1.415976, -0.2730296, -1.799841, 1, 0.3607843, 0, 1,
-1.411412, -1.349222, -0.3625836, 1, 0.3647059, 0, 1,
-1.403736, -0.9339414, -2.573634, 1, 0.372549, 0, 1,
-1.396958, 1.708052, -1.477374, 1, 0.3764706, 0, 1,
-1.391631, 0.724126, -1.867447, 1, 0.3843137, 0, 1,
-1.390661, 1.097012, -0.6464592, 1, 0.3882353, 0, 1,
-1.357565, 1.673002, -0.08419975, 1, 0.3960784, 0, 1,
-1.354641, 0.111192, 0.08926074, 1, 0.4039216, 0, 1,
-1.344647, 0.101035, -1.528104, 1, 0.4078431, 0, 1,
-1.32962, 2.181409, 0.592516, 1, 0.4156863, 0, 1,
-1.317291, 0.6475228, -1.738373, 1, 0.4196078, 0, 1,
-1.304448, -0.2355357, -1.849272, 1, 0.427451, 0, 1,
-1.304282, -0.08357646, -1.595547, 1, 0.4313726, 0, 1,
-1.292809, -1.757152, -1.631454, 1, 0.4392157, 0, 1,
-1.276572, 0.6519334, -0.4691388, 1, 0.4431373, 0, 1,
-1.276226, -1.309598, -2.018255, 1, 0.4509804, 0, 1,
-1.270039, -0.3166133, -0.6862863, 1, 0.454902, 0, 1,
-1.266207, 0.2769778, -1.769543, 1, 0.4627451, 0, 1,
-1.256833, -0.6641908, -2.376516, 1, 0.4666667, 0, 1,
-1.256624, -0.570293, -1.208371, 1, 0.4745098, 0, 1,
-1.251029, 0.4831632, -0.6121485, 1, 0.4784314, 0, 1,
-1.240405, -1.451305, -2.432683, 1, 0.4862745, 0, 1,
-1.239241, 0.4607854, -4.015317, 1, 0.4901961, 0, 1,
-1.235355, -0.3030505, -3.193722, 1, 0.4980392, 0, 1,
-1.23132, -2.734711, -2.71356, 1, 0.5058824, 0, 1,
-1.199444, 2.270583, 1.515733, 1, 0.509804, 0, 1,
-1.195077, -0.839349, -3.505226, 1, 0.5176471, 0, 1,
-1.185005, 1.131076, -0.3195234, 1, 0.5215687, 0, 1,
-1.183675, 0.122267, 0.09393331, 1, 0.5294118, 0, 1,
-1.182022, 0.7886379, -3.17415, 1, 0.5333334, 0, 1,
-1.180779, 0.3992297, -1.877768, 1, 0.5411765, 0, 1,
-1.174792, 0.8349403, -1.017727, 1, 0.5450981, 0, 1,
-1.167236, -1.049484, -1.764084, 1, 0.5529412, 0, 1,
-1.162732, 0.007180606, -1.668915, 1, 0.5568628, 0, 1,
-1.153696, -0.7558252, -1.936271, 1, 0.5647059, 0, 1,
-1.153457, -0.9026226, -1.149019, 1, 0.5686275, 0, 1,
-1.150004, 1.682085, -2.167018, 1, 0.5764706, 0, 1,
-1.149755, -1.179472, -0.9484873, 1, 0.5803922, 0, 1,
-1.14797, -1.847634, -1.629637, 1, 0.5882353, 0, 1,
-1.147621, 0.2512065, -1.464681, 1, 0.5921569, 0, 1,
-1.142959, 2.500784, 0.2421073, 1, 0.6, 0, 1,
-1.142366, 0.1499822, -2.140359, 1, 0.6078432, 0, 1,
-1.140356, -1.213833, -2.366076, 1, 0.6117647, 0, 1,
-1.133313, 1.088231, -0.4410324, 1, 0.6196079, 0, 1,
-1.131262, 0.6991144, -0.5215489, 1, 0.6235294, 0, 1,
-1.127722, -0.2267031, -1.672769, 1, 0.6313726, 0, 1,
-1.126683, 2.265854, -1.125511, 1, 0.6352941, 0, 1,
-1.126265, 0.07252478, -1.704742, 1, 0.6431373, 0, 1,
-1.121202, -2.753036, -4.092272, 1, 0.6470588, 0, 1,
-1.115753, -0.480084, -1.819838, 1, 0.654902, 0, 1,
-1.115091, -1.242051, -3.579954, 1, 0.6588235, 0, 1,
-1.105764, 1.079844, 0.3515484, 1, 0.6666667, 0, 1,
-1.100865, 0.6883737, -1.14639, 1, 0.6705883, 0, 1,
-1.098807, 0.2329573, -0.3607534, 1, 0.6784314, 0, 1,
-1.097013, 1.194857, 0.3539367, 1, 0.682353, 0, 1,
-1.095903, -1.709185, -3.483213, 1, 0.6901961, 0, 1,
-1.089142, 0.5642027, -1.01892, 1, 0.6941177, 0, 1,
-1.078755, 0.7513072, -1.446403, 1, 0.7019608, 0, 1,
-1.077931, 0.8622658, -1.07122, 1, 0.7098039, 0, 1,
-1.064125, -1.652966, -2.636834, 1, 0.7137255, 0, 1,
-1.058242, 0.581602, 0.3400775, 1, 0.7215686, 0, 1,
-1.056368, 0.1909373, -3.406757, 1, 0.7254902, 0, 1,
-1.051788, 0.6586189, -1.082904, 1, 0.7333333, 0, 1,
-1.051314, 0.6401575, -0.3868057, 1, 0.7372549, 0, 1,
-1.047228, -0.1250671, -2.724408, 1, 0.7450981, 0, 1,
-1.045597, 2.318544, -0.3137542, 1, 0.7490196, 0, 1,
-1.045181, -2.137712, -3.810994, 1, 0.7568628, 0, 1,
-1.044134, 1.029253, -1.764718, 1, 0.7607843, 0, 1,
-1.041683, 0.7753946, 0.4606975, 1, 0.7686275, 0, 1,
-1.036986, -0.7872055, -2.335614, 1, 0.772549, 0, 1,
-1.02828, -0.7715808, -1.476556, 1, 0.7803922, 0, 1,
-1.025873, 0.2489427, -0.7616765, 1, 0.7843137, 0, 1,
-1.025182, 0.9648321, -0.6996777, 1, 0.7921569, 0, 1,
-1.02401, 1.440048, -0.348522, 1, 0.7960784, 0, 1,
-1.012614, -0.3619879, -2.494448, 1, 0.8039216, 0, 1,
-1.00802, -1.326436, -2.821378, 1, 0.8117647, 0, 1,
-1.001857, -0.5264371, -2.726844, 1, 0.8156863, 0, 1,
-0.9890057, -0.8315468, -4.456705, 1, 0.8235294, 0, 1,
-0.9839604, -0.5090187, -0.947497, 1, 0.827451, 0, 1,
-0.9785675, -1.207553, -1.107718, 1, 0.8352941, 0, 1,
-0.9718847, 0.6193432, -1.530732, 1, 0.8392157, 0, 1,
-0.9718133, 1.161723, -2.794635, 1, 0.8470588, 0, 1,
-0.9691045, 1.762946, -0.166217, 1, 0.8509804, 0, 1,
-0.962364, 0.9843695, 0.3120009, 1, 0.8588235, 0, 1,
-0.9620226, 0.3689679, -0.7915252, 1, 0.8627451, 0, 1,
-0.9614162, -0.8505215, -4.309107, 1, 0.8705882, 0, 1,
-0.9603003, -1.340956, -3.070108, 1, 0.8745098, 0, 1,
-0.9590213, -0.2392924, -2.057829, 1, 0.8823529, 0, 1,
-0.9540235, 2.034661, -0.9433432, 1, 0.8862745, 0, 1,
-0.9356131, 0.6144068, -0.6732698, 1, 0.8941177, 0, 1,
-0.9302861, -0.5558163, -3.539914, 1, 0.8980392, 0, 1,
-0.9291523, 0.2468574, -2.002903, 1, 0.9058824, 0, 1,
-0.9282057, 0.948005, -0.1719055, 1, 0.9137255, 0, 1,
-0.9167258, 1.097342, -1.555285, 1, 0.9176471, 0, 1,
-0.9158583, -0.4825226, -1.801554, 1, 0.9254902, 0, 1,
-0.9140146, 0.8606212, -1.564909, 1, 0.9294118, 0, 1,
-0.9138976, 0.3311497, -1.357405, 1, 0.9372549, 0, 1,
-0.913585, -0.001999852, -1.854259, 1, 0.9411765, 0, 1,
-0.903433, 0.6589022, -2.339578, 1, 0.9490196, 0, 1,
-0.8988432, 1.705896, 0.707718, 1, 0.9529412, 0, 1,
-0.8973799, 0.3485339, -0.2088305, 1, 0.9607843, 0, 1,
-0.8960134, -0.9525512, -2.471548, 1, 0.9647059, 0, 1,
-0.8943459, -0.6447119, -1.738674, 1, 0.972549, 0, 1,
-0.8938025, -0.4200718, -3.068844, 1, 0.9764706, 0, 1,
-0.8929694, -0.436097, -3.090501, 1, 0.9843137, 0, 1,
-0.8888558, 0.2222032, -2.423868, 1, 0.9882353, 0, 1,
-0.8882752, -0.2756194, -1.349384, 1, 0.9960784, 0, 1,
-0.8838357, 0.6137584, 0.8080643, 0.9960784, 1, 0, 1,
-0.8770117, 0.8131812, -0.9787223, 0.9921569, 1, 0, 1,
-0.8739083, -1.158528, -1.740885, 0.9843137, 1, 0, 1,
-0.8726966, 1.715598, -0.2701921, 0.9803922, 1, 0, 1,
-0.8703756, 0.07254616, -2.413088, 0.972549, 1, 0, 1,
-0.8534842, 1.662732, -0.112411, 0.9686275, 1, 0, 1,
-0.849529, -0.2146094, -2.897889, 0.9607843, 1, 0, 1,
-0.8473665, -0.410887, -1.119114, 0.9568627, 1, 0, 1,
-0.8426381, 0.2857153, -0.7078944, 0.9490196, 1, 0, 1,
-0.8424551, -0.570771, -1.545237, 0.945098, 1, 0, 1,
-0.8422698, -0.2034637, 1.766962, 0.9372549, 1, 0, 1,
-0.8418887, -0.6868466, -1.38217, 0.9333333, 1, 0, 1,
-0.8407576, -0.01249757, -2.481466, 0.9254902, 1, 0, 1,
-0.8390554, -0.1652701, 1.023522, 0.9215686, 1, 0, 1,
-0.8326355, -0.6519513, 0.1456344, 0.9137255, 1, 0, 1,
-0.831596, -0.8403518, -0.5346242, 0.9098039, 1, 0, 1,
-0.828064, 0.06511151, -2.885309, 0.9019608, 1, 0, 1,
-0.8266483, -0.545415, -1.653688, 0.8941177, 1, 0, 1,
-0.8240809, -0.4466257, -2.991404, 0.8901961, 1, 0, 1,
-0.823157, -0.3444453, -0.9000975, 0.8823529, 1, 0, 1,
-0.8211565, 1.337547, -0.04706755, 0.8784314, 1, 0, 1,
-0.8200824, -0.7446224, -1.772339, 0.8705882, 1, 0, 1,
-0.8126854, -1.201301, -1.998391, 0.8666667, 1, 0, 1,
-0.7988907, 1.692912, 0.3177548, 0.8588235, 1, 0, 1,
-0.7883812, -1.177482, -3.11579, 0.854902, 1, 0, 1,
-0.7831365, -0.5619864, -2.604481, 0.8470588, 1, 0, 1,
-0.7812988, -0.1817675, -0.6151804, 0.8431373, 1, 0, 1,
-0.7752603, -0.272941, -2.94033, 0.8352941, 1, 0, 1,
-0.7741321, 0.1748783, -1.710013, 0.8313726, 1, 0, 1,
-0.7730187, -0.4627571, -3.241827, 0.8235294, 1, 0, 1,
-0.7726655, -0.59903, -2.444782, 0.8196079, 1, 0, 1,
-0.7690756, 0.8324255, -0.4330789, 0.8117647, 1, 0, 1,
-0.7606325, -0.984836, -0.8033749, 0.8078431, 1, 0, 1,
-0.756835, 0.04452394, -1.224625, 0.8, 1, 0, 1,
-0.7566671, 0.8400546, -1.556236, 0.7921569, 1, 0, 1,
-0.753922, -0.4275612, -2.615463, 0.7882353, 1, 0, 1,
-0.7493937, -1.563238, -4.257742, 0.7803922, 1, 0, 1,
-0.7482374, 0.6832639, -1.161723, 0.7764706, 1, 0, 1,
-0.7387917, -1.409975, -1.703428, 0.7686275, 1, 0, 1,
-0.7384379, -2.487056, -1.699052, 0.7647059, 1, 0, 1,
-0.7169494, 1.164213, -0.06813677, 0.7568628, 1, 0, 1,
-0.7166579, -1.368764, -2.102354, 0.7529412, 1, 0, 1,
-0.7163392, -0.7339153, -0.1659776, 0.7450981, 1, 0, 1,
-0.7152843, 0.02800251, -3.451905, 0.7411765, 1, 0, 1,
-0.7140296, 0.2519839, -1.453707, 0.7333333, 1, 0, 1,
-0.7127546, 0.7410117, -0.145918, 0.7294118, 1, 0, 1,
-0.7113154, -0.2783469, -1.509456, 0.7215686, 1, 0, 1,
-0.7110227, -1.137686, -3.964123, 0.7176471, 1, 0, 1,
-0.7081196, 0.3499874, -2.076662, 0.7098039, 1, 0, 1,
-0.7041646, -0.03588916, -2.459101, 0.7058824, 1, 0, 1,
-0.7035016, 0.743962, -1.222197, 0.6980392, 1, 0, 1,
-0.7031427, 0.3946861, -1.462568, 0.6901961, 1, 0, 1,
-0.7025608, -0.9732369, -1.705318, 0.6862745, 1, 0, 1,
-0.6991817, -0.04573923, -0.5535685, 0.6784314, 1, 0, 1,
-0.6956022, -0.9183452, -2.123546, 0.6745098, 1, 0, 1,
-0.679736, -1.340482, -4.3226, 0.6666667, 1, 0, 1,
-0.6793879, 0.6224954, -1.423053, 0.6627451, 1, 0, 1,
-0.6782083, -0.1722291, -1.479912, 0.654902, 1, 0, 1,
-0.6766601, -1.634213, -3.105875, 0.6509804, 1, 0, 1,
-0.673301, -1.08349, -1.579114, 0.6431373, 1, 0, 1,
-0.6720084, 0.3463318, 0.3292395, 0.6392157, 1, 0, 1,
-0.6702816, 0.4128688, -1.355078, 0.6313726, 1, 0, 1,
-0.6659051, -1.100822, -3.009285, 0.627451, 1, 0, 1,
-0.6606651, 0.2318386, -1.721282, 0.6196079, 1, 0, 1,
-0.6579235, -0.1865176, -1.124003, 0.6156863, 1, 0, 1,
-0.654565, 1.985478, 0.4865077, 0.6078432, 1, 0, 1,
-0.645295, -0.2775156, -3.434998, 0.6039216, 1, 0, 1,
-0.6452678, -0.2120687, -1.108239, 0.5960785, 1, 0, 1,
-0.6269961, -0.6002804, -3.545846, 0.5882353, 1, 0, 1,
-0.6252682, 0.1698736, -0.5389714, 0.5843138, 1, 0, 1,
-0.6218373, 0.2678632, -0.657731, 0.5764706, 1, 0, 1,
-0.6197503, -0.596679, -1.599198, 0.572549, 1, 0, 1,
-0.6136659, 0.160514, -1.929173, 0.5647059, 1, 0, 1,
-0.611473, -1.181051, -3.1837, 0.5607843, 1, 0, 1,
-0.6106066, 0.3478692, -0.2444556, 0.5529412, 1, 0, 1,
-0.6103875, -0.5195739, -1.407721, 0.5490196, 1, 0, 1,
-0.6097218, 0.3014935, -0.9684863, 0.5411765, 1, 0, 1,
-0.6091622, -1.803076, -3.961853, 0.5372549, 1, 0, 1,
-0.6082968, 1.288233, -1.402101, 0.5294118, 1, 0, 1,
-0.6081461, 0.6839244, -0.1387187, 0.5254902, 1, 0, 1,
-0.6004835, 1.273449, -1.491647, 0.5176471, 1, 0, 1,
-0.5971985, -0.09981517, -2.528435, 0.5137255, 1, 0, 1,
-0.5887581, -0.9049466, -2.902409, 0.5058824, 1, 0, 1,
-0.58871, -0.9606454, -0.6208192, 0.5019608, 1, 0, 1,
-0.5884789, 1.279932, -1.485093, 0.4941176, 1, 0, 1,
-0.5853796, 0.6163785, -0.6909442, 0.4862745, 1, 0, 1,
-0.5852878, 0.8017555, -1.082379, 0.4823529, 1, 0, 1,
-0.5764998, 0.391809, -1.019083, 0.4745098, 1, 0, 1,
-0.5732253, 0.2817213, -0.3225087, 0.4705882, 1, 0, 1,
-0.5700065, 1.142423, -0.7319711, 0.4627451, 1, 0, 1,
-0.5663668, 1.210105, 0.6312304, 0.4588235, 1, 0, 1,
-0.5653513, 1.380924, -0.4005402, 0.4509804, 1, 0, 1,
-0.5641038, 0.4410494, -0.4307037, 0.4470588, 1, 0, 1,
-0.5636593, -1.116019, -1.527282, 0.4392157, 1, 0, 1,
-0.5635299, -0.8902088, -4.229292, 0.4352941, 1, 0, 1,
-0.5567412, -0.8398063, -3.340565, 0.427451, 1, 0, 1,
-0.5556562, 0.6387244, -1.454649, 0.4235294, 1, 0, 1,
-0.5537522, 0.6316485, 0.9255995, 0.4156863, 1, 0, 1,
-0.5469216, 2.157297, 1.012287, 0.4117647, 1, 0, 1,
-0.5434084, 1.596719, -0.5723601, 0.4039216, 1, 0, 1,
-0.5397673, 1.045699, -1.505022, 0.3960784, 1, 0, 1,
-0.5361891, -1.149956, -3.420747, 0.3921569, 1, 0, 1,
-0.5329707, -1.703142, -2.66597, 0.3843137, 1, 0, 1,
-0.5305144, 0.3530518, -0.4835485, 0.3803922, 1, 0, 1,
-0.5304599, 1.377244, -1.580812, 0.372549, 1, 0, 1,
-0.5261043, 0.4280439, -0.9366642, 0.3686275, 1, 0, 1,
-0.5260712, -0.2200041, -1.140098, 0.3607843, 1, 0, 1,
-0.5246734, -0.2488684, -2.475505, 0.3568628, 1, 0, 1,
-0.5219127, -0.8374554, -2.613017, 0.3490196, 1, 0, 1,
-0.5196884, -2.380913, -1.43733, 0.345098, 1, 0, 1,
-0.5165655, -0.3596453, -2.391352, 0.3372549, 1, 0, 1,
-0.5046234, 0.7462686, -0.6655393, 0.3333333, 1, 0, 1,
-0.5002335, 0.6823449, -2.72471, 0.3254902, 1, 0, 1,
-0.4997522, 1.036132, -1.564048, 0.3215686, 1, 0, 1,
-0.4926064, -1.090752, -2.812831, 0.3137255, 1, 0, 1,
-0.4912754, -0.1669086, -1.38914, 0.3098039, 1, 0, 1,
-0.4907263, -1.845292, -3.067084, 0.3019608, 1, 0, 1,
-0.487714, 0.6406661, -2.946748, 0.2941177, 1, 0, 1,
-0.4780878, 1.120033, 0.3750159, 0.2901961, 1, 0, 1,
-0.4723148, 0.4748249, -0.9367237, 0.282353, 1, 0, 1,
-0.4720366, -0.7274467, -3.495485, 0.2784314, 1, 0, 1,
-0.4717475, -0.9640627, -3.021024, 0.2705882, 1, 0, 1,
-0.4699276, -0.6222262, -3.299001, 0.2666667, 1, 0, 1,
-0.4693317, 1.350404, -0.4661206, 0.2588235, 1, 0, 1,
-0.4681418, -1.059045, -2.64289, 0.254902, 1, 0, 1,
-0.4664113, -1.045565, -3.453808, 0.2470588, 1, 0, 1,
-0.4634439, 1.370034, 1.1429, 0.2431373, 1, 0, 1,
-0.4620447, 0.6623759, -0.103339, 0.2352941, 1, 0, 1,
-0.4613491, -0.3119058, -2.016518, 0.2313726, 1, 0, 1,
-0.4608875, -0.1956565, -2.030304, 0.2235294, 1, 0, 1,
-0.4526754, -1.542862, -3.737758, 0.2196078, 1, 0, 1,
-0.4457042, -0.454627, -1.643256, 0.2117647, 1, 0, 1,
-0.4429894, 0.8845226, -1.329116, 0.2078431, 1, 0, 1,
-0.4414716, 0.2040232, -1.130142, 0.2, 1, 0, 1,
-0.4384938, -0.8437784, -3.549647, 0.1921569, 1, 0, 1,
-0.4355908, 0.5254935, -0.1618089, 0.1882353, 1, 0, 1,
-0.4340651, -1.136147, -2.561618, 0.1803922, 1, 0, 1,
-0.4331858, -0.9428826, -2.399757, 0.1764706, 1, 0, 1,
-0.4203001, -0.3884151, -3.301044, 0.1686275, 1, 0, 1,
-0.418673, -0.5909519, -1.015214, 0.1647059, 1, 0, 1,
-0.4131448, 2.028392, 1.217149, 0.1568628, 1, 0, 1,
-0.4100679, 0.901653, 0.7125171, 0.1529412, 1, 0, 1,
-0.4027697, 1.553993, 0.8840801, 0.145098, 1, 0, 1,
-0.4026881, 0.7451802, -0.05336916, 0.1411765, 1, 0, 1,
-0.3976976, -1.377444, -4.43582, 0.1333333, 1, 0, 1,
-0.3973194, 0.7494218, 1.663751, 0.1294118, 1, 0, 1,
-0.3923664, 0.6849298, -0.3591167, 0.1215686, 1, 0, 1,
-0.3884762, 0.4924405, -0.6089293, 0.1176471, 1, 0, 1,
-0.3846972, 0.1646441, -1.055475, 0.1098039, 1, 0, 1,
-0.3811472, -0.2771676, -3.760549, 0.1058824, 1, 0, 1,
-0.3779672, 1.25654, 0.8105294, 0.09803922, 1, 0, 1,
-0.3777303, 1.340073, 2.012875, 0.09019608, 1, 0, 1,
-0.3722663, 0.8346682, 0.3417237, 0.08627451, 1, 0, 1,
-0.3713325, 0.5185693, 0.6473092, 0.07843138, 1, 0, 1,
-0.3701357, 0.0004695786, -1.55908, 0.07450981, 1, 0, 1,
-0.3694028, -0.7321761, -2.950326, 0.06666667, 1, 0, 1,
-0.3626707, 0.4285778, -0.4656597, 0.0627451, 1, 0, 1,
-0.3611302, 2.369112, 0.3088478, 0.05490196, 1, 0, 1,
-0.3610024, 0.2626509, -2.944755, 0.05098039, 1, 0, 1,
-0.3607862, 0.5698661, 0.4251655, 0.04313726, 1, 0, 1,
-0.3607116, -0.4237947, -2.251417, 0.03921569, 1, 0, 1,
-0.3596782, 1.360008, -0.1801446, 0.03137255, 1, 0, 1,
-0.3593604, -0.5682061, -3.246127, 0.02745098, 1, 0, 1,
-0.3578387, -0.2985359, -4.395162, 0.01960784, 1, 0, 1,
-0.357793, 1.119668, -0.6619617, 0.01568628, 1, 0, 1,
-0.3546729, 0.3859262, -1.003598, 0.007843138, 1, 0, 1,
-0.3544807, -0.6825101, -2.800362, 0.003921569, 1, 0, 1,
-0.3543456, -0.3718812, -2.107871, 0, 1, 0.003921569, 1,
-0.3449961, 0.9124273, 0.6842642, 0, 1, 0.01176471, 1,
-0.3428685, -0.4367027, -3.425595, 0, 1, 0.01568628, 1,
-0.3415612, -0.5501615, -4.421065, 0, 1, 0.02352941, 1,
-0.3406151, -0.7466174, -2.866107, 0, 1, 0.02745098, 1,
-0.338775, -1.333744, -4.608526, 0, 1, 0.03529412, 1,
-0.3371812, -1.006716, -2.164308, 0, 1, 0.03921569, 1,
-0.3320176, 0.4777897, 0.5922349, 0, 1, 0.04705882, 1,
-0.3317154, -0.1190553, -2.383888, 0, 1, 0.05098039, 1,
-0.3295318, 0.5486926, -0.9249577, 0, 1, 0.05882353, 1,
-0.3245894, -1.037758, -2.260793, 0, 1, 0.0627451, 1,
-0.3213788, 1.219431, -0.2071663, 0, 1, 0.07058824, 1,
-0.3185855, -2.083784, -2.570601, 0, 1, 0.07450981, 1,
-0.3173844, 0.7816521, -0.4732092, 0, 1, 0.08235294, 1,
-0.3158865, -0.5634466, -2.033896, 0, 1, 0.08627451, 1,
-0.3134432, 0.9334373, 0.7957095, 0, 1, 0.09411765, 1,
-0.3104273, 0.1149851, -0.9550449, 0, 1, 0.1019608, 1,
-0.3089806, -0.6034747, -0.5196533, 0, 1, 0.1058824, 1,
-0.3056602, -0.122234, -2.409967, 0, 1, 0.1137255, 1,
-0.3020429, 0.5398034, -1.596005, 0, 1, 0.1176471, 1,
-0.3003442, -1.211983, -4.058936, 0, 1, 0.1254902, 1,
-0.2985003, 1.143123, 0.9662661, 0, 1, 0.1294118, 1,
-0.2975983, -2.233345, -3.5754, 0, 1, 0.1372549, 1,
-0.2968858, 0.6650467, -0.4158231, 0, 1, 0.1411765, 1,
-0.2961304, -2.293788, -2.57367, 0, 1, 0.1490196, 1,
-0.2936258, 0.4082585, -0.7509469, 0, 1, 0.1529412, 1,
-0.2929596, 0.7956176, -3.169551, 0, 1, 0.1607843, 1,
-0.2929246, 0.7185685, -0.5675104, 0, 1, 0.1647059, 1,
-0.2918133, -0.5074321, -3.239547, 0, 1, 0.172549, 1,
-0.2848687, 1.470372, -0.700566, 0, 1, 0.1764706, 1,
-0.283665, 0.5206107, -1.292642, 0, 1, 0.1843137, 1,
-0.2833481, -0.7353061, -2.712895, 0, 1, 0.1882353, 1,
-0.2753207, -0.1625745, -2.342641, 0, 1, 0.1960784, 1,
-0.2749477, 1.723508, -1.550969, 0, 1, 0.2039216, 1,
-0.2736363, -0.3257604, -0.9727454, 0, 1, 0.2078431, 1,
-0.2730757, -1.079895, -3.39793, 0, 1, 0.2156863, 1,
-0.2663643, 2.569443, -1.2892, 0, 1, 0.2196078, 1,
-0.2638629, 0.1340378, -0.5818819, 0, 1, 0.227451, 1,
-0.2632185, -0.8250793, -3.550104, 0, 1, 0.2313726, 1,
-0.259113, 0.459947, -1.710557, 0, 1, 0.2392157, 1,
-0.2525857, 1.620023, -0.09630281, 0, 1, 0.2431373, 1,
-0.2517158, -0.01205838, -0.9763837, 0, 1, 0.2509804, 1,
-0.2493008, 0.2741805, 2.143908, 0, 1, 0.254902, 1,
-0.2491629, -0.5880703, -3.197274, 0, 1, 0.2627451, 1,
-0.2480634, -0.6651504, -1.834229, 0, 1, 0.2666667, 1,
-0.2410351, 1.353797, -0.1505385, 0, 1, 0.2745098, 1,
-0.2408816, -3.133477, -2.63266, 0, 1, 0.2784314, 1,
-0.2408706, 0.1879639, -1.478848, 0, 1, 0.2862745, 1,
-0.2387804, 0.8951432, -0.9628299, 0, 1, 0.2901961, 1,
-0.2380692, -1.288833, -5.626833, 0, 1, 0.2980392, 1,
-0.2356977, 0.3681253, -1.384998, 0, 1, 0.3058824, 1,
-0.2310853, 0.3845225, -1.224131, 0, 1, 0.3098039, 1,
-0.2305491, 0.5999675, -2.47348, 0, 1, 0.3176471, 1,
-0.2283407, 1.26801, -0.4325849, 0, 1, 0.3215686, 1,
-0.2267509, -1.447811, -4.078054, 0, 1, 0.3294118, 1,
-0.2219483, 1.114906, -1.45757, 0, 1, 0.3333333, 1,
-0.2183914, 0.2086766, -2.628772, 0, 1, 0.3411765, 1,
-0.2166167, -0.5977049, -3.795877, 0, 1, 0.345098, 1,
-0.2147893, 0.6649773, -1.104374, 0, 1, 0.3529412, 1,
-0.2116483, -0.5859999, -2.354203, 0, 1, 0.3568628, 1,
-0.2102389, -1.331662, -0.7155943, 0, 1, 0.3647059, 1,
-0.2099673, 0.6288112, 0.7184983, 0, 1, 0.3686275, 1,
-0.2093267, -0.8475477, -3.911802, 0, 1, 0.3764706, 1,
-0.2074052, -0.1617486, -0.8496464, 0, 1, 0.3803922, 1,
-0.2071206, -0.1820268, -0.06754106, 0, 1, 0.3882353, 1,
-0.2028387, 1.060904, -1.663898, 0, 1, 0.3921569, 1,
-0.1947384, -0.5251993, -2.421159, 0, 1, 0.4, 1,
-0.1932596, 1.88939, 0.3350186, 0, 1, 0.4078431, 1,
-0.1863563, 0.07583798, 0.7770467, 0, 1, 0.4117647, 1,
-0.1835161, 1.709976, -0.1706, 0, 1, 0.4196078, 1,
-0.1805528, 0.3073976, -0.5386902, 0, 1, 0.4235294, 1,
-0.1794633, -3.10337, -4.012569, 0, 1, 0.4313726, 1,
-0.1714096, 1.105497, -0.368329, 0, 1, 0.4352941, 1,
-0.1663595, -0.2831395, -2.690438, 0, 1, 0.4431373, 1,
-0.1649631, 2.708314, -0.6687997, 0, 1, 0.4470588, 1,
-0.1633159, 0.7837225, -1.546586, 0, 1, 0.454902, 1,
-0.1619131, 1.118895, 0.2455615, 0, 1, 0.4588235, 1,
-0.1609038, 0.1387543, -0.7048446, 0, 1, 0.4666667, 1,
-0.1593537, -2.305012, -3.652715, 0, 1, 0.4705882, 1,
-0.1593254, 2.858882, -0.4181621, 0, 1, 0.4784314, 1,
-0.1572302, 0.4719923, -0.9088825, 0, 1, 0.4823529, 1,
-0.1565586, -0.6624605, -2.734575, 0, 1, 0.4901961, 1,
-0.1545152, 0.7106699, -0.4419358, 0, 1, 0.4941176, 1,
-0.1542738, -0.2269972, 0.01453411, 0, 1, 0.5019608, 1,
-0.1444497, -0.08901128, -2.653066, 0, 1, 0.509804, 1,
-0.1437877, 0.5191697, -1.026087, 0, 1, 0.5137255, 1,
-0.1429199, 0.7862244, 0.5656564, 0, 1, 0.5215687, 1,
-0.1402467, 1.286202, -1.011395, 0, 1, 0.5254902, 1,
-0.1327816, -0.8146277, -2.794933, 0, 1, 0.5333334, 1,
-0.132311, -1.986568, -2.548456, 0, 1, 0.5372549, 1,
-0.1321468, 1.743922, 0.04803248, 0, 1, 0.5450981, 1,
-0.1314874, -0.07396617, -1.299122, 0, 1, 0.5490196, 1,
-0.130978, -0.4903852, -2.588776, 0, 1, 0.5568628, 1,
-0.1274129, 0.7424818, -0.0102658, 0, 1, 0.5607843, 1,
-0.1264839, -0.9210575, -3.890295, 0, 1, 0.5686275, 1,
-0.1197244, 1.975554, -0.8370699, 0, 1, 0.572549, 1,
-0.1194314, -1.715315, -3.450235, 0, 1, 0.5803922, 1,
-0.1192345, -0.9032852, -1.767823, 0, 1, 0.5843138, 1,
-0.1117946, -1.595182, -3.033985, 0, 1, 0.5921569, 1,
-0.1111539, -0.49395, -3.366396, 0, 1, 0.5960785, 1,
-0.110945, 1.97698, 0.9193757, 0, 1, 0.6039216, 1,
-0.1108116, -1.321094, -1.949411, 0, 1, 0.6117647, 1,
-0.1073262, 0.2031177, -2.390807, 0, 1, 0.6156863, 1,
-0.107251, 1.480985, 0.4332685, 0, 1, 0.6235294, 1,
-0.102761, 1.995396, -0.5919162, 0, 1, 0.627451, 1,
-0.09866704, -1.156642, -2.483371, 0, 1, 0.6352941, 1,
-0.09764611, 0.8220329, -0.493497, 0, 1, 0.6392157, 1,
-0.09539343, -0.4265015, -1.461866, 0, 1, 0.6470588, 1,
-0.09377617, 0.6016313, -0.2543529, 0, 1, 0.6509804, 1,
-0.09362691, 0.388943, -1.183478, 0, 1, 0.6588235, 1,
-0.09204388, 0.1530037, -0.01538039, 0, 1, 0.6627451, 1,
-0.09174027, -0.3079531, -3.874503, 0, 1, 0.6705883, 1,
-0.08868292, -0.3332162, -3.028688, 0, 1, 0.6745098, 1,
-0.08787537, 0.7240893, -0.09050612, 0, 1, 0.682353, 1,
-0.0873041, -0.7653462, -3.21268, 0, 1, 0.6862745, 1,
-0.08441358, 1.531568, 0.3998242, 0, 1, 0.6941177, 1,
-0.08091061, -1.474092, -3.704158, 0, 1, 0.7019608, 1,
-0.08066451, -0.5144057, -4.109885, 0, 1, 0.7058824, 1,
-0.07918846, 1.105883, -0.02848335, 0, 1, 0.7137255, 1,
-0.07778292, 0.1351052, -1.305664, 0, 1, 0.7176471, 1,
-0.07241641, -2.003936, -2.796004, 0, 1, 0.7254902, 1,
-0.07154125, 0.02148371, -2.320012, 0, 1, 0.7294118, 1,
-0.06906282, 0.4948403, -0.14673, 0, 1, 0.7372549, 1,
-0.06655343, 0.09611022, 0.09745094, 0, 1, 0.7411765, 1,
-0.06651264, 0.6808038, 0.953853, 0, 1, 0.7490196, 1,
-0.06485008, -0.7701612, -4.19442, 0, 1, 0.7529412, 1,
-0.06290843, -1.13657, -3.742105, 0, 1, 0.7607843, 1,
-0.05941293, 1.122288, 0.8665441, 0, 1, 0.7647059, 1,
-0.05929024, 0.8351952, -0.3743897, 0, 1, 0.772549, 1,
-0.0583739, 0.9521353, 0.4403139, 0, 1, 0.7764706, 1,
-0.05531269, -1.279286, -3.566223, 0, 1, 0.7843137, 1,
-0.05517586, -0.9156357, -2.96831, 0, 1, 0.7882353, 1,
-0.05369084, -0.5631495, -3.475588, 0, 1, 0.7960784, 1,
-0.04899256, -0.1704012, -2.744029, 0, 1, 0.8039216, 1,
-0.04275617, 1.278362, 2.000754, 0, 1, 0.8078431, 1,
-0.03858558, -0.9112968, -2.856977, 0, 1, 0.8156863, 1,
-0.03593299, -2.085984, -3.199972, 0, 1, 0.8196079, 1,
-0.0358882, -2.966705, -3.008724, 0, 1, 0.827451, 1,
-0.03420457, 1.297248, 1.543141, 0, 1, 0.8313726, 1,
-0.03287225, 0.1886876, 0.3497076, 0, 1, 0.8392157, 1,
-0.03280375, 0.6252196, -0.0803036, 0, 1, 0.8431373, 1,
-0.0325968, 0.5216326, -1.368088, 0, 1, 0.8509804, 1,
-0.02806931, -1.572651, -3.801406, 0, 1, 0.854902, 1,
-0.02428147, -1.740787, -2.334266, 0, 1, 0.8627451, 1,
-0.02309048, 0.1380794, -0.7780169, 0, 1, 0.8666667, 1,
-0.01638817, -0.3073946, -2.421146, 0, 1, 0.8745098, 1,
-0.01595972, -0.3941175, -4.734045, 0, 1, 0.8784314, 1,
-0.01535564, -1.251949, -2.529611, 0, 1, 0.8862745, 1,
-0.01516744, 2.29769, -1.084038, 0, 1, 0.8901961, 1,
-0.01294543, 0.3222449, -1.119308, 0, 1, 0.8980392, 1,
-0.01113076, -1.851934, -4.569669, 0, 1, 0.9058824, 1,
-0.006097907, -0.4922929, -2.758738, 0, 1, 0.9098039, 1,
-0.005253151, 1.09846, 0.6545181, 0, 1, 0.9176471, 1,
-0.003771927, -0.4561404, -3.488618, 0, 1, 0.9215686, 1,
-0.00295681, -1.60579, -2.574368, 0, 1, 0.9294118, 1,
-0.0006706372, 0.9342031, 0.2256733, 0, 1, 0.9333333, 1,
0.003992899, -0.5036815, 3.317407, 0, 1, 0.9411765, 1,
0.008258657, -0.8762028, 2.362928, 0, 1, 0.945098, 1,
0.008514744, -0.06832993, 3.200129, 0, 1, 0.9529412, 1,
0.01151913, 0.1889526, 1.494078, 0, 1, 0.9568627, 1,
0.01744263, 0.4896828, 1.344371, 0, 1, 0.9647059, 1,
0.02089946, 1.807155, 0.3724995, 0, 1, 0.9686275, 1,
0.02195892, -1.769121, 3.407051, 0, 1, 0.9764706, 1,
0.02268585, 1.886159, 0.06912211, 0, 1, 0.9803922, 1,
0.02954411, -2.254066, 2.846503, 0, 1, 0.9882353, 1,
0.02985845, 1.247228, 0.767613, 0, 1, 0.9921569, 1,
0.03181298, -0.8857368, 4.096808, 0, 1, 1, 1,
0.03217215, 0.9328262, -0.09135878, 0, 0.9921569, 1, 1,
0.03568216, 0.07363508, 1.925014, 0, 0.9882353, 1, 1,
0.03643547, -0.1772265, 3.053389, 0, 0.9803922, 1, 1,
0.03864797, 0.6149846, -1.85093, 0, 0.9764706, 1, 1,
0.0420373, 1.892613, -1.127412, 0, 0.9686275, 1, 1,
0.04574208, 0.3240068, 1.410845, 0, 0.9647059, 1, 1,
0.04594571, 1.061662, 0.01356866, 0, 0.9568627, 1, 1,
0.04668789, -1.236199, 2.98862, 0, 0.9529412, 1, 1,
0.05160512, -0.5145292, 1.939467, 0, 0.945098, 1, 1,
0.05210278, -0.0635394, 1.634588, 0, 0.9411765, 1, 1,
0.05370744, -1.46147, 3.561182, 0, 0.9333333, 1, 1,
0.05914589, 0.008529176, 2.348108, 0, 0.9294118, 1, 1,
0.05925905, 1.395721, 0.3175975, 0, 0.9215686, 1, 1,
0.06226962, 0.2208723, 0.4813426, 0, 0.9176471, 1, 1,
0.06329929, -0.03645891, 3.150712, 0, 0.9098039, 1, 1,
0.06367053, 1.742017, 0.01177624, 0, 0.9058824, 1, 1,
0.06835185, -0.8094152, 1.842472, 0, 0.8980392, 1, 1,
0.06948531, 0.4475229, 0.5283717, 0, 0.8901961, 1, 1,
0.0722001, 0.7847401, -0.05079832, 0, 0.8862745, 1, 1,
0.07622775, 1.139374, 1.103069, 0, 0.8784314, 1, 1,
0.0779947, 1.321432, 1.353451, 0, 0.8745098, 1, 1,
0.07890403, -0.6993921, 1.727983, 0, 0.8666667, 1, 1,
0.07912499, 0.2248291, -1.159583, 0, 0.8627451, 1, 1,
0.08034329, -0.8077505, 2.379076, 0, 0.854902, 1, 1,
0.08106358, 0.5567447, 1.28481, 0, 0.8509804, 1, 1,
0.08438235, -1.314047, 3.181188, 0, 0.8431373, 1, 1,
0.08537368, 0.04697354, 1.28671, 0, 0.8392157, 1, 1,
0.08555403, -0.8768678, 2.734132, 0, 0.8313726, 1, 1,
0.08626653, 0.07237009, 1.947592, 0, 0.827451, 1, 1,
0.08915445, 0.2331511, -1.706504, 0, 0.8196079, 1, 1,
0.08954152, 0.1948826, -0.8773286, 0, 0.8156863, 1, 1,
0.09039985, 0.9713161, -1.236504, 0, 0.8078431, 1, 1,
0.09117743, 0.2815723, 0.9072489, 0, 0.8039216, 1, 1,
0.09415177, 0.2711629, 1.145918, 0, 0.7960784, 1, 1,
0.09456872, 0.5114307, 0.8164352, 0, 0.7882353, 1, 1,
0.09755702, -0.1845963, 2.550933, 0, 0.7843137, 1, 1,
0.09966522, 2.109159, -1.52069, 0, 0.7764706, 1, 1,
0.1008509, 1.107316, -0.3176128, 0, 0.772549, 1, 1,
0.1038487, 0.6395767, 0.7170082, 0, 0.7647059, 1, 1,
0.1045412, -0.3788665, 2.659663, 0, 0.7607843, 1, 1,
0.1098636, -0.027116, 3.739655, 0, 0.7529412, 1, 1,
0.1129577, -1.021601, 4.494842, 0, 0.7490196, 1, 1,
0.1196898, -2.084144, 2.004895, 0, 0.7411765, 1, 1,
0.1212731, 0.8067587, 0.02598392, 0, 0.7372549, 1, 1,
0.1252648, -1.410341, 2.94804, 0, 0.7294118, 1, 1,
0.1253311, 0.7963121, 0.3797055, 0, 0.7254902, 1, 1,
0.1279747, 0.2693572, 0.8384238, 0, 0.7176471, 1, 1,
0.1284163, -0.01870321, 2.210138, 0, 0.7137255, 1, 1,
0.1311786, -0.3746442, 3.027271, 0, 0.7058824, 1, 1,
0.1339336, 0.5901899, -0.371695, 0, 0.6980392, 1, 1,
0.1339567, 0.2035435, 0.8945891, 0, 0.6941177, 1, 1,
0.1361097, 0.9128425, 2.439807, 0, 0.6862745, 1, 1,
0.1361767, 0.007465808, 1.577193, 0, 0.682353, 1, 1,
0.136814, 1.223538, 0.4044969, 0, 0.6745098, 1, 1,
0.1381983, -0.07828517, 2.562557, 0, 0.6705883, 1, 1,
0.1395631, -0.5520943, 4.243682, 0, 0.6627451, 1, 1,
0.1437059, 0.2464128, 2.634718, 0, 0.6588235, 1, 1,
0.1467704, 0.7609522, -0.03195668, 0, 0.6509804, 1, 1,
0.1481783, 0.005700661, -0.1369937, 0, 0.6470588, 1, 1,
0.1521777, 1.852997, -1.349692, 0, 0.6392157, 1, 1,
0.1536998, -1.885007, 2.474193, 0, 0.6352941, 1, 1,
0.1551171, 0.5750176, 0.7663599, 0, 0.627451, 1, 1,
0.1598537, 0.8351327, -1.482927, 0, 0.6235294, 1, 1,
0.1620334, -1.096674, 2.807618, 0, 0.6156863, 1, 1,
0.1635813, -1.157516, 3.221287, 0, 0.6117647, 1, 1,
0.1638472, 0.4210961, 0.3281403, 0, 0.6039216, 1, 1,
0.1641826, 0.9434142, -0.8906656, 0, 0.5960785, 1, 1,
0.1651463, 0.7961045, -0.7518145, 0, 0.5921569, 1, 1,
0.1695368, -0.1529771, 1.247595, 0, 0.5843138, 1, 1,
0.1695798, 0.7087984, 1.119814, 0, 0.5803922, 1, 1,
0.1734334, -0.8992335, 2.725972, 0, 0.572549, 1, 1,
0.1798338, -1.218573, 2.580156, 0, 0.5686275, 1, 1,
0.1833519, 0.2871753, -0.2417339, 0, 0.5607843, 1, 1,
0.1840315, 0.477266, -0.8695663, 0, 0.5568628, 1, 1,
0.1840747, -0.02982317, 0.2000571, 0, 0.5490196, 1, 1,
0.1895684, 0.2364906, 1.428822, 0, 0.5450981, 1, 1,
0.1914079, 1.063056, -0.2873622, 0, 0.5372549, 1, 1,
0.1928582, -1.459547, 4.588367, 0, 0.5333334, 1, 1,
0.1956224, 1.146372, -1.018311, 0, 0.5254902, 1, 1,
0.1962139, 1.79831, -1.240964, 0, 0.5215687, 1, 1,
0.197578, -0.1582126, 2.815042, 0, 0.5137255, 1, 1,
0.1987035, -0.7833558, 3.046391, 0, 0.509804, 1, 1,
0.2013297, -0.521137, 1.261253, 0, 0.5019608, 1, 1,
0.2017405, 0.715508, 1.64873, 0, 0.4941176, 1, 1,
0.2081143, 0.6165588, -0.1788105, 0, 0.4901961, 1, 1,
0.208652, 1.057946, -0.3043034, 0, 0.4823529, 1, 1,
0.2105057, -0.1811109, 1.956595, 0, 0.4784314, 1, 1,
0.2106943, -0.01716204, 1.07026, 0, 0.4705882, 1, 1,
0.2148728, 0.7896907, 1.553338, 0, 0.4666667, 1, 1,
0.2155665, 0.4079847, 1.126116, 0, 0.4588235, 1, 1,
0.2204373, 1.915752, 0.481676, 0, 0.454902, 1, 1,
0.2224093, 1.618577, -0.9632643, 0, 0.4470588, 1, 1,
0.2245514, -0.8384713, 3.417409, 0, 0.4431373, 1, 1,
0.226224, 0.9746147, 0.2741057, 0, 0.4352941, 1, 1,
0.2302056, 0.8158628, 1.413382, 0, 0.4313726, 1, 1,
0.231038, 1.164196, 1.019004, 0, 0.4235294, 1, 1,
0.2320892, 0.3570469, 0.09165148, 0, 0.4196078, 1, 1,
0.2359097, 0.3359962, 1.912207, 0, 0.4117647, 1, 1,
0.2398061, 1.312628, 1.73264, 0, 0.4078431, 1, 1,
0.2472257, -0.5810193, 0.6768131, 0, 0.4, 1, 1,
0.2496913, -2.058458, 2.965069, 0, 0.3921569, 1, 1,
0.2501407, 2.218242, 0.6705756, 0, 0.3882353, 1, 1,
0.2539576, -0.01106424, 1.829517, 0, 0.3803922, 1, 1,
0.2564454, -0.4983532, 3.850287, 0, 0.3764706, 1, 1,
0.2600628, -1.800725, 3.300813, 0, 0.3686275, 1, 1,
0.2680463, -0.6074888, 3.249122, 0, 0.3647059, 1, 1,
0.2686492, 2.455585, 1.281734, 0, 0.3568628, 1, 1,
0.2702123, 0.8621552, -0.9047956, 0, 0.3529412, 1, 1,
0.2704574, 0.6467111, 0.5876958, 0, 0.345098, 1, 1,
0.2731878, -0.008817034, 0.902439, 0, 0.3411765, 1, 1,
0.2738576, -0.822175, 3.28093, 0, 0.3333333, 1, 1,
0.2749891, 0.9924466, 0.4576426, 0, 0.3294118, 1, 1,
0.2764699, -0.8275548, 2.911812, 0, 0.3215686, 1, 1,
0.2809602, 0.3541772, 0.5363431, 0, 0.3176471, 1, 1,
0.2816678, 0.7745894, -1.383713, 0, 0.3098039, 1, 1,
0.2878188, -0.3113051, 2.609339, 0, 0.3058824, 1, 1,
0.2956516, -1.136773, 3.871425, 0, 0.2980392, 1, 1,
0.2962644, -0.3207282, -0.01529551, 0, 0.2901961, 1, 1,
0.2970567, 0.9200897, 1.245281, 0, 0.2862745, 1, 1,
0.2977073, -0.01976404, 1.616176, 0, 0.2784314, 1, 1,
0.2982379, 0.985384, 0.9514028, 0, 0.2745098, 1, 1,
0.3009538, -0.07965281, 3.414259, 0, 0.2666667, 1, 1,
0.3012021, -0.665957, 1.744994, 0, 0.2627451, 1, 1,
0.3019199, 1.663165, -1.233437, 0, 0.254902, 1, 1,
0.3050429, -0.4358341, 2.203215, 0, 0.2509804, 1, 1,
0.3131427, -0.5856698, 2.607372, 0, 0.2431373, 1, 1,
0.3141373, 0.08091132, 2.620278, 0, 0.2392157, 1, 1,
0.3163757, -0.6349759, 2.421473, 0, 0.2313726, 1, 1,
0.3165356, 2.237425, -1.364164, 0, 0.227451, 1, 1,
0.3167244, -0.6102248, 2.091891, 0, 0.2196078, 1, 1,
0.3215867, 0.554843, 1.851983, 0, 0.2156863, 1, 1,
0.322795, 0.1932098, 0.7312449, 0, 0.2078431, 1, 1,
0.3234715, -1.253811, 4.666996, 0, 0.2039216, 1, 1,
0.3245661, 0.36855, -0.02289008, 0, 0.1960784, 1, 1,
0.3252603, 0.4342993, 1.648698, 0, 0.1882353, 1, 1,
0.3350371, 1.689535, -0.6636109, 0, 0.1843137, 1, 1,
0.3384835, 0.1877874, 1.41501, 0, 0.1764706, 1, 1,
0.3384957, -1.751513, 3.611868, 0, 0.172549, 1, 1,
0.3407042, -0.8609396, 1.578396, 0, 0.1647059, 1, 1,
0.34727, 0.3818412, 3.169437, 0, 0.1607843, 1, 1,
0.3481954, -0.09057576, 1.638014, 0, 0.1529412, 1, 1,
0.3494505, -0.4887367, 2.900636, 0, 0.1490196, 1, 1,
0.3495713, 0.7734789, -0.4346143, 0, 0.1411765, 1, 1,
0.3495978, 0.509542, -0.2427966, 0, 0.1372549, 1, 1,
0.3506892, 0.3696722, -0.7687228, 0, 0.1294118, 1, 1,
0.3519848, -0.2257604, 2.33914, 0, 0.1254902, 1, 1,
0.3540449, 2.0803, -0.5413026, 0, 0.1176471, 1, 1,
0.3666034, -0.3422398, 2.140856, 0, 0.1137255, 1, 1,
0.3691646, 0.398784, 0.7725627, 0, 0.1058824, 1, 1,
0.3732012, -0.0496374, 2.008085, 0, 0.09803922, 1, 1,
0.3747376, -0.6203006, 0.2896317, 0, 0.09411765, 1, 1,
0.3749346, 0.5182903, -0.006956371, 0, 0.08627451, 1, 1,
0.377765, 0.5073485, -0.6327522, 0, 0.08235294, 1, 1,
0.3782915, 0.430317, -0.4948504, 0, 0.07450981, 1, 1,
0.3814621, -0.8241171, 5.575041, 0, 0.07058824, 1, 1,
0.3815389, 2.027274, 0.890165, 0, 0.0627451, 1, 1,
0.3851802, 0.1823835, 1.429469, 0, 0.05882353, 1, 1,
0.3857127, 0.2747272, 1.897525, 0, 0.05098039, 1, 1,
0.3871697, -0.1885616, 2.048867, 0, 0.04705882, 1, 1,
0.3919268, 0.5719199, 0.1376597, 0, 0.03921569, 1, 1,
0.3942329, 0.7475892, 0.5746933, 0, 0.03529412, 1, 1,
0.3954952, -0.3427528, 2.653087, 0, 0.02745098, 1, 1,
0.3957683, 1.672183, 1.29682, 0, 0.02352941, 1, 1,
0.3958766, 0.5814276, -0.8699669, 0, 0.01568628, 1, 1,
0.397137, -1.148003, 4.181993, 0, 0.01176471, 1, 1,
0.3984472, -0.7143977, 2.20422, 0, 0.003921569, 1, 1,
0.3999843, -0.5975405, 3.374046, 0.003921569, 0, 1, 1,
0.4071722, -1.414173, 3.703598, 0.007843138, 0, 1, 1,
0.4080973, 1.093928, -0.1263465, 0.01568628, 0, 1, 1,
0.41276, -0.6355343, 0.1402311, 0.01960784, 0, 1, 1,
0.4148888, 1.379794, 0.5193598, 0.02745098, 0, 1, 1,
0.4148901, -0.9577778, 2.982131, 0.03137255, 0, 1, 1,
0.4164813, 0.2377039, 0.4830524, 0.03921569, 0, 1, 1,
0.4171878, 0.01876163, 0.6401201, 0.04313726, 0, 1, 1,
0.4172528, 0.3156228, 1.730882, 0.05098039, 0, 1, 1,
0.4278249, 0.7825283, -0.3912421, 0.05490196, 0, 1, 1,
0.4282765, 0.2244901, 2.438358, 0.0627451, 0, 1, 1,
0.4331464, -0.1141241, 2.414223, 0.06666667, 0, 1, 1,
0.4332316, 1.058505, 0.5941821, 0.07450981, 0, 1, 1,
0.4339072, -1.360606, 3.765234, 0.07843138, 0, 1, 1,
0.4349653, 0.5821031, 1.490806, 0.08627451, 0, 1, 1,
0.4353093, -0.2275198, 2.137232, 0.09019608, 0, 1, 1,
0.4374482, 1.948562, 0.9634408, 0.09803922, 0, 1, 1,
0.442985, -0.7339597, 2.486921, 0.1058824, 0, 1, 1,
0.4444011, -0.08586805, 1.928208, 0.1098039, 0, 1, 1,
0.4456421, 0.2424655, 0.7066255, 0.1176471, 0, 1, 1,
0.4627486, -1.039227, 3.517687, 0.1215686, 0, 1, 1,
0.4638312, -2.083149, 2.544181, 0.1294118, 0, 1, 1,
0.4726169, 0.7529186, 0.1753066, 0.1333333, 0, 1, 1,
0.4758285, -0.7698051, 3.444998, 0.1411765, 0, 1, 1,
0.4765236, 0.9999822, 1.107618, 0.145098, 0, 1, 1,
0.4780135, -0.4058133, 0.6746707, 0.1529412, 0, 1, 1,
0.4805476, 1.371262, 0.4661907, 0.1568628, 0, 1, 1,
0.4811726, 0.4818703, 0.08729536, 0.1647059, 0, 1, 1,
0.4822705, -0.5039609, 2.648412, 0.1686275, 0, 1, 1,
0.4846371, -1.416143, 3.001303, 0.1764706, 0, 1, 1,
0.4851414, 0.7439634, -0.6094097, 0.1803922, 0, 1, 1,
0.4890977, -0.3580074, 1.497057, 0.1882353, 0, 1, 1,
0.4898221, -0.5736387, 2.082917, 0.1921569, 0, 1, 1,
0.4900539, -0.7328659, 3.041249, 0.2, 0, 1, 1,
0.4940084, 1.561116, -0.5346388, 0.2078431, 0, 1, 1,
0.4984326, -0.7021658, 2.448921, 0.2117647, 0, 1, 1,
0.4996909, 0.1045914, 2.363474, 0.2196078, 0, 1, 1,
0.504196, 0.2225955, 2.580587, 0.2235294, 0, 1, 1,
0.5059012, 0.02139053, 1.920315, 0.2313726, 0, 1, 1,
0.507831, -0.3005136, 3.113029, 0.2352941, 0, 1, 1,
0.5100016, -0.5053399, 3.191734, 0.2431373, 0, 1, 1,
0.5119945, 0.1166824, 0.5620917, 0.2470588, 0, 1, 1,
0.5147097, 0.3441189, 1.854101, 0.254902, 0, 1, 1,
0.5181839, 0.05488709, 2.417441, 0.2588235, 0, 1, 1,
0.5188678, 1.284816, 1.708499, 0.2666667, 0, 1, 1,
0.5247728, 1.54941, -0.1029902, 0.2705882, 0, 1, 1,
0.5348669, 0.01228644, 1.82986, 0.2784314, 0, 1, 1,
0.5364211, 1.599071, -0.4803077, 0.282353, 0, 1, 1,
0.5396988, -1.156696, 3.600671, 0.2901961, 0, 1, 1,
0.5398774, -0.5379071, 3.061356, 0.2941177, 0, 1, 1,
0.5431905, 2.019923, 0.4135796, 0.3019608, 0, 1, 1,
0.5463493, 0.8538164, 0.04915386, 0.3098039, 0, 1, 1,
0.5503256, 0.6617004, 0.9519982, 0.3137255, 0, 1, 1,
0.5539034, -1.625215, 3.098666, 0.3215686, 0, 1, 1,
0.5554668, -1.582678, 2.434896, 0.3254902, 0, 1, 1,
0.5562338, 0.9347408, 0.4738339, 0.3333333, 0, 1, 1,
0.5600144, -0.713416, 3.035079, 0.3372549, 0, 1, 1,
0.560674, 0.8712346, 0.5419756, 0.345098, 0, 1, 1,
0.5607263, 0.1488918, 0.4678805, 0.3490196, 0, 1, 1,
0.5611466, 0.6924424, 0.5526917, 0.3568628, 0, 1, 1,
0.5640244, 1.907298, 1.178561, 0.3607843, 0, 1, 1,
0.5650914, 0.1973714, 1.401232, 0.3686275, 0, 1, 1,
0.5659666, -1.124761, 2.774714, 0.372549, 0, 1, 1,
0.5659925, 1.037953, -0.4519521, 0.3803922, 0, 1, 1,
0.5663989, 0.1759301, 0.83636, 0.3843137, 0, 1, 1,
0.5756686, 0.9480013, -0.5807406, 0.3921569, 0, 1, 1,
0.5813947, -0.7310864, 1.267184, 0.3960784, 0, 1, 1,
0.5825745, -0.5495338, 1.266873, 0.4039216, 0, 1, 1,
0.5842855, 0.986711, 0.808777, 0.4117647, 0, 1, 1,
0.5846689, 0.8358505, 0.1419994, 0.4156863, 0, 1, 1,
0.5867281, 0.569142, 1.649674, 0.4235294, 0, 1, 1,
0.5868835, 0.6693037, -0.5421385, 0.427451, 0, 1, 1,
0.5919508, 1.383854, -0.2170904, 0.4352941, 0, 1, 1,
0.5925056, -1.062332, 4.571781, 0.4392157, 0, 1, 1,
0.5959718, 0.4476658, 1.928896, 0.4470588, 0, 1, 1,
0.600215, -0.3744936, 3.855422, 0.4509804, 0, 1, 1,
0.6007491, -1.153674, 2.405006, 0.4588235, 0, 1, 1,
0.604247, 0.1531733, 0.784754, 0.4627451, 0, 1, 1,
0.6051942, 0.2204383, 1.548158, 0.4705882, 0, 1, 1,
0.6060817, 0.3631801, 0.5306174, 0.4745098, 0, 1, 1,
0.612997, 0.478523, 2.453306, 0.4823529, 0, 1, 1,
0.6149923, 0.8560462, 1.23434, 0.4862745, 0, 1, 1,
0.6161702, 0.1459825, 0.6724063, 0.4941176, 0, 1, 1,
0.6173302, -0.9921172, 4.630288, 0.5019608, 0, 1, 1,
0.6217956, -0.3619302, 1.461149, 0.5058824, 0, 1, 1,
0.6226327, -0.2375383, 2.13853, 0.5137255, 0, 1, 1,
0.628498, -0.7826812, 0.7314024, 0.5176471, 0, 1, 1,
0.6334075, -0.8387311, 3.626974, 0.5254902, 0, 1, 1,
0.6379852, -0.1990181, 1.411292, 0.5294118, 0, 1, 1,
0.6408826, 0.09106532, 2.049224, 0.5372549, 0, 1, 1,
0.6438718, -2.38126, 0.8187206, 0.5411765, 0, 1, 1,
0.6527339, 0.6346366, -1.19892, 0.5490196, 0, 1, 1,
0.6568327, 0.9698715, 2.701437, 0.5529412, 0, 1, 1,
0.6618596, 1.017946, 1.132633, 0.5607843, 0, 1, 1,
0.6694761, 0.4364057, 0.258121, 0.5647059, 0, 1, 1,
0.6702889, -1.75251, 2.335355, 0.572549, 0, 1, 1,
0.6772615, -0.3171715, 1.487256, 0.5764706, 0, 1, 1,
0.6775429, -0.1936065, 1.508271, 0.5843138, 0, 1, 1,
0.693502, 0.1925596, 1.986406, 0.5882353, 0, 1, 1,
0.6983563, 0.6625132, 1.982976, 0.5960785, 0, 1, 1,
0.7015349, 0.09564276, 1.508753, 0.6039216, 0, 1, 1,
0.7048854, -0.2103654, 3.892163, 0.6078432, 0, 1, 1,
0.7074344, 1.123769, -0.7842273, 0.6156863, 0, 1, 1,
0.7079446, 0.06200838, 2.87949, 0.6196079, 0, 1, 1,
0.7098235, 0.9449981, 0.02539338, 0.627451, 0, 1, 1,
0.7107742, -1.401547, 2.414171, 0.6313726, 0, 1, 1,
0.7121886, 0.04436374, 3.277184, 0.6392157, 0, 1, 1,
0.7203165, -1.398767, 2.358538, 0.6431373, 0, 1, 1,
0.7225915, 0.9113564, 4.114495, 0.6509804, 0, 1, 1,
0.7247598, 1.897525, 0.260446, 0.654902, 0, 1, 1,
0.7257477, -1.483783, 1.536096, 0.6627451, 0, 1, 1,
0.7264113, -0.8708427, 3.216799, 0.6666667, 0, 1, 1,
0.7275639, -1.127091, 1.688374, 0.6745098, 0, 1, 1,
0.7307009, -0.6280684, 4.891665, 0.6784314, 0, 1, 1,
0.7308799, 0.1738989, 1.086834, 0.6862745, 0, 1, 1,
0.736831, -2.693829, 1.11559, 0.6901961, 0, 1, 1,
0.7370428, 0.03413589, 1.560074, 0.6980392, 0, 1, 1,
0.7429957, -0.8227643, 3.119077, 0.7058824, 0, 1, 1,
0.7438045, -0.2957258, 2.922425, 0.7098039, 0, 1, 1,
0.7538226, 0.5316783, -0.9767141, 0.7176471, 0, 1, 1,
0.7546856, 0.4658774, 1.927112, 0.7215686, 0, 1, 1,
0.7606791, 1.045477, 1.569397, 0.7294118, 0, 1, 1,
0.7654125, 0.4522839, 1.168858, 0.7333333, 0, 1, 1,
0.7741796, 0.8484693, 2.937221, 0.7411765, 0, 1, 1,
0.7782492, -0.2035132, 1.200153, 0.7450981, 0, 1, 1,
0.7787486, -0.797447, 3.406997, 0.7529412, 0, 1, 1,
0.7816192, -0.625791, 1.24967, 0.7568628, 0, 1, 1,
0.7937208, 0.3458778, 3.779858, 0.7647059, 0, 1, 1,
0.7963222, -2.338758, 3.13622, 0.7686275, 0, 1, 1,
0.8093674, -0.3236126, 1.375424, 0.7764706, 0, 1, 1,
0.8106387, 0.486887, 1.111902, 0.7803922, 0, 1, 1,
0.8161715, -1.456875, 2.643831, 0.7882353, 0, 1, 1,
0.8318637, 0.433221, -1.924213, 0.7921569, 0, 1, 1,
0.8320934, 2.29212, -0.7267849, 0.8, 0, 1, 1,
0.833052, -0.119603, 0.9587292, 0.8078431, 0, 1, 1,
0.8388556, -0.9333066, 1.503353, 0.8117647, 0, 1, 1,
0.8388858, 0.222821, 1.425046, 0.8196079, 0, 1, 1,
0.8414779, -1.104346, 2.668991, 0.8235294, 0, 1, 1,
0.8443403, -0.6109875, 3.621262, 0.8313726, 0, 1, 1,
0.8472213, 0.6938355, 0.5711864, 0.8352941, 0, 1, 1,
0.8527647, -0.07604956, 3.174681, 0.8431373, 0, 1, 1,
0.8603066, -0.5134825, 1.002143, 0.8470588, 0, 1, 1,
0.8645844, 0.02812598, 0.4462311, 0.854902, 0, 1, 1,
0.8657918, -1.025035, 1.709225, 0.8588235, 0, 1, 1,
0.86637, 0.2715712, 2.225674, 0.8666667, 0, 1, 1,
0.8688591, 1.556042, 0.5784736, 0.8705882, 0, 1, 1,
0.8736853, -2.449845, 3.989089, 0.8784314, 0, 1, 1,
0.8794854, -0.3486998, 3.119649, 0.8823529, 0, 1, 1,
0.8850886, -0.8794399, 1.384409, 0.8901961, 0, 1, 1,
0.8883585, 1.504904, 0.1350985, 0.8941177, 0, 1, 1,
0.889218, 0.0576045, 3.00754, 0.9019608, 0, 1, 1,
0.8898407, 2.594426, 1.768105, 0.9098039, 0, 1, 1,
0.8941901, 0.3863392, 1.119743, 0.9137255, 0, 1, 1,
0.8968311, 1.107599, 0.920212, 0.9215686, 0, 1, 1,
0.8973267, 0.8064587, 0.7279481, 0.9254902, 0, 1, 1,
0.897876, 1.941574, -0.5818773, 0.9333333, 0, 1, 1,
0.9040951, 0.7065257, 0.5223725, 0.9372549, 0, 1, 1,
0.9096373, 0.2413897, 1.154268, 0.945098, 0, 1, 1,
0.9101178, -0.3605062, 2.543119, 0.9490196, 0, 1, 1,
0.9116017, 0.1888615, 2.599018, 0.9568627, 0, 1, 1,
0.9197427, 0.023015, 2.301223, 0.9607843, 0, 1, 1,
0.9216518, 1.081344, -0.09809415, 0.9686275, 0, 1, 1,
0.9272373, -2.233187, 2.48698, 0.972549, 0, 1, 1,
0.9283195, 2.158345, -0.2352983, 0.9803922, 0, 1, 1,
0.9298634, -0.5061676, 1.341006, 0.9843137, 0, 1, 1,
0.9327583, 2.092565, 1.309448, 0.9921569, 0, 1, 1,
0.9375994, 0.2281687, 1.046409, 0.9960784, 0, 1, 1,
0.9397335, -0.8166367, 1.311188, 1, 0, 0.9960784, 1,
0.9399302, -0.4751788, 2.246547, 1, 0, 0.9882353, 1,
0.9435206, 0.009422204, 2.328108, 1, 0, 0.9843137, 1,
0.9513545, -0.532885, 1.429636, 1, 0, 0.9764706, 1,
0.9537797, -1.42037, 2.661159, 1, 0, 0.972549, 1,
0.9624833, -0.5809252, 1.108515, 1, 0, 0.9647059, 1,
0.9640982, 0.1120508, 2.033254, 1, 0, 0.9607843, 1,
0.9706972, -0.2168096, 2.277089, 1, 0, 0.9529412, 1,
0.9722217, -0.7554963, 0.8702111, 1, 0, 0.9490196, 1,
0.9762696, 0.4446271, 0.5894777, 1, 0, 0.9411765, 1,
0.9782593, -0.461202, 1.922809, 1, 0, 0.9372549, 1,
0.984268, 0.05818703, 1.072521, 1, 0, 0.9294118, 1,
0.9859085, -0.2250646, 0.8954764, 1, 0, 0.9254902, 1,
0.9866921, -0.1990666, 1.774397, 1, 0, 0.9176471, 1,
0.9923717, -0.5757654, 2.109196, 1, 0, 0.9137255, 1,
0.9942986, 0.5567944, 0.9467246, 1, 0, 0.9058824, 1,
0.9952911, -0.933475, 2.234821, 1, 0, 0.9019608, 1,
0.9976162, -0.04406977, 1.017593, 1, 0, 0.8941177, 1,
1.014048, 0.2508355, 1.92609, 1, 0, 0.8862745, 1,
1.015418, 1.461637, -0.8036996, 1, 0, 0.8823529, 1,
1.015478, 0.8028091, 1.490837, 1, 0, 0.8745098, 1,
1.018602, 2.220796, 0.1863631, 1, 0, 0.8705882, 1,
1.020145, -0.1946059, 1.799569, 1, 0, 0.8627451, 1,
1.02146, -0.4275554, 2.020453, 1, 0, 0.8588235, 1,
1.024387, -1.290547, 1.332958, 1, 0, 0.8509804, 1,
1.028492, 1.36727, 0.0180307, 1, 0, 0.8470588, 1,
1.032858, -1.133501, 2.341149, 1, 0, 0.8392157, 1,
1.03441, -0.2023878, 2.242459, 1, 0, 0.8352941, 1,
1.034672, 0.001376984, 1.789944, 1, 0, 0.827451, 1,
1.0379, -1.527643, 2.212792, 1, 0, 0.8235294, 1,
1.041439, -0.00784976, 2.635246, 1, 0, 0.8156863, 1,
1.056862, -1.199355, 3.009156, 1, 0, 0.8117647, 1,
1.057272, 0.8346561, 0.8076669, 1, 0, 0.8039216, 1,
1.063377, 1.245263, 1.523744, 1, 0, 0.7960784, 1,
1.071086, 1.102972, -0.8553199, 1, 0, 0.7921569, 1,
1.083134, 1.227311, 0.2582164, 1, 0, 0.7843137, 1,
1.08503, 0.185818, -0.2178686, 1, 0, 0.7803922, 1,
1.089076, 0.3181137, 2.986943, 1, 0, 0.772549, 1,
1.091692, -0.7271864, 2.819419, 1, 0, 0.7686275, 1,
1.105482, -0.7170843, 1.779118, 1, 0, 0.7607843, 1,
1.113221, -0.008202574, 1.74194, 1, 0, 0.7568628, 1,
1.121289, -1.608731, 2.538367, 1, 0, 0.7490196, 1,
1.121838, -1.80467, -1.040099, 1, 0, 0.7450981, 1,
1.122354, 2.24711, 0.2136635, 1, 0, 0.7372549, 1,
1.134512, 1.89974, -0.1830931, 1, 0, 0.7333333, 1,
1.136602, 1.468396, -0.4393508, 1, 0, 0.7254902, 1,
1.145575, 0.8818194, 0.7025781, 1, 0, 0.7215686, 1,
1.150037, 0.3476332, 0.4160838, 1, 0, 0.7137255, 1,
1.159841, -0.1161363, 3.302764, 1, 0, 0.7098039, 1,
1.159968, -0.3488773, 1.653074, 1, 0, 0.7019608, 1,
1.168476, -1.748366, 3.494815, 1, 0, 0.6941177, 1,
1.171313, 0.09487467, 2.174753, 1, 0, 0.6901961, 1,
1.172184, 0.2427787, 2.173855, 1, 0, 0.682353, 1,
1.181624, -1.009159, 1.428786, 1, 0, 0.6784314, 1,
1.187677, -0.2857821, 1.632662, 1, 0, 0.6705883, 1,
1.195062, -0.1685265, 2.616246, 1, 0, 0.6666667, 1,
1.198336, -1.602454, 2.810435, 1, 0, 0.6588235, 1,
1.201632, -1.271559, 1.350479, 1, 0, 0.654902, 1,
1.201933, 0.3140865, 1.785203, 1, 0, 0.6470588, 1,
1.216984, -2.309082, 2.344313, 1, 0, 0.6431373, 1,
1.218718, -0.860933, 2.059244, 1, 0, 0.6352941, 1,
1.234664, -1.37684, 3.237851, 1, 0, 0.6313726, 1,
1.237231, 1.098819, 0.9538978, 1, 0, 0.6235294, 1,
1.240181, -0.6543282, 0.9627659, 1, 0, 0.6196079, 1,
1.241028, 1.383659, 2.30574, 1, 0, 0.6117647, 1,
1.247081, 1.65, 0.3042508, 1, 0, 0.6078432, 1,
1.252379, 0.205751, 2.119494, 1, 0, 0.6, 1,
1.256633, -0.5419239, 0.2797071, 1, 0, 0.5921569, 1,
1.256954, -0.06741896, 1.36576, 1, 0, 0.5882353, 1,
1.261374, 0.7991585, 1.101779, 1, 0, 0.5803922, 1,
1.264334, -0.6359273, 1.356234, 1, 0, 0.5764706, 1,
1.265892, 1.251166, 0.00580574, 1, 0, 0.5686275, 1,
1.271129, -0.06558281, 1.893516, 1, 0, 0.5647059, 1,
1.291109, 0.7978303, 0.5886248, 1, 0, 0.5568628, 1,
1.297275, -1.720054, 3.245654, 1, 0, 0.5529412, 1,
1.313006, 0.7885816, 0.4355172, 1, 0, 0.5450981, 1,
1.31552, 0.3549985, 1.474431, 1, 0, 0.5411765, 1,
1.316525, 1.131099, 1.251322, 1, 0, 0.5333334, 1,
1.320985, -0.5215565, 0.7583388, 1, 0, 0.5294118, 1,
1.328202, -0.0507714, 2.022167, 1, 0, 0.5215687, 1,
1.329192, -0.3565517, 1.04075, 1, 0, 0.5176471, 1,
1.336526, 0.2551461, 1.008591, 1, 0, 0.509804, 1,
1.339107, -1.088092, 2.062282, 1, 0, 0.5058824, 1,
1.340624, -1.380948, 2.887619, 1, 0, 0.4980392, 1,
1.340716, 0.08746666, 1.228787, 1, 0, 0.4901961, 1,
1.348591, -0.5870971, 1.111221, 1, 0, 0.4862745, 1,
1.357811, -0.09782466, 1.592039, 1, 0, 0.4784314, 1,
1.361902, 0.2696213, 2.16421, 1, 0, 0.4745098, 1,
1.381786, -0.317899, 1.017801, 1, 0, 0.4666667, 1,
1.38229, 0.5918649, 1.90114, 1, 0, 0.4627451, 1,
1.386075, -0.1630228, 1.499715, 1, 0, 0.454902, 1,
1.405326, 0.3425839, 0.8727773, 1, 0, 0.4509804, 1,
1.415403, -0.3649091, 1.428049, 1, 0, 0.4431373, 1,
1.432393, -0.06108796, -0.2124376, 1, 0, 0.4392157, 1,
1.437794, 0.2743626, 1.108724, 1, 0, 0.4313726, 1,
1.43859, -1.471237, 2.315863, 1, 0, 0.427451, 1,
1.444957, 1.085995, 2.2465, 1, 0, 0.4196078, 1,
1.462103, 0.5605544, 0.5075986, 1, 0, 0.4156863, 1,
1.465959, -0.1504535, 2.908598, 1, 0, 0.4078431, 1,
1.469656, 0.3975585, 2.462184, 1, 0, 0.4039216, 1,
1.470543, -0.03889603, 3.348001, 1, 0, 0.3960784, 1,
1.479314, 0.112016, -0.6854926, 1, 0, 0.3882353, 1,
1.493217, -0.655344, 0.3216321, 1, 0, 0.3843137, 1,
1.503589, -1.89747, 2.911482, 1, 0, 0.3764706, 1,
1.510438, 0.8028585, 0.02387417, 1, 0, 0.372549, 1,
1.511628, 1.169916, 2.369396, 1, 0, 0.3647059, 1,
1.520724, -1.727294, 3.602886, 1, 0, 0.3607843, 1,
1.523757, 0.6449044, 3.283577, 1, 0, 0.3529412, 1,
1.52726, -0.08711401, 2.156664, 1, 0, 0.3490196, 1,
1.539594, 0.3193976, 1.330628, 1, 0, 0.3411765, 1,
1.553486, 0.573576, 1.42083, 1, 0, 0.3372549, 1,
1.555878, -0.1381394, 0.8481221, 1, 0, 0.3294118, 1,
1.57122, -0.7849324, 3.859753, 1, 0, 0.3254902, 1,
1.582558, -1.291333, 1.447087, 1, 0, 0.3176471, 1,
1.585096, -0.785531, 2.350542, 1, 0, 0.3137255, 1,
1.588449, 0.1223149, -0.896625, 1, 0, 0.3058824, 1,
1.603594, -0.9179437, 2.166787, 1, 0, 0.2980392, 1,
1.606552, -2.021526, 2.552817, 1, 0, 0.2941177, 1,
1.613471, -1.209037, 2.742651, 1, 0, 0.2862745, 1,
1.619924, -0.207591, 1.416848, 1, 0, 0.282353, 1,
1.658044, -1.120983, 2.554956, 1, 0, 0.2745098, 1,
1.664511, 1.582362, 1.71228, 1, 0, 0.2705882, 1,
1.677109, 1.204542, -0.9205447, 1, 0, 0.2627451, 1,
1.686689, -1.26202, 1.246089, 1, 0, 0.2588235, 1,
1.723449, 0.1547261, 1.418085, 1, 0, 0.2509804, 1,
1.750532, 0.4006073, 2.097155, 1, 0, 0.2470588, 1,
1.762693, 0.6344458, 2.12052, 1, 0, 0.2392157, 1,
1.777984, 1.208193, 1.473503, 1, 0, 0.2352941, 1,
1.791269, 0.07481381, 1.177275, 1, 0, 0.227451, 1,
1.797611, -2.191313, 1.621074, 1, 0, 0.2235294, 1,
1.850989, -1.317135, 3.237502, 1, 0, 0.2156863, 1,
1.853497, -0.8502862, 3.466162, 1, 0, 0.2117647, 1,
1.859861, -0.4004826, 2.947736, 1, 0, 0.2039216, 1,
1.88558, 0.6999316, -0.9093568, 1, 0, 0.1960784, 1,
1.886923, -0.9933164, 1.925805, 1, 0, 0.1921569, 1,
1.887356, -0.3245946, 3.380711, 1, 0, 0.1843137, 1,
1.890238, 0.3503296, 1.549968, 1, 0, 0.1803922, 1,
1.893902, 0.2967339, 0.8035281, 1, 0, 0.172549, 1,
1.923715, -0.9031722, 1.169337, 1, 0, 0.1686275, 1,
1.957366, -1.18704, 2.304513, 1, 0, 0.1607843, 1,
2.008934, 0.7188663, 2.057058, 1, 0, 0.1568628, 1,
2.021753, -2.224041, 4.903189, 1, 0, 0.1490196, 1,
2.116227, 0.1326416, 2.441786, 1, 0, 0.145098, 1,
2.141703, -1.43308, 2.490588, 1, 0, 0.1372549, 1,
2.157306, -0.3291123, 0.2914385, 1, 0, 0.1333333, 1,
2.18244, -1.076103, 0.65541, 1, 0, 0.1254902, 1,
2.184013, 0.0692345, 3.383532, 1, 0, 0.1215686, 1,
2.184608, -0.5900881, 0.6723138, 1, 0, 0.1137255, 1,
2.197482, -0.1972681, 0.8930874, 1, 0, 0.1098039, 1,
2.212946, 0.853828, -0.07598042, 1, 0, 0.1019608, 1,
2.377395, -0.1693946, 1.661328, 1, 0, 0.09411765, 1,
2.401612, 2.931493, 0.4347606, 1, 0, 0.09019608, 1,
2.410847, -0.6483003, 2.053309, 1, 0, 0.08235294, 1,
2.478971, -1.644529, 1.985118, 1, 0, 0.07843138, 1,
2.490556, -0.9835057, 2.177413, 1, 0, 0.07058824, 1,
2.506283, 0.3556652, 0.6703683, 1, 0, 0.06666667, 1,
2.509085, -0.7870954, 0.4828633, 1, 0, 0.05882353, 1,
2.647413, -1.094707, 1.006674, 1, 0, 0.05490196, 1,
2.658415, -1.171858, 0.5401067, 1, 0, 0.04705882, 1,
2.662268, 0.4043663, 1.93641, 1, 0, 0.04313726, 1,
2.75728, 0.5785667, 1.201208, 1, 0, 0.03529412, 1,
2.777986, -0.5462092, 1.46373, 1, 0, 0.03137255, 1,
2.823061, 0.2832156, 2.331935, 1, 0, 0.02352941, 1,
2.827067, -2.936678, 3.919535, 1, 0, 0.01960784, 1,
2.900318, 1.16623, 1.469566, 1, 0, 0.01176471, 1,
3.112506, -0.424207, 1.303413, 1, 0, 0.007843138, 1
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
-0.0102886, -4.161489, -7.52555, 0, -0.5, 0.5, 0.5,
-0.0102886, -4.161489, -7.52555, 1, -0.5, 0.5, 0.5,
-0.0102886, -4.161489, -7.52555, 1, 1.5, 0.5, 0.5,
-0.0102886, -4.161489, -7.52555, 0, 1.5, 0.5, 0.5
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
-4.191711, -0.1009921, -7.52555, 0, -0.5, 0.5, 0.5,
-4.191711, -0.1009921, -7.52555, 1, -0.5, 0.5, 0.5,
-4.191711, -0.1009921, -7.52555, 1, 1.5, 0.5, 0.5,
-4.191711, -0.1009921, -7.52555, 0, 1.5, 0.5, 0.5
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
-4.191711, -4.161489, -0.02589607, 0, -0.5, 0.5, 0.5,
-4.191711, -4.161489, -0.02589607, 1, -0.5, 0.5, 0.5,
-4.191711, -4.161489, -0.02589607, 1, 1.5, 0.5, 0.5,
-4.191711, -4.161489, -0.02589607, 0, 1.5, 0.5, 0.5
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
-3, -3.224452, -5.794861,
3, -3.224452, -5.794861,
-3, -3.224452, -5.794861,
-3, -3.380625, -6.083309,
-2, -3.224452, -5.794861,
-2, -3.380625, -6.083309,
-1, -3.224452, -5.794861,
-1, -3.380625, -6.083309,
0, -3.224452, -5.794861,
0, -3.380625, -6.083309,
1, -3.224452, -5.794861,
1, -3.380625, -6.083309,
2, -3.224452, -5.794861,
2, -3.380625, -6.083309,
3, -3.224452, -5.794861,
3, -3.380625, -6.083309
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
-3, -3.692971, -6.660206, 0, -0.5, 0.5, 0.5,
-3, -3.692971, -6.660206, 1, -0.5, 0.5, 0.5,
-3, -3.692971, -6.660206, 1, 1.5, 0.5, 0.5,
-3, -3.692971, -6.660206, 0, 1.5, 0.5, 0.5,
-2, -3.692971, -6.660206, 0, -0.5, 0.5, 0.5,
-2, -3.692971, -6.660206, 1, -0.5, 0.5, 0.5,
-2, -3.692971, -6.660206, 1, 1.5, 0.5, 0.5,
-2, -3.692971, -6.660206, 0, 1.5, 0.5, 0.5,
-1, -3.692971, -6.660206, 0, -0.5, 0.5, 0.5,
-1, -3.692971, -6.660206, 1, -0.5, 0.5, 0.5,
-1, -3.692971, -6.660206, 1, 1.5, 0.5, 0.5,
-1, -3.692971, -6.660206, 0, 1.5, 0.5, 0.5,
0, -3.692971, -6.660206, 0, -0.5, 0.5, 0.5,
0, -3.692971, -6.660206, 1, -0.5, 0.5, 0.5,
0, -3.692971, -6.660206, 1, 1.5, 0.5, 0.5,
0, -3.692971, -6.660206, 0, 1.5, 0.5, 0.5,
1, -3.692971, -6.660206, 0, -0.5, 0.5, 0.5,
1, -3.692971, -6.660206, 1, -0.5, 0.5, 0.5,
1, -3.692971, -6.660206, 1, 1.5, 0.5, 0.5,
1, -3.692971, -6.660206, 0, 1.5, 0.5, 0.5,
2, -3.692971, -6.660206, 0, -0.5, 0.5, 0.5,
2, -3.692971, -6.660206, 1, -0.5, 0.5, 0.5,
2, -3.692971, -6.660206, 1, 1.5, 0.5, 0.5,
2, -3.692971, -6.660206, 0, 1.5, 0.5, 0.5,
3, -3.692971, -6.660206, 0, -0.5, 0.5, 0.5,
3, -3.692971, -6.660206, 1, -0.5, 0.5, 0.5,
3, -3.692971, -6.660206, 1, 1.5, 0.5, 0.5,
3, -3.692971, -6.660206, 0, 1.5, 0.5, 0.5
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
-3.226767, -3, -5.794861,
-3.226767, 2, -5.794861,
-3.226767, -3, -5.794861,
-3.387591, -3, -6.083309,
-3.226767, -2, -5.794861,
-3.387591, -2, -6.083309,
-3.226767, -1, -5.794861,
-3.387591, -1, -6.083309,
-3.226767, 0, -5.794861,
-3.387591, 0, -6.083309,
-3.226767, 1, -5.794861,
-3.387591, 1, -6.083309,
-3.226767, 2, -5.794861,
-3.387591, 2, -6.083309
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
-3.709239, -3, -6.660206, 0, -0.5, 0.5, 0.5,
-3.709239, -3, -6.660206, 1, -0.5, 0.5, 0.5,
-3.709239, -3, -6.660206, 1, 1.5, 0.5, 0.5,
-3.709239, -3, -6.660206, 0, 1.5, 0.5, 0.5,
-3.709239, -2, -6.660206, 0, -0.5, 0.5, 0.5,
-3.709239, -2, -6.660206, 1, -0.5, 0.5, 0.5,
-3.709239, -2, -6.660206, 1, 1.5, 0.5, 0.5,
-3.709239, -2, -6.660206, 0, 1.5, 0.5, 0.5,
-3.709239, -1, -6.660206, 0, -0.5, 0.5, 0.5,
-3.709239, -1, -6.660206, 1, -0.5, 0.5, 0.5,
-3.709239, -1, -6.660206, 1, 1.5, 0.5, 0.5,
-3.709239, -1, -6.660206, 0, 1.5, 0.5, 0.5,
-3.709239, 0, -6.660206, 0, -0.5, 0.5, 0.5,
-3.709239, 0, -6.660206, 1, -0.5, 0.5, 0.5,
-3.709239, 0, -6.660206, 1, 1.5, 0.5, 0.5,
-3.709239, 0, -6.660206, 0, 1.5, 0.5, 0.5,
-3.709239, 1, -6.660206, 0, -0.5, 0.5, 0.5,
-3.709239, 1, -6.660206, 1, -0.5, 0.5, 0.5,
-3.709239, 1, -6.660206, 1, 1.5, 0.5, 0.5,
-3.709239, 1, -6.660206, 0, 1.5, 0.5, 0.5,
-3.709239, 2, -6.660206, 0, -0.5, 0.5, 0.5,
-3.709239, 2, -6.660206, 1, -0.5, 0.5, 0.5,
-3.709239, 2, -6.660206, 1, 1.5, 0.5, 0.5,
-3.709239, 2, -6.660206, 0, 1.5, 0.5, 0.5
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
-3.226767, -3.224452, -4,
-3.226767, -3.224452, 4,
-3.226767, -3.224452, -4,
-3.387591, -3.380625, -4,
-3.226767, -3.224452, -2,
-3.387591, -3.380625, -2,
-3.226767, -3.224452, 0,
-3.387591, -3.380625, 0,
-3.226767, -3.224452, 2,
-3.387591, -3.380625, 2,
-3.226767, -3.224452, 4,
-3.387591, -3.380625, 4
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
-3.709239, -3.692971, -4, 0, -0.5, 0.5, 0.5,
-3.709239, -3.692971, -4, 1, -0.5, 0.5, 0.5,
-3.709239, -3.692971, -4, 1, 1.5, 0.5, 0.5,
-3.709239, -3.692971, -4, 0, 1.5, 0.5, 0.5,
-3.709239, -3.692971, -2, 0, -0.5, 0.5, 0.5,
-3.709239, -3.692971, -2, 1, -0.5, 0.5, 0.5,
-3.709239, -3.692971, -2, 1, 1.5, 0.5, 0.5,
-3.709239, -3.692971, -2, 0, 1.5, 0.5, 0.5,
-3.709239, -3.692971, 0, 0, -0.5, 0.5, 0.5,
-3.709239, -3.692971, 0, 1, -0.5, 0.5, 0.5,
-3.709239, -3.692971, 0, 1, 1.5, 0.5, 0.5,
-3.709239, -3.692971, 0, 0, 1.5, 0.5, 0.5,
-3.709239, -3.692971, 2, 0, -0.5, 0.5, 0.5,
-3.709239, -3.692971, 2, 1, -0.5, 0.5, 0.5,
-3.709239, -3.692971, 2, 1, 1.5, 0.5, 0.5,
-3.709239, -3.692971, 2, 0, 1.5, 0.5, 0.5,
-3.709239, -3.692971, 4, 0, -0.5, 0.5, 0.5,
-3.709239, -3.692971, 4, 1, -0.5, 0.5, 0.5,
-3.709239, -3.692971, 4, 1, 1.5, 0.5, 0.5,
-3.709239, -3.692971, 4, 0, 1.5, 0.5, 0.5
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
-3.226767, -3.224452, -5.794861,
-3.226767, 3.022467, -5.794861,
-3.226767, -3.224452, 5.743069,
-3.226767, 3.022467, 5.743069,
-3.226767, -3.224452, -5.794861,
-3.226767, -3.224452, 5.743069,
-3.226767, 3.022467, -5.794861,
-3.226767, 3.022467, 5.743069,
-3.226767, -3.224452, -5.794861,
3.20619, -3.224452, -5.794861,
-3.226767, -3.224452, 5.743069,
3.20619, -3.224452, 5.743069,
-3.226767, 3.022467, -5.794861,
3.20619, 3.022467, -5.794861,
-3.226767, 3.022467, 5.743069,
3.20619, 3.022467, 5.743069,
3.20619, -3.224452, -5.794861,
3.20619, 3.022467, -5.794861,
3.20619, -3.224452, 5.743069,
3.20619, 3.022467, 5.743069,
3.20619, -3.224452, -5.794861,
3.20619, -3.224452, 5.743069,
3.20619, 3.022467, -5.794861,
3.20619, 3.022467, 5.743069
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
var radius = 7.802894;
var distance = 34.71595;
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
mvMatrix.translate( 0.0102886, 0.1009921, 0.02589607 );
mvMatrix.scale( 1.311472, 1.350528, 0.7312093 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.71595);
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
toluate_tert-butyl<-read.table("toluate_tert-butyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-toluate_tert-butyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'toluate_tert' not found
```

```r
y<-toluate_tert-butyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'toluate_tert' not found
```

```r
z<-toluate_tert-butyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'toluate_tert' not found
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
-3.133083, 0.6355777, -1.128994, 0, 0, 1, 1, 1,
-3.031923, 0.3659748, -0.1680449, 1, 0, 0, 1, 1,
-2.735966, 1.060987, -0.8176886, 1, 0, 0, 1, 1,
-2.615492, -0.9800919, -1.265771, 1, 0, 0, 1, 1,
-2.472814, -0.1034758, -3.310829, 1, 0, 0, 1, 1,
-2.471695, 1.074612, 0.8521528, 1, 0, 0, 1, 1,
-2.439821, -0.4975063, -2.858535, 0, 0, 0, 1, 1,
-2.430992, -0.3376248, -0.6845386, 0, 0, 0, 1, 1,
-2.405164, -1.030798, -1.901198, 0, 0, 0, 1, 1,
-2.365698, 0.6859963, -0.6519016, 0, 0, 0, 1, 1,
-2.31985, 0.1263367, -1.413752, 0, 0, 0, 1, 1,
-2.244885, 1.237051, -1.619009, 0, 0, 0, 1, 1,
-2.237721, 0.505265, -2.338217, 0, 0, 0, 1, 1,
-2.219397, 1.069495, -0.06569126, 1, 1, 1, 1, 1,
-2.176041, 0.114494, -1.79389, 1, 1, 1, 1, 1,
-2.16235, -1.098099, -0.1594315, 1, 1, 1, 1, 1,
-2.141098, 0.9208108, -1.309989, 1, 1, 1, 1, 1,
-2.126605, -0.007532929, -2.580226, 1, 1, 1, 1, 1,
-2.123862, 0.7774861, -2.531403, 1, 1, 1, 1, 1,
-2.085629, 0.5361871, -1.617287, 1, 1, 1, 1, 1,
-2.049073, 0.9122466, -0.9967239, 1, 1, 1, 1, 1,
-1.9519, 0.3005037, -1.46152, 1, 1, 1, 1, 1,
-1.951551, -0.6466036, -1.732476, 1, 1, 1, 1, 1,
-1.936722, -0.5740515, -2.540449, 1, 1, 1, 1, 1,
-1.928769, -1.59825, -0.9324008, 1, 1, 1, 1, 1,
-1.912525, -0.002751253, -1.057451, 1, 1, 1, 1, 1,
-1.880942, 0.9939196, -3.379387, 1, 1, 1, 1, 1,
-1.864667, 1.820829, -1.801751, 1, 1, 1, 1, 1,
-1.858168, 0.7360656, -1.159476, 0, 0, 1, 1, 1,
-1.842186, -1.307361, -1.501663, 1, 0, 0, 1, 1,
-1.823905, -1.561554, -1.687314, 1, 0, 0, 1, 1,
-1.821362, 1.530213, -2.57032, 1, 0, 0, 1, 1,
-1.796515, -0.1290675, -2.088649, 1, 0, 0, 1, 1,
-1.771691, 1.413779, 1.120199, 1, 0, 0, 1, 1,
-1.76221, 0.4689463, -2.903124, 0, 0, 0, 1, 1,
-1.761844, -0.8858916, -0.495177, 0, 0, 0, 1, 1,
-1.759942, 1.267024, 0.5259856, 0, 0, 0, 1, 1,
-1.758979, 2.793977, -0.64858, 0, 0, 0, 1, 1,
-1.716116, 0.0699836, -2.210124, 0, 0, 0, 1, 1,
-1.707483, -0.6295379, -3.253769, 0, 0, 0, 1, 1,
-1.702395, 1.465547, -1.431128, 0, 0, 0, 1, 1,
-1.678779, 0.4322443, -1.56794, 1, 1, 1, 1, 1,
-1.667174, 1.517665, 0.1735642, 1, 1, 1, 1, 1,
-1.640682, -1.154647, -0.9627711, 1, 1, 1, 1, 1,
-1.594716, -0.1307779, -2.179861, 1, 1, 1, 1, 1,
-1.583444, -0.1956008, -0.104691, 1, 1, 1, 1, 1,
-1.54204, -0.4432007, -3.541299, 1, 1, 1, 1, 1,
-1.539894, 1.124917, -1.055709, 1, 1, 1, 1, 1,
-1.528382, 0.3495037, -0.7329774, 1, 1, 1, 1, 1,
-1.496424, -0.02027145, 0.3685501, 1, 1, 1, 1, 1,
-1.49107, 1.362496, 0.03716301, 1, 1, 1, 1, 1,
-1.489538, -0.6893011, -1.702744, 1, 1, 1, 1, 1,
-1.487424, 0.06963097, -0.5271312, 1, 1, 1, 1, 1,
-1.487138, 1.388072, 0.375088, 1, 1, 1, 1, 1,
-1.465778, 0.3112734, -0.7372018, 1, 1, 1, 1, 1,
-1.45149, -0.2548466, -1.59036, 1, 1, 1, 1, 1,
-1.440667, -0.9804347, -2.20875, 0, 0, 1, 1, 1,
-1.426813, 0.7984095, -1.289221, 1, 0, 0, 1, 1,
-1.425849, 0.4230817, -1.70089, 1, 0, 0, 1, 1,
-1.417278, 1.750399, 0.9257778, 1, 0, 0, 1, 1,
-1.415976, -0.2730296, -1.799841, 1, 0, 0, 1, 1,
-1.411412, -1.349222, -0.3625836, 1, 0, 0, 1, 1,
-1.403736, -0.9339414, -2.573634, 0, 0, 0, 1, 1,
-1.396958, 1.708052, -1.477374, 0, 0, 0, 1, 1,
-1.391631, 0.724126, -1.867447, 0, 0, 0, 1, 1,
-1.390661, 1.097012, -0.6464592, 0, 0, 0, 1, 1,
-1.357565, 1.673002, -0.08419975, 0, 0, 0, 1, 1,
-1.354641, 0.111192, 0.08926074, 0, 0, 0, 1, 1,
-1.344647, 0.101035, -1.528104, 0, 0, 0, 1, 1,
-1.32962, 2.181409, 0.592516, 1, 1, 1, 1, 1,
-1.317291, 0.6475228, -1.738373, 1, 1, 1, 1, 1,
-1.304448, -0.2355357, -1.849272, 1, 1, 1, 1, 1,
-1.304282, -0.08357646, -1.595547, 1, 1, 1, 1, 1,
-1.292809, -1.757152, -1.631454, 1, 1, 1, 1, 1,
-1.276572, 0.6519334, -0.4691388, 1, 1, 1, 1, 1,
-1.276226, -1.309598, -2.018255, 1, 1, 1, 1, 1,
-1.270039, -0.3166133, -0.6862863, 1, 1, 1, 1, 1,
-1.266207, 0.2769778, -1.769543, 1, 1, 1, 1, 1,
-1.256833, -0.6641908, -2.376516, 1, 1, 1, 1, 1,
-1.256624, -0.570293, -1.208371, 1, 1, 1, 1, 1,
-1.251029, 0.4831632, -0.6121485, 1, 1, 1, 1, 1,
-1.240405, -1.451305, -2.432683, 1, 1, 1, 1, 1,
-1.239241, 0.4607854, -4.015317, 1, 1, 1, 1, 1,
-1.235355, -0.3030505, -3.193722, 1, 1, 1, 1, 1,
-1.23132, -2.734711, -2.71356, 0, 0, 1, 1, 1,
-1.199444, 2.270583, 1.515733, 1, 0, 0, 1, 1,
-1.195077, -0.839349, -3.505226, 1, 0, 0, 1, 1,
-1.185005, 1.131076, -0.3195234, 1, 0, 0, 1, 1,
-1.183675, 0.122267, 0.09393331, 1, 0, 0, 1, 1,
-1.182022, 0.7886379, -3.17415, 1, 0, 0, 1, 1,
-1.180779, 0.3992297, -1.877768, 0, 0, 0, 1, 1,
-1.174792, 0.8349403, -1.017727, 0, 0, 0, 1, 1,
-1.167236, -1.049484, -1.764084, 0, 0, 0, 1, 1,
-1.162732, 0.007180606, -1.668915, 0, 0, 0, 1, 1,
-1.153696, -0.7558252, -1.936271, 0, 0, 0, 1, 1,
-1.153457, -0.9026226, -1.149019, 0, 0, 0, 1, 1,
-1.150004, 1.682085, -2.167018, 0, 0, 0, 1, 1,
-1.149755, -1.179472, -0.9484873, 1, 1, 1, 1, 1,
-1.14797, -1.847634, -1.629637, 1, 1, 1, 1, 1,
-1.147621, 0.2512065, -1.464681, 1, 1, 1, 1, 1,
-1.142959, 2.500784, 0.2421073, 1, 1, 1, 1, 1,
-1.142366, 0.1499822, -2.140359, 1, 1, 1, 1, 1,
-1.140356, -1.213833, -2.366076, 1, 1, 1, 1, 1,
-1.133313, 1.088231, -0.4410324, 1, 1, 1, 1, 1,
-1.131262, 0.6991144, -0.5215489, 1, 1, 1, 1, 1,
-1.127722, -0.2267031, -1.672769, 1, 1, 1, 1, 1,
-1.126683, 2.265854, -1.125511, 1, 1, 1, 1, 1,
-1.126265, 0.07252478, -1.704742, 1, 1, 1, 1, 1,
-1.121202, -2.753036, -4.092272, 1, 1, 1, 1, 1,
-1.115753, -0.480084, -1.819838, 1, 1, 1, 1, 1,
-1.115091, -1.242051, -3.579954, 1, 1, 1, 1, 1,
-1.105764, 1.079844, 0.3515484, 1, 1, 1, 1, 1,
-1.100865, 0.6883737, -1.14639, 0, 0, 1, 1, 1,
-1.098807, 0.2329573, -0.3607534, 1, 0, 0, 1, 1,
-1.097013, 1.194857, 0.3539367, 1, 0, 0, 1, 1,
-1.095903, -1.709185, -3.483213, 1, 0, 0, 1, 1,
-1.089142, 0.5642027, -1.01892, 1, 0, 0, 1, 1,
-1.078755, 0.7513072, -1.446403, 1, 0, 0, 1, 1,
-1.077931, 0.8622658, -1.07122, 0, 0, 0, 1, 1,
-1.064125, -1.652966, -2.636834, 0, 0, 0, 1, 1,
-1.058242, 0.581602, 0.3400775, 0, 0, 0, 1, 1,
-1.056368, 0.1909373, -3.406757, 0, 0, 0, 1, 1,
-1.051788, 0.6586189, -1.082904, 0, 0, 0, 1, 1,
-1.051314, 0.6401575, -0.3868057, 0, 0, 0, 1, 1,
-1.047228, -0.1250671, -2.724408, 0, 0, 0, 1, 1,
-1.045597, 2.318544, -0.3137542, 1, 1, 1, 1, 1,
-1.045181, -2.137712, -3.810994, 1, 1, 1, 1, 1,
-1.044134, 1.029253, -1.764718, 1, 1, 1, 1, 1,
-1.041683, 0.7753946, 0.4606975, 1, 1, 1, 1, 1,
-1.036986, -0.7872055, -2.335614, 1, 1, 1, 1, 1,
-1.02828, -0.7715808, -1.476556, 1, 1, 1, 1, 1,
-1.025873, 0.2489427, -0.7616765, 1, 1, 1, 1, 1,
-1.025182, 0.9648321, -0.6996777, 1, 1, 1, 1, 1,
-1.02401, 1.440048, -0.348522, 1, 1, 1, 1, 1,
-1.012614, -0.3619879, -2.494448, 1, 1, 1, 1, 1,
-1.00802, -1.326436, -2.821378, 1, 1, 1, 1, 1,
-1.001857, -0.5264371, -2.726844, 1, 1, 1, 1, 1,
-0.9890057, -0.8315468, -4.456705, 1, 1, 1, 1, 1,
-0.9839604, -0.5090187, -0.947497, 1, 1, 1, 1, 1,
-0.9785675, -1.207553, -1.107718, 1, 1, 1, 1, 1,
-0.9718847, 0.6193432, -1.530732, 0, 0, 1, 1, 1,
-0.9718133, 1.161723, -2.794635, 1, 0, 0, 1, 1,
-0.9691045, 1.762946, -0.166217, 1, 0, 0, 1, 1,
-0.962364, 0.9843695, 0.3120009, 1, 0, 0, 1, 1,
-0.9620226, 0.3689679, -0.7915252, 1, 0, 0, 1, 1,
-0.9614162, -0.8505215, -4.309107, 1, 0, 0, 1, 1,
-0.9603003, -1.340956, -3.070108, 0, 0, 0, 1, 1,
-0.9590213, -0.2392924, -2.057829, 0, 0, 0, 1, 1,
-0.9540235, 2.034661, -0.9433432, 0, 0, 0, 1, 1,
-0.9356131, 0.6144068, -0.6732698, 0, 0, 0, 1, 1,
-0.9302861, -0.5558163, -3.539914, 0, 0, 0, 1, 1,
-0.9291523, 0.2468574, -2.002903, 0, 0, 0, 1, 1,
-0.9282057, 0.948005, -0.1719055, 0, 0, 0, 1, 1,
-0.9167258, 1.097342, -1.555285, 1, 1, 1, 1, 1,
-0.9158583, -0.4825226, -1.801554, 1, 1, 1, 1, 1,
-0.9140146, 0.8606212, -1.564909, 1, 1, 1, 1, 1,
-0.9138976, 0.3311497, -1.357405, 1, 1, 1, 1, 1,
-0.913585, -0.001999852, -1.854259, 1, 1, 1, 1, 1,
-0.903433, 0.6589022, -2.339578, 1, 1, 1, 1, 1,
-0.8988432, 1.705896, 0.707718, 1, 1, 1, 1, 1,
-0.8973799, 0.3485339, -0.2088305, 1, 1, 1, 1, 1,
-0.8960134, -0.9525512, -2.471548, 1, 1, 1, 1, 1,
-0.8943459, -0.6447119, -1.738674, 1, 1, 1, 1, 1,
-0.8938025, -0.4200718, -3.068844, 1, 1, 1, 1, 1,
-0.8929694, -0.436097, -3.090501, 1, 1, 1, 1, 1,
-0.8888558, 0.2222032, -2.423868, 1, 1, 1, 1, 1,
-0.8882752, -0.2756194, -1.349384, 1, 1, 1, 1, 1,
-0.8838357, 0.6137584, 0.8080643, 1, 1, 1, 1, 1,
-0.8770117, 0.8131812, -0.9787223, 0, 0, 1, 1, 1,
-0.8739083, -1.158528, -1.740885, 1, 0, 0, 1, 1,
-0.8726966, 1.715598, -0.2701921, 1, 0, 0, 1, 1,
-0.8703756, 0.07254616, -2.413088, 1, 0, 0, 1, 1,
-0.8534842, 1.662732, -0.112411, 1, 0, 0, 1, 1,
-0.849529, -0.2146094, -2.897889, 1, 0, 0, 1, 1,
-0.8473665, -0.410887, -1.119114, 0, 0, 0, 1, 1,
-0.8426381, 0.2857153, -0.7078944, 0, 0, 0, 1, 1,
-0.8424551, -0.570771, -1.545237, 0, 0, 0, 1, 1,
-0.8422698, -0.2034637, 1.766962, 0, 0, 0, 1, 1,
-0.8418887, -0.6868466, -1.38217, 0, 0, 0, 1, 1,
-0.8407576, -0.01249757, -2.481466, 0, 0, 0, 1, 1,
-0.8390554, -0.1652701, 1.023522, 0, 0, 0, 1, 1,
-0.8326355, -0.6519513, 0.1456344, 1, 1, 1, 1, 1,
-0.831596, -0.8403518, -0.5346242, 1, 1, 1, 1, 1,
-0.828064, 0.06511151, -2.885309, 1, 1, 1, 1, 1,
-0.8266483, -0.545415, -1.653688, 1, 1, 1, 1, 1,
-0.8240809, -0.4466257, -2.991404, 1, 1, 1, 1, 1,
-0.823157, -0.3444453, -0.9000975, 1, 1, 1, 1, 1,
-0.8211565, 1.337547, -0.04706755, 1, 1, 1, 1, 1,
-0.8200824, -0.7446224, -1.772339, 1, 1, 1, 1, 1,
-0.8126854, -1.201301, -1.998391, 1, 1, 1, 1, 1,
-0.7988907, 1.692912, 0.3177548, 1, 1, 1, 1, 1,
-0.7883812, -1.177482, -3.11579, 1, 1, 1, 1, 1,
-0.7831365, -0.5619864, -2.604481, 1, 1, 1, 1, 1,
-0.7812988, -0.1817675, -0.6151804, 1, 1, 1, 1, 1,
-0.7752603, -0.272941, -2.94033, 1, 1, 1, 1, 1,
-0.7741321, 0.1748783, -1.710013, 1, 1, 1, 1, 1,
-0.7730187, -0.4627571, -3.241827, 0, 0, 1, 1, 1,
-0.7726655, -0.59903, -2.444782, 1, 0, 0, 1, 1,
-0.7690756, 0.8324255, -0.4330789, 1, 0, 0, 1, 1,
-0.7606325, -0.984836, -0.8033749, 1, 0, 0, 1, 1,
-0.756835, 0.04452394, -1.224625, 1, 0, 0, 1, 1,
-0.7566671, 0.8400546, -1.556236, 1, 0, 0, 1, 1,
-0.753922, -0.4275612, -2.615463, 0, 0, 0, 1, 1,
-0.7493937, -1.563238, -4.257742, 0, 0, 0, 1, 1,
-0.7482374, 0.6832639, -1.161723, 0, 0, 0, 1, 1,
-0.7387917, -1.409975, -1.703428, 0, 0, 0, 1, 1,
-0.7384379, -2.487056, -1.699052, 0, 0, 0, 1, 1,
-0.7169494, 1.164213, -0.06813677, 0, 0, 0, 1, 1,
-0.7166579, -1.368764, -2.102354, 0, 0, 0, 1, 1,
-0.7163392, -0.7339153, -0.1659776, 1, 1, 1, 1, 1,
-0.7152843, 0.02800251, -3.451905, 1, 1, 1, 1, 1,
-0.7140296, 0.2519839, -1.453707, 1, 1, 1, 1, 1,
-0.7127546, 0.7410117, -0.145918, 1, 1, 1, 1, 1,
-0.7113154, -0.2783469, -1.509456, 1, 1, 1, 1, 1,
-0.7110227, -1.137686, -3.964123, 1, 1, 1, 1, 1,
-0.7081196, 0.3499874, -2.076662, 1, 1, 1, 1, 1,
-0.7041646, -0.03588916, -2.459101, 1, 1, 1, 1, 1,
-0.7035016, 0.743962, -1.222197, 1, 1, 1, 1, 1,
-0.7031427, 0.3946861, -1.462568, 1, 1, 1, 1, 1,
-0.7025608, -0.9732369, -1.705318, 1, 1, 1, 1, 1,
-0.6991817, -0.04573923, -0.5535685, 1, 1, 1, 1, 1,
-0.6956022, -0.9183452, -2.123546, 1, 1, 1, 1, 1,
-0.679736, -1.340482, -4.3226, 1, 1, 1, 1, 1,
-0.6793879, 0.6224954, -1.423053, 1, 1, 1, 1, 1,
-0.6782083, -0.1722291, -1.479912, 0, 0, 1, 1, 1,
-0.6766601, -1.634213, -3.105875, 1, 0, 0, 1, 1,
-0.673301, -1.08349, -1.579114, 1, 0, 0, 1, 1,
-0.6720084, 0.3463318, 0.3292395, 1, 0, 0, 1, 1,
-0.6702816, 0.4128688, -1.355078, 1, 0, 0, 1, 1,
-0.6659051, -1.100822, -3.009285, 1, 0, 0, 1, 1,
-0.6606651, 0.2318386, -1.721282, 0, 0, 0, 1, 1,
-0.6579235, -0.1865176, -1.124003, 0, 0, 0, 1, 1,
-0.654565, 1.985478, 0.4865077, 0, 0, 0, 1, 1,
-0.645295, -0.2775156, -3.434998, 0, 0, 0, 1, 1,
-0.6452678, -0.2120687, -1.108239, 0, 0, 0, 1, 1,
-0.6269961, -0.6002804, -3.545846, 0, 0, 0, 1, 1,
-0.6252682, 0.1698736, -0.5389714, 0, 0, 0, 1, 1,
-0.6218373, 0.2678632, -0.657731, 1, 1, 1, 1, 1,
-0.6197503, -0.596679, -1.599198, 1, 1, 1, 1, 1,
-0.6136659, 0.160514, -1.929173, 1, 1, 1, 1, 1,
-0.611473, -1.181051, -3.1837, 1, 1, 1, 1, 1,
-0.6106066, 0.3478692, -0.2444556, 1, 1, 1, 1, 1,
-0.6103875, -0.5195739, -1.407721, 1, 1, 1, 1, 1,
-0.6097218, 0.3014935, -0.9684863, 1, 1, 1, 1, 1,
-0.6091622, -1.803076, -3.961853, 1, 1, 1, 1, 1,
-0.6082968, 1.288233, -1.402101, 1, 1, 1, 1, 1,
-0.6081461, 0.6839244, -0.1387187, 1, 1, 1, 1, 1,
-0.6004835, 1.273449, -1.491647, 1, 1, 1, 1, 1,
-0.5971985, -0.09981517, -2.528435, 1, 1, 1, 1, 1,
-0.5887581, -0.9049466, -2.902409, 1, 1, 1, 1, 1,
-0.58871, -0.9606454, -0.6208192, 1, 1, 1, 1, 1,
-0.5884789, 1.279932, -1.485093, 1, 1, 1, 1, 1,
-0.5853796, 0.6163785, -0.6909442, 0, 0, 1, 1, 1,
-0.5852878, 0.8017555, -1.082379, 1, 0, 0, 1, 1,
-0.5764998, 0.391809, -1.019083, 1, 0, 0, 1, 1,
-0.5732253, 0.2817213, -0.3225087, 1, 0, 0, 1, 1,
-0.5700065, 1.142423, -0.7319711, 1, 0, 0, 1, 1,
-0.5663668, 1.210105, 0.6312304, 1, 0, 0, 1, 1,
-0.5653513, 1.380924, -0.4005402, 0, 0, 0, 1, 1,
-0.5641038, 0.4410494, -0.4307037, 0, 0, 0, 1, 1,
-0.5636593, -1.116019, -1.527282, 0, 0, 0, 1, 1,
-0.5635299, -0.8902088, -4.229292, 0, 0, 0, 1, 1,
-0.5567412, -0.8398063, -3.340565, 0, 0, 0, 1, 1,
-0.5556562, 0.6387244, -1.454649, 0, 0, 0, 1, 1,
-0.5537522, 0.6316485, 0.9255995, 0, 0, 0, 1, 1,
-0.5469216, 2.157297, 1.012287, 1, 1, 1, 1, 1,
-0.5434084, 1.596719, -0.5723601, 1, 1, 1, 1, 1,
-0.5397673, 1.045699, -1.505022, 1, 1, 1, 1, 1,
-0.5361891, -1.149956, -3.420747, 1, 1, 1, 1, 1,
-0.5329707, -1.703142, -2.66597, 1, 1, 1, 1, 1,
-0.5305144, 0.3530518, -0.4835485, 1, 1, 1, 1, 1,
-0.5304599, 1.377244, -1.580812, 1, 1, 1, 1, 1,
-0.5261043, 0.4280439, -0.9366642, 1, 1, 1, 1, 1,
-0.5260712, -0.2200041, -1.140098, 1, 1, 1, 1, 1,
-0.5246734, -0.2488684, -2.475505, 1, 1, 1, 1, 1,
-0.5219127, -0.8374554, -2.613017, 1, 1, 1, 1, 1,
-0.5196884, -2.380913, -1.43733, 1, 1, 1, 1, 1,
-0.5165655, -0.3596453, -2.391352, 1, 1, 1, 1, 1,
-0.5046234, 0.7462686, -0.6655393, 1, 1, 1, 1, 1,
-0.5002335, 0.6823449, -2.72471, 1, 1, 1, 1, 1,
-0.4997522, 1.036132, -1.564048, 0, 0, 1, 1, 1,
-0.4926064, -1.090752, -2.812831, 1, 0, 0, 1, 1,
-0.4912754, -0.1669086, -1.38914, 1, 0, 0, 1, 1,
-0.4907263, -1.845292, -3.067084, 1, 0, 0, 1, 1,
-0.487714, 0.6406661, -2.946748, 1, 0, 0, 1, 1,
-0.4780878, 1.120033, 0.3750159, 1, 0, 0, 1, 1,
-0.4723148, 0.4748249, -0.9367237, 0, 0, 0, 1, 1,
-0.4720366, -0.7274467, -3.495485, 0, 0, 0, 1, 1,
-0.4717475, -0.9640627, -3.021024, 0, 0, 0, 1, 1,
-0.4699276, -0.6222262, -3.299001, 0, 0, 0, 1, 1,
-0.4693317, 1.350404, -0.4661206, 0, 0, 0, 1, 1,
-0.4681418, -1.059045, -2.64289, 0, 0, 0, 1, 1,
-0.4664113, -1.045565, -3.453808, 0, 0, 0, 1, 1,
-0.4634439, 1.370034, 1.1429, 1, 1, 1, 1, 1,
-0.4620447, 0.6623759, -0.103339, 1, 1, 1, 1, 1,
-0.4613491, -0.3119058, -2.016518, 1, 1, 1, 1, 1,
-0.4608875, -0.1956565, -2.030304, 1, 1, 1, 1, 1,
-0.4526754, -1.542862, -3.737758, 1, 1, 1, 1, 1,
-0.4457042, -0.454627, -1.643256, 1, 1, 1, 1, 1,
-0.4429894, 0.8845226, -1.329116, 1, 1, 1, 1, 1,
-0.4414716, 0.2040232, -1.130142, 1, 1, 1, 1, 1,
-0.4384938, -0.8437784, -3.549647, 1, 1, 1, 1, 1,
-0.4355908, 0.5254935, -0.1618089, 1, 1, 1, 1, 1,
-0.4340651, -1.136147, -2.561618, 1, 1, 1, 1, 1,
-0.4331858, -0.9428826, -2.399757, 1, 1, 1, 1, 1,
-0.4203001, -0.3884151, -3.301044, 1, 1, 1, 1, 1,
-0.418673, -0.5909519, -1.015214, 1, 1, 1, 1, 1,
-0.4131448, 2.028392, 1.217149, 1, 1, 1, 1, 1,
-0.4100679, 0.901653, 0.7125171, 0, 0, 1, 1, 1,
-0.4027697, 1.553993, 0.8840801, 1, 0, 0, 1, 1,
-0.4026881, 0.7451802, -0.05336916, 1, 0, 0, 1, 1,
-0.3976976, -1.377444, -4.43582, 1, 0, 0, 1, 1,
-0.3973194, 0.7494218, 1.663751, 1, 0, 0, 1, 1,
-0.3923664, 0.6849298, -0.3591167, 1, 0, 0, 1, 1,
-0.3884762, 0.4924405, -0.6089293, 0, 0, 0, 1, 1,
-0.3846972, 0.1646441, -1.055475, 0, 0, 0, 1, 1,
-0.3811472, -0.2771676, -3.760549, 0, 0, 0, 1, 1,
-0.3779672, 1.25654, 0.8105294, 0, 0, 0, 1, 1,
-0.3777303, 1.340073, 2.012875, 0, 0, 0, 1, 1,
-0.3722663, 0.8346682, 0.3417237, 0, 0, 0, 1, 1,
-0.3713325, 0.5185693, 0.6473092, 0, 0, 0, 1, 1,
-0.3701357, 0.0004695786, -1.55908, 1, 1, 1, 1, 1,
-0.3694028, -0.7321761, -2.950326, 1, 1, 1, 1, 1,
-0.3626707, 0.4285778, -0.4656597, 1, 1, 1, 1, 1,
-0.3611302, 2.369112, 0.3088478, 1, 1, 1, 1, 1,
-0.3610024, 0.2626509, -2.944755, 1, 1, 1, 1, 1,
-0.3607862, 0.5698661, 0.4251655, 1, 1, 1, 1, 1,
-0.3607116, -0.4237947, -2.251417, 1, 1, 1, 1, 1,
-0.3596782, 1.360008, -0.1801446, 1, 1, 1, 1, 1,
-0.3593604, -0.5682061, -3.246127, 1, 1, 1, 1, 1,
-0.3578387, -0.2985359, -4.395162, 1, 1, 1, 1, 1,
-0.357793, 1.119668, -0.6619617, 1, 1, 1, 1, 1,
-0.3546729, 0.3859262, -1.003598, 1, 1, 1, 1, 1,
-0.3544807, -0.6825101, -2.800362, 1, 1, 1, 1, 1,
-0.3543456, -0.3718812, -2.107871, 1, 1, 1, 1, 1,
-0.3449961, 0.9124273, 0.6842642, 1, 1, 1, 1, 1,
-0.3428685, -0.4367027, -3.425595, 0, 0, 1, 1, 1,
-0.3415612, -0.5501615, -4.421065, 1, 0, 0, 1, 1,
-0.3406151, -0.7466174, -2.866107, 1, 0, 0, 1, 1,
-0.338775, -1.333744, -4.608526, 1, 0, 0, 1, 1,
-0.3371812, -1.006716, -2.164308, 1, 0, 0, 1, 1,
-0.3320176, 0.4777897, 0.5922349, 1, 0, 0, 1, 1,
-0.3317154, -0.1190553, -2.383888, 0, 0, 0, 1, 1,
-0.3295318, 0.5486926, -0.9249577, 0, 0, 0, 1, 1,
-0.3245894, -1.037758, -2.260793, 0, 0, 0, 1, 1,
-0.3213788, 1.219431, -0.2071663, 0, 0, 0, 1, 1,
-0.3185855, -2.083784, -2.570601, 0, 0, 0, 1, 1,
-0.3173844, 0.7816521, -0.4732092, 0, 0, 0, 1, 1,
-0.3158865, -0.5634466, -2.033896, 0, 0, 0, 1, 1,
-0.3134432, 0.9334373, 0.7957095, 1, 1, 1, 1, 1,
-0.3104273, 0.1149851, -0.9550449, 1, 1, 1, 1, 1,
-0.3089806, -0.6034747, -0.5196533, 1, 1, 1, 1, 1,
-0.3056602, -0.122234, -2.409967, 1, 1, 1, 1, 1,
-0.3020429, 0.5398034, -1.596005, 1, 1, 1, 1, 1,
-0.3003442, -1.211983, -4.058936, 1, 1, 1, 1, 1,
-0.2985003, 1.143123, 0.9662661, 1, 1, 1, 1, 1,
-0.2975983, -2.233345, -3.5754, 1, 1, 1, 1, 1,
-0.2968858, 0.6650467, -0.4158231, 1, 1, 1, 1, 1,
-0.2961304, -2.293788, -2.57367, 1, 1, 1, 1, 1,
-0.2936258, 0.4082585, -0.7509469, 1, 1, 1, 1, 1,
-0.2929596, 0.7956176, -3.169551, 1, 1, 1, 1, 1,
-0.2929246, 0.7185685, -0.5675104, 1, 1, 1, 1, 1,
-0.2918133, -0.5074321, -3.239547, 1, 1, 1, 1, 1,
-0.2848687, 1.470372, -0.700566, 1, 1, 1, 1, 1,
-0.283665, 0.5206107, -1.292642, 0, 0, 1, 1, 1,
-0.2833481, -0.7353061, -2.712895, 1, 0, 0, 1, 1,
-0.2753207, -0.1625745, -2.342641, 1, 0, 0, 1, 1,
-0.2749477, 1.723508, -1.550969, 1, 0, 0, 1, 1,
-0.2736363, -0.3257604, -0.9727454, 1, 0, 0, 1, 1,
-0.2730757, -1.079895, -3.39793, 1, 0, 0, 1, 1,
-0.2663643, 2.569443, -1.2892, 0, 0, 0, 1, 1,
-0.2638629, 0.1340378, -0.5818819, 0, 0, 0, 1, 1,
-0.2632185, -0.8250793, -3.550104, 0, 0, 0, 1, 1,
-0.259113, 0.459947, -1.710557, 0, 0, 0, 1, 1,
-0.2525857, 1.620023, -0.09630281, 0, 0, 0, 1, 1,
-0.2517158, -0.01205838, -0.9763837, 0, 0, 0, 1, 1,
-0.2493008, 0.2741805, 2.143908, 0, 0, 0, 1, 1,
-0.2491629, -0.5880703, -3.197274, 1, 1, 1, 1, 1,
-0.2480634, -0.6651504, -1.834229, 1, 1, 1, 1, 1,
-0.2410351, 1.353797, -0.1505385, 1, 1, 1, 1, 1,
-0.2408816, -3.133477, -2.63266, 1, 1, 1, 1, 1,
-0.2408706, 0.1879639, -1.478848, 1, 1, 1, 1, 1,
-0.2387804, 0.8951432, -0.9628299, 1, 1, 1, 1, 1,
-0.2380692, -1.288833, -5.626833, 1, 1, 1, 1, 1,
-0.2356977, 0.3681253, -1.384998, 1, 1, 1, 1, 1,
-0.2310853, 0.3845225, -1.224131, 1, 1, 1, 1, 1,
-0.2305491, 0.5999675, -2.47348, 1, 1, 1, 1, 1,
-0.2283407, 1.26801, -0.4325849, 1, 1, 1, 1, 1,
-0.2267509, -1.447811, -4.078054, 1, 1, 1, 1, 1,
-0.2219483, 1.114906, -1.45757, 1, 1, 1, 1, 1,
-0.2183914, 0.2086766, -2.628772, 1, 1, 1, 1, 1,
-0.2166167, -0.5977049, -3.795877, 1, 1, 1, 1, 1,
-0.2147893, 0.6649773, -1.104374, 0, 0, 1, 1, 1,
-0.2116483, -0.5859999, -2.354203, 1, 0, 0, 1, 1,
-0.2102389, -1.331662, -0.7155943, 1, 0, 0, 1, 1,
-0.2099673, 0.6288112, 0.7184983, 1, 0, 0, 1, 1,
-0.2093267, -0.8475477, -3.911802, 1, 0, 0, 1, 1,
-0.2074052, -0.1617486, -0.8496464, 1, 0, 0, 1, 1,
-0.2071206, -0.1820268, -0.06754106, 0, 0, 0, 1, 1,
-0.2028387, 1.060904, -1.663898, 0, 0, 0, 1, 1,
-0.1947384, -0.5251993, -2.421159, 0, 0, 0, 1, 1,
-0.1932596, 1.88939, 0.3350186, 0, 0, 0, 1, 1,
-0.1863563, 0.07583798, 0.7770467, 0, 0, 0, 1, 1,
-0.1835161, 1.709976, -0.1706, 0, 0, 0, 1, 1,
-0.1805528, 0.3073976, -0.5386902, 0, 0, 0, 1, 1,
-0.1794633, -3.10337, -4.012569, 1, 1, 1, 1, 1,
-0.1714096, 1.105497, -0.368329, 1, 1, 1, 1, 1,
-0.1663595, -0.2831395, -2.690438, 1, 1, 1, 1, 1,
-0.1649631, 2.708314, -0.6687997, 1, 1, 1, 1, 1,
-0.1633159, 0.7837225, -1.546586, 1, 1, 1, 1, 1,
-0.1619131, 1.118895, 0.2455615, 1, 1, 1, 1, 1,
-0.1609038, 0.1387543, -0.7048446, 1, 1, 1, 1, 1,
-0.1593537, -2.305012, -3.652715, 1, 1, 1, 1, 1,
-0.1593254, 2.858882, -0.4181621, 1, 1, 1, 1, 1,
-0.1572302, 0.4719923, -0.9088825, 1, 1, 1, 1, 1,
-0.1565586, -0.6624605, -2.734575, 1, 1, 1, 1, 1,
-0.1545152, 0.7106699, -0.4419358, 1, 1, 1, 1, 1,
-0.1542738, -0.2269972, 0.01453411, 1, 1, 1, 1, 1,
-0.1444497, -0.08901128, -2.653066, 1, 1, 1, 1, 1,
-0.1437877, 0.5191697, -1.026087, 1, 1, 1, 1, 1,
-0.1429199, 0.7862244, 0.5656564, 0, 0, 1, 1, 1,
-0.1402467, 1.286202, -1.011395, 1, 0, 0, 1, 1,
-0.1327816, -0.8146277, -2.794933, 1, 0, 0, 1, 1,
-0.132311, -1.986568, -2.548456, 1, 0, 0, 1, 1,
-0.1321468, 1.743922, 0.04803248, 1, 0, 0, 1, 1,
-0.1314874, -0.07396617, -1.299122, 1, 0, 0, 1, 1,
-0.130978, -0.4903852, -2.588776, 0, 0, 0, 1, 1,
-0.1274129, 0.7424818, -0.0102658, 0, 0, 0, 1, 1,
-0.1264839, -0.9210575, -3.890295, 0, 0, 0, 1, 1,
-0.1197244, 1.975554, -0.8370699, 0, 0, 0, 1, 1,
-0.1194314, -1.715315, -3.450235, 0, 0, 0, 1, 1,
-0.1192345, -0.9032852, -1.767823, 0, 0, 0, 1, 1,
-0.1117946, -1.595182, -3.033985, 0, 0, 0, 1, 1,
-0.1111539, -0.49395, -3.366396, 1, 1, 1, 1, 1,
-0.110945, 1.97698, 0.9193757, 1, 1, 1, 1, 1,
-0.1108116, -1.321094, -1.949411, 1, 1, 1, 1, 1,
-0.1073262, 0.2031177, -2.390807, 1, 1, 1, 1, 1,
-0.107251, 1.480985, 0.4332685, 1, 1, 1, 1, 1,
-0.102761, 1.995396, -0.5919162, 1, 1, 1, 1, 1,
-0.09866704, -1.156642, -2.483371, 1, 1, 1, 1, 1,
-0.09764611, 0.8220329, -0.493497, 1, 1, 1, 1, 1,
-0.09539343, -0.4265015, -1.461866, 1, 1, 1, 1, 1,
-0.09377617, 0.6016313, -0.2543529, 1, 1, 1, 1, 1,
-0.09362691, 0.388943, -1.183478, 1, 1, 1, 1, 1,
-0.09204388, 0.1530037, -0.01538039, 1, 1, 1, 1, 1,
-0.09174027, -0.3079531, -3.874503, 1, 1, 1, 1, 1,
-0.08868292, -0.3332162, -3.028688, 1, 1, 1, 1, 1,
-0.08787537, 0.7240893, -0.09050612, 1, 1, 1, 1, 1,
-0.0873041, -0.7653462, -3.21268, 0, 0, 1, 1, 1,
-0.08441358, 1.531568, 0.3998242, 1, 0, 0, 1, 1,
-0.08091061, -1.474092, -3.704158, 1, 0, 0, 1, 1,
-0.08066451, -0.5144057, -4.109885, 1, 0, 0, 1, 1,
-0.07918846, 1.105883, -0.02848335, 1, 0, 0, 1, 1,
-0.07778292, 0.1351052, -1.305664, 1, 0, 0, 1, 1,
-0.07241641, -2.003936, -2.796004, 0, 0, 0, 1, 1,
-0.07154125, 0.02148371, -2.320012, 0, 0, 0, 1, 1,
-0.06906282, 0.4948403, -0.14673, 0, 0, 0, 1, 1,
-0.06655343, 0.09611022, 0.09745094, 0, 0, 0, 1, 1,
-0.06651264, 0.6808038, 0.953853, 0, 0, 0, 1, 1,
-0.06485008, -0.7701612, -4.19442, 0, 0, 0, 1, 1,
-0.06290843, -1.13657, -3.742105, 0, 0, 0, 1, 1,
-0.05941293, 1.122288, 0.8665441, 1, 1, 1, 1, 1,
-0.05929024, 0.8351952, -0.3743897, 1, 1, 1, 1, 1,
-0.0583739, 0.9521353, 0.4403139, 1, 1, 1, 1, 1,
-0.05531269, -1.279286, -3.566223, 1, 1, 1, 1, 1,
-0.05517586, -0.9156357, -2.96831, 1, 1, 1, 1, 1,
-0.05369084, -0.5631495, -3.475588, 1, 1, 1, 1, 1,
-0.04899256, -0.1704012, -2.744029, 1, 1, 1, 1, 1,
-0.04275617, 1.278362, 2.000754, 1, 1, 1, 1, 1,
-0.03858558, -0.9112968, -2.856977, 1, 1, 1, 1, 1,
-0.03593299, -2.085984, -3.199972, 1, 1, 1, 1, 1,
-0.0358882, -2.966705, -3.008724, 1, 1, 1, 1, 1,
-0.03420457, 1.297248, 1.543141, 1, 1, 1, 1, 1,
-0.03287225, 0.1886876, 0.3497076, 1, 1, 1, 1, 1,
-0.03280375, 0.6252196, -0.0803036, 1, 1, 1, 1, 1,
-0.0325968, 0.5216326, -1.368088, 1, 1, 1, 1, 1,
-0.02806931, -1.572651, -3.801406, 0, 0, 1, 1, 1,
-0.02428147, -1.740787, -2.334266, 1, 0, 0, 1, 1,
-0.02309048, 0.1380794, -0.7780169, 1, 0, 0, 1, 1,
-0.01638817, -0.3073946, -2.421146, 1, 0, 0, 1, 1,
-0.01595972, -0.3941175, -4.734045, 1, 0, 0, 1, 1,
-0.01535564, -1.251949, -2.529611, 1, 0, 0, 1, 1,
-0.01516744, 2.29769, -1.084038, 0, 0, 0, 1, 1,
-0.01294543, 0.3222449, -1.119308, 0, 0, 0, 1, 1,
-0.01113076, -1.851934, -4.569669, 0, 0, 0, 1, 1,
-0.006097907, -0.4922929, -2.758738, 0, 0, 0, 1, 1,
-0.005253151, 1.09846, 0.6545181, 0, 0, 0, 1, 1,
-0.003771927, -0.4561404, -3.488618, 0, 0, 0, 1, 1,
-0.00295681, -1.60579, -2.574368, 0, 0, 0, 1, 1,
-0.0006706372, 0.9342031, 0.2256733, 1, 1, 1, 1, 1,
0.003992899, -0.5036815, 3.317407, 1, 1, 1, 1, 1,
0.008258657, -0.8762028, 2.362928, 1, 1, 1, 1, 1,
0.008514744, -0.06832993, 3.200129, 1, 1, 1, 1, 1,
0.01151913, 0.1889526, 1.494078, 1, 1, 1, 1, 1,
0.01744263, 0.4896828, 1.344371, 1, 1, 1, 1, 1,
0.02089946, 1.807155, 0.3724995, 1, 1, 1, 1, 1,
0.02195892, -1.769121, 3.407051, 1, 1, 1, 1, 1,
0.02268585, 1.886159, 0.06912211, 1, 1, 1, 1, 1,
0.02954411, -2.254066, 2.846503, 1, 1, 1, 1, 1,
0.02985845, 1.247228, 0.767613, 1, 1, 1, 1, 1,
0.03181298, -0.8857368, 4.096808, 1, 1, 1, 1, 1,
0.03217215, 0.9328262, -0.09135878, 1, 1, 1, 1, 1,
0.03568216, 0.07363508, 1.925014, 1, 1, 1, 1, 1,
0.03643547, -0.1772265, 3.053389, 1, 1, 1, 1, 1,
0.03864797, 0.6149846, -1.85093, 0, 0, 1, 1, 1,
0.0420373, 1.892613, -1.127412, 1, 0, 0, 1, 1,
0.04574208, 0.3240068, 1.410845, 1, 0, 0, 1, 1,
0.04594571, 1.061662, 0.01356866, 1, 0, 0, 1, 1,
0.04668789, -1.236199, 2.98862, 1, 0, 0, 1, 1,
0.05160512, -0.5145292, 1.939467, 1, 0, 0, 1, 1,
0.05210278, -0.0635394, 1.634588, 0, 0, 0, 1, 1,
0.05370744, -1.46147, 3.561182, 0, 0, 0, 1, 1,
0.05914589, 0.008529176, 2.348108, 0, 0, 0, 1, 1,
0.05925905, 1.395721, 0.3175975, 0, 0, 0, 1, 1,
0.06226962, 0.2208723, 0.4813426, 0, 0, 0, 1, 1,
0.06329929, -0.03645891, 3.150712, 0, 0, 0, 1, 1,
0.06367053, 1.742017, 0.01177624, 0, 0, 0, 1, 1,
0.06835185, -0.8094152, 1.842472, 1, 1, 1, 1, 1,
0.06948531, 0.4475229, 0.5283717, 1, 1, 1, 1, 1,
0.0722001, 0.7847401, -0.05079832, 1, 1, 1, 1, 1,
0.07622775, 1.139374, 1.103069, 1, 1, 1, 1, 1,
0.0779947, 1.321432, 1.353451, 1, 1, 1, 1, 1,
0.07890403, -0.6993921, 1.727983, 1, 1, 1, 1, 1,
0.07912499, 0.2248291, -1.159583, 1, 1, 1, 1, 1,
0.08034329, -0.8077505, 2.379076, 1, 1, 1, 1, 1,
0.08106358, 0.5567447, 1.28481, 1, 1, 1, 1, 1,
0.08438235, -1.314047, 3.181188, 1, 1, 1, 1, 1,
0.08537368, 0.04697354, 1.28671, 1, 1, 1, 1, 1,
0.08555403, -0.8768678, 2.734132, 1, 1, 1, 1, 1,
0.08626653, 0.07237009, 1.947592, 1, 1, 1, 1, 1,
0.08915445, 0.2331511, -1.706504, 1, 1, 1, 1, 1,
0.08954152, 0.1948826, -0.8773286, 1, 1, 1, 1, 1,
0.09039985, 0.9713161, -1.236504, 0, 0, 1, 1, 1,
0.09117743, 0.2815723, 0.9072489, 1, 0, 0, 1, 1,
0.09415177, 0.2711629, 1.145918, 1, 0, 0, 1, 1,
0.09456872, 0.5114307, 0.8164352, 1, 0, 0, 1, 1,
0.09755702, -0.1845963, 2.550933, 1, 0, 0, 1, 1,
0.09966522, 2.109159, -1.52069, 1, 0, 0, 1, 1,
0.1008509, 1.107316, -0.3176128, 0, 0, 0, 1, 1,
0.1038487, 0.6395767, 0.7170082, 0, 0, 0, 1, 1,
0.1045412, -0.3788665, 2.659663, 0, 0, 0, 1, 1,
0.1098636, -0.027116, 3.739655, 0, 0, 0, 1, 1,
0.1129577, -1.021601, 4.494842, 0, 0, 0, 1, 1,
0.1196898, -2.084144, 2.004895, 0, 0, 0, 1, 1,
0.1212731, 0.8067587, 0.02598392, 0, 0, 0, 1, 1,
0.1252648, -1.410341, 2.94804, 1, 1, 1, 1, 1,
0.1253311, 0.7963121, 0.3797055, 1, 1, 1, 1, 1,
0.1279747, 0.2693572, 0.8384238, 1, 1, 1, 1, 1,
0.1284163, -0.01870321, 2.210138, 1, 1, 1, 1, 1,
0.1311786, -0.3746442, 3.027271, 1, 1, 1, 1, 1,
0.1339336, 0.5901899, -0.371695, 1, 1, 1, 1, 1,
0.1339567, 0.2035435, 0.8945891, 1, 1, 1, 1, 1,
0.1361097, 0.9128425, 2.439807, 1, 1, 1, 1, 1,
0.1361767, 0.007465808, 1.577193, 1, 1, 1, 1, 1,
0.136814, 1.223538, 0.4044969, 1, 1, 1, 1, 1,
0.1381983, -0.07828517, 2.562557, 1, 1, 1, 1, 1,
0.1395631, -0.5520943, 4.243682, 1, 1, 1, 1, 1,
0.1437059, 0.2464128, 2.634718, 1, 1, 1, 1, 1,
0.1467704, 0.7609522, -0.03195668, 1, 1, 1, 1, 1,
0.1481783, 0.005700661, -0.1369937, 1, 1, 1, 1, 1,
0.1521777, 1.852997, -1.349692, 0, 0, 1, 1, 1,
0.1536998, -1.885007, 2.474193, 1, 0, 0, 1, 1,
0.1551171, 0.5750176, 0.7663599, 1, 0, 0, 1, 1,
0.1598537, 0.8351327, -1.482927, 1, 0, 0, 1, 1,
0.1620334, -1.096674, 2.807618, 1, 0, 0, 1, 1,
0.1635813, -1.157516, 3.221287, 1, 0, 0, 1, 1,
0.1638472, 0.4210961, 0.3281403, 0, 0, 0, 1, 1,
0.1641826, 0.9434142, -0.8906656, 0, 0, 0, 1, 1,
0.1651463, 0.7961045, -0.7518145, 0, 0, 0, 1, 1,
0.1695368, -0.1529771, 1.247595, 0, 0, 0, 1, 1,
0.1695798, 0.7087984, 1.119814, 0, 0, 0, 1, 1,
0.1734334, -0.8992335, 2.725972, 0, 0, 0, 1, 1,
0.1798338, -1.218573, 2.580156, 0, 0, 0, 1, 1,
0.1833519, 0.2871753, -0.2417339, 1, 1, 1, 1, 1,
0.1840315, 0.477266, -0.8695663, 1, 1, 1, 1, 1,
0.1840747, -0.02982317, 0.2000571, 1, 1, 1, 1, 1,
0.1895684, 0.2364906, 1.428822, 1, 1, 1, 1, 1,
0.1914079, 1.063056, -0.2873622, 1, 1, 1, 1, 1,
0.1928582, -1.459547, 4.588367, 1, 1, 1, 1, 1,
0.1956224, 1.146372, -1.018311, 1, 1, 1, 1, 1,
0.1962139, 1.79831, -1.240964, 1, 1, 1, 1, 1,
0.197578, -0.1582126, 2.815042, 1, 1, 1, 1, 1,
0.1987035, -0.7833558, 3.046391, 1, 1, 1, 1, 1,
0.2013297, -0.521137, 1.261253, 1, 1, 1, 1, 1,
0.2017405, 0.715508, 1.64873, 1, 1, 1, 1, 1,
0.2081143, 0.6165588, -0.1788105, 1, 1, 1, 1, 1,
0.208652, 1.057946, -0.3043034, 1, 1, 1, 1, 1,
0.2105057, -0.1811109, 1.956595, 1, 1, 1, 1, 1,
0.2106943, -0.01716204, 1.07026, 0, 0, 1, 1, 1,
0.2148728, 0.7896907, 1.553338, 1, 0, 0, 1, 1,
0.2155665, 0.4079847, 1.126116, 1, 0, 0, 1, 1,
0.2204373, 1.915752, 0.481676, 1, 0, 0, 1, 1,
0.2224093, 1.618577, -0.9632643, 1, 0, 0, 1, 1,
0.2245514, -0.8384713, 3.417409, 1, 0, 0, 1, 1,
0.226224, 0.9746147, 0.2741057, 0, 0, 0, 1, 1,
0.2302056, 0.8158628, 1.413382, 0, 0, 0, 1, 1,
0.231038, 1.164196, 1.019004, 0, 0, 0, 1, 1,
0.2320892, 0.3570469, 0.09165148, 0, 0, 0, 1, 1,
0.2359097, 0.3359962, 1.912207, 0, 0, 0, 1, 1,
0.2398061, 1.312628, 1.73264, 0, 0, 0, 1, 1,
0.2472257, -0.5810193, 0.6768131, 0, 0, 0, 1, 1,
0.2496913, -2.058458, 2.965069, 1, 1, 1, 1, 1,
0.2501407, 2.218242, 0.6705756, 1, 1, 1, 1, 1,
0.2539576, -0.01106424, 1.829517, 1, 1, 1, 1, 1,
0.2564454, -0.4983532, 3.850287, 1, 1, 1, 1, 1,
0.2600628, -1.800725, 3.300813, 1, 1, 1, 1, 1,
0.2680463, -0.6074888, 3.249122, 1, 1, 1, 1, 1,
0.2686492, 2.455585, 1.281734, 1, 1, 1, 1, 1,
0.2702123, 0.8621552, -0.9047956, 1, 1, 1, 1, 1,
0.2704574, 0.6467111, 0.5876958, 1, 1, 1, 1, 1,
0.2731878, -0.008817034, 0.902439, 1, 1, 1, 1, 1,
0.2738576, -0.822175, 3.28093, 1, 1, 1, 1, 1,
0.2749891, 0.9924466, 0.4576426, 1, 1, 1, 1, 1,
0.2764699, -0.8275548, 2.911812, 1, 1, 1, 1, 1,
0.2809602, 0.3541772, 0.5363431, 1, 1, 1, 1, 1,
0.2816678, 0.7745894, -1.383713, 1, 1, 1, 1, 1,
0.2878188, -0.3113051, 2.609339, 0, 0, 1, 1, 1,
0.2956516, -1.136773, 3.871425, 1, 0, 0, 1, 1,
0.2962644, -0.3207282, -0.01529551, 1, 0, 0, 1, 1,
0.2970567, 0.9200897, 1.245281, 1, 0, 0, 1, 1,
0.2977073, -0.01976404, 1.616176, 1, 0, 0, 1, 1,
0.2982379, 0.985384, 0.9514028, 1, 0, 0, 1, 1,
0.3009538, -0.07965281, 3.414259, 0, 0, 0, 1, 1,
0.3012021, -0.665957, 1.744994, 0, 0, 0, 1, 1,
0.3019199, 1.663165, -1.233437, 0, 0, 0, 1, 1,
0.3050429, -0.4358341, 2.203215, 0, 0, 0, 1, 1,
0.3131427, -0.5856698, 2.607372, 0, 0, 0, 1, 1,
0.3141373, 0.08091132, 2.620278, 0, 0, 0, 1, 1,
0.3163757, -0.6349759, 2.421473, 0, 0, 0, 1, 1,
0.3165356, 2.237425, -1.364164, 1, 1, 1, 1, 1,
0.3167244, -0.6102248, 2.091891, 1, 1, 1, 1, 1,
0.3215867, 0.554843, 1.851983, 1, 1, 1, 1, 1,
0.322795, 0.1932098, 0.7312449, 1, 1, 1, 1, 1,
0.3234715, -1.253811, 4.666996, 1, 1, 1, 1, 1,
0.3245661, 0.36855, -0.02289008, 1, 1, 1, 1, 1,
0.3252603, 0.4342993, 1.648698, 1, 1, 1, 1, 1,
0.3350371, 1.689535, -0.6636109, 1, 1, 1, 1, 1,
0.3384835, 0.1877874, 1.41501, 1, 1, 1, 1, 1,
0.3384957, -1.751513, 3.611868, 1, 1, 1, 1, 1,
0.3407042, -0.8609396, 1.578396, 1, 1, 1, 1, 1,
0.34727, 0.3818412, 3.169437, 1, 1, 1, 1, 1,
0.3481954, -0.09057576, 1.638014, 1, 1, 1, 1, 1,
0.3494505, -0.4887367, 2.900636, 1, 1, 1, 1, 1,
0.3495713, 0.7734789, -0.4346143, 1, 1, 1, 1, 1,
0.3495978, 0.509542, -0.2427966, 0, 0, 1, 1, 1,
0.3506892, 0.3696722, -0.7687228, 1, 0, 0, 1, 1,
0.3519848, -0.2257604, 2.33914, 1, 0, 0, 1, 1,
0.3540449, 2.0803, -0.5413026, 1, 0, 0, 1, 1,
0.3666034, -0.3422398, 2.140856, 1, 0, 0, 1, 1,
0.3691646, 0.398784, 0.7725627, 1, 0, 0, 1, 1,
0.3732012, -0.0496374, 2.008085, 0, 0, 0, 1, 1,
0.3747376, -0.6203006, 0.2896317, 0, 0, 0, 1, 1,
0.3749346, 0.5182903, -0.006956371, 0, 0, 0, 1, 1,
0.377765, 0.5073485, -0.6327522, 0, 0, 0, 1, 1,
0.3782915, 0.430317, -0.4948504, 0, 0, 0, 1, 1,
0.3814621, -0.8241171, 5.575041, 0, 0, 0, 1, 1,
0.3815389, 2.027274, 0.890165, 0, 0, 0, 1, 1,
0.3851802, 0.1823835, 1.429469, 1, 1, 1, 1, 1,
0.3857127, 0.2747272, 1.897525, 1, 1, 1, 1, 1,
0.3871697, -0.1885616, 2.048867, 1, 1, 1, 1, 1,
0.3919268, 0.5719199, 0.1376597, 1, 1, 1, 1, 1,
0.3942329, 0.7475892, 0.5746933, 1, 1, 1, 1, 1,
0.3954952, -0.3427528, 2.653087, 1, 1, 1, 1, 1,
0.3957683, 1.672183, 1.29682, 1, 1, 1, 1, 1,
0.3958766, 0.5814276, -0.8699669, 1, 1, 1, 1, 1,
0.397137, -1.148003, 4.181993, 1, 1, 1, 1, 1,
0.3984472, -0.7143977, 2.20422, 1, 1, 1, 1, 1,
0.3999843, -0.5975405, 3.374046, 1, 1, 1, 1, 1,
0.4071722, -1.414173, 3.703598, 1, 1, 1, 1, 1,
0.4080973, 1.093928, -0.1263465, 1, 1, 1, 1, 1,
0.41276, -0.6355343, 0.1402311, 1, 1, 1, 1, 1,
0.4148888, 1.379794, 0.5193598, 1, 1, 1, 1, 1,
0.4148901, -0.9577778, 2.982131, 0, 0, 1, 1, 1,
0.4164813, 0.2377039, 0.4830524, 1, 0, 0, 1, 1,
0.4171878, 0.01876163, 0.6401201, 1, 0, 0, 1, 1,
0.4172528, 0.3156228, 1.730882, 1, 0, 0, 1, 1,
0.4278249, 0.7825283, -0.3912421, 1, 0, 0, 1, 1,
0.4282765, 0.2244901, 2.438358, 1, 0, 0, 1, 1,
0.4331464, -0.1141241, 2.414223, 0, 0, 0, 1, 1,
0.4332316, 1.058505, 0.5941821, 0, 0, 0, 1, 1,
0.4339072, -1.360606, 3.765234, 0, 0, 0, 1, 1,
0.4349653, 0.5821031, 1.490806, 0, 0, 0, 1, 1,
0.4353093, -0.2275198, 2.137232, 0, 0, 0, 1, 1,
0.4374482, 1.948562, 0.9634408, 0, 0, 0, 1, 1,
0.442985, -0.7339597, 2.486921, 0, 0, 0, 1, 1,
0.4444011, -0.08586805, 1.928208, 1, 1, 1, 1, 1,
0.4456421, 0.2424655, 0.7066255, 1, 1, 1, 1, 1,
0.4627486, -1.039227, 3.517687, 1, 1, 1, 1, 1,
0.4638312, -2.083149, 2.544181, 1, 1, 1, 1, 1,
0.4726169, 0.7529186, 0.1753066, 1, 1, 1, 1, 1,
0.4758285, -0.7698051, 3.444998, 1, 1, 1, 1, 1,
0.4765236, 0.9999822, 1.107618, 1, 1, 1, 1, 1,
0.4780135, -0.4058133, 0.6746707, 1, 1, 1, 1, 1,
0.4805476, 1.371262, 0.4661907, 1, 1, 1, 1, 1,
0.4811726, 0.4818703, 0.08729536, 1, 1, 1, 1, 1,
0.4822705, -0.5039609, 2.648412, 1, 1, 1, 1, 1,
0.4846371, -1.416143, 3.001303, 1, 1, 1, 1, 1,
0.4851414, 0.7439634, -0.6094097, 1, 1, 1, 1, 1,
0.4890977, -0.3580074, 1.497057, 1, 1, 1, 1, 1,
0.4898221, -0.5736387, 2.082917, 1, 1, 1, 1, 1,
0.4900539, -0.7328659, 3.041249, 0, 0, 1, 1, 1,
0.4940084, 1.561116, -0.5346388, 1, 0, 0, 1, 1,
0.4984326, -0.7021658, 2.448921, 1, 0, 0, 1, 1,
0.4996909, 0.1045914, 2.363474, 1, 0, 0, 1, 1,
0.504196, 0.2225955, 2.580587, 1, 0, 0, 1, 1,
0.5059012, 0.02139053, 1.920315, 1, 0, 0, 1, 1,
0.507831, -0.3005136, 3.113029, 0, 0, 0, 1, 1,
0.5100016, -0.5053399, 3.191734, 0, 0, 0, 1, 1,
0.5119945, 0.1166824, 0.5620917, 0, 0, 0, 1, 1,
0.5147097, 0.3441189, 1.854101, 0, 0, 0, 1, 1,
0.5181839, 0.05488709, 2.417441, 0, 0, 0, 1, 1,
0.5188678, 1.284816, 1.708499, 0, 0, 0, 1, 1,
0.5247728, 1.54941, -0.1029902, 0, 0, 0, 1, 1,
0.5348669, 0.01228644, 1.82986, 1, 1, 1, 1, 1,
0.5364211, 1.599071, -0.4803077, 1, 1, 1, 1, 1,
0.5396988, -1.156696, 3.600671, 1, 1, 1, 1, 1,
0.5398774, -0.5379071, 3.061356, 1, 1, 1, 1, 1,
0.5431905, 2.019923, 0.4135796, 1, 1, 1, 1, 1,
0.5463493, 0.8538164, 0.04915386, 1, 1, 1, 1, 1,
0.5503256, 0.6617004, 0.9519982, 1, 1, 1, 1, 1,
0.5539034, -1.625215, 3.098666, 1, 1, 1, 1, 1,
0.5554668, -1.582678, 2.434896, 1, 1, 1, 1, 1,
0.5562338, 0.9347408, 0.4738339, 1, 1, 1, 1, 1,
0.5600144, -0.713416, 3.035079, 1, 1, 1, 1, 1,
0.560674, 0.8712346, 0.5419756, 1, 1, 1, 1, 1,
0.5607263, 0.1488918, 0.4678805, 1, 1, 1, 1, 1,
0.5611466, 0.6924424, 0.5526917, 1, 1, 1, 1, 1,
0.5640244, 1.907298, 1.178561, 1, 1, 1, 1, 1,
0.5650914, 0.1973714, 1.401232, 0, 0, 1, 1, 1,
0.5659666, -1.124761, 2.774714, 1, 0, 0, 1, 1,
0.5659925, 1.037953, -0.4519521, 1, 0, 0, 1, 1,
0.5663989, 0.1759301, 0.83636, 1, 0, 0, 1, 1,
0.5756686, 0.9480013, -0.5807406, 1, 0, 0, 1, 1,
0.5813947, -0.7310864, 1.267184, 1, 0, 0, 1, 1,
0.5825745, -0.5495338, 1.266873, 0, 0, 0, 1, 1,
0.5842855, 0.986711, 0.808777, 0, 0, 0, 1, 1,
0.5846689, 0.8358505, 0.1419994, 0, 0, 0, 1, 1,
0.5867281, 0.569142, 1.649674, 0, 0, 0, 1, 1,
0.5868835, 0.6693037, -0.5421385, 0, 0, 0, 1, 1,
0.5919508, 1.383854, -0.2170904, 0, 0, 0, 1, 1,
0.5925056, -1.062332, 4.571781, 0, 0, 0, 1, 1,
0.5959718, 0.4476658, 1.928896, 1, 1, 1, 1, 1,
0.600215, -0.3744936, 3.855422, 1, 1, 1, 1, 1,
0.6007491, -1.153674, 2.405006, 1, 1, 1, 1, 1,
0.604247, 0.1531733, 0.784754, 1, 1, 1, 1, 1,
0.6051942, 0.2204383, 1.548158, 1, 1, 1, 1, 1,
0.6060817, 0.3631801, 0.5306174, 1, 1, 1, 1, 1,
0.612997, 0.478523, 2.453306, 1, 1, 1, 1, 1,
0.6149923, 0.8560462, 1.23434, 1, 1, 1, 1, 1,
0.6161702, 0.1459825, 0.6724063, 1, 1, 1, 1, 1,
0.6173302, -0.9921172, 4.630288, 1, 1, 1, 1, 1,
0.6217956, -0.3619302, 1.461149, 1, 1, 1, 1, 1,
0.6226327, -0.2375383, 2.13853, 1, 1, 1, 1, 1,
0.628498, -0.7826812, 0.7314024, 1, 1, 1, 1, 1,
0.6334075, -0.8387311, 3.626974, 1, 1, 1, 1, 1,
0.6379852, -0.1990181, 1.411292, 1, 1, 1, 1, 1,
0.6408826, 0.09106532, 2.049224, 0, 0, 1, 1, 1,
0.6438718, -2.38126, 0.8187206, 1, 0, 0, 1, 1,
0.6527339, 0.6346366, -1.19892, 1, 0, 0, 1, 1,
0.6568327, 0.9698715, 2.701437, 1, 0, 0, 1, 1,
0.6618596, 1.017946, 1.132633, 1, 0, 0, 1, 1,
0.6694761, 0.4364057, 0.258121, 1, 0, 0, 1, 1,
0.6702889, -1.75251, 2.335355, 0, 0, 0, 1, 1,
0.6772615, -0.3171715, 1.487256, 0, 0, 0, 1, 1,
0.6775429, -0.1936065, 1.508271, 0, 0, 0, 1, 1,
0.693502, 0.1925596, 1.986406, 0, 0, 0, 1, 1,
0.6983563, 0.6625132, 1.982976, 0, 0, 0, 1, 1,
0.7015349, 0.09564276, 1.508753, 0, 0, 0, 1, 1,
0.7048854, -0.2103654, 3.892163, 0, 0, 0, 1, 1,
0.7074344, 1.123769, -0.7842273, 1, 1, 1, 1, 1,
0.7079446, 0.06200838, 2.87949, 1, 1, 1, 1, 1,
0.7098235, 0.9449981, 0.02539338, 1, 1, 1, 1, 1,
0.7107742, -1.401547, 2.414171, 1, 1, 1, 1, 1,
0.7121886, 0.04436374, 3.277184, 1, 1, 1, 1, 1,
0.7203165, -1.398767, 2.358538, 1, 1, 1, 1, 1,
0.7225915, 0.9113564, 4.114495, 1, 1, 1, 1, 1,
0.7247598, 1.897525, 0.260446, 1, 1, 1, 1, 1,
0.7257477, -1.483783, 1.536096, 1, 1, 1, 1, 1,
0.7264113, -0.8708427, 3.216799, 1, 1, 1, 1, 1,
0.7275639, -1.127091, 1.688374, 1, 1, 1, 1, 1,
0.7307009, -0.6280684, 4.891665, 1, 1, 1, 1, 1,
0.7308799, 0.1738989, 1.086834, 1, 1, 1, 1, 1,
0.736831, -2.693829, 1.11559, 1, 1, 1, 1, 1,
0.7370428, 0.03413589, 1.560074, 1, 1, 1, 1, 1,
0.7429957, -0.8227643, 3.119077, 0, 0, 1, 1, 1,
0.7438045, -0.2957258, 2.922425, 1, 0, 0, 1, 1,
0.7538226, 0.5316783, -0.9767141, 1, 0, 0, 1, 1,
0.7546856, 0.4658774, 1.927112, 1, 0, 0, 1, 1,
0.7606791, 1.045477, 1.569397, 1, 0, 0, 1, 1,
0.7654125, 0.4522839, 1.168858, 1, 0, 0, 1, 1,
0.7741796, 0.8484693, 2.937221, 0, 0, 0, 1, 1,
0.7782492, -0.2035132, 1.200153, 0, 0, 0, 1, 1,
0.7787486, -0.797447, 3.406997, 0, 0, 0, 1, 1,
0.7816192, -0.625791, 1.24967, 0, 0, 0, 1, 1,
0.7937208, 0.3458778, 3.779858, 0, 0, 0, 1, 1,
0.7963222, -2.338758, 3.13622, 0, 0, 0, 1, 1,
0.8093674, -0.3236126, 1.375424, 0, 0, 0, 1, 1,
0.8106387, 0.486887, 1.111902, 1, 1, 1, 1, 1,
0.8161715, -1.456875, 2.643831, 1, 1, 1, 1, 1,
0.8318637, 0.433221, -1.924213, 1, 1, 1, 1, 1,
0.8320934, 2.29212, -0.7267849, 1, 1, 1, 1, 1,
0.833052, -0.119603, 0.9587292, 1, 1, 1, 1, 1,
0.8388556, -0.9333066, 1.503353, 1, 1, 1, 1, 1,
0.8388858, 0.222821, 1.425046, 1, 1, 1, 1, 1,
0.8414779, -1.104346, 2.668991, 1, 1, 1, 1, 1,
0.8443403, -0.6109875, 3.621262, 1, 1, 1, 1, 1,
0.8472213, 0.6938355, 0.5711864, 1, 1, 1, 1, 1,
0.8527647, -0.07604956, 3.174681, 1, 1, 1, 1, 1,
0.8603066, -0.5134825, 1.002143, 1, 1, 1, 1, 1,
0.8645844, 0.02812598, 0.4462311, 1, 1, 1, 1, 1,
0.8657918, -1.025035, 1.709225, 1, 1, 1, 1, 1,
0.86637, 0.2715712, 2.225674, 1, 1, 1, 1, 1,
0.8688591, 1.556042, 0.5784736, 0, 0, 1, 1, 1,
0.8736853, -2.449845, 3.989089, 1, 0, 0, 1, 1,
0.8794854, -0.3486998, 3.119649, 1, 0, 0, 1, 1,
0.8850886, -0.8794399, 1.384409, 1, 0, 0, 1, 1,
0.8883585, 1.504904, 0.1350985, 1, 0, 0, 1, 1,
0.889218, 0.0576045, 3.00754, 1, 0, 0, 1, 1,
0.8898407, 2.594426, 1.768105, 0, 0, 0, 1, 1,
0.8941901, 0.3863392, 1.119743, 0, 0, 0, 1, 1,
0.8968311, 1.107599, 0.920212, 0, 0, 0, 1, 1,
0.8973267, 0.8064587, 0.7279481, 0, 0, 0, 1, 1,
0.897876, 1.941574, -0.5818773, 0, 0, 0, 1, 1,
0.9040951, 0.7065257, 0.5223725, 0, 0, 0, 1, 1,
0.9096373, 0.2413897, 1.154268, 0, 0, 0, 1, 1,
0.9101178, -0.3605062, 2.543119, 1, 1, 1, 1, 1,
0.9116017, 0.1888615, 2.599018, 1, 1, 1, 1, 1,
0.9197427, 0.023015, 2.301223, 1, 1, 1, 1, 1,
0.9216518, 1.081344, -0.09809415, 1, 1, 1, 1, 1,
0.9272373, -2.233187, 2.48698, 1, 1, 1, 1, 1,
0.9283195, 2.158345, -0.2352983, 1, 1, 1, 1, 1,
0.9298634, -0.5061676, 1.341006, 1, 1, 1, 1, 1,
0.9327583, 2.092565, 1.309448, 1, 1, 1, 1, 1,
0.9375994, 0.2281687, 1.046409, 1, 1, 1, 1, 1,
0.9397335, -0.8166367, 1.311188, 1, 1, 1, 1, 1,
0.9399302, -0.4751788, 2.246547, 1, 1, 1, 1, 1,
0.9435206, 0.009422204, 2.328108, 1, 1, 1, 1, 1,
0.9513545, -0.532885, 1.429636, 1, 1, 1, 1, 1,
0.9537797, -1.42037, 2.661159, 1, 1, 1, 1, 1,
0.9624833, -0.5809252, 1.108515, 1, 1, 1, 1, 1,
0.9640982, 0.1120508, 2.033254, 0, 0, 1, 1, 1,
0.9706972, -0.2168096, 2.277089, 1, 0, 0, 1, 1,
0.9722217, -0.7554963, 0.8702111, 1, 0, 0, 1, 1,
0.9762696, 0.4446271, 0.5894777, 1, 0, 0, 1, 1,
0.9782593, -0.461202, 1.922809, 1, 0, 0, 1, 1,
0.984268, 0.05818703, 1.072521, 1, 0, 0, 1, 1,
0.9859085, -0.2250646, 0.8954764, 0, 0, 0, 1, 1,
0.9866921, -0.1990666, 1.774397, 0, 0, 0, 1, 1,
0.9923717, -0.5757654, 2.109196, 0, 0, 0, 1, 1,
0.9942986, 0.5567944, 0.9467246, 0, 0, 0, 1, 1,
0.9952911, -0.933475, 2.234821, 0, 0, 0, 1, 1,
0.9976162, -0.04406977, 1.017593, 0, 0, 0, 1, 1,
1.014048, 0.2508355, 1.92609, 0, 0, 0, 1, 1,
1.015418, 1.461637, -0.8036996, 1, 1, 1, 1, 1,
1.015478, 0.8028091, 1.490837, 1, 1, 1, 1, 1,
1.018602, 2.220796, 0.1863631, 1, 1, 1, 1, 1,
1.020145, -0.1946059, 1.799569, 1, 1, 1, 1, 1,
1.02146, -0.4275554, 2.020453, 1, 1, 1, 1, 1,
1.024387, -1.290547, 1.332958, 1, 1, 1, 1, 1,
1.028492, 1.36727, 0.0180307, 1, 1, 1, 1, 1,
1.032858, -1.133501, 2.341149, 1, 1, 1, 1, 1,
1.03441, -0.2023878, 2.242459, 1, 1, 1, 1, 1,
1.034672, 0.001376984, 1.789944, 1, 1, 1, 1, 1,
1.0379, -1.527643, 2.212792, 1, 1, 1, 1, 1,
1.041439, -0.00784976, 2.635246, 1, 1, 1, 1, 1,
1.056862, -1.199355, 3.009156, 1, 1, 1, 1, 1,
1.057272, 0.8346561, 0.8076669, 1, 1, 1, 1, 1,
1.063377, 1.245263, 1.523744, 1, 1, 1, 1, 1,
1.071086, 1.102972, -0.8553199, 0, 0, 1, 1, 1,
1.083134, 1.227311, 0.2582164, 1, 0, 0, 1, 1,
1.08503, 0.185818, -0.2178686, 1, 0, 0, 1, 1,
1.089076, 0.3181137, 2.986943, 1, 0, 0, 1, 1,
1.091692, -0.7271864, 2.819419, 1, 0, 0, 1, 1,
1.105482, -0.7170843, 1.779118, 1, 0, 0, 1, 1,
1.113221, -0.008202574, 1.74194, 0, 0, 0, 1, 1,
1.121289, -1.608731, 2.538367, 0, 0, 0, 1, 1,
1.121838, -1.80467, -1.040099, 0, 0, 0, 1, 1,
1.122354, 2.24711, 0.2136635, 0, 0, 0, 1, 1,
1.134512, 1.89974, -0.1830931, 0, 0, 0, 1, 1,
1.136602, 1.468396, -0.4393508, 0, 0, 0, 1, 1,
1.145575, 0.8818194, 0.7025781, 0, 0, 0, 1, 1,
1.150037, 0.3476332, 0.4160838, 1, 1, 1, 1, 1,
1.159841, -0.1161363, 3.302764, 1, 1, 1, 1, 1,
1.159968, -0.3488773, 1.653074, 1, 1, 1, 1, 1,
1.168476, -1.748366, 3.494815, 1, 1, 1, 1, 1,
1.171313, 0.09487467, 2.174753, 1, 1, 1, 1, 1,
1.172184, 0.2427787, 2.173855, 1, 1, 1, 1, 1,
1.181624, -1.009159, 1.428786, 1, 1, 1, 1, 1,
1.187677, -0.2857821, 1.632662, 1, 1, 1, 1, 1,
1.195062, -0.1685265, 2.616246, 1, 1, 1, 1, 1,
1.198336, -1.602454, 2.810435, 1, 1, 1, 1, 1,
1.201632, -1.271559, 1.350479, 1, 1, 1, 1, 1,
1.201933, 0.3140865, 1.785203, 1, 1, 1, 1, 1,
1.216984, -2.309082, 2.344313, 1, 1, 1, 1, 1,
1.218718, -0.860933, 2.059244, 1, 1, 1, 1, 1,
1.234664, -1.37684, 3.237851, 1, 1, 1, 1, 1,
1.237231, 1.098819, 0.9538978, 0, 0, 1, 1, 1,
1.240181, -0.6543282, 0.9627659, 1, 0, 0, 1, 1,
1.241028, 1.383659, 2.30574, 1, 0, 0, 1, 1,
1.247081, 1.65, 0.3042508, 1, 0, 0, 1, 1,
1.252379, 0.205751, 2.119494, 1, 0, 0, 1, 1,
1.256633, -0.5419239, 0.2797071, 1, 0, 0, 1, 1,
1.256954, -0.06741896, 1.36576, 0, 0, 0, 1, 1,
1.261374, 0.7991585, 1.101779, 0, 0, 0, 1, 1,
1.264334, -0.6359273, 1.356234, 0, 0, 0, 1, 1,
1.265892, 1.251166, 0.00580574, 0, 0, 0, 1, 1,
1.271129, -0.06558281, 1.893516, 0, 0, 0, 1, 1,
1.291109, 0.7978303, 0.5886248, 0, 0, 0, 1, 1,
1.297275, -1.720054, 3.245654, 0, 0, 0, 1, 1,
1.313006, 0.7885816, 0.4355172, 1, 1, 1, 1, 1,
1.31552, 0.3549985, 1.474431, 1, 1, 1, 1, 1,
1.316525, 1.131099, 1.251322, 1, 1, 1, 1, 1,
1.320985, -0.5215565, 0.7583388, 1, 1, 1, 1, 1,
1.328202, -0.0507714, 2.022167, 1, 1, 1, 1, 1,
1.329192, -0.3565517, 1.04075, 1, 1, 1, 1, 1,
1.336526, 0.2551461, 1.008591, 1, 1, 1, 1, 1,
1.339107, -1.088092, 2.062282, 1, 1, 1, 1, 1,
1.340624, -1.380948, 2.887619, 1, 1, 1, 1, 1,
1.340716, 0.08746666, 1.228787, 1, 1, 1, 1, 1,
1.348591, -0.5870971, 1.111221, 1, 1, 1, 1, 1,
1.357811, -0.09782466, 1.592039, 1, 1, 1, 1, 1,
1.361902, 0.2696213, 2.16421, 1, 1, 1, 1, 1,
1.381786, -0.317899, 1.017801, 1, 1, 1, 1, 1,
1.38229, 0.5918649, 1.90114, 1, 1, 1, 1, 1,
1.386075, -0.1630228, 1.499715, 0, 0, 1, 1, 1,
1.405326, 0.3425839, 0.8727773, 1, 0, 0, 1, 1,
1.415403, -0.3649091, 1.428049, 1, 0, 0, 1, 1,
1.432393, -0.06108796, -0.2124376, 1, 0, 0, 1, 1,
1.437794, 0.2743626, 1.108724, 1, 0, 0, 1, 1,
1.43859, -1.471237, 2.315863, 1, 0, 0, 1, 1,
1.444957, 1.085995, 2.2465, 0, 0, 0, 1, 1,
1.462103, 0.5605544, 0.5075986, 0, 0, 0, 1, 1,
1.465959, -0.1504535, 2.908598, 0, 0, 0, 1, 1,
1.469656, 0.3975585, 2.462184, 0, 0, 0, 1, 1,
1.470543, -0.03889603, 3.348001, 0, 0, 0, 1, 1,
1.479314, 0.112016, -0.6854926, 0, 0, 0, 1, 1,
1.493217, -0.655344, 0.3216321, 0, 0, 0, 1, 1,
1.503589, -1.89747, 2.911482, 1, 1, 1, 1, 1,
1.510438, 0.8028585, 0.02387417, 1, 1, 1, 1, 1,
1.511628, 1.169916, 2.369396, 1, 1, 1, 1, 1,
1.520724, -1.727294, 3.602886, 1, 1, 1, 1, 1,
1.523757, 0.6449044, 3.283577, 1, 1, 1, 1, 1,
1.52726, -0.08711401, 2.156664, 1, 1, 1, 1, 1,
1.539594, 0.3193976, 1.330628, 1, 1, 1, 1, 1,
1.553486, 0.573576, 1.42083, 1, 1, 1, 1, 1,
1.555878, -0.1381394, 0.8481221, 1, 1, 1, 1, 1,
1.57122, -0.7849324, 3.859753, 1, 1, 1, 1, 1,
1.582558, -1.291333, 1.447087, 1, 1, 1, 1, 1,
1.585096, -0.785531, 2.350542, 1, 1, 1, 1, 1,
1.588449, 0.1223149, -0.896625, 1, 1, 1, 1, 1,
1.603594, -0.9179437, 2.166787, 1, 1, 1, 1, 1,
1.606552, -2.021526, 2.552817, 1, 1, 1, 1, 1,
1.613471, -1.209037, 2.742651, 0, 0, 1, 1, 1,
1.619924, -0.207591, 1.416848, 1, 0, 0, 1, 1,
1.658044, -1.120983, 2.554956, 1, 0, 0, 1, 1,
1.664511, 1.582362, 1.71228, 1, 0, 0, 1, 1,
1.677109, 1.204542, -0.9205447, 1, 0, 0, 1, 1,
1.686689, -1.26202, 1.246089, 1, 0, 0, 1, 1,
1.723449, 0.1547261, 1.418085, 0, 0, 0, 1, 1,
1.750532, 0.4006073, 2.097155, 0, 0, 0, 1, 1,
1.762693, 0.6344458, 2.12052, 0, 0, 0, 1, 1,
1.777984, 1.208193, 1.473503, 0, 0, 0, 1, 1,
1.791269, 0.07481381, 1.177275, 0, 0, 0, 1, 1,
1.797611, -2.191313, 1.621074, 0, 0, 0, 1, 1,
1.850989, -1.317135, 3.237502, 0, 0, 0, 1, 1,
1.853497, -0.8502862, 3.466162, 1, 1, 1, 1, 1,
1.859861, -0.4004826, 2.947736, 1, 1, 1, 1, 1,
1.88558, 0.6999316, -0.9093568, 1, 1, 1, 1, 1,
1.886923, -0.9933164, 1.925805, 1, 1, 1, 1, 1,
1.887356, -0.3245946, 3.380711, 1, 1, 1, 1, 1,
1.890238, 0.3503296, 1.549968, 1, 1, 1, 1, 1,
1.893902, 0.2967339, 0.8035281, 1, 1, 1, 1, 1,
1.923715, -0.9031722, 1.169337, 1, 1, 1, 1, 1,
1.957366, -1.18704, 2.304513, 1, 1, 1, 1, 1,
2.008934, 0.7188663, 2.057058, 1, 1, 1, 1, 1,
2.021753, -2.224041, 4.903189, 1, 1, 1, 1, 1,
2.116227, 0.1326416, 2.441786, 1, 1, 1, 1, 1,
2.141703, -1.43308, 2.490588, 1, 1, 1, 1, 1,
2.157306, -0.3291123, 0.2914385, 1, 1, 1, 1, 1,
2.18244, -1.076103, 0.65541, 1, 1, 1, 1, 1,
2.184013, 0.0692345, 3.383532, 0, 0, 1, 1, 1,
2.184608, -0.5900881, 0.6723138, 1, 0, 0, 1, 1,
2.197482, -0.1972681, 0.8930874, 1, 0, 0, 1, 1,
2.212946, 0.853828, -0.07598042, 1, 0, 0, 1, 1,
2.377395, -0.1693946, 1.661328, 1, 0, 0, 1, 1,
2.401612, 2.931493, 0.4347606, 1, 0, 0, 1, 1,
2.410847, -0.6483003, 2.053309, 0, 0, 0, 1, 1,
2.478971, -1.644529, 1.985118, 0, 0, 0, 1, 1,
2.490556, -0.9835057, 2.177413, 0, 0, 0, 1, 1,
2.506283, 0.3556652, 0.6703683, 0, 0, 0, 1, 1,
2.509085, -0.7870954, 0.4828633, 0, 0, 0, 1, 1,
2.647413, -1.094707, 1.006674, 0, 0, 0, 1, 1,
2.658415, -1.171858, 0.5401067, 0, 0, 0, 1, 1,
2.662268, 0.4043663, 1.93641, 1, 1, 1, 1, 1,
2.75728, 0.5785667, 1.201208, 1, 1, 1, 1, 1,
2.777986, -0.5462092, 1.46373, 1, 1, 1, 1, 1,
2.823061, 0.2832156, 2.331935, 1, 1, 1, 1, 1,
2.827067, -2.936678, 3.919535, 1, 1, 1, 1, 1,
2.900318, 1.16623, 1.469566, 1, 1, 1, 1, 1,
3.112506, -0.424207, 1.303413, 1, 1, 1, 1, 1
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
var radius = 9.641846;
var distance = 33.86657;
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
mvMatrix.translate( 0.01028872, 0.1009922, 0.02589607 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.86657);
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
