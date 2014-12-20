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
-3.099415, 0.1883546, 1.047879, 1, 0, 0, 1,
-2.948328, -0.4927058, -2.16084, 1, 0.007843138, 0, 1,
-2.917612, -0.5037002, -1.030707, 1, 0.01176471, 0, 1,
-2.895818, 0.8632944, -1.580968, 1, 0.01960784, 0, 1,
-2.689731, 1.168595, -0.5939034, 1, 0.02352941, 0, 1,
-2.615827, -0.1335131, -2.222309, 1, 0.03137255, 0, 1,
-2.510702, 0.4248195, -3.222857, 1, 0.03529412, 0, 1,
-2.49586, 0.533545, -2.963462, 1, 0.04313726, 0, 1,
-2.492015, 0.7492087, -0.3158226, 1, 0.04705882, 0, 1,
-2.407904, -0.2595278, -1.310974, 1, 0.05490196, 0, 1,
-2.309214, 0.5128844, -0.04678085, 1, 0.05882353, 0, 1,
-2.272284, 0.4522634, -0.7672129, 1, 0.06666667, 0, 1,
-2.218758, 0.08295941, -0.001689198, 1, 0.07058824, 0, 1,
-2.216373, 0.8904037, 0.3915354, 1, 0.07843138, 0, 1,
-2.2094, -1.249816, -2.334428, 1, 0.08235294, 0, 1,
-2.197605, -0.4835823, -2.642107, 1, 0.09019608, 0, 1,
-2.181443, 2.448845, 0.7791678, 1, 0.09411765, 0, 1,
-2.160431, 1.501059, -3.202933, 1, 0.1019608, 0, 1,
-2.096833, -0.2414448, -1.400528, 1, 0.1098039, 0, 1,
-2.085377, -0.486656, -1.586908, 1, 0.1137255, 0, 1,
-2.084461, -1.612491, -1.721969, 1, 0.1215686, 0, 1,
-2.055602, -1.463044, -2.546327, 1, 0.1254902, 0, 1,
-2.035068, 0.7039395, -0.1613274, 1, 0.1333333, 0, 1,
-2.01419, 0.1423393, -2.659378, 1, 0.1372549, 0, 1,
-1.97173, 1.424856, -1.741205, 1, 0.145098, 0, 1,
-1.952158, -0.137559, -1.417464, 1, 0.1490196, 0, 1,
-1.951094, -1.269038, -2.021225, 1, 0.1568628, 0, 1,
-1.934133, 0.05897871, -1.25573, 1, 0.1607843, 0, 1,
-1.923523, 0.1158937, -2.641354, 1, 0.1686275, 0, 1,
-1.903553, -0.2943227, -1.528521, 1, 0.172549, 0, 1,
-1.893287, -0.09520122, -2.303163, 1, 0.1803922, 0, 1,
-1.873857, -1.068046, -1.236819, 1, 0.1843137, 0, 1,
-1.868618, -1.968164, -3.05655, 1, 0.1921569, 0, 1,
-1.86618, -1.931979, -3.354877, 1, 0.1960784, 0, 1,
-1.863361, 0.3713965, -1.51759, 1, 0.2039216, 0, 1,
-1.824491, -1.874477, -2.443539, 1, 0.2117647, 0, 1,
-1.821905, -0.7192435, -3.567895, 1, 0.2156863, 0, 1,
-1.812123, -1.408602, -2.072542, 1, 0.2235294, 0, 1,
-1.76753, -0.333003, -1.661909, 1, 0.227451, 0, 1,
-1.767059, -1.328268, -2.407648, 1, 0.2352941, 0, 1,
-1.767026, 1.206786, -1.130157, 1, 0.2392157, 0, 1,
-1.752368, -0.196669, 0.02281585, 1, 0.2470588, 0, 1,
-1.748539, 1.196429, 0.3387873, 1, 0.2509804, 0, 1,
-1.738841, 1.379862, -2.439018, 1, 0.2588235, 0, 1,
-1.733164, 1.363824, -2.404925, 1, 0.2627451, 0, 1,
-1.7149, 0.3510946, -1.991301, 1, 0.2705882, 0, 1,
-1.708069, -0.9002807, -3.951546, 1, 0.2745098, 0, 1,
-1.695356, -2.457759, -3.1595, 1, 0.282353, 0, 1,
-1.692046, 1.517716, -1.512087, 1, 0.2862745, 0, 1,
-1.674955, 0.9400865, -0.8268402, 1, 0.2941177, 0, 1,
-1.670114, 1.762838, -0.7020424, 1, 0.3019608, 0, 1,
-1.662252, -0.3766703, -2.632704, 1, 0.3058824, 0, 1,
-1.650138, -1.066979, -1.317471, 1, 0.3137255, 0, 1,
-1.647816, -0.664023, -3.650263, 1, 0.3176471, 0, 1,
-1.635177, 1.142634, -1.820876, 1, 0.3254902, 0, 1,
-1.624022, 1.38547, -1.3601, 1, 0.3294118, 0, 1,
-1.614963, -0.7761469, -2.278122, 1, 0.3372549, 0, 1,
-1.573162, 0.8545933, -2.931911, 1, 0.3411765, 0, 1,
-1.568126, -0.7865423, -1.430864, 1, 0.3490196, 0, 1,
-1.566076, -0.1260199, -1.355499, 1, 0.3529412, 0, 1,
-1.537143, 0.89893, -0.2855524, 1, 0.3607843, 0, 1,
-1.535621, -0.3338822, -2.603998, 1, 0.3647059, 0, 1,
-1.528773, -1.600063, -1.501642, 1, 0.372549, 0, 1,
-1.518993, 1.527635, -0.8414196, 1, 0.3764706, 0, 1,
-1.515364, 1.743031, -0.5877645, 1, 0.3843137, 0, 1,
-1.49153, 1.725582, -1.082264, 1, 0.3882353, 0, 1,
-1.490221, -0.4206903, -1.292759, 1, 0.3960784, 0, 1,
-1.489018, 0.4642317, -0.6719167, 1, 0.4039216, 0, 1,
-1.476007, -0.8637241, -0.5556502, 1, 0.4078431, 0, 1,
-1.470963, -1.472502, -1.038835, 1, 0.4156863, 0, 1,
-1.470904, 0.1057247, -2.616378, 1, 0.4196078, 0, 1,
-1.467371, -0.2564985, -2.985781, 1, 0.427451, 0, 1,
-1.465115, 0.8072231, -1.346714, 1, 0.4313726, 0, 1,
-1.4649, 1.103129, -1.448626, 1, 0.4392157, 0, 1,
-1.440317, 0.682806, -0.4347365, 1, 0.4431373, 0, 1,
-1.427796, 1.001165, -1.048882, 1, 0.4509804, 0, 1,
-1.422866, 0.315451, -2.097574, 1, 0.454902, 0, 1,
-1.414049, 2.173187, -1.744256, 1, 0.4627451, 0, 1,
-1.405396, -0.3216093, -0.9918044, 1, 0.4666667, 0, 1,
-1.404325, 0.2492768, -2.093349, 1, 0.4745098, 0, 1,
-1.403395, -0.6301191, -2.374768, 1, 0.4784314, 0, 1,
-1.401665, 0.323667, -4.240976, 1, 0.4862745, 0, 1,
-1.40073, -0.1014749, -0.4367072, 1, 0.4901961, 0, 1,
-1.400261, 0.2369567, -0.8759668, 1, 0.4980392, 0, 1,
-1.397119, 0.07580964, -2.339154, 1, 0.5058824, 0, 1,
-1.394629, -0.850304, -0.1187777, 1, 0.509804, 0, 1,
-1.383986, 0.4692985, -1.330606, 1, 0.5176471, 0, 1,
-1.376113, 0.4191537, 0.4232345, 1, 0.5215687, 0, 1,
-1.369928, 0.7239519, -0.5639952, 1, 0.5294118, 0, 1,
-1.365231, -0.892078, -2.944717, 1, 0.5333334, 0, 1,
-1.363297, -0.5358888, -2.200931, 1, 0.5411765, 0, 1,
-1.361255, 0.08343299, -1.66729, 1, 0.5450981, 0, 1,
-1.353056, 0.894463, -1.951936, 1, 0.5529412, 0, 1,
-1.3517, 0.2478561, -0.3587042, 1, 0.5568628, 0, 1,
-1.336834, 0.3206268, -2.216168, 1, 0.5647059, 0, 1,
-1.33442, 0.3621967, -1.306328, 1, 0.5686275, 0, 1,
-1.318866, -1.227556, -2.275158, 1, 0.5764706, 0, 1,
-1.318138, -1.39841, -2.914183, 1, 0.5803922, 0, 1,
-1.310843, -0.3191205, -1.789253, 1, 0.5882353, 0, 1,
-1.309586, 0.3129998, -0.5293029, 1, 0.5921569, 0, 1,
-1.300352, -2.306756, -2.129665, 1, 0.6, 0, 1,
-1.284647, -0.7503141, -0.1216862, 1, 0.6078432, 0, 1,
-1.283593, 0.3788413, -2.355263, 1, 0.6117647, 0, 1,
-1.278864, -1.717461, -2.829619, 1, 0.6196079, 0, 1,
-1.276066, -0.9499668, -2.891778, 1, 0.6235294, 0, 1,
-1.275607, 0.2761656, -1.978298, 1, 0.6313726, 0, 1,
-1.27527, -0.7538071, -2.928716, 1, 0.6352941, 0, 1,
-1.266411, -0.7455596, -0.8829708, 1, 0.6431373, 0, 1,
-1.263095, 0.4986775, -2.367279, 1, 0.6470588, 0, 1,
-1.253157, 1.271524, 0.03236979, 1, 0.654902, 0, 1,
-1.244454, -0.5622103, -1.223714, 1, 0.6588235, 0, 1,
-1.2286, 1.672574, -0.4506508, 1, 0.6666667, 0, 1,
-1.206598, -0.1339202, 0.1645594, 1, 0.6705883, 0, 1,
-1.198107, -1.173823, -2.492204, 1, 0.6784314, 0, 1,
-1.181702, 1.292271, -0.4891421, 1, 0.682353, 0, 1,
-1.177718, -0.6556556, -2.366863, 1, 0.6901961, 0, 1,
-1.165378, -0.2024906, -0.8831791, 1, 0.6941177, 0, 1,
-1.163436, -1.034423, -2.478224, 1, 0.7019608, 0, 1,
-1.163193, -1.825023, -1.445387, 1, 0.7098039, 0, 1,
-1.149462, 1.719355, 0.5671186, 1, 0.7137255, 0, 1,
-1.132381, 1.099898, -0.3858355, 1, 0.7215686, 0, 1,
-1.132065, 0.3156637, -2.723781, 1, 0.7254902, 0, 1,
-1.126878, 0.2165334, -1.216611, 1, 0.7333333, 0, 1,
-1.124426, 0.6812062, -0.896166, 1, 0.7372549, 0, 1,
-1.105881, -0.1194464, -2.173149, 1, 0.7450981, 0, 1,
-1.10552, 0.6367077, -3.025827, 1, 0.7490196, 0, 1,
-1.10367, 0.6429353, -1.129802, 1, 0.7568628, 0, 1,
-1.10236, 0.2325051, -1.086331, 1, 0.7607843, 0, 1,
-1.099183, -0.1194817, -3.160216, 1, 0.7686275, 0, 1,
-1.092793, 1.276722, -0.608146, 1, 0.772549, 0, 1,
-1.092329, 0.7628071, 0.8359982, 1, 0.7803922, 0, 1,
-1.09027, 0.452982, -1.494532, 1, 0.7843137, 0, 1,
-1.086422, -1.733381, -2.276039, 1, 0.7921569, 0, 1,
-1.085246, 0.9371109, 0.0682001, 1, 0.7960784, 0, 1,
-1.079891, 0.5049275, -1.057069, 1, 0.8039216, 0, 1,
-1.072443, -0.8187068, -2.499203, 1, 0.8117647, 0, 1,
-1.068076, 0.06894624, -0.3888849, 1, 0.8156863, 0, 1,
-1.067322, 1.128907, -0.1975319, 1, 0.8235294, 0, 1,
-1.059656, 0.6572049, -1.554322, 1, 0.827451, 0, 1,
-1.049606, -1.026606, -3.507122, 1, 0.8352941, 0, 1,
-1.043661, -0.1104533, -0.5228071, 1, 0.8392157, 0, 1,
-1.038611, -0.08396947, -1.44415, 1, 0.8470588, 0, 1,
-1.030814, 0.3315824, -1.001809, 1, 0.8509804, 0, 1,
-1.029274, -0.6800228, -2.441713, 1, 0.8588235, 0, 1,
-1.024404, 0.9732579, -1.854198, 1, 0.8627451, 0, 1,
-1.024156, 0.808647, -0.7079203, 1, 0.8705882, 0, 1,
-1.013983, -0.005400953, -0.7216391, 1, 0.8745098, 0, 1,
-1.013523, -0.7390108, -2.299788, 1, 0.8823529, 0, 1,
-1.013095, -0.09286844, -2.829117, 1, 0.8862745, 0, 1,
-1.012973, 0.6905192, -2.54908, 1, 0.8941177, 0, 1,
-1.012345, 1.552987, -1.246034, 1, 0.8980392, 0, 1,
-1.010962, -0.04403038, -2.205382, 1, 0.9058824, 0, 1,
-1.010549, 0.9900186, 0.7511231, 1, 0.9137255, 0, 1,
-1.009228, -0.1581476, -0.8082091, 1, 0.9176471, 0, 1,
-0.9932939, -0.5078307, -1.374017, 1, 0.9254902, 0, 1,
-0.9910378, 0.9711422, -2.292653, 1, 0.9294118, 0, 1,
-0.9865515, -0.3970253, -0.8369985, 1, 0.9372549, 0, 1,
-0.9742762, 1.533868, 0.2499494, 1, 0.9411765, 0, 1,
-0.9714753, -0.5039827, -0.1294312, 1, 0.9490196, 0, 1,
-0.9705189, 0.5082392, -0.712225, 1, 0.9529412, 0, 1,
-0.9655214, 0.4718125, -0.09412073, 1, 0.9607843, 0, 1,
-0.959959, -0.1921989, -0.6361696, 1, 0.9647059, 0, 1,
-0.95613, 0.5249912, -0.311146, 1, 0.972549, 0, 1,
-0.9534245, 1.934455, -1.001591, 1, 0.9764706, 0, 1,
-0.9530685, -0.3908422, -0.538929, 1, 0.9843137, 0, 1,
-0.9460635, 0.7151052, -0.2432244, 1, 0.9882353, 0, 1,
-0.9444538, -0.5572528, -2.021837, 1, 0.9960784, 0, 1,
-0.932451, -0.8355347, -2.739327, 0.9960784, 1, 0, 1,
-0.9282934, -0.13426, -1.80218, 0.9921569, 1, 0, 1,
-0.9249411, 0.147857, -3.033652, 0.9843137, 1, 0, 1,
-0.9241762, -0.3910446, -1.404011, 0.9803922, 1, 0, 1,
-0.923916, 0.9806126, -0.6993793, 0.972549, 1, 0, 1,
-0.9171622, -0.9530766, -1.790852, 0.9686275, 1, 0, 1,
-0.9138741, 0.1339938, -0.769614, 0.9607843, 1, 0, 1,
-0.9116055, -0.3009256, -1.632926, 0.9568627, 1, 0, 1,
-0.9112486, -0.5855861, -2.340409, 0.9490196, 1, 0, 1,
-0.9110551, 1.964962, -1.009868, 0.945098, 1, 0, 1,
-0.9109306, 0.8693134, 1.472676, 0.9372549, 1, 0, 1,
-0.9044384, -0.4224525, -4.393112, 0.9333333, 1, 0, 1,
-0.9035604, -0.396307, -1.939269, 0.9254902, 1, 0, 1,
-0.8964277, -0.2702362, -3.823095, 0.9215686, 1, 0, 1,
-0.8957672, 2.782816, 0.01262391, 0.9137255, 1, 0, 1,
-0.891009, 0.9145217, -0.8406264, 0.9098039, 1, 0, 1,
-0.8663357, -2.110159, -1.836554, 0.9019608, 1, 0, 1,
-0.8652987, -0.9977689, -1.987234, 0.8941177, 1, 0, 1,
-0.859894, -0.124416, -0.4695753, 0.8901961, 1, 0, 1,
-0.8594286, 0.05593631, -1.714254, 0.8823529, 1, 0, 1,
-0.849777, 0.06018899, -1.881158, 0.8784314, 1, 0, 1,
-0.8490689, -0.5579144, -1.806012, 0.8705882, 1, 0, 1,
-0.8461556, 1.060693, -1.7145, 0.8666667, 1, 0, 1,
-0.8444756, 0.01473579, -0.3809835, 0.8588235, 1, 0, 1,
-0.8331667, -1.18433, -2.977, 0.854902, 1, 0, 1,
-0.8329808, -1.654183, -0.8947081, 0.8470588, 1, 0, 1,
-0.8310309, -1.169842, -2.222267, 0.8431373, 1, 0, 1,
-0.8293558, -1.210518, -0.9634646, 0.8352941, 1, 0, 1,
-0.8259729, -1.586675, -3.996176, 0.8313726, 1, 0, 1,
-0.8219885, 1.278266, -1.270489, 0.8235294, 1, 0, 1,
-0.8209518, 1.808952, 0.1171871, 0.8196079, 1, 0, 1,
-0.8102369, 0.7468302, 0.7880594, 0.8117647, 1, 0, 1,
-0.8101221, 0.198875, -0.6647912, 0.8078431, 1, 0, 1,
-0.8069363, -1.731165, -2.926667, 0.8, 1, 0, 1,
-0.8067062, -1.389636, -2.297403, 0.7921569, 1, 0, 1,
-0.8038592, 0.2198067, -1.125367, 0.7882353, 1, 0, 1,
-0.8037382, 0.1946817, -1.279625, 0.7803922, 1, 0, 1,
-0.80119, -1.723782, -3.062003, 0.7764706, 1, 0, 1,
-0.8002629, 0.5906581, 0.4454587, 0.7686275, 1, 0, 1,
-0.7862467, 0.6296245, -0.9226554, 0.7647059, 1, 0, 1,
-0.7818955, -0.3797779, -2.085356, 0.7568628, 1, 0, 1,
-0.779135, -0.6101753, -1.492121, 0.7529412, 1, 0, 1,
-0.7786899, -1.865542, -2.737596, 0.7450981, 1, 0, 1,
-0.77866, -0.1247239, -2.977732, 0.7411765, 1, 0, 1,
-0.7773631, -0.9547457, -3.040685, 0.7333333, 1, 0, 1,
-0.7746275, -0.869007, -3.152989, 0.7294118, 1, 0, 1,
-0.772885, 1.750624, -0.7028315, 0.7215686, 1, 0, 1,
-0.7690073, 0.268725, -0.7360284, 0.7176471, 1, 0, 1,
-0.7675988, 0.2779121, -1.200888, 0.7098039, 1, 0, 1,
-0.7652442, -1.111867, -1.896852, 0.7058824, 1, 0, 1,
-0.7637247, 0.4109748, -2.95395, 0.6980392, 1, 0, 1,
-0.7593089, -0.6739498, -0.5577441, 0.6901961, 1, 0, 1,
-0.755839, -0.5635535, -3.363912, 0.6862745, 1, 0, 1,
-0.7539489, -1.121457, -1.090827, 0.6784314, 1, 0, 1,
-0.7538422, -0.778487, -2.210547, 0.6745098, 1, 0, 1,
-0.7526621, -0.9954229, -2.857745, 0.6666667, 1, 0, 1,
-0.752016, 2.100873, -0.5003552, 0.6627451, 1, 0, 1,
-0.7501463, 0.0693065, -2.142823, 0.654902, 1, 0, 1,
-0.7403513, -0.5563051, -2.826918, 0.6509804, 1, 0, 1,
-0.7399594, 0.2738089, -3.039823, 0.6431373, 1, 0, 1,
-0.7312394, 0.5305437, -0.8433292, 0.6392157, 1, 0, 1,
-0.7292384, -0.6669051, -3.128264, 0.6313726, 1, 0, 1,
-0.7251728, 0.1125321, -2.971772, 0.627451, 1, 0, 1,
-0.7213537, -1.402845, -1.560646, 0.6196079, 1, 0, 1,
-0.7180063, -0.09568817, -1.809791, 0.6156863, 1, 0, 1,
-0.7147293, 0.6990765, 0.7663462, 0.6078432, 1, 0, 1,
-0.7141177, -0.230325, -1.95102, 0.6039216, 1, 0, 1,
-0.7096621, 0.4650135, -1.328017, 0.5960785, 1, 0, 1,
-0.7011016, -0.7876803, -1.827655, 0.5882353, 1, 0, 1,
-0.7001048, -1.068393, -3.357497, 0.5843138, 1, 0, 1,
-0.6981132, -0.3168629, -3.371211, 0.5764706, 1, 0, 1,
-0.6974555, 1.520522, -0.1663514, 0.572549, 1, 0, 1,
-0.6954802, -0.3488598, -1.985224, 0.5647059, 1, 0, 1,
-0.6925186, 0.08629981, -3.512243, 0.5607843, 1, 0, 1,
-0.6896858, 0.5962912, -0.6020214, 0.5529412, 1, 0, 1,
-0.6885698, 0.9875316, -1.215593, 0.5490196, 1, 0, 1,
-0.6830724, 1.07872, -0.1438958, 0.5411765, 1, 0, 1,
-0.6810718, 1.241403, 0.3877338, 0.5372549, 1, 0, 1,
-0.6762694, -1.202042, -4.830724, 0.5294118, 1, 0, 1,
-0.6745797, -0.2382911, -2.926133, 0.5254902, 1, 0, 1,
-0.6675659, -1.304584, -2.430363, 0.5176471, 1, 0, 1,
-0.664296, 0.5236089, -0.5814688, 0.5137255, 1, 0, 1,
-0.6641321, -0.9031919, -2.335789, 0.5058824, 1, 0, 1,
-0.6621374, 0.8908692, -2.015864, 0.5019608, 1, 0, 1,
-0.6611642, -2.253154, -3.69267, 0.4941176, 1, 0, 1,
-0.6608013, -0.4166069, -0.4573953, 0.4862745, 1, 0, 1,
-0.6598982, -0.4166876, -1.504416, 0.4823529, 1, 0, 1,
-0.6584908, -1.74758, -3.233464, 0.4745098, 1, 0, 1,
-0.6571669, 1.118205, 0.5623584, 0.4705882, 1, 0, 1,
-0.653753, 0.4570703, -0.6016902, 0.4627451, 1, 0, 1,
-0.649591, -0.5923145, -3.169821, 0.4588235, 1, 0, 1,
-0.6435934, 0.7700097, -0.8055764, 0.4509804, 1, 0, 1,
-0.6416723, -1.599055, -2.757848, 0.4470588, 1, 0, 1,
-0.640936, 1.618138, -1.038021, 0.4392157, 1, 0, 1,
-0.6384307, -0.2284199, -2.200621, 0.4352941, 1, 0, 1,
-0.6357809, 0.8171483, -1.313641, 0.427451, 1, 0, 1,
-0.6323408, 0.06893853, -2.164806, 0.4235294, 1, 0, 1,
-0.6314237, -1.464744, -2.674647, 0.4156863, 1, 0, 1,
-0.6311047, -0.270488, -2.685564, 0.4117647, 1, 0, 1,
-0.6278424, -0.04975558, -2.304741, 0.4039216, 1, 0, 1,
-0.6275551, -0.001328693, -1.987317, 0.3960784, 1, 0, 1,
-0.6057206, 1.836639, -0.3432772, 0.3921569, 1, 0, 1,
-0.600639, -1.21879, -4.605701, 0.3843137, 1, 0, 1,
-0.6006058, -0.2060655, -2.998678, 0.3803922, 1, 0, 1,
-0.5994221, 0.8605173, 1.128366, 0.372549, 1, 0, 1,
-0.5990176, -0.5450326, -1.208843, 0.3686275, 1, 0, 1,
-0.5984755, 0.2173246, -0.9547137, 0.3607843, 1, 0, 1,
-0.5980984, -0.8341891, -1.738509, 0.3568628, 1, 0, 1,
-0.596291, -1.669136, -3.525392, 0.3490196, 1, 0, 1,
-0.593006, 0.5859631, -0.5710842, 0.345098, 1, 0, 1,
-0.5895224, 1.247362, -2.684499, 0.3372549, 1, 0, 1,
-0.58632, 0.1821621, -1.724859, 0.3333333, 1, 0, 1,
-0.5840432, 0.07424238, -0.6930797, 0.3254902, 1, 0, 1,
-0.5810775, -2.319816, -2.062074, 0.3215686, 1, 0, 1,
-0.5796821, 0.004809524, -1.880485, 0.3137255, 1, 0, 1,
-0.5796731, -0.7053249, -2.810349, 0.3098039, 1, 0, 1,
-0.5763834, 0.4572991, -0.2421487, 0.3019608, 1, 0, 1,
-0.5733129, 0.2049709, -0.8975672, 0.2941177, 1, 0, 1,
-0.5709624, 0.5210708, -0.1719852, 0.2901961, 1, 0, 1,
-0.5706227, -0.4398656, -2.613195, 0.282353, 1, 0, 1,
-0.5619524, 0.5750595, -1.608817, 0.2784314, 1, 0, 1,
-0.5572675, -1.683872, -2.174058, 0.2705882, 1, 0, 1,
-0.556105, 0.8210403, 0.261594, 0.2666667, 1, 0, 1,
-0.5558845, -1.55246, -1.638187, 0.2588235, 1, 0, 1,
-0.5537593, -0.2536407, -4.63587, 0.254902, 1, 0, 1,
-0.5501119, 0.8002327, -1.182456, 0.2470588, 1, 0, 1,
-0.5467342, -0.3176831, -2.442883, 0.2431373, 1, 0, 1,
-0.5455887, -0.04593578, -1.282541, 0.2352941, 1, 0, 1,
-0.5412204, -0.7376355, -2.18207, 0.2313726, 1, 0, 1,
-0.5412021, -0.3983401, -2.324917, 0.2235294, 1, 0, 1,
-0.5398598, -0.8682797, -3.3372, 0.2196078, 1, 0, 1,
-0.535257, -1.709904, -2.867052, 0.2117647, 1, 0, 1,
-0.5309299, -1.175395, -0.8068624, 0.2078431, 1, 0, 1,
-0.5261759, 0.9829435, 0.6417569, 0.2, 1, 0, 1,
-0.52306, 1.356681, -1.099376, 0.1921569, 1, 0, 1,
-0.5209538, -0.9065046, -2.457943, 0.1882353, 1, 0, 1,
-0.5142581, 0.08366052, -1.196066, 0.1803922, 1, 0, 1,
-0.5141712, -2.716027, -3.091984, 0.1764706, 1, 0, 1,
-0.5134448, -2.070829, -4.638431, 0.1686275, 1, 0, 1,
-0.5132334, -0.1622731, -3.128506, 0.1647059, 1, 0, 1,
-0.5128931, -1.346162, -0.6565773, 0.1568628, 1, 0, 1,
-0.5085229, 0.4879112, -0.461913, 0.1529412, 1, 0, 1,
-0.5053139, -0.9249794, -1.447477, 0.145098, 1, 0, 1,
-0.504119, 1.029025, 1.587056, 0.1411765, 1, 0, 1,
-0.5036337, -1.705986, -3.781893, 0.1333333, 1, 0, 1,
-0.5007051, -1.08112, -1.523405, 0.1294118, 1, 0, 1,
-0.4990071, 0.6713149, -0.7220359, 0.1215686, 1, 0, 1,
-0.4966649, -0.4969979, -1.971978, 0.1176471, 1, 0, 1,
-0.4938735, 0.3615981, 0.2540563, 0.1098039, 1, 0, 1,
-0.492939, -1.605193, -3.630941, 0.1058824, 1, 0, 1,
-0.4914459, 0.2370108, -1.966666, 0.09803922, 1, 0, 1,
-0.4911641, 1.365331, 1.134571, 0.09019608, 1, 0, 1,
-0.4903684, -1.084397, -4.002465, 0.08627451, 1, 0, 1,
-0.4903012, 0.2169203, -1.774311, 0.07843138, 1, 0, 1,
-0.4889323, 1.459142, 0.1086186, 0.07450981, 1, 0, 1,
-0.4850087, 0.06022238, -2.730611, 0.06666667, 1, 0, 1,
-0.4835196, 1.003171, 0.5411522, 0.0627451, 1, 0, 1,
-0.4799736, 0.03634696, -2.062283, 0.05490196, 1, 0, 1,
-0.4708772, 0.8949442, -0.4867772, 0.05098039, 1, 0, 1,
-0.4652666, 0.9765685, -0.6459261, 0.04313726, 1, 0, 1,
-0.4635478, -0.1653338, -1.967436, 0.03921569, 1, 0, 1,
-0.4592561, -0.7146756, 0.518106, 0.03137255, 1, 0, 1,
-0.4590066, 0.4037758, -0.1479476, 0.02745098, 1, 0, 1,
-0.4588553, 0.9049599, -0.2996919, 0.01960784, 1, 0, 1,
-0.4565919, 0.8848841, -1.219491, 0.01568628, 1, 0, 1,
-0.4551859, -1.088451, -2.945424, 0.007843138, 1, 0, 1,
-0.4543698, -0.3197381, -2.567082, 0.003921569, 1, 0, 1,
-0.4492521, -1.071636, -3.238838, 0, 1, 0.003921569, 1,
-0.4429549, -1.01313, -1.114456, 0, 1, 0.01176471, 1,
-0.4353623, 0.9576774, -1.905421, 0, 1, 0.01568628, 1,
-0.4342886, -0.5083471, -1.044594, 0, 1, 0.02352941, 1,
-0.4305965, -1.004832, -2.657147, 0, 1, 0.02745098, 1,
-0.4298984, -1.349866, -2.602769, 0, 1, 0.03529412, 1,
-0.4228716, -0.4797741, -1.341745, 0, 1, 0.03921569, 1,
-0.4228714, -0.8564544, -2.962617, 0, 1, 0.04705882, 1,
-0.4214703, -0.2467334, -3.165117, 0, 1, 0.05098039, 1,
-0.4127824, -0.2753238, -1.456711, 0, 1, 0.05882353, 1,
-0.4124936, -0.3675423, -0.5437167, 0, 1, 0.0627451, 1,
-0.4098149, 0.1747141, 0.03600283, 0, 1, 0.07058824, 1,
-0.4054093, 1.444251, -1.244521, 0, 1, 0.07450981, 1,
-0.4044133, -0.6423205, -2.107163, 0, 1, 0.08235294, 1,
-0.4034607, -1.434233, -2.942834, 0, 1, 0.08627451, 1,
-0.4017014, -0.234834, -2.320894, 0, 1, 0.09411765, 1,
-0.3941044, -0.08889874, -1.341751, 0, 1, 0.1019608, 1,
-0.3928553, 1.408716, -0.5494095, 0, 1, 0.1058824, 1,
-0.3901773, -1.614117, -3.084804, 0, 1, 0.1137255, 1,
-0.3899102, -0.195046, 0.5221575, 0, 1, 0.1176471, 1,
-0.3881986, -0.5116642, -3.724368, 0, 1, 0.1254902, 1,
-0.3825381, -0.9055367, -2.271925, 0, 1, 0.1294118, 1,
-0.3824736, 0.3116456, -0.2934229, 0, 1, 0.1372549, 1,
-0.3817126, -0.3063962, -2.682094, 0, 1, 0.1411765, 1,
-0.3807755, -0.1918744, -3.44152, 0, 1, 0.1490196, 1,
-0.3805836, 0.7137538, -0.2928084, 0, 1, 0.1529412, 1,
-0.3803965, 0.5757716, -2.073853, 0, 1, 0.1607843, 1,
-0.3798962, 1.100893, -0.4933347, 0, 1, 0.1647059, 1,
-0.3781841, 0.5113909, -1.501078, 0, 1, 0.172549, 1,
-0.3776371, 0.8311238, -0.3629343, 0, 1, 0.1764706, 1,
-0.3769234, 0.6704192, -0.1961365, 0, 1, 0.1843137, 1,
-0.3738717, 1.438487, -0.1754263, 0, 1, 0.1882353, 1,
-0.3719209, -1.012084, -2.719861, 0, 1, 0.1960784, 1,
-0.3693673, 0.1545567, -1.55288, 0, 1, 0.2039216, 1,
-0.3638928, 0.26662, -1.353934, 0, 1, 0.2078431, 1,
-0.361021, 0.01172126, -1.87379, 0, 1, 0.2156863, 1,
-0.3600179, 0.1578518, -2.068907, 0, 1, 0.2196078, 1,
-0.357266, 0.6473736, -0.205139, 0, 1, 0.227451, 1,
-0.3541484, 0.4306346, -3.369415, 0, 1, 0.2313726, 1,
-0.3503439, -1.000725, -2.258503, 0, 1, 0.2392157, 1,
-0.3444959, 0.7059357, -1.803207, 0, 1, 0.2431373, 1,
-0.3401995, -0.4036595, -3.173799, 0, 1, 0.2509804, 1,
-0.3365363, 0.08469073, -1.181328, 0, 1, 0.254902, 1,
-0.3321514, 2.040449, 0.2031734, 0, 1, 0.2627451, 1,
-0.3320248, 1.589408, -0.8757601, 0, 1, 0.2666667, 1,
-0.3311261, -2.310769, -1.435466, 0, 1, 0.2745098, 1,
-0.3281855, -0.641959, -2.407272, 0, 1, 0.2784314, 1,
-0.3281307, 0.3206034, -1.257635, 0, 1, 0.2862745, 1,
-0.3261231, 0.00206577, -1.779847, 0, 1, 0.2901961, 1,
-0.3230929, -0.968456, -2.202169, 0, 1, 0.2980392, 1,
-0.3175504, 0.6650757, 0.2331199, 0, 1, 0.3058824, 1,
-0.3171764, 1.0205, -0.3526871, 0, 1, 0.3098039, 1,
-0.3140966, 0.2972807, 0.559065, 0, 1, 0.3176471, 1,
-0.3137675, -0.5584762, -4.209951, 0, 1, 0.3215686, 1,
-0.3098106, 0.3553171, -2.113142, 0, 1, 0.3294118, 1,
-0.3061822, 0.1260855, -0.1821961, 0, 1, 0.3333333, 1,
-0.3014752, 1.103864, -1.498572, 0, 1, 0.3411765, 1,
-0.3005955, 1.371975, 0.6024143, 0, 1, 0.345098, 1,
-0.3002155, 0.6255659, -0.4108749, 0, 1, 0.3529412, 1,
-0.2986534, -0.3084527, -0.8825064, 0, 1, 0.3568628, 1,
-0.2986364, -0.8413321, -0.02146965, 0, 1, 0.3647059, 1,
-0.2962687, -2.180499, -4.685339, 0, 1, 0.3686275, 1,
-0.2960226, 1.132553, -1.22283, 0, 1, 0.3764706, 1,
-0.293766, -1.011114, -2.905119, 0, 1, 0.3803922, 1,
-0.2886745, 1.666324, 1.816238, 0, 1, 0.3882353, 1,
-0.2837106, 0.03187286, -2.094935, 0, 1, 0.3921569, 1,
-0.2816839, -0.3272274, -3.1496, 0, 1, 0.4, 1,
-0.2806821, 0.314952, -0.6457804, 0, 1, 0.4078431, 1,
-0.2795558, 0.3164782, -1.57653, 0, 1, 0.4117647, 1,
-0.2781571, 0.573402, -0.2188948, 0, 1, 0.4196078, 1,
-0.2776278, 0.6990415, 1.152296, 0, 1, 0.4235294, 1,
-0.2770605, -0.9673939, -3.581236, 0, 1, 0.4313726, 1,
-0.2758095, 1.039375, 0.5011217, 0, 1, 0.4352941, 1,
-0.2748307, 2.122487, 0.9981627, 0, 1, 0.4431373, 1,
-0.2745424, -0.2616893, -1.695546, 0, 1, 0.4470588, 1,
-0.2672871, -1.421563, -2.133064, 0, 1, 0.454902, 1,
-0.2657427, -0.8221392, -2.743115, 0, 1, 0.4588235, 1,
-0.2634054, 0.2851622, 1.342501, 0, 1, 0.4666667, 1,
-0.2618025, -0.4760422, -1.718791, 0, 1, 0.4705882, 1,
-0.2611762, -0.9445615, -3.597317, 0, 1, 0.4784314, 1,
-0.2608061, 0.9452119, -1.040904, 0, 1, 0.4823529, 1,
-0.2606902, 0.4195703, -2.773808, 0, 1, 0.4901961, 1,
-0.25915, 0.7892641, 0.1062981, 0, 1, 0.4941176, 1,
-0.2581946, -1.328468, -3.874853, 0, 1, 0.5019608, 1,
-0.2572415, 0.7186378, 0.721049, 0, 1, 0.509804, 1,
-0.2544769, -1.552086, -0.7642542, 0, 1, 0.5137255, 1,
-0.2499432, -0.5963902, -2.196004, 0, 1, 0.5215687, 1,
-0.246626, -1.100455, -1.318374, 0, 1, 0.5254902, 1,
-0.2438853, -1.321681, -2.803904, 0, 1, 0.5333334, 1,
-0.2425093, -1.321782, -2.194841, 0, 1, 0.5372549, 1,
-0.2419647, -0.05786682, -3.111489, 0, 1, 0.5450981, 1,
-0.24184, 0.6966656, -0.8556326, 0, 1, 0.5490196, 1,
-0.239133, 0.8618742, -1.035838, 0, 1, 0.5568628, 1,
-0.2332619, 0.04886813, -1.585661, 0, 1, 0.5607843, 1,
-0.233017, 0.7171828, 1.720079, 0, 1, 0.5686275, 1,
-0.2319734, -1.144984, -3.76368, 0, 1, 0.572549, 1,
-0.231324, -1.694186, -2.473582, 0, 1, 0.5803922, 1,
-0.2259621, -1.416187, -4.141069, 0, 1, 0.5843138, 1,
-0.2254925, -0.782577, -2.369068, 0, 1, 0.5921569, 1,
-0.2244997, 1.51517, -0.4542179, 0, 1, 0.5960785, 1,
-0.2237455, -1.498434, -3.728743, 0, 1, 0.6039216, 1,
-0.2179742, -0.1846113, -2.239377, 0, 1, 0.6117647, 1,
-0.2161964, 1.880283, 0.6142945, 0, 1, 0.6156863, 1,
-0.2152591, 0.1128803, -1.583019, 0, 1, 0.6235294, 1,
-0.2150585, 0.1457521, -2.613353, 0, 1, 0.627451, 1,
-0.2140028, 1.840808, -0.3988285, 0, 1, 0.6352941, 1,
-0.2123379, 0.840755, -0.7438037, 0, 1, 0.6392157, 1,
-0.2113738, 0.4229428, 0.7247022, 0, 1, 0.6470588, 1,
-0.2112101, -0.1688538, -0.7451882, 0, 1, 0.6509804, 1,
-0.2097402, -1.04343, -3.230093, 0, 1, 0.6588235, 1,
-0.2096322, 1.01484, 0.005449965, 0, 1, 0.6627451, 1,
-0.2036512, -2.207508, -2.95463, 0, 1, 0.6705883, 1,
-0.2033033, 1.136063, 0.2415119, 0, 1, 0.6745098, 1,
-0.2032961, 0.332524, -0.1469437, 0, 1, 0.682353, 1,
-0.2016614, 0.9387718, -0.7928167, 0, 1, 0.6862745, 1,
-0.1966117, -0.2390218, -3.300304, 0, 1, 0.6941177, 1,
-0.1956408, -1.152036, -2.81795, 0, 1, 0.7019608, 1,
-0.1951537, -0.6964706, -3.854671, 0, 1, 0.7058824, 1,
-0.1935025, 1.193339, 0.5017342, 0, 1, 0.7137255, 1,
-0.190766, -0.4069176, -4.170212, 0, 1, 0.7176471, 1,
-0.1899138, 0.0665215, -1.162274, 0, 1, 0.7254902, 1,
-0.1892741, -0.7777026, -4.250747, 0, 1, 0.7294118, 1,
-0.1889258, -0.4947236, -2.441438, 0, 1, 0.7372549, 1,
-0.1829324, 0.5034242, -0.8092957, 0, 1, 0.7411765, 1,
-0.1800984, -0.5556713, -2.081092, 0, 1, 0.7490196, 1,
-0.1734189, -0.8854414, -3.448734, 0, 1, 0.7529412, 1,
-0.1680557, -1.231408, -3.83365, 0, 1, 0.7607843, 1,
-0.1597698, -0.05213837, -2.054468, 0, 1, 0.7647059, 1,
-0.154362, -0.9078178, -4.059251, 0, 1, 0.772549, 1,
-0.1520951, -0.8463344, -3.95126, 0, 1, 0.7764706, 1,
-0.1452297, 1.310389, -1.058279, 0, 1, 0.7843137, 1,
-0.1438195, -2.201676, -2.861453, 0, 1, 0.7882353, 1,
-0.1394902, -0.5052096, -4.376898, 0, 1, 0.7960784, 1,
-0.1388717, -0.8222674, -4.597213, 0, 1, 0.8039216, 1,
-0.1383586, -2.909642, -3.090109, 0, 1, 0.8078431, 1,
-0.1309913, 0.3321375, -0.4345452, 0, 1, 0.8156863, 1,
-0.1256833, 0.06428112, -2.425307, 0, 1, 0.8196079, 1,
-0.1246704, 0.7944685, -1.272738, 0, 1, 0.827451, 1,
-0.1242152, -0.9024037, -2.466329, 0, 1, 0.8313726, 1,
-0.1217916, 1.582334, 0.7811545, 0, 1, 0.8392157, 1,
-0.1173338, 0.3059089, -0.5841735, 0, 1, 0.8431373, 1,
-0.1142922, 0.9239284, 0.9663415, 0, 1, 0.8509804, 1,
-0.1119774, 0.7149404, -1.698334, 0, 1, 0.854902, 1,
-0.1118177, 0.6975118, -1.243305, 0, 1, 0.8627451, 1,
-0.1084094, 1.223358, 1.342082, 0, 1, 0.8666667, 1,
-0.09928018, 0.616105, 0.1979428, 0, 1, 0.8745098, 1,
-0.09924564, 1.415539, 0.8655698, 0, 1, 0.8784314, 1,
-0.0987934, -0.9927822, -3.62943, 0, 1, 0.8862745, 1,
-0.09741596, 0.357013, 0.8539072, 0, 1, 0.8901961, 1,
-0.09601034, -1.141004, -4.181621, 0, 1, 0.8980392, 1,
-0.09248208, -0.7574135, -3.945703, 0, 1, 0.9058824, 1,
-0.086638, -0.4614549, -3.428687, 0, 1, 0.9098039, 1,
-0.08631942, 1.578015, -1.409452, 0, 1, 0.9176471, 1,
-0.08303648, 0.296166, -2.451126, 0, 1, 0.9215686, 1,
-0.07492062, -1.402058, -3.366298, 0, 1, 0.9294118, 1,
-0.07259064, 0.6031844, -0.2648027, 0, 1, 0.9333333, 1,
-0.07063673, 0.7658626, 0.0398174, 0, 1, 0.9411765, 1,
-0.06275948, -0.4665284, -2.147823, 0, 1, 0.945098, 1,
-0.05477376, 0.1840555, -1.675772, 0, 1, 0.9529412, 1,
-0.05286948, 0.1628741, 0.7920317, 0, 1, 0.9568627, 1,
-0.05286939, -0.6473428, -4.034846, 0, 1, 0.9647059, 1,
-0.05089239, 1.36254, 0.438199, 0, 1, 0.9686275, 1,
-0.05045355, 0.1733446, -1.129709, 0, 1, 0.9764706, 1,
-0.04999872, 1.595967, 0.09773698, 0, 1, 0.9803922, 1,
-0.04925616, -0.4746686, -2.494972, 0, 1, 0.9882353, 1,
-0.04388891, -1.999964, -4.156116, 0, 1, 0.9921569, 1,
-0.04254902, 1.16289, -0.6413488, 0, 1, 1, 1,
-0.03809025, 0.2805923, -0.8815238, 0, 0.9921569, 1, 1,
-0.03777243, 0.3129081, -1.228646, 0, 0.9882353, 1, 1,
-0.03697381, -2.045428, -2.893681, 0, 0.9803922, 1, 1,
-0.03674568, 1.326981, 1.617758, 0, 0.9764706, 1, 1,
-0.03367149, 0.2123861, -0.1803018, 0, 0.9686275, 1, 1,
-0.033306, 0.6013001, -0.7501122, 0, 0.9647059, 1, 1,
-0.03317509, 0.8980437, 0.8275289, 0, 0.9568627, 1, 1,
-0.03132284, 0.00296807, -2.486594, 0, 0.9529412, 1, 1,
-0.03092094, 0.8858826, 0.09193414, 0, 0.945098, 1, 1,
-0.02830194, 1.362357, 0.5642769, 0, 0.9411765, 1, 1,
-0.02432211, 0.756618, -1.5527, 0, 0.9333333, 1, 1,
-0.02115826, -1.339968, -3.4637, 0, 0.9294118, 1, 1,
-0.02053509, 1.859519, -1.137786, 0, 0.9215686, 1, 1,
-0.01945664, 0.9844289, -0.1037392, 0, 0.9176471, 1, 1,
-0.01812671, -0.6493081, -3.425561, 0, 0.9098039, 1, 1,
-0.01257889, 0.1495934, -0.439343, 0, 0.9058824, 1, 1,
-0.009429448, -1.772782, -2.049619, 0, 0.8980392, 1, 1,
-0.006951462, 0.6067662, 1.984705, 0, 0.8901961, 1, 1,
-0.002984416, 0.3802409, -0.5171821, 0, 0.8862745, 1, 1,
-0.002752161, -1.434755, -1.10825, 0, 0.8784314, 1, 1,
-0.000279128, 0.08577441, 0.933683, 0, 0.8745098, 1, 1,
0.002879632, 1.322129, -0.08707868, 0, 0.8666667, 1, 1,
0.003737354, 0.2441457, 2.771135, 0, 0.8627451, 1, 1,
0.004878839, -1.232769, 3.853595, 0, 0.854902, 1, 1,
0.006664001, -1.002956, 3.687752, 0, 0.8509804, 1, 1,
0.007840821, -0.7229198, 4.584461, 0, 0.8431373, 1, 1,
0.01102396, -0.4015544, 3.409149, 0, 0.8392157, 1, 1,
0.01109747, -0.388379, 2.685246, 0, 0.8313726, 1, 1,
0.01246953, 2.273709, -0.5612141, 0, 0.827451, 1, 1,
0.0362459, -1.021208, 2.326416, 0, 0.8196079, 1, 1,
0.03721595, 0.9569371, -1.721051, 0, 0.8156863, 1, 1,
0.04096318, 0.8128737, 0.1040517, 0, 0.8078431, 1, 1,
0.04163142, -0.01662366, 0.504782, 0, 0.8039216, 1, 1,
0.04177424, -0.6543964, 1.600606, 0, 0.7960784, 1, 1,
0.04215771, -0.7735973, 2.257098, 0, 0.7882353, 1, 1,
0.042381, 0.1278201, 0.4640723, 0, 0.7843137, 1, 1,
0.04448881, 0.338593, 1.075825, 0, 0.7764706, 1, 1,
0.05475562, -1.816395, 2.525495, 0, 0.772549, 1, 1,
0.05649342, 1.065772, 0.8386023, 0, 0.7647059, 1, 1,
0.05668498, -0.797381, 2.228413, 0, 0.7607843, 1, 1,
0.06122498, -1.169769, 2.470773, 0, 0.7529412, 1, 1,
0.06281618, -0.6255729, 2.577261, 0, 0.7490196, 1, 1,
0.06308452, -0.3512063, 3.905079, 0, 0.7411765, 1, 1,
0.06476203, 0.649313, 0.4200107, 0, 0.7372549, 1, 1,
0.07202832, -1.77255, 3.188167, 0, 0.7294118, 1, 1,
0.07491471, 0.5076219, -0.2866656, 0, 0.7254902, 1, 1,
0.07740494, 0.4176451, 0.0774585, 0, 0.7176471, 1, 1,
0.07815332, 0.9623202, 0.03853365, 0, 0.7137255, 1, 1,
0.08003881, 0.3240569, -0.9922732, 0, 0.7058824, 1, 1,
0.08243725, 1.447423, 0.2225926, 0, 0.6980392, 1, 1,
0.08281752, 1.550498, -0.9600898, 0, 0.6941177, 1, 1,
0.09245075, -1.117341, 3.249032, 0, 0.6862745, 1, 1,
0.09543455, 1.168701, -0.3502099, 0, 0.682353, 1, 1,
0.09705465, 0.7586131, 0.2554497, 0, 0.6745098, 1, 1,
0.09735634, -0.04841459, 2.124102, 0, 0.6705883, 1, 1,
0.09971029, 1.241372, -0.283122, 0, 0.6627451, 1, 1,
0.1042446, 0.5645206, -0.8169921, 0, 0.6588235, 1, 1,
0.1174426, -0.01856623, 1.418745, 0, 0.6509804, 1, 1,
0.1188758, 0.5401208, 1.35186, 0, 0.6470588, 1, 1,
0.1201989, -0.01118825, 0.2291835, 0, 0.6392157, 1, 1,
0.120618, -0.4358812, 3.725188, 0, 0.6352941, 1, 1,
0.1218095, 0.888721, 0.9445012, 0, 0.627451, 1, 1,
0.1235214, 0.3427418, 0.8460771, 0, 0.6235294, 1, 1,
0.124325, 1.080728, -1.427776, 0, 0.6156863, 1, 1,
0.1261032, -0.06582491, 3.478575, 0, 0.6117647, 1, 1,
0.1270528, -0.614482, 2.894801, 0, 0.6039216, 1, 1,
0.1302663, 0.4625328, -0.06535806, 0, 0.5960785, 1, 1,
0.1314862, -0.200351, 2.103832, 0, 0.5921569, 1, 1,
0.1331842, -1.473795, 3.466869, 0, 0.5843138, 1, 1,
0.134629, 0.3953764, 0.001008942, 0, 0.5803922, 1, 1,
0.1354511, 1.293533, -0.273253, 0, 0.572549, 1, 1,
0.1355565, -1.328834, 5.815718, 0, 0.5686275, 1, 1,
0.1362541, -0.5175841, 4.245569, 0, 0.5607843, 1, 1,
0.1370263, 0.5702047, 1.999955, 0, 0.5568628, 1, 1,
0.1371228, 0.2402153, -0.5751409, 0, 0.5490196, 1, 1,
0.1382667, 0.380583, -1.183735, 0, 0.5450981, 1, 1,
0.1434124, -0.06122003, 3.089998, 0, 0.5372549, 1, 1,
0.1442485, 1.230017, 1.377711, 0, 0.5333334, 1, 1,
0.149476, -0.7406893, 3.008404, 0, 0.5254902, 1, 1,
0.1544573, 0.2537234, 0.9482944, 0, 0.5215687, 1, 1,
0.1560625, -1.587367, 4.229975, 0, 0.5137255, 1, 1,
0.1578564, -0.3208489, 2.441197, 0, 0.509804, 1, 1,
0.1599063, -0.501398, 4.721727, 0, 0.5019608, 1, 1,
0.1602727, -1.105111, 3.70902, 0, 0.4941176, 1, 1,
0.1618644, -0.1838312, 1.494683, 0, 0.4901961, 1, 1,
0.1629044, 0.5391442, -0.3581949, 0, 0.4823529, 1, 1,
0.1630124, -0.6909491, 2.694929, 0, 0.4784314, 1, 1,
0.1644933, -1.107544, 4.410648, 0, 0.4705882, 1, 1,
0.1686702, -0.5406195, 2.846972, 0, 0.4666667, 1, 1,
0.1718378, -0.6745929, 1.753732, 0, 0.4588235, 1, 1,
0.1785296, -1.687988, 2.753886, 0, 0.454902, 1, 1,
0.17939, -1.173434, 1.494572, 0, 0.4470588, 1, 1,
0.1803999, -0.6562015, 3.059095, 0, 0.4431373, 1, 1,
0.1858857, -0.1456463, 1.396133, 0, 0.4352941, 1, 1,
0.1885947, 0.06897421, 1.181642, 0, 0.4313726, 1, 1,
0.1891098, 0.6984884, 0.5652668, 0, 0.4235294, 1, 1,
0.1924878, 1.426457, 0.1810599, 0, 0.4196078, 1, 1,
0.1941475, -2.136728, 1.307212, 0, 0.4117647, 1, 1,
0.1980057, -0.4084627, 1.385809, 0, 0.4078431, 1, 1,
0.2001212, -1.095059, 0.6876419, 0, 0.4, 1, 1,
0.2012139, -2.285976, 1.927839, 0, 0.3921569, 1, 1,
0.2021131, 0.394634, -0.5516802, 0, 0.3882353, 1, 1,
0.20279, 2.389196, -1.343078, 0, 0.3803922, 1, 1,
0.2038752, 0.9679587, 0.8624976, 0, 0.3764706, 1, 1,
0.2056099, -1.513556, 2.371388, 0, 0.3686275, 1, 1,
0.2090336, -0.6484839, 1.744256, 0, 0.3647059, 1, 1,
0.2226529, -0.8914823, 4.154562, 0, 0.3568628, 1, 1,
0.2288371, 1.158051, -0.08445624, 0, 0.3529412, 1, 1,
0.2325158, -0.5879298, 3.526658, 0, 0.345098, 1, 1,
0.2372655, 0.8267702, 0.02208067, 0, 0.3411765, 1, 1,
0.2437109, 1.771832, -0.2939154, 0, 0.3333333, 1, 1,
0.2510097, 1.198301, 2.305969, 0, 0.3294118, 1, 1,
0.2561145, -1.850509, 2.714825, 0, 0.3215686, 1, 1,
0.2579305, -0.128012, 3.308886, 0, 0.3176471, 1, 1,
0.2636508, -0.2906168, 1.829648, 0, 0.3098039, 1, 1,
0.2657928, -0.2573136, 2.759902, 0, 0.3058824, 1, 1,
0.2674896, -0.1938241, 1.665602, 0, 0.2980392, 1, 1,
0.2689758, -0.2933145, 4.590485, 0, 0.2901961, 1, 1,
0.2699191, -0.4166302, 3.856007, 0, 0.2862745, 1, 1,
0.2705979, -1.412499, 2.795591, 0, 0.2784314, 1, 1,
0.2789335, 2.807443, -0.554814, 0, 0.2745098, 1, 1,
0.2815304, 0.1216525, 0.5911033, 0, 0.2666667, 1, 1,
0.2831891, -0.1595317, 1.876493, 0, 0.2627451, 1, 1,
0.2838482, 0.8908144, 1.027991, 0, 0.254902, 1, 1,
0.2855205, 1.225253, -1.412181, 0, 0.2509804, 1, 1,
0.2880869, -1.14088, 4.642792, 0, 0.2431373, 1, 1,
0.2895776, -0.4420069, -0.06449878, 0, 0.2392157, 1, 1,
0.2950491, 0.4391363, 2.247903, 0, 0.2313726, 1, 1,
0.295663, 1.399681, 0.3292664, 0, 0.227451, 1, 1,
0.2980338, 1.627759, 1.536551, 0, 0.2196078, 1, 1,
0.2983827, 0.8642, -0.6967439, 0, 0.2156863, 1, 1,
0.304474, -0.01652079, 0.06426818, 0, 0.2078431, 1, 1,
0.3142828, -0.7554178, 3.054905, 0, 0.2039216, 1, 1,
0.3167571, -1.076716, 1.429811, 0, 0.1960784, 1, 1,
0.3199883, 0.3123, -0.6034854, 0, 0.1882353, 1, 1,
0.3224941, 1.514883, 1.287244, 0, 0.1843137, 1, 1,
0.3253487, -2.096184, 4.397546, 0, 0.1764706, 1, 1,
0.3260454, -1.295863, 3.670538, 0, 0.172549, 1, 1,
0.3297604, -2.835792, 3.233225, 0, 0.1647059, 1, 1,
0.3362919, 0.2522581, -1.311637, 0, 0.1607843, 1, 1,
0.3363216, -0.776582, 3.727631, 0, 0.1529412, 1, 1,
0.3373777, 1.613914, 0.1540967, 0, 0.1490196, 1, 1,
0.3377258, 0.4046127, 0.9963652, 0, 0.1411765, 1, 1,
0.3421156, -0.8472922, 3.580147, 0, 0.1372549, 1, 1,
0.3439153, -1.133013, 3.205445, 0, 0.1294118, 1, 1,
0.346004, -0.682528, 3.188964, 0, 0.1254902, 1, 1,
0.3476611, 0.1314527, 2.351923, 0, 0.1176471, 1, 1,
0.3485208, -1.440531, 2.862267, 0, 0.1137255, 1, 1,
0.3512037, -1.05172, 3.27253, 0, 0.1058824, 1, 1,
0.3521726, -0.8729798, 3.830576, 0, 0.09803922, 1, 1,
0.357517, 0.5046895, 1.04371, 0, 0.09411765, 1, 1,
0.3642409, 1.599044, 0.2949463, 0, 0.08627451, 1, 1,
0.3686222, -0.1243989, 3.173903, 0, 0.08235294, 1, 1,
0.3686962, 0.8098412, 1.435187, 0, 0.07450981, 1, 1,
0.3704273, -0.3200834, 2.093925, 0, 0.07058824, 1, 1,
0.37083, -2.173778, 3.648981, 0, 0.0627451, 1, 1,
0.3712251, -0.2073562, 2.41513, 0, 0.05882353, 1, 1,
0.373495, -0.1324038, 1.547876, 0, 0.05098039, 1, 1,
0.3755586, -0.1367446, 2.918535, 0, 0.04705882, 1, 1,
0.3805446, -0.270122, 1.804892, 0, 0.03921569, 1, 1,
0.3839795, 0.3568383, 2.644225, 0, 0.03529412, 1, 1,
0.3853787, -0.6321465, 3.190649, 0, 0.02745098, 1, 1,
0.3861139, 1.380497, 0.1417992, 0, 0.02352941, 1, 1,
0.3951176, 1.975581, -0.2570087, 0, 0.01568628, 1, 1,
0.3951881, -0.2996432, 3.023064, 0, 0.01176471, 1, 1,
0.3998925, -0.8558655, 3.499781, 0, 0.003921569, 1, 1,
0.4024556, 1.19385, -0.6443837, 0.003921569, 0, 1, 1,
0.4033959, -1.153936, 3.930227, 0.007843138, 0, 1, 1,
0.4040973, 0.1229299, 1.135001, 0.01568628, 0, 1, 1,
0.4042626, 0.8784251, -0.6823351, 0.01960784, 0, 1, 1,
0.4044411, -0.983867, 3.783034, 0.02745098, 0, 1, 1,
0.4065692, 1.945609, -1.411791, 0.03137255, 0, 1, 1,
0.4084055, -1.058549, 3.244569, 0.03921569, 0, 1, 1,
0.4122268, -1.655868, 4.785195, 0.04313726, 0, 1, 1,
0.4128453, -0.6527156, 3.910908, 0.05098039, 0, 1, 1,
0.4137035, -0.8959583, 1.128559, 0.05490196, 0, 1, 1,
0.4143148, 0.4646599, 2.175097, 0.0627451, 0, 1, 1,
0.4143175, 0.005918586, 1.770228, 0.06666667, 0, 1, 1,
0.4159803, -0.3657736, 2.655436, 0.07450981, 0, 1, 1,
0.4176114, 0.3999956, 0.1159393, 0.07843138, 0, 1, 1,
0.4350277, 0.09981676, 1.015554, 0.08627451, 0, 1, 1,
0.4447625, -0.006777066, 2.127445, 0.09019608, 0, 1, 1,
0.4467198, -2.75131, 0.9730641, 0.09803922, 0, 1, 1,
0.4479319, -1.209028, 3.596757, 0.1058824, 0, 1, 1,
0.4488196, -0.391114, 2.246838, 0.1098039, 0, 1, 1,
0.4502593, -1.307613, 1.701824, 0.1176471, 0, 1, 1,
0.4532664, 0.3407692, -0.06528643, 0.1215686, 0, 1, 1,
0.4603519, -0.4597435, 3.996276, 0.1294118, 0, 1, 1,
0.4623539, -0.2126653, 1.563491, 0.1333333, 0, 1, 1,
0.4633236, -1.2105, 4.323971, 0.1411765, 0, 1, 1,
0.4645405, 0.3624931, -0.4484982, 0.145098, 0, 1, 1,
0.4658969, -0.8910003, 3.179004, 0.1529412, 0, 1, 1,
0.4691507, -0.06858478, 0.9470455, 0.1568628, 0, 1, 1,
0.4702568, -0.06896738, 1.560118, 0.1647059, 0, 1, 1,
0.4713165, 0.2524771, 1.87043, 0.1686275, 0, 1, 1,
0.4714057, -1.209467, 2.740549, 0.1764706, 0, 1, 1,
0.4744872, 0.4626012, 1.053149, 0.1803922, 0, 1, 1,
0.481016, 1.036554, 1.165016, 0.1882353, 0, 1, 1,
0.4813422, 0.460011, -0.702268, 0.1921569, 0, 1, 1,
0.4814835, 0.3798324, 1.450677, 0.2, 0, 1, 1,
0.4826092, 1.542094, -0.6471984, 0.2078431, 0, 1, 1,
0.4887251, -0.3581903, 2.742571, 0.2117647, 0, 1, 1,
0.491489, 1.892772, -0.4758786, 0.2196078, 0, 1, 1,
0.4963656, 0.2890205, 1.499617, 0.2235294, 0, 1, 1,
0.4965949, -0.3493923, 2.083244, 0.2313726, 0, 1, 1,
0.4966163, -1.05636, 2.467817, 0.2352941, 0, 1, 1,
0.4991889, 0.463332, -0.5769579, 0.2431373, 0, 1, 1,
0.5002474, -0.8056275, 2.522034, 0.2470588, 0, 1, 1,
0.5010454, -0.1184226, 1.168009, 0.254902, 0, 1, 1,
0.5029592, -1.571193, 2.835272, 0.2588235, 0, 1, 1,
0.5045539, 0.4543359, -3.248592, 0.2666667, 0, 1, 1,
0.5056847, -0.4110349, 1.804808, 0.2705882, 0, 1, 1,
0.515565, 0.1390656, 1.347053, 0.2784314, 0, 1, 1,
0.5256541, 1.203656, 0.7339821, 0.282353, 0, 1, 1,
0.5288913, -0.246186, 0.4430965, 0.2901961, 0, 1, 1,
0.529832, -0.3382422, 1.772643, 0.2941177, 0, 1, 1,
0.5315378, -0.1573957, 0.7273216, 0.3019608, 0, 1, 1,
0.5321977, 1.220962, 0.03923221, 0.3098039, 0, 1, 1,
0.5335705, 0.276808, 1.148311, 0.3137255, 0, 1, 1,
0.5355656, -0.2732537, 2.429159, 0.3215686, 0, 1, 1,
0.5366073, -0.591291, 0.7558492, 0.3254902, 0, 1, 1,
0.5385802, 0.4815915, 1.818476, 0.3333333, 0, 1, 1,
0.5458607, 2.335825, 0.468703, 0.3372549, 0, 1, 1,
0.5486367, 0.50731, 0.6735958, 0.345098, 0, 1, 1,
0.5492133, -1.726813, 1.886438, 0.3490196, 0, 1, 1,
0.5498663, -0.1191223, 3.430918, 0.3568628, 0, 1, 1,
0.553256, 0.6341147, 0.6810479, 0.3607843, 0, 1, 1,
0.5543888, -0.3885432, 2.799444, 0.3686275, 0, 1, 1,
0.5558085, 0.4926256, 0.3936383, 0.372549, 0, 1, 1,
0.5558113, 1.276398, 1.200595, 0.3803922, 0, 1, 1,
0.5577729, 0.82011, 0.6214161, 0.3843137, 0, 1, 1,
0.5597675, 0.1754871, 3.038437, 0.3921569, 0, 1, 1,
0.5644236, -0.7239816, 2.588089, 0.3960784, 0, 1, 1,
0.5771465, -0.5738837, 1.14194, 0.4039216, 0, 1, 1,
0.579735, 0.491304, 1.209751, 0.4117647, 0, 1, 1,
0.5938944, -0.2602615, 2.908116, 0.4156863, 0, 1, 1,
0.5942246, 0.1967088, 1.293405, 0.4235294, 0, 1, 1,
0.6023687, -0.6720644, 1.907108, 0.427451, 0, 1, 1,
0.6046858, -0.1162398, 1.191991, 0.4352941, 0, 1, 1,
0.6090406, -1.063976, 2.984052, 0.4392157, 0, 1, 1,
0.6150312, 1.326104, 0.4860064, 0.4470588, 0, 1, 1,
0.6155769, -0.3191226, 1.544032, 0.4509804, 0, 1, 1,
0.6187295, -0.4392724, 2.258728, 0.4588235, 0, 1, 1,
0.6261117, -1.127499, 2.913814, 0.4627451, 0, 1, 1,
0.6279942, -1.539791, 3.775822, 0.4705882, 0, 1, 1,
0.6289482, 0.3473896, 1.497964, 0.4745098, 0, 1, 1,
0.6317998, -0.6823045, 2.235465, 0.4823529, 0, 1, 1,
0.6333947, 1.282741, -0.6389091, 0.4862745, 0, 1, 1,
0.6358463, 0.09157687, 1.324573, 0.4941176, 0, 1, 1,
0.6377848, 0.8183382, 1.050836, 0.5019608, 0, 1, 1,
0.6389568, -0.9813622, 2.478283, 0.5058824, 0, 1, 1,
0.6408962, -0.9282496, 1.437422, 0.5137255, 0, 1, 1,
0.6481577, -0.2892025, 3.146397, 0.5176471, 0, 1, 1,
0.6488671, -1.311021, 3.098949, 0.5254902, 0, 1, 1,
0.6592619, -0.03004691, -0.4292554, 0.5294118, 0, 1, 1,
0.6616088, -0.3942077, 1.367238, 0.5372549, 0, 1, 1,
0.6622208, 1.115263, -0.1564032, 0.5411765, 0, 1, 1,
0.6665211, -1.001108, 1.446112, 0.5490196, 0, 1, 1,
0.6667345, 0.1510277, 1.545007, 0.5529412, 0, 1, 1,
0.6713654, 0.2920521, 2.060633, 0.5607843, 0, 1, 1,
0.6762354, -1.870052, 2.853262, 0.5647059, 0, 1, 1,
0.6766955, 1.565224, -0.1401513, 0.572549, 0, 1, 1,
0.6787813, -2.516419, 2.764158, 0.5764706, 0, 1, 1,
0.6889601, 0.8002075, 0.1518446, 0.5843138, 0, 1, 1,
0.6920623, -0.617791, 0.734966, 0.5882353, 0, 1, 1,
0.695721, -1.772126, 2.853356, 0.5960785, 0, 1, 1,
0.6972358, -0.7557215, 1.0992, 0.6039216, 0, 1, 1,
0.7022938, 0.04307128, -0.6041025, 0.6078432, 0, 1, 1,
0.7050912, -0.4795136, 3.649357, 0.6156863, 0, 1, 1,
0.7070171, 0.4146396, 2.237006, 0.6196079, 0, 1, 1,
0.708452, 2.104629, 3.699655, 0.627451, 0, 1, 1,
0.7096471, -0.7999632, 4.01938, 0.6313726, 0, 1, 1,
0.7105702, -1.416451, 2.518689, 0.6392157, 0, 1, 1,
0.7144333, -0.5627255, 1.777657, 0.6431373, 0, 1, 1,
0.7152439, -0.5900583, 2.022732, 0.6509804, 0, 1, 1,
0.7159536, -1.393135, 3.539606, 0.654902, 0, 1, 1,
0.7223177, -0.3200375, 2.907102, 0.6627451, 0, 1, 1,
0.7277332, -0.6618912, 1.649755, 0.6666667, 0, 1, 1,
0.7292475, -0.6574538, 2.302874, 0.6745098, 0, 1, 1,
0.7328705, -0.08026536, 2.522725, 0.6784314, 0, 1, 1,
0.7362347, 1.328431, -1.285949, 0.6862745, 0, 1, 1,
0.7397776, -1.918635, 2.774514, 0.6901961, 0, 1, 1,
0.7398226, -1.003529, 3.281232, 0.6980392, 0, 1, 1,
0.7511687, 0.724737, 1.294196, 0.7058824, 0, 1, 1,
0.7527559, 0.352023, 0.8987188, 0.7098039, 0, 1, 1,
0.7608238, -0.5368176, 1.690392, 0.7176471, 0, 1, 1,
0.7659714, -0.1850714, 1.633762, 0.7215686, 0, 1, 1,
0.7695234, 1.056555, 0.2852481, 0.7294118, 0, 1, 1,
0.7708051, -1.870627, 1.923446, 0.7333333, 0, 1, 1,
0.7713777, 1.233537, 0.9465796, 0.7411765, 0, 1, 1,
0.7716194, 1.427228, -0.1765536, 0.7450981, 0, 1, 1,
0.7748615, -1.297474, 2.093505, 0.7529412, 0, 1, 1,
0.7785109, 0.6517, 1.536132, 0.7568628, 0, 1, 1,
0.7866271, 0.5813694, 0.9580551, 0.7647059, 0, 1, 1,
0.7876096, 0.8725507, 0.9061936, 0.7686275, 0, 1, 1,
0.7889794, -0.5066149, 3.480757, 0.7764706, 0, 1, 1,
0.7904302, -1.046345, 2.512714, 0.7803922, 0, 1, 1,
0.7904885, -0.2124318, 0.08968468, 0.7882353, 0, 1, 1,
0.7986785, 0.6177284, -0.2858822, 0.7921569, 0, 1, 1,
0.8006219, 1.621846, 1.299216, 0.8, 0, 1, 1,
0.8012874, -0.3284528, 0.1496564, 0.8078431, 0, 1, 1,
0.8125803, -0.3299315, 0.5931879, 0.8117647, 0, 1, 1,
0.8178992, -1.387394, 2.588904, 0.8196079, 0, 1, 1,
0.8200986, -1.457526, -0.658365, 0.8235294, 0, 1, 1,
0.8209012, -0.03572894, 1.901925, 0.8313726, 0, 1, 1,
0.8220665, -0.9903411, 2.621655, 0.8352941, 0, 1, 1,
0.8300276, 0.6313305, 1.56933, 0.8431373, 0, 1, 1,
0.8308899, 0.0359522, 2.203582, 0.8470588, 0, 1, 1,
0.8363404, -0.4618329, -0.104264, 0.854902, 0, 1, 1,
0.8376237, -1.034435, 2.852813, 0.8588235, 0, 1, 1,
0.8416551, 0.7370071, 1.131761, 0.8666667, 0, 1, 1,
0.8519585, -1.207807, 3.306085, 0.8705882, 0, 1, 1,
0.8567476, -0.8281167, 3.665877, 0.8784314, 0, 1, 1,
0.8663586, 0.0535112, 2.477693, 0.8823529, 0, 1, 1,
0.8802606, -0.8638021, 1.125607, 0.8901961, 0, 1, 1,
0.8813569, -0.04443031, 1.466583, 0.8941177, 0, 1, 1,
0.8838246, -0.5045678, 2.354831, 0.9019608, 0, 1, 1,
0.8861108, -0.1678061, 0.2334374, 0.9098039, 0, 1, 1,
0.8864528, 2.127587, -0.385067, 0.9137255, 0, 1, 1,
0.8893567, 1.571575, 0.06353882, 0.9215686, 0, 1, 1,
0.8989324, 0.03848975, 1.161201, 0.9254902, 0, 1, 1,
0.899304, -1.986426, 2.2808, 0.9333333, 0, 1, 1,
0.9109691, 1.050751, 0.4445637, 0.9372549, 0, 1, 1,
0.9219295, 1.91802, 1.038739, 0.945098, 0, 1, 1,
0.9240686, -0.5962227, 0.3290211, 0.9490196, 0, 1, 1,
0.9266088, 1.588993, 0.7724493, 0.9568627, 0, 1, 1,
0.9293013, 0.959004, 0.7493051, 0.9607843, 0, 1, 1,
0.931985, -0.9411262, 3.385481, 0.9686275, 0, 1, 1,
0.9328189, 0.16697, 2.126539, 0.972549, 0, 1, 1,
0.936966, -0.8436884, 4.338151, 0.9803922, 0, 1, 1,
0.9387246, 0.3990732, 1.860232, 0.9843137, 0, 1, 1,
0.9401237, 0.5140215, 1.838555, 0.9921569, 0, 1, 1,
0.9435934, 0.353458, -0.02368751, 0.9960784, 0, 1, 1,
0.9465903, 0.2094312, 0.5800961, 1, 0, 0.9960784, 1,
0.9488646, 0.1253428, 1.292072, 1, 0, 0.9882353, 1,
0.9531506, -0.9041889, 0.5878866, 1, 0, 0.9843137, 1,
0.9532201, 0.0553164, 0.3417709, 1, 0, 0.9764706, 1,
0.9549369, -0.134249, 2.020305, 1, 0, 0.972549, 1,
0.9608497, -0.2599081, 3.332783, 1, 0, 0.9647059, 1,
0.9698102, -0.7035337, 2.341047, 1, 0, 0.9607843, 1,
0.9723228, -0.8516277, 2.135734, 1, 0, 0.9529412, 1,
0.9740226, 1.148812, 0.4599821, 1, 0, 0.9490196, 1,
0.9753258, -0.3128363, 0.1506728, 1, 0, 0.9411765, 1,
0.975507, 0.7613957, 0.2204732, 1, 0, 0.9372549, 1,
0.9812573, -0.6210005, 2.005389, 1, 0, 0.9294118, 1,
0.9817994, 0.1666632, 0.7586856, 1, 0, 0.9254902, 1,
0.9837572, -0.1514034, 2.025402, 1, 0, 0.9176471, 1,
0.9859012, 0.1186159, 1.306078, 1, 0, 0.9137255, 1,
0.9878296, -0.8468928, 3.372734, 1, 0, 0.9058824, 1,
0.9934936, -0.4045082, 3.997619, 1, 0, 0.9019608, 1,
0.9969087, -0.8791444, 2.482367, 1, 0, 0.8941177, 1,
1.000579, 0.6511514, 2.293225, 1, 0, 0.8862745, 1,
1.001413, -0.04804834, 2.61832, 1, 0, 0.8823529, 1,
1.006059, 0.21036, 1.48467, 1, 0, 0.8745098, 1,
1.012099, 1.369133, 0.9128614, 1, 0, 0.8705882, 1,
1.019367, -0.7049627, 1.843631, 1, 0, 0.8627451, 1,
1.022646, -1.06664, 1.490431, 1, 0, 0.8588235, 1,
1.024406, 0.005500201, 1.380631, 1, 0, 0.8509804, 1,
1.032215, -0.6236758, 2.052841, 1, 0, 0.8470588, 1,
1.043338, 0.1192312, 0.9295436, 1, 0, 0.8392157, 1,
1.044434, 0.4023363, 1.727405, 1, 0, 0.8352941, 1,
1.045881, -1.401622, 1.116641, 1, 0, 0.827451, 1,
1.053915, -1.466745, 2.131652, 1, 0, 0.8235294, 1,
1.053952, 0.5692834, 2.619166, 1, 0, 0.8156863, 1,
1.065824, 0.5802141, 0.8250126, 1, 0, 0.8117647, 1,
1.065939, 0.5559506, -1.105953, 1, 0, 0.8039216, 1,
1.067372, -0.23725, 2.919217, 1, 0, 0.7960784, 1,
1.06963, -0.04471754, 0.1401758, 1, 0, 0.7921569, 1,
1.080763, -1.276075, 2.376753, 1, 0, 0.7843137, 1,
1.085251, 1.369033, 0.2680061, 1, 0, 0.7803922, 1,
1.089419, 1.646614, 0.3833396, 1, 0, 0.772549, 1,
1.096406, -0.719265, 2.766301, 1, 0, 0.7686275, 1,
1.097739, -2.849722, 2.919793, 1, 0, 0.7607843, 1,
1.09891, 0.3977693, 1.354154, 1, 0, 0.7568628, 1,
1.106492, 0.03826268, 1.056782, 1, 0, 0.7490196, 1,
1.109959, -0.6941146, 2.151776, 1, 0, 0.7450981, 1,
1.11214, 0.4738985, 0.3358333, 1, 0, 0.7372549, 1,
1.116801, -0.1049009, 1.624751, 1, 0, 0.7333333, 1,
1.117575, 0.4594615, 1.251948, 1, 0, 0.7254902, 1,
1.118462, 1.154669, -1.433697, 1, 0, 0.7215686, 1,
1.126855, -0.0665448, 2.001356, 1, 0, 0.7137255, 1,
1.128017, 2.54553, 1.777505, 1, 0, 0.7098039, 1,
1.136825, 0.5473592, 2.307461, 1, 0, 0.7019608, 1,
1.153455, 0.2502705, 1.374597, 1, 0, 0.6941177, 1,
1.162591, -0.4680535, 1.720258, 1, 0, 0.6901961, 1,
1.181596, -0.304783, 2.561934, 1, 0, 0.682353, 1,
1.184541, 0.7288613, -0.4001262, 1, 0, 0.6784314, 1,
1.188293, 0.577067, 2.471492, 1, 0, 0.6705883, 1,
1.202356, 0.5990059, -0.1199542, 1, 0, 0.6666667, 1,
1.205931, 1.129317, 0.03576402, 1, 0, 0.6588235, 1,
1.215513, -0.6340007, 2.506727, 1, 0, 0.654902, 1,
1.223207, -1.449533, 1.775311, 1, 0, 0.6470588, 1,
1.225983, -0.2588275, 1.805102, 1, 0, 0.6431373, 1,
1.231858, 0.06926809, 1.103492, 1, 0, 0.6352941, 1,
1.234939, 0.4451191, 1.09916, 1, 0, 0.6313726, 1,
1.240461, -1.003042, 2.12625, 1, 0, 0.6235294, 1,
1.258581, 0.6214173, 0.4347098, 1, 0, 0.6196079, 1,
1.262594, 0.6003783, 2.603974, 1, 0, 0.6117647, 1,
1.263183, 0.7539794, -0.138512, 1, 0, 0.6078432, 1,
1.265038, -0.7862366, 0.9386504, 1, 0, 0.6, 1,
1.267596, 2.211484, 1.561054, 1, 0, 0.5921569, 1,
1.268061, -0.5888563, 3.736943, 1, 0, 0.5882353, 1,
1.268787, -0.1487065, 1.91864, 1, 0, 0.5803922, 1,
1.269454, -0.6687869, 0.1615308, 1, 0, 0.5764706, 1,
1.272603, -0.08641437, 0.7944275, 1, 0, 0.5686275, 1,
1.273153, -0.07868623, 2.041581, 1, 0, 0.5647059, 1,
1.297424, -0.4609744, 2.437347, 1, 0, 0.5568628, 1,
1.297463, 0.6358598, 0.564116, 1, 0, 0.5529412, 1,
1.305341, -0.8255602, 0.9431103, 1, 0, 0.5450981, 1,
1.306145, -0.2461354, 0.5134465, 1, 0, 0.5411765, 1,
1.339448, 0.2400851, 2.323436, 1, 0, 0.5333334, 1,
1.342829, 0.4895642, 2.259935, 1, 0, 0.5294118, 1,
1.34741, -0.6257095, 1.999828, 1, 0, 0.5215687, 1,
1.350618, 0.004667475, 2.735856, 1, 0, 0.5176471, 1,
1.355978, -0.2012232, 0.195188, 1, 0, 0.509804, 1,
1.369575, -2.024887, 1.854212, 1, 0, 0.5058824, 1,
1.372413, 0.09691954, 2.45451, 1, 0, 0.4980392, 1,
1.375468, -0.7825353, 1.762032, 1, 0, 0.4901961, 1,
1.378195, 0.3355271, 1.334474, 1, 0, 0.4862745, 1,
1.400928, 0.8949721, 2.793597, 1, 0, 0.4784314, 1,
1.415894, -1.465305, 2.274175, 1, 0, 0.4745098, 1,
1.424691, -0.09088393, 0.4987738, 1, 0, 0.4666667, 1,
1.425886, -1.774395, 2.346121, 1, 0, 0.4627451, 1,
1.430498, -0.2843271, 1.719232, 1, 0, 0.454902, 1,
1.430935, -0.3480144, 1.294246, 1, 0, 0.4509804, 1,
1.435885, -0.3695633, 3.915059, 1, 0, 0.4431373, 1,
1.438277, -0.7220604, 2.527286, 1, 0, 0.4392157, 1,
1.455941, -0.1181179, 2.475938, 1, 0, 0.4313726, 1,
1.457301, 0.5798698, -0.1708458, 1, 0, 0.427451, 1,
1.457473, -0.9952015, 1.989504, 1, 0, 0.4196078, 1,
1.469184, 0.3309724, 1.662137, 1, 0, 0.4156863, 1,
1.473535, 0.02328086, 0.73724, 1, 0, 0.4078431, 1,
1.475818, -0.3522253, 1.132539, 1, 0, 0.4039216, 1,
1.480446, -1.385616, 3.687924, 1, 0, 0.3960784, 1,
1.49409, -1.433904, 2.141211, 1, 0, 0.3882353, 1,
1.496616, 0.7367671, 2.495339, 1, 0, 0.3843137, 1,
1.498063, 1.593618, -0.1736432, 1, 0, 0.3764706, 1,
1.510071, -1.495945, 0.1847314, 1, 0, 0.372549, 1,
1.51234, -0.1972458, 2.147379, 1, 0, 0.3647059, 1,
1.535759, 2.184102, 0.7782114, 1, 0, 0.3607843, 1,
1.556657, 0.1863171, 2.711767, 1, 0, 0.3529412, 1,
1.565192, 0.7214553, 2.103493, 1, 0, 0.3490196, 1,
1.568096, 0.5482414, 2.829383, 1, 0, 0.3411765, 1,
1.599245, -0.5898378, 2.605918, 1, 0, 0.3372549, 1,
1.599703, 0.2626204, 1.635886, 1, 0, 0.3294118, 1,
1.625307, -0.0907314, 1.159719, 1, 0, 0.3254902, 1,
1.631086, 1.038563, 1.597297, 1, 0, 0.3176471, 1,
1.648478, -0.759791, 2.845669, 1, 0, 0.3137255, 1,
1.673943, 0.1589192, 3.707243, 1, 0, 0.3058824, 1,
1.713259, 0.4593512, 3.874935, 1, 0, 0.2980392, 1,
1.718493, -0.7931232, 1.769104, 1, 0, 0.2941177, 1,
1.720905, -2.614418, 2.244713, 1, 0, 0.2862745, 1,
1.736673, 0.2256003, 0.03198558, 1, 0, 0.282353, 1,
1.738403, 0.2891587, 2.726614, 1, 0, 0.2745098, 1,
1.767288, 0.5817205, 1.857913, 1, 0, 0.2705882, 1,
1.780397, 1.039887, 3.031093, 1, 0, 0.2627451, 1,
1.80483, -0.3102695, 1.005482, 1, 0, 0.2588235, 1,
1.824922, 0.1367112, 2.003355, 1, 0, 0.2509804, 1,
1.833152, -0.1365732, 1.257536, 1, 0, 0.2470588, 1,
1.838729, -1.305922, 0.8117761, 1, 0, 0.2392157, 1,
1.853531, -0.385854, 1.86188, 1, 0, 0.2352941, 1,
1.860535, -1.613274, 3.279208, 1, 0, 0.227451, 1,
1.860676, -1.971566, 1.511298, 1, 0, 0.2235294, 1,
1.88524, -0.6034967, 1.631348, 1, 0, 0.2156863, 1,
1.926423, 0.2784895, 1.273756, 1, 0, 0.2117647, 1,
1.930109, -0.2241789, 3.008236, 1, 0, 0.2039216, 1,
1.947042, 0.4595344, 2.251974, 1, 0, 0.1960784, 1,
1.960737, -0.6722172, 0.5834532, 1, 0, 0.1921569, 1,
1.961277, 0.5038792, 1.146991, 1, 0, 0.1843137, 1,
1.963849, 0.676183, 1.854793, 1, 0, 0.1803922, 1,
2.041414, -1.500076, 2.025877, 1, 0, 0.172549, 1,
2.049273, 0.6768463, 1.416072, 1, 0, 0.1686275, 1,
2.080295, -1.129384, 2.26785, 1, 0, 0.1607843, 1,
2.084898, 1.067653, 0.5403785, 1, 0, 0.1568628, 1,
2.108724, 1.326966, 1.318538, 1, 0, 0.1490196, 1,
2.140825, 0.5249018, 1.833091, 1, 0, 0.145098, 1,
2.142697, 1.992705, 1.73616, 1, 0, 0.1372549, 1,
2.145196, 2.202164, 2.11899, 1, 0, 0.1333333, 1,
2.149444, 2.052881, -0.3231372, 1, 0, 0.1254902, 1,
2.149686, 0.3277073, 1.351571, 1, 0, 0.1215686, 1,
2.181448, 1.289689, 0.185311, 1, 0, 0.1137255, 1,
2.242133, -0.8660757, 1.690783, 1, 0, 0.1098039, 1,
2.270765, -2.795548, 1.93105, 1, 0, 0.1019608, 1,
2.275754, -2.309233, 1.813265, 1, 0, 0.09411765, 1,
2.299877, -0.3487596, 2.103334, 1, 0, 0.09019608, 1,
2.307761, 1.151401, 0.8310859, 1, 0, 0.08235294, 1,
2.365788, -0.2747534, 3.63715, 1, 0, 0.07843138, 1,
2.40973, -0.642258, 3.034998, 1, 0, 0.07058824, 1,
2.411457, 0.0760457, 0.8194113, 1, 0, 0.06666667, 1,
2.468561, -0.266992, 1.329546, 1, 0, 0.05882353, 1,
2.511403, 0.3912785, 1.694677, 1, 0, 0.05490196, 1,
2.537567, -0.2972819, 1.46243, 1, 0, 0.04705882, 1,
2.574446, -0.8432171, 1.49644, 1, 0, 0.04313726, 1,
2.631841, 0.4644541, 1.476093, 1, 0, 0.03529412, 1,
2.639146, -0.3977977, 2.56221, 1, 0, 0.03137255, 1,
2.690993, -0.3553507, 2.82875, 1, 0, 0.02352941, 1,
2.726006, 0.5079415, 0.03871645, 1, 0, 0.01960784, 1,
2.902165, -1.712871, 1.606546, 1, 0, 0.01176471, 1,
3.160887, -0.4839041, 2.710281, 1, 0, 0.007843138, 1
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
0.03073633, -3.878688, -6.635296, 0, -0.5, 0.5, 0.5,
0.03073633, -3.878688, -6.635296, 1, -0.5, 0.5, 0.5,
0.03073633, -3.878688, -6.635296, 1, 1.5, 0.5, 0.5,
0.03073633, -3.878688, -6.635296, 0, 1.5, 0.5, 0.5
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
-4.160536, -0.05109942, -6.635296, 0, -0.5, 0.5, 0.5,
-4.160536, -0.05109942, -6.635296, 1, -0.5, 0.5, 0.5,
-4.160536, -0.05109942, -6.635296, 1, 1.5, 0.5, 0.5,
-4.160536, -0.05109942, -6.635296, 0, 1.5, 0.5, 0.5
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
-4.160536, -3.878688, 0.4924967, 0, -0.5, 0.5, 0.5,
-4.160536, -3.878688, 0.4924967, 1, -0.5, 0.5, 0.5,
-4.160536, -3.878688, 0.4924967, 1, 1.5, 0.5, 0.5,
-4.160536, -3.878688, 0.4924967, 0, 1.5, 0.5, 0.5
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
-3, -2.995398, -4.990421,
3, -2.995398, -4.990421,
-3, -2.995398, -4.990421,
-3, -3.142613, -5.264567,
-2, -2.995398, -4.990421,
-2, -3.142613, -5.264567,
-1, -2.995398, -4.990421,
-1, -3.142613, -5.264567,
0, -2.995398, -4.990421,
0, -3.142613, -5.264567,
1, -2.995398, -4.990421,
1, -3.142613, -5.264567,
2, -2.995398, -4.990421,
2, -3.142613, -5.264567,
3, -2.995398, -4.990421,
3, -3.142613, -5.264567
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
-3, -3.437043, -5.812859, 0, -0.5, 0.5, 0.5,
-3, -3.437043, -5.812859, 1, -0.5, 0.5, 0.5,
-3, -3.437043, -5.812859, 1, 1.5, 0.5, 0.5,
-3, -3.437043, -5.812859, 0, 1.5, 0.5, 0.5,
-2, -3.437043, -5.812859, 0, -0.5, 0.5, 0.5,
-2, -3.437043, -5.812859, 1, -0.5, 0.5, 0.5,
-2, -3.437043, -5.812859, 1, 1.5, 0.5, 0.5,
-2, -3.437043, -5.812859, 0, 1.5, 0.5, 0.5,
-1, -3.437043, -5.812859, 0, -0.5, 0.5, 0.5,
-1, -3.437043, -5.812859, 1, -0.5, 0.5, 0.5,
-1, -3.437043, -5.812859, 1, 1.5, 0.5, 0.5,
-1, -3.437043, -5.812859, 0, 1.5, 0.5, 0.5,
0, -3.437043, -5.812859, 0, -0.5, 0.5, 0.5,
0, -3.437043, -5.812859, 1, -0.5, 0.5, 0.5,
0, -3.437043, -5.812859, 1, 1.5, 0.5, 0.5,
0, -3.437043, -5.812859, 0, 1.5, 0.5, 0.5,
1, -3.437043, -5.812859, 0, -0.5, 0.5, 0.5,
1, -3.437043, -5.812859, 1, -0.5, 0.5, 0.5,
1, -3.437043, -5.812859, 1, 1.5, 0.5, 0.5,
1, -3.437043, -5.812859, 0, 1.5, 0.5, 0.5,
2, -3.437043, -5.812859, 0, -0.5, 0.5, 0.5,
2, -3.437043, -5.812859, 1, -0.5, 0.5, 0.5,
2, -3.437043, -5.812859, 1, 1.5, 0.5, 0.5,
2, -3.437043, -5.812859, 0, 1.5, 0.5, 0.5,
3, -3.437043, -5.812859, 0, -0.5, 0.5, 0.5,
3, -3.437043, -5.812859, 1, -0.5, 0.5, 0.5,
3, -3.437043, -5.812859, 1, 1.5, 0.5, 0.5,
3, -3.437043, -5.812859, 0, 1.5, 0.5, 0.5
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
-3.193319, -2, -4.990421,
-3.193319, 2, -4.990421,
-3.193319, -2, -4.990421,
-3.354522, -2, -5.264567,
-3.193319, -1, -4.990421,
-3.354522, -1, -5.264567,
-3.193319, 0, -4.990421,
-3.354522, 0, -5.264567,
-3.193319, 1, -4.990421,
-3.354522, 1, -5.264567,
-3.193319, 2, -4.990421,
-3.354522, 2, -5.264567
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
-3.676928, -2, -5.812859, 0, -0.5, 0.5, 0.5,
-3.676928, -2, -5.812859, 1, -0.5, 0.5, 0.5,
-3.676928, -2, -5.812859, 1, 1.5, 0.5, 0.5,
-3.676928, -2, -5.812859, 0, 1.5, 0.5, 0.5,
-3.676928, -1, -5.812859, 0, -0.5, 0.5, 0.5,
-3.676928, -1, -5.812859, 1, -0.5, 0.5, 0.5,
-3.676928, -1, -5.812859, 1, 1.5, 0.5, 0.5,
-3.676928, -1, -5.812859, 0, 1.5, 0.5, 0.5,
-3.676928, 0, -5.812859, 0, -0.5, 0.5, 0.5,
-3.676928, 0, -5.812859, 1, -0.5, 0.5, 0.5,
-3.676928, 0, -5.812859, 1, 1.5, 0.5, 0.5,
-3.676928, 0, -5.812859, 0, 1.5, 0.5, 0.5,
-3.676928, 1, -5.812859, 0, -0.5, 0.5, 0.5,
-3.676928, 1, -5.812859, 1, -0.5, 0.5, 0.5,
-3.676928, 1, -5.812859, 1, 1.5, 0.5, 0.5,
-3.676928, 1, -5.812859, 0, 1.5, 0.5, 0.5,
-3.676928, 2, -5.812859, 0, -0.5, 0.5, 0.5,
-3.676928, 2, -5.812859, 1, -0.5, 0.5, 0.5,
-3.676928, 2, -5.812859, 1, 1.5, 0.5, 0.5,
-3.676928, 2, -5.812859, 0, 1.5, 0.5, 0.5
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
-3.193319, -2.995398, -4,
-3.193319, -2.995398, 4,
-3.193319, -2.995398, -4,
-3.354522, -3.142613, -4,
-3.193319, -2.995398, -2,
-3.354522, -3.142613, -2,
-3.193319, -2.995398, 0,
-3.354522, -3.142613, 0,
-3.193319, -2.995398, 2,
-3.354522, -3.142613, 2,
-3.193319, -2.995398, 4,
-3.354522, -3.142613, 4
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
-3.676928, -3.437043, -4, 0, -0.5, 0.5, 0.5,
-3.676928, -3.437043, -4, 1, -0.5, 0.5, 0.5,
-3.676928, -3.437043, -4, 1, 1.5, 0.5, 0.5,
-3.676928, -3.437043, -4, 0, 1.5, 0.5, 0.5,
-3.676928, -3.437043, -2, 0, -0.5, 0.5, 0.5,
-3.676928, -3.437043, -2, 1, -0.5, 0.5, 0.5,
-3.676928, -3.437043, -2, 1, 1.5, 0.5, 0.5,
-3.676928, -3.437043, -2, 0, 1.5, 0.5, 0.5,
-3.676928, -3.437043, 0, 0, -0.5, 0.5, 0.5,
-3.676928, -3.437043, 0, 1, -0.5, 0.5, 0.5,
-3.676928, -3.437043, 0, 1, 1.5, 0.5, 0.5,
-3.676928, -3.437043, 0, 0, 1.5, 0.5, 0.5,
-3.676928, -3.437043, 2, 0, -0.5, 0.5, 0.5,
-3.676928, -3.437043, 2, 1, -0.5, 0.5, 0.5,
-3.676928, -3.437043, 2, 1, 1.5, 0.5, 0.5,
-3.676928, -3.437043, 2, 0, 1.5, 0.5, 0.5,
-3.676928, -3.437043, 4, 0, -0.5, 0.5, 0.5,
-3.676928, -3.437043, 4, 1, -0.5, 0.5, 0.5,
-3.676928, -3.437043, 4, 1, 1.5, 0.5, 0.5,
-3.676928, -3.437043, 4, 0, 1.5, 0.5, 0.5
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
-3.193319, -2.995398, -4.990421,
-3.193319, 2.893199, -4.990421,
-3.193319, -2.995398, 5.975414,
-3.193319, 2.893199, 5.975414,
-3.193319, -2.995398, -4.990421,
-3.193319, -2.995398, 5.975414,
-3.193319, 2.893199, -4.990421,
-3.193319, 2.893199, 5.975414,
-3.193319, -2.995398, -4.990421,
3.254792, -2.995398, -4.990421,
-3.193319, -2.995398, 5.975414,
3.254792, -2.995398, 5.975414,
-3.193319, 2.893199, -4.990421,
3.254792, 2.893199, -4.990421,
-3.193319, 2.893199, 5.975414,
3.254792, 2.893199, 5.975414,
3.254792, -2.995398, -4.990421,
3.254792, 2.893199, -4.990421,
3.254792, -2.995398, 5.975414,
3.254792, 2.893199, 5.975414,
3.254792, -2.995398, -4.990421,
3.254792, -2.995398, 5.975414,
3.254792, 2.893199, -4.990421,
3.254792, 2.893199, 5.975414
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
var radius = 7.48532;
var distance = 33.30303;
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
mvMatrix.translate( -0.03073633, 0.05109942, -0.4924967 );
mvMatrix.scale( 1.255139, 1.374398, 0.7380445 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.30303);
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
trichlorophenyl_etha<-read.table("trichlorophenyl_etha.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trichlorophenyl_etha$V2
```

```
## Error in eval(expr, envir, enclos): object 'trichlorophenyl_etha' not found
```

```r
y<-trichlorophenyl_etha$V3
```

```
## Error in eval(expr, envir, enclos): object 'trichlorophenyl_etha' not found
```

```r
z<-trichlorophenyl_etha$V4
```

```
## Error in eval(expr, envir, enclos): object 'trichlorophenyl_etha' not found
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
-3.099415, 0.1883546, 1.047879, 0, 0, 1, 1, 1,
-2.948328, -0.4927058, -2.16084, 1, 0, 0, 1, 1,
-2.917612, -0.5037002, -1.030707, 1, 0, 0, 1, 1,
-2.895818, 0.8632944, -1.580968, 1, 0, 0, 1, 1,
-2.689731, 1.168595, -0.5939034, 1, 0, 0, 1, 1,
-2.615827, -0.1335131, -2.222309, 1, 0, 0, 1, 1,
-2.510702, 0.4248195, -3.222857, 0, 0, 0, 1, 1,
-2.49586, 0.533545, -2.963462, 0, 0, 0, 1, 1,
-2.492015, 0.7492087, -0.3158226, 0, 0, 0, 1, 1,
-2.407904, -0.2595278, -1.310974, 0, 0, 0, 1, 1,
-2.309214, 0.5128844, -0.04678085, 0, 0, 0, 1, 1,
-2.272284, 0.4522634, -0.7672129, 0, 0, 0, 1, 1,
-2.218758, 0.08295941, -0.001689198, 0, 0, 0, 1, 1,
-2.216373, 0.8904037, 0.3915354, 1, 1, 1, 1, 1,
-2.2094, -1.249816, -2.334428, 1, 1, 1, 1, 1,
-2.197605, -0.4835823, -2.642107, 1, 1, 1, 1, 1,
-2.181443, 2.448845, 0.7791678, 1, 1, 1, 1, 1,
-2.160431, 1.501059, -3.202933, 1, 1, 1, 1, 1,
-2.096833, -0.2414448, -1.400528, 1, 1, 1, 1, 1,
-2.085377, -0.486656, -1.586908, 1, 1, 1, 1, 1,
-2.084461, -1.612491, -1.721969, 1, 1, 1, 1, 1,
-2.055602, -1.463044, -2.546327, 1, 1, 1, 1, 1,
-2.035068, 0.7039395, -0.1613274, 1, 1, 1, 1, 1,
-2.01419, 0.1423393, -2.659378, 1, 1, 1, 1, 1,
-1.97173, 1.424856, -1.741205, 1, 1, 1, 1, 1,
-1.952158, -0.137559, -1.417464, 1, 1, 1, 1, 1,
-1.951094, -1.269038, -2.021225, 1, 1, 1, 1, 1,
-1.934133, 0.05897871, -1.25573, 1, 1, 1, 1, 1,
-1.923523, 0.1158937, -2.641354, 0, 0, 1, 1, 1,
-1.903553, -0.2943227, -1.528521, 1, 0, 0, 1, 1,
-1.893287, -0.09520122, -2.303163, 1, 0, 0, 1, 1,
-1.873857, -1.068046, -1.236819, 1, 0, 0, 1, 1,
-1.868618, -1.968164, -3.05655, 1, 0, 0, 1, 1,
-1.86618, -1.931979, -3.354877, 1, 0, 0, 1, 1,
-1.863361, 0.3713965, -1.51759, 0, 0, 0, 1, 1,
-1.824491, -1.874477, -2.443539, 0, 0, 0, 1, 1,
-1.821905, -0.7192435, -3.567895, 0, 0, 0, 1, 1,
-1.812123, -1.408602, -2.072542, 0, 0, 0, 1, 1,
-1.76753, -0.333003, -1.661909, 0, 0, 0, 1, 1,
-1.767059, -1.328268, -2.407648, 0, 0, 0, 1, 1,
-1.767026, 1.206786, -1.130157, 0, 0, 0, 1, 1,
-1.752368, -0.196669, 0.02281585, 1, 1, 1, 1, 1,
-1.748539, 1.196429, 0.3387873, 1, 1, 1, 1, 1,
-1.738841, 1.379862, -2.439018, 1, 1, 1, 1, 1,
-1.733164, 1.363824, -2.404925, 1, 1, 1, 1, 1,
-1.7149, 0.3510946, -1.991301, 1, 1, 1, 1, 1,
-1.708069, -0.9002807, -3.951546, 1, 1, 1, 1, 1,
-1.695356, -2.457759, -3.1595, 1, 1, 1, 1, 1,
-1.692046, 1.517716, -1.512087, 1, 1, 1, 1, 1,
-1.674955, 0.9400865, -0.8268402, 1, 1, 1, 1, 1,
-1.670114, 1.762838, -0.7020424, 1, 1, 1, 1, 1,
-1.662252, -0.3766703, -2.632704, 1, 1, 1, 1, 1,
-1.650138, -1.066979, -1.317471, 1, 1, 1, 1, 1,
-1.647816, -0.664023, -3.650263, 1, 1, 1, 1, 1,
-1.635177, 1.142634, -1.820876, 1, 1, 1, 1, 1,
-1.624022, 1.38547, -1.3601, 1, 1, 1, 1, 1,
-1.614963, -0.7761469, -2.278122, 0, 0, 1, 1, 1,
-1.573162, 0.8545933, -2.931911, 1, 0, 0, 1, 1,
-1.568126, -0.7865423, -1.430864, 1, 0, 0, 1, 1,
-1.566076, -0.1260199, -1.355499, 1, 0, 0, 1, 1,
-1.537143, 0.89893, -0.2855524, 1, 0, 0, 1, 1,
-1.535621, -0.3338822, -2.603998, 1, 0, 0, 1, 1,
-1.528773, -1.600063, -1.501642, 0, 0, 0, 1, 1,
-1.518993, 1.527635, -0.8414196, 0, 0, 0, 1, 1,
-1.515364, 1.743031, -0.5877645, 0, 0, 0, 1, 1,
-1.49153, 1.725582, -1.082264, 0, 0, 0, 1, 1,
-1.490221, -0.4206903, -1.292759, 0, 0, 0, 1, 1,
-1.489018, 0.4642317, -0.6719167, 0, 0, 0, 1, 1,
-1.476007, -0.8637241, -0.5556502, 0, 0, 0, 1, 1,
-1.470963, -1.472502, -1.038835, 1, 1, 1, 1, 1,
-1.470904, 0.1057247, -2.616378, 1, 1, 1, 1, 1,
-1.467371, -0.2564985, -2.985781, 1, 1, 1, 1, 1,
-1.465115, 0.8072231, -1.346714, 1, 1, 1, 1, 1,
-1.4649, 1.103129, -1.448626, 1, 1, 1, 1, 1,
-1.440317, 0.682806, -0.4347365, 1, 1, 1, 1, 1,
-1.427796, 1.001165, -1.048882, 1, 1, 1, 1, 1,
-1.422866, 0.315451, -2.097574, 1, 1, 1, 1, 1,
-1.414049, 2.173187, -1.744256, 1, 1, 1, 1, 1,
-1.405396, -0.3216093, -0.9918044, 1, 1, 1, 1, 1,
-1.404325, 0.2492768, -2.093349, 1, 1, 1, 1, 1,
-1.403395, -0.6301191, -2.374768, 1, 1, 1, 1, 1,
-1.401665, 0.323667, -4.240976, 1, 1, 1, 1, 1,
-1.40073, -0.1014749, -0.4367072, 1, 1, 1, 1, 1,
-1.400261, 0.2369567, -0.8759668, 1, 1, 1, 1, 1,
-1.397119, 0.07580964, -2.339154, 0, 0, 1, 1, 1,
-1.394629, -0.850304, -0.1187777, 1, 0, 0, 1, 1,
-1.383986, 0.4692985, -1.330606, 1, 0, 0, 1, 1,
-1.376113, 0.4191537, 0.4232345, 1, 0, 0, 1, 1,
-1.369928, 0.7239519, -0.5639952, 1, 0, 0, 1, 1,
-1.365231, -0.892078, -2.944717, 1, 0, 0, 1, 1,
-1.363297, -0.5358888, -2.200931, 0, 0, 0, 1, 1,
-1.361255, 0.08343299, -1.66729, 0, 0, 0, 1, 1,
-1.353056, 0.894463, -1.951936, 0, 0, 0, 1, 1,
-1.3517, 0.2478561, -0.3587042, 0, 0, 0, 1, 1,
-1.336834, 0.3206268, -2.216168, 0, 0, 0, 1, 1,
-1.33442, 0.3621967, -1.306328, 0, 0, 0, 1, 1,
-1.318866, -1.227556, -2.275158, 0, 0, 0, 1, 1,
-1.318138, -1.39841, -2.914183, 1, 1, 1, 1, 1,
-1.310843, -0.3191205, -1.789253, 1, 1, 1, 1, 1,
-1.309586, 0.3129998, -0.5293029, 1, 1, 1, 1, 1,
-1.300352, -2.306756, -2.129665, 1, 1, 1, 1, 1,
-1.284647, -0.7503141, -0.1216862, 1, 1, 1, 1, 1,
-1.283593, 0.3788413, -2.355263, 1, 1, 1, 1, 1,
-1.278864, -1.717461, -2.829619, 1, 1, 1, 1, 1,
-1.276066, -0.9499668, -2.891778, 1, 1, 1, 1, 1,
-1.275607, 0.2761656, -1.978298, 1, 1, 1, 1, 1,
-1.27527, -0.7538071, -2.928716, 1, 1, 1, 1, 1,
-1.266411, -0.7455596, -0.8829708, 1, 1, 1, 1, 1,
-1.263095, 0.4986775, -2.367279, 1, 1, 1, 1, 1,
-1.253157, 1.271524, 0.03236979, 1, 1, 1, 1, 1,
-1.244454, -0.5622103, -1.223714, 1, 1, 1, 1, 1,
-1.2286, 1.672574, -0.4506508, 1, 1, 1, 1, 1,
-1.206598, -0.1339202, 0.1645594, 0, 0, 1, 1, 1,
-1.198107, -1.173823, -2.492204, 1, 0, 0, 1, 1,
-1.181702, 1.292271, -0.4891421, 1, 0, 0, 1, 1,
-1.177718, -0.6556556, -2.366863, 1, 0, 0, 1, 1,
-1.165378, -0.2024906, -0.8831791, 1, 0, 0, 1, 1,
-1.163436, -1.034423, -2.478224, 1, 0, 0, 1, 1,
-1.163193, -1.825023, -1.445387, 0, 0, 0, 1, 1,
-1.149462, 1.719355, 0.5671186, 0, 0, 0, 1, 1,
-1.132381, 1.099898, -0.3858355, 0, 0, 0, 1, 1,
-1.132065, 0.3156637, -2.723781, 0, 0, 0, 1, 1,
-1.126878, 0.2165334, -1.216611, 0, 0, 0, 1, 1,
-1.124426, 0.6812062, -0.896166, 0, 0, 0, 1, 1,
-1.105881, -0.1194464, -2.173149, 0, 0, 0, 1, 1,
-1.10552, 0.6367077, -3.025827, 1, 1, 1, 1, 1,
-1.10367, 0.6429353, -1.129802, 1, 1, 1, 1, 1,
-1.10236, 0.2325051, -1.086331, 1, 1, 1, 1, 1,
-1.099183, -0.1194817, -3.160216, 1, 1, 1, 1, 1,
-1.092793, 1.276722, -0.608146, 1, 1, 1, 1, 1,
-1.092329, 0.7628071, 0.8359982, 1, 1, 1, 1, 1,
-1.09027, 0.452982, -1.494532, 1, 1, 1, 1, 1,
-1.086422, -1.733381, -2.276039, 1, 1, 1, 1, 1,
-1.085246, 0.9371109, 0.0682001, 1, 1, 1, 1, 1,
-1.079891, 0.5049275, -1.057069, 1, 1, 1, 1, 1,
-1.072443, -0.8187068, -2.499203, 1, 1, 1, 1, 1,
-1.068076, 0.06894624, -0.3888849, 1, 1, 1, 1, 1,
-1.067322, 1.128907, -0.1975319, 1, 1, 1, 1, 1,
-1.059656, 0.6572049, -1.554322, 1, 1, 1, 1, 1,
-1.049606, -1.026606, -3.507122, 1, 1, 1, 1, 1,
-1.043661, -0.1104533, -0.5228071, 0, 0, 1, 1, 1,
-1.038611, -0.08396947, -1.44415, 1, 0, 0, 1, 1,
-1.030814, 0.3315824, -1.001809, 1, 0, 0, 1, 1,
-1.029274, -0.6800228, -2.441713, 1, 0, 0, 1, 1,
-1.024404, 0.9732579, -1.854198, 1, 0, 0, 1, 1,
-1.024156, 0.808647, -0.7079203, 1, 0, 0, 1, 1,
-1.013983, -0.005400953, -0.7216391, 0, 0, 0, 1, 1,
-1.013523, -0.7390108, -2.299788, 0, 0, 0, 1, 1,
-1.013095, -0.09286844, -2.829117, 0, 0, 0, 1, 1,
-1.012973, 0.6905192, -2.54908, 0, 0, 0, 1, 1,
-1.012345, 1.552987, -1.246034, 0, 0, 0, 1, 1,
-1.010962, -0.04403038, -2.205382, 0, 0, 0, 1, 1,
-1.010549, 0.9900186, 0.7511231, 0, 0, 0, 1, 1,
-1.009228, -0.1581476, -0.8082091, 1, 1, 1, 1, 1,
-0.9932939, -0.5078307, -1.374017, 1, 1, 1, 1, 1,
-0.9910378, 0.9711422, -2.292653, 1, 1, 1, 1, 1,
-0.9865515, -0.3970253, -0.8369985, 1, 1, 1, 1, 1,
-0.9742762, 1.533868, 0.2499494, 1, 1, 1, 1, 1,
-0.9714753, -0.5039827, -0.1294312, 1, 1, 1, 1, 1,
-0.9705189, 0.5082392, -0.712225, 1, 1, 1, 1, 1,
-0.9655214, 0.4718125, -0.09412073, 1, 1, 1, 1, 1,
-0.959959, -0.1921989, -0.6361696, 1, 1, 1, 1, 1,
-0.95613, 0.5249912, -0.311146, 1, 1, 1, 1, 1,
-0.9534245, 1.934455, -1.001591, 1, 1, 1, 1, 1,
-0.9530685, -0.3908422, -0.538929, 1, 1, 1, 1, 1,
-0.9460635, 0.7151052, -0.2432244, 1, 1, 1, 1, 1,
-0.9444538, -0.5572528, -2.021837, 1, 1, 1, 1, 1,
-0.932451, -0.8355347, -2.739327, 1, 1, 1, 1, 1,
-0.9282934, -0.13426, -1.80218, 0, 0, 1, 1, 1,
-0.9249411, 0.147857, -3.033652, 1, 0, 0, 1, 1,
-0.9241762, -0.3910446, -1.404011, 1, 0, 0, 1, 1,
-0.923916, 0.9806126, -0.6993793, 1, 0, 0, 1, 1,
-0.9171622, -0.9530766, -1.790852, 1, 0, 0, 1, 1,
-0.9138741, 0.1339938, -0.769614, 1, 0, 0, 1, 1,
-0.9116055, -0.3009256, -1.632926, 0, 0, 0, 1, 1,
-0.9112486, -0.5855861, -2.340409, 0, 0, 0, 1, 1,
-0.9110551, 1.964962, -1.009868, 0, 0, 0, 1, 1,
-0.9109306, 0.8693134, 1.472676, 0, 0, 0, 1, 1,
-0.9044384, -0.4224525, -4.393112, 0, 0, 0, 1, 1,
-0.9035604, -0.396307, -1.939269, 0, 0, 0, 1, 1,
-0.8964277, -0.2702362, -3.823095, 0, 0, 0, 1, 1,
-0.8957672, 2.782816, 0.01262391, 1, 1, 1, 1, 1,
-0.891009, 0.9145217, -0.8406264, 1, 1, 1, 1, 1,
-0.8663357, -2.110159, -1.836554, 1, 1, 1, 1, 1,
-0.8652987, -0.9977689, -1.987234, 1, 1, 1, 1, 1,
-0.859894, -0.124416, -0.4695753, 1, 1, 1, 1, 1,
-0.8594286, 0.05593631, -1.714254, 1, 1, 1, 1, 1,
-0.849777, 0.06018899, -1.881158, 1, 1, 1, 1, 1,
-0.8490689, -0.5579144, -1.806012, 1, 1, 1, 1, 1,
-0.8461556, 1.060693, -1.7145, 1, 1, 1, 1, 1,
-0.8444756, 0.01473579, -0.3809835, 1, 1, 1, 1, 1,
-0.8331667, -1.18433, -2.977, 1, 1, 1, 1, 1,
-0.8329808, -1.654183, -0.8947081, 1, 1, 1, 1, 1,
-0.8310309, -1.169842, -2.222267, 1, 1, 1, 1, 1,
-0.8293558, -1.210518, -0.9634646, 1, 1, 1, 1, 1,
-0.8259729, -1.586675, -3.996176, 1, 1, 1, 1, 1,
-0.8219885, 1.278266, -1.270489, 0, 0, 1, 1, 1,
-0.8209518, 1.808952, 0.1171871, 1, 0, 0, 1, 1,
-0.8102369, 0.7468302, 0.7880594, 1, 0, 0, 1, 1,
-0.8101221, 0.198875, -0.6647912, 1, 0, 0, 1, 1,
-0.8069363, -1.731165, -2.926667, 1, 0, 0, 1, 1,
-0.8067062, -1.389636, -2.297403, 1, 0, 0, 1, 1,
-0.8038592, 0.2198067, -1.125367, 0, 0, 0, 1, 1,
-0.8037382, 0.1946817, -1.279625, 0, 0, 0, 1, 1,
-0.80119, -1.723782, -3.062003, 0, 0, 0, 1, 1,
-0.8002629, 0.5906581, 0.4454587, 0, 0, 0, 1, 1,
-0.7862467, 0.6296245, -0.9226554, 0, 0, 0, 1, 1,
-0.7818955, -0.3797779, -2.085356, 0, 0, 0, 1, 1,
-0.779135, -0.6101753, -1.492121, 0, 0, 0, 1, 1,
-0.7786899, -1.865542, -2.737596, 1, 1, 1, 1, 1,
-0.77866, -0.1247239, -2.977732, 1, 1, 1, 1, 1,
-0.7773631, -0.9547457, -3.040685, 1, 1, 1, 1, 1,
-0.7746275, -0.869007, -3.152989, 1, 1, 1, 1, 1,
-0.772885, 1.750624, -0.7028315, 1, 1, 1, 1, 1,
-0.7690073, 0.268725, -0.7360284, 1, 1, 1, 1, 1,
-0.7675988, 0.2779121, -1.200888, 1, 1, 1, 1, 1,
-0.7652442, -1.111867, -1.896852, 1, 1, 1, 1, 1,
-0.7637247, 0.4109748, -2.95395, 1, 1, 1, 1, 1,
-0.7593089, -0.6739498, -0.5577441, 1, 1, 1, 1, 1,
-0.755839, -0.5635535, -3.363912, 1, 1, 1, 1, 1,
-0.7539489, -1.121457, -1.090827, 1, 1, 1, 1, 1,
-0.7538422, -0.778487, -2.210547, 1, 1, 1, 1, 1,
-0.7526621, -0.9954229, -2.857745, 1, 1, 1, 1, 1,
-0.752016, 2.100873, -0.5003552, 1, 1, 1, 1, 1,
-0.7501463, 0.0693065, -2.142823, 0, 0, 1, 1, 1,
-0.7403513, -0.5563051, -2.826918, 1, 0, 0, 1, 1,
-0.7399594, 0.2738089, -3.039823, 1, 0, 0, 1, 1,
-0.7312394, 0.5305437, -0.8433292, 1, 0, 0, 1, 1,
-0.7292384, -0.6669051, -3.128264, 1, 0, 0, 1, 1,
-0.7251728, 0.1125321, -2.971772, 1, 0, 0, 1, 1,
-0.7213537, -1.402845, -1.560646, 0, 0, 0, 1, 1,
-0.7180063, -0.09568817, -1.809791, 0, 0, 0, 1, 1,
-0.7147293, 0.6990765, 0.7663462, 0, 0, 0, 1, 1,
-0.7141177, -0.230325, -1.95102, 0, 0, 0, 1, 1,
-0.7096621, 0.4650135, -1.328017, 0, 0, 0, 1, 1,
-0.7011016, -0.7876803, -1.827655, 0, 0, 0, 1, 1,
-0.7001048, -1.068393, -3.357497, 0, 0, 0, 1, 1,
-0.6981132, -0.3168629, -3.371211, 1, 1, 1, 1, 1,
-0.6974555, 1.520522, -0.1663514, 1, 1, 1, 1, 1,
-0.6954802, -0.3488598, -1.985224, 1, 1, 1, 1, 1,
-0.6925186, 0.08629981, -3.512243, 1, 1, 1, 1, 1,
-0.6896858, 0.5962912, -0.6020214, 1, 1, 1, 1, 1,
-0.6885698, 0.9875316, -1.215593, 1, 1, 1, 1, 1,
-0.6830724, 1.07872, -0.1438958, 1, 1, 1, 1, 1,
-0.6810718, 1.241403, 0.3877338, 1, 1, 1, 1, 1,
-0.6762694, -1.202042, -4.830724, 1, 1, 1, 1, 1,
-0.6745797, -0.2382911, -2.926133, 1, 1, 1, 1, 1,
-0.6675659, -1.304584, -2.430363, 1, 1, 1, 1, 1,
-0.664296, 0.5236089, -0.5814688, 1, 1, 1, 1, 1,
-0.6641321, -0.9031919, -2.335789, 1, 1, 1, 1, 1,
-0.6621374, 0.8908692, -2.015864, 1, 1, 1, 1, 1,
-0.6611642, -2.253154, -3.69267, 1, 1, 1, 1, 1,
-0.6608013, -0.4166069, -0.4573953, 0, 0, 1, 1, 1,
-0.6598982, -0.4166876, -1.504416, 1, 0, 0, 1, 1,
-0.6584908, -1.74758, -3.233464, 1, 0, 0, 1, 1,
-0.6571669, 1.118205, 0.5623584, 1, 0, 0, 1, 1,
-0.653753, 0.4570703, -0.6016902, 1, 0, 0, 1, 1,
-0.649591, -0.5923145, -3.169821, 1, 0, 0, 1, 1,
-0.6435934, 0.7700097, -0.8055764, 0, 0, 0, 1, 1,
-0.6416723, -1.599055, -2.757848, 0, 0, 0, 1, 1,
-0.640936, 1.618138, -1.038021, 0, 0, 0, 1, 1,
-0.6384307, -0.2284199, -2.200621, 0, 0, 0, 1, 1,
-0.6357809, 0.8171483, -1.313641, 0, 0, 0, 1, 1,
-0.6323408, 0.06893853, -2.164806, 0, 0, 0, 1, 1,
-0.6314237, -1.464744, -2.674647, 0, 0, 0, 1, 1,
-0.6311047, -0.270488, -2.685564, 1, 1, 1, 1, 1,
-0.6278424, -0.04975558, -2.304741, 1, 1, 1, 1, 1,
-0.6275551, -0.001328693, -1.987317, 1, 1, 1, 1, 1,
-0.6057206, 1.836639, -0.3432772, 1, 1, 1, 1, 1,
-0.600639, -1.21879, -4.605701, 1, 1, 1, 1, 1,
-0.6006058, -0.2060655, -2.998678, 1, 1, 1, 1, 1,
-0.5994221, 0.8605173, 1.128366, 1, 1, 1, 1, 1,
-0.5990176, -0.5450326, -1.208843, 1, 1, 1, 1, 1,
-0.5984755, 0.2173246, -0.9547137, 1, 1, 1, 1, 1,
-0.5980984, -0.8341891, -1.738509, 1, 1, 1, 1, 1,
-0.596291, -1.669136, -3.525392, 1, 1, 1, 1, 1,
-0.593006, 0.5859631, -0.5710842, 1, 1, 1, 1, 1,
-0.5895224, 1.247362, -2.684499, 1, 1, 1, 1, 1,
-0.58632, 0.1821621, -1.724859, 1, 1, 1, 1, 1,
-0.5840432, 0.07424238, -0.6930797, 1, 1, 1, 1, 1,
-0.5810775, -2.319816, -2.062074, 0, 0, 1, 1, 1,
-0.5796821, 0.004809524, -1.880485, 1, 0, 0, 1, 1,
-0.5796731, -0.7053249, -2.810349, 1, 0, 0, 1, 1,
-0.5763834, 0.4572991, -0.2421487, 1, 0, 0, 1, 1,
-0.5733129, 0.2049709, -0.8975672, 1, 0, 0, 1, 1,
-0.5709624, 0.5210708, -0.1719852, 1, 0, 0, 1, 1,
-0.5706227, -0.4398656, -2.613195, 0, 0, 0, 1, 1,
-0.5619524, 0.5750595, -1.608817, 0, 0, 0, 1, 1,
-0.5572675, -1.683872, -2.174058, 0, 0, 0, 1, 1,
-0.556105, 0.8210403, 0.261594, 0, 0, 0, 1, 1,
-0.5558845, -1.55246, -1.638187, 0, 0, 0, 1, 1,
-0.5537593, -0.2536407, -4.63587, 0, 0, 0, 1, 1,
-0.5501119, 0.8002327, -1.182456, 0, 0, 0, 1, 1,
-0.5467342, -0.3176831, -2.442883, 1, 1, 1, 1, 1,
-0.5455887, -0.04593578, -1.282541, 1, 1, 1, 1, 1,
-0.5412204, -0.7376355, -2.18207, 1, 1, 1, 1, 1,
-0.5412021, -0.3983401, -2.324917, 1, 1, 1, 1, 1,
-0.5398598, -0.8682797, -3.3372, 1, 1, 1, 1, 1,
-0.535257, -1.709904, -2.867052, 1, 1, 1, 1, 1,
-0.5309299, -1.175395, -0.8068624, 1, 1, 1, 1, 1,
-0.5261759, 0.9829435, 0.6417569, 1, 1, 1, 1, 1,
-0.52306, 1.356681, -1.099376, 1, 1, 1, 1, 1,
-0.5209538, -0.9065046, -2.457943, 1, 1, 1, 1, 1,
-0.5142581, 0.08366052, -1.196066, 1, 1, 1, 1, 1,
-0.5141712, -2.716027, -3.091984, 1, 1, 1, 1, 1,
-0.5134448, -2.070829, -4.638431, 1, 1, 1, 1, 1,
-0.5132334, -0.1622731, -3.128506, 1, 1, 1, 1, 1,
-0.5128931, -1.346162, -0.6565773, 1, 1, 1, 1, 1,
-0.5085229, 0.4879112, -0.461913, 0, 0, 1, 1, 1,
-0.5053139, -0.9249794, -1.447477, 1, 0, 0, 1, 1,
-0.504119, 1.029025, 1.587056, 1, 0, 0, 1, 1,
-0.5036337, -1.705986, -3.781893, 1, 0, 0, 1, 1,
-0.5007051, -1.08112, -1.523405, 1, 0, 0, 1, 1,
-0.4990071, 0.6713149, -0.7220359, 1, 0, 0, 1, 1,
-0.4966649, -0.4969979, -1.971978, 0, 0, 0, 1, 1,
-0.4938735, 0.3615981, 0.2540563, 0, 0, 0, 1, 1,
-0.492939, -1.605193, -3.630941, 0, 0, 0, 1, 1,
-0.4914459, 0.2370108, -1.966666, 0, 0, 0, 1, 1,
-0.4911641, 1.365331, 1.134571, 0, 0, 0, 1, 1,
-0.4903684, -1.084397, -4.002465, 0, 0, 0, 1, 1,
-0.4903012, 0.2169203, -1.774311, 0, 0, 0, 1, 1,
-0.4889323, 1.459142, 0.1086186, 1, 1, 1, 1, 1,
-0.4850087, 0.06022238, -2.730611, 1, 1, 1, 1, 1,
-0.4835196, 1.003171, 0.5411522, 1, 1, 1, 1, 1,
-0.4799736, 0.03634696, -2.062283, 1, 1, 1, 1, 1,
-0.4708772, 0.8949442, -0.4867772, 1, 1, 1, 1, 1,
-0.4652666, 0.9765685, -0.6459261, 1, 1, 1, 1, 1,
-0.4635478, -0.1653338, -1.967436, 1, 1, 1, 1, 1,
-0.4592561, -0.7146756, 0.518106, 1, 1, 1, 1, 1,
-0.4590066, 0.4037758, -0.1479476, 1, 1, 1, 1, 1,
-0.4588553, 0.9049599, -0.2996919, 1, 1, 1, 1, 1,
-0.4565919, 0.8848841, -1.219491, 1, 1, 1, 1, 1,
-0.4551859, -1.088451, -2.945424, 1, 1, 1, 1, 1,
-0.4543698, -0.3197381, -2.567082, 1, 1, 1, 1, 1,
-0.4492521, -1.071636, -3.238838, 1, 1, 1, 1, 1,
-0.4429549, -1.01313, -1.114456, 1, 1, 1, 1, 1,
-0.4353623, 0.9576774, -1.905421, 0, 0, 1, 1, 1,
-0.4342886, -0.5083471, -1.044594, 1, 0, 0, 1, 1,
-0.4305965, -1.004832, -2.657147, 1, 0, 0, 1, 1,
-0.4298984, -1.349866, -2.602769, 1, 0, 0, 1, 1,
-0.4228716, -0.4797741, -1.341745, 1, 0, 0, 1, 1,
-0.4228714, -0.8564544, -2.962617, 1, 0, 0, 1, 1,
-0.4214703, -0.2467334, -3.165117, 0, 0, 0, 1, 1,
-0.4127824, -0.2753238, -1.456711, 0, 0, 0, 1, 1,
-0.4124936, -0.3675423, -0.5437167, 0, 0, 0, 1, 1,
-0.4098149, 0.1747141, 0.03600283, 0, 0, 0, 1, 1,
-0.4054093, 1.444251, -1.244521, 0, 0, 0, 1, 1,
-0.4044133, -0.6423205, -2.107163, 0, 0, 0, 1, 1,
-0.4034607, -1.434233, -2.942834, 0, 0, 0, 1, 1,
-0.4017014, -0.234834, -2.320894, 1, 1, 1, 1, 1,
-0.3941044, -0.08889874, -1.341751, 1, 1, 1, 1, 1,
-0.3928553, 1.408716, -0.5494095, 1, 1, 1, 1, 1,
-0.3901773, -1.614117, -3.084804, 1, 1, 1, 1, 1,
-0.3899102, -0.195046, 0.5221575, 1, 1, 1, 1, 1,
-0.3881986, -0.5116642, -3.724368, 1, 1, 1, 1, 1,
-0.3825381, -0.9055367, -2.271925, 1, 1, 1, 1, 1,
-0.3824736, 0.3116456, -0.2934229, 1, 1, 1, 1, 1,
-0.3817126, -0.3063962, -2.682094, 1, 1, 1, 1, 1,
-0.3807755, -0.1918744, -3.44152, 1, 1, 1, 1, 1,
-0.3805836, 0.7137538, -0.2928084, 1, 1, 1, 1, 1,
-0.3803965, 0.5757716, -2.073853, 1, 1, 1, 1, 1,
-0.3798962, 1.100893, -0.4933347, 1, 1, 1, 1, 1,
-0.3781841, 0.5113909, -1.501078, 1, 1, 1, 1, 1,
-0.3776371, 0.8311238, -0.3629343, 1, 1, 1, 1, 1,
-0.3769234, 0.6704192, -0.1961365, 0, 0, 1, 1, 1,
-0.3738717, 1.438487, -0.1754263, 1, 0, 0, 1, 1,
-0.3719209, -1.012084, -2.719861, 1, 0, 0, 1, 1,
-0.3693673, 0.1545567, -1.55288, 1, 0, 0, 1, 1,
-0.3638928, 0.26662, -1.353934, 1, 0, 0, 1, 1,
-0.361021, 0.01172126, -1.87379, 1, 0, 0, 1, 1,
-0.3600179, 0.1578518, -2.068907, 0, 0, 0, 1, 1,
-0.357266, 0.6473736, -0.205139, 0, 0, 0, 1, 1,
-0.3541484, 0.4306346, -3.369415, 0, 0, 0, 1, 1,
-0.3503439, -1.000725, -2.258503, 0, 0, 0, 1, 1,
-0.3444959, 0.7059357, -1.803207, 0, 0, 0, 1, 1,
-0.3401995, -0.4036595, -3.173799, 0, 0, 0, 1, 1,
-0.3365363, 0.08469073, -1.181328, 0, 0, 0, 1, 1,
-0.3321514, 2.040449, 0.2031734, 1, 1, 1, 1, 1,
-0.3320248, 1.589408, -0.8757601, 1, 1, 1, 1, 1,
-0.3311261, -2.310769, -1.435466, 1, 1, 1, 1, 1,
-0.3281855, -0.641959, -2.407272, 1, 1, 1, 1, 1,
-0.3281307, 0.3206034, -1.257635, 1, 1, 1, 1, 1,
-0.3261231, 0.00206577, -1.779847, 1, 1, 1, 1, 1,
-0.3230929, -0.968456, -2.202169, 1, 1, 1, 1, 1,
-0.3175504, 0.6650757, 0.2331199, 1, 1, 1, 1, 1,
-0.3171764, 1.0205, -0.3526871, 1, 1, 1, 1, 1,
-0.3140966, 0.2972807, 0.559065, 1, 1, 1, 1, 1,
-0.3137675, -0.5584762, -4.209951, 1, 1, 1, 1, 1,
-0.3098106, 0.3553171, -2.113142, 1, 1, 1, 1, 1,
-0.3061822, 0.1260855, -0.1821961, 1, 1, 1, 1, 1,
-0.3014752, 1.103864, -1.498572, 1, 1, 1, 1, 1,
-0.3005955, 1.371975, 0.6024143, 1, 1, 1, 1, 1,
-0.3002155, 0.6255659, -0.4108749, 0, 0, 1, 1, 1,
-0.2986534, -0.3084527, -0.8825064, 1, 0, 0, 1, 1,
-0.2986364, -0.8413321, -0.02146965, 1, 0, 0, 1, 1,
-0.2962687, -2.180499, -4.685339, 1, 0, 0, 1, 1,
-0.2960226, 1.132553, -1.22283, 1, 0, 0, 1, 1,
-0.293766, -1.011114, -2.905119, 1, 0, 0, 1, 1,
-0.2886745, 1.666324, 1.816238, 0, 0, 0, 1, 1,
-0.2837106, 0.03187286, -2.094935, 0, 0, 0, 1, 1,
-0.2816839, -0.3272274, -3.1496, 0, 0, 0, 1, 1,
-0.2806821, 0.314952, -0.6457804, 0, 0, 0, 1, 1,
-0.2795558, 0.3164782, -1.57653, 0, 0, 0, 1, 1,
-0.2781571, 0.573402, -0.2188948, 0, 0, 0, 1, 1,
-0.2776278, 0.6990415, 1.152296, 0, 0, 0, 1, 1,
-0.2770605, -0.9673939, -3.581236, 1, 1, 1, 1, 1,
-0.2758095, 1.039375, 0.5011217, 1, 1, 1, 1, 1,
-0.2748307, 2.122487, 0.9981627, 1, 1, 1, 1, 1,
-0.2745424, -0.2616893, -1.695546, 1, 1, 1, 1, 1,
-0.2672871, -1.421563, -2.133064, 1, 1, 1, 1, 1,
-0.2657427, -0.8221392, -2.743115, 1, 1, 1, 1, 1,
-0.2634054, 0.2851622, 1.342501, 1, 1, 1, 1, 1,
-0.2618025, -0.4760422, -1.718791, 1, 1, 1, 1, 1,
-0.2611762, -0.9445615, -3.597317, 1, 1, 1, 1, 1,
-0.2608061, 0.9452119, -1.040904, 1, 1, 1, 1, 1,
-0.2606902, 0.4195703, -2.773808, 1, 1, 1, 1, 1,
-0.25915, 0.7892641, 0.1062981, 1, 1, 1, 1, 1,
-0.2581946, -1.328468, -3.874853, 1, 1, 1, 1, 1,
-0.2572415, 0.7186378, 0.721049, 1, 1, 1, 1, 1,
-0.2544769, -1.552086, -0.7642542, 1, 1, 1, 1, 1,
-0.2499432, -0.5963902, -2.196004, 0, 0, 1, 1, 1,
-0.246626, -1.100455, -1.318374, 1, 0, 0, 1, 1,
-0.2438853, -1.321681, -2.803904, 1, 0, 0, 1, 1,
-0.2425093, -1.321782, -2.194841, 1, 0, 0, 1, 1,
-0.2419647, -0.05786682, -3.111489, 1, 0, 0, 1, 1,
-0.24184, 0.6966656, -0.8556326, 1, 0, 0, 1, 1,
-0.239133, 0.8618742, -1.035838, 0, 0, 0, 1, 1,
-0.2332619, 0.04886813, -1.585661, 0, 0, 0, 1, 1,
-0.233017, 0.7171828, 1.720079, 0, 0, 0, 1, 1,
-0.2319734, -1.144984, -3.76368, 0, 0, 0, 1, 1,
-0.231324, -1.694186, -2.473582, 0, 0, 0, 1, 1,
-0.2259621, -1.416187, -4.141069, 0, 0, 0, 1, 1,
-0.2254925, -0.782577, -2.369068, 0, 0, 0, 1, 1,
-0.2244997, 1.51517, -0.4542179, 1, 1, 1, 1, 1,
-0.2237455, -1.498434, -3.728743, 1, 1, 1, 1, 1,
-0.2179742, -0.1846113, -2.239377, 1, 1, 1, 1, 1,
-0.2161964, 1.880283, 0.6142945, 1, 1, 1, 1, 1,
-0.2152591, 0.1128803, -1.583019, 1, 1, 1, 1, 1,
-0.2150585, 0.1457521, -2.613353, 1, 1, 1, 1, 1,
-0.2140028, 1.840808, -0.3988285, 1, 1, 1, 1, 1,
-0.2123379, 0.840755, -0.7438037, 1, 1, 1, 1, 1,
-0.2113738, 0.4229428, 0.7247022, 1, 1, 1, 1, 1,
-0.2112101, -0.1688538, -0.7451882, 1, 1, 1, 1, 1,
-0.2097402, -1.04343, -3.230093, 1, 1, 1, 1, 1,
-0.2096322, 1.01484, 0.005449965, 1, 1, 1, 1, 1,
-0.2036512, -2.207508, -2.95463, 1, 1, 1, 1, 1,
-0.2033033, 1.136063, 0.2415119, 1, 1, 1, 1, 1,
-0.2032961, 0.332524, -0.1469437, 1, 1, 1, 1, 1,
-0.2016614, 0.9387718, -0.7928167, 0, 0, 1, 1, 1,
-0.1966117, -0.2390218, -3.300304, 1, 0, 0, 1, 1,
-0.1956408, -1.152036, -2.81795, 1, 0, 0, 1, 1,
-0.1951537, -0.6964706, -3.854671, 1, 0, 0, 1, 1,
-0.1935025, 1.193339, 0.5017342, 1, 0, 0, 1, 1,
-0.190766, -0.4069176, -4.170212, 1, 0, 0, 1, 1,
-0.1899138, 0.0665215, -1.162274, 0, 0, 0, 1, 1,
-0.1892741, -0.7777026, -4.250747, 0, 0, 0, 1, 1,
-0.1889258, -0.4947236, -2.441438, 0, 0, 0, 1, 1,
-0.1829324, 0.5034242, -0.8092957, 0, 0, 0, 1, 1,
-0.1800984, -0.5556713, -2.081092, 0, 0, 0, 1, 1,
-0.1734189, -0.8854414, -3.448734, 0, 0, 0, 1, 1,
-0.1680557, -1.231408, -3.83365, 0, 0, 0, 1, 1,
-0.1597698, -0.05213837, -2.054468, 1, 1, 1, 1, 1,
-0.154362, -0.9078178, -4.059251, 1, 1, 1, 1, 1,
-0.1520951, -0.8463344, -3.95126, 1, 1, 1, 1, 1,
-0.1452297, 1.310389, -1.058279, 1, 1, 1, 1, 1,
-0.1438195, -2.201676, -2.861453, 1, 1, 1, 1, 1,
-0.1394902, -0.5052096, -4.376898, 1, 1, 1, 1, 1,
-0.1388717, -0.8222674, -4.597213, 1, 1, 1, 1, 1,
-0.1383586, -2.909642, -3.090109, 1, 1, 1, 1, 1,
-0.1309913, 0.3321375, -0.4345452, 1, 1, 1, 1, 1,
-0.1256833, 0.06428112, -2.425307, 1, 1, 1, 1, 1,
-0.1246704, 0.7944685, -1.272738, 1, 1, 1, 1, 1,
-0.1242152, -0.9024037, -2.466329, 1, 1, 1, 1, 1,
-0.1217916, 1.582334, 0.7811545, 1, 1, 1, 1, 1,
-0.1173338, 0.3059089, -0.5841735, 1, 1, 1, 1, 1,
-0.1142922, 0.9239284, 0.9663415, 1, 1, 1, 1, 1,
-0.1119774, 0.7149404, -1.698334, 0, 0, 1, 1, 1,
-0.1118177, 0.6975118, -1.243305, 1, 0, 0, 1, 1,
-0.1084094, 1.223358, 1.342082, 1, 0, 0, 1, 1,
-0.09928018, 0.616105, 0.1979428, 1, 0, 0, 1, 1,
-0.09924564, 1.415539, 0.8655698, 1, 0, 0, 1, 1,
-0.0987934, -0.9927822, -3.62943, 1, 0, 0, 1, 1,
-0.09741596, 0.357013, 0.8539072, 0, 0, 0, 1, 1,
-0.09601034, -1.141004, -4.181621, 0, 0, 0, 1, 1,
-0.09248208, -0.7574135, -3.945703, 0, 0, 0, 1, 1,
-0.086638, -0.4614549, -3.428687, 0, 0, 0, 1, 1,
-0.08631942, 1.578015, -1.409452, 0, 0, 0, 1, 1,
-0.08303648, 0.296166, -2.451126, 0, 0, 0, 1, 1,
-0.07492062, -1.402058, -3.366298, 0, 0, 0, 1, 1,
-0.07259064, 0.6031844, -0.2648027, 1, 1, 1, 1, 1,
-0.07063673, 0.7658626, 0.0398174, 1, 1, 1, 1, 1,
-0.06275948, -0.4665284, -2.147823, 1, 1, 1, 1, 1,
-0.05477376, 0.1840555, -1.675772, 1, 1, 1, 1, 1,
-0.05286948, 0.1628741, 0.7920317, 1, 1, 1, 1, 1,
-0.05286939, -0.6473428, -4.034846, 1, 1, 1, 1, 1,
-0.05089239, 1.36254, 0.438199, 1, 1, 1, 1, 1,
-0.05045355, 0.1733446, -1.129709, 1, 1, 1, 1, 1,
-0.04999872, 1.595967, 0.09773698, 1, 1, 1, 1, 1,
-0.04925616, -0.4746686, -2.494972, 1, 1, 1, 1, 1,
-0.04388891, -1.999964, -4.156116, 1, 1, 1, 1, 1,
-0.04254902, 1.16289, -0.6413488, 1, 1, 1, 1, 1,
-0.03809025, 0.2805923, -0.8815238, 1, 1, 1, 1, 1,
-0.03777243, 0.3129081, -1.228646, 1, 1, 1, 1, 1,
-0.03697381, -2.045428, -2.893681, 1, 1, 1, 1, 1,
-0.03674568, 1.326981, 1.617758, 0, 0, 1, 1, 1,
-0.03367149, 0.2123861, -0.1803018, 1, 0, 0, 1, 1,
-0.033306, 0.6013001, -0.7501122, 1, 0, 0, 1, 1,
-0.03317509, 0.8980437, 0.8275289, 1, 0, 0, 1, 1,
-0.03132284, 0.00296807, -2.486594, 1, 0, 0, 1, 1,
-0.03092094, 0.8858826, 0.09193414, 1, 0, 0, 1, 1,
-0.02830194, 1.362357, 0.5642769, 0, 0, 0, 1, 1,
-0.02432211, 0.756618, -1.5527, 0, 0, 0, 1, 1,
-0.02115826, -1.339968, -3.4637, 0, 0, 0, 1, 1,
-0.02053509, 1.859519, -1.137786, 0, 0, 0, 1, 1,
-0.01945664, 0.9844289, -0.1037392, 0, 0, 0, 1, 1,
-0.01812671, -0.6493081, -3.425561, 0, 0, 0, 1, 1,
-0.01257889, 0.1495934, -0.439343, 0, 0, 0, 1, 1,
-0.009429448, -1.772782, -2.049619, 1, 1, 1, 1, 1,
-0.006951462, 0.6067662, 1.984705, 1, 1, 1, 1, 1,
-0.002984416, 0.3802409, -0.5171821, 1, 1, 1, 1, 1,
-0.002752161, -1.434755, -1.10825, 1, 1, 1, 1, 1,
-0.000279128, 0.08577441, 0.933683, 1, 1, 1, 1, 1,
0.002879632, 1.322129, -0.08707868, 1, 1, 1, 1, 1,
0.003737354, 0.2441457, 2.771135, 1, 1, 1, 1, 1,
0.004878839, -1.232769, 3.853595, 1, 1, 1, 1, 1,
0.006664001, -1.002956, 3.687752, 1, 1, 1, 1, 1,
0.007840821, -0.7229198, 4.584461, 1, 1, 1, 1, 1,
0.01102396, -0.4015544, 3.409149, 1, 1, 1, 1, 1,
0.01109747, -0.388379, 2.685246, 1, 1, 1, 1, 1,
0.01246953, 2.273709, -0.5612141, 1, 1, 1, 1, 1,
0.0362459, -1.021208, 2.326416, 1, 1, 1, 1, 1,
0.03721595, 0.9569371, -1.721051, 1, 1, 1, 1, 1,
0.04096318, 0.8128737, 0.1040517, 0, 0, 1, 1, 1,
0.04163142, -0.01662366, 0.504782, 1, 0, 0, 1, 1,
0.04177424, -0.6543964, 1.600606, 1, 0, 0, 1, 1,
0.04215771, -0.7735973, 2.257098, 1, 0, 0, 1, 1,
0.042381, 0.1278201, 0.4640723, 1, 0, 0, 1, 1,
0.04448881, 0.338593, 1.075825, 1, 0, 0, 1, 1,
0.05475562, -1.816395, 2.525495, 0, 0, 0, 1, 1,
0.05649342, 1.065772, 0.8386023, 0, 0, 0, 1, 1,
0.05668498, -0.797381, 2.228413, 0, 0, 0, 1, 1,
0.06122498, -1.169769, 2.470773, 0, 0, 0, 1, 1,
0.06281618, -0.6255729, 2.577261, 0, 0, 0, 1, 1,
0.06308452, -0.3512063, 3.905079, 0, 0, 0, 1, 1,
0.06476203, 0.649313, 0.4200107, 0, 0, 0, 1, 1,
0.07202832, -1.77255, 3.188167, 1, 1, 1, 1, 1,
0.07491471, 0.5076219, -0.2866656, 1, 1, 1, 1, 1,
0.07740494, 0.4176451, 0.0774585, 1, 1, 1, 1, 1,
0.07815332, 0.9623202, 0.03853365, 1, 1, 1, 1, 1,
0.08003881, 0.3240569, -0.9922732, 1, 1, 1, 1, 1,
0.08243725, 1.447423, 0.2225926, 1, 1, 1, 1, 1,
0.08281752, 1.550498, -0.9600898, 1, 1, 1, 1, 1,
0.09245075, -1.117341, 3.249032, 1, 1, 1, 1, 1,
0.09543455, 1.168701, -0.3502099, 1, 1, 1, 1, 1,
0.09705465, 0.7586131, 0.2554497, 1, 1, 1, 1, 1,
0.09735634, -0.04841459, 2.124102, 1, 1, 1, 1, 1,
0.09971029, 1.241372, -0.283122, 1, 1, 1, 1, 1,
0.1042446, 0.5645206, -0.8169921, 1, 1, 1, 1, 1,
0.1174426, -0.01856623, 1.418745, 1, 1, 1, 1, 1,
0.1188758, 0.5401208, 1.35186, 1, 1, 1, 1, 1,
0.1201989, -0.01118825, 0.2291835, 0, 0, 1, 1, 1,
0.120618, -0.4358812, 3.725188, 1, 0, 0, 1, 1,
0.1218095, 0.888721, 0.9445012, 1, 0, 0, 1, 1,
0.1235214, 0.3427418, 0.8460771, 1, 0, 0, 1, 1,
0.124325, 1.080728, -1.427776, 1, 0, 0, 1, 1,
0.1261032, -0.06582491, 3.478575, 1, 0, 0, 1, 1,
0.1270528, -0.614482, 2.894801, 0, 0, 0, 1, 1,
0.1302663, 0.4625328, -0.06535806, 0, 0, 0, 1, 1,
0.1314862, -0.200351, 2.103832, 0, 0, 0, 1, 1,
0.1331842, -1.473795, 3.466869, 0, 0, 0, 1, 1,
0.134629, 0.3953764, 0.001008942, 0, 0, 0, 1, 1,
0.1354511, 1.293533, -0.273253, 0, 0, 0, 1, 1,
0.1355565, -1.328834, 5.815718, 0, 0, 0, 1, 1,
0.1362541, -0.5175841, 4.245569, 1, 1, 1, 1, 1,
0.1370263, 0.5702047, 1.999955, 1, 1, 1, 1, 1,
0.1371228, 0.2402153, -0.5751409, 1, 1, 1, 1, 1,
0.1382667, 0.380583, -1.183735, 1, 1, 1, 1, 1,
0.1434124, -0.06122003, 3.089998, 1, 1, 1, 1, 1,
0.1442485, 1.230017, 1.377711, 1, 1, 1, 1, 1,
0.149476, -0.7406893, 3.008404, 1, 1, 1, 1, 1,
0.1544573, 0.2537234, 0.9482944, 1, 1, 1, 1, 1,
0.1560625, -1.587367, 4.229975, 1, 1, 1, 1, 1,
0.1578564, -0.3208489, 2.441197, 1, 1, 1, 1, 1,
0.1599063, -0.501398, 4.721727, 1, 1, 1, 1, 1,
0.1602727, -1.105111, 3.70902, 1, 1, 1, 1, 1,
0.1618644, -0.1838312, 1.494683, 1, 1, 1, 1, 1,
0.1629044, 0.5391442, -0.3581949, 1, 1, 1, 1, 1,
0.1630124, -0.6909491, 2.694929, 1, 1, 1, 1, 1,
0.1644933, -1.107544, 4.410648, 0, 0, 1, 1, 1,
0.1686702, -0.5406195, 2.846972, 1, 0, 0, 1, 1,
0.1718378, -0.6745929, 1.753732, 1, 0, 0, 1, 1,
0.1785296, -1.687988, 2.753886, 1, 0, 0, 1, 1,
0.17939, -1.173434, 1.494572, 1, 0, 0, 1, 1,
0.1803999, -0.6562015, 3.059095, 1, 0, 0, 1, 1,
0.1858857, -0.1456463, 1.396133, 0, 0, 0, 1, 1,
0.1885947, 0.06897421, 1.181642, 0, 0, 0, 1, 1,
0.1891098, 0.6984884, 0.5652668, 0, 0, 0, 1, 1,
0.1924878, 1.426457, 0.1810599, 0, 0, 0, 1, 1,
0.1941475, -2.136728, 1.307212, 0, 0, 0, 1, 1,
0.1980057, -0.4084627, 1.385809, 0, 0, 0, 1, 1,
0.2001212, -1.095059, 0.6876419, 0, 0, 0, 1, 1,
0.2012139, -2.285976, 1.927839, 1, 1, 1, 1, 1,
0.2021131, 0.394634, -0.5516802, 1, 1, 1, 1, 1,
0.20279, 2.389196, -1.343078, 1, 1, 1, 1, 1,
0.2038752, 0.9679587, 0.8624976, 1, 1, 1, 1, 1,
0.2056099, -1.513556, 2.371388, 1, 1, 1, 1, 1,
0.2090336, -0.6484839, 1.744256, 1, 1, 1, 1, 1,
0.2226529, -0.8914823, 4.154562, 1, 1, 1, 1, 1,
0.2288371, 1.158051, -0.08445624, 1, 1, 1, 1, 1,
0.2325158, -0.5879298, 3.526658, 1, 1, 1, 1, 1,
0.2372655, 0.8267702, 0.02208067, 1, 1, 1, 1, 1,
0.2437109, 1.771832, -0.2939154, 1, 1, 1, 1, 1,
0.2510097, 1.198301, 2.305969, 1, 1, 1, 1, 1,
0.2561145, -1.850509, 2.714825, 1, 1, 1, 1, 1,
0.2579305, -0.128012, 3.308886, 1, 1, 1, 1, 1,
0.2636508, -0.2906168, 1.829648, 1, 1, 1, 1, 1,
0.2657928, -0.2573136, 2.759902, 0, 0, 1, 1, 1,
0.2674896, -0.1938241, 1.665602, 1, 0, 0, 1, 1,
0.2689758, -0.2933145, 4.590485, 1, 0, 0, 1, 1,
0.2699191, -0.4166302, 3.856007, 1, 0, 0, 1, 1,
0.2705979, -1.412499, 2.795591, 1, 0, 0, 1, 1,
0.2789335, 2.807443, -0.554814, 1, 0, 0, 1, 1,
0.2815304, 0.1216525, 0.5911033, 0, 0, 0, 1, 1,
0.2831891, -0.1595317, 1.876493, 0, 0, 0, 1, 1,
0.2838482, 0.8908144, 1.027991, 0, 0, 0, 1, 1,
0.2855205, 1.225253, -1.412181, 0, 0, 0, 1, 1,
0.2880869, -1.14088, 4.642792, 0, 0, 0, 1, 1,
0.2895776, -0.4420069, -0.06449878, 0, 0, 0, 1, 1,
0.2950491, 0.4391363, 2.247903, 0, 0, 0, 1, 1,
0.295663, 1.399681, 0.3292664, 1, 1, 1, 1, 1,
0.2980338, 1.627759, 1.536551, 1, 1, 1, 1, 1,
0.2983827, 0.8642, -0.6967439, 1, 1, 1, 1, 1,
0.304474, -0.01652079, 0.06426818, 1, 1, 1, 1, 1,
0.3142828, -0.7554178, 3.054905, 1, 1, 1, 1, 1,
0.3167571, -1.076716, 1.429811, 1, 1, 1, 1, 1,
0.3199883, 0.3123, -0.6034854, 1, 1, 1, 1, 1,
0.3224941, 1.514883, 1.287244, 1, 1, 1, 1, 1,
0.3253487, -2.096184, 4.397546, 1, 1, 1, 1, 1,
0.3260454, -1.295863, 3.670538, 1, 1, 1, 1, 1,
0.3297604, -2.835792, 3.233225, 1, 1, 1, 1, 1,
0.3362919, 0.2522581, -1.311637, 1, 1, 1, 1, 1,
0.3363216, -0.776582, 3.727631, 1, 1, 1, 1, 1,
0.3373777, 1.613914, 0.1540967, 1, 1, 1, 1, 1,
0.3377258, 0.4046127, 0.9963652, 1, 1, 1, 1, 1,
0.3421156, -0.8472922, 3.580147, 0, 0, 1, 1, 1,
0.3439153, -1.133013, 3.205445, 1, 0, 0, 1, 1,
0.346004, -0.682528, 3.188964, 1, 0, 0, 1, 1,
0.3476611, 0.1314527, 2.351923, 1, 0, 0, 1, 1,
0.3485208, -1.440531, 2.862267, 1, 0, 0, 1, 1,
0.3512037, -1.05172, 3.27253, 1, 0, 0, 1, 1,
0.3521726, -0.8729798, 3.830576, 0, 0, 0, 1, 1,
0.357517, 0.5046895, 1.04371, 0, 0, 0, 1, 1,
0.3642409, 1.599044, 0.2949463, 0, 0, 0, 1, 1,
0.3686222, -0.1243989, 3.173903, 0, 0, 0, 1, 1,
0.3686962, 0.8098412, 1.435187, 0, 0, 0, 1, 1,
0.3704273, -0.3200834, 2.093925, 0, 0, 0, 1, 1,
0.37083, -2.173778, 3.648981, 0, 0, 0, 1, 1,
0.3712251, -0.2073562, 2.41513, 1, 1, 1, 1, 1,
0.373495, -0.1324038, 1.547876, 1, 1, 1, 1, 1,
0.3755586, -0.1367446, 2.918535, 1, 1, 1, 1, 1,
0.3805446, -0.270122, 1.804892, 1, 1, 1, 1, 1,
0.3839795, 0.3568383, 2.644225, 1, 1, 1, 1, 1,
0.3853787, -0.6321465, 3.190649, 1, 1, 1, 1, 1,
0.3861139, 1.380497, 0.1417992, 1, 1, 1, 1, 1,
0.3951176, 1.975581, -0.2570087, 1, 1, 1, 1, 1,
0.3951881, -0.2996432, 3.023064, 1, 1, 1, 1, 1,
0.3998925, -0.8558655, 3.499781, 1, 1, 1, 1, 1,
0.4024556, 1.19385, -0.6443837, 1, 1, 1, 1, 1,
0.4033959, -1.153936, 3.930227, 1, 1, 1, 1, 1,
0.4040973, 0.1229299, 1.135001, 1, 1, 1, 1, 1,
0.4042626, 0.8784251, -0.6823351, 1, 1, 1, 1, 1,
0.4044411, -0.983867, 3.783034, 1, 1, 1, 1, 1,
0.4065692, 1.945609, -1.411791, 0, 0, 1, 1, 1,
0.4084055, -1.058549, 3.244569, 1, 0, 0, 1, 1,
0.4122268, -1.655868, 4.785195, 1, 0, 0, 1, 1,
0.4128453, -0.6527156, 3.910908, 1, 0, 0, 1, 1,
0.4137035, -0.8959583, 1.128559, 1, 0, 0, 1, 1,
0.4143148, 0.4646599, 2.175097, 1, 0, 0, 1, 1,
0.4143175, 0.005918586, 1.770228, 0, 0, 0, 1, 1,
0.4159803, -0.3657736, 2.655436, 0, 0, 0, 1, 1,
0.4176114, 0.3999956, 0.1159393, 0, 0, 0, 1, 1,
0.4350277, 0.09981676, 1.015554, 0, 0, 0, 1, 1,
0.4447625, -0.006777066, 2.127445, 0, 0, 0, 1, 1,
0.4467198, -2.75131, 0.9730641, 0, 0, 0, 1, 1,
0.4479319, -1.209028, 3.596757, 0, 0, 0, 1, 1,
0.4488196, -0.391114, 2.246838, 1, 1, 1, 1, 1,
0.4502593, -1.307613, 1.701824, 1, 1, 1, 1, 1,
0.4532664, 0.3407692, -0.06528643, 1, 1, 1, 1, 1,
0.4603519, -0.4597435, 3.996276, 1, 1, 1, 1, 1,
0.4623539, -0.2126653, 1.563491, 1, 1, 1, 1, 1,
0.4633236, -1.2105, 4.323971, 1, 1, 1, 1, 1,
0.4645405, 0.3624931, -0.4484982, 1, 1, 1, 1, 1,
0.4658969, -0.8910003, 3.179004, 1, 1, 1, 1, 1,
0.4691507, -0.06858478, 0.9470455, 1, 1, 1, 1, 1,
0.4702568, -0.06896738, 1.560118, 1, 1, 1, 1, 1,
0.4713165, 0.2524771, 1.87043, 1, 1, 1, 1, 1,
0.4714057, -1.209467, 2.740549, 1, 1, 1, 1, 1,
0.4744872, 0.4626012, 1.053149, 1, 1, 1, 1, 1,
0.481016, 1.036554, 1.165016, 1, 1, 1, 1, 1,
0.4813422, 0.460011, -0.702268, 1, 1, 1, 1, 1,
0.4814835, 0.3798324, 1.450677, 0, 0, 1, 1, 1,
0.4826092, 1.542094, -0.6471984, 1, 0, 0, 1, 1,
0.4887251, -0.3581903, 2.742571, 1, 0, 0, 1, 1,
0.491489, 1.892772, -0.4758786, 1, 0, 0, 1, 1,
0.4963656, 0.2890205, 1.499617, 1, 0, 0, 1, 1,
0.4965949, -0.3493923, 2.083244, 1, 0, 0, 1, 1,
0.4966163, -1.05636, 2.467817, 0, 0, 0, 1, 1,
0.4991889, 0.463332, -0.5769579, 0, 0, 0, 1, 1,
0.5002474, -0.8056275, 2.522034, 0, 0, 0, 1, 1,
0.5010454, -0.1184226, 1.168009, 0, 0, 0, 1, 1,
0.5029592, -1.571193, 2.835272, 0, 0, 0, 1, 1,
0.5045539, 0.4543359, -3.248592, 0, 0, 0, 1, 1,
0.5056847, -0.4110349, 1.804808, 0, 0, 0, 1, 1,
0.515565, 0.1390656, 1.347053, 1, 1, 1, 1, 1,
0.5256541, 1.203656, 0.7339821, 1, 1, 1, 1, 1,
0.5288913, -0.246186, 0.4430965, 1, 1, 1, 1, 1,
0.529832, -0.3382422, 1.772643, 1, 1, 1, 1, 1,
0.5315378, -0.1573957, 0.7273216, 1, 1, 1, 1, 1,
0.5321977, 1.220962, 0.03923221, 1, 1, 1, 1, 1,
0.5335705, 0.276808, 1.148311, 1, 1, 1, 1, 1,
0.5355656, -0.2732537, 2.429159, 1, 1, 1, 1, 1,
0.5366073, -0.591291, 0.7558492, 1, 1, 1, 1, 1,
0.5385802, 0.4815915, 1.818476, 1, 1, 1, 1, 1,
0.5458607, 2.335825, 0.468703, 1, 1, 1, 1, 1,
0.5486367, 0.50731, 0.6735958, 1, 1, 1, 1, 1,
0.5492133, -1.726813, 1.886438, 1, 1, 1, 1, 1,
0.5498663, -0.1191223, 3.430918, 1, 1, 1, 1, 1,
0.553256, 0.6341147, 0.6810479, 1, 1, 1, 1, 1,
0.5543888, -0.3885432, 2.799444, 0, 0, 1, 1, 1,
0.5558085, 0.4926256, 0.3936383, 1, 0, 0, 1, 1,
0.5558113, 1.276398, 1.200595, 1, 0, 0, 1, 1,
0.5577729, 0.82011, 0.6214161, 1, 0, 0, 1, 1,
0.5597675, 0.1754871, 3.038437, 1, 0, 0, 1, 1,
0.5644236, -0.7239816, 2.588089, 1, 0, 0, 1, 1,
0.5771465, -0.5738837, 1.14194, 0, 0, 0, 1, 1,
0.579735, 0.491304, 1.209751, 0, 0, 0, 1, 1,
0.5938944, -0.2602615, 2.908116, 0, 0, 0, 1, 1,
0.5942246, 0.1967088, 1.293405, 0, 0, 0, 1, 1,
0.6023687, -0.6720644, 1.907108, 0, 0, 0, 1, 1,
0.6046858, -0.1162398, 1.191991, 0, 0, 0, 1, 1,
0.6090406, -1.063976, 2.984052, 0, 0, 0, 1, 1,
0.6150312, 1.326104, 0.4860064, 1, 1, 1, 1, 1,
0.6155769, -0.3191226, 1.544032, 1, 1, 1, 1, 1,
0.6187295, -0.4392724, 2.258728, 1, 1, 1, 1, 1,
0.6261117, -1.127499, 2.913814, 1, 1, 1, 1, 1,
0.6279942, -1.539791, 3.775822, 1, 1, 1, 1, 1,
0.6289482, 0.3473896, 1.497964, 1, 1, 1, 1, 1,
0.6317998, -0.6823045, 2.235465, 1, 1, 1, 1, 1,
0.6333947, 1.282741, -0.6389091, 1, 1, 1, 1, 1,
0.6358463, 0.09157687, 1.324573, 1, 1, 1, 1, 1,
0.6377848, 0.8183382, 1.050836, 1, 1, 1, 1, 1,
0.6389568, -0.9813622, 2.478283, 1, 1, 1, 1, 1,
0.6408962, -0.9282496, 1.437422, 1, 1, 1, 1, 1,
0.6481577, -0.2892025, 3.146397, 1, 1, 1, 1, 1,
0.6488671, -1.311021, 3.098949, 1, 1, 1, 1, 1,
0.6592619, -0.03004691, -0.4292554, 1, 1, 1, 1, 1,
0.6616088, -0.3942077, 1.367238, 0, 0, 1, 1, 1,
0.6622208, 1.115263, -0.1564032, 1, 0, 0, 1, 1,
0.6665211, -1.001108, 1.446112, 1, 0, 0, 1, 1,
0.6667345, 0.1510277, 1.545007, 1, 0, 0, 1, 1,
0.6713654, 0.2920521, 2.060633, 1, 0, 0, 1, 1,
0.6762354, -1.870052, 2.853262, 1, 0, 0, 1, 1,
0.6766955, 1.565224, -0.1401513, 0, 0, 0, 1, 1,
0.6787813, -2.516419, 2.764158, 0, 0, 0, 1, 1,
0.6889601, 0.8002075, 0.1518446, 0, 0, 0, 1, 1,
0.6920623, -0.617791, 0.734966, 0, 0, 0, 1, 1,
0.695721, -1.772126, 2.853356, 0, 0, 0, 1, 1,
0.6972358, -0.7557215, 1.0992, 0, 0, 0, 1, 1,
0.7022938, 0.04307128, -0.6041025, 0, 0, 0, 1, 1,
0.7050912, -0.4795136, 3.649357, 1, 1, 1, 1, 1,
0.7070171, 0.4146396, 2.237006, 1, 1, 1, 1, 1,
0.708452, 2.104629, 3.699655, 1, 1, 1, 1, 1,
0.7096471, -0.7999632, 4.01938, 1, 1, 1, 1, 1,
0.7105702, -1.416451, 2.518689, 1, 1, 1, 1, 1,
0.7144333, -0.5627255, 1.777657, 1, 1, 1, 1, 1,
0.7152439, -0.5900583, 2.022732, 1, 1, 1, 1, 1,
0.7159536, -1.393135, 3.539606, 1, 1, 1, 1, 1,
0.7223177, -0.3200375, 2.907102, 1, 1, 1, 1, 1,
0.7277332, -0.6618912, 1.649755, 1, 1, 1, 1, 1,
0.7292475, -0.6574538, 2.302874, 1, 1, 1, 1, 1,
0.7328705, -0.08026536, 2.522725, 1, 1, 1, 1, 1,
0.7362347, 1.328431, -1.285949, 1, 1, 1, 1, 1,
0.7397776, -1.918635, 2.774514, 1, 1, 1, 1, 1,
0.7398226, -1.003529, 3.281232, 1, 1, 1, 1, 1,
0.7511687, 0.724737, 1.294196, 0, 0, 1, 1, 1,
0.7527559, 0.352023, 0.8987188, 1, 0, 0, 1, 1,
0.7608238, -0.5368176, 1.690392, 1, 0, 0, 1, 1,
0.7659714, -0.1850714, 1.633762, 1, 0, 0, 1, 1,
0.7695234, 1.056555, 0.2852481, 1, 0, 0, 1, 1,
0.7708051, -1.870627, 1.923446, 1, 0, 0, 1, 1,
0.7713777, 1.233537, 0.9465796, 0, 0, 0, 1, 1,
0.7716194, 1.427228, -0.1765536, 0, 0, 0, 1, 1,
0.7748615, -1.297474, 2.093505, 0, 0, 0, 1, 1,
0.7785109, 0.6517, 1.536132, 0, 0, 0, 1, 1,
0.7866271, 0.5813694, 0.9580551, 0, 0, 0, 1, 1,
0.7876096, 0.8725507, 0.9061936, 0, 0, 0, 1, 1,
0.7889794, -0.5066149, 3.480757, 0, 0, 0, 1, 1,
0.7904302, -1.046345, 2.512714, 1, 1, 1, 1, 1,
0.7904885, -0.2124318, 0.08968468, 1, 1, 1, 1, 1,
0.7986785, 0.6177284, -0.2858822, 1, 1, 1, 1, 1,
0.8006219, 1.621846, 1.299216, 1, 1, 1, 1, 1,
0.8012874, -0.3284528, 0.1496564, 1, 1, 1, 1, 1,
0.8125803, -0.3299315, 0.5931879, 1, 1, 1, 1, 1,
0.8178992, -1.387394, 2.588904, 1, 1, 1, 1, 1,
0.8200986, -1.457526, -0.658365, 1, 1, 1, 1, 1,
0.8209012, -0.03572894, 1.901925, 1, 1, 1, 1, 1,
0.8220665, -0.9903411, 2.621655, 1, 1, 1, 1, 1,
0.8300276, 0.6313305, 1.56933, 1, 1, 1, 1, 1,
0.8308899, 0.0359522, 2.203582, 1, 1, 1, 1, 1,
0.8363404, -0.4618329, -0.104264, 1, 1, 1, 1, 1,
0.8376237, -1.034435, 2.852813, 1, 1, 1, 1, 1,
0.8416551, 0.7370071, 1.131761, 1, 1, 1, 1, 1,
0.8519585, -1.207807, 3.306085, 0, 0, 1, 1, 1,
0.8567476, -0.8281167, 3.665877, 1, 0, 0, 1, 1,
0.8663586, 0.0535112, 2.477693, 1, 0, 0, 1, 1,
0.8802606, -0.8638021, 1.125607, 1, 0, 0, 1, 1,
0.8813569, -0.04443031, 1.466583, 1, 0, 0, 1, 1,
0.8838246, -0.5045678, 2.354831, 1, 0, 0, 1, 1,
0.8861108, -0.1678061, 0.2334374, 0, 0, 0, 1, 1,
0.8864528, 2.127587, -0.385067, 0, 0, 0, 1, 1,
0.8893567, 1.571575, 0.06353882, 0, 0, 0, 1, 1,
0.8989324, 0.03848975, 1.161201, 0, 0, 0, 1, 1,
0.899304, -1.986426, 2.2808, 0, 0, 0, 1, 1,
0.9109691, 1.050751, 0.4445637, 0, 0, 0, 1, 1,
0.9219295, 1.91802, 1.038739, 0, 0, 0, 1, 1,
0.9240686, -0.5962227, 0.3290211, 1, 1, 1, 1, 1,
0.9266088, 1.588993, 0.7724493, 1, 1, 1, 1, 1,
0.9293013, 0.959004, 0.7493051, 1, 1, 1, 1, 1,
0.931985, -0.9411262, 3.385481, 1, 1, 1, 1, 1,
0.9328189, 0.16697, 2.126539, 1, 1, 1, 1, 1,
0.936966, -0.8436884, 4.338151, 1, 1, 1, 1, 1,
0.9387246, 0.3990732, 1.860232, 1, 1, 1, 1, 1,
0.9401237, 0.5140215, 1.838555, 1, 1, 1, 1, 1,
0.9435934, 0.353458, -0.02368751, 1, 1, 1, 1, 1,
0.9465903, 0.2094312, 0.5800961, 1, 1, 1, 1, 1,
0.9488646, 0.1253428, 1.292072, 1, 1, 1, 1, 1,
0.9531506, -0.9041889, 0.5878866, 1, 1, 1, 1, 1,
0.9532201, 0.0553164, 0.3417709, 1, 1, 1, 1, 1,
0.9549369, -0.134249, 2.020305, 1, 1, 1, 1, 1,
0.9608497, -0.2599081, 3.332783, 1, 1, 1, 1, 1,
0.9698102, -0.7035337, 2.341047, 0, 0, 1, 1, 1,
0.9723228, -0.8516277, 2.135734, 1, 0, 0, 1, 1,
0.9740226, 1.148812, 0.4599821, 1, 0, 0, 1, 1,
0.9753258, -0.3128363, 0.1506728, 1, 0, 0, 1, 1,
0.975507, 0.7613957, 0.2204732, 1, 0, 0, 1, 1,
0.9812573, -0.6210005, 2.005389, 1, 0, 0, 1, 1,
0.9817994, 0.1666632, 0.7586856, 0, 0, 0, 1, 1,
0.9837572, -0.1514034, 2.025402, 0, 0, 0, 1, 1,
0.9859012, 0.1186159, 1.306078, 0, 0, 0, 1, 1,
0.9878296, -0.8468928, 3.372734, 0, 0, 0, 1, 1,
0.9934936, -0.4045082, 3.997619, 0, 0, 0, 1, 1,
0.9969087, -0.8791444, 2.482367, 0, 0, 0, 1, 1,
1.000579, 0.6511514, 2.293225, 0, 0, 0, 1, 1,
1.001413, -0.04804834, 2.61832, 1, 1, 1, 1, 1,
1.006059, 0.21036, 1.48467, 1, 1, 1, 1, 1,
1.012099, 1.369133, 0.9128614, 1, 1, 1, 1, 1,
1.019367, -0.7049627, 1.843631, 1, 1, 1, 1, 1,
1.022646, -1.06664, 1.490431, 1, 1, 1, 1, 1,
1.024406, 0.005500201, 1.380631, 1, 1, 1, 1, 1,
1.032215, -0.6236758, 2.052841, 1, 1, 1, 1, 1,
1.043338, 0.1192312, 0.9295436, 1, 1, 1, 1, 1,
1.044434, 0.4023363, 1.727405, 1, 1, 1, 1, 1,
1.045881, -1.401622, 1.116641, 1, 1, 1, 1, 1,
1.053915, -1.466745, 2.131652, 1, 1, 1, 1, 1,
1.053952, 0.5692834, 2.619166, 1, 1, 1, 1, 1,
1.065824, 0.5802141, 0.8250126, 1, 1, 1, 1, 1,
1.065939, 0.5559506, -1.105953, 1, 1, 1, 1, 1,
1.067372, -0.23725, 2.919217, 1, 1, 1, 1, 1,
1.06963, -0.04471754, 0.1401758, 0, 0, 1, 1, 1,
1.080763, -1.276075, 2.376753, 1, 0, 0, 1, 1,
1.085251, 1.369033, 0.2680061, 1, 0, 0, 1, 1,
1.089419, 1.646614, 0.3833396, 1, 0, 0, 1, 1,
1.096406, -0.719265, 2.766301, 1, 0, 0, 1, 1,
1.097739, -2.849722, 2.919793, 1, 0, 0, 1, 1,
1.09891, 0.3977693, 1.354154, 0, 0, 0, 1, 1,
1.106492, 0.03826268, 1.056782, 0, 0, 0, 1, 1,
1.109959, -0.6941146, 2.151776, 0, 0, 0, 1, 1,
1.11214, 0.4738985, 0.3358333, 0, 0, 0, 1, 1,
1.116801, -0.1049009, 1.624751, 0, 0, 0, 1, 1,
1.117575, 0.4594615, 1.251948, 0, 0, 0, 1, 1,
1.118462, 1.154669, -1.433697, 0, 0, 0, 1, 1,
1.126855, -0.0665448, 2.001356, 1, 1, 1, 1, 1,
1.128017, 2.54553, 1.777505, 1, 1, 1, 1, 1,
1.136825, 0.5473592, 2.307461, 1, 1, 1, 1, 1,
1.153455, 0.2502705, 1.374597, 1, 1, 1, 1, 1,
1.162591, -0.4680535, 1.720258, 1, 1, 1, 1, 1,
1.181596, -0.304783, 2.561934, 1, 1, 1, 1, 1,
1.184541, 0.7288613, -0.4001262, 1, 1, 1, 1, 1,
1.188293, 0.577067, 2.471492, 1, 1, 1, 1, 1,
1.202356, 0.5990059, -0.1199542, 1, 1, 1, 1, 1,
1.205931, 1.129317, 0.03576402, 1, 1, 1, 1, 1,
1.215513, -0.6340007, 2.506727, 1, 1, 1, 1, 1,
1.223207, -1.449533, 1.775311, 1, 1, 1, 1, 1,
1.225983, -0.2588275, 1.805102, 1, 1, 1, 1, 1,
1.231858, 0.06926809, 1.103492, 1, 1, 1, 1, 1,
1.234939, 0.4451191, 1.09916, 1, 1, 1, 1, 1,
1.240461, -1.003042, 2.12625, 0, 0, 1, 1, 1,
1.258581, 0.6214173, 0.4347098, 1, 0, 0, 1, 1,
1.262594, 0.6003783, 2.603974, 1, 0, 0, 1, 1,
1.263183, 0.7539794, -0.138512, 1, 0, 0, 1, 1,
1.265038, -0.7862366, 0.9386504, 1, 0, 0, 1, 1,
1.267596, 2.211484, 1.561054, 1, 0, 0, 1, 1,
1.268061, -0.5888563, 3.736943, 0, 0, 0, 1, 1,
1.268787, -0.1487065, 1.91864, 0, 0, 0, 1, 1,
1.269454, -0.6687869, 0.1615308, 0, 0, 0, 1, 1,
1.272603, -0.08641437, 0.7944275, 0, 0, 0, 1, 1,
1.273153, -0.07868623, 2.041581, 0, 0, 0, 1, 1,
1.297424, -0.4609744, 2.437347, 0, 0, 0, 1, 1,
1.297463, 0.6358598, 0.564116, 0, 0, 0, 1, 1,
1.305341, -0.8255602, 0.9431103, 1, 1, 1, 1, 1,
1.306145, -0.2461354, 0.5134465, 1, 1, 1, 1, 1,
1.339448, 0.2400851, 2.323436, 1, 1, 1, 1, 1,
1.342829, 0.4895642, 2.259935, 1, 1, 1, 1, 1,
1.34741, -0.6257095, 1.999828, 1, 1, 1, 1, 1,
1.350618, 0.004667475, 2.735856, 1, 1, 1, 1, 1,
1.355978, -0.2012232, 0.195188, 1, 1, 1, 1, 1,
1.369575, -2.024887, 1.854212, 1, 1, 1, 1, 1,
1.372413, 0.09691954, 2.45451, 1, 1, 1, 1, 1,
1.375468, -0.7825353, 1.762032, 1, 1, 1, 1, 1,
1.378195, 0.3355271, 1.334474, 1, 1, 1, 1, 1,
1.400928, 0.8949721, 2.793597, 1, 1, 1, 1, 1,
1.415894, -1.465305, 2.274175, 1, 1, 1, 1, 1,
1.424691, -0.09088393, 0.4987738, 1, 1, 1, 1, 1,
1.425886, -1.774395, 2.346121, 1, 1, 1, 1, 1,
1.430498, -0.2843271, 1.719232, 0, 0, 1, 1, 1,
1.430935, -0.3480144, 1.294246, 1, 0, 0, 1, 1,
1.435885, -0.3695633, 3.915059, 1, 0, 0, 1, 1,
1.438277, -0.7220604, 2.527286, 1, 0, 0, 1, 1,
1.455941, -0.1181179, 2.475938, 1, 0, 0, 1, 1,
1.457301, 0.5798698, -0.1708458, 1, 0, 0, 1, 1,
1.457473, -0.9952015, 1.989504, 0, 0, 0, 1, 1,
1.469184, 0.3309724, 1.662137, 0, 0, 0, 1, 1,
1.473535, 0.02328086, 0.73724, 0, 0, 0, 1, 1,
1.475818, -0.3522253, 1.132539, 0, 0, 0, 1, 1,
1.480446, -1.385616, 3.687924, 0, 0, 0, 1, 1,
1.49409, -1.433904, 2.141211, 0, 0, 0, 1, 1,
1.496616, 0.7367671, 2.495339, 0, 0, 0, 1, 1,
1.498063, 1.593618, -0.1736432, 1, 1, 1, 1, 1,
1.510071, -1.495945, 0.1847314, 1, 1, 1, 1, 1,
1.51234, -0.1972458, 2.147379, 1, 1, 1, 1, 1,
1.535759, 2.184102, 0.7782114, 1, 1, 1, 1, 1,
1.556657, 0.1863171, 2.711767, 1, 1, 1, 1, 1,
1.565192, 0.7214553, 2.103493, 1, 1, 1, 1, 1,
1.568096, 0.5482414, 2.829383, 1, 1, 1, 1, 1,
1.599245, -0.5898378, 2.605918, 1, 1, 1, 1, 1,
1.599703, 0.2626204, 1.635886, 1, 1, 1, 1, 1,
1.625307, -0.0907314, 1.159719, 1, 1, 1, 1, 1,
1.631086, 1.038563, 1.597297, 1, 1, 1, 1, 1,
1.648478, -0.759791, 2.845669, 1, 1, 1, 1, 1,
1.673943, 0.1589192, 3.707243, 1, 1, 1, 1, 1,
1.713259, 0.4593512, 3.874935, 1, 1, 1, 1, 1,
1.718493, -0.7931232, 1.769104, 1, 1, 1, 1, 1,
1.720905, -2.614418, 2.244713, 0, 0, 1, 1, 1,
1.736673, 0.2256003, 0.03198558, 1, 0, 0, 1, 1,
1.738403, 0.2891587, 2.726614, 1, 0, 0, 1, 1,
1.767288, 0.5817205, 1.857913, 1, 0, 0, 1, 1,
1.780397, 1.039887, 3.031093, 1, 0, 0, 1, 1,
1.80483, -0.3102695, 1.005482, 1, 0, 0, 1, 1,
1.824922, 0.1367112, 2.003355, 0, 0, 0, 1, 1,
1.833152, -0.1365732, 1.257536, 0, 0, 0, 1, 1,
1.838729, -1.305922, 0.8117761, 0, 0, 0, 1, 1,
1.853531, -0.385854, 1.86188, 0, 0, 0, 1, 1,
1.860535, -1.613274, 3.279208, 0, 0, 0, 1, 1,
1.860676, -1.971566, 1.511298, 0, 0, 0, 1, 1,
1.88524, -0.6034967, 1.631348, 0, 0, 0, 1, 1,
1.926423, 0.2784895, 1.273756, 1, 1, 1, 1, 1,
1.930109, -0.2241789, 3.008236, 1, 1, 1, 1, 1,
1.947042, 0.4595344, 2.251974, 1, 1, 1, 1, 1,
1.960737, -0.6722172, 0.5834532, 1, 1, 1, 1, 1,
1.961277, 0.5038792, 1.146991, 1, 1, 1, 1, 1,
1.963849, 0.676183, 1.854793, 1, 1, 1, 1, 1,
2.041414, -1.500076, 2.025877, 1, 1, 1, 1, 1,
2.049273, 0.6768463, 1.416072, 1, 1, 1, 1, 1,
2.080295, -1.129384, 2.26785, 1, 1, 1, 1, 1,
2.084898, 1.067653, 0.5403785, 1, 1, 1, 1, 1,
2.108724, 1.326966, 1.318538, 1, 1, 1, 1, 1,
2.140825, 0.5249018, 1.833091, 1, 1, 1, 1, 1,
2.142697, 1.992705, 1.73616, 1, 1, 1, 1, 1,
2.145196, 2.202164, 2.11899, 1, 1, 1, 1, 1,
2.149444, 2.052881, -0.3231372, 1, 1, 1, 1, 1,
2.149686, 0.3277073, 1.351571, 0, 0, 1, 1, 1,
2.181448, 1.289689, 0.185311, 1, 0, 0, 1, 1,
2.242133, -0.8660757, 1.690783, 1, 0, 0, 1, 1,
2.270765, -2.795548, 1.93105, 1, 0, 0, 1, 1,
2.275754, -2.309233, 1.813265, 1, 0, 0, 1, 1,
2.299877, -0.3487596, 2.103334, 1, 0, 0, 1, 1,
2.307761, 1.151401, 0.8310859, 0, 0, 0, 1, 1,
2.365788, -0.2747534, 3.63715, 0, 0, 0, 1, 1,
2.40973, -0.642258, 3.034998, 0, 0, 0, 1, 1,
2.411457, 0.0760457, 0.8194113, 0, 0, 0, 1, 1,
2.468561, -0.266992, 1.329546, 0, 0, 0, 1, 1,
2.511403, 0.3912785, 1.694677, 0, 0, 0, 1, 1,
2.537567, -0.2972819, 1.46243, 0, 0, 0, 1, 1,
2.574446, -0.8432171, 1.49644, 1, 1, 1, 1, 1,
2.631841, 0.4644541, 1.476093, 1, 1, 1, 1, 1,
2.639146, -0.3977977, 2.56221, 1, 1, 1, 1, 1,
2.690993, -0.3553507, 2.82875, 1, 1, 1, 1, 1,
2.726006, 0.5079415, 0.03871645, 1, 1, 1, 1, 1,
2.902165, -1.712871, 1.606546, 1, 1, 1, 1, 1,
3.160887, -0.4839041, 2.710281, 1, 1, 1, 1, 1
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
var radius = 9.329247;
var distance = 32.76859;
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
mvMatrix.translate( -0.03073645, 0.05109942, -0.4924967 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.76859);
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
