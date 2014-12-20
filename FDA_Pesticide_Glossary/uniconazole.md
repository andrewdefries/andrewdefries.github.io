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
-3.225088, -0.3979373, -1.333791, 1, 0, 0, 1,
-3.090381, 1.852938, -1.840983, 1, 0.007843138, 0, 1,
-3.037457, -0.2967395, -1.722871, 1, 0.01176471, 0, 1,
-2.938339, 0.7818092, -0.1917657, 1, 0.01960784, 0, 1,
-2.870259, -0.7120683, -0.9234806, 1, 0.02352941, 0, 1,
-2.812274, -1.046816, -1.70503, 1, 0.03137255, 0, 1,
-2.785793, 0.6506853, -2.701887, 1, 0.03529412, 0, 1,
-2.772149, 2.034305, -2.094121, 1, 0.04313726, 0, 1,
-2.746422, -0.5021243, -3.196737, 1, 0.04705882, 0, 1,
-2.69663, 0.05311943, -2.207985, 1, 0.05490196, 0, 1,
-2.543595, 0.1333079, -0.3682239, 1, 0.05882353, 0, 1,
-2.459889, -1.448736, -1.541221, 1, 0.06666667, 0, 1,
-2.394707, 0.3211207, -2.43157, 1, 0.07058824, 0, 1,
-2.382231, 0.05284326, -0.6961815, 1, 0.07843138, 0, 1,
-2.3451, 0.7089885, -1.767068, 1, 0.08235294, 0, 1,
-2.316773, -0.7111782, -1.819717, 1, 0.09019608, 0, 1,
-2.27633, 0.6172514, -0.1056958, 1, 0.09411765, 0, 1,
-2.273018, -0.6091703, -1.25108, 1, 0.1019608, 0, 1,
-2.258978, 0.1121402, -0.3947852, 1, 0.1098039, 0, 1,
-2.244062, -0.08967697, -1.164825, 1, 0.1137255, 0, 1,
-2.231906, -0.04340992, 0.8905335, 1, 0.1215686, 0, 1,
-2.228314, 0.2554308, -1.880321, 1, 0.1254902, 0, 1,
-2.19094, -0.3825405, -0.8679629, 1, 0.1333333, 0, 1,
-2.096486, -0.5676202, -2.917698, 1, 0.1372549, 0, 1,
-2.090169, 1.220634, -2.626456, 1, 0.145098, 0, 1,
-2.064214, 0.04174706, -2.561568, 1, 0.1490196, 0, 1,
-2.057571, 1.884099, -3.633959, 1, 0.1568628, 0, 1,
-2.049536, -1.447734, -0.842347, 1, 0.1607843, 0, 1,
-2.029259, 1.222954, 0.2661754, 1, 0.1686275, 0, 1,
-2.013963, -0.4962803, -3.185153, 1, 0.172549, 0, 1,
-2.003496, 0.986192, 0.5277966, 1, 0.1803922, 0, 1,
-1.968277, -0.5288522, -2.230656, 1, 0.1843137, 0, 1,
-1.921593, -0.3840443, -3.198737, 1, 0.1921569, 0, 1,
-1.904849, 0.1944021, -4.189754, 1, 0.1960784, 0, 1,
-1.876945, 1.070806, -2.270463, 1, 0.2039216, 0, 1,
-1.872097, 0.1476116, -2.359781, 1, 0.2117647, 0, 1,
-1.87005, 0.2380844, 0.007541924, 1, 0.2156863, 0, 1,
-1.85361, 0.3900531, 1.52466, 1, 0.2235294, 0, 1,
-1.848576, 0.1950294, -1.303546, 1, 0.227451, 0, 1,
-1.840604, -0.8675742, -2.629566, 1, 0.2352941, 0, 1,
-1.837982, -1.496304, -2.136131, 1, 0.2392157, 0, 1,
-1.820603, -0.3819258, -1.149454, 1, 0.2470588, 0, 1,
-1.801995, -0.5629739, -2.339425, 1, 0.2509804, 0, 1,
-1.796133, 0.9792153, -0.06364334, 1, 0.2588235, 0, 1,
-1.775458, 0.4135119, -2.103265, 1, 0.2627451, 0, 1,
-1.775185, -0.3350535, -1.251175, 1, 0.2705882, 0, 1,
-1.725051, -0.04011349, -1.18161, 1, 0.2745098, 0, 1,
-1.723763, -0.976817, -2.021123, 1, 0.282353, 0, 1,
-1.704655, 0.925484, -1.967726, 1, 0.2862745, 0, 1,
-1.70414, 2.234827, 0.8312621, 1, 0.2941177, 0, 1,
-1.696217, -0.8201349, -3.368878, 1, 0.3019608, 0, 1,
-1.6899, -0.4950124, -1.100456, 1, 0.3058824, 0, 1,
-1.687195, -0.6772618, -0.481142, 1, 0.3137255, 0, 1,
-1.682155, 0.3618446, -1.383062, 1, 0.3176471, 0, 1,
-1.664378, -0.5504984, -0.719101, 1, 0.3254902, 0, 1,
-1.644638, 0.009369365, -2.299549, 1, 0.3294118, 0, 1,
-1.631537, -1.052508, -2.39956, 1, 0.3372549, 0, 1,
-1.617075, -0.6379316, -0.004703636, 1, 0.3411765, 0, 1,
-1.612766, 0.8714766, -0.1258019, 1, 0.3490196, 0, 1,
-1.608399, 0.6114289, -1.342752, 1, 0.3529412, 0, 1,
-1.606274, 1.136255, -2.098845, 1, 0.3607843, 0, 1,
-1.590435, 0.1036875, -1.812531, 1, 0.3647059, 0, 1,
-1.580092, 0.8221395, -2.097109, 1, 0.372549, 0, 1,
-1.564852, -2.484989, -2.265961, 1, 0.3764706, 0, 1,
-1.558776, 0.2186312, -1.136305, 1, 0.3843137, 0, 1,
-1.545425, -1.180718, -1.971076, 1, 0.3882353, 0, 1,
-1.54175, -0.2891455, -1.942875, 1, 0.3960784, 0, 1,
-1.539192, -0.344247, 0.5251441, 1, 0.4039216, 0, 1,
-1.530753, -0.7176444, -2.653666, 1, 0.4078431, 0, 1,
-1.529776, 0.2810972, -1.751098, 1, 0.4156863, 0, 1,
-1.517633, 1.406637, -0.9701289, 1, 0.4196078, 0, 1,
-1.514681, 0.3898083, -1.132266, 1, 0.427451, 0, 1,
-1.5065, -0.737924, -3.721071, 1, 0.4313726, 0, 1,
-1.506195, -0.3423719, -0.2034189, 1, 0.4392157, 0, 1,
-1.492709, -0.9092412, -3.549049, 1, 0.4431373, 0, 1,
-1.487703, 1.913526, -0.7435755, 1, 0.4509804, 0, 1,
-1.485286, -1.729782, -3.981608, 1, 0.454902, 0, 1,
-1.467956, -0.6429994, -1.962481, 1, 0.4627451, 0, 1,
-1.456234, -1.263321, -1.672377, 1, 0.4666667, 0, 1,
-1.452834, -0.8329578, -2.879465, 1, 0.4745098, 0, 1,
-1.449217, 0.08705951, -0.1113526, 1, 0.4784314, 0, 1,
-1.444827, -0.331485, -2.033541, 1, 0.4862745, 0, 1,
-1.444618, 0.3785768, -1.6309, 1, 0.4901961, 0, 1,
-1.439053, 2.24248, 0.1988944, 1, 0.4980392, 0, 1,
-1.436198, 1.169085, -0.4117315, 1, 0.5058824, 0, 1,
-1.426636, -0.5937045, -1.870196, 1, 0.509804, 0, 1,
-1.42371, -0.8706807, -2.865341, 1, 0.5176471, 0, 1,
-1.421061, 0.6601271, -2.381569, 1, 0.5215687, 0, 1,
-1.419796, -0.421083, -2.115029, 1, 0.5294118, 0, 1,
-1.415896, -1.799406, -3.721515, 1, 0.5333334, 0, 1,
-1.409058, -0.4775571, -3.026406, 1, 0.5411765, 0, 1,
-1.406847, 1.171415, -1.594477, 1, 0.5450981, 0, 1,
-1.401801, 0.2055082, -0.9069269, 1, 0.5529412, 0, 1,
-1.401301, 0.9079396, -1.647921, 1, 0.5568628, 0, 1,
-1.397607, 1.304042, 0.7721349, 1, 0.5647059, 0, 1,
-1.389658, 1.152037, -0.14637, 1, 0.5686275, 0, 1,
-1.389624, 1.4089, -0.6046693, 1, 0.5764706, 0, 1,
-1.388316, 0.4657871, -2.312015, 1, 0.5803922, 0, 1,
-1.385862, 1.878567, -2.094565, 1, 0.5882353, 0, 1,
-1.385312, 1.387115, 0.8405437, 1, 0.5921569, 0, 1,
-1.37523, -0.5146682, -3.096844, 1, 0.6, 0, 1,
-1.371635, 0.8525954, -1.302973, 1, 0.6078432, 0, 1,
-1.361186, 2.507735, 1.452983, 1, 0.6117647, 0, 1,
-1.356741, -0.502088, -1.120023, 1, 0.6196079, 0, 1,
-1.355129, -1.362856, -3.802775, 1, 0.6235294, 0, 1,
-1.352318, 0.01799594, -1.693877, 1, 0.6313726, 0, 1,
-1.344818, 0.5803101, -1.481094, 1, 0.6352941, 0, 1,
-1.343489, 0.8895297, -0.3116497, 1, 0.6431373, 0, 1,
-1.337448, -0.2398411, -1.503724, 1, 0.6470588, 0, 1,
-1.337197, -0.3291282, -3.703921, 1, 0.654902, 0, 1,
-1.334876, -0.6474899, -0.5352514, 1, 0.6588235, 0, 1,
-1.308766, 0.4787102, -0.8206871, 1, 0.6666667, 0, 1,
-1.301299, -0.9276555, -2.80873, 1, 0.6705883, 0, 1,
-1.294491, -0.2741934, -2.89087, 1, 0.6784314, 0, 1,
-1.288209, 0.1356125, -3.026379, 1, 0.682353, 0, 1,
-1.287572, 0.4758708, -0.06859599, 1, 0.6901961, 0, 1,
-1.280096, -0.08084734, -3.003006, 1, 0.6941177, 0, 1,
-1.272091, -0.1331068, -2.563537, 1, 0.7019608, 0, 1,
-1.258137, 0.9264627, -3.155274, 1, 0.7098039, 0, 1,
-1.257886, -1.458229, -0.7499782, 1, 0.7137255, 0, 1,
-1.253552, 0.6475573, -1.188959, 1, 0.7215686, 0, 1,
-1.248513, -0.9351525, -2.537572, 1, 0.7254902, 0, 1,
-1.245463, 2.645267, -2.019192, 1, 0.7333333, 0, 1,
-1.243296, 1.038893, -2.823615, 1, 0.7372549, 0, 1,
-1.240111, -0.5024277, -0.7619836, 1, 0.7450981, 0, 1,
-1.2318, -0.3207399, -0.05924694, 1, 0.7490196, 0, 1,
-1.22932, 0.2251676, -0.971523, 1, 0.7568628, 0, 1,
-1.225067, -0.7161485, -0.1625649, 1, 0.7607843, 0, 1,
-1.213212, 0.5485628, -1.533274, 1, 0.7686275, 0, 1,
-1.21064, -0.03877058, -1.844339, 1, 0.772549, 0, 1,
-1.206472, 0.2672155, -1.151128, 1, 0.7803922, 0, 1,
-1.196705, 0.1573148, -1.638338, 1, 0.7843137, 0, 1,
-1.187927, -1.147807, -2.915117, 1, 0.7921569, 0, 1,
-1.186201, 0.702668, -1.505814, 1, 0.7960784, 0, 1,
-1.184884, -0.834052, -1.956841, 1, 0.8039216, 0, 1,
-1.170509, -0.123958, -1.774375, 1, 0.8117647, 0, 1,
-1.168093, 0.9628313, -0.6999739, 1, 0.8156863, 0, 1,
-1.166381, 0.09060159, -2.030373, 1, 0.8235294, 0, 1,
-1.162902, 1.14561, -2.122241, 1, 0.827451, 0, 1,
-1.162013, 0.4378918, -2.111864, 1, 0.8352941, 0, 1,
-1.15502, -1.861941, -3.819527, 1, 0.8392157, 0, 1,
-1.149387, 0.5928189, -0.9585907, 1, 0.8470588, 0, 1,
-1.146832, -0.6927977, -3.491065, 1, 0.8509804, 0, 1,
-1.144825, 1.695266, -0.08626458, 1, 0.8588235, 0, 1,
-1.144101, -1.483162, -0.09775684, 1, 0.8627451, 0, 1,
-1.140273, 1.549674, 0.3560256, 1, 0.8705882, 0, 1,
-1.136648, -0.4561877, -0.9688908, 1, 0.8745098, 0, 1,
-1.13577, 1.161065, -1.167924, 1, 0.8823529, 0, 1,
-1.135554, -0.45798, -0.5442813, 1, 0.8862745, 0, 1,
-1.133714, -0.7001169, -3.11099, 1, 0.8941177, 0, 1,
-1.131027, 1.741373, -1.469277, 1, 0.8980392, 0, 1,
-1.128487, 0.7454185, 0.3917369, 1, 0.9058824, 0, 1,
-1.120573, -0.03671214, -1.027633, 1, 0.9137255, 0, 1,
-1.118281, 1.255864, -1.757668, 1, 0.9176471, 0, 1,
-1.116831, -1.065722, -1.300052, 1, 0.9254902, 0, 1,
-1.115715, 0.4458819, -1.288394, 1, 0.9294118, 0, 1,
-1.113821, -0.5200405, -3.083278, 1, 0.9372549, 0, 1,
-1.109462, 0.4597658, -1.477138, 1, 0.9411765, 0, 1,
-1.089019, 0.1296807, -0.04897185, 1, 0.9490196, 0, 1,
-1.088126, 0.4169451, -1.511952, 1, 0.9529412, 0, 1,
-1.085451, 0.8210362, -2.48785, 1, 0.9607843, 0, 1,
-1.077907, 1.228062, -1.495913, 1, 0.9647059, 0, 1,
-1.07451, -0.209302, 0.848399, 1, 0.972549, 0, 1,
-1.068025, -0.3390572, -2.555314, 1, 0.9764706, 0, 1,
-1.05784, 0.3103232, -1.200325, 1, 0.9843137, 0, 1,
-1.056155, -0.8288227, -2.399047, 1, 0.9882353, 0, 1,
-1.05204, 0.1929162, -0.3224683, 1, 0.9960784, 0, 1,
-1.050712, -1.60149, -3.186222, 0.9960784, 1, 0, 1,
-1.044545, 1.212875, -1.373813, 0.9921569, 1, 0, 1,
-1.040396, -0.3086007, -0.8193342, 0.9843137, 1, 0, 1,
-1.039631, 1.26389, -1.236949, 0.9803922, 1, 0, 1,
-1.038056, 0.07186566, -1.402411, 0.972549, 1, 0, 1,
-1.03631, 0.1596333, -0.4562548, 0.9686275, 1, 0, 1,
-1.033792, -0.4127315, -3.198411, 0.9607843, 1, 0, 1,
-1.026802, 0.4494469, -2.446632, 0.9568627, 1, 0, 1,
-1.026073, 0.3421595, -1.110271, 0.9490196, 1, 0, 1,
-1.024343, -0.3801062, -1.346298, 0.945098, 1, 0, 1,
-1.021976, 0.8364331, -1.898598, 0.9372549, 1, 0, 1,
-1.021411, -1.297175, -0.7042707, 0.9333333, 1, 0, 1,
-1.008766, -0.3776616, -1.369938, 0.9254902, 1, 0, 1,
-1.000132, 0.09526582, -1.481263, 0.9215686, 1, 0, 1,
-0.9963016, -0.7385507, -1.418609, 0.9137255, 1, 0, 1,
-0.9950274, -0.3417928, -1.76295, 0.9098039, 1, 0, 1,
-0.9908754, -1.208192, -4.17251, 0.9019608, 1, 0, 1,
-0.9863156, -0.009607037, -1.111124, 0.8941177, 1, 0, 1,
-0.9805229, 0.2113573, -1.243333, 0.8901961, 1, 0, 1,
-0.9657971, -0.4071614, -1.507192, 0.8823529, 1, 0, 1,
-0.9653651, 2.268762, -1.734353, 0.8784314, 1, 0, 1,
-0.9601681, -1.476369, -3.975026, 0.8705882, 1, 0, 1,
-0.95856, -1.059488, -2.325773, 0.8666667, 1, 0, 1,
-0.9544134, 1.07616, -1.181006, 0.8588235, 1, 0, 1,
-0.9516392, -0.7100602, -2.271185, 0.854902, 1, 0, 1,
-0.944733, -1.551234, -2.487107, 0.8470588, 1, 0, 1,
-0.9434479, -0.6415545, -3.262307, 0.8431373, 1, 0, 1,
-0.9410841, 0.1153001, -2.558037, 0.8352941, 1, 0, 1,
-0.9372543, -0.1579447, -0.3639058, 0.8313726, 1, 0, 1,
-0.9358004, -1.23751, -3.7333, 0.8235294, 1, 0, 1,
-0.9326156, 1.70396, 1.005915, 0.8196079, 1, 0, 1,
-0.9323751, -0.1589491, -1.047317, 0.8117647, 1, 0, 1,
-0.9298937, -1.974187, -2.418737, 0.8078431, 1, 0, 1,
-0.9282266, -0.1586722, -2.089418, 0.8, 1, 0, 1,
-0.9254621, 0.4599472, -1.671159, 0.7921569, 1, 0, 1,
-0.9238952, -0.9238198, -1.200738, 0.7882353, 1, 0, 1,
-0.9231098, -0.7872846, -0.1047452, 0.7803922, 1, 0, 1,
-0.922599, -0.1311193, -1.471002, 0.7764706, 1, 0, 1,
-0.9221743, 0.8354765, -1.552935, 0.7686275, 1, 0, 1,
-0.9206194, 0.904709, -1.875402, 0.7647059, 1, 0, 1,
-0.919919, -1.238761, -3.077036, 0.7568628, 1, 0, 1,
-0.9177454, 0.1533312, -2.194325, 0.7529412, 1, 0, 1,
-0.9133055, 0.5488922, -2.788451, 0.7450981, 1, 0, 1,
-0.906707, -0.3323813, -2.708073, 0.7411765, 1, 0, 1,
-0.905953, -0.718668, -1.904808, 0.7333333, 1, 0, 1,
-0.9049575, -0.9848276, -2.60755, 0.7294118, 1, 0, 1,
-0.9000593, 0.9414872, -0.2085868, 0.7215686, 1, 0, 1,
-0.8995949, -0.3493849, -2.054103, 0.7176471, 1, 0, 1,
-0.8992708, -2.679475, -2.981606, 0.7098039, 1, 0, 1,
-0.8890122, 0.3155799, -0.04955864, 0.7058824, 1, 0, 1,
-0.8870724, -0.1200234, -0.4397518, 0.6980392, 1, 0, 1,
-0.8866081, 0.02207636, -1.352258, 0.6901961, 1, 0, 1,
-0.8856675, -0.6843497, -4.324382, 0.6862745, 1, 0, 1,
-0.8838332, 1.664269, 0.009190468, 0.6784314, 1, 0, 1,
-0.8772462, 0.2277325, -2.276318, 0.6745098, 1, 0, 1,
-0.872263, -1.398259, -3.509186, 0.6666667, 1, 0, 1,
-0.8596648, -0.001090852, -0.1312472, 0.6627451, 1, 0, 1,
-0.8582566, 0.5043063, -1.655336, 0.654902, 1, 0, 1,
-0.8562499, 0.5281244, 0.1389479, 0.6509804, 1, 0, 1,
-0.8497049, 1.071108, -0.3366664, 0.6431373, 1, 0, 1,
-0.8443859, -0.1921797, -1.435429, 0.6392157, 1, 0, 1,
-0.8422092, -0.7381362, -3.19678, 0.6313726, 1, 0, 1,
-0.8421659, 0.2574543, -1.46983, 0.627451, 1, 0, 1,
-0.8386844, 0.4208848, 0.01575404, 0.6196079, 1, 0, 1,
-0.8384477, 0.8442679, -1.175369, 0.6156863, 1, 0, 1,
-0.8294076, -0.06410599, -0.8151862, 0.6078432, 1, 0, 1,
-0.8276466, 0.7237129, -1.82724, 0.6039216, 1, 0, 1,
-0.8183472, 0.382332, -1.22087, 0.5960785, 1, 0, 1,
-0.8144031, 0.5565637, -1.294702, 0.5882353, 1, 0, 1,
-0.8079345, -0.2949215, -0.7165301, 0.5843138, 1, 0, 1,
-0.8019305, 2.45814, -0.8112907, 0.5764706, 1, 0, 1,
-0.7976237, -1.976038, -4.7159, 0.572549, 1, 0, 1,
-0.7958055, -0.7299632, -0.03312374, 0.5647059, 1, 0, 1,
-0.7921336, 1.102783, -2.113085, 0.5607843, 1, 0, 1,
-0.7765134, 0.6653563, -1.530554, 0.5529412, 1, 0, 1,
-0.7657439, -0.3512994, -1.588087, 0.5490196, 1, 0, 1,
-0.7599638, -0.6378579, -2.885121, 0.5411765, 1, 0, 1,
-0.7576751, 0.4035569, 0.04193856, 0.5372549, 1, 0, 1,
-0.7569421, 1.038556, 0.6243768, 0.5294118, 1, 0, 1,
-0.7561474, 0.01939378, -1.813196, 0.5254902, 1, 0, 1,
-0.7542719, 0.6216979, -0.4648075, 0.5176471, 1, 0, 1,
-0.7486069, 0.2464265, -3.01609, 0.5137255, 1, 0, 1,
-0.7440655, 0.9818634, 0.9503435, 0.5058824, 1, 0, 1,
-0.7365051, 0.872941, -0.1038005, 0.5019608, 1, 0, 1,
-0.7325716, 0.6232171, -1.475663, 0.4941176, 1, 0, 1,
-0.7324517, -1.069732, -2.651529, 0.4862745, 1, 0, 1,
-0.7321392, 0.5763257, -0.345883, 0.4823529, 1, 0, 1,
-0.7320634, 0.03406499, -0.8400287, 0.4745098, 1, 0, 1,
-0.7306238, -0.6081427, -2.343849, 0.4705882, 1, 0, 1,
-0.7293926, -0.1153058, -1.584053, 0.4627451, 1, 0, 1,
-0.7259338, 1.0953, 0.4066999, 0.4588235, 1, 0, 1,
-0.7171361, 0.3811899, -2.481969, 0.4509804, 1, 0, 1,
-0.7103119, -1.032447, -3.252548, 0.4470588, 1, 0, 1,
-0.7085803, 0.302384, -3.26871, 0.4392157, 1, 0, 1,
-0.7085694, 0.1189908, -2.322479, 0.4352941, 1, 0, 1,
-0.7069995, 0.4534691, 0.2060836, 0.427451, 1, 0, 1,
-0.7033177, 1.150282, -1.518604, 0.4235294, 1, 0, 1,
-0.699805, 0.7418931, -0.5631266, 0.4156863, 1, 0, 1,
-0.6962057, 1.321131, -0.2416497, 0.4117647, 1, 0, 1,
-0.6942809, 2.599275, 0.6895217, 0.4039216, 1, 0, 1,
-0.6936285, -0.5994031, -1.890557, 0.3960784, 1, 0, 1,
-0.6922932, -0.4885098, 0.2258782, 0.3921569, 1, 0, 1,
-0.6902384, -0.6645882, -1.171242, 0.3843137, 1, 0, 1,
-0.6890892, 0.02843532, -2.715304, 0.3803922, 1, 0, 1,
-0.6890768, 0.01779997, -3.493371, 0.372549, 1, 0, 1,
-0.6813217, -0.1324558, -0.8566415, 0.3686275, 1, 0, 1,
-0.6789706, -0.124985, -2.568184, 0.3607843, 1, 0, 1,
-0.67583, 0.9582536, -2.013177, 0.3568628, 1, 0, 1,
-0.6663391, -0.1960834, -4.034558, 0.3490196, 1, 0, 1,
-0.6637657, -0.5072206, -2.623682, 0.345098, 1, 0, 1,
-0.6633965, 0.003727135, 0.02833527, 0.3372549, 1, 0, 1,
-0.6585549, -0.06239675, -1.458335, 0.3333333, 1, 0, 1,
-0.6574109, 0.4701101, -1.430951, 0.3254902, 1, 0, 1,
-0.6549541, 0.08530492, -0.5476339, 0.3215686, 1, 0, 1,
-0.6535487, -0.5337012, -1.434939, 0.3137255, 1, 0, 1,
-0.6488014, 0.2048649, 0.5821038, 0.3098039, 1, 0, 1,
-0.6482637, -0.7462128, -2.859987, 0.3019608, 1, 0, 1,
-0.6446703, 1.437809, -2.223981, 0.2941177, 1, 0, 1,
-0.6387703, 0.4744562, -0.302451, 0.2901961, 1, 0, 1,
-0.6358418, 0.7931145, 0.2754216, 0.282353, 1, 0, 1,
-0.631852, 0.8132176, 2.231667, 0.2784314, 1, 0, 1,
-0.6292506, -0.9791587, -1.98353, 0.2705882, 1, 0, 1,
-0.6285664, -1.296099, -1.174567, 0.2666667, 1, 0, 1,
-0.6274405, -0.106388, -1.513134, 0.2588235, 1, 0, 1,
-0.6244659, -0.3857965, -1.451456, 0.254902, 1, 0, 1,
-0.6242176, -1.764758, -3.600495, 0.2470588, 1, 0, 1,
-0.6236114, 0.5812041, -0.9223108, 0.2431373, 1, 0, 1,
-0.6229501, -1.12662, -0.4757609, 0.2352941, 1, 0, 1,
-0.622519, -2.003496, -4.681904, 0.2313726, 1, 0, 1,
-0.6170388, 0.9321615, -1.596317, 0.2235294, 1, 0, 1,
-0.6150588, 1.148347, -1.161126, 0.2196078, 1, 0, 1,
-0.610491, -0.1774584, -0.3717832, 0.2117647, 1, 0, 1,
-0.6080463, -0.02052615, -2.330008, 0.2078431, 1, 0, 1,
-0.6071106, -0.0456908, -1.323, 0.2, 1, 0, 1,
-0.6061957, -0.7558237, -2.918521, 0.1921569, 1, 0, 1,
-0.6057583, 1.486589, -0.2016281, 0.1882353, 1, 0, 1,
-0.6029754, 0.4097598, -2.058537, 0.1803922, 1, 0, 1,
-0.6028323, -1.48763, -3.133477, 0.1764706, 1, 0, 1,
-0.6002504, -0.2516032, -1.488762, 0.1686275, 1, 0, 1,
-0.59772, -0.5895017, -2.064178, 0.1647059, 1, 0, 1,
-0.5971302, -0.6366659, -2.790764, 0.1568628, 1, 0, 1,
-0.5958104, 1.507951, -0.2682267, 0.1529412, 1, 0, 1,
-0.5942919, 0.3014406, -2.422001, 0.145098, 1, 0, 1,
-0.5912895, -0.3337739, -1.80566, 0.1411765, 1, 0, 1,
-0.5851452, 1.351797, 0.2049088, 0.1333333, 1, 0, 1,
-0.5828637, 0.4551801, 0.9893119, 0.1294118, 1, 0, 1,
-0.5771404, -0.1967535, -0.5224012, 0.1215686, 1, 0, 1,
-0.577031, -0.902077, -2.846943, 0.1176471, 1, 0, 1,
-0.5710236, -1.377396, -4.363129, 0.1098039, 1, 0, 1,
-0.5668889, 0.4767306, -0.4118071, 0.1058824, 1, 0, 1,
-0.5458611, -0.1216741, -0.1547427, 0.09803922, 1, 0, 1,
-0.5414537, 1.364558, -0.5689964, 0.09019608, 1, 0, 1,
-0.5360209, 0.7943476, 1.091305, 0.08627451, 1, 0, 1,
-0.533309, 0.3618142, -1.580019, 0.07843138, 1, 0, 1,
-0.5320856, -1.661762, -2.327121, 0.07450981, 1, 0, 1,
-0.5310037, -0.4662977, -2.278077, 0.06666667, 1, 0, 1,
-0.5280151, 0.5399768, -1.061443, 0.0627451, 1, 0, 1,
-0.5227402, 1.53218, -0.1961218, 0.05490196, 1, 0, 1,
-0.5185673, 0.4602978, -0.3371614, 0.05098039, 1, 0, 1,
-0.5170971, -1.859113, -3.886445, 0.04313726, 1, 0, 1,
-0.5051041, -1.985987, -3.779863, 0.03921569, 1, 0, 1,
-0.5025336, 0.222584, -1.686666, 0.03137255, 1, 0, 1,
-0.4990155, -0.6900426, -3.04861, 0.02745098, 1, 0, 1,
-0.4955949, 1.571923, 1.493754, 0.01960784, 1, 0, 1,
-0.4953052, -2.075097, -1.38503, 0.01568628, 1, 0, 1,
-0.4945885, 0.4932562, 0.6304225, 0.007843138, 1, 0, 1,
-0.488637, 0.9519406, -1.222847, 0.003921569, 1, 0, 1,
-0.4885774, -0.5992847, -2.685065, 0, 1, 0.003921569, 1,
-0.482876, 1.210155, 2.192795, 0, 1, 0.01176471, 1,
-0.481826, -1.405019, -4.351659, 0, 1, 0.01568628, 1,
-0.480433, 0.345289, -0.6536937, 0, 1, 0.02352941, 1,
-0.4795867, 1.783512, 1.47538, 0, 1, 0.02745098, 1,
-0.4786451, -0.5245836, -3.281616, 0, 1, 0.03529412, 1,
-0.4782422, 0.3029156, -1.620557, 0, 1, 0.03921569, 1,
-0.4764699, -2.02663, -3.809415, 0, 1, 0.04705882, 1,
-0.4750602, 0.8659053, 0.5163525, 0, 1, 0.05098039, 1,
-0.4743744, 0.02746087, -1.75215, 0, 1, 0.05882353, 1,
-0.4732201, 0.5775892, 0.004864442, 0, 1, 0.0627451, 1,
-0.4705294, -0.4330405, -2.22839, 0, 1, 0.07058824, 1,
-0.4696328, -1.104914, -3.188844, 0, 1, 0.07450981, 1,
-0.4690872, -0.3944878, -1.096876, 0, 1, 0.08235294, 1,
-0.4681848, -0.1762871, -2.856854, 0, 1, 0.08627451, 1,
-0.4678815, 1.019744, 0.1532824, 0, 1, 0.09411765, 1,
-0.4663117, 0.9429392, 0.01202765, 0, 1, 0.1019608, 1,
-0.460126, -0.6726473, -3.056981, 0, 1, 0.1058824, 1,
-0.4589334, -1.621329, -2.045933, 0, 1, 0.1137255, 1,
-0.4570603, -0.6657372, -3.513179, 0, 1, 0.1176471, 1,
-0.4560824, 2.217266, -0.467678, 0, 1, 0.1254902, 1,
-0.4545788, -1.124896, -2.999413, 0, 1, 0.1294118, 1,
-0.4508575, 0.3390245, -1.496576, 0, 1, 0.1372549, 1,
-0.4490644, 1.201252, -1.485037, 0, 1, 0.1411765, 1,
-0.4470724, 1.886672, 0.6463003, 0, 1, 0.1490196, 1,
-0.4457861, -0.218824, -0.4020879, 0, 1, 0.1529412, 1,
-0.445774, -0.03946273, -2.578971, 0, 1, 0.1607843, 1,
-0.4453315, 1.873178, -0.1531419, 0, 1, 0.1647059, 1,
-0.4396867, -2.041023, -0.8947386, 0, 1, 0.172549, 1,
-0.4375088, 0.1170543, -2.619855, 0, 1, 0.1764706, 1,
-0.4289876, -1.173928, -2.597975, 0, 1, 0.1843137, 1,
-0.4289383, 0.05061414, -1.063281, 0, 1, 0.1882353, 1,
-0.4249016, -0.3609685, -2.15107, 0, 1, 0.1960784, 1,
-0.4243557, 0.5822583, 0.2493808, 0, 1, 0.2039216, 1,
-0.4243048, -0.5085402, -1.893002, 0, 1, 0.2078431, 1,
-0.4227395, 0.480734, -0.1900365, 0, 1, 0.2156863, 1,
-0.421908, -0.8287275, -2.71168, 0, 1, 0.2196078, 1,
-0.4173232, -0.1139714, -2.112374, 0, 1, 0.227451, 1,
-0.4161524, 1.144019, 0.6478263, 0, 1, 0.2313726, 1,
-0.408647, -0.948595, -2.893967, 0, 1, 0.2392157, 1,
-0.3984385, -1.699564, -1.796021, 0, 1, 0.2431373, 1,
-0.3958272, -1.242639, -2.441658, 0, 1, 0.2509804, 1,
-0.391743, -0.5411336, -2.485234, 0, 1, 0.254902, 1,
-0.3892608, 0.2065509, -1.810479, 0, 1, 0.2627451, 1,
-0.3890358, -0.05484576, -2.381887, 0, 1, 0.2666667, 1,
-0.3884461, -1.103853, -3.897447, 0, 1, 0.2745098, 1,
-0.3845019, -0.6011131, -3.879535, 0, 1, 0.2784314, 1,
-0.3839155, -0.1816897, -2.882908, 0, 1, 0.2862745, 1,
-0.3819666, 0.1725217, -0.6143314, 0, 1, 0.2901961, 1,
-0.3800566, -0.7300862, -1.426079, 0, 1, 0.2980392, 1,
-0.3796931, 0.2649203, -0.5510886, 0, 1, 0.3058824, 1,
-0.379558, 0.5898238, 0.558946, 0, 1, 0.3098039, 1,
-0.375448, -1.211889, -0.8257351, 0, 1, 0.3176471, 1,
-0.3742847, -0.01687477, -2.035818, 0, 1, 0.3215686, 1,
-0.3702, 0.01827912, -0.8797005, 0, 1, 0.3294118, 1,
-0.3681773, -1.111939, -1.714717, 0, 1, 0.3333333, 1,
-0.3657302, -0.3648323, -1.333722, 0, 1, 0.3411765, 1,
-0.364444, 0.6398433, 0.2181358, 0, 1, 0.345098, 1,
-0.3595239, -0.423668, -2.245817, 0, 1, 0.3529412, 1,
-0.3574429, 0.2317172, -0.1723738, 0, 1, 0.3568628, 1,
-0.3567546, 0.3116416, -2.481956, 0, 1, 0.3647059, 1,
-0.3555527, 0.5302733, -1.426188, 0, 1, 0.3686275, 1,
-0.3551537, -0.2907026, -2.504795, 0, 1, 0.3764706, 1,
-0.3483326, 0.6257275, -0.5165064, 0, 1, 0.3803922, 1,
-0.3447288, -0.7914521, -0.9912222, 0, 1, 0.3882353, 1,
-0.3417605, -0.4713381, -4.051318, 0, 1, 0.3921569, 1,
-0.3400584, 0.7510814, -1.577185, 0, 1, 0.4, 1,
-0.3357782, 0.3650814, 0.1060512, 0, 1, 0.4078431, 1,
-0.3291784, 0.00749668, -1.929437, 0, 1, 0.4117647, 1,
-0.3271773, 0.8684838, -1.302135, 0, 1, 0.4196078, 1,
-0.3204001, -0.05950883, -2.564368, 0, 1, 0.4235294, 1,
-0.3126862, -0.3985802, -2.773456, 0, 1, 0.4313726, 1,
-0.3117553, -1.165796, -2.077379, 0, 1, 0.4352941, 1,
-0.3083733, 0.525923, -0.8030472, 0, 1, 0.4431373, 1,
-0.3080618, -0.1502926, -0.8092254, 0, 1, 0.4470588, 1,
-0.3067125, 0.7033413, 0.8446776, 0, 1, 0.454902, 1,
-0.3045121, 0.4976747, -2.189715, 0, 1, 0.4588235, 1,
-0.2990502, 0.4277488, 0.3215222, 0, 1, 0.4666667, 1,
-0.2930977, -0.7848644, -3.307125, 0, 1, 0.4705882, 1,
-0.2905026, 1.250856, -0.2753146, 0, 1, 0.4784314, 1,
-0.288304, -0.8171934, -2.59155, 0, 1, 0.4823529, 1,
-0.2729222, -1.251092, -2.93095, 0, 1, 0.4901961, 1,
-0.2726779, 0.2428348, -0.4543562, 0, 1, 0.4941176, 1,
-0.2726684, -1.332246, -3.298651, 0, 1, 0.5019608, 1,
-0.2686055, -1.223358, -3.689428, 0, 1, 0.509804, 1,
-0.2675559, -1.17187, -4.159629, 0, 1, 0.5137255, 1,
-0.2654126, -0.9341533, -3.944985, 0, 1, 0.5215687, 1,
-0.2651728, -1.270823, -2.964965, 0, 1, 0.5254902, 1,
-0.2648703, 0.6511881, 0.1661589, 0, 1, 0.5333334, 1,
-0.2606388, 2.250259, 1.978759, 0, 1, 0.5372549, 1,
-0.2556691, -0.1446927, -2.698898, 0, 1, 0.5450981, 1,
-0.2525744, -1.690991, -1.369551, 0, 1, 0.5490196, 1,
-0.2477822, 0.6676822, -1.062463, 0, 1, 0.5568628, 1,
-0.2445834, -0.4387348, -2.693648, 0, 1, 0.5607843, 1,
-0.2440904, 1.167917, -0.6181409, 0, 1, 0.5686275, 1,
-0.2379778, 1.236373, -0.04331766, 0, 1, 0.572549, 1,
-0.2377671, 1.655529, 0.563794, 0, 1, 0.5803922, 1,
-0.2327046, -0.9872432, -4.057519, 0, 1, 0.5843138, 1,
-0.2250634, -0.8449765, -4.651418, 0, 1, 0.5921569, 1,
-0.2242802, -0.3334326, -2.791326, 0, 1, 0.5960785, 1,
-0.2239446, -0.6601222, -2.572219, 0, 1, 0.6039216, 1,
-0.2194825, -0.6981685, -1.910426, 0, 1, 0.6117647, 1,
-0.2191515, -0.321631, -3.239626, 0, 1, 0.6156863, 1,
-0.2134268, -2.289736, -2.972802, 0, 1, 0.6235294, 1,
-0.2127943, -0.1580858, -1.576517, 0, 1, 0.627451, 1,
-0.2123226, -0.3923297, -1.427801, 0, 1, 0.6352941, 1,
-0.2111538, -0.5387992, -2.90618, 0, 1, 0.6392157, 1,
-0.2103738, -0.07084299, -1.534952, 0, 1, 0.6470588, 1,
-0.2097697, 2.195155, 0.6136713, 0, 1, 0.6509804, 1,
-0.2054108, -1.353199, -2.991484, 0, 1, 0.6588235, 1,
-0.1984179, -0.9664867, -1.096863, 0, 1, 0.6627451, 1,
-0.1970373, 0.5213879, -0.9284663, 0, 1, 0.6705883, 1,
-0.1940518, 1.817119, -0.08866585, 0, 1, 0.6745098, 1,
-0.1926526, 0.01366615, -1.035354, 0, 1, 0.682353, 1,
-0.1882907, -0.7992376, -3.776071, 0, 1, 0.6862745, 1,
-0.1881645, 0.555408, -0.5826959, 0, 1, 0.6941177, 1,
-0.1848421, -0.9073665, -4.243124, 0, 1, 0.7019608, 1,
-0.1841788, 0.1088224, -0.4011957, 0, 1, 0.7058824, 1,
-0.1835184, -0.7996268, -1.372977, 0, 1, 0.7137255, 1,
-0.1814264, -0.5893547, -2.020465, 0, 1, 0.7176471, 1,
-0.175564, 0.6889657, -0.4626921, 0, 1, 0.7254902, 1,
-0.1721545, -0.9121947, -2.382826, 0, 1, 0.7294118, 1,
-0.1699507, 0.4596566, -1.14924, 0, 1, 0.7372549, 1,
-0.16663, -0.1205106, -3.018415, 0, 1, 0.7411765, 1,
-0.16557, -0.1936739, -4.773522, 0, 1, 0.7490196, 1,
-0.1643956, -0.5464178, -3.463013, 0, 1, 0.7529412, 1,
-0.1589356, -1.383361, -2.58858, 0, 1, 0.7607843, 1,
-0.1575743, 1.028822, 0.710874, 0, 1, 0.7647059, 1,
-0.1556937, 1.175529, -1.652382, 0, 1, 0.772549, 1,
-0.1523679, 0.4565528, -0.3207249, 0, 1, 0.7764706, 1,
-0.1498697, 0.2671452, -0.7253753, 0, 1, 0.7843137, 1,
-0.1355485, -0.8168863, -3.792258, 0, 1, 0.7882353, 1,
-0.1355044, 0.4526013, -0.5204577, 0, 1, 0.7960784, 1,
-0.1341571, 0.4421901, -0.1651652, 0, 1, 0.8039216, 1,
-0.1270409, 0.1957861, -0.08865646, 0, 1, 0.8078431, 1,
-0.1223906, 1.007589, 0.4763685, 0, 1, 0.8156863, 1,
-0.1198432, 0.3448611, 0.9302415, 0, 1, 0.8196079, 1,
-0.1183896, 1.78089, 0.2969792, 0, 1, 0.827451, 1,
-0.1171573, 0.09288578, 0.6539039, 0, 1, 0.8313726, 1,
-0.1170195, -0.0214488, -2.566619, 0, 1, 0.8392157, 1,
-0.1124532, 0.2309549, -2.176471, 0, 1, 0.8431373, 1,
-0.1120121, -1.666386, -2.674796, 0, 1, 0.8509804, 1,
-0.1118965, -0.3219073, -3.075963, 0, 1, 0.854902, 1,
-0.1084437, -0.7965577, -4.212599, 0, 1, 0.8627451, 1,
-0.1070612, -0.8935004, -4.569258, 0, 1, 0.8666667, 1,
-0.1056386, 0.4384764, 0.3134141, 0, 1, 0.8745098, 1,
-0.1042102, 1.189722, -0.4806261, 0, 1, 0.8784314, 1,
-0.1025293, 0.2672796, -0.2034679, 0, 1, 0.8862745, 1,
-0.1012382, -0.395632, -2.313757, 0, 1, 0.8901961, 1,
-0.1010766, 0.3369827, -0.2443373, 0, 1, 0.8980392, 1,
-0.1001734, 0.3146693, -1.54971, 0, 1, 0.9058824, 1,
-0.09600693, 0.1687538, 0.2593825, 0, 1, 0.9098039, 1,
-0.09594453, 0.315102, -0.472768, 0, 1, 0.9176471, 1,
-0.0932212, -1.406538, -2.316389, 0, 1, 0.9215686, 1,
-0.09229589, 0.2485494, -0.6672818, 0, 1, 0.9294118, 1,
-0.07546654, 0.09911123, -0.2808721, 0, 1, 0.9333333, 1,
-0.06875034, 0.7369443, 0.8563689, 0, 1, 0.9411765, 1,
-0.06667265, -0.5403192, -4.124699, 0, 1, 0.945098, 1,
-0.06338776, -1.443304, -2.961955, 0, 1, 0.9529412, 1,
-0.06025562, 0.2509193, 2.057833, 0, 1, 0.9568627, 1,
-0.05929189, -1.150161, -3.617889, 0, 1, 0.9647059, 1,
-0.05860178, -0.6936946, -0.6764827, 0, 1, 0.9686275, 1,
-0.05403212, 0.7210654, -0.4914191, 0, 1, 0.9764706, 1,
-0.05237199, 1.064465, -0.07012691, 0, 1, 0.9803922, 1,
-0.05082831, -0.4365897, -2.090446, 0, 1, 0.9882353, 1,
-0.04983905, 0.4925233, -0.4826936, 0, 1, 0.9921569, 1,
-0.04704417, -2.204722, -2.411548, 0, 1, 1, 1,
-0.04465486, 0.8831725, -0.9594223, 0, 0.9921569, 1, 1,
-0.03996495, 0.7312968, -1.0465, 0, 0.9882353, 1, 1,
-0.03899951, 0.3700743, -0.7395361, 0, 0.9803922, 1, 1,
-0.03679793, -1.546743, -5.071429, 0, 0.9764706, 1, 1,
-0.03461525, 1.030509, 0.2787114, 0, 0.9686275, 1, 1,
-0.03291244, -0.7481815, -3.562866, 0, 0.9647059, 1, 1,
-0.02389172, 0.1944744, -1.719901, 0, 0.9568627, 1, 1,
-0.0232625, -0.1794866, -2.393406, 0, 0.9529412, 1, 1,
-0.02165115, -0.2858476, -0.351368, 0, 0.945098, 1, 1,
-0.01951559, -0.8947914, -2.500337, 0, 0.9411765, 1, 1,
-0.01859166, 0.298945, 2.004822, 0, 0.9333333, 1, 1,
-0.01664001, 0.5820772, -0.7654066, 0, 0.9294118, 1, 1,
-0.01411832, -0.611146, -3.275779, 0, 0.9215686, 1, 1,
-0.01069497, 0.5082978, -0.8837649, 0, 0.9176471, 1, 1,
-0.009986361, -0.6562741, -3.771706, 0, 0.9098039, 1, 1,
-0.009076813, -1.098261, -2.792159, 0, 0.9058824, 1, 1,
-0.005936665, -0.1568618, -4.618101, 0, 0.8980392, 1, 1,
0.0002552966, -0.08682059, 3.412926, 0, 0.8901961, 1, 1,
0.004446644, 0.7451968, 0.327846, 0, 0.8862745, 1, 1,
0.007563116, -1.107997, 2.871686, 0, 0.8784314, 1, 1,
0.009041546, -0.5624869, 2.921941, 0, 0.8745098, 1, 1,
0.009240949, 0.481134, -0.2721767, 0, 0.8666667, 1, 1,
0.01177042, -1.237695, 2.047597, 0, 0.8627451, 1, 1,
0.01657025, 2.919381, 0.6121294, 0, 0.854902, 1, 1,
0.02198882, -2.095479, 4.33815, 0, 0.8509804, 1, 1,
0.02813718, -1.448416, 4.208027, 0, 0.8431373, 1, 1,
0.03073224, 0.8879995, -0.355581, 0, 0.8392157, 1, 1,
0.03275971, -0.004814277, 1.457872, 0, 0.8313726, 1, 1,
0.03478188, 1.481931, 0.8878673, 0, 0.827451, 1, 1,
0.03683015, 1.611777, 0.2095055, 0, 0.8196079, 1, 1,
0.03737155, 0.3063337, -0.8909154, 0, 0.8156863, 1, 1,
0.04161629, -0.04044632, 2.398562, 0, 0.8078431, 1, 1,
0.04445009, -0.4129915, 2.844131, 0, 0.8039216, 1, 1,
0.04937109, -0.2804617, 4.433267, 0, 0.7960784, 1, 1,
0.0502739, -1.445129, 2.521676, 0, 0.7882353, 1, 1,
0.06262236, 0.9934445, -0.1941121, 0, 0.7843137, 1, 1,
0.06514865, -1.004607, 2.221976, 0, 0.7764706, 1, 1,
0.06547147, -1.83579, 2.505158, 0, 0.772549, 1, 1,
0.06557417, 0.5845292, -0.818927, 0, 0.7647059, 1, 1,
0.06826719, 1.784544, 0.5437616, 0, 0.7607843, 1, 1,
0.06852869, 0.4880722, 0.3620926, 0, 0.7529412, 1, 1,
0.07158593, 0.1542784, 0.808396, 0, 0.7490196, 1, 1,
0.07456835, 0.7944313, 0.1554297, 0, 0.7411765, 1, 1,
0.07565963, 0.4936961, -0.1057879, 0, 0.7372549, 1, 1,
0.08036406, -0.1397013, 2.385478, 0, 0.7294118, 1, 1,
0.08137283, 0.3090582, 1.254158, 0, 0.7254902, 1, 1,
0.0824871, -0.5965892, 2.26406, 0, 0.7176471, 1, 1,
0.0830809, -1.630914, 4.693872, 0, 0.7137255, 1, 1,
0.08478227, 0.3211749, -0.1884103, 0, 0.7058824, 1, 1,
0.08772249, 0.6974518, -0.02742202, 0, 0.6980392, 1, 1,
0.08776695, 1.20744, 1.745302, 0, 0.6941177, 1, 1,
0.09024883, 0.1976327, 0.3656471, 0, 0.6862745, 1, 1,
0.09106831, 0.1533234, 1.09068, 0, 0.682353, 1, 1,
0.09447004, -0.196338, 2.167613, 0, 0.6745098, 1, 1,
0.09829425, 1.01797, 0.1437161, 0, 0.6705883, 1, 1,
0.09907794, -1.23739, 1.725885, 0, 0.6627451, 1, 1,
0.1067781, -0.608303, 3.000635, 0, 0.6588235, 1, 1,
0.1164349, 1.869143, -0.3362125, 0, 0.6509804, 1, 1,
0.1176674, -0.7570071, 3.663492, 0, 0.6470588, 1, 1,
0.1182243, 1.151027, 1.335814, 0, 0.6392157, 1, 1,
0.1238231, -0.2635291, 2.140701, 0, 0.6352941, 1, 1,
0.1254176, -0.5423974, 2.839532, 0, 0.627451, 1, 1,
0.1283462, -0.4206965, 4.375224, 0, 0.6235294, 1, 1,
0.1293482, -2.514283, 4.488307, 0, 0.6156863, 1, 1,
0.1294454, 0.5031337, 0.0111563, 0, 0.6117647, 1, 1,
0.1305907, 0.9019765, 1.208747, 0, 0.6039216, 1, 1,
0.1334598, 0.8558649, -0.6434885, 0, 0.5960785, 1, 1,
0.1403893, 0.8196691, 1.705439, 0, 0.5921569, 1, 1,
0.1446087, -0.2389039, 4.277256, 0, 0.5843138, 1, 1,
0.1449917, -0.556312, 2.272917, 0, 0.5803922, 1, 1,
0.1453047, 2.030238, 0.9997916, 0, 0.572549, 1, 1,
0.1480702, -0.8581089, 4.732002, 0, 0.5686275, 1, 1,
0.1481698, 0.5106611, 1.516604, 0, 0.5607843, 1, 1,
0.1504167, 0.2353898, 1.814583, 0, 0.5568628, 1, 1,
0.1506478, -0.249138, 1.769399, 0, 0.5490196, 1, 1,
0.154704, -0.9321133, 4.323423, 0, 0.5450981, 1, 1,
0.1555016, 0.08309134, 0.9542626, 0, 0.5372549, 1, 1,
0.1564818, 0.6364361, 0.5372421, 0, 0.5333334, 1, 1,
0.1566114, -1.713822, 2.520383, 0, 0.5254902, 1, 1,
0.1601379, 0.9097403, 1.49799, 0, 0.5215687, 1, 1,
0.1751244, 0.4339289, 1.007953, 0, 0.5137255, 1, 1,
0.1754043, 0.463112, -1.193379, 0, 0.509804, 1, 1,
0.1764777, 2.639072, -0.4413021, 0, 0.5019608, 1, 1,
0.187674, -2.428823, 2.460243, 0, 0.4941176, 1, 1,
0.1903736, -1.142056, 3.152602, 0, 0.4901961, 1, 1,
0.1967521, 0.6876262, 2.437209, 0, 0.4823529, 1, 1,
0.1972148, -0.5437763, 4.049146, 0, 0.4784314, 1, 1,
0.197574, -0.9641571, 1.456423, 0, 0.4705882, 1, 1,
0.2022429, 0.5458781, 0.3366221, 0, 0.4666667, 1, 1,
0.203458, 0.6190383, 0.7709907, 0, 0.4588235, 1, 1,
0.2038112, -0.3955, 2.345111, 0, 0.454902, 1, 1,
0.2040916, 0.512119, 0.7170004, 0, 0.4470588, 1, 1,
0.2057054, 0.08823241, 0.7298995, 0, 0.4431373, 1, 1,
0.2077194, -0.3381296, 3.358605, 0, 0.4352941, 1, 1,
0.2089441, -0.8837798, 2.294008, 0, 0.4313726, 1, 1,
0.2101523, 0.434952, 0.08593558, 0, 0.4235294, 1, 1,
0.2145994, -1.377847, 2.683448, 0, 0.4196078, 1, 1,
0.2154999, 1.481132, -0.2253544, 0, 0.4117647, 1, 1,
0.2182257, -0.2845213, 2.962641, 0, 0.4078431, 1, 1,
0.2306548, -1.066848, 3.757522, 0, 0.4, 1, 1,
0.2311768, 0.1977555, 1.363482, 0, 0.3921569, 1, 1,
0.2376348, 0.2038878, 1.145771, 0, 0.3882353, 1, 1,
0.2394411, -0.6126855, 0.642704, 0, 0.3803922, 1, 1,
0.2412586, 0.3805202, 0.4647049, 0, 0.3764706, 1, 1,
0.242447, 0.6619714, 0.8233473, 0, 0.3686275, 1, 1,
0.2455824, 0.02037549, 1.534876, 0, 0.3647059, 1, 1,
0.2479385, -0.6019742, 4.56125, 0, 0.3568628, 1, 1,
0.2493912, 2.065802, -0.5694007, 0, 0.3529412, 1, 1,
0.2507962, -2.404073, 4.110256, 0, 0.345098, 1, 1,
0.2509441, -2.306474, 4.712372, 0, 0.3411765, 1, 1,
0.2529358, -0.426372, 3.780533, 0, 0.3333333, 1, 1,
0.2541601, -2.06436, 1.40313, 0, 0.3294118, 1, 1,
0.2598255, -0.08557822, 0.9562256, 0, 0.3215686, 1, 1,
0.2654134, 0.7606578, 0.4034469, 0, 0.3176471, 1, 1,
0.272141, -0.9416984, 2.410806, 0, 0.3098039, 1, 1,
0.2761857, -0.6280401, 2.831994, 0, 0.3058824, 1, 1,
0.276409, -0.5900879, 2.049311, 0, 0.2980392, 1, 1,
0.2793283, 1.235417, 0.4379853, 0, 0.2901961, 1, 1,
0.2858897, -0.1903706, 1.037973, 0, 0.2862745, 1, 1,
0.2913318, 0.5864123, -0.03120805, 0, 0.2784314, 1, 1,
0.294121, -0.2620262, 1.044862, 0, 0.2745098, 1, 1,
0.2961185, -0.6312038, 3.174941, 0, 0.2666667, 1, 1,
0.2969064, 1.159645, -0.2598917, 0, 0.2627451, 1, 1,
0.2975064, 0.9524579, -0.4347857, 0, 0.254902, 1, 1,
0.2983338, 0.3355384, -0.1004593, 0, 0.2509804, 1, 1,
0.2991247, -0.8203528, 1.802319, 0, 0.2431373, 1, 1,
0.300375, -0.4230984, 3.464823, 0, 0.2392157, 1, 1,
0.3016942, -1.243403, 4.32722, 0, 0.2313726, 1, 1,
0.3061894, -0.08848377, 3.604164, 0, 0.227451, 1, 1,
0.3068602, -1.239641, 4.656185, 0, 0.2196078, 1, 1,
0.3084873, -1.69453, 2.561701, 0, 0.2156863, 1, 1,
0.308726, 0.2324527, 0.5722328, 0, 0.2078431, 1, 1,
0.3107118, -0.9230293, 1.606646, 0, 0.2039216, 1, 1,
0.3159377, -0.9989008, 1.977064, 0, 0.1960784, 1, 1,
0.3187276, -0.5224431, 1.424728, 0, 0.1882353, 1, 1,
0.3283986, 0.7756085, 0.3675381, 0, 0.1843137, 1, 1,
0.3325967, 0.4666679, 2.01554, 0, 0.1764706, 1, 1,
0.3332646, 0.441023, 0.4123738, 0, 0.172549, 1, 1,
0.3361295, -0.5725189, 2.876962, 0, 0.1647059, 1, 1,
0.3370515, -1.014671, 1.860828, 0, 0.1607843, 1, 1,
0.3391427, -2.302289, 4.938451, 0, 0.1529412, 1, 1,
0.3425379, -0.7549809, 2.719141, 0, 0.1490196, 1, 1,
0.3468699, -0.1090254, 2.362283, 0, 0.1411765, 1, 1,
0.3529838, -1.49058, 1.991927, 0, 0.1372549, 1, 1,
0.3614601, 0.47731, 0.2902949, 0, 0.1294118, 1, 1,
0.3614692, -2.198965, 4.309945, 0, 0.1254902, 1, 1,
0.3629112, -0.1096863, 2.278767, 0, 0.1176471, 1, 1,
0.3633563, -0.6523944, 0.9143484, 0, 0.1137255, 1, 1,
0.3657742, -0.0898518, 0.7882586, 0, 0.1058824, 1, 1,
0.3658605, 1.6121, 1.897059, 0, 0.09803922, 1, 1,
0.3708915, 0.446465, 1.575996, 0, 0.09411765, 1, 1,
0.371996, 1.285387, -0.2933834, 0, 0.08627451, 1, 1,
0.3737546, -0.2649346, 3.488566, 0, 0.08235294, 1, 1,
0.3758707, -1.324738, 2.534391, 0, 0.07450981, 1, 1,
0.3800412, -0.9841747, 1.884678, 0, 0.07058824, 1, 1,
0.3844658, -1.173077, 1.782016, 0, 0.0627451, 1, 1,
0.3870152, -1.193771, 4.542847, 0, 0.05882353, 1, 1,
0.3871908, 0.3102014, 1.722932, 0, 0.05098039, 1, 1,
0.3872289, -1.054286, 0.7211525, 0, 0.04705882, 1, 1,
0.3884325, -0.5260878, 1.160701, 0, 0.03921569, 1, 1,
0.3920524, -0.8601705, 3.440006, 0, 0.03529412, 1, 1,
0.3944285, -1.061062, 1.994488, 0, 0.02745098, 1, 1,
0.3964657, 1.934403, -0.2512632, 0, 0.02352941, 1, 1,
0.3972133, 0.6877761, 0.8203048, 0, 0.01568628, 1, 1,
0.3978597, 0.3585347, 0.8722277, 0, 0.01176471, 1, 1,
0.4055626, 0.5712612, 0.8032726, 0, 0.003921569, 1, 1,
0.407145, -1.533864, 3.47425, 0.003921569, 0, 1, 1,
0.4121433, -1.553989, 3.125068, 0.007843138, 0, 1, 1,
0.4156319, 1.498358, 0.1987111, 0.01568628, 0, 1, 1,
0.4189059, -0.2739652, 2.101632, 0.01960784, 0, 1, 1,
0.4213216, 0.91728, 1.554696, 0.02745098, 0, 1, 1,
0.4244848, 0.1904373, 1.671689, 0.03137255, 0, 1, 1,
0.425251, 0.07307556, 2.804948, 0.03921569, 0, 1, 1,
0.4303315, -0.4843705, 0.4155983, 0.04313726, 0, 1, 1,
0.4304513, -0.521905, 2.59027, 0.05098039, 0, 1, 1,
0.4332647, 0.2602994, 0.1247601, 0.05490196, 0, 1, 1,
0.434083, 1.206837, 2.150418, 0.0627451, 0, 1, 1,
0.4401302, 1.107802, -0.6865786, 0.06666667, 0, 1, 1,
0.4449376, 1.531045, 0.4522604, 0.07450981, 0, 1, 1,
0.4453994, 0.05376971, 0.5634862, 0.07843138, 0, 1, 1,
0.4463105, 0.5638442, 1.16386, 0.08627451, 0, 1, 1,
0.4472131, 1.490228, 0.1645398, 0.09019608, 0, 1, 1,
0.4551981, 0.525555, -0.422025, 0.09803922, 0, 1, 1,
0.4555649, 0.8004147, 2.742798, 0.1058824, 0, 1, 1,
0.4557188, -0.540993, 3.169374, 0.1098039, 0, 1, 1,
0.4564843, -0.02118447, 2.049475, 0.1176471, 0, 1, 1,
0.4569161, -0.5007363, 2.308637, 0.1215686, 0, 1, 1,
0.4653813, -0.2689276, 1.887944, 0.1294118, 0, 1, 1,
0.4766958, -0.08632106, 3.943391, 0.1333333, 0, 1, 1,
0.4818772, -0.7868955, 3.112633, 0.1411765, 0, 1, 1,
0.4833696, -1.252445, 1.533765, 0.145098, 0, 1, 1,
0.4834001, -1.631792, 1.126179, 0.1529412, 0, 1, 1,
0.4879617, 0.707078, -0.5243105, 0.1568628, 0, 1, 1,
0.4888825, 0.5245203, -0.08908343, 0.1647059, 0, 1, 1,
0.4902744, 0.520848, 0.613026, 0.1686275, 0, 1, 1,
0.494659, -0.07167526, 3.128758, 0.1764706, 0, 1, 1,
0.4969313, 0.5912085, 1.251084, 0.1803922, 0, 1, 1,
0.5005604, -0.1390852, 2.270908, 0.1882353, 0, 1, 1,
0.5016332, -0.6124372, 0.8789265, 0.1921569, 0, 1, 1,
0.5118101, -1.321717, 1.455679, 0.2, 0, 1, 1,
0.5167976, 0.8339159, 0.2858342, 0.2078431, 0, 1, 1,
0.5180386, 1.364171, -1.797011, 0.2117647, 0, 1, 1,
0.5226542, -0.005868239, 2.045944, 0.2196078, 0, 1, 1,
0.5236909, -1.541574, 4.041813, 0.2235294, 0, 1, 1,
0.5247284, 1.113465, 0.4270217, 0.2313726, 0, 1, 1,
0.542451, 0.4986311, 2.161163, 0.2352941, 0, 1, 1,
0.544593, 0.4765071, 0.7215768, 0.2431373, 0, 1, 1,
0.550051, 0.9137642, 0.8524913, 0.2470588, 0, 1, 1,
0.5506448, 0.6014335, 1.482118, 0.254902, 0, 1, 1,
0.5507163, 0.6291348, 1.574942, 0.2588235, 0, 1, 1,
0.5509015, 0.2359988, 1.337744, 0.2666667, 0, 1, 1,
0.564289, -1.225478, 2.079173, 0.2705882, 0, 1, 1,
0.5678407, 0.3047387, -0.1228821, 0.2784314, 0, 1, 1,
0.5719085, 0.1563078, 0.3504302, 0.282353, 0, 1, 1,
0.5730343, 0.1858255, 2.076259, 0.2901961, 0, 1, 1,
0.5737345, -1.453932, 3.093866, 0.2941177, 0, 1, 1,
0.5749188, 1.146838, 2.395239, 0.3019608, 0, 1, 1,
0.5783424, 0.4960029, 2.29532, 0.3098039, 0, 1, 1,
0.5810723, -0.7199469, 0.6924944, 0.3137255, 0, 1, 1,
0.5814247, -0.4389071, 2.065706, 0.3215686, 0, 1, 1,
0.5864937, -0.3354148, 2.00454, 0.3254902, 0, 1, 1,
0.5874873, -0.009704919, 0.7914595, 0.3333333, 0, 1, 1,
0.5882587, -1.945928, 1.41693, 0.3372549, 0, 1, 1,
0.6017975, -0.1075492, 2.77261, 0.345098, 0, 1, 1,
0.6018313, -1.744175, 1.994709, 0.3490196, 0, 1, 1,
0.603462, -0.2452558, 0.4896328, 0.3568628, 0, 1, 1,
0.6060489, -0.5720946, 4.311803, 0.3607843, 0, 1, 1,
0.6081064, -0.7525523, 2.800594, 0.3686275, 0, 1, 1,
0.6109563, 0.6149617, 1.317793, 0.372549, 0, 1, 1,
0.6109863, 0.3341028, 3.359088, 0.3803922, 0, 1, 1,
0.6149867, -0.9234002, 3.284261, 0.3843137, 0, 1, 1,
0.6187637, 0.3448051, -0.9818647, 0.3921569, 0, 1, 1,
0.6207945, 2.107197, 0.04759697, 0.3960784, 0, 1, 1,
0.6277193, -1.227526, 3.573742, 0.4039216, 0, 1, 1,
0.6319511, 0.9438974, 0.2537633, 0.4117647, 0, 1, 1,
0.6353603, 0.3970278, 0.6463057, 0.4156863, 0, 1, 1,
0.6399836, 1.066021, 1.687894, 0.4235294, 0, 1, 1,
0.6414584, 0.165622, 0.8644148, 0.427451, 0, 1, 1,
0.6434943, -0.8910215, 5.016796, 0.4352941, 0, 1, 1,
0.6441253, 0.910923, 0.01249149, 0.4392157, 0, 1, 1,
0.6442264, 0.0710555, 0.792069, 0.4470588, 0, 1, 1,
0.6448966, 0.6623837, 0.4746931, 0.4509804, 0, 1, 1,
0.6474255, 1.040227, 0.8273654, 0.4588235, 0, 1, 1,
0.6495755, -1.385188, 3.321031, 0.4627451, 0, 1, 1,
0.6558879, 0.5119107, 1.743804, 0.4705882, 0, 1, 1,
0.6560368, -0.1608861, 1.145612, 0.4745098, 0, 1, 1,
0.6579807, -0.912893, 0.9238503, 0.4823529, 0, 1, 1,
0.6595366, -0.3935714, 2.463655, 0.4862745, 0, 1, 1,
0.6610944, -0.3571698, 2.003959, 0.4941176, 0, 1, 1,
0.6644946, 0.5610139, 0.6808429, 0.5019608, 0, 1, 1,
0.6673946, 0.05147873, 3.082419, 0.5058824, 0, 1, 1,
0.6718754, 2.094182, 0.5085351, 0.5137255, 0, 1, 1,
0.6733717, 1.550603, -2.378682, 0.5176471, 0, 1, 1,
0.6765435, 2.039562, 0.6030419, 0.5254902, 0, 1, 1,
0.6777048, 1.341353, 0.05163771, 0.5294118, 0, 1, 1,
0.68134, -0.752669, 4.24678, 0.5372549, 0, 1, 1,
0.6816573, -0.5996601, 2.169112, 0.5411765, 0, 1, 1,
0.6860449, -0.07650775, 2.327136, 0.5490196, 0, 1, 1,
0.6879879, 0.8794158, 2.094176, 0.5529412, 0, 1, 1,
0.6882075, 1.394851, 1.078597, 0.5607843, 0, 1, 1,
0.6888843, -0.2918313, 0.95222, 0.5647059, 0, 1, 1,
0.6909782, -1.950389, 2.344341, 0.572549, 0, 1, 1,
0.6971715, 0.03142499, 0.6182112, 0.5764706, 0, 1, 1,
0.6973685, -0.5178322, 0.9107631, 0.5843138, 0, 1, 1,
0.69974, -1.012086, 3.60877, 0.5882353, 0, 1, 1,
0.7059942, 1.695243, 0.4267008, 0.5960785, 0, 1, 1,
0.708543, -0.4360332, 1.895604, 0.6039216, 0, 1, 1,
0.7095036, 0.6667315, 1.521131, 0.6078432, 0, 1, 1,
0.7149421, 1.985835, 0.218725, 0.6156863, 0, 1, 1,
0.731596, 0.5429525, -0.2078647, 0.6196079, 0, 1, 1,
0.738164, 0.5617435, 0.1290735, 0.627451, 0, 1, 1,
0.7396925, -0.2805053, 1.461422, 0.6313726, 0, 1, 1,
0.7451078, 0.6090417, 0.2245336, 0.6392157, 0, 1, 1,
0.7454999, -0.3501978, 2.013648, 0.6431373, 0, 1, 1,
0.7455149, 0.1924786, 0.9584608, 0.6509804, 0, 1, 1,
0.7507315, 0.7156876, -0.4188592, 0.654902, 0, 1, 1,
0.7517427, 0.2176971, 0.5884767, 0.6627451, 0, 1, 1,
0.7625458, 0.5703665, -1.170527, 0.6666667, 0, 1, 1,
0.765882, -0.3315925, 3.970708, 0.6745098, 0, 1, 1,
0.7668725, 0.4967234, 0.7680789, 0.6784314, 0, 1, 1,
0.7695795, -0.439602, 4.61779, 0.6862745, 0, 1, 1,
0.7755466, -0.2129503, 2.454457, 0.6901961, 0, 1, 1,
0.7856258, 1.056415, 0.8808229, 0.6980392, 0, 1, 1,
0.7878992, 2.494214, -0.3686314, 0.7058824, 0, 1, 1,
0.7890329, 0.5372671, -0.3050359, 0.7098039, 0, 1, 1,
0.7974496, 1.416878, 0.4145379, 0.7176471, 0, 1, 1,
0.7981502, 1.520522, 0.6694568, 0.7215686, 0, 1, 1,
0.7987582, -1.609552, 1.836902, 0.7294118, 0, 1, 1,
0.8023625, 1.606362, -1.354519, 0.7333333, 0, 1, 1,
0.802467, -0.3917095, 2.383012, 0.7411765, 0, 1, 1,
0.8037177, 0.3101568, 1.670921, 0.7450981, 0, 1, 1,
0.8040103, 0.1817402, 1.844638, 0.7529412, 0, 1, 1,
0.8065103, 0.4008268, 1.248522, 0.7568628, 0, 1, 1,
0.8075346, -1.378319, 3.085415, 0.7647059, 0, 1, 1,
0.8096755, -0.3707986, 2.666554, 0.7686275, 0, 1, 1,
0.8106512, -0.2386903, 2.283934, 0.7764706, 0, 1, 1,
0.8149146, 0.5554149, 1.908628, 0.7803922, 0, 1, 1,
0.8221859, 0.7948838, 1.922284, 0.7882353, 0, 1, 1,
0.8232334, -0.7375363, 2.361747, 0.7921569, 0, 1, 1,
0.8255211, -0.8520082, 4.034276, 0.8, 0, 1, 1,
0.8274311, 0.5792807, -0.8233032, 0.8078431, 0, 1, 1,
0.8307266, 0.6142552, 1.169813, 0.8117647, 0, 1, 1,
0.8349684, 1.639299, 0.241785, 0.8196079, 0, 1, 1,
0.8448442, 1.164146, 2.156861, 0.8235294, 0, 1, 1,
0.8448575, -1.163218, 1.030937, 0.8313726, 0, 1, 1,
0.8451576, 0.1176837, 1.697446, 0.8352941, 0, 1, 1,
0.8500496, 0.3048749, 0.8223011, 0.8431373, 0, 1, 1,
0.8551054, 0.8754672, 1.78001, 0.8470588, 0, 1, 1,
0.8639362, -0.6567886, 3.120298, 0.854902, 0, 1, 1,
0.8650233, 0.193865, 2.38736, 0.8588235, 0, 1, 1,
0.8679643, 0.231913, 1.57642, 0.8666667, 0, 1, 1,
0.8765495, 0.1507797, 2.946915, 0.8705882, 0, 1, 1,
0.8825359, 0.7902653, -0.7909555, 0.8784314, 0, 1, 1,
0.8829842, 1.790508, -1.518576, 0.8823529, 0, 1, 1,
0.8847048, -0.774726, 0.4390016, 0.8901961, 0, 1, 1,
0.8884486, 1.186418, 0.7390242, 0.8941177, 0, 1, 1,
0.8894776, -0.3519906, 0.3273946, 0.9019608, 0, 1, 1,
0.9050916, -1.077337, 0.9879709, 0.9098039, 0, 1, 1,
0.9079994, 0.2371859, 0.2716652, 0.9137255, 0, 1, 1,
0.9170166, 0.9087641, 2.820641, 0.9215686, 0, 1, 1,
0.9170383, -0.7837657, 3.416681, 0.9254902, 0, 1, 1,
0.9215328, 0.4579707, 0.05864564, 0.9333333, 0, 1, 1,
0.9217952, 1.301362, 0.6828752, 0.9372549, 0, 1, 1,
0.9334009, 2.29074, 1.304642, 0.945098, 0, 1, 1,
0.9354061, 0.8793775, 3.661081, 0.9490196, 0, 1, 1,
0.9368875, 0.4208842, 1.731973, 0.9568627, 0, 1, 1,
0.9473991, -0.9286247, 1.715456, 0.9607843, 0, 1, 1,
0.9489072, 1.795376, -0.4640498, 0.9686275, 0, 1, 1,
0.9530905, 1.502825, 0.4888495, 0.972549, 0, 1, 1,
0.9653721, 0.2111723, 2.259603, 0.9803922, 0, 1, 1,
0.9664911, 0.5315069, 1.512333, 0.9843137, 0, 1, 1,
0.9677138, 0.787055, 0.6337138, 0.9921569, 0, 1, 1,
0.9690232, 1.052578, 0.3922886, 0.9960784, 0, 1, 1,
0.9714414, -0.487625, 1.23381, 1, 0, 0.9960784, 1,
0.9745631, 1.593681, 2.810792, 1, 0, 0.9882353, 1,
0.978619, 2.384757, 0.02808641, 1, 0, 0.9843137, 1,
0.9787499, 0.05234571, 0.2738929, 1, 0, 0.9764706, 1,
0.9851396, -0.3994721, 0.9201061, 1, 0, 0.972549, 1,
0.9860735, 1.544456, 1.091199, 1, 0, 0.9647059, 1,
0.9885126, -1.834315, 2.951661, 1, 0, 0.9607843, 1,
0.9895305, -0.771787, 1.582113, 1, 0, 0.9529412, 1,
1.003459, 1.297207, 0.9932052, 1, 0, 0.9490196, 1,
1.010879, -0.1456646, 3.107318, 1, 0, 0.9411765, 1,
1.012405, -0.3169191, 1.301008, 1, 0, 0.9372549, 1,
1.016753, -1.248613, 0.8872836, 1, 0, 0.9294118, 1,
1.020537, 1.249576, 0.7612865, 1, 0, 0.9254902, 1,
1.022195, 1.524754, 1.262055, 1, 0, 0.9176471, 1,
1.031523, 0.4026287, 1.938784, 1, 0, 0.9137255, 1,
1.032182, -1.504725, 3.274319, 1, 0, 0.9058824, 1,
1.03607, -0.1874449, 1.624634, 1, 0, 0.9019608, 1,
1.038642, -1.262036, 1.973269, 1, 0, 0.8941177, 1,
1.047289, -0.5903172, 0.9217103, 1, 0, 0.8862745, 1,
1.051198, 0.2264537, 0.8643565, 1, 0, 0.8823529, 1,
1.051943, -0.4261515, 1.790252, 1, 0, 0.8745098, 1,
1.054345, 1.120173, 0.8961801, 1, 0, 0.8705882, 1,
1.054876, -0.9127135, 5.313154, 1, 0, 0.8627451, 1,
1.056622, -1.564081, 3.263922, 1, 0, 0.8588235, 1,
1.061908, -1.457362, 2.657522, 1, 0, 0.8509804, 1,
1.089226, 0.3150329, 2.794802, 1, 0, 0.8470588, 1,
1.093653, 0.8124769, -0.3015384, 1, 0, 0.8392157, 1,
1.098268, -0.5824953, 1.61934, 1, 0, 0.8352941, 1,
1.100822, -0.009615186, 3.491014, 1, 0, 0.827451, 1,
1.112678, 0.9520419, 2.583143, 1, 0, 0.8235294, 1,
1.115785, 0.1463427, 2.292164, 1, 0, 0.8156863, 1,
1.11593, -0.02344877, 3.204716, 1, 0, 0.8117647, 1,
1.116075, -0.3014234, 1.301008, 1, 0, 0.8039216, 1,
1.117604, -0.9980686, 0.9172581, 1, 0, 0.7960784, 1,
1.118931, -0.2701485, 2.077097, 1, 0, 0.7921569, 1,
1.119907, -0.4619079, 2.418898, 1, 0, 0.7843137, 1,
1.12301, -0.7210661, 1.679621, 1, 0, 0.7803922, 1,
1.124738, 2.945679, 0.3856363, 1, 0, 0.772549, 1,
1.130084, -0.234789, 1.774986, 1, 0, 0.7686275, 1,
1.130566, -0.04995731, 0.4968586, 1, 0, 0.7607843, 1,
1.140321, -0.1984573, 2.322384, 1, 0, 0.7568628, 1,
1.141588, -0.3231886, 1.716131, 1, 0, 0.7490196, 1,
1.147557, 0.6405976, 0.9816857, 1, 0, 0.7450981, 1,
1.153906, -0.8317142, 1.872067, 1, 0, 0.7372549, 1,
1.161195, -1.329977, 2.662655, 1, 0, 0.7333333, 1,
1.162082, -0.5032253, 2.114407, 1, 0, 0.7254902, 1,
1.170723, 1.182904, 1.172502, 1, 0, 0.7215686, 1,
1.171149, 1.326509, 0.5898813, 1, 0, 0.7137255, 1,
1.174016, 0.2501802, 1.773067, 1, 0, 0.7098039, 1,
1.192405, 1.448295, 0.7780191, 1, 0, 0.7019608, 1,
1.195658, 0.5540639, 1.301616, 1, 0, 0.6941177, 1,
1.210747, -0.3785243, 2.241903, 1, 0, 0.6901961, 1,
1.216105, -2.17074, 0.466246, 1, 0, 0.682353, 1,
1.232018, -0.3322357, 2.691671, 1, 0, 0.6784314, 1,
1.237813, -1.188774, 0.5333929, 1, 0, 0.6705883, 1,
1.242349, -1.217732, 1.751419, 1, 0, 0.6666667, 1,
1.245168, 1.135773, -0.6417885, 1, 0, 0.6588235, 1,
1.247699, -1.328036, 4.019969, 1, 0, 0.654902, 1,
1.254543, -0.8241455, 1.832246, 1, 0, 0.6470588, 1,
1.264849, -0.2738985, 1.738444, 1, 0, 0.6431373, 1,
1.269073, -0.67649, -0.6273965, 1, 0, 0.6352941, 1,
1.270675, 1.192094, 1.054135, 1, 0, 0.6313726, 1,
1.272938, -1.394815, 1.780385, 1, 0, 0.6235294, 1,
1.295476, 1.73781, 2.52181, 1, 0, 0.6196079, 1,
1.296664, 1.102482, 0.4993088, 1, 0, 0.6117647, 1,
1.296845, -0.7450943, 2.593741, 1, 0, 0.6078432, 1,
1.313544, -0.954406, 1.775559, 1, 0, 0.6, 1,
1.327083, -0.6429325, 1.952465, 1, 0, 0.5921569, 1,
1.327744, 1.225406, 0.1648479, 1, 0, 0.5882353, 1,
1.331518, 0.6043206, 1.70063, 1, 0, 0.5803922, 1,
1.33579, -0.3144068, 1.390954, 1, 0, 0.5764706, 1,
1.336235, -0.7246169, 2.2988, 1, 0, 0.5686275, 1,
1.344798, 0.9073039, 1.483551, 1, 0, 0.5647059, 1,
1.360549, -1.476745, 2.891664, 1, 0, 0.5568628, 1,
1.366292, -1.499556, 2.06332, 1, 0, 0.5529412, 1,
1.366709, 0.1469738, 0.205383, 1, 0, 0.5450981, 1,
1.369361, 0.3760308, 0.0945248, 1, 0, 0.5411765, 1,
1.374603, 1.380802, 0.3316616, 1, 0, 0.5333334, 1,
1.38009, -0.5705038, 0.8056382, 1, 0, 0.5294118, 1,
1.384752, -0.5051888, 3.264468, 1, 0, 0.5215687, 1,
1.39987, 1.754077, 0.7911823, 1, 0, 0.5176471, 1,
1.407633, -0.07802822, 2.779041, 1, 0, 0.509804, 1,
1.407797, -0.9024097, 3.00459, 1, 0, 0.5058824, 1,
1.409158, -1.000651, 1.996019, 1, 0, 0.4980392, 1,
1.416245, 0.6382623, 2.987967, 1, 0, 0.4901961, 1,
1.433584, 0.5586016, 1.576402, 1, 0, 0.4862745, 1,
1.445486, -0.5851635, 1.278673, 1, 0, 0.4784314, 1,
1.452864, -0.6667361, 2.176158, 1, 0, 0.4745098, 1,
1.455098, 0.5011049, -0.9303836, 1, 0, 0.4666667, 1,
1.456809, -0.04799683, 1.275329, 1, 0, 0.4627451, 1,
1.464489, 1.325836, 1.555336, 1, 0, 0.454902, 1,
1.468078, -0.4380557, 2.150166, 1, 0, 0.4509804, 1,
1.489329, 0.3087167, 1.565875, 1, 0, 0.4431373, 1,
1.490231, 0.4548311, 2.788319, 1, 0, 0.4392157, 1,
1.491105, -0.0244352, 0.2890771, 1, 0, 0.4313726, 1,
1.504051, -0.3138089, 2.1989, 1, 0, 0.427451, 1,
1.511808, 1.161222, 1.168039, 1, 0, 0.4196078, 1,
1.515234, 0.09549794, 2.36456, 1, 0, 0.4156863, 1,
1.515254, 0.2997241, 0.6969677, 1, 0, 0.4078431, 1,
1.516344, 1.060146, -0.3735073, 1, 0, 0.4039216, 1,
1.518454, -1.040682, 3.197718, 1, 0, 0.3960784, 1,
1.519796, 0.8324409, 2.190822, 1, 0, 0.3882353, 1,
1.523475, 0.8965934, 3.028425, 1, 0, 0.3843137, 1,
1.535192, -0.6168976, 2.6947, 1, 0, 0.3764706, 1,
1.545996, -0.290278, 3.671311, 1, 0, 0.372549, 1,
1.548969, -0.3245152, 0.8875193, 1, 0, 0.3647059, 1,
1.554746, 1.262216, 0.4317913, 1, 0, 0.3607843, 1,
1.562984, 1.978085, 0.9195779, 1, 0, 0.3529412, 1,
1.564474, -0.1413207, 0.8940325, 1, 0, 0.3490196, 1,
1.56729, 0.4443812, 0.3025425, 1, 0, 0.3411765, 1,
1.582477, 0.2138489, 0.1767021, 1, 0, 0.3372549, 1,
1.583686, -0.4904838, 2.757601, 1, 0, 0.3294118, 1,
1.58569, -0.2052983, 1.417655, 1, 0, 0.3254902, 1,
1.598377, -0.5198208, 1.920308, 1, 0, 0.3176471, 1,
1.607333, 1.719143, 0.9537007, 1, 0, 0.3137255, 1,
1.665621, 0.1145091, 2.423934, 1, 0, 0.3058824, 1,
1.67255, -0.3287663, 2.187355, 1, 0, 0.2980392, 1,
1.673605, -1.707217, 2.910774, 1, 0, 0.2941177, 1,
1.677196, 0.7373161, 1.254541, 1, 0, 0.2862745, 1,
1.680376, -0.5504489, 2.052375, 1, 0, 0.282353, 1,
1.68502, 1.952772, -1.916577, 1, 0, 0.2745098, 1,
1.687201, -0.04385357, 1.505734, 1, 0, 0.2705882, 1,
1.688132, -1.064517, 1.016276, 1, 0, 0.2627451, 1,
1.695222, -0.158204, 1.450065, 1, 0, 0.2588235, 1,
1.716297, 0.1672503, -0.08625486, 1, 0, 0.2509804, 1,
1.755159, 0.7105233, -0.2454491, 1, 0, 0.2470588, 1,
1.755173, -1.126767, -0.5710185, 1, 0, 0.2392157, 1,
1.762303, -0.3771592, 0.3675781, 1, 0, 0.2352941, 1,
1.769845, 0.3826274, 0.5189544, 1, 0, 0.227451, 1,
1.783382, -1.081537, 1.686331, 1, 0, 0.2235294, 1,
1.797074, 0.7650625, 1.083159, 1, 0, 0.2156863, 1,
1.799964, -0.3728344, 0.7898428, 1, 0, 0.2117647, 1,
1.802049, 0.2085108, 1.763721, 1, 0, 0.2039216, 1,
1.837504, 2.731379, -0.1655308, 1, 0, 0.1960784, 1,
1.855582, -1.524927, 2.210207, 1, 0, 0.1921569, 1,
1.865512, 0.813197, 0.03871988, 1, 0, 0.1843137, 1,
1.877181, 0.02096917, 1.135163, 1, 0, 0.1803922, 1,
1.919822, -0.1863701, 2.947251, 1, 0, 0.172549, 1,
1.929114, 1.201269, 1.540317, 1, 0, 0.1686275, 1,
1.930271, -1.321543, 1.494582, 1, 0, 0.1607843, 1,
1.935233, -0.7856168, 0.657613, 1, 0, 0.1568628, 1,
1.943259, -0.4463912, 0.4600529, 1, 0, 0.1490196, 1,
1.943274, -0.0732473, 2.815972, 1, 0, 0.145098, 1,
2.003448, -1.00385, 0.702291, 1, 0, 0.1372549, 1,
2.003716, 0.01575029, 3.040179, 1, 0, 0.1333333, 1,
2.008713, -2.427782, 2.167283, 1, 0, 0.1254902, 1,
2.008888, 0.1105531, 1.857448, 1, 0, 0.1215686, 1,
2.053797, 0.5063506, 1.882389, 1, 0, 0.1137255, 1,
2.06484, 0.1591814, 1.5062, 1, 0, 0.1098039, 1,
2.071217, 0.8418571, -0.2662792, 1, 0, 0.1019608, 1,
2.088332, -2.011267, 3.996491, 1, 0, 0.09411765, 1,
2.111202, -1.135532, 3.255596, 1, 0, 0.09019608, 1,
2.185415, 1.142649, 1.154508, 1, 0, 0.08235294, 1,
2.263715, 0.381778, 1.325326, 1, 0, 0.07843138, 1,
2.275709, 0.8065926, -0.7162734, 1, 0, 0.07058824, 1,
2.300601, 0.3080578, 2.175791, 1, 0, 0.06666667, 1,
2.322062, -1.502624, 1.278607, 1, 0, 0.05882353, 1,
2.370845, -0.2617807, 2.381216, 1, 0, 0.05490196, 1,
2.534435, 0.759056, -0.5102797, 1, 0, 0.04705882, 1,
2.5387, 0.7316059, 0.103885, 1, 0, 0.04313726, 1,
2.56089, 1.397507, 1.448749, 1, 0, 0.03529412, 1,
2.652496, 1.572497, 1.474788, 1, 0, 0.03137255, 1,
2.654291, -1.428407, 3.01942, 1, 0, 0.02352941, 1,
2.81846, -0.8819442, 2.340434, 1, 0, 0.01960784, 1,
2.869988, 0.785488, 1.033407, 1, 0, 0.01176471, 1,
2.948418, 0.2415944, 2.296708, 1, 0, 0.007843138, 1
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
-0.1383348, -3.632938, -6.831616, 0, -0.5, 0.5, 0.5,
-0.1383348, -3.632938, -6.831616, 1, -0.5, 0.5, 0.5,
-0.1383348, -3.632938, -6.831616, 1, 1.5, 0.5, 0.5,
-0.1383348, -3.632938, -6.831616, 0, 1.5, 0.5, 0.5
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
-4.271497, 0.1331023, -6.831616, 0, -0.5, 0.5, 0.5,
-4.271497, 0.1331023, -6.831616, 1, -0.5, 0.5, 0.5,
-4.271497, 0.1331023, -6.831616, 1, 1.5, 0.5, 0.5,
-4.271497, 0.1331023, -6.831616, 0, 1.5, 0.5, 0.5
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
-4.271497, -3.632938, 0.1208625, 0, -0.5, 0.5, 0.5,
-4.271497, -3.632938, 0.1208625, 1, -0.5, 0.5, 0.5,
-4.271497, -3.632938, 0.1208625, 1, 1.5, 0.5, 0.5,
-4.271497, -3.632938, 0.1208625, 0, 1.5, 0.5, 0.5
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
-3, -2.763852, -5.227198,
2, -2.763852, -5.227198,
-3, -2.763852, -5.227198,
-3, -2.9087, -5.494601,
-2, -2.763852, -5.227198,
-2, -2.9087, -5.494601,
-1, -2.763852, -5.227198,
-1, -2.9087, -5.494601,
0, -2.763852, -5.227198,
0, -2.9087, -5.494601,
1, -2.763852, -5.227198,
1, -2.9087, -5.494601,
2, -2.763852, -5.227198,
2, -2.9087, -5.494601
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
-3, -3.198395, -6.029407, 0, -0.5, 0.5, 0.5,
-3, -3.198395, -6.029407, 1, -0.5, 0.5, 0.5,
-3, -3.198395, -6.029407, 1, 1.5, 0.5, 0.5,
-3, -3.198395, -6.029407, 0, 1.5, 0.5, 0.5,
-2, -3.198395, -6.029407, 0, -0.5, 0.5, 0.5,
-2, -3.198395, -6.029407, 1, -0.5, 0.5, 0.5,
-2, -3.198395, -6.029407, 1, 1.5, 0.5, 0.5,
-2, -3.198395, -6.029407, 0, 1.5, 0.5, 0.5,
-1, -3.198395, -6.029407, 0, -0.5, 0.5, 0.5,
-1, -3.198395, -6.029407, 1, -0.5, 0.5, 0.5,
-1, -3.198395, -6.029407, 1, 1.5, 0.5, 0.5,
-1, -3.198395, -6.029407, 0, 1.5, 0.5, 0.5,
0, -3.198395, -6.029407, 0, -0.5, 0.5, 0.5,
0, -3.198395, -6.029407, 1, -0.5, 0.5, 0.5,
0, -3.198395, -6.029407, 1, 1.5, 0.5, 0.5,
0, -3.198395, -6.029407, 0, 1.5, 0.5, 0.5,
1, -3.198395, -6.029407, 0, -0.5, 0.5, 0.5,
1, -3.198395, -6.029407, 1, -0.5, 0.5, 0.5,
1, -3.198395, -6.029407, 1, 1.5, 0.5, 0.5,
1, -3.198395, -6.029407, 0, 1.5, 0.5, 0.5,
2, -3.198395, -6.029407, 0, -0.5, 0.5, 0.5,
2, -3.198395, -6.029407, 1, -0.5, 0.5, 0.5,
2, -3.198395, -6.029407, 1, 1.5, 0.5, 0.5,
2, -3.198395, -6.029407, 0, 1.5, 0.5, 0.5
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
-3.31769, -2, -5.227198,
-3.31769, 2, -5.227198,
-3.31769, -2, -5.227198,
-3.476658, -2, -5.494601,
-3.31769, -1, -5.227198,
-3.476658, -1, -5.494601,
-3.31769, 0, -5.227198,
-3.476658, 0, -5.494601,
-3.31769, 1, -5.227198,
-3.476658, 1, -5.494601,
-3.31769, 2, -5.227198,
-3.476658, 2, -5.494601
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
-3.794594, -2, -6.029407, 0, -0.5, 0.5, 0.5,
-3.794594, -2, -6.029407, 1, -0.5, 0.5, 0.5,
-3.794594, -2, -6.029407, 1, 1.5, 0.5, 0.5,
-3.794594, -2, -6.029407, 0, 1.5, 0.5, 0.5,
-3.794594, -1, -6.029407, 0, -0.5, 0.5, 0.5,
-3.794594, -1, -6.029407, 1, -0.5, 0.5, 0.5,
-3.794594, -1, -6.029407, 1, 1.5, 0.5, 0.5,
-3.794594, -1, -6.029407, 0, 1.5, 0.5, 0.5,
-3.794594, 0, -6.029407, 0, -0.5, 0.5, 0.5,
-3.794594, 0, -6.029407, 1, -0.5, 0.5, 0.5,
-3.794594, 0, -6.029407, 1, 1.5, 0.5, 0.5,
-3.794594, 0, -6.029407, 0, 1.5, 0.5, 0.5,
-3.794594, 1, -6.029407, 0, -0.5, 0.5, 0.5,
-3.794594, 1, -6.029407, 1, -0.5, 0.5, 0.5,
-3.794594, 1, -6.029407, 1, 1.5, 0.5, 0.5,
-3.794594, 1, -6.029407, 0, 1.5, 0.5, 0.5,
-3.794594, 2, -6.029407, 0, -0.5, 0.5, 0.5,
-3.794594, 2, -6.029407, 1, -0.5, 0.5, 0.5,
-3.794594, 2, -6.029407, 1, 1.5, 0.5, 0.5,
-3.794594, 2, -6.029407, 0, 1.5, 0.5, 0.5
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
-3.31769, -2.763852, -4,
-3.31769, -2.763852, 4,
-3.31769, -2.763852, -4,
-3.476658, -2.9087, -4,
-3.31769, -2.763852, -2,
-3.476658, -2.9087, -2,
-3.31769, -2.763852, 0,
-3.476658, -2.9087, 0,
-3.31769, -2.763852, 2,
-3.476658, -2.9087, 2,
-3.31769, -2.763852, 4,
-3.476658, -2.9087, 4
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
-3.794594, -3.198395, -4, 0, -0.5, 0.5, 0.5,
-3.794594, -3.198395, -4, 1, -0.5, 0.5, 0.5,
-3.794594, -3.198395, -4, 1, 1.5, 0.5, 0.5,
-3.794594, -3.198395, -4, 0, 1.5, 0.5, 0.5,
-3.794594, -3.198395, -2, 0, -0.5, 0.5, 0.5,
-3.794594, -3.198395, -2, 1, -0.5, 0.5, 0.5,
-3.794594, -3.198395, -2, 1, 1.5, 0.5, 0.5,
-3.794594, -3.198395, -2, 0, 1.5, 0.5, 0.5,
-3.794594, -3.198395, 0, 0, -0.5, 0.5, 0.5,
-3.794594, -3.198395, 0, 1, -0.5, 0.5, 0.5,
-3.794594, -3.198395, 0, 1, 1.5, 0.5, 0.5,
-3.794594, -3.198395, 0, 0, 1.5, 0.5, 0.5,
-3.794594, -3.198395, 2, 0, -0.5, 0.5, 0.5,
-3.794594, -3.198395, 2, 1, -0.5, 0.5, 0.5,
-3.794594, -3.198395, 2, 1, 1.5, 0.5, 0.5,
-3.794594, -3.198395, 2, 0, 1.5, 0.5, 0.5,
-3.794594, -3.198395, 4, 0, -0.5, 0.5, 0.5,
-3.794594, -3.198395, 4, 1, -0.5, 0.5, 0.5,
-3.794594, -3.198395, 4, 1, 1.5, 0.5, 0.5,
-3.794594, -3.198395, 4, 0, 1.5, 0.5, 0.5
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
-3.31769, -2.763852, -5.227198,
-3.31769, 3.030056, -5.227198,
-3.31769, -2.763852, 5.468923,
-3.31769, 3.030056, 5.468923,
-3.31769, -2.763852, -5.227198,
-3.31769, -2.763852, 5.468923,
-3.31769, 3.030056, -5.227198,
-3.31769, 3.030056, 5.468923,
-3.31769, -2.763852, -5.227198,
3.041021, -2.763852, -5.227198,
-3.31769, -2.763852, 5.468923,
3.041021, -2.763852, 5.468923,
-3.31769, 3.030056, -5.227198,
3.041021, 3.030056, -5.227198,
-3.31769, 3.030056, 5.468923,
3.041021, 3.030056, 5.468923,
3.041021, -2.763852, -5.227198,
3.041021, 3.030056, -5.227198,
3.041021, -2.763852, 5.468923,
3.041021, 3.030056, 5.468923,
3.041021, -2.763852, -5.227198,
3.041021, -2.763852, 5.468923,
3.041021, 3.030056, -5.227198,
3.041021, 3.030056, 5.468923
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
var radius = 7.329544;
var distance = 32.60997;
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
mvMatrix.translate( 0.1383348, -0.1331023, -0.1208625 );
mvMatrix.scale( 1.246298, 1.367789, 0.7409084 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.60997);
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
uniconazole<-read.table("uniconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-uniconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'uniconazole' not found
```

```r
y<-uniconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'uniconazole' not found
```

```r
z<-uniconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'uniconazole' not found
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
-3.225088, -0.3979373, -1.333791, 0, 0, 1, 1, 1,
-3.090381, 1.852938, -1.840983, 1, 0, 0, 1, 1,
-3.037457, -0.2967395, -1.722871, 1, 0, 0, 1, 1,
-2.938339, 0.7818092, -0.1917657, 1, 0, 0, 1, 1,
-2.870259, -0.7120683, -0.9234806, 1, 0, 0, 1, 1,
-2.812274, -1.046816, -1.70503, 1, 0, 0, 1, 1,
-2.785793, 0.6506853, -2.701887, 0, 0, 0, 1, 1,
-2.772149, 2.034305, -2.094121, 0, 0, 0, 1, 1,
-2.746422, -0.5021243, -3.196737, 0, 0, 0, 1, 1,
-2.69663, 0.05311943, -2.207985, 0, 0, 0, 1, 1,
-2.543595, 0.1333079, -0.3682239, 0, 0, 0, 1, 1,
-2.459889, -1.448736, -1.541221, 0, 0, 0, 1, 1,
-2.394707, 0.3211207, -2.43157, 0, 0, 0, 1, 1,
-2.382231, 0.05284326, -0.6961815, 1, 1, 1, 1, 1,
-2.3451, 0.7089885, -1.767068, 1, 1, 1, 1, 1,
-2.316773, -0.7111782, -1.819717, 1, 1, 1, 1, 1,
-2.27633, 0.6172514, -0.1056958, 1, 1, 1, 1, 1,
-2.273018, -0.6091703, -1.25108, 1, 1, 1, 1, 1,
-2.258978, 0.1121402, -0.3947852, 1, 1, 1, 1, 1,
-2.244062, -0.08967697, -1.164825, 1, 1, 1, 1, 1,
-2.231906, -0.04340992, 0.8905335, 1, 1, 1, 1, 1,
-2.228314, 0.2554308, -1.880321, 1, 1, 1, 1, 1,
-2.19094, -0.3825405, -0.8679629, 1, 1, 1, 1, 1,
-2.096486, -0.5676202, -2.917698, 1, 1, 1, 1, 1,
-2.090169, 1.220634, -2.626456, 1, 1, 1, 1, 1,
-2.064214, 0.04174706, -2.561568, 1, 1, 1, 1, 1,
-2.057571, 1.884099, -3.633959, 1, 1, 1, 1, 1,
-2.049536, -1.447734, -0.842347, 1, 1, 1, 1, 1,
-2.029259, 1.222954, 0.2661754, 0, 0, 1, 1, 1,
-2.013963, -0.4962803, -3.185153, 1, 0, 0, 1, 1,
-2.003496, 0.986192, 0.5277966, 1, 0, 0, 1, 1,
-1.968277, -0.5288522, -2.230656, 1, 0, 0, 1, 1,
-1.921593, -0.3840443, -3.198737, 1, 0, 0, 1, 1,
-1.904849, 0.1944021, -4.189754, 1, 0, 0, 1, 1,
-1.876945, 1.070806, -2.270463, 0, 0, 0, 1, 1,
-1.872097, 0.1476116, -2.359781, 0, 0, 0, 1, 1,
-1.87005, 0.2380844, 0.007541924, 0, 0, 0, 1, 1,
-1.85361, 0.3900531, 1.52466, 0, 0, 0, 1, 1,
-1.848576, 0.1950294, -1.303546, 0, 0, 0, 1, 1,
-1.840604, -0.8675742, -2.629566, 0, 0, 0, 1, 1,
-1.837982, -1.496304, -2.136131, 0, 0, 0, 1, 1,
-1.820603, -0.3819258, -1.149454, 1, 1, 1, 1, 1,
-1.801995, -0.5629739, -2.339425, 1, 1, 1, 1, 1,
-1.796133, 0.9792153, -0.06364334, 1, 1, 1, 1, 1,
-1.775458, 0.4135119, -2.103265, 1, 1, 1, 1, 1,
-1.775185, -0.3350535, -1.251175, 1, 1, 1, 1, 1,
-1.725051, -0.04011349, -1.18161, 1, 1, 1, 1, 1,
-1.723763, -0.976817, -2.021123, 1, 1, 1, 1, 1,
-1.704655, 0.925484, -1.967726, 1, 1, 1, 1, 1,
-1.70414, 2.234827, 0.8312621, 1, 1, 1, 1, 1,
-1.696217, -0.8201349, -3.368878, 1, 1, 1, 1, 1,
-1.6899, -0.4950124, -1.100456, 1, 1, 1, 1, 1,
-1.687195, -0.6772618, -0.481142, 1, 1, 1, 1, 1,
-1.682155, 0.3618446, -1.383062, 1, 1, 1, 1, 1,
-1.664378, -0.5504984, -0.719101, 1, 1, 1, 1, 1,
-1.644638, 0.009369365, -2.299549, 1, 1, 1, 1, 1,
-1.631537, -1.052508, -2.39956, 0, 0, 1, 1, 1,
-1.617075, -0.6379316, -0.004703636, 1, 0, 0, 1, 1,
-1.612766, 0.8714766, -0.1258019, 1, 0, 0, 1, 1,
-1.608399, 0.6114289, -1.342752, 1, 0, 0, 1, 1,
-1.606274, 1.136255, -2.098845, 1, 0, 0, 1, 1,
-1.590435, 0.1036875, -1.812531, 1, 0, 0, 1, 1,
-1.580092, 0.8221395, -2.097109, 0, 0, 0, 1, 1,
-1.564852, -2.484989, -2.265961, 0, 0, 0, 1, 1,
-1.558776, 0.2186312, -1.136305, 0, 0, 0, 1, 1,
-1.545425, -1.180718, -1.971076, 0, 0, 0, 1, 1,
-1.54175, -0.2891455, -1.942875, 0, 0, 0, 1, 1,
-1.539192, -0.344247, 0.5251441, 0, 0, 0, 1, 1,
-1.530753, -0.7176444, -2.653666, 0, 0, 0, 1, 1,
-1.529776, 0.2810972, -1.751098, 1, 1, 1, 1, 1,
-1.517633, 1.406637, -0.9701289, 1, 1, 1, 1, 1,
-1.514681, 0.3898083, -1.132266, 1, 1, 1, 1, 1,
-1.5065, -0.737924, -3.721071, 1, 1, 1, 1, 1,
-1.506195, -0.3423719, -0.2034189, 1, 1, 1, 1, 1,
-1.492709, -0.9092412, -3.549049, 1, 1, 1, 1, 1,
-1.487703, 1.913526, -0.7435755, 1, 1, 1, 1, 1,
-1.485286, -1.729782, -3.981608, 1, 1, 1, 1, 1,
-1.467956, -0.6429994, -1.962481, 1, 1, 1, 1, 1,
-1.456234, -1.263321, -1.672377, 1, 1, 1, 1, 1,
-1.452834, -0.8329578, -2.879465, 1, 1, 1, 1, 1,
-1.449217, 0.08705951, -0.1113526, 1, 1, 1, 1, 1,
-1.444827, -0.331485, -2.033541, 1, 1, 1, 1, 1,
-1.444618, 0.3785768, -1.6309, 1, 1, 1, 1, 1,
-1.439053, 2.24248, 0.1988944, 1, 1, 1, 1, 1,
-1.436198, 1.169085, -0.4117315, 0, 0, 1, 1, 1,
-1.426636, -0.5937045, -1.870196, 1, 0, 0, 1, 1,
-1.42371, -0.8706807, -2.865341, 1, 0, 0, 1, 1,
-1.421061, 0.6601271, -2.381569, 1, 0, 0, 1, 1,
-1.419796, -0.421083, -2.115029, 1, 0, 0, 1, 1,
-1.415896, -1.799406, -3.721515, 1, 0, 0, 1, 1,
-1.409058, -0.4775571, -3.026406, 0, 0, 0, 1, 1,
-1.406847, 1.171415, -1.594477, 0, 0, 0, 1, 1,
-1.401801, 0.2055082, -0.9069269, 0, 0, 0, 1, 1,
-1.401301, 0.9079396, -1.647921, 0, 0, 0, 1, 1,
-1.397607, 1.304042, 0.7721349, 0, 0, 0, 1, 1,
-1.389658, 1.152037, -0.14637, 0, 0, 0, 1, 1,
-1.389624, 1.4089, -0.6046693, 0, 0, 0, 1, 1,
-1.388316, 0.4657871, -2.312015, 1, 1, 1, 1, 1,
-1.385862, 1.878567, -2.094565, 1, 1, 1, 1, 1,
-1.385312, 1.387115, 0.8405437, 1, 1, 1, 1, 1,
-1.37523, -0.5146682, -3.096844, 1, 1, 1, 1, 1,
-1.371635, 0.8525954, -1.302973, 1, 1, 1, 1, 1,
-1.361186, 2.507735, 1.452983, 1, 1, 1, 1, 1,
-1.356741, -0.502088, -1.120023, 1, 1, 1, 1, 1,
-1.355129, -1.362856, -3.802775, 1, 1, 1, 1, 1,
-1.352318, 0.01799594, -1.693877, 1, 1, 1, 1, 1,
-1.344818, 0.5803101, -1.481094, 1, 1, 1, 1, 1,
-1.343489, 0.8895297, -0.3116497, 1, 1, 1, 1, 1,
-1.337448, -0.2398411, -1.503724, 1, 1, 1, 1, 1,
-1.337197, -0.3291282, -3.703921, 1, 1, 1, 1, 1,
-1.334876, -0.6474899, -0.5352514, 1, 1, 1, 1, 1,
-1.308766, 0.4787102, -0.8206871, 1, 1, 1, 1, 1,
-1.301299, -0.9276555, -2.80873, 0, 0, 1, 1, 1,
-1.294491, -0.2741934, -2.89087, 1, 0, 0, 1, 1,
-1.288209, 0.1356125, -3.026379, 1, 0, 0, 1, 1,
-1.287572, 0.4758708, -0.06859599, 1, 0, 0, 1, 1,
-1.280096, -0.08084734, -3.003006, 1, 0, 0, 1, 1,
-1.272091, -0.1331068, -2.563537, 1, 0, 0, 1, 1,
-1.258137, 0.9264627, -3.155274, 0, 0, 0, 1, 1,
-1.257886, -1.458229, -0.7499782, 0, 0, 0, 1, 1,
-1.253552, 0.6475573, -1.188959, 0, 0, 0, 1, 1,
-1.248513, -0.9351525, -2.537572, 0, 0, 0, 1, 1,
-1.245463, 2.645267, -2.019192, 0, 0, 0, 1, 1,
-1.243296, 1.038893, -2.823615, 0, 0, 0, 1, 1,
-1.240111, -0.5024277, -0.7619836, 0, 0, 0, 1, 1,
-1.2318, -0.3207399, -0.05924694, 1, 1, 1, 1, 1,
-1.22932, 0.2251676, -0.971523, 1, 1, 1, 1, 1,
-1.225067, -0.7161485, -0.1625649, 1, 1, 1, 1, 1,
-1.213212, 0.5485628, -1.533274, 1, 1, 1, 1, 1,
-1.21064, -0.03877058, -1.844339, 1, 1, 1, 1, 1,
-1.206472, 0.2672155, -1.151128, 1, 1, 1, 1, 1,
-1.196705, 0.1573148, -1.638338, 1, 1, 1, 1, 1,
-1.187927, -1.147807, -2.915117, 1, 1, 1, 1, 1,
-1.186201, 0.702668, -1.505814, 1, 1, 1, 1, 1,
-1.184884, -0.834052, -1.956841, 1, 1, 1, 1, 1,
-1.170509, -0.123958, -1.774375, 1, 1, 1, 1, 1,
-1.168093, 0.9628313, -0.6999739, 1, 1, 1, 1, 1,
-1.166381, 0.09060159, -2.030373, 1, 1, 1, 1, 1,
-1.162902, 1.14561, -2.122241, 1, 1, 1, 1, 1,
-1.162013, 0.4378918, -2.111864, 1, 1, 1, 1, 1,
-1.15502, -1.861941, -3.819527, 0, 0, 1, 1, 1,
-1.149387, 0.5928189, -0.9585907, 1, 0, 0, 1, 1,
-1.146832, -0.6927977, -3.491065, 1, 0, 0, 1, 1,
-1.144825, 1.695266, -0.08626458, 1, 0, 0, 1, 1,
-1.144101, -1.483162, -0.09775684, 1, 0, 0, 1, 1,
-1.140273, 1.549674, 0.3560256, 1, 0, 0, 1, 1,
-1.136648, -0.4561877, -0.9688908, 0, 0, 0, 1, 1,
-1.13577, 1.161065, -1.167924, 0, 0, 0, 1, 1,
-1.135554, -0.45798, -0.5442813, 0, 0, 0, 1, 1,
-1.133714, -0.7001169, -3.11099, 0, 0, 0, 1, 1,
-1.131027, 1.741373, -1.469277, 0, 0, 0, 1, 1,
-1.128487, 0.7454185, 0.3917369, 0, 0, 0, 1, 1,
-1.120573, -0.03671214, -1.027633, 0, 0, 0, 1, 1,
-1.118281, 1.255864, -1.757668, 1, 1, 1, 1, 1,
-1.116831, -1.065722, -1.300052, 1, 1, 1, 1, 1,
-1.115715, 0.4458819, -1.288394, 1, 1, 1, 1, 1,
-1.113821, -0.5200405, -3.083278, 1, 1, 1, 1, 1,
-1.109462, 0.4597658, -1.477138, 1, 1, 1, 1, 1,
-1.089019, 0.1296807, -0.04897185, 1, 1, 1, 1, 1,
-1.088126, 0.4169451, -1.511952, 1, 1, 1, 1, 1,
-1.085451, 0.8210362, -2.48785, 1, 1, 1, 1, 1,
-1.077907, 1.228062, -1.495913, 1, 1, 1, 1, 1,
-1.07451, -0.209302, 0.848399, 1, 1, 1, 1, 1,
-1.068025, -0.3390572, -2.555314, 1, 1, 1, 1, 1,
-1.05784, 0.3103232, -1.200325, 1, 1, 1, 1, 1,
-1.056155, -0.8288227, -2.399047, 1, 1, 1, 1, 1,
-1.05204, 0.1929162, -0.3224683, 1, 1, 1, 1, 1,
-1.050712, -1.60149, -3.186222, 1, 1, 1, 1, 1,
-1.044545, 1.212875, -1.373813, 0, 0, 1, 1, 1,
-1.040396, -0.3086007, -0.8193342, 1, 0, 0, 1, 1,
-1.039631, 1.26389, -1.236949, 1, 0, 0, 1, 1,
-1.038056, 0.07186566, -1.402411, 1, 0, 0, 1, 1,
-1.03631, 0.1596333, -0.4562548, 1, 0, 0, 1, 1,
-1.033792, -0.4127315, -3.198411, 1, 0, 0, 1, 1,
-1.026802, 0.4494469, -2.446632, 0, 0, 0, 1, 1,
-1.026073, 0.3421595, -1.110271, 0, 0, 0, 1, 1,
-1.024343, -0.3801062, -1.346298, 0, 0, 0, 1, 1,
-1.021976, 0.8364331, -1.898598, 0, 0, 0, 1, 1,
-1.021411, -1.297175, -0.7042707, 0, 0, 0, 1, 1,
-1.008766, -0.3776616, -1.369938, 0, 0, 0, 1, 1,
-1.000132, 0.09526582, -1.481263, 0, 0, 0, 1, 1,
-0.9963016, -0.7385507, -1.418609, 1, 1, 1, 1, 1,
-0.9950274, -0.3417928, -1.76295, 1, 1, 1, 1, 1,
-0.9908754, -1.208192, -4.17251, 1, 1, 1, 1, 1,
-0.9863156, -0.009607037, -1.111124, 1, 1, 1, 1, 1,
-0.9805229, 0.2113573, -1.243333, 1, 1, 1, 1, 1,
-0.9657971, -0.4071614, -1.507192, 1, 1, 1, 1, 1,
-0.9653651, 2.268762, -1.734353, 1, 1, 1, 1, 1,
-0.9601681, -1.476369, -3.975026, 1, 1, 1, 1, 1,
-0.95856, -1.059488, -2.325773, 1, 1, 1, 1, 1,
-0.9544134, 1.07616, -1.181006, 1, 1, 1, 1, 1,
-0.9516392, -0.7100602, -2.271185, 1, 1, 1, 1, 1,
-0.944733, -1.551234, -2.487107, 1, 1, 1, 1, 1,
-0.9434479, -0.6415545, -3.262307, 1, 1, 1, 1, 1,
-0.9410841, 0.1153001, -2.558037, 1, 1, 1, 1, 1,
-0.9372543, -0.1579447, -0.3639058, 1, 1, 1, 1, 1,
-0.9358004, -1.23751, -3.7333, 0, 0, 1, 1, 1,
-0.9326156, 1.70396, 1.005915, 1, 0, 0, 1, 1,
-0.9323751, -0.1589491, -1.047317, 1, 0, 0, 1, 1,
-0.9298937, -1.974187, -2.418737, 1, 0, 0, 1, 1,
-0.9282266, -0.1586722, -2.089418, 1, 0, 0, 1, 1,
-0.9254621, 0.4599472, -1.671159, 1, 0, 0, 1, 1,
-0.9238952, -0.9238198, -1.200738, 0, 0, 0, 1, 1,
-0.9231098, -0.7872846, -0.1047452, 0, 0, 0, 1, 1,
-0.922599, -0.1311193, -1.471002, 0, 0, 0, 1, 1,
-0.9221743, 0.8354765, -1.552935, 0, 0, 0, 1, 1,
-0.9206194, 0.904709, -1.875402, 0, 0, 0, 1, 1,
-0.919919, -1.238761, -3.077036, 0, 0, 0, 1, 1,
-0.9177454, 0.1533312, -2.194325, 0, 0, 0, 1, 1,
-0.9133055, 0.5488922, -2.788451, 1, 1, 1, 1, 1,
-0.906707, -0.3323813, -2.708073, 1, 1, 1, 1, 1,
-0.905953, -0.718668, -1.904808, 1, 1, 1, 1, 1,
-0.9049575, -0.9848276, -2.60755, 1, 1, 1, 1, 1,
-0.9000593, 0.9414872, -0.2085868, 1, 1, 1, 1, 1,
-0.8995949, -0.3493849, -2.054103, 1, 1, 1, 1, 1,
-0.8992708, -2.679475, -2.981606, 1, 1, 1, 1, 1,
-0.8890122, 0.3155799, -0.04955864, 1, 1, 1, 1, 1,
-0.8870724, -0.1200234, -0.4397518, 1, 1, 1, 1, 1,
-0.8866081, 0.02207636, -1.352258, 1, 1, 1, 1, 1,
-0.8856675, -0.6843497, -4.324382, 1, 1, 1, 1, 1,
-0.8838332, 1.664269, 0.009190468, 1, 1, 1, 1, 1,
-0.8772462, 0.2277325, -2.276318, 1, 1, 1, 1, 1,
-0.872263, -1.398259, -3.509186, 1, 1, 1, 1, 1,
-0.8596648, -0.001090852, -0.1312472, 1, 1, 1, 1, 1,
-0.8582566, 0.5043063, -1.655336, 0, 0, 1, 1, 1,
-0.8562499, 0.5281244, 0.1389479, 1, 0, 0, 1, 1,
-0.8497049, 1.071108, -0.3366664, 1, 0, 0, 1, 1,
-0.8443859, -0.1921797, -1.435429, 1, 0, 0, 1, 1,
-0.8422092, -0.7381362, -3.19678, 1, 0, 0, 1, 1,
-0.8421659, 0.2574543, -1.46983, 1, 0, 0, 1, 1,
-0.8386844, 0.4208848, 0.01575404, 0, 0, 0, 1, 1,
-0.8384477, 0.8442679, -1.175369, 0, 0, 0, 1, 1,
-0.8294076, -0.06410599, -0.8151862, 0, 0, 0, 1, 1,
-0.8276466, 0.7237129, -1.82724, 0, 0, 0, 1, 1,
-0.8183472, 0.382332, -1.22087, 0, 0, 0, 1, 1,
-0.8144031, 0.5565637, -1.294702, 0, 0, 0, 1, 1,
-0.8079345, -0.2949215, -0.7165301, 0, 0, 0, 1, 1,
-0.8019305, 2.45814, -0.8112907, 1, 1, 1, 1, 1,
-0.7976237, -1.976038, -4.7159, 1, 1, 1, 1, 1,
-0.7958055, -0.7299632, -0.03312374, 1, 1, 1, 1, 1,
-0.7921336, 1.102783, -2.113085, 1, 1, 1, 1, 1,
-0.7765134, 0.6653563, -1.530554, 1, 1, 1, 1, 1,
-0.7657439, -0.3512994, -1.588087, 1, 1, 1, 1, 1,
-0.7599638, -0.6378579, -2.885121, 1, 1, 1, 1, 1,
-0.7576751, 0.4035569, 0.04193856, 1, 1, 1, 1, 1,
-0.7569421, 1.038556, 0.6243768, 1, 1, 1, 1, 1,
-0.7561474, 0.01939378, -1.813196, 1, 1, 1, 1, 1,
-0.7542719, 0.6216979, -0.4648075, 1, 1, 1, 1, 1,
-0.7486069, 0.2464265, -3.01609, 1, 1, 1, 1, 1,
-0.7440655, 0.9818634, 0.9503435, 1, 1, 1, 1, 1,
-0.7365051, 0.872941, -0.1038005, 1, 1, 1, 1, 1,
-0.7325716, 0.6232171, -1.475663, 1, 1, 1, 1, 1,
-0.7324517, -1.069732, -2.651529, 0, 0, 1, 1, 1,
-0.7321392, 0.5763257, -0.345883, 1, 0, 0, 1, 1,
-0.7320634, 0.03406499, -0.8400287, 1, 0, 0, 1, 1,
-0.7306238, -0.6081427, -2.343849, 1, 0, 0, 1, 1,
-0.7293926, -0.1153058, -1.584053, 1, 0, 0, 1, 1,
-0.7259338, 1.0953, 0.4066999, 1, 0, 0, 1, 1,
-0.7171361, 0.3811899, -2.481969, 0, 0, 0, 1, 1,
-0.7103119, -1.032447, -3.252548, 0, 0, 0, 1, 1,
-0.7085803, 0.302384, -3.26871, 0, 0, 0, 1, 1,
-0.7085694, 0.1189908, -2.322479, 0, 0, 0, 1, 1,
-0.7069995, 0.4534691, 0.2060836, 0, 0, 0, 1, 1,
-0.7033177, 1.150282, -1.518604, 0, 0, 0, 1, 1,
-0.699805, 0.7418931, -0.5631266, 0, 0, 0, 1, 1,
-0.6962057, 1.321131, -0.2416497, 1, 1, 1, 1, 1,
-0.6942809, 2.599275, 0.6895217, 1, 1, 1, 1, 1,
-0.6936285, -0.5994031, -1.890557, 1, 1, 1, 1, 1,
-0.6922932, -0.4885098, 0.2258782, 1, 1, 1, 1, 1,
-0.6902384, -0.6645882, -1.171242, 1, 1, 1, 1, 1,
-0.6890892, 0.02843532, -2.715304, 1, 1, 1, 1, 1,
-0.6890768, 0.01779997, -3.493371, 1, 1, 1, 1, 1,
-0.6813217, -0.1324558, -0.8566415, 1, 1, 1, 1, 1,
-0.6789706, -0.124985, -2.568184, 1, 1, 1, 1, 1,
-0.67583, 0.9582536, -2.013177, 1, 1, 1, 1, 1,
-0.6663391, -0.1960834, -4.034558, 1, 1, 1, 1, 1,
-0.6637657, -0.5072206, -2.623682, 1, 1, 1, 1, 1,
-0.6633965, 0.003727135, 0.02833527, 1, 1, 1, 1, 1,
-0.6585549, -0.06239675, -1.458335, 1, 1, 1, 1, 1,
-0.6574109, 0.4701101, -1.430951, 1, 1, 1, 1, 1,
-0.6549541, 0.08530492, -0.5476339, 0, 0, 1, 1, 1,
-0.6535487, -0.5337012, -1.434939, 1, 0, 0, 1, 1,
-0.6488014, 0.2048649, 0.5821038, 1, 0, 0, 1, 1,
-0.6482637, -0.7462128, -2.859987, 1, 0, 0, 1, 1,
-0.6446703, 1.437809, -2.223981, 1, 0, 0, 1, 1,
-0.6387703, 0.4744562, -0.302451, 1, 0, 0, 1, 1,
-0.6358418, 0.7931145, 0.2754216, 0, 0, 0, 1, 1,
-0.631852, 0.8132176, 2.231667, 0, 0, 0, 1, 1,
-0.6292506, -0.9791587, -1.98353, 0, 0, 0, 1, 1,
-0.6285664, -1.296099, -1.174567, 0, 0, 0, 1, 1,
-0.6274405, -0.106388, -1.513134, 0, 0, 0, 1, 1,
-0.6244659, -0.3857965, -1.451456, 0, 0, 0, 1, 1,
-0.6242176, -1.764758, -3.600495, 0, 0, 0, 1, 1,
-0.6236114, 0.5812041, -0.9223108, 1, 1, 1, 1, 1,
-0.6229501, -1.12662, -0.4757609, 1, 1, 1, 1, 1,
-0.622519, -2.003496, -4.681904, 1, 1, 1, 1, 1,
-0.6170388, 0.9321615, -1.596317, 1, 1, 1, 1, 1,
-0.6150588, 1.148347, -1.161126, 1, 1, 1, 1, 1,
-0.610491, -0.1774584, -0.3717832, 1, 1, 1, 1, 1,
-0.6080463, -0.02052615, -2.330008, 1, 1, 1, 1, 1,
-0.6071106, -0.0456908, -1.323, 1, 1, 1, 1, 1,
-0.6061957, -0.7558237, -2.918521, 1, 1, 1, 1, 1,
-0.6057583, 1.486589, -0.2016281, 1, 1, 1, 1, 1,
-0.6029754, 0.4097598, -2.058537, 1, 1, 1, 1, 1,
-0.6028323, -1.48763, -3.133477, 1, 1, 1, 1, 1,
-0.6002504, -0.2516032, -1.488762, 1, 1, 1, 1, 1,
-0.59772, -0.5895017, -2.064178, 1, 1, 1, 1, 1,
-0.5971302, -0.6366659, -2.790764, 1, 1, 1, 1, 1,
-0.5958104, 1.507951, -0.2682267, 0, 0, 1, 1, 1,
-0.5942919, 0.3014406, -2.422001, 1, 0, 0, 1, 1,
-0.5912895, -0.3337739, -1.80566, 1, 0, 0, 1, 1,
-0.5851452, 1.351797, 0.2049088, 1, 0, 0, 1, 1,
-0.5828637, 0.4551801, 0.9893119, 1, 0, 0, 1, 1,
-0.5771404, -0.1967535, -0.5224012, 1, 0, 0, 1, 1,
-0.577031, -0.902077, -2.846943, 0, 0, 0, 1, 1,
-0.5710236, -1.377396, -4.363129, 0, 0, 0, 1, 1,
-0.5668889, 0.4767306, -0.4118071, 0, 0, 0, 1, 1,
-0.5458611, -0.1216741, -0.1547427, 0, 0, 0, 1, 1,
-0.5414537, 1.364558, -0.5689964, 0, 0, 0, 1, 1,
-0.5360209, 0.7943476, 1.091305, 0, 0, 0, 1, 1,
-0.533309, 0.3618142, -1.580019, 0, 0, 0, 1, 1,
-0.5320856, -1.661762, -2.327121, 1, 1, 1, 1, 1,
-0.5310037, -0.4662977, -2.278077, 1, 1, 1, 1, 1,
-0.5280151, 0.5399768, -1.061443, 1, 1, 1, 1, 1,
-0.5227402, 1.53218, -0.1961218, 1, 1, 1, 1, 1,
-0.5185673, 0.4602978, -0.3371614, 1, 1, 1, 1, 1,
-0.5170971, -1.859113, -3.886445, 1, 1, 1, 1, 1,
-0.5051041, -1.985987, -3.779863, 1, 1, 1, 1, 1,
-0.5025336, 0.222584, -1.686666, 1, 1, 1, 1, 1,
-0.4990155, -0.6900426, -3.04861, 1, 1, 1, 1, 1,
-0.4955949, 1.571923, 1.493754, 1, 1, 1, 1, 1,
-0.4953052, -2.075097, -1.38503, 1, 1, 1, 1, 1,
-0.4945885, 0.4932562, 0.6304225, 1, 1, 1, 1, 1,
-0.488637, 0.9519406, -1.222847, 1, 1, 1, 1, 1,
-0.4885774, -0.5992847, -2.685065, 1, 1, 1, 1, 1,
-0.482876, 1.210155, 2.192795, 1, 1, 1, 1, 1,
-0.481826, -1.405019, -4.351659, 0, 0, 1, 1, 1,
-0.480433, 0.345289, -0.6536937, 1, 0, 0, 1, 1,
-0.4795867, 1.783512, 1.47538, 1, 0, 0, 1, 1,
-0.4786451, -0.5245836, -3.281616, 1, 0, 0, 1, 1,
-0.4782422, 0.3029156, -1.620557, 1, 0, 0, 1, 1,
-0.4764699, -2.02663, -3.809415, 1, 0, 0, 1, 1,
-0.4750602, 0.8659053, 0.5163525, 0, 0, 0, 1, 1,
-0.4743744, 0.02746087, -1.75215, 0, 0, 0, 1, 1,
-0.4732201, 0.5775892, 0.004864442, 0, 0, 0, 1, 1,
-0.4705294, -0.4330405, -2.22839, 0, 0, 0, 1, 1,
-0.4696328, -1.104914, -3.188844, 0, 0, 0, 1, 1,
-0.4690872, -0.3944878, -1.096876, 0, 0, 0, 1, 1,
-0.4681848, -0.1762871, -2.856854, 0, 0, 0, 1, 1,
-0.4678815, 1.019744, 0.1532824, 1, 1, 1, 1, 1,
-0.4663117, 0.9429392, 0.01202765, 1, 1, 1, 1, 1,
-0.460126, -0.6726473, -3.056981, 1, 1, 1, 1, 1,
-0.4589334, -1.621329, -2.045933, 1, 1, 1, 1, 1,
-0.4570603, -0.6657372, -3.513179, 1, 1, 1, 1, 1,
-0.4560824, 2.217266, -0.467678, 1, 1, 1, 1, 1,
-0.4545788, -1.124896, -2.999413, 1, 1, 1, 1, 1,
-0.4508575, 0.3390245, -1.496576, 1, 1, 1, 1, 1,
-0.4490644, 1.201252, -1.485037, 1, 1, 1, 1, 1,
-0.4470724, 1.886672, 0.6463003, 1, 1, 1, 1, 1,
-0.4457861, -0.218824, -0.4020879, 1, 1, 1, 1, 1,
-0.445774, -0.03946273, -2.578971, 1, 1, 1, 1, 1,
-0.4453315, 1.873178, -0.1531419, 1, 1, 1, 1, 1,
-0.4396867, -2.041023, -0.8947386, 1, 1, 1, 1, 1,
-0.4375088, 0.1170543, -2.619855, 1, 1, 1, 1, 1,
-0.4289876, -1.173928, -2.597975, 0, 0, 1, 1, 1,
-0.4289383, 0.05061414, -1.063281, 1, 0, 0, 1, 1,
-0.4249016, -0.3609685, -2.15107, 1, 0, 0, 1, 1,
-0.4243557, 0.5822583, 0.2493808, 1, 0, 0, 1, 1,
-0.4243048, -0.5085402, -1.893002, 1, 0, 0, 1, 1,
-0.4227395, 0.480734, -0.1900365, 1, 0, 0, 1, 1,
-0.421908, -0.8287275, -2.71168, 0, 0, 0, 1, 1,
-0.4173232, -0.1139714, -2.112374, 0, 0, 0, 1, 1,
-0.4161524, 1.144019, 0.6478263, 0, 0, 0, 1, 1,
-0.408647, -0.948595, -2.893967, 0, 0, 0, 1, 1,
-0.3984385, -1.699564, -1.796021, 0, 0, 0, 1, 1,
-0.3958272, -1.242639, -2.441658, 0, 0, 0, 1, 1,
-0.391743, -0.5411336, -2.485234, 0, 0, 0, 1, 1,
-0.3892608, 0.2065509, -1.810479, 1, 1, 1, 1, 1,
-0.3890358, -0.05484576, -2.381887, 1, 1, 1, 1, 1,
-0.3884461, -1.103853, -3.897447, 1, 1, 1, 1, 1,
-0.3845019, -0.6011131, -3.879535, 1, 1, 1, 1, 1,
-0.3839155, -0.1816897, -2.882908, 1, 1, 1, 1, 1,
-0.3819666, 0.1725217, -0.6143314, 1, 1, 1, 1, 1,
-0.3800566, -0.7300862, -1.426079, 1, 1, 1, 1, 1,
-0.3796931, 0.2649203, -0.5510886, 1, 1, 1, 1, 1,
-0.379558, 0.5898238, 0.558946, 1, 1, 1, 1, 1,
-0.375448, -1.211889, -0.8257351, 1, 1, 1, 1, 1,
-0.3742847, -0.01687477, -2.035818, 1, 1, 1, 1, 1,
-0.3702, 0.01827912, -0.8797005, 1, 1, 1, 1, 1,
-0.3681773, -1.111939, -1.714717, 1, 1, 1, 1, 1,
-0.3657302, -0.3648323, -1.333722, 1, 1, 1, 1, 1,
-0.364444, 0.6398433, 0.2181358, 1, 1, 1, 1, 1,
-0.3595239, -0.423668, -2.245817, 0, 0, 1, 1, 1,
-0.3574429, 0.2317172, -0.1723738, 1, 0, 0, 1, 1,
-0.3567546, 0.3116416, -2.481956, 1, 0, 0, 1, 1,
-0.3555527, 0.5302733, -1.426188, 1, 0, 0, 1, 1,
-0.3551537, -0.2907026, -2.504795, 1, 0, 0, 1, 1,
-0.3483326, 0.6257275, -0.5165064, 1, 0, 0, 1, 1,
-0.3447288, -0.7914521, -0.9912222, 0, 0, 0, 1, 1,
-0.3417605, -0.4713381, -4.051318, 0, 0, 0, 1, 1,
-0.3400584, 0.7510814, -1.577185, 0, 0, 0, 1, 1,
-0.3357782, 0.3650814, 0.1060512, 0, 0, 0, 1, 1,
-0.3291784, 0.00749668, -1.929437, 0, 0, 0, 1, 1,
-0.3271773, 0.8684838, -1.302135, 0, 0, 0, 1, 1,
-0.3204001, -0.05950883, -2.564368, 0, 0, 0, 1, 1,
-0.3126862, -0.3985802, -2.773456, 1, 1, 1, 1, 1,
-0.3117553, -1.165796, -2.077379, 1, 1, 1, 1, 1,
-0.3083733, 0.525923, -0.8030472, 1, 1, 1, 1, 1,
-0.3080618, -0.1502926, -0.8092254, 1, 1, 1, 1, 1,
-0.3067125, 0.7033413, 0.8446776, 1, 1, 1, 1, 1,
-0.3045121, 0.4976747, -2.189715, 1, 1, 1, 1, 1,
-0.2990502, 0.4277488, 0.3215222, 1, 1, 1, 1, 1,
-0.2930977, -0.7848644, -3.307125, 1, 1, 1, 1, 1,
-0.2905026, 1.250856, -0.2753146, 1, 1, 1, 1, 1,
-0.288304, -0.8171934, -2.59155, 1, 1, 1, 1, 1,
-0.2729222, -1.251092, -2.93095, 1, 1, 1, 1, 1,
-0.2726779, 0.2428348, -0.4543562, 1, 1, 1, 1, 1,
-0.2726684, -1.332246, -3.298651, 1, 1, 1, 1, 1,
-0.2686055, -1.223358, -3.689428, 1, 1, 1, 1, 1,
-0.2675559, -1.17187, -4.159629, 1, 1, 1, 1, 1,
-0.2654126, -0.9341533, -3.944985, 0, 0, 1, 1, 1,
-0.2651728, -1.270823, -2.964965, 1, 0, 0, 1, 1,
-0.2648703, 0.6511881, 0.1661589, 1, 0, 0, 1, 1,
-0.2606388, 2.250259, 1.978759, 1, 0, 0, 1, 1,
-0.2556691, -0.1446927, -2.698898, 1, 0, 0, 1, 1,
-0.2525744, -1.690991, -1.369551, 1, 0, 0, 1, 1,
-0.2477822, 0.6676822, -1.062463, 0, 0, 0, 1, 1,
-0.2445834, -0.4387348, -2.693648, 0, 0, 0, 1, 1,
-0.2440904, 1.167917, -0.6181409, 0, 0, 0, 1, 1,
-0.2379778, 1.236373, -0.04331766, 0, 0, 0, 1, 1,
-0.2377671, 1.655529, 0.563794, 0, 0, 0, 1, 1,
-0.2327046, -0.9872432, -4.057519, 0, 0, 0, 1, 1,
-0.2250634, -0.8449765, -4.651418, 0, 0, 0, 1, 1,
-0.2242802, -0.3334326, -2.791326, 1, 1, 1, 1, 1,
-0.2239446, -0.6601222, -2.572219, 1, 1, 1, 1, 1,
-0.2194825, -0.6981685, -1.910426, 1, 1, 1, 1, 1,
-0.2191515, -0.321631, -3.239626, 1, 1, 1, 1, 1,
-0.2134268, -2.289736, -2.972802, 1, 1, 1, 1, 1,
-0.2127943, -0.1580858, -1.576517, 1, 1, 1, 1, 1,
-0.2123226, -0.3923297, -1.427801, 1, 1, 1, 1, 1,
-0.2111538, -0.5387992, -2.90618, 1, 1, 1, 1, 1,
-0.2103738, -0.07084299, -1.534952, 1, 1, 1, 1, 1,
-0.2097697, 2.195155, 0.6136713, 1, 1, 1, 1, 1,
-0.2054108, -1.353199, -2.991484, 1, 1, 1, 1, 1,
-0.1984179, -0.9664867, -1.096863, 1, 1, 1, 1, 1,
-0.1970373, 0.5213879, -0.9284663, 1, 1, 1, 1, 1,
-0.1940518, 1.817119, -0.08866585, 1, 1, 1, 1, 1,
-0.1926526, 0.01366615, -1.035354, 1, 1, 1, 1, 1,
-0.1882907, -0.7992376, -3.776071, 0, 0, 1, 1, 1,
-0.1881645, 0.555408, -0.5826959, 1, 0, 0, 1, 1,
-0.1848421, -0.9073665, -4.243124, 1, 0, 0, 1, 1,
-0.1841788, 0.1088224, -0.4011957, 1, 0, 0, 1, 1,
-0.1835184, -0.7996268, -1.372977, 1, 0, 0, 1, 1,
-0.1814264, -0.5893547, -2.020465, 1, 0, 0, 1, 1,
-0.175564, 0.6889657, -0.4626921, 0, 0, 0, 1, 1,
-0.1721545, -0.9121947, -2.382826, 0, 0, 0, 1, 1,
-0.1699507, 0.4596566, -1.14924, 0, 0, 0, 1, 1,
-0.16663, -0.1205106, -3.018415, 0, 0, 0, 1, 1,
-0.16557, -0.1936739, -4.773522, 0, 0, 0, 1, 1,
-0.1643956, -0.5464178, -3.463013, 0, 0, 0, 1, 1,
-0.1589356, -1.383361, -2.58858, 0, 0, 0, 1, 1,
-0.1575743, 1.028822, 0.710874, 1, 1, 1, 1, 1,
-0.1556937, 1.175529, -1.652382, 1, 1, 1, 1, 1,
-0.1523679, 0.4565528, -0.3207249, 1, 1, 1, 1, 1,
-0.1498697, 0.2671452, -0.7253753, 1, 1, 1, 1, 1,
-0.1355485, -0.8168863, -3.792258, 1, 1, 1, 1, 1,
-0.1355044, 0.4526013, -0.5204577, 1, 1, 1, 1, 1,
-0.1341571, 0.4421901, -0.1651652, 1, 1, 1, 1, 1,
-0.1270409, 0.1957861, -0.08865646, 1, 1, 1, 1, 1,
-0.1223906, 1.007589, 0.4763685, 1, 1, 1, 1, 1,
-0.1198432, 0.3448611, 0.9302415, 1, 1, 1, 1, 1,
-0.1183896, 1.78089, 0.2969792, 1, 1, 1, 1, 1,
-0.1171573, 0.09288578, 0.6539039, 1, 1, 1, 1, 1,
-0.1170195, -0.0214488, -2.566619, 1, 1, 1, 1, 1,
-0.1124532, 0.2309549, -2.176471, 1, 1, 1, 1, 1,
-0.1120121, -1.666386, -2.674796, 1, 1, 1, 1, 1,
-0.1118965, -0.3219073, -3.075963, 0, 0, 1, 1, 1,
-0.1084437, -0.7965577, -4.212599, 1, 0, 0, 1, 1,
-0.1070612, -0.8935004, -4.569258, 1, 0, 0, 1, 1,
-0.1056386, 0.4384764, 0.3134141, 1, 0, 0, 1, 1,
-0.1042102, 1.189722, -0.4806261, 1, 0, 0, 1, 1,
-0.1025293, 0.2672796, -0.2034679, 1, 0, 0, 1, 1,
-0.1012382, -0.395632, -2.313757, 0, 0, 0, 1, 1,
-0.1010766, 0.3369827, -0.2443373, 0, 0, 0, 1, 1,
-0.1001734, 0.3146693, -1.54971, 0, 0, 0, 1, 1,
-0.09600693, 0.1687538, 0.2593825, 0, 0, 0, 1, 1,
-0.09594453, 0.315102, -0.472768, 0, 0, 0, 1, 1,
-0.0932212, -1.406538, -2.316389, 0, 0, 0, 1, 1,
-0.09229589, 0.2485494, -0.6672818, 0, 0, 0, 1, 1,
-0.07546654, 0.09911123, -0.2808721, 1, 1, 1, 1, 1,
-0.06875034, 0.7369443, 0.8563689, 1, 1, 1, 1, 1,
-0.06667265, -0.5403192, -4.124699, 1, 1, 1, 1, 1,
-0.06338776, -1.443304, -2.961955, 1, 1, 1, 1, 1,
-0.06025562, 0.2509193, 2.057833, 1, 1, 1, 1, 1,
-0.05929189, -1.150161, -3.617889, 1, 1, 1, 1, 1,
-0.05860178, -0.6936946, -0.6764827, 1, 1, 1, 1, 1,
-0.05403212, 0.7210654, -0.4914191, 1, 1, 1, 1, 1,
-0.05237199, 1.064465, -0.07012691, 1, 1, 1, 1, 1,
-0.05082831, -0.4365897, -2.090446, 1, 1, 1, 1, 1,
-0.04983905, 0.4925233, -0.4826936, 1, 1, 1, 1, 1,
-0.04704417, -2.204722, -2.411548, 1, 1, 1, 1, 1,
-0.04465486, 0.8831725, -0.9594223, 1, 1, 1, 1, 1,
-0.03996495, 0.7312968, -1.0465, 1, 1, 1, 1, 1,
-0.03899951, 0.3700743, -0.7395361, 1, 1, 1, 1, 1,
-0.03679793, -1.546743, -5.071429, 0, 0, 1, 1, 1,
-0.03461525, 1.030509, 0.2787114, 1, 0, 0, 1, 1,
-0.03291244, -0.7481815, -3.562866, 1, 0, 0, 1, 1,
-0.02389172, 0.1944744, -1.719901, 1, 0, 0, 1, 1,
-0.0232625, -0.1794866, -2.393406, 1, 0, 0, 1, 1,
-0.02165115, -0.2858476, -0.351368, 1, 0, 0, 1, 1,
-0.01951559, -0.8947914, -2.500337, 0, 0, 0, 1, 1,
-0.01859166, 0.298945, 2.004822, 0, 0, 0, 1, 1,
-0.01664001, 0.5820772, -0.7654066, 0, 0, 0, 1, 1,
-0.01411832, -0.611146, -3.275779, 0, 0, 0, 1, 1,
-0.01069497, 0.5082978, -0.8837649, 0, 0, 0, 1, 1,
-0.009986361, -0.6562741, -3.771706, 0, 0, 0, 1, 1,
-0.009076813, -1.098261, -2.792159, 0, 0, 0, 1, 1,
-0.005936665, -0.1568618, -4.618101, 1, 1, 1, 1, 1,
0.0002552966, -0.08682059, 3.412926, 1, 1, 1, 1, 1,
0.004446644, 0.7451968, 0.327846, 1, 1, 1, 1, 1,
0.007563116, -1.107997, 2.871686, 1, 1, 1, 1, 1,
0.009041546, -0.5624869, 2.921941, 1, 1, 1, 1, 1,
0.009240949, 0.481134, -0.2721767, 1, 1, 1, 1, 1,
0.01177042, -1.237695, 2.047597, 1, 1, 1, 1, 1,
0.01657025, 2.919381, 0.6121294, 1, 1, 1, 1, 1,
0.02198882, -2.095479, 4.33815, 1, 1, 1, 1, 1,
0.02813718, -1.448416, 4.208027, 1, 1, 1, 1, 1,
0.03073224, 0.8879995, -0.355581, 1, 1, 1, 1, 1,
0.03275971, -0.004814277, 1.457872, 1, 1, 1, 1, 1,
0.03478188, 1.481931, 0.8878673, 1, 1, 1, 1, 1,
0.03683015, 1.611777, 0.2095055, 1, 1, 1, 1, 1,
0.03737155, 0.3063337, -0.8909154, 1, 1, 1, 1, 1,
0.04161629, -0.04044632, 2.398562, 0, 0, 1, 1, 1,
0.04445009, -0.4129915, 2.844131, 1, 0, 0, 1, 1,
0.04937109, -0.2804617, 4.433267, 1, 0, 0, 1, 1,
0.0502739, -1.445129, 2.521676, 1, 0, 0, 1, 1,
0.06262236, 0.9934445, -0.1941121, 1, 0, 0, 1, 1,
0.06514865, -1.004607, 2.221976, 1, 0, 0, 1, 1,
0.06547147, -1.83579, 2.505158, 0, 0, 0, 1, 1,
0.06557417, 0.5845292, -0.818927, 0, 0, 0, 1, 1,
0.06826719, 1.784544, 0.5437616, 0, 0, 0, 1, 1,
0.06852869, 0.4880722, 0.3620926, 0, 0, 0, 1, 1,
0.07158593, 0.1542784, 0.808396, 0, 0, 0, 1, 1,
0.07456835, 0.7944313, 0.1554297, 0, 0, 0, 1, 1,
0.07565963, 0.4936961, -0.1057879, 0, 0, 0, 1, 1,
0.08036406, -0.1397013, 2.385478, 1, 1, 1, 1, 1,
0.08137283, 0.3090582, 1.254158, 1, 1, 1, 1, 1,
0.0824871, -0.5965892, 2.26406, 1, 1, 1, 1, 1,
0.0830809, -1.630914, 4.693872, 1, 1, 1, 1, 1,
0.08478227, 0.3211749, -0.1884103, 1, 1, 1, 1, 1,
0.08772249, 0.6974518, -0.02742202, 1, 1, 1, 1, 1,
0.08776695, 1.20744, 1.745302, 1, 1, 1, 1, 1,
0.09024883, 0.1976327, 0.3656471, 1, 1, 1, 1, 1,
0.09106831, 0.1533234, 1.09068, 1, 1, 1, 1, 1,
0.09447004, -0.196338, 2.167613, 1, 1, 1, 1, 1,
0.09829425, 1.01797, 0.1437161, 1, 1, 1, 1, 1,
0.09907794, -1.23739, 1.725885, 1, 1, 1, 1, 1,
0.1067781, -0.608303, 3.000635, 1, 1, 1, 1, 1,
0.1164349, 1.869143, -0.3362125, 1, 1, 1, 1, 1,
0.1176674, -0.7570071, 3.663492, 1, 1, 1, 1, 1,
0.1182243, 1.151027, 1.335814, 0, 0, 1, 1, 1,
0.1238231, -0.2635291, 2.140701, 1, 0, 0, 1, 1,
0.1254176, -0.5423974, 2.839532, 1, 0, 0, 1, 1,
0.1283462, -0.4206965, 4.375224, 1, 0, 0, 1, 1,
0.1293482, -2.514283, 4.488307, 1, 0, 0, 1, 1,
0.1294454, 0.5031337, 0.0111563, 1, 0, 0, 1, 1,
0.1305907, 0.9019765, 1.208747, 0, 0, 0, 1, 1,
0.1334598, 0.8558649, -0.6434885, 0, 0, 0, 1, 1,
0.1403893, 0.8196691, 1.705439, 0, 0, 0, 1, 1,
0.1446087, -0.2389039, 4.277256, 0, 0, 0, 1, 1,
0.1449917, -0.556312, 2.272917, 0, 0, 0, 1, 1,
0.1453047, 2.030238, 0.9997916, 0, 0, 0, 1, 1,
0.1480702, -0.8581089, 4.732002, 0, 0, 0, 1, 1,
0.1481698, 0.5106611, 1.516604, 1, 1, 1, 1, 1,
0.1504167, 0.2353898, 1.814583, 1, 1, 1, 1, 1,
0.1506478, -0.249138, 1.769399, 1, 1, 1, 1, 1,
0.154704, -0.9321133, 4.323423, 1, 1, 1, 1, 1,
0.1555016, 0.08309134, 0.9542626, 1, 1, 1, 1, 1,
0.1564818, 0.6364361, 0.5372421, 1, 1, 1, 1, 1,
0.1566114, -1.713822, 2.520383, 1, 1, 1, 1, 1,
0.1601379, 0.9097403, 1.49799, 1, 1, 1, 1, 1,
0.1751244, 0.4339289, 1.007953, 1, 1, 1, 1, 1,
0.1754043, 0.463112, -1.193379, 1, 1, 1, 1, 1,
0.1764777, 2.639072, -0.4413021, 1, 1, 1, 1, 1,
0.187674, -2.428823, 2.460243, 1, 1, 1, 1, 1,
0.1903736, -1.142056, 3.152602, 1, 1, 1, 1, 1,
0.1967521, 0.6876262, 2.437209, 1, 1, 1, 1, 1,
0.1972148, -0.5437763, 4.049146, 1, 1, 1, 1, 1,
0.197574, -0.9641571, 1.456423, 0, 0, 1, 1, 1,
0.2022429, 0.5458781, 0.3366221, 1, 0, 0, 1, 1,
0.203458, 0.6190383, 0.7709907, 1, 0, 0, 1, 1,
0.2038112, -0.3955, 2.345111, 1, 0, 0, 1, 1,
0.2040916, 0.512119, 0.7170004, 1, 0, 0, 1, 1,
0.2057054, 0.08823241, 0.7298995, 1, 0, 0, 1, 1,
0.2077194, -0.3381296, 3.358605, 0, 0, 0, 1, 1,
0.2089441, -0.8837798, 2.294008, 0, 0, 0, 1, 1,
0.2101523, 0.434952, 0.08593558, 0, 0, 0, 1, 1,
0.2145994, -1.377847, 2.683448, 0, 0, 0, 1, 1,
0.2154999, 1.481132, -0.2253544, 0, 0, 0, 1, 1,
0.2182257, -0.2845213, 2.962641, 0, 0, 0, 1, 1,
0.2306548, -1.066848, 3.757522, 0, 0, 0, 1, 1,
0.2311768, 0.1977555, 1.363482, 1, 1, 1, 1, 1,
0.2376348, 0.2038878, 1.145771, 1, 1, 1, 1, 1,
0.2394411, -0.6126855, 0.642704, 1, 1, 1, 1, 1,
0.2412586, 0.3805202, 0.4647049, 1, 1, 1, 1, 1,
0.242447, 0.6619714, 0.8233473, 1, 1, 1, 1, 1,
0.2455824, 0.02037549, 1.534876, 1, 1, 1, 1, 1,
0.2479385, -0.6019742, 4.56125, 1, 1, 1, 1, 1,
0.2493912, 2.065802, -0.5694007, 1, 1, 1, 1, 1,
0.2507962, -2.404073, 4.110256, 1, 1, 1, 1, 1,
0.2509441, -2.306474, 4.712372, 1, 1, 1, 1, 1,
0.2529358, -0.426372, 3.780533, 1, 1, 1, 1, 1,
0.2541601, -2.06436, 1.40313, 1, 1, 1, 1, 1,
0.2598255, -0.08557822, 0.9562256, 1, 1, 1, 1, 1,
0.2654134, 0.7606578, 0.4034469, 1, 1, 1, 1, 1,
0.272141, -0.9416984, 2.410806, 1, 1, 1, 1, 1,
0.2761857, -0.6280401, 2.831994, 0, 0, 1, 1, 1,
0.276409, -0.5900879, 2.049311, 1, 0, 0, 1, 1,
0.2793283, 1.235417, 0.4379853, 1, 0, 0, 1, 1,
0.2858897, -0.1903706, 1.037973, 1, 0, 0, 1, 1,
0.2913318, 0.5864123, -0.03120805, 1, 0, 0, 1, 1,
0.294121, -0.2620262, 1.044862, 1, 0, 0, 1, 1,
0.2961185, -0.6312038, 3.174941, 0, 0, 0, 1, 1,
0.2969064, 1.159645, -0.2598917, 0, 0, 0, 1, 1,
0.2975064, 0.9524579, -0.4347857, 0, 0, 0, 1, 1,
0.2983338, 0.3355384, -0.1004593, 0, 0, 0, 1, 1,
0.2991247, -0.8203528, 1.802319, 0, 0, 0, 1, 1,
0.300375, -0.4230984, 3.464823, 0, 0, 0, 1, 1,
0.3016942, -1.243403, 4.32722, 0, 0, 0, 1, 1,
0.3061894, -0.08848377, 3.604164, 1, 1, 1, 1, 1,
0.3068602, -1.239641, 4.656185, 1, 1, 1, 1, 1,
0.3084873, -1.69453, 2.561701, 1, 1, 1, 1, 1,
0.308726, 0.2324527, 0.5722328, 1, 1, 1, 1, 1,
0.3107118, -0.9230293, 1.606646, 1, 1, 1, 1, 1,
0.3159377, -0.9989008, 1.977064, 1, 1, 1, 1, 1,
0.3187276, -0.5224431, 1.424728, 1, 1, 1, 1, 1,
0.3283986, 0.7756085, 0.3675381, 1, 1, 1, 1, 1,
0.3325967, 0.4666679, 2.01554, 1, 1, 1, 1, 1,
0.3332646, 0.441023, 0.4123738, 1, 1, 1, 1, 1,
0.3361295, -0.5725189, 2.876962, 1, 1, 1, 1, 1,
0.3370515, -1.014671, 1.860828, 1, 1, 1, 1, 1,
0.3391427, -2.302289, 4.938451, 1, 1, 1, 1, 1,
0.3425379, -0.7549809, 2.719141, 1, 1, 1, 1, 1,
0.3468699, -0.1090254, 2.362283, 1, 1, 1, 1, 1,
0.3529838, -1.49058, 1.991927, 0, 0, 1, 1, 1,
0.3614601, 0.47731, 0.2902949, 1, 0, 0, 1, 1,
0.3614692, -2.198965, 4.309945, 1, 0, 0, 1, 1,
0.3629112, -0.1096863, 2.278767, 1, 0, 0, 1, 1,
0.3633563, -0.6523944, 0.9143484, 1, 0, 0, 1, 1,
0.3657742, -0.0898518, 0.7882586, 1, 0, 0, 1, 1,
0.3658605, 1.6121, 1.897059, 0, 0, 0, 1, 1,
0.3708915, 0.446465, 1.575996, 0, 0, 0, 1, 1,
0.371996, 1.285387, -0.2933834, 0, 0, 0, 1, 1,
0.3737546, -0.2649346, 3.488566, 0, 0, 0, 1, 1,
0.3758707, -1.324738, 2.534391, 0, 0, 0, 1, 1,
0.3800412, -0.9841747, 1.884678, 0, 0, 0, 1, 1,
0.3844658, -1.173077, 1.782016, 0, 0, 0, 1, 1,
0.3870152, -1.193771, 4.542847, 1, 1, 1, 1, 1,
0.3871908, 0.3102014, 1.722932, 1, 1, 1, 1, 1,
0.3872289, -1.054286, 0.7211525, 1, 1, 1, 1, 1,
0.3884325, -0.5260878, 1.160701, 1, 1, 1, 1, 1,
0.3920524, -0.8601705, 3.440006, 1, 1, 1, 1, 1,
0.3944285, -1.061062, 1.994488, 1, 1, 1, 1, 1,
0.3964657, 1.934403, -0.2512632, 1, 1, 1, 1, 1,
0.3972133, 0.6877761, 0.8203048, 1, 1, 1, 1, 1,
0.3978597, 0.3585347, 0.8722277, 1, 1, 1, 1, 1,
0.4055626, 0.5712612, 0.8032726, 1, 1, 1, 1, 1,
0.407145, -1.533864, 3.47425, 1, 1, 1, 1, 1,
0.4121433, -1.553989, 3.125068, 1, 1, 1, 1, 1,
0.4156319, 1.498358, 0.1987111, 1, 1, 1, 1, 1,
0.4189059, -0.2739652, 2.101632, 1, 1, 1, 1, 1,
0.4213216, 0.91728, 1.554696, 1, 1, 1, 1, 1,
0.4244848, 0.1904373, 1.671689, 0, 0, 1, 1, 1,
0.425251, 0.07307556, 2.804948, 1, 0, 0, 1, 1,
0.4303315, -0.4843705, 0.4155983, 1, 0, 0, 1, 1,
0.4304513, -0.521905, 2.59027, 1, 0, 0, 1, 1,
0.4332647, 0.2602994, 0.1247601, 1, 0, 0, 1, 1,
0.434083, 1.206837, 2.150418, 1, 0, 0, 1, 1,
0.4401302, 1.107802, -0.6865786, 0, 0, 0, 1, 1,
0.4449376, 1.531045, 0.4522604, 0, 0, 0, 1, 1,
0.4453994, 0.05376971, 0.5634862, 0, 0, 0, 1, 1,
0.4463105, 0.5638442, 1.16386, 0, 0, 0, 1, 1,
0.4472131, 1.490228, 0.1645398, 0, 0, 0, 1, 1,
0.4551981, 0.525555, -0.422025, 0, 0, 0, 1, 1,
0.4555649, 0.8004147, 2.742798, 0, 0, 0, 1, 1,
0.4557188, -0.540993, 3.169374, 1, 1, 1, 1, 1,
0.4564843, -0.02118447, 2.049475, 1, 1, 1, 1, 1,
0.4569161, -0.5007363, 2.308637, 1, 1, 1, 1, 1,
0.4653813, -0.2689276, 1.887944, 1, 1, 1, 1, 1,
0.4766958, -0.08632106, 3.943391, 1, 1, 1, 1, 1,
0.4818772, -0.7868955, 3.112633, 1, 1, 1, 1, 1,
0.4833696, -1.252445, 1.533765, 1, 1, 1, 1, 1,
0.4834001, -1.631792, 1.126179, 1, 1, 1, 1, 1,
0.4879617, 0.707078, -0.5243105, 1, 1, 1, 1, 1,
0.4888825, 0.5245203, -0.08908343, 1, 1, 1, 1, 1,
0.4902744, 0.520848, 0.613026, 1, 1, 1, 1, 1,
0.494659, -0.07167526, 3.128758, 1, 1, 1, 1, 1,
0.4969313, 0.5912085, 1.251084, 1, 1, 1, 1, 1,
0.5005604, -0.1390852, 2.270908, 1, 1, 1, 1, 1,
0.5016332, -0.6124372, 0.8789265, 1, 1, 1, 1, 1,
0.5118101, -1.321717, 1.455679, 0, 0, 1, 1, 1,
0.5167976, 0.8339159, 0.2858342, 1, 0, 0, 1, 1,
0.5180386, 1.364171, -1.797011, 1, 0, 0, 1, 1,
0.5226542, -0.005868239, 2.045944, 1, 0, 0, 1, 1,
0.5236909, -1.541574, 4.041813, 1, 0, 0, 1, 1,
0.5247284, 1.113465, 0.4270217, 1, 0, 0, 1, 1,
0.542451, 0.4986311, 2.161163, 0, 0, 0, 1, 1,
0.544593, 0.4765071, 0.7215768, 0, 0, 0, 1, 1,
0.550051, 0.9137642, 0.8524913, 0, 0, 0, 1, 1,
0.5506448, 0.6014335, 1.482118, 0, 0, 0, 1, 1,
0.5507163, 0.6291348, 1.574942, 0, 0, 0, 1, 1,
0.5509015, 0.2359988, 1.337744, 0, 0, 0, 1, 1,
0.564289, -1.225478, 2.079173, 0, 0, 0, 1, 1,
0.5678407, 0.3047387, -0.1228821, 1, 1, 1, 1, 1,
0.5719085, 0.1563078, 0.3504302, 1, 1, 1, 1, 1,
0.5730343, 0.1858255, 2.076259, 1, 1, 1, 1, 1,
0.5737345, -1.453932, 3.093866, 1, 1, 1, 1, 1,
0.5749188, 1.146838, 2.395239, 1, 1, 1, 1, 1,
0.5783424, 0.4960029, 2.29532, 1, 1, 1, 1, 1,
0.5810723, -0.7199469, 0.6924944, 1, 1, 1, 1, 1,
0.5814247, -0.4389071, 2.065706, 1, 1, 1, 1, 1,
0.5864937, -0.3354148, 2.00454, 1, 1, 1, 1, 1,
0.5874873, -0.009704919, 0.7914595, 1, 1, 1, 1, 1,
0.5882587, -1.945928, 1.41693, 1, 1, 1, 1, 1,
0.6017975, -0.1075492, 2.77261, 1, 1, 1, 1, 1,
0.6018313, -1.744175, 1.994709, 1, 1, 1, 1, 1,
0.603462, -0.2452558, 0.4896328, 1, 1, 1, 1, 1,
0.6060489, -0.5720946, 4.311803, 1, 1, 1, 1, 1,
0.6081064, -0.7525523, 2.800594, 0, 0, 1, 1, 1,
0.6109563, 0.6149617, 1.317793, 1, 0, 0, 1, 1,
0.6109863, 0.3341028, 3.359088, 1, 0, 0, 1, 1,
0.6149867, -0.9234002, 3.284261, 1, 0, 0, 1, 1,
0.6187637, 0.3448051, -0.9818647, 1, 0, 0, 1, 1,
0.6207945, 2.107197, 0.04759697, 1, 0, 0, 1, 1,
0.6277193, -1.227526, 3.573742, 0, 0, 0, 1, 1,
0.6319511, 0.9438974, 0.2537633, 0, 0, 0, 1, 1,
0.6353603, 0.3970278, 0.6463057, 0, 0, 0, 1, 1,
0.6399836, 1.066021, 1.687894, 0, 0, 0, 1, 1,
0.6414584, 0.165622, 0.8644148, 0, 0, 0, 1, 1,
0.6434943, -0.8910215, 5.016796, 0, 0, 0, 1, 1,
0.6441253, 0.910923, 0.01249149, 0, 0, 0, 1, 1,
0.6442264, 0.0710555, 0.792069, 1, 1, 1, 1, 1,
0.6448966, 0.6623837, 0.4746931, 1, 1, 1, 1, 1,
0.6474255, 1.040227, 0.8273654, 1, 1, 1, 1, 1,
0.6495755, -1.385188, 3.321031, 1, 1, 1, 1, 1,
0.6558879, 0.5119107, 1.743804, 1, 1, 1, 1, 1,
0.6560368, -0.1608861, 1.145612, 1, 1, 1, 1, 1,
0.6579807, -0.912893, 0.9238503, 1, 1, 1, 1, 1,
0.6595366, -0.3935714, 2.463655, 1, 1, 1, 1, 1,
0.6610944, -0.3571698, 2.003959, 1, 1, 1, 1, 1,
0.6644946, 0.5610139, 0.6808429, 1, 1, 1, 1, 1,
0.6673946, 0.05147873, 3.082419, 1, 1, 1, 1, 1,
0.6718754, 2.094182, 0.5085351, 1, 1, 1, 1, 1,
0.6733717, 1.550603, -2.378682, 1, 1, 1, 1, 1,
0.6765435, 2.039562, 0.6030419, 1, 1, 1, 1, 1,
0.6777048, 1.341353, 0.05163771, 1, 1, 1, 1, 1,
0.68134, -0.752669, 4.24678, 0, 0, 1, 1, 1,
0.6816573, -0.5996601, 2.169112, 1, 0, 0, 1, 1,
0.6860449, -0.07650775, 2.327136, 1, 0, 0, 1, 1,
0.6879879, 0.8794158, 2.094176, 1, 0, 0, 1, 1,
0.6882075, 1.394851, 1.078597, 1, 0, 0, 1, 1,
0.6888843, -0.2918313, 0.95222, 1, 0, 0, 1, 1,
0.6909782, -1.950389, 2.344341, 0, 0, 0, 1, 1,
0.6971715, 0.03142499, 0.6182112, 0, 0, 0, 1, 1,
0.6973685, -0.5178322, 0.9107631, 0, 0, 0, 1, 1,
0.69974, -1.012086, 3.60877, 0, 0, 0, 1, 1,
0.7059942, 1.695243, 0.4267008, 0, 0, 0, 1, 1,
0.708543, -0.4360332, 1.895604, 0, 0, 0, 1, 1,
0.7095036, 0.6667315, 1.521131, 0, 0, 0, 1, 1,
0.7149421, 1.985835, 0.218725, 1, 1, 1, 1, 1,
0.731596, 0.5429525, -0.2078647, 1, 1, 1, 1, 1,
0.738164, 0.5617435, 0.1290735, 1, 1, 1, 1, 1,
0.7396925, -0.2805053, 1.461422, 1, 1, 1, 1, 1,
0.7451078, 0.6090417, 0.2245336, 1, 1, 1, 1, 1,
0.7454999, -0.3501978, 2.013648, 1, 1, 1, 1, 1,
0.7455149, 0.1924786, 0.9584608, 1, 1, 1, 1, 1,
0.7507315, 0.7156876, -0.4188592, 1, 1, 1, 1, 1,
0.7517427, 0.2176971, 0.5884767, 1, 1, 1, 1, 1,
0.7625458, 0.5703665, -1.170527, 1, 1, 1, 1, 1,
0.765882, -0.3315925, 3.970708, 1, 1, 1, 1, 1,
0.7668725, 0.4967234, 0.7680789, 1, 1, 1, 1, 1,
0.7695795, -0.439602, 4.61779, 1, 1, 1, 1, 1,
0.7755466, -0.2129503, 2.454457, 1, 1, 1, 1, 1,
0.7856258, 1.056415, 0.8808229, 1, 1, 1, 1, 1,
0.7878992, 2.494214, -0.3686314, 0, 0, 1, 1, 1,
0.7890329, 0.5372671, -0.3050359, 1, 0, 0, 1, 1,
0.7974496, 1.416878, 0.4145379, 1, 0, 0, 1, 1,
0.7981502, 1.520522, 0.6694568, 1, 0, 0, 1, 1,
0.7987582, -1.609552, 1.836902, 1, 0, 0, 1, 1,
0.8023625, 1.606362, -1.354519, 1, 0, 0, 1, 1,
0.802467, -0.3917095, 2.383012, 0, 0, 0, 1, 1,
0.8037177, 0.3101568, 1.670921, 0, 0, 0, 1, 1,
0.8040103, 0.1817402, 1.844638, 0, 0, 0, 1, 1,
0.8065103, 0.4008268, 1.248522, 0, 0, 0, 1, 1,
0.8075346, -1.378319, 3.085415, 0, 0, 0, 1, 1,
0.8096755, -0.3707986, 2.666554, 0, 0, 0, 1, 1,
0.8106512, -0.2386903, 2.283934, 0, 0, 0, 1, 1,
0.8149146, 0.5554149, 1.908628, 1, 1, 1, 1, 1,
0.8221859, 0.7948838, 1.922284, 1, 1, 1, 1, 1,
0.8232334, -0.7375363, 2.361747, 1, 1, 1, 1, 1,
0.8255211, -0.8520082, 4.034276, 1, 1, 1, 1, 1,
0.8274311, 0.5792807, -0.8233032, 1, 1, 1, 1, 1,
0.8307266, 0.6142552, 1.169813, 1, 1, 1, 1, 1,
0.8349684, 1.639299, 0.241785, 1, 1, 1, 1, 1,
0.8448442, 1.164146, 2.156861, 1, 1, 1, 1, 1,
0.8448575, -1.163218, 1.030937, 1, 1, 1, 1, 1,
0.8451576, 0.1176837, 1.697446, 1, 1, 1, 1, 1,
0.8500496, 0.3048749, 0.8223011, 1, 1, 1, 1, 1,
0.8551054, 0.8754672, 1.78001, 1, 1, 1, 1, 1,
0.8639362, -0.6567886, 3.120298, 1, 1, 1, 1, 1,
0.8650233, 0.193865, 2.38736, 1, 1, 1, 1, 1,
0.8679643, 0.231913, 1.57642, 1, 1, 1, 1, 1,
0.8765495, 0.1507797, 2.946915, 0, 0, 1, 1, 1,
0.8825359, 0.7902653, -0.7909555, 1, 0, 0, 1, 1,
0.8829842, 1.790508, -1.518576, 1, 0, 0, 1, 1,
0.8847048, -0.774726, 0.4390016, 1, 0, 0, 1, 1,
0.8884486, 1.186418, 0.7390242, 1, 0, 0, 1, 1,
0.8894776, -0.3519906, 0.3273946, 1, 0, 0, 1, 1,
0.9050916, -1.077337, 0.9879709, 0, 0, 0, 1, 1,
0.9079994, 0.2371859, 0.2716652, 0, 0, 0, 1, 1,
0.9170166, 0.9087641, 2.820641, 0, 0, 0, 1, 1,
0.9170383, -0.7837657, 3.416681, 0, 0, 0, 1, 1,
0.9215328, 0.4579707, 0.05864564, 0, 0, 0, 1, 1,
0.9217952, 1.301362, 0.6828752, 0, 0, 0, 1, 1,
0.9334009, 2.29074, 1.304642, 0, 0, 0, 1, 1,
0.9354061, 0.8793775, 3.661081, 1, 1, 1, 1, 1,
0.9368875, 0.4208842, 1.731973, 1, 1, 1, 1, 1,
0.9473991, -0.9286247, 1.715456, 1, 1, 1, 1, 1,
0.9489072, 1.795376, -0.4640498, 1, 1, 1, 1, 1,
0.9530905, 1.502825, 0.4888495, 1, 1, 1, 1, 1,
0.9653721, 0.2111723, 2.259603, 1, 1, 1, 1, 1,
0.9664911, 0.5315069, 1.512333, 1, 1, 1, 1, 1,
0.9677138, 0.787055, 0.6337138, 1, 1, 1, 1, 1,
0.9690232, 1.052578, 0.3922886, 1, 1, 1, 1, 1,
0.9714414, -0.487625, 1.23381, 1, 1, 1, 1, 1,
0.9745631, 1.593681, 2.810792, 1, 1, 1, 1, 1,
0.978619, 2.384757, 0.02808641, 1, 1, 1, 1, 1,
0.9787499, 0.05234571, 0.2738929, 1, 1, 1, 1, 1,
0.9851396, -0.3994721, 0.9201061, 1, 1, 1, 1, 1,
0.9860735, 1.544456, 1.091199, 1, 1, 1, 1, 1,
0.9885126, -1.834315, 2.951661, 0, 0, 1, 1, 1,
0.9895305, -0.771787, 1.582113, 1, 0, 0, 1, 1,
1.003459, 1.297207, 0.9932052, 1, 0, 0, 1, 1,
1.010879, -0.1456646, 3.107318, 1, 0, 0, 1, 1,
1.012405, -0.3169191, 1.301008, 1, 0, 0, 1, 1,
1.016753, -1.248613, 0.8872836, 1, 0, 0, 1, 1,
1.020537, 1.249576, 0.7612865, 0, 0, 0, 1, 1,
1.022195, 1.524754, 1.262055, 0, 0, 0, 1, 1,
1.031523, 0.4026287, 1.938784, 0, 0, 0, 1, 1,
1.032182, -1.504725, 3.274319, 0, 0, 0, 1, 1,
1.03607, -0.1874449, 1.624634, 0, 0, 0, 1, 1,
1.038642, -1.262036, 1.973269, 0, 0, 0, 1, 1,
1.047289, -0.5903172, 0.9217103, 0, 0, 0, 1, 1,
1.051198, 0.2264537, 0.8643565, 1, 1, 1, 1, 1,
1.051943, -0.4261515, 1.790252, 1, 1, 1, 1, 1,
1.054345, 1.120173, 0.8961801, 1, 1, 1, 1, 1,
1.054876, -0.9127135, 5.313154, 1, 1, 1, 1, 1,
1.056622, -1.564081, 3.263922, 1, 1, 1, 1, 1,
1.061908, -1.457362, 2.657522, 1, 1, 1, 1, 1,
1.089226, 0.3150329, 2.794802, 1, 1, 1, 1, 1,
1.093653, 0.8124769, -0.3015384, 1, 1, 1, 1, 1,
1.098268, -0.5824953, 1.61934, 1, 1, 1, 1, 1,
1.100822, -0.009615186, 3.491014, 1, 1, 1, 1, 1,
1.112678, 0.9520419, 2.583143, 1, 1, 1, 1, 1,
1.115785, 0.1463427, 2.292164, 1, 1, 1, 1, 1,
1.11593, -0.02344877, 3.204716, 1, 1, 1, 1, 1,
1.116075, -0.3014234, 1.301008, 1, 1, 1, 1, 1,
1.117604, -0.9980686, 0.9172581, 1, 1, 1, 1, 1,
1.118931, -0.2701485, 2.077097, 0, 0, 1, 1, 1,
1.119907, -0.4619079, 2.418898, 1, 0, 0, 1, 1,
1.12301, -0.7210661, 1.679621, 1, 0, 0, 1, 1,
1.124738, 2.945679, 0.3856363, 1, 0, 0, 1, 1,
1.130084, -0.234789, 1.774986, 1, 0, 0, 1, 1,
1.130566, -0.04995731, 0.4968586, 1, 0, 0, 1, 1,
1.140321, -0.1984573, 2.322384, 0, 0, 0, 1, 1,
1.141588, -0.3231886, 1.716131, 0, 0, 0, 1, 1,
1.147557, 0.6405976, 0.9816857, 0, 0, 0, 1, 1,
1.153906, -0.8317142, 1.872067, 0, 0, 0, 1, 1,
1.161195, -1.329977, 2.662655, 0, 0, 0, 1, 1,
1.162082, -0.5032253, 2.114407, 0, 0, 0, 1, 1,
1.170723, 1.182904, 1.172502, 0, 0, 0, 1, 1,
1.171149, 1.326509, 0.5898813, 1, 1, 1, 1, 1,
1.174016, 0.2501802, 1.773067, 1, 1, 1, 1, 1,
1.192405, 1.448295, 0.7780191, 1, 1, 1, 1, 1,
1.195658, 0.5540639, 1.301616, 1, 1, 1, 1, 1,
1.210747, -0.3785243, 2.241903, 1, 1, 1, 1, 1,
1.216105, -2.17074, 0.466246, 1, 1, 1, 1, 1,
1.232018, -0.3322357, 2.691671, 1, 1, 1, 1, 1,
1.237813, -1.188774, 0.5333929, 1, 1, 1, 1, 1,
1.242349, -1.217732, 1.751419, 1, 1, 1, 1, 1,
1.245168, 1.135773, -0.6417885, 1, 1, 1, 1, 1,
1.247699, -1.328036, 4.019969, 1, 1, 1, 1, 1,
1.254543, -0.8241455, 1.832246, 1, 1, 1, 1, 1,
1.264849, -0.2738985, 1.738444, 1, 1, 1, 1, 1,
1.269073, -0.67649, -0.6273965, 1, 1, 1, 1, 1,
1.270675, 1.192094, 1.054135, 1, 1, 1, 1, 1,
1.272938, -1.394815, 1.780385, 0, 0, 1, 1, 1,
1.295476, 1.73781, 2.52181, 1, 0, 0, 1, 1,
1.296664, 1.102482, 0.4993088, 1, 0, 0, 1, 1,
1.296845, -0.7450943, 2.593741, 1, 0, 0, 1, 1,
1.313544, -0.954406, 1.775559, 1, 0, 0, 1, 1,
1.327083, -0.6429325, 1.952465, 1, 0, 0, 1, 1,
1.327744, 1.225406, 0.1648479, 0, 0, 0, 1, 1,
1.331518, 0.6043206, 1.70063, 0, 0, 0, 1, 1,
1.33579, -0.3144068, 1.390954, 0, 0, 0, 1, 1,
1.336235, -0.7246169, 2.2988, 0, 0, 0, 1, 1,
1.344798, 0.9073039, 1.483551, 0, 0, 0, 1, 1,
1.360549, -1.476745, 2.891664, 0, 0, 0, 1, 1,
1.366292, -1.499556, 2.06332, 0, 0, 0, 1, 1,
1.366709, 0.1469738, 0.205383, 1, 1, 1, 1, 1,
1.369361, 0.3760308, 0.0945248, 1, 1, 1, 1, 1,
1.374603, 1.380802, 0.3316616, 1, 1, 1, 1, 1,
1.38009, -0.5705038, 0.8056382, 1, 1, 1, 1, 1,
1.384752, -0.5051888, 3.264468, 1, 1, 1, 1, 1,
1.39987, 1.754077, 0.7911823, 1, 1, 1, 1, 1,
1.407633, -0.07802822, 2.779041, 1, 1, 1, 1, 1,
1.407797, -0.9024097, 3.00459, 1, 1, 1, 1, 1,
1.409158, -1.000651, 1.996019, 1, 1, 1, 1, 1,
1.416245, 0.6382623, 2.987967, 1, 1, 1, 1, 1,
1.433584, 0.5586016, 1.576402, 1, 1, 1, 1, 1,
1.445486, -0.5851635, 1.278673, 1, 1, 1, 1, 1,
1.452864, -0.6667361, 2.176158, 1, 1, 1, 1, 1,
1.455098, 0.5011049, -0.9303836, 1, 1, 1, 1, 1,
1.456809, -0.04799683, 1.275329, 1, 1, 1, 1, 1,
1.464489, 1.325836, 1.555336, 0, 0, 1, 1, 1,
1.468078, -0.4380557, 2.150166, 1, 0, 0, 1, 1,
1.489329, 0.3087167, 1.565875, 1, 0, 0, 1, 1,
1.490231, 0.4548311, 2.788319, 1, 0, 0, 1, 1,
1.491105, -0.0244352, 0.2890771, 1, 0, 0, 1, 1,
1.504051, -0.3138089, 2.1989, 1, 0, 0, 1, 1,
1.511808, 1.161222, 1.168039, 0, 0, 0, 1, 1,
1.515234, 0.09549794, 2.36456, 0, 0, 0, 1, 1,
1.515254, 0.2997241, 0.6969677, 0, 0, 0, 1, 1,
1.516344, 1.060146, -0.3735073, 0, 0, 0, 1, 1,
1.518454, -1.040682, 3.197718, 0, 0, 0, 1, 1,
1.519796, 0.8324409, 2.190822, 0, 0, 0, 1, 1,
1.523475, 0.8965934, 3.028425, 0, 0, 0, 1, 1,
1.535192, -0.6168976, 2.6947, 1, 1, 1, 1, 1,
1.545996, -0.290278, 3.671311, 1, 1, 1, 1, 1,
1.548969, -0.3245152, 0.8875193, 1, 1, 1, 1, 1,
1.554746, 1.262216, 0.4317913, 1, 1, 1, 1, 1,
1.562984, 1.978085, 0.9195779, 1, 1, 1, 1, 1,
1.564474, -0.1413207, 0.8940325, 1, 1, 1, 1, 1,
1.56729, 0.4443812, 0.3025425, 1, 1, 1, 1, 1,
1.582477, 0.2138489, 0.1767021, 1, 1, 1, 1, 1,
1.583686, -0.4904838, 2.757601, 1, 1, 1, 1, 1,
1.58569, -0.2052983, 1.417655, 1, 1, 1, 1, 1,
1.598377, -0.5198208, 1.920308, 1, 1, 1, 1, 1,
1.607333, 1.719143, 0.9537007, 1, 1, 1, 1, 1,
1.665621, 0.1145091, 2.423934, 1, 1, 1, 1, 1,
1.67255, -0.3287663, 2.187355, 1, 1, 1, 1, 1,
1.673605, -1.707217, 2.910774, 1, 1, 1, 1, 1,
1.677196, 0.7373161, 1.254541, 0, 0, 1, 1, 1,
1.680376, -0.5504489, 2.052375, 1, 0, 0, 1, 1,
1.68502, 1.952772, -1.916577, 1, 0, 0, 1, 1,
1.687201, -0.04385357, 1.505734, 1, 0, 0, 1, 1,
1.688132, -1.064517, 1.016276, 1, 0, 0, 1, 1,
1.695222, -0.158204, 1.450065, 1, 0, 0, 1, 1,
1.716297, 0.1672503, -0.08625486, 0, 0, 0, 1, 1,
1.755159, 0.7105233, -0.2454491, 0, 0, 0, 1, 1,
1.755173, -1.126767, -0.5710185, 0, 0, 0, 1, 1,
1.762303, -0.3771592, 0.3675781, 0, 0, 0, 1, 1,
1.769845, 0.3826274, 0.5189544, 0, 0, 0, 1, 1,
1.783382, -1.081537, 1.686331, 0, 0, 0, 1, 1,
1.797074, 0.7650625, 1.083159, 0, 0, 0, 1, 1,
1.799964, -0.3728344, 0.7898428, 1, 1, 1, 1, 1,
1.802049, 0.2085108, 1.763721, 1, 1, 1, 1, 1,
1.837504, 2.731379, -0.1655308, 1, 1, 1, 1, 1,
1.855582, -1.524927, 2.210207, 1, 1, 1, 1, 1,
1.865512, 0.813197, 0.03871988, 1, 1, 1, 1, 1,
1.877181, 0.02096917, 1.135163, 1, 1, 1, 1, 1,
1.919822, -0.1863701, 2.947251, 1, 1, 1, 1, 1,
1.929114, 1.201269, 1.540317, 1, 1, 1, 1, 1,
1.930271, -1.321543, 1.494582, 1, 1, 1, 1, 1,
1.935233, -0.7856168, 0.657613, 1, 1, 1, 1, 1,
1.943259, -0.4463912, 0.4600529, 1, 1, 1, 1, 1,
1.943274, -0.0732473, 2.815972, 1, 1, 1, 1, 1,
2.003448, -1.00385, 0.702291, 1, 1, 1, 1, 1,
2.003716, 0.01575029, 3.040179, 1, 1, 1, 1, 1,
2.008713, -2.427782, 2.167283, 1, 1, 1, 1, 1,
2.008888, 0.1105531, 1.857448, 0, 0, 1, 1, 1,
2.053797, 0.5063506, 1.882389, 1, 0, 0, 1, 1,
2.06484, 0.1591814, 1.5062, 1, 0, 0, 1, 1,
2.071217, 0.8418571, -0.2662792, 1, 0, 0, 1, 1,
2.088332, -2.011267, 3.996491, 1, 0, 0, 1, 1,
2.111202, -1.135532, 3.255596, 1, 0, 0, 1, 1,
2.185415, 1.142649, 1.154508, 0, 0, 0, 1, 1,
2.263715, 0.381778, 1.325326, 0, 0, 0, 1, 1,
2.275709, 0.8065926, -0.7162734, 0, 0, 0, 1, 1,
2.300601, 0.3080578, 2.175791, 0, 0, 0, 1, 1,
2.322062, -1.502624, 1.278607, 0, 0, 0, 1, 1,
2.370845, -0.2617807, 2.381216, 0, 0, 0, 1, 1,
2.534435, 0.759056, -0.5102797, 0, 0, 0, 1, 1,
2.5387, 0.7316059, 0.103885, 1, 1, 1, 1, 1,
2.56089, 1.397507, 1.448749, 1, 1, 1, 1, 1,
2.652496, 1.572497, 1.474788, 1, 1, 1, 1, 1,
2.654291, -1.428407, 3.01942, 1, 1, 1, 1, 1,
2.81846, -0.8819442, 2.340434, 1, 1, 1, 1, 1,
2.869988, 0.785488, 1.033407, 1, 1, 1, 1, 1,
2.948418, 0.2415944, 2.296708, 1, 1, 1, 1, 1
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
var radius = 9.175726;
var distance = 32.22935;
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
mvMatrix.translate( 0.1383348, -0.1331023, -0.1208625 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.22935);
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
